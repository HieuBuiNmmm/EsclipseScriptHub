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

return geometry end end-- HazardScanner – Visualizer: Vẽ trực quan vùng toán học (Ground Visualizer)
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
