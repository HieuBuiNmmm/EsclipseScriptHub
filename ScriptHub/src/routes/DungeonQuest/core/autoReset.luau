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
local targetRooms = { ["room2"] = true } -- set of room folder names: { [name] = true }
local delaySeconds = 0.0
local triggeredRooms = {} -- [roomName] = true (đánh dấu phòng đã reset trong run này)

local roomConn = nil
local lobbyConn = nil
local dungeonConn = nil

--// Danh sách room mặc định dùng khi CHƯA vào dungeon (dropdown không bị rỗng).
--// Khi đã trong dungeon, sẽ dùng danh sách THỰC TẾ lấy từ folder level-1 của workspace.dungeon.
local DEFAULT_ROOM_OPTIONS = {}
for i = 1, 15 do
	table.insert(DEFAULT_ROOM_OPTIONS, ("room%d"):format(i))
end
table.insert(DEFAULT_ROOM_OPTIONS, "bossRoom")

--// Chuẩn hoá 1 giá trị nhận từ UI (tên folder, number, "Room 5" cũ) về tên folder room.
--// Khi đã vào dungeon -> chỉ chấp nhận room có thật; chưa vào dungeon -> giữ nguyên
--// (phục vụ config restore).
local function resolveRoomName(val: string | number): string?
	return shared.ResolveRoomName(val)
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
local function checkRoomTrigger(currentRoomName: string?)
	if not enabled then return end
	if shared.IsInLobby() or shared.IsDead() then return end
	if not currentRoomName then return end
	if not targetRooms[currentRoomName] then return end
	if triggeredRooms[currentRoomName] then return end

	-- Đánh dấu đã kích hoạt cho phòng này trong run hiện tại (chỉ 1 lần/phòng)
	triggeredRooms[currentRoomName] = true

	task.spawn(function()
		if delaySeconds > 0 then
			task.wait(delaySeconds)
		end

		if not enabled or shared.IsInLobby() or shared.IsDead() then return end
		if shared.GetCurrentRoomName() ~= currentRoomName then return end

		notifier.Notify("Auto Reset", ("Reset character at %s (Once per room/run)"):format(currentRoomName), 3)
		executeReset()
	end)
end

--// Khởi động lắng nghe sự kiện
local function startListening()
	if roomConn then return end

	roomConn = shared.OnRoomNameChanged(function(currentRoomName)
		if not currentRoomName then
			table.clear(triggeredRooms)
			return
		end
		-- Về lại room bắt đầu (initialRoom / room1) -> reset cho run mới
		if currentRoomName == shared.GetInitialRoomName() or currentRoomName == shared.GetFirstRoomName() then
			table.clear(triggeredRooms)
		end
		checkRoomTrigger(currentRoomName)
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
		checkRoomTrigger(shared.GetCurrentRoomName())
	else
		stopListening()
	end
end

function autoReset.IsEnabled(): boolean
	return enabled
end

function autoReset.GetRoomOptions(): { string }
	--// Ưu tiên danh sách room THỰC TẾ (tên folder từ dungeon). Khi chưa vào dungeon
	--// (lobby) thì fallback list mặc định để dropdown không bị rỗng.
	local real = shared.GetRoomOptions()
	if #real > 0 then return real end
	return DEFAULT_ROOM_OPTIONS
end

function autoReset.SetTargetRooms(selected)
	local newSet = {}
	if type(selected) == "table" then
		for k, v in pairs(selected) do
			if v == true then
				local r = resolveRoomName(k)
				if r then newSet[r] = true end
			else
				local r = resolveRoomName(v)
				if r then newSet[r] = true end
			end
		end
	elseif selected ~= nil then
		local r = resolveRoomName(selected)
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
	return list
end

-- Backward compatibility: các API số cũ đã bỏ (GetTargetRoom/SetTargetRoom/GetTargetRoomNumbers).
-- Room target giờ chỉ dùng TÊN FOLDER duy nhất (autoReset.GetTargetRooms / SetTargetRooms).

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
