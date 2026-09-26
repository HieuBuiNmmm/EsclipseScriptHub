-- HazardScannerV2 - Threat Corridor Engine (Whitelist-Based)
-- Quản lý danh sách các skill có hành lang nguy hiểm (Threat Corridor) kéo dài đón đầu.
-- Cứ skill nào có tên trong danh sách thì tự động sinh hành lang màu cam chuẩn xác.

--// Imports
local filter = require("@routes/DungeonQuest/core/hazardScannerV2/filter")
local services = require("@routes/DungeonQuest/core/services")
local Players = game:GetService("Players")

--// Table
local corridor = {}

--// State
local corridorEnabled = true
local trackedCorridors = {} -- [Instance] = { fwd2D = Vector3, right2D = Vector3, yaw = number, velocityConfirmed = boolean, locked = boolean, lastBounceTime = number }

-- Helper lấy tọa độ nhân vật Player thời gian thực
local function getPlayerPos()
	local lp = (services and services.player) or Players.LocalPlayer
	local char = lp and lp.Character
	local root = char and (char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart)
	return root and root.Position or nil
end

-- Danh sách cấu hình Threat Corridor theo tên chuẩn hóa (lowercase, không khoảng trắng)
-- CHỈ bao gồm đúng các skill do người dùng yêu cầu:
-- Boss 1: firstBossCrissCross, firstBossSeekingSpikes, firstBossBigSpike
-- Boss 2: secondBossMovingBeam, secondBossGreenOrb, secondBossYellowOrb, secondBossRedOrb
-- Boss 3: thirdBossMissile, thirdBossBouncingOrb
-- Bonus Boss: bonusBossBouncingOrb
local CORRIDOR_SKILLS = {
	-- BOSS 1
	["firstbossbigspike"] = {
		name = "Boss 1 Big Spike",
		length = 120,
		width = 28,
		mode = "look_vector",
	},
	["firstbossseekingspikes"] = {
		name = "Boss 1 Seeking Spikes",
		length = 85,
		width = 10,
		mode = "look_vector",
	},
	["firstbosscrisscross"] = {
		name = "Boss 1 Criss Cross",
		length = 80,
		width = 8,
		mode = "look_vector",
	},

	-- BOSS 2
	["secondbossmovingbeam"] = {
		name = "Boss 2 Moving Beam",
		length = 80,
		width = 35,
		mode = "heading_or_look",
	},
	["secondbossgreenorb"] = {
		name = "Boss 2 Green Orb",
		length = 25,
		width = 10,
		mode = "homing_player",
	},
	["secondbossyelloworb"] = {
		name = "Boss 2 Yellow Orb",
		length = 25,
		width = 10,
		mode = "homing_player",
	},
	["secondbossredorb"] = {
		name = "Boss 2 Red Orb",
		length = 25,
		width = 10,
		mode = "homing_player",
	},

	-- BOSS 3
	["thirdbossmissile"] = {
		name = "Boss 3 Missile",
		length = 90,
		width = 8,
		mode = "heading_or_look",
	},
	["thirdbossbouncingorb"] = {
		name = "Boss 3 Bouncing Orb",
		length = 30,
		width = 10,
		mode = "bouncing",
	},

	-- BONUS BOSS
	["bonusbossbouncingorbbad"] = {
		name = "Bonus Boss Bouncing Orb Bad",
		length = 30,
		width = 10,
		mode = "bouncing",
	},
	["bonusbossbouncingorb"] = {
		name = "Bonus Boss Bouncing Orb",
		length = 30,
		width = 10,
		mode = "bouncing",
	},
}

-- Chuẩn hóa chuỗi (chữ thường, xóa dấu cách)
local function cleanString(str)
	if not str then return "" end
	return tostring(str):lower():gsub("%s+", "")
end

-- Lấy cấu hình Threat Corridor của 1 instance hoặc tên
function corridor.GetConfig(nameOrInstance)
	if not nameOrInstance then return nil end
	local name = typeof(nameOrInstance) == "Instance" and nameOrInstance.Name or tostring(nameOrInstance)
	local clean = cleanString(name)
	if #clean > 0 then
		for key, cfg in pairs(CORRIDOR_SKILLS) do
			if string.find(clean, key, 1, true) then
				return cfg, key
			end
		end
	end

	-- Duyệt toàn bộ tổ tiên (ancestors) lên tới Workspace/game
	if typeof(nameOrInstance) == "Instance" then
		local cur = nameOrInstance.Parent
		while cur and cur ~= workspace and cur ~= game do
			local pClean = cleanString(cur.Name)
			if #pClean > 0 then
				for key, cfg in pairs(CORRIDOR_SKILLS) do
					if string.find(pClean, key, 1, true) then
						return cfg, key
					end
				end
			end
			cur = cur.Parent
		end
	end

	return nil
end

-- Kiểm tra xem đối tượng có nằm trong danh sách Threat Corridor hay không
function corridor.IsCorridorSkill(nameOrInstance)
	return corridor.GetConfig(nameOrInstance) ~= nil
end

-- Đăng ký thêm skill mới vào danh sách
function corridor.RegisterSkill(key, config)
	if not key or type(config) ~= "table" then return end
	local cleanKey = cleanString(key)
	CORRIDOR_SKILLS[cleanKey] = {
		name = config.name or key,
		length = config.length or 60,
		width = config.width or 10,
		mode = config.mode or "look_vector",
	}
end

-- Hủy đăng ký một skill
function corridor.UnregisterSkill(key)
	if not key then return end
	local cleanKey = cleanString(key)
	CORRIDOR_SKILLS[cleanKey] = nil
end

-- Lấy toàn bộ danh sách cấu hình
function corridor.GetConfigMap()
	return CORRIDOR_SKILLS
end

-- Bật / tắt tính năng Threat Corridor
function corridor.SetEnabled(state)
	corridorEnabled = state and true or false
end

function corridor.IsEnabled()
	return corridorEnabled
end

-- Xóa bản ghi khóa hướng của 1 part/model khi despawn
function corridor.RemoveRecord(inst)
	if inst then
		trackedCorridors[inst] = nil
	end
end

-- Xóa toàn bộ bản ghi khóa hướng
function corridor.ClearAll()
	table.clear(trackedCorridors)
end

-- Helper tìm Model secondBossMovingBeam nếu part là con/hậu duệ
local function getMovingBeamModel(inst)
	if not inst then return nil end
	local cur = inst:IsA("Model") and inst or inst.Parent
	while cur and cur ~= workspace and cur ~= game do
		local pClean = cleanString(cur.Name)
		if (pClean:find("movingbeam", 1, true) or pClean:find("secondbossmovingbeam", 1, true)) and cur:IsA("Model") then
			return cur
		end
		cur = cur.Parent
	end
	return nil
end

-- Tìm duy nhất 1 part đại diện hợp lệ cho Model secondBossMovingBeam
local function getMovingBeamRepresentativePart(model)
	if not model then return nil end
	-- 1. Nếu PrimaryPart là một hazard part hợp lệ, ưu tiên PrimaryPart
	if model.PrimaryPart and filter.IsHazardPart(model.PrimaryPart, model) then
		return model.PrimaryPart
	end
	-- 2. Tìm BasePart đầu tiên trong Model thỏa mãn là hazard part hợp lệ (Neon, Transparency <= 0.85)
	for _, desc in ipairs(model:GetDescendants()) do
		if desc:IsA("BasePart") and filter.IsHazardPart(desc, model) then
			return desc
		end
	end
	-- 3. Dự phòng bất kỳ BasePart nào có trong Model
	return model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
end

-- Lấy độ rộng trực tiếp từ Ground Visualizer (shapeData) để Threat Corridor đồng bộ hoàn hảo 1:1
-- và triệt tiêu hoàn toàn hiện tượng dao động / rung lắc khi đạn xoay tròn trong không gian
local function getGroundVisualizerWidth(shapeData, cfg, modelSize)
	local baseWidth = (cfg and cfg.width) or 10
	local gWidth = 0

	if shapeData then
		-- 1. Nếu Ground Visualizer là Circle AOE hoặc có bán kính (Orb, Ball, Big Spike...):
		-- Đường kính Ground Visualizer = radius * 2
		if shapeData.radius and shapeData.radius > 0 then
			gWidth = shapeData.radius * 2
		-- 2. Nếu Ground Visualizer là Planar Box OBB (Moving Beam, Missile, Spikes, CrissCross...):
		-- Bề ngang Ground Visualizer = (halfWidth hoặc halfX) * 2
		elseif shapeData.halfWidth and shapeData.halfWidth > 0 then
			gWidth = shapeData.halfWidth * 2
		elseif shapeData.halfX and shapeData.halfX > 0 then
			gWidth = shapeData.halfX * 2
		-- 3. Trường hợp MultiRing:
		elseif shapeData.maxRadius and shapeData.maxRadius > 0 then
			gWidth = shapeData.maxRadius * 2
		elseif shapeData.coreRadius and shapeData.coreRadius > 0 then
			gWidth = shapeData.coreRadius * 2
		end
	end

	-- Đối với Model nhiều part (như secondBossMovingBeam)
	if modelSize then
		local mSpan = math.max(modelSize.X, modelSize.Z)
		if mSpan > gWidth then
			gWidth = mSpan
		end
	end

	-- Đảm bảo không nhỏ hơn baseWidth cấu hình và trong giới hạn an toàn tối đa 120 studs
	return math.clamp(math.max(baseWidth, gWidth), baseWidth, 120.0)
end

-- Tính toán hình học Threat Corridor cho Parent Model tổng thể (secondBossMovingBeam)
local function computeMovingBeamModelCorridor(model, repPart, shapeData, motionRecord, cfg)
	local ok, modelCF, modelSize = pcall(function()
		return model:GetBoundingBox()
	end)
	if not ok or not modelCF or not modelSize then
		modelCF = repPart.CFrame
		modelSize = repPart.Size
	end

	local startX = modelCF.Position.X
	local startZ = modelCF.Position.Z

	-- Hướng di chuyển và khóa hướng (tracked trên Model)
	local tracked = trackedCorridors[model]
	local fwd2D = nil
	local right2D = nil
	local yaw = nil

	if tracked and tracked.locked then
		fwd2D = tracked.fwd2D
		right2D = tracked.right2D
		yaw = tracked.yaw

		-- Nếu ban đầu khóa hướng Frame 0 trước khi kịp di chuyển,
		-- nay bắt đầu chuyển động tịnh tiến rõ rệt (speed >= 1.0 studs/s):
		-- Cập nhật 1 lần duy nhất theo vector vận tốc thực tế của thanh beam
		if not tracked.velocityConfirmed and motionRecord and motionRecord.speed and motionRecord.speed >= 1.0 and motionRecord.headingDir and motionRecord.headingDir.Magnitude > 0.1 then
			fwd2D = Vector3.new(motionRecord.headingDir.X, 0, motionRecord.headingDir.Z).Unit
			right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
			yaw = math.deg(math.atan2(fwd2D.X, -fwd2D.Z))
			tracked.fwd2D = fwd2D
			tracked.right2D = right2D
			tracked.yaw = yaw
			tracked.velocityConfirmed = true
		end
	else
		-- KHÓA HƯỚNG LẦN ĐẦU TIÊN (FRAME 0 LOCK CHO MODEL):
		-- 1. Ưu tiên vector vận tốc tịnh tiến nếu đã di chuyển
		if motionRecord and motionRecord.speed and motionRecord.speed >= 1.0 and motionRecord.headingDir and motionRecord.headingDir.Magnitude > 0.1 then
			fwd2D = Vector3.new(motionRecord.headingDir.X, 0, motionRecord.headingDir.Z).Unit
			right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
			yaw = math.deg(math.atan2(fwd2D.X, -fwd2D.Z))
			tracked = {
				fwd2D = fwd2D,
				right2D = right2D,
				yaw = yaw,
				velocityConfirmed = true,
				locked = true,
			}
		-- 2. Ưu tiên hướng fwd2D & right2D do shapeData đã tính toán (Section 3 Planar OBB)
		elseif shapeData and shapeData.fwd2D and shapeData.right2D and shapeData.fwd2D.Magnitude > 0.1 then
			fwd2D = shapeData.fwd2D.Unit
			right2D = shapeData.right2D.Unit
			yaw = shapeData.yaw or math.deg(math.atan2(fwd2D.X, -fwd2D.Z))
			tracked = {
				fwd2D = fwd2D,
				right2D = right2D,
				yaw = yaw,
				velocityConfirmed = false,
				locked = true,
			}
		-- 3. Fallback theo LookVector của CFrame Model
		else
			local lv = modelCF.LookVector
			local hLv = Vector3.new(lv.X, 0, lv.Z)
			if hLv.Magnitude > 0.01 then
				fwd2D = hLv.Unit
			else
				fwd2D = Vector3.new(0, 0, -1)
			end
			right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
			yaw = math.deg(math.atan2(fwd2D.X, -fwd2D.Z))
			tracked = {
				fwd2D = fwd2D,
				right2D = right2D,
				yaw = yaw,
				velocityConfirmed = false,
				locked = true,
			}
		end

		trackedCorridors[model] = tracked
	end

	-- Bề ngang bao quát toàn bộ Model của beam (Lấy trực tiếp từ Ground Visualizer / Model)
	local width = getGroundVisualizerWidth(shapeData, cfg, modelSize)

	local length = cfg.length or 80
	local halfLen = length / 2
	local centerX = startX + fwd2D.X * halfLen
	local centerZ = startZ + fwd2D.Z * halfLen
	local endX = startX + fwd2D.X * length
	local endZ = startZ + fwd2D.Z * length

	return {
		skillKey = cleanString(model.Name),
		name = cfg.name or "Boss 2 Moving Beam",
		length = length,
		width = width,
		fwd2D = fwd2D,
		right2D = right2D,
		startX = startX,
		startZ = startZ,
		centerX = centerX,
		centerZ = centerZ,
		endX = endX,
		endZ = endZ,
		yaw = yaw,
		isModelCorridor = true,
		model = model,
	}
end

-- Tính toán hình học Threat Corridor cho Part
function corridor.ComputeCorridor(part, shapeData, motionRecord)
	if not corridorEnabled or not part or not part:IsA("BasePart") or not shapeData then
		return nil
	end

	local cfg = corridor.GetConfig(part)
	if not cfg then
		return nil
	end

	-- NGOẠI LỆ CHO MOVING BEAM:
	-- secondBossMovingBeam là một Model chứa rất nhiều Part nhỏ bên trong.
	-- Ta CHỈ vẽ Threat Corridor duy nhất 1 lần theo Parent Model tổng thể (secondBossMovingBeam).
	-- Mọi part con anh em khác đều trả về nil để không vẽ đè/lệch corridor.
	local beamModel = getMovingBeamModel(part)
	if beamModel then
		local repPart = getMovingBeamRepresentativePart(beamModel)
		if part ~= repPart then
			return nil
		end
		return computeMovingBeamModelCorridor(beamModel, repPart, shapeData, motionRecord, cfg)
	end

	-- NGOẠI LỆ CHO HOMING PLAYER ORBS (secondBossGreenOrb / YellowOrb / RedOrb):
	-- Kỹ năng này luôn dí theo Player, vì vậy Threat Corridor luôn luôn chĩa thẳng về phía nhân vật Player theo thời gian thực.
	-- KHÔNG khóa cứng hướng (không dùng Frame 0 Lock) và giữ nguyên chiều dài cố định (không dùng Dynamic Length).
	if cfg.mode == "homing_player" then
		local pPos = getPlayerPos()
		if pPos then
			local toPlayer2D = Vector3.new(pPos.X - shapeData.x, 0, pPos.Z - shapeData.z)
			if toPlayer2D.Magnitude > 0.5 then
				fwd2D = toPlayer2D.Unit
			end
		end

		if not fwd2D then
			if motionRecord and motionRecord.headingDir and motionRecord.headingDir.Magnitude > 0.1 then
				fwd2D = Vector3.new(motionRecord.headingDir.X, 0, motionRecord.headingDir.Z).Unit
			else
				local lv = part.CFrame.LookVector
				local hLv = Vector3.new(lv.X, 0, lv.Z)
				fwd2D = hLv.Magnitude > 0.01 and hLv.Unit or Vector3.new(0, 0, -1)
			end
		end

		right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
		yaw = math.deg(math.atan2(fwd2D.X, -fwd2D.Z))
		trackedCorridors[part] = {
			fwd2D = fwd2D,
			right2D = right2D,
			yaw = yaw,
			velocityConfirmed = true,
			locked = false,
		}

		local length = cfg.length or 25
		local width = getGroundVisualizerWidth(shapeData, cfg)

		local startX = shapeData.x
		local startZ = shapeData.z
		local halfLen = length / 2
		local centerX = startX + fwd2D.X * halfLen
		local centerZ = startZ + fwd2D.Z * halfLen
		local endX = startX + fwd2D.X * length
		local endZ = startZ + fwd2D.Z * length

		return {
			skillKey = cleanString(part.Name),
			name = cfg.name,
			length = length,
			width = width,
			fwd2D = fwd2D,
			right2D = right2D,
			startX = startX,
			startZ = startZ,
			centerX = centerX,
			centerZ = centerZ,
			endX = endX,
			endZ = endZ,
			yaw = yaw,
		}
	end

	local tracked = trackedCorridors[part]
	local fwd2D = nil
	local right2D = nil
	local yaw = nil

	if tracked and tracked.locked then
		fwd2D = tracked.fwd2D
		right2D = tracked.right2D
		yaw = tracked.yaw

		-- Nếu ban đầu khóa bằng LookVector lúc chưa kịp di chuyển (Frame 0),
		-- nay bắt đầu chuyển động tịnh tiến tuyến tính rõ rệt (speed >= 1.0 studs/s):
		-- Cập nhật theo vector vận tốc thực tế rồi chốt chặt
		if motionRecord and motionRecord.speed and motionRecord.speed >= 1.0 and motionRecord.headingDir and motionRecord.headingDir.Magnitude > 0.1 then
			-- Tự động đảo chiều nếu phát hiện hướng bay thực tế ngược chiều với fwd2D (Dot < -0.3)
			if fwd2D:Dot(motionRecord.headingDir) < -0.3 then
				fwd2D = Vector3.new(motionRecord.headingDir.X, 0, motionRecord.headingDir.Z).Unit
				right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
				yaw = math.deg(math.atan2(fwd2D.X, -fwd2D.Z))
				tracked.fwd2D = fwd2D
				tracked.right2D = right2D
				tracked.yaw = yaw
				tracked.velocityConfirmed = true
			elseif not tracked.velocityConfirmed then
				fwd2D = Vector3.new(motionRecord.headingDir.X, 0, motionRecord.headingDir.Z).Unit
				right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
				yaw = math.deg(math.atan2(fwd2D.X, -fwd2D.Z))
				tracked.fwd2D = fwd2D
				tracked.right2D = right2D
				tracked.yaw = yaw
				tracked.velocityConfirmed = true
			end
		end

		-- Xử lý riêng cho Bouncing Orb: Nếu vừa nảy vào tường đổi hướng (Dot product giữa vận tốc mới và hướng cũ < 0.70)
		if cfg.mode == "bouncing" and motionRecord and motionRecord.speed and motionRecord.speed >= 1.0 and motionRecord.headingDir and motionRecord.headingDir.Magnitude > 0.1 then
			local newHeading = Vector3.new(motionRecord.headingDir.X, 0, motionRecord.headingDir.Z).Unit
			local now = os.clock()
			local lastBounce = tracked.lastBounceTime or 0

			-- Kiểm tra xem vector vận tốc mới có bị bẻ góc (Dot < 0.70 tương đương góc lệch > 45 độ hoặc nảy ngược)
			if fwd2D:Dot(newHeading) < 0.70 and (now - lastBounce) > 0.20 then
				fwd2D = newHeading
				right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
				yaw = math.deg(math.atan2(fwd2D.X, -fwd2D.Z))
				tracked.fwd2D = fwd2D
				tracked.right2D = right2D
				tracked.yaw = yaw
				tracked.lastBounceTime = now
				tracked.velocityConfirmed = true
			end
		end
	else
		-- KHÓA HƯỚNG LẦN ĐẦU TIÊN (FRAME 0 DIRECTION LOCK):
		-- 1. Ưu tiên vector vận tốc tịnh tiến nếu đã chuyển động (dựa trên Position nên tuyệt đối không bị xoay tròn theo mesh)
		if motionRecord and motionRecord.speed and motionRecord.speed >= 1.0 and motionRecord.headingDir and motionRecord.headingDir.Magnitude > 0.1 then
			fwd2D = Vector3.new(motionRecord.headingDir.X, 0, motionRecord.headingDir.Z).Unit
			tracked = {
				fwd2D = fwd2D,
				right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X),
				yaw = math.deg(math.atan2(fwd2D.X, -fwd2D.Z)),
				velocityConfirmed = true,
				locked = true,
			}
		-- 2. Nếu shapeData đã tính sẵn fwd2D và right2D (ví dụ: movingBeam hoặc planar box do analyzer tính riêng)
		elseif shapeData.fwd2D and shapeData.right2D and shapeData.fwd2D.Magnitude > 0.1 then
			fwd2D = shapeData.fwd2D.Unit
			right2D = shapeData.right2D.Unit
			tracked = {
				fwd2D = fwd2D,
				right2D = right2D,
				yaw = shapeData.yaw or math.deg(math.atan2(fwd2D.X, -fwd2D.Z)),
				velocityConfirmed = false,
				locked = true,
			}
		else
			-- 3. Khóa cố định theo CFrame.LookVector tại thời điểm Frame 0 lúc vừa spawn
			local cf = part.CFrame
			local lv = cf.LookVector
			local hLv = Vector3.new(lv.X, 0, lv.Z)
			if hLv.Magnitude > 0.01 then
				fwd2D = hLv.Unit
			elseif motionRecord and motionRecord.headingDir and motionRecord.headingDir.Magnitude > 0.1 then
				fwd2D = Vector3.new(motionRecord.headingDir.X, 0, motionRecord.headingDir.Z).Unit
			else
				fwd2D = Vector3.new(0, 0, -1)
			end
			tracked = {
				fwd2D = fwd2D,
				right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X),
				yaw = math.deg(math.atan2(fwd2D.X, -fwd2D.Z)),
				velocityConfirmed = false,
				locked = true,
			}
		end

		right2D = tracked.right2D
		yaw = tracked.yaw
		trackedCorridors[part] = tracked
	end

	-- Kích thước hành lang (Lấy trực tiếp từ Ground Visualizer, không rung lắc khi đạn xoay)
	local length = cfg.length or 60
	local width = getGroundVisualizerWidth(shapeData, cfg)

	local startX = shapeData.x
	local startZ = shapeData.z
	local halfLen = length / 2
	local centerX = startX + fwd2D.X * halfLen
	local centerZ = startZ + fwd2D.Z * halfLen
	local endX = startX + fwd2D.X * length
	local endZ = startZ + fwd2D.Z * length

	return {
		skillKey = cleanString(part.Name),
		name = cfg.name,
		length = length,
		width = width,
		fwd2D = fwd2D,
		right2D = right2D,
		startX = startX,
		startZ = startZ,
		centerX = centerX,
		centerZ = centerZ,
		endX = endX,
		endZ = endZ,
		yaw = yaw,
	}
end

-- Vận tốc mặc định (studs/s) cho các skill có Threat Corridor (nếu motion chưa kịp đo đạc)
local DEFAULT_CORRIDOR_SPEEDS = {
	["firstbossbigspike"] = 28.0,
	["firstbossseekingspikes"] = 32.0,
	["firstbosscrisscross"] = 30.0,
	["secondbossmovingbeam"] = 18.0,
	["secondbossgreenorb"] = 22.0,
	["secondbossyelloworb"] = 22.0,
	["secondbossredorb"] = 22.0,
	["thirdbossmissile"] = 35.0,
	["thirdbossbouncingorb"] = 25.0,
	["bonusbossbouncingorb"] = 25.0,
	["bonusbossbouncingorbbad"] = 25.0,
}

-- Lấy vận tốc bay thực tế hoặc mặc định của đạn trong hành lang
function corridor.GetProjectileSpeed(corridorData, motionRecord)
	if motionRecord and motionRecord.speed and motionRecord.speed >= 3.0 then
		return motionRecord.speed
	end
	if corridorData and corridorData.skillKey then
		for key, spd in pairs(DEFAULT_CORRIDOR_SPEEDS) do
			if string.find(corridorData.skillKey, key, 1, true) then
				return spd
			end
		end
	end
	return 28.0
end

-- Trích xuất các chỉ số thời gian & khoảng cách thực tế giữa một điểm (hoặc nhân vật) với đạn đang lao tới:
-- Trả về:
-- 1. isInsideGeom: có nằm trong hình học bao của hành lang không
-- 2. projU: khoảng cách dọc (longitudinal) từ đạn tới điểm (>0: đạn đang lao tới, <0: đạn đã bay qua)
-- 3. projN: khoảng cách ngang (lateral) từ tâm hành lang tới điểm (dương: lệch phải, âm: lệch trái)
-- 4. timeToImpact: thời gian (giây) đạn sẽ chạm tới mặt phẳng của điểm
-- 5. isImminent: mối nguy hiểm có CẬP KỀ không (đến ngưỡng khẩn cấp cần né, tránh "tàu cách 100km mà đã né")
-- 6. lateralEscapeDir: vector đơn vị thoát ngang tối ưu ra khỏi hành lang (vuông góc với hướng bay)
-- 7. lateralEscapeDist: cự ly cần bước ngang để thoát ra khỏi hành lang
function corridor.GetThreatMetrics(point, corridorData, motionRecord, extraRadius)
	if not point or not corridorData then
		return false, 0, 0, 999.0, false, Vector3.zero, 0
	end

	extraRadius = extraRadius or 0
	local px, pz = point.X, point.Z
	local vx = px - corridorData.startX
	local vz = pz - corridorData.startZ

	local fwd = corridorData.fwd2D
	local right = corridorData.right2D
	local halfWidth = (corridorData.width / 2) + extraRadius

	local projU = vx * fwd.X + vz * fwd.Z
	local projN = vx * right.X + vz * right.Z

	local minU = -2.5
	local maxU = corridorData.length + extraRadius

	local isInsideGeom = (projU >= minU and projU <= maxU and math.abs(projN) <= halfWidth)
	if not isInsideGeom and extraRadius > 0 then
		local dU = 0
		if projU < minU then
			dU = minU - projU
		elseif projU > maxU then
			dU = projU - maxU
		end
		local dN = math.max(0, math.abs(projN) - (corridorData.width / 2))
		if (dU * dU + dN * dN) <= (extraRadius * extraRadius) then
			isInsideGeom = true
		end
	end

	local speed = corridor.GetProjectileSpeed(corridorData, motionRecord)
	local distAhead = math.max(0, projU)
	local timeToImpact = (speed > 0.1) and (distAhead / speed) or 999.0

	-- Cự ly cần thoát ngang khỏi mép hành lang
	local distToEdge = math.max(0, (corridorData.width / 2) - math.abs(projN))
	local lateralEscapeDist = distToEdge + 2.5

	-- Vector thoát ngang tối ưu (vuông góc với hướng bay của hành lang)
	local lateralEscapeDir
	if projN >= 0 then
		lateralEscapeDir = right
	else
		lateralEscapeDir = -right
	end

	-- Ngưỡng thời gian / khoảng cách phản xạ khẩn cấp (Imminent Lead):
	-- Ước tính với tốc độ chạy của Player ~18 studs/s
	local escapeTime = lateralEscapeDist / 18.0
	local leadTimeThreshold = math.clamp(escapeTime + 0.35, 0.85, 1.40)
	local leadDistThreshold = math.max(22.0, speed * leadTimeThreshold)

	-- Threat được coi là IMMINENT nếu:
	-- 1. Điểm nằm trong hình học bao của hành lang
	-- 2. Đạn chưa bay qua khỏi người chơi (projU >= minU)
	-- 3. Thời gian chạm đích <= leadTimeThreshold HOẶC cự ly phía trước <= leadDistThreshold
	local isImminent = isInsideGeom and (projU >= minU) and (timeToImpact <= leadTimeThreshold or projU <= leadDistThreshold)

	return isInsideGeom, projU, projN, timeToImpact, isImminent, lateralEscapeDir, lateralEscapeDist
end

-- Kiểm tra xem điểm này có đang gặp nguy hiểm CẬP KỀ (Imminent Threat) từ Threat Corridor không
function corridor.IsThreatImminent(point, corridorData, motionRecord, extraRadius)
	local _, _, _, _, isImminent = corridor.GetThreatMetrics(point, corridorData, motionRecord, extraRadius)
	return isImminent
end

-- Kiểm tra xem điểm này có nằm trên đường đạn sắp bay tới không (dùng để cấm Safe Spot trên đường ray)
function corridor.IsPointInThreatPath(point, corridorData, extraRadius)
	if not point or not corridorData then return false end
	extraRadius = extraRadius or 0
	local px, pz = point.X, point.Z
	local vx = px - corridorData.startX
	local vz = pz - corridorData.startZ
	local fwd = corridorData.fwd2D
	local right = corridorData.right2D
	local halfWidth = (corridorData.width / 2) + extraRadius

	local projU = vx * fwd.X + vz * fwd.Z
	local projN = vx * right.X + vz * right.Z

	-- Chỉ tính vùng PHÍA TRƯỚC đạn (từ đạn trở đi)
	local minU = -2.5
	local maxU = corridorData.length + extraRadius

	if extraRadius <= 0 then
		return (projU >= minU and projU <= maxU and math.abs(projN) <= halfWidth)
	else
		local dU = 0
		if projU < minU then
			dU = minU - projU
		elseif projU > maxU then
			dU = projU - maxU
		end
		local dN = math.max(0, math.abs(projN) - (corridorData.width / 2))
		return (dU * dU + dN * dN) <= (extraRadius * extraRadius)
	end
end

-- Kiểm tra xem 1 điểm (hoặc vòng tròn bán kính extraRadius) có nằm trong Threat Corridor hay không
function corridor.IsPointInCorridor(point, corridorData, extraRadius)
	if not point or not corridorData then return false end
	extraRadius = extraRadius or 0

	local px, pz = point.X, point.Z
	local vx = px - corridorData.startX
	local vz = pz - corridorData.startZ

	local fwd = corridorData.fwd2D
	local right = corridorData.right2D
	local halfWidth = corridorData.width / 2

	-- Chiếu lên trục U (dọc theo hướng bay) và trục N (vuông góc hướng bay)
	local projU = vx * fwd.X + vz * fwd.Z
	local projN = vx * right.X + vz * right.Z

	-- Phủ lùi nhẹ 2.5 studs về sau điểm gốc để bao trọn đuôi đạn
	local minU = -2.5
	local maxU = corridorData.length

	if extraRadius <= 0 then
		return (projU >= minU and projU <= maxU and math.abs(projN) <= halfWidth)
	else
		local dU = 0
		if projU < minU then
			dU = minU - projU
		elseif projU > maxU then
			dU = projU - maxU
		end
		local dN = math.max(0, math.abs(projN) - halfWidth)
		return (dU * dU + dN * dN) <= (extraRadius * extraRadius)
	end
end

return corridor
