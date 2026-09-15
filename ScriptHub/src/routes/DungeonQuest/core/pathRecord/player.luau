-- Path Record System – Player: chạy MACRO của 1 map (toàn bộ room đã record) ĐÚNG 1 LẦN.
--   - Đi qua từng room có segment trong macro; mỗi room đi hết 1 lượt rồi
--     ĐỨNG YÊN chờ đổi room (không đi qua lại trong room).
--   - BOSS room:
--       * Mode NORMAL: KHÔNG đi (ngẫu nhiên, dùng Hazard Scanner) -> đứng yên chờ. Nếu
--         hệ thống khác (HazardScanner/AutoFarm) chiếm quyền -> PauseForExclusive:
--         nhường + tự resume khi sang room quái thường có segment.
--       * Mode FULL (map tùy chỉnh): ĐI theo path đã record qua cả boss room; giữ
--         độc quyền và KHÔNG đứng yên ở boss.
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
local RunService = services.RunService

--// Constants
local SIMPLIFY_TOL = 0.4 -- Studs: làm mịn quỹ đạo khi load (độ chính xác cao, bám sát từng centimet)
local ARRIVE_DIST = 0.5 -- Studs: ngưỡng coi là đã tới đích cuối (chuẩn xác từng node)
local START_REPOSITION_TIMEOUT = 3.0 -- Giây tối đa đi về node đầu trước khi phát
local LOOKAHEAD_MIN = 2.0 -- Studs: lookahead tối thiểu tại góc cua gắt (chống cắt góc/rơi vực)
local LOOKAHEAD_MAX = 4.5 -- Studs: lookahead tối đa trên đường thẳng (bám sát lòng đường tuyệt đối)
local PRE_AIM_DIST = 1.5 -- Studs: khoảng cách bắt đầu xoay mặt đón đầu trước khi chạm mốc xả skill
local PROJECT_BACK = 8.0 -- Studs: hình chiếu chỉ tìm trong cửa sổ quanh progress (chống nhảy nhánh giao)
local PROJECT_FRONT = 14.0 -- Studs: >= LOOKAHEAD_MAX + margin; nhánh giao/đường vòng nằm ngoài -> không bao giờ bị bắt hụt
local STUCK_TIMEOUT = 8.0 -- Giây không nhúc nhích -> nghi bị kẹt
local STUCK_BUMP = 2.0 -- Studs: nhảy tới trước khi nghi kẹt
local SKILL_FACE_HOLD_MIN = 0.5 -- Giây tối thiểu giữ facing sau khi xả skill
local SKILL_FACE_HOLD_MAX = 2.0 -- Giây tối đa giữ facing sau khi xả skill
local DOUBLE_CLICK_DELAY_MIN = 0.001 -- Giây tối thiểu giữa 2 lần click
local DOUBLE_CLICK_DELAY_MAX = 0.1 -- Giây tối đa giữa 2 lần click

--// Table
local mover = {}

--// Settings: tái hiện timeline record (dừng + skill + xoay mặt).
local replayPauses = true
local replaySkills = true
local replayFacing = true
local skillFaceHold = 0.6 -- Giây giữ facing sau khi xả skill khi đang đi (mặc định 0.6s)
local doubleClickDelay = 0.005 -- Giây khoảng nghỉ giữa 2 lần click (mặc định 0.005s)

function mover.SetSkillFaceHold(seconds)
	if type(seconds) == "number" then
		skillFaceHold = math.clamp(seconds, SKILL_FACE_HOLD_MIN, SKILL_FACE_HOLD_MAX)
	end
end

function mover.GetSkillFaceHold()
	return skillFaceHold
end

function mover.SetDoubleClickDelay(seconds)
	if type(seconds) == "number" then
		doubleClickDelay = math.clamp(seconds, DOUBLE_CLICK_DELAY_MIN, DOUBLE_CLICK_DELAY_MAX)
	end
end

function mover.GetDoubleClickDelay()
	return doubleClickDelay
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
--// (nhân vật tới điểm bắn skill/dừng đúng lúc như người chơi đã làm)
--// hoặc ép theo tốc độ Fast Speed ở tab Combat/Player.
local matchRecordSpeed = true
local useFastSpeed = false
local appliedSpeed = nil
local restoreSpeed = nil

function mover.SetSpeedMatch(state)
	matchRecordSpeed = state and true or false
end

function mover.IsSpeedMatchEnabled()
	return matchRecordSpeed
end

function mover.SetUseFastSpeed(state)
	useFastSpeed = state and true or false
end

function mover.IsUseFastSpeedEnabled()
	return useFastSpeed
end

--// Ép WalkSpeed theo tốc độ đã ghi của segment hoặc Fast Speed; nhớ giá trị gốc để khôi phục.
local function applyPlaybackSpeed(segmentSpeed)
	local targetSpeed = nil
	if useFastSpeed then
		local fs = shared.GetFastSpeed()
		if type(fs) == "number" and fs > 0 then
			targetSpeed = fs
		end
	elseif matchRecordSpeed then
		if type(segmentSpeed) == "number" and segmentSpeed > 0 then
			targetSpeed = segmentSpeed
		end
	end

	if not targetSpeed or targetSpeed <= 0 then return end
	local hum = shared.GetHumanoid()
	if not hum then return end
	if appliedSpeed == nil then restoreSpeed = hum.WalkSpeed end
	appliedSpeed = targetSpeed
	if hum.WalkSpeed ~= targetSpeed then hum.WalkSpeed = targetSpeed end
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
local playFullMap = false -- Mode FULL của map: đi qua cả boss room theo path đã ghi
local playThread = nil
local currentPhaseIndex = 1
local statusListeners = {}

local function fireStatus(reason)
	if shared.SetPathRecordPlaying then
		shared.SetPathRecordPlaying(isPlaying)
	end
	local info = {
		playing = isPlaying,
		map = activeMap,
		room = shared.GetCurrentRoomIndex(),
		boss = shared.IsBossActive(),
		phase = currentPhaseIndex,
		resume = resumeWanted,
		reason = reason,
	}
	for _, cb in ipairs(statusListeners) do
		pcall(cb, info)
	end
end

function mover.GetCurrentPhaseIndex()
	return currentPhaseIndex
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

--// Điều khiển di chuyển vật lý bằng Humanoid:Move trên nhịp RenderStepped
--// (Đồng bộ cơ chế vật lý 60 FPS mượt mà tương tự AutoFarm và SmartDodgeV2)
local activeMoveConn = nil
local currentMoveTarget = nil
local activeHoldFacing = nil
local faceLockUntil = 0

local function stopMoveRunner()
	if activeMoveConn then
		pcall(function() activeMoveConn:Disconnect() end)
		activeMoveConn = nil
	end
	currentMoveTarget = nil
	activeHoldFacing = nil
	faceLockUntil = 0
	local hum = shared.GetHumanoid()
	if hum then
		pcall(function() hum:Move(Vector3.zero, false) end)
	end
end

local function startMoveRunner(humanoid, root)
	if activeMoveConn then return end
	activeMoveConn = RunService.RenderStepped:Connect(function()
		if not isPlaying or not humanoid or not humanoid.Parent or not root or not root.Parent then
			stopMoveRunner()
			return
		end

		--// Giữ Facing khi cast chiêu hoặc Pre-Aim (khắc phục RMB camera snap và trôi góc xoay khi Move)
		if activeHoldFacing and os.clock() < faceLockUntil then
			if humanoid.AutoRotate ~= false then
				humanoid.AutoRotate = false
			end
			local rPos = root.Position
			local curLook = root.CFrame.LookVector
			local wantLook = activeHoldFacing
			if curLook:Dot(wantLook) < 0.999 then
				root.CFrame = CFrame.lookAt(rPos, rPos + wantLook)
			end
		elseif activeHoldFacing ~= nil and os.clock() >= faceLockUntil then
			activeHoldFacing = nil
			if humanoid.AutoRotate ~= true then
				humanoid.AutoRotate = true
			end
		end

		if currentMoveTarget then
			local rPos = root.Position
			local flatDiff = Vector3.new(currentMoveTarget.X - rPos.X, 0, currentMoveTarget.Z - rPos.Z)
			local flatDist = flatDiff.Magnitude
			if flatDist > 0.3 then
				humanoid:Move(flatDiff.Unit, false)
			else
				humanoid:Move(Vector3.zero, false)
			end

			-- Tự động nhảy khi có chênh lệch độ cao phía trước (bậc thang/gờ đá)
			local elevDiff = currentMoveTarget.Y - rPos.Y
			if elevDiff > 1.8 and flatDist <= 7.0 then
				humanoid.Jump = true
			end
		else
			humanoid:Move(Vector3.zero, false)
		end
	end)
end

--// Dừng hẳn nhân vật (khi tắt phát / nhường quyền).
local function cancelMove(humanoid)
	stopMoveRunner()
	if humanoid then
		pcall(function() humanoid:Move(Vector3.zero, false) end)
	end
end

--// Mô phỏng kích hoạt skill ThĐÚNG nút như lúc record:
--//   - "Q"/"E": VirtualInputManager:SendKeyEvent
--//   - "M2" (hoặc nil = macro cũ): chuột phải như trước.
--// Double-cast không đồng bộ (task.spawn) để hoàn toàn KHÔNG chặn luồng di chuyển, chống khựng bước.
local function fireSkill(skillKey)
	local hold = shared.GetKeyHoldTime() or 0.05
	local delayTime = doubleClickDelay
	local mouse = UserInputService:GetMouseLocation()
	task.spawn(function()
		pcall(function()
			local function send(down)
				if skillKey == "Q" or skillKey == "E" then
					local code = skillKey == "Q" and Enum.KeyCode.Q or Enum.KeyCode.E
					VirtualInputManager:SendKeyEvent(down, code, false, game)
				else
					VirtualInputManager:SendMouseButtonEvent(mouse.X, mouse.Y, 1, down, game, false)
				end
			end

			-- Lần bấm 1
			send(true)
			task.wait(hold)
			send(false)

			-- Khoảng nghỉ trước lần bấm 2 (tùy chỉnh qua slider)
			if delayTime > 0 then
				task.wait(delayTime)
			end

			-- Lần bấm 2 (double-tap đảm bảo ăn skill nếu lệch CD tích tắc)
			send(true)
			task.wait(hold)
			send(false)
		end)
	end)
end

--// Xoay nhân vật theo hướng record (tắt AutoRotate để giữ mặt cố định).
local function setFacing(root, faceLook)
	if not root or not root.Parent then return end
	local hum = shared.GetHumanoid()
	if hum then hum.AutoRotate = false end
	local look = faceLook or Vector3.new(1, 0, 0)
	if look.Magnitude < 0.01 then look = Vector3.new(1, 0, 0) end
	look = Vector3.new(look.X, 0, look.Z).Unit
	pcall(function()
		local p = root.Position
		root.CFrame = CFrame.lookAt(p, p + look)
	end)
end

--// Khóa hướng mặt theo hướng chỉ định trong thời lượng `duration` (mặc định skillFaceHold).
--// Giữ liên tục trên RenderStepped để chống RMB camera snap và physics drift.
local function holdFacing(root, faceLook, duration)
	if not root or not root.Parent or not faceLook then return end
	local look = Vector3.new(faceLook.X, 0, faceLook.Z)
	if look.Magnitude < 0.01 then return end
	activeHoldFacing = look.Unit
	faceLockUntil = os.clock() + (duration or skillFaceHold)
	setFacing(root, activeHoldFacing)
end

local function restoreAutoRotate()
	activeHoldFacing = nil
	faceLockUntil = 0
	local hum = shared.GetHumanoid()
	if hum then hum.AutoRotate = true end
end

--// Tiếp cận node đầu tiên của segment (path[1]) bằng Humanoid:Move trực tiếp.
--// Hoàn toàn không dùng PathfindingService để loại bỏ độ trễ và tránh xoay người giật cục.
local function chaseToStart(humanoid, root, room, allowBoss, target, deadline)
	local timeout = deadline or (os.clock() + 3.0)

	while isPlaying do
		if not root or not root.Parent then restoreAutoRotate(); return false, "no_root" end
		if shared.IsDead() then stopMoveRunner(); restoreAutoRotate(); return false, "dead" end
		if shared.GetCurrentRoomIndex() ~= room then stopMoveRunner(); restoreAutoRotate(); return false, "room_changed" end
		if shared.IsBossActive() and not allowBoss then stopMoveRunner(); restoreAutoRotate(); return false, "boss" end

		local pos = getSafePosition(root)
		if not pos then
			task.wait(0.03)
			continue
		end

		--// Đã ở rất gần node đầu (<= 1.5 stud) hoặc hết deadline -> bắt đầu phát ngay
		local dist = flatDistance(pos, target)
		if dist <= 1.5 or os.clock() >= timeout then
			break
		end

		--// Lướt thẳng tới node đầu bằng Move runner 60 FPS
		currentMoveTarget = target
		startMoveRunner(humanoid, root)
		task.wait(0.03)
	end

	pcall(function() humanoid:Move(Vector3.zero, false) end)
	if not isPlaying then return false, "stopped" end
	return true
end

--// Đi liên tục toàn bộ quỹ đạo 1 segment — KHÔNG bao giờ dừng giữa chừng.
--// allowBoss (true khi mode FULL): bỏ check boss -> đi theo path đã record qua boss room.
--// Cách hoạt động (bám quỹ đạo + projection + lookahead):
--//   1. Làm mịn đường (Douglas-Peucker) khi load: macro cũ ghi dày 0.3 stud + wiggle
--//      sẽ bị "kéo thẳng" thành đường chính, tránh việc dừng gật gù từng phần.
--//   2. Quy đổi sang tổng chiều dài cung; progress = hình chiếu GẦN NHẤT của nhân
--//      vật lên đường -> LUÔN dính theo vị trí (không lỡ đỉnh khi cắt góc).
--//   3. Đích = điểm cách LOOKAHEAD studs phía trước trên đường -> humanoid không
--//      bao giờ "tới đích" để giảm tốc/dừng, chạy liền mạch theo quỹ đạo.
--//   4. Nhân vật đứng yên quá STUCK_TIMEOUT -> đẩy progress tới trước để lách vật cản.
local function walkThrough(segment, room, allowBoss)
	local humanoid = shared.GetHumanoid()
	local root = getPlayerRoot()
	if not humanoid or not root then return end

	--// Ép đúng tốc độ record hoặc fast speed trước cả bước kéo về node đầu (để timing khớp ngay từ đầu).
	applyPlaybackSpeed(segment.speed)

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
	--// PHẢI trả Vector3 thật để tính toán vector hướng di chuyển.
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

	--// Tính Lookahead thích ứng theo độ uốn của quỹ đạo phía trước (Adaptive Lookahead):
	--// - Góc cua gấp (>= 60°-90°): Lookahead giảm xuống LOOKAHEAD_MIN (2.5 - 3.5 studs) để bám sát cua (chống cắt góc/rơi vực).
	--// - Đường thẳng: Lookahead tăng lên LOOKAHEAD_MAX (7.0 studs) để chạy liền mạch, mượt mà.
	local function getAdaptiveLookahead(curProgress)
		local d1 = math.min(curProgress + 2.5, total)
		local d2 = math.min(curProgress + 5.5, total)
		if d2 - curProgress < 1.0 then return LOOKAHEAD_MIN end

		local p0 = pointAt(curProgress)
		local p1 = pointAt(d1)
		local p2 = pointAt(d2)

		local dx1, dz1 = p1.X - p0.X, p1.Z - p0.Z
		local dx2, dz2 = p2.X - p1.X, p2.Z - p1.Z
		local len1 = math.sqrt(dx1 * dx1 + dz1 * dz1)
		local len2 = math.sqrt(dx2 * dx2 + dz2 * dz2)

		if len1 > 0.1 and len2 > 0.1 then
			local dot = math.clamp((dx1 * dx2 + dz1 * dz2) / (len1 * len2), -1, 1)
			-- dot = 1.0 (thẳng) -> t = 1.0 -> LOOKAHEAD_MAX
			-- dot <= 0 (cua gắt >= 90°) -> t = 0 -> LOOKAHEAD_MIN
			local t = math.clamp((dot + 0.2) / 1.2, 0, 1)
			return LOOKAHEAD_MIN + (LOOKAHEAD_MAX - LOOKAHEAD_MIN) * t
		end
		return LOOKAHEAD_MAX
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
				table.insert(attached.skills, { tOff = s.dwT or 0, facing = s.facing, key = s.key })
			else
				table.insert(walkSkills, {
					arc = projectPoint(s.pos),
					facing = s.facing,
					key = s.key,
				})
			end
		end
		table.sort(walkSkills, function(a, b) return a.arc < b.arc end)
	end

	--// Đứng yên re-run theo đúng duration record (xoay mặt + xả skill trong khoảng dừng).
	local function runDwell(dwell)
		if not isPlaying or dwell.dur <= 0 then return true end
		if replayPauses then
			startMoveRunner(humanoid, root)
			if replayFacing and dwell.facing then
				holdFacing(root, dwell.facing, dwell.dur)
			end
			local p0 = getSafePosition(root)
			local startT = os.clock()
			local skIdx = 1
			while isPlaying and os.clock() - startT < dwell.dur do
				if not root or not root.Parent then return false, "no_root" end
				if shared.IsDead() then return false, "dead" end
				if shared.GetCurrentRoomIndex() ~= room then return false, "room_changed" end
				if shared.IsBossActive() and not allowBoss then return false, "boss" end
				--// Giữ chân tại chỗ (chống đẩy lệch) trong suốt khoảng dừng.
				pcall(function() humanoid:Move(Vector3.zero, false) end)
				local sk = dwell.skills[skIdx]
				if sk and os.clock() - startT >= sk.tOff then
					if replayFacing and sk.facing then
						holdFacing(root, sk.facing, math.max(dwell.dur - (os.clock() - startT), skillFaceHold))
					end
					if replaySkills then
						fireSkill(sk.key or "M2")
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
	--// Di chuyển thẳng êm ái bằng Move runner, không dùng PathfindingService.
	local repositionStart = path[1]
	local repositionDeadline = os.clock() + START_REPOSITION_TIMEOUT
	local rpOk, rpErr = chaseToStart(humanoid, root, room, allowBoss, repositionStart, repositionDeadline)
	if (not rpOk) and rpErr and rpErr ~= "stopped" then
		return false, rpErr
	end

	local progress = 0
	local prevPos = getSafePosition(root)
	local lastMoved = os.clock()
	local dwellIdx = 1
	local skillIdx = 1
	faceLockUntil = 0
	activeHoldFacing = nil
	local lastSkillFacing = nil

	local function sendMove(target)
		currentMoveTarget = target
		startMoveRunner(humanoid, root)
	end

	while isPlaying do
		if not root or not root.Parent then stopMoveRunner(); restoreAutoRotate(); return false, "no_root" end
		if shared.IsDead() then stopMoveRunner(); restoreAutoRotate(); return false, "dead" end
		if shared.GetCurrentRoomIndex() ~= room then stopMoveRunner(); restoreAutoRotate(); return false, "room_changed" end
		if shared.IsBossActive() and not allowBoss then stopMoveRunner(); restoreAutoRotate(); return false, "boss" end -- boss mới xuất hiện -> đứng yên (chỉ khi NORMAL)

		local pos = getSafePosition(root)
		if not pos then
			task.wait(0.04)
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
			pcall(function() humanoid.Jump = true end)
		end

		--// Pre-Aim Skill: Xoay mặt đón đầu trước khi chạm điểm xả chiêu (cách PRE_AIM_DIST studs).
		--// Đảm bảo khi tới điểm xả thì hướng mặt đã ổn định 100%, không bị lệch tia.
		local nextSkill = walkSkills[skillIdx]
		local isPreAiming = false
		if nextSkill and replayFacing and nextSkill.facing then
			if progress >= nextSkill.arc - PRE_AIM_DIST and progress < nextSkill.arc then
				holdFacing(root, nextSkill.facing, 0.1)
				isPreAiming = true
			end
		end

		--// Bắn skill lúc di chuyển: nhân vật cắt qua đúng vị trí đã bấm chuột phải.
		--// Khoá facing SKILL_FACE_HOLD sau khi xả để game kịp ghi nhận hướng cast
		--// (không quay về hướng đi ngay -> skill không bị bắn lệch).
		while skillIdx <= #walkSkills and walkSkills[skillIdx].arc <= progress do
			local sk = walkSkills[skillIdx]
			if replayFacing and sk.facing then
				holdFacing(root, sk.facing, skillFaceHold)
				lastSkillFacing = sk.facing
			end
			if replaySkills then
				fireSkill(sk.key or "M2")
			end
			skillIdx += 1
		end

		--// Đứng chờ ĐÚNG thời lượng record tại vị trí tương ứng.
		local nextDwell = dwells[dwellIdx]
		if nextDwell and progress >= nextDwell.arc then
			currentMoveTarget = nil
			pcall(function() humanoid:Move(Vector3.zero, false) end)
			local dOk, dErr = runDwell(nextDwell)
			if not dOk then stopMoveRunner(); restoreAutoRotate(); return false, dErr end
			dwellIdx += 1
			prevPos = getSafePosition(root)
			lastMoved = os.clock()
			continue
		end

		--// Gần cuối -> đi thẳng nốt tới điểm cuối rồi kết thúc lượt.
		if progress >= total - ARRIVE_DIST then
			if os.clock() >= faceLockUntil then
				restoreAutoRotate()
			end
			currentMoveTarget = path[n]
			startMoveRunner(humanoid, root)
			local deadline = os.clock() + 5
			while isPlaying do
				local p2 = getSafePosition(root)
				if p2 and flatDistance(p2, path[n]) <= ARRIVE_DIST then break end
				if shared.GetCurrentRoomIndex() ~= room then stopMoveRunner(); restoreAutoRotate(); return false, "room_changed" end
				if (shared.IsBossActive() and not allowBoss) or shared.IsDead() then stopMoveRunner(); restoreAutoRotate(); return false, "dead" end
				if os.clock() >= deadline then break end
				if os.clock() >= faceLockUntil and humanoid.AutoRotate ~= true and activeHoldFacing == nil then
					humanoid.AutoRotate = true
				end
				task.wait(0.04)
			end
			stopMoveRunner()
			restoreAutoRotate()
			return true, "completed"
		end

		--// Đích luôn ở phía trước -> humanoid đi liền mạch (Adaptive Lookahead).
		if os.clock() < faceLockUntil or isPreAiming then
			--// Đang trong cửa sổ giữ facing hoặc Pre-Aim: khoá AutoRotate để nhân vật giữ góc quay lúc cast chiêu.
			if humanoid.AutoRotate ~= false then humanoid.AutoRotate = false end
		elseif humanoid.AutoRotate ~= true and activeHoldFacing == nil then
			humanoid.AutoRotate = true
		end
		local currentLookahead = getAdaptiveLookahead(progress)
		local target = pointAt(math.min(progress + currentLookahead, total - 0.01))
		sendMove(target)
		task.wait(0.04)
	end
	stopMoveRunner()
	restoreAutoRotate()
	return false, "stopped"
end

local function playbackLoop()
	--// Đi ĐÚNG 1 LẦN: mỗi room đi hết segment 1 lượt rồi ĐỨNG YÊN chờ đổi room;
	--// không đi qua lại trong room. Khi hết map (lobby) -> dừng hẳn.
	local visitedRoom = 0
	local walkedThisVisit = false
	local wasDead = false
	currentPhaseIndex = 1

	while isPlaying do
		if resumeWanted then break end

		if shared.IsDead() then
			wasDead = true
			task.wait(0.25)
			continue
		end
		if wasDead then
			wasDead = false
		end
		if shared.IsInLobby() then
			--// Hết run: dừng playback, không tự phát lại (đi 1 lần).
			resumeWanted = false
			isPlaying = false
			break
		end
		if shared.IsBossActive() and not playFullMap then
			--// Boss (mode NORMAL): đứng yên (dùng Hazard Scanner).
			task.wait(0.25)
			continue
		end

		local room = shared.GetCurrentRoomIndex()
		if room <= 0 then
			task.wait(0.1)
			continue
		end

		--// Đổi room -> lượt đi mới cho room đó (reset về Phase 1).
		if room ~= visitedRoom then
			visitedRoom = room
			walkedThisVisit = false
			currentPhaseIndex = 1
		end

		local segment = storage.GetRoomSegment(activeMap, room)
		if not segment then
			--// Room chưa record trong macro -> đứng yên chờ đổi room.
			task.wait(0.1)
			continue
		end

		local phases = segment.phases or { segment }
		local totalPhases = #phases

		if walkedThisVisit then
			--// Đã đi xong lượt của room -> đứng yên, chờ đổi room.
			task.wait(0.1)
			continue
		end

		local phaseData = phases[math.min(currentPhaseIndex, totalPhases)] or segment

		local ok, reason = walkThrough(phaseData, room, playFullMap)
		restoreAutoRotate()
		if ok then
			walkedThisVisit = true
		else
			--// Bị chết giữa chừng: tăng phase index để khi hồi sinh chạy Phase tiếp theo
			if reason == "dead" then
				currentPhaseIndex += 1
				local nextPhaseNum = math.min(currentPhaseIndex, totalPhases)
				if totalPhases > 1 then
					notifier.Notify(
						"Path Record",
						("Tử trận (Phase %d/%d): Chờ hồi sinh để chạy Phase %d..."):format(
							currentPhaseIndex - 1,
							totalPhases,
							nextPhaseNum
						),
						3
					)
				else
					notifier.Notify("Path Record", "Tử trận: Đang chờ hồi sinh để đi lại...", 2)
				end

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

--// Playback đang ở chế độ FULL (đi qua boss room theo path)?
function mover.IsBossPlayActive()
	return playFullMap
end

function mover.GetStatus()
	return {
		playing = isPlaying,
		map = activeMap,
		room = shared.GetCurrentRoomIndex(),
		boss = shared.IsBossActive(),
		phase = currentPhaseIndex,
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

	local room = shared.GetCurrentRoomIndex()
	if room <= 0 then return false, "chưa có room" end

	local map = shared.GetCurrentDungeonName()
	if not map or #map == 0 then return false, "không xác định được map" end
	if not storage.HasSegmentOrMacro(map, room) then
		return false, ("map [%s] chưa có segment room %d"):format(map, room)
	end

	--// Mode FULL: đi qua luôn boss room (miễn room đó có segment đã ghi).
	local full = storage.GetMapMode(map) == "full"
	if shared.IsBossActive() and (not full or not storage.HasSegmentOrMacro(map, room)) then
		return false, "boss room (hãy dùng Hazard Scanner)"
	end

	activeMap = map
	playFullMap = full
	resumeWanted = false
	currentPhaseIndex = 1
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
	playFullMap = false
	currentPhaseIndex = 1
	if playThread then
		task.cancel(playThread)
		playThread = nil
	end
	cancelMove(shared.GetHumanoid())
	restorePlaybackSpeed()
	restoreAutoRotate()
	fireStatus("stopped")
end

--// Nhường độc quyền cho hệ thống khác (HazardScanner/AutoFarm...): dừng nhưng
--// giữ ý định tự resume khi vào room có segment.
function mover.PauseForExclusive(silent)
	if not isPlaying then return end

	resumeWanted = true
	isPlaying = false
	playFullMap = false
	if playThread then
		task.cancel(playThread)
		playThread = nil
	end
	cancelMove(shared.GetHumanoid())
	restorePlaybackSpeed()
	restoreAutoRotate()
	if not silent then
		notifier.Notify("Path Record", "Nhường điều khiển: sẽ tự phát tiếp khi vào room có bản ghi", 3)
	end
	fireStatus("paused")
end

return mover