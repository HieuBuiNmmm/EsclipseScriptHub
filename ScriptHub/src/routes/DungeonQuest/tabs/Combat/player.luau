-- Module Player trong tab Combat (DungeonQuest).

--// Imports
local shared = require("@routes/DungeonQuest/core/shared")
local ui = require("@routes/DungeonQuest/core/ui")
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local shortcuts = require("@routes/DungeonQuest/core/shortcuts")
local autoReset = require("@routes/DungeonQuest/core/autoReset")

return function(window, tab)
	local section = tab:Section({ Side = "Right" })
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
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(Value)
			shared.SetFastSpeed(Value)
		end),
	}, "Slider_FastSpeed"))

	section:Header({ Name = "Shortcuts" })

	section:Toggle({
		Name = "Right Click Combo (Q+E)",
		Default = shortcuts.IsMouseComboEnabled(),
		Callback = autoSave.Wrap(function(state)
			shortcuts.SetMouseComboEnabled(state)
		end),
	}, "Toggle_MouseCombo")

	section:Header({ Name = "Auto Reset / Suicide" })

	section:Toggle({
		Name = "Auto Reset on Room (Once/Run)",
		Default = autoReset.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoReset.Toggle(state)
		end),
	}, "Toggle_AutoResetRoom")

	section:Dropdown({
		Name = "Target Rooms",
		Options = autoReset.GetRoomOptions(),
		Default = autoReset.GetTargetRooms(),
		Multi = true,
		Required = false,
		Callback = autoSave.Wrap(function(selected)
			autoReset.SetTargetRooms(selected)
		end),
	}, "Dropdown_AutoResetTargetRooms")

	ui.PatchSliderLoadCallback(section:Slider({
		Name = "Reset Delay (s)",
		Default = autoReset.GetDelay(),
		Minimum = 0,
		Maximum = 10,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			autoReset.SetDelay(value)
		end),
	}, "Slider_AutoResetDelay"))

	section:Button({
		Name = "Reset Character Now",
		Callback = function()
			autoReset.ResetNow()
		end,
	})
end