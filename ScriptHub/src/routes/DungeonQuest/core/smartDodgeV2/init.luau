-- Smart Dodge V2: Main Module Entry
-- Gom các subsystem thành một module thống nhất

local types = require("@routes/DungeonQuest/core/smartDodgeV2/types")
local filter = require("@routes/DungeonQuest/core/smartDodgeV2/filter")
local visuals = require("@routes/DungeonQuest/core/smartDodgeV2/visuals")
local detection = require("@routes/DungeonQuest/core/smartDodgeV2/detection")
local danger = require("@routes/DungeonQuest/core/smartDodgeV2/danger")

local smartDodgeV2 = {
	types = types,
	filter = filter,
	visuals = visuals,
	detection = detection,
	danger = danger,
	geometry = danger,
}

return smartDodgeV2
