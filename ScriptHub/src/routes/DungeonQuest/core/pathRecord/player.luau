-- Path Record System – Player: chạy MACRO của 1 map (toàn bộ room quái thường) ĐÚNG 1 LẦN.
--   - Đi qua từng room có segment trong macro; mỗi room đi hết 1 lượt rồi
--     ĐỨNG YÊN chờ đổi room (không đi qua lại trong room).
--   - BOSS room: KHÔNG đi (ngẫu nhiên, dùng SmartDodge) -> đứng yên chờ. Nếu
--     hệ thống khác (SmartDodge/AutoFarm) chiếm quyền -> PauseForExclusive:
--     nhường + tự resume khi sang room quái thường có segment (để đi nốt lượt).
--   - Room chưa có segment trong macro -> đứng yên chờ đổi room.
--   - Hết map (lobby) -> dừng hẳn playback (đi 1 lần, không tự phát lại).

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local storage = require("@routes/DungeonQuest/core/pathRecord/storage")
local notifier = require("@routes/DungeonQuest/core/notifier")

local player = services.player
local VirtualInputManager = services.VirtualInputManager
local UserInputService = services.UserInputService

--// Constants
local SIMPLIFY_TOL = 1.0 -- Studs: làm mịn quỹ đạo khi load (macro cũ dày đặc cũng đi trơn)
local ARRIVE_DIST = 1.0 -- Studs: ngưỡng coi là đã tới đích cuối
local START_REPOSITION_TIMEOUT = 8.0 -- Giây tối đa đi về node đầu trước khi phát
local LOOKAHEAD = 7.0 -- Studs: đích luôn cách phía trước theo quỹ đạo (ngăn việc dừng)
local PROJECT_BACK = 8.0 -- Studs: hình chiếu chỉ tìm trong cửa sổ quanh progress (chống nhảy nhánh giao)
local PROJECT_FRONT = 14.0 -- Studs: >= LOOKAHEAD + margin; nhánh giao/đường vòng nằm ngoài -> không bao giờ bị bắt hụt
local STUCK_TIMEOUT = 8.0 -- Giây không nhúc nhích -> nghi bị kẹt
local STUCK_BUMP = 2.0 -- Studs: nhảy tới trước khi nghi kẹt
local SKILL_FACE_HOLD_MIN = 0.5 -- Giây tối thiểu giữ facing sau khi xả skill
local SKILL_FACE_HOLD_MAX = 2.0 -- Giây tối đa giữ facing sau khi xả skill

--// Table
local mover = {}

--// Settings: tái hiện timeline record (dừng + skill + xoay mặt).
local replayPauses = true
local replaySkills = true
local replayFacing = true
local skillFaceHold = 0.6 -- Giây giữ facing sau khi xả skill khi đang đi (mặc định 0.6s)

function mover.SetSkillFaceHold(seconds)
	if type(seconds) == "number" then
		skillFaceHold = math.clamp(seconds, SKILL_FACE_HOLD_MIN, SKILL_FACE_HOLD_MAX)
	end
end

function mover.GetSkillFaceHold()
	return skillFaceHold
end

function mover.SetReplayTimeline(state)
	state = state and true or false
	replayPauses = state
	replaySkills = state
	replayFacing = state
end

function mover.IsReplayTimelineEnabled()
	return replayPauses
end

--// Settings: ép tốc chạy = tốc độ record để VỊ TRÍ và THỜI GIAN khớp nhau
--// (nhân vật tới điểm bắn skill/dừng đúng lúc như người chơi đã làm).
local matchRecordSpeed = true
local appliedSpeed = nil
local restoreSpeed = nil

function mover.SetSpeedMatch(state)
	matchRecordSpeed = state and true or false
end

function mover.IsSpeedMatchEnabled()
	return matchRecordSpeed
end

--// Ép WalkSpeed theo tốc độ đã ghi của segment; nhớ giá trị gốc để khôi phục.
local function applyRecordSpeed(speed)
	if not matchRecordSpeed then return end
	if type(speed) ~= "number" or speed <= 0 then return end
	local hum = shared.GetHumanoid()
	if not hum then return end
	if appliedSpeed == nil then restoreSpeed = hum.WalkSpeed end
	appliedSpeed = speed
	if hum.WalkSpeed ~= speed then hum.WalkSpeed = speed end
end

local function restorePlaybackSpeed()
	if appliedSpeed == nil then return end
	local hum = shared.GetHumanoid()
	if restoreSpeed and hum and hum.WalkSpeed ~= restoreSpeed then
		hum.WalkSpeed = restoreSpeed
	end
	appliedSpeed = nil
	restoreSpeed = nil
end

--// State
local isPlaying = false
local resumeWanted = false -- Bật cờ "tự resume" khi room có segment xuất hiện
local activeMap = nil -- Map đang playback
local playThread = nil
local statusListeners = {}

local function fireStatus(reason)
	local info = {
		playing = isPlaying,
		map = activeMap,
		room = shared.GetCurrentRoomIndex(),
		boss = shared.IsBossActive(),
		resume = resumeWanted,
		reason = reason,
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

local function getSafePosition(part)
	if not part or not part.Parent then return nil end
	local ok, pos = pcall(function()
		return part.Position
	end)
	if not ok or not pos then return nil end
	return pos
end

local function flatDistance(a, b)
	local dx = a.X - b.X
	local dz = a.Z - b.Z
	return math.sqrt(dx * dx + dz * dz)
end

--// Dừng hẳn nhân vật (khi tắt phát / nhường quyền).
local function cancelMove(humanoid)
	local root = getPlayerRoot()
	if root and humanoid then
		local pos = getSafePosition(root)
		if pos then pcall(function() humanoid:MoveTo(pos) end) end
	end
end

--// Mô phỏng chuột phải (kích hoạt skill như người chơi vừa làm lúc record).
--// Double-cast (gần như double click, cách nhau 0.005s) để chống trượt do CD/timing bị lệch nhẹ.
local function fireRightClick()
	local hold = shared.GetKeyHoldTime() or 0.05
	local mouse = UserInputService:GetMouseLocation()
	pcall(function()
		-- Lần click 1
		VirtualInputManager:SendMouseButtonEvent(mouse.X, mouse.Y, 1, true, game, false)
		task.wait(hold)
		VirtualInputManager:SendMouseButtonEvent(mouse.X, mouse.Y, 1, false, game, false)

		-- Khoảng nghỉ 0.005s trước lần click 2
		task.wait(0.005)

		-- Lần click 2 (double-tap đảm bảo ăn skill nếu lệch CD tích tắc)
		VirtualInputManager:SendMouseButtonEvent(mouse.X, mouse.Y, 1, true, game, false)
		task.wait(hold)
		VirtualInputManager:SendMouseButtonEvent(mouse.X, mouse.Y, 1, false, game, false)
	end)
end

--// Xoay nhân vật theo hướng record (tắt AutoRotate để giữ mặt cố định).
local function setFacing(root, faceLook)
	if not root or not root.Parent then return end
	local hum = shared.GetHumanoid()
	if hum then hum.AutoRotate = false end
	local look = faceLook or Vector3.new(1, 0, 0)
	if look.Magnitude < 0.1 then look = Vector3.new(1, 0, 0) end
	look = Vector3.new(look.X, 0, look.Z).Unit
	pcall(function()
		local p = root.Position
		root.CFrame = CFrame.lookAt(p, p + look)
	end)
end

local function restoreAutoRotate()
	local hum = shared.GetHumanoid()
	if hum then hum.AutoRotate = true end
end

--// Đi liên tục toàn bộ quỹ đạo 1 segment — KHÔNG bao giờ dừng giữa chừng.
--// Cách hoạt động (bám quỹ đạo + projection + lookahead):
--//   1. Làm mịn đường (Douglas-Peucker) khi load: macro cũ ghi dày 0.3 stud + wiggle
--//      sẽ bị "kéo thẳng" thành đường chính, tránh việc dừng gật gù từng phần.
--//   2. Quy đổi sang tổng chiều dài cung; progress = hình chiếu GẦN NHẤT của nhân
--//      vật lên đường -> LUÔN dính theo vị trí (không lỡ đỉnh khi cắt góc).
--//   3. Đích = điểm cách LOOKAHEAD studs phía trước trên đường -> humanoid không
--//      bao giờ "tới đích" để giảm tốc/dừng, chạy liền mạch theo quỹ đạo.
--//   4. Nhân vật đứng yên quá STUCK_TIMEOUT -> đẩy progress tới trước để lách vật cản.
local function walkThrough(segment, room)
	local humanoid = shared.GetHumanoid()
	local root = getPlayerRoot()
	if not humanoid or not root then return end

	--// Ép đúng tốc độ record trước cả bước kéo về node đầu (để timing khớp ngay từ đầu).
	applyRecordSpeed(segment.speed)

	local path = storage.SimplifyPath(segment.points, SIMPLIFY_TOL)
	local n = #path
	if n < 2 then return end

	local total = 0
	local cum = {}
	cum[1] = 0
	for i = 2, n do
		local segLen = flatDistance(path[i - 1], path[i])
		total += segLen
		cum[i] = total
	end

	--// Hình chiếu gần nhất của 1 điểm lên đường -> chiều dài cung tương ứng.
	--// Chỉ xét các SEGMENT trong cửa sổ [minArc, maxArc] quanh progress hiện tại:
	--// - Ngăn path tự giao (đường vòng cắt chính nó): nhánh kia dù XZ trùng nhưng nằm
	--//   ngoài cửa sổ -> progress không bị nảy tới nhánh đó (khỏi bỏ qua vòng).
	--// - Vẫn gần gũi khi đi từng đoạn/cắt góc (cửa sổ đủ rộng).
	local function projectPoint(pos, minArc, maxArc)
		minArc = minArc or 0
		maxArc = maxArc or total
		local bestArc = 0
		local bestD2 = math.huge
		for k = 2, n do
			if cum[k] < minArc then continue end
			if cum[k - 1] > maxArc then continue end
			local a, b = path[k - 1], path[k]
			local ax, az = a.X, a.Z
			local dx = b.X - ax
			local dz = b.Z - az
			local len2 = dx * dx + dz * dz
			local t = 0
			if len2 > 0 then
				t = ((pos.X - ax) * dx + (pos.Z - az) * dz) / len2
				t = math.clamp(t, 0, 1)
			end
			local ex = pos.X - (ax + dx * t)
			local ez = pos.Z - (az + dz * t)
			local d2 = ex * ex + ez * ez
			if d2 < bestD2 then
				bestD2 = d2
				bestArc = cum[k - 1] + math.sqrt(len2) * t
			end
		end
		return bestArc
	end

	--// Điểm trên đường tại chiều dài cung `dist` (nội suy tuyến tính).
	--// PHẢI trả Vector3 thật: Humanoid:MoveTo không chấp nhận bảng {X,Y,Z}.
	local function pointAt(dist)
		local k = 2
		while k <= n and cum[k] < dist do k += 1 end
		k = math.min(k, n)
		local segLen = cum[k] - cum[k - 1]
		if segLen <= 0 then return path[k] end
		local t = math.clamp((dist - cum[k - 1]) / segLen, 0, 1)
		local a, b = path[k - 1], path[k]
		return Vector3.new(
			a.X + (b.X - a.X) * t,
			a.Y + (b.Y - a.Y) * t,
			a.Z + (b.Z - a.Z) * t
		)
	end

	--// ---- Timeline events (record: đứng chờ + skill chuột phải) ----
	--// Anchor theo VỊ TRÍ trên đường (project lên path đã làm mịn) -> tốc độ
	--// chạy lại khác bản gốc vẫn khớp. Skill trong khoảng đứng yên được nội
	--// suy theo thời gian tương đối trong dwell; skill khi di chuyển bắn khi
	--// nhân vật cắt qua đúng vị trí.
	local dwells = {}
	local walkSkills = {}
	if segment.events and (replayPauses or replaySkills or replayFacing) then
		local rawDwells = segment.events.dwells or {}
		local rawSkills = segment.events.skills or {}
		for i, d in ipairs(rawDwells) do
			dwells[i] = {
				arc = projectPoint(d.pos),
				dur = d.dur or 0,
				facing = d.facing,
				skills = {},
			}
		end
		for _, s in ipairs(rawSkills) do
			local attached = (replayPauses and s.dw > 0 and dwells[s.dw]) and dwells[s.dw] or nil
			if attached then
				table.insert(attached.skills, { tOff = s.dwT or 0, facing = s.facing })
			else
				table.insert(walkSkills, {
					arc = projectPoint(s.pos),
					facing = s.facing,
				})
			end
		end
		table.sort(walkSkills, function(a, b) return a.arc < b.arc end)
	end

	--// Đứng yên re-run theo đúng duration record (xoay mặt + xả skill trong khoảng dừng).
	local function runDwell(dwell)
		if not isPlaying or dwell.dur <= 0 then return true end
		if replayPauses then
			if replayFacing then setFacing(root, dwell.facing) end
			local p0 = getSafePosition(root)
			local startT = os.clock()
			local skIdx = 1
			while isPlaying and os.clock() - startT < dwell.dur do
				if not root or not root.Parent then return false, "no_root" end
				if shared.IsDead() then return false, "dead" end
				if shared.GetCurrentRoomIndex() ~= room then return false, "room_changed" end
				if shared.IsBossActive() then return false, "boss" end
				--// Giữ chân tại chỗ (chống đẩy lệch) trong suốt khoảng dừng.
				local anchor = p0 or getSafePosition(root)
				if anchor then pcall(function() humanoid:MoveTo(anchor) end) end
				local sk = dwell.skills[skIdx]
				if sk and os.clock() - startT >= sk.tOff then
					if replaySkills then
						if replayFacing then setFacing(root, sk.facing) end
						fireRightClick()
					elseif replayFacing then
						setFacing(root, sk.facing)
					end
					skIdx += 1
				end
				task.wait(0.05)
			end
			if replayFacing then restoreAutoRotate() end
		end
		return true
	end

	--// Đảm bảo khi bắt đầu di chuyển: luôn đi về NODE ĐẦU TIÊN (path[1] - vị trí xuất phát).
	--// Không chiếu tìm node giữa đường (tránh bị nhảy cóc sang nhánh khác khi đi ngang qua).
	local repositionStart = path[1]
	local repositionDeadline = os.clock() + START_REPOSITION_TIMEOUT
	while isPlaying do
		if not root or not root.Parent then restoreAutoRotate(); return false, "no_root" end
		if shared.IsDead() then restoreAutoRotate(); return false, "dead" end
		if shared.GetCurrentRoomIndex() ~= room then restoreAutoRotate(); return false, "room_changed" end
		if shared.IsBossActive() then restoreAutoRotate(); return false, "boss" end
		local p0 = getSafePosition(root)
		if not p0 then
			task.wait(0.08)
			continue
		end
		if flatDistance(p0, repositionStart) <= ARRIVE_DIST then break end
		pcall(function() humanoid:MoveTo(repositionStart) end)
		if os.clock() >= repositionDeadline then break end
		task.wait(0.08)
	end

	local progress = 0
	local prevPos = getSafePosition(root)
	local lastMoved = os.clock()
	local dwellIdx = 1
	local skillIdx = 1
	local faceLockUntil = 0
	local lastSkillFacing = nil

	--// Throttle MoveTo: chỉ gửi lệnh mới khi target nhích ≥ STEP hoặc quá TIMEOUT.
	--// Giảm tải pathfinding của game (đỡ treo client khi chạy set cấu hình 10Hz).
	local lastTargetPos = nil
	local lastMoveToAt = 0
	local function sendMove(target)
		local now = os.clock()
		local movedBy = lastTargetPos and flatDistance(lastTargetPos, target) or math.huge
		if movedBy > 0.5 or now - lastMoveToAt >= 0.25 then
			lastTargetPos = target
			lastMoveToAt = now
			pcall(function() humanoid:MoveTo(target) end)
		end
	end

	while isPlaying do
		if not root or not root.Parent then restoreAutoRotate(); return false, "no_root" end
		if shared.IsDead() then restoreAutoRotate(); return false, "dead" end
		if shared.GetCurrentRoomIndex() ~= room then restoreAutoRotate(); return false, "room_changed" end
		if shared.IsBossActive() then restoreAutoRotate(); return false, "boss" end -- boss mới xuất hiện -> đứng yên

		local pos = getSafePosition(root)
		if not pos then
			task.wait(0.08)
			continue
		end

		--// Progress bám hình chiếu gần nhất (trong cửa sổ quanh progress); chỉ tiến, không lùi.
		local projected = projectPoint(
			pos,
			math.max(0, progress - PROJECT_BACK),
			math.min(total, progress + PROJECT_FRONT)
		)
		if projected > progress then progress = projected end

		--// Nghi kẹt: vị trí không nhúc nhích trong STUCK_TIMEOUT -> đẩy target tới.
		if prevPos then
			if flatDistance(pos, prevPos) > 0.02 then lastMoved = os.clock() end
		end
		prevPos = pos
		if os.clock() - lastMoved > STUCK_TIMEOUT then
			progress = math.min(progress + STUCK_BUMP, total - ARRIVE_DIST)
			lastMoved = os.clock()
			prevPos = pos
		end

		--// Bắn skill lúc di chuyển: nhân vật cắt qua đúng vị trí đã bấm chuột phải.
		--// Khoá facing SKILL_FACE_HOLD sau khi xả để game kịp ghi nhận hướng cast
		--// (không quay về hướng đi ngay -> skill không bị bắn lệch).
		while skillIdx <= #walkSkills and walkSkills[skillIdx].arc <= progress do
			local sk = walkSkills[skillIdx]
			if replayFacing then
				setFacing(root, sk.facing)
				lastSkillFacing = sk.facing
				faceLockUntil = os.clock() + skillFaceHold
			end
			if replaySkills then
				fireRightClick()
			end
			skillIdx += 1
		end

		--// Đứng chờ ĐÚNG thời lượng record tại vị trí tương ứng.
		local nextDwell = dwells[dwellIdx]
		if nextDwell and progress >= nextDwell.arc then
			local dOk, dErr = runDwell(nextDwell)
			if not dOk then restoreAutoRotate(); return false, dErr end
			dwellIdx += 1
			prevPos = getSafePosition(root)
			lastMoved = os.clock()
			continue
		end

		--// Gần cuối -> đi thẳng nốt tới điểm cuối rồi kết thúc lượt.
		if progress >= total - ARRIVE_DIST then
			restoreAutoRotate()
			pcall(function() humanoid:MoveTo(path[n]) end)
			local deadline = os.clock() + 5
			while isPlaying do
				local p2 = getSafePosition(root)
				if p2 and flatDistance(p2, path[n]) <= ARRIVE_DIST then break end
				if shared.GetCurrentRoomIndex() ~= room then restoreAutoRotate(); return false, "room_changed" end
				if shared.IsBossActive() or shared.IsDead() then restoreAutoRotate(); return false, "dead" end
				if os.clock() >= deadline then break end
				if os.clock() >= faceLockUntil and humanoid.AutoRotate ~= true then
					humanoid.AutoRotate = true
				end
				task.wait(0.08)
			end
			restoreAutoRotate()
			return true, "completed"
		end

		--// Đích luôn ở phía trước -> humanoid đi liền mạch.
		if os.clock() < faceLockUntil then
			--// Đang trong cửa sổ giữ facing: khoá AutoRotate + resnap mỗi tick.
			if humanoid.AutoRotate ~= false then humanoid.AutoRotate = false end
			if lastSkillFacing then setFacing(root, lastSkillFacing) end
		elseif humanoid.AutoRotate ~= true then
			humanoid.AutoRotate = true
		end
		local target = pointAt(math.min(progress + LOOKAHEAD, total - 0.01))
		sendMove(target)
		task.wait(0.1)
	end
	restoreAutoRotate()
	return false, "stopped"
end

local function playbackLoop()
	--// Đi ĐÚNG 1 LẦN: mỗi room đi hết segment 1 lượt rồi ĐỨNG YÊN chờ đổi room;
	--// không đi qua lại trong room. Khi hết map (lobby) -> dừng hẳn.
	local visitedRoom = 0
	local walkedThisVisit = false
	local wasDead = false

	while isPlaying do
		if resumeWanted then break end

		if shared.IsDead() then
			wasDead = true
			task.wait(0.25)
			continue
		end
		if wasDead then
			--// Vừa hồi sinh: reset lượt để ĐI LẠI room hiện tại (không bỏ giữa chừng vì đã chết).
			wasDead = false
			visitedRoom = 0
			walkedThisVisit = false
		end
		if shared.IsInLobby() then
			--// Hết run: dừng playback, không tự phát lại (đi 1 lần).
			resumeWanted = false
			isPlaying = false
			break
		end
		if shared.IsBossActive() then
			--// Boss: đứng yên (dùng SmartDodge).
			task.wait(0.25)
			continue
		end

		local room = shared.GetCurrentRoomIndex()
		if room <= 0 then
			task.wait(0.1)
			continue
		end

		--// Đổi room -> lượt đi mới cho room đó.
		if room ~= visitedRoom then
			visitedRoom = room
			walkedThisVisit = false
		end

		local segment = storage.GetRoomSegment(activeMap, room)
		if not segment then
			--// Room chưa record trong macro -> đứng yên chờ đổi room.
			task.wait(0.1)
			continue
		end

		if walkedThisVisit then
			--// Đã đi hết 1 lượt segment -> đứng yên, chờ đổi room.
			task.wait(0.1)
			continue
		end

		local ok, reason = walkThrough(segment, room)
		restoreAutoRotate()
		if ok then
			walkedThisVisit = true
		else
			--// Nếu bị chết hoặc gián đoạn giữa chừng: không đánh dấu walkedThisVisit
			--// để khi hồi sinh sẽ tự động đi lại / đi tiếp cho xong room.
			if reason == "dead" then
				notifier.Notify("Path Record", "Tử trận: Đang chờ hồi sinh để tiếp tục...", 2)
				while isPlaying and shared.IsDead() do
					task.wait(0.2)
				end
				task.wait(0.6) -- Chờ nhân vật load xong hoàn toàn
			end
		end
	end
	restorePlaybackSpeed()
	restoreAutoRotate()
	playThread = nil
	fireStatus()
end

function mover.IsPlaying()
	return isPlaying
end

function mover.ResumeWanted()
	return resumeWanted
end

function mover.GetActiveMap()
	return activeMap
end

function mover.GetStatus()
	return {
		playing = isPlaying,
		map = activeMap,
		room = shared.GetCurrentRoomIndex(),
		boss = shared.IsBossActive(),
		resume = resumeWanted,
	}
end

function mover.OnStatusChanged(callback)
	if type(callback) == "function" then
		table.insert(statusListeners, callback)
	end
end

--// Bắt đầu phát. Trả về ok, err.
function mover.Start()
	if isPlaying then return false, "đang phát rồi" end
	if shared.IsInLobby() then return false, "đang ở lobby" end
	if shared.IsBossActive() then return false, "boss room (hãy dùng Smart Dodge)" end

	local room = shared.GetCurrentRoomIndex()
	if room <= 0 then return false, "chưa có room" end

	local map = shared.GetCurrentDungeonName()
	if not map or #map == 0 then return false, "không xác định được map" end
	if not storage.HasSegmentOrMacro(map, room) then
		return false, ("map [%s] chưa có segment room %d"):format(map, room)
	end

	activeMap = map
	resumeWanted = false
	isPlaying = true
	playThread = task.spawn(playbackLoop)
	fireStatus("started")
	return true
end

--// Dừng (thủ công): không tự resume nữa.
function mover.Stop()
	isPlaying = false
	resumeWanted = false
	activeMap = nil
	if playThread then
		task.cancel(playThread)
		playThread = nil
	end
	cancelMove(shared.GetHumanoid())
	restorePlaybackSpeed()
	restoreAutoRotate()
	fireStatus("stopped")
end

--// Nhường độc quyền cho hệ thống khác (SmartDodge/AutoFarm...): dừng nhưng
--// giữ ý định tự resume khi vào room quái thường có segment.
function mover.PauseForExclusive()
	if not isPlaying then return end

	resumeWanted = true
	isPlaying = false
	if playThread then
		task.cancel(playThread)
		playThread = nil
	end
	cancelMove(shared.GetHumanoid())
	restorePlaybackSpeed()
	restoreAutoRotate()
	notifier.Notify("Path Record", "Nhường điều khiển: sẽ tự phát tiếp khi vào room có bản ghi", 3)
	fireStatus("paused")
end

return mover