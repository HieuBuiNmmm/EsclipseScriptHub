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
}

--// Danh sách các chiêu thức / đòn đánh ngoại lệ theo tên (không bắt buộc Material == Neon)
local CUSTOM_HAZARDS: { [string]: CustomHazardConfig } = {
	["firstbossseekingspikes"] = {
		name = "firstBossSeekingSpikes",
		isTelegraph = false, -- Đòn đánh / Spike (màu Vàng tiêu chuẩn), vùng màu Cam tạo bởi tia firstBossBeamPart
		telegraphLength = 140,
	},
	["firstbossbigspike"] = {
		name = "firstBossBigSpike",
		isTelegraph = false, -- Đòn đánh / Gai khổng lồ (màu Vàng tiêu chuẩn), vùng màu Cam tạo bởi tia firstBossBeamPart
		telegraphLength = 140,
	},
	["firstbossbeampart"] = {
		name = "firstBossBeamPart",
		isTelegraph = true,  -- Tia định hướng báo trước (quy ước màu Cam định hướng)
		telegraphLength = 140,
	},
	["firstbosscrisscross"] = {
		name = "firstBossCrissCross",
		isTelegraph = false,
		hasSyntheticTelegraph = true, -- Tự tạo vùng Moving Trajectory màu Cam đi theo đạn chuẩn V1
		telegraphLength = 40,         -- Độ dài giới hạn nhìn trước 40 studs (chuẩn V1)
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
		hasSyntheticTelegraph = true,
		isHomingToPlayer = true,      -- Hướng màu Cam luôn quay bám theo Player
		telegraphLength = 25,         -- Giới hạn độ dài tối đa 25 studs (không nối 100% tới player)
	},
	["secondbossredorb"] = {
		name = "secondBossRedOrb",
		isTelegraph = false,
		hasSyntheticTelegraph = true,
		isHomingToPlayer = true,
		telegraphLength = 25,
	},
	["secondbossgreenorb"] = {
		name = "secondBossGreenOrb",
		isTelegraph = false,
		hasSyntheticTelegraph = true,
		isHomingToPlayer = true,
		telegraphLength = 25,
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
	if nameLower:find("beampart") then
		return CUSTOM_HAZARDS["firstbossbeampart"]
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
		if parentLower:find("beampart") then
			return CUSTOM_HAZARDS["firstbossbeampart"]
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
	end
	return nil
end

--// Trích xuất các BasePart nguy hiểm từ Instance (Part hoặc Model/Folder)
local function extractHazardParts(instance: Instance, customConfig: CustomHazardConfig?): { [BasePart]: boolean }
	local parts: { [BasePart]: boolean } = {}

	local function isValidPart(p: Instance): boolean
		if not p or not p:IsA("BasePart") or filter.IsIgnoredPart(p) then return false end

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

	local hazard: types.ActiveHazard = {
		instance = instance,
		name = instance.Name,
		cleanName = instance.Name:gsub("^%s+", ""):gsub("%s+$", ""),
		spawnTime = os.clock(),
		activeParts = parts,
		neonCount = neonCount,
		position = pos,
		distanceToPlayer = dist,
		connections = {},
		isTelegraph = customConfig and customConfig.isTelegraph or false,
		isCustomHazard = customConfig ~= nil,
		neverUnify = customConfig and customConfig.neverUnify or false,
		hasSyntheticTelegraph = customConfig and customConfig.hasSyntheticTelegraph or false,
		telegraphLength = customConfig and customConfig.telegraphLength or nil,
		isHomingToPlayer = customConfig and customConfig.isHomingToPlayer or false,
		isMultiWave = isMultiWave,
	}

	activeHazards[instance] = hazard
	hazardCount = hazardCount + 1

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
		if minT <= 0.35 then
			partHasFlashed[p] = true
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
			if curTrans < FADE_THRESHOLD then
				partHasFlashed[p] = true
			end
			if partHasFlashed[p] and (curTrans >= FADE_THRESHOLD or hasDecayedAfterFlash) then
				-- Đã từng xuất hiện và nay trở lại tàng hình hoặc bắt đầu tan biến -> đòn đánh đã kết thúc
				isValid = false
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

--// Vòng lặp cập nhật cự ly tới Player theo thời gian thực
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

			-- Cập nhật cự ly tới Player
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

--// Đăng ký dọn dẹp khi Hub unload
lifecycle.Register(function()
	detection.SetEnabled(false)
end)

return detection
