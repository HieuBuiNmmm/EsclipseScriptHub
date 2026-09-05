-- Tab Configs (DungeonQuest): gộp Config (quản lý config) + State (giám sát realtime).
-- Mỗi module con render sections vào cùng 2 cột của tab này (gọi theo thứ tự).

return function(window, tab)
	require("@routes/DungeonQuest/tabs/Configs/config")(window, tab)
	require("@routes/DungeonQuest/tabs/Configs/state")(window, tab)
end