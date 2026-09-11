-- Tab Path Record (DungeonQuest): thử nghiệm macro di chuyển theo quỹ đạo record sẵn.
--   - MACRO = 1 bản ghi cho cả map, tích lũy dần các room đã record.
--   - Record 1 lần = 1 ROOM: bấm Record -> điểm bắt đầu = vị trí đứng,
--     TỰ TẮT khi đổi room / vào boss / về lobby và gộp vào macro của map.
--   - Boss ngẫu nhiên -> dùng SmartDodge (pathRecord tự nhường + auto-resume).

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
		Text = "Macro = 1 bản ghi cho cả map, chứa toàn bộ <font color='rgb(0,255,120)'>ROOM QUÁI THƯỜNG</font>. Tự lưu khi hết map / tắt record. Boss -> dùng Smart Dodge.",
	})

	local isSyncingRecord = false
	local isSyncingPlay = false
	local isPromptingRecord = false

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
										isSyncingRecord = true
										recordToggle:UpdateState(false)
										isSyncingRecord = false
									end
								end,
							},
							{
								Name = "Cancel",
								Callback = function()
									isPromptingRecord = false
									isSyncingRecord = true
									recordToggle:UpdateState(false)
									isSyncingRecord = false
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
		Text = "Record sẽ bắt cả <font color='rgb(255,150,80)'>khoảng đứng chờ</font> + <font color='rgb(255,80,80)'>skill chuột phải</font> + hướng mặt, Play sẽ tái hiện lại đúng vị trí & giây đã record.",
	})

	local playToggle = left:Toggle({
		Name = "Play Path (Macro)",
		Default = pathRecord.IsPlaying(),
		Callback = function(state)
			if isSyncingPlay then return end
			pathRecord.TogglePlay(state)
		end,
	})

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
		Precision = 0,
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

	local macroDropdown = ui.PatchDropdownRestore(left:Dropdown({
		Name = "Map Recording",
		Options = { "None" },
		Default = 1,
		Required = true,
		Callback = function(option) end,
	}), false)

	local deleteBtn = left:Button({
		Name = "Delete Selected Map",
		Callback = autoSave.Wrap(function()
			local selected = macroDropdown:GetOptions()
			for option, isSelected in pairs(selected) do
				if isSelected then
					local mapName = string.match(option, "^Map (%b[]) %(%d+ rooms%)$")
					if not mapName or #mapName <= 2 then
						mapName = string.match(option, "^Map (.-) %(%d+ rooms%)$")
					end
					if mapName and #mapName > 2 then
						mapName = mapName:sub(2, -2)
						pathRecord.RemoveMap(mapName)
					end
					return
				end
			end
		end),
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
	--// RIGHT COLUMN: Status
	--// ============================================================
	local right = tab:Section({ Side = "Right" })
	right:Header({ Name = "Status Monitor" })

	local stateLabel = right:Label({ Text = "State: <font color='rgb(160,160,160)'>Idle</font>" })
	local roomLabel = right:Label({ Text = "Room: <font color='rgb(160,160,160)'>-</font> | Boss: <font color='rgb(160,160,160)'>-</font>" })
	local pointsLabel = right:Label({ Text = "Points: <font color='rgb(160,160,160)'>-</font>" })
	local recordingsLabel = right:Label({ Text = "Macros: <font color='rgb(160,160,160)'>None</font>" })

	--// Đồng bộ toggle UI theo trạng thái thực tế (không gọi lại Callback gây loop).
	local function syncToggles(info)
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
			if playToggle and playToggle.GetState and playToggle:GetState() ~= info.playing then
				isSyncingPlay = true
				playToggle:UpdateState(info.playing)
				isSyncingPlay = false
			end
		end)
		pcall(function()
			if visualToggle and visualToggle.GetState and visualToggle:GetState() ~= pathRecord.IsShowVisualEnabled() then
				visualToggle:UpdateState(pathRecord.IsShowVisualEnabled())
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

	local function updateStatus(info)
		local stateText
		if info.recording then
			stateText = "<font color='rgb(255,90,90)'>Recording...</font>"
		elseif info.playing then
			stateText = "<font color='rgb(0,230,255)'>Playing</font>"
		elseif info.resume then
			stateText = "<font color='rgb(255,200,0)'>Waiting (auto-resume)</font>"
		else
			stateText = "<font color='rgb(160,160,160)'>Idle</font>"
		end
		pcall(function() stateLabel:UpdateName("State: " .. stateText) end)

		local bossText = info.boss
			and "<font color='rgb(255,80,80)'>YES (dùng Smart Dodge)</font>"
			or "<font color='rgb(0,255,120)'>No</font>"
		local roomText = info.room and info.room > 0
			and ("<font color='rgb(0,255,255)'>room %d</font>"):format(info.room)
			or "<font color='rgb(160,160,160)'>-</font>"
		local mapText = info.map and #info.map > 0
			and ("<font color='rgb(150,255,150)'>%s</font>"):format(info.map)
			or "<font color='rgb(160,160,160)'>-</font>"
		pcall(function() roomLabel:UpdateName("Map: " .. mapText .. " | Room: " .. roomText .. " | Boss: " .. bossText) end)

		if info.recording then
			pcall(function() pointsLabel:UpdateName(("Points: <font color='rgb(255,170,60)'>%d</font> (room %s)"):format(info.pointCount, tostring(info.room))) end)
		else
			pcall(function() pointsLabel:UpdateName("Points: <font color='rgb(160,160,160)'>-</font>") end)
		end

		local maps = pathRecord.GetMaps()
		if #maps == 0 then
			pcall(function() recordingsLabel:UpdateName("Macros: <font color='rgb(160,160,160)'>None</font>") end)
		else
			local parts = {}
			for _, rec in ipairs(maps) do
				parts[#parts + 1] = ("%s(%dr/%dp)"):format(rec.map, rec.roomCount, rec.pointCount)
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