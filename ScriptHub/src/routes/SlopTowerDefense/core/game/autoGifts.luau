-- AutoGifts: Tự động kiểm tra và nhận thưởng Quà Thời Gian Chơi (Playtime Gifts / Rewards) cho Slop Tower Defense
-- Bao gồm 9 mốc quà thời gian (từ 5 phút đến 180 phút)
-- Remotes sử dụng:
--   ReplicatedStorage.GiftFolder.GetData (RemoteFunction) -> Trả về base playtime (giây)
--   ReplicatedStorage.GiftFolder.ClaimGift (RemoteFunction) -> Nhận quà số 1..9 (trả về true nếu thành công)
--   ReplicatedStorage.GiftFolder.GiftsReset (RemoteEvent) -> Server báo reset mốc quà
-- Data client:
--   LocalPlayer.ClaimedGifts -> Folder chứa các child có tên "1".."9" khi đã nhận
--   LocalPlayer.CurrentSession -> IntValue/NumberValue đếm số giây chơi phiên hiện tại

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")
local gameStats = require("./gameStats")
local zoneGuard = require("./zoneGuard")

export type GiftReward = {
	Currency: string,
	Amount: number,
	Type: string?,
}

export type GiftItem = {
	GiftNumber: number,
	Time: number,
	Reward: GiftReward,
	IsClaimed: boolean,
	IsReady: boolean,
	RemainingSeconds: number,
}

export type GiftsSnapshot = {
	Playtime: number,
	FormattedPlaytime: string,
	ClaimedCount: number,
	TotalGifts: number,
	ReadyCount: number,
	NextGiftNumber: number?,
	NextGiftRemaining: number?,
	NextGiftFormatted: string?,
	Gifts: { [number]: GiftItem },
	ClaimedCountSession: number,
	LastChecked: number,
}

local DEFAULT_GIFT_DATA = {
	{ GiftNumber = 1, Time = 300,   Reward = { Currency = "Cash", Amount = 300 } },
	{ GiftNumber = 2, Time = 600,   Reward = { Currency = "Slopbux", Amount = 3 } },
	{ GiftNumber = 3, Time = 900,   Reward = { Currency = "Crate", Type = "Steampunk Crate", Amount = 1 } },
	{ GiftNumber = 4, Time = 1500,  Reward = { Currency = "Cash", Amount = 900 } },
	{ GiftNumber = 5, Time = 2100,  Reward = { Currency = "Slopbux", Amount = 5 } },
	{ GiftNumber = 6, Time = 2700,  Reward = { Currency = "Crate", Type = "Steampunk Crate", Amount = 3 } },
	{ GiftNumber = 7, Time = 3600,  Reward = { Currency = "Cash", Amount = 3000 } },
	{ GiftNumber = 8, Time = 7200,  Reward = { Currency = "Slopbux", Amount = 10 } },
	{ GiftNumber = 9, Time = 10800, Reward = { Currency = "Crate", Type = "Steampunk Crate", Amount = 10 } },
}

local autoGifts = {
	Enabled = false,
	CheckInterval = 15,
	ClaimCountSession = 0,
	LastChecked = 0,
}

local activeThread: thread? = nil
local basePlaytime = 0
local subscribers: { (GiftsSnapshot) -> () } = {}
local isChecking = false
local wasMatchActive = false
local giftDataList = DEFAULT_GIFT_DATA

-- Helper: Format giây thành HH:MM:SS hoặc MM:SS
local function formatSeconds(sec: number): string
	local s = math.max(0, math.floor(sec))
	local hrs = math.floor(s / 3600)
	local mins = math.floor((s % 3600) / 60)
	local remSecs = s % 60
	if hrs > 0 then
		return string.format("%02d:%02d:%02d", hrs, mins, remSecs)
	else
		return string.format("%02d:%02d", mins, remSecs)
	end
end

-- Lấy GiftFolder an toàn
local function getGiftFolder(): Instance?
	return ReplicatedStorage:FindFirstChild("GiftFolder")
end

-- Lấy RemoteFunction ClaimGift
local function getClaimRemote(): RemoteFunction?
	local folder = getGiftFolder()
	if folder then
		local remote = folder:FindFirstChild("ClaimGift")
		if remote and remote:IsA("RemoteFunction") then
			return remote
		end
	end
	return nil
end

-- Lấy RemoteFunction GetData
local function getGetDataRemote(): RemoteFunction?
	local folder = getGiftFolder()
	if folder then
		local remote = folder:FindFirstChild("GetData")
		if remote and remote:IsA("RemoteFunction") then
			return remote
		end
	end
	return nil
end

-- Cập nhật base playtime từ GetData remote
local function fetchBasePlaytime()
	local remote = getGetDataRemote()
	if remote then
		local ok, result = pcall(function()
			return remote:InvokeServer()
		end)
		if ok and type(result) == "number" then
			basePlaytime = result
		end
	end
end

-- Load SharedGiftData từ GiftFolder nếu có
local function loadSharedGiftData()
	local folder = getGiftFolder()
	if folder then
		local sharedModule = folder:FindFirstChild("SharedGiftData")
		if sharedModule and sharedModule:IsA("ModuleScript") then
			local ok, data = pcall(function()
				return require(sharedModule)
			end)
			if ok and type(data) == "table" and #data > 0 then
				giftDataList = data
			end
		end
	end
end

-- Lấy tổng thời gian chơi hiện tại (base + CurrentSession.Value)
function autoGifts.GetPlaytime(): number
	local sessionVal = 0
	local currentSession = LocalPlayer:FindFirstChild("CurrentSession")
	if currentSession and (currentSession:IsA("IntValue") or currentSession:IsA("NumberValue")) then
		sessionVal = currentSession.Value
	end
	return basePlaytime + sessionVal
end

-- Kiểm tra xem mốc quà đã nhận hay chưa
function autoGifts.IsGiftClaimed(giftNumber: number): boolean
	local claimedFolder = LocalPlayer:FindFirstChild("ClaimedGifts")
	if claimedFolder then
		return claimedFolder:FindFirstChild(tostring(giftNumber)) ~= nil
	end
	return false
end

-- Click nút GUI trong PlayerGui.Main.Gifts.List (nếu có)
local function clickGuiGiftButton(giftNumber: number)
	local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
	if not playerGui then return end
	local mainGui = playerGui:FindFirstChild("Main")
	if not mainGui then return end
	local giftsFrame = mainGui:FindFirstChild("Gifts")
	if not giftsFrame then return end
	local list = giftsFrame:FindFirstChild("List")
	if not list then return end
	local itemFrame = list:FindFirstChild(tostring(giftNumber))
	if not itemFrame then return end
	local button = itemFrame:FindFirstChild("Button")
	if not button or not button:IsA("GuiButton") then return end

	pcall(function()
		local gc = (getconnections or (syn and syn.getconnections) or (getgenv and getgenv().getconnections))
		if gc then
			for _, conn in ipairs(gc(button.MouseButton1Click)) do
				if conn.Fire then conn:Fire() elseif conn.fire then conn:fire() end
			end
			for _, conn in ipairs(gc(button.Activated)) do
				if conn.Fire then conn:Fire() elseif conn.fire then conn:fire() end
			end
		end
	end)

	pcall(function()
		local fs = (firesignal or (syn and syn.firesignal) or (getgenv and getgenv().firesignal))
		if fs then
			fs(button.MouseButton1Click)
			fs(button.Activated)
		end
	end)
end

-- Định dạng mô tả phần thưởng
local function formatRewardText(reward: GiftReward?): string
	if not reward then return "Reward" end
	if reward.Currency == "Crate" then
		local crateType = reward.Type or "Crate"
		return string.format("%s x%d", crateType, reward.Amount or 1)
	else
		return string.format("%s %s", tostring(reward.Amount or 0), reward.Currency or "")
	end
end

-- Lấy snapshot dữ liệu quà tặng
function autoGifts.GetSnapshot(): GiftsSnapshot
	local playtime = autoGifts.GetPlaytime()
	local claimedCount = 0
	local readyCount = 0
	local nextGiftNum: number? = nil
	local nextGiftRemaining: number? = nil
	local giftsTable: { [number]: GiftItem } = {}

	for _, giftDef in ipairs(giftDataList) do
		local num = giftDef.GiftNumber
		local reqTime = giftDef.Time
		local claimed = autoGifts.IsGiftClaimed(num)
		local remaining = math.max(0, reqTime - playtime)
		local ready = not claimed and (remaining <= 0)

		if claimed then
			claimedCount += 1
		elseif ready then
			readyCount += 1
		end

		if not claimed and nextGiftNum == nil then
			nextGiftNum = num
			nextGiftRemaining = remaining
		end

		giftsTable[num] = {
			GiftNumber = num,
			Time = reqTime,
			Reward = giftDef.Reward,
			IsClaimed = claimed,
			IsReady = ready,
			RemainingSeconds = remaining,
		}
	end

	local nextFormatted: string? = nil
	if nextGiftRemaining ~= nil then
		nextFormatted = formatSeconds(nextGiftRemaining)
	end

	return {
		Playtime = playtime,
		FormattedPlaytime = formatSeconds(playtime),
		ClaimedCount = claimedCount,
		TotalGifts = #giftDataList,
		ReadyCount = readyCount,
		NextGiftNumber = nextGiftNum,
		NextGiftRemaining = nextGiftRemaining,
		NextGiftFormatted = nextFormatted,
		Gifts = giftsTable,
		ClaimedCountSession = autoGifts.ClaimCountSession,
		LastChecked = autoGifts.LastChecked,
	}
end

-- Thông báo cho UI subscribers
local function notifySubscribers()
	local snapshot = autoGifts.GetSnapshot()
	for _, sub in ipairs(subscribers) do
		pcall(sub, snapshot)
	end
end

-- Quét và nhận tất cả mốc quà đã đạt điều kiện thời gian (Chỉ hoạt động ở Lobby)
function autoGifts.CheckAndClaim(): (number, number)
	if isChecking or not zoneGuard.IsLobby() then
		return 0, 0
	end

	local claimRemote = getClaimRemote()
	if not claimRemote then
		return 0, 0
	end

	isChecking = true
	local playtime = autoGifts.GetPlaytime()
	local claimedCount = 0
	local eligibleCount = 0

	for _, giftDef in ipairs(giftDataList) do
		local num = giftDef.GiftNumber
		local reqTime = giftDef.Time
		local claimed = autoGifts.IsGiftClaimed(num)

		if not claimed and playtime >= reqTime then
			eligibleCount += 1
			local rewardDesc = formatRewardText(giftDef.Reward)
			print(string.format("[Auto Gifts] Quà #%d (%s) đủ điều kiện -> Đang nhận...", num, rewardDesc))

			local success, result = pcall(function()
				return claimRemote:InvokeServer(num)
			end)

			-- Dual-trigger click GUI button nếu có
			clickGuiGiftButton(num)

			if success and result == true then
				claimedCount += 1
				autoGifts.ClaimCountSession += 1
				notifier.Notify("Playtime Gift", string.format("Claimed Gift #%d (%s)!", num, rewardDesc), 3)
				print(string.format("[Auto Gifts] Nhận thành công Quà #%d: %s", num, rewardDesc))
			elseif not success then
				print(string.format("[Auto Gifts] Lỗi khi nhận Quà #%d: %s", num, tostring(result)))
			end

			task.wait(0.4)
		end
	end

	autoGifts.LastChecked = os.clock()
	notifySubscribers()

	isChecking = false
	return claimedCount, eligibleCount
end

-- Vòng lặp chạy nền định kỳ
local function runLoop()
	while autoGifts.Enabled and lifecycle.IsActive() do
		local now = os.clock()
		if zoneGuard.IsLobby() and (now - autoGifts.LastChecked >= autoGifts.CheckInterval) then
			autoGifts.CheckAndClaim()
		end
		task.wait(1.0)
	end
	activeThread = nil
end

function autoGifts.SetEnabled(state: boolean)
	if autoGifts.Enabled == state then return end
	autoGifts.Enabled = (state == true)

	if autoGifts.Enabled then
		if not activeThread then
			activeThread = task.spawn(runLoop)
		end
		notifier.Notify("Playtime Gifts", "Auto Claim Playtime Gifts enabled.", 2)

		task.spawn(function()
			task.wait(0.5)
			if autoGifts.Enabled and lifecycle.IsActive() and zoneGuard.IsLobby() then
				autoGifts.CheckAndClaim()
			end
		end)
	else
		activeThread = nil
		notifier.Notify("Playtime Gifts", "Auto Claim Playtime Gifts disabled.", 2)
	end
end

function autoGifts.IsEnabled(): boolean
	return autoGifts.Enabled
end

function autoGifts.SetInterval(sec: number)
	autoGifts.CheckInterval = math.clamp(tonumber(sec) or 15, 5, 120)
end

function autoGifts.GetInterval(): number
	return autoGifts.CheckInterval
end

function autoGifts.Subscribe(callback: (GiftsSnapshot) -> ()): () -> ()
	table.insert(subscribers, callback)
	task.spawn(callback, autoGifts.GetSnapshot())

	return function()
		local idx = table.find(subscribers, callback)
		if idx then
			table.remove(subscribers, idx)
		end
	end
end

-- Lắng nghe CurrentSession thay đổi giá trị để cập nhật snapshot realtime
local function hookCurrentSession()
	local currentSession = LocalPlayer:FindFirstChild("CurrentSession")
	if currentSession and (currentSession:IsA("IntValue") or currentSession:IsA("NumberValue")) then
		local conn = currentSession:GetPropertyChangedSignal("Value"):Connect(function()
			notifySubscribers()
		end)
		lifecycle.Register(function()
			pcall(function() conn:Disconnect() end)
		end)
	end
end

-- Lắng nghe ClaimedGifts có item mới
local function hookClaimedGifts()
	local claimedFolder = LocalPlayer:FindFirstChild("ClaimedGifts")
	if claimedFolder then
		local cAdd = claimedFolder.ChildAdded:Connect(function()
			notifySubscribers()
		end)
		local cRem = claimedFolder.ChildRemoved:Connect(function()
			notifySubscribers()
		end)
		lifecycle.Register(function()
			pcall(function() cAdd:Disconnect() end)
			pcall(function() cRem:Disconnect() end)
		end)
	else
		local cHook = LocalPlayer.ChildAdded:Connect(function(child)
			if child.Name == "ClaimedGifts" then
				hookClaimedGifts()
				notifySubscribers()
			elseif child.Name == "CurrentSession" then
				hookCurrentSession()
				notifySubscribers()
			end
		end)
		lifecycle.Register(function()
			pcall(function() cHook:Disconnect() end)
		end)
	end
end

-- Lắng nghe server reset quà tặng
local function hookGiftsReset()
	local folder = getGiftFolder()
	if folder then
		local giftsReset = folder:FindFirstChild("GiftsReset")
		if giftsReset and giftsReset:IsA("RemoteEvent") then
			local conn = giftsReset.OnClientEvent:Connect(function()
				print("[Auto Gifts] Server GiftsReset đã kích hoạt -> Cập nhật lại thời gian & trạng thái quà...")
				task.wait(0.5)
				fetchBasePlaytime()
				notifySubscribers()
				if autoGifts.Enabled then
					autoGifts.CheckAndClaim()
				end
			end)
			lifecycle.Register(function()
				pcall(function() conn:Disconnect() end)
			end)
		end
	end
end

-- Lắng nghe GameStats để tự động nhận quà khi kết thúc trận
local unsubStats = gameStats.Subscribe(function(snapshot: gameStats.GameStatsSnapshot)
	if autoGifts.Enabled and wasMatchActive and not snapshot.IsMatchActive then
		task.spawn(function()
			task.wait(1.5)
			if autoGifts.Enabled and lifecycle.IsActive() then
				autoGifts.CheckAndClaim()
			end
		end)
	end
	wasMatchActive = snapshot.IsMatchActive
end)
lifecycle.Register(unsubStats)

-- Khởi tạo ban đầu
task.spawn(function()
	loadSharedGiftData()
	fetchBasePlaytime()
	hookCurrentSession()
	hookClaimedGifts()
	hookGiftsReset()

	task.wait(1.0)
	if lifecycle.IsActive() then
		notifySubscribers()
	end
end)

-- Dọn dẹp khi reload script
lifecycle.Register(function()
	autoGifts.Enabled = false
	activeThread = nil
	table.clear(subscribers)
end)

return autoGifts
