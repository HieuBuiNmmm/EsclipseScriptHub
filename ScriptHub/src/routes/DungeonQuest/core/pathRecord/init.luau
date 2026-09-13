-- Path Record System (DungeonQuest) – Facade: điều phối Record / Playback.
--   - Macro = 1 bản ghi cho cả MAP, record liên tục nhiều room trong 1 session
--     (tự auto-split theo room; segment phòng boss đánh dấu `boss`).
--   - Mode của map do người dùng chọn (lưu trong file macro):
--       * NORMAL (mặc định): chỉ room quái thường; BOSS ngẫu nhiên -> dùng SmartDodge
--         (pathRecord tự nhường quyền + auto-resume khi sang room có bản ghi).
--       * FULL: record + phát luôn cả boss room theo path đã ghi; giữ độc quyền khi boss.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local coordinator = require("@routes/DungeonQuest/core/coordinator")
local notifier = require("@routes/DungeonQuest/core/notifier")

local storage = require("@routes/DungeonQuest/core/pathRecord/storage")
local recorder = require("@routes/DungeonQuest/core/pathRecord/recorder")
local mover = require("@routes/DungeonQuest/core/pathRecord/player")
local visual = require("@routes/DungeonQuest/core/pathRecord/visual")
local rangeVisual = require("@routes/DungeonQuest/core/pathRecord/rangeVisual")

local RunService = services.RunService

--// Table
local pathRecord = {}

--// Settings
local showVisual = true

--// Bộ màu line path (dropdown trong tab) + style kích thước (slider).
local DEFAULT_THEME = "Default (Red/Cyan/Teal)"
local THEMES = {
	[DEFAULT_THEME] = {
		rec = Color3.fromRGB(255, 60, 60),
		play = Color3.fromRGB(0, 230, 255),
		idle = Color3.fromRGB(90, 190, 200),
	},
	["Oceana"] = {
		rec = Color3.fromRGB(0, 190, 255),
		play = Color3.fromRGB(80, 255, 220),
		idle = Color3.fromRGB(120, 210, 255),
	},
	["Sunset"] = {
		rec = Color3.fromRGB(255, 120, 60),
		play = Color3.fromRGB(255, 220, 80),
		idle = Color3.fromRGB(255, 150, 160),
	},
	["Emerald"] = {
		rec = Color3.fromRGB(80, 255, 140),
		play = Color3.fromRGB(0, 220, 120),
		idle = Color3.fromRGB(140, 255, 180),
	},
	["Violet"] = {
		rec = Color3.fromRGB(200, 90, 255),
		play = Color3.fromRGB(170, 120, 255),
		idle = Color3.fromRGB(150, 150, 255),
	},
}

local visualStyle = {
	thickness = 3,
	transparency = 0.25, --// 0 = đậm nhất, 0.9 = gần như mất
	theme = DEFAULT_THEME,
}

function pathRecord.GetStyle()
	return {
		thickness = visualStyle.thickness,
		transparency = visualStyle.transparency,
		theme = visualStyle.theme,
	}
end

function pathRecord.GetThemeNames()
	local names = {}
	for name in pairs(THEMES) do
		names[#names + 1] = name
	end
	table.sort(names)
	return names
end

--// Áp style mới (từ slider/dropdown) -> đẩy sang visual + ép redraw sớm nhất.
function pathRecord.SetStyle(update)
	if type(update) ~= "table" then return end
	if update.thickness ~= nil then visualStyle.thickness = math.clamp(update.thickness, 1, 10) end
	if update.transparency ~= nil then visualStyle.transparency = math.clamp(update.transparency, 0, 0.9) end
	if update.theme and THEMES[update.theme] then visualStyle.theme = update.theme end
	visual.SetStyle({ thickness = visualStyle.thickness, transparency = visualStyle.transparency })
	lastBuildKey = nil
	fireStatus("style")
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

--// State
local statusListeners = {}
local bossConnection = nil
local drawConnection = nil
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
		phase = mover.IsPlaying() and mover.GetCurrentPhaseIndex() or (recorder.IsRecording() and recStat.phaseCount or 1),
		reason = reason,
	}
	for _, cb in ipairs(statusListeners) do
		pcall(cb, info)
	end
end

--// ---------- Record ----------

function pathRecord.ToggleRecord(state)
	if state then
		if recorder.IsRecording() then return true end
		if mover.IsPlaying() then mover.Stop() end

		local ok, err = recorder.Start()
		if not ok then
			notifier.Notify("Path Record", "Không bắt đầu record: " .. tostring(err), 3)
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

--// Mode cho 1 map: "normal" (skip boss, dùng SmartDodge) hoặc "full" (record + phát cả boss room).
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
local autoPlayWanted = false

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

--// ---------- Settings ----------

function pathRecord.SetShowVisual(state)
	showVisual = state and true or false
	if not showVisual then visual.Clear() end
	fireStatus()
end

function pathRecord.IsShowVisualEnabled()
	return showVisual
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
		phase = mover.IsPlaying() and mover.GetCurrentPhaseIndex() or (recorder.IsRecording() and recStat.phaseCount or 1),
	}
end

function pathRecord.OnStatusChanged(callback)
	if type(callback) == "function" then
		table.insert(statusListeners, callback)
	end
end

--// ---------- Autonomous behavior ----------

--// Vào boss room:
--//   - Mode FULL: đang phát -> giữ/giành độc quyền (đi path đã record qua boss);
--//     đang chờ resume hoặc autoPlayWanted -> gọi phát lại luôn vào boss room có segment.
--//   - Mode NORMAL: chỉ báo + đứng yên (dùng SmartDodge); nếu bật SmartDodge nó chiếm
--//     độc quyền -> pathRecord nhường và auto-resume khi sang room thường.
bossConnection = shared.OnBossActiveChanged(function(active)
	if not active then return end

	if mover.ResumeWanted() or autoPlayWanted then
		local map = mover.GetActiveMap() or shared.GetCurrentDungeonName()
		if map and storage.GetMapMode(map) == "full" then
			local room = shared.GetCurrentRoomIndex()
			if room > 0 and storage.HasSegmentOrMacro(map, room) then
				coordinator.EnableExclusive("PathRecord")
				mover.Start()
				fireStatus("boss")
			end
		end
		return
	end

	if mover.IsPlaying() then
		local map = mover.GetActiveMap() or shared.GetCurrentDungeonName()
		if map and storage.GetMapMode(map) == "full" then
			coordinator.EnableExclusive("PathRecord")
		else
			notifier.Notify("Path Record", "Boss room: tạm dừng, dùng Smart Dodge", 3)
			fireStatus("boss")
		end
	end
end)

--// Bản ghi thay đổi -> cập nhật UI.
storageUnsub = storage.OnChanged(function()
	fireStatus("storage")
end)

--// Auto-resume & Auto-play: khi sang room mới có segment trong macro -> tự động phát tiếp.
--// Room boss được auto-resume chỉ khi map ở mode FULL (room đó đã được record).
roomUnsub = shared.OnRoomIndexChanged(function()
	if not autoPlayWanted and not mover.ResumeWanted() then return end

	local room = shared.GetCurrentRoomIndex()
	if room <= 0 or shared.IsInLobby() or shared.IsDead() then return end

	local map = shared.GetCurrentDungeonName()
	if not map or #map == 0 then return end
	if mover.GetActiveMap() and mover.GetActiveMap() ~= map then return end
	if shared.IsBossActive() and storage.GetMapMode(map) ~= "full" then return end
	if not storage.HasSegmentOrMacro(map, room) then return end

	if not mover.IsPlaying() then
		coordinator.EnableExclusive("PathRecord")
		mover.Start()
		fireStatus("resumed")
	end
end)

--// Đổi map giữa chừng: commit nốt record đang dở + dọn trạng thái playback map cũ.
--// Khi vào map mới và autoPlayWanted bật: nếu room 1 đã có macro -> tự động khởi chạy.
mapUnsub = shared.OnDungeonNameChanged(function(name)
	if recorder.IsRecording() then
		recorder.Stop("đổi map")
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

--// Render quỹ đạo: đỏ (record), cyan (play), xanh nhạt (xem trước macro khi idle).
--// Tối ưu: dùng "chìa khoá tín hiệu" (cheap, KHÔNG decode) -> chỉ decode + dựng
--// polyline khi tín hiệu ĐỔI; trước đây decode toàn bộ macro + dựng object mỗi frame.
--// Tổng số LineHandleAdornment cũng giảm mạnh nhờ làm mịn trước khi vẽ.
local function macroStamp(map)
	if not map or #map == 0 then return "-" end
	for _, rec in ipairs(storage.GetMaps()) do
		if rec.map == map then
			return tostring(rec.updated or "-") .. ":" .. tostring(rec.roomCount)
		end
	end
	return "-"
end

local lastDrawTag = nil
local lastBuildKey = nil
visual.SetStyle({ thickness = visualStyle.thickness, transparency = visualStyle.transparency })
recorder.SetCapture(timelineCapture)
mover.SetReplayTimeline(timelineReplay)
drawConnection = RunService.Heartbeat:Connect(function()
	if not showVisual then
		if lastDrawTag then visual.Clear(); lastDrawTag = nil end
		return
	end

	local map = shared.GetCurrentDungeonName()
	local room = shared.GetCurrentRoomIndex()

	local buildKey
	if recorder.IsRecording() then
		buildKey = "rec:" .. recorder.GetCurrentPhaseIndex() .. ":" .. #recorder.GetCurrentPoints()
	elseif mover.IsPlaying() then
		buildKey = "play:" .. tostring(room) .. ":" .. mover.GetCurrentPhaseIndex() .. ":" .. macroStamp(map)
	else
		buildKey = "idle:" .. macroStamp(map)
	end
	if buildKey == lastBuildKey then return end
	lastBuildKey = buildKey

	local theme = THEMES[visualStyle.theme] or THEMES[DEFAULT_THEME]
	local polys = {}

	if recorder.IsRecording() then
		--// Đang record: vẽ segment hiện tại màu sắc theo theme (points là Vector3 sống, không decode).
		local pts = recorder.GetCurrentPoints()
		if #pts >= 2 then
			polys[1] = { points = pts, color = theme.rec, tag = "rec" }
		end
	elseif mover.IsPlaying() then
		--// Đang play: vẽ segment/phase của room hiện tại (đã làm mịn như lúc đi).
		if map and room > 0 then
			local seg = storage.GetRoomSegment(map, room)
			if seg then
				local phases = seg.phases or { seg }
				local curPIdx = mover.GetCurrentPhaseIndex() or 1
				local pData = phases[math.min(curPIdx, #phases)] or seg
				if pData and pData.points and #pData.points >= 2 then
					polys[1] = {
						points = storage.SimplifyPath(pData.points, 0.4),
						color = theme.play,
						tag = ("play_%s_p%d"):format(tostring(room), curPIdx),
					}
				end
			end
		end
	else
		--// Idle: xem trước toàn bộ macro của map hiện tại (bao gồm các phase).
		if map then
			local macro = storage.GetMap(map)
			if macro then
				local roomKeys = {}
				for r in pairs(macro.rooms) do
					roomKeys[#roomKeys + 1] = r
				end
				table.sort(roomKeys)
				for _, r in ipairs(roomKeys) do
					local seg = macro.rooms[r]
					if seg then
						local phases = seg.phases or { seg }
						for pIdx, pData in ipairs(phases) do
							if pData and pData.points and #pData.points >= 2 then
								polys[#polys + 1] = {
									points = storage.SimplifyPath(pData.points, 0.4),
									color = seg.boss and Color3.fromRGB(255, 140, 255) or theme.idle,
									tag = ("macro_%s_p%d"):format(tostring(r), pIdx),
								}
							end
						end
					end
				end
			end
		end
	end

	if #polys > 0 then
		--// Key theo nội dung để visual tự skip rebuild (throttle 0.4s).
		local parts = {}
		for _, p in ipairs(polys) do
			parts[#parts + 1] = (p.tag or "x") .. ":" .. #p.points
		end
		visual.DrawPolylines(polys, table.concat(parts, "|"))
		lastDrawTag = "drawn"
	elseif lastDrawTag then
		visual.Clear()
		lastDrawTag = nil
	end
end)

--// ---------- Coordinator & Lifecycle ----------

--// Hệ thống khác chiếm độc quyền (SmartDodge/AutoFarm...) -> nhường + auto-resume.
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
	if drawConnection then drawConnection:Disconnect(); drawConnection = nil end
	if roomUnsub then roomUnsub(); roomUnsub = nil end
	if mapUnsub then mapUnsub(); mapUnsub = nil end
	if storageUnsub then storageUnsub(); storageUnsub = nil end
end)

return pathRecord