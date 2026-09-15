-- HazardScanner – Candidate Generator (DungeonQuest).
-- Module chuyên trách sinh tập điểm ứng viên (Candidate Generation) bằng thuật toán Progressive Radial Sampling.
-- Độc lập hoàn toàn với Rendering và State (Pure Math / Stateless).
-- Hỗ trợ Momentum Alignment: Ưu tiên chọn hướng né thuận theo hướng người chơi đang chạy.

--// Table
local candidateGenerator = {}

--// Cấu hình Progressive Radial Directions
-- Tier 1 (Coarse Resolution): 8 hướng (mỗi 45 độ)
local COARSE_DIRECTIONS = {}
local NUM_COARSE = 8
for i = 1, NUM_COARSE do
	local angle = (i - 1) * (2 * math.pi / NUM_COARSE)
	COARSE_DIRECTIONS[i] = Vector3.new(math.cos(angle), 0, math.sin(angle))
end

-- Tier 2 (Fine Resolution): 16 hướng (mỗi 22.5 độ)
local FINE_DIRECTIONS = {}
local NUM_FINE = 16
for i = 1, NUM_FINE do
	local angle = (i - 1) * (2 * math.pi / NUM_FINE)
	FINE_DIRECTIONS[i] = Vector3.new(math.cos(angle), 0, math.sin(angle))
end

-- Bán kính lấy mẫu thô (Coarse Radii) và đầy đủ (Fine Radii)
local COARSE_RADII = { 1.5, 3.0, 5.0, 8.0, 12.0, 18.0, 25.0 }
local FINE_RADII = { 1.5, 3.0, 4.5, 6.0, 8.0, 10.5, 13.5, 17.0, 21.0, 26.0, 32.0, 40.0 }

candidateGenerator.COARSE_DIRECTIONS = COARSE_DIRECTIONS
candidateGenerator.FINE_DIRECTIONS = FINE_DIRECTIONS
candidateGenerator.COARSE_RADII = COARSE_RADII
candidateGenerator.FINE_RADII = FINE_RADII

--// Kiểm tra đường đi thẳng từ origin2D tới targetPoint có bị cắt ngang bởi Red Danger Zone NGOẠI TRỪ chiêu nhân vật đang đứng trong không
--// initialRedHazardsMap: map {[hazardInfo] = true} của các hazard đỏ chứa origin2D
--// queryRedHazardFn: function(pt, extraMargin) -> hit (bool), hitInfo (table/instance), hitPart
function candidateGenerator.IsPathClear(origin2D, targetPoint, queryRedHazardFn, initialRedHazardsMap, stepSize)
	if not queryRedHazardFn then return true end
	stepSize = stepSize or 2.0
	local diff = targetPoint - origin2D
	local dist = diff.Magnitude
	if dist <= stepSize then
		return true
	end

	local dir = diff / dist
	local numSteps = math.floor(dist / stepSize)
	local exitedInitialHazards = {}

	for i = 1, numSteps do
		local samplePoint = origin2D + dir * (i * stepSize)
		local hit, hitInfo = queryRedHazardFn(samplePoint, 0)

		if hit and hitInfo then
			local isInitial = initialRedHazardsMap and (initialRedHazardsMap[hitInfo] == true or (hitInfo.Instance and initialRedHazardsMap[hitInfo.Instance]))
			if not isInitial then
				-- Đụng trúng một Red Danger Zone HOÀN TOÀN MỚI (không phải chiêu player đang đứng trong) -> Bị cắt ngang!
				return false
			else
				-- Nếu là chiêu ban đầu nhưng tia đã từng đi ra khỏi nó rồi mà giờ lại đụng lại (re-enter) -> Bị cắt ngang!
				if exitedInitialHazards[hitInfo] then
					return false
				end
			end
		else
			-- Điểm này không chạm hazard nào -> Tất cả các hazard ban đầu chạm trước đó giờ đã thoát ra ngoài
			if initialRedHazardsMap then
				for hInfo, _ in pairs(initialRedHazardsMap) do
					exitedInitialHazards[hInfo] = true
				end
			end
		end
	end

	return true
end

--// Chạy 1 pass quét lấy mẫu xung quanh origin2D
function candidateGenerator.SamplePass(origin2D, directions, radii, safetyBuffer, requireBuffer, isPointSafeFn, evaluatedList, momentumDir, queryRedHazardFn, initialRedHazardsMap)
	local bestPoint = nil
	local bestDist = math.huge
	local bestDir = Vector3.zero
	local found = false

	-- Sắp xếp thứ tự kiểm tra hướng theo độ thuận chiều với hướng đang chạy (Momentum Alignment)
	local sortedDirections = directions
	if momentumDir and momentumDir.Magnitude > 0.1 then
		local mDir = Vector3.new(momentumDir.X, 0, momentumDir.Z).Unit
		sortedDirections = table.clone(directions)
		table.sort(sortedDirections, function(a, b)
			local dotA = a.X * mDir.X + a.Z * mDir.Z
			local dotB = b.X * mDir.X + b.Z * mDir.Z
			return dotA > dotB -- Hướng nào thuận chiều với đà chạy hơn được xét trước
		end)
	end

	for _, radius in ipairs(radii) do
		local foundAtThisRadius = false

		for _, dir in ipairs(sortedDirections) do
			local candidate = origin2D + dir * radius
			local isSafe = isPointSafeFn(candidate)

			if isSafe then
				local targetPoint = candidate
				if requireBuffer and safetyBuffer > 0 then
					local pushed = candidate + dir * safetyBuffer
					if isPointSafeFn(pushed) then
						targetPoint = pushed
					end
				end

				-- Kiểm tra đường đi thẳng tới targetPoint có bị vùng đỏ (Red Zone) mới cắt ngang không
				local pathSafe = candidateGenerator.IsPathClear(origin2D, targetPoint, queryRedHazardFn, initialRedHazardsMap, 2.0)
				if not pathSafe then
					isSafe = false
				else
					local dist = (targetPoint - origin2D).Magnitude
					if dist < bestDist then
						bestDist = dist
						bestPoint = targetPoint
						bestDir = dir
						foundAtThisRadius = true
					end
				end
			end

			if evaluatedList then
				table.insert(evaluatedList, {
					pos = candidate,
					isSafe = isSafe,
					isChosen = false,
				})
			end
		end

		if foundAtThisRadius and bestPoint then
			found = true
			break
		end
	end

	return bestPoint, found, bestDist, bestDir
end

return candidateGenerator
