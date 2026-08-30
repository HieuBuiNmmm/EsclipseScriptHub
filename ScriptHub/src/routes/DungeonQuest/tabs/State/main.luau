-- Tab State (DungeonQuest): hiển thị trạng thái thời gian thực của script.

--// Imports
local shared = require("@routes/DungeonQuest/core/shared")

local BOSS_LABEL = "Boss Active"

return function(window, tab)
	local section = tab:Section({ Side = "Left" })
	section:Header({ Name = "Trạng thái" })

	local bossLabel = section:Label({
		Text = BOSS_LABEL .. ": " .. (shared.IsBossActive() and "Có" or "Không"),
	})

	local function updateBoss(active)
		local color = active and "0, 255, 0" or "255, 80, 80"
		bossLabel:UpdateName(BOSS_LABEL .. ": <font color='rgb(" .. color .. ")'>" .. (active and "Có" or "Không") .. "</font>")
	end

	updateBoss(shared.IsBossActive())

	shared.OnBossActiveChanged(function(active)
		updateBoss(active)
	end)

	task.spawn(function()
		while task.wait(0.5) do
			updateBoss(shared.IsBossActive())
		end
	end)

	section:Header({ Name = "Thông tin màn" })
	section:Button({
		Name = "Log Enemy Types to Console",
		Callback = function()
			local names = shared.GetEnemyNames()
			print("[DungeonQuest] Enemy types trong màn (" .. #names .. "):")
			if #names == 0 then
				print("  (không có enemy nào được tìm thấy)")
			else
				for _, name in ipairs(names) do
					print("  - " .. name)
				end
			end
		end,
	})
end
