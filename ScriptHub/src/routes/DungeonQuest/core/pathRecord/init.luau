-- Path Record System (DungeonQuest) – Facade: điều phối Record / Playback.
--   - Macro = 1 bản ghi cho cả MAP, chứa toàn bộ ROOM QUÁI THƯỜNG.
--   - Chỉ hoạt động với room quái thường; BOSS ngẫu nhiên -> dùng SmartDodge
--     (pathRecord tự nhường quyền và auto-resume khi sang room có bản ghi).

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

--// Giữ facing sau khi xả skill khi đang đi (0.5s - 2s) để game kịp ghi nhận hướng cast.
function pathRecord.GetSkillFaceHold()
	return mover.GetSkillFaceHold()
end

function pathRecord.SetSkillFaceHold(seconds)
	mover.SetSkillFaceHold(seconds)
	fireStatus("facehold")
end

--// State
local statusListeners = {}
local bossConnection = nil
local drawConnection = nil
local storageUnsub = nil
local roomUnsub = nil
local mapUnsub = nil

local function fireStatus(reason)
	local info = {
		recording = recorder.IsRecording(),
		playing = mover.IsPlaying(),
		resume = mover.ResumeWanted(),
		map = shared.GetCurrentDungeonName(),
		room = shared.GetCurrentRoomIndex(),
		boss = shared.IsBossActive(),
		recordedMaps = storage.Count(),
		pointCount = recorder.IsRecording() and recorder.GetStatus().pointCount or 0,
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

--// ---------- Playback ----------

function pathRecord.TogglePlay(state)
	if state then
		if mover.IsPlaying() then return true end
		if recorder.IsRecording() then recorder.Stop() end

		--// Pre-check trước khi chiếm độc quyền, tránh tự tắt hệ thống khác
		--// (AutoFarm/SmartDodge) nhưng rồi playback lại không chạy được.
		if shared.IsInLobby() then
			notifier.Notify("Path Record", "Không phát được: đang ở lobby", 3)
			fireStatus()
			return false
		end
		if shared.IsBossActive() then
			notifier.Notify("Path Record", "Không phát được: boss room (hãy dùng Smart Dodge)", 3)
			fireStatus()
			return false
		end

		--// Pre-check segment để KHÔNG chiếm độc quyền (không tự tắt AutoFarm/
		--// SmartDodge) trong khi room hiện tại chưa có bản ghi để chạy.
		local mapN = shared.GetCurrentDungeonName()
		if not mapN or #mapN == 0 then
			notifier.Notify("Path Record", "Không phát được: không xác định được map", 3)
			fireStatus()
			return false
		end
		if not storage.HasSegmentOrMacro(mapN, shared.GetCurrentRoomIndex()) then
			notifier.Notify("Path Record", "Không phát được: room này chưa có bản ghi trong macro", 3)
			fireStatus()
			return false
		end

		--// Playback điều khiển nhân vật -> chiếm độc quyền, tắt các hệ thống khác.
		coordinator.EnableExclusive("PathRecord")

		local ok, err = mover.Start()
		if not ok then
			notifier.Notify("Path Record", "Không phát được: " .. tostring(err), 3)
		end
		fireStatus()
		return ok
	else
		local was = mover.IsPlaying()
		mover.Stop()
		fireStatus()
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

--// ---------- Status ----------

function pathRecord.GetStatus()
	local recStat = recorder.GetStatus()
	return {
		recording = recorder.IsRecording(),
		playing = mover.IsPlaying(),
		resume = mover.ResumeWanted(),
		map = shared.GetCurrentDungeonName(),
		room = shared.GetCurrentRoomIndex(),
		boss = shared.IsBossActive(),
		recordedMaps = storage.Count(),
		pointCount = recStat.pointCount,
	}
end

function pathRecord.OnStatusChanged(callback)
	if type(callback) == "function" then
		table.insert(statusListeners, callback)
	end
end

--// ---------- Autonomous behavior ----------

--// Vào boss room khi đang phát -> chỉ báo + đứng yên (dùng SmartDodge).
--// Nếu bật SmartDodge, nó chiếm độc quyền -> pathRecord nhường và auto-resume.
bossConnection = shared.OnBossActiveChanged(function(active)
	if active and mover.IsPlaying() then
		notifier.Notify("Path Record", "Boss room: tạm dừng, dùng Smart Dodge", 3)
		fireStatus("boss")
	end
end)

--// Bản ghi thay đổi -> cập nhật UI.
storageUnsub = storage.OnChanged(function()
	fireStatus("storage")
end)

--// Auto-resume: đang chờ (do nhường quyền cho hệ thống khác giữa chừng) mà sang
--// được room quái thường có segment trong macro của map đang chạy -> phát tiếp nốt lượt.
roomUnsub = shared.OnRoomIndexChanged(function()
	if not mover.ResumeWanted() then return end

	local room = shared.GetCurrentRoomIndex()
	if room <= 0 or shared.IsInLobby() or shared.IsBossActive() or shared.IsDead() then return end

	local map = shared.GetCurrentDungeonName()
	if not map or #map == 0 then return end
	if mover.GetActiveMap() and mover.GetActiveMap() ~= map then return end
	if not storage.HasSegmentOrMacro(map, room) then return end

	coordinator.EnableExclusive("PathRecord")
	mover.Start() -- Resume; lỗi nhỏ (race) thì bỏ qua, room event tiếp theo sẽ thử lại.
	fireStatus("resumed")
end)

--// Đổi map giữa chừng: hủy ý định resume + dừng nếu đang phát/đang record.
mapUnsub = shared.OnDungeonNameChanged(function(name)
	if recorder.IsRecording() then
		recorder.Cancel()
		notifier.Notify("Path Record", "Đổi map: hủy record đang dở", 3)
	end
	if mover.ResumeWanted() and (not mover.GetActiveMap() or mover.GetActiveMap() ~= name) then
		mover.Stop()
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
		buildKey = "rec:" .. #recorder.GetCurrentPoints()
	elseif mover.IsPlaying() then
		buildKey = "play:" .. tostring(room) .. ":" .. macroStamp(map)
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
		--// Đang play: vẽ segment của room hiện tại (đã làm mịn như lúc đi).
		if map and room > 0 then
			local seg = storage.GetRoomSegment(map, room)
			if seg and #seg.points >= 2 then
				polys[1] = {
					points = storage.SimplifyPath(seg.points, 1.0),
					color = theme.play,
					tag = "play_" .. tostring(room),
				}
			end
		end
	else
		--// Idle: xem trước toàn bộ macro của map hiện tại.
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
					if seg and #seg.points >= 2 then
						polys[#polys + 1] = {
							points = storage.SimplifyPath(seg.points, 1.0),
							color = theme.idle,
							tag = "macro_" .. tostring(r),
						}
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