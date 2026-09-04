-- Engine dùng chung cho DungeonQuest: quản lý state, tracking dungeon/kẻ địch,
-- speed và các API cho module chuyên biệt (autoFarmPathfinder, webhook, ESP...)
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

local enabled = false
local fastSpeed = 50
local normalSpeed = 16

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

--// Respawn hooks (các module khác đăng ký để reset trạng thái khi respawn)
local respawnCallbacks = {}
local cleanupConnections = {}
local speedConnection = nil

local function trackCleanupConnection(connection)
	if connection then table.insert(cleanupConnections, connection) end
	return connection
end

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
	fireEnemyChanged()
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
	fireEnemyChanged()
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

--// Ensures dungeon tracking is ready (autoFarmPathfinder dùng).
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
		if not dungeon then continue end
		local ok = pcall(function()
			for _, room in ipairs(dungeon:GetChildren()) do
				if room:IsA("Folder") or room:IsA("Model") then
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
			warn("[EnemyTracker] rescan error")
		end
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

--// ---- Room index ----

--// Đọc số room từ tên (room1 -> 1, room12 -> 12...). Trả 0 nếu không khớp.
local function parseRoomNumber(name)
	if type(name) ~= "string" then return 0 end
	local number = string.match(name, "^room(%d+)$")
	if not number then return 0 end
	return tonumber(number) or 0
end

--// Tính room hiện tại: room chứa enemy đang track còn sống.
--// Game clear theo kiểu tuần tự: xong quái room này mới spawn quái room sau, nên
--// tại 1 thời điểm chỉ có đúng 1 room có quái -> room của bất kỳ quái đang track
--// chính là room hiện tại (không cần scan theo khoảng cách).
--// Room nhận diện qua TÊN "room<so>" (room1, room2...). Không có enemy/dungeon -> 0.
local function computeRoomIndex()
	if not dungeon then return 0 end
	for model, data in pairs(trackedEnemies) do
		if data and data.Room then
			local idx = parseRoomNumber(data.Room.Name)
			if idx > 0 then return idx end
		end
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

lifecycle.Register(function()
	if speedConnection then speedConnection:Disconnect(); speedConnection = nil end
	for _, connection in ipairs(cleanupConnections) do
		pcall(function() connection:Disconnect() end)
	end
	table.clear(cleanupConnections)
	resetDungeon()
end)

--// Table
return shared
