-- ZoneGuard (DungeonQuest): Bộ điều phối & bảo vệ không gian hoạt động (Lobby vs Dungeon).
-- Đảm bảo 100% các tính năng chỉ chạy đúng trong không gian được chỉ định,
-- tự động đóng băng tài nguyên khi ở sai môi trường và ngăn chặn các hành vi ngoài ý muốn.

local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local shared = require("@routes/DungeonQuest/core/shared")

local zoneGuard = {}

export type Zone = "Lobby" | "Dungeon" | "Global"

export type ZoneRegistration = {
	Name: string,
	Zone: Zone,
	OnEnter: (() -> ())?,
	OnLeave: (() -> ())?,
}

--// State
local registrations: { [string]: ZoneRegistration } = {}
local zoneChangedCallbacks: { (Zone, Zone) -> () } = {}
local currentZone: Zone = "Lobby"

--// Lấy không gian hiện tại
function zoneGuard.GetCurrentZone(): Zone
	return shared.IsInLobby() and "Lobby" or "Dungeon"
end

--// Kiểm tra xem hiện tại có thuộc Zone mong muốn không
function zoneGuard.IsInZone(expectedZone: Zone): boolean
	if expectedZone == "Global" then return true end
	return zoneGuard.GetCurrentZone() == expectedZone
end

function zoneGuard.IsLobby(): boolean
	return zoneGuard.GetCurrentZone() == "Lobby"
end

function zoneGuard.IsDungeon(): boolean
	return zoneGuard.GetCurrentZone() == "Dungeon"
end

--// Đăng ký 1 module với Zone cụ thể
function zoneGuard.Register(reg: ZoneRegistration)
	if not reg or type(reg.Name) ~= "string" or not reg.Zone then return end
	registrations[reg.Name] = reg

	-- Nếu đang ở đúng zone tại thời điểm đăng ký -> gọi OnEnter ngay lập tức
	if zoneGuard.IsInZone(reg.Zone) and reg.OnEnter then
		task.spawn(function()
			pcall(reg.OnEnter)
		end)
	end
end

function zoneGuard.Unregister(name: string)
	registrations[name] = nil
end

--// Lớp bọc bảo vệ (Guard Wrapper): Chỉ cho phép hàm thực thi khi ở đúng Zone
function zoneGuard.Guard<T...>(zone: Zone, fn: (T...) -> any, fallbackValue: any?): (T...) -> any
	return function(...)
		if not zoneGuard.IsInZone(zone) then
			return fallbackValue
		end
		return fn(...)
	end
end

--// Lắng nghe sự kiện chuyển đổi Zone
function zoneGuard.OnZoneChanged(callback: (newZone: Zone, oldZone: Zone) -> ())
	if type(callback) == "function" then
		table.insert(zoneChangedCallbacks, callback)
	end
end

--// Xử lý chuyển đổi Zone tập trung
local function handleZoneTransition(inLobby: boolean)
	local newZone: Zone = inLobby and "Lobby" or "Dungeon"
	if newZone == currentZone then return end

	local oldZone = currentZone
	currentZone = newZone

	-- 1. Gọi OnLeave cho các hệ thống thuộc Zone cũ
	for _, reg in pairs(registrations) do
		if reg.Zone ~= "Global" and reg.Zone == oldZone and reg.OnLeave then
			task.spawn(function()
				pcall(reg.OnLeave)
			end)
		end
	end

	-- 2. Gọi OnEnter cho các hệ thống thuộc Zone mới
	for _, reg in pairs(registrations) do
		if reg.Zone ~= "Global" and reg.Zone == newZone and reg.OnEnter then
			task.spawn(function()
				pcall(reg.OnEnter)
			end)
		end
	end

	-- 3. Bắn sự kiện cho các listeners bên ngoài
	for _, cb in ipairs(zoneChangedCallbacks) do
		task.spawn(function()
			pcall(cb, newZone, oldZone)
		end)
	end
end

-- Khởi tạo ban đầu
currentZone = zoneGuard.GetCurrentZone()

-- Lắng nghe từ shared
shared.OnLobbyChanged(function(inLobby)
	handleZoneTransition(inLobby)
end)

lifecycle.Register(function()
	table.clear(registrations)
	table.clear(zoneChangedCallbacks)
end)

return zoneGuard
