-- HazardScannerV2 - Core Hazard Detection & Telemetry Manager
-- Quy tắc:
-- 1. CHỈ bắt các đối tượng Level 1 trong Workspace qua Workspace.ChildAdded/ChildRemoved.
-- 2. LOẠI TRỪ 100% các Level 1 Folder (workspace.dungeon, workspace.drops, effects...).
-- 3. Mặc định: Theo dõi các BasePart mang Material = Enum.Material.Neon.
-- 4. NGOẠI LỆ: largeIceSpikes, mediumIceSpikes, smallIceSpikes (Material Plastic).

--// Imports
local Workspace = game:GetService("Workspace")
local services = require("@routes/DungeonQuest/core/services")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local filter = require("@routes/DungeonQuest/core/hazardScannerV2/filter")
local analyzer = require("@routes/DungeonQuest/core/hazardScannerV2/analyzer")
local motion = require("@routes/DungeonQuest/core/hazardScannerV2/motion")
local bossWatcher = require("@routes/DungeonQuest/core/hazardScannerV2/bossWatcher")
local memoryWatcher = require("@routes/DungeonQuest/core/hazardScannerV2/memoryWatcher")

--// Table
local hazardScannerV2 = {}

--// State
local enabled = false
local activeHazards = {} -- [BasePart] = { part, level1Parent, name, spawnTime, shape, motion }
local childConnections = {} -- [Instance] = { conn1, conn2 }
local connections = {}
local heartbeatConn = nil

-- Đăng ký 1 Hazard Part vào tập theo dõi
local function registerHazardPart(part, level1Child)
	if not part or not part:IsA("BasePart") then return end
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

	activeHazards[part] = {
		part = part,
		level1Parent = level1Child or part,
		name = displayName,
		spawnTime = now,
		shape = shapeData,
		motion = motionRec,
	}
end

-- Hủy đăng ký 1 Hazard Part
local function unregisterHazardPart(part)
	if activeHazards[part] then
		activeHazards[part] = nil
		motion.RemoveRecord(part)
	end
end

-- Xử lý khi một Level 1 Child được thêm vào Workspace
local function onWorkspaceChildAdded(child)
	if not filter.IsValidLevel1WorkspaceChild(child) then
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
				if filter.IsMultiRing(child) then
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

		-- 2. Kiểm tra sống/chết cho MultiRing
		if isMultiRing then
			local age = now - data.spawnTime
			-- MultiRing trong Dungeon Quest từ lúc xuất hiện đến lúc nổ/hit chỉ kéo dài tối đa 4.5s
			if age > 4.5 then
				table.insert(deadList, part)
				continue
			end

			-- Kiểm tra Model có còn part nào đang hiển thị không (khi hit xong game sẽ làm mờ/xóa ring)
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
			-- Kiểm tra xem tia precast này còn đang phun lửa (active) hay không
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
			-- Nếu đã tắt lửa hoặc đã qua thời gian của 1 tia (2.0s) -> Hủy đăng ký tia này
			if not isStillActive or age > 2.0 then
				table.insert(deadList, part)
				continue
			end
		elseif isMemoryModel then
			-- Kiểm tra part của bonusBossMemoryModel còn active không
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
		else
			-- 3. Hazard thông thường: Bỏ nếu độ trong suốt > 0.85
			if part.Transparency > 0.85 then
				table.insert(deadList, part)
				continue
			end
		end

		-- 4. Cập nhật phân tích hình học & chuyển động
		local shapeData = analyzer.AnalyzeHazardPart(part)
		if shapeData then
			data.shape = shapeData
			local pos = Vector3.new(shapeData.x, shapeData.y, shapeData.z)
			data.motion = motion.UpdateRecord(part, pos, shapeData.yaw or 0)
		else
			table.insert(deadList, part)
		end
	end

	for _, dead in ipairs(deadList) do
		unregisterHazardPart(dead)
	end

	-- 5. Quét bổ sung các tia mới kích hoạt theo tuần tự bên trong các Model Sweeping Flames & Memory Model
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
		end
	end
end

-- Khởi động bộ quét V2
function hazardScannerV2.StartScan()
	if enabled then return end
	enabled = true

	table.clear(activeHazards)
	table.clear(childConnections)
	motion.ClearAll()
	memoryWatcher.Reset()

	-- CHỈ lắng nghe sự kiện Level 1 trên Workspace
	table.insert(connections, Workspace.ChildAdded:Connect(onWorkspaceChildAdded))
	table.insert(connections, Workspace.ChildRemoved:Connect(onWorkspaceChildRemoved))

	local RunService = services.RunService or game:GetService("RunService")
	heartbeatConn = RunService.Heartbeat:Connect(onHeartbeat)

	scanExistingWorkspaceChildren()
end

-- Dừng bộ quét V2
function hazardScannerV2.StopScan()
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

	table.clear(activeHazards)
	motion.ClearAll()
	memoryWatcher.Reset()
end

function hazardScannerV2.IsEnabled()
	return enabled
end

-- Trích xuất Telemetry chuẩn hóa gửi qua WebSocket
function hazardScannerV2.GetActiveHazardsTelemetry()
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
				yaw = shape.yaw,
				vertices = shape.vertices,
				color = shape.color or "#ff2a55",
				age = age,
				motionType = data.motion and data.motion.motionType or "STATIC",
				speed = data.motion and data.motion.speed or 0,
				angularVel = data.motion and data.motion.angularVel or 0,
				trajectory = trajProj,
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
			})
		end
	end

	return list
end

-- Lấy Boss & Animation Telegraph Telemetry
function hazardScannerV2.GetBossTelegraphTelemetry()
	return bossWatcher.GetBossTelegraphData()
end

-- Lấy Dữ liệu Simon-Says Memory Dance Telemetry
function hazardScannerV2.GetMemoryGameTelemetry()
	return memoryWatcher.GetMemoryTelemetry()
end

-- Dọn dẹp khi shutdown
lifecycle.Register(function()
	hazardScannerV2.StopScan()
end)

return hazardScannerV2
