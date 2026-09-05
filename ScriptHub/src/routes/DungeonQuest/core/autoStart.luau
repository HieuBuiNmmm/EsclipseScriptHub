-- Auto Start Game cho DungeonQuest: chờ tới khi đang ở TRONG dungeon rồi fire
-- remote start. Dungeon được xác định bằng cách LOẠI TRỪ các placeId lobby: ngoài
-- 2 lobby (Lobby1/Lobby2) thì mọi place khác đều coi là dungeon. Ở lobby không
-- hoạt động dù toggle có bật.

--// Imports
local shared = require("@routes/DungeonQuest/core/shared")
local notifier = require("@routes/DungeonQuest/core/notifier")

--// Lobby placeId — ngoài các place này ra thì đều là dungeon
local LOBBY_PLACE_IDS = {
	[77649408247578] = true,
	[115445507767090] = true,
}

--// State
local autoStartEnabled = false
local autoStartRunning = false
local autoStartTriggered = false
local autoStartDelay = 3
local autoStartCommand = 'game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("changeStartValue"):FireServer()'
local autoStartCommandFn = nil

--// Điều kiện kích hoạt: đang ở dungeon (place hiện tại KHÔNG phải placeId lobby).
local function lobbyCondition()
	return not LOBBY_PLACE_IDS[game.PlaceId]
end

--// Compile remote start command (giữ hành vi cũ, loadstring có sẵn trong executor)
local s2, cmdFn2 = pcall(loadstring, autoStartCommand)
if s2 and type(cmdFn2) == "function" then autoStartCommandFn = cmdFn2 end

--// Table
local autoStart = {}

--// Callbacks chạy sau khi fire remote start thành công (đánh dấu mốc run bắt đầu).
local startCallbacks = {}

--// Methods
function autoStart.OnStart(callback)
	if type(callback) ~= "function" then return function() end end
	table.insert(startCallbacks, callback)
	return function()
		for i, cb in ipairs(startCallbacks) do
			if cb == callback then table.remove(startCallbacks, i) break end
		end
	end
end

function autoStart.Start()
	if autoStartRunning then return end
	autoStartRunning = true
	autoStartTriggered = false
	task.spawn(function()
		while autoStartEnabled do
			local sCond, res = pcall(lobbyCondition)
			local met = sCond and res == true

			if met and not autoStartTriggered then
				autoStartTriggered = true
				--// Chờ delay để asset load xong; nếu bị tắt giữa chừng thì bỏ qua.
				local waited = 0
				while waited < autoStartDelay and autoStartEnabled do
					task.wait(0.1)
					waited = waited + 0.1
				end
				if not autoStartEnabled then
					autoStartTriggered = false
					break
				end
				if autoStartCommandFn then
					local sCmd, err = pcall(autoStartCommandFn)
					if sCmd then
						notifier.Notify("Auto Start", "Game started!", 3)
						for i = #startCallbacks, 1, -1 do
							pcall(startCallbacks[i])
						end
					else
						notifier.Notify("Auto Start", "Trigger failed: " .. tostring(err), 3)
					end
				else
					notifier.Notify("Auto Start", "Remote command invalid", 3)
				end
			end

			if not autoStartEnabled then break end
			task.wait(1)
		end
		autoStartRunning = false
	end)
end

function autoStart.Stop()
	autoStartEnabled = false
end

--// Delay (giây) chờ thêm sau khi vào lobby trước khi fire start — chờ asset load xong.
function autoStart.SetDelay(value)
	autoStartDelay = tonumber(value) or 3
end

function autoStart.GetDelay()
	return autoStartDelay
end

function autoStart.Toggle(state)
	autoStartEnabled = state
	if state then
		autoStart.Start()
	else
		autoStart.Stop()
	end
end

--// Vào dungeon = teleport đổi placeId -> script reload -> autoStartTriggered khởi tạo
--// lại = false, nên fire đúng 1 lần mỗi dungeon mà không cần reset qua callback.
--// KHÔNG dùng OnDungeonNameChanged để reset vì trong lúc load tên dungeon có thể dao
--// động giữa placeholder/tên thật -> reset sai thời điểm gây fire trùng "Game started!".

return autoStart