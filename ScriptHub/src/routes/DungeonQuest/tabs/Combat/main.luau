-- Tab Combat (DungeonQuest): gộp Player (Speed) + Hazard Scanner (vùng nguy hiểm) + AutoFarm.
-- Mỗi module con render sections vào cùng 2 cột của tab này (gọi theo thứ tự).

return function(window, tab)
	require("@routes/DungeonQuest/tabs/Combat/player")(window, tab)
	require("@routes/DungeonQuest/tabs/Combat/hazardScanner")(window, tab)
	require("@routes/DungeonQuest/tabs/Combat/autoFarm")(window, tab)
end

