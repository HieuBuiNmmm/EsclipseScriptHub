-- Logger: Quản lý việc xuất debug log và warn ra console thông qua toggle.
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")

local logger = {
	DebugEnabled = false,
}

function logger.SetDebugEnabled(enabled: boolean)
	logger.DebugEnabled = (enabled == true)
end

function logger.IsDebugEnabled(): boolean
	return logger.DebugEnabled
end

function logger.Log(...)
	if logger.DebugEnabled then
		print(...)
	end
end

function logger.Warn(...)
	if logger.DebugEnabled then
		warn(...)
	end
end

function logger.Error(...)
	if logger.DebugEnabled then
		warn(...)
	end
end

function logger.Reset()
	logger.DebugEnabled = false
end

lifecycle.Register(function()
	logger.Reset()
end)

return logger
