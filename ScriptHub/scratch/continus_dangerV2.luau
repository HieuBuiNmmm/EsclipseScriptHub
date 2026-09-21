-- Smart Dodge V2: Danger Detection & Geometry Engine
-- Chuy├¬n tr├ích: Nhß║¡n diß╗çn trß║íng th├íi IN DANGER theo thß╗¥i gian thß╗▒c (Player / Point in Hazard).
-- Hß╗ù trß╗ú 100% c├íc dß║íng h├¼nh hß╗ìc: OBB, Circle AoE, Polar Annulus Ring, Moving Beam, v├á Moving Trajectory Corridors.

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

local types = require("@routes/DungeonQuest/core/smartDodgeV2/types")
local detection = require("@routes/DungeonQuest/core/smartDodgeV2/detection")
local visuals = require("@routes/DungeonQuest/core/smartDodgeV2/visuals")
local shared = require("@routes/DungeonQuest/core/shared")

local danger = {}

--// Cß║Ñu h├¼nh & Tham sß╗æ
local enabled = true
local targetScope = "All"            -- "All" | "Boss" | "Mobs"
local dodgeBossEnabled = true        -- Bß║¡t/tß║»t n├⌐ chi├¬u cß╗ºa Boss
local dodgeEnemyEnabled = true       -- Bß║¡t/tß║»t n├⌐ chi├¬u cß╗ºa Qu├íi th╞░ß╗¥ng
local dodgeBoss2OrbEnabled = false   -- Bß║¡t/tß║»t n├⌐ Quß║ú Cß║ºu & Trß╗Ñ Pha L├¬ Boss 2 (Mß║╖c ─æß╗ïnh tß║»t ─æß╗â tß╗æi ╞░u Dame v├á thß╗¥i gian)
local playerHitboxPadding = 0.35      -- B├╣ trß╗½ b├ín k├¡nh c╞í thß╗â nh├ón vß║¡t (studs)
local hitboxDownwardOffset = 2.85    -- Khoß║úng c├ích hß║í thß║Ñp tß╗½ HumanoidRootPart xuß╗æng s├ít ch├ón (studs)
local respawnBypassEnabled = true     -- Bß║¡t/tß║»t bß╗Å qua n├⌐ ─æ├▓n sau khi hß╗ôi sinh
local respawnBypassDuration = 3.0    -- Thß╗¥i gian miß╗àn nhiß╗àm n├⌐ sau khi hß╗ôi sinh (gi├óy)
local MAX_HEIGHT_TOLERANCE = 150.0   -- Cß╗Öt kh├┤ng gian s├ít th╞░╞íng chiß╗üu dß╗ìc trong Dungeon Quest
local RAYCAST_DOWN_DIST = 150.0      -- Khoß║úng c├ích qu├⌐t s├án nh├á

--// Trß║íng th├íi InDanger
local isPlayerInDanger = false
local currentDangerHazard: types.ActiveHazard? = nil
local dangerCallbacks: { (inDanger: boolean, hazard: types.ActiveHazard?) -> () } = {}

--// Raycast Parameters
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Exclude
raycastParams.IgnoreWater = true
local cachedIgnoreList: { Instance } = {}
local lastFilterRebuildTime = 0

local function updateRaycastFilter(force: boolean?)
	local now = os.clock()
	if not force and (now - lastFilterRebuildTime < 0.3) then
		return
	end
	lastFilterRebuildTime = now

	table.clear(cachedIgnoreList)
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Character then table.insert(cachedIgnoreList, p.Character) end
	end
	if Workspace:FindFirstChild("RaycastIgnore") then
		table.insert(cachedIgnoreList, Workspace.RaycastIgnore)
	end
	for inst in pairs(detection.GetActiveHazards()) do
		table.insert(cachedIgnoreList, inst)
	end
	raycastParams.FilterDescendantsInstances = cachedIgnoreList
end

--// Bß║»n raycast kiß╗âm tra s├án nh├á v├á snap tß╗ìa ─æß╗Ö xuß╗æng mß║╖t ─æß║Ñt
function danger.GetFloorPosition(pos: Vector3): (Vector3, boolean)
	updateRaycastFilter(false)

	local rayOrigin = Vector3.new(pos.X, pos.Y + 10, pos.Z)
	local rayDir = Vector3.new(0, -RAYCAST_DOWN_DIST, 0)
	local result = Workspace:Raycast(rayOrigin, rayDir, raycastParams)

	if result and result.Position then
		return Vector3.new(pos.X, result.Position.Y + 3, pos.Z), true
	end
	return pos, false
end

--// Bß║»n raycast kiß╗âm tra s├án nh├á v├á trß║ú vß╗ü cao ─æß╗Ö Y thß╗▒c tß║┐ cß╗ºa mß║╖t s├án
function danger.GetRawFloorY(pos: Vector3): (number, boolean)
	updateRaycastFilter(false)

	local rayOrigin = Vector3.new(pos.X, pos.Y + 12, pos.Z)
	local rayDir = Vector3.new(0, -RAYCAST_DOWN_DIST, 0)
	local result = Workspace:Raycast(rayOrigin, rayDir, raycastParams)

	if result and result.Position then
		return result.Position.Y, true
	end

	local localPlayer = Players.LocalPlayer
	local rootPart = localPlayer and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
	if rootPart and rootPart:IsA("BasePart") then
		return rootPart.Position.Y - 2.8, false
	end

	return pos.Y, false
end

--// Lß║Ñy k├¡ch th╞░ß╗¢c thß╗▒c tß║┐ cß╗ºa Part (t├¡nh cß║ú ─æß╗Ö ph├│ng ─æß║íi cß╗ºa SpecialMesh nß║┐u c├│)
local function getEffectivePartSize(part: BasePart): Vector3
	local mesh = part:FindFirstChildOfClass("SpecialMesh")
	if mesh then
		local s = mesh.Scale
		return Vector3.new(
			part.Size.X * math.abs(s.X),
			part.Size.Y * math.abs(s.Y),
			part.Size.Z * math.abs(s.Z)
		)
	end
	return part.Size
end

--// 1. Kiß╗âm tra h├¼nh chß╗» nhß║¡t ─æß╗ïnh h╞░ß╗¢ng (Oriented Bounding Box - OBB)
function danger.IsPointInPartOBB(point: Vector3, part: BasePart, padding: number?): boolean
	if not part or not part:IsA("BasePart") or not part.Parent then return false end

	local pad = padding or playerHitboxPadding
	local partPos = part.Position
	local pSize = getEffectivePartSize(part)

	-- Broadphase Pruning: Bß╗Å qua nhanh nß║┐u qu├í xa
	local dX = point.X - partPos.X
	local dZ = point.Z - partPos.Z
	local maxDim = math.max(pSize.X, pSize.Y, pSize.Z)
	local maxRadius = (maxDim * 0.7072) + pad + 3.0
	if (dX * dX + dZ * dZ) > (maxRadius * maxRadius) then
		return false
	end

	-- Kiß╗âm tra ─æß╗Ö cao Y
	local heightDiff = math.abs(point.Y - partPos.Y)
	if heightDiff > MAX_HEIGHT_TOLERANCE then
		return false
	end

	-- Chuyß╗ân tß╗ìa ─æß╗Ö sang Local Space cß╗ºa Part
	local localPos = part.CFrame:PointToObjectSpace(point)
	local halfX = (pSize.X / 2) + pad
	local halfZ = (pSize.Z / 2) + pad
	local halfY = math.max(MAX_HEIGHT_TOLERANCE, (pSize.Y / 2) + 5)

	return math.abs(localPos.X) <= halfX
		and math.abs(localPos.Z) <= halfZ
		and math.abs(localPos.Y) <= halfY
end

--// 2. Kiß╗âm tra h├¼nh cß║ºu / h├¼nh trß╗Ñ (Circle / Ball / Cylinder AoE)
function danger.IsPointInSphere(point: Vector3, part: BasePart, padding: number?): boolean
	if not part or not part:IsA("BasePart") or not part.Parent then return false end

	local pad = padding or playerHitboxPadding
	local partPos = part.Position
	local pSize = getEffectivePartSize(part)

	local heightDiff = math.abs(point.Y - partPos.Y)
	if heightDiff > MAX_HEIGHT_TOLERANCE then
		return false
	end

	local dX = point.X - partPos.X
	local dZ = point.Z - partPos.Z
	local radius = (math.max(pSize.X, pSize.Y, pSize.Z) / 2) + pad
	return (dX * dX + dZ * dZ) <= (radius * radius)
end

--// 3. Kiß╗âm tra v├ánh khuy├¬n / b├ín nguyß╗çt (Polar Annulus Ring - thirdBossMultiRings)
function danger.IsPointInRing(point: Vector3, ringPart: BasePart, padding: number?): boolean
	if not ringPart or not ringPart:IsA("BasePart") or not ringPart.Parent then return false end

	-- ─É├▓n ─æ├ính chß╗ë g├óy s├ít th╞░╞íng khi ─æang hiß╗ân thß╗ï r├╡ n├⌐t (ch╞░a mß╗¥ / ch╞░a tan biß║┐n)
	if ringPart.Transparency >= 0.85 then
		return false
	end

	local pad = padding or playerHitboxPadding

	-- 1. T├¼m t├óm thß╗▒c cß╗ºa Model chß╗⌐a c├íc v├▓ng Ring (Center Part)
	local parentModel = ringPart:FindFirstAncestorOfClass("Model") or ringPart.Parent
	local centerPart = parentModel and (parentModel:FindFirstChild("center") or parentModel:FindFirstChild("Center") or (parentModel:IsA("Model") and parentModel.PrimaryPart))
	local centerPos = (centerPart and centerPart:IsA("BasePart")) and centerPart.Position
		or (parentModel and parentModel:IsA("Model") and parentModel:GetPivot().Position)
		or ringPart.Position

	-- 2. Kiß╗âm tra ─æß╗Ö cao Y
	local heightDiff = math.abs(point.Y - centerPos.Y)
	if heightDiff > MAX_HEIGHT_TOLERANCE then
		return false
	end

	-- 3. B├ín k├¡nh 2D tß╗½ t├óm Model tß╗¢i ─æiß╗âm P
	local diffX = point.X - centerPos.X
	local diffZ = point.Z - centerPos.Z
	local r = math.sqrt(diffX * diffX + diffZ * diffZ)

	-- 4. B├ín k├¡nh ngo├ái thß╗▒c tß║┐ cß╗ºa Ring tß╗½ Size.Z
	local radiusOuter = ringPart.Size.Z
	if radiusOuter < 1 then
		radiusOuter = math.max(ringPart.Size.X, ringPart.Size.Z) / 2
	end

	-- Bß╗ü d├áy dß║úi Ring s├ít th╞░╞íng (13 studs cho v├▓ng nhß╗Å, 18 studs cho v├▓ng lß╗¢n)
	local bandThickness = (radiusOuter > 90) and 18.0 or 13.0
	local radiusInner = math.max(0, radiusOuter - bandThickness)

	-- 5. Kiß╗âm tra khoß║úng rß╗ùng ß╗ƒ t├óm (lß╗ù an to├án)
	if r < (radiusInner - pad) then
		return false
	end

	-- 6. Kiß╗âm tra nß║▒m ngo├ái b├ín k├¡nh ngo├ái
	if r > (radiusOuter + pad) then
		return false
	end

	-- 7. Kiß╗âm tra h╞░ß╗¢ng b├ín nguyß╗çt (Semicircle Direction)
	local offX = ringPart.Position.X - centerPos.X
	local offZ = ringPart.Position.Z - centerPos.Z
	local offMag = math.sqrt(offX * offX + offZ * offZ)
	if offMag > 0.5 then
		local dirUnitX = offX / offMag
		local dirUnitZ = offZ / offMag
		local dot = (diffX * dirUnitX) + (diffZ * dirUnitZ)
		-- Nß║┐u dot < -pad: nß║▒m ß╗ƒ nß╗¡a ─æß╗æi diß╗çn (v├╣ng an to├án 100%)
		if dot < -pad then
			return false
		end
	end

	return true
end

--// 4. Kiß╗âm tra Moving Beam (Boss 2 - Thanh beam l─ân tr├▓n quanh trß╗Ñc X)
function danger.IsPointInMovingBeam(point: Vector3, part: BasePart, padding: number?): boolean
	if not part or not part:IsA("BasePart") or not part.Parent then return false end

	local pad = padding or playerHitboxPadding
	local localPos = part.CFrame:PointToObjectSpace(point)
	local pSize = part.Size

	-- Chiß╗üu d├ái sß║úi ngang qu├⌐t ph├▓ng dß╗ìc theo trß╗Ñc X
	local halfLength = (math.max(pSize.X, pSize.Z) / 2) + pad
	-- B├ín k├¡nh tiß║┐t diß╗çn xoay quanh trß╗Ñc X
	local beamRadius = (math.max(pSize.Y, math.min(pSize.X, pSize.Z)) / 2) + pad
	if beamRadius < 3.5 then beamRadius = 3.5 end

	local radialDistSq = localPos.Y * localPos.Y + localPos.Z * localPos.Z
	return (math.abs(localPos.X) <= halfLength)
		and (radialDistSq <= (beamRadius + 1.5) * (beamRadius + 1.5))
end

--// 4b. Kiß╗âm tra xem mß╗Öt ─æiß╗âm P c├│ nß║▒m trong h├ánh lang tia Beam / Laser / Projectile thß║│ng kh├┤ng (Pure 2D Cylinder Math chuß║⌐n V1)
function danger.IsPointInBeamCorridor(
	point: Vector3,
	originPos: Vector3,
	forward2D: Vector3,
	beamRadius: number,
	maxReach: number,
	padding: number?
): (boolean, number, number)
	local pad = padding or playerHitboxPadding
	local effectiveRadius = beamRadius + pad

	-- Kiß╗âm tra ─æß╗Ö cao Y
	local heightDiff = math.abs(point.Y - originPos.Y)
	if heightDiff > MAX_HEIGHT_TOLERANCE then
		return false, 0, 0
	end

	-- Vector 2D tß╗½ origin tß╗¢i ─æiß╗âm point
	local toP = Vector3.new(point.X - originPos.X, 0, point.Z - originPos.Z)
	local dotForward = toP:Dot(forward2D)

	-- Cho ph├⌐p l├╣i sau gß╗æc ph├ít tia (-effectiveRadius) ─æß╗â bß║úo vß╗ç ng╞░ß╗¥i ch╞íi khi ─æß╗⌐ng s├ít/trong ng╞░ß╗¥i Boss
	if dotForward < -effectiveRadius or dotForward > (maxReach + pad) then
		return false, 0, 0
	end

	-- Khoß║úng c├ích vu├┤ng g├│c tß╗¢i trß╗Ñc tia (Perpendicular Distance)
	local proj = forward2D * dotForward
	local perpDist = (toP - proj).Magnitude

	if perpDist <= effectiveRadius then
		return true, perpDist, dotForward
	end

	return false, perpDist, dotForward
end

--// 4c. Kiß╗âm tra xem mß╗Öt ─æiß╗âm P c├│ nß║▒m trong v├╣ng n├│n mß╗ƒ rß╗Öng (Expanding Cone Corridor - Boss 2 Circle Hitbox chuß║⌐n V1)
function danger.IsPointInExpandingCone(
	point: Vector3,
	originPos: Vector3,
	forward2D: Vector3,
	baseRadius: number,
	maxReach: number,
	expansionRate: number?,
	padding: number?,
	maxRadius: number?
): (boolean, number, number, number)
	local pad = padding or playerHitboxPadding
	local rate = expansionRate or 0.25

	-- Kiß╗âm tra ─æß╗Ö cao Y
	local heightDiff = math.abs(point.Y - originPos.Y)
	if heightDiff > MAX_HEIGHT_TOLERANCE then
		return false, 0, 0, baseRadius
	end

	-- Vector 2D tß╗½ origin tß╗¢i ─æiß╗âm point
	local toP = Vector3.new(point.X - originPos.X, 0, point.Z - originPos.Z)
	local dotForward = toP:Dot(forward2D)

	-- B├ín k├¡nh ph├¼nh to dß║ºn theo chiß╗üu dß╗ìc ─æ├▓n ─æ├ính (giß╗¢i hß║ín tß╗æi ─æa nß║┐u c├│ maxRadius)
	local rawRadius = baseRadius + math.max(0, dotForward * rate)
	local effectiveRadius = if maxRadius then math.min(maxRadius, rawRadius) else rawRadius

	if dotForward < -effectiveRadius or dotForward > (maxReach + pad) then
		return false, 0, dotForward, effectiveRadius
	end

	-- Khoß║úng c├ích vu├┤ng g├│c tß╗¢i trß╗Ñc ch├¡nh
	local proj = forward2D * dotForward
	local perpDist = (toP - proj).Magnitude

	if perpDist <= (effectiveRadius + pad) then
		return true, perpDist, dotForward, effectiveRadius
	end

	return false, perpDist, dotForward, effectiveRadius
end

--// Kiß╗âm tra xem mß╗Öt hiß╗âm hß╗ìa c├│ phß║úi l├á Quß║ú Cß║ºu r╞░ß╗út ─æuß╗òi cß╗ºa Boss 2 hay kh├┤ng
function danger.IsBoss2OrbHazard(hazard: types.ActiveHazard): boolean
	if not hazard then return false end
	local name = (hazard.cleanName or hazard.name or ""):lower():gsub("%s+", "")
	return (name:find("secondboss") ~= nil and name:find("orb") ~= nil and name:find("explosion") == nil)
		or name:find("yelloworb") ~= nil
		or name:find("redorb") ~= nil
		or name:find("greenorb") ~= nil
end

--// Kiß╗âm tra xem mß╗Öt hiß╗âm hß╗ìa c├│ phß║úi l├á Trß╗Ñ Pha L├¬ cß╗ºa Boss 2 hay kh├┤ng
function danger.IsBoss2CrystalHazard(hazard: types.ActiveHazard): boolean
	if not hazard then return false end
	local name = (hazard.cleanName or hazard.name or ""):lower():gsub("%s+", "")
	return (name:find("secondboss") ~= nil and name:find("crystal") ~= nil)
		or name:find("crystalpillar") ~= nil
end

--// 5. Kiß╗âm tra xem mß╗Öt ─æiß╗âm P c├│ nß║▒m trong v├╣ng nguy hiß╗âm cß╗ºa mß╗Öt Hazard cß╗Ñ thß╗â kh├┤ng
function danger.IsPointInHazard(point: Vector3, hazard: types.ActiveHazard, padding: number?): boolean
	if not hazard or not hazard.instance or not hazard.instance.Parent then return false end

	local isSpikeBeam = hazard.cleanName:lower():find("seekingspike") ~= nil or hazard.cleanName:lower():find("bigspike") ~= nil

	-- Nß║┐u part ch├¡nh ─æ├ú mß╗¥ hoß║╖c tan biß║┐n (Transparency >= 0.85): chi├¬u thß╗⌐c ─æ├ú kß║┐t th├║c, TUYß╗åT ─Éß╗ÉI kh├┤ng g├óy s├ít th╞░╞íng
	-- NGOß║áI TRß╗¬: tia ─æß╗ïnh h╞░ß╗¢ng (lu├┤n c├│ Part trong suß╗æt) hoß║╖c ─æ├▓n Spike (c├│ giai ─æoß║ín tß╗Ñ lß╗▒c trong suß╗æt tr╞░ß╗¢c khi ph├│ng)
	if not hazard.isTelegraph and not isSpikeBeam and hazard.instance:IsA("BasePart") and hazard.instance.Transparency >= 0.85 and not hazard.isMultiWave then
		return false
	end

	-- Nß║┐u tß║Ñt cß║ú c├íc part trong activeParts ─æß╗üu ─æ├ú mß╗¥ (Transparency >= 0.85): bß╗Å qua kh├┤ng x├⌐t
	if not hazard.isTelegraph and not isSpikeBeam and not hazard.isMultiWave and hazard.activeParts then
		local hasActiveVisible = false
		for p in pairs(hazard.activeParts) do
			if p and p.Parent and p:IsA("BasePart") and p.Transparency < 0.85 then
				hasActiveVisible = true
				break
			end
		end
		if not hasActiveVisible and next(hazard.activeParts) ~= nil then
			return false
		end
	end

	local pad = padding or playerHitboxPadding
	local isBoss2Orb = danger.IsBoss2OrbHazard(hazard)

	-- B╞░ß╗¢c 1: ╞»U TI├èN GIß║óI T├ìCH TO├üN Hß╗îC 2D CHO TIA BEAM / PROJECTILE / EXPANDING CONE (─Éß╗Öc lß║¡p 100% vß╗¢i Visuals, chuß║⌐n V1)
	-- Quß║ú Cß║ºu Boss 2 l├á quß║ú cß║ºu vß║¡t l├╜ l─ân/bay theo ng╞░ß╗¥i ch╞íi, TUYß╗åT ─Éß╗ÉI kh├┤ng ├íp dß╗Ñng h├¼nh hß╗ìc Beam
	if not isBoss2Orb and hazard.forward2D and hazard.dangerRadius then
		local origin: Vector3
		local reach: number
		local isExpandingCone = (hazard.isExpandingCone == true)

		if isExpandingCone then
			origin = hazard.beamOrigin or hazard.position
			reach = hazard.maxLookahead or hazard.telegraphLength or 95.0
			local inCone = danger.IsPointInExpandingCone(point, origin, hazard.forward2D, hazard.dangerRadius, reach, hazard.expansionRate or 0.25, pad, hazard.maxRadius)
			if inCone then
				return true
			end
		elseif hazard.isTelegraph or isSpikeBeam then
			-- Tia ─æß╗ïnh h╞░ß╗¢ng (Beam hoß║╖c Spike Direction Beam): xuß║Ñt ph├ít tß╗½ gß╗æc ph├ít tia v├á bao qu├ít to├án bß╗Ö chiß╗üu d├ái telegraph
			origin = hazard.beamOrigin or hazard.position
			reach = hazard.maxLookahead or hazard.telegraphLength or 140.0
			local inBeam = danger.IsPointInBeamCorridor(point, origin, hazard.forward2D, hazard.dangerRadius, reach, pad)
			if inBeam then
				return true
			end
		else
			-- ─Éß║ín bay / Moving Projectile: ╞»u ti├¬n kiß╗âm tra OBB h├ánh lang cam thß╗▒c tß║┐ nß║┐u visual ─æang hiß╗ân thß╗ï
			local visualData = visuals.GetHazardVisualData(hazard)
			if visualData and visualData.corridorPart and visualData.corridorPart.Parent then
				if danger.IsPointInPartOBB(point, visualData.corridorPart, pad) then
					return true
				end
			else
				origin = hazard.position
				reach = hazard.telegraphLength or hazard.maxLookahead or 40.0
				local inBeam = danger.IsPointInBeamCorridor(point, origin, hazard.forward2D, hazard.dangerRadius, reach, pad)
				if inBeam then
					return true
				end
			end
		end
	end

	-- B╞░ß╗¢c 2: KIß╗éM TRA H├ÇNH LANG TIA ─Éß╗èNH H╞»ß╗ÜNG / MOVING TRAJECTORY (V├╣ng m├áu Cam)
	-- Quß║ú Cß║ºu Boss 2 TUYß╗åT ─Éß╗ÉI kh├┤ng coi h├ánh lang cam ─æß╗ïnh h╞░ß╗¢ng l├á hitbox g├óy s├ít th╞░╞íng
	if not isBoss2Orb then
		local visualData = visuals.GetHazardVisualData(hazard)
		if visualData and visualData.corridorPart and visualData.corridorPart.Parent then
			local inCorridor = danger.IsPointInPartOBB(point, visualData.corridorPart, pad)
			if inCorridor then
				return true
			end
		end
	end

	-- B╞░ß╗¢c 3: Kiß╗âm tra c├íc Part vß║¡t l├╜ nguy hiß╗âm (V├╣ng m├áu V├áng / Part thß╗▒c tß║┐)
	local instNameLower = hazard.instance.Name:lower():gsub("%s+", "")
	local isMultiRings = instNameLower:find("multiring") ~= nil
	local isMovingBeam = instNameLower:find("movingbeam") ~= nil

	for part in pairs(hazard.activeParts) do
		if part and part.Parent and part:IsA("BasePart") then
			if isMultiRings or part.Name:lower():find("ring") then
				if danger.IsPointInRing(point, part, pad) then
					return true
				end
			elseif isMovingBeam then
				if danger.IsPointInMovingBeam(point, part, pad) then
					return true
				end
			elseif part:IsA("Part") and (part.Shape == Enum.PartType.Ball or part.Shape == Enum.PartType.Cylinder) then
				if danger.IsPointInSphere(point, part, pad) then
					return true
				end
			else
				if danger.IsPointInPartOBB(point, part, pad) then
					return true
				end
			end
		end
	end

	return false
end

--// Ph├ón loß║íi ─æ├▓n ─æ├ính xuß║Ñt ph├ít tß╗½ Boss hay Qu├íi th╞░ß╗¥ng
function danger.IsBossHazard(hazard: types.ActiveHazard): boolean
	if not hazard then return false end

	-- Mß╗æc thß╗¥i gian: Mß╗ìi chi├¬u thß╗⌐c sinh ra TR╞»ß╗ÜC thß╗¥i ─æiß╗âm Boss spawn th├¼ 100% l├á cß╗ºa Enemy/Qu├íi c┼⌐
	local bossSpawnTime = detection.GetLastBossSpawnTime and detection.GetLastBossSpawnTime() or 0
	if bossSpawnTime > 0 and hazard.spawnTime and hazard.spawnTime < bossSpawnTime then
		return false
	end

	-- Nß║┐u Boss hiß╗çn tß║íi kh├┤ng active trong game, kh├┤ng thß╗â c├│ ─æ├▓n ─æ├ính n├áo cß╗ºa Boss
	if shared.IsBossActive and not shared.IsBossActive() then
		return false
	end

	if hazard.isBossHazard ~= nil then
		return hazard.isBossHazard
	end
	local nameLower = hazard.name:lower()
	if nameLower:find("boss") ~= nil then
		return true
	end
	if hazard.instance and hazard.instance.Parent and hazard.instance.Parent.Name:lower():find("boss") ~= nil then
		return true
	end
	return false
end

--// Kiß╗âm tra xem mß╗Öt hiß╗âm hß╗ìa c├│ bß╗ï bß╗Å qua n├⌐ dß╗▒a theo c├ái ─æß║╖t Boss/Enemy kh├┤ng
function danger.IsHazardIgnored(hazard: types.ActiveHazard): boolean
	if not hazard then return true end

	-- Bß╗Å qua Quß║ú Cß║ºu & Trß╗Ñ Pha L├¬ Boss 2 nß║┐u tß║»t n├⌐ Orb & Crystal
	if not dodgeBoss2OrbEnabled and (danger.IsBoss2OrbHazard(hazard) or danger.IsBoss2CrystalHazard(hazard)) then
		return true
	end

	local isBoss = danger.IsBossHazard(hazard)
	if targetScope == "Boss" and not isBoss then
		-- Khi Boss ─æang xuß║Ñt hiß╗çn, kh├┤ng bß╗Å qua c├íc chi├¬u thß╗⌐c sinh ra trong ph├▓ng Boss (d├╣ t├¬n kh├┤ng chß╗⌐a 'boss')
		if shared.IsBossActive and shared.IsBossActive() then
			return not dodgeBossEnabled
		end
		return true
	elseif targetScope == "Mobs" and isBoss then
		return true
	end
	if isBoss then
		return not dodgeBossEnabled
	else
		return not dodgeEnemyEnabled
	end
end

--// 6. Kiß╗âm tra xem mß╗Öt ─æiß╗âm P c├│ bß╗ï d├¡nh bß║Ñt kß╗│ hiß╗âm hß╗ìa n├áo ─æang k├¡ch hoß║ít kh├┤ng (hß╗ù trß╗ú custom padding)
function danger.IsPointInAnyHazard(point: Vector3, ignoredInstance: Instance?, padding: number?): (boolean, types.ActiveHazard?)
	if not enabled or not detection.IsEnabled() then
		return false, nil
	end

	local activeHazards = detection.GetActiveHazards()
	local list = {}
	for _, hazard in pairs(activeHazards) do
		if ignoredInstance then
			local shouldIgnore = (hazard.instance == ignoredInstance)
				or (hazard.instance and hazard.instance.Name == ignoredInstance.Name)
				or (hazard.instance and hazard.instance:IsDescendantOf(ignoredInstance))
				or (ignoredInstance:IsDescendantOf(hazard.instance))

			if not shouldIgnore and danger.IsBoss2OrbHazard(hazard) then
				local ignName = ignoredInstance.Name:lower():gsub("%s+", "")
				if ignName:find("orb") or ignName:find("secondboss") then
					shouldIgnore = true
				end
			end

			if shouldIgnore then
				continue
			end
		end

		-- Bß╗Å qua hiß╗âm hß╗ìa nß║┐u ng╞░ß╗¥i d├╣ng tß║»t n├⌐ Boss hoß║╖c tß║»t n├⌐ Qu├íi th╞░ß╗¥ng
		if danger.IsHazardIgnored(hazard) then
			continue
		end

		table.insert(list, hazard)
	end

	if #list > 1 then
		table.sort(list, function(a, b)
			local da = (Vector3.new(a.position.X - point.X, 0, a.position.Z - point.Z)).Magnitude
			local db = (Vector3.new(b.position.X - point.X, 0, b.position.Z - point.Z)).Magnitude
			if math.abs(da - db) > 0.5 then
				return da < db
			end
			return (a.name or "") < (b.name or "")
		end)
	end

	for _, hazard in ipairs(list) do
		if danger.IsPointInHazard(point, hazard, padding) then
			return true, hazard
		end
	end

	return false, nil
end

--// Kiß╗âm tra xem ─æoß║ín ─æ╞░ß╗¥ng di chuyß╗ân tß╗½ fromPos -> toPos c├│ an to├án kh├┤ng (Path Clearance)
function danger.IsPathSafe(fromPos: Vector3, toPos: Vector3, ignoredInstance: Instance?): boolean
	local dist = (toPos - fromPos).Magnitude
	if dist <= 1.2 then return true end

	-- B╞░ß╗¢c chia mß║½u 2.8 studs (tß╗æi ─æa 14 b╞░ß╗¢c ─æß╗â tß╗æi ╞░u CPU)
	local steps = math.clamp(math.ceil(dist / 2.8), 2, 14)
	for i = 1, steps - 1 do
		local t = i / steps
		local samplePos = fromPos:Lerp(toPos, t)
		if danger.IsPointInAnyHazard(samplePos, ignoredInstance) then
			return false
		end
	end
	return true
end

--// 7. Kiß╗âm tra trß║íng th├íi cß╗ºa Nh├ón vß║¡t Player hiß╗çn tß║íi (Multi-Point Capsule Body Sampling)
function danger.IsPlayerInDanger(): (boolean, types.ActiveHazard?)
	local localPlayer = Players.LocalPlayer
	local character = localPlayer and localPlayer.Character
	if not character then return false, nil end

	-- 0. Kiß╗âm tra tß╗¡ trß║¡n hoß║╖c ─æang trong thß╗¥i gian bß║úo vß╗ç sau hß╗ôi sinh (Respawn Protection)
	if shared.IsDead and shared.IsDead() then
		return false, nil
	end
	if danger.IsRespawnProtected() then
		return false, nil
	end

	local hum = character:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then return false, nil end

	local rootPart = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso")
	if not rootPart or not rootPart:IsA("BasePart") then return false, nil end

	local pPos = rootPart.Position
	local pad = playerHitboxPadding
	local footPos = pPos - Vector3.new(0, hitboxDownwardOffset, 0)

	-- 1. Kiß╗âm tra t├óm c╞í thß╗â (Thß║»t l╞░ng & B├án ch├ón)
	local inDanger, hazard = danger.IsPointInAnyHazard(pPos, nil, pad)
	if inDanger then
		return true, hazard
	end

	inDanger, hazard = danger.IsPointInAnyHazard(footPos, nil, pad)
	if inDanger then
		return true, hazard
	end

	-- 2. Qu├⌐t ─Éa ─Éiß╗âm tr├¬n c╞í thß╗â (Multi-Point Capsule Body Sampling)
	-- Qu├⌐t 8 ─æiß╗âm bi├¬n theo chu vi h├¼nh hß╗Öp c╞í thß╗â (dß╗▒a theo g├│c quay CFrame cß╗ºa nh├ón vß║¡t)
	local cf = rootPart.CFrame
	local fwd = cf.LookVector
	local rgt = cf.RightVector

	-- B├ín k├¡nh th├ón ng╞░ß╗¥i Roblox (Ngang vai/h├┤ng ~ 1.4 studs, Tr╞░ß╗¢c/sau ngß╗▒c ~ 1.0 studs)
	local halfW = 1.4
	local halfD = 1.0
	local diagW = halfW * 0.7071
	local diagD = halfD * 0.7071

	local fwdVec = fwd * halfD
	local rgtVec = rgt * halfW
	local diagFR = (fwd * diagD) + (rgt * diagW)
	local diagFL = (fwd * diagD) - (rgt * diagW)
	local diagBR = (-fwd * diagD) + (rgt * diagW)
	local diagBL = (-fwd * diagD) - (rgt * diagW)

	local perimeterOffsets = {
		fwdVec,
		-fwdVec,
		rgtVec,
		-rgtVec,
		diagFR,
		diagFL,
		diagBR,
		diagBL,
	}

	-- Qu├⌐t chu vi ngang b├án ch├ón (chß║ím c├íc v├▓ng AoE/disc bß╗çt d╞░ß╗¢i s├án)
	for i = 1, 8 do
		local footSample = footPos + perimeterOffsets[i]
		inDanger, hazard = danger.IsPointInAnyHazard(footSample, nil, pad)
		if inDanger then
			return true, hazard
		end
	end

	-- Qu├⌐t chu vi ngang thß║»t l╞░ng / vai (chß║ím c├íc tia Beam, Spike, ─æß║ín bay sß║ít ng╞░ß╗¥i)
	for i = 1, 8 do
		local midSample = pPos + perimeterOffsets[i]
		inDanger, hazard = danger.IsPointInAnyHazard(midSample, nil, pad)
		if inDanger then
			return true, hazard
		end
	end

	return false, nil
end

--// Respawn Dodge Bypass Getters & Setters
function danger.SetRespawnBypassEnabled(state: boolean)
	respawnBypassEnabled = (state == true)
end

function danger.IsRespawnBypassEnabled(): boolean
	return respawnBypassEnabled
end

function danger.SetRespawnBypassDuration(value: number)
	if type(value) == "number" and value >= 0.5 then
		respawnBypassDuration = value
		if shared.SetRespawnProtectionDuration then
			shared.SetRespawnProtectionDuration(value)
		end
	end
end

function danger.GetRespawnBypassDuration(): number
	return respawnBypassDuration
end

function danger.IsRespawnProtected(): boolean
	if not respawnBypassEnabled then return false end
	if shared.IsDead and shared.IsDead() then return true end
	if shared.IsJustRespawned then
		return shared.IsJustRespawned(respawnBypassDuration)
	end
	return false
end

function danger.GetRespawnProtectionRemaining(): number
	if not respawnBypassEnabled then return 0 end
	local lastTime = shared.GetLastRespawnTime and shared.GetLastRespawnTime() or 0
	if lastTime == 0 then return 0 end
	local elapsed = os.clock() - lastTime
	local remaining = respawnBypassDuration - elapsed
	return math.max(0, remaining)
end

--// Lß║»ng nghe sß╗▒ kiß╗çn thay ─æß╗òi trß║íng th├íi Danger
function danger.OnDangerStateChanged(callback: (inDanger: boolean, hazard: types.ActiveHazard?) -> ())
	if type(callback) == "function" then
		table.insert(dangerCallbacks, callback)
	end
end

--// Getters & Setters
function danger.GetHitboxPadding(): number
	return playerHitboxPadding
end

function danger.SetHitboxPadding(value: number)
	if type(value) == "number" and value >= 0 then
		playerHitboxPadding = value
	end
end

function danger.GetHitboxDownwardOffset(): number
	return hitboxDownwardOffset
end

function danger.SetHitboxDownwardOffset(value: number)
	if type(value) == "number" and value >= 0 then
		hitboxDownwardOffset = value
	end
end

function danger.IsEnabled(): boolean
	return enabled
end

function danger.SetEnabled(state: boolean)
	enabled = (state == true)
	if not enabled then
		isPlayerInDanger = false
		currentDangerHazard = nil
	end
end

function danger.GetCurrentDangerHazard(): types.ActiveHazard?
	return currentDangerHazard
end

function danger.SetDodgeBossEnabled(state: boolean)
	dodgeBossEnabled = (state == true)
	if dodgeBossEnabled and not dodgeEnemyEnabled then
		targetScope = "Boss"
	elseif not dodgeBossEnabled and dodgeEnemyEnabled then
		targetScope = "Mobs"
	elseif dodgeBossEnabled and dodgeEnemyEnabled then
		targetScope = "All"
	end
end

function danger.IsDodgeBossEnabled(): boolean
	return dodgeBossEnabled
end

function danger.SetDodgeBoss2OrbEnabled(state: boolean)
	dodgeBoss2OrbEnabled = (state == true)
end

function danger.IsDodgeBoss2OrbEnabled(): boolean
	return dodgeBoss2OrbEnabled
end

function danger.SetDodgeEnemyEnabled(state: boolean)
	dodgeEnemyEnabled = (state == true)
	if dodgeBossEnabled and not dodgeEnemyEnabled then
		targetScope = "Boss"
	elseif not dodgeBossEnabled and dodgeEnemyEnabled then
		targetScope = "Mobs"
	elseif dodgeBossEnabled and dodgeEnemyEnabled then
		targetScope = "All"
	end
end

function danger.IsDodgeEnemyEnabled(): boolean
	return dodgeEnemyEnabled
end

function danger.SetTargetScope(scope: string)
	local norm = shared.NormalizeTargetScope(scope)
	targetScope = norm
	if norm == "Boss" then
		dodgeBossEnabled = true
		dodgeEnemyEnabled = false
	elseif norm == "Mobs" then
		dodgeBossEnabled = false
		dodgeEnemyEnabled = true
	else
		dodgeBossEnabled = true
		dodgeEnemyEnabled = true
	end
end

function danger.GetTargetScope(): string
	return targetScope
end

--// Heartbeat Runner: Theo d├╡i v├á cß║¡p nhß║¡t trß║íng th├íi IN DANGER thß╗¥i gian thß╗▒c
RunService.Heartbeat:Connect(function()
	if not enabled or not detection.IsEnabled() then
		if isPlayerInDanger then
			isPlayerInDanger = false
			currentDangerHazard = nil
			for _, cb in ipairs(dangerCallbacks) do
				pcall(cb, false, nil)
			end
		end
		visuals.UpdatePlayerHitboxVisual(nil)
		return
	end

	local inDanger, hazard = danger.IsPlayerInDanger()
	if inDanger ~= isPlayerInDanger or hazard ~= currentDangerHazard then
		isPlayerInDanger = inDanger
		currentDangerHazard = hazard

		for _, cb in ipairs(dangerCallbacks) do
			pcall(cb, inDanger, hazard)
		end
	end

	-- Cß║¡p nhß║¡t v├▓ng tr├▓n 3D Hitbox quanh ch├ón nh├ón vß║¡t (lu├┤n neo theo t├óm Player vß╗¢i offset hß║í thß║Ñp)
	local localPlayer = Players.LocalPlayer
	local character = localPlayer and localPlayer.Character
	local rootPart = character and (character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso"))
	if rootPart and rootPart:IsA("BasePart") then
		local pPos = rootPart.Position
		local footY = pPos.Y - hitboxDownwardOffset
		visuals.UpdatePlayerHitboxVisual(pPos, inDanger, playerHitboxPadding, footY)
	else
		visuals.UpdatePlayerHitboxVisual(nil)
	end
end)

danger.IsPointInDanger = danger.IsPointInAnyHazard

return danger
