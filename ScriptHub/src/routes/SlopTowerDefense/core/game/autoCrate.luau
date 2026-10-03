-- AutoCrate: Tự động mở các loại Crate trong Lobby cho Slop Tower Defense
-- Remotes sử dụng: ReplicatedStorage.Remotes.Inventory.OpenCrate:InvokeServer(crateName, amount)
-- Hỗ trợ các mốc mở: x1, x10, x25, x50, x100
-- Đọc danh sách rương sở hữu từ PlayerProfile (RawData.Items)

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")
local logger = require("@routes/SlopTowerDefense/core/system/logger")
local zoneGuard = require("./zoneGuard")
local playerProfile = require("./playerProfile")

export type CrateSnapshot = {
	SelectedCrate: string,
	RemainingCount: number,
	OpenedCountSession: number,
	AvailableCrates: { [string]: number },
	CrateList: { string },
}

local KNOWN_CRATES = {
	"Garden Crate",
	"Steampunk Crate",
	"Slopbux Crate 2",
	"Clan Crate 1",
	"Retro Crate",
	"Raid Crate 2",
	"Space Crate",
	"Quest Crate",
	"Clock Crate",
}

local autoCrate = {
	Enabled = false,
	SelectedCrate = "Garden Crate",
	Amount = "x25",
	Amounts = { "x1", "x10", "x25", "x50", "x100" },
	Delay = 0.6,
	OpenedCountSession = 0,
	LastOpenTime = 0,
}

local activeThread: thread? = nil
local openCrateRemote: RemoteFunction? = nil
local subscribers: { (CrateSnapshot) -> () } = {}
local isOpening = false

-- Tìm RemoteFunction OpenCrate trong ReplicatedStorage.Remotes.Inventory.OpenCrate
local function getOpenCrateRemote(): RemoteFunction?
	if openCrateRemote and openCrateRemote.Parent then
		return openCrateRemote
	end

	local remotesFolder = ReplicatedStorage:FindFirstChild("Remotes")
	local invFolder = remotesFolder and remotesFolder:FindFirstChild("Inventory")
	if invFolder then
		local r = invFolder:FindFirstChild("OpenCrate")
		if r and r:IsA("RemoteFunction") then
			openCrateRemote = r
			return r
		end
	end

	local fallback = ReplicatedStorage:FindFirstChild("OpenCrate", true)
	if fallback and fallback:IsA("RemoteFunction") then
		openCrateRemote = fallback
		return fallback
	end

	return nil
end

-- Chuyển đổi định dạng mốc số lượng từ chuỗi ("x1", "x10", "x25", "x50", "x100") sang số
function autoCrate.GetAmountNumber(): number
	local str = autoCrate.Amount
	if str == "x100" then return 100
	elseif str == "x50" then return 50
	elseif str == "x25" then return 25
	elseif str == "x10" then return 10
	end
	return 1
end

-- Lấy danh sách các loại Crate và số lượng thực tế trong túi đồ
function autoCrate.GetAvailableCrates(): { [string]: number }
	local result: { [string]: number } = {}
	local profile = playerProfile.GetData()

	if profile and profile.RawData and type(profile.RawData.Items) == "table" then
		for itemName, itemData in pairs(profile.RawData.Items) do
			local name = (type(itemData) == "table" and itemData.Name) or tostring(itemName)
			local stacks = (type(itemData) == "table" and tonumber(itemData.Stacks)) or 0
			if name:find("Crate") then
				result[name] = stacks
			end
		end
	end

	-- Bổ sung các crate đã biết với số lượng 0 nếu chưa có trong Items
	for _, known in ipairs(KNOWN_CRATES) do
		if result[known] == nil then
			result[known] = 0
		end
	end

	return result
end

-- Lấy danh sách tên Crate để điền vào Dropdown (ưu tiên Crate có số lượng > 0 lên đầu)
function autoCrate.GetCrateOptions(): { string }
	local available = autoCrate.GetAvailableCrates()
	local withCount = {}
	local empty = {}

	for name, count in pairs(available) do
		if count > 0 then
			table.insert(withCount, name)
		else
			table.insert(empty, name)
		end
	end

	table.sort(withCount)
	table.sort(empty)

	local list = {}
	for _, name in ipairs(withCount) do
		table.insert(list, name)
	end
	for _, name in ipairs(empty) do
		table.insert(list, name)
	end

	if #list == 0 then
		table.insert(list, "None")
	end

	return list
end

-- Lấy số lượng của 1 loại Crate cụ thể trong túi đồ
function autoCrate.GetCrateCount(crateName: string): number
	if not crateName or crateName == "" or crateName == "None" then
		return 0
	end
	local available = autoCrate.GetAvailableCrates()
	return available[crateName] or 0
end

-- Lấy snapshot dữ liệu hiện tại
function autoCrate.GetSnapshot(): CrateSnapshot
	local available = autoCrate.GetAvailableCrates()
	return {
		SelectedCrate = autoCrate.SelectedCrate,
		RemainingCount = autoCrate.GetCrateCount(autoCrate.SelectedCrate),
		OpenedCountSession = autoCrate.OpenedCountSession,
		AvailableCrates = available,
		CrateList = autoCrate.GetCrateOptions(),
	}
end

-- Thông báo cho UI subscribers
local function notifySubscribers()
	local snapshot = autoCrate.GetSnapshot()
	for _, sub in ipairs(subscribers) do
		pcall(sub, snapshot)
	end
end

-- Thực hiện 1 lượt mở Crate
function autoCrate.ExecuteOpen(): boolean
	if not autoCrate.Enabled or isOpening then
		return false
	end

	-- Giới hạn an toàn: Chỉ mở khi ở Lobby
	if not zoneGuard.IsLobby() then
		return false
	end

	local crateName = autoCrate.SelectedCrate
	if not crateName or crateName == "" or crateName == "None" then
		autoCrate.SetEnabled(false)
		notifier.Notify("Auto Crate", "Please select a valid Crate first!", 2.5)
		return false
	end

	local remote = getOpenCrateRemote()
	if not remote then
		logger.Warn("[Auto Crate] Không tìm thấy RemoteFunction: Remotes.Inventory.OpenCrate")
		return false
	end

	local stacks = autoCrate.GetCrateCount(crateName)
	if stacks <= 0 then
		autoCrate.SetEnabled(false)
		notifier.Notify("Auto Crate", string.format("Out of %s! Auto Open stopped.", crateName), 3)
		print(string.format("[Auto Crate] Hết %s trong kho -> Tự động dừng.", crateName))
		notifySubscribers()
		return false
	end

	-- Chọn mốc số lượng mở hợp lệ không vượt quá số lượng đang có
	local targetAmount = autoCrate.GetAmountNumber()
	local numToOpen = targetAmount

	if targetAmount > stacks then
		if stacks >= 100 and targetAmount >= 100 then
			numToOpen = 100
		elseif stacks >= 50 and targetAmount >= 50 then
			numToOpen = 50
		elseif stacks >= 25 and targetAmount >= 25 then
			numToOpen = 25
		elseif stacks >= 10 and targetAmount >= 10 then
			numToOpen = 10
		else
			numToOpen = 1
		end
	end

	isOpening = true
	print(string.format("[Auto Crate] Đang mở %dx '%s' (Còn lại: %d)...", numToOpen, crateName, stacks))

	local success, result = pcall(function()
		return remote:InvokeServer(crateName, numToOpen)
	end)

	isOpening = false
	autoCrate.LastOpenTime = os.clock()

	if success then
		autoCrate.OpenedCountSession += numToOpen
		print(string.format("[Auto Crate] Mở thành công %dx '%s'!", numToOpen, crateName))

		-- Đồng bộ lại dữ liệu túi đồ
		task.spawn(function()
			playerProfile.Fetch(true)
			notifySubscribers()
		end)

		return true
	else
		print(string.format("[Auto Crate] Lỗi mở rương '%s': %s", crateName, tostring(result)))
		return false
	end
end

-- Vòng lặp mở liên tục khi bật Toggle
local function runLoop()
	while autoCrate.Enabled and lifecycle.IsActive() do
		if zoneGuard.IsLobby() then
			local ok = autoCrate.ExecuteOpen()
			if not ok then
				task.wait(1.0)
			end
		else
			task.wait(1.5)
		end
		task.wait(autoCrate.Delay)
	end
	activeThread = nil
end

function autoCrate.SetEnabled(state: boolean)
	if autoCrate.Enabled == state then return end
	autoCrate.Enabled = (state == true)

	if autoCrate.Enabled then
		if not zoneGuard.IsLobby() then
			autoCrate.Enabled = false
			notifier.Notify("Auto Crate", "Auto Open Crates can only be enabled in Lobby!", 2.5)
			return
		end

		if not activeThread then
			activeThread = task.spawn(runLoop)
		end
		notifier.Notify("Auto Crate", string.format("Auto Open '%s' (%s) enabled.", autoCrate.SelectedCrate, autoCrate.Amount), 2)
	else
		activeThread = nil
		notifier.Notify("Auto Crate", "Auto Open Crates disabled.", 2)
	end
	notifySubscribers()
end

function autoCrate.IsEnabled(): boolean
	return autoCrate.Enabled
end

function autoCrate.SetSelectedCrate(crate: string)
	if not crate or crate == "" then return end
	autoCrate.SelectedCrate = crate
	notifySubscribers()
end

function autoCrate.GetSelectedCrate(): string
	return autoCrate.SelectedCrate
end

function autoCrate.SetAmount(amt: string)
	if table.find(autoCrate.Amounts, amt) then
		autoCrate.Amount = amt
	end
end

function autoCrate.GetAmount(): string
	return autoCrate.Amount
end

function autoCrate.SetDelay(val: number)
	autoCrate.Delay = math.clamp(tonumber(val) or 0.6, 0.2, 5.0)
end

function autoCrate.GetDelay(): number
	return autoCrate.Delay
end

function autoCrate.Subscribe(callback: (CrateSnapshot) -> ()): () -> ()
	table.insert(subscribers, callback)
	task.spawn(callback, autoCrate.GetSnapshot())

	return function()
		local idx = table.find(subscribers, callback)
		if idx then
			table.remove(subscribers, idx)
		end
	end
end

-- Lắng nghe PlayerProfile để tự động cập nhật số lượng Crate khi có thay đổi
local unsubProfile = playerProfile.Subscribe(function()
	notifySubscribers()
end)
lifecycle.Register(unsubProfile)

-- Dọn dẹp khi reload script
lifecycle.Register(function()
	autoCrate.Enabled = false
	activeThread = nil
	table.clear(subscribers)
end)

return autoCrate
