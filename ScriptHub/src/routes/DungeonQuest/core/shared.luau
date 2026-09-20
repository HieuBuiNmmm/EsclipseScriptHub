-- Engine dùng chung cho DungeonQuest: quản lý state, tracking dungeon/kẻ địch,
-- speed và các API cho module chuyên biệt (webhook, ESP...)
-- thao tác lên module này để tránh circular dependency.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")

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

--// Cấu trúc room chuẩn của game: workspace.dungeon (level 1) là các folder,
--// MỖI folder = 1 room (tên folder chính là tên room).
--// Map thường có: "initialRoom" (room bắt đầu), "room1".."roomN", và "bossRoom" (boss cuối, KHÔNG đánh số).
local ROOM_INITIAL_NAME = "initialRoom"
local ROOM_BOSS_NAME = "bossRoom"
--// Chỉ dùng để normalize config/API cũ: 103 = mã nội bộ của bossRoom trong ResolveRoomName.
local BOSS_ROOM_INDEX = 103

--// Room identity = TÊN FOLDER của room hiện tại (đúng tên folder level-1 của
--// dungeon, vd "room5", "bossRoom"). Toàn hệ dùng TÊN, không còn layer số.
local roomName = nil
local roomNameCallbacks = {}

--// Thông báo khi cấu trúc room (danh sách folder) THAY ĐỔI: vào dungeon mới, reset dungeon.
--// Dùng để UI refresh dropdown danh sách room thực tế.
local roomStructureCallbacks = {}
local function fireRoomStructureChanged()
	for i = #roomStructureCallbacks, 1, -1 do
		pcall(roomStructureCallbacks[i])
	end
end

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
local refreshRoomName
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
	refreshRoomName()
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
	refreshRoomName()
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
	fireRoomStructureChanged()
	refreshRoomName()
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
		refreshRoomName()
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
	refreshRoomName()
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

--// Tên folder của room hiện tại (danh tính thật). Fallback phòng Boss: bossActive -> "bossRoom".
local function computeRoomName()
	if not dungeon then return nil end
	for model, data in pairs(trackedEnemies) do
		if data and data.Room then
			local name = data.Room.Name
			if type(name) == "string" and name ~= "" then
				return name
			end
		end
	end
	if bossActive then
		return ROOM_BOSS_NAME
	end
	return nil
end

--// Đồng bộ tên room hiện tại (danh tính), fire callback nếu đổi.
refreshRoomName = function()
	local newName = computeRoomName()
	if newName == roomName then return end
	roomName = newName
	for i = #roomNameCallbacks, 1, -1 do
		pcall(roomNameCallbacks[i], roomName)
	end
end

function shared.GetCurrentRoomName(): string?
	return roomName
end

function shared.OnRoomNameChanged(callback)
	if type(callback) ~= "function" then return function() end end
	table.insert(roomNameCallbacks, callback)
	return function()
		for i, cb in ipairs(roomNameCallbacks) do
			if cb == callback then table.remove(roomNameCallbacks, i) break end
		end
	end
end

--// ---- Room structure (Real layout) ----
--// Tên folder chuẩn của bossRoom (boss cuối, folder không đánh số).
function shared.GetBossRoomName()
	return ROOM_BOSS_NAME
end

--// Tên folder room bắt đầu ("initialRoom") và room đầu tiên theo thứ tự ("room1").
function shared.GetInitialRoomName()
	return ROOM_INITIAL_NAME
end

function shared.GetFirstRoomName()
	return "room1"
end

--// Danh sách TÊN room THỰC TẾ của dungeon hiện tại, đọc trực tiếp từ các
--// folder level-1 của workspace.dungeon (tên folder = tên room). Không còn dựa
--// vào quái để ước lượng số room như trước.
--// Trả về { string } đã sort, VD: "initialRoom", "room1".."roomN", "bossRoom".
--// Rỗng nếu chưa có dungeon.
function shared.GetRealRoomNames(): { string }
	local result = {}
	if not dungeon then return result end
	for _, room in ipairs(dungeon:GetChildren()) do
		if room:IsA("Folder") or room:IsA("Model") then
			table.insert(result, room.Name)
		end
	end
	table.sort(result)
	return result
end

--// Danh sách tên room thực tế (tên folder), dùng cho dropdown không cần hardcode.
function shared.GetRoomOptions(): { string }
	return shared.GetRealRoomNames()
end

--// Chuẩn hoá 1 giá trị về TÊN ROOM hợp lệ (tên folder thật).
--// Nhận number (1 -> "room1", 103 -> "bossRoom") hoặc string ("room5",
--// "Room 5", "5", "bossRoom") -> trả tên folder hợp lệ nếu có trong danh sách
--// room thực tế của dungeon hiện tại; else nil. Khi chưa có dungeon cho phép
--// giữ tên (phục vụ config restore).
function shared.ResolveRoomName(value): string?
	if value == nil then return nil end
	local name
	if type(value) == "number" then
		local n = math.floor(value)
		if n == BOSS_ROOM_INDEX then
			name = ROOM_BOSS_NAME
		elseif n <= 0 then
			return nil
		else
			name = ("room%d"):format(n)
		end
	elseif type(value) == "string" then
		local lower = string.lower(value)
		if lower == ROOM_BOSS_NAME or lower == "bossroom" or value == tostring(BOSS_ROOM_INDEX) then
			name = ROOM_BOSS_NAME
		else
			local num = tonumber(value:match("(%d+)"))
			if num then
				name = ("room%d"):format(math.floor(num))
			else
				name = value
			end
		end
	else
		return nil
	end
	local real = shared.GetRealRoomNames()
	if #real > 0 then
		for _, roomName in ipairs(real) do
			if string.lower(roomName) == string.lower(name) then
				return roomName
			end
		end
		return nil
	end
	return name
end

--// Đăng ký callback chạy khi danh sách room thực tế thay đổi (vào dungeon mới/reset).
--// Trả về hàm huỷ.
function shared.OnRoomStructureChanged(callback)
	if type(callback) ~= "function" then return function() end end
	table.insert(roomStructureCallbacks, callback)
	return function()
		for i, cb in ipairs(roomStructureCallbacks) do
			if cb == callback then table.remove(roomStructureCallbacks, i) break end
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
	refreshRoomName()
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
