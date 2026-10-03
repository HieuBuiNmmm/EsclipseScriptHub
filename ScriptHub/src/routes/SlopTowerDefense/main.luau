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
	local utility = require("@routes/SlopTowerDefense/core/system/utility")

	lifecycle.Init()
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
		Keybind = Enum.KeyCode.RightShift,
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

	-- 5 Tabs theo thứ tự tuần tự: Main, Game, Macro, Map Macro, Config
	local tabGroup = window:TabGroup()
	local tabs = {}
	tabs.Main = tabGroup:Tab({ Name = "Main", Image = "rbxassetid://10723407389" })
	tabs.Game = tabGroup:Tab({ Name = "Game", Image = "rbxassetid://10734975692" })
	tabs.Macro = tabGroup:Tab({ Name = "Macro", Image = "rbxassetid://10734950309" })
	tabs.MapMacro = tabGroup:Tab({ Name = "Map Macro", Image = "rbxassetid://10734886004" })
	tabs.Config = tabGroup:Tab({ Name = "Config", Image = "rbxassetid://10709769841" })

	-- Load UI Modules
	local mainTab = require("@routes/SlopTowerDefense/tabs/Main/main")
	local gameTab = require("@routes/SlopTowerDefense/tabs/Game/main")
	local macroTab = require("@routes/SlopTowerDefense/tabs/Macro/main")
	local mapMacroTab = require("@routes/SlopTowerDefense/tabs/MapMacro/main")
	local configTab = require("@routes/SlopTowerDefense/tabs/Config/main")

	local function safeLoad(tabName: string, loader: (any, any) -> (), tabInstance: any)
		local ok, err = pcall(loader, window, tabInstance)
		if not ok then
			warn(string.format("[SlopTowerDefense] Failed to load tab '%s': %s", tabName, tostring(err)))
		end
	end

	safeLoad("Main", mainTab, tabs.Main)
	safeLoad("Game", gameTab, tabs.Game)
	safeLoad("Macro", macroTab, tabs.Macro)
	safeLoad("MapMacro", mapMacroTab, tabs.MapMacro)
	safeLoad("Config", configTab, tabs.Config)

	-- Tự động mở tab Main khi khởi chạy
	tabs.Main:Select()

	-- Tự động nạp cấu hình autoload nếu có
	pcall(function()
		macLib:LoadAutoLoadConfig()
	end)

	-- Đồng bộ MenuKeybind từ cấu hình vừa nạp (nếu có)
	pcall(function()
		local menuBindOption = macLib.Options["Keybind_MenuToggle"]
		if menuBindOption and typeof(menuBindOption.GetBind) == "function" then
			local savedBind = menuBindOption:GetBind()
			if savedBind and typeof(savedBind) == "EnumItem" then
				window:SetKeybind(savedBind)
			end
		end
	end)

	autoSave.Resume()

	-- Tự động ẩn UI khi script được thực thi nếu tính năng Auto Hide được bật
	if utility.IsAutoHideEnabled() then
		task.defer(function()
			window:SetState(false)
			local keyName = "RightShift"
			pcall(function()
				if typeof(window.GetKeybind) == "function" then
					local b = window:GetKeybind()
					if b and b.Name then
						keyName = b.Name
					end
				end
			end)
			notifier.Notify("Slop Tower Defense", "UI is hidden. Press " .. keyName .. " to toggle.", 5)
		end)
	end

	print("[SlopTowerDefense] Initialized successfully.")
end
