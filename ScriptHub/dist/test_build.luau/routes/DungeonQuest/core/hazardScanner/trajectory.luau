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

return geometry end function __DIST.d()-- HazardScanner – Timer & 3D Tag Visualizer (DungeonQuest):
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
end function __DIST.e()-- HazardScanner – Visualizer: Vẽ trực quan vùng toán học (Ground Visualizer)
-- dựa trên mô hình hình học của geometry.luau.
-- Phân loại màu sắc:
--   - Màu Đỏ (Red): Danger Zone của chiêu thức tĩnh / bình thường.
--   - Màu Xanh (Blue): Danger Zone của chiêu thức có quỹ đạo bay (Trajectory / Projectile), áp dụng Trajectory Margin riêng.
--   - Màu Xanh Lá (Green): Danger Zone dự đoán chuỗi vòng tròn Boss 2 (Boss 2 Circle Chain / secondBossCricleHitbox).

--// Imports

local services = __DIST.load('a')
local lifecycle = __DIST.load('b')
local geometry = __DIST.load('c')

local RunService = services.RunService or game:GetService("RunService")
local player = services.player

--// Table
local visualizer = {}

--// State
local enabled = false
local data = nil
local activeVisuals = {} -- [hazardInfo] = { items = {}, adornments = {}, connections = {} }
local heartbeatConnection = nil

--// Constants
local FADE_TRANSPARENCY_THRESHOLD = 0.85
local ZONE_COLOR_RED = Color3.fromRGB(255, 45, 45)
local ZONE_COLOR_BLUE = Color3.fromRGB(0, 160, 255)
local ZONE_COLOR_GREEN = Color3.fromRGB(0, 230, 90)
local ZONE_TRANSPARENCY = 0.55
local GROUND_THICKNESS = 0.25

--// Lấy độ cao mặt sàn theo chân người chơi tại thời điểm vẽ
local function getPlayerGroundY()
	local char = player and player.Character
	if not char then return nil end
	local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
	if not root then return nil end
	return root.Position.Y - 2.5
end

--// Gán data source từ detection (tránh circular dependency)
function visualizer.BindDetection(dataSource)
	data = dataSource or nil
end

local trajectorySource = nil
function visualizer.BindTrajectory(source)
	trajectorySource = source or nil
end

function visualizer.IsEnabled()
	return enabled
end

--// Cập nhật vị trí và góc xoay của một Adornment ghim thẳng đứng xuống mặt đất mỗi frame
local function updateVisualCFrame(item, targetY)
	local ad = item.ad
	local zone = item.zone
	local part = item.part
	local anchorPart = item.anchorPart or part
	if not ad or not ad.Parent or not anchorPart or not anchorPart.Parent then return end

	local isSynthetic = zone and (zone.isSecondBossChain or (item.hazardInfo and item.hazardInfo.IsSyntheticChain))
	local worldPos = (isSynthetic and zone.cx and zone.cz and Vector3.new(zone.cx, 0, zone.cz))
		or (part and part.Parent and part.Position)
		or ((zone and zone.cx and zone.cz) and Vector3.new(zone.cx, 0, zone.cz))
	if not worldPos then return end
	local worldTargetPos = Vector3.new(worldPos.X, targetY or worldPos.Y, worldPos.Z)

	if item.isCircle then
		-- Đĩa tròn: Cố định nằm ngang hoàn toàn trên mặt phẳng World X-Z
		local desiredWorldCFrame = CFrame.new(worldTargetPos) * CFrame.Angles(math.rad(90), 0, 0)
		ad.CFrame = (anchorPart == workspace.Terrain) and desiredWorldCFrame or anchorPart.CFrame:ToObjectSpace(desiredWorldCFrame)
	else
		-- Hộp OBB: Giữ hướng quay Yaw trên sàn, triệt tiêu Pitch/Roll
		local desiredWorldCFrame
		if zone and zone.isBigSpike then
			local trajDir = trajectorySource and trajectorySource.GetHazardDirection and trajectorySource.GetHazardDirection(item.hazardInfo)
			if trajDir and trajDir.Magnitude > 0.01 then
				desiredWorldCFrame = CFrame.lookAt(worldTargetPos, worldTargetPos + trajDir)
			else
				local baseCF = (part and part.Parent) and part.CFrame or CFrame.identity
				local _, yaw, _ = baseCF:ToOrientation()
				desiredWorldCFrame = CFrame.new(worldTargetPos) * CFrame.Angles(0, yaw, 0)
			end
		else
			local baseCF = (part and part.Parent) and part.CFrame or CFrame.identity
			local _, yaw, _ = baseCF:ToOrientation()
			desiredWorldCFrame = CFrame.new(worldTargetPos) * CFrame.Angles(0, yaw, 0)
		end
		ad.CFrame = (anchorPart == workspace.Terrain) and desiredWorldCFrame or anchorPart.CFrame:ToObjectSpace(desiredWorldCFrame)
	end
end

--// Vòng lặp Heartbeat: Ghim toàn bộ visual thẳng đứng xuống mặt đất liên tục mỗi frame
--// Hỗ trợ Wave Expiration (Cắt đuôi dạng sóng): Tự động gỡ các vòng tròn đã quá hạn expireTime
local function onHeartbeat()
	if not enabled then return end
	local hasAny = false
	local targetY = getPlayerGroundY()
	local now = os.clock()

	for info, record in pairs(activeVisuals) do
		local isChain = info.IsSyntheticChain or (info.MaxExpireTime and now < info.MaxExpireTime)
		local isInstanceAlive = info.Instance and info.Instance.Parent

		if not isInstanceAlive and not isChain then
			visualizer.DetachZoneVisuals(info)
		else
			if record.items then
				local aliveItems = {}
				for _, item in ipairs(record.items) do
					local zone = item.zone
					if zone and zone.expireTime and now > zone.expireTime then
						-- Vòng tròn này đã hết hạn -> hủy adornment để cắt đuôi
						if item.ad and item.ad.Parent then
							pcall(function() item.ad:Destroy() end)
						end
					elseif item.ad and item.ad.Parent then
						table.insert(aliveItems, item)
						updateVisualCFrame(item, targetY)
					end
				end
				record.items = aliveItems
				if #aliveItems > 0 then
					hasAny = true
				else
					visualizer.DetachZoneVisuals(info)
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

--// Xóa visual của một hazard
function visualizer.DetachZoneVisuals(hazardInfo)
	if not hazardInfo then return end
	local record = activeVisuals[hazardInfo]
	if not record then return end

	if record.adornments then
		for _, ad in ipairs(record.adornments) do
			pcall(function() ad:Destroy() end)
		end
		table.clear(record.adornments)
	end

	if record.connections then
		for _, c in ipairs(record.connections) do
			pcall(function() c:Disconnect() end)
		end
		table.clear(record.connections)
	end

	if record.items then
		table.clear(record.items)
	end

	activeVisuals[hazardInfo] = nil
end

--// Cập nhật màu sắc và bán kính/kích thước visual khi hazard chuyển trạng thái Trajectory (Red <-> Blue)
function visualizer.UpdateHazardVisualColor(hazardInfo, isTrajectory)
	if not hazardInfo then return end
	local record = activeVisuals[hazardInfo]
	if not record or not record.items then return end

	local name = hazardInfo.Name or (hazardInfo.Instance and hazardInfo.Instance.Name) or ""
	local isSecondBossChain = (geometry.IsSecondBossCircleChain and geometry.IsSecondBossCircleChain(name)) or (hazardInfo and hazardInfo.IsSyntheticChain == true)
	local isTraj = isTrajectory == true or hazardInfo.IsTrajectory == true
	local color = isSecondBossChain and ZONE_COLOR_GREEN or (isTraj and ZONE_COLOR_BLUE or ZONE_COLOR_RED)
	local pad = isTraj and geometry.GetTrajectoryMargin() or 0.0

	for _, item in ipairs(record.items) do
		local ad = item.ad
		local zone = item.zone
		local part = item.part
		if ad and ad.Parent and zone and part and part.Parent then
			ad.Color3 = color
			if item.isCircle and zone.radius then
				ad.Radius = zone.radius + pad
			elseif zone.half then
				local halfX = zone.half.X
				local halfZ = zone.half.Z
				ad.Size = Vector3.new(halfX * 2, GROUND_THICKNESS, halfZ * 2)
			end
		end
	end
end

--// Vẽ visual cho một hazard (Ghim thẳng đứng xuống mặt đất)
function visualizer.AttachZoneVisuals(hazardInfo)
	if not enabled or not hazardInfo then return end
	if activeVisuals[hazardInfo] then
		visualizer.DetachZoneVisuals(hazardInfo)
	end

	local hazardZones = geometry.GetHazardZones(hazardInfo)
	if not hazardZones or not hazardZones.zones then return end

	local name = hazardInfo.Name or (hazardInfo.Instance and hazardInfo.Instance.Name) or ""
	local isSecondBossChain = (geometry.IsSecondBossCircleChain and geometry.IsSecondBossCircleChain(name)) or (hazardInfo and hazardInfo.IsSyntheticChain == true)
	local isTraj = hazardInfo.IsTrajectory == true
	local color = isSecondBossChain and ZONE_COLOR_GREEN or (isTraj and ZONE_COLOR_BLUE or ZONE_COLOR_RED)
	local pad = isTraj and geometry.GetTrajectoryMargin() or 0.0
	local targetY = getPlayerGroundY()
	local items = {}
	local adornments = {}
	local connections = {}

	local terrain = workspace.Terrain

	for _, zone in ipairs(hazardZones.zones) do
		local part = zone.part
		local isChain = zone.isSecondBossChain == true
		local isBigSpike = zone.isBigSpike == true
		local anchorPart = (isChain or isBigSpike) and terrain or part

		if isChain or isBigSpike or (part and part.Parent and part.Transparency <= FADE_TRANSPARENCY_THRESHOLD) then
			local ad = nil
			local isCircle = false

			if zone.radius then
				isCircle = true
				local cyl = Instance.new("CylinderHandleAdornment")
				cyl.Name = "HazardGroundCircle"
				cyl.Adornee = anchorPart
				cyl.Radius = zone.radius + pad
				cyl.Height = GROUND_THICKNESS
				cyl.Color3 = color
				cyl.Transparency = ZONE_TRANSPARENCY
				cyl.ZIndex = 2
				cyl.AlwaysOnTop = true
				cyl.Parent = anchorPart
				ad = cyl
			elseif zone.half and zone.cframe then
				local box = Instance.new("BoxHandleAdornment")
				box.Name = "HazardGroundBox"
				box.Adornee = anchorPart
				box.Size = Vector3.new(zone.half.X * 2, GROUND_THICKNESS, zone.half.Z * 2)
				box.Color3 = color
				box.Transparency = ZONE_TRANSPARENCY
				box.ZIndex = 2
				box.AlwaysOnTop = true
				box.Parent = anchorPart
				ad = box
			end

			if ad then
				local item = {
					ad = ad,
					part = part,
					anchorPart = anchorPart,
					isCircle = isCircle,
					zone = zone,
					hazardInfo = hazardInfo,
				}
				updateVisualCFrame(item, targetY)
				table.insert(items, item)
				table.insert(adornments, ad)

				if not isChain and part then
					-- Tự động destroy visual khi part mờ dần (chỉ part thông thường)
					local conn = part:GetPropertyChangedSignal("Transparency"):Connect(function()
						if part.Parent and part.Transparency > FADE_TRANSPARENCY_THRESHOLD then
							pcall(function() ad:Destroy() end)
						end
					end)
					table.insert(connections, conn)
				end
			end
		end
	end

	if #adornments > 0 then
		activeVisuals[hazardInfo] = {
			items = items,
			adornments = adornments,
			connections = connections,
		}
		ensureHeartbeat()
	end
end

--// Xóa toàn bộ visual
function visualizer.ClearAll()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	for info in pairs(activeVisuals) do
		visualizer.DetachZoneVisuals(info)
	end
	table.clear(activeVisuals)
end

--// Refresh lại toàn bộ visual đang hoạt động
function visualizer.RefreshAll()
	visualizer.ClearAll()
	if not enabled or not data then return end

	for _, info in pairs(data.GetActiveHazardsMap()) do
		visualizer.AttachZoneVisuals(info)
	end
end

--// Bật / tắt Ground Visualizer
function visualizer.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		visualizer.RefreshAll()
	else
		visualizer.ClearAll()
	end
end

--// Lắng nghe thay đổi margin/padding để refresh visual
geometry.OnPaddingChanged(function()
	if enabled then
		visualizer.RefreshAll()
	end
end)

--// Dọn dẹp khi script shutdown
lifecycle.Register(function()
	visualizer.ClearAll()
end)

return visualizer
end end-- HazardScanner – Trajectory Visualizer (DungeonQuest):
-- Dự báo và vẽ đường quỹ đạo nguy hiểm (Orange Trajectory Corridor) tĩnh cho các chiêu thức đang di chuyển.
-- Chiều dài dải cam được cố định theo cấu hình slider (predictionLength).
-- Vùng màu cam được đối xử như một Danger Zone thực thụ: bất kỳ điểm nào nằm trong hành lang cam đều là Nguy Hiểm,
-- buộc hệ thống tìm Safe Spot bước ngang thoát hoàn toàn ra ngoài quỹ đạo đạn (Side-Step Escape).

--// Imports

local services = __DIST.load('a')
local lifecycle = __DIST.load('b')
local geometry = __DIST.load('c')
local timerVisual = __DIST.load('d')

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
						local visualizer = __DIST.load('e')
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
		local visualizer = __DIST.load('e')
		if visualizer and visualizer.UpdateHazardVisualColor then
			pcall(visualizer.UpdateHazardVisualColor, hazardInfo, true)
		end
		local timerVisual = __DIST.load('d')
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

--// Lấy danh sách các quỹ đạo nguy hiểm đang active (dùng cho telemetry / live radar)
function trajectory.GetActiveTrajectoriesList()
	local list = {}
	for info, record in pairs(activeRecords) do
		if record and record.isMoving and record.dir and record.mainPart and record.mainPart.Parent then
			local centroid, spanWidth = getHazardCentroidAndSpan(info, record.dir)
			if centroid and spanWidth then
				local hLength = getHazardPredictionLength(info)
				local speed = (record.velocity and record.velocity.Magnitude) or 0
				table.insert(list, {
					name = info.Name or (record.mainPart and record.mainPart.Name) or "Trajectory",
					originX = centroid.X,
					originZ = centroid.Z,
					dirX = record.dir.X,
					dirZ = record.dir.Z,
					length = hLength,
					width = spanWidth,
					speed = speed,
				})
			end
		end
	end
	return list
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
