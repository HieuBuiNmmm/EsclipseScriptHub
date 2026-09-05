-- Tab Utilities (DungeonQuest): gộp Visual + Notifications (Webhook) + Mix (Anti AFK).
-- Mỗi module con render sections vào cùng 2 cột của tab này (gọi theo thứ tự).

return function(window, tab)
	require("@routes/DungeonQuest/tabs/Utilities/visual")(window, tab)
	require("@routes/DungeonQuest/tabs/Utilities/notifications")(window, tab)
	require("@routes/DungeonQuest/tabs/Utilities/mix")(window, tab)
end