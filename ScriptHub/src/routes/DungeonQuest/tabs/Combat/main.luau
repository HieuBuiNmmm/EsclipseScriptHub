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
local contextual = require("@routes/DungeonQuest/core/contextual")

return function(window, tab)
	--// Sections
	local farmSection = tab:Section({ Side = "Left" })
	local combatSection = tab:Section({ Side = "Right" })
	local startSection = tab:Section({ Side = "Left" })

	farmSection:Header({ Name = "Auto Farm" })
	combatSection:Header({ Name = "Combat" })
	startSection:Header({ Name = "Auto Start Game" })

	--// Farm (nhóm Auto Farm: per-context theo dungeon x target)
	local autoFarmToggle = farmSection:Toggle({
		Name = "Auto Farm",
		Default = shared.IsFarmEnabled(),
		Callback = autoSave.Wrap(function(state)
			farm.Toggle(state)
		end),
	}, "Toggle_AutoFarm")

	--// Auto Farm Context (per dungeon x per mob/boss)
	farmSection:Header({ Name = "Auto Farm Context" })

	local activeCtxLabel = farmSection:Label({ Text = "" })
	local function updateActiveCtxLabel()
		local dungeon = shared.GetCurrentDungeonName()
		local targetKey = shared.GetCombatTargetKey()
		activeCtxLabel:UpdateName("Active: <font color='rgb(120,200,255)'>" .. (dungeon or "Not in dungeon") .. "</font> / " .. contextual.GetDisplayForTarget(targetKey))
	end

	local editDungeon = shared.GetCurrentDungeonName()
	local editTarget = "Mob"

	local isSyncing = false
	local applyFarmModeVisibility
	local refreshContextControls
	local setEditControlsVisible
	local editCtxLabel
	local farmModeDropdown
	local orbitRadiusSlider
	local orbitSpeedSlider
	local orbitTeleStepSlider
	local orbitHeightSlider
	local maintainBossHeightToggle
	local hoverHeightSlider
	local teleportDistanceSlider
	local autoRetargetToggle
	local retargetMethodDropdown
	local retargetModeDropdown
	local reverseOrbitToggle
	local resetCtxButton

	local function isActiveContext()
		return editDungeon == shared.GetCurrentDungeonName() and editTarget == shared.GetCombatTargetKey()
	end

	local editTargetDropdown = farmSection:Dropdown({
		Name = "Edit Target",
		Options = { "Normal", "Boss 1", "Boss 2", "Boss 3" },
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			local map = { ["Normal"] = "Mob", ["Boss 1"] = "Boss1", ["Boss 2"] = "Boss2", ["Boss 3"] = "Boss3" }
			editTarget = map[option] or "Mob"
			refreshContextControls()
		end),
	}, "Dropdown_FarmTarget")

	resetCtxButton = farmSection:Button({
		Name = "Reset Context to Global",
		Callback = autoSave.Wrap(function()
			contextual.ClearContext(editDungeon, editTarget)
			refreshContextControls()
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	})

	editCtxLabel = farmSection:Label({ Text = "" })

	farmModeDropdown = farmSection:Dropdown({
		Name = "Farm Mode",
		Options = { "Orbit", "Orbit Tele", "Hover" },
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			if not option or isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "FarmMode", option)
			applyFarmModeVisibility()
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Dropdown_FarmMode")

	orbitRadiusSlider = farmSection:Slider({
		Name = "Orbit Radius",
		Default = contextual.GetField(editDungeon, editTarget, "OrbitRadius"),
		Minimum = 5,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "OrbitRadius", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_OrbitRadius")

	orbitSpeedSlider = farmSection:Slider({
		Name = "Orbit Speed",
		Default = contextual.GetField(editDungeon, editTarget, "OrbitSpeed"),
		Minimum = 24,
		Maximum = 96,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "OrbitSpeed", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_OrbitSpeed")

	orbitTeleStepSlider = farmSection:Slider({
		Name = "Orbit Tele Step",
		Default = contextual.GetField(editDungeon, editTarget, "OrbitTeleStep"),
		Minimum = 5,
		Maximum = 90,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "OrbitTeleStep", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_OrbitTeleStep")

	orbitHeightSlider = farmSection:Slider({
		Name = "Orbit Height",
		Default = contextual.GetField(editDungeon, editTarget, "OrbitHeight"),
		Minimum = 0,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "OrbitHeight", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_OrbitHeight")

	maintainBossHeightToggle = farmSection:Toggle({
		Name = "Maintain Orbit Height on Boss",
		Default = contextual.GetField(editDungeon, editTarget, "MaintainBossHeight"),
		Callback = autoSave.Wrap(function(state)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "MaintainBossHeight", state)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Toggle_MaintainBossHeight")

	hoverHeightSlider = farmSection:Slider({
		Name = "Hover Height",
		Default = contextual.GetField(editDungeon, editTarget, "HoverHeight"),
		Minimum = 0,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "HoverHeight", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_HoverHeight")

	teleportDistanceSlider = farmSection:Slider({
		Name = "Teleport Distance",
		Default = contextual.GetField(editDungeon, editTarget, "TeleportDistance"),
		Minimum = 5,
		Maximum = 300,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "TeleportDistance", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_TeleportDistance")

	autoRetargetToggle = farmSection:Toggle({
		Name = "Auto Retarget",
		Default = contextual.GetField(editDungeon, editTarget, "AutoRetarget"),
		Callback = autoSave.Wrap(function(state)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "AutoRetarget", state)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Toggle_Retarget")

	retargetMethodDropdown = farmSection:Dropdown({
		Name = "Retarget Method",
		Options = { "Auto", "Tele", "Tween" },
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			if not option or isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "RetargetMethod", option)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Dropdown_RetargetMethod")

	retargetModeDropdown = farmSection:Dropdown({
		Name = "Retarget Mode",
		Options = { "Nearest", "Farthest" },
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			if not option or isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "RetargetMode", option)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Dropdown_RetargetMode")

	reverseOrbitToggle = farmSection:Toggle({
		Name = "Reverse Orbit on Retarget",
		Default = contextual.GetField(editDungeon, editTarget, "ReverseOrbitOnRetarget"),
		Callback = autoSave.Wrap(function(state)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "ReverseOrbitOnRetarget", state)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Toggle_OrbitReverse")

	applyFarmModeVisibility = function()
		local mode = contextual.GetField(editDungeon, editTarget, "FarmMode")
		local isOrbit = mode == "Orbit"
		local isOrbitTele = mode == "Orbit Tele"
		local isOrbitLike = isOrbit or isOrbitTele
		pcall(function() orbitRadiusSlider:SetVisibility(isOrbitLike) end)
		pcall(function() orbitSpeedSlider:SetVisibility(isOrbit) end)
		pcall(function() orbitTeleStepSlider:SetVisibility(isOrbitTele) end)
		pcall(function() orbitHeightSlider:SetVisibility(isOrbitLike) end)
		pcall(function() hoverHeightSlider:SetVisibility(not isOrbitLike) end)
	end

	refreshContextControls = function()
		isSyncing = true
		pcall(function() farmModeDropdown:UpdateSelection(contextual.GetField(editDungeon, editTarget, "FarmMode")) end)
		pcall(function() orbitRadiusSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "OrbitRadius")) end)
		pcall(function() orbitSpeedSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "OrbitSpeed")) end)
		pcall(function() orbitTeleStepSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "OrbitTeleStep")) end)
		pcall(function() orbitHeightSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "OrbitHeight")) end)
		pcall(function() maintainBossHeightToggle:UpdateState(contextual.GetField(editDungeon, editTarget, "MaintainBossHeight")) end)
		pcall(function() hoverHeightSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "HoverHeight")) end)
		pcall(function() teleportDistanceSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "TeleportDistance")) end)
		pcall(function() autoRetargetToggle:UpdateState(contextual.GetField(editDungeon, editTarget, "AutoRetarget")) end)
		pcall(function() retargetMethodDropdown:UpdateSelection(contextual.GetField(editDungeon, editTarget, "RetargetMethod")) end)
		pcall(function() retargetModeDropdown:UpdateSelection(contextual.GetField(editDungeon, editTarget, "RetargetMode")) end)
		pcall(function() reverseOrbitToggle:UpdateState(contextual.GetField(editDungeon, editTarget, "ReverseOrbitOnRetarget")) end)
		isSyncing = false
		pcall(function() editCtxLabel:UpdateName("Editing: <font color='rgb(150,255,150)'>" .. (editDungeon or "Not in dungeon") .. "</font> / " .. contextual.GetDisplayForTarget(editTarget)) end)
		applyFarmModeVisibility()
	end

	setEditControlsVisible = function(visible)
		pcall(function() farmModeDropdown:SetVisibility(visible) end)
		pcall(function() orbitRadiusSlider:SetVisibility(visible) end)
		pcall(function() orbitSpeedSlider:SetVisibility(visible) end)
		pcall(function() orbitTeleStepSlider:SetVisibility(visible) end)
		pcall(function() orbitHeightSlider:SetVisibility(visible) end)
		pcall(function() maintainBossHeightToggle:SetVisibility(visible) end)
		pcall(function() hoverHeightSlider:SetVisibility(visible) end)
		pcall(function() teleportDistanceSlider:SetVisibility(visible) end)
		pcall(function() autoRetargetToggle:SetVisibility(visible) end)
		pcall(function() retargetMethodDropdown:SetVisibility(visible) end)
		pcall(function() retargetModeDropdown:SetVisibility(visible) end)
		pcall(function() reverseOrbitToggle:SetVisibility(visible) end)
		pcall(function() resetCtxButton:SetVisibility(visible) end)
		if visible then applyFarmModeVisibility() end
	end

	--// Mỗi lần load vào màn chơi (dungeon mới): Edit Target về "Normal" + re-sync Auto Farm
	local function resetToMob()
		editTarget = "Mob"
		pcall(function() editTargetDropdown:UpdateSelection("Normal") end)
		pcall(function() autoFarmToggle:UpdateState(shared.IsFarmEnabled()) end)
		refreshContextControls()
	end

	local prevDungeonInGame = editDungeon ~= nil
	local function onDungeonChanged()
		local newName = shared.GetCurrentDungeonName()
		local nowInGame = newName ~= nil
		editDungeon = newName
		if nowInGame and not prevDungeonInGame then
			resetToMob()
		end
		prevDungeonInGame = nowInGame
		updateActiveCtxLabel()
		refreshContextControls()
		setEditControlsVisible(nowInGame)
	end
	shared.OnDungeonNameChanged(onDungeonChanged)
	shared.OnBossIndexChanged(updateActiveCtxLabel)
	shared.OnBossActiveChanged(updateActiveCtxLabel)
	contextual.OnConfigChanged(function()
		editDungeon = shared.GetCurrentDungeonName()
		updateActiveCtxLabel()
		refreshContextControls()
		setEditControlsVisible(editDungeon ~= nil)
	end)

	updateActiveCtxLabel()
	refreshContextControls()
	setEditControlsVisible(editDungeon ~= nil)

	--// Combat
	combatSection:Header({ Name = "Skill" })

	local applySkillModeVisibility
	combatSection:Toggle({
		Name = "Auto Skill (Q + E)",
		Default = shared.IsAutoSkillEnabled(),
		Callback = autoSave.Wrap(function(state)
			combat.ToggleAutoSkill(state)
		end),
	}, "Toggle_AutoSkill")

	combatSection:Dropdown({
		Name = "Auto Skill Mode",
		Options = { "Spam", "Target Only" },
		Default = (shared.GetAutoSkillMode() == "Target Only" and 2) or 1,
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

	local dodgeModeDropdown = combatSection:Dropdown({
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

	local detectRadiusSlider = ui.PatchSliderLoadCallback(combatSection:Slider({
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

	local dangerMarginSlider = ui.PatchSliderLoadCallback(combatSection:Slider({
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

	local panicRadiusSlider = ui.PatchSliderLoadCallback(combatSection:Slider({
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

	local panicCooldownSlider = ui.PatchSliderLoadCallback(combatSection:Slider({
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

	local flipCooldownSlider = ui.PatchSliderLoadCallback(combatSection:Slider({
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

	local jumpCooldownSlider = ui.PatchSliderLoadCallback(combatSection:Slider({
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

	combatSection:Dropdown({
		Name = "Dodge Preset",
		Options = basicOrbitDodge.GetPresetNames(),
		Default = (function()
			local names = basicOrbitDodge.GetPresetNames()
			local cur = basicOrbitDodge.GetPreset()
			for i, n in ipairs(names) do
				if n == cur then return i end
			end
			return 1
		end)(),
		Required = true,
		Callback = autoSave.Wrap(function(option)
			basicOrbitDodge.ApplyPreset(option)
			pcall(function() dodgeModeDropdown:UpdateSelection(basicOrbitDodge.GetMode() == "Boss" and "Boss Only" or "All") end)
			pcall(function() detectRadiusSlider:UpdateValue(basicOrbitDodge.GetDetectRadius()) end)
			pcall(function() dangerMarginSlider:UpdateValue(basicOrbitDodge.GetDangerRadius()) end)
			pcall(function() panicRadiusSlider:UpdateValue(basicOrbitDodge.GetPanicRadius()) end)
			pcall(function() panicCooldownSlider:UpdateValue(basicOrbitDodge.GetPanicCooldown()) end)
			pcall(function() flipCooldownSlider:UpdateValue(basicOrbitDodge.GetFlipCooldown()) end)
			pcall(function() jumpCooldownSlider:UpdateValue(basicOrbitDodge.GetJumpCooldown()) end)
		end),
	}, "Dropdown_DodgePreset")

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
