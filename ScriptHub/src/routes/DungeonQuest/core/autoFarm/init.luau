-- Auto Farm System – Component G: State / Interrupt Manager & Facade
-- Spec: Sections 2, 16, 17, 18, 19, 20 (Roblox_Target_Movement_System_AI_Spec.txt)

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local coordinator = require("@routes/DungeonQuest/core/coordinator")

local scanner = require("@routes/DungeonQuest/core/autoFarm/scanner")
local selector = require("@routes/DungeonQuest/core/autoFarm/selector")
local tracker = require("@routes/DungeonQuest/core/autoFarm/tracker")
local movement = require("@routes/DungeonQuest/core/autoFarm/movement")

--// Services
local RunService = services.RunService
local player = services.player

--// State Machine Enum
local State = {
	NO_TARGET = "NO_TARGET",
	ACQUIRING_TARGET = "ACQUIRING_TARGET",
	TRACKING_TARGET = "TRACKING_TARGET",
	CHASE = "CHASE",
	HOLD = "HOLD",
	BLOCKED = "BLOCKED",
	REPATHING = "REPATHING",
}

local autoFarm = {}

--// Configuration Parameters
local enabled = false
local running = false
local scanInterval = 1.5 -- Seconds between periodic target scans
local reachDistance = 8.0 -- Studs distance to consider target reached (HOLD state)
local repathDistance = 6.0 -- Studs target moves before triggering repath

--// Visual Debug Flags
local showPlannedPath = true
local showActualPath = true
local showTargetVisual = true
local showBlockerRay = true -- Show Red/Green Blocker Detection Ray

--// Runtime State
local currentState = State.NO_TARGET
local currentDestination = nil
local currentDestMode = "None"
local currentDestNodeIndex = nil
local lastBlockerData = nil
local lastScanTime = 0
local selectToken = 0
local selectRunning = false
local moveConnection = nil
local enemyChangedConnection = nil
local respawnConnection = nil
local dunReady = false

--// Velocity Stuck Detection State
local stuckTimer = 0
local lastJumpTime = 0
local autoJumpOnStuck = false -- Toggle tự động nhảy khi vận tốc thấp
local stuckVelocityThreshold = 10.0 -- Ngưỡng vận tốc (studs/s)
local isPaused = false -- Tạm dừng di chuyển mà không hủy path





--// Visual Instances
local debugTargetPart = nil
local debugEnemyHighlight = nil
local debugPathLines = {}
local debugPathAdornee = nil
local debugActualLine = nil
local debugActualMarkerPart = nil
local debugBlockerLine = nil
local debugBlockerHitMarker = nil
local debugPathCacheKey = nil

--// Forward declarations
local evaluateTarget

--// ============================================================
--// HELPERS
--// ============================================================

local function getPlayerRoot()
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if root and root.Parent then return root end
	return nil
end

local function getSafePosition(part)
	if not part or not part.Parent then return nil end
	local ok, pos = pcall(function() return part.Position end)
	if not ok or not pos then return nil end
	return pos
end

--// ============================================================
--// TARGET SWITCHING & EVALUATION (System A)
--// ============================================================

local function isSameTarget(a, b)
	if a == b then return true end
	if a and b and a.Model and b.Model and a.Model == b.Model then
		return true
	end
	return false
end

local function applyTargetSwitch(newTarget, newPath, newWaypoints, newPos)
	local cur = tracker.GetTarget()
	if isSameTarget(cur, newTarget) then
		if newPath then
			tracker.UpdatePath(newPath, newWaypoints, newPos)
		end
		return
	end

	-- Priority 2: New target selected -> Interrupt current movement
	tracker.SetTarget(newTarget, newPath, newWaypoints, newPos)
	currentDestination = nil
	currentDestMode = "None"
	currentDestNodeIndex = nil
	lastBlockerData = nil
	stuckTimer = 0


	if newTarget then
		if newPath and newWaypoints and #newWaypoints > 0 then
			currentState = State.TRACKING_TARGET
		else
			currentState = State.REPATHING
		end
	else
		currentState = State.NO_TARGET
	end
end


evaluateTarget = function()
	if selectRunning or not enabled or not running then return end
	selectToken += 1
	local token = selectToken
	selectRunning = true

	task.spawn(function()
		local ok, err = pcall(function()
			local root = getPlayerRoot()
			local playerPos = root and getSafePosition(root)
			if not playerPos then
				selectRunning = false
				return
			end

			local validList = scanner.Scan()
			if #validList == 0 then
				if token == selectToken and enabled and running then
					applyTargetSwitch(nil, nil, nil, nil)
				end
				selectRunning = false
				return
			end

			local bestTarget, bestPath, bestWaypoints, bestPos = selector.SelectBestTarget(
				playerPos,
				validList,
				function()
					return token ~= selectToken or not enabled or not running
				end
			)

			if token == selectToken and enabled and running then
				applyTargetSwitch(bestTarget, bestPath, bestWaypoints, bestPos)
			else
				if bestPath then pcall(function() bestPath:Destroy() end) end
			end
		end)

		selectRunning = false
		if not ok then
			warn(("[AutoFarm] Error in evaluation: %s"):format(tostring(err)))
		end
	end)
end

--// ============================================================
--// MOVEMENT LOOP (System B - Continuous on Heartbeat)
--// ============================================================

local function stepMovementLoop(deltaTime)
	if shared.IsInLobby() or not dunReady then return end

	local playerRoot = getPlayerRoot()
	local humanoid = shared.GetHumanoid()
	if not playerRoot or not humanoid or humanoid.Health <= 0 then
		return
	end

	local playerPos = getSafePosition(playerRoot)
	if not playerPos then return end

	-- Nếu đang tạm dừng di chuyển (giữ vị trí khi combat hoặc né) -> không bước tiếp
	if isPaused then
		return
	end

	-- Periodic Target Rescan (System A)
	local now = os.clock()
	if now - lastScanTime >= scanInterval then
		lastScanTime = now
		if currentState ~= State.HOLD then
			evaluateTarget()
		end
	end

	-- Priority 1: Current target invalid/dead/destroyed
	local target = tracker.GetTarget()
	if target then
		if not tracker.IsTargetValid() then
			-- Immediate Target Invalidation (Section 14)
			tracker.ClearTarget()
			currentState = State.NO_TARGET
			currentDestination = nil
			currentDestMode = "None"
			lastBlockerData = nil
			evaluateTarget()
			pcall(function() humanoid:MoveTo(playerPos) end)
			return
		end
	end

	-- Priority 1b: No target
	if not target or currentState == State.NO_TARGET then
		currentDestination = nil
		currentDestMode = "None"
		lastBlockerData = nil
		if not selectRunning and now - lastScanTime >= 0.5 then
			lastScanTime = now
			evaluateTarget()
		end
		return
	end

	local enemyPos = target.Root and getSafePosition(target.Root)
	if not enemyPos then
		tracker.ClearTarget()
		currentState = State.NO_TARGET
		lastBlockerData = nil
		return
	end

	-- Check Target Reach Condition (Enter HOLD State)
	local flatDist = Vector3.new(enemyPos.X - playerPos.X, 0, enemyPos.Z - playerPos.Z).Magnitude
	if flatDist <= reachDistance then
		currentState = State.HOLD
		currentDestination = nil
		currentDestMode = "Hold"
		stuckTimer = 0
		pcall(function() humanoid:MoveTo(playerPos) end)
		-- State HOLD: Currently holds position (idle)
		return
	else
		if currentState == State.HOLD then
			currentState = State.CHASE
		end
	end

	-- Target Tracking & Repath check (Sections 7 & 15)
	local needsRepath = false
	if currentState == State.REPATHING or currentState == State.BLOCKED or not tracker.GetPathInstance() then
		needsRepath = true
	elseif tracker.NeedsRepath(enemyPos) then
		needsRepath = true
	end

	if needsRepath then
		local repathSuccess = tracker.Repath(playerPos, enemyPos)
		if repathSuccess then
			currentState = State.CHASE
		else
			-- Target unreachable
			currentState = State.BLOCKED
			currentDestination = nil
			currentDestMode = "Blocked"
			pcall(function() humanoid:MoveTo(playerPos) end)
			return
		end
	end

	-- Advance Waypoint Progression
	tracker.AdvanceWaypointIndex(playerPos)

	-- Blocking Checker & Blocked Destination Loop (Sections 10, 11, 12, 13)
	local waypoints = tracker.GetWaypoints()
	local waypointIdx = tracker.GetWaypointIndex()
	local ignoreList = { player.Character }
	if target.Model then
		table.insert(ignoreList, target.Model)
	end

	local chosenDest, mode, nodeIdx, blockerData = movement.ResolveDestination(playerPos, enemyPos, waypoints, waypointIdx, ignoreList)
	lastBlockerData = blockerData

	if mode == "Blocked" or not chosenDest then
		-- Blocking loop reached dead-end -> State = BLOCKED -> repath next frame
		currentState = State.BLOCKED
		currentDestination = nil
		currentDestMode = "Blocked"
		pcall(function() humanoid:MoveTo(playerPos) end)
		return
	end

	-- Movement Controller: Freewalk execution (State CHASE)
	currentState = State.CHASE
	currentDestination = chosenDest
	currentDestMode = mode
	currentDestNodeIndex = nodeIdx

	movement.ExecuteMove(humanoid, playerPos, chosenDest, waypoints, waypointIdx)

	-- Velocity-Based Stuck Detection & Auto-Jump
	local distToDest = (chosenDest - playerPos).Magnitude
	if distToDest >= 1.5 then
		local rootVel = playerRoot.AssemblyLinearVelocity or playerRoot.Velocity
		local horizontalSpeed = rootVel and Vector3.new(rootVel.X, 0, rootVel.Z).Magnitude or 0
		local dt = (type(deltaTime) == "number" and deltaTime > 0) and deltaTime or 0.016

		if horizontalSpeed < stuckVelocityThreshold then
			stuckTimer += dt
			if autoJumpOnStuck and (now - lastJumpTime) >= 0.4 then
				humanoid.Jump = true
				pcall(function() humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end)
				lastJumpTime = now
			end
			-- If stuck for >= 1.5s despite jumping -> Repath!
			if stuckTimer >= 1.5 then
				currentState = State.REPATHING
				stuckTimer = 0
			end
		else
			stuckTimer = 0
		end
	else
		stuckTimer = 0
	end
end






--// ============================================================
--// VISUAL DEBUGGING (Planned Path, Actual Move, Blocker Ray, Target)
--// ============================================================

local function ensureDebugTargetPart()
	if debugTargetPart and debugTargetPart.Parent then return debugTargetPart end
	debugTargetPart = Instance.new("Part")
	debugTargetPart.Name = "TM_TargetPart_Debug"
	debugTargetPart.Anchored = true
	debugTargetPart.CanCollide = false
	debugTargetPart.CanQuery = false
	debugTargetPart.CanTouch = false
	debugTargetPart.Size = Vector3.new(2, 2, 2)
	debugTargetPart.Transparency = 0.4
	debugTargetPart.Color = Color3.fromRGB(255, 50, 50)
	debugTargetPart.Material = Enum.Material.Neon
	debugTargetPart.Parent = workspace
	return debugTargetPart
end

local function ensureDebugHighlight()
	if debugEnemyHighlight and debugEnemyHighlight.Parent then return debugEnemyHighlight end
	if debugEnemyHighlight then
		pcall(function() debugEnemyHighlight:Destroy() end)
		debugEnemyHighlight = nil
	end
	debugEnemyHighlight = Instance.new("Highlight")
	debugEnemyHighlight.Name = "TM_EnemyHighlight_Debug"
	debugEnemyHighlight.FillColor = Color3.fromRGB(255, 200, 0)
	debugEnemyHighlight.FillTransparency = 0.5
	debugEnemyHighlight.OutlineColor = Color3.fromRGB(255, 0, 0)
	debugEnemyHighlight.OutlineTransparency = 0
	debugEnemyHighlight.Parent = workspace
	return debugEnemyHighlight
end

local function ensureDebugPathAdornee()
	if debugPathAdornee and debugPathAdornee.Parent then return debugPathAdornee end
	debugPathAdornee = Instance.new("Part")
	debugPathAdornee.Name = "TM_PathAdornee_Debug"
	debugPathAdornee.Anchored = true
	debugPathAdornee.CanCollide = false
	debugPathAdornee.CanQuery = false
	debugPathAdornee.CanTouch = false
	debugPathAdornee.Transparency = 1
	debugPathAdornee.Size = Vector3.new(1, 1, 1)
	debugPathAdornee.CFrame = CFrame.new(0, 0, 0)
	debugPathAdornee.Parent = workspace
	return debugPathAdornee
end

local function destroyPathVisuals()
	for _, obj in ipairs(debugPathLines) do
		pcall(function() obj:Destroy() end)
	end
	table.clear(debugPathLines)
	debugPathCacheKey = nil
end

local function updateVisualDebugs()
	if shared.IsInLobby() then return end

	local curTarget = tracker.GetTarget()
	local playerRoot = getPlayerRoot()
	local playerPos = playerRoot and getSafePosition(playerRoot)

	-- 1. Target Visuals
	if not showTargetVisual or not curTarget or not curTarget.Root then
		if debugTargetPart and debugTargetPart.Parent then
			debugTargetPart.CFrame = CFrame.new(0, -1000, 0)
		end
		if debugEnemyHighlight and debugEnemyHighlight.Parent then
			debugEnemyHighlight.Enabled = false
		end
	else
		local ePos = getSafePosition(curTarget.Root)
		if ePos then
			local part = ensureDebugTargetPart()
			part.CFrame = CFrame.new(ePos)
		end
		local hl = ensureDebugHighlight()
		if curTarget.Model and curTarget.Model.Parent then
			hl.Adornee = curTarget.Model
			hl.Enabled = true
		else
			hl.Enabled = false
		end
	end

	-- 2. Planned Path Visuals (Green line along waypoints)
	local waypoints = tracker.GetWaypoints()
	local pathInst = tracker.GetPathInstance()
	if not showPlannedPath or not waypoints or #waypoints == 0 then
		destroyPathVisuals()
	else
		local cacheKey = tostring(pathInst) .. "_" .. tostring(#waypoints)
		if debugPathCacheKey ~= cacheKey then
			destroyPathVisuals()
			local anchor = ensureDebugPathAdornee()
			for i = 2, #waypoints do
				local a = waypoints[i - 1].Position
				local b = waypoints[i].Position
				local dist = (b - a).Magnitude
				if dist > 0.01 then
					local line = Instance.new("LineHandleAdornment")
					line.Name = "TM_PathLine_Debug"
					line.Adornee = anchor
					line.Length = dist
					line.Thickness = 2
					line.Transparency = 0.3
					line.Color3 = Color3.fromRGB(0, 255, 120)
					line.ZIndex = 0
					line.CFrame = CFrame.lookAt(a, b)
					line.Parent = workspace
					debugPathLines[#debugPathLines + 1] = line
				end
			end
			debugPathCacheKey = cacheKey
		end
	end

	-- 3. Actual Destination Visuals (Cyan line + sphere marker)
	if not showActualPath or not currentDestination or not playerPos then
		if debugActualLine then debugActualLine.Visible = false end
		if debugActualMarkerPart and debugActualMarkerPart.Parent then
			debugActualMarkerPart.CFrame = CFrame.new(0, -1000, 0)
		end
	else
		local pPos = playerPos + Vector3.new(0, 0.5, 0)
		local dPos = currentDestination + Vector3.new(0, 0.5, 0)
		local dist = (dPos - pPos).Magnitude

		if dist >= 0.3 then
			if not debugActualLine or not debugActualLine.Parent then
				local anchor = ensureDebugPathAdornee()
				debugActualLine = Instance.new("LineHandleAdornment")
				debugActualLine.Name = "TM_ActualPath_Debug"
				debugActualLine.Adornee = anchor
				debugActualLine.Thickness = 3.5
				debugActualLine.Transparency = 0.15
				debugActualLine.Color3 = Color3.fromRGB(0, 230, 255)
				debugActualLine.ZIndex = 2
				debugActualLine.Parent = workspace
			end
			debugActualLine.Length = dist
			debugActualLine.CFrame = CFrame.lookAt(pPos, dPos)
			debugActualLine.Visible = true

			if not debugActualMarkerPart or not debugActualMarkerPart.Parent then
				debugActualMarkerPart = Instance.new("Part")
				debugActualMarkerPart.Name = "TM_ActualMarker_Debug"
				debugActualMarkerPart.Anchored = true
				debugActualMarkerPart.CanCollide = false
				debugActualMarkerPart.CanQuery = false
				debugActualMarkerPart.CanTouch = false
				debugActualMarkerPart.Shape = Enum.PartType.Ball
				debugActualMarkerPart.Size = Vector3.new(1.3, 1.3, 1.3)
				debugActualMarkerPart.Transparency = 0.2
				debugActualMarkerPart.Material = Enum.Material.Neon
				debugActualMarkerPart.Color = Color3.fromRGB(0, 230, 255)
				debugActualMarkerPart.Parent = workspace
			end
			debugActualMarkerPart.CFrame = CFrame.new(dPos)
		else
			if debugActualLine then debugActualLine.Visible = false end
			if debugActualMarkerPart and debugActualMarkerPart.Parent then
				debugActualMarkerPart.CFrame = CFrame.new(0, -1000, 0)
			end
		end
	end

	-- 4. Blocker Detection Ray Visual (Red line when blocked, Green when clear)
	if not showBlockerRay or not lastBlockerData or not playerPos or not curTarget then
		if debugBlockerLine then debugBlockerLine.Visible = false end
		if debugBlockerHitMarker and debugBlockerHitMarker.Parent then
			debugBlockerHitMarker.CFrame = CFrame.new(0, -1000, 0)
		end
	else
		local origin = lastBlockerData.origin or (playerPos + Vector3.new(0, 1.5, 0))
		local targetEnd = lastBlockerData.directHitPos or lastBlockerData.targetPos
		local isBlocked = lastBlockerData.directBlocked

		if targetEnd then
			local rayDist = (targetEnd - origin).Magnitude
			if rayDist >= 0.2 then
				if not debugBlockerLine or not debugBlockerLine.Parent then
					local anchor = ensureDebugPathAdornee()
					debugBlockerLine = Instance.new("LineHandleAdornment")
					debugBlockerLine.Name = "TM_BlockerRay_Debug"
					debugBlockerLine.Adornee = anchor
					debugBlockerLine.Thickness = 3
					debugBlockerLine.Transparency = 0.2
					debugBlockerLine.ZIndex = 3
					debugBlockerLine.Parent = workspace
				end

				debugBlockerLine.Length = rayDist
				debugBlockerLine.Color3 = isBlocked and Color3.fromRGB(255, 30, 30) or Color3.fromRGB(50, 255, 50)
				debugBlockerLine.CFrame = CFrame.lookAt(origin, targetEnd)
				debugBlockerLine.Visible = true

				-- Marker part at blocker hit location
				if isBlocked and lastBlockerData.directHitPos then
					if not debugBlockerHitMarker or not debugBlockerHitMarker.Parent then
						debugBlockerHitMarker = Instance.new("Part")
						debugBlockerHitMarker.Name = "TM_BlockerHitMarker_Debug"
						debugBlockerHitMarker.Anchored = true
						debugBlockerHitMarker.CanCollide = false
						debugBlockerHitMarker.CanQuery = false
						debugBlockerHitMarker.CanTouch = false
						debugBlockerHitMarker.Shape = Enum.PartType.Ball
						debugBlockerHitMarker.Size = Vector3.new(1.0, 1.0, 1.0)
						debugBlockerHitMarker.Material = Enum.Material.Neon
						debugBlockerHitMarker.Color = Color3.fromRGB(255, 30, 30)
						debugBlockerHitMarker.Parent = workspace
					end
					debugBlockerHitMarker.CFrame = CFrame.new(lastBlockerData.directHitPos)
				else
					if debugBlockerHitMarker and debugBlockerHitMarker.Parent then
						debugBlockerHitMarker.CFrame = CFrame.new(0, -1000, 0)
					end
				end
			else
				if debugBlockerLine then debugBlockerLine.Visible = false end
				if debugBlockerHitMarker and debugBlockerHitMarker.Parent then
					debugBlockerHitMarker.CFrame = CFrame.new(0, -1000, 0)
				end
			end
		end
	end
end

local function cleanupDebugVisuals()
	if debugTargetPart then pcall(function() debugTargetPart:Destroy() end); debugTargetPart = nil end
	if debugEnemyHighlight then pcall(function() debugEnemyHighlight:Destroy() end); debugEnemyHighlight = nil end
	if debugActualLine then pcall(function() debugActualLine:Destroy() end); debugActualLine = nil end
	if debugActualMarkerPart then pcall(function() debugActualMarkerPart:Destroy() end); debugActualMarkerPart = nil end
	if debugBlockerLine then pcall(function() debugBlockerLine:Destroy() end); debugBlockerLine = nil end
	if debugBlockerHitMarker then pcall(function() debugBlockerHitMarker:Destroy() end); debugBlockerHitMarker = nil end
	destroyPathVisuals()
	if debugPathAdornee then pcall(function() debugPathAdornee:Destroy() end); debugPathAdornee = nil end
end

--// ============================================================
--// PUBLIC API & ACCESSORS
--// ============================================================

function autoFarm.IsEnabled()
	return enabled
end

function autoFarm.IsRunning()
	return running
end

function autoFarm.GetState()
	return currentState
end

function autoFarm.GetScanInterval()
	return scanInterval
end

function autoFarm.SetScanInterval(val)
	if type(val) == "number" and val > 0.1 then
		scanInterval = val
	end
end

function autoFarm.GetReachDistance()
	return reachDistance
end

function autoFarm.SetReachDistance(val)
	if type(val) == "number" and val >= 1 then
		reachDistance = val
	end
end

function autoFarm.GetRepathDistance()
	return repathDistance
end

function autoFarm.SetRepathDistance(val)
	if type(val) == "number" and val >= 1 then
		repathDistance = val
		tracker.SetRepathThreshold(val)
	end
end

function autoFarm.SetAutoJumpOnStuck(state)
	autoJumpOnStuck = state and true or false
end

function autoFarm.IsAutoJumpOnStuckEnabled()
	return autoJumpOnStuck
end

function autoFarm.SetStuckVelocityThreshold(val)
	if type(val) == "number" and val >= 1 then
		stuckVelocityThreshold = val
	end
end

function autoFarm.GetStuckVelocityThreshold()
	return stuckVelocityThreshold
end

function autoFarm.SetPaused(state)
	local want = state and true or false
	if want == isPaused then return end
	isPaused = want
	if isPaused then
		local h = shared.GetHumanoid()
		local r = getPlayerRoot()
		if h and h.Parent and r then
			local p = getSafePosition(r)
			if p then
				pcall(function() h:MoveTo(p) end)
			end
		end
	end
end

function autoFarm.IsPaused()
	return isPaused
end

function autoFarm.IsPlannedPathVisualEnabled()
	return showPlannedPath
end

function autoFarm.SetPlannedPathVisual(val)
	showPlannedPath = val == true
	if not showPlannedPath then destroyPathVisuals() end
end

function autoFarm.IsActualPathVisualEnabled()
	return showActualPath
end

function autoFarm.SetActualPathVisual(val)
	showActualPath = val == true
	if not showActualPath then
		if debugActualLine then debugActualLine.Visible = false end
		if debugActualMarkerPart and debugActualMarkerPart.Parent then
			debugActualMarkerPart.CFrame = CFrame.new(0, -1000, 0)
		end
	end
end

function autoFarm.IsBlockerRayVisualEnabled()
	return showBlockerRay
end

function autoFarm.SetBlockerRayVisual(val)
	showBlockerRay = val == true
	if not showBlockerRay then
		if debugBlockerLine then debugBlockerLine.Visible = false end
		if debugBlockerHitMarker and debugBlockerHitMarker.Parent then
			debugBlockerHitMarker.CFrame = CFrame.new(0, -1000, 0)
		end
	end
end

function autoFarm.IsTargetVisualEnabled()
	return showTargetVisual
end

function autoFarm.SetTargetVisual(val)
	showTargetVisual = val == true
	if not showTargetVisual then
		if debugTargetPart and debugTargetPart.Parent then
			debugTargetPart.CFrame = CFrame.new(0, -1000, 0)
		end
		if debugEnemyHighlight and debugEnemyHighlight.Parent then
			debugEnemyHighlight.Enabled = false
		end
	end
end

function autoFarm.GetDebugInfo()
	local root = getPlayerRoot()
	local playerPos = root and getSafePosition(root)
	local curTarget = tracker.GetTarget()
	local enemyName = "-"
	local enemyDist = 0
	local enemyFlat = 0
	local waypoints = tracker.GetWaypoints()

	if curTarget and curTarget.Model then
		enemyName = curTarget.Model.Name or "-"
		local ePos = getSafePosition(curTarget.Root)
		if ePos and playerPos then
			enemyDist = (ePos - playerPos).Magnitude
			enemyFlat = Vector3.new(ePos.X - playerPos.X, 0, ePos.Z - playerPos.Z).Magnitude
		end
	end

	local blockerInfo = {
		directBlocked = false,
		blockerName = "None",
		blockerDist = 0,
	}

	if lastBlockerData then
		blockerInfo.directBlocked = lastBlockerData.directBlocked == true
		if lastBlockerData.directHitPart then
			blockerInfo.blockerName = lastBlockerData.directHitPart.Name or "Part"
		end
		if lastBlockerData.directHitPos and playerPos then
			blockerInfo.blockerDist = (lastBlockerData.directHitPos - playerPos).Magnitude
		end
	end

	local horizontalSpeed = 0
	local verticalSpeed = 0
	if root then
		local rootVel = root.AssemblyLinearVelocity or root.Velocity
		if rootVel then
			horizontalSpeed = Vector3.new(rootVel.X, 0, rootVel.Z).Magnitude
			verticalSpeed = rootVel.Y
		end
	end

	return {
		state = currentState,
		enemyName = enemyName,
		enemyDist = enemyDist,
		enemyFlat = enemyFlat,
		hasTarget = curTarget ~= nil,
		destMode = currentDestMode,
		nodeIndex = currentDestNodeIndex,
		waypointCount = waypoints and #waypoints or 0,
		hasDestination = currentDestination ~= nil,
		blocker = blockerInfo,
		velocity = horizontalSpeed,
		verticalVelocity = verticalSpeed,
		stuckTimer = stuckTimer,
	}
end


function autoFarm.Toggle(state, bypassCoordinator)
	if state == enabled then return end
	enabled = state

	if enabled then
		if not bypassCoordinator then
			coordinator.EnableExclusive("AutoFarm")
		end
		if moveConnection then moveConnection:Disconnect(); moveConnection = nil end

		running = true
		selectToken = 0
		selectRunning = false
		lastScanTime = 0
		tracker.SetRepathThreshold(repathDistance)

		if not enemyChangedConnection then
			enemyChangedConnection = shared.OnEnemyChanged(function()
				if enabled and running and currentState ~= State.HOLD then
					evaluateTarget()
				end
			end)
		end

		if not respawnConnection then
			respawnConnection = shared.OnRespawn(function()
				tracker.ClearTarget()
				currentState = State.NO_TARGET
				lastBlockerData = nil
				evaluateTarget()
			end)
		end

		if not dunReady then
			task.spawn(function()
				if shared.ReadyDungeon() then dunReady = true end
			end)
		end

		task.defer(evaluateTarget)

		moveConnection = RunService.Heartbeat:Connect(function(deltaTime)
			local ok, err = pcall(stepMovementLoop, deltaTime)
			if not ok then
				warn(("[AutoFarm] Error in stepMovementLoop: %s"):format(tostring(err)))
			end
			updateVisualDebugs()
		end)
	else
		if moveConnection then moveConnection:Disconnect(); moveConnection = nil end
		running = false
		if enemyChangedConnection then enemyChangedConnection(); enemyChangedConnection = nil end
		if respawnConnection then respawnConnection(); respawnConnection = nil end

		local h = shared.GetHumanoid()
		local r = getPlayerRoot()
		if h and h.Parent and r then
			local p = getSafePosition(r)
			if p then
				pcall(function() h:MoveTo(p) end)
			end
		end

		tracker.ClearTarget()
		currentState = State.NO_TARGET
		currentDestination = nil
		currentDestMode = "None"
		lastBlockerData = nil
		stuckTimer = 0
		selectToken += 1
		selectRunning = false
		cleanupDebugVisuals()




	end
end

--// Coordinator Registration & Lifecycle
coordinator.Register("AutoFarm", autoFarm.Toggle, autoFarm.IsEnabled)

lifecycle.Register(function()
	autoFarm.Toggle(false)
	cleanupDebugVisuals()
end)

return autoFarm
