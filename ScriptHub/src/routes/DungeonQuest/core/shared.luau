-- Engine dùng chung cho DungeonQuest: quản lý state, tracking dungeon/kẻ địch,
-- speed, skill, và các helper di chuyển farm. Các module chuyên biệt
-- (combat, farm, autoStart...) thao tác lên module này để tránh circular dependency.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local notifier = require("@routes/DungeonQuest/core/notifier")

--// References
local Players = services.Players
local UserInputService = services.UserInputService
local RunService = services.RunService
local VirtualInputManager = services.VirtualInputManager
local player = services.player

--// Constants
local TELEPORT_RADIUS = 12
local HEIGHT_OFFSET = 0
local FREEZE_TIME = 0.15

local ORBIT_RADIUS = 30
local ORBIT_HEIGHT = 12
local ORBIT_SPEED = 180

--// Offset cộng thêm vào orbit height khi ở boss room
local BOSS_HEIGHT_OFFSET = 0

local AUTO_SKILL_INTERVAL = 2.0
local AUTO_KEY_HOLD_TIME = 0.05
local SKILL_RANGE = 60

local FARM_SCAN_INTERVAL = 0.15
local FARM_ENGAGE_DISTANCE = 45
local FARM_APPROACH_SPEED = 90
local FARM_APPROACH_EPSILON = 1.5
local HOVER_HEIGHT = ORBIT_HEIGHT

--// Bật/tắt chế độ blacklist quái khi chọn mục tiêu (true = bật, false = tắt -> chọn mọi quái)
local BLACKLIST_ENABLED = true

--// Folder trong ReplicatedStorage chứa toàn bộ model/projectile của enemy.
--// Dùng chung cho Highlight Hitbox (ESP) và Basic Orbit Dodge.
local PROJECTILE_FOLDER = "enemyProjectiles"

--// Danh sách tên quái KHÔNG được chọn làm mục tiêu (retarget/ban đầu).
--// Chỉnh sửa trực tiếp tại đây.
--// VD: BLACKLIST_ENEMIES = { "Northern Mage", "Northern Spearman" }
local BLACKLIST_ENEMIES = {"Northern Warrior"}

local GUI_UPDATE_INTERVAL = 0.5

--// Table
local shared = {}

--// State
local humanoid = nil

local enabled = false
local fastSpeed = 50
local normalSpeed = 16

local teleporting = false

local dodging = false

local dungeonStartTime = nil

--// Boss state (dựa trên GUI bossHealth xuất hiện khi có boss trong room)
local bossActive = false
local bossCallbacks = {}

--// Lưu trạng thái retarget trước khi vào boss để khôi phục khi rời boss
local retargetSavedDuringBoss = nil

--// Maintain orbit height khi đánh boss: giữ cố định độ cao bằng cách bù offset
--// khi boss hạ thấp vị trí (track pos Y của boss)
local maintainBossHeight = false
local bossStartY = nil

local farmEnabled = false
local farmMode = "Orbit"
local farmTarget = nil
local farmAngle = 0
local farmApproaching = false
local farmOldAutoRotate = true
local farmRunning = false
local farmLastSkillTime = 0

local retargetEnabled = false
local retargetInterval = 5
local retargetMethod = "Auto"
local orbitReverseEnabled = false
local farmOrbitDirection = 1
local basicOrbitDirection = nil
local farmLastRetargetTime = 0
local blacklistEnemies = {}
for _, name in ipairs(BLACKLIST_ENEMIES) do
	if type(name) == "string" and name ~= "" then
		table.insert(blacklistEnemies, name)
	end
end

local autoSkillEnabled = false
local autoSkillRunning = false
local autoSkillMode = "Spam"

local dungeon = nil
local trackedRooms = {}
local trackedEnemies = {}
local roomConnections = {}
local enemyConnections = {}
local pendingModels = {}
local enemyCount = 0

--// Forward declarations
local cleanupEnemies
local getNearestEnemy
local getFarthestEnemy
local initializeRooms
local resetDungeon
local leaveFarmTarget
local moveFarmTarget
local farmTeleportTo
local fireFarmSkills

--// Respawn hooks (các module khác đăng ký để reset trạng thái khi respawn)
local respawnCallbacks = {}

function shared.OnRespawn(callback)
	table.insert(respawnCallbacks, callback)
end

--// Enemy helpers
local function getModelRoot(model)
	if not model or not model:IsA("Model") then return nil end
	local root = model:FindFirstChild("HumanoidRootPart")
	if root and root:IsA("BasePart") then return root end
	if model.PrimaryPart and model.PrimaryPart:IsA("BasePart") then return model.PrimaryPart end
	for _, object in ipairs(model:GetDescendants()) do
		if object:IsA("BasePart") then return object end
	end
	return nil
end

local function isValidEnemy(model)
	if not model or not model:IsA("Model") or not model.Parent or model == player.Character then return false end
	local enemyHumanoid = model:FindFirstChildOfClass("Humanoid")
	if not enemyHumanoid or enemyHumanoid.Health <= 0 then return false end
	return getModelRoot(model) ~= nil
end

local function disconnectEnemyConnections(enemy)
	local connections = enemyConnections[enemy]
	if not connections then return end
	if connections.Died then connections.Died:Disconnect(); connections.Died = nil end
	enemyConnections[enemy] = nil
end

local function untrackEnemy(enemy)
	if not enemy or not trackedEnemies[enemy] then return end
	pendingModels[enemy] = nil
	trackedEnemies[enemy] = nil
	enemyCount -= 1
	disconnectEnemyConnections(enemy)
end

local function trackEnemy(enemy)
	if not isValidEnemy(enemy) or trackedEnemies[enemy] then return end
	local root = getModelRoot(enemy)
	local enemyHumanoid = enemy:FindFirstChildOfClass("Humanoid")
	if not root or not enemyHumanoid then return end

	trackedEnemies[enemy] = { Model = enemy, Root = root, Humanoid = enemyHumanoid }
	enemyCount += 1
	enemyConnections[enemy] = { Died = enemyHumanoid.Died:Connect(function() untrackEnemy(enemy) end) }
end

local function waitAndTrackModel(model)
	if not model then return end
	if isValidEnemy(model) then trackEnemy(model); return end
	if pendingModels[model] then return end
	pendingModels[model] = true
	task.spawn(function()
		local timeout = os.clock() + 3
		while model.Parent and os.clock() < timeout do
			if isValidEnemy(model) then
				pendingModels[model] = nil
				trackEnemy(model)
				return
			end
			task.wait(0.1)
		end
		pendingModels[model] = nil
		if model.Parent and isValidEnemy(model) then trackEnemy(model) end
	end)
end

local function trackRoom(room)
	if not room or trackedRooms[room] then return end
	trackedRooms[room] = true
	for _, object in ipairs(room:GetDescendants()) do
		if object:IsA("Model") and isValidEnemy(object) then trackEnemy(object) end
	end
	roomConnections[room] = {
		Added = room.DescendantAdded:Connect(function(object)
			if object:IsA("Model") then
				waitAndTrackModel(object)
			elseif object:IsA("Humanoid") then
				local possibleModel = object:FindFirstAncestorOfClass("Model")
				if possibleModel then waitAndTrackModel(possibleModel) end
			end
		end),
		Removed = room.DescendantRemoving:Connect(function(object)
			if object:IsA("Model") then untrackEnemy(object) end
		end),
	}
end

initializeRooms = function()
	if not dungeon then dungeon = workspace:WaitForChild("dungeon", 30) end
	if not dungeon then return false end

	for _, room in ipairs(dungeon:GetChildren()) do
		if room:IsA("Folder") or room:IsA("Model") then trackRoom(room) end
	end
	return true
end

resetDungeon = function()
	if not dungeon then return end
	for room, conns in pairs(roomConnections) do
		if conns.Added then pcall(function() conns.Added:Disconnect() end) end
		if conns.Removed then pcall(function() conns.Removed:Disconnect() end) end
	end
	roomConnections = {}
	trackedRooms = {}
	for enemy in pairs(trackedEnemies) do
		disconnectEnemyConnections(enemy)
	end
	trackedEnemies = {}
	enemyCount = 0
	pendingModels = {}
	if farmTarget then leaveFarmTarget() end
	dungeon = nil
end

cleanupEnemies = function()
	for enemy, data in pairs(trackedEnemies) do
		if not enemy or not enemy.Parent then
			untrackEnemy(enemy)
		else
			local enemyHumanoid = data.Humanoid or enemy:FindFirstChildOfClass("Humanoid")
			data.Humanoid = enemyHumanoid
			if not enemyHumanoid or enemyHumanoid.Health <= 0 then
				untrackEnemy(enemy)
			else
				local root = data.Root
				if not root or not root.Parent then
					root = getModelRoot(enemy)
					if root then data.Root = root else untrackEnemy(enemy) end
				end
			end
		end
	end
end

local function isBlacklisted(name)
	if not BLACKLIST_ENABLED then return false end
	for _, n in ipairs(blacklistEnemies) do
		if n == name then return true end
	end
	return false
end

getNearestEnemy = function()
	local character = player.Character
	if not character or not character.Parent then return nil end
	local playerRoot = character:FindFirstChild("HumanoidRootPart")
	if not playerRoot then return nil end

	local best, bestDistance = nil, math.huge
	local fallback, fallbackDistance = nil, math.huge
	for enemy, data in pairs(trackedEnemies) do
		if enemy and enemy.Parent and data and data.Root and data.Root.Parent then
			local distance = (playerRoot.Position - data.Root.Position).Magnitude
			if isBlacklisted(enemy.Name) then
				--// blacklist: chỉ nhắm khi không còn enemy bình thường nào tồn tại
				if distance < fallbackDistance then
					fallbackDistance = distance
					fallback = { Model = enemy, Root = data.Root, Distance = distance }
				end
			elseif distance < bestDistance then
				bestDistance = distance
				best = { Model = enemy, Root = data.Root, Distance = distance }
			end
		end
	end
	--// hết enemy bình thường -> chấp nhận đánh enemy trong blacklist
	if not best then return fallback end
	return best
end

getFarthestEnemy = function()
	local character = player.Character
	if not character or not character.Parent then return nil end
	local playerRoot = character:FindFirstChild("HumanoidRootPart")
	if not playerRoot then return nil end

	local best, bestDistance = nil, -1
	local fallback, fallbackDistance = nil, -1
	for enemy, data in pairs(trackedEnemies) do
		if enemy and enemy.Parent and data and data.Root and data.Root.Parent then
			local distance = (playerRoot.Position - data.Root.Position).Magnitude
			if isBlacklisted(enemy.Name) then
				--// blacklist: chỉ nhắm khi không còn enemy bình thường nào tồn tại
				if distance > fallbackDistance then
					fallbackDistance = distance
					fallback = { Model = enemy, Root = data.Root, Distance = distance }
				end
			elseif distance > bestDistance then
				bestDistance = distance
				best = { Model = enemy, Root = data.Root, Distance = distance }
			end
		end
	end
	--// hết enemy bình thường -> chấp nhận enemy trong blacklist
	if not best then return fallback end
	return best
end

--// Skill helpers
local function getLockedSkillTarget()
	if farmEnabled and farmTarget and trackedEnemies[farmTarget] then
		local data = trackedEnemies[farmTarget]
		if data.Root and data.Root.Parent then return data.Root end
	end
	return nil
end

local function canFireSkill()
	if autoSkillMode ~= "Target Only" then return true end
	local root = getLockedSkillTarget()
	if not root then return false end
	local character = player.Character
	local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
	if not playerRoot then return false end
	return (playerRoot.Position - root.Position).Magnitude <= SKILL_RANGE
end

--// Farm movement helpers
leaveFarmTarget = function()
	if not farmTarget then return end
	farmTarget = nil
	farmApproaching = false
	if humanoid and humanoid.Parent then humanoid.AutoRotate = farmOldAutoRotate end
end

local function getOrbitPosition(center, angle)
	local height = ORBIT_HEIGHT
	if bossActive and center then
		height = height + BOSS_HEIGHT_OFFSET
		if maintainBossHeight then
			if not bossStartY then bossStartY = center.Y end
			local drop = bossStartY - center.Y
			if drop > 0 then height = height + drop end
		end
	end
	return center + Vector3.new(math.cos(angle) * ORBIT_RADIUS, height, math.sin(angle) * ORBIT_RADIUS)
end

moveFarmTarget = function(deltaTime)
	if dodging then return end
	local enemy = farmTarget
	if not enemy or not trackedEnemies[enemy] or not trackedEnemies[enemy].Root or not trackedEnemies[enemy].Root.Parent then
		leaveFarmTarget()
		return
	end
	local character = player.Character
	local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
	if not character or not playerRoot or not playerRoot.Parent then leaveFarmTarget(); return end
	if not character.PrimaryPart then character.PrimaryPart = playerRoot end
	if not character.PrimaryPart then leaveFarmTarget(); return end

	local center = trackedEnemies[enemy].Root.Position
	local targetPosition
	if farmMode == "Hover" then
		farmApproaching = false
		targetPosition = center + Vector3.new(0, HOVER_HEIGHT, 0)
	else
		local effDir = basicOrbitDirection or farmOrbitDirection
		farmAngle = (farmAngle + effDir * math.rad(ORBIT_SPEED) * deltaTime) % (math.pi * 2)
		targetPosition = getOrbitPosition(center, farmAngle)
		if farmApproaching then
			local toPoint = targetPosition - playerRoot.Position
			local dist = toPoint.Magnitude
			if dist <= FARM_APPROACH_EPSILON then
				farmApproaching = false
			else
				targetPosition = playerRoot.Position + toPoint.Unit * math.min(dist, FARM_APPROACH_SPEED * deltaTime)
			end
		end
	end

	character:PivotTo(CFrame.lookAt(targetPosition, center))
	playerRoot.AssemblyLinearVelocity = Vector3.zero
	playerRoot.AssemblyAngularVelocity = Vector3.zero
end

farmTeleportTo = function(enemy)
	if teleporting then return end
	local character = player.Character
	local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
	local currentHumanoid = character and character:FindFirstChild("Humanoid")
	local data = trackedEnemies[enemy]
	if not character or not playerRoot or not currentHumanoid or not data or not data.Root or not data.Root.Parent then return end

	local enemyRoot = data.Root
	local oldAnchored = playerRoot.Anchored
	if not character.PrimaryPart then character.PrimaryPart = playerRoot end
	teleporting = true

	local s, err = pcall(function()
		currentHumanoid.AutoRotate = false
		playerRoot.Anchored = true
		playerRoot.AssemblyLinearVelocity, playerRoot.AssemblyAngularVelocity = Vector3.zero, Vector3.zero

		local targetPosition = getOrbitPosition(enemyRoot.Position, farmAngle)

		character:PivotTo(CFrame.lookAt(targetPosition, enemyRoot.Position))
		playerRoot.AssemblyLinearVelocity, playerRoot.AssemblyAngularVelocity = Vector3.zero, Vector3.zero

		task.wait(FREEZE_TIME)

		if playerRoot and playerRoot.Parent and currentHumanoid and currentHumanoid.Parent then
			playerRoot.Anchored = oldAnchored
		end
	end)
	if not s then warn("[AutoFarm] teleport error:", tostring(err)) end
	teleporting = false
end

fireFarmSkills = function()
	if not canFireSkill() then return end
	if os.clock() - farmLastSkillTime < AUTO_SKILL_INTERVAL then return end
	if autoSkillMode == "Target Only" then task.wait(0.1) end
	farmLastSkillTime = os.clock()
	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
	task.delay(AUTO_KEY_HOLD_TIME, function()
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
	end)
end

--// Teleport (Combat tab)
function shared.TeleportToNearestEnemy()
	if teleporting then return end
	teleporting = true

	local s, err = pcall(function()
		local character = player.Character
		local currentHumanoid = character and character:FindFirstChild("Humanoid")
		local playerRoot = character and character:FindFirstChild("HumanoidRootPart")

		if not character or not currentHumanoid or not playerRoot then return end
		if not dungeon and not initializeRooms() then return end

		cleanupEnemies()
		local nearest = getNearestEnemy()
		if not nearest then
			notifier.Notify("Teleport", "No enemy found.", 3)
			return
		end

		local enemy, enemyRoot = nearest.Model, nearest.Root
		if not enemy or not enemy.Parent or not enemyRoot or not enemyRoot.Parent then return end
		if not character.PrimaryPart then character.PrimaryPart = playerRoot end

		local oldAnchored, oldAutoRotate = playerRoot.Anchored, currentHumanoid.AutoRotate
		currentHumanoid.AutoRotate = false; playerRoot.Anchored = true
		playerRoot.AssemblyLinearVelocity, playerRoot.AssemblyAngularVelocity = Vector3.zero, Vector3.zero

		local direction = playerRoot.Position - enemyRoot.Position
		direction = direction.Magnitude < 0.01 and Vector3.new(0, 0, -1) or direction.Unit
		local targetPosition = enemyRoot.Position + direction * TELEPORT_RADIUS + Vector3.new(0, HEIGHT_OFFSET, 0)

		character:PivotTo(CFrame.lookAt(targetPosition, enemyRoot.Position))
		playerRoot.AssemblyLinearVelocity, playerRoot.AssemblyAngularVelocity = Vector3.zero, Vector3.zero

		task.wait(FREEZE_TIME)

		if playerRoot and playerRoot.Parent and currentHumanoid and currentHumanoid.Parent then
			playerRoot.Anchored, currentHumanoid.AutoRotate = oldAnchored, oldAutoRotate
		end
		if playerRoot and playerRoot.Parent and enemyRoot and enemyRoot.Parent then
			character:PivotTo(CFrame.lookAt(playerRoot.Position, enemyRoot.Position))
		end

		notifier.Notify("Teleport", "Teleported to " .. enemy.Name, 2)
	end)
	if not s then warn("[Teleport] error:", tostring(err)) end
	teleporting = false
end

--// Teleport về sau kẻ địch XA NHẤT (phím C). Điểm tới được validate:
--// - Không lún xuống đất (ép Y theo floor bên dưới).
--// - Không nằm trong tường (probe ray từ enemy tới điểm, thử xê sang 2 bên).
local function rotateDir(dir, ang)
	local cosA = math.cos(ang)
	local sinA = math.sin(ang)
	return Vector3.new(dir.X * cosA - dir.Z * sinA, 0, dir.X * sinA + dir.Z * cosA)
end

local function findValidTeleportSpot(character, enemy, enemyRoot, behindDir, raw)
	local Workspace = game:GetService("Workspace")
	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = { character, enemy, enemyRoot }
	params.IgnoreWater = true

	--// 1) Ép sàn: không bị lún dưới mặt đất.
	local ground = Workspace:Raycast(raw + Vector3.new(0, 15, 0), Vector3.new(0, -40, 0), params)
	local yBase = ground and ground.Position.Y + 0.5 or raw.Y

	--// 2) Chống xuyên tường: thử các hướng xê quanh "đằng sau" tới khi không bị chặn.
	local sweeps = {
		behindDir,
		rotateDir(behindDir, math.rad(25)),
		rotateDir(behindDir, -math.rad(25)),
		rotateDir(behindDir, math.rad(50)),
		rotateDir(behindDir, -math.rad(50)),
		rotateDir(behindDir, math.rad(80)),
		rotateDir(behindDir, -math.rad(80)),
	}
	for _, d in ipairs(sweeps) do
		local candidate = Vector3.new(enemyRoot.Position.X + d.X * TELEPORT_RADIUS, yBase, enemyRoot.Position.Z + d.Z * TELEPORT_RADIUS)
		local probe = Workspace:Raycast(enemyRoot.Position + Vector3.new(0, 2, 0), candidate - enemyRoot.Position, params)
		local blocked = probe and (probe.Position - candidate).Magnitude > 1.5
		if not blocked then return candidate end
	end
	return nil
end

function shared.TeleportBehindFarthestEnemy()
	if teleporting then return end
	teleporting = true

	local s, err = pcall(function()
		local character = player.Character
		local currentHumanoid = character and character:FindFirstChild("Humanoid")
		local playerRoot = character and character:FindFirstChild("HumanoidRootPart")

		if not character or not currentHumanoid or not playerRoot then return end
		if not dungeon and not initializeRooms() then return end

		cleanupEnemies()
		local farthest = getFarthestEnemy()
		if not farthest then
			notifier.Notify("Teleport", "No enemy found.", 3)
			return
		end

		local enemy, enemyRoot = farthest.Model, farthest.Root
		if not enemy or not enemy.Parent or not enemyRoot or not enemyRoot.Parent then return end
		if not character.PrimaryPart then character.PrimaryPart = playerRoot end

		--// "đằng sau" = ngược hướng enemy đang nhìn (backstab); fallback ngược phía player.
		local behindDir = -enemyRoot.CFrame.LookVector
		behindDir = behindDir.Magnitude > 0.1 and behindDir or (enemyRoot.Position - playerRoot.Position).Unit
		if (enemyRoot.Position + behindDir * TELEPORT_RADIUS - playerRoot.Position).Magnitude < (enemyRoot.Position - playerRoot.Position).Magnitude then
			--// "đằng sau" lại gần player hơn mặt trước -> dùng hướng ngược (xa player hơn)
			behindDir = -behindDir
		end
		local raw = enemyRoot.Position + behindDir * TELEPORT_RADIUS

		local target = findValidTeleportSpot(character, enemy, enemyRoot, behindDir, raw) or raw

		local oldAnchored, oldAutoRotate = playerRoot.Anchored, currentHumanoid.AutoRotate
		currentHumanoid.AutoRotate = false; playerRoot.Anchored = true
		playerRoot.AssemblyLinearVelocity, playerRoot.AssemblyAngularVelocity = Vector3.zero, Vector3.zero

		character:PivotTo(CFrame.lookAt(target, enemyRoot.Position))
		playerRoot.AssemblyLinearVelocity, playerRoot.AssemblyAngularVelocity = Vector3.zero, Vector3.zero

		task.wait(FREEZE_TIME)

		if playerRoot and playerRoot.Parent and currentHumanoid and currentHumanoid.Parent then
			playerRoot.Anchored, currentHumanoid.AutoRotate = oldAnchored, oldAutoRotate
		end
		if playerRoot and playerRoot.Parent and enemyRoot and enemyRoot.Parent then
			character:PivotTo(CFrame.lookAt(playerRoot.Position, enemyRoot.Position))
		end

		notifier.Notify("Teleport", "Behind " .. enemy.Name, 2)
	end)
	if not s then warn("[Teleport] error:", tostring(err)) end
	teleporting = false
end

--// Speed state (Speed tab thao tác lên đây)
function shared.SetFastSpeed(value)
	fastSpeed = value
	if enabled and humanoid and humanoid.Parent then
		humanoid.WalkSpeed = fastSpeed
	end
end

function shared.SetSpeedEnabled(state)
	enabled = state
	if humanoid and humanoid.Parent then
		humanoid.WalkSpeed = enabled and fastSpeed or normalSpeed
	end
end

function shared.IsSpeedEnabled()
	return enabled
end

function shared.GetFastSpeed()
	return fastSpeed
end

--// Humanoid setup
local speedConnection = nil
local function connectSpeedListener()
	if speedConnection then
		speedConnection:Disconnect()
		speedConnection = nil
	end
	if not humanoid or not humanoid.Parent then return end
	speedConnection = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
		if enabled and humanoid and humanoid.Parent and humanoid.WalkSpeed ~= fastSpeed then
			humanoid.WalkSpeed = fastSpeed
		end
	end)
end

function shared.SetHumanoid(character)
	if not character then return end
	local newHumanoid = character:WaitForChild("Humanoid", 10)
	if not newHumanoid then return end

	humanoid = newHumanoid
	normalSpeed = humanoid.WalkSpeed
	if enabled then humanoid.WalkSpeed = fastSpeed end
end

--// Farm state accessors
function shared.IsFarmEnabled()
	return farmEnabled
end

function shared.GetFarmMode()
	return farmMode
end

function shared.SetFarmMode(mode)
	farmMode = mode
end

function shared.GetFarmRunning()
	return farmRunning
end

function shared.SetFarmRunning(value)
	farmRunning = value
end

function shared.SetFarmEnabled(value)
	farmEnabled = value
end

function shared.GetRetargetEnabled()
	return retargetEnabled
end

function shared.SetRetargetEnabled(value)
	retargetEnabled = value == true
end

function shared.GetRetargetInterval()
	return retargetInterval
end

function shared.SetRetargetInterval(value)
	retargetInterval = tonumber(value) or retargetInterval
end

function shared.GetRetargetMethod()
	return retargetMethod
end

function shared.SetRetargetMethod(value)
	retargetMethod = value or "Auto"
end

function shared.GetOrbitReverseEnabled()
	return orbitReverseEnabled
end

function shared.SetOrbitReverseEnabled(value)
	orbitReverseEnabled = value == true
end

--// Basic Orbit Dodge: điều khiển hướng orbit hiệu dụng (nil = dùng farmOrbitDirection)
function shared.SetBasicOrbitDirection(value)
	basicOrbitDirection = value
end

function shared.GetBasicOrbitDirection()
	return basicOrbitDirection
end

function shared.FlipBasicOrbitDirection()
	if basicOrbitDirection then basicOrbitDirection = -basicOrbitDirection end
end

function shared.GetFarmOrbitDirection()
	return farmOrbitDirection
end

function shared.GetOrbitAngle()
	return farmAngle
end

function shared.SetOrbitAngle(value)
	farmAngle = (((value % (math.pi * 2)) + math.pi * 2) % (math.pi * 2))
end

--// Vị trí tâm + độ cao orbit hiện tại (để tele skip)
function shared.GetOrbitCenter()
	if not farmTarget or not trackedEnemies[farmTarget] then return nil end
	local data = trackedEnemies[farmTarget]
	if data.Root and data.Root.Parent then return data.Root.Position end
	return nil
end

function shared.GetOrbitHeight()
	return ORBIT_HEIGHT
end

function shared.SetDodging(value)
	dodging = value == true
end

function shared.IsDodging()
	return dodging
end

function shared.GetDungeonStartTime()
	return dungeonStartTime
end

function shared.SetDungeonStartTime(value)
	dungeonStartTime = value
end

function shared.GetDungeonElapsed()
	if not dungeonStartTime then return nil end
	return os.clock() - dungeonStartTime
end

function shared.ClearFarmTarget()
	leaveFarmTarget()
end

--// Farm internals (farm.luau sử dụng)
function shared.ReadyDungeon()
	if not dungeon and not initializeRooms() then return false end
	return true
end

function shared.FarmPickTarget()
	cleanupEnemies()
	if farmTarget then
		if retargetEnabled and trackedEnemies[farmTarget] and trackedEnemies[farmTarget].Root and trackedEnemies[farmTarget].Root.Parent then
			local now = os.clock()
			if now - farmLastRetargetTime >= retargetInterval then
				farmLastRetargetTime = now
				if orbitReverseEnabled then farmOrbitDirection = -farmOrbitDirection end
				leaveFarmTarget()
			end
		end
	end
	if farmTarget then return true end
	local nearest = getNearestEnemy()
	if nearest and nearest.Model and nearest.Root and nearest.Root.Parent then
		farmTarget = nearest.Model
		farmLastRetargetTime = os.clock()
		if humanoid and humanoid.Parent then
			farmOldAutoRotate = humanoid.AutoRotate
			humanoid.AutoRotate = false
		end
		if nearest.Distance > FARM_ENGAGE_DISTANCE then
			farmTeleportTo(farmTarget)
			farmApproaching = false
		else
			farmApproaching = true
		end
		if retargetMethod == "Tele" then
			farmTeleportTo(farmTarget)
			farmApproaching = false
		elseif retargetMethod == "Tween" then
			farmApproaching = true
		end
		return true
	end
	if not dungeon then initializeRooms() end
	return false
end

function shared.FarmStep(deltaTime)
	if farmEnabled and not teleporting then moveFarmTarget(deltaTime) end
end

function shared.FarmFireSkills()
	if farmTarget and trackedEnemies[farmTarget] then fireFarmSkills() end
end

function shared.CanFireSkill()
	return canFireSkill()
end

function shared.FarmTargetAlive()
	local data = trackedEnemies[farmTarget]
	return farmTarget and farmTarget.Parent and data and data.Root and data.Root.Parent
end

--// Vị trí farm target hiện tại (boss/đối tượng farm) để dodge giữ hướng nhìn.
--// Trả về Vector3 hoặc nil nếu không có.
function shared.GetFarmTargetPosition()
	if not farmTarget or not trackedEnemies[farmTarget] then return nil end
	local data = trackedEnemies[farmTarget]
	if data.Root and data.Root.Parent then return data.Root.Position end
	return nil
end

function shared.GetHumanoid()
	return humanoid
end

function shared.RestoreAutoRotate()
	if humanoid and humanoid.Parent then humanoid.AutoRotate = farmOldAutoRotate end
end

--// Auto skill state
function shared.IsAutoSkillEnabled()
	return autoSkillEnabled
end

function shared.SetAutoSkillEnabled(value)
	autoSkillEnabled = value
end

function shared.GetAutoSkillRunning()
	return autoSkillRunning
end

function shared.SetAutoSkillRunning(value)
	autoSkillRunning = value
end

function shared.SetAutoSkillMode(mode)
	autoSkillMode = mode
end

function shared.GetAutoSkillMode()
	return autoSkillMode
end

--// Trả về danh sách tên các loại enemy có trong màn (dungeon + đang track)
function shared.GetEnemyNames()
	local names = {}
	local function add(name)
		if name and name ~= "" and name ~= player.Name then names[name] = true end
	end
	if dungeon then
		for _, room in ipairs(dungeon:GetChildren()) do
			if room:IsA("Folder") or room:IsA("Model") then
				for _, obj in ipairs(room:GetDescendants()) do
					if obj:IsA("Model") and obj:FindFirstChildOfClass("Humanoid") then
						add(obj.Name)
					end
				end
			end
		end
	end
	for enemy in pairs(trackedEnemies) do
		add(enemy.Name)
	end
	local out = {}
	for name in pairs(names) do table.insert(out, name) end
	table.sort(out)
	return out
end

--// Trả về set tên projectile của enemy từ ReplicatedStorage.enemyProjectiles
--// (bao gồm Model, MeshPart, Part). Dùng chung cho ESP và Basic Orbit Dodge.
function shared.GetEnemyProjectileNames()
	local names = {}
	local rs = game:GetService("ReplicatedStorage")
	local folder = rs:FindFirstChild(PROJECTILE_FOLDER)
	if not folder then return names end
	for _, obj in ipairs(folder:GetChildren()) do
		local cls = obj.ClassName
		if cls == "Model" or cls == "MeshPart" or cls == "Part" then
			names[obj.Name] = true
		end
	end
	return names
end

--// Tunable constants accessors (UI tabs cập nhật qua đây)
function shared.GetSkillInterval()
	return AUTO_SKILL_INTERVAL
end

function shared.SetSkillInterval(value)
	AUTO_SKILL_INTERVAL = value
end

function shared.GetSkillRange()
	return SKILL_RANGE
end

function shared.SetSkillRange(value)
	SKILL_RANGE = value
end

function shared.GetKeyHoldTime()
	return AUTO_KEY_HOLD_TIME
end

function shared.GetOrbitRadius()
	return ORBIT_RADIUS
end

function shared.SetOrbitRadius(value)
	ORBIT_RADIUS = value
end

function shared.GetOrbitSpeed()
	return ORBIT_SPEED
end

function shared.SetOrbitSpeed(value)
	ORBIT_SPEED = value
end

function shared.GetOrbitHeight()
	return ORBIT_HEIGHT
end

function shared.SetOrbitHeight(value)
	ORBIT_HEIGHT = value
end

--// Y hiện tại của boss đang farm (để bù offset khi boss hạ độ cao)
local function currentFarmTargetY()
	local data = farmTarget and trackedEnemies[farmTarget]
	if data and data.Root and data.Root.Parent then return data.Root.Position.Y end
	return nil
end

--// Maintain orbit height khi đánh boss
function shared.GetMaintainBossHeight()
	return maintainBossHeight
end

function shared.SetMaintainBossHeight(value)
	maintainBossHeight = value == true
	if maintainBossHeight then
		if bossActive then
			bossStartY = currentFarmTargetY() or bossStartY
		end
	else
		bossStartY = nil
	end
end

--// Offset cộng thêm vào orbit height khi ở boss room
function shared.GetBossHeightOffset()
	return BOSS_HEIGHT_OFFSET
end

function shared.SetBossHeightOffset(value)
	BOSS_HEIGHT_OFFSET = tonumber(value) or 0
end

function shared.GetHoverHeight()
	return HOVER_HEIGHT
end

function shared.SetHoverHeight(value)
	HOVER_HEIGHT = value
end

function shared.GetFarmEngageDistance()
	return FARM_ENGAGE_DISTANCE
end

function shared.SetFarmEngageDistance(value)
	FARM_ENGAGE_DISTANCE = value
end

function shared.GetFarmScanInterval()
	return FARM_SCAN_INTERVAL
end

--// Initialization: character hiện tại + listeners
if player and player.Character and player.Character.Parent then
	shared.SetHumanoid(player.Character)
	connectSpeedListener()
else
	local character = player and player.CharacterAdded and task.spawn(function()
		local char = player.CharacterAdded:Wait()
		if char then shared.SetHumanoid(char); connectSpeedListener() end
	end)
end

if player then
	player.CharacterAdded:Connect(function(character)
		local ok, err = pcall(function()
			farmTarget = nil; farmAngle = 0; farmApproaching = false; farmOldAutoRotate = true
			if humanoid and humanoid.Parent then humanoid.AutoRotate = farmOldAutoRotate end
			if not character then return end
			shared.SetHumanoid(character)
			connectSpeedListener()

			for _, callback in ipairs(respawnCallbacks) do
				pcall(callback)
			end
		end)
		if not ok then warn("[Shared] respawn handler error:", tostring(err)) end
	end)
end

local lastHeartbeatWarn = 0
RunService.Heartbeat:Connect(function(deltaTime)
	local ok, err = pcall(function()
		shared.FarmStep(deltaTime)
	end)
	if not ok then
		local now = os.clock()
		if now - lastHeartbeatWarn > 5 then
			lastHeartbeatWarn = now
			warn("[Heartbeat] error:", tostring(err))
		end
	end
end)

--// Dungeon watcher
task.spawn(function()
	while true do
		task.wait(GUI_UPDATE_INTERVAL)
		local currentDungeon = workspace:FindFirstChild("dungeon")
		if dungeon and currentDungeon ~= dungeon then
			resetDungeon()
		elseif not dungeon and currentDungeon then
			initializeRooms()
		end
	end
end)

task.spawn(function()
	local success, errorMessage = pcall(function() return initializeRooms() end)
	if not success then
		warn("[EnemyTracker] Initialization error:", errorMessage)
	end
end)

--// Boss state API
function shared.IsBossActive()
	return bossActive
end

function shared.OnBossActiveChanged(callback)
	if type(callback) ~= "function" then return function() end end
	table.insert(bossCallbacks, callback)
	return function()
		for i, cb in ipairs(bossCallbacks) do
			if cb == callback then table.remove(bossCallbacks, i) break end
		end
	end
end

--// Boss GUI tracker: theo dõi PlayerGui để phát hiện bossHealth xuất hiện/biến mất
local bossHealthRef = nil
local function setBossActive(active)
	if bossActive == active then return end
	bossActive = active
	if active then
		retargetSavedDuringBoss = retargetEnabled
		retargetEnabled = false
		if maintainBossHeight then bossStartY = currentFarmTargetY() end
	else
		if retargetSavedDuringBoss ~= nil then
			retargetEnabled = retargetSavedDuringBoss
			retargetSavedDuringBoss = nil
		end
		bossStartY = nil
	end
	for i = #bossCallbacks, 1, -1 do
		pcall(bossCallbacks[i], bossActive)
	end
end

local function scanBossGui()
	if not player then return end
	local playerGui = player:FindFirstChild("PlayerGui")
	if not playerGui then
		bossHealthRef = nil
		setBossActive(false)
		return
	end
	local found = playerGui:FindFirstChild("bossHealth", true)
	if found then
		if found ~= bossHealthRef then
			bossHealthRef = found
			if bossHealthRef:IsA("GuiObject") or bossHealthRef:IsA("ScreenGui") then
				bossHealthRef:GetPropertyChangedSignal("Enabled"):Connect(scanBossGui)
			end
		end
		setBossActive(not (type(found.Enabled) == "boolean") or found.Enabled == true)
	else
		bossHealthRef = nil
		setBossActive(false)
	end
end

task.spawn(function()
	if not player then return end
	local playerGui = player:WaitForChild("PlayerGui", 30)
	if not playerGui then return end

	playerGui.DescendantAdded:Connect(scanBossGui)
	playerGui.DescendantRemoving:Connect(scanBossGui)
	scanBossGui()

	--// Poll an toàn phòng trường hợp DescendantRemoving bỏ sót khi GUI bị xóa cục bộ
	while task.wait(0.5) do
		scanBossGui()
	end
end)

--// Table
return shared
