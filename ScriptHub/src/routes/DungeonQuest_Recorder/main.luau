--// DungeonQuest_Recorder: Entry Point cho Flight Data Recorder & Reverse Engineering Route
--// Thuần quan sát (Passive Read-Only), siêu nhẹ, tương thích 100% khi chạy song song với script khác.

local Players = game:GetService("Players")

local logger = require("@routes/DungeonQuest_Recorder/logger")
local hud = require("@routes/DungeonQuest_Recorder/hud")

return function(self)
	-- Nâng quyền thread nếu executor hỗ trợ
	pcall(function()
		local fn = setthreadidentity or set_thread_identity or setidentity or (syn and syn.set_thread_identity)
		if fn then
			local ok = pcall(fn, 7)
			if not ok then pcall(fn, 8) end
		end
	end)

	-- Chờ LocalPlayer sẵn sàng
	local timeout = os.clock() + 10
	while not Players.LocalPlayer do
		if os.clock() > timeout then break end
		task.wait(0.1)
	end

	local localPlayer = Players.LocalPlayer
	if not localPlayer then
		return warn("[DQ_Recorder] Failed to retrieve LocalPlayer, aborting.")
	end

	-- Khởi tạo HUD nổi
	hud.Create()

	-- Tự động kết nối WebSocket Live Radar
	logger.ConnectWebSocket()

	-- Đăng ký Cleanup hook
	_G.ScriptHub_Cleanup = function()
		hud.Destroy()
		logger.Cleanup()
	end

	print("=======================================================")
	print("⚡ [Esclipse] DungeonQuest Flight Data Recorder Loaded!")
	print("🎯 Mode: Passive Black-Box Reverse Engineering")
	print("💡 Bật script đối thủ lên và bấm [🔴 START RECORDING] trên Mini HUD")
	print("📡 Live 2D Radar: Mở http://localhost:8765 trên trình duyệt")
	print("=======================================================")
end
