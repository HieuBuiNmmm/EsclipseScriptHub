-- Auto Reset / Suicide (DungeonQuest): Chủ động tự sát 1 LẦN DUY NHẤT khi bước vào room X chỉ định.
-- Dùng để trigger điểm checkpoint hồi sinh hoặc kích hoạt phase macro tiếp theo.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local notifier = require("@routes/DungeonQuest/core/notifier")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")

local player = services.player

--// State
local autoReset = {}
local enabled = false
local targetRoom = 2
local delaySeconds = 0.0
local hasTriggeredThisRun = false

local roomConn = nil
local lobbyConn = nil
local dungeonConn = nil

--// Thực hiện tự sát / reset nhân vật an toàn
local function executeReset()
	local hum = shared.GetHumanoid()
	local char = player and player.Character

	if hum and hum.Health > 0 then
		pcall(function()
			hum.Health = 0
		end)
		pcall(function()
			hum:ChangeState(Enum.HumanoidStateType.Dead)
		end)
	end

	if char and char.Parent then
		pcall(function()
			char:BreakJoints()
		end)
	end
end

--// Kiểm tra và xử lý tự sát khi vào phòng
local function checkRoomTrigger(currentRoom: number)
	if not enabled or hasTriggeredThisRun then return end
	if shared.IsInLobby() or shared.IsDead() then return end
	if currentRoom <= 0 or currentRoom ~= targetRoom then return end

	-- Đánh dấu đã kích hoạt 1 lần duy nhất trong run này
	hasTriggeredThisRun = true

	task.spawn(function()
		if delaySeconds > 0 then
			task.wait(delaySeconds)
		end

		if not enabled or shared.IsInLobby() or shared.IsDead() then return end
		if shared.GetCurrentRoomIndex() ~= targetRoom then return end

		notifier.Notify("Auto Reset", ("Reset character at Room %d (Once per run)"):format(targetRoom), 3)
		executeReset()
	end)
end

--// Khởi động lắng nghe sự kiện
local function startListening()
	if roomConn then return end

	roomConn = shared.OnRoomIndexChanged(function(currentRoom)
		if currentRoom <= 1 then
			-- Khi bắt đầu lại từ room đầu / room 0 -> reset cờ cho run mới
			hasTriggeredThisRun = false
		end
		checkRoomTrigger(currentRoom)
	end)

	lobbyConn = shared.OnLobbyChanged(function(inLobby)
		if inLobby then
			hasTriggeredThisRun = false
		end
	end)

	dungeonConn = shared.OnDungeonNameChanged(function()
		hasTriggeredThisRun = false
	end)
end

local function stopListening()
	if roomConn then
		roomConn()
		roomConn = nil
	end
	if lobbyConn then
		lobbyConn()
		lobbyConn = nil
	end
	if dungeonConn then
		dungeonConn()
		dungeonConn = nil
	end
end

--// Public APIs
function autoReset.Toggle(state: boolean)
	enabled = state and true or false
	if enabled then
		hasTriggeredThisRun = false
		startListening()
		-- Kiểm tra ngay nếu đang ở đúng room chỉ định
		checkRoomTrigger(shared.GetCurrentRoomIndex())
	else
		stopListening()
	end
end

function autoReset.IsEnabled(): boolean
	return enabled
end

function autoReset.SetTargetRoom(room: number)
	if type(room) == "number" then
		targetRoom = math.clamp(math.floor(room), 1, 20)
	end
end

function autoReset.GetTargetRoom(): number
	return targetRoom
end

function autoReset.SetDelay(seconds: number)
	if type(seconds) == "number" then
		delaySeconds = math.clamp(seconds, 0, 15)
	end
end

function autoReset.GetDelay(): number
	return delaySeconds
end

function autoReset.ResetNow()
	notifier.Notify("Auto Reset", "Manual character reset executed", 2)
	executeReset()
end

-- Tự động đăng ký dọn dẹp khi script unload
lifecycle.Register(function()
	stopListening()
	enabled = false
	hasTriggeredThisRun = false
end)

return autoReset
