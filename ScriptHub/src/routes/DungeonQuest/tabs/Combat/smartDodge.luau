-- Module Smart Dodge trong tab Combat (DungeonQuest): quản lý tính năng né chiêu thông minh.
-- Giai đoạn 1, 2 & 3: Threat Detection, Safe Spot Calculation & Dodge Execution.
-- Cơ chế né duy nhất: Walk + Snap (MoveTo đi bộ, snap tới đích khi còn cự ly ≤ Max Snap).

--// Imports
local ui = require("@routes/DungeonQuest/core/ui")
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local smartDodge = require("@routes/DungeonQuest/core/smartDodge")

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Threat & Dodge Controls" })

	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Real-time Dodge Monitor" })

	--// Right Section Labels
	local statusLabel = rightSection:Label({ Text = "Detector: <font color='rgb(255,80,80)'>Disabled</font>" })
	local activeCountLabel = rightSection:Label({ Text = "Active Hazards: <font color='rgb(160,160,160)'>0</font>" })
	local playerStateLabel = rightSection:Label({ Text = "Player State: <font color='rgb(0,255,0)'>SAFE</font>" })
	local safeSpotLabel = rightSection:Label({ Text = "Safe Target: <font color='rgb(160,160,160)'>None (No Dodge Needed)</font>" })
	local dodgeActionLabel = rightSection:Label({ Text = "Dodge Action: <font color='rgb(160,160,160)'>Idle</font>" })
	local lastHazardLabel = rightSection:Label({ Text = "Last Detected: <font color='rgb(160,160,160)'>None</font>" })

	local function updateMonitor(count, lastInfo)
		count = count or smartDodge.GetHazardCount()
		lastInfo = lastInfo or smartDodge.GetLastHazardInfo()

		local isEnabled = smartDodge.IsEnabled()
		local statusColor = isEnabled and "0, 255, 0" or "255, 80, 80"
		local statusText = isEnabled and "Active (Scanning & Calculating)" or "Disabled"

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

	local function updateSafeSpotUI(inDanger, safePos, hazardName, escapeDist, isInvulnerable, invulnReason, isDead)
		if isDead == nil then
			isDead = smartDodge.IsDead and smartDodge.IsDead() or false
		end
		if isInvulnerable == nil then
			isInvulnerable, invulnReason = smartDodge.IsInvulnerable()
		end

		if isDead then
			pcall(function()
				playerStateLabel:UpdateName("Player State: <font color='rgb(160,160,160)'>💀 DEAD</font>")
				safeSpotLabel:UpdateName("Safe Target: <font color='rgb(160,160,160)'>None (Player Dead)</font>")
			end)
		elseif isInvulnerable and smartDodge.IsIgnoreDodgeWhenInvulnerableEnabled() then
			pcall(function()
				playerStateLabel:UpdateName(("Player State: <font color='rgb(0,220,255)'>🛡️ INVULNERABLE (%s)</font>"):format(invulnReason or "Protection"))
				if inDanger and safePos then
					safeSpotLabel:UpdateName(("Safe Target: <font color='rgb(0,220,255)'>🛡️ Dodge Paused (%.1fm to Safe)</font>"):format(escapeDist or 0))
				else
					safeSpotLabel:UpdateName("Safe Target: <font color='rgb(160,160,160)'>None (Invulnerable)</font>")
				end
			end)
		elseif inDanger then
			pcall(function()
				playerStateLabel:UpdateName(("Player State: <font color='rgb(255,60,60)'>⚠️ IN DANGER (%s)</font>"):format(hazardName or "Hazard"))
				if safePos then
					safeSpotLabel:UpdateName(("Safe Target: <font color='rgb(0,255,120)'>🟢 (%.1f, %.1f, %.1f) - %.1fm</font>"):format(
						safePos.X, safePos.Y, safePos.Z, escapeDist or 0
					))
				else
					safeSpotLabel:UpdateName("Safe Target: <font color='rgb(255,160,0)'>⚠️ Calculating Safe Spot...</font>")
				end
			end)
		else
			pcall(function()
				playerStateLabel:UpdateName("Player State: <font color='rgb(0,255,0)'>🟢 SAFE</font>")
				safeSpotLabel:UpdateName("Safe Target: <font color='rgb(160,160,160)'>None (No Dodge Needed)</font>")
			end)
		end
	end

	local function updateDodgeStatusUI(status)
		local isDead = smartDodge.IsDead and smartDodge.IsDead() or false
		if isDead then
			pcall(function()
				dodgeActionLabel:UpdateName("Dodge Action: <font color='rgb(160, 160, 160)'>Dead</font>")
			end)
			return
		end

		status = status or smartDodge.GetDodgeStatus()
		local isInvuln = smartDodge.IsInvulnerable()
		if isInvuln and smartDodge.IsIgnoreDodgeWhenInvulnerableEnabled() and smartDodge.IsInDanger() then
			status = "🛡️ Paused (Invulnerable)"
		end

		local color = "160, 160, 160"
		if status == "Dodging" then
			color = "255, 200, 50"
		elseif status == "Returning" then
			color = "255, 140, 0"
		elseif status:find("Safe") then
			color = "0, 255, 120"
		elseif status:find("Invulnerable") then
			color = "0, 220, 255"
		end

		pcall(function()
			dodgeActionLabel:UpdateName("Dodge Action: <font color='rgb(" .. color .. ")'>" .. status .. "</font>")
		end)
	end

	-- Lắng nghe cập nhật tức thời từ core
	smartDodge.OnHazardChanged(function(count, lastInfo)
		updateMonitor(count, lastInfo)
	end)

	smartDodge.OnSafeSpotChanged(function(inDanger, safePos, hazardName, escapeDist, isInvulnerable, invulnReason, isDead)
		updateSafeSpotUI(inDanger, safePos, hazardName, escapeDist, isInvulnerable, invulnReason, isDead)
		updateDodgeStatusUI()
	end)

	smartDodge.OnDodgeStatusChanged(function(status)
		updateDodgeStatusUI(status)
	end)

	--// Left Section Controls
	leftSection:Toggle({
		Name = "Enable Threat & Safe Spot Engine",
		Default = smartDodge.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.Toggle(state)
			updateMonitor()
		end),
	}, "Toggle_SmartDodgeThreatDetection")

	leftSection:Toggle({
		Name = "Auto Dodge Execution",
		Default = smartDodge.IsAutoDodgeEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetAutoDodge(state)
		end),
	}, "Toggle_SmartDodgeAutoExecution")

	local DODGE_MODE_OPTIONS = { "MoveTo", "Blink" }
	leftSection:Dropdown({
		Name = "Dodge Movement Mode",
		Options = DODGE_MODE_OPTIONS,
		Default = smartDodge.GetDodgeMode() == "Blink" and 2 or 1,
		Required = true,
		Callback = autoSave.Wrap(function(mode)
			smartDodge.SetDodgeMode(mode)
		end),
	}, "Dropdown_SmartDodgeMode")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Blink Step Distance (studs)",
		Default = smartDodge.GetBlinkStep(),
		Minimum = 0.2,
		Maximum = 2.0,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			smartDodge.SetBlinkStep(value)
		end),
	}, "Slider_SmartDodgeBlinkStep"))

	leftSection:Toggle({
		Name = "Auto Face Target (Luôn nhìn về mục tiêu)",
		Default = smartDodge.IsAutoFaceTargetEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetAutoFaceTarget(state)
		end),
	}, "Toggle_SmartDodgeAutoFaceTarget")

	leftSection:Toggle({
		Name = "Pause Dodge When Invulnerable (Respawn)",
		Default = smartDodge.IsIgnoreDodgeWhenInvulnerableEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetIgnoreDodgeWhenInvulnerable(state)
		end),
	}, "Toggle_SmartDodgeIgnoreInvulnerable")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Respawn Protection Duration (seconds)",
		Default = smartDodge.GetRespawnProtectionDuration(),
		Minimum = 0,
		Maximum = 10,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			smartDodge.SetRespawnProtectionDuration(value)
		end),
	}, "Slider_SmartDodgeRespawnProtectionDuration"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Instant / Final Snap Distance (studs)",
		Default = smartDodge.GetMaxSnapDistance(),
		Minimum = 0.2,
		Maximum = 6.0,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			smartDodge.SetMaxSnapDistance(value)
		end),
	}, "Slider_SmartDodgeMaxStep"))

	leftSection:Toggle({
		Name = "Maintain Height When Snapping",
		Default = smartDodge.IsMaintainSnapHeightEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetMaintainSnapHeight(state)
		end),
	}, "Toggle_SmartDodgeMaintainHeight")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Player Hitbox Padding (studs)",
		Default = smartDodge.GetHitboxPadding(),
		Minimum = 0,
		Maximum = 5,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			smartDodge.SetHitboxPadding(value)
		end),
	}, "Slider_SmartDodgeHitboxPadding"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Trajectory Lookahead Length (studs)",
		Default = smartDodge.GetTrajectoryLookahead(),
		Minimum = 20,
		Maximum = 150,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			smartDodge.SetTrajectoryLookahead(value)
		end),
	}, "Slider_SmartDodgeTrajLookahead"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Trajectory Width Padding (studs)",
		Default = smartDodge.GetTrajectoryWidthPadding(),
		Minimum = 0.5,
		Maximum = 6.0,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			smartDodge.SetTrajectoryWidthPadding(value)
		end),
	}, "Slider_SmartDodgeTrajPadding"))

	leftSection:Toggle({
		Name = "Show Hitbox Padding Visual (Cyan Circle)",
		Default = smartDodge.IsShowHitboxVisualEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetShowHitboxVisual(state)
		end),
	}, "Toggle_SmartDodgeHitboxVisual")

	leftSection:Toggle({
		Name = "Player Threat Radar (24-Ray Sonar)",
		Default = smartDodge.IsShowPlayerRadarEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetShowPlayerRadar(state)
		end),
	}, "Toggle_SmartDodgePlayerRadar")

	leftSection:Toggle({
		Name = "Threat Visual ESP (SelectionBox)",
		Default = smartDodge.IsVisualEspEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetVisualEsp(state)
		end),
	}, "Toggle_SmartDodgeVisualEsp")

	leftSection:Toggle({
		Name = "Show Safe Spot Marker (Green ESP)",
		Default = smartDodge.IsShowSafeMarkerEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetShowSafeMarker(state)
		end),
	}, "Toggle_SmartDodgeShowSafeMarker")

	leftSection:Toggle({
		Name = "Log Hazards (Spawns / Despawns)",
		Default = smartDodge.IsLogHazardsEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetLogHazards(state)
		end),
	}, "Toggle_SmartDodgeLogHazards")

	leftSection:Toggle({
		Name = "Log In Danger & Safe Spot",
		Default = smartDodge.IsLogInDangerEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetLogInDanger(state)
		end),
	}, "Toggle_SmartDodgeLogInDanger")

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
	local curSpot, inDang, hName, eDist = smartDodge.GetCurrentSafeSpot()
	updateSafeSpotUI(inDang, curSpot, hName, eDist)
	updateDodgeStatusUI()
end
