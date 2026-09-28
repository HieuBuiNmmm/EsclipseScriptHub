-- ZoneGuard: Bộ điều phối và bảo vệ logic giữa Lobby và InGame cho Slop Tower Defense.
-- Đảm bảo các logic In-Game (Place, Upgrade, Skip Wave) không chạy bừa bãi ở Lobby và ngược lại.

local constants = require("./constants")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")

local zoneGuard = {}

export type Zone = "Lobby" | "InGame" | "Global"

export type ZoneRegistration = {
	Name: string,
	Zone: Zone,
	OnEnter: (() -> ())?,
	OnLeave: (() -> ())?,
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
