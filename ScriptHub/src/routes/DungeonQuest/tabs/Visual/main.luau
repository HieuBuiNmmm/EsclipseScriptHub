-- Tab Visual (DungeonQuest): các tính năng hiển thị trực quan (visual).

--// Imports
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local esp = require("@routes/DungeonQuest/core/esp")
local basicOrbitDodge = require("@routes/DungeonQuest/core/basicOrbitDodge")

return function(window, tab)
	local section = tab:Section({ Side = "Left" })
	section:Header({ Name = "Hitbox" })

	section:Toggle({
		Name = "Highlight Hitboxes",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			esp.Toggle(state)
		end),
	}, "Toggle_HighlightHitboxes")

	section:Header({ Name = "Dodge Visuals" })

	section:Toggle({
		Name = "Dead Zone Visuals",
		Default = basicOrbitDodge.IsDebugVisuals(),
		Callback = autoSave.Wrap(function(state)
			basicOrbitDodge.SetDebugVisuals(state)
		end),
	}, "Toggle_DeadZoneVisuals")

	section:Toggle({
		Name = "Detector Visuals",
		Default = basicOrbitDodge.IsDetectorVisuals(),
		Callback = autoSave.Wrap(function(state)
			basicOrbitDodge.SetDetectorVisuals(state)
		end),
	}, "Toggle_DetectorVisuals")

	section:Dropdown({
		Name = "Detector Shape",
		Options = { "Circle", "Cone" },
		Default = (basicOrbitDodge.GetDetectorMode() == "Cone" and 2) or 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			if option == "Cone" then
				basicOrbitDodge.SetDetectorMode("Cone")
			else
				basicOrbitDodge.SetDetectorMode("Circle")
			end
		end),
	}, "Dropdown_DetectorShape")
end