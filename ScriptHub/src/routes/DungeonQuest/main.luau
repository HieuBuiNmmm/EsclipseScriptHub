-- DungeonQuest: khởi tạo window + tabs, nạp core logic và các tab UI.

return function(self)
	--// Imports
	local macLib = require("@packages/Maclib")

	--// Window
	local window = macLib:Window({
		Title = "DungeonQuest",
		Subtitle = "EsclipseHub",
		Size = UDim2.fromOffset(900, 600),
		DragStyle = 1,
		DisabledWindowControls = {},
		ShowUserInfo = true,
		Keybind = Enum.KeyCode.RightControl,
		AcrylicBlur = true,
	})

	local notifier = require("@routes/DungeonQuest/core/notifier")
	notifier:SetWindow(window)

	--// Đăng ký UI vào registry để unload UI cũ trước mỗi lần execute script mới
	_G.ScriptHub_UI = window

	--// Tabs
	local tabGroup = window:TabGroup()
	local tabs = {
		Speed = tabGroup:Tab({ Name = "Speed", Image = "rbxassetid://10734950309" }),
		Combat = tabGroup:Tab({ Name = "Combat", Image = "rbxassetid://18821914323" }),
		Dungeon = tabGroup:Tab({ Name = "Dungeon", Image = "rbxassetid://10734950309" }),
		Config = tabGroup:Tab({ Name = "Configs", Image = "rbxassetid://10734950309" }),
	}

	--// Config
	macLib:SetFolder("EsclipseHub")

	--// Tab UI (mỗi tab trigger require các core logic tương ứng)
	local speedTab = require("@routes/DungeonQuest/tabs/Speed/main")
	local combatTab = require("@routes/DungeonQuest/tabs/Combat/main")
	local dungeonTab = require("@routes/DungeonQuest/tabs/Dungeon/main")
	local configTab = require("@routes/DungeonQuest/tabs/Config/main")

	speedTab(window, tabs.Speed)
	combatTab(window, tabs.Combat)
	dungeonTab(window, tabs.Dungeon)
	configTab(window, tabs.Config)

	--// Phím tắt
	local shortcuts = require("@routes/DungeonQuest/core/shortcuts")
	shortcuts.Init()

	--// Khởi chạy
	tabs.Speed:Select()
	macLib:LoadAutoLoadConfig()
end
