-- RaidManager: Quản lý toàn diện chế độ Raid trong Slop Tower Defense.
-- Hỗ trợ:
--   • Theo dõi Model Map ngẫu nhiên trong workspace.Map ("Raid 1", "Raid 2", "Raid 3"...)
--   • Lắng nghe giao diện Intermission (PlayerGui.RaidReady.Frame)
--   • Trích xuất số người sẵn sàng và đếm ngược 120s ("0/1 ready  -  16s")
--   • Click nút READY an toàn đa kênh (PlayerGui.RaidReady.Frame.TextButton)
--   • Cung cấp sự kiện đổi Map và đổi trạng thái Intermission cho Macro Player & UI

local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")
local GuiService = game:GetService("GuiService")

local zoneGuard = require("./zoneGuard")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")
local logger = require("@routes/SlopTowerDefense/core/system/logger")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")

export type RaidSnapshot = {
	IsRaid: boolean,
	CurrentMap: string?,
	IsIntermission: boolean,
	RemainingSeconds: number,
	ReadyCount: number,
	TotalPlayers: number,
	StatusFormatted: string,
}

local raidManager = {}

local currentSnapshot: RaidSnapshot = {
	IsRaid = false,
	CurrentMap = nil,
	IsIntermission = false,
	RemainingSeconds = 0,
	ReadyCount = 0,
	TotalPlayers = 1,
	StatusFormatted = "Waiting",
}

local subscribers: { (RaidSnapshot) -> () } = {}
local mapChangeListeners: { (newMap: string?, oldMap: string?) -> () } = {}
local intermissionListeners: { (isActive: boolean, currentMap: string?) -> () } = {}

local activeConnections: { [string]: RBXScriptConnection } = {}
local isRunning = true
local lastMapName: string? = nil
local lastIntermissionState = false
local lastReadyClickTime = 0

--// ====================================================================
--// HELPER: Click Button Đa Kênh An Toàn (4 Tầng Fallback)
--// ====================================================================
local function clickButton(button: GuiButton): boolean
	if not button or not button:IsA("GuiButton") then return false end

	-- Cách 1: getconnections
	pcall(function()
		local gc = (getconnections or (syn and syn.getconnections) or (getgenv and getgenv().getconnections))
		if gc then
			for _, conn in ipairs(gc(button.MouseButton1Click)) do
				if conn.Fire then conn:Fire() elseif conn.fire then conn:fire() end
			end
			for _, conn in ipairs(gc(button.Activated)) do
				if conn.Fire then conn:Fire() elseif conn.fire then conn:fire() end
			end
			for _, conn in ipairs(gc(button.MouseButton1Up)) do
				if conn.Fire then conn:Fire() elseif conn.fire then conn:fire() end
			end
		end
	end)

	-- Cách 2: firesignal
	pcall(function()
		local fs = (firesignal or (syn and syn.firesignal) or (getgenv and getgenv().firesignal))
		if fs then
			fs(button.MouseButton1Click)
			fs(button.Activated)
			fs(button.MouseButton1Down)
			fs(button.MouseButton1Up)
		end
	end)

	-- Cách 3: VirtualInputManager tại tâm nút
	pcall(function()
		local absPos = button.AbsolutePosition
		local absSize = button.AbsoluteSize
		if absSize.X > 0 and absSize.Y > 0 then
			local centerX = absPos.X + absSize.X / 2
			local centerY = absPos.Y + absSize.Y / 2
			VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, true, game, 1)
			task.wait(0.05)
			VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, false, game, 1)
		end
	end)

	-- Cách 4: GuiService SelectedObject + Enter Key
	pcall(function()
		GuiService.SelectedObject = button
		task.wait(0.05)
		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
		task.wait(0.05)
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
		GuiService.SelectedObject = nil
	end)

	return true
end

--// ====================================================================
--// GUI LOOKUP: Lấy các thành phần của PlayerGui.RaidReady
--// ====================================================================
local function getRaidReadyGui(): (ScreenGui?, Frame?, GuiButton?, TextLabel?)
	local player = Players.LocalPlayer
	local playerGui = player and player:FindFirstChild("PlayerGui")
	if not playerGui then return nil, nil, nil, nil end

	local raidReady = playerGui:FindFirstChild("RaidReady")
	if not raidReady then
		raidReady = playerGui:FindFirstChild("RaidReady", true)
	end
	if not raidReady or not raidReady:IsA("ScreenGui") then
		return nil, nil, nil, nil
	end

	local frame = raidReady:FindFirstChild("Frame")
	if not frame and raidReady:FindFirstChildWhichIsA("Frame", true) then
		frame = raidReady:FindFirstChildWhichIsA("Frame", true)
	end

	local button: GuiButton? = nil
	local timerLabel: TextLabel? = nil

	if frame and frame:IsA("Frame") then
		-- 1. Tìm nút READY (Ưu tiên TextButton trực tiếp)
		local btn = frame:FindFirstChild("TextButton")
		if btn and btn:IsA("GuiButton") then
			button = btn
		else
			local deepBtn = frame:FindFirstChildWhichIsA("GuiButton", true)
			if deepBtn then
				button = deepBtn
			end
		end

		-- 2. Tìm nhãn thời gian ("0/1 ready  -  16s")
		-- Ưu tiên Frame:GetChildren()[6] theo cấu trúc của người dùng
		local children = frame:GetChildren()
		if #children >= 6 then
			local candidate = children[6]
			if candidate and candidate:IsA("TextLabel") and candidate.Text:find("ready") then
				timerLabel = candidate
			end
		end

		-- Fallback: Quét đệ quy trong Frame tìm TextLabel khớp cú pháp ready/seconds
		if not timerLabel then
			for _, desc in ipairs(frame:GetDescendants()) do
				if desc:IsA("TextLabel") then
					local textLower = desc.Text:lower()
					if textLower:find("ready") and (textLower:find("s") or textLower:find("%d+")) then
						timerLabel = desc
						break
					end
				end
			end
		end
	end

	return raidReady, frame, button, timerLabel
end

--// ====================================================================
--// MAP LOOKUP: Lấy tên Map từ workspace.Map
--// ====================================================================
local function queryCurrentMap(): string?
	local mapFolder = workspace:FindFirstChild("Map")
	if not mapFolder then return nil end

	for _, child in ipairs(mapFolder:GetChildren()) do
		if child:IsA("Model") or child:IsA("Folder") then
			return child.Name
		end
	end

	return nil
end

-- Parse chuỗi "0/1 ready  -  16s" -> readyCount, totalPlayers, seconds
local function parseStatusText(rawText: string?): (number, number, number)
	if not rawText or rawText == "" then
		return 0, 1, 0
	end

	-- Chuẩn hóa: "0/1 ready  -  16s"
	local r, t, s = rawText:match("(%d+)%s*/%s*(%d+)%s*ready%s*-%s*(%d+)s")
	if r and t and s then
		return tonumber(r) or 0, tonumber(t) or 1, tonumber(s) or 0
	end

	-- Fallback trích xuất từng thành phần
	local seconds = tonumber(rawText:match("(%d+)%s*s")) or 0
	local readyC, totalP = rawText:match("(%d+)%s*/%s*(%d+)")
	local rc = tonumber(readyC) or 0
	local tp = tonumber(totalP) or 1

	return rc, tp, seconds
end

local function notifySubscribers()
	for _, sub in ipairs(subscribers) do
		task.spawn(pcall, sub, currentSnapshot)
	end
end

-- Cập nhật dữ liệu Snapshot thời gian thực
local function updateSnapshot()
	if not zoneGuard.IsInGame() then
		currentSnapshot.IsRaid = false
		currentSnapshot.CurrentMap = nil
		currentSnapshot.IsIntermission = false
		currentSnapshot.RemainingSeconds = 0
		currentSnapshot.ReadyCount = 0
		currentSnapshot.TotalPlayers = 1
		currentSnapshot.StatusFormatted = "In Lobby"
		return
	end

	local mapName = queryCurrentMap()
	local raidReady, frame, _, timerLabel = getRaidReadyGui()

	local isIntermission = false
	if raidReady and frame then
		-- Intermission được coi là active khi ScreenGui Enabled và Frame Visible
		local screenEnabled = (raidReady.Enabled == true)
		local frameVisible = (frame.Visible == true)
		isIntermission = screenEnabled and frameVisible
	end

	local isRaidMatch = false
	if mapName and mapName:lower():find("raid") then
		isRaidMatch = true
	elseif raidReady ~= nil then
		isRaidMatch = true
	end

	local readyCount = 0
	local totalPlayers = 1
	local remainingSeconds = 0
	local statusFormatted = "Active Match"

	if isIntermission then
		local labelText = timerLabel and timerLabel.Text or ""
		readyCount, totalPlayers, remainingSeconds = parseStatusText(labelText)
		statusFormatted = string.format("%d/%d Ready (%ds)", readyCount, totalPlayers, remainingSeconds)
	elseif isRaidMatch then
		statusFormatted = "Raid Wave in progress"
	end

	-- Phát hiện đổi Map
	if mapName ~= lastMapName then
		local oldMap = lastMapName
		lastMapName = mapName
		currentSnapshot.CurrentMap = mapName
		if mapName then
			logger.Log(string.format("[RaidManager] 🗺️ Phát hiện Map mới: '%s' (Map cũ: '%s')", mapName, tostring(oldMap or "None")))
			for _, listener in ipairs(mapChangeListeners) do
				task.spawn(pcall, listener, mapName, oldMap)
			end
		end
	end

	-- Phát hiện đổi trạng thái Intermission
	if isIntermission ~= lastIntermissionState then
		lastIntermissionState = isIntermission
		currentSnapshot.IsIntermission = isIntermission
		logger.Log(string.format("[RaidManager] ⏳ Trạng thái Intermission: %s (Map: %s)", isIntermission and "BẮT ĐẦU (120s Setup)" or "KẾT THÚC (Vào Wave)", tostring(mapName or "Unknown")))
		for _, listener in ipairs(intermissionListeners) do
			task.spawn(pcall, listener, isIntermission, mapName)
		end
	end

	currentSnapshot.IsRaid = isRaidMatch
	currentSnapshot.CurrentMap = mapName
	currentSnapshot.IsIntermission = isIntermission
	currentSnapshot.RemainingSeconds = remainingSeconds
	currentSnapshot.ReadyCount = readyCount
	currentSnapshot.TotalPlayers = totalPlayers
	currentSnapshot.StatusFormatted = statusFormatted

	notifySubscribers()
end

--// ====================================================================
--// EVENT HOOKS: Lắng nghe workspace.Map và PlayerGui.RaidReady tức thì
--// ====================================================================
local function setupHooks()
	-- 1. Lắng nghe workspace.Map (ChildAdded & ChildRemoved)
	local function hookMapFolder(mapFolder: Instance)
		if activeConnections["Map_ChildAdded"] then
			activeConnections["Map_ChildAdded"]:Disconnect()
		end
		if activeConnections["Map_ChildRemoved"] then
			activeConnections["Map_ChildRemoved"]:Disconnect()
		end

		activeConnections["Map_ChildAdded"] = mapFolder.ChildAdded:Connect(function(child)
			task.wait(0.1) -- Đệm 100ms để model map nạp đầy đủ Part
			updateSnapshot()
		end)

		activeConnections["Map_ChildRemoved"] = mapFolder.ChildRemoved:Connect(function()
			task.wait(0.05)
			updateSnapshot()
		end)
	end

	local mapFolder = workspace:FindFirstChild("Map")
	if mapFolder then
		hookMapFolder(mapFolder)
	else
		activeConnections["Workspace_ChildAdded"] = workspace.ChildAdded:Connect(function(child)
			if child.Name == "Map" then
				hookMapFolder(child)
				updateSnapshot()
			end
		end)
	end

	-- 2. Lắng nghe PlayerGui.RaidReady
	local player = Players.LocalPlayer
	local playerGui = player and player:FindFirstChild("PlayerGui")
	if playerGui then
		local function hookRaidReady(gui: ScreenGui)
			if activeConnections["RaidReady_Enabled"] then
				activeConnections["RaidReady_Enabled"]:Disconnect()
			end
			activeConnections["RaidReady_Enabled"] = gui:GetPropertyChangedSignal("Enabled"):Connect(function()
				updateSnapshot()
			end)

			local frame = gui:FindFirstChild("Frame") or gui:FindFirstChildWhichIsA("Frame", true)
			if frame then
				if activeConnections["RaidReady_Frame_Visible"] then
					activeConnections["RaidReady_Frame_Visible"]:Disconnect()
				end
				activeConnections["RaidReady_Frame_Visible"] = frame:GetPropertyChangedSignal("Visible"):Connect(function()
					updateSnapshot()
				end)
			end
		end

		local existingRaidReady = playerGui:FindFirstChild("RaidReady")
		if existingRaidReady and existingRaidReady:IsA("ScreenGui") then
			hookRaidReady(existingRaidReady)
		else
			activeConnections["PlayerGui_ChildAdded"] = playerGui.ChildAdded:Connect(function(child)
				if child.Name == "RaidReady" and child:IsA("ScreenGui") then
					hookRaidReady(child)
					updateSnapshot()
				end
			end)
		end
	end
end

-- Vòng lặp kiểm tra định kỳ (0.3s) đề phòng event bị lỡ
task.spawn(function()
	setupHooks()
	while isRunning do
		updateSnapshot()
		task.wait(0.3)
	end
end)

--// ====================================================================
--// PUBLIC API
--// ====================================================================
function raidManager.IsRaid(): boolean
	return currentSnapshot.IsRaid
end

function raidManager.GetCurrentMap(): string?
	return currentSnapshot.CurrentMap or queryCurrentMap()
end

function raidManager.IsIntermissionActive(): boolean
	return currentSnapshot.IsIntermission
end

function raidManager.GetRemainingSeconds(): number
	return currentSnapshot.RemainingSeconds
end

function raidManager.GetReadyStatus(): (number, number, number)
	return currentSnapshot.ReadyCount, currentSnapshot.TotalPlayers, currentSnapshot.RemainingSeconds
end

function raidManager.GetSnapshot(): RaidSnapshot
	return currentSnapshot
end

-- Bấm nút READY đa kênh
function raidManager.ClickReady(): boolean
	local _, frame, button = getRaidReadyGui()
	if not frame or not frame.Visible then
		return false
	end
	if not button then
		return false
	end

	local now = os.clock()
	if now - lastReadyClickTime < 1.0 then
		return false -- Debounce 1.0s
	end
	lastReadyClickTime = now

	logger.Log("[RaidManager] 🚀 Bắt đầu bấm nút READY (PlayerGui.RaidReady.Frame.TextButton)...")
	local ok = clickButton(button)
	if ok then
		notifier.Notify("Raid", "Clicked READY button!", 2)
		logger.Log("[RaidManager] ✅ Đã gửi tín hiệu Click READY thành công!")
	end
	return ok
end

function raidManager.OnMapChanged(listener: (newMap: string?, oldMap: string?) -> ()): () -> ()
	table.insert(mapChangeListeners, listener)
	return function()
		local idx = table.find(mapChangeListeners, listener)
		if idx then table.remove(mapChangeListeners, idx) end
	end
end

function raidManager.OnIntermissionChanged(listener: (isActive: boolean, currentMap: string?) -> ()): () -> ()
	table.insert(intermissionListeners, listener)
	return function()
		local idx = table.find(intermissionListeners, listener)
		if idx then table.remove(intermissionListeners, idx) end
	end
end

function raidManager.Subscribe(callback: (RaidSnapshot) -> ()): () -> ()
	table.insert(subscribers, callback)
	task.spawn(pcall, callback, currentSnapshot)
	return function()
		local idx = table.find(subscribers, callback)
		if idx then table.remove(subscribers, idx) end
	end
end

lifecycle.Register(function()
	isRunning = false
	for _, conn in pairs(activeConnections) do
		pcall(function() conn:Disconnect() end)
	end
	table.clear(activeConnections)
	table.clear(subscribers)
	table.clear(mapChangeListeners)
	table.clear(intermissionListeners)
end)

return raidManager
