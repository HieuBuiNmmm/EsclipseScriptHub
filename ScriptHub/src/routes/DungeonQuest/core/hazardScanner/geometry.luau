-- HazardScanner - Geometry & Danger Zones (DungeonQuest).
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
local playerHitboxPadding = 1.8
local data = nil
local paddingChangedCallbacks = {}

--// Gioi han so vung con toi da 1 hazard (chong DoS qua nhieu part/mot object)
local MAX_PARTS_PER_HAZARD = 64

--// Data source do detection bom vao (tranh vong phu thuoc)
function geometry.BindDetection(dataSource)
	data = dataSource or nil
end

function geometry.GetHitboxPadding()
	return playerHitboxPadding
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

function geometry.SetHitboxPadding(value)
	if type(value) == "number" and value >= 0 and value ~= playerHitboxPadding then
		playerHitboxPadding = value
		geometry.InvalidateCache()
		for _, cb in ipairs(paddingChangedCallbacks) do
			pcall(cb, playerHitboxPadding)
		end
	end
end

--// Kiem tra part con hoat dong (khong mo qua nguong, con nam trong Workspace)
local function isPartAlive(part)
	return part and part.Parent and part.Transparency <= FADE_TRANSPARENCY_THRESHOLD
end

--// Tinh zone con cho 1 BasePart theo shape:
--// - Part Ball/Cylinder -> vong tron X-Z (radius)
--// - Box / Union / Mesh  -> OBB theo CFrame
local function computePartZone(part)
	local size = part.Size
	if part:IsA("Part") and (part.Shape == Enum.PartType.Ball or part.Shape == Enum.PartType.Cylinder) then
		return { radius = math.max(size.X, size.Z) / 2 }
	end

	local half = Vector3.new(math.max(size.X, 0) / 2 + playerHitboxPadding, 0, math.max(size.Z, 0) / 2 + playerHitboxPadding)
	return { half = half, cframe = part.CFrame }
end

--// Kiem tra diem P (X-Z) co nam trong 1 zone con (da ke padding) khong
local function isPointInZone(point, zone)
	if not zone then return false end
	local px, pz = point.X, point.Z

	if zone.radius then
		local dx = px - zone.cx
		local dz = pz - zone.cz
		local r = zone.radius + playerHitboxPadding
		return (dx * dx + dz * dz) <= (r * r)
	end

	if zone.cframe then
		local localPoint = zone.cframe:PointToObjectSpace(point)
		return math.abs(localPoint.X) <= zone.half.X
			and math.abs(localPoint.Z) <= zone.half.Z
	end

	return false
end

--// Chuan bi danh sach zone + bounding radius cua 1 hazard (cache vao info.HazardZones)
local function buildHazardZones(hazardInfo)
	if not hazardInfo or not hazardInfo.Instance or not hazardInfo.Instance.Parent then return nil end

	local instance = hazardInfo.Instance
	local parts

	if instance:IsA("BasePart") then
		if not isPartAlive(instance) then return nil end
		parts = { instance }
	elseif instance:IsA("Model") then
		parts = {}
		for _, desc in ipairs(instance:GetDescendants()) do
			if #parts >= MAX_PARTS_PER_HAZARD then break end
			if desc:IsA("BasePart") and isPartAlive(desc) and desc.Parent then
				parts[#parts + 1] = desc
			end
		end
		if #parts == 0 then return nil end
	else
		return nil
	end

	local zones = {}
	local minX, maxX, minZ, maxZ = math.huge, -math.huge, math.huge, -math.huge

	for _, part in ipairs(parts) do
		local pos = part.Position
		local size = part.Size
		local radius2D = math.max(size.X, size.Z) / 2 + playerHitboxPadding

		minX = math.min(minX, pos.X - radius2D)
		maxX = math.max(maxX, pos.X + radius2D)
		minZ = math.min(minZ, pos.Z - radius2D)
		maxZ = math.max(maxZ, pos.Z + radius2D)

		local zone = computePartZone(part)
		if zone then
			if zone.radius then
				zone.cx, zone.cz = pos.X, pos.Z
			end
			zone.part = part
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

--// Query: kiem tra diem P co dính hazard nao khong
--// Tra ve: hit (bool), hazardInfo (gan nhat), hitPart
function geometry.IsPointInAnyHazard(point, ignoredInstance)
	local det = data
	if not det then return false, nil, nil end

	local bestDistSq = math.huge
	local foundInfo, foundPart = nil, nil

	for inst, info in pairs(det.GetActiveHazardsMap()) do
		if ignoredInstance and (ignoredInstance == inst or ignoredInstance.Name == inst.Name) then
			continue
		end

		local hazardZones = getHazardZones(info)
		if not hazardZones then continue end

		-- Broad phase: reject nhanh bang distSq to center
		local dx = point.X - hazardZones.center.X
		local dz = point.Z - hazardZones.center.Z
		local distSq = dx * dx + dz * dz
		if distSq > hazardZones.boundingRadius * hazardZones.boundingRadius then
			continue
		end

		-- Narrow phase: union per-part, re-check part con song
		for i = 1, #hazardZones.zones do
			local zone = hazardZones.zones[i]
			if isPartAlive(zone.part) and isPointInZone(point, zone) then
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

return geometry