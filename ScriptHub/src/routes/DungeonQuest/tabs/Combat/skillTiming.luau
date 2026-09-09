--==============================================================--
-- Module Skill Timing & Training trong tab Combat (DungeonQuest)
-- Tách biệt rõ ràng thành bảng riêng (Section riêng):
--   1. Section "Skill Timing Profiles":
--      - Mode 1: Default Preset (bảng cứng chuẩn, ổn định tuyệt đối)
--      - Mode 2: Trained Preset (chọn file JSON theo từng Map, nạp 1 lần vào RAM)
--   2. Section "Manual Skill Training":
--      - Chế độ chơi chay thu thập dữ liệu nhịp chiêu thức
--      - Hoàn toàn 0% disk I/O khi né đòn, chỉ lưu file khi chủ động bấm Save
--==============================================================--

local ui = require("@routes/DungeonQuest/core/ui")
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local smartDodge = require("@routes/DungeonQuest/core/smartDodge")
local dungeonCatalog = require("@routes/DungeonQuest/core/dungeonCatalog")
local shared = require("@routes/DungeonQuest/core/shared")
local notifier = require("@routes/DungeonQuest/core/notifier")

return function(window, tab)
	local section = tab:Section({ Side = "Right" })
	section:Header({ Name = "Skill Timing Profiles" })

	local manager = smartDodge.skillTiming
	local TIMING_MODES = { "Default Preset", "Trained Preset" }

	local currentMode = manager.GetMode()
	local defaultModeIdx = (currentMode == "Trained Preset") and 2 or 1

	-- Mode Selector
	local modeDropdown = section:Dropdown({
		Name = "Timing Source Mode",
		Options = TIMING_MODES,
		Default = defaultModeIdx,
		Required = true,
		Callback = autoSave.Wrap(function(mode)
			manager.SetMode(mode)
		end),
	}, "Dropdown_SkillTimingMode")

	-- Map Selector
	local allDungeons = dungeonCatalog.GetDungeons() or { "Desert Temple" }
	local curSelectedMap = manager.GetSelectedMap()
	local defaultMapIdx = 1
	for i, dName in ipairs(allDungeons) do
		if dName == curSelectedMap then
			defaultMapIdx = i
			break
		end
	end

	local mapDropdown = section:Dropdown({
		Name = "Select Map Profile (Mode 2)",
		Options = allDungeons,
		Default = defaultMapIdx,
		Required = true,
		Callback = autoSave.Wrap(function(mapName)
			manager.SetSelectedMap(mapName)
		end),
	}, "Dropdown_SkillTimingSelectedMap")

	local profileStatusLabel = section:Label({
		Text = "Profile Status: <font color='rgb(0, 255, 120)'>Default Presets Active</font>",
	})

	section:Button({
		Name = "Reload Map Data to RAM",
		Callback = function()
			local curMap = manager.GetSelectedMap()
			local count = manager.LoadMapData(curMap)
			local countStr = count > 0 and ("<font color='rgb(0, 255, 120)'>" .. tostring(count) .. " skills loaded</font>")
				or "<font color='rgb(255, 160, 0)'>0 skills (No file found)</font>"
			profileStatusLabel:UpdateName("Profile Status: " .. countStr .. " for [" .. curMap .. "]")
		end,
	})

	section:Button({
		Name = "View Map Skills in Console (F9)",
		Callback = function()
			local count = manager.PrintLoadedMapData()
			notifier.Notify("Skill Timing", ("Đã in %d chiêu của Map ra Console (F9)"):format(count), 2)
		end,
	})

	-- Training Section
	section:Header({ Name = "Manual Training (Chơi Chay)" })

	local recordToggle = section:Toggle({
		Name = "Record Skill Timings (Chơi Chay)",
		Default = manager.IsRecording(),
		Callback = function(state)
			manager.SetRecordingEnabled(state)
			if state then
				-- Khởi động ĐỘC LẬP bộ quét hiểm họa để bắt nhịp chiêu thức vào RAM
				-- Tuyệt đối KHÔNG bật Safe Spot Engine, KHÔNG hiện Safe Spot ESP, KHÔNG can thiệp di chuyển né đòn
				smartDodge.SetDetectionEnabled(true)
				smartDodge.StartDetection()
			else
				-- Khi tắt Record: nếu người chơi không bật Smart Dodge Engine thì dừng hẳn bộ quét
				if not smartDodge.IsEnabled() then
					smartDodge.SetDetectionEnabled(false)
					smartDodge.StopDetection()
				end
			end
		end,
	})

	local recordStatusLabel = section:Label({
		Text = "Recording: <font color='rgb(160, 160, 160)'>Idle (0 skills, 0 hits)</font>",
	})

	section:Button({
		Name = "Save Trained Data to Map File",
		Callback = function()
			local curMap = manager.GetSelectedMap()
			local ok, count = manager.SaveRecordedData(curMap)
			if ok then
				recordStatusLabel:UpdateName("Recording: <font color='rgb(0, 255, 120)'>Saved " .. tostring(count) .. " skills to " .. curMap .. "!</font>")
			end
		end,
	})

	section:Button({
		Name = "Clear Recording Buffer",
		Callback = function()
			manager.ClearRecordedSession()
			recordStatusLabel:UpdateName("Recording: <font color='rgb(160, 160, 160)'>Buffer Cleared (0 skills, 0 hits)</font>")
		end,
	})

	section:Button({
		Name = "View Buffer in Console (F9)",
		Callback = function()
			local count = manager.PrintRecordedData()
			notifier.Notify("Skill Training", ("Đã in %d chiêu trong Buffer ra Console (F9)"):format(count), 2)
		end,
	})

	-- Lắng nghe cập nhật real-time để cập nhật Text Labels
	local function updateLabels(info)
		pcall(function()
			if info.mode == "Default Preset" then
				profileStatusLabel:UpdateName("Profile Status: <font color='rgb(0, 255, 120)'>Default Presets Active (Stable)</font>")
			else
				local curMap = info.selectedMap or manager.GetSelectedMap() or "Unknown"
				if info.loadedCount > 0 then
					profileStatusLabel:UpdateName(("Profile Status: <font color='rgb(0, 255, 120)'>%d skills</font> from [%s] in RAM"):format(info.loadedCount, curMap))
				else
					profileStatusLabel:UpdateName(("Profile Status: <font color='rgb(255, 160, 0)'>0 skills</font> (No file) for [%s]"):format(curMap))
				end
			end

			local totalSamples = info.totalSamples or manager.GetTotalSamplesCount()
			if info.isRecording then
				recordStatusLabel:UpdateName(("Recording: <font color='rgb(255, 60, 60)'>🔴 ACTIVE</font> (%d skills, %d hits in RAM)"):format(info.recordedCount, totalSamples))
			else
				recordStatusLabel:UpdateName(("Recording: <font color='rgb(160, 160, 160)'>Idle</font> (%d skills, %d hits buffered)"):format(info.recordedCount, totalSamples))
			end
		end)
	end

	manager.OnChanged(updateLabels)

	-- Khởi tạo ban đầu
	updateLabels({
		mode = manager.GetMode(),
		selectedMap = manager.GetSelectedMap(),
		loadedCount = manager.GetLoadedSkillCount(),
		isRecording = manager.IsRecording(),
		recordedCount = manager.GetRecordedSkillCount(),
		totalSamples = manager.GetTotalSamplesCount(),
	})
end
