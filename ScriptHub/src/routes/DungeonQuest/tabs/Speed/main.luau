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
		Maximum = 24,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			shared.SetFastSpeed(Value)
		end),
	}, "Slider_FastSpeed"))

	section:Header({ Name = "Teleport" })

	section:Button({
		Name = "Teleport Nearest (Key: R)",
		Callback = function()
			task.spawn(function()
				shared.TeleportToNearestEnemy()
			end)
		end,
	})

	ui.PatchSliderLoadCallback(section:Slider({
		Name = "R Teleport Distance",
		Default = shared.GetNearestTeleportDistance(),
		Minimum = 1,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(value)
			shared.SetNearestTeleportDistance(value)
		end),
	}, "Slider_TeleportNearestDistance"))

	section:Button({
		Name = "Teleport Behind Farthest (Key: C)",
		Callback = function()
			task.spawn(function()
				shared.TeleportBehindFarthestEnemy()
			end)
		end,
	})

	ui.PatchSliderLoadCallback(section:Slider({
		Name = "C Teleport Distance",
		Default = shared.GetFarthestTeleportDistance(),
		Minimum = 1,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(value)
			shared.SetFarthestTeleportDistance(value)
		end),
	}, "Slider_TeleportFarthestDistance"))

end
