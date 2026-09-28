-- System Facade

local lifecycle = require("./lifecycle")
local notifier = require("./notifier")
local autoSave = require("./autoSave")

return {
	Lifecycle = lifecycle,
	Notifier = notifier,
	AutoSave = autoSave,
}
