-- Smart Dodge V2: Core Threat Detection Engine (Pure Neon & Dynamic Detection)
-- Quét Workspace Depth 1, nhận diện mọi BasePart có Material == Neon (trực tiếp hoặc con cháu trong Model),
-- bọc SelectionBox 3D vàng đậm và gắn Name Tag dạng Parent(Part).

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local types = require("@routes/DungeonQuest/core/smartDodgeV2/types")
local filter = require("@routes/DungeonQuest/core/smartDodgeV2/filter")
local visuals = require("@routes/DungeonQuest/core/smartDodgeV2/visuals")
local shared = require("@routes/DungeonQuest/core/shared")

local detection = {}

--// State
local enabled = false
local logHazards = false
local activeHazards: { [Instance]: types.ActiveHazard } = {}
local hazardCount = 0

--// Callbacks
local hazardAddedCallbacks: { (types.ActiveHazard) -> () } = {}
local hazardRemovedCallbacks: { (types.ActiveHazard) -> () } = {}
local hazardChangedCallbacks: { (number, types.ActiveHazard?) -> () } = {}

local connections: { RBXScriptConnection } = {}
local FADE_THRESHOLD = 0.85
local orbCorridorLength = 90.0
local beamCorridorLength = 140.0
local lastBossSpawnTime = (shared.IsBossActive and shared.IsBossActive()) and os.clock() or 0

type CustomHazardConfig = {
	name: string,
	isTelegraph: boolean,
	targetChildName: string?, -- Chỉ định rõ ràng Part con cần lấy (nếu có, ví dụ "precast")
	targetChildContains: string?, -- Lấy Part con nếu tên chứa từ khóa này (ví dụ "ring")
	neverUnify: boolean?, -- Tuyệt đối không gộp SelectionBox thành 1 Model to (buộc vẽ từng part riêng lẻ)
	hasSyntheticTelegraph: boolean?, -- Tự động tạo hành lang màu Cam dự đoán quỹ đạo bắn thẳng
	telegraphLength: number?,        -- Chiều dài hành lang dự đoán (mặc định 120 studs)
	isHomingToPlayer: boolean?,      -- Tự động quay hướng hành lang bám theo Player
	isMultiWave: boolean?,           -- Đòn đánh đa đợt sóng: tái sử dụng part con, không xóa vĩnh viễn khi mờ
	width: number?,                  -- Bề rộng hành lang sát thương thực tế (studs)
	isExpandingCone: boolean?,       -- Kỹ năng nón mở rộng (Boss 2 Circle Hitbox)
	expansionRate: number?,          -- Tỷ lệ phình to theo chiều dài
}

--// Danh sách các chiêu thức / đòn đánh ngoại lệ theo tên (không bắt buộc Material == Neon)
local CUSTOM_HAZARDS: { [string]: CustomHazardConfig } = {
	["firstbossseekingspikes"] = {
		name = "firstBossSeekingSpikes",
		isTelegraph = false,
		hasSyntheticTelegraph = false, -- Vùng cam của Spike chính là tia định hướng (không dùng moving box)
		telegraphLength = 120,
		width = 16,
	},
	["firstbossbigspike"] = {
		name = "firstBossBigSpike",
		isTelegraph = false,
		hasSyntheticTelegraph = false, -- Vùng cam của Spike chính là tia định hướng (không dùng moving box)
		telegraphLength = 140,
		width = 40,
	},
	["firstbossbeampart"] = {
		name = "firstBossBeamPart",
		isTelegraph = true,  -- Tia định hướng báo trước (quy ước màu Cam định hướng)
		telegraphLength = 140,
		-- Width tự động phân biệt: 16 studs (Seeking Spikes) hoặc 40 studs (Big Spike)
	},
	["firstbosslaserprecast"] = {
		name = "firstBossLaserPrecast",
		isTelegraph = true,
		targetChildName = "precast",
		telegraphLength = 140,
		width = 24,
	},
	["firstbossattachpart"] = {
		name = "firstBossAttachPart",
		isTelegraph = true,
		telegraphLength = 140,
		width = 24,
	},
	["firstbosssundiskbeampart"] = {
		name = "firstBossSunDiskBeamPart",
		isTelegraph = true,
		telegraphLength = 140,
		width = 20,
	},
	["firstbossblindingblastbeam"] = {
		name = "firstBossBlindingBlastBeam",
		isTelegraph = true,
		telegraphLength = 140,
		width = 40,
	},
	["firstbossskyshot"] = {
		name = "firstBossSkyShot",
		isTelegraph = false,
		hasSyntheticTelegraph = true,
		telegraphLength = 60,
		width = 20,
	},
	["firstbosscrisscross"] = {
		name = "firstBossCrissCross",
		isTelegraph = false,
		hasSyntheticTelegraph = true, -- Tự tạo vùng Moving Trajectory đi theo đạn chuẩn V1
		telegraphLength = 28,         -- Độ dài nhìn trước 28 studs (vừa đủ để né, không bao trùm cả phòng)
		width = 8,                    -- Bề rộng chuẩn V1: 8 studs (radius 4.0 studs)
	},
	["smallicespikes"] = {
		name = "smallIceSpikes",
		isTelegraph = false,
		targetChildName = "precast", -- Chỉ bọc riêng part precast (Plastic) sát đất
	},
	["mediumicespikes"] = {
		name = "mediumIceSpikes",
		isTelegraph = false,
		targetChildName = "precast", -- Chỉ bọc riêng part precast (Plastic) sát đất
	},
	["largeicespikes"] = {
		name = "largeIceSpikes",
		isTelegraph = false,
		targetChildName = "precast", -- Chỉ bọc riêng part precast (Plastic) sát đất
	},
	["icespikes"] = {
		name = "iceSpikes",
		isTelegraph = false,
		targetChildName = "precast", -- Chỉ bọc riêng part precast (Plastic) sát đất
	},
	["thirdbossmissile"] = {
		name = "thirdBossMissile",
		isTelegraph = false,
		hasSyntheticTelegraph = true, -- Vùng Moving Trajectory màu Cam di chuyển theo tên lửa chuẩn V1
		telegraphLength = 40,         -- Giới hạn 40 studs phía trước đầu tên lửa (tối đa hóa vùng SAFE)
	},
	["thirdbossmultirings"] = {
		name = "thirdBossMultiRings",
		isTelegraph = false,
		targetChildContains = "ring", -- Chỉ lấy các part con có tên chứa "ring"
		neverUnify = true,           -- Bắt buộc vẽ SelectionBox riêng trên từng vòng ring, không gộp kín sàn
		isMultiWave = true,          -- Tái sử dụng các part con qua nhiều đợt sóng (Wave 1, 2, 3), KHÔNG xóa vĩnh viễn khi mờ đi
	},
	["secondbossmovingbeam"] = {
		name = "secondBossMovingBeam",
		isTelegraph = false,
		hasSyntheticTelegraph = true, -- Moving Trajectory Box màu Cam đi cùng beam chuẩn V1
		telegraphLength = 40,         -- Độ dài nhìn trước 40 studs phía trước thanh beam
	},
	["thirdbossbouncingorb"] = {
		name = "thirdBossBouncingOrb",
		isTelegraph = false,
		hasSyntheticTelegraph = true, -- Moving Trajectory Box màu Cam di chuyển theo quả cầu nảy
		telegraphLength = 28,         -- Độ dài nhìn trước 28 studs phía trước quả cầu
	},
	["secondbossyelloworb"] = {
		name = "secondBossYellowOrb",
		isTelegraph = false,
		hasSyntheticTelegraph = false, -- Quả cầu vật lý lăn/bay, KHÔNG phải tia laser và không có vùng cam gây sát thương
	},
	["secondbossredorb"] = {
		name = "secondBossRedOrb",
		isTelegraph = false,
		hasSyntheticTelegraph = false,
	},
	["secondbossgreenorb"] = {
		name = "secondBossGreenOrb",
		isTelegraph = false,
		hasSyntheticTelegraph = false,
	},
	["secondbosscriclehitbox"] = {
		name = "secondBossCricleHitbox",
		isTelegraph = false,
		hasSyntheticTelegraph = true,
		telegraphLength = 95.0,
		dangerRadius = 8.0,
		isExpandingCone = true,
		expansionRate = 0.25,
	},
	["secondbosscirclehitbox"] = {
		name = "secondBossCircleHitbox",
		isTelegraph = false,
		hasSyntheticTelegraph = true,
		telegraphLength = 95.0,
		dangerRadius = 8.0,
		isExpandingCone = true,
		expansionRate = 0.25,
	},
}

local function getCustomHazardConfig(inst: Instance): CustomHazardConfig?
	if not inst then return nil end
	local nameLower = inst.Name:lower():gsub("%s+", "")
	local cfg = CUSTOM_HAZARDS[nameLower]
	if cfg then return cfg end
	if nameLower:find("seekingspike") then
		return CUSTOM_HAZARDS["firstbossseekingspikes"]
	end
	if nameLower:find("bigspike") then
		return CUSTOM_HAZARDS["firstbossbigspike"]
	end
	if nameLower:find("beampart") or nameLower:find("firstbossbeam") then
		return CUSTOM_HAZARDS["firstbossbeampart"]
	end
	if nameLower:find("laserprecast") or (nameLower == "model" and inst:FindFirstChild("precast")) then
		return CUSTOM_HAZARDS["firstbosslaserprecast"]
	end
	if nameLower:find("attachpart") then
		return CUSTOM_HAZARDS["firstbossattachpart"]
	end
	if nameLower:find("sundisk") then
		return CUSTOM_HAZARDS["firstbosssundiskbeampart"]
	end
	if nameLower:find("blindingblast") then
		return CUSTOM_HAZARDS["firstbossblindingblastbeam"]
	end
	if nameLower:find("skyshot") then
		return CUSTOM_HAZARDS["firstbossskyshot"]
	end
	if nameLower:find("multiring") then
		return CUSTOM_HAZARDS["thirdbossmultirings"]
	end
	if nameLower:find("crisscross") then
		return CUSTOM_HAZARDS["firstbosscrisscross"]
	end
	if nameLower:find("movingbeam") then
		return CUSTOM_HAZARDS["secondbossmovingbeam"]
	end
	if nameLower:find("bouncingorb") and not nameLower:find("beam") then
		return CUSTOM_HAZARDS["thirdbossbouncingorb"]
	end
	if nameLower:find("yelloworb") then
		return CUSTOM_HAZARDS["secondbossyelloworb"]
	end
	if nameLower:find("redorb") then
		return CUSTOM_HAZARDS["secondbossredorb"]
	end
	if nameLower:find("greenorb") then
		return CUSTOM_HAZARDS["secondbossgreenorb"]
	end
	if nameLower:find("secondboss") and nameLower:find("orb") and not nameLower:find("explosion") then
		return CUSTOM_HAZARDS["secondbossyelloworb"]
	end
	if nameLower:find("cricle") or nameLower:find("circlehitbox") then
		return CUSTOM_HAZARDS["secondbosscriclehitbox"]
	end
	if inst.Parent and inst.Parent ~= Workspace then
		local parentLower = inst.Parent.Name:lower():gsub("%s+", "")
		local pCfg = CUSTOM_HAZARDS[parentLower]
		if pCfg then return pCfg end
		if parentLower:find("seekingspike") then
			return CUSTOM_HAZARDS["firstbossseekingspikes"]
		end
		if parentLower:find("bigspike") then
			return CUSTOM_HAZARDS["firstbossbigspike"]
		end
		if parentLower:find("beampart") or parentLower:find("firstbossbeam") then
			return CUSTOM_HAZARDS["firstbossbeampart"]
		end
		if parentLower:find("laserprecast") then
			return CUSTOM_HAZARDS["firstbosslaserprecast"]
		end
		if parentLower:find("attachpart") then
			return CUSTOM_HAZARDS["firstbossattachpart"]
		end
		if parentLower:find("sundisk") then
			return CUSTOM_HAZARDS["firstbosssundiskbeampart"]
		end
		if parentLower:find("blindingblast") then
			return CUSTOM_HAZARDS["firstbossblindingblastbeam"]
		end
		if parentLower:find("skyshot") then
			return CUSTOM_HAZARDS["firstbossskyshot"]
		end
		if parentLower:find("multiring") then
			return CUSTOM_HAZARDS["thirdbossmultirings"]
		end
		if parentLower:find("crisscross") then
			return CUSTOM_HAZARDS["firstbosscrisscross"]
		end
		if parentLower:find("movingbeam") then
			return CUSTOM_HAZARDS["secondbossmovingbeam"]
		end
		if parentLower:find("bouncingorb") and not parentLower:find("beam") then
			return CUSTOM_HAZARDS["thirdbossbouncingorb"]
		end
		if parentLower:find("yelloworb") then
			return CUSTOM_HAZARDS["secondbossyelloworb"]
		end
		if parentLower:find("redorb") then
			return CUSTOM_HAZARDS["secondbossredorb"]
		end
		if parentLower:find("greenorb") then
			return CUSTOM_HAZARDS["secondbossgreenorb"]
		end
		if parentLower:find("secondboss") and parentLower:find("orb") and not parentLower:find("explosion") then
			return CUSTOM_HAZARDS["secondbossyelloworb"]
		end
		if parentLower:find("cricle") or parentLower:find("circlehitbox") then
			return CUSTOM_HAZARDS["secondbosscriclehitbox"]
		end
	end
	return nil
end

--// Trích xuất các BasePart nguy hiểm từ Instance (Part hoặc Model/Folder)
local function extractHazardParts(instance: Instance, customConfig: CustomHazardConfig?): { [BasePart]: boolean }
	local parts: { [BasePart]: boolean } = {}

	local function isValidPart(p: Instance): boolean
		if not p or not p:IsA("BasePart") or filter.IsIgnoredPart(p) then return false end
		local pLower = p.Name:lower()
		if pLower:find("debug", 1, true) or p.Name:sub(1, 3) == "TM_" or pLower:find("smartdodge", 1, true) or pLower:find("smartautoplay", 1, true) then
			return false
		end

		if customConfig then
			-- Chiêu thức ngoại lệ theo danh sách tên: hợp lệ khi còn tồn tại trong Workspace
			return p.Parent ~= nil
		end

		-- Mặc định cho mọi chiêu thức khác: bắt buộc Material == Neon và chưa mờ
		return p.Material == Enum.Material.Neon and p.Transparency < FADE_THRESHOLD
	end

	if instance:IsA("BasePart") then
		if isValidPart(instance) then
			parts[instance] = true
		end
	elseif instance:IsA("Model") then
		-- Nếu cấu hình trong Whitelist chỉ định rõ ràng Part con cần lấy (theo tên chính xác hoặc từ khóa chứa)
		if customConfig and (customConfig.targetChildName or customConfig.targetChildContains) then
			local targetExact = customConfig.targetChildName and customConfig.targetChildName:lower()
			local targetContains = customConfig.targetChildContains and customConfig.targetChildContains:lower()
			for _, desc in ipairs(instance:GetDescendants()) do
				if desc:IsA("BasePart") and desc.Parent and not filter.IsIgnoredPart(desc) then
					local descName = desc.Name:lower()
					local matches = false
					if targetExact and descName == targetExact then
						matches = true
					elseif targetContains and descName:find(targetContains) then
						matches = true
					end
					if matches then
						parts[desc] = true
					end
				end
			end
			return parts
		end

		-- Mặc định cho Model thông thường: duyệt lấy các part hợp lệ
		for _, desc in ipairs(instance:GetDescendants()) do
			if isValidPart(desc) then
				parts[desc] = true
			end
		end
	end

	return parts
end

--// Trích xuất thông số tia Beam / Projectile giải tích (chuẩn V1)
local function extractBeamGeometry(instance: Instance, customConfig: CustomHazardConfig?): (Vector3?, Vector3?, number?, number?)
	local nameLower = instance.Name:lower():gsub("%s+", "")
	local isBeamHazard = (customConfig and (customConfig.isTelegraph or customConfig.hasSyntheticTelegraph))
		or nameLower:find("beampart") ~= nil
		or nameLower:find("bigspike") ~= nil
		or nameLower:find("seekingspike") ~= nil

	if not isBeamHazard then
		return nil, nil, nil, nil
	end

	local originPos = Vector3.zero
	if instance:IsA("BasePart") then
		originPos = instance.Position
	elseif instance:IsA("Model") then
		local p = instance.PrimaryPart or instance:FindFirstChildWhichIsA("BasePart")
		originPos = p and p.Position or instance:GetPivot().Position
	end

	local forward2D: Vector3? = nil
	local detectedLength: number? = nil

	-- 1. Ưu tiên tìm Attachment2 (điểm đích của tia Beam trong Dungeon Quest)
	local att2 = instance:FindFirstChild("Attachment2", true)
	if att2 and att2:IsA("Attachment") then
		local delta = att2.WorldPosition - originPos
		local delta2D = Vector3.new(delta.X, 0, delta.Z)
		if delta2D.Magnitude > 0.5 then
			forward2D = delta2D.Unit
			detectedLength = delta2D.Magnitude
		end
	end

	-- 2. Tìm Beam instance (Attachment0 -> Attachment1)
	if not forward2D then
		local beam = instance:FindFirstChildWhichIsA("Beam", true)
		if beam and beam.Attachment0 and beam.Attachment1 then
			local delta = beam.Attachment1.WorldPosition - beam.Attachment0.WorldPosition
			local delta2D = Vector3.new(delta.X, 0, delta.Z)
			if delta2D.Magnitude > 0.5 then
				forward2D = delta2D.Unit
				detectedLength = delta2D.Magnitude
			end
		end
	end

	-- 3. Tìm companion Beam trong ActiveHazards hoặc Workspace (CHỈ tìm Beam thật như firstBossBeamPart, thirdBossBeamPart)
	if not forward2D and not nameLower:find("crisscross") then
		for otherInst, otherHazard in pairs(activeHazards) do
			if otherHazard and otherHazard.forward2D and otherHazard.instance ~= instance then
				local isTrueBeam = otherHazard.isTelegraph or (otherHazard.name and otherHazard.name:lower():find("beam") ~= nil)
				if isTrueBeam then
					local otherOrigin = otherHazard.beamOrigin or otherHazard.position
					local dist = (Vector3.new(otherOrigin.X - originPos.X, 0, otherOrigin.Z - originPos.Z)).Magnitude
					if dist <= 25.0 then
						forward2D = otherHazard.forward2D
						detectedLength = otherHazard.maxLookahead
						originPos = otherOrigin
						break
					end
				end
			end
		end
	end

	-- 3b. Tìm companion Beam Part trong Workspace nếu chưa kịp đăng ký trong activeHazards
	if not forward2D and not nameLower:find("crisscross") then
		for _, child in ipairs(Workspace:GetChildren()) do
			if child ~= instance and child:IsA("BasePart") and child.Name:lower():find("beampart") then
				local dist = (Vector3.new(child.Position.X - originPos.X, 0, child.Position.Z - originPos.Z)).Magnitude
				if dist <= 25.0 then
					local att = child:FindFirstChild("Attachment2", true)
					if att and att:IsA("Attachment") then
						local delta = att.WorldPosition - child.Position
						local delta2D = Vector3.new(delta.X, 0, delta.Z)
						if delta2D.Magnitude > 0.5 then
							forward2D = delta2D.Unit
							detectedLength = delta2D.Magnitude
							originPos = child.Position
							break
						end
					end
				end
			end
		end
	end

	-- 0. Nếu là Expanding Cone (secondBossCricleHitbox - Boss 2):
	-- Hướng lan tỏa xuất phát từ vị trí spawn của vòng tròn hướng thẳng về phía Player
	if customConfig and customConfig.isExpandingCone then
		local localPlayer = Players.LocalPlayer
		local rootPart = localPlayer and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
		local playerPos = rootPart and rootPart.Position
		if playerPos then
			local diff = Vector3.new(playerPos.X - originPos.X, 0, playerPos.Z - originPos.Z)
			local dist = diff.Magnitude
			if dist > 0.3 then
				forward2D = diff.Unit
				detectedLength = math.clamp(dist + 35.0, 85.0, 160.0)
			end
		end
	end

	-- 4. Fallback theo LookVector của Part / Model
	if not forward2D then
		-- TUYỆT ĐỐI KHÔNG dùng LookVector cho CrissCross vì mesh đang xoay tròn (spinning) quanh trục Y liên tục trong script game!
		-- Hướng của CrissCross sẽ được xác định chính xác 100% bằng độ dịch chuyển tọa độ (Motion Delta) ngay trên Heartbeat.
		if not nameLower:find("crisscross") then
			local look = (instance:IsA("BasePart") and instance.CFrame.LookVector)
				or (instance:IsA("Model") and instance:GetPivot().LookVector)
			if look then
				local look2D = Vector3.new(look.X, 0, look.Z)
				if look2D.Magnitude > 0.001 then
					forward2D = look2D.Unit
				end
			end
		end
	end

	if not forward2D and not nameLower:find("crisscross") then
		forward2D = Vector3.new(0, 0, -1)
	end

	-- 5. Xác định dangerRadius (bán kính nguy hiểm 1/2 bề rộng) và maxLookahead (chiều dài tia định hướng)
	local isSeekingSpike = nameLower:find("seekingspike") ~= nil
	local isBigSpike = nameLower:find("bigspike") ~= nil

	-- Nếu là firstBossBeamPart: Xác định xem nó thuộc về Big Spike hay Seeking Spikes
	if not isSeekingSpike and not isBigSpike and nameLower:find("beampart") then
		local beamInst = instance:FindFirstChildWhichIsA("Beam", true)
		if beamInst and beamInst.Width0 and beamInst.Width0 >= 20 then
			isBigSpike = true
		else
			-- Quét kiểm tra companion spike ở quanh originPos trong activeHazards
			for _, other in pairs(activeHazards) do
				local oName = other.cleanName:lower()
				local oOrigin = other.beamOrigin or other.position
				if (Vector3.new(oOrigin.X - originPos.X, 0, oOrigin.Z - originPos.Z)).Magnitude < 25 then
					if oName:find("bigspike") then
						isBigSpike = true
						break
					elseif oName:find("seekingspike") then
						isSeekingSpike = true
						break
					end
				end
			end
			-- Quét kiểm tra companion spike trong Workspace nếu chưa có trong activeHazards
			if not isBigSpike and not isSeekingSpike then
				for _, child in ipairs(Workspace:GetChildren()) do
					if child ~= instance and child:IsA("BasePart") then
						local cName = child.Name:lower()
						if cName:find("bigspike") and (child.Position - originPos).Magnitude < 25 then
							isBigSpike = true
							break
						elseif cName:find("seekingspike") and (child.Position - originPos).Magnitude < 25 then
							isSeekingSpike = true
							break
						end
					end
				end
			end
		end
	end

	local dangerRadius = 20.0
	local defaultLen = 140.0
	if isSeekingSpike then
		dangerRadius = 8.0 -- Bề rộng 16 studs (chuẩn Seeking Spikes)
		defaultLen = (SKILL_CORRIDOR_MAP and SKILL_CORRIDOR_MAP["boss1_seekingspikes"] and SKILL_CORRIDOR_MAP["boss1_seekingspikes"].currentLength) or 120.0
	elseif isBigSpike then
		dangerRadius = 20.0 -- Bề rộng 40 studs (chuẩn Big Spike)
		defaultLen = (SKILL_CORRIDOR_MAP and SKILL_CORRIDOR_MAP["boss1_bigspike"] and SKILL_CORRIDOR_MAP["boss1_bigspike"].currentLength) or 140.0
	elseif customConfig and customConfig.isExpandingCone then
		dangerRadius = customConfig.dangerRadius or 8.0
		defaultLen = customConfig.telegraphLength or 95.0
	else
		local beam = instance:FindFirstChildWhichIsA("Beam", true)
		if beam then
			local maxW = math.max(beam.Width0 or 0, beam.Width1 or 0)
			if maxW >= 20 then
				dangerRadius = maxW / 2
			elseif maxW > 0 then
				dangerRadius = math.max(maxW / 2, 8.0)
			end
		elseif customConfig and customConfig.width then
			dangerRadius = customConfig.width / 2
		end
	end

	local maxLookahead = math.clamp(detectedLength or (customConfig and customConfig.telegraphLength) or defaultLen, 40.0, 250.0)

	return originPos, forward2D, dangerRadius, maxLookahead
end

--// Hủy đăng ký hiểm họa
local function unregisterHazard(instance: Instance, reason: string?)
	local hazard = activeHazards[instance]
	if not hazard then return end

	-- Dọn dẹp connections
	for _, c in ipairs(hazard.connections) do
		pcall(function() c:Disconnect() end)
	end
	table.clear(hazard.connections)

	-- Xóa visual (SelectionBox + Name Tag)
	visuals.RemoveHazardVisuals(hazard)

	activeHazards[instance] = nil
	hazardCount = math.max(0, hazardCount - 1)

	if logHazards then
		print(("[SmartDodgeV2] 🟢 Threat Cleared: %s (%s)"):format(hazard.name, reason or "Ended"))
	end

	-- Dispatch events
	for _, cb in ipairs(hazardRemovedCallbacks) do
		pcall(cb, hazard)
	end
	for _, cb in ipairs(hazardChangedCallbacks) do
		pcall(cb, hazardCount, hazard)
	end
end

--// Đăng ký một hiểm họa mới khi phát hiện part Neon hoặc chiêu trong danh sách tên
local function registerHazard(instance: Instance)
	if not enabled or activeHazards[instance] or instance:IsA("Folder") or filter.IsIgnoredInstance(instance) then
		return
	end
	local nameLower = instance.Name:lower()
	if nameLower:find("debug", 1, true) or instance.Name:sub(1, 3) == "TM_" or nameLower:find("smartdodge", 1, true) or nameLower:find("smartautoplay", 1, true) then
		return
	end

	local customConfig = getCustomHazardConfig(instance)
	local parts = extractHazardParts(instance, customConfig)

	-- Nếu chưa có part nào hợp lệ lúc vừa spawn:
	if next(parts) == nil then
		-- Giống V1: Nếu là Model mới tạo, các part con có thể chưa kịp replicate vào Model
		-- Thiết lập watcher 1.5s để đón đầu khi part con xuất hiện
		if instance:IsA("Model") then
			local c: RBXScriptConnection?
			c = instance.DescendantAdded:Connect(function(desc)
				if desc:IsA("BasePart") and not filter.IsIgnoredPart(desc) then
					local isValid = false
					if customConfig then
						if customConfig.targetChildName then
							isValid = (desc.Name:lower() == customConfig.targetChildName:lower())
						elseif customConfig.targetChildContains then
							isValid = (desc.Name:lower():find(customConfig.targetChildContains:lower()) ~= nil)
						else
							isValid = (desc.Parent ~= nil)
						end
					else
						isValid = (desc.Material == Enum.Material.Neon and desc.Transparency < FADE_THRESHOLD)
					end
					if isValid then
						if c then c:Disconnect(); c = nil end
						registerHazard(instance)
					end
				end
			end)
			task.delay(1.5, function()
				if c then c:Disconnect(); c = nil end
			end)
		end
		return
	end

	local isMultiWave = (customConfig and customConfig.isMultiWave) == true

	-- Đối với Model hoặc đòn đánh đa part, xác định tâm chuẩn xác nhất:
	local pos = Vector3.zero
	if instance:IsA("BasePart") then
		pos = instance.Position
	elseif instance:IsA("Model") then
		local centerPart = instance:FindFirstChild("center") or instance:FindFirstChild("Center") or instance.PrimaryPart
		pos = (centerPart and centerPart:IsA("BasePart")) and centerPart.Position or instance:GetPivot().Position
	else
		local firstPart = next(parts)
		pos = firstPart and firstPart.Position or Vector3.zero
	end

	local localPlayer = Players.LocalPlayer
	local rootPart = localPlayer and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
	local dist = rootPart and (rootPart.Position - pos).Magnitude or 0

	-- Tập hợp toàn bộ các part thuộc về hazard này (dùng để lắng nghe kết nối)
	local trackedParts: { [BasePart]: boolean } = {}
	for p in pairs(parts) do
		trackedParts[p] = true
	end

	-- Đối với đòn đánh đa đợt sóng (như thirdBossMultiRings):
	-- Ở thời điểm spawn, chỉ giữ lại trong hazard.activeParts những part ĐANG SÁNG (< FADE_THRESHOLD).
	-- Các part chưa kích hoạt sẽ ở trạng thái chờ (vẫn nằm trong trackedParts) để đón Wave 2, Wave 3.
	if isMultiWave then
		for p in pairs(trackedParts) do
			if p.Transparency >= FADE_THRESHOLD then
				parts[p] = nil
			end
		end
	end

	local neonCount = 0
	for _ in pairs(parts) do neonCount = neonCount + 1 end

	local isBoss = false
	-- Mốc thời gian & trạng thái: Nếu Boss chưa spawn thì tại thời điểm này KHÔNG THỂ là chiêu của Boss (100% Enemy/Mob)
	local bossIsActive = (shared.IsBossActive and shared.IsBossActive()) or (lastBossSpawnTime > 0)
	if bossIsActive then
		if customConfig ~= nil then
			isBoss = true
		else
			local nameLower = instance.Name:lower()
			if nameLower:find("boss") ~= nil then
				isBoss = true
			elseif instance.Parent and instance.Parent ~= Workspace and instance.Parent.Name:lower():find("boss") ~= nil then
				isBoss = true
			else
				isBoss = true
			end
		end
	end

	local hazard: types.ActiveHazard = {
		instance = instance,
		name = instance.Name,
		cleanName = instance.Name:gsub("^%s+", ""):gsub("%s+$", ""),
		spawnTime = os.clock(),
		activeParts = parts,
		neonCount = neonCount,
		position = pos,
		lastPos = pos,
		distanceToPlayer = dist,
		connections = {},
		isTelegraph = customConfig and customConfig.isTelegraph or false,
		isCustomHazard = customConfig ~= nil,
		neverUnify = customConfig and customConfig.neverUnify or false,
		hasSyntheticTelegraph = customConfig and customConfig.hasSyntheticTelegraph or false,
		telegraphLength = customConfig and customConfig.telegraphLength or nil,
		isHomingToPlayer = customConfig and customConfig.isHomingToPlayer or false,
		isMultiWave = isMultiWave,
		isBossHazard = isBoss,
		isExpandingCone = (customConfig and customConfig.isExpandingCone) or false,
		expansionRate = (customConfig and customConfig.expansionRate) or 0.25,
		hasLaunched = (instance:IsA("BasePart") and instance.Transparency < 0.5) or false,
		launchTime = (instance:IsA("BasePart") and instance.Transparency < 0.5) and os.clock() or nil,
	}

	activeHazards[instance] = hazard
	hazardCount = hazardCount + 1

	local bOrigin, bFwd, bRadius, bReach = extractBeamGeometry(instance, customConfig)
	if bFwd and bRadius then
		hazard.beamOrigin = bOrigin
		hazard.forward2D = bFwd
		hazard.dangerRadius = bRadius
		hazard.maxLookahead = bReach
		hazard.width = bRadius * 2

		-- Tự động đồng bộ hướng tia và gốc tia sang companion spike / beam nếu đã đăng ký trước đó
		for _, otherHazard in pairs(activeHazards) do
			if otherHazard ~= hazard and (otherHazard.name:lower():find("spike") or otherHazard.name:lower():find("beam")) then
				local oPos = otherHazard.beamOrigin or otherHazard.position
				if (Vector3.new(oPos.X - bOrigin.X, 0, oPos.Z - bOrigin.Z)).Magnitude < 25 then
					if not otherHazard.forward2D or otherHazard.isCustomHazard then
						otherHazard.forward2D = bFwd
						otherHazard.beamOrigin = bOrigin
						otherHazard.maxLookahead = bReach
					end
				end
			end
		end
	end

	-- Lắng nghe Attachment2 nếu vị trí WorldPosition được cập nhật trễ
	local att2 = instance:FindFirstChild("Attachment2", true)
	if att2 and att2:IsA("Attachment") then
		table.insert(hazard.connections, att2:GetPropertyChangedSignal("WorldPosition"):Connect(function()
			local origin = hazard.beamOrigin or hazard.position
			local delta = att2.WorldPosition - origin
			local delta2D = Vector3.new(delta.X, 0, delta.Z)
			if delta2D.Magnitude > 0.5 then
				hazard.forward2D = delta2D.Unit
				hazard.maxLookahead = delta2D.Magnitude
			end
		end))
	end

	local partMinTrans: { [BasePart]: number } = {}
	local partHasFlashed: { [BasePart]: boolean } = {}
	for p in pairs(trackedParts) do
		local curT = p.Transparency
		partMinTrans[p] = curT
		if curT <= 0.35 then
			partHasFlashed[p] = true
		end
	end

	-- Lắng nghe từng part khi mờ đi / sáng lên / bị hủy
	local function checkPart(p: BasePart)
		local isValid = (p.Parent ~= nil)
		if not isValid then
			trackedParts[p] = nil
			parts[p] = nil
			visuals.RemoveHazardPart(hazard, p)
			local rem = 0
			for _ in pairs(trackedParts) do rem = rem + 1 end
			if rem == 0 then
				unregisterHazard(instance, "All parts destroyed")
			end
			return
		end

		if isMultiWave then
			local curTrans = p.Transparency
			if curTrans < FADE_THRESHOLD then
				-- Part sáng lên trong đợt sóng tấn công mới
				if not parts[p] then
					parts[p] = true
					hazard.neonCount = hazard.neonCount + 1
					visuals.AttachPartVisual(hazard, p)
				end
			else
				-- Part mờ đi khi đợt sóng nổ xong hoặc đang chờ
				if parts[p] then
					parts[p] = nil
					hazard.neonCount = math.max(0, hazard.neonCount - 1)
					visuals.RemoveHazardPart(hazard, p)
				end
			end
			-- TUYỆT ĐỐI KHÔNG gọi unregisterHazard khi parts trống ở giữa các wave!
			return
		end

		local curTrans = p.Transparency
		local minT = partMinTrans[p] or curTrans
		if curTrans < minT then
			minT = curTrans
			partMinTrans[p] = minT
		end
		if minT <= 0.35 or curTrans < 0.5 then
			partHasFlashed[p] = true
			if not hazard.hasLaunched then
				hazard.hasLaunched = true
				hazard.launchTime = os.clock()
			end
		end
		-- Pha tan biến sớm: Khi đã từng rõ nét (<= 0.35), chỉ cần độ mờ tăng thêm >= 0.15 hoặc >= 0.40 là xóa ngay
		local hasDecayedAfterFlash = (partHasFlashed[p] == true) and (curTrans >= (minT + 0.15) or curTrans >= 0.40)

		if not hazard.isCustomHazard then
			-- Chiêu thông thường: yêu cầu còn Neon, chưa mờ và chưa tan biến
			if curTrans >= FADE_THRESHOLD or p.Material ~= Enum.Material.Neon or hasDecayedAfterFlash then
				isValid = false
			end
		elseif hazard.isTelegraph then
			-- Tia định hướng: chỉ mất khi bị hủy khỏi Workspace
			isValid = (p.Parent ~= nil)
		else
			-- Custom Hazard (như Seeking Spike, Big Spike, Third Boss Missile, Ice Spikes):
			-- Trong giai đoạn tụ lực / precast (chưa từng sáng và chưa hết thời gian tụ lực 5s) thì luôn coi là hợp lệ!
			if (not partHasFlashed[p]) and (not hazard.hasLaunched) and ((os.clock() - hazard.spawnTime) < 5.0) then
				isValid = (p.Parent ~= nil)
			else
				isValid = (p.Parent ~= nil) and (curTrans < FADE_THRESHOLD)
			end
		end

		if not isValid then
			trackedParts[p] = nil
			parts[p] = nil
			visuals.RemoveHazardPart(hazard, p)
			local rem = 0
			for _ in pairs(parts) do rem = rem + 1 end
			hazard.neonCount = rem
			if rem == 0 then
				unregisterHazard(instance, "Faded / Destroyed")
			end
		end
	end

	for part in pairs(trackedParts) do
		table.insert(hazard.connections, part:GetPropertyChangedSignal("Transparency"):Connect(function()
			checkPart(part)
		end))
		if not hazard.isCustomHazard then
			table.insert(hazard.connections, part:GetPropertyChangedSignal("Material"):Connect(function()
				checkPart(part)
			end))
		end
		table.insert(hazard.connections, part.AncestryChanged:Connect(function()
			checkPart(part)
		end))
	end

	-- Lắng nghe các part con được nạp trễ vào Model
	if instance:IsA("Model") then
		table.insert(hazard.connections, instance.DescendantAdded:Connect(function(desc)
			if not activeHazards[instance] then return end
			if desc:IsA("BasePart") and not filter.IsIgnoredPart(desc) then
				local isValid = false
				if customConfig then
					if customConfig.targetChildName then
						isValid = (desc.Name:lower() == customConfig.targetChildName:lower())
					elseif customConfig.targetChildContains then
						isValid = (desc.Name:lower():find(customConfig.targetChildContains:lower()) ~= nil)
					else
						isValid = hazard.isTelegraph or (desc.Transparency < FADE_THRESHOLD)
					end
				else
					isValid = (desc.Transparency < FADE_THRESHOLD and desc.Material == Enum.Material.Neon)
				end

				if isValid and not trackedParts[desc] then
					trackedParts[desc] = true
					table.insert(hazard.connections, desc:GetPropertyChangedSignal("Transparency"):Connect(function()
						checkPart(desc)
					end))
					if not hazard.isCustomHazard then
						table.insert(hazard.connections, desc:GetPropertyChangedSignal("Material"):Connect(function()
							checkPart(desc)
						end))
					end
					table.insert(hazard.connections, desc.AncestryChanged:Connect(function()
						checkPart(desc)
					end))
					checkPart(desc)
				end
			end
		end))
	end

	table.insert(hazard.connections, instance.AncestryChanged:Connect(function()
		if not instance.Parent then
			unregisterHazard(instance, "Removed from Workspace")
		end
	end))

	-- Gắn SelectionBox 3D vàng đậm và Name Tag Parent(Part)
	visuals.AttachHazardVisuals(hazard)

	if logHazards then
		print(("[SmartDodgeV2] 🚨 Neon Threat Detected: %s | Neon Parts: %d | Dist: %.1f studs"):format(
			hazard.name, hazard.neonCount, hazard.distanceToPlayer
		))
	end

	-- Dispatch events
	for _, cb in ipairs(hazardAddedCallbacks) do
		pcall(cb, hazard)
	end
	for _, cb in ipairs(hazardChangedCallbacks) do
		pcall(cb, hazardCount, hazard)
	end
end

--// Vòng lặp cập nhật vị trí thực tế, chuyển động đạn bay và cự ly tới Player theo thời gian thực
local function startUpdateLoop()
	table.insert(connections, RunService.Heartbeat:Connect(function()
		if not enabled then return end
		local localPlayer = Players.LocalPlayer
		local rootPart = localPlayer and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
		local pPos = rootPart and rootPart.Position

		for inst, hazard in pairs(activeHazards) do
			if not inst.Parent then
				unregisterHazard(inst, "Parent Nil")
				continue
			end

			-- Tự động dọn dẹp các đạn bay đã tan biến (Transparency >= FADE_THRESHOLD) khi hết hành trình bay
			-- TUYỆT ĐỐI KHÔNG dọn dẹp tia định hướng (luôn có Part trong suốt) hoặc Custom Hazard đang tụ lực (precast)
			if inst:IsA("BasePart") and not hazard.isTelegraph and not hazard.isMultiWave then
				if inst.Transparency < 0.5 then
					hazard.hasLaunched = true
				end
				local isPrecasting = hazard.isCustomHazard and (not hazard.hasLaunched) and ((os.clock() - hazard.spawnTime) < 5.0)
				if not isPrecasting and inst.Transparency >= FADE_THRESHOLD then
					if (not hazard.isCustomHazard) or hazard.hasLaunched or ((os.clock() - hazard.spawnTime) >= 5.0) then
						unregisterHazard(inst, "Faded Projectile")
						continue
					end
				end
			end

			-- 1. Cập nhật vị trí thực tế theo thời gian thực (Real-time Position Tracking)
			local curPos = (inst:IsA("BasePart") and inst.Position)
				or (inst:IsA("Model") and (inst.PrimaryPart and inst.PrimaryPart.Position or inst:GetPivot().Position))
				or hazard.position

			-- 2. Tự động tính toán hướng di chuyển thực tế từ độ dịch chuyển frame-to-frame (Motion Delta Vector)
			-- Miễn nhiễm 100% với việc mesh đạn bị xoay tròn (spinning mesh / drill animation của Boss 1)
			if hazard.lastPos then
				local moveDelta = curPos - hazard.lastPos
				local moveDelta2D = Vector3.new(moveDelta.X, 0, moveDelta.Z)
				if moveDelta2D.Magnitude > 0.08 then
					hazard.forward2D = moveDelta2D.Unit
				end
			end
			hazard.lastPos = curPos
			hazard.position = curPos

			-- 3. Cập nhật cự ly tới Player
			if pPos then
				hazard.distanceToPlayer = (hazard.position - pPos).Magnitude
			end
		end
	end))
end

--// API Public
function detection.SetEnabled(state: boolean)
	enabled = state
	if enabled then
		filter.Init()
		startUpdateLoop()

		-- Quét các object đã có sẵn trong Workspace
		for _, child in ipairs(Workspace:GetChildren()) do
			task.spawn(registerHazard, child)
		end

		-- Lắng nghe object mới sinh ra ở Workspace Depth 1
		table.insert(connections, Workspace.ChildAdded:Connect(function(child)
			task.spawn(registerHazard, child)
		end))

		if logHazards then
			print("[SmartDodgeV2] Threat Detection Engine Started (Pure Neon).")
		end
	else
		for _, c in ipairs(connections) do
			pcall(function() c:Disconnect() end)
		end
		table.clear(connections)

		for inst in pairs(activeHazards) do
			unregisterHazard(inst, "Detector Disabled")
		end
		visuals.ClearAll()
		filter.Cleanup()

		if logHazards then
			print("[SmartDodgeV2] Threat Detection Engine Stopped.")
		end
	end
end

function detection.IsEnabled(): boolean
	return enabled
end

function detection.SetLogHazards(state: boolean)
	logHazards = state
end

function detection.IsLogHazards(): boolean
	return logHazards
end

function detection.GetActiveHazards(): { [Instance]: types.ActiveHazard }
	return activeHazards
end

--// Trả về Boss 2 Orb đang kích hoạt (nếu có): part, colorName ("yellow"|"red"|"green"), instance, hazard
function detection.GetActiveBossOrb(): (BasePart?, string?, Instance?, types.ActiveHazard?)
	for inst, hazard in pairs(activeHazards) do
		if inst and inst.Parent then
			local cleanName = (inst.Name or ""):lower():gsub("%s+", "")
			local colorName: string? = nil

			if cleanName:find("yelloworb") then
				colorName = "yellow"
			elseif cleanName:find("redorb") then
				colorName = "red"
			elseif cleanName:find("greenorb") then
				colorName = "green"
			elseif cleanName:find("secondboss") and cleanName:find("orb") and not cleanName:find("explosion") then
				colorName = "yellow"
			end

			if colorName then
				local part: BasePart? = inst:IsA("BasePart") and inst or nil
				if not part and hazard.activeParts then
					for p in pairs(hazard.activeParts) do
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
					return part, colorName, inst, hazard
				end
			end
		end
	end
	return nil, nil, nil, nil
end

function detection.GetHazardCount(): number
	return hazardCount
end

function detection.OnHazardAdded(cb: (types.ActiveHazard) -> ())
	table.insert(hazardAddedCallbacks, cb)
end

function detection.OnHazardRemoved(cb: (types.ActiveHazard) -> ())
	table.insert(hazardRemovedCallbacks, cb)
end

function detection.OnHazardsChanged(cb: (number, types.ActiveHazard?) -> ())
	table.insert(hazardChangedCallbacks, cb)
end

--// Bảng ánh xạ các chiêu thức có vùng màu Cam (Orange Corridor / Telegraph Length)
local SKILL_CORRIDOR_MAP: { [string]: { keys: { string }, currentLength: number, defaultLength: number } } = {
	["boss2_orbs"] = {
		keys = { "secondbossyelloworb", "secondbossredorb", "secondbossgreenorb" },
		currentLength = 90,
		defaultLength = 90,
	},
	["boss1_beam"] = {
		keys = { "firstbossbeampart", "firstbosslaserprecast", "firstbossattachpart", "firstbosssundiskbeampart", "firstbossblindingblastbeam" },
		currentLength = 140,
		defaultLength = 140,
	},
	["boss1_seekingspikes"] = {
		keys = { "firstbossseekingspikes" },
		currentLength = 120,
		defaultLength = 120,
	},
	["boss1_bigspike"] = {
		keys = { "firstbossbigspike" },
		currentLength = 140,
		defaultLength = 140,
	},
	["boss1_skyshot"] = {
		keys = { "firstbossskyshot" },
		currentLength = 60,
		defaultLength = 60,
	},
	["boss1_crisscross"] = {
		keys = { "firstbosscrisscross" },
		currentLength = 28,
		defaultLength = 28,
	},
	["boss2_movingbeam"] = {
		keys = { "secondbossmovingbeam" },
		currentLength = 40,
		defaultLength = 40,
	},
	["boss3_missile"] = {
		keys = { "thirdbossmissile" },
		currentLength = 40,
		defaultLength = 40,
	},
	["boss3_bouncingorb"] = {
		keys = { "thirdbossbouncingorb" },
		currentLength = 28,
		defaultLength = 28,
	},
}

--// Cấu hình độ dài hành lang Cam chi tiết theo từng Skill
function detection.SetSkillCorridorLength(skillKey: string, val: number)
	if type(val) ~= "number" or val < 10 then return end
	local item = SKILL_CORRIDOR_MAP[skillKey]
	if not item then return end
	item.currentLength = val

	for _, k in ipairs(item.keys) do
		if CUSTOM_HAZARDS[k] then
			CUSTOM_HAZARDS[k].telegraphLength = val
		end
	end

	for _, hazard in pairs(activeHazards) do
		local n = hazard.name:lower():gsub("%s+", "")
		for _, k in ipairs(item.keys) do
			if n:find(k) or k:find(n) then
				hazard.telegraphLength = val
				hazard.maxLookahead = val

				-- Cập nhật cả companion hazard (spike / beam) nếu có
				for _, other in pairs(activeHazards) do
					if other ~= hazard and (other.name:lower():find("spike") or other.name:lower():find("beam")) then
						local oOrigin = other.beamOrigin or other.position
						local hOrigin = hazard.beamOrigin or hazard.position
						if (Vector3.new(oOrigin.X - hOrigin.X, 0, oOrigin.Z - hOrigin.Z)).Magnitude < 25 then
							other.telegraphLength = val
							other.maxLookahead = val
							pcall(function()
								visuals.UpdateCorridorLength(other, val)
							end)
						end
					end
				end

				pcall(function()
					visuals.UpdateCorridorLength(hazard, val)
				end)
				break
			end
		end
	end
end

function detection.GetSkillCorridorLength(skillKey: string): number
	local item = SKILL_CORRIDOR_MAP[skillKey]
	return item and item.currentLength or 40
end

function detection.SetOrbCorridorLength(val: number)
	detection.SetSkillCorridorLength("boss2_orbs", val)
end

function detection.GetOrbCorridorLength(): number
	return detection.GetSkillCorridorLength("boss2_orbs")
end

function detection.SetBeamCorridorLength(val: number)
	detection.SetSkillCorridorLength("boss1_beam", val)
end

function detection.GetBeamCorridorLength(): number
	return detection.GetSkillCorridorLength("boss1_beam")
end

function detection.GetLastBossSpawnTime(): number
	return lastBossSpawnTime
end

function detection.RemoveHazard(instance: Instance, reason: string?)
	unregisterHazard(instance, reason)
end

--// Khi Boss kích hoạt: Cập nhật mốc thời gian spawn Boss, xóa sạch toàn bộ các chiêu thức của quái thường cũ còn sót lại
if shared.OnBossActiveChanged then
	shared.OnBossActiveChanged(function(active)
		if active then
			lastBossSpawnTime = os.clock()
			for inst, haz in pairs(activeHazards) do
				if haz then
					-- Mọi skill sinh trước thời điểm này 100% là của enemy cũ
					if haz.spawnTime and haz.spawnTime < lastBossSpawnTime then
						haz.isBossHazard = false
					end
					if not haz.isBossHazard then
						unregisterHazard(inst, "Pre-boss enemy hazard purged")
					end
				end
			end
		else
			lastBossSpawnTime = 0
		end
	end)
end

--// Đăng ký dọn dẹp khi Hub unload
lifecycle.Register(function()
	detection.SetEnabled(false)
end)

return detection
