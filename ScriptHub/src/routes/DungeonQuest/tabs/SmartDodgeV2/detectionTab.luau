-- Tab Threat Detection V2: Section Detection
-- Điều khiển Threat Detection Engine V2, Visuals ESP, và Live Threat Monitor

local ui = require("@routes/DungeonQuest/core/ui")
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local smartDodgeV2 = require("@routes/DungeonQuest/core/smartDodgeV2")
local detection = smartDodgeV2.detection
local visuals = smartDodgeV2.visuals
local danger = smartDodgeV2.danger
local safeSpot = smartDodgeV2.safeSpot

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Threat Detection V2" })

	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Live Threat Inspector" })

	--// Right Section: Real-time Monitor Labels
	local statusLabel = rightSection:Label({ Text = "Detector V2: <font color='rgb(255,80,80)'>Disabled</font>" })
	local dangerLabel = rightSection:Label({ Text = "Danger State: <font color='rgb(50,255,50)'>SAFE</font>" })
	local countLabel = rightSection:Label({ Text = "Active Hazards: <font color='rgb(160,160,160)'>0</font>" })
	local lastHazardLabel = rightSection:Label({ Text = "Last Threat: <font color='rgb(160,160,160)'>None</font>" })

	--// Right Section: Safe Spot Radar V2 Monitor
	rightSection:Header({ Name = "Safe Spot Radar V2 Monitor" })
	local radarStateLabel = rightSection:Label({ Text = "Radar: <font color='rgb(160,160,160)'>Idle</font>" })
	local radarTargetLabel = rightSection:Label({ Text = "Safe Target: <font color='rgb(160,160,160)'>None</font>" })
	local radarStatsLabel = rightSection:Label({ Text = "Scan: <font color='rgb(160,160,160)'>-</font>" })

	local function updateRadarMonitor(hasSpot, pos, hazardName, dist, chosen)
		pcall(function()
			if hasSpot and pos then
				radarStateLabel:UpdateName(("Radar: <font color='rgb(60,255,130)'>LOCKED</font> (<font color='rgb(255,200,50)'>Vector #%d</font>)"):format((chosen or 0) + 1))
				radarTargetLabel:UpdateName(("Safe Target: <font color='rgb(60,255,130)'>(%.1f, %.1f, %.1f)</font> - %.1f std"):format(pos.X, pos.Y, pos.Z, dist or 0))
			elseif hazardName then
				radarStateLabel:UpdateName(("Radar: <font color='rgb(255,90,90)'>NO EXIT (%s)</font>"):format(hazardName))
				radarTargetLabel:UpdateName("Safe Target: <font color='rgb(255,140,0)'>No vector escaped</font>")
			else
				radarStateLabel:UpdateName("Radar: <font color='rgb(160,160,160)'>Idle</font>")
				radarTargetLabel:UpdateName("Safe Target: <font color='rgb(160,160,160)'>None</font>")
			end
		end)
		pcall(function()
			local found, total, chosen, refineFound = safeSpot.GetLastScanStats()
			if found > 0 then
				radarStatsLabel:UpdateName(("Scan: <font color='rgb(60,255,130)'>%d/%d</font> escaped (<font color='rgb(200,200,200)'>seed %d, refine %d</font>)")
					:format(found, total, found - (refineFound or 0), refineFound or 0))
			else
				radarStatsLabel:UpdateName(("Scan: <font color='rgb(255,90,90)'>%d/%d</font> vectors escaped"):format(found, total))
			end
		end)
	end

	local function updateMonitor(count, lastHazard)
		count = count or detection.GetHazardCount()
		local isEnabled = detection.IsEnabled()
		local statusColor = isEnabled and "0, 255, 0" or "255, 80, 80"
		local statusText = isEnabled and "Active (Real-time V2)" or "Disabled"

		pcall(function()
			statusLabel:UpdateName("Detector V2: <font color='rgb(" .. statusColor .. ")'>" .. statusText .. "</font>")
		end)

		local countColor = count > 0 and "255, 60, 60" or "0, 255, 0"
		pcall(function()
			countLabel:UpdateName("Active Hazards: <font color='rgb(" .. countColor .. ")'>" .. tostring(count) .. "</font>")
		end)

		if lastHazard then
			pcall(function()
				lastHazardLabel:UpdateName(("Last Threat: <font color='rgb(255,200,60)'>%s</font> (%d parts, %.1fm)"):format(
					lastHazard.name, lastHazard.neonCount, lastHazard.distanceToPlayer
				))
			end)
		end
	end

	-- Lắng nghe sự kiện từ Detection V2
	detection.OnHazardsChanged(function(count, lastHazard)
		updateMonitor(count, lastHazard)
	end)

	-- Lắng nghe sự kiện từ Danger Engine V2
	danger.OnDangerStateChanged(function(inDanger, currentHazard)
		pcall(function()
			if inDanger and currentHazard then
				dangerLabel:UpdateName(("Danger State: <font color='rgb(255,40,40)'><b>IN DANGER</b></font> (<font color='rgb(255,200,50)'>%s</font>)"):format(currentHazard.name))
			else
				dangerLabel:UpdateName("Danger State: <font color='rgb(50,255,50)'>SAFE</font>")
			end
		end)
	end)

	-- Lắng nghe sự kiện Safe Spot Radar V2
	safeSpot.OnSafeSpotChanged(function(hasSpot, pos, hazardName, dist, chosen)
		updateRadarMonitor(hasSpot, pos, hazardName, dist, chosen)
	end)

	--// Right Section: Specific Skill Orange Corridor Lengths (Chỉnh độ dài vùng Cam cho từng Skill riêng biệt)
	rightSection:Header({ Name = "Orange Corridor Lengths (Độ dài Vùng Cam từng Skill)" })

	ui.PatchSliderLoadCallback(rightSection:Slider({
		Name = "Boss 2: Homing Orbs",
		Suffix = " std",
		Default = detection.GetSkillCorridorLength("boss2_orbs"),
		Minimum = 15,
		Maximum = 200,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			detection.SetSkillCorridorLength("boss2_orbs", val)
		end),
	}, "Slider_SDV2_Len_Boss2Orbs"))

	ui.PatchSliderLoadCallback(rightSection:Slider({
		Name = "Boss 1: Laser & Telegraph Beams",
		Suffix = " std",
		Default = detection.GetSkillCorridorLength("boss1_beam"),
		Minimum = 40,
		Maximum = 250,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			detection.SetSkillCorridorLength("boss1_beam", val)
		end),
	}, "Slider_SDV2_Len_Boss1Beam"))

	ui.PatchSliderLoadCallback(rightSection:Slider({
		Name = "Boss 1: Seeking Spikes",
		Suffix = " std",
		Default = detection.GetSkillCorridorLength("boss1_seekingspikes"),
		Minimum = 15,
		Maximum = 120,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			detection.SetSkillCorridorLength("boss1_seekingspikes", val)
		end),
	}, "Slider_SDV2_Len_Boss1SeekSpikes"))

	ui.PatchSliderLoadCallback(rightSection:Slider({
		Name = "Boss 1: Big Spike",
		Suffix = " std",
		Default = detection.GetSkillCorridorLength("boss1_bigspike"),
		Minimum = 15,
		Maximum = 150,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			detection.SetSkillCorridorLength("boss1_bigspike", val)
		end),
	}, "Slider_SDV2_Len_Boss1BigSpike"))

	ui.PatchSliderLoadCallback(rightSection:Slider({
		Name = "Boss 1: Sky Shot",
		Suffix = " std",
		Default = detection.GetSkillCorridorLength("boss1_skyshot"),
		Minimum = 20,
		Maximum = 150,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			detection.SetSkillCorridorLength("boss1_skyshot", val)
		end),
	}, "Slider_SDV2_Len_Boss1SkyShot"))

	ui.PatchSliderLoadCallback(rightSection:Slider({
		Name = "Boss 1: Criss Cross",
		Suffix = " std",
		Default = detection.GetSkillCorridorLength("boss1_crisscross"),
		Minimum = 15,
		Maximum = 120,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			detection.SetSkillCorridorLength("boss1_crisscross", val)
		end),
	}, "Slider_SDV2_Len_Boss1CrissCross"))

	ui.PatchSliderLoadCallback(rightSection:Slider({
		Name = "Boss 2: Moving Beam",
		Suffix = " std",
		Default = detection.GetSkillCorridorLength("boss2_movingbeam"),
		Minimum = 15,
		Maximum = 150,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			detection.SetSkillCorridorLength("boss2_movingbeam", val)
		end),
	}, "Slider_SDV2_Len_Boss2MovingBeam"))

	ui.PatchSliderLoadCallback(rightSection:Slider({
		Name = "Boss 3: Homing Missile",
		Suffix = " std",
		Default = detection.GetSkillCorridorLength("boss3_missile"),
		Minimum = 15,
		Maximum = 150,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			detection.SetSkillCorridorLength("boss3_missile", val)
		end),
	}, "Slider_SDV2_Len_Boss3Missile"))

	ui.PatchSliderLoadCallback(rightSection:Slider({
		Name = "Boss 3: Bouncing Orb",
		Suffix = " std",
		Default = detection.GetSkillCorridorLength("boss3_bouncingorb"),
		Minimum = 10,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			detection.SetSkillCorridorLength("boss3_bouncingorb", val)
		end),
	}, "Slider_SDV2_Len_Boss3BouncingOrb"))

	--// Left Section: Controls Detection
	leftSection:Toggle({
		Name = "Enable Threat Detection V2",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			detection.SetEnabled(state)
			updateMonitor()
		end),
	}, "Toggle_SDV2_Enabled")

	leftSection:Toggle({
		Name = "3D ESP Highlighting",
		Default = true,
		Callback = autoSave.Wrap(function(state)
			visuals.SetEspEnabled(state)
		end),
	}, "Toggle_SDV2_VisualESP")

	leftSection:Toggle({
		Name = "Unified Model Box (Gộp khung Model >= 2 Parts)",
		Default = true,
		Callback = autoSave.Wrap(function(state)
			visuals.SetUnifiedModelBoxes(state)
		end),
	}, "Toggle_SDV2_UnifiedModel")

	leftSection:Toggle({
		Name = "Show Part Name Tags [Parent(ClassName)]",
		Default = true,
		Callback = autoSave.Wrap(function(state)
			visuals.SetNameTagsEnabled(state)
		end),
	}, "Toggle_SDV2_NameTags")

	leftSection:Toggle({
		Name = "Show Player Hitbox Radius (Vòng chân)",
		Default = true,
		Callback = autoSave.Wrap(function(state)
			visuals.SetHitboxVisualEnabled(state)
		end),
	}, "Toggle_SDV2_HitboxCircle")

	leftSection:Toggle({
		Name = "Console Threat Logging",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			detection.SetLogHazards(state)
		end),
	}, "Toggle_SDV2_LogHazards")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Box Outline Thickness",
		Default = 8,
		Minimum = 2,
		Maximum = 25,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			visuals.SetLineThickness(val / 100)
		end),
	}, "Slider_SDV2_Thickness"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Box Surface Opacity",
		Default = 35,
		Minimum = 0,
		Maximum = 100,
		DisplayMethod = "Percent",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			visuals.SetSurfaceTransparency(1 - (val / 100))
		end),
	}, "Slider_SDV2_Opacity"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Player Hitbox Padding (std)",
		Default = danger.GetHitboxPadding(),
		Minimum = 0.1,
		Maximum = 5.0,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			local padding = tonumber(val) or 0.35
			if padding > 5.0 then
				padding = padding / 10
			end
			danger.SetHitboxPadding(padding)
		end),
	}, "Slider_SDV2_Padding"), function(val)
		if val > 5.0 then return val / 10 end
		return val
	end)

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Hitbox Height Offset (std)",
		Default = danger.GetHitboxDownwardOffset(),
		Minimum = 1.0,
		Maximum = 5.0,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			local offset = tonumber(val) or 2.85
			if offset > 5.0 then
				offset = offset / 10
			end
			danger.SetHitboxDownwardOffset(offset)
		end),
	}, "Slider_SDV2_HeightOffset"), function(val)
		if val > 5.0 then return val / 10 end
		return val
	end)

	updateMonitor()

	--// Safe Spot Radar V2 Controls
	local radarSection = tab:Section({ Side = "Left" })
	radarSection:Header({ Name = "Safe Spot Radar V2 (Adaptive Search)" })

	radarSection:Toggle({
		Name = "Enable Safe Spot Radar",
		Default = safeSpot.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			safeSpot.SetEnabled(state)
		end),
	}, "Toggle_SDV2_SafeSpotRadar")

	radarSection:Toggle({
		Name = "Adaptive Direction Search (Seed + Refine)",
		Default = safeSpot.IsAdaptive(),
		Callback = autoSave.Wrap(function(state)
			safeSpot.SetAdaptive(state)
		end),
	}, "Toggle_SDV2_AdaptiveSearch")

	radarSection:Toggle({
		Name = "Show Scan Vectors (Radar Lines)",
		Default = safeSpot.IsShowVectors(),
		Callback = autoSave.Wrap(function(state)
			safeSpot.SetShowVectors(state)
		end),
	}, "Toggle_SDV2_ShowVectors")

	radarSection:Toggle({
		Name = "Show Safe Spot Marker (Green)",
		Default = safeSpot.IsShowMarker(),
		Callback = autoSave.Wrap(function(state)
			safeSpot.SetShowMarker(state)
		end),
	}, "Toggle_SDV2_ShowSafeMarker")

	radarSection:Toggle({
		Name = "Debug: Number Each Vector (#1..#N)",
		Default = safeSpot.IsShowVectorNumbers(),
		Callback = autoSave.Wrap(function(state)
			safeSpot.SetShowVectorNumbers(state)
		end),
	}, "Toggle_SDV2_ShowVectorNumbers")

	ui.PatchSliderLoadCallback(radarSection:Slider({
		Name = "Vector Count",
		Default = safeSpot.GetRayCount(),
		Minimum = 8,
		Maximum = 48,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			safeSpot.SetRayCount(val)
		end),
	}, "Slider_SDV2_RayCount"))

	ui.PatchSliderLoadCallback(radarSection:Slider({
		Name = "Max Scan Radius",
		Suffix = " std",
		Default = safeSpot.GetMaxRadius(),
		Minimum = 5,
		Maximum = 120,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			safeSpot.SetMaxRadius(val)
		end),
	}, "Slider_SDV2_MaxRadius"))

	ui.PatchSliderLoadCallback(radarSection:Slider({
		Name = "Escape Margin",
		Suffix = " std",
		Default = safeSpot.GetEscapeMargin(),
		Minimum = 0,
		Maximum = 8,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			safeSpot.SetEscapeMargin(val)
		end),
	}, "Slider_SDV2_EscapeMargin"))

	updateRadarMonitor(false, nil, nil, 0, nil)
end
