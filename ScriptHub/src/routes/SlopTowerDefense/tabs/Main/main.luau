-- Tab Main: Hiển thị trạng thái môi trường, thống kê trận đấu thời gian thực,
-- Auto Summon (kèm Bảng đếm Pity trực quan), Match Automation và Player Dashboard.

local constants = require("@routes/SlopTowerDefense/core/game/constants")
local gameStats = require("@routes/SlopTowerDefense/core/game/gameStats")
local zoneGuard = require("@routes/SlopTowerDefense/core/game/zoneGuard")
local matchAutomation = require("@routes/SlopTowerDefense/core/game/matchAutomation")
local autoSummon = require("@routes/SlopTowerDefense/core/game/autoSummon")
local playerProfile = require("@routes/SlopTowerDefense/core/game/playerProfile")
local autoSave = require("@routes/SlopTowerDefense/core/system/autoSave")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")

return function(window, tab)
	--// ====================================================================
	--// CỘT TRÁI: Section 1 - Live Status & Display
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
	--// CỘT TRÁI: Section 2 - Auto Summon (Lobby) & Visual Pity Tracker
	--// ====================================================================
	local summonSection = tab:Section({ Side = "Left" })
	summonSection:Header({ Name = "Auto Summon" })

	summonSection:Toggle({
		Name = "Auto Summon",
		Default = autoSummon.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoSummon.SetEnabled(state)
		end),
	}, "Toggle_AutoSummon")

	local updateProfileUi: ((playerProfile.PlayerProfileData) -> ())? = nil

	summonSection:Dropdown({
		Name = "Select Banner",
		Options = autoSummon.Banners,
		Default = autoSummon.GetBanner(),
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			if selected and selected ~= "" then
				autoSummon.SetBanner(selected)
				pcall(function()
					if updateProfileUi then
						updateProfileUi(playerProfile.GetData())
					end
				end)
			end
		end),
	}, "Dropdown_SummonBanner")

	summonSection:Dropdown({
		Name = "Summon Amount",
		Options = autoSummon.Amounts,
		Default = autoSummon.GetAmount(),
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			if selected and selected ~= "" then
				autoSummon.SetAmount(selected)
			end
		end),
	}, "Dropdown_SummonAmount")

	summonSection:Slider({
		Name = "Summon Delay (s)",
		Minimum = 0.1,
		Maximum = 3,
		Default = autoSummon.GetDelay(),
		Precision = 1,
		DisplayMethod = "Value",
		Callback = autoSave.Wrap(function(val)
			autoSummon.SetDelay(val)
		end),
	}, "Slider_SummonDelay")

	-- Bảng đếm Pity trực quan
	local pityTitleLabel = summonSection:Label({
		Text = "<b>🎯 Pity Counter:</b> <font color='rgb(255,220,100)'>Basic</font>",
	})

	local pityGodlyLabel = summonSection:Label({
		Text = "🌟 <b>Godly:</b> <font color='rgb(255,200,80)'>--</font>",
	})

	local pityMythicalLabel = summonSection:Label({
		Text = "🔮 <b>Mythical:</b> <font color='rgb(200,100,255)'>--</font>",
	})

	local pitySecretLabel = summonSection:Label({
		Text = "❓ <b>Secret:</b> <font color='rgb(255,100,100)'>--</font>",
	})

	local pitySloppyLabel = summonSection:Label({
		Text = "👾 <b>Sloppy / Celestial:</b> <font color='rgb(100,220,255)'>-- / --</font>",
	})

	--// ====================================================================
	--// CỘT PHẢI: Section 1 - Match Automation
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
		Name = "Auto Skip",
		Default = matchAutomation.AutoSkipEnabled,
		Callback = autoSave.Wrap(function(state)
			matchAutomation.SetAutoSkip(state)
		end),
	}, "Toggle_AutoSkip")

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

	--// ====================================================================
	--// CỘT PHẢI: Section 2 - Player Dashboard
	--// ====================================================================
	local profileSection = tab:Section({ Side = "Right" })
	profileSection:Header({ Name = "Player Dashboard" })

	local gemsLabel = profileSection:Label({
		Text = "💎 <b>Gems:</b> <font color='rgb(100,220,255)'>--</font>",
	})

	local crystalsLabel = profileSection:Label({
		Text = "🔮 <b>Crystals:</b> <font color='rgb(220,100,255)'>--</font>",
	})

	local starsLabel = profileSection:Label({
		Text = "⭐ <b>Stars:</b> <font color='rgb(255,220,100)'>--</font>",
	})

	local otherCurrencyLabel = profileSection:Label({
		Text = "🪙 <b>Slopbux / Tokens:</b> <font color='rgb(200,200,200)'>-- / --</font>",
	})

	local winsLabel = profileSection:Label({
		Text = "🏆 <b>Total Wins:</b> <font color='rgb(85,255,120)'>--</font>",
	})

	local inventoryLabel = profileSection:Label({
		Text = "🎒 <b>Towers:</b> <font color='rgb(255,150,100)'>-- / 500</font>",
	})

	local playtimeLabel = profileSection:Label({
		Text = "⏱️ <b>Playtime:</b> <font color='rgb(180,180,180)'>--</font>",
	})

	profileSection:Button({
		Name = "Refresh Profile & Pity",
		Callback = function()
			local ok = playerProfile.Fetch(true)
			if ok then
				notifier.Notify("Dashboard", "Đã yêu cầu đồng bộ hồ sơ từ server!", 1.5)
			else
				notifier.Notify("Dashboard", "Đang tải dữ liệu hoặc gửi yêu cầu quá nhanh!", 1.5)
			end
		end,
	})

	--// ====================================================================
	--// HÀM ĐỒNG BỘ DỮ LIỆU PROFILE & PITY THỜI GIAN THỰC
	--// ====================================================================
	updateProfileUi = function(data: playerProfile.PlayerProfileData)
		if not data.Loaded then return end

		-- 1. Cập nhật Player Dashboard
		gemsLabel:UpdateName(string.format("💎 <b>Gems:</b> <font color='rgb(100,220,255)'>%s</font>", playerProfile.FormatNumber(data.Gems)))
		crystalsLabel:UpdateName(string.format("🔮 <b>Crystals:</b> <font color='rgb(220,100,255)'>%s</font>", playerProfile.FormatNumber(data.Crystals)))
		starsLabel:UpdateName(string.format("⭐ <b>Stars:</b> <font color='rgb(255,220,100)'>%s</font>", playerProfile.FormatNumber(data.Stars)))
		otherCurrencyLabel:UpdateName(string.format("🪙 <b>Slopbux / Tokens:</b> <font color='rgb(200,200,200)'>%s / %s</font>", playerProfile.FormatNumber(data.Slopbux), playerProfile.FormatNumber(data.Tokens)))
		winsLabel:UpdateName(string.format("🏆 <b>Total Wins:</b> <font color='rgb(85,255,120)'>%s</font>", playerProfile.FormatNumber(data.Wins)))
		inventoryLabel:UpdateName(string.format("🎒 <b>Towers:</b> <font color='rgb(255,150,100)'>%d / %d</font>", data.TowersCount, data.InventorySpace))
		playtimeLabel:UpdateName(string.format("⏱️ <b>Playtime:</b> <font color='rgb(180,180,180)'>%s</font>", data.TotalPlayTimeFormatted))

		-- 2. Cập nhật Bảng đếm Pity theo Banner đang chọn
		local currentBanner = autoSummon.GetBanner()
		local pity = (currentBanner == "Premium") and data.PityPremium or data.PityBasic
		local bannerColor = (currentBanner == "Premium") and "rgb(255,150,220)" or "rgb(255,220,100)"

		pityTitleLabel:UpdateName(string.format("<b>🎯 Pity Counter:</b> <font color='%s'>%s Banner</font>", bannerColor, currentBanner))
		pityGodlyLabel:UpdateName(string.format("🌟 <b>Godly:</b> <font color='rgb(255,200,80)'>%s</font>", playerProfile.FormatNumber(pity.Godly)))
		pityMythicalLabel:UpdateName(string.format("🔮 <b>Mythical:</b> <font color='rgb(200,100,255)'>%s</font>", playerProfile.FormatNumber(pity.Mythical)))
		pitySecretLabel:UpdateName(string.format("❓ <b>Secret:</b> <font color='rgb(255,100,100)'>%s</font>", playerProfile.FormatNumber(pity.Secret)))
		pitySloppyLabel:UpdateName(string.format("👾 <b>Sloppy / Celestial:</b> <font color='rgb(100,220,255)'>%s / %s</font>", playerProfile.FormatNumber(pity.Sloppy), playerProfile.FormatNumber(pity.Celestial)))
	end

	local unsubscribeProfile = playerProfile.Subscribe(updateProfileUi)
	lifecycle.Register(unsubscribeProfile)
end
