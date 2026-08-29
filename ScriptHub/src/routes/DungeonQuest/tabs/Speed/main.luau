-- Tab Speed (DungeonQuest).

--// Imports
local shared = require("@routes/DungeonQuest/core/shared")
local ui = require("@routes/DungeonQuest/core/ui")
local autoSave = require("@routes/DungeonQuest/core/autoSave")

return function(window, tab)
	local section = tab:Section({ Side = "Left" })
	section:Header({ Name = "Movement Speed" })

	section:Toggle({
		Name = "Fast Speed",
		Default = shared.IsSpeedEnabled(),
		Callback = autoSave.Wrap(function(state)
			shared.SetSpeedEnabled(state)
		end),
	}, "Toggle_FastSpeed")

	ui.PatchSliderLoadCallback(section:Slider({
		Name = "Custom Fast Speed",
		Default = shared.GetFastSpeed(),
		Minimum = 16,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			shared.SetFastSpeed(Value)
		end),
	}, "Slider_FastSpeed"))
end
