-- Tab Inventory (DungeonQuest): AutoSell section - sell items by filter.
-- Uses multichoice dropdowns for Rarity and Item Type; "Sell Now" sells once
-- after a confirmation dialog.

--// Imports
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local autoSell = require("@routes/DungeonQuest/core/autoSell")
local notifier = require("@routes/DungeonQuest/core/notifier")

return function(window, tab)
	local section = tab:Section({ Side = "Left" })
	section:Header({ Name = "AutoSell" })

	local RARITY_OPTIONS = { "Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic" }
	local TYPE_OPTIONS = { "Weapons", "Helmets", "Chests", "Abilities" }

	section:Dropdown({
		Name = "Rarity Filter",
		Options = RARITY_OPTIONS,
		Default = autoSell.GetRarityFilter(),
		Multi = true,
		Required = false,
		Callback = autoSave.Wrap(function(selected)
			local list = {}
			for rarity in pairs(selected) do table.insert(list, rarity) end
			autoSell.SetRarityFilter(list)
		end),
	}, "Dropdown_AutoSellRarity")

	section:Dropdown({
		Name = "Item Type Filter",
		Options = TYPE_OPTIONS,
		Default = autoSell.GetTypeFilter(),
		Multi = true,
		Required = false,
		Callback = autoSave.Wrap(function(selected)
			local list = {}
			for itemType in pairs(selected) do table.insert(list, itemType) end
			autoSell.SetTypeFilter(list)
		end),
	}, "Dropdown_AutoSellType")

	section:Input({
		Name = "Prefix Name (starts with)",
		Default = autoSell.GetPrefixName(),
		Placeholder = "e.g. Runic",
		AcceptedCharacters = "All",
		Callback = autoSave.Wrap(function(value)
			autoSell.SetPrefixName(value)
		end),
	}, "Input_AutoSellPrefix")

	section:Input({
		Name = "Max Level Req (≤)",
		Default = tostring(autoSell.GetLevelReqMax()),
		Placeholder = "e.g. 130",
		AcceptedCharacters = "Numeric",
		Callback = autoSave.Wrap(function(value)
			autoSell.SetLevelReqMax(tonumber(value) or 0)
		end),
	}, "Input_AutoSellLevelReq")

	section:Toggle({
		Name = "Exclude Equipped Items",
		Default = autoSell.GetExcludeEquipped(),
		Callback = autoSave.Wrap(function(state)
			autoSell.SetExcludeEquipped(state)
		end),
	}, "Toggle_AutoSellExcludeEquipped")

	local resultLabel = section:Label({
		Text = "No search made yet.",
	}, "Label_AutoSellResult")

	section:Button({
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

	section:Button({
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
end
