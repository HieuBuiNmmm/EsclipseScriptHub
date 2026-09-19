-- Tab Combat (DungeonQuest): gộp Master Combat Switch + Player (Speed) + Hazard Scanner + AutoFarm.

local autoSave = require("@routes/DungeonQuest/core/autoSave")
local combatMaster = require("@routes/DungeonQuest/core/combatMaster")
local renderPlayer = require("@routes/DungeonQuest/tabs/Combat/player")
local renderEvasion = require("@routes/DungeonQuest/tabs/Combat/evasion")
local renderAutoFarm = require("@routes/DungeonQuest/tabs/Combat/autoFarm")

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Combat Master" })

	local masterToggle = leftSection:Toggle({
		Name = "Enable Combat Master",
		Default = combatMaster.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			combatMaster.Toggle(state)
		end),
	}, "Toggle_CombatMaster")

	leftSection:Toggle({
		Name = "Auto Boss Combat (Skip Boss Macro)",
		Default = combatMaster.IsAutoBossCombatEnabled(),
		Callback = autoSave.Wrap(function(state)
			combatMaster.SetAutoBossCombat(state)
		end),
	}, "Toggle_AutoBossCombat")

	combatMaster.OnStateChanged(function(state)
		pcall(function()
			masterToggle:UpdateState(state, true)
		end)
	end)

	renderPlayer(window, tab)
	renderEvasion(window, tab)
	renderAutoFarm(window, tab)
end


