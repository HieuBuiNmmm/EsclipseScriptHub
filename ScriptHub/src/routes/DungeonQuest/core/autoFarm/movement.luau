-- Target Movement System – Component E & F: Movement Controller & Blocking Checker
-- Spec: Sections 9, 10, 11, 12, 13 (Roblox_Target_Movement_System_AI_Spec.txt)

local services = require("@routes/DungeonQuest/core/services")
local player = services.player

local movement = {}

--// Builds base ignore list for Raycast
local function buildBaseIgnoreList(customIgnoreList)
	local list = {}
	if customIgnoreList then
		for _, item in ipairs(customIgnoreList) do
			if item and item.Parent then table.insert(list, item) end
		end
	end

	if player and player.Character and player.Character.Parent then
		table.insert(list, player.Character)
	end

	local rayIgnore = workspace:FindFirstChild("RaycastIgnore")
	if rayIgnore then
		table.insert(list, rayIgnore)
	end

	return list
end

--// Single Penetrative Raycast
-- Steps through any non-collidable parts (CanCollide == false)
-- Stops and reports blocked as soon as any collidable obstacle (CanCollide == true) is hit.
function movement.CastRay(fromPos, toPos, ignoreList)
	local direction = toPos - fromPos
	local dist = direction.Magnitude
	if dist < 0.3 then return false, nil, toPos end

	local rayParams = RaycastParams.new()
	rayParams.FilterType = Enum.RaycastFilterType.Exclude
	rayParams.FilterDescendantsInstances = buildBaseIgnoreList(ignoreList)
	rayParams.IgnoreWater = true

	local currentOrigin = fromPos
	local remainingDir = direction
	local maxSteps = 8

	for _ = 1, maxSteps do
		local result = workspace:Raycast(currentOrigin, remainingDir, rayParams)
		if not result then
			return false, nil, toPos
		end

		local hit = result.Instance
		if hit and hit.CanCollide and hit.CanQuery ~= false then
			-- Filter out walkable floors, slopes, ramps, and stairs
			-- Walkable surfaces have Normal.Y > 0.65 (slopes up to ~50° that player can step over)
			if result.Normal.Y > 0.65 then
				-- Walkable ground/slope -> advance past it
				local advance = (result.Position - currentOrigin).Magnitude + 0.15
				if advance >= remainingDir.Magnitude then
					return false, nil, toPos
				end
				currentOrigin = result.Position + remainingDir.Unit * 0.15
				remainingDir = toPos - currentOrigin
			else
				-- Steep vertical wall/pillar/obstacle (Normal.Y <= 0.65) -> BLOCKER!
				return true, hit, result.Position
			end
		else
			-- Advance origin slightly past this non-collidable part
			local advance = (result.Position - currentOrigin).Magnitude + 0.15
			if advance >= remainingDir.Magnitude then
				return false, nil, toPos
			end
			currentOrigin = result.Position + remainingDir.Unit * 0.15
			remainingDir = toPos - currentOrigin
		end
	end

	return false, nil, toPos
end

--// Multi-Ray Clearance Check
-- Checks Center ray + Left & Right shoulder clearance (prevents corner snagging)
function movement.CheckClearance(fromPos, toPos, ignoreList)
	-- 1. Center Ray
	local blocked, hitPart, hitPos = movement.CastRay(fromPos, toPos, ignoreList)
	if blocked then
		return true, hitPart, hitPos
	end

	-- 2. Side Clearance Rays (Offset by 0.6 studs)
	local flat = Vector3.new(toPos.X - fromPos.X, 0, toPos.Z - fromPos.Z)
	if flat.Magnitude > 0.8 then
		local forward = flat.Unit
		local sideOffset = Vector3.new(-forward.Z, 0, forward.X) * 0.6

		-- Check Left Shoulder
		local lOrigin = fromPos + sideOffset
		local lDest = toPos + sideOffset
		local lStartBlocked = movement.CastRay(fromPos, lOrigin, ignoreList)
		if not lStartBlocked then
			local lBlocked, lHitPart, lHitPos = movement.CastRay(lOrigin, lDest, ignoreList)
			if lBlocked and (lHitPos - lOrigin).Magnitude > 1.0 then
				return true, lHitPart, lHitPos
			end
		end

		-- Check Right Shoulder
		local rOrigin = fromPos - sideOffset
		local rDest = toPos - sideOffset
		local rStartBlocked = movement.CastRay(fromPos, rOrigin, ignoreList)
		if not rStartBlocked then
			local rBlocked, rHitPart, rHitPos = movement.CastRay(rOrigin, rDest, ignoreList)
			if rBlocked and (rHitPos - rOrigin).Magnitude > 1.0 then
				return true, rHitPart, rHitPos
			end
		end
	end

	return false, nil, toPos
end

--// Blocked Destination Resolution (Sections 11, 12, 13)
-- Iterates backward through path nodes when direct target line is blocked
function movement.ResolveDestination(playerPos, targetPos, waypoints, startWaypointIndex, ignoreList)
	local rayOrigin = playerPos
	local rayTarget = targetPos

	local blockerData = {
		origin = rayOrigin,
		targetPos = rayTarget,
		directBlocked = false,
		directHitPart = nil,
		directHitPos = nil,
		chosenDest = nil,
		mode = "None",
		nodeIdx = nil,
	}

	-- 1. Check direct line to target
	local directBlocked, hitPart, hitPos = movement.CheckClearance(rayOrigin, rayTarget, ignoreList)
	blockerData.directBlocked = directBlocked
	blockerData.directHitPart = hitPart
	blockerData.directHitPos = hitPos

	if not directBlocked then
		blockerData.chosenDest = targetPos
		blockerData.mode = "Direct"
		return targetPos, "Direct", nil, blockerData
	end

	-- 2. Direct line blocked: Iterate backward through path nodes (Node N -> Node startWaypointIndex)
	local minIndex = math.clamp(startWaypointIndex or 1, 1, waypoints and #waypoints or 1)
	if waypoints and #waypoints > 0 then
		for i = #waypoints, minIndex, -1 do
			local wp = waypoints[i]
			local nodePos = wp.Position
			local rayNode = nodePos + Vector3.new(0, 2.0, 0) -- Lift waypoint to match player waist height
			local nodeBlocked, nHitPart, nHitPos = movement.CheckClearance(rayOrigin, rayNode, ignoreList)
			if not nodeBlocked then
				blockerData.chosenDest = nodePos
				blockerData.mode = "Waypoint"
				blockerData.nodeIdx = i
				return nodePos, "Waypoint", i, blockerData
			end
		end
	end

	-- 3. All destinations blocked / No valid previous node exists
	blockerData.mode = "Blocked"
	return nil, "Blocked", nil, blockerData
end

--// Movement Controller (Section 9)
-- Executes Freewalk / direct MoveTo toward the clear destination
function movement.ExecuteMove(humanoid, playerPos, destination, waypoints, currentWaypointIndex)
	if not humanoid or not destination then return end

	humanoid:MoveTo(destination)

	-- 1. Check elevation jump to destination
	local elevDiff = destination.Y - playerPos.Y
	local flatDistToDest = Vector3.new(destination.X - playerPos.X, 0, destination.Z - playerPos.Z).Magnitude
	if elevDiff > 1.8 and flatDistToDest <= 7.0 then
		humanoid.Jump = true
		return
	end

	-- 2. Check path waypoints jump action for nearby upcoming waypoints
	if waypoints and #waypoints > 0 then
		local idx = math.clamp(currentWaypointIndex or 1, 1, #waypoints)
		for i = idx, math.min(idx + 2, #waypoints) do
			local wp = waypoints[i]
			if wp then
				local flatDist = Vector3.new(wp.Position.X - playerPos.X, 0, wp.Position.Z - playerPos.Z).Magnitude
				if flatDist <= 5.0 then
					if wp.Action == Enum.PathWaypointAction.Jump or (wp.Position.Y - playerPos.Y) > 1.8 then
						humanoid.Jump = true
						break
					end
				end
			end
		end
	end
end

return movement

