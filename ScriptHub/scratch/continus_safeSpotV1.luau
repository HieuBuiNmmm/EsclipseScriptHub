-- Smart Dodge ΓÇô Module 3+4: Safe Spot Calculation & Player Visuals (DungeonQuest).
-- Chuy├¬n tr├ích: T├¡nh to├ín ─æiß╗âm tho├ít nß║ín (CalculateSafeSpot + latching lock + 3 chiß║┐n l╞░ß╗úc tho├ít)
-- v├á visual quanh ng╞░ß╗¥i: Safe Marker xanh, Hitbox Padding cyan.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local geometry = require("@routes/DungeonQuest/core/smartDodge/geometry")
local detection = require("@routes/DungeonQuest/core/smartDodge/detection")
local targetFacing = require("@routes/DungeonQuest/core/smartDodge/targetFacing")

--// References
local Workspace = game:GetService("Workspace")
local player = services.player

--// State
local showSafeMarker = false
local showPlayerRadar = false
local lockedSafeSpot = nil
local lockedHazardCount = 0
local safeSpotMarkerPart = nil
local hitboxVisualPart = nil
local showHitboxVisual = false
local ESCAPE_MARGIN = 2.6           -- Khoß║úng c├ích ─æß╗çm an to├án sau khi ra khß╗Åi m├⌐p (studs) - ─æß║úm bß║úo v╞░ß╗út qua playerHitboxPadding 1.8m
local BOSS1_DEFAULT_RADIUS = 50.0   -- B├ín k├¡nh mß║╖c ─æß╗ïnh s├án ─æß║Ñu Boss 1 nß║┐u kh├┤ng t├¼m thß║Ñy FirstPart
local boss1ArenaRadius = BOSS1_DEFAULT_RADIUS
local boss1ArenaCenter = nil
local boss1ArenaVisualPart = nil
local lockedArenaFloorY = nil
local RADIAL_DISTANCES = { 2.5, 4.5, 7.0, 10.5, 15.0, 20.0, 26.0, 33.0, 42.0, 52.0 }
local ANGLE_OFFSETS_12 = { 0, 30, -30, 60, -60, 90, -90, 120, -120, 150, -150, 180 }

--// Trß║íng th├íi visual gß║ºn nhß║Ñt (─æß╗â replay khi bß║¡t/tß║»t toggle tß╗½ UI ΓÇö engine cß║¡p nhß║¡t mß╗ùi nhß╗ïp)
local lastMarkerPos, lastMarkerInDanger, lastMarkerEscapeDist = nil, false, 0
local lastHitboxPlayerPos = nil
local lastRadarPlayerPos, lastRadarInDanger = nil, false
local playerRadarPool = {}
local radarLatchedOrigin = nil
local isDodgeRadarActive = false
local currentRadarDodgeKey = nil
local lastDangerPart = nil
local lastCurrentHazardsSet = nil

local safeSpot = {}

--// Public: accessor show/marker/hitbox

function safeSpot.IsShowSafeMarkerEnabled()
	return showSafeMarker
end

function safeSpot.SetShowSafeMarker(state)
	showSafeMarker = state and true or false
	safeSpot.UpdateMarker(lastMarkerPos, lastMarkerInDanger, lastMarkerEscapeDist)
end

function safeSpot.IsShowPlayerRadarEnabled()
	return showPlayerRadar
end

function safeSpot.SetShowPlayerRadar(state)
	showPlayerRadar = state and true or false
	if not showPlayerRadar then
		safeSpot.ClearPlayerRadar()
	else
		safeSpot.UpdatePlayerRadar(lastRadarPlayerPos, lastRadarInDanger)
	end
end


function safeSpot.IsShowHitboxVisualEnabled()
	return showHitboxVisual
end

function safeSpot.SetShowHitboxVisual(state)
	showHitboxVisual = state and true or false
	safeSpot.UpdateHitbox(lastHitboxPlayerPos)
end

--// Set Hitbox Padding: cß║¡p nhß║¡t sß╗æ hß╗ìc (module geometry) + resize visual nß║┐u ─æang hiß╗ân thß╗ï
function safeSpot.SetHitboxPadding(value)
	geometry.SetHitboxPadding(value)
	if hitboxVisualPart and hitboxVisualPart.Parent then
		local diameter = math.max(0.4, geometry.GetHitboxPadding() * 2)
		hitboxVisualPart.Size = Vector3.new(0.15, diameter, diameter)
	end
end

function safeSpot.GetBoss1ArenaCenter()
	return boss1ArenaCenter
end

function safeSpot.GetBoss1ArenaRadius()
	return boss1ArenaRadius or BOSS1_DEFAULT_RADIUS
end

local targetScope = "All"

function safeSpot.SetTargetScope(scope)
	if scope == "Boss" or scope == "Mobs" or scope == "All" then
		targetScope = scope
	end
end

function safeSpot.GetTargetScope()
	return targetScope
end

--// Quß║ún l├╜ Highlight cß╗Öt pha l├¬ Boss 2 (secondBossCrystals)
local targetCrystalHighlight = nil
local lastHighlightedCrystal = nil

local function clearCrystalHighlight()
	if targetCrystalHighlight then
		pcall(function() targetCrystalHighlight:Destroy() end)
		targetCrystalHighlight = nil
	end
	lastHighlightedCrystal = nil
end

local function updateCrystalHighlight(crystalPart, colorName)
	if not crystalPart or not crystalPart.Parent then
		clearCrystalHighlight()
		return
	end
	if lastHighlightedCrystal == crystalPart and targetCrystalHighlight and targetCrystalHighlight.Parent then
		return
	end

	clearCrystalHighlight()
	lastHighlightedCrystal = crystalPart

	pcall(function()
		local box = Instance.new("SelectionBox")
		box.Name = "SmartDodge_CrystalGuideBox"
		local c = (colorName == "green" and Color3.fromRGB(50, 255, 50))
			or (colorName == "yellow" and Color3.fromRGB(255, 230, 0))
			or Color3.fromRGB(255, 45, 45)
		box.Color3 = c
		box.SurfaceColor3 = c
		box.SurfaceTransparency = 0.5
		box.LineThickness = 0.08
		box.Adornee = crystalPart
		box.Parent = crystalPart
		targetCrystalHighlight = box
	end)
end

local cachedSecondBossCrystals = nil

local function getBossCrystal(colorName)
	local crystalsModel = cachedSecondBossCrystals
	if not crystalsModel or not crystalsModel.Parent then
		crystalsModel = Workspace:FindFirstChild("secondBossCrystals")
		if not crystalsModel then
			local dungeon = Workspace:FindFirstChild("dungeon")
			if dungeon then
				crystalsModel = dungeon:FindFirstChild("secondBossCrystals", true)
			end
		end
		if not crystalsModel then
			crystalsModel = Workspace:FindFirstChild("secondBossCrystals", true)
		end
		if crystalsModel then
			cachedSecondBossCrystals = crystalsModel
		end
	end
	if not crystalsModel then return nil, {} end

	local targetCrystal = nil
	local wrongCrystals = {}
	local targetColorLower = colorName and colorName:lower() or ""

	for _, child in ipairs(crystalsModel:GetChildren()) do
		local cNameLower = child.Name:lower()
		local p = child:IsA("BasePart") and child or child:FindFirstChildWhichIsA("BasePart")
		if p then
			if #targetColorLower > 0 and (cNameLower == targetColorLower or cNameLower:find(targetColorLower)) then
				targetCrystal = p
			else
				table.insert(wrongCrystals, p)
			end
		end
	end

	return targetCrystal, wrongCrystals
end

local cachedFirstBossPart = nil
local lastFirstPartSearchTime = 0

--// T├¼m kiß║┐m Part giß╗¢i hß║ín s├án ─æß║Ñu Boss 1 cß╗ºa game (workspace.FirstPart)
--// Tß╗æi ╞░u h├│a: Throttled 5.0s ─æß╗â tr├ính qu├⌐t ─æß╗ç quy Workspace li├¬n tß╗Ñc 20 lß║ºn/gi├óy g├óy lag
local function getFirstBossArenaPart()
	if cachedFirstBossPart and cachedFirstBossPart.Parent then
		return cachedFirstBossPart
	end

	local now = os.clock()
	if now - lastFirstPartSearchTime < 5.0 then
		return nil
	end
	lastFirstPartSearchTime = now

	-- 1. T├¼m trß╗▒c tiß║┐p tß║íi root Workspace (0.001ms)
	local p = Workspace:FindFirstChild("FirstPart")
	-- 2. Qu├⌐t trong folder dungeon nß║┐u c├│
	if not p then
		local dungeon = Workspace:FindFirstChild("dungeon")
		if dungeon then
			p = dungeon:FindFirstChild("FirstPart", true)
		end
	end
	-- 3. Fallback qu├⌐t to├án bß╗Ö Workspace 1 lß║ºn duy nhß║Ñt (─æ╞░ß╗úc throttle 5s)
	if not p then
		p = Workspace:FindFirstChild("FirstPart", true)
	end

	if p and p:IsA("BasePart") then
		cachedFirstBossPart = p
		return p
	end
	return nil
end

--// Quß║ún l├╜ Visual v├á giß╗¢i hß║ín S├án ─Éß║Ñu Boss 1 (Boss 1 Arena Visual & Boundary)
local function clearBoss1ArenaVisual()
	if boss1ArenaVisualPart then
		pcall(function() boss1ArenaVisualPart:Destroy() end)
		boss1ArenaVisualPart = nil
	end
	cachedFirstBossPart = nil
	lockedArenaFloorY = nil
end

-- Kh├│a cß╗æ ─æß╗ïnh cao ─æß╗Ö trß╗Ñc Y cß╗ºa s├án ─æß║Ñu ngay tß╗½ nhß╗ïp ─æß║ºu ti├¬n
local function getOrLockFloorY(centerPos, playerPos, firstPart)
	if lockedArenaFloorY then
		return lockedArenaFloorY
	end

	local floorY = nil
	if playerPos then
		local rawFloorY, hasFloor = geometry.GetRawFloorY(playerPos)
		if hasFloor and rawFloorY then
			floorY = rawFloorY + 0.1
		end
	end

	if not floorY and firstPart then
		-- Kh├│a theo ─æiß╗âm tiß║┐p gi├íp s├án cß╗ºa FirstPart
		floorY = firstPart.Position.Y - (firstPart.Size.Y / 2) + 0.1
	end

	if not floorY and centerPos then
		local rawFloorY, hasFloor = geometry.GetRawFloorY(centerPos)
		if hasFloor and rawFloorY then
			floorY = rawFloorY + 0.1
		end
	end

	if floorY then
		lockedArenaFloorY = floorY
	end

	return lockedArenaFloorY or (playerPos and (playerPos.Y - 2.8)) or (centerPos and (centerPos.Y - 2.8)) or 0
end

local function updateBoss1ArenaVisual(centerPos, playerPos, firstPart)
	clearBoss1ArenaVisual()
	return
end

local function isInsideBoss1Arena(pos, playerPos)
	if not boss1ArenaCenter then return true end
	local cand2D = Vector3.new(pos.X, 0, pos.Z)
	local center2D = Vector3.new(boss1ArenaCenter.X, 0, boss1ArenaCenter.Z)
	local candDist = (cand2D - center2D).Magnitude

	local maxRadius = boss1ArenaRadius or BOSS1_DEFAULT_RADIUS
	local playerDist = maxRadius
	if playerPos then
		local p2D = Vector3.new(playerPos.X, 0, playerPos.Z)
		playerDist = (p2D - center2D).Magnitude
	end

	local maxAllowed = math.max(maxRadius, playerDist - 0.5)
	return candDist <= maxAllowed
end

local function getBoss1ArenaScoreAdjustment(pos, playerPos)
	if not boss1ArenaCenter or not playerPos then return 0 end
	local center2D = Vector3.new(boss1ArenaCenter.X, 0, boss1ArenaCenter.Z)
	local pDist = (Vector3.new(playerPos.X, 0, playerPos.Z) - center2D).Magnitude
	local cDist = (Vector3.new(pos.X, 0, pos.Z) - center2D).Magnitude

	local maxRadius = boss1ArenaRadius or BOSS1_DEFAULT_RADIUS
	local pullThreshold = maxRadius * 0.70

	-- Nß║┐u player ─æang bß╗ï dß║ít s├ít m├⌐p ngo├ái s├án ─æß║Ñu:
	if pDist > pullThreshold then
		if cDist < pDist - 0.5 then
			return -2.0 -- Th╞░ß╗ƒng nhß║╣ h╞░ß╗¢ng vß╗ü t├óm s├án khi t╞░╞íng ─æß╗ông khoß║úng c├ích
		elseif cDist > pDist + 0.5 then
			return 3.0  -- Phß║ít nhß║╣ dß║ít tiß║┐p ra ngo├ái m├⌐p
		end
	end
	return 0
end

-- Tß╗▒ ─æß╗Öng dß╗ìn visual v├á mß╗ƒ kh├│a Arena Center khi Boss 1 bß╗ï hß║í gß╗Ñc hoß║╖c chuyß╗ân m├án
shared.OnBossActiveChanged(function(active)
	if not active then
		boss1ArenaCenter = nil
		boss1ArenaRadius = BOSS1_DEFAULT_RADIUS
		cachedFirstBossPart = nil
		cachedSecondBossCrystals = nil
		clearBoss1ArenaVisual()
	end
end)

shared.OnBossIndexChanged(function(index)
	cachedFirstBossPart = nil
	cachedSecondBossCrystals = nil
	if index ~= 1 then
		boss1ArenaCenter = nil
		boss1ArenaRadius = BOSS1_DEFAULT_RADIUS
		clearBoss1ArenaVisual()
	end
end)

--// Dß╗ìn visual marker/hitbox/radar: unparent (giß╗» object ─æß╗â t├íi sß╗¡ dß╗Ñng) ΓÇö engine stop loop gß╗ìi
function safeSpot.HideVisuals()
	if safeSpotMarkerPart and safeSpotMarkerPart.Parent then
		safeSpotMarkerPart.Parent = nil
	end
	if hitboxVisualPart and hitboxVisualPart.Parent then
		hitboxVisualPart.Parent = nil
	end
	safeSpot.ClearPlayerRadar()
	clearBoss1ArenaVisual()
	clearCrystalHighlight()
	lastMarkerPos = nil
	lastMarkerInDanger = false
	lastMarkerEscapeDist = 0
	lastHitboxPlayerPos = nil
end

--// Hß╗ºy ho├án to├án visual khi shutdown (lifecycle)
function safeSpot.DestroyVisuals()
	if safeSpotMarkerPart then
		pcall(function() safeSpotMarkerPart:Destroy() end)
		safeSpotMarkerPart = nil
	end
	if hitboxVisualPart then
		pcall(function() hitboxVisualPart:Destroy() end)
		hitboxVisualPart = nil
	end
	safeSpot.ClearPlayerRadar()
	for _, item in ipairs(playerRadarPool) do
		if item.shaft then pcall(function() item.shaft:Destroy() end) end
		if item.head then pcall(function() item.head:Destroy() end) end
	end
	table.clear(playerRadarPool)
	clearBoss1ArenaVisual()
	clearCrystalHighlight()
end

--// Reset lock an to├án (engine gß╗ìi khi dß╗½ng loop ΓÇö t╞░╞íng ─æ╞░╞íng lockedSafeSpot = nil)
function safeSpot.ResetLock()
	lockedSafeSpot = nil
	lockedHazardCount = 0
	clearCrystalHighlight()
end

--// Tß║ío / Lß║Ñy Part hiß╗ân thß╗ï Hitbox Padding cß╗ºa Player quanh ng╞░ß╗¥i
local function getOrCreateHitboxVisual()
	if hitboxVisualPart and hitboxVisualPart.Parent then
		return hitboxVisualPart
	end

	local part = Instance.new("Part")
	part.Name = "SmartDodge_HitboxVisual"
	part.Shape = Enum.PartType.Cylinder
	local diameter = math.max(0.4, geometry.GetHitboxPadding() * 2)
	part.Size = Vector3.new(0.15, diameter, diameter)
	part.Color = Color3.fromRGB(0, 220, 255)
	part.Material = Enum.Material.Neon
	part.Transparency = 0.75
	part.Anchored = true
	part.CanCollide = false
	part.CanQuery = false
	part.CanTouch = false

	local selectionBox = Instance.new("SelectionBox")
	selectionBox.Name = "HitboxBorder"
	selectionBox.Color3 = Color3.fromRGB(120, 240, 255)
	selectionBox.SurfaceColor3 = Color3.fromRGB(0, 220, 255)
	selectionBox.SurfaceTransparency = 0.8
	selectionBox.LineThickness = 0.04
	selectionBox.Adornee = part
	selectionBox.Parent = part

	hitboxVisualPart = part
	return part
end

--// Cß║¡p nhß║¡t vß╗ï tr├¡ v├á k├¡ch th╞░ß╗¢c v├▓ng tr├▓n Hitbox cß╗ºa Player
function safeSpot.UpdateHitbox(playerPos)
	lastHitboxPlayerPos = playerPos
	if not showHitboxVisual or not detection.IsEnabled() or not playerPos then
		if hitboxVisualPart then
			hitboxVisualPart.Parent = nil
		end
		return
	end

	local part = getOrCreateHitboxVisual()
	local diameter = math.max(0.4, geometry.GetHitboxPadding() * 2)
	part.Size = Vector3.new(0.15, diameter, diameter)

	local floorPos, hasFloor = geometry.GetFloorPosition(playerPos)
	local yPos = hasFloor and (floorPos.Y - 2.8) or (playerPos.Y - 2.8)
	local visualPos = Vector3.new(playerPos.X, yPos, playerPos.Z)

	part.CFrame = CFrame.new(visualPos) * CFrame.Angles(0, 0, math.rad(90))
	part.Parent = Workspace.Terrain
end

--// Cß║ñU H├îNH V├ÇNH ─ÉAI VECTOR ─ÉA Tß║ªNG (TWO-TIER ADAPTIVE SPIDERWEB RADAR)
--// Tß║ºng 1 (Inner Belt): 2.5m -> 15.0m (Chuy├¬n Micro-Dodge s├ít m├⌐p, giß╗» cß╗▒ ly tß║Ñn c├┤ng tß╗æi ─æa)
--// Tß║ºng 2 (Outer Belt): 20.0m -> 52.0m (Chuy├¬n Macro-Dodge khi Boss tung ─æß║íi chi├¬u diß╗çn rß╗Öng)
local PLAYER_RADAR_RAY_COUNT = 24
local PLAYER_RADAR_INNER_OFFSET = 0.8
local INNER_BELT_MAX_DIST = 15.0
local MARCH_STEPS = { 2.5, 4.5, 7.0, 10.5, 15.0, 20.0, 26.0, 33.0, 42.0, 52.0 }
local MAX_MARCH_DIST = 52.0

local COLOR_PLAYER_RADAR_SAFE = Color3.fromRGB(0, 255, 120)     -- Xanh l├í neon khi tho├ít ra v├╣ng an to├án gß║ºn (Tier 1)
local COLOR_PLAYER_RADAR_OUTER = Color3.fromRGB(0, 220, 255)    -- Xanh ngß╗ìc Cyan neon khi v╞░╞ín ra v├ánh ─æai xa (Tier 2)
local COLOR_PLAYER_RADAR_DANGER = Color3.fromRGB(255, 200, 50)  -- V├áng neon khi xuy├¬n qua v├╣ng chi├¬u thß╗⌐c nguy hiß╗âm

local function getOrCreatePlayerRadarArrow(index)
	local item = playerRadarPool[index]
	if item then
		return item
	end

	local shaft = Instance.new("Part")
	shaft.Name = "SmartDodge_PlayerShaft_" .. index
	shaft.Material = Enum.Material.Neon
	shaft.Anchored = true
	shaft.CanCollide = false
	shaft.CanQuery = false
	shaft.CanTouch = false
	shaft.CastShadow = false
	shaft.Transparency = 0.15

	local head = Instance.new("Part")
	head.Name = "SmartDodge_PlayerHead_" .. index
	head.Material = Enum.Material.Neon
	head.Anchored = true
	head.CanCollide = false
	head.CanQuery = false
	head.CanTouch = false
	head.CastShadow = false
	head.Transparency = 0.15
	head.Size = Vector3.new(0.32, 0.04, 0.32)

	item = { shaft = shaft, head = head }
	playerRadarPool[index] = item
	return item
end

function safeSpot.ClearPlayerRadar()
	for _, item in ipairs(playerRadarPool) do
		if item.shaft and item.shaft.Parent then
			item.shaft.Parent = nil
		end
		if item.head and item.head.Parent then
			item.head.Parent = nil
		end
	end
	radarLatchedOrigin = nil
	isDodgeRadarActive = false
	currentRadarDodgeKey = nil
end

--// Cß║¡p nhß║¡t Mß║íng Nhß╗çn D├▓ Bi├¬n An To├án (Adaptive Contour Spiderweb):
--// Bß║»n 24 tia vector tß╗½ ─æiß╗âm bß║»t ─æß║ºu n├⌐ chi├¬u. Giß╗» nguy├¬n tr├¬n s├án trong suß╗æt lß║ºn n├⌐ v├á sau khi n├⌐ xong!
--// Chß╗ë x├│a v├á cß║¡p nhß║¡t mß╗¢i khi bß║»t ─æß║ºu mß╗Öt lß║ºn dodge mß╗¢i!
--// Triß╗çt ti├¬u c├íc tia ─æ├óm s├óu v├áo l├▓ng skill (kh├┤ng cho bß║»n xuy├¬n qua skill).
function safeSpot.UpdatePlayerRadar(playerPos, inDanger)
	lastRadarPlayerPos, lastRadarInDanger = playerPos, inDanger or false

	if not showPlayerRadar or not detection.IsEnabled() or not playerPos then
		safeSpot.ClearPlayerRadar()
		return
	end

	-- Nß║┐u ─æang an to├án (kh├┤ng d├¡nh chi├¬u):
	if not inDanger then
		-- ─É├ính dß║Ñu phi├¬n n├⌐ chi├¬u ─æ├ú kß║┐t th├║c ─æß╗â sß║╡n s├áng cho lß║ºn dodge mß╗¢i tiß║┐p theo
		isDodgeRadarActive = false
		currentRadarDodgeKey = nil
		-- GIß╗« NGUY├èN c├íc tia vector cß╗ºa lß║ºn dodge tr╞░ß╗¢c ─æ├│ tr├¬n s├án! Kh├┤ng x├│a!
		return
	end

	-- KHI ─ÉANG D├ìNH CHI├èU (inDanger == true):
	-- Kiß╗âm tra xem c├│ phß║úi l├á lß║ºn dodge Mß╗ÜI kh├┤ng (vß╗½a d├¡nh chi├¬u hoß║╖c ─æß╗òi chi├¬u mß╗¢i):
	local isNewDodge = not isDodgeRadarActive or (lastDangerPart and lastDangerPart ~= currentRadarDodgeKey)

	if not isNewDodge then
		-- ─Éß╗út dodge hiß╗çn tß║íi ─æang diß╗àn ra -> Cß╗É ─Éß╗èNH 100% c├íc tia tß║íi vß╗ï tr├¡ gß╗æc ─æ├ú l╞░u, kh├┤ng rung giß║¡t, kh├┤ng dß╗¥i vß╗ï tr├¡!
		return
	end

	-- Bß║«T ─Éß║ªU ─Éß╗óT DODGE Mß╗ÜI:
	isDodgeRadarActive = true
	currentRadarDodgeKey = lastDangerPart
	radarLatchedOrigin = playerPos

	-- Thu hß╗ôi c├íc tia cß╗ºa lß║ºn dodge tr╞░ß╗¢c ─æ├│
	for _, item in ipairs(playerRadarPool) do
		if item.shaft and item.shaft.Parent then item.shaft.Parent = nil end
		if item.head and item.head.Parent then item.head.Parent = nil end
	end

	local floorY = radarLatchedOrigin.Y - 2.8
	local arrowY = floorY + 0.12 -- Nß║▒m s├ít mß║╖t s├án
	local stepDeg = 360 / PLAYER_RADAR_RAY_COUNT

	for i = 1, PLAYER_RADAR_RAY_COUNT do
		local angleDeg = (i - 1) * stepDeg
		local rad = math.rad(angleDeg)
		local dirX = math.cos(rad)
		local dirZ = math.sin(rad)
		local dir = Vector3.new(dirX, 0, dirZ)

		-- D├▓ tß╗½ng nß║Ñc khoß║úng c├ích dß╗ìc theo tia ─æß╗â t├¼m ─æiß╗âm ─æß║ºu ti├¬n b╞░ß╗¢c ra khß╗Åi chi├¬u thß╗⌐c (0 Raycast, cß╗▒c nhß║╣)
		local foundSafeDist = nil
		for _, dist in ipairs(MARCH_STEPS) do
			local testWorld = Vector3.new(radarLatchedOrigin.X + dirX * dist, radarLatchedOrigin.Y, radarLatchedOrigin.Z + dirZ * dist)
			if not geometry.IsPointInAnyHazard(testWorld) then
				if not (boss1ArenaCenter and not isInsideBoss1Arena(testWorld, radarLatchedOrigin)) then
					foundSafeDist = dist
					break
				end
			end
		end

		local arrow = getOrCreatePlayerRadarArrow(i)

		-- NGUY├èN Tß║«C: TUYß╗åT ─Éß╗ÉI KH├öNG Bß║«N TIA XUY├èN QUA SKILL!
		-- Nß║┐u h╞░ß╗¢ng n├áy kh├┤ng t├¼m thß║Ñy lß╗æi tho├ít an to├án (─æ├óm s├óu v├áo l├▓ng chi├¬u thß╗⌐c hoß║╖c bß╗ï chß║╖n):
		-- -> ß║¿n tia n├áy ─æi, kh├┤ng vß║╜ ─æ├óm bß╗½a v├áo trong l├▓ng skill!
		if not foundSafeDist then
			if arrow.shaft.Parent then arrow.shaft.Parent = nil end
			if arrow.head.Parent then arrow.head.Parent = nil end
			continue
		end

		local rayDist = foundSafeDist
		local isOuterBelt = (foundSafeDist > INNER_BELT_MAX_DIST)
		local shaftLen = math.max(0.4, rayDist - PLAYER_RADAR_INNER_OFFSET)
		local shaftCenterDist = PLAYER_RADAR_INNER_OFFSET + (shaftLen / 2)
		local headCenterDist = PLAYER_RADAR_INNER_OFFSET + shaftLen + 0.16

		-- M├áu sß║»c & K├¡ch th╞░ß╗¢c ph├ón biß╗çt 2 v├ánh ─æai:
		-- Tier 1 (Inner Belt <= 15m): ─Éß║ºu Xanh L├í Neon (0, 255, 120), k├¡ch th╞░ß╗¢c ti├¬u chuß║⌐n
		-- Tier 2 (Outer Belt > 15m): ─Éß║ºu Xanh Ngß╗ìc Cyan Neon (0, 220, 255), k├¡ch th╞░ß╗¢c nß╗òi bß║¡t
		local headColor = isOuterBelt and COLOR_PLAYER_RADAR_OUTER or COLOR_PLAYER_RADAR_SAFE
		local shaftColor = (foundSafeDist <= 3.5) and COLOR_PLAYER_RADAR_SAFE or COLOR_PLAYER_RADAR_DANGER
		local headSize = isOuterBelt and Vector3.new(0.42, 0.05, 0.42) or Vector3.new(0.32, 0.04, 0.32)

		-- Cß║¡p nhß║¡t Th├ón tia (Shaft)
		arrow.shaft.Size = Vector3.new(isOuterBelt and 0.15 or 0.12, 0.04, shaftLen)
		local shaftCenter = Vector3.new(radarLatchedOrigin.X + dirX * shaftCenterDist, arrowY, radarLatchedOrigin.Z + dirZ * shaftCenterDist)
		arrow.shaft.CFrame = CFrame.lookAt(shaftCenter, shaftCenter + dir)
		arrow.shaft.Color = shaftColor
		arrow.shaft.Parent = Workspace.Terrain

		-- Cß║¡p nhß║¡t ─Éß║ºu m┼⌐i t├¬n (Diamond Head) chß╗æt chß║╖n ß╗ƒ ranh giß╗¢i an to├án
		arrow.head.Size = headSize
		local headCenter = Vector3.new(radarLatchedOrigin.X + dirX * headCenterDist, arrowY, radarLatchedOrigin.Z + dirZ * headCenterDist)
		arrow.head.CFrame = CFrame.lookAt(headCenter, headCenter + dir) * CFrame.Angles(0, math.rad(45), 0)
		arrow.head.Color = headColor
		arrow.head.Parent = Workspace.Terrain
	end
end

--// Tß║ío / Lß║Ñy Visual Marker ph├ít s├íng m├áu Xanh L├í (H├¼nh Cß║ºu Nhß╗Å S├ít ─Éß║Ñt)
local function getOrCreateSafeMarker()
	if safeSpotMarkerPart and safeSpotMarkerPart.Parent then
		return safeSpotMarkerPart
	end

	local part = Instance.new("Part")
	part.Name = "SmartDodge_SafeMarker"
	part.Shape = Enum.PartType.Ball
	part.Size = Vector3.new(1.5, 1.5, 1.5)
	part.Color = Color3.fromRGB(0, 255, 120)
	part.Material = Enum.Material.Neon
	part.Transparency = 0.2
	part.Anchored = true
	part.CanCollide = false
	part.CanQuery = false
	part.CanTouch = false

	local bb = Instance.new("BillboardGui")
	bb.Name = "MarkerGui"
	bb.Size = UDim2.fromOffset(130, 24)
	bb.StudsOffset = Vector3.new(0, 1.5, 0)
	bb.AlwaysOnTop = true
	bb.Adornee = part
	bb.Parent = part

	local label = Instance.new("TextLabel")
	label.Name = "Label"
	label.Size = UDim2.fromScale(1, 1)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.fromRGB(80, 255, 160)
	label.TextStrokeTransparency = 0
	label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	label.Font = Enum.Font.GothamBold
	label.TextSize = 12
	label.Text = "≡ƒƒó SAFE SPOT"
	label.Parent = bb

	safeSpotMarkerPart = part
	return part
end

local lastRenderedMarkerPos = nil
local lastRenderedEscapeDist = -1

--// Cß║¡p nhß║¡t vß╗ï tr├¡ hiß╗ân thß╗ï cß╗ºa Safe Marker (─æß║╖t ─æ├íy h├¼nh cß║ºu s├ít mß║╖t ─æß║Ñt nhß║Ñt c├│ thß╗â)
function safeSpot.UpdateMarker(pos, inDanger, escapeDist)
	lastMarkerPos, lastMarkerInDanger, lastMarkerEscapeDist = pos, inDanger or false, escapeDist or 0
	if not showSafeMarker or not inDanger or not pos then
		if safeSpotMarkerPart then
			safeSpotMarkerPart.Parent = nil
		end
		lastRenderedMarkerPos = nil
		lastRenderedEscapeDist = -1
		return
	end

	local marker = getOrCreateSafeMarker()
	-- pos.Y ─æ╞░ß╗úc t├¡nh l├á Floor_Y + 3. Quß║ú cß║ºu b├ín k├¡nh 0.75 n├¬n ─æß║╖t t├óm ß╗ƒ (Floor_Y + 0.8) = (pos.Y - 2.2) ─æß╗â s├ít ─æß║Ñt
	local floorBallY = pos.Y - 2.2
	local newPos = Vector3.new(pos.X, floorBallY, pos.Z)

	if not lastRenderedMarkerPos or (newPos - lastRenderedMarkerPos).Magnitude > 0.1 then
		lastRenderedMarkerPos = newPos
		marker.CFrame = CFrame.new(newPos)
	end
	if not marker.Parent then
		marker.Parent = Workspace.Terrain
	end

	local curDist = escapeDist or 0
	if math.abs(curDist - lastRenderedEscapeDist) >= 0.2 then
		lastRenderedEscapeDist = curDist
		local bb = marker:FindFirstChild("MarkerGui")
		local label = bb and bb:FindFirstChild("Label")
		if label then
			label.Text = ("≡ƒƒó SAFE SPOT (%.1fm)"):format(curDist)
		end
	end
end

local HYSTERESIS_THRESHOLD = 3.0     -- Ng╞░ß╗íng ch├¬nh lß╗çch cß╗▒ ly (studs) ─æß╗â chuyß╗ân kh├│a sang ─æiß╗âm an to├án mß╗¢i gß║ºn h╞ín

--// T├¡nh vector lß╗▒c ─æß║⌐y tß╗òng hß╗úp (Multi-Hazard Repulsion Force) tß╗½ t├óm chi├¬u thß╗⌐c ─æang ─æ├¿/gß║ºn Player ra ngo├ái
local function computeRepulsionVector(playerPos, dangerPart)
	-- ╞»u ti├¬n sß╗æ 1: Lß╗▒c ─æß║⌐y trß╗▒c tiß║┐p tß╗½ t├óm chi├¬u thß╗⌐c ─æang d├¡nh ra vß╗ï tr├¡ Player
	if dangerPart and dangerPart.Parent and dangerPart:IsA("BasePart") then
		local diffX = playerPos.X - dangerPart.Position.X
		local diffZ = playerPos.Z - dangerPart.Position.Z
		local distSq = diffX * diffX + diffZ * diffZ
		if distSq > 0.04 then
			local dist = math.sqrt(distSq)
			return Vector3.new(diffX / dist, 0, diffZ / dist)
		end
	end

	local netX, netZ = 0, 0
	local activeHazards = detection.GetActiveHazardsMap and detection.GetActiveHazardsMap()
	if activeHazards then
		local count = 0
		for _, info in pairs(activeHazards) do
			-- Lß║Ñy vß╗ï tr├¡ trung t├óm ─æß║íi diß╗çn cß╗ºa tß╗½ng Skill theo thß╗¥i gian thß╗▒c (╞░u ti├¬n ActiveParts / info.Position, KH├öNG d├╣ng PrimaryPart)
			local centerPos = nil
			if info.ActiveParts then
				for part in pairs(info.ActiveParts) do
					if part and part.Parent and part:IsA("BasePart") then
						centerPos = part.Position
						break
					end
				end
			end
			if not centerPos and info.Instance and info.Instance.Parent then
				if info.Instance:IsA("BasePart") then
					centerPos = info.Instance.Position
				end
			end
			centerPos = centerPos or info.Position

			if centerPos then
				local diffX = playerPos.X - centerPos.X
				local diffZ = playerPos.Z - centerPos.Z
				local distSq = diffX * diffX + diffZ * diffZ
				if distSq < 1600 and distSq > 0.01 then
					local dist = math.sqrt(distSq)
					local weight = 1 / math.max(1, dist)
					netX = netX + (diffX / dist) * weight
					netZ = netZ + (diffZ / dist) * weight
					count = count + 1
				end
			end
		end

		local netMagSq = netX * netX + netZ * netZ
		if count > 0 and netMagSq > 0.001 then
			local netMag = math.sqrt(netMagSq)
			return Vector3.new(netX / netMag, 0, netZ / netMag)
		end
	end

	-- Fallback cuß╗æi c├╣ng: Nß║┐u kh├┤ng x├íc ─æß╗ïnh ─æ╞░ß╗úc t├óm chi├¬u, mß╗¢i l├╣i ra xa mß╗Ñc ti├¬u
	if targetFacing then
		local tPos = targetFacing.GetTargetPosition()
		if tPos then
			local diffX = playerPos.X - tPos.X
			local diffZ = playerPos.Z - tPos.Z
			local distSq = diffX * diffX + diffZ * diffZ
			if distSq > 0.01 then
				local dist = math.sqrt(distSq)
				return Vector3.new(diffX / dist, 0, diffZ / dist)
			end
		end
	end

	return nil
end

--// Trß║ú vß╗ü danh s├ích 12 g├│c qu├⌐t ─æ╞░ß╗úc sß║»p xß║┐p ╞░u ti├¬n theo h╞░ß╗¢ng di chuyß╗ân cß╗ºa Player hoß║╖c lß╗▒c ─æß║⌐y tho├ít hiß╗âm
local function getSearchAngles(repVector, moveDir)
	local baseAngleDeg = 0
	if moveDir then
		baseAngleDeg = math.deg(math.atan2(moveDir.Z, moveDir.X))
	elseif repVector then
		baseAngleDeg = math.deg(math.atan2(repVector.Z, repVector.X))
	end

	local angles = table.create(12)
	for i, off in ipairs(ANGLE_OFFSETS_12) do
		angles[i] = (baseAngleDeg + off) % 360
	end
	return angles
end

--// ─É├ính gi├í v├╣ng ─æß╗çm an to├án xung quanh ─æiß╗âm candidate (4 h╞░ß╗¢ng ch├¡nh ß╗ƒ b├ín k├¡nh 2.5m, cß╗▒c nhß║╣)
local CLEARANCE_OFFSETS_4 = {
	Vector3.new(2.5, 0, 0),
	Vector3.new(-2.5, 0, 0),
	Vector3.new(0, 0, 2.5),
	Vector3.new(0, 0, -2.5),
}

local function getClearanceBonus(point)
	local safeCount = 0
	for _, off in ipairs(CLEARANCE_OFFSETS_4) do
		if not geometry.IsPointInAnyHazard(point + off) then
			safeCount = safeCount + 1
		end
	end
	return safeCount * 0.75
end

--// T├¡nh ─æiß╗âm ╞░u ti├¬n cho mß╗Öt ß╗⌐ng vi├¬n vß╗ï tr├¡ an to├án (Score c├áng THß║ñP c├áng ╞»U TI├èN):
--// Tß║¡n dß╗Ñng Hß╗ç quy chiß║┐u Face-to-Target: ╞»u ti├¬n L├ích Ngang (Strafe), Phß║ít L├╣i X├⌐o S├óu, Phß║ít Cß╗▒ Ly
local function scoreCandidate(playerPos, candPos, repVector, moveDir)
	-- Hard check cho Boss 1 Arena: Kh├┤ng chß╗ìn ─æiß╗âm ra ngo├ái phß║ím vi s├án ─æß║Ñu
	if boss1ArenaCenter and not isInsideBoss1Arena(candPos, playerPos) then
		return math.huge
	end

	-- Tr├ính n├⌐ thß║│ng v├áo Boss Orb (nß║┐u c├│ quß║ú cß║ºu Boss 2 ─æang hoß║ít ─æß╗Öng):
	local activeOrb = detection.GetActiveBossOrb and detection.GetActiveBossOrb()
	if activeOrb and activeOrb.Position then
		local dOrb = (Vector3.new(candPos.X - activeOrb.Position.X, 0, candPos.Z - activeOrb.Position.Z)).Magnitude
		if dOrb < 12.0 then
			return math.huge -- Tuyß╗çt ─æß╗æi kh├┤ng chß╗ìn ─æiß╗âm n├⌐ nß║▒m gß║ºn quß║ú cß║ºu!
		end
	end

	local moveDist = (candPos - playerPos).Magnitude
	local clearance = getClearanceBonus(candPos)
	-- Cß╗▒ ly l├á ti├¬u ch├¡ sß╗æng c├▓n: mß╗ùi stud chß║íy th├¬m l├ám t─âng nguy c╞í deal dame
	local score = (moveDist * 2.0) - (clearance * 0.35)
	if moveDist > 12.0 then
		-- Phß║ít l┼⌐y tiß║┐n nß║╖ng nß╗ü cho c├íc ─æiß╗âm c├ích xa (> 12 studs):
		-- Triß╗çt ti├¬u ho├án to├án lß╗ùi chß╗ìn ─æiß╗âm g├│c 30-40 studs khi chß╗ë cß║ºn b╞░ß╗¢c 2-3 studs l├á an to├án
		score = score + ((moveDist - 12.0) * 3.5)
	end

	-- Tß║¼N Dß╗ñNG Hß╗å QUY CHIß║╛U CHIß║╛N ─Éß║ñU FACE-TO-TARGET (Nh├¼n Boss)
	local targetPos = targetFacing and targetFacing.GetTargetPosition and targetFacing.GetTargetPosition()
	if targetPos and moveDist > 0.3 then
		local toTarget2D = Vector3.new(targetPos.X - playerPos.X, 0, targetPos.Z - playerPos.Z)
		if toTarget2D.Magnitude > 1.0 then
			local fwd = toTarget2D.Unit
			local right = Vector3.new(-fwd.Z, 0, fwd.X)
			local toCand2D = Vector3.new(candPos.X - playerPos.X, 0, candPos.Z - playerPos.Z)

			local depthOffset = toCand2D:Dot(fwd)                  -- > 0: Tiß║┐n | < 0: L├╣i
			local strafeRatio = math.abs(toCand2D.Unit:Dot(right)) -- 1.0: L├ích ngang s╞░ß╗¥n thuß║ºn t├║y

			-- 1. Th╞░ß╗ƒng lß╗¢n cho b╞░ß╗¢c L├üCH NGANG (Strafe giß╗» cß╗▒ ly vß╗¢i Boss - ─Éiß╗âm 1)
			if strafeRatio >= 0.82 and math.abs(depthOffset) <= 2.2 then
				score = score - 6.0
			end

			-- 2. Phß║ít ─æiß╗âm nß║┐u L├ÖI X├ëO RA SAU L╞»NG (nh╞░ ─Éiß╗âm 2: mß║Ñt tß║ºm ─æ├ính, chß║íy l├óu trong v├╣ng ─æß╗Å)
			if depthOffset < -2.0 then
				score = score + (math.abs(depthOffset) * 1.8)
			end

			-- 3. Phß║ít nß║┐u TIß║╛N THß║▓NG V├ÇO Mß║╢T BOSS khi ─æang n├⌐ chi├¬u
			if depthOffset > 2.5 then
				score = score + (depthOffset * 1.2)
			end
		end
	end

	if moveDist > 0.5 then
		local dir = (candPos - playerPos).Unit
		if moveDir then
			local dotMove = dir:Dot(moveDir)
			if dotMove > 0 then
				-- C├╣ng ph├¡a / thuß║¡n h╞░ß╗¢ng Player ─æang chß╗º ─æß╗Öng di chuyß╗ân: th╞░ß╗ƒng tß╗¢i 3.5 studs
				score = score - (dotMove * 3.5)
			else
				-- Ng╞░ß╗úc h╞░ß╗¢ng Player ─æang di chuyß╗ân: phß║ít nhß║╣ (+2.0 studs)
				score = score + (math.abs(dotMove) * 2.0)
			end
		elseif repVector and not targetPos then
			local dot = dir:Dot(repVector)
			score = score - (dot * 2.0)
		end
	end

	-- ╞»u ti├¬n k├⌐o vß╗ü t├óm s├án ─æß║Ñu Boss 1 nß║┐u ─æang dß║ít ra xa
	if boss1ArenaCenter then
		score = score + getBoss1ArenaScoreAdjustment(candPos, playerPos)
	end

	return score
end

--// Thuß║¡t to├ín Qu├⌐t Tß╗Åa Tr├▓n ─Éa H╞░ß╗¢ng (Fine-Grained Radial Sweep): t├¼m khoß║úng hß╗ƒ an to├án gß║ºn nhß║Ñt kß║┐t hß╗úp Path Check & Clearance
--// Tß╗ÉI ╞»U H├ôA ─Éß╗êNH CAO: Kh├┤ng bß║»n bß║Ñt kß╗│ tia Raycast n├áo trong v├▓ng lß║╖p qu├⌐t! Chß╗ë snap s├án 1 lß║ºn duy nhß║Ñt cho ─æiß╗âm chß╗æt cuß╗æi c├╣ng.
local function searchRadialSafeSpot(playerPos, repVector, currentHazardsSet, dangerPart, moveDir)
	local angles = getSearchAngles(repVector, moveDir)
	local bestPos = nil
	local bestScore = math.huge
	local fallbackPos = nil
	local fallbackScore = math.huge

	for _, dist in ipairs(RADIAL_DISTANCES) do
		local foundAtRadius = nil
		local bestScoreAtRadius = math.huge

		for _, angleDeg in ipairs(angles) do
			local rad = math.rad(angleDeg)
			local offset = Vector3.new(math.cos(rad) * dist, 0, math.sin(rad) * dist)
			local testWorld = playerPos + offset

			-- Tß╗ÉI ╞»U HIß╗åU SUß║ñT CPU: Kiß╗âm tra h├¼nh hß╗ìc thuß║ºn t├║y (0 Raycast)
			if geometry.IsSpotFullySafe(testWorld, 0.5) then
				local score = scoreCandidate(playerPos, testWorld, repVector, moveDir)

				-- Fallback l╞░u ─æiß╗âm an to├án tß║íi ─æ├¡ch (ph├▓ng khi kh├┤ng c├│ ─æ╞░ß╗¥ng ─æi thß║│ng an to├án)
				if score < fallbackScore then
					fallbackScore = score
					fallbackPos = testWorld
				end

				-- ╞»u ti├¬n sß╗æ 1: ─Éoß║ín ─æ╞░ß╗¥ng di chuyß╗ân tß╗½ playerPos -> testWorld an to├án (cho ph├⌐p b─âng qua c├íc chi├¬u ─æang ─æ├¿)
				if geometry.IsPathSafe(playerPos, testWorld, currentHazardsSet, dangerPart) then
					if score < bestScoreAtRadius then
						bestScoreAtRadius = score
						foundAtRadius = testWorld
					end
				end
			end
		end

		-- Ngay khi ß╗ƒ v├▓ng b├ín k├¡nh gß║ºn nhß║Ñt n├áy t├¼m ─æ╞░ß╗úc khe an to├án -> CHß╗îN NGAY Lß║¼P Tß╗¿C v├á dß╗½ng t├¼m kiß║┐m
		if foundAtRadius then
			bestPos = foundAtRadius
			bestScore = bestScoreAtRadius
			break
		end
	end

	local chosenPos = bestPos or fallbackPos
	local chosenScore = bestPos and bestScore or fallbackScore

	-- CHß╗ê Bß║«N DUY NHß║ñT 1 TIA RAYCAST cho ß╗⌐ng vi├¬n tß╗æt nhß║Ñt ─æ├ú chß╗ìn ─æß╗â snap ch├¡nh x├íc xuß╗æng mß║╖t ─æß║Ñt
	if chosenPos then
		local snapped, hasFloor = geometry.GetFloorPosition(chosenPos)
		local finalPos = hasFloor and snapped or chosenPos
		return finalPos, chosenScore
	end

	return nil, math.huge
end

--// Thuß║¡t to├ín cß╗æt l├╡i: T├¡nh to├ín vß╗ï tr├¡ an to├án (Safe Spot Calculation)
function safeSpot.CalculateSafeSpot(customPlayerPos)
	local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local humanoid = player and player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	local playerPos = customPlayerPos or (rootPart and rootPart.Position)
	if not playerPos then
		lockedSafeSpot = nil
		lockedHazardCount = 0
		clearCrystalHighlight()
		return false, nil, nil, 0
	end

	-- Quß║ún l├╜ Arena Center & Visual cho Boss 1:
	local isBoss1 = shared.IsBossActive() and shared.GetCurrentBossIndex() == 1
	if not isBoss1 then
		if boss1ArenaCenter then
			boss1ArenaCenter = nil
			boss1ArenaRadius = BOSS1_DEFAULT_RADIUS
			clearBoss1ArenaVisual()
		end
	elseif not boss1ArenaCenter or not (boss1ArenaVisualPart and boss1ArenaVisualPart.Parent) then
		local firstPart = getFirstBossArenaPart()
		if firstPart then
			local fpPos = firstPart.Position
			local floorY = getOrLockFloorY(fpPos, playerPos, firstPart)
			boss1ArenaCenter = Vector3.new(fpPos.X, floorY, fpPos.Z)
			local fpRadius = math.max(firstPart.Size.X, firstPart.Size.Z) / 2
			boss1ArenaRadius = math.max(20, fpRadius - 2.5)
			updateBoss1ArenaVisual(boss1ArenaCenter, playerPos, firstPart)
		elseif not boss1ArenaCenter then
			local bPos = targetFacing.GetTargetPosition()
			if not bPos then
				local tracked = shared.GetTrackedEnemyData()
				if tracked and #tracked > 0 and tracked[1].Root and tracked[1].Root.Parent then
					bPos = tracked[1].Root.Position
				end
			end
			if bPos then
				local floorY = getOrLockFloorY(bPos, playerPos, nil)
				boss1ArenaCenter = Vector3.new(bPos.X, floorY, bPos.Z)
				boss1ArenaRadius = BOSS1_DEFAULT_RADIUS
				updateBoss1ArenaVisual(boss1ArenaCenter, playerPos, nil)
			end
		end
	end

	-- Tß╗ÉI ╞»U HIß╗åU SUß║ñT ─Éß╗êNH CAO: Zero Hazard Short-Circuit
	-- Nß║┐u detection x├íc nhß║¡n c├│ 0 hiß╗âm hß╗ìa trong thß║┐ giß╗¢i -> Tho├ít ngay lß║¡p tß╗⌐c trong 0ms!
	local totalHazards = detection.GetHazardCount and detection.GetHazardCount() or 0
	if totalHazards == 0 then
		if lockedSafeSpot then
			lockedSafeSpot = nil
			lockedHazardCount = 0
		end
		clearCrystalHighlight()
		return false, nil, nil, 0
	end

	-- Tß║ºng 1 & 3: Nß║┐u kh├┤ng c├▓n kß║╗ ─æß╗ïch n├áo trong ph├▓ng v├á kh├┤ng ß╗ƒ boss room -> Ho├án to├án an to├án
	if shared.GetEnemyCount() == 0 and not shared.IsBossActive() then
		lockedSafeSpot = nil
		lockedHazardCount = 0
		clearCrystalHighlight()
		return false, nil, nil, 0
	end

	-- Lß╗ìc theo Target Scope (Boss / Mobs / All)
	if targetScope == "Boss" and not shared.IsBossActive() then
		lockedSafeSpot = nil
		lockedHazardCount = 0
		clearCrystalHighlight()
		return false, nil, nil, 0
	elseif targetScope == "Mobs" and shared.IsBossActive() then
		lockedSafeSpot = nil
		lockedHazardCount = 0
		clearCrystalHighlight()
		return false, nil, nil, 0
	end

	-- Tß║ºng 3: Zero Nearby Enemies Filter (ngo├ái Boss Room)
	-- Nß║┐u kh├┤ng c├│ bß║Ñt kß╗│ con qu├íi sß╗æng n├áo trong b├ín k├¡nh 85 studs -> Bß╗Å qua c├íc chi├¬u r├íc/phantom
	if not shared.IsBossActive() then
		local tracked = shared.GetTrackedEnemyData()
		local hasNearbyEnemy = false
		if tracked and #tracked > 0 then
			for _, data in ipairs(tracked) do
				if data and data.Root and data.Root.Parent then
					local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
					if hum and hum.Health > 0 then
						if (data.Root.Position - playerPos).Magnitude <= 85 then
							hasNearbyEnemy = true
							break
						end
					end
				end
			end
		end
		if not hasNearbyEnemy then
			lockedSafeSpot = nil
			lockedHazardCount = 0
			clearCrystalHighlight()
			return false, nil, nil, 0
		end
	end

	-- Lß║Ñy Boss 2 Orb ─æang k├¡ch hoß║ít (nß║┐u c├│) ─æß╗â highlight cß╗Öt pha l├¬ v├á xß╗¡ l├╜ ╞░u ti├¬n n├⌐ khß║⌐n cß║Ñp
	local activeOrbPart, orbColorName = detection.GetActiveBossOrb()
	if activeOrbPart and orbColorName then
		local targetCrystal = getBossCrystal(orbColorName)
		if targetCrystal then
			updateCrystalHighlight(targetCrystal, orbColorName)
		end
	else
		clearCrystalHighlight()
	end

	local distToOrb = math.huge
	local isOrbTooClose = false
	if activeOrbPart and activeOrbPart.Position then
		distToOrb = (Vector3.new(activeOrbPart.Position.X - playerPos.X, 0, activeOrbPart.Position.Z - playerPos.Z)).Magnitude
		-- Cß╗▒ ly an to├án vß╗¢i Quß║ú Cß║ºu: Lu├┤n duy tr├¼ khoß║úng c├ích an to├án >= 16.0 studs!
		-- Nß║┐u quß║ú cß║ºu tiß║┐n v├áo cß╗▒ ly < 16.0 studs -> K├¡ch hoß║ít n├⌐/kite khß║⌐n cß║Ñp, tuyß╗çt ─æß╗æi kh├┤ng ─æß╗⌐ng y├¬n!
		if distToOrb < 16.0 then
			isOrbTooClose = true
		end
	end

	-- 1. ╞»U TI├èN Sß╗É 1: N├ë TR╞»ß╗ÜC (DODGE HAZARDS FIRST)
	-- Kiß╗âm tra xem Player c├│ ─æang ─æß╗⌐ng trong bß║Ñt kß╗│ v├╣ng nguy hiß╗âm n├áo kh├┤ng.
	-- - Nß║┐u quß║ú cß║ºu ß╗ƒ cß╗▒ ly an to├án (>= 16.0 studs): Tß║ím bß╗Å qua quß║ú cß║ºu ─æß╗â n├⌐ c├íc chi├¬u kh├íc hoß║╖c dß║½n cß║ºu vß╗ü cß╗Öt.
	-- - Nß║┐u quß║ú cß║ºu ├íp s├ít nguy hiß╗âm (< 16.0 studs): TUYß╗åT ─Éß╗ÉI KH├öNG Bß╗Ä QUA! K├¡ch hoß║ít n├⌐ khß║⌐n cß║Ñp quß║ú cß║ºu.
	local ignoredOrb = (not isOrbTooClose) and activeOrbPart or nil
	local inDanger, dangerInfo, dangerPart, dangerTraj = geometry.IsPointInAnyHazard(playerPos, ignoredOrb)

	-- Can thiß╗çp khß║⌐n cß║Ñp: Nß║┐u kh├┤ng d├¡nh chi├¬u s├án n├áo kh├íc nh╞░ng quß║ú cß║ºu ─æ├ú ├íp s├ít < 16.0 studs:
	if not inDanger and isOrbTooClose then
		inDanger = true
		dangerPart = activeOrbPart
		dangerInfo = { Name = ("%s Orb (Maintain Safe Distance)"):format(orbColorName and orbColorName:upper() or "BOSS") }
		local fwd = (playerPos - activeOrbPart.Position)
		local fwd2D = (fwd.Magnitude > 0.1) and Vector3.new(fwd.X, 0, fwd.Z).Unit or Vector3.new(0, 0, 1)
		dangerTraj = {
			isTrajectory = true,
			isDynamicMoving = true,
			isBossOrb = true,
			perpDist = 0,
			dangerRadius = 6.0,
			forward2D = fwd2D,
			originPos = activeOrbPart.Position,
			maxLookahead = 25.0,
		}
	end
	if not inDanger or not dangerPart then
		-- 2. ╞»U TI├èN Sß╗É 2: Dß║¬N ORB Vß╗Ç Cß╗ÿT KHI ─ÉANG AN TO├ÇN
		if activeOrbPart and orbColorName then
			local targetCrystal, wrongCrystals = getBossCrystal(orbColorName)
			if targetCrystal then
				-- KIß╗éM TRA S├ÇN Sß║áCH & V├ÖNG ─Éß╗åM AN TO├ÇN:
				-- Nß║┐u ng╞░ß╗¥i ch╞íi vß╗½a n├⌐ ra m├⌐p mß╗Öt chi├¬u thß╗⌐c s├ít th╞░╞íng (v├¡ dß╗Ñ h├¼nh chß╗» nhß║¡t hay MovingBeam)
				-- m├á chi├¬u ─æ├│ vß║½n ─æang tß╗ôn tß║íi s├ít ch├ón:
				-- Nß║╛U C├ô QUß║ó Cß║ªU ─ÉANG ß╗₧ Gß║ªN (< 28 studs): TUYß╗åT ─Éß╗ÉI KH├öNG ─Éß╗¿NG Y├èN CHß╗£ AOE Nß╗ö!
				-- Phß║úi tiß║┐p tß╗Ñc l├╣i/kite dß╗ìc theo h├ánh lang an to├án ra xa quß║ú cß║ºu!
				local hasActiveFloorHazard = false
				local allHazards = detection.GetActiveHazards and detection.GetActiveHazards()
				if allHazards and #allHazards > 0 then
					local hasOtherHazard = false
					for _, hData in ipairs(allHazards) do
						local hInst = hData.Instance
						if hInst and hInst ~= activeOrbPart and hInst ~= (activeOrbPart and activeOrbPart.Parent) then
							hasOtherHazard = true
							break
						end
					end
					if hasOtherHazard and not geometry.IsSpotFullySafe(playerPos, 4.5, activeOrbPart) then
						hasActiveFloorHazard = true
					end
				end

				if hasActiveFloorHazard then
					if distToOrb < 28.0 and activeOrbPart and activeOrbPart.Position then
						local fwdOrb = (playerPos - activeOrbPart.Position)
						local fwdOrb2D = (fwdOrb.Magnitude > 0.1) and Vector3.new(fwdOrb.X, 0, fwdOrb.Z).Unit or Vector3.new(0, 0, 1)
						local perpOrb = Vector3.new(-fwdOrb2D.Z, 0, fwdOrb2D.X)

						local corridorSteps = { 6.0, 10.0, 15.0, 20.0, 26.0, 32.0 }
						local corridorPerp = { 0, 2.0, -2.0, 4.0, -4.0 }
						local bestKite = nil
						local bestKiteDist = -math.huge

						for _, stepDist in ipairs(corridorSteps) do
							for _, pOff in ipairs(corridorPerp) do
								local cand = playerPos + fwdOrb2D * stepDist + perpOrb * pOff
								if geometry.IsSpotFullySafe(cand, 0.5, activeOrbPart) then
									if geometry.IsPathSafe(playerPos, cand, nil, nil, activeOrbPart) then
										local dToOrb = (Vector3.new(cand.X - activeOrbPart.Position.X, 0, cand.Z - activeOrbPart.Position.Z)).Magnitude
										if dToOrb > bestKiteDist then
											bestKiteDist = dToOrb
											bestKite = cand
										end
									end
								end
							end
						end

						if bestKite then
							local sFloor, hasF = geometry.GetFloorPosition(bestKite)
							local finalKite = hasF and sFloor or bestKite
							lockedSafeSpot = finalKite
							lockedHazardCount = 1
							return true, finalKite, ("Kiting along corridor away from %s"):format(orbColorName:upper()), (finalKite - playerPos).Magnitude
						end
					end

					-- Chß╗ë ─æß╗⌐ng y├¬n khi quß║ú cß║ºu ß╗ƒ cß╗▒ ly an to├án rß║Ñt xa (>= 28 studs):
					if distToOrb >= 28.0 then
						lockedSafeSpot = playerPos
						lockedHazardCount = 1
						return true, playerPos, ("Waiting for nearby AoE to explode before leading %s"):format(orbColorName:upper()), 0
					end
				end

				local orbPos = activeOrbPart.Position
				local crystalPos = targetCrystal.Position

				-- Vector h╞░ß╗¢ng tß╗½ quß║ú cß║ºu tß╗¢i cß╗Öt pha l├¬ (Orb -> Crystal)
				local dirFromOrb = Vector3.new(crystalPos.X - orbPos.X, 0, crystalPos.Z - orbPos.Z)
				if dirFromOrb.Magnitude > 0.5 then
					dirFromOrb = dirFromOrb.Unit
				else
					dirFromOrb = Vector3.new(0, 0, 1)
				end

				-- Vß╗ï tr├¡ ─æß╗⌐ng chuß║⌐n: ─Éß╗⌐ng ngay ph├¡a sau cß╗Öt pha l├¬ (cß╗Öt nß║▒m giß╗»a quß║ú cß║ºu v├á player)
				local behindCrystal = crystalPos + dirFromOrb * 3.8

				-- Kiß╗âm tra xem quß║ú cß║ºu c├│ ─æang chß║»n ngay tr├¬n ─æ╞░ß╗¥ng chß║íy thß║│ng tß╗½ player tß╗¢i cß╗Öt kh├┤ng
				local vecToCrystal = Vector3.new(crystalPos.X - playerPos.X, 0, crystalPos.Z - playerPos.Z)
				local distToCrystal = vecToCrystal.Magnitude
				local vecToOrb = Vector3.new(orbPos.X - playerPos.X, 0, orbPos.Z - playerPos.Z)
				local distToOrb = vecToOrb.Magnitude

				local chosenTarget = behindCrystal

				-- Nß║┐u player ─æang ß╗ƒ xa (> 8 studs) v├á quß║ú cß║ºu ─æang chß║╖n giß╗»a player v├á cß╗Öt -> B╞░ß╗¢c chß║┐ch sang b├¬n h├┤ng (flank)
				if distToCrystal > 8 and distToOrb < distToCrystal and distToOrb < 25 then
					local dirPC = vecToCrystal.Unit
					local dirPO = vecToOrb.Unit
					local dot = dirPC:Dot(dirPO)
					if dot > 0.75 then
						local perp = Vector3.new(-dirPC.Z, 0, dirPC.X)
						local cand1 = playerPos + (dirPC * 0.6 + perp * 0.8).Unit * 12
						local cand2 = playerPos + (dirPC * 0.6 - perp * 0.8).Unit * 12
						if (cand1 - orbPos).Magnitude > (cand2 - orbPos).Magnitude then
							chosenTarget = cand1
						else
							chosenTarget = cand2
						end
					end
				end

				-- Tr├ính xa 2 cß╗Öt kh├íc m├áu (wrong crystals)
				for _, wrongCr in ipairs(wrongCrystals) do
					local wPos = wrongCr.Position
					local diffW = Vector3.new(chosenTarget.X - wPos.X, 0, chosenTarget.Z - wPos.Z)
					if diffW.Magnitude < 10 and diffW.Magnitude > 0.1 then
						chosenTarget = chosenTarget + diffW.Unit * (10 - diffW.Magnitude)
					end
				end

				-- Snap xuß╗æng mß║╖t s├án
				local snapped, hasFloor = geometry.GetFloorPosition(chosenTarget)
				local finalGuidePos = hasFloor and snapped or chosenTarget

				-- Nß║╛U ─É├ìCH ─Éß║╛N Tß║áI Cß╗ÿT Bß╗è D├ìNH SKILL Cß╗ªA BOSS (V├¡ dß╗Ñ gai nhß╗ìn cß║»m ngay sau cß╗Öt)
				-- Xoay nhß║╣ g├│c ─æß╗⌐ng quanh cß╗Öt (┬▒30┬░, ┬▒45┬░, ┬▒60┬░, ┬▒90┬░) ─æß╗â chß╗ìn ─æiß╗âm an to├án nhß║Ñt vß║½n giß╗» cß╗Öt chß║╖n b├│ng
				if not geometry.IsSpotFullySafe(finalGuidePos, 0.5, activeOrbPart) then
					local testAngles = { 30, -30, 45, -45, 60, -60, 90, -90, 120, -120 }
					for _, angleDeg in ipairs(testAngles) do
						local rad = math.rad(angleDeg)
						local cosA = math.cos(rad)
						local sinA = math.sin(rad)
						local rotDir = Vector3.new(dirFromOrb.X * cosA - dirFromOrb.Z * sinA, 0, dirFromOrb.X * sinA + dirFromOrb.Z * cosA)
						local altPos = crystalPos + rotDir * 4.0

						if geometry.IsSpotFullySafe(altPos, 0.5, activeOrbPart) then
							local sFloor, hasF = geometry.GetFloorPosition(altPos)
							finalGuidePos = hasF and sFloor or altPos
							break
						end
					end
				end

				-- KIß╗éM TRA ─ÉOß║áN ─É╞»ß╗£NG CHß║áY Tß╗ÜI Cß╗ÿT: C├ô Bß╗è SKILL KH├üC CHß║╢N ─É╞»ß╗£NG KH├öNG?
				local isDirectPathSafe = geometry.IsPathSafe(playerPos, finalGuidePos, nil, nil, activeOrbPart)
				if not isDirectPathSafe then
					local forward = Vector3.new(finalGuidePos.X - playerPos.X, 0, finalGuidePos.Z - playerPos.Z)
					local distToTarget = forward.Magnitude
					local fUnit = distToTarget > 1 and forward.Unit or Vector3.new(0, 0, 1)
					local perp = Vector3.new(-fUnit.Z, 0, fUnit.X)

					local detourCandidates = {}
					local testSteps = { 6, 10, 15, 20 }
					local testLateral = { 8, -8, 12, -12, 16, -16, 20, -20 }
					for _, s in ipairs(testSteps) do
						if s < distToTarget then
							for _, lat in ipairs(testLateral) do
								local cand = playerPos + fUnit * s + perp * lat
								table.insert(detourCandidates, cand)
							end
						end
					end

					local bestDetour = nil
					local bestScore = math.huge
					-- ─É├ính gi├í detour thuß║ºn to├ín hß╗ìc (0 Raycast trong loop)
					for _, cand in ipairs(detourCandidates) do
						if geometry.IsSpotFullySafe(cand, 0.5, activeOrbPart) then
							if geometry.IsPathSafe(playerPos, cand, nil, nil, activeOrbPart) then
								local safeFromWrong = true
								for _, wCr in ipairs(wrongCrystals) do
									if (cand - wCr.Position).Magnitude < 10 then
										safeFromWrong = false
										break
									end
								end
								if safeFromWrong then
									local score = (cand - finalGuidePos).Magnitude
									if score < bestScore then
										bestScore = score
										bestDetour = cand
									end
								end
							end
						end
					end

					if bestDetour then
						local snappedFloor, hasF = geometry.GetFloorPosition(bestDetour)
						local finalDetour = hasF and snappedFloor or bestDetour
						lockedSafeSpot = finalDetour
						lockedHazardCount = 1
						return true, finalDetour, ("Detour around skill -> %s Crystal"):format(orbColorName:upper()), (finalDetour - playerPos).Magnitude
					else
						-- ─É╞░ß╗¥ng ─æi tß╗¢i cß╗Öt bß╗ï chß║╖n ho├án to├án bß╗ƒi chi├¬u thß╗⌐c nguy hiß╗âm (v├¡ dß╗Ñ h├¼nh chß╗» nhß║¡t ─æß╗Å):
						-- Nß║╛U C├ô QUß║ó Cß║ªU ─ÉANG ß╗₧ Gß║ªN (< 28 studs): TUYß╗åT ─Éß╗ÉI KH├öNG ─Éß╗¿NG Y├èN CHß╗£ Nß╗ö!
						-- L├╣i/Kite dß╗ìc theo h├ánh lang an to├án (h╞░ß╗¢ng ra xa quß║ú cß║ºu) ─æß╗â giß╗» cß╗▒ ly sinh tß╗ôn:
						if activeOrbPart and activeOrbPart.Position and distToOrb < 28.0 then
							local fwdOrb = (playerPos - activeOrbPart.Position)
							local fwdOrb2D = (fwdOrb.Magnitude > 0.1) and Vector3.new(fwdOrb.X, 0, fwdOrb.Z).Unit or Vector3.new(0, 0, 1)
							local perpOrb = Vector3.new(-fwdOrb2D.Z, 0, fwdOrb2D.X)

							local corridorSteps = { 6.0, 10.0, 15.0, 20.0, 26.0, 32.0 }
							local corridorPerp = { 0, 2.0, -2.0, 4.0, -4.0 }
							local bestKite = nil
							local bestKiteDist = -math.huge

							for _, stepDist in ipairs(corridorSteps) do
								for _, pOff in ipairs(corridorPerp) do
									local cand = playerPos + fwdOrb2D * stepDist + perpOrb * pOff
									if geometry.IsSpotFullySafe(cand, 0.5, activeOrbPart) then
										if geometry.IsPathSafe(playerPos, cand, nil, nil, activeOrbPart) then
											local dToOrb = (Vector3.new(cand.X - activeOrbPart.Position.X, 0, cand.Z - activeOrbPart.Position.Z)).Magnitude
											if dToOrb > bestKiteDist then
												bestKiteDist = dToOrb
												bestKite = cand
											end
										end
									end
								end
							end

							if bestKite then
								local sFloor, hasF = geometry.GetFloorPosition(bestKite)
								local finalKite = hasF and sFloor or bestKite
								lockedSafeSpot = finalKite
								lockedHazardCount = 1
								return true, finalKite, ("Kiting along corridor away from %s"):format(orbColorName:upper()), (finalKite - playerPos).Magnitude
							end
						end

						-- Chß╗ë khi kh├┤ng c├│ quß║ú cß║ºu ─æe dß╗ìa mß╗¢i ─æß╗⌐ng y├¬n tß║íi vß╗ï tr├¡ an to├án hiß╗çn tß║íi ─æß╗úi chi├¬u tan biß║┐n:
						lockedSafeSpot = playerPos
						lockedHazardCount = 1
						return true, playerPos, ("Waiting for path to clear -> %s Crystal"):format(orbColorName:upper()), 0
					end
				end

				local escapeDist = (finalGuidePos - playerPos).Magnitude
				lockedSafeSpot = finalGuidePos
				lockedHazardCount = 1

				return true, finalGuidePos, ("Lead %s -> %s Crystal"):format(activeOrbPart.Name, orbColorName:upper()), escapeDist
			end
		end

		lockedSafeSpot = nil
		lockedHazardCount = 0
		clearCrystalHighlight()
		return false, nil, nil, 0
	end

	-- KHI Tß╗ÜI ─É├éY: inDanger == true (Player ─æang d├¡nh chi├¬u nguy hiß╗âm cß╗ºa Boss)
	-- -> THß╗░C THI N├ë TR╞»ß╗ÜC (DODGE HAZARDS FIRST) THEO THUß║¼T TO├üN TI├èU CHUß║¿N!
	local hazardName = dangerInfo.Name or "Unknown"

	-- X├íc ─æß╗ïnh h╞░ß╗¢ng di chuyß╗ân chß╗º ─æß╗Öng hiß╗çn tß║íi cß╗ºa Player (─æß╗Ö ╞░u ti├¬n: Humanoid.MoveDirection -> RootPart.AssemblyLinearVelocity)
	local moveDir = nil
	if humanoid and humanoid.MoveDirection.Magnitude > 0.1 then
		moveDir = Vector3.new(humanoid.MoveDirection.X, 0, humanoid.MoveDirection.Z).Unit
	elseif rootPart then
		local vel = rootPart.AssemblyLinearVelocity
		local vel2D = Vector3.new(vel.X, 0, vel.Z)
		if vel2D.Magnitude > 1.5 then
			moveDir = vel2D.Unit
		end
	end

	-- Lß║Ñy to├án bß╗Ö c├íc hazard ─æang bao phß╗º vß╗ï tr├¡ Player (hß╗ù trß╗ú nhiß╗üu chi├¬u ─æ├¿ nhau)
	local currentHazardsSet, currentHazardCount = geometry.GetAllHazardsAtPoint(playerPos)
	lastDangerPart = dangerPart
	lastCurrentHazardsSet = currentHazardsSet

	-- 2. C╞á CHß║╛ STRICT LATCHING Kß║╛T Hß╗óP OPPORTUNISTIC RETARGETING:
	-- Kiß╗âm tra t├¡nh hß╗úp lß╗ç cß╗ºa ─æiß╗âm kh├│a an to├án hiß╗çn tß║íi (nß║┐u c├│):
	local isOldPointStillSafe = false
	local lockedDist = math.huge
	if lockedSafeSpot and geometry.IsSpotFullySafe(lockedSafeSpot, 0.5) then
		local inArena = not (boss1ArenaCenter and not isInsideBoss1Arena(lockedSafeSpot, playerPos))
		if inArena then
			lockedDist = (lockedSafeSpot - playerPos).Magnitude
			if lockedDist <= 45 and geometry.IsPathSafe(playerPos, lockedSafeSpot, currentHazardsSet, dangerPart) then
				isOldPointStillSafe = true

				-- Nß║╛U C├ô QUß║ó Cß║ªU ─ÉANG ß╗₧ Gß║ªN (< 24 studs):
				-- Tuyß╗çt ─æß╗æi KH├öNG giß╗» ─æiß╗âm kh├│a nß║┐u ─æiß╗âm ─æ├│ qu├í gß║ºn quß║ú cß║ºu (< 18 studs)
				-- hoß║╖c nß║┐u nh├ón vß║¡t ─æ├ú tß╗¢i n╞íi (lockedDist <= 1.5) nh╞░ng quß║ú cß║ºu vß║½n ─æang d├¡ -> Buß╗Öc t├¡nh ─æiß╗âm l├╣i tiß║┐p theo!
				if activeOrbPart and activeOrbPart.Position then
					local distOrbToLocked = (Vector3.new(lockedSafeSpot.X - activeOrbPart.Position.X, 0, lockedSafeSpot.Z - activeOrbPart.Position.Z)).Magnitude
					if distOrbToLocked < 18.0 and distToOrb < 24.0 then
						isOldPointStillSafe = false
					elseif lockedDist <= 1.5 and distToOrb < 24.0 then
						isOldPointStillSafe = false
					end
				end

				-- Nß║╛U ─É├â C├ô ─ÉIß╗éM KH├ôA Hß╗óP Lß╗å V├Ç ─ÉANG TR├èN ─É╞»ß╗£NG CHß║áY Tß╗ÜI (lockedDist <= 6.5 studs):
				-- Giß╗» nguy├¬n 100% ─æiß╗âm n├áy, triß╗çt ti├¬u ho├án to├án hiß╗çn t╞░ß╗úng nhß║úy ─æiß╗âm giß║¡m ch├ón tß║íi chß╗ù!
				if isOldPointStillSafe and lockedDist <= 6.5 then
					local finalDist = math.floor(lockedDist * 10) / 10
					return true, lockedSafeSpot, hazardName, finalDist
				end
			end
		end
	end

	-- ─Éiß╗âm kh├│a c┼⌐ bß╗ï skill mß╗¢i ─æ├¿ hoß║╖c kh├┤ng c├▓n an to├án -> X├│a kh├│a
	if not isOldPointStillSafe then
		lockedSafeSpot = nil
		lockedHazardCount = currentHazardCount
	end

	local candidatePos = nil
	local isMultiRings = hazardName:lower():find("multiring") ~= nil
		or (dangerInfo.Instance and dangerInfo.Instance.Name:lower():find("multiring") ~= nil)

	-- 3. T├¡nh Vector Lß╗▒c ─Éß║⌐y Tho├ít Nß║ín Tß╗òng Hß╗úp (Multi-Hazard Repulsion)
	local repVector = computeRepulsionVector(playerPos, dangerPart)

	if isMultiRings then
		-- T├¡nh ─æiß╗âm tho├ít nhanh cho thirdBossMultiRings:
		local inRing, r, rIn, rOut, centerPos, ringCF = geometry.IsPointInRingPart(playerPos, dangerPart)
		local candidates = {}

		if inRing and centerPos and r and r > 0.1 then
			local diffX = playerPos.X - centerPos.X
			local diffZ = playerPos.Z - centerPos.Z
			local unitX = diffX / r
			local unitZ = diffZ / r

			-- Thß╗¡ b╞░ß╗¢c v├áo lß╗ù trong (nh├¡ch nhß║╣ 3 studs)
			if rIn and rIn > 2.0 then
				local stepIn = Vector3.new(centerPos.X + unitX * (rIn - 2.5), playerPos.Y, centerPos.Z + unitZ * (rIn - 2.5))
				table.insert(candidates, stepIn)
			end

			-- Thß╗¡ b╞░ß╗¢c v├áo khoß║úng hß╗ƒ ngo├ái (nh├¡ch nhß║╣ 3 studs)
			if rOut then
				local stepOut = Vector3.new(centerPos.X + unitX * (rOut + 2.5), playerPos.Y, centerPos.Z + unitZ * (rOut + 2.5))
				table.insert(candidates, stepOut)
			end

			-- Thß╗¡ b╞░ß╗¢c sang nß╗¡a ─æß╗æi diß╗çn nß║┐u l├á b├ín nguyß╗çt
			local stepFlip = Vector3.new(centerPos.X - diffX, playerPos.Y, centerPos.Z - diffZ)
			table.insert(candidates, stepFlip)
		end

		-- Qu├⌐t tß╗Åa tr├▓n 8 h╞░ß╗¢ng bß╗ò trß╗ú (C├ón bß║▒ng hiß╗çu suß║Ñt CPU tß╗æi ╞░u)
		local multiRingsRadii = { 3.5, 7.0, 12.0, 18.0, 26.0, 35.0 }
		local multiRingsAngles = { 0, 45, 90, 135, 180, 225, 270, 315 }

		for _, dist in ipairs(multiRingsRadii) do
			for _, angleDeg in ipairs(multiRingsAngles) do
				local rad = math.rad(angleDeg)
				local offset = Vector3.new(math.cos(rad) * dist, 0, math.sin(rad) * dist)
				table.insert(candidates, playerPos + offset)
			end
		end

		local bestPos = nil
		local bestScore = math.huge
		local fallbackPos = nil
		local fallbackScore = math.huge

		-- Tß╗ÉI ╞»U HIß╗åU SUß║ñT CPU: ─É├ính gi├í thuß║ºn t├║y bß║▒ng to├ín h├¼nh hß╗ìc (0 Raycast trong loop)
		for _, candWorld in ipairs(candidates) do
			if boss1ArenaCenter and not isInsideBoss1Arena(candWorld, playerPos) then
				continue
			end
			-- Tr├ính n├⌐ thß║│ng v├áo Boss Orb (nß║┐u c├│ quß║ú cß║ºu Boss 2 ─æang hoß║ít ─æß╗Öng):
			if activeOrbPart and activeOrbPart.Position then
				local dOrb = (Vector3.new(candWorld.X - activeOrbPart.Position.X, 0, candWorld.Z - activeOrbPart.Position.Z)).Magnitude
				if dOrb < 12.0 then
					continue
				end
			end
			if geometry.IsSpotFullySafe(candWorld, 0.5) then
				local moveDist = (candWorld - playerPos).Magnitude
				local score = moveDist - getClearanceBonus(candWorld)
				if score < fallbackScore then
					fallbackScore = score
					fallbackPos = candWorld
				end
				if geometry.IsPathSafe(playerPos, candWorld, currentHazardsSet, dangerPart) then
					if score < bestScore then
						bestScore = score
						bestPos = candWorld
					end
				end
			end
		end

		-- Chß╗ë bß║»n DUY NHß║ñT 1 TIA RAYCAST cho ─æiß╗âm ß╗⌐ng vi├¬n tß╗æt nhß║Ñt ─æ├ú chß╗ìn
		local chosenMultiRing = bestPos or fallbackPos
		if chosenMultiRing then
			local snapped, hasFloor = geometry.GetFloorPosition(chosenMultiRing)
			if hasFloor and geometry.IsSpotFullySafe(snapped, 0.5) then
				if not (boss1ArenaCenter and not isInsideBoss1Arena(snapped, playerPos)) then
					candidatePos = snapped
				else
					candidatePos = chosenMultiRing
				end
			else
				candidatePos = chosenMultiRing
			end
		end
	elseif dangerTraj and dangerTraj.isTrajectory then
		-- 4. CHIß║╛N L╞»ß╗óC CHO PROJECTILE / MOVING BEAM:
		-- NGUY├èN Tß║«C V├ÇNG: TUYß╗åT ─Éß╗ÉI KH├öNG N├ë Vß╗Ç PH├ìA TR╞»ß╗ÜC THEO H╞»ß╗ÜNG BAY Cß╗ªA CHI├èU!
		-- (V├¼ n├⌐ vß╗ü ph├¡a tr╞░ß╗¢c theo h╞░ß╗¢ng bay sß║╜ l├ám Green Spot xuß║Ñt hiß╗çn tr├¬n ─æ╞░ß╗¥ng ─æi cß╗ºa chi├¬u -> Player bß╗ï ─æß║⌐y dß║ºn)
		-- Chß╗ë n├⌐ theo 2 h╞░ß╗¢ng an to├án:
		-- 1) Tho├ít ngang vu├┤ng g├│c sang 2 b├¬n s╞░ß╗¥n (Perpendicular Left / Right)
		-- 2) Tho├ít l├╣i vß╗ü ph├¡a sau (Behind / Backwards) sau khi thanh beam / ─æß║ín vß╗½a qu├⌐t qua!

		local forward2D = dangerTraj.forward2D
		local perpDist = dangerTraj.perpDist
		local dangerRadius = dangerTraj.dangerRadius
		local stepNeeded = math.max(3.5, (dangerRadius - perpDist) + ESCAPE_MARGIN)

		-- Vector vu├┤ng g├│c sang phß║úi v├á sang tr├íi (90 deg tr├¬n mß║╖t phß║│ng X-Z)
		local perpRight = Vector3.new(forward2D.Z, 0, -forward2D.X)
		local perpLeft = Vector3.new(-forward2D.Z, 0, forward2D.X)

		local isMovingBeam = hazardName:lower():find("movingbeam") ~= nil
			or (dangerPart and dangerPart.Name:lower():find("movingbeam") ~= nil)
		local isBossOrb = (dangerTraj and dangerTraj.isBossOrb)
			or (hazardName:lower():find("orb") ~= nil)
			or (dangerPart and dangerPart.Name:lower():find("orb") ~= nil)
		local isExpandingCone = (dangerTraj and dangerTraj.isExpandingCone)
			or hazardName:lower():find("cricle") ~= nil
			or hazardName:lower():find("circle") ~= nil
			or (dangerPart and (dangerPart.Name:lower():find("cricle") ~= nil or dangerPart.Name:lower():find("circle") ~= nil))

		local trajCandidates = {}

		if isBossOrb then
			-- CHIß║╛N L╞»ß╗óC CHO BOSS 2 ORB (Yellow/Red/Green Orb):
			-- Quß║ú cß║ºu d├¡ theo Player. Tho├ít hiß╗âm v├á DUY TR├î KHOß║óNG C├üCH AN TO├ÇN (>= 18 studs):
			-- forward2D ß╗ƒ ─æ├óy l├á vector h╞░ß╗¢ng tß╗½ Quß║ú Cß║ºu ra vß╗ï tr├¡ Player!
			-- Do ─æ├│, playerPos + forward2D * kDist l├á chß║íy THß║▓NG RA XA Quß║ú Cß║ºu (t─âng cß╗▒ ly an to├án)!
			-- Kß║┐t hß╗úp l├ích s╞░ß╗¥n perpRight * pOff ─æß╗â khiß║┐n quß║ú cß║ºu bay chß╗çch h╞░ß╗¢ng (Flank & Kite)
			local kiteDists = { 6.0, 10.0, 15.0, 20.0, 26.0, 32.0 }
			local perpOffsets = { 0, 2.0, -2.0, 4.5, -4.5, 7.0, -7.0 }
			for _, kDist in ipairs(kiteDists) do
				for _, pOff in ipairs(perpOffsets) do
					local kitePos = playerPos + forward2D * kDist + perpRight * pOff
					table.insert(trajCandidates, kitePos)
				end
			end
		elseif isMovingBeam then
			-- CHIß║╛N L╞»ß╗óC MOVING BEAM (Boss 2): Cho ph├⌐p l├╣i sau ─æu├┤i beam ─æ├ú qu├⌐t qua
			local fOffsets = { 0, -3, -6, -10 }
			for _, fOff in ipairs(fOffsets) do
				local fVec = forward2D * fOff
				table.insert(trajCandidates, playerPos + perpRight * stepNeeded + fVec)
				table.insert(trajCandidates, playerPos + perpLeft * stepNeeded + fVec)
				table.insert(trajCandidates, playerPos + perpRight * (stepNeeded + 2.5) + fVec)
				table.insert(trajCandidates, playerPos + perpLeft * (stepNeeded + 2.5) + fVec)
			end

			if dangerPart and dangerPart.Parent then
				local bPos = Vector3.new(dangerPart.Position.X, playerPos.Y, dangerPart.Position.Z)
				table.insert(trajCandidates, bPos - forward2D * 7.0)
				table.insert(trajCandidates, bPos - forward2D * 11.0)
				table.insert(trajCandidates, bPos - forward2D * 7.0 + perpRight * 5.0)
				table.insert(trajCandidates, bPos - forward2D * 7.0 + perpLeft * 5.0)
			end
			table.insert(trajCandidates, playerPos - forward2D * (ESCAPE_MARGIN + 4.0))
			table.insert(trajCandidates, playerPos - forward2D * (ESCAPE_MARGIN + 8.0))
			table.insert(trajCandidates, playerPos - forward2D * (ESCAPE_MARGIN + 12.0))
		elseif isExpandingCone then
			-- CHIß║╛N L╞»ß╗óC CHO Kß╗╕ N─éNG V├ÆNG TR├ÆN Nß╗ÉI TIß║╛P Mß╗₧ Rß╗ÿNG (secondBossCricleHitbox - Boss 2):
			-- ─Éß║╖c ─æiß╗âm: V├▓ng tr├▓n spawn nß╗æi tiß║┐p tß╗½ Boss vß╗ü ph├¡a Player, c├áng ra xa b├ín k├¡nh c├áng mß╗ƒ rß╗Öng lß╗¢n.
			-- NGUY├èN Tß║«C V├ÇNG:
			-- 1) L├ích s╞░ß╗¥n ngang vu├┤ng g├│c 90┬░ (Perpendicular Left / Right) ─æß╗â nhanh ch├│ng b╞░ß╗¢c ra ngo├ái r├¼a n├│n
			local coneSteps = { stepNeeded, stepNeeded + 3.0, stepNeeded + 6.0, stepNeeded + 10.0 }
			for _, sDist in ipairs(coneSteps) do
				table.insert(trajCandidates, playerPos + perpRight * sDist)
				table.insert(trajCandidates, playerPos + perpLeft * sDist)
			end

			-- 2) L├ích ch├⌐o chß║┐ch vß╗ü ph├¡a tr╞░ß╗¢c (-forward2D, h╞░ß╗¢ng vß╗ü ph├¡a Boss):
			-- V├¼ c├áng gß║ºn Boss th├¼ b├ín k├¡nh n├│n c├áng hß║╣p, viß╗çc tiß║┐n ch├⌐o s╞░ß╗¥n gi├║p tho├ít v├╣ng ─æß╗Å nhanh h╞ín gß║Ñp nhiß╗üu lß║ºn
			local forwardOffsets = { 4.0, 8.0, 12.0 }
			for _, fOff in ipairs(forwardOffsets) do
				local forwardVec = -forward2D * fOff
				for _, sDist in ipairs({ stepNeeded, stepNeeded + 3.0, stepNeeded + 6.0 }) do
					table.insert(trajCandidates, playerPos + perpRight * sDist + forwardVec)
					table.insert(trajCandidates, playerPos + perpLeft * sDist + forwardVec)
				end
			end
		else
			-- CHIß║╛N L╞»ß╗óC PROJECTILE / BEAM Cß╗ªA BOSS 1 (firstBossBigSpike, seekingSpikes):
			-- ╞»U TI├èN TUYß╗åT ─Éß╗ÉI: L├ích ngang vu├┤ng g├│c thuß║ºn t├║y 90┬░ (─Éiß╗âm 1) - Tho├ít hiß╗âm nhanh nhß║Ñt
			local latSteps = { stepNeeded, stepNeeded + 2.0, stepNeeded + 4.0 }
			for _, sDist in ipairs(latSteps) do
				table.insert(trajCandidates, playerPos + perpRight * sDist)
				table.insert(trajCandidates, playerPos + perpLeft * sDist)
			end

			-- Dß╗▒ ph├▓ng lß╗çch nhß║╣ chß╗ë khi cß║ú 2 h╞░ß╗¢ng ngang thuß║ºn t├║y ─æß╗üu bß╗ï ch╞░ß╗¢ng ngß║íi vß║¡t cß║ún:
			local backupFOffsets = { -1.5, 1.5, -3.0 }
			for _, fOff in ipairs(backupFOffsets) do
				local fVec = forward2D * fOff
				table.insert(trajCandidates, playerPos + perpRight * stepNeeded + fVec)
				table.insert(trajCandidates, playerPos + perpLeft * stepNeeded + fVec)
			end
		end

		local bestPos = nil
		local bestScore = math.huge
		local fallbackPos = nil
		local fallbackScore = math.huge

		-- Tß╗ÉI ╞»U HIß╗åU SUß║ñT CPU: ─É├ính gi├í thuß║ºn t├║y bß║▒ng to├ín h├¼nh hß╗ìc (0 Raycast trong loop)
		for _, candWorld in ipairs(trajCandidates) do
			-- Hard gate Arena Boss 1: Kh├┤ng chß╗ìn ─æiß╗âm ra khß╗Åi s├án ─æß║Ñu
			if boss1ArenaCenter and not isInsideBoss1Arena(candWorld, playerPos) then
				continue
			end

			-- Tr├ính n├⌐ thß║│ng v├áo Boss Orb (nß║┐u ─æang n├⌐ chi├¬u kh├íc m├á c├│ quß║ú cß║ºu ß╗ƒ gß║ºn):
			if not isBossOrb and activeOrbPart and activeOrbPart.Position then
				local dOrb = (Vector3.new(candWorld.X - activeOrbPart.Position.X, 0, candWorld.Z - activeOrbPart.Position.Z)).Magnitude
				if dOrb < 12.0 then
					continue
				end
			end

			-- Lß╗îC CHß║╢N TRIß╗åT ─Éß╗é:
			local toCand = candWorld - playerPos
			if toCand.Magnitude > 0.5 then
				local dotForward = toCand.Unit:Dot(forward2D)
				if isBossOrb then
					-- Vß╗¢i Quß║ú Cß║ºu (forward2D h╞░ß╗¢ng tß╗½ Quß║ú Cß║ºu tß╗¢i Player):
					-- Tuyß╗çt ─æß╗æi kh├┤ng chß╗ìn ─æiß╗âm chß║íy ─æ├óm ─æß║ºu ng╞░ß╗úc lß║íi v├áo Quß║ú Cß║ºu (dotForward < -0.25)
					if dotForward < -0.25 then
						continue
					end
				elseif isExpandingCone then
					-- Vß╗¢i kß╗╣ n─âng h├¼nh n├│n mß╗ƒ rß╗Öng (forward2D h╞░ß╗¢ng tß╗½ Boss ra Player):
					-- TUYß╗åT ─Éß╗ÉI KH├öNG N├ë L├ÖI RA XA THEO H╞»ß╗ÜNG LAN Tß╗ÄA (dotForward > 0.15)
					-- V├¼ c├áng l├╣i ra xa th├¼ v├▓ng tr├▓n c├áng ph├¼nh to, n├⌐ l├╣i chß║»c chß║»n d├¡nh s├ít th╞░╞íng
					if dotForward > 0.15 then
						continue
					end
				else
					-- Vß╗¢i Tia bß║»n thß║│ng / Moving Beam (forward2D h╞░ß╗¢ng theo chiß╗üu ─æß║ín bay):
					-- Tuyß╗çt ─æß╗æi kh├┤ng chß╗ìn ─æiß╗âm nß║▒m vß╗ü ph├¡a tr╞░ß╗¢c theo h╞░ß╗¢ng bay cß╗ºa chi├¬u (dotForward > 0.25)
					if dotForward > 0.25 then
						continue
					end
				end
			end

			if geometry.IsSpotFullySafe(candWorld, 0.5) then
				-- Chß║Ñm ─æiß╗âm ╞░u ti├¬n: Cß╗▒ ly ngß║»n nhß║Ñt = thß╗¥i gian ß╗ƒ trong v├╣ng ─æß╗Å ├¡t nhß║Ñt
				local moveDist = toCand.Magnitude
				local clearance = getClearanceBonus(candWorld)
				local score = (moveDist * 1.6) - (clearance * 0.3)

				local dotFwd = toCand.Magnitude > 0.5 and toCand.Unit:Dot(forward2D) or 0
				if isBossOrb then
					-- Th╞░ß╗ƒng lß╗¢n cho viß╗çc gia t─âng khoß║úng c├ích an to├án vß╗¢i Quß║ú Cß║ºu (Kiting Safe Distance):
					if activeOrbPart and activeOrbPart.Position then
						local newDistOrb = (Vector3.new(candWorld.X - activeOrbPart.Position.X, 0, candWorld.Z - activeOrbPart.Position.Z)).Magnitude
						if newDistOrb < 15.0 then
							score = score + (15.0 - newDistOrb) * 10.0 -- Phß║ít nß║╖ng nß║┐u ─æiß╗âm ß╗⌐ng vi├¬n vß║½n qu├í gß║ºn quß║ú cß║ºu
						else
							score = score - math.min(25.0, (newDistOrb - 15.0) * 2.0) -- Th╞░ß╗ƒng ─æiß╗âm cß╗▒c lß╗¢n khi mß╗ƒ rß╗Öng cß╗▒ ly an to├án
						end
					end
					local dotPerp = toCand.Magnitude > 0.5 and math.abs(toCand.Unit:Dot(perpRight)) or 0
					if dotPerp >= 0.65 then
						score = score - 8.0 -- Th╞░ß╗ƒng l├ích s╞░ß╗¥n
					end
				elseif isExpandingCone then
					-- Th╞░ß╗ƒng tß╗æi ─æa cho l├ích ngang s╞░ß╗¥n vu├┤ng g├│c thuß║ºn t├║y 90┬░ (Tho├ít khß╗Åi m├⌐p n├│n nhanh nhß║Ñt)
					local dotPerp = toCand.Magnitude > 0.5 and math.abs(toCand.Unit:Dot(perpRight)) or 0
					if dotPerp >= 0.85 then
						score = score - 15.0 -- Th╞░ß╗ƒng cß╗▒c lß╗¢n khi l├ích ngang s╞░ß╗¥n
					elseif dotPerp < 0.65 then
						score = score + 6.0
					end

					-- Th╞░ß╗ƒng th├¬m nß║┐u l├ích chß║┐ch vß╗ü ph├¡a tr╞░ß╗¢c (-forward2D, v├╣ng n├│n hß║╣p h╞ín):
					if dotFwd < -0.2 then
						score = score - 8.0 -- Th╞░ß╗ƒng tiß║┐n ch├⌐o vß╗ü ph├¡a tr╞░ß╗¢c n├│n
					elseif dotFwd > 0 then
						score = score + 20.0 -- Phß║ít nß║╖ng bß║Ñt kß╗│ chuyß╗ân ─æß╗Öng l├╣i n├áo
					end
				elseif isMovingBeam and dotFwd < -0.2 then
					-- Chß╗ë th╞░ß╗ƒng l├╣i ra sau cho Moving Beam cß╗ºa Boss 2!
					score = score - 15.0
				elseif not isMovingBeam then
					-- Th╞░ß╗ƒng ├íp ─æß║úo cho b╞░ß╗¢c n├⌐ thuß║ºn ngang vu├┤ng g├│c (Perpendicular - ─Éiß╗âm 1)
					local dotPerp = toCand.Magnitude > 0.5 and math.abs(toCand.Unit:Dot(perpRight)) or 0
					if dotPerp >= 0.90 then
						score = score - 12.0 -- ─Éiß╗âm 1: L├ích ngang s╞░ß╗¥n ngß║»n nhß║Ñt, kh├┤ng bß╗ï deal dame
					elseif dotPerp < 0.80 then
						score = score + 4.0  -- ─Éiß╗âm 2: ─Éi ch├⌐o/l├╣i x├⌐o bß╗ï phß║ít ─æiß╗âm nß║╖ng
					end
				end

				-- ╞»u ti├¬n k├⌐o vß╗ü t├óm s├án ─æß║Ñu Boss 1 nß║┐u ─æang dß║ít ra xa
				if boss1ArenaCenter then
					score = score + getBoss1ArenaScoreAdjustment(candWorld, playerPos)
				end

				-- ╞»u ti├¬n h╞░ß╗¢ng Player ─æang chß╗º ─æß╗Öng di chuyß╗ân (Chß╗æng giß║¡t ─æß╗òi h╞░ß╗¢ng 180 ─æß╗Ö):
				if moveDir and moveDist > 0.5 then
					local dotMove = toCand.Unit:Dot(moveDir)
					if dotMove > 0.15 then
						score = score - (dotMove * 5.0) -- Th╞░ß╗ƒng lß╗¢n cho h╞░ß╗¢ng ─æang chß║íy
					elseif dotMove < -0.15 then
						score = score + (math.abs(dotMove) * 6.0) -- Phß║ít nß║╖ng viß╗çc quay xe giß║¡t l├╣i ng╞░ß╗úc h╞░ß╗¢ng
					end
				end

				-- Anti-Flicker Hysteresis: ╞»u ti├¬n duy tr├¼ ─æiß╗âm Safe Spot ─æ├ú kh├│a tr╞░ß╗¢c ─æ├│
				if lockedSafeSpot then
					local distToLocked = (candWorld - lockedSafeSpot).Magnitude
					if distToLocked < 3.0 then
						score = score - 8.0
					end
				end

				if score < fallbackScore then
					fallbackScore = score
					fallbackPos = candWorld
				end
				if geometry.IsPathSafe(playerPos, candWorld, currentHazardsSet, dangerPart) then
					if score < bestScore then
						bestScore = score
						bestPos = candWorld
					end
				end
			end
		end

		if not bestPos then
			-- Fallback: Qu├⌐t tß╗Åa c├íc g├│c L├ÖI V├Ç NGANG thuß║ºn to├ín hß╗ìc (0 Raycast)
			local fwdAngleDeg = math.deg(math.atan2(forward2D.Z, forward2D.X))
			local testAngles = isMovingBeam and { 90, -90, 120, -120, 150, -150, 180 }
				or isBossOrb and { 0, 15, -15, 30, -30, 45, -45, 60, -60 }
				or isExpandingCone and { 90, -90, 105, -105, 120, -120, 135, -135 }
				or { 90, -90, 75, -75, 105, -105, 60, -60, 120, -120 }
			local backRadii = { 4.0, 7.0, 11.0, 16.0, 22.0 }

			for _, dist in ipairs(backRadii) do
				for _, offDeg in ipairs(testAngles) do
					local testRad = math.rad(fwdAngleDeg + offDeg)
					local testWorld = playerPos + Vector3.new(math.cos(testRad) * dist, 0, math.sin(testRad) * dist)
					if boss1ArenaCenter and not isInsideBoss1Arena(testWorld, playerPos) then
						continue
					end
					if geometry.IsSpotFullySafe(testWorld, 0.5) then
						if geometry.IsPathSafe(playerPos, testWorld, currentHazardsSet, dangerPart) then
							bestPos = testWorld
							break
						end
					end
				end
				if bestPos then break end
			end
		end

		-- Chß╗ë bß║»n DUY NHß║ñT 1 TIA RAYCAST cho ─æiß╗âm ß╗⌐ng vi├¬n tß╗æt nhß║Ñt ─æ├ú chß╗ìn
		local chosenTraj = bestPos or fallbackPos
		if chosenTraj then
			local snapped, hasFloor = geometry.GetFloorPosition(chosenTraj)
			if hasFloor and geometry.IsSpotFullySafe(snapped, 0.5) then
				if not (boss1ArenaCenter and not isInsideBoss1Arena(snapped, playerPos)) then
					candidatePos = snapped
				else
					candidatePos = chosenTraj
				end
			else
				candidatePos = chosenTraj
			end
		end
	else
		-- 5. CHIß║╛N L╞»ß╗óC CHO Kß╗╕ N─éNG TH├öNG TH╞»ß╗£NG / ─É├ê NHAU (MULTI-HAZARD SOLVER)
		-- ╞»U TI├èN Sß╗É 1: THO├üT M├ëP H├îNH Hß╗îC TRß╗░C TIß║╛P NGß║«N NHß║ñT (SHORTEST GEOMETRIC EXIT)
		-- ─Éo ch├¡nh x├íc khoß║úng c├ích tß╗½ Player ra m├⌐p chi├¬u gß║ºn nhß║Ñt -> Nh├¡ch ─æ├║ng 1.5 studs qua vß║ích ─æß╗Å l├á an to├án ngay!
		local bestPos = nil
		local bestScore = math.huge
		local fallbackPos = nil
		local fallbackScore = math.huge

		if dangerPart and dangerPart.Parent and dangerPart:IsA("BasePart") then
			local directCandidates = {}

			if dangerPart:IsA("Part") and (dangerPart.Shape == Enum.PartType.Ball or dangerPart.Shape == Enum.PartType.Cylinder) then
				-- A1. Chi├¬u h├¼nh tr├▓n / h├¼nh trß╗Ñ: Tho├ít theo h╞░ß╗¢ng xuy├¬n t├óm + 6 g├│c rß║╗ quß║ít
				local radius = math.max(dangerPart.Size.X, dangerPart.Size.Z) / 2
				local escapeRadius = radius + ESCAPE_MARGIN
				local diff = Vector3.new(playerPos.X - dangerPart.Position.X, 0, playerPos.Z - dangerPart.Position.Z)
				local distFromCenter = diff.Magnitude
				local outDir = distFromCenter > 0.1 and (diff / distFromCenter) or (moveDir or (repVector or Vector3.new(0, 0, 1)))
				local baseAngle = math.atan2(outDir.Z, outDir.X)

				-- ─Éiß╗âm tho├ít ngß║»n nhß║Ñt tuyß╗çt ─æß╗æi: Chiß║┐u thß║│ng tß╗½ t├óm qua ch├ón ng╞░ß╗¥i ch╞íi ra ngo├ái m├⌐p
				table.insert(directCandidates, dangerPart.Position + outDir * escapeRadius)

				-- 6 g├│c rß║╗ quß║ít dß╗▒ ph├▓ng (┬▒20┬░, ┬▒40┬░, ┬▒65┬░)
				local fanAngles = { math.rad(20), -math.rad(20), math.rad(40), -math.rad(40), math.rad(65), -math.rad(65) }
				for _, angOff in ipairs(fanAngles) do
					local a = baseAngle + angOff
					table.insert(directCandidates, dangerPart.Position + Vector3.new(math.cos(a) * escapeRadius, 0, math.sin(a) * escapeRadius))
				end
			elseif dangerPart.Name:lower():find("movingbeam") or (dangerPart.Parent and dangerPart.Parent.Name:lower():find("movingbeam")) then
				-- A2. Moving Beam
				local rightVec = dangerPart.CFrame.RightVector
				local right2D = Vector3.new(rightVec.X, 0, rightVec.Z)
				if right2D.Magnitude > 0.001 then right2D = right2D.Unit else right2D = Vector3.new(1, 0, 0) end
				local forward2D = Vector3.new(-right2D.Z, 0, right2D.X)
				local halfLength = math.max(dangerPart.Size.X, dangerPart.Size.Z) / 2
				local beamRadius = math.max(dangerPart.Size.Y, math.min(dangerPart.Size.X, dangerPart.Size.Z)) / 2
				if beamRadius < 3.5 then beamRadius = 3.5 end

				table.insert(directCandidates, dangerPart.Position + right2D * (halfLength + ESCAPE_MARGIN + 1.0))
				table.insert(directCandidates, dangerPart.Position - right2D * (halfLength + ESCAPE_MARGIN + 1.0))
				table.insert(directCandidates, dangerPart.Position + forward2D * (beamRadius + ESCAPE_MARGIN + 1.5))
				table.insert(directCandidates, dangerPart.Position - forward2D * (beamRadius + ESCAPE_MARGIN + 1.5))
			else
				-- A3. Chi├¬u h├¼nh chß╗» nhß║¡t / OBB: Tß╗▒ ─æß╗Öng ph├ít hiß╗çn trß╗Ñc D├ái/Rß╗Öng
				local localPos = dangerPart.CFrame:PointToObjectSpace(playerPos)
				local halfX = dangerPart.Size.X / 2
				local halfZ = dangerPart.Size.Z / 2

				-- Tß╗▒ ─æß╗Öng nhß║¡n diß╗çn trß╗Ñc d├ái (Length) v├á trß╗Ñc hß║╣p (Width) cß╗ºa h├ánh lang:
				if halfZ >= halfX * 1.4 then
					-- Trß╗Ñc Z l├á h├ánh lang d├ái, trß╗Ñc X l├á bß╗ü s╞░ß╗¥n hß║╣p:
					-- ╞»U TI├èN TUYß╗åT ─Éß╗ÉI: Tho├ít vu├┤ng g├│c sang 2 b├¬n s╞░ß╗¥n trß╗Ñc X tß║íi ─æ├║ng vß╗ï tr├¡ Z cß╗ºa ng╞░ß╗¥i ch╞íi!
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(halfX + ESCAPE_MARGIN, localPos.Y, localPos.Z)))
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(-(halfX + ESCAPE_MARGIN), localPos.Y, localPos.Z)))
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(halfX + ESCAPE_MARGIN + 2.0, localPos.Y, localPos.Z)))
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(-(halfX + ESCAPE_MARGIN + 2.0), localPos.Y, localPos.Z)))
				elseif halfX >= halfZ * 1.4 then
					-- Trß╗Ñc X l├á h├ánh lang d├ái, trß╗Ñc Z l├á bß╗ü s╞░ß╗¥n hß║╣p:
					-- ╞»U TI├èN TUYß╗åT ─Éß╗ÉI: Tho├ít vu├┤ng g├│c sang 2 b├¬n s╞░ß╗¥n trß╗Ñc Z tß║íi ─æ├║ng vß╗ï tr├¡ X cß╗ºa ng╞░ß╗¥i ch╞íi!
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(localPos.X, localPos.Y, halfZ + ESCAPE_MARGIN)))
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(localPos.X, localPos.Y, -(halfZ + ESCAPE_MARGIN))))
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(localPos.X, localPos.Y, halfZ + ESCAPE_MARGIN + 2.0)))
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(localPos.X, localPos.Y, -(halfZ + ESCAPE_MARGIN + 2.0))))
				else
					-- Chi├¬u h├¼nh vu├┤ng hoß║╖c chß╗» nhß║¡t ─æß╗üu: Tho├ít 4 cß║ính gß║ºn nhß║Ñt (TUYß╗åT ─Éß╗ÉI KH├öNG sinh 4 g├│c ch├⌐o xa)
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(halfX + ESCAPE_MARGIN, localPos.Y, localPos.Z)))
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(-(halfX + ESCAPE_MARGIN), localPos.Y, localPos.Z)))
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(localPos.X, localPos.Y, halfZ + ESCAPE_MARGIN)))
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(localPos.X, localPos.Y, -(halfZ + ESCAPE_MARGIN))))
				end
			end

			-- ─É├ính gi├í c├íc ─æiß╗âm tho├ít trß╗▒c tiß║┐p (0 Raycast)
			for _, candWorld in ipairs(directCandidates) do
				if boss1ArenaCenter and not isInsideBoss1Arena(candWorld, playerPos) then
					continue
				end
				if geometry.IsSpotFullySafe(candWorld, 0.5) then
					local score = scoreCandidate(playerPos, candWorld, repVector, moveDir)
					if score < fallbackScore then
						fallbackScore = score
						fallbackPos = candWorld
					end
					if geometry.IsPathSafe(playerPos, candWorld, currentHazardsSet, dangerPart) then
						if score < bestScore then
							bestScore = score
							bestPos = candWorld
						end
					end
				end
			end
		end

		-- ╞»U TI├èN Sß╗É 2: Nß║╛U THO├üT TRß╗░C TIß║╛P Bß╗è V╞»ß╗ÜNG -> QU├ëT Tß╗ÄA TR├ÆN Mß╗èN (RADIAL SWEEP)
		if not bestPos then
			local radPos, radScore = searchRadialSafeSpot(playerPos, repVector, currentHazardsSet, dangerPart, moveDir)
			if radPos and radScore < bestScore then
				bestPos = radPos
				bestScore = radScore
			end
		end

		-- Chß╗ìn ─æiß╗âm tß╗æt nhß║Ñt v├á snap s├án bß║▒ng duy nhß║Ñt 1 Raycast
		local chosenFinal = bestPos or fallbackPos
		if chosenFinal then
			local snapped, hasFloor = geometry.GetFloorPosition(chosenFinal)
			if hasFloor and geometry.IsSpotFullySafe(snapped, 0.5) then
				if not (boss1ArenaCenter and not isInsideBoss1Arena(snapped, playerPos)) then
					candidatePos = snapped
				else
					candidatePos = chosenFinal
				end
			else
				candidatePos = chosenFinal
			end
		end

		-- Fallback khß║⌐n cß║Ñp nß║┐u mß╗ìi h╞░ß╗¢ng ─æß╗üu bß╗ï kß║╣t hoß║╖c chi├¬u qu├í lß╗¢n:
		-- ─Éß║⌐y Player chß║íy dß║ít ra xa theo h╞░ß╗¢ng lß╗▒c ─æß║⌐y tho├ít hiß╗âm (Repulsion Vector) thay v├¼ ─æß╗⌐ng y├¬n chß╗ïu trß║¡n
		if not candidatePos then
			local escapeDir = (repVector and repVector.Magnitude > 0.01) and repVector.Unit
				or (moveDir and moveDir.Magnitude > 0.01 and moveDir.Unit)
				or Vector3.new(0, 0, 1)
			local emergencyPos = playerPos + (escapeDir * 18.0)
			if boss1ArenaCenter and not isInsideBoss1Arena(emergencyPos, playerPos) then
				emergencyPos = playerPos + (boss1ArenaCenter - playerPos).Unit * 15.0
			end
			local snappedEmerg, hasFloorEmerg = geometry.GetFloorPosition(emergencyPos)
			candidatePos = hasFloorEmerg and snappedEmerg or emergencyPos
		end
	end

	-- 6. KH├ôA CHß║╢T ─ÉIß╗éM AN TO├ÇN Vß╗¬A T├îM ─É╞»ß╗óC Kß║╛T Hß╗óP OPPORTUNISTIC RETARGETING:
	if candidatePos then
		-- Nß║┐u ─æiß╗âm c┼⌐ vß║½n an to├án nh╞░ng ─æiß╗âm mß╗¢i gß║ºn h╞ín v╞░ß╗út trß╗Öi (>= HYSTERESIS_THRESHOLD studs):
		-- -> Bß║╗ l├íi sang ─æiß╗âm mß╗¢i gß║ºn h╞ín ngay lß║¡p tß╗⌐c (v├¡ dß╗Ñ: n├⌐ dß║úi xanh vß╗½a biß║┐n mß║Ñt chß╗ë c├ích 2-3 studs thay v├¼ chß║íy 15 studs ra m├⌐p)!
		-- Ng╞░ß╗úc lß║íi, nß║┐u ─æiß╗âm mß╗¢i kh├┤ng gß║ºn h╞ín ─æß╗º nhiß╗üu -> Tiß║┐p tß╗Ñc giß╗» ─æiß╗âm c┼⌐ ─æß╗â tr├ính rung giß║¡t
		if isOldPointStillSafe then
			local newDist = (candidatePos - playerPos).Magnitude
			if (lockedDist - newDist) >= HYSTERESIS_THRESHOLD then
				lockedSafeSpot = candidatePos
				lockedHazardCount = currentHazardCount
				local finalDist = math.floor(newDist * 10) / 10
				return true, candidatePos, hazardName, finalDist
			else
				local finalDist = math.floor(lockedDist * 10) / 10
				return true, lockedSafeSpot, hazardName, finalDist
			end
		end

		lockedSafeSpot = candidatePos
		lockedHazardCount = currentHazardCount
		local finalDist = math.floor((candidatePos - playerPos).Magnitude * 10) / 10
		return true, candidatePos, hazardName, finalDist
	elseif isOldPointStillSafe then
		-- Kh├┤ng t├¼m thß║Ñy candidatePos mß╗¢i tß╗æt h╞ín -> Tiß║┐p tß╗Ñc giß╗» ─æiß╗âm c┼⌐
		local finalDist = math.floor(lockedDist * 10) / 10
		return true, lockedSafeSpot, hazardName, finalDist
	end

	lockedSafeSpot = nil
	lockedHazardCount = 0
	return true, nil, hazardName, 0
end

return safeSpot
