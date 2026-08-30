-- Basic Orbit Dodge cho DungeonQuest (tích hợp tracking + safe-node từ Smart Dodge).
-- Kiểu dodge đơn giản: KHÔNG tắt orbit, player chạy orbit bình thường.
-- Hệ thống TRACKING TOÀN BỘ đối tượng cần né theo 2 loại:
--   - KINEMATIC (chậm/đứng yên) : chặn quỹ đạo quanh vị trí cục (DANGER_RADIUS).
--   - PREDICTIVE (bay thẳng nhanh): chặn interval nơi tia bay (velocity/window)
--                                   cắt vòng orbit.
-- Khi phát hiện hazard ở PHÍA TRƯỚC hướng đi -> đảo chiều orbit.
-- Khi bị KẸP 2 phía (flip xong vẫn hazard trước, hoặc đang trong cooldown flip
-- mà vẫn gặp hazard) -> KHÔNG skip cứng theo SKIP_ANGLE nữa mà TÍNH NODE AN TOÀN
-- NHẤT (safety score trên danger map) rồi nhảy tới đó.
-- Tận dụng cơ chế orbit có sẵn (shared.basicOrbitDirection đè hướng hiệu dụng).

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")

--// References
local player = services.player
local RunService = services.RunService

--// Configuration
--// Danh sách chiêu/hazard cần tránh (tự add). Mọi tên ở đây được tracking;
--// những tên có trong PREDICTIVE_NAMES thì xử lý kiểu dự đoán quỹ đạo bay.
local BASIC_DODGE_NAMES = {
	["firstBossCrissCross"] = true,
	["secondBossMovingBeam"] = true,
	["firstBossSeekingSpikes"] = true,
}

--// Các tên thuộc loại PREDICTIVE (bay thẳng nhanh); còn lại mặc định KINEMATIC.
local PREDICTIVE_NAMES = {
	["firstBossSeekingSpikes"] = true,
}

--// Bán kính vùng detect quanh player (stud) - hành lang phía trước hướng đi
local DETECT_RADIUS = 15
--// Bán kính vùng PANIC: hazard quá gần player (bất kể hướng, bất kể cooldown
--// flip) -> tele thẳng tới node an toàn nhất (last-resort cho projectile cực nhanh)
local PANIC_RADIUS = 8
--// Cooldown giữa các lần panic tele (giây) - tránh spam tele mỗi heartbeat
local PANIC_COOLDOWN = 0.2
--// Cooldown chống lật hướng liên tục (giây)
local FLIP_COOLDOWN = 0.15
--// Số node phía trước (theo hướng đi) để coi là "có nguy hiểm đang tới"
local FLIP_LOOKAHEAD = 6
--// Số frame liên tiếp không có hazard trước khi reset hướng orbit về bình thường
local ALL_CLEAR_FRAMES = 5
--// Cooldown giữa các lần nhảy tới node an toàn (giây)
local JUMP_COOLDOWN = 0.3

--// ---- Danger map (kế thừa Smart Dodge) ----
--// PADDING quanh hitbox thật (OBB) để được coi là dead zone. Hard-code nhỏ vì
--// volume nguy hiểm khớp kích thước từng object; fallback sphere khi không OBB.
local DANGER_RADIUS = 1
--// Bán kính hazard thực của object predictive (stud): chiều rộng dải dead zone và
--// bán kính góc của danger interval trên orbit
local PREDICTIVE_OBJECT_RADIUS = 10
--// Prediction window (giây): dead zone của object bay thẳng phủ theo trajectory
local PREDICT_WINDOW = 3
--// Safety Score: margin tối thiểu tới dead zone để node "đủ an toàn"
local MIN_SAFE_MARGIN = 8
--// Cap khoảng cách tới dead zone khi chấm điểm (tránh chênh lệch cực lớn)
local MAX_MARGIN_CAP = 30
--// Chênh lệch điểm tối thiểu để quyết định nhảy (giữ ổn định)
local SWITCH_THRESHOLD = 6
--// Vận tốc tối thiểu để suy trajectory đáng tin cậy (stud/s)
local MIN_SPEED_THRESHOLD = 5
--// Độ phân giải góc quét (độ)
local SAMPLE_STEP = 2
--// Số mẫu góc trên 360°
local N = math.floor(360 / SAMPLE_STEP)

--// Hiển thị trực quan dead zone (debug): folder chứa các part vẽ.
local VISUALS_FOLDER = "DeadZone_Visuals"
local VISUALS_SMOOTHNESS = 12
local VISUALS_BALL_COLOR = Color3.fromRGB(255, 60, 60)
local VISUALS_ARC_COLOR = Color3.fromRGB(255, 40, 40)
local VISUALS_RAY_COLOR = Color3.fromRGB(255, 180, 40)
local VISUALS_DETECTOR_COLOR = Color3.fromRGB(60, 180, 255)
local VISUALS_PANIC_COLOR = Color3.fromRGB(255, 220, 60)

--// Tốc độ làm tươi visuals (giây)
local VISUALS_REFRESH_INTERVAL = 0.1

--// Table
local basicDodge = {}

--// State
local enabled = false
--// Chế độ hoạt động: "All" = mọi lúc, "Boss" = chỉ khi đang boss
local dodgeMode = "All"
local connection = nil
local lastFlipTime = 0
local lastJumpTime = 0
local lastPanicTime = 0
local noHazardCount = 0
local trackedColumns = {}
local debugVisuals = false
local detectorVisuals = false
--// Hình dạng detector: "Cone" (hình nón trước mặt) hoặc "Circle" (vòng tròn)
local detectorMode = "Circle"
local renderLoopRunning = false

--// Vị trí tâm (X/Y/Z) của object trong Workspace.
local function getObjectPosition(obj)
	if not obj then return nil end
	if obj:IsA("BasePart") then
		local ok, pos = pcall(function() return obj.Position end)
		if ok then return pos end
		return nil
	end
	local ok, primary = pcall(function() return obj.PrimaryPart end)
	if ok and primary and primary:IsA("BasePart") then return primary.Position end
	for _, c in ipairs(obj:GetChildren()) do
		if c:IsA("BasePart") then return c.Position end
	end
	return nil
end

--// Hướng bay + tốc độ (stud/s) của object di chuyển thẳng (predictive).
--// Ưu tiên velocity của BasePart; fallback suy từ 2 frame position gần nhất.
local function getObjectVelocity(col)
	local obj = col and col.Instance
	local vel = nil
	if obj and obj:IsA("BasePart") then
		local ok, v = pcall(function()
			return obj.Velocity
		end)
		if ok and typeof(v) == "Vector3" and v.Magnitude > MIN_SPEED_THRESHOLD then
			vel = v
		end
	end
	if not vel and col.Position and col.OldPosition then
		local delta = col.Position - col.OldPosition
		local mag = delta.Magnitude
		if mag > 0.01 then
			local perSecond = mag / (col.Age or 1)
			vel = delta.Unit * perSecond
		end
	end
	return vel
end

--// OBB (CFrame + Size) thật của hitbox để dead zone khớp hình dạng từng đối tượng.
local function getOBB(obj)
	if obj:IsA("BasePart") then
		return obj.CFrame, obj.Size
	end
	if obj:IsA("Model") then
		local ok, cframe, size = pcall(function()
			return obj:GetBoundingBox()
		end)
		if ok and cframe and size then return cframe, size end
	end
	return nil
end

--// Khoảng cách từ điểm tới OBB (dùng trong isSampleDanger: dead khi <= padding).
local function pointToOBBDistance(pt, obbCFrame, obbSize)
	local localPt = obbCFrame:Inverse() * pt
	local hx = obbSize.X / 2
	local hy = obbSize.Y / 2
	local hz = obbSize.Z / 2
	local dx = math.max(math.abs(localPt.X) - hx, 0)
	local dy = math.max(math.abs(localPt.Y) - hy, 0)
	local dz = math.max(math.abs(localPt.Z) - hz, 0)
	return math.sqrt(dx * dx + dy * dy + dz * dz)
end

--// Bán kính phủ ngang của object (cho bề rộng dải dead zone predictive).
local function coveringRadius(size)
	local hx = size.X / 2
	local hz = size.Z / 2
	return math.sqrt(hx * hx + hz * hz)
end

--// Phát hiện object mới xuất hiện / loại bỏ object biến mất (quản lý membership).
local function tryTrackObject(child, seen, predicted)
	seen[child] = true
	local entry = trackedColumns[child]
	if not entry then
		local pos = getObjectPosition(child)
		if pos then
			local obbCFrame, obbSize = getOBB(child)
			local radius = obbSize and coveringRadius(obbSize)
			trackedColumns[child] = {
				Instance = child,
				Position = pos,
				OldPosition = pos,
				Predicted = predicted,
				Age = 1,
				OBBFrame = obbCFrame,
				OBBSize = obbSize,
				Radius = radius,
			}
		end
	else
		entry.Predicted = entry.Predicted or predicted
	end
end

local function refreshColumns()
	local Workspace = game:GetService("Workspace")
	--// Hợp danh sách tên cần né: tự-add (BASIC_DODGE_NAMES) + toàn bộ projectile
	--// của enemy từ shared (ReplicatedStorage.enemyProjectiles).
	local projectileNames = shared.GetEnemyProjectileNames()
	local seen = {}
	for _, child in ipairs(Workspace:GetChildren()) do
		if BASIC_DODGE_NAMES[child.Name] or projectileNames[child.Name] then
			tryTrackObject(child, seen, PREDICTIVE_NAMES[child.Name] == true)
		end
	end
	for inst in pairs(trackedColumns) do
		if not seen[inst] or not inst.Parent then
			trackedColumns[inst] = nil
		end
	end
end

--// Cập nhật vị trí object mỗi lần tính toán (bám theo chuyển động nhanh).
local function updateColumnPositions(now)
	for _, col in pairs(trackedColumns) do
		if col and col.Instance then
			local pos = getObjectPosition(col.Instance)
			if pos then
				if col.OldPosition then
					col.Age = now - (col.LastUpdate or 0)
					if col.Age < 1e-3 then col.Age = 1e-3 end
				end
				col.OldPosition = col.Position
				col.Position = pos
				col.LastUpdate = now
				--// OBB bám theo vị trí/rotation hiện tại của hitbox
				local obbCFrame, obbSize = getOBB(col.Instance)
				if obbCFrame and obbSize then
					col.OBBFrame = obbCFrame
					col.OBBSize = obbSize
					col.Radius = col.Radius or coveringRadius(obbSize)
				end
			end
		end
	end
end

local function horizontalDistance(a, b)
	local dx = b.X - a.X
	local dz = b.Z - a.Z
	return math.sqrt(dx * dx + dz * dz)
end

--// Có node nguy hiểm nào trong FLIP_LOOKAHEAD node phía trước theo hướng đi ?
--// Dựa trên danger map (cùng nguồn với jump), nên quyết định flip được thống nhất.
local function dangerAhead(danger, curIdx, effDir)
	for i = 1, FLIP_LOOKAHEAD do
		local idx = (curIdx + effDir * i) % N
		if idx < 0 then idx = idx + N end
		if danger[idx] then return true end
	end
	return false
end

--// Tele player tới góc theta (rad) trên orbit quanh center (đồng bộ farmAngle).
local function teleportToAngle(center, theta)
	local character = player.Character
	local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
	if not character or not playerRoot or not playerRoot.Parent then return end
	if not character.PrimaryPart then character.PrimaryPart = playerRoot end

	local radius = shared.GetOrbitRadius() or 0
	local height = shared.GetOrbitHeight() or 0
	local targetPos = center + Vector3.new(math.cos(theta) * radius, height, math.sin(theta) * radius)

	local humanoid = character:FindFirstChild("Humanoid")
	local oldAutoRotate = humanoid and humanoid.AutoRotate
	if humanoid then humanoid.AutoRotate = false end
	character:PivotTo(CFrame.lookAt(targetPos, center))
	playerRoot.AssemblyLinearVelocity, playerRoot.AssemblyAngularVelocity = Vector3.zero, Vector3.zero
	if humanoid then humanoid.AutoRotate = oldAutoRotate end

	--// đồng bộ farmAngle để moveFarmTarget tiếp tục đúng
	shared.SetOrbitAngle(theta)
end

--// ---- Danger map (chọn node an toàn nhất trên orbit) ----
local function orbitPoint(center, radius, angle, height)
	return Vector3.new(center.X + math.cos(angle) * radius, height, center.Z + math.sin(angle) * radius)
end

local function degToIdx(deg)
	return math.floor((((deg % 360) + 360) % 360) / SAMPLE_STEP) % N
end

local function idxToRad(idx)
	return math.rad(idx * SAMPLE_STEP)
end

--// Line-circle intersection: tia từ P theo dir (unit), giới hạn maxDist.
local function lineCircleIntersections(P, dir, C, R, maxDist)
	local oc = P - C
	local a = dir:Dot(dir)
	if a < 1e-6 then return nil end
	local b = 2 * oc:Dot(dir)
	local c = oc:Dot(oc) - R * R
	local disc = b * b - 4 * a * c
	if disc < 0 then return nil end
	local sqrtD = math.sqrt(disc)
	local t1 = (-b - sqrtD) / (2 * a)
	local t2 = (-b + sqrtD) / (2 * a)
	local intersects = {}
	local near, far
	if t1 < t2 then near, far = t1, t2 else near, far = t2, t1 end
	if maxDist ~= nil and maxDist >= 0 then far = math.min(far, maxDist) end
	if near >= 0 and near <= far then table.insert(intersects, P + dir * near) end
	if far > near and far >= 0 then table.insert(intersects, P + dir * far) end
	if #intersects == 0 then return nil end
	return intersects
end

local function markDangerInterval(danger, centerDeg, halfWidthDeg)
	for deg = centerDeg - halfWidthDeg, centerDeg + halfWidthDeg do
		danger[degToIdx(deg)] = true
	end
end

--// Predictive: mỗi object bay thẳng đóng góp danger interval tại góc orbit nơi
--// tia bay (giới hạn PREDICT_WINDOW) cắt quỹ đạo. Bề rộng interval theo kích
--// thước thật của object (col.Radius) + padding; fallback PREDICTIVE_OBJECT_RADIUS.
local function markPredictiveDangers(danger, bossPos, radius)
	local safeRadius = math.max(radius, 1)
	for _, col in pairs(trackedColumns) do
		if col and col.Predicted and col.Position then
			local vel = getObjectVelocity(col)
			if vel and vel.Magnitude > MIN_SPEED_THRESHOLD then
				local halfWidthDeg = math.deg(((col.Radius or PREDICTIVE_OBJECT_RADIUS) + DANGER_RADIUS) / safeRadius)
				local maxDist = vel.Magnitude * PREDICT_WINDOW
				local intersections = lineCircleIntersections(col.Position, vel.Unit, bossPos, radius, maxDist)
				if intersections then
					for _, pt in ipairs(intersections) do
						local angleDeg = math.deg(math.atan2(pt.Z - bossPos.Z, pt.X - bossPos.X))
						markDangerInterval(danger, angleDeg, halfWidthDeg)
					end
				end
			end
		end
	end
end

--// Điểm orbit tại idx có nằm trong phạm vi nguy hiểm của cục kinematic nào.
--// Dùng OBB thật (khớp hitbox dài/ngang/xiên) + padding DANGER_RADIUS;
--// fallback sphere quanh tâm khi không lấy được OBB.
local function isSampleDanger(bossPos, radius, height, idx)
	local point = orbitPoint(bossPos, radius, idxToRad(idx), height)
	for _, col in pairs(trackedColumns) do
		if col and col.Position and not col.Predicted then
			if col.OBBFrame and col.OBBSize then
				if pointToOBBDistance(point, col.OBBFrame, col.OBBSize) <= DANGER_RADIUS then
					return true
				end
			elseif horizontalDistance(point, col.Position) < DANGER_RADIUS then
				return true
			end
		end
	end
	return false
end

--// Xây Danger Map: hybrid 2 loại trên cùng mảng danger[]. Kinematic chặn quanh
--// cục (isSampleDanger); predictive chặn interval quanh điểm cắt.
local function buildDangerMap(bossPos, radius, height)
	local danger = {}
	for i = 0, N - 1 do
		danger[i] = isSampleDanger(bossPos, radius, height, i)
	end
	markPredictiveDangers(danger, bossPos, radius)
	return danger
end

--// Khoảng cách (số node) từ idx tới dead zone gần nhất, cap ở MAX_MARGIN_CAP.
local function marginToDanger(danger, idx)
	if danger[idx] then return 0 end
	local margin = 0
	while margin < MAX_MARGIN_CAP do
		if danger[(idx + margin) % N] or danger[(idx - margin + N) % N] then break end
		margin = margin + 1
	end
	return margin
end

--// Độ dài run an toàn (số node, kể cả wrap) chứa idx.
local function safeRunWidth(danger, idx)
	if danger[idx] then return 0 end
	local width = 1
	local prev = (idx - 1 + N) % N
	while prev ~= idx and not danger[prev] do
		width = width + 1
		prev = (prev - 1 + N) % N
	end
	local nxt = (idx + 1) % N
	while nxt ~= idx and not danger[nxt] do
		width = width + 1
		nxt = (nxt + 1) % N
	end
	return width
end

--// Điểm an toàn của node: ưu tiên margin tới dead zone, phá quãng bằng run width.
local function safetyScore(danger, idx)
	if danger[idx] then return -1 end
	return marginToDanger(danger, idx) * 1000 + math.min(safeRunWidth(danger, idx), MAX_MARGIN_CAP)
end

--// Node an toàn nhất trên toàn orbit (điểm cao nhất). Trả về idx + điểm.
local function bestSafeIndex(danger, curIdx)
	local bestIdx, bestScore = curIdx, safetyScore(danger, curIdx)
	for idx = 0, N - 1 do
		local s = safetyScore(danger, idx)
		if s > bestScore then
			bestScore = s
			bestIdx = idx
		end
	end
	return bestIdx, bestScore
end

--// ---------- Dead zone visuals (debug) ----------

local function clearVisuals()
	local parent = game:GetService("Workspace"):FindFirstChild(VISUALS_FOLDER)
	if parent then parent:Destroy() end
end

local function createVisualPart(parent, transparent)
	local p = Instance.new("Part")
	p.Anchored = true
	p.CanCollide = false
	p.CanTouch = false
	p.CanQuery = false
	p.Material = Enum.Material.Neon
	p.Transparency = transparent or 0.5
	p.CastShadow = false
	p.Parent = parent
	return p
end

local function drawSegment(parent, a, b, thickness, transparent, color)
	local mid = a + (b - a) * 0.5
	local part = createVisualPart(parent, transparent)
	part.Shape = Enum.PartType.Block
	part.Color = color
	part.Size = Vector3.new(thickness, thickness, (a - b).Magnitude)
	if (a - b).Magnitude > 0.001 then
		part.CFrame = CFrame.lookAt(mid, b)
	end
end

--// Dead zone của cục kinematic: OBB thật inflated padding DANGER_RADIUS
--// (fallback sphere quanh tâm khi không có OBB).
local function renderKinematicBalls(parent)
	for _, col in pairs(trackedColumns) do
		if col and col.Position and not col.Predicted then
			local part = createVisualPart(parent, 0.65)
			if col.OBBFrame and col.OBBSize then
				part.Shape = Enum.PartType.Block
				part.Size = col.OBBSize + Vector3.new(DANGER_RADIUS, DANGER_RADIUS, DANGER_RADIUS) * 2
				part.CFrame = col.OBBFrame
			else
				part.Shape = Enum.PartType.Ball
				part.Size = Vector3.new(DANGER_RADIUS * 2, DANGER_RADIUS * 2, DANGER_RADIUS * 2)
				part.CFrame = CFrame.new(col.Position)
			end
			part.Color = VISUALS_BALL_COLOR
		end
	end
end

--// Tia dead zone của object predictive: dải rộng theo kích thước hitbox thật
--// (+padding), dọc theo hướng bay, dài speed×PREDICT_WINDOW.
local function renderPredictiveRays(parent)
	for _, col in pairs(trackedColumns) do
		if col and col.Predicted and col.Position then
			local vel = getObjectVelocity(col)
			if vel and vel.Magnitude > MIN_SPEED_THRESHOLD then
				local len = vel.Magnitude * PREDICT_WINDOW
				local start = col.Position
				local endpoint = start + vel.Unit * len
				local mid = start + (endpoint - start) * 0.5
				local part = createVisualPart(parent, 0.35)
				part.Shape = Enum.PartType.Block
				part.Color = VISUALS_RAY_COLOR
				local width = ((col.Radius or PREDICTIVE_OBJECT_RADIUS) + DANGER_RADIUS) * 2
				part.Size = Vector3.new(width, 0.5, len)
				part.CFrame = CFrame.lookAt(mid, endpoint)
			end
		end
	end
end

--// Vành đai cung dangerous trên orbit (các góc bị chặn trong danger map)
local function renderArc(parent, bossPos, radius, height, danger)
	for idx = 0, N - 1 do
		if danger[idx] then
			local nxt = (idx + 1) % N
			local p1 = orbitPoint(bossPos, radius, idxToRad(idx), height)
			local p2 = orbitPoint(bossPos, radius, idxToRad(nxt), height)
			drawSegment(parent, p1, p2, 0.9, 0.5, VISUALS_ARC_COLOR)
		end
	end
end

--// Vùng detect phía trước hướng đi (hình quạt: bán kính DETECT_RADIUS,
--// góc mở cố định quanh tiếp tuyến của orbit tại vị trí player).
local DETECTOR_ANGLE = 120
local CIRCLE_SECTIONS = 32
local function renderCircleAt(parent, playerPos, radius, color)
	local p = Vector3.new(playerPos.X, playerPos.Y, playerPos.Z)
	for i = 0, CIRCLE_SECTIONS - 1 do
		local t1 = i / CIRCLE_SECTIONS
		local t2 = (i + 1) / CIRCLE_SECTIONS
		local a1 = t1 * math.pi * 2
		local a2 = t2 * math.pi * 2
		local p1 = p + Vector3.new(math.cos(a1) * radius, 0, math.sin(a1) * radius)
		local p2 = p + Vector3.new(math.cos(a2) * radius, 0, math.sin(a2) * radius)
		drawSegment(parent, p1, p2, 0.12, 0.3, color)
	end
end

local function renderDetector(parent, playerPos, bossPos)
	local radius = shared.GetOrbitRadius()
	if not radius or radius <= 0 then return end
	if detectorMode == "Circle" then
		renderCircleAt(parent, playerPos, DETECT_RADIUS, VISUALS_DETECTOR_COLOR)
		renderCircleAt(parent, playerPos, PANIC_RADIUS, VISUALS_PANIC_COLOR)
		return
	end
	local effDir = shared.GetBasicOrbitDirection()
	if not effDir then effDir = shared.GetFarmOrbitDirection() or 1 end
	local radial = playerPos - bossPos
	local ang = math.atan2(radial.Z, radial.X)
	--// tiếp tuyến tại điểm player: đạo hàm (cosθ,sinθ) = (-sinθ, cosθ), nhân effDir
	local tx = -math.sin(ang) * effDir
	local tz = math.cos(ang) * effDir
	local tangent = Vector3.new(tx, 0, tz)
	local half = math.rad(DETECTOR_ANGLE / 2)

	--// Hai cạnh quạt
	local a2 = Vector3.new(tangent.X * math.cos(half) - tangent.Z * math.sin(half), 0, tangent.X * math.sin(half) + tangent.Z * math.cos(half)) * DETECT_RADIUS
	local b1 = Vector3.new(tangent.X * math.cos(-half) - tangent.Z * math.sin(-half), 0, tangent.X * math.sin(-half) + tangent.Z * math.cos(-half)) * DETECT_RADIUS
	local p = Vector3.new(playerPos.X, playerPos.Y, playerPos.Z)
	local pA2 = p + a2
	local pB1 = p + b1
	drawSegment(parent, p, pA2, 0.12, 0.3, VISUALS_DETECTOR_COLOR)
	drawSegment(parent, p, pB1, 0.12, 0.3, VISUALS_DETECTOR_COLOR)
	--// Cung trước
	local sections = 16
	for i = 0, sections - 1 do
		local t1 = i / sections
		local t2 = (i + 1) / sections
		local arcT1 = -half + (2 * half) * t1
		local arcT2 = -half + (2 * half) * t2
		local p1 = p + Vector3.new(tangent.X * math.cos(arcT1) - tangent.Z * math.sin(arcT1), 0, tangent.X * math.sin(arcT1) + tangent.Z * math.cos(arcT1)) * DETECT_RADIUS
		local p2 = p + Vector3.new(tangent.X * math.cos(arcT2) - tangent.Z * math.sin(arcT2), 0, tangent.X * math.sin(arcT2) + tangent.Z * math.cos(arcT2)) * DETECT_RADIUS
		drawSegment(parent, p1, p2, 0.12, 0.3, VISUALS_DETECTOR_COLOR)
	end
	--// Vùng PANIC: vòng tròn nhỏ màu vàng (dù chọn mode nào)
	renderCircleAt(parent, playerPos, PANIC_RADIUS, VISUALS_PANIC_COLOR)
end

--// Vẽ toàn bộ visuals cho 1 khung hình (xóa cũ, vẽ mới).
--// Tách riêng: Detector Visuals chỉ vẽ vòng detect/panic; Dead Zone Visuals
--// mới vẽ sphere kinematic + tia predictive + cung danger.
local function renderVisuals(bossPos, radius, height)
	clearVisuals()
	if not debugVisuals and not detectorVisuals then return end
	local parent = Instance.new("Folder")
	parent.Name = VISUALS_FOLDER
	parent.Parent = game:GetService("Workspace")
	local danger = nil
	if detectorVisuals then
		local character = player.Character
		local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
		if playerRoot and playerRoot.Parent then
			renderDetector(parent, playerRoot.Position, bossPos)
		end
	end
	if debugVisuals then
		danger = buildDangerMap(bossPos, radius, height)
		renderKinematicBalls(parent)
		renderPredictiveRays(parent)
		renderArc(parent, bossPos, radius, height, danger)
	end
end

--// Loop vẽ visuals độc lập (chạy khi bật Dead Zone Visuals hoặc Detector Visuals).
local function ensureRenderLoop()
	if renderLoopRunning then return end
	renderLoopRunning = true
	task.spawn(function()
		while true do
			if debugVisuals or detectorVisuals then
				pcall(function()
					local center = shared.GetOrbitCenter()
					if center then
						refreshColumns()
						updateColumnPositions(os.clock())
						local radius = shared.GetOrbitRadius()
						local height = shared.GetOrbitHeight() or 0
						if radius and radius > 0 then
							renderVisuals(center, radius, height)
						end
					end
				end)
			end
			task.wait(VISUALS_REFRESH_INTERVAL)
		end
	end)
end

local function updateRenderLoop()
	if debugVisuals or detectorVisuals then
		ensureRenderLoop()
	else
		clearVisuals()
	end
end

--// Khi bị kẹp: nhảy tới node an toàn nhất trên vòng orbit (thay cho skip cứng).
local function jumpToSafeNode(center)
	local radius = shared.GetOrbitRadius()
	if not radius or radius <= 0 then return end
	local character = player.Character
	local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
	if not character or not playerRoot or not playerRoot.Parent then return end

	local height = shared.GetOrbitHeight() or 0
	local toPlayer = playerRoot.Position - center
	local curIdx = degToIdx(math.deg(math.atan2(toPlayer.Z, toPlayer.X)))
	local danger = buildDangerMap(center, radius, height)
	local bestIdx, bestScore = bestSafeIndex(danger, curIdx)
	if bestScore >= 0 and bestIdx ~= curIdx then
		teleportToAngle(center, idxToRad(bestIdx))
	end
end

--// Danh sách vị trí hazard đang được track (cho flip detection).
local function collectHazardPositions()
	local out = {}
	for _, col in pairs(trackedColumns) do
		if col and col.Position then table.insert(out, col.Position) end
	end
	return out
end

--// Có hazard nào đang nằm trong vùng PANIC quanh player (khoảng cách ngang) ?
local function panicHazardNearby(playerPos)
	for _, col in pairs(trackedColumns) do
		if col and col.Position and horizontalDistance(playerPos, col.Position) < PANIC_RADIUS then
			return true
		end
	end
	return false
end

local function basicStep()
	local character = player.Character
	local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
	if not character or not playerRoot or not playerRoot.Parent then return end
	if shared.GetFarmMode() ~= "Orbit" then return end
	--// Chế độ Boss Only: bỏ qua khi chưa trong boss room
	if dodgeMode == "Boss" and not shared.IsBossActive() then return end

	local center = shared.GetOrbitCenter()
	if not center then return end

	local playerPos = playerRoot.Position
	local now = os.clock()

	--// hướng hiệu dụng (khởi tạo nếu chưa)
	local effDir = shared.GetBasicOrbitDirection()
	if not effDir then
		effDir = shared.GetFarmOrbitDirection() or 1
		shared.SetBasicOrbitDirection(effDir)
	end

	--// tracking + cập nhật vị trí toàn bộ đối tượng cần né
	refreshColumns()
	updateColumnPositions(now)

	local hazards = collectHazardPositions()
	if #hazards == 0 then
		--// hazard biến mất tạm thời (beam đổi parent/primary part) không reset ngay;
		--// chỉ trả hướng về bình thường sau ALL_CLEAR_FRAMES frame liên tiếp
		noHazardCount = noHazardCount + 1
		if noHazardCount >= ALL_CLEAR_FRAMES then
			shared.SetBasicOrbitDirection(nil)
			noHazardCount = 0
		end
		return
	end
	noHazardCount = 0

	--// Xây danger map 1 lần, dùng chung cho quyết định flip và jump node an toàn.
	local height = shared.GetOrbitHeight() or 0
	local toPlayer = playerPos - center
	local curIdx = degToIdx(math.deg(math.atan2(toPlayer.Z, toPlayer.X)))
	local danger = buildDangerMap(center, shared.GetOrbitRadius(), height)

	--// PANIC: hazard lọt vào vùng cấm sát player -> tele thẳng node an toàn
	--// (bất chấp logic flip/kẹp, chỉ giữ cooldown riêng chống spam).
	if panicHazardNearby(playerPos) and now - lastPanicTime > PANIC_COOLDOWN then
		lastPanicTime = now
		jumpToSafeNode(center)
		return
	end

	if dangerAhead(danger, curIdx, effDir) then
		if now - lastFlipTime > FLIP_COOLDOWN then
			local newDir = -effDir
			shared.SetBasicOrbitDirection(newDir)
			lastFlipTime = now
			--// kẹt 2 phía: vẫn nguy hiểm trước hướng mới -> nhảy node an toàn
			if dangerAhead(danger, curIdx, newDir) and now - lastJumpTime > JUMP_COOLDOWN then
				lastJumpTime = now
				jumpToSafeNode(center)
			end
		elseif now - lastJumpTime > JUMP_COOLDOWN then
			--// trong cooldown flip mà vẫn còn nguy hiểm trước -> nhảy node an toàn
			lastJumpTime = now
			jumpToSafeNode(center)
		end
	end
end

function basicDodge.Toggle(state)
	enabled = state == true
	if enabled then
		lastFlipTime = 0
		lastJumpTime = 0
		lastPanicTime = 0
		noHazardCount = 0
		if not connection then
			connection = RunService.Heartbeat:Connect(function()
				basicStep()
			end)
		end
	else
		if connection then
			connection:Disconnect()
			connection = nil
		end
		trackedColumns = {}
		shared.SetBasicOrbitDirection(nil)
	end
end

function basicDodge.IsEnabled()
	return enabled
end

function basicDodge.GetMode()
	return dodgeMode
end

function basicDodge.SetMode(mode)
	if mode == "Boss" or mode == "All" then dodgeMode = mode end
end

function basicDodge.GetDetectRadius()
	return DETECT_RADIUS
end

function basicDodge.SetDetectRadius(value)
	DETECT_RADIUS = value
end

function basicDodge.GetPanicRadius()
	return PANIC_RADIUS
end

function basicDodge.SetPanicRadius(value)
	PANIC_RADIUS = value
end

function basicDodge.GetPanicCooldown()
	return PANIC_COOLDOWN
end

function basicDodge.SetPanicCooldown(value)
	PANIC_COOLDOWN = value
end

function basicDodge.GetFlipCooldown()
	return FLIP_COOLDOWN
end

function basicDodge.SetFlipCooldown(value)
	FLIP_COOLDOWN = value
end

function basicDodge.GetJumpCooldown()
	return JUMP_COOLDOWN
end

function basicDodge.SetJumpCooldown(value)
	JUMP_COOLDOWN = value
end

function basicDodge.GetAllClearFrames()
	return ALL_CLEAR_FRAMES
end

function basicDodge.SetAllClearFrames(value)
	ALL_CLEAR_FRAMES = value
end

--// Quản lý danh sách skill dodge
function basicDodge.AddBasicDodgeName(name)
	if name and type(name) == "string" then BASIC_DODGE_NAMES[name] = true end
end

function basicDodge.AddKinematicName(name)
	if name and type(name) == "string" then BASIC_DODGE_NAMES[name] = true end
end

function basicDodge.AddPredictiveName(name)
	if name and type(name) == "string" then
		BASIC_DODGE_NAMES[name] = true
		PREDICTIVE_NAMES[name] = true
	end
end

function basicDodge.GetBasicDodgeNames()
	local out = {}
	for k in pairs(BASIC_DODGE_NAMES) do table.insert(out, k) end
	table.sort(out)
	return out
end

function basicDodge.SetDebugVisuals(value)
	debugVisuals = value == true
	updateRenderLoop()
end

function basicDodge.IsDebugVisuals()
	return debugVisuals
end

function basicDodge.SetDetectorVisuals(value)
	detectorVisuals = value == true
	updateRenderLoop()
end

function basicDodge.IsDetectorVisuals()
	return detectorVisuals
end

function basicDodge.GetDetectorMode()
	return detectorMode
end

function basicDodge.SetDetectorMode(mode)
	if mode == "Cone" or mode == "Circle" then detectorMode = mode end
end

return basicDodge