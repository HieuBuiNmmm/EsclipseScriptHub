-- Module Mix trong tab Utilities (DungeonQuest): các tiện ích tổng hợp (anti afk, ...).

--// Imports
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local ui = require("@routes/DungeonQuest/core/ui")
local antiAfk = require("@modules/antiAfk")

return function(window, tab)
	local section = tab:Section({ Side = "Left" })
	section:Header({ Name = "Anti AFK" })

	section:Toggle({
		Name = "Anti AFK",
		Default = antiAfk.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			if state then
				antiAfk.Start()
			else
				antiAfk.Stop()
			end
		end),
	}, "Toggle_AntiAFK")

	ui.PatchSliderLoadCallback(section:Slider({
		Name = "Interval (giây)",
		Default = antiAfk.GetInterval(),
		Minimum = 5,
		Maximum = 300,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(value)
			antiAfk.SetInterval(value)
		end),
	}, "Slider_AntiAFKInterval"))
end
