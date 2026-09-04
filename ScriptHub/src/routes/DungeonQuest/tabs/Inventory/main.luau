-- Tab Inventory (DungeonQuest): AutoSell section - sell items by filter.
-- Uses multichoice dropdowns for Rarity and Item Type; "Sell Now" sells once
-- after a confirmation dialog.

--// Imports
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local autoSell = require("@routes/DungeonQuest/core/autoSell")
local notifier = require("@routes/DungeonQuest/core/notifier")

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "AutoSell" })

	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Filter Summary" })

	--// Right Section Labels (Filter Summary)
	local summaryStatusLabel = rightSection:Label({ Text = "Status: --" })
	local summarySafetyLabel = rightSection:Label({ Text = "Safety: --" })
	local summaryTriggerLabel = rightSection:Label({ Text = "Trigger: <font color='rgb(200,200,255)'>On Dungeon Start</font>" })
	local summaryRarityLabel = rightSection:Label({ Text = "Rarities: --" })
	local summaryTypeLabel = rightSection:Label({ Text = "Item Types: --" })
	local summaryLevelLabel = rightSection:Label({ Text = "Level Req: --" })
	local summaryPrefixLabel = rightSection:Label({ Text = "Prefix: --" })
	local summaryEquippedLabel = rightSection:Label({ Text = "Exclude Equipped: --" })

	local function updateSummary()
		-- Status
		local isAuto = autoSell.IsEnabled()
		local statusColor = isAuto and "0, 255, 0" or "255, 80, 80"
		local statusText = isAuto and "Enabled" or "Disabled"
		pcall(function()
			summaryStatusLabel:UpdateName("Status: <font color='rgb(" .. statusColor .. ")'>" .. statusText .. "</font>")
		end)

		-- Safety Status
		local hasFilter = autoSell.HasAnyFilter()
		local safetyColor = hasFilter and "0, 255, 0" or "255, 80, 80"
		local safetyText = hasFilter and "✓ Active (Configured)" or "⚠ NO filter selected"
		pcall(function()
			summarySafetyLabel:UpdateName("Safety: <font color='rgb(" .. safetyColor .. ")'>" .. safetyText .. "</font>")
		end)

		-- Rarities
		local rarities = autoSell.GetRarityFilter()
		local rarityText = #rarities > 0 and table.concat(rarities, ", ") or "All (No filter)"
		local rarityColor = #rarities > 0 and "255, 220, 120" or "160, 160, 160"
		pcall(function()
			summaryRarityLabel:UpdateName("Rarities: <font color='rgb(" .. rarityColor .. ")'>" .. rarityText .. "</font>")
		end)

		-- Types
		local types = autoSell.GetTypeFilter()
		local typeText = #types > 0 and table.concat(types, ", ") or "All (No filter)"
		local typeColor = #types > 0 and "255, 220, 120" or "160, 160, 160"
		pcall(function()
			summaryTypeLabel:UpdateName("Item Types: <font color='rgb(" .. typeColor .. ")'>" .. typeText .. "</font>")
		end)

		-- Level Req
		local mode = autoSell.GetLevelReqMode()
		local exactLevels = autoSell.GetLevelReqExactFilter()
		table.sort(exactLevels, function(a, b) return (tonumber(a) or 0) < (tonumber(b) or 0) end)
		local levelText = "All (No filter)"
		local levelColor = "160, 160, 160"
		if #exactLevels > 0 then
			levelColor = "255, 220, 120"
			if mode == "Below" then
				levelText = "Below (≤ " .. exactLevels[#exactLevels] .. ")"
			elseif mode == "Above" then
				levelText = "Above (≥ " .. exactLevels[1] .. ")"
			else
				levelText = "Exact (" .. table.concat(exactLevels, ", ") .. ")"
			end
		end
		pcall(function()
			summaryLevelLabel:UpdateName("Level Req: <font color='rgb(" .. levelColor .. ")'>" .. levelText .. "</font>")
		end)

		-- Prefix
		local prefix = autoSell.GetPrefixName()
		local prefixText = (#prefix > 0) and ('"' .. prefix .. '"') or "None"
		local prefixColor = (#prefix > 0) and "255, 220, 120" or "160, 160, 160"
		pcall(function()
			summaryPrefixLabel:UpdateName("Prefix: <font color='rgb(" .. prefixColor .. ")'>" .. prefixText .. "</font>")
		end)

		-- Exclude Equipped
		local exclude = autoSell.GetExcludeEquipped()
		local excludeColor = exclude and "0, 255, 0" or "255, 80, 80"
		local excludeText = exclude and "Yes (Protected)" or "No (May Sell)"
		pcall(function()
			summaryEquippedLabel:UpdateName("Exclude Equipped: <font color='rgb(" .. excludeColor .. ")'>" .. excludeText .. "</font>")
		end)
	end

	--// Left Section Controls
	leftSection:Toggle({
		Name = "Auto Sell on Dungeon Start",
		Default = autoSell.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoSell.Toggle(state)
			updateSummary()
		end),
	}, "Toggle_AutoSellEnabled")

	local RARITY_OPTIONS = { "Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic" }
	local TYPE_OPTIONS = { "Weapons", "Helmets", "Chests", "Abilities" }

	leftSection:Dropdown({
		Name = "Rarity Filter",
		Options = RARITY_OPTIONS,
		Default = autoSell.GetRarityFilter(),
		Multi = true,
		Required = false,
		Callback = autoSave.Wrap(function(selected)
			local list = {}
			for rarity in pairs(selected) do table.insert(list, rarity) end
			autoSell.SetRarityFilter(list)
			updateSummary()
		end),
	}, "Dropdown_AutoSellRarity")

	leftSection:Dropdown({
		Name = "Item Type Filter",
		Options = TYPE_OPTIONS,
		Default = autoSell.GetTypeFilter(),
		Multi = true,
		Required = false,
		Callback = autoSave.Wrap(function(selected)
			local list = {}
			for itemType in pairs(selected) do table.insert(list, itemType) end
			autoSell.SetTypeFilter(list)
			updateSummary()
		end),
	}, "Dropdown_AutoSellType")

	local levelReqDropdown -- forward declaration để mode callback có thể truy cập

	local currentMode = autoSell.GetLevelReqMode()
	local currentModeIndex = table.find(autoSell.LEVEL_REQ_MODE_OPTIONS, currentMode) or 1
	leftSection:Dropdown({
		Name = "Level Req Mode",
		Options = autoSell.LEVEL_REQ_MODE_OPTIONS,
		Default = currentModeIndex,
		Multi = false,
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			autoSell.SetLevelReqMode(selected)
			if levelReqDropdown then
				local isMulti = (selected == "None")
				levelReqDropdown.Settings.Multi = isMulti
				levelReqDropdown.Settings.Required = not isMulti
				levelReqDropdown:UpdateSelection({})
			end
			updateSummary()
		end),
	}, "Dropdown_AutoSellLevelReqMode")

	levelReqDropdown = leftSection:Dropdown({
		Name = "Level Req Filter",
		Options = autoSell.LEVEL_REQ_OPTIONS,
		Default = autoSell.GetLevelReqExactFilter(),
		Multi = currentMode == "None",
		Required = currentMode ~= "None",
		Search = true,
		Callback = autoSave.Wrap(function(selected)
			local list = {}
			if type(selected) == "table" then
				for level in pairs(selected) do table.insert(list, level) end
			elseif type(selected) == "string" then
				table.insert(list, selected)
			end
			autoSell.SetLevelReqExactFilter(list)
			updateSummary()
		end),
	}, "Dropdown_AutoSellLevelReq")

	leftSection:Input({
		Name = "Prefix Name (starts with)",
		Default = autoSell.GetPrefixName(),
		Placeholder = "e.g. Runic",
		AcceptedCharacters = "All",
		Callback = autoSave.Wrap(function(value)
			autoSell.SetPrefixName(value)
			updateSummary()
		end),
	}, "Input_AutoSellPrefix")

	leftSection:Toggle({
		Name = "Exclude Equipped Items",
		Default = autoSell.GetExcludeEquipped(),
		Callback = autoSave.Wrap(function(state)
			autoSell.SetExcludeEquipped(state)
			updateSummary()
		end),
	}, "Toggle_AutoSellExcludeEquipped")

	local resultLabel = leftSection:Label({
		Text = "No search made yet.",
	}, "Label_AutoSellResult")

	leftSection:Button({
		Name = "Search",
		Callback = function()
			task.spawn(function()
				pcall(function() resultLabel:UpdateName("Reading inventory...") end)
				local result = autoSell.CountMatches()
				if not result then return end
				if result.error then
					pcall(function() resultLabel:UpdateName("<font color='rgb(255,80,80)'>Error: " .. result.error .. "</font>") end)
					return
				end
				local text = ("Found <font color='rgb(0,255,0)'>%d</font>/<font color='rgb(240,240,240)'>%d</font> matching items.\n")
					:format(result.matching, result.total)
				local first = true
				for _, cat in ipairs({ "Weapons", "Helmets", "Chests", "Abilities" }) do
					local n = result.byCategory and result.byCategory[cat]
					if n then
						if first then text ..= cat .. ": " .. n else text ..= " • " .. cat .. ": " .. n end
						first = false
					end
				end
				pcall(function() resultLabel:UpdateName(text) end)
			end)
		end,
	})

	leftSection:Button({
		Name = "Sell Now",
		Callback = function()
			task.spawn(function()
				pcall(function() resultLabel:UpdateName("Reading inventory...") end)

				local preview = autoSell.CountMatches()
				if not preview then
					pcall(function() resultLabel:UpdateName("<font color='rgb(255,80,80)'>A sale is already running.</font>") end)
					return
				end
				if preview.error then
					pcall(function() resultLabel:UpdateName("<font color='rgb(255,80,80)'>Error: " .. preview.error .. "</font>") end)
					return
				end

				local hasFilter = autoSell.HasAnyFilter()
				local warning = ""
				if not hasFilter then
					warning = '\n\n<font color="rgb(255,80,80)"><b>⚠ NO filter selected!</b> This will sell the ENTIRE inventory (except equipped items).</font>'
				end

				local desc = ("Sell <font color='rgb(0,255,0)'>%d</font>/<font color='rgb(240,240,240)'>%d</font> matching item(s) with current filters."):format(preview.matching, preview.total)
				desc = desc .. warning .. "\n\nAre you sure?"

				window:Dialog({
					Title = "Confirm Sale",
					Description = desc,
					Buttons = {
						{
							Name = "Confirm",
							Callback = function()
								task.spawn(function()
									pcall(function() resultLabel:UpdateName("Reading inventory...") end)
									notifier.Notify("AutoSell", "Selling...", 2)

									local result = autoSell.SellItems()
									if not result then
										pcall(function() resultLabel:UpdateName("<font color='rgb(255,80,80)'>A sale is already running.</font>") end)
										return
									end

									if result.error then
										pcall(function() resultLabel:UpdateName("<font color='rgb(255,80,80)'>Error: " .. result.error .. "</font>") end)
										return
									end

									local text = ("Done: <font color='rgb(0,255,0)'>%d</font> sold, <font color='rgb(255,200,0)'>%d</font> skipped, <font color='rgb(255,220,120)'>%s</font> gold earned.")
										:format(result.sold, result.skipped, tostring(result.gold))
									pcall(function() resultLabel:UpdateName(text) end)
								end)
							end,
						},
						{
							Name = "Cancel",
						},
					},
				})
			end)
		end,
	})

	-- Khởi tạo hiển thị summary lần đầu
	updateSummary()
end
