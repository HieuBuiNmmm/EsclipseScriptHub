-- Tab Path Record (DungeonQuest): thử nghiệm macro di chuyển theo quỹ đạo record sẵn.
--   - MACRO = 1 bản ghi cho cả map: bấm Record 1 lần, tự ghi liên tục qua các room
--     (auto-split segment theo room), tự lưu khi về lobby. Record lại room nào thì ghi đè room đó.
--   - Mode theo map: NORMAL (mặc định) skip boss, dùng Hazard Scanner; FULL record & phát luôn cả boss room.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local pathRecord = require("@routes/DungeonQuest/core/pathRecord")
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local ui = require("@routes/DungeonQuest/core/ui")
local notifier = require("@routes/DungeonQuest/core/notifier")

local RunService = services.RunService

return function(window, tab)
	--// ============================================================
	--// LEFT COLUMN: Điều khiển
	--// ============================================================
	local left = tab:Section({ Side = "Left" })
	left:Header({ Name = "Path Record" })
	left:Label({
		Text = "Macro = 1 bản ghi cho cả map, <font color='rgb(0,255,120)'>bấm Record 1 lần là ghi liên tục</font> qua từng room (tự lưu khi về lobby). Mode FULL -> record & phát luôn cả boss room.",
	})

	local isSyncingRecord = false
	local isSyncingPlay = false
	local isSyncingMode = false
	local isPromptingRecord = false
	local macroDropdown = nil
	local updateStatus = nil
	local syncToggles = nil

	local function getSelectedMapFromDropdown()
		if not macroDropdown then return nil end
		local selected = macroDropdown:GetOptions()
		for option, isSelected in pairs(selected) do
			if isSelected and option ~= "None" then
				local mapName = string.match(option, "^Map %[(.+)%] %(%d+ rooms%)$")
				if mapName and #mapName > 0 then
					return mapName
				end
			end
		end
		return nil
	end

	local recordToggle = left:Toggle({
		Name = "Record Path (Macro)",
		Default = pathRecord.IsRecording(),
		Callback = function(state)
			if isSyncingRecord then return end

			if state then
				-- Đã đang record rồi -> không làm gì thêm
				if pathRecord.IsRecording() then return end

				--// Room đã có macro -> record sẽ GHI ĐÈ segment cũ: hỏi xác nhận trước.
				if pathRecord.CurrentRoomHasRecord() then
					if isPromptingRecord then return end
					isPromptingRecord = true

					window:Dialog({
						Title = "Confirm Record",
						Description = "Room này <font color='rgb(255,200,0)'>đã có macro được lưu</font>."
							.. "\n\nRecord bây giờ sẽ <b>GHI ĐÈ segment cũ</b> của room đó.\nBạn vẫn muốn record lại chứ?",
						Buttons = {
							{
								Name = "Record (Overwrite)",
								Callback = function()
									isPromptingRecord = false
									local ok = pathRecord.ToggleRecord(true)
									if not ok then
										pcall(function()
											isSyncingRecord = true
											recordToggle:UpdateState(false)
											isSyncingRecord = false
										end)
									end
								end,
							},
							{
								Name = "Cancel",
								Callback = function()
									isPromptingRecord = false
									local ok, err = pcall(function()
										isSyncingRecord = true
										recordToggle:UpdateState(false)
										isSyncingRecord = false
									end)
									if not ok then
										isSyncingRecord = false
										warn("Path Record: Cancel failed to reset toggle - " .. tostring(err))
									end
								end,
							},
						},
					})
					return
				end
				pathRecord.ToggleRecord(true)
			else
				isPromptingRecord = false
				if pathRecord.IsRecording() then
					pathRecord.ToggleRecord(false)
				end
			end
		end,
	})
	left:Label({
		Text = "Record sẽ bắt cả <font color='rgb(255,150,80)'>khoảng đứng chờ</font> + <font color='rgb(255,80,80)'>skill (chuột phải / Q / E)</font> + hướng mặt, Play sẽ tái hiện lại đúng vị trí, giây & nút đã record.",
	})

	--// Mode theo map: NORMAL = skip boss (dùng Hazard Scanner); FULL = record & phát luôn cả boss room.
	local modeLabel = left:Label({
		Text = "Record Mode (theo map): <font color='rgb(120,200,255)'>NORMAL</font>",
	})

	local recordBossToggle = left:Toggle({
		Name = "Full Mode (Record & Play Boss Rooms)",
		Default = false,
		Callback = function(state)
			if isSyncingMode then return end

			local currentMap = pathRecord.GetStatus().map
			local targetMap = (currentMap and #currentMap > 0) and currentMap or getSelectedMapFromDropdown()

			if not targetMap or #targetMap == 0 then
				notifier.Notify("Path Record", "Chưa có map nào được chọn. Hãy chọn map trong dropdown hoặc vào dungeon.", 3)
				pcall(function()
					isSyncingMode = true
					recordBossToggle:UpdateState(false)
					isSyncingMode = false
				end)
				return
			end
			pathRecord.SetMapMode(targetMap, state and "full" or "normal")
			notifier.Notify("Path Record", ("Map [%s]: Chế độ %s"):format(targetMap, state and "FULL (record & phát cả boss room)" or "NORMAL (bỏ qua boss, dùng Hazard Scanner)"), 3)
			if updateStatus then
				updateStatus(pathRecord.GetStatus())
			end
		end,
	})
	left:Label({
		Text = "Mode lưu theo <font color='rgb(150,255,150)'>từng map</font>. <font color='rgb(255,140,255)'>FULL</font>: ghi liên tục qua cả boss room & phát theo path đã record. <font color='rgb(120,200,255)'>NORMAL</font> (mặc định): chỉ room quái thường, boss dùng Hazard Scanner.",
	})

	local playToggle = left:Toggle({
		Name = "Play Path (Macro)",
		Default = pathRecord.IsAutoPlayWanted(),
		Callback = autoSave.Wrap(function(state)
			if isSyncingPlay then return end
			pathRecord.TogglePlay(state)
		end),
	}, "Toggle_PR_Play")

	--// Timeline: ghi/tái hiện khoảng dừng + skill chuột phải + hướng mặt.
	local captureTimeline = left:Toggle({
		Name = "Record Pauses & Skills",
		Default = pathRecord.IsTimelineCaptureEnabled(),
		Callback = autoSave.Wrap(function(state)
			pathRecord.SetTimelineCapture(state)
		end),
	}, "Toggle_PR_TimelineCapture")

	local replayTimeline = left:Toggle({
		Name = "Replay Pauses & Skills",
		Default = pathRecord.IsTimelineReplayEnabled(),
		Callback = autoSave.Wrap(function(state)
			pathRecord.SetTimelineReplay(state)
		end),
	}, "Toggle_PR_TimelineReplay")

	local speedMatch = left:Toggle({
		Name = "Match Record Speed (Precise)",
		Default = pathRecord.IsSpeedMatchEnabled(),
		Callback = autoSave.Wrap(function(state)
			pathRecord.SetSpeedMatch(state)
		end),
	}, "Toggle_PR_SpeedMatch")

	local useFastSpeed = left:Toggle({
		Name = "Use Player Fast Speed",
		Default = pathRecord.IsUseFastSpeedEnabled(),
		Callback = autoSave.Wrap(function(state)
			pathRecord.SetUseFastSpeed(state)
		end),
	}, "Toggle_PR_UseFastSpeed")

	--// Giữ facing sau khi xả skill khi đang đi (0.5s - 2s).
	ui.PatchSliderLoadCallback(left:Slider({
		Name = "Skill Face Hold (s)",
		Default = pathRecord.GetSkillFaceHold(),
		Minimum = 0.5,
		Maximum = 2,
		DisplayMethod = "Value",
		Precision = 2,
		Callback = autoSave.Wrap(function(v)
			pathRecord.SetSkillFaceHold(v)
		end),
		onInputComplete = function(v)
			autoSave.SaveNow()
			notifier.Notify("Path Record", ("Saved Skill Face Hold = %ss"):format(tostring(v)), 2)
		end,
	}, "Slider_PR_SkillFaceHold"))

	--// Khoảng nghỉ giữa 2 lần click khi double-cast skill (0.005s - 0.1s).
	ui.PatchSliderLoadCallback(left:Slider({
		Name = "Skill Double Click Delay (s)",
		Default = pathRecord.GetDoubleClickDelay(),
		Minimum = 0.005,
		Maximum = 0.1,
		DisplayMethod = "Value",
		Precision = 3,
		Callback = autoSave.Wrap(function(v)
			pathRecord.SetDoubleClickDelay(v)
		end),
		onInputComplete = function(v)
			autoSave.SaveNow()
			notifier.Notify("Path Record", ("Saved Double Click Delay = %ss"):format(tostring(v)), 2)
		end,
	}, "Slider_PR_DoubleClickDelay"))

	local visualToggle = left:Toggle({
		Name = "Show Path Visual",
		Default = pathRecord.IsShowVisualEnabled(),
		Callback = autoSave.Wrap(function(state)
			pathRecord.SetShowVisual(state)
		end),
	}, "Toggle_PR_Visual")

	--// Tuỳ chỉnh cách hiển thị line path (kích thước + màu).
	local prStyle = pathRecord.GetStyle()

	ui.PatchSliderLoadCallback(left:Slider({
		Name = "Line Thickness",
		Default = prStyle.thickness,
		Minimum = 1,
		Maximum = 10,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(v)
			pathRecord.SetStyle({ thickness = v })
		end),
		onInputComplete = function(v)
			autoSave.SaveNow()
		end,
	}, "Slider_PR_LineThickness"))

	ui.PatchSliderLoadCallback(left:Slider({
		Name = "Line Opacity",
		Default = math.round((1 - prStyle.transparency) * 100),
		Minimum = 10,
		Maximum = 100,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(v)
			pathRecord.SetStyle({ transparency = 1 - v / 100 })
		end),
		onInputComplete = function(v)
			autoSave.SaveNow()
		end,
	}, "Slider_PR_LineOpacity"))

	local themeNames = pathRecord.GetThemeNames()
	local themeIdx = 1
	for i, name in ipairs(themeNames) do
		if name == prStyle.theme then
			themeIdx = i
			break
		end
	end
	ui.PatchDropdownRestore(left:Dropdown({
		Name = "Path Color Theme",
		Options = themeNames,
		Default = themeIdx,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			pathRecord.SetStyle({ theme = option })
		end),
	}, "Dropdown_PR_Theme"), false)

	--// ============================================================
	--// LEFT COLUMN: Quản lý macro
	--// ============================================================
	left:Header({ Name = "Macros" })

	macroDropdown = ui.PatchDropdownRestore(left:Dropdown({
		Name = "Map Recording",
		Options = { "None" },
		Default = 1,
		Required = true,
		Callback = function(option)
			local info = pathRecord.GetStatus()
			if updateStatus then updateStatus(info) end
			if syncToggles then syncToggles(info) end
		end,
	}), false)

	local deleteBtn = left:Button({
		Name = "Delete Selected Map",
		Callback = autoSave.Wrap(function()
			local mapName = getSelectedMapFromDropdown()
			if mapName and #mapName > 0 then
				pathRecord.RemoveMap(mapName)
			end
		end),
	})

	local reloadBtn = left:Button({
		Name = "Reload Macros (EsclipseHub/DQMacro)",
		Callback = function()
			pathRecord.ReloadFromDisk()
			notifier.Notify("Path Record", "Đã quét và tải lại các file macro từ EsclipseHub/DQMacro/", 2)
		end,
	})

	--// Nút Clear 2 bước (arm Confirm -> bấm lại trong hạn).
	local clearArmed = false
	local clearTimer = nil
	local CLEAR_NAME = "Clear All Recordings"
	local CLEAR_CONFIRM_NAME = "<font color='rgb(255,80,80)'>Confirm Clear All?</font>"
	local CLEAR_TIMEOUT = 3

	local function disarmClear()
		if not clearArmed then return end
		clearArmed = false
		if clearTimer then task.cancel(clearTimer); clearTimer = nil end
		pcall(function() clearBtn:UpdateName(CLEAR_NAME) end)
	end

	local clearBtn = left:Button({
		Name = CLEAR_NAME,
		Callback = function()
			if not clearArmed then
				clearArmed = true
				if clearTimer then task.cancel(clearTimer) end
				clearTimer = task.delay(CLEAR_TIMEOUT, disarmClear)
				pcall(function() clearBtn:UpdateName(CLEAR_CONFIRM_NAME) end)
				return
			end
			disarmClear()
			pathRecord.ClearAll()
		end,
	})

	--// ============================================================
	--// RIGHT COLUMN: Status & Range Visual
	--// ============================================================
	local right = tab:Section({ Side = "Right" })
	right:Header({ Name = "Status Monitor" })

	local stateLabel = right:Label({ Text = "State: <font color='rgb(160,160,160)'>Idle</font>" })
	local roomLabel = right:Label({ Text = "Room: <font color='rgb(160,160,160)'>-</font> | Boss: <font color='rgb(160,160,160)'>-</font>" })
	local pointsLabel = right:Label({ Text = "Points: <font color='rgb(160,160,160)'>-</font>" })
	local recordingsLabel = right:Label({ Text = "Macros: <font color='rgb(160,160,160)'>None</font>" })

	--// ============================================================
	--// RIGHT COLUMN: Skill Range Visual (Section riêng)
	--// ============================================================
	local rangeSection = tab:Section({ Side = "Right" })
	rangeSection:Header({ Name = "Skill Range Visual" })
	rangeSection:Label({
		Text = "Vòng tròn quanh nhân vật giúp ước lượng <font color='rgb(0,255,200)'>tầm đánh / phạm vi AOE</font> của skill để căn góc và vị trí xả chiêu khi record.",
	})

	local rangeToggle = rangeSection:Toggle({
		Name = "Show Range Circle",
		Default = pathRecord.IsRangeVisualEnabled(),
		Callback = autoSave.Wrap(function(state)
			pathRecord.SetRangeVisual(state)
		end),
	}, "Toggle_PR_RangeVisual")

	ui.PatchSliderLoadCallback(rangeSection:Slider({
		Name = "Skill Range (Studs)",
		Default = pathRecord.GetRangeVisualRadius(),
		Minimum = 5,
		Maximum = 120,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(v)
			pathRecord.SetRangeVisualRadius(v)
		end),
		onInputComplete = function(v)
			autoSave.SaveNow()
		end,
	}, "Slider_PR_RangeRadius"))

	rangeSection:Toggle({
		Name = "Fill Circle Area",
		Default = pathRecord.IsRangeVisualFillEnabled(),
		Callback = autoSave.Wrap(function(state)
			pathRecord.SetRangeVisualFill(state)
		end),
	}, "Toggle_PR_RangeFill")

	local rangeColorNames = pathRecord.GetRangeColorNames()

	local curCircleColor = pathRecord.GetSelectedCircleColor()
	local circleColorDefaultIdx = 1
	for i, name in ipairs(rangeColorNames) do
		if name == curCircleColor then
			circleColorDefaultIdx = i
			break
		end
	end

	ui.PatchDropdownRestore(rangeSection:Dropdown({
		Name = "Circle Color",
		Options = rangeColorNames,
		Default = circleColorDefaultIdx,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			pathRecord.SetCircleColor(option)
		end),
	}, "Dropdown_PR_CircleColor"), false)

	local inRangeHighlightToggle = rangeSection:Toggle({
		Name = "Highlight In-Range Enemies (Glow)",
		Default = pathRecord.IsHighlightInRangeEnabled(),
		Callback = autoSave.Wrap(function(state)
			pathRecord.SetHighlightInRange(state)
		end),
	}, "Toggle_PR_HighlightInRange")

	local curHlColor = pathRecord.GetSelectedHighlightColor()
	local hlColorDefaultIdx = 2 -- Default Red
	for i, name in ipairs(rangeColorNames) do
		if name == curHlColor then
			hlColorDefaultIdx = i
			break
		end
	end

	ui.PatchDropdownRestore(rangeSection:Dropdown({
		Name = "Enemy Highlight Color",
		Options = rangeColorNames,
		Default = hlColorDefaultIdx,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			pathRecord.SetHighlightColor(option)
		end),
	}, "Dropdown_PR_HighlightColor"), false)

	--// Đồng bộ toggle UI theo trạng thái thực tế (không gọi lại Callback gây loop).
	syncToggles = function(info)
		if not isPromptingRecord then
			pcall(function()
				if recordToggle and recordToggle.GetState and recordToggle:GetState() ~= info.recording then
					isSyncingRecord = true
					recordToggle:UpdateState(info.recording)
					isSyncingRecord = false
				end
			end)
		end
		pcall(function()
			local wantPlay = pathRecord.IsAutoPlayWanted()
			if playToggle and playToggle.GetState and playToggle:GetState() ~= wantPlay then
				isSyncingPlay = true
				playToggle:UpdateState(wantPlay)
				isSyncingPlay = false
			end
		end)
		pcall(function()
			local currentMap = info.map
			local targetMap = (currentMap and #currentMap > 0) and currentMap or getSelectedMapFromDropdown()
			local wantMode = targetMap and pathRecord.GetMapMode(targetMap) == "full" or false
			if recordBossToggle and recordBossToggle.GetState and recordBossToggle:GetState() ~= wantMode then
				isSyncingMode = true
				recordBossToggle:UpdateState(wantMode)
				isSyncingMode = false
			end
		end)
		pcall(function()
			if visualToggle and visualToggle.GetState and visualToggle:GetState() ~= pathRecord.IsShowVisualEnabled() then
				visualToggle:UpdateState(pathRecord.IsShowVisualEnabled())
			end
		end)
		pcall(function()
			if rangeToggle and rangeToggle.GetState and rangeToggle:GetState() ~= pathRecord.IsRangeVisualEnabled() then
				rangeToggle:UpdateState(pathRecord.IsRangeVisualEnabled())
			end
		end)
		pcall(function()
			if inRangeHighlightToggle and inRangeHighlightToggle.GetState and inRangeHighlightToggle:GetState() ~= pathRecord.IsHighlightInRangeEnabled() then
				inRangeHighlightToggle:UpdateState(pathRecord.IsHighlightInRangeEnabled())
			end
		end)
	end

	local function mapOptionList(maps)
		local options = {}
		for _, rec in ipairs(maps) do
			options[#options + 1] = ("Map [%s] (%d rooms)"):format(rec.map, rec.roomCount)
		end
		if #options == 0 then
			options[1] = "None"
		end
		return options
	end

	--// Chỉ rebuild dropdown khi danh sách map đổi (tránh churn mỗi tick).
	local lastMapOptionsKey = nil

	local function refreshDropdown(maps)
		local options = mapOptionList(maps)
		local key = table.concat(options, "|")

		if key == lastMapOptionsKey then return end
		lastMapOptionsKey = key

		local prevSelected = nil
		for option, isSelected in pairs(macroDropdown:GetOptions()) do
			if isSelected then prevSelected = option; break end
		end

		pcall(function() macroDropdown:ClearOptions() end)
		pcall(function() macroDropdown:InsertOptions(options) end)

		--// Giữ selection cũ nếu còn tồn tại, không thì chọn option đầu tiên.
		local newSelection = prevSelected
		if not newSelection or not macroDropdown:IsOption(newSelection) then
			newSelection = options[1]
		end
		pcall(function() macroDropdown:UpdateSelection(newSelection) end)
	end

	updateStatus = function(info)
		local isFullMap = false
		local currentMap = info.map
		local targetMap = (currentMap and #currentMap > 0) and currentMap or getSelectedMapFromDropdown()
		if targetMap then
			isFullMap = pathRecord.GetMapMode(targetMap) == "full"
		end

		local stateText
		if info.recording then
			stateText = "<font color='rgb(255,90,90)'>Recording...</font>"
		elseif info.playing then
			stateText = "<font color='rgb(0,230,255)'>Playing</font>"
		elseif info.resume then
			stateText = "<font color='rgb(255,200,0)'>Waiting (auto-resume)</font>"
		elseif info.autoPlayWanted then
			if info.inLobby then
				stateText = "<font color='rgb(100,220,100)'>Armed (Lobby)</font>"
			elseif not info.map or #info.map == 0 then
				stateText = "<font color='rgb(100,220,100)'>Armed (Loading...)</font>"
			elseif info.boss and not isFullMap then
				stateText = "<font color='rgb(255,160,50)'>Waiting (Boss Room)</font>"
			else
				stateText = "<font color='rgb(100,220,100)'>Armed (Waiting for Room)</font>"
			end
		else
			stateText = "<font color='rgb(160,160,160)'>Idle</font>"
		end
		pcall(function() stateLabel:UpdateName("State: " .. stateText) end)

		local modeText = isFullMap
			and "<font color='rgb(255,140,255)'>FULL</font>"
			or "<font color='rgb(120,200,255)'>NORMAL</font>"
		local mapContextText = targetMap and (" (map [" .. targetMap .. "])") or " (theo map)"
		pcall(function() modeLabel:UpdateName("Record Mode" .. mapContextText .. ": " .. modeText) end)

		local bossText
		if info.boss then
			if isFullMap then
				bossText = "<font color='rgb(255,140,255)'>YES (FULL path)</font>"
			else
				bossText = "<font color='rgb(255,80,80)'>YES (dùng Hazard Scanner)</font>"
			end
		else
			bossText = "<font color='rgb(0,255,120)'>No</font>"
		end
		local roomText = info.room and info.room > 0
			and ("<font color='rgb(0,255,255)'>room %d</font>"):format(info.room)
			or "<font color='rgb(160,160,160)'>-</font>"
		local mapText = info.map and #info.map > 0
			and ("<font color='rgb(150,255,150)'>%s</font>"):format(info.map)
			or "<font color='rgb(160,160,160)'>-</font>"
		pcall(function() roomLabel:UpdateName("Map: " .. mapText .. " | Room: " .. roomText .. " | Boss: " .. bossText) end)

		if info.recording then
			local curP = info.phase or 1
			pcall(function() pointsLabel:UpdateName(("Points: <font color='rgb(255,170,60)'>%d</font> (room %s | Phase %d)"):format(info.pointCount, tostring(info.room), curP)) end)
		elseif info.playing then
			local curP = info.phase or 1
			pcall(function() pointsLabel:UpdateName(("Playing: <font color='rgb(0,230,255)'>Phase %d</font>"):format(curP)) end)
		else
			pcall(function() pointsLabel:UpdateName("Points: <font color='rgb(160,160,160)'>-</font>") end)
		end

		local maps = pathRecord.GetMaps()
		if #maps == 0 then
			pcall(function() recordingsLabel:UpdateName("Macros: <font color='rgb(160,160,160)'>None</font>") end)
		else
			local parts = {}
			for _, rec in ipairs(maps) do
				local bossPart = rec.bossCount and rec.bossCount > 0 and ("+%db"):format(rec.bossCount) or ""
				local phasePart = rec.phaseCount and rec.phaseCount > rec.roomCount and ("/%dph"):format(rec.phaseCount) or ""
				parts[#parts + 1] = ("%s(%dr%s/%dp%s)"):format(rec.map, rec.roomCount, phasePart, rec.pointCount, bossPart)
			end
			pcall(function() recordingsLabel:UpdateName("Macros: <font color='rgb(150,255,150)'>" .. table.concat(parts, ", ") .. "</font>") end)
		end

		refreshDropdown(maps)
	end

	pathRecord.OnStatusChanged(function(info)
		updateStatus(info)
		syncToggles(info)
	end)

	--// Monitor định kỳ (đảm bảo UI phản ánh đúng cả khi config đổi).
	local lastUpdate = 0
	local monitorConnection = RunService.Heartbeat:Connect(function()
		local now = os.clock()
		if now - lastUpdate < 0.4 then return end
		lastUpdate = now
		local info = pathRecord.GetStatus()
		updateStatus(info)
		syncToggles(info)
	end)

	lifecycle.Register(function()
		if monitorConnection then monitorConnection:Disconnect(); monitorConnection = nil end
	end)

	updateStatus(pathRecord.GetStatus())
	syncToggles(pathRecord.GetStatus())
end