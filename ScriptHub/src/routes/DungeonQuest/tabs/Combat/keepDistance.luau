-- Module Keep Distance (Push) trong tab Combat (DungeonQuest): section độc lập để xóa sạch khi cần.
-- Xóa = xóa file này + core/keepDistance.luau + dòng require trong tabs/Combat/main.luau.

--// Imports
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local ui = require("@routes/DungeonQuest/core/ui")
local keepDistance = require("@routes/DungeonQuest/core/keepDistance")

return function(window, tab)
	local section = tab:Section({ Side = "Right" })
	section:Header({ Name = "Keep Distance (Push)" })

	section:Toggle({
		Name = "Enable Keep Distance",
		Default = keepDistance.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			keepDistance.SetEnabled(state)
		end),
	}, "Toggle_KeepDistance")

	section:Slider({
		Name = "Min Distance (studs)",
		Default = keepDistance.GetMinDistance(),
		Minimum = 0,
		Maximum = 30,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(value)
			keepDistance.SetMinDistance(value)
		end),
	}, "Slider_KeepDistanceMinDistance")

	section:Slider({
		Name = "Push Speed",
		Default = keepDistance.GetPushSpeed(),
		Minimum = 5,
		Maximum = 120,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(value)
			keepDistance.SetPushSpeed(value)
		end),
	}, "Slider_KeepDistancePushSpeed")

	local statusLabel = section:Label({ Text = "" })
	local function updateStatus()
		local stateText = keepDistance.IsEnabled()
			and "<font color='rgb(0,255,0)'>ON</font>"
			or "<font color='rgb(255,80,80)'>OFF</font>"
		pcall(function()
			statusLabel:UpdateName(
				"Keep Distance: " .. stateText
					.. "\nMin: " .. string.format("%.0f", keepDistance.GetMinDistance()) .. " studs"
					.. " / Speed: " .. string.format("%.0f", keepDistance.GetPushSpeed())
			)
		end)
	end

	updateStatus()

	task.spawn(function()
		while task.wait(0.25) do
			updateStatus()
		end
	end)
end