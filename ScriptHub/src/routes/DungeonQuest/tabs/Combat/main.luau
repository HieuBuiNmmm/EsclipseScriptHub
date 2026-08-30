-- Tab Combat (DungeonQuest): Farm, Combat, Auto Start/Retry.

--// Imports
local macLib = require("@packages/Maclib")
local shared = require("@routes/DungeonQuest/core/shared")
local ui = require("@routes/DungeonQuest/core/ui")
local combat = require("@routes/DungeonQuest/core/combat")
local farm = require("@routes/DungeonQuest/core/farm")
local autoStart = require("@routes/DungeonQuest/core/autoStart")
local autoRetry = require("@routes/DungeonQuest/core/autoRetry")
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local notifier = require("@routes/DungeonQuest/core/notifier")
local esp = require("@routes/DungeonQuest/core/esp")
local dodge = require("@routes/DungeonQuest/core/dodge")
local basicOrbitDodge = require("@routes/DungeonQuest/core/basicOrbitDodge")
local deathLog = require("@routes/DungeonQuest/core/deathLog")

return function(window, tab)
	--// Sections
	local farmSection = tab:Section({ Side = "Left" })
	local combatSection = tab:Section({ Side = "Right" })
	local startSection = tab:Section({ Side = "Left" })

	--// Slider dodge (Boss Radius) — khai báo sớm để applyFarmModeVisibility
	--// (định nghĩa ở dưới) capture đúng biến local, không phải global.
	local dodgeRadiusSlider

	--// Helper: Input + Button để thêm skill vào 1 list dodge theo API
	local function makeSkillAdder(section, label, addFn, flagName)
		local inputEl = section:Input({
			Name = label,
			Placeholder = "Ten skill...",
		}, flagName)
		section:Button({
			Name = "  + Add " .. label,
			Callback = function()
				local txt = (inputEl:GetInput() or ""):gsub("^%s+", ""):gsub("%s+$", "")
				if txt ~= "" then
					addFn(txt)
					notifier.Notify("Skill Adder", label .. ": +" .. txt, 2)
				else
					notifier.Notify("Skill Adder", "Nhap ten skill", 2)
				end
			end,
		})
	end

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

	farmSection:Toggle({
		Name = "Auto Retarget",
		Default = shared.GetRetargetEnabled(),
		Callback = autoSave.Wrap(function(state)
			shared.SetRetargetEnabled(state)
		end),
	}, "Toggle_Retarget")

	ui.PatchSliderLoadCallback(farmSection:Slider({
		Name = "Auto Retarget Interval",
		Default = shared.GetRetargetInterval(),
		Minimum = 1,
		Maximum = 30,
		DisplayMethod = "Round",
		Precision = 1,
		Suffix = "s",
		Callback = autoSave.Wrap(function(Value)
			shared.SetRetargetInterval(Value)
		end),
	}, "Slider_RetargetInterval"))

	farmSection:Dropdown({
		Name = "Retarget Method",
		Options = { "Auto", "Tele", "Tween" },
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			if option then shared.SetRetargetMethod(option) end
		end),
	}, "Dropdown_RetargetMethod")

	farmSection:Toggle({
		Name = "Reverse Orbit on Retarget",
		Default = shared.GetOrbitReverseEnabled(),
		Callback = autoSave.Wrap(function(state)
			shared.SetOrbitReverseEnabled(state)
		end),
	}, "Toggle_OrbitReverse")

	applyFarmModeVisibility = function()
		local isOrbit = shared.GetFarmMode() ~= "Hover"
		pcall(function() orbitRadiusSlider:SetVisibility(isOrbit) end)
		pcall(function() orbitSpeedSlider:SetVisibility(isOrbit) end)
		pcall(function() orbitHeightSlider:SetVisibility(isOrbit) end)
		pcall(function() hoverHeightSlider:SetVisibility(not isOrbit) end)
		--// Boss Radius dodge chỉ hiển thị khi Farm Mode = Hover
		pcall(function() dodgeRadiusSlider:SetVisibility(not isOrbit) end)
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

	combatSection:Toggle({
		Name = "Smart Dodge",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			dodge.Toggle(state)
			if state then
				local other = macLib.Options["Toggle_BasicOrbitDodge"]
				if other then other:UpdateState(false) end
			end
		end),
	}, "Toggle_SmartDodge")

	combatSection:Toggle({
		Name = "Basic Orbit Dodge",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			basicOrbitDodge.Toggle(state)
			if state then
				local other = macLib.Options["Toggle_SmartDodge"]
				if other then other:UpdateState(false) end
			end
		end),
	}, "Toggle_BasicOrbitDodge")

	combatSection:Header({ Name = "Dodge Skill Lists" })
	makeSkillAdder(combatSection, "Basic Orbit Skill", function(v) basicOrbitDodge.AddBasicDodgeName(v) end, "Input_AddBasicSkill")
	makeSkillAdder(combatSection, "Kinematic Skill", function(v) dodge.AddColumnName(v) end, "Input_AddKinematicSkill")
	makeSkillAdder(combatSection, "Predictive Skill", function(v) dodge.AddStraightDodgeName(v) end, "Input_AddPredictiveSkill")

	combatSection:Toggle({
		Name = "Dead Zone Visuals",
		Default = dodge.IsDebugVisuals(),
		Callback = autoSave.Wrap(function(state)
			dodge.SetDebugVisuals(state)
		end),
	}, "Toggle_DeadZoneVisuals")

	combatSection:Toggle({
		Name = "Death Log",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			deathLog.Toggle(state)
		end),
	}, "Toggle_DeathLog")

	ui.PatchSliderLoadCallback(combatSection:Slider({
		Name = "Dodge Interval",
		Default = dodge.GetRecalcInterval(),
		Minimum = 0.05,
		Maximum = 0.3,
		DisplayMethod = "Round",
		Precision = 2,
		Suffix = "s",
		Callback = autoSave.Wrap(function(Value)
			dodge.SetRecalcInterval(Value)
		end),
	}, "Slider_DodgeInterval"))

	dodgeRadiusSlider = ui.PatchSliderLoadCallback(combatSection:Slider({
		Name = "Boss Radius",
		Default = dodge.GetBossRadius(),
		Minimum = 5,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			dodge.SetBossRadius(Value)
		end),
	}, "Slider_DodgeBossRadius"))

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
