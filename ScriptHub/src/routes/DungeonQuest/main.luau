-- DungeonQuest: khởi tạo window + tabs, nạp core logic và các tab UI.

return function(self)
	--// Quan trọng: Maclib capture `Players.LocalPlayer` NGAY KHI require module
	--// (trong Maclib: `local LocalPlayer = Players.LocalPlayer` ở top-level).
	--// Nếu script chạy quá nhanh khi inject, LocalPlayer còn nil, và biến bên trong
	--// Maclib giữ nil vĩnh viễn -> tạo window (ShowUserInfo) crash "attempt to index
	--// nil with 'UserId'". Vì vậy phải chờ LocalPlayer TRƯỚC KHI require Maclib.
	local Players = game:GetService("Players")
	local timeout = os.clock() + 15
	while not Players.LocalPlayer do
		if os.clock() > timeout then break end
		task.wait(0.1)
	end
	local localPlayer = Players.LocalPlayer
	if not localPlayer then
		return warn("[DungeonQuest] Không lấy được LocalPlayer, hủy khởi tạo script.")
	end

	--// Imports
	local macLib = require("@packages/Maclib")
	local lifecycle = require("@routes/DungeonQuest/core/lifecycle")

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
	_G.ScriptHub_Cleanup = function()
		lifecycle.Cleanup()
	end
	window.onUnloaded(function()
		lifecycle.Cleanup()
		if _G.ScriptHub_UI == window then _G.ScriptHub_UI = nil end
	end)

	--// Tabs
	local tabGroup = window:TabGroup()
	local tabs = {
		Player = tabGroup:Tab({ Name = "Player", Image = "rbxassetid://10734950309" }),
		Pathfinder = tabGroup:Tab({ Name = "Auto Farm", Image = "rbxassetid://18821914323" }),
		Dungeon = tabGroup:Tab({ Name = "Dungeon Joiner", Image = "rbxassetid://10734950309" }),
		Inventory = tabGroup:Tab({ Name = "Inventory", Image = "rbxassetid://10734950309" }),
		Visual = tabGroup:Tab({ Name = "Visual", Image = "rbxassetid://10734950309" }),
		SmartDodge = tabGroup:Tab({ Name = "Smart Dodge", Image = "rbxassetid://10734950309" }),
		Config = tabGroup:Tab({ Name = "Configs", Image = "rbxassetid://10734950309" }),
		Notifications = tabGroup:Tab({ Name = "Notifications", Image = "rbxassetid://10734950309" }),
		State = tabGroup:Tab({ Name = "State", Image = "rbxassetid://10734950309" }),
	}

	--// Config
	macLib:SetFolder("EsclipseHub")

	--// Tab UI (mỗi tab trigger require các core logic tương ứng)
	local speedTab = require("@routes/DungeonQuest/tabs/Speed/main")
	local autoFarmPathfinderTab = require("@routes/DungeonQuest/tabs/AutoFarmPathfinder/main")
	local dungeonTab = require("@routes/DungeonQuest/tabs/Dungeon/main")
	local inventoryTab = require("@routes/DungeonQuest/tabs/Inventory/main")
	local visualTab = require("@routes/DungeonQuest/tabs/Visual/main")
	local smartDodgeTab = require("@routes/DungeonQuest/tabs/SmartDodge/main")
	local configTab = require("@routes/DungeonQuest/tabs/Config/main")
	local notificationsTab = require("@routes/DungeonQuest/tabs/Notifications/main")
	local stateTab = require("@routes/DungeonQuest/tabs/State/main")

	speedTab(window, tabs.Player)
	autoFarmPathfinderTab(window, tabs.Pathfinder)
	dungeonTab(window, tabs.Dungeon)
	inventoryTab(window, tabs.Inventory)
	visualTab(window, tabs.Visual)
	smartDodgeTab(window, tabs.SmartDodge)
	configTab(window, tabs.Config)
	notificationsTab(window, tabs.Notifications)
	stateTab(window, tabs.State)

	--// Phím tắt
	local shortcuts = require("@routes/DungeonQuest/core/shortcuts")
	shortcuts.Init()

	--// Webhook Discord (thông báo WIN + Reward)
	local webhook = require("@routes/DungeonQuest/core/webhook")
	webhook.Init()

	--// ESP Enemy (highlight mob trong dungeon)
	require("@routes/DungeonQuest/core/enemyEsp")

	--// Contextual Combat settings (per dungeon x per boss/mob) - auto-switch
	local contextual = require("@routes/DungeonQuest/core/contextual")

	--// Auto Hide UI (ẩn cửa sổ sau khi execute)
	local autoHide = require("@routes/DungeonQuest/core/autoHide")
	autoHide.SetWindow(window)
	autoHide.Execute()

	--// Khởi chạy
	tabs.Player:Select()
	macLib:LoadAutoLoadConfig()

	--// Nạp context data SAU khi config (kể cả autoload) được load, để context đọc đúng
	--// dữ liệu đã lưu thay vì fallback về global.
	contextual.Init()
end
