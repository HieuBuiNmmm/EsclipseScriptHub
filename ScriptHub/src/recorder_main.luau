--// EsclipseHub - Flight Data Recorder Entry Point

--// Dừng logic cũ trước khi inject
local oldCleanup = _G.ScriptHub_Cleanup
if typeof(oldCleanup) == "function" then
	pcall(oldCleanup)
end
_G.ScriptHub_Cleanup = nil

local oldUI = _G.ScriptHub_UI
if typeof(oldUI) == "table" and typeof(oldUI.Unload) == "function" then
	pcall(oldUI.Unload, oldUI)
end
_G.ScriptHub_UI = nil

--// Nạp DungeonQuest Flight Recorder trực tiếp không delay
local recorderRoute = require("@routes/DungeonQuest_Recorder/main")
recorderRoute()
