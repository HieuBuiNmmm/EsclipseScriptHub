-- HazardScanner – Module: Threat Detection Engine (DungeonQuest).
-- Đơn giản hóa hoàn toàn: chỉ phát hiện đối tượng skill xuất hiện trong Workspace
-- qua ChildAdded/ChildRemoved, CHỈ chạy sau sự kiện start dungeon (không còn ở lobby),
-- và vẽ SelectionBox đơn giản cho từng đối tượng được xác định.
-- Không còn trajectory / whitelist / boss orb / ngoại lệ / hitbox padding / tên 3D.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local geometry = require("@routes/DungeonQuest/core/hazardScanner/geometry")
local visualizer = require("@routes/DungeonQuest/core/hazardScanner/visualizer")
local trajectory = require("@routes/DungeonQuest/core/hazardScanner/trajectory")

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
local selectionBoxesEnabled = true
local logHazards = false
local logFailed = false
local inspectTargetName = ""
local inspectEnabled = false
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

--// Kiểm tra xem instance có phải là nhân vật người chơi (LocalPlayer hoặc đồng đội) không
local function isPlayerCharacter(instance)
	if not instance then return false end
	if Players:GetPlayerFromCharacter(instance) then return true end
	if Players:FindFirstChild(instance.Name) then return true end
	for _, p in ipairs(Players:GetPlayers()) do
		if instance.Name == p.Name then return true end
		local c = p.Character
		if c and (instance == c or instance:IsDescendantOf(c)) then
			return true
		end
	end
	local char = player and player.Character
	if char and (instance == char or instance:IsDescendantOf(char)) then return true end
	return false
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
local MAX_REGISTER_RETRIES = 50
local RETRY_INTERVAL = 0.05
local retryStates = {} -- [Instance] = { active = boolean, count = number }

local function stopRetry(instance)
	local state = retryStates[instance]
	if state then
		state.active = false
		retryStates[instance] = nil
	end
end

local function stopAllRetries()
	for _, state in pairs(retryStates) do
		if state then state.active = false end
	end
	table.clear(retryStates)
end

--// Lay danh sach BasePart cua instance (BasePart -> chinh no; Model / Folder -> cac BasePart descendant)
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
	else
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

--// Specific Skill Deep Inspector
local function matchesInspectTarget(name)
	if not inspectEnabled or inspectTargetName == "" then return false end
	if not name or type(name) ~= "string" then return false end
	local cleanTarget = inspectTargetName:lower():gsub("%s+", "")
	if #cleanTarget == 0 then return false end
	local cleanName = name:lower():gsub("%s+", "")
	return string.find(cleanName, cleanTarget, 1, true) ~= nil
end

local function formatVector3(v)
	if not v then return "nil" end
	return ("(%.2f, %.2f, %.2f)"):format(v.X, v.Y, v.Z)
end

local function printDeepInspect(instance, eventType, extraReason, infoData)
	if not instance then return end
	local name = instance.Name
	if not matchesInspectTarget(name) then return end

	local class = instance.ClassName
	local parentPath = instance.Parent and instance.Parent:GetFullName() or "nil"
	local distance = computeDistance(instance)

	print("================== 🔍 [HAZARD DEEP INSPECT] 🔍 ==================")
	print(("  🎯 Target Name    : %s (%s)"):format(name, class))
	print(("  📌 Event Type     : %s%s"):format(eventType, extraReason and (" -> " .. tostring(extraReason)) or ""))
	print(("  📍 Full Path      : %s"):format(parentPath))
	print(("  📏 Dist to Player : %d studs"):format(distance))

	if eventType == "SPAWN" then
		local parts = {}
		if instance:IsA("BasePart") then
			table.insert(parts, instance)
		else
			for _, desc in ipairs(instance:GetDescendants()) do
				if desc:IsA("BasePart") then
					table.insert(parts, desc)
				end
			end
		end

		print(("  🧩 Total Parts (%d) :"):format(#parts))
		for idx, p in ipairs(parts) do
			local shapeStr = p:IsA("Part") and tostring(p.Shape.Name) or (p.ClassName == "MeshPart" and "MeshPart" or p.ClassName)
			print(("     [%d] %q (%s)"):format(idx, p.Name, p.ClassName))
			print(("         • Size: %s | Shape: %s | Trans: %.2f | CanCollide: %s"):format(
				formatVector3(p.Size),
				shapeStr,
				p.Transparency,
				tostring(p.CanCollide)
			))
			print(("         • Pos : %s"):format(formatVector3(p.Position)))
		end

		local hazardZones = geometry.GetHazardZones(infoData)
		if hazardZones and hazardZones.zones then
			local pad = geometry.GetHitboxPadding()
			print(("  📐 Math Geometry (Zones: %d, BoundingRadius: %.1f studs):"):format(
				#hazardZones.zones,
				hazardZones.boundingRadius or 0
			))
			for idx, z in ipairs(hazardZones.zones) do
				if z.radius then
					print(("     - Zone [%d]: Circle/Ball (Base Radius: %.2f + Pad: %.2f = %.2f studs)"):format(
						idx, z.radius, pad, z.radius + pad
					))
				elseif z.half then
					print(("     - Zone [%d]: Box/OBB (HalfSize: %s)"):format(
						idx, formatVector3(z.half)
					))
				end
			end
		end

		-- Bắt đầu theo dõi phân tích chuyển động xoay (Spinning Analysis)
		task.spawn(function()
			local targetPart = nil
			if instance:IsA("BasePart") then
				targetPart = instance
			elseif instance:IsA("Model") then
				targetPart = instance.PrimaryPart or instance:FindFirstChildWhichIsA("BasePart")
			end
			if not targetPart then return end

			local t0 = os.clock()
			local cf0 = targetPart.CFrame
			task.wait(0.12)

			if not instance.Parent or not targetPart.Parent then return end

			local t1 = os.clock()
			local cf1 = targetPart.CFrame
			local dt = t1 - t0
			if dt <= 0 then return end

			-- Delta trong hệ tọa độ Thế giới (World Space)
			local worldDelta = cf1 * cf0:Inverse()
			local worldAxis, worldAngle = worldDelta:ToAxisAngle()
			local worldDegPerSec = math.deg(worldAngle) / dt

			-- Delta trong hệ tọa độ Cục bộ (Local Space)
			local localDelta = cf0:Inverse() * cf1
			local localAxis, localAngle = localDelta:ToAxisAngle()

			if math.abs(math.deg(worldAngle)) >= 1.5 then
				local worldAxisDesc = "Trục tự do / Hỗn hợp"
				if math.abs(worldAxis.Y) >= 0.8 then
					worldAxisDesc = "Trục Y (Yaw - Quét ngang mặt sàn)"
				elseif math.abs(worldAxis.X) >= 0.8 then
					worldAxisDesc = "Trục X (Pitch - Lăn nhào lộn)"
				elseif math.abs(worldAxis.Z) >= 0.8 then
					worldAxisDesc = "Trục Z (Roll - Nghiêng lật bên)"
				end

				local localAxisDesc = "Trục tự do"
				if math.abs(localAxis.Y) >= 0.8 then
					localAxisDesc = "Trục Local Y"
				elseif math.abs(localAxis.X) >= 0.8 then
					localAxisDesc = "Trục Local X"
				elseif math.abs(localAxis.Z) >= 0.8 then
					localAxisDesc = "Trục Local Z"
				end

				print("================== 🔄 [INSPECT: SPINNING DETECTED] 🔄 ==================")
				print(("  🎯 Target Name    : %s (%s)"):format(instance.Name, targetPart.Name))
				print(("  ⚡ Tốc độ xoay    : %.2f °/s (%.2f rad/s)"):format(worldDegPerSec, worldAngle / dt))
				print(("  🌐 World Spin Axis: %s -> %s"):format(formatVector3(worldAxis), worldAxisDesc))
				print(("  🧩 Local Spin Axis: %s -> %s"):format(formatVector3(localAxis), localAxisDesc))
				print("========================================================================")
			end
		end)
	elseif eventType == "DESPAWN" then
		if infoData and infoData.SpawnClock then
			local elapsed = os.clock() - infoData.SpawnClock
			print(("  ⏱️ Lifetime Active: %.2f seconds"):format(elapsed))
		end
	elseif eventType == "REJECTED" then
		print(("  ⚠️ Rejection Reason: %s"):format(tostring(extraReason)))
	end
	print("================================================================")
end

--// Log đối tượng không vẽ được (bị loại qua gate hoặc không có gì để vẽ)
local function logReject(instance, reason)
	printDeepInspect(instance, "REJECTED", reason, nil)
	if not logFailed then return end
	local name = instance and instance.Name or "?"
	local class = instance and instance.ClassName or "?"
	print(("[HazardScanner][Reject] ⚪ %s (%s) — %s"):format(name, class, reason))
end

local registerHazard

--// Lên lịch retry khi object chưa đủ parts để vẽ (polling 10 lần, mỗi 0.05s).
--// In kết quả chi tiết từng lần retry ra console nếu đang inspect hoặc bật logFailed.
local function retryRegister(instance)
	if not instance or not instance.Parent then return end
	if isPlayerCharacter(instance) then return end
	if activeHazards[instance] then return end
	if retryStates[instance] then return end

	local state = { active = true, count = 0 }
	retryStates[instance] = state

	task.spawn(function()
		while state.active and instance.Parent and enabled and inDungeon do
			if isPlayerCharacter(instance) then
				stopRetry(instance)
				return
			end
			state.count += 1
			local allDesc = instance:GetDescendants()
			local validParts = getBaseParts(instance)

			local isTarget = matchesInspectTarget(instance.Name)
			if logFailed or isTarget then
				print(("[HazardScanner][Retry] 🔄 Lần %d/%d: %q (%s) | Descendants: %d | Valid Parts (Trans<=%.2f): %d"):format(
					state.count,
					MAX_REGISTER_RETRIES,
					instance.Name,
					instance.ClassName,
					#allDesc,
					FADE_TRANSPARENCY_THRESHOLD,
					#validParts
				))
			end

			if #validParts > 0 then
				if logFailed or isTarget then
					print(("[HazardScanner][Retry] ✅ Lần %d/%d: %q Đã tìm thấy %d part(s)! Tiến hành vẽ..."):format(
						state.count,
						MAX_REGISTER_RETRIES,
						instance.Name,
						#validParts
					))
				end
				stopRetry(instance)
				registerHazard(instance)
				return
			end

			if state.count >= MAX_REGISTER_RETRIES then
				logReject(instance, ("Hết %d lượt retry mà không tìm thấy BasePart hợp lệ (Descendants: %d)"):format(
					MAX_REGISTER_RETRIES,
					#allDesc
				))
				stopRetry(instance)
				return
			end

			task.wait(RETRY_INTERVAL)
		end
		stopRetry(instance)
	end)
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
	if isPlayerCharacter(instance) then
		logReject(instance, "Nhân vật người chơi (Player/Teammate)")
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
	local boxes = {}
	if selectionBoxesEnabled then
		boxes = attachSelectionBoxes(parts, fadeConnections)
	end
	local distance = computeDistance(instance)

	local info = {
		Instance = instance,
		Name = instance.Name,
		Class = instance.ClassName,
		Distance = distance,
		Boxes = boxes,
		Connections = fadeConnections,
		SpawnClock = os.clock(),
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
	if trajectory.IsEnabled() then
		trajectory.AttachTrajectoryVisuals(info)
	end

	stopRetry(instance)

	printDeepInspect(instance, "SPAWN", "Passed all gates", info)

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

	printDeepInspect(instance, "DESPAWN", reason, info)

	visualizer.DetachZoneVisuals(info)
	trajectory.DetachTrajectoryVisuals(info)

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
	trajectory.ClearAll()
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
	trajectory.BindDetection(detection)
	detection.ClearAllHazards("StartScan Reset")

	for _, c in ipairs(connections) do c:Disconnect() end
	table.clear(connections)

	table.insert(connections, Workspace.ChildAdded:Connect(function(child)
		if isPlayerCharacter(child) then return end
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

function detection.SetSelectionBoxesEnabled(state)
	selectionBoxesEnabled = state and true or false
	if selectionBoxesEnabled then
		for inst, info in pairs(activeHazards) do
			if inst and inst.Parent and (not info.Boxes or #info.Boxes == 0) then
				local parts = getBaseParts(inst)
				info.Connections = info.Connections or {}
				info.Boxes = attachSelectionBoxes(parts, info.Connections)
			end
		end
	else
		for _, info in pairs(activeHazards) do
			if info.Boxes then
				for _, box in ipairs(info.Boxes) do
					pcall(function() box:Destroy() end)
				end
				table.clear(info.Boxes)
			end
		end
	end
end

function detection.IsSelectionBoxesEnabled()
	return selectionBoxesEnabled
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

function detection.SetInspectTarget(name)
	inspectTargetName = type(name) == "string" and name or ""
end

function detection.GetInspectTarget()
	return inspectTargetName
end

function detection.SetInspectEnabled(state)
	inspectEnabled = state and true or false
end

function detection.IsInspectEnabled()
	return inspectEnabled
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