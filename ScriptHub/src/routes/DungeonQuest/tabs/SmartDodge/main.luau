-- Tab SmartDodge (DungeonQuest): Quản lý tính năng né chiêu thông minh.
-- Giai đoạn 1, 2 & 3: Threat Detection, Safe Spot Calculation & Dodge Execution.

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

	local function updateSafeSpotUI(inDanger, safePos, hazardName, escapeDist)
		if inDanger and safePos then
			pcall(function()
				playerStateLabel:UpdateName(("Player State: <font color='rgb(255,60,60)'>⚠️ IN DANGER (%s)</font>"):format(hazardName or "Hazard"))
				safeSpotLabel:UpdateName(("Safe Target: <font color='rgb(0,255,120)'>🟢 (%.1f, %.1f, %.1f) - %.1fm</font>"):format(
					safePos.X, safePos.Y, safePos.Z, escapeDist or 0
				))
			end)
		else
			pcall(function()
				playerStateLabel:UpdateName("Player State: <font color='rgb(0,255,0)'>🟢 SAFE</font>")
				safeSpotLabel:UpdateName("Safe Target: <font color='rgb(160,160,160)'>None (No Dodge Needed)</font>")
			end)
		end
	end

	local function updateDodgeStatusUI(status)
		status = status or smartDodge.GetDodgeStatus()
		local color = "160, 160, 160"
		if status == "Dodging" then
			color = "255, 200, 50"
		elseif status == "Returning" then
			color = "80, 180, 255"
		elseif status:find("Safe") then
			color = "0, 255, 120"
		end

		pcall(function()
			dodgeActionLabel:UpdateName("Dodge Action: <font color='rgb(" .. color .. ")'>" .. status .. "</font>")
		end)
	end

	-- Lắng nghe cập nhật tức thời từ core
	smartDodge.OnHazardChanged(function(count, lastInfo)
		updateMonitor(count, lastInfo)
	end)

	smartDodge.OnSafeSpotChanged(function(inDanger, safePos, hazardName, escapeDist)
		updateSafeSpotUI(inDanger, safePos, hazardName, escapeDist)
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
		Name = "Auto Dodge Execution (Hybrid MoveTo + Teleport)",
		Default = smartDodge.IsAutoDodgeEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetAutoDodge(state)
		end),
	}, "Toggle_SmartDodgeAutoExecution")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Max Teleport Step (studs)",
		Default = smartDodge.GetMaxTeleportStep(),
		Minimum = 1,
		Maximum = 4,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			smartDodge.SetMaxTeleportStep(value)
		end),
	}, "Slider_SmartDodgeMaxStep"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Step Interval Delay (ms)",
		Default = smartDodge.GetMicroBlinkIntervalMs(),
		Minimum = 10,
		Maximum = 200,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(value)
			smartDodge.SetMicroBlinkInterval(value)
		end),
	}, "Slider_SmartDodgeStepInterval"))

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

	leftSection:Toggle({
		Name = "Show Hitbox Padding Visual (Cyan Circle)",
		Default = smartDodge.IsShowHitboxVisualEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetShowHitboxVisual(state)
		end),
	}, "Toggle_SmartDodgeHitboxVisual")

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
