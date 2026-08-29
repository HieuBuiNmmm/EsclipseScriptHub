-- Tab Combat (DungeonQuest): Farm, Combat, Auto Start/Retry.

--// Imports
local shared = require("@routes/DungeonQuest/core/shared")
local ui = require("@routes/DungeonQuest/core/ui")
local combat = require("@routes/DungeonQuest/core/combat")
local farm = require("@routes/DungeonQuest/core/farm")
local autoStart = require("@routes/DungeonQuest/core/autoStart")
local autoRetry = require("@routes/DungeonQuest/core/autoRetry")
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local esp = require("@routes/DungeonQuest/core/esp")

return function(window, tab)
	--// Sections
	local farmSection = tab:Section({ Side = "Left" })
	local combatSection = tab:Section({ Side = "Right" })
	local startSection = tab:Section({ Side = "Left" })

	farmSection:Header({ Name = "Auto Farm" })
	combatSection:Header({ Name = "Combat" })
	startSection:Header({ Name = "Auto Start Game" })

	--// Farm
	farmSection:Toggle({
		Name = "Auto Farm",
		Default = shared.IsFarmEnabled(),
		Callback = autoSave.Wrap(function(state)
			farm.Toggle(state)
		end),
	}, "Toggle_AutoFarm")

	local applyFarmModeVisibility
	farmSection:Dropdown({
		Name = "Farm Mode",
		Options = { "Orbit", "Hover" },
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			if option then shared.SetFarmMode(option) end
			applyFarmModeVisibility()
		end),
	}, "Dropdown_FarmMode")

	local orbitRadiusSlider = ui.PatchSliderLoadCallback(farmSection:Slider({
		Name = "Orbit Radius",
		Default = shared.GetOrbitRadius(),
		Minimum = 5,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			shared.SetOrbitRadius(Value)
		end),
	}, "Slider_OrbitRadius"))

	local orbitSpeedSlider = ui.PatchSliderLoadCallback(farmSection:Slider({
		Name = "Orbit Speed",
		Default = shared.GetOrbitSpeed(),
		Minimum = 30,
		Maximum = 600,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			shared.SetOrbitSpeed(Value)
		end),
	}, "Slider_OrbitSpeed"))

	local orbitHeightSlider = ui.PatchSliderLoadCallback(farmSection:Slider({
		Name = "Orbit Height",
		Default = shared.GetOrbitHeight(),
		Minimum = 0,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			shared.SetOrbitHeight(Value)
		end),
	}, "Slider_OrbitHeight"))

	local hoverHeightSlider = ui.PatchSliderLoadCallback(farmSection:Slider({
		Name = "Hover Height",
		Default = shared.GetHoverHeight(),
		Minimum = 0,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			shared.SetHoverHeight(Value)
		end),
	}, "Slider_HoverHeight"))

	ui.PatchSliderLoadCallback(farmSection:Slider({
		Name = "Teleport Distance",
		Default = shared.GetFarmEngageDistance(),
		Minimum = 5,
		Maximum = 300,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			shared.SetFarmEngageDistance(Value)
		end),
	}, "Slider_TeleportDistance"))

	applyFarmModeVisibility = function()
		local isOrbit = shared.GetFarmMode() ~= "Hover"
		pcall(function() orbitRadiusSlider:SetVisibility(isOrbit) end)
		pcall(function() orbitSpeedSlider:SetVisibility(isOrbit) end)
		pcall(function() orbitHeightSlider:SetVisibility(isOrbit) end)
		pcall(function() hoverHeightSlider:SetVisibility(not isOrbit) end)
	end
	applyFarmModeVisibility()

	--// Combat
	combatSection:Toggle({
		Name = "Auto Skill (Q + E)",
		Default = shared.IsAutoSkillEnabled(),
		Callback = autoSave.Wrap(function(state)
			combat.ToggleAutoSkill(state)
		end),
	}, "Toggle_AutoSkill")

	ui.PatchSliderLoadCallback(combatSection:Slider({
		Name = "Skill Interval",
		Default = shared.GetSkillInterval(),
		Minimum = 0.1,
		Maximum = 10,
		DisplayMethod = "Round",
		Precision = 1,
		Suffix = "s",
		Callback = autoSave.Wrap(function(Value)
			shared.SetSkillInterval(Value)
		end),
	}, "Slider_SkillInterval"))

	local applySkillModeVisibility
	combatSection:Dropdown({
		Name = "Auto Skill Mode",
		Options = { "Spam", "Target Only" },
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			if option then shared.SetAutoSkillMode(option) end
			applySkillModeVisibility()
		end),
	}, "Dropdown_AutoSkillMode")

	local skillRangeSlider = ui.PatchSliderLoadCallback(combatSection:Slider({
		Name = "Skill Range",
		Default = shared.GetSkillRange(),
		Minimum = 5,
		Maximum = 200,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			shared.SetSkillRange(Value)
		end),
	}, "Slider_SkillRange"))

	applySkillModeVisibility = function()
		local targetOnly = shared.GetAutoSkillMode() == "Target Only"
		pcall(function() skillRangeSlider:SetVisibility(targetOnly) end)
	end
	applySkillModeVisibility()

	combatSection:Button({
		Name = "Teleport Nearest (Key: R)",
		Callback = function()
			task.spawn(function()
				shared.TeleportToNearestEnemy()
			end)
		end,
	})

	combatSection:Toggle({
		Name = "Highlight Hitboxes",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			esp.Toggle(state)
		end),
	}, "Toggle_HighlightHitboxes")

	--// Auto Start / Retry
	startSection:Toggle({
		Name = "Auto Start",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			autoStart.Toggle(state)
		end),
	}, "Toggle_AutoStart")

	startSection:Toggle({
		Name = "Auto Retry",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			autoRetry.Toggle(state)
		end),
	}, "Toggle_AutoRetry")
end
