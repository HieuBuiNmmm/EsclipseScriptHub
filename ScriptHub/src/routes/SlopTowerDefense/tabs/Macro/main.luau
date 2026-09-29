-- Tab Macro: Live Game Stats, Macro Recorder & Macro Player (Playback)
local gameStats = require("@routes/SlopTowerDefense/core/game/gameStats")
local zoneGuard = require("@routes/SlopTowerDefense/core/game/zoneGuard")
local storage = require("@routes/SlopTowerDefense/core/macro/storage")
local recorder = require("@routes/SlopTowerDefense/core/macro/recorder")
local player = require("@routes/SlopTowerDefense/core/macro/player")
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

	--// ====================================================================
	--// CỘT TRÁI: Section 2 - Macro Recorder (1 Input, 1 Button, 1 Dropdown, 1 Toggle)
	--// ====================================================================
	local recorderSection = tab:Section({ Side = "Left" })
	recorderSection:Header({ Name = "Macro Recorder" })

	local currentInputText = ""
	local macroDropdown
	local recordToggle

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
				notifier.Notify("Macro", "Tên Macro không được để trống!", 2)
				return
			end

			-- Tạo macro mới trong storage
			storage.CreateMacro(trimmed)
			recorder.SetActiveMacro(trimmed)
			player.SetActiveMacro(trimmed)

			-- Cập nhật danh sách vào Dropdown
			if macroDropdown then
				pcall(function()
					local currentOptions = macroDropdown:GetOptions() or {}
					if not table.find(currentOptions, trimmed) then
						macroDropdown:InsertOptions({ trimmed })
					end
					macroDropdown:UpdateSelection(trimmed)
				end)
			end

			notifier.Notify("Macro", "Đã tạo Macro: " .. trimmed, 2)
		end,
	})

	-- Danh sách macro ban đầu
	local initialMacros = storage.ListMacros()
	if #initialMacros == 0 then
		initialMacros = { "None" }
	end

	local defaultSelected = initialMacros[1] or "None"
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
			if not selected or selected == "" or selected == "None" then return end
			recorder.SetActiveMacro(selected)
			player.SetActiveMacro(selected)
		end),
	}, "Dropdown_SelectMacro")

	-- 4. Toggle: Bật / Tắt ghi lại Macro (Record)
	local isTogglingInternally = false
	recordToggle = recorderSection:Toggle({
		Name = "Record Macro",
		Default = recorder.IsRecording(),
		Callback = autoSave.Wrap(function(state)
			if isTogglingInternally then return end

			if state then
				if player.IsEnabled() then
					isTogglingInternally = true
					pcall(function()
						recordToggle:UpdateState(false, true)
					end)
					isTogglingInternally = false
					notifier.Notify("Macro", "Vui lòng tắt Play Macro trước khi Record!", 2)
					return
				end

				local activeName = recorder.GetActiveMacro()
				if not activeName or activeName == "" or activeName == "None" then
					isTogglingInternally = true
					pcall(function()
						recordToggle:UpdateState(false, true)
					end)
					isTogglingInternally = false
					notifier.Notify("Macro", "Vui lòng chọn hoặc tạo Macro trước khi Record!", 2)
					return
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
		end),
	}, "Toggle_RecordMacro")

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
					notifier.Notify("Macro", "Vui lòng tắt Record Macro trước khi Play!", 2)
					return
				end

				local targetName = player.GetActiveMacro() or recorder.GetActiveMacro()
				if not targetName or targetName == "" or targetName == "None" then
					isPlayTogglingInternally = true
					pcall(function()
						playToggle:UpdateState(false, true)
					end)
					isPlayTogglingInternally = false
					notifier.Notify("Macro", "Vui lòng chọn hoặc tạo Macro trước khi Play!", 2)
					return
				end

				local data = storage.GetMacro(targetName)
				if not data or not data.Steps or #data.Steps == 0 then
					isPlayTogglingInternally = true
					pcall(function()
						playToggle:UpdateState(false, true)
					end)
					isPlayTogglingInternally = false
					notifier.Notify("Macro", string.format("Macro '%s' chưa có bước nào để chạy!", targetName), 2.5)
					return
				end

				player.SetActiveMacro(targetName)
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
		Minimum = 0,
		Maximum = 2,
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
				notifier.Notify("Macro Player", "Vui lòng bật 'Play Macro' trước khi Restart!", 2)
				return
			end
			player.Restart()
			notifier.Notify("Macro Player", "Đang khởi động lại tiến trình Macro...", 1.5)
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

		local statusColor = data.IsPlaying and "rgb(85,255,120)" or (data.IsEnabled and "rgb(255,220,100)" or "rgb(180,180,180)")
		playerStatusLabel:UpdateName(string.format("▶️ <b>Status:</b> <font color='%s'>%s</font>", statusColor, data.StatusText))

		playerProgressLabel:UpdateName(string.format("📋 <b>Step:</b> <font color='rgb(200,200,255)'>%d / %d</font>", data.CurrentStep, totalStepsCount))

		playerNextLabel:UpdateName(string.format("🎯 <b>Next Action:</b> <font color='rgb(220,220,220)'>%s</font>", data.NextAction or "None"))
	end

	local unsubscribePlayer = player.Subscribe(updatePlayerUi)
	lifecycle.Register(unsubscribePlayer)
end
