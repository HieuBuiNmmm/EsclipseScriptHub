type LocationType__DARKLUA_TYPE_a = "Lobby" | "InGame"

type Zone__DARKLUA_TYPE_b = "Lobby" | "InGame" | "Global"

type ZoneRegistration__DARKLUA_TYPE_c = {
	Name: string,
	Zone: Zone__DARKLUA_TYPE_b,
	OnEnter: (() -> ())?,
	OnLeave: (() -> ())?
}
local __DIST __DIST={cache={}, load=function(m)if not __DIST.cache[m]then __DIST.cache[m]={c=__DIST[m]()}end return __DIST.cache[m].c end}do function __DIST.a()-- Constants: Định danh và phân định môi trường (Lobby vs InGame) cho Slop Tower Defense.


local constants = {
	UNIVERSE_ID = 10529769390,
	LOBBY_PLACE_ID = 134459712190924,
}

-- Kiểm tra xem Player có đang ở Lobby không


function constants.IsLobby(): boolean
	return game.PlaceId == constants.LOBBY_PLACE_ID
end

-- Ngoại trừ PlaceId của Lobby (134459712190924) ra, tất cả các place còn lại đều là InGame
function constants.IsInGame(): boolean
	return game.PlaceId ~= constants.LOBBY_PLACE_ID
end

-- Trả về loại môi trường hiện tại ("Lobby" hoặc "InGame")
function constants.GetLocation(): LocationType__DARKLUA_TYPE_a
	return constants.IsLobby() and "Lobby" or "InGame"
end

-- Chuỗi hiển thị thân thiện trên UI
function constants.GetLocationName(): string
	return constants.IsLobby() and "Lobby" or "In-Game"
end

return constants
end function __DIST.b()-- Lifecycle: Quản lý đăng ký và giải phóng tài nguyên (Connections, Tasks, Objects) khi script unload hoặc reload.


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
end function __DIST.c()-- ZoneGuard: Bộ điều phối và bảo vệ logic giữa Lobby và InGame cho Slop Tower Defense.
-- Đảm bảo các logic In-Game (Place, Upgrade, Skip Wave) không chạy bừa bãi ở Lobby và ngược lại.


local constants = __DIST.load('a')
local lifecycle = __DIST.load('b')

local zoneGuard = {}










local registrations: { [string]: ZoneRegistration__DARKLUA_TYPE_c } = {}

function zoneGuard.GetCurrentZone(): Zone__DARKLUA_TYPE_b
	return constants.IsLobby() and "Lobby" or "InGame"
end

function zoneGuard.IsInZone(expectedZone: Zone__DARKLUA_TYPE_b): boolean
	if expectedZone == "Global" then return true end
	return zoneGuard.GetCurrentZone() == expectedZone
end

function zoneGuard.IsLobby(): boolean
	return constants.IsLobby()
end

function zoneGuard.IsInGame(): boolean
	return constants.IsInGame()
end

-- Lớp bọc an toàn: Chỉ cho phép thực thi hàm khi Player ở đúng môi trường (Lobby hoặc InGame)
function zoneGuard.Guard<T...>(zone: Zone__DARKLUA_TYPE_b, fn: (T...) -> any, fallbackValue: any?): (T...) -> any
	return function(...)
		if not zoneGuard.IsInZone(zone) then
			return fallbackValue
		end
		return fn(...)
	end
end

-- Đăng ký module để tự động chạy OnEnter nếu đúng zone
function zoneGuard.Register(reg: ZoneRegistration__DARKLUA_TYPE_c)
	if not reg or type(reg.Name) ~= "string" or not reg.Zone then return end
	registrations[reg.Name] = reg

	if zoneGuard.IsInZone(reg.Zone) and reg.OnEnter then
		task.spawn(function()
			pcall(reg.OnEnter)
		end)
	end
end

function zoneGuard.Unregister(name: string)
	registrations[name] = nil
end

lifecycle.Register(function()
	table.clear(registrations)
end)

return zoneGuard
end function __DIST.d()-- Remotes: Wrapper quản lý tương tác mạng và RemoteEvents/Functions trong game.


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
end function __DIST.e()-- Tracker: Giám sát trạng thái trận đấu (Wave, Máu Base, Trạng thái trận đấu)


local lifecycle = __DIST.load('b')

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
end function __DIST.f()-- Economy: Theo dõi tiền / cash trong trận và trong lobby.


local economy = {
	Cash = 0,
	Gold = 0,
}

local cashCallbacks = {}

function economy.OnCashChanged(fn: (number) -> ()): () -> ()
	table.insert(cashCallbacks, fn)
	return function()
		local idx = table.find(cashCallbacks, fn)
		if idx then table.remove(cashCallbacks, idx) end
	end
end

function economy.GetCash(): number
	return economy.Cash
end

function economy.SetCash(amount: number)
	if economy.Cash ~= amount then
		economy.Cash = amount
		for _, fn in ipairs(cashCallbacks) do
			pcall(fn, amount)
		end
	end
end

return economy
end end-- Game Facade


local constants = __DIST.load('a')
local zoneGuard = __DIST.load('c')
local remotes = __DIST.load('d')
local tracker = __DIST.load('e')
local economy = __DIST.load('f')

return {
	Constants = constants,
	ZoneGuard = zoneGuard,
	Remotes = remotes,
	Tracker = tracker,
	Economy = economy,
}
