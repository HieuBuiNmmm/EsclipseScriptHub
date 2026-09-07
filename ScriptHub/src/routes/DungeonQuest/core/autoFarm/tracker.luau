-- Target Movement System – Component D: Target Tracker & Path Manager
-- Spec: Sections 7, 8, 14, 15 (Roblox_Target_Movement_System_AI_Spec.txt)

local selector = require("@routes/DungeonQuest/core/autoFarm/selector")
local scanner = require("@routes/DungeonQuest/core/autoFarm/scanner")

local tracker = {}

local currentTarget = nil
local currentPathInstance = nil
local currentWaypoints = {}
local currentWaypointIndex = 1
local lastPathDestPos = nil
local repathThreshold = 6 -- Studs target must move to trigger repath

function tracker.GetTarget()
	return currentTarget
end

function tracker.GetPathInstance()
	return currentPathInstance
end

function tracker.GetWaypoints()
	return currentWaypoints
end

function tracker.GetWaypointIndex()
	return currentWaypointIndex
end

function tracker.SetWaypointIndex(val)
	currentWaypointIndex = math.clamp(val, 1, math.max(1, #currentWaypoints))
end

function tracker.AdvanceWaypointIndex(playerPos)
	if not currentWaypoints or #currentWaypoints == 0 then return end
	local wp = currentWaypoints[currentWaypointIndex]
	if wp then
		local flatDist = Vector3.new(wp.Position.X - playerPos.X, 0, wp.Position.Z - playerPos.Z).Magnitude
		if flatDist <= 3.5 then
			currentWaypointIndex = math.min(#currentWaypoints + 1, currentWaypointIndex + 1)
		end
	end
end

function tracker.GetLastPathDestPos()
	return lastPathDestPos
end

function tracker.SetRepathThreshold(val)
	if type(val) == "number" and val > 0 then
		repathThreshold = val
	end
end

function tracker.GetRepathThreshold()
	return repathThreshold
end

function tracker.SetTarget(target, pathInstance, waypoints, destPos)
	if currentPathInstance and currentPathInstance ~= pathInstance then
		pcall(function() currentPathInstance:Destroy() end)
	end

	currentTarget = target
	currentPathInstance = pathInstance
	currentWaypoints = waypoints or {}
	currentWaypointIndex = 1
	lastPathDestPos = destPos
end

function tracker.UpdatePath(pathInstance, waypoints, destPos)
	if currentPathInstance and currentPathInstance ~= pathInstance then
		pcall(function() currentPathInstance:Destroy() end)
	end

	currentPathInstance = pathInstance
	currentWaypoints = waypoints or {}
	currentWaypointIndex = 1
	lastPathDestPos = destPos
end


function tracker.ClearTarget()
	if currentPathInstance then
		pcall(function() currentPathInstance:Destroy() end)
	end
	currentTarget = nil
	currentPathInstance = nil
	currentWaypoints = {}
	currentWaypointIndex = 1
	lastPathDestPos = nil
end

-- Validates whether the current target is still active, alive, and exists
function tracker.IsTargetValid()
	if not currentTarget then return false end
	return scanner.Validate(currentTarget)
end

-- Checks if target position shifted beyond repath threshold
function tracker.NeedsRepath(currentEnemyPos)
	if not currentPathInstance or not currentWaypoints or #currentWaypoints == 0 then
		return true
	end
	if not lastPathDestPos or not currentEnemyPos then
		return true
	end
	return (currentEnemyPos - lastPathDestPos).Magnitude > repathThreshold
end

-- Repaths toward current target's current position
function tracker.Repath(playerPos, currentEnemyPos)
	if not currentEnemyPos then return false end

	local path, waypoints, cost = selector.ComputePathWithCost(playerPos, currentEnemyPos)
	if path and #waypoints > 0 then
		if currentPathInstance then pcall(function() currentPathInstance:Destroy() end) end
		currentPathInstance = path
		currentWaypoints = waypoints
		currentWaypointIndex = 1
		lastPathDestPos = currentEnemyPos
		return true
	end

	return false
end

return tracker
