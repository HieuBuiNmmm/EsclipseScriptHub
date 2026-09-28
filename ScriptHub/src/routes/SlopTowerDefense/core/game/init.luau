-- Game Facade

local constants = require("./constants")
local zoneGuard = require("./zoneGuard")
local elevatorJoiner = require("./elevatorJoiner")
local matchSetup = require("./matchSetup")
local matchAutomation = require("./matchAutomation")

return {
	Constants = constants,
	ZoneGuard = zoneGuard,
	ElevatorJoiner = elevatorJoiner,
	MatchSetup = matchSetup,
	MatchAutomation = matchAutomation,
}
