type LocationType__DARKLUA_TYPE_a = "Lobby" | "InGame"
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
end end-- ZoneGuard: Bộ điều phối và bảo vệ logic giữa Lobby và InGame cho Slop Tower Defense.
-- Đảm bảo các logic In-Game (Place, Upgrade, Skip Wave) không chạy bừa bãi ở Lobby và ngược lại.


local constants = __DIST.load('a')
local lifecycle = __DIST.load('b')

local zoneGuard = {}

export type Zone = "Lobby" | "InGame" | "Global"

export type ZoneRegistration = {
	Name: string,
	Zone: Zone,
	OnEnter: (() -> ())?,
	OnLeave: (() -> ())?
}

local registrations: { [string]: ZoneRegistration } = {}

function zoneGuard.GetCurrentZone(): Zone
	return constants.IsLobby() and "Lobby" or "InGame"
end

function zoneGuard.IsInZone(expectedZone: Zone): boolean
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
function zoneGuard.Guard<T...>(zone: Zone, fn: (T...) -> any, fallbackValue: any?): (T...) -> any
	return function(...)
		if not zoneGuard.IsInZone(zone) then
			return fallbackValue
		end
		return fn(...)
	end
end

-- Đăng ký module để tự động chạy OnEnter nếu đúng zone
function zoneGuard.Register(reg: ZoneRegistration)
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
