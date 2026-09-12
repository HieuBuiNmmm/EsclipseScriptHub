-- Smart Dodge – Module 1: Threat Detection Engine (DungeonQuest).
-- Chuyên trách: quét Workspace Depth 1, nhận diện hiểm họa (Neon / ngoại lệ), khóa quỹ đạo
-- projectile, SelectionBox ESP, hành lang quỹ đạo cảnh báo, registry tên skill player.
-- State riêng: activeHazards, lockedProjectiles, activeTrajectoryVisuals, các flag debug.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local macLib = require("@packages/Maclib")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local skillTimingManager = require("@routes/DungeonQuest/core/smartDodge/skillTimingManager")

--// Lazy require Module Geometry (tránh vòng phụ thuộc: geometry đọc data detection qua lazy quay lại)
local geometryRef
local function getGeometry()
	if not geometryRef then
		geometryRef = require("@routes/DungeonQuest/core/smartDodge/geometry")
	end
	return geometryRef
end

--// References
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local player = services.player

--// Table
local detection = {}

--// State
local threatDetectorEnabled = false
local logHazards = false
local visualEspEnabled = true
local showSkillTimers = true
local autoLearnSkillLifetimes = true
local activeHazards = {} -- [Instance] = { Name, Class, Position, Distance, NeonCount, Connections, ActiveParts, Highlight, Caster, CasterHumanoid, TimerBillboard, TimerLabel, TimerStroke }
local hazardCount = 0
local hazardChangedCallbacks = {}
local lastHazardInfo = nil
local connections = {}
local sharedCleanups = {}

--// Bảng cơ sở dữ liệu thời gian sống học được từ các kỹ năng (Skill Lifetime Profiler)
local skillProfiles = {} -- [string skillName] = { count = number, avgLifetime = number, minLifetime = number, maxLifetime = number }

--// Các mốc thời gian sống chuẩn mặc định của kỹ năng Boss trong Dungeon Quest (giây): { hitDelay, totalLifetime }
local KNOWN_SKILL_LIFETIMES = {
	["smallIceSpikes"] = { hitDelay = 0.8, totalLifetime = 1.2 },
	["mediumIceSpikes"] = { hitDelay = 1.1, totalLifetime = 1.5 },
	["largeIceSpikes"] = { hitDelay = 1.4, totalLifetime = 1.8 },
	["thirdBossMultiRings"] = { hitDelay = 2.0, totalLifetime = 2.8 },
	["firstBossCrissCross"] = { hitDelay = 1.6, totalLifetime = 2.2 },
	["firstBossSeekingSpikes"] = { hitDelay = 1.8, totalLifetime = 2.5 },
	["firstBossBigSpike"] = { hitDelay = 1.5, totalLifetime = 2.0 },
	["firstBossBeamPart"] = { hitDelay = 1.5, totalLifetime = 2.0 },
	["secondBossMovingBeam"] = { hitDelay = 0.0, totalLifetime = 3.5 },
	["secondbossyelloworb"] = { hitDelay = 0.0, totalLifetime = 4.0 },
	["secondbossredorb"] = { hitDelay = 0.0, totalLifetime = 4.0 },
	["secondbossgreenorb"] = { hitDelay = 0.0, totalLifetime = 4.0 },
	["secondbosscriclehitbox"] = { hitDelay = 0.4, totalLifetime = 2.5 },
	["secondbosscirclehitbox"] = { hitDelay = 0.4, totalLifetime = 2.5 },
	["secondBossCricleHitbox"] = { hitDelay = 0.4, totalLifetime = 2.5 },
	["secondBossCircleHitbox"] = { hitDelay = 0.4, totalLifetime = 2.5 },
}

local ignoredSkillNames = {
	["DodgeNode_ESP"] = true,
	["Enhanced Aura Ring"] = true,
	["EnhancedAuraRing"] = true,
	["Enhanced Aura"] = true,
	["EnhancedAura"] = true,
	["Aura Ring"] = true,
	["AuraRing"] = true,
	["AuraRingMesh"] = true,
	["groundAura"] = true,
	["GroundAura"] = true,
	["Ground Aura"] = true,
	["ground aura"] = true,
}

--// Danh sách các skill ngoại lệ (không dùng Material Neon, ví dụ có child precast bằng Plastic)
local CUSTOM_HAZARD_EXCEPTIONS = {
	["largeIceSpikes"] = true,
	["mediumIceSpikes"] = true,
	["smallIceSpikes"] = true,
	["thirdBossMultiRings"] = true,
	["thirdBossMissile"] = true,
	["thirdBossBeamPart"] = true,
	["firstBossCrissCross"] = true,
	["firstBossSeekingSpikes"] = true,
	["firstBossBigSpike"] = true,
	["firstBossBeamPart"] = true,
	["secondBossMovingBeam"] = true,
	["secondbossyelloworb"] = true,
	["secondbossredorb"] = true,
	["secondbossgreenorb"] = true,
	["secondBossCricleHitbox"] = true,
	["secondbosscriclehitbox"] = true,
	["secondBossCircleHitbox"] = true,
	["secondbosscirclehitbox"] = true,
}

--// Ngưỡng coi như chiêu đã mờ hoàn toàn/kết thúc
local FADE_TRANSPARENCY_THRESHOLD = 0.85

--// Danh sách các đối tượng Workspace cấp 1 cần bỏ qua
local IGNORED_NAMES = {
	["dungeon"] = true,
	["Dungeon"] = true,
	["Terrain"] = true,
	["Camera"] = true,
	["CurrentCamera"] = true,
	["RaycastIgnore"] = true,
	["Drops"] = true,
	["Loot"] = true,
	["DodgeNode_ESP"] = true,
	["SmartDodge_SafeMarker"] = true,
	["SmartDodge_SelectionBox"] = true,
	["SmartDodge_TrajectoryBox"] = true,
	["SmartDodge_CrystalGuideBox"] = true,
	["secondBossCrystals"] = true,
	["secondbosscrystals"] = true,
	["Enhanced Aura Ring"] = true,
	["EnhancedAuraRing"] = true,
	["Enhanced Aura"] = true,
	["EnhancedAura"] = true,
	["Aura Ring"] = true,
	["AuraRing"] = true,
	["groundAura"] = true,
	["GroundAura"] = true,
	["Ground Aura"] = true,
	["ground aura"] = true,
}

--// Cấu hình nhận diện Boss 2 Orbs (Northern Lands / Winter Outpost)
local BOSS_ORB_CONFIGS = {
	["secondbossyelloworb"] = {
		colorName = "yellow",
		color = Color3.fromRGB(255, 230, 0),
		surfaceColor = Color3.fromRGB(255, 215, 0),
	},
	["secondbossredorb"] = {
		colorName = "red",
		color = Color3.fromRGB(255, 45, 45),
		surfaceColor = Color3.fromRGB(255, 30, 30),
	},
	["secondbossgreenorb"] = {
		colorName = "green",
		color = Color3.fromRGB(50, 255, 50),
		surfaceColor = Color3.fromRGB(40, 220, 40),
	},
}

--// Cấu hình các kỹ năng Projectile dạng quỹ đạo bắn thẳng (Trajectory / Corridor Telegraph)
--// Lưu ý: dangerRadius ở đây chỉ là sàn an toàn tối thiểu (fallback floor). Hệ thống sẽ tự động
--// bóc tách kích thước thật (Beam.Width0, Mesh.Scale, Part.Size) qua Auto Dimension Detection.
local TRAJECTORY_PROJECTILE_CONFIGS = {
	["firstbosscrisscross"] = {
		name = "firstBossCrissCross",
		dangerRadius = 4.0,       -- Sàn an toàn tối thiểu (sẽ tự động mở rộng theo kích thước thật)
		maxLookahead = nil,       -- Tự động đo độ dài hoặc dùng trajectoryLookahead động
		visualColor = Color3.fromRGB(255, 130, 0), -- Màu cam cho quỹ đạo
	},
	["firstbossseekingspikes"] = {
		name = "firstBossSeekingSpikes",
		dangerRadius = 4.0,       -- Sàn an toàn tối thiểu
		maxLookahead = nil,       -- Chiều dài hành lang dự đoán
		visualColor = Color3.fromRGB(255, 110, 0), -- Màu cam đậm cho Seeking Spikes
	},
	["firstbossbigspike"] = {
		name = "firstBossBigSpike",
		dangerRadius = 20.0,      -- Beam.Width0 = 40 studs -> bán kính 20 studs (tổng bề rộng 40 studs)
		maxLookahead = 140.0,     -- Chiều dài hành lang dự đoán xuyên phòng
		visualColor = Color3.fromRGB(255, 130, 0), -- Màu cam cho Big Spike
	},
	["firstbossbeampart"] = {
		name = "firstBossBeamPart",
		dangerRadius = 20.0,      -- Beam.Width0 = 40 studs -> bán kính 20 studs (tổng bề rộng 40 studs)
		maxLookahead = 140.0,     -- Chiều dài hành lang dự đoán
		visualColor = Color3.fromRGB(255, 130, 0), -- Màu cam cho Beam Telegraph
	},
	["secondbossmovingbeam"] = {
		name = "secondBossMovingBeam",
		dangerRadius = 25.0,      -- Sàn an toàn nửa độ rộng sải ngang beam (tự động đọc sải ngang thật ~50 studs)
		maxLookahead = nil,       -- Dùng chung setting Tra lookahead length động (từ slider UI)
		visualColor = Color3.fromRGB(255, 130, 0), -- Màu cam cho Moving Beam
		isDynamicMoving = true,   -- Đánh dấu là Dynamic Moving Hazard (Tiếp cận 2)
	},
	["secondbossyelloworb"] = {
		name = "secondBossYellowOrb",
		dangerRadius = 5.0,       -- Bán kính vùng nguy hiểm cơ bản của Orb
		maxLookahead = 22.0,      -- Chiều dài hành lang dự đoán phía trước hướng di chuyển
		visualColor = Color3.fromRGB(255, 130, 0), -- Vùng màu cam cảnh báo quỹ đạo
		isDynamicMoving = true,
		isBossOrb = true,
		orbColorName = "yellow",
	},
	["secondbossredorb"] = {
		name = "secondBossRedOrb",
		dangerRadius = 5.0,
		maxLookahead = 22.0,
		visualColor = Color3.fromRGB(255, 130, 0),
		isDynamicMoving = true,
		isBossOrb = true,
		orbColorName = "red",
	},
	["secondbossgreenorb"] = {
		name = "secondBossGreenOrb",
		dangerRadius = 5.0,
		maxLookahead = 22.0,
		visualColor = Color3.fromRGB(255, 130, 0),
		isDynamicMoving = true,
		isBossOrb = true,
		orbColorName = "green",
	},
	["thirdbossmissile"] = {
		name = "thirdBossMissile",
		dangerRadius = 6.0,       -- Bán kính vùng nguy hiểm cơ bản (tự động đọc Beam/Part size)
		maxLookahead = 140.0,     -- Chiều dài hành lang dự đoán xuyên phòng
		visualColor = Color3.fromRGB(255, 130, 0), -- Màu cam cảnh báo quỹ đạo
	},
	["thirdbossbeampart"] = {
		name = "thirdBossBeamPart",
		dangerRadius = 6.0,
		maxLookahead = 140.0,
		visualColor = Color3.fromRGB(255, 130, 0),
	},
	["secondbosscriclehitbox"] = {
		name = "secondBossCricleHitbox",
		dangerRadius = 8.0,
		maxLookahead = 95.0,
		visualColor = Color3.fromRGB(255, 90, 0),
		isExpandingCone = true,
		expansionRate = 0.25,
	},
	["secondbosscirclehitbox"] = {
		name = "secondBossCircleHitbox",
		dangerRadius = 8.0,
		maxLookahead = 95.0,
		visualColor = Color3.fromRGB(255, 90, 0),
		isExpandingCone = true,
		expansionRate = 0.25,
	},
}

--// Cấu hình động cho hành lang quỹ đạo đạn (Trajectory Tuning)
local trajectoryLookahead = 50.0          -- Chiều dài hành lang dự đoán (mặc định 50 studs thay vì 300 để tránh tắc map)
local trajectoryWidthPadding = 2.5        -- Khoảng đệm nới rộng 2 bên sườn dựa trên kích thước thật của chiêu (studs)

--// Bảng lưu trữ trạng thái khóa hướng quỹ đạo (Direction Locking & State Tracking)
local lockedProjectiles = {} -- [BasePart] = { originPos, forward2D, dangerRadius, maxLookahead, locked, config }
local activeTrajectoryVisuals = {} -- [BasePart] = Part

--// Getters/Setters cho cấu hình Trajectory
detection.SetTrajectoryLookahead = function(val)
	if type(val) == "number" and val >= 10 then
		trajectoryLookahead = val
	end
end

detection.GetTrajectoryLookahead = function()
	return trajectoryLookahead
end

detection.SetTrajectoryWidthPadding = function(val)
	if type(val) == "number" and val >= 0 then
		trajectoryWidthPadding = val
	end
end

detection.GetTrajectoryWidthPadding = function()
	return trajectoryWidthPadding
end

--// Getters nội bộ cho geometry (tránh vòng phụ thuộc detection -> geometry: geometry đọc qua lazy require).
detection.GetActiveHazardsMap = function()
	return activeHazards
end

detection.GetLockedProjectiles = function()
	return lockedProjectiles
end

detection.GetFadeThreshold = function()
	return FADE_TRANSPARENCY_THRESHOLD
end

detection.IsEnabled = function()
	return threatDetectorEnabled
end

detection.SetEnabled = function(state)
	threatDetectorEnabled = state and true or false
end

--// Xóa toàn bộ visual quỹ đạo + lock data (dùng khi stop loop / shutdown)
detection.ClearTrajectoryVisuals = function()
	for part, vPart in pairs(activeTrajectoryVisuals) do
		pcall(function() vPart:Destroy() end)
	end
	table.clear(activeTrajectoryVisuals)
	table.clear(lockedProjectiles)
end

--// Thêm một Skill vào danh sách ngoại lệ
function detection.AddCustomHazard(skillName)
	if type(skillName) == "string" and #skillName > 0 then
		CUSTOM_HAZARD_EXCEPTIONS[skillName] = true
	end
end

--// Thêm một Skill vào danh sách Trajectory Projectile
function detection.AddTrajectoryProjectile(skillName, dangerRadius, maxLookahead)
	if type(skillName) == "string" and #skillName > 0 then
		local clean = skillName:lower():gsub("%s+", "")
		TRAJECTORY_PROJECTILE_CONFIGS[clean] = {
			name = skillName,
			dangerRadius = dangerRadius or 4.0,
			maxLookahead = maxLookahead,
			visualColor = Color3.fromRGB(255, 130, 0),
		}
		if logHazards then
			print(("[SmartDodge] 🚀 Registered Trajectory Projectile: %s"):format(skillName))
		end
	end
end

--// Kiểm tra xem part có thuộc cấu hình kỹ năng Trajectory hay không
local function getTrajectoryConfigForPart(part)
	if not part then return nil end
	local nameLower = part.Name:lower():gsub("%s+", "")
	if TRAJECTORY_PROJECTILE_CONFIGS[nameLower] then
		return TRAJECTORY_PROJECTILE_CONFIGS[nameLower]
	end
	if part.Parent and part.Parent:IsA("Model") then
		local parentLower = part.Parent.Name:lower():gsub("%s+", "")
		if TRAJECTORY_PROJECTILE_CONFIGS[parentLower] then
			return TRAJECTORY_PROJECTILE_CONFIGS[parentLower]
		end
	end
	if nameLower:find("cricle") or nameLower:find("circle") then
		return TRAJECTORY_PROJECTILE_CONFIGS["secondbosscriclehitbox"]
	end
	if part.Parent and part.Parent:IsA("Model") then
		local parentLower = part.Parent.Name:lower():gsub("%s+", "")
		if parentLower:find("cricle") or parentLower:find("circle") then
			return TRAJECTORY_PROJECTILE_CONFIGS["secondbosscriclehitbox"]
		end
	end
	return nil
end

detection.GetTrajectoryConfigForPart = function(part)
	return getTrajectoryConfigForPart(part)
end

--// Tự động phát hiện kích thước thực tế của chiêu thức (Auto Dimension Detection)
--// Quét linh hoạt theo thứ tự ưu tiên: Beam Width -> SpecialMesh Scale -> BasePart Cross-Section
local function getPartAutoDimensions(part)
	if not part or not part:IsA("BasePart") then
		return 6.0, nil
	end

	local detectedWidth = nil
	local detectedLength = nil

	-- 1. ƯU TIÊN 1: Tia Beam / Laser (như firstBossBeamPart, movingBeam...)
	local beam = part:FindFirstChildOfClass("Beam") or (part.Parent and part.Parent:FindFirstChildOfClass("Beam"))
	if beam then
		local w0 = beam.Width0 or 0
		local w1 = beam.Width1 or 0
		local maxW = math.max(w0, w1)
		if maxW > 0.5 then
			detectedWidth = maxW
		end
	end

	-- Đo chiều dài và hướng từ Attachment2 nếu có (vết đích của tia beam)
	local att2 = part:FindFirstChild("Attachment2") or (part.Parent and part.Parent:FindFirstChild("Attachment2"))
	if att2 and att2:IsA("Attachment") then
		local delta = att2.WorldPosition - part.Position
		if delta.Magnitude > 5 then
			detectedLength = delta.Magnitude
		end
	end

	-- 2. ƯU TIÊN 2: SpecialMesh với Scale nhân trực tiếp lên Size của Part
	local mesh = part:FindFirstChildOfClass("SpecialMesh")
	local scaleX = (mesh and mesh.Scale.X) or 1
	local scaleY = (mesh and mesh.Scale.Y) or 1
	local scaleZ = (mesh and mesh.Scale.Z) or 1
	local effectiveSize = Vector3.new(
		part.Size.X * math.abs(scaleX),
		part.Size.Y * math.abs(scaleY),
		part.Size.Z * math.abs(scaleZ)
	)

	if not detectedWidth then
		local isMovingBeam = part.Name:lower():find("movingbeam") or (part.Parent and part.Parent.Name:lower():find("movingbeam"))
		local isBigSpike = part.Name:lower():find("bigspike") or (part.Parent and part.Parent.Name:lower():find("bigspike"))
		if isMovingBeam then
			-- Với Moving Beam quét ngang sân, bề ngang của hiểm họa chính là chiều dài sải ngang của thanh beam
			detectedWidth = math.max(effectiveSize.X, effectiveSize.Z)
		elseif isBigSpike then
			-- Với firstBossBigSpike, tia beam thật đi kèm (firstBossBeamPart) có Width0 = Width1 = 40 studs
			detectedWidth = 40.0
			if not detectedLength then
				detectedLength = 140.0
			end
		else
			-- Đo tiết diện ngang vuông góc (loại trừ trục dài nhất của đạn)
			local minDim = math.min(effectiveSize.X, effectiveSize.Z)
			local maxDim = math.max(effectiveSize.X, effectiveSize.Z)

			-- Nếu một trục quá nhỏ (ví dụ tấm phẳng mỏng < 1.2 studs), lấy trục lớn hơn
			if minDim < 1.2 and maxDim >= 1.2 then
				detectedWidth = maxDim
			else
				detectedWidth = minDim
			end
		end
	end

	-- 3. Giới hạn khoảng an toàn hợp lý (tối thiểu 3.0 studs, tối đa 60.0 studs)
	local finalWidth = math.clamp(detectedWidth or 6.0, 3.0, 60.0)

	return finalWidth, detectedLength
end

--// Khóa hướng bay ngay tại Frame 0 trước khi đạn bị xoay quanh trục Y bởi game
local function lockTrajectoryForPart(part)
	if not part or not part:IsA("BasePart") then return nil end
	if lockedProjectiles[part] then
		return lockedProjectiles[part]
	end

	local config = getTrajectoryConfigForPart(part)
	if not config then return nil end

	-- Với Moving Beam (chứa 2 quả cầu 2 đầu và thanh beam ở giữa), chỉ khóa thanh beam dài nhất
	if config.isDynamicMoving then
		local isMovingBeam = part.Name:lower():find("movingbeam") or (part.Parent and part.Parent.Name:lower():find("movingbeam"))
		if isMovingBeam then
			local maxDim = math.max(part.Size.X, part.Size.Z)
			if maxDim < 8 then
				return nil -- Bỏ qua quả cầu 2 đầu, chỉ tạo 1 hộp cam cho thanh beam chính
			end
		end
	end

	-- Bắt hướng bay từ Velocity (nếu đang bay) hoặc CFrame.LookVector tại thời điểm spawn
	local forward2D = Vector3.new(0, 0, -1)
	local autoLength = nil
	local vel = (part.AssemblyLinearVelocity or (part:IsA("BasePart") and part.Velocity))
	if vel and Vector3.new(vel.X, 0, vel.Z).Magnitude > 2 then
		forward2D = Vector3.new(vel.X, 0, vel.Z).Unit
	elseif config.isDynamicMoving then
		-- Trục RightVector (X) là phương nằm ngang của thanh beam.
		-- Hướng tịnh tiến quét sàn là phương vuông góc với thanh beam trên mặt sàn X-Z.
		local rv = part.CFrame.RightVector
		local right2D = Vector3.new(rv.X, 0, rv.Z)
		if right2D.Magnitude > 0.01 then
			right2D = right2D.Unit
		else
			right2D = Vector3.new(1, 0, 0)
		end
		local perp = Vector3.new(-right2D.Z, 0, right2D.X)
		local look2D = Vector3.new(part.CFrame.LookVector.X, 0, part.CFrame.LookVector.Z)
		if look2D.Magnitude > 0.01 and perp:Dot(look2D.Unit) < 0 then
			perp = -perp
		end
		forward2D = perp
	elseif config.isExpandingCone then
		-- Với kỹ năng chuỗi vòng tròn mở rộng hình nón (secondBossCricleHitbox - Boss 2):
		-- Hướng lan tỏa xuất phát từ vị trí spawn của vòng tròn hướng thẳng về phía Player
		local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		local playerPos = rootPart and rootPart.Position
		if playerPos then
			local diff = Vector3.new(playerPos.X - part.Position.X, 0, playerPos.Z - part.Position.Z)
			local dist = diff.Magnitude
			if dist > 0.3 then
				forward2D = diff.Unit
				-- Chiều dài hành lang dự đoán bao trùm qua Player tối thiểu 35 studs
				autoLength = math.clamp(dist + 35.0, 85.0, 160.0)
			end
		end
	else
		-- Nếu part có Attachment2 (đường điều hướng như firstBossBeamPart)
		local att2 = part:FindFirstChild("Attachment2") or (part.Parent and part.Parent:FindFirstChild("Attachment2"))
		if att2 and att2:IsA("Attachment") then
			local delta = att2.WorldPosition - part.Position
			local delta2D = Vector3.new(delta.X, 0, delta.Z)
			if delta2D.Magnitude > 0.1 then
				forward2D = delta2D.Unit
			end
		else
			local look = part.CFrame.LookVector
			local look2D = Vector3.new(look.X, 0, look.Z)
			if look2D.Magnitude > 0.001 then
				forward2D = look2D.Unit
			end
		end

		-- Nếu là missile, kiểm tra companion thirdBossBeamPart để lấy hướng và độ dài chuẩn từ Attachment2
		if part.Name:lower():find("missile") then
			for otherPart, otherData in pairs(lockedProjectiles) do
				if otherPart and otherPart.Parent and otherPart.Name:lower():find("beampart") and otherData and otherData.forward2D then
					if (otherPart.Position - part.Position).Magnitude < 10 then
						forward2D = otherData.forward2D
						if otherData.maxLookahead then
							autoLength = otherData.maxLookahead
						end
						break
					end
				end
			end
		end
	end

	-- TỰ ĐỘNG BÓC TÁCH KÍCH THƯỚC THẬT (Auto Dimension Detection):
	local autoWidth, detectedLength = getPartAutoDimensions(part)
	local baseRadius = autoWidth / 2
	autoLength = autoLength or detectedLength

	-- Nếu config có dangerRadius sàn cao hơn (safety floor), tôn trọng giá trị an toàn
	if config.dangerRadius and config.dangerRadius > baseRadius then
		baseRadius = config.dangerRadius
	end

	local finalDangerRadius = baseRadius + trajectoryWidthPadding
	local finalMaxLookahead = autoLength or config.maxLookahead or trajectoryLookahead

	-- KHÓA TRỤC Y NGAY TẠI THỜI ĐIỂM SPAWN:
	-- Lấy cao độ sàn mặt đất (Raw Floor Y) để vùng màu cam và hitbox luôn dán chặt vào mặt đất,
	-- không bị trôi nổi trên không trung hay nhấp nhô theo trục Y của viên đạn.
	local rawFloorY, hasFloor = getGeometry().GetRawFloorY(part.Position)
	local boxThickness = 0.8 -- Chiều cao của vùng màu cam trên mặt đất (studs)
	local lockedVisualY = rawFloorY + (boxThickness / 2) + 0.05 -- Đặt đáy hộp nằm sát trên sàn để không chìm vào mesh sàn

	local data = {
		part = part,
		originPos = part.Position,
		forward2D = forward2D,
		dangerRadius = finalDangerRadius,
		maxLookahead = finalMaxLookahead,
		config = config,
		spawnTime = os.clock(),
		locked = true,
		rawFloorY = rawFloorY,
		lockedVisualY = lockedVisualY,
		boxThickness = boxThickness,
	}

	lockedProjectiles[part] = data
	if logHazards then
		print(("[SmartDodge] 🚀 Locked Trajectory for %s | Dir: (%.2f, %.2f) | Lookahead: %.0fm | Auto Width: %.1fm (Radius: %.1fm) | Locked Floor Y: %.2f"):format(
			part.Name, forward2D.X, forward2D.Z, data.maxLookahead, autoWidth, data.dangerRadius, rawFloorY
		))
	end

	return data
end

detection.LockTrajectoryForPart = function(part)
	return lockTrajectoryForPart(part)
end

--// Khóa quỹ đạo trực tiếp cho Model Second Boss Moving Beam (tính toán độc lập với Visual ESP)
local function lockSecondBossMovingBeam(inst)
	if not inst or not inst.Parent then return nil end
	if lockedProjectiles[inst] then return lockedProjectiles[inst] end

	local modelCFrame, modelSize = inst:GetBoundingBox()
	local primary = inst:FindFirstChildWhichIsA("BasePart")
	local curPos = (primary and primary.Position) or modelCFrame.Position

	local rv = (primary and primary.CFrame.RightVector) or modelCFrame.RightVector
	local right2D = Vector3.new(rv.X, 0, rv.Z)
	if right2D.Magnitude > 0.01 then
		right2D = right2D.Unit
	else
		right2D = Vector3.new(1, 0, 0)
	end
	local forward2D = Vector3.new(-right2D.Z, 0, right2D.X)
	local look = (primary and primary.CFrame.LookVector) or modelCFrame.LookVector
	local look2D = Vector3.new(look.X, 0, look.Z)
	if look2D.Magnitude > 0.01 and forward2D:Dot(look2D.Unit) < 0 then
		forward2D = -forward2D
	end

	local beamSpan = math.max(modelSize.X, modelSize.Y, modelSize.Z)
	if beamSpan < 12 then beamSpan = 50.0 end
	local dangerWidth = beamSpan + trajectoryWidthPadding * 2
	local dangerDepth = trajectoryLookahead

	local curFloorY = getGeometry().GetRawFloorY(curPos)
	local thickness = 0.8
	local lockedY = curFloorY + (thickness / 2) + 0.05

	local trajData = {
		instance = inst,
		lastPos = curPos,
		curPos = curPos,
		forward2D = forward2D,
		dangerRadius = dangerWidth / 2,
		dangerWidth = dangerWidth,
		maxLookahead = dangerDepth,
		dangerDepth = dangerDepth,
		lockedVisualY = lockedY,
		boxThickness = thickness,
		isDynamicMoving = true,
		config = TRAJECTORY_PROJECTILE_CONFIGS["secondbossmovingbeam"],
	}
	lockedProjectiles[inst] = trajData
	return trajData
end

detection.LockSecondBossMovingBeam = lockSecondBossMovingBeam

--// Khởi tạo theo dõi quỹ đạo động cho Boss 2 Orbs (Yellow / Red / Green Orb luôn hướng về Player)
local function lockBossOrb(inst, config)
	if not inst or not inst.Parent then return nil end
	if lockedProjectiles[inst] then return lockedProjectiles[inst] end

	local primary = inst:IsA("BasePart") and inst or (inst:IsA("Model") and inst:FindFirstChildWhichIsA("BasePart"))
	local modelCFrame, modelSize
	if inst:IsA("Model") then
		modelCFrame, modelSize = inst:GetBoundingBox()
	end
	local curPos = (primary and primary.Position) or (modelCFrame and modelCFrame.Position) or inst.Position

	-- Xác định hướng và chiều dài ban đầu: Hướng thẳng từ Quả Cầu tới Player
	local forward2D = Vector3.new(0, 0, -1)
	local dangerDepth = 22.0
	local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local playerPos = rootPart and rootPart.Position

	if playerPos then
		local diff = Vector3.new(playerPos.X - curPos.X, 0, playerPos.Z - curPos.Z)
		local dist = diff.Magnitude
		if dist > 0.3 then
			forward2D = diff.Unit
			dangerDepth = math.clamp(dist + 4.0, 10.0, 80.0)
		end
	end

	local partSize = (primary and primary.Size) or modelSize or Vector3.new(6, 6, 6)
	local baseRadius = math.max(partSize.X, partSize.Z) / 2
	if baseRadius < 4.0 then baseRadius = 4.0 end
	local dangerRadius = baseRadius + trajectoryWidthPadding
	local dangerWidth = dangerRadius * 2

	local curFloorY = getGeometry().GetRawFloorY(curPos)
	local thickness = 0.8
	local lockedY = curFloorY + (thickness / 2) + 0.05

	local trajData = {
		instance = inst,
		lastPos = curPos,
		curPos = curPos,
		forward2D = forward2D,
		dangerRadius = dangerRadius,
		dangerWidth = dangerWidth,
		maxLookahead = dangerDepth,
		dangerDepth = dangerDepth,
		lockedVisualY = lockedY,
		boxThickness = thickness,
		isDynamicMoving = true,
		isBossOrb = true,
		config = config or TRAJECTORY_PROJECTILE_CONFIGS[inst.Name:lower():gsub("%s+", "")],
	}
	lockedProjectiles[inst] = trajData
	return trajData
end

local initBossOrb = lockBossOrb
detection.LockBossOrb = lockBossOrb
detection.InitBossOrb = lockBossOrb

--// Đăng ký tên kỹ năng của Player để loại trừ
function detection.RegisterPlayerSkill(skillName)
	if type(skillName) == "string" and #skillName > 0 then
		local cleanName = skillName:gsub("^%s+", ""):gsub("%s+$", "")
		if not ignoredSkillNames[cleanName] then
			ignoredSkillNames[cleanName] = true
			local normalized = cleanName:lower():gsub("%s+", "")
			ignoredSkillNames[normalized] = true
			if logHazards then
				print(("[SmartDodge] 🛡️ Registered Player Skill (Ignored): %s"):format(cleanName))
			end
		end
	end
end

--// Tự động quét và lắng nghe kỹ năng trong Backpack / Character của Player và đồng đội
local function initPlayerSkillWatcher()
	local function scanPlayer(p)
		if not p then return end

		local function scanContainer(container)
			if not container then return end
			for _, child in ipairs(container:GetChildren()) do
				detection.RegisterPlayerSkill(child.Name)
			end
		end

		local function watchBackpack(bp)
			if not bp then return end
			scanContainer(bp)
			bp.ChildAdded:Connect(function(child)
				detection.RegisterPlayerSkill(child.Name)
			end)
		end

		local function watchCharacter(char)
			if not char then return end
			scanContainer(char)
			char.ChildAdded:Connect(function(child)
				if child:IsA("Tool") then
					detection.RegisterPlayerSkill(child.Name)
				end
			end)
		end

		if p:FindFirstChild("Backpack") then
			watchBackpack(p.Backpack)
		end
		p.ChildAdded:Connect(function(child)
			if child.Name == "Backpack" or child:IsA("Backpack") then
				watchBackpack(child)
			end
		end)

		if p.Character then
			watchCharacter(p.Character)
		end
		p.CharacterAdded:Connect(watchCharacter)
	end

	for _, p in ipairs(Players:GetPlayers()) do
		scanPlayer(p)
	end
	Players.PlayerAdded:Connect(scanPlayer)

	-- Quét định kỳ mỗi 1 giây trong trường hợp đồ trong Backpack được game nạp trễ
	task.spawn(function()
		while threatDetectorEnabled or #Players:GetPlayers() > 0 do
			for _, p in ipairs(Players:GetPlayers()) do
				if p:FindFirstChild("Backpack") then
					for _, item in ipairs(p.Backpack:GetChildren()) do
						detection.RegisterPlayerSkill(item.Name)
					end
				end
				if p.Character then
					for _, item in ipairs(p.Character:GetChildren()) do
						if item:IsA("Tool") then
							detection.RegisterPlayerSkill(item.Name)
						end
					end
				end
			end
			task.wait(1)
		end
	end)
end

--// Tự động quét và nạp danh sách toàn bộ kỹ năng của game từ ReplicatedStorage.abilities
local function scanAbilityInstance(ability)
	if not ability then return end
	detection.RegisterPlayerSkill(ability.Name)

	local nameVal = ability:FindFirstChild("name")
	if nameVal and nameVal:IsA("ValueBase") and tostring(nameVal.Value) ~= "" then
		detection.RegisterPlayerSkill(tostring(nameVal.Value))
	end

	local attrName = ability:GetAttribute("name") or ability:GetAttribute("Name")
	if type(attrName) == "string" and attrName ~= "" then
		detection.RegisterPlayerSkill(attrName)
	end

	-- Quét các BasePart/MeshPart/Projectiles bên trong ability (nếu có)
	for _, desc in ipairs(ability:GetDescendants()) do
		if desc:IsA("BasePart") and desc.Name ~= "Handle" and desc.Name ~= "Part" and desc.Name ~= "Union" then
			detection.RegisterPlayerSkill(desc.Name)
		end
	end
end

local function initReplicatedAbilitiesWatcher()
	local function hookFolder(folder)
		for _, child in ipairs(folder:GetChildren()) do
			scanAbilityInstance(child)
		end
		folder.ChildAdded:Connect(function(child)
			scanAbilityInstance(child)
		end)
		if logHazards then
			print(("[SmartDodge] 📚 Loaded %d player abilities from ReplicatedStorage.abilities"):format(#folder:GetChildren()))
		end
	end

	local abilitiesFolder = ReplicatedStorage:FindFirstChild("abilities")
	if abilitiesFolder then
		hookFolder(abilitiesFolder)
	else
		task.spawn(function()
			local folder = ReplicatedStorage:WaitForChild("abilities", 10)
			if folder then
				hookFolder(folder)
			end
		end)
	end
end

--// Tự động quét và nạp toàn bộ danh mục EFFECT / đạn / vòng sáng từ ReplicatedStorage.projectiles
local function scanProjectileInstance(proj)
	if not proj then return end
	detection.RegisterPlayerSkill(proj.Name)

	-- Quét toàn bộ part/mesh/model con bên trong
	for _, desc in ipairs(proj:GetDescendants()) do
		if desc:IsA("BasePart") and desc.Name ~= "Handle" and desc.Name ~= "Part" and desc.Name ~= "Union" then
			detection.RegisterPlayerSkill(desc.Name)
		end
	end
end

local function initReplicatedProjectilesWatcher()
	local function hookFolder(folder)
		for _, child in ipairs(folder:GetChildren()) do
			scanProjectileInstance(child)
		end
		folder.ChildAdded:Connect(function(child)
			scanProjectileInstance(child)
		end)
		if logHazards then
			print(("[SmartDodge] 🎆 Loaded %d player projectiles/effects from ReplicatedStorage.projectiles"):format(#folder:GetChildren()))
		end
	end

	local projFolder = ReplicatedStorage:FindFirstChild("projectiles")
	if projFolder then
		hookFolder(projFolder)
	else
		task.spawn(function()
			local folder = ReplicatedStorage:WaitForChild("projectiles", 10)
			if folder then
				hookFolder(folder)
			end
		end)
	end
end

initPlayerSkillWatcher()
initReplicatedAbilitiesWatcher()
initReplicatedProjectilesWatcher()

--// Kiểm tra xem đối tượng có phải là của Player (hoặc skill của Player) không
local function isPlayerAsset(instance)
	if not instance then return true end

	local instNameClean = instance.Name:gsub("^%s+", ""):gsub("%s+$", "")
	local instNameLower = instNameClean:lower():gsub("%s+", "")

	-- 0. Ngoại lệ chiêu của Boss / Enemy -> Tuyệt đối không phải của Player
	local repEnemyProj = ReplicatedStorage:FindFirstChild("enemyProjectiles")
	if repEnemyProj and (repEnemyProj:FindFirstChild(instance.Name, true) or repEnemyProj:FindFirstChild(instNameClean, true)) then
		return false
	end

	if CUSTOM_HAZARD_EXCEPTIONS[instance.Name]
		or instNameLower:find("boss")
		or instNameLower:find("enemy")
		or instNameLower:find("mob")
		or instNameLower:find("multiring")
		or instNameLower:find("crisscross")
		or instNameLower:find("seekingspike")
		or instNameLower:find("bigspike")
		or instNameLower:find("beampart")
		or instNameLower:find("movingbeam")
		or instNameLower:find("thirdboss") then
		return false
	end

	-- 1. Kiểm tra trực thuộc Character của bất kỳ người chơi nào
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Character and (instance == p.Character or instance:IsDescendantOf(p.Character)) then
			return true
		end
	end

	-- 2. Kiểm tra trực tiếp trong Backpack & Character của mọi người chơi (Khớp chính xác tên, không fuzzy substring)
	instNameClean = instance.Name:gsub("^%s+", ""):gsub("%s+$", "")
	instNameLower = instNameClean:lower():gsub("%s+", "")

	for _, p in ipairs(Players:GetPlayers()) do
		local bp = p:FindFirstChild("Backpack")
		if bp then
			if bp:FindFirstChild(instance.Name) or bp:FindFirstChild(instNameClean) then
				detection.RegisterPlayerSkill(instance.Name)
				return true
			end
			for _, item in ipairs(bp:GetChildren()) do
				local itemLower = item.Name:lower():gsub("%s+", "")
				if item.Name == instance.Name or itemLower == instNameLower then
					detection.RegisterPlayerSkill(item.Name)
					return true
				end
			end
		end

		if p.Character then
			if p.Character:FindFirstChild(instance.Name) or p.Character:FindFirstChild(instNameClean) then
				detection.RegisterPlayerSkill(instance.Name)
				return true
			end
			for _, item in ipairs(p.Character:GetChildren()) do
				if item:IsA("Tool") then
					local itemLower = item.Name:lower():gsub("%s+", "")
					if item.Name == instance.Name or itemLower == instNameLower then
						detection.RegisterPlayerSkill(item.Name)
						return true
					end
				end
			end
		end
	end

	-- 3. Kiểm tra các Tag/Attribute/ObjectValue sở hữu (creator, owner, player, caster)
	local creatorVal = instance:FindFirstChild("creator") or instance:FindFirstChild("Creator")
		or instance:FindFirstChild("owner") or instance:FindFirstChild("Owner")
		or instance:FindFirstChild("player") or instance:FindFirstChild("Player")
		or instance:FindFirstChild("caster") or instance:FindFirstChild("Caster")
	if creatorVal then
		if creatorVal:IsA("ObjectValue") and creatorVal.Value and creatorVal.Value:IsA("Player") then
			return true
		elseif creatorVal:IsA("StringValue") and Players:FindFirstChild(creatorVal.Value) then
			return true
		end
	end

	local ownerAttr = instance:GetAttribute("Owner") or instance:GetAttribute("Player")
		or instance:GetAttribute("creator") or instance:GetAttribute("Creator")
	if ownerAttr then
		if type(ownerAttr) == "string" and Players:FindFirstChild(ownerAttr) then
			return true
		end
	end

	-- 4. Kiểm tra tên Instance có chứa tên hoặc UserId của Player không
	for _, p in ipairs(Players:GetPlayers()) do
		local pNameLower = p.Name:lower()
		if instNameLower:find(pNameLower, 1, true) or instance.Name:find(tostring(p.UserId), 1, true) then
			return true
		end
	end

	-- 5. So khớp với danh sách tên kỹ năng đã đăng ký (Chính xác tên, không fuzzy substring tránh trùng tên chiêu Boss)
	if ignoredSkillNames[instance.Name] or ignoredSkillNames[instNameClean] or ignoredSkillNames[instNameLower] then
		return true
	end

	-- 6. Kiểm tra trực tiếp thư mục ReplicatedStorage.abilities & projectiles (phòng trường hợp chiêu/effect mới chưa kịp nạp)
	local repAbilities = ReplicatedStorage:FindFirstChild("abilities")
	if repAbilities and (repAbilities:FindFirstChild(instance.Name) or repAbilities:FindFirstChild(instNameClean)) then
		detection.RegisterPlayerSkill(instance.Name)
		return true
	end

	local repProjectiles = ReplicatedStorage:FindFirstChild("projectiles")
	if repProjectiles and (repProjectiles:FindFirstChild(instance.Name) or repProjectiles:FindFirstChild(instNameClean)) then
		detection.RegisterPlayerSkill(instance.Name)
		return true
	end

	-- Riêng các hiệu ứng Aura thông dụng của player
	if instNameLower:find("enhancedaura", 1, true) or instNameLower:find("auraring", 1, true) or instNameLower:find("groundaura", 1, true) then
		return true
	end

	return false
end

--// Danh sách tên các Part bổ trợ / không gây sát thương cần lọc bỏ
local HELPER_PART_NAMES = {
	["primarypart"] = true,
	["center"] = true,
	["root"] = true,
	["main"] = true,
	["handle"] = true,
	["humanoidrootpart"] = true,
}

--// Kiểm tra xem một Part/MeshPart cụ thể có thuộc danh sách bỏ qua hay không
local function isIgnoredPart(part)
	if not part then return true end
	--// Marker "SmartDodge_SafeMarker" đã bị chặn sẵn bằng tên chứa "SmartDodge" (CanQuery=false),
	--// nên không cần so sánh instance marker riêng nữa (refactor ra nhiều module).
	if part.Name:find("SmartDodge") then return true end
	local nameClean = part.Name:gsub("^%s+", ""):gsub("%s+$", "")
	local nameLower = nameClean:lower():gsub("%s+", "")

	if CUSTOM_HAZARD_EXCEPTIONS[part.Name] or (part.Parent and CUSTOM_HAZARD_EXCEPTIONS[part.Parent.Name])
		or part.Name:lower():find("multiring") or (part.Parent and part.Parent.Name:lower():find("multiring"))
		or part.Name:lower():find("crisscross") or (part.Parent and part.Parent.Name:lower():find("crisscross"))
		or part.Name:lower():find("seekingspike") or (part.Parent and part.Parent.Name:lower():find("seekingspike"))
		or part.Name:lower():find("bigspike") or (part.Parent and part.Parent.Name:lower():find("bigspike"))
		or part.Name:lower():find("beampart") or (part.Parent and part.Parent.Name:lower():find("beampart"))
		or part.Name:lower():find("movingbeam") or (part.Parent and part.Parent.Name:lower():find("movingbeam"))
		or part.Name:lower():find("cricle") or (part.Parent and part.Parent.Name:lower():find("cricle"))
		or part.Name:lower():find("circle") or (part.Parent and part.Parent.Name:lower():find("circle"))
		or part.Name:lower():find("thirdboss") or (part.Parent and part.Parent.Name:lower():find("thirdboss"))
		or part.Name:lower():find("missile") or (part.Parent and part.Parent.Name:lower():find("missile")) then
		return false
	end

	if ignoredSkillNames[part.Name] or ignoredSkillNames[nameClean] or ignoredSkillNames[nameLower] or IGNORED_NAMES[part.Name] then
		return true
	end

	if nameLower:find("enhancedaura", 1, true) or nameLower:find("auraring", 1, true) or nameLower:find("groundaura", 1, true) then
		return true
	end
	return false
end

detection.IsIgnoredPart = function(part)
	return isIgnoredPart(part)
end

--// Tìm các Part nguy hiểm bên trong instance (Depth 1 BasePart hoặc Model)
local function extractHazardParts(instance)
	local parts = {}
	if not instance or instance.Name:find("SmartDodge") or isIgnoredPart(instance) then
		return parts, false
	end
	local isException = CUSTOM_HAZARD_EXCEPTIONS[instance.Name]
		or instance.Name:lower():find("multiring")
		or instance.Name:lower():find("crisscross")
		or instance.Name:lower():find("seekingspike")
		or instance.Name:lower():find("bigspike")
		or instance.Name:lower():find("beampart")
		or instance.Name:lower():find("movingbeam")
		or instance.Name:lower():find("cricle")
		or instance.Name:lower():find("circle")
		or instance.Name:lower():find("thirdboss")
		or instance.Name:lower():find("missile")

	local function isValidHazardPart(part)
		if not part or not part:IsA("BasePart") or isIgnoredPart(part) then return false end
		local nameLower = part.Name:lower():gsub("%s+", "")
		if HELPER_PART_NAMES[nameLower] then return false end

		-- Với chiêu multi rings, chỉ nhận các part tên 'ring'
		if instance.Name:lower():find("multiring") and not nameLower:find("ring") then
			return false
		end

		-- Chiêu Trajectory Projectile / Beam Telegraph (firstBossBigSpike, firstBossBeamPart...)
		-- có thể là Part vô hình (Transparency = 1) ở pha precast telegraph
		if getTrajectoryConfigForPart(part) then
			return true
		end

		return part.Transparency < FADE_TRANSPARENCY_THRESHOLD
	end

	if isException then
		-- Ngoại lệ đặc biệt: tìm các part 'precast', 'ring', 'cricle', 'circle', 'hitbox' hoặc Part Neon có trong model
		if instance:IsA("BasePart") then
			if isValidHazardPart(instance) then
				table.insert(parts, instance)
			end
		elseif instance:IsA("Model") then
			local precasts = {}
			for _, desc in ipairs(instance:GetDescendants()) do
				if isValidHazardPart(desc) and (
					desc.Name:lower():find("precast")
					or desc.Name:lower():find("ring")
					or desc.Name:lower():find("cricle")
					or desc.Name:lower():find("circle")
					or desc.Name:lower():find("hitbox")
				) then
					table.insert(precasts, desc)
				end
			end
			if #precasts > 0 then
				parts = precasts
			else
				-- Nếu không có part precast/ring cụ thể, CHỈ lấy các part Neon thực sự (tuyệt đối không lấy part hộp/PrimaryPart)
				for _, desc in ipairs(instance:GetDescendants()) do
					if isValidHazardPart(desc) and desc.Material == Enum.Material.Neon then
						table.insert(parts, desc)
					end
				end
				-- Fallback ngoại lệ: nếu không có part Neon nào nhưng có BasePart hợp lệ
				if #parts == 0 then
					for _, desc in ipairs(instance:GetDescendants()) do
						if isValidHazardPart(desc) then
							table.insert(parts, desc)
						end
					end
				end
			end
		end
	else
		-- Tiêu chuẩn chung: CHỈ nhận Material == Neon
		if instance:IsA("BasePart") then
			if isValidHazardPart(instance) and instance.Material == Enum.Material.Neon then
				table.insert(parts, instance)
			end
		elseif instance:IsA("Model") then
			for _, desc in ipairs(instance:GetDescendants()) do
				if isValidHazardPart(desc) and desc.Material == Enum.Material.Neon then
					table.insert(parts, desc)
				end
			end
		end
	end

	return parts, isException
end

--// Lấy vị trí trung tâm của instance (Ưu tiên tuyệt đối hazardParts thực tế, KHÔNG dùng PrimaryPart)
local function getInstancePosition(instance, hazardParts)
	if hazardParts and #hazardParts > 0 then
		return hazardParts[1].Position
	end

	if instance:IsA("BasePart") then
		return instance.Position
	elseif instance:IsA("Model") then
		local pivot = instance:GetPivot()
		if pivot and pivot.Position ~= Vector3.zero then
			return pivot.Position
		end
	end

	return Vector3.zero
end

local function fireHazardChanged()
	for _, cb in ipairs(hazardChangedCallbacks) do
		pcall(cb, hazardCount, lastHazardInfo)
	end
end

--// Forward declaration
local unregisterHazard

--// Tạo và gắn SelectionBox 3D lên từng Part của chiêu thức
local function attachSelectionBoxes(hazardParts)
	local boxes = {}
	for _, part in ipairs(hazardParts) do
		if part and part:IsA("BasePart") and part.Parent then
			-- SelectionBox CHỈ bọc các Part phát sáng Neon thực sự hoặc các part precast/ring/trajectory/orb
			-- Tuyệt đối KHÔNG bọc các part hộp/mesh to đùng không phải Neon
			local isNeon = (part.Material == Enum.Material.Neon)
			local orbConf = BOSS_ORB_CONFIGS[part.Name:lower()]
				or (part.Parent and BOSS_ORB_CONFIGS[part.Parent.Name:lower()])
			local isPrecast = part.Name:lower():find("precast") ~= nil
			local isRing = part.Name:lower():find("ring") ~= nil
			local isTraj = getTrajectoryConfigForPart(part) ~= nil

			if isNeon or orbConf or isPrecast or isRing or isTraj then
				local box = Instance.new("SelectionBox")
				box.Name = "SmartDodge_SelectionBox"

				if orbConf then
					box.Color3 = orbConf.color
					box.SurfaceColor3 = orbConf.surfaceColor
					box.SurfaceTransparency = 0.5
					box.LineThickness = 0.08
				else
					box.Color3 = Color3.fromRGB(255, 45, 45)
					box.SurfaceColor3 = Color3.fromRGB(255, 30, 30)
					box.SurfaceTransparency = 0.6
					box.LineThickness = 0.05
				end

				box.Adornee = part
				box.Parent = part
				table.insert(boxes, box)
			end
		end
	end
	return boxes
end

--// Ước tính tổng thời gian tồn tại và thời điểm kích nổ sát thương (Total Lifetime & Hit Delay)
local function getEstimatedSkillLifetime(skillName)
	if skillTimingManager then
		return skillTimingManager.GetSkillTiming(skillName)
	end
	local known = KNOWN_SKILL_LIFETIMES[skillName]
	if known then
		if type(known) == "table" then
			return known.totalLifetime or 2.0, known.hitDelay or 1.5
		else
			return known, known * 0.70
		end
	end
	return 2.5, 1.8
end

--// Gắn BillboardGui 3D đếm ngược thời gian tồn tại của hazard
local function attachHazardTimerBillboard(instance, hazardParts, skillName)
	if not showSkillTimers then return nil, nil end
	local targetPart = hazardParts and hazardParts[1]
	if not targetPart or not targetPart:IsA("BasePart") then
		if instance:IsA("BasePart") then
			targetPart = instance
		elseif instance:IsA("Model") then
			targetPart = instance:FindFirstChildWhichIsA("BasePart")
		else
			return nil, nil
		end
	end

	local billboard = Instance.new("BillboardGui")
	billboard.Name = "SmartDodge_TimerBillboard"
	billboard.Adornee = targetPart
	billboard.Size = UDim2.new(0, 160, 0, 40)
	billboard.StudsOffset = Vector3.new(0, 4.0, 0)
	billboard.AlwaysOnTop = true
	billboard.ResetOnSpawn = false

	local label = Instance.new("TextLabel")
	label.Name = "TimerLabel"
	label.Size = UDim2.new(1, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.GothamBold
	label.TextSize = 13
	label.TextColor3 = Color3.fromRGB(255, 220, 80)
	label.Text = skillName .. "\n⏳ calculating..."

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(0, 0, 0)
	stroke.Thickness = 1.5
	stroke.Parent = label

	label.Parent = billboard
	billboard.Parent = targetPart

	return billboard, label
end

--// Tìm đối tượng tung chiêu (Caster) để theo dõi vòng đời sống/chết (Tầng 2)
local function findCasterForHazard(instance, pos)
	if not instance then return nil, nil end

	-- 1. Kiểm tra các thuộc tính/ObjectValue sở hữu nếu game có đính kèm
	local creatorVal = instance:FindFirstChild("creator") or instance:FindFirstChild("Creator")
		or instance:FindFirstChild("owner") or instance:FindFirstChild("Owner")
		or instance:FindFirstChild("caster") or instance:FindFirstChild("Caster")
	if creatorVal and creatorVal:IsA("ObjectValue") and creatorVal.Value and creatorVal.Value:IsA("Model") then
		local hum = creatorVal.Value:FindFirstChildOfClass("Humanoid")
		if hum and hum.Health > 0 then
			return creatorVal.Value, hum
		end
	end

	local tracked = shared.GetTrackedEnemyData()
	if not tracked or #tracked == 0 then
		return nil, nil
	end

	-- 2. Nếu đang trong Boss Room hoặc chỉ còn đúng 1 quái trong phòng -> Caster chính là con quái/boss đó
	if #tracked == 1 or shared.IsBossActive() then
		local data = tracked[1]
		if data and data.Model and data.Humanoid and data.Humanoid.Health > 0 then
			return data.Model, data.Humanoid
		end
	end

	-- 3. Nếu có nhiều quái: Tìm quái sống gần vị trí spawn của chiêu nhất (bán kính <= 35 studs)
	if pos then
		local nearestModel, nearestHum = nil, nil
		local nearestDistSq = 35 * 35
		for _, data in ipairs(tracked) do
			if data and data.Root and data.Root.Parent then
				local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
				if hum and hum.Health > 0 then
					local distSq = (data.Root.Position - pos).Magnitude ^ 2
					if distSq < nearestDistSq then
						nearestDistSq = distSq
						nearestModel = data.Model
						nearestHum = hum
					end
				end
			end
		end
		if nearestModel and nearestHum then
			return nearestModel, nearestHum
		end
	end

	return nil, nil
end

--// Đăng ký một Instance (Depth 1) là hiểm họa và gắn listeners theo dõi độ mờ
local function registerHazard(instance)
	if not threatDetectorEnabled or not instance or activeHazards[instance] then return end
	if instance:IsA("Folder") then return end
	if instance:FindFirstChildOfClass("Humanoid") then return end
	if instance.Name:find("SmartDodge") then return end
	if IGNORED_NAMES[instance.Name] or ignoredSkillNames[instance.Name] then return end

	-- FAST REJECTION (Tầng 1): Nếu phòng đã dọn sạch quái và không ở Boss room -> Bỏ qua
	-- Ngoại lệ: khi đang bật Huấn luyện (Recording) thì không bỏ qua để đảm bảo bắt trọn mọi chiêu thức
	if not (skillTimingManager and skillTimingManager.IsRecording()) then
		if shared.GetEnemyCount() == 0 and not shared.IsBossActive() then return end
	end

	-- FAST REJECTION: Trích xuất part hiểm họa trước.
	-- Nếu không có part Neon và không thuộc ngoại lệ -> Bỏ qua ngay lập tức trong 0.0001ms mà KHÔNG chạy isPlayerAsset
	local hazardParts, isException = extractHazardParts(instance)
	if #hazardParts == 0 then
		-- Nếu là Model mới tạo, các part con có thể chưa kịp replicate hoặc parent vào Model
		if instance:IsA("Model") then
			local c
			c = instance.DescendantAdded:Connect(function(desc)
				if desc:IsA("BasePart") and desc.Transparency < FADE_TRANSPARENCY_THRESHOLD then
					if isException or desc.Material == Enum.Material.Neon then
						if c then c:Disconnect(); c = nil end
						registerHazard(instance)
					end
				end
			end)
			task.delay(1.5, function()
				if c then c:Disconnect(); c = nil end
			end)
		elseif instance:IsA("BasePart") and instance.Transparency < FADE_TRANSPARENCY_THRESHOLD then
			local c
			c = instance:GetPropertyChangedSignal("Material"):Connect(function()
				if instance.Material == Enum.Material.Neon then
					if c then c:Disconnect(); c = nil end
					registerHazard(instance)
				end
			end)
			task.delay(1.5, function()
				if c then c:Disconnect(); c = nil end
			end)
		end
		return
	end

	-- Chỉ khi chắc chắn có Part nguy hiểm thực sự mới kiểm tra xem có phải skill của Player/Đồng đội không
	if isPlayerAsset(instance) then return end

	local pos = getInstancePosition(instance, hazardParts)

	-- Tầng 2: Tìm Caster của chiêu thức
	local casterModel, casterHumanoid = findCasterForHazard(instance, pos)
	if casterHumanoid and casterHumanoid.Health <= 0 then
		-- Quái tung chiêu này đã chết -> Bỏ qua ngay lập tức!
		return
	end

	local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local dist = rootPart and math.floor((pos - rootPart.Position).Magnitude) or 0

	local activePartsSet = {}
	local partConnections = {}

	-- Bộ theo dõi chu kỳ chớp sáng (Flash Peak & Decay Tracker) cho từng Part
	local partMinTrans = {}      -- [Part] = number (độ mờ thấp nhất / sáng nhất từng ghi nhận)
	local partHasFlashed = {}    -- [Part] = boolean (đã từng đạt trạng thái chớp sáng kích nổ chưa)

	for _, part in ipairs(hazardParts) do
		activePartsSet[part] = true
		local initT = part.Transparency
		partMinTrans[part] = initT
		partHasFlashed[part] = (initT <= 0.28)
	end

	local visualBoxes = visualEspEnabled and attachSelectionBoxes(hazardParts) or {}
	local timerBillboard, timerLabel = nil, nil
	if showSkillTimers then
		timerBillboard, timerLabel = attachHazardTimerBillboard(instance, hazardParts, instance.Name)
	end

	local info = {
		Instance = instance,
		Name = instance.Name,
		Class = instance.ClassName,
		Position = pos,
		SpawnPosition = pos,
		Distance = dist,
		NeonCount = #hazardParts,
		SpawnTime = os.clock(),
		HitTime = nil, -- Ghi nhận thời điểm nháy kích nổ sát thương
		Connections = partConnections,
		ActiveParts = activePartsSet,
		VisualBoxes = visualBoxes,
		TimerBillboard = timerBillboard,
		TimerLabel = timerLabel,
		IsException = isException,
		Caster = casterModel,
		CasterHumanoid = casterHumanoid,
	}

	activeHazards[instance] = info
	hazardCount = hazardCount + 1
	lastHazardInfo = info

	-- Lắng nghe sự kiện Caster chết để hủy sớm toàn bộ hitbox chiêu này (Tầng 2)
	if casterModel and casterHumanoid then
		table.insert(partConnections, casterHumanoid.Died:Connect(function()
			unregisterHazard(instance, "Caster Dead")
		end))
		table.insert(partConnections, casterModel.AncestryChanged:Connect(function(_, parent)
			if not parent then
				unregisterHazard(instance, "Caster Removed")
			end
		end))
	end

	-- Lắng nghe âm thanh nổ hoặc particles bung ra để bắt trọn thời điểm nháy damage
	for _, desc in ipairs(instance:GetDescendants()) do
		if desc:IsA("Sound") then
			table.insert(partConnections, desc.Played:Connect(function()
				if not info.HitTime then
					info.HitTime = os.clock()
				end
			end))
		end
	end

	if instance:IsA("Model") then
		table.insert(partConnections, instance.DescendantAdded:Connect(function(desc)
			if not info.HitTime and (desc:IsA("ParticleEmitter") or desc:IsA("Sound") or (desc:IsA("BasePart") and desc.Name ~= "precast")) then
				info.HitTime = os.clock()
			end
		end))
	end

	-- Khóa hướng bay ngay tại Frame 0 cho các chiêu đạn bay / Projectile
	local instNameLower = (instance.Name or ""):lower():gsub("%s+", "")
	if instance:IsA("Model") and (instNameLower:find("movingbeam") ~= nil or (instance.Name and instance.Name:lower():find("movingbeam") ~= nil)) then
		lockSecondBossMovingBeam(instance)
	end
	if BOSS_ORB_CONFIGS[instNameLower] or (instance.Name and BOSS_ORB_CONFIGS[instance.Name:lower():gsub("%s+", "")]) then
		lockBossOrb(instance, TRAJECTORY_PROJECTILE_CONFIGS[instNameLower])
	end

	for _, part in ipairs(hazardParts) do
		if getTrajectoryConfigForPart(part) then
			lockTrajectoryForPart(part)
		end
	end

	-- Gắn sự kiện lắng nghe Transparency và Material thay đổi trên từng Part
	local function checkPartStatus(part)
		if not activeHazards[instance] or not activePartsSet[part] then return end

		-- Kiểm tra xem Caster có vừa chết hay biến mất không (Tầng 2)
		if info.CasterHumanoid and (info.CasterHumanoid.Health <= 0 or not info.Caster or not info.Caster.Parent) then
			unregisterHazard(instance, "Caster Dead")
			return
		end

		local curTrans = part.Transparency
		local minT = partMinTrans[part] or curTrans
		if curTrans < minT then
			minT = curTrans
			partMinTrans[part] = minT
		end

		-- Pha Kích nổ / Sát thương: Khi part đạt độ sáng chói (Transparency tụt xuống <= 0.28)
		if minT <= 0.28 then
			partHasFlashed[part] = true
			if not info.HitTime then
				info.HitTime = os.clock()
			end
		end

		-- Pha Tan biến sau khi chớp sáng (Early Hitbox Clearance):
		-- Một khi đã từng chớp sáng, chỉ cần Transparency bắt đầu tăng lên (curTrans >= minT + 0.18 hoặc curTrans >= 0.40)
		-- -> Sát thương đã nổ xong 100%, loại bỏ hitbox ngay lập tức không cần đợi tới 0.85/0.95!
		local hasDecayedAfterFlash = partHasFlashed[part] and (curTrans >= (minT + 0.18) or curTrans >= 0.40)

		local isTraj = getTrajectoryConfigForPart(part) ~= nil
		local isExpired = false

		if not part.Parent then
			isExpired = true
		elseif isTraj then
			-- Với Trajectory Projectile (như firstBossBigSpike, firstBossBeamPart):
			-- Khi mới spawn ở pha precast telegraph, Transparency có thể = 1.
			-- Khi đạn bắn ra, Transparency tụt xuống < FADE_TRANSPARENCY_THRESHOLD -> đánh dấu đã bước vào pha bay
			if curTrans < FADE_TRANSPARENCY_THRESHOLD then
				partHasFlashed[part] = true
			end

			-- Chỉ coi là hết hạn nếu: ĐÃ TỪNG BẮN (partHasFlashed) và giờ mờ đi lại (curTrans >= FADE_TRANSPARENCY_THRESHOLD),
			-- hoặc part đã nổ/tan biến sau chớp sáng.
			if partHasFlashed[part] and (curTrans >= FADE_TRANSPARENCY_THRESHOLD or hasDecayedAfterFlash) then
				isExpired = true
			end
		else
			isExpired = hasDecayedAfterFlash
				or (curTrans >= FADE_TRANSPARENCY_THRESHOLD)
				or (not isException and part.Material ~= Enum.Material.Neon)
		end

		if isExpired then
			activePartsSet[part] = nil
			partMinTrans[part] = nil
			partHasFlashed[part] = nil

			if activeTrajectoryVisuals[part] then
				pcall(function() activeTrajectoryVisuals[part]:Destroy() end)
				activeTrajectoryVisuals[part] = nil
			end
			if lockedProjectiles[part] then
				lockedProjectiles[part] = nil
			end

			-- Kiểm tra xem còn Part nào đang hoạt động không
			local remaining = 0
			for _ in pairs(activePartsSet) do
				remaining = remaining + 1
			end

			if remaining == 0 then
				local reason = hasDecayedAfterFlash and "Post-flash Decay (Early Hitbox Clearance)" or "Faded / Finished"
				unregisterHazard(instance, reason)
			else
				info.NeonCount = remaining
			end
		end
	end

	for _, part in ipairs(hazardParts) do
		table.insert(partConnections, part:GetPropertyChangedSignal("Transparency"):Connect(function()
			checkPartStatus(part)
		end))
		if not isException then
			table.insert(partConnections, part:GetPropertyChangedSignal("Material"):Connect(function()
				checkPartStatus(part)
			end))
		end
		table.insert(partConnections, part.AncestryChanged:Connect(function()
			checkPartStatus(part)
		end))
	end

	-- Lắng nghe các Part con được nạp trễ vào Model (Ví dụ các Ring được gán vào sau)
	if instance:IsA("Model") then
		table.insert(partConnections, instance.DescendantAdded:Connect(function(desc)
			if not activeHazards[instance] then return end
			local isValid = desc:IsA("BasePart") and not isIgnoredPart(desc) and desc.Transparency < FADE_TRANSPARENCY_THRESHOLD
			if isValid then
				local nameLower = desc.Name:lower():gsub("%s+", "")
				if not HELPER_PART_NAMES[nameLower] then
					if isException or desc.Material == Enum.Material.Neon then
						if not activePartsSet[desc] then
							activePartsSet[desc] = true
							info.NeonCount = info.NeonCount + 1

							local initT = desc.Transparency
							partMinTrans[desc] = initT
							partHasFlashed[desc] = (initT <= 0.28)

							if getTrajectoryConfigForPart(desc) then
								lockTrajectoryForPart(desc)
							end

							if visualEspEnabled then
								local boxes = attachSelectionBoxes({ desc })
								if boxes and #boxes > 0 then
									for _, b in ipairs(boxes) do table.insert(info.VisualBoxes, b) end
								end
							end

							table.insert(partConnections, desc:GetPropertyChangedSignal("Transparency"):Connect(function()
								checkPartStatus(desc)
							end))
							table.insert(partConnections, desc.AncestryChanged:Connect(function()
								checkPartStatus(desc)
							end))
						end
					end
				end
			end
		end))
	end

	-- Tự động in cấu trúc chi tiết của thirdBossMultiRings để phân tích thông số hình học
	if instance.Name:lower():find("multiring") then
		task.delay(0.3, function()
			if not instance or not instance.Parent then return end
			local centerPart = instance:FindFirstChild("center") or instance:FindFirstChild("Center") or (hazardParts and hazardParts[1])
			local centerPos = centerPart and centerPart.Position or Vector3.zero
			print("================ [MULTIRINGS INSPECTOR DUMP] ================")
			print(("[MultiRings] Model: %s | Center: (%.1f, %.1f, %.1f)"):format(instance.Name, centerPos.X, centerPos.Y, centerPos.Z))

			local idx = 0
			for _, child in ipairs(instance:GetDescendants()) do
				if child:IsA("BasePart") then
					idx = idx + 1
					local off = child.Position - centerPos
					local _, rotY = child.CFrame:ToOrientation()
					print(("[%d] Name: '%s' | Class: %s | Size: (%.1f, %.1f, %.1f) | Offset: (%.1f, %.1f, %.1f) | RotY: %.1f deg"):format(
						idx, child.Name, child.ClassName, child.Size.X, child.Size.Y, child.Size.Z, off.X, off.Y, off.Z, math.deg(rotY)
					))
				end
			end
			print("=============================================================")
		end)
	end

	if logHazards then
		print(("[SmartDodge][Hazard] 🚨 Hazard Detected: %s | Class: %s | Parts: %d | Dist: %d studs%s")
			:format(info.Name, info.Class, info.NeonCount, info.Distance, isException and " (Exception)" or ""))
	end

	fireHazardChanged()
end

--// Hủy đăng ký hiểm họa (khi mờ, đổi material, hoặc bị xóa khỏi Workspace)
function unregisterHazard(instance, reason)
	if not activeHazards[instance] then return end
	local info = activeHazards[instance]

	-- Dọn dẹp SelectionBoxes
	if info.VisualBoxes then
		for _, box in ipairs(info.VisualBoxes) do
			pcall(function() box:Destroy() end)
		end
		table.clear(info.VisualBoxes)
	end

	-- Dọn dẹp connection của từng part
	if info.Connections then
		for _, c in ipairs(info.Connections) do
			pcall(function() c:Disconnect() end)
		end
		table.clear(info.Connections)
	end

	-- Dọn dẹp Trajectory visuals và locked data
	if info.ActiveParts then
		for p in pairs(info.ActiveParts) do
			if activeTrajectoryVisuals[p] then
				pcall(function() activeTrajectoryVisuals[p]:Destroy() end)
				activeTrajectoryVisuals[p] = nil
			end
			if lockedProjectiles[p] then
				lockedProjectiles[p] = nil
			end
		end
	end

	-- Dọn dẹp Timer Billboard
	if info.TimerBillboard then
		pcall(function() info.TimerBillboard:Destroy() end)
		info.TimerBillboard = nil
		info.TimerLabel = nil
	end

	-- Nếu đang bật chế độ Huấn luyện chơi chay (Manual Training): Ghi nhận nhịp chiêu vào RAM buffer
	if skillTimingManager and skillTimingManager.IsRecording() and info.SpawnTime then
		local duration = os.clock() - info.SpawnTime
		local hitDelay = info.HitTime and (info.HitTime - info.SpawnTime) or nil

		-- Nhận diện xem chiêu thức có phải là Projectile / Đạn bay di chuyển hay không
		local currentPos = getInstancePosition(instance, nil)
		local travelDist = (currentPos - (info.SpawnPosition or info.Position or Vector3.zero)).Magnitude
		local nameClean = (info.Name or ""):lower():gsub("%s+", "")
		local isProjectile = (TRAJECTORY_PROJECTILE_CONFIGS[nameClean] ~= nil)
			or (nameClean:find("projectile") ~= nil)
			or (nameClean:find("missile") ~= nil)
			or (nameClean:find("orb") ~= nil)
			or (nameClean:find("bullet") ~= nil)
			or (nameClean:find("ball") ~= nil)
			or (nameClean:find("movingbeam") ~= nil)
			or (nameClean:find("crisscross") ~= nil)
			or (nameClean:find("seekingspike") ~= nil)
			or (travelDist >= 6.0)

		if isProjectile then
			-- Chiêu projectile gây sát thương xuyên suốt toàn bộ vòng đời bay (HitDelay = 0.0s)
			hitDelay = 0.0
		elseif not hitDelay or hitDelay < 0.1 or hitDelay > duration then
			local _, defaultHit = getEstimatedSkillLifetime(info.Name)
			hitDelay = math.min(defaultHit, duration * 0.75)
		end

		if duration >= 0.2 and duration <= 25.0 then
			skillTimingManager.RecordSkill(info.Name, duration, hitDelay, isProjectile)
			local typeTag = isProjectile and "🚀 Projectile" or "💥 AoE"
			print(("[SkillTiming] 📝 Recorded: '%s' [%s] | Lifetime: %.2fs | HitDelay: %.2fs (%s)")
				:format(info.Name, typeTag, duration, hitDelay, reason or "Despawned"))
		else
			print(("[SkillTiming] ⚠️ Skipped '%s': duration %.2fs out of range [0.2, 25.0]")
				:format(info.Name, duration))
		end
	end

	activeHazards[instance] = nil
	hazardCount = math.max(0, hazardCount - 1)

	if logHazards and info then
		local reasonStr = reason and (" (" .. reason .. ")") or ""
		print(("[SmartDodge][Hazard] 🟢 Hazard Expired: %s%s")
			:format(info.Name, reasonStr))
	end

	fireHazardChanged()
end

--// Nội bộ cho engine: đăng ký/hủy hazard 1 instance (Workspace ChildAdded/ChildRemoved)
detection.RegisterHazard = registerHazard
detection.UnregisterHazard = unregisterHazard

--// Cập nhật tọa độ và logic quỹ đạo đạn bay / moving beam theo thời gian thực (độc lập 100% với Visual ESP)
function detection.UpdateTrajectories()
	if not threatDetectorEnabled then
		table.clear(lockedProjectiles)
		return
	end

	local currentActiveKeys = {}

	for _, info in pairs(activeHazards) do
		local inst = info.Instance
		if inst and inst.Parent then
			local instNameLower = (inst.Name or ""):lower():gsub("%s+", "")
			local isMovingBeam = inst:IsA("Model") and (instNameLower:find("movingbeam") ~= nil or (info.Name and info.Name:lower():find("movingbeam") ~= nil))

			local orbConfig = BOSS_ORB_CONFIGS[instNameLower] or (info.Name and BOSS_ORB_CONFIGS[info.Name:lower():gsub("%s+", "")])
			local isBossOrb = (orbConfig ~= nil) or (TRAJECTORY_PROJECTILE_CONFIGS[instNameLower] and TRAJECTORY_PROJECTILE_CONFIGS[instNameLower].isBossOrb)

			if isMovingBeam then
				-- Cập nhật động cho Model secondBossMovingBeam
				currentActiveKeys[inst] = true

				local modelCFrame, modelSize = inst:GetBoundingBox()
				local primary = inst:FindFirstChildWhichIsA("BasePart")
				local curPos = (primary and primary.Position) or modelCFrame.Position

				local trajData = lockedProjectiles[inst]
				if not trajData then
					trajData = lockSecondBossMovingBeam(inst)
				end

				if trajData then
					-- Cập nhật hướng tịnh tiến thực tế từ frame này sang frame khác
					local moveDelta = curPos - trajData.lastPos
					local moveDelta2D = Vector3.new(moveDelta.X, 0, moveDelta.Z)
					if moveDelta2D.Magnitude > 0.08 then
						trajData.forward2D = moveDelta2D.Unit
					end
					trajData.lastPos = curPos
					trajData.curPos = curPos

					-- Bề ngang beam bao quát cả Model (lấy trục dài nhất của BoundingBox)
					local beamSpan = math.max(modelSize.X, modelSize.Y, modelSize.Z)
					if beamSpan < 12 then beamSpan = 50.0 end
					local dangerWidth = beamSpan + trajectoryWidthPadding * 2
					local maxLookahead = (trajData.config and trajData.config.maxLookahead) or trajectoryLookahead
					local dangerDepth = maxLookahead

					trajData.dangerRadius = dangerWidth / 2
					trajData.dangerWidth = dangerWidth
					trajData.maxLookahead = dangerDepth
					trajData.dangerDepth = dangerDepth

					-- Cao độ dán chặt mặt sàn
					local curFloorY = getGeometry().GetRawFloorY(curPos)
					local thickness = 0.8
					local lockedY = curFloorY + (thickness / 2) + 0.05
					trajData.lockedVisualY = lockedY
					trajData.boxThickness = thickness
				end
			elseif isBossOrb then
				-- Cập nhật động cho Boss 2 Orbs (Yellow / Red / Green Orb bám đuổi)
				currentActiveKeys[inst] = true

				local primary = inst:IsA("BasePart") and inst or (inst:IsA("Model") and inst:FindFirstChildWhichIsA("BasePart"))
				local modelCFrame, modelSize
				if inst:IsA("Model") then
					modelCFrame, modelSize = inst:GetBoundingBox()
				end
				local curPos = (primary and primary.Position) or (modelCFrame and modelCFrame.Position) or inst.Position

				local trajData = lockedProjectiles[inst]
				if not trajData then
					trajData = lockBossOrb(inst, TRAJECTORY_PROJECTILE_CONFIGS[instNameLower])
				end

				if trajData then
					-- CẬP NHẬT ĐỘNG THEO THỜI GIAN THỰC TÙY VÀO VỊ TRÍ CỦA QUẢ CẦU VÀ VỊ TRÍ NGƯỜI CHƠI
					local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
					local playerPos = rootPart and rootPart.Position

					local dangerDepth = 22.0
					if playerPos then
						local diff = Vector3.new(playerPos.X - curPos.X, 0, playerPos.Z - curPos.Z)
						local distToPlayer = diff.Magnitude
						if distToPlayer > 0.3 then
							trajData.forward2D = diff.Unit
							-- Chiều dài hành lang cam bao trùm từ quả cầu đến tận chân người chơi (+ 4 studs buffer phía sau người chơi)
							dangerDepth = math.clamp(distToPlayer + 4.0, 10.0, 80.0)
						end
					else
						-- Fallback khi người chơi chưa spawn / đã chết: theo delta di chuyển hoặc vận tốc
						local vel = primary and (primary.AssemblyLinearVelocity or (primary:IsA("BasePart") and primary.Velocity))
						local vel2D = vel and Vector3.new(vel.X, 0, vel.Z)
						if vel2D and vel2D.Magnitude > 1.5 then
							trajData.forward2D = vel2D.Unit
						else
							local moveDelta = curPos - trajData.lastPos
							local moveDelta2D = Vector3.new(moveDelta.X, 0, moveDelta.Z)
							if moveDelta2D.Magnitude > 0.05 then
								trajData.forward2D = moveDelta2D.Unit
							end
						end
					end

					trajData.lastPos = curPos
					trajData.curPos = curPos

					local partSize = (primary and primary.Size) or modelSize or Vector3.new(6, 6, 6)
					local baseRadius = math.max(partSize.X, partSize.Z) / 2
					if baseRadius < 4.0 then baseRadius = 4.0 end
					local dangerRadius = baseRadius + trajectoryWidthPadding
					local dangerWidth = dangerRadius * 2

					trajData.dangerRadius = dangerRadius
					trajData.dangerWidth = dangerWidth
					trajData.maxLookahead = dangerDepth
					trajData.dangerDepth = dangerDepth

					local curFloorY = getGeometry().GetRawFloorY(curPos)
					local thickness = 0.8
					local lockedY = curFloorY + (thickness / 2) + 0.05
					trajData.lockedVisualY = lockedY
					trajData.boxThickness = thickness
				end
			else
				-- Cập nhật cho các Part Projectile khác (Spike, Telegraph Beam, v.v.)
				if info.ActiveParts then
					for part in pairs(info.ActiveParts) do
						if part and part.Parent and part:IsA("BasePart") then
							local trajConfig = getTrajectoryConfigForPart(part)
							if trajConfig then
								currentActiveKeys[part] = true
								local trajData = lockedProjectiles[part] or lockTrajectoryForPart(part)
								if trajData and trajData.forward2D then
									local autoWidth, autoLength = getPartAutoDimensions(part)
									local baseMinRadius = autoWidth / 2
									if trajData.config and trajData.config.dangerRadius and trajData.config.dangerRadius > baseMinRadius then
										baseMinRadius = trajData.config.dangerRadius
									end
									local dangerRadius = baseMinRadius + trajectoryWidthPadding
									local maxLookahead = autoLength or (trajData.config and trajData.config.maxLookahead) or trajData.maxLookahead or trajectoryLookahead

									trajData.dangerRadius = dangerRadius
									trajData.maxLookahead = maxLookahead
								end
							end
						end
					end
				end
			end
		end
	end

	-- Dọn dẹp những projectile không còn hoạt động trong activeHazards
	for key in pairs(lockedProjectiles) do
		if not currentActiveKeys[key] then
			lockedProjectiles[key] = nil
		end
	end
end

--// Cập nhật Visual ESP cho các hành lang quỹ đạo (Trajectory Boxes)
function detection.UpdateTrajectoryVisuals()
	if not visualEspEnabled or not threatDetectorEnabled then
		for part, vPart in pairs(activeTrajectoryVisuals) do
			pcall(function() vPart:Destroy() end)
		end
		table.clear(activeTrajectoryVisuals)
		return
	end

	local currentActiveVisuals = {}

	for _, info in pairs(activeHazards) do
		local inst = info.Instance
		if inst and inst.Parent then
			local instNameLower = (inst.Name or ""):lower():gsub("%s+", "")
			local isMovingBeam = (instNameLower:find("movingbeam") ~= nil or (info.Name and info.Name:lower():find("movingbeam") ~= nil))
			local orbConfig = BOSS_ORB_CONFIGS[instNameLower] or (info.Name and BOSS_ORB_CONFIGS[info.Name:lower():gsub("%s+", "")])
			local isBossOrb = (orbConfig ~= nil) or (TRAJECTORY_PROJECTILE_CONFIGS[instNameLower] and TRAJECTORY_PROJECTILE_CONFIGS[instNameLower].isBossOrb)

			if isMovingBeam then
				-- =========================================================================
				-- XỬ LÝ VISUAL CẤP MODEL CHO SECOND BOSS MOVING BEAM
				-- =========================================================================
				local trajData = lockedProjectiles[inst]
				if not trajData and lockSecondBossMovingBeam then
					trajData = lockSecondBossMovingBeam(inst)
				end
				if trajData then
					currentActiveVisuals[inst] = true

					local curPos = trajData.curPos or (inst:IsA("Model") and select(1, inst:GetBoundingBox()).Position) or inst.Position
					local forward2D = trajData.forward2D or Vector3.new(0, 0, -1)
					local dangerWidth = trajData.dangerWidth or (trajData.dangerRadius * 2)
					local dangerDepth = trajData.dangerDepth or trajData.maxLookahead or 50.0
					local lockedY = trajData.lockedVisualY or (getGeometry().GetRawFloorY(curPos) + 0.45)
					local thickness = trajData.boxThickness or 0.8

					local vPart = activeTrajectoryVisuals[inst]
					if not vPart or not vPart.Parent then
						vPart = Instance.new("Part")
						vPart.Name = "SmartDodge_TrajectoryBox"
						vPart.Material = Enum.Material.Neon
						vPart.Color = Color3.fromRGB(255, 130, 0)
						vPart.Transparency = 0.82
						vPart.Anchored = true
						vPart.CanCollide = false
						vPart.CanQuery = false
						vPart.CanTouch = false

						local box = Instance.new("SelectionBox")
						box.Name = "TrajectoryBorder"
						box.Color3 = Color3.fromRGB(255, 150, 30)
						box.SurfaceColor3 = Color3.fromRGB(255, 130, 0)
						box.SurfaceTransparency = 0.8
						box.LineThickness = 0.04
						box.Adornee = vPart
						box.Parent = vPart

						local bb = Instance.new("BillboardGui")
						bb.Name = "TrajGui"
						bb.Size = UDim2.fromOffset(220, 26)
						bb.StudsOffset = Vector3.new(0, 2.5, 0)
						bb.AlwaysOnTop = true
						bb.Adornee = vPart
						bb.Parent = vPart

						local label = Instance.new("TextLabel")
						label.Name = "Label"
						label.Size = UDim2.fromScale(1, 1)
						label.BackgroundTransparency = 1
						label.TextColor3 = Color3.fromRGB(255, 170, 40)
						label.TextStrokeTransparency = 0
						label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
						label.Font = Enum.Font.GothamBold
						label.TextSize = 12
						label.Text = ("🚀 MOVING BEAM: %s (%.0fm | W:%.1fm)"):format(inst.Name, dangerDepth, dangerWidth)
						label.Parent = bb

						activeTrajectoryVisuals[inst] = vPart
					else
						local tg = vPart:FindFirstChild("TrajGui")
						local lbl = tg and tg:FindFirstChild("Label")
						if lbl and lbl:IsA("TextLabel") then
							lbl.Text = ("🚀 MOVING BEAM: %s (%.0fm | W:%.1fm)"):format(inst.Name, dangerDepth, dangerWidth)
						end
					end

					vPart.Size = Vector3.new(dangerWidth, thickness, dangerDepth)
					local visualCenter = Vector3.new(curPos.X, lockedY, curPos.Z) + forward2D * ((dangerDepth / 2) - 1.5)
					vPart.CFrame = CFrame.lookAt(visualCenter, visualCenter + forward2D)
					vPart.Parent = Workspace.Terrain
				end
			elseif isBossOrb then
				-- =========================================================================
				-- XỬ LÝ VISUAL CHO BOSS 2 ORBS (Yellow / Red / Green Orb)
				-- =========================================================================
				local trajData = lockedProjectiles[inst]
				if trajData then
					currentActiveVisuals[inst] = true

					local curPos = trajData.curPos or inst.Position
					local forward2D = trajData.forward2D or Vector3.new(0, 0, -1)
					local dangerWidth = trajData.dangerWidth or (trajData.dangerRadius * 2)
					local dangerDepth = trajData.dangerDepth or trajData.maxLookahead or 22.0
					local lockedY = trajData.lockedVisualY or (getGeometry().GetRawFloorY(curPos) + 0.45)
					local thickness = trajData.boxThickness or 0.8
					local orbColorName = (trajData.config and trajData.config.orbColorName) or (orbConfig and orbConfig.colorName) or "orb"

					local vPart = activeTrajectoryVisuals[inst]
					if not vPart or not vPart.Parent then
						vPart = Instance.new("Part")
						vPart.Name = "SmartDodge_TrajectoryBox"
						vPart.Material = Enum.Material.Neon
						vPart.Color = Color3.fromRGB(255, 130, 0)
						vPart.Transparency = 0.82
						vPart.Anchored = true
						vPart.CanCollide = false
						vPart.CanQuery = false
						vPart.CanTouch = false

						local box = Instance.new("SelectionBox")
						box.Name = "TrajectoryBorder"
						box.Color3 = Color3.fromRGB(255, 150, 30)
						box.SurfaceColor3 = Color3.fromRGB(255, 130, 0)
						box.SurfaceTransparency = 0.8
						box.LineThickness = 0.04
						box.Adornee = vPart
						box.Parent = vPart

						local bb = Instance.new("BillboardGui")
						bb.Name = "TrajGui"
						bb.Size = UDim2.fromOffset(220, 26)
						bb.StudsOffset = Vector3.new(0, 2.5, 0)
						bb.AlwaysOnTop = true
						bb.Adornee = vPart
						bb.Parent = vPart

						local label = Instance.new("TextLabel")
						label.Name = "Label"
						label.Size = UDim2.fromScale(1, 1)
						label.BackgroundTransparency = 1
						label.TextColor3 = Color3.fromRGB(255, 170, 40)
						label.TextStrokeTransparency = 0
						label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
						label.Font = Enum.Font.GothamBold
						label.TextSize = 12
						label.Text = ("🚀 %s ORB: %s (%.0fm | W:%.1fm)"):format(orbColorName:upper(), inst.Name, dangerDepth, dangerWidth)
						label.Parent = bb

						activeTrajectoryVisuals[inst] = vPart
					else
						local tg = vPart:FindFirstChild("TrajGui")
						local lbl = tg and tg:FindFirstChild("Label")
						if lbl and lbl:IsA("TextLabel") then
							lbl.Text = ("🚀 %s ORB: %s (%.0fm | W:%.1fm)"):format(orbColorName:upper(), inst.Name, dangerDepth, dangerWidth)
						end
					end

					vPart.Size = Vector3.new(dangerWidth, thickness, dangerDepth)
					local visualCenter = Vector3.new(curPos.X, lockedY, curPos.Z) + forward2D * ((dangerDepth / 2) - 2.0)
					vPart.CFrame = CFrame.lookAt(visualCenter, visualCenter + forward2D)
					vPart.Parent = Workspace.Terrain
				end
			else
				-- =========================================================================
				-- XỬ LÝ CHO CÁC PART PROJECTILE KHÁC (Spike, Telegraph Beam, v.v.)
				-- =========================================================================
				if info.ActiveParts then
					for part in pairs(info.ActiveParts) do
						if part and part.Parent and part:IsA("BasePart") then
							local trajConfig = getTrajectoryConfigForPart(part)
							if trajConfig then
								local isBeam = part.Name:lower():find("beampart") ~= nil
								local isMissile = part.Name:lower():find("missile") ~= nil
								local hasDuplicate = false
								if isBeam or isMissile then
									for otherPart in pairs(currentActiveVisuals) do
										if otherPart ~= part and otherPart:IsA("BasePart") and (otherPart.Position - part.Position).Magnitude < 6 then
											hasDuplicate = true
											break
										end
									end
								end

								if not hasDuplicate then
									local trajData = lockedProjectiles[part]
									if trajData and trajData.forward2D then
										currentActiveVisuals[part] = true

										local maxLookahead = trajData.maxLookahead or trajectoryLookahead
										local dangerRadius = trajData.dangerRadius or 4.0
										local forward2D = trajData.forward2D
										local originPos = part.Position
										local centerPos = originPos + forward2D * (maxLookahead / 2)

										local lockedY = trajData.lockedVisualY or (trajData.rawFloorY and (trajData.rawFloorY + 0.45)) or (getGeometry().GetRawFloorY(originPos) + 0.45)
										local thickness = trajData.boxThickness or 0.8

										local depth = maxLookahead
										local isExpandingCone = (trajData.config and trajData.config.isExpandingCone)
										local boxWidth = dangerRadius * 2
										if isExpandingCone then
											local expRate = (trajData.config and trajData.config.expansionRate) or 0.25
											boxWidth = math.floor((dangerRadius + (maxLookahead * expRate / 2)) * 2)
										end
										local labelText = isExpandingCone
											and ("⚡ CONE CORRIDOR: %s (%.0fm | W:%.1fm)"):format(part.Name, maxLookahead, boxWidth)
											or ("🚀 TRAJECTORY: %s (%.0fm | W:%.1fm)"):format(part.Name, maxLookahead, boxWidth)

										local vPart = activeTrajectoryVisuals[part]
										if not vPart or not vPart.Parent then
											vPart = Instance.new("Part")
											vPart.Name = "SmartDodge_TrajectoryBox"
											vPart.Material = Enum.Material.Neon
											vPart.Color = trajConfig.visualColor or Color3.fromRGB(255, 130, 0)
											vPart.Transparency = 0.82
											vPart.Anchored = true
											vPart.CanCollide = false
											vPart.CanQuery = false
											vPart.CanTouch = false

											local box = Instance.new("SelectionBox")
											box.Name = "TrajectoryBorder"
											box.Color3 = Color3.fromRGB(255, 150, 30)
											box.SurfaceColor3 = trajConfig.visualColor or Color3.fromRGB(255, 130, 0)
											box.SurfaceTransparency = 0.8
											box.LineThickness = 0.04
											box.Adornee = vPart
											box.Parent = vPart

											local bb = Instance.new("BillboardGui")
											bb.Name = "TrajGui"
											bb.Size = UDim2.fromOffset(200, 26)
											bb.StudsOffset = Vector3.new(0, 2.5, 0)
											bb.AlwaysOnTop = true
											bb.Adornee = vPart
											bb.Parent = vPart

											local label = Instance.new("TextLabel")
											label.Name = "Label"
											label.Size = UDim2.fromScale(1, 1)
											label.BackgroundTransparency = 1
											label.TextColor3 = Color3.fromRGB(255, 170, 40)
											label.TextStrokeTransparency = 0
											label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
											label.Font = Enum.Font.GothamBold
											label.TextSize = 12
											label.Text = labelText
											label.Parent = bb

											activeTrajectoryVisuals[part] = vPart
										else
											local tg = vPart:FindFirstChild("TrajGui")
											local lbl = tg and tg:FindFirstChild("Label")
											if lbl and lbl:IsA("TextLabel") then
												lbl.Text = labelText
											end
										end

										vPart.Size = Vector3.new(boxWidth, thickness, depth)
										local visualCenter = Vector3.new(centerPos.X, lockedY, centerPos.Z)
										vPart.CFrame = CFrame.lookAt(visualCenter, visualCenter + forward2D)
										vPart.Parent = Workspace.Terrain
									end
								end
							end
						end
					end
				end
			end
		end
	end

	-- Dọn dẹp những visual đã hết hạn
	for part, vPart in pairs(activeTrajectoryVisuals) do
		if not currentActiveVisuals[part] then
			pcall(function() vPart:Destroy() end)
			activeTrajectoryVisuals[part] = nil
		end
	end
end

--// Dọn sạch toàn bộ visual của các hành lang đạn bay (không xóa lockedProjectiles)
function detection.ClearTrajectoryVisuals()
	for part, vPart in pairs(activeTrajectoryVisuals) do
		pcall(function() vPart:Destroy() end)
	end
	table.clear(activeTrajectoryVisuals)
end

--// Xóa sạch toàn bộ hiểm họa hiện tại (khi Boss chết, phòng dọn sạch hoặc engine dừng) (Tầng 1)
function detection.ClearAllHazards(reason)
	local toRemove = {}
	for inst in pairs(activeHazards) do
		table.insert(toRemove, inst)
	end
	for _, inst in ipairs(toRemove) do
		unregisterHazard(inst, reason or "Purged")
	end
	table.clear(activeHazards)
	table.clear(lockedProjectiles)
	hazardCount = 0
	detection.ClearTrajectoryVisuals()
	fireHazardChanged()
	if logHazards and reason then
		print(("[SmartDodge][Hazard] 🧹 All hazards cleared: %s"):format(reason))
	end
end

--// Bắt đầu quét & lắng nghe sự kiện Workspace cấp 1 (được engine gọi khi StartEngine)
function detection.StartScan()
	-- Dọn dẹp connection cũ nếu có
	for _, c in ipairs(connections) do c:Disconnect() end
	table.clear(connections)

	for _, cleanup in ipairs(sharedCleanups) do pcall(cleanup) end
	table.clear(sharedCleanups)

	-- Dọn dẹp hazards cũ
	detection.ClearAllHazards("StartScan Reset")

	-- 1. Quét tức thời các child Depth 1 hiện tại trong Workspace
	for _, child in ipairs(Workspace:GetChildren()) do
		registerHazard(child)
	end

	-- 2. Lắng nghe vật thể mới sinh ra ở Workspace (Depth 1)
	table.insert(connections, Workspace.ChildAdded:Connect(function(child)
		registerHazard(child)
	end))

	-- 3. Lắng nghe vật thể bị xóa khỏi Workspace (Depth 1)
	table.insert(connections, Workspace.ChildRemoved:Connect(function(child)
		unregisterHazard(child, "Destroyed")
	end))

	-- 4. Lắng nghe Boss bị tiêu diệt hoặc kết thúc Boss Room (Tầng 1)
	local unsubBoss = shared.OnBossActiveChanged(function(active)
		if not active then
			detection.ClearAllHazards("Boss Defeated")
		end
	end)
	table.insert(sharedCleanups, unsubBoss)

	-- 5. Lắng nghe kẻ địch chết hoặc phòng được dọn sạch (Tầng 1 & 2)
	local unsubEnemy = shared.OnEnemyChanged(function()
		local count = shared.GetEnemyCount()
		if count == 0 and not shared.IsBossActive() then
			detection.ClearAllHazards("Room Cleared")
		else
			-- Quét nhanh hủy các chiêu có Caster vừa tử trận
			for inst, info in pairs(activeHazards) do
				if info.CasterHumanoid and (info.CasterHumanoid.Health <= 0 or not info.Caster or not info.Caster.Parent) then
					task.spawn(function()
						unregisterHazard(inst, "Caster Dead")
					end)
				end
			end
		end
	end)
	table.insert(sharedCleanups, unsubEnemy)

	if logHazards then
		print("[SmartDodge] 📡 Threat Detector & Safe Spot Engine started!")
	end
end

--// Dừng quét, dọn hazards và connection (được engine gọi khi StopEngine/Shutdown)
function detection.StopScan()
	for _, c in ipairs(connections) do c:Disconnect() end
	table.clear(connections)

	for _, cleanup in ipairs(sharedCleanups) do pcall(cleanup) end
	table.clear(sharedCleanups)

	detection.ClearAllHazards("StopScan")

	if logHazards then
		print("[SmartDodge] 🛑 Threat Detector stopped.")
	end
end

--// Public accessors (facade chỉ proxy)
function detection.SetLogHazards(state)
	logHazards = state and true or false
end

function detection.IsLogHazardsEnabled()
	return logHazards
end

function detection.SetVisualEsp(state)
	visualEspEnabled = state and true or false
	detection.UpdateTrajectoryVisuals()
	if visualEspEnabled then
		for _, info in pairs(activeHazards) do
			if (not info.VisualBoxes or #info.VisualBoxes == 0) and info.ActiveParts then
				local partsList = {}
				for p in pairs(info.ActiveParts) do
					table.insert(partsList, p)
				end
				info.VisualBoxes = attachSelectionBoxes(partsList)
			end
		end
	else
		for _, info in pairs(activeHazards) do
			if info.VisualBoxes then
				for _, box in ipairs(info.VisualBoxes) do
					pcall(function() box:Destroy() end)
				end
				table.clear(info.VisualBoxes)
			end
		end
	end
end

function detection.IsVisualEspEnabled()
	return visualEspEnabled
end

function detection.GetHazardCount()
	return hazardCount
end

function detection.GetActiveHazards()
	local list = {}
	for _, data in pairs(activeHazards) do
		if data.Instance and data.Instance.Parent == Workspace then
			table.insert(list, data)
		end
	end
	return list
end

function detection.GetLastHazardInfo()
	return lastHazardInfo
end

function detection.OnHazardChanged(callback)
	if type(callback) ~= "function" then return end
	table.insert(hazardChangedCallbacks, callback)
end

--// Trả về Boss 2 Orb đang kích hoạt (nếu có): part, colorName ("yellow"|"red"|"green"), instance, config
function detection.GetActiveBossOrb()
	for inst, info in pairs(activeHazards) do
		if inst and inst.Parent then
			local cleanName = (inst.Name or ""):lower():gsub("%s+", "")
			local orbConf = BOSS_ORB_CONFIGS[cleanName]
			if not orbConf then
				if cleanName:find("yelloworb") then
					orbConf = BOSS_ORB_CONFIGS["secondbossyelloworb"]
				elseif cleanName:find("redorb") then
					orbConf = BOSS_ORB_CONFIGS["secondbossredorb"]
				elseif cleanName:find("greenorb") then
					orbConf = BOSS_ORB_CONFIGS["secondbossgreenorb"]
				end
			end

			if orbConf then
				local part = inst:IsA("BasePart") and inst or nil
				if not part and info.ActiveParts then
					for p in pairs(info.ActiveParts) do
						if p and p.Parent and p:IsA("BasePart") then
							part = p
							break
						end
					end
				end
				if not part then
					part = inst:FindFirstChildWhichIsA("BasePart")
				end
				if part and part.Parent then
					return part, orbConf.colorName, inst, orbConf
				end
			end
		end
	end
	return nil, nil, nil, nil
end

--// Trả về thời gian còn lại (giây) của một hazard trước khi tự biến mất và trước khi giáng damage
function detection.GetHazardTimeRemaining(instance)
	local info = activeHazards[instance]
	if not info or not info.SpawnTime then return nil, nil, 0, nil, nil end
	local elapsed = os.clock() - info.SpawnTime
	local estTotal, estHit = getEstimatedSkillLifetime(info.Name)
	local remainingTotal = math.max(0, estTotal - elapsed)
	local remainingToHit = math.max(0, estHit - elapsed)
	return remainingTotal, estTotal, elapsed, remainingToHit, estHit
end

--// Lấy thông tin thống kê thời gian sống của một kỹ năng
function detection.GetSkillProfile(skillName)
	return skillProfiles[skillName]
end

--// Lấy toàn bộ hồ sơ thời gian sống của các chiêu thức đã học
function detection.GetAllSkillProfiles()
	return skillProfiles
end

--// Cập nhật nhãn đếm ngược 3D trên đầu các hazard đang hoạt động
function detection.UpdateHazardTimers()
	if not showSkillTimers then return end
	local now = os.clock()
	for _, info in pairs(activeHazards) do
		if info.TimerLabel and info.SpawnTime then
			local elapsed = now - info.SpawnTime
			local estTotal, estHit = getEstimatedSkillLifetime(info.Name)
			local remainingTotal = math.max(0, estTotal - elapsed)
			local remainingToHit = math.max(0, estHit - elapsed)

			local color
			local text
			if remainingToHit > 0 then
				-- Đang trong giai đoạn telegraph / chuẩn bị giáng damage
				if remainingToHit <= 0.4 then
					color = Color3.fromRGB(255, 60, 60) -- Đỏ rực: sát thương sắp giáng xuống!
				elseif remainingToHit <= 1.0 then
					color = Color3.fromRGB(255, 160, 0) -- Cam: sắp nổ
				else
					color = Color3.fromRGB(255, 230, 80) -- Vàng: đang precast
				end
				text = string.format("%s\n💥 HIT IN: %.1fs (⏳ %.1fs)", info.Name, remainingToHit, remainingTotal)
			else
				-- Đã kích nổ damage xong! Đang trong giai đoạn tàn dư animation/fading
				color = Color3.fromRGB(80, 255, 120) -- Xanh neon: Đã nổ xong (an toàn để bước vào nếu tàn dư vô hại)
				text = string.format("%s\n✅ DETONATED! (⏳ %.1fs)", info.Name, remainingTotal)
			end

			info.TimerLabel.TextColor3 = color
			info.TimerLabel.Text = text
		end
	end
end

--// Bật/tắt hiển thị đếm ngược 3D Countdown trên đầu chiêu thức
function detection.SetShowSkillTimers(state)
	showSkillTimers = state and true or false
	if not showSkillTimers then
		for _, info in pairs(activeHazards) do
			if info.TimerBillboard then
				pcall(function() info.TimerBillboard:Destroy() end)
				info.TimerBillboard = nil
				info.TimerLabel = nil
			end
		end
	else
		for inst, info in pairs(activeHazards) do
			if not info.TimerBillboard and info.ActiveParts then
				local partsList = {}
				for p in pairs(info.ActiveParts) do
					table.insert(partsList, p)
				end
				info.TimerBillboard, info.TimerLabel = attachHazardTimerBillboard(inst, partsList, info.Name)
			end
		end
	end
end

function detection.IsShowSkillTimersEnabled()
	return showSkillTimers
end

--// Bật/tắt chế độ tự động học thời gian tồn tại & điểm kích nổ sát thương của kỹ năng
function detection.SetAutoLearnSkillLifetimes(state)
	autoLearnSkillLifetimes = state and true or false
end

function detection.IsAutoLearnSkillLifetimesEnabled()
	return autoLearnSkillLifetimes
end

detection.SaveSkillProfiles = skillTimingManager.SaveRecordedData
detection.LoadSkillProfiles = skillTimingManager.LoadMapData
detection.skillTimingManager = skillTimingManager

return detection