local __DIST __DIST={cache={}, load=function(m)if not __DIST.cache[m]then __DIST.cache[m]={c=__DIST[m]()}end return __DIST.cache[m].c end}do function __DIST.a()-- Cache toàn bộ services + tham chiếu LocalPlayer dùng chung cho DungeonQuest.

--// Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")

--// Player
local player = Players.LocalPlayer
if not player then
	local timeoutClock = os.clock() + 5
	repeat
		player = Players.LocalPlayer
		if player then break end
		task.wait(0.1)
	until os.clock() > timeoutClock
end

return {
	Players = Players,
	UserInputService = UserInputService,
	RunService = RunService,
	VirtualInputManager = VirtualInputManager,
	player = player,
}
end function __DIST.b()-- Owns resources that must be released when the hub is unloaded or executed again.

local lifecycle = {
	cleaned = false,
	callbacks = {},
}

function lifecycle.Register(callback)
	if type(callback) ~= "function" then return function() end end
	if lifecycle.cleaned then
		pcall(callback)
		return function() end
	end

	table.insert(lifecycle.callbacks, callback)
	return function()
		for index, registered in ipairs(lifecycle.callbacks) do
			if registered == callback then
				table.remove(lifecycle.callbacks, index)
				break
			end
		end
	end
end

function lifecycle.Cleanup()
	if lifecycle.cleaned then return end
	lifecycle.cleaned = true
	for index = #lifecycle.callbacks, 1, -1 do
		pcall(lifecycle.callbacks[index])
	end
	table.clear(lifecycle.callbacks)
end

function lifecycle.IsActive()
	return not lifecycle.cleaned
end

lifecycle.OnCleanup = lifecycle.Register

return lifecycle
end function __DIST.c()-- HazardScanner - Geometry & Danger Zones (DungeonQuest).
-- Range quét: chỉ X-Z (bỏ hẳn Y - chiêu đánh cả sàn).
-- Zone = union per-part: mỗi BasePart còn rõ (Transparency <= 0.85) trở thành 1 vùng con
-- (vòng tròn nếu Ball/Cylinder, OBB nếu box/union/mesh). Query point nặng 1 vùng con
-- nào là dính hazard. Broad phase: distSq tới bounding radius -> reject nhanh.
-- HazardZones cache trong info, nhưng mỗi vùng con vẫn re-check part còn sống lúc query
-- (part mờ > 0.85 tự ngừng gây nguy hiểm).

--// Table

local geometry = {}

--// State
local FADE_TRANSPARENCY_THRESHOLD = 0.85
local hazardPadding = 0.0 -- Mặc định = 0.0 cố định cho danger zone đỏ bình thường
local trajectoryMargin = 2.0 -- Margin riêng cho danger zone blue (các chiêu có trajectory)
local data = nil
local paddingChangedCallbacks = {}

--// Gioi han so vung con toi da 1 hazard (chong DoS qua nhieu part/mot object)
local MAX_PARTS_PER_HAZARD = 64

--// Data source do detection bom vao (tranh vong phu thuoc)
function geometry.BindDetection(dataSource)
	data = dataSource or nil
end

function geometry.GetHazardPadding()
	return hazardPadding
end
geometry.GetHitboxPadding = geometry.GetHazardPadding

function geometry.GetTrajectoryMargin()
	return trajectoryMargin
end

function geometry.SetTrajectoryMargin(value)
	if type(value) == "number" and value >= 0 and value ~= trajectoryMargin then
		trajectoryMargin = value
		geometry.InvalidateCache()
		for _, cb in ipairs(paddingChangedCallbacks) do
			pcall(cb, trajectoryMargin)
		end
	end
end

--// Xoa toan bo HazardZones cache tren cac hazard hien tai
function geometry.InvalidateCache()
	if data and data.GetActiveHazardsMap then
		for _, info in pairs(data.GetActiveHazardsMap()) do
			info.HazardZones = nil
		end
	end
end

function geometry.OnPaddingChanged(callback)
	if type(callback) == "function" then
		table.insert(paddingChangedCallbacks, callback)
	end
end

function geometry.SetHazardPadding(value)
	if type(value) == "number" and value >= 0 and value ~= hazardPadding then
		hazardPadding = value
		geometry.InvalidateCache()
		for _, cb in ipairs(paddingChangedCallbacks) do
			pcall(cb, hazardPadding)
		end
	end
end
geometry.SetHitboxPadding = geometry.SetHazardPadding

local ReplicatedStorage = game:GetService("ReplicatedStorage")

--// Danh sách ngoại lệ: các đối tượng (theo tên hoặc từ khóa) bị xem là Box/Mesh
--// nhưng thực tế nên được vẽ và tính toán thành VÙNG TRÒN (Circle Danger Zone).
local FORCE_CIRCLE_NAMES = {
	"firstBossCrissCross",
	"firstBossSeekingSpikes",
}

local ICE_SPIKES_KEYWORDS = {
	"smallicespikes",
	"mediumicespikes",
	"largeicespikes",
}

local cachedLargeRadius = nil

local function isIceSpikesChain(hazardName)
	if not hazardName or type(hazardName) ~= "string" then return false end
	local clean = hazardName:lower():gsub("%s+", "")
	if #clean == 0 then return false end
	for _, kw in ipairs(ICE_SPIKES_KEYWORDS) do
		if string.find(clean, kw, 1, true) then
			return true
		end
	end
	return false
end

function geometry.IsIceSpikesChain(hazardName)
	return isIceSpikesChain(hazardName)
end

local SECOND_BOSS_CHAIN_KEYWORDS = {
	"secondbosscriclehitbox",
	"secondbosscirclehitbox",
}

local secondBossCircleDuration = 1.2

local function isSecondBossCircleChain(hazardName)
	if not hazardName or type(hazardName) ~= "string" then return false end
	local clean = hazardName:lower():gsub("%s+", "")
	if #clean == 0 then return false end
	for _, kw in ipairs(SECOND_BOSS_CHAIN_KEYWORDS) do
		if string.find(clean, kw, 1, true) then
			return true
		end
	end
	return false
end

function geometry.IsSecondBossCircleChain(hazardName)
	return isSecondBossCircleChain(hazardName)
end

function geometry.GetSecondBossCircleDuration()
	return secondBossCircleDuration
end

function geometry.SetSecondBossCircleDuration(val)
	if type(val) == "number" and val >= 0.1 then
		secondBossCircleDuration = math.clamp(val, 0.1, 10.0)
		geometry.InvalidateCache()
	end
end

local MOVING_BEAM_KEYWORDS = {
	"movingbeam",
}

local function isMovingBeam(hazardName)
	if not hazardName or type(hazardName) ~= "string" then return false end
	local clean = hazardName:lower():gsub("%s+", "")
	if #clean == 0 then return false end
	for _, kw in ipairs(MOVING_BEAM_KEYWORDS) do
		if string.find(clean, kw, 1, true) then
			return true
		end
	end
	return false
end

function geometry.IsMovingBeam(hazardName)
	return isMovingBeam(hazardName)
end

local BIG_SPIKE_KEYWORDS = {
	"firstbossbigspike",
	"firstbossbeampart",
	"bigspike",
}

local function isBeamTelegraph(hazardName)
	if not hazardName or type(hazardName) ~= "string" then return false end
	local clean = hazardName:lower():gsub("%s+", "")
	return string.find(clean, "firstbossbeampart", 1, true) ~= nil
end

function geometry.IsBeamTelegraph(hazardName)
	return isBeamTelegraph(hazardName)
end

local function isBigSpike(hazardName)
	if not hazardName or type(hazardName) ~= "string" then return false end
	local clean = hazardName:lower():gsub("%s+", "")
	if #clean == 0 or string.find(clean, "seekingspike", 1, true) then return false end
	for _, kw in ipairs(BIG_SPIKE_KEYWORDS) do
		if string.find(clean, kw, 1, true) then
			return true
		end
	end
	return false
end

function geometry.IsBigSpike(hazardName)
	return isBigSpike(hazardName)
end

--// Tính toán hoặc đọc bán kính tối đa từ template largeIceSpikes trong ReplicatedStorage
local function getLargeIceSpikesMaxRadius()
	if cachedLargeRadius and cachedLargeRadius > 0 then
		return cachedLargeRadius
	end

	local fallbackRadius = 45.0
	local enemyProjectiles = ReplicatedStorage:FindFirstChild("enemyProjectiles")
	if not enemyProjectiles then
		return fallbackRadius
	end

	local template = enemyProjectiles:FindFirstChild("largeIceSpikes")
	if not template then
		for _, child in ipairs(enemyProjectiles:GetChildren()) do
			local clean = (child.Name or ""):lower():gsub("%s+", "")
			if clean == "largeicespikes" then
				template = child
				break
			end
		end
	end

	if not template then
		return fallbackRadius
	end

	local maxRadiusFound = 0
	local centerPos = Vector3.zero
	if template:IsA("Model") and template.PrimaryPart then
		centerPos = template.PrimaryPart.Position
	elseif template:IsA("BasePart") then
		centerPos = template.Position
	end

	local parts = {}
	if template:IsA("BasePart") then
		table.insert(parts, template)
	else
		for _, desc in ipairs(template:GetDescendants()) do
			if desc:IsA("BasePart") then
				table.insert(parts, desc)
			end
		end
	end

	if #parts == 0 then
		return fallbackRadius
	end

	for _, p in ipairs(parts) do
		local pSize = p.Size
		local halfExtent = math.max(pSize.X, pSize.Z) / 2
		local dist = (Vector3.new(p.Position.X, 0, p.Position.Z) - Vector3.new(centerPos.X, 0, centerPos.Z)).Magnitude
		local reach = dist + halfExtent
		if reach > maxRadiusFound then
			maxRadiusFound = reach
		end
	end

	if maxRadiusFound >= 5.0 then
		cachedLargeRadius = maxRadiusFound
		return cachedLargeRadius
	end

	return fallbackRadius
end

function geometry.GetLargeIceSpikesMaxRadius()
	return getLargeIceSpikesMaxRadius()
end

local function isForceCircle(hazardName)
	if not hazardName or type(hazardName) ~= "string" then return false end
	local clean = hazardName:lower():gsub("%s+", "")
	if #clean == 0 then return false end
	for _, target in ipairs(FORCE_CIRCLE_NAMES) do
		local cleanTarget = target:lower():gsub("%s+", "")
		if #cleanTarget > 0 and string.find(clean, cleanTarget, 1, true) then
			return true
		end
	end
	return false
end

function geometry.IsForceCircle(hazardName)
	return isForceCircle(hazardName)
end

function geometry.AddForceCircleName(name)
	if type(name) == "string" and #name > 0 then
		table.insert(FORCE_CIRCLE_NAMES, name)
		geometry.InvalidateCache()
	end
end

function geometry.GetForceCircleNames()
	return FORCE_CIRCLE_NAMES
end

--// Kiem tra part con hoat dong (khong mo qua nguong, con nam trong Workspace)
local function isPartAlive(part)
	return part and part.Parent and part.Transparency <= FADE_TRANSPARENCY_THRESHOLD
end

--// Tinh zone con cho 1 BasePart theo shape:
--// - Part Ball/Cylinder HOẶC nằm trong danh sách ngoại lệ (isForceCircle) -> vong tron X-Z (radius = 1/2 cạnh vuông)
--// - Box / Union / Mesh  -> OBB theo CFrame
local function computePartZone(part, forceCircle, isTrajectory)
	local size = part.Size
	local pad = isTrajectory and trajectoryMargin or hazardPadding
	local partName = (part and part.Name) or ""
	local parentName = (part and part.Parent and part.Parent.Name) or ""

	if isBigSpike(partName) or isBigSpike(parentName) then
		local s = size
		local mesh = part:FindFirstChildWhichIsA("SpecialMesh", true)
		if mesh then
			s = Vector3.new(s.X * math.abs(mesh.Scale.X), s.Y * math.abs(mesh.Scale.Y), s.Z * math.abs(mesh.Scale.Z))
		end
		local dims = { s.X, s.Y, s.Z }
		table.sort(dims)
		local width = math.clamp(dims[2], 6.0, 60.0)
		local length = math.clamp(dims[3], 8.0, 80.0)
		local halfW = width / 2 + pad
		local halfL = length / 2 + pad
		return { half = Vector3.new(halfW, 0, halfL), cframe = part.CFrame, isBigSpike = true }
	end

	if forceCircle or (part:IsA("Part") and (part.Shape == Enum.PartType.Ball or part.Shape == Enum.PartType.Cylinder)) then
		return { radius = math.max(size.X, size.Y, size.Z) / 2 }
	end

	local half = Vector3.new(math.max(size.X, 0) / 2 + pad, 0, math.max(size.Z, 0) / 2 + pad)
	return { half = half, cframe = part.CFrame }
end

--// Kiem tra diem P (X-Z) hoac vong tron ban kinh extraRadius co giao thoa voi 1 zone con khong
local function isPointInZone(point, zone, extraRadius, isTrajectory)
	if not zone then return false end
	if zone.expireTime and os.clock() > zone.expireTime then
		return false
	end

	local px, pz = point.X, point.Z
	extraRadius = extraRadius or 0
	local pad = (isTrajectory or zone.isTrajectory) and trajectoryMargin or hazardPadding

	if zone.radius then
		local pos = (zone.part and zone.part.Parent) and zone.part.Position
		local isSynthetic = zone.isSecondBossChain == true
		local cx = (isSynthetic and zone.cx) or (pos and pos.X) or zone.cx or 0
		local cz = (isSynthetic and zone.cz) or (pos and pos.Z) or zone.cz or 0
		local dx = px - cx
		local dz = pz - cz
		local r = zone.radius + pad + extraRadius
		return (dx * dx + dz * dz) <= (r * r)
	end

	local cf = (zone.part and zone.part.Parent) and zone.part.CFrame or zone.cframe
	if cf then
		local localPoint = cf:PointToObjectSpace(point)
		local halfX = zone.half.X
		local halfZ = zone.half.Z

		if extraRadius <= 0 then
			return math.abs(localPoint.X) <= halfX and math.abs(localPoint.Z) <= halfZ
		else
			-- Giao thoa chính xác giữa Vòng tròn Player (bán kính extraRadius) với Hộp OBB
			local dx = math.max(0, math.abs(localPoint.X) - halfX)
			local dz = math.max(0, math.abs(localPoint.Z) - halfZ)
			return (dx * dx + dz * dz) <= (extraRadius * extraRadius)
		end
	end

	return false
end

--// Lấy vector hướng tiến 2D của chiêu thức
local function getForwardVector2D(instance, mainPart)
	local cf = (mainPart and mainPart.CFrame) or (instance:IsA("Model") and instance:GetPivot())
	if cf then
		local lv = cf.LookVector
		-- Đảo 180 độ (-LookVector) do model gốc trong game quay ngược trục trước/sau
		local f2D = Vector3.new(-lv.X, 0, -lv.Z)
		if f2D.Magnitude > 0.05 then
			return f2D.Unit
		end
	end

	local lp = services.player or game:GetService("Players").LocalPlayer
	local char = lp and lp.Character
	local root = char and (char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart)
	if root and mainPart then
		local toPlayer = Vector3.new(root.Position.X - mainPart.Position.X, 0, root.Position.Z - mainPart.Position.Z)
		if toPlayer.Magnitude > 0.1 then
			return toPlayer.Unit
		end
	end

	return Vector3.new(0, 0, -1)
end

--// Chuan bi danh sach zone + bounding radius cua 1 hazard (cache vao info.HazardZones)
local function buildHazardZones(hazardInfo)
	if not hazardInfo or not hazardInfo.Instance or not hazardInfo.Instance.Parent then return nil end

	local instance = hazardInfo.Instance
	local hazardName = hazardInfo.Name or (instance and instance.Name) or ""
	local forceCircle = isForceCircle(hazardName)
	local isTrajectory = hazardInfo.IsTrajectory == true
	local pad = isTrajectory and trajectoryMargin or hazardPadding
	local parts

	if isIceSpikesChain(hazardName) then
		local maxRadius = getLargeIceSpikesMaxRadius()
		local mainPart = nil
		if instance:IsA("BasePart") then
			mainPart = isPartAlive(instance) and instance or nil
		elseif instance:IsA("Model") then
			if instance.PrimaryPart and isPartAlive(instance.PrimaryPart) then
				mainPart = instance.PrimaryPart
			else
				for _, desc in ipairs(instance:GetDescendants()) do
					if desc:IsA("BasePart") and isPartAlive(desc) and desc.Parent then
						mainPart = desc
						break
					end
				end
			end
		end

		if not mainPart then return nil end

		local pos = mainPart.Position
		local singleZone = {
			radius = maxRadius,
			cx = pos.X,
			cz = pos.Z,
			part = mainPart,
			isTrajectory = false,
			isIceSpikes = true,
		}

		return {
			zones = { singleZone },
			center = Vector3.new(pos.X, 0, pos.Z),
			boundingRadius = maxRadius + pad,
		}
	end

	if isSecondBossCircleChain(hazardName) then
		local mainPart = nil
		if instance:IsA("BasePart") then
			mainPart = isPartAlive(instance) and instance or nil
		elseif instance:IsA("Model") then
			if instance.PrimaryPart and isPartAlive(instance.PrimaryPart) then
				mainPart = instance.PrimaryPart
			else
				for _, desc in ipairs(instance:GetDescendants()) do
					if desc:IsA("BasePart") and isPartAlive(desc) and desc.Parent then
						mainPart = desc
						break
					end
				end
			end
		end

		if not mainPart then return nil end

		local pos = mainPart.Position
		local forward2D = getForwardVector2D(instance, mainPart)
		local spawnClock = hazardInfo.SpawnClock or os.clock()
		local zones = {}

		-- Chuỗi 10 vòng tròn liên hoàn của Boss 2 (secondBossCricleHitbox):
		-- Vòng 1 (gốc): R = 11 studs, khoảng cách = 0
		-- Mỗi vòng tiếp theo cách nhau 22 studs, bán kính tăng thêm 3 studs (11, 14, 17, 20, 23, 26, 29, 32, 35, 38)
		-- Mỗi vòng có expireTime riêng để cắt đuôi dạng sóng (Wave Expiration):
		-- Vòng 1 tan ở spawnClock + 1.2s, mỗi vòng sau tan chậm hơn 0.4s
		local NUM_CIRCLES = 10
		local BASE_RADIUS = 11.0
		local RADIUS_STEP = 3.0
		local DIST_STEP = 22.0
		local BASE_DURATION = secondBossCircleDuration
		local WAVE_STEP_DURATION = 0.4

		local totalLength = (NUM_CIRCLES - 1) * DIST_STEP

		for i = 1, NUM_CIRCLES do
			local offsetDist = (i - 1) * DIST_STEP
			local circleCenter = Vector3.new(pos.X, 0, pos.Z) + forward2D * offsetDist
			local circleRadius = BASE_RADIUS + (i - 1) * RADIUS_STEP
			local expireTime = spawnClock + BASE_DURATION + (i - 1) * WAVE_STEP_DURATION

			table.insert(zones, {
				radius = circleRadius,
				cx = circleCenter.X,
				cz = circleCenter.Z,
				part = mainPart,
				expireTime = expireTime,
				isTrajectory = false,
				isSecondBossChain = true,
				circleIndex = i,
			})
		end

		local centerPos = Vector3.new(pos.X, 0, pos.Z) + forward2D * (totalLength / 2)
		local maxCircleRadius = BASE_RADIUS + (NUM_CIRCLES - 1) * RADIUS_STEP
		local boundingRadius = (totalLength / 2) + maxCircleRadius + pad
		local maxExpireTime = spawnClock + BASE_DURATION + (NUM_CIRCLES - 1) * WAVE_STEP_DURATION

		if hazardInfo then
			hazardInfo.MaxExpireTime = maxExpireTime
			hazardInfo.IsSyntheticChain = true
		end

		return {
			zones = zones,
			center = centerPos,
			boundingRadius = boundingRadius,
			maxExpireTime = maxExpireTime,
		}
	end

	if isBeamTelegraph(hazardName) then
		-- firstBossBeamPart chỉ hiển thị hành lang cam Trajectory, không tạo ground zone con
		return nil
	end

	if isBigSpike(hazardName) then
		local mainPart = nil
		if instance:IsA("BasePart") then
			mainPart = isPartAlive(instance) and instance or nil
		elseif instance:IsA("Model") then
			mainPart = instance.PrimaryPart or instance:FindFirstChildWhichIsA("BasePart")
			if not mainPart or not isPartAlive(mainPart) then
				for _, desc in ipairs(instance:GetDescendants()) do
					if desc:IsA("BasePart") and isPartAlive(desc) and desc.Parent then
						mainPart = desc
						break
					end
				end
			end
		end

		if not mainPart then return nil end

		local pos = mainPart.Position
		local size = mainPart.Size
		local mesh = mainPart:FindFirstChildWhichIsA("SpecialMesh", true)
		if mesh then
			size = Vector3.new(size.X * math.abs(mesh.Scale.X), size.Y * math.abs(mesh.Scale.Y), size.Z * math.abs(mesh.Scale.Z))
		end
		local dims = { size.X, size.Y, size.Z }
		table.sort(dims)
		local spikeWidth = math.clamp(dims[2], 6.0, 60.0)
		local spikeLength = math.clamp(dims[3], 8.0, 80.0)
		local halfW = spikeWidth / 2 + pad
		local halfL = spikeLength / 2 + pad

		local singleZone = {
			half = Vector3.new(halfW, 0, halfL),
			cframe = mainPart.CFrame,
			part = mainPart,
			cx = pos.X,
			cz = pos.Z,
			isTrajectory = isTrajectory,
			isBigSpike = true,
		}

		return {
			zones = { singleZone },
			center = Vector3.new(pos.X, 0, pos.Z),
			boundingRadius = math.sqrt(halfW * halfW + halfL * halfL),
		}
	end

	if instance:IsA("BasePart") then
		if not isPartAlive(instance) then return nil end
		parts = { instance }
	else
		parts = {}
		for _, desc in ipairs(instance:GetDescendants()) do
			if #parts >= MAX_PARTS_PER_HAZARD then break end
			if desc:IsA("BasePart") and isPartAlive(desc) and desc.Parent then
				parts[#parts + 1] = desc
			end
		end
		if #parts == 0 then return nil end
	end

	local zones = {}
	local minX, maxX, minZ, maxZ = math.huge, -math.huge, math.huge, -math.huge

	for _, part in ipairs(parts) do
		local pos = part.Position
		local size = part.Size
		local radius2D = math.max(size.X, size.Y, size.Z) / 2 + pad

		minX = math.min(minX, pos.X - radius2D)
		maxX = math.max(maxX, pos.X + radius2D)
		minZ = math.min(minZ, pos.Z - radius2D)
		maxZ = math.max(maxZ, pos.Z + radius2D)

		local zone = computePartZone(part, forceCircle, isTrajectory)
		if zone then
			zone.part = part
			zone.isTrajectory = isTrajectory
			zones[#zones + 1] = zone
		end
	end

	if #zones == 0 then return nil end

	local centerX = (minX + maxX) / 2
	local centerZ = (minZ + maxZ) / 2
	local halfX = (maxX - minX) / 2
	local halfZ = (maxZ - minZ) / 2

	return {
		zones = zones,
		center = Vector3.new(centerX, 0, centerZ),
		boundingRadius = math.sqrt(halfX * halfX + halfZ * halfZ),
	}
end

--// Lay hoac cache HazardZones cho 1 hazard
local function getHazardZones(info)
	local zones = info and info.HazardZones
	if not zones then
		zones = buildHazardZones(info)
		if zones and info then info.HazardZones = zones end
	end
	return zones
end

function geometry.GetHazardZones(info)
	return getHazardZones(info)
end

--// Lấy danh sách các Hazards nằm trong phạm vi maxRadius xung quanh origin (Broad-Phase Spatial Culling)
function geometry.GetNearbyHazards(origin, maxRadius)
	local det = data
	if not det then return {} end
	maxRadius = maxRadius or 65

	local nearby = {}
	local ox, oz = origin.X, origin.Z

	for _, info in pairs(det.GetActiveHazardsMap()) do
		local inst = info.Instance
		local hazardZones = getHazardZones(info)
		if hazardZones then
			local cx = hazardZones.center.X
			local cz = hazardZones.center.Z
			if inst and inst.Parent then
				local livePart = inst:IsA("BasePart") and inst or inst.PrimaryPart or inst:FindFirstChildWhichIsA("BasePart")
				if livePart then
					cx = livePart.Position.X
					cz = livePart.Position.Z
				end
			end

			local dx = ox - cx
			local dz = oz - cz
			local distSq = dx * dx + dz * dz
			local totalReach = maxRadius + hazardZones.boundingRadius
			if distSq <= totalReach * totalReach then
				table.insert(nearby, info)
			end
		end
	end

	return nearby
end

--// Query: kiem tra diem P (hoac vong tron player ban kinh extraRadius) co dính hazard nao khong
--// Tra ve: hit (bool), hazardInfo (gan nhat), hitPart
function geometry.IsPointInAnyHazard(point, ignoredInstance, extraRadius, hazardList)
	local det = data
	if not det then return false, nil, nil end
	extraRadius = extraRadius or 0

	local bestDistSq = math.huge
	local foundInfo, foundPart = nil, nil
	local list = hazardList or det.GetActiveHazardsMap()

	for key, info in pairs(list) do
		local inst = info.Instance or (typeof(key) == "Instance" and key)
		if ignoredInstance and (ignoredInstance == inst or (inst and ignoredInstance.Name == inst.Name)) then
			continue
		end

		local hazardName = info.Name or (inst and inst.Name) or ""
		if isMovingBeam(hazardName) or isBigSpike(hazardName) then
			-- Moving Beam và BigSpike được quản lý và kiểm tra va chạm 100% bằng Trajectory (hành lang Cam chính xác).
			-- Bỏ qua tại đây để tuyệt đối không có bán kính (Radius) ngầm nào can thiệp gây né sớm!
			continue
		end

		local hazardZones = getHazardZones(info)
		if not hazardZones then continue end

		-- Broad phase: reject nhanh bang distSq to center (uu tien vi tri part thoi gian thuc)
		local cx = hazardZones.center.X
		local cz = hazardZones.center.Z
		if inst and inst.Parent then
			local livePart = inst:IsA("BasePart") and inst or inst.PrimaryPart or inst:FindFirstChildWhichIsA("BasePart")
			if livePart then
				cx = livePart.Position.X
				cz = livePart.Position.Z
			end
		end

		local dx = point.X - cx
		local dz = point.Z - cz
		local distSq = dx * dx + dz * dz
		local totalBounding = hazardZones.boundingRadius + extraRadius
		if distSq > totalBounding * totalBounding then
			continue
		end

		-- Narrow phase: union per-part, re-check part con song
		local isTraj = info.IsTrajectory == true
		for i = 1, #hazardZones.zones do
			local zone = hazardZones.zones[i]
			if isPartAlive(zone.part) and isPointInZone(point, zone, extraRadius, isTraj or zone.isTrajectory) then
				local d2 = (point - zone.part.Position).Magnitude
				if d2 < bestDistSq then
					bestDistSq = d2
					foundInfo = info
					foundPart = zone.part
				end
				break
			end
		end
	end

	return foundPart ~= nil, foundInfo, foundPart
end

return geometry end end-- HazardScanner – Timer & 3D Tag Visualizer (DungeonQuest):
-- Hiển thị 3D visual gắn trên đầu mọi Danger Zone trong không gian trận đấu.
-- Phân loại nhãn 3D:
--   - (T) Trajectory: Chiêu thức đang di chuyển / có quỹ đạo bay (Blue/Orange Zone) -> KHÔNG đếm thời gian.
--   - (P) Projectile: Đối tượng có tên trong ReplicatedStorage/enemyProjectiles nhưng đang tĩnh trên sàn -> CÓ đếm thời gian.
--   - (N) Non-projectile: Chiêu thức tĩnh trên mặt sàn (Red Danger Zone) -> CÓ đếm thời gian.
-- Mỗi Danger Zone có 1 BillboardGui gắn trực tiếp vào Part của vùng đó
-- và tự hủy lập tức ngay khi Zone mờ đi (Transparency > 0.85) hoặc biến mất khỏi Workspace.

--// Imports

local services = __DIST.load('a')
local lifecycle = __DIST.load('b')
local geometry = __DIST.load('c')

local RunService = services.RunService or game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = services.player

--// Table
local timerVisual = {}

--// State
local enabled = true
local data = nil
local activeTimers = {} -- [hazardInfo] = { items = {}, connections = {} }
local heartbeatConnection = nil

--// Constants
local FADE_TRANSPARENCY_THRESHOLD = 0.85
local COLOR_RED = Color3.fromRGB(255, 60, 60)
local COLOR_BLUE = Color3.fromRGB(0, 180, 255)
local COLOR_ORANGE = Color3.fromRGB(255, 140, 0)
local COLOR_PURPLE = Color3.fromRGB(220, 90, 255)

--// Folder chứa danh sách enemy projectiles mẫu trong ReplicatedStorage
local PROJECTILE_FOLDER = "enemyProjectiles"
local enemyProjectilesLoaded = false
local enemyProjectileNames = {} -- [cleanName] = true

--// Blacklist: Các đối tượng nằm trong enemyProjectiles nhưng thực tế không phải là Projectile
local PROJECTILE_BLACKLIST = {
	-- Thêm tên đối tượng vào đây nếu cần loại khỏi (P)
}

--// Danh sách Chasing Projectiles (Đạn truy đuổi / tự đổi hướng theo player)
--// Thêm hoặc xóa tên trực tiếp tại đây:
local CHASING_PROJECTILE_NAMES = {
	["secondbossgreenorb"] = true,
	["secondbossredorb"] = true,
	["secondbossyelloworb"] = true,
}

local function loadEnemyProjectiles()
	if enemyProjectilesLoaded then return end
	enemyProjectilesLoaded = true
	local folder = ReplicatedStorage:FindFirstChild(PROJECTILE_FOLDER)
	if folder then
		for _, obj in ipairs(folder:GetChildren()) do
			local clean = (obj.Name or ""):lower():gsub("%s+", "")
			if #clean > 0 then
				enemyProjectileNames[clean] = true
			end
		end
		folder.ChildAdded:Connect(function(child)
			local clean = (child.Name or ""):lower():gsub("%s+", "")
			if #clean > 0 then
				enemyProjectileNames[clean] = true
			end
		end)
	end
end

--// Kiểm tra xem tên hazard có phải là Chasing Projectile (đạn truy đuổi) không
function timerVisual.IsChasingProjectile(name)
	if not name or type(name) ~= "string" then return false end
	local clean = name:lower():gsub("%s+", "")
	if #clean == 0 then return false end
	if CHASING_PROJECTILE_NAMES[clean] == true then return true end
	for n in pairs(CHASING_PROJECTILE_NAMES) do
		if string.find(clean, n, 1, true) then
			return true
		end
	end
	return false
end

--// Kiểm tra xem tên hazard có phải là Projectile mẫu từ ReplicatedStorage/enemyProjectiles không
function timerVisual.IsEnemyProjectile(name)
	loadEnemyProjectiles()
	if not name or type(name) ~= "string" then return false end
	local clean = name:lower():gsub("%s+", "")
	if #clean == 0 then return false end
	if PROJECTILE_BLACKLIST[clean] == true then return false end
	return enemyProjectileNames[clean] == true
end

--// Gán data source từ detection (tránh circular dependency)
function timerVisual.BindDetection(dataSource)
	data = dataSource or nil
end

function timerVisual.IsEnabled()
	return enabled
end

--// Lấy độ cao mặt sàn của người chơi
local function getPlayerGroundY()
	local char = player and player.Character
	if not char then return nil end
	local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
	if not root then return nil end
	return root.Position.Y - 2.5
end

--// Tính toán Y Offset phù hợp để BillboardGui luôn lơ lửng ở tầm mắt phía trên sàn đấu
local function computeYOffset(part)
	if not part or not part.Parent then return 2.5 end
	local groundY = getPlayerGroundY()
	if groundY then
		local desiredY = groundY + 2.5
		local diff = desiredY - part.Position.Y
		local minAbovePart = part.Size.Y / 2 + 1.2
		return math.clamp(math.max(diff, minAbovePart), 1.5, 30.0)
	end
	return math.clamp(part.Size.Y / 2 + 1.8, 2.0, 10.0)
end

--// Kiểm tra Part của Danger Zone còn sống không
local function isZonePartAlive(part)
	return part and part.Parent and part.Transparency <= FADE_TRANSPARENCY_THRESHOLD
end

--// Tìm BasePart đại diện fallback
local function getMainPart(instance)
	if not instance or not instance.Parent then return nil end
	if instance:IsA("BasePart") then
		if isZonePartAlive(instance) then return instance end
	elseif instance:IsA("Model") then
		if instance.PrimaryPart and isZonePartAlive(instance.PrimaryPart) then
			return instance.PrimaryPart
		end
		local hrp = instance:FindFirstChild("HumanoidRootPart")
		if hrp and isZonePartAlive(hrp) then
			return hrp
		end
		for _, desc in ipairs(instance:GetDescendants()) do
			if desc:IsA("BasePart") and isZonePartAlive(desc) then
				return desc
			end
		end
	else
		for _, desc in ipairs(instance:GetDescendants()) do
			if desc:IsA("BasePart") and isZonePartAlive(desc) then
				return desc
			end
		end
	end
	return nil
end

--// Phân loại nhãn và màu sắc cho 1 hazard
--// Trả về: tag ("C" | "P" | "N"), strokeColor (Color3), tagRgb (string), hasTimer (boolean)
local function getHazardClassification(hazardInfo)
	local isTraj = hazardInfo and hazardInfo.IsTrajectory == true
	local name = hazardInfo and hazardInfo.Name or "Hazard"
	local isChasing = timerVisual.IsChasingProjectile(name)
	local isProj = timerVisual.IsEnemyProjectile(name)
	local hasTimer = not isTraj or isChasing

	if isChasing then
		-- (C) Chasing Projectile (đạn truy đuổi dí theo player, không có trajectory, có đếm thời gian)
		local strokeColor = COLOR_PURPLE
		local tagRgb = "220,100,255"
		return "C", strokeColor, tagRgb, true
	elseif isProj then
		-- (P) Projectile (có tên trong ReplicatedStorage/enemyProjectiles)
		local strokeColor = isTraj and COLOR_ORANGE or COLOR_BLUE
		local tagRgb = isTraj and "255,160,50" or "0,210,255"
		return "P", strokeColor, tagRgb, hasTimer
	else
		-- (N) Non-projectile (không thuộc enemyProjectiles)
		local strokeColor = isTraj and COLOR_ORANGE or COLOR_RED
		local tagRgb = isTraj and "255,160,50" or "255,80,80"
		return "N", strokeColor, tagRgb, hasTimer
	end
end

--// Cập nhật text hiển thị và màu sắc cho BillboardGui của 1 hazard
local function updateTimerText(record, hazardInfo)
	if not record or not record.items or not hazardInfo then return end
	local tag, strokeColor, tagRgb, hasTimer = getHazardClassification(hazardInfo)
	local name = hazardInfo.Name or "Hazard"
	local text = ""

	if hasTimer then
		local spawnClock = hazardInfo.SpawnClock or os.clock()
		local elapsed = math.max(0, os.clock() - spawnClock)
		text = ("<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(255,220,220)'>%s</font> <font color='rgb(255,255,255)'><b>%.1fs</b></font>"):format(
			tagRgb,
			tag,
			name,
			elapsed
		)
	else
		text = ("<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(220,235,255)'>%s</font>"):format(
			tagRgb,
			tag,
			name
		)
	end

	for _, item in ipairs(record.items) do
		if item.label and item.label.Parent then
			item.label.Text = text
		end
		if item.stroke and item.stroke.Parent and item.stroke.Color ~= strokeColor then
			item.stroke.Color = strokeColor
		end
	end
end

--// Vòng lặp Heartbeat: Cập nhật bộ đếm/nhãn và dọn dẹp NGAY LẬP TỨC khi Danger Zone biến mất
local function onHeartbeat()
	if not enabled then return end
	local hasAny = false

	for hazardInfo, record in pairs(activeTimers) do
		local inst = hazardInfo.Instance
		if not inst or not inst.Parent then
			timerVisual.DetachTimerVisual(hazardInfo)
		else
			if record.items then
				-- Duyệt ngược mảng items để xóa các Zone đã biến mất/mờ
				for i = #record.items, 1, -1 do
					local item = record.items[i]
					local part = item.part
					if not isZonePartAlive(part) then
						if item.billboard and item.billboard.Parent then
							pcall(function() item.billboard:Destroy() end)
						end
						table.remove(record.items, i)
					else
						-- Zone còn sống -> cập nhật vị trí offset
						if item.billboard and item.billboard.Parent then
							item.billboard.StudsOffset = Vector3.new(0, computeYOffset(part), 0)
						end
					end
				end

				if #record.items == 0 then
					timerVisual.DetachTimerVisual(hazardInfo)
				else
					hasAny = true
					updateTimerText(record, hazardInfo)
				end
			else
				timerVisual.DetachTimerVisual(hazardInfo)
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

--// Tạo 1 BillboardGui cho 1 Danger Zone (part)
local function createHazardBillboard(part, initialStrokeColor)
	local yOffset = computeYOffset(part)

	local bb = Instance.new("BillboardGui")
	bb.Name = "HazardLifespanTimer"
	bb.Adornee = part
	bb.AlwaysOnTop = true
	bb.MaxDistance = 500
	bb.LightInfluence = 0
	bb.ResetOnSpawn = false
	bb.Active = false
	bb.Size = UDim2.new(0, 150, 0, 24)
	bb.StudsOffset = Vector3.new(0, yOffset, 0)
	bb.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local frame = Instance.new("Frame")
	frame.Name = "TimerFrame"
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
	frame.BackgroundTransparency = 0.25
	frame.BorderSizePixel = 0
	frame.Parent = bb

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = frame

	local stroke = Instance.new("UIStroke")
	stroke.Name = "Stroke"
	stroke.Thickness = 1.3
	stroke.Color = initialStrokeColor or COLOR_RED
	stroke.Transparency = 0.15
	stroke.Parent = frame

	local label = Instance.new("TextLabel")
	label.Name = "TimerLabel"
	label.Size = UDim2.new(1, -6, 1, 0)
	label.Position = UDim2.new(0, 3, 0, 0)
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.GothamBold
	label.TextSize = 11
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.TextStrokeTransparency = 0
	label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	label.RichText = true
	label.TextXAlignment = Enum.TextXAlignment.Center
	label.TextYAlignment = Enum.TextYAlignment.Center
	label.Text = ""
	label.Parent = frame

	bb.Parent = part
	return bb, label, stroke
end

--// Gắn 3D Tag/Timer Visual cho toàn bộ các vùng của 1 Hazard
function timerVisual.AttachTimerVisual(hazardInfo)
	if not enabled or not hazardInfo then return end

	local name = hazardInfo.Name or (hazardInfo.Instance and hazardInfo.Instance.Name) or ""
	if (geometry.IsIceSpikesChain and geometry.IsIceSpikesChain(name))
		or (geometry.IsSecondBossCircleChain and geometry.IsSecondBossCircleChain(name)) then
		return
	end

	if activeTimers[hazardInfo] then
		timerVisual.DetachTimerVisual(hazardInfo)
	end

	local inst = hazardInfo.Instance
	if not inst or not inst.Parent then return end

	local _, initialStrokeColor = getHazardClassification(hazardInfo)
	local hazardZones = geometry.GetHazardZones(hazardInfo)
	local zones = hazardZones and hazardZones.zones

	local items = {}
	local connections = {}

	local function hookPart(part, bb, label, stroke, zone)
		local item = {
			billboard = bb,
			label = label,
			stroke = stroke,
			part = part,
			zone = zone,
		}
		table.insert(items, item)

		-- Tự động hủy tag LẬP TỨC khi part mờ dần (hết chiêu thức)
		local connTrans = part:GetPropertyChangedSignal("Transparency"):Connect(function()
			if not isZonePartAlive(part) then
				pcall(function() bb:Destroy() end)
			end
		end)
		table.insert(connections, connTrans)

		-- Tự động hủy tag LẬP TỨC khi part bị xóa khỏi Workspace
		local connParent = part.AncestryChanged:Connect(function(_, newParent)
			if not newParent then
				pcall(function() bb:Destroy() end)
			end
		end)
		table.insert(connections, connParent)
	end

	local targetPart = nil
	if zones and #zones > 0 then
		if inst:IsA("Model") then
			if inst.PrimaryPart and isZonePartAlive(inst.PrimaryPart) then
				targetPart = inst.PrimaryPart
			elseif inst:FindFirstChild("HumanoidRootPart") and isZonePartAlive(inst:FindFirstChild("HumanoidRootPart")) then
				targetPart = inst:FindFirstChild("HumanoidRootPart")
			end
		end

		if not targetPart then
			local center = hazardZones.center
			local bestDistSq = math.huge
			for _, zone in ipairs(zones) do
				local p = zone.part
				if isZonePartAlive(p) then
					if center then
						local dx = p.Position.X - center.X
						local dz = p.Position.Z - center.Z
						local d2 = dx * dx + dz * dz
						if d2 < bestDistSq then
							bestDistSq = d2
							targetPart = p
						end
					else
						targetPart = p
						break
					end
				end
			end
		end
	end

	if not targetPart then
		targetPart = getMainPart(inst)
	end

	if targetPart and isZonePartAlive(targetPart) then
		local bb, label, stroke = createHazardBillboard(targetPart, initialStrokeColor)
		hookPart(targetPart, bb, label, stroke, nil)
	end

	if #items > 0 then
		local record = {
			items = items,
			connections = connections,
		}
		activeTimers[hazardInfo] = record
		updateTimerText(record, hazardInfo)
		ensureHeartbeat()
	end
end

--// Gỡ bỏ Timer Visual của 1 hazard
function timerVisual.DetachTimerVisual(hazardInfo)
	if not hazardInfo then return end
	local record = activeTimers[hazardInfo]
	if not record then return end

	if record.connections then
		for _, c in ipairs(record.connections) do
			pcall(function() c:Disconnect() end)
		end
		table.clear(record.connections)
	end

	if record.items then
		for _, item in ipairs(record.items) do
			if item.billboard and item.billboard.Parent then
				pcall(function() item.billboard:Destroy() end)
			end
		end
		table.clear(record.items)
	end

	activeTimers[hazardInfo] = nil
end

--// Cập nhật khi hazard chuyển đổi trạng thái Trajectory
function timerVisual.UpdateHazardVisualColor(hazardInfo, isTrajectory)
	if not hazardInfo then return end
	local record = activeTimers[hazardInfo]
	if record then
		updateTimerText(record, hazardInfo)
	else
		timerVisual.AttachTimerVisual(hazardInfo)
	end
end

--// Xóa sạch toàn bộ Timer Visuals
function timerVisual.ClearAll()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	for info in pairs(activeTimers) do
		timerVisual.DetachTimerVisual(info)
	end
	table.clear(activeTimers)
end

--// Làm mới toàn bộ Visuals cho tất cả các hazard hiện có
function timerVisual.RefreshAll()
	timerVisual.ClearAll()
	if not enabled or not data then return end

	for _, info in pairs(data.GetActiveHazardsMap()) do
		if info then
			timerVisual.AttachTimerVisual(info)
		end
	end
end

--// Bật / tắt 3D Timer Visualizer
function timerVisual.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		timerVisual.RefreshAll()
	else
		timerVisual.ClearAll()
	end
end

--// Dọn dẹp khi script shutdown
lifecycle.Register(function()
	timerVisual.ClearAll()
end)

return timerVisual
