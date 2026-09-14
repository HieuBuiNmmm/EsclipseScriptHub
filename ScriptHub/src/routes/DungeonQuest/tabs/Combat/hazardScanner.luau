-- Module Hazard Scanner trong tab Combat (DungeonQuest): quét đối tượng skill xuất hiện
-- trong Workspace sau sự kiện start dungeon và vẽ SelectionBox đơn giản cho từng đối tượng.
-- Không còn trajectory / whitelist / ngoại lệ / hitbox padding / tên 3D.

--// Imports
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local hazardScanner = require("@routes/DungeonQuest/core/hazardScanner")
local ui = require("@routes/DungeonQuest/core/ui")

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Hazard Scanner Controls" })

	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Real-time Hazard Monitor" })

	--// Right Section Labels
	local statusLabel = rightSection:Label({ Text = "Detector: <font color='rgb(255,80,80)'>Disabled</font>" })
	local activeCountLabel = rightSection:Label({ Text = "Active Hazards: <font color='rgb(160,160,160)'>0</font>" })
	local lastHazardLabel = rightSection:Label({ Text = "Last Detected: <font color='rgb(160,160,160)'>None</font>" })

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

	hazardScanner.OnHazardChanged(function(count, lastInfo)
		updateMonitor(count, lastInfo)
	end)

	--// Left Section Controls
	leftSection:Toggle({
		Name = "Enable Hazard Scanner",
		Default = hazardScanner.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.Toggle(state)
			updateMonitor()
		end),
	}, "Toggle_SmartDodgeThreatDetection")

	leftSection:Toggle({
		Name = "Show Danger Zones (Ground Visualizer)",
		Default = hazardScanner.IsVisualizerEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetVisualizerEnabled(state)
		end),
	}, "Toggle_HazardGroundVisualizer")

	leftSection:Toggle({
		Name = "Log Hazards (Spawns / Despawns)",
		Default = hazardScanner.IsLogHazardsEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetLogHazards(state)
		end),
	}, "Toggle_SmartDodgeLogHazards")

	leftSection:Toggle({
		Name = "Log Rejected (Không vẽ được)",
		Default = hazardScanner.IsLogFailedEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetLogFailed(state)
		end),
	}, "Toggle_SmartDodgeLogRejected")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Hitbox Padding",
		Suffix = " studs",
		Default = hazardScanner.GetHitboxPadding(),
		Minimum = 0,
		Maximum = 10,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			hazardScanner.SetHitboxPadding(val)
		end),
	}, "Slider_HazardScannerHitboxPadding"))

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