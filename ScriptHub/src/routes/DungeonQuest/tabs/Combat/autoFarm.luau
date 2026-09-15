-- Module Auto Farm trong tab Combat (DungeonQuest)
-- Tích hợp Auto Farm AI (Scanner, Validator, Selector, Tracker, Movement Controller, Blocker Checker)
-- và Contextual Combat Distance (tùy chỉnh Min/Max Combat Distance theo từng Dungeon x Loại Mục Tiêu).

--// Imports
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local autoFarm = require("@routes/DungeonQuest/core/autoFarm")
local contextual = require("@routes/DungeonQuest/core/contextual")
local dungeonCatalog = require("@routes/DungeonQuest/core/dungeonCatalog")
local shared = require("@routes/DungeonQuest/core/shared")
local services = require("@routes/DungeonQuest/core/services")
local ui = require("@routes/DungeonQuest/core/ui")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local RunService = services.RunService

return function(window, tab)
	--// ============================================================
	--// LEFT COLUMN: Auto Farm Controls, Smart Skills & Visual Debug
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
		Name = "Rescan Interval (s)",
		Default = autoFarm.GetScanInterval(),
		Minimum = 0.5,
		Maximum = 5.0,
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetScanInterval(val)
		end),
	}, "Slider_AF_ScanInterval")

	leftSection:Toggle({
		Name = "Auto Face Target (Look At Enemy)",
		Default = autoFarm.IsAutoFaceTargetEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoFarm.SetAutoFaceTarget(state)
		end),
	}, "Toggle_AF_AutoFaceTarget")

	leftSection:Slider({
		Name = "Repath Distance (studs)",
		Default = autoFarm.GetRepathDistance(),
		Minimum = 2,
		Maximum = 20,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetRepathDistance(val)
		end),
	}, "Slider_AF_RepathDistance")

	leftSection:Toggle({
		Name = "Auto Jump When Stuck (Low Velocity)",
		Default = autoFarm.IsAutoJumpOnStuckEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoFarm.SetAutoJumpOnStuck(state)
		end),
	}, "Toggle_AF_AutoJumpOnStuck")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Stuck Velocity Threshold (studs/s)",
		Default = autoFarm.GetStuckVelocityThreshold(),
		Minimum = 2,
		Maximum = 20,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetStuckVelocityThreshold(val)
		end),
	}, "Slider_AF_StuckVelocity"))

	leftSection:Header({ Name = "Auto Skill (Smart Buff & Damage)" })

	leftSection:Toggle({
		Name = "Enable Auto Skill (Smart Q + E)",
		Default = autoFarm.IsAutoSkillEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoFarm.SetAutoSkillEnabled(state)
		end),
	}, "Toggle_AF_AutoSkill")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Skill E Cast Range (studs)",
		Default = autoFarm.GetSkillERange(),
		Minimum = 5,
		Maximum = 150,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetSkillERange(val)
		end),
	}, "Slider_AF_SkillERange"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Skill Spam Interval (s)",
		Default = autoFarm.GetSkillSpamInterval(),
		Minimum = 0.05,
		Maximum = 1.0,
		DisplayMethod = "Value",
		Precision = 2,
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetSkillSpamInterval(val)
		end),
	}, "Slider_AF_SkillSpamInterval"))

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

	leftSection:Toggle({
		Name = "Show Combat Range Circles (Min/Max)",
		Default = autoFarm.IsCombatRangeVisualEnabled(),
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetCombatRangeVisual(val)
		end),
	}, "Toggle_AF_CombatRangeVisual")

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
	--// RIGHT COLUMN BOTTOM: Contextual Combat Distance
	--// ============================================================
	local ctxSection = tab:Section({ Side = "Right" })
	ctxSection:Header({ Name = "Contextual Combat Distance" })

	local activeStatusLabel = ctxSection:Label({ Text = "Active: -" })

	local dungeonList = dungeonCatalog.GetDungeons()
	local selectedDungeon = shared.GetCurrentDungeonName() or dungeonList[1] or "Desert Temple"
	local selectedTargetKey = "Mob"

	local isSyncingUI = false
	local minSlider = nil
	local maxSlider = nil
	local editInfoLabel = nil

	local function updateActiveStatus()
		local curDungeon = shared.GetCurrentDungeonName()
		local curTargetKey = shared.GetCombatTargetKey()
		local curMin, curMax = contextual.GetCombatDistances(curDungeon, curTargetKey)
		local dText = curDungeon and ("<font color='rgb(0,255,255)'>" .. curDungeon .. "</font>") or "<font color='rgb(160,160,160)'>Lobby</font>"
		local tText = "<font color='rgb(255,200,0)'>" .. contextual.GetTargetDisplay(curTargetKey) .. "</font>"
		local rText = ("<font color='rgb(120,255,120)'>%.0f - %.0f studs</font>"):format(curMin, curMax)

		pcall(function()
			activeStatusLabel:UpdateName(("Active: %s | Target: %s (%s)"):format(dText, tText, rText))
		end)
	end

	local function refreshEditorValues()
		isSyncingUI = true
		local curMin, curMax = contextual.GetCombatDistances(selectedDungeon, selectedTargetKey)
		if minSlider then
			pcall(function() minSlider:UpdateValue(curMin) end)
		end
		if maxSlider then
			pcall(function() maxSlider:UpdateValue(curMax) end)
		end
		if editInfoLabel then
			pcall(function()
				editInfoLabel:UpdateName(("Editing: <font color='rgb(0,255,255)'>%s</font> / <font color='rgb(255,200,0)'>%s</font>"):format(
					selectedDungeon, contextual.GetTargetDisplay(selectedTargetKey)
				))
			end)
		end
		isSyncingUI = false
		updateActiveStatus()
	end

	local dungeonDropdown = ctxSection:Dropdown({
		Name = "Select Dungeon",
		Options = dungeonList,
		Default = selectedDungeon,
		Required = true,
		Callback = function(dName)
			if type(dName) == "string" and #dName > 0 then
				selectedDungeon = dName
				refreshEditorValues()
			end
		end,
	})

	local targetDropdown = ctxSection:Dropdown({
		Name = "Select Target",
		Options = contextual.GetTargetOptions(),
		Default = "Normal",
		Required = true,
		Callback = function(tName)
			selectedTargetKey = contextual.GetTargetKey(tName)
			refreshEditorValues()
		end,
	})

	editInfoLabel = ctxSection:Label({ Text = "" })

	local initMin, initMax = contextual.GetCombatDistances(selectedDungeon, selectedTargetKey)

	minSlider = ctxSection:Slider({
		Name = "Min Combat Distance (studs)",
		Default = initMin,
		Minimum = 2,
		Maximum = 150,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = function(val)
			if isSyncingUI then return end
			contextual.SetMinCombatDistance(selectedDungeon, selectedTargetKey, val)
			updateActiveStatus()
		end,
	})

	maxSlider = ctxSection:Slider({
		Name = "Max Combat Distance (studs)",
		Default = initMax,
		Minimum = 5,
		Maximum = 200,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = function(val)
			if isSyncingUI then return end
			contextual.SetMaxCombatDistance(selectedDungeon, selectedTargetKey, val)
			updateActiveStatus()
		end,
	})

	ctxSection:Button({
		Name = "Reset Target to Default",
		Callback = function()
			contextual.ResetTarget(selectedDungeon, selectedTargetKey)
			refreshEditorValues()
		end,
	})

	ctxSection:Button({
		Name = "Reset Dungeon to Default",
		Callback = function()
			contextual.ResetDungeon(selectedDungeon)
			refreshEditorValues()
		end,
	})

	--// Event Listeners for Dynamic Updates
	local unhookDungeon = shared.OnDungeonNameChanged(function(newDungeon)
		if newDungeon and type(newDungeon) == "string" and #newDungeon > 0 then
			selectedDungeon = newDungeon
			pcall(function() dungeonDropdown:UpdateSelection(newDungeon) end)
		end
		refreshEditorValues()
	end)

	local unhookBossActive = shared.OnBossActiveChanged(function()
		updateActiveStatus()
	end)

	local unhookBossIdx = shared.OnBossIndexChanged(function()
		updateActiveStatus()
	end)

	local unhookData = contextual.OnDataChanged(function()
		refreshEditorValues()
	end)

	lifecycle.Register(function()
		pcall(unhookDungeon)
		pcall(unhookBossActive)
		pcall(unhookBossIdx)
		pcall(unhookData)
	end)

	-- Initial UI setup
	refreshEditorValues()
end
