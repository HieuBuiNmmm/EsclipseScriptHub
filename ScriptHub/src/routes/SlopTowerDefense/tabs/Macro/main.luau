-- Tab Macro: Live Game Stats, Macro Recorder & Macro Player (Playback)
local gameStats = require("@routes/SlopTowerDefense/core/game/gameStats")
local zoneGuard = require("@routes/SlopTowerDefense/core/game/zoneGuard")
local raidManager = require("@routes/SlopTowerDefense/core/game/raidManager")
local storage = require("@routes/SlopTowerDefense/core/macro/storage")
local recorder = require("@routes/SlopTowerDefense/core/macro/recorder")
local player = require("@routes/SlopTowerDefense/core/macro/player")
local mapMacroManager = require("@routes/SlopTowerDefense/core/macro/mapMacroManager")
local autoSave = require("@routes/SlopTowerDefense/core/system/autoSave")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")

return function(window, tab)
	--// ====================================================================
	--// CỘT TRÁI: Section 1 - Live Match Stats
	--// ====================================================================
	local statsSection = tab:Section({ Side = "Left" })
	statsSection:Header({ Name = "Match Status" })

	local timeLabel = statsSection:Label({
		Text = "⏱️ <b>Timer:</b> <font color='rgb(255,220,100)'>00:00</font>",
	})

	local goldLabel = statsSection:Label({
		Text = "💰 <b>Cash:</b> <font color='rgb(85,255,120)'>$0</font>",
	})

	local healthLabel = statsSection:Label({
		Text = "❤️ <b>Base HP:</b> <font color='rgb(255,100,100)'>100/100</font>",
	})

	local waveLabel = statsSection:Label({
		Text = "🌊 <b>Wave:</b> <font color='rgb(100,200,255)'>0/0</font>",
	})

	local raidMapLabel = statsSection:Label({
		Text = "🗺️ <b>Map:</b> <font color='rgb(150,150,150)'>--</font>",
	})

	local intermissionLabel = statsSection:Label({
		Text = "⏳ <b>Intermission:</b> <font color='rgb(150,150,150)'>None</font>",
	})

	local messageLabel = statsSection:Label({
		Text = "📢 <b>Status:</b> <font color='rgb(180,180,180)'>Ready</font>",
	})

	-- Hàm đồng bộ UI với dữ liệu trận đấu thời gian thực
	local function updateMatchUi(data: gameStats.GameStatsSnapshot)
		if not zoneGuard.IsInGame() then
			timeLabel:UpdateName("⏱️ <b>Timer:</b> <font color='rgb(150,150,150)'>In Lobby</font>")
			goldLabel:UpdateName("💰 <b>Cash:</b> <font color='rgb(150,150,150)'>In Lobby</font>")
			healthLabel:UpdateName("❤️ <b>Base HP:</b> <font color='rgb(150,150,150)'>In Lobby</font>")
			waveLabel:UpdateName("🌊 <b>Wave:</b> <font color='rgb(150,150,150)'>In Lobby</font>")
			messageLabel:UpdateName("📢 <b>Status:</b> <font color='rgb(150,150,150)'>Waiting for match...</font>")
			return
		end

		-- Thời gian trận đấu (tăng dần từ lúc Start đến End)
		local timeColor = data.IsMatchActive and "rgb(255,220,100)" or "rgb(150,220,255)"
		local timeStatus = data.IsMatchActive and "" or " (Ended)"
		timeLabel:UpdateName(string.format("⏱️ <b>Timer:</b> <font color='%s'>%s%s</font>", timeColor, data.ElapsedTimeFormatted, timeStatus))

		-- Tiền, Máu nhà, Wave
		goldLabel:UpdateName(string.format("💰 <b>Cash:</b> <font color='rgb(85,255,120)'>%s</font>", data.CashFormatted))
		healthLabel:UpdateName(string.format("❤️ <b>Base HP:</b> <font color='rgb(255,100,100)'>%s</font>", data.BaseHealthFormatted))
		waveLabel:UpdateName(string.format("🌊 <b>Wave:</b> <font color='rgb(100,200,255)'>Wave %s</font>", data.WaveFormatted))

		local msgText = (data.Message and data.Message ~= "") and data.Message or (data.IsMatchActive and "Match in progress" or "Finished")
		messageLabel:UpdateName(string.format("📢 <b>Status:</b> <font color='rgb(200,200,200)'>%s</font>", msgText))
	end

	local unsubscribeMatch = gameStats.Subscribe(updateMatchUi)
	lifecycle.Register(unsubscribeMatch)

	local function updateRaidUi(data: raidManager.RaidSnapshot)
		if not zoneGuard.IsInGame() or not data.IsRaid then
			raidMapLabel:UpdateName("🗺️ <b>Map:</b> <font color='rgb(150,150,150)'>Standard</font>")
			intermissionLabel:UpdateName("⏳ <b>Intermission:</b> <font color='rgb(150,150,150)'>None</font>")
			return
		end

		local mapColor = data.CurrentMap and "rgb(255,180,80)" or "rgb(150,150,150)"
		raidMapLabel:UpdateName(string.format("🗺️ <b>Map:</b> <font color='%s'>%s</font>", mapColor, tostring(data.CurrentMap or "Detecting...")))

		if data.IsIntermission then
			intermissionLabel:UpdateName(string.format("⏳ <b>Intermission:</b> <font color='rgb(85,255,120)'>%ds (%d/%d Ready)</font>", data.RemainingSeconds, data.ReadyCount, data.TotalPlayers))
		else
			intermissionLabel:UpdateName("⏳ <b>Intermission:</b> <font color='rgb(150,220,255)'>Wave Active</font>")
		end
	end

	local unsubRaid = raidManager.Subscribe(updateRaidUi)
	lifecycle.Register(unsubRaid)

	--// ====================================================================
	--// CỘT TRÁI: Section 2 - Macro Recorder (1 Input, 1 Button, 1 Dropdown, 1 Toggle)
	--// ====================================================================
	local recorderSection = tab:Section({ Side = "Left" })
	recorderSection:Header({ Name = "Macro Recorder" })

	local currentInputText = ""
	local macroDropdown
	local recordToggle
	local isUpdatingDropdownInternally = false
	local lastSyncedMacroName: string? = nil

	-- 1. Input: Nhập tên Macro mới
	local nameInput = recorderSection:Input({
		Name = "Macro Name",
		Placeholder = "Enter macro name...",
		AcceptedCharacters = "AlphaNumeric",
		Callback = autoSave.Wrap(function(text)
			currentInputText = text or ""
		end),
	}, "Input_MacroName")

	-- 2. Button: Tạo mới Macro
	recorderSection:Button({
		Name = "Create Macro",
		Callback = function()
			local rawName = currentInputText
			if not rawName or rawName == "" then
				if nameInput and type(nameInput.GetInput) == "function" then
					rawName = nameInput:GetInput()
				end
			end

			local trimmed = (rawName or ""):gsub("^%s+", ""):gsub("%s+$", "")
			if #trimmed == 0 then
				notifier.Notify("Macro", "Macro name cannot be empty!", 2)
				return
			end

			-- Tạo macro mới trong storage
			storage.CreateMacro(trimmed)
			recorder.SetActiveMacro(trimmed)
			player.SetActiveMacro(trimmed)

			-- Cập nhật danh sách vào Dropdown
			if macroDropdown then
				isUpdatingDropdownInternally = true
				pcall(function()
					local currentOptions = macroDropdown:GetOptions() or {}
					if not table.find(currentOptions, trimmed) then
						macroDropdown:InsertOptions({ trimmed })
					end
					lastSyncedMacroName = trimmed
					macroDropdown:UpdateSelection(trimmed)
				end)
				isUpdatingDropdownInternally = false
			end

			notifier.Notify("Macro", "Created Macro: " .. trimmed, 2)
		end,
	})

	-- Button: Tạo / Chọn Macro theo tên Map đang chơi
	recorderSection:Button({
		Name = "Use Current Map Name",
		Callback = function()
			local curMap = raidManager.GetCurrentMap()
			if not curMap or curMap == "" or curMap == "None" then
				notifier.Notify("Macro", "No active map detected!", 2)
				return
			end

			storage.CreateMacro(curMap)
			recorder.SetActiveMacro(curMap)
			player.SetActiveMacro(curMap)

			if macroDropdown then
				isUpdatingDropdownInternally = true
				pcall(function()
					local currentOptions = macroDropdown:GetOptions() or {}
					if not table.find(currentOptions, curMap) then
						macroDropdown:InsertOptions({ curMap })
					end
					lastSyncedMacroName = curMap
					macroDropdown:UpdateSelection(curMap)
				end)
				isUpdatingDropdownInternally = false
			end

			notifier.Notify("Macro", string.format("Selected Map Macro: '%s'", curMap), 2)
		end,
	})

	-- Danh sách macro ban đầu
	local initialMacros = storage.ListMacros()
	if #initialMacros == 0 then
		initialMacros = { "None" }
	end

	local defaultSelected = initialMacros[1] or "None"
	lastSyncedMacroName = defaultSelected
	if defaultSelected ~= "None" then
		recorder.SetActiveMacro(defaultSelected)
		player.SetActiveMacro(defaultSelected)
	end

	-- 3. Dropdown: Chọn Macro
	macroDropdown = recorderSection:Dropdown({
		Name = "Select Macro",
		Options = initialMacros,
		Default = defaultSelected,
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			if isUpdatingDropdownInternally then return end
			if not selected or selected == "" or selected == "None" then return end
			lastSyncedMacroName = selected
			recorder.SetActiveMacro(selected)
			player.SetActiveMacro(selected)
		end),
	}, "Dropdown_SelectMacro")

	-- Button: Xóa Macro đang chọn
	recorderSection:Button({
		Name = "Delete Macro",
		Callback = function()
			if player.IsEnabled() then
				notifier.Notify("Macro", "Please disable Play Macro before deleting!", 2)
				return
			end
			if recorder.IsRecording() then
				notifier.Notify("Macro", "Please stop Record Macro before deleting!", 2)
				return
			end

			local targetName = player.GetActiveMacro() or recorder.GetActiveMacro()
			if not targetName or targetName == "" or targetName == "None" then
				notifier.Notify("Macro", "Please select a Macro to delete!", 2)
				return
			end

			-- Thực hiện xóa file và bộ nhớ đệm
			storage.DeleteMacro(targetName)

			-- Cập nhật danh sách mới
			local updatedMacros = storage.ListMacros()
			if #updatedMacros == 0 then
				updatedMacros = { "None" }
			end

			local newSelected = updatedMacros[1] or "None"
			lastSyncedMacroName = newSelected
			recorder.SetActiveMacro(newSelected)
			player.SetActiveMacro(newSelected)

			if macroDropdown then
				isUpdatingDropdownInternally = true
				pcall(function()
					macroDropdown:ClearOptions()
					macroDropdown:InsertOptions(updatedMacros)
					macroDropdown:UpdateSelection(newSelected)
				end)
				isUpdatingDropdownInternally = false
			end

			notifier.Notify("Macro", string.format("Deleted Macro '%s'!", targetName), 2.5)
		end,
	})

	-- 4. Toggle: Bật / Tắt ghi lại Macro (Record)
	local isTogglingInternally = false
	recordToggle = recorderSection:Toggle({
		Name = "Record Macro",
		Default = false,
		Callback = function(state)
			if isTogglingInternally then return end

			if state then
				if player.IsEnabled() then
					isTogglingInternally = true
					pcall(function()
						recordToggle:UpdateState(false, true)
					end)
					isTogglingInternally = false
					notifier.Notify("Macro", "Please disable Play Macro before recording!", 2)
					return
				end

				local activeName = recorder.GetActiveMacro()
				if not activeName or activeName == "" or activeName == "None" then
					local curMap = raidManager.GetCurrentMap()
					if curMap and curMap ~= "" and curMap ~= "None" then
						activeName = curMap
						storage.CreateMacro(curMap)
						recorder.SetActiveMacro(curMap)
						player.SetActiveMacro(curMap)
						if macroDropdown then
							isUpdatingDropdownInternally = true
							pcall(function()
								local currentOptions = macroDropdown:GetOptions() or {}
								if not table.find(currentOptions, curMap) then
									macroDropdown:InsertOptions({ curMap })
								end
								lastSyncedMacroName = curMap
								macroDropdown:UpdateSelection(curMap)
							end)
							isUpdatingDropdownInternally = false
						end
						notifier.Notify("Macro", string.format("Auto selected Map Macro: '%s'", curMap), 2)
					else
						isTogglingInternally = true
						pcall(function()
							recordToggle:UpdateState(false, true)
						end)
						isTogglingInternally = false
						notifier.Notify("Macro", "Please select or create a Macro before recording!", 2)
						return
					end
				end

				local started = recorder.StartRecording(activeName)
				if not started then
					isTogglingInternally = true
					pcall(function()
						recordToggle:UpdateState(false, true)
					end)
					isTogglingInternally = false
				end
			else
				recorder.StopRecording()
				-- Cập nhật lại số bước trong UI Player sau khi dừng record
				local activeName = recorder.GetActiveMacro()
				if activeName then
					player.SetActiveMacro(activeName)
				end
			end
		end,
	})

	-- 5. Button: Dừng và lưu ngay Macro cho Map hiện tại (Cách 1)
	recorderSection:Button({
		Name = "Finish & Save Map",
		Callback = function()
			if not recorder.IsRecording() then
				notifier.Notify("Macro", "Recorder is not running!", 2)
				return
			end
			recorder.StopRecording("MapCompleted")
		end,
	})

	-- Lắng nghe trạng thái Record thay đổi (ví dụ: tự động dừng khi xuất hiện EndScreen)
	local unsubscribeRecord = recorder.OnRecordingStateChanged(function(recording)
		if recordToggle then
			isTogglingInternally = true
			pcall(function()
				recordToggle:UpdateState(recording, true)
			end)
			isTogglingInternally = false
		end

		if not recording then
			local activeName = recorder.GetActiveMacro()
			if activeName then
				player.SetActiveMacro(activeName)
			end
			if macroDropdown then
				isUpdatingDropdownInternally = true
				pcall(function()
					local updated = storage.ListMacros()
					if #updated == 0 then updated = { "None" } end
					macroDropdown:ClearOptions()
					macroDropdown:InsertOptions(updated)
					if activeName then
						lastSyncedMacroName = activeName
						macroDropdown:UpdateSelection(activeName)
					end
				end)
				isUpdatingDropdownInternally = false
			end
		end
	end)
	lifecycle.Register(unsubscribeRecord)

	--// ====================================================================
	--// CỘT PHẢI: Macro Player (Tính năng Play Macro)
	--// ====================================================================
	local playerSection = tab:Section({ Side = "Right" })
	playerSection:Header({ Name = "Macro Player" })

	local playerMacroLabel = playerSection:Label({
		Text = "📁 <b>Macro:</b> <font color='rgb(100,200,255)'>None</font>",
	})

	local playerStatusLabel = playerSection:Label({
		Text = "▶️ <b>Status:</b> <font color='rgb(180,180,180)'>Idle</font>",
	})

	local playerProgressLabel = playerSection:Label({
		Text = "📋 <b>Step:</b> <font color='rgb(150,150,150)'>0 / 0</font>",
	})

	local playerNextLabel = playerSection:Label({
		Text = "🎯 <b>Next Action:</b> <font color='rgb(150,150,150)'>None</font>",
	})

	local isPlayTogglingInternally = false
	local playToggle = playerSection:Toggle({
		Name = "Play Macro",
		Default = player.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			if isPlayTogglingInternally then return end

			if state then
				if recorder.IsRecording() then
					isPlayTogglingInternally = true
					pcall(function()
						playToggle:UpdateState(false, true)
					end)
					isPlayTogglingInternally = false
					notifier.Notify("Macro", "Please disable Record Macro before playing!", 2)
					return
				end

				local curMap = raidManager.GetCurrentMap()
				local mappedMacro = mapMacroManager.GetMapMacro(curMap)
				local targetName = (mappedMacro and mappedMacro ~= "None" and storage.HasMacro(mappedMacro)) and mappedMacro or (player.GetActiveMacro() or recorder.GetActiveMacro())

				local hasAnyMappings = next(mapMacroManager.GetAllMappings()) ~= nil

				if (not targetName or targetName == "" or targetName == "None") and not hasAnyMappings and not player.IsAutoMapSwitchEnabled() then
					isPlayTogglingInternally = true
					pcall(function()
						playToggle:UpdateState(false, true)
					end)
					isPlayTogglingInternally = false
					notifier.Notify("Macro", "Please select a Macro or configure Map Macro before playing!", 2)
					return
				end

				if targetName and targetName ~= "" and targetName ~= "None" then
					local data = storage.GetMacro(targetName)
					if data and data.Steps and #data.Steps > 0 then
						player.SetActiveMacro(targetName)
					end
				end

				player.SetEnabled(true)
			else
				player.SetEnabled(false)
			end
		end),
	}, "Toggle_PlayMacro")

	playerSection:Toggle({
		Name = "Apply Macro Speed",
		Default = player.IsSpeedSyncEnabled(),
		Callback = autoSave.Wrap(function(state)
			player.SetSpeedSync(state)
		end),
	}, "Toggle_ApplyMacroSpeed")

	playerSection:Toggle({
		Name = "Apply Skip Wave",
		Default = player.IsVoteSkipEnabled(),
		Callback = autoSave.Wrap(function(state)
			player.SetVoteSkipEnabled(state)
		end),
	}, "Toggle_ApplyMacroSkipWave")

	playerSection:Toggle({
		Name = "Auto Catch-up Upgrades",
		Default = player.IsAutoCatchUp(),
		Callback = autoSave.Wrap(function(state)
			player.SetAutoCatchUp(state)
		end),
	}, "Toggle_MacroAutoCatchUp")

	playerSection:Dropdown({
		Name = "Timing Mode",
		Options = { "Hybrid", "Timer", "Wave & Cash", "Cash (Timed Sell)" },
		Default = player.GetTimingMode(),
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			if not selected or selected == "" then return end
			player.SetTimingMode(selected)
		end),
	}, "Dropdown_MacroTimingMode")

	playerSection:Slider({
		Name = "Step Delay (s)",
		Minimum = 0.2,
		Maximum = 1,
		Default = player.GetStepDelay(),
		Precision = 2,
		DisplayMethod = "Value",
		Callback = autoSave.Wrap(function(val)
			player.SetStepDelay(val)
		end),
	}, "Slider_MacroStepDelay")

	playerSection:Button({
		Name = "Restart Playback",
		Callback = function()
			if not player.IsEnabled() then
				notifier.Notify("Macro Player", "Please enable 'Play Macro' before restarting!", 2)
				return
			end
			player.Restart()
			notifier.Notify("Macro Player", "Restarting macro playback...", 1.5)
		end,
	})

	-- Hàm cập nhật UI Player thời gian thực
	local function updatePlayerUi(data: player.PlaybackSnapshot)
		local macroName = data.MacroName or "None"
		local totalStepsCount = data.TotalSteps
		if totalStepsCount == 0 and macroName ~= "None" then
			local m = storage.GetMacro(macroName)
			if m and m.Steps then
				totalStepsCount = #m.Steps
			end
		end

		playerMacroLabel:UpdateName(string.format("📁 <b>Macro:</b> <font color='rgb(100,200,255)'>%s</font> <font color='rgb(150,150,150)'>(%d steps)</font>", macroName, totalStepsCount))

		if macroDropdown and macroName ~= "None" and macroName ~= lastSyncedMacroName then
			lastSyncedMacroName = macroName
			recorder.SetActiveMacro(macroName)
			isUpdatingDropdownInternally = true
			pcall(function()
				local currentOpts = macroDropdown:GetOptions() or {}
				if not table.find(currentOpts, macroName) then
					macroDropdown:InsertOptions({ macroName })
				end
				macroDropdown:UpdateSelection(macroName)
			end)
			isUpdatingDropdownInternally = false
		end

		local statusColor = data.IsPlaying and "rgb(85,255,120)" or (data.IsEnabled and "rgb(255,220,100)" or "rgb(180,180,180)")
		playerStatusLabel:UpdateName(string.format("▶️ <b>Status:</b> <font color='%s'>%s</font>", statusColor, data.StatusText))

		playerProgressLabel:UpdateName(string.format("📋 <b>Step:</b> <font color='rgb(200,200,255)'>%d / %d</font>", data.CurrentStep, totalStepsCount))

		playerNextLabel:UpdateName(string.format("🎯 <b>Next Action:</b> <font color='rgb(220,220,220)'>%s</font>", data.NextAction or "None"))
	end

	local unsubscribePlayer = player.Subscribe(updatePlayerUi)
	lifecycle.Register(unsubscribePlayer)
end
