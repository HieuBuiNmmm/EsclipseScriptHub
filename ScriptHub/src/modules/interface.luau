--// Types
type Window = { Visible: boolean? }

--// Imports
local binder = require("@core/binder")

--// Variables
local interface = {}

--// Initialize
function interface:Window(properties: Window): Window
	properties = properties or {}
	print("Made a window")

	local object = binder.Wrap(properties, {
		Visible = function(value: boolean)
			print("Set window visibility to:", value)
		end,
	})

	return binder.Apply(properties, object)
end

return interface
