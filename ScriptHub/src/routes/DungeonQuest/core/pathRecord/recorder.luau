-- Path Record System – Recorder: ghi 1 SESSION liên tục cho toàn map.
--   - Bấm Record 1 lần ở map = ghi NHIỀU room: khi CHUYỂN ROOM tự "rollover"
--     (lưu segment room cũ + mở slice mới cho room mới tại vị trí cạnh cửa).
--   - TỰ TẮT + lưu khi về LOBBY (hết map), vào BOSS (mode NORMAL), hoặc giới hạn điểm.
--   - Mode FULL của map: cho phép record qua luôn BOSS room (segment đánh dấu `boss: true`).
--   - Mỗi slice gộp vào macro của MAP (mỗi room 1 segment; ghi lại room nào thì ghi
--     đè segment cũ của room đó). Macro = toàn bộ room đã record của map.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local storage = require("@routes/DungeonQuest/core/pathRecord/storage")
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local notifier = require("@routes/DungeonQuest/core/notifier")

local RunService = services.RunService
local player = services.player
local UserInputService = services.UserInputService

--// Constants
local MIN_SPACING = 0.1 -- Studs tối thiểu giữa 2 điểm khi ghi (bắt siêu mịn để khớp tuyệt đối vị trí)
local MAX_POINTS = 8000 -- Giới hạn điểm 1 segment
local SIMPLIFY_TOL = 0.4 -- Studs: dung sai làm mịn Douglas-Peucker khi lưu (độ chính xác cao)
local DWELL_MIN = 0.1 -- Giây đứng yên tối thiểu mới ghi event "dừng" (bắt siêu nhạy cả nhấp nhả 100ms)
local MOVING_SPEED_THRESHOLD = 1.5 -- Studs/giây: tốc độ di chuyển tối thiểu (tính theo giây, chống phụ thuộc FPS)
local ROLLOVER_DELAY = 1.0 -- Giây trễ khi phát hiện đổi room: ghi nốt đoạn đi qua cửa rồi mới rollover
local RUN_END_TIMEOUT = 6.0 -- Giây chờ room mới sau khi boss chết / teleport; hết mà chưa có room -> hết map, dừng record

--// Table
local recorder = {}

--// Settings
local captureDwells = true
local captureSkills = true

function recorder.SetCapture(state)
	state = state and true or false
	captureDwells = state
	captureSkills = state
end

function recorder.IsCaptureEnabled()
	return captureDwells or captureSkills
end

--// State
local isRecording = false
local recMap = nil
local startRoom = 0 --// Room của SLICE đang ghi (đổi room -> rollover sang slice mới)
local startPos = nil
local points = {}
local captureConnection = nil
local inputConnection = nil
local roomChangeConnection = nil
local lobbyConnection = nil
local bossConnection = nil
local respawnConnection = nil

--// Timeline events (dwells + skills) của segment đang record.
local recStartT = 0
local dwells = {}
local skills = {}
local currentDwell = nil
local currentDwellStartRel = 0
local stationarySince = nil
local standingAnchor = nil
local standingFacing = nil
local prevFramePos = nil
local roomChangePending = false
--// Tốc độ di chuyển trung bình trong lúc record (để playback ép đúng tốc độ -> khớp thời gian).
local movedDist = 0
local movingTime = 0
local lastFrameT = nil

--// Mode FULL của map: cho phép ghi qua boss room.
local allowBoss = false
--// Slice hiện tại có phải phòng boss không (đánh dấu segment khi lưu).
local sliceIsBoss = false
--// Slice đang-active hay đã "mồ côi" (finalize xong, chờ room mới / hết map).
--// Deactivated: finalizeSlice bỏ qua (không ghi đè room vừa lưu).
local sliceActive = false
--// Danh sách các phase đã hoàn thành trong room hiện tại (chết -> chốt phase cũ, mở phase mới)
local roomPhases = {}
--// Thống kê TOÀN SESSION đã rollover: số slice đã lưu + boss + tổng điểm gốc (dùng cho notify gộp).
local sessionRooms = 0
local sessionBossRooms = 0
local sessionRawPts = 0

--// Listeners
local statusListeners = {}

local function fireStatus()
	local info = {
		recording = isRecording,
		map = recMap,
		room = startRoom,
		pointCount = #points,
		phaseCount = #roomPhases + 1,
		dwellCount = #dwells,
		skillCount = #skills,
		savedRooms = sessionRooms,
	}
	for _, cb in ipairs(statusListeners) do
		pcall(cb, info)
	end
end

local function getPlayerRoot()
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if root and root.Parent then return root end
	return nil
end

--// Facing ngang hiện tại của nhân vật dạng {X,Z}.
local function getFacing()
	local root = getPlayerRoot()
	if not root then return nil end
	local look = root.CFrame.LookVector
	if look.Magnitude < 0.001 then return nil end
	return { X = look.X / look.Magnitude, Z = look.Z / look.Magnitude }
end

local function stopSubscriptions()
	if captureConnection then captureConnection:Disconnect(); captureConnection = nil end
	if inputConnection then inputConnection:Disconnect(); inputConnection = nil end
	if roomChangeConnection then roomChangeConnection(); roomChangeConnection = nil end
	if lobbyConnection then lobbyConnection(); lobbyConnection = nil end
	if bossConnection then bossConnection(); bossConnection = nil end
	if respawnConnection then respawnConnection(); respawnConnection = nil end
end

--// Reset phần timeline của 1 slice/phase (dùng chung cho beginSlice / seal phase / Stop / Cancel).
--// Tránh trùng lặp thủ công giữa các nhánh -> không bị sót field gây hành vi "dính" dữ liệu cũ.
local function resetTimeline(pos)
	points = { pos }
	dwells = {}
	skills = {}
	currentDwell = nil
	currentDwellStartRel = 0
	stationarySince = nil
	standingAnchor = nil
	standingFacing = nil
	prevFramePos = pos
	movedDist = 0
	movingTime = 0
	recStartT = os.clock()
	lastFrameT = os.clock()
	roomChangePending = false
end

--// Reset toàn bộ state session (Stop / Cancel): xoá mọi dữ liệu đang record.
--// KHÔNG đụng isRecording (do caller quản lý để giữ ngữ nghĩa Stop/Cancel khác nhau).
local function clearSessionState()
	recMap = nil
	startRoom = 0
	startPos = nil
	points = {}
	dwells = {}
	skills = {}
	currentDwell = nil
	currentDwellStartRel = 0
	stationarySince = nil
	standingAnchor = nil
	standingFacing = nil
	prevFramePos = nil
	roomChangePending = false
	movedDist = 0
	movingTime = 0
	lastFrameT = nil
	sliceIsBoss = false
	sliceActive = false
	allowBoss = false
	sessionRooms = 0
	sessionBossRooms = 0
	sessionRawPts = 0
end

--// Bắt đầu 1 SLICE (room) mới của session: reset points + timeline tại vị trí hiện tại.
--// Gọi khi rollover sang room khác.
local function beginSlice(room, pos)
	startRoom = room
	startPos = pos
	sliceActive = true
	resetTimeline(pos)
	sliceIsBoss = shared.IsBossActive()
	roomPhases = {}
end

--// Chốt phase hiện tại (do chết / hồi sinh) và mở phase tiếp theo từ điểm hồi sinh mới.
local function sealCurrentPhaseAndStartNext(newRespawnPos)
	if not sliceActive then return false end
	local clean = storage.SimplifyPath(points, SIMPLIFY_TOL)
	if #clean >= 2 then
		local events
		if #dwells > 0 or #skills > 0 then
			events = { dwells = dwells, skills = skills }
		end
		local avgSpeed = 0
		if movingTime > 0.5 and movedDist > 5 then
			avgSpeed = math.clamp(movedDist / movingTime, 5, 100)
		end
		table.insert(roomPhases, {
			startPos = startPos,
			points = clean,
			events = events,
			speed = avgSpeed,
		})
		sessionRawPts += #points
	end

	-- Khởi tạo phase tiếp theo từ vị trí hồi sinh mới
	startPos = newRespawnPos
	resetTimeline(newRespawnPos)
	fireStatus()
	return true
end

--// Chốt slice hiện tại: gói timeline + tốc độ + làm mịn + ghi ĐÈ segment của room này
--// vào macro (hỗ trợ multi-phase). Mặc định silent (rollover không spam notify).
local function finalizeSlice(reason, silent)
	if not sliceActive then return nil end
	local clean = storage.SimplifyPath(points, SIMPLIFY_TOL)
	if #clean >= 2 then
		local events
		if #dwells > 0 or #skills > 0 then
			events = { dwells = dwells, skills = skills }
		end
		local avgSpeed = 0
		if movingTime > 0.5 and movedDist > 5 then
			avgSpeed = math.clamp(movedDist / movingTime, 5, 100)
		end
		table.insert(roomPhases, {
			startPos = startPos,
			points = clean,
			events = events,
			speed = avgSpeed,
		})
		sessionRawPts += #points
	end

	if #roomPhases == 0 then return nil end

	local phase1 = roomPhases[1]
	local saved = storage.SaveSegment(
		recMap,
		startRoom,
		phase1.startPos,
		phase1.points,
		phase1.events,
		phase1.speed,
		sliceIsBoss,
		roomPhases
	)
	if not saved then return nil end

	sessionRooms += 1
	if sliceIsBoss then sessionBossRooms += 1 end

	if not silent then
		local extra = ""
		if #roomPhases > 1 then
			extra = (" (%d phases/mạng hồi sinh, %d điểm phase 1)"):format(#roomPhases, #phase1.points)
		elseif phase1.events then
			extra = (" (%d điểm mịn, %d skill, %d nhịp dừng, %.1fspd)"):format(#phase1.points, #(phase1.events.skills or {}), #(phase1.events.dwells or {}), phase1.speed or 0)
		else
			extra = (" (%d điểm mịn, %.1fspd)"):format(#phase1.points, phase1.speed or 0)
		end
		notifier.Notify("Path Record", ("Đã lưu room %d%s vào map [%s] %s"):format(startRoom, extra, recMap, reason and ("- " .. reason) or ""), 3)
	end

	return { phaseCount = #roomPhases, phase1 = phase1 }
end

function recorder.IsRecording()
	return isRecording
end

function recorder.GetStartRoom()
	return startRoom
end

function recorder.GetCurrentPhaseIndex()
	return #roomPhases + 1
end

--// Điểm đang ghi (cho visual / status).
function recorder.GetCurrentPoints()
	return points
end

function recorder.GetRoomPhases()
	return roomPhases
end

function recorder.GetCurrentDwells()
	return dwells
end

function recorder.GetCurrentSkills()
	return skills
end

function recorder.GetStatus()
	return {
		recording = isRecording,
		map = recMap,
		room = startRoom,
		pointCount = #points,
		dwellCount = #dwells,
		skillCount = #skills,
		phaseCount = #roomPhases + 1,
		savedRooms = sessionRooms,
	}
end

function recorder.OnStatusChanged(callback)
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

--// Bắt đầu record 1 session (1 map, tự rollover theo room). Trả về ok, err.
function recorder.Start()
	if isRecording then return false, "đang record rồi" end

	local root = getPlayerRoot()
	if not root then return false, "chưa có nhân vật" end
	if shared.IsDead() then return false, "nhân vật đang chết" end

	local room = shared.GetCurrentRoomIndex()
	if room <= 0 then return false, "không nằm trong dungeon" end

	local map = shared.GetCurrentDungeonName()
	if not map or #map == 0 then return false, "không xác định được map" end

	allowBoss = storage.GetMapMode(map) == "full"
	if shared.IsBossActive() and not allowBoss then return false, "boss room (dùng Hazard Scanner)" end

	recMap = map
	beginSlice(room, root.Position)
	isRecording = true
	autoSave.SetRecording(true)
	sessionRooms = 0
	sessionBossRooms = 0
	sessionRawPts = 0

	--// Sample vị trí nhân vật + phát hiện đứng yên (dwell) để ghép timeline.
	--// (Luôn sample kể cả khi boss active: mode FULL record luôn cả phòng boss.)
	captureConnection = RunService.Heartbeat:Connect(function()
		if not isRecording then return end
		if shared.IsDead() then
			stationarySince = nil
			currentDwell = nil
			prevFramePos = nil
			return
		end

		local target = getPlayerRoot()
		if not target then return end
		local pos = target.Position

		--// Nhảy vọt vị trí bất thường (teleport / hết run, respawn KHÔNG có CharacterAdded):
		--// LƯU slice hiện tại TRƯỚC (không vứt — trước đây vứt làm mất đoạn đánh boss cuối
		--// khi kết thúc run), rồi cmt lại từ vị trí mới, không nối thẳng sang vị trí mới.
		local lastPt = points[#points]
		if lastPt and (pos - lastPt).Magnitude > 35 then
			if not allowBoss then
				recorder.Stop("dịch chuyển lớn")
				return
			end
			finalizeSlice("dịch chuyển lớn", true)
			local r = shared.GetCurrentRoomIndex()
			if r == startRoom then r = 0 end -- deactivate nếu room cũ chưa untrack (không ghi đè)
			beginSlice(r, pos)
			fireStatus()
			--// Room không xác định -> có thể hết map: chờ room mới, không có thì tự dừng.
			task.spawn(function()
				task.wait(RUN_END_TIMEOUT)
				if isRecording and startRoom <= 0 then
					recorder.Stop("hết map")
				end
			end)
			return
		end

		--// Ước lượng tốc độ di chuyển: cộng dồn quãng đường + thời gian đang đi (luôn chạy).
		local now = os.clock()
		local moved = prevFramePos and (pos - prevFramePos).Magnitude or 0
		prevFramePos = pos
		local dt = lastFrameT and math.max(0.0001, now - lastFrameT) or 0.016
		lastFrameT = now
		local currentSpeed = dt > 0 and (moved / dt) or 0

		if currentSpeed >= MOVING_SPEED_THRESHOLD then
			movedDist += moved
			movingTime += dt
			stationarySince = nil
			currentDwell = nil
		else
			--// Dwell detection: đứng yên liên tục -> gộp thành event "dừng" (vị trí+thời gian+facing).
			if captureDwells then
				if not stationarySince then
					stationarySince = now
					standingAnchor = pos
					standingFacing = getFacing()
				end
				if currentDwell then
					currentDwell.dur = now - stationarySince
					currentDwell.facing = getFacing() or standingFacing
				elseif now - stationarySince >= DWELL_MIN then
					currentDwellStartRel = stationarySince - recStartT
					currentDwell = {
						pos = standingAnchor,
						dur = now - stationarySince,
						facing = standingFacing,
						index = #dwells + 1,
					}
					table.insert(dwells, currentDwell)

					-- Tự động liên kết các skill được cast trong lúc bắt đầu dừng (từ stationarySince đến giờ)
					for _, sk in ipairs(skills) do
						if sk.dw == 0 and sk._castAt and sk._castAt >= stationarySince then
							sk.dw = currentDwell.index
							sk.dwT = math.max(0, (sk._castAt - recStartT) - currentDwellStartRel)
							sk.pos = currentDwell.pos
							currentDwell.facing = sk.facing or currentDwell.facing
						end
					end
				end
			end
		end

		local last = points[#points]
		if last and (pos - last).Magnitude < MIN_SPACING then return end
		if #points >= MAX_POINTS then
			recorder.Stop("đạt giới hạn điểm")
			return
		end
		table.insert(points, pos)
	end)

	--// Capture skill: chuột phải (QE Combo) hoặc phím riêng lẻ Q / E (kèm vị trí + facing + thời gian trong dwell).
	--// Chuột phải (M2) được quy đổi thành combo cả 2 chiêu Q + E cùng lúc.
	if captureSkills then
		inputConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
			if not isRecording or not captureSkills then return end
			if UserInputService:GetFocusedTextBox() then return end
			if shared.IsDead() then return end

			local skillKey
			if input.UserInputType == Enum.UserInputType.MouseButton2 then
				if gameProcessed then return end
				skillKey = "QE"
			elseif input.UserInputType == Enum.UserInputType.Keyboard
				and (input.KeyCode == Enum.KeyCode.Q or input.KeyCode == Enum.KeyCode.E) then
				skillKey = input.KeyCode == Enum.KeyCode.Q and "Q" or "E"
			else
				return
			end

			local target = getPlayerRoot()
			if not target then return end

			--// Chỉ liên kết với Dwell khi đã được Heartbeat xác nhận đứng yên hợp lệ (currentDwell ~= nil).
			--// Tuyệt đối không tự ép tạo Dwell 0.1s khi người chơi đang di chuyển hoặc micro-pause.
			local isDwellActive = captureDwells and (currentDwell ~= nil)

			local ev = {
				pos = isDwellActive and currentDwell.pos or target.Position,
				facing = getFacing(),
				key = skillKey,
				dw = 0,
				dwT = 0,
				_castAt = os.clock(),
			}

			if isDwellActive then
				ev.dw = currentDwell.index
				ev.dwT = math.max(0, (os.clock() - recStartT) - currentDwellStartRel)
				-- Cập nhật facing của dwell theo hướng vừa bắn skill
				currentDwell.facing = ev.facing or currentDwell.facing
			end

			table.insert(skills, ev)
		end)
	end

	--// ĐỔI ROOM giữa session: TRỄ 1 GIÂY ghi nốt đoạn đi qua cửa rồi ROLLOVER
	--// (lưu slice room cũ + mở slice mới cho room hiện tại) -> record 1 lần cả map.
	--// roomChangePending chống stack nhiều lần đổi room trong khoảng chờ.
	--// Lazy-bind: khi slice mới đang mở ở room 0 (khe giữa 2 room / boss chưa bind
	--// room do rollover chạy trước khi enemy phòng mới spawn), room resolve về >0
	--// thì bind NGAY về room thật -> boss chết lưu đúng room thay vì lưu room 0 (mất đoạn).
	roomChangeConnection = shared.OnRoomIndexChanged(function()
		if isRecording then
			local current = shared.GetCurrentRoomIndex()
			if sliceActive and startRoom <= 0 and current > 0 then
				startRoom = current
				return
			end
			if current ~= startRoom and not roomChangePending then
				roomChangePending = true
				task.delay(ROLLOVER_DELAY, function()
					roomChangePending = false
					if isRecording then
						if allowBoss then
							recorder.Rollover()
						else
							recorder.Stop("hoàn thành room")
						end
					end
				end)
			end
		end
	end)

	--// Vào boss: mode NORMAL -> tắt + lưu segment đã ghi; mode FULL -> đánh dấu
	--// slice là phòng boss (heartbeat vẫn sample để record đường né).
	--// Boss chết (active=false) khi đang record phòng boss (FULL): chốt slice NGAY tại đó
	--// (không phụ thuộc teleport/đổi room — trước đây bị teleport hết run xóa mất đoạn
	--// đánh boss cuối), rồi tạm "mồ côi" (deactivate) chờ room mới.
	--// Không mở được room mới trong RUN_END_TIMEOUT -> tự dừng (hết map / hết run).
	bossConnection = shared.OnBossActiveChanged(function(active)
		if not isRecording then return end
		if active then
			if allowBoss then
				sliceIsBoss = true
			else
				recorder.Stop("vào boss room")
			end
			return
		end

		if allowBoss and sliceIsBoss then
			finalizeSlice("xong boss", true)
			sliceIsBoss = false
			sliceActive = false
			task.spawn(function()
				task.wait(RUN_END_TIMEOUT)
				if isRecording and not sliceActive then
					recorder.Stop("hết map")
				end
			end)
		end
	end)

	--// Về lobby -> hết map -> tắt + lưu.
	lobbyConnection = shared.OnLobbyChanged(function(inLobby)
		if isRecording and inLobby then
			recorder.Stop("về lobby")
		end
	end)

	--// Bắt sự kiện hồi sinh khi đang record: chốt Phase của mạng trước và mở Phase tiếp theo từ điểm hồi sinh mới.
	--// Người chơi không bị mất tiến trình đã đi; khi replay, bot sẽ đi lần lượt từng Phase tương ứng mỗi lần chết.
	respawnConnection = shared.OnRespawn(function()
		if not isRecording then return end
		task.delay(0.2, function()
			if not isRecording or shared.IsDead() then return end
			local target = getPlayerRoot()
			if not target then return end
			if sealCurrentPhaseAndStartNext(target.Position) then
				local curP = #roomPhases + 1
				notifier.Notify(
					"Path Record",
					("Hồi sinh: Đã lưu Phase %d, đang ghi tiếp Phase %d cho room %d"):format(curP - 1, curP, startRoom),
					3
				)
			end
		end)
	end)

	notifier.Notify("Path Record", ("Bắt đầu record room %d (%s)"):format(room, map), 2)
	fireStatus()
	return true
end

--// Rollover khi đổi room (đang record session liên tục): chốt slice room cũ (silent)
--// + mở slice mới ngay tại vị trí hiện tại. Session vẫn tiếp tục.
function recorder.Rollover()
	if not isRecording then return false end
	finalizeSlice("chuyển room", true)
	local root = getPlayerRoot()
	local pos = root and root.Position or startPos
	beginSlice(shared.GetCurrentRoomIndex(), pos)
	fireStatus()
	return true
end

--// Dừng session + chốt nốt slice hiện tại, gộp toàn bộ slice đã rollover vào macro.
function recorder.Stop(reason)
	if not isRecording then return false end

	isRecording = false
	autoSave.SetRecording(false)
	stopSubscriptions()

	local slice = finalizeSlice(reason, true)
	if slice then
		if sessionRooms > 1 then
			--// Record liên tục nhiều room: báo tổng hợp 1 lần.
			local bossPart = sessionBossRooms > 0 and (" | %d boss"):format(sessionBossRooms) or ""
			notifier.Notify("Path Record", ("Đã lưu map [%s] %s: %d room%s (%d điểm gốc)"):format(recMap, reason or "xong", sessionRooms, bossPart, sessionRawPts), 4)
		else
			local extra = ""
			local phase1 = slice.phase1
			if phase1 and phase1.events then
				extra = (" (%d skill, %d nhịp dừng, %.1fspd)"):format(#(phase1.events.skills or {}), #(phase1.events.dwells or {}), phase1.speed or 0)
			elseif phase1 then
				extra = (" (%.1fspd)"):format(phase1.speed or 0)
			end
			local bossTag = startRoom > 0 and (sliceIsBoss and " (boss)" or "") or ""
			notifier.Notify("Path Record", ("Đã lưu room %d%s%s vào map [%s] %s"):format(startRoom, extra, bossTag, recMap, reason and ("- " .. reason) or ""), 3)
		end
	elseif sessionRooms > 0 then
		--// Slice cuối bị "mồ côi" (room 0: kết thúc run tại boss hoặc teleport hết map):
		--// các room trước đã lưu xong, vẫn báo tổng hợp để người dùng biết đã lưu.
		local bossPart = sessionBossRooms > 0 and (" | %d boss"):format(sessionBossRooms) or ""
		notifier.Notify("Path Record", ("Đã lưu map [%s] %s: %d room%s (%d điểm gốc)"):format(recMap, reason or "xong", sessionRooms, bossPart, sessionRawPts), 4)
	end

	clearSessionState()
	fireStatus()
	return slice ~= nil
end

--// Huỷ record KHÔNG lưu (shutdown / discard).
function recorder.Cancel()
	if not isRecording then return end

	stopSubscriptions()
	clearSessionState()
	isRecording = false
	autoSave.SetRecording(false)
	fireStatus()
end

return recorder