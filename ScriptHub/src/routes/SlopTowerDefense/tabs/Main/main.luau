-- Tab Main: Hiển thị trạng thái môi trường và thống kê trận đấu thời gian thực.
-- Cột phải: Match Automation (Auto Replay, Auto Speed + Dropdown)

local constants = require("@routes/SlopTowerDefense/core/game/constants")
local gameStats = require("@routes/SlopTowerDefense/core/game/gameStats")
local zoneGuard = require("@routes/SlopTowerDefense/core/game/zoneGuard")
local matchAutomation = require("@routes/SlopTowerDefense/core/game/matchAutomation")
local autoSave = require("@routes/SlopTowerDefense/core/system/autoSave")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")

return function(window, tab)
	--// ====================================================================
	--// CỘT TRÁI: Live Status & Display
	--// ====================================================================
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Status & Display" })

	leftSection:Label({
		Text = "<b>Location:</b> " .. constants.GetLocationName(),
	})

	local timeLabel = leftSection:Label({
		Text = "⏱️ <b>Timer:</b> <font color='rgb(255,220,100)'>00:00.00</font>",
	})

	local goldLabel = leftSection:Label({
		Text = "💰 <b>Cash:</b> <font color='rgb(85,255,120)'>$0</font>",
	})

	local healthLabel = leftSection:Label({
		Text = "❤️ <b>Base HP:</b> <font color='rgb(255,100,100)'>100/100</font>",
	})

	local waveLabel = leftSection:Label({
		Text = "🌊 <b>Wave:</b> <font color='rgb(100,200,255)'>0/0</font>",
	})

	local function updateUi(data: gameStats.GameStatsSnapshot)
		if not zoneGuard.IsInGame() then
			timeLabel:UpdateName("⏱️ <b>Timer:</b> <font color='rgb(150,150,150)'>In Lobby</font>")
			goldLabel:UpdateName("💰 <b>Cash:</b> <font color='rgb(150,150,150)'>In Lobby</font>")
			healthLabel:UpdateName("❤️ <b>Base HP:</b> <font color='rgb(150,150,150)'>In Lobby</font>")
			waveLabel:UpdateName("🌊 <b>Wave:</b> <font color='rgb(150,150,150)'>In Lobby</font>")
			return
		end

		local timeColor = data.IsMatchActive and "rgb(255,220,100)" or "rgb(150,220,255)"
		timeLabel:UpdateName(string.format("⏱️ <b>Timer:</b> <font color='%s'>%s</font>", timeColor, data.ElapsedTimeFormatted))
		goldLabel:UpdateName(string.format("💰 <b>Cash:</b> <font color='rgb(85,255,120)'>%s</font>", data.CashFormatted))
		healthLabel:UpdateName(string.format("❤️ <b>Base HP:</b> <font color='rgb(255,100,100)'>%s</font>", data.BaseHealthFormatted))
		waveLabel:UpdateName(string.format("🌊 <b>Wave:</b> <font color='rgb(100,200,255)'>Wave %s</font>", data.WaveFormatted))
	end

	local unsubscribe = gameStats.Subscribe(updateUi)
	lifecycle.Register(unsubscribe)

	--// ====================================================================
	--// CỘT PHẢI: Match Automation (Auto Replay, Auto Speed + Dropdown)
	--// ====================================================================
	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Match Automation" })

	rightSection:Toggle({
		Name = "Auto Replay",
		Default = matchAutomation.AutoReplayEnabled,
		Callback = autoSave.Wrap(function(state)
			matchAutomation.SetAutoReplay(state)
		end),
	}, "Toggle_AutoReplay")

	rightSection:Toggle({
		Name = "Auto Speed",
		Default = matchAutomation.AutoSpeedEnabled,
		Callback = autoSave.Wrap(function(state)
			matchAutomation.SetAutoSpeed(state)
		end),
	}, "Toggle_AutoSpeed")

	rightSection:Dropdown({
		Name = "Game Speed",
		Options = matchAutomation.Speeds,
		Default = matchAutomation.SelectedSpeed,
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			if not selected or selected == "" then return end
			matchAutomation.SetSpeed(selected)
		end),
	}, "Dropdown_GameSpeed")
end
