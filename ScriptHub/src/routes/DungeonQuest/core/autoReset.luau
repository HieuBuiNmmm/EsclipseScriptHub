-- Auto Reset / Suicide (DungeonQuest): Chủ động tự sát 1 LẦN DUY NHẤT khi bước vào các room chỉ định.
-- Dùng để trigger điểm checkpoint hồi sinh hoặc kích hoạt phase macro tiếp theo.
-- Hỗ trợ Multi Target Rooms (chọn nhiều phòng cùng lúc).

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local notifier = require("@routes/DungeonQuest/core/notifier")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local zoneGuard = require("@routes/DungeonQuest/core/zoneGuard")

local player = services.player

--// State
local autoReset = {}
local enabled = false
local targetRooms = { [2] = true } -- set of room numbers: { [number] = true }
local delaySeconds = 0.0
local triggeredRooms = {} -- [roomIndex] = true (đánh dấu phòng đã reset trong run này)

local roomConn = nil
local lobbyConn = nil
local dungeonConn = nil

local ROOM_OPTIONS = {}
for i = 1, 15 do
	table.insert(ROOM_OPTIONS, ("Room %d"):format(i))
end

local function parseRoomNumber(val): number?
	if type(val) == "number" then
		return math.clamp(math.floor(val), 1, 20)
	elseif type(val) == "string" then
		local num = tonumber(val:match("%d+"))
		if num then
			return math.clamp(math.floor(num), 1, 20)
		end
	end
	return nil
end

--// Thực hiện tự sát / reset nhân vật an toàn (Chỉ cho phép trong Dungeon)
local executeReset = zoneGuard.Guard("Dungeon", function()
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
end)

--// Kiểm tra và xử lý tự sát khi vào phòng
local function checkRoomTrigger(currentRoom: number)
	if not enabled then return end
	if shared.IsInLobby() or shared.IsDead() then return end
	if currentRoom <= 0 then return end
	if not targetRooms[currentRoom] then return end
	if triggeredRooms[currentRoom] then return end

	-- Đánh dấu đã kích hoạt cho phòng này trong run hiện tại (chỉ 1 lần/phòng)
	triggeredRooms[currentRoom] = true

	task.spawn(function()
		if delaySeconds > 0 then
			task.wait(delaySeconds)
		end

		if not enabled or shared.IsInLobby() or shared.IsDead() then return end
		if shared.GetCurrentRoomIndex() ~= currentRoom then return end

		notifier.Notify("Auto Reset", ("Reset character at Room %d (Once per room/run)"):format(currentRoom), 3)
		executeReset()
	end)
end

--// Khởi động lắng nghe sự kiện
local function startListening()
	if roomConn then return end

	roomConn = shared.OnRoomIndexChanged(function(currentRoom)
		if currentRoom <= 1 then
			-- Khi bắt đầu lại từ room đầu / room 0 -> reset danh sách đã trigger cho run mới
			table.clear(triggeredRooms)
		end
		checkRoomTrigger(currentRoom)
	end)

	lobbyConn = shared.OnLobbyChanged(function(inLobby)
		if inLobby then
			table.clear(triggeredRooms)
		end
	end)

	dungeonConn = shared.OnDungeonNameChanged(function()
		table.clear(triggeredRooms)
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
		table.clear(triggeredRooms)
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

function autoReset.GetRoomOptions(): { string }
	return ROOM_OPTIONS
end

function autoReset.SetTargetRooms(selected)
	local newSet = {}
	if type(selected) == "table" then
		for k, v in pairs(selected) do
			if v == true then
				local r = parseRoomNumber(k)
				if r then newSet[r] = true end
			else
				local r = parseRoomNumber(v)
				if r then newSet[r] = true end
			end
		end
	elseif selected ~= nil then
		local r = parseRoomNumber(selected)
		if r then newSet[r] = true end
	end

	targetRooms = newSet
end

function autoReset.GetTargetRooms(): { string }
	local list = {}
	for r in pairs(targetRooms) do
		table.insert(list, r)
	end
	table.sort(list)
	local result = {}
	for _, r in ipairs(list) do
		table.insert(result, ("Room %d"):format(r))
	end
	return result
end

function autoReset.GetTargetRoomNumbers(): { number }
	local list = {}
	for r in pairs(targetRooms) do
		table.insert(list, r)
	end
	table.sort(list)
	return list
end

-- Backward compatibility
function autoReset.SetTargetRoom(room: number)
	local r = parseRoomNumber(room)
	if r then
		targetRooms = { [r] = true }
	end
end

function autoReset.GetTargetRoom(): number
	for r in pairs(targetRooms) do
		return r
	end
	return 2
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

--// Đăng ký với ZoneGuard: AutoReset chỉ hoạt động trong Dungeon
zoneGuard.Register({
	Name = "AutoReset",
	Zone = "Dungeon",
	OnEnter = function()
		table.clear(triggeredRooms)
		if enabled then
			startListening()
		end
	end,
	OnLeave = function()
		table.clear(triggeredRooms)
		stopListening()
	end,
})

-- Tự động đăng ký dọn dẹp khi script unload
lifecycle.Register(function()
	stopListening()
	enabled = false
	table.clear(triggeredRooms)
	zoneGuard.Unregister("AutoReset")
end)

return autoReset
