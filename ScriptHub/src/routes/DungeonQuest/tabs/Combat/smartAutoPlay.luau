-- Tab Combat - Submodule Smart Auto Play (DungeonQuest)
-- Step 1: Visual Combat Radius Controls

local ui = require("@routes/DungeonQuest/core/ui")
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local smartAutoPlay = require("@routes/DungeonQuest/core/smartAutoPlay")

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Smart Auto Play - Visuals" })

	leftSection:Toggle({
		Name = "Show Radius Circle (Spheres)",
		Default = smartAutoPlay.IsShowRadiusCircleEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartAutoPlay.SetShowRadiusCircle(state)
		end),
	}, "Toggle_SAP_RadiusCircle")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Radius R",
		Suffix = " std",
		Default = smartAutoPlay.GetRadius(),
		Minimum = 4,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			smartAutoPlay.SetRadius(val)
		end),
	}, "Slider_SAP_Radius"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Sphere Size",
		Suffix = " std",
		Default = smartAutoPlay.GetSphereSize(),
		Minimum = 0.1,
		Maximum = 2.0,
		DisplayMethod = "Round",
		Precision = 2,
		Callback = autoSave.Wrap(function(val)
			smartAutoPlay.SetSphereSize(val)
		end),
	}, "Slider_SAP_SphereSize"))
end
