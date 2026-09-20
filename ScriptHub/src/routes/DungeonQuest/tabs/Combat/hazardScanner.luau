-- Module Hazard Scanner trong tab Combat (DungeonQuest): quét đối tượng skill xuất hiện
-- trong Workspace sau sự kiện start dungeon và vẽ SelectionBox đơn giản cho từng đối tượng.
-- Không còn trajectory / whitelist / ngoại lệ / hitbox padding / tên 3D.

--// Imports
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local combatMaster = require("@routes/DungeonQuest/core/combatMaster")
local hazardScanner = require("@routes/DungeonQuest/core/hazardScanner")
local liveRadar = require("@routes/DungeonQuest/core/liveRadar")
local shared = require("@routes/DungeonQuest/core/shared")
local ui = require("@routes/DungeonQuest/core/ui")

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Hazard Scanner Controls" })

	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Real-time Hazard Monitor" })

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

	hazardScanner.OnPlayerDangerChanged(function(inDanger, threatInfo, threatType)
		updatePlayerDanger(inDanger, threatInfo, threatType)
	end)

	hazardScanner.OnSafeSpotChanged(function(inDanger, spot, dist)
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

	hazardScanner.OnDodgeStateChanged(function(isDodging, spot, dist)
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
		count = count or hazardScanner.GetHazardCount()
		lastInfo = lastInfo or hazardScanner.GetLastHazardInfo()

		local isEnabled = hazardScanner.IsEnabled()
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
		Default = hazardScanner.IsInspectEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetInspectEnabled(state)
		end),
	}, "Toggle_HazardDeepInspector")

	rightSection:Input({
		Name = "Target Skill Name",
		Placeholder = "e.g. Meteor, Spike, Flame...",
		AcceptedCharacters = "All",
		Default = hazardScanner.GetInspectTarget(),
		Callback = autoSave.Wrap(function(text)
			hazardScanner.SetInspectTarget(text)
		end),
	})

	--// Right Section - Custom Trajectory Dimensions
	local customTrajSection = tab:Section({ Side = "Right" })
	customTrajSection:Header({ Name = "Custom Trajectory Dimensions" })

	ui.PatchSliderLoadCallback(customTrajSection:Slider({
		Name = "Second Boss Moving Beam (studs)",
		Default = hazardScanner.GetSecondBossBeamLength(),
		Minimum = 10,
		Maximum = 250,
		DisplayMethod = "Value",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			hazardScanner.SetSecondBossBeamLength(val)
		end),
	}, "Slider_HazardSecondBossBeamLength"))

	ui.PatchSliderLoadCallback(customTrajSection:Slider({
		Name = "First Boss Big Spike Width (studs)",
		Default = hazardScanner.GetFirstBossBigSpikeWidth(),
		Minimum = 10,
		Maximum = 60,
		DisplayMethod = "Value",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			hazardScanner.SetFirstBossBigSpikeWidth(val)
		end),
	}, "Slider_HazardFirstBossBigSpikeWidth"))

	ui.PatchSliderLoadCallback(customTrajSection:Slider({
		Name = "First Boss Seeking Spike Width (studs)",
		Default = hazardScanner.GetFirstBossSeekingSpikeWidth(),
		Minimum = 4,
		Maximum = 30,
		DisplayMethod = "Value",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			hazardScanner.SetFirstBossSeekingSpikeWidth(val)
		end),
	}, "Slider_HazardFirstBossSeekingSpikeWidth"))

	ui.PatchSliderLoadCallback(customTrajSection:Slider({
		Name = "Second Boss Circle Chain Lifetime (s)",
		Default = hazardScanner.GetSecondBossCircleDuration(),
		Minimum = 0.5,
		Maximum = 4.0,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			hazardScanner.SetSecondBossCircleDuration(val)
		end),
	}, "Slider_HazardSecondBossCircleDuration"))

	--// Right Section - Live 2D Radar & WebSocket Telemetry
	local radarSection = tab:Section({ Side = "Right" })
	radarSection:Header({ Name = "Live 2D Top-Down Radar (WebSocket)" })

	local radarStatusLabel = radarSection:Label({ Text = "Radar Server: <font color='rgb(255,80,80)'>Disconnected</font>" })

	local function updateRadarStatus(st)
		local col = "255,80,80"
		if st == "Connected" then
			col = "0,255,136"
		elseif st == "Connecting" then
			col = "255,170,0"
		end
		pcall(function()
			radarStatusLabel:UpdateName("Radar Server: <font color='rgb(" .. col .. ")'><b>" .. tostring(st) .. "</b></font>")
		end)
	end

	liveRadar.OnStatusChanged(function(st)
		updateRadarStatus(st)
	end)

	radarSection:Toggle({
		Name = "Enable Live 2D Radar Stream",
		Default = liveRadar.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			liveRadar.SetEnabled(state)
			updateRadarStatus(liveRadar.GetStatus())
		end),
	}, "Toggle_LiveRadarEnabled")

	radarSection:Input({
		Name = "WebSocket Server URL",
		Placeholder = "ws://127.0.0.1:8765",
		AcceptedCharacters = "All",
		Default = liveRadar.GetUrl(),
		Callback = autoSave.Wrap(function(text)
			liveRadar.SetUrl(text)
		end),
	})

	ui.PatchSliderLoadCallback(radarSection:Slider({
		Name = "Stream Refresh Rate (FPS)",
		Default = liveRadar.GetFps(),
		Minimum = 10,
		Maximum = 60,
		DisplayMethod = "Value",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			liveRadar.SetFps(val)
		end),
	}, "Slider_LiveRadarFps"))

	hazardScanner.OnHazardChanged(function(count, lastInfo)
		updateMonitor(count, lastInfo)
	end)

	--// Left Section Controls
	local hsToggle = leftSection:Toggle({
		Name = "Enable Hazard Scanner",
		Default = hazardScanner.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.Toggle(state)
			updateMonitor()
		end),
	}, "Toggle_SmartDodgeThreatDetection")

	leftSection:Toggle({
		Name = "Show Player 2D Hitbox (Ground Visual)",
		Default = hazardScanner.IsPlayerVisualEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetPlayerVisualEnabled(state)
		end),
	}, "Toggle_HazardPlayer2DVisual")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Player 2D Hitbox Radius (studs)",
		Default = hazardScanner.GetPlayerHitboxRadius(),
		Minimum = 0.5,
		Maximum = 8,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			hazardScanner.SetPlayerHitboxRadius(val)
		end),
	}, "Slider_HazardPlayer2DHitboxRadius"))

	leftSection:Toggle({
		Name = "Show 3D Selection Boxes (Parts)",
		Default = hazardScanner.IsSelectionBoxesEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetSelectionBoxesEnabled(state)
		end),
	}, "Toggle_HazardSelectionBoxes")

	leftSection:Toggle({
		Name = "Show Lifespan Timer (3D Duration)",
		Default = hazardScanner.IsTimerVisualEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetTimerVisualEnabled(state)
		end),
	}, "Toggle_HazardLifespanTimer")

	leftSection:Toggle({
		Name = "Show Danger Zones (Ground Visualizer)",
		Default = hazardScanner.IsVisualizerEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetVisualizerEnabled(state)
		end),
	}, "Toggle_HazardGroundVisualizer")

	leftSection:Toggle({
		Name = "Show Trajectory Paths (Orange)",
		Default = hazardScanner.IsTrajectoryEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetTrajectoryEnabled(state)
		end),
	}, "Toggle_HazardTrajectoryVisualizer")

	leftSection:Toggle({
		Name = "Show Safe Spot Marker (Green Visual)",
		Default = hazardScanner.IsSafeSpotVisualEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetSafeSpotVisualEnabled(state)
		end),
	}, "Toggle_HazardSafeSpotVisual")

	leftSection:Toggle({
		Name = "Show Candidate Points & Rays (Scan Grid)",
		Default = hazardScanner.IsShowCandidates(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetShowCandidates(state)
		end),
	}, "Toggle_HazardShowCandidates")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Safe Spot Safety Margin (studs)",
		Default = hazardScanner.GetSafeSpotBuffer(),
		Minimum = 0.0,
		Maximum = 6.0,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			hazardScanner.SetSafeSpotBuffer(val)
		end),
	}, "Slider_HazardSafeSpotBuffer"))

	local dodgeToggle = leftSection:Toggle({
		Name = "Enable Auto Dodge (Move + Snap)",
		Default = hazardScanner.IsAutoDodgeEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetAutoDodgeEnabled(state)
		end),
	}, "Toggle_HazardAutoDodgeEnabled")

	leftSection:Header({ Name = "Sampling Pass Tiers" })

	leftSection:Toggle({
		Name = "Enable Fine Pass (Tier 2 - Max 45s)",
		Default = hazardScanner.IsFinePassEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetFinePassEnabled(state)
		end),
	}, "Toggle_HazardFinePassEnabled")

	leftSection:Toggle({
		Name = "Enable Emergency Fallback (Tier 3 - Max 55s)",
		Default = hazardScanner.IsFallbackPassEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetFallbackPassEnabled(state)
		end),
	}, "Toggle_HazardFallbackPassEnabled")

	combatMaster.OnStateChanged(function(enabled)
		pcall(function() hsToggle:UpdateState(enabled, true) end)
		pcall(function() dodgeToggle:UpdateState(enabled, true) end)
		updateMonitor()
	end)

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Dodge Snap Distance (studs)",
		Default = hazardScanner.GetDodgeSnapDistance(),
		Minimum = 0.5,
		Maximum = 5.0,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			hazardScanner.SetDodgeSnapDistance(val)
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
		Default = hazardScanner.GetTrajectoryLength(),
		Minimum = 10,
		Maximum = 150,
		DisplayMethod = "Value",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			hazardScanner.SetTrajectoryLength(val)
		end),
	}, "Slider_HazardTrajectoryLength"))

	leftSection:Toggle({
		Name = "Log Hazards (Spawns / Despawns)",
		Default = hazardScanner.IsLogHazardsEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetLogHazards(state)
		end),
	}, "Toggle_SmartDodgeLogHazards")

	leftSection:Toggle({
		Name = "Log Rejected (Unrenderable)",
		Default = hazardScanner.IsLogFailedEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetLogFailed(state)
		end),
	}, "Toggle_SmartDodgeLogRejected")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Blue Danger Zone Margin (studs)",
		Default = hazardScanner.GetTrajectoryMargin(),
		Minimum = 0,
		Maximum = 10,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			hazardScanner.SetTrajectoryMargin(val)
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