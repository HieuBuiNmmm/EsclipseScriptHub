-- Game Facade

local constants = require("./constants")
local zoneGuard = require("./zoneGuard")
local elevatorJoiner = require("./elevatorJoiner")
local matchSetup = require("./matchSetup")
local matchAutomation = require("./matchAutomation")
local antiMacro = require("./antiMacro")
local autoSummon = require("./autoSummon")
local autoContracts = require("./autoContracts")
local autoQuests = require("./autoQuests")
local autoGifts = require("./autoGifts")
local autoCrate = require("./autoCrate")

return {
	Constants = constants,
	ZoneGuard = zoneGuard,
	ElevatorJoiner = elevatorJoiner,
	MatchSetup = matchSetup,
	MatchAutomation = matchAutomation,
	AntiMacro = antiMacro,
	AutoSummon = autoSummon,
	AutoContracts = autoContracts,
	AutoQuests = autoQuests,
	AutoGifts = autoGifts,
	AutoCrate = autoCrate,
}
