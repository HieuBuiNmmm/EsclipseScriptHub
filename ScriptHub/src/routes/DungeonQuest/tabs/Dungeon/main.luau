-- Tab Dungeon (DungeonQuest): Auto Join Dungeon.

--// Imports
local ui = require("@routes/DungeonQuest/core/ui")
local autoJoin = require("@routes/DungeonQuest/core/autoJoin")
local autoSave = require("@routes/DungeonQuest/core/autoSave")

local DUNGEONS = {
	"Desert Temple", "Winter Outpost", "Pirate Island", "King's Castle",
	"The Underworld", "Samurai Palace", "The Canals", "Ghastly Harbor",
	"Steampunk Sewers", "Orbital Outpost", "Volcanic Chambers",
	"Aquatic Temple", "Enchanted Forest",
}

local DIFFICULTIES = { "Easy", "Medium", "Hard", "Insane", "Nightmare" }

return function(window, tab)
	local section = tab:Section({ Side = "Left" })
	section:Header({ Name = "Auto Join Dungeon" })

	section:Toggle({
		Name = "Auto Join Dungeon",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			autoJoin.Toggle(state)
		end),
	}, "Toggle_AutoJoin")

	section:Dropdown({
		Name = "Dungeon",
		Options = DUNGEONS,
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			autoJoin.SetDungeon(option)
		end),
	}, "Dropdown_Dungeon")

	section:Dropdown({
		Name = "Difficulty",
		Options = DIFFICULTIES,
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			autoJoin.SetDifficulty(option)
		end),
	}, "Dropdown_Difficulty")

	section:Toggle({
		Name = "Hardcore",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			autoJoin.SetHardcore(state)
		end),
	}, "Toggle_HardcoreAJ")

	ui.PatchSliderLoadCallback(section:Slider({
		Name = "Delay",
		Default = 3,
		Minimum = 0,
		Maximum = 15,
		DisplayMethod = "Round",
		Precision = 1,
		Suffix = "s",
		Callback = autoSave.Wrap(function(Value)
			autoJoin.SetDelay(Value)
		end),
	}, "Slider_JoinDelay"))

	section:Button({
		Name = "Join Now",
		Callback = function()
			autoJoin.JoinNow()
		end,
	})
end
