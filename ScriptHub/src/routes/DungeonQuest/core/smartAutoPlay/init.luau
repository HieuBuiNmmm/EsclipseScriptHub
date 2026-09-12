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
local smartDodge = require("@routes/DungeonQuest/core/smartDodge")
local geometry = require("@routes/DungeonQuest/core/smartDodge/geometry")
local targetFacing = require("@routes/DungeonQuest/core/smartDodge/targetFacing")
local autoSkill = require("@routes/DungeonQuest/core/smartAutoPlay/autoSkill")
local autoApproach = require("@routes/DungeonQuest/core/smartAutoPlay/autoApproach")
local openSpace = require("@routes/DungeonQuest/core/smartAutoPlay/openSpace")

local RunService = services.RunService
local player = services.player

local smartAutoPlay = {}

--// Settings & State
local masterEnabled = false
local masterLoopThread = nil
local masterState = "Disabled" -- "Disabled" | "Dodging" | "Repositioning" | "InCombat" | "HoldingRadius" | "Orbiting" | "Approaching" | "WaitingHazard" | "EnteringArena" | "RoomCleared" | "Dead"
local currentHazardName = nil
local currentEscapeDist = 0
local currentTargetName = nil
local currentTargetDist = nil
local masterStatusListeners = {}
local lastDodgeTimestamp = 0
local orbitDirection = 1 -- 1: cùng chiều kim đồng hồ, -1: ngược chiều kim đồng hồ (Orbit Mob Grouping)
local waitingHazardStartTime = 0

--// Post-Dodge Open Space Repositioning State
local wasInDanger = false
local repositionTarget = nil
local repositionStartTime = 0
local MAX_REPOSITION_TIME = 3.5

--// Combat Micro-Strafing State (Chủ động nhấp nhả lướt nhẹ né trước khi quái kịp tung chiêu)
local combatMicroStrafingEnabled = true
local lastMicroStrafeTime = 0
local strafeDirection = 1 -- 1 hoặc -1 (xoay nhẹ theo chiều kim đồng hồ hoặc ngược lại)
local currentStrafeTarget = nil
local strafeTargetStartTime = 0
local currentStrafePause = 1.2

local smartAutoSkillEnabled = true
local radiusMobs = 14.0 -- Kiting Radius cho Quái thường (studs)
local radiusBoss1 = 16.0 -- Kiting Radius cho Boss 1 (tính từ tâm sàn đấu)
local radiusBoss2 = 24.0 -- Kiting Radius cho Boss 2
local radiusBoss3 = 32.0 -- Kiting Radius cho Boss 3+
local SPHERE_COUNT = 36 -- 36 spheres = 1 sphere every 10 degrees
local sphereSize = 0.35 -- Diameter of each sphere in studs
local SPHERE_COLOR = Color3.fromRGB(0, 225, 255) -- Vibrant Neon Cyan
local HYSTERESIS_BUFFER = 2.0 -- Đệm chống rung giật mép vòng tròn (studs)

--// Hàm xác định bán kính Kiting động theo đối tượng mục tiêu hiện tại
local function getCurrentTargetRadius(targetName)
	local isBossActive = shared.IsBossActive and shared.IsBossActive()
	local isBossName = targetName and (string.find(string.lower(targetName), "boss") ~= nil)
	if isBossActive or isBossName then
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

local showRadiusCircle = false
local showSkillCircle = false
local skillRange = 25.0 -- Skill Cast Range in studs
local SKILL_SPHERE_COUNT = 36
local skillSphereSize = 0.28 -- Đường kính hạt vòng skill (nhỏ hơn một chút để phân biệt)
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
smartAutoPlay.smartDodge = smartDodge
smartAutoPlay.autoFarm = autoFarm
smartAutoPlay.openSpace = openSpace

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
	}
	for _, cb in ipairs(masterStatusListeners) do
		pcall(cb, info)
	end
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
	floorRayParams.FilterDescendantsInstances = ignore
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

local function updateCirclePositions()
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not root or not root.Parent then
		hideSpheres()
		hideSkillSpheres()
		return
	end

	local pPos = root.Position

	-- 1. Kiting / Movement Radius Circle (Neon Cyan)
	local curTargetRadius = getCurrentTargetRadius(currentTargetName)
	if showRadiusCircle then
		updateRayFilter()
		local spheres = getOrCreateSpheres()
		local angleStep = (2 * math.pi) / SPHERE_COUNT

		local floorHit = workspace:Raycast(pPos, Vector3.new(0, -12.0, 0), floorRayParams)
		local lockedY = floorHit and (floorHit.Position.Y + (sphereSize / 2)) or (pPos.Y - 2.8)

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
		updateRayFilter()
		local skillSpheres = getOrCreateSkillSpheres()
		local effectiveSkillR = math.max(skillRange, curTargetRadius)
		local angleStep = (2 * math.pi) / SKILL_SPHERE_COUNT

		local floorHit = workspace:Raycast(pPos, Vector3.new(0, -12.0, 0), floorRayParams)
		local lockedY = floorHit and (floorHit.Position.Y + (skillSphereSize / 2)) or (pPos.Y - 2.8)

		for i = 1, SKILL_SPHERE_COUNT do
			local angle = (i - 1) * angleStep
			local targetX = pPos.X + math.cos(angle) * effectiveSkillR
			local targetZ = pPos.Z + math.sin(angle) * effectiveSkillR

			local part = skillSpheres[i]
			if part and part.Parent then
				part.Position = Vector3.new(targetX, lockedY, targetZ)
				part.Transparency = 0.3
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
				totalAlive = totalAlive + 1
				local ePos = data.Root.Position
				local dx = ePos.X - pPos.X
				local dy = ePos.Y - pPos.Y
				local dz = ePos.Z - pPos.Z
				local flatDist = math.sqrt(dx * dx + dz * dz)

				if flatDist < nearestDist then
					nearestDist = flatDist
					nearestName = (data.Model and data.Model.Name) or "Enemy"
					nearestPos = ePos
				end

				-- Chỉ tính quái trong tầm bán kính nếu độ cao chênh lệch Y không quá lớn (|dy| <= 8.0)
				-- Giúp phân biệt quái ở tầng dưới/vực sâu khi người chơi đang đứng trên mỏm đá hoặc lối vào
				if flatDist <= checkRadius and math.abs(dy) <= 8.0 then
					hasEnemyInRadius = true
				end

				-- Tính toán trọng tâm cụm quái xung quanh người chơi
				if flatDist <= clusterMaxDist and math.abs(dy) <= 8.0 then
					clusterSumX += ePos.X
					clusterSumY += ePos.Y
					clusterSumZ += ePos.Z
					clusterCount += 1
				end
			end
		end
	end

	-- Kiểm tra thêm target hiện tại của AutoFarm nếu có
	local afTarget = tracker.GetTarget()
	if afTarget and afTarget.Root and afTarget.Root.Parent then
		local hum = afTarget.Humanoid or (afTarget.Model and afTarget.Model:FindFirstChildOfClass("Humanoid"))
		if hum and hum.Health > 0 then
			local ePos = afTarget.Root.Position
			local dx = ePos.X - pPos.X
			local dy = ePos.Y - pPos.Y
			local dz = ePos.Z - pPos.Z
			local flatDist = math.sqrt(dx * dx + dz * dz)
			if flatDist <= checkRadius and math.abs(dy) <= 8.0 then
				hasEnemyInRadius = true
			end
			if flatDist < nearestDist then
				nearestDist = flatDist
				nearestName = (afTarget.Model and afTarget.Model.Name) or "Target"
				nearestPos = ePos
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
	if smartDodge.GetHazardCount and smartDodge.GetHazardCount() == 0 then
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
		local inDanger, hazardInfo = geometry.IsPointInAnyHazard(samplePt)
		if inDanger then
			local hName = (hazardInfo and hazardInfo.Name) or "Active Hazard"
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

local function getBoss1ArenaInfo()
	local center = smartDodge.GetBoss1ArenaCenter and smartDodge.GetBoss1ArenaCenter()
	local radius = smartDodge.GetBoss1ArenaRadius and smartDodge.GetBoss1ArenaRadius()
	if center and radius and radius > 0 then
		return center, radius
	end

	local fp = getFirstBossArenaPart()
	if fp then
		local r = math.max(fp.Size.X, fp.Size.Z) / 2
		return fp.Position, math.max(25, r - 2.5)
	end

	if cachedBoss1SpawnCenter then
		return cachedBoss1SpawnCenter, 40.0
	end

	return nil, nil
end

local function isPlayerInsideBoss1Arena(pPos)
	if not pPos then return true end
	local center, arenaRadius = getBoss1ArenaInfo()
	if center and arenaRadius and arenaRadius > 0 then
		local diff = (Vector3.new(pPos.X - center.X, 0, pPos.Z - center.Z)).Magnitude
		return diff <= (arenaRadius - 1.0)
	end
	return true
end

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

			-- 1. Ưu tiên 1: NGUY HIỂM (DODGE MODE)
			local inDanger = (smartDodge.IsInDanger and smartDodge.IsInDanger())
				or (smartDodge.IsDodging and smartDodge.IsDodging())

			if inDanger then
				lastDodgeTimestamp = os.clock()
				wasInDanger = true
				currentStrafeTarget = nil
				-- Khi nguy hiểm mới xuất hiện -> Ngắt repositioning ngay lập tức!
				if repositionTarget then
					repositionTarget = nil
					openSpace.UpdateVisualMarker(nil, false)
				end

				-- Tạm dừng AutoFarm để nhường toàn quyền di chuyển cho Smart Dodge!
				if not autoFarm.IsPaused() then
					autoFarm.SetPaused(true)
				end

				local safePos, _, hazardName, escapeDist = smartDodge.GetCurrentSafeSpot()
				masterState = "Dodging"
				currentHazardName = hazardName or "Hazard"
				currentEscapeDist = escapeDist or 0

				-- Đảm bảo SmartDodge luôn lập tức thực thi di chuyển tới Safe Spot (chống đứng yên khi vừa hồi sinh)
				if safePos and not smartDodge.IsDodging() and smartDodge.IsAutoDodgeEnabled and smartDodge.IsAutoDodgeEnabled() then
					if smartDodge.Perform then
						smartDodge.Perform(safePos, escapeDist, hazardName)
					end
				end

				fireMasterStatus()
				task.wait(0.04)
				continue
			end

			local char = player and player.Character
			local root = char and char:FindFirstChild("HumanoidRootPart")
			local pPos = root and root.Position

			-- 2. Đánh giá quái xung quanh theo Combat Radius R (động theo mục tiêu hiện tại)
			local r = getCurrentTargetRadius(currentTargetName)
			-- Khi đang ở InCombat, HoldingRadius, Orbiting hoặc Strafing, mở rộng thêm HYSTERESIS_BUFFER để tránh rung bật/tắt ở mép
			local checkR = (masterState == "InCombat" or masterState == "HoldingRadius" or masterState == "Orbiting" or masterState == "Strafing") and (r + HYSTERESIS_BUFFER) or r
			local hasEnemyInRadius, totalAlive, nName, nDist, nPos, clusterCentroid, clusterCount = evaluateEnemies(checkR)

			currentTargetName = nName
			currentTargetDist = nDist
			currentHazardName = nil
			currentEscapeDist = 0

			-- Tự động cập nhật lại r chuẩn xác theo quái/boss vừa quét được
			r = getCurrentTargetRadius(nName)

			local isBossActive = shared.IsBossActive()
			local bossIdx = shared.GetCurrentBossIndex()
			local isBoss1 = isBossActive and (bossIdx <= 1)
			local arenaCenter, arenaRadius = getBoss1ArenaInfo()
			if isBoss1 and not cachedBoss1SpawnCenter and nPos then
				cachedBoss1SpawnCenter = nPos
			end

			local inBoss1Arena = isPlayerInsideBoss1Arena(pPos)
			-- Khi đang đấu Boss 1 trong sàn Arena: Luôn coi như InCombat để giữ cự ly với tâm sàn và không để AutoFarm kéo ra mép sàn!
			if isBoss1 and inBoss1Arena and arenaCenter and arenaRadius and arenaRadius > 0 and totalAlive > 0 then
				hasEnemyInRadius = true
			end

			-- 3. Post-Dodge Trigger: Vừa né xong chiêu (thoát khỏi inDanger) -> Quét tìm Vùng Thoáng (Open Space)
			if wasInDanger then
				wasInDanger = false
				if openSpace.IsEnabled() and pPos and totalAlive > 0 then
					local bestSpot = openSpace.FindBestRepositionSpot(pPos, nPos, radius, isBoss1, isPlayerInsideBoss1Arena, isBossActive)
					if bestSpot then
						repositionTarget = bestSpot
						repositionStartTime = os.clock()
					end
				end
			end

			-- 4. Thực thi di chuyển tới Open Space Reposition Spot (nếu đang active)
			if repositionTarget and pPos and totalAlive > 0 then
				-- Kiểm tra nếu điểm tới bị hazard hoặc đường đi bị hazard mới chặn (bắt đầu kiểm tra từ 3.5 studs phía trước để tránh false positive từ vị trí vừa thoát)
				local targetBlocked, blockName = isApproachPathBlockedByHazard(pPos, repositionTarget, 40.0, 3.5)
				local inTargetHazard = geometry.IsPointInAnyHazard(repositionTarget)
				local timeElapsed = os.clock() - repositionStartTime

				if targetBlocked or inTargetHazard or timeElapsed >= MAX_REPOSITION_TIME then
					-- Bị hazard chặn hoặc quá thời gian tối đa -> Hủy reposition an toàn!
					repositionTarget = nil
					openSpace.UpdateVisualMarker(nil, false)
				else
					local distToSpot = (Vector3.new(repositionTarget.X - pPos.X, 0, repositionTarget.Z - pPos.Z)).Magnitude
					if distToSpot <= 2.2 then
						-- Đã tới vùng đất rộng thoáng thành công!
						repositionTarget = nil
						openSpace.UpdateVisualMarker(nil, false)
						local hum = char and char:FindFirstChildOfClass("Humanoid")
						if hum then
							pcall(function() hum:MoveTo(pPos) end)
						end
					else
						-- Đang di chuyển lướt tới điểm Blue Spot!
						if not autoFarm.IsPaused() then
							autoFarm.SetPaused(true)
						end
						targetFacing.SetEnabled(true) -- Vẫn khóa mặt vào quái trong lúc đảo vị trí

						local hum = char and char:FindFirstChildOfClass("Humanoid")
						if hum then
							hum:MoveTo(repositionTarget)
						end

						openSpace.UpdateVisualMarker(repositionTarget, true, distToSpot)

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
				if repositionTarget then
					repositionTarget = nil
					openSpace.UpdateVisualMarker(nil, false)
				end
				-- Ưu tiên 4: Toàn bộ quái đã chết (Đã dọn phòng)
				if not autoFarm.IsPaused() then
					autoFarm.SetPaused(true)
				end
				targetFacing.SetTargetOverride(nil)
				targetFacing.SetEnabled(false)
				masterState = "RoomCleared"
			elseif hasEnemyInRadius then
				-- Ưu tiên 2: CÓ QUÁI TRONG TẦM BÁN KÍNH R -> IN COMBAT!
				-- Tạm dừng bước chân AutoFarm để giữ cự ly chiến đấu (chỉ pause khi chưa pause)
				if not autoFarm.IsPaused() then
					autoFarm.SetPaused(true)
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
					-- 1. Ràng buộc cứng sàn đấu Boss 1 (nếu có Arena): Điểm đến bắt buộc phải nằm bên trong sàn đấu
					if isBoss1 and arenaCenter and arenaRadius and arenaRadius > 0 then
						local dCenter = (Vector3.new(pos.X - arenaCenter.X, 0, pos.Z - arenaCenter.Z)).Magnitude
						if dCenter > (arenaRadius - 3.5) then
							return false, nil
						end
					end

					local rawFloorY, hasFloor = geometry.GetRawFloorY(pos)
					if not hasFloor or not rawFloorY or math.abs(rawFloorY - (pPos.Y - 2.5)) > 3.5 then
						return false, nil
					end
					local floorPos = Vector3.new(pos.X, rawFloorY + 2.8, pos.Z)
					-- 2. Điểm đến phải an toàn và có khoảng đệm tối thiểu 1.5 studs với mép mọi chiêu thức
					if not geometry.IsSpotFullySafe(floorPos, 1.5) then
						return false, nil
					end
					-- 3. Toàn bộ lộ trình di chuyển từ pPos tới floorPos phải hoàn toàn sạch bóng chiêu (Path Clearance)
					if not geometry.IsPathSafe(pPos, floorPos) then
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

					if not combatMicroStrafingEnabled then
						pcall(function() hum:MoveTo(pPos) end)
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

				local isBossTarget = isBossActive or (nName and nName:lower():find("boss") ~= nil)

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
					and (smartDodge.GetHazardCount and smartDodge.GetHazardCount() > 0)

				if isPostDodgeSettling then
					currentStrafeTarget = nil
					lastMicroStrafeTime = os.clock()
					local hum = char and char:FindFirstChildOfClass("Humanoid")
					if hum then
						pcall(function() hum:MoveTo(pPos) end)
					end
					masterState = "InCombat"
					fireMasterStatus()
					task.wait(0.04)
					continue
				end

				if isBoss1 and inBoss1Arena and arenaCenter and arenaRadius and arenaRadius > 0 then
					targetFacing.SetTargetOverride(nil)
					-- ==============================================================
					-- [BOSS 1]: GIỮ KHOẢNG CÁCH VỚI CHÍNH TRUNG TÂM SÀN ĐẤU (ARENA CENTER ANCHORING)
					-- Tuyệt đối không giữ khoảng cách đối với Boss 1 (tránh bị kéo/lùa ra mép sàn khi Boss nhảy).
					-- Giữ khoảng cách chuẩn R (hoặc giới hạn an toàn trong sàn) so với arenaCenter.
					-- Ưu tiên chọn vị trí đứng ở phía đối diện của Boss 1 qua tâm sàn đấu.
					-- ==============================================================
					local holdCenterDist = math.clamp(r, 6.0, math.max(6.0, arenaRadius - 6.0))
					local pDistToCenter = (Vector3.new(pPos.X - arenaCenter.X, 0, pPos.Z - arenaCenter.Z)).Magnitude

					-- Xác định hướng lý tưởng từ arenaCenter:
					-- Nếu Boss 1 ở lệch tâm -> Hướng đối diện Boss 1 (arenaCenter nằm giữa Player và Boss)
					-- Nếu Boss 1 ở ngay tâm hoặc không rõ -> Giữ nguyên góc hiện tại của Player so với tâm sàn
					local bVecFromCenter = nPos and Vector3.new(nPos.X - arenaCenter.X, 0, nPos.Z - arenaCenter.Z) or Vector3.new(0, 0, 0)
					local idealAngle
					if bVecFromCenter.Magnitude >= 2.0 then
						idealAngle = math.atan2(-bVecFromCenter.Z, -bVecFromCenter.X)
					else
						local pVecFromCenter = Vector3.new(pPos.X - arenaCenter.X, 0, pPos.Z - arenaCenter.Z)
						idealAngle = (pVecFromCenter.Magnitude > 0.5) and math.atan2(pVecFromCenter.Z, pVecFromCenter.X) or 0
					end

					-- Kiểm tra cự ly chuẩn với arenaCenter (sai số ±2.5 studs)
					local distError = math.abs(pDistToCenter - holdCenterDist)
					local isSafeHere = isSafeSpot(pPos)
					local bossTooClose = (nDist and nPos) and (nDist < 8.0)

					-- Nếu đang ở cự ly chuẩn so với trung tâm sàn, vị trí an toàn và Boss không áp sát
					if distError <= 2.5 and isSafeHere and not bossTooClose then
						masterState = performCombatMicroStrafe(arenaCenter, holdCenterDist, "HoldingRadius")
					else
						-- Cần di chuyển tới điểm tối ưu trên vòng bán kính holdCenterDist xung quanh arenaCenter
						local candidateAngles = {
							idealAngle,
							idealAngle + math.rad(20),
							idealAngle - math.rad(20),
							idealAngle + math.rad(40),
							idealAngle - math.rad(40),
							idealAngle + math.rad(65),
							idealAngle - math.rad(65),
							idealAngle + math.rad(90),
							idealAngle - math.rad(90),
							idealAngle + math.rad(120),
							idealAngle - math.rad(120),
							idealAngle + math.pi,
						}

						local curPlayerAngle = math.atan2(pPos.Z - arenaCenter.Z, pPos.X - arenaCenter.X)
						table.insert(candidateAngles, curPlayerAngle)
						table.insert(candidateAngles, curPlayerAngle + math.rad(25))
						table.insert(candidateAngles, curPlayerAngle - math.rad(25))

						local bestSafePos = nil
						local bestScore = -math.huge

						for _, angle in ipairs(candidateAngles) do
							local testPos = arenaCenter + Vector3.new(math.cos(angle), 0, math.sin(angle)) * holdCenterDist
							local safe, safePos = isSafeSpot(testPos)
							if safe and safePos then
								local distToPlayer = (Vector3.new(safePos.X - pPos.X, 0, safePos.Z - pPos.Z)).Magnitude
								local angleDiff = math.abs(math.atan2(math.sin(angle - idealAngle), math.cos(angle - idealAngle)))
								local distToBoss = nPos and (Vector3.new(safePos.X - nPos.X, 0, safePos.Z - nPos.Z)).Magnitude or 25.0
								local candDistToCenter = (Vector3.new(safePos.X - arenaCenter.X, 0, safePos.Z - arenaCenter.Z)).Magnitude

								-- Chấm điểm:
								-- 1. Chuẩn khoảng cách holdCenterDist tới tâm sàn
								local score = - (math.abs(candDistToCenter - holdCenterDist) * 3.0)
								-- 2. Ưu tiên hướng đối diện Boss
								score = score - (angleDiff * 8.0)
								-- 3. Ưu tiên điểm gần người chơi để di chuyển mượt mà
								score = score - (distToPlayer * 1.0)
								-- 4. Phạt nặng nếu điểm quá gần Boss (< 8.5 studs)
								if distToBoss < 8.5 then
									score = score - (8.5 - distToBoss) * 20.0
								else
									score = score + math.min(distToBoss, 30.0) * 0.5
								end

								if score > bestScore then
									bestScore = score
									bestSafePos = safePos
								end
							end
						end

						local hum = char and char:FindFirstChildOfClass("Humanoid")
						if bestSafePos and hum then
							hum:MoveTo(bestSafePos)
							masterState = "HoldingRadius"
						elseif hum then
							local safeCenter, safeCenterPos = isSafeSpot(arenaCenter)
							if safeCenter and safeCenterPos then
								hum:MoveTo(safeCenterPos)
							else
								pcall(function() hum:MoveTo(pPos) end)
							end
							masterState = "HoldingRadius"
						end
					end
				elseif isBossTarget then
					targetFacing.SetTargetOverride(nil)
					-- ==============================================================
					-- [BOSS KHÁC]: GIỮ BÁN KÍNH CHIẾN ĐẤU R + KITING HƯỚNG TÂM SÀN ĐẤU (INWARD CENTERING)
					-- Khi Boss nhảy lệch khỏi tâm sàn đấu ra mép, nhân vật xoay/tạt sườn
					-- hướng về phía tâm sàn đấu (đứng giữa Boss và Tâm) để giữ cự ly R (14-15 studs)
					-- mà TUYỆT ĐỐI không bị chạy/đẩy ra ngoài mép sàn!
					-- ==============================================================
					local holdDist = r - 1.0 -- Cự ly an toàn chuẩn (~14.0 studs)
					local isTooClose = nDist and nPos and pPos and (nDist < (r - 2.5))

					-- Edge Reposition Guard: Nếu Player đang đứng sát rìa mép sàn (> arenaRadius - 4.5)
					local isNearArenaEdge = false
					if isBoss1 and arenaCenter and arenaRadius and arenaRadius > 0 and pPos then
						local pDistToCenter = (Vector3.new(pPos.X - arenaCenter.X, 0, pPos.Z - arenaCenter.Z)).Magnitude
						if pDistToCenter > (arenaRadius - 4.5) then
							isNearArenaEdge = true
						end
					end

					if isTooClose or isNearArenaEdge then
						local awayVec = Vector3.new(pPos.X - nPos.X, 0, pPos.Z - nPos.Z)
						local awayDir = (awayVec.Magnitude > 0.1) and awayVec.Unit or Vector3.new(0, 0, 1)

						-- Xác định hướng hướng về tâm sàn đấu (Inward Direction)
						local inwardDir = awayDir
						local hasInward = false
						if isBoss1 and arenaCenter and nPos then
							local vecToCenter = Vector3.new(arenaCenter.X - nPos.X, 0, arenaCenter.Z - nPos.Z)
							if vecToCenter.Magnitude > 3.0 then
								inwardDir = vecToCenter.Unit
								hasInward = true
							end
						end

						-- Danh sách các hướng ứng viên xung quanh Boss ở cự ly holdDist (14.0 studs)
						local candidateAngles = {}
						if hasInward then
							-- Boss ở lệch tâm sàn đấu: Ưu tiên góc hướng về tâm sàn đấu (đứng giữa Boss và Tâm sàn)
							local baseAngle = math.atan2(inwardDir.Z, inwardDir.X)
							table.insert(candidateAngles, baseAngle)
							table.insert(candidateAngles, baseAngle + math.rad(25))
							table.insert(candidateAngles, baseAngle - math.rad(25))
							table.insert(candidateAngles, baseAngle + math.rad(50))
							table.insert(candidateAngles, baseAngle - math.rad(50))
							table.insert(candidateAngles, baseAngle + math.rad(75))
							table.insert(candidateAngles, baseAngle - math.rad(75))
							-- Thêm góc lùi hiện tại của Player
							local curAwayAngle = math.atan2(awayDir.Z, awayDir.X)
							table.insert(candidateAngles, curAwayAngle)
						else
							-- Boss ở ngay tâm sàn hoặc không có arena: Lùi thẳng và chếch +-40 độ
							local curAwayAngle = math.atan2(awayDir.Z, awayDir.X)
							table.insert(candidateAngles, curAwayAngle)
							table.insert(candidateAngles, curAwayAngle + math.rad(40))
							table.insert(candidateAngles, curAwayAngle - math.rad(40))
							table.insert(candidateAngles, curAwayAngle + math.rad(70))
							table.insert(candidateAngles, curAwayAngle - math.rad(70))
						end

						-- Chấm điểm các điểm ứng viên an toàn
						local bestSafePos = nil
						local bestScore = -math.huge

						for _, angle in ipairs(candidateAngles) do
							local testPos = nPos + Vector3.new(math.cos(angle), 0, math.sin(angle)) * holdDist
							local safe, safePos = isSafeSpot(testPos)
							if safe and safePos then
								local distToPlayer = (Vector3.new(safePos.X - pPos.X, 0, safePos.Z - pPos.Z)).Magnitude
								local distToCenter = 0
								if arenaCenter then
									distToCenter = (Vector3.new(safePos.X - arenaCenter.X, 0, safePos.Z - arenaCenter.Z)).Magnitude
								end

								-- Tiêu chí chấm điểm:
								-- 1. Ưu tiên điểm nằm càng sâu trong lòng sàn đấu (càng gần tâm arenaCenter)
								-- 2. Ưu tiên điểm gần người chơi hơn để di chuyển mượt mà
								local score = - (distToCenter * 2.5) - distToPlayer
								if score > bestScore then
									bestScore = score
									bestSafePos = safePos
								end
							end
						end

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
						-- Đang ở cự ly an toàn chuẩn trong vòng R và an toàn bên trong sàn -> Micro-strafe xả skill!
						masterState = performCombatMicroStrafe(nPos, holdDist, "InCombat")
					end
				else
					-- ==============================================================
					-- [MOBS THƯỜNG]: CHĂN BẦY / GOM QUÁI (HERDING & GROUPING)
					-- 1. Neo góc nhìn và điểm nhắm vào TRỌNG TÂM CỤM QUÁI (Cluster Centroid)
					-- 2. Di chuyển theo quỹ đạo xoay tròn (Orbit) quanh Cluster Centroid ở cự ly r
					--    để ép tất cả quái phải quay đầu hội tụ vào tâm vòng tròn (Funnel Effect).
					-- ==============================================================
					local packCenter = clusterCentroid or nPos
					if packCenter then
						targetFacing.SetTargetOverride(packCenter)
					else
						targetFacing.SetTargetOverride(nil)
					end

					-- Đo cự ly từ Player tới tâm bầy quái và tới quái gần nhất
					local packDiff = packCenter and Vector3.new(pPos.X - packCenter.X, 0, pPos.Z - packCenter.Z) or Vector3.new(0, 0, 1)
					local distToPack = packDiff.Magnitude
					local nearestD = nDist or distToPack

					-- Bán kính orbit mong muốn:
					-- Nếu bầy quái có độ tản mác (spread), tính thêm độ lệch giữa con gần nhất và tâm bầy
					-- để đảm bảo con quái gần nhất không bao giờ áp sát dưới (r - 1.5)
					local packSpread = (packCenter and nPos) and (Vector3.new(packCenter.X - nPos.X, 0, packCenter.Z - nPos.Z)).Magnitude or 0
					local orbitDist = math.clamp(r + (packSpread * 0.65), r - 1.0, r + 8.0)

					-- Điều kiện kích hoạt orbit gom quái:
					-- 1. Có quái quá gần (< r - 1.0)
					-- 2. Đang ở trong tầm chiến đấu và có từ 2 quái trở lên cần gom cụm
					local isTooClose = nearestD < (r - 1.0)
					local shouldGroupHerd = (clusterCount and clusterCount > 1) and (distToPack <= (orbitDist + 4.0))

					if (isTooClose or shouldGroupHerd) and packCenter then
						local curAngle = (distToPack > 0.1) and math.atan2(packDiff.Z, packDiff.X) or 0
						local orbitAngleStep = math.rad(24) -- Bước xoay góc ~24 độ (~6.0 studs trên đường tròn)

						-- 1. Thử hướng orbit hiện tại quanh packCenter
						local targetAngle = curAngle + (orbitDirection * orbitAngleStep)
						local orbitCandidate = packCenter + Vector3.new(math.cos(targetAngle), 0, math.sin(targetAngle)) * orbitDist

						local safe, safePos = isSafeSpot(orbitCandidate)
						if not safe then
							-- Bị tường/hazard cản theo hướng hiện tại -> Đảo chiều orbit ngược lại
							orbitDirection = -orbitDirection
							local altAngle = curAngle + (orbitDirection * orbitAngleStep)
							local altCandidate = packCenter + Vector3.new(math.cos(altAngle), 0, math.sin(altAngle)) * orbitDist
							safe, safePos = isSafeSpot(altCandidate)
						end

						-- 2. Nếu cả 2 chiều orbit đều bị kẹt (ví dụ hành lang quá hẹp), fallback lùi thẳng xa khỏi packCenter
						if not safe then
							local awayDir = (distToPack > 0.1) and packDiff.Unit or Vector3.new(0, 0, 1)
							safe, safePos = isSafeSpot(packCenter + awayDir * orbitDist)
						end

						if safe and safePos then
							local hum = char and char:FindFirstChildOfClass("Humanoid")
							if hum then
								hum:MoveTo(safePos)
							end
							masterState = "Orbiting"
						else
							masterState = performCombatMicroStrafe(packCenter or nPos, orbitDist, "InCombat")
						end
					else
						-- Bầy quái ở cự ly an toàn ngoài mép R -> Micro-strafe xả skill thẳng vào tâm cụm quái
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
					isJustDodged = (os.clock() - lastDodgeTimestamp < 0.6) and (smartDodge.GetHazardCount and smartDodge.GetHazardCount() > 0)
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

				if isPathBlocked or isJustDodged then
					-- Đường đi đang bị chặn bởi chiêu hoặc vừa né xong chiêu chưa tan!
					-- Tạm dừng AutoFarm, giữ nguyên vị trí an toàn, khóa mặt vào quái
					if not autoFarm.IsPaused() then
						autoFarm.SetPaused(true)
					end
					local hum = char and char:FindFirstChildOfClass("Humanoid")
					if hum then
						pcall(function() hum:MoveTo(pPos) end)
					end
					targetFacing.SetEnabled(true)
					masterState = "WaitingHazard"
					currentHazardName = blockingHazardName or "Active Hazard"
				else
					-- Đường đi an toàn -> Mở đường cho AutoFarm tiếp cận mục tiêu
					targetFacing.SetTargetOverride(nil)
					targetFacing.SetEnabled(false)

					-- Luôn duy trì reachDistance chuẩn bằng radius R (15.0 studs), TUYỆT ĐỐI không ép về 2.5 studs!
					if autoFarm.GetReachDistance and autoFarm.SetReachDistance then
						if math.abs(autoFarm.GetReachDistance() - r) > 0.5 then
							autoFarm.SetReachDistance(r)
						end
					end

					if not autoFarm.IsEnabled() then
						autoFarm.SetPaused(false)
						autoFarm.Toggle(true, true)
					else
						autoFarm.SetPaused(false)
					end

					masterState = "Approaching"
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

	wasInDanger = false
	waitingHazardStartTime = 0
	if repositionTarget then
		repositionTarget = nil
	end
	openSpace.ClearVisualMarker()
	orbitDirection = 1

	-- Dừng các hệ thống con
	autoFarm.SetPaused(false)
	if autoFarm.IsEnabled() then
		autoFarm.Toggle(false)
	end
	autoSkill.SetEnabled(false)
	targetFacing.SetTargetOverride(nil)
	targetFacing.SetEnabled(false)
	smartDodge.StopEngine()

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

		-- Kích hoạt Smart Dodge ngầm (sẵn sàng né frame-0)
		smartDodge.StartEngine()
		smartDodge.SetAutoDodge(true)

		-- Kích hoạt Auto Skill (nếu được bật)
		if smartAutoSkillEnabled then
			autoSkill.SetEnabled(true)
		else
			autoSkill.SetEnabled(false)
		end

		-- Kích hoạt AutoFarm dẫn đường với bán kính dừng R
		if autoFarm.GetReachDistance and autoFarm.SetReachDistance then
			autoFarm.SetReachDistance(radius)
		end
		autoFarm.SetPaused(false)
		autoFarm.Toggle(true, true)

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
	if masterEnabled then
		autoSkill.SetEnabled(smartAutoSkillEnabled)
	else
		autoSkill.SetEnabled(false)
	end
	fireMasterStatus()
end

function smartAutoPlay.IsAutoSkillEnabled()
	return smartAutoSkillEnabled
end

--// Open Space Reposition API
function smartAutoPlay.SetOpenSpaceEnabled(state)
	openSpace.SetEnabled(state)
	if not state and repositionTarget then
		repositionTarget = nil
		openSpace.ClearVisualMarker()
	end
	fireMasterStatus()
end

function smartAutoPlay.IsOpenSpaceEnabled()
	return openSpace.IsEnabled()
end

function smartAutoPlay.SetRepositionRadiusMultiplier(val)
	openSpace.SetRadiusMultiplier(val)
end

function smartAutoPlay.GetRepositionRadiusMultiplier()
	return openSpace.GetRadiusMultiplier()
end

function smartAutoPlay.GetMasterStatus()
	return {
		enabled = masterEnabled,
		state = masterState,
		autoSkillEnabled = smartAutoSkillEnabled,
		openSpaceEnabled = openSpace.IsEnabled(),
		repositionDist = repositionTarget and currentEscapeDist or nil,
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
	}
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
		skillRange = math.clamp(val, 4.0, 100.0)
	end
end

function smartAutoPlay.GetSkillRange()
	return skillRange
end

function smartAutoPlay.GetEffectiveSkillRange()
	return math.max(skillRange, getCurrentTargetRadius(currentTargetName))
end

function smartAutoPlay.SetSphereSize(val)
	if type(val) == "number" and val > 0 then
		sphereSize = math.clamp(val, 0.1, 3.0)
		skillSphereSize = sphereSize * 0.8
		for _, p in ipairs(sphereParts) do
			p.Size = Vector3.new(sphereSize, sphereSize, sphereSize)
		end
		for _, p in ipairs(skillSphereParts) do
			p.Size = Vector3.new(skillSphereSize, skillSphereSize, skillSphereSize)
		end
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

--// Đăng ký Coordinator để hệ thống khác (hoặc phím tắt) có thể tắt Smart Auto Play
coordinator.Register("SmartAutoPlay", smartAutoPlay.SetMasterEnabled, smartAutoPlay.IsMasterEnabled)

--// Tự động tiếp tục hoạt động khi respawn hoặc chuyển map
shared.OnRespawn(function()
	if masterEnabled then
		task.delay(0.5, function()
			if not masterEnabled then return end
			smartDodge.StartEngine()
			smartDodge.SetAutoDodge(true)
			if smartAutoSkillEnabled then
				autoSkill.SetEnabled(true)
			end
			if autoFarm.GetReachDistance and autoFarm.SetReachDistance then
				autoFarm.SetReachDistance(radius)
			end
			autoFarm.SetPaused(false)
			if not autoFarm.IsEnabled() then
				autoFarm.Toggle(true, true)
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

return smartAutoPlay
