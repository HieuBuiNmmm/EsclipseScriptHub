-- This is an autoloader, you can make this a GUI if you want.

--// Unload UI cũ mỗi lần execute script mới (tránh trùng cửa sổ)
local oldUI = _G.ScriptHub_UI
if typeof(oldUI) == "table" and typeof(oldUI.Unload) == "function" then
	pcall(oldUI.Unload, oldUI)
end
_G.ScriptHub_UI = nil

--// Variables
local routes = {
	{
		Name = "Universal",
		Load = require("@routes/Universal/main"),
	},

	{
		Name = "DungeonQuest",
		Load = require("@routes/DungeonQuest/main"),
		UniverseId = 9931749389,
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

--// Initialize
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

routes[1]:Load() -- Fall back to Universal if no route was loaded.
