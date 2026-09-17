-- HazardScanner – Trajectory Visualizer (DungeonQuest):
-- Dự báo và vẽ đường quỹ đạo nguy hiểm (Orange Trajectory Corridor) tĩnh cho các chiêu thức đang di chuyển.
-- Chiều dài dải cam được cố định theo cấu hình slider (predictionLength).
-- Vùng màu cam được đối xử như một Danger Zone thực thụ: bất kỳ điểm nào nằm trong hành lang cam đều là Nguy Hiểm,
-- buộc hệ thống tìm Safe Spot bước ngang thoát hoàn toàn ra ngoài quỹ đạo đạn (Side-Step Escape).

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local geometry = require("@routes/DungeonQuest/core/hazardScanner/geometry")
local timerVisual = require("@routes/DungeonQuest/core/hazardScanner/timerVisual")

local RunService = services.RunService or game:GetService("RunService")
local player = services.player

--// Table
local trajectory = {}

--// State
local enabled = false
local data = nil
local predictionLength = 45 -- studs (chiều dài dải visual hiển thị quỹ đạo đạn)
local customLengths = {
	["secondbossmovingbeam"] = 80,
}
local customWidths = {
	["firstbossbigspike"] = 28,
	["firstbossseekingspikes"] = 10,
}
local activeRecords = {} -- [hazardInfo] = { ad = BoxHandleAdornment, mainPart = BasePart, connections = {}, lastPos = Vector3, lastClock = number, velocity = Vector3, dir = Vector3, isMoving = boolean }
local heartbeatConnection = nil

--// Constants
local FADE_TRANSPARENCY_THRESHOLD = 0.85
local TRAJECTORY_COLOR = Color3.fromRGB(255, 140, 0) -- Màu cam nổi bật
local TRAJECTORY_TRANSPARENCY = 0.65
local GROUND_THICKNESS = 0.20
local MOVING_SPEED_THRESHOLD = 3.5 -- studs/s (ngưỡng tốc độ để coi là đang di chuyển)

--// Danh sách các Projectile đặc biệt tự động xác định Trajectory ngay lập tức khi xuất hiện (Frame 0)
--// Modes:
--//   "target_player" (hoặc true): Hướng thẳng từ vị trí projectile tới người chơi tại thời điểm spawn
--//   "look_vector": Hướng theo LookVector của CFrame projectile lúc spawn
local INSTANT_PROJECTILES = {
	["firstbossseekingspikes"] = "look_vector",
	["firstbossbigspike"] = "look_vector",
	["firstbossbeampart"] = "look_vector",
	["secondbossmovingbeam"] = "look_vector",
}

--// Helper nhận diện tia định hướng telegraph (firstBossBeamPart)
local function isBeamTelegraph(hazardName)
	if not hazardName or type(hazardName) ~= "string" then return false end
	local clean = hazardName:lower():gsub("%s+", "")
	return string.find(clean, "firstbossbeampart", 1, true) ~= nil
end

--// Phân loại tia beam thuộc Big Spike hay Seeking Spike
local function getSpikeBeamType(inst)
	if not inst then return "seeking_spike" end
	local name = typeof(inst) == "string" and inst or (inst.Name or "")
	local clean = name:lower():gsub("%s+", "")
	if not string.find(clean, "firstbossbeampart", 1, true) then
		if string.find(clean, "bigspike", 1, true) and not string.find(clean, "seekingspike", 1, true) then
			return "big_spike"
		end
		if string.find(clean, "seekingspike", 1, true) then
			return "seeking_spike"
		end
		return nil
	end

	if typeof(inst) == "Instance" then
		local beam = inst:FindFirstChildWhichIsA("Beam", true)
		if beam then
			if beam.Width0 >= 25 or beam.Width1 >= 25 then
				return "big_spike"
			else
				return "seeking_spike"
			end
		end

		local bPos = inst:IsA("BasePart") and inst.Position or (inst:IsA("Model") and inst:GetPivot().Position)
		if bPos then
			for _, child in ipairs(workspace:GetChildren()) do
				local cName = child.Name:lower():gsub("%s+", "")
				if string.find(cName, "firstbossbigspike", 1, true) then
					local sPos = child:IsA("BasePart") and child.Position or (child:IsA("Model") and child:GetPivot().Position)
					if sPos and (sPos - bPos).Magnitude < 15 then
						return "big_spike"
					end
				elseif string.find(cName, "seekingspike", 1, true) then
					local sPos = child:IsA("BasePart") and child.Position or (child:IsA("Model") and child:GetPivot().Position)
					if sPos and (sPos - bPos).Magnitude < 15 then
						return "seeking_spike"
					end
				end
			end
		end
	end

	return "seeking_spike"
end

--// Helper nhận diện skill BigSpike (Boss 1 - gồm cả tia telegraph và đạn)
local function isBigSpike(hazardName, inst)
	if not hazardName or type(hazardName) ~= "string" then return false end
	local clean = hazardName:lower():gsub("%s+", "")
	if #clean == 0 or string.find(clean, "seekingspike", 1, true) then return false end
	if string.find(clean, "firstbossbeampart", 1, true) then
		return getSpikeBeamType(inst) == "big_spike"
	end
	return string.find(clean, "firstbossbigspike", 1, true) ~= nil
		or string.find(clean, "bigspike", 1, true) ~= nil
end

--// Helper nhận diện skill SeekingSpike (Boss 1 - gồm cả tia telegraph và đạn)
local function isSeekingSpike(hazardName, inst)
	if not hazardName or type(hazardName) ~= "string" then return false end
	local clean = hazardName:lower():gsub("%s+", "")
	if #clean == 0 or string.find(clean, "firstbossbigspike", 1, true) then return false end
	if string.find(clean, "firstbossbeampart", 1, true) then
		return getSpikeBeamType(inst) == "seeking_spike"
	end
	return string.find(clean, "firstbossseekingspikes", 1, true) ~= nil
		or string.find(clean, "seekingspike", 1, true) ~= nil
end

--// Helper nhận diện chung chiêu Spike của Boss 1 (BigSpike hoặc SeekingSpike)
local function isBossSpike(hazardName, inst)
	return isBigSpike(hazardName, inst) or isSeekingSpike(hazardName, inst)
end

--// Đọc chính xác dữ liệu từ tia định hướng do Game tạo (firstBossBeamPart)
--// Trích xuất: độ dài beam (khoảng cách tới Attachment2), hướng bay LookVector, điểm xuất phát và điểm đích
local function getTelegraphBeamData(inst)
	if not inst or not inst.Parent then return nil, nil, nil, nil end

	local beamPart = nil
	local instName = (inst.Name or ""):lower()
	if isBeamTelegraph(instName) then
		beamPart = inst:IsA("BasePart") and inst or inst:FindFirstChildWhichIsA("BasePart")
	end

	-- Nếu inst là spike hoặc chưa có beamPart: tìm beamPart lân cận trong workspace
	if not beamPart then
		local spikePos = inst:IsA("BasePart") and inst.Position or (inst:IsA("Model") and inst:GetPivot().Position)
		if spikePos then
			local bestDist = 35.0
			local expectedType = isBigSpike(inst.Name, inst) and "big_spike" or "seeking_spike"
			for _, child in ipairs(workspace:GetChildren()) do
				local cName = child.Name:lower()
				if isBeamTelegraph(cName) or string.find(cName, "beampart", 1, true) then
					if getSpikeBeamType(child) == expectedType then
						local bPos = child:IsA("BasePart") and child.Position or (child:IsA("Model") and child:GetPivot().Position)
						if bPos then
							local dist = (bPos - spikePos).Magnitude
							if dist < bestDist then
								bestDist = dist
								beamPart = child
							end
						end
					end
				end
			end
		end
	end

	if not beamPart then return nil, nil, nil, nil end

	local att2 = beamPart:FindFirstChild("Attachment2", true)
	if not att2 or not att2:IsA("Attachment") then
		for _, desc in ipairs(beamPart:GetDescendants()) do
			if desc:IsA("Attachment") and desc.Name ~= "Attachment0" and desc.Name ~= "Attachment1" then
				att2 = desc
				break
			end
		end
	end

	local bPos = beamPart.Position
	local targetWorldPos = att2 and att2.WorldPosition

	if targetWorldPos and bPos then
		local delta = targetWorldPos - bPos
		local hDelta = Vector3.new(delta.X, 0, delta.Z)
		local length = hDelta.Magnitude
		if length > 5 then
			local dir = hDelta.Unit
			return length, dir, bPos, targetWorldPos
		end
	end

	return nil, nil, nil, nil
end
local findBigSpikeBeamTelegraph = getTelegraphBeamData

--// Đo đạc kích thước bao quát thực tế của Spike (tính cả toàn bộ Descendant Parts và SpecialMesh Scale)
local function measureSpikeDimensions(inst)
	if not inst then return nil end
	local maxDimX, maxDimY, maxDimZ = 0, 0, 0
	local parts = {}
	if inst:IsA("BasePart") then
		table.insert(parts, inst)
	else
		for _, desc in ipairs(inst:GetDescendants()) do
			if desc:IsA("BasePart") then
				table.insert(parts, desc)
			end
		end
	end

	for _, p in ipairs(parts) do
		local sz = p.Size
		local mesh = p:FindFirstChildWhichIsA("SpecialMesh", true)
		if mesh then
			sz = Vector3.new(sz.X * math.abs(mesh.Scale.X), sz.Y * math.abs(mesh.Scale.Y), sz.Z * math.abs(mesh.Scale.Z))
		end
		maxDimX = math.max(maxDimX, sz.X)
		maxDimY = math.max(maxDimY, sz.Y)
		maxDimZ = math.max(maxDimZ, sz.Z)
	end

	if maxDimX <= 0 and maxDimY <= 0 and maxDimZ <= 0 then
		return nil
	end

	local dims = { maxDimX, maxDimY, maxDimZ }
	table.sort(dims)
	local w = dims[2]
	if w < 2.0 then
		w = math.max(dims[1], dims[2])
	end
	return w
end

--// Tính bề rộng thực tế của chính BasePart firstBossBigSpike
local cachedBigSpikeWidth = nil
local function getBigSpikeWidth(mainPart)
	-- 1. Ưu tiên cấu hình custom width từ slider / user
	if customWidths["firstbossbigspike"] then
		return customWidths["firstbossbigspike"]
	end

	-- 2. Nếu đã cache kích thước trước đó
	if cachedBigSpikeWidth then
		return cachedBigSpikeWidth
	end

	-- 3. Đo đạc từ instance thực tế trong workspace
	if mainPart and not isBeamTelegraph(mainPart.Name) then
		local w = measureSpikeDimensions(mainPart)
		if w and w >= 4.0 then
			cachedBigSpikeWidth = math.clamp(w, 8.0, 60.0)
			return cachedBigSpikeWidth
		end
	end

	-- Hoặc tìm live spike trong workspace
	for _, child in ipairs(workspace:GetChildren()) do
		local cName = child.Name:lower()
		if string.find(cName, "firstbossbigspike", 1, true) or (string.find(cName, "bigspike", 1, true) and not string.find(cName, "seekingspike", 1, true) and not isBeamTelegraph(cName)) then
			local w = measureSpikeDimensions(child)
			if w and w >= 4.0 then
				cachedBigSpikeWidth = math.clamp(w, 8.0, 60.0)
				return cachedBigSpikeWidth
			end
		end
	end

	-- 4. Đọc từ ReplicatedStorage.enemyProjectiles.firstBossBigSpike
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local ep = ReplicatedStorage:FindFirstChild("enemyProjectiles")
	local tmpl = ep and ep:FindFirstChild("firstBossBigSpike")
	if tmpl then
		local w = measureSpikeDimensions(tmpl)
		if w and w >= 4.0 then
			cachedBigSpikeWidth = math.clamp(w, 8.0, 60.0)
			return cachedBigSpikeWidth
		end
	end

	return 28.0
end

--// Tính bề rộng thực tế của chính BasePart firstBossSeekingSpikes
local cachedSeekingSpikeWidth = nil
local function getSeekingSpikeWidth(mainPart)
	-- 1. Ưu tiên cấu hình custom width từ slider / user
	if customWidths["firstbossseekingspikes"] then
		return customWidths["firstbossseekingspikes"]
	end

	-- 2. Nếu đã cache kích thước trước đó
	if cachedSeekingSpikeWidth then
		return cachedSeekingSpikeWidth
	end

	-- 3. Đo đạc từ instance thực tế trong workspace
	if mainPart and not isBeamTelegraph(mainPart.Name) then
		local w = measureSpikeDimensions(mainPart)
		if w and w >= 2.0 then
			cachedSeekingSpikeWidth = math.clamp(w, 4.0, 40.0)
			return cachedSeekingSpikeWidth
		end
	end

	-- Hoặc tìm live spike trong workspace
	for _, child in ipairs(workspace:GetChildren()) do
		local cName = child.Name:lower():gsub("%s+", "")
		if string.find(cName, "seekingspike", 1, true) and not isBeamTelegraph(cName) then
			local w = measureSpikeDimensions(child)
			if w and w >= 2.0 then
				cachedSeekingSpikeWidth = math.clamp(w, 4.0, 40.0)
				return cachedSeekingSpikeWidth
			end
		end
	end

	-- 4. Đọc từ ReplicatedStorage.enemyProjectiles.firstBossSeekingSpikes
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local ep = ReplicatedStorage:FindFirstChild("enemyProjectiles")
	local tmpl = ep and ep:FindFirstChild("firstBossSeekingSpikes")
	if tmpl then
		local w = measureSpikeDimensions(tmpl)
		if w and w >= 2.0 then
			cachedSeekingSpikeWidth = math.clamp(w, 4.0, 40.0)
			return cachedSeekingSpikeWidth
		end
	end

	return 10.0
end

local function getBossSpikeWidth(hazardName, mainPart)
	if isBigSpike(hazardName, mainPart) then
		return getBigSpikeWidth(mainPart)
	else
		return getSeekingSpikeWidth(mainPart)
	end
end

--// Lấy độ dài trajectory (mặc định hoặc custom theo đối tượng / theo tia định hướng của game)
local function getHazardPredictionLength(hazardInfoOrName)
	if not hazardInfoOrName then return predictionLength end
	local name = ""
	local record = nil
	if type(hazardInfoOrName) == "string" then
		name = hazardInfoOrName
	elseif type(hazardInfoOrName) == "table" then
		name = hazardInfoOrName.Name or (hazardInfoOrName.Instance and hazardInfoOrName.Instance.Name) or ""
		record = activeRecords[hazardInfoOrName]
	end

	-- Nếu là Boss Spike (Big Spike hoặc Seeking Spike): ưu tiên số 1 là độ dài thực tế từ tia định hướng của game
	local inst = (record and record.mainPart) or (type(hazardInfoOrName) == "table" and hazardInfoOrName.Instance)
	if isBossSpike(name, inst) then
		if record and record.beamLength then
			return record.beamLength
		end
		if isBigSpike(name, inst) then
			return customLengths["firstbossbigspike"] or 140.0
		else
			return customLengths["firstbossseekingspikes"] or 80.0
		end
	end

	if record and record.beamLength then
		return record.beamLength
	end

	local clean = name:lower():gsub("%s+", "")
	if customLengths[clean] then
		return customLengths[clean]
	end
	for k, v in pairs(customLengths) do
		if string.find(clean, k, 1, true) then
			return v
		end
	end
	return predictionLength
end

--// Lấy vị trí người chơi
local function getPlayerPosition()
	local char = player and player.Character
	if not char then return nil end
	local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
	if not root then return nil end
	return root.Position
end

--// Tính hướng bay ngay lập tức tại Frame 0 nếu hazard nằm trong danh sách INSTANT_PROJECTILES
local function getInstantDirection(hazardName, mainPart)
	if not hazardName or not mainPart then return nil, nil end
	local clean = hazardName:lower():gsub("%s+", "")
	local mode = INSTANT_PROJECTILES[clean]
	if not mode then
		for name, m in pairs(INSTANT_PROJECTILES) do
			if string.find(clean, name, 1, true) then
				mode = m
				break
			end
		end
	end
	if not mode then return nil, nil end

	if mode == "look_vector" then
		local lv = mainPart.CFrame.LookVector
		local hDir = Vector3.new(lv.X, 0, lv.Z)
		if hDir.Magnitude > 0.01 then
			return hDir.Unit, mode
		end
	else
		-- "target_player" / true: Hướng thẳng từ projectile tới player
		local pPos = getPlayerPosition()
		if pPos then
			local diff = pPos - mainPart.Position
			local hDiff = Vector3.new(diff.X, 0, diff.Z)
			if hDiff.Magnitude > 0.1 then
				return hDiff.Unit, mode
			end
		end
		local lv = mainPart.CFrame.LookVector
		local hDir = Vector3.new(lv.X, 0, lv.Z)
		if hDir.Magnitude > 0.01 then
			return hDir.Unit, mode
		end
	end
	return nil, nil
end

--// Lấy độ cao mặt sàn theo chân người chơi
local function getPlayerGroundY()
	local char = player and player.Character
	if not char then return nil end
	local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
	if not root then return nil end
	return root.Position.Y - 2.5
end

--// Gán data source từ detection (tránh circular dependency)
function trajectory.BindDetection(dataSource)
	data = dataSource or nil
end

function trajectory.IsEnabled()
	return enabled
end

function trajectory.GetPredictionLength()
	return predictionLength
end

function trajectory.SetPredictionLength(val)
	if type(val) == "number" and val > 0 then
		predictionLength = math.clamp(val, 10, 200)
		trajectory.RefreshAll()
	end
end

function trajectory.GetHazardPredictionLength(hazardNameOrInfo)
	return getHazardPredictionLength(hazardNameOrInfo)
end

function trajectory.GetCustomLength(key)
	if not key then return nil end
	local clean = key:lower():gsub("%s+", "")
	return customLengths[clean]
end

function trajectory.SetCustomLength(key, val)
	if not key then return end
	local clean = key:lower():gsub("%s+", "")
	if type(val) == "number" and val > 0 then
		customLengths[clean] = math.clamp(val, 10, 300)
	else
		customLengths[clean] = nil
	end
	trajectory.RefreshAll()
end

function trajectory.GetSecondBossBeamLength()
	return customLengths["secondbossmovingbeam"] or 80
end

function trajectory.SetSecondBossBeamLength(val)
	trajectory.SetCustomLength("secondbossmovingbeam", val)
end

function trajectory.GetFirstBossBigSpikeWidth()
	return customWidths["firstbossbigspike"] or 28
end

function trajectory.SetFirstBossBigSpikeWidth(val)
	if type(val) == "number" and val > 0 then
		customWidths["firstbossbigspike"] = math.clamp(val, 6, 60)
	else
		customWidths["firstbossbigspike"] = nil
	end
	cachedBigSpikeWidth = nil
	trajectory.RefreshAll()
end

function trajectory.GetFirstBossSeekingSpikeWidth()
	return customWidths["firstbossseekingspikes"] or (cachedSeekingSpikeWidth or 10)
end

function trajectory.SetFirstBossSeekingSpikeWidth(val)
	if type(val) == "number" and val > 0 then
		customWidths["firstbossseekingspikes"] = math.clamp(val, 4, 40)
	else
		customWidths["firstbossseekingspikes"] = nil
	end
	cachedSeekingSpikeWidth = nil
	trajectory.RefreshAll()
end

function trajectory.GetCustomWidth(key)
	if not key then return nil end
	local clean = key:lower():gsub("%s+", "")
	return customWidths[clean]
end

function trajectory.SetCustomWidth(key, val)
	if not key then return end
	local clean = key:lower():gsub("%s+", "")
	if type(val) == "number" and val > 0 then
		customWidths[clean] = math.clamp(val, 4, 100)
	else
		customWidths[clean] = nil
	end
	trajectory.RefreshAll()
end

function trajectory.IsHazardMoving(hazardInfo)
	if not hazardInfo then return false end
	local record = activeRecords[hazardInfo]
	return record and record.isMoving == true
end

function trajectory.GetHazardDirection(hazardInfo)
	if not hazardInfo then return nil end
	local record = activeRecords[hazardInfo]
	return record and record.dir or nil
end

--// Tính trọng tâm (Centroid) và Độ rộng bao quát thực tế (Span Width) vuông góc với hướng di chuyển
--// Sử dụng định lý chiếu OBB (Separating Axis Theorem): chiếu chính xác 3 trục của từng Part lên vector pháp tuyến normal
local function getHazardCentroidAndSpan(hazardInfo, dir)
	local inst = hazardInfo.Instance
	if not inst or not inst.Parent then return nil, 4 end

	local margin = geometry.GetTrajectoryMargin and geometry.GetTrajectoryMargin() or 2.0
	local hazardName = hazardInfo.Name or (inst and inst.Name) or ""

	if isBossSpike(hazardName, inst) then
		local record = activeRecords[hazardInfo]
		local mainPart = (record and record.mainPart) or (inst:IsA("BasePart") and inst or inst.PrimaryPart or inst:FindFirstChildWhichIsA("BasePart"))
		local startPos = (record and record.beamStartPos) or (mainPart and mainPart.Position) or inst.Position
		local spikeWidth = getBossSpikeWidth(hazardName, mainPart)
		local spanWidth = math.max(1, spikeWidth + margin * 2)
		return Vector3.new(startPos.X, 0, startPos.Z), spanWidth
	end

	local parts = {}
	local forceCircle = geometry.IsForceCircle and geometry.IsForceCircle(hazardName)

	if inst:IsA("BasePart") then
		if inst.Transparency <= FADE_TRANSPARENCY_THRESHOLD then
			table.insert(parts, inst)
		end
	else
		for _, desc in ipairs(inst:GetDescendants()) do
			if desc:IsA("BasePart") and desc.Parent and desc.Transparency <= FADE_TRANSPARENCY_THRESHOLD then
				table.insert(parts, desc)
			end
		end
	end

	if #parts == 0 then return nil, 4 end

	-- Vector pháp tuyến vuông góc với hướng bay trên mặt sàn X-Z: normal = (-dir.Z, 0, dir.X)
	local normal = Vector3.new(-dir.Z, 0, dir.X)
	local minProjN, maxProjN = math.huge, -math.huge
	local sumProjU = 0

	for _, p in ipairs(parts) do
		local pos = p.Position
		local s = p.Size

		-- Bán kính chiếu nửa bề rộng (Half-extent) lên vector normal
		local halfExtent = 0
		if forceCircle or (p:IsA("Part") and (p.Shape == Enum.PartType.Ball or p.Shape == Enum.PartType.Cylinder)) then
			halfExtent = math.max(s.X, s.Y, s.Z) / 2
		else
			-- Định lý chiếu OBB khi bay thẳng: r = hx * |Right . n| + hy * |Up . n| + hz * |Look . n|
			local cf = p.CFrame
			local rx = cf.RightVector
			local ry = cf.UpVector
			local rz = cf.LookVector
			local hx = s.X / 2
			local hy = s.Y / 2
			local hz = s.Z / 2
			halfExtent = hx * math.abs(rx.X * normal.X + rx.Z * normal.Z)
				+ hy * math.abs(ry.X * normal.X + ry.Z * normal.Z)
				+ hz * math.abs(rz.X * normal.X + rz.Z * normal.Z)
		end

		local projN = pos.X * normal.X + pos.Z * normal.Z
		minProjN = math.min(minProjN, projN - halfExtent)
		maxProjN = math.max(maxProjN, projN + halfExtent)

		local projU = pos.X * dir.X + pos.Z * dir.Z
		sumProjU += projU
	end

	-- Bề rộng chuẩn xác = (max - min) + 2 * margin (khớp 100% với Blue Danger Zone)
	local spanWidth = math.max(1, (maxProjN - minProjN) + margin * 2)

	-- Tọa độ trung tâm chiếu: trung điểm khoảng cách trên trục normal và trung bình trên trục dir
	local centerN = (minProjN + maxProjN) / 2
	local centerU = sumProjU / #parts

	-- Tái lập vector tọa độ tâm trong không gian thế giới
	local centerBase = dir * centerU + normal * centerN

	return centerBase, spanWidth
end

--// Cập nhật vị trí và góc xoay của dải quỹ đạo màu cam đối xứng hoàn hảo
local function updateTrajectoryCFrame(ad, mainPart, centroid, dir, targetY, length, width)
	if not mainPart or not mainPart.Parent or not ad or not ad.Parent then return end

	-- Tâm của dải quỹ đạo bắt đầu từ trọng tâm toàn hazard và kéo dài về phía trước (centroid + dir * (length / 2))
	local halfLength = length / 2
	local centerPos = Vector3.new(
		centroid.X + dir.X * halfLength,
		targetY or centroid.Y,
		centroid.Z + dir.Z * halfLength
	)

	-- LookAt theo hướng di chuyển dir
	local targetLook = centerPos + Vector3.new(dir.X, 0, dir.Z)
	local desiredWorldCFrame = CFrame.lookAt(centerPos, targetLook)

	ad.CFrame = (ad.Adornee == workspace.Terrain) and desiredWorldCFrame or mainPart.CFrame:ToObjectSpace(desiredWorldCFrame)
	ad.Size = Vector3.new(width, GROUND_THICKNESS, length)
	if not ad.Visible then ad.Visible = true end
end

--// Vòng lặp Heartbeat: theo dõi hướng di chuyển và ghim dải quỹ đạo tĩnh
local function onHeartbeat()
	if not enabled then return end
	local hasAny = false
	local now = os.clock()
	local targetY = getPlayerGroundY()

	for info, record in pairs(activeRecords) do
		local inst = info.Instance
		if not inst or not inst.Parent then
			trajectory.DetachTrajectoryVisuals(info)
		else
			hasAny = true
			local mainPart = record.mainPart
			local hazardName = info.Name or (inst and inst.Name)
			local isChasing = timerVisual and timerVisual.IsChasingProjectile and timerVisual.IsChasingProjectile(hazardName)

			if isChasing then
				if record.ad and record.ad.Visible then
					record.ad.Visible = false
				end
				record.isMoving = false
				info.IsTrajectory = false
			elseif mainPart and mainPart.Parent then
				local currentPos = mainPart.Position
				local dt = now - (record.lastClock or now)

				if record.isBossSpike then
					if not record.beamFound then
						local bLen, bDir, bStart, bTarget = getTelegraphBeamData(mainPart)
						if bLen and bDir then
							record.beamFound = true
							record.beamLength = bLen
							record.beamDir = bDir
							record.beamStartPos = bStart
							record.beamTargetPos = bTarget
							record.dir = bDir
						end
					end
					if record.beamDir then
						record.dir = record.beamDir
					end
					record.isMoving = true
				end

				-- Cập nhật hướng di chuyển định kỳ (mỗi ~0.035s)
				if dt >= 0.035 then
					local delta = currentPos - (record.lastPos or currentPos)
					local speed = delta.Magnitude / dt
					local hDelta = Vector3.new(delta.X, 0, delta.Z)
					local hSpeed = hDelta.Magnitude / dt
					local wasMoving = record.isMoving == true

					if hSpeed >= MOVING_SPEED_THRESHOLD then
						record.isMoving = true
						if not record.isBossSpike then
							record.dir = hDelta.Unit
						end
					else
						if not record.isInstant and not record.isBossSpike and dt >= 0.25 and speed < MOVING_SPEED_THRESHOLD then
							record.isMoving = false
						end
					end

					if record.isMoving ~= wasMoving then
						info.IsTrajectory = record.isMoving
						info.HazardZones = nil
						if data and data.UpdateHazardVisualColor then
							pcall(data.UpdateHazardVisualColor, info, record.isMoving)
						end
						local visualizer = require("@routes/DungeonQuest/core/hazardScanner/visualizer")
						if visualizer and visualizer.UpdateHazardVisualColor then
							pcall(visualizer.UpdateHazardVisualColor, info, record.isMoving)
						end
					end

					record.lastPos = currentPos
					record.lastClock = now
				end

				-- Nếu đang di chuyển hoặc là Instant Projectile có hướng, cập nhật visual quỹ đạo tĩnh theo predictionLength / custom length
				if record.isMoving and record.dir and record.ad then
					local centroid, spanWidth = getHazardCentroidAndSpan(info, record.dir)
					if centroid then
						local hLength = getHazardPredictionLength(info)
						updateTrajectoryCFrame(record.ad, mainPart, centroid, record.dir, targetY, hLength, spanWidth)
					end
				else
					if record.ad and record.ad.Visible then
						record.ad.Visible = false
					end
				end
			end
		end
	end

	if not hasAny and heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
end

local function ensureHeartbeat()
	if not heartbeatConnection and enabled then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

--// Gỡ visual quỹ đạo của một hazard
function trajectory.DetachTrajectoryVisuals(hazardInfo)
	if not hazardInfo then return end
	local record = activeRecords[hazardInfo]
	if not record then return end

	if record.ad then
		pcall(function() record.ad:Destroy() end)
		record.ad = nil
	end

	if record.connections then
		for _, c in ipairs(record.connections) do
			pcall(function() c:Disconnect() end)
		end
		table.clear(record.connections)
	end

	activeRecords[hazardInfo] = nil
end

--// Gắn visual quỹ đạo cho một hazard
function trajectory.AttachTrajectoryVisuals(hazardInfo)
	if not enabled or not hazardInfo then return end
	if activeRecords[hazardInfo] then
		trajectory.DetachTrajectoryVisuals(hazardInfo)
	end

	local inst = hazardInfo.Instance
	if not inst or not inst.Parent then return end

	local hazardName = hazardInfo.Name or (inst and inst.Name)
	if timerVisual and timerVisual.IsChasingProjectile and timerVisual.IsChasingProjectile(hazardName) then
		-- Chasing Projectile: tuyệt đối không sinh ra hành lang Trajectory cam
		hazardInfo.IsTrajectory = false
		return
	end

	local mainPart = nil
	if inst:IsA("BasePart") then
		mainPart = inst
	else
		mainPart = inst.PrimaryPart or inst:FindFirstChildWhichIsA("BasePart")
		if not mainPart then
			for _, desc in ipairs(inst:GetDescendants()) do
				if desc:IsA("BasePart") and desc.Parent then
					mainPart = desc
					break
				end
			end
		end
	end

	if not mainPart or not mainPart.Parent then return end

	local hLength = getHazardPredictionLength(hazardInfo)
	local box = Instance.new("BoxHandleAdornment")
	box.Name = "HazardTrajectoryCorridor"
	box.Adornee = workspace.Terrain
	box.Size = Vector3.new(4, GROUND_THICKNESS, hLength)
	box.Color3 = TRAJECTORY_COLOR
	box.Transparency = TRAJECTORY_TRANSPARENCY
	box.ZIndex = 1 -- Nằm dưới đĩa đỏ (ZIndex = 2)
	box.AlwaysOnTop = true
	box.Visible = false -- Tạm ẩn cho đến khi có hướng
	box.Parent = workspace.Terrain

	local hazardName = hazardInfo.Name or (inst and inst.Name)
	local isBeam = isBeamTelegraph(hazardName)
	local isSpike = isBossSpike(hazardName, inst)
	local spikeType = isSpike and (isBigSpike(hazardName, inst) and "big_spike" or "seeking_spike") or nil

	-- Tránh tạo 2 hành lang cam trùng lặp giữa Beam và Spike:
	-- Nếu Beam đã tạo hành lang, Spike không tạo hành lang thứ 2 (và ngược lại)
	if isSpike then
		if not isBeam then
			-- inst là Spike thực tế: kiểm tra xem Beam của nó đã tạo corridor chưa
			for otherInfo, otherRecord in pairs(activeRecords) do
				if otherRecord and otherRecord.isBeam and otherRecord.spikeType == spikeType then
					otherRecord.linkedSpike = mainPart
					hazardInfo.IsTrajectory = false
					return
				end
			end
		else
			-- inst là Beam: kiểm tra xem Spike đã tạo corridor chưa
			for otherInfo, otherRecord in pairs(activeRecords) do
				if otherRecord and not otherRecord.isBeam and otherRecord.spikeType == spikeType then
					hazardInfo.IsTrajectory = false
					return
				end
			end
		end
	end

	local connections = {}
	if not isBeam then
		local conn = mainPart:GetPropertyChangedSignal("Transparency"):Connect(function()
			if mainPart.Parent and mainPart.Transparency > FADE_TRANSPARENCY_THRESHOLD then
				pcall(function() box:Destroy() end)
			end
		end)
		table.insert(connections, conn)
	end

	local record = nil
	local conn2 = mainPart.AncestryChanged:Connect(function(_, parent)
		if not parent then
			if record and record.linkedSpike and record.linkedSpike.Parent and record.linkedSpike.Transparency <= FADE_TRANSPARENCY_THRESHOLD then
				local sConn = record.linkedSpike.AncestryChanged:Connect(function(_, spParent)
					if not spParent then
						pcall(function() box:Destroy() end)
					end
				end)
				table.insert(connections, sConn)
				return
			end
			pcall(function() box:Destroy() end)
		end
	end)
	table.insert(connections, conn2)

	-- Kiểm tra xem đối tượng có thuộc danh sách Instant Projectiles (tự lock-on hướng tại Frame 0) không
	local instantDir, instantMode = getInstantDirection(hazardName, mainPart)
	local isInstant = instantDir ~= nil

	local beamLength, beamDir, beamStartPos, beamTargetPos = nil, nil, nil, nil
	if isSpike then
		beamLength, beamDir, beamStartPos, beamTargetPos = getTelegraphBeamData(inst)
		if beamDir then
			instantDir = beamDir
			isInstant = true
		end
	end

	record = {
		ad = box,
		connections = connections,
		mainPart = mainPart,
		lastPos = mainPart.Position,
		lastClock = os.clock(),
		velocity = Vector3.zero,
		dir = instantDir,
		isMoving = isInstant,
		isInstant = isInstant,
		instantMode = instantMode,
		isBossSpike = isSpike,
		isBigSpike = isBigSpike(hazardName, inst),
		isSeekingSpike = isSeekingSpike(hazardName, inst),
		spikeType = spikeType,
		isBeam = isBeam,
		beamFound = beamLength ~= nil,
		beamLength = beamLength,
		beamDir = beamDir,
		beamStartPos = beamStartPos or mainPart.Position,
		beamTargetPos = beamTargetPos,
		linkedSpike = nil,
	}

	if isBeam and spikeType then
		local spikeKeyword = spikeType == "big_spike" and "firstbossbigspike" or "seekingspike"
		for _, child in ipairs(workspace:GetChildren()) do
			local cName = child.Name:lower():gsub("%s+", "")
			if string.find(cName, spikeKeyword, 1, true) and not isBeamTelegraph(cName) then
				local sPart = child:IsA("BasePart") and child or (child:FindFirstChildWhichIsA("BasePart") or (child:IsA("Model") and child.PrimaryPart))
				if sPart then
					local dist = (sPart.Position - mainPart.Position).Magnitude
					if dist < 25 then
						record.linkedSpike = sPart
						break
					end
				end
			end
		end
	end

	activeRecords[hazardInfo] = record

	-- Nếu là Instant Projectile: Kích hoạt ngay lập tức tại Frame 0 không cần chờ đo vận tốc
	if isInstant and instantDir then
		hazardInfo.IsTrajectory = true
		hazardInfo.HazardZones = nil
		local targetY = getPlayerGroundY()
		local centroid, spanWidth = getHazardCentroidAndSpan(hazardInfo, instantDir)
		local currentHLength = getHazardPredictionLength(hazardInfo)
		if centroid then
			updateTrajectoryCFrame(box, mainPart, centroid, instantDir, targetY, currentHLength, spanWidth)
		end
		if data and data.UpdateHazardVisualColor then
			pcall(data.UpdateHazardVisualColor, hazardInfo, true)
		end
		local visualizer = require("@routes/DungeonQuest/core/hazardScanner/visualizer")
		if visualizer and visualizer.UpdateHazardVisualColor then
			pcall(visualizer.UpdateHazardVisualColor, hazardInfo, true)
		end
		local timerVisual = require("@routes/DungeonQuest/core/hazardScanner/timerVisual")
		if timerVisual and timerVisual.UpdateHazardVisualColor then
			pcall(timerVisual.UpdateHazardVisualColor, hazardInfo, true)
		end
	end

	ensureHeartbeat()
end

--// Xóa toàn bộ visual quỹ đạo
function trajectory.ClearAll()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	for info in pairs(activeRecords) do
		trajectory.DetachTrajectoryVisuals(info)
	end
	table.clear(activeRecords)
end

--// Refresh lại toàn bộ visual quỹ đạo
function trajectory.RefreshAll()
	trajectory.ClearAll()
	if not enabled or not data then return end

	for _, info in pairs(data.GetActiveHazardsMap()) do
		trajectory.AttachTrajectoryVisuals(info)
	end
end

--// Kiểm tra xem điểm P (hoặc vòng tròn bán kính extraRadius) có đang nằm trong hành lang nguy hiểm màu cam hay không.
--// Lấy danh sách các Trajectory Records nằm trong phạm vi maxRadius xung quanh origin (Broad-Phase Spatial Culling)
function trajectory.GetNearbyTrajectories(origin, maxRadius)
	maxRadius = maxRadius or 65
	local nearby = {}
	local ox, oz = origin.X, origin.Z

	for info, record in pairs(activeRecords) do
		if record.isMoving and record.dir and record.mainPart and record.mainPart.Parent then
			local centroid, spanWidth = getHazardCentroidAndSpan(info, record.dir)
			if centroid and spanWidth then
				local hLength = getHazardPredictionLength(info)
				local cx = centroid.X
				local cz = centroid.Z
				local dx = ox - cx
				local dz = oz - cz
				local distSq = dx * dx + dz * dz
				local totalReach = maxRadius + hLength + (spanWidth / 2)
				if distSq <= totalReach * totalReach then
					table.insert(nearby, { info = info, record = record })
				end
			end
		end
	end

	return nearby
end

--// Kiểm tra xem điểm P (hoặc vòng tròn bán kính extraRadius) có đang nằm trong hành lang nguy hiểm màu cam hay không.
--// Đối xử vùng màu cam như một Danger Zone thực thụ: Bất kỳ điểm nào giao thoa với vùng cam đều là NGUY HIỂM.
function trajectory.IsPointInAnyTrajectory(point, extraRadius, trajectoryList)
	local px, pz = point.X, point.Z
	extraRadius = extraRadius or 0

	-- Bề dày phủ lùi về phía sau centroid để ôm trọn cả thân thanh Beam (Cyan)
	local BACK_DEPTH = 3.0

	if trajectoryList then
		for _, item in ipairs(trajectoryList) do
			local info = item.info
			local record = item.record
			if record and record.isMoving and record.dir and record.mainPart and record.mainPart.Parent then
				local centroid, spanWidth = getHazardCentroidAndSpan(info, record.dir)
				if centroid and spanWidth then
					local hLength = getHazardPredictionLength(info)
					local dir = record.dir
					local normal = Vector3.new(-dir.Z, 0, dir.X)
					local vx = px - centroid.X
					local vz = pz - centroid.Z

					local projU = vx * dir.X + vz * dir.Z
					local projN = vx * normal.X + vz * normal.Z
					local halfWidth = spanWidth / 2

					local minU = -BACK_DEPTH
					local maxU = hLength

					if extraRadius <= 0 then
						if projU >= minU and projU <= maxU and math.abs(projN) <= halfWidth then
							return true, info, dir, centroid, spanWidth
						end
					else
						local dU = 0
						if projU < minU then
							dU = minU - projU
						elseif projU > maxU then
							dU = projU - maxU
						end
						local dN = math.max(0, math.abs(projN) - halfWidth)
						if (dU * dU + dN * dN) <= (extraRadius * extraRadius) then
							return true, info, dir, centroid, spanWidth
						end
					end
				end
			end
		end
		return false, nil, nil, nil, nil
	end

	for info, record in pairs(activeRecords) do
		if record.isMoving and record.dir and record.mainPart and record.mainPart.Parent then
			local centroid, spanWidth = getHazardCentroidAndSpan(info, record.dir)
			if centroid and spanWidth then
				local hLength = getHazardPredictionLength(info)
				local dir = record.dir
				local normal = Vector3.new(-dir.Z, 0, dir.X)
				local vx = px - centroid.X
				local vz = pz - centroid.Z

				-- Chiếu tọa độ điểm P lên trục di chuyển U và trục pháp tuyến N
				local projU = vx * dir.X + vz * dir.Z
				local projN = vx * normal.X + vz * normal.Z
				local halfWidth = spanWidth / 2

				local minU = -BACK_DEPTH
				local maxU = hLength

				-- Kiểm tra giao thoa hình học trực tiếp với dải hình hộp nguy hiểm (gồm cả thân thanh Cyan và dải Cam)
				if extraRadius <= 0 then
					if projU >= minU and projU <= maxU and math.abs(projN) <= halfWidth then
						return true, info, dir, centroid, spanWidth
					end
				else
					local dU = 0
					if projU < minU then
						dU = minU - projU
					elseif projU > maxU then
						dU = projU - maxU
					end
					local dN = math.max(0, math.abs(projN) - halfWidth)
					if (dU * dU + dN * dN) <= (extraRadius * extraRadius) then
						return true, info, dir, centroid, spanWidth
					end
				end
			end
		end
	end

	return false, nil, nil, nil, nil
end

--// Bật / tắt Trajectory Visualizer
function trajectory.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		trajectory.RefreshAll()
	else
		trajectory.ClearAll()
	end
end

--// Lắng nghe thay đổi padding để refresh visual
geometry.OnPaddingChanged(function()
	if enabled then
		trajectory.RefreshAll()
	end
end)

--// Dọn dẹp khi shutdown
lifecycle.Register(function()
	trajectory.ClearAll()
end)

return trajectory
