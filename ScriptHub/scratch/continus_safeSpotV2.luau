--================================================================--
-- Smart Dodge V2: Safe Spot Radar (Adaptive Direction + Distance Search)
--
-- Thiß║┐t kß║┐ HO├ÇN TO├ÇN Mß╗ÜI, kh├┤ng kß║┐ thß╗½a V1. Kh├┤ng phß╗Ñ thuß╗Öc h├¼nh dß║íng
-- hiß╗âm hß╗ìa (unknown shapes): mß╗ìi khoß║úng c├ích ─æß╗üu ─æo bß║▒ng qu├⌐t + bisect.
--
-- C╞á CHß║╛ (3 tß║ºng):
-- 1) ADAPTIVE DIRECTION SEARCH:
--    - Phase 1 (SEED): bß║»n ~62% sß╗æ tia, bß╗ï K├ëO (warp) vß╗ü ph├¡a bias
--      (h╞░ß╗¢ng Player ─æang chß║íy) hoß║╖c xa nguß╗ôn hiß╗âm hß╗ìa (nß║┐u ─æß╗⌐ng im).
--    - Phase 2 (REFINE): lß║Ñy K h╞░ß╗¢ng seed c├│ lß╗æi tho├ít tß╗æt nhß║Ñt rß╗ôi
--      phß╗º th├¬m ~38% tia xoay quanh tß╗½ng h╞░ß╗¢ng ─æ├│ trong cung ┬▒SUB_ARC
--      -> ph├ón bß╗æ tia TH├öNG MINH theo ─æß╗ïa h├¼nh, kh├┤ng d├án ─æß╗üu m├╣ qu├íng.
--    Pool tia ─æ╞░ß╗úc GIß╗« NGUY├èN tuyß╗çt ─æß╗æi giß╗»a c├íc lß║ºn qu├⌐t (chß╗ë rebuild
--    khi rayCount / toggle adaptive ─æß╗òi, hoß║╖c mß╗¢i v├áo danger) -> cho ph├⌐p
--    WARM START v├á giß╗» pattern tia ß╗òn ─æß╗ïnh, kh├┤ng nhß║úy loß║ín.
-- 2) DISTANCE SEARCH (warm start):
--    - Mß╗ùi tia nhß╗¢ khoß║úng c├ích lß╗æi tho├ít lß║ºn tr╞░ß╗¢c (slotDist).
--    - Lß║ºn sau qu├⌐t lß║íi tr├¬n C├ÖNG tia: ─æß╗⌐ng y├¬n -> qu├⌐t L├ÖI tß╗½ hint ─æß╗â
--      khoanh m├⌐p (gß║ºn nh╞░ 0 chi ph├¡); hazard nß╗ƒ -> nhß║úy xa coarse nhanh.
--    - Kh├┤ng c├│ hint -> sweep tß╗½ 0 vß╗¢i stride t─âng dß║ºn (n├┤ng->s├óu).
-- 3) BINARY REFINEMENT: sau khi c├│ 1 bß╗ün [unsafe, safe] gß║ºn nhß║Ñt, chß║íy
--    bisect (BISECT_ITER v├▓ng) ─æß╗â kh├│a ch├¡nh x├íc M├ëP hiß╗âm hß╗ìa + pad
--    (~0.01 studs) -> CHß╗ê chß║íy Vß╗¬A ─Éß╗ª ─æß╗â tho├ít, kh├┤ng ph├│ng xa theo radius.
--
-- T├ìNH Lß║áI (new computation), KH├öNG tß╗▒ qu├⌐t theo di chuyß╗ân:
--   - V├áo IN DANGER / hß║┐t ─æe dß╗ìa (danger ─æß╗òi)
--   - Hazard list thay ─æß╗òi (qu├⌐t lß║íi pattern c┼⌐ ─æß╗â cß║¡p nhß║¡t spot)
--   - Spot chß╗æt kh├┤ng c├▓n an to├án
--   - ─Éß╗òi c├ái ─æß║╖t (rayCount, adaptive, maxRadius, escapeMargin)
--
-- CHß║ñM ─ÉIß╗éM: Gß║ªN NHß║ñT l├á tuyß╗çt ─æß╗æi; h╞░ß╗¢ng ra xa / thuß║¡n h╞░ß╗¢ng chß║íy chß╗ë
-- l├á tie-break khi sai lß╗çch Γëñ TIE_BAND -> kh├┤ng ─æß║⌐y Player chß║íy xa th├¬m.
--
-- VISUAL (bß║¡t xem dß╗à):
--   - Vector m├áu: XANH=tho├ít, ─Éß╗Ä=bß╗ï chß║╖n, V├ÇNG=vector ─æ╞░ß╗úc chß╗ìn.
--     Tia REFINE vß║╜ mß║únh h╞ín tia SEED.
--   - ß╗ö CYN ß╗ƒ vß╗ï tr├¡ Player l├║c QU├ëT (gß╗æc).
--   - Marker XANH + nh├ún khoß║úng c├ích tß║íi Safe Spot chß╗æt.
--   - Tß║Ñt cß║ú visual ─Éß╗ÿC Lß║¼P vß╗¢i Player: ─æß╗⌐ng y├¬n tß║íi vß╗ï tr├¡ ─æ├ú qu├⌐t,
--     chß╗ë ─æ╞░ß╗úc cß║¡p nhß║¡t/─æ╞░a vß╗ü ngay khi c├│ mß╗Öt lß║ºn t├¡nh to├ín mß╗¢i.
--================================================================--

local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local types = require("@routes/DungeonQuest/core/smartDodgeV2/types")
local detection = require("@routes/DungeonQuest/core/smartDodgeV2/detection")
local danger = require("@routes/DungeonQuest/core/smartDodgeV2/danger")
local bossArea = require("@routes/DungeonQuest/core/smartDodgeV2/bossArea")

local player = services.player

local safeSpot = {}

--// Cß║Ñu h├¼nh (thao t├íc qua UI)
local enabled = false
local rayCount = 24            -- Tß╗òng sß╗æ vector (8..48, mß║╖c ─æß╗ïnh 24)
local maxRadius = 30           -- B├ín k├¡nh qu├⌐t tß╗æi ─æa (studs) - CHß╗ê l├á hard cap
local escapeMargin = 0.5       -- ─Éß╗çm th├¬m quanh th├ón sau khi ra khß╗Åi m├⌐p hiß╗âm hß╗ìa (mß║╖c ─æß╗ïnh 0.5 studs, chß╗ënh qua UI)
local showVectors = true
local showMarker = true
local showVectorNumbers = false -- ─É├ính sß╗æ thß╗⌐ tß╗▒ tß╗½ng vector (#1..#N) tr├¬n ─æß║ºu m├║t
local adaptive = true          -- Bß║¡t/tß║»t Adaptive Direction Search
local lastLateralActive = false   -- Theo d├╡i trß║íng th├íi n├⌐ ─æß║ín/beam tß║ít s╞░ß╗¥n (Criss Cross, Moving Beam)

--// Hß║▒ng sß╗æ
local MARCH_STEP = 0.75        -- B╞░ß╗¢c sweep c╞í bß║ún (studs)
local BISECT_ITER = 6          -- V├▓ng bisect kh├│a ch├¡nh x├íc m├⌐p (~0.01 studs)
local RAY_POOL_MAX = 48        -- Pool tß╗æi ─æa ─æß╗â ─æß╗òi rayCount kh├┤ng rebuild ─æß╗Öt ngß╗Öt
local RAY_HEIGHT_OFFSET = 0.25 -- Vß║╜ ray cao h╞ín mß║╖t s├án ─æß╗â dß╗à nh├¼n
local AWAY_BONUS = 1.0         -- ─Éiß╗âm cß╗Öng (chß╗ë khi H├ÆA khoß║úng c├ích) nß║┐u vector h╞░ß╗¢ng RA XA nguß╗ôn nguy hiß╗âm
local FORWARD_BONUS = 1.0      -- ─Éiß╗âm cß╗Öng (chß╗ë khi H├ÆA khoß║úng c├ích) nß║┐u vector thuß║¡n h╞░ß╗¢ng ─æang chß║íy
local TIE_BAND = 0.75          -- Sai lß╗çch nghi├¬ng (studs) ─æß╗â mß╗¢i ├íp dß╗Ñng tie-break h╞░ß╗¢ng
local RESCAN_THROTTLE = 0.25   -- Gi├óy tß╗æi thiß╗âu giß╗»a 2 lß║ºn qu├⌐t (chß╗æng spam)
local VALIDATE_INTERVAL = 0.1  -- Tß║ºn suß║Ñt validate latch (gi├óy)

--// Hß║▒ng sß╗æ Adaptive Direction Search
local BIAS_WARP = 0.5          -- ─Éß╗Ö k├⌐o seed rays vß╗ü bias dir (0..1, monotonic warp)
local SEED_FRAC = 0.62         -- Phß║ºn tia SEED tr├¬n tß╗òng sß╗æ (c├▓n lß║íi = REFINE)
local SUB_ARC = 0.3            -- Nß╗¡a cung (rad) phß╗º tia REFINE quanh tia tß╗æt (~17┬░)
local REFINE_K_MAX = 3         -- Sß╗æ h╞░ß╗¢ng seed tß╗æt nhß║Ñt ─æß╗â subdivide
local DUP_EPS = 0.06           -- Sai lß╗çch g├│c (rad) mß╗¢i coi l├á 2 tia tr├╣ng nhau

--// M├áu visual (Cyberpunk Tactical Theme)
local COLOR_FOUND = Color3.fromRGB(0, 255, 140)    -- Emerald Cyberpunk Green
local COLOR_BLOCKED = Color3.fromRGB(255, 55, 65)  -- Crimson Warning Red
local COLOR_CHOSEN = Color3.fromRGB(255, 215, 0)   -- Radiant Gold
local COLOR_ORIGIN = Color3.fromRGB(0, 220, 255)   -- Hologram Cyan
local COLOR_MARKER = Color3.fromRGB(0, 255, 140)   -- Emerald Target Green

--// Trß║íng th├íi radar
local isInDanger = false
local currentHazardName: string? = nil
local safeSpotPos: Vector3? = nil
local safeSpotDist = 0
local chosenRayIndex: number? = nil
local scanOrigin: Vector3? = nil
local scanFloorY: number? = nil
local rayResults: { any }? = nil
local lastScanTime = 0
local lastValidateTime = 0
local cleaned = false

--// Trß║íng th├íi adaptive pool
local rayDirs: { Vector3 } = {}          -- Pool tia hiß╗çn tß║íi (seed + refine)
local rayDirsBuilt = false               -- Pool ─æ├ú x├óy cho ngß╗» cß║únh hazard hiß╗çn tß║íi ch╞░a
local slotDist: { [number]: number? } = {} -- Warm-start: khoß║úng c├ích lß╗æi tho├ít cß╗ºa tß╗½ng slot
local seedLen = 0                        -- Sß╗æ tia seed trong pool hiß╗çn tß║íi (vß║╜ refine mß║únh h╞ín)

--// Callbacks (UI monitor)
local safeSpotCallbacks: { (boolean, Vector3?, string?, number, number?) -> () } = {}

--// Visuals (3D Holographic Vectors & Tactical Markers)
type RayVisualItem = {
	beam: Part,
	tip: Part,
	label: BillboardGui?,
}

local visualFolder: Folder? = nil
local rayItems: { [number]: RayVisualItem } = {}
local originPad: Part? = nil
local originDot: Part? = nil
local markerHalo: Part? = nil
local markerBeacon: Part? = nil
local markerLabel: BillboardGui? = nil

--// Dß╗ìn folder visual c┼⌐ (nß║┐u ─æ├ú inject tr╞░ß╗¢c ─æ├│) ─æß╗â tr├ính t├¡ch tß╗Ñ part tr├╣ng t├¬n
local oldFolder = Workspace:FindFirstChild("SmartDodgeV2_Visuals")
if oldFolder then
	pcall(function() oldFolder:Destroy() end)
end

--// ------------------------------------------------------------------ //
-- Helpers
--// ------------------------------------------------------------------ //

local function getPlayerState()
	local character = player and player.Character
	if not character then return nil, nil, nil end
	local root = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso")
	if not root or not root:IsA("BasePart") then return nil, nil, nil end
	local hum = character:FindFirstChildOfClass("Humanoid")
	local footY = root.Position.Y - danger.GetHitboxDownwardOffset()
	return root.Position, hum, footY
end

local function isPointSafe(p: Vector3, pad: number): boolean
	if not bossArea.IsPointInArena(p, 0) then
		return false
	end
	if bossArea.IsPointInBoss1Center and bossArea.IsPointInBoss1Center(p) then
		return false
	end
	return not danger.IsPointInAnyHazard(p, nil, pad)
end

-- Kiß╗âm tra xem ─æiß╗âm tß║íi khoß║úng c├ích dist c├│ an to├án vß╗¢i khoß║úng ─æß╗çm pad kh├┤ng
local function sampleSafe(origin: Vector3, dir: Vector3, dist: number, pad: number): boolean
	local base = Vector3.new(origin.X + dir.X * dist, origin.Y, origin.Z + dir.Z * dist)
	return isPointSafe(base, pad)
end

-- Kh├│a ch├¡nh x├íc m├⌐p hiß╗âm hß╗ìa: lo = ─æ├ú biß║┐t UNSAFE, hi = ─æ├ú biß║┐t SAFE.
-- Bisect 6 v├▓ng thu hß║╣p khoß║úng c├ích xuß╗æng sai sß╗æ ~0.01 studs,
-- gi├║p Safe Spot nß║▒m Vß╗¬A Vß║╢N ngay m├⌐p ngo├ái cß╗ºa hiß╗âm hß╗ìa + escapeMargin.
local function bisectExit(origin: Vector3, dir: Vector3, low: number, high: number, pad: number): number
	local lo, hi = low, high
	for _ = 1, BISECT_ITER do
		local mid = (lo + hi) * 0.5
		local p = Vector3.new(origin.X + dir.X * mid, origin.Y, origin.Z + dir.Z * mid)
		if isPointSafe(p, pad) then
			hi = mid
		else
			lo = mid
		end
	end
	return hi
end

-- Stride sweep t─âng dß║ºn: n├┤ng -> mß╗ïn, s├óu -> th├┤ (giß║úm sß╗æ mß║½u khi phß║úi qu├⌐t xa)
local function strideFor(dist: number): number
	if dist < 6 then
		return MARCH_STEP
	elseif dist < 12 then
		return MARCH_STEP * 2
	end
	return MARCH_STEP * 4
end

-- Kh├│a ch├¡nh x├íc m├⌐p chß║ím v├áo mß╗Öt Hazard Mß╗ÜI (m├⌐p Skill cß║ún ─æ╞░ß╗¥ng)
local function bisectHazardEntry(origin: Vector3, dir: Vector3, low: number, high: number, hazard: types.ActiveHazard, pad: number): number
	local lo, hi = low, high
	for _ = 1, 4 do
		local mid = (lo + hi) * 0.5
		local p = Vector3.new(origin.X + dir.X * mid, origin.Y, origin.Z + dir.Z * mid)
		if danger.IsPointInHazard(p, hazard, pad) then
			hi = mid
		else
			lo = mid
		end
	end
	return lo
end

--// Raycast kiß╗âm tra T╞░ß╗¥ng Map v├á ch╞░ß╗¢ng ngß║íi vß║¡t vß║¡t l├╜
local wallRayParams = RaycastParams.new()
wallRayParams.FilterType = Enum.RaycastFilterType.Exclude
wallRayParams.IgnoreWater = true
local cachedWallIgnore: { Instance } = {}
local lastWallFilterTime = 0

local function updateWallFilter()
	local now = os.clock()
	if now - lastWallFilterTime < 0.3 then return end
	lastWallFilterTime = now

	table.clear(cachedWallIgnore)
	if player and player.Character then
		table.insert(cachedWallIgnore, player.Character)
	end
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player and p.Character then
			table.insert(cachedWallIgnore, p.Character)
		end
	end
	local rayIgnore = Workspace:FindFirstChild("RaycastIgnore")
	if rayIgnore then
		table.insert(cachedWallIgnore, rayIgnore)
	end
	if visualFolder and visualFolder.Parent then
		table.insert(cachedWallIgnore, visualFolder)
	end
	local tracked = shared.GetTrackedEnemyData and shared.GetTrackedEnemyData()
	if tracked then
		for _, data in ipairs(tracked) do
			if data and data.Model and data.Model.Parent then
				table.insert(cachedWallIgnore, data.Model)
			end
		end
	end
	wallRayParams.FilterDescendantsInstances = cachedWallIgnore
end

local function getWallDistance(origin: Vector3, dir: Vector3, maxDist: number): number?
	updateWallFilter()
	local rayOrigin = Vector3.new(origin.X, origin.Y + 1.2, origin.Z)
	local remainingDist = maxDist
	local currentOrigin = rayOrigin
	local totalDist = 0

	for _ = 1, 3 do
		local hit = Workspace:Raycast(currentOrigin, dir * remainingDist, wallRayParams)
		if not hit then
			return nil
		end
		local dist = (hit.Position - currentOrigin).Magnitude
		totalDist += dist
		if hit.Instance and (hit.Instance:IsA("Terrain") or hit.Instance.CanCollide) then
			return totalDist
		end
		table.insert(cachedWallIgnore, hit.Instance)
		wallRayParams.FilterDescendantsInstances = cachedWallIgnore
		remainingDist = maxDist - totalDist
		if remainingDist <= 0.5 then
			break
		end
		currentOrigin = hit.Position + dir * 0.1
	end
	return nil
end

-- T├¼m danh s├ích c├íc Hazard m├á ─æiß╗âm point ─æang ─æß╗⌐ng b├¬n trong
local function getHazardsAt(point: Vector3, pad: number): { [types.ActiveHazard]: boolean }
	local set = {}
	local active = detection.GetActiveHazards()
	for _, h in pairs(active) do
		if not danger.IsHazardIgnored(h) then
			if danger.IsPointInHazard(point, h, pad) then
				set[h] = true
			end
		end
	end
	local curr = danger.GetCurrentDangerHazard()
	if curr then
		set[curr] = true
	end
	return set
end

-- DISTANCE SEARCH: t├¼m khoß║úng c├ích lß╗æi tho├ít cho 1 tia.
-- - Tß╗▒ ─æß╗Öng nhß║¡n diß╗çn va chß║ím T╞░ß╗¥ng Map (World Collision Raycast).
-- - Nhß║¡n diß╗çn Skill kh├íc chß║╖n ngang ─æ╞░ß╗¥ng: vector dß╗½ng ngay tß║íi m├⌐p Skill chß║»n.
-- - Trß║ú vß╗ü: (foundDist?, blockedDist, blockedReason)
local function resolveExitDistance(
	origin: Vector3,
	dir: Vector3,
	hint: number?,
	pad: number,
	initialHazards: { [types.ActiveHazard]: boolean }
): (number?, number, string?)
	-- 1. Kiß╗âm tra va chß║ím vß╗¢i T╞░ß╗¥ng Map
	local wallDist = getWallDistance(origin, dir, maxRadius)
	local maxSearch = wallDist and math.max(0.5, wallDist - 0.8) or maxRadius

	-- 1.1 Kiß╗âm tra giß╗¢i hß║ín S├án ─Éß║Ñu Boss 1 (Boss 1 Arena Virtual Boundary)
	local arenaLimit, hasArenaLimit = bossArea.GetRayLimit(origin, dir, maxRadius)
	local isArenaCapped = false
	if hasArenaLimit and arenaLimit then
		if arenaLimit < maxSearch then
			maxSearch = math.max(0.5, arenaLimit)
			isArenaCapped = true
		end
	end

	-- 2. Warm start hint nß║┐u c├▓n hß╗úp lß╗ç
	if hint and hint >= MARCH_STEP and hint <= maxSearch then
		if sampleSafe(origin, dir, hint, pad) then
			local lo = math.max(0, hint - MARCH_STEP)
			while lo > 0 do
				if not sampleSafe(origin, dir, lo, pad) then
					local exitDist = bisectExit(origin, dir, lo, hint, pad)
					if exitDist <= maxSearch then
						return exitDist, exitDist, "safe"
					end
					break
				end
				lo -= MARCH_STEP
			end
			local exitDist = bisectExit(origin, dir, 0, hint, pad)
			if exitDist <= maxSearch then
				return exitDist, exitDist, "safe"
			end
		end
	end

	-- 3. Sweep tß╗½ 0 vß╗¢i stride t─âng dß║ºn
	local prevD = 0
	local d = strideFor(0)
	while d <= maxSearch do
		local base = Vector3.new(origin.X + dir.X * d, origin.Y, origin.Z + dir.Z * d)
		local inDanger, hitHazard = danger.IsPointInAnyHazard(base, nil, pad)

		if inDanger and hitHazard then
			-- Nß║┐u chß║ím v├áo mß╗Öt Skill Mß╗ÜI m├á ban ─æß║ºu ng╞░ß╗¥i ch╞íi kh├┤ng ─æß╗⌐ng b├¬n trong:
			-- ─É├óy l├á Skill kh├íc chß║»n ngang ─æ╞░ß╗¥ng tho├ít! Vector dß╗½ng ngay tß║íi m├⌐p cß╗ºa Skill n├áy.
			if not initialHazards[hitHazard] then
				local blockEntry = bisectHazardEntry(origin, dir, prevD, d, hitHazard, pad)
				local blockDist = math.max(1.0, blockEntry)
				return nil, blockDist, "skill"
			end
		else
			-- ─Éiß╗âm base an to├án
			if sampleSafe(origin, dir, d, pad) then
				local exitDist = bisectExit(origin, dir, prevD, d, pad)
				if exitDist <= maxSearch then
					return exitDist, exitDist, "safe"
				end
				return nil, wallDist or maxSearch, "wall"
			end
		end

		prevD = d
		d += strideFor(d)
	end

	-- 4. Bß╗ï chß║╖n ß╗ƒ cuß╗æi ─æ╞░ß╗¥ng:
	if isArenaCapped and maxSearch < maxRadius and (not wallDist or maxSearch <= wallDist) then
		return nil, maxSearch, "boss1_arena"
	end
	if wallDist and wallDist < maxRadius then
		return nil, wallDist, "wall"
	end

	-- Kiß╗âm tra nß║┐u ─æiß╗âm cuß╗æi cß╗ºa tia bß╗ï chß║╖n trong v├╣ng cß║Ñm trung t├óm Boss 1:
	local endP = Vector3.new(origin.X + dir.X * maxSearch, origin.Y, origin.Z + dir.Z * maxSearch)
	if bossArea.IsPointInBoss1Center and bossArea.IsPointInBoss1Center(endP) then
		return nil, maxSearch, "boss1_center"
	end

	return nil, maxRadius, "hazard_max"
end

local function fireCallbacks(hasSpot: boolean, pos: Vector3?, hazardName: string?, dist: number, chosen: number?)
	for _, cb in ipairs(safeSpotCallbacks) do
		pcall(cb, hasSpot, pos, hazardName, dist, chosen)
	end
end

--// ------------------------------------------------------------------ //
-- Adaptive Direction Search
--// ------------------------------------------------------------------ //

local function directionAngle(dir: Vector3): number
	return math.atan2(dir.Z, dir.X)
end

local function rotateDir(dir: Vector3, ang: number): Vector3
	return Vector3.new(
		dir.X * math.cos(ang) - dir.Z * math.sin(ang),
		0,
		dir.X * math.sin(ang) + dir.Z * math.cos(ang)
	)
end

-- Seed rays: phß╗º ─æß╗üu 360┬░ nh╞░ng WARP vß╗ü ph├¡a biasDir (nß║┐u c├│).
-- f(ang) = ang - WARP*sin(ang - bias) l├á ├ính xß║í ─æ╞ín ─æiß╗çu giß╗» nguy├¬n phß╗º k├¡n
-- nh╞░ng n├⌐n mß║¡t ─æß╗Ö tia vß╗ü xung quanh bias.
local function buildSeedDirs(count: number, biasDir: Vector3?): { Vector3 }
	local dirs = {}
	local biasAng = biasDir and directionAngle(biasDir) or nil
	for i = 0, count - 1 do
		local ang = (i / count) * math.pi * 2
		if biasAng and BIAS_WARP > 0 then
			ang = ang - BIAS_WARP * math.sin(ang - biasAng)
		end
		dirs[i + 1] = Vector3.new(math.cos(ang), 0, math.sin(ang))
	end
	return dirs
end

-- Refine rays: quanh mß╗ùi h╞░ß╗¢ng tß╗æt `base`, rß║úi `extra` tia trong cung ┬▒SUB_ARC.
-- Tr├ính tß║ío tia tr├╣ng ch├¡nh x├íc vß╗¢i tia ─æ├ú c├│ (DUP_EPS).
local function buildRefineDirs(base: { Vector3 }, top: { Vector3 }, per: number, rem: number): { Vector3 }
	local out = {}
	local function tooClose(a: Vector3, b: Vector3): boolean
		local da = directionAngle(a)
		local db = directionAngle(b)
		local d = math.abs(da - db)
		if d > math.pi then d = math.pi * 2 - d end
		return d < DUP_EPS
	end
	for k, bd in ipairs(top) do
		local extra = per + ((k <= rem) and 1 or 0)
		if extra > 0 then
			local offsets: { number } = {}
			if extra == 1 then
				offsets[1] = -SUB_ARC * 0.6
			else
				for j = 1, extra do
					offsets[j] = (j / (extra + 1) - 0.5) * 2 * SUB_ARC
				end
			end
			for _, off in ipairs(offsets) do
				local nd = rotateDir(bd, off)
				local attempts = 0
				while attempts < 3 do
					local dup = false
					for _, ex in ipairs(base) do
						if tooClose(ex, nd) then dup = true break end
					end
					for _, ex in ipairs(out) do
						if tooClose(ex, nd) then dup = true break end
					end
					if dup then
						off = off + DUP_EPS * 1.2
						nd = rotateDir(bd, off)
						attempts += 1
					else
						break
					end
				end
				table.insert(out, nd)
			end
		end
	end
	return out
end

local function refineDirsPer(subCount: number, topCount: number): (number, number)
	if topCount <= 0 then return 0, 0 end
	local per = math.floor(subCount / topCount)
	local rem = subCount - per * topCount
	return per, rem
end

-- Chß╗ìn K h╞░ß╗¢ng seed c├│ lß╗æi tho├ít tß╗æt nhß║Ñt (gß║ºn nhß║Ñt, tie-break theo h╞░ß╗¢ng)
local function topCandidateDirs(cands: { any }, k: number): { Vector3 }
	local sorted = {}
	for _, c in ipairs(cands) do
		table.insert(sorted, c)
	end
	table.sort(sorted, function(a, b)
		if math.abs(a.found - b.found) > TIE_BAND then
			return a.found < b.found
		end
		return a.tie > b.tie
	end)
	local out = {}
	for i = 1, math.min(k, #sorted) do
		table.insert(out, sorted[i].dir)
	end
	return out
end

--// ------------------------------------------------------------------ //
-- Visuals
--// ------------------------------------------------------------------ //

local function ensureVisualFolder(): Folder
	if visualFolder and visualFolder.Parent then return visualFolder end
	visualFolder = Instance.new("Folder")
	visualFolder.Name = "SmartDodgeV2_Visuals"
	visualFolder.Parent = Workspace
	return visualFolder
end

local function createRayItem(index: number): RayVisualItem
	local folder = ensureVisualFolder()

	local beam = Instance.new("Part")
	beam.Name = "SDV2_RayBeam_" .. tostring(index)
	beam.Material = Enum.Material.Neon
	beam.Color = COLOR_BLOCKED
	beam.Shape = Enum.PartType.Block
	beam.Size = Vector3.new(0.05, 0.05, maxRadius)
	beam.Transparency = 1
	beam.Anchored = true
	beam.CanCollide = false
	beam.CanQuery = false
	beam.CanTouch = false
	beam.CastShadow = false
	beam.Massless = true
	beam.Parent = folder

	local tip = Instance.new("Part")
	tip.Name = "SDV2_RayTip_" .. tostring(index)
	tip.Material = Enum.Material.Neon
	tip.Color = COLOR_BLOCKED
	tip.Shape = Enum.PartType.Ball
	tip.Size = Vector3.new(0.4, 0.4, 0.4)
	tip.Transparency = 1
	tip.Anchored = true
	tip.CanCollide = false
	tip.CanQuery = false
	tip.CanTouch = false
	tip.CastShadow = false
	tip.Massless = true
	tip.Parent = folder

	local label = Instance.new("BillboardGui")
	label.Name = "SDV2_RayBadge_" .. tostring(index)
	label.AlwaysOnTop = true
	label.Size = UDim2.fromOffset(26, 16)
	label.StudsOffset = Vector3.new(0, 0.75, 0)
	label.Adornee = tip
	label.Enabled = false
	label.Parent = folder

	local frame = Instance.new("Frame")
	frame.Name = "Badge"
	frame.Size = UDim2.fromScale(1, 1)
	frame.BackgroundColor3 = Color3.fromRGB(12, 18, 24)
	frame.BackgroundTransparency = 0.25
	frame.BorderSizePixel = 0
	frame.Parent = label

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 4)
	corner.Parent = frame

	local stroke = Instance.new("UIStroke")
	stroke.Name = "Stroke"
	stroke.Color = COLOR_BLOCKED
	stroke.Thickness = 1.0
	stroke.Transparency = 0.3
	stroke.Parent = frame

	local txt = Instance.new("TextLabel")
	txt.Name = "Num"
	txt.Size = UDim2.fromScale(1, 1)
	txt.BackgroundTransparency = 1
	txt.Font = Enum.Font.GothamBold
	txt.TextSize = 10
	txt.Text = tostring(index)
	txt.TextColor3 = Color3.fromRGB(255, 255, 255)
	txt.Parent = frame

	return { beam = beam, tip = tip, label = label }
end

local function placeRay(
	item: RayVisualItem,
	from: Vector3,
	dir: Vector3,
	length: number,
	color: Color3,
	beamWidth: number,
	beamHeight: number,
	beamTrans: number,
	tipSize: number,
	tipTrans: number,
	visible: boolean
)
	if not visible then
		item.beam.Transparency = 1
		item.tip.Transparency = 1
		if item.label then item.label.Enabled = false end
		return
	end

	local actualLength = math.max(0.1, length)
	local to = from + dir * actualLength

	item.beam.Color = color
	item.beam.Transparency = beamTrans
	item.beam.Size = Vector3.new(beamWidth, beamHeight, actualLength)
	item.beam.CFrame = CFrame.lookAt((from + to) * 0.5, to)

	item.tip.Color = color
	item.tip.Transparency = tipTrans
	item.tip.Size = Vector3.new(tipSize, tipSize, tipSize)
	item.tip.CFrame = CFrame.new(to)

	if item.label then
		if showVectors and showVectorNumbers then
			item.label.Enabled = true
			local frame = item.label:FindFirstChild("Badge")
			if frame then
				local stroke = frame:FindFirstChild("Stroke")
				if stroke and stroke:IsA("UIStroke") then stroke.Color = color end
				local num = frame:FindFirstChild("Num")
				if num and num:IsA("TextLabel") then num.TextColor3 = color end
			end
		else
			item.label.Enabled = false
		end
	end
end

local function ensureOriginParts()
	local folder = ensureVisualFolder()
	if originPad then
		pcall(function() originPad:Destroy() end)
		originPad = nil
	end
	if not originDot or not originDot.Parent then
		originDot = Instance.new("Part")
		originDot.Name = "SDV2_OriginDot"
		originDot.Material = Enum.Material.Neon
		originDot.Color = Color3.fromRGB(220, 250, 255)
		originDot.Shape = Enum.PartType.Ball
		originDot.Size = Vector3.new(0.65, 0.65, 0.65)
		originDot.Transparency = 0.05
		originDot.Anchored = true
		originDot.CanCollide = false
		originDot.CanQuery = false
		originDot.CanTouch = false
		originDot.CastShadow = false
		originDot.Massless = true
		originDot.Parent = folder
	end
end

local function ensureMarkerParts()
	local folder = ensureVisualFolder()
	local oldBall = folder:FindFirstChild("SDV2_MarkerBall")
	if oldBall then
		pcall(function() oldBall:Destroy() end)
	end
	if not markerHalo or not markerHalo.Parent then
		markerHalo = Instance.new("Part")
		markerHalo.Name = "SDV2_MarkerHalo"
		markerHalo.Material = Enum.Material.Neon
		markerHalo.Color = COLOR_MARKER
		markerHalo.Shape = Enum.PartType.Cylinder
		markerHalo.Size = Vector3.new(0.06, 3.8, 3.8)
		markerHalo.Transparency = 0.4
		markerHalo.Anchored = true
		markerHalo.CanCollide = false
		markerHalo.CanQuery = false
		markerHalo.CanTouch = false
		markerHalo.CastShadow = false
		markerHalo.Massless = true
		markerHalo.Parent = folder
	end
	if not markerBeacon or not markerBeacon.Parent then
		markerBeacon = Instance.new("Part")
		markerBeacon.Name = "SDV2_MarkerBeacon"
		markerBeacon.Material = Enum.Material.Neon
		markerBeacon.Color = COLOR_MARKER
		markerBeacon.Shape = Enum.PartType.Block
		markerBeacon.Size = Vector3.new(0.45, 18.0, 0.45)
		markerBeacon.Transparency = 0.55
		markerBeacon.Anchored = true
		markerBeacon.CanCollide = false
		markerBeacon.CanQuery = false
		markerBeacon.CanTouch = false
		markerBeacon.CastShadow = false
		markerBeacon.Massless = true
		markerBeacon.Parent = folder
	end
	if not markerLabel or not markerLabel.Parent then
		markerLabel = Instance.new("BillboardGui")
		markerLabel.Name = "SDV2_MarkerLabel"
		markerLabel.AlwaysOnTop = true
		markerLabel.Size = UDim2.fromOffset(190, 42)
		markerLabel.StudsOffsetWorldSpace = Vector3.new(0, 2.6, 0)
		markerLabel.Adornee = markerHalo
		markerLabel.Parent = markerHalo

		local frame = Instance.new("Frame")
		frame.Name = "Container"
		frame.Size = UDim2.fromScale(1, 1)
		frame.BackgroundColor3 = Color3.fromRGB(15, 22, 28)
		frame.BackgroundTransparency = 0.25
		frame.BorderSizePixel = 0
		frame.Parent = markerLabel

		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 8)
		corner.Parent = frame

		local stroke = Instance.new("UIStroke")
		stroke.Color = COLOR_MARKER
		stroke.Thickness = 1.5
		stroke.Transparency = 0.25
		stroke.Parent = frame

		local text = Instance.new("TextLabel")
		text.Name = "Text"
		text.Size = UDim2.new(1, -12, 1, -8)
		text.Position = UDim2.fromOffset(6, 4)
		text.BackgroundTransparency = 1
		text.Font = Enum.Font.GothamBold
		text.Text = "SAFE"
		text.TextColor3 = COLOR_MARKER
		text.TextStrokeTransparency = 0.6
		text.TextScaled = true
		text.RichText = true
		text.Parent = frame
	end
end

local function hideMarkerVisual()
	if markerHalo then markerHalo.Transparency = 1 end
	if markerBeacon then markerBeacon.Transparency = 1 end
	if markerLabel then markerLabel.Enabled = false end
end

local function showMarkerVisual()
	if not showMarker or not safeSpotPos then
		hideMarkerVisual()
		return
	end
	ensureMarkerParts()
	if not markerHalo or not markerBeacon or not markerLabel then return end

	local playerRadius = danger.GetHitboxPadding()
	local diameter = math.max(0.4, playerRadius * 2)

	-- ─Éß╗Ö cao s├án cß╗æ ─æß╗ïnh 100% theo ph╞░╞íng ph├íp cß╗ºa ─æ─⌐a Player Hitbox Padding:
	-- Gß╗æc l├á scanFloorY = playerPos.Y - danger.GetHitboxDownwardOffset()
	local downwardOffset = danger.GetHitboxDownwardOffset()
	local spotFloorY = (scanFloorY ~= nil) and scanFloorY or (safeSpotPos.Y - downwardOffset)

	-- Bß╗ò trß╗ú qu├⌐t ─æß╗ïa h├¼nh cß╗Ñc bß╗Ö: CHß╗ê qu├⌐t phß║ím vi hß║╣p (+2.5 ─æß║┐n -5.0 studs)
	-- v├á Bß║«T BUß╗ÿC chß╗ë nhß║¡n Part c├│ CanCollide == true hoß║╖c Terrain
	-- (Tuyß╗çt ─æß╗æi kh├┤ng thß╗â va v├áo trß║ºn nh├á, qu├íi vß║¡t, ─æ├¿n ch├╣m hay part v├┤ h├¼nh)
	updateWallFilter()
	local localRayOrigin = Vector3.new(safeSpotPos.X, spotFloorY + 2.5, safeSpotPos.Z)
	local floorHit = Workspace:Raycast(localRayOrigin, Vector3.new(0, -5.0, 0), wallRayParams)
	if floorHit and floorHit.Instance and (floorHit.Instance:IsA("Terrain") or floorHit.Instance.CanCollide) then
		spotFloorY = floorHit.Position.Y
	end

	-- 1. markerHalo (─É─⌐a tr├▓n Safe Spot): d├ín s├ít mß║╖t s├án ─æß╗ông bß╗Ö y hß╗çt ─æ─⌐a Player Hitbox Padding
	markerHalo.Size = Vector3.new(0.06, diameter, diameter)
	markerHalo.Transparency = 0.35
	markerHalo.CFrame = CFrame.new(safeSpotPos.X, spotFloorY + 0.03, safeSpotPos.Z) * CFrame.Angles(0, 0, math.rad(90))

	-- 2. markerBeacon (Cß╗Öt s├íng): cß║»m tß╗½ mß║╖t s├án v├║t l├¬n trß╗¥i
	markerBeacon.Transparency = 0.55
	markerBeacon.CFrame = CFrame.new(safeSpotPos.X, spotFloorY + 9.0, safeSpotPos.Z)

	local container = markerLabel:FindFirstChild("Container")
	local text = container and container:FindFirstChild("Text")
	if text and text:IsA("TextLabel") then
		local hazardInfo = currentHazardName and (" | " .. currentHazardName) or ""
		text.Text = string.format("<b>≡ƒÄ» SAFE</b> <font color='rgb(255,255,255)'>(%.1fm)</font><font color='rgb(255,200,80)'>%s</font>", safeSpotDist, hazardInfo)
	end
	markerLabel.Enabled = true
end

local function hideAllVisuals()
	for _, item in pairs(rayItems) do
		if item.beam then item.beam.Transparency = 1 end
		if item.tip then item.tip.Transparency = 1 end
		if item.label then item.label.Enabled = false end
	end
	if originDot then originDot.Transparency = 1 end
	hideMarkerVisual()
end

local function updateVisuals()
	if cleaned then return end

	local totalRays = #rayDirs
	if not rayResults or not scanOrigin or totalRays == 0 then
		hideAllVisuals()
		return
	end

	local from = Vector3.new(scanOrigin.X, (scanFloorY or 0) + RAY_HEIGHT_OFFSET, scanOrigin.Z)

	if showVectors then
		local chosenLen = safeSpotDist > 0 and safeSpotDist or maxRadius
		for i = 1, totalRays do
			local item = rayItems[i]
			if not item then
				item = createRayItem(i)
				rayItems[i] = item
			end
			local entry = rayResults[i]
			if entry then
				local isChosen = (i - 1) == chosenRayIndex
				local isSeed = i <= seedLen
				local color = isChosen and COLOR_CHOSEN
					or (entry.status == "found" and COLOR_FOUND)
					or COLOR_BLOCKED

				local length = isChosen and chosenLen or entry.length
				local bWidth, bHeight, bTrans, tSize, tTrans

				if isChosen then
					bWidth = 0.28
					bHeight = 0.08
					bTrans = 0.0
					tSize = 1.25
					tTrans = 0.0
				elseif entry.status == "found" then
					bWidth = isSeed and 0.12 or 0.07
					bHeight = isSeed and 0.06 or 0.05
					bTrans = isSeed and 0.08 or 0.18
					tSize = isSeed and 0.65 or 0.50
					tTrans = isSeed and 0.10 or 0.20
				else
					bWidth = 0.04
					bHeight = 0.04
					bTrans = 0.65
					tSize = (entry.blockedReason == "wall" or entry.blockedReason == "skill" or entry.blockedReason == "boss1_arena" or entry.blockedReason == "boss1_center") and 0.40 or 0.25
					tTrans = 0.50
				end

				placeRay(item, from, entry.dir, length, color, bWidth, bHeight, bTrans, tSize, tTrans, true)
			else
				placeRay(item, from, Vector3.zero, 0, COLOR_BLOCKED, 0, 0, 1, 0, 1, false)
			end
		end

		for i = totalRays + 1, RAY_POOL_MAX do
			local item = rayItems[i]
			if item then
				item.beam.Transparency = 1
				item.tip.Transparency = 1
			end
		end

		ensureOriginParts()
		if originDot then
			originDot.Transparency = 0.05
			originDot.CFrame = CFrame.new(from)
		end
	else
		for _, item in pairs(rayItems) do
			if item.beam then item.beam.Transparency = 1 end
			if item.tip then item.tip.Transparency = 1 end
		end
		if originDot then originDot.Transparency = 1 end
	end

	if safeSpotPos then
		showMarkerVisual()
	else
		hideMarkerVisual()
	end
end

--// ------------------------------------------------------------------ //
-- Clear radar (hß║┐t danger / tß║»t engine)
--// ------------------------------------------------------------------ //

local function clearRadar()
	isInDanger = false
	currentHazardName = nil
	safeSpotPos = nil
	safeSpotDist = 0
	chosenRayIndex = nil
	scanOrigin = nil
	scanFloorY = nil
	rayResults = nil
	rayDirs = {}
	rayDirsBuilt = false
	table.clear(slotDist)
	seedLen = 0
	lastLateralActive = false
	hideAllVisuals()
	fireCallbacks(false, nil, nil, 0, nil)
end

local function markDangerContextChanged()
	-- Hazard ─æß╗òi / rayCount ─æß╗òi -> pool tia c┼⌐ kh├┤ng c├▓n hß╗úp l├╜
	rayDirsBuilt = false
	table.clear(slotDist)
end

--// ------------------------------------------------------------------ //
-- Scan: Adaptive Direction + Distance Search + Binary Refinement
--// ------------------------------------------------------------------ //

local function scanRays(
	fromIdx: number,
	toIdx: number,
	origin: Vector3,
	pad: number,
	awayVector: Vector3?,
	moveDir: Vector3?,
	results: { any },
	state: any,
	initialHazards: { [types.ActiveHazard]: boolean },
	lateralFwd: Vector3?
)
	for i = fromIdx, toIdx do
		local dir = rayDirs[i]
		local foundDist, blockedDist, blockedReason = resolveExitDistance(origin, dir, slotDist[i], pad, initialHazards)

		-- NGOß║áI Lß╗å CHO SKILL BAY THß║▓NG (CrissCross, MovingBeam): Cß║Ñm tiß╗çt mß╗ìi vector chß║íy dß╗ìc theo h╞░ß╗¢ng ─æß║ín/beam bay
		if lateralFwd then
			local dotFwd = dir:Dot(lateralFwd)
			if dotFwd > 0.25 then
				-- ─Éang chß║íy thß║│ng ph├¡a tr╞░ß╗¢c m┼⌐i ─æß║ín/beam -> Bß╗è CHß║╢N (ng─ân triß╗çt ─æß╗â hiß╗çn t╞░ß╗úng bß╗ï l├╣a/─æß║⌐y)
				foundDist = nil
				blockedDist = math.min(blockedDist or maxRadius, 15)
				blockedReason = "lateral_hazard_forward"
			elseif dotFwd < -0.75 then
				-- ─Éang chß║íy ng╞░ß╗úc ─æß║ºu ─æ├óm thß║│ng v├áo ─æß║ín/beam -> Bß╗è CHß║╢N
				foundDist = nil
				blockedDist = math.min(blockedDist or maxRadius, 10)
				blockedReason = "lateral_hazard_headon"
			end
		end

		if foundDist then
			slotDist[i] = foundDist
		else
			slotDist[i] = nil
		end

		local entry = {
			i = i - 1,
			dir = dir,
			found = foundDist,
			length = foundDist or blockedDist or maxRadius,
			status = foundDist and "found" or "blocked",
			blockedReason = blockedReason,
		}
		results[i] = entry

		if foundDist then
			local tieScore = 0
			if awayVector then
				local mult = if lateralFwd then 10.0 else AWAY_BONUS
				tieScore += math.max(0, dir:Dot(awayVector)) * mult
			end
			if moveDir then
				tieScore += math.max(0, dir:Dot(moveDir)) * FORWARD_BONUS
			end

			-- LUß║¼T BOSS 1: TH╞»ß╗₧NG ─ÉIß╗éM H╞»ß╗ÜNG RA M├ëP NGO├ÇI, PHß║áT Nß║╢NG H╞»ß╗ÜNG V├ÇO TRUNG T├éM
			if bossArea.IsBoss1AvoidCenter and bossArea.IsBoss1AvoidCenter() and shared.IsBossActive() then
				local curBossIdx = shared.GetCurrentBossIndex()
				if curBossIdx == 1 or (bossArea.GetLockedBossIndex and bossArea.GetLockedBossIndex() == 1) then
					local anchor = bossArea.GetAnchorCenter()
					if anchor then
						local toCenter = Vector3.new(anchor.X - origin.X, 0, anchor.Z - origin.Z)
						local distToCenter = toCenter.Magnitude
						if distToCenter > 0.5 then
							local dirToCenter = toCenter.Unit
							local dirAwayFromCenter = -dirToCenter
							local dotAway = dir:Dot(dirAwayFromCenter)
							local dotTo = dir:Dot(dirToCenter)

							if dotAway > 0 then
								tieScore += dotAway * 4.0
							end
							if dotTo > 0.2 then
								tieScore -= dotTo * 8.0
							end
						end
					end
				end
			end

			if i <= seedLen then
				table.insert(state.candidates, { dir = dir, found = foundDist, tie = tieScore })
			end

			if not state.best
				or entry.found < state.best.entry.found - 0.001
				or (math.abs(entry.found - state.best.entry.found) <= TIE_BAND and tieScore > state.best.tieScore)
			then
				state.best = { entry = entry, tieScore = tieScore }
			end
		end
	end
end

local function scanSafeSpot(): boolean
	if cleaned then return false end
	if not enabled or not detection.IsEnabled() or not danger.IsEnabled() then
		return false
	end
	if danger.IsRespawnProtected and danger.IsRespawnProtected() then
		clearRadar()
		return false
	end

	local playerPos, humanoid, footY = getPlayerState()
	if not playerPos then
		clearRadar()
		return false
	end

	scanOrigin = playerPos
	scanFloorY = footY

	local hazard = danger.GetCurrentDangerHazard()
	currentHazardName = hazard and (hazard.cleanName or hazard.name or hazard.instance and hazard.instance.Name) or nil

	-- Dynamic Clearance: Tß╗▒ ─æß╗Öng cß╗Öng b├ín k├¡nh Hitbox nh├ón vß║¡t (R) + khoß║úng ─æß╗çm mong muß╗æn (Escape Margin)
	-- Gi├║p m├⌐p ngo├ái v├▓ng tr├▓n Hitbox vß╗½a kh├¡t chß║ím m├⌐p vß║ích v├áng khi escapeMargin = 0
	local playerRadius = danger.GetHitboxPadding()
	local pad = playerRadius + math.max(0, escapeMargin)

	local results = {}
	local state = { best = nil, candidates = {} }
	local initialHazards = getHazardsAt(playerPos, pad)

	-- NGOß║áI Lß╗å CHO SKILL ─Éß║áN/BEAM BAY THß║▓NG (Criss Cross, Moving Beam):
	local lateralHazard: types.ActiveHazard? = nil
	if hazard and (hazard.isCrissCross or hazard.isMovingBeam) then
		lateralHazard = hazard
	elseif initialHazards then
		for h in pairs(initialHazards) do
			if h and (h.isCrissCross or h.isMovingBeam) then
				lateralHazard = h
				break
			end
		end
	end

	local isLateral = lateralHazard ~= nil
	if isLateral ~= lastLateralActive then
		lastLateralActive = isLateral
		markDangerContextChanged()
	end

	-- H╞░ß╗¢ng ─æang chß║íy (d├╣ng cho bias + tie-break)
	local moveDir = humanoid and humanoid.MoveDirection or Vector3.zero
	local moveDirNorm: Vector3? = nil
	if moveDir.Magnitude > 0.3 then
		moveDirNorm = Vector3.new(moveDir.X, 0, moveDir.Z).Unit
	end

	-- Vector "ra xa nguß╗ôn nguy hiß╗âm" (d├╣ng cho bias + tie-break)
	local awayVector: Vector3? = nil
	local lateralFwd: Vector3? = nil

	if isLateral and lateralHazard and lateralHazard.forward2D then
		local fwd = lateralHazard.forward2D
		local fwd2D = Vector3.new(fwd.X, 0, fwd.Z)
		if fwd2D.Magnitude > 0.05 then
			lateralFwd = fwd2D.Unit
			local leftNorm = Vector3.new(-lateralFwd.Z, 0, lateralFwd.X)
			local rightNorm = Vector3.new(lateralFwd.Z, 0, -lateralFwd.X)

			-- Chß╗ìn h╞░ß╗¢ng tß║ít s╞░ß╗¥n ╞░u ti├¬n (Lateral Strafe): thuß║¡n h╞░ß╗¢ng Player ─æang di chuyß╗ân hoß║╖c tho├íng t╞░ß╗¥ng
			if moveDirNorm and moveDirNorm:Dot(leftNorm) > moveDirNorm:Dot(rightNorm) + 0.1 then
				awayVector = leftNorm
			elseif moveDirNorm and moveDirNorm:Dot(rightNorm) > moveDirNorm:Dot(leftNorm) + 0.1 then
				awayVector = rightNorm
			else
				local leftWall = getWallDistance(playerPos, leftNorm, 12) or 12
				local rightWall = getWallDistance(playerPos, rightNorm, 12) or 12
				awayVector = if leftWall >= rightWall then leftNorm else rightNorm
			end
		end
	end

	if not awayVector then
		local hazardPos = hazard and (hazard.beamOrigin or hazard.position)
		if hazardPos then
			local dx = playerPos.X - hazardPos.X
			local dz = playerPos.Z - hazardPos.Z
			local m = math.sqrt(dx * dx + dz * dz)
			if m > 0.5 then
				awayVector = Vector3.new(dx / m, 0, dz / m)
			end
		end
	end

	-- ╞»u ti├¬n h╞░ß╗¢ng ra m├⌐p ngo├ái s├án ─æß║Ñu nß║┐u ─æang ─æ├ính Boss 1 v├á bß║¡t tr├ính t├óm
	if not isLateral and bossArea.IsBoss1AvoidCenter and bossArea.IsBoss1AvoidCenter() and shared.IsBossActive() then
		local curBossIdx = shared.GetCurrentBossIndex()
		if curBossIdx == 1 or (bossArea.GetLockedBossIndex and bossArea.GetLockedBossIndex() == 1) then
			local anchor = bossArea.GetAnchorCenter()
			if anchor then
				local dx = playerPos.X - anchor.X
				local dz = playerPos.Z - anchor.Z
				local m = math.sqrt(dx * dx + dz * dz)
				if m > 0.5 then
					awayVector = Vector3.new(dx / m, 0, dz / m)
				end
			end
		end
	end

	--// DIRECTION SEARCH (Adaptive hoß║╖c Uniform 360┬░)
	if not rayDirsBuilt then
		if not adaptive then
			-- Chß║┐ ─æß╗Ö th╞░ß╗¥ng: ph├ón bß╗æ 360┬░ ─æß╗üu t─âm tß║»p ─æ├║ng chuß║⌐n 100% rayCount vector
			seedLen = rayCount
			rayDirs = buildSeedDirs(rayCount, nil)
			scanRays(1, #rayDirs, playerPos, pad, awayVector, moveDirNorm, results, state, initialHazards, lateralFwd)
		else
			-- Chß║┐ ─æß╗Ö Adaptive (Seed + Refine):
			local biasDir: Vector3? = if isLateral and awayVector then awayVector else (moveDirNorm or awayVector)

			seedLen = math.clamp(math.floor(rayCount * SEED_FRAC), 4, rayCount)
			local subCount = rayCount - seedLen
			rayDirs = buildSeedDirs(seedLen, biasDir)

			-- Phase 1: scan seed
			scanRays(1, #rayDirs, playerPos, pad, awayVector, moveDirNorm, results, state, initialHazards, lateralFwd)

			-- Phase 2: subdivide quanh c├íc h╞░ß╗¢ng seed tß╗æt nhß║Ñt
			if subCount > 0 then
				local extra = {}
				if #state.candidates > 0 then
					local top = topCandidateDirs(state.candidates, math.min(REFINE_K_MAX, #state.candidates))
					local per, rem = refineDirsPer(subCount, #top)
					if per > 0 or rem > 0 then
						extra = buildRefineDirs(rayDirs, top, per, rem)
					end
				end

				-- Nß║┐u thiß║┐u tia do kh├┤ng c├│ candidate hoß║╖c lß╗ìc tr├╣ng: tß╗▒ ─æß╗Öng b├╣ ─æß╗üu ─æß╗â lu├┤n ─æß╗º 100% rayCount
				local needed = subCount - #extra
				if needed > 0 then
					local fallbackDirs = buildSeedDirs(needed, rotateDir(biasDir or Vector3.new(1, 0, 0), math.pi / needed))
					for _, fd in ipairs(fallbackDirs) do
						table.insert(extra, fd)
					end
				end

				if #extra > 0 then
					local startIdx = #rayDirs + 1
					for _, nd in ipairs(extra) do
						table.insert(rayDirs, nd)
					end
					scanRays(startIdx, #rayDirs, playerPos, pad, awayVector, moveDirNorm, results, state, initialHazards, lateralFwd)
				end
			end
		end
		rayDirsBuilt = true
	else
		-- Pool giß╗» nguy├¬n -> scan to├án bß╗Ö vß╗¢i WARM START
		scanRays(1, #rayDirs, playerPos, pad, awayVector, moveDirNorm, results, state, initialHazards, lateralFwd)
	end

	chosenRayIndex = nil
	safeSpotPos = nil
	safeSpotDist = 0
	rayResults = results

	if state.best then
		local entry = state.best.entry
		local rawPos = Vector3.new(
			playerPos.X + entry.dir.X * entry.found,
			playerPos.Y,
			playerPos.Z + entry.dir.Z * entry.found
		)
		safeSpotPos = rawPos
		safeSpotDist = entry.found
		chosenRayIndex = entry.i
		entry.status = "chosen"
		fireCallbacks(true, safeSpotPos, currentHazardName, safeSpotDist, chosenRayIndex)
	else
		fireCallbacks(false, nil, currentHazardName, 0, nil)
	end

	lastScanTime = os.clock()
	updateVisuals()


	return true
end

--// ------------------------------------------------------------------ //
-- Validate latch (gß╗ìi ─æß╗ïnh kß╗│ trong Heartbeat)
--// ------------------------------------------------------------------ //

local function validateLock()
	if not isInDanger then return end

	local now = os.clock()
	if now - lastValidateTime < VALIDATE_INTERVAL then return end
	lastValidateTime = now
	if now - lastScanTime < RESCAN_THROTTLE then return end

	-- Safe Spot ─æ├ú chß╗æt kh├┤ng c├▓n an to├án -> qu├⌐t lß║íi
	if safeSpotPos then
		local pad = danger.GetHitboxPadding() + math.max(0, escapeMargin)
		if not isPointSafe(safeSpotPos, pad) then
			scanSafeSpot()
			return
		end
	end
	-- KH├öNG tß╗▒ qu├⌐t lß║íi theo di chuyß╗ân: visual ─æß╗Öc lß║¡p, ─æß╗⌐ng y├¬n tß║íi vß╗ï tr├¡
	-- ─æ├ú qu├⌐t, tß╗ôn tß║íi ─æ├║ng cho ─æß║┐n khi mß╗Öt lß║ºn t├¡nh to├ín mß╗¢i xß║úy ra
	-- (danger ─æß╗òi / hazard ─æß╗òi / ─æß╗òi c├ái ─æß║╖t / spot hß║┐t an to├án).
end

--// ------------------------------------------------------------------ //
-- Public API
--// ------------------------------------------------------------------ //

function safeSpot.SetEnabled(state: boolean)
	enabled = (state == true)
	if not enabled then
		clearRadar()
	end
end

function safeSpot.IsEnabled(): boolean
	return enabled
end

function safeSpot.SetAdaptive(state: boolean)
	adaptive = (state ~= false)
	markDangerContextChanged()
	if isInDanger then
		scanSafeSpot()
	end
end

function safeSpot.IsAdaptive(): boolean
	return adaptive
end

function safeSpot.SetRayCount(n: number)
	n = math.clamp(math.round(n or 24), 8, RAY_POOL_MAX)
	if n == rayCount then return end
	rayCount = n
	markDangerContextChanged()
	if isInDanger then
		scanSafeSpot()
	end
end

function safeSpot.GetRayCount(): number
	return rayCount
end

function safeSpot.SetMaxRadius(n: number)
	n = math.clamp(n or 30, 5, 120)
	if n == maxRadius then return end
	maxRadius = n
	if isInDanger then
		scanSafeSpot()
	end
end

function safeSpot.GetMaxRadius(): number
	return maxRadius
end

function safeSpot.SetEscapeMargin(n: number)
	n = math.clamp(n or 0.5, 0, 8)
	escapeMargin = n
	if isInDanger then
		scanSafeSpot()
	end
end

function safeSpot.GetEscapeMargin(): number
	return escapeMargin
end

function safeSpot.SetShowVectors(state: boolean)
	showVectors = (state == true)
	updateVisuals()
end

function safeSpot.IsShowVectors(): boolean
	return showVectors
end

function safeSpot.SetShowMarker(state: boolean)
	showMarker = (state == true)
	updateVisuals()
end

function safeSpot.IsShowMarker(): boolean
	return showMarker
end

function safeSpot.SetShowVectorNumbers(state: boolean)
	showVectorNumbers = (state == true)
	updateVisuals()
end

function safeSpot.IsShowVectorNumbers(): boolean
	return showVectorNumbers
end

function safeSpot.IsInDanger(): boolean
	return isInDanger
end

function safeSpot.GetCurrentHazardName(): string?
	return currentHazardName
end

function safeSpot.GetSafeSpot(): (Vector3?, number)
	return safeSpotPos, safeSpotDist
end

function safeSpot.GetChosenRayIndex(): number?
	return chosenRayIndex
end

function safeSpot.GetLastScanStats(): (number, number, number?, number?)
	if not rayResults then return 0, rayCount, nil, 0 end
	local found = 0
	local refineFound = 0
	for i, entry in ipairs(rayResults) do
		if entry.found then
			found += 1
			if i > seedLen then refineFound += 1 end
		end
	end
	return found, #rayResults, chosenRayIndex, refineFound
end

function safeSpot.OnSafeSpotChanged(cb: (boolean, Vector3?, string?, number, number?) -> ())
	if type(cb) == "function" then
		table.insert(safeSpotCallbacks, cb)
	end
end

safeSpot.ClearRadar = clearRadar

--// ------------------------------------------------------------------ //
-- Wiring: sß╗▒ kiß╗çn danger/detection + heartbeart + cleanup
--// ------------------------------------------------------------------ //

danger.OnDangerStateChanged(function(inDanger, hazard)
	if cleaned or not enabled then return end
	isInDanger = inDanger
	if inDanger then
		lastScanTime = 0
		markDangerContextChanged()
		scanSafeSpot()
	else
		-- Khi tho├ít khß╗Åi nguy hiß╗âm, KH├öNG gß╗ìi clearRadar()!
		-- Visual vector v├á Safe Spot ─æ╞░ß╗úc giß╗» nguy├¬n vß╗ï tr├¡ trong thß║┐ giß╗¢i 3D.
		-- Visual chß╗ë biß║┐n mß║Ñt/cß║¡p nhß║¡t lß║íi khi c├│ mß╗Öt lß║ºn t├¡nh to├ín n├⌐ ─æ├▓n Mß╗ÜI.
	end
end)

detection.OnHazardsChanged(function()
	if cleaned or not enabled or not isInDanger then return end
	if os.clock() - lastScanTime >= RESCAN_THROTTLE then
		-- Hazard list ─æß╗òi -> t├¡nh Lß║áI (giß╗» pool + warm start, kh├┤ng rebuild
		-- pattern ─æß╗â tr├ính tia nhß║úy loß║ín), rß╗ôi vß║╜ lß║íi tß║íi v├¡ tr├¡ qu├⌐t.
		scanSafeSpot()
	end
end)

local heartbeatConn = RunService.Heartbeat:Connect(function()
	if cleaned or not lifecycle.IsActive() then return end
	if not enabled then
		if rayResults or safeSpotPos then
			clearRadar()
		end
		return
	end
	if not detection.IsEnabled() or not danger.IsEnabled() then
		if rayResults or safeSpotPos then
			clearRadar()
		end
		return
	end

	validateLock()
end)

lifecycle.Register(function()
	cleaned = true
	if heartbeatConn then
		heartbeatConn:Disconnect()
		heartbeatConn = nil
	end
	table.clear(safeSpotCallbacks)
	if visualFolder and visualFolder.Parent then
		pcall(function() visualFolder:Destroy() end)
		visualFolder = nil
	end
	rayItems = {}
	originPad = nil
	originDot = nil
	markerHalo = nil
	markerBeacon = nil
	markerLabel = nil
end)

return safeSpot
