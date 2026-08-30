-- Predictive Orbit Avoidance (Smart Dodge) cho DungeonQuest.
-- Player được biểu diễn bằng góc θ trên vòng tròn quỹ đạo quanh boss
-- (bán kính BOSS_RADIUS). Mỗi lần quét, xây Danger Map từ các cục nguy
-- hiểm (vd firstBossCrissCross) đang tồn tại, tìm khoảng an toàn lớn
-- nhất trên 360°, rồi teleport player tới góc an toàn.
--
-- Độ cao: khi bắt đầu dodge, giữ nguyên độ cao hiện tại của player và
-- duy trì suốt phiên dodge (không nhảy xuống thấp, không bị trôi).
-- Bán kính được RESOLVE theo Farm Mode:
--   - Farm Mode = Orbit: dùng thẳng ORBIT_RADIUS của Auto Farm.
--   - Farm Mode = Hover : dùng BOSS_RADIUS (slider "Boss Radius").

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")

--// References
local player = services.player

--// Configuration
--// Loại 1 - KINEMATIC (chậm, xoay/quanh): coi vị trí tâm tức thời của cục là
--// vùng nguy hiểm (chặn orbit trong DANGER_RADIUS). Child trực tiếp Workspace.
local COLUMN_NAMES = {
	["firstBossCrissCross"] = true,
	["secondBossMovingBeam"] = true,
}

--// Loại 2 - PREDICTIVE (di chuyển thẳng nhanh): dự đoán trajectory đường
--// thẳng (velocity hoặc 2 frame position), coi toàn bộ quỹ đạo bay cắt orbit
--// là danger interval (theo orbit_avoidance_algorithm.txt). Bạn tự add skill
--// thuộc kiểu này vào đây.
local STRAIGHT_DODGE_NAMES = {
	["firstBossSeekingSpikes"] = true,
}

--// Bán kính quỹ đạo quanh boss (dùng khi Farm Mode = Hover).
--// Độ cao được giữ theo độ cao hiện tại của player khi bắt đầu dodge.
local BOSS_RADIUS = 25

--// Phạm vi nguy hiểm quanh mỗi cục (khoảng cách từ điểm orbit tới cục)
local DANGER_RADIUS = 16

--// Bán kính hazard thực của object predictive (stud). Quyết định chiều rộng
--// của dải dead zone (2×radius) và bán kính góc của danger interval trên orbit.
local PREDICTIVE_OBJECT_RADIUS = 10

--// Prediction window (giây): dead zone của object bay thẳng phủ theo trajectory
--// trong X giây tới (chỉ chiều phía trước theo velocity). Quãng đường quét =
--// speed * PREDICT_WINDOW.
local PREDICT_WINDOW = 3

--// Safety Score (chọn chỗ an toàn nhất trên orbit)
--// Khoảng cách tối thiểu (số node) tới dead zone để coi node là "đủ an toàn";
--// nếu player đang ở node an toàn nhưng gần mép hơn mức này -> nhích vào giữa.
local MIN_SAFE_MARGIN = 8
--// Cap khoảng cách tới dead zone khi chấm điểm (tránh chênh lệch cực lớn trong
--// run rất dài).
local MAX_MARGIN_CAP = 30
--// Chênh lệch điểm tối thiểu để quyết định tele (giữ ổn định, tránh nhảy liên tục).
local SWITCH_THRESHOLD = 6

--// Hiển thị trực quan dead zone (debug): folder chứa các part vẽ.
local VISUALS_FOLDER = "DeadZone_Visuals"
local VISUALS_SMOOTHNESS = 12
local VISUALS_BALL_COLOR = Color3.fromRGB(255, 60, 60)
local VISUALS_ARC_COLOR = Color3.fromRGB(255, 40, 40)
local VISUALS_RAY_COLOR = Color3.fromRGB(255, 180, 40)

--// Nếu đọc được velocity (đơn vị stud/s) nhưng quá nhỏ (near zero), không đủ
--// yếu tố hướng -> không tính được trajectory đáng tin cậy.
local MIN_SPEED_THRESHOLD = 5

--// Độ phân giải góc quét (độ)
local SAMPLE_STEP = 2

local SCAN_INTERVAL = 0.1
local RECALC_INTERVAL = 0.1

--// Số mẫu góc trên 360°
local N = math.floor(360 / SAMPLE_STEP)

--// Table
local dodge = {}

--// State
local enabled = false
local dodging = false
local activeColumns = {}
local activeColumnsMeta = {}
local straightObjects = {}
local loopRunning = false
local callbacks = {}
local currentHeight = 0
local debugVisuals = false

function dodge.OnDodgeChange(callback)
	table.insert(callbacks, callback)
end

local function notifyDodgeChange()
	for _, cb in ipairs(callbacks) do
		pcall(cb, dodging)
	end
end

--// Resolve bán kính quỹ đạo dodge theo Farm Mode.
local function getDodgeRadius()
	if shared.GetFarmMode() == "Hover" then
		return BOSS_RADIUS
	end
	return shared.GetOrbitRadius()
end

--// Vị trí tâm (X/Z) của object trong Workspace.
local function getColumnPosition(obj)
	if not obj then return nil end
	if obj:IsA("BasePart") then
		local ok, pos = pcall(function() return obj.Position end)
		if ok then return pos end
		return nil
	end
	local ok, primary = pcall(function() return obj.PrimaryPart end)
	if ok and primary and primary:IsA("BasePart") then
		return primary.Position
	end
	for _, child in ipairs(obj:GetChildren()) do
		if child:IsA("BasePart") then return child.Position end
	end
	return nil
end

--// Hướng bay + tốc độ (stud/s) của object di chuyển thẳng (predictive).
--// Ưu tiên velocity của BasePart; fallback suy từ 2 frame position gần nhất.
local function getObjectVelocity(col)
	local obj = col.Instance
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

--// Phát hiện object mới xuất hiện / loại bỏ object biến mất (quản lý membership).
--// Hỗ trợ cả 2 kiểu: kinematic (COLUMN_NAMES) và predictive (STRAIGHT_DODGE_NAMES).
local function refreshColumns()
	local Workspace = game:GetService("Workspace")
	local seen = {}
	for _, child in ipairs(Workspace:GetChildren()) do
		if COLUMN_NAMES[child.Name] or STRAIGHT_DODGE_NAMES[child.Name] then
			seen[child] = true
			local predicted = STRAIGHT_DODGE_NAMES[child.Name] == true
			local entry = activeColumns[child]
			if not entry then
				local pos = getColumnPosition(child)
				if pos then
					activeColumns[child] = {
						Instance = child,
						Position = pos,
						OldPosition = pos,
						Predicted = predicted,
						Age = 1,
					}
				end
			else
				entry.Predicted = entry.Predicted or predicted
			end
		end
	end
	for inst in pairs(activeColumns) do
		if not seen[inst] or not inst.Parent then
			activeColumns[inst] = nil
		end
	end
end

--// Cập nhật vị trí object mỗi lần tính toán (bám theo chuyển động nhanh).
--// Lưu OldPosition + Age để suy hướng di chuyển khi cần (predictive).
local function updateColumnPositions(now)
	for _, col in pairs(activeColumns) do
		if col and col.Instance then
			local pos = getColumnPosition(col.Instance)
			if pos then
				if col.OldPosition then
					col.Age = (now or os.clock()) - (col.LastUpdate or 0)
					if col.Age < 1e-3 then col.Age = 1e-3 end
				end
				col.OldPosition = col.Position
				col.Position = pos
				col.LastUpdate = now or os.clock()
			end
		end
	end
end

local function horizontalDistance(a, b)
	local dx = b.X - a.X
	local dz = b.Z - a.Z
	return math.sqrt(dx * dx + dz * dz)
end

--// Điểm trên quỹ đạo quanh boss ứng với góc, độ cao cố định height.
local function orbitPoint(center, radius, angle, height)
	return Vector3.new(center.X + math.cos(angle) * radius, height, center.Z + math.sin(angle) * radius)
end

local function degToIdx(deg)
	return math.floor((((deg % 360) + 360) % 360) / SAMPLE_STEP) % N
end

local function idxToRad(idx)
	return math.rad(idx * SAMPLE_STEP)
end

--// Line-circle intersection: tia từ P theo dir (unit), giới hạn phía trước
--// maxDist = speed*PREDICT_WINDOW. Trả về điểm cắt orbit có 0 <= t <= maxDist.
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

--// Đánh dấu danger interval quanh một góc (deg) trên danger map.
local function markDangerInterval(danger, centerDeg, halfWidthDeg)
	for deg = centerDeg - halfWidthDeg, centerDeg + halfWidthDeg do
		danger[degToIdx(deg)] = true
	end
end

--// Predictive: mỗi object thuộc diện "di chuyển thẳng nhanh" đóng góp danger
--// interval tại góc orbit nơi tia bay (giới hạn PREDICT_WINDOW) cắt quỹ đạo.
--// Bán kính interval tính theo stud (PREDICTIVE_OBJECT_RADIUS) để khớp với
--// dải dead zone được vẽ.
local function markPredictiveDangers(danger, bossPos, radius)
	local halfWidthDeg = math.deg(PREDICTIVE_OBJECT_RADIUS / math.max(radius, 1))
	for _, col in pairs(activeColumns) do
		if col and col.Predicted and col.Position then
			local vel = getObjectVelocity(col)
			if vel and vel.Magnitude > MIN_SPEED_THRESHOLD then
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

--// Điểm orbit tại idx có nằm trong phạm vi nguy hiểm của cục nào không.
local function isSampleDanger(bossPos, radius, height, idx)
	local point = orbitPoint(bossPos, radius, idxToRad(idx), height)
	for _, col in pairs(activeColumns) do
		if col and col.Position and not col.Predicted and horizontalDistance(point, col.Position) < DANGER_RADIUS then
			return true
		end
	end
	return false
end

--// Xây Danger Map: hybrid 2 loại dodge trên cùng mảng danger[]. Kinematic
--// chặn quanh cục (isSampleDanger); predictive chặn interval quanh điểm cắt.
local function buildDangerMap(bossPos, radius, height)
	local danger = {}
	for i = 0, N - 1 do
		danger[i] = isSampleDanger(bossPos, radius, height, i)
	end
	markPredictiveDangers(danger, bossPos, radius)
	return danger
end

--// ---------- Safety Score (chọn chỗ an toàn nhất) ----------
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

--// Điểm an toàn của node: ưu tiên khoảng cách tới dead zone (margin), phá quãng
--// bằng độ rộng run. Càng xa biên + trong run càng rộng -> điểm càng cao.
local function safetyScore(danger, idx)
	if danger[idx] then return -1 end
	return marginToDanger(danger, idx) * 1000 + math.min(safeRunWidth(danger, idx), MAX_MARGIN_CAP)
end

--// Node an toàn nhất trên toàn orbit (điểm cao nhất). Trả về idx + điểm của nó.
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

--// Teleport player tới góc (idx) trên quỹ đạo quanh boss, mặt hướng boss.
--// Dùng height cố định (không bám playerPos.Y) để duy trì độ cao.
local function teleportToAngle(bossPos, radius, height, idx)
	local character = player.Character
	local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
	if not character or not playerRoot or not playerRoot.Parent then return end
	if not character.PrimaryPart then character.PrimaryPart = playerRoot end

	local targetPos = orbitPoint(bossPos, radius, idxToRad(idx), height)
	local humanoid = character:FindFirstChild("Humanoid")
	local oldAutoRotate = humanoid and humanoid.AutoRotate
	if humanoid then humanoid.AutoRotate = false end

	character:PivotTo(CFrame.lookAt(targetPos, bossPos))
	playerRoot.AssemblyLinearVelocity, playerRoot.AssemblyAngularVelocity = Vector3.zero, Vector3.zero

	if humanoid then humanoid.AutoRotate = oldAutoRotate end
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

--// Bóng nguy hiểm quanh cục kinematic (bán kính DANGER_RADIUS)
local function renderKinematicBalls(parent)
	for _, col in pairs(activeColumns) do
		if col and col.Position and not col.Predicted then
			local part = createVisualPart(parent, 0.65)
			part.Shape = Enum.PartType.Ball
			part.Size = Vector3.new(DANGER_RADIUS * 2, DANGER_RADIUS * 2, DANGER_RADIUS * 2)
			part.CFrame = CFrame.new(col.Position)
			part.Color = VISUALS_BALL_COLOR
		end
	end
end

--// Tia dead zone của object predictive: dải rộng 2D (2×PREDICTIVE_OBJECT_RADIUS)
--// dọc theo hướng bay, dài speed×PREDICT_WINDOW - thể hiện vùng mặt đất quét qua.
local function renderPredictiveRays(parent)
	for _, col in pairs(activeColumns) do
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
				part.Size = Vector3.new(PREDICTIVE_OBJECT_RADIUS * 2, 0.5, len)
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

local function renderVisuals(bossPos, radius, height, danger)
	clearVisuals()
	if not debugVisuals then return end
	local parent = Instance.new("Folder")
	parent.Name = VISUALS_FOLDER
	parent.Parent = game:GetService("Workspace")
	renderKinematicBalls(parent)
	renderPredictiveRays(parent)
	renderArc(parent, bossPos, radius, height, danger)
end

--// Tính toán + teleport mỗi lần quét.
local function updateDodge()
	local character = player.Character
	local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
	if not character or not playerRoot or not playerRoot.Parent then return end
	local playerPos = playerRoot.Position
	local bossPos = shared.GetFarmTargetPosition()
	if not bossPos then
		if dodging then dodging = false; notifyDodgeChange() end
		return
	end

	updateColumnPositions(os.clock())

	--// Resolve bán kính quỹ đạo dodge theo Farm Mode
	local radius = getDodgeRadius()

	--// Dead zone visuals (debug): build + vẽ bất kể đang dodge hay không
	if debugVisuals then
		local visHeight = (dodging and currentHeight > 0) and currentHeight or playerPos.Y
		local visDanger = buildDangerMap(bossPos, radius, visHeight)
		renderVisuals(bossPos, radius, visHeight, visDanger)
	end

	--// Có object nào đang đe dọa vành đai quỹ đạo quanh boss không?
	local threat = false
	for _, col in pairs(activeColumns) do
		if col and col.Position then
			if not col.Predicted then
				if math.abs(horizontalDistance(bossPos, col.Position) - radius) <= DANGER_RADIUS then
					threat = true
					break
				end
			else
				--// Predictive: miễn object còn tồn tại trong activeColumns (chưa bị
				--// refreshColumns loại) là giữ dodge + stop orbit, bất kể velocity.
				threat = true
				break
			end
		end
	end

	if not threat then
		if dodging then dodging = false; notifyDodgeChange() end
		return
	end

	if not dodging then
		dodging = true
		--// Giữ độ cao hiện tại của player khi bắt đầu dodge (tránh nhảy xuống thấp)
		currentHeight = playerPos.Y
		notifyDodgeChange()
	end

	--// Góc hiện tại của player trên orbit (tính từ vị trí ngang hiện tại)
	local toPlayer = playerPos - bossPos
	local curIdx = degToIdx(math.deg(math.atan2(toPlayer.Z, toPlayer.X)))

	local danger = buildDangerMap(bossPos, radius, currentHeight)

	--// Chọn theo Safety Score + giữ ổn định (hysteresis)
	local curScore = safetyScore(danger, curIdx)
	local bestIdx, bestScore = bestSafeIndex(danger, curIdx)
	local curMargin = marginToDanger(danger, curIdx)

	local shouldTele = false
	if curScore < 0 then
		--// đang trong dead zone -> buộc né
		shouldTele = true
	elseif curMargin < MIN_SAFE_MARGIN and bestIdx ~= curIdx then
		--// an toàn nhưng quá sát mép dead zone -> nhích vào chỗ an toàn hơn
		shouldTele = true
	elseif (bestScore - curScore) > SWITCH_THRESHOLD then
		--// chỗ khác tốt hơn hẳn -> đổi
		shouldTele = true
	end

	if shouldTele and bestIdx ~= curIdx then
		teleportToAngle(bossPos, radius, currentHeight, bestIdx)
	end
end

--// Render dead zone visuals độc lập (khi chỉ bật visuals, chưa bật Smart Dodge)
local function updateVisuals()
	local character = player.Character
	local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
	local bossPos = shared.GetFarmTargetPosition()
	if not bossPos then
		clearVisuals()
		return
	end
	local radius = getDodgeRadius()
	local height = (playerRoot and dodging and currentHeight > 0) and currentHeight or (playerRoot and playerRoot.Position.Y) or 0
	local danger = buildDangerMap(bossPos, radius, height)
	renderVisuals(bossPos, radius, height, danger)
end

--// Methods
function dodge.Init()
	if loopRunning then return end
	loopRunning = true

	task.spawn(function()
		while true do
			if enabled or debugVisuals then
				pcall(refreshColumns)
			end
			task.wait(SCAN_INTERVAL)
		end
	end)

	task.spawn(function()
		while true do
			if enabled then
				updateDodge()
			elseif debugVisuals then
				pcall(updateVisuals)
			end
			task.wait(RECALC_INTERVAL)
		end
	end)
end

function dodge.Toggle(state)
	enabled = state == true
	if not enabled then
		dodging = false
		notifyDodgeChange()
		activeColumns = {}
		clearVisuals()
	end
end

function dodge.IsEnabled()
	return enabled
end

function dodge.IsDodging()
	return dodging
end

function dodge.GetBossRadius()
	return BOSS_RADIUS
end

function dodge.SetBossRadius(value)
	BOSS_RADIUS = value
end

function dodge.GetDangerRadius()
	return DANGER_RADIUS
end

function dodge.SetDangerRadius(value)
	DANGER_RADIUS = value
end

function dodge.GetRecalcInterval()
	return RECALC_INTERVAL
end

function dodge.SetRecalcInterval(value)
	RECALC_INTERVAL = value
end

function dodge.GetPredictWindow()
	return PREDICT_WINDOW
end

function dodge.SetPredictWindow(value)
	PREDICT_WINDOW = value
end

function dodge.SetDebugVisuals(value)
	debugVisuals = value == true
	if not debugVisuals then clearVisuals() end
end

function dodge.IsDebugVisuals()
	return debugVisuals
end

--// API quản lý danh sách skill theo từng kiểu dodge
function dodge.AddColumnName(name)
	if name and type(name) == "string" then COLUMN_NAMES[name] = true end
end

function dodge.AddStraightDodgeName(name)
	if name and type(name) == "string" then STRAIGHT_DODGE_NAMES[name] = true end
end

function dodge.GetColumnNames()
	local out = {}
	for k in pairs(COLUMN_NAMES) do table.insert(out, k) end
	table.sort(out)
	return out
end

function dodge.GetStraightDodgeNames()
	local out = {}
	for k in pairs(STRAIGHT_DODGE_NAMES) do table.insert(out, k) end
	table.sort(out)
	return out
end

return dodge
