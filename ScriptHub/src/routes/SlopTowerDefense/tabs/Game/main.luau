-- Tab Game: Auto Joiner, Auto Pick Map, Auto Difficult, Auto Slop Mutator

local elevatorJoiner = require("@routes/SlopTowerDefense/core/game/elevatorJoiner")
local matchSetup = require("@routes/SlopTowerDefense/core/game/matchSetup")
local slopMutator = require("@routes/SlopTowerDefense/core/game/slopMutator")
local autoSave = require("@routes/SlopTowerDefense/core/system/autoSave")

return function(window, tab)
	-- Section 1: Auto Joiner & In-Game Setup (Cột trái)
	local joinerSection = tab:Section({ Side = "Left" })
	joinerSection:Header({ Name = "Auto Joiner" })

	joinerSection:Toggle({
		Name = "Game Joiner",
		Default = elevatorJoiner.Enabled,
		Callback = autoSave.Wrap(function(state)
			elevatorJoiner.SetEnabled(state)
		end),
	}, "Toggle_GameJoiner")

	local universeDropdown
	local mapDropdown
	local isUpdatingInternally = false

	local function updateDropdownsForMode(mode: string)
		if isUpdatingInternally then return end
		isUpdatingInternally = true

		local newUniverses = matchSetup.GetUniversesForMode(mode)
		if universeDropdown then
			pcall(function()
				universeDropdown:ClearOptions()
				universeDropdown:InsertOptions(newUniverses)
				local targetUni = (mode == "Raid") and "Raid" or matchSetup.SelectedUniverse
				if not table.find(newUniverses, targetUni) then
					targetUni = newUniverses[1] or ""
				end
				matchSetup.SetUniverse(targetUni)
				universeDropdown:UpdateSelection(targetUni)
			end)
		end

		if mapDropdown then
			pcall(function()
				local currentUni = matchSetup.SelectedUniverse
				local newMaps = matchSetup.GetMapsForUniverse(currentUni)
				mapDropdown:ClearOptions()
				mapDropdown:InsertOptions(newMaps)
				local targetMap = (mode == "Raid") and "Raid" or matchSetup.SelectedMap
				if not table.find(newMaps, targetMap) then
					targetMap = newMaps[1] or ""
				end
				matchSetup.SetMap(targetMap)
				mapDropdown:UpdateSelection(targetMap)
			end)
		end

		isUpdatingInternally = false
	end

	joinerSection:Dropdown({
		Name = "Game Mode",
		Options = { "Normal", "Raid" },
		Default = elevatorJoiner.Mode,
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			if not selected or selected == "" then return end
			elevatorJoiner.SetMode(selected)
			updateDropdownsForMode(selected)
		end),
	}, "Dropdown_GameMode")

	joinerSection:Slider({
		Name = "Start Delay (s)",
		Default = elevatorJoiner.GetStartDelay(),
		Minimum = 0,
		Maximum = 10,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(value)
			elevatorJoiner.SetStartDelay(value)
		end),
	}, "Slider_ElevatorStartDelay")

	-- Match Setup: Universes -> Maps -> Difficulty
	joinerSection:Header({ Name = "Match Setup" })

	-- Auto Pick Map
	joinerSection:Toggle({
		Name = "Auto Pick Map",
		Default = matchSetup.AutoPickMapEnabled,
		Callback = autoSave.Wrap(function(state)
			matchSetup.SetAutoPickMap(state)
		end),
	}, "Toggle_AutoPickMap")

	local currentMode = elevatorJoiner.Mode or "Normal"
	local initialUniverses = matchSetup.GetUniversesForMode(currentMode)
	local initialUniverse = (currentMode == "Raid") and "Raid" or matchSetup.SelectedUniverse
	if not table.find(initialUniverses, initialUniverse) then
		initialUniverse = initialUniverses[1] or "Brainrot Bases"
	end
	matchSetup.SetUniverse(initialUniverse)

	universeDropdown = joinerSection:Dropdown({
		Name = "Select Universe",
		Options = initialUniverses,
		Default = initialUniverse,
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			if isUpdatingInternally then return end
			if not selected or #selected == 0 then return end
			matchSetup.SetUniverse(selected)
			if mapDropdown then
				local newMaps = matchSetup.GetMapsForUniverse(selected)
				isUpdatingInternally = true
				pcall(function()
					mapDropdown:ClearOptions()
					mapDropdown:InsertOptions(newMaps)
					local targetMap = matchSetup.SelectedMap
					if not table.find(newMaps, targetMap) then
						targetMap = newMaps[1] or ""
					end
					matchSetup.SetMap(targetMap)
					mapDropdown:UpdateSelection(targetMap)
				end)
				isUpdatingInternally = false
			end
		end),
	}, "Dropdown_SelectUniverse")

	local initialMaps = matchSetup.GetMapsForUniverse(initialUniverse)
	local initialMap = (currentMode == "Raid") and "Raid" or matchSetup.SelectedMap
	if not table.find(initialMaps, initialMap) then
		initialMap = initialMaps[1] or "Night Base"
	end
	matchSetup.SetMap(initialMap)

	mapDropdown = joinerSection:Dropdown({
		Name = "Select Map",
		Options = initialMaps,
		Default = initialMap,
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			if isUpdatingInternally then return end
			if not selected or #selected == 0 then return end
			-- Khắc phục trường hợp config cũ lưu tên Universe vào Dropdown_SelectMap (ví dụ "Backrooms")
			if table.find(matchSetup.NormalUniverses, selected) then
				matchSetup.SetUniverse(selected)
				local newMaps = matchSetup.GetMapsForUniverse(selected)
				if mapDropdown then
					isUpdatingInternally = true
					pcall(function()
						mapDropdown:ClearOptions()
						mapDropdown:InsertOptions(newMaps)
						local defaultMap = newMaps[1] or ""
						matchSetup.SetMap(defaultMap)
						mapDropdown:UpdateSelection(defaultMap)
					end)
					isUpdatingInternally = false
				end
				return
			end
			matchSetup.SetMap(selected)
		end),
	}, "Dropdown_SelectMap")

	-- Vá Dropdown UpdateSelection để không bị miss khi nạp autoload config
	if universeDropdown and type(universeDropdown.UpdateSelection) == "function" then
		local origUniUpdate = universeDropdown.UpdateSelection
		universeDropdown.UpdateSelection = function(self, newSelection)
			if type(newSelection) == "string" and newSelection ~= "" and not self:IsOption(newSelection) then
				pcall(function()
					self:InsertOptions({ newSelection })
				end)
			end
			origUniUpdate(self, newSelection)
		end
	end

	if mapDropdown and type(mapDropdown.UpdateSelection) == "function" then
		local origUpdate = mapDropdown.UpdateSelection
		mapDropdown.UpdateSelection = function(self, newSelection)
			if type(newSelection) == "string" and newSelection ~= "" and not self:IsOption(newSelection) then
				pcall(function()
					self:InsertOptions({ newSelection })
				end)
			end
			origUpdate(self, newSelection)
		end
	end

	-- Auto Difficult (ComplicationVoting)
	joinerSection:Toggle({
		Name = "Auto Select Difficulty",
		Default = matchSetup.AutoDifficultyEnabled,
		Callback = autoSave.Wrap(function(state)
			matchSetup.SetAutoDifficulty(state)
		end),
	}, "Toggle_AutoDifficulty")

	joinerSection:Dropdown({
		Name = "Difficulty",
		Options = matchSetup.Difficulties,
		Default = matchSetup.SelectedDifficulty,
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			if selected and #selected > 0 then
				matchSetup.SetDifficulty(selected)
			end
		end),
	}, "Dropdown_Difficulty")

	joinerSection:Slider({
		Name = "Vote Delay (s)",
		Default = matchSetup.GetVoteDelay(),
		Minimum = 0,
		Maximum = 10,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(value)
			matchSetup.SetVoteDelay(value)
		end),
	}, "Slider_VoteDelay")

	-- Section 2: Auto Slop Mutator (Cột phải)
	local mutatorSection = tab:Section({ Side = "Right" })
	mutatorSection:Header({ Name = "Auto Slop Mutator" })

	mutatorSection:Toggle({
		Name = "Auto Slop Mutator",
		Default = slopMutator.Enabled,
		Callback = autoSave.Wrap(function(state)
			slopMutator.SetEnabled(state)
		end),
	}, "Toggle_AutoSlopMutator")

	mutatorSection:Slider({
		Name = "Vote Delay (s)",
		Default = slopMutator.GetVoteDelay(),
		Minimum = 0,
		Maximum = 5,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(value)
			slopMutator.SetVoteDelay(value)
		end),
	}, "Slider_MutatorVoteDelay")

	mutatorSection:Header({ Name = "Mutator Priority (100 = Highest)" })

	for _, item in ipairs(slopMutator.Catalog) do
		mutatorSection:Slider({
			Name = item.Name,
			Default = item.DefaultPriority,
			Minimum = 0,
			Maximum = 100,
			DisplayMethod = "Round",
			Precision = 0,
			Callback = autoSave.Wrap(function(value)
				slopMutator.SetPriority(item.Id, value)
			end),
		}, "Slider_Mutator_" .. item.Id)
	end
end
