--!nocheck
-- HazardScannerV2 - Tactical Potential Field & Continuous Spatial Intelligence
-- Giải quyết bài toán:
-- 1. Bot LUÔN LUÔN di chuyển: Giữ nhịp chân chiến thuật, nhấp nhả lướt quanh mục tiêu.
-- 2. Tự động hướng về VÙNG ĐẤT RỘNG ÍT SKILL (Open Space & Low Hazard Density).
-- 3. Né đón đầu THREAT CORRIDORS & GROUND HAZARDS dựa trên toàn bộ dữ liệu quỹ đạo đã biết.
-- 4. Nhận diện THẾ BÍ (Pocket Trap): Nếu xung quanh bị vây kín bởi bão chiêu/tường,
--    ĐỨNG YÊN TUYỆT ĐỐI chờ chiêu nổ xong rồi mới tiếp tục di chuyển, không bao giờ bước bừa vào lửa!
-- 5. Tự động cân bằng giữa Donut Arena Sweet-Spot và cự ly chiến đấu [Min, Max].

local Workspace = game:GetService("Workspace")

local danger = require("@routes/DungeonQuest/core/hazardScannerV2/danger")
local corridor = require("@routes/DungeonQuest/core/hazardScannerV2/corridor")
local safeSpotV2 = require("@routes/DungeonQuest/core/hazardScannerV2/safeSpotV2")
local contextual = require("@routes/DungeonQuest/core/contextual")
local shared = require("@routes/DungeonQuest/core/shared")

local tacticalField = {}

-- Weights & Parameters
local WEIGHT_HAZARD_REPULSION = 5.0
local WEIGHT_CORRIDOR_REPULSION = 6.0
local WEIGHT_WALL_REPULSION = 4.0
local WEIGHT_DONUT_ATTRACTION = 3.5
local WEIGHT_OPEN_ATTRACTION = 3.0
local WEIGHT_COMBAT_ORBIT = 1.5

-- State cache
local lastOrbitSign = 1
local lastOrbitSwitchTime = 0

-- Đổi hướng orbit (quay cùng chiều / ngược chiều kim đồng hồ)
local function getOrbitDirection(toEnemyDir: Vector3): Vector3
	local perp = Vector3.new(-toEnemyDir.Z, 0, toEnemyDir.X) * lastOrbitSign
	return perp
end

function tacticalField.SwitchOrbit()
	local now = os.clock()
	if now - lastOrbitSwitchTime > 1.5 then
		lastOrbitSign = -lastOrbitSign
		lastOrbitSwitchTime = now
	end
end

-- Đánh giá xem vị trí candidate có an toàn và thoáng không
local function evaluatePointClearance(point: Vector3, activeHazards: any): number
	if not danger.IsPointSafe(point, 0.8) then
		return -999.0
	end

	local minHazardDist = 999.0
	if activeHazards then
		for _, data in pairs(activeHazards) do
			if data.shape and data.shape.x and data.shape.z then
				local dx = point.X - data.shape.x
				local dz = point.Z - data.shape.z
				local d = math.sqrt(dx * dx + dz * dz)
				local edgeD = d - (data.shape.radius or data.shape.halfLength or 15.0)
				if edgeD < minHazardDist then
					minHazardDist = edgeD
				end
			end
		end
	end

	return minHazardDist
end

-- Tìm sector rộng và an toàn nhất trong phòng (Open Space Horizon)
local function findOpenHorizonSector(playerPos: Vector3, enemyPos: Vector3, targetRadius: number, activeHazards: any): (Vector3?, number)
	local bestSectorPos = nil
	local bestScore = -math.huge

	for i = 0, 15 do
		local angle = (i / 16) * (math.pi * 2)
		local candX = enemyPos.X + math.cos(angle) * targetRadius
		local candZ = enemyPos.Z + math.sin(angle) * targetRadius
		local candPos = Vector3.new(candX, playerPos.Y, candZ)

		local clearance = evaluatePointClearance(candPos, activeHazards)
		if clearance > 0 then
			-- Đo khoảng cách tường tại candidate
			local minWallDist = 999.0
			for wAngle = 0, 315, 90 do
				local wRad = math.rad(wAngle)
				local dir = Vector3.new(math.cos(wRad), 0, math.sin(wRad))
				local wDist = safeSpotV2.GetWallDistance and safeSpotV2.GetWallDistance(candPos, dir, 15.0)
				if wDist and wDist < minWallDist then
					minWallDist = wDist
				end
			end

			if minWallDist >= 3.5 then
				local distFromPlayer = (candPos - playerPos).Magnitude
				-- Điểm cao nếu: cách xa hazard lớn, xa tường lớn, và gần người chơi
				local score = clearance * 1.5 + minWallDist * 2.0 - (distFromPlayer * 0.8)
				if score > bestScore then
					bestScore = score
					bestSectorPos = candPos
				end
			end
		end
	end

	return bestSectorPos, bestScore
end

-- ĐÁNH GIÁ TRƯỜNG THẾ NĂNG & DÒNG CHẢY CHIẾN THUẬT (60 FPS)
-- Trả về: (action, moveVector, targetPos, reason)
-- action = "MOVE" | "HOLD_WAIT" | "DODGE_PREEMPT"
function tacticalField.EvaluateTacticalFlow(
	playerPos: Vector3,
	enemyPos: Vector3,
	target: any,
	minCombatDist: number,
	maxCombatDist: number
): (string, Vector3, Vector3?, string)
	if not playerPos or not enemyPos then
		return "HOLD_WAIT", Vector3.zero, nil, "No Target/Position"
	end

	-- 1. Nếu nhân vật đang dính nguy hiểm trực tiếp -> Nhường quyền tuyệt đối cho Dodge Controller
	if danger.IsPlayerInDanger() then
		return "DODGE_PREEMPT", Vector3.zero, nil, "Emergency Dodge"
	end

	local activeHazards = danger.GetActiveHazards()
	local isBossAreaActive, bossAreaRadius, bossAreaCenter, isInnerDeadzoneActive, innerDeadzoneRadius = contextual.GetActiveBossArea(target)

	-- 2. BÀI TOÁN THẾ BÍ (POCKET TRAP DETECTION)
	-- Kiểm tra 8 hướng xung quanh bước đi 2.0 studs. Nếu KHÔNG CÓ BẤT KỲ HƯỚNG NÀO BƯỚC ĐƯỢC
	-- (bị bao vây hoàn toàn bởi lửa/đạn/tường) -> ĐỨNG YÊN CHỜ SKILL BIẾN MẤT!
	local safeStepCount = 0
	local safeDirs: { Vector3 } = {}

	for angle = 0, 315, 45 do
		local rad = math.rad(angle)
		local dir = Vector3.new(math.cos(rad), 0, math.sin(rad))
		local testStep = playerPos + dir * 2.0

		if danger.IsPointSafe(testStep, 0.4) then
			local wDist = safeSpotV2.GetWallDistance and safeSpotV2.GetWallDistance(playerPos, dir, 2.5)
			if not wDist or wDist >= 2.0 then
				safeStepCount += 1
				table.insert(safeDirs, dir)
			end
		end
	end

	if safeStepCount == 0 then
		-- TẤT CẢ CÁC BƯỚC XUNG QUANH ĐỀU DÍNH LỬA/TƯỜNG -> ĐỨNG YÊN AN TOÀN TRONG KHE
		return "HOLD_WAIT", Vector3.zero, playerPos, "Pocket Trap (Wait For Hazard)"
	end

	-- 3. TÍNH TOÁN BẢN ĐỒ THẾ NĂNG (POTENTIAL FIELD)
	local netForce = Vector3.zero

	-- A. Lực đẩy từ Ground Hazards (Đẩy xa các vệt đỏ)
	local hazardForce = Vector3.zero
	if activeHazards then
		for _, data in pairs(activeHazards) do
			if data.shape and data.shape.x and data.shape.z then
				local hPos = Vector3.new(data.shape.x, 0, data.shape.z)
				local toPlayer = Vector3.new(playerPos.X - hPos.X, 0, playerPos.Z - hPos.Z)
				local dist = toPlayer.Magnitude
				local rad = data.shape.radius or data.shape.halfLength or 12.0
				local bufferDist = rad + 14.0 -- Vùng cảnh giới đẩy nhẹ
				if dist < bufferDist and dist > 0.1 then
					local weight = math.clamp((bufferDist - dist) / bufferDist, 0, 1)
					hazardForce += toPlayer.Unit * (weight * WEIGHT_HAZARD_REPULSION)
				end
			end

			-- B. Lực đẩy từ Threat Corridors (Né đón đầu vuông góc đường ray đạn bay)
			if data.shape and data.shape.corridor then
				local corr = data.shape.corridor
				local _, _, _, _, _, lateralEscapeDir = corridor.GetThreatMetrics(playerPos, corr, data.motion, 0)
				if lateralEscapeDir and lateralEscapeDir.Magnitude > 0.1 then
					hazardForce += lateralEscapeDir * WEIGHT_CORRIDOR_REPULSION
				end
			end
		end
	end
	netForce += hazardForce

	-- C. Lực đẩy từ Tường Map & Chướng ngại vật
	local wallForce = Vector3.zero
	if safeSpotV2.GetWallDistance then
		for angle = 0, 315, 45 do
			local rad = math.rad(angle)
			local dir = Vector3.new(math.cos(rad), 0, math.sin(rad))
			local wDist = safeSpotV2.GetWallDistance(playerPos, dir, 8.0)
			if wDist and wDist < 7.0 then
				local weight = (7.0 - wDist) / 7.0
				wallForce -= dir * (weight * WEIGHT_WALL_REPULSION)
			end
		end
	end
	netForce += wallForce

	-- D. Lực điều hướng Donut Arena & Sweet-Spot
	local donutForce = Vector3.zero
	if isBossAreaActive and bossAreaCenter and bossAreaRadius and bossAreaRadius > 0 then
		local bCenter = Vector3.new(bossAreaCenter.X, 0, bossAreaCenter.Z)
		local p2D = Vector3.new(playerPos.X, 0, playerPos.Z)
		local distToCenter = (p2D - bCenter).Magnitude
		local toCenterDir = (bCenter - p2D).Magnitude > 0.1 and (bCenter - p2D).Unit or Vector3.new(0, 0, 1)

		if isInnerDeadzoneActive and innerDeadzoneRadius and innerDeadzoneRadius > 0 then
			local midR = (innerDeadzoneRadius + bossAreaRadius) * 0.5
			local diff = distToCenter - midR

			if diff > 4.0 then
				-- Quá xa tâm Donut -> kéo nhẹ vào trong
				donutForce += toCenterDir * math.clamp(diff / 8.0, 0.5, 1.0) * WEIGHT_DONUT_ATTRACTION
			elseif diff < -3.0 then
				-- Quá gần tâm Boss -> đẩy mạnh ra ngoài vành
				donutForce -= toCenterDir * math.clamp(math.abs(diff) / 6.0, 0.8, 1.5) * WEIGHT_DONUT_ATTRACTION
			end
		else
			-- Sàn đấu tròn thường: ngăn rớt mép sàn
			if distToCenter > (bossAreaRadius - 10.0) then
				donutForce += toCenterDir * WEIGHT_DONUT_ATTRACTION
			end
		end
	end
	netForce += donutForce

	-- E. Lực hút về Vùng Đất Trống Nhất (Open Horizon Sector)
	local openForce = Vector3.zero
	local idealRadius = (minCombatDist + maxCombatDist) * 0.5
	if isBossAreaActive and bossAreaCenter and isInnerDeadzoneActive and innerDeadzoneRadius and innerDeadzoneRadius > 0 then
		local midR = (innerDeadzoneRadius + bossAreaRadius) * 0.5
		idealRadius = math.clamp(midR, minCombatDist + 1.0, maxCombatDist - 1.0)
	end

	local openTargetPos, openScore = findOpenHorizonSector(playerPos, enemyPos, idealRadius, activeHazards)
	if openTargetPos then
		local toOpen = Vector3.new(openTargetPos.X - playerPos.X, 0, openTargetPos.Z - playerPos.Z)
		if toOpen.Magnitude > 2.0 then
			openForce = toOpen.Unit * WEIGHT_OPEN_ATTRACTION
		end
	end
	netForce += openForce

	-- F. Lực giữ cự ly Combat & Nhịp chân Orbit Strafe
	local combatDelta = Vector3.new(playerPos.X - enemyPos.X, 0, playerPos.Z - enemyPos.Z)
	local flatDist = combatDelta.Magnitude
	local toPlayerDir = flatDist > 0.1 and combatDelta.Unit or Vector3.new(0, 0, 1)

	local combatForce = Vector3.zero
	if flatDist < (minCombatDist + 2.0) then
		-- Quá gần -> lùi nhẹ
		combatForce += toPlayerDir * 3.0
	elseif flatDist > (maxCombatDist - 2.0) then
		-- Quá xa -> tiến nhẹ
		combatForce -= toPlayerDir * 3.0
	else
		-- Đang trong khoảng đẹp -> Orbit nhấp nhả quanh mục tiêu
		local orbitDir = getOrbitDirection(-toPlayerDir)
		combatForce += orbitDir * WEIGHT_COMBAT_ORBIT
	end
	netForce += combatForce

	-- 4. TỔNG HỢP VECTO & BƯỚC ĐI AN TOÀN
	local desiredDir = netForce.Magnitude > 0.05 and netForce.Unit or getOrbitDirection(-toPlayerDir)

	-- Kiểm tra bước chân 2 studs theo desiredDir
	local stepPos = playerPos + desiredDir * 2.0
	if danger.IsPointSafe(stepPos, 0.4) then
		local wDist = safeSpotV2.GetWallDistance and safeSpotV2.GetWallDistance(playerPos, desiredDir, 2.5)
		if not wDist or wDist >= 2.0 then
			return "MOVE", desiredDir, openTargetPos, "Tactical Flow (Open Space)"
		end
	end

	-- Nếu desiredDir bị cản nhưng có các hướng an toàn khác trong safeDirs:
	-- Chọn hướng an toàn có góc lệch gần với desiredDir nhất
	local bestSafeDir = nil
	local bestSafeDot = -math.huge
	for _, sDir in ipairs(safeDirs) do
		local dot = sDir:Dot(desiredDir)
		if dot > bestSafeDot then
			bestSafeDot = dot
			bestSafeDir = sDir
		end
	end

	if bestSafeDir and bestSafeDot > -0.5 then
		return "MOVE", bestSafeDir, openTargetPos, "Tactical Flow (Divert)"
	end

	-- Nếu đổi hướng vẫn gặp nguy hiểm: Tạm thời đứng vững tại khe an toàn chờ chiêu tắt
	return "HOLD_WAIT", Vector3.zero, playerPos, "Pocket Trap (Wait For Opening)"
end

return tacticalField
