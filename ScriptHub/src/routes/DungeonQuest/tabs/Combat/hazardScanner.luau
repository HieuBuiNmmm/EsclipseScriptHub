-- Module Hazard Scanner trong tab Combat (DungeonQuest): quét hiểm họa & highlight vùng nguy hiểm.
-- Chỉ hiển thị vùng nguy hiểm của skill cực kỳ trực quan:
--   - SelectionBox ESP quanh phần threat (Neon ring, projectile, beam...)
--   - Hành lang quỹ đạo cảnh báo (trajectory corridor) của projectile
--   - Đếm ngược 3D thời gian tồn tại skill (Skill Lifetime Timers)
-- Không né chiêu tự động, không safe spot, không panic.

--// Imports
local ui = require("@routes/DungeonQuest/core/ui")
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local hazardScanner = require("@routes/DungeonQuest/core/hazardScanner")

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Hazard Scanner Controls" })

	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Real-time Hazard Monitor" })

	--// Right Section Labels
	local statusLabel = rightSection:Label({ Text = "Detector: <font color='rgb(255,80,80)'>Disabled</font>" })
	local activeCountLabel = rightSection:Label({ Text = "Active Hazards: <font color='rgb(160,160,160)'>0</font>" })
	local lastHazardLabel = rightSection:Label({ Text = "Last Detected: <font color='rgb(160,160,160)'>None</font>" })
	local whitelistLabel = rightSection:Label({ Text = "Projectile Whitelist: <font color='rgb(160,160,160)'>Lazy</font>" })

	local function updateWhitelistLabel()
		local size = pcall(hazardScanner.GetProjectileWhitelistSize) and hazardScanner.GetProjectileWhitelistSize() or 0
		local color = size > 0 and "0, 255, 0" or "255, 80, 80"
		local text = size > 0 and ("%d templates"):format(size) or "empty / not found"
		pcall(function()
			whitelistLabel:UpdateName("Projectile Whitelist: <font color='rgb(" .. color .. ")'>" .. text .. "</font>")
		end)
	end

	local function updateMonitor(count, lastInfo)
		count = count or hazardScanner.GetHazardCount()
		lastInfo = lastInfo or hazardScanner.GetLastHazardInfo()

		local isEnabled = hazardScanner.IsEnabled()
		local statusColor = isEnabled and "0, 255, 0" or "255, 80, 80"
		local statusText = isEnabled and "Active (Scanning & Highlighting)" or "Disabled"

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

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Hitbox Padding",
		Suffix = " std",
		Default = hazardScanner.GetHitboxPadding(),
		Minimum = 0,
		Maximum = 5,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			hazardScanner.SetHitboxPadding(value)
		end),
	}, "Slider_SmartDodgeHitboxPadding"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Trajectory Lookahead",
		Suffix = " std",
		Default = hazardScanner.GetTrajectoryLookahead(),
		Minimum = 20,
		Maximum = 150,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			hazardScanner.SetTrajectoryLookahead(value)
		end),
	}, "Slider_SmartDodgeTrajLookahead"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Trajectory Width",
		Suffix = " std",
		Default = hazardScanner.GetTrajectoryWidthPadding(),
		Minimum = 0.5,
		Maximum = 6.0,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			hazardScanner.SetTrajectoryWidthPadding(value)
		end),
	}, "Slider_SmartDodgeTrajPadding"))

	leftSection:Toggle({
		Name = "Threat Visual ESP (SelectionBox)",
		Default = hazardScanner.IsVisualEspEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetVisualEsp(state)
		end),
	}, "Toggle_SmartDodgeVisualEsp")

	leftSection:Toggle({
		Name = "Log Hazards (Spawns / Despawns)",
		Default = hazardScanner.IsLogHazardsEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetLogHazards(state)
		end),
	}, "Toggle_SmartDodgeLogHazards")

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
	updateWhitelistLabel()
end