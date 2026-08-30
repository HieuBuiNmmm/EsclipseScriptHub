-- Tab Auto Farm (DungeonQuest): Farm, Combat, Auto Start/Retry.

--// Imports
local macLib = require("@packages/Maclib")
local shared = require("@routes/DungeonQuest/core/shared")
local ui = require("@routes/DungeonQuest/core/ui")
local combat = require("@routes/DungeonQuest/core/combat")
local farm = require("@routes/DungeonQuest/core/farm")
local autoStart = require("@routes/DungeonQuest/core/autoStart")
local autoRetry = require("@routes/DungeonQuest/core/autoRetry")
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local basicOrbitDodge = require("@routes/DungeonQuest/core/basicOrbitDodge")
local deathLog = require("@routes/DungeonQuest/core/deathLog")

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
		Options = { "Orbit", "Orbit Tele", "Hover" },
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
		Minimum = 24,
		Maximum = 96,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			shared.SetOrbitSpeed(Value)
		end),
	}, "Slider_OrbitSpeed"))

	local orbitTeleStepSlider = ui.PatchSliderLoadCallback(farmSection:Slider({
		Name = "Orbit Tele Step",
		Default = shared.GetOrbitTeleStep(),
		Minimum = 5,
		Maximum = 90,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			shared.SetOrbitTeleStep(Value)
		end),
	}, "Slider_OrbitTeleStep"))

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

	farmSection:Toggle({
		Name = "Maintain Orbit Height on Boss",
		Default = shared.GetMaintainBossHeight(),
		Callback = autoSave.Wrap(function(state)
			shared.SetMaintainBossHeight(state)
		end),
	}, "Toggle_MaintainBossHeight")

	ui.PatchSliderLoadCallback(farmSection:Slider({
		Name = "Boss Height Offset",
		Default = shared.GetBossHeightOffset(),
		Minimum = -100,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			shared.SetBossHeightOffset(Value)
		end),
	}, "Slider_BossHeightOffset"))

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

	farmSection:Toggle({
		Name = "Auto Retarget",
		Default = shared.GetRetargetEnabled(),
		Callback = autoSave.Wrap(function(state)
			shared.SetRetargetEnabled(state)
		end),
	}, "Toggle_Retarget")

	farmSection:Dropdown({
		Name = "Retarget Method",
		Options = { "Auto", "Tele", "Tween" },
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			if option then shared.SetRetargetMethod(option) end
		end),
	}, "Dropdown_RetargetMethod")

	farmSection:Dropdown({
		Name = "Retarget Mode",
		Options = { "Nearest", "Farthest" },
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			if option then shared.SetRetargetMode(option) end
		end),
	}, "Dropdown_RetargetMode")

	farmSection:Toggle({
		Name = "Reverse Orbit on Retarget",
		Default = shared.GetOrbitReverseEnabled(),
		Callback = autoSave.Wrap(function(state)
			shared.SetOrbitReverseEnabled(state)
		end),
	}, "Toggle_OrbitReverse")

	applyFarmModeVisibility = function()
		local mode = shared.GetFarmMode()
		local isOrbit = mode == "Orbit"
		local isOrbitTele = mode == "Orbit Tele"
		local isOrbitLike = isOrbit or isOrbitTele
		pcall(function() orbitRadiusSlider:SetVisibility(isOrbitLike) end)
		pcall(function() orbitSpeedSlider:SetVisibility(isOrbit) end)
		pcall(function() orbitTeleStepSlider:SetVisibility(isOrbitTele) end)
		pcall(function() orbitHeightSlider:SetVisibility(isOrbitLike) end)
		pcall(function() hoverHeightSlider:SetVisibility(not isOrbitLike) end)
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

	combatSection:Toggle({
		Name = "Basic Orbit Dodge",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			basicOrbitDodge.Toggle(state)
		end),
	}, "Toggle_BasicOrbitDodge")

	combatSection:Dropdown({
		Name = "Dodge Mode",
		Options = { "All", "Boss Only" },
		Default = (basicOrbitDodge.GetMode() == "Boss" and 2) or 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			if option == "Boss Only" then
				basicOrbitDodge.SetMode("Boss")
			else
				basicOrbitDodge.SetMode("All")
			end
		end),
	}, "Dropdown_DodgeMode")

	ui.PatchSliderLoadCallback(combatSection:Slider({
		Name = "Dodge Detect Radius",
		Default = basicOrbitDodge.GetDetectRadius(),
		Minimum = 5,
		Maximum = 50,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			basicOrbitDodge.SetDetectRadius(Value)
		end),
	}, "Slider_BasicDetectRadius"))

	ui.PatchSliderLoadCallback(combatSection:Slider({
		Name = "Dodge Danger Margin",
		Default = basicOrbitDodge.GetDangerRadius(),
		Minimum = 1,
		Maximum = 15,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			basicOrbitDodge.SetDangerRadius(Value)
		end),
	}, "Slider_BasicDangerMargin"))

	ui.PatchSliderLoadCallback(combatSection:Slider({
		Name = "Panic Radius",
		Default = basicOrbitDodge.GetPanicRadius(),
		Minimum = 3,
		Maximum = 30,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			basicOrbitDodge.SetPanicRadius(Value)
		end),
	}, "Slider_BasicPanicRadius"))

	ui.PatchSliderLoadCallback(combatSection:Slider({
		Name = "Panic Cooldown",
		Default = basicOrbitDodge.GetPanicCooldown(),
		Minimum = 0.05,
		Maximum = 1,
		DisplayMethod = "Round",
		Precision = 2,
		Suffix = "s",
		Callback = autoSave.Wrap(function(Value)
			basicOrbitDodge.SetPanicCooldown(Value)
		end),
	}, "Slider_BasicPanicCooldown"))

	ui.PatchSliderLoadCallback(combatSection:Slider({
		Name = "Dodge Flip Cooldown",
		Default = basicOrbitDodge.GetFlipCooldown(),
		Minimum = 0.05,
		Maximum = 1,
		DisplayMethod = "Round",
		Precision = 2,
		Suffix = "s",
		Callback = autoSave.Wrap(function(Value)
			basicOrbitDodge.SetFlipCooldown(Value)
		end),
	}, "Slider_BasicFlipCooldown"))

	ui.PatchSliderLoadCallback(combatSection:Slider({
		Name = "Dodge Jump Cooldown",
		Default = basicOrbitDodge.GetJumpCooldown(),
		Minimum = 0.1,
		Maximum = 2,
		DisplayMethod = "Round",
		Precision = 2,
		Suffix = "s",
		Callback = autoSave.Wrap(function(Value)
			basicOrbitDodge.SetJumpCooldown(Value)
		end),
	}, "Slider_BasicJumpCooldown"))

	combatSection:Toggle({
		Name = "Death Log",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			deathLog.Toggle(state)
		end),
	}, "Toggle_DeathLog")

	applyFarmModeVisibility()

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

	startSection:Button({
		Name = "Manual Retry",
		Callback = function()
			task.spawn(function()
				autoRetry.RetryNow()
			end)
		end,
	})

	startSection:Toggle({
		Name = "Retry on Time Low",
		Default = autoRetry.GetTimeRetryEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoRetry.SetTimeRetryEnabled(state)
		end),
	}, "Toggle_RetryTimeLow")

	ui.PatchSliderLoadCallback(startSection:Slider({
		Name = "Retry Time Threshold",
		Default = autoRetry.GetTimeRetryThreshold(),
		Minimum = 5,
		Maximum = 120,
		DisplayMethod = "Round",
		Precision = 0,
		Suffix = "s",
		Callback = autoSave.Wrap(function(Value)
			autoRetry.SetTimeRetryThreshold(Value)
		end),
	}, "Slider_RetryTimeThreshold"))
end
