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

--// Chạy 1 pass quét lấy mẫu xung quanh origin2D
function candidateGenerator.SamplePass(origin2D, directions, radii, safetyBuffer, requireBuffer, isPointSafeFn, evaluatedList, momentumDir)
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

			if evaluatedList then
				table.insert(evaluatedList, {
					pos = candidate,
					isSafe = isSafe,
					isChosen = false,
				})
			end

			if isSafe then
				local targetPoint = candidate
				if requireBuffer and safetyBuffer > 0 then
					local pushed = candidate + dir * safetyBuffer
					if isPointSafeFn(pushed) then
						targetPoint = pushed
					end
				end

				local dist = (targetPoint - origin2D).Magnitude
				if dist < bestDist then
					bestDist = dist
					bestPoint = targetPoint
					bestDir = dir
					foundAtThisRadius = true
				end
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
