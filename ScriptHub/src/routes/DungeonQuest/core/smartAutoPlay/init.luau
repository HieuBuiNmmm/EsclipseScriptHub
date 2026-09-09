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

local RunService = services.RunService
local player = services.player

local smartAutoPlay = {}

--// Settings & State
local masterEnabled = false
local masterLoopThread = nil
local masterState = "Disabled" -- "Disabled" | "Dodging" | "InCombat" | "Approaching" | "WaitingHazard" | "RoomCleared" | "Dead"
local currentHazardName = nil
local currentEscapeDist = 0
local currentTargetName = nil
local currentTargetDist = nil
local masterStatusListeners = {}
local lastDodgeTimestamp = 0

local smartAutoSkillEnabled = true
local showRadiusCircle = false
local radius = 15.0 -- Combat Radius R in studs
local SPHERE_COUNT = 36 -- 36 spheres = 1 sphere every 10 degrees
local sphereSize = 0.35 -- Diameter of each sphere in studs
local SPHERE_COLOR = Color3.fromRGB(0, 225, 255) -- Vibrant Neon Cyan
local HYSTERESIS_BUFFER = 2.0 -- Đệm chống rung giật mép vòng tròn (studs)

local sphereParts = {}
local visualFolder = nil
local updateConnection = nil

-- Kết nối hàm lấy bán kính R cho autoSkill
local function getRadius()
	return smartAutoPlay.GetRadius()
end
autoSkill.BindRadiusGetter(getRadius)

smartAutoPlay.autoSkill = autoSkill
smartAutoPlay.autoApproach = autoApproach
smartAutoPlay.smartDodge = smartDodge
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

local function hideSpheres()
	for _, p in ipairs(sphereParts) do
		p.Transparency = 1
	end
end

local function updateCirclePositions()
	if not showRadiusCircle then
		hideSpheres()
		return
	end

	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not root or not root.Parent then
		hideSpheres()
		return
	end

	updateRayFilter()
	local spheres = getOrCreateSpheres()
	local pPos = root.Position
	local angleStep = (2 * math.pi) / SPHERE_COUNT

	-- Single locked Y level beneath player for all spheres
	local floorHit = workspace:Raycast(pPos, Vector3.new(0, -12.0, 0), floorRayParams)
	local lockedY = floorHit and (floorHit.Position.Y + (sphereSize / 2)) or (pPos.Y - 2.8)

	for i = 1, SPHERE_COUNT do
		local angle = (i - 1) * angleStep
		local targetX = pPos.X + math.cos(angle) * radius
		local targetZ = pPos.Z + math.sin(angle) * radius

		local part = spheres[i]
		if part and part.Parent then
			part.Position = Vector3.new(targetX, lockedY, targetZ)
			part.Transparency = 0.2
			part.Color = SPHERE_COLOR
		end
	end
end

local function startVisualLoop()
	if updateConnection then return end
	updateConnection = RunService.RenderStepped:Connect(function()
		pcall(updateCirclePositions)
	end)
end

local function stopVisualLoop()
	if updateConnection then
		updateConnection:Disconnect()
		updateConnection = nil
	end
	hideSpheres()
end

--// Enemy Evaluation (Flat Distance X/Z - Bỏ qua trục Y)
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

	for _, data in ipairs(tracked) do
		if data and data.Root and data.Root.Parent then
			local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
			if hum and hum.Health > 0 then
				totalAlive = totalAlive + 1
				local dx = data.Root.Position.X - pPos.X
				local dz = data.Root.Position.Z - pPos.Z
				local flatDist = math.sqrt(dx * dx + dz * dz)

				if flatDist < nearestDist then
					nearestDist = flatDist
					nearestName = (data.Model and data.Model.Name) or "Enemy"
					nearestPos = data.Root.Position
				end

				if flatDist <= checkRadius then
					hasEnemyInRadius = true
				end
			end
		end
	end

	-- Kiểm tra thêm target hiện tại của AutoFarm nếu có
	local afTarget = tracker.GetTarget()
	if afTarget and afTarget.Root and afTarget.Root.Parent then
		local hum = afTarget.Humanoid or (afTarget.Model and afTarget.Model:FindFirstChildOfClass("Humanoid"))
		if hum and hum.Health > 0 then
			local dx = afTarget.Root.Position.X - pPos.X
			local dz = afTarget.Root.Position.Z - pPos.Z
			local flatDist = math.sqrt(dx * dx + dz * dz)
			if flatDist <= checkRadius then
				hasEnemyInRadius = true
			end
			if flatDist < nearestDist then
				nearestDist = flatDist
				nearestName = (afTarget.Model and afTarget.Model.Name) or "Target"
				nearestPos = afTarget.Root.Position
			end
		end
	end

	return hasEnemyInRadius, totalAlive, nearestName, (nearestDist < math.huge and nearestDist or nil), nearestPos
end


--// Kiểm tra xem đường đi từ người chơi đến mục tiêu có bị chiêu/hazard nào của quái cản đường không
local function isApproachPathBlockedByHazard(pPos, targetPos, maxCheckDist)
	if not targetPos then return false end
	if smartDodge.GetHazardCount and smartDodge.GetHazardCount() == 0 then
		return false
	end

	local diff = targetPos - pPos
	local flatDiff = Vector3.new(diff.X, 0, diff.Z)
	local dist = flatDiff.Magnitude
	if dist < 0.5 then return false end

	local dir = flatDiff.Unit
	local checkLimit = math.min(dist, maxCheckDist or 35.0)

	-- Lấy mẫu các điểm cách nhau 2.5 studs trên đường chạy đến quái
	for d = 2.0, checkLimit, 2.5 do
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
		return fp.Position, math.max(20, r - 2.5)
	end
	return nil, nil
end

local function isPlayerInsideBoss1Arena(pPos)
	if not pPos then return true end
	local center, arenaRadius = getBoss1ArenaInfo()
	if not center or not arenaRadius then return true end

	local dist2D = (Vector3.new(pPos.X - center.X, 0, pPos.Z - center.Z)).Magnitude
	return dist2D <= (arenaRadius - 1.5)
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
				fireMasterStatus()
				task.wait(0.2)
				continue
			end

			-- 1. Ưu tiên 1: NGUY HIỂM (DODGE MODE)
			local inDanger = (smartDodge.IsInDanger and smartDodge.IsInDanger())
				or (smartDodge.IsDodging and smartDodge.IsDodging())

			if inDanger then
				lastDodgeTimestamp = os.clock()
				-- Tạm dừng AutoFarm để nhường toàn quyền di chuyển cho Smart Dodge!
				if not autoFarm.IsPaused() then
					autoFarm.SetPaused(true)
				end

				local _, _, hazardName, escapeDist = smartDodge.GetCurrentSafeSpot()
				masterState = "Dodging"
				currentHazardName = hazardName or "Hazard"
				currentEscapeDist = escapeDist or 0

				fireMasterStatus()
				task.wait(0.04)
				continue
			end

			-- 2. Đánh giá quái xung quanh theo Combat Radius R
			local r = radius
			-- Khi đang ở InCombat, mở rộng thêm HYSTERESIS_BUFFER để tránh rung bật/tắt ở mép
			local checkR = (masterState == "InCombat") and (r + HYSTERESIS_BUFFER) or r
			local hasEnemyInRadius, totalAlive, nName, nDist, nPos = evaluateEnemies(checkR)

			currentTargetName = nName
			currentTargetDist = nDist
			currentHazardName = nil
			currentEscapeDist = 0

			-- Ràng buộc nghiêm ngặt Sàn Đấu Boss 1:
			-- Player BẮT BUỘC phải đứng bên trong sàn đấu của Boss 1 (FirstPart)
			local char = player and player.Character
			local root = char and char:FindFirstChild("HumanoidRootPart")
			local pPos = root and root.Position
			local isBossActive = shared.IsBossActive()
			local bossIdx = shared.GetCurrentBossIndex()
			local isBoss1 = isBossActive and (bossIdx <= 1) and (getFirstBossArenaPart() ~= nil)
			local inBoss1Arena = not isBoss1 or isPlayerInsideBoss1Arena(pPos)

			if isBoss1 and not inBoss1Arena then
				-- Người chơi đang đứng ngoài sàn đấu Boss 1 (ví dụ trên lối vào / bậc thềm cao)
				-- Cưỡng chế hasEnemyInRadius = false để bán kính R KHÔNG làm nhân vật dừng lại bên ngoài!
				hasEnemyInRadius = false
			end

			if totalAlive == 0 then
				-- Ưu tiên 4: Toàn bộ quái đã chết (Đã dọn phòng)
				if not autoFarm.IsPaused() then
					autoFarm.SetPaused(true)
				end
				targetFacing.SetEnabled(false)
				masterState = "RoomCleared"
			elseif hasEnemyInRadius then
				-- Ưu tiên 2: CÓ QUÁI TRONG TẦM BÁN KÍNH R -> IN COMBAT!
				-- Tạm dừng bước chân AutoFarm để giữ cự ly chiến đấu (chỉ pause khi chưa pause)
				if not autoFarm.IsPaused() then
					autoFarm.SetPaused(true)
				end

				-- Khôi phục reachDistance chuẩn cho AutoFarm
				if autoFarm.GetReachDistance and autoFarm.SetReachDistance then
					if math.abs(autoFarm.GetReachDistance() - r) > 0.5 then
						autoFarm.SetReachDistance(r)
					end
				end

				-- Tự động khóa mặt vào quái khi trong tầm chiến đấu
				targetFacing.SetEnabled(true)

				masterState = "InCombat"
			else
				-- Ưu tiên 3: QUÁI Ở XA NGOÀI R -> AUTO APPROACH!

				-- KIỂM TRA ĐẶC BIỆT: Đường tiếp cận quái có đang bị chiêu/vùng nguy hiểm chặn không?
				local isPathBlocked, blockingHazardName = isApproachPathBlockedByHazard(pPos, nPos, 35.0)
				local isJustDodged = (os.clock() - lastDodgeTimestamp < 0.6) and (smartDodge.GetHazardCount and smartDodge.GetHazardCount() > 0)

				if isPathBlocked or isJustDodged then
					-- Đường đi đang bị chặn bởi chiêu hoặc vừa né xong chiêu chưa tan!
					-- Tạm dừng AutoFarm, giữ nguyên vị trí an toàn, khóa mặt vào quái
					if not autoFarm.IsPaused() then
						autoFarm.SetPaused(true)
					end
					targetFacing.SetEnabled(true)
					masterState = "WaitingHazard"
					currentHazardName = blockingHazardName or "Active Hazard"
				else
					-- Đường đi an toàn -> Mở đường cho AutoFarm tiếp cận mục tiêu
					targetFacing.SetEnabled(false)

					-- Nếu đang ở Boss 1 và chưa vào trong sàn đấu: Đặt reachDistance thật ngắn (2.5 studs)
					-- để AutoFarm dẫn đường chạy thẳng vào trong sàn đấu chứ không dừng lại ở mép ngoài!
					local effectiveReach = (isBoss1 and not inBoss1Arena) and 2.5 or r
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

					if isBoss1 and not inBoss1Arena then
						masterState = "EnteringArena"
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

	-- Dừng các hệ thống con
	autoFarm.SetPaused(false)
	if autoFarm.IsEnabled() then
		autoFarm.Toggle(false)
	end
	autoSkill.SetEnabled(false)
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

function smartAutoPlay.GetMasterStatus()
	return {
		enabled = masterEnabled,
		state = masterState,
		autoSkillEnabled = smartAutoSkillEnabled,
		hazardName = currentHazardName,
		escapeDist = currentEscapeDist,
		targetName = currentTargetName,
		targetDist = currentTargetDist,
		radius = radius,
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
	if showRadiusCircle then
		startVisualLoop()
	else
		stopVisualLoop()
	end
end

function smartAutoPlay.IsShowRadiusCircleEnabled()
	return showRadiusCircle
end

function smartAutoPlay.SetRadius(val)
	if type(val) == "number" and val > 0 then
		radius = math.clamp(val, 2.0, 100.0)
	end
end

function smartAutoPlay.GetRadius()
	return radius
end

function smartAutoPlay.SetSphereSize(val)
	if type(val) == "number" and val > 0 then
		sphereSize = math.clamp(val, 0.1, 3.0)
		for _, p in ipairs(sphereParts) do
			p.Size = Vector3.new(sphereSize, sphereSize, sphereSize)
		end
	end
end

function smartAutoPlay.GetSphereSize()
	return sphereSize
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
	for _, p in ipairs(sphereParts) do
		pcall(function() p:Destroy() end)
	end
	table.clear(sphereParts)
	if visualFolder then
		pcall(function() visualFolder:Destroy() end)
		visualFolder = nil
	end
end)

return smartAutoPlay
