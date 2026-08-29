--// Imports
local flags = require("@core/flags")
local interface = require("@modules/interface")
local esp = require("@modules/esp")

--// Initialize
local window = interface:Window({
	Visible = true,
})

return {
	Flags = flags,
	Esp = esp,
	Interface = interface,
	Window = window,

	Tabs = {
		Home = function(self)
			-- ....

			-- return tab
		end,

		Visuals = function(self)
			-- ....

			-- return tab
		end,

		Settings = function(self)
			-- ....

			-- return tab
		end,

		Config = function(self)
			-- ....

			-- return tab
		end,
	},
}
