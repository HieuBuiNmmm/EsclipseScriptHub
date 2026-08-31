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
local FREEZE_TIME = 0.15

local ORBIT_RADIUS = 50
local ORBIT_HEIGHT = 24
local ORBIT_SPEED = 40

--// Khoảng thời gian (giây) giữa các lần nhảy góc trong farm mode "Orbit Tele".
--// Giữa các nhảy nhân vật vẫn được PivotTo giữ vị trí mới (không ghost), chỉ có
--// góc farmAngle tăng theo bước mỗi khoảng này.
local ORBIT_TELE_INTERVAL = 0.15

local AUTO_SKILL_INTERVAL = 2.0
local AUTO_KEY_HOLD_TIME = 0.05
local SKILL_RANGE = 60
local SHORTCUT_TELEPORT_HEIGHT = 0
local SHORTCUT_ORBIT_DURATION = 0.3
local SHORTCUT_ORBIT_SPEED = 0

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

--// Chỉ số boss hiện tại trong 1 dungeon (thường 1 dungeon có 3 boss).
--// Tăng 1 mỗi lần IsBossActive chuyển false -> true (boss 1 = 1); reset về 0
--// khi vào dungeon mới.
local bossIndex = 0
local bossIndexCallbacks = {}

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
local shortcutOrbitId = 0
local nearestTeleportDistance = 12
local farthestTeleportDistance = 12
--// Khoảng cách tele tới phía trước barrier gần nhất (Workspace/dungeon/<room>).
--// Cho phép giá trị ÂM để đổi sang phía bên kia khi hướng tiếp cận bị ngược.
local barrierTeleportDistance = 10
--// Mã orbit barrier hiện tại để huỷ vòng giữ quỹ đạo cũ khi tele lại.
local barrierOrbitId = 0
--// Bước góc (độ) mỗi lần tele trong farm mode "Orbit Tele" (real alias là rad sau đó)
local orbitTeleStepDeg = 15
--// Thời điểm lần nhảy góc gần nhất (điều khiển nhịp ORBIT_TELE_INTERVAL)
local lastTeleStepTime = 0

local retargetEnabled = false
local retargetInterval = 5
local retargetMethod = "Auto"
--// Cách chọn mục tiêu của Auto Retarget: "Nearest" (gần nhất) hoặc "Farthest" (xa nhất)
local retargetMode = "Nearest"
local orbitReverseEnabled = false
local farmOrbitDirection = 1
local basicOrbitDirection = nil
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

--// Tên dungeon đang chơi, đọc từ workspace.dungeonName.
--// Lưu ý: trong Workspace có 2 instance tên "dungeonName", chỉ 1 cái mang giá trị
--// dungeon thật; giá trị còn lại là placeholder ("unknown") hoặc rỗng khi ở lobby
--// -> chỉ nhận chuỗi KHÁC placeholder (xem readDungeonName).
local currentDungeonName = nil
local dungeonNameCallbacks = {}

--// Giá trị placeholder của workspace.dungeonName khi chưa vào dungeon (lobby).
local DUNGEON_NAME_PLACEHOLDER = "unknown"

--// Trạng thái LOBBY vs DUNGEON. Lobby = chưa có tên dungeon thật
--// (workspace.dungeonName placeholder "unknown"/rỗng). Có tên thật -> trong dungeon.
local inLobby = true
local lobbyCallbacks = {}

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

	bossIndex = 0
	for i = #bossIndexCallbacks, 1, -1 do
		pcall(bossIndexCallbacks[i], bossIndex)
	end

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
	elseif farmMode == "Orbit Tele" then
		--// Giả lập quỹ đạo bằng tele rời rạc: không move mượt (speed quỹ đạo = 0),
		--// chỉ tăng góc theo từng bước cố định mỗi ORBIT_TELE_INTERVAL. Nhưng vẫn
		--// PivotTo mỗi frame (như orbit thường) để giữ vị trí thật, tránh ghost.
		if teleporting then return end
		local effDir = basicOrbitDirection or farmOrbitDirection
		if not farmApproaching then
			if os.clock() - lastTeleStepTime >= ORBIT_TELE_INTERVAL then
				farmAngle = (farmAngle + effDir * math.rad(orbitTeleStepDeg)) % (math.pi * 2)
				lastTeleStepTime = os.clock()
			end
		end
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

--// Teleport tới vị trí orbit dùng khi Auto Farm nhận mục tiêu mới. Phím tắt
--// cũng dùng chính phép dịch chuyển này để giữ hành vi nhất quán với Auto Farm.
local function teleportToFarmOrbit(enemy, restoreAutoRotate, targetPosition)
	if teleporting then return end
	local character = player.Character
	local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
	local currentHumanoid = character and character:FindFirstChild("Humanoid")
	local data = trackedEnemies[enemy]
	if not character or not playerRoot or not currentHumanoid or not data or not data.Root or not data.Root.Parent then return false end

	local enemyRoot = data.Root
	local oldAnchored, oldAutoRotate = playerRoot.Anchored, currentHumanoid.AutoRotate
	if not character.PrimaryPart then character.PrimaryPart = playerRoot end
	teleporting = true

	local s, err = pcall(function()
		currentHumanoid.AutoRotate = false
		playerRoot.Anchored = true
		playerRoot.AssemblyLinearVelocity, playerRoot.AssemblyAngularVelocity = Vector3.zero, Vector3.zero

		targetPosition = targetPosition or getOrbitPosition(enemyRoot.Position, farmAngle)

		character:PivotTo(CFrame.lookAt(targetPosition, enemyRoot.Position))
		playerRoot.AssemblyLinearVelocity, playerRoot.AssemblyAngularVelocity = Vector3.zero, Vector3.zero

		task.wait(FREEZE_TIME)

		if playerRoot and playerRoot.Parent and currentHumanoid and currentHumanoid.Parent then
			playerRoot.Anchored = oldAnchored
			if restoreAutoRotate then currentHumanoid.AutoRotate = oldAutoRotate end
		end
	end)
	if not s then warn("[Teleport] orbit teleport error:", tostring(err)) end
	teleporting = false
	return s
end

farmTeleportTo = function(enemy)
	teleportToFarmOrbit(enemy, false)
end

--// Giữ mục tiêu theo đúng nhịp Orbit / Orbit Tele của Auto Farm trong một
--// khoảng ngắn sau khi dùng phím tắt. Không đụng tới farmTarget nên không
--// làm thay đổi trạng thái Auto Farm đang chạy.
local function maintainShortcutOrbit(enemy, orbitId, angle, radius, height, duration, speed)
	local deadline = os.clock() + duration
	local previousTime = os.clock()

	while orbitId == shortcutOrbitId and os.clock() < deadline do
		local data = trackedEnemies[enemy]
		local character = player.Character
		local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
		if not data or not data.Root or not data.Root.Parent or not character or not playerRoot or not playerRoot.Parent then
			return
		end
		if not character.PrimaryPart then character.PrimaryPart = playerRoot end
		if not character.PrimaryPart then return end

		local now = os.clock()
		local deltaTime = now - previousTime
		previousTime = now
		local center = data.Root.Position
		local targetPosition

		angle = (angle + math.rad(speed) * deltaTime) % (math.pi * 2)
		targetPosition = center + Vector3.new(math.cos(angle) * radius, height, math.sin(angle) * radius)

		character:PivotTo(CFrame.lookAt(targetPosition, center))
		playerRoot.AssemblyLinearVelocity = Vector3.zero
		playerRoot.AssemblyAngularVelocity = Vector3.zero
		RunService.Heartbeat:Wait()
	end
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

--// Teleport phím tắt dùng cùng điểm orbit ban đầu của Auto Farm.
local function getShortcutTeleportPosition(enemyRoot, playerRoot, mode, distance, height)
	local direction
	if mode == "Behind" then
		direction = -enemyRoot.CFrame.LookVector
	else
		direction = playerRoot.Position - enemyRoot.Position
	end

	direction = Vector3.new(direction.X, 0, direction.Z)
	if direction.Magnitude < 0.01 then direction = Vector3.new(0, 0, -1) end
	direction = direction.Unit
	local angle = math.atan2(direction.Z, direction.X)
	local position = enemyRoot.Position + Vector3.new(direction.X * distance, height, direction.Z * distance)
	return position, angle
end

local function teleportToSelectedEnemy(selector, mode, distance, height, orbitDuration, orbitSpeed)
	if teleporting then return end

	local s, err = pcall(function()
		if shared.IsInLobby() then return end
		if not dungeon and not initializeRooms() then return end
		cleanupEnemies()

		local target = selector()
		if not target then
			notifier.Notify("Teleport", "No enemy found.", 3)
			return
		end

		local character = player.Character
		local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
		if not playerRoot then return end
		local position, angle = getShortcutTeleportPosition(target.Root, playerRoot, mode, distance, height)

		if teleportToFarmOrbit(target.Model, true, position) then
			notifier.Notify("Teleport", "Teleported to " .. target.Model.Name, 2)
			shortcutOrbitId += 1
			local orbitId = shortcutOrbitId
			task.spawn(function()
				maintainShortcutOrbit(target.Model, orbitId, angle, distance, height, orbitDuration, orbitSpeed)
			end)
		end
	end)
	if not s then warn("[Teleport] shortcut error:", tostring(err)) end
end

function shared.TeleportToNearestEnemy()
	teleportToSelectedEnemy(getNearestEnemy, "Nearest", nearestTeleportDistance, SHORTCUT_TELEPORT_HEIGHT, SHORTCUT_ORBIT_DURATION, SHORTCUT_ORBIT_SPEED)
end

function shared.TeleportBehindFarthestEnemy()
	teleportToSelectedEnemy(getFarthestEnemy, "Behind", farthestTeleportDistance, SHORTCUT_TELEPORT_HEIGHT, SHORTCUT_ORBIT_DURATION, SHORTCUT_ORBIT_SPEED)
end

--// ---- Barrier teleport (Workspace/dungeon/<room>) ----
--// Tìm root part của 1 barrier (Part hoặc Model) theo tên chứa "barrier".
local function getBarrierRoot(obj)
	if obj:IsA("BasePart") then return obj end
	if obj:IsA("Model") then
		local root = obj:FindFirstChild("HumanoidRootPart")
		if root and root:IsA("BasePart") then return root end
		if obj.PrimaryPart and obj.PrimaryPart:IsA("BasePart") then return obj.PrimaryPart end
		for _, d in ipairs(obj:GetDescendants()) do
			if d:IsA("BasePart") then return d end
		end
	end
	return nil
end

--// Barrier gần player nhất trong toàn bộ dungeon (mọi room). Trả về root part.
local function getNearestBarrier(playerPos)
	if not dungeon then return nil end
	local nearest, nearestDist = nil, math.huge
	for _, desc in ipairs(dungeon:GetDescendants()) do
		if string.find(string.lower(desc.Name), "barrier", 1, true) then
			local root = getBarrierRoot(desc)
			if root then
				local d = (root.Position - playerPos).Magnitude
				if d < nearestDist then
					nearestDist = d
					nearest = root
				end
			end
		end
	end
	return nearest
end

--// Giữ player tại vị trí orbit quanh barrier trong thời gian ngắn, cùng kiểu
--// với maintainShortcutOrbit của phím tắt R/C (tele vào điểm rồi giữ/hover).
local function maintainBarrierOrbit(orbitId, center, angle, radius, height, duration, speed)
	local deadline = os.clock() + duration
	local previousTime = os.clock()

	while orbitId == barrierOrbitId and os.clock() < deadline do
		local character = player.Character
		local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
		if not character or not playerRoot or not playerRoot.Parent then return end
		if not character.PrimaryPart then character.PrimaryPart = playerRoot end
		if not character.PrimaryPart then return end

		local now = os.clock()
		local deltaTime = now - previousTime
		previousTime = now

		angle = (angle + math.rad(speed) * deltaTime) % (math.pi * 2)
		local targetPosition = center + Vector3.new(math.cos(angle) * radius, height, math.sin(angle) * radius)

		character:PivotTo(CFrame.lookAt(targetPosition, center))
		playerRoot.AssemblyLinearVelocity = Vector3.zero
		playerRoot.AssemblyAngularVelocity = Vector3.zero
		RunService.Heartbeat:Wait()
	end
end

--// Tele player tới phía trước barrier gần nhất, cùng kiểu teleport với phím tắt R/C
--// (dùng chung phép PivotTo vào điểm orbit + giữ quỹ đạo ngắn).
--// barrierTeleportDistance cho phép giá trị ÂM để tele sang phía bên kia khi bị ngược.
function shared.TeleportFrontOfNearestBarrier()
	if teleporting then return end
	teleporting = true

	local s, err = pcall(function()
		if shared.IsInLobby() then return end
		if not dungeon and not initializeRooms() then return end

		local character = player.Character
		local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
		if not character or not playerRoot or not playerRoot.Parent then return end
		if character.PrimaryPart then character.PrimaryPart = playerRoot end

		local barrierRoot = getNearestBarrier(playerRoot.Position)
		if not barrierRoot then
			notifier.Notify("Teleport", "No barrier found.", 3)
			return
		end

		local center = barrierRoot.Position
		--// "Phía trước" = theo hướng facing cố định của barrier (LookVector), để cùng 1
		--// barrier luôn tele về đúng 1 vị trí bất kể player tiếp cận từ hướng nào.
		--// Giá trị distance âm sẽ đảo hướng để tele sang phía bên kia khi bị ngược.
		local forward = barrierRoot.CFrame.LookVector
		forward = Vector3.new(forward.X, 0, forward.Z)
		if forward.Magnitude < 0.01 then forward = Vector3.new(0, 0, -1) end
		forward = forward.Unit

		local sign = barrierTeleportDistance < 0 and -1 or 1
		local radius = math.abs(barrierTeleportDistance)
		if radius < 1 then radius = 1 end
		local height = SHORTCUT_TELEPORT_HEIGHT

		--// Hướng lệch thực tế từ barrier tới điểm bắt đầu (tính theo dấu distance).
		local offsetDir = Vector3.new(forward.X * sign, 0, forward.Z * sign)
		local angle = math.atan2(offsetDir.Z, offsetDir.X)
		local targetPosition = center + offsetDir * radius

		local humanoid = character:FindFirstChild("Humanoid")
		local oldAutoRotate = humanoid and humanoid.AutoRotate
		local oldAnchored = playerRoot.Anchored
		if humanoid then humanoid.AutoRotate = false end
		playerRoot.Anchored = true
		playerRoot.AssemblyLinearVelocity, playerRoot.AssemblyAngularVelocity = Vector3.zero, Vector3.zero

		character:PivotTo(CFrame.lookAt(targetPosition, center))
		playerRoot.AssemblyLinearVelocity, playerRoot.AssemblyAngularVelocity = Vector3.zero, Vector3.zero

		task.wait(FREEZE_TIME)

		if playerRoot and playerRoot.Parent and humanoid and humanoid.Parent then
			playerRoot.Anchored = oldAnchored
			humanoid.AutoRotate = oldAutoRotate
		end

		barrierOrbitId += 1
		local orbitId = barrierOrbitId
		task.spawn(function()
			maintainBarrierOrbit(orbitId, center, angle, radius, height, SHORTCUT_ORBIT_DURATION, SHORTCUT_ORBIT_SPEED)
		end)

		notifier.Notify("Teleport", "Teleported in front of barrier (" .. barrierRoot.Name .. ")", 2)
	end)
	if not s then warn("[Teleport] barrier error:", tostring(err)) end
	teleporting = false
end

function shared.GetBarrierTeleportDistance()
	return barrierTeleportDistance
end

function shared.SetBarrierTeleportDistance(value)
	barrierTeleportDistance = tonumber(value) or barrierTeleportDistance
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

function shared.GetNearestTeleportDistance()
	return nearestTeleportDistance
end

function shared.SetNearestTeleportDistance(value)
	nearestTeleportDistance = tonumber(value) or nearestTeleportDistance
end

function shared.GetFarthestTeleportDistance()
	return farthestTeleportDistance
end

function shared.SetFarthestTeleportDistance(value)
	farthestTeleportDistance = tonumber(value) or farthestTeleportDistance
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

function shared.GetRetargetMode()
	return retargetMode
end

function shared.SetRetargetMode(value)
	if value == "Nearest" or value == "Farthest" then retargetMode = value end
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

	local function pickBest()
		return (retargetMode == "Farthest") and getFarthestEnemy() or getNearestEnemy()
	end

	local pick
	if farmTarget then
		local cur = trackedEnemies[farmTarget]
		if cur and cur.Root and cur.Root.Parent then
			--// Realtime retarget: mục tiêu hiện tại còn sống, mỗi lần quét so ngay
			--// với đối tượng TỐT NHẤT hiện có (Nearest/Farthest theo mode). Không chờ
			--// interval — xuất hiện đối tượng hơn liền switch qua nó.
			if retargetEnabled then
				pick = pickBest()
				if pick and pick.Model ~= farmTarget then
					if orbitReverseEnabled then farmOrbitDirection = -farmOrbitDirection end
					leaveFarmTarget()
				else
					return true
				end
			else
				return true
			end
		end
	end
	if farmTarget then return true end
	pick = pickBest()
	if pick and pick.Model and pick.Root and pick.Root.Parent then
		farmTarget = pick.Model
		if humanoid and humanoid.Parent then
			farmOldAutoRotate = humanoid.AutoRotate
			humanoid.AutoRotate = false
		end
		if retargetMethod == "Tele" then
			farmTeleportTo(farmTarget)
			farmApproaching = false
		elseif retargetMethod == "Tween" then
			farmApproaching = true
		else
			--// "Auto": tele khi còn quá xa (chưa trong phạm vi engage), còn lại tiếp cận.
			if pick.Distance > FARM_ENGAGE_DISTANCE then
				farmTeleportTo(farmTarget)
				farmApproaching = false
			else
				farmApproaching = true
			end
		end
		return true
	end
	if not dungeon then initializeRooms() end
	return false
end

function shared.FarmStep(deltaTime)
	if not inLobby and farmEnabled and not teleporting then moveFarmTarget(deltaTime) end
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

--// Số enemy còn sống đang track trong màn (cập nhật thời gian thực)
function shared.GetEnemyCount()
	return enemyCount
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

function shared.GetOrbitTeleStep()
	return orbitTeleStepDeg
end

function shared.SetOrbitTeleStep(value)
	orbitTeleStepDeg = value
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

--// Dungeon name watcher: theo dõi tên dungeon thật. Ở lobby workspace.dungeonName
--// mang placeholder "unknown" (hoặc rỗng) -> coi như CHƯA vào dungeon (trả nil).
local function readDungeonName()
	local Workspace = game:GetService("Workspace")
	for _, obj in ipairs(Workspace:GetDescendants()) do
		if obj.Name == "dungeonName" and obj:IsA("ValueBase") then
			local value = obj.Value
			if type(value) == "string" then
				local trimmed = string.gsub(value, "%s+", "")
				if trimmed ~= "" and string.lower(trimmed) ~= DUNGEON_NAME_PLACEHOLDER then
					return value
				end
			end
		end
	end
	return nil
end

task.spawn(function()
	while true do
		task.wait(GUI_UPDATE_INTERVAL)
		local name = readDungeonName()
		if name ~= currentDungeonName then
			currentDungeonName = name
			if name then shared.ResetBossIndex() end
			for i = #dungeonNameCallbacks, 1, -1 do
				pcall(dungeonNameCallbacks[i], name)
			end
		end
	end
end)

--// Xác định trạng thái lobby dựa trên tên dungeon: có tên dungeon thật = đang ở
--// trong dungeon; chưa có (placeholder "unknown"/rỗng) = lobby. Không phụ thuộc
--// nút start ngoài UI.
local function determineLobbyState()
	return not (currentDungeonName and #currentDungeonName > 0)
end

--// Lobby watcher: lobby = startButton hiện diện khi đang ở ngoài dungeon
task.spawn(function()
	while true do
		task.wait(GUI_UPDATE_INTERVAL)
		local lobby = determineLobbyState()
		if lobby ~= inLobby then
			inLobby = lobby
			for i = #lobbyCallbacks, 1, -1 do
				pcall(lobbyCallbacks[i], inLobby)
			end
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

function shared.GetCurrentBossIndex()
	return bossIndex
end

--// Xác định loại mục tiêu đang farm để áp setting combat theo context:
--// "Mob" (quái thường) hoặc "Boss1"/"Boss2"/"Boss3" theo thứ tự boss hiện tại.
function shared.GetCombatTargetKey()
	if not bossActive then return "Mob" end
	local idx = math.clamp(bossIndex, 1, 3)
	return "Boss" .. tostring(idx)
end

function shared.ResetBossIndex()
	bossIndex = 0
	for i = #bossIndexCallbacks, 1, -1 do
		pcall(bossIndexCallbacks[i], bossIndex)
	end
end

function shared.OnBossIndexChanged(callback)
	if type(callback) ~= "function" then return function() end end
	table.insert(bossIndexCallbacks, callback)
	return function()
		for i, cb in ipairs(bossIndexCallbacks) do
			if cb == callback then table.remove(bossIndexCallbacks, i) break end
		end
	end
end

--// ---- Dungeon name ----
function shared.GetCurrentDungeonName()
	return currentDungeonName
end

function shared.OnDungeonNameChanged(callback)
	if type(callback) ~= "function" then return function() end end
	table.insert(dungeonNameCallbacks, callback)
	return function()
		for i, cb in ipairs(dungeonNameCallbacks) do
			if cb == callback then table.remove(dungeonNameCallbacks, i) break end
		end
	end
end

--// ---- Lobby / Dungeon state ----
function shared.IsInLobby()
	return inLobby
end

function shared.OnLobbyChanged(callback)
	if type(callback) ~= "function" then return function() end end
	table.insert(lobbyCallbacks, callback)
	return function()
		for i, cb in ipairs(lobbyCallbacks) do
			if cb == callback then table.remove(lobbyCallbacks, i) break end
		end
	end
end

--// Boss GUI tracker: theo dõi PlayerGui để phát hiện bossHealth xuất hiện/biến mất
local bossHealthRef = nil
local function setBossActive(active)
	if bossActive == active then return end
	bossActive = active
	if active then
		bossIndex += 1
		for i = #bossIndexCallbacks, 1, -1 do
			pcall(bossIndexCallbacks[i], bossIndex)
		end
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
