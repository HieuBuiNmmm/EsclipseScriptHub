-- Tab Speed (DungeonQuest).

--// Imports
local shared = require("@routes/DungeonQuest/core/shared")
local ui = require("@routes/DungeonQuest/core/ui")
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local farm = require("@routes/DungeonQuest/core/farm")
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

	section:Keybind({
		Name = "Teleport Front of Barrier",
		Default = Enum.KeyCode.B,
		Callback = function()
			task.spawn(function()
				shared.TeleportFrontOfNearestBarrier()
			end)
		end,
	}, "Keybind_TeleportBarrier")

	ui.PatchSliderLoadCallback(section:Slider({
		Name = "Barrier Teleport Distance",
		Default = shared.GetBarrierTeleportDistance(),
		Minimum = -50,
		Maximum = 50,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(value)
			shared.SetBarrierTeleportDistance(value)
		end),
	}, "Slider_TeleportBarrierDistance"))

	--// Auto Farm toggle qua phím tắt
	section:Header({ Name = "Auto Farm" })

	local function toggleAutoFarmFromKey()
		local newState = not shared.IsFarmEnabled()
		--// Đồng bộ UI toggle Auto Farm ở tab Combat (nếu có) - drive farm qua callback của nó
		local opt = macLib.Options and macLib.Options["Toggle_AutoFarm"]
		if opt and opt.UpdateState then
			opt:UpdateState(newState)
		else
			farm.Toggle(newState)
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
