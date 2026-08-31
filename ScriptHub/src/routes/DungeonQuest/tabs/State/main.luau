-- Tab State (DungeonQuest): hiển thị trạng thái thời gian thực của script.

--// Imports
local shared = require("@routes/DungeonQuest/core/shared")

local BOSS_LABEL = "Boss Active"
local BOSS_INDEX_LABEL = "Boss"
local DUNGEON_LABEL = "Dungeon"

return function(window, tab)
	local section = tab:Section({ Side = "Left" })
	section:Header({ Name = "Status" })

	local bossLabel = section:Label({
		Text = BOSS_LABEL .. ": " .. (shared.IsBossActive() and "Yes" or "No"),
	})

	local function updateBoss(active)
		local color = active and "0, 255, 0" or "255, 80, 80"
		bossLabel:UpdateName(BOSS_LABEL .. ": <font color='rgb(" .. color .. ")'>" .. (active and "Yes" or "No") .. "</font>")
	end

	updateBoss(shared.IsBossActive())

	shared.OnBossActiveChanged(function(active)
		updateBoss(active)
	end)

	local bossIndexLabel = section:Label({
		Text = BOSS_INDEX_LABEL .. ": 0",
	})

	local function updateBossIndex()
		bossIndexLabel:UpdateName(BOSS_INDEX_LABEL .. ": " .. shared.GetCurrentBossIndex())
	end

	updateBossIndex()

	shared.OnBossIndexChanged(function()
		updateBossIndex()
	end)

	task.spawn(function()
		while task.wait(0.5) do
			updateBoss(shared.IsBossActive())
			updateBossIndex()
		end
	end)

	section:Header({ Name = "Level Info" })

	local dungeonLabel = section:Label({
		Text = DUNGEON_LABEL .. ": Unknown",
	})

	local function updateDungeon()
		local name = shared.GetCurrentDungeonName()
		if name then
			dungeonLabel:UpdateName(DUNGEON_LABEL .. ": " .. name)
		else
			dungeonLabel:UpdateName(DUNGEON_LABEL .. ": <font color='rgb(255, 80, 80)'>Unknown</font>")
		end
	end

	updateDungeon()

	shared.OnDungeonNameChanged(function()
		updateDungeon()
	end)

	section:Button({
		Name = "Log Enemy Types to Console",
		Callback = function()
			local names = shared.GetEnemyNames()
			print("[DungeonQuest] Enemy types in map (" .. #names .. "):")
			if #names == 0 then
				print("  (no enemies found)")
			else
				for _, name in ipairs(names) do
					print("  - " .. name)
				end
			end
		end,
	})
end
