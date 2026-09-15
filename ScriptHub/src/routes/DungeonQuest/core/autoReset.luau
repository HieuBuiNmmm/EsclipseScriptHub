-- Auto Reset Module (DungeonQuest)
-- Tự sát (reset nhân vật) khi bắt được sự thay đổi index của room (room x thì reset 1 lần)

local shared = require("@routes/DungeonQuest/core/shared")

return {
	IsEnabled = shared.IsAutoResetEnabled,
	SetEnabled = shared.SetAutoResetEnabled,
	GetTargetRoom = shared.GetAutoResetTargetRoom,
	SetTargetRoom = shared.SetAutoResetTargetRoom,
	GetDelay = shared.GetAutoResetDelay,
	SetDelay = shared.SetAutoResetDelay,
	OnChanged = shared.OnAutoResetChanged,
	Suicide = shared.Suicide,
}
