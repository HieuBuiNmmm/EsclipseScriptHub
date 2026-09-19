-- Module Evasion trong tab Combat (DungeonQuest):
-- Quản lý cấu hình & theo dõi thời gian thực hệ thống né đòn & thoát hiểm thông minh (Evasion Engine).
-- Bao gồm Threat Detection, Trajectory Prediction, Safe Spot Engine và Auto-Dodge Controller.

--// Imports
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local combatMaster = require("@routes/DungeonQuest/core/combatMaster")
local evasion = require("@routes/DungeonQuest/core/evasion")
local shared = require("@routes/DungeonQuest/core/shared")
local ui = require("@routes/DungeonQuest/core/ui")

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Evasion & Auto-Dodge Controls" })

	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Real-time Evasion Monitor" })

	--// Right Section Labels
	local statusLabel = rightSection:Label({ Text = "Detector: <font color='rgb(255,80,80)'>Disabled</font>" })
	local playerDangerLabel = rightSection:Label({ Text = "Player: <font color='rgb(0,255,170)'>SAFE</font>" })
	local safeSpotLabel = rightSection:Label({ Text = "Safe Spot: <font color='rgb(160,160,160)'>None Needed</font>" })
	local dodgeStatusLabel = rightSection:Label({ Text = "Auto Dodge: <font color='rgb(160,160,160)'>Idle</font>" })
	local activeCountLabel = rightSection:Label({ Text = "Active Hazards: <font color='rgb(160,160,160)'>0</font>" })
	local lastHazardLabel = rightSection:Label({ Text = "Last Detected: <font color='rgb(160,160,160)'>None</font>" })

	local function updatePlayerDanger(inDanger, threatInfo, threatType)
		if inDanger then
			local threatName = threatInfo and threatInfo.Name or "Unknown Threat"
			local typeStr = threatType and (" [" .. threatType .. "]") or ""
			pcall(function()
				playerDangerLabel:UpdateName(("Player: <font color='rgb(255,50,50)'><b>DANGER</b></font> (%s%s)"):format(
					threatName, typeStr
				))
			end)
		else
			pcall(function()
				playerDangerLabel:UpdateName("Player: <font color='rgb(0,255,170)'><b>SAFE</b></font>")
			end)
		end
	end

	evasion.OnPlayerDangerChanged(function(inDanger, threatInfo, threatType)
		updatePlayerDanger(inDanger, threatInfo, threatType)
	end)

	evasion.OnSafeSpotChanged(function(inDanger, spot, dist)
		if inDanger and spot then
			pcall(function()
				safeSpotLabel:UpdateName(("Safe Spot: <font color='rgb(0,255,120)'><b>Found (%.1f studs)</b></font>"):format(dist))
			end)
		else
			pcall(function()
				safeSpotLabel:UpdateName("Safe Spot: <font color='rgb(160,160,160)'>None Needed</font>")
			end)
		end
	end)

	evasion.OnDodgeStateChanged(function(isDodging, spot, dist)
		if isDodging and spot then
			pcall(function()
				dodgeStatusLabel:UpdateName(("Auto Dodge: <font color='rgb(0,255,200)'><b>Dodging (%.1f studs)</b></font>"):format(dist))
			end)
		else
			pcall(function()
				dodgeStatusLabel:UpdateName("Auto Dodge: <font color='rgb(160,160,160)'>Idle</font>")
			end)
		end
	end)

	local function updateMonitor(count, lastInfo)
		count = count or evasion.GetHazardCount()
		lastInfo = lastInfo or evasion.GetLastHazardInfo()

		local isEnabled = evasion.IsEnabled()
		local statusColor = isEnabled and "0, 255, 0" or "255, 80, 80"
		local statusText = isEnabled and "Active (Scanning & SelectionBox)" or "Disabled"

		pcall(function()
			statusLabel:UpdateName("Detector: <font color='rgb(" .. statusColor .. ")'>" .. statusText .. "</font>")
		end)

		local countColor = count > 0 and "255, 60, 60" or "0, 255, 0"
		pcall(function()
			activeCountLabel:UpdateName("Active Hazards: <font color='rgb(" .. countColor .. ")'>" .. tostring(count) .. "</font>")
		end)

		if lastInfo then
			pcall(function()
				lastHazardLabel:UpdateName(("Last Detected: <font color='rgb(255,220,120)'>%s</font> (%s, %d studs)"):format(
					lastInfo.Name, lastInfo.Class, lastInfo.Distance
				))
			end)
		else
			pcall(function()
				lastHazardLabel:UpdateName("Last Detected: <font color='rgb(160,160,160)'>None</font>")
			end)
		end
	end

	--// Right Section - Specific Skill Inspector
	rightSection:Header({ Name = "Specific Skill Inspector" })

	rightSection:Toggle({
		Name = "Enable Deep Inspector",
		Default = evasion.IsInspectEnabled(),
		Callback = autoSave.Wrap(function(state)
			evasion.SetInspectEnabled(state)
		end),
	}, "Toggle_HazardDeepInspector")

	rightSection:Input({
		Name = "Target Skill Name",
		Placeholder = "e.g. Meteor, Spike, Flame...",
		AcceptedCharacters = "All",
		Default = evasion.GetInspectTarget(),
		Callback = autoSave.Wrap(function(text)
			evasion.SetInspectTarget(text)
		end),
	})

	--// Right Section - Custom Trajectory Dimensions
	local customTrajSection = tab:Section({ Side = "Right" })
	customTrajSection:Header({ Name = "Custom Trajectory Dimensions" })

	ui.PatchSliderLoadCallback(customTrajSection:Slider({
		Name = "Second Boss Moving Beam (studs)",
		Default = evasion.GetSecondBossBeamLength(),
		Minimum = 10,
		Maximum = 250,
		DisplayMethod = "Value",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			evasion.SetSecondBossBeamLength(val)
		end),
	}, "Slider_HazardSecondBossBeamLength"))

	ui.PatchSliderLoadCallback(customTrajSection:Slider({
		Name = "First Boss Big Spike Width (studs)",
		Default = evasion.GetFirstBossBigSpikeWidth(),
		Minimum = 10,
		Maximum = 60,
		DisplayMethod = "Value",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			evasion.SetFirstBossBigSpikeWidth(val)
		end),
	}, "Slider_HazardFirstBossBigSpikeWidth"))

	ui.PatchSliderLoadCallback(customTrajSection:Slider({
		Name = "First Boss Seeking Spike Width (studs)",
		Default = evasion.GetFirstBossSeekingSpikeWidth(),
		Minimum = 4,
		Maximum = 30,
		DisplayMethod = "Value",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			evasion.SetFirstBossSeekingSpikeWidth(val)
		end),
	}, "Slider_HazardFirstBossSeekingSpikeWidth"))

	ui.PatchSliderLoadCallback(customTrajSection:Slider({
		Name = "Second Boss Circle Chain Lifetime (s)",
		Default = evasion.GetSecondBossCircleDuration(),
		Minimum = 0.5,
		Maximum = 4.0,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			evasion.SetSecondBossCircleDuration(val)
		end),
	}, "Slider_HazardSecondBossCircleDuration"))

	evasion.OnHazardChanged(function(count, lastInfo)
		updateMonitor(count, lastInfo)
	end)

	--// Left Section Controls
	local hsToggle = leftSection:Toggle({
		Name = "Enable Evasion Engine",
		Default = evasion.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			evasion.Toggle(state)
			updateMonitor()
		end),
	}, "Toggle_SmartDodgeThreatDetection")

	leftSection:Toggle({
		Name = "Show Player 2D Hitbox (Ground Visual)",
		Default = evasion.IsPlayerVisualEnabled(),
		Callback = autoSave.Wrap(function(state)
			evasion.SetPlayerVisualEnabled(state)
		end),
	}, "Toggle_HazardPlayer2DVisual")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Player 2D Hitbox Radius (studs)",
		Default = evasion.GetPlayerHitboxRadius(),
		Minimum = 0.5,
		Maximum = 8,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			evasion.SetPlayerHitboxRadius(val)
		end),
	}, "Slider_HazardPlayer2DHitboxRadius"))

	leftSection:Toggle({
		Name = "Show 3D Selection Boxes (Parts)",
		Default = evasion.IsSelectionBoxesEnabled(),
		Callback = autoSave.Wrap(function(state)
			evasion.SetSelectionBoxesEnabled(state)
		end),
	}, "Toggle_HazardSelectionBoxes")

	leftSection:Toggle({
		Name = "Show Lifespan Timer (3D Duration)",
		Default = evasion.IsTimerVisualEnabled(),
		Callback = autoSave.Wrap(function(state)
			evasion.SetTimerVisualEnabled(state)
		end),
	}, "Toggle_HazardLifespanTimer")

	leftSection:Toggle({
		Name = "Show Danger Zones (Ground Visualizer)",
		Default = evasion.IsVisualizerEnabled(),
		Callback = autoSave.Wrap(function(state)
			evasion.SetVisualizerEnabled(state)
		end),
	}, "Toggle_HazardGroundVisualizer")

	leftSection:Toggle({
		Name = "Show Trajectory Paths (Orange)",
		Default = evasion.IsTrajectoryEnabled(),
		Callback = autoSave.Wrap(function(state)
			evasion.SetTrajectoryEnabled(state)
		end),
	}, "Toggle_HazardTrajectoryVisualizer")

	leftSection:Toggle({
		Name = "Show Safe Spot Marker (Green Visual)",
		Default = evasion.IsSafeSpotVisualEnabled(),
		Callback = autoSave.Wrap(function(state)
			evasion.SetSafeSpotVisualEnabled(state)
		end),
	}, "Toggle_HazardSafeSpotVisual")

	leftSection:Toggle({
		Name = "Show Candidate Points & Rays (Scan Grid)",
		Default = evasion.IsShowCandidates(),
		Callback = autoSave.Wrap(function(state)
			evasion.SetShowCandidates(state)
		end),
	}, "Toggle_HazardShowCandidates")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Safe Spot Safety Margin (studs)",
		Default = evasion.GetSafeSpotBuffer(),
		Minimum = 0.0,
		Maximum = 6.0,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			evasion.SetSafeSpotBuffer(val)
		end),
	}, "Slider_HazardSafeSpotBuffer"))

	local dodgeToggle = leftSection:Toggle({
		Name = "Enable Auto Dodge (Move + Snap)",
		Default = evasion.IsAutoDodgeEnabled(),
		Callback = autoSave.Wrap(function(state)
			evasion.SetAutoDodgeEnabled(state)
		end),
	}, "Toggle_HazardAutoDodgeEnabled")

	leftSection:Header({ Name = "Sampling Pass Tiers" })

	leftSection:Toggle({
		Name = "Enable Fine Pass (Tier 2 - Max 45s)",
		Default = evasion.IsFinePassEnabled(),
		Callback = autoSave.Wrap(function(state)
			evasion.SetFinePassEnabled(state)
		end),
	}, "Toggle_HazardFinePassEnabled")

	leftSection:Toggle({
		Name = "Enable Emergency Fallback (Tier 3 - Max 55s)",
		Default = evasion.IsFallbackPassEnabled(),
		Callback = autoSave.Wrap(function(state)
			evasion.SetFallbackPassEnabled(state)
		end),
	}, "Toggle_HazardFallbackPassEnabled")

	combatMaster.OnStateChanged(function(enabled)
		pcall(function() hsToggle:UpdateState(enabled, true) end)
		pcall(function() dodgeToggle:UpdateState(enabled, true) end)
		updateMonitor()
	end)

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Dodge Snap Distance (studs)",
		Default = evasion.GetDodgeSnapDistance(),
		Minimum = 0.5,
		Maximum = 5.0,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			evasion.SetDodgeSnapDistance(val)
		end),
	}, "Slider_HazardDodgeSnapDistance"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Respawn Invulnerability Time (s)",
		Default = shared.GetRespawnProtectionDuration(),
		Minimum = 0.5,
		Maximum = 10.0,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			shared.SetRespawnProtectionDuration(val)
		end),
	}, "Slider_HazardRespawnInvulnerabilityTime"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Trajectory Length (studs)",
		Default = evasion.GetTrajectoryLength(),
		Minimum = 10,
		Maximum = 150,
		DisplayMethod = "Value",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			evasion.SetTrajectoryLength(val)
		end),
	}, "Slider_HazardTrajectoryLength"))

	leftSection:Toggle({
		Name = "Log Hazards (Spawns / Despawns)",
		Default = evasion.IsLogHazardsEnabled(),
		Callback = autoSave.Wrap(function(state)
			evasion.SetLogHazards(state)
		end),
	}, "Toggle_SmartDodgeLogHazards")

	leftSection:Toggle({
		Name = "Log Rejected (Unrenderable)",
		Default = evasion.IsLogFailedEnabled(),
		Callback = autoSave.Wrap(function(state)
			evasion.SetLogFailed(state)
		end),
	}, "Toggle_SmartDodgeLogRejected")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Blue Danger Zone Margin (studs)",
		Default = evasion.GetTrajectoryMargin(),
		Minimum = 0,
		Maximum = 10,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			evasion.SetTrajectoryMargin(val)
		end),
	}, "Slider_HazardTrajectoryMargin"))

	leftSection:Button({
		Name = "Clear Console",
		Callback = function()
			pcall(function()
				if rconsoleclear then rconsoleclear() end
			end)
		end,
	})

	-- Khởi tạo monitor
	updateMonitor()
end
