-- AutoContracts: Tự động kiểm tra và nhận thưởng Hợp đồng (Contracts) cho Slop Tower Defense
-- Remotes sử dụng: ReplicatedStorage.Remotes.Misc.Contracts:InvokeServer("Get") và ("Claim", index)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")
local logger = require("@routes/SlopTowerDefense/core/system/logger")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")
local playerProfile = require("./playerProfile")
local gameStats = require("./gameStats")
local zoneGuard = require("./zoneGuard")

export type ContractItem = {
	Index: number,
	Kind: string,
	Tower: string,
	Progress: number,
	Need: number,
	Claimed: boolean,
	IsCompleted: boolean,
}

export type ContractsSnapshot = {
	List: { ContractItem },
	Period: number,
	Rerolled: boolean,
	EligibleCount: number,
	ClaimedCountSession: number,
	LastChecked: number,
}

local autoContracts = {
	Enabled = false,
	CheckInterval = 20,
	ClaimCountSession = 0,
	Contracts = {} :: { ContractItem },
	Period = 0,
	Rerolled = false,
	LastChecked = 0,
}

local activeThread: thread? = nil
local contractsRemote: RemoteFunction? = nil
local subscribers: { (ContractsSnapshot) -> () } = {}
local isChecking = false
local wasMatchActive = false

-- Tìm RemoteFunction Contracts chính xác trong ReplicatedStorage.Remotes.Misc.Contracts
local function getContractsRemote(): RemoteFunction?
	if contractsRemote and contractsRemote.Parent then
		return contractsRemote
	end

	local remotesFolder = ReplicatedStorage:FindFirstChild("Remotes")
	local miscFolder = remotesFolder and remotesFolder:FindFirstChild("Misc")
	if miscFolder then
		local r = miscFolder:FindFirstChild("Contracts")
		if r and (r:IsA("RemoteFunction") or type((r :: any).InvokeServer) == "function") then
			contractsRemote = r :: RemoteFunction
			return contractsRemote
		end
	end

	-- Fallback tìm đệ quy trong toàn bộ ReplicatedStorage
	local fallback = ReplicatedStorage:FindFirstChild("Contracts", true)
	if fallback and (fallback:IsA("RemoteFunction") or type((fallback :: any).InvokeServer) == "function") then
		contractsRemote = fallback :: RemoteFunction
		return fallback :: RemoteFunction
	end

	return nil
end

-- Chuyển đổi dữ liệu thô từ server sang danh sách ContractItem chuẩn hóa
local function parseContractsData(raw: any): ({ ContractItem }, number?, boolean?)
	if type(raw) ~= "table" then
		return {}, nil, nil
	end

	local period = tonumber(raw.Period)
	local rerolled = raw.Rerolled == true

	local rawList: { any }? = nil
	if type(raw.List) == "table" then
		rawList = raw.List
	elseif type(raw.Contracts) == "table" then
		if type(raw.Contracts.List) == "table" then
			rawList = raw.Contracts.List
			period = period or tonumber(raw.Contracts.Period)
			if rerolled == nil and raw.Contracts.Rerolled ~= nil then
				rerolled = raw.Contracts.Rerolled == true
			end
		else
			rawList = raw.Contracts
		end
	elseif raw[1] and type(raw[1]) == "table" then
		rawList = raw
	end

	if not rawList then
		return {}, period, rerolled
	end

	local parsed: { ContractItem } = {}
	if rawList[1] ~= nil then
		for indexNum, item in ipairs(rawList) do
			if type(item) == "table" then
				local progress = tonumber(item.Progress) or 0
				local need = tonumber(item.Need) or 0
				local claimed = (item.Claimed == true)
				local kind = tostring(item.Kind or "Unknown")
				local tower = tostring(item.Tower or "Unknown")
				local isCompleted = (not claimed) and (need > 0) and (progress >= need)

				table.insert(parsed, {
					Index = indexNum,
					Kind = kind,
					Tower = tower,
					Progress = progress,
					Need = need,
					Claimed = claimed,
					IsCompleted = isCompleted,
				})
			end
		end
	else
		for idx, item in pairs(rawList) do
			local indexNum = tonumber(idx) or (#parsed + 1)
			if type(item) == "table" then
				local progress = tonumber(item.Progress) or 0
				local need = tonumber(item.Need) or 0
				local claimed = (item.Claimed == true)
				local kind = tostring(item.Kind or "Unknown")
				local tower = tostring(item.Tower or "Unknown")
				local isCompleted = (not claimed) and (need > 0) and (progress >= need)

				table.insert(parsed, {
					Index = indexNum,
					Kind = kind,
					Tower = tower,
					Progress = progress,
					Need = need,
					Claimed = claimed,
					IsCompleted = isCompleted,
				})
			end
		end
	end

	table.sort(parsed, function(a, b)
		return a.Index < b.Index
	end)

	return parsed, period, rerolled
end

-- Lấy snapshot dữ liệu hợp đồng hiện tại
function autoContracts.GetSnapshot(): ContractsSnapshot
	local eligible = 0
	for _, item in ipairs(autoContracts.Contracts) do
		if item.IsCompleted then
			eligible += 1
		end
	end

	return {
		List = table.clone(autoContracts.Contracts),
		Period = autoContracts.Period,
		Rerolled = autoContracts.Rerolled,
		EligibleCount = eligible,
		ClaimedCountSession = autoContracts.ClaimCountSession,
		LastChecked = autoContracts.LastChecked,
	}
end

-- Thông báo cho các UI subscribers khi dữ liệu thay đổi
local function notifySubscribers()
	local snapshot = autoContracts.GetSnapshot()
	for _, sub in ipairs(subscribers) do
		pcall(sub, snapshot)
	end
end

local lastRemoteInvokeTime = 0
local REMOTE_COOLDOWN = 1.2 -- Giãn cách tối thiểu giữa các lệnh gọi Remotes.Misc.Contracts

-- Hàm gọi RemoteFunction Contracts an toàn, kiểm soát tốc độ gọi tránh bị 'Slow down'
local function invokeContractsSafe(action: string, ...): (boolean, any)
	local remote = getContractsRemote()
	if not remote then
		return false, "No remote found"
	end

	local elapsed = os.clock() - lastRemoteInvokeTime
	if elapsed < REMOTE_COOLDOWN then
		task.wait(REMOTE_COOLDOWN - elapsed)
	end

	lastRemoteInvokeTime = os.clock()
	local ok, res = pcall(function(...)
		return remote:InvokeServer(action, ...)
	end, ...)

	-- Cơ chế chống throttle tự động: Nếu server vẫn báo 'Slow down', chờ 1.5s và thử lại 1 lần
	if ok and type(res) == "table" and res.message == "Slow down" then
		print(string.format("[Auto Contracts] Server báo 'Slow down' khi gọi '%s', đang giãn cách 1.5s rồi thử lại...", action))
		task.wait(1.5)
		lastRemoteInvokeTime = os.clock()
		ok, res = pcall(function(...)
			return remote:InvokeServer(action, ...)
		end, ...)
	end

	return ok, res
end

-- Lấy danh sách hợp đồng mới nhất từ RemoteFunction "Get" hoặc fallback từ PlayerProfile
function autoContracts.FetchContracts(): { ContractItem }
	local rawData = nil
	local ok, res = invokeContractsSafe("Get")
	if ok then
		if type(res) == "table" then
			rawData = res
		end
	else
		warn("[Auto Contracts] Lỗi gọi Remote Contracts:Get:", tostring(res))
	end

	-- Nếu Get không trả về table chứa danh sách trực tiếp, fallback sang PlayerProfile
	if not rawData or (type(rawData) == "table" and not rawData.List and not rawData[1]) then
		local profileData = playerProfile.GetData()
		if profileData and profileData.RawData and profileData.RawData.Contracts then
			rawData = profileData.RawData.Contracts
		end
	end

	local list, period, rerolled = parseContractsData(rawData)
	if #list > 0 then
		autoContracts.Contracts = list
		if period then autoContracts.Period = period end
		if rerolled ~= nil then autoContracts.Rerolled = rerolled end
	end
	autoContracts.LastChecked = os.clock()

	notifySubscribers()
	return autoContracts.Contracts
end

-- Kiểm tra và nhận các hợp đồng đã hoàn thành (Chỉ hoạt động ở Lobby)
function autoContracts.CheckAndClaim(): (number, number)
	if isChecking or not zoneGuard.IsLobby() then
		return 0, 0
	end

	local remote = getContractsRemote()
	if not remote then
		warn("[Auto Contracts] Không tìm thấy RemoteFunction: Remotes.Misc.Contracts")
		return 0, 0
	end

	isChecking = true
	local claimedCount = 0
	local eligibleCount = 0

	-- 1. Đồng bộ dữ liệu hợp đồng mới nhất
	autoContracts.FetchContracts()

	-- 2. Đếm số hợp đồng hoàn thành hợp lệ
	for _, item in ipairs(autoContracts.Contracts) do
		if item.IsCompleted then
			eligibleCount += 1
		end
	end

	print(string.format("[Auto Contracts] Kiểm tra: %d hợp đồng nạp được, %d đủ điều kiện nhận.",
		#autoContracts.Contracts, eligibleCount))

	-- 3. Nhận từng hợp đồng hoàn thành
	if eligibleCount > 0 then
		for _, item in ipairs(autoContracts.Contracts) do
			if item.IsCompleted and not item.Claimed then
				print(string.format("[Auto Contracts] Gửi Claim hợp đồng #%d: [%s] %s (%d/%d)...",
					item.Index, item.Kind, item.Tower, item.Progress, item.Need))

				local claimOk, claimRes = invokeContractsSafe("Claim", item.Index)

				local resStr = tostring(claimRes)
				if type(claimRes) == "table" then
					local encOk, encStr = pcall(function()
						return HttpService:JSONEncode(claimRes)
					end)
					if encOk then resStr = encStr end
				end

				print(string.format("[Auto Contracts] Kết quả Claim #%d: ok=%s, res=%s",
					item.Index, tostring(claimOk), resStr))

				local isSuccess = false
				if claimOk then
					if type(claimRes) == "table" then
						if claimRes.success ~= nil then
							isSuccess = (claimRes.success == true)
						elseif claimRes.Success ~= nil then
							isSuccess = (claimRes.Success == true)
						else
							isSuccess = true
						end
					elseif claimRes == true then
						isSuccess = true
					end
				end

				if isSuccess then
					claimedCount += 1
					item.Claimed = true
					item.IsCompleted = false
					autoContracts.ClaimCountSession += 1

					notifier.Notify("Contracts Claimed", string.format("Claimed [%s] %s (#%d)!",
						item.Kind, item.Tower, item.Index), 3)
				else
					local errReason = (type(claimRes) == "table" and (claimRes.error or claimRes.message or claimRes.reason)) or resStr
					warn(string.format("[Auto Contracts] Nhận thất bại hợp đồng #%d: %s",
						item.Index, tostring(errReason)))
					notifier.Notify("Claim Failed", string.format("Contract #%d: %s",
						item.Index, tostring(errReason)), 3)
				end

				task.wait(0.3) -- Delay an toàn tránh spam remote
			end
		end

		if claimedCount > 0 then
			notifySubscribers()
			task.spawn(function()
				task.wait(1.5)
				autoContracts.FetchContracts()
				playerProfile.Fetch(true)
			end)
		end
	end

	isChecking = false
	return claimedCount, eligibleCount
end

-- Vòng lặp chạy nền định kỳ
local function runLoop()
	while autoContracts.Enabled and lifecycle.IsActive() do
		local now = os.clock()
		if zoneGuard.IsLobby() and (now - autoContracts.LastChecked >= autoContracts.CheckInterval) then
			autoContracts.CheckAndClaim()
		end
		task.wait(1.0)
	end
	activeThread = nil
end

function autoContracts.SetEnabled(state: boolean)
	if autoContracts.Enabled == state then return end
	autoContracts.Enabled = (state == true)

	if autoContracts.Enabled then
		if not activeThread then
			activeThread = task.spawn(runLoop)
		end
		notifier.Notify("Auto Contracts", "Auto Claim Contracts enabled.", 2)

		-- Chạy kiểm tra ngay khi vừa bật (nếu đang ở Lobby)
		task.spawn(function()
			task.wait(0.5)
			if autoContracts.Enabled and lifecycle.IsActive() and zoneGuard.IsLobby() then
				autoContracts.CheckAndClaim()
			end
		end)
	else
		activeThread = nil
		notifier.Notify("Auto Contracts", "Auto Claim Contracts disabled.", 2)
	end
end

function autoContracts.IsEnabled(): boolean
	return autoContracts.Enabled
end

function autoContracts.SetInterval(sec: number)
	autoContracts.CheckInterval = math.clamp(tonumber(sec) or 20, 5, 120)
end

function autoContracts.GetInterval(): number
	return autoContracts.CheckInterval
end

-- Đăng ký nhận cập nhật trạng thái hợp đồng (cho UI)
function autoContracts.Subscribe(callback: (ContractsSnapshot) -> ()): () -> ()
	table.insert(subscribers, callback)
	task.spawn(callback, autoContracts.GetSnapshot())

	return function()
		local idx = table.find(subscribers, callback)
		if idx then
			table.remove(subscribers, idx)
		end
	end
end

-- Lắng nghe PlayerProfile để tự động cập nhật hợp đồng khi có dữ liệu mới
local unsubProfile = playerProfile.Subscribe(function(profileData: playerProfile.PlayerProfileData)
	if profileData.Loaded and profileData.RawData and profileData.RawData.Contracts then
		local list, period, rerolled = parseContractsData(profileData.RawData.Contracts)
		if #list > 0 then
			autoContracts.Contracts = list
			if period then autoContracts.Period = period end
			if rerolled ~= nil then autoContracts.Rerolled = rerolled end
			notifySubscribers()
		end
	end
end)
lifecycle.Register(unsubProfile)

-- Lắng nghe GameStats để tự động kiểm tra nhận thưởng khi kết thúc trận
local unsubStats = gameStats.Subscribe(function(snapshot: gameStats.GameStatsSnapshot)
	if autoContracts.Enabled and wasMatchActive and not snapshot.IsMatchActive then
		task.spawn(function()
			task.wait(1.5)
			if autoContracts.Enabled and lifecycle.IsActive() then
				autoContracts.CheckAndClaim()
			end
		end)
	end
	wasMatchActive = snapshot.IsMatchActive
end)
lifecycle.Register(unsubStats)

-- Khởi tạo ban đầu: nạp dữ liệu hợp đồng lần đầu
task.spawn(function()
	task.wait(1.5)
	if lifecycle.IsActive() then
		autoContracts.FetchContracts()
	end
end)

-- Tự động dọn dẹp khi reload script
lifecycle.Register(function()
	autoContracts.Enabled = false
	activeThread = nil
	table.clear(subscribers)
end)

return autoContracts
