-- Tab AutoFarm Pathfinder (v2): cơ chế 2 pha.
-- CHASE: pathfinding chạy thẳng tới kẻ địch gần nhất khi ngoài tầm.
-- HOLD: khi trong tầm skill range, giữ khoảng cách bằng orbit tốc độ 0 (đứng yên + quay mặt
-- enemy) và tự spam Q+E. Kèm Visual Debug (ô đỏ điểm đuổi + highlight kẻ gần nhất).

--// Imports
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local autoFarmPathfinder = require("@routes/DungeonQuest/core/autoFarmPathfinder")
local shared = require("@routes/DungeonQuest/core/shared")
local contextual = require("@routes/DungeonQuest/core/contextual")
local shortcuts = require("@routes/DungeonQuest/core/shortcuts")
local ui = require("@routes/DungeonQuest/core/ui")

return function(window, tab)
	local section = tab:Section({ Side = "Left" })
	section:Header({ Name = "Auto Farm" })

	section:Toggle({
		Name = "Enable Pathfinder Farm",
		Default = autoFarmPathfinder.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoFarmPathfinder.Toggle(state)
		end),
	}, "Toggle_PathfinderFarm")

	section:Toggle({
		Name = "Right Click Combo (Q+E)",
		Default = shortcuts.IsMouseComboEnabled(),
		Callback = autoSave.Wrap(function(state)
			shortcuts.SetMouseComboEnabled(state)
		end),
	}, "Toggle_PathfinderMouseCombo")

	section:Header({ Name = "Visual Debug" })

	section:Toggle({
		Name = "Show Debug Overlays",
		Default = autoFarmPathfinder.IsVisualDebugEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoFarmPathfinder.SetVisualDebug(state)
		end),
	}, "Toggle_PathfinderDebug")

	section:Header({ Name = "State Monitor" })

	local stateLabel = section:Label({ Text = "Initializing..." })

	local PHASE_COLORS = {
		CHASE = "0, 255, 255",
		HOLD = "255, 200, 0",
		IDLE = "160, 160, 160",
	}

	local function formatBool(v)
		return v and "<font color='rgb(0,255,0)'>Yes</font>" or "<font color='rgb(255,80,80)'>No</font>"
	end

	local function updateStateLabel()
		local ok, info = pcall(autoFarmPathfinder.GetDebugInfo)
		if not ok or not info then return end
		local phaseColor = PHASE_COLORS[info.phase] or "160, 160, 160"
		local angle = info.holdAngle
		local angleStr = angle and string.format("%.1fdeg", math.deg(angle)) or "-"
		local radiusStr = info.holdRadius and string.format("%.1f", info.holdRadius) or "-"
		local text = table.concat({
			"State: <font color='rgb(" .. phaseColor .. ")'>" .. info.phase .. "</font>\n",
			"Locked: " .. (info.locked and ("<font color='rgb(255,200,0)'>" .. info.lockedName .. "</font>") or "No") .. "\n",
			"Current: " .. info.enemyName .. "\n",
			"Dist 3D: " .. string.format("%.1f", info.enemyDist) .. "\n",
			"Dist XZ: " .. string.format("%.1f", info.enemyFlat) .. " / SkillRange " .. info.skillRange .. "\n",
			"Orbit: angle " .. angleStr .. " / radius " .. radiusStr .. "\n",
			"Path: " .. (info.pathComputed and "active" or "none") .. "\n",
			"Path Banned: " .. (info.pathBanned or 0) .. " / Fallback " .. (info.noPathSince and "on" or "off") .. "\n",
			"Tracking: " .. formatBool(info.dunReady) .. " / Enabled " .. formatBool(info.enabled),
		})
		pcall(function()
			stateLabel:UpdateName(text)
		end)
	end

	updateStateLabel()

	task.spawn(function()
		while task.wait(0.25) do
			updateStateLabel()
		end
	end)

	--// AutoFarm Pathfinder Context (per dungeon x per target).
	--
	--// Cấu hình riêng Move Speed / Retarget Interval / Skill Range / Skill Interval /
	--// Skill Enabled / Skill Mode theo DUNGEON x LOẠI MỤC TIÊU (Normal / Boss 1/2/3),
	--// y như Auto Farm Context. Lưu chung blob contextData qua core/contextual.
	--// Fallback về global (autoFarmPathfinder) khi context chưa có override.
	local ctxSection = tab:Section({ Side = "Right" })
	ctxSection:Header({ Name = "AutoFarm Pathfinder Context" })

	local activeCtxLabel = ctxSection:Label({ Text = "" })
	local function updateActiveCtxLabel()
		local dungeon = shared.GetCurrentDungeonName()
		local targetKey = shared.GetCombatTargetKey()
		activeCtxLabel:UpdateName("Active: <font color='rgb(120,200,255)'>" .. (dungeon or "Not in dungeon") .. "</font> / " .. contextual.GetDisplayForTarget(targetKey))
	end

	local editDungeon = shared.GetCurrentDungeonName()
	local editTarget = "Mob"

	local isSyncing = false
	local refreshContextControls
	local setEditControlsVisible
	local editCtxLabel
	local editTargetDropdown
	local moveSpeedSlider
	local retargetIntervalSlider
	local skillRangeSlider
	local skillIntervalSlider
	local skillEnabledToggle
	local skillModeDropdown
	local resetCtxButton

	local function isActiveContext()
		return editDungeon == shared.GetCurrentDungeonName() and editTarget == shared.GetCombatTargetKey()
	end

	editTargetDropdown = ctxSection:Dropdown({
		Name = "Edit Target",
		Options = { "Normal", "Boss 1", "Boss 2", "Boss 3" },
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			local map = { ["Normal"] = "Mob", ["Boss 1"] = "Boss1", ["Boss 2"] = "Boss2", ["Boss 3"] = "Boss3" }
			editTarget = map[option] or "Mob"
			refreshContextControls()
		end),
	}, "Dropdown_PathfinderTarget")

	--// Nút Reset dễ ấn nhầm -> cơ chế 2 bước (arm Confirm -> click lần 2 trong hạn).
	local resetArmed = false
	local resetDisarmTimer = nil
	local RESET_NAME = "Reset Context to Global"
	local RESET_CONFIRM_NAME = "<font color='rgb(255,80,80)'>Confirm Reset?</font>"
	local RESET_TIMEOUT = 3
	local function disarmReset()
		if not resetArmed then return end
		resetArmed = false
		if resetDisarmTimer then task.cancel(resetDisarmTimer); resetDisarmTimer = nil end
		pcall(function() resetCtxButton:UpdateName(RESET_NAME) end)
	end

	resetCtxButton = ctxSection:Button({
		Name = RESET_NAME,
		Callback = autoSave.Wrap(function()
			if not resetArmed then
				resetArmed = true
				if resetDisarmTimer then task.cancel(resetDisarmTimer) end
				resetDisarmTimer = task.delay(RESET_TIMEOUT, disarmReset)
				pcall(function() resetCtxButton:UpdateName(RESET_CONFIRM_NAME) end)
				return
			end
			disarmReset()
			contextual.ClearContext(editDungeon, editTarget)
			refreshContextControls()
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	})

	editCtxLabel = ctxSection:Label({ Text = "" })

	moveSpeedSlider = ui.PatchSliderLoadCallback(ctxSection:Slider({
		Name = "Move Speed",
		Default = contextual.GetField(editDungeon, editTarget, "PathfinderMoveSpeed"),
		Minimum = 10,
		Maximum = 200,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "PathfinderMoveSpeed", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_PathfinderCtxMoveSpeed"))

	retargetIntervalSlider = ui.PatchSliderLoadCallback(ctxSection:Slider({
		Name = "Retarget Interval",
		Default = contextual.GetField(editDungeon, editTarget, "PathfinderRetargetInterval"),
		Minimum = 0.2,
		Maximum = 5,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "PathfinderRetargetInterval", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_PathfinderCtxRetarget"))

	skillRangeSlider = ui.PatchSliderLoadCallback(ctxSection:Slider({
		Name = "Skill Range",
		Default = contextual.GetField(editDungeon, editTarget, "PathfinderSkillRange"),
		Minimum = 1,
		Maximum = 200,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "PathfinderSkillRange", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_PathfinderCtxSkillRange"))

	skillIntervalSlider = ui.PatchSliderLoadCallback(ctxSection:Slider({
		Name = "Skill Interval",
		Default = contextual.GetField(editDungeon, editTarget, "PathfinderSkillInterval"),
		Minimum = 0.2,
		Maximum = 10,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "PathfinderSkillInterval", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_PathfinderCtxSkillInterval"))

	skillEnabledToggle = ctxSection:Toggle({
		Name = "Skill Enabled",
		Default = contextual.GetField(editDungeon, editTarget, "PathfinderSkillEnabled"),
		Callback = autoSave.Wrap(function(state)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "PathfinderSkillEnabled", state)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Toggle_PathfinderCtxSkillEnabled")

	local SKILL_MODE_OPTIONS = { "Both (Q+E cùng lúc)", "Alternate (Q -> E -> Q -> E)" }
	local function skillModeToOption(mode)
		if mode == "Alternate" then return SKILL_MODE_OPTIONS[2] end
		return SKILL_MODE_OPTIONS[1]
	end

	skillModeDropdown = ctxSection:Dropdown({
		Name = "Skill Mode",
		Options = SKILL_MODE_OPTIONS,
		Default = skillModeToOption(contextual.GetField(editDungeon, editTarget, "PathfinderSkillMode")) == SKILL_MODE_OPTIONS[2] and 2 or 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			if not option or isSyncing then return end
			local mode = option:find("Alternate") and "Alternate" or "Both"
			contextual.SetField(editDungeon, editTarget, "PathfinderSkillMode", mode)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Dropdown_PathfinderCtxSkillMode")

	refreshContextControls = function()
		isSyncing = true
		disarmReset()
		pcall(function() moveSpeedSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "PathfinderMoveSpeed")) end)
		pcall(function() retargetIntervalSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "PathfinderRetargetInterval")) end)
		pcall(function() skillRangeSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "PathfinderSkillRange")) end)
		pcall(function() skillIntervalSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "PathfinderSkillInterval")) end)
		pcall(function() skillEnabledToggle:UpdateState(contextual.GetField(editDungeon, editTarget, "PathfinderSkillEnabled")) end)
		pcall(function() skillModeDropdown:UpdateSelection(skillModeToOption(contextual.GetField(editDungeon, editTarget, "PathfinderSkillMode"))) end)
		isSyncing = false
		pcall(function() editCtxLabel:UpdateName("Editing: <font color='rgb(150,255,150)'>" .. (editDungeon or "Not in dungeon") .. "</font> / " .. contextual.GetDisplayForTarget(editTarget)) end)
	end

	setEditControlsVisible = function(visible)
		pcall(function() moveSpeedSlider:SetVisibility(visible) end)
		pcall(function() retargetIntervalSlider:SetVisibility(visible) end)
		pcall(function() skillRangeSlider:SetVisibility(visible) end)
		pcall(function() skillIntervalSlider:SetVisibility(visible) end)
		pcall(function() skillEnabledToggle:SetVisibility(visible) end)
		pcall(function() skillModeDropdown:SetVisibility(visible) end)
		pcall(function() resetCtxButton:SetVisibility(visible) end)
	end

	local function resetToMob()
		editTarget = "Mob"
		pcall(function() editTargetDropdown:UpdateSelection("Normal") end)
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
end