--!nocheck
-- HazardScannerV2 - Temporal Awareness & Spatiotemporal Prediction Engine (Phase 2)
-- Đưa trục THỜI GIAN (t) vào hệ thống nhận thức và ra quyết định:
-- 1. DYNAMIC LIFESPAN LEARNING:
--    - Tự động đo đạc và học thời gian tồn tại chính xác của từng chiêu thức theo template name.
-- 2. TIME-TO-IMPACT (TTI) & URGENCY MODULATION:
--    - Chiêu sắp nổ (<0.4s) -> Thoát nhanh tối đa (Critical Urgency).
--    - Chiêu tụ lực (>1.5s) -> Điềm tĩnh chọn vị trí chiến lược đẹp nhất (Low Urgency).
-- 3. ARRIVAL TIME SAFETY (t_arrival = dist / WalkSpeed):
--    - Dự phóng vị trí tương lai của các chiêu thức / đạn di động (Motion Kinematics) tại t = now + t_arrival.
-- 4. PATH INTERCEPTION:
--    - Phát hiện đạn bay cắt ngang hành lang di chuyển của Player trong quá trình chạy.
-- 5. TEMPORAL SAFEZONE (Phase-Through):
--    - Nhận biết các vùng chiêu thức đang đỏ nhưng sẽ tắt trước khi Player bước tới nơi để tự tin bước xuyên qua.

--// Imports
local Players = game:GetService("Players")
local services = require("@routes/DungeonQuest/core/services")
local motion = require("@routes/DungeonQuest/core/hazardScannerV2/motion")

--// Table
local temporal = {}

--// State: Dynamic Online Lifespan Learning
-- Lưu trữ thời gian tồn tại quan sát được (giây) của từng loại template chiêu thức
local learnedLifespans: { [string]: number } = {
	["SweepingFlames"] = 3.2,
	["CrissCross"] = 2.5,
	["Memory"] = 2.0,
	["GroundCircle"] = 1.8,
	["DefaultAoE"] = 2.0,
}

--// Config
local enabled = true
local enableTemporalScoring = true
local enableFuturePrediction = true
local enablePhaseThrough = true

-- Lấy tên mẫu chuẩn (template key) từ displayName của hazard
local function getTemplateKey(displayName: string?): string
	if not displayName then return "DefaultAoE" end
	if string.find(displayName, "SweepingFlames") then
		return "SweepingFlames"
	elseif string.find(displayName, "CrissCross") then
		return "CrissCross"
	elseif string.find(displayName, "Memory") then
		return "Memory"
	elseif string.find(displayName, "Circle") or string.find(displayName, "Cylinder") then
		return "GroundCircle"
	end
	-- Lấy phần prefix trước dấu '/' nếu có
	local slashPos = string.find(displayName, "/")
	if slashPos then
		return string.sub(displayName, 1, slashPos - 1)
	end
	return displayName
end

-- Lấy vận tốc chạy thực tế của Player
function temporal.GetPlayerWalkSpeed(): number
	local lp = (services and services.player) or Players.LocalPlayer
	local char = lp and lp.Character
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health > 0 and hum.WalkSpeed and hum.WalkSpeed >= 8 then
		return hum.WalkSpeed
	end
	return 20.0 -- Mặc định chuẩn Dungeon Quest
end

--==============================================================================
-- 1. DYNAMIC LIFESPAN LEARNING & TTI ESTIMATION
--==============================================================================

-- Ghi nhận khi một Hazard Part biến mất khỏi sàn đấu
function temporal.OnHazardUnregistered(part: BasePart, hazardData: any)
	if not hazardData or not hazardData.spawnTime then return end
	local now = os.clock()
	local actualLifespan = now - hazardData.spawnTime

	-- Chỉ học nếu thời gian nằm trong khoảng hợp lý của một chiêu thức (0.4s -> 12.0s)
	if actualLifespan >= 0.4 and actualLifespan <= 12.0 then
		local key = getTemplateKey(hazardData.name)
		local current = learnedLifespans[key]
		if current then
			-- EMA (Exponential Moving Average): Cập nhật mượt mà
			learnedLifespans[key] = current * 0.6 + actualLifespan * 0.4
		else
			learnedLifespans[key] = actualLifespan
		end
	end
end

-- Ước tính tổng thời gian tồn tại (lifespan) của chiêu thức
function temporal.GetEstimatedLifespan(displayName: string?, shapeData: any?): number
	local key = getTemplateKey(displayName)
	if learnedLifespans[key] then
		return learnedLifespans[key]
	end
	return learnedLifespans["DefaultAoE"] or 2.0
end

-- Ước tính thời gian còn lại trước khi nổ / kết thúc (Time-To-Impact)
function temporal.GetTimeToImpact(hazardData: any, currentTime: number?): number
	if not hazardData or not hazardData.spawnTime then
		return 1.8
	end
	local now = currentTime or os.clock()
	local elapsed = now - hazardData.spawnTime
	local totalLifespan = temporal.GetEstimatedLifespan(hazardData.name, hazardData.shape)
	return math.max(0.05, totalLifespan - elapsed)
end

-- Phân loại mức độ khẩn cấp (Urgency) của mối đe dọa hiện tại
function temporal.GetThreatUrgency(activeHazards: any, currentThreatData: any): (string, number)
	if not currentThreatData then
		return "LOW", 999.0
	end

	local now = os.clock()
	local tti = temporal.GetTimeToImpact(currentThreatData, now)

	if tti <= 0.40 then
		return "CRITICAL", tti
	elseif tti <= 0.85 then
		return "HIGH", tti
	elseif tti <= 1.50 then
		return "NORMAL", tti
	else
		return "LOW", tti
	end
end

--==============================================================================
-- 2. KINEMATIC & FUTURE TRAJECTORY PREDICTION (t_arrival)
--==============================================================================

-- Kiểm tra xem 1 toạ độ (px, pz) có va chạm với shape tại tâm (cx, cz) không
local function isPointInsideShape(px: number, pz: number, cx: number, cz: number, shape: any, padding: number): boolean
	local dx = px - cx
	local dz = pz - cz

	if shape.shape == "circle" and shape.radius then
		local r = shape.radius + padding
		return (dx * dx + dz * dz) <= (r * r)
	elseif shape.shape == "box" and shape.halfWidth and shape.halfLength and shape.fwd2D and shape.right2D then
		local projL = math.abs(dx * shape.fwd2D.X + dz * shape.fwd2D.Z)
		local projW = math.abs(dx * shape.right2D.X + dz * shape.right2D.Z)
		return (projW <= shape.halfWidth + padding) and (projL <= shape.halfLength + padding)
	end

	-- Fallback hình tròn
	local r = 6.0 + padding
	return (dx * dx + dz * dz) <= (r * r)
end

--==============================================================================
-- 3. SPATIOTEMPORAL CANDIDATE EVALUATION
--==============================================================================

-- Đánh giá toàn diện khía cạnh Thời Gian cho 1 ứng viên Safe Spot
function temporal.EvaluateCandidateTemporal(
	origin: Vector3,
	dir: Vector3,
	foundDist: number,
	walkSpeed: number,
	activeHazards: any,
	currentThreatData: any
): (number, boolean, boolean, boolean, number)
	if not enabled or not enableTemporalScoring then
		return 0, false, false, false, 0
	end

	local now = os.clock()
	local speed = math.max(10.0, walkSpeed or 20.0)
	local tArrival = foundDist / speed

	local targetX = origin.X + dir.X * foundDist
	local targetZ = origin.Z + dir.Z * foundDist

	local temporalDelta = 0
	local isFutureColliding = false
	local isPathIntercepted = false
	local isPhaseThrough = false

	-- A. Urgency Modulation (Điều chỉnh trọng số khoảng cách theo TTI)
	local urgency, threatTTI = temporal.GetThreatUrgency(activeHazards, currentThreatData)
	if urgency == "CRITICAL" then
		-- Chiêu sắp nổ (<0.4s): Bắt buộc ưu tiên thoát gần nhất, thưởng thêm nếu cự ly ngắn
		if foundDist <= 4.0 then
			temporalDelta += 10.0
		else
			temporalDelta -= (foundDist - 4.0) * 2.5
		end
	elseif urgency == "LOW" then
		-- Chiêu tụ lực (>1.5s): Không cần vội, giảm áp lực khoảng cách để tự do chọn vị trí đẹp
		temporalDelta += math.min(6.0, foundDist * 0.4)
	end

	if not activeHazards or next(activeHazards) == nil then
		return temporalDelta, false, false, false, tArrival
	end

	-- B. Dự phóng va chạm tương lai tại t = now + tArrival
	if enableFuturePrediction then
		for part, data in pairs(activeHazards) do
			local shape = data.shape
			if not shape then continue end

			local sx = shape.x or 0
			local sz = shape.z or 0

			-- 1. Nếu là Hazard DI ĐỘNG (Đạn bay / Quái lao tới từ motion.luau)
			local mot = data.motion or motion.GetRecord(part)
			if mot and mot.speed and mot.speed >= 2.0 and mot.velocity then
				-- Vị trí tương lai của quả đạn tại thời điểm Player đến đích:
				local futureHx = sx + mot.velocity.X * tArrival
				local futureHz = sz + mot.velocity.Z * tArrival

				if isPointInsideShape(targetX, targetZ, futureHx, futureHz, shape, 1.5) then
					isFutureColliding = true
					temporalDelta -= 38.0 -- Phạt kịch khung: Đích đến sẽ bị đạn đâm trúng!
				end

				-- 2. Path Interception (Đạn cắt ngang đường chạy của Player giữa chừng)
				local samples = 3
				for s = 1, samples do
					local tau = (s / samples) * tArrival
					local playerAtTauX = origin.X + dir.X * (foundDist * (s / samples))
					local playerAtTauZ = origin.Z + dir.Z * (foundDist * (s / samples))
					local hazardAtTauX = sx + mot.velocity.X * tau
					local hazardAtTauZ = sz + mot.velocity.Z * tau

					local dSq = (playerAtTauX - hazardAtTauX)^2 + (playerAtTauZ - hazardAtTauZ)^2
					local dangerRadius = (shape.radius or 5.0) + 2.0
					if dSq <= (dangerRadius * dangerRadius) then
						isPathIntercepted = true
						temporalDelta -= 32.0 -- Đạn cắt ngang mặt lúc đang chạy!
						break
					end
				end
			end

			-- 3. Temporal SafeZone / Phase-Through (Điểm đích đang đỏ nhưng sẽ tắt trước khi đến)
			if enablePhaseThrough and currentThreatData and data ~= currentThreatData then
				local hTTI = temporal.GetTimeToImpact(data, now)
				-- Nếu chiêu này đang phủ lên đích đến lúc t=0, nhưng sẽ biến mất trước khi ta bước tới:
				if isPointInsideShape(targetX, targetZ, sx, sz, shape, 0) then
					if hTTI + 0.15 < tArrival then
						-- Chiêu sẽ nổ xong và biến mất trước khi ta bước tới nơi -> SafeZone tương lai!
						isPhaseThrough = true
						temporalDelta += 14.0 -- Thưởng lớn vì chọn được vùng trống đón đầu
					else
						-- Chiêu vẫn còn tồn tại khi ta đến nơi -> Phạt không được chạy vào
						temporalDelta -= 25.0
					end
				end
			end
		end
	end

	return temporalDelta, isFutureColliding, isPathIntercepted, isPhaseThrough, tArrival
end

--==============================================================================
-- 4. CONTROLS & GETTERS / SETTERS
--==============================================================================

function temporal.SetEnabled(state: boolean)
	enabled = state and true or false
end

function temporal.IsEnabled(): boolean
	return enabled
end

function temporal.SetFuturePrediction(state: boolean)
	enableFuturePrediction = state and true or false
end

function temporal.IsFuturePrediction(): boolean
	return enableFuturePrediction
end

function temporal.SetPhaseThrough(state: boolean)
	enablePhaseThrough = state and true or false
end

function temporal.IsPhaseThrough(): boolean
	return enablePhaseThrough
end

function temporal.GetLearnedLifespans()
	return learnedLifespans
end

return temporal
