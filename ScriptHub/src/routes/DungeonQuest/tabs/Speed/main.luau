-- Tab Speed (DungeonQuest).

--// Imports
local shared = require("@routes/DungeonQuest/core/shared")
local ui = require("@routes/DungeonQuest/core/ui")
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local autoFarmPathfinder = require("@routes/DungeonQuest/core/autoFarmPathfinder")
local macLib = require("@packages/Maclib")

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

	--// Auto Farm (Pathfinder v2) toggle qua phím tắt
	section:Header({ Name = "Auto Farm" })

	local function toggleAutoFarmFromKey()
		local newState = not autoFarmPathfinder.IsEnabled()
		--// Đồng bộ UI toggle Auto Farm ở tab Auto Farm - drive farm qua callback của nó
		local opt = macLib.Options and macLib.Options["Toggle_PathfinderFarm"]
		if opt and opt.UpdateState then
			opt:UpdateState(newState)
		else
			autoFarmPathfinder.Toggle(newState)
		end
	end

	section:Keybind({
		Name = "Toggle Auto Farm",
		Default = Enum.KeyCode.X,
		Callback = function()
			toggleAutoFarmFromKey()
		end,
	}, "Keybind_AutoFarm")

end