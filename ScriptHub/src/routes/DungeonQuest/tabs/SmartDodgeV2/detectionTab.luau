-- Tab Threat Detection V2: Section Detection
-- Điều khiển Threat Detection Engine V2, Visuals ESP, và Live Threat Monitor

local ui = require("@routes/DungeonQuest/core/ui")
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local shared = require("@routes/DungeonQuest/core/shared")
local shortcuts = require("@routes/DungeonQuest/core/shortcuts")
local smartDodgeV2 = require("@routes/DungeonQuest/core/smartDodgeV2")
local smartAutoPlay = require("@routes/DungeonQuest/core/smartAutoPlay")
local abilitySet = require("@routes/DungeonQuest/core/abilitySet")
local detection = smartDodgeV2.detection
local visuals = smartDodgeV2.visuals
local danger = smartDodgeV2.danger
local safeSpot = smartDodgeV2.safeSpot
local dodge = smartDodgeV2.dodge
local bossArea = smartDodgeV2.bossArea
local autoSkill = smartAutoPlay.autoSkill

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
	local dodgeStateLabel = rightSection:Label({ Text = "Dodge Engine: <font color='rgb(160,160,160)'>Idle</font>" })

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

	-- Lắng nghe trạng thái Dodge Engine V2
	dodge.OnDodgeStatusChanged(function(status)
		pcall(function()
			if danger.IsRespawnProtected and danger.IsRespawnProtected() then
				dodgeStateLabel:UpdateName("Dodge Engine: <font color='rgb(0,220,255)'>Bypassed (Respawn)</font>")
			elseif status == "Dodging" then
				dodgeStateLabel:UpdateName("Dodge Engine: <font color='rgb(255,200,50)'>DODGING (HumanoidMove)</font>")
			elseif status == "Safe" then
				dodgeStateLabel:UpdateName("Dodge Engine: <font color='rgb(60,255,130)'>SAFE (Snapped)</font>")
			else
				dodgeStateLabel:UpdateName("Dodge Engine: <font color='rgb(160,160,160)'>Idle</font>")
			end
		end)
	end)

	-- Giám sát đếm ngược Bảo vệ sau hồi sinh (Respawn Protection Countdown)
	task.spawn(function()
		local wasProtected = false
		while true do
			task.wait(0.2)
			local isProtected = danger.IsRespawnProtected and danger.IsRespawnProtected()
			if isProtected then
				wasProtected = true
				local rem = danger.GetRespawnProtectionRemaining and danger.GetRespawnProtectionRemaining() or 0
				pcall(function()
					dangerLabel:UpdateName(string.format("Danger State: <font color='rgb(0,220,255)'><b>PROTECTED</b></font> <font color='rgb(200,200,200)'>(%.1fs)</font>", rem))
					dodgeStateLabel:UpdateName("Dodge Engine: <font color='rgb(0,220,255)'>Bypassed (Respawn)</font>")
				end)
			elseif wasProtected then
				wasProtected = false
				pcall(function()
					dangerLabel:UpdateName("Danger State: <font color='rgb(50,255,50)'>SAFE</font>")
					dodgeStateLabel:UpdateName("Dodge Engine: <font color='rgb(160,160,160)'>Idle</font>")
				end)
			end
		end
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
		Maximum = 200,
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

	--// Universal Boss Arena Limiter Controls (Per-Boss Spawn Anchor)
	radarSection:Header({ Name = "Universal Boss Arena Limiter (Spawn Anchor)" })

	local arenaStatusLabel = radarSection:Label({ Text = "Arena Status: <font color='rgb(160,160,160)'>Inactive</font>" })

	radarSection:Toggle({
		Name = "Show Arena Boundary (Hologram Ring)",
		Default = bossArea.IsShowVisual(),
		Callback = autoSave.Wrap(function(state)
			bossArea.SetShowVisual(state)
		end),
	}, "Toggle_SDV2_BossAreaVisual")

	-- Boss 1
	radarSection:Toggle({
		Name = "Enable Arena Limiter: Boss 1",
		Default = bossArea.IsBossEnabled(1),
		Callback = autoSave.Wrap(function(state)
			bossArea.SetBossEnabled(1, state)
		end),
	}, "Toggle_SDV2_BossArea_B1_Enabled")

	ui.PatchSliderLoadCallback(radarSection:Slider({
		Name = "Arena Radius: Boss 1",
		Suffix = " std",
		Default = bossArea.GetBossRadius(1),
		Minimum = 15,
		Maximum = 200,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			bossArea.SetBossRadius(1, val)
		end),
	}, "Slider_SDV2_BossArea_B1_Radius"))

	radarSection:Toggle({
		Name = "Boss 1: Avoid Arena Center (Tránh né vào tâm)",
		Default = bossArea.IsBoss1AvoidCenter(),
		Callback = autoSave.Wrap(function(state)
			bossArea.SetBoss1AvoidCenter(state)
		end),
	}, "Toggle_SDV2_Boss1_AvoidCenter")

	ui.PatchSliderLoadCallback(radarSection:Slider({
		Name = "Boss 1: Center Deadzone (Vùng cấm tâm)",
		Suffix = " std",
		Default = bossArea.GetBoss1CenterRadius(),
		Minimum = 5,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			bossArea.SetBoss1CenterRadius(val)
		end),
	}, "Slider_SDV2_Boss1_CenterRadius"))

	-- Boss 2
	radarSection:Toggle({
		Name = "Enable Arena Limiter: Boss 2",
		Default = bossArea.IsBossEnabled(2),
		Callback = autoSave.Wrap(function(state)
			bossArea.SetBossEnabled(2, state)
		end),
	}, "Toggle_SDV2_BossArea_B2_Enabled")

	ui.PatchSliderLoadCallback(radarSection:Slider({
		Name = "Arena Radius: Boss 2",
		Suffix = " std",
		Default = bossArea.GetBossRadius(2),
		Minimum = 15,
		Maximum = 200,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			bossArea.SetBossRadius(2, val)
		end),
	}, "Slider_SDV2_BossArea_B2_Radius"))

	radarSection:Toggle({
		Name = "Boss 2: Dodge Orbs & Crystals",
		Default = smartDodgeV2.IsDodgeBoss2OrbEnabled and smartDodgeV2.IsDodgeBoss2OrbEnabled() or false,
		Callback = autoSave.Wrap(function(state)
			if smartDodgeV2.SetDodgeBoss2OrbEnabled then
				smartDodgeV2.SetDodgeBoss2OrbEnabled(state)
			end
		end),
	}, "Toggle_SDV2_DodgeBoss2Orb")

	-- Boss 3+
	radarSection:Toggle({
		Name = "Enable Arena Limiter: Boss 3+",
		Default = bossArea.IsBossEnabled(3),
		Callback = autoSave.Wrap(function(state)
			bossArea.SetBossEnabled(3, state)
		end),
	}, "Toggle_SDV2_BossArea_B3_Enabled")

	ui.PatchSliderLoadCallback(radarSection:Slider({
		Name = "Arena Radius: Boss 3+",
		Suffix = " std",
		Default = bossArea.GetBossRadius(3),
		Minimum = 15,
		Maximum = 200,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			bossArea.SetBossRadius(3, val)
		end),
	}, "Slider_SDV2_BossArea_B3_Radius"))

	bossArea.OnStatusChanged(function(isLocked, center, radius, bossIdx)
		pcall(function()
			if isLocked and center then
				arenaStatusLabel:UpdateName(string.format(
					"Arena Status: <font color='rgb(60,255,130)'>LOCKED (Boss %d)</font> <font color='rgb(200,200,200)'>(%.1f, %.1f) R: %.0fm</font>",
					bossIdx or 1, center.X, center.Z, radius or 45
				))
			else
				arenaStatusLabel:UpdateName("Arena Status: <font color='rgb(160,160,160)'>Inactive</font>")
			end
		end)
	end)

	--// Smart Auto Play V2 Section
	local autoPlaySection = tab:Section({ Side = "Left" })
	autoPlaySection:Header({ Name = "Smart Auto Play V2" })

	autoPlaySection:Toggle({
		Name = "Enable Smart Auto Play",
		Default = smartAutoPlay.IsMasterEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartAutoPlay.SetMasterEnabled(state)
		end),
	}, "Toggle_SDV2_SAP_Master")

	local autoPlayStatusLabel = autoPlaySection:Label({
		Text = "Status: <font color='rgb(160, 160, 160)'>Disabled</font>",
	})

	local MASTER_TARGET_SCOPE_OPTIONS = { "ALL", "CHỈ ĐÁNH BOSS", "CHỈ ĐÁNH MOB" }
	local curScopeIdx = 1
	local curScope = smartAutoPlay.GetTargetScope()
	if curScope == "Boss" then
		curScopeIdx = 2
	elseif curScope == "Mobs" then
		curScopeIdx = 3
	end

	ui.PatchDropdownRestore(autoPlaySection:Dropdown({
		Name = "Master Target Scope",
		Options = MASTER_TARGET_SCOPE_OPTIONS,
		Default = curScopeIdx,
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			if selected == "CHỈ ĐÁNH BOSS" then
				smartAutoPlay.SetTargetScope("Boss")
			elseif selected == "CHỈ ĐÁNH MOB" then
				smartAutoPlay.SetTargetScope("Mobs")
			else
				smartAutoPlay.SetTargetScope("All")
			end
		end),
	}, "Dropdown_SDV2_MasterTargetScope"))

	local COMBAT_MOVEMENT_OPTIONS = { "ORBIT (V2 - Gom Quái)", "OPEN SPACE (V1 - Bãi Trống)" }
	local curMovementIdx = 1
	local curMode = smartAutoPlay.GetCombatMovementMode and smartAutoPlay.GetCombatMovementMode()
	if curMode == "OpenSpace" then
		curMovementIdx = 2
	end

	ui.PatchDropdownRestore(autoPlaySection:Dropdown({
		Name = "Combat Movement Mode",
		Options = COMBAT_MOVEMENT_OPTIONS,
		Default = curMovementIdx,
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			local str = tostring(selected or ""):upper()
			if str:find("OPEN SPACE") or str:find("BÃI TRỐNG") or str:find("BAI TRONG") or str:find("V1") then
				smartAutoPlay.SetCombatMovementMode("OpenSpace")
			else
				smartAutoPlay.SetCombatMovementMode("Orbit")
			end
		end),
	}, "Dropdown_SDV2_CombatMovementMode"))

	autoPlaySection:Header({ Name = "Combat Radar (Cyan Circle) & Distance" })

	autoPlaySection:Toggle({
		Name = "Show Combat Radar (Cyan Circle)",
		Default = smartAutoPlay.IsShowRadiusCircleEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartAutoPlay.SetShowRadiusCircle(state)
		end),
	}, "Toggle_SDV2_ShowRadiusCircle")

	ui.PatchSliderLoadCallback(autoPlaySection:Slider({
		Name = "Boss 1 Combat Radius (Cyan Radar)",
		Suffix = " std",
		Default = smartAutoPlay.GetBoss1Radius(),
		Minimum = 4,
		Maximum = 70,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			smartAutoPlay.SetBoss1Radius(val)
		end),
	}, "Slider_SDV2_Radius_Boss1"))

	ui.PatchSliderLoadCallback(autoPlaySection:Slider({
		Name = "Boss 2 Combat Radius (Cyan Radar)",
		Suffix = " std",
		Default = smartAutoPlay.GetBoss2Radius(),
		Minimum = 4,
		Maximum = 70,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			smartAutoPlay.SetBoss2Radius(val)
		end),
	}, "Slider_SDV2_Radius_Boss2"))

	ui.PatchSliderLoadCallback(autoPlaySection:Slider({
		Name = "Boss 3 Combat Radius (Cyan Radar)",
		Suffix = " std",
		Default = smartAutoPlay.GetBoss3Radius(),
		Minimum = 4,
		Maximum = 70,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			smartAutoPlay.SetBoss3Radius(val)
		end),
	}, "Slider_SDV2_Radius_Boss3"))

	ui.PatchSliderLoadCallback(autoPlaySection:Slider({
		Name = "Mobs Combat Radius (Cyan Radar)",
		Suffix = " std",
		Default = smartAutoPlay.GetMobsRadius(),
		Minimum = 4,
		Maximum = 70,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			smartAutoPlay.SetMobsRadius(val)
		end),
	}, "Slider_SDV2_Radius_Mobs"))

	ui.PatchSliderLoadCallback(autoPlaySection:Slider({
		Name = "Cyan Sphere Particle Size",
		Suffix = " std",
		Default = smartAutoPlay.GetCyanSphereSize(),
		Minimum = 0.05,
		Maximum = 2.0,
		DisplayMethod = "Round",
		Precision = 2,
		Callback = autoSave.Wrap(function(val)
			smartAutoPlay.SetCyanSphereSize(val)
		end),
	}, "Slider_SDV2_CyanSphereSize"))

	autoPlaySection:Header({ Name = "Auto Skill & Combat Options" })

	autoPlaySection:Toggle({
		Name = "Enable Smart Auto Skill",
		Default = smartAutoPlay.IsAutoSkillEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartAutoPlay.SetAutoSkillEnabled(state)
		end),
	}, "Toggle_SDV2_SAP_AutoSkill")

	ui.PatchSliderLoadCallback(autoPlaySection:Slider({
		Name = "Skill Cast Range",
		Suffix = " std",
		Default = smartAutoPlay.GetSkillRange(),
		Minimum = 4,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			smartAutoPlay.SetSkillRange(val)
		end),
	}, "Slider_SDV2_SkillRange"))

	autoPlaySection:Toggle({
		Name = "Show Skill Range Circle (Visual)",
		Default = smartAutoPlay.IsShowSkillCircleEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartAutoPlay.SetShowSkillCircle(state)
		end),
	}, "Toggle_SDV2_ShowSkillCircle")

	ui.PatchSliderLoadCallback(autoPlaySection:Slider({
		Name = "Sphere Size (Visual)",
		Suffix = " std",
		Default = smartAutoPlay.GetSkillSphereSize(),
		Minimum = 0.05,
		Maximum = 2.0,
		DisplayMethod = "Round",
		Precision = 2,
		Callback = autoSave.Wrap(function(val)
			smartAutoPlay.SetSkillSphereSize(val)
			smartAutoPlay.SetCyanSphereSize(val)
		end),
	}, "Slider_SDV2_SphereSize"))

	autoPlaySection:Toggle({
		Name = "Auto Weapon Attack (M1)",
		Default = autoSkill.IsAutoAttackEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoSkill.SetAutoAttack(state)
		end),
	}, "Toggle_SDV2_SAP_AutoAttack")

	local PLAYSTYLE_OPTIONS = { "Auto (Detect)", "Buff + Damage", "Full Damage" }
	local defaultPlaystyleIdx = 1
	local curMode = autoSkill.GetPlaystyleMode()
	if curMode == "BuffAndDamage" then
		defaultPlaystyleIdx = 2
	elseif curMode == "FullDamage" then
		defaultPlaystyleIdx = 3
	end

	ui.PatchDropdownRestore(autoPlaySection:Dropdown({
		Name = "Playstyle Mode",
		Options = PLAYSTYLE_OPTIONS,
		Default = defaultPlaystyleIdx,
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			if selected == "Buff + Damage" then
				autoSkill.SetPlaystyleMode("BuffAndDamage")
			elseif selected == "Full Damage" then
				autoSkill.SetPlaystyleMode("FullDamage")
			else
				autoSkill.SetPlaystyleMode("Auto")
			end
		end),
	}, "Dropdown_SDV2_SAP_PlaystyleMode"))

	autoPlaySection:Toggle({
		Name = "Auto Buff For Speed (Travel)",
		Default = autoSkill.IsAutoBuffForSpeedEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoSkill.SetAutoBuffForSpeed(state)
		end),
	}, "Toggle_SDV2_SAP_AutoBuffForSpeed")

	ui.PatchSliderLoadCallback(autoPlaySection:Slider({
		Name = "Buff Cast Delay",
		Suffix = " s",
		Default = autoSkill.GetBuffDelay(),
		Minimum = 0.05,
		Maximum = 1.0,
		DisplayMethod = "Round",
		Precision = 2,
		Callback = autoSave.Wrap(function(val)
			autoSkill.SetBuffDelay(val)
		end),
	}, "Slider_SDV2_SAP_BuffDelay"))

	ui.PatchSliderLoadCallback(autoPlaySection:Slider({
		Name = "Buff Duration",
		Suffix = " s",
		Default = autoSkill.GetBuffDuration(),
		Minimum = 1.0,
		Maximum = 30.0,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			autoSkill.SetBuffDuration(val)
		end),
	}, "Slider_SDV2_SAP_BuffDuration"))

	autoPlaySection:Header({ Name = "Ability Loadout (Auto Swap Set)" })

	autoPlaySection:Toggle({
		Name = "Auto Swap Loadout (Mob vs Boss)",
		Default = abilitySet.IsAutoSwapEnabled(),
		Callback = autoSave.Wrap(function(state)
			abilitySet.SetAutoSwapEnabled(state)
		end),
	}, "Toggle_SDV2_AutoSwapAbilitySet")

	local mobDropdown = nil
	local bossDropdown = nil

	local function getDropdownOptions()
		return { abilitySet.GetSetLabel(1), abilitySet.GetSetLabel(2) }
	end

	local function patchSetDropdown(dropdown)
		if not dropdown or type(dropdown.UpdateSelection) ~= "function" then return dropdown end
		local origUpdate = dropdown.UpdateSelection
		dropdown.UpdateSelection = function(self, newSelection)
			local wantSet = nil
			if type(newSelection) == "string" then
				if newSelection:find("Set 2") then
					wantSet = 2
				elseif newSelection:find("Set 1") then
					wantSet = 1
				end
			elseif type(newSelection) == "number" then
				wantSet = newSelection
			end
			if wantSet then
				local label = abilitySet.GetSetLabel(wantSet)
				if not self:IsOption(label) then
					pcall(function()
						self:ClearOptions()
						self:InsertOptions(getDropdownOptions())
					end)
				end
				origUpdate(self, label)
				return
			end
			origUpdate(self, newSelection)
		end
		return dropdown
	end

	mobDropdown = patchSetDropdown(autoPlaySection:Dropdown({
		Name = "Mob Room Loadout (Quái thường)",
		Options = getDropdownOptions(),
		Default = abilitySet.GetSetLabel(abilitySet.GetMobSet()),
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			local setNum = (type(selected) == "string" and selected:find("Set 2")) and 2 or 1
			abilitySet.SetMobSet(setNum)
		end),
	}, "Dropdown_SDV2_MobLoadout"))

	bossDropdown = patchSetDropdown(autoPlaySection:Dropdown({
		Name = "Boss Room Loadout (Đánh Boss)",
		Options = getDropdownOptions(),
		Default = abilitySet.GetSetLabel(abilitySet.GetBossSet()),
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			local setNum = (type(selected) == "string" and selected:find("Set 2")) and 2 or 1
			abilitySet.SetBossSet(setNum)
		end),
	}, "Dropdown_SDV2_BossLoadout"))

	abilitySet.OnLabelsChanged(function()
		pcall(function()
			local opts = getDropdownOptions()
			if mobDropdown then
				local curMob = abilitySet.GetMobSet()
				mobDropdown:ClearOptions()
				mobDropdown:InsertOptions(opts)
				mobDropdown:UpdateSelection(abilitySet.GetSetLabel(curMob))
			end
			if bossDropdown then
				local curBoss = abilitySet.GetBossSet()
				bossDropdown:ClearOptions()
				bossDropdown:InsertOptions(opts)
				bossDropdown:UpdateSelection(abilitySet.GetSetLabel(curBoss))
			end
		end)
	end)

	smartAutoPlay.OnMasterStatusChanged(function(info)
		pcall(function()
			if not info.enabled then
				autoPlayStatusLabel:UpdateName("Status: <font color='rgb(160, 160, 160)'>Disabled</font>")
			elseif info.state == "Dodging" then
				autoPlayStatusLabel:UpdateName(string.format("Status: <font color='rgb(255, 65, 65)'>🛡️ DODGING! %s (%.1f std)</font>", info.hazardName or "Hazard", info.escapeDist or 0))
			elseif info.state == "Orbiting" then
				autoPlayStatusLabel:UpdateName(string.format("Status: <font color='rgb(0, 225, 255)'>🌀 ORBITING: Grouping %s</font>", info.targetName or "Mobs"))
			elseif info.state == "Repositioning" then
				autoPlayStatusLabel:UpdateName(string.format("Status: <font color='rgb(50, 150, 255)'>🔵 REPOSITIONING (Open Space: %.1f std)</font>", info.escapeDist or 0))
			elseif info.state == "InCombat" or info.state == "Strafing" then
				autoPlayStatusLabel:UpdateName(string.format("Status: <font color='rgb(0, 255, 120)'>⚔️ IN COMBAT (%s)</font>", info.targetName or "Target"))
			elseif info.state == "HoldingRadius" then
				autoPlayStatusLabel:UpdateName(string.format("Status: <font color='rgb(0, 240, 200)'>🛡️ HOLDING RADIUS (%s)</font>", info.targetName or "Target"))
			elseif info.state == "Approaching" then
				autoPlayStatusLabel:UpdateName(string.format("Status: <font color='rgb(0, 200, 255)'>🏃 APPROACHING (%s)</font>", info.targetName or "Target"))
			elseif info.state == "EnteringBossArea" then
				autoPlayStatusLabel:UpdateName(string.format("Status: <font color='rgb(0, 225, 255)'>🏃 ENTERING BOSS AREA (%s)</font>", info.targetName or "Boss"))
			elseif info.state == "WaitingBoss" then
				autoPlayStatusLabel:UpdateName("Status: <font color='rgb(255, 200, 50)'>⏳ WAITING FOR BOSS</font>")
			elseif info.state == "RoomCleared" then
				autoPlayStatusLabel:UpdateName("Status: <font color='rgb(255, 200, 50)'>✨ ROOM CLEARED</font>")
			else
				autoPlayStatusLabel:UpdateName(string.format("Status: <font color='rgb(0, 225, 255)'>%s</font>", tostring(info.state)))
			end
		end)
	end)

	--// Dodge Execution Controls (HumanoidMove + Snap đích)
	local dodgeSection = tab:Section({ Side = "Right" })
	dodgeSection:Header({ Name = "Dodge Execution (HumanoidMove + Snap)" })

	dodgeSection:Toggle({
		Name = "Enable Auto Dodge (Tự động né)",
		Default = dodge.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			dodge.SetEnabled(state)
		end),
	}, "Toggle_SDV2_AutoDodge")

	dodgeSection:Toggle({
		Name = "Respawn Dodge Bypass (Bỏ qua né sau hồi sinh)",
		Default = dodge.IsRespawnBypassEnabled(),
		Callback = autoSave.Wrap(function(state)
			dodge.SetRespawnBypassEnabled(state)
		end),
	}, "Toggle_SDV2_RespawnBypass")

	ui.PatchSliderLoadCallback(dodgeSection:Slider({
		Name = "Respawn Bypass Duration",
		Suffix = " s",
		Default = dodge.GetRespawnBypassDuration(),
		Minimum = 1.0,
		Maximum = 8.0,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			dodge.SetRespawnBypassDuration(val)
		end),
	}, "Slider_SDV2_RespawnBypassDuration"))

	ui.PatchSliderLoadCallback(dodgeSection:Slider({
		Name = "Max Snap Distance (Cự ly Snap)",
		Suffix = " std",
		Default = dodge.GetMaxSnapDistance(),
		Minimum = 0.5,
		Maximum = 5.0,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			dodge.SetMaxSnapDistance(val)
		end),
	}, "Slider_SDV2_MaxSnapDist"))

	dodgeSection:Toggle({
		Name = "Maintain Snap Height (Giữ cao độ)",
		Default = dodge.IsMaintainSnapHeight(),
		Callback = autoSave.Wrap(function(state)
			dodge.SetMaintainSnapHeight(state)
		end),
	}, "Toggle_SDV2_MaintainHeight")

	local STRAFE_FACING_OPTIONS = { "All", "Boss", "Mob", "Disabled" }
	local curFacing = dodge.GetStrafeFacingMode()
	local curFacingIdx = 1
	if curFacing == "Boss" then
		curFacingIdx = 2
	elseif curFacing == "Mob" then
		curFacingIdx = 3
	elseif curFacing == "Disabled" then
		curFacingIdx = 4
	end

	ui.PatchDropdownRestore(dodgeSection:Dropdown({
		Name = "Strafe Facing Target",
		Options = STRAFE_FACING_OPTIONS,
		Default = curFacingIdx,
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			dodge.SetStrafeFacingMode(selected)
		end),
	}, "Dropdown_SDV2_StrafeFacingTarget"))

	-- Kích hoạt facing ngay nếu chế độ hiện tại khác Disabled
	if curFacing and curFacing ~= "Disabled" then
		dodge.SetStrafeFacingMode(curFacing)
	end

	--// Player Movement Speed (WalkSpeed Custom)
	local speedSection = tab:Section({ Side = "Right" })
	speedSection:Header({ Name = "Movement Speed" })

	speedSection:Toggle({
		Name = "Fast Speed",
		Default = shared.IsSpeedEnabled(),
		Callback = autoSave.Wrap(function(state)
			shared.SetSpeedEnabled(state)
		end),
	}, "Toggle_FastSpeed")

	ui.PatchSliderLoadCallback(speedSection:Slider({
		Name = "Custom Fast Speed",
		Default = shared.GetFastSpeed(),
		Minimum = 16,
		Maximum = 28,
		DisplayMethod = "Round",
		Precision = 2,
		Callback = autoSave.Wrap(function(Value)
			shared.SetFastSpeed(math.round(Value * 100) / 100)
		end),
	}, "Slider_FastSpeed"))

	speedSection:Toggle({
		Name = "Instant Acceleration (Max Speed tức thì)",
		Default = shared.IsInstantAccelEnabled(),
		Callback = autoSave.Wrap(function(state)
			shared.SetInstantAccelEnabled(state)
		end),
	}, "Toggle_InstantAcceleration")

	speedSection:Header({ Name = "Shortcuts" })

	speedSection:Toggle({
		Name = "Right Click Combo (Q+E)",
		Default = shortcuts.IsMouseComboEnabled(),
		Callback = autoSave.Wrap(function(state)
			shortcuts.SetMouseComboEnabled(state)
		end),
	}, "Toggle_MouseCombo")

	updateRadarMonitor(false, nil, nil, 0, nil)
end
