-- This is an autoloader, you can make this a GUI if you want.

--// Dừng logic cũ trước khi unload UI, tránh listener/vòng lặp bị nhân đôi khi execute lại.
local oldCleanup = _G.ScriptHub_Cleanup
if typeof(oldCleanup) == "function" then
	pcall(oldCleanup)
end
_G.ScriptHub_Cleanup = nil

--// Unload UI cũ mỗi lần execute script mới (tránh trùng cửa sổ)
local oldUI = _G.ScriptHub_UI
if typeof(oldUI) == "table" and typeof(oldUI.Unload) == "function" then
	pcall(oldUI.Unload, oldUI)
end
local keySystem = require("@core/keySystem")

--// Key System Configuration (Luarmor-style)
local KEY_SYSTEM_CONFIG = {
	Title = "ESCLIPSE SCRIPT HUB",
	Subtitle = "Key Authentication System",
	ApiUrl = "https://esclipse-keysystem.bhieu4225.workers.dev",
	GetKeyUrl = "https://esclipse-keysystem.bhieu4225.workers.dev/getkey",
	DiscordUrl = "https://discord.gg/your-invite", -- Link Discord của bạn
	SaveFolder = "EsclipseHub",
	SaveFileName = "key.json", -- Lưu tại: EsclipseHub/key.json
	BypassKey = false, -- Đổi thành true nếu muốn tạm thời bỏ qua Key System để test
}

--// Variables
local routes = {
	{
		Name = "DungeonQuest",
		Load = require("@routes/DungeonQuest/main"),
		UniverseId = 9931749389,
		Places = {
			77649408247578,
			3220968688,
			2414851778,
		},
	},

	{
		Name = "SlopTowerDefense",
		Load = require("@routes/SlopTowerDefense/main"),
		UniverseId = 10529769390,
		Places = {
			134459712190924, -- Lobby
			85247278545351,  -- The Game
			119785202494667, -- AFK
		},
	},

	{
		Name = "Game 2",
		Load = require("@routes/Game 2/main"),
		Places = {
			123456789,
			987654321,
		},
	},
}

--// Chờ game info sẵn sàng (tránh inject sớm làm GameId/PlaceId chưa đúng -> route không khớp)
for _ = 1, 300 do
	if game.GameId ~= 0 and game.PlaceId ~= 0 then break end
	task.wait(0.1)
end

--// 1. Xác thực bản quyền qua Key System trước khi nạp Route (bỏ qua nếu đã xác thực qua Loader)
if not _G.Esclipse_Authenticated then
	local authSuccess = keySystem.Authenticate(KEY_SYSTEM_CONFIG)
	if not authSuccess then
		return
	end
end

--// 2. Khởi tạo Route tương ứng với Place/Universe hiện tại
for _, route in pairs(routes) do
	if route.Places then
		for _, placeId in ipairs(route.Places) do
			if placeId == game.PlaceId then
				return route:Load()
			end
		end
	end

	if route.UniverseId and route.UniverseId == game.GameId then
		return route:Load()
	end
end
