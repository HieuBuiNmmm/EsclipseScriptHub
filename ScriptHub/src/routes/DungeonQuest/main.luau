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
	local autoSave = require("@routes/DungeonQuest/core/autoSave")

	--// Tạm khóa autoSave trong quá trình khởi tạo UI và nạp config để tránh ghi đè file trên đĩa
	autoSave.Suspend()

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
		Combat = tabGroup:Tab({ Name = "Combat", Image = "rbxassetid://18821914323" }),
		Dungeon = tabGroup:Tab({ Name = "Dungeon Joiner", Image = "rbxassetid://10734950309" }),
		Inventory = tabGroup:Tab({ Name = "Inventory", Image = "rbxassetid://10734950309" }),
		Utilities = tabGroup:Tab({ Name = "Utilities", Image = "rbxassetid://10734950309" }),
		Configs = tabGroup:Tab({ Name = "Configs", Image = "rbxassetid://10734950309" }),
	}

	--// Config
	macLib:SetFolder("EsclipseHub")

	--// Tab UI (mỗi tab trigger require các core logic tương ứng)
	local combatTab = require("@routes/DungeonQuest/tabs/Combat/main")
	local dungeonTab = require("@routes/DungeonQuest/tabs/Dungeon/main")
	local inventoryTab = require("@routes/DungeonQuest/tabs/Inventory/main")
	local utilitiesTab = require("@routes/DungeonQuest/tabs/Utilities/main")
	local configsTab = require("@routes/DungeonQuest/tabs/Configs/main")

	combatTab(window, tabs.Combat)
	dungeonTab(window, tabs.Dungeon)
	inventoryTab(window, tabs.Inventory)
	utilitiesTab(window, tabs.Utilities)
	configsTab(window, tabs.Configs)

	--// Phím tắt
	local shortcuts = require("@routes/DungeonQuest/core/shortcuts")
	shortcuts.Init()

	--// Webhook Discord (thông báo WIN + Reward)
	local webhook = require("@routes/DungeonQuest/core/webhook")
	webhook.Init()

	--// ESP Enemy (highlight mob trong dungeon)
	require("@routes/DungeonQuest/core/enemyEsp")

	--// Auto Hide UI (ẩn cửa sổ sau khi execute)
	local autoHide = require("@routes/DungeonQuest/core/autoHide")
	autoHide.SetWindow(window)
	autoHide.Execute()

	--// Contextual (tự động áp dụng setting theo Dungeon x Target)
	local contextual = require("@routes/DungeonQuest/core/contextual")
	contextual.Init()

	--// Khởi chạy
	tabs.Combat:Select()
	macLib:LoadAutoLoadConfig()

	--// Kích hoạt lại autoSave sau khi toàn bộ UI và config đã nạp xong ổn định
	task.delay(1.5, function()
		autoSave.Resume()
	end)
end
