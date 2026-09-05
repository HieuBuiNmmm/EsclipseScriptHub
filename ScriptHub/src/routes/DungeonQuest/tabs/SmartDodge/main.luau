-- Tab SmartDodge (DungeonQuest): Quản lý tính năng né chiêu thông minh.
-- Giai đoạn 1: Threat Detector (Quét & Nhận diện hiểm họa Neon trong Workspace).

--// Imports
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local smartDodge = require("@routes/DungeonQuest/core/smartDodge")

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Threat Detector" })

	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Threat Monitor" })

	--// Right Section Labels
	local statusLabel = rightSection:Label({ Text = "Detector: <font color='rgb(255,80,80)'>Disabled</font>" })
	local activeCountLabel = rightSection:Label({ Text = "Active Hazards: <font color='rgb(160,160,160)'>0</font>" })
	local lastHazardLabel = rightSection:Label({ Text = "Last Detected: <font color='rgb(160,160,160)'>None</font>" })

	local function updateMonitor(count, lastInfo)
		count = count or smartDodge.GetHazardCount()
		lastInfo = lastInfo or smartDodge.GetLastHazardInfo()

		local isEnabled = smartDodge.IsEnabled()
		local statusColor = isEnabled and "0, 255, 0" or "255, 80, 80"
		local statusText = isEnabled and "Enabled (Scanning Neon)" or "Disabled"

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

	-- Lắng nghe cập nhật tức thời từ core
	smartDodge.OnHazardChanged(function(count, lastInfo)
		updateMonitor(count, lastInfo)
	end)

	--// Left Section Controls
	leftSection:Toggle({
		Name = "Enable Threat Detection",
		Default = smartDodge.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.Toggle(state)
			updateMonitor()
		end),
	}, "Toggle_SmartDodgeThreatDetection")

	leftSection:Toggle({
		Name = "Threat Visual ESP (SelectionBox)",
		Default = smartDodge.IsVisualEspEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetVisualEsp(state)
		end),
	}, "Toggle_SmartDodgeVisualEsp")

	leftSection:Toggle({
		Name = "Log Threats to Console",
		Default = smartDodge.IsLogThreatsEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetLogThreats(state)
		end),
	}, "Toggle_SmartDodgeLogThreats")

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
