--!nocheck
-- HazardScannerV2 – Safe Spot Engine (Adaptive Direction & Continuous Ray Marching + Binary Bisection)
-- Thiết kế thế hệ mới:
-- 1. ADAPTIVE DIRECTION SEARCH (2 Pha):
--    - Phase 1 (Seed ~62% tia): Kéo tia (warp) theo quán tính di chuyển (Momentum) hoặc ra xa nguồn nguy hiểm.
--    - Phase 2 (Refine ~38% tia): Bắn chùm tia hội tụ quanh K hướng thoát tốt nhất từ Phase 1 (±17°).
-- 2. DISTANCE SEARCH & BINARY BISECTION:
--    - Ray Marching với stride tăng dần kết hợp Warm Start (nhớ khoảng cách tia trước).
--    - Bisect Exit 6 vòng thu hẹp sai số xuống ~0.01 studs -> nhân vật chỉ cần bước vừa đủ ra mép nguy hiểm.
-- 3. PHYSICAL WALL COLLISION:
--    - Raycast kiểm tra địa hình map (CanCollide / Terrain) để không bao giờ chọn điểm né đâm vào tường.
-- 4. SINGLE SOURCE OF TRUTH:
--    - Tích hợp trực tiếp với danger.luau (hỗ trợ cả Hitbox Hình Đĩa & Hình Chữ Nhật, 7 vành Boss 3, Threat Corridor, Sanctuary).
-- 5. TACTICAL CYBERPUNK VISUALS:
--    - Origin Dot, Ray Beams (Xanh=Thoát, Đỏ=Chặn, Vàng=Chọn), Safe Marker Halo + Beacon + Billboard nhãn khoảng cách.

--// Imports
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local contextual = require("@routes/DungeonQuest/core/contextual")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local danger = require("@routes/DungeonQuest/core/hazardScannerV2/danger")
local temporal = require("@routes/DungeonQuest/core/hazardScannerV2/temporal")
local corridor = require("@routes/DungeonQuest/core/hazardScannerV2/corridor")

--// Table
local safeSpotV2 = {}

--// Configuration (UI Control)
local enabled = true
local rayCount = 24             -- Số lượng vector quét (8..48, mặc định 24)
local maxRadius = 75            -- Bán kính quét tối đa (studs, mặc định 75 bao phủ hầu hết Boss AoE)
local escapeMargin = 0.8        -- Khoảng đệm an toàn sau khi ra khỏi mép (studs)
local showVectors = true        -- Hiển thị các tia vector quét
local showMarker = true         -- Hiển thị Marker cột sáng tại Safe Spot
local showVectorNumbers = false -- Đánh số thứ tự từng tia
local adaptive = true           -- Bật/tắt Adaptive Direction Search
local enableScoringV2 = true    -- Bật/tắt Safe Spot Scoring 2.0 (Spatial Quality & Anti-Corner)

--// Constants
local MARCH_STEP = 0.75         -- Bước sweep cơ bản (studs)
local BISECT_ITER = 6           -- Vòng bisect khóa chính xác mép (~0.01 studs)
local RAY_POOL_MAX = 48         -- Kích thước pool tia tối đa
local RAY_HEIGHT_OFFSET = 0.25  -- Độ cao vẽ tia trên mặt sàn
local AWAY_BONUS = 1.0          -- Điểm cộng tie-break nếu hướng ra xa tâm nguy hiểm
local FORWARD_BONUS = 1.0       -- Điểm cộng tie-break nếu thuận hướng đang chạy
local TIE_BAND = 0.75           -- Biên chênh lệch khoảng cách (studs) để áp dụng tie-break
local RESCAN_THROTTLE = 0.20    -- Giây tối thiểu giữa 2 lần quét mới
local VALIDATE_INTERVAL = 0.10  -- Tần suất kiểm tra độ an toàn của điểm đang chốt

--// Constants Adaptive Direction Search
local BIAS_WARP = 0.5           -- Hệ số kéo tia seed về bias dir (0..1)
local SEED_FRAC = 0.62          -- Tỷ lệ tia seed trên tổng số tia
local SUB_ARC = 0.30            -- Nửa cung (rad) phủ tia refine quanh tia tốt (~17.2°)
local REFINE_K_MAX = 3          -- Số hướng seed tốt nhất để chia nhỏ
local DUP_EPS = 0.06            -- Ngưỡng góc trùng lặp (rad)

--// Visual Colors (Cyberpunk Tactical Theme)
local COLOR_FOUND = Color3.fromRGB(0, 255, 140)      -- Emerald Green khi tia thoát thành công
local COLOR_BLOCKED = Color3.fromRGB(255, 55, 65)    -- Crimson Red khi tia bị chặn
local COLOR_CHOSEN = Color3.fromRGB(255, 215, 0)     -- Radiant Gold cho tia được chọn
local COLOR_EMERGENCY = Color3.fromRGB(255, 175, 40) -- Amber Gold khi tháo chạy khẩn cấp ra khỏi AoE khổng lồ
local COLOR_PHASE_THROUGH = Color3.fromRGB(0, 230, 255) -- Electric Cyan cho điểm nổ đón đầu (Phase-Through)
local COLOR_ORIGIN = Color3.fromRGB(0, 220, 255)     -- Hologram Cyan cho điểm bắt đầu quét
local COLOR_MARKER = Color3.fromRGB(0, 255, 140)     -- Emerald Green cho Safe Marker

--// State
local isInDanger = false
local isEmergencyMode = false
local isPhaseThroughMode = false
local currentThreatName: string? = nil
local safeSpotPos: Vector3? = nil
local safeSpotDist = 0
local chosenRayIndex: number? = nil
local scanOrigin: Vector3? = nil
local scanFloorY: number? = nil
local rayResults: { any }? = nil
local lastScanTime = 0
local lastValidateTime = 0
local heartbeatConn: RBXScriptConnection? = nil
local dangerConn: RBXScriptConnection? = nil

--// Adaptive Pool State
local rayDirs: { Vector3 } = {}
local rayDirsBuilt = false
local slotDist: { [number]: number? } = {}
local seedLen = 0

--// Callbacks
local safeSpotCallbacks = {}

--// Visual Instances
type RayVisualItem = {
	beam: Part,
	tip: Part,
	label: BillboardGui?,
}

local visualFolder: Folder? = nil
local rayItems: { [number]: RayVisualItem } = {}
local originDot: Part? = nil
local markerHalo: Part? = nil
local markerBeacon: Part? = nil
local markerLabel: BillboardGui? = nil

--// Dọn dẹp folder rác cũ nếu có
local oldFolder = Workspace:FindFirstChild("HazardScannerV2_SafeSpotVisuals")
if oldFolder then
	pcall(function() oldFolder:Destroy() end)
end

--==============================================================================
-- HELPERS
--==============================================================================

local function getPlayerRoot()
	local lp = (services and services.player) or Players.LocalPlayer
	local char = lp and lp.Character
	if not char or not char.Parent then return nil end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then return nil end
	return char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
end

local function getPlayerState()
	local lp = (services and services.player) or Players.LocalPlayer
	local char = lp and lp.Character
	if not char or not char.Parent then return nil, nil, nil end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then return nil, nil, nil end
	local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
	if not root then return nil, nil, nil end

	local footY = root.Position.Y - 2.5
	return root.Position, hum, footY, root
end

-- Lấy hướng đang chạy thực tế của người chơi (MoveDirection hoặc Vận tốc)
local function getPlayerRunningDirection(root, hum)
	if hum and hum.Health > 0 then
		local moveDir = hum.MoveDirection
		if moveDir and moveDir.Magnitude > 0.1 then
			return Vector3.new(moveDir.X, 0, moveDir.Z).Unit
		end
	end
	if root and root.Parent then
		local vel = Vector3.zero
		pcall(function()
			vel = root.AssemblyLinearVelocity or root.Velocity or Vector3.zero
		end)
		local hVel = Vector3.new(vel.X, 0, vel.Z)
		if hVel.Magnitude >= 1.5 then
			return hVel.Unit
		end
	end
	return nil
end

--==============================================================================
-- PHYSICAL MAP GEOMETRY COLLISION (RAYCASTING)
--==============================================================================

local wallRayParams = RaycastParams.new()
wallRayParams.FilterType = Enum.RaycastFilterType.Exclude
wallRayParams.IgnoreWater = true
local cachedWallIgnore: { Instance } = {}
local lastWallFilterTime = 0

local function isIgnoredRayInstance(inst: Instance?): boolean
	if not inst then return true end
	if not inst.Parent then return true end

	-- Bỏ qua nhân vật người chơi
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Character and (inst == p.Character or inst:IsDescendantOf(p.Character)) then
			return true
		end
	end

	-- Bỏ qua tất cả các Part của Hazard đang xuất hiện (tránh ngộ nhận chiêu thức là tường Map)
	local active = danger.GetActiveHazards()
	if active then
		for part, data in pairs(active) do
			if inst == part or inst:IsDescendantOf(part) then
				return true
			end
			if data.level1Parent and data.level1Parent.Parent and data.level1Parent ~= Workspace then
				if inst == data.level1Parent or inst:IsDescendantOf(data.level1Parent) then
					return true
				end
			end
		end
	end

	-- Bỏ qua hiệu ứng, drops, đạn, visuals
	local effects = Workspace:FindFirstChild("effects")
	if effects and (inst == effects or inst:IsDescendantOf(effects)) then
		return true
	end
	local drops = Workspace:FindFirstChild("drops")
	if drops and (inst == drops or inst:IsDescendantOf(drops)) then
		return true
	end
	local rayIgnore = Workspace:FindFirstChild("RaycastIgnore")
	if rayIgnore and (inst == rayIgnore or inst:IsDescendantOf(rayIgnore)) then
		return true
	end
	if visualFolder and (inst == visualFolder or inst:IsDescendantOf(visualFolder)) then
		return true
	end

	return false
end

local function updateWallFilter()
	local now = os.clock()
	if now - lastWallFilterTime < 0.25 then return end
	lastWallFilterTime = now

	table.clear(cachedWallIgnore)
	local lp = (services and services.player) or Players.LocalPlayer
	if lp and lp.Character then
		table.insert(cachedWallIgnore, lp.Character)
	end
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= lp and p.Character then
			table.insert(cachedWallIgnore, p.Character)
		end
	end
	local rayIgnore = Workspace:FindFirstChild("RaycastIgnore")
	if rayIgnore then
		table.insert(cachedWallIgnore, rayIgnore)
	end
	local effects = Workspace:FindFirstChild("effects")
	if effects then
		table.insert(cachedWallIgnore, effects)
	end
	local drops = Workspace:FindFirstChild("drops")
	if drops then
		table.insert(cachedWallIgnore, drops)
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
	local active = danger.GetActiveHazards()
	if active then
		for part, data in pairs(active) do
			if part and part.Parent then
				table.insert(cachedWallIgnore, part)
			end
			if data.level1Parent and data.level1Parent.Parent and data.level1Parent ~= Workspace then
				table.insert(cachedWallIgnore, data.level1Parent)
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

	for _ = 1, 6 do
		local hit = Workspace:Raycast(currentOrigin, dir * remainingDist, wallRayParams)
		if not hit then
			return nil
		end
		local dist = (hit.Position - currentOrigin).Magnitude
		totalDist += dist

		local inst = hit.Instance
		if inst and not isIgnoredRayInstance(inst) then
			-- Bỏ qua sàn dốc/mặt phẳng có thể bước lên (Normal.Y > 0.65 không phải là tường thẳng đứng cản đường)
			if (inst:IsA("Terrain") or inst.CanCollide) and (inst.CanQuery ~= false) then
				if hit.Normal.Y <= 0.65 then
					return totalDist
				end
			end
		end

		table.insert(cachedWallIgnore, hit.Instance)
		wallRayParams.FilterDescendantsInstances = cachedWallIgnore
		remainingDist = maxDist - totalDist
		if remainingDist <= 0.5 then
			break
		end
		currentOrigin = hit.Position + dir * 0.15
	end
	return nil
end

--==============================================================================
-- SAFETY EVALUATION ENGINE
--==============================================================================

local function isPointSafe(p: Vector3, pad: number): boolean
	return danger.IsPointSafe(p, pad)
end

local function sampleSafe(origin: Vector3, dir: Vector3, dist: number, pad: number): boolean
	local base = Vector3.new(origin.X + dir.X * dist, origin.Y, origin.Z + dir.Z * dist)
	return isPointSafe(base, pad)
end

-- Khóa chính xác mép hiểm họa bằng Binary Bisection (6 vòng = sai số ~0.01 studs)
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

-- Stride sweep tăng dần: nông -> mịn, sâu -> thô (tiết kiệm CPU)
local function strideFor(dist: number): number
	if dist < 8 then
		return MARCH_STEP
	elseif dist < 20 then
		return MARCH_STEP * 2
	elseif dist < 45 then
		return MARCH_STEP * 4
	end
	return MARCH_STEP * 6
end

--==============================================================================
-- ADAPTIVE DIRECTION SEARCH
--==============================================================================

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

-- Seed rays: phủ 360° nhưng warp về phía biasDir (đà chạy)
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

-- Refine rays: quanh mỗi hướng tốt, rải thêm tia trong cung ±SUB_ARC
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
						if tooClose(ex, nd) then dup = true; break end
					end
					for _, ex in ipairs(out) do
						if tooClose(ex, nd) then dup = true; break end
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

local function topCandidateDirs(cands: { any }, k: number): { Vector3 }
	local sorted = {}
	for _, c in ipairs(cands) do
		table.insert(sorted, c)
	end
	table.sort(sorted, function(a, b)
		if enableScoringV2 and a.score and b.score then
			if math.abs(a.score - b.score) > 0.1 then
				return a.score > b.score
			end
			return a.found < b.found
		else
			if math.abs(a.found - b.found) > TIE_BAND then
				return a.found < b.found
			end
			return (a.tie or 0) > (b.tie or 0)
		end
	end)
	local out = {}
	for i = 1, math.min(k, #sorted) do
		table.insert(out, sorted[i].dir)
	end
	return out
end

--==============================================================================
-- DISTANCE MARCHING & BISECTION PER RAY
--==============================================================================

local function resolveExitDistance(
	origin: Vector3,
	dir: Vector3,
	hint: number?,
	pad: number
): (number?, number, string?, number?)
	-- 1. Giới hạn bởi Tường Map
	local wallDist = getWallDistance(origin, dir, maxRadius)
	local maxSearch = wallDist and math.max(0.5, wallDist - 0.8) or maxRadius

	-- 2. Giới hạn bởi Boss Arena Radius
	local isBossAreaActive, bossAreaRadius, bossAreaCenter = contextual.GetActiveBossArea()
	if isBossAreaActive and bossAreaCenter and bossAreaRadius and bossAreaRadius > 0 then
		local bCenter = Vector3.new(bossAreaCenter.X, 0, bossAreaCenter.Z)
		local o2D = Vector3.new(origin.X, 0, origin.Z)
		local toCenter = bCenter - o2D
		local proj = toCenter.X * dir.X + toCenter.Z * dir.Z
		local perpSq = (toCenter.X * toCenter.X + toCenter.Z * toCenter.Z) - (proj * proj)
		if perpSq < (bossAreaRadius * bossAreaRadius) then
			local halfChord = math.sqrt(bossAreaRadius * bossAreaRadius - perpSq)
			local arenaDist = proj + halfChord
			if arenaDist > 0 and arenaDist < maxSearch then
				maxSearch = math.max(0.5, arenaDist - 0.5)
			end
		end
	end

	-- 3. Warm start hint nếu có
	if hint and hint >= MARCH_STEP and hint <= maxSearch then
		if sampleSafe(origin, dir, hint, pad) then
			local lo = math.max(0, hint - MARCH_STEP)
			while lo > 0 do
				if not sampleSafe(origin, dir, lo, pad) then
					local exitDist = bisectExit(origin, dir, lo, hint, pad)
					if exitDist <= maxSearch then
						return exitDist, exitDist, "safe", wallDist
					end
					break
				end
				lo -= MARCH_STEP
			end
			local exitDist = bisectExit(origin, dir, 0, hint, pad)
			if exitDist <= maxSearch then
				return exitDist, exitDist, "safe", wallDist
			end
		end
	end

	-- 4. Sweep từ 0 với stride tăng dần
	local prevD = 0
	local d = strideFor(0)
	while d <= maxSearch do
		if sampleSafe(origin, dir, d, pad) then
			local exitDist = bisectExit(origin, dir, prevD, d, pad)
			if exitDist <= maxSearch then
				return exitDist, exitDist, "safe", wallDist
			end
			return nil, wallDist or maxSearch, "wall", wallDist
		end
		prevD = d
		d += strideFor(d)
	end

	if wallDist and wallDist < maxRadius then
		return nil, wallDist, "wall", wallDist
	end

	return nil, maxRadius, "blocked", wallDist
end

--==============================================================================
-- VISUALS (CYBERPUNK TACTICAL BEAMS & MARKERS)
--==============================================================================

local function ensureVisualFolder(): Folder
	if visualFolder and visualFolder.Parent then return visualFolder end
	visualFolder = Instance.new("Folder")
	visualFolder.Name = "HazardScannerV2_SafeSpotVisuals"
	visualFolder.Parent = Workspace
	return visualFolder
end

local function createRayItem(index: number): RayVisualItem
	local folder = ensureVisualFolder()

	local beam = Instance.new("Part")
	beam.Name = "HS2_RayBeam_" .. tostring(index)
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
	tip.Name = "HS2_RayTip_" .. tostring(index)
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
	label.Name = "HS2_RayBadge_" .. tostring(index)
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
	if not originDot or not originDot.Parent then
		originDot = Instance.new("Part")
		originDot.Name = "HS2_OriginDot"
		originDot.Material = Enum.Material.Neon
		originDot.Color = COLOR_ORIGIN
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
	if not markerHalo or not markerHalo.Parent then
		markerHalo = Instance.new("Part")
		markerHalo.Name = "HS2_MarkerHalo"
		markerHalo.Material = Enum.Material.Neon
		markerHalo.Color = COLOR_MARKER
		markerHalo.Shape = Enum.PartType.Cylinder
		markerHalo.Size = Vector3.new(0.06, 3.8, 3.8)
		markerHalo.Transparency = 0.35
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
		markerBeacon.Name = "HS2_MarkerBeacon"
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
		markerLabel.Name = "HS2_MarkerLabel"
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

	local playerRad = danger.GetPlayerRadius()
	local diameter = math.max(0.4, playerRad * 2)

	local spotFloorY = (scanFloorY ~= nil) and scanFloorY or (safeSpotPos.Y - 2.5)

	-- Bổ trợ quét sàn cục bộ
	updateWallFilter()
	local localRayOrigin = Vector3.new(safeSpotPos.X, spotFloorY + 2.5, safeSpotPos.Z)
	local floorHit = Workspace:Raycast(localRayOrigin, Vector3.new(0, -5.0, 0), wallRayParams)
	if floorHit and floorHit.Instance and (floorHit.Instance:IsA("Terrain") or floorHit.Instance.CanCollide) then
		spotFloorY = floorHit.Position.Y
	end

	local markerColor = isEmergencyMode and COLOR_EMERGENCY
		or (isPhaseThroughMode and COLOR_PHASE_THROUGH or COLOR_MARKER)

	-- 1. markerHalo (Đĩa tròn Safe Spot dán sát mặt sàn)
	markerHalo.Size = Vector3.new(0.06, diameter, diameter)
	markerHalo.Color = markerColor
	markerHalo.Transparency = 0.35
	markerHalo.CFrame = CFrame.new(safeSpotPos.X, spotFloorY + 0.03, safeSpotPos.Z) * CFrame.Angles(0, 0, math.rad(90))

	-- 2. markerBeacon (Cột sáng vút lên cao)
	markerBeacon.Color = markerColor
	markerBeacon.Transparency = 0.55
	markerBeacon.CFrame = CFrame.new(safeSpotPos.X, spotFloorY + 9.0, safeSpotPos.Z)

	-- 3. markerLabel (Billboard khoảng cách)
	local container = markerLabel:FindFirstChild("Container")
	if container then
		local stroke = container:FindFirstChildOfClass("UIStroke")
		if stroke then stroke.Color = markerColor end
		local text = container:FindFirstChild("Text")
		if text and text:IsA("TextLabel") then
			local hazardInfo = currentThreatName and (" | " .. currentThreatName) or ""
			if isEmergencyMode then
				text.Text = string.format("<b>⚠️ ESCAPE</b> <font color='rgb(255,255,255)'>(%.1fm)</font><font color='rgb(255,200,80)'>%s</font>", safeSpotDist, hazardInfo)
				text.TextColor3 = COLOR_EMERGENCY
			elseif isPhaseThroughMode then
				text.Text = string.format("<b>⚡ PHASE-THROUGH</b> <font color='rgb(255,255,255)'>(%.1fm)</font><font color='rgb(255,200,80)'>%s</font>", safeSpotDist, hazardInfo)
				text.TextColor3 = COLOR_PHASE_THROUGH
			else
				text.Text = string.format("<b>🎯 SAFE</b> <font color='rgb(255,255,255)'>(%.1fm)</font><font color='rgb(255,200,80)'>%s</font>", safeSpotDist, hazardInfo)
				text.TextColor3 = COLOR_MARKER
			end
		end
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
				local color = isChosen and (isEmergencyMode and COLOR_EMERGENCY or COLOR_CHOSEN)
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
					tSize = (entry.blockedReason == "wall") and 0.40 or 0.25
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
				if item.label then item.label.Enabled = false end
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
			if item.label then item.label.Enabled = false end
		end
		if originDot then originDot.Transparency = 1 end
	end

	if safeSpotPos then
		showMarkerVisual()
	else
		hideMarkerVisual()
	end
end

--==============================================================================
-- SAFE SPOT SEARCH ENGINE
--==============================================================================

local function fireCallbacks(hasSpot: boolean, pos: Vector3?, hazardName: string?, dist: number, chosen: number?, isEmergency: boolean?)
	for _, cb in ipairs(safeSpotCallbacks) do
		pcall(cb, hasSpot, pos, hazardName, dist, chosen, isEmergency)
	end
end

local function clearRadar()
	isInDanger = false
	isEmergencyMode = false
	isPhaseThroughMode = false
	currentThreatName = nil
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
	hideAllVisuals()
	fireCallbacks(false, nil, nil, 0, nil, false)
end

--==============================================================================
-- SAFE SPOT SCORING 2.0 (SPATIAL QUALITY & ANTI-CORNER ENGINE)
--==============================================================================

-- Tính khoảng cách (studs) từ điểm P(px, pz) tới mép ngoài của 1 hình Hazard
local function getDistanceToHazardEdge(px: number, pz: number, shape: any): number
	local sx = shape.x or 0
	local sz = shape.z or 0
	local dx = px - sx
	local dz = pz - sz

	if shape.shape == "circle" and shape.radius then
		local dist = math.sqrt(dx * dx + dz * dz)
		return dist - shape.radius
	elseif shape.shape == "box" and shape.halfWidth and shape.halfLength and shape.fwd2D and shape.right2D then
		local projL = math.abs(dx * shape.fwd2D.X + dz * shape.fwd2D.Z)
		local projW = math.abs(dx * shape.right2D.X + dz * shape.right2D.Z)
		local dW = math.max(0, projW - shape.halfWidth)
		local dL = math.max(0, projL - shape.halfLength)
		if projW <= shape.halfWidth and projL <= shape.halfLength then
			return -math.min(shape.halfWidth - projW, shape.halfLength - projL)
		end
		return math.sqrt(dW * dW + dL * dL)
	elseif shape.shape == "compound_multiring" then
		local dist = math.sqrt(dx * dx + dz * dz)
		local maxR = shape.maxRadius or 40.0
		return dist - maxR
	end

	local dist = math.sqrt(dx * dx + dz * dz)
	return dist - 5.0
end

-- Đánh giá chất lượng không gian quanh điểm đích: Độ thoáng tới chiêu gần nhất & Mật độ chiêu xung quanh
local function evaluateHazardSpatialQuality(px: number, pz: number, hazards: any): (number, number)
	if not hazards or next(hazards) == nil then
		return 999.0, 0
	end

	local minEdgeDist = 999.0
	local clusterCount = 0
	local CLUSTER_RADIUS_SQ = 25.0 * 25.0

	for _, data in pairs(hazards) do
		local shape = data.shape
		if shape then
			local sx = shape.x or 0
			local sz = shape.z or 0
			local dCenterSq = (px - sx)^2 + (pz - sz)^2
			if dCenterSq <= CLUSTER_RADIUS_SQ then
				clusterCount += 1
			end

			local edgeDist = getDistanceToHazardEdge(px, pz, shape)
			if edgeDist < minEdgeDist then
				minEdgeDist = edgeDist
			end
		end
	end

	return minEdgeDist, clusterCount
end

-- Chấm điểm chiến thuật toàn diện cho một điểm Safe Spot ứng viên
local function computeCandidateTacticalScore(
	origin: Vector3,
	dir: Vector3,
	foundDist: number,
	wallDist: number?,
	awayVector: Vector3?,
	moveDir: Vector3?,
	hazards: any,
	isBossAreaActive: boolean?,
	bossAreaRadius: number?,
	bossAreaCenter: Vector3?,
	isInnerDeadzoneActive: boolean?,
	innerDeadzoneRadius: number?,
	rayIndex: number?,
	allResults: { any }?,
	seedCount: number?,
	threatData: any?
): (number, boolean, boolean, boolean, number)
	local targetX = origin.X + dir.X * foundDist
	local targetZ = origin.Z + dir.Z * foundDist

	-- 1. Distance Utility: Thoát nhanh là cần thiết, phạt nhẹ tuyến tính theo quãng đường
	local sDist = -foundDist * 1.2

	-- 2. Hazard Clearance: Điểm đến thoáng rộng, cách xa các mép chiêu thức khác
	local minEdgeDist, clusterCount = evaluateHazardSpatialQuality(targetX, targetZ, hazards)
	local sClearance = 0
	if minEdgeDist < 1.2 then
		sClearance = -14.0 -- Quá sát mép chiêu khác, rất nguy hiểm
	elseif minEdgeDist < 2.5 then
		sClearance = -5.0
	elseif minEdgeDist >= 6.0 then
		sClearance = 7.0   -- Vùng mở lý tưởng
	else
		sClearance = (minEdgeDist - 2.5) * 3.0
	end

	-- 3. Hazard Density Penalty: Tránh vùng tập trung cụm chiêu thức dày đặc
	local sDensity = -clusterCount * 2.5

	-- 4. Wall Clearance: Tránh bị ép vào chân tường
	local wallMargin = (wallDist or maxRadius) - foundDist
	local sWall = 0
	if wallMargin < 1.5 then
		sWall = -28.0 -- Cực kỳ nguy hiểm: dừng ngay sát mũi tường
	elseif wallMargin < 3.0 then
		sWall = -14.0 -- Hẹp sát vách
	elseif wallMargin < 5.0 then
		sWall = -4.0
	elseif wallMargin >= 9.0 then
		sWall = 5.0   -- Không gian lùi sâu, an toàn
	end

	-- 5. Anti-Corner / Dead-End Trap Detection: Phát hiện góc chết chữ V/U của map
	local sCorner = 0
	local totalSeeds = seedCount or seedLen
	if wallMargin < 4.0 and allResults and rayIndex and totalSeeds and totalSeeds > 2 and rayIndex <= totalSeeds then
		local prevIdx = ((rayIndex - 2) % totalSeeds) + 1
		local nextIdx = (rayIndex % totalSeeds) + 1
		local prevEntry = allResults[prevIdx]
		local nextEntry = allResults[nextIdx]
		local prevWallBlocked = prevEntry and (prevEntry.blockedReason == "wall" or (prevEntry.length and prevEntry.length < 6.0))
		local nextWallBlocked = nextEntry and (nextEntry.blockedReason == "wall" or (nextEntry.length and nextEntry.length < 6.0))
		if prevWallBlocked and nextWallBlocked then
			sCorner = -22.0 -- Bị kẹp giữa 2 bức tường tạo thành góc chết!
		end
	end

	-- 6. Arena Center Bias & Donut Sweet-Spot (Hỗ trợ cấu hình Donut riêng cho từng Boss)
	local sCenter = 0
	if isBossAreaActive and bossAreaCenter and bossAreaRadius and bossAreaRadius > 0 then
		local bCenter = Vector3.new(bossAreaCenter.X, 0, bossAreaCenter.Z)
		local targetPos2D = Vector3.new(targetX, 0, targetZ)
		local distToCenter = (targetPos2D - bCenter).Magnitude

		if isInnerDeadzoneActive and innerDeadzoneRadius and innerDeadzoneRadius > 0 then
			-- CHẾ ĐỘ BÁNH DONUT: Giới hạn vùng né trong vành khăn giữa Inner Radius và Outer Radius
			if distToCenter < innerDeadzoneRadius then
				sCenter -= 35.0 -- Phạt cực nặng nếu chui vào lỗ Donut cấm né (áp sát Boss)!
			elseif distToCenter > bossAreaRadius then
				sCenter -= 35.0 -- Phạt cực nặng nếu văng ra ngoài vỏ Donut!
			else
				-- Điểm lý tưởng nhất nằm ở chính giữa thịt bánh Donut
				local midR = (innerDeadzoneRadius + bossAreaRadius) * 0.5
				local halfThick = (bossAreaRadius - innerDeadzoneRadius) * 0.5
				local dev = math.abs(distToCenter - midR)
				if halfThick > 0.5 then
					sCenter += math.max(0, 1.0 - (dev / halfThick)) * 8.0
				end
			end
		else
			-- CHẾ ĐỘ ĐĨA TRÒN THƯỜNG (Boss không bật Inner Deadzone):
			local centerRatio = distToCenter / bossAreaRadius
			if centerRatio > 0.88 then
				sCenter -= 16.0 -- Quá gần rìa ngoài sàn đấu Boss
			elseif centerRatio > 0.70 then
				sCenter -= 6.0
			elseif centerRatio < 0.45 then
				sCenter += 6.0  -- Khu vực trung tâm thoáng
			end

			local toCenterDir = (bCenter - Vector3.new(origin.X, 0, origin.Z))
			if toCenterDir.Magnitude > 0.1 then
				local dot = dir:Dot(toCenterDir.Unit)
				sCenter += dot * 4.0
			end
		end
	end

	-- 7. Momentum & Escape Alignment: Thuận theo đà chạy và hướng xa tâm nguy hiểm
	local sMomentum = 0
	if awayVector then
		sMomentum += math.max(0, dir:Dot(awayVector)) * 3.0
	end
	if moveDir then
		sMomentum += math.max(0, dir:Dot(moveDir)) * 2.0
	end

	-- 8. Secondary Escape Degree: Độ rộng hành lang an toàn (nhiều tia bên cạnh cũng an toàn)
	local sSector = 0
	if allResults and rayIndex and totalSeeds and totalSeeds > 2 and rayIndex <= totalSeeds then
		local leftIdx = ((rayIndex - 2) % totalSeeds) + 1
		local rightIdx = (rayIndex % totalSeeds) + 1
		if allResults[leftIdx] and allResults[leftIdx].status == "found" then
			sSector += 2.0
		end
		if allResults[rightIdx] and allResults[rightIdx].status == "found" then
			sSector += 2.0
		end
	end

	-- 9. Phase 2: Temporal Awareness (Arrival Time, Future Kinematics & Phase-Through)
	local sTemporal = 0
	local isPhaseThrough = false
	local isFutureColliding = false
	local isPathIntercepted = false
	local tArrival = 0

	if temporal and temporal.IsEnabled() then
		local walkSpeed = temporal.GetPlayerWalkSpeed()
		local tDelta, fCol, pInter, pThrough, tArr = temporal.EvaluateCandidateTemporal(
			origin,
			dir,
			foundDist,
			walkSpeed,
			hazards,
			threatData
		)
		sTemporal = tDelta
		isFutureColliding = fCol
		isPathIntercepted = pInter
		isPhaseThrough = pThrough
		tArrival = tArr
	end

	-- 10. Threat Corridor Specific Penalty & Reward:
	local sCorridor = 0
	if threatData and threatData.shape and threatData.shape.corridor then
		local corr = threatData.shape.corridor
		local fwdDot = dir:Dot(corr.fwd2D)
		if fwdDot > 0.45 then
			sCorridor -= fwdDot * 16.0 -- Phạt nặng chạy dọc theo hướng bay của đạn trên đường ray
		end
		local rightDot = math.abs(dir:Dot(corr.right2D))
		if rightDot > 0.65 then
			sCorridor += rightDot * 6.0 -- Thưởng thoát vuông góc sang 2 bên sườn hành lang
		end
	end

	local totalScore = sDist + sClearance + sDensity + sWall + sCorner + sCenter + sMomentum + sSector + sTemporal + sCorridor
	return totalScore, isPhaseThrough, isFutureColliding, isPathIntercepted, tArrival
end

-- Tìm điểm an toàn gần nhất
function safeSpotV2.FindNearestSafeSpot(origin: Vector3?, forceRescan: boolean?): (Vector3?, boolean, number)
	if not enabled then
		clearRadar()
		return nil, false, 0
	end

	local now = os.clock()
	local playerPos, hum, footY, root = getPlayerState()
	local centerPos = origin or playerPos
	if not centerPos then
		clearRadar()
		return nil, false, 0
	end

	-- 1. Kiểm tra trạng thái nguy hiểm của Player
	local inDanger, threatData, threatType = danger.IsPlayerInDanger()
	local threatName = threatData and (threatData.name or threatData.Name) or nil

	if not inDanger then
		if isInDanger then
			isInDanger = false
			currentThreatName = nil
			fireCallbacks(false, safeSpotPos, nil, safeSpotDist, chosenRayIndex, false)
		end

		-- Kiểm tra xem điểm Safe Spot cũ có bị chiêu thức di động (như CrissCross Threat Corridor) đè lên không
		if safeSpotPos then
			if not isPointSafe(safeSpotPos, escapeMargin) then
				-- Điểm Safe phía trước đã bị hiểm họa mới đè lên -> Hủy bỏ ngay để người chơi không chạy vào chỗ chết!
				safeSpotPos = nil
				safeSpotDist = 0
				chosenRayIndex = nil
				updateVisuals()
				fireCallbacks(false, nil, nil, 0, nil, false)
				return nil, false, 0
			else
				safeSpotDist = (safeSpotPos - centerPos).Magnitude
			end
		end

		return safeSpotPos, (safeSpotPos ~= nil), safeSpotDist
	end

	isInDanger = true
	currentThreatName = threatName

	-- 2. Kiểm tra chốt Latch: nếu Safe Spot đang có vẫn TUYỆT ĐỐI AN TOÀN và chưa đến hạn rescan (không latch nếu đang ở emergency mode)
	if not forceRescan and safeSpotPos and not isEmergencyMode and (now - lastScanTime < RESCAN_THROTTLE) then
		if isPointSafe(safeSpotPos, escapeMargin) then
			safeSpotDist = (safeSpotPos - centerPos).Magnitude
			updateVisuals()
			return safeSpotPos, true, safeSpotDist
		end
	end

	lastScanTime = now
	scanOrigin = centerPos
	scanFloorY = footY or (centerPos.Y - 2.5)

	-- 3. Xác định Bias Direction (hướng chạy hoặc hướng thoát khỏi tâm nguy hiểm)
	local moveDir = getPlayerRunningDirection(root, hum)
	local awayVector = nil

	if threatType == "Threat Corridor" and threatData and threatData.shape and threatData.shape.corridor then
		-- THREAT CORRIDOR: Thoát vuông góc sang 2 bên sườn hành lang (Side-step off the tracks)
		-- Cự ly thoát chỉ 3 - 8 studs, tuyệt đối không chạy dọc đường ray trước mũi đạn!
		local corr = threatData.shape.corridor
		local _, _, _, _, _, lateralEscapeDir = corridor.GetThreatMetrics(centerPos, corr, threatData.motion, 0)
		if lateralEscapeDir and lateralEscapeDir.Magnitude > 0.1 then
			-- Nếu đang có đà chạy (moveDir), ưu tiên sườn bên phía đà chạy đang hướng tới
			if moveDir and moveDir.Magnitude > 0.1 then
				local rightDot = moveDir:Dot(corr.right2D)
				if rightDot > 0.15 then
					awayVector = corr.right2D
				elseif rightDot < -0.15 then
					awayVector = -corr.right2D
				else
					awayVector = lateralEscapeDir
				end
			else
				awayVector = lateralEscapeDir
			end
		end
	elseif threatData and threatData.shape then
		local shape = threatData.shape
		local tx = shape.x or 0
		local tz = shape.z or 0
		local dx = centerPos.X - tx
		local dz = centerPos.Z - tz
		if dx * dx + dz * dz > 0.01 then
			awayVector = Vector3.new(dx, 0, dz).Unit
		end
	end

	local biasDir = moveDir or awayVector

	-- 4. ADAPTIVE DIRECTION SEARCH: Xây dựng pool tia
	local totalCount = math.clamp(rayCount, 8, RAY_POOL_MAX)
	local countSeed = math.max(6, math.floor(totalCount * SEED_FRAC))
	local countRefine = totalCount - countSeed

	if not rayDirsBuilt or #rayDirs ~= totalCount then
		rayDirs = buildSeedDirs(countSeed, biasDir)
		seedLen = countSeed
	end

	local results: { any } = {}
	local candidates: { any } = {}

	local activeHazards = danger.GetActiveHazards()
	local isBossAreaActive, bossAreaRadius, bossAreaCenter, isInnerDeadzoneActive, innerDeadzoneRadius = contextual.GetActiveBossArea()

	-- Quét Phase 1: Seed Rays
	for i = 1, seedLen do
		local dir = rayDirs[i]
		local foundDist, blockedDist, blockedReason, wallDist = resolveExitDistance(centerPos, dir, slotDist[i], escapeMargin)

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
			wallDist = wallDist,
		}
		results[i] = entry
	end

	-- Chấm điểm Tactical Score 2.0 cho từng Seed Candidate
	for i = 1, seedLen do
		local entry = results[i]
		if entry.found then
			local tieScore = 0
			if awayVector then
				tieScore += math.max(0, entry.dir:Dot(awayVector)) * AWAY_BONUS
			end
			if moveDir then
				tieScore += math.max(0, entry.dir:Dot(moveDir)) * FORWARD_BONUS
			end

			local score, isPhaseThrough, isFutureColliding, isPathIntercepted, tArrival = computeCandidateTacticalScore(
				centerPos,
				entry.dir,
				entry.found,
				entry.wallDist,
				awayVector,
				moveDir,
				activeHazards,
				isBossAreaActive,
				bossAreaRadius,
				bossAreaCenter,
				isInnerDeadzoneActive,
				innerDeadzoneRadius,
				i,
				results,
				seedLen,
				threatData
			)

			table.insert(candidates, {
				i = entry.i,
				rayIdx = i,
				dir = entry.dir,
				found = entry.found,
				tie = tieScore,
				score = score,
				wallDist = entry.wallDist,
				isPhaseThrough = isPhaseThrough,
				isFutureColliding = isFutureColliding,
				isPathIntercepted = isPathIntercepted,
				tArrival = tArrival,
			})
		end
	end

	-- Quét Phase 2: Refine Rays (hội tụ quanh các hướng có điểm chiến thuật cao nhất từ Phase 1)
	if adaptive and countRefine > 0 and #candidates > 0 then
		local topDirs = topCandidateDirs(candidates, REFINE_K_MAX)
		local per, rem = refineDirsPer(countRefine, #topDirs)
		local refineDirs = buildRefineDirs(rayDirs, topDirs, per, rem)

		for j = 1, #refineDirs do
			local idx = seedLen + j
			rayDirs[idx] = refineDirs[j]

			local dir = refineDirs[j]
			local foundDist, blockedDist, blockedReason, wallDist = resolveExitDistance(centerPos, dir, slotDist[idx], escapeMargin)

			if foundDist then
				slotDist[idx] = foundDist
			else
				slotDist[idx] = nil
			end

			local entry = {
				i = idx - 1,
				dir = dir,
				found = foundDist,
				length = foundDist or blockedDist or maxRadius,
				status = foundDist and "found" or "blocked",
				blockedReason = blockedReason,
				wallDist = wallDist,
			}
			results[idx] = entry

			if foundDist then
				local tieScore = 0
				if awayVector then
					tieScore += math.max(0, dir:Dot(awayVector)) * AWAY_BONUS
				end
				if moveDir then
					tieScore += math.max(0, dir:Dot(moveDir)) * FORWARD_BONUS
				end

				local score, isPhaseThrough, isFutureColliding, isPathIntercepted, tArrival = computeCandidateTacticalScore(
					centerPos,
					dir,
					foundDist,
					wallDist,
					awayVector,
					moveDir,
					activeHazards,
					isBossAreaActive,
					bossAreaRadius,
					bossAreaCenter,
					isInnerDeadzoneActive,
					innerDeadzoneRadius,
					idx,
					results,
					seedLen,
					threatData
				)

				table.insert(candidates, {
					i = idx - 1,
					rayIdx = idx,
					dir = dir,
					found = foundDist,
					tie = tieScore,
					score = score,
					wallDist = wallDist,
					isPhaseThrough = isPhaseThrough,
					isFutureColliding = isFutureColliding,
					isPathIntercepted = isPathIntercepted,
					tArrival = tArrival,
				})
			end
		end
	end

	rayDirsBuilt = true
	rayResults = results

	-- 5. CHỌN ỨNG VIÊN XUẤT SẮC NHẤT DỰA TRÊN TACTICAL SCORE 2.0
	if #candidates == 0 then
		-- Fallback khẩn cấp nếu nhân vật đang bị nhốt trong AOE quá khổng lồ hoặc bị vây kín:
		-- Chọn tia tháo chạy thông thoáng nhất hướng ra xa tâm nguy hiểm!
		local bestEmergencyRay = nil
		local bestEmergencyScore = -math.huge
		local bestEmergencyDist = 0

		for _, entry in ipairs(results) do
			if entry.blockedReason == "wall" and entry.length < 3.0 then
				continue
			end

			local score = 0
			-- Ưu tiên độ dài đi được trước khi đụng tường
			score += (entry.length / maxRadius) * 2.0

			-- Ưu tiên hướng ra xa tâm nguy hiểm
			if awayVector then
				score += entry.dir:Dot(awayVector) * 4.0
			end

			-- Ưu tiên thuận theo đà chạy
			if moveDir then
				score += entry.dir:Dot(moveDir) * 1.5
			end

			-- Bị tường chặn thì trừ điểm
			if entry.blockedReason == "wall" then
				score -= 4.0
			end

			-- Hướng về tâm sàn đấu Boss / Tôn trọng cấu hình Donut
			if isBossAreaActive and bossAreaCenter and bossAreaRadius and bossAreaRadius > 0 then
				local bCenter = Vector3.new(bossAreaCenter.X, 0, bossAreaCenter.Z)
				local candidatePos = Vector3.new(centerPos.X + entry.dir.X * entry.length, 0, centerPos.Z + entry.dir.Z * entry.length)
				local distToCenter = (candidatePos - bCenter).Magnitude

				if isInnerDeadzoneActive and innerDeadzoneRadius and innerDeadzoneRadius > 0 then
					if distToCenter < innerDeadzoneRadius then
						score -= 20.0 -- Phạt nặng nếu đâm vào lỗ Donut cấm né (tâm Boss)!
					elseif distToCenter > bossAreaRadius then
						score -= 20.0 -- Phạt nặng nếu đâm ra ngoài sàn đấu!
					else
						score += 4.0 -- Nằm gọn trong vành bánh donut
					end
				else
					local toCenter = (bCenter - Vector3.new(centerPos.X, 0, centerPos.Z))
					if toCenter.Magnitude > 0.1 then
						score += entry.dir:Dot(toCenter.Unit) * 3.0
					end
				end
			end

			if score > bestEmergencyScore then
				bestEmergencyScore = score
				bestEmergencyRay = entry
				bestEmergencyDist = entry.length
			end
		end

		if bestEmergencyRay and bestEmergencyDist > 1.0 then
			isEmergencyMode = true
			chosenRayIndex = bestEmergencyRay.i
			safeSpotDist = bestEmergencyDist
			safeSpotPos = Vector3.new(
				centerPos.X + bestEmergencyRay.dir.X * bestEmergencyDist,
				scanFloorY or centerPos.Y,
				centerPos.Z + bestEmergencyRay.dir.Z * bestEmergencyDist
			)
			updateVisuals()
			fireCallbacks(true, safeSpotPos, threatName, safeSpotDist, chosenRayIndex, true)
			return safeSpotPos, true, safeSpotDist
		end

		isEmergencyMode = false
		safeSpotPos = nil
		safeSpotDist = 0
		chosenRayIndex = nil
		updateVisuals()
		fireCallbacks(false, nil, threatName, 0, nil, false)
		return nil, false, 0
	end

	isEmergencyMode = false
	table.sort(candidates, function(a, b)
		if enableScoringV2 and a.score and b.score then
			if math.abs(a.score - b.score) > 0.1 then
				return a.score > b.score
			end
			return a.found < b.found
		else
			if math.abs(a.found - b.found) > TIE_BAND then
				return a.found < b.found
			end
			return (a.tie or 0) > (b.tie or 0)
		end
	end)

	local best = candidates[1]
	chosenRayIndex = best.i
	safeSpotDist = best.found
	isPhaseThroughMode = best.isPhaseThrough and true or false
	safeSpotPos = Vector3.new(
		centerPos.X + best.dir.X * best.found,
		scanFloorY or centerPos.Y,
		centerPos.Z + best.dir.Z * best.found
	)

	updateVisuals()
	fireCallbacks(true, safeSpotPos, threatName, safeSpotDist, chosenRayIndex, false)
	return safeSpotPos, true, safeSpotDist
end

--==============================================================================
-- MONITOR & LIFECYCLE LOOP (60 FPS)
--==============================================================================

local function onHeartbeat()
	if not enabled then return end

	local now = os.clock()
	if now - lastValidateTime < VALIDATE_INTERVAL then
		return
	end
	lastValidateTime = now

	-- Tự động đánh giá an toàn thời gian thực
	safeSpotV2.FindNearestSafeSpot(nil, false)
end

-- Bật / tắt bộ tính toán Safe Spot V2
function safeSpotV2.SetEnabled(state)
	local shouldEnable = state and true or false
	if enabled == shouldEnable then return end
	enabled = shouldEnable

	if enabled then
		if not heartbeatConn then
			heartbeatConn = RunService.Heartbeat:Connect(onHeartbeat)
		end
	else
		if heartbeatConn then
			heartbeatConn:Disconnect()
			heartbeatConn = nil
		end
		clearRadar()
	end
end

function safeSpotV2.IsEnabled()
	return enabled
end

-- Lấy toạ độ Safe Spot hiện tại
function safeSpotV2.GetSafeSpot(): (Vector3?, boolean, number)
	return safeSpotPos, (safeSpotPos ~= nil), safeSpotDist
end

-- Lấy danh sách kết quả ray phục vụ Telemetry / Debug
function safeSpotV2.GetRayResults()
	return rayResults, scanOrigin, chosenRayIndex
end

-- Kiểm tra xem 1 điểm có an toàn không
function safeSpotV2.IsPointSafe(point: Vector3, pad: number?)
	return isPointSafe(point, pad or escapeMargin)
end

-- Visual Controls
function safeSpotV2.SetVisualEnabled(state)
	showMarker = state and true or false
	showVectors = state and true or false
	updateVisuals()
end

function safeSpotV2.IsVisualEnabled()
	return showMarker or showVectors
end

function safeSpotV2.SetShowVectors(state)
	showVectors = state and true or false
	updateVisuals()
end

function safeSpotV2.IsShowVectors()
	return showVectors
end

function safeSpotV2.SetShowMarker(state)
	showMarker = state and true or false
	updateVisuals()
end

function safeSpotV2.IsShowMarker()
	return showMarker
end

function safeSpotV2.SetShowVectorNumbers(state)
	showVectorNumbers = state and true or false
	updateVisuals()
end

function safeSpotV2.IsShowVectorNumbers()
	return showVectorNumbers
end

-- Ray Count
function safeSpotV2.SetRayCount(count: number)
	if type(count) == "number" and count >= 8 and count <= RAY_POOL_MAX then
		rayCount = math.floor(count)
		rayDirsBuilt = false
		table.clear(slotDist)
	end
end

function safeSpotV2.GetRayCount()
	return rayCount
end

-- Escape Margin
function safeSpotV2.SetEscapeMargin(val: number)
	if type(val) == "number" and val >= 0 then
		escapeMargin = val
	end
end

function safeSpotV2.GetEscapeMargin()
	return escapeMargin
end

-- Max Radius
function safeSpotV2.SetMaxRadius(val: number)
	if type(val) == "number" and val >= 15 and val <= 200 then
		maxRadius = val
		rayDirsBuilt = false
		table.clear(slotDist)
	end
end

function safeSpotV2.GetMaxRadius()
	return maxRadius
end

-- Trạng thái có đang ở chế độ Emergency Escape do AoE quá lớn không
function safeSpotV2.IsEmergency(): boolean
	return isEmergencyMode
end

-- Adaptive
function safeSpotV2.SetAdaptive(state)
	adaptive = state and true or false
	rayDirsBuilt = false
	table.clear(slotDist)
end

function safeSpotV2.IsAdaptive()
	return adaptive
end

function safeSpotV2.SetEnableScoringV2(state: boolean)
	enableScoringV2 = state and true or false
end

function safeSpotV2.IsEnableScoringV2(): boolean
	return enableScoringV2
end

function safeSpotV2.IsPhaseThrough(): boolean
	return isPhaseThroughMode
end

function safeSpotV2.SetTemporalEnabled(state: boolean)
	if temporal then temporal.SetEnabled(state) end
end

function safeSpotV2.IsTemporalEnabled(): boolean
	return temporal and temporal.IsEnabled() or false
end

-- Callbacks
function safeSpotV2.OnSafeSpotChanged(cb)
	if type(cb) == "function" then
		table.insert(safeSpotCallbacks, cb)
	end
end

--==============================================================================
-- PHASE 3: PROACTIVE TACTICAL REPOSITIONING ENGINE
--==============================================================================

-- Kiểm tra xem vị trí đứng hiện tại có cần tái chiếm lĩnh không gian mở (Reposition) không
-- Và tìm vị trí Sweet-Spot lý tưởng nhất trong tầm combat để dạt ra
function safeSpotV2.FindRepositionSpot(
	playerPos: Vector3,
	enemyPos: Vector3,
	minCombatDist: number,
	maxCombatDist: number
): (Vector3?, boolean)
	if not playerPos or not enemyPos then
		return nil, false
	end

	-- 1. Nếu đang có nguy hiểm tức thời (đang cần né gấp) thì không chạy reposition
	if danger.IsPlayerInDanger() then
		return nil, false
	end

	local activeHazards = danger.GetActiveHazards()
	local isBossAreaActive, bossAreaRadius, bossAreaCenter, isInnerDeadzoneActive, innerDeadzoneRadius = contextual.GetActiveBossArea()

	-- Kiểm tra chất lượng vị trí hiện tại của Player
	local needsReposition = false

	-- A. Kiểm tra khoảng cách tới tường map hiện tại (chân tường / góc kẹt < 5.0 studs)
	local minCurrentWallDist = 999.0
	for angle = 0, 315, 45 do
		local rad = math.rad(angle)
		local dir = Vector3.new(math.cos(rad), 0, math.sin(rad))
		local wDist = getWallDistance(playerPos, dir, 8.0)
		if wDist and wDist < minCurrentWallDist then
			minCurrentWallDist = wDist
		end
	end
	if minCurrentWallDist < 5.0 then
		needsReposition = true
	end

	-- B. Kiểm tra Donut Arena Constraint (Lệch tâm / áp sát mép ngoài hoặc sát lỗ cấm bên trong)
	if isBossAreaActive and bossAreaCenter and bossAreaRadius and bossAreaRadius > 0 then
		local bCenter2D = Vector3.new(bossAreaCenter.X, 0, bossAreaCenter.Z)
		local distToCenter = (Vector3.new(playerPos.X, 0, playerPos.Z) - bCenter2D).Magnitude

		if distToCenter > (bossAreaRadius - 6.0) then
			needsReposition = true
		elseif isInnerDeadzoneActive and innerDeadzoneRadius and innerDeadzoneRadius > 0 then
			if distToCenter < (innerDeadzoneRadius + 4.0) then
				needsReposition = true
			end
		end
	end

	-- C. Kiểm tra cự ly tới mép các chiêu thức đang cháy (Clearance < 4.0 studs)
	if not needsReposition and activeHazards and next(activeHazards) ~= nil then
		local minEdgeDist = evaluateHazardSpatialQuality(playerPos.X, playerPos.Z, activeHazards)
		if minEdgeDist < 4.0 then
			needsReposition = true
		end
	end

	if not needsReposition then
		return nil, false
	end

	-- 2. TÌM ĐIỂM ĐẾN SWEET-SPOT LÝ TƯỞNG
	-- Quét 16 góc xung quanh enemyPos tại bán kính lý tưởng
	local targetIdealRadius = (minCombatDist + maxCombatDist) * 0.5
	if isBossAreaActive and bossAreaCenter and isInnerDeadzoneActive and innerDeadzoneRadius and innerDeadzoneRadius > 0 then
		-- Nếu có Donut Arena: Bán kính lý tưởng tính theo Donut Sweet-Spot
		local donutMid = (innerDeadzoneRadius + bossAreaRadius) * 0.5
		-- Đồng thời vẫn phải tôn trọng khoảng cách combat
		targetIdealRadius = math.clamp(donutMid, minCombatDist + 1.0, maxCombatDist - 1.0)
	end

	local bestCandPos = nil
	local bestCandScore = -math.huge

	for i = 0, 15 do
		local angle = (i / 16) * (math.pi * 2)
		local candX = enemyPos.X + math.cos(angle) * targetIdealRadius
		local candZ = enemyPos.Z + math.sin(angle) * targetIdealRadius
		local candPos = Vector3.new(candX, playerPos.Y, candZ)

		-- Điểm ứng viên phải TUYỆT ĐỐI AN TOÀN (nằm trong Boss Area, ngoài Donut Hole, không có hazard)
		if isPointSafe(candPos, 0.8) then
			-- Đo độ thoáng tường của điểm ứng viên
			local minCandWallDist = 999.0
			for wAngle = 0, 315, 90 do
				local wRad = math.rad(wAngle)
				local dir = Vector3.new(math.cos(wRad), 0, math.sin(wRad))
				local wDist = getWallDistance(candPos, dir, 12.0)
				if wDist and wDist < minCandWallDist then
					minCandWallDist = wDist
				end
			end

			-- Nếu điểm ứng viên quá sát tường (< 3.5 studs) thì bỏ qua
			if minCandWallDist >= 3.5 then
				local distFromPlayer = (candPos - playerPos).Magnitude
				-- Ưu tiên điểm gần người chơi (để chỉ cần lướt nhẹ 4 - 15 studs là tới nơi)
				local score = minCandWallDist * 2.0 - (distFromPlayer * 1.5)

				-- Thưởng thêm nếu nằm chuẩn Sweet-spot Donut
				if isBossAreaActive and bossAreaCenter and bossAreaRadius and bossAreaRadius > 0 then
					local bCenter = Vector3.new(bossAreaCenter.X, 0, bossAreaCenter.Z)
					local candDistToCenter = (Vector3.new(candX, 0, candZ) - bCenter).Magnitude
					if isInnerDeadzoneActive and innerDeadzoneRadius and innerDeadzoneRadius > 0 then
						local midR = (innerDeadzoneRadius + bossAreaRadius) * 0.5
						local dev = math.abs(candDistToCenter - midR)
						score += math.max(0, 10.0 - dev)
					end
				end

				if score > bestCandScore then
					bestCandScore = score
					bestCandPos = candPos
				end
			end
		end
	end

	if bestCandPos and bestCandScore > -100 then
		return bestCandPos, true
	end

	return nil, false
end

-- Dọn dẹp visuals
function safeSpotV2.ClearVisuals()
	hideAllVisuals()
	if visualFolder then
		pcall(function() visualFolder:Destroy() end)
		visualFolder = nil
	end
	table.clear(rayItems)
	originDot = nil
	markerHalo = nil
	markerBeacon = nil
	markerLabel = nil
end

-- Dọn dẹp toàn bộ module
function safeSpotV2.Clear()
	safeSpotV2.SetEnabled(false)
	clearRadar()
	safeSpotV2.ClearVisuals()
	table.clear(safeSpotCallbacks)
end

-- Lắng nghe sự kiện Danger thay đổi từ Danger Engine V2
danger.OnDangerChanged(function(nowInDanger, threatData, threatType)
	if not enabled then return end
	if nowInDanger then
		safeSpotV2.FindNearestSafeSpot(nil, true)
	else
		isInDanger = false
		currentThreatName = nil
		fireCallbacks(false, safeSpotPos, nil, safeSpotDist, chosenRayIndex, false)
		-- KHÔNG gọi clearRadar() ở đây để Escape Vector luôn tồn tại
	end
end)

-- Đăng ký tắt an toàn khi shutdown
lifecycle.Register(function()
	safeSpotV2.Clear()
end)

safeSpotV2.GetWallDistance = getWallDistance

return safeSpotV2
