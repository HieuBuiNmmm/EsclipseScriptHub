-- HazardScannerV2 - Core Hazard Detection & Telemetry Manager (Recorder Standalone Edition)
-- Tuyệt đối không chứa SafeSpot, Danger, DodgeController hay HUD Indicator.

--// Imports
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local filter = require("@routes/DungeonQuest_Recorder/core/filter")
local analyzer = require("@routes/DungeonQuest_Recorder/core/analyzer")
local motion = require("@routes/DungeonQuest_Recorder/core/motion")
local bossWatcher = require("@routes/DungeonQuest_Recorder/core/bossWatcher")
local memoryWatcher = require("@routes/DungeonQuest_Recorder/core/memoryWatcher")
local visualizerV2 = require("@routes/DungeonQuest_Recorder/core/visualizer")
local corridor = require("@routes/DungeonQuest_Recorder/core/corridor")

--// Table
local scanner = {}

--// State
local enabled = false
local activeHazards = {} -- [BasePart] = { part, level1Parent, name, spawnTime, shape, motion }
local childConnections = {} -- [Instance] = { conn1, conn2 }
local connections = {}
local heartbeatConn = nil

-- Đăng ký 1 Hazard Part vào tập theo dõi
local function registerHazardPart(part, level1Child)
	if not part or not part:IsA("BasePart") then return end
	if filter.IsPlayerCharacter(part) or (level1Child and filter.IsPlayerCharacter(level1Child)) then return end
	if filter.IsPlayerAbility(part) or (level1Child and filter.IsPlayerAbility(level1Child)) then return end
	if not filter.IsHazardPart(part, level1Child) then return end
	if activeHazards[part] then return end

	local rootName = level1Child and level1Child.Name or (part.Parent and part.Parent.Name) or part.Name
	local isMultiRing = filter.IsMultiRing(rootName) 
		or filter.IsMultiRing(part) 
		or (part.Parent and filter.IsMultiRing(part.Parent.Name))
		or (level1Child and filter.IsMultiRing(level1Child))

	-- Đảm bảo mỗi đối tượng MultiRing chỉ có DUY NHẤT 1 Hazard trong activeHazards
	if isMultiRing then
		for p, data in pairs(activeHazards) do
			if data.level1Parent == level1Child or (level1Child and p:IsDescendantOf(level1Child)) or p == part then
				return
			end
		end
	end

	local isIceSpikes = filter.IsIceSpikes(rootName) 
		or filter.IsIceSpikes(part) 
		or (part.Parent and filter.IsIceSpikes(part.Parent.Name))
		or (level1Child and filter.IsIceSpikes(level1Child))

	-- Đảm bảo mỗi cụm IceSpikes chỉ có DUY NHẤT 1 Hazard (part 'precast') trong activeHazards
	if isIceSpikes then
		for p, data in pairs(activeHazards) do
			if data.level1Parent == level1Child or (level1Child and p:IsDescendantOf(level1Child)) or p == part then
				return
			end
		end
	end

	local shapeData = analyzer.AnalyzeHazardPart(part)
	if not shapeData then return end

	local now = os.clock()
	local pos = Vector3.new(shapeData.x, shapeData.y, shapeData.z)
	local motionRec = motion.UpdateRecord(part, pos, shapeData.yaw or 0)

	local displayName = (part.Name == rootName) and rootName or (rootName .. "/" .. part.Name)
	if isMultiRing then
		displayName = rootName
	elseif filter.IsSweepingFlames(rootName) and part.Parent and part.Parent ~= level1Child then
		displayName = rootName .. "/" .. part.Parent.Name
	elseif filter.IsMemoryModel(rootName) then
		displayName = rootName .. "/" .. part.Name
	end

	local hazardData = {
		part = part,
		level1Parent = level1Child or part,
		name = displayName,
		spawnTime = now,
		shape = shapeData,
		motion = motionRec,
	}
	activeHazards[part] = hazardData

	if visualizerV2.IsEnabled() or visualizerV2.IsCorridorEnabled() then
		visualizerV2.Update(part, hazardData)
	end
end

-- Hủy đăng ký 1 Hazard Part
local function unregisterHazardPart(part)
	local data = activeHazards[part]
	if data then
		visualizerV2.Detach(part)
		activeHazards[part] = nil
		motion.RemoveRecord(part)
		corridor.RemoveRecord(part)
		if part.Parent and part.Parent:IsA("Model") then
			corridor.RemoveRecord(part.Parent)
		end
	end
end

-- Xử lý khi một Level 1 Child được thêm vào Workspace
local function onWorkspaceChildAdded(child)
	if not filter.IsValidLevel1WorkspaceChild(child) then
		return
	end
	if filter.IsPlayerAbility(child) or filter.IsPlayerCharacter(child) then
		return
	end

	-- Tìm tất cả các Hazard Parts đang có trong đối tượng Level 1 này
	local hazardParts = filter.FindHazardPartsInLevel1Child(child)
	for _, p in ipairs(hazardParts) do
		registerHazardPart(p, child)
	end

	-- Nếu là Model, lắng nghe thêm DescendantAdded để bắt kịp các Part xuất hiện trễ
	if child:IsA("Model") then
		childConnections[child] = child.DescendantAdded:Connect(function(desc)
			if desc:IsA("BasePart") then
				if filter.IsPlayerAbility(desc) or filter.IsPlayerAbility(child) then
					return
				end
				if filter.IsPlayerCharacter(desc) or filter.IsPlayerCharacter(child) then
					return
				end
				if filter.IsMultiRing(child) or filter.IsIceSpikes(child) then
					local alreadyRegistered = false
					for p, data in pairs(activeHazards) do
						if data.level1Parent == child or p:IsDescendantOf(child) or p == child then
							alreadyRegistered = true
							break
						end
					end
					if not alreadyRegistered and filter.IsHazardPart(desc, child) then
						registerHazardPart(desc, child)
					end
				elseif filter.IsHazardPart(desc, child) then
					registerHazardPart(desc, child)
				end
			end
		end)
	end
end

-- Xử lý khi một Level 1 Child bị xóa khỏi Workspace
local function onWorkspaceChildRemoved(child)
	if childConnections[child] then
		childConnections[child]:Disconnect()
		childConnections[child] = nil
	end

	local toRemove = {}
	for part, data in pairs(activeHazards) do
		if data.level1Parent == child or part == child or (child:IsA("Instance") and part:IsDescendantOf(child)) then
			table.insert(toRemove, part)
		end
	end

	for _, p in ipairs(toRemove) do
		unregisterHazardPart(p)
	end

	corridor.RemoveRecord(child)
end

-- Quét toàn bộ các đối tượng Level 1 đang có trong Workspace
local function scanExistingWorkspaceChildren()
	for _, child in ipairs(Workspace:GetChildren()) do
		if filter.IsValidLevel1WorkspaceChild(child) then
			local parts = filter.FindHazardPartsInLevel1Child(child)
			for _, p in ipairs(parts) do
				registerHazardPart(p, child)
			end
		end
	end
end

-- Cập nhật động học thời gian thực & Dọn dẹp hazard đã biến mất/hết hạn
local function onHeartbeat()
	if not enabled then return end

	local deadList = {}
	local now = os.clock()

	-- Cập nhật bộ theo dõi Memory Game của Bonus Boss
	memoryWatcher.Update(now)

	for part, data in pairs(activeHazards) do
		-- 1. Kiểm tra tồn tại trong Workspace Hierarchy
		if not part or not part:IsDescendantOf(Workspace) then
			table.insert(deadList, part)
			continue
		end

		if data.level1Parent and not data.level1Parent:IsDescendantOf(Workspace) then
			table.insert(deadList, part)
			continue
		end

		local isMultiRing = filter.IsMultiRing(data.name) 
			or filter.IsMultiRing(part) 
			or (data.level1Parent and filter.IsMultiRing(data.level1Parent))

		local isSweepingFlames = filter.IsSweepingFlames(data.name)
			or filter.IsSweepingFlames(part)
			or (data.level1Parent and filter.IsSweepingFlames(data.level1Parent))

		local isMemoryModel = filter.IsMemoryModel(data.name)
			or filter.IsMemoryModel(part)
			or (data.level1Parent and filter.IsMemoryModel(data.level1Parent))

		local isBigSpike = filter.IsFirstBossBigSpike(data.name)
			or filter.IsFirstBossBigSpike(part)
			or (data.level1Parent and filter.IsFirstBossBigSpike(data.level1Parent))

		-- 2. Kiểm tra sống/chết cho MultiRing
		if isMultiRing then
			local age = now - data.spawnTime
			if age > 4.5 then
				table.insert(deadList, part)
				continue
			end

			local model = (data.level1Parent and data.level1Parent:IsA("Model") and data.level1Parent) 
				or (part.Parent and part.Parent:IsA("Model") and part.Parent)

			if model then
				local hasVisiblePart = false
				for _, desc in ipairs(model:GetDescendants()) do
					if desc:IsA("BasePart") and desc.Name ~= "PrimaryPart" then
						if desc.Transparency <= 0.85 then
							hasVisiblePart = true
							break
						end
					end
				end
				if not hasVisiblePart then
					table.insert(deadList, part)
					continue
				end
			elseif part.Transparency > 0.85 then
				table.insert(deadList, part)
				continue
			end
		elseif isSweepingFlames then
			local isStillActive = false
			if part.Transparency <= 0.85 then
				isStillActive = true
			else
				local emitter = part:FindFirstChildWhichIsA("ParticleEmitter")
				if emitter and emitter.Enabled then
					isStillActive = true
				end
			end

			local age = now - data.spawnTime
			if not isStillActive or age > 2.0 then
				table.insert(deadList, part)
				continue
			end
		elseif isMemoryModel then
			local isStillActive = false
			if part.Transparency <= 0.85 then
				isStillActive = true
			else
				local emitter = part:FindFirstChildWhichIsA("ParticleEmitter")
				if emitter and emitter.Enabled then
					isStillActive = true
				end
			end

			local age = now - data.spawnTime
			if not isStillActive or age > 2.5 then
				table.insert(deadList, part)
				continue
			end
		elseif isBigSpike then
			local isStillActive = false
			if part.Transparency <= 0.85 then
				isStillActive = true
			else
				local beamPart = Workspace:FindFirstChild("firstBossBeamPart")
				if beamPart then
					isStillActive = true
				end
			end

			local age = now - data.spawnTime
			if not isStillActive or age > 5.0 then
				table.insert(deadList, part)
				continue
			end
		else
			-- 3. Hazard thông thường: Bỏ nếu độ trong suốt > 0.85
			if part.Transparency > 0.85 then
				table.insert(deadList, part)
				continue
			end
		end

		-- 4. Cập nhật phân tích hình học & chuyển động
		local existingRec = motion.GetRecord(part)
		local shapeData = analyzer.AnalyzeHazardPart(part, existingRec)
		if shapeData then
			data.shape = shapeData
			local pos = Vector3.new(shapeData.x, shapeData.y, shapeData.z)
			data.motion = motion.UpdateRecord(part, pos, shapeData.yaw or 0)
			if visualizerV2.IsEnabled() or visualizerV2.IsCorridorEnabled() then
				visualizerV2.Update(part, data)
			end
		else
			table.insert(deadList, part)
		end
	end

	for _, dead in ipairs(deadList) do
		unregisterHazardPart(dead)
	end

	-- 5. Quét định kỳ bổ sung các part sinh trễ trong Model đặc biệt
	for _, child in ipairs(Workspace:GetChildren()) do
		if filter.IsSweepingFlames(child) and child:IsA("Model") then
			for _, desc in ipairs(child:GetDescendants()) do
				if desc:IsA("BasePart") and desc.Name:lower() == "precast" and not activeHazards[desc] then
					if filter.IsHazardPart(desc, child) then
						registerHazardPart(desc, child)
					end
				end
			end
		elseif filter.IsMemoryModel(child) and child:IsA("Model") then
			for _, desc in ipairs(child:GetDescendants()) do
				if desc:IsA("BasePart") and not activeHazards[desc] then
					if filter.IsHazardPart(desc, child) then
						registerHazardPart(desc, child)
					end
				end
			end
		elseif filter.IsFirstBossBigSpike(child) then
			local parts = filter.FindHazardPartsInLevel1Child(child)
			for _, p in ipairs(parts) do
				if not activeHazards[p] and filter.IsHazardPart(p, child) then
					registerHazardPart(p, child)
				end
			end
		end
	end
end

-- Khởi động bộ quét
function scanner.StartScan()
	if enabled then return end
	enabled = true

	table.clear(activeHazards)
	table.clear(childConnections)
	motion.ClearAll()
	memoryWatcher.Reset()

	table.insert(connections, Workspace.ChildAdded:Connect(onWorkspaceChildAdded))
	table.insert(connections, Workspace.ChildRemoved:Connect(onWorkspaceChildRemoved))

	heartbeatConn = RunService.Heartbeat:Connect(onHeartbeat)

	scanExistingWorkspaceChildren()
end
scanner.Start = scanner.StartScan

-- Dừng bộ quét
function scanner.StopScan()
	if not enabled then return end
	enabled = false

	if heartbeatConn then
		heartbeatConn:Disconnect()
		heartbeatConn = nil
	end

	for _, conn in ipairs(connections) do
		if conn and conn.Disconnect then
			conn:Disconnect()
		end
	end
	table.clear(connections)

	for _, conn in pairs(childConnections) do
		if conn and conn.Disconnect then
			conn:Disconnect()
		end
	end
	table.clear(childConnections)

	visualizerV2.ClearAll()
	table.clear(activeHazards)
	motion.ClearAll()
	corridor.ClearAll()
	memoryWatcher.Reset()
end
scanner.Stop = scanner.StopScan

function scanner.IsEnabled()
	return enabled
end

function scanner.SetVisualizerEnabled(state)
	if state and not scanner.IsEnabled() then
		scanner.StartScan()
	end
	visualizerV2.SetEnabled(state)
	visualizerV2.SetCorridorEnabled(state)
	if visualizerV2.IsEnabled() or visualizerV2.IsCorridorEnabled() then
		for part, data in pairs(activeHazards) do
			visualizerV2.Update(part, data)
		end
	end
end

function scanner.IsVisualizerEnabled()
	return visualizerV2.IsEnabled()
end

-- Trích xuất Telemetry chuẩn hóa gửi qua WebSocket
function scanner.GetActiveHazardsTelemetry()
	local list = {}
	local now = os.clock()

	for part, data in pairs(activeHazards) do
		local shape = data.shape
		if not shape then continue end

		local trajProj = motion.GetTrajectoryProjection(part, 1.5)
		local age = now - data.spawnTime

		if shape.shape == "compound_multiring" then
			table.insert(list, {
				id = tostring(part),
				name = data.name,
				shape = "compound_multiring",
				x = shape.x,
				y = shape.y,
				z = shape.z,
				yaw = shape.yaw or 0,
				coreRadius = shape.coreRadius or 12.5,
				maxRadius = shape.maxRadius or 105.0,
				rings = shape.rings,
				polygons = shape.polygons,
				color = shape.color or "#3cd0d0",
				transparency = shape.transparency or 0.5,
				age = age,
				motionType = data.motion and data.motion.motionType or "STATIC",
				speed = data.motion and data.motion.speed or 0,
				angularVel = data.motion and data.motion.angularVel or 0,
				trajectory = trajProj,
				corridor = shape.corridor,
			})
		elseif shape.shape == "circle" then
			table.insert(list, {
				id = tostring(part),
				name = data.name,
				shape = "circle",
				x = shape.x,
				y = shape.y,
				z = shape.z,
				radius = shape.radius,
				color = shape.color or "#ff2a55",
				age = age,
				motionType = data.motion and data.motion.motionType or "STATIC",
				speed = data.motion and data.motion.speed or 0,
				angularVel = data.motion and data.motion.angularVel or 0,
				trajectory = trajProj,
				corridor = shape.corridor,
			})
		elseif shape.shape == "box" then
			table.insert(list, {
				id = tostring(part),
				name = data.name,
				shape = "box",
				x = shape.x,
				y = shape.y,
				z = shape.z,
				halfX = shape.halfX,
				halfZ = shape.halfZ,
				halfWidth = shape.halfWidth or shape.halfX,
				halfLength = shape.halfLength or shape.halfZ,
				width = (shape.halfWidth and shape.halfWidth * 2) or (shape.halfX and shape.halfX * 2) or shape.width or 10,
				length = (shape.halfLength and shape.halfLength * 2) or (shape.halfZ and shape.halfZ * 2) or shape.length or 10,
				fwd2D = shape.fwd2D,
				right2D = shape.right2D,
				yaw = shape.yaw,
				vertices = shape.vertices,
				color = shape.color or "#ff2a55",
				age = age,
				motionType = data.motion and data.motion.motionType or "STATIC",
				speed = data.motion and data.motion.speed or 0,
				angularVel = data.motion and data.motion.angularVel or 0,
				trajectory = trajProj,
				corridor = shape.corridor,
			})
		elseif shape.shape == "polygon" then
			table.insert(list, {
				id = tostring(part),
				name = data.name,
				shape = "polygon",
				x = shape.x,
				y = shape.y,
				z = shape.z,
				vertices = shape.vertices,
				color = shape.color or "#ff2a55",
				age = age,
				motionType = data.motion and data.motion.motionType or "STATIC",
				speed = data.motion and data.motion.speed or 0,
				angularVel = data.motion and data.motion.angularVel or 0,
				trajectory = trajProj,
				corridor = shape.corridor,
			})
		end
	end

	return list
end

-- Lấy Boss & Animation Telegraph Telemetry
function scanner.GetBossTelegraphTelemetry()
	return bossWatcher.GetBossTelegraphData()
end

-- Lấy Dữ liệu Simon-Says Memory Dance Telemetry
function scanner.GetMemoryGameTelemetry()
	return memoryWatcher.GetMemoryTelemetry()
end

return scanner
