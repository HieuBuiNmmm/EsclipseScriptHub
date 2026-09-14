-- Threat Detection Engine (Pure Neon & Dynamic Detection)
-- Chuyên trách: Phát hiện mối nguy hiểm (Hazards), Beam, Orb, Quỹ đạo, Geometry Hitbox

local types = require("@routes/DungeonQuest/core/smartDodgeV2/types")
local filter = require("@routes/DungeonQuest/core/smartDodgeV2/filter")
local visuals = require("@routes/DungeonQuest/core/smartDodgeV2/visuals")
local detection = require("@routes/DungeonQuest/core/smartDodgeV2/detection")
local danger = require("@routes/DungeonQuest/core/smartDodgeV2/danger")
local safeSpot = require("@routes/DungeonQuest/core/smartDodgeV2/safeSpot")
local dodge = require("@routes/DungeonQuest/core/smartDodgeV2/dodge")
local bossArea = require("@routes/DungeonQuest/core/smartDodgeV2/bossArea")

local smartDodgeV2 = {
	types = types,
	filter = filter,
	visuals = visuals,
	detection = detection,
	danger = danger,
	geometry = danger,
	safeSpot = safeSpot,
	dodge = dodge,
	bossArea = bossArea,

	-- Orange Corridor Length Controls (Vùng màu Cam)
	SetSkillCorridorLength = detection.SetSkillCorridorLength,
	GetSkillCorridorLength = detection.GetSkillCorridorLength,
	SetOrbCorridorLength = detection.SetOrbCorridorLength,
	GetOrbCorridorLength = detection.GetOrbCorridorLength,
	SetBeamCorridorLength = detection.SetBeamCorridorLength,
	GetBeamCorridorLength = detection.GetBeamCorridorLength,


	-- Target Scope Control (All / Boss / Mobs)
	SetTargetScope = danger.SetTargetScope,
	GetTargetScope = danger.GetTargetScope,
}

return smartDodgeV2
