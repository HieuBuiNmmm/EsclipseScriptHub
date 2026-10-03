-- Tab Main: Hiển thị trạng thái môi trường, thống kê trận đấu thời gian thực,
-- Auto Summon (kèm Bảng đếm Pity trực quan), Match Automation và Player Dashboard.

local constants = require("@routes/SlopTowerDefense/core/game/constants")
local gameStats = require("@routes/SlopTowerDefense/core/game/gameStats")
local zoneGuard = require("@routes/SlopTowerDefense/core/game/zoneGuard")
local matchAutomation = require("@routes/SlopTowerDefense/core/game/matchAutomation")
local raidManager = require("@routes/SlopTowerDefense/core/game/raidManager")
local autoSummon = require("@routes/SlopTowerDefense/core/game/autoSummon")
local autoContracts = require("@routes/SlopTowerDefense/core/game/autoContracts")
local autoQuests = require("@routes/SlopTowerDefense/core/game/autoQuests")
local autoGifts = require("@routes/SlopTowerDefense/core/game/autoGifts")
local autoCrate = require("@routes/SlopTowerDefense/core/game/autoCrate")
local playerProfile = require("@routes/SlopTowerDefense/core/game/playerProfile")
local autoSave = require("@routes/SlopTowerDefense/core/system/autoSave")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")

return function(window, tab)
	--// ====================================================================
	--// CỘT TRÁI: Section 1 - Session Info
	--// ====================================================================
	local sessionSection = tab:Section({ Side = "Left" })
	sessionSection:Header({ Name = "Session Info" })

	local locationLabel = sessionSection:Label({
		Text = string.format("📍 <b>Location:</b> <font color='rgb(200,200,255)'>%s</font>", constants.GetLocationName()),
	})

	local mapLabel = sessionSection:Label({
		Text = "🗺️ <b>Map:</b> <font color='rgb(150,150,150)'>In Lobby</font>",
	})

	local waveLabel = sessionSection:Label({
		Text = "🌊 <b>Wave:</b> <font color='rgb(150,150,150)'>In Lobby</font>",
	})

	local function updateUi(data: gameStats.GameStatsSnapshot)
		if not zoneGuard.IsInGame() then
			waveLabel:UpdateName("🌊 <b>Wave:</b> <font color='rgb(150,150,150)'>In Lobby</font>")
			return
		end

		waveLabel:UpdateName(string.format("🌊 <b>Wave:</b> <font color='rgb(100,200,255)'>Wave %s</font>", data.WaveFormatted))
	end

	local unsubscribe = gameStats.Subscribe(updateUi)
	lifecycle.Register(unsubscribe)

	local function updateRaidUi(data: raidManager.RaidSnapshot)
		if not zoneGuard.IsInGame() then
			mapLabel:UpdateName("🗺️ <b>Map:</b> <font color='rgb(150,150,150)'>In Lobby</font>")
			return
		end

		local curMap = data.CurrentMap or raidManager.GetCurrentMap()
		local mapColor = curMap and "rgb(255,180,80)" or "rgb(150,150,150)"
		mapLabel:UpdateName(string.format("🗺️ <b>Map:</b> <font color='%s'>%s</font>", mapColor, tostring(curMap or "Standard")))
	end

	local unsubRaid = raidManager.Subscribe(updateRaidUi)
	lifecycle.Register(unsubRaid)

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
	--// CỘT TRÁI: Section 3 - Auto Open Crates (Lobby)
	--// ====================================================================
	local crateSection = tab:Section({ Side = "Left" })
	crateSection:Header({ Name = "Auto Open Crates" })

	crateSection:Toggle({
		Name = "Auto Open Crates",
		Default = autoCrate.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoCrate.SetEnabled(state)
		end),
	}, "Toggle_AutoOpenCrates")

	local crateDropdown = crateSection:Dropdown({
		Name = "Select Crate",
		Options = autoCrate.GetCrateOptions(),
		Default = autoCrate.GetSelectedCrate(),
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			if selected and selected ~= "" then
				autoCrate.SetSelectedCrate(selected)
			end
		end),
	}, "Dropdown_SelectCrate")

	crateSection:Dropdown({
		Name = "Open Amount",
		Options = autoCrate.Amounts,
		Default = autoCrate.GetAmount(),
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			if selected and selected ~= "" then
				autoCrate.SetAmount(selected)
			end
		end),
	}, "Dropdown_CrateAmount")

	crateSection:Slider({
		Name = "Open Delay (s)",
		Minimum = 0.2,
		Maximum = 3,
		Default = autoCrate.GetDelay(),
		Precision = 1,
		DisplayMethod = "Value",
		Callback = autoSave.Wrap(function(val)
			autoCrate.SetDelay(val)
		end),
	}, "Slider_CrateDelay")

	local crateStatusLabel = crateSection:Label({
		Text = "📦 <b>Remaining:</b> <font color='rgb(150,150,150)'>--</font>",
	})

	local lastCrateOptions = table.concat(autoCrate.GetCrateOptions(), ",")
	local function updateCrateUi(snapshot: autoCrate.CrateSnapshot)
		local count = snapshot.RemainingCount
		local countColor = (count > 0) and "rgb(100,255,100)" or "rgb(255,100,100)"
		crateStatusLabel:UpdateName(string.format("📦 <b>Remaining:</b> <font color='%s'>%d</font> %s (Opened: %d)",
			countColor, count, snapshot.SelectedCrate, snapshot.OpenedCountSession))

		local currentOptionsStr = table.concat(snapshot.CrateList, ",")
		if currentOptionsStr ~= lastCrateOptions then
			lastCrateOptions = currentOptionsStr
			pcall(function()
				crateDropdown:ClearOptions()
				crateDropdown:InsertOptions(snapshot.CrateList)
				if table.find(snapshot.CrateList, snapshot.SelectedCrate) then
					crateDropdown:UpdateSelection(snapshot.SelectedCrate)
				end
			end)
		end
	end

	local unsubCrate = autoCrate.Subscribe(updateCrateUi)
	lifecycle.Register(unsubCrate)

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

	rightSection:Toggle({
		Name = "Auto Ready (Raid)",
		Default = matchAutomation.AutoReadyEnabled,
		Callback = autoSave.Wrap(function(state)
			matchAutomation.SetAutoReady(state)
		end),
	}, "Toggle_AutoReadyRaid")

	rightSection:Slider({
		Name = "Ready Delay (s)",
		Minimum = 0,
		Maximum = 10,
		Default = matchAutomation.GetAutoReadyDelay(),
		Precision = 1,
		DisplayMethod = "Value",
		Callback = autoSave.Wrap(function(val)
			matchAutomation.SetAutoReadyDelay(val)
		end),
	}, "Slider_AutoReadyDelay")

	--// ====================================================================
	--// CỘT PHẢI: Section 2 - Auto Claim Rewards (Contracts)
	--// ====================================================================
	local rewardsSection = tab:Section({ Side = "Right" })
	rewardsSection:Header({ Name = "Auto Claim Rewards" })

	rewardsSection:Toggle({
		Name = "Auto Claim Contracts",
		Default = autoContracts.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoContracts.SetEnabled(state)
		end),
	}, "Toggle_AutoContracts")

	rewardsSection:Slider({
		Name = "Check Interval (s)",
		Minimum = 5,
		Maximum = 60,
		Default = autoContracts.GetInterval(),
		Precision = 0,
		DisplayMethod = "Round",
		Callback = autoSave.Wrap(function(val)
			autoContracts.SetInterval(val)
		end),
	}, "Slider_ContractsInterval")

	rewardsSection:Button({
		Name = "Claim Completed Contracts",
		Callback = function()
			if not zoneGuard.IsLobby() then
				notifier.Notify("Contracts", "You can only claim contracts in Lobby!", 2.5)
				return
			end
			local claimed, eligible = autoContracts.CheckAndClaim()
			if claimed > 0 then
				notifier.Notify("Contracts", string.format("Claimed %d completed contract(s)!", claimed), 2.5)
			elseif eligible > 0 then
				notifier.Notify("Contracts", "Could not claim completed contract(s).", 2.5)
			else
				notifier.Notify("Contracts", "No completed contracts to claim.", 2.5)
			end
		end,
	})

	rewardsSection:Header({ Name = "Active Contracts" })

	local contract1Label = rewardsSection:Label({
		Text = "1. <font color='rgb(150,150,150)'>Loading...</font>",
	})

	local contract2Label = rewardsSection:Label({
		Text = "2. <font color='rgb(150,150,150)'>Loading...</font>",
	})

	local contract3Label = rewardsSection:Label({
		Text = "3. <font color='rgb(150,150,150)'>Loading...</font>",
	})

	local function formatContractLine(index: number, item: autoContracts.ContractItem?): string
		if not item then
			return string.format("%d. <font color='rgb(150,150,150)'>None</font>", index)
		end

		if item.Claimed then
			return string.format("%d. ✅ <font color='rgb(120,220,120)'>[%s] %s</font> <font color='rgb(160,160,160)'>(Claimed)</font>",
				index, item.Kind, item.Tower)
		elseif item.IsCompleted then
			return string.format("%d. 🎁 <font color='rgb(255,220,100)'><b>[%s] %s</b></font> <font color='rgb(100,255,100)'>(Ready: %d/%d)</font>",
				index, item.Kind, item.Tower, item.Progress, item.Need)
		else
			return string.format("%d. ⏳ <font color='rgb(220,220,220)'>[%s] %s</font> <font color='rgb(180,180,255)'>(%d/%d)</font>",
				index, item.Kind, item.Tower, item.Progress, item.Need)
		end
	end

	local function updateContractsUi(snapshot: autoContracts.ContractsSnapshot)
		local c1 = snapshot.List[1]
		local c2 = snapshot.List[2]
		local c3 = snapshot.List[3]

		contract1Label:UpdateName(formatContractLine(1, c1))
		contract2Label:UpdateName(formatContractLine(2, c2))
		contract3Label:UpdateName(formatContractLine(3, c3))
	end

	local unsubContracts = autoContracts.Subscribe(updateContractsUi)
	lifecycle.Register(unsubContracts)

	rewardsSection:Header({ Name = "Quests (Daily / Weekly)" })

	rewardsSection:Toggle({
		Name = "Auto Claim Quests",
		Default = autoQuests.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoQuests.SetEnabled(state)
		end),
	}, "Toggle_AutoQuests")

	rewardsSection:Button({
		Name = "Claim Completed Quests",
		Callback = function()
			if not zoneGuard.IsLobby() then
				notifier.Notify("Quests", "You can only claim quests in Lobby!", 2.5)
				return
			end
			local claimed, eligible = autoQuests.CheckAndClaim()
			if claimed > 0 then
				notifier.Notify("Quests", string.format("Claimed %d completed quest(s)!", claimed), 2.5)
			elseif eligible > 0 then
				notifier.Notify("Quests", "Could not claim completed quest(s).", 2.5)
			else
				notifier.Notify("Quests", "No completed quests to claim.", 2.5)
			end
		end,
	})

	local dailyQuestLabel = rewardsSection:Label({
		Text = "📅 <b>Daily:</b> <font color='rgb(150,150,150)'>0/4</font>",
	})

	local weeklyQuestLabel = rewardsSection:Label({
		Text = "📆 <b>Weekly:</b> <font color='rgb(150,150,150)'>0/4</font>",
	})

	local function updateQuestsUi(snapshot: autoQuests.QuestsSnapshot)
		local dailyColor = (snapshot.DailyClaimed >= snapshot.DailyTotal) and "rgb(120,255,140)" or "rgb(255,220,100)"
		local dailyBonusText = snapshot.DailyBonusClaimed and " <font color='rgb(255,215,0)'>(Bonus Claimed)</font>" or ""
		dailyQuestLabel:UpdateName(string.format("📅 <b>Daily:</b> <font color='%s'>%d/%d Claimed</font>%s",
			dailyColor, snapshot.DailyClaimed, snapshot.DailyTotal, dailyBonusText))

		local weeklyColor = (snapshot.WeeklyClaimed >= snapshot.WeeklyTotal) and "rgb(120,255,140)" or "rgb(255,220,100)"
		local weeklyBonusText = snapshot.WeeklyBonusClaimed and " <font color='rgb(255,215,0)'>(Bonus Claimed)</font>" or ""
		weeklyQuestLabel:UpdateName(string.format("📆 <b>Weekly:</b> <font color='%s'>%d/%d Claimed</font>%s",
			weeklyColor, snapshot.WeeklyClaimed, snapshot.WeeklyTotal, weeklyBonusText))
	end

	local unsubQuests = autoQuests.Subscribe(updateQuestsUi)
	lifecycle.Register(unsubQuests)

	rewardsSection:Header({ Name = "Playtime Gifts (9 Boxes)" })

	rewardsSection:Toggle({
		Name = "Auto Claim Gifts",
		Default = autoGifts.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoGifts.SetEnabled(state)
		end),
	}, "Toggle_AutoGifts")

	rewardsSection:Button({
		Name = "Claim Available Gifts",
		Callback = function()
			if not zoneGuard.IsLobby() then
				notifier.Notify("Playtime Gifts", "You can only claim gifts in Lobby!", 2.5)
				return
			end
			local claimed, eligible = autoGifts.CheckAndClaim()
			if claimed > 0 then
				notifier.Notify("Playtime Gifts", string.format("Claimed %d gift(s)!", claimed), 2.5)
			elseif eligible > 0 then
				notifier.Notify("Playtime Gifts", "Could not claim eligible gift(s).", 2.5)
			else
				notifier.Notify("Playtime Gifts", "No gifts ready to claim yet.", 2.5)
			end
		end,
	})

	local playtimeLabel = rewardsSection:Label({
		Text = "⏳ <b>Playtime:</b> <font color='rgb(150,150,150)'>00:00</font>",
	})

	local giftsProgressLabel = rewardsSection:Label({
		Text = "🎁 <b>Progress:</b> <font color='rgb(150,150,150)'>0/9 Claimed</font>",
	})

	local function updateGiftsUi(snapshot: autoGifts.GiftsSnapshot)
		local nextText
		if snapshot.ClaimedCount >= snapshot.TotalGifts then
			nextText = "<font color='rgb(120,255,140)'>All Claimed!</font>"
		elseif snapshot.ReadyCount > 0 then
			nextText = string.format("<font color='rgb(100,255,100)'>%d Ready to claim!</font>", snapshot.ReadyCount)
		elseif snapshot.NextGiftNumber and snapshot.NextGiftFormatted then
			nextText = string.format("<font color='rgb(255,220,100)'>Next: Box #%d in %s</font>", snapshot.NextGiftNumber, snapshot.NextGiftFormatted)
		else
			nextText = "<font color='rgb(150,150,150)'>Waiting...</font>"
		end

		playtimeLabel:UpdateName(string.format("⏳ <b>Playtime:</b> <font color='rgb(200,200,255)'>%s</font> (%s)",
			snapshot.FormattedPlaytime, nextText))

		local progressColor = (snapshot.ClaimedCount >= snapshot.TotalGifts) and "rgb(120,255,140)" or "rgb(255,220,100)"
		giftsProgressLabel:UpdateName(string.format("🎁 <b>Progress:</b> <font color='%s'>%d/%d Claimed</font>",
			progressColor, snapshot.ClaimedCount, snapshot.TotalGifts))
	end

	local unsubGifts = autoGifts.Subscribe(updateGiftsUi)
	lifecycle.Register(unsubGifts)

	summonSection:Button({
		Name = "Refresh Pity",
		Callback = function()
			local ok = playerProfile.Fetch(true)
			if ok then
				notifier.Notify("Pity", "Requested profile sync from server!", 1.5)
			else
				notifier.Notify("Pity", "Loading data or requesting too fast!", 1.5)
			end
		end,
	})

	--// ====================================================================
	--// Real-time Pity Counter sync
	--// ====================================================================
	updateProfileUi = function(data: playerProfile.PlayerProfileData)
		if not data.Loaded then return end

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
