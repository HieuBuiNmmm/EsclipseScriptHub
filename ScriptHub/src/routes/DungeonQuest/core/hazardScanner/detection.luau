-- HazardScanner – Module: Threat Detection Engine (DungeonQuest).
-- Đơn giản hóa hoàn toàn: chỉ phát hiện đối tượng skill xuất hiện trong Workspace
-- qua ChildAdded/ChildRemoved, CHỈ chạy sau sự kiện start dungeon (không còn ở lobby),
-- và vẽ SelectionBox đơn giản cho từng đối tượng được xác định.
-- Không còn trajectory / whitelist / boss orb / ngoại lệ / hitbox padding / tên 3D.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local visualizer = require("@routes/DungeonQuest/core/hazardScanner/visualizer")

--// References
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = services.player

--// Table
local detection = {}

--// State
local enabled = false
local inDungeon = false
local logHazards = false
local logFailed = false
local activeHazards = {} -- [Instance] = { Name, Class, Distance, Boxes = {} }
local hazardCount = 0
local hazardChangedCallbacks = {}
local lastHazardInfo = nil
local connections = {}
local roomCleanup = nil

--// Danh sách folder template trong ReplicatedStorage: các đối tượng clone từ đây
--// xuất hiện trong Workspace sẽ KHÔNG được vẽ box.
local IGNORE_FOLDERS = { "abilities", "projectiles" }
local ignoreNamesLoaded = false
local ignoreNames = {} -- [cleanName] = true

local function loadIgnoreNames()
	if ignoreNamesLoaded then return end
	ignoreNamesLoaded = true
	for _, folderName in ipairs(IGNORE_FOLDERS) do
		local folder = ReplicatedStorage:FindFirstChild(folderName)
		if folder then
			for _, obj in ipairs(folder:GetChildren()) do
				local clean = (obj.Name or ""):lower():gsub("%s+", "")
				if #clean > 0 then ignoreNames[clean] = true end
			end
		end
	end
end

local function isIgnoredName(instance)
	if not instance then return false end
	local clean = (instance.Name or ""):lower():gsub("%s+", "")
	return #clean > 0 and ignoreNames[clean] == true
end

--// Fire callback thay đổi hazard (count, lastInfo)
local function fireHazardChanged()
	local count = 0
	for _ in pairs(activeHazards) do count += 1 end
	hazardCount = count
	for i = #hazardChangedCallbacks, 1, -1 do
		pcall(hazardChangedCallbacks[i], count, lastHazardInfo)
	end
end

--// Ngưỡng coi như part đã mờ hoàn toàn -> không vẽ box
local FADE_TRANSPARENCY_THRESHOLD = 0.85

--// Retry: object xuất hiện nhưng chưa kịp khởi tạo đủ parts (DescendantAdded đến sau
--// ChildAdded). Retry tối đa MAX_REGISTER_RETRIES lần mỗi khi có descendant mới.
local MAX_REGISTER_RETRIES = 10
local retryStates = {} -- [Instance] = { count = number, connection = RBXScriptConnection }

local function stopRetry(instance)
	local state = retryStates[instance]
	if state then
		if state.connection then
			pcall(function() state.connection:Disconnect() end)
		end
		retryStates[instance] = nil
	end
end

local function stopAllRetries()
	for inst in pairs(retryStates) do
		stopRetry(inst)
	end
	table.clear(retryStates)
end

--// Log đối tượng không vẽ được (bị loại qua gate hoặc không có gì để vẽ)
local function logReject(instance, reason)
	if not logFailed then return end
	local name = instance and instance.Name or "?"
	local class = instance and instance.ClassName or "?"
	print(("[HazardScanner][Reject] ⚪ %s (%s) — %s"):format(name, class, reason))
end

local registerHazard

--// Lên lịch retry khi object chưa đủ parts để vẽ.
--// Mỗi lần có descendant mới -> thử register lại; quá MAX_REGISTER_RETRIES thì bỏ.
local function retryRegister(instance)
	if not instance or not instance.Parent then return end
	if activeHazards[instance] then return end

	local state = retryStates[instance]
	if not state then
		state = { count = 0, connection = nil }
		retryStates[instance] = state
	end

	state.count += 1
	if state.count > MAX_REGISTER_RETRIES then
		logReject(instance, "Hết lượt retry")
		stopRetry(instance)
		return
	end

	if not state.connection then
		state.connection = instance.DescendantAdded:Connect(function()
			if not instance.Parent then
				stopRetry(instance)
				return
			end
			registerHazard(instance)
		end)
	end
end

--// Lay danh sach BasePart cua instance (BasePart -> chinh no; Model -> cac BasePart descendant)
--// Chỉ lấy part còn rõ (Transparency <= 0.85)
local function getBaseParts(instance)
	if not instance then return {} end
	local parts = {}
	local function addPart(part)
		if part and part.Parent and part.Transparency <= FADE_TRANSPARENCY_THRESHOLD then
			parts[#parts + 1] = part
		end
	end
	if instance:IsA("BasePart") then
		addPart(instance)
	elseif instance:IsA("Model") then
		for _, desc in ipairs(instance:GetDescendants()) do
			if desc:IsA("BasePart") and desc.Parent then
				addPart(desc)
			end
		end
	end
	return parts
end

--// Khoang cach tu player den instance (studs, lam tron)
local function computeDistance(instance)
	local char = player and player.Character
	if not char then return 0 end
	local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
	if not root then return 0 end
	local rootPos = root.Position

	local pos
	if instance:IsA("BasePart") then
		pos = instance.Position
	elseif instance:IsA("Model") then
		local ok, pivot = pcall(function()
			return instance:GetPivot().Position
		end)
		if ok then
			pos = pivot
		else
			local part = instance:FindFirstChildWhichIsA("BasePart")
			pos = part and part.Position
		end
	end
	if not pos then return 0 end
	return math.floor((rootPos - pos).Magnitude + 0.5)
end

--// Tao va gan SelectionBox don gian len tung BasePart.
--// Khi part mo dan (Transparency > 0.85) thi box tu destroy.
local function attachSelectionBoxes(parts, fadeConnections)
	local boxes = {}
	for _, part in ipairs(parts) do
		if part and part.Parent then
			local box = Instance.new("SelectionBox")
			box.Name = "HazardSelectionBox"
			box.Color3 = Color3.fromRGB(255, 45, 45)
			box.SurfaceColor3 = Color3.fromRGB(255, 30, 30)
			box.SurfaceTransparency = 0.6
			box.LineThickness = 0.05
			box.Adornee = part
			box.Parent = part

			local connection = part:GetPropertyChangedSignal("Transparency"):Connect(function()
				if part.Parent and part.Transparency > FADE_TRANSPARENCY_THRESHOLD then
					pcall(function() box:Destroy() end)
				end
			end)
			if fadeConnections then table.insert(fadeConnections, connection) end

			boxes[#boxes + 1] = box
		end
	end
	return boxes
end

--// Dang ky hazard: vẽ SelectionBox quanh moi object xuat hien trong Workspace
registerHazard = function(instance)
	if not enabled or not inDungeon then
		logReject(instance, "Chưa trong dungeon")
		return false
	end
	if not instance or not instance.Parent then
		logReject(instance, "Không còn Parent")
		return false
	end
	if activeHazards[instance] then return true end

	loadIgnoreNames()
	if isIgnoredName(instance) then
		logReject(instance, "Trùng tên trong ReplicatedStorage (abilities/projectiles)")
		return false
	end

	local parts = getBaseParts(instance)
	if #parts == 0 then
		logReject(instance, "Chưa có part để vẽ (sẽ retry)")
		retryRegister(instance)
		return false
	end

	local fadeConnections = {}
	local boxes = attachSelectionBoxes(parts, fadeConnections)
	local distance = computeDistance(instance)

	local info = {
		Instance = instance,
		Name = instance.Name,
		Class = instance.ClassName,
		Distance = distance,
		Boxes = boxes,
		Connections = fadeConnections,
	}
	activeHazards[instance] = info
	lastHazardInfo = {
		Name = instance.Name,
		Class = instance.ClassName,
		Distance = distance,
	}

	if visualizer.IsEnabled() then
		visualizer.AttachZoneVisuals(info)
	end

	stopRetry(instance)

	if logHazards then
		print(("[HazardScanner][Hazard] 🔴 Hazard Detected: %s (%s, %d studs)")
			:format(instance.Name, instance.ClassName, distance))
	end
	fireHazardChanged()
	return true
end

--// Huy dong hazard: gỡ SelectionBox va xoa khoi activeHazards
local function unregisterHazard(instance, reason)
	local info = activeHazards[instance]
	if not info then
		stopRetry(instance)
		return
	end

	visualizer.DetachZoneVisuals(info)

	if info.Boxes then
		for _, box in ipairs(info.Boxes) do
			pcall(function() box:Destroy() end)
		end
		table.clear(info.Boxes)
	end

	if info.Connections then
		for _, c in ipairs(info.Connections) do
			pcall(function() c:Disconnect() end)
		end
		table.clear(info.Connections)
	end

	activeHazards[instance] = nil

	if logHazards then
		local reasonStr = reason and (" (" .. reason .. ")") or ""
		print(("[HazardScanner][Hazard] 🟢 Hazard Expired: %s%s")
			:format(tostring(info.Name), reasonStr))
	end
	fireHazardChanged()
end

--// Xoa toan bo hazard hien tai
function detection.ClearAllHazards(reason)
	visualizer.ClearAll()
	stopAllRetries()
	local toRemove = {}
	for inst in pairs(activeHazards) do
		table.insert(toRemove, inst)
	end
	for _, inst in ipairs(toRemove) do
		unregisterHazard(inst, reason)
	end
	if logHazards and reason then
		print(("[HazardScanner][Hazard] 🧹 All hazards cleared: %s"):format(reason))
	end
end

--// Bat dau quét: lang nghe ChildAdded/ChildRemoved cua Workspace (chi chay sau start dungeon)
function detection.StartScan()
	if enabled then return end
	enabled = true

	visualizer.BindDetection(detection)
	detection.ClearAllHazards("StartScan Reset")

	for _, c in ipairs(connections) do c:Disconnect() end
	table.clear(connections)

	table.insert(connections, Workspace.ChildAdded:Connect(function(child)
		registerHazard(child)
	end))

	table.insert(connections, Workspace.ChildRemoved:Connect(function(child)
		unregisterHazard(child, "Destroyed")
	end))

	-- Gate "start dungeon": dựa vào room index (0 = "Room--").
	-- CHỈ vẽ các child level 1 MỚI được add (qua ChildAdded) sau khi room >= 1.
	-- KHÔNG vẽ child level 1 có sẵn từ trước và KHÔNG vẽ child level 2.
	inDungeon = shared.GetCurrentRoomIndex() > 0

	if roomCleanup then pcall(roomCleanup); roomCleanup = nil end
	roomCleanup = shared.OnRoomIndexChanged(function(room)
		if room > 0 then
			inDungeon = true
		elseif room <= 0 and inDungeon then
			inDungeon = false
			detection.ClearAllHazards("Dungeon Ended")
		end
	end)

	if logHazards then
		print("[HazardScanner] 📡 Threat Detector started!")
	end
end

--// Dung quét: gỡ connection va dọn hazards
function detection.StopScan()
	enabled = false
	inDungeon = false

	for _, c in ipairs(connections) do c:Disconnect() end
	table.clear(connections)

	if roomCleanup then pcall(roomCleanup); roomCleanup = nil end

	detection.ClearAllHazards("StopScan")

	if logHazards then
		print("[HazardScanner] 🛑 Threat Detector stopped.")
	end
end

--// Public accessors
function detection.IsEnabled()
	return enabled
end

function detection.SetEnabled(state)
	if state then
		detection.StartScan()
	else
		detection.StopScan()
	end
end

function detection.SetLogHazards(state)
	logHazards = state and true or false
end

function detection.IsLogHazardsEnabled()
	return logHazards
end

function detection.SetLogFailed(state)
	logFailed = state and true or false
end

function detection.IsLogFailedEnabled()
	return logFailed
end

function detection.GetHazardCount()
	return hazardCount
end

function detection.GetActiveHazards()
	local list = {}
	for inst, data in pairs(activeHazards) do
		if inst and inst.Parent == Workspace then
			list[#list + 1] = data
		end
	end
	return list
end

function detection.GetActiveHazardsMap()
	return activeHazards
end

function detection.GetLastHazardInfo()
	return lastHazardInfo
end

function detection.OnHazardChanged(callback)
	if type(callback) ~= "function" then return end
	table.insert(hazardChangedCallbacks, callback)
end

--// Dong nap khi shutdown
lifecycle.Register(function()
	detection.StopScan()
	detection.ClearAllHazards("Shutdown")
end)

return detection