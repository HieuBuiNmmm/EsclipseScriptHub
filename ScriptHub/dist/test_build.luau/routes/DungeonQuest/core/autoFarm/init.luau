type Zone__DARKLUA_TYPE_a = "Lobby" | "Dungeon" | "Global"

type ZoneRegistration__DARKLUA_TYPE_b = {
	Name: string,
	Zone: Zone__DARKLUA_TYPE_a,
	OnEnter: (() -> ())?,
	OnLeave: (() -> ())?
}
local __DIST __DIST={cache={}, load=function(m)if not __DIST.cache[m]then __DIST.cache[m]={c=__DIST[m]()}end return __DIST.cache[m].c end}do function __DIST.a()-- Cache toàn bộ services + tham chiếu LocalPlayer dùng chung cho DungeonQuest.

--// Services

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")

--// Player
local player = Players.LocalPlayer
if not player then
	local timeoutClock = os.clock() + 5
	repeat
		player = Players.LocalPlayer
		if player then break end
		task.wait(0.1)
	until os.clock() > timeoutClock
end

return {
	Players = Players,
	UserInputService = UserInputService,
	RunService = RunService,
	VirtualInputManager = VirtualInputManager,
	player = player,
}
end function __DIST.b()-- Owns resources that must be released when the hub is unloaded or executed again.

local lifecycle = {
	cleaned = false,
	callbacks = {},
}

function lifecycle.Register(callback)
	if type(callback) ~= "function" then return function() end end
	if lifecycle.cleaned then
		pcall(callback)
		return function() end
	end

	table.insert(lifecycle.callbacks, callback)
	return function()
		for index, registered in ipairs(lifecycle.callbacks) do
			if registered == callback then
				table.remove(lifecycle.callbacks, index)
				break
			end
		end
	end
end

function lifecycle.Cleanup()
	if lifecycle.cleaned then return end
	lifecycle.cleaned = true
	for index = #lifecycle.callbacks, 1, -1 do
		pcall(lifecycle.callbacks[index])
	end
	table.clear(lifecycle.callbacks)
end

function lifecycle.IsActive()
	return not lifecycle.cleaned
end

lifecycle.OnCleanup = lifecycle.Register

return lifecycle
end function __DIST.c()-- Engine dùng chung cho DungeonQuest: quản lý state, tracking dungeon/kẻ địch,
-- speed và các API cho module chuyên biệt (webhook, ESP...)
-- thao tác lên module này để tránh circular dependency.

--// Imports

local services = __DIST.load('a')
local lifecycle = __DIST.load('b')

--// References
local player = services.player

--// Constants
local AUTO_KEY_HOLD_TIME = 0.05

--// Folder in ReplicatedStorage that contains enemy projectile models for ESP.
local PROJECTILE_FOLDER = "enemyProjectiles"

local GUI_UPDATE_INTERVAL = 0.5

--// Table
local shared = {}

--// State
local humanoid = nil
local rootPart = nil

local enabled = false
local fastSpeed = 16
local normalSpeed = 16
local instantAccelEnabled = true
local isSettingSpeed = false

local dungeonStartTime = nil

--// Boss state (dựa trên "boss room": room chỉ chứa đúng 1 enemy).
--// Boss room = room có duy nhất 1 quái; bossActive = đang ở boss room.
local bossActive = false
local bossCallbacks = {}
local bossRoomRef = nil --// room model của boss hiện tại (tránh đếm lại cùng room)

--// Chỉ số boss hiện tại trong 1 dungeon (thường 1 dungeon có 3 boss).
--// Tăng 1 mỗi lần bước vào boss room mới (boss 1 = 1); reset về 0 khi vào dungeon mới.
local bossIndex = 0
local bossIndexCallbacks = {}

--// Room index: số room hiện tại, lấy từ TÊN room có quái ("room<so>").
--// Reset khi vào dungeon mới.
local roomIndex = 0
local roomIndexCallbacks = {}

local dungeon = nil
local trackedRooms = {}
local trackedEnemies = {}
local roomConnections = {}
local enemyConnections = {}
local pendingModels = {}
local enemyCount = 0
--// Thông báo khi tập enemy track THAY ĐỔI (thêm/xoá). Dùng cho luồng event-driven:
--// module pathfinder thay vì poll theo interval thì subscribe sự kiện này để recompute target tức thì.
local enemyChangedCallbacks = {}
local function fireEnemyChanged()
	for i = #enemyChangedCallbacks, 1, -1 do
		pcall(enemyChangedCallbacks[i])
	end
end

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
local initializeRooms
local resetDungeon
local refreshRoomIndex
local tryCaptureBossSpawnPosition
local bossInitialSpawnPos = nil

--// Respawn hooks & Invulnerability tracking
local respawnCallbacks = {}
local cleanupConnections = {}
local speedConnection = nil
local diedConnection = nil
local lastRespawnTime = 0
local respawnProtectionDuration = 4.0 -- Thời gian bất tử mặc định sau khi hồi sinh (giây)
local wasDead = false

local function trackCleanupConnection(connection)
	if connection then table.insert(cleanupConnections, connection) end
	return connection
end

function shared.OnRespawn(callback)
	table.insert(respawnCallbacks, callback)
end

function shared.GetLastRespawnTime()
	return lastRespawnTime
end

function shared.GetRespawnProtectionDuration()
	return respawnProtectionDuration
end

function shared.SetRespawnProtectionDuration(seconds)
	if type(seconds) == "number" and seconds >= 0 then
		respawnProtectionDuration = seconds
	end
end

function shared.GetRespawnProtectionRemaining()
	if lastRespawnTime == 0 then return 0 end
	local elapsed = os.clock() - lastRespawnTime
	local remaining = respawnProtectionDuration - elapsed
	return math.max(0, remaining)
end

function shared.IsJustRespawned(gracePeriodSeconds)
	local period = gracePeriodSeconds or respawnProtectionDuration
	if lastRespawnTime == 0 then return false end
	return (os.clock() - lastRespawnTime) <= period
end

function shared.WasDead()
	return wasDead
end

function shared.IsDead()
	local char = player and player.Character
	if not char or not char.Parent then return true end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if not hum or hum.Health <= 0 then return true end
	return false
end

--// Kiểm tra xem nhân vật hiện tại có đang trong trạng thái BẤT TỬ (Invulnerable) không
--// Chỉ tính dựa trên Bộ đếm thời gian bảo vệ sau khi hồi sinh (Respawn Protection Duration)
function shared.IsInvulnerable()
	local char = player and player.Character
	if not char or not char.Parent then return false, nil end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then
		return false, nil -- Khi đã chết thì không tính là bất tử
	end

	-- Kiểm tra Thời gian bảo vệ sau khi hồi sinh thực sự (chỉ tính qua CharacterAdded)
	local remaining = shared.GetRespawnProtectionRemaining()
	if remaining > 0 then
		return true, ("Respawn Shield (%.1fs)"):format(remaining)
	end

	return false, nil
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
	fireEnemyChanged()
	refreshRoomIndex()
end

--// Tìm room (con trực tiếp của dungeon) chứa model.
local function getEnemyRoom(model)
	if not dungeon or not model then return nil end
	local parent = model.Parent
	while parent do
		if parent == dungeon then return nil end
		if parent.Parent == dungeon and (parent:IsA("Folder") or parent:IsA("Model")) then
			return parent
		end
		parent = parent.Parent
	end
	return nil
end

local function trackEnemy(enemy)
	if not isValidEnemy(enemy) or trackedEnemies[enemy] then return end
	local root = getModelRoot(enemy)
	local enemyHumanoid = enemy:FindFirstChildOfClass("Humanoid")
	if not root or not enemyHumanoid then return end

	trackedEnemies[enemy] = { Model = enemy, Root = root, Humanoid = enemyHumanoid, Room = getEnemyRoom(enemy) }
	enemyCount += 1
	enemyConnections[enemy] = { Died = enemyHumanoid.Died:Connect(function() untrackEnemy(enemy) end) }
	if bossActive and not bossInitialSpawnPos then
		if tryCaptureBossSpawnPosition then
			tryCaptureBossSpawnPosition()
		end
	end
	fireEnemyChanged()
	refreshRoomIndex()
end

local function waitAndTrackModel(model)
	if not model then return end
	if isValidEnemy(model) then trackEnemy(model); return end
	if pendingModels[model] then return end
	pendingModels[model] = true
	task.spawn(function()
		local timeout = os.clock() + 2
		while model.Parent and os.clock() < timeout do
			if isValidEnemy(model) then
				pendingModels[model] = nil
				trackEnemy(model)
				return
			end
			task.wait(0.03)
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

	roomIndex = 0
	for i = #roomIndexCallbacks, 1, -1 do
		pcall(roomIndexCallbacks[i], roomIndex)
	end

	for _, room in ipairs(dungeon:GetChildren()) do
		if room:IsA("Folder") or room:IsA("Model") then trackRoom(room) end
	end

	--// Theo dõi cấp DUNGEON (không chỉ từng room): bắt được kẻ địch/room được thêm
	--// vào sau khi init (phòng sinh sau, respawn trong room chưa được track...).
	--// Không dùng DescendantAdded riêng cho từng room để tránh phát hiện trùng.
	roomConnections[dungeon] = {
		Added = dungeon.DescendantAdded:Connect(function(object)
			if object:IsA("Model") then
				waitAndTrackModel(object)
			elseif object:IsA("Humanoid") then
				local possibleModel = object:FindFirstAncestorOfClass("Model")
				if possibleModel then waitAndTrackModel(possibleModel) end
			end
		end),
		Removed = dungeon.DescendantRemoving:Connect(function(object)
			if object:IsA("Model") then untrackEnemy(object) end
		end),
	}
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
	shared.ResetBossIndex()
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

--// Speed state (Speed tab thao tác lên đây)
function shared.SetFastSpeed(value)
	fastSpeed = value
	if enabled and humanoid and humanoid.Parent then
		if humanoid.WalkSpeed < fastSpeed then
			isSettingSpeed = true
			humanoid.WalkSpeed = fastSpeed
			isSettingSpeed = false
		end
	end
end

function shared.SetSpeedEnabled(state)
	enabled = state
	if humanoid and humanoid.Parent then
		isSettingSpeed = true
		if enabled then
			if humanoid.WalkSpeed < fastSpeed then
				humanoid.WalkSpeed = fastSpeed
			end
		else
			humanoid.WalkSpeed = normalSpeed
		end
		isSettingSpeed = false
	end
end

function shared.IsSpeedEnabled()
	return enabled
end

function shared.GetFastSpeed()
	return fastSpeed
end

function shared.SetInstantAccelEnabled(state)
	instantAccelEnabled = state and true or false
end

function shared.IsInstantAccelEnabled()
	return instantAccelEnabled
end

--// Humanoid setup
local function connectSpeedListener()
	if speedConnection then
		speedConnection:Disconnect()
		speedConnection = nil
	end
	if not humanoid or not humanoid.Parent then return end
	speedConnection = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
		if isSettingSpeed then return end
		if not humanoid or not humanoid.Parent then return end
		local curSpeed = humanoid.WalkSpeed
		if enabled then
			-- Floor Speed / Anti-Slow: Nếu tốc độ hiện tại thấp hơn fastSpeed (ví dụ 16 hoặc bị làm chậm),
			-- ta ép lên mức sàn fastSpeed. Nhưng nếu game buff tốc cao hơn (ví dụ skill buff lên 24),
			-- ta giữ nguyên để người chơi được hưởng trọn vẹn buff của game mà không bị bóp nghẹt.
			if curSpeed < fastSpeed then
				isSettingSpeed = true
				humanoid.WalkSpeed = fastSpeed
				isSettingSpeed = false
			end
		else
			normalSpeed = curSpeed
		end
	end)
end

function shared.SetHumanoid(character)
	if not character then return end
	local newHumanoid = character:WaitForChild("Humanoid", 10)
	if not newHumanoid then return end

	humanoid = newHumanoid
	rootPart = character:WaitForChild("HumanoidRootPart", 10) or character.PrimaryPart
	normalSpeed = humanoid.WalkSpeed
	if enabled and humanoid.WalkSpeed < fastSpeed then
		isSettingSpeed = true
		humanoid.WalkSpeed = fastSpeed
		isSettingSpeed = false
	end

	if diedConnection then
		diedConnection:Disconnect()
		diedConnection = nil
	end
	diedConnection = humanoid.Died:Connect(function()
		wasDead = true
	end)

	trackCleanupConnection(humanoid.HealthChanged:Connect(function(health)
		if health <= 0 then
			wasDead = true
		elseif wasDead and health > 0 then
			wasDead = false
		end
	end))
end

--// Instant Movement (Acceleration)
local function updateInstantMovement()
	if not lifecycle.IsActive() then return end
	if not instantAccelEnabled then return end
	if not humanoid or not humanoid.Parent or humanoid.Health <= 0 or humanoid.Sit then return end
	if not rootPart or not rootPart.Parent then
		local char = player and player.Character
		rootPart = char and char:FindFirstChild("HumanoidRootPart")
		if not rootPart then return end
	end
	if rootPart.Anchored then return end

	local moveDir = humanoid.MoveDirection
	local curVel = rootPart.AssemblyLinearVelocity

	if moveDir.Magnitude > 0.05 then
		local targetSpeed = enabled and math.max(fastSpeed, humanoid.WalkSpeed) or humanoid.WalkSpeed
		rootPart.AssemblyLinearVelocity = Vector3.new(
			moveDir.X * targetSpeed,
			curVel.Y,
			moveDir.Z * targetSpeed
		)
	end
end

if services.RunService then
	local simEvent = services.RunService.PreSimulation or services.RunService.Heartbeat
	if simEvent then
		trackCleanupConnection(simEvent:Connect(updateInstantMovement))
	end
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

--// Ensures dungeon tracking is ready.
function shared.ReadyDungeon()
	if not dungeon and not initializeRooms() then return false end
	return true
end

function shared.GetHumanoid()
	return humanoid
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

--// Trả về mảng dữ liệu enemy đang track (Model, Root, Humanoid) để ESP Enemy dùng.
function shared.GetTrackedEnemyData()
	local out = {}
	for model, data in pairs(trackedEnemies) do
		if data and data.Root and data.Root.Parent then
			out[#out + 1] = data
		end
	end
	return out
end

--// Event-driven: đăng ký callback chạy khi tập enemy track thay đổi (thêm/xoá).
--// Trả về hàm huỷ callback.
function shared.OnEnemyChanged(callback)
	if type(callback) ~= "function" then return function() end end
	table.insert(enemyChangedCallbacks, callback)
	return function()
		for i, cb in ipairs(enemyChangedCallbacks) do
			if cb == callback then table.remove(enemyChangedCallbacks, i) break end
		end
	end
end

--// Returns enemy projectile names from ReplicatedStorage.enemyProjectiles for ESP.
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

function shared.GetKeyHoldTime()
	return AUTO_KEY_HOLD_TIME
end

--// Initialization: character hiện tại + listeners
if player and player.Character and player.Character.Parent then
	shared.SetHumanoid(player.Character)
	connectSpeedListener()
else
	local character = player and player.CharacterAdded and task.spawn(function()
		local char = player.CharacterAdded:Wait()
		if char and lifecycle.IsActive() then shared.SetHumanoid(char); connectSpeedListener() end
	end)
end

if player then
	trackCleanupConnection(player.CharacterAdded:Connect(function(character)
		local ok, err = pcall(function()
			if not character then return end
			lastRespawnTime = os.clock()
			shared.SetHumanoid(character)
			connectSpeedListener()

			for _, callback in ipairs(respawnCallbacks) do
				pcall(callback)
			end
		end)
		if not ok then warn("[Shared] respawn handler error:", tostring(err)) end
	end))
end

--// Dungeon watcher
task.spawn(function()
	while lifecycle.IsActive() do
		task.wait(GUI_UPDATE_INTERVAL)
		local currentDungeon = workspace:FindFirstChild("dungeon")
		if dungeon and currentDungeon ~= dungeon then
			resetDungeon()
		elseif not dungeon and currentDungeon then
			initializeRooms()
		end
		--// Cập nhật room hiện tại khi dungeon/enemy thay đổi.
		refreshRoomIndex()
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
	while lifecycle.IsActive() do
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
	while lifecycle.IsActive() do
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

--// Quét trực tiếp toàn bộ dungeon để bắt kịp kẻ địch / boss mới xuất hiện
local function scanDungeonEnemies()
	if not dungeon then dungeon = workspace:FindFirstChild("dungeon") end
	if not dungeon then return end
	local ok = pcall(function()
		for _, room in ipairs(dungeon:GetChildren()) do
			if room:IsA("Folder") or room:IsA("Model") then
				if room:IsA("Model") and isValidEnemy(room) then
					waitAndTrackModel(room)
				end
				for _, object in ipairs(room:GetDescendants()) do
					if object:IsA("Model") then
						waitAndTrackModel(object)
					end
				end
			end
		end
		cleanupEnemies()
	end)
	if not ok then
		warn("[EnemyTracker] scanDungeonEnemies error")
	end
end

function shared.ForceRescan()
	scanDungeonEnemies()
end

--// Re-scan định kỳ: reconcile trackedEnemies với nội dung dungeon hiện tại.
--// Đảm bảo bắt được kẻ địch mà cơ chế event (DescendantAdded) bỏ lỡ do timing
--// (Humanoid Health = 0 lúc sinh, room tạo sau init...) -> hết "không thấy kẻ địch".
local lastRescan = 0
local RESCAN_INTERVAL = 2
task.spawn(function()
	while lifecycle.IsActive() do
		task.wait(RESCAN_INTERVAL)
		local now = os.clock()
		if now - lastRescan < RESCAN_INTERVAL then continue end
		lastRescan = now
		scanDungeonEnemies()
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

--// Xác định loại mục tiêu đang đánh để áp setting theo context:
--// "Mob" (quái thường) hoặc "Boss1"/"Boss2"/"Boss3" theo thứ tự boss hiện tại.
function shared.GetCombatTargetKey()
	if not bossActive then return "Mob" end
	local idx = math.clamp(bossIndex, 1, 3)
	return "Boss" .. tostring(idx)
end

function shared.ResetBossIndex()
	local wasBoss = bossActive
	bossIndex = 0
	bossActive = false
	bossInitialSpawnPos = nil
	for i = #bossIndexCallbacks, 1, -1 do
		pcall(bossIndexCallbacks[i], bossIndex)
	end
	if wasBoss then
		for i = #bossCallbacks, 1, -1 do
			pcall(bossCallbacks[i], false)
		end
	end
	refreshRoomIndex()
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

--// Đọc số room từ tên (room1 -> 1, room12 -> 12...). Trả 0 nếu không khớp.
local function parseRoomNumber(name)
	if type(name) ~= "string" then return 0 end
	local lower = string.lower(name)
	local bossMatch = string.match(lower, "boss.*(%d+)")
	if bossMatch then
		return 100 + (tonumber(bossMatch) or 1)
	end
	if string.find(lower, "boss") then
		return 100 + math.max(1, bossIndex)
	end
	local number = string.match(name, "^room(%d+)$")
	if not number then return 0 end
	return tonumber(number) or 0
end

--// Tính room hiện tại: room chứa enemy đang track còn sống.
--// Game clear theo kiểu tuần tự: xong quái room này mới spawn quái room sau, nên
--// tại 1 thời điểm chỉ có đúng 1 room có quái -> room của bất kỳ quái đang track
--// chính là room hiện tại (không cần scan theo khoảng cách).
--// Room nhận diện qua TÊN "room<so>" (room1, room2...). Không có enemy/dungeon -> 0.
--// Fallback phòng Boss: nếu bossActive = true, trả về 100 + math.max(1, bossIndex) (101, 102...).
local function computeRoomIndex()
	if not dungeon then return 0 end
	for model, data in pairs(trackedEnemies) do
		if data and data.Room then
			local idx = parseRoomNumber(data.Room.Name)
			if idx > 0 then return idx end
		end
	end
	if bossActive then
		return 100 + math.max(1, bossIndex)
	end
	return 0
end

--// Đồng bộ roomIndex hiện tại, fire callback nếu đổi.
refreshRoomIndex = function()
	local newIndex = computeRoomIndex()
	if newIndex == roomIndex then return end
	roomIndex = newIndex
	for i = #roomIndexCallbacks, 1, -1 do
		pcall(roomIndexCallbacks[i], roomIndex)
	end
end

function shared.GetCurrentRoomIndex()
	return roomIndex
end

function shared.OnRoomIndexChanged(callback)
	if type(callback) ~= "function" then return function() end end
	table.insert(roomIndexCallbacks, callback)
	return function()
		for i, cb in ipairs(roomIndexCallbacks) do
			if cb == callback then table.remove(roomIndexCallbacks, i) break end
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

--// ---- Player Real Level (dùng cho Webhook, không bị ảnh hưởng bởi UI masking) ----
local realPlayerLevel = nil

function shared.SetRealPlayerLevel(level)
	local num = tonumber(tostring(level or ""):match("%d+"))
	if num and num > 0 then
		realPlayerLevel = tostring(num)
		_G.RealPlayerLevel = realPlayerLevel
	end
end

function shared.GetRealPlayerLevel()
	return realPlayerLevel or _G.RealPlayerLevel
end

--// Boss GUI tracker: theo dõi PlayerGui để phát hiện bossHealth xuất hiện/biến mất
local bossHealthRef = nil

tryCaptureBossSpawnPosition = function()
	if not bossActive or bossInitialSpawnPos ~= nil then return end
	for enemy, data in pairs(trackedEnemies) do
		if data and data.Root and data.Root.Parent then
			local isBossCandidate = false
			if data.Room and type(data.Room.Name) == "string" and string.find(string.lower(data.Room.Name), "boss") then
				isBossCandidate = true
			elseif string.find(string.lower(enemy.Name), "boss") then
				isBossCandidate = true
			elseif enemy.Parent and string.find(string.lower(enemy.Parent.Name), "boss") then
				isBossCandidate = true
			end

			if isBossCandidate then
				bossInitialSpawnPos = data.Root.Position
				return
			end
		end
	end

	for _, data in pairs(trackedEnemies) do
		if data and data.Root and data.Root.Parent then
			bossInitialSpawnPos = data.Root.Position
			return
		end
	end
end

local function setBossActive(active)
	if bossActive == active then return end
	bossActive = active
	if active then
		bossIndex += 1
		bossInitialSpawnPos = nil
		scanDungeonEnemies()
		tryCaptureBossSpawnPosition()
		for i = #bossIndexCallbacks, 1, -1 do
			pcall(bossIndexCallbacks[i], bossIndex)
		end
	else
		bossInitialSpawnPos = nil
	end
	for i = #bossCallbacks, 1, -1 do
		pcall(bossCallbacks[i], bossActive)
	end
	refreshRoomIndex()
end

function shared.GetBossSpawnPosition()
	if bossInitialSpawnPos then
		return bossInitialSpawnPos
	end
	tryCaptureBossSpawnPosition()
	return bossInitialSpawnPos
end

function shared.SetBossSpawnPosition(pos)
	bossInitialSpawnPos = pos
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
			if bossHealthRef:IsA("ScreenGui") then
				trackCleanupConnection(bossHealthRef:GetPropertyChangedSignal("Enabled"):Connect(scanBossGui))
			elseif bossHealthRef:IsA("GuiObject") then
				trackCleanupConnection(bossHealthRef:GetPropertyChangedSignal("Visible"):Connect(scanBossGui))
			end
		end
		local visible = if found:IsA("ScreenGui") then found.Enabled elseif found:IsA("GuiObject") then found.Visible else true
		setBossActive(visible)
	else
		bossHealthRef = nil
		setBossActive(false)
	end
end

task.spawn(function()
	if not player then return end
	local playerGui = player:WaitForChild("PlayerGui", 30)
	if not playerGui then return end

	trackCleanupConnection(playerGui.DescendantAdded:Connect(scanBossGui))
	trackCleanupConnection(playerGui.DescendantRemoving:Connect(scanBossGui))
	scanBossGui()

	--// Poll an toàn phòng trường hợp DescendantRemoving bỏ sót khi GUI bị xóa cục bộ
	while lifecycle.IsActive() and task.wait(0.5) do
		scanBossGui()
	end
end)

--// ControlModule Management (ngăn Roblox ControlModule ghi đè Move(0,0,0) mỗi frame)
local controlsModule = nil
local activeControlClaims = {}

local function getPlayerControls()
	if controlsModule then return controlsModule end
	pcall(function()
		local lp = player or game:GetService("Players").LocalPlayer
		local pScripts = lp and lp:FindFirstChild("PlayerScripts")
		local pMod = pScripts and pScripts:FindFirstChild("PlayerModule")
		if pMod then
			controlsModule = require(pMod):GetControls()
		end
	end)
	return controlsModule
end

function shared.DisableControls(tag)
	tag = tag or "default"
	activeControlClaims[tag] = true
	local ctrl = getPlayerControls()
	if ctrl and type(ctrl.Disable) == "function" then
		pcall(function() ctrl:Disable() end)
	end
end

function shared.EnableControls(tag)
	tag = tag or "default"
	activeControlClaims[tag] = nil
	if next(activeControlClaims) ~= nil then
		return
	end
	local ctrl = getPlayerControls()
	if ctrl and type(ctrl.Enable) == "function" then
		pcall(function() ctrl:Enable() end)
	end
end

lifecycle.Register(function()
	if speedConnection then speedConnection:Disconnect(); speedConnection = nil end
	for _, connection in ipairs(cleanupConnections) do
		pcall(function() connection:Disconnect() end)
	end
	table.clear(cleanupConnections)
	table.clear(activeControlClaims)
	local ctrl = getPlayerControls()
	if ctrl and type(ctrl.Enable) == "function" then
		pcall(function() ctrl:Enable() end)
	end
	resetDungeon()
end)

--// Table
return shared
end function __DIST.d()-- Coordinator (DungeonQuest): Điều phối loại trừ lẫn nhau giữa các hệ thống điều khiển nhân vật.
-- Module lá — không require ai để tránh cycle import bị darklua (bundler) phát hiện.


local coordinator = {}
local features = {}
local locked = false

--// Khóa coordinator: dùng trong quá trình nạp config (LoadConfig) để tránh
--// các toggle cũ / toggle thành phần đè chết toggle master hệ thống.
function coordinator.SetLocked(state)
	locked = state and true or false
end

function coordinator.IsLocked()
	return locked
end

--// Đăng ký 1 hệ thống có thể bị tắt độc quyền. setEnabled(false) được gọi khi
--// một hệ thống khác bật lên. isEnabled() trả về trạng thái đang chạy.
function coordinator.Register(name, setEnabled, isEnabled)
	if type(name) ~= "string" or type(setEnabled) ~= "function" or type(isEnabled) ~= "function" then return end
	features[name] = {
		setEnabled = setEnabled,
		isEnabled = isEnabled,
	}
end

--// Bật độc quyền 1 hệ thống: tự động TẮT toàn bộ hệ thống khác đang chạy trước đó.
function coordinator.EnableExclusive(name)
	if locked then return end
	for otherName, feat in pairs(features) do
		if otherName ~= name and feat.isEnabled() then
			pcall(feat.setEnabled, false)
		end
	end
end

function coordinator.IsEnabled(name)
	local feat = features[name]
	return feat ~= nil and feat.isEnabled()
end

return coordinator end function __DIST.e()-- ZoneGuard (DungeonQuest): Bộ điều phối & bảo vệ không gian hoạt động (Lobby vs Dungeon).
-- Đảm bảo 100% các tính năng chỉ chạy đúng trong không gian được chỉ định,
-- tự động đóng băng tài nguyên khi ở sai môi trường và ngăn chặn các hành vi ngoài ý muốn.


local lifecycle = __DIST.load('b')
local shared = __DIST.load('c')

local zoneGuard = {}

--// State









local registrations: { [string]: ZoneRegistration__DARKLUA_TYPE_b } = {}
local zoneChangedCallbacks: { (Zone__DARKLUA_TYPE_a, Zone__DARKLUA_TYPE_a) -> () } = {}
local currentZone: Zone__DARKLUA_TYPE_a = "Lobby"

--// Lấy không gian hiện tại
function zoneGuard.GetCurrentZone(): Zone__DARKLUA_TYPE_a
	return shared.IsInLobby() and "Lobby" or "Dungeon"
end

--// Kiểm tra xem hiện tại có thuộc Zone mong muốn không
function zoneGuard.IsInZone(expectedZone: Zone__DARKLUA_TYPE_a): boolean
	if expectedZone == "Global" then return true end
	return zoneGuard.GetCurrentZone() == expectedZone
end

function zoneGuard.IsLobby(): boolean
	return zoneGuard.GetCurrentZone() == "Lobby"
end

function zoneGuard.IsDungeon(): boolean
	return zoneGuard.GetCurrentZone() == "Dungeon"
end

--// Đăng ký 1 module với Zone cụ thể
function zoneGuard.Register(reg: ZoneRegistration__DARKLUA_TYPE_b)
	if not reg or type(reg.Name) ~= "string" or not reg.Zone then return end
	registrations[reg.Name] = reg

	-- Nếu đang ở đúng zone tại thời điểm đăng ký -> gọi OnEnter ngay lập tức
	if zoneGuard.IsInZone(reg.Zone) and reg.OnEnter then
		task.spawn(function()
			pcall(reg.OnEnter)
		end)
	end
end

function zoneGuard.Unregister(name: string)
	registrations[name] = nil
end

--// Lớp bọc bảo vệ (Guard Wrapper): Chỉ cho phép hàm thực thi khi ở đúng Zone
function zoneGuard.Guard<T...>(zone: Zone__DARKLUA_TYPE_a, fn: (T...) -> any, fallbackValue: any?): (T...) -> any
	return function(...)
		if not zoneGuard.IsInZone(zone) then
			return fallbackValue
		end
		return fn(...)
	end
end

--// Lắng nghe sự kiện chuyển đổi Zone
function zoneGuard.OnZoneChanged(callback: (newZone: Zone__DARKLUA_TYPE_a, oldZone: Zone__DARKLUA_TYPE_a) -> ())
	if type(callback) == "function" then
		table.insert(zoneChangedCallbacks, callback)
	end
end

--// Xử lý chuyển đổi Zone tập trung
local function handleZoneTransition(inLobby: boolean)
	local newZone: Zone__DARKLUA_TYPE_a = inLobby and "Lobby" or "Dungeon"
	if newZone == currentZone then return end

	local oldZone = currentZone
	currentZone = newZone

	-- 1. Gọi OnLeave cho các hệ thống thuộc Zone cũ
	for _, reg in pairs(registrations) do
		if reg.Zone ~= "Global" and reg.Zone == oldZone and reg.OnLeave then
			task.spawn(function()
				pcall(reg.OnLeave)
			end)
		end
	end

	-- 2. Gọi OnEnter cho các hệ thống thuộc Zone mới
	for _, reg in pairs(registrations) do
		if reg.Zone ~= "Global" and reg.Zone == newZone and reg.OnEnter then
			task.spawn(function()
				pcall(reg.OnEnter)
			end)
		end
	end

	-- 3. Bắn sự kiện cho các listeners bên ngoài
	for _, cb in ipairs(zoneChangedCallbacks) do
		task.spawn(function()
			pcall(cb, newZone, oldZone)
		end)
	end
end

-- Khởi tạo ban đầu
currentZone = zoneGuard.GetCurrentZone()

-- Lắng nghe từ shared
shared.OnLobbyChanged(function(inLobby)
	handleZoneTransition(inLobby)
end)

lifecycle.Register(function()
	table.clear(registrations)
	table.clear(zoneChangedCallbacks)
end)

return zoneGuard
end function __DIST.f()-- Auto Farm System – Component A & B: Enemy Scanner & Enemy Validator
-- Spec: Sections 3 & 4 (Roblox_Target_Movement_System_AI_Spec.txt)


local services = __DIST.load('a')
local shared = __DIST.load('c')
local player = services.player

local scanner = {}

--// B. Enemy Validation (Section 4)
-- An enemy is valid only if:
-- 1. Enemy still exists (model and model.Parent).
-- 2. Enemy is a valid enemy entity (model ~= player.Character).
-- 3. Enemy is alive (Humanoid.Health > 0).
-- 4. Required movement/root component exists.
-- 5. Enemy belongs to a valid/relevant room.
function scanner.Validate(enemyData)
	if not enemyData then return false end
	local model = enemyData.Model
	if not model or not model.Parent or model == player.Character then return false end

	local humanoid = enemyData.Humanoid
	if not humanoid or not humanoid.Parent then
		humanoid = model:FindFirstChildOfClass("Humanoid")
		enemyData.Humanoid = humanoid
	end
	if not humanoid or humanoid.Health <= 0 then return false end

	local root = enemyData.Root
	if not root or not root.Parent then
		root = model:FindFirstChild("HumanoidRootPart") or model.PrimaryPart
		if not root then
			for _, obj in ipairs(model:GetDescendants()) do
				if obj:IsA("BasePart") then
					root = obj
					break
				end
			end
		end
		if not root then return false end
		enemyData.Root = root
	end

	return true
end

--// A. Enemy Scanner (Section 3)
-- Scans all rooms, collects enemy entities, validates them, and produces ValidEnemyList.
function scanner.Scan()
	local validList = {}
	local tracked = shared.GetTrackedEnemyData()
	for _, data in ipairs(tracked) do
		if scanner.Validate(data) then
			table.insert(validList, data)
		end
	end

	-- Nếu chưa thấy mục tiêu nào (hoặc đang chuyển giao sang phòng Boss), ép buộc quét lại dungeon ngay lập tức
	if #validList == 0 and shared.ForceRescan then
		shared.ForceRescan()
		tracked = shared.GetTrackedEnemyData()
		for _, data in ipairs(tracked) do
			if scanner.Validate(data) then
				table.insert(validList, data)
			end
		end
	end

	return validList
end

return scanner
end function __DIST.g()-- Target Movement System – Component C: Target Selector
-- Selects the nearest valid enemy instantaneously (0ms, no Pathfinding latency)


local selector = {}

--// Evaluates all valid enemies and selects the one nearest to the player
function selector.SelectBestTarget(playerPos, validEnemies, cancelCheck)
	local bestTarget = nil
	local bestDistSq = math.huge
	local bestPos = nil

	for _, enemyData in ipairs(validEnemies) do
		if cancelCheck and cancelCheck() then
			return nil, nil, nil, nil, math.huge
		end

		local root = enemyData.Root
		if root and root.Parent then
			local ePos = root.Position
			local dx = ePos.X - playerPos.X
			local dz = ePos.Z - playerPos.Z
			local distSq = dx * dx + dz * dz

			if distSq < bestDistSq then
				bestDistSq = distSq
				bestTarget = enemyData
				bestPos = ePos
			end
		end
	end

	local bestDist = bestDistSq < math.huge and math.sqrt(bestDistSq) or math.huge
	return bestTarget, nil, nil, bestPos, bestDist
end

return selector
end function __DIST.h()-- Target Movement System – Component D: Target Tracker & Path Manager
-- Spec: Sections 7, 8, 14, 15 (Roblox_Target_Movement_System_AI_Spec.txt)


local selector = __DIST.load('g')
local scanner = __DIST.load('f')

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
end function __DIST.i()-- Target Movement System – Component E & F: Movement Controller & Blocking Checker
-- Spec: Sections 9, 10, 11, 12, 13 (Roblox_Target_Movement_System_AI_Spec.txt)


local services = __DIST.load('a')
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

end function __DIST.j()-- HazardScanner - Geometry & Danger Zones (DungeonQuest).
-- Range quét: chỉ X-Z (bỏ hẳn Y - chiêu đánh cả sàn).
-- Zone = union per-part: mỗi BasePart còn rõ (Transparency <= 0.85) trở thành 1 vùng con
-- (vòng tròn nếu Ball/Cylinder, OBB nếu box/union/mesh). Query point nặng 1 vùng con
-- nào là dính hazard. Broad phase: distSq tới bounding radius -> reject nhanh.
-- HazardZones cache trong info, nhưng mỗi vùng con vẫn re-check part còn sống lúc query
-- (part mờ > 0.85 tự ngừng gây nguy hiểm).

--// Table

local geometry = {}

--// State
local FADE_TRANSPARENCY_THRESHOLD = 0.85
local hazardPadding = 0.0 -- Mặc định = 0.0 cố định cho danger zone đỏ bình thường
local trajectoryMargin = 2.0 -- Margin riêng cho danger zone blue (các chiêu có trajectory)
local data = nil
local paddingChangedCallbacks = {}

--// Gioi han so vung con toi da 1 hazard (chong DoS qua nhieu part/mot object)
local MAX_PARTS_PER_HAZARD = 64

--// Data source do detection bom vao (tranh vong phu thuoc)
function geometry.BindDetection(dataSource)
	data = dataSource or nil
end

function geometry.GetHazardPadding()
	return hazardPadding
end
geometry.GetHitboxPadding = geometry.GetHazardPadding

function geometry.GetTrajectoryMargin()
	return trajectoryMargin
end

function geometry.SetTrajectoryMargin(value)
	if type(value) == "number" and value >= 0 and value ~= trajectoryMargin then
		trajectoryMargin = value
		geometry.InvalidateCache()
		for _, cb in ipairs(paddingChangedCallbacks) do
			pcall(cb, trajectoryMargin)
		end
	end
end

--// Xoa toan bo HazardZones cache tren cac hazard hien tai
function geometry.InvalidateCache()
	if data and data.GetActiveHazardsMap then
		for _, info in pairs(data.GetActiveHazardsMap()) do
			info.HazardZones = nil
		end
	end
end

function geometry.OnPaddingChanged(callback)
	if type(callback) == "function" then
		table.insert(paddingChangedCallbacks, callback)
	end
end

function geometry.SetHazardPadding(value)
	if type(value) == "number" and value >= 0 and value ~= hazardPadding then
		hazardPadding = value
		geometry.InvalidateCache()
		for _, cb in ipairs(paddingChangedCallbacks) do
			pcall(cb, hazardPadding)
		end
	end
end
geometry.SetHitboxPadding = geometry.SetHazardPadding

local ReplicatedStorage = game:GetService("ReplicatedStorage")

--// Danh sách ngoại lệ: các đối tượng (theo tên hoặc từ khóa) bị xem là Box/Mesh
--// nhưng thực tế nên được vẽ và tính toán thành VÙNG TRÒN (Circle Danger Zone).
local FORCE_CIRCLE_NAMES = {
	"firstBossCrissCross",
	"firstBossSeekingSpikes",
}

local ICE_SPIKES_KEYWORDS = {
	"smallicespikes",
	"mediumicespikes",
	"largeicespikes",
}

local cachedLargeRadius = nil

local function isIceSpikesChain(hazardName)
	if not hazardName or type(hazardName) ~= "string" then return false end
	local clean = hazardName:lower():gsub("%s+", "")
	if #clean == 0 then return false end
	for _, kw in ipairs(ICE_SPIKES_KEYWORDS) do
		if string.find(clean, kw, 1, true) then
			return true
		end
	end
	return false
end

function geometry.IsIceSpikesChain(hazardName)
	return isIceSpikesChain(hazardName)
end

local SECOND_BOSS_CHAIN_KEYWORDS = {
	"secondbosscriclehitbox",
	"secondbosscirclehitbox",
}

local secondBossCircleDuration = 1.2

local function isSecondBossCircleChain(hazardName)
	if not hazardName or type(hazardName) ~= "string" then return false end
	local clean = hazardName:lower():gsub("%s+", "")
	if #clean == 0 then return false end
	for _, kw in ipairs(SECOND_BOSS_CHAIN_KEYWORDS) do
		if string.find(clean, kw, 1, true) then
			return true
		end
	end
	return false
end

function geometry.IsSecondBossCircleChain(hazardName)
	return isSecondBossCircleChain(hazardName)
end

function geometry.GetSecondBossCircleDuration()
	return secondBossCircleDuration
end

function geometry.SetSecondBossCircleDuration(val)
	if type(val) == "number" and val >= 0.1 then
		secondBossCircleDuration = math.clamp(val, 0.1, 10.0)
		geometry.InvalidateCache()
	end
end

local MOVING_BEAM_KEYWORDS = {
	"movingbeam",
}

local function isMovingBeam(hazardName)
	if not hazardName or type(hazardName) ~= "string" then return false end
	local clean = hazardName:lower():gsub("%s+", "")
	if #clean == 0 then return false end
	for _, kw in ipairs(MOVING_BEAM_KEYWORDS) do
		if string.find(clean, kw, 1, true) then
			return true
		end
	end
	return false
end

function geometry.IsMovingBeam(hazardName)
	return isMovingBeam(hazardName)
end

local BIG_SPIKE_KEYWORDS = {
	"firstbossbigspike",
	"firstbossbeampart",
	"bigspike",
}

local function isBeamTelegraph(hazardName)
	if not hazardName or type(hazardName) ~= "string" then return false end
	local clean = hazardName:lower():gsub("%s+", "")
	return string.find(clean, "firstbossbeampart", 1, true) ~= nil
end

function geometry.IsBeamTelegraph(hazardName)
	return isBeamTelegraph(hazardName)
end

local function isBigSpike(hazardName)
	if not hazardName or type(hazardName) ~= "string" then return false end
	local clean = hazardName:lower():gsub("%s+", "")
	if #clean == 0 or string.find(clean, "seekingspike", 1, true) then return false end
	for _, kw in ipairs(BIG_SPIKE_KEYWORDS) do
		if string.find(clean, kw, 1, true) then
			return true
		end
	end
	return false
end

function geometry.IsBigSpike(hazardName)
	return isBigSpike(hazardName)
end

--// Tính toán hoặc đọc bán kính tối đa từ template largeIceSpikes trong ReplicatedStorage
local function getLargeIceSpikesMaxRadius()
	if cachedLargeRadius and cachedLargeRadius > 0 then
		return cachedLargeRadius
	end

	local fallbackRadius = 45.0
	local enemyProjectiles = ReplicatedStorage:FindFirstChild("enemyProjectiles")
	if not enemyProjectiles then
		return fallbackRadius
	end

	local template = enemyProjectiles:FindFirstChild("largeIceSpikes")
	if not template then
		for _, child in ipairs(enemyProjectiles:GetChildren()) do
			local clean = (child.Name or ""):lower():gsub("%s+", "")
			if clean == "largeicespikes" then
				template = child
				break
			end
		end
	end

	if not template then
		return fallbackRadius
	end

	local maxRadiusFound = 0
	local centerPos = Vector3.zero
	if template:IsA("Model") and template.PrimaryPart then
		centerPos = template.PrimaryPart.Position
	elseif template:IsA("BasePart") then
		centerPos = template.Position
	end

	local parts = {}
	if template:IsA("BasePart") then
		table.insert(parts, template)
	else
		for _, desc in ipairs(template:GetDescendants()) do
			if desc:IsA("BasePart") then
				table.insert(parts, desc)
			end
		end
	end

	if #parts == 0 then
		return fallbackRadius
	end

	for _, p in ipairs(parts) do
		local pSize = p.Size
		local halfExtent = math.max(pSize.X, pSize.Z) / 2
		local dist = (Vector3.new(p.Position.X, 0, p.Position.Z) - Vector3.new(centerPos.X, 0, centerPos.Z)).Magnitude
		local reach = dist + halfExtent
		if reach > maxRadiusFound then
			maxRadiusFound = reach
		end
	end

	if maxRadiusFound >= 5.0 then
		cachedLargeRadius = maxRadiusFound
		return cachedLargeRadius
	end

	return fallbackRadius
end

function geometry.GetLargeIceSpikesMaxRadius()
	return getLargeIceSpikesMaxRadius()
end

local function isForceCircle(hazardName)
	if not hazardName or type(hazardName) ~= "string" then return false end
	local clean = hazardName:lower():gsub("%s+", "")
	if #clean == 0 then return false end
	for _, target in ipairs(FORCE_CIRCLE_NAMES) do
		local cleanTarget = target:lower():gsub("%s+", "")
		if #cleanTarget > 0 and string.find(clean, cleanTarget, 1, true) then
			return true
		end
	end
	return false
end

function geometry.IsForceCircle(hazardName)
	return isForceCircle(hazardName)
end

function geometry.AddForceCircleName(name)
	if type(name) == "string" and #name > 0 then
		table.insert(FORCE_CIRCLE_NAMES, name)
		geometry.InvalidateCache()
	end
end

function geometry.GetForceCircleNames()
	return FORCE_CIRCLE_NAMES
end

--// Kiem tra part con hoat dong (khong mo qua nguong, con nam trong Workspace)
local function isPartAlive(part)
	return part and part.Parent and part.Transparency <= FADE_TRANSPARENCY_THRESHOLD
end

--// Tinh zone con cho 1 BasePart theo shape:
--// - Part Ball/Cylinder HOẶC nằm trong danh sách ngoại lệ (isForceCircle) -> vong tron X-Z (radius = 1/2 cạnh vuông)
--// - Box / Union / Mesh  -> OBB theo CFrame
local function computePartZone(part, forceCircle, isTrajectory)
	local size = part.Size
	local pad = isTrajectory and trajectoryMargin or hazardPadding
	local partName = (part and part.Name) or ""
	local parentName = (part and part.Parent and part.Parent.Name) or ""

	if isBigSpike(partName) or isBigSpike(parentName) then
		local s = size
		local mesh = part:FindFirstChildWhichIsA("SpecialMesh", true)
		if mesh then
			s = Vector3.new(s.X * math.abs(mesh.Scale.X), s.Y * math.abs(mesh.Scale.Y), s.Z * math.abs(mesh.Scale.Z))
		end
		local dims = { s.X, s.Y, s.Z }
		table.sort(dims)
		local width = math.clamp(dims[2], 6.0, 60.0)
		local length = math.clamp(dims[3], 8.0, 80.0)
		local halfW = width / 2 + pad
		local halfL = length / 2 + pad
		return { half = Vector3.new(halfW, 0, halfL), cframe = part.CFrame, isBigSpike = true }
	end

	if forceCircle or (part:IsA("Part") and (part.Shape == Enum.PartType.Ball or part.Shape == Enum.PartType.Cylinder)) then
		return { radius = math.max(size.X, size.Y, size.Z) / 2 }
	end

	local half = Vector3.new(math.max(size.X, 0) / 2 + pad, 0, math.max(size.Z, 0) / 2 + pad)
	return { half = half, cframe = part.CFrame }
end

--// Kiem tra diem P (X-Z) hoac vong tron ban kinh extraRadius co giao thoa voi 1 zone con khong
local function isPointInZone(point, zone, extraRadius, isTrajectory)
	if not zone then return false end
	if zone.expireTime and os.clock() > zone.expireTime then
		return false
	end

	local px, pz = point.X, point.Z
	extraRadius = extraRadius or 0
	local pad = (isTrajectory or zone.isTrajectory) and trajectoryMargin or hazardPadding

	if zone.radius then
		local pos = (zone.part and zone.part.Parent) and zone.part.Position
		local isSynthetic = zone.isSecondBossChain == true
		local cx = (isSynthetic and zone.cx) or (pos and pos.X) or zone.cx or 0
		local cz = (isSynthetic and zone.cz) or (pos and pos.Z) or zone.cz or 0
		local dx = px - cx
		local dz = pz - cz
		local r = zone.radius + pad + extraRadius
		return (dx * dx + dz * dz) <= (r * r)
	end

	local cf = (zone.part and zone.part.Parent) and zone.part.CFrame or zone.cframe
	if cf then
		local localPoint = cf:PointToObjectSpace(point)
		local halfX = zone.half.X
		local halfZ = zone.half.Z

		if extraRadius <= 0 then
			return math.abs(localPoint.X) <= halfX and math.abs(localPoint.Z) <= halfZ
		else
			-- Giao thoa chính xác giữa Vòng tròn Player (bán kính extraRadius) với Hộp OBB
			local dx = math.max(0, math.abs(localPoint.X) - halfX)
			local dz = math.max(0, math.abs(localPoint.Z) - halfZ)
			return (dx * dx + dz * dz) <= (extraRadius * extraRadius)
		end
	end

	return false
end

--// Lấy vector hướng tiến 2D của chiêu thức
local function getForwardVector2D(instance, mainPart)
	local cf = (mainPart and mainPart.CFrame) or (instance:IsA("Model") and instance:GetPivot())
	if cf then
		local lv = cf.LookVector
		-- Đảo 180 độ (-LookVector) do model gốc trong game quay ngược trục trước/sau
		local f2D = Vector3.new(-lv.X, 0, -lv.Z)
		if f2D.Magnitude > 0.05 then
			return f2D.Unit
		end
	end

	local lp = services.player or game:GetService("Players").LocalPlayer
	local char = lp and lp.Character
	local root = char and (char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart)
	if root and mainPart then
		local toPlayer = Vector3.new(root.Position.X - mainPart.Position.X, 0, root.Position.Z - mainPart.Position.Z)
		if toPlayer.Magnitude > 0.1 then
			return toPlayer.Unit
		end
	end

	return Vector3.new(0, 0, -1)
end

--// Chuan bi danh sach zone + bounding radius cua 1 hazard (cache vao info.HazardZones)
local function buildHazardZones(hazardInfo)
	if not hazardInfo or not hazardInfo.Instance or not hazardInfo.Instance.Parent then return nil end

	local instance = hazardInfo.Instance
	local hazardName = hazardInfo.Name or (instance and instance.Name) or ""
	local forceCircle = isForceCircle(hazardName)
	local isTrajectory = hazardInfo.IsTrajectory == true
	local pad = isTrajectory and trajectoryMargin or hazardPadding
	local parts

	if isIceSpikesChain(hazardName) then
		local maxRadius = getLargeIceSpikesMaxRadius()
		local mainPart = nil
		if instance:IsA("BasePart") then
			mainPart = isPartAlive(instance) and instance or nil
		elseif instance:IsA("Model") then
			if instance.PrimaryPart and isPartAlive(instance.PrimaryPart) then
				mainPart = instance.PrimaryPart
			else
				for _, desc in ipairs(instance:GetDescendants()) do
					if desc:IsA("BasePart") and isPartAlive(desc) and desc.Parent then
						mainPart = desc
						break
					end
				end
			end
		end

		if not mainPart then return nil end

		local pos = mainPart.Position
		local singleZone = {
			radius = maxRadius,
			cx = pos.X,
			cz = pos.Z,
			part = mainPart,
			isTrajectory = false,
			isIceSpikes = true,
		}

		return {
			zones = { singleZone },
			center = Vector3.new(pos.X, 0, pos.Z),
			boundingRadius = maxRadius + pad,
		}
	end

	if isSecondBossCircleChain(hazardName) then
		local mainPart = nil
		if instance:IsA("BasePart") then
			mainPart = isPartAlive(instance) and instance or nil
		elseif instance:IsA("Model") then
			if instance.PrimaryPart and isPartAlive(instance.PrimaryPart) then
				mainPart = instance.PrimaryPart
			else
				for _, desc in ipairs(instance:GetDescendants()) do
					if desc:IsA("BasePart") and isPartAlive(desc) and desc.Parent then
						mainPart = desc
						break
					end
				end
			end
		end

		if not mainPart then return nil end

		local pos = mainPart.Position
		local forward2D = getForwardVector2D(instance, mainPart)
		local spawnClock = hazardInfo.SpawnClock or os.clock()
		local zones = {}

		-- Chuỗi 10 vòng tròn liên hoàn của Boss 2 (secondBossCricleHitbox):
		-- Vòng 1 (gốc): R = 11 studs, khoảng cách = 0
		-- Mỗi vòng tiếp theo cách nhau 22 studs, bán kính tăng thêm 3 studs (11, 14, 17, 20, 23, 26, 29, 32, 35, 38)
		-- Mỗi vòng có expireTime riêng để cắt đuôi dạng sóng (Wave Expiration):
		-- Vòng 1 tan ở spawnClock + 1.2s, mỗi vòng sau tan chậm hơn 0.4s
		local NUM_CIRCLES = 10
		local BASE_RADIUS = 11.0
		local RADIUS_STEP = 3.0
		local DIST_STEP = 22.0
		local BASE_DURATION = secondBossCircleDuration
		local WAVE_STEP_DURATION = 0.4

		local totalLength = (NUM_CIRCLES - 1) * DIST_STEP

		for i = 1, NUM_CIRCLES do
			local offsetDist = (i - 1) * DIST_STEP
			local circleCenter = Vector3.new(pos.X, 0, pos.Z) + forward2D * offsetDist
			local circleRadius = BASE_RADIUS + (i - 1) * RADIUS_STEP
			local expireTime = spawnClock + BASE_DURATION + (i - 1) * WAVE_STEP_DURATION

			table.insert(zones, {
				radius = circleRadius,
				cx = circleCenter.X,
				cz = circleCenter.Z,
				part = mainPart,
				expireTime = expireTime,
				isTrajectory = false,
				isSecondBossChain = true,
				circleIndex = i,
			})
		end

		local centerPos = Vector3.new(pos.X, 0, pos.Z) + forward2D * (totalLength / 2)
		local maxCircleRadius = BASE_RADIUS + (NUM_CIRCLES - 1) * RADIUS_STEP
		local boundingRadius = (totalLength / 2) + maxCircleRadius + pad
		local maxExpireTime = spawnClock + BASE_DURATION + (NUM_CIRCLES - 1) * WAVE_STEP_DURATION

		if hazardInfo then
			hazardInfo.MaxExpireTime = maxExpireTime
			hazardInfo.IsSyntheticChain = true
		end

		return {
			zones = zones,
			center = centerPos,
			boundingRadius = boundingRadius,
			maxExpireTime = maxExpireTime,
		}
	end

	if isBeamTelegraph(hazardName) then
		-- firstBossBeamPart chỉ hiển thị hành lang cam Trajectory, không tạo ground zone con
		return nil
	end

	if isBigSpike(hazardName) then
		local mainPart = nil
		if instance:IsA("BasePart") then
			mainPart = isPartAlive(instance) and instance or nil
		elseif instance:IsA("Model") then
			mainPart = instance.PrimaryPart or instance:FindFirstChildWhichIsA("BasePart")
			if not mainPart or not isPartAlive(mainPart) then
				for _, desc in ipairs(instance:GetDescendants()) do
					if desc:IsA("BasePart") and isPartAlive(desc) and desc.Parent then
						mainPart = desc
						break
					end
				end
			end
		end

		if not mainPart then return nil end

		local pos = mainPart.Position
		local size = mainPart.Size
		local mesh = mainPart:FindFirstChildWhichIsA("SpecialMesh", true)
		if mesh then
			size = Vector3.new(size.X * math.abs(mesh.Scale.X), size.Y * math.abs(mesh.Scale.Y), size.Z * math.abs(mesh.Scale.Z))
		end
		local dims = { size.X, size.Y, size.Z }
		table.sort(dims)
		local spikeWidth = math.clamp(dims[2], 6.0, 60.0)
		local spikeLength = math.clamp(dims[3], 8.0, 80.0)
		local halfW = spikeWidth / 2 + pad
		local halfL = spikeLength / 2 + pad

		local singleZone = {
			half = Vector3.new(halfW, 0, halfL),
			cframe = mainPart.CFrame,
			part = mainPart,
			cx = pos.X,
			cz = pos.Z,
			isTrajectory = isTrajectory,
			isBigSpike = true,
		}

		return {
			zones = { singleZone },
			center = Vector3.new(pos.X, 0, pos.Z),
			boundingRadius = math.sqrt(halfW * halfW + halfL * halfL),
		}
	end

	if instance:IsA("BasePart") then
		if not isPartAlive(instance) then return nil end
		parts = { instance }
	else
		parts = {}
		for _, desc in ipairs(instance:GetDescendants()) do
			if #parts >= MAX_PARTS_PER_HAZARD then break end
			if desc:IsA("BasePart") and isPartAlive(desc) and desc.Parent then
				parts[#parts + 1] = desc
			end
		end
		if #parts == 0 then return nil end
	end

	local zones = {}
	local minX, maxX, minZ, maxZ = math.huge, -math.huge, math.huge, -math.huge

	for _, part in ipairs(parts) do
		local pos = part.Position
		local size = part.Size
		local radius2D = math.max(size.X, size.Y, size.Z) / 2 + pad

		minX = math.min(minX, pos.X - radius2D)
		maxX = math.max(maxX, pos.X + radius2D)
		minZ = math.min(minZ, pos.Z - radius2D)
		maxZ = math.max(maxZ, pos.Z + radius2D)

		local zone = computePartZone(part, forceCircle, isTrajectory)
		if zone then
			zone.part = part
			zone.isTrajectory = isTrajectory
			zones[#zones + 1] = zone
		end
	end

	if #zones == 0 then return nil end

	local centerX = (minX + maxX) / 2
	local centerZ = (minZ + maxZ) / 2
	local halfX = (maxX - minX) / 2
	local halfZ = (maxZ - minZ) / 2

	return {
		zones = zones,
		center = Vector3.new(centerX, 0, centerZ),
		boundingRadius = math.sqrt(halfX * halfX + halfZ * halfZ),
	}
end

--// Lay hoac cache HazardZones cho 1 hazard
local function getHazardZones(info)
	local zones = info and info.HazardZones
	if not zones then
		zones = buildHazardZones(info)
		if zones and info then info.HazardZones = zones end
	end
	return zones
end

function geometry.GetHazardZones(info)
	return getHazardZones(info)
end

--// Lấy danh sách các Hazards nằm trong phạm vi maxRadius xung quanh origin (Broad-Phase Spatial Culling)
function geometry.GetNearbyHazards(origin, maxRadius)
	local det = data
	if not det then return {} end
	maxRadius = maxRadius or 65

	local nearby = {}
	local ox, oz = origin.X, origin.Z

	for _, info in pairs(det.GetActiveHazardsMap()) do
		local inst = info.Instance
		local hazardZones = getHazardZones(info)
		if hazardZones then
			local cx = hazardZones.center.X
			local cz = hazardZones.center.Z
			if inst and inst.Parent then
				local livePart = inst:IsA("BasePart") and inst or inst.PrimaryPart or inst:FindFirstChildWhichIsA("BasePart")
				if livePart then
					cx = livePart.Position.X
					cz = livePart.Position.Z
				end
			end

			local dx = ox - cx
			local dz = oz - cz
			local distSq = dx * dx + dz * dz
			local totalReach = maxRadius + hazardZones.boundingRadius
			if distSq <= totalReach * totalReach then
				table.insert(nearby, info)
			end
		end
	end

	return nearby
end

--// Query: kiem tra diem P (hoac vong tron player ban kinh extraRadius) co dính hazard nao khong
--// Tra ve: hit (bool), hazardInfo (gan nhat), hitPart
function geometry.IsPointInAnyHazard(point, ignoredInstance, extraRadius, hazardList)
	local det = data
	if not det then return false, nil, nil end
	extraRadius = extraRadius or 0

	local bestDistSq = math.huge
	local foundInfo, foundPart = nil, nil
	local list = hazardList or det.GetActiveHazardsMap()

	for key, info in pairs(list) do
		local inst = info.Instance or (typeof(key) == "Instance" and key)
		if ignoredInstance and (ignoredInstance == inst or (inst and ignoredInstance.Name == inst.Name)) then
			continue
		end

		local hazardName = info.Name or (inst and inst.Name) or ""
		if isMovingBeam(hazardName) or isBigSpike(hazardName) then
			-- Moving Beam và BigSpike được quản lý và kiểm tra va chạm 100% bằng Trajectory (hành lang Cam chính xác).
			-- Bỏ qua tại đây để tuyệt đối không có bán kính (Radius) ngầm nào can thiệp gây né sớm!
			continue
		end

		local hazardZones = getHazardZones(info)
		if not hazardZones then continue end

		-- Broad phase: reject nhanh bang distSq to center (uu tien vi tri part thoi gian thuc)
		local cx = hazardZones.center.X
		local cz = hazardZones.center.Z
		if inst and inst.Parent then
			local livePart = inst:IsA("BasePart") and inst or inst.PrimaryPart or inst:FindFirstChildWhichIsA("BasePart")
			if livePart then
				cx = livePart.Position.X
				cz = livePart.Position.Z
			end
		end

		local dx = point.X - cx
		local dz = point.Z - cz
		local distSq = dx * dx + dz * dz
		local totalBounding = hazardZones.boundingRadius + extraRadius
		if distSq > totalBounding * totalBounding then
			continue
		end

		-- Narrow phase: union per-part, re-check part con song
		local isTraj = info.IsTrajectory == true
		for i = 1, #hazardZones.zones do
			local zone = hazardZones.zones[i]
			if isPartAlive(zone.part) and isPointInZone(point, zone, extraRadius, isTraj or zone.isTrajectory) then
				local d2 = (point - zone.part.Position).Magnitude
				if d2 < bestDistSq then
					bestDistSq = d2
					foundInfo = info
					foundPart = zone.part
				end
				break
			end
		end
	end

	return foundPart ~= nil, foundInfo, foundPart
end

return geometry end function __DIST.k()-- HazardScanner – Visualizer: Vẽ trực quan vùng toán học (Ground Visualizer)
-- dựa trên mô hình hình học của geometry.luau.
-- Phân loại màu sắc:
--   - Màu Đỏ (Red): Danger Zone của chiêu thức tĩnh / bình thường.
--   - Màu Xanh (Blue): Danger Zone của chiêu thức có quỹ đạo bay (Trajectory / Projectile), áp dụng Trajectory Margin riêng.
--   - Màu Xanh Lá (Green): Danger Zone dự đoán chuỗi vòng tròn Boss 2 (Boss 2 Circle Chain / secondBossCricleHitbox).

--// Imports

local services = __DIST.load('a')
local lifecycle = __DIST.load('b')
local geometry = __DIST.load('j')

local RunService = services.RunService or game:GetService("RunService")
local player = services.player

--// Table
local visualizer = {}

--// State
local enabled = false
local data = nil
local activeVisuals = {} -- [hazardInfo] = { items = {}, adornments = {}, connections = {} }
local heartbeatConnection = nil

--// Constants
local FADE_TRANSPARENCY_THRESHOLD = 0.85
local ZONE_COLOR_RED = Color3.fromRGB(255, 45, 45)
local ZONE_COLOR_BLUE = Color3.fromRGB(0, 160, 255)
local ZONE_COLOR_GREEN = Color3.fromRGB(0, 230, 90)
local ZONE_TRANSPARENCY = 0.55
local GROUND_THICKNESS = 0.25

--// Lấy độ cao mặt sàn theo chân người chơi tại thời điểm vẽ
local function getPlayerGroundY()
	local char = player and player.Character
	if not char then return nil end
	local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
	if not root then return nil end
	return root.Position.Y - 2.5
end

--// Gán data source từ detection (tránh circular dependency)
function visualizer.BindDetection(dataSource)
	data = dataSource or nil
end

local trajectorySource = nil
function visualizer.BindTrajectory(source)
	trajectorySource = source or nil
end

function visualizer.IsEnabled()
	return enabled
end

--// Cập nhật vị trí và góc xoay của một Adornment ghim thẳng đứng xuống mặt đất mỗi frame
local function updateVisualCFrame(item, targetY)
	local ad = item.ad
	local zone = item.zone
	local part = item.part
	local anchorPart = item.anchorPart or part
	if not ad or not ad.Parent or not anchorPart or not anchorPart.Parent then return end

	local isSynthetic = zone and (zone.isSecondBossChain or (item.hazardInfo and item.hazardInfo.IsSyntheticChain))
	local worldPos = (isSynthetic and zone.cx and zone.cz and Vector3.new(zone.cx, 0, zone.cz))
		or (part and part.Parent and part.Position)
		or ((zone and zone.cx and zone.cz) and Vector3.new(zone.cx, 0, zone.cz))
	if not worldPos then return end
	local worldTargetPos = Vector3.new(worldPos.X, targetY or worldPos.Y, worldPos.Z)

	if item.isCircle then
		-- Đĩa tròn: Cố định nằm ngang hoàn toàn trên mặt phẳng World X-Z
		local desiredWorldCFrame = CFrame.new(worldTargetPos) * CFrame.Angles(math.rad(90), 0, 0)
		ad.CFrame = (anchorPart == workspace.Terrain) and desiredWorldCFrame or anchorPart.CFrame:ToObjectSpace(desiredWorldCFrame)
	else
		-- Hộp OBB: Giữ hướng quay Yaw trên sàn, triệt tiêu Pitch/Roll
		local desiredWorldCFrame
		if zone and zone.isBigSpike then
			local trajDir = trajectorySource and trajectorySource.GetHazardDirection and trajectorySource.GetHazardDirection(item.hazardInfo)
			if trajDir and trajDir.Magnitude > 0.01 then
				desiredWorldCFrame = CFrame.lookAt(worldTargetPos, worldTargetPos + trajDir)
			else
				local baseCF = (part and part.Parent) and part.CFrame or CFrame.identity
				local _, yaw, _ = baseCF:ToOrientation()
				desiredWorldCFrame = CFrame.new(worldTargetPos) * CFrame.Angles(0, yaw, 0)
			end
		else
			local baseCF = (part and part.Parent) and part.CFrame or CFrame.identity
			local _, yaw, _ = baseCF:ToOrientation()
			desiredWorldCFrame = CFrame.new(worldTargetPos) * CFrame.Angles(0, yaw, 0)
		end
		ad.CFrame = (anchorPart == workspace.Terrain) and desiredWorldCFrame or anchorPart.CFrame:ToObjectSpace(desiredWorldCFrame)
	end
end

--// Vòng lặp Heartbeat: Ghim toàn bộ visual thẳng đứng xuống mặt đất liên tục mỗi frame
--// Hỗ trợ Wave Expiration (Cắt đuôi dạng sóng): Tự động gỡ các vòng tròn đã quá hạn expireTime
local function onHeartbeat()
	if not enabled then return end
	local hasAny = false
	local targetY = getPlayerGroundY()
	local now = os.clock()

	for info, record in pairs(activeVisuals) do
		local isChain = info.IsSyntheticChain or (info.MaxExpireTime and now < info.MaxExpireTime)
		local isInstanceAlive = info.Instance and info.Instance.Parent

		if not isInstanceAlive and not isChain then
			visualizer.DetachZoneVisuals(info)
		else
			if record.items then
				local aliveItems = {}
				for _, item in ipairs(record.items) do
					local zone = item.zone
					if zone and zone.expireTime and now > zone.expireTime then
						-- Vòng tròn này đã hết hạn -> hủy adornment để cắt đuôi
						if item.ad and item.ad.Parent then
							pcall(function() item.ad:Destroy() end)
						end
					elseif item.ad and item.ad.Parent then
						table.insert(aliveItems, item)
						updateVisualCFrame(item, targetY)
					end
				end
				record.items = aliveItems
				if #aliveItems > 0 then
					hasAny = true
				else
					visualizer.DetachZoneVisuals(info)
				end
			end
		end
	end

	if not hasAny and heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
end

local function ensureHeartbeat()
	if not heartbeatConnection and enabled then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

--// Xóa visual của một hazard
function visualizer.DetachZoneVisuals(hazardInfo)
	if not hazardInfo then return end
	local record = activeVisuals[hazardInfo]
	if not record then return end

	if record.adornments then
		for _, ad in ipairs(record.adornments) do
			pcall(function() ad:Destroy() end)
		end
		table.clear(record.adornments)
	end

	if record.connections then
		for _, c in ipairs(record.connections) do
			pcall(function() c:Disconnect() end)
		end
		table.clear(record.connections)
	end

	if record.items then
		table.clear(record.items)
	end

	activeVisuals[hazardInfo] = nil
end

--// Cập nhật màu sắc và bán kính/kích thước visual khi hazard chuyển trạng thái Trajectory (Red <-> Blue)
function visualizer.UpdateHazardVisualColor(hazardInfo, isTrajectory)
	if not hazardInfo then return end
	local record = activeVisuals[hazardInfo]
	if not record or not record.items then return end

	local name = hazardInfo.Name or (hazardInfo.Instance and hazardInfo.Instance.Name) or ""
	local isSecondBossChain = (geometry.IsSecondBossCircleChain and geometry.IsSecondBossCircleChain(name)) or (hazardInfo and hazardInfo.IsSyntheticChain == true)
	local isTraj = isTrajectory == true or hazardInfo.IsTrajectory == true
	local color = isSecondBossChain and ZONE_COLOR_GREEN or (isTraj and ZONE_COLOR_BLUE or ZONE_COLOR_RED)
	local pad = isTraj and geometry.GetTrajectoryMargin() or 0.0

	for _, item in ipairs(record.items) do
		local ad = item.ad
		local zone = item.zone
		local part = item.part
		if ad and ad.Parent and zone and part and part.Parent then
			ad.Color3 = color
			if item.isCircle and zone.radius then
				ad.Radius = zone.radius + pad
			elseif zone.half then
				local halfX = zone.half.X
				local halfZ = zone.half.Z
				ad.Size = Vector3.new(halfX * 2, GROUND_THICKNESS, halfZ * 2)
			end
		end
	end
end

--// Vẽ visual cho một hazard (Ghim thẳng đứng xuống mặt đất)
function visualizer.AttachZoneVisuals(hazardInfo)
	if not enabled or not hazardInfo then return end
	if activeVisuals[hazardInfo] then
		visualizer.DetachZoneVisuals(hazardInfo)
	end

	local hazardZones = geometry.GetHazardZones(hazardInfo)
	if not hazardZones or not hazardZones.zones then return end

	local name = hazardInfo.Name or (hazardInfo.Instance and hazardInfo.Instance.Name) or ""
	local isSecondBossChain = (geometry.IsSecondBossCircleChain and geometry.IsSecondBossCircleChain(name)) or (hazardInfo and hazardInfo.IsSyntheticChain == true)
	local isTraj = hazardInfo.IsTrajectory == true
	local color = isSecondBossChain and ZONE_COLOR_GREEN or (isTraj and ZONE_COLOR_BLUE or ZONE_COLOR_RED)
	local pad = isTraj and geometry.GetTrajectoryMargin() or 0.0
	local targetY = getPlayerGroundY()
	local items = {}
	local adornments = {}
	local connections = {}

	local terrain = workspace.Terrain

	for _, zone in ipairs(hazardZones.zones) do
		local part = zone.part
		local isChain = zone.isSecondBossChain == true
		local isBigSpike = zone.isBigSpike == true
		local anchorPart = (isChain or isBigSpike) and terrain or part

		if isChain or isBigSpike or (part and part.Parent and part.Transparency <= FADE_TRANSPARENCY_THRESHOLD) then
			local ad = nil
			local isCircle = false

			if zone.radius then
				isCircle = true
				local cyl = Instance.new("CylinderHandleAdornment")
				cyl.Name = "HazardGroundCircle"
				cyl.Adornee = anchorPart
				cyl.Radius = zone.radius + pad
				cyl.Height = GROUND_THICKNESS
				cyl.Color3 = color
				cyl.Transparency = ZONE_TRANSPARENCY
				cyl.ZIndex = 2
				cyl.AlwaysOnTop = true
				cyl.Parent = anchorPart
				ad = cyl
			elseif zone.half and zone.cframe then
				local box = Instance.new("BoxHandleAdornment")
				box.Name = "HazardGroundBox"
				box.Adornee = anchorPart
				box.Size = Vector3.new(zone.half.X * 2, GROUND_THICKNESS, zone.half.Z * 2)
				box.Color3 = color
				box.Transparency = ZONE_TRANSPARENCY
				box.ZIndex = 2
				box.AlwaysOnTop = true
				box.Parent = anchorPart
				ad = box
			end

			if ad then
				local item = {
					ad = ad,
					part = part,
					anchorPart = anchorPart,
					isCircle = isCircle,
					zone = zone,
					hazardInfo = hazardInfo,
				}
				updateVisualCFrame(item, targetY)
				table.insert(items, item)
				table.insert(adornments, ad)

				if not isChain and part then
					-- Tự động destroy visual khi part mờ dần (chỉ part thông thường)
					local conn = part:GetPropertyChangedSignal("Transparency"):Connect(function()
						if part.Parent and part.Transparency > FADE_TRANSPARENCY_THRESHOLD then
							pcall(function() ad:Destroy() end)
						end
					end)
					table.insert(connections, conn)
				end
			end
		end
	end

	if #adornments > 0 then
		activeVisuals[hazardInfo] = {
			items = items,
			adornments = adornments,
			connections = connections,
		}
		ensureHeartbeat()
	end
end

--// Xóa toàn bộ visual
function visualizer.ClearAll()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	for info in pairs(activeVisuals) do
		visualizer.DetachZoneVisuals(info)
	end
	table.clear(activeVisuals)
end

--// Refresh lại toàn bộ visual đang hoạt động
function visualizer.RefreshAll()
	visualizer.ClearAll()
	if not enabled or not data then return end

	for _, info in pairs(data.GetActiveHazardsMap()) do
		visualizer.AttachZoneVisuals(info)
	end
end

--// Bật / tắt Ground Visualizer
function visualizer.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		visualizer.RefreshAll()
	else
		visualizer.ClearAll()
	end
end

--// Lắng nghe thay đổi margin/padding để refresh visual
geometry.OnPaddingChanged(function()
	if enabled then
		visualizer.RefreshAll()
	end
end)

--// Dọn dẹp khi script shutdown
lifecycle.Register(function()
	visualizer.ClearAll()
end)

return visualizer
end function __DIST.l()-- HazardScanner – Timer & 3D Tag Visualizer (DungeonQuest):
-- Hiển thị 3D visual gắn trên đầu mọi Danger Zone trong không gian trận đấu.
-- Phân loại nhãn 3D:
--   - (T) Trajectory: Chiêu thức đang di chuyển / có quỹ đạo bay (Blue/Orange Zone) -> KHÔNG đếm thời gian.
--   - (P) Projectile: Đối tượng có tên trong ReplicatedStorage/enemyProjectiles nhưng đang tĩnh trên sàn -> CÓ đếm thời gian.
--   - (N) Non-projectile: Chiêu thức tĩnh trên mặt sàn (Red Danger Zone) -> CÓ đếm thời gian.
-- Mỗi Danger Zone có 1 BillboardGui gắn trực tiếp vào Part của vùng đó
-- và tự hủy lập tức ngay khi Zone mờ đi (Transparency > 0.85) hoặc biến mất khỏi Workspace.

--// Imports

local services = __DIST.load('a')
local lifecycle = __DIST.load('b')
local geometry = __DIST.load('j')

local RunService = services.RunService or game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = services.player

--// Table
local timerVisual = {}

--// State
local enabled = true
local data = nil
local activeTimers = {} -- [hazardInfo] = { items = {}, connections = {} }
local heartbeatConnection = nil

--// Constants
local FADE_TRANSPARENCY_THRESHOLD = 0.85
local COLOR_RED = Color3.fromRGB(255, 60, 60)
local COLOR_BLUE = Color3.fromRGB(0, 180, 255)
local COLOR_ORANGE = Color3.fromRGB(255, 140, 0)
local COLOR_PURPLE = Color3.fromRGB(220, 90, 255)

--// Folder chứa danh sách enemy projectiles mẫu trong ReplicatedStorage
local PROJECTILE_FOLDER = "enemyProjectiles"
local enemyProjectilesLoaded = false
local enemyProjectileNames = {} -- [cleanName] = true

--// Blacklist: Các đối tượng nằm trong enemyProjectiles nhưng thực tế không phải là Projectile
local PROJECTILE_BLACKLIST = {
	-- Thêm tên đối tượng vào đây nếu cần loại khỏi (P)
}

--// Danh sách Chasing Projectiles (Đạn truy đuổi / tự đổi hướng theo player)
--// Thêm hoặc xóa tên trực tiếp tại đây:
local CHASING_PROJECTILE_NAMES = {
	["secondbossgreenorb"] = true,
	["secondbossredorb"] = true,
	["secondbossyelloworb"] = true,
}

local function loadEnemyProjectiles()
	if enemyProjectilesLoaded then return end
	enemyProjectilesLoaded = true
	local folder = ReplicatedStorage:FindFirstChild(PROJECTILE_FOLDER)
	if folder then
		for _, obj in ipairs(folder:GetChildren()) do
			local clean = (obj.Name or ""):lower():gsub("%s+", "")
			if #clean > 0 then
				enemyProjectileNames[clean] = true
			end
		end
		folder.ChildAdded:Connect(function(child)
			local clean = (child.Name or ""):lower():gsub("%s+", "")
			if #clean > 0 then
				enemyProjectileNames[clean] = true
			end
		end)
	end
end

--// Kiểm tra xem tên hazard có phải là Chasing Projectile (đạn truy đuổi) không
function timerVisual.IsChasingProjectile(name)
	if not name or type(name) ~= "string" then return false end
	local clean = name:lower():gsub("%s+", "")
	if #clean == 0 then return false end
	if CHASING_PROJECTILE_NAMES[clean] == true then return true end
	for n in pairs(CHASING_PROJECTILE_NAMES) do
		if string.find(clean, n, 1, true) then
			return true
		end
	end
	return false
end

--// Kiểm tra xem tên hazard có phải là Projectile mẫu từ ReplicatedStorage/enemyProjectiles không
function timerVisual.IsEnemyProjectile(name)
	loadEnemyProjectiles()
	if not name or type(name) ~= "string" then return false end
	local clean = name:lower():gsub("%s+", "")
	if #clean == 0 then return false end
	if PROJECTILE_BLACKLIST[clean] == true then return false end
	return enemyProjectileNames[clean] == true
end

--// Gán data source từ detection (tránh circular dependency)
function timerVisual.BindDetection(dataSource)
	data = dataSource or nil
end

function timerVisual.IsEnabled()
	return enabled
end

--// Lấy độ cao mặt sàn của người chơi
local function getPlayerGroundY()
	local char = player and player.Character
	if not char then return nil end
	local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
	if not root then return nil end
	return root.Position.Y - 2.5
end

--// Tính toán Y Offset phù hợp để BillboardGui luôn lơ lửng ở tầm mắt phía trên sàn đấu
local function computeYOffset(part)
	if not part or not part.Parent then return 2.5 end
	local groundY = getPlayerGroundY()
	if groundY then
		local desiredY = groundY + 2.5
		local diff = desiredY - part.Position.Y
		local minAbovePart = part.Size.Y / 2 + 1.2
		return math.clamp(math.max(diff, minAbovePart), 1.5, 30.0)
	end
	return math.clamp(part.Size.Y / 2 + 1.8, 2.0, 10.0)
end

--// Kiểm tra Part của Danger Zone còn sống không
local function isZonePartAlive(part)
	return part and part.Parent and part.Transparency <= FADE_TRANSPARENCY_THRESHOLD
end

--// Tìm BasePart đại diện fallback
local function getMainPart(instance)
	if not instance or not instance.Parent then return nil end
	if instance:IsA("BasePart") then
		if isZonePartAlive(instance) then return instance end
	elseif instance:IsA("Model") then
		if instance.PrimaryPart and isZonePartAlive(instance.PrimaryPart) then
			return instance.PrimaryPart
		end
		local hrp = instance:FindFirstChild("HumanoidRootPart")
		if hrp and isZonePartAlive(hrp) then
			return hrp
		end
		for _, desc in ipairs(instance:GetDescendants()) do
			if desc:IsA("BasePart") and isZonePartAlive(desc) then
				return desc
			end
		end
	else
		for _, desc in ipairs(instance:GetDescendants()) do
			if desc:IsA("BasePart") and isZonePartAlive(desc) then
				return desc
			end
		end
	end
	return nil
end

--// Phân loại nhãn và màu sắc cho 1 hazard
--// Trả về: tag ("C" | "P" | "N"), strokeColor (Color3), tagRgb (string), hasTimer (boolean)
local function getHazardClassification(hazardInfo)
	local isTraj = hazardInfo and hazardInfo.IsTrajectory == true
	local name = hazardInfo and hazardInfo.Name or "Hazard"
	local isChasing = timerVisual.IsChasingProjectile(name)
	local isProj = timerVisual.IsEnemyProjectile(name)
	local hasTimer = not isTraj or isChasing

	if isChasing then
		-- (C) Chasing Projectile (đạn truy đuổi dí theo player, không có trajectory, có đếm thời gian)
		local strokeColor = COLOR_PURPLE
		local tagRgb = "220,100,255"
		return "C", strokeColor, tagRgb, true
	elseif isProj then
		-- (P) Projectile (có tên trong ReplicatedStorage/enemyProjectiles)
		local strokeColor = isTraj and COLOR_ORANGE or COLOR_BLUE
		local tagRgb = isTraj and "255,160,50" or "0,210,255"
		return "P", strokeColor, tagRgb, hasTimer
	else
		-- (N) Non-projectile (không thuộc enemyProjectiles)
		local strokeColor = isTraj and COLOR_ORANGE or COLOR_RED
		local tagRgb = isTraj and "255,160,50" or "255,80,80"
		return "N", strokeColor, tagRgb, hasTimer
	end
end

--// Cập nhật text hiển thị và màu sắc cho BillboardGui của 1 hazard
local function updateTimerText(record, hazardInfo)
	if not record or not record.items or not hazardInfo then return end
	local tag, strokeColor, tagRgb, hasTimer = getHazardClassification(hazardInfo)
	local name = hazardInfo.Name or "Hazard"
	local text = ""

	if hasTimer then
		local spawnClock = hazardInfo.SpawnClock or os.clock()
		local elapsed = math.max(0, os.clock() - spawnClock)
		text = ("<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(255,220,220)'>%s</font> <font color='rgb(255,255,255)'><b>%.1fs</b></font>"):format(
			tagRgb,
			tag,
			name,
			elapsed
		)
	else
		text = ("<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(220,235,255)'>%s</font>"):format(
			tagRgb,
			tag,
			name
		)
	end

	for _, item in ipairs(record.items) do
		if item.label and item.label.Parent then
			item.label.Text = text
		end
		if item.stroke and item.stroke.Parent and item.stroke.Color ~= strokeColor then
			item.stroke.Color = strokeColor
		end
	end
end

--// Vòng lặp Heartbeat: Cập nhật bộ đếm/nhãn và dọn dẹp NGAY LẬP TỨC khi Danger Zone biến mất
local function onHeartbeat()
	if not enabled then return end
	local hasAny = false

	for hazardInfo, record in pairs(activeTimers) do
		local inst = hazardInfo.Instance
		if not inst or not inst.Parent then
			timerVisual.DetachTimerVisual(hazardInfo)
		else
			if record.items then
				-- Duyệt ngược mảng items để xóa các Zone đã biến mất/mờ
				for i = #record.items, 1, -1 do
					local item = record.items[i]
					local part = item.part
					if not isZonePartAlive(part) then
						if item.billboard and item.billboard.Parent then
							pcall(function() item.billboard:Destroy() end)
						end
						table.remove(record.items, i)
					else
						-- Zone còn sống -> cập nhật vị trí offset
						if item.billboard and item.billboard.Parent then
							item.billboard.StudsOffset = Vector3.new(0, computeYOffset(part), 0)
						end
					end
				end

				if #record.items == 0 then
					timerVisual.DetachTimerVisual(hazardInfo)
				else
					hasAny = true
					updateTimerText(record, hazardInfo)
				end
			else
				timerVisual.DetachTimerVisual(hazardInfo)
			end
		end
	end

	if not hasAny and heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
end

local function ensureHeartbeat()
	if not heartbeatConnection and enabled then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

--// Tạo 1 BillboardGui cho 1 Danger Zone (part)
local function createHazardBillboard(part, initialStrokeColor)
	local yOffset = computeYOffset(part)

	local bb = Instance.new("BillboardGui")
	bb.Name = "HazardLifespanTimer"
	bb.Adornee = part
	bb.AlwaysOnTop = true
	bb.MaxDistance = 500
	bb.LightInfluence = 0
	bb.ResetOnSpawn = false
	bb.Active = false
	bb.Size = UDim2.new(0, 150, 0, 24)
	bb.StudsOffset = Vector3.new(0, yOffset, 0)
	bb.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local frame = Instance.new("Frame")
	frame.Name = "TimerFrame"
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
	frame.BackgroundTransparency = 0.25
	frame.BorderSizePixel = 0
	frame.Parent = bb

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = frame

	local stroke = Instance.new("UIStroke")
	stroke.Name = "Stroke"
	stroke.Thickness = 1.3
	stroke.Color = initialStrokeColor or COLOR_RED
	stroke.Transparency = 0.15
	stroke.Parent = frame

	local label = Instance.new("TextLabel")
	label.Name = "TimerLabel"
	label.Size = UDim2.new(1, -6, 1, 0)
	label.Position = UDim2.new(0, 3, 0, 0)
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.GothamBold
	label.TextSize = 11
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.TextStrokeTransparency = 0
	label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	label.RichText = true
	label.TextXAlignment = Enum.TextXAlignment.Center
	label.TextYAlignment = Enum.TextYAlignment.Center
	label.Text = ""
	label.Parent = frame

	bb.Parent = part
	return bb, label, stroke
end

--// Gắn 3D Tag/Timer Visual cho toàn bộ các vùng của 1 Hazard
function timerVisual.AttachTimerVisual(hazardInfo)
	if not enabled or not hazardInfo then return end

	local name = hazardInfo.Name or (hazardInfo.Instance and hazardInfo.Instance.Name) or ""
	if (geometry.IsIceSpikesChain and geometry.IsIceSpikesChain(name))
		or (geometry.IsSecondBossCircleChain and geometry.IsSecondBossCircleChain(name)) then
		return
	end

	if activeTimers[hazardInfo] then
		timerVisual.DetachTimerVisual(hazardInfo)
	end

	local inst = hazardInfo.Instance
	if not inst or not inst.Parent then return end

	local _, initialStrokeColor = getHazardClassification(hazardInfo)
	local hazardZones = geometry.GetHazardZones(hazardInfo)
	local zones = hazardZones and hazardZones.zones

	local items = {}
	local connections = {}

	local function hookPart(part, bb, label, stroke, zone)
		local item = {
			billboard = bb,
			label = label,
			stroke = stroke,
			part = part,
			zone = zone,
		}
		table.insert(items, item)

		-- Tự động hủy tag LẬP TỨC khi part mờ dần (hết chiêu thức)
		local connTrans = part:GetPropertyChangedSignal("Transparency"):Connect(function()
			if not isZonePartAlive(part) then
				pcall(function() bb:Destroy() end)
			end
		end)
		table.insert(connections, connTrans)

		-- Tự động hủy tag LẬP TỨC khi part bị xóa khỏi Workspace
		local connParent = part.AncestryChanged:Connect(function(_, newParent)
			if not newParent then
				pcall(function() bb:Destroy() end)
			end
		end)
		table.insert(connections, connParent)
	end

	local targetPart = nil
	if zones and #zones > 0 then
		if inst:IsA("Model") then
			if inst.PrimaryPart and isZonePartAlive(inst.PrimaryPart) then
				targetPart = inst.PrimaryPart
			elseif inst:FindFirstChild("HumanoidRootPart") and isZonePartAlive(inst:FindFirstChild("HumanoidRootPart")) then
				targetPart = inst:FindFirstChild("HumanoidRootPart")
			end
		end

		if not targetPart then
			local center = hazardZones.center
			local bestDistSq = math.huge
			for _, zone in ipairs(zones) do
				local p = zone.part
				if isZonePartAlive(p) then
					if center then
						local dx = p.Position.X - center.X
						local dz = p.Position.Z - center.Z
						local d2 = dx * dx + dz * dz
						if d2 < bestDistSq then
							bestDistSq = d2
							targetPart = p
						end
					else
						targetPart = p
						break
					end
				end
			end
		end
	end

	if not targetPart then
		targetPart = getMainPart(inst)
	end

	if targetPart and isZonePartAlive(targetPart) then
		local bb, label, stroke = createHazardBillboard(targetPart, initialStrokeColor)
		hookPart(targetPart, bb, label, stroke, nil)
	end

	if #items > 0 then
		local record = {
			items = items,
			connections = connections,
		}
		activeTimers[hazardInfo] = record
		updateTimerText(record, hazardInfo)
		ensureHeartbeat()
	end
end

--// Gỡ bỏ Timer Visual của 1 hazard
function timerVisual.DetachTimerVisual(hazardInfo)
	if not hazardInfo then return end
	local record = activeTimers[hazardInfo]
	if not record then return end

	if record.connections then
		for _, c in ipairs(record.connections) do
			pcall(function() c:Disconnect() end)
		end
		table.clear(record.connections)
	end

	if record.items then
		for _, item in ipairs(record.items) do
			if item.billboard and item.billboard.Parent then
				pcall(function() item.billboard:Destroy() end)
			end
		end
		table.clear(record.items)
	end

	activeTimers[hazardInfo] = nil
end

--// Cập nhật khi hazard chuyển đổi trạng thái Trajectory
function timerVisual.UpdateHazardVisualColor(hazardInfo, isTrajectory)
	if not hazardInfo then return end
	local record = activeTimers[hazardInfo]
	if record then
		updateTimerText(record, hazardInfo)
	else
		timerVisual.AttachTimerVisual(hazardInfo)
	end
end

--// Xóa sạch toàn bộ Timer Visuals
function timerVisual.ClearAll()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	for info in pairs(activeTimers) do
		timerVisual.DetachTimerVisual(info)
	end
	table.clear(activeTimers)
end

--// Làm mới toàn bộ Visuals cho tất cả các hazard hiện có
function timerVisual.RefreshAll()
	timerVisual.ClearAll()
	if not enabled or not data then return end

	for _, info in pairs(data.GetActiveHazardsMap()) do
		if info then
			timerVisual.AttachTimerVisual(info)
		end
	end
end

--// Bật / tắt 3D Timer Visualizer
function timerVisual.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		timerVisual.RefreshAll()
	else
		timerVisual.ClearAll()
	end
end

--// Dọn dẹp khi script shutdown
lifecycle.Register(function()
	timerVisual.ClearAll()
end)

return timerVisual
end function __DIST.m()-- HazardScanner – Trajectory Visualizer (DungeonQuest):
-- Dự báo và vẽ đường quỹ đạo nguy hiểm (Orange Trajectory Corridor) tĩnh cho các chiêu thức đang di chuyển.
-- Chiều dài dải cam được cố định theo cấu hình slider (predictionLength).
-- Vùng màu cam được đối xử như một Danger Zone thực thụ: bất kỳ điểm nào nằm trong hành lang cam đều là Nguy Hiểm,
-- buộc hệ thống tìm Safe Spot bước ngang thoát hoàn toàn ra ngoài quỹ đạo đạn (Side-Step Escape).

--// Imports

local services = __DIST.load('a')
local lifecycle = __DIST.load('b')
local geometry = __DIST.load('j')
local timerVisual = __DIST.load('l')

local RunService = services.RunService or game:GetService("RunService")
local player = services.player

--// Table
local trajectory = {}

--// State
local enabled = false
local data = nil
local predictionLength = 45 -- studs (chiều dài dải visual hiển thị quỹ đạo đạn)
local customLengths = {
	["secondbossmovingbeam"] = 80,
}
local customWidths = {
	["firstbossbigspike"] = 28,
	["firstbossseekingspikes"] = 10,
}
local activeRecords = {} -- [hazardInfo] = { ad = BoxHandleAdornment, mainPart = BasePart, connections = {}, lastPos = Vector3, lastClock = number, velocity = Vector3, dir = Vector3, isMoving = boolean }
local heartbeatConnection = nil

--// Constants
local FADE_TRANSPARENCY_THRESHOLD = 0.85
local TRAJECTORY_COLOR = Color3.fromRGB(255, 140, 0) -- Màu cam nổi bật
local TRAJECTORY_TRANSPARENCY = 0.65
local GROUND_THICKNESS = 0.20
local MOVING_SPEED_THRESHOLD = 3.5 -- studs/s (ngưỡng tốc độ để coi là đang di chuyển)

--// Danh sách các Projectile đặc biệt tự động xác định Trajectory ngay lập tức khi xuất hiện (Frame 0)
--// Modes:
--//   "target_player" (hoặc true): Hướng thẳng từ vị trí projectile tới người chơi tại thời điểm spawn
--//   "look_vector": Hướng theo LookVector của CFrame projectile lúc spawn
local INSTANT_PROJECTILES = {
	["firstbossseekingspikes"] = "look_vector",
	["firstbossbigspike"] = "look_vector",
	["firstbossbeampart"] = "look_vector",
	["secondbossmovingbeam"] = "look_vector",
}

--// Helper nhận diện tia định hướng telegraph (firstBossBeamPart)
local function isBeamTelegraph(hazardName)
	if not hazardName or type(hazardName) ~= "string" then return false end
	local clean = hazardName:lower():gsub("%s+", "")
	return string.find(clean, "firstbossbeampart", 1, true) ~= nil
end

--// Phân loại tia beam thuộc Big Spike hay Seeking Spike
local function getSpikeBeamType(inst)
	if not inst then return "seeking_spike" end
	local name = typeof(inst) == "string" and inst or (inst.Name or "")
	local clean = name:lower():gsub("%s+", "")
	if not string.find(clean, "firstbossbeampart", 1, true) then
		if string.find(clean, "bigspike", 1, true) and not string.find(clean, "seekingspike", 1, true) then
			return "big_spike"
		end
		if string.find(clean, "seekingspike", 1, true) then
			return "seeking_spike"
		end
		return nil
	end

	if typeof(inst) == "Instance" then
		local beam = inst:FindFirstChildWhichIsA("Beam", true)
		if beam then
			if beam.Width0 >= 25 or beam.Width1 >= 25 then
				return "big_spike"
			else
				return "seeking_spike"
			end
		end

		local bPos = inst:IsA("BasePart") and inst.Position or (inst:IsA("Model") and inst:GetPivot().Position)
		if bPos then
			for _, child in ipairs(workspace:GetChildren()) do
				local cName = child.Name:lower():gsub("%s+", "")
				if string.find(cName, "firstbossbigspike", 1, true) then
					local sPos = child:IsA("BasePart") and child.Position or (child:IsA("Model") and child:GetPivot().Position)
					if sPos and (sPos - bPos).Magnitude < 15 then
						return "big_spike"
					end
				elseif string.find(cName, "seekingspike", 1, true) then
					local sPos = child:IsA("BasePart") and child.Position or (child:IsA("Model") and child:GetPivot().Position)
					if sPos and (sPos - bPos).Magnitude < 15 then
						return "seeking_spike"
					end
				end
			end
		end
	end

	return "seeking_spike"
end

--// Helper nhận diện skill BigSpike (Boss 1 - gồm cả tia telegraph và đạn)
local function isBigSpike(hazardName, inst)
	if not hazardName or type(hazardName) ~= "string" then return false end
	local clean = hazardName:lower():gsub("%s+", "")
	if #clean == 0 or string.find(clean, "seekingspike", 1, true) then return false end
	if string.find(clean, "firstbossbeampart", 1, true) then
		return getSpikeBeamType(inst) == "big_spike"
	end
	return string.find(clean, "firstbossbigspike", 1, true) ~= nil
		or string.find(clean, "bigspike", 1, true) ~= nil
end

--// Helper nhận diện skill SeekingSpike (Boss 1 - gồm cả tia telegraph và đạn)
local function isSeekingSpike(hazardName, inst)
	if not hazardName or type(hazardName) ~= "string" then return false end
	local clean = hazardName:lower():gsub("%s+", "")
	if #clean == 0 or string.find(clean, "firstbossbigspike", 1, true) then return false end
	if string.find(clean, "firstbossbeampart", 1, true) then
		return getSpikeBeamType(inst) == "seeking_spike"
	end
	return string.find(clean, "firstbossseekingspikes", 1, true) ~= nil
		or string.find(clean, "seekingspike", 1, true) ~= nil
end

--// Helper nhận diện chung chiêu Spike của Boss 1 (BigSpike hoặc SeekingSpike)
local function isBossSpike(hazardName, inst)
	return isBigSpike(hazardName, inst) or isSeekingSpike(hazardName, inst)
end

--// Đọc chính xác dữ liệu từ tia định hướng do Game tạo (firstBossBeamPart)
--// Trích xuất: độ dài beam (khoảng cách tới Attachment2), hướng bay LookVector, điểm xuất phát và điểm đích
local function getTelegraphBeamData(inst)
	if not inst or not inst.Parent then return nil, nil, nil, nil end

	local beamPart = nil
	local instName = (inst.Name or ""):lower()
	if isBeamTelegraph(instName) then
		beamPart = inst:IsA("BasePart") and inst or inst:FindFirstChildWhichIsA("BasePart")
	end

	-- Nếu inst là spike hoặc chưa có beamPart: tìm beamPart lân cận trong workspace
	if not beamPart then
		local spikePos = inst:IsA("BasePart") and inst.Position or (inst:IsA("Model") and inst:GetPivot().Position)
		if spikePos then
			local bestDist = 35.0
			local expectedType = isBigSpike(inst.Name, inst) and "big_spike" or "seeking_spike"
			for _, child in ipairs(workspace:GetChildren()) do
				local cName = child.Name:lower()
				if isBeamTelegraph(cName) or string.find(cName, "beampart", 1, true) then
					if getSpikeBeamType(child) == expectedType then
						local bPos = child:IsA("BasePart") and child.Position or (child:IsA("Model") and child:GetPivot().Position)
						if bPos then
							local dist = (bPos - spikePos).Magnitude
							if dist < bestDist then
								bestDist = dist
								beamPart = child
							end
						end
					end
				end
			end
		end
	end

	if not beamPart then return nil, nil, nil, nil end

	local att2 = beamPart:FindFirstChild("Attachment2", true)
	if not att2 or not att2:IsA("Attachment") then
		for _, desc in ipairs(beamPart:GetDescendants()) do
			if desc:IsA("Attachment") and desc.Name ~= "Attachment0" and desc.Name ~= "Attachment1" then
				att2 = desc
				break
			end
		end
	end

	local bPos = beamPart.Position
	local targetWorldPos = att2 and att2.WorldPosition

	if targetWorldPos and bPos then
		local delta = targetWorldPos - bPos
		local hDelta = Vector3.new(delta.X, 0, delta.Z)
		local length = hDelta.Magnitude
		if length > 5 then
			local dir = hDelta.Unit
			return length, dir, bPos, targetWorldPos
		end
	end

	return nil, nil, nil, nil
end
local findBigSpikeBeamTelegraph = getTelegraphBeamData

--// Đo đạc kích thước bao quát thực tế của Spike (tính cả toàn bộ Descendant Parts và SpecialMesh Scale)
local function measureSpikeDimensions(inst)
	if not inst then return nil end
	local maxDimX, maxDimY, maxDimZ = 0, 0, 0
	local parts = {}
	if inst:IsA("BasePart") then
		table.insert(parts, inst)
	else
		for _, desc in ipairs(inst:GetDescendants()) do
			if desc:IsA("BasePart") then
				table.insert(parts, desc)
			end
		end
	end

	for _, p in ipairs(parts) do
		local sz = p.Size
		local mesh = p:FindFirstChildWhichIsA("SpecialMesh", true)
		if mesh then
			sz = Vector3.new(sz.X * math.abs(mesh.Scale.X), sz.Y * math.abs(mesh.Scale.Y), sz.Z * math.abs(mesh.Scale.Z))
		end
		maxDimX = math.max(maxDimX, sz.X)
		maxDimY = math.max(maxDimY, sz.Y)
		maxDimZ = math.max(maxDimZ, sz.Z)
	end

	if maxDimX <= 0 and maxDimY <= 0 and maxDimZ <= 0 then
		return nil
	end

	local dims = { maxDimX, maxDimY, maxDimZ }
	table.sort(dims)
	local w = dims[2]
	if w < 2.0 then
		w = math.max(dims[1], dims[2])
	end
	return w
end

--// Tính bề rộng thực tế của chính BasePart firstBossBigSpike
local cachedBigSpikeWidth = nil
local function getBigSpikeWidth(mainPart)
	-- 1. Ưu tiên cấu hình custom width từ slider / user
	if customWidths["firstbossbigspike"] then
		return customWidths["firstbossbigspike"]
	end

	-- 2. Nếu đã cache kích thước trước đó
	if cachedBigSpikeWidth then
		return cachedBigSpikeWidth
	end

	-- 3. Đo đạc từ instance thực tế trong workspace
	if mainPart and not isBeamTelegraph(mainPart.Name) then
		local w = measureSpikeDimensions(mainPart)
		if w and w >= 4.0 then
			cachedBigSpikeWidth = math.clamp(w, 8.0, 60.0)
			return cachedBigSpikeWidth
		end
	end

	-- Hoặc tìm live spike trong workspace
	for _, child in ipairs(workspace:GetChildren()) do
		local cName = child.Name:lower()
		if string.find(cName, "firstbossbigspike", 1, true) or (string.find(cName, "bigspike", 1, true) and not string.find(cName, "seekingspike", 1, true) and not isBeamTelegraph(cName)) then
			local w = measureSpikeDimensions(child)
			if w and w >= 4.0 then
				cachedBigSpikeWidth = math.clamp(w, 8.0, 60.0)
				return cachedBigSpikeWidth
			end
		end
	end

	-- 4. Đọc từ ReplicatedStorage.enemyProjectiles.firstBossBigSpike
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local ep = ReplicatedStorage:FindFirstChild("enemyProjectiles")
	local tmpl = ep and ep:FindFirstChild("firstBossBigSpike")
	if tmpl then
		local w = measureSpikeDimensions(tmpl)
		if w and w >= 4.0 then
			cachedBigSpikeWidth = math.clamp(w, 8.0, 60.0)
			return cachedBigSpikeWidth
		end
	end

	return 28.0
end

--// Tính bề rộng thực tế của chính BasePart firstBossSeekingSpikes
local cachedSeekingSpikeWidth = nil
local function getSeekingSpikeWidth(mainPart)
	-- 1. Ưu tiên cấu hình custom width từ slider / user
	if customWidths["firstbossseekingspikes"] then
		return customWidths["firstbossseekingspikes"]
	end

	-- 2. Nếu đã cache kích thước trước đó
	if cachedSeekingSpikeWidth then
		return cachedSeekingSpikeWidth
	end

	-- 3. Đo đạc từ instance thực tế trong workspace
	if mainPart and not isBeamTelegraph(mainPart.Name) then
		local w = measureSpikeDimensions(mainPart)
		if w and w >= 2.0 then
			cachedSeekingSpikeWidth = math.clamp(w, 4.0, 40.0)
			return cachedSeekingSpikeWidth
		end
	end

	-- Hoặc tìm live spike trong workspace
	for _, child in ipairs(workspace:GetChildren()) do
		local cName = child.Name:lower():gsub("%s+", "")
		if string.find(cName, "seekingspike", 1, true) and not isBeamTelegraph(cName) then
			local w = measureSpikeDimensions(child)
			if w and w >= 2.0 then
				cachedSeekingSpikeWidth = math.clamp(w, 4.0, 40.0)
				return cachedSeekingSpikeWidth
			end
		end
	end

	-- 4. Đọc từ ReplicatedStorage.enemyProjectiles.firstBossSeekingSpikes
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local ep = ReplicatedStorage:FindFirstChild("enemyProjectiles")
	local tmpl = ep and ep:FindFirstChild("firstBossSeekingSpikes")
	if tmpl then
		local w = measureSpikeDimensions(tmpl)
		if w and w >= 2.0 then
			cachedSeekingSpikeWidth = math.clamp(w, 4.0, 40.0)
			return cachedSeekingSpikeWidth
		end
	end

	return 10.0
end

local function getBossSpikeWidth(hazardName, mainPart)
	if isBigSpike(hazardName, mainPart) then
		return getBigSpikeWidth(mainPart)
	else
		return getSeekingSpikeWidth(mainPart)
	end
end

--// Lấy độ dài trajectory (mặc định hoặc custom theo đối tượng / theo tia định hướng của game)
local function getHazardPredictionLength(hazardInfoOrName)
	if not hazardInfoOrName then return predictionLength end
	local name = ""
	local record = nil
	if type(hazardInfoOrName) == "string" then
		name = hazardInfoOrName
	elseif type(hazardInfoOrName) == "table" then
		name = hazardInfoOrName.Name or (hazardInfoOrName.Instance and hazardInfoOrName.Instance.Name) or ""
		record = activeRecords[hazardInfoOrName]
	end

	-- Nếu là Boss Spike (Big Spike hoặc Seeking Spike): ưu tiên số 1 là độ dài thực tế từ tia định hướng của game
	local inst = (record and record.mainPart) or (type(hazardInfoOrName) == "table" and hazardInfoOrName.Instance)
	if isBossSpike(name, inst) then
		if record and record.beamLength then
			return record.beamLength
		end
		if isBigSpike(name, inst) then
			return customLengths["firstbossbigspike"] or 140.0
		else
			return customLengths["firstbossseekingspikes"] or 80.0
		end
	end

	if record and record.beamLength then
		return record.beamLength
	end

	local clean = name:lower():gsub("%s+", "")
	if customLengths[clean] then
		return customLengths[clean]
	end
	for k, v in pairs(customLengths) do
		if string.find(clean, k, 1, true) then
			return v
		end
	end
	return predictionLength
end

--// Lấy vị trí người chơi
local function getPlayerPosition()
	local char = player and player.Character
	if not char then return nil end
	local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
	if not root then return nil end
	return root.Position
end

--// Tính hướng bay ngay lập tức tại Frame 0 nếu hazard nằm trong danh sách INSTANT_PROJECTILES
local function getInstantDirection(hazardName, mainPart)
	if not hazardName or not mainPart then return nil, nil end
	local clean = hazardName:lower():gsub("%s+", "")
	local mode = INSTANT_PROJECTILES[clean]
	if not mode then
		for name, m in pairs(INSTANT_PROJECTILES) do
			if string.find(clean, name, 1, true) then
				mode = m
				break
			end
		end
	end
	if not mode then return nil, nil end

	if mode == "look_vector" then
		local lv = mainPart.CFrame.LookVector
		local hDir = Vector3.new(lv.X, 0, lv.Z)
		if hDir.Magnitude > 0.01 then
			return hDir.Unit, mode
		end
	else
		-- "target_player" / true: Hướng thẳng từ projectile tới player
		local pPos = getPlayerPosition()
		if pPos then
			local diff = pPos - mainPart.Position
			local hDiff = Vector3.new(diff.X, 0, diff.Z)
			if hDiff.Magnitude > 0.1 then
				return hDiff.Unit, mode
			end
		end
		local lv = mainPart.CFrame.LookVector
		local hDir = Vector3.new(lv.X, 0, lv.Z)
		if hDir.Magnitude > 0.01 then
			return hDir.Unit, mode
		end
	end
	return nil, nil
end

--// Lấy độ cao mặt sàn theo chân người chơi
local function getPlayerGroundY()
	local char = player and player.Character
	if not char then return nil end
	local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
	if not root then return nil end
	return root.Position.Y - 2.5
end

--// Gán data source từ detection (tránh circular dependency)
function trajectory.BindDetection(dataSource)
	data = dataSource or nil
end

function trajectory.IsEnabled()
	return enabled
end

function trajectory.GetPredictionLength()
	return predictionLength
end

function trajectory.SetPredictionLength(val)
	if type(val) == "number" and val > 0 then
		predictionLength = math.clamp(val, 10, 200)
		trajectory.RefreshAll()
	end
end

function trajectory.GetHazardPredictionLength(hazardNameOrInfo)
	return getHazardPredictionLength(hazardNameOrInfo)
end

function trajectory.GetCustomLength(key)
	if not key then return nil end
	local clean = key:lower():gsub("%s+", "")
	return customLengths[clean]
end

function trajectory.SetCustomLength(key, val)
	if not key then return end
	local clean = key:lower():gsub("%s+", "")
	if type(val) == "number" and val > 0 then
		customLengths[clean] = math.clamp(val, 10, 300)
	else
		customLengths[clean] = nil
	end
	trajectory.RefreshAll()
end

function trajectory.GetSecondBossBeamLength()
	return customLengths["secondbossmovingbeam"] or 80
end

function trajectory.SetSecondBossBeamLength(val)
	trajectory.SetCustomLength("secondbossmovingbeam", val)
end

function trajectory.GetFirstBossBigSpikeWidth()
	return customWidths["firstbossbigspike"] or 28
end

function trajectory.SetFirstBossBigSpikeWidth(val)
	if type(val) == "number" and val > 0 then
		customWidths["firstbossbigspike"] = math.clamp(val, 6, 60)
	else
		customWidths["firstbossbigspike"] = nil
	end
	cachedBigSpikeWidth = nil
	trajectory.RefreshAll()
end

function trajectory.GetFirstBossSeekingSpikeWidth()
	return customWidths["firstbossseekingspikes"] or (cachedSeekingSpikeWidth or 10)
end

function trajectory.SetFirstBossSeekingSpikeWidth(val)
	if type(val) == "number" and val > 0 then
		customWidths["firstbossseekingspikes"] = math.clamp(val, 4, 40)
	else
		customWidths["firstbossseekingspikes"] = nil
	end
	cachedSeekingSpikeWidth = nil
	trajectory.RefreshAll()
end

function trajectory.GetCustomWidth(key)
	if not key then return nil end
	local clean = key:lower():gsub("%s+", "")
	return customWidths[clean]
end

function trajectory.SetCustomWidth(key, val)
	if not key then return end
	local clean = key:lower():gsub("%s+", "")
	if type(val) == "number" and val > 0 then
		customWidths[clean] = math.clamp(val, 4, 100)
	else
		customWidths[clean] = nil
	end
	trajectory.RefreshAll()
end

function trajectory.IsHazardMoving(hazardInfo)
	if not hazardInfo then return false end
	local record = activeRecords[hazardInfo]
	return record and record.isMoving == true
end

function trajectory.GetHazardDirection(hazardInfo)
	if not hazardInfo then return nil end
	local record = activeRecords[hazardInfo]
	return record and record.dir or nil
end

--// Tính trọng tâm (Centroid) và Độ rộng bao quát thực tế (Span Width) vuông góc với hướng di chuyển
--// Sử dụng định lý chiếu OBB (Separating Axis Theorem): chiếu chính xác 3 trục của từng Part lên vector pháp tuyến normal
local function getHazardCentroidAndSpan(hazardInfo, dir)
	local inst = hazardInfo.Instance
	if not inst or not inst.Parent then return nil, 4 end

	local margin = geometry.GetTrajectoryMargin and geometry.GetTrajectoryMargin() or 2.0
	local hazardName = hazardInfo.Name or (inst and inst.Name) or ""

	if isBossSpike(hazardName, inst) then
		local record = activeRecords[hazardInfo]
		local mainPart = (record and record.mainPart) or (inst:IsA("BasePart") and inst or inst.PrimaryPart or inst:FindFirstChildWhichIsA("BasePart"))
		local startPos = (record and record.beamStartPos) or (mainPart and mainPart.Position) or inst.Position
		local spikeWidth = getBossSpikeWidth(hazardName, mainPart)
		local spanWidth = math.max(1, spikeWidth + margin * 2)
		return Vector3.new(startPos.X, 0, startPos.Z), spanWidth
	end

	local parts = {}
	local forceCircle = geometry.IsForceCircle and geometry.IsForceCircle(hazardName)

	if inst:IsA("BasePart") then
		if inst.Transparency <= FADE_TRANSPARENCY_THRESHOLD then
			table.insert(parts, inst)
		end
	else
		for _, desc in ipairs(inst:GetDescendants()) do
			if desc:IsA("BasePart") and desc.Parent and desc.Transparency <= FADE_TRANSPARENCY_THRESHOLD then
				table.insert(parts, desc)
			end
		end
	end

	if #parts == 0 then return nil, 4 end

	-- Vector pháp tuyến vuông góc với hướng bay trên mặt sàn X-Z: normal = (-dir.Z, 0, dir.X)
	local normal = Vector3.new(-dir.Z, 0, dir.X)
	local minProjN, maxProjN = math.huge, -math.huge
	local sumProjU = 0

	for _, p in ipairs(parts) do
		local pos = p.Position
		local s = p.Size

		-- Bán kính chiếu nửa bề rộng (Half-extent) lên vector normal
		local halfExtent = 0
		if forceCircle or (p:IsA("Part") and (p.Shape == Enum.PartType.Ball or p.Shape == Enum.PartType.Cylinder)) then
			halfExtent = math.max(s.X, s.Y, s.Z) / 2
		else
			-- Định lý chiếu OBB khi bay thẳng: r = hx * |Right . n| + hy * |Up . n| + hz * |Look . n|
			local cf = p.CFrame
			local rx = cf.RightVector
			local ry = cf.UpVector
			local rz = cf.LookVector
			local hx = s.X / 2
			local hy = s.Y / 2
			local hz = s.Z / 2
			halfExtent = hx * math.abs(rx.X * normal.X + rx.Z * normal.Z)
				+ hy * math.abs(ry.X * normal.X + ry.Z * normal.Z)
				+ hz * math.abs(rz.X * normal.X + rz.Z * normal.Z)
		end

		local projN = pos.X * normal.X + pos.Z * normal.Z
		minProjN = math.min(minProjN, projN - halfExtent)
		maxProjN = math.max(maxProjN, projN + halfExtent)

		local projU = pos.X * dir.X + pos.Z * dir.Z
		sumProjU += projU
	end

	-- Bề rộng chuẩn xác = (max - min) + 2 * margin (khớp 100% với Blue Danger Zone)
	local spanWidth = math.max(1, (maxProjN - minProjN) + margin * 2)

	-- Tọa độ trung tâm chiếu: trung điểm khoảng cách trên trục normal và trung bình trên trục dir
	local centerN = (minProjN + maxProjN) / 2
	local centerU = sumProjU / #parts

	-- Tái lập vector tọa độ tâm trong không gian thế giới
	local centerBase = dir * centerU + normal * centerN

	return centerBase, spanWidth
end

--// Cập nhật vị trí và góc xoay của dải quỹ đạo màu cam đối xứng hoàn hảo
local function updateTrajectoryCFrame(ad, mainPart, centroid, dir, targetY, length, width)
	if not mainPart or not mainPart.Parent or not ad or not ad.Parent then return end

	-- Tâm của dải quỹ đạo bắt đầu từ trọng tâm toàn hazard và kéo dài về phía trước (centroid + dir * (length / 2))
	local halfLength = length / 2
	local centerPos = Vector3.new(
		centroid.X + dir.X * halfLength,
		targetY or centroid.Y,
		centroid.Z + dir.Z * halfLength
	)

	-- LookAt theo hướng di chuyển dir
	local targetLook = centerPos + Vector3.new(dir.X, 0, dir.Z)
	local desiredWorldCFrame = CFrame.lookAt(centerPos, targetLook)

	ad.CFrame = (ad.Adornee == workspace.Terrain) and desiredWorldCFrame or mainPart.CFrame:ToObjectSpace(desiredWorldCFrame)
	ad.Size = Vector3.new(width, GROUND_THICKNESS, length)
	if not ad.Visible then ad.Visible = true end
end

--// Vòng lặp Heartbeat: theo dõi hướng di chuyển và ghim dải quỹ đạo tĩnh
local function onHeartbeat()
	if not enabled then return end
	local hasAny = false
	local now = os.clock()
	local targetY = getPlayerGroundY()

	for info, record in pairs(activeRecords) do
		local inst = info.Instance
		if not inst or not inst.Parent then
			trajectory.DetachTrajectoryVisuals(info)
		else
			hasAny = true
			local mainPart = record.mainPart
			local hazardName = info.Name or (inst and inst.Name)
			local isChasing = timerVisual and timerVisual.IsChasingProjectile and timerVisual.IsChasingProjectile(hazardName)

			if isChasing then
				if record.ad and record.ad.Visible then
					record.ad.Visible = false
				end
				record.isMoving = false
				info.IsTrajectory = false
			elseif mainPart and mainPart.Parent then
				local currentPos = mainPart.Position
				local dt = now - (record.lastClock or now)

				if record.isBossSpike then
					if not record.beamFound then
						local bLen, bDir, bStart, bTarget = getTelegraphBeamData(mainPart)
						if bLen and bDir then
							record.beamFound = true
							record.beamLength = bLen
							record.beamDir = bDir
							record.beamStartPos = bStart
							record.beamTargetPos = bTarget
							record.dir = bDir
						end
					end
					if record.beamDir then
						record.dir = record.beamDir
					end
					record.isMoving = true
				end

				-- Cập nhật hướng di chuyển định kỳ (mỗi ~0.035s)
				if dt >= 0.035 then
					local delta = currentPos - (record.lastPos or currentPos)
					local speed = delta.Magnitude / dt
					local hDelta = Vector3.new(delta.X, 0, delta.Z)
					local hSpeed = hDelta.Magnitude / dt
					local wasMoving = record.isMoving == true

					if hSpeed >= MOVING_SPEED_THRESHOLD then
						record.isMoving = true
						if not record.isBossSpike then
							record.dir = hDelta.Unit
						end
					else
						if not record.isInstant and not record.isBossSpike and dt >= 0.25 and speed < MOVING_SPEED_THRESHOLD then
							record.isMoving = false
						end
					end

					if record.isMoving ~= wasMoving then
						info.IsTrajectory = record.isMoving
						info.HazardZones = nil
						if data and data.UpdateHazardVisualColor then
							pcall(data.UpdateHazardVisualColor, info, record.isMoving)
						end
						local visualizer = __DIST.load('k')
						if visualizer and visualizer.UpdateHazardVisualColor then
							pcall(visualizer.UpdateHazardVisualColor, info, record.isMoving)
						end
					end

					record.lastPos = currentPos
					record.lastClock = now
				end

				-- Nếu đang di chuyển hoặc là Instant Projectile có hướng, cập nhật visual quỹ đạo tĩnh theo predictionLength / custom length
				if record.isMoving and record.dir and record.ad then
					local centroid, spanWidth = getHazardCentroidAndSpan(info, record.dir)
					if centroid then
						local hLength = getHazardPredictionLength(info)
						updateTrajectoryCFrame(record.ad, mainPart, centroid, record.dir, targetY, hLength, spanWidth)
					end
				else
					if record.ad and record.ad.Visible then
						record.ad.Visible = false
					end
				end
			end
		end
	end

	if not hasAny and heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
end

local function ensureHeartbeat()
	if not heartbeatConnection and enabled then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

--// Gỡ visual quỹ đạo của một hazard
function trajectory.DetachTrajectoryVisuals(hazardInfo)
	if not hazardInfo then return end
	local record = activeRecords[hazardInfo]
	if not record then return end

	if record.ad then
		pcall(function() record.ad:Destroy() end)
		record.ad = nil
	end

	if record.connections then
		for _, c in ipairs(record.connections) do
			pcall(function() c:Disconnect() end)
		end
		table.clear(record.connections)
	end

	activeRecords[hazardInfo] = nil
end

--// Gắn visual quỹ đạo cho một hazard
function trajectory.AttachTrajectoryVisuals(hazardInfo)
	if not enabled or not hazardInfo then return end
	if activeRecords[hazardInfo] then
		trajectory.DetachTrajectoryVisuals(hazardInfo)
	end

	local inst = hazardInfo.Instance
	if not inst or not inst.Parent then return end

	local hazardName = hazardInfo.Name or (inst and inst.Name)
	if timerVisual and timerVisual.IsChasingProjectile and timerVisual.IsChasingProjectile(hazardName) then
		-- Chasing Projectile: tuyệt đối không sinh ra hành lang Trajectory cam
		hazardInfo.IsTrajectory = false
		return
	end

	local mainPart = nil
	if inst:IsA("BasePart") then
		mainPart = inst
	else
		mainPart = inst.PrimaryPart or inst:FindFirstChildWhichIsA("BasePart")
		if not mainPart then
			for _, desc in ipairs(inst:GetDescendants()) do
				if desc:IsA("BasePart") and desc.Parent then
					mainPart = desc
					break
				end
			end
		end
	end

	if not mainPart or not mainPart.Parent then return end

	local hLength = getHazardPredictionLength(hazardInfo)
	local box = Instance.new("BoxHandleAdornment")
	box.Name = "HazardTrajectoryCorridor"
	box.Adornee = workspace.Terrain
	box.Size = Vector3.new(4, GROUND_THICKNESS, hLength)
	box.Color3 = TRAJECTORY_COLOR
	box.Transparency = TRAJECTORY_TRANSPARENCY
	box.ZIndex = 1 -- Nằm dưới đĩa đỏ (ZIndex = 2)
	box.AlwaysOnTop = true
	box.Visible = false -- Tạm ẩn cho đến khi có hướng
	box.Parent = workspace.Terrain

	local hazardName = hazardInfo.Name or (inst and inst.Name)
	local isBeam = isBeamTelegraph(hazardName)
	local isSpike = isBossSpike(hazardName, inst)
	local spikeType = isSpike and (isBigSpike(hazardName, inst) and "big_spike" or "seeking_spike") or nil

	-- Tránh tạo 2 hành lang cam trùng lặp giữa Beam và Spike:
	-- Nếu Beam đã tạo hành lang, Spike không tạo hành lang thứ 2 (và ngược lại)
	if isSpike then
		if not isBeam then
			-- inst là Spike thực tế: kiểm tra xem Beam của nó đã tạo corridor chưa
			for otherInfo, otherRecord in pairs(activeRecords) do
				if otherRecord and otherRecord.isBeam and otherRecord.spikeType == spikeType then
					otherRecord.linkedSpike = mainPart
					hazardInfo.IsTrajectory = false
					return
				end
			end
		else
			-- inst là Beam: kiểm tra xem Spike đã tạo corridor chưa
			for otherInfo, otherRecord in pairs(activeRecords) do
				if otherRecord and not otherRecord.isBeam and otherRecord.spikeType == spikeType then
					hazardInfo.IsTrajectory = false
					return
				end
			end
		end
	end

	local connections = {}
	if not isBeam then
		local conn = mainPart:GetPropertyChangedSignal("Transparency"):Connect(function()
			if mainPart.Parent and mainPart.Transparency > FADE_TRANSPARENCY_THRESHOLD then
				pcall(function() box:Destroy() end)
			end
		end)
		table.insert(connections, conn)
	end

	local record = nil
	local conn2 = mainPart.AncestryChanged:Connect(function(_, parent)
		if not parent then
			if record and record.linkedSpike and record.linkedSpike.Parent and record.linkedSpike.Transparency <= FADE_TRANSPARENCY_THRESHOLD then
				local sConn = record.linkedSpike.AncestryChanged:Connect(function(_, spParent)
					if not spParent then
						pcall(function() box:Destroy() end)
					end
				end)
				table.insert(connections, sConn)
				return
			end
			pcall(function() box:Destroy() end)
		end
	end)
	table.insert(connections, conn2)

	-- Kiểm tra xem đối tượng có thuộc danh sách Instant Projectiles (tự lock-on hướng tại Frame 0) không
	local instantDir, instantMode = getInstantDirection(hazardName, mainPart)
	local isInstant = instantDir ~= nil

	local beamLength, beamDir, beamStartPos, beamTargetPos = nil, nil, nil, nil
	if isSpike then
		beamLength, beamDir, beamStartPos, beamTargetPos = getTelegraphBeamData(inst)
		if beamDir then
			instantDir = beamDir
			isInstant = true
		end
	end

	record = {
		ad = box,
		connections = connections,
		mainPart = mainPart,
		lastPos = mainPart.Position,
		lastClock = os.clock(),
		velocity = Vector3.zero,
		dir = instantDir,
		isMoving = isInstant,
		isInstant = isInstant,
		instantMode = instantMode,
		isBossSpike = isSpike,
		isBigSpike = isBigSpike(hazardName, inst),
		isSeekingSpike = isSeekingSpike(hazardName, inst),
		spikeType = spikeType,
		isBeam = isBeam,
		beamFound = beamLength ~= nil,
		beamLength = beamLength,
		beamDir = beamDir,
		beamStartPos = beamStartPos or mainPart.Position,
		beamTargetPos = beamTargetPos,
		linkedSpike = nil,
	}

	if isBeam and spikeType then
		local spikeKeyword = spikeType == "big_spike" and "firstbossbigspike" or "seekingspike"
		for _, child in ipairs(workspace:GetChildren()) do
			local cName = child.Name:lower():gsub("%s+", "")
			if string.find(cName, spikeKeyword, 1, true) and not isBeamTelegraph(cName) then
				local sPart = child:IsA("BasePart") and child or (child:FindFirstChildWhichIsA("BasePart") or (child:IsA("Model") and child.PrimaryPart))
				if sPart then
					local dist = (sPart.Position - mainPart.Position).Magnitude
					if dist < 25 then
						record.linkedSpike = sPart
						break
					end
				end
			end
		end
	end

	activeRecords[hazardInfo] = record

	-- Nếu là Instant Projectile: Kích hoạt ngay lập tức tại Frame 0 không cần chờ đo vận tốc
	if isInstant and instantDir then
		hazardInfo.IsTrajectory = true
		hazardInfo.HazardZones = nil
		local targetY = getPlayerGroundY()
		local centroid, spanWidth = getHazardCentroidAndSpan(hazardInfo, instantDir)
		local currentHLength = getHazardPredictionLength(hazardInfo)
		if centroid then
			updateTrajectoryCFrame(box, mainPart, centroid, instantDir, targetY, currentHLength, spanWidth)
		end
		if data and data.UpdateHazardVisualColor then
			pcall(data.UpdateHazardVisualColor, hazardInfo, true)
		end
		local visualizer = __DIST.load('k')
		if visualizer and visualizer.UpdateHazardVisualColor then
			pcall(visualizer.UpdateHazardVisualColor, hazardInfo, true)
		end
		local timerVisual = __DIST.load('l')
		if timerVisual and timerVisual.UpdateHazardVisualColor then
			pcall(timerVisual.UpdateHazardVisualColor, hazardInfo, true)
		end
	end

	ensureHeartbeat()
end

--// Xóa toàn bộ visual quỹ đạo
function trajectory.ClearAll()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	for info in pairs(activeRecords) do
		trajectory.DetachTrajectoryVisuals(info)
	end
	table.clear(activeRecords)
end

--// Refresh lại toàn bộ visual quỹ đạo
function trajectory.RefreshAll()
	trajectory.ClearAll()
	if not enabled or not data then return end

	for _, info in pairs(data.GetActiveHazardsMap()) do
		trajectory.AttachTrajectoryVisuals(info)
	end
end

--// Kiểm tra xem điểm P (hoặc vòng tròn bán kính extraRadius) có đang nằm trong hành lang nguy hiểm màu cam hay không.
--// Lấy danh sách các Trajectory Records nằm trong phạm vi maxRadius xung quanh origin (Broad-Phase Spatial Culling)
function trajectory.GetNearbyTrajectories(origin, maxRadius)
	maxRadius = maxRadius or 65
	local nearby = {}
	local ox, oz = origin.X, origin.Z

	for info, record in pairs(activeRecords) do
		if record.isMoving and record.dir and record.mainPart and record.mainPart.Parent then
			local centroid, spanWidth = getHazardCentroidAndSpan(info, record.dir)
			if centroid and spanWidth then
				local hLength = getHazardPredictionLength(info)
				local cx = centroid.X
				local cz = centroid.Z
				local dx = ox - cx
				local dz = oz - cz
				local distSq = dx * dx + dz * dz
				local totalReach = maxRadius + hLength + (spanWidth / 2)
				if distSq <= totalReach * totalReach then
					table.insert(nearby, { info = info, record = record })
				end
			end
		end
	end

	return nearby
end

--// Kiểm tra xem điểm P (hoặc vòng tròn bán kính extraRadius) có đang nằm trong hành lang nguy hiểm màu cam hay không.
--// Đối xử vùng màu cam như một Danger Zone thực thụ: Bất kỳ điểm nào giao thoa với vùng cam đều là NGUY HIỂM.
function trajectory.IsPointInAnyTrajectory(point, extraRadius, trajectoryList)
	local px, pz = point.X, point.Z
	extraRadius = extraRadius or 0

	-- Bề dày phủ lùi về phía sau centroid để ôm trọn cả thân thanh Beam (Cyan)
	local BACK_DEPTH = 3.0

	if trajectoryList then
		for _, item in ipairs(trajectoryList) do
			local info = item.info
			local record = item.record
			if record and record.isMoving and record.dir and record.mainPart and record.mainPart.Parent then
				local centroid, spanWidth = getHazardCentroidAndSpan(info, record.dir)
				if centroid and spanWidth then
					local hLength = getHazardPredictionLength(info)
					local dir = record.dir
					local normal = Vector3.new(-dir.Z, 0, dir.X)
					local vx = px - centroid.X
					local vz = pz - centroid.Z

					local projU = vx * dir.X + vz * dir.Z
					local projN = vx * normal.X + vz * normal.Z
					local halfWidth = spanWidth / 2

					local minU = -BACK_DEPTH
					local maxU = hLength

					if extraRadius <= 0 then
						if projU >= minU and projU <= maxU and math.abs(projN) <= halfWidth then
							return true, info, dir, centroid, spanWidth
						end
					else
						local dU = 0
						if projU < minU then
							dU = minU - projU
						elseif projU > maxU then
							dU = projU - maxU
						end
						local dN = math.max(0, math.abs(projN) - halfWidth)
						if (dU * dU + dN * dN) <= (extraRadius * extraRadius) then
							return true, info, dir, centroid, spanWidth
						end
					end
				end
			end
		end
		return false, nil, nil, nil, nil
	end

	for info, record in pairs(activeRecords) do
		if record.isMoving and record.dir and record.mainPart and record.mainPart.Parent then
			local centroid, spanWidth = getHazardCentroidAndSpan(info, record.dir)
			if centroid and spanWidth then
				local hLength = getHazardPredictionLength(info)
				local dir = record.dir
				local normal = Vector3.new(-dir.Z, 0, dir.X)
				local vx = px - centroid.X
				local vz = pz - centroid.Z

				-- Chiếu tọa độ điểm P lên trục di chuyển U và trục pháp tuyến N
				local projU = vx * dir.X + vz * dir.Z
				local projN = vx * normal.X + vz * normal.Z
				local halfWidth = spanWidth / 2

				local minU = -BACK_DEPTH
				local maxU = hLength

				-- Kiểm tra giao thoa hình học trực tiếp với dải hình hộp nguy hiểm (gồm cả thân thanh Cyan và dải Cam)
				if extraRadius <= 0 then
					if projU >= minU and projU <= maxU and math.abs(projN) <= halfWidth then
						return true, info, dir, centroid, spanWidth
					end
				else
					local dU = 0
					if projU < minU then
						dU = minU - projU
					elseif projU > maxU then
						dU = projU - maxU
					end
					local dN = math.max(0, math.abs(projN) - halfWidth)
					if (dU * dU + dN * dN) <= (extraRadius * extraRadius) then
						return true, info, dir, centroid, spanWidth
					end
				end
			end
		end
	end

	return false, nil, nil, nil, nil
end

--// Lấy danh sách các quỹ đạo nguy hiểm đang active (dùng cho telemetry / live radar)
function trajectory.GetActiveTrajectoriesList()
	local list = {}
	for info, record in pairs(activeRecords) do
		if record and record.isMoving and record.dir and record.mainPart and record.mainPart.Parent then
			local centroid, spanWidth = getHazardCentroidAndSpan(info, record.dir)
			if centroid and spanWidth then
				local hLength = getHazardPredictionLength(info)
				local speed = (record.velocity and record.velocity.Magnitude) or 0
				table.insert(list, {
					name = info.Name or (record.mainPart and record.mainPart.Name) or "Trajectory",
					originX = centroid.X,
					originZ = centroid.Z,
					dirX = record.dir.X,
					dirZ = record.dir.Z,
					length = hLength,
					width = spanWidth,
					speed = speed,
				})
			end
		end
	end
	return list
end

--// Bật / tắt Trajectory Visualizer
function trajectory.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		trajectory.RefreshAll()
	else
		trajectory.ClearAll()
	end
end

--// Lắng nghe thay đổi padding để refresh visual
geometry.OnPaddingChanged(function()
	if enabled then
		trajectory.RefreshAll()
	end
end)

--// Dọn dẹp khi shutdown
lifecycle.Register(function()
	trajectory.ClearAll()
end)

return trajectory
end function __DIST.n()
local MacLib = { 
	Options = {}, 
	Folder = "Maclib", 
	contextData = {},
	GetService = function(service)
		return cloneref and cloneref(game:GetService(service)) or game:GetService(service)
	end
}

--// Services
local TweenService = MacLib.GetService("TweenService")
local RunService = MacLib.GetService("RunService")
local HttpService = MacLib.GetService("HttpService")
local ContentProvider = MacLib.GetService("ContentProvider")
local UserInputService = MacLib.GetService("UserInputService")
local Lighting = MacLib.GetService("Lighting")
local Players = MacLib.GetService("Players")

--// Variables
local isStudio = RunService:IsStudio()
local LocalPlayer = Players.LocalPlayer

local windowState
local acrylicBlur
local hasGlobalSetting

local tabs = {}
local currentTabInstance = nil
local tabIndex = 0
local unloaded = false

local assets = {
	interFont = "rbxassetid://12187365364",
	userInfoBlurred = "rbxassetid://18824089198",
	toggleBackground = "rbxassetid://18772190202",
	togglerHead = "rbxassetid://18772309008",
	buttonImage = "rbxassetid://10709791437",
	searchIcon = "rbxassetid://86737463322606",
	colorWheel = "rbxassetid://2849458409",
	colorTarget = "rbxassetid://73265255323268",
	grid = "rbxassetid://121484455191370",
	globe = "rbxassetid://108952102602834",
	transform = "rbxassetid://90336395745819",
	dropdown = "rbxassetid://18865373378",
	sliderbar = "rbxassetid://18772615246",
	sliderhead = "rbxassetid://18772834246",
}

--// Functions
local function elevateThreadIdentity()
	pcall(function()
		local fn = setthreadidentity or set_thread_identity or setidentity or (syn and syn.set_thread_identity)
		if fn then
			local ok = pcall(fn, 7)
			if not ok then
				pcall(fn, 8)
			end
		end
	end)
end
MacLib.Elevate = elevateThreadIdentity

local function GetGui()
	elevateThreadIdentity()
	local newGui = Instance.new("ScreenGui")
	newGui.ScreenInsets = Enum.ScreenInsets.None
	newGui.ResetOnSpawn = false
	newGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	newGui.DisplayOrder = 2147483647

	local parent = RunService:IsStudio() 
		and LocalPlayer:FindFirstChild("PlayerGui")
		or (gethui and gethui())
		or (cloneref and cloneref(MacLib.GetService("CoreGui")) or MacLib.GetService("CoreGui"))

	newGui.Parent = parent
	return newGui
end

local function Tween(instance, tweeninfo, propertytable)
	elevateThreadIdentity()
	local ok, tw = pcall(TweenService.Create, TweenService, instance, tweeninfo, propertytable)
	if ok and tw then
		return tw
	end
	-- Fallback: nếu TweenService:Create bị chặn bởi Roblox capability (lacking capability Plugin),
	-- gán thẳng các thuộc tính để UI cập nhật trạng thái mà không crash thread.
	if propertytable and typeof(instance) == "Instance" then
		for prop, val in pairs(propertytable) do
			pcall(function()
				instance[prop] = val
			end)
		end
	end
	return {
		Play = function() end,
		Cancel = function() end,
		Pause = function() end,
		Completed = { Wait = function() end }
	}
end

--// Library Functions
function MacLib:Window(Settings)
	local WindowFunctions = {Settings = Settings}
	if Settings.AcrylicBlur ~= nil then
		acrylicBlur = Settings.AcrylicBlur
	else
		acrylicBlur = true
	end

	local macLib = GetGui()

	local notifications = Instance.new("Frame")
	notifications.Name = "Notifications"
	notifications.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	notifications.BackgroundTransparency = 1
	notifications.BorderColor3 = Color3.fromRGB(0, 0, 0)
	notifications.BorderSizePixel = 0
	notifications.Size = UDim2.fromScale(1, 1)
	notifications.Parent = macLib
	notifications.ZIndex = 2

	local notificationsUIListLayout = Instance.new("UIListLayout")
	notificationsUIListLayout.Name = "NotificationsUIListLayout"
	notificationsUIListLayout.Padding = UDim.new(0, 10)
	notificationsUIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	notificationsUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	notificationsUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	notificationsUIListLayout.Parent = notifications

	local notificationsUIPadding = Instance.new("UIPadding")
	notificationsUIPadding.Name = "NotificationsUIPadding"
	notificationsUIPadding.PaddingBottom = UDim.new(0, 10)
	notificationsUIPadding.PaddingLeft = UDim.new(0, 10)
	notificationsUIPadding.PaddingRight = UDim.new(0, 10)
	notificationsUIPadding.PaddingTop = UDim.new(0, 10)
	notificationsUIPadding.Parent = notifications

	local base = Instance.new("Frame")
	base.Name = "Base"
	base.AnchorPoint = Vector2.new(0.5, 0.5)
	base.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	base.BackgroundTransparency = Settings.AcrylicBlur and 0.05 or 0
	base.BorderColor3 = Color3.fromRGB(0, 0, 0)
	base.BorderSizePixel = 0
	base.Position = UDim2.fromScale(0.5, 0.5)
	base.Size = Settings.Size or UDim2.fromOffset(868, 650)

	local baseUIScale = Instance.new("UIScale")
	baseUIScale.Name = "BaseUIScale"
	baseUIScale.Parent = base

	local baseUICorner = Instance.new("UICorner")
	baseUICorner.Name = "BaseUICorner"
	baseUICorner.CornerRadius = UDim.new(0, 10)
	baseUICorner.Parent = base

	local baseUIStroke = Instance.new("UIStroke")
	baseUIStroke.Name = "BaseUIStroke"
	baseUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	baseUIStroke.Color = Color3.fromRGB(255, 255, 255)
	baseUIStroke.Transparency = 0.9
	baseUIStroke.Parent = base

	local sidebar = Instance.new("Frame")
	sidebar.Name = "Sidebar"
	sidebar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	sidebar.BackgroundTransparency = 1
	sidebar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	sidebar.BorderSizePixel = 0
	sidebar.Position = UDim2.fromScale(-3.52e-08, 4.69e-08)
	sidebar.Size = Settings.SidebarWidth and UDim2.new(0, Settings.SidebarWidth, 1, 0) or UDim2.fromScale(0.325, 1)

	local divider = Instance.new("Frame")
	divider.Name = "Divider"
	divider.AnchorPoint = Vector2.new(1, 0)
	divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	divider.BackgroundTransparency = 0.9
	divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	divider.BorderSizePixel = 0
	divider.Position = UDim2.fromScale(1, 0)
	divider.Size = UDim2.new(0, 1, 1, 0)
	divider.Parent = sidebar

	local dividerInteract = Instance.new("TextButton")
	dividerInteract.Name = "DividerInteract"
	dividerInteract.AnchorPoint = Vector2.new(0.5, 0)
	dividerInteract.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	dividerInteract.BackgroundTransparency = 1
	dividerInteract.BorderColor3 = Color3.fromRGB(0, 0, 0)
	dividerInteract.BorderSizePixel = 0
	dividerInteract.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	dividerInteract.Position = UDim2.fromScale(0.5, 0)
	dividerInteract.Size = UDim2.new(1, 6, 1, 0)
	dividerInteract.Text = ""
	dividerInteract.TextColor3 = Color3.fromRGB(0, 0, 0)
	dividerInteract.TextSize = 14
	dividerInteract.Parent = divider

	local windowControls = Instance.new("Frame")
	windowControls.Name = "WindowControls"
	windowControls.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	windowControls.BackgroundTransparency = 1
	windowControls.BorderColor3 = Color3.fromRGB(0, 0, 0)
	windowControls.BorderSizePixel = 0
	windowControls.Size = UDim2.new(1, 0, 0, 31)

	local controls = Instance.new("Frame")
	controls.Name = "Controls"
	controls.BackgroundColor3 = Color3.fromRGB(119, 174, 94)
	controls.BackgroundTransparency = 1
	controls.BorderColor3 = Color3.fromRGB(0, 0, 0)
	controls.BorderSizePixel = 0
	controls.Size = UDim2.fromScale(1, 1)

	local uIListLayout = Instance.new("UIListLayout")
	uIListLayout.Name = "UIListLayout"
	uIListLayout.Padding = UDim.new(0, 5)
	uIListLayout.FillDirection = Enum.FillDirection.Horizontal
	uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	uIListLayout.Parent = controls

	local uIPadding = Instance.new("UIPadding")
	uIPadding.Name = "UIPadding"
	uIPadding.PaddingLeft = UDim.new(0, 11)
	uIPadding.Parent = controls

	local windowControlSettings = {
		sizes = { enabled = UDim2.fromOffset(8, 8), disabled = UDim2.fromOffset(7, 7) },
		transparencies = { enabled = 0, disabled = 1 },
		strokeTransparency = 0.9,
	}

	local stroke = Instance.new("UIStroke")
	stroke.Name = "BaseUIStroke"
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	stroke.Color = Color3.fromRGB(255, 255, 255)
	stroke.Transparency = windowControlSettings.strokeTransparency

	local exit = Instance.new("TextButton")
	exit.Name = "Exit"
	exit.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	exit.Text = ""
	exit.TextColor3 = Color3.fromRGB(0, 0, 0)
	exit.TextSize = 14
	exit.AutoButtonColor = false
	exit.BackgroundColor3 = Color3.fromRGB(250, 93, 86)
	exit.BorderColor3 = Color3.fromRGB(0, 0, 0)
	exit.BorderSizePixel = 0

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.CornerRadius = UDim.new(1, 0)
	uICorner.Parent = exit

	exit.Parent = controls

	local minimize = Instance.new("TextButton")
	minimize.Name = "Minimize"
	minimize.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	minimize.Text = ""
	minimize.TextColor3 = Color3.fromRGB(0, 0, 0)
	minimize.TextSize = 14
	minimize.AutoButtonColor = false
	minimize.BackgroundColor3 = Color3.fromRGB(252, 190, 57)
	minimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
	minimize.BorderSizePixel = 0
	minimize.LayoutOrder = 1

	local uICorner1 = Instance.new("UICorner")
	uICorner1.Name = "UICorner"
	uICorner1.CornerRadius = UDim.new(1, 0)
	uICorner1.Parent = minimize

	minimize.Parent = controls

	local maximize = Instance.new("TextButton")
	maximize.Name = "Maximize"
	maximize.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	maximize.Text = ""
	maximize.TextColor3 = Color3.fromRGB(0, 0, 0)
	maximize.TextSize = 14
	maximize.AutoButtonColor = false
	maximize.BackgroundColor3 = Color3.fromRGB(119, 174, 94)
	maximize.BorderColor3 = Color3.fromRGB(0, 0, 0)
	maximize.BorderSizePixel = 0
	maximize.LayoutOrder = 1

	local uICorner2 = Instance.new("UICorner")
	uICorner2.Name = "UICorner"
	uICorner2.CornerRadius = UDim.new(1, 0)
	uICorner2.Parent = maximize

	maximize.Parent = controls

	local function applyState(button, enabled)
		local size = enabled and windowControlSettings.sizes.enabled or windowControlSettings.sizes.disabled
		local transparency = enabled and windowControlSettings.transparencies.enabled or windowControlSettings.transparencies.disabled

		button.Size = size
		button.BackgroundTransparency = transparency
		button.Active = enabled
		button.Interactable = enabled

		for _, child in ipairs(button:GetChildren()) do
			if child:IsA("UIStroke") then
				child.Transparency = transparency
			end
		end
		if not enabled then
			stroke:Clone().Parent = button
		end
	end

	applyState(maximize, false)

	local controlsList = {exit, minimize}
	for _, button in pairs(controlsList) do
		local buttonName = button.Name
		local isEnabled = true

		if Settings.DisabledWindowControls and table.find(Settings.DisabledWindowControls, buttonName) then
			isEnabled = false
		end

		applyState(button, isEnabled)
	end

	controls.Parent = windowControls

	local divider1 = Instance.new("Frame")
	divider1.Name = "Divider"
	divider1.AnchorPoint = Vector2.new(0, 1)
	divider1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	divider1.BackgroundTransparency = 0.9
	divider1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	divider1.BorderSizePixel = 0
	divider1.Position = UDim2.fromScale(0, 1)
	divider1.Size = UDim2.new(1, 0, 0, 1)
	divider1.Parent = windowControls

	windowControls.Parent = sidebar

	local information = Instance.new("Frame")
	information.Name = "Information"
	information.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	information.BackgroundTransparency = 1
	information.BorderColor3 = Color3.fromRGB(0, 0, 0)
	information.BorderSizePixel = 0
	information.Position = UDim2.fromOffset(0, 31)
	information.Size = UDim2.new(1, 0, 0, 60)

	local divider2 = Instance.new("Frame")
	divider2.Name = "Divider"
	divider2.AnchorPoint = Vector2.new(0, 1)
	divider2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	divider2.BackgroundTransparency = 0.9
	divider2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	divider2.BorderSizePixel = 0
	divider2.Position = UDim2.fromScale(0, 1)
	divider2.Size = UDim2.new(1, 0, 0, 1)
	divider2.Parent = information

	local informationHolder = Instance.new("Frame")
	informationHolder.Name = "InformationHolder"
	informationHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	informationHolder.BackgroundTransparency = 1
	informationHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	informationHolder.BorderSizePixel = 0
	informationHolder.Size = UDim2.fromScale(1, 1)

	local informationHolderUIPadding = Instance.new("UIPadding")
	informationHolderUIPadding.Name = "InformationHolderUIPadding"
	informationHolderUIPadding.PaddingBottom = UDim.new(0, 10)
	informationHolderUIPadding.PaddingLeft = UDim.new(0, 23)
	informationHolderUIPadding.PaddingRight = UDim.new(0, 22)
	informationHolderUIPadding.PaddingTop = UDim.new(0, 10)
	informationHolderUIPadding.Parent = informationHolder

	local globalSettingsButton = Instance.new("ImageButton")
	globalSettingsButton.Name = "GlobalSettingsButton"
	globalSettingsButton.Image = assets.globe
	globalSettingsButton.ImageTransparency = 0.5
	globalSettingsButton.AnchorPoint = Vector2.new(1, 0.5)
	globalSettingsButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	globalSettingsButton.BackgroundTransparency = 1
	globalSettingsButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	globalSettingsButton.BorderSizePixel = 0
	globalSettingsButton.Position = UDim2.fromScale(1, 0.5)
	globalSettingsButton.Size = UDim2.fromOffset(16,16)
	globalSettingsButton.Parent = informationHolder

	local function ChangeGlobalSettingsButtonState(State)
		if State == "Default" then
			Tween(globalSettingsButton, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
				ImageTransparency = 0.5
			}):Play()
		elseif State == "Hover" then
			Tween(globalSettingsButton, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
				ImageTransparency = 0.3
			}):Play()
		end
	end

	globalSettingsButton.MouseEnter:Connect(function()
		ChangeGlobalSettingsButtonState("Hover")
	end)
	globalSettingsButton.MouseLeave:Connect(function()
		ChangeGlobalSettingsButtonState("Default")
	end)

	local titleFrame = Instance.new("Frame")
	titleFrame.Name = "TitleFrame"
	titleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	titleFrame.BackgroundTransparency = 1
	titleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	titleFrame.BorderSizePixel = 0
	titleFrame.Size = UDim2.fromScale(1, 1)

	local title = Instance.new("TextLabel")
	title.Name = "Title"
	title.FontFace = Font.new(
		assets.interFont,
		Enum.FontWeight.SemiBold,
		Enum.FontStyle.Normal
	)
	title.Text = Settings.Title
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.RichText = true
	title.TextSize = 18
	title.TextTransparency = 0.1
	title.TextTruncate = Enum.TextTruncate.SplitWord
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.TextYAlignment = Enum.TextYAlignment.Top
	title.AutomaticSize = Enum.AutomaticSize.Y
	title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1
	title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	title.BorderSizePixel = 0
	title.Size = UDim2.new(1, -20, 0, 0)
	title.Parent = titleFrame

	local subtitle = Instance.new("TextLabel")
	subtitle.Name = "Subtitle"
	subtitle.FontFace = Font.new(
		assets.interFont,
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	subtitle.RichText = true
	subtitle.Text = Settings.Subtitle
	subtitle.RichText = true
	subtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	subtitle.TextSize = 12
	subtitle.TextTransparency = 0.7
	subtitle.TextTruncate = Enum.TextTruncate.SplitWord
	subtitle.TextXAlignment = Enum.TextXAlignment.Left
	subtitle.TextYAlignment = Enum.TextYAlignment.Top
	subtitle.AutomaticSize = Enum.AutomaticSize.Y
	subtitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	subtitle.BackgroundTransparency = 1
	subtitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	subtitle.BorderSizePixel = 0
	subtitle.LayoutOrder = 1
	subtitle.Size = UDim2.new(1, -20, 0, 0)
	subtitle.Parent = titleFrame

	local titleFrameUIListLayout = Instance.new("UIListLayout")
	titleFrameUIListLayout.Name = "TitleFrameUIListLayout"
	titleFrameUIListLayout.Padding = UDim.new(0, 3)
	titleFrameUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	titleFrameUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	titleFrameUIListLayout.Parent = titleFrame

	titleFrame.Parent = informationHolder

	informationHolder.Parent = information

	information.Parent = sidebar

	local sidebarGroup = Instance.new("Frame")
	sidebarGroup.Name = "SidebarGroup"
	sidebarGroup.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	sidebarGroup.BackgroundTransparency = 1
	sidebarGroup.BorderColor3 = Color3.fromRGB(0, 0, 0)
	sidebarGroup.BorderSizePixel = 0
	sidebarGroup.Position = UDim2.fromOffset(0, 91)
	sidebarGroup.Size = UDim2.new(1, 0, 1, -91)

	local userInfo = Instance.new("Frame")
	userInfo.Name = "UserInfo"
	userInfo.AnchorPoint = Vector2.new(0, 1)
	userInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	userInfo.BackgroundTransparency = 1
	userInfo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	userInfo.BorderSizePixel = 0
	userInfo.Position = UDim2.fromScale(0, 1)
	userInfo.Size = UDim2.new(1, 0, 0, 107)

	local informationGroup = Instance.new("Frame")
	informationGroup.Name = "InformationGroup"
	informationGroup.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	informationGroup.BackgroundTransparency = 1
	informationGroup.BorderColor3 = Color3.fromRGB(0, 0, 0)
	informationGroup.BorderSizePixel = 0
	informationGroup.Size = UDim2.fromScale(1, 1)

	local informationGroupUIPadding = Instance.new("UIPadding")
	informationGroupUIPadding.Name = "InformationGroupUIPadding"
	informationGroupUIPadding.PaddingBottom = UDim.new(0, 17)
	informationGroupUIPadding.PaddingLeft = UDim.new(0, 25)
	informationGroupUIPadding.Parent = informationGroup

	local informationGroupUIListLayout = Instance.new("UIListLayout")
	informationGroupUIListLayout.Name = "InformationGroupUIListLayout"
	informationGroupUIListLayout.FillDirection = Enum.FillDirection.Horizontal
	informationGroupUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	informationGroupUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	informationGroupUIListLayout.Parent = informationGroup

	local userId = LocalPlayer.UserId
	local thumbType = Enum.ThumbnailType.AvatarBust
	local thumbSize = Enum.ThumbnailSize.Size48x48
	local headshotImage, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

	local headshot = Instance.new("ImageLabel")
	headshot.Name = "Headshot"
	headshot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	headshot.BackgroundTransparency = 1
	headshot.BorderColor3 = Color3.fromRGB(0, 0, 0)
	headshot.BorderSizePixel = 0
	headshot.Size = UDim2.fromOffset(32, 32)
	headshot.Image = (isReady and headshotImage) or "rbxassetid://0"

	local uICorner3 = Instance.new("UICorner")
	uICorner3.Name = "UICorner"
	uICorner3.CornerRadius = UDim.new(1, 0)
	uICorner3.Parent = headshot

	local baseUIStroke2 = Instance.new("UIStroke")
	baseUIStroke2.Name = "BaseUIStroke"
	baseUIStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	baseUIStroke2.Color = Color3.fromRGB(255, 255, 255)
	baseUIStroke2.Transparency = 0.9
	baseUIStroke2.Parent = headshot

	headshot.Parent = informationGroup

	local userAndDisplayFrame = Instance.new("Frame")
	userAndDisplayFrame.Name = "UserAndDisplayFrame"
	userAndDisplayFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	userAndDisplayFrame.BackgroundTransparency = 1
	userAndDisplayFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	userAndDisplayFrame.BorderSizePixel = 0
	userAndDisplayFrame.LayoutOrder = 1
	userAndDisplayFrame.Size = UDim2.new(1, -42, 0, 32)

	local displayName = Instance.new("TextLabel")
	displayName.Name = "DisplayName"
	displayName.FontFace = Font.new(
		assets.interFont,
		Enum.FontWeight.SemiBold,
		Enum.FontStyle.Normal
	)
	displayName.Text = LocalPlayer.DisplayName
	displayName.TextColor3 = Color3.fromRGB(255, 255, 255)
	displayName.TextSize = 13
	displayName.TextTransparency = 0.1
	displayName.TextTruncate = Enum.TextTruncate.SplitWord
	displayName.TextXAlignment = Enum.TextXAlignment.Left
	displayName.TextYAlignment = Enum.TextYAlignment.Top
	displayName.AutomaticSize = Enum.AutomaticSize.XY
	displayName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	displayName.BackgroundTransparency = 1
	displayName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	displayName.BorderSizePixel = 0
	displayName.Parent = userAndDisplayFrame
	displayName.Size = UDim2.fromScale(1,0)

	local userAndDisplayFrameUIPadding = Instance.new("UIPadding")
	userAndDisplayFrameUIPadding.Name = "UserAndDisplayFrameUIPadding"
	userAndDisplayFrameUIPadding.PaddingLeft = UDim.new(0, 8)
	userAndDisplayFrameUIPadding.PaddingTop = UDim.new(0, 3)
	userAndDisplayFrameUIPadding.Parent = userAndDisplayFrame

	local userAndDisplayFrameUIListLayout = Instance.new("UIListLayout")
	userAndDisplayFrameUIListLayout.Name = "UserAndDisplayFrameUIListLayout"
	userAndDisplayFrameUIListLayout.Padding = UDim.new(0, 1)
	userAndDisplayFrameUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	userAndDisplayFrameUIListLayout.Parent = userAndDisplayFrame

	local username = Instance.new("TextLabel")
	username.Name = "Username"
	username.FontFace = Font.new(
		assets.interFont,
		Enum.FontWeight.SemiBold,
		Enum.FontStyle.Normal
	)
	username.Text = "@" .. LocalPlayer.Name
	username.TextColor3 = Color3.fromRGB(255, 255, 255)
	username.TextSize = 12
	username.TextTransparency = 0.7
	username.TextTruncate = Enum.TextTruncate.SplitWord
	username.TextXAlignment = Enum.TextXAlignment.Left
	username.TextYAlignment = Enum.TextYAlignment.Top
	username.AutomaticSize = Enum.AutomaticSize.XY
	username.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	username.BackgroundTransparency = 1
	username.BorderColor3 = Color3.fromRGB(0, 0, 0)
	username.BorderSizePixel = 0
	username.LayoutOrder = 1
	username.Parent = userAndDisplayFrame
	username.Size = UDim2.fromScale(1,0)

	userAndDisplayFrame.Parent = informationGroup

	informationGroup.Parent = userInfo

	local userInfoUIPadding = Instance.new("UIPadding")
	userInfoUIPadding.Name = "UserInfoUIPadding"
	userInfoUIPadding.PaddingLeft = UDim.new(0, 10)
	userInfoUIPadding.PaddingRight = UDim.new(0, 10)
	userInfoUIPadding.Parent = userInfo

	userInfo.Parent = sidebarGroup

	local sidebarGroupUIPadding = Instance.new("UIPadding")
	sidebarGroupUIPadding.Name = "SidebarGroupUIPadding"
	sidebarGroupUIPadding.PaddingLeft = UDim.new(0, 10)
	sidebarGroupUIPadding.PaddingRight = UDim.new(0, 10)
	sidebarGroupUIPadding.PaddingTop = UDim.new(0, 31)
	sidebarGroupUIPadding.Parent = sidebarGroup

	local tabSwitchers = Instance.new("Frame")
	tabSwitchers.Name = "TabSwitchers"
	tabSwitchers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tabSwitchers.BackgroundTransparency = 1
	tabSwitchers.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabSwitchers.BorderSizePixel = 0
	tabSwitchers.Size = UDim2.new(1, 0, 1, -107)

	local tabSwitchersScrollingFrame = Instance.new("ScrollingFrame")
	tabSwitchersScrollingFrame.Name = "TabSwitchersScrollingFrame"
	tabSwitchersScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	tabSwitchersScrollingFrame.BottomImage = ""
	tabSwitchersScrollingFrame.CanvasSize = UDim2.new()
	tabSwitchersScrollingFrame.ScrollBarImageTransparency = 0.8
	tabSwitchersScrollingFrame.ScrollBarThickness = 1
	tabSwitchersScrollingFrame.TopImage = ""
	tabSwitchersScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tabSwitchersScrollingFrame.BackgroundTransparency = 1
	tabSwitchersScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabSwitchersScrollingFrame.BorderSizePixel = 0
	tabSwitchersScrollingFrame.Size = UDim2.fromScale(1, 1)

	local tabSwitchersScrollingFrameUIListLayout = Instance.new("UIListLayout")
	tabSwitchersScrollingFrameUIListLayout.Name = "TabSwitchersScrollingFrameUIListLayout"
	tabSwitchersScrollingFrameUIListLayout.Padding = UDim.new(0, 17)
	tabSwitchersScrollingFrameUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	tabSwitchersScrollingFrameUIListLayout.Parent = tabSwitchersScrollingFrame

	local tabSwitchersScrollingFrameUIPadding = Instance.new("UIPadding")
	tabSwitchersScrollingFrameUIPadding.Name = "TabSwitchersScrollingFrameUIPadding"
	tabSwitchersScrollingFrameUIPadding.PaddingTop = UDim.new(0, 2)
	tabSwitchersScrollingFrameUIPadding.Parent = tabSwitchersScrollingFrame

	tabSwitchersScrollingFrame.Parent = tabSwitchers

	tabSwitchers.Parent = sidebarGroup

	sidebarGroup.Parent = sidebar

	sidebar.Parent = base

	local content = Instance.new("Frame")
	content.Name = "Content"
	content.AnchorPoint = Vector2.new(1, 0)
	content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	content.BackgroundTransparency = 1
	content.BorderColor3 = Color3.fromRGB(0, 0, 0)
	content.BorderSizePixel = 0
	content.Position = UDim2.fromScale(1, 4.69e-08)
	content.Size = UDim2.new(0, (base.AbsoluteSize.X - sidebar.AbsoluteSize.X), 1, 0)

	local resizingContent = false
	local defaultSidebarWidth = sidebar.AbsoluteSize.X
	local initialMouseX, initialSidebarWidth
	local snapRange = 20
	local minSidebarWidth = 107
	local maxSidebarWidth = base.AbsoluteSize.X - minSidebarWidth

	local TweenSettings = {
		DefaultTransparency = 0.9,
		HoverTransparency = 0.85,

		EasingStyle = Enum.EasingStyle.Sine
	}

	local function ChangeState(State)
		Tween(divider, TweenInfo.new(0.2, TweenSettings.EasingStyle), {
			BackgroundTransparency = State == "Idle" and TweenSettings.DefaultTransparency or TweenSettings.HoverTransparency
		}):Play()  
	end

	dividerInteract.MouseEnter:Connect(function()
		ChangeState("Hover")
	end)
	dividerInteract.MouseLeave:Connect(function()
		ChangeState("Idle")
	end)

	dividerInteract.MouseButton1Down:Connect(function()
		resizingContent = true
		initialMouseX = UserInputService:GetMouseLocation().X
		initialSidebarWidth = sidebar.AbsoluteSize.X
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			resizingContent = false
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if resizingContent and input.UserInputType == Enum.UserInputType.MouseMovement then
			local deltaX = UserInputService:GetMouseLocation().X - initialMouseX
			local newSidebarWidth = initialSidebarWidth + deltaX

			if math.abs(newSidebarWidth - defaultSidebarWidth) < snapRange then
				newSidebarWidth = defaultSidebarWidth
			else
				newSidebarWidth = math.clamp(newSidebarWidth, minSidebarWidth, maxSidebarWidth)
			end

			sidebar.Size = UDim2.new(0, newSidebarWidth, 1, 0)
			content.Size = UDim2.new(0, base.AbsoluteSize.X - newSidebarWidth, 1, 0)
		end
	end)

	local topbar = Instance.new("Frame")
	topbar.Name = "Topbar"
	topbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	topbar.BackgroundTransparency = 1
	topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	topbar.BorderSizePixel = 0
	topbar.Size = UDim2.new(1, 0, 0, 63)

	local divider4 = Instance.new("Frame")
	divider4.Name = "Divider"
	divider4.AnchorPoint = Vector2.new(0, 1)
	divider4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	divider4.BackgroundTransparency = 0.9
	divider4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	divider4.BorderSizePixel = 0
	divider4.Position = UDim2.fromScale(0, 1)
	divider4.Size = UDim2.new(1, 0, 0, 1)
	divider4.Parent = topbar

	local elements = Instance.new("Frame")
	elements.Name = "Elements"
	elements.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	elements.BackgroundTransparency = 1
	elements.BorderColor3 = Color3.fromRGB(0, 0, 0)
	elements.BorderSizePixel = 0
	elements.Size = UDim2.fromScale(1, 1)

	local uIPadding2 = Instance.new("UIPadding")
	uIPadding2.Name = "UIPadding"
	uIPadding2.PaddingLeft = UDim.new(0, 20)
	uIPadding2.PaddingRight = UDim.new(0, 20)
	uIPadding2.Parent = elements

	local moveIcon = Instance.new("ImageButton")
	moveIcon.Name = "MoveIcon"
	moveIcon.Image = assets.transform
	moveIcon.ImageTransparency = 0.7
	moveIcon.AnchorPoint = Vector2.new(1, 0.5)
	moveIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	moveIcon.BackgroundTransparency = 1
	moveIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	moveIcon.BorderSizePixel = 0
	moveIcon.Position = UDim2.fromScale(1, 0.5)
	moveIcon.Size = UDim2.fromOffset(15, 15)
	moveIcon.Parent = elements
	moveIcon.Visible = not Settings.DragStyle or Settings.DragStyle == 1

	local interact = Instance.new("TextButton")
	interact.Name = "Interact"
	interact.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	interact.Text = ""
	interact.TextColor3 = Color3.fromRGB(0, 0, 0)
	interact.TextSize = 14
	interact.AnchorPoint = Vector2.new(0.5, 0.5)
	interact.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	interact.BackgroundTransparency = 1
	interact.BorderColor3 = Color3.fromRGB(0, 0, 0)
	interact.BorderSizePixel = 0
	interact.Position = UDim2.fromScale(0.5, 0.5)
	interact.Size = UDim2.fromOffset(40, 40)
	interact.Parent = moveIcon

	local function ChangemoveIconState(State)
		if State == "Default" then
			Tween(moveIcon, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
				ImageTransparency = 0.7
			}):Play()
		elseif State == "Hover" then
			Tween(moveIcon, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
				ImageTransparency = 0.4
			}):Play()
		end
	end

	interact.MouseEnter:Connect(function()
		ChangemoveIconState("Hover")
	end)
	interact.MouseLeave:Connect(function()
		ChangemoveIconState("Default")
	end)

	local dragging_ = false
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		base.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	local function onDragStart(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging_ = true
			dragStart = input.Position
			startPos = base.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging_ = false
				end
			end)
		end
	end

	local function onDragUpdate(input)
		if dragging_ and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			dragInput = input
		end
	end

	if not Settings.DragStyle or Settings.DragStyle == 1 then
		interact.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				onDragStart(input)
			end
		end)

		interact.InputChanged:Connect(onDragUpdate)

		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging_ then
				update(input)
			end
		end)

		interact.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging_ = false
			end
		end)
	elseif Settings.DragStyle == 2 then
		base.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				onDragStart(input)
			end
		end)

		base.InputChanged:Connect(onDragUpdate)

		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging_ then
				update(input)
			end
		end)

		base.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging_ = false
			end
		end)
	end

	local currentTab = Instance.new("TextLabel")
	currentTab.Name = "CurrentTab"
	currentTab.FontFace = Font.new(assets.interFont)
	currentTab.RichText = true
	currentTab.Text = ""
	currentTab.RichText = true
	currentTab.TextColor3 = Color3.fromRGB(255, 255, 255)
	currentTab.TextSize = 15
	currentTab.TextTransparency = 0.5
	currentTab.TextTruncate = Enum.TextTruncate.SplitWord
	currentTab.TextXAlignment = Enum.TextXAlignment.Left
	currentTab.TextYAlignment = Enum.TextYAlignment.Top
	currentTab.AnchorPoint = Vector2.new(0, 0.5)
	currentTab.AutomaticSize = Enum.AutomaticSize.Y
	currentTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	currentTab.BackgroundTransparency = 1
	currentTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	currentTab.BorderSizePixel = 0
	currentTab.Position = UDim2.fromScale(0, 0.5)
	currentTab.Size = UDim2.fromScale(0.9, 0)
	currentTab.Parent = elements

	elements.Parent = topbar

	topbar.Parent = content

	content.Parent = base

	local globalSettings = Instance.new("Frame")
	globalSettings.Name = "GlobalSettings"
	globalSettings.AutomaticSize = Enum.AutomaticSize.XY
	globalSettings.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	globalSettings.BorderColor3 = Color3.fromRGB(0, 0, 0)
	globalSettings.BorderSizePixel = 0
	globalSettings.Position = UDim2.fromScale(0.298, 0.104)

	local globalSettingsUIStroke = Instance.new("UIStroke")
	globalSettingsUIStroke.Name = "GlobalSettingsUIStroke"
	globalSettingsUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	globalSettingsUIStroke.Color = Color3.fromRGB(255, 255, 255)
	globalSettingsUIStroke.Transparency = 0.9
	globalSettingsUIStroke.Parent = globalSettings

	local globalSettingsUICorner = Instance.new("UICorner")
	globalSettingsUICorner.Name = "GlobalSettingsUICorner"
	globalSettingsUICorner.CornerRadius = UDim.new(0, 10)
	globalSettingsUICorner.Parent = globalSettings

	local globalSettingsUIPadding = Instance.new("UIPadding")
	globalSettingsUIPadding.Name = "GlobalSettingsUIPadding"
	globalSettingsUIPadding.PaddingBottom = UDim.new(0, 10)
	globalSettingsUIPadding.PaddingTop = UDim.new(0, 10)
	globalSettingsUIPadding.Parent = globalSettings

	local globalSettingsUIListLayout = Instance.new("UIListLayout")
	globalSettingsUIListLayout.Name = "GlobalSettingsUIListLayout"
	globalSettingsUIListLayout.Padding = UDim.new(0, 5)
	globalSettingsUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	globalSettingsUIListLayout.Parent = globalSettings

	local globalSettingsUIScale = Instance.new("UIScale")
	globalSettingsUIScale.Name = "GlobalSettingsUIScale"
	globalSettingsUIScale.Scale = 1e-07
	globalSettingsUIScale.Parent = globalSettings
	globalSettings.Parent = base
	base.Parent = macLib

	function WindowFunctions:UpdateTitle(NewTitle)
		title.Text = NewTitle
	end

	function WindowFunctions:UpdateSubtitle(NewSubtitle)
		subtitle.Text = NewSubtitle
	end

	local hovering
	local toggled = globalSettingsUIScale.Scale == 1 and true or false
	local function toggle()
		if not toggled then
			local intween = Tween(globalSettingsUIScale, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				Scale = 1
			})
			intween:Play()
			intween.Completed:Wait()
			toggled = true
		elseif toggled then
			local outtween = Tween(globalSettingsUIScale, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				Scale = 0
			})
			outtween:Play()
			outtween.Completed:Wait()
			toggled = false
		end
	end
	globalSettingsButton.MouseButton1Click:Connect(function()
		if not hasGlobalSetting then return end
		toggle()
	end)
	globalSettings.MouseEnter:Connect(function()
		hovering = true
	end)
	globalSettings.MouseLeave:Connect(function()
		hovering = false
	end)
	UserInputService.InputEnded:Connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseButton1 and toggled and not hovering then
			toggle()
		end
	end)

	local BlurTarget = base

	local HS = HttpService
	local camera = workspace.CurrentCamera
	local MTREL = "Glass"
	local binds = {}
	local wedgeguid = HS:GenerateGUID(true)

	local DepthOfField

	for _,v in pairs(Lighting:GetChildren()) do
		if not v:IsA("DepthOfFieldEffect") and v:HasTag(".") then
			DepthOfField = Instance.new('DepthOfFieldEffect')
			DepthOfField.FarIntensity = 0
			DepthOfField.FocusDistance = 51.6
			DepthOfField.InFocusRadius = 50
			DepthOfField.NearIntensity = 1
			DepthOfField.Name = HS:GenerateGUID(true)
			DepthOfField:AddTag(".")
		elseif v:IsA("DepthOfFieldEffect") and v:HasTag(".") then
			DepthOfField = v
		end
	end

	if not DepthOfField then
		DepthOfField = Instance.new('DepthOfFieldEffect')
		DepthOfField.FarIntensity = 0
		DepthOfField.FocusDistance = 51.6
		DepthOfField.InFocusRadius = 50
		DepthOfField.NearIntensity = 1
		DepthOfField.Name = HS:GenerateGUID(true)
		DepthOfField:AddTag(".")
	end

	local frame = Instance.new('Frame')
	frame.Parent = BlurTarget
	frame.Size = UDim2.new(0.97, 0, 0.97, 0)
	frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.BackgroundTransparency = 1
	frame.Name = HS:GenerateGUID(true)

	do
		local function IsNotNaN(x)
			return x == x
		end
		local continue = IsNotNaN(camera:ScreenPointToRay(0,0).Origin.x)
		while not continue do
			RunService.RenderStepped:Wait()
			continue = IsNotNaN(camera:ScreenPointToRay(0,0).Origin.x)
		end
	end

	local DrawQuad; do
		local acos, max, pi, sqrt = math.acos, math.max, math.pi, math.sqrt
		local sz = 0.2

		local function DrawTriangle(v1, v2, v3, p0, p1)
			local s1 = (v1 - v2).magnitude
			local s2 = (v2 - v3).magnitude
			local s3 = (v3 - v1).magnitude
			local smax = max(s1, s2, s3)
			local A, B, C
			if s1 == smax then
				A, B, C = v1, v2, v3
			elseif s2 == smax then
				A, B, C = v2, v3, v1
			elseif s3 == smax then
				A, B, C = v3, v1, v2
			end

			local para = ( (B-A).x*(C-A).x + (B-A).y*(C-A).y + (B-A).z*(C-A).z ) / (A-B).magnitude
			local perp = sqrt((C-A).magnitude^2 - para*para)
			local dif_para = (A - B).magnitude - para

			local st = CFrame.new(B, A)
			local za = CFrame.Angles(pi/2,0,0)

			local cf0 = st

			local Top_Look = (cf0 * za).lookVector
			local Mid_Point = A + CFrame.new(A, B).lookVector * para
			local Needed_Look = CFrame.new(Mid_Point, C).lookVector
			local dot = Top_Look.x*Needed_Look.x + Top_Look.y*Needed_Look.y + Top_Look.z*Needed_Look.z

			local ac = CFrame.Angles(0, 0, acos(dot))

			cf0 = cf0 * ac
			if ((cf0 * za).lookVector - Needed_Look).magnitude > 0.01 then
				cf0 = cf0 * CFrame.Angles(0, 0, -2*acos(dot))
			end
			cf0 = cf0 * CFrame.new(0, perp/2, -(dif_para + para/2))

			local cf1 = st * ac * CFrame.Angles(0, pi, 0)
			if ((cf1 * za).lookVector - Needed_Look).magnitude > 0.01 then
				cf1 = cf1 * CFrame.Angles(0, 0, 2*acos(dot))
			end
			cf1 = cf1 * CFrame.new(0, perp/2, dif_para/2)

			if not p0 then
				p0 = Instance.new('Part')
				p0.FormFactor = 'Custom'
				p0.TopSurface = 0
				p0.BottomSurface = 0
				p0.Anchored = true
				p0.CanCollide = false
				p0.CastShadow = false
				p0.Material = MTREL
				p0.Size = Vector3.new(sz, sz, sz)
				p0.Name = HS:GenerateGUID(true)
				local mesh = Instance.new('SpecialMesh', p0)
				mesh.MeshType = 2
				mesh.Name = wedgeguid
			end

			local mesh0 = p0:FindFirstChild(wedgeguid) or p0:FindFirstChildOfClass("SpecialMesh")
			if not mesh0 then
				mesh0 = Instance.new('SpecialMesh')
				mesh0.MeshType = 2
				mesh0.Name = wedgeguid
				mesh0.Parent = p0
			end
			mesh0.Scale = Vector3.new(0, perp/sz, para/sz)
			p0.CFrame = cf0

			if not p1 then
				p1 = p0:clone()
			end

			local mesh1 = p1:FindFirstChild(wedgeguid) or p1:FindFirstChildOfClass("SpecialMesh")
			if not mesh1 then
				mesh1 = Instance.new('SpecialMesh')
				mesh1.MeshType = 2
				mesh1.Name = wedgeguid
				mesh1.Parent = p1
			end
			mesh1.Scale = Vector3.new(0, perp/sz, dif_para/sz)
			p1.CFrame = cf1

			return p0, p1
		end

		function DrawQuad(v1, v2, v3, v4, parts)
			parts[1], parts[2] = DrawTriangle(v1, v2, v3, parts[1], parts[2])
			parts[3], parts[4] = DrawTriangle(v3, v2, v4, parts[3], parts[4])
		end
	end

	if binds[frame] then
		return binds[frame].parts
	end

	local parts = {}

	local parents = {}
	do
		local function add(child)
			if child:IsA'GuiObject' then
				parents[#parents + 1] = child
				add(child.Parent)
			end
		end
		add(frame)
	end

	local function IsVisible(instance)
		while instance do
			if instance:IsA("GuiObject") then
				if not instance.Visible then
					return false
				end
			elseif instance:IsA("ScreenGui") then
				if not instance.Enabled then
					return false
				end
				break
			end
			instance = instance.Parent
		end
		return true
	end

	local function UpdateOrientation(fetchProps)
		if not IsVisible(frame) or not acrylicBlur or unloaded then
			for _, pt in pairs(parts) do
				pt.Parent = nil
				DepthOfField.Enabled = false
				DepthOfField.Parent = nil
			end
			return
		end
		if not DepthOfField.Parent then
			DepthOfField.Parent = Lighting
		end
		DepthOfField.Enabled = true
		local properties = {
			Transparency = 0.98;
			BrickColor = BrickColor.new('Institutional white');
		}
		local zIndex = 1 - 0.05*frame.ZIndex

		local tl, br = frame.AbsolutePosition, frame.AbsolutePosition + frame.AbsoluteSize
		local tr, bl = Vector2.new(br.x, tl.y), Vector2.new(tl.x, br.y)
		do
			local rot = 0;
			for _, v in ipairs(parents) do
				rot = rot + v.Rotation
			end
			if rot ~= 0 and rot%180 ~= 0 then
				local mid = tl:lerp(br, 0.5)
				local s, c = math.sin(math.rad(rot)), math.cos(math.rad(rot))
				local vec = tl
				tl = Vector2.new(c*(tl.x - mid.x) - s*(tl.y - mid.y), s*(tl.x - mid.x) + c*(tl.y - mid.y)) + mid
				tr = Vector2.new(c*(tr.x - mid.x) - s*(tr.y - mid.y), s*(tr.x - mid.x) + c*(tr.y - mid.y)) + mid
				bl = Vector2.new(c*(bl.x - mid.x) - s*(bl.y - mid.y), s*(bl.x - mid.x) + c*(bl.y - mid.y)) + mid
				br = Vector2.new(c*(br.x - mid.x) - s*(br.y - mid.y), s*(br.x - mid.x) + c*(br.y - mid.y)) + mid
			end
		end
		DrawQuad(
			camera:ScreenPointToRay(tl.x, tl.y, zIndex).Origin, 
			camera:ScreenPointToRay(tr.x, tr.y, zIndex).Origin, 
			camera:ScreenPointToRay(bl.x, bl.y, zIndex).Origin, 
			camera:ScreenPointToRay(br.x, br.y, zIndex).Origin, 
			parts
		)
		if fetchProps then
			for _, pt in pairs(parts) do
				pt.Parent = camera
			end
			for propName, propValue in pairs(properties) do
				for _, pt in pairs(parts) do
					pt[propName] = propValue
				end
			end
		end
	end

	local renderSteppedConn
	renderSteppedConn = RunService.RenderStepped:Connect(function(dt)
		if unloaded then
			if renderSteppedConn then
				renderSteppedConn:Disconnect()
				renderSteppedConn = nil
			end
			return
		end
		pcall(UpdateOrientation, dt)
	end)

	function WindowFunctions:GlobalSetting(Settings)
		hasGlobalSetting = true
		local GlobalSettingFunctions = {}
		local globalSetting = Instance.new("TextButton")
		globalSetting.Name = "GlobalSetting"
		globalSetting.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
		globalSetting.Text = ""
		globalSetting.TextColor3 = Color3.fromRGB(0, 0, 0)
		globalSetting.TextSize = 14
		globalSetting.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		globalSetting.BackgroundTransparency = 1
		globalSetting.BorderColor3 = Color3.fromRGB(0, 0, 0)
		globalSetting.BorderSizePixel = 0
		globalSetting.Size = UDim2.fromOffset(200, 30)

		local globalSettingToggleUIPadding = Instance.new("UIPadding")
		globalSettingToggleUIPadding.Name = "GlobalSettingToggleUIPadding"
		globalSettingToggleUIPadding.PaddingLeft = UDim.new(0, 15)
		globalSettingToggleUIPadding.Parent = globalSetting

		local settingName = Instance.new("TextLabel")
		settingName.Name = "SettingName"
		settingName.FontFace = Font.new(assets.interFont)
		settingName.Text = Settings.Name
		settingName.RichText = true
		settingName.TextColor3 = Color3.fromRGB(255, 255, 255)
		settingName.TextSize = 13
		settingName.TextTransparency = 0.5
		settingName.TextTruncate = Enum.TextTruncate.SplitWord
		settingName.TextXAlignment = Enum.TextXAlignment.Left
		settingName.TextYAlignment = Enum.TextYAlignment.Top
		settingName.AnchorPoint = Vector2.new(0, 0.5)
		settingName.AutomaticSize = Enum.AutomaticSize.Y
		settingName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		settingName.BackgroundTransparency = 1
		settingName.BorderColor3 = Color3.fromRGB(0, 0, 0)
		settingName.BorderSizePixel = 0
		settingName.Position = UDim2.fromScale(1.3e-07, 0.5)
		settingName.Size = UDim2.new(1,-40,0,0)
		settingName.Parent = globalSetting

		local globalSettingToggleUIListLayout = Instance.new("UIListLayout")
		globalSettingToggleUIListLayout.Name = "GlobalSettingToggleUIListLayout"
		globalSettingToggleUIListLayout.Padding = UDim.new(0, 10)
		globalSettingToggleUIListLayout.FillDirection = Enum.FillDirection.Horizontal
		globalSettingToggleUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		globalSettingToggleUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		globalSettingToggleUIListLayout.Parent = globalSetting

		local checkmark = Instance.new("TextLabel")
		checkmark.Name = "Checkmark"
		checkmark.FontFace = Font.new(
			assets.interFont,
			Enum.FontWeight.Medium,
			Enum.FontStyle.Normal
		)
		checkmark.Text = "✓"
		checkmark.TextColor3 = Color3.fromRGB(255, 255, 255)
		checkmark.TextSize = 13
		checkmark.TextTransparency = 1
		checkmark.TextXAlignment = Enum.TextXAlignment.Left
		checkmark.TextYAlignment = Enum.TextYAlignment.Top
		checkmark.AnchorPoint = Vector2.new(0, 0.5)
		checkmark.AutomaticSize = Enum.AutomaticSize.Y
		checkmark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		checkmark.BackgroundTransparency = 1
		checkmark.BorderColor3 = Color3.fromRGB(0, 0, 0)
		checkmark.BorderSizePixel = 0
		checkmark.LayoutOrder = -1
		checkmark.Position = UDim2.fromScale(1.3e-07, 0.5)
		checkmark.Size = UDim2.fromOffset(-10, 0)
		checkmark.Parent = globalSetting

		globalSetting.Parent = globalSettings

		local tweensettings = {
			duration = 0.2,
			easingStyle = Enum.EasingStyle.Quint,
			transparencyIn = 0.2,
			transparencyOut = 0.5,
			checkSizeIncrease = 12,
			checkSizeDecrease = -globalSettingToggleUIListLayout.Padding.Offset,
			waitTime = 1
		}

		local tweens = {
			checkIn = Tween(checkmark, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle), {
				Size = UDim2.new(checkmark.Size.X.Scale, tweensettings.checkSizeIncrease, checkmark.Size.Y.Scale, checkmark.Size.Y.Offset)
			}),
			checkOut = Tween(checkmark, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle),{
				Size = UDim2.new(checkmark.Size.X.Scale, tweensettings.checkSizeDecrease, checkmark.Size.Y.Scale, checkmark.Size.Y.Offset)
			}),
			nameIn = Tween(settingName, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle),{
				TextTransparency = tweensettings.transparencyIn
			}),
			nameOut = Tween(settingName, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle),{
				TextTransparency = tweensettings.transparencyOut
			})
		}

		local function Toggle(State)
			if not State then
				tweens.checkOut:Play()
				tweens.nameOut:Play()
				checkmark:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
					if checkmark.AbsoluteSize.X <= 0 then
						checkmark.TextTransparency = 1
					end
				end)
			else
				tweens.checkIn:Play()
				tweens.nameIn:Play()
				checkmark:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
					if checkmark.AbsoluteSize.X > 0 then
						checkmark.TextTransparency = 0
					end
				end)
			end
		end

		local toggled = Settings.Default
		Toggle(toggled)

		globalSetting.MouseButton1Click:Connect(function()
			toggled = not toggled
			Toggle(toggled)

			task.spawn(function()
				if Settings.Callback then
					Settings.Callback(toggled)
				end
			end)
		end)

		function GlobalSettingFunctions:UpdateName(NewName)
			settingName.Text = NewName
		end

		function GlobalSettingFunctions:UpdateState(NewState)
			Toggle(NewState)
			toggled = NewState
		end

		return GlobalSettingFunctions
	end

	function WindowFunctions:TabGroup()
		local SectionFunctions = {}

		local tabGroup = Instance.new("Frame")
		tabGroup.Name = "Section"
		tabGroup.AutomaticSize = Enum.AutomaticSize.Y
		tabGroup.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		tabGroup.BackgroundTransparency = 1
		tabGroup.BorderColor3 = Color3.fromRGB(0, 0, 0)
		tabGroup.BorderSizePixel = 0
		tabGroup.Size = UDim2.fromScale(1, 0)

		local divider3 = Instance.new("Frame")
		divider3.Name = "Divider"
		divider3.AnchorPoint = Vector2.new(0.5, 1)
		divider3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		divider3.BackgroundTransparency = 0.9
		divider3.BorderColor3 = Color3.fromRGB(0, 0, 0)
		divider3.BorderSizePixel = 0
		divider3.Position = UDim2.fromScale(0.5, 1)
		divider3.Size = UDim2.new(1, -21, 0, 1)
		divider3.Parent = tabGroup

		local sectionTabSwitchers = Instance.new("Frame")
		sectionTabSwitchers.Name = "SectionTabSwitchers"
		sectionTabSwitchers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		sectionTabSwitchers.BackgroundTransparency = 1
		sectionTabSwitchers.BorderColor3 = Color3.fromRGB(0, 0, 0)
		sectionTabSwitchers.BorderSizePixel = 0
		sectionTabSwitchers.Size = UDim2.fromScale(1, 1)

		local uIListLayout1 = Instance.new("UIListLayout")
		uIListLayout1.Name = "UIListLayout"
		uIListLayout1.Padding = UDim.new(0, 15)
		uIListLayout1.HorizontalAlignment = Enum.HorizontalAlignment.Center
		uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
		uIListLayout1.Parent = sectionTabSwitchers

		local uIPadding1 = Instance.new("UIPadding")
		uIPadding1.Name = "UIPadding"
		uIPadding1.PaddingBottom = UDim.new(0, 15)
		uIPadding1.Parent = sectionTabSwitchers

		sectionTabSwitchers.Parent = tabGroup
		tabGroup.Parent = tabSwitchersScrollingFrame

		function SectionFunctions:Tab(Settings)
			local TabFunctions = {Settings = Settings}
			local tabSwitcher = Instance.new("TextButton")
			tabSwitcher.Name = "TabSwitcher"
			tabSwitcher.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
			tabSwitcher.Text = ""
			tabSwitcher.TextColor3 = Color3.fromRGB(0, 0, 0)
			tabSwitcher.TextSize = 14
			tabSwitcher.AutoButtonColor = false
			tabSwitcher.AnchorPoint = Vector2.new(0.5, 0)
			tabSwitcher.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			tabSwitcher.BackgroundTransparency = 1
			tabSwitcher.BorderColor3 = Color3.fromRGB(0, 0, 0)
			tabSwitcher.BorderSizePixel = 0
			tabSwitcher.Position = UDim2.fromScale(0.5, 0)
			tabSwitcher.Size = UDim2.new(1, -21, 0, 40)

			tabIndex += 1
			tabSwitcher.LayoutOrder = tabIndex

			local tabSwitcherUICorner = Instance.new("UICorner")
			tabSwitcherUICorner.Name = "TabSwitcherUICorner"
			tabSwitcherUICorner.Parent = tabSwitcher

			local tabSwitcherUIStroke = Instance.new("UIStroke")
			tabSwitcherUIStroke.Name = "TabSwitcherUIStroke"
			tabSwitcherUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			tabSwitcherUIStroke.Color = Color3.fromRGB(255, 255, 255)
			tabSwitcherUIStroke.Transparency = 1
			tabSwitcherUIStroke.Parent = tabSwitcher

			local tabSwitcherUIListLayout = Instance.new("UIListLayout")
			tabSwitcherUIListLayout.Name = "TabSwitcherUIListLayout"
			tabSwitcherUIListLayout.Padding = UDim.new(0, 9)
			tabSwitcherUIListLayout.FillDirection = Enum.FillDirection.Horizontal
			tabSwitcherUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			tabSwitcherUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
			tabSwitcherUIListLayout.Parent = tabSwitcher

			local tabImage

			if Settings.Image then
				tabImage = Instance.new("ImageLabel")
				tabImage.Name = "TabImage"
				tabImage.Image = Settings.Image
				tabImage.ImageTransparency = 0.5
				tabImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				tabImage.BackgroundTransparency = 1
				tabImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
				tabImage.BorderSizePixel = 0
				tabImage.Size = UDim2.fromOffset(18, 18)
				tabImage.Parent = tabSwitcher
			end

			local tabSwitcherName = Instance.new("TextLabel")
			tabSwitcherName.Name = "TabSwitcherName"
			tabSwitcherName.FontFace = Font.new(
				assets.interFont,
				Enum.FontWeight.Medium,
				Enum.FontStyle.Normal
			)
			tabSwitcherName.Text = Settings.Name
			tabSwitcherName.RichText = true
			tabSwitcherName.TextColor3 = Color3.fromRGB(255, 255, 255)
			tabSwitcherName.TextSize = 16
			tabSwitcherName.TextTransparency = 0.5
			tabSwitcherName.TextTruncate = Enum.TextTruncate.SplitWord
			tabSwitcherName.TextXAlignment = Enum.TextXAlignment.Left
			tabSwitcherName.TextYAlignment = Enum.TextYAlignment.Top
			tabSwitcherName.AutomaticSize = Enum.AutomaticSize.Y
			tabSwitcherName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			tabSwitcherName.BackgroundTransparency = 1
			tabSwitcherName.BorderColor3 = Color3.fromRGB(0, 0, 0)
			tabSwitcherName.BorderSizePixel = 0
			tabSwitcherName.Size = UDim2.fromScale(1, 0)
			tabSwitcherName.Parent = tabSwitcher
			tabSwitcherName.LayoutOrder = 1

			local tabSwitcherUIPadding = Instance.new("UIPadding")
			tabSwitcherUIPadding.Name = "TabSwitcherUIPadding"
			tabSwitcherUIPadding.PaddingLeft = UDim.new(0, 24)
			tabSwitcherUIPadding.PaddingRight = UDim.new(0, 35)
			tabSwitcherUIPadding.PaddingTop = UDim.new(0, 1)
			tabSwitcherUIPadding.Parent = tabSwitcher

			tabSwitcher.Parent = sectionTabSwitchers

			local elements1 = Instance.new("Frame")
			elements1.Name = "Elements"
			elements1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			elements1.BackgroundTransparency = 1
			elements1.BorderColor3 = Color3.fromRGB(0, 0, 0)
			elements1.BorderSizePixel = 0
			elements1.Position = UDim2.fromOffset(0, 63)
			elements1.Size = UDim2.new(1, 0, 1, -63)
			elements1.ClipsDescendants = true

			local elementsUIPadding = Instance.new("UIPadding")
			elementsUIPadding.Name = "ElementsUIPadding"
			elementsUIPadding.PaddingRight = UDim.new(0, 5)
			elementsUIPadding.PaddingTop = UDim.new(0, 10)
			elementsUIPadding.PaddingBottom = UDim.new(0, 10)
			elementsUIPadding.Parent = elements1

			local elementsScrolling = Instance.new("ScrollingFrame")
			elementsScrolling.Name = "ElementsScrolling"
			elementsScrolling.AutomaticCanvasSize = Enum.AutomaticSize.Y
			elementsScrolling.BottomImage = ""
			elementsScrolling.CanvasSize = UDim2.new()
			elementsScrolling.ScrollBarImageTransparency = 0.5
			elementsScrolling.ScrollBarThickness = 1
			elementsScrolling.TopImage = ""
			elementsScrolling.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			elementsScrolling.BackgroundTransparency = 1
			elementsScrolling.BorderColor3 = Color3.fromRGB(0, 0, 0)
			elementsScrolling.BorderSizePixel = 0
			elementsScrolling.Size = UDim2.fromScale(1, 1)
			elementsScrolling.ClipsDescendants = false

			local elementsScrollingUIPadding = Instance.new("UIPadding")
			elementsScrollingUIPadding.Name = "ElementsScrollingUIPadding"
			elementsScrollingUIPadding.PaddingBottom = UDim.new(0, 5)
			elementsScrollingUIPadding.PaddingLeft = UDim.new(0, 11)
			elementsScrollingUIPadding.PaddingRight = UDim.new(0, 3)
			elementsScrollingUIPadding.PaddingTop = UDim.new(0, 5)
			elementsScrollingUIPadding.Parent = elementsScrolling

			local elementsScrollingUIListLayout = Instance.new("UIListLayout")
			elementsScrollingUIListLayout.Name = "ElementsScrollingUIListLayout"
			elementsScrollingUIListLayout.Padding = UDim.new(0, 15)
			elementsScrollingUIListLayout.FillDirection = Enum.FillDirection.Horizontal
			elementsScrollingUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			elementsScrollingUIListLayout.Parent = elementsScrolling

			local left = Instance.new("Frame")
			left.Name = "Left"
			left.AutomaticSize = Enum.AutomaticSize.Y
			left.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			left.BackgroundTransparency = 1
			left.BorderColor3 = Color3.fromRGB(0, 0, 0)
			left.BorderSizePixel = 0
			left.Position = UDim2.fromScale(0.512, 0)
			left.Size = UDim2.new(0.5, -10, 0, 0)

			local leftUIListLayout = Instance.new("UIListLayout")
			leftUIListLayout.Name = "LeftUIListLayout"
			leftUIListLayout.Padding = UDim.new(0, 15)
			leftUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			leftUIListLayout.Parent = left

			left.Parent = elementsScrolling

			local right = Instance.new("Frame")
			right.Name = "Right"
			right.AutomaticSize = Enum.AutomaticSize.Y
			right.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			right.BackgroundTransparency = 1
			right.BorderColor3 = Color3.fromRGB(0, 0, 0)
			right.BorderSizePixel = 0
			right.LayoutOrder = 1
			right.Position = UDim2.fromScale(0.512, 0)
			right.Size = UDim2.new(0.5, -10, 0, 0)

			local rightUIListLayout = Instance.new("UIListLayout")
			rightUIListLayout.Name = "RightUIListLayout"
			rightUIListLayout.Padding = UDim.new(0, 15)
			rightUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			rightUIListLayout.Parent = right

			right.Parent = elementsScrolling

			elementsScrolling.Parent = elements1

			function TabFunctions:Section(Settings)
				local SectionFunctions = {}
				local section = Instance.new("Frame")
				section.Name = "Section"
				section.AutomaticSize = Enum.AutomaticSize.Y
				section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				section.BackgroundTransparency = 0.98
				section.BorderColor3 = Color3.fromRGB(0, 0, 0)
				section.BorderSizePixel = 0
				section.Position = UDim2.fromScale(0, 6.78e-08)
				section.Size = UDim2.fromScale(1, 0)
				section.ClipsDescendants = true
				section.Parent = Settings.Side == "Left" and left or right

				local sectionUICorner = Instance.new("UICorner")
				sectionUICorner.Name = "SectionUICorner"
				sectionUICorner.Parent = section

				local sectionUIStroke = Instance.new("UIStroke")
				sectionUIStroke.Name = "SectionUIStroke"
				sectionUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				sectionUIStroke.Color = Color3.fromRGB(255, 255, 255)
				sectionUIStroke.Transparency = 0.95
				sectionUIStroke.Parent = section

				local sectionUIListLayout = Instance.new("UIListLayout")
				sectionUIListLayout.Name = "SectionUIListLayout"
				sectionUIListLayout.Padding = UDim.new(0, 10)
				sectionUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				sectionUIListLayout.Parent = section

				local sectionUIPadding = Instance.new("UIPadding")
				sectionUIPadding.Name = "SectionUIPadding"
				sectionUIPadding.PaddingBottom = UDim.new(0, 20)
				sectionUIPadding.PaddingLeft = UDim.new(0, 20)
				sectionUIPadding.PaddingRight = UDim.new(0, 18)
				sectionUIPadding.PaddingTop = UDim.new(0, 22)
				sectionUIPadding.Parent = section

				function SectionFunctions:Button(Settings, Flag)
					local ButtonFunctions = {Settings = Settings}
					local button = Instance.new("Frame")
					button.Name = "Button"
					button.AutomaticSize = Enum.AutomaticSize.Y
					button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					button.BackgroundTransparency = 1
					button.BorderColor3 = Color3.fromRGB(0, 0, 0)
					button.BorderSizePixel = 0
					button.Size = UDim2.new(1, 0, 0, 38)
					button.Parent = section

					local buttonInteract = Instance.new("TextButton")
					buttonInteract.Name = "ButtonInteract"
					buttonInteract.FontFace = Font.new(assets.interFont)
					buttonInteract.RichText = true
					buttonInteract.TextColor3 = Color3.fromRGB(255, 255, 255)
					buttonInteract.TextSize = 13
					buttonInteract.TextTransparency = 0.5
					buttonInteract.TextTruncate = Enum.TextTruncate.AtEnd
					buttonInteract.TextXAlignment = Enum.TextXAlignment.Left
					buttonInteract.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					buttonInteract.BackgroundTransparency = 1
					buttonInteract.BorderColor3 = Color3.fromRGB(0, 0, 0)
					buttonInteract.BorderSizePixel = 0
					buttonInteract.Size = UDim2.fromScale(1, 1)
					buttonInteract.Parent = button
					buttonInteract.Text = ButtonFunctions.Settings.Name

					local buttonImage = Instance.new("ImageLabel")
					buttonImage.Name = "ButtonImage"
					buttonImage.Image = assets.buttonImage
					buttonImage.ImageTransparency = 0.5
					buttonImage.AnchorPoint = Vector2.new(1, 0.5)
					buttonImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					buttonImage.BackgroundTransparency = 1
					buttonImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
					buttonImage.BorderSizePixel = 0
					buttonImage.Position = UDim2.fromScale(1, 0.5)
					buttonImage.Size = UDim2.fromOffset(15, 15)
					buttonImage.Parent = button

					local TweenSettings = {
						DefaultTransparency = 0.5,
						HoverTransparency = 0.3,

						EasingStyle = Enum.EasingStyle.Sine
					}

					local function ChangeState(State)
						if State == "Idle" then
							Tween(buttonInteract, TweenInfo.new(0.2, TweenSettings.EasingStyle), {
								TextTransparency = TweenSettings.DefaultTransparency
							}):Play()
							Tween(buttonImage, TweenInfo.new(0.2, TweenSettings.EasingStyle), {
								ImageTransparency = TweenSettings.DefaultTransparency
							}):Play()
						elseif State == "Hover" then
							Tween(buttonInteract, TweenInfo.new(0.2, TweenSettings.EasingStyle), {
								TextTransparency = TweenSettings.HoverTransparency
							}):Play()
							Tween(buttonImage, TweenInfo.new(0.2, TweenSettings.EasingStyle), {
								ImageTransparency = TweenSettings.HoverTransparency
							}):Play()
						end
					end

					local function Callback()
						if ButtonFunctions.Settings.Callback then
							ButtonFunctions.Settings.Callback()
						end
					end

					buttonInteract.MouseEnter:Connect(function()
						ChangeState("Hover")
					end)
					buttonInteract.MouseLeave:Connect(function()
						ChangeState("Idle")
					end)

					buttonInteract.MouseButton1Click:Connect(Callback)
					function ButtonFunctions:UpdateName(Name)
						buttonInteract.Text = Name
					end
					function ButtonFunctions:SetVisibility(State)
						button.Visible = State
					end

					if Flag then
						MacLib.Options[Flag] = ButtonFunctions
					end
					return ButtonFunctions
				end

				function SectionFunctions:Toggle(Settings, Flag)
					local ToggleFunctions = { Settings = Settings, IgnoreConfig = false, Class = "Toggle" }
					local toggle = Instance.new("Frame")
					toggle.Name = "Toggle"
					toggle.AutomaticSize = Enum.AutomaticSize.Y
					toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					toggle.BackgroundTransparency = 1
					toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
					toggle.BorderSizePixel = 0
					toggle.Size = UDim2.new(1, 0, 0, 38)
					toggle.Parent = section

					local toggleName = Instance.new("TextLabel")
					toggleName.Name = "ToggleName"
					toggleName.FontFace = Font.new(assets.interFont)
					toggleName.Text = ToggleFunctions.Settings.Name
					toggleName.RichText = true
					toggleName.TextColor3 = Color3.fromRGB(255, 255, 255)
					toggleName.TextSize = 13
					toggleName.TextTransparency = 0.5
					toggleName.TextTruncate = Enum.TextTruncate.AtEnd
					toggleName.TextXAlignment = Enum.TextXAlignment.Left
					toggleName.TextYAlignment = Enum.TextYAlignment.Top
					toggleName.AnchorPoint = Vector2.new(0, 0.5)
					toggleName.AutomaticSize = Enum.AutomaticSize.Y
					toggleName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					toggleName.BackgroundTransparency = 1
					toggleName.BorderColor3 = Color3.fromRGB(0, 0, 0)
					toggleName.BorderSizePixel = 0
					toggleName.Position = UDim2.fromScale(0, 0.5)
					toggleName.Size = UDim2.new(1, -50, 0, 0)
					toggleName.Parent = toggle

					local toggle1 = Instance.new("ImageButton")
					toggle1.Name = "Toggle"
					toggle1.Image = assets.toggleBackground
					toggle1.ImageColor3 = Color3.fromRGB(87, 86, 86)
					toggle1.AutoButtonColor = false
					toggle1.AnchorPoint = Vector2.new(1, 0.5)
					toggle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					toggle1.BackgroundTransparency = 1
					toggle1.BorderColor3 = Color3.fromRGB(0, 0, 0)
					toggle1.BorderSizePixel = 0
					toggle1.Position = UDim2.fromScale(1, 0.5)
					toggle1.Size = UDim2.fromOffset(41, 21)
					toggle1.ImageTransparency = 0.5

					local toggleUIPadding = Instance.new("UIPadding")
					toggleUIPadding.Name = "ToggleUIPadding"
					toggleUIPadding.PaddingBottom = UDim.new(0, 1)
					toggleUIPadding.PaddingLeft = UDim.new(0, -2)
					toggleUIPadding.PaddingRight = UDim.new(0, 3)
					toggleUIPadding.PaddingTop = UDim.new(0, 1)
					toggleUIPadding.Parent = toggle1

					local togglerHead = Instance.new("ImageLabel")
					togglerHead.Name = "TogglerHead"
					togglerHead.Image = assets.togglerHead
					togglerHead.ImageColor3 = Color3.fromRGB(255, 255, 255)
					togglerHead.AnchorPoint = Vector2.new(1, 0.5)
					togglerHead.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					togglerHead.BackgroundTransparency = 1
					togglerHead.BorderColor3 = Color3.fromRGB(0, 0, 0)
					togglerHead.BorderSizePixel = 0
					togglerHead.Position = UDim2.fromScale(0.5, 0.5)
					togglerHead.Size = UDim2.fromOffset(15, 15)
					togglerHead.ZIndex = 2
					togglerHead.Parent = toggle1
					togglerHead.ImageTransparency = 0.8

					toggle1.Parent = toggle

					local toggle1Transparency = {Enabled = 0, Disabled = 0.5}
					local togglerHeadTransparency = {Enabled = 0, Disabled = 0.85}

					local TweenSettings = {
						Info = TweenInfo.new(0.15, Enum.EasingStyle.Quad),

						EnabledPosition = UDim2.new(1, 0, 0.5, 0),
						DisabledPosition = UDim2.new(0.5, 0, 0.5, 0),
					}

					local togglebool = ToggleFunctions.Settings.Default

					local function NewState(State, callback)
						elevateThreadIdentity()
						local transparencyValues = State and {toggle1Transparency.Enabled, togglerHeadTransparency.Enabled}
							or {toggle1Transparency.Disabled, togglerHeadTransparency.Disabled}
						local position = State and TweenSettings.EnabledPosition or TweenSettings.DisabledPosition

						pcall(function()
							Tween(toggle1, TweenSettings.Info, {
								ImageTransparency = transparencyValues[1]
							}):Play()
						end)

						pcall(function()
							Tween(togglerHead, TweenSettings.Info, {
								ImageTransparency = transparencyValues[2]
							}):Play()
						end)

						pcall(function()
							Tween(togglerHead, TweenSettings.Info, {
								Position = position
							}):Play()
						end)

						ToggleFunctions.State = State
						if callback then
							pcall(callback, togglebool)
						end
					end

					NewState(togglebool)

					local function Toggle()
						togglebool = not togglebool
						NewState(togglebool, ToggleFunctions.Settings.Callback)
					end

					toggle1.MouseButton1Click:Connect(Toggle)

					function ToggleFunctions:Toggle()
						Toggle()
					end
					function ToggleFunctions:UpdateState(State, ignoreCallback)
						togglebool = State
						NewState(togglebool, not ignoreCallback and ToggleFunctions.Settings.Callback or nil)
					end
					function ToggleFunctions:GetState()
						return togglebool
					end
					function ToggleFunctions:UpdateName(Name)
						toggleName.Text = Name
					end
					function ToggleFunctions:SetVisibility(State)
						toggle.Visible = State
					end

					if Flag then
						MacLib.Options[Flag] = ToggleFunctions
					end
					return ToggleFunctions
				end

				function SectionFunctions:Slider(Settings, Flag)
					local SliderFunctions = { Settings = Settings, IgnoreConfig = false, Class = "Slider" }
					local slider = Instance.new("Frame")
					slider.Name = "Slider"
					slider.AutomaticSize = Enum.AutomaticSize.Y
					slider.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					slider.BackgroundTransparency = 1
					slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
					slider.BorderSizePixel = 0
					slider.Size = UDim2.new(1, 0, 0, 38)
					slider.Parent = section

					local sliderName = Instance.new("TextLabel")
					sliderName.Name = "SliderName"
					sliderName.FontFace = Font.new(assets.interFont)
					sliderName.Text = SliderFunctions.Settings.Name
					sliderName.RichText = true
					sliderName.TextColor3 = Color3.fromRGB(255, 255, 255)
					sliderName.TextSize = 13
					sliderName.TextTransparency = 0.5
					sliderName.TextTruncate = Enum.TextTruncate.AtEnd
					sliderName.TextXAlignment = Enum.TextXAlignment.Left
					sliderName.TextYAlignment = Enum.TextYAlignment.Top
					sliderName.AnchorPoint = Vector2.new(0, 0.5)
					sliderName.AutomaticSize = Enum.AutomaticSize.XY
					sliderName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					sliderName.BackgroundTransparency = 1
					sliderName.BorderColor3 = Color3.fromRGB(0, 0, 0)
					sliderName.BorderSizePixel = 0
					sliderName.Position = UDim2.fromScale(1.3e-07, 0.5)
					sliderName.Parent = slider

					local sliderElements = Instance.new("Frame")
					sliderElements.Name = "SliderElements"
					sliderElements.AnchorPoint = Vector2.new(1, 0)
					sliderElements.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					sliderElements.BackgroundTransparency = 1
					sliderElements.BorderColor3 = Color3.fromRGB(0, 0, 0)
					sliderElements.BorderSizePixel = 0
					sliderElements.Position = UDim2.fromScale(1, 0)
					sliderElements.Size = UDim2.fromScale(1, 1)

					local sliderValue = Instance.new("TextBox")
					sliderValue.Name = "SliderValue"
					sliderValue.FontFace = Font.new(assets.interFont)
					sliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
					sliderValue.TextSize = 12
					sliderValue.TextTransparency = 0.1
					--sliderValue.TextTruncate = Enum.TextTruncate.AtEnd
					sliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					sliderValue.BackgroundTransparency = 0.95
					sliderValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
					sliderValue.BorderSizePixel = 0
					sliderValue.LayoutOrder = 1
					sliderValue.Position = UDim2.fromScale(-0.0789, 0.171)
					sliderValue.Size = UDim2.fromOffset(41, 21)
					sliderValue.ClipsDescendants = true

					local sliderValueUICorner = Instance.new("UICorner")
					sliderValueUICorner.Name = "SliderValueUICorner"
					sliderValueUICorner.CornerRadius = UDim.new(0, 4)
					sliderValueUICorner.Parent = sliderValue

					local sliderValueUIStroke = Instance.new("UIStroke")
					sliderValueUIStroke.Name = "SliderValueUIStroke"
					sliderValueUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					sliderValueUIStroke.Color = Color3.fromRGB(255, 255, 255)
					sliderValueUIStroke.Transparency = 0.9
					sliderValueUIStroke.Parent = sliderValue

					local sliderValueUIPadding = Instance.new("UIPadding")
					sliderValueUIPadding.Name = "SliderValueUIPadding"
					sliderValueUIPadding.PaddingLeft = UDim.new(0, 2)
					sliderValueUIPadding.PaddingRight = UDim.new(0, 2)
					sliderValueUIPadding.Parent = sliderValue

					sliderValue.Parent = sliderElements

					local sliderElementsUIListLayout = Instance.new("UIListLayout")
					sliderElementsUIListLayout.Name = "SliderElementsUIListLayout"
					sliderElementsUIListLayout.Padding = UDim.new(0, 20)
					sliderElementsUIListLayout.FillDirection = Enum.FillDirection.Horizontal
					sliderElementsUIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
					sliderElementsUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					sliderElementsUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
					sliderElementsUIListLayout.Parent = sliderElements

					local sliderBar = Instance.new("ImageLabel")
					sliderBar.Name = "SliderBar"
					sliderBar.Image = assets.sliderbar
					sliderBar.ImageColor3 = Color3.fromRGB(87, 86, 86)
					sliderBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					sliderBar.BackgroundTransparency = 1
					sliderBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
					sliderBar.BorderSizePixel = 0
					sliderBar.Position = UDim2.fromScale(0.219, 0.457)
					sliderBar.Size = UDim2.fromOffset(123, 3)

					local sliderHead = Instance.new("ImageButton")
					sliderHead.Name = "SliderHead"
					sliderHead.Image = assets.sliderhead
					sliderHead.AnchorPoint = Vector2.new(0.5, 0.5)
					sliderHead.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					sliderHead.BackgroundTransparency = 1
					sliderHead.BorderColor3 = Color3.fromRGB(0, 0, 0)
					sliderHead.BorderSizePixel = 0
					sliderHead.Position = UDim2.fromScale(1, 0.5)
					sliderHead.Size = UDim2.fromOffset(12, 12)
					sliderHead.Parent = sliderBar

					sliderBar.Parent = sliderElements

					local sliderElementsUIPadding = Instance.new("UIPadding")
					sliderElementsUIPadding.Name = "SliderElementsUIPadding"
					sliderElementsUIPadding.PaddingTop = UDim.new(0, 3)
					sliderElementsUIPadding.Parent = sliderElements

					sliderElements.Parent = slider

					local dragging = false

					local DisplayMethods = {
						Hundredths = function(sliderValue) -- Deprecated use Settings.Precision
							return string.format("%.2f", sliderValue)
						end,
						Tenths = function(sliderValue) -- Deprecated use Settings.Precision
							return string.format("%.1f", sliderValue)
						end,
						Round = function(sliderValue, precision)
							if precision then
								return string.format("%." .. precision .. "f", sliderValue)
							else
								return tostring(math.round(sliderValue))
							end
						end,
						Degrees = function(sliderValue, precision)
							local formattedValue = precision and string.format("%." .. precision .. "f", sliderValue) or tostring(sliderValue)
							return formattedValue .. "°"
						end,
						Percent = function(sliderValue, precision)
							local percentage = (sliderValue - SliderFunctions.Settings.Minimum) / (SliderFunctions.Settings.Maximum - SliderFunctions.Settings.Minimum) * 100
							return precision and string.format("%." .. precision .. "f", percentage) .. "%" or tostring(math.round(percentage)) .. "%"
						end,
						Value = function(sliderValue, precision)
							return precision and string.format("%." .. precision .. "f", sliderValue) or tostring(sliderValue)
						end
					}

					local ValueDisplayMethod = DisplayMethods[SliderFunctions.Settings.DisplayMethod] or DisplayMethods.Value
					local finalValue

					local function SetValue(val, ignorecallback)
						elevateThreadIdentity()
						local posXScale

						if typeof(val) == "Instance" then
							local input = val
							posXScale = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
						else
							local value = val
							posXScale = (value - SliderFunctions.Settings.Minimum) / (SliderFunctions.Settings.Maximum - Settings.Minimum)
						end

						local pos = UDim2.new(posXScale, 0, 0.5, 0)
						pcall(function()
							sliderHead.Position = pos
						end)

						finalValue = posXScale * (SliderFunctions.Settings.Maximum - SliderFunctions.Settings.Minimum) + Settings.Minimum

						pcall(function()
							sliderValue.Text = (Settings.Prefix or "") .. ValueDisplayMethod(finalValue, SliderFunctions.Settings.Precision) .. (Settings.Suffix or "")
						end)

						if not ignorecallback then
							task.spawn(function()
								if SliderFunctions.Settings.Callback then
									SliderFunctions.Settings.Callback(finalValue)
								end
							end)
						end

						SliderFunctions.Value = finalValue
					end

					SetValue(SliderFunctions.Settings.Default, true)

					sliderHead.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							dragging = true
							SetValue(input)
						end
					end)

					sliderHead.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							dragging = false
							if SliderFunctions.Settings.onInputComplete then
								SliderFunctions.Settings.onInputComplete(finalValue)
							end
						end
					end)

					sliderValue.FocusLost:Connect(function(enterPressed)
						local inputText = sliderValue.Text
						local value, isPercent = inputText:match("^(%-?%d+%.?%d*)(%%?)$")

						if value then
							value = tonumber(value)
							isPercent = isPercent == "%"

							if isPercent then
								value = SliderFunctions.Settings.Minimum + (value / 100) * (SliderFunctions.Settings.Maximum - SliderFunctions.Settings.Minimum)
							end

							local newValue = math.clamp(value, SliderFunctions.Settings.Minimum, SliderFunctions.Settings.Maximum)
							SetValue(newValue)
						else
							sliderValue.Text = ValueDisplayMethod(finalValue)
						end

						if SliderFunctions.Settings.onInputComplete then
							SliderFunctions.Settings.onInputComplete(finalValue)
						end
					end)

					UserInputService.InputChanged:Connect(function(input)
						if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
							SetValue(input)
						end
					end)

					local function updateSliderBarSize()
						local padding = sliderElementsUIListLayout.Padding.Offset
						local sliderValueWidth = sliderValue.AbsoluteSize.X
						local sliderNameWidth = sliderName.AbsoluteSize.X
						local totalWidth = sliderElements.AbsoluteSize.X

						local newBarWidth = (totalWidth - (padding + sliderValueWidth + sliderNameWidth + 20)) / baseUIScale.Scale
						sliderBar.Size = UDim2.new(sliderBar.Size.X.Scale, newBarWidth, sliderBar.Size.Y.Scale, sliderBar.Size.Y.Offset)
					end

					updateSliderBarSize()

					sliderName:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateSliderBarSize)
					section:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateSliderBarSize)

					function SliderFunctions:UpdateName(Name)
						sliderName = Name
					end
					function SliderFunctions:SetVisibility(State)
						slider.Visible = State
					end
					function SliderFunctions:UpdateValue(Value)
						SetValue(tonumber(Value), true)
					end
					function SliderFunctions:GetValue()
						return finalValue
					end

					if Flag then
						MacLib.Options[Flag] = SliderFunctions
					end
					return SliderFunctions
				end

				function SectionFunctions:Input(Settings, Flag)
					local InputFunctions = { Settings = Settings, IgnoreConfig = false, Class = "Input" }
					local input = Instance.new("Frame")
					input.Name = "Input"
					input.AutomaticSize = Enum.AutomaticSize.Y
					input.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					input.BackgroundTransparency = 1
					input.BorderColor3 = Color3.fromRGB(0, 0, 0)
					input.BorderSizePixel = 0
					input.Size = UDim2.new(1, 0, 0, 38)
					input.Parent = section

					local inputName = Instance.new("TextLabel")
					inputName.Name = "InputName"
					inputName.FontFace = Font.new(assets.interFont)
					inputName.Text = InputFunctions.Settings.Name
					inputName.RichText = true
					inputName.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputName.TextSize = 13
					inputName.TextTransparency = 0.5
					inputName.TextTruncate = Enum.TextTruncate.AtEnd
					inputName.TextXAlignment = Enum.TextXAlignment.Left
					inputName.TextYAlignment = Enum.TextYAlignment.Top
					inputName.AnchorPoint = Vector2.new(0, 0.5)
					inputName.AutomaticSize = Enum.AutomaticSize.XY
					inputName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputName.BackgroundTransparency = 1
					inputName.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputName.BorderSizePixel = 0
					inputName.Position = UDim2.fromScale(0, 0.5)
					inputName.Parent = input

					local inputBox = Instance.new("TextBox")
					inputBox.Name = "InputBox"
					inputBox.FontFace = Font.new(assets.interFont)
					inputBox.Text = "Hello world!"
					inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputBox.TextSize = 12
					inputBox.TextTransparency = 0.1
					inputBox.AnchorPoint = Vector2.new(1, 0.5)
					inputBox.AutomaticSize = Enum.AutomaticSize.X
					inputBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputBox.BackgroundTransparency = 0.95
					inputBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputBox.BorderSizePixel = 0
					inputBox.ClipsDescendants = true
					inputBox.LayoutOrder = 1
					inputBox.Position = UDim2.fromScale(1, 0.5)
					inputBox.Size = UDim2.fromOffset(21, 21)
					inputBox.TextXAlignment = Enum.TextXAlignment.Right

					local inputBoxUICorner = Instance.new("UICorner")
					inputBoxUICorner.Name = "InputBoxUICorner"
					inputBoxUICorner.CornerRadius = UDim.new(0, 4)
					inputBoxUICorner.Parent = inputBox

					local inputBoxUIStroke = Instance.new("UIStroke")
					inputBoxUIStroke.Name = "InputBoxUIStroke"
					inputBoxUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					inputBoxUIStroke.Color = Color3.fromRGB(255, 255, 255)
					inputBoxUIStroke.Transparency = 0.9
					inputBoxUIStroke.Parent = inputBox

					local inputBoxUIPadding = Instance.new("UIPadding")
					inputBoxUIPadding.Name = "InputBoxUIPadding"
					inputBoxUIPadding.PaddingLeft = UDim.new(0, 5)
					inputBoxUIPadding.PaddingRight = UDim.new(0, 5)
					inputBoxUIPadding.Parent = inputBox

					local inputBoxUISizeConstraint = Instance.new("UISizeConstraint")
					inputBoxUISizeConstraint.Name = "InputBoxUISizeConstraint"
					inputBoxUISizeConstraint.Parent = inputBox

					inputBox.Parent = input

					local Input = input
					local InputBox = inputBox
					local InputName = inputName
					local Constraint = inputBoxUISizeConstraint

					local function applyCharacterLimit(value)
						if InputFunctions.Settings.CharacterLimit then
							return value:sub(1, InputFunctions.Settings.CharacterLimit)
						end
						return value
					end

					local CharacterSubs = {
						All = function(value)
							return applyCharacterLimit(value)
						end,
						Numeric = function(value)
							local result = value:match("^%-?%d*$") and value or value:gsub("[^%d-]", ""):gsub("(%-)", function(match, pos)
								return pos == 1 and match or ""
							end)
							return applyCharacterLimit(result)
						end,
						Alphabetic = function(value)
							return applyCharacterLimit(value:gsub("[^a-zA-Z ]", ""))
						end,
						AlphaNumeric = function(value)
							return applyCharacterLimit(value:gsub("[^a-zA-Z0-9]", ""))
						end,
					}

					local AcceptedCharacters

					if type(InputFunctions.Settings.AcceptedCharacters) == "function" then
						AcceptedCharacters = InputFunctions.Settings.AcceptedCharacters
					else
						AcceptedCharacters = CharacterSubs[InputFunctions.Settings.AcceptedCharacters] or CharacterSubs.All
					end

					InputBox.AutomaticSize = Enum.AutomaticSize.X

					local function checkSize()
						local nameWidth = InputName.AbsoluteSize.X
						local totalWidth = Input.AbsoluteSize.X

						local maxWidth = (totalWidth - nameWidth - 20) / baseUIScale.Scale
						Constraint.MaxSize = Vector2.new(maxWidth, 9e9)
					end

					checkSize()
					InputName:GetPropertyChangedSignal("AbsoluteSize"):Connect(checkSize)

					InputBox.FocusLost:Connect(function()
						local inputText = InputBox.Text
						local filteredText = AcceptedCharacters(inputText)
						InputBox.Text = filteredText
						task.spawn(function()
							if InputFunctions.Settings.Callback then
								InputFunctions.Settings.Callback(filteredText)
							end
						end)
					end)
					InputBox.Text = InputFunctions.Settings.Default or ""
					InputBox.PlaceholderText = InputFunctions.Settings.Placeholder or ""

					InputBox:GetPropertyChangedSignal("Text"):Connect(function()
						InputBox.Text = AcceptedCharacters(InputBox.Text)
						if InputFunctions.Settings.onChanged then
							InputFunctions.Settings.onChanged(InputBox.Text)
						end
						InputFunctions.Text = InputBox.Text
					end)

					function InputFunctions:UpdateName(Name)
						inputName.Text = Name
					end
					function InputFunctions:SetVisibility(State)
						input.Visible = State
					end
					function InputFunctions:GetInput()
						return InputBox.Text
					end
					function InputFunctions:UpdatePlaceholder(Placeholder)
						inputBox.PlaceholderText = Placeholder
					end
					function InputFunctions:UpdateText(Text)
						local filteredText = AcceptedCharacters(Text)
						InputBox.Text = filteredText
						InputFunctions.Text = filteredText
						task.spawn(function()
							if InputFunctions.Settings.Callback then
								InputFunctions.Settings.Callback(filteredText)
							end
						end)
					end

					if Flag then
						MacLib.Options[Flag] = InputFunctions
					end
					return InputFunctions
				end

				function SectionFunctions:Keybind(Settings, Flag)
					local KeybindFunctions = { Settings = Settings, IgnoreConfig = false, Class = "Keybind" }
					local keybind = Instance.new("Frame")
					keybind.Name = "Keybind"
					keybind.AutomaticSize = Enum.AutomaticSize.Y
					keybind.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					keybind.BackgroundTransparency = 1
					keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
					keybind.BorderSizePixel = 0
					keybind.Size = UDim2.new(1, 0, 0, 38)
					keybind.Parent = section

					local keybindName = Instance.new("TextLabel")
					keybindName.Name = "KeybindName"
					keybindName.FontFace = Font.new(assets.interFont)
					keybindName.Text = KeybindFunctions.Settings.Name
					keybindName.RichText = true
					keybindName.TextColor3 = Color3.fromRGB(255, 255, 255)
					keybindName.TextSize = 13
					keybindName.TextTransparency = 0.5
					keybindName.TextTruncate = Enum.TextTruncate.AtEnd
					keybindName.TextXAlignment = Enum.TextXAlignment.Left
					keybindName.TextYAlignment = Enum.TextYAlignment.Top
					keybindName.AnchorPoint = Vector2.new(0, 0.5)
					keybindName.AutomaticSize = Enum.AutomaticSize.XY
					keybindName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					keybindName.BackgroundTransparency = 1
					keybindName.BorderColor3 = Color3.fromRGB(0, 0, 0)
					keybindName.BorderSizePixel = 0
					keybindName.Position = UDim2.fromScale(0, 0.5)
					keybindName.Parent = keybind

					local binderBox = Instance.new("TextBox")
					binderBox.Name = "BinderBox"
					binderBox.CursorPosition = -1
					binderBox.FontFace = Font.new(assets.interFont)
					binderBox.PlaceholderText = "..."
					binderBox.Text = ""
					binderBox.TextColor3 = Color3.fromRGB(255, 255, 255)
					binderBox.TextSize = 12
					binderBox.TextTransparency = 0.1
					binderBox.AnchorPoint = Vector2.new(1, 0.5)
					binderBox.AutomaticSize = Enum.AutomaticSize.X
					binderBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					binderBox.BackgroundTransparency = 0.95
					binderBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
					binderBox.BorderSizePixel = 0
					binderBox.ClipsDescendants = true
					binderBox.LayoutOrder = 1
					binderBox.Position = UDim2.fromScale(1, 0.5)
					binderBox.Size = UDim2.fromOffset(21, 21)

					local binderBoxUICorner = Instance.new("UICorner")
					binderBoxUICorner.Name = "BinderBoxUICorner"
					binderBoxUICorner.CornerRadius = UDim.new(0, 4)
					binderBoxUICorner.Parent = binderBox

					local binderBoxUIStroke = Instance.new("UIStroke")
					binderBoxUIStroke.Name = "BinderBoxUIStroke"
					binderBoxUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					binderBoxUIStroke.Color = Color3.fromRGB(255, 255, 255)
					binderBoxUIStroke.Transparency = 0.9
					binderBoxUIStroke.Parent = binderBox

					local binderBoxUIPadding = Instance.new("UIPadding")
					binderBoxUIPadding.Name = "BinderBoxUIPadding"
					binderBoxUIPadding.PaddingLeft = UDim.new(0, 5)
					binderBoxUIPadding.PaddingRight = UDim.new(0, 5)
					binderBoxUIPadding.Parent = binderBox

					local binderBoxUISizeConstraint = Instance.new("UISizeConstraint")
					binderBoxUISizeConstraint.Name = "BinderBoxUISizeConstraint"
					binderBoxUISizeConstraint.Parent = binderBox

					binderBox.Parent = keybind

					local focused
					local isBinding = false
					local reset = false
					local binded = KeybindFunctions.Settings.Default

					local function resetFocusState()
						focused = false
						isBinding = false
						binderBox:ReleaseFocus()
					end

					if binded then
						binderBox.Text = binded.Name
					end

					binderBox.Focused:Connect(function()
						focused = true
					end)

					binderBox.FocusLost:Connect(function()
						focused = false
					end)

					UserInputService.InputBegan:Connect(function(inp)
						if focused and not isBinding then
							isBinding = true

							local Event
							Event = UserInputService.InputBegan:Connect(function(input)
								if KeybindFunctions.Settings.Blacklist and (table.find(KeybindFunctions.KeybindFunctions.Settings.Blacklist, input.KeyCode) or table.find(KeybindFunctions.Settings.Blacklist, input.UserInputType)) then
									binderBox:ReleaseFocus()
									resetFocusState()
									Event:Disconnect()
									return
								end

								if input.UserInputType == Enum.UserInputType.Keyboard then
									binded = input.KeyCode
									binderBox.Text = input.KeyCode.Name
								elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
									binded = input.UserInputType
									binderBox.Text = input.UserInputType.Name
								end

								if KeybindFunctions.Settings.onBinded then
									KeybindFunctions.Settings.onBinded(binded)
								end
								reset = true
								resetFocusState()
								Event:Disconnect()
							end)
						else
							if not reset and (inp.KeyCode == binded or inp.UserInputType == binded) then
								if KeybindFunctions.Settings.Callback then
									KeybindFunctions.Settings.Callback(binded)
								end
								if KeybindFunctions.Settings.onBindHeld then
									KeybindFunctions.Settings.onBindHeld(true, binded)
								end
							else
								reset = false
							end
						end
					end)

					UserInputService.InputEnded:Connect(function(inp)
						if not focused and not isBinding then
							if inp.KeyCode == binded or inp.UserInputType == binded then
								if Settings.onBindHeld then
									Settings.onBindHeld(false, binded)
								end
							end
						end
					end)

					function KeybindFunctions:Bind(Key)
						binded = Key
						binderBox.Text = Key.Name
					end

					function KeybindFunctions:Unbind()
						binded = nil
						binderBox.Text = ""
					end

					function KeybindFunctions:GetBind()
						return binded
					end

					function KeybindFunctions:UpdateName(Name)
						keybindName = Name
					end

					function KeybindFunctions:SetVisibility(State)
						keybind.Visible = State
					end

					if Flag then
						MacLib.Options[Flag] = KeybindFunctions
					end

					return KeybindFunctions
				end

				function SectionFunctions:Dropdown(Settings, Flag)
					local DropdownFunctions = { Settings = Settings, IgnoreConfig = false, Class = "Dropdown" }
					local Selected = {}
					local OptionObjs = {}

					local dropdown = Instance.new("Frame")
					dropdown.Name = "Dropdown"
					dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					dropdown.BackgroundTransparency = 0.985
					dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
					dropdown.BorderSizePixel = 0
					dropdown.Size = UDim2.new(1, 0, 0, 38)
					dropdown.Parent = section
					dropdown.ClipsDescendants = true

					local dropdownUIPadding = Instance.new("UIPadding")
					dropdownUIPadding.Name = "DropdownUIPadding"
					dropdownUIPadding.PaddingLeft = UDim.new(0, 15)
					dropdownUIPadding.PaddingRight = UDim.new(0, 15)
					dropdownUIPadding.Parent = dropdown

					local interact = Instance.new("TextButton")
					interact.Name = "Interact"
					interact.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
					interact.Text = ""
					interact.TextColor3 = Color3.fromRGB(0, 0, 0)
					interact.TextSize = 14
					interact.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					interact.BackgroundTransparency = 1
					interact.BorderColor3 = Color3.fromRGB(0, 0, 0)
					interact.BorderSizePixel = 0
					interact.Size = UDim2.new(1, 0, 0, 38)
					interact.Parent = dropdown

					local dropdownName = Instance.new("TextLabel")
					dropdownName.Name = "DropdownName"
					dropdownName.FontFace = Font.new(assets.interFont)
					dropdownName.Text = Settings.Default and (DropdownFunctions.Settings.Name .. " • " .. table.concat(Selected, ", ")) or (DropdownFunctions.Settings.Name .. "...")
					dropdownName.RichText = true
					dropdownName.TextColor3 = Color3.fromRGB(255, 255, 255)
					dropdownName.TextSize = 13
					dropdownName.TextTransparency = 0.5
					dropdownName.TextTruncate = Enum.TextTruncate.SplitWord
					dropdownName.TextXAlignment = Enum.TextXAlignment.Left
					dropdownName.AutomaticSize = Enum.AutomaticSize.Y
					dropdownName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					dropdownName.BackgroundTransparency = 1
					dropdownName.BorderColor3 = Color3.fromRGB(0, 0, 0)
					dropdownName.BorderSizePixel = 0
					dropdownName.Size = UDim2.new(1, -20, 0, 38)
					dropdownName.Parent = dropdown

					local dropdownUIStroke = Instance.new("UIStroke")
					dropdownUIStroke.Name = "DropdownUIStroke"
					dropdownUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					dropdownUIStroke.Color = Color3.fromRGB(255, 255, 255)
					dropdownUIStroke.Transparency = 0.95
					dropdownUIStroke.Parent = dropdown

					local dropdownUICorner = Instance.new("UICorner")
					dropdownUICorner.Name = "DropdownUICorner"
					dropdownUICorner.CornerRadius = UDim.new(0, 6)
					dropdownUICorner.Parent = dropdown

					local dropdownImage = Instance.new("ImageLabel")
					dropdownImage.Name = "DropdownImage"
					dropdownImage.Image = assets.dropdown
					dropdownImage.ImageTransparency = 0.5
					dropdownImage.AnchorPoint = Vector2.new(1, 0)
					dropdownImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					dropdownImage.BackgroundTransparency = 1
					dropdownImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
					dropdownImage.BorderSizePixel = 0
					dropdownImage.Position = UDim2.new(1, 0, 0, 12)
					dropdownImage.Size = UDim2.fromOffset(14, 14)
					dropdownImage.Parent = dropdown

					local dropdownFrame = Instance.new("Frame")
					dropdownFrame.Name = "DropdownFrame"
					dropdownFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					dropdownFrame.BackgroundTransparency = 1
					dropdownFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
					dropdownFrame.BorderSizePixel = 0
					dropdownFrame.ClipsDescendants = true
					dropdownFrame.Size = UDim2.fromScale(1, 1)
					dropdownFrame.Visible = false
					dropdownFrame.AutomaticSize = Enum.AutomaticSize.Y

					local dropdownFrameUIPadding = Instance.new("UIPadding")
					dropdownFrameUIPadding.Name = "DropdownFrameUIPadding"
					dropdownFrameUIPadding.PaddingTop = UDim.new(0, 38)
					dropdownFrameUIPadding.PaddingBottom = UDim.new(0, 10)
					dropdownFrameUIPadding.Parent = dropdownFrame

					local dropdownFrameUIListLayout = Instance.new("UIListLayout")
					dropdownFrameUIListLayout.Name = "DropdownFrameUIListLayout"
					dropdownFrameUIListLayout.Padding = UDim.new(0, 5)
					dropdownFrameUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					dropdownFrameUIListLayout.Parent = dropdownFrame

					local search = Instance.new("Frame")
					search.Name = "Search"
					search.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					search.BackgroundTransparency = 0.95
					search.BorderColor3 = Color3.fromRGB(0, 0, 0)
					search.BorderSizePixel = 0
					search.LayoutOrder = -1
					search.Size = UDim2.new(1, 0, 0, 30)
					search.Parent = dropdownFrame
					search.Visible = DropdownFunctions.Settings.Search

					local sectionUICorner = Instance.new("UICorner")
					sectionUICorner.Name = "SectionUICorner"
					sectionUICorner.Parent = search

					local searchIcon = Instance.new("ImageLabel")
					searchIcon.Name = "SearchIcon"
					searchIcon.Image = assets.searchIcon
					searchIcon.ImageColor3 = Color3.fromRGB(180, 180, 180)
					searchIcon.AnchorPoint = Vector2.new(0, 0.5)
					searchIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					searchIcon.BackgroundTransparency = 1
					searchIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
					searchIcon.BorderSizePixel = 0
					searchIcon.Position = UDim2.fromScale(0, 0.5)
					searchIcon.Size = UDim2.fromOffset(12, 12)
					searchIcon.Parent = search

					local uIPadding = Instance.new("UIPadding")
					uIPadding.Name = "UIPadding"
					uIPadding.PaddingLeft = UDim.new(0, 15)
					uIPadding.Parent = search

					local searchBox = Instance.new("TextBox")
					searchBox.Name = "SearchBox"
					searchBox.CursorPosition = -1
					searchBox.FontFace = Font.new(
						assets.interFont,
						Enum.FontWeight.Medium,
						Enum.FontStyle.Normal
					)
					searchBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
					searchBox.PlaceholderText = "Search..."
					searchBox.Text = ""
					searchBox.TextColor3 = Color3.fromRGB(200, 200, 200)
					searchBox.TextSize = 14
					searchBox.TextXAlignment = Enum.TextXAlignment.Left
					searchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					searchBox.BackgroundTransparency = 1
					searchBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
					searchBox.BorderSizePixel = 0
					searchBox.Size = UDim2.fromScale(1, 1)

					local function CalculateDropdownSize()
						local totalHeight = 0
						local visibleChildrenCount = 0
						local padding = dropdownFrameUIPadding.PaddingTop.Offset + dropdownFrameUIPadding.PaddingBottom.Offset

						for _, v in pairs(dropdownFrame:GetChildren()) do
							if not v:IsA("UIComponent") and v.Visible then
								totalHeight += v.AbsoluteSize.Y
								visibleChildrenCount += 1
							end
						end

						local spacing = dropdownFrameUIListLayout.Padding.Offset * (visibleChildrenCount - 1)

						return totalHeight + spacing + padding
					end

					local function findOption()
						local searchTerm = searchBox.Text:lower()

						for _, v in pairs(OptionObjs) do
							local optionText = v.NameLabel.Text:lower()
							local isVisible = string.find(optionText, searchTerm) ~= nil

							if v.Button.Visible ~= isVisible then
								v.Button.Visible = isVisible
							end
						end

						dropdown.Size = UDim2.new(1, 0, 0, CalculateDropdownSize())
					end

					searchBox:GetPropertyChangedSignal("Text"):Connect(findOption)

					local uIPadding1 = Instance.new("UIPadding")
					uIPadding1.Name = "UIPadding"
					uIPadding1.PaddingLeft = UDim.new(0, 23)
					uIPadding1.Parent = searchBox

					searchBox.Parent = search

					local tweensettings = {
						duration = 0.2,
						easingStyle = Enum.EasingStyle.Quint,
						transparencyIn = 0.2,
						transparencyOut = 0.5,
						checkSizeIncrease = 12,
						checkSizeDecrease = -13,
						waitTime = 1
					}

					local function Toggle(optionName, State)
						local option = OptionObjs[optionName]

						if not option then return end

						local checkmark = option.Checkmark
						local optionNameLabel = option.NameLabel

						if State then
							if DropdownFunctions.Settings.Multi then
								if not table.find(Selected, optionName) then
									table.insert(Selected, optionName)
									DropdownFunctions.Value = Selected
								end
							else
								for name, opt in pairs(OptionObjs) do
									if name ~= optionName then
										Tween(opt.Checkmark, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle), {
											Size = UDim2.new(opt.Checkmark.Size.X.Scale, tweensettings.checkSizeDecrease, opt.Checkmark.Size.Y.Scale, opt.Checkmark.Size.Y.Offset)
										}):Play()
										Tween(opt.NameLabel, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle), {
											TextTransparency = tweensettings.transparencyOut
										}):Play()
										opt.Checkmark.TextTransparency = 1
									end
								end
								Selected = {optionName}
								DropdownFunctions.Value = Selected[1]
							end
							Tween(checkmark, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle), {
								Size = UDim2.new(checkmark.Size.X.Scale, tweensettings.checkSizeIncrease, checkmark.Size.Y.Scale, checkmark.Size.Y.Offset)
							}):Play()
							Tween(optionNameLabel, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle), {
								TextTransparency = tweensettings.transparencyIn
							}):Play()
							checkmark.TextTransparency = 0
						else
							if DropdownFunctions.Settings.Multi then
								local idx = table.find(Selected, optionName)
								if idx then
									table.remove(Selected, idx)
								end
							else
								Selected = {}
							end
							Tween(checkmark, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle), {
								Size = UDim2.new(checkmark.Size.X.Scale, tweensettings.checkSizeDecrease, checkmark.Size.Y.Scale, checkmark.Size.Y.Offset)
							}):Play()
							Tween(optionNameLabel, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle), {
								TextTransparency = tweensettings.transparencyOut
							}):Play()
							checkmark.TextTransparency = 1
						end

						if Settings.Required and #Selected == 0 and not State then
							return
						end

						if #Selected > 0 then
							dropdownName.Text = DropdownFunctions.Settings.Name .. " • " .. table.concat(Selected, ", ")
						else
							dropdownName.Text = DropdownFunctions.Settings.Name .. "..."
						end
					end

					local dropped = false
					local db = false

					local function ToggleDropdown()
						if db then return end
						db = true
						local defaultDropdownSize = 38
						local isDropdownOpen = not dropped
						local targetSize = isDropdownOpen and UDim2.new(1, 0, 0, CalculateDropdownSize()) or UDim2.new(1, 0, 0, defaultDropdownSize)

						local dropTween = Tween(dropdown, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
							Size = targetSize
						})
						local iconTween = Tween(dropdownImage, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							Rotation = isDropdownOpen and -90 or 0
						})

						dropTween:Play()
						iconTween:Play()

						if isDropdownOpen then
							dropdownFrame.Visible = true
							dropTween.Completed:Connect(function()
								db = false
							end)
						else
							dropTween.Completed:Connect(function()
								dropdownFrame.Visible = false
								db = false
							end)
						end

						dropped = isDropdownOpen
					end

					interact.MouseButton1Click:Connect(ToggleDropdown)

					local function addOption(i, v)
						local option = Instance.new("TextButton")
						option.Name = "Option"
						option.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
						option.Text = ""
						option.TextColor3 = Color3.fromRGB(0, 0, 0)
						option.TextSize = 14
						option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						option.BackgroundTransparency = 1
						option.BorderColor3 = Color3.fromRGB(0, 0, 0)
						option.BorderSizePixel = 0
						option.Size = UDim2.new(1, 0, 0, 30)

						local optionUIPadding = Instance.new("UIPadding")
						optionUIPadding.Name = "OptionUIPadding"
						optionUIPadding.PaddingLeft = UDim.new(0, 15)
						optionUIPadding.Parent = option

						local optionName = Instance.new("TextLabel")
						optionName.Name = "OptionName"
						optionName.FontFace = Font.new(assets.interFont)
						optionName.Text = v
						optionName.RichText = true
						optionName.TextColor3 = Color3.fromRGB(255, 255, 255)
						optionName.TextSize = 13
						optionName.TextTransparency = 0.5
						optionName.TextTruncate = Enum.TextTruncate.AtEnd
						optionName.TextXAlignment = Enum.TextXAlignment.Left
						optionName.TextYAlignment = Enum.TextYAlignment.Top
						optionName.AnchorPoint = Vector2.new(0, 0.5)
						optionName.AutomaticSize = Enum.AutomaticSize.XY
						optionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						optionName.BackgroundTransparency = 1
						optionName.BorderColor3 = Color3.fromRGB(0, 0, 0)
						optionName.BorderSizePixel = 0
						optionName.Position = UDim2.fromScale(1.3e-07, 0.5)
						optionName.Parent = option

						local optionUIListLayout = Instance.new("UIListLayout")
						optionUIListLayout.Name = "OptionUIListLayout"
						optionUIListLayout.Padding = UDim.new(0, 10)
						optionUIListLayout.FillDirection = Enum.FillDirection.Horizontal
						optionUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
						optionUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
						optionUIListLayout.Parent = option

						local checkmark = Instance.new("TextLabel")
						checkmark.Name = "Checkmark"
						checkmark.FontFace = Font.new(assets.interFont)
						checkmark.Text = "✓"
						checkmark.TextColor3 = Color3.fromRGB(255, 255, 255)
						checkmark.TextSize = 13
						checkmark.TextTransparency = 1
						checkmark.TextXAlignment = Enum.TextXAlignment.Left
						checkmark.TextYAlignment = Enum.TextYAlignment.Top
						checkmark.AnchorPoint = Vector2.new(0, 0.5)
						checkmark.AutomaticSize = Enum.AutomaticSize.Y
						checkmark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						checkmark.BackgroundTransparency = 1
						checkmark.BorderColor3 = Color3.fromRGB(0, 0, 0)
						checkmark.BorderSizePixel = 0
						checkmark.LayoutOrder = -1
						checkmark.Position = UDim2.fromScale(1.3e-07, 0.5)
						checkmark.Size = UDim2.fromOffset(-10, 0)
						checkmark.Parent = option

						option.Parent = dropdownFrame

						dropdownFrame.Parent = dropdown
						OptionObjs[v] = {
							Index = i,
							Button = option,
							NameLabel = optionName,
							Checkmark = checkmark
						}

						local tweensettings = {
							duration = 0.2,
							easingStyle = Enum.EasingStyle.Quint,
							transparencyIn = 0.2,
							transparencyOut = 0.5,
							checkSizeIncrease = 12,
							checkSizeDecrease = -optionUIListLayout.Padding.Offset,
							waitTime = 1
						}
						local tweens = {
							checkIn = Tween(checkmark, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle), {
								Size = UDim2.new(checkmark.Size.X.Scale, tweensettings.checkSizeIncrease, checkmark.Size.Y.Scale, checkmark.Size.Y.Offset)
							}),
							checkOut = Tween(checkmark, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle),{
								Size = UDim2.new(checkmark.Size.X.Scale, tweensettings.checkSizeDecrease, checkmark.Size.Y.Scale, checkmark.Size.Y.Offset)
							}),
							nameIn = Tween(optionName, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle),{
								TextTransparency = tweensettings.transparencyIn
							}),
							nameOut = Tween(optionName, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle),{
								TextTransparency = tweensettings.transparencyOut
							})
						}

						local isSelected = false
						if DropdownFunctions.Settings.Default then
							if DropdownFunctions.Settings.Multi then
								isSelected = table.find(DropdownFunctions.Settings.Default, v) and true or false
							else
								isSelected = (DropdownFunctions.Settings.Default == i) and true or false
							end
						end
						Toggle(v, isSelected)

						local option = OptionObjs[v].Button

						option.MouseButton1Click:Connect(function()
							local isSelected = table.find(Selected, v) and true or false
							local newSelected = not isSelected

							if DropdownFunctions.Settings.Required and not newSelected and #Selected <= 1 then
								return
							end

							Toggle(v, newSelected)

							task.spawn(function()
								if DropdownFunctions.Settings.Multi then
									local Return = {}
									for _, opt in ipairs(Selected) do
										Return[opt] = true
									end
									if DropdownFunctions.Settings.Callback then
										DropdownFunctions.Settings.Callback(Return)
									end

								else
									if newSelected and DropdownFunctions.Settings.Callback then
										DropdownFunctions.Settings.Callback(Selected[1] or nil)
									end
								end
							end)
						end)

						if dropped then
							dropdown.Size = UDim2.new(1, 0, 0, CalculateDropdownSize())
						end
					end

					if DropdownFunctions.Settings.Options then
						for i, v in pairs(DropdownFunctions.Settings.Options) do
							addOption(i, v)
						end
					end

					function DropdownFunctions:UpdateName(New)
						dropdownName.Text = New
					end
					function DropdownFunctions:SetVisibility(State)
						dropdown.Visible = State
					end
					function DropdownFunctions:UpdateSelection(newSelection)
						if not newSelection then return end

						for option, _ in pairs(OptionObjs) do
							Toggle(option, false)
						end

						local selectedOptions = {}
						if type(newSelection) == "number" then
							for option, data in pairs(OptionObjs) do
								local isSelected = data.Index == newSelection
								Toggle(option, isSelected)
								if isSelected then
									table.insert(selectedOptions, option)
								end
							end
						elseif type(newSelection) == "string" then
							for option, data in pairs(OptionObjs) do
								local isSelected = option == newSelection
								Toggle(option, isSelected)
								if isSelected then
									table.insert(selectedOptions, option)
								end
							end
						elseif type(newSelection) == "table" then
							for option, _ in pairs(OptionObjs) do
								local isSelected = table.find(newSelection, option) ~= nil
								Toggle(option, isSelected)
								if isSelected then
									table.insert(selectedOptions, option)
								end
							end
						end

						if DropdownFunctions.Settings.Callback then
							if DropdownFunctions.Settings.Multi then
								local Return = {}
								for _, opt in ipairs(selectedOptions) do
									Return[opt] = true
								end
								DropdownFunctions.Settings.Callback(Return)
							else
								DropdownFunctions.Settings.Callback(selectedOptions[1] or nil)
							end
						end
					end
					function DropdownFunctions:InsertOptions(newOptions)
						if not newOptions then return end
						DropdownFunctions.Settings.Options = newOptions
						for i, v in pairs(newOptions) do
							addOption(i, v)
						end
					end
					function DropdownFunctions:ClearOptions()
						for _, optionData in pairs(OptionObjs) do
							optionData.Button:Destroy()
						end
						OptionObjs = {}
						Selected = {}

						if dropped then
							dropdown.Size = UDim2.new(1, 0, 0, CalculateDropdownSize())
						end
					end
					function DropdownFunctions:GetOptions()
						local optionsStatus = {}

						for option, data in pairs(OptionObjs) do
							local isSelected = table.find(Selected, option) and true or false
							optionsStatus[option] = isSelected
						end

						return optionsStatus
					end

					function DropdownFunctions:RemoveOptions(remove)
						if not remove then return end
						for _, optionName in ipairs(remove) do
							local optionData = OptionObjs[optionName]

							if optionData then
								for i = #Selected, 1, -1 do
									if Selected[i] == optionName then
										table.remove(Selected, i)
									end
								end

								optionData.Button:Destroy()

								OptionObjs[optionName] = nil
							end
						end

						if dropped then
							dropdown.Size = UDim2.new(1, 0, 0, CalculateDropdownSize())
						end
					end
					function DropdownFunctions:IsOption(optionName)
						if not optionName then return end
						return OptionObjs[optionName] ~= nil
					end

					if Flag then
						MacLib.Options[Flag] = DropdownFunctions
					end

					return DropdownFunctions
				end

				function SectionFunctions:Colorpicker(Settings, Flag)
					local ColorpickerFunctions = { Settings = Settings, IgnoreConfig = false, Class = "Colorpicker" }

					local isAlpha = ColorpickerFunctions.Settings.Alpha and true or false
					ColorpickerFunctions.Color = ColorpickerFunctions.Settings.Default
					ColorpickerFunctions.Alpha = isAlpha and ColorpickerFunctions.Settings.Alpha

					local colorpicker = Instance.new("Frame")
					colorpicker.Name = "Colorpicker"
					colorpicker.AutomaticSize = Enum.AutomaticSize.Y
					colorpicker.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					colorpicker.BackgroundTransparency = 1
					colorpicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
					colorpicker.BorderSizePixel = 0
					colorpicker.Size = UDim2.new(1, 0, 0, 38)
					colorpicker.Parent = section

					local colorpickerName = Instance.new("TextLabel")
					colorpickerName.Name = "KeybindName"
					colorpickerName.FontFace = Font.new(assets.interFont)
					colorpickerName.Text = Settings.Name
					colorpickerName.TextColor3 = Color3.fromRGB(255, 255, 255)
					colorpickerName.TextSize = 13
					colorpickerName.TextTransparency = 0.5
					colorpickerName.RichText = true
					colorpickerName.TextTruncate = Enum.TextTruncate.AtEnd
					colorpickerName.TextXAlignment = Enum.TextXAlignment.Left
					colorpickerName.TextYAlignment = Enum.TextYAlignment.Top
					colorpickerName.AnchorPoint = Vector2.new(0, 0.5)
					colorpickerName.AutomaticSize = Enum.AutomaticSize.XY
					colorpickerName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					colorpickerName.BackgroundTransparency = 1
					colorpickerName.BorderColor3 = Color3.fromRGB(0, 0, 0)
					colorpickerName.BorderSizePixel = 0
					colorpickerName.Position = UDim2.fromScale(0, 0.5)
					colorpickerName.Parent = colorpicker

					local colorCbg = Instance.new("ImageLabel")
					colorCbg.Name = "NewColor"
					colorCbg.Image = assets.grid
					colorCbg.ScaleType = Enum.ScaleType.Tile
					colorCbg.TileSize = UDim2.fromOffset(500, 500)
					colorCbg.AnchorPoint = Vector2.new(1, 0.5)
					colorCbg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					colorCbg.BackgroundTransparency = 1
					colorCbg.BorderColor3 = Color3.fromRGB(0, 0, 0)
					colorCbg.BorderSizePixel = 0
					colorCbg.Position = UDim2.fromScale(1, 0.5)
					colorCbg.Size = UDim2.fromOffset(21, 21)

					local colorC = Instance.new("Frame")
					colorC.Name = "Color"
					colorC.AnchorPoint = Vector2.new(0.5, 0.5)
					colorC.BackgroundColor3 = ColorpickerFunctions.Color
					colorC.BorderSizePixel = 0
					colorC.Position = UDim2.fromScale(0.5, 0.5)
					colorC.Size = UDim2.fromScale(1, 1)
					colorC.BackgroundTransparency = ColorpickerFunctions.Alpha or 0

					local uICorner = Instance.new("UICorner")
					uICorner.Name = "UICorner"
					uICorner.CornerRadius = UDim.new(0, 6)
					uICorner.Parent = colorC

					local interact = Instance.new("TextButton")
					interact.Name = "Interact"
					interact.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
					interact.Text = ""
					interact.TextColor3 = Color3.fromRGB(0, 0, 0)
					interact.TextSize = 14
					interact.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					interact.BackgroundTransparency = 1
					interact.BorderColor3 = Color3.fromRGB(0, 0, 0)
					interact.BorderSizePixel = 0
					interact.Size = UDim2.fromScale(1, 1)
					interact.Parent = colorC

					colorC.Parent = colorCbg

					local uICorner1 = Instance.new("UICorner")
					uICorner1.Name = "UICorner"
					uICorner1.CornerRadius = UDim.new(0, 8)
					uICorner1.Parent = colorCbg

					colorCbg.Parent = colorpicker

					local colorPicker = Instance.new("Frame")
					colorPicker.Name = "ColorPicker"
					colorPicker.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					colorPicker.BackgroundTransparency = 0.5
					colorPicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
					colorPicker.BorderSizePixel = 0
					colorPicker.Size = UDim2.fromScale(1, 1)
					colorPicker.Visible = false

					local baseUICorner = Instance.new("UICorner")
					baseUICorner.Name = "BaseUICorner"
					baseUICorner.CornerRadius = UDim.new(0, 10)
					baseUICorner.Parent = colorPicker

					local prompt = Instance.new("Frame")
					prompt.Name = "Prompt"
					prompt.AnchorPoint = Vector2.new(0.5, 0.5)
					prompt.AutomaticSize = Enum.AutomaticSize.Y
					prompt.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
					prompt.BorderColor3 = Color3.fromRGB(0, 0, 0)
					prompt.BorderSizePixel = 0
					prompt.Position = UDim2.fromScale(0.5, 0.5)
					prompt.Size = UDim2.fromOffset(420, 0)

					local promptUIScale = Instance.new("UIScale")
					promptUIScale.Name = "BaseUIScale"
					promptUIScale.Parent = prompt
					promptUIScale.Scale = 0.95

					local globalSettingsUIStroke = Instance.new("UIStroke")
					globalSettingsUIStroke.Name = "GlobalSettingsUIStroke"
					globalSettingsUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					globalSettingsUIStroke.Color = Color3.fromRGB(255, 255, 255)
					globalSettingsUIStroke.Transparency = 0.9
					globalSettingsUIStroke.Parent = prompt

					local globalSettingsUICorner = Instance.new("UICorner")
					globalSettingsUICorner.Name = "GlobalSettingsUICorner"
					globalSettingsUICorner.CornerRadius = UDim.new(0, 10)
					globalSettingsUICorner.Parent = prompt

					local uIListLayout = Instance.new("UIListLayout")
					uIListLayout.Name = "UIListLayout"
					uIListLayout.Padding = UDim.new(0, 10)
					uIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
					uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout.Parent = prompt

					local colorOptions = Instance.new("Frame")
					colorOptions.Name = "ColorOptions"
					colorOptions.AutomaticSize = Enum.AutomaticSize.XY
					colorOptions.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					colorOptions.BackgroundTransparency = 1
					colorOptions.BorderColor3 = Color3.fromRGB(0, 0, 0)
					colorOptions.BorderSizePixel = 0
					colorOptions.LayoutOrder = 1
					colorOptions.Size = UDim2.fromScale(1, 0)

					local value = Instance.new("TextButton")
					value.Name = "Value"
					value.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
					value.Text = ""
					value.TextColor3 = Color3.fromRGB(0, 0, 0)
					value.TextSize = 14
					value.AutoButtonColor = false
					value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					value.BorderColor3 = Color3.fromRGB(0, 0, 0)
					value.BorderSizePixel = 0
					value.LayoutOrder = 1
					value.Position = UDim2.fromScale(0.092, 0.886)
					value.Size = UDim2.new(1, 0, 0, 15)

					local uIGradient = Instance.new("UIGradient")
					uIGradient.Name = "UIGradient"
					uIGradient.Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
						ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
					})
					uIGradient.Parent = value

					local slide = Instance.new("Frame")
					slide.Name = "Slide"
					slide.AnchorPoint = Vector2.new(0, 0.5)
					slide.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					slide.BorderColor3 = Color3.fromRGB(27, 42, 53)
					slide.BorderSizePixel = 0
					slide.Position = UDim2.fromScale(0, 0.5)
					slide.Size = UDim2.new(0, 13, 1, 8)

					local uICorner = Instance.new("UICorner")
					uICorner.Name = "UICorner"
					uICorner.CornerRadius = UDim.new(1, 0)
					uICorner.Parent = slide

					local uIStroke = Instance.new("UIStroke")
					uIStroke.Name = "UIStroke"
					uIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					uIStroke.Transparency = 0.5
					uIStroke.Parent = slide

					slide.Parent = value

					local uICorner1 = Instance.new("UICorner")
					uICorner1.Name = "UICorner"
					uICorner1.CornerRadius = UDim.new(0, 6)
					uICorner1.Parent = value

					local uIStroke1 = Instance.new("UIStroke")
					uIStroke1.Name = "UIStroke"
					uIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					uIStroke1.Color = Color3.fromRGB(255, 255, 255)
					uIStroke1.Transparency = 0.9

					local uIGradient1 = Instance.new("UIGradient")
					uIGradient1.Name = "UIGradient"
					uIGradient1.Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
						ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
					})
					uIGradient1.Rotation = 180
					uIGradient1.Parent = uIStroke1

					uIStroke1.Parent = value

					value.Parent = colorOptions

					local uIListLayout1 = Instance.new("UIListLayout")
					uIListLayout1.Name = "UIListLayout"
					uIListLayout1.Padding = UDim.new(0, 25)
					uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout1.Parent = colorOptions

					local wheel = Instance.new("Frame")
					wheel.Name = "Wheel"
					wheel.AutomaticSize = Enum.AutomaticSize.Y
					wheel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					wheel.BackgroundTransparency = 1
					wheel.BorderColor3 = Color3.fromRGB(0, 0, 0)
					wheel.BorderSizePixel = 0
					wheel.Size = UDim2.new(1, 0, 0, 100)

					local wheel1 = Instance.new("ImageButton")
					wheel1.Name = "Wheel"
					wheel1.Image = assets.colorWheel
					wheel1.AutoButtonColor = false
					wheel1.Active = false
					wheel1.BackgroundColor3 = Color3.fromRGB(248, 248, 248)
					wheel1.BackgroundTransparency = 1
					wheel1.BorderColor3 = Color3.fromRGB(27, 42, 53)
					wheel1.Selectable = false
					wheel1.Size = UDim2.fromOffset(220, 220)
					wheel1.SizeConstraint = Enum.SizeConstraint.RelativeYY

					local target = Instance.new("ImageLabel")
					target.Name = "Target"
					target.Image = assets.colorTarget
					target.ImageColor3 = Color3.fromRGB(0, 0, 0)
					target.AnchorPoint = Vector2.new(0.5, 0.5)
					target.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					target.BackgroundTransparency = 1
					target.BorderColor3 = Color3.fromRGB(27, 42, 53)
					target.Position = UDim2.fromScale(0.5, 0.5)
					target.Size = UDim2.fromOffset(22, 22)
					target.SizeConstraint = Enum.SizeConstraint.RelativeYY
					target.Parent = wheel1

					wheel1.Parent = wheel

					local inputs = Instance.new("Frame")
					inputs.Name = "Inputs"
					inputs.AnchorPoint = Vector2.new(1, 0.5)
					inputs.AutomaticSize = Enum.AutomaticSize.XY
					inputs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputs.BackgroundTransparency = 1
					inputs.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputs.BorderSizePixel = 0
					inputs.LayoutOrder = 1
					inputs.Position = UDim2.fromScale(1, 0.5)

					local uIListLayout2 = Instance.new("UIListLayout")
					uIListLayout2.Name = "UIListLayout"
					uIListLayout2.Padding = UDim.new(0, 5)
					uIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout2.Parent = inputs

					local red = Instance.new("Frame")
					red.Name = "Red"
					red.AutomaticSize = Enum.AutomaticSize.XY
					red.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					red.BackgroundTransparency = 1
					red.BorderColor3 = Color3.fromRGB(0, 0, 0)
					red.BorderSizePixel = 0
					red.LayoutOrder = 1
					red.Size = UDim2.fromOffset(0, 38)

					local inputName = Instance.new("TextLabel")
					inputName.Name = "InputName"
					inputName.FontFace = Font.new(assets.interFont)
					inputName.Text = "Red"
					inputName.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputName.TextSize = 13
					inputName.TextTransparency = 0.5
					inputName.TextTruncate = Enum.TextTruncate.AtEnd
					inputName.TextXAlignment = Enum.TextXAlignment.Left
					inputName.TextYAlignment = Enum.TextYAlignment.Top
					inputName.AnchorPoint = Vector2.new(0, 0.5)
					inputName.AutomaticSize = Enum.AutomaticSize.XY
					inputName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputName.BackgroundTransparency = 1
					inputName.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputName.BorderSizePixel = 0
					inputName.LayoutOrder = 2
					inputName.Position = UDim2.fromScale(0, 0.5)
					inputName.Parent = red

					local uIListLayout3 = Instance.new("UIListLayout")
					uIListLayout3.Name = "UIListLayout"
					uIListLayout3.Padding = UDim.new(0, 15)
					uIListLayout3.FillDirection = Enum.FillDirection.Horizontal
					uIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout3.VerticalAlignment = Enum.VerticalAlignment.Center
					uIListLayout3.Parent = red

					local inputBox = Instance.new("TextBox")
					inputBox.Name = "InputBox"
					inputBox.ClearTextOnFocus = false
					inputBox.CursorPosition = -1
					inputBox.FontFace = Font.new(assets.interFont)
					inputBox.Text = "255"
					inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputBox.TextSize = 12
					inputBox.TextTransparency = 0.1
					inputBox.TextXAlignment = Enum.TextXAlignment.Left
					inputBox.AnchorPoint = Vector2.new(1, 0.5)
					inputBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputBox.BackgroundTransparency = 0.95
					inputBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputBox.BorderSizePixel = 0
					inputBox.ClipsDescendants = true
					inputBox.LayoutOrder = 1
					inputBox.Position = UDim2.fromScale(1, 0.5)
					inputBox.Size = UDim2.fromOffset(75, 25)

					local inputBoxUICorner = Instance.new("UICorner")
					inputBoxUICorner.Name = "InputBoxUICorner"
					inputBoxUICorner.CornerRadius = UDim.new(0, 4)
					inputBoxUICorner.Parent = inputBox

					local inputBoxUIStroke = Instance.new("UIStroke")
					inputBoxUIStroke.Name = "InputBoxUIStroke"
					inputBoxUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					inputBoxUIStroke.Color = Color3.fromRGB(255, 255, 255)
					inputBoxUIStroke.Transparency = 0.9
					inputBoxUIStroke.Parent = inputBox

					local inputBoxUISizeConstraint = Instance.new("UISizeConstraint")
					inputBoxUISizeConstraint.Name = "InputBoxUISizeConstraint"
					inputBoxUISizeConstraint.Parent = inputBox

					local inputBoxUIPadding = Instance.new("UIPadding")
					inputBoxUIPadding.Name = "InputBoxUIPadding"
					inputBoxUIPadding.PaddingLeft = UDim.new(0, 8)
					inputBoxUIPadding.PaddingRight = UDim.new(0, 10)
					inputBoxUIPadding.Parent = inputBox

					inputBox.Parent = red

					red.Parent = inputs

					local green = Instance.new("Frame")
					green.Name = "Green"
					green.AutomaticSize = Enum.AutomaticSize.XY
					green.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					green.BackgroundTransparency = 1
					green.BorderColor3 = Color3.fromRGB(0, 0, 0)
					green.BorderSizePixel = 0
					green.LayoutOrder = 2
					green.Size = UDim2.fromOffset(0, 38)

					local inputName1 = Instance.new("TextLabel")
					inputName1.Name = "InputName"
					inputName1.FontFace = Font.new(assets.interFont)
					inputName1.Text = "Green"
					inputName1.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputName1.TextSize = 13
					inputName1.TextTransparency = 0.5
					inputName1.TextTruncate = Enum.TextTruncate.AtEnd
					inputName1.TextXAlignment = Enum.TextXAlignment.Left
					inputName1.TextYAlignment = Enum.TextYAlignment.Top
					inputName1.AnchorPoint = Vector2.new(0, 0.5)
					inputName1.AutomaticSize = Enum.AutomaticSize.XY
					inputName1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputName1.BackgroundTransparency = 1
					inputName1.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputName1.BorderSizePixel = 0
					inputName1.LayoutOrder = 2
					inputName1.Position = UDim2.fromScale(0, 0.5)
					inputName1.Parent = green

					local uIListLayout4 = Instance.new("UIListLayout")
					uIListLayout4.Name = "UIListLayout"
					uIListLayout4.Padding = UDim.new(0, 15)
					uIListLayout4.FillDirection = Enum.FillDirection.Horizontal
					uIListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout4.VerticalAlignment = Enum.VerticalAlignment.Center
					uIListLayout4.Parent = green

					local inputBox1 = Instance.new("TextBox")
					inputBox1.Name = "InputBox"
					inputBox1.ClearTextOnFocus = false
					inputBox1.FontFace = Font.new(assets.interFont)
					inputBox1.Text = "255"
					inputBox1.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputBox1.TextSize = 12
					inputBox1.TextTransparency = 0.1
					inputBox1.TextXAlignment = Enum.TextXAlignment.Left
					inputBox1.AnchorPoint = Vector2.new(1, 0.5)
					inputBox1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputBox1.BackgroundTransparency = 0.95
					inputBox1.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputBox1.BorderSizePixel = 0
					inputBox1.ClipsDescendants = true
					inputBox1.LayoutOrder = 1
					inputBox1.Position = UDim2.fromScale(1, 0.5)
					inputBox1.Size = UDim2.fromOffset(75, 25)

					local inputBoxUICorner1 = Instance.new("UICorner")
					inputBoxUICorner1.Name = "InputBoxUICorner"
					inputBoxUICorner1.CornerRadius = UDim.new(0, 4)
					inputBoxUICorner1.Parent = inputBox1

					local inputBoxUIStroke1 = Instance.new("UIStroke")
					inputBoxUIStroke1.Name = "InputBoxUIStroke"
					inputBoxUIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					inputBoxUIStroke1.Color = Color3.fromRGB(255, 255, 255)
					inputBoxUIStroke1.Transparency = 0.9
					inputBoxUIStroke1.Parent = inputBox1

					local inputBoxUISizeConstraint1 = Instance.new("UISizeConstraint")
					inputBoxUISizeConstraint1.Name = "InputBoxUISizeConstraint"
					inputBoxUISizeConstraint1.Parent = inputBox1

					local inputBoxUIPadding1 = Instance.new("UIPadding")
					inputBoxUIPadding1.Name = "InputBoxUIPadding"
					inputBoxUIPadding1.PaddingLeft = UDim.new(0, 8)
					inputBoxUIPadding1.PaddingRight = UDim.new(0, 10)
					inputBoxUIPadding1.Parent = inputBox1

					inputBox1.Parent = green

					green.Parent = inputs

					local blue = Instance.new("Frame")
					blue.Name = "Blue"
					blue.AutomaticSize = Enum.AutomaticSize.XY
					blue.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					blue.BackgroundTransparency = 1
					blue.BorderColor3 = Color3.fromRGB(0, 0, 0)
					blue.BorderSizePixel = 0
					blue.LayoutOrder = 3
					blue.Size = UDim2.fromOffset(0, 38)

					local inputName2 = Instance.new("TextLabel")
					inputName2.Name = "InputName"
					inputName2.FontFace = Font.new(assets.interFont)
					inputName2.Text = "Blue"
					inputName2.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputName2.TextSize = 13
					inputName2.TextTransparency = 0.5
					inputName2.TextTruncate = Enum.TextTruncate.AtEnd
					inputName2.TextXAlignment = Enum.TextXAlignment.Left
					inputName2.TextYAlignment = Enum.TextYAlignment.Top
					inputName2.AnchorPoint = Vector2.new(0, 0.5)
					inputName2.AutomaticSize = Enum.AutomaticSize.XY
					inputName2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputName2.BackgroundTransparency = 1
					inputName2.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputName2.BorderSizePixel = 0
					inputName2.LayoutOrder = 2
					inputName2.Position = UDim2.fromScale(0, 0.5)
					inputName2.Parent = blue

					local uIListLayout5 = Instance.new("UIListLayout")
					uIListLayout5.Name = "UIListLayout"
					uIListLayout5.Padding = UDim.new(0, 15)
					uIListLayout5.FillDirection = Enum.FillDirection.Horizontal
					uIListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout5.VerticalAlignment = Enum.VerticalAlignment.Center
					uIListLayout5.Parent = blue

					local inputBox2 = Instance.new("TextBox")
					inputBox2.Name = "InputBox"
					inputBox2.ClearTextOnFocus = false
					inputBox2.FontFace = Font.new(assets.interFont)
					inputBox2.Text = "255"
					inputBox2.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputBox2.TextSize = 12
					inputBox2.TextTransparency = 0.1
					inputBox2.TextXAlignment = Enum.TextXAlignment.Left
					inputBox2.AnchorPoint = Vector2.new(1, 0.5)
					inputBox2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputBox2.BackgroundTransparency = 0.95
					inputBox2.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputBox2.BorderSizePixel = 0
					inputBox2.ClipsDescendants = true
					inputBox2.LayoutOrder = 1
					inputBox2.Position = UDim2.fromScale(1, 0.5)
					inputBox2.Size = UDim2.fromOffset(75, 25)

					local inputBoxUICorner2 = Instance.new("UICorner")
					inputBoxUICorner2.Name = "InputBoxUICorner"
					inputBoxUICorner2.CornerRadius = UDim.new(0, 4)
					inputBoxUICorner2.Parent = inputBox2

					local inputBoxUIStroke2 = Instance.new("UIStroke")
					inputBoxUIStroke2.Name = "InputBoxUIStroke"
					inputBoxUIStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					inputBoxUIStroke2.Color = Color3.fromRGB(255, 255, 255)
					inputBoxUIStroke2.Transparency = 0.9
					inputBoxUIStroke2.Parent = inputBox2

					local inputBoxUISizeConstraint2 = Instance.new("UISizeConstraint")
					inputBoxUISizeConstraint2.Name = "InputBoxUISizeConstraint"
					inputBoxUISizeConstraint2.Parent = inputBox2

					local inputBoxUIPadding2 = Instance.new("UIPadding")
					inputBoxUIPadding2.Name = "InputBoxUIPadding"
					inputBoxUIPadding2.PaddingLeft = UDim.new(0, 8)
					inputBoxUIPadding2.PaddingRight = UDim.new(0, 10)
					inputBoxUIPadding2.Parent = inputBox2

					inputBox2.Parent = blue

					blue.Parent = inputs

					local alpha = Instance.new("Frame")
					alpha.Name = "Alpha"
					alpha.AutomaticSize = Enum.AutomaticSize.XY
					alpha.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					alpha.BackgroundTransparency = 1
					alpha.BorderColor3 = Color3.fromRGB(0, 0, 0)
					alpha.BorderSizePixel = 0
					alpha.LayoutOrder = 4
					alpha.Size = UDim2.fromOffset(0, 38)
					alpha.Visible = isAlpha

					local inputName3 = Instance.new("TextLabel")
					inputName3.Name = "InputName"
					inputName3.FontFace = Font.new(assets.interFont)
					inputName3.Text = "Alpha"
					inputName3.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputName3.TextSize = 13
					inputName3.TextTransparency = 0.5
					inputName3.TextTruncate = Enum.TextTruncate.AtEnd
					inputName3.TextXAlignment = Enum.TextXAlignment.Left
					inputName3.TextYAlignment = Enum.TextYAlignment.Top
					inputName3.AnchorPoint = Vector2.new(0, 0.5)
					inputName3.AutomaticSize = Enum.AutomaticSize.XY
					inputName3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputName3.BackgroundTransparency = 1
					inputName3.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputName3.BorderSizePixel = 0
					inputName3.LayoutOrder = 2
					inputName3.Position = UDim2.fromScale(0, 0.5)
					inputName3.Parent = alpha

					local uIListLayout6 = Instance.new("UIListLayout")
					uIListLayout6.Name = "UIListLayout"
					uIListLayout6.Padding = UDim.new(0, 15)
					uIListLayout6.FillDirection = Enum.FillDirection.Horizontal
					uIListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout6.VerticalAlignment = Enum.VerticalAlignment.Center
					uIListLayout6.Parent = alpha

					local inputBox3 = Instance.new("TextBox")
					inputBox3.Name = "InputBox"
					inputBox3.ClearTextOnFocus = false
					inputBox3.FontFace = Font.new(assets.interFont)
					inputBox3.Text = "0"
					inputBox3.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputBox3.TextSize = 12
					inputBox3.TextTransparency = 0.1
					inputBox3.TextXAlignment = Enum.TextXAlignment.Left
					inputBox3.AnchorPoint = Vector2.new(1, 0.5)
					inputBox3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputBox3.BackgroundTransparency = 0.95
					inputBox3.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputBox3.BorderSizePixel = 0
					inputBox3.ClipsDescendants = true
					inputBox3.LayoutOrder = 1
					inputBox3.Position = UDim2.fromScale(1, 0.5)
					inputBox3.Size = UDim2.fromOffset(75, 25)

					local inputBoxUICorner3 = Instance.new("UICorner")
					inputBoxUICorner3.Name = "InputBoxUICorner"
					inputBoxUICorner3.CornerRadius = UDim.new(0, 4)
					inputBoxUICorner3.Parent = inputBox3

					local inputBoxUIStroke3 = Instance.new("UIStroke")
					inputBoxUIStroke3.Name = "InputBoxUIStroke"
					inputBoxUIStroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					inputBoxUIStroke3.Color = Color3.fromRGB(255, 255, 255)
					inputBoxUIStroke3.Transparency = 0.9
					inputBoxUIStroke3.Parent = inputBox3

					local inputBoxUISizeConstraint3 = Instance.new("UISizeConstraint")
					inputBoxUISizeConstraint3.Name = "InputBoxUISizeConstraint"
					inputBoxUISizeConstraint3.Parent = inputBox3

					local inputBoxUIPadding3 = Instance.new("UIPadding")
					inputBoxUIPadding3.Name = "InputBoxUIPadding"
					inputBoxUIPadding3.PaddingLeft = UDim.new(0, 8)
					inputBoxUIPadding3.PaddingRight = UDim.new(0, 10)
					inputBoxUIPadding3.Parent = inputBox3

					inputBox3.Parent = alpha

					alpha.Parent = inputs

					local hex = Instance.new("Frame")
					hex.Name = "Hex"
					hex.AutomaticSize = Enum.AutomaticSize.XY
					hex.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					hex.BackgroundTransparency = 1
					hex.BorderColor3 = Color3.fromRGB(0, 0, 0)
					hex.BorderSizePixel = 0
					hex.Size = UDim2.fromOffset(0, 38)

					local inputName4 = Instance.new("TextLabel")
					inputName4.Name = "InputName"
					inputName4.FontFace = Font.new(assets.interFont)
					inputName4.Text = "Hex"
					inputName4.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputName4.TextSize = 13
					inputName4.TextTransparency = 0.5
					inputName4.TextTruncate = Enum.TextTruncate.AtEnd
					inputName4.TextXAlignment = Enum.TextXAlignment.Left
					inputName4.TextYAlignment = Enum.TextYAlignment.Top
					inputName4.AnchorPoint = Vector2.new(0, 0.5)
					inputName4.AutomaticSize = Enum.AutomaticSize.XY
					inputName4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputName4.BackgroundTransparency = 1
					inputName4.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputName4.BorderSizePixel = 0
					inputName4.LayoutOrder = 2
					inputName4.Position = UDim2.fromScale(0, 0.5)
					inputName4.Parent = hex

					local uIListLayout7 = Instance.new("UIListLayout")
					uIListLayout7.Name = "UIListLayout"
					uIListLayout7.Padding = UDim.new(0, 15)
					uIListLayout7.FillDirection = Enum.FillDirection.Horizontal
					uIListLayout7.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout7.VerticalAlignment = Enum.VerticalAlignment.Center
					uIListLayout7.Parent = hex

					local inputBox4 = Instance.new("TextBox")
					inputBox4.Name = "InputBox"
					inputBox4.ClearTextOnFocus = false
					inputBox4.CursorPosition = -1
					inputBox4.FontFace = Font.new(assets.interFont)
					inputBox4.Text = "255"
					inputBox4.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputBox4.TextSize = 12
					inputBox4.TextTransparency = 0.1
					inputBox4.TextXAlignment = Enum.TextXAlignment.Left
					inputBox4.AnchorPoint = Vector2.new(1, 0.5)
					inputBox4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputBox4.BackgroundTransparency = 0.95
					inputBox4.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputBox4.BorderSizePixel = 0
					inputBox4.ClipsDescendants = true
					inputBox4.LayoutOrder = 1
					inputBox4.Position = UDim2.fromScale(1, 0.5)
					inputBox4.Size = UDim2.fromOffset(75, 25)

					local inputBoxUICorner4 = Instance.new("UICorner")
					inputBoxUICorner4.Name = "InputBoxUICorner"
					inputBoxUICorner4.CornerRadius = UDim.new(0, 4)
					inputBoxUICorner4.Parent = inputBox4

					local inputBoxUIStroke4 = Instance.new("UIStroke")
					inputBoxUIStroke4.Name = "InputBoxUIStroke"
					inputBoxUIStroke4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					inputBoxUIStroke4.Color = Color3.fromRGB(255, 255, 255)
					inputBoxUIStroke4.Transparency = 0.9
					inputBoxUIStroke4.Parent = inputBox4

					local inputBoxUISizeConstraint4 = Instance.new("UISizeConstraint")
					inputBoxUISizeConstraint4.Name = "InputBoxUISizeConstraint"
					inputBoxUISizeConstraint4.Parent = inputBox4

					local inputBoxUIPadding4 = Instance.new("UIPadding")
					inputBoxUIPadding4.Name = "InputBoxUIPadding"
					inputBoxUIPadding4.PaddingLeft = UDim.new(0, 8)
					inputBoxUIPadding4.PaddingRight = UDim.new(0, 10)
					inputBoxUIPadding4.Parent = inputBox4

					inputBox4.Parent = hex

					hex.Parent = inputs

					inputs.Parent = wheel

					local uIPadding = Instance.new("UIPadding")
					uIPadding.Name = "UIPadding"
					uIPadding.PaddingRight = UDim.new(0, 5)
					uIPadding.Parent = wheel

					wheel.Parent = colorOptions

					local colorWells = Instance.new("Frame")
					colorWells.Name = "ColorWells"
					colorWells.AutomaticSize = Enum.AutomaticSize.Y
					colorWells.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					colorWells.BackgroundTransparency = 1
					colorWells.BorderColor3 = Color3.fromRGB(0, 0, 0)
					colorWells.BorderSizePixel = 0
					colorWells.LayoutOrder = 2
					colorWells.Size = UDim2.fromScale(1, 0)

					local uIGridLayout = Instance.new("UIGridLayout")
					uIGridLayout.Name = "UIGridLayout"
					uIGridLayout.CellPadding = UDim2.fromOffset(10, 0)
					uIGridLayout.CellSize = UDim2.new(0.5, -5, 0, 30)
					uIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
					uIGridLayout.Parent = colorWells

					local newColor = Instance.new("ImageLabel")
					newColor.Name = "NewColor"
					newColor.Image = assets.grid
					newColor.ScaleType = Enum.ScaleType.Tile
					newColor.TileSize = UDim2.fromOffset(500, 500)
					newColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					newColor.BackgroundTransparency = 1
					newColor.BorderColor3 = Color3.fromRGB(0, 0, 0)
					newColor.BorderSizePixel = 0
					newColor.Size = UDim2.fromOffset(100, 100)

					local uICorner2 = Instance.new("UICorner")
					uICorner2.Name = "UICorner"
					uICorner2.Parent = newColor

					local color = Instance.new("Frame")
					color.Name = "Color"
					color.AnchorPoint = Vector2.new(0.5, 0.5)
					color.BorderColor3 = Color3.fromRGB(27, 42, 53)
					color.BorderSizePixel = 0
					color.Position = UDim2.fromScale(0.5, 0.5)
					color.Size = UDim2.new(1, 1, 1, 1)

					local uICorner3 = Instance.new("UICorner")
					uICorner3.Name = "UICorner"
					uICorner3.Parent = color

					color.Parent = newColor

					newColor.Parent = colorWells

					local oldColor = Instance.new("ImageLabel")
					oldColor.Name = "OldColor"
					oldColor.Image = assets.grid
					oldColor.ScaleType = Enum.ScaleType.Tile
					oldColor.TileSize = UDim2.fromOffset(500, 500)
					oldColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					oldColor.BackgroundTransparency = 1
					oldColor.BorderColor3 = Color3.fromRGB(0, 0, 0)
					oldColor.BorderSizePixel = 0
					oldColor.LayoutOrder = 1
					oldColor.Size = UDim2.fromOffset(100, 100)

					local uICorner4 = Instance.new("UICorner")
					uICorner4.Name = "UICorner"
					uICorner4.Parent = oldColor

					local color1 = Instance.new("Frame")
					color1.Name = "Color"
					color1.AnchorPoint = Vector2.new(0.5, 0.5)
					color1.BorderColor3 = Color3.fromRGB(27, 42, 53)
					color1.BorderSizePixel = 0
					color1.Position = UDim2.fromScale(0.5, 0.5)
					color1.Size = UDim2.new(1, 1, 1, 1)

					local uICorner5 = Instance.new("UICorner")
					uICorner5.Name = "UICorner"
					uICorner5.Parent = color1

					color1.Parent = oldColor

					oldColor.Parent = colorWells

					colorWells.Parent = colorOptions

					colorOptions.Parent = prompt

					local interactions = Instance.new("Frame")
					interactions.Name = "Interactions"
					interactions.AutomaticSize = Enum.AutomaticSize.Y
					interactions.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					interactions.BackgroundTransparency = 1
					interactions.BorderColor3 = Color3.fromRGB(0, 0, 0)
					interactions.BorderSizePixel = 0
					interactions.LayoutOrder = 2
					interactions.Size = UDim2.fromScale(1, 0)

					local uIListLayout8 = Instance.new("UIListLayout")
					uIListLayout8.Name = "UIListLayout"
					uIListLayout8.Padding = UDim.new(0, 10)
					uIListLayout8.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout8.Parent = interactions

					local confirm = Instance.new("TextButton")
					confirm.Name = "Confirm"
					confirm.FontFace = Font.new(
						"rbxassetid://12187365364",
						Enum.FontWeight.Medium,
						Enum.FontStyle.Normal
					)
					confirm.Text = "Confirm"
					confirm.TextColor3 = Color3.fromRGB(255, 255, 255)
					confirm.TextSize = 15
					confirm.TextTransparency = 0.5
					confirm.TextTruncate = Enum.TextTruncate.AtEnd
					confirm.AutoButtonColor = false
					confirm.AutomaticSize = Enum.AutomaticSize.Y
					confirm.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
					confirm.BorderColor3 = Color3.fromRGB(0, 0, 0)
					confirm.BorderSizePixel = 0
					confirm.Size = UDim2.fromScale(1, 0)

					local uIPadding1 = Instance.new("UIPadding")
					uIPadding1.Name = "UIPadding"
					uIPadding1.PaddingBottom = UDim.new(0, 9)
					uIPadding1.PaddingLeft = UDim.new(0, 10)
					uIPadding1.PaddingRight = UDim.new(0, 10)
					uIPadding1.PaddingTop = UDim.new(0, 9)
					uIPadding1.Parent = confirm

					local baseUICorner = Instance.new("UICorner")
					baseUICorner.Name = "BaseUICorner"
					baseUICorner.CornerRadius = UDim.new(0, 10)
					baseUICorner.Parent = confirm

					confirm.Parent = interactions

					local cancel = Instance.new("TextButton")
					cancel.Name = "Cancel"
					cancel.FontFace = Font.new(
						"rbxassetid://12187365364",
						Enum.FontWeight.Medium,
						Enum.FontStyle.Normal
					)
					cancel.Text = "Cancel"
					cancel.TextColor3 = Color3.fromRGB(255, 255, 255)
					cancel.TextSize = 15
					cancel.TextTransparency = 0.5
					cancel.TextTruncate = Enum.TextTruncate.AtEnd
					cancel.AutoButtonColor = false
					cancel.AutomaticSize = Enum.AutomaticSize.Y
					cancel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
					cancel.BorderColor3 = Color3.fromRGB(0, 0, 0)
					cancel.BorderSizePixel = 0
					cancel.Size = UDim2.fromScale(1, 0)

					local baseUICorner1 = Instance.new("UICorner")
					baseUICorner1.Name = "BaseUICorner"
					baseUICorner1.CornerRadius = UDim.new(0, 10)
					baseUICorner1.Parent = cancel

					local uIPadding2 = Instance.new("UIPadding")
					uIPadding2.Name = "UIPadding"
					uIPadding2.PaddingBottom = UDim.new(0, 9)
					uIPadding2.PaddingLeft = UDim.new(0, 10)
					uIPadding2.PaddingRight = UDim.new(0, 10)
					uIPadding2.PaddingTop = UDim.new(0, 9)
					uIPadding2.Parent = cancel

					cancel.Parent = interactions

					local uIPadding3 = Instance.new("UIPadding")
					uIPadding3.Name = "UIPadding"
					uIPadding3.PaddingTop = UDim.new(0, 10)
					uIPadding3.Parent = interactions

					interactions.Parent = prompt

					local globalSettingsUIPadding = Instance.new("UIPadding")
					globalSettingsUIPadding.Name = "GlobalSettingsUIPadding"
					globalSettingsUIPadding.PaddingBottom = UDim.new(0, 20)
					globalSettingsUIPadding.PaddingLeft = UDim.new(0, 20)
					globalSettingsUIPadding.PaddingRight = UDim.new(0, 20)
					globalSettingsUIPadding.PaddingTop = UDim.new(0, 20)
					globalSettingsUIPadding.Parent = prompt

					local paragraph = Instance.new("Frame")
					paragraph.Name = "Paragraph"
					paragraph.AutomaticSize = Enum.AutomaticSize.Y
					paragraph.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					paragraph.BackgroundTransparency = 1
					paragraph.BorderColor3 = Color3.fromRGB(0, 0, 0)
					paragraph.BorderSizePixel = 0
					paragraph.Size = UDim2.fromScale(1, 0)

					local paragraphHeader = Instance.new("TextLabel")
					paragraphHeader.Name = "ParagraphHeader"
					paragraphHeader.FontFace = Font.new(
						"rbxassetid://12187365364",
						Enum.FontWeight.SemiBold,
						Enum.FontStyle.Normal
					)
					paragraphHeader.RichText = true
					paragraphHeader.Text = ColorpickerFunctions.Settings.Name
					paragraphHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
					paragraphHeader.TextSize = 18
					paragraphHeader.TextTransparency = 0.4
					paragraphHeader.TextWrapped = true
					paragraphHeader.TextYAlignment = Enum.TextYAlignment.Top
					paragraphHeader.AutomaticSize = Enum.AutomaticSize.XY
					paragraphHeader.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					paragraphHeader.BackgroundTransparency = 1
					paragraphHeader.BorderColor3 = Color3.fromRGB(0, 0, 0)
					paragraphHeader.BorderSizePixel = 0
					paragraphHeader.Size = UDim2.fromScale(1, 0)
					paragraphHeader.Parent = paragraph

					local uIListLayout9 = Instance.new("UIListLayout")
					uIListLayout9.Name = "UIListLayout"
					uIListLayout9.Padding = UDim.new(0, 15)
					uIListLayout9.HorizontalAlignment = Enum.HorizontalAlignment.Center
					uIListLayout9.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout9.Parent = paragraph

					local uIPadding4 = Instance.new("UIPadding")
					uIPadding4.Name = "UIPadding"
					uIPadding4.PaddingBottom = UDim.new(0, 15)
					uIPadding4.Parent = paragraph

					local line = Instance.new("Frame")
					line.Name = "Line"
					line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					line.BackgroundTransparency = 0.9
					line.BorderColor3 = Color3.fromRGB(0, 0, 0)
					line.BorderSizePixel = 0
					line.LayoutOrder = 1
					line.Size = UDim2.new(1, 0, 0, 1)
					line.Parent = paragraph

					paragraph.Parent = prompt

					prompt.Parent = colorPicker

					colorPicker.Parent = base

					local fromHSV, fromRGB, v2, udim2 = Color3.fromHSV, Color3.fromRGB, Vector2.new, UDim2.new

					local wheel = wheel1
					local ring = target
					local slider = value
					local colour = color

					local modifierInputs = {
						Hex = hex.InputBox,
						Red = red.InputBox,
						Green = green.InputBox,
						Blue = blue.InputBox,
						Alpha = alpha.InputBox
					}

					local Mouse = LocalPlayer:GetMouse()

					local WheelDown, SlideDown = false, false
					local hue, saturation, value = 0, 0, 1

					local function toPolar(v)
						return math.atan2(v.y, v.x), v.magnitude
					end

					local function radToDeg(x)
						return ((x + math.pi) / (2 * math.pi)) * 360
					end

					local function degToRad(degrees)
						return degrees * (math.pi / 180)
					end

					local function hexToRGB(hex)
						hex = hex:gsub("#","")
						if #hex ~= 6 then return 0, 0, 0 end
						local r = tonumber(hex:sub(1, 2), 16) or 0
						local g = tonumber(hex:sub(3, 4), 16) or 0
						local b = tonumber(hex:sub(5, 6), 16) or 0
						return r, g, b
					end

					local function clampInput(value, min, max)
						local num = tonumber(value)
						if num then
							return math.clamp(num, min, max)
						end
						return min
					end

					local function update()
						local c = fromHSV(hue, saturation, value)
						colour.BackgroundColor3 = c
						colour.BackgroundTransparency = clampInput(modifierInputs.Alpha.Text, 0, 1)

						modifierInputs.Red.Text = tostring(math.floor(c.r * 255 + 0.5))
						modifierInputs.Green.Text = tostring(math.floor(c.g * 255 + 0.5))
						modifierInputs.Blue.Text = tostring(math.floor(c.b * 255 + 0.5))
						modifierInputs.Alpha.Text = clampInput(modifierInputs.Alpha.Text, 0, 1)

						local hexColor = string.format("#%02X%02X%02X", 
							math.floor(c.r * 255 + 0.5),
							math.floor(c.g * 255 + 0.5),
							math.floor(c.b * 255 + 0.5))
						modifierInputs.Hex.Text = hexColor
					end

					local function UpdateSlide(iX)
						local rY = iX - slider.AbsolutePosition.X
						local cY = math.clamp(rY, 0, slider.AbsoluteSize.X - slide.AbsoluteSize.X)
						slide.Position = udim2(0, cY, 0.5, 0)
						value = 1 - (cY / (slider.AbsoluteSize.X - slide.AbsoluteSize.X))
						update()
					end

					local function UpdateRing(iX, iY)
						local r = wheel.AbsoluteSize.x / 2
						local d = v2(iX, iY) - wheel.AbsolutePosition - wheel.AbsoluteSize / 2

						if d:Dot(d) > r * r then
							d = d.unit * r
						end

						ring.Position = udim2(0.5, d.x, 0.5, d.y)
						local phi, len = toPolar(d * v2(1, -1))
						hue, saturation = radToDeg(phi) / 360, math.clamp(len / r, 0, 1)
						slider.BackgroundColor3 = fromHSV(hue, saturation, 1)
						update()
					end

					local function UpdateSlideFromValue(value)
						local cY = (1 - value) * (slider.AbsoluteSize.X - slide.AbsoluteSize.X)
						slide.Position = UDim2.new(0, cY, 0.5, 0)
					end

					local function UpdateRingFromHSV(hue, saturation)
						local r = wheel.AbsoluteSize.X / 2
						local phi = degToRad(hue * 360)
						local len = saturation * r
						local x = len * math.cos(phi)
						local y = len * math.sin(phi)

						ring.Position = UDim2.new(0.5, -x, 0.5, y)
						slider.BackgroundColor3 = fromHSV(hue, saturation, 1)
					end

					local function updateFromRGB()
						local r = clampInput(modifierInputs.Red.Text, 0, 255)
						local g = clampInput(modifierInputs.Green.Text, 0, 255)
						local b = clampInput(modifierInputs.Blue.Text, 0, 255)
						modifierInputs.Red.Text = r
						modifierInputs.Green.Text = g
						modifierInputs.Blue.Text = b

						hue, saturation, value = Color3.fromRGB(r, g, b):ToHSV()

						UpdateSlideFromValue(value)
						UpdateRingFromHSV(hue, saturation)
						update()
					end

					local function updateFromHex()
						local hex = modifierInputs.Hex.Text
						local r, g, b = hexToRGB(hex)

						r = clampInput(r, 0, 255)
						g = clampInput(g, 0, 255)
						b = clampInput(b, 0, 255)

						modifierInputs.Red.Text = r
						modifierInputs.Green.Text = g
						modifierInputs.Blue.Text = b

						hue, saturation, value = Color3.fromRGB(r, g, b):ToHSV()
						UpdateSlideFromValue(value)
						UpdateRingFromHSV(hue, saturation)
						update()
					end

					local function updateFromSettings()
						local r = math.floor(ColorpickerFunctions.Color.R * 255 + 0.5)
						local g = math.floor(ColorpickerFunctions.Color.G * 255 + 0.5)
						local b = math.floor(ColorpickerFunctions.Color.B * 255 + 0.5)
						modifierInputs.Red.Text = r
						modifierInputs.Green.Text = g
						modifierInputs.Blue.Text = b
						modifierInputs.Alpha.Text = isAlpha and ColorpickerFunctions.Alpha or 0

						local hexColor = string.format("#%02X%02X%02X", r,g,b)
						modifierInputs.Hex.Text = hexColor

						hue, saturation, value = Color3.fromRGB(r, g, b):ToHSV()

						color1.BackgroundColor3 = ColorpickerFunctions.Color
						color1.BackgroundTransparency = isAlpha and ColorpickerFunctions.Alpha or 0

						colour.BackgroundColor3 = Color3.fromRGB(r,g,b)
						colour.BackgroundTransparency = isAlpha and ColorpickerFunctions.Alpha or 0

						UpdateSlideFromValue(value)
						UpdateRingFromHSV(hue, saturation)
					end

					wheel.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							WheelDown = true
							UpdateRing(Mouse.X, Mouse.Y)
						end
					end)

					slider.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							SlideDown = true
							UpdateSlide(Mouse.X)
						end
					end)

					slider.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							SlideDown = false
						end
					end)

					wheel.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							WheelDown = false
						end
					end)

					UserInputService.InputChanged:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
							if SlideDown then
								UpdateSlide(Mouse.X)
							elseif WheelDown then
								UpdateRing(Mouse.X, Mouse.Y)
							end
						end
					end)

					local function onFocusEnter(instance)
						local placeholder = instance.Text
						instance.Text = ""
						instance.PlaceholderText = placeholder
					end

					modifierInputs.Hex.FocusLost:Connect(updateFromHex)
					modifierInputs.Red.FocusLost:Connect(updateFromRGB)
					modifierInputs.Green.FocusLost:Connect(updateFromRGB)
					modifierInputs.Blue.FocusLost:Connect(updateFromRGB)
					modifierInputs.Alpha.FocusLost:Connect(update)

					modifierInputs.Hex.Focused:Connect(function()
						onFocusEnter(modifierInputs.Hex)
					end)
					modifierInputs.Red.Focused:Connect(function()
						onFocusEnter(modifierInputs.Red)
					end)
					modifierInputs.Green.Focused:Connect(function()
						onFocusEnter(modifierInputs.Green)
					end)
					modifierInputs.Blue.Focused:Connect(function()
						onFocusEnter(modifierInputs.Blue)
					end)
					modifierInputs.Alpha.Focused:Connect(function()
						onFocusEnter(modifierInputs.Alpha)
					end)

					local function makeCanvas()
						local ColorPickerCanvas = Instance.new("CanvasGroup")
						ColorPickerCanvas.Name = "ColorPickerCanvas"
						ColorPickerCanvas.BackgroundTransparency = 1
						ColorPickerCanvas.BorderSizePixel = 0
						ColorPickerCanvas.Size = UDim2.fromScale(1, 1)
						ColorPickerCanvas.ZIndex = 5
						ColorPickerCanvas.GroupTransparency = 1
						ColorPickerCanvas.Parent = base
						ColorPickerCanvas.Visible = false
						return ColorPickerCanvas
					end

					local function transition(isIn)
						local canvas = makeCanvas()
						local tweenTransparency = isIn and 0 or 1
						local tweenScale = isIn and 1 or 0.95
						local stateTransparency = isIn and 1 or 0
						local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Sine)
						local canvasTween = Tween(canvas, tweenInfo, { GroupTransparency = tweenTransparency })
						local scaleTween = Tween(promptUIScale, tweenInfo, { Scale = tweenScale })

						colorPicker.Visible = true
						colorPicker.Parent = canvas
						canvas.Visible = true
						canvas.GroupTransparency = stateTransparency
						canvasTween:Play()
						scaleTween:Play()
						canvasTween.Completed:Wait()

						if not isIn then
							colorPicker.Visible = false
							canvas.Visible = false
						end

						colorPicker.Parent = base
						canvas:Destroy()
					end

					local function colorpickerIn()
						transition(true)
					end

					local function colorpickerOut()
						transition(false)
					end

					interact.MouseButton1Click:Connect(colorpickerIn)

					cancel.MouseButton1Click:Connect(colorpickerOut)
					confirm.MouseButton1Click:Connect(function()
						colorpickerOut()
						local c = fromHSV(hue, saturation, value)
						ColorpickerFunctions.Color = Color3.fromRGB(c.r * 255, c.g * 255, c.b * 255)
						ColorpickerFunctions.Alpha = isAlpha and clampInput(modifierInputs.Alpha.Text, 0, 1)

						color1.BackgroundColor3 = ColorpickerFunctions.Color
						color1.BackgroundTransparency = isAlpha and ColorpickerFunctions.Alpha or 0

						colorC.BackgroundColor3 = ColorpickerFunctions.Color
						colorC.BackgroundTransparency = isAlpha and ColorpickerFunctions.Alpha or 0

						if ColorpickerFunctions.Settings.Callback then
							task.spawn(function()
								ColorpickerFunctions.Settings.Callback(ColorpickerFunctions.Color, isAlpha and ColorpickerFunctions.Alpha)
							end)
						end
					end)

					updateFromSettings()

					function ColorpickerFunctions:UpdateName(New)
						colorpickerName.Text = New
					end
					function ColorpickerFunctions:SetVisibility(State)
						colorpicker.Visible = State
					end

					function ColorpickerFunctions:SetColor(color3)
						ColorpickerFunctions.Color = color3
						colorC.BackgroundColor3 = color3

						local r = math.floor(ColorpickerFunctions.Color.R * 255 + 0.5)
						local g = math.floor(ColorpickerFunctions.Color.G * 255 + 0.5)
						local b = math.floor(ColorpickerFunctions.Color.B * 255 + 0.5)
						modifierInputs.Red.Text = r
						modifierInputs.Green.Text = g
						modifierInputs.Blue.Text = b

						local hexColor = string.format("#%02X%02X%02X", r,g,b)
						modifierInputs.Hex.Text = hexColor

						hue, saturation, value = Color3.fromRGB(r, g, b):ToHSV()

						color1.BackgroundColor3 = ColorpickerFunctions.Color
						colour.BackgroundColor3 = Color3.fromRGB(r,g,b)

						UpdateSlideFromValue(value)
						UpdateRingFromHSV(hue, saturation)

						if ColorpickerFunctions.Settings.Callback then
							task.spawn(function()
								ColorpickerFunctions.Settings.Callback(ColorpickerFunctions.Color, isAlpha and ColorpickerFunctions.Alpha)
							end)
						end
					end

					function ColorpickerFunctions:SetAlpha(alpha)
						ColorpickerFunctions.Alpha = alpha
						colorC.Transparency = alpha
						updateFromSettings()
					end

					if Flag then
						MacLib.Options[Flag] = ColorpickerFunctions
					end
					return ColorpickerFunctions
				end

				function SectionFunctions:Header(Settings, Flag)
					local HeaderFunctions = {Settings = Settings}

					local header = Instance.new("Frame")
					header.Name = "Header"
					header.AutomaticSize = Enum.AutomaticSize.Y
					header.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					header.BackgroundTransparency = 1
					header.BorderColor3 = Color3.fromRGB(0, 0, 0)
					header.BorderSizePixel = 0
					header.LayoutOrder = 0
					header.Size = UDim2.fromScale(1, 0)
					header.Parent = section

					local uIPadding = Instance.new("UIPadding")
					uIPadding.Name = "UIPadding"
					uIPadding.PaddingBottom = UDim.new(0, 5)
					uIPadding.Parent = header

					local headerText = Instance.new("TextLabel")
					headerText.Name = "HeaderText"
					headerText.FontFace = Font.new(
						assets.interFont,
						Enum.FontWeight.Medium,
						Enum.FontStyle.Normal
					)
					headerText.RichText = true
					headerText.Text = HeaderFunctions.Settings.Text or HeaderFunctions.Settings.Name
					headerText.TextColor3 = Color3.fromRGB(255, 255, 255)
					headerText.TextSize = 16
					headerText.TextTransparency = 0.3
					headerText.TextWrapped = true
					headerText.TextXAlignment = Enum.TextXAlignment.Left
					headerText.AutomaticSize = Enum.AutomaticSize.Y
					headerText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					headerText.BackgroundTransparency = 1
					headerText.BorderColor3 = Color3.fromRGB(0, 0, 0)
					headerText.BorderSizePixel = 0
					headerText.Size = UDim2.fromScale(1, 0)
					headerText.Parent = header

					function HeaderFunctions:UpdateName(New)
						headerText.Text = New
					end
					function HeaderFunctions:SetVisibility(State)
						header.Visible = State
					end

					if Flag then
						MacLib.Options[Flag] = HeaderFunctions
					end
					return HeaderFunctions
				end

				function SectionFunctions:Label(Settings, Flag)
					local LabelFunctions = {Settings = Settings}

					local label = Instance.new("Frame")
					label.Name = "Label"
					label.AutomaticSize = Enum.AutomaticSize.Y
					label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					label.BackgroundTransparency = 1
					label.BorderColor3 = Color3.fromRGB(0, 0, 0)
					label.BorderSizePixel = 0
					label.Size = UDim2.new(1, 0, 0, 38)
					label.Parent = section

					local labelText = Instance.new("TextLabel")
					labelText.Name = "LabelText"
					labelText.FontFace = Font.new(assets.interFont)
					labelText.RichText = true
					labelText.Text = LabelFunctions.Settings.Text or LabelFunctions.Settings.Name -- Settings.Name Deprecated use Settings.Text
					labelText.TextColor3 = Color3.fromRGB(255, 255, 255)
					labelText.TextSize = 13
					labelText.TextTransparency = 0.5
					labelText.TextWrapped = true
					labelText.TextXAlignment = Enum.TextXAlignment.Left
					labelText.AutomaticSize = Enum.AutomaticSize.Y
					labelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					labelText.BackgroundTransparency = 1
					labelText.BorderColor3 = Color3.fromRGB(0, 0, 0)
					labelText.BorderSizePixel = 0
					labelText.Size = UDim2.fromScale(1, 1)
					labelText.Parent = label

					function LabelFunctions:UpdateName(New)
						labelText.Text = New
					end
					function LabelFunctions:SetVisibility(State)
						label.Visible = State
					end

					if Flag then
						MacLib.Options[Flag] = LabelFunctions
					end
					return LabelFunctions
				end

				function SectionFunctions:SubLabel(Settings, Flag)
					local SubLabelFunctions = {Settings = Settings}

					local subLabel = Instance.new("Frame")
					subLabel.Name = "SubLabel"
					subLabel.AutomaticSize = Enum.AutomaticSize.Y
					subLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					subLabel.BackgroundTransparency = 1
					subLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
					subLabel.BorderSizePixel = 0
					subLabel.Size = UDim2.new(1, 0, 0, 0)
					subLabel.Parent = section

					local subLabelText = Instance.new("TextLabel")
					subLabelText.Name = "SubLabelText"
					subLabelText.FontFace = Font.new(assets.interFont)
					subLabelText.RichText = true
					subLabelText.Text = SubLabelFunctions.Settings.Text or SubLabelFunctions.Settings.Name -- Settings.Name Deprecated use Settings.Text
					subLabelText.TextColor3 = Color3.fromRGB(255, 255, 255)
					subLabelText.TextSize = 12
					subLabelText.TextTransparency = 0.7
					subLabelText.TextWrapped = true
					subLabelText.TextXAlignment = Enum.TextXAlignment.Left
					subLabelText.AutomaticSize = Enum.AutomaticSize.Y
					subLabelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					subLabelText.BackgroundTransparency = 1
					subLabelText.BorderColor3 = Color3.fromRGB(0, 0, 0)
					subLabelText.BorderSizePixel = 0
					subLabelText.Size = UDim2.fromScale(1, 1)
					subLabelText.Parent = subLabel

					function SubLabelFunctions:UpdateName(New)
						subLabelText.Text = New
					end
					function SubLabelFunctions:SetVisibility(State)
						subLabel.Visible = State
					end

					if Flag then
						MacLib.Options[Flag] = SubLabelFunctions
					end
					return SubLabelFunctions
				end

				function SectionFunctions:Paragraph(Settings, Flag)
					local ParagraphFunctions = {Settings = Settings}

					local paragraph = Instance.new("Frame")
					paragraph.Name = "Paragraph"
					paragraph.AutomaticSize = Enum.AutomaticSize.Y
					paragraph.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					paragraph.BackgroundTransparency = 1
					paragraph.BorderColor3 = Color3.fromRGB(0, 0, 0)
					paragraph.BorderSizePixel = 0
					paragraph.Size = UDim2.new(1, 0, 0, 38)
					paragraph.Parent = section

					local paragraphHeader = Instance.new("TextLabel")
					paragraphHeader.Name = "ParagraphHeader"
					paragraphHeader.FontFace = Font.new(
						assets.interFont,
						Enum.FontWeight.Medium,
						Enum.FontStyle.Normal
					)
					paragraphHeader.RichText = true
					paragraphHeader.Text = ParagraphFunctions.Settings.Header
					paragraphHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
					paragraphHeader.TextSize = 15
					paragraphHeader.TextTransparency = 0.4
					paragraphHeader.TextWrapped = true
					paragraphHeader.TextXAlignment = Enum.TextXAlignment.Left
					paragraphHeader.AutomaticSize = Enum.AutomaticSize.Y
					paragraphHeader.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					paragraphHeader.BackgroundTransparency = 1
					paragraphHeader.BorderColor3 = Color3.fromRGB(0, 0, 0)
					paragraphHeader.BorderSizePixel = 0
					paragraphHeader.Size = UDim2.fromScale(1, 0)
					paragraphHeader.Parent = paragraph

					local uIListLayout = Instance.new("UIListLayout")
					uIListLayout.Name = "UIListLayout"
					uIListLayout.Padding = UDim.new(0, 5)
					uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout.Parent = paragraph

					local paragraphBody = Instance.new("TextLabel")
					paragraphBody.Name = "ParagraphBody"
					paragraphBody.FontFace = Font.new(assets.interFont)
					paragraphBody.RichText = true
					paragraphBody.Text = ParagraphFunctions.Settings.Body
					paragraphBody.TextColor3 = Color3.fromRGB(255, 255, 255)
					paragraphBody.TextSize = 13
					paragraphBody.TextTransparency = 0.5
					paragraphBody.TextWrapped = true
					paragraphBody.TextXAlignment = Enum.TextXAlignment.Left
					paragraphBody.AutomaticSize = Enum.AutomaticSize.Y
					paragraphBody.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					paragraphBody.BackgroundTransparency = 1
					paragraphBody.BorderColor3 = Color3.fromRGB(0, 0, 0)
					paragraphBody.BorderSizePixel = 0
					paragraphBody.LayoutOrder = 1
					paragraphBody.Size = UDim2.fromScale(1, 0)
					paragraphBody.Parent = paragraph

					function ParagraphFunctions:UpdateHeader(New)
						paragraphHeader.Text = New
					end
					function ParagraphFunctions:UpdateBody(New)
						paragraphBody.Text = New
					end
					function ParagraphFunctions:SetVisibility(State)
						paragraph.Visible = State
					end

					if Flag then
						MacLib.Options[Flag] = ParagraphFunctions
					end
					return ParagraphFunctions
				end

				function SectionFunctions:Divider()
					local DividerFunctions = {}

					local divider = Instance.new("Frame")
					divider.Name = "Divider"
					divider.AnchorPoint = Vector2.new(0, 1)
					divider.AutomaticSize = Enum.AutomaticSize.Y
					divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					divider.BackgroundTransparency = 1
					divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
					divider.BorderSizePixel = 0
					divider.Position = UDim2.fromScale(0, 1)
					divider.Size = UDim2.new(1, 0, 0, 1)
					divider.Parent = section

					local uIPadding = Instance.new("UIPadding")
					uIPadding.Name = "UIPadding"
					uIPadding.PaddingBottom = UDim.new(0, 8)
					uIPadding.PaddingTop = UDim.new(0, 8)
					uIPadding.Parent = divider

					local uIListLayout = Instance.new("UIListLayout")
					uIListLayout.Name = "UIListLayout"
					uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout.Parent = divider

					local line = Instance.new("Frame")
					line.Name = "Line"
					line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					line.BackgroundTransparency = 0.9
					line.BorderColor3 = Color3.fromRGB(0, 0, 0)
					line.BorderSizePixel = 0
					line.Size = UDim2.new(1, 0, 0, 1)
					line.Parent = divider

					function DividerFunctions:Remove()
						divider:Destroy()
					end
					function DividerFunctions:SetVisibility(State)
						divider.Visible = State
					end

					return DividerFunctions
				end

				function SectionFunctions:Spacer()
					local SpacerFunctions = {}

					local spacer = Instance.new("Frame")
					spacer.Name = "Spacer"
					spacer.AnchorPoint = Vector2.new(0, 1)
					spacer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					spacer.BackgroundTransparency = 1
					spacer.BorderColor3 = Color3.fromRGB(0, 0, 0)
					spacer.BorderSizePixel = 0
					spacer.Position = UDim2.fromScale(0, 1)
					spacer.Parent = section

					function SpacerFunctions:Remove()
						spacer:Destroy()
					end
					function SpacerFunctions:SetVisibility(State)
						spacer.Visible = State
					end

					return SpacerFunctions
				end

				return SectionFunctions
			end

			local function SelectCurrentTab()
				local easetime = 0.15

				if currentTabInstance then
					currentTabInstance.Parent = nil
				end

				for i, tabInfo in pairs(tabs) do
					Tween(i, TweenInfo.new(easetime, Enum.EasingStyle.Sine), {
						BackgroundTransparency = (i == tabSwitcher and 0.98 or 1)
					}):Play()

					if tabInfo.tabStroke then
						Tween(tabInfo.tabStroke, TweenInfo.new(easetime, Enum.EasingStyle.Sine), {
							Transparency = (i == tabSwitcher and 0.95 or 1)
						}):Play()
					end
					if tabInfo.switcherImage then
						Tween(tabInfo.switcherImage, TweenInfo.new(easetime, Enum.EasingStyle.Sine), {
							ImageTransparency = (i == tabSwitcher and 0.1 or 0.5)
						}):Play()
					end
					if tabInfo.switcherName then
						Tween(tabInfo.switcherName, TweenInfo.new(easetime, Enum.EasingStyle.Sine), {
							TextTransparency = (i == tabSwitcher and 0.1 or 0.5)
						}):Play()
					end
				end

				tabs[tabSwitcher].tabContent.Parent = content
				currentTabInstance = tabs[tabSwitcher].tabContent
				currentTab.Text = Settings.Name
			end

			tabSwitcher.MouseButton1Click:Connect(function()
				SelectCurrentTab()
			end)

			function TabFunctions:Select()
				SelectCurrentTab()
			end

			function TabFunctions:InsertConfigSection(Side)
				local configSection = TabFunctions:Section({ Side = "Left" })

				if isStudio then
					configSection:Label({Text = "Config system unavailable. (Environment isStudio)"})
					return "Config system unavailable." 
				end

				local inputPath = nil
				local selectedConfig = nil

				configSection:Input({
					Name = "Config Name",
					Placeholder = "Name",
					AcceptedCharacters = "All",
					Callback = function(input)
						inputPath = input
					end,
				})

				local configSelection = configSection:Dropdown({
					Name = "Select Config",
					Multi = false,
					Required = false,
					Options = MacLib:RefreshConfigList(),
					Callback = function(Value)
						selectedConfig = Value
					end,
				})

				configSection:Button({
					Name = "Create Config",
					Callback = function()
						if not inputPath or string.gsub(inputPath, " ", "") == "" then
							WindowFunctions:Notify({
								Title = "Interface",
								Description = "Config name cannot be empty."
							})
							return
						end

						local success, returned = MacLib:SaveConfig(inputPath)
						if not success then
							WindowFunctions:Notify({
								Title = "Interface",
								Description = "Unable to save config, return error: " .. returned
							})
						end

						WindowFunctions:Notify({
							Title = "Interface",
							Description = string.format("Created config %q", inputPath),
						})

						configSelection:ClearOptions()
						configSelection:InsertOptions(MacLib:RefreshConfigList())
					end,
				})

				configSection:Button({
					Name = "Load Config",
					Callback = function()
						local success, returned = MacLib:LoadConfig(configSelection.Value)
						if not success then
							WindowFunctions:Notify({
								Title = "Interface",
								Description = "Unable to load config, return error: " .. returned
							})
							return
						end

						WindowFunctions:Notify({
							Title = "Interface",
							Description = string.format("Loaded config %q", configSelection.Value),
						})
					end,
				})

				configSection:Button({
					Name = "Overwrite Config",
					Callback = function()
						local success, returned = MacLib:SaveConfig(configSelection.Value)
						if not success then
							WindowFunctions:Notify({
								Title = "Interface",
								Description = "Unable to overwrite config, return error: " .. returned
							})
							return
						end

						WindowFunctions:Notify({
							Title = "Interface",
							Description = string.format("Overwrote config %q", configSelection.Value),
						})
					end,
				})

				configSection:Button({
					Name = "Refresh Config List",
					Callback = function()
						configSelection:ClearOptions()
						configSelection:InsertOptions(MacLib:RefreshConfigList())
					end,
				})

				local autoloadLabel

				configSection:Button({
					Name = "Set as autoload",
					Callback = function()
						local name = configSelection.Value
						writefile(MacLib.Folder .. "/settings/autoload.txt", name)
						autoloadLabel:UpdateName("Autoload config: " .. name)
						WindowFunctions:Notify({
							Title = "Interface",
							Description = string.format("Set %q as autoload", name),
						})
					end,
				})

				autoloadLabel = configSection:Label({Text = "Autoload config: None"})

				if isfile(MacLib.Folder .. "/settings/autoload.txt") then
					local name = readfile(MacLib.Folder .. "/settings/autoload.txt")
					autoloadLabel:UpdateName("Autoload config: " .. name)
				end
			end

			tabs[tabSwitcher] = {
				tabContent = elements1,
				tabStroke = tabSwitcherUIStroke,
				switcherImage = tabImage,
				switcherName = tabSwitcherName,
			}

			return TabFunctions
		end

		return SectionFunctions
	end

	local function elevateThreadIdentity()
		if setthreadidentity then
			pcall(setthreadidentity, 7)
		elseif set_thread_identity then
			pcall(set_thread_identity, 7)
		elseif setidentity then
			pcall(setidentity, 7)
		elseif syn and syn.set_thread_identity then
			pcall(syn.set_thread_identity, 7)
		end
	end

	function WindowFunctions:Notify(Settings)
		elevateThreadIdentity()

		local NotificationFunctions = {}
		local buildSuccess, buildErr = pcall(function()
			local notification = Instance.new("Frame")
			notification.Name = "Notification"
			notification.AnchorPoint = Vector2.new(0.5, 0.5)
			notification.AutomaticSize = Enum.AutomaticSize.Y
			notification.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
			notification.BorderColor3 = Color3.fromRGB(0, 0, 0)
			notification.BorderSizePixel = 0
			notification.Position = UDim2.fromScale(0.5, 0.5)
			notification.Size = UDim2.fromOffset(Settings.SizeX or 250, 0)

			notification.Parent = notifications

			local notificationUIStroke = Instance.new("UIStroke")
			notificationUIStroke.Name = "NotificationUIStroke"
			notificationUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			notificationUIStroke.Color = Color3.fromRGB(255, 255, 255)
			notificationUIStroke.Transparency = 0.9
			notificationUIStroke.Parent = notification

			local notificationUICorner = Instance.new("UICorner")
			notificationUICorner.Name = "NotificationUICorner"
			notificationUICorner.CornerRadius = UDim.new(0, 10)
			notificationUICorner.Parent = notification

			local notificationUIScale = Instance.new("UIScale")
			notificationUIScale.Name = "NotificationUIScale"
			notificationUIScale.Parent = notification
			notificationUIScale.Scale = 0

			local notificationInformation = Instance.new("Frame")
			notificationInformation.Name = "NotificationInformation"
			notificationInformation.AutomaticSize = Enum.AutomaticSize.Y
			notificationInformation.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			notificationInformation.BackgroundTransparency = 1
			notificationInformation.BorderColor3 = Color3.fromRGB(0, 0, 0)
			notificationInformation.BorderSizePixel = 0
			notificationInformation.Size = UDim2.fromScale(1, 1)

			local notificationTitle = Instance.new("TextLabel")
			notificationTitle.Name = "NotificationTitle"
			notificationTitle.FontFace = Font.new(
				assets.interFont,
				Enum.FontWeight.SemiBold,
				Enum.FontStyle.Normal
			)
			notificationTitle.RichText = true
			notificationTitle.Text = Settings.Title
			notificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			notificationTitle.TextSize = 13
			notificationTitle.TextTransparency = 0.2
			notificationTitle.TextTruncate = Enum.TextTruncate.SplitWord
			notificationTitle.TextXAlignment = Enum.TextXAlignment.Left
			notificationTitle.TextYAlignment = Enum.TextYAlignment.Top
			notificationTitle.AutomaticSize = Enum.AutomaticSize.XY
			notificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			notificationTitle.BackgroundTransparency = 1
			notificationTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			notificationTitle.BorderSizePixel = 0
			notificationTitle.Size = UDim2.new(1, -12, 0, 0)

			local notificationTitleUIPadding = Instance.new("UIPadding")
			notificationTitleUIPadding.Name = "NotificationTitleUIPadding"
			notificationTitleUIPadding.PaddingRight = UDim.new(0, 25)
			notificationTitleUIPadding.Parent = notificationTitle

			notificationTitle.Parent = notificationInformation

			local notificationDescription = Instance.new("TextLabel")
			notificationDescription.Name = "NotificationDescription"
			notificationDescription.FontFace = Font.new(
				assets.interFont,
				Enum.FontWeight.Medium,
				Enum.FontStyle.Normal
			)
			notificationDescription.Text = Settings.Description
			notificationDescription.TextColor3 = Color3.fromRGB(255, 255, 255)
			notificationDescription.TextSize = 11
			notificationDescription.TextTransparency = 0.5
			notificationDescription.TextWrapped = true
			notificationDescription.RichText = true
			notificationDescription.TextXAlignment = Enum.TextXAlignment.Left
			notificationDescription.TextYAlignment = Enum.TextYAlignment.Top
			notificationDescription.AutomaticSize = Enum.AutomaticSize.XY
			notificationDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			notificationDescription.BackgroundTransparency = 1
			notificationDescription.BorderColor3 = Color3.fromRGB(0, 0, 0)
			notificationDescription.BorderSizePixel = 0
			notificationDescription.Size = UDim2.new(1, -12, 0, 0)

			local notificationDescriptionUIPadding = Instance.new("UIPadding")
			notificationDescriptionUIPadding.Name = "NotificationDescriptionUIPadding"
			notificationDescriptionUIPadding.PaddingRight = UDim.new(0, 25)
			notificationDescriptionUIPadding.PaddingTop = UDim.new(0, 17)
			notificationDescriptionUIPadding.Parent = notificationDescription

			notificationDescription.Parent = notificationInformation

			local notificationUIPadding = Instance.new("UIPadding")
			notificationUIPadding.Name = "NotificationUIPadding"
			notificationUIPadding.PaddingBottom = UDim.new(0, 12)
			notificationUIPadding.PaddingLeft = UDim.new(0, 10)
			notificationUIPadding.PaddingRight = UDim.new(0, 10)
			notificationUIPadding.PaddingTop = UDim.new(0, 10)
			notificationUIPadding.Parent = notificationInformation

			notificationInformation.Parent = notification

			local notificationControls = Instance.new("Frame")
			notificationControls.Name = "NotificationControls"
			notificationControls.AutomaticSize = Enum.AutomaticSize.Y
			notificationControls.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			notificationControls.BackgroundTransparency = 1
			notificationControls.BorderColor3 = Color3.fromRGB(0, 0, 0)
			notificationControls.BorderSizePixel = 0
			notificationControls.Size = UDim2.fromScale(1, 1)

			local interactable = Instance.new("TextButton")
			interactable.Name = "Interactable"
			interactable.FontFace = Font.new(assets.interFont)
			interactable.Text = "✓"
			interactable.TextColor3 = Color3.fromRGB(255, 255, 255)
			interactable.TextSize = 17
			interactable.TextTransparency = 0.2
			interactable.AnchorPoint = Vector2.new(1, 0.5)
			interactable.AutomaticSize = Enum.AutomaticSize.XY
			interactable.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			interactable.BackgroundTransparency = 1
			interactable.BorderColor3 = Color3.fromRGB(0, 0, 0)
			interactable.BorderSizePixel = 0
			interactable.LayoutOrder = 1
			interactable.Position = UDim2.fromScale(1, 0.5)
			interactable.Parent = notificationControls

			local uIPadding = Instance.new("UIPadding")
			uIPadding.Name = "UIPadding"
			uIPadding.PaddingBottom = UDim.new(0, 6)
			uIPadding.PaddingRight = UDim.new(0, 13)
			uIPadding.PaddingTop = UDim.new(0, 6)
			uIPadding.Parent = notificationControls

			notificationControls.Parent = notification

			local tweens = {
				In = Tween(notificationUIScale, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
					Scale = Settings.Scale or 1
				}),
				Out = Tween(notificationUIScale, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
					Scale = 0
				}),
			}

			local styles = {
				None = function() interactable:Destroy() end,
				Confirm = function() interactable.Text = "✓" end,
				Cancel = function() interactable.Text = "✗" end
			}

			local style = styles[Settings.Style] or function() interactable:Destroy() end
			style()

			if interactable then
				interactable.MouseButton1Click:Connect(function()
					NotificationFunctions:Cancel()
					if Settings.Callback then
						task.spawn(Settings.Callback)
					end
				end)
			end

			local AnimateNotification = task.spawn(function()
				elevateThreadIdentity()
				tweens.In:Play()

				Settings.Lifetime = Settings.Lifetime or 3

				if Settings.Lifetime ~= 0 then
					task.wait(Settings.Lifetime)

					local out = tweens.Out
					out:Play()
					out.Completed:Wait()
					elevateThreadIdentity()
					pcall(function() notification:Destroy() end)
				end
			end)

			function NotificationFunctions:UpdateTitle(New)
				notificationTitle.Text = New
			end

			function NotificationFunctions:UpdateDescription(New)
				notificationDescription.Text = New
			end

			function NotificationFunctions:Resize(X)
				local targ = X or 250
				notification.Size = UDim2.fromOffset(targ, 0)
			end

			function NotificationFunctions:Cancel()
				elevateThreadIdentity()
				task.cancel(AnimateNotification)

				local out = tweens.Out
				out:Play()
				out.Completed:Wait()
				pcall(function() notification:Destroy() end)
			end
		end)

		if not buildSuccess then
			pcall(function()
				local StarterGui = MacLib.GetService("StarterGui") or game:GetService("StarterGui")
				StarterGui:SetCore("SendNotification", {
					Title = Settings.Title or "Interface",
					Text = Settings.Description or "",
					Duration = Settings.Lifetime or 3,
				})
			end)
			return {
				UpdateTitle = function() end,
				UpdateDescription = function() end,
				Resize = function() end,
				Cancel = function() end,
			}
		end

		return NotificationFunctions
	end

	function WindowFunctions:Dialog(Settings)
		local DialogFunctions = {}

		local dialogCanvas = Instance.new("CanvasGroup")
		dialogCanvas.Name = "DialogCanvas"
		dialogCanvas.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		dialogCanvas.BackgroundTransparency = 1
		dialogCanvas.BorderColor3 = Color3.fromRGB(0, 0, 0)
		dialogCanvas.BorderSizePixel = 0
		dialogCanvas.Size = UDim2.fromScale(1, 1)
		dialogCanvas.GroupTransparency = 1
		dialogCanvas.Parent = base

		local dialog = Instance.new("Frame")
		dialog.Name = "Dialog"
		dialog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		dialog.BackgroundTransparency = 0.5
		dialog.BorderColor3 = Color3.fromRGB(0, 0, 0)
		dialog.BorderSizePixel = 0
		dialog.Size = UDim2.fromScale(1, 1)

		local dialogUICorner = Instance.new("UICorner")
		dialogUICorner.Name = "BaseUICorner"
		dialogUICorner.CornerRadius = UDim.new(0, 10)
		dialogUICorner.Parent = dialog

		local prompt = Instance.new("Frame")
		prompt.Name = "Prompt"
		prompt.AnchorPoint = Vector2.new(0.5, 0.5)
		prompt.AutomaticSize = Enum.AutomaticSize.Y
		prompt.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		prompt.BorderColor3 = Color3.fromRGB(0, 0, 0)
		prompt.BorderSizePixel = 0
		prompt.Position = UDim2.fromScale(0.5, 0.5)
		prompt.Size = UDim2.fromOffset(280, 0)

		local promptUIScale = Instance.new("UIScale")
		promptUIScale.Name = "BaseUIScale"
		promptUIScale.Parent = prompt
		promptUIScale.Scale = 0.95

		local globalSettingsUIStroke = Instance.new("UIStroke")
		globalSettingsUIStroke.Name = "GlobalSettingsUIStroke"
		globalSettingsUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		globalSettingsUIStroke.Color = Color3.fromRGB(255, 255, 255)
		globalSettingsUIStroke.Transparency = 0.9
		globalSettingsUIStroke.Parent = prompt

		local globalSettingsUICorner = Instance.new("UICorner")
		globalSettingsUICorner.Name = "GlobalSettingsUICorner"
		globalSettingsUICorner.CornerRadius = UDim.new(0, 10)
		globalSettingsUICorner.Parent = prompt

		local globalSettingsUIPadding = Instance.new("UIPadding")
		globalSettingsUIPadding.Name = "GlobalSettingsUIPadding"
		globalSettingsUIPadding.PaddingBottom = UDim.new(0, 20)
		globalSettingsUIPadding.PaddingLeft = UDim.new(0, 20)
		globalSettingsUIPadding.PaddingRight = UDim.new(0, 20)
		globalSettingsUIPadding.PaddingTop = UDim.new(0, 20)
		globalSettingsUIPadding.Parent = prompt

		local paragraph = Instance.new("Frame")
		paragraph.Name = "Paragraph"
		paragraph.AutomaticSize = Enum.AutomaticSize.Y
		paragraph.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		paragraph.BackgroundTransparency = 1
		paragraph.BorderColor3 = Color3.fromRGB(0, 0, 0)
		paragraph.BorderSizePixel = 0
		paragraph.Size = UDim2.new(1, 0, 0, 38)

		local paragraphHeader = Instance.new("TextLabel")
		paragraphHeader.Name = "ParagraphHeader"
		paragraphHeader.FontFace = Font.new(
			assets.interFont,
			Enum.FontWeight.Medium,
			Enum.FontStyle.Normal
		)
		paragraphHeader.RichText = true
		paragraphHeader.Text = Settings.Title
		paragraphHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
		paragraphHeader.TextSize = 18
		paragraphHeader.TextTransparency = 0.4
		paragraphHeader.TextWrapped = true
		paragraphHeader.AutomaticSize = Enum.AutomaticSize.Y
		paragraphHeader.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		paragraphHeader.BackgroundTransparency = 1
		paragraphHeader.BorderColor3 = Color3.fromRGB(0, 0, 0)
		paragraphHeader.BorderSizePixel = 0
		paragraphHeader.Size = UDim2.fromScale(1, 0)
		paragraphHeader.Parent = paragraph

		local uIListLayout = Instance.new("UIListLayout")
		uIListLayout.Name = "UIListLayout"
		uIListLayout.Padding = UDim.new(0, 15)
		uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uIListLayout.Parent = paragraph

		local paragraphBody = Instance.new("TextLabel")
		paragraphBody.Name = "ParagraphBody"
		paragraphBody.FontFace = Font.new(assets.interFont)
		paragraphBody.RichText = true
		paragraphBody.Text = Settings.Description
		paragraphBody.TextColor3 = Color3.fromRGB(255, 255, 255)
		paragraphBody.TextSize = 14
		paragraphBody.TextTransparency = 0.5
		paragraphBody.TextWrapped = true
		paragraphBody.AutomaticSize = Enum.AutomaticSize.Y
		paragraphBody.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		paragraphBody.BackgroundTransparency = 1
		paragraphBody.BorderColor3 = Color3.fromRGB(0, 0, 0)
		paragraphBody.BorderSizePixel = 0
		paragraphBody.LayoutOrder = 1
		paragraphBody.Size = UDim2.fromScale(1, 0)
		paragraphBody.Parent = paragraph

		paragraph.Parent = prompt

		local interactions = Instance.new("Frame")
		interactions.Name = "Interactions"
		interactions.AutomaticSize = Enum.AutomaticSize.Y
		interactions.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		interactions.BackgroundTransparency = 1
		interactions.BorderColor3 = Color3.fromRGB(0, 0, 0)
		interactions.BorderSizePixel = 0
		interactions.LayoutOrder = 1
		interactions.Size = UDim2.fromScale(1, 0)

		local uIListLayout1 = Instance.new("UIListLayout")
		uIListLayout1.Name = "UIListLayout"
		uIListLayout1.Padding = UDim.new(0, 10)
		uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
		uIListLayout1.Parent = interactions

		local uIPadding = Instance.new("UIPadding")
		uIPadding.Name = "UIPadding"
		uIPadding.PaddingTop = UDim.new(0, 20)
		uIPadding.Parent = interactions

		interactions.Parent = prompt

		local uIListLayout2 = Instance.new("UIListLayout")
		uIListLayout2.Name = "UIListLayout"
		uIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
		uIListLayout2.Parent = prompt

		prompt.Parent = dialog

		dialog.Parent = dialogCanvas

		local canvasIn = Tween(dialogCanvas, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { GroupTransparency = 0 })
		local canvasOut = Tween(dialogCanvas, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { GroupTransparency = 1 })

		local scaleIn = Tween(promptUIScale, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { Scale = 1 })
		local scaleOut = Tween(promptUIScale, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { Scale = 0.95 })

		local function dialogIn()
			canvasIn:Play()
			scaleIn:Play()
			canvasIn.Completed:Wait()
			dialog.Parent = base
		end

		local function dialogOut()
			if not dialog.Parent then return end
			dialog.Parent = dialogCanvas
			canvasOut:Play()
			scaleOut:Play()
			canvasOut.Completed:Wait()
			dialogCanvas:Destroy()
		end

		for _, v in pairs(Settings.Buttons) do
			local button = Instance.new("TextButton")
			button.Name = "Button"
			button.FontFace = Font.new(assets.interFont)
			button.Text = v.Name
			button.TextColor3 = Color3.fromRGB(255, 255, 255)
			button.TextSize = 15
			button.TextTransparency = 0.5
			button.TextTruncate = Enum.TextTruncate.AtEnd
			button.AutoButtonColor = false
			button.AutomaticSize = Enum.AutomaticSize.Y
			button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button.BorderSizePixel = 0
			button.Size = UDim2.fromScale(1, 0)

			local uIPadding1 = Instance.new("UIPadding")
			uIPadding1.Name = "UIPadding"
			uIPadding1.PaddingBottom = UDim.new(0, 9)
			uIPadding1.PaddingLeft = UDim.new(0, 10)
			uIPadding1.PaddingRight = UDim.new(0, 10)
			uIPadding1.PaddingTop = UDim.new(0, 9)
			uIPadding1.Parent = button

			local baseUICorner1 = Instance.new("UICorner")
			baseUICorner1.Name = "BaseUICorner"
			baseUICorner1.CornerRadius = UDim.new(0, 10)
			baseUICorner1.Parent = button

			button.Parent = interactions

			local TweenSettings = {
				DefaultTransparency = 0,
				DefaultTransparency2 = 0.5,
				HoverTransparency = 0.3,
				HoverTransparency2 = 0.6,

				EasingStyle = Enum.EasingStyle.Sine
			}

			local function ChangeState(State)
				if State == "Idle" then
					Tween(button, TweenInfo.new(0.2, TweenSettings.EasingStyle), {
						BackgroundTransparency = TweenSettings.DefaultTransparency,
						TextTransparency = TweenSettings.DefaultTransparency2
					}):Play()
				elseif State == "Hover" then
					Tween(button, TweenInfo.new(0.2, TweenSettings.EasingStyle), {
						BackgroundTransparency = TweenSettings.HoverTransparency,
						TextTransparency = TweenSettings.HoverTransparency2
					}):Play()
				end
			end

			button.MouseButton1Click:Connect(function()
				if dialogCanvas.GroupTransparency ~= 0 then return end
				local ok, err = pcall(function()
					if v.Callback then
						v.Callback()
					end
				end)

				dialogOut()

				if not ok then
					warn("[Dialog] Button callback error: " .. tostring(err))
				end
			end)

			button.MouseEnter:Connect(function()
				ChangeState("Hover")
			end)
			button.MouseLeave:Connect(function()
				ChangeState("Idle")
			end)
		end

		dialogIn()

		function DialogFunctions:UpdateTitle(New)
			paragraphHeader.Text = New
		end
		function DialogFunctions:UpdateDescription(New)
			paragraphBody.Text = New
		end

		function DialogFunctions:Cancel()
			dialogOut()
		end

		return DialogFunctions
	end

	function WindowFunctions:SetNotificationsState(State)
		notifications.Visible = State
	end

	function WindowFunctions:GetNotificationsState(State)
		return notifications.Visible
	end

	function WindowFunctions:SetState(State)
		windowState = State
		base.Visible = State
	end

	function WindowFunctions:GetState()
		return windowState
	end

	local onUnloadCallback

	function WindowFunctions:Unload()
		if onUnloadCallback then
			onUnloadCallback()  
		end
		macLib:Destroy()
		unloaded = true
	end

	function WindowFunctions.onUnloaded(callback)
		onUnloadCallback = callback
	end

	local MenuKeybind = Settings.Keybind or Enum.KeyCode.RightControl

	local function ToggleMenu()
		local state = not WindowFunctions:GetState()
		WindowFunctions:SetState(state)
		WindowFunctions:Notify({
			Title = Settings.Title,
			Description = (state and "Maximized " or "Minimized ") .. "the menu. Use " .. tostring(MenuKeybind.Name) .. " to toggle it.",
			Lifetime = 5
		})
	end

	UserInputService.InputEnded:Connect(function(inp, gpe)
		if gpe then return end
		if inp.KeyCode == MenuKeybind then
			ToggleMenu()
		end
	end)

	minimize.MouseButton1Click:Connect(ToggleMenu)
	exit.MouseButton1Click:Connect(function()
		WindowFunctions:Dialog({
			Title = Settings.Title,
			Description = "Are you sure you want to exit the menu? You will lose any unsaved configurations.",
			Buttons = {
				{
					Name = "Confirm",
					Callback = function()
						WindowFunctions:Unload()
					end,
				},
				{
					Name = "Cancel"
				}
			}
		})
	end)

	function WindowFunctions:SetKeybind(Keycode)
		MenuKeybind = Keycode
	end

	function WindowFunctions:SetAcrylicBlurState(State)
		acrylicBlur = State
		base.BackgroundTransparency = State and 0.05 or 0
	end

	function WindowFunctions:GetAcrylicBlurState()
		return acrylicBlur
	end

	local function _SetUserInfoState(State)
		if State then
			headshot.Image = (isReady and headshotImage) or "rbxassetid://0"
			username.Text = "@" .. LocalPlayer.Name
			displayName.Text = LocalPlayer.DisplayName
		else
			headshot.Image = assets.userInfoBlurred
			local nameLength = #LocalPlayer.Name
			local displayNameLength = #LocalPlayer.DisplayName
			username.Text = "@" .. string.rep(".", nameLength)
			displayName.Text = string.rep(".", displayNameLength)
		end
	end

	local showUserInfo
	if Settings.ShowUserInfo ~= nil then
		showUserInfo = Settings.ShowUserInfo
	else
		showUserInfo = true
	end

	_SetUserInfoState(showUserInfo)

	function WindowFunctions:SetUserInfoState(State)
		_SetUserInfoState(State)
	end
	function WindowFunctions:GetUserInfoState(State)
		return showUserInfo
	end

	function WindowFunctions:SetSize(Size)
		base.Size = Size
	end
	function WindowFunctions:GetSize(Size)
		return base.Size
	end

	function WindowFunctions:SetScale(Scale)
		baseUIScale.Scale = Scale
	end
	function WindowFunctions:GetScale()
		return baseUIScale.Scale
	end

	local ClassParser = {
		["Toggle"] = {
			Save = function(Flag, data)
				return {
					type = "Toggle", 
					flag = Flag, 
					state = data.State or false
				}
			end,
			Load = function(Flag, data)
				elevateThreadIdentity()
				if MacLib.Options[Flag] and data.state ~= nil then
					MacLib.Options[Flag]:UpdateState(data.state)
				end
			end
		},
		["Slider"] = {
			Save = function(Flag, data)
				return {
					type = "Slider", 
					flag = Flag, 
					value = (data.Value and tostring(data.Value)) or false
				}
			end,
			Load = function(Flag, data)
				elevateThreadIdentity()
				if MacLib.Options[Flag] and data.value ~= nil and data.value ~= false then
					MacLib.Options[Flag]:UpdateValue(data.value)
				end
			end
		},
		["Input"] = {
			Save = function(Flag, data)
				return {
					type = "Input", 
					flag = Flag, 
					text = data.Text
				}
			end,
			Load = function(Flag, data)
				elevateThreadIdentity()
				if MacLib.Options[Flag] and data.text and type(data.text) == "string" then
					MacLib.Options[Flag]:UpdateText(data.text)
				end
			end
		},
		["Keybind"] = {
			Save = function(Flag, data)
				return {
					type = "Keybind", 
					flag = Flag, 
					bind = (typeof(data.Bind) == "EnumItem" and data.Bind.Name) or nil
				}
			end,
			Load = function(Flag, data)
				elevateThreadIdentity()
				if MacLib.Options[Flag] and data.bind then
					MacLib.Options[Flag]:Bind(Enum.KeyCode[data.bind])
				end
			end
		},
		["Dropdown"] = {
			Save = function(Flag, data)
				return {
					type = "Dropdown", 
					flag = Flag, 
					value = data.Value
				}
			end,
			Load = function(Flag, data)
				elevateThreadIdentity()
				if MacLib.Options[Flag] and data.value then
					MacLib.Options[Flag]:UpdateSelection(data.value)
				end
			end
		},
		["Colorpicker"] = {
			Save = function(Flag, data)
				local function Color3ToHex(color)
					return string.format("#%02X%02X%02X", math.floor(color.R * 255), math.floor(color.G * 255), math.floor(color.B * 255))
				end

				return {
					type = "Colorpicker", 
					flag = Flag, 
					color = Color3ToHex(data.Color) or nil,
					alpha = data.Alpha
				}
			end,
			Load = function(Flag, data)
				elevateThreadIdentity()
				local function HexToColor3(hex)
					local r = tonumber(hex:sub(2, 3), 16) / 255
					local g = tonumber(hex:sub(4, 5), 16) / 255
					local b = tonumber(hex:sub(6, 7), 16) / 255
					return Color3.new(r, g, b)
				end

				if MacLib.Options[Flag] and data.color then
					MacLib.Options[Flag]:SetColor(HexToColor3(data.color)) 
					if data.alpha then
						MacLib.Options[Flag]:SetAlpha(data.alpha)
					end
				end
			end
		}
	}

	local function BuildFolderTree()
		if isStudio or not (isfolder and makefolder) then return "Config system unavailable." end

		local paths = {
			MacLib.Folder,
			MacLib.Folder .. "/settings"
		}

		for i = 1, #paths do
			local str = paths[i]
			if not isfolder(str) then
				makefolder(str)
			end
		end
	end

	function MacLib:LoadAutoLoadConfig()
		elevateThreadIdentity()
		if isStudio or not (isfile and readfile) then return "Config system unavailable." end

		local autoloadPath = MacLib.Folder .. "/settings/autoload.txt"
		local name = nil

		if isfile(autoloadPath) then
			local ok, content = pcall(readfile, autoloadPath)
			if ok and type(content) == "string" then
				content = string.gsub(content, "[\r\n%s]+", "")
				if #content > 0 then
					name = content
				end
			end
		end

		-- Fallback: nếu autoload.txt chưa tồn tại hoặc rỗng, thử nạp Default.json
		if not name then
			local defaultFile = MacLib.Folder .. "/settings/Default.json"
			if isfile(defaultFile) then
				name = "Default"
				if writefile then
					pcall(writefile, autoloadPath, "Default")
				end
			end
		end

		if not name then
			print("[MacLib] Không tìm thấy autoload config nào trong " .. autoloadPath)
			return
		end

		print(string.format("[MacLib] Khởi động nạp autoload config: %q", name))
		local suc, err = MacLib:LoadConfig(name)
		if not suc then
			pcall(function()
				WindowFunctions:Notify({
					Title = "Interface",
					Description = "Error loading autoload config: " .. tostring(err)
				})
			end)
			warn(string.format("[MacLib] Lỗi khi nạp autoload config %q: %s", name, tostring(err)))
			return
		end

		print(string.format("[MacLib] Nạp autoload config thành công: %q", name))
		pcall(function()
			WindowFunctions:Notify({
				Title = "Interface",
				Description = string.format("Autoloaded config: %q", name),
			})
		end)
	end

	function MacLib:SetFolder(Folder)
		if isStudio then return "Config system unavailable." end

		MacLib.Folder = Folder;
		BuildFolderTree()
	end

	function MacLib:SaveConfig(Path)
		if isStudio or not writefile then return "Config system unavailable." end

		if (not Path) then
			return false, "Please select a config file."
		end

		local fullPath = MacLib.Folder .. "/settings/" .. Path .. ".json"

		local data = {
			objects = {},
			contextData = MacLib.contextData or {},
		}

		for flag, option in next, MacLib.Options do
			if not ClassParser[option.Class] then continue end
			if option.IgnoreConfig then continue end

			table.insert(data.objects, ClassParser[option.Class].Save(flag, option))
		end	

		local success, encoded = pcall(HttpService.JSONEncode, HttpService, data)
		if not success then
			return false, "Unable to encode into JSON data"
		end

		writefile(fullPath, encoded)
		return true
	end

	function MacLib:LoadConfig(Path)
		elevateThreadIdentity()
		if isStudio or not (isfile and readfile) then return "Config system unavailable." end

		if (not Path) then
			return false, "Please select a config file."
		end

		Path = string.gsub(tostring(Path), "[\r\n%s]+", "")
		if #Path == 0 then
			return false, "Please select a config file."
		end

		local file = MacLib.Folder .. "/settings/" .. Path .. ".json"
		if not isfile(file) then return false, "Invalid file: " .. tostring(file) end

		local success, decoded = pcall(HttpService.JSONDecode, HttpService, readfile(file))
		if not success or type(decoded) ~= "table" then return false, "Unable to decode JSON data." end

		MacLib.LoadingConfig = true
		MacLib.contextData = decoded.contextData or {}

		local objects = decoded.objects or {}
		local loadedCount = 0
		for _, option in next, objects do
			if option and option.type and ClassParser[option.type] then
				local ok, err = pcall(function() 
					ClassParser[option.type].Load(option.flag, option) 
				end)
				if ok then
					loadedCount = loadedCount + 1
				else
					warn(string.format("[MacLib:LoadConfig] Lỗi khi nạp option %s (%s): %s", tostring(option.flag), tostring(option.type), tostring(err)))
				end
			end
		end

		print(string.format("[MacLib:LoadConfig] Đã nạp config %q (%d/%d options thành công)", Path, loadedCount, #objects))

		task.delay(1, function()
			MacLib.LoadingConfig = false
		end)

		return true
	end

	function MacLib:RefreshConfigList()
		if isStudio or not (isfolder and listfiles) then return "Config system unavailable." end

		local list = (isfolder(MacLib.Folder) and isfolder(MacLib.Folder .. "/settings")) and listfiles(MacLib.Folder .. "/settings") or {}

		local out = {}
		for i = 1, #list do
			local file = list[i]
			if file:sub(-5) == ".json" then
				local pos = file:find(".json", 1, true)
				local start = pos

				local char = file:sub(pos, pos)
				while char ~= "/" and char ~= "\\" and char ~= "" do
					pos = pos - 1
					char = file:sub(pos, pos)
				end

				if char == "/" or char == "\\" then
					local name = file:sub(pos + 1, start - 1)
					if name ~= "options" then
						table.insert(out, name)
					end
				end
			end
		end

		return out
	end

	macLib.Enabled = false

	local assetList = {}
	for _, assetId in pairs(assets) do
		table.insert(assetList, assetId)
	end

	ContentProvider:PreloadAsync(assetList)
	macLib.Enabled = true
	windowState = true

	return WindowFunctions
end

function MacLib:Demo()
	local Window = MacLib:Window({
		Title = "Maclib Demo",
		Subtitle = "This is a subtitle.",
		Size = UDim2.fromOffset(868, 650),
		DragStyle = 1,
		DisabledWindowControls = {},
		ShowUserInfo = true,
		Keybind = Enum.KeyCode.RightControl,
		AcrylicBlur = true,
	})

	local globalSettings = {
		UIBlurToggle = Window:GlobalSetting({
			Name = "UI Blur",
			Default = Window:GetAcrylicBlurState(),
			Callback = function(bool)
				Window:SetAcrylicBlurState(bool)
				Window:Notify({
					Title = Window.Settings.Title,
					Description = (bool and "Enabled" or "Disabled") .. " UI Blur",
					Lifetime = 5
				})
			end,
		}),
		NotificationToggler = Window:GlobalSetting({
			Name = "Notifications",
			Default = Window:GetNotificationsState(),
			Callback = function(bool)
				Window:SetNotificationsState(bool)
				Window:Notify({
					Title = Window.Settings.Title,
					Description = (bool and "Enabled" or "Disabled") .. " Notifications",
					Lifetime = 5
				})
			end,
		}),
		ShowUserInfo = Window:GlobalSetting({
			Name = "Show User Info",
			Default = Window:GetUserInfoState(),
			Callback = function(bool)
				Window:SetUserInfoState(bool)
				Window:Notify({
					Title = Window.Settings.Title,
					Description = (bool and "Showing" or "Redacted") .. " User Info",
					Lifetime = 5
				})
			end,
		})
	}

	local tabGroups = {
		TabGroup1 = Window:TabGroup()
	}

	local tabs = {
		Main = tabGroups.TabGroup1:Tab({ Name = "Demo", Image = "rbxassetid://18821914323" }),
		Settings = tabGroups.TabGroup1:Tab({ Name = "Settings", Image = "rbxassetid://10734950309" })
	}

	local sections = {
		MainSection1 = tabs.Main:Section({ Side = "Left" }),
	}

	sections.MainSection1:Header({
		Name = "Header #1"
	})

	sections.MainSection1:Button({
		Name = "Button",
		Callback = function()
			Window:Dialog({
				Title = Window.Settings.Title,
				Description = "Lorem ipsum odor amet, consectetuer adipiscing elit. Eros vestibulum aliquet mattis, ex platea nunc.",
				Buttons = {
					{
						Name = "Confirm",
						Callback = function()
							print("Confirmed!")
						end,
					},
					{
						Name = "Cancel"
					}
				}
			})
		end,
	})

	sections.MainSection1:Input({
		Name = "Input",
		Placeholder = "Input",
		AcceptedCharacters = "All",
		Callback = function(input)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = "Successfully set input to " .. input
			})
		end,
		onChanged = function(input)
			print("Input is now " .. input)
		end,
	}, "Input")

	sections.MainSection1:Slider({
		Name = "Slider",
		Default = 50,
		Minimum = 0,
		Maximum = 100,
		DisplayMethod = "Percent",
		Precision = 0,
		Callback = function(Value)
			print("Changed to ".. Value)
		end
	}, "Slider")

	sections.MainSection1:Toggle({
		Name = "Toggle",
		Default = false,
		Callback = function(value)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = (value and "Enabled " or "Disabled ") .. "Toggle"
			})
		end,
	}, "Toggle")

	sections.MainSection1:Keybind({
		Name = "Keybind",
		Blacklist = false,
		Callback = function(binded)
			Window:Notify({
				Title = "Demo Window",
				Description = "Pressed keybind - "..tostring(binded.Name),
				Lifetime = 3
			})
		end,
		onBinded = function(bind)
			Window:Notify({
				Title = "Demo Window",
				Description = "Successfully Binded Keybind to - "..tostring(bind.Name),
				Lifetime = 3
			})
		end,
	}, "Keybind")

	sections.MainSection1:Colorpicker({
		Name = "Colorpicker",
		Default = Color3.fromRGB(0, 255, 255),
		Callback = function(color)
			print("Color: ", color)
		end,
	}, "Colorpicker")

	local alphaColorPicker = sections.MainSection1:Colorpicker({
		Name = "Transparency Colorpicker",
		Default = Color3.fromRGB(255,0,0),
		Alpha = 0,
		Callback = function(color, alpha)
			print("Color: ", color, " Alpha: ", alpha)
		end,
	}, "TransparencyColorpicker")

	local rainbowActive
	local rainbowConnection
	local hue = 0

	sections.MainSection1:Toggle({
		Name = "Rainbow",
		Default = false,
		Callback = function(value)
			rainbowActive = value

			if rainbowActive then
				rainbowConnection = game:GetService("RunService").RenderStepped:Connect(function(deltaTime)
					hue = (hue + deltaTime * 0.1) % 1
					alphaColorPicker:SetColor(Color3.fromHSV(hue, 1, 1))
				end)
			elseif rainbowConnection then
				rainbowConnection:Disconnect()
				rainbowConnection = nil
			end
		end,
	}, "RainbowToggle")

	local optionTable = {
		"Apple",
		"Banana",
		"Orange",
		"Grapes",
		"Pineapple",
		"Mango",
		"Strawberry",
		"Blueberry",
		"Watermelon",
		"Peach"
	}

	local Dropdown = sections.MainSection1:Dropdown({
		Name = "Dropdown",
		Multi = false,
		Required = true,
		Options = optionTable,
		Default = 1,
		Callback = function(Value)
			print("Dropdown changed: ".. Value)
		end,
	}, "Dropdown")

	local MultiDropdown = sections.MainSection1:Dropdown({
		Name = "Multi Dropdown",
		Search = true,
		Multi = true,
		Required = false,
		Options = optionTable,
		Default = {"Apple", "Orange"},
		Callback = function(Value)
			local Values = {}
			for Value, State in next, Value do
				table.insert(Values, Value)
			end
			print("Mutlidropdown changed:", table.concat(Values, ", "))
		end,
	}, "MultiDropdown")

	sections.MainSection1:Button({
		Name = "Update Selection",
		Callback = function()
			Dropdown:UpdateSelection("Grapes")
			MultiDropdown:UpdateSelection({"Banana", "Pineapple"})
		end,
	})

	sections.MainSection1:Divider()

	sections.MainSection1:Header({
		Text = "Header #2"
	})

	sections.MainSection1:Paragraph({
		Header = "Paragraph",
		Body = "Paragraph body. Lorem ipsum odor amet, consectetuer adipiscing elit. Morbi tempus netus aliquet per velit est gravida."
	})

	sections.MainSection1:Label({
		Text = "Label. Lorem ipsum odor amet, consectetuer adipiscing elit."
	})

	sections.MainSection1:SubLabel({
		Text = "Sub-Label. Lorem ipsum odor amet, consectetuer adipiscing elit."
	})

	MacLib:SetFolder("Maclib")
	tabs.Settings:InsertConfigSection("Left")

	Window.onUnloaded(function()
		print("Unloaded!")
	end)

	tabs.Main:Select()
	MacLib:LoadAutoLoadConfig()
end

return MacLib end function __DIST.o()-- Hàm thông báo an toàn dùng chung cho DungeonQuest.
-- Nhận Window tham chiếu qua SetWindow (vì Window được tạo sau khi require module).

--// Variables

local window

--// Table
local notifier = {}

--// Methods
function notifier:SetWindow(newWindow)
	window = newWindow
end

function notifier.Notify(title, desc, lifetime)
	lifetime = lifetime or 3

	if window then
		local ok = pcall(function()
			window:Notify({ Title = title, Description = desc, Lifetime = lifetime })
		end)
		if ok then return end
	end

	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = title,
			Text = desc,
			Duration = lifetime,
		})
	end)
end

return notifier
end function __DIST.p()-- Auto-save config cho DungeonQuest: tự động lưu mỗi khi control thay đổi,
-- không cần bấm "Overwrite" thủ công. Chỉ lưu khi có config active đang chọn.

--// Imports

local macLib = __DIST.load('n')
local notifier = __DIST.load('o')

--// Table
local autoSave = {}

--// Variables
local activeConfig = nil
local saveQueued = false
local suspended = false

local recordingActive = false

function autoSave.Suspend()
	suspended = true
	saveQueued = false
end

function autoSave.Resume()
	suspended = false
end

function autoSave.SetRecording(state)
	recordingActive = state and true or false
end

function autoSave.IsRecording()
	return recordingActive
end

function autoSave.IsSuspended()
	if suspended or (macLib.LoadingConfig == true) or recordingActive then
		return true
	end
	local ok, coordinator = pcall(require, "@routes/DungeonQuest/core/coordinator")
	if ok and coordinator and coordinator.IsLocked and coordinator.IsLocked() then
		return true
	end
	return false
end

-- Cập nhật tên config đang active (gọi từ Config tab khi chọn/tạo/tải config)
function autoSave.SetActive(name)
	activeConfig = (typeof(name) == "string" and #name > 0) and string.gsub(name, "[\r\n%s]+", "") or nil
	if activeConfig and writefile then
		pcall(function()
			local folder = macLib.Folder
			if isfolder and not isfolder(folder) then makefolder(folder) end
			if isfolder and not isfolder(folder .. "/settings") then makefolder(folder .. "/settings") end
			writefile(folder .. "/settings/autoload.txt", activeConfig)
		end)
	end
end

function autoSave.GetActive()
	return activeConfig
end

-- Fallback: nếu chưa có config active (không bấm chọn trong tab Configs) nhưng có
-- config autoload trong autoload.txt thì dùng luôn tên đó -> đảm bảo mọi slider/
-- toggle đều được lưu mà không phụ thuộc thứ tự khởi tạo tab.
local function resolveActiveConfig()
	if activeConfig then return activeConfig end

	local folder = macLib.Folder
	local path = folder .. "/settings/autoload.txt"
	if isfile and isfile(path) then
		local ok, name = pcall(readfile, path)
		if ok and typeof(name) == "string" then
			name = string.gsub(name, "[\r\n%s]+", "")
			if #name > 0 then
				activeConfig = name
				return activeConfig
			end
		end
	end

	-- Fallback tạo config "Default" để luôn lưu được dữ liệu cấu hình người dùng
	activeConfig = "Default"
	pcall(function()
		if writefile and makefolder and isfolder then
			if not isfolder(folder) then makefolder(folder) end
			if not isfolder(folder .. "/settings") then makefolder(folder .. "/settings") end
			if not isfile(path) then
				writefile(path, "Default")
			end
		end
	end)
	return activeConfig
end

-- Lưu ngay lập tức (gọi trực tiếp)
function autoSave.SaveNow()
	if autoSave.IsSuspended() then return end
	local name = resolveActiveConfig()
	if not name then return end

	local success, err = macLib:SaveConfig(name)
	if not success and err and err ~= "Please select a config file." then
		notifier.Notify("AutoSave", "Failed to save config: " .. tostring(err), 3)
	end
end

-- Lưu có debounce: dồn nhiều thay đổi (vd kéo slider) thành 1 lần lưu
function autoSave.Save()
	if autoSave.IsSuspended() then return end
	if not resolveActiveConfig() then return end
	if saveQueued then return end
	saveQueued = true

	task.delay(0.5, function()
		saveQueued = false
		if not autoSave.IsSuspended() and autoSave.GetActive() then
			autoSave.SaveNow()
		end
	end)
end

-- Bọc một callback control để tự lưu sau khi callback chạy
function autoSave.Wrap(callback)
	if type(callback) ~= "function" then return callback end
	return function(...)
		callback(...)
		autoSave.Save()
	end
end

return autoSave
end function __DIST.q()-- Core Contextual cho DungeonQuest: Quản lý thiết lập khoảng cách chiến đấu (Min/Max Combat Distance)
-- riêng biệt theo từng DUNGEON x LOẠI MỤC TIÊU (Normal, Boss 1, Boss 2, Boss 3).
-- Dữ liệu được nhúng và lưu trữ trực tiếp trong config MacLib (macLib.contextData).

--// Imports

local macLib = __DIST.load('n')
local autoSave = __DIST.load('p')
local shared = __DIST.load('c')

--// Table
local contextual = {}

--// Default Values per Target Type
local DEFAULT_DISTANCES = {
	Mob = { Min = 15.0, Max = 35.0, BossArea = false, BossAreaRadius = 80.0, DisableDodge = false, EnableHazardScanner = true },
	Boss1 = { Min = 25.0, Max = 50.0, BossArea = false, BossAreaRadius = 80.0, DisableDodge = false, EnableHazardScanner = true },
	Boss2 = { Min = 25.0, Max = 50.0, BossArea = false, BossAreaRadius = 80.0, DisableDodge = false, EnableHazardScanner = true },
	Boss3 = { Min = 25.0, Max = 50.0, BossArea = false, BossAreaRadius = 80.0, DisableDodge = false, EnableHazardScanner = true },
}

local TARGET_KEYS = { "Mob", "Boss1", "Boss2", "Boss3" }

local DISPLAY_TO_KEY = {
	["Normal"] = "Mob",
	["Boss 1"] = "Boss1",
	["Boss 2"] = "Boss2",
	["Boss 3"] = "Boss3",
}

local KEY_TO_DISPLAY = {
	["Mob"] = "Normal",
	["Boss1"] = "Boss 1",
	["Boss2"] = "Boss 2",
	["Boss3"] = "Boss 3",
}

--// Storage: data[dungeonName][targetKey] = { Min = number, Max = number }
local data = {}
local dataChangedCallbacks = {}

function contextual.GetTargetDisplay(key)
	return KEY_TO_DISPLAY[key] or "Normal"
end

function contextual.GetTargetKey(display)
	return DISPLAY_TO_KEY[display] or "Mob"
end

function contextual.GetTargetOptions()
	return { "Normal", "Boss 1", "Boss 2", "Boss 3" }
end

--// Nạp và xuất dữ liệu config
function contextual.GetSaveData()
	return data
end

function contextual.LoadData(incomingData)
	if type(incomingData) == "table" then
		data = incomingData
	else
		data = {}
	end
	macLib.contextData = data

	for _, cb in ipairs(dataChangedCallbacks) do
		pcall(cb)
	end
end

function contextual.OnDataChanged(callback)
	if type(callback) ~= "function" then return function() end end
	table.insert(dataChangedCallbacks, callback)
	return function()
		for i, cb in ipairs(dataChangedCallbacks) do
			if cb == callback then
				table.remove(dataChangedCallbacks, i)
				break
			end
		end
	end
end

local function syncToMacLibAndSave()
	macLib.contextData = data
	autoSave.Save()
end

--// Lấy khoảng cách Min/Max của 1 Dungeon x Target cụ thể
function contextual.GetCombatDistances(dungeonName, targetKey)
	local tKey = targetKey or "Mob"
	local def = DEFAULT_DISTANCES[tKey] or DEFAULT_DISTANCES.Mob

	if type(dungeonName) == "string" and #dungeonName > 0 and data[dungeonName] and data[dungeonName][tKey] then
		local entry = data[dungeonName][tKey]
		local minVal = (type(entry.Min) == "number" and entry.Min > 0) and entry.Min or def.Min
		local maxVal = (type(entry.Max) == "number" and entry.Max > 0) and entry.Max or def.Max
		return minVal, maxVal
	end

	return def.Min, def.Max
end

--// Lấy khoảng cách Min/Max hiện tại dựa trên Dungeon và Target đang chiến đấu
function contextual.GetActiveCombatDistances(target)
	local dungeon = shared.GetCurrentDungeonName()
	local targetKey = "Mob"

	local isBoss = false
	if shared.IsBossActive and shared.IsBossActive() then
		isBoss = true
		targetKey = shared.GetCombatTargetKey()
	elseif target then
		if target.Room and type(target.Room.Name) == "string" and string.find(string.lower(target.Room.Name), "boss") then
			isBoss = true
		elseif target.Model then
			local mName = string.lower(target.Model.Name)
			if string.find(mName, "boss") then
				isBoss = true
			else
				local parent = target.Model.Parent
				if parent and string.find(string.lower(parent.Name), "boss") then
					isBoss = true
				end
			end
		end
		if isBoss then
			local bIdx = shared.GetCurrentBossIndex and shared.GetCurrentBossIndex() or 1
			targetKey = "Boss" .. tostring(math.clamp(bIdx, 1, 3))
		end
	end

	return contextual.GetCombatDistances(dungeon, targetKey)
end

--// Lấy thiết lập Boss Area (Enabled, Radius) của 1 Dungeon x Target cụ thể (chỉ Boss)
function contextual.GetBossArea(dungeonName, targetKey)
	local tKey = targetKey or "Mob"
	if tKey == "Mob" then
		return false, 80.0
	end
	local def = DEFAULT_DISTANCES[tKey] or DEFAULT_DISTANCES.Boss1
	if type(dungeonName) == "string" and #dungeonName > 0 and data[dungeonName] and data[dungeonName][tKey] then
		local entry = data[dungeonName][tKey]
		local enabled = entry.BossArea == true
		local radius = (type(entry.BossAreaRadius) == "number" and entry.BossAreaRadius > 0) and entry.BossAreaRadius or (def.BossAreaRadius or 80.0)
		return enabled, radius
	end
	return def.BossArea or false, def.BossAreaRadius or 80.0
end

--// Cập nhật Boss Area Enabled
function contextual.SetBossAreaEnabled(dungeonName, targetKey, enabled)
	if not (type(dungeonName) == "string" and #dungeonName > 0) then return end
	local tKey = targetKey or "Mob"
	if tKey == "Mob" then return end -- Boss Area chỉ áp dụng cho Boss

	data[dungeonName] = data[dungeonName] or {}
	data[dungeonName][tKey] = data[dungeonName][tKey] or {}
	data[dungeonName][tKey].BossArea = enabled and true or false

	syncToMacLibAndSave()
end

--// Cập nhật Boss Area Radius
function contextual.SetBossAreaRadius(dungeonName, targetKey, radius)
	if not (type(dungeonName) == "string" and #dungeonName > 0) then return end
	local tKey = targetKey or "Mob"
	if tKey == "Mob" then return end -- Boss Area chỉ áp dụng cho Boss
	if type(radius) ~= "number" or radius <= 0 then return end

	data[dungeonName] = data[dungeonName] or {}
	data[dungeonName][tKey] = data[dungeonName][tKey] or {}
	data[dungeonName][tKey].BossAreaRadius = radius

	syncToMacLibAndSave()
end

--// Lấy thông tin Boss Area đang hoạt động trong trận chiến hiện tại: (enabled, radius, centerPosition)
function contextual.GetActiveBossArea(target)
	local dungeon = shared.GetCurrentDungeonName()
	local targetKey = "Mob"

	local isBoss = false
	if shared.IsBossActive and shared.IsBossActive() then
		isBoss = true
		targetKey = shared.GetCombatTargetKey()
	elseif target then
		if target.Room and type(target.Room.Name) == "string" and string.find(string.lower(target.Room.Name), "boss") then
			isBoss = true
		elseif target.Model then
			local mName = string.lower(target.Model.Name)
			if string.find(mName, "boss") then
				isBoss = true
			else
				local parent = target.Model.Parent
				if parent and string.find(string.lower(parent.Name), "boss") then
					isBoss = true
				end
			end
		end
		if isBoss then
			local bIdx = shared.GetCurrentBossIndex and shared.GetCurrentBossIndex() or 1
			targetKey = "Boss" .. tostring(math.clamp(bIdx, 1, 3))
		end
	end

	if not isBoss or targetKey == "Mob" then
		return false, 0, nil
	end

	local enabled, radius = contextual.GetBossArea(dungeon, targetKey)
	if not enabled then
		return false, radius, nil
	end

	local center = shared.GetBossSpawnPosition and shared.GetBossSpawnPosition()
	if not center and target and target.Root then
		center = target.Root.Position
		if shared.SetBossSpawnPosition then
			shared.SetBossSpawnPosition(center)
		end
	end

	return enabled, radius, center
end

--// Lấy trạng thái Disable Dodge của 1 Dungeon x Target cụ thể
function contextual.GetDisableDodge(dungeonName, targetKey): boolean
	local tKey = targetKey or "Mob"
	local def = DEFAULT_DISTANCES[tKey] or DEFAULT_DISTANCES.Mob

	if type(dungeonName) == "string" and #dungeonName > 0 and data[dungeonName] and data[dungeonName][tKey] then
		local entry = data[dungeonName][tKey]
		if entry.DisableDodge ~= nil then
			return entry.DisableDodge == true
		end
	end

	return def.DisableDodge or false
end

--// Cập nhật trạng thái Disable Dodge
function contextual.SetDisableDodge(dungeonName, targetKey, state)
	if not (type(dungeonName) == "string" and #dungeonName > 0) then return end
	local tKey = targetKey or "Mob"

	data[dungeonName] = data[dungeonName] or {}
	data[dungeonName][tKey] = data[dungeonName][tKey] or {}
	data[dungeonName][tKey].DisableDodge = state and true or false

	syncToMacLibAndSave()
end

--// Lấy trạng thái Enable Hazard Scanner của 1 Dungeon x Target cụ thể
function contextual.GetEnableHazardScanner(dungeonName, targetKey): boolean
	local tKey = targetKey or "Mob"
	local def = DEFAULT_DISTANCES[tKey] or DEFAULT_DISTANCES.Mob

	if type(dungeonName) == "string" and #dungeonName > 0 and data[dungeonName] and data[dungeonName][tKey] then
		local entry = data[dungeonName][tKey]
		if entry.EnableHazardScanner ~= nil then
			return entry.EnableHazardScanner == true
		end
	end

	return def.EnableHazardScanner ~= false
end

--// Cập nhật trạng thái Enable Hazard Scanner
function contextual.SetEnableHazardScanner(dungeonName, targetKey, state)
	if not (type(dungeonName) == "string" and #dungeonName > 0) then return end
	local tKey = targetKey or "Mob"

	data[dungeonName] = data[dungeonName] or {}
	data[dungeonName][tKey] = data[dungeonName][tKey] or {}
	data[dungeonName][tKey].EnableHazardScanner = state and true or false

	syncToMacLibAndSave()
end

--// Kiểm tra xem mục tiêu đang giao chiến hiện tại có bị tắt né đòn (Disable Dodge) không
function contextual.IsActiveDodgeDisabled(target): boolean
	local dungeon = shared.GetCurrentDungeonName()
	local targetKey = "Mob"

	local isBoss = false
	if shared.IsBossActive and shared.IsBossActive() then
		isBoss = true
		targetKey = shared.GetCombatTargetKey()
	elseif target then
		if target.Room and type(target.Room.Name) == "string" and string.find(string.lower(target.Room.Name), "boss") then
			isBoss = true
		elseif target.Model then
			local mName = string.lower(target.Model.Name)
			if string.find(mName, "boss") then
				isBoss = true
			else
				local parent = target.Model.Parent
				if parent and string.find(string.lower(parent.Name), "boss") then
					isBoss = true
				end
			end
		end
		if isBoss then
			local bIdx = shared.GetCurrentBossIndex and shared.GetCurrentBossIndex() or 1
			targetKey = "Boss" .. tostring(math.clamp(bIdx, 1, 3))
		end
	end

	return contextual.GetDisableDodge(dungeon, targetKey)
end

--// Kiểm tra xem mục tiêu đang giao chiến hiện tại có được bật Hazard Scanner không
function contextual.IsActiveHazardScannerEnabled(target): boolean
	local dungeon = shared.GetCurrentDungeonName()
	local targetKey = "Mob"

	local isBoss = false
	if shared.IsBossActive and shared.IsBossActive() then
		isBoss = true
		targetKey = shared.GetCombatTargetKey()
	elseif target then
		if target.Room and type(target.Room.Name) == "string" and string.find(string.lower(target.Room.Name), "boss") then
			isBoss = true
		elseif target.Model then
			local mName = string.lower(target.Model.Name)
			if string.find(mName, "boss") then
				isBoss = true
			else
				local parent = target.Model.Parent
				if parent and string.find(string.lower(parent.Name), "boss") then
					isBoss = true
				end
			end
		end
		if isBoss then
			local bIdx = shared.GetCurrentBossIndex and shared.GetCurrentBossIndex() or 1
			targetKey = "Boss" .. tostring(math.clamp(bIdx, 1, 3))
		end
	end

	-- Nếu tắt Dodge trên mục tiêu này thì cũng tự động tắt Hazard Scanner
	if contextual.GetDisableDodge(dungeon, targetKey) then
		return false
	end

	return contextual.GetEnableHazardScanner(dungeon, targetKey)
end

--// Cập nhật Min Combat Distance
function contextual.SetMinCombatDistance(dungeonName, targetKey, minVal)
	if not (type(dungeonName) == "string" and #dungeonName > 0) then return end
	local tKey = targetKey or "Mob"
	if type(minVal) ~= "number" or minVal <= 0 then return end

	data[dungeonName] = data[dungeonName] or {}
	data[dungeonName][tKey] = data[dungeonName][tKey] or {}

	local currentMax = data[dungeonName][tKey].Max or (DEFAULT_DISTANCES[tKey] or DEFAULT_DISTANCES.Mob).Max
	data[dungeonName][tKey].Min = minVal

	if minVal > currentMax then
		data[dungeonName][tKey].Max = minVal + 5.0
	end

	syncToMacLibAndSave()
end

--// Cập nhật Max Combat Distance
function contextual.SetMaxCombatDistance(dungeonName, targetKey, maxVal)
	if not (type(dungeonName) == "string" and #dungeonName > 0) then return end
	local tKey = targetKey or "Mob"
	if type(maxVal) ~= "number" or maxVal <= 0 then return end

	data[dungeonName] = data[dungeonName] or {}
	data[dungeonName][tKey] = data[dungeonName][tKey] or {}

	local currentMin = data[dungeonName][tKey].Min or (DEFAULT_DISTANCES[tKey] or DEFAULT_DISTANCES.Mob).Min
	data[dungeonName][tKey].Max = maxVal

	if maxVal < currentMin then
		data[dungeonName][tKey].Min = math.max(1.0, maxVal - 5.0)
	end

	syncToMacLibAndSave()
end

--// Reset một target trong dungeon về mặc định
function contextual.ResetTarget(dungeonName, targetKey)
	if not (type(dungeonName) == "string" and #dungeonName > 0) then return end
	local tKey = targetKey or "Mob"
	if data[dungeonName] then
		data[dungeonName][tKey] = nil
		if next(data[dungeonName]) == nil then
			data[dungeonName] = nil
		end
		syncToMacLibAndSave()
	end
end

--// Reset toàn bộ các target của 1 dungeon về mặc định
function contextual.ResetDungeon(dungeonName)
	if not (type(dungeonName) == "string" and #dungeonName > 0) then return end
	if data[dungeonName] then
		data[dungeonName] = nil
		syncToMacLibAndSave()
	end
end

return contextual
end function __DIST.r()-- HazardScanner – Module: Threat Detection Engine (DungeonQuest).
-- Đơn giản hóa hoàn toàn: chỉ phát hiện đối tượng skill xuất hiện trong Workspace
-- qua ChildAdded/ChildRemoved, CHỈ chạy sau sự kiện start dungeon (không còn ở lobby),
-- và vẽ SelectionBox đơn giản cho từng đối tượng được xác định.
-- Không còn trajectory / whitelist / boss orb / ngoại lệ / hitbox padding / tên 3D.

--// Imports

local services = __DIST.load('a')
local shared = __DIST.load('c')
local lifecycle = __DIST.load('b')
local geometry = __DIST.load('j')
local visualizer = __DIST.load('k')
local trajectory = __DIST.load('m')
local timerVisual = __DIST.load('l')
local contextual = __DIST.load('q')

--// References
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = services.player

--// Table
local detection = {}

--// State
local enabled = false
local inDungeon = false
local selectionBoxesEnabled = true
local logHazards = false
local logFailed = false
local inspectTargetName = ""
local inspectEnabled = false
local activeHazards = {} -- [Instance] = { Name, Class, Distance, Boxes = {} }
local hazardCount = 0
local hazardChangedCallbacks = {}
local lastHazardInfo = nil
local connections = {}
local roomCleanup = nil
local lastIceSpikesChainTime = 0
local roomTransitionUntil = 0
local ROOM_TRANSITION_COOLDOWN = 2.0

--// Danh sách folder template trong ReplicatedStorage: các đối tượng clone từ đây
--// xuất hiện trong Workspace sẽ KHÔNG được vẽ box.
local IGNORE_FOLDERS = { "abilities", "projectiles" }
local ignoreNamesLoaded = false
local ignoreNames = {} -- [cleanName] = true

--// Blacklist: Danh sách tên đối tượng trong Workspace KHÔNG BAO GIỜ coi là Danger Zone
local HAZARD_BLACKLIST = {
	["firstbossbeamparticles"] = true,
}

local function loadIgnoreNames()
	if ignoreNamesLoaded then return end
	ignoreNamesLoaded = true
	for _, folderName in ipairs(IGNORE_FOLDERS) do
		local folder = ReplicatedStorage:FindFirstChild(folderName)
		if folder then
			for _, obj in ipairs(folder:GetChildren()) do
				local clean = (obj.Name or ""):lower():gsub("%s+", "")
				if #clean > 0 then ignoreNames[clean] = true end
			end
		end
	end
end

local function isIgnoredName(instance)
	if not instance then return true end
	local name = instance.Name
	if typeof(name) == "string" then
		local lower = name:lower()
		-- 1. Bỏ qua toàn bộ debug part, adornee, marker, visual của script
		if lower:sub(1, 3) == "tm_"
			or lower:sub(1, 3) == "pr_"
			or lower:sub(1, 3) == "dq_"
			or lower:find("pathrecord")
			or lower:find("safespot")
			or lower:find("hazard")
			or lower:find("adornment")
			or lower:find("debug")
			or lower:find("targetpart")
			or lower:find("actualmarker") then
			return true
		end

		-- 2. Bỏ qua các instance nằm trong container visual của script
		local parent = instance.Parent
		while parent and parent ~= workspace and parent ~= game do
			local pName = parent.Name
			if typeof(pName) == "string" then
				local pLower = pName:lower()
				if pLower:find("pathrecord") or pLower:sub(1, 3) == "tm_" or pLower:sub(1, 3) == "pr_" then
					return true
				end
			end
			parent = parent.Parent
		end

		-- 3. Bỏ qua các template trong ReplicatedStorage
		local clean = lower:gsub("%s+", "")
		if #clean > 0 and ignoreNames[clean] == true then return true end

		-- 4. Bỏ qua các đối tượng nằm trong danh sách Blacklist thủ công
		if HAZARD_BLACKLIST[clean] == true or HAZARD_BLACKLIST[name] == true then return true end
		for blName, _ in pairs(HAZARD_BLACKLIST) do
			if string.find(clean, blName, 1, true) then
				return true
			end
		end
	end
	return false
end

--// Kiểm tra xem instance có phải là nhân vật người chơi (LocalPlayer hoặc đồng đội) không
local function isPlayerCharacter(instance)
	if not instance then return false end
	if Players:GetPlayerFromCharacter(instance) then return true end
	if Players:FindFirstChild(instance.Name) then return true end
	for _, p in ipairs(Players:GetPlayers()) do
		if instance.Name == p.Name then return true end
		local c = p.Character
		if c and (instance == c or instance:IsDescendantOf(c)) then
			return true
		end
	end
	local char = player and player.Character
	if char and (instance == char or instance:IsDescendantOf(char)) then return true end
	return false
end

--// Fire callback thay đổi hazard (count, lastInfo)
local function fireHazardChanged()
	local count = 0
	for _ in pairs(activeHazards) do count += 1 end
	hazardCount = count
	for i = #hazardChangedCallbacks, 1, -1 do
		pcall(hazardChangedCallbacks[i], count, lastHazardInfo)
	end
end

--// Ngưỡng coi như part đã mờ hoàn toàn -> không vẽ box
local FADE_TRANSPARENCY_THRESHOLD = 0.85

--// Retry: object xuất hiện nhưng chưa kịp khởi tạo đủ parts (DescendantAdded đến sau
--// ChildAdded). Retry tối đa MAX_REGISTER_RETRIES lần mỗi khi có descendant mới.
local MAX_REGISTER_RETRIES = 50
local RETRY_INTERVAL = 0.05
local retryStates = {} -- [Instance] = { active = boolean, count = number }

local function stopRetry(instance)
	local state = retryStates[instance]
	if state then
		state.active = false
		retryStates[instance] = nil
	end
end

local function stopAllRetries()
	for _, state in pairs(retryStates) do
		if state then state.active = false end
	end
	table.clear(retryStates)
end

local function isBeamTelegraph(name)
	if not name or type(name) ~= "string" then return false end
	local clean = name:lower():gsub("%s+", "")
	return string.find(clean, "firstbossbeampart", 1, true) ~= nil
end

--// Lay danh sach BasePart cua instance (BasePart -> chinh no; Model / Folder -> cac BasePart descendant)
--// Chỉ lấy part còn rõ (Transparency <= 0.85) hoặc là tia định hướng telegraph của Boss
local function getBaseParts(instance)
	if not instance then return {} end
	local parts = {}
	local isBeam = isBeamTelegraph(instance.Name)
	local function addPart(part)
		if part and part.Parent and (part.Transparency <= FADE_TRANSPARENCY_THRESHOLD or isBeam) then
			parts[#parts + 1] = part
		end
	end
	if instance:IsA("BasePart") then
		addPart(instance)
	else
		for _, desc in ipairs(instance:GetDescendants()) do
			if desc:IsA("BasePart") and desc.Parent then
				addPart(desc)
			end
		end
	end
	return parts
end

--// Khoang cach tu player den instance (studs, lam tron)
local function computeDistance(instance)
	local char = player and player.Character
	if not char then return 0 end
	local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
	if not root then return 0 end
	local rootPos = root.Position

	local pos
	if instance:IsA("BasePart") then
		pos = instance.Position
	elseif instance:IsA("Model") then
		local ok, pivot = pcall(function()
			return instance:GetPivot().Position
		end)
		if ok then
			pos = pivot
		else
			local part = instance:FindFirstChildWhichIsA("BasePart")
			pos = part and part.Position
		end
	end
	if not pos then return 0 end
	return math.floor((rootPos - pos).Magnitude + 0.5)
end

--// SelectionBox Colors (Red cho chiêu tĩnh, Blue cho chiêu có trajectory)
local BOX_COLOR_RED = Color3.fromRGB(255, 45, 45)
local BOX_SURFACE_RED = Color3.fromRGB(255, 30, 30)
local BOX_COLOR_BLUE = Color3.fromRGB(0, 170, 255)
local BOX_SURFACE_BLUE = Color3.fromRGB(0, 140, 255)

--// Tao va gan SelectionBox don gian len tung BasePart.
--// Khi part mo dan (Transparency > 0.85) thi box tu destroy.
local function attachSelectionBoxes(parts, fadeConnections, isTrajectory)
	local boxes = {}
	local boxColor = isTrajectory and BOX_COLOR_BLUE or BOX_COLOR_RED
	local surfColor = isTrajectory and BOX_SURFACE_BLUE or BOX_SURFACE_RED

	for _, part in ipairs(parts) do
		if part and part.Parent and not isBeamTelegraph(part.Name) and not isBeamTelegraph(part.Parent and part.Parent.Name) then
			local box = Instance.new("SelectionBox")
			box.Name = "HazardSelectionBox"
			box.Color3 = boxColor
			box.SurfaceColor3 = surfColor
			box.SurfaceTransparency = 0.6
			box.LineThickness = 0.05
			box.Adornee = part
			box.Parent = part

			local connection = part:GetPropertyChangedSignal("Transparency"):Connect(function()
				if part.Parent and part.Transparency > FADE_TRANSPARENCY_THRESHOLD then
					pcall(function() box:Destroy() end)
				end
			end)
			if fadeConnections then table.insert(fadeConnections, connection) end

			boxes[#boxes + 1] = box
		end
	end
	return boxes
end

--// Cập nhật màu SelectionBox khi chuyển trạng thái Trajectory (Red <-> Blue)
function detection.UpdateHazardVisualColor(hazardInfo, isTrajectory)
	if not hazardInfo or not hazardInfo.Boxes then return end
	local isTraj = isTrajectory == true or hazardInfo.IsTrajectory == true
	local boxColor = isTraj and BOX_COLOR_BLUE or BOX_COLOR_RED
	local surfColor = isTraj and BOX_SURFACE_BLUE or BOX_SURFACE_RED
	for _, box in ipairs(hazardInfo.Boxes) do
		if box and box.Parent then
			box.Color3 = boxColor
			box.SurfaceColor3 = surfColor
		end
	end
	timerVisual.UpdateHazardVisualColor(hazardInfo, isTraj)
end

--// Specific Skill Deep Inspector
local function matchesInspectTarget(name)
	if not inspectEnabled or inspectTargetName == "" then return false end
	if not name or type(name) ~= "string" then return false end
	local cleanTarget = inspectTargetName:lower():gsub("%s+", "")
	if #cleanTarget == 0 then return false end
	local cleanName = name:lower():gsub("%s+", "")
	return string.find(cleanName, cleanTarget, 1, true) ~= nil
end

local function formatVector3(v)
	if not v then return "nil" end
	return ("(%.2f, %.2f, %.2f)"):format(v.X, v.Y, v.Z)
end

local function printDeepInspect(instance, eventType, extraReason, infoData)
	if not instance then return end
	local name = instance.Name
	if not matchesInspectTarget(name) then return end

	local class = instance.ClassName
	local parentPath = instance.Parent and instance.Parent:GetFullName() or "nil"
	local distance = computeDistance(instance)

	print("================== 🔍 [HAZARD DEEP INSPECT] 🔍 ==================")
	print(("  🎯 Target Name    : %s (%s)"):format(name, class))
	print(("  📌 Event Type     : %s%s"):format(eventType, extraReason and (" -> " .. tostring(extraReason)) or ""))
	print(("  📍 Full Path      : %s"):format(parentPath))
	print(("  📏 Dist to Player : %d studs"):format(distance))

	if eventType == "SPAWN" then
		local parts = {}
		if instance:IsA("BasePart") then
			table.insert(parts, instance)
		else
			for _, desc in ipairs(instance:GetDescendants()) do
				if desc:IsA("BasePart") then
					table.insert(parts, desc)
				end
			end
		end

		print(("  🧩 Total Parts (%d) :"):format(#parts))
		for idx, p in ipairs(parts) do
			local shapeStr = p:IsA("Part") and tostring(p.Shape.Name) or (p.ClassName == "MeshPart" and "MeshPart" or p.ClassName)
			print(("     [%d] %q (%s)"):format(idx, p.Name, p.ClassName))
			print(("         • Size: %s | Shape: %s | Trans: %.2f | CanCollide: %s"):format(
				formatVector3(p.Size),
				shapeStr,
				p.Transparency,
				tostring(p.CanCollide)
			))
			print(("         • Pos : %s"):format(formatVector3(p.Position)))
		end

		local hazardZones = geometry.GetHazardZones(infoData)
		if hazardZones and hazardZones.zones then
			local pad = geometry.GetHitboxPadding()
			print(("  📐 Math Geometry (Zones: %d, BoundingRadius: %.1f studs):"):format(
				#hazardZones.zones,
				hazardZones.boundingRadius or 0
			))
			for idx, z in ipairs(hazardZones.zones) do
				if z.radius then
					print(("     - Zone [%d]: Circle/Ball (Base Radius: %.2f + Pad: %.2f = %.2f studs)"):format(
						idx, z.radius, pad, z.radius + pad
					))
				elseif z.half then
					print(("     - Zone [%d]: Box/OBB (HalfSize: %s)"):format(
						idx, formatVector3(z.half)
					))
				end
			end
		end

		-- Bắt đầu theo dõi phân tích chuyển động xoay (Spinning Analysis)
		task.spawn(function()
			local targetPart = nil
			if instance:IsA("BasePart") then
				targetPart = instance
			elseif instance:IsA("Model") then
				targetPart = instance.PrimaryPart or instance:FindFirstChildWhichIsA("BasePart")
			end
			if not targetPart then return end

			local t0 = os.clock()
			local cf0 = targetPart.CFrame
			task.wait(0.12)

			if not instance.Parent or not targetPart.Parent then return end

			local t1 = os.clock()
			local cf1 = targetPart.CFrame
			local dt = t1 - t0
			if dt <= 0 then return end

			-- Delta trong hệ tọa độ Thế giới (World Space)
			local worldDelta = cf1 * cf0:Inverse()
			local worldAxis, worldAngle = worldDelta:ToAxisAngle()
			local worldDegPerSec = math.deg(worldAngle) / dt

			-- Delta trong hệ tọa độ Cục bộ (Local Space)
			local localDelta = cf0:Inverse() * cf1
			local localAxis, localAngle = localDelta:ToAxisAngle()

			if math.abs(math.deg(worldAngle)) >= 1.5 then
				local worldAxisDesc = "Trục tự do / Hỗn hợp"
				if math.abs(worldAxis.Y) >= 0.8 then
					worldAxisDesc = "Trục Y (Yaw - Quét ngang mặt sàn)"
				elseif math.abs(worldAxis.X) >= 0.8 then
					worldAxisDesc = "Trục X (Pitch - Lăn nhào lộn)"
				elseif math.abs(worldAxis.Z) >= 0.8 then
					worldAxisDesc = "Trục Z (Roll - Nghiêng lật bên)"
				end

				local localAxisDesc = "Trục tự do"
				if math.abs(localAxis.Y) >= 0.8 then
					localAxisDesc = "Trục Local Y"
				elseif math.abs(localAxis.X) >= 0.8 then
					localAxisDesc = "Trục Local X"
				elseif math.abs(localAxis.Z) >= 0.8 then
					localAxisDesc = "Trục Local Z"
				end

				print("================== 🔄 [INSPECT: SPINNING DETECTED] 🔄 ==================")
				print(("  🎯 Target Name    : %s (%s)"):format(instance.Name, targetPart.Name))
				print(("  ⚡ Tốc độ xoay    : %.2f °/s (%.2f rad/s)"):format(worldDegPerSec, worldAngle / dt))
				print(("  🌐 World Spin Axis: %s -> %s"):format(formatVector3(worldAxis), worldAxisDesc))
				print(("  🧩 Local Spin Axis: %s -> %s"):format(formatVector3(localAxis), localAxisDesc))
				print("========================================================================")
			end
		end)
	elseif eventType == "DESPAWN" then
		if infoData and infoData.SpawnClock then
			local elapsed = os.clock() - infoData.SpawnClock
			print(("  ⏱️ Lifetime Active: %.2f seconds"):format(elapsed))
		end
	elseif eventType == "REJECTED" then
		print(("  ⚠️ Rejection Reason: %s"):format(tostring(extraReason)))
	end
	print("================================================================")
end

--// Log đối tượng không vẽ được (bị loại qua gate hoặc không có gì để vẽ)
local function logReject(instance, reason)
	printDeepInspect(instance, "REJECTED", reason, nil)
	if not logFailed then return end
	local name = instance and instance.Name or "?"
	local class = instance and instance.ClassName or "?"
	print(("[HazardScanner][Reject] ⚪ %s (%s) — %s"):format(name, class, reason))
end

local registerHazard

--// Lên lịch retry khi object chưa đủ parts để vẽ (polling 10 lần, mỗi 0.05s).
--// In kết quả chi tiết từng lần retry ra console nếu đang inspect hoặc bật logFailed.
local function retryRegister(instance)
	if not instance or not instance.Parent then return end
	if os.clock() < roomTransitionUntil then return end
	if isPlayerCharacter(instance) then return end
	if activeHazards[instance] then return end
	if retryStates[instance] then return end

	local state = { active = true, count = 0 }
	retryStates[instance] = state

	task.spawn(function()
		while state.active and instance.Parent and enabled and inDungeon do
			if contextual.IsActiveHazardScannerEnabled and not contextual.IsActiveHazardScannerEnabled() then
				stopRetry(instance)
				return
			end
			if os.clock() < roomTransitionUntil then
				stopRetry(instance)
				return
			end
			if isPlayerCharacter(instance) then
				stopRetry(instance)
				return
			end
			state.count += 1
			local allDesc = instance:GetDescendants()
			local validParts = getBaseParts(instance)

			local isTarget = matchesInspectTarget(instance.Name)
			if logFailed or isTarget then
				print(("[HazardScanner][Retry] 🔄 Lần %d/%d: %q (%s) | Descendants: %d | Valid Parts (Trans<=%.2f): %d"):format(
					state.count,
					MAX_REGISTER_RETRIES,
					instance.Name,
					instance.ClassName,
					#allDesc,
					FADE_TRANSPARENCY_THRESHOLD,
					#validParts
				))
			end

			if #validParts > 0 then
				if logFailed or isTarget then
					print(("[HazardScanner][Retry] ✅ Lần %d/%d: %q Đã tìm thấy %d part(s)! Tiến hành vẽ..."):format(
						state.count,
						MAX_REGISTER_RETRIES,
						instance.Name,
						#validParts
					))
				end
				stopRetry(instance)
				registerHazard(instance)
				return
			end

			if state.count >= MAX_REGISTER_RETRIES then
				logReject(instance, ("Hết %d lượt retry mà không tìm thấy BasePart hợp lệ (Descendants: %d)"):format(
					MAX_REGISTER_RETRIES,
					#allDesc
				))
				stopRetry(instance)
				return
			end

			task.wait(RETRY_INTERVAL)
		end
		stopRetry(instance)
	end)
end

--// Dang ky hazard: vẽ SelectionBox quanh moi object xuat hien trong Workspace
registerHazard = function(instance)
	if not enabled or not inDungeon then
		logReject(instance, "Chưa trong dungeon")
		return false
	end
	if contextual.IsActiveHazardScannerEnabled and not contextual.IsActiveHazardScannerEnabled() then
		logReject(instance, "Tắt Hazard Scanner cho mục tiêu trong Contextual")
		return false
	end
	if os.clock() < roomTransitionUntil then
		logReject(instance, "Đang trong 2s chuyển room (Chặn tạo Danger Zone)")
		return false
	end
	if not instance or not instance.Parent then
		logReject(instance, "Không còn Parent")
		return false
	end
	if isPlayerCharacter(instance) then
		logReject(instance, "Nhân vật người chơi (Player/Teammate)")
		return false
	end
	if activeHazards[instance] then return true end

	loadIgnoreNames()
	if isIgnoredName(instance) then
		logReject(instance, "Trùng tên trong ReplicatedStorage (abilities/projectiles)")
		return false
	end

	local parts = getBaseParts(instance)
	if #parts == 0 then
		logReject(instance, "Chưa có part để vẽ (sẽ retry)")
		retryRegister(instance)
		return false
	end

	local isIceSpikes = geometry.IsIceSpikesChain and geometry.IsIceSpikesChain(instance.Name)
	local isSecondBossChain = geometry.IsSecondBossCircleChain and geometry.IsSecondBossCircleChain(instance.Name)
	if isSecondBossChain then
		local now = os.clock()
		if now - lastIceSpikesChainTime < 5.0 then
			logReject(instance, "Vòng con của chuỗi secondBossCricleHitbox (đã dựng trước 10 vòng)")
			return false
		end
		lastIceSpikesChainTime = now
	end

	local distance = computeDistance(instance)

	local info = {
		Instance = instance,
		Name = instance.Name,
		Class = instance.ClassName,
		Distance = distance,
		Boxes = {},
		Connections = {},
		SpawnClock = os.clock(),
	}

	local fadeConnections = {}
	local boxes = {}
	if selectionBoxesEnabled and not isIceSpikes and not isSecondBossChain then
		boxes = attachSelectionBoxes(parts, fadeConnections, false)
	end
	info.Boxes = boxes
	info.Connections = fadeConnections

	activeHazards[instance] = info
	lastHazardInfo = {
		Name = instance.Name,
		Class = instance.ClassName,
		Distance = distance,
	}

	if visualizer.IsEnabled() then
		visualizer.AttachZoneVisuals(info)
	end
	if trajectory.IsEnabled() then
		trajectory.AttachTrajectoryVisuals(info)
	end
	if timerVisual.IsEnabled() then
		timerVisual.AttachTimerVisual(info)
	end

	stopRetry(instance)

	printDeepInspect(instance, "SPAWN", "Passed all gates", info)

	if logHazards then
		print(("[HazardScanner][Hazard] 🔴 Hazard Detected: %s (%s, %d studs)")
			:format(instance.Name, instance.ClassName, distance))
	end
	fireHazardChanged()
	return true
end

--// Huy dong hazard: gỡ SelectionBox va xoa khoi activeHazards
local function unregisterHazard(instance, reason)
	local info = activeHazards[instance]
	if not info then
		stopRetry(instance)
		return
	end

	-- Nếu là Synthetic Chain (như secondBossCricleHitbox), không hủy ngay khi Vòng 1 biến mất khỏi Workspace,
	-- mà duy trì cho đến khi toàn bộ 10 vòng hoàn tất chu kỳ sóng (MaxExpireTime)
	if info.MaxExpireTime and os.clock() < info.MaxExpireTime and reason == "Destroyed" then
		task.delay(info.MaxExpireTime - os.clock() + 0.1, function()
			if activeHazards[instance] == info and os.clock() >= info.MaxExpireTime then
				unregisterHazard(instance, "Wave Completed")
			end
		end)
		return
	end

	printDeepInspect(instance, "DESPAWN", reason, info)

	visualizer.DetachZoneVisuals(info)
	trajectory.DetachTrajectoryVisuals(info)
	timerVisual.DetachTimerVisual(info)

	if info.Boxes then
		for _, box in ipairs(info.Boxes) do
			pcall(function() box:Destroy() end)
		end
		table.clear(info.Boxes)
	end

	if info.Connections then
		for _, c in ipairs(info.Connections) do
			pcall(function() c:Disconnect() end)
		end
		table.clear(info.Connections)
	end

	activeHazards[instance] = nil

	if logHazards then
		local reasonStr = reason and (" (" .. reason .. ")") or ""
		print(("[HazardScanner][Hazard] 🟢 Hazard Expired: %s%s")
			:format(tostring(info.Name), reasonStr))
	end
	fireHazardChanged()
end

--// Xoa toan bo hazard hien tai
function detection.ClearAllHazards(reason)
	lastIceSpikesChainTime = 0
	visualizer.ClearAll()
	trajectory.ClearAll()
	timerVisual.ClearAll()
	stopAllRetries()
	local toRemove = {}
	for inst in pairs(activeHazards) do
		table.insert(toRemove, inst)
	end
	for _, inst in ipairs(toRemove) do
		unregisterHazard(inst, reason)
	end
	if logHazards and reason then
		print(("[HazardScanner][Hazard] 🧹 All hazards cleared: %s"):format(reason))
	end
end

--// Kích hoạt thời gian chuyển room (2 giây): xóa toàn bộ hazard và cấm tạo danger zone mới trong 2s
function detection.TriggerRoomTransition(reason)
	roomTransitionUntil = os.clock() + ROOM_TRANSITION_COOLDOWN
	detection.ClearAllHazards(reason or "Room Transition (2s cooldown)")
	task.delay(ROOM_TRANSITION_COOLDOWN, function()
		if inDungeon and enabled then
			detection.ClearAllHazards("Room Transition Sweep (End 2s)")
		end
	end)
end

function detection.IsRoomTransitioning()
	return os.clock() < roomTransitionUntil
end

--// Bat dau quét: lang nghe ChildAdded/ChildRemoved cua Workspace (chi chay sau start dungeon)
function detection.StartScan()
	if enabled then return end
	enabled = true

	visualizer.BindDetection(detection)
	trajectory.BindDetection(detection)
	timerVisual.BindDetection(detection)
	detection.ClearAllHazards("StartScan Reset")

	for _, c in ipairs(connections) do c:Disconnect() end
	table.clear(connections)

	table.insert(connections, Workspace.ChildAdded:Connect(function(child)
		if isPlayerCharacter(child) then return end
		registerHazard(child)
	end))

	table.insert(connections, Workspace.ChildRemoved:Connect(function(child)
		unregisterHazard(child, "Destroyed")
	end))

	-- Gate "start dungeon": dựa vào lobby / dungeon name
	inDungeon = not (shared.IsInLobby and shared.IsInLobby())
		and (type(shared.GetCurrentDungeonName()) == "string" and #shared.GetCurrentDungeonName() > 0)

	local lastRecordedRoom = shared.GetCurrentRoomIndex()
	if roomCleanup then pcall(roomCleanup); roomCleanup = nil end
	roomCleanup = shared.OnRoomIndexChanged(function(room)
		if room ~= lastRecordedRoom then
			lastRecordedRoom = room
			if room > 0 then
				inDungeon = true
				detection.TriggerRoomTransition("Room Transition to room " .. tostring(room))
			elseif shared.IsInLobby and shared.IsInLobby() and inDungeon then
				inDungeon = false
				detection.ClearAllHazards("Dungeon Ended")
			end
		end
	end)

	if logHazards then
		print("[HazardScanner] 📡 Threat Detector started!")
	end
end

--// Dung quét: gỡ connection va dọn hazards
function detection.StopScan()
	enabled = false
	inDungeon = false

	for _, c in ipairs(connections) do c:Disconnect() end
	table.clear(connections)

	if roomCleanup then pcall(roomCleanup); roomCleanup = nil end

	detection.ClearAllHazards("StopScan")

	if logHazards then
		print("[HazardScanner] 🛑 Threat Detector stopped.")
	end
end

--// Public accessors
function detection.IsEnabled()
	return enabled
end

function detection.SetEnabled(state)
	if state then
		detection.StartScan()
	else
		detection.StopScan()
	end
end

function detection.SetSelectionBoxesEnabled(state)
	selectionBoxesEnabled = state and true or false
	if selectionBoxesEnabled then
		for inst, info in pairs(activeHazards) do
			if inst and inst.Parent and (not info.Boxes or #info.Boxes == 0) then
				local parts = getBaseParts(inst)
				info.Connections = info.Connections or {}
				info.Boxes = attachSelectionBoxes(parts, info.Connections, info.IsTrajectory)
			end
		end
	else
		for _, info in pairs(activeHazards) do
			if info.Boxes then
				for _, box in ipairs(info.Boxes) do
					pcall(function() box:Destroy() end)
				end
				table.clear(info.Boxes)
			end
		end
	end
end

function detection.IsSelectionBoxesEnabled()
	return selectionBoxesEnabled
end

function detection.SetLogHazards(state)
	logHazards = state and true or false
end

function detection.IsLogHazardsEnabled()
	return logHazards
end

function detection.SetLogFailed(state)
	logFailed = state and true or false
end

function detection.IsLogFailedEnabled()
	return logFailed
end

function detection.SetInspectTarget(name)
	inspectTargetName = type(name) == "string" and name or ""
end

function detection.GetInspectTarget()
	return inspectTargetName
end

function detection.SetInspectEnabled(state)
	inspectEnabled = state and true or false
end

function detection.IsInspectEnabled()
	return inspectEnabled
end

function detection.GetHazardCount()
	return hazardCount
end

function detection.GetActiveHazards()
	local list = {}
	for inst, data in pairs(activeHazards) do
		if inst and inst.Parent == Workspace then
			list[#list + 1] = data
		end
	end
	return list
end

function detection.GetActiveHazardsMap()
	return activeHazards
end

function detection.GetLastHazardInfo()
	return lastHazardInfo
end

function detection.OnHazardChanged(callback)
	if type(callback) ~= "function" then return end
	table.insert(hazardChangedCallbacks, callback)
end

--// Dong nap khi shutdown
lifecycle.Register(function()
	detection.StopScan()
	detection.ClearAllHazards("Shutdown")
end)

return detection end function __DIST.s()-- HazardScanner – Player Visualizer & Danger Detection (DungeonQuest).
-- Quản lý visual 2D hình tròn (filled) ghim dưới chân Player biểu thị hitbox 2D trên sàn
-- và liên tục kiểm tra xem Player có đang đứng trong vùng nguy hiểm (Ground Zone hoặc Trajectory Corridor) hay không.

--// Imports

local services = __DIST.load('a')
local lifecycle = __DIST.load('b')
local geometry = __DIST.load('j')
local trajectory = __DIST.load('m')
local contextual = __DIST.load('q')

local RunService = services.RunService or game:GetService("RunService")
local player = services.player

--// Table
local playerVisual = {}

--// State
local visualEnabled = true
local isPlayerInDanger = false
local currentThreat = nil
local currentThreatType = nil
local statusCallbacks = {}
local heartbeatConnection = nil
local playerRadius = 1.8

--// Visual Handle
local playerAdornment = nil
local playerCharConnection = nil

--// Visual Colors & Styling
local COLOR_SAFE = Color3.fromRGB(0, 255, 170) -- Xanh ngọc / Cyan khi an toàn
local COLOR_DANGER = Color3.fromRGB(255, 35, 35) -- Đỏ tươi khi trong vùng nguy hiểm
local TRANSPARENCY_SAFE = 0.45
local TRANSPARENCY_DANGER = 0.20
local GROUND_THICKNESS = 0.20

local Players = game:GetService("Players")

--// Lấy HumanoidRootPart của người chơi (trả về nil nếu player đã chết)
local function getPlayerRoot()
	local lp = player or Players.LocalPlayer
	if not lp then return nil end
	local char = lp.Character
	if not char or not char.Parent then return nil end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then
		return nil -- Player đã chết
	end
	return char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
end

--// Lấy độ cao mặt sàn dưới chân người chơi
local function getPlayerGroundY(root)
	if not root then return 0 end
	return root.Position.Y - 2.5
end

--// Tạo hoặc lấy adornment đĩa tròn 2D dưới chân người chơi
local function ensureAdornment(root)
	if playerAdornment then
		-- Nếu adornment không thuộc về root hiện tại hoặc đã bị gỡ khỏi Workspace
		if playerAdornment.Parent ~= root or not playerAdornment:IsDescendantOf(workspace) then
			pcall(function() playerAdornment:Destroy() end)
			playerAdornment = nil
		else
			if playerAdornment.Adornee ~= root then
				playerAdornment.Adornee = root
			end
			return playerAdornment
		end
	end

	if not root or not root.Parent then return nil end

	local ad = Instance.new("CylinderHandleAdornment")
	ad.Name = "Player_2D_HitboxVisual"
	ad.Adornee = root
	ad.Radius = playerRadius
	ad.Height = GROUND_THICKNESS
	ad.Color3 = isPlayerInDanger and COLOR_DANGER or COLOR_SAFE
	ad.Transparency = isPlayerInDanger and TRANSPARENCY_DANGER or TRANSPARENCY_SAFE
	ad.ZIndex = 5
	ad.AlwaysOnTop = false
	ad.Visible = visualEnabled
	ad.Parent = root

	playerAdornment = ad
	return ad
end

--// Cập nhật trạng thái màu sắc đĩa tròn
local function updateVisualState(inDanger)
	if not playerAdornment or not playerAdornment.Parent then return end
	playerAdornment.Color3 = inDanger and COLOR_DANGER or COLOR_SAFE
	playerAdornment.Transparency = inDanger and TRANSPARENCY_DANGER or TRANSPARENCY_SAFE
end

--// Vòng lặp Heartbeat: Cập nhật vị trí ghim sàn và đánh giá Danger Status
local function onHeartbeat()
	local root = getPlayerRoot()
	if not root or not root.Parent then
		-- Nhân vật đã chết hoặc đang chờ hồi sinh: ẩn visual và reset trạng thái nguy hiểm
		if playerAdornment and playerAdornment.Parent then
			playerAdornment.Visible = false
		end
		if isPlayerInDanger then
			isPlayerInDanger = false
			currentThreat = nil
			currentThreatType = nil
			for _, cb in ipairs(statusCallbacks) do
				pcall(cb, false, nil, nil)
			end
		end
		return
	end

	-- 1. Ghim Visual phẳng nằm ngang trên sàn X-Z
	local ad = ensureAdornment(root)
	if ad and ad.Parent then
		ad.Visible = visualEnabled
		ad.Radius = playerRadius

		local targetY = getPlayerGroundY(root)
		local desiredWorldCFrame = CFrame.new(Vector3.new(root.Position.X, targetY, root.Position.Z))
			* CFrame.Angles(math.rad(90), 0, 0)
		ad.CFrame = root.CFrame:ToObjectSpace(desiredWorldCFrame)
	end

	-- 2. Đánh giá trạng thái nguy hiểm (In Danger Check: Giao thoa Vòng tròn Player với Danger Zones)
	-- Nếu mục tiêu hiện tại bị tắt Hazard Scanner trong Contextual: coi như an toàn và bỏ qua kiểm tra
	if contextual.IsActiveHazardScannerEnabled and not contextual.IsActiveHazardScannerEnabled() then
		if isPlayerInDanger then
			isPlayerInDanger = false
			currentThreat = nil
			currentThreatType = nil
			updateVisualState(false)
			for _, cb in ipairs(statusCallbacks) do
				pcall(cb, false, nil, nil)
			end
		end
		return
	end

	local playerPos = Vector3.new(root.Position.X, 0, root.Position.Z)

	-- Kiểm tra Ground Danger Zones với bán kính vòng tròn Player
	local inGround, hazardInfo, hitPart = geometry.IsPointInAnyHazard(playerPos, nil, playerRadius)
	local inTraj, trajHazard = false, nil

	-- Nếu chưa dính Ground Zone, kiểm tra tiếp Trajectory Corridor với bán kính vòng tròn Player
	if not inGround and trajectory.IsPointInAnyTrajectory then
		inTraj, trajHazard = trajectory.IsPointInAnyTrajectory(playerPos, playerRadius)
	end

	local nowInDanger = (inGround or inTraj)
	local nowThreat = hazardInfo or trajHazard
	local nowThreatType = inGround and "Ground Zone" or (inTraj and "Trajectory Corridor" or nil)

	-- Kiểm tra nếu trạng thái thay đổi
	if nowInDanger ~= isPlayerInDanger or nowThreat ~= currentThreat then
		isPlayerInDanger = nowInDanger
		currentThreat = nowThreat
		currentThreatType = nowThreatType

		updateVisualState(nowInDanger)

		for _, cb in ipairs(statusCallbacks) do
			pcall(cb, nowInDanger, nowThreat, nowThreatType)
		end
	end
end

--// Khởi tạo vòng lặp
local function startTracking()
	if not heartbeatConnection then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

--// Dọn dẹp visual
function playerVisual.Cleanup()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	if playerAdornment then
		pcall(function() playerAdornment:Destroy() end)
		playerAdornment = nil
	end
	isPlayerInDanger = false
	currentThreat = nil
	currentThreatType = nil
end

--// Kiểm tra xem player có đang trong vùng nguy hiểm không
function playerVisual.IsPlayerInDanger()
	return isPlayerInDanger, currentThreat, currentThreatType
end

--// Lấy đối tượng threat hiện tại
function playerVisual.GetCurrentThreat()
	return currentThreat, currentThreatType
end

--// Đăng ký callback khi trạng thái nguy hiểm thay đổi
function playerVisual.OnDangerStatusChanged(callback)
	if type(callback) == "function" then
		table.insert(statusCallbacks, callback)
	end
end

--// Bật / tắt hiển thị visual 2D dưới chân player
function playerVisual.SetVisualEnabled(state)
	visualEnabled = state and true or false
	if playerAdornment then
		playerAdornment.Visible = visualEnabled
	end
end

function playerVisual.IsVisualEnabled()
	return visualEnabled
end

--// Cài đặt bán kính đĩa tròn 2D Hitbox của player
function playerVisual.SetRadius(val)
	if type(val) == "number" and val >= 0.1 then
		playerRadius = val
		if playerAdornment and playerAdornment.Parent then
			playerAdornment.Radius = playerRadius
		end
	end
end

function playerVisual.GetRadius()
	return playerRadius
end

--// Tự động dọn dẹp và kết nối khi hồi sinh nhân vật mới
local function hookLocalPlayer()
	local lp = player or Players.LocalPlayer
	if not lp then return end

	local function onCharAdded(newChar)
		if playerAdornment then
			pcall(function() playerAdornment:Destroy() end)
			playerAdornment = nil
		end
		-- Lắng nghe sự kiện chết để ẩn ngay lập tức
		task.spawn(function()
			local hum = newChar:WaitForChild("Humanoid", 3)
			if hum then
				hum.Died:Connect(function()
					if playerAdornment then
						playerAdornment.Visible = false
					end
				end)
			end
		end)
	end

	playerCharConnection = lp.CharacterAdded:Connect(onCharAdded)
	if lp.Character then
		onCharAdded(lp.Character)
	end
end

hookLocalPlayer()

-- Tự động kích hoạt tracking
startTracking()

-- Dọn dẹp khi shutdown
lifecycle.Register(function()
	if playerCharConnection then
		playerCharConnection:Disconnect()
		playerCharConnection = nil
	end
	playerVisual.Cleanup()
end)

return playerVisual
end function __DIST.t()-- HazardScanner – Candidate Generator (DungeonQuest).
-- Module chuyên trách sinh tập điểm ứng viên (Candidate Generation) bằng thuật toán Progressive Radial Sampling.
-- Độc lập hoàn toàn với Rendering và State (Pure Math / Stateless).
-- Hỗ trợ Momentum Alignment: Ưu tiên chọn hướng né thuận theo hướng người chơi đang chạy.

--// Table

local candidateGenerator = {}

--// Cấu hình Progressive Radial Directions
-- Tier 1 (Coarse Resolution): 8 hướng (mỗi 45 độ)
local COARSE_DIRECTIONS = {}
local NUM_COARSE = 8
for i = 1, NUM_COARSE do
	local angle = (i - 1) * (2 * math.pi / NUM_COARSE)
	COARSE_DIRECTIONS[i] = Vector3.new(math.cos(angle), 0, math.sin(angle))
end

-- Tier 2 (Fine Resolution): 16 hướng (mỗi 22.5 độ)
local FINE_DIRECTIONS = {}
local NUM_FINE = 16
for i = 1, NUM_FINE do
	local angle = (i - 1) * (2 * math.pi / NUM_FINE)
	FINE_DIRECTIONS[i] = Vector3.new(math.cos(angle), 0, math.sin(angle))
end

-- Bán kính lấy mẫu thô (Coarse Radii), chi tiết (Fine Radii) và dự phòng khẩn cấp (Fallback Radii)
local COARSE_RADII = { 1.5, 3.0, 5.0, 8.0, 12.0, 18.0, 25.0 }
local FINE_RADII = { 1.5, 3.0, 4.5, 6.0, 8.0, 10.5, 13.5, 17.0, 21.0, 26.0, 32.0, 38.0, 45.0 }
local FALLBACK_RADII = { 1.5, 3.0, 4.5, 6.0, 8.0, 10.5, 13.5, 17.0, 21.0, 26.0, 32.0, 38.0, 45.0, 50.0, 55.0 }

candidateGenerator.COARSE_DIRECTIONS = COARSE_DIRECTIONS
candidateGenerator.FINE_DIRECTIONS = FINE_DIRECTIONS
candidateGenerator.COARSE_RADII = COARSE_RADII
candidateGenerator.FINE_RADII = FINE_RADII
candidateGenerator.FALLBACK_RADII = FALLBACK_RADII

--// Chạy 1 pass quét lấy mẫu xung quanh origin2D
function candidateGenerator.SamplePass(origin2D, directions, radii, safetyBuffer, requireBuffer, isPointSafeFn, evaluatedList, momentumDir)
	local bestPoint = nil
	local bestDist = math.huge
	local bestDir = Vector3.zero
	local found = false

	-- Sắp xếp thứ tự kiểm tra hướng theo độ thuận chiều với hướng đang chạy (Momentum Alignment)
	local sortedDirections = directions
	if momentumDir and momentumDir.Magnitude > 0.1 then
		local mDir = Vector3.new(momentumDir.X, 0, momentumDir.Z).Unit
		sortedDirections = table.clone(directions)
		table.sort(sortedDirections, function(a, b)
			local dotA = a.X * mDir.X + a.Z * mDir.Z
			local dotB = b.X * mDir.X + b.Z * mDir.Z
			return dotA > dotB -- Hướng nào thuận chiều với đà chạy hơn được xét trước
		end)
	end

	for _, radius in ipairs(radii) do
		local foundAtThisRadius = false

		for _, dir in ipairs(sortedDirections) do
			local candidate = origin2D + dir * radius
			local isSafe = isPointSafeFn(candidate)

			if evaluatedList then
				table.insert(evaluatedList, {
					pos = candidate,
					isSafe = isSafe,
					isChosen = false,
				})
			end

			if isSafe then
				local targetPoint = candidate
				if requireBuffer and safetyBuffer > 0 then
					local pushed = candidate + dir * safetyBuffer
					if isPointSafeFn(pushed) then
						targetPoint = pushed
					end
				end

				local dist = (targetPoint - origin2D).Magnitude
				if dist < bestDist then
					bestDist = dist
					bestPoint = targetPoint
					bestDir = dir
					foundAtThisRadius = true
				end
			end
		end

		if foundAtThisRadius and bestPoint then
			found = true
			break
		end
	end

	return bestPoint, found, bestDist, bestDir
end

return candidateGenerator
end function __DIST.u()-- HazardScanner – Safe Spot Visualizer (DungeonQuest).
-- Module chuyên trách vẽ và quản lý Adornments hiển thị Safe Spot Marker và Candidate Debug Grid.

--// Constants & Colors

local COLOR_SAFE_SPOT = Color3.fromRGB(0, 255, 120) -- Xanh lá Neon dạ quang
local COLOR_LINE = Color3.fromRGB(0, 255, 150)
local COLOR_CENTER = Color3.fromRGB(255, 255, 255) -- Tâm trắng nổi bật
local COLOR_CANDIDATE_SAFE = Color3.fromRGB(0, 235, 140)
local COLOR_CANDIDATE_UNSAFE = Color3.fromRGB(255, 60, 60)

local GROUND_THICKNESS = 0.20
local MARKER_RADIUS = 1.4 -- studs
local CENTER_RADIUS = 0.45 -- studs

--// Table
local safeSpotVisual = {}

--// State
local markerAdornment = nil
local centerAdornment = nil
local lineAdornment = nil
local candidatePool = {}

--// Đảm bảo adornments chính của Safe Spot tồn tại
local function ensureMainVisuals(root)
	if not root then return end

	-- Marker đĩa tròn ngoài
	if not markerAdornment or not markerAdornment.Parent then
		if markerAdornment then pcall(function() markerAdornment:Destroy() end) end
		local ad = Instance.new("CylinderHandleAdornment")
		ad.Name = "SafeSpot_OuterMarker"
		ad.Adornee = root
		ad.Radius = MARKER_RADIUS
		ad.Height = GROUND_THICKNESS
		ad.Color3 = COLOR_SAFE_SPOT
		ad.Transparency = 0.35
		ad.ZIndex = 6
		ad.AlwaysOnTop = false
		ad.Visible = false
		ad.Parent = root
		markerAdornment = ad
	end

	-- Điểm tâm tròn màu trắng
	if not centerAdornment or not centerAdornment.Parent then
		if centerAdornment then pcall(function() centerAdornment:Destroy() end) end
		local cad = Instance.new("CylinderHandleAdornment")
		cad.Name = "SafeSpot_CenterDot"
		cad.Adornee = root
		cad.Radius = CENTER_RADIUS
		cad.Height = GROUND_THICKNESS + 0.05
		cad.Color3 = COLOR_CENTER
		cad.Transparency = 0.15
		cad.ZIndex = 7
		cad.AlwaysOnTop = false
		cad.Visible = false
		cad.Parent = root
		centerAdornment = cad
	end

	-- Đường dẫn nối từ Player -> Safe Spot
	if not lineAdornment or not lineAdornment.Parent then
		if lineAdornment then pcall(function() lineAdornment:Destroy() end) end
		local lad = Instance.new("LineHandleAdornment")
		lad.Name = "SafeSpot_EscapeLine"
		lad.Adornee = root
		lad.Color3 = COLOR_LINE
		lad.Thickness = 3.5
		lad.Transparency = 0.20
		lad.ZIndex = 6
		lad.AlwaysOnTop = false
		lad.Visible = false
		lad.Parent = root
		lineAdornment = lad
	end
end

--// Đảm bảo adornment cho từng candidate trong pool
local function ensureCandidateAdornment(index, root)
	local entry = candidatePool[index]
	if not entry then
		local dot = Instance.new("CylinderHandleAdornment")
		dot.Name = "SafeSpot_CandidateDot_" .. index
		dot.Adornee = root
		dot.Radius = 0.25
		dot.Height = GROUND_THICKNESS
		dot.ZIndex = 4
		dot.AlwaysOnTop = false
		dot.Visible = false
		dot.Parent = root

		local line = Instance.new("LineHandleAdornment")
		line.Name = "SafeSpot_CandidateLine_" .. index
		line.Adornee = root
		line.Thickness = 1.2
		line.ZIndex = 4
		line.AlwaysOnTop = false
		line.Visible = false
		line.Parent = root

		entry = { dot = dot, line = line }
		candidatePool[index] = entry
	else
		if entry.dot and entry.dot.Adornee ~= root then
			entry.dot.Adornee = root
			entry.dot.Parent = root
		end
		if entry.line and entry.line.Adornee ~= root then
			entry.line.Adornee = root
			entry.line.Parent = root
		end
	end
	return entry
end

--// Ẩn toàn bộ candidate visuals
function safeSpotVisual.HideCandidates()
	for _, entry in ipairs(candidatePool) do
		if entry.dot and entry.dot.Parent then entry.dot.Visible = false end
		if entry.line and entry.line.Parent then entry.line.Visible = false end
	end
end

--// Ẩn toàn bộ visuals
function safeSpotVisual.Hide()
	if markerAdornment and markerAdornment.Parent then markerAdornment.Visible = false end
	if centerAdornment and centerAdornment.Parent then centerAdornment.Visible = false end
	if lineAdornment and lineAdornment.Parent then lineAdornment.Visible = false end
	safeSpotVisual.HideCandidates()
end

--// Cập nhật hiển thị Candidate Debug Grid
local function updateCandidateGrid(root, targetY, evaluatedCandidates, isShowCandidates)
	if not isShowCandidates or not evaluatedCandidates or #evaluatedCandidates == 0 then
		safeSpotVisual.HideCandidates()
		return
	end

	local playerFeetWorld = Vector3.new(root.Position.X, targetY + 0.05, root.Position.Z)
	local localStart = root.CFrame:PointToObjectSpace(playerFeetWorld)

	for i, cand in ipairs(evaluatedCandidates) do
		local entry = ensureCandidateAdornment(i, root)
		local candWorld = Vector3.new(cand.pos.X, targetY + 0.05, cand.pos.Z)
		local localEnd = root.CFrame:PointToObjectSpace(candWorld)

		local color = cand.isSafe and COLOR_CANDIDATE_SAFE or COLOR_CANDIDATE_UNSAFE
		local alpha = cand.isSafe and 0.35 or 0.55

		-- 1. Dot tại điểm candidate
		if entry.dot and entry.dot.Parent then
			local desiredDotCF = CFrame.new(candWorld) * CFrame.Angles(math.rad(90), 0, 0)
			entry.dot.CFrame = root.CFrame:ToObjectSpace(desiredDotCF)
			entry.dot.Color3 = color
			entry.dot.Transparency = alpha
			entry.dot.Radius = cand.isSafe and 0.30 or 0.20
			entry.dot.Visible = true
		end

		-- 2. Line nối từ chân Player -> candidate
		if entry.line and entry.line.Parent then
			local delta = localEnd - localStart
			local length = delta.Magnitude
			if length > 0.2 then
				entry.line.CFrame = CFrame.lookAt(localStart, localEnd)
				entry.line.Length = length
				entry.line.Color3 = color
				entry.line.Transparency = alpha + 0.15
				entry.line.Thickness = cand.isSafe and 1.4 or 0.9
				entry.line.Visible = true
			else
				entry.line.Visible = false
			end
		end
	end

	-- Ẩn các adornment không dùng đến
	for i = #evaluatedCandidates + 1, #candidatePool do
		local entry = candidatePool[i]
		if entry.dot and entry.dot.Parent then entry.dot.Visible = false end
		if entry.line and entry.line.Parent then entry.line.Visible = false end
	end
end

--// Cập nhật hiển thị Safe Spot chính và Candidates
function safeSpotVisual.Update(root, safePos, targetY, evaluatedCandidates, isVisualEnabled, isShowCandidates)
	if not root or not root.Parent or not isVisualEnabled or not safePos then
		safeSpotVisual.Hide()
		return
	end

	ensureMainVisuals(root)

	local worldTargetPos = Vector3.new(safePos.X, targetY, safePos.Z)

	-- 1. Marker đĩa tròn ngoài
	if markerAdornment and markerAdornment.Parent then
		local desiredWorldCF = CFrame.new(worldTargetPos) * CFrame.Angles(math.rad(90), 0, 0)
		markerAdornment.CFrame = root.CFrame:ToObjectSpace(desiredWorldCF)
		markerAdornment.Visible = true
	end

	-- 2. Điểm tâm tròn màu trắng
	if centerAdornment and centerAdornment.Parent then
		local desiredCenterCF = CFrame.new(worldTargetPos) * CFrame.Angles(math.rad(90), 0, 0)
		centerAdornment.CFrame = root.CFrame:ToObjectSpace(desiredCenterCF)
		centerAdornment.Visible = true
	end

	-- 3. Line dẫn đường từ chân Player -> Safe Spot
	if lineAdornment and lineAdornment.Parent then
		local playerFeetWorld = Vector3.new(root.Position.X, targetY + 0.1, root.Position.Z)
		local safeFeetWorld = Vector3.new(safePos.X, targetY + 0.1, safePos.Z)

		local localStart = root.CFrame:PointToObjectSpace(playerFeetWorld)
		local localEnd = root.CFrame:PointToObjectSpace(safeFeetWorld)
		local delta = localEnd - localStart
		local length = delta.Magnitude

		if length > 0.3 then
			lineAdornment.CFrame = CFrame.new(localStart)
			lineAdornment.Length = length
			lineAdornment.CFrame = CFrame.lookAt(localStart, localEnd)
			lineAdornment.Visible = true
		else
			lineAdornment.Visible = false
		end
	end

	-- 4. Candidate debug grid
	updateCandidateGrid(root, targetY, evaluatedCandidates, isShowCandidates)
end

--// Dọn dẹp toàn bộ visual
function safeSpotVisual.Cleanup()
	if markerAdornment then pcall(function() markerAdornment:Destroy() end); markerAdornment = nil end
	if centerAdornment then pcall(function() centerAdornment:Destroy() end); centerAdornment = nil end
	if lineAdornment then pcall(function() lineAdornment:Destroy() end); lineAdornment = nil end

	for _, entry in ipairs(candidatePool) do
		if entry.dot then pcall(function() entry.dot:Destroy() end) end
		if entry.line then pcall(function() entry.line:Destroy() end) end
	end
	table.clear(candidatePool)
end

return safeSpotVisual
end function __DIST.v()-- HazardScanner – Safe Spot Engine (DungeonQuest).
-- Logic xác định điểm an toàn gần nhất (Safe Spot) bằng thuật toán Progressive Radial Sampling.
-- Tích hợp Broad-Phase Spatial Culling, Momentum Alignment (ưu tiên theo đà chạy) và Dynamic Scheduling (tiết kiệm CPU khi rảnh rỗi).

--// Imports

local services = __DIST.load('a')
local shared = __DIST.load('c')
local lifecycle = __DIST.load('b')
local geometry = __DIST.load('j')
local trajectory = __DIST.load('m')
local playerVisual = __DIST.load('s')
local candidateGenerator = __DIST.load('t')
local safeSpotVisual = __DIST.load('u')
local contextual = __DIST.load('q')

local RunService = services.RunService or game:GetService("RunService")
local Players = game:GetService("Players")
local player = services.player

--// Table
local safeSpot = {}

--// State
local enabled = true
local visualEnabled = true
local showCandidatesVisual = true
local finePassEnabled = true
local fallbackPassEnabled = false -- Mặc định tắt (block) theo ý người dùng, có toggle để bật khi cần
local safetyBuffer = 2.0 -- studs (khoảng cách đẩy xa thêm ra khỏi mép danger zone để đứng an toàn)
local currentTargetSafeSpot = nil
local currentThreatInstance = nil
local currentThreatType = nil
local lastDistance = 0
local isFindingSafeSpot = false
local heartbeatConnection = nil
local dangerChangedConnection = nil
local safeSpotChangedCallbacks = {}
local lastEvaluatedCandidates = {}
local lastIdleCheck = 0

--// Lấy HumanoidRootPart của người chơi
local function getPlayerRoot()
	local lp = player or Players.LocalPlayer
	if not lp then return nil end
	local char = lp.Character
	if not char or not char.Parent then return nil end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then return nil end
	return char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
end

--// Lấy vector hướng đang chạy thực tế của người chơi (Running Momentum Direction)
local function getPlayerRunningDirection(root)
	local lp = player or Players.LocalPlayer
	if not lp then return nil end
	local char = lp.Character
	if not char or not char.Parent then return nil end

	-- 1. Ưu tiên đọc Humanoid.MoveDirection (hướng người chơi đang chủ động di chuyển bằng phím/joystick/script)
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health > 0 then
		local moveDir = hum.MoveDirection
		if moveDir and moveDir.Magnitude > 0.1 then
			return Vector3.new(moveDir.X, 0, moveDir.Z).Unit
		end
	end

	-- 2. Đọc theo vận tốc vật lý thực tế của HumanoidRootPart nếu đang di chuyển
	if root and root.Parent then
		local vel = Vector3.zero
		pcall(function()
			vel = root.AssemblyLinearVelocity or root.Velocity or Vector3.zero
		end)
		local hVel = Vector3.new(vel.X, 0, vel.Z)
		if hVel.Magnitude >= 2.0 then
			return hVel.Unit
		end
	end

	return nil
end

--// Lấy độ cao mặt sàn dưới chân người chơi
local function getPlayerGroundY(root)
	if not root then return 0 end
	return root.Position.Y - 2.5
end

--// Kiểm tra xem một điểm P (X-Z) có an toàn (Player Circle nằm ngoài mọi Ground Zone & Trajectory và trong Boss Area) không
function safeSpot.IsPointSafe(point, extraMargin)
	if not point then return false end
	local p2D = Vector3.new(point.X, 0, point.Z)

	-- 0. Kiểm tra Boss Area Constraint nếu đang đấu Boss
	local isBossAreaActive, bossAreaRadius, bossAreaCenter = contextual.GetActiveBossArea()
	if isBossAreaActive and bossAreaCenter and bossAreaRadius and bossAreaRadius > 0 then
		local bossCenter2D = Vector3.new(bossAreaCenter.X, 0, bossAreaCenter.Z)
		if (p2D - bossCenter2D).Magnitude > bossAreaRadius then
			return false
		end
	end

	local playerRad = (playerVisual.GetRadius and playerVisual.GetRadius() or 1.8) + (extraMargin or 0)

	-- 1. Kiểm tra Ground Danger Zones (Đĩa đỏ / Vùng tròn / OBB trên mặt sàn)
	if geometry.IsPointInAnyHazard and geometry.IsPointInAnyHazard(p2D, nil, playerRad) then
		return false
	end

	-- 2. Kiểm tra Trajectory Corridors (Hành lang cam của đạn đang bay)
	if trajectory.IsPointInAnyTrajectory and trajectory.IsPointInAnyTrajectory(p2D, playerRad) then
		return false
	end

	return true
end

--// Thuật toán Progressive Radial Escape Sampling: Tìm điểm an toàn gần nhất từ tọa độ origin
--// Tích hợp Broad-Phase Spatial Culling và Momentum Alignment (ưu tiên theo đà chạy của nhân vật)
function safeSpot.FindNearestSafeSpot(origin)
	-- Nếu đang bất tử (Invulnerable) sau hồi sinh -> không tính toán Safe Spot
	if shared.IsInvulnerable and shared.IsInvulnerable() then
		return nil, false, 0, Vector3.zero
	end

	local root = getPlayerRoot()
	if not origin then
		if not root then return nil, false, 0, Vector3.zero end
		origin = root.Position
	end

	local origin2D = Vector3.new(origin.X, 0, origin.Z)
	local momentumDir = getPlayerRunningDirection(root)
	table.clear(lastEvaluatedCandidates)

	-- 0. Kiểm tra Boss Area Constraint
	local isBossAreaActive, bossAreaRadius, bossAreaCenter = contextual.GetActiveBossArea()
	local bossAreaCenter2D = (isBossAreaActive and bossAreaCenter and bossAreaRadius and bossAreaRadius > 0)
		and Vector3.new(bossAreaCenter.X, 0, bossAreaCenter.Z)
		or nil

	-- 1. Broad-Phase Spatial Culling: Lọc nhanh các hazard & trajectory trong phạm vi ảnh hưởng (75 studs)
	local relevantHazards = geometry.GetNearbyHazards and geometry.GetNearbyHazards(origin2D, 75) or nil
	local relevantTrajectories = trajectory.GetNearbyTrajectories and trajectory.GetNearbyTrajectories(origin2D, 75) or nil

	-- Hàm kiểm tra an toàn tối ưu chỉ duyệt qua danh sách relevant đã lọc
	local function isPointSafeScoped(candPoint, extraMargin)
		if not candPoint then return false end
		local p2D = Vector3.new(candPoint.X, 0, candPoint.Z)

		-- Kiểm tra giới hạn Boss Area (không chọn safe spot nằm ngoài vùng Boss Arena)
		if bossAreaCenter2D and bossAreaRadius then
			local distToCenter = (p2D - bossAreaCenter2D).Magnitude
			if distToCenter > bossAreaRadius then
				return false
			end
		end

		local playerRad = (playerVisual.GetRadius and playerVisual.GetRadius() or 1.8) + (extraMargin or 0)

		if geometry.IsPointInAnyHazard and geometry.IsPointInAnyHazard(p2D, nil, playerRad, relevantHazards) then
			return false
		end

		if trajectory.IsPointInAnyTrajectory and trajectory.IsPointInAnyTrajectory(p2D, playerRad, relevantTrajectories) then
			return false
		end

		return true
	end

	-- 2. Nếu không có bất kỳ mối nguy nào trong phạm vi hoặc vị trí hiện tại đã an toàn -> Xong ngay lập tức
	if (relevantHazards and #relevantHazards == 0 and relevantTrajectories and #relevantTrajectories == 0 and not bossAreaCenter2D) or isPointSafeScoped(origin2D, 0) then
		table.insert(lastEvaluatedCandidates, { pos = origin2D, isSafe = true, isChosen = true })
		return origin2D, true, 0, Vector3.zero
	end

	-- 3. Xác định hướng ưu tiên né (Preferred Escape Direction):
	local preferredDir = momentumDir
	local playerRad = playerVisual.GetRadius and playerVisual.GetRadius() or 1.8
	local inTraj, _, trajDir, trajCentroid = trajectory.IsPointInAnyTrajectory(origin2D, playerRad, relevantTrajectories)

	if inTraj and trajDir and trajCentroid then
		local normalLeft = Vector3.new(-trajDir.Z, 0, trajDir.X)
		local normalRight = Vector3.new(trajDir.Z, 0, -trajDir.X)
		local toPlayer = origin2D - trajCentroid
		local projLeft = toPlayer.X * normalLeft.X + toPlayer.Z * normalLeft.Z

		local chosenNormal = projLeft >= 0 and normalLeft or normalRight

		if momentumDir and momentumDir.Magnitude > 0.1 then
			local dotLeft = momentumDir.X * normalLeft.X + momentumDir.Z * normalLeft.Z
			local dotRight = momentumDir.X * normalRight.X + momentumDir.Z * normalRight.Z
			if dotLeft > dotRight + 0.3 then
				chosenNormal = normalLeft
			elseif dotRight > dotLeft + 0.3 then
				chosenNormal = normalRight
			end
		end

		-- Tính hệ số xéo lùi k linh hoạt trong dải góc từ 100° (k = 0.18) đến 135° (k = 1.0)
		local k = 0.45
		if momentumDir and momentumDir.Magnitude > 0.1 then
			local dotBack = -(momentumDir.X * trajDir.X + momentumDir.Z * trajDir.Z)
			local dotNorm = math.abs(momentumDir.X * chosenNormal.X + momentumDir.Z * chosenNormal.Z)
			if dotNorm > 0.05 then
				local dynamicK = dotBack / dotNorm
				k = math.clamp(dynamicK, 0.18, 1.0)
			elseif dotBack > 0 then
				k = 1.0
			else
				k = 0.18
			end
		end

		local obliqueEscape = (chosenNormal - k * trajDir).Unit
		preferredDir = obliqueEscape
	elseif bossAreaCenter2D and (origin2D - bossAreaCenter2D).Magnitude > bossAreaRadius then
		-- Nếu đang đứng ngoài Boss Area và không có quỹ đạo đạn: Ưu tiên hướng né chạy thẳng vào tâm Boss Area
		preferredDir = (bossAreaCenter2D - origin2D).Unit
	end

	-- Tier 1: Coarse Pass (8 hướng, bán kính thưa, yêu cầu buffer an toàn, ưu tiên theo hướng né tối ưu)
	local bestPoint, found, bestDist, bestDir = candidateGenerator.SamplePass(
		origin2D,
		candidateGenerator.COARSE_DIRECTIONS,
		candidateGenerator.COARSE_RADII,
		safetyBuffer,
		true,
		isPointSafeScoped,
		lastEvaluatedCandidates,
		preferredDir
	)

	-- Tier 2: Fine Pass (16 hướng, bán kính chi tiết lên tới 45 studs, yêu cầu buffer an toàn)
	if not found and finePassEnabled then
		bestPoint, found, bestDist, bestDir = candidateGenerator.SamplePass(
			origin2D,
			candidateGenerator.FINE_DIRECTIONS,
			candidateGenerator.FINE_RADII,
			safetyBuffer,
			true,
			isPointSafeScoped,
			lastEvaluatedCandidates,
			preferredDir
		)
	end

	-- Tier 3: Emergency Fallback Pass (16 hướng, bán kính mở rộng lên tới 55 studs, không bắt buộc buffer)
	if not found and fallbackPassEnabled then
		bestPoint, found, bestDist, bestDir = candidateGenerator.SamplePass(
			origin2D,
			candidateGenerator.FINE_DIRECTIONS,
			candidateGenerator.FALLBACK_RADII or candidateGenerator.FINE_RADII,
			0,
			false,
			isPointSafeScoped,
			lastEvaluatedCandidates,
			preferredDir
		)
	end

	if found and bestPoint then
		-- Đánh dấu candidate được chọn trong danh sách debug visual
		for _, cand in ipairs(lastEvaluatedCandidates) do
			if (cand.pos - bestPoint).Magnitude < 0.25 then
				cand.isChosen = true
				break
			end
		end
		return bestPoint, true, bestDist, bestDir
	end

	-- Không tìm thấy điểm an toàn trong phạm vi tối đa
	return origin2D, false, math.huge, Vector3.zero
end

--// Vòng lặp Heartbeat: Thực hiện kiểm tra với Dynamic Scheduling (tiết kiệm CPU khi an toàn)
local function onHeartbeat()
	if not enabled then
		safeSpotVisual.Hide()
		return
	end

	local root = getPlayerRoot()
	if not root or not root.Parent then
		safeSpotVisual.Hide()
		return
	end

	-- Nếu đang bất tử (Invulnerable) sau hồi sinh -> clear SafeSpot và dừng hoàn toàn việc tính toán
	if shared.IsInvulnerable and shared.IsInvulnerable() then
		safeSpot.Clear()
		return
	end

	-- Nếu mục tiêu hiện tại (Boss) bị tắt né đòn hoặc tắt Hazard Scanner trong Contextual -> clear SafeSpot và không tìm điểm né
	if (contextual.IsActiveDodgeDisabled and contextual.IsActiveDodgeDisabled())
		or (contextual.IsActiveHazardScannerEnabled and not contextual.IsActiveHazardScannerEnabled()) then
		safeSpot.Clear()
		return
	end

	-- Kiểm tra xem Player có đang trong vùng nguy hiểm không
	local inDanger, threatInfo, threatType = false, nil, nil
	if playerVisual.IsPlayerInDanger then
		inDanger, threatInfo, threatType = playerVisual.IsPlayerInDanger()
	end

	-- Dynamic Scheduling: Khi Player hoàn toàn an toàn và không đang tìm/né Safe Spot, throttle kiểm tra ~20Hz
	local isCurrentlyActive = inDanger or (currentTargetSafeSpot ~= nil) or isFindingSafeSpot
	if not isCurrentlyActive then
		local now = os.clock()
		if now - lastIdleCheck < 0.05 then
			return
		end
		lastIdleCheck = now
	end

	local targetY = getPlayerGroundY(root)
	local playerPos2D = Vector3.new(root.Position.X, 0, root.Position.Z)

	if inDanger then
		-- Kiểm tra xem Safe Spot đã chọn trước đó còn hợp lệ không:
		-- Điểm đó vẫn phải Safe (không bị đè bởi bất kỳ vùng đỏ hoặc vùng cam nào).
		local distToTarget = currentTargetSafeSpot and (currentTargetSafeSpot - playerPos2D).Magnitude or 0
		local isTargetStillSafe = currentTargetSafeSpot and safeSpot.IsPointSafe(currentTargetSafeSpot)

		-- Chỉ tính lại khi chưa có Safe Spot HOẶC điểm Safe Spot hiện tại không còn an toàn:
		if not currentTargetSafeSpot or not isTargetStillSafe then
			local spot, found, dist, dir = safeSpot.FindNearestSafeSpot(root.Position)

			if found and spot then
				currentTargetSafeSpot = spot
				currentThreatInstance = threatInfo
				currentThreatType = threatType
				lastDistance = dist
				isFindingSafeSpot = true

				safeSpotVisual.Update(root, spot, targetY, lastEvaluatedCandidates, visualEnabled, showCandidatesVisual)

				for _, cb in ipairs(safeSpotChangedCallbacks) do
					pcall(cb, true, spot, dist)
				end
			else
				safeSpotVisual.Hide()
			end
		else
			-- Safe Spot cũ vẫn an toàn và cùng mối nguy -> GIỮ NGUYÊN để chuyển động né mượt mà không rung lắc
			lastDistance = distToTarget
			safeSpotVisual.Update(root, currentTargetSafeSpot, targetY, lastEvaluatedCandidates, visualEnabled, showCandidatesVisual)

			for _, cb in ipairs(safeSpotChangedCallbacks) do
				pcall(cb, true, currentTargetSafeSpot, distToTarget)
			end
		end
	else
		-- Khi player đã bước ra ngoài vùng nguy hiểm:
		-- Nếu vẫn còn targetSafeSpot và người chơi chưa chạm tới đích (distToTarget > 0.8 studs), tiếp tục duy trì để Auto-Dodge snap hoàn tất
		local distToTarget = currentTargetSafeSpot and (currentTargetSafeSpot - playerPos2D).Magnitude or 0
		local isTargetStillSafe = currentTargetSafeSpot and safeSpot.IsPointSafe(currentTargetSafeSpot)

		if isTargetStillSafe and distToTarget > 0.8 then
			lastDistance = distToTarget
			safeSpotVisual.Update(root, currentTargetSafeSpot, targetY, lastEvaluatedCandidates, visualEnabled, showCandidatesVisual)
			for _, cb in ipairs(safeSpotChangedCallbacks) do
				pcall(cb, true, currentTargetSafeSpot, distToTarget)
			end
		else
			-- Khi đã thực sự tới đích hoặc điểm không còn an toàn -> ẩn visual và reset
			if isFindingSafeSpot or currentTargetSafeSpot then
				isFindingSafeSpot = false
				currentTargetSafeSpot = nil
				currentThreatInstance = nil
				currentThreatType = nil
				lastDistance = 0
				safeSpotVisual.Hide()

				for _, cb in ipairs(safeSpotChangedCallbacks) do
					pcall(cb, false, nil, 0)
				end
			end
		end
	end
end

--// Khởi động tracking
local function startTracking()
	if not heartbeatConnection then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
	if not dangerChangedConnection and playerVisual.OnDangerStatusChanged then
		-- Event-Driven Wakeup: Phản hồi ngay lập tức tại frame nguy hiểm xuất hiện
		dangerChangedConnection = playerVisual.OnDangerStatusChanged(function(nowInDanger)
			if nowInDanger and enabled then
				onHeartbeat()
			end
		end)
	end
end

--// Xóa sạch trạng thái Safe Spot hiện tại (khi hết hiểm họa, đổi room, hoặc hết quái)
function safeSpot.Clear()
	if isFindingSafeSpot or currentTargetSafeSpot then
		isFindingSafeSpot = false
		currentTargetSafeSpot = nil
		currentThreatInstance = nil
		currentThreatType = nil
		lastDistance = 0
		table.clear(lastEvaluatedCandidates)
		safeSpotVisual.Hide()

		for _, cb in ipairs(safeSpotChangedCallbacks) do
			pcall(cb, false, nil, 0)
		end
	end
end

--// Dọn dẹp Safe Spot
function safeSpot.Cleanup()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	safeSpotVisual.Cleanup()
	table.clear(lastEvaluatedCandidates)
	currentTargetSafeSpot = nil
	currentThreatInstance = nil
	currentThreatType = nil
	lastDistance = 0
	isFindingSafeSpot = false
	lastIdleCheck = 0
end

--// API Public
function safeSpot.GetLastSafeSpot()
	return currentTargetSafeSpot, lastDistance, isFindingSafeSpot
end

function safeSpot.OnSafeSpotChanged(callback)
	if type(callback) == "function" then
		table.insert(safeSpotChangedCallbacks, callback)
	end
end

function safeSpot.SetVisualEnabled(state)
	visualEnabled = state and true or false
	if not visualEnabled then
		safeSpotVisual.Hide()
	end
end

function safeSpot.IsVisualEnabled()
	return visualEnabled
end

function safeSpot.SetShowCandidates(state)
	showCandidatesVisual = state and true or false
	if not showCandidatesVisual then
		safeSpotVisual.HideCandidates()
	end
end

function safeSpot.IsShowCandidates()
	return showCandidatesVisual
end

function safeSpot.SetEnabled(state)
	enabled = state and true or false
	if not enabled then
		safeSpotVisual.Hide()
	end
end

function safeSpot.IsEnabled()
	return enabled
end

function safeSpot.SetSafetyBuffer(val)
	if type(val) == "number" and val >= 0 then
		safetyBuffer = val
	end
end

function safeSpot.GetSafetyBuffer()
	return safetyBuffer
end

function safeSpot.SetFinePassEnabled(state)
	finePassEnabled = state and true or false
end

function safeSpot.IsFinePassEnabled()
	return finePassEnabled
end

function safeSpot.SetFallbackPassEnabled(state)
	fallbackPassEnabled = state and true or false
end

function safeSpot.IsFallbackPassEnabled()
	return fallbackPassEnabled
end

-- Lắng nghe hồi sinh nhân vật để dọn visual cũ
local function hookRespawn()
	local lp = player or Players.LocalPlayer
	if not lp then return end
	lp.CharacterAdded:Connect(function()
		safeSpot.Clear()
	end)
end
hookRespawn()

-- Lắng nghe room thay đổi hoặc hết quái để lập tức dọn sạch Safe Spot cũ
if shared.OnRoomIndexChanged then
	shared.OnRoomIndexChanged(function()
		safeSpot.Clear()
	end)
end

if shared.OnEnemyChanged then
	shared.OnEnemyChanged(function()
		if shared.GetEnemyCount and shared.GetEnemyCount() == 0 then
			safeSpot.Clear()
		end
	end)
end

if shared.OnLobbyChanged then
	shared.OnLobbyChanged(function()
		safeSpot.Clear()
	end)
end

if shared.OnBossActiveChanged then
	shared.OnBossActiveChanged(function()
		safeSpot.Clear()
	end)
end

-- Khởi động tracking
startTracking()

-- Dọn dẹp khi shutdown
lifecycle.Register(function()
	safeSpot.Cleanup()
end)

return safeSpot
end function __DIST.w()-- HazardScanner – Dodge Controller (DungeonQuest).
-- Quản lý logic tự động né đòn (Auto-Dodge):
-- Di chuyển bằng Humanoid:Move() về hướng Safe Spot và thực hiện Snap pha cuối khi tới gần (flatDist <= snapDistance)
-- để đảm bảo nhân vật đáp đúng 100% tọa độ an toàn, triệt tiêu sai số quán tính của Roblox physics.

--// Imports

local services = __DIST.load('a')
local shared = __DIST.load('c')
local lifecycle = __DIST.load('b')
local playerVisual = __DIST.load('s')
local safeSpot = __DIST.load('v')
local contextual = __DIST.load('q')

local RunService = services.RunService or game:GetService("RunService")
local Players = game:GetService("Players")
local player = services.player

--// Table
local dodgeController = {}

--// State
local enabled = false
local snapDistance = 2.0 -- studs (khoảng cách pha cuối để snap chuẩn xác vào vị trí)
local isDodging = false
local activeTargetSpot = nil
local heartbeatConnection = nil
local dodgeStateCallbacks = {}

--// Lấy Humanoid và HumanoidRootPart của người chơi
local function getPlayerComponents()
	local lp = player or Players.LocalPlayer
	if not lp then return nil, nil, nil end
	local char = lp.Character
	if not char or not char.Parent then return nil, nil, nil end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then return nil, nil, nil end
	local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
	if not root then return nil, nil, nil end
	return char, hum, root
end

--// ControlModule management (ngăn Roblox ControlModule ghi đè Move(0,0,0) mỗi frame)
local function disableControls()
	if shared.DisableControls then
		shared.DisableControls("Dodge")
	end
end

local function enableControls()
	if shared.EnableControls then
		shared.EnableControls("Dodge")
	end
end

--// Per-frame Move Driver (cấp vector di chuyển liên tục trước bước tính toán vật lý)
local activeMoveVector = Vector3.zero
local moveDriverConnection = nil

local function startMoveDriver()
	if moveDriverConnection then return end
	local stepSignal = RunService.PreSimulation or RunService.RenderStepped or RunService.Heartbeat
	moveDriverConnection = stepSignal:Connect(function()
		if not isDodging then return end
		local _, hum = getPlayerComponents()
		if hum then
			hum:Move(activeMoveVector, false)
		end
	end)
end

local function stopMoveDriver()
	if moveDriverConnection then
		moveDriverConnection:Disconnect()
		moveDriverConnection = nil
	end
	activeMoveVector = Vector3.zero
end

local function setMoveTarget(targetPos)
	local _, _, root = getPlayerComponents()
	if not root or not targetPos then
		activeMoveVector = Vector3.zero
		return
	end
	local p = root.Position
	local offset = Vector3.new(targetPos.X - p.X, 0, targetPos.Z - p.Z)
	if offset.Magnitude > 0.05 then
		activeMoveVector = offset.Unit
	else
		activeMoveVector = Vector3.zero
	end
end

local function setMoveZero()
	activeMoveVector = Vector3.zero
end

--// Dừng di chuyển của Humanoid
local function stopMove(hum, root)
	setMoveZero()
	stopMoveDriver()
	if hum then
		pcall(function() hum:Move(Vector3.zero, false) end)
	end
	enableControls()
end

--// Vòng lặp Heartbeat: Thực hiện Auto-Dodge khi Player gặp nguy hiểm
local function onHeartbeat()
	if not enabled then
		if isDodging or activeTargetSpot then
			activeTargetSpot = nil
			isDodging = false
			local _, hum, root = getPlayerComponents()
			stopMove(hum, root)
			for _, cb in ipairs(dodgeStateCallbacks) do
				pcall(cb, false, nil, 0)
			end
		end
		return
	end

	local char, hum, root = getPlayerComponents()
	if not char or not hum or not root then
		if isDodging or activeTargetSpot then
			activeTargetSpot = nil
			isDodging = false
			for _, cb in ipairs(dodgeStateCallbacks) do
				pcall(cb, false, nil, 0)
			end
		end
		return
	end

	-- Kiểm tra trạng thái bất tử (sau khi hồi sinh / có Shield bảo vệ) -> Không né, cho phép chạy thẳng tới quái
	if shared.IsInvulnerable and shared.IsInvulnerable() then
		if isDodging or activeTargetSpot then
			activeTargetSpot = nil
			isDodging = false
			local _, hum, root = getPlayerComponents()
			stopMove(hum, root)
			for _, cb in ipairs(dodgeStateCallbacks) do
				pcall(cb, false, nil, 0)
			end
		end
		if safeSpot and safeSpot.Clear then
			safeSpot.Clear()
		end
		return
	end

	-- Kiểm tra nếu mục tiêu hiện tại (Boss) được cấu hình tắt né đòn hoặc tắt Hazard Scanner trong Contextual
	if (contextual.IsActiveDodgeDisabled and contextual.IsActiveDodgeDisabled())
		or (contextual.IsActiveHazardScannerEnabled and not contextual.IsActiveHazardScannerEnabled()) then
		if isDodging or activeTargetSpot then
			activeTargetSpot = nil
			isDodging = false
			local _, hum, root = getPlayerComponents()
			stopMove(hum, root)
			for _, cb in ipairs(dodgeStateCallbacks) do
				pcall(cb, false, nil, 0)
			end
		end
		if safeSpot and safeSpot.Clear then
			safeSpot.Clear()
		end
		return
	end

	-- Kiểm tra xem Player có đang trong nguy hiểm hoặc có Safe Spot từ engine không
	local inDanger = playerVisual.IsPlayerInDanger and playerVisual.IsPlayerInDanger()
	local targetSpot, distToSpot, isFinding = safeSpot.GetLastSafeSpot()

	-- Nếu có Safe Spot mới được tính ra, đồng bộ làm mục tiêu né chính
	if targetSpot then
		activeTargetSpot = targetSpot
	end

	-- Kiểm tra xem mục tiêu activeTargetSpot có còn hợp lệ và an toàn không
	local isTargetStillSafe = activeTargetSpot and safeSpot.IsPointSafe and safeSpot.IsPointSafe(activeTargetSpot)

	if activeTargetSpot and isTargetStillSafe then
		local playerPos = root.Position
		local flatDelta = Vector3.new(activeTargetSpot.X - playerPos.X, 0, activeTargetSpot.Z - playerPos.Z)
		local flatDist = flatDelta.Magnitude

		-- Pha 1: Snap pha cuối khi cự ly đã vào phạm vi an toàn cực gần
		if flatDist <= snapDistance then
			-- Giữ nguyên độ cao Y và góc xoay hiện tại của nhân vật
			local currentCF = root.CFrame
			local targetWorldPos = Vector3.new(activeTargetSpot.X, playerPos.Y, activeTargetSpot.Z)
			local targetCF = CFrame.new(targetWorldPos) * (currentCF - currentCF.Position)

			char:PivotTo(targetCF)
			stopMove(hum, root)

			local reachedSpot = activeTargetSpot
			activeTargetSpot = nil

			if isDodging then
				isDodging = false
				for _, cb in ipairs(dodgeStateCallbacks) do
					pcall(cb, false, reachedSpot, flatDist)
				end
			end
		else
			-- Pha 2: Di chuyển bằng Move Driver (theo cơ chế PathRecord) về hướng Safe Spot
			if not isDodging then
				isDodging = true
				disableControls()
				startMoveDriver()
				for _, cb in ipairs(dodgeStateCallbacks) do
					pcall(cb, true, activeTargetSpot, flatDist)
				end
			end
			setMoveTarget(activeTargetSpot)
		end
	else
		-- Khi đã an toàn và hoàn tất né / hoặc không còn Safe Spot hợp lệ
		if isDodging or activeTargetSpot then
			activeTargetSpot = nil
			isDodging = false
			stopMove(hum, root)
			for _, cb in ipairs(dodgeStateCallbacks) do
				pcall(cb, false, nil, 0)
			end
		end
	end
end

--// Khởi động tracking
local function startTracking()
	if not heartbeatConnection then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

--// Xóa sạch trạng thái né đòn hiện tại (khi hết quái, đổi room, hoặc an toàn)
function dodgeController.Clear()
	if isDodging or activeTargetSpot then
		activeTargetSpot = nil
		isDodging = false
		local _, hum, root = getPlayerComponents()
		stopMove(hum, root)
		for _, cb in ipairs(dodgeStateCallbacks) do
			pcall(cb, false, nil, 0)
		end
	end
end

--// Dọn dẹp
function dodgeController.Cleanup()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	dodgeController.Clear()
end

--// Public APIs
function dodgeController.SetEnabled(state)
	enabled = state and true or false
	if not enabled then
		local _, hum, root = getPlayerComponents()
		stopMove(hum, root)
		activeTargetSpot = nil
		isDodging = false
	end
end

function dodgeController.IsEnabled()
	return enabled
end

function dodgeController.SetSnapDistance(val)
	if type(val) == "number" and val >= 0.5 then
		snapDistance = val
	end
end

function dodgeController.GetSnapDistance()
	return snapDistance
end

function dodgeController.IsDodging()
	return isDodging
end

function dodgeController.OnDodgeStateChanged(callback)
	if type(callback) == "function" then
		table.insert(dodgeStateCallbacks, callback)
	end
end

-- Lắng nghe room thay đổi hoặc hết quái để lập tức hủy lệnh né cũ
if shared.OnRoomIndexChanged then
	shared.OnRoomIndexChanged(function()
		dodgeController.Clear()
	end)
end

if shared.OnEnemyChanged then
	shared.OnEnemyChanged(function()
		if shared.GetEnemyCount and shared.GetEnemyCount() == 0 then
			dodgeController.Clear()
		end
	end)
end

if shared.OnLobbyChanged then
	shared.OnLobbyChanged(function()
		dodgeController.Clear()
	end)
end

if shared.OnBossActiveChanged then
	shared.OnBossActiveChanged(function()
		dodgeController.Clear()
	end)
end

-- Tự động kích hoạt tracking
startTracking()

-- Dọn dẹp khi shutdown
lifecycle.Register(function()
	dodgeController.Cleanup()
end)

return dodgeController
end function __DIST.x()-- HazardScanner (DungeonQuest) – Facade: quét hiểm họa + vẽ SelectionBox đơn giản.
-- Đơn giản hóa hoàn toàn: chỉ phát hiện đối tượng xuất hiện trong Workspace qua
-- ChildAdded/ChildRemoved sau sự kiện start dungeon, vẽ SelectionBox quanh từng đối tượng.
-- Không còn trajectory / whitelist / boss orb / ngoại lệ / hitbox padding / tên 3D.
-- Đường dẫn require "@routes/DungeonQuest/core/hazardScanner" vẫn giữ nguyên (init.luau).

--// Imports

local lifecycle = __DIST.load('b')
local zoneGuard = __DIST.load('e')
local detection = __DIST.load('r')
local geometry = __DIST.load('j')
local visualizer = __DIST.load('k')
local trajectory = __DIST.load('m')
local playerVisual = __DIST.load('s')
local safeSpot = __DIST.load('v')
local dodgeController = __DIST.load('w')
local timerVisual = __DIST.load('l')

--// Table
local hazardScanner = {}

--// Bind data sources (tranh vong phu thuoc)
geometry.BindDetection(detection)
visualizer.BindDetection(detection)
visualizer.BindTrajectory(trajectory)
trajectory.BindDetection(detection)
timerVisual.BindDetection(detection)

--// Geometry (Danger Zones)
hazardScanner.IsPointInAnyHazard = geometry.IsPointInAnyHazard
hazardScanner.GetHazardPadding = geometry.GetHazardPadding
hazardScanner.SetHazardPadding = geometry.SetHazardPadding
hazardScanner.GetHitboxPadding = geometry.GetHazardPadding
hazardScanner.SetHitboxPadding = geometry.SetHazardPadding
hazardScanner.GetTrajectoryMargin = geometry.GetTrajectoryMargin
hazardScanner.SetTrajectoryMargin = geometry.SetTrajectoryMargin
hazardScanner.GetHazardZones = geometry.GetHazardZones
hazardScanner.GetNearbyHazards = geometry.GetNearbyHazards
hazardScanner.AddForceCircleName = geometry.AddForceCircleName
hazardScanner.GetForceCircleNames = geometry.GetForceCircleNames
hazardScanner.IsForceCircle = geometry.IsForceCircle
hazardScanner.IsSecondBossCircleChain = geometry.IsSecondBossCircleChain
hazardScanner.GetSecondBossCircleDuration = geometry.GetSecondBossCircleDuration
hazardScanner.SetSecondBossCircleDuration = geometry.SetSecondBossCircleDuration

--// Player 2D Visualizer & Danger Detection
hazardScanner.IsPlayerInDanger = playerVisual.IsPlayerInDanger
hazardScanner.GetPlayerThreat = playerVisual.GetCurrentThreat
hazardScanner.OnPlayerDangerChanged = playerVisual.OnDangerStatusChanged
hazardScanner.SetPlayerVisualEnabled = playerVisual.SetVisualEnabled
hazardScanner.IsPlayerVisualEnabled = playerVisual.IsVisualEnabled
hazardScanner.SetPlayerHitboxRadius = playerVisual.SetRadius
hazardScanner.GetPlayerHitboxRadius = playerVisual.GetRadius

--// Safe Spot Engine (Radial Escape)
hazardScanner.FindNearestSafeSpot = safeSpot.FindNearestSafeSpot
hazardScanner.IsPointSafe = safeSpot.IsPointSafe
hazardScanner.GetLastSafeSpot = safeSpot.GetLastSafeSpot
hazardScanner.OnSafeSpotChanged = safeSpot.OnSafeSpotChanged
hazardScanner.SetSafeSpotVisualEnabled = safeSpot.SetVisualEnabled
hazardScanner.IsSafeSpotVisualEnabled = safeSpot.IsVisualEnabled
hazardScanner.SetSafeSpotEnabled = safeSpot.SetEnabled
hazardScanner.IsSafeSpotEnabled = safeSpot.IsEnabled
hazardScanner.SetSafeSpotBuffer = safeSpot.SetSafetyBuffer
hazardScanner.GetSafeSpotBuffer = safeSpot.GetSafetyBuffer
hazardScanner.SetShowCandidates = safeSpot.SetShowCandidates
hazardScanner.IsShowCandidates = safeSpot.IsShowCandidates
hazardScanner.SetFinePassEnabled = safeSpot.SetFinePassEnabled
hazardScanner.IsFinePassEnabled = safeSpot.IsFinePassEnabled
hazardScanner.SetFallbackPassEnabled = safeSpot.SetFallbackPassEnabled
hazardScanner.IsFallbackPassEnabled = safeSpot.IsFallbackPassEnabled
hazardScanner.ClearSafeSpot = safeSpot.Clear

--// Auto Dodge Controller (MoveTo + Final Snap)
hazardScanner.SetAutoDodgeEnabled = dodgeController.SetEnabled
hazardScanner.IsAutoDodgeEnabled = dodgeController.IsEnabled
hazardScanner.SetDodgeSnapDistance = dodgeController.SetSnapDistance
hazardScanner.GetDodgeSnapDistance = dodgeController.GetSnapDistance
hazardScanner.IsCurrentlyDodging = dodgeController.IsDodging
hazardScanner.OnDodgeStateChanged = dodgeController.OnDodgeStateChanged
hazardScanner.ClearDodge = dodgeController.Clear

--// Ground Visualizer (Debug Danger Zones)
hazardScanner.SetVisualizerEnabled = visualizer.SetEnabled
hazardScanner.IsVisualizerEnabled = visualizer.IsEnabled
hazardScanner.RefreshVisuals = visualizer.RefreshAll

--// Trajectory Visualizer (Orange Corridor)
hazardScanner.SetTrajectoryEnabled = trajectory.SetEnabled
hazardScanner.IsTrajectoryEnabled = trajectory.IsEnabled
hazardScanner.SetTrajectoryLength = trajectory.SetPredictionLength
hazardScanner.GetTrajectoryLength = trajectory.GetPredictionLength
hazardScanner.GetHazardTrajectoryLength = trajectory.GetHazardPredictionLength
hazardScanner.GetCustomTrajectoryLength = trajectory.GetCustomLength
hazardScanner.SetCustomTrajectoryLength = trajectory.SetCustomLength
hazardScanner.GetSecondBossBeamLength = trajectory.GetSecondBossBeamLength
hazardScanner.SetSecondBossBeamLength = trajectory.SetSecondBossBeamLength
hazardScanner.GetFirstBossBigSpikeWidth = trajectory.GetFirstBossBigSpikeWidth
hazardScanner.SetFirstBossBigSpikeWidth = trajectory.SetFirstBossBigSpikeWidth
hazardScanner.GetFirstBossSeekingSpikeWidth = trajectory.GetFirstBossSeekingSpikeWidth
hazardScanner.SetFirstBossSeekingSpikeWidth = trajectory.SetFirstBossSeekingSpikeWidth
hazardScanner.GetCustomTrajectoryWidth = trajectory.GetCustomWidth
hazardScanner.SetCustomTrajectoryWidth = trajectory.SetCustomWidth
hazardScanner.RefreshTrajectory = trajectory.RefreshAll
hazardScanner.IsPointInAnyTrajectory = trajectory.IsPointInAnyTrajectory
hazardScanner.GetNearbyTrajectories = trajectory.GetNearbyTrajectories

--// 3D Selection Box (Parts)
hazardScanner.SetSelectionBoxesEnabled = detection.SetSelectionBoxesEnabled
hazardScanner.IsSelectionBoxesEnabled = detection.IsSelectionBoxesEnabled

--// 3D Lifespan Timer Visualizer (Real-time Danger Zone Duration)
hazardScanner.SetTimerVisualEnabled = timerVisual.SetEnabled
hazardScanner.IsTimerVisualEnabled = timerVisual.IsEnabled
hazardScanner.RefreshTimerVisuals = timerVisual.RefreshAll

--// Detection (Scan + SelectionBox)
hazardScanner.StartDetection = detection.StartScan
hazardScanner.StopDetection = detection.StopScan
hazardScanner.IsDetectionEnabled = detection.IsEnabled
hazardScanner.SetDetectionEnabled = detection.SetEnabled

hazardScanner.SetLogHazards = detection.SetLogHazards
hazardScanner.IsLogHazardsEnabled = detection.IsLogHazardsEnabled
-- Backward compatibility aliases
hazardScanner.SetLogThreats = hazardScanner.SetLogHazards
hazardScanner.IsLogThreatsEnabled = hazardScanner.IsLogHazardsEnabled

hazardScanner.SetLogFailed = detection.SetLogFailed
hazardScanner.IsLogFailedEnabled = detection.IsLogFailedEnabled

--// Skill Deep Inspector (Debug By Name)
hazardScanner.SetInspectTarget = detection.SetInspectTarget
hazardScanner.GetInspectTarget = detection.GetInspectTarget
hazardScanner.SetInspectEnabled = detection.SetInspectEnabled
hazardScanner.IsInspectEnabled = detection.IsInspectEnabled

hazardScanner.GetHazardCount = detection.GetHazardCount
hazardScanner.GetActiveHazards = detection.GetActiveHazards
hazardScanner.GetActiveHazardsMap = detection.GetActiveHazardsMap
hazardScanner.GetActiveTrajectoriesList = trajectory.GetActiveTrajectoriesList
hazardScanner.GetLastHazardInfo = detection.GetLastHazardInfo
hazardScanner.OnHazardChanged = detection.OnHazardChanged
hazardScanner.ClearAllHazards = detection.ClearAllHazards
hazardScanner.TriggerRoomTransition = detection.TriggerRoomTransition
hazardScanner.IsRoomTransitioning = detection.IsRoomTransitioning

--// Bật scanner: bắt đầu quét Workspace
function hazardScanner.StartScan()
	if not zoneGuard.IsDungeon() then return end
	detection.StartScan()
end

--// Tắt scanner: dừng quét + dọn visual
function hazardScanner.StopScan()
	detection.StopScan()
end

--// Toggle độc lập (UI)
function hazardScanner.Toggle(state)
	if state then
		hazardScanner.StartScan()
	else
		hazardScanner.StopScan()
	end
end

function hazardScanner.IsEnabled()
	return detection.IsEnabled()
end

--// Register with ZoneGuard
zoneGuard.Register({
	Name = "HazardScanner",
	Zone = "Dungeon",
	OnLeave = function()
		detection.StopScan()
	end,
	OnEnter = function()
		if detection.IsEnabled() then
			detection.StartScan()
		end
	end,
})

--// Dọn dẹp toàn diện khi shutdown
lifecycle.Register(function()
	detection.StopScan()
end)

return hazardScanner end function __DIST.y()-- Auto Farm System – Smart Auto Skill Manager (DungeonQuest)
-- Quản lý logic kích hoạt skill thông minh chạy HOÀN TOÀN ĐỘC LẬP VÀ SONG SONG:
-- - Có vòng lặp Heartbeat riêng, không bị phụ thuộc/chặn bởi Auto Farm di chuyển hay Auto Dodge né đòn.
-- - Cast Q và Cast E trong task.spawn riêng biệt, không block lẫn nhau và không block luồng game.
--
-- Logic:
-- 1. Skill Q (Buff Damage & Speed): Tự động kích hoạt/spam khi có Enemy tồn tại còn sống trên map.
-- 2. Skill E (Damage Skill): Chỉ kích hoạt khi:
--    - Khoảng cách 2D tới mục tiêu <= Skill E Cast Range (Slider độc lập).
--    - Chiêu Q đang có hiệu lực buff (trong khoảng thời gian Buff Duration sau khi kích hoạt chiêu Q).


local services = __DIST.load('a')
local shared = __DIST.load('c')
local lifecycle = __DIST.load('b')
local tracker = __DIST.load('h')

local RunService = services.RunService or game:GetService("RunService")
local VirtualInputManager = services.VirtualInputManager or game:GetService("VirtualInputManager")
local player = services.player

local autoSkill = {}

--// State
local enabled = false
local skillERange = 35.0 -- studs (Khoảng cách cast chiêu E độc lập)
local spamInterval = 0.15 -- giây giữa các lần bấm phím
local buffDuration = 4.0 -- giây (thời gian hiệu lực của buff sau khi kích hoạt chiêu Q)

local lastCastQ = 0
local lastCastE = 0
local isCastingQ = false
local isCastingE = false
local heartbeatConnection = nil
local remoteConnection = nil
local lastBuffTime = -math.huge
local prevQCooldown = 0

function autoSkill.IsEnabled()
	return enabled
end

-- Forward declaration
local startHeartbeat, stopHeartbeat

function autoSkill.SetEnabled(state)
	local want = state == true
	if want == enabled then return end
	enabled = want
	if enabled then
		startHeartbeat()
	else
		stopHeartbeat()
	end
end

-- Aliases for backward compatibility
autoSkill.IsSkillQEnabled = autoSkill.IsEnabled
autoSkill.SetSkillQEnabled = autoSkill.SetEnabled
autoSkill.IsSkillEEnabled = autoSkill.IsEnabled
autoSkill.SetSkillEEnabled = autoSkill.SetEnabled

function autoSkill.GetSkillERange()
	return skillERange
end

function autoSkill.SetSkillERange(val)
	if type(val) == "number" and val >= 2 then
		skillERange = val
	end
end

function autoSkill.GetSpamInterval()
	return spamInterval
end

function autoSkill.SetSpamInterval(val)
	if type(val) == "number" and val >= 0.05 then
		spamInterval = val
	end
end

function autoSkill.GetBuffDuration()
	return buffDuration
end

function autoSkill.SetBuffDuration(val)
	if type(val) == "number" and val >= 0.5 then
		buffDuration = val
	end
end

--// Kiểm tra xem chiêu Q (Buff) có đang có hiệu lực hay không dựa vào thời gian buffDuration
function autoSkill.IsBuffActive()
	return (os.clock() - lastBuffTime) < buffDuration
end

--// Kích hoạt hoặc làm mới thời điểm buff thủ công/bên ngoài
function autoSkill.TriggerBuff()
	lastBuffTime = os.clock()
end

function autoSkill.GetLastBuffTime()
	return lastBuffTime
end

function autoSkill.GetRemainingBuffTime()
	local rem = buffDuration - (os.clock() - lastBuffTime)
	return rem > 0 and rem or 0
end

--// Lấy Tool ở slot Q (Backpack hoặc Character)
local function getSlotQTool()
	local lp = player or game:GetService("Players").LocalPlayer
	if not lp then return nil end

	local backpack = lp:FindFirstChild("Backpack")
	if backpack then
		for _, child in ipairs(backpack:GetChildren()) do
			local slot = child:FindFirstChild("abilitySlot")
			if slot and string.lower(tostring(slot.Value)) == "q" then
				return child
			end
		end
	end

	local char = lp.Character
	if char then
		for _, child in ipairs(char:GetChildren()) do
			if child:IsA("Tool") then
				local slot = child:FindFirstChild("abilitySlot")
				if slot and string.lower(tostring(slot.Value)) == "q" then
					return child
				end
			end
		end
	end

	return nil
end

--// Lấy cooldown hiện tại của chiêu Q (trả về số giây còn lại, hoặc nil nếu không tìm thấy)
local function getSlotQCooldown()
	local tool = getSlotQTool()
	if tool then
		local cd = tool:FindFirstChild("cooldown")
		if cd and typeof(cd.Value) == "number" then
			return cd.Value
		end
	end
	return nil
end

--// Kiểm tra và cập nhật thời điểm buff dựa vào cooldown của Tool Q
local function checkCooldownActivation(now)
	local cd = getSlotQCooldown()
	if cd ~= nil then
		-- Cooldown tăng vọt từ <= 0.2 lên > 0.5: chiêu Q vừa được kích hoạt thành công
		if cd > (prevQCooldown + 0.5) or (prevQCooldown <= 0.2 and cd > 0.5) then
			lastBuffTime = now
		end
		prevQCooldown = cd
	end
end

--// Lắng nghe RemoteEvent abilityCast từ game khi người chơi cast chiêu
local function setupRemoteListener()
	if remoteConnection then return end
	pcall(function()
		local rs = services.ReplicatedStorage or game:GetService("ReplicatedStorage")
		local remotes = rs and rs:FindFirstChild("remotes")
		local abilityCast = remotes and remotes:FindFirstChild("abilityCast")
		if abilityCast and abilityCast:IsA("RemoteEvent") then
			remoteConnection = abilityCast.OnClientEvent:Connect(function(caster, abilityName)
				local lp = player or game:GetService("Players").LocalPlayer
				if caster == lp then
					local tool = getSlotQTool()
					if (tool and tool.Name == abilityName) or (not tool) then
						lastBuffTime = os.clock()
					end
				end
			end)
		end
	end)
end

local function cleanupRemoteListener()
	if remoteConnection then
		pcall(function()
			remoteConnection:Disconnect()
		end)
		remoteConnection = nil
	end
end

--// Lấy HumanoidRootPart của người chơi
local function getPlayerRoot()
	local lp = player or game:GetService("Players").LocalPlayer
	local char = lp and lp.Character
	local root = char and (char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart)
	if root and root.Parent then return root end
	return nil
end

--// Lấy Enemy mục tiêu tốt nhất và tính khoảng cách 2D phẳng (X-Z)
local function getBestEnemyAndDistance()
	local root = getPlayerRoot()
	if not root then return nil, math.huge, false end
	local playerPos = root.Position

	-- 1. Ưu tiên target hiện tại của AutoFarm Tracker
	local curTarget = tracker.GetTarget and tracker.GetTarget()
	if curTarget and curTarget.Root and curTarget.Root.Parent then
		local hum = curTarget.Humanoid or (curTarget.Model and curTarget.Model:FindFirstChildOfClass("Humanoid"))
		if hum and hum.Health > 0 then
			local ePos = curTarget.Root.Position
			local flatDist = Vector3.new(ePos.X - playerPos.X, 0, ePos.Z - playerPos.Z).Magnitude
			return curTarget, flatDist, true
		end
	end

	-- 2. Tìm quái sống gần nhất từ shared.GetTrackedEnemyData()
	local tracked = shared.GetTrackedEnemyData and shared.GetTrackedEnemyData()
	local closestTarget = nil
	local closestDistSq = math.huge
	local hasAnyLivingEnemy = false

	if tracked and #tracked > 0 then
		for _, data in ipairs(tracked) do
			if data and data.Root and data.Root.Parent then
				local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
				if hum and hum.Health > 0 then
					hasAnyLivingEnemy = true
					local ePos = data.Root.Position
					local dx = ePos.X - playerPos.X
					local dz = ePos.Z - playerPos.Z
					local distSq = dx * dx + dz * dz
					if distSq < closestDistSq then
						closestDistSq = distSq
						closestTarget = data
					end
				end
			end
		end
	end

	local closestFlatDist = closestDistSq < math.huge and math.sqrt(closestDistSq) or math.huge
	return closestTarget, closestFlatDist, hasAnyLivingEnemy
end

--// Bấm và nhả phím Q đơn lập (Buff) trong luồng độc lập
function autoSkill.CastSkillQ()
	if isCastingQ then return end
	isCastingQ = true
	task.spawn(function()
		local holdTime = (shared.GetKeyHoldTime and shared.GetKeyHoldTime()) or 0.05
		pcall(function()
			VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
		end)
		task.wait(holdTime)
		pcall(function()
			VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
		end)
		isCastingQ = false
	end)
end

--// Bấm và nhả phím E đơn lập (Damage) trong luồng độc lập
function autoSkill.CastSkillE()
	if isCastingE then return end
	isCastingE = true
	task.spawn(function()
		local holdTime = (shared.GetKeyHoldTime and shared.GetKeyHoldTime()) or 0.05
		pcall(function()
			VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
		end)
		task.wait(holdTime)
		pcall(function()
			VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
		end)
		isCastingE = false
	end)
end

--// Vòng lặp chính xử lý Smart Skills độc lập trên Heartbeat
local function onHeartbeat()
	if not enabled or shared.IsInLobby() then return end

	local root = getPlayerRoot()
	if not root then return end

	local char = root.Parent
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then return end

	local target, flatDist, hasEnemy = getBestEnemyAndDistance()
	local now = os.clock()

	-- Cập nhật kích hoạt buff nếu phát hiện cooldown Q bắt đầu
	checkCooldownActivation(now)

	-- 1. Xử lý Skill Q (Buff): Kích hoạt song song khi có Enemy tồn tại trên map
	if (now - lastCastQ >= spamInterval) and not isCastingQ then
		if hasEnemy then
			local qCd = getSlotQCooldown()
			-- Nếu biết rõ Q đang cooldown (> 0.2s) thì không cần spam phím vô ích
			local isQReady = (qCd == nil) or (qCd <= 0.2)
			if isQReady then
				lastCastQ = now
				autoSkill.CastSkillQ()
				-- Fallback: Nếu không đọc được tool cooldown và buff hiện tại đã hết
				if qCd == nil and not autoSkill.IsBuffActive() then
					lastBuffTime = now
				end
			end
		end
	end

	-- 2. Xử lý Skill E (Damage): Kích hoạt song song khi có Target, nằm trong tầm range độc lập VÀ chiêu Q đang buff
	if (now - lastCastE >= spamInterval) and not isCastingE then
		if target and flatDist <= skillERange then
			local buffActive = autoSkill.IsBuffActive()
			if buffActive then
				lastCastE = now
				autoSkill.CastSkillE()
			end
		end
	end
end

startHeartbeat = function()
	if not heartbeatConnection then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
	setupRemoteListener()
end

stopHeartbeat = function()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	cleanupRemoteListener()
	isCastingQ = false
	isCastingE = false
	prevQCooldown = 0
	lastBuffTime = -math.huge
end

-- Hook trực tiếp Step từ bên ngoài nếu cần
function autoSkill.Step(deltaTime, currentTarget, flatDistToTarget)
	-- Heartbeat riêng đã tự động xử lý 100% song song và độc lập
end

lifecycle.Register(function()
	autoSkill.SetEnabled(false)
end)

return autoSkill
end end-- Auto Farm System – Component G: State / Interrupt Manager & Facade
-- Spec: Sections 2, 16, 17, 18, 19, 20 (Roblox_Target_Movement_System_AI_Spec.txt)

--// Imports

local services = __DIST.load('a')
local shared = __DIST.load('c')
local lifecycle = __DIST.load('b')
local coordinator = __DIST.load('d')
local zoneGuard = __DIST.load('e')

local scanner = __DIST.load('f')
local selector = __DIST.load('g')
local tracker = __DIST.load('h')
local movement = __DIST.load('i')
local hazardScanner = __DIST.load('x')
local autoSkill = __DIST.load('y')
local contextual = __DIST.load('q')

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

--// ControlModule management (uỷ quyền qua shared để đồng bộ với Dodge và PathRecord)
local function disableControls()
	if shared.DisableControls then
		shared.DisableControls("AutoFarm")
	end
end

local function enableControls()
	if shared.EnableControls then
		shared.EnableControls("AutoFarm")
	end
end

--// Per-frame Move Driver (cấp vector di chuyển liên tục trước bước tính toán vật lý)
local activeMoveVector = Vector3.zero
local moveDriverConnection = nil

local function startMoveDriver()
	if moveDriverConnection then return end
	local stepSignal = RunService.PreSimulation or RunService.RenderStepped or RunService.Heartbeat
	moveDriverConnection = stepSignal:Connect(function()
		if not running or isPaused then return end
		-- Nếu Auto-Dodge đang hoạt động: nhường 100% quyền cho DodgeController, không can thiệp vào Move!
		if hazardScanner.IsCurrentlyDodging and hazardScanner.IsCurrentlyDodging() then
			return
		end
		local hum = shared.GetHumanoid()
		if hum then
			hum:Move(activeMoveVector, false)
		end
	end)
end

local function stopMoveDriver()
	if moveDriverConnection then
		moveDriverConnection:Disconnect()
		moveDriverConnection = nil
	end
	activeMoveVector = Vector3.zero
end

local function setMoveVector(dir)
	if dir and dir.Magnitude > 0.05 then
		activeMoveVector = Vector3.new(dir.X, 0, dir.Z).Unit
	else
		activeMoveVector = Vector3.zero
	end
end

local function setMoveZero()
	activeMoveVector = Vector3.zero
end

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
	if not zoneGuard.IsDungeon() or not dunReady then return end

	local playerRoot = getPlayerRoot()
	local humanoid = shared.GetHumanoid()
	if not playerRoot or not humanoid or humanoid.Health <= 0 then
		return
	end

	local playerPos = getSafePosition(playerRoot)
	if not playerPos then return end

	-- Nếu Auto-Dodge đang chủ động né nguy hiểm -> tạm nhường quyền điều khiển di chuyển
	if hazardScanner.IsCurrentlyDodging and hazardScanner.IsCurrentlyDodging() then
		activeMoveVector = Vector3.zero
		return
	end

	-- Nếu đang tạm dừng di chuyển (giữ vị trí khi combat hoặc né) -> không bước tiếp
	if isPaused then
		activeMoveVector = Vector3.zero
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
			setMoveZero()
			pcall(function() humanoid.AutoRotate = true end)
			evaluateTarget()
			return
		end
	end

	-- Priority 1b: No target
	if not target or currentState == State.NO_TARGET then
		currentDestination = nil
		currentDestMode = "None"
		lastBlockerData = nil
		setMoveZero()
		pcall(function() humanoid.AutoRotate = true end)
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
		setMoveZero()
		pcall(function() humanoid.AutoRotate = true end)
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
		local enterDelta = Vector3.new(bossAreaCenter.X - playerPos.X, 0, bossAreaCenter.Z - playerPos.Z)
		local enterDir = enterDelta.Magnitude > 0.1 and enterDelta.Unit or Vector3.new(0, 0, 1)
		local enterTarget = Vector3.new(bossAreaCenter.X, playerPos.Y, bossAreaCenter.Z)
		currentState = State.CHASE
		currentDestMode = "Enter Boss Area"
		currentDestination = enterTarget
		stuckTimer = 0
		setMoveVector(enterDir)
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

	-- Xác định xem có cần né / kiểm tra nguy hiểm không (bỏ qua nếu bất tử, tắt dodge toàn cục hoặc tắt dodge/scanner riêng theo boss)
	local isInvulnerable = shared.IsInvulnerable and shared.IsInvulnerable()
	local isDodgeDisabled = contextual.IsActiveDodgeDisabled and contextual.IsActiveDodgeDisabled(target)
	local isHazardScannerEnabled = not (contextual.IsActiveHazardScannerEnabled and not contextual.IsActiveHazardScannerEnabled(target))
	local isAutoDodgeEnabled = hazardScanner.IsAutoDodgeEnabled and hazardScanner.IsAutoDodgeEnabled()
	local shouldCheckDanger = not isInvulnerable and not isDodgeDisabled and isHazardScannerEnabled and isAutoDodgeEnabled and hazardScanner and hazardScanner.IsPointSafe

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
					setMoveZero()
					return
				end
			end
		end

		-- Kiểm tra xem điểm lùi về có an toàn không (bỏ qua nếu đang bất tử sau hồi sinh hoặc tắt Dodge)
		local isBackSafe = true
		if shouldCheckDanger then
			isBackSafe = hazardScanner.IsPointSafe(backTarget, 0.5)
		end

		if not isBackSafe then
			currentState = State.HOLD
			currentDestMode = "Hold (Danger Behind)"
			currentDestination = nil
			stuckTimer = 0
			setMoveZero()
		else
			currentState = State.KITE
			currentDestMode = "Kite"
			stuckTimer = 0
			currentDestination = backTarget
			setMoveVector(awayDir)
		end
	elseif flatDist <= maxCombatDistance then
		-- Case 2: Nằm trong khoảng lý tưởng [minCombatDistance, maxCombatDistance] -> HOLD
		currentState = State.HOLD
		currentDestination = nil
		currentDestMode = "Hold"
		stuckTimer = 0
		setMoveZero()
	else
		-- Case 3: Quá xa (> maxCombatDistance) -> CHASE / Tiến thẳng lại gần mục tiêu
		local approachDir = flatDelta.Magnitude > 0.1 and flatDelta.Unit or Vector3.new(0, 0, 1)

		-- Kiểm tra xem hướng bước tới (Lookahead Points) có đang nằm trong vùng nguy hiểm / đạn bay không
		-- Quét 3 tia song song: Tia trung tâm + 2 tia 2 bên (trái & phải) cách 1.2 studs mô phỏng toàn bộ bề rộng thân nhân vật
		local dangerAhead = false
		if shouldCheckDanger then
			local sideOffset = Vector3.new(-approachDir.Z, 0, approachDir.X) * 1.2

			-- Check các điểm trước mặt ở cự ly 3 studs, 6 studs, 10 studs
			for _, stepDist in ipairs({ 3, 6, 10 }) do
				if stepDist < flatDist then
					local checkPointCenter = playerPos + approachDir * stepDist
					local checkPointLeft = checkPointCenter + sideOffset
					local checkPointRight = checkPointCenter - sideOffset

					if not hazardScanner.IsPointSafe(checkPointCenter, 0.5)
						or not hazardScanner.IsPointSafe(checkPointLeft, 0.5)
						or not hazardScanner.IsPointSafe(checkPointRight, 0.5)
					then
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
			setMoveZero()
		else
			currentState = State.CHASE
			currentDestMode = "Chase"
			local chaseTarget = Vector3.new(enemyPos.X, playerPos.Y, enemyPos.Z)
			currentDestination = chaseTarget

			setMoveVector(approachDir)

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
	if not zoneGuard.IsDungeon() then return end

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
		setMoveZero()
		enableControls()
		local h = shared.GetHumanoid()
		if h and h.Parent then
			pcall(function()
				h.AutoRotate = true
				if not (hazardScanner.IsCurrentlyDodging and hazardScanner.IsCurrentlyDodging()) then
					h:Move(Vector3.zero, false)
				end
			end)
		end
	else
		if enabled and running then
			disableControls()
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
autoFarm.GetBuffDuration = autoSkill.GetBuffDuration
autoFarm.SetBuffDuration = autoSkill.SetBuffDuration
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

		disableControls()
		startMoveDriver()

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
		stopMoveDriver()
		enableControls()
		running = false
		if enemyChangedConnection then enemyChangedConnection(); enemyChangedConnection = nil end
		if respawnConnection then respawnConnection(); respawnConnection = nil end

		setMoveZero()
		local h = shared.GetHumanoid()
		if h and h.Parent then
			pcall(function()
				h.AutoRotate = true
				if not (hazardScanner.IsCurrentlyDodging and hazardScanner.IsCurrentlyDodging()) then
					h:Move(Vector3.zero, false)
				end
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

--// Register with ZoneGuard
zoneGuard.Register({
	Name = "AutoFarm",
	Zone = "Dungeon",
	OnLeave = function()
		if running then
			autoFarm.SetPaused(true)
		end
		cleanupDebugVisuals()
	end,
	OnEnter = function()
		if enabled then
			autoFarm.SetPaused(false)
		end
	end,
})

lifecycle.Register(function()
	autoFarm.Toggle(false)
	cleanupDebugVisuals()
end)

return autoFarm
