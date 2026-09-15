-- Target Movement System – Component C: Target Selector
-- Selects the nearest valid enemy instantaneously (0ms, no Pathfinding latency)

local selector = {}

--// Evaluates all valid enemies and selects the one nearest to the player
function selector.SelectBestTarget(playerPos, validEnemies, cancelCheck)
	local bestTarget = nil
	local bestDistSq = math.huge
	local bestPos = nil

	for _, enemyData in ipairs(validEnemies) do
		if cancelCheck and cancelCheck() then
			return nil, nil, nil, nil, math.huge
		end

		local root = enemyData.Root
		if root and root.Parent then
			local ePos = root.Position
			local dx = ePos.X - playerPos.X
			local dz = ePos.Z - playerPos.Z
			local distSq = dx * dx + dz * dz

			if distSq < bestDistSq then
				bestDistSq = distSq
				bestTarget = enemyData
				bestPos = ePos
			end
		end
	end

	local bestDist = bestDistSq < math.huge and math.sqrt(bestDistSq) or math.huge
	return bestTarget, nil, nil, bestPos, bestDist
end

return selector
