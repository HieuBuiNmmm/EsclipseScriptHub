-- Module Mix trong tab Utilities (DungeonQuest): các tiện ích tổng hợp (anti afk, ...).

--// Imports
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local ui = require("@routes/DungeonQuest/core/ui")
local antiAfk = require("@modules/antiAfk")
local streamingMode = require("@routes/DungeonQuest/core/streamingMode")

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
		Name = "Interval (seconds)",
		Default = antiAfk.GetInterval(),
		Minimum = 5,
		Maximum = 300,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(value)
			antiAfk.SetInterval(value)
		end),
	}, "Slider_AntiAFKInterval"))

	--// Streaming Mode (Ẩn danh tính Player khi quay video / stream)
	local streamSection = tab:Section({ Side = "Right" })
	streamSection:Header({ Name = "Streaming Mode" })

	streamSection:Toggle({
		Name = "Streaming Mode (Hide Identity)",
		Default = streamingMode.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			if state then
				streamingMode.Start()
			else
				streamingMode.Stop()
			end
		end),
	}, "Toggle_StreamingMode")

	streamSection:Toggle({
		Name = "Hide Stats (Level, XP, HP)",
		Default = streamingMode.IsMaskStats(),
		Callback = autoSave.Wrap(function(state)
			streamingMode.SetMaskStats(state)
		end),
	}, "Toggle_StreamingMaskStats")

	streamSection:Input({
		Name = "Fake Display Name",
		Placeholder = "Username",
		AcceptedCharacters = "All",
		Default = streamingMode.GetReplacement(),
		Callback = autoSave.Wrap(function(input)
			streamingMode.SetReplacement(input)
		end),
	}, "Input_StreamingReplacement")
end

