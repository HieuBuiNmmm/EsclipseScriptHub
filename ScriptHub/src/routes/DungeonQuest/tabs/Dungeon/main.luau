-- Tab Dungeon (DungeonQuest): Auto Join Dungeon scalable.
-- Difficulty dropdown tự update options theo map đang chọn (lấy từ dungeonCatalog).

--// Imports
local ui = require("@routes/DungeonQuest/core/ui")
local autoJoin = require("@routes/DungeonQuest/core/autoJoin")
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local dungeonCatalog = require("@routes/DungeonQuest/core/dungeonCatalog")

return function(window, tab)
	local section = tab:Section({ Side = "Left" })
	section:Header({ Name = "Auto Join Dungeon" })

	section:Toggle({
		Name = "Auto Join Dungeon",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			autoJoin.Toggle(state)
		end),
	}, "Toggle_AutoJoin")

	local dungeonDropdown = section:Dropdown({
		Name = "Dungeon",
		Options = dungeonCatalog.GetDungeons(),
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			autoJoin.SetDungeon(option)
		end),
	}, "Dropdown_Dungeon")

	section:Button({
		Name = "Refresh Map List",
		Callback = function()
			task.spawn(function()
				local newList = dungeonCatalog.RefreshDungeons()
				if not newList or #newList == 0 then return end
				pcall(function()
					dungeonDropdown:ClearOptions()
					dungeonDropdown:InsertOptions(newList)
				end)
				local current = autoJoin.GetSelectedDungeon()
				if not table.find(newList, current) then
					autoJoin.SetDungeon(newList[1])
				end
				pcall(function()
					dungeonDropdown:UpdateSelection(autoJoin.GetSelectedDungeon())
				end)
			end)
		end,
	})

	local levelReqLabel = section:Label({
		Text = "Recommended Level: ...",
	}, "Label_RecommendedLevel")

	local function updateLevelLabel()
		pcall(function()
			local levelReq = dungeonCatalog.GetLevelReq(
				autoJoin.GetSelectedDungeon(),
				autoJoin.GetSelectedDifficulty()
			)
			levelReqLabel:UpdateName("Recommended Level: " .. tostring(levelReq))
		end)
	end
	updateLevelLabel()

	local difficultyDropdown = section:Dropdown({
		Name = "Difficulty",
		Options = autoJoin.GetAllowedDifficulties(),
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			autoJoin.SetDifficulty(option)
			updateLevelLabel()
		end),
	}, "Dropdown_Difficulty")

	section:Toggle({
		Name = "Hardcore",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			autoJoin.SetHardcore(state)
		end),
	}, "Toggle_HardcoreAJ")

	section:Toggle({
		Name = "Private Room",
		Default = true,
		Callback = autoSave.Wrap(function(state)
			autoJoin.SetPrivate(state)
		end),
	}, "Toggle_PrivateAJ")

	section:Toggle({
		Name = "Wave Defence",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			autoJoin.SetWaveDefence(state)
		end),
	}, "Toggle_WaveDefenceAJ")

	ui.PatchSliderLoadCallback(section:Slider({
		Name = "Delay",
		Default = 3,
		Minimum = 0,
		Maximum = 15,
		DisplayMethod = "Round",
		Precision = 1,
		Suffix = "s",
		Callback = autoSave.Wrap(function(Value)
			autoJoin.SetDelay(Value)
		end),
	}, "Slider_JoinDelay"))

	section:Button({
		Name = "Join Now",
		Callback = function()
			autoJoin.JoinNow()
		end,
	})

	-- Đồng bộ difficulty dropdown khi đổi map (cũng chạy khi config load).
	autoJoin.OnDungeonChanged(function(dungeon, allowed)
		pcall(function()
			difficultyDropdown:ClearOptions()
			difficultyDropdown:InsertOptions(allowed)
			difficultyDropdown:UpdateSelection(autoJoin.GetSelectedDifficulty())
		end)
		updateLevelLabel()
	end)
end