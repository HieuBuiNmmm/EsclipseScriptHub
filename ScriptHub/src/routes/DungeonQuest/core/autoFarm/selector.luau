-- Target Movement System – Component C: Target Selector & Path Calculator
-- Spec: Sections 5 & 6 (Roblox_Target_Movement_System_AI_Spec.txt)

local PathfindingService = game:GetService("PathfindingService")

local selector = {}

local PATH_PARAMS = {
	AgentRadius = 1,
	AgentHeight = 5,
	AgentCanJump = true,
	AgentCanClimb = true,
	AgentMaxSlope = 75,
	WaypointSpacing = 4,
	Costs = { Water = 20, Lava = 20 },
}

local PATH_PARAMS_RELAXED = {
	AgentRadius = 0.25,
	AgentHeight = 4,
	AgentCanJump = true,
	AgentCanClimb = true,
	AgentMaxSlope = 90,
	WaypointSpacing = 6,
	Costs = {},
}

--// Computes Pathfinding path and movement cost along waypoints.
function selector.ComputePathWithCost(startPos, destPos)
	for _, params in ipairs({ PATH_PARAMS, PATH_PARAMS_RELAXED }) do
		local path = PathfindingService:CreatePath(params)
		local ok = pcall(function()
			path:ComputeAsync(startPos, destPos)
		end)
		if ok and path.Status == Enum.PathStatus.Success then
			local waypoints = path:GetWaypoints()
			if waypoints and #waypoints > 0 then
				local totalCost = 0
				local prev = startPos
				for i = 1, #waypoints do
					local w = waypoints[i].Position
					totalCost += (w - prev).Magnitude
					prev = w
				end
				return path, waypoints, totalCost
			end
		end
		pcall(function() path:Destroy() end)
	end
	return nil, nil, math.huge
end

--// Evaluates all valid enemies and selects the one with the lowest Pathfinding movement cost.
function selector.SelectBestTarget(playerPos, validEnemies, cancelCheck)
	local bestTarget = nil
	local bestCost = math.huge
	local bestPath = nil
	local bestWaypoints = nil
	local bestPos = nil

	for _, enemyData in ipairs(validEnemies) do
		if cancelCheck and cancelCheck() then
			if bestPath then pcall(function() bestPath:Destroy() end) end
			return nil, nil, nil, nil, math.huge
		end

		local root = enemyData.Root
		if root and root.Parent then
			local ePos = root.Position
			local path, waypoints, cost = selector.ComputePathWithCost(playerPos, ePos)
			if cancelCheck and cancelCheck() then
				if path then pcall(function() path:Destroy() end) end
				if bestPath then pcall(function() bestPath:Destroy() end) end
				return nil, nil, nil, nil, math.huge
			end

			if path and cost < bestCost then
				if bestPath then pcall(function() bestPath:Destroy() end) end
				bestCost = cost
				bestTarget = enemyData
				bestPath = path
				bestWaypoints = waypoints
				bestPos = ePos
			else
				if path then pcall(function() path:Destroy() end) end
			end
		end
	end

	return bestTarget, bestPath, bestWaypoints, bestPos, bestCost
end

return selector
