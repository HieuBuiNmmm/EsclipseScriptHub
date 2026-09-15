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
local hazardScanner = require("@routes/DungeonQuest/core/hazardScanner")
local autoSkill = require("@routes/DungeonQuest/core/autoFarm/autoSkill")
local contextual = require("@routes/DungeonQuest/core/contextual")

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
	KITE = "KITE",
	BLOCKED = "BLOCKED",
	REPATHING = "REPATHING",
}

local autoFarm = {}

--// Configuration Parameters
local enabled = false
local running = false
local scanInterval = 1.5 -- Seconds between periodic target scans
local mobMinDistance = 15.0 -- Studs: khoảng cách tối thiểu quái thường
local mobMaxDistance = 35.0 -- Studs: khoảng cách tối đa quái thường
local bossMinDistance = 25.0 -- Studs: khoảng cách tối thiểu Boss
local bossMaxDistance = 50.0 -- Studs: khoảng cách tối đa Boss
local autoFaceTarget = true -- Tự động xoay mặt nhìn về phía kẻ địch khi combat
local repathDistance = 6.0 -- Studs target moves before triggering repath

--// Visual Debug Flags
local showPlannedPath = true
local showActualPath = true
local showTargetVisual = true
local showBlockerRay = true -- Show Red/Green Blocker Detection Ray
local showCombatRangeVisual = true -- Show Min (Yellow) & Max (Green) Combat Range Circles

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

--// Visual Instances (Exclusively in CoreGui, zero physical parts in Workspace)
local debugEnemyHighlight = nil
local debugPathLines = {}
local debugActualLine = nil
local debugActualMarker = nil
local debugBlockerLine = nil
local debugBlockerHitMarker = nil
local debugMinDistanceFill = nil
local debugMinDistanceRing = nil
local debugMaxDistanceFill = nil
local debugMaxDistanceRing = nil
local debugBossAreaRing = nil
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

local function isTargetBoss(target)
	if shared.IsBossActive and shared.IsBossActive() then
		return true
	end
	if target then
		if target.Room and type(target.Room.Name) == "string" and string.find(string.lower(target.Room.Name), "boss") then
			return true
		end
		if target.Model then
			local modelName = string.lower(target.Model.Name)
			if string.find(modelName, "boss") then
				return true
			end
			local parent = target.Model.Parent
			if parent and string.find(string.lower(parent.Name), "boss") then
				return true
			end
		end
	end
	return false
end

local function getActiveCombatDistances(target)
	return contextual.GetActiveCombatDistances(target)
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

local function applyTargetSwitch(newTarget, newPos)
	local cur = tracker.GetTarget()
	if isSameTarget(cur, newTarget) then
		return
	end

	-- Priority 2: New target selected -> Interrupt current movement
	tracker.SetTarget(newTarget, nil, nil, newPos)
	currentDestination = nil
	currentDestMode = "None"
	currentDestNodeIndex = nil
	lastBlockerData = nil
	stuckTimer = 0

	if newTarget then
		currentState = State.CHASE
	else
		currentState = State.NO_TARGET
	end
end


evaluateTarget = function()
	if selectRunning or not enabled or not running then return end
	selectToken += 1
	local token = selectToken
	selectRunning = true

	local root = getPlayerRoot()
	local playerPos = root and getSafePosition(root)
	if not playerPos then
		selectRunning = false
		return
	end

	local validList = scanner.Scan()
	if #validList == 0 then
		if token == selectToken and enabled and running then
			applyTargetSwitch(nil, nil)
		end
		selectRunning = false
		return
	end

	local bestTarget, _, _, bestPos = selector.SelectBestTarget(
		playerPos,
		validList,
		function()
			return token ~= selectToken or not enabled or not running
		end
	)

	if token == selectToken and enabled and running then
		applyTargetSwitch(bestTarget, bestPos)
	end

	selectRunning = false
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

	-- Nếu Auto-Dodge đang chủ động né nguy hiểm -> tạm nhường quyền điều khiển di chuyển
	if hazardScanner.IsCurrentlyDodging and hazardScanner.IsCurrentlyDodging() then
		return
	end

	-- Nếu đang tạm dừng di chuyển (giữ vị trí khi combat hoặc né) -> không bước tiếp
	if isPaused then
		return
	end

	-- Periodic Target Rescan (System A)
	local now = os.clock()
	if now - lastScanTime >= scanInterval then
		lastScanTime = now
		if currentState ~= State.HOLD and currentState ~= State.KITE then
			evaluateTarget()
		end
	end

	-- Priority 1: Current target invalid/dead/destroyed
	local target = tracker.GetTarget()
	if target then
		if not tracker.IsTargetValid() then
			tracker.ClearTarget()
			currentState = State.NO_TARGET
			currentDestination = nil
			currentDestMode = "None"
			lastBlockerData = nil
			pcall(function()
				humanoid:MoveTo(playerPos)
				humanoid.AutoRotate = true
			end)
			evaluateTarget()
			return
		end
	end

	-- Priority 1b: No target
	if not target or currentState == State.NO_TARGET then
		currentDestination = nil
		currentDestMode = "None"
		lastBlockerData = nil
		pcall(function()
			humanoid:MoveTo(playerPos)
			humanoid.AutoRotate = true
		end)
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
		pcall(function()
			humanoid:MoveTo(playerPos)
			humanoid.AutoRotate = true
		end)
		return
	end

	-- Check Target Reach & Combat Range Condition ([minCombatDistance, maxCombatDistance])
	local minCombatDistance, maxCombatDistance = getActiveCombatDistances(target)
	local flatDelta = Vector3.new(enemyPos.X - playerPos.X, 0, enemyPos.Z - playerPos.Z)
	local flatDist = flatDelta.Magnitude

	-- Check Boss Area Constraint (Ưu tiên #1: Giữ vị trí trong vùng Boss Arena)
	local bossAreaEnabled, bossAreaRadius, bossAreaCenter = contextual.GetActiveBossArea(target)
	local isOutsideBossArea = false
	local bossCenter2D = nil

	if bossAreaEnabled and bossAreaCenter and bossAreaRadius and bossAreaRadius > 0 then
		bossCenter2D = Vector3.new(bossAreaCenter.X, 0, bossAreaCenter.Z)
		local distToBossCenter = (Vector3.new(playerPos.X, 0, playerPos.Z) - bossCenter2D).Magnitude
		if distToBossCenter > bossAreaRadius then
			isOutsideBossArea = true
		end
	end

	-- Nếu đang ở ngoài Boss Area: Ưu tiên quay lại trong Boss Area ngay lập tức!
	if isOutsideBossArea and bossCenter2D and bossAreaCenter then
		local enterTarget = Vector3.new(bossAreaCenter.X, playerPos.Y, bossAreaCenter.Z)
		currentState = State.CHASE
		currentDestMode = "Enter Boss Area"
		currentDestination = enterTarget
		stuckTimer = 0
		humanoid:MoveTo(enterTarget)
		return
	end

	-- Auto Face Target (Khóa xoay mặt nhìn thẳng về phía kẻ địch khi trong tầm combat)
	if autoFaceTarget and flatDist <= (maxCombatDistance + 25) then
		pcall(function()
			humanoid.AutoRotate = false
			local lookPos = Vector3.new(enemyPos.X, playerRoot.Position.Y, enemyPos.Z)
			if (lookPos - playerRoot.Position).Magnitude > 0.5 then
				playerRoot.CFrame = CFrame.lookAt(playerRoot.Position, lookPos)
			end
		end)
	else
		pcall(function() humanoid.AutoRotate = true end)
	end

	-- Auto Skill: Quản lý smart skill Q (Buff khi có hazard) và E (Damage khi có buff & trong tầm range)
	autoSkill.Step(deltaTime, target, flatDist)

	if flatDist < minCombatDistance then
		-- Case 1: Quá gần (< minCombatDistance) -> KITE / Lùi thẳng ra xa giữ cự ly
		local awayDelta = Vector3.new(playerPos.X - enemyPos.X, 0, playerPos.Z - enemyPos.Z)
		local awayDir = awayDelta.Magnitude > 0.1 and awayDelta.Unit or Vector3.new(0, 0, 1)
		local backDist = math.clamp(minCombatDistance - flatDist + 6, 4, 15)
		local backTarget = playerPos + awayDir * backDist

		-- Nếu Boss Area đang bật, đảm bảo điểm lùi không văng ra ngoài Boss Arena
		if bossCenter2D and bossAreaRadius then
			local backFlat = Vector3.new(backTarget.X, 0, backTarget.Z)
			if (backFlat - bossCenter2D).Magnitude > bossAreaRadius then
				local clampedFlat = bossCenter2D + (backFlat - bossCenter2D).Unit * math.max(1, bossAreaRadius - 2)
				backTarget = Vector3.new(clampedFlat.X, playerPos.Y, clampedFlat.Z)
				if (backTarget - playerPos).Magnitude < 2 then
					currentState = State.HOLD
					currentDestMode = "Hold (Boss Area Edge)"
					currentDestination = nil
					stuckTimer = 0
					pcall(function() humanoid:MoveTo(playerPos) end)
					return
				end
			end
		end

		-- Kiểm tra xem điểm lùi về có an toàn không (bỏ qua nếu đang bất tử sau hồi sinh)
		local isBackSafe = true
		local isInvulnerable = shared.IsInvulnerable and shared.IsInvulnerable()
		if not isInvulnerable and hazardScanner and hazardScanner.IsPointSafe then
			isBackSafe = hazardScanner.IsPointSafe(backTarget, 0.5)
		end

		if not isBackSafe then
			currentState = State.HOLD
			currentDestMode = "Hold (Danger Behind)"
			currentDestination = nil
			stuckTimer = 0
			pcall(function() humanoid:MoveTo(playerPos) end)
		else
			currentState = State.KITE
			currentDestMode = "Kite"
			stuckTimer = 0
			currentDestination = backTarget
			humanoid:MoveTo(backTarget)
		end
	elseif flatDist <= maxCombatDistance then
		-- Case 2: Nằm trong khoảng lý tưởng [minCombatDistance, maxCombatDistance] -> HOLD
		currentState = State.HOLD
		currentDestination = nil
		currentDestMode = "Hold"
		stuckTimer = 0
		pcall(function() humanoid:MoveTo(playerPos) end)
	else
		-- Case 3: Quá xa (> maxCombatDistance) -> CHASE / Tiến thẳng lại gần mục tiêu
		local approachDir = flatDelta.Magnitude > 0.1 and flatDelta.Unit or Vector3.new(0, 0, 1)

		-- Kiểm tra xem hướng bước tới (Lookahead Points) có đang nằm trong vùng nguy hiểm / đạn bay không
		local dangerAhead = false
		local isInvulnerable = shared.IsInvulnerable and shared.IsInvulnerable()
		if not isInvulnerable and hazardScanner and hazardScanner.IsPointSafe then
			-- Check các điểm trước mặt ở cự ly 3 studs, 6 studs, 10 studs
			for _, stepDist in ipairs({ 3, 6, 10 }) do
				if stepDist < flatDist then
					local checkPoint = playerPos + approachDir * stepDist
					if not hazardScanner.IsPointSafe(checkPoint, 0.5) then
						dangerAhead = true
						break
					end
				end
			end
		end

		if dangerAhead then
			-- Phía trước có bẫy / đạn / vùng đỏ -> ĐỨNG YÊN (HOLD) chờ nguy hiểm qua đi, không cắm đầu chạy vào!
			currentState = State.HOLD
			currentDestMode = "Hold (Danger Ahead)"
			currentDestination = nil
			stuckTimer = 0
			pcall(function() humanoid:MoveTo(playerPos) end)
		else
			currentState = State.CHASE
			currentDestMode = "Chase"
			local chaseTarget = Vector3.new(enemyPos.X, playerPos.Y, enemyPos.Z)
			currentDestination = chaseTarget

			humanoid:MoveTo(chaseTarget)

			-- Auto jump khi có chênh lệch độ cao (bậc thang, dốc)
			local elevDiff = enemyPos.Y - playerPos.Y
			if elevDiff > 1.8 and flatDist <= 8.0 then
				humanoid.Jump = true
			end

			-- Velocity-Based Stuck Detection & Auto-Jump
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
			else
				stuckTimer = 0
			end
		end
	end
end






--// ============================================================
--// VISUAL DEBUGGING (Planned Path, Actual Move, Blocker Ray, Target)
--// ============================================================

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
	debugEnemyHighlight.Parent = services.CoreGui or game:GetService("CoreGui")
	return debugEnemyHighlight
end

local function getTerrainAdornee()
	return workspace.Terrain
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
	local terrain = getTerrainAdornee()

	-- 1. Target Visuals (Chỉ dùng Highlight TM_EnemyHighlight_Debug, không sinh Part vật lý trong workspace)
	if not showTargetVisual or not curTarget or not curTarget.Root then
		if debugEnemyHighlight and debugEnemyHighlight.Parent then
			debugEnemyHighlight.Enabled = false
		end
	else
		local hl = ensureDebugHighlight()
		if curTarget.Model and curTarget.Model.Parent then
			hl.Adornee = curTarget.Model
			hl.Enabled = true
		else
			hl.Enabled = false
		end
	end

	-- 2. Planned Path Visuals (Green line along waypoints in CoreGui)
	local waypoints = tracker.GetWaypoints()
	local pathInst = tracker.GetPathInstance()
	if not showPlannedPath or not waypoints or #waypoints == 0 or not terrain then
		destroyPathVisuals()
	else
		local cacheKey = tostring(pathInst) .. "_" .. tostring(#waypoints)
		if debugPathCacheKey ~= cacheKey then
			destroyPathVisuals()
			for i = 2, #waypoints do
				local a = waypoints[i - 1].Position
				local b = waypoints[i].Position
				local dist = (b - a).Magnitude
				if dist > 0.01 then
					local line = Instance.new("LineHandleAdornment")
					line.Name = "TM_PathLine_Debug"
					line.Adornee = terrain
					line.AlwaysOnTop = true
					line.Length = dist
					line.Thickness = 2
					line.Transparency = 0.3
					line.Color3 = Color3.fromRGB(0, 255, 120)
					line.ZIndex = 0
					line.CFrame = CFrame.lookAt(a, b)
					line.Parent = services.CoreGui or game:GetService("CoreGui")
					debugPathLines[#debugPathLines + 1] = line
				end
			end
			debugPathCacheKey = cacheKey
		end
	end

	-- 3. Actual Destination Visuals (Cyan line + sphere marker in CoreGui)
	if not showActualPath or not currentDestination or not playerPos or not terrain then
		if debugActualLine then debugActualLine.Visible = false end
		if debugActualMarker then debugActualMarker.Visible = false end
	else
		local pPos = playerPos + Vector3.new(0, 0.5, 0)
		local dPos = currentDestination + Vector3.new(0, 0.5, 0)
		local dist = (dPos - pPos).Magnitude

		if dist >= 0.3 then
			if not debugActualLine or not debugActualLine.Parent then
				debugActualLine = Instance.new("LineHandleAdornment")
				debugActualLine.Name = "TM_ActualPath_Debug"
				debugActualLine.Adornee = terrain
				debugActualLine.AlwaysOnTop = true
				debugActualLine.Thickness = 3.5
				debugActualLine.Transparency = 0.15
				debugActualLine.Color3 = Color3.fromRGB(0, 230, 255)
				debugActualLine.ZIndex = 2
				debugActualLine.Parent = services.CoreGui or game:GetService("CoreGui")
			end
			debugActualLine.Length = dist
			debugActualLine.CFrame = CFrame.lookAt(pPos, dPos)
			debugActualLine.Visible = true

			if not debugActualMarker or not debugActualMarker.Parent then
				debugActualMarker = Instance.new("SphereHandleAdornment")
				debugActualMarker.Name = "TM_ActualMarker_Debug"
				debugActualMarker.Adornee = terrain
				debugActualMarker.AlwaysOnTop = true
				debugActualMarker.Radius = 0.65
				debugActualMarker.Transparency = 0.2
				debugActualMarker.Color3 = Color3.fromRGB(0, 230, 255)
				debugActualMarker.ZIndex = 3
				debugActualMarker.Parent = services.CoreGui or game:GetService("CoreGui")
			end
			debugActualMarker.CFrame = CFrame.new(dPos)
			debugActualMarker.Visible = true
		else
			if debugActualLine then debugActualLine.Visible = false end
			if debugActualMarker then debugActualMarker.Visible = false end
		end
	end

	-- 4. Blocker Detection Ray Visual (Red line when blocked, Green when clear in CoreGui)
	if not showBlockerRay or not lastBlockerData or not playerPos or not curTarget or not terrain then
		if debugBlockerLine then debugBlockerLine.Visible = false end
		if debugBlockerHitMarker then debugBlockerHitMarker.Visible = false end
	else
		local origin = lastBlockerData.origin or (playerPos + Vector3.new(0, 1.5, 0))
		local targetEnd = lastBlockerData.directHitPos or lastBlockerData.targetPos
		local isBlocked = lastBlockerData.directBlocked

		if targetEnd then
			local rayDist = (targetEnd - origin).Magnitude
			if rayDist >= 0.2 then
				if not debugBlockerLine or not debugBlockerLine.Parent then
					debugBlockerLine = Instance.new("LineHandleAdornment")
					debugBlockerLine.Name = "TM_BlockerRay_Debug"
					debugBlockerLine.Adornee = terrain
					debugBlockerLine.AlwaysOnTop = true
					debugBlockerLine.Thickness = 3
					debugBlockerLine.Transparency = 0.2
					debugBlockerLine.ZIndex = 3
					debugBlockerLine.Parent = services.CoreGui or game:GetService("CoreGui")
				end

				debugBlockerLine.Length = rayDist
				debugBlockerLine.Color3 = isBlocked and Color3.fromRGB(255, 30, 30) or Color3.fromRGB(50, 255, 50)
				debugBlockerLine.CFrame = CFrame.lookAt(origin, targetEnd)
				debugBlockerLine.Visible = true

				-- Marker adornment at blocker hit location
				if isBlocked and lastBlockerData.directHitPos then
					if not debugBlockerHitMarker or not debugBlockerHitMarker.Parent then
						debugBlockerHitMarker = Instance.new("SphereHandleAdornment")
						debugBlockerHitMarker.Name = "TM_BlockerHitMarker_Debug"
						debugBlockerHitMarker.Adornee = terrain
						debugBlockerHitMarker.AlwaysOnTop = true
						debugBlockerHitMarker.Radius = 0.5
						debugBlockerHitMarker.Transparency = 0.2
						debugBlockerHitMarker.Color3 = Color3.fromRGB(255, 30, 30)
						debugBlockerHitMarker.ZIndex = 4
						debugBlockerHitMarker.Parent = services.CoreGui or game:GetService("CoreGui")
					end
					debugBlockerHitMarker.CFrame = CFrame.new(lastBlockerData.directHitPos)
					debugBlockerHitMarker.Visible = true
				else
					if debugBlockerHitMarker then
						debugBlockerHitMarker.Visible = false
					end
				end
			else
				if debugBlockerLine then debugBlockerLine.Visible = false end
				if debugBlockerHitMarker then debugBlockerHitMarker.Visible = false end
			end
		end
	end

	-- 5. Combat Range Circles quanh Target Enemy (Min Distance = Yellow [0..min], Max Distance = Green [min..max] - ZERO OVERLAP)
	local targetRoot = curTarget and curTarget.Root
	if not showCombatRangeVisual or not targetRoot or not targetRoot.Parent then
		if debugMinDistanceFill then debugMinDistanceFill.Visible = false end
		if debugMinDistanceRing then debugMinDistanceRing.Visible = false end
		if debugMaxDistanceFill then debugMaxDistanceFill.Visible = false end
		if debugMaxDistanceRing then debugMaxDistanceRing.Visible = false end
	else
		local targetPos = getSafePosition(targetRoot) or targetRoot.Position
		local floorY = playerPos and (playerPos.Y - 2.5) or (targetPos.Y - 2.5)
		local worldTargetPos = Vector3.new(targetPos.X, floorY, targetPos.Z)
		local desiredWorldCFrame = CFrame.new(worldTargetPos) * CFrame.Angles(math.rad(90), 0, 0)
		local localCFrame = targetRoot.CFrame:ToObjectSpace(desiredWorldCFrame)

		local minCombatDistance, maxCombatDistance = getActiveCombatDistances(curTarget)
		local safeMinDist = math.max(1, minCombatDistance)
		local safeMaxDist = math.max(safeMinDist + 0.5, maxCombatDistance)
		local ringThickness = 0.35

		-- Min Distance Fill (Yellow solid disk from 0 to minCombatDistance around Target)
		if not debugMinDistanceFill or not debugMinDistanceFill.Parent then
			debugMinDistanceFill = Instance.new("CylinderHandleAdornment")
			debugMinDistanceFill.Name = "TM_MinDistanceFill_Debug"
			debugMinDistanceFill.AlwaysOnTop = true
			debugMinDistanceFill.ZIndex = 4
			debugMinDistanceFill.Parent = services.CoreGui or game:GetService("CoreGui")
		end
		debugMinDistanceFill.Adornee = targetRoot
		debugMinDistanceFill.Height = 0.02
		debugMinDistanceFill.InnerRadius = 0
		debugMinDistanceFill.Radius = safeMinDist
		debugMinDistanceFill.Color3 = Color3.fromRGB(255, 200, 0)
		debugMinDistanceFill.Transparency = 0.82
		debugMinDistanceFill.CFrame = localCFrame
		debugMinDistanceFill.Visible = true

		-- Min Distance Ring (Yellow outline at minCombatDistance around Target)
		if not debugMinDistanceRing or not debugMinDistanceRing.Parent then
			debugMinDistanceRing = Instance.new("CylinderHandleAdornment")
			debugMinDistanceRing.Name = "TM_MinDistanceRing_Debug"
			debugMinDistanceRing.AlwaysOnTop = true
			debugMinDistanceRing.ZIndex = 5
			debugMinDistanceRing.Parent = services.CoreGui or game:GetService("CoreGui")
		end
		debugMinDistanceRing.Adornee = targetRoot
		debugMinDistanceRing.Height = 0.05
		debugMinDistanceRing.InnerRadius = math.max(0.1, safeMinDist - ringThickness)
		debugMinDistanceRing.Radius = safeMinDist
		debugMinDistanceRing.Color3 = Color3.fromRGB(255, 215, 20)
		debugMinDistanceRing.Transparency = 0.25
		debugMinDistanceRing.CFrame = localCFrame
		debugMinDistanceRing.Visible = true

		-- Max Distance Fill (Green donut band from minCombatDistance to maxCombatDistance around Target - ZERO OVERLAP)
		if not debugMaxDistanceFill or not debugMaxDistanceFill.Parent then
			debugMaxDistanceFill = Instance.new("CylinderHandleAdornment")
			debugMaxDistanceFill.Name = "TM_MaxDistanceFill_Debug"
			debugMaxDistanceFill.AlwaysOnTop = true
			debugMaxDistanceFill.ZIndex = 4
			debugMaxDistanceFill.Parent = services.CoreGui or game:GetService("CoreGui")
		end
		debugMaxDistanceFill.Adornee = targetRoot
		debugMaxDistanceFill.Height = 0.02
		debugMaxDistanceFill.InnerRadius = safeMinDist -- Không đè lên vùng Yellow!
		debugMaxDistanceFill.Radius = safeMaxDist
		debugMaxDistanceFill.Color3 = Color3.fromRGB(0, 255, 120)
		debugMaxDistanceFill.Transparency = 0.82
		debugMaxDistanceFill.CFrame = localCFrame
		debugMaxDistanceFill.Visible = true

		-- Max Distance Ring (Green outline at maxCombatDistance around Target)
		if not debugMaxDistanceRing or not debugMaxDistanceRing.Parent then
			debugMaxDistanceRing = Instance.new("CylinderHandleAdornment")
			debugMaxDistanceRing.Name = "TM_MaxDistanceRing_Debug"
			debugMaxDistanceRing.AlwaysOnTop = true
			debugMaxDistanceRing.ZIndex = 5
			debugMaxDistanceRing.Parent = services.CoreGui or game:GetService("CoreGui")
		end
		debugMaxDistanceRing.Adornee = targetRoot
		debugMaxDistanceRing.Height = 0.05
		debugMaxDistanceRing.InnerRadius = math.max(0.1, safeMaxDist - ringThickness)
		debugMaxDistanceRing.Radius = safeMaxDist
		debugMaxDistanceRing.Color3 = Color3.fromRGB(0, 255, 120)
		debugMaxDistanceRing.Transparency = 0.25
		debugMaxDistanceRing.CFrame = localCFrame
		debugMaxDistanceRing.Visible = true

		-- Boss Area Ring (Cyan outline showing the Boss Arena boundary locked at spawn position)
		local isBossAreaActive, bossAreaRadius, bossAreaCenter = contextual.GetActiveBossArea(curTarget)
		if isBossAreaActive and bossAreaCenter and bossAreaRadius and bossAreaRadius > 0 then
			local bCenterWorld = Vector3.new(bossAreaCenter.X, floorY, bossAreaCenter.Z)
			local bCenterCFrame = CFrame.new(bCenterWorld) * CFrame.Angles(math.rad(90), 0, 0)
			local bCenterLocal = targetRoot.CFrame:ToObjectSpace(bCenterCFrame)

			if not debugBossAreaRing or not debugBossAreaRing.Parent then
				debugBossAreaRing = Instance.new("CylinderHandleAdornment")
				debugBossAreaRing.Name = "TM_BossAreaRing_Debug"
				debugBossAreaRing.AlwaysOnTop = true
				debugBossAreaRing.ZIndex = 5
				debugBossAreaRing.Parent = services.CoreGui or game:GetService("CoreGui")
			end
			debugBossAreaRing.Adornee = targetRoot
			debugBossAreaRing.Height = 0.05
			debugBossAreaRing.InnerRadius = math.max(0.1, bossAreaRadius - 0.45)
			debugBossAreaRing.Radius = bossAreaRadius
			debugBossAreaRing.Color3 = Color3.fromRGB(0, 200, 255)
			debugBossAreaRing.Transparency = 0.3
			debugBossAreaRing.CFrame = bCenterLocal
			debugBossAreaRing.Visible = true
		else
			if debugBossAreaRing then debugBossAreaRing.Visible = false end
		end
	end
end

local function cleanupDebugVisuals()
	if debugEnemyHighlight then pcall(function() debugEnemyHighlight:Destroy() end); debugEnemyHighlight = nil end
	if debugActualLine then pcall(function() debugActualLine:Destroy() end); debugActualLine = nil end
	if debugActualMarker then pcall(function() debugActualMarker:Destroy() end); debugActualMarker = nil end
	if debugBlockerLine then pcall(function() debugBlockerLine:Destroy() end); debugBlockerLine = nil end
	if debugBlockerHitMarker then pcall(function() debugBlockerHitMarker:Destroy() end); debugBlockerHitMarker = nil end
	if debugMinDistanceFill then pcall(function() debugMinDistanceFill:Destroy() end); debugMinDistanceFill = nil end
	if debugMinDistanceRing then pcall(function() debugMinDistanceRing:Destroy() end); debugMinDistanceRing = nil end
	if debugMaxDistanceFill then pcall(function() debugMaxDistanceFill:Destroy() end); debugMaxDistanceFill = nil end
	if debugMaxDistanceRing then pcall(function() debugMaxDistanceRing:Destroy() end); debugMaxDistanceRing = nil end
	if debugBossAreaRing then pcall(function() debugBossAreaRing:Destroy() end); debugBossAreaRing = nil end
	destroyPathVisuals()
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

-- Mob (Normal Enemy) Distance Configuration
function autoFarm.GetMobMinCombatDistance()
	return mobMinDistance
end

function autoFarm.SetMobMinCombatDistance(val)
	if type(val) == "number" and val >= 1 then
		mobMinDistance = val
		if mobMinDistance > mobMaxDistance then
			mobMaxDistance = mobMinDistance + 5
		end
	end
end

function autoFarm.GetMobMaxCombatDistance()
	return mobMaxDistance
end

function autoFarm.SetMobMaxCombatDistance(val)
	if type(val) == "number" and val >= 2 then
		mobMaxDistance = val
		if mobMinDistance > mobMaxDistance then
			mobMinDistance = math.max(1, mobMaxDistance - 5)
		end
	end
end

-- Boss Distance Configuration
function autoFarm.GetBossMinCombatDistance()
	return bossMinDistance
end

function autoFarm.SetBossMinCombatDistance(val)
	if type(val) == "number" and val >= 1 then
		bossMinDistance = val
		if bossMinDistance > bossMaxDistance then
			bossMaxDistance = bossMinDistance + 5
		end
	end
end

function autoFarm.GetBossMaxCombatDistance()
	return bossMaxDistance
end

function autoFarm.SetBossMaxCombatDistance(val)
	if type(val) == "number" and val >= 2 then
		bossMaxDistance = val
		if bossMinDistance > bossMaxDistance then
			bossMinDistance = math.max(1, bossMaxDistance - 5)
		end
	end
end

-- Backward compatibility aliases
function autoFarm.GetMinCombatDistance()
	return mobMinDistance
end

function autoFarm.SetMinCombatDistance(val)
	autoFarm.SetMobMinCombatDistance(val)
end

function autoFarm.GetMaxCombatDistance()
	return mobMaxDistance
end

function autoFarm.SetMaxCombatDistance(val)
	autoFarm.SetMobMaxCombatDistance(val)
end

autoFarm.IsTargetBoss = isTargetBoss

function autoFarm.IsAutoFaceTargetEnabled()
	return autoFaceTarget
end

function autoFarm.SetAutoFaceTarget(state)
	autoFaceTarget = state and true or false
	if not autoFaceTarget then
		local h = shared.GetHumanoid()
		if h and h.Parent then
			pcall(function() h.AutoRotate = true end)
		end
	end
end

-- Backward compatibility for reachDistance
function autoFarm.GetReachDistance()
	return maxCombatDistance
end

function autoFarm.SetReachDistance(val)
	if type(val) == "number" and val >= 2 then
		autoFarm.SetMaxCombatDistance(val)
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
	autoJumpOnStuck = state == true
end

function autoFarm.IsAutoJumpOnStuckEnabled()
	return autoJumpOnStuck
end

function autoFarm.SetStuckVelocityThreshold(val)
	if type(val) == "number" and val > 0 then
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
			pcall(function()
				h:MoveTo(r.Position)
				h.AutoRotate = true
			end)
		end
	end
end

function autoFarm.IsPaused()
	return isPaused
end

--// Auto Skill APIs (Smart Skills Q & E)
function autoFarm.IsAutoSkillEnabled()
	return autoSkill.IsEnabled()
end

function autoFarm.SetAutoSkillEnabled(state)
	autoSkill.SetEnabled(state)
end
autoFarm.IsAutoSkillQEnabled = autoSkill.IsSkillQEnabled
autoFarm.SetAutoSkillQEnabled = autoSkill.SetSkillQEnabled
autoFarm.IsAutoSkillEEnabled = autoSkill.IsSkillEEnabled
autoFarm.SetAutoSkillEEnabled = autoSkill.SetSkillEEnabled
autoFarm.GetSkillERange = autoSkill.GetSkillERange
autoFarm.SetSkillERange = autoSkill.SetSkillERange
autoFarm.GetSkillSpamInterval = autoSkill.GetSpamInterval
autoFarm.SetSkillSpamInterval = autoSkill.SetSkillSpamInterval
autoFarm.IsBuffActive = autoSkill.IsBuffActive
autoFarm.CastSkillQ = autoSkill.CastSkillQ
autoFarm.CastSkillE = autoSkill.CastSkillE

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
		if debugActualMarker then debugActualMarker.Visible = false end
	end
end

function autoFarm.IsBlockerRayVisualEnabled()
	return showBlockerRay
end

function autoFarm.SetBlockerRayVisual(val)
	showBlockerRay = val == true
	if not showBlockerRay then
		if debugBlockerLine then debugBlockerLine.Visible = false end
		if debugBlockerHitMarker then debugBlockerHitMarker.Visible = false end
	end
end

function autoFarm.IsTargetVisualEnabled()
	return showTargetVisual
end

function autoFarm.SetTargetVisual(val)
	showTargetVisual = val == true
	if not showTargetVisual then
		if debugEnemyHighlight and debugEnemyHighlight.Parent then
			debugEnemyHighlight.Enabled = false
		end
	end
end

function autoFarm.IsCombatRangeVisualEnabled()
	return showCombatRangeVisual
end

function autoFarm.SetCombatRangeVisual(val)
	showCombatRangeVisual = val == true
	if not showCombatRangeVisual then
		if debugMinDistanceFill then debugMinDistanceFill.Visible = false end
		if debugMinDistanceRing then debugMinDistanceRing.Visible = false end
		if debugMaxDistanceFill then debugMaxDistanceFill.Visible = false end
		if debugMaxDistanceRing then debugMaxDistanceRing.Visible = false end
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
			pcall(function()
				h:MoveTo(r.Position)
				h.AutoRotate = true
			end)
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
