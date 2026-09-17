-- Path Record System (DungeonQuest) – Facade: điều phối Record / Playback.
--   - Macro = 1 bản ghi cho cả MAP, record liên tục nhiều room trong 1 session
--     (tự auto-split theo room; segment phòng boss đánh dấu `boss`).
--   - Mode của map do người dùng chọn (lưu trong file macro):
--       * NORMAL (mặc định): chỉ room quái thường; BOSS ngẫu nhiên -> dùng Hazard Scanner
--         (pathRecord tự nhường quyền + auto-resume khi sang room có bản ghi).
--       * FULL: record + phát luôn cả boss room theo path đã ghi; giữ độc quyền khi boss.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local coordinator = require("@routes/DungeonQuest/core/coordinator")
local notifier = require("@routes/DungeonQuest/core/notifier")
local combatMaster = require("@routes/DungeonQuest/core/combatMaster")

local storage = require("@routes/DungeonQuest/core/pathRecord/storage")
local recorder = require("@routes/DungeonQuest/core/pathRecord/recorder")
local mover = require("@routes/DungeonQuest/core/pathRecord/player")
local visual = require("@routes/DungeonQuest/core/pathRecord/visual")
local rangeVisual = require("@routes/DungeonQuest/core/pathRecord/rangeVisual")

--// Table
local pathRecord = {}

--// State
local autoPlayWanted = false
local statusListeners = {}
local bossConnection = nil
local storageUnsub = nil
local roomUnsub = nil
local mapUnsub = nil

local function fireStatus(reason)
	local recStat = recorder.GetStatus()
	local info = {
		recording = recorder.IsRecording(),
		playing = mover.IsPlaying(),
		resume = mover.ResumeWanted(),
		autoPlayWanted = autoPlayWanted,
		inLobby = shared.IsInLobby(),
		map = shared.GetCurrentDungeonName(),
		room = shared.GetCurrentRoomIndex(),
		boss = shared.IsBossActive(),
		recordedMaps = storage.Count(),
		pointCount = recorder.IsRecording() and recStat.pointCount or 0,
		reason = reason,
	}
	for _, cb in ipairs(statusListeners) do
		pcall(cb, info)
	end
end

--// Timeline record/replay: đứng chờ (dwell) + kích hoạt skill (chuột phải) + facing.
local timelineCapture = true
local timelineReplay = true

function pathRecord.IsTimelineCaptureEnabled()
	return timelineCapture
end

function pathRecord.SetTimelineCapture(state)
	timelineCapture = state and true or false
	recorder.SetCapture(timelineCapture)
	fireStatus("timeline")
end

function pathRecord.IsTimelineReplayEnabled()
	return timelineReplay
end

function pathRecord.SetTimelineReplay(state)
	timelineReplay = state and true or false
	mover.SetReplayTimeline(timelineReplay)
	fireStatus("timeline")
end

--// Ép tốc chạy = tốc độ record khi phát (khớp thời gian skill/dừng, mặc định bật).
function pathRecord.IsSpeedMatchEnabled()
	return mover.IsSpeedMatchEnabled()
end

function pathRecord.SetSpeedMatch(state)
	mover.SetSpeedMatch(state and true or false)
	fireStatus("speedmatch")
end

--// Dùng tốc độ Fast Speed từ tab Combat/Player khi phát macro
function pathRecord.IsUseFastSpeedEnabled()
	return mover.IsUseFastSpeedEnabled()
end

function pathRecord.SetUseFastSpeed(state)
	mover.SetUseFastSpeed(state and true or false)
	fireStatus("usefastspeed")
end

--// Tự động Retry dungeon khi chết quá 5 lần trong cùng 1 room thường (macro lỗi/không clear được quái)
function pathRecord.IsAutoRetryOnDeathLimitEnabled()
	return mover.IsAutoRetryOnDeathLimitEnabled()
end

function pathRecord.SetAutoRetryOnDeathLimit(state)
	mover.SetAutoRetryOnDeathLimit(state and true or false)
	fireStatus("retryondeath")
end

--// Thời gian xoay đón đầu Pre-Aim trước khi tới mốc skill / dwell (0.1s - 1.5s).
function pathRecord.GetPreAimTime()
	return mover.GetPreAimTime()
end

function pathRecord.SetPreAimTime(seconds)
	mover.SetPreAimTime(seconds)
	fireStatus("preaim")
end

--// Giữ facing sau khi xả skill khi đang đi (0.5s - 2s) để game kịp ghi nhận hướng cast.
function pathRecord.GetSkillFaceHold()
	return mover.GetSkillFaceHold()
end

function pathRecord.SetSkillFaceHold(seconds)
	mover.SetSkillFaceHold(seconds)
	fireStatus("facehold")
end

--// Khoảng nghỉ giữa 2 lần click khi double-cast skill (0.001s - 0.1s).
function pathRecord.GetDoubleClickDelay()
	return mover.GetDoubleClickDelay()
end

function pathRecord.SetDoubleClickDelay(seconds)
	mover.SetDoubleClickDelay(seconds)
	fireStatus("doubleclick")
end

--// Thời gian dừng chờ tại node xuất phát (Start Node).
function pathRecord.GetStartPauseTime()
	return mover.GetStartPauseTime()
end

function pathRecord.SetStartPauseTime(seconds)
	mover.SetStartPauseTime(seconds)
	fireStatus("startpause")
end

--// Aim/hướng cho chiêu Q (mặc định tắt vì Q là Buff)
function pathRecord.IsAimSkillQEnabled()
	return mover.IsAimSkillQEnabled()
end

function pathRecord.SetAimSkillQ(state)
	mover.SetAimSkillQ(state and true or false)
	fireStatus("aimskillq")
end

--// Aim/hướng cho chiêu E (mặc định bật vì E là Attack)
function pathRecord.IsAimSkillEEnabled()
	return mover.IsAimSkillEEnabled()
end

function pathRecord.SetAimSkillE(state)
	mover.SetAimSkillE(state and true or false)
	fireStatus("aimskille")
end


--// ---------- Record ----------

function pathRecord.ToggleRecord(state)
	if state then
		if recorder.IsRecording() then return true end
		if mover.IsPlaying() then mover.Stop() end

		local ok, err = recorder.Start()
		if not ok then
			notifier.Notify("Path Record", "Failed to start record: " .. tostring(err), 3)
		end
		fireStatus()
		return ok
	else
		local was = recorder.IsRecording()
		recorder.Stop()
		fireStatus()
		return was
	end
end

function pathRecord.IsRecording()
	return recorder.IsRecording()
end

--// Room hiện tại đã có segment trong macro chưa? (để xác nhận trước khi record ghi đè)
function pathRecord.CurrentRoomHasRecord()
	return storage.HasSegmentOrMacro(shared.GetCurrentDungeonName(), shared.GetCurrentRoomIndex())
end

--// ---------- Map Mode (NORMAL / FULL) ----------

--// Mode cho 1 map: "normal" (skip boss, dùng Hazard Scanner) hoặc "full" (record + phát cả boss room).
function pathRecord.GetMapMode(mapName)
	return storage.GetMapMode(mapName)
end

function pathRecord.SetMapMode(mapName, mode)
	if storage.SetMapMode(mapName, mode) then
		fireStatus("mode")
	end
end

--// ---------- Playback ----------

--// Flag persists "wants to auto-play macro" (được lưu qua config, không phải runtime state).
--// Khi bật: đang ở dungeon có macro -> phát ngay; phòng boss đang active -> bỏ qua nếu mode NORMAL.
--// Giữ nguyên trạng thái armed khi ở lobby hoặc khi room đang load.

function pathRecord.IsAutoPlayWanted()
	return autoPlayWanted
end

function pathRecord.TogglePlay(state)
	autoPlayWanted = state and true or false

	if autoPlayWanted then
		if mover.IsPlaying() then
			fireStatus("already_playing")
			return true
		end
		if recorder.IsRecording() then
			recorder.Stop()
		end

		if shared.IsInLobby() then
			fireStatus("armed_lobby")
			return true
		end

		local map = shared.GetCurrentDungeonName()
		local room = shared.GetCurrentRoomIndex()

		if not map or #map == 0 or room <= 0 then
			fireStatus("armed_waiting")
			return true
		end

		if shared.IsBossActive() and storage.GetMapMode(map) ~= "full" then
			fireStatus("armed_boss")
			return true
		end

		if storage.HasSegmentOrMacro(map, room) then
			coordinator.EnableExclusive("PathRecord")
			mover.Start()
		end

		fireStatus("play_started")
		return true
	else
		local was = mover.IsPlaying()
		mover.Stop()
		fireStatus("play_stopped")
		return was
	end
end

function pathRecord.IsPlaying()
	return mover.IsPlaying()
end

--// Chủ quyền di chuyển = playback (record chỉ quan sát, không điều khiển nhân vật).
function pathRecord.IsEnabled()
	return mover.IsPlaying()
end

--// ---------- Skill Range Visual (Vòng tròn quanh nhân vật) ----------

function pathRecord.SetRangeVisual(state)
	rangeVisual.SetEnabled(state)
	fireStatus("rangevisual")
end

function pathRecord.IsRangeVisualEnabled()
	return rangeVisual.IsEnabled()
end

function pathRecord.SetRangeVisualRadius(radius)
	rangeVisual.SetRadius(radius)
	fireStatus("rangeradius")
end

function pathRecord.GetRangeVisualRadius()
	return rangeVisual.GetRadius()
end

function pathRecord.SetRangeVisualFill(state)
	rangeVisual.SetFillEnabled(state)
	fireStatus("rangefill")
end

function pathRecord.IsRangeVisualFillEnabled()
	return rangeVisual.IsFillEnabled()
end

function pathRecord.SetHighlightInRange(state)
	rangeVisual.SetHighlightInRange(state)
	fireStatus("rangehighlight")
end

function pathRecord.IsHighlightInRangeEnabled()
	return rangeVisual.IsHighlightInRangeEnabled()
end

function pathRecord.GetRangeColorNames()
	return rangeVisual.GetColorNames()
end

function pathRecord.GetSelectedCircleColor()
	return rangeVisual.GetSelectedCircleColor()
end

function pathRecord.SetCircleColor(name)
	rangeVisual.SetCircleColor(name)
	fireStatus("circlecolor")
end

function pathRecord.GetSelectedHighlightColor()
	return rangeVisual.GetSelectedHighlightColor()
end

function pathRecord.SetHighlightColor(name)
	rangeVisual.SetHighlightColor(name)
	fireStatus("highlightcolor")
end

--// ---------- Path 3D Visualizer (Sphere Nodes & Lines) ----------

function pathRecord.SetVisualEnabled(state)
	visual.SetEnabled(state)
	fireStatus("visual")
end

function pathRecord.IsVisualEnabled()
	return visual.IsEnabled()
end

function pathRecord.SetVisualShowLines(state)
	visual.SetShowLines(state)
	fireStatus("visuallines")
end

function pathRecord.IsVisualShowLinesEnabled()
	return visual.IsShowLinesEnabled()
end

function pathRecord.SetVisualNodeRadius(radius)
	visual.SetNodeRadius(radius)
	fireStatus("visualradius")
end

function pathRecord.GetVisualNodeRadius()
	return visual.GetNodeRadius()
end

function pathRecord.SetVisualAlwaysOnTop(state)
	visual.SetAlwaysOnTop(state)
	fireStatus("visualontop")
end

function pathRecord.IsVisualAlwaysOnTopEnabled()
	return visual.IsAlwaysOnTopEnabled()
end

function pathRecord.SetVisualShowEvents(state)
	visual.SetShowEvents(state)
	fireStatus("visualevents")
end

function pathRecord.IsVisualShowEventsEnabled()
	return visual.IsShowEventsEnabled()
end

function pathRecord.SetVisualShowFacing(state)
	visual.SetShowFacingRays(state)
	fireStatus("visualfacing")
end

function pathRecord.IsVisualShowFacingEnabled()
	return visual.IsShowFacingRaysEnabled()
end

--// ---------- Storage passthrough ----------

function pathRecord.GetMaps()
	return storage.GetMaps()
end

function pathRecord.GetMacro(mapName)
	return storage.GetMap(mapName)
end

function pathRecord.RemoveMap(mapName)
	storage.RemoveMap(mapName)
	fireStatus("removed")
end

function pathRecord.ClearAll()
	storage.ClearAll()
	fireStatus("cleared")
end

function pathRecord.ReloadFromDisk()
	storage.ReloadFromDisk()
	fireStatus("reloaded")
end

--// ---------- Status ----------

function pathRecord.GetStatus()
	local recStat = recorder.GetStatus()
	local playStat = mover.GetStatus()
	return {
		recording = recorder.IsRecording(),
		playing = mover.IsPlaying(),
		resume = mover.ResumeWanted(),
		autoPlayWanted = autoPlayWanted,
		inLobby = shared.IsInLobby(),
		map = shared.GetCurrentDungeonName(),
		room = shared.GetCurrentRoomIndex(),
		boss = shared.IsBossActive(),
		recordedMaps = storage.Count(),
		pointCount = recStat.pointCount,
		dwellCount = recStat.dwellCount or 0,
		skillCount = recStat.skillCount or 0,
		progressPercent = playStat.progressPercent or 0,
		progressStuds = playStat.progressStuds or 0,
		totalStuds = playStat.totalStuds or 0,
	}
end

function pathRecord.OnStatusChanged(callback)
	if type(callback) ~= "function" then
		return function() end
	end
	table.insert(statusListeners, callback)
	return function()
		for i, listener in ipairs(statusListeners) do
			if listener == callback then
				table.remove(statusListeners, i)
				break
			end
		end
	end
end

--// ---------- Autonomous behavior ----------

--// Vào / ra boss room:
--//   - Mode FULL: đang phát -> giữ/giành độc quyền (đi path đã record qua boss);
--//     đang chờ resume hoặc autoPlayWanted -> gọi phát lại luôn vào boss room có segment.
--//   - Mode NORMAL (Skip Boss):
--//     * Khi vào boss: tạm dừng path playback + BẬT Master Combat (Auto Farm + Dodge + Skill).
--//     * Khi diệt boss xong: TẮT Master Combat + tự động resume macro nếu còn waypoint.
bossConnection = shared.OnBossActiveChanged(function(active)
	local map = mover.GetActiveMap() or shared.GetCurrentDungeonName()
	local isFullMode = map and storage.GetMapMode(map) == "full"

	if active then
		if isFullMode then
			if mover.ResumeWanted() or autoPlayWanted then
				local room = shared.GetCurrentRoomIndex()
				if room > 0 and storage.HasSegmentOrMacro(map, room) then
					coordinator.EnableExclusive("PathRecord")
					mover.Start()
					fireStatus("boss")
				end
			elseif mover.IsPlaying() then
				coordinator.EnableExclusive("PathRecord")
			end
			return
		end

		-- Mode NORMAL (Skip Boss)
		if mover.IsPlaying() or mover.ResumeWanted() or autoPlayWanted then
			mover.PauseForExclusive()
			if combatMaster.IsAutoBossCombatEnabled() then
				combatMaster.Toggle(true, true)
				notifier.Notify("Path Record", "Boss Room: Combat Master enabled (Auto Farm + Dodge + Skill)", 3)
			else
				notifier.Notify("Path Record", "Boss Room: Paused, using Hazard Scanner", 3)
			end
			fireStatus("boss")
		end
	else
		-- Boss đã bị hạ gục (active == false)
		if not isFullMode then
			if combatMaster.IsAutoTriggeredByBoss() then
				combatMaster.Toggle(false)
				notifier.Notify("Path Record", "Boss Defeated: Combat Master disabled", 3)
			end

			if autoPlayWanted or mover.ResumeWanted() then
				task.delay(0.5, function()
					if not autoPlayWanted and not mover.ResumeWanted() then return end
					if mover.IsPlaying() or recorder.IsRecording() then return end
					local curMap = shared.GetCurrentDungeonName()
					local curRoom = shared.GetCurrentRoomIndex()
					if curMap and curRoom > 0 and storage.HasSegmentOrMacro(curMap, curRoom) then
						coordinator.EnableExclusive("PathRecord")
						mover.Start()
						fireStatus("resumed")
					end
				end)
			end
		end
	end
end)

--// Bản ghi thay đổi -> cập nhật UI.
storageUnsub = storage.OnChanged(function()
	fireStatus("storage")
end)

--// Auto-resume & Auto-play: khi sang room mới có segment trong macro -> tự động phát tiếp.
--// Room boss được auto-resume chỉ khi map ở mode FULL (room đó đã được record).
roomUnsub = shared.OnRoomIndexChanged(function(room)
	-- Luôn tắt CombatMaster nếu mục tiêu hiện tại không phải Boss hoặc đã rời phòng Boss
	if not shared.IsBossActive() and (combatMaster.IsAutoTriggeredByBoss() or combatMaster.IsEnabled()) then
		combatMaster.Toggle(false)
	end

	if not autoPlayWanted and not mover.ResumeWanted() then return end

	local curRoom = room or shared.GetCurrentRoomIndex()
	if curRoom <= 0 or shared.IsInLobby() or shared.IsDead() then return end

	local map = shared.GetCurrentDungeonName()
	if not map or #map == 0 then return end
	if mover.GetActiveMap() and mover.GetActiveMap() ~= map then return end
	if shared.IsBossActive() and storage.GetMapMode(map) ~= "full" then return end

	if not storage.HasSegmentOrMacro(map, curRoom) then return end

	if not mover.IsPlaying() then
		coordinator.EnableExclusive("PathRecord")
		mover.Start()
		fireStatus("resumed")
	end
end)

--// Đổi map giữa chừng: commit nốt record đang dở + dọn trạng thái playback map cũ.
--// Khi vào map mới và autoPlayWanted bật: nếu room 1 đã có macro -> tự động khởi chạy.
mapUnsub = shared.OnDungeonNameChanged(function(name)
	if combatMaster.IsAutoTriggeredByBoss() or combatMaster.IsEnabled() then
		combatMaster.Toggle(false)
	end
	if recorder.IsRecording() then
		recorder.Stop("map change")
	end
	if mover.IsPlaying() or mover.ResumeWanted() then
		local currentMap = mover.GetActiveMap()
		if currentMap and currentMap ~= name then
			mover.Stop()
		end
	end
	if autoPlayWanted and name and #name > 0 then
		task.delay(0.3, function()
			if not autoPlayWanted or mover.IsPlaying() or recorder.IsRecording() then return end
			local room = shared.GetCurrentRoomIndex()
			if room > 0 and storage.HasSegmentOrMacro(name, room) then
				if not (shared.IsBossActive() and storage.GetMapMode(name) ~= "full") then
					coordinator.EnableExclusive("PathRecord")
					mover.Start()
					fireStatus("map_autoplay")
				end
			end
		end)
	end
	fireStatus("map")
end)

recorder.SetCapture(timelineCapture)
mover.SetReplayTimeline(timelineReplay)

--// ---------- Coordinator & Lifecycle ----------

--// Hệ thống khác chiếm độc quyền (HazardScanner/AutoFarm...) -> nhường + auto-resume.
coordinator.Register("PathRecord", function(state)
	if not state then
		mover.PauseForExclusive()
	end
	fireStatus("disabled")
end, pathRecord.IsEnabled)

--// Startup: nếu autoPlayWanted (từ config) và đang ở dungeon có macro -> auto-play.
task.delay(1.0, function()
	if autoPlayWanted and not mover.IsPlaying() and not recorder.IsRecording() then
		local map = shared.GetCurrentDungeonName()
		if map and #map > 0 and not shared.IsInLobby() then
			if storage.HasSegmentOrMacro(map, shared.GetCurrentRoomIndex()) then
				pathRecord.TogglePlay(true)
			end
		end
	end
end)

lifecycle.Register(function()
	mover.Stop()
	recorder.Cancel()
	visual.Clear()
	if bossConnection then bossConnection(); bossConnection = nil end
	if roomUnsub then roomUnsub(); roomUnsub = nil end
	if mapUnsub then mapUnsub(); mapUnsub = nil end
	if storageUnsub then storageUnsub(); storageUnsub = nil end
end)

return pathRecord