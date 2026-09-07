-- Module Auto Farm trong tab Combat (DungeonQuest)
-- Tích hợp Auto Farm AI (Scanner, Validator, Selector, Tracker, Movement Controller, Blocker Checker)
-- và Auto Farm Context (Target Reach Distance theo từng Dungeon x Target).

--// Imports
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local autoFarm = require("@routes/DungeonQuest/core/autoFarm")
local contextual = require("@routes/DungeonQuest/core/contextual")
local shared = require("@routes/DungeonQuest/core/shared")
local services = require("@routes/DungeonQuest/core/services")
local ui = require("@routes/DungeonQuest/core/ui")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local RunService = services.RunService

return function(window, tab)
	--// ============================================================
	--// LEFT COLUMN: Auto Farm Controls & Visual Debug
	--// ============================================================
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Auto Farm" })

	leftSection:Toggle({
		Name = "Enable Auto Farm",
		Default = autoFarm.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoFarm.Toggle(state)
		end),
	}, "Toggle_AutoFarm")

	leftSection:Slider({
		Name = "Rescan Interval (seconds)",
		Default = autoFarm.GetScanInterval(),
		Minimum = 0.5,
		Maximum = 5.0,
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetScanInterval(val)
		end),
	}, "Slider_AF_ScanInterval")

	leftSection:Slider({
		Name = "Target Reach Distance (studs)",
		Default = autoFarm.GetReachDistance(),
		Minimum = 2,
		Maximum = 200,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetReachDistance(val)
		end),
	}, "Slider_AF_ReachDistance")

	leftSection:Slider({
		Name = "Repath Distance Threshold (studs)",
		Default = autoFarm.GetRepathDistance(),
		Minimum = 2,
		Maximum = 20,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetRepathDistance(val)
		end),
	}, "Slider_AF_RepathDistance")

	leftSection:Header({ Name = "Visual Debug" })

	leftSection:Toggle({
		Name = "Show Blocker Ray (Red/Green)",
		Default = autoFarm.IsBlockerRayVisualEnabled(),
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetBlockerRayVisual(val)
		end),
	}, "Toggle_AF_BlockerRay")

	leftSection:Toggle({
		Name = "Show Planned Path (Green)",
		Default = autoFarm.IsPlannedPathVisualEnabled(),
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetPlannedPathVisual(val)
		end),
	}, "Toggle_AF_PlannedPath")

	leftSection:Toggle({
		Name = "Show Actual Destination (Cyan)",
		Default = autoFarm.IsActualPathVisualEnabled(),
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetActualPathVisual(val)
		end),
	}, "Toggle_AF_ActualPath")

	leftSection:Toggle({
		Name = "Show Target Indicator (Red/Glow)",
		Default = autoFarm.IsTargetVisualEnabled(),
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetTargetVisual(val)
		end),
	}, "Toggle_AF_TargetVisual")

	--// ============================================================
	--// RIGHT COLUMN TOP: Auto Farm Monitor
	--// ============================================================
	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Auto Farm Monitor" })

	local stateLabel = rightSection:Label({ Text = "State: <font color='rgb(160,160,160)'>NO_TARGET</font>" })
	local targetLabel = rightSection:Label({ Text = "Target: <font color='rgb(160,160,160)'>None</font>" })
	local distanceLabel = rightSection:Label({ Text = "Distance: <font color='rgb(160,160,160)'>-</font>" })
	local velocityLabel = rightSection:Label({ Text = "Velocity: <font color='rgb(160,160,160)'>0.0 studs/s</font>" })
	local blockerLabel = rightSection:Label({ Text = "Blocker Detection: <font color='rgb(160,160,160)'>-</font>" })
	local modeLabel = rightSection:Label({ Text = "Destination Mode: <font color='rgb(160,160,160)'>None</font>" })
	local waypointsLabel = rightSection:Label({ Text = "Path Nodes: <font color='rgb(160,160,160)'>0</font>" })

	local monitorConnection = nil

	local function updateMonitor()
		local info = autoFarm.GetDebugInfo()
		local stateColor = "160,160,160"

		if info.state == "CHASE" then
			stateColor = "0,255,120"
		elseif info.state == "HOLD" then
			stateColor = "255,200,0"
		elseif info.state == "BLOCKED" then
			stateColor = "255,60,60"
		elseif info.state == "REPATHING" or info.state == "ACQUIRING_TARGET" or info.state == "TRACKING_TARGET" then
			stateColor = "0,200,255"
		end

		pcall(function()
			stateLabel:UpdateName(("State: <font color='rgb(%s)'>%s</font>"):format(stateColor, info.state))
		end)

		pcall(function()
			if info.hasTarget then
				targetLabel:UpdateName(("Target: <font color='rgb(255,220,120)'>%s</font>"):format(info.enemyName))
				distanceLabel:UpdateName(("Distance: <font color='rgb(0,255,255)'>%.1f studs (flat %.1f)</font>"):format(info.enemyDist, info.enemyFlat))
			else
				targetLabel:UpdateName("Target: <font color='rgb(160,160,160)'>None</font>")
				distanceLabel:UpdateName("Distance: <font color='rgb(160,160,160)'>-</font>")
			end
		end)

		pcall(function()
			local vel = info.velocity or 0
			local velColor = vel >= 12.0 and "0,255,120" or (vel >= 10.0 and "255,200,0" or "255,80,80")
			velocityLabel:UpdateName(("Velocity: <font color='rgb(%s)'>%.1f studs/s</font>"):format(velColor, vel))
		end)



		pcall(function()
			if info.hasTarget and info.blocker then
				if info.blocker.directBlocked then
					blockerLabel:UpdateName(("Blocker: <font color='rgb(255,60,60)'>BLOCKED by '%s' (%.1fm)</font>"):format(
						info.blocker.blockerName, info.blocker.blockerDist
					))
				else
					blockerLabel:UpdateName("Blocker: <font color='rgb(0,255,120)'>CLEAR (Direct Line to Target)</font>")
				end
			else
				blockerLabel:UpdateName("Blocker: <font color='rgb(160,160,160)'>None</font>")
			end
		end)

		pcall(function()
			local modeText = info.destMode
			if info.nodeIndex then
				modeText = ("%s (Node #%d)"):format(info.destMode, info.nodeIndex)
			end
			local modeColor = info.destMode == "Direct" and "0,255,255" or (info.destMode == "Waypoint" and "255,200,0" or (info.destMode == "Hold" and "255,200,0" or "255,80,80"))
			modeLabel:UpdateName(("Destination Mode: <font color='rgb(%s)'>%s</font>"):format(modeColor, modeText))
		end)

		pcall(function()
			waypointsLabel:UpdateName(("Path Nodes: <font color='rgb(160,255,160)'>%d waypoints</font>"):format(info.waypointCount))
		end)
	end

	local lastUiUpdate = 0
	monitorConnection = RunService.Heartbeat:Connect(function()
		local now = os.clock()
		if now - lastUiUpdate >= 0.25 then
			lastUiUpdate = now
			updateMonitor()
		end
	end)

	lifecycle.Register(function()
		if monitorConnection then
			monitorConnection:Disconnect()
			monitorConnection = nil
		end
	end)

	--// ============================================================
	--// RIGHT COLUMN BOTTOM: Auto Farm Context
	--// ============================================================
	local ctxSection = tab:Section({ Side = "Right" })
	ctxSection:Header({ Name = "Auto Farm Context" })

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
	local reachDistanceSlider
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
	}, "Dropdown_AutoFarmTarget")

	--// Nút Reset 2 bước (arm Confirm -> click lần 2 trong hạn)
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

	reachDistanceSlider = ui.PatchSliderLoadCallback(ctxSection:Slider({
		Name = "Target Reach Distance",
		Default = contextual.GetField(editDungeon, editTarget, "TargetReachDistance"),
		Minimum = 2,
		Maximum = 200,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "TargetReachDistance", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_AF_CtxReachDistance"))

	refreshContextControls = function()
		isSyncing = true
		disarmReset()
		pcall(function() reachDistanceSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "TargetReachDistance")) end)
		isSyncing = false
		pcall(function() editCtxLabel:UpdateName("Editing: <font color='rgb(150,255,150)'>" .. (editDungeon or "Not in dungeon") .. "</font> / " .. contextual.GetDisplayForTarget(editTarget)) end)
	end

	setEditControlsVisible = function(visible)
		pcall(function() reachDistanceSlider:SetVisibility(visible) end)
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
