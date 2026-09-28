-- SlopTowerDefense: Khởi tạo giao diện Maclib và nạp 4 tabs: Main, Game, Macro, Config.

return function(self)
	pcall(function()
		local fn = setthreadidentity or set_thread_identity or setidentity or (syn and syn.set_thread_identity)
		if fn then
			local ok = pcall(fn, 7)
			if not ok then pcall(fn, 8) end
		end
	end)

	-- Chờ LocalPlayer sẵn sàng trước khi require Maclib để tránh crash nil UserId
	local Players = game:GetService("Players")
	local timeout = os.clock() + 15
	while not Players.LocalPlayer do
		if os.clock() > timeout then break end
		task.wait(0.1)
	end
	local localPlayer = Players.LocalPlayer
	if not localPlayer then
		return warn("[SlopTowerDefense] Failed to retrieve LocalPlayer, aborting initialization.")
	end

	-- Imports
	local macLib = require("@packages/Maclib")
	local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")
	local autoSave = require("@routes/SlopTowerDefense/core/system/autoSave")
	local notifier = require("@routes/SlopTowerDefense/core/system/notifier")

	autoSave.Suspend()

	-- Khởi tạo Maclib Window
	local window = macLib:Window({
		Title = "Slop Tower Defense",
		Subtitle = "EsclipseHub",
		Size = UDim2.fromOffset(920, 560),
		SidebarWidth = 240,
		DragStyle = 1,
		DisabledWindowControls = {},
		ShowUserInfo = true,
		Keybind = Enum.KeyCode.RightControl,
		AcrylicBlur = false,
	})

	notifier:SetWindow(window)

	-- Đăng ký UI và cleanup vào _G
	_G.ScriptHub_UI = window
	_G.ScriptHub_Cleanup = function()
		lifecycle.Cleanup()
	end
	window.onUnloaded(function()
		lifecycle.Cleanup()
		if _G.ScriptHub_UI == window then _G.ScriptHub_UI = nil end
	end)

	-- Folder config
	macLib:SetFolder("EsclipseHub/SlopTowerDefense")

	-- 4 Tabs theo thứ tự: Main, Game, Macro, Config
	local tabGroup = window:TabGroup()
	local tabs = {
		Main = tabGroup:Tab({ Name = "Main", Image = "rbxassetid://10734886202" }),
		Game = tabGroup:Tab({ Name = "Game", Image = "rbxassetid://10734975692" }),
		Macro = tabGroup:Tab({ Name = "Macro", Image = "rbxassetid://10734950309" }),
		Config = tabGroup:Tab({ Name = "Config", Image = "rbxassetid://10709769841" }),
	}

	-- Load UI Modules
	local mainTab = require("@routes/SlopTowerDefense/tabs/Main/main")
	local gameTab = require("@routes/SlopTowerDefense/tabs/Game/main")
	local macroTab = require("@routes/SlopTowerDefense/tabs/Macro/main")
	local configTab = require("@routes/SlopTowerDefense/tabs/Config/main")

	mainTab(window, tabs.Main)
	gameTab(window, tabs.Game)
	macroTab(window, tabs.Macro)
	configTab(window, tabs.Config)

	-- Tự động mở tab Main khi khởi chạy
	tabs.Main:Select()

	-- Tự động nạp cấu hình autoload nếu có
	pcall(function()
		macLib:LoadAutoLoadConfig()
	end)

	autoSave.Resume()
	print("[SlopTowerDefense] Initialized successfully.")
end
