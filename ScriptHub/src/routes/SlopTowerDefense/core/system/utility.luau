-- Utility: Quản lý các tùy chọn tiện ích hệ thống (Auto Hide, Auto Anti Macro).

local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")
local antiMacro = require("@routes/SlopTowerDefense/core/game/antiMacro")
local logger = require("@routes/SlopTowerDefense/core/system/logger")

local utility = {
	AutoHideEnabled = false,
	AutoAntiMacroEnabled = false,
}

function utility.SetAutoHide(enabled: boolean)
	utility.AutoHideEnabled = (enabled == true)
end

function utility.IsAutoHideEnabled(): boolean
	return utility.AutoHideEnabled
end

function utility.SetAutoAntiMacro(enabled: boolean)
	utility.AutoAntiMacroEnabled = (enabled == true)
	antiMacro.SetEnabled(utility.AutoAntiMacroEnabled)
end

function utility.IsAutoAntiMacroEnabled(): boolean
	return utility.AutoAntiMacroEnabled
end

function utility.SetDebugLogs(enabled: boolean)
	logger.SetDebugEnabled(enabled)
end

function utility.IsDebugLogsEnabled(): boolean
	return logger.IsDebugEnabled()
end

function utility.Reset()
	utility.AutoHideEnabled = false
	utility.AutoAntiMacroEnabled = false
	antiMacro.SetEnabled(false)
	logger.SetDebugEnabled(false)
end

lifecycle.Register(function()
	utility.Reset()
end)

return utility
