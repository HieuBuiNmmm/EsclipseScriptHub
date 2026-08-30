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
		Notifications = tabGroup:Tab({ Name = "Notifications", Image = "rbxassetid://10734950309" }),
	}

	--// Config
	macLib:SetFolder("EsclipseHub")

	--// Tab UI (mỗi tab trigger require các core logic tương ứng)
	local speedTab = require("@routes/DungeonQuest/tabs/Speed/main")
	local combatTab = require("@routes/DungeonQuest/tabs/Combat/main")
	local dungeonTab = require("@routes/DungeonQuest/tabs/Dungeon/main")
	local configTab = require("@routes/DungeonQuest/tabs/Config/main")
	local notificationsTab = require("@routes/DungeonQuest/tabs/Notifications/main")

	speedTab(window, tabs.Speed)
	combatTab(window, tabs.Combat)
	dungeonTab(window, tabs.Dungeon)
	configTab(window, tabs.Config)
	notificationsTab(window, tabs.Notifications)

	--// Phím tắt
	local shortcuts = require("@routes/DungeonQuest/core/shortcuts")
	shortcuts.Init()

	--// Webhook Discord (thông báo WIN + Reward)
	local webhook = require("@routes/DungeonQuest/core/webhook")
	webhook.Init()

	--// Smart Dodge (tránh cột-skill như firstBossCrissCross)
	local shared = require("@routes/DungeonQuest/core/shared")
	local dodge = require("@routes/DungeonQuest/core/dodge")
	dodge.OnDodgeChange(function(isDodging)
		shared.SetDodging(isDodging)
	end)
	dodge.Init()

	--// Basic Orbit Dodge (kiểu dodge đảo hướng orbit cho chiêu tốc độ bình thường)
	require("@routes/DungeonQuest/core/basicOrbitDodge")

	--// Death Logger (điều tra nguyên nhân chết -> khảo sát hazard)
	local deathLog = require("@routes/DungeonQuest/core/deathLog")
	deathLog.Init()

	--// Auto Hide UI (ẩn cửa sổ sau khi execute)
	local autoHide = require("@routes/DungeonQuest/core/autoHide")
	autoHide.SetWindow(window)
	autoHide.Execute()

	--// Khởi chạy
	tabs.Speed:Select()
	macLib:LoadAutoLoadConfig()
end
