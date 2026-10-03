--// EsclipseScriptHub - Lightweight Client Loader
--// This is the ONLY file distributed to end users.
--// It authenticates via Key System and fetches the protected payload directly from Cloudflare Worker into memory.

local oldCleanup = _G.ScriptHub_Cleanup
if typeof(oldCleanup) == "function" then
	pcall(oldCleanup)
end
_G.ScriptHub_Cleanup = nil

local oldUI = _G.ScriptHub_UI
if typeof(oldUI) == "table" and typeof(oldUI.Unload) == "function" then
	pcall(oldUI.Unload, oldUI)
end

-- Chờ game info sẵn sàng
for _ = 1, 300 do
	if game.GameId ~= 0 and game.PlaceId ~= 0 then break end
	task.wait(0.1)
end

local keySystem = require("@core/keySystem")

local KEY_SYSTEM_CONFIG = {
	Title = "ESCLIPSE SCRIPT HUB",
	Subtitle = "Key Authentication System",
	ApiUrl = "https://esclipse-keysystem.bhieu4225.workers.dev",
	GetKeyUrl = "https://esclipse-keysystem.bhieu4225.workers.dev/getkey",
	DiscordUrl = "https://discord.gg/your-invite",
	SaveFolder = "EsclipseHub",
	SaveFileName = "key.json",
	BypassKey = false,
}

print("[Esclipse Loader] Checking key authentication...")
local authSuccess, payload = keySystem.Authenticate(KEY_SYSTEM_CONFIG)

if not authSuccess then
	warn("[Esclipse Loader] Authentication cancelled or failed.")
	return
end

if not payload or typeof(payload) ~= "string" or #payload == 0 then
	warn("[Esclipse Loader] No script payload received from server! Please contact administrator or check server status.")
	return
end

-- Đánh dấu đã xác thực thành công để Main Script không lặp lại bước kiểm tra key
_G.Esclipse_Authenticated = true

print("[Esclipse Loader] Key verified! Launching Esclipse Script Hub...")

local runHub, compileError = loadstring(payload)
if not runHub then
	warn("[Esclipse Loader] Failed to compile script payload: " .. tostring(compileError))
	return
end

-- Chạy Script Hub an toàn trực tiếp từ RAM
local ok, runtimeError = pcall(runHub)
if not ok then
	warn("[Esclipse Loader] Runtime error during hub execution: " .. tostring(runtimeError))
end
