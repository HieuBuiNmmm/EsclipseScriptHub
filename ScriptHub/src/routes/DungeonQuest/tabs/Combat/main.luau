-- Tab Combat (DungeonQuest): gộp Player (Speed) + Smart Dodge.
-- Mỗi module con render sections vào cùng 2 cột của tab này (gọi theo thứ tự).

return function(window, tab)
	require("@routes/DungeonQuest/tabs/Combat/player")(window, tab)
	require("@routes/DungeonQuest/tabs/Combat/smartDodge")(window, tab)
	require("@routes/DungeonQuest/tabs/Combat/skillTiming")(window, tab)
	require("@routes/DungeonQuest/tabs/Combat/autoFarm")(window, tab)
	require("@routes/DungeonQuest/tabs/Combat/smartAutoPlay")(window, tab)
end

