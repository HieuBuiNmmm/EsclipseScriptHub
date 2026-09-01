-- AutoFarm Pathfinder (v2): dùng PathfindingService của Roblox để di chuyển.
-- Hai luồng chạy song song:
--  * Pathfinding Move: giữ khoảng cách an toàn (standDistance) với kẻ địch gần nhất.
--  * Auto Skill: tự spam Q+E khi kẻ địch gần nhất nằm trong tầm skillRange.
-- Visual debug (ô đỏ tại điểm tới + highlight kẻ gần nhất) nằm ngay trong tab này.
-- Tách biệt hoàn toàn với AutoFarm v1 (orbit).

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")

--// References
local RunService = services.RunService
local VirtualInputManager = services.VirtualInputManager
local player = services.player
local PathfindingService = game:GetService("PathfindingService")

--// Table
local autoFarmPathfinder = {}

--// Configuration (state)
local enabled = false
local running = false
local standDistance = 15
local skillRange = 15
local moveSpeed = 50
local repathInterval = 0.75
local skillEnabled = true
local skillInterval = 2.0
local visualDebug = true

--// Runtime
local moveConnection = nil
local skillConnection = nil
local repathTimer = 0
local lastSkillTime = 0
local dunReady = false
local currentPath = nil
local waypointIndex = 1
local pathComputed = false
local standTarget = nil
local autoRotateOwner = false
local autoRotateHumanoid = nil
local oldAutoRotate = nil
local debugTargetPart = nil
local debugEnemyHighlight = nil
local debugEnemyModel = nil

--// Helpers
local function getPlayerRoot()
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if root and root.Parent then return root end
	return nil
end

--// Lấy kẻ địch gần nhất theo khoảng cách tới player.
local function getNearestEnemy()
	local playerRoot = getPlayerRoot()
	if not playerRoot then return nil end
	local nearest = nil
	local nearestDist = math.huge
	for _, data in ipairs(shared.GetTrackedEnemyData()) do
		if data and data.Root and data.Root.Parent then
			local dist = (data.Root.Position - playerRoot.Position).Magnitude
			if dist < nearestDist then
				nearestDist = dist
				nearest = data
			end
		end
	end
	return nearest
end

--// Vị trí đứng ổn định: phía người chơi hiện tại, cách vị trí kẻ địch một khoảng x.
local function computeStandPosition(enemyRoot, playerRoot)
	if not enemyRoot or not playerRoot then return nil end
	local toPlayer = Vector3.new(playerRoot.Position.X - enemyRoot.Position.X, 0, playerRoot.Position.Z - enemyRoot.Position.Z)
	local dir = toPlayer.Magnitude > 0.01 and toPlayer.Unit or Vector3.new(1, 0, 0)
	return Vector3.new(enemyRoot.Position.X + dir.X * standDistance, playerRoot.Position.Y, enemyRoot.Position.Z + dir.Z * standDistance)
end

--// Tính path bằng PathfindingService từ vị trí player tới vị trí đứng mục tiêu.
local function computePath()
	local playerRoot = getPlayerRoot()
	if not playerRoot then return end
	local enemy = getNearestEnemy()
	if not enemy or not enemy.Root or not enemy.Root.Parent then
		currentPath = nil
		pathComputed = false
		return
	end
	local target = computeStandPosition(enemy.Root, playerRoot)
	if not target then return end

	standTarget = target
	local start = playerRoot.Position

	--// Dọn path cũ trước khi tạo path mới
	if currentPath then pcall(function() currentPath:Destroy() end) end

	local path = PathfindingService:CreatePath({
		AgentRadius = 2,
		AgentHeight = 5,
		AgentCanJump = true,
		AgentCanClimb = false,
		AgentMaxSlope = 45,
		WaypointSpacing = 3,
		Costs = {},
	})

	local ok = pcall(function()
		path:ComputeAsync(start, target)
	end)
	if not ok then
		path:Destroy()
		currentPath = nil
		pathComputed = false
		return
	end

	path.Blocked:Connect(function()
		currentPath = nil
		pathComputed = false
		repathTimer = 0
	end)

	currentPath = path
	waypointIndex = 1
	local waypoints = path:GetWaypoints()
	pathComputed = path.Status == Enum.PathStatus.Success and #waypoints > 0
	if not pathComputed then
		path:Destroy()
		currentPath = nil
	end
end

--// Bắn combo Q+E (giống Auto Skill).
local function fireSkills()
	if not skillEnabled then return end
	if os.clock() - lastSkillTime < skillInterval then return end
	local humanoid = shared.GetHumanoid()
	if not humanoid or not humanoid.Parent or humanoid.Health <= 0 then return end
	if shared.IsInLobby() then return end
	lastSkillTime = os.clock()
	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
	task.delay(shared.GetKeyHoldTime(), function()
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
	end)
end

--// Luồng Auto Skill: chỉ spam skill khi kẻ địch gần nhất trong tầm skillRange.
local function skillLoop()
	if shared.IsInLobby() then return end
	if not dunReady then return end
	local playerRoot = getPlayerRoot()
	if not playerRoot then return end
	local enemy = getNearestEnemy()
	if not enemy or not enemy.Root or not enemy.Root.Parent then return end
	--// Khoảng cách cast skill chỉ tính trên mặt phẳng XZ (bỏ độ cao Y)
	local flat = Vector3.new(enemy.Root.Position.X - playerRoot.Position.X, 0, enemy.Root.Position.Z - playerRoot.Position.Z)
	if flat.Magnitude <= skillRange then
		fireSkills()
	end
end

--// Khôi phục AutoRotate lúc tắt luồng hoặc khi đổi nhân vật.
local function restoreAutoRotate()
	if not autoRotateOwner then return end
	local humanoid = autoRotateHumanoid or shared.GetHumanoid()
	if humanoid and humanoid.Parent then humanoid.AutoRotate = oldAutoRotate end
	autoRotateOwner = false
	autoRotateHumanoid = nil
	oldAutoRotate = nil
end

--// Tắt AutoRotate khi có humanoid để không chống đối việc xoay thủ công.
--// Nếu đổi nhân vật (respawn) thì capture lại AutoRotate của nhân vật mới.
local function ensureAutoRotateDisabled()
	local humanoid = shared.GetHumanoid()
	if not humanoid or not humanoid.Parent then return end
	if autoRotateOwner and humanoid == autoRotateHumanoid then return end
	if autoRotateOwner then restoreAutoRotate() end
	oldAutoRotate = humanoid.AutoRotate
	humanoid.AutoRotate = false
	autoRotateHumanoid = humanoid
	autoRotateOwner = true
end

--// Quay mặt về kẻ địch gần nhất (chỉ xoay trên trục Y).
local function faceNearestEnemy()
	local enemy = getNearestEnemy()
	local playerRoot = getPlayerRoot()
	if not enemy or not enemy.Root or not enemy.Root.Parent or not playerRoot then return end
	local flat = Vector3.new(enemy.Root.Position.X - playerRoot.Position.X, 0, enemy.Root.Position.Z - playerRoot.Position.Z)
	if flat.Magnitude < 0.01 then return end
	playerRoot.CFrame = CFrame.lookAt(playerRoot.Position, playerRoot.Position + flat.Unit)
	playerRoot.AssemblyAngularVelocity = Vector3.zero
end

--// ---------- Visual debug ----------

local function ensureDebugTargetPart()
	if debugTargetPart and debugTargetPart.Parent then return debugTargetPart end
	debugTargetPart = Instance.new("Part")
	debugTargetPart.Name = "PathfinderTarget_Debug"
	debugTargetPart.Anchored = true
	debugTargetPart.CanCollide = false
	debugTargetPart.CanQuery = false
	debugTargetPart.CanTouch = false
	debugTargetPart.Size = Vector3.new(2, 2, 2)
	debugTargetPart.Transparency = 0.4
	debugTargetPart.Color = Color3.fromRGB(255, 0, 0)
	debugTargetPart.Material = Enum.Material.Neon
	debugTargetPart.Parent = workspace
	return debugTargetPart
end

--// Cập nhật ô đỏ tại điểm tới + highlight kẻ địch gần nhất.
local function updateDebugVisuals()
	if shared.IsInLobby() then return end
	if not visualDebug then return end

	if standTarget then
		local part = ensureDebugTargetPart()
		part.CFrame = CFrame.new(standTarget)
	elseif debugTargetPart and debugTargetPart.Parent then
		debugTargetPart.CFrame = CFrame.new(0, -1000, 0)
	end

	local enemy = getNearestEnemy()
	local model = enemy and enemy.Model or nil
	if not model or not model.Parent then
		if debugEnemyHighlight then debugEnemyHighlight.Enabled = false end
		return
	end
	if debugEnemyModel ~= model then
		if debugEnemyHighlight then debugEnemyHighlight.Parent = nil end
		debugEnemyHighlight = Instance.new("Highlight")
		debugEnemyHighlight.Name = "PathfinderEnemy_Debug"
		debugEnemyHighlight.FillColor = Color3.fromRGB(255, 200, 0)
		debugEnemyHighlight.FillTransparency = 0.5
		debugEnemyHighlight.OutlineColor = Color3.fromRGB(255, 0, 0)
		debugEnemyHighlight.OutlineTransparency = 0
		debugEnemyHighlight.Parent = model
		debugEnemyModel = model
	end
end

local function cleanupDebugVisuals()
	if debugTargetPart then
		pcall(function() debugTargetPart:Destroy() end)
		debugTargetPart = nil
	end
	if debugEnemyHighlight then
		pcall(function() debugEnemyHighlight:Destroy() end)
		debugEnemyHighlight = nil
	end
	debugEnemyModel = nil
end

--// Di chuyển player dọc theo waypoints của path (giữ khoảng cách an toàn).
local function stepMovement(deltaTime)
	if shared.IsInLobby() then return end
	if not dunReady then return end

	local playerRoot = getPlayerRoot()
	local humanoid = shared.GetHumanoid()
	if not playerRoot or not playerRoot.Parent or not humanoid or not humanoid.Parent or humanoid.Health <= 0 then
		currentPath = nil
		pathComputed = false
		return
	end
	ensureAutoRotateDisabled()
	updateDebugVisuals()

	if not pathComputed or not currentPath then
		--// Đứng gần vị trí mục tiêu → quay mặt về kẻ địch gần nhất
		if standTarget and (Vector3.new(playerRoot.Position.X - standTarget.X, 0, playerRoot.Position.Z - standTarget.Z)).Magnitude <= standDistance + 2 then
			faceNearestEnemy()
		end
		repathTimer += deltaTime
		if repathTimer >= repathInterval then
			repathTimer = 0
			computePath()
		end
		return
	end

	local waypoints = currentPath:GetWaypoints()
	if not waypoints or #waypoints == 0 then
		currentPath = nil
		pathComputed = false
		return
	end
	if waypointIndex > #waypoints then
		pathComputed = false
		return
	end

	local wp = waypoints[waypointIndex]
	local dest = wp.Position
	local pos = playerRoot.Position
	local toDest = dest - pos
	toDest = Vector3.new(toDest.X, 0, toDest.Z)
	local dist = toDest.Magnitude
	local tolerate = (wp.Action == Enum.PathWaypointAction.Jump and 1.2) or 1.5

	if dist <= tolerate then
		waypointIndex += 1
		return
	end

	local step = math.min(dist, moveSpeed * math.max(deltaTime, 1 / 60))
	local nextPos = pos + toDest.Unit * step
	playerRoot.CFrame = CFrame.lookAt(nextPos, pos + toDest.Unit)
	playerRoot.AssemblyLinearVelocity = Vector3.zero
	playerRoot.AssemblyAngularVelocity = Vector3.zero
end

--// ---------- Accessors (tab UI dùng) ----------

function autoFarmPathfinder.IsEnabled()
	return enabled
end

function autoFarmPathfinder.GetStandDistance()
	return standDistance
end

function autoFarmPathfinder.SetStandDistance(value)
	standDistance = tonumber(value) or standDistance
end

function autoFarmPathfinder.GetSkillRange()
	return skillRange
end

function autoFarmPathfinder.SetSkillRange(value)
	skillRange = tonumber(value) or skillRange
end

function autoFarmPathfinder.GetMoveSpeed()
	return moveSpeed
end

function autoFarmPathfinder.SetMoveSpeed(value)
	moveSpeed = tonumber(value) or moveSpeed
end

function autoFarmPathfinder.GetRepathInterval()
	return repathInterval
end

function autoFarmPathfinder.SetRepathInterval(value)
	repathInterval = tonumber(value) or repathInterval
end

function autoFarmPathfinder.IsSkillEnabled()
	return skillEnabled
end

function autoFarmPathfinder.SetSkillEnabled(value)
	skillEnabled = value == true
end

function autoFarmPathfinder.GetSkillInterval()
	return skillInterval
end

function autoFarmPathfinder.SetSkillInterval(value)
	skillInterval = tonumber(value) or skillInterval
end

function autoFarmPathfinder.IsVisualDebugEnabled()
	return visualDebug
end

function autoFarmPathfinder.SetVisualDebug(value)
	visualDebug = value == true
	if not visualDebug then cleanupDebugVisuals() end
end

--// ---------- Methods ----------

function autoFarmPathfinder.Toggle(state)
	if state == enabled then return end
	enabled = state

	if enabled then
		if moveConnection then moveConnection:Disconnect(); moveConnection = nil end
		if skillConnection then skillConnection:Disconnect(); skillConnection = nil end
		running = true
		repathTimer = 0
		lastSkillTime = 0
		--// Khởi tạo tracking enemy trong dungeon (không block luồng chính)
		if not dunReady then
			task.spawn(function()
				if shared.ReadyDungeon() then dunReady = true end
			end)
		end
		moveConnection = RunService.Heartbeat:Connect(function(deltaTime)
			pcall(stepMovement, deltaTime)
		end)
		skillConnection = RunService.Heartbeat:Connect(function(deltaTime)
			pcall(skillLoop, deltaTime)
		end)
	else
		if moveConnection then moveConnection:Disconnect(); moveConnection = nil end
		if skillConnection then skillConnection:Disconnect(); skillConnection = nil end
		running = false
		restoreAutoRotate()
		if currentPath then pcall(function() currentPath:Destroy() end) end
		currentPath = nil
		pathComputed = false
		standTarget = nil
		cleanupDebugVisuals()
	end
end

function autoFarmPathfinder.IsRunning()
	return running
end

return autoFarmPathfinder