--==============================================================--
-- Smart Auto Play Core (DungeonQuest)
-- Master Orchestrator: Tích hợp thành 1 toggle duy nhất Smart Auto Play
--   1. Visual Combat Radius R: Hiển thị vòng tròn hạt neon cyan quanh người chơi.
--   2. Priority 1 (DANGER): Boss/Hazard ra chiêu -> Dừng AutoFarm ngay lập tức,
--      Smart Dodge nắm toàn quyền đưa nhân vật đến Safe Spot an toàn.
--   3. Priority 2 (IN COMBAT RANGE): Có quái trong bán kính R -> Dừng AutoFarm,
--      tự động xả kỹ năng (Auto Skill Q, E, Attack) và khóa mặt vào quái (Target Facing).
--   4. Priority 3 (APPROACH): Quái ở xa ngoài bán kính R -> Tự động dùng AutoFarm
--      (Pathfinding) tìm đường tiếp cận mục tiêu đến mép R, vẫn khóa mặt vào mục tiêu.
--   5. Priority 4 (ROOM CLEARED): Quái chết hết -> Nghỉ ngơi chờ quái mới / qua phòng.
--==============================================================--

local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local coordinator = require("@routes/DungeonQuest/core/coordinator")

local autoFarm = require("@routes/DungeonQuest/core/autoFarm")
local tracker = require("@routes/DungeonQuest/core/autoFarm/tracker")
local sdv2 = require("@routes/DungeonQuest/core/smartDodgeV2")
local targetFacing = require("@routes/DungeonQuest/core/smartDodgeV2/targetFacing")
local autoSkill = require("@routes/DungeonQuest/core/smartAutoPlay/autoSkill")
local autoApproach = require("@routes/DungeonQuest/core/smartAutoPlay/autoApproach")
local bossArea = require("@routes/DungeonQuest/core/smartDodgeV2/bossArea")
local openSpace = require("@routes/DungeonQuest/core/smartAutoPlay/openSpace")

local RunService = services.RunService
local player = services.player

local smartAutoPlay = {}

--// Settings & State
local masterEnabled = false
local masterLoopThread = nil
local masterState = "Disabled" -- "Disabled" | "Dodging" | "InCombat" | "HoldingRadius" | "Orbiting" | "Repositioning" | "Approaching" | "WaitingHazard" | "EnteringArena" | "RoomCleared" | "Dead"
local currentHazardName = nil
local currentEscapeDist = 0
local currentTargetName = nil
local currentTargetDist = nil
local currentTargetPos = nil
local masterStatusListeners = {}
local lastDodgeTimestamp = 0
local orbitDirection = 1 -- 1: cùng chiều kim đồng hồ, -1: ngược chiều kim đồng hồ (Orbit Mob Grouping)
local waitingHazardStartTime = 0

--// Combat Movement Mode: "Orbit" (V2) | "OpenSpace" (V1)
local combatMovementMode = "Orbit"
local wasInDanger = false
local repositionTarget = nil
local repositionStartTime = 0
local MAX_REPOSITION_TIME = 3.5
local repositionMoveConn = nil

--// Combat Micro-Strafing State (Chủ động nhấp nhả lướt nhẹ né trước khi quái kịp tung chiêu)
local combatMicroStrafingEnabled = true
local lastMicroStrafeTime = 0
local strafeDirection = 1 -- 1 hoặc -1 (xoay nhẹ theo chiều kim đồng hồ hoặc ngược lại)
local currentStrafeTarget = nil
local strafeTargetStartTime = 0
local currentStrafePause = 1.2

local smartAutoSkillEnabled = true
local maintainDistanceEnabled = true -- Bật/Tắt cơ chế chủ động lùi / Kiting giữ khoảng cách
local targetScope = "All" -- Phạm vi chiến đấu chung (All | Boss | Mobs) cho toàn bộ hệ thống
local maintainDistanceScope = "All" -- Phạm vi áp dụng Kiting: "All" | "Boss" | "Mobs"
local approachScope = "All" -- Phạm vi tiếp cận mục tiêu: "All" | "Boss" | "Mobs"
local radiusMobs = 14.0 -- Kiting Radius cho Quái thường (studs)
local radiusBoss1 = 16.0 -- Kiting Radius cho Boss 1 (tính từ tâm sàn đấu)
local radiusBoss2 = 24.0 -- Kiting Radius cho Boss 2
local radiusBoss3 = 32.0 -- Kiting Radius cho Boss 3+
local SPHERE_COUNT = 48 -- 48 hạt neon tạo vòng radar tròn mượt mà
local sphereSize = 0.35 -- Diameter of each sphere in studs
local SPHERE_COLOR = Color3.fromRGB(0, 225, 255) -- Vibrant Neon Cyan
local HYSTERESIS_BUFFER = 2.0 -- Đệm chống rung giật mép vòng tròn (studs)

--// Hàm xác định bán kính Kiting động theo đối tượng mục tiêu hiện tại
local function getCurrentTargetRadius(targetName)
	local isBossActive = shared.IsBossActive and shared.IsBossActive()
	local isBossName = targetName and (string.find(string.lower(targetName), "boss") ~= nil)
	if targetScope == "Boss" or isBossActive or isBossName then
		local idx = shared.GetCurrentBossIndex and shared.GetCurrentBossIndex() or 1
		if idx <= 1 then
			return radiusBoss1
		elseif idx == 2 then
			return radiusBoss2
		else
			return radiusBoss3
		end
	end
	return radiusMobs
end

local showRadiusCircle = true -- Mặc định BẬT vòng tròn hạt Neon Cyan Combat Radius quanh người chơi
local showSkillCircle = false -- Tắt vòng tím skill để người chơi tập trung vào vòng Cyan radar
local skillRange = 25.0 -- Skill Cast Range in studs
local SKILL_SPHERE_COUNT = 48 -- 48 hạt neon tạo đường tròn mềm mại, sắc nét
local skillSphereSize = 0.28 -- Đường kính hạt vòng skill
local SKILL_SPHERE_COLOR = Color3.fromRGB(225, 75, 255) -- Vibrant Neon Magenta / Purple

local sphereParts = {}
local skillSphereParts = {}
local visualFolder = nil
local updateConnection = nil

-- Kết nối hàm lấy tầm chiêu cho autoSkill (đảm bảo không nhỏ hơn kiting radius)
local function getEffectiveSkillRange()
	return smartAutoPlay.GetEffectiveSkillRange()
end
autoSkill.BindRadiusGetter(getEffectiveSkillRange)

smartAutoPlay.autoSkill = autoSkill
smartAutoPlay.autoApproach = autoApproach
smartAutoPlay.sdv2 = sdv2
smartAutoPlay.autoFarm = autoFarm

--// Status Dispatcher
local function fireMasterStatus()
	local info = {
		enabled = masterEnabled,
		state = masterState,
		hazardName = currentHazardName,
		escapeDist = currentEscapeDist,
		targetName = currentTargetName,
		targetDist = currentTargetDist,
		radius = radius,
		skillRange = skillRange,
		maintainDistance = maintainDistanceEnabled,
		targetScope = targetScope,
		combatTargetScope = targetScope,
		maintainDistanceScope = maintainDistanceScope,
		approachScope = approachScope,
	}
	for _, cb in ipairs(masterStatusListeners) do
		pcall(cb, info)
	end
end

--// Điều khiển di chuyển Reposition (OpenSpace - V1) sử dụng Humanoid:Move trên nhịp RenderStepped
-- (Đồng bộ cơ chế vật lý 60 FPS mượt mà tương tự AutoFarm freewalk và SmartDodgeV2)
local function stopRepositionMovement()
	if repositionMoveConn then
		pcall(function() repositionMoveConn:Disconnect() end)
		repositionMoveConn = nil
	end
	repositionTarget = nil
	repositionStartTime = 0
	openSpace.UpdateVisualMarker(nil, false)

	if targetFacing and targetFacing.SetDodging then
		targetFacing.SetDodging(false)
	end

	local char = player and player.Character
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	if hum then
		pcall(function()
			hum:Move(Vector3.zero, false)
			hum.AutoRotate = true
		end)
	end
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if root then
		pcall(function()
			root.AssemblyLinearVelocity = Vector3.zero
			root.AssemblyAngularVelocity = Vector3.zero
		end)
	end
end

local function startRepositionMovement(targetSpot)
	if not targetSpot then return end
	if repositionMoveConn then
		pcall(function() repositionMoveConn:Disconnect() end)
		repositionMoveConn = nil
	end

	repositionTarget = targetSpot
	repositionStartTime = os.clock()
	openSpace.UpdateVisualMarker(targetSpot, true)

	if not autoFarm.IsPaused() then
		autoFarm.SetPaused(true)
	end

	if targetFacing and targetFacing.SetDodging then
		targetFacing.SetDodging(true)
	end

	repositionMoveConn = RunService.RenderStepped:Connect(function()
		if not masterEnabled or combatMovementMode ~= "OpenSpace" or not repositionTarget then
			stopRepositionMovement()
			return
		end

		local elapsed = os.clock() - repositionStartTime
		if elapsed >= MAX_REPOSITION_TIME then
			stopRepositionMovement()
			return
		end

		local char = player and player.Character
		local root = char and char:FindFirstChild("HumanoidRootPart")
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if not root or not hum or hum.Health <= 0 then
			stopRepositionMovement()
			return
		end

		local curTarget = repositionTarget
		local pPos = root.Position
		local flatDiff = Vector3.new(curTarget.X - pPos.X, 0, curTarget.Z - pPos.Z)
		local flatDist = flatDiff.Magnitude

		-- 1. SNAP ĐÍCH & DỪNG: Khi cự ly tới điểm Reposition <= 1.8 studs (tương tự smartDodgeV2)
		if flatDist <= 1.8 then
			pcall(function()
				hum:Move(Vector3.zero, false)
				local targetY = root.Position.Y
				local snapPos = Vector3.new(curTarget.X, targetY, curTarget.Z)
				local faceEnemy = currentTargetPos
				if faceEnemy then
					root.CFrame = CFrame.lookAt(snapPos, Vector3.new(faceEnemy.X, targetY, faceEnemy.Z))
				else
					local look = root.CFrame.LookVector
					local flatLook = Vector3.new(look.X, 0, look.Z)
					if flatLook.Magnitude > 0.001 then
						root.CFrame = CFrame.lookAt(snapPos, snapPos + flatLook.Unit)
					else
						root.CFrame = CFrame.new(snapPos)
					end
				end
				root.AssemblyLinearVelocity = Vector3.zero
				root.AssemblyAngularVelocity = Vector3.zero
				hum.AutoRotate = true
			end)
			stopRepositionMovement()
			return
		end

		-- 2. DI CHUYỂN VẬT LÝ MƯỢT MÀ BẰNG HUMANOID:MOVE MỖI FRAME (tương tự autoFarm & smartDodgeV2)
		if flatDist > 0.4 then
			hum:Move(flatDiff.Unit, false)
		else
			hum:Move(Vector3.zero, false)
		end

		-- 3. LOGIC NHẢY KHI CÓ CHÊNH LỆCH CAO ĐỘ (tương tự autoFarm/movement.luau)
		local elevDiff = curTarget.Y - pPos.Y
		if elevDiff > 1.8 and flatDist <= 7.0 then
			hum.Jump = true
		end

		-- 4. STRAFE FACING: Luôn xoay mặt ngắm quái/boss mục tiêu trong khi lướt tới điểm Reposition
		local faceEnemy = currentTargetPos
		if faceEnemy then
			hum.AutoRotate = false
			local diff = Vector3.new(faceEnemy.X - pPos.X, 0, faceEnemy.Z - pPos.Z)
			if diff.Magnitude > 0.5 then
				root.CFrame = CFrame.lookAt(pPos, Vector3.new(faceEnemy.X, pPos.Y, faceEnemy.Z))
			end
		else
			hum.AutoRotate = true
		end

		openSpace.UpdateVisualMarker(curTarget, true, flatDist)
	end)
end

--// Floor Raycast Parameters cho Visual Circle
local floorRayParams = RaycastParams.new()
floorRayParams.FilterType = Enum.RaycastFilterType.Exclude
floorRayParams.IgnoreWater = true

local function updateRayFilter()
	local ignore = {}
	if player and player.Character then
		table.insert(ignore, player.Character)
	end
	local rayIgnore = workspace:FindFirstChild("RaycastIgnore")
	if rayIgnore then
		table.insert(ignore, rayIgnore)
	end
	if visualFolder then
		table.insert(ignore, visualFolder)
	end
	local proj = workspace:FindFirstChild("enemyProjectiles")
	if proj then
		table.insert(ignore, proj)
	end
	floorRayParams.FilterDescendantsInstances = ignore
end

-- Dò sàn cứng thực sự: bỏ qua chiêu thức hazard, particle, aura, quái vật để chống nảy Y
local function getSolidFloorY(pPos: Vector3, fallbackY: number): number
	updateRayFilter()
	local rayOrigin = Vector3.new(pPos.X, pPos.Y + 2.5, pPos.Z)
	local rayDir = Vector3.new(0, -60.0, 0)

	local attempts = 0
	local curOrigin = rayOrigin
	local curDir = rayDir
	local filterList = floorRayParams.FilterDescendantsInstances

	while attempts < 4 do
		local hit = workspace:Raycast(curOrigin, curDir, floorRayParams)
		if not hit then
			break
		end

		local inst = hit.Instance
		local isSolid = inst and inst.CanCollide and inst.Transparency < 0.95
		local model = inst and inst:FindFirstAncestorOfClass("Model")
		local hasHumanoid = model and model:FindFirstChildOfClass("Humanoid") ~= nil

		if isSolid and not hasHumanoid then
			return hit.Position.Y
		end

		-- Bỏ qua part này (vùng chiêu, aura, hitbox xuyên thấu) và dò tiếp xuống dưới
		attempts += 1
		table.insert(filterList, inst)
		floorRayParams.FilterDescendantsInstances = filterList

		local nextY = hit.Position.Y - 0.05
		local remainingDist = (rayOrigin.Y - 60.0) - nextY
		if remainingDist >= 0 then break end
		curOrigin = Vector3.new(hit.Position.X, nextY, hit.Position.Z)
		curDir = Vector3.new(0, remainingDist, 0)
	end

	return fallbackY
end

local function getOrCreateVisualFolder()
	if visualFolder and visualFolder.Parent then
		return visualFolder
	end

	local container = workspace.CurrentCamera or workspace
	local folder = container:FindFirstChild("SmartAutoPlay_RadiusVisual")
	if not folder then
		folder = Instance.new("Folder")
		folder.Name = "SmartAutoPlay_RadiusVisual"
		folder.Parent = container
	end
	visualFolder = folder
	return folder
end

local function getOrCreateSpheres()
	local folder = getOrCreateVisualFolder()

	while #sphereParts < SPHERE_COUNT do
		local idx = #sphereParts + 1
		local p = Instance.new("Part")
		p.Name = ("RadiusSphere_%02d"):format(idx)
		p.Shape = Enum.PartType.Ball
		p.Size = Vector3.new(sphereSize, sphereSize, sphereSize)
		p.Material = Enum.Material.Neon
		p.Color = SPHERE_COLOR
		p.Transparency = 0.2
		p.Anchored = true
		p.CanCollide = false
		p.CanTouch = false
		p.CanQuery = false
		p.CastShadow = false
		p.Parent = folder
		table.insert(sphereParts, p)
	end

	return sphereParts
end

local function getOrCreateSkillSpheres()
	local folder = getOrCreateVisualFolder()

	while #skillSphereParts < SKILL_SPHERE_COUNT do
		local idx = #skillSphereParts + 1
		local p = Instance.new("Part")
		p.Name = ("SkillSphere_%02d"):format(idx)
		p.Shape = Enum.PartType.Ball
		p.Size = Vector3.new(skillSphereSize, skillSphereSize, skillSphereSize)
		p.Material = Enum.Material.Neon
		p.Color = SKILL_SPHERE_COLOR
		p.Transparency = 0.3
		p.Anchored = true
		p.CanCollide = false
		p.CanTouch = false
		p.CanQuery = false
		p.CastShadow = false
		p.Parent = folder
		table.insert(skillSphereParts, p)
	end

	return skillSphereParts
end

local function hideSpheres()
	for _, p in ipairs(sphereParts) do
		p.Transparency = 1
	end
end

local function hideSkillSpheres()
	for _, p in ipairs(skillSphereParts) do
		p.Transparency = 1
	end
end

local stableCircleFloorY = nil
local lastVisualUpdateTime = os.clock()

local function updateCirclePositions()
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not root or not root.Parent then
		hideSpheres()
		hideSkillSpheres()
		stableCircleFloorY = nil
		return
	end

	local now = os.clock()
	local dt = math.clamp(now - lastVisualUpdateTime, 0.001, 0.1)
	lastVisualUpdateTime = now

	local pPos = root.Position
	local defaultFallback = stableCircleFloorY or (pPos.Y - 2.8)
	local rawFloorY = getSolidFloorY(pPos, defaultFallback)

	-- Khóa chặt và làm mượt trục Y (chống rung giật, chống nảy khi nhảy, chống leo lên đỉnh chiêu thức)
	if not stableCircleFloorY then
		stableCircleFloorY = rawFloorY
	else
		local dy = rawFloorY - stableCircleFloorY
		if math.abs(dy) > 15.0 then
			-- Chuyển tầng / teleport: snap tức thì
			stableCircleFloorY = rawFloorY
		elseif math.abs(dy) < 0.12 then
			-- Dao động nhỏ (bước chân chạy, nhấp nhô nhẹ, nhảy thấp): KHÓA CHẶT độ cao không đổi!
		else
			-- Leo dốc / cầu thang thật sự: trượt êm ái
			stableCircleFloorY = stableCircleFloorY + dy * math.clamp(dt * 14, 0.15, 1.0)
		end
	end

	-- 1. Kiting / Movement Radius Circle (Neon Cyan)
	local curTargetRadius = getCurrentTargetRadius(currentTargetName)
	if showRadiusCircle then
		local spheres = getOrCreateSpheres()
		local angleStep = (2 * math.pi) / SPHERE_COUNT
		local lockedY = stableCircleFloorY + (sphereSize / 2) + 0.04

		for i = 1, SPHERE_COUNT do
			local angle = (i - 1) * angleStep
			local targetX = pPos.X + math.cos(angle) * curTargetRadius
			local targetZ = pPos.Z + math.sin(angle) * curTargetRadius

			local part = spheres[i]
			if part and part.Parent then
				part.Position = Vector3.new(targetX, lockedY, targetZ)
				part.Transparency = 0.2
				part.Color = SPHERE_COLOR
			end
		end
	else
		hideSpheres()
	end

	-- 2. Skill Cast Range Circle (Neon Magenta)
	if showSkillCircle then
		local skillSpheres = getOrCreateSkillSpheres()
		local effectiveSkillR = skillRange
		local angleStep = (2 * math.pi) / SKILL_SPHERE_COUNT
		local lockedY = stableCircleFloorY + (skillSphereSize / 2) + 0.04

		for i = 1, SKILL_SPHERE_COUNT do
			local angle = (i - 1) * angleStep
			local targetX = pPos.X + math.cos(angle) * effectiveSkillR
			local targetZ = pPos.Z + math.sin(angle) * effectiveSkillR

			local part = skillSpheres[i]
			if part and part.Parent then
				part.Position = Vector3.new(targetX, lockedY, targetZ)
				part.Transparency = 0.25
				part.Color = SKILL_SPHERE_COLOR
			end
		end
	else
		hideSkillSpheres()
	end
end

local function checkVisualLoop()
	if showRadiusCircle or showSkillCircle then
		if not updateConnection then
			updateConnection = RunService.RenderStepped:Connect(function()
				pcall(updateCirclePositions)
			end)
		end
	else
		if updateConnection then
			updateConnection:Disconnect()
			updateConnection = nil
		end
		hideSpheres()
		hideSkillSpheres()
	end
end

local function startVisualLoop()
	checkVisualLoop()
end

local function stopVisualLoop()
	if updateConnection then
		updateConnection:Disconnect()
		updateConnection = nil
	end
	hideSpheres()
	hideSkillSpheres()
end

--// Enemy Evaluation (Flat Distance X/Z có xét biên độ độ cao Y để tránh quái ở tầng khác)
local function evaluateEnemies(checkRadius)
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not root then return false, 0, nil, nil, nil end

	local pPos = root.Position
	local tracked = shared.GetTrackedEnemyData()

	local hasEnemyInRadius = false
	local nearestDist = math.huge
	local nearestName = nil
	local nearestPos = nil
	local totalAlive = 0
	-- Trọng tâm cụm quái (Cluster Centroid) phục vụ gom quái (Grouping)
	local clusterSumX = 0
	local clusterSumY = 0
	local clusterSumZ = 0
	local clusterCount = 0
	local clusterMaxDist = math.max(checkRadius * 1.6, 35.0)

	for _, data in ipairs(tracked) do
		if data and data.Root and data.Root.Parent then
			local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
			if hum and hum.Health > 0 then
				local eName = (data.Model and data.Model.Name) or "Enemy"
				if shared.IsEnemyMatchingScope(data.Model, eName, targetScope) then
					totalAlive = totalAlive + 1
					local ePos = data.Root.Position
					local dx = ePos.X - pPos.X
					local dy = ePos.Y - pPos.Y
					local dz = ePos.Z - pPos.Z
					local flatDist = math.sqrt(dx * dx + dz * dz)

					if flatDist < nearestDist then
						nearestDist = flatDist
						nearestName = eName
						nearestPos = ePos
					end

					-- Chỉ tính quái trong tầm bán kính (xét 2D phẳng X và Z)
					if flatDist <= checkRadius then
						hasEnemyInRadius = true
					end

					-- Tính toán trọng tâm cụm quái xung quanh người chơi (xét 2D phẳng X và Z)
					if flatDist <= clusterMaxDist then
						clusterSumX += ePos.X
						clusterSumY += ePos.Y
						clusterSumZ += ePos.Z
						clusterCount += 1
					end
				end
			end
		end
	end

	-- Kiểm tra thêm target hiện tại của AutoFarm nếu có
	local afTarget = tracker.GetTarget()
	if afTarget and afTarget.Root and afTarget.Root.Parent then
		local hum = afTarget.Humanoid or (afTarget.Model and afTarget.Model:FindFirstChildOfClass("Humanoid"))
		if hum and hum.Health > 0 then
			local tName = (afTarget.Model and afTarget.Model.Name) or "Target"
			if shared.IsEnemyMatchingScope(afTarget.Model, tName, targetScope) then
				local ePos = afTarget.Root.Position
				local dx = ePos.X - pPos.X
				local dy = ePos.Y - pPos.Y
				local dz = ePos.Z - pPos.Z
				local flatDist = math.sqrt(dx * dx + dz * dz)
				if flatDist <= checkRadius then
					hasEnemyInRadius = true
				end
				if flatDist < nearestDist then
					nearestDist = flatDist
					nearestName = tName
					nearestPos = ePos
				end
			end
		end
	end

	local clusterCentroid = nil
	if clusterCount > 0 then
		clusterCentroid = Vector3.new(clusterSumX / clusterCount, clusterSumY / clusterCount, clusterSumZ / clusterCount)
	elseif nearestPos then
		clusterCentroid = nearestPos
		clusterCount = 1
	end

	return hasEnemyInRadius, totalAlive, nearestName, (nearestDist < math.huge and nearestDist or nil), nearestPos, clusterCentroid, clusterCount
end


--// Kiểm tra xem đường đi từ người chơi đến mục tiêu có bị chiêu/hazard nào của quái cản đường không
local function isApproachPathBlockedByHazard(pPos, targetPos, maxCheckDist, startDist)
	if not targetPos then return false end
	if sdv2 and sdv2.danger and not sdv2.danger.IsEnabled() then
		return false
	end

	-- BẤT TỬ / VỪA HỒI SINH: Miễn nhiễm hoàn toàn sát thương -> Tuyệt đối không bao giờ bị chặn đường!
	if shared.IsInvulnerable and shared.IsInvulnerable() then
		return false
	end
	if shared.IsJustRespawned and shared.IsJustRespawned(4.0) then
		return false
	end

	local diff = targetPos - pPos
	local flatDiff = Vector3.new(diff.X, 0, diff.Z)
	local dist = flatDiff.Magnitude
	if dist < 0.5 then return false end

	local dir = flatDiff.Unit
	local checkLimit = math.min(dist, maxCheckDist or 8.0)
	local fromD = startDist or 2.0

	-- Lấy mẫu các điểm cách nhau 2.0 studs trên đường chạy
	for d = fromD, checkLimit, 2.0 do
		local samplePt = pPos + dir * d
		local inDanger, hazardInfo = sdv2.danger.IsPointInAnyHazard(samplePt)
		if inDanger then
			local hName = (hazardInfo and (hazardInfo.name or hazardInfo.Name)) or "Active Hazard"
			return true, hName, samplePt
		end
	end

	return false
end

--// Boss 1 Arena Boundary Helper (Đảm bảo Player luôn phải bước vào trong sàn đấu của Boss 1)
local cachedFirstBossPart = nil
local cachedBoss1SpawnCenter = nil

shared.OnBossActiveChanged(function(active)
	if not active then
		cachedFirstBossPart = nil
		cachedBoss1SpawnCenter = nil
	end
end)

local function getFirstBossArenaPart()
	if cachedFirstBossPart and cachedFirstBossPart.Parent then
		return cachedFirstBossPart
	end
	local p = workspace:FindFirstChild("FirstPart")
	if not p then
		local dungeon = workspace:FindFirstChild("dungeon")
		if dungeon then
			p = dungeon:FindFirstChild("FirstPart", true)
		end
	end
	if not p then
		p = workspace:FindFirstChild("FirstPart", true)
	end
	if p and p:IsA("BasePart") then
		cachedFirstBossPart = p
		return p
	end
	return nil
end

local function getBossArenaInfo()
	local v2Center = bossArea.GetAnchorCenter and bossArea.GetAnchorCenter()
	local v2Radius = bossArea.GetRadius and bossArea.GetRadius()
	if v2Center and v2Radius and v2Radius > 0 then
		return v2Center, v2Radius
	end

	local fp = getFirstBossArenaPart()
	if fp then
		local r = math.max(fp.Size.X, fp.Size.Z) / 2
		return fp.Position, math.max(25, r - 2.5)
	end

	if cachedBoss1SpawnCenter then
		return cachedBoss1SpawnCenter, 42.0
	end

	return nil, nil
end
local getBoss1ArenaInfo = getBossArenaInfo

local function isPlayerInsideBossArea(pPos)
	if not pPos then return false end
	local center, arenaRadius = getBossArenaInfo()
	if center and arenaRadius and arenaRadius > 0 then
		local diff = (Vector3.new(pPos.X - center.X, 0, pPos.Z - center.Z)).Magnitude
		return diff <= (arenaRadius - 1.5)
	end
	if currentTargetDist and currentTargetDist > 12.0 then
		return false
	end
	return true
end
local isPlayerInsideBoss1Arena = isPlayerInsideBossArea

--// Master Orchestrator Loop
local function startMasterLoop()
	if masterLoopThread then return end

	masterLoopThread = task.spawn(function()
		while masterEnabled do
			-- 0. Kiểm tra tử trận
			if shared.IsDead() then
				if autoFarm.IsEnabled() then
					autoFarm.Toggle(false)
				end
				masterState = "Dead"
				currentHazardName = nil
				currentEscapeDist = 0
				currentTargetName = nil
				currentTargetDist = nil
				currentStrafeTarget = nil
				fireMasterStatus()
				task.wait(0.2)
				continue
			end

			-- Khi MASTER TARGET = BOSS nhưng thanh máu bossHealth chưa Enabled -> CHẾ ĐỘ CHỜ (Standby)
			if targetScope == "Boss" and not shared.IsBossActive() then
				if autoFarm.IsEnabled() then
					autoFarm.Toggle(false)
				end
				autoFarm.SetPaused(true)
				targetFacing.SetTargetOverride(nil)
				targetFacing.SetEnabled(false)
				masterState = "WaitingBoss"
				currentTargetName = "Waiting for Boss (bossHealth)..."
				currentTargetDist = nil
				currentHazardName = nil
				currentEscapeDist = 0
				currentStrafeTarget = nil
				fireMasterStatus()
				task.wait(0.1)
				continue
			end

			local char = player and player.Character
			local root = char and char:FindFirstChild("HumanoidRootPart")
			local pPos = root and root.Position

			-- 1. Ưu tiên 1: NGUY HIỂM (SMART DODGE V2)
			local inDanger = false
			local safePos, hazardName, escapeDist = nil, nil, 0
			if sdv2 and sdv2.dodge and sdv2.dodge.IsEnabled() then
				local playerInDanger, curHazard = sdv2.danger.IsPlayerInDanger()
				local isDodging = sdv2.dodge.IsDodging()
				local hasBossOrb = false
				if sdv2.danger and sdv2.danger.IsDodgeBoss2OrbEnabled and sdv2.danger.IsDodgeBoss2OrbEnabled() then
					local orbPart = sdv2.detection.GetActiveBossOrb and sdv2.detection.GetActiveBossOrb()
					if orbPart and pPos then
						local dOrb = (Vector3.new(orbPart.Position.X - pPos.X, 0, orbPart.Position.Z - pPos.Z)).Magnitude
						if dOrb <= 30.0 then
							hasBossOrb = true
						end
					elseif orbPart then
						hasBossOrb = true
					end
				end

				if playerInDanger or isDodging or hasBossOrb then
					inDanger = true
					local spot, dist = sdv2.safeSpot.GetSafeSpot()
					if spot and typeof(spot) == "Vector3" then
						safePos = spot
						hazardName = (sdv2.safeSpot.GetCurrentHazardName and sdv2.safeSpot.GetCurrentHazardName()) or (curHazard and curHazard.name) or "Hazard"
						escapeDist = dist or 0
					end
				end
			end

			if inDanger then
				lastDodgeTimestamp = os.clock()
				wasInDanger = true
				currentStrafeTarget = nil

				if repositionTarget or repositionMoveConn then
					stopRepositionMovement()
				end

				-- Tạm dừng AutoFarm để nhường toàn quyền di chuyển cho Smart Dodge V2!
				if not autoFarm.IsPaused() then
					autoFarm.SetPaused(true)
				end

				masterState = "Dodging"
				currentHazardName = hazardName or "Hazard"
				currentEscapeDist = escapeDist or 0

				-- Đảm bảo Smart Dodge V2 luôn lập tức thực thi di chuyển tới Safe Spot
				if safePos and not sdv2.dodge.IsDodging() then
					sdv2.dodge.Perform(safePos, escapeDist, hazardName)
				end

				fireMasterStatus()
				task.wait(0.04)
				continue
			end

			-- 2. Đánh giá quái xung quanh theo Combat Radius R (động theo mục tiêu hiện tại)
			local r = getCurrentTargetRadius(currentTargetName)
			-- Khi đang ở InCombat, HoldingRadius, Orbiting hoặc Strafing, mở rộng thêm HYSTERESIS_BUFFER để tránh rung bật/tắt ở mép
			local checkR = (masterState == "InCombat" or masterState == "HoldingRadius" or masterState == "Orbiting" or masterState == "Repositioning" or masterState == "Strafing") and (r + HYSTERESIS_BUFFER) or r
			local hasEnemyInRadius, totalAlive, nName, nDist, nPos, clusterCentroid, clusterCount = evaluateEnemies(checkR)

			currentTargetName = nName
			currentTargetDist = nDist
			currentTargetPos = (not isBossTarget and clusterCentroid) or nPos
			currentHazardName = nil
			currentEscapeDist = 0

			-- Tự động cập nhật lại r chuẩn xác theo quái/boss vừa quét được
			r = getCurrentTargetRadius(nName)

			local isBossActive = shared.IsBossActive()
			local bossIdx = shared.GetCurrentBossIndex()
			local isBoss1 = isBossActive and (bossIdx <= 1)
			local isBossTarget = isBossActive or (nName and nName:lower():find("boss") ~= nil)
			if isBossTarget and not cachedBoss1SpawnCenter and nPos then
				cachedBoss1SpawnCenter = nPos
			end
			local arenaCenter, arenaRadius = getBossArenaInfo()

			local inBossArena = isPlayerInsideBossArea(pPos)
			local inBoss1Arena = inBossArena

			-- [ĐIỀU KIỆN BẮT BUỘC VÀO SÀN ĐẤU BOSS (KỂ CẢ KHI BOSS TRONG TẦM CYAN R)]:
			-- Nếu mục tiêu là Boss nhưng Player chưa bước hẳn vào bên trong Sàn Đấu Boss (vừa hồi sinh,
			-- đang chạy ngoài hành lang, hoặc đứng ngoài mép cửa vào):
			-- DÙ BOSS ĐÃ NHẢY XUỐNG VÀ NẰM TRONG TẦM CYAN (nDist <= r):
			-- TUYỆT ĐỐI KHÔNG ĐƯỢC COI LÀ hasEnemyInRadius (không được dừng bước, không được kiting ngoài cửa)!
			-- BẮT BUỘC phải đặt hasEnemyInRadius = false để kích hoạt luồng di chuyển bước hẳn vào bên trong Sàn Đấu!
			if isBossTarget and not inBossArena then
				hasEnemyInRadius = false
				if repositionTarget or repositionMoveConn then
					stopRepositionMovement()
				end
			end

			-- [CHẾ ĐỘ V1 - OPEN SPACE POST-DODGE TRIGGER]:
			-- Vừa né xong chiêu (thoát khỏi inDanger) -> Quét tìm bãi trống rộng rãi nhất phòng để Reposition
			if wasInDanger then
				wasInDanger = false
				if combatMovementMode == "OpenSpace" and pPos and totalAlive > 0 and (not isBossTarget or inBossArena) then
					local bestSpot = openSpace.FindBestRepositionSpot(pPos, nPos, r, isBoss1, isPlayerInsideBossArea, isBossActive)
					if bestSpot then
						startRepositionMovement(bestSpot)
					end
				end
			end

			-- [CHẾ ĐỘ V1 - OPEN SPACE REPOSITIONING EXECUTION]:
			if repositionTarget and pPos and totalAlive > 0 then
				local targetBlocked = isApproachPathBlockedByHazard(pPos, repositionTarget, 40.0, 3.5)
				local inTargetHazard = sdv2 and sdv2.danger and sdv2.danger.IsPointInAnyHazard(repositionTarget, nil, 1.0)
				local timeElapsed = os.clock() - repositionStartTime

				if targetBlocked or inTargetHazard or timeElapsed >= MAX_REPOSITION_TIME then
					stopRepositionMovement()
				else
					local toTarget = Vector3.new(repositionTarget.X - pPos.X, 0, repositionTarget.Z - pPos.Z)
					local distToSpot = toTarget.Magnitude

					if distToSpot <= 1.8 then
						stopRepositionMovement()
					else
						if not repositionMoveConn then
							startRepositionMovement(repositionTarget)
						end

						if not autoFarm.IsPaused() then
							autoFarm.SetPaused(true)
						end

						masterState = "Repositioning"
						currentHazardName = nil
						currentEscapeDist = distToSpot
						fireMasterStatus()
						task.wait(0.04)
						continue
					end
				end
			end

			if totalAlive == 0 then
				currentTargetPos = nil
				if repositionTarget or repositionMoveConn then
					stopRepositionMovement()
				end
				-- Ưu tiên 4: Toàn bộ quái đã chết (Đã dọn phòng)
				if not autoFarm.IsPaused() then
					autoFarm.SetPaused(true)
				end
				targetFacing.SetTargetOverride(nil)
				targetFacing.SetEnabled(false)
				if targetScope == "Boss" and not shared.IsBossActive() then
					masterState = "WaitingBoss"
				else
					masterState = "RoomCleared"
				end
			elseif hasEnemyInRadius then
				-- Ưu tiên 2: CÓ QUÁI TRONG TẦM BÁN KÍNH R -> IN COMBAT!
				-- Tạm dừng bước chân AutoFarm để giữ cự ly chiến đấu (chỉ pause khi chưa pause)
				if not autoFarm.IsPaused() then
					autoFarm.SetPaused(true)
				end
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				if hum then
					pcall(function() hum:Move(Vector3.zero, false) end)
				end

				-- Luôn duy trì reachDistance chuẩn bằng Combat Radius R cho AutoFarm
				if autoFarm.GetReachDistance and autoFarm.SetReachDistance then
					if math.abs(autoFarm.GetReachDistance() - r) > 0.5 then
						autoFarm.SetReachDistance(r)
					end
				end

				-- Tự động khóa mặt vào quái khi trong tầm chiến đấu
				targetFacing.SetEnabled(true)

				-- Hàm kiểm tra độ an toàn của điểm di chuyển (mặt sàn, hazard, lộ trình di chuyển, tường, ràng buộc biên sàn đấu)
				local function isSafeSpot(pos)
					-- 1. Ràng buộc cứng sàn đấu Boss (nếu có Arena): Điểm đến bắt buộc phải nằm bên trong sàn đấu
					if isBossTarget and arenaCenter and arenaRadius and arenaRadius > 0 then
						local dCenter = (Vector3.new(pos.X - arenaCenter.X, 0, pos.Z - arenaCenter.Z)).Magnitude
						if dCenter > (arenaRadius - 3.5) then
							return false, nil
						end
					end

					local rawFloorY, hasFloor = sdv2.danger.GetRawFloorY(pos)
					if not hasFloor or not rawFloorY or math.abs(rawFloorY - (pPos.Y - 2.5)) > 3.5 then
						return false, nil
					end
					local floorPos = Vector3.new(pos.X, rawFloorY + 2.8, pos.Z)
					-- 2. Điểm đến phải an toàn và có khoảng đệm tối thiểu 1.5 studs với mép mọi chiêu thức
					if sdv2.danger.IsPointInAnyHazard(floorPos, nil, 1.5) then
						return false, nil
					end
					-- 3. Toàn bộ lộ trình di chuyển từ pPos tới floorPos phải hoàn toàn sạch bóng chiêu (Path Clearance)
					if not sdv2.danger.IsPathSafe(pPos, floorPos) then
						return false, nil
					end
					-- Raycast kiểm tra tường từ hông nhân vật tới điểm đích
					local rayOrigin = Vector3.new(pPos.X, pPos.Y + 1.2, pPos.Z)
					local rayDir = floorPos - rayOrigin
					local wallHit = workspace:Raycast(rayOrigin, rayDir, floorRayParams)
					if wallHit and wallHit.Instance and wallHit.Instance.CanCollide and wallHit.Normal.Y <= 0.65 then
						return false, nil
					end
					return true, floorPos
				end

				-- Hàm thực thi Combat Micro-Strafing (chủ động nhấp nhả lướt nhẹ né chiêu trước khi quái kịp tung ra)
				local function performCombatMicroStrafe(anchorPos, desiredRadius, fallbackState)
					fallbackState = fallbackState or "InCombat"
					local hum = char and char:FindFirstChildOfClass("Humanoid")
					if not hum then return fallbackState end

					if not combatMicroStrafingEnabled or combatMovementMode == "OpenSpace" then
						pcall(function()
							hum:Move(Vector3.zero, false)
							hum:MoveTo(pPos)
						end)
						return fallbackState
					end

					local now = os.clock()

					-- 1. Đang trong hành trình lướt tới điểm Micro-Strafe:
					if currentStrafeTarget then
						local distToStrafe = (Vector3.new(currentStrafeTarget.X - pPos.X, 0, currentStrafeTarget.Z - pPos.Z)).Magnitude
						local elapsed = now - strafeTargetStartTime
						if distToStrafe <= 1.8 or elapsed >= 0.75 then
							-- Đã đến nơi hoặc quá thời gian bước chân -> Kết thúc bước lướt, chuyển sang nhịp dừng chân xả combo
							currentStrafeTarget = nil
							lastMicroStrafeTime = now
							currentStrafePause = 0.9 + (math.random(0, 6) / 10) -- Nghỉ chân 0.9s - 1.5s
							pcall(function() hum:MoveTo(pPos) end)
							return fallbackState
						else
							hum:MoveTo(currentStrafeTarget)
							return "Strafing"
						end
					end

					-- 2. Đang trong nhịp dừng chân vững xả chiêu (Cooldown giữa 2 lần strafe):
					if (now - lastMicroStrafeTime) < currentStrafePause then
						pcall(function() hum:MoveTo(pPos) end)
						return fallbackState
					end

					-- 3. Hết nhịp dừng -> Khởi động bước Micro-Strafe tiếp theo!
					if not anchorPos then
						pcall(function() hum:MoveTo(pPos) end)
						return fallbackState
					end

					local toPlayer = Vector3.new(pPos.X - anchorPos.X, 0, pPos.Z - anchorPos.Z)
					local curDist = toPlayer.Magnitude
					if curDist < 2.0 then
						pcall(function() hum:MoveTo(pPos) end)
						return fallbackState
					end

					local curAngle = math.atan2(toPlayer.Z, toPlayer.X)
					-- Bước góc ứng với khoảng 4.5 studs trên cung tròn (s = r * theta => theta = s / r)
					local stepStuds = 4.5
					local angleStep = math.clamp(stepStuds / curDist, math.rad(12), math.rad(28))

					-- 25% xác suất đảo chiều ngẫu nhiên để bước đi tự nhiên như người chơi thật
					if math.random() < 0.25 then
						strafeDirection = -strafeDirection
					end

					-- Thử hướng strafe hiện tại
					local testAngle = curAngle + (strafeDirection * angleStep)
					local testCandidate = anchorPos + Vector3.new(math.cos(testAngle), 0, math.sin(testAngle)) * curDist

					local safe, safePos = isSafeSpot(testCandidate)
					if not safe then
						-- Bị vướng tường hoặc hazard -> Đảo chiều ngược lại
						strafeDirection = -strafeDirection
						testAngle = curAngle + (strafeDirection * angleStep)
						testCandidate = anchorPos + Vector3.new(math.cos(testAngle), 0, math.sin(testAngle)) * curDist
						safe, safePos = isSafeSpot(testCandidate)
					end

					if safe and safePos then
						currentStrafeTarget = safePos
						strafeTargetStartTime = now
						hum:MoveTo(safePos)
						return "Strafing"
					else
						-- Cả 2 hướng đều bị cản -> Đứng yên và thử lại sau 1.0s
						lastMicroStrafeTime = now
						currentStrafePause = 1.0
						pcall(function() hum:MoveTo(pPos) end)
						return fallbackState
					end
				end

				-- Thiết lập mục tiêu định hướng Target Facing (Centroid cho quái thường, Boss cho Boss)
				if not isBossTarget then
					local packCenter = clusterCentroid or nPos
					if packCenter then
						targetFacing.SetTargetOverride(packCenter)
					else
						targetFacing.SetTargetOverride(nil)
					end
				else
					targetFacing.SetTargetOverride(nil)
				end

				-- Đệm ổn định sau né (Post-Dodge Settle):
				-- Nếu vừa né xong (trong vòng 0.45s) và trên sàn vẫn còn tàn dư chiêu thức chưa tan biến hẳn:
				-- Đứng vững chân tại điểm Safe Spot vừa né tới (InCombat) để xả combo skill vào quái/boss,
				-- TUYỆT ĐỐI không vội di chuyển lăng xăng ngay tránh giẫm ngược lại mép chiêu cũ gây giật giật!
				local isPostDodgeSettling = (os.clock() - lastDodgeTimestamp < 0.45)
					and (sdv2 and sdv2.danger and sdv2.danger.IsPlayerInDanger())

				if isPostDodgeSettling then
					currentStrafeTarget = nil
					lastMicroStrafeTime = os.clock()
					local hum = char and char:FindFirstChildOfClass("Humanoid")
					if hum then
						pcall(function()
							hum:Move(Vector3.zero, false)
							hum:MoveTo(pPos)
						end)
					end
					masterState = "InCombat"
					fireMasterStatus()
					task.wait(0.04)
					continue
				end

				-- Hàm tìm điểm lùi/kiting thông minh chống kẹt góc tường (Wall-Aware Multi-Angle Kiting)
				local function findBestKitingSpot(anchorPos, desiredRadius, awayDir, preferInwardCenter)
					if not anchorPos or not pPos then return nil end

					local baseAwayAngle = (awayDir and awayDir.Magnitude > 0.05) and math.atan2(awayDir.Z, awayDir.X) or 0
					local candidateAngles = {
						baseAwayAngle,
						baseAwayAngle + math.rad(25),
						baseAwayAngle - math.rad(25),
						baseAwayAngle + math.rad(50),
						baseAwayAngle - math.rad(50),
						baseAwayAngle + math.rad(75),
						baseAwayAngle - math.rad(75),
						baseAwayAngle + math.rad(90),
						baseAwayAngle - math.rad(90),
					}

					-- Nếu có tâm sàn đấu (preferInwardCenter): bổ sung thêm các góc hướng về phía tâm sàn
					if preferInwardCenter then
						local inwardVec = Vector3.new(preferInwardCenter.X - anchorPos.X, 0, preferInwardCenter.Z - anchorPos.Z)
						if inwardVec.Magnitude > 2.0 then
							local inAngle = math.atan2(inwardVec.Z, inwardVec.X)
							table.insert(candidateAngles, inAngle)
							table.insert(candidateAngles, inAngle + math.rad(30))
							table.insert(candidateAngles, inAngle - math.rad(30))
						end
					end

					local bestSafePos = nil
					local bestScore = -math.huge

					for _, angle in ipairs(candidateAngles) do
						local testPt = anchorPos + Vector3.new(math.cos(angle), 0, math.sin(angle)) * desiredRadius
						local safe, safePt = isSafeSpot(testPt)
						if safe and safePt then
							local distToPlayer = (Vector3.new(safePt.X - pPos.X, 0, safePt.Z - pPos.Z)).Magnitude
							local angleDiff = math.abs(math.atan2(math.sin(angle - baseAwayAngle), math.cos(angle - baseAwayAngle)))

							-- Kiểm tra không gian phía sau (Back-wall Raycast Clearance)
							local clearance = desiredRadius
							local backRayOrigin = Vector3.new(safePt.X, safePt.Y + 1.0, safePt.Z)
							local backDir = Vector3.new(math.cos(angle), 0, math.sin(angle)) * 10.0
							local wallBehind = workspace:Raycast(backRayOrigin, backDir, floorRayParams)
							if wallBehind and wallBehind.Instance and wallBehind.Instance.CanCollide then
								clearance = wallBehind.Distance
							end

							-- Chấm điểm ứng viên:
							-- 1. Ưu tiên không gian phía sau rộng thoáng (tránh kẹt góc tường)
							local score = clearance * 2.0
							-- 2. Ưu tiên điểm hướng về tâm sàn đấu (nếu có)
							if preferInwardCenter then
								local distToCenter = (Vector3.new(safePt.X - preferInwardCenter.X, 0, safePt.Z - preferInwardCenter.Z)).Magnitude
								score = score - (distToCenter * 2.5)
							end
							-- 3. Ưu tiên hướng lùi tự nhiên
							score = score - (angleDiff * 2.5)
							-- 4. Ưu tiên điểm gần người chơi để di chuyển mượt
							score = score - (distToPlayer * 0.8)

							if score > bestScore then
								bestScore = score
								bestSafePos = safePt
							end
						end
					end

					return bestSafePos
				end

				local isMaintainDistanceActive = maintainDistanceEnabled
				if maintainDistanceEnabled then
					if maintainDistanceScope == "Boss" and not isBossTarget then
						isMaintainDistanceActive = false
					elseif maintainDistanceScope == "Mobs" and isBossTarget then
						isMaintainDistanceActive = false
					end
				end

				if combatMovementMode == "OpenSpace" then
					-- ==============================================================
					-- [CHẾ ĐỘ V1 - BÃI TRỐNG (OPEN SPACE)]:
					-- ĐỨNG YÊN HOÀN TOÀN TẠI BÃI TRỐNG XẢ SKILL (STAND GROUND)!
					-- Áp dụng cho CẢ BOSS VÀ MOB THƯỜNG.
					-- Tuyệt đối KHÔNG tự ý di chuyển lăng xăng trong lúc combat.
					-- KHÔNG Orbit, KHÔNG Kiting, KHÔNG Micro-Strafe, KHÔNG lùi vòng cung.
					-- Nhân vật đứng trụ vững vàng tại vị trí hiện tại (bãi trống) và tập trung xả combo skill.
					-- Việc di chuyển chỉ diễn ra khi:
					--   1. Né chiêu đỏ (Smart Dodge V2)
					--   2. Thoát chiêu đỏ -> Lướt vào bãi trống mới rộng rãi (Post-Dodge Repositioning)
					--   3. Quái ở xa ngoài tầm R -> AutoFarm bước tới mép R
					-- ==============================================================
					local targetCenter = (not isBossTarget and (clusterCentroid or nPos)) or nPos
					if not isBossTarget and targetCenter then
						targetFacing.SetTargetOverride(targetCenter)
					else
						targetFacing.SetTargetOverride(nil)
					end

					local hum = char and char:FindFirstChildOfClass("Humanoid")
					if hum then
						pcall(function()
							hum:Move(Vector3.zero, false)
							hum:MoveTo(pPos)
						end)
					end
					masterState = "InCombat"
				elseif not isMaintainDistanceActive then
					-- [TÍNH NĂNG GIỮ KHOẢNG CÁCH TẮT HOẶC NGOÀI SCOPE]: Đứng vững chân xả chiêu tại cự ly R, không lùi/kiting
					targetFacing.SetTargetOverride(clusterCentroid or nPos)
					local hum = char and char:FindFirstChildOfClass("Humanoid")
					if hum then
						pcall(function()
							hum:Move(Vector3.zero, false)
							hum:MoveTo(pPos)
						end)
					end
					masterState = "InCombat"
				elseif isBossTarget then
					targetFacing.SetTargetOverride(nil)
					-- ==============================================================
					-- [BOSS COMBAT RADAR - ORBIT MODE V2]: GIỮ BÁN KÍNH CHIẾN ĐẤU R
					-- Luôn giữ Boss nằm trọn trong vòng radar bán kính Cyan R.
					-- Nếu Boss tiến quá sát (< R - 2.5), lùi thông minh (Wall-Aware Kiting)
					-- để đẩy Boss về mép vòng tròn Cyan R.
					-- ==============================================================
					local holdDist = r - 1.0
					local isTooClose = nDist and nPos and pPos and (nDist < (r - 2.5))

					if isTooClose then
						local awayVec = Vector3.new(pPos.X - nPos.X, 0, pPos.Z - nPos.Z)
						local awayDir = (awayVec.Magnitude > 0.1) and awayVec.Unit or Vector3.new(0, 0, 1)
						local bestSafePos = findBestKitingSpot(nPos, holdDist, awayDir, arenaCenter)

						if bestSafePos then
							local hum = char and char:FindFirstChildOfClass("Humanoid")
							if hum then
								hum:MoveTo(bestSafePos)
							end
							masterState = "HoldingRadius"
						else
							masterState = performCombatMicroStrafe(nPos, holdDist, "InCombat")
						end
					else
						masterState = performCombatMicroStrafe(nPos, holdDist, "InCombat")
					end
				else
					-- ==============================================================
					-- [MOBS THƯỜNG - CHẾ ĐỘ V2 ORBIT]: CHĂN BẦY / GOM QUÁI (HERDING & GROUPING) + WALL-AWARE KITING
					-- 1. Neo góc nhìn và điểm nhắm vào TRỌNG TÂM CỤM QUÁI (Cluster Centroid)
					-- 2. Di chuyển theo quỹ đạo xoay tròn (Orbit) quanh Cluster Centroid ở cự ly r
					--    để ép tất cả quái phải quay đầu hội tụ vào tâm vòng tròn (Funnel Effect).
					-- 3. Nếu cả 2 chiều Orbit bị tường cản -> Dùng Wall-Aware Backstep lùi hướng thoáng nhất!
					-- ==============================================================
					local packCenter = clusterCentroid or nPos
					if packCenter then
						targetFacing.SetTargetOverride(packCenter)
					else
						targetFacing.SetTargetOverride(nil)
					end

					local packDiff = packCenter and Vector3.new(pPos.X - packCenter.X, 0, pPos.Z - packCenter.Z) or Vector3.new(0, 0, 1)
					local distToPack = packDiff.Magnitude
					local nearestD = nDist or distToPack

					local packSpread = (packCenter and nPos) and (Vector3.new(packCenter.X - nPos.X, 0, packCenter.Z - nPos.Z)).Magnitude or 0
					local orbitDist = math.clamp(r + (packSpread * 0.65), r - 1.0, r + 8.0)

					local isTooClose = nearestD < (r - 1.0)
					local shouldGroupHerd = (clusterCount and clusterCount > 1) and (distToPack <= (orbitDist + 4.0))

					if (isTooClose or shouldGroupHerd) and packCenter then
						local curAngle = (distToPack > 0.1) and math.atan2(packDiff.Z, packDiff.X) or 0
						local orbitAngleStep = math.rad(24)

						-- 1. Thử hướng orbit hiện tại quanh packCenter
						local targetAngle = curAngle + (orbitDirection * orbitAngleStep)
						local orbitCandidate = packCenter + Vector3.new(math.cos(targetAngle), 0, math.sin(targetAngle)) * orbitDist

						local safe, safePos = isSafeSpot(orbitCandidate)
						if not safe then
							orbitDirection = -orbitDirection
							local altAngle = curAngle + (orbitDirection * orbitAngleStep)
							local altCandidate = packCenter + Vector3.new(math.cos(altAngle), 0, math.sin(altAngle)) * orbitDist
							safe, safePos = isSafeSpot(altCandidate)
						end

						-- 2. Nếu cả 2 chiều orbit đều bị kẹt (hành lang hẹp/góc tường) -> Dùng Wall-Aware Kiting
						if not safe then
							local awayDir = (distToPack > 0.1) and packDiff.Unit or Vector3.new(0, 0, 1)
							safePos = findBestKitingSpot(packCenter, orbitDist, awayDir, nil)
						end

						if safePos then
							local hum = char and char:FindFirstChildOfClass("Humanoid")
							if hum then
								hum:MoveTo(safePos)
							end
							masterState = "Orbiting"
						else
							masterState = performCombatMicroStrafe(packCenter or nPos, orbitDist, "InCombat")
						end
					else
						masterState = performCombatMicroStrafe(packCenter or nPos, r, "InCombat")
					end
				end
			else
				-- Ưu tiên 3: QUÁI Ở XA NGOÀI R -> AUTO APPROACH!

				local isInvuln = (shared.IsInvulnerable and shared.IsInvulnerable())
					or (shared.IsJustRespawned and shared.IsJustRespawned(4.0))

				-- KIỂM TRA ĐẶC BIỆT: Đường tiếp cận quái có đang bị chiêu/vùng nguy hiểm chặn không?
				local isPathBlocked = false
				local blockingHazardName = nil
				local isJustDodged = false

				if not isInvuln then
					-- Chỉ kiểm tra hazard ngay trước mũi chân (tối đa 8.0 studs) thay vì 35.0 studs
					isPathBlocked, blockingHazardName = isApproachPathBlockedByHazard(pPos, nPos, 8.0, 2.0)
					local v2HazCount = 0
					if sdv2 and sdv2.detection and sdv2.detection.GetHazardCount then
						v2HazCount = sdv2.detection.GetHazardCount()
					end
					isJustDodged = (os.clock() - lastDodgeTimestamp < 1.2) and (v2HazCount > 0)
				end

				-- Chống kẹt vĩnh viễn ở trạng thái WaitingHazard: nếu đã đợi quá 1.5s thì cho phép di chuyển tiếp
				if isPathBlocked or isJustDodged then
					if waitingHazardStartTime == 0 then
						waitingHazardStartTime = os.clock()
					end
					if (os.clock() - waitingHazardStartTime) > 1.5 then
						-- Đã đợi quá 1.5s -> Cho phép tiếp tục di chuyển (Smart Dodge sẽ lo nếu thực sự chạm hazard)
						isPathBlocked = false
						isJustDodged = false
					end
				else
					waitingHazardStartTime = 0
				end

				local isApproachAllowed = true
				if approachScope == "Boss" and not isBossTarget then
					isApproachAllowed = false
				elseif approachScope == "Mobs" and isBossTarget then
					isApproachAllowed = false
				end

				if not isApproachAllowed then
					-- Mục tiêu ngoài phạm vi tiếp cận (Approach Target Scope) -> Tạm dừng AutoFarm, giữ nguyên vị trí
					if not autoFarm.IsPaused() then
						autoFarm.SetPaused(true)
					end
					local hum = char and char:FindFirstChildOfClass("Humanoid")
					if hum then
						pcall(function() hum:Move(Vector3.zero, false) end)
					end
					targetFacing.SetTargetOverride(clusterCentroid or nPos)
					targetFacing.SetEnabled(true)
					masterState = "HoldingPosition"
				elseif isPathBlocked or isJustDodged then
					-- Đường đi đang bị chặn bởi chiêu hoặc vừa né xong chiêu chưa tan!
					-- Tạm dừng AutoFarm, giữ nguyên vị trí an toàn, khóa mặt vào quái
					if not autoFarm.IsPaused() then
						autoFarm.SetPaused(true)
					end
					local hum = char and char:FindFirstChildOfClass("Humanoid")
					if hum then
						pcall(function() hum:Move(Vector3.zero, false) end)
					end
					targetFacing.SetEnabled(true)
					masterState = "WaitingHazard"
					currentHazardName = blockingHazardName or "Active Hazard"
				else
					-- Đường đi an toàn -> Mở đường cho AutoFarm tiếp cận mục tiêu
					targetFacing.SetTargetOverride(nil)
					targetFacing.SetEnabled(false)
					local hum = char and char:FindFirstChildOfClass("Humanoid")
					if hum and hum.AutoRotate ~= true then
						hum.AutoRotate = true
					end

					-- [ƯU TIÊN VÀO SÀN BOSS ĐỒNG THỜI GIỮ KHOẢNG CÁCH]:
					-- Khi đang ở ngoài sàn Boss (kể cả sau hồi sinh):
					-- Không được dừng lại ở cự ly reachDistance chuẩn R bên ngoài cửa.
					-- Đặt reachDistance nhỏ (2.0 studs) để AutoFarm tiếp tục dẫn người chơi bước qua cửa vào hẳn trong sàn!
					local effectiveReach = r
					if isBossTarget and not inBossArena then
						effectiveReach = 2.0
					end

					if autoFarm.GetReachDistance and autoFarm.SetReachDistance then
						if math.abs(autoFarm.GetReachDistance() - effectiveReach) > 0.5 then
							autoFarm.SetReachDistance(effectiveReach)
						end
					end

					if not autoFarm.IsEnabled() then
						autoFarm.SetPaused(false)
						autoFarm.Toggle(true, true)
					else
						autoFarm.SetPaused(false)
					end

					if isBossTarget and not inBossArena then
						masterState = "EnteringBossArea"

						-- [CƠ CHẾ BẮT BUỘC BƯỚC VÀO SÀN ĐẤU - FORCE-ENTRY ASSIST]:
						-- Nếu AutoFarm bị khựng hoặc Pathfinding bị nghẽn ở ngưỡng cửa phòng Boss:
						-- Trực tiếp điều khiển Humanoid bước thẳng hướng vào bên trong Sàn Đấu / Boss!
						local enterTarget = arenaCenter or nPos
						if hum and enterTarget and pPos then
							local enterVec = Vector3.new(enterTarget.X - pPos.X, 0, enterTarget.Z - pPos.Z)
							if enterVec.Magnitude > 0.5 then
								pcall(function()
									hum:Move(enterVec.Unit, false)
								end)
							end
						end
					else
						masterState = "Approaching"
					end
				end
			end

			fireMasterStatus()
			task.wait(0.06)
		end

		masterLoopThread = nil
	end)
end

local function stopMasterLoop()
	masterEnabled = false
	if masterLoopThread then
		task.cancel(masterLoopThread)
		masterLoopThread = nil
	end

	waitingHazardStartTime = 0
	orbitDirection = 1
	wasInDanger = false
	currentTargetPos = nil
	if repositionTarget or repositionMoveConn then
		stopRepositionMovement()
	end
	openSpace.ClearVisualMarker()

	-- Dừng các hệ thống con
	autoFarm.SetPaused(false)
	if autoFarm.IsEnabled() then
		autoFarm.Toggle(false)
	end
	if not smartAutoSkillEnabled then
		autoSkill.SetEnabled(false)
	end
	targetFacing.SetTargetOverride(nil)
	targetFacing.SetEnabled(false)
	if sdv2 and sdv2.dodge then
		sdv2.dodge.Cancel()
	end

	masterState = "Disabled"
	currentHazardName = nil
	currentEscapeDist = 0
	currentTargetName = nil
	currentTargetDist = nil
	fireMasterStatus()
end

--// Public API: Master Switch
function smartAutoPlay.SetMasterEnabled(state)
	local want = state and true or false
	if want == masterEnabled then return end
	masterEnabled = want

	if masterEnabled then
		-- Tuyên bố độc quyền trong coordinator để tắt AutoFarm thủ công cũ nếu có
		coordinator.EnableExclusive("SmartAutoPlay")

		-- Kích hoạt Smart Dodge V2
		if sdv2 then
			if sdv2.SetTargetScope then
				sdv2.SetTargetScope(targetScope)
			end
			if sdv2.dodge then
				sdv2.dodge.SetEnabled(true)
			end
		end

		-- Kích hoạt Auto Skill (nếu được bật)
		if autoSkill and autoSkill.SetTargetScope then
			autoSkill.SetTargetScope(targetScope)
		end
		if smartAutoSkillEnabled then
			autoSkill.SetEnabled(true)
		else
			autoSkill.SetEnabled(false)
		end

		-- Kích hoạt AutoFarm dẫn đường với bán kính dừng R
		if autoFarm.SetTargetScope then
			autoFarm.SetTargetScope(targetScope)
		end
		if autoFarm.GetReachDistance and autoFarm.SetReachDistance then
			autoFarm.SetReachDistance(radius)
		end
		if targetScope == "Boss" and not shared.IsBossActive() then
			autoFarm.Toggle(false)
			autoFarm.SetPaused(true)
		else
			autoFarm.SetPaused(false)
			autoFarm.Toggle(true, true)
		end

		startMasterLoop()
	else
		stopMasterLoop()
	end
end

function smartAutoPlay.IsMasterEnabled()
	return masterEnabled
end

function smartAutoPlay.SetAutoSkillEnabled(state)
	smartAutoSkillEnabled = state and true or false
	if autoSkill and autoSkill.SetTargetScope then
		autoSkill.SetTargetScope(targetScope)
	end
	autoSkill.SetEnabled(smartAutoSkillEnabled)
	fireMasterStatus()
end

function smartAutoPlay.IsAutoSkillEnabled()
	return smartAutoSkillEnabled
end

function smartAutoPlay.GetMasterStatus()
	return {
		enabled = masterEnabled,
		state = masterState,
		autoSkillEnabled = smartAutoSkillEnabled,
		hazardName = currentHazardName,
		escapeDist = currentEscapeDist,
		targetName = currentTargetName,
		targetDist = currentTargetDist,
		radius = getCurrentTargetRadius(currentTargetName),
		radiusMobs = radiusMobs,
		radiusBoss1 = radiusBoss1,
		radiusBoss2 = radiusBoss2,
		radiusBoss3 = radiusBoss3,
		skillRange = skillRange,
		maintainDistance = maintainDistanceEnabled,
		targetScope = targetScope,
		combatTargetScope = targetScope,
		maintainDistanceScope = maintainDistanceScope,
		approachScope = approachScope,
		combatMovementMode = combatMovementMode,
		repositionDist = repositionTarget and currentEscapeDist or nil,
	}
end

function smartAutoPlay.SetCombatMovementMode(mode: string)
	local normalized = (tostring(mode or "Orbit")):lower()
	if normalized:find("open") or normalized:find("v1") or normalized:find("trống") or normalized:find("trong") then
		combatMovementMode = "OpenSpace"
		currentStrafeTarget = nil
	else
		combatMovementMode = "Orbit"
	end

	if combatMovementMode ~= "OpenSpace" and (repositionTarget or repositionMoveConn) then
		stopRepositionMovement()
	end
	fireMasterStatus()
end

function smartAutoPlay.GetCombatMovementMode(): string
	return combatMovementMode
end

function smartAutoPlay.OnMasterStatusChanged(callback)
	if type(callback) == "function" then
		table.insert(masterStatusListeners, callback)
	end
end

--// Visual API
function smartAutoPlay.SetShowRadiusCircle(state)
	showRadiusCircle = state and true or false
	checkVisualLoop()
end

function smartAutoPlay.IsShowRadiusCircleEnabled()
	return showRadiusCircle
end

function smartAutoPlay.SetShowSkillCircle(state)
	showSkillCircle = state and true or false
	checkVisualLoop()
end

function smartAutoPlay.IsShowSkillCircleEnabled()
	return showSkillCircle
end

-- Backward compatibility SetRadius -> sets Mobs Radius
function smartAutoPlay.SetRadius(val)
	if type(val) == "number" and val > 0 then
		radiusMobs = math.clamp(val, 2.0, 100.0)
	end
end

function smartAutoPlay.GetRadius()
	return getCurrentTargetRadius(currentTargetName)
end

function smartAutoPlay.GetTargetRadius()
	return getCurrentTargetRadius(currentTargetName)
end

function smartAutoPlay.SetMobsRadius(val)
	if type(val) == "number" and val > 0 then
		radiusMobs = math.clamp(val, 2.0, 100.0)
	end
end

function smartAutoPlay.GetMobsRadius()
	return radiusMobs
end

function smartAutoPlay.SetBoss1Radius(val)
	if type(val) == "number" and val > 0 then
		radiusBoss1 = math.clamp(val, 2.0, 100.0)
	end
end

function smartAutoPlay.GetBoss1Radius()
	return radiusBoss1
end

function smartAutoPlay.SetBoss2Radius(val)
	if type(val) == "number" and val > 0 then
		radiusBoss2 = math.clamp(val, 2.0, 100.0)
	end
end

function smartAutoPlay.GetBoss2Radius()
	return radiusBoss2
end

function smartAutoPlay.SetDodgeBoss2Orb(state: boolean)
	if sdv2 and sdv2.danger and sdv2.danger.SetDodgeBoss2OrbEnabled then
		sdv2.danger.SetDodgeBoss2OrbEnabled(state)
	end
end

function smartAutoPlay.IsDodgeBoss2OrbEnabled(): boolean
	if sdv2 and sdv2.danger and sdv2.danger.IsDodgeBoss2OrbEnabled then
		return sdv2.danger.IsDodgeBoss2OrbEnabled()
	end
	return false
end

function smartAutoPlay.SetBoss3Radius(val)
	if type(val) == "number" and val > 0 then
		radiusBoss3 = math.clamp(val, 2.0, 100.0)
	end
end

function smartAutoPlay.GetBoss3Radius()
	return radiusBoss3
end

function smartAutoPlay.SetSkillRange(val)
	if type(val) == "number" and val > 0 then
		skillRange = math.clamp(val, 2.0, 200.0)
		if autoSkill and autoSkill.SetSkillRadius then
			autoSkill.SetSkillRadius(skillRange)
		end
		fireMasterStatus()
	end
end

function smartAutoPlay.GetSkillRange()
	return skillRange
end

function smartAutoPlay.GetEffectiveSkillRange()
	return skillRange
end

function smartAutoPlay.SetCyanSphereSize(val)
	if type(val) == "number" and val > 0 then
		sphereSize = math.clamp(val, 0.05, 3.0)
		for _, p in ipairs(sphereParts) do
			p.Size = Vector3.new(sphereSize, sphereSize, sphereSize)
		end
	end
end
smartAutoPlay.SetKitingSphereSize = smartAutoPlay.SetCyanSphereSize

function smartAutoPlay.GetCyanSphereSize()
	return sphereSize
end
smartAutoPlay.GetKitingSphereSize = smartAutoPlay.GetCyanSphereSize

function smartAutoPlay.SetMagentaSphereSize(val)
	if type(val) == "number" and val > 0 then
		skillSphereSize = math.clamp(val, 0.05, 3.0)
		for _, p in ipairs(skillSphereParts) do
			p.Size = Vector3.new(skillSphereSize, skillSphereSize, skillSphereSize)
		end
	end
end
smartAutoPlay.SetSkillSphereSize = smartAutoPlay.SetMagentaSphereSize

function smartAutoPlay.GetMagentaSphereSize()
	return skillSphereSize
end
smartAutoPlay.GetSkillSphereSize = smartAutoPlay.GetMagentaSphereSize

function smartAutoPlay.SetSphereSize(val)
	if type(val) == "number" and val > 0 then
		smartAutoPlay.SetCyanSphereSize(val)
		smartAutoPlay.SetMagentaSphereSize(val)
	end
end

function smartAutoPlay.GetSphereSize()
	return sphereSize
end

function smartAutoPlay.IsMicroStrafingEnabled()
	return combatMicroStrafingEnabled
end

function smartAutoPlay.SetMicroStrafing(state)
	combatMicroStrafingEnabled = state and true or false
end

function smartAutoPlay.SetMaintainDistance(state)
	maintainDistanceEnabled = state and true or false
	fireMasterStatus()
end

function smartAutoPlay.IsMaintainDistanceEnabled()
	return maintainDistanceEnabled
end

function smartAutoPlay.SetTargetScope(scope)
	local normalizedScope = shared.NormalizeTargetScope(scope)
	targetScope = normalizedScope
	maintainDistanceScope = normalizedScope
	approachScope = normalizedScope

	if autoSkill and autoSkill.SetTargetScope then
		autoSkill.SetTargetScope(normalizedScope)
	end
	if autoApproach and autoApproach.SetTargetScope then
		autoApproach.SetTargetScope(normalizedScope)
	end
	if autoFarm and autoFarm.SetTargetScope then
		autoFarm.SetTargetScope(normalizedScope)
	end
	if sdv2 then
		if sdv2.SetTargetScope then
			sdv2.SetTargetScope(normalizedScope)
		end
		if sdv2.dodge and sdv2.dodge.SetStrafeFacingMode then
			sdv2.dodge.SetStrafeFacingMode(normalizedScope)
		end
	end
	if targetFacing and targetFacing.SetTargetScope then
		targetFacing.SetTargetScope(normalizedScope)
	end

	if normalizedScope == "Boss" and not shared.IsBossActive() then
		if autoFarm.IsEnabled() then
			autoFarm.Toggle(false)
		end
		autoFarm.SetPaused(true)
	end

	fireMasterStatus()
end
smartAutoPlay.SetCombatTargetScope = smartAutoPlay.SetTargetScope
smartAutoPlay.SetMaintainDistanceScope = smartAutoPlay.SetTargetScope
smartAutoPlay.SetApproachScope = smartAutoPlay.SetTargetScope

function smartAutoPlay.GetTargetScope()
	return targetScope
end
smartAutoPlay.GetCombatTargetScope = smartAutoPlay.GetTargetScope
smartAutoPlay.GetMaintainDistanceScope = smartAutoPlay.GetTargetScope
smartAutoPlay.GetApproachScope = smartAutoPlay.GetTargetScope

--// Đăng ký Coordinator để hệ thống khác (hoặc phím tắt) có thể tắt Smart Auto Play
coordinator.Register("SmartAutoPlay", smartAutoPlay.SetMasterEnabled, smartAutoPlay.IsMasterEnabled)

--// Tự động tiếp tục hoạt động khi respawn hoặc chuyển map
shared.OnRespawn(function()
	if masterEnabled then
		task.delay(0.2, function()
			if not masterEnabled then return end
			if sdv2 then
				if sdv2.SetTargetScope then
					sdv2.SetTargetScope(targetScope)
				end
				if sdv2.dodge then
					sdv2.dodge.SetEnabled(true)
				end
			end
			if autoSkill and autoSkill.SetTargetScope then
				autoSkill.SetTargetScope(targetScope)
			end
			if smartAutoSkillEnabled then
				autoSkill.SetEnabled(true)
			end
			if autoFarm.SetTargetScope then
				autoFarm.SetTargetScope(targetScope)
			end
			if autoFarm.GetReachDistance and autoFarm.SetReachDistance then
				autoFarm.SetReachDistance(radius)
			end
			if targetScope == "Boss" and not shared.IsBossActive() then
				autoFarm.Toggle(false)
				autoFarm.SetPaused(true)
			else
				autoFarm.SetPaused(false)
				if not autoFarm.IsEnabled() then
					autoFarm.Toggle(true, true)
				end
			end
		end)
	end
end)

--// Lifecycle Cleanup
lifecycle.Register(function()
	smartAutoPlay.SetMasterEnabled(false)
	stopVisualLoop()
	openSpace.ClearVisualMarker()
	for _, p in ipairs(sphereParts) do
		pcall(function() p:Destroy() end)
	end
	table.clear(sphereParts)
	for _, p in ipairs(skillSphereParts) do
		pcall(function() p:Destroy() end)
	end
	table.clear(skillSphereParts)
	if visualFolder then
		pcall(function() visualFolder:Destroy() end)
		visualFolder = nil
	end
end)

checkVisualLoop()

return smartAutoPlay
