local __DIST __DIST={cache={}, load=function(m)if not __DIST.cache[m]then __DIST.cache[m]={c=__DIST[m]()}end return __DIST.cache[m].c end}do function __DIST.a()-- Constants: Lưu các thông tin Universe, PlaceIds và định danh của Slop Tower Defense.

local constants = {
	UNIVERSE_ID = 10529769390,

	PLACES = {
		LOBBY = 134459712190924,
		GAME = 85247278545351,
		AFK = 119785202494667,
	},
}

function constants.IsLobby(): boolean
	return game.PlaceId == constants.PLACES.LOBBY
end

function constants.IsInGame(): boolean
	return game.PlaceId == constants.PLACES.GAME
end

function constants.IsAfk(): boolean
	return game.PlaceId == constants.PLACES.AFK
end

function constants.GetLocationName(): string
	if constants.IsLobby() then
		return "Lobby"
	elseif constants.IsInGame() then
		return "In-Game"
	elseif constants.IsAfk() then
		return "AFK Area"
	end
	return "Unknown (" .. tostring(game.PlaceId) .. ")"
end

return constants
end function __DIST.b()-- Remotes: Wrapper quản lý tương tác mạng và RemoteEvents/Functions trong game.


local remotes = {
	-- Placeholder các instance Remote tìm thấy trong game
	Instances = {},
}

-- Gọi RemoteEvent an toàn
function remotes.FireServer(remoteName: string, ...: any): boolean
	local targetRemote = remotes.Instances[remoteName]
	if not targetRemote then
		-- Fallback tìm trong ReplicatedStorage nếu chưa cache
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		targetRemote = ReplicatedStorage:FindFirstChild(remoteName, true)
		if targetRemote and targetRemote:IsA("RemoteEvent") then
			remotes.Instances[remoteName] = targetRemote
		end
	end

	if targetRemote and targetRemote:IsA("RemoteEvent") then
		local ok, err = pcall(targetRemote.FireServer, targetRemote, ...)
		if not ok then
			warn("[SlopTD - Remotes] FireServer error on", remoteName, ":", err)
		end
		return ok
	end

	warn("[SlopTD - Remotes] RemoteEvent not found:", remoteName)
	return false
end

-- Gọi RemoteFunction an toàn
function remotes.InvokeServer(remoteName: string, ...: any): any
	local targetRemote = remotes.Instances[remoteName]
	if not targetRemote then
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		targetRemote = ReplicatedStorage:FindFirstChild(remoteName, true)
		if targetRemote and targetRemote:IsA("RemoteFunction") then
			remotes.Instances[remoteName] = targetRemote
		end
	end

	if targetRemote and targetRemote:IsA("RemoteFunction") then
		local ok, result = pcall(targetRemote.InvokeServer, targetRemote, ...)
		if not ok then
			warn("[SlopTD - Remotes] InvokeServer error on", remoteName, ":", result)
			return nil
		end
		return result
	end

	warn("[SlopTD - Remotes] RemoteFunction not found:", remoteName)
	return nil
end

return remotes
end function __DIST.c()-- Lifecycle: Quản lý đăng ký và giải phóng tài nguyên (Connections, Tasks, Objects) khi script unload hoặc reload.


local lifecycle = {
	cleaned = false,
	callbacks = {},
}

function lifecycle.Register(callback: () -> ()): () -> ()
	if type(callback) ~= "function" then
		return function() end
	end
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

function lifecycle.Cleanup(): ()
	if lifecycle.cleaned then return end
	lifecycle.cleaned = true
	for index = #lifecycle.callbacks, 1, -1 do
		pcall(lifecycle.callbacks[index])
	end
	table.clear(lifecycle.callbacks)
end

function lifecycle.IsActive(): boolean
	return not lifecycle.cleaned
end

lifecycle.OnCleanup = lifecycle.Register

return lifecycle
end function __DIST.d()-- Tracker: Giám sát trạng thái trận đấu (Wave, Máu Base, Trạng thái trận đấu)


local lifecycle = __DIST.load('c')

local tracker = {
	Wave = 0,
	MaxWave = 0,
	BaseHealth = 100,
	MaxBaseHealth = 100,
	GameActive = false,
	AutoSkipEnabled = false,
}

local callbacks = {}

function tracker.OnWaveChanged(fn: (number) -> ()): () -> ()
	table.insert(callbacks, fn)
	return function()
		local idx = table.find(callbacks, fn)
		if idx then table.remove(callbacks, idx) end
	end
end

function tracker.SetWave(wave: number)
	if tracker.Wave ~= wave then
		tracker.Wave = wave
		for _, fn in ipairs(callbacks) do
			pcall(fn, wave)
		end
	end
end

function tracker.Init()
	-- Kết nối tự động phát hiện wave / match state khi vào game
	-- (Sẽ được bổ sung path cụ thể sau khi kiểm tra hierarchy trong game)
end

return tracker
end end-- Tab Match: Quản lý vòng lặp trận đấu (Skip Wave, Auto Start, Replay, Match State).


local constants = __DIST.load('a')
local remotes = __DIST.load('b')
local tracker = __DIST.load('d')

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Match Automation" })

	leftSection:Toggle({
		Name = "Auto Skip Wave",
		Default = false,
		Callback = function(state)
			tracker.AutoSkipEnabled = state
		end,
	}, "Toggle_AutoSkipWave")

	leftSection:Toggle({
		Name = "Auto Vote Start",
		Default = false,
		Callback = function(state)
			-- Toggle auto vote start
		end,
	}, "Toggle_AutoVoteStart")

	leftSection:Toggle({
		Name = "Auto Replay (On Win/Loss)",
		Default = false,
		Callback = function(state)
			-- Toggle auto replay
		end,
	}, "Toggle_AutoReplay")

	leftSection:Toggle({
		Name = "Auto Return to Lobby (On Finish)",
		Default = false,
		Callback = function(state)
			-- Toggle return to lobby
		end,
	}, "Toggle_AutoReturnLobby")

	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Match Status" })

	rightSection:Label({
		Text = "Location: " .. constants.GetLocationName(),
	})

	local waveLabel = rightSection:Label({
		Text = "Wave: 0 / 0",
	})

	local healthLabel = rightSection:Label({
		Text = "Base Health: 100%",
	})

	tracker.OnWaveChanged(function(wave)
		pcall(function()
			waveLabel:UpdateText("Wave: " .. tostring(wave))
		end)
	end)
end
