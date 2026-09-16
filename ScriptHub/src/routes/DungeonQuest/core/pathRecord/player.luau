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
local RunService = services.RunService or game:GetService("RunService")

--// Constants
local SIMPLIFY_TOL = 0.4 -- Studs: làm mịn quỹ đạo khi load (độ chính xác cao, bám sát từng centimet)
local ARRIVE_DIST = 0.5 -- Studs: ngưỡng coi là đã tới đích cuối (chuẩn xác từng node)
local START_REPOSITION_TIMEOUT = 8.0 -- Giây tối đa đi về node đầu trước khi phát
local LOOKAHEAD_MIN = 2.0 -- Studs: lookahead tối thiểu tại góc cua gắt (chống cắt góc/rơi vực)
local LOOKAHEAD_MAX = 4.5 -- Studs: lookahead tối đa trên đường thẳng (bám sát lòng đường tuyệt đối)
local PRE_AIM_TIME = 0.45 -- Giây đón đầu: thời gian xoay đón đầu trước khi chạm mốc xả skill / dừng
local PRE_AIM_DIST_MIN = 6.0 -- Studs tối thiểu để Pre-Aim đón đầu (thấy rõ góc quay)
local PRE_AIM_DIST_MAX = 14.0 -- Studs tối đa để Pre-Aim đón đầu
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
local preAimLeadTime = 0.45 -- Giây đón đầu: thời gian xoay đón đầu trước khi chạm mốc xả skill / dừng
local startPauseTime = 0.2 -- Giây dừng chờ tại node xuất phát (Start Node), thay thế thời gian dwell gốc

local aimSkillQ = false -- Aim/xoay mặt khi cast skill Q (mặc định tắt vì Q thường là Buff)
local aimSkillE = true -- Aim/xoay mặt khi cast skill E (mặc định bật vì E thường là Attack)

function mover.SetAimSkillQ(state)
	aimSkillQ = state and true or false
end

function mover.IsAimSkillQEnabled()
	return aimSkillQ
end

function mover.SetAimSkillE(state)
	aimSkillE = state and true or false
end

function mover.IsAimSkillEEnabled()
	return aimSkillE
end

local function shouldAimSkill(key: string?): boolean
	if key == "Q" then
		return aimSkillQ
	elseif key == "E" then
		return aimSkillE
	end
	return aimSkillQ or aimSkillE
end

function mover.SetStartPauseTime(seconds)
	if type(seconds) == "number" then
		startPauseTime = math.clamp(seconds, 0, 5.0)
	end
end

function mover.GetStartPauseTime()
	return startPauseTime
end

function mover.SetPreAimTime(seconds)
	if type(seconds) == "number" then
		preAimLeadTime = math.clamp(seconds, 0.1, 1.5)
	end
end

function mover.GetPreAimTime()
	return preAimLeadTime
end

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
local currentProgress = 0
local totalProgress = 0
local progressPercent = 0
local statusListeners = {}

local function fireStatus(reason)
	local info = {
		playing = isPlaying,
		map = activeMap,
		room = shared.GetCurrentRoomIndex(),
		boss = shared.IsBossActive(),
		phase = currentPhaseIndex,
		resume = resumeWanted,
		progressPercent = progressPercent,
		progressStuds = currentProgress,
		totalStuds = totalProgress,
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

--// ControlModule management (ngăn Roblox ControlModule ghi đè Move(0,0,0) mỗi frame)
local controlsModule = nil
local function getPlayerControls()
	if controlsModule then return controlsModule end
	pcall(function()
		local pScripts = player:FindFirstChild("PlayerScripts")
		local pMod = pScripts and pScripts:FindFirstChild("PlayerModule")
		if pMod then
			controlsModule = require(pMod):GetControls()
		end
	end)
	return controlsModule
end

local function disableControls()
	local ctrl = getPlayerControls()
	if ctrl and type(ctrl.Disable) == "function" then
		pcall(function() ctrl:Disable() end)
	end
end

local function enableControls()
	local ctrl = getPlayerControls()
	if ctrl and type(ctrl.Enable) == "function" then
		pcall(function() ctrl:Enable() end)
	end
end

--// Per-frame Move Driver (cấp vector di chuyển liên tục trước bước tính toán vật lý)
local activeMoveVector = Vector3.zero
local moveDriverConnection = nil

local function startMoveDriver()
	if moveDriverConnection then return end
	local stepSignal = RunService.PreSimulation or RunService.Heartbeat or RunService.RenderStepped
	moveDriverConnection = stepSignal:Connect(function()
		if not isPlaying then return end
		local hum = shared.GetHumanoid()
		if hum then
			hum:Move(activeMoveVector, false)
		end
	end)
end

local function stopMoveDriver()
	if moveDriverConnection then
		moveDriverConnection:Disconnect()
		moveDriverConnection = nil
	end
	activeMoveVector = Vector3.zero
	local hum = shared.GetHumanoid()
	if hum then
		pcall(function() hum:Move(Vector3.zero, false) end)
	end
end

local function setMoveTarget(targetPos)
	local root = getPlayerRoot()
	if not root or not targetPos then
		activeMoveVector = Vector3.zero
		return
	end
	local p = root.Position
	local offset = Vector3.new(targetPos.X - p.X, 0, targetPos.Z - p.Z)
	if offset.Magnitude > 0.05 then
		activeMoveVector = offset.Unit
	else
		activeMoveVector = Vector3.zero
	end
end

local function setMoveZero()
	activeMoveVector = Vector3.zero
	local hum = shared.GetHumanoid()
	if hum then
		pcall(function() hum:Move(Vector3.zero, false) end)
	end
end

--// Dừng hẳn nhân vật (khi tắt phát / nhường quyền).
local function cancelMove(humanoid)
	setMoveZero()
	stopMoveDriver()
	enableControls()
end

--// Mô phỏng kích hoạt skill theo đúng nút đã record:
--//   - "Q": VirtualInputManager:SendKeyEvent(Q)
--//   - "E": VirtualInputManager:SendKeyEvent(E)
--//   - "QE" / "Q+E" / "M2" (hoặc nil = macro cũ): Bắn cả 2 chiêu Q + E đồng thời (Dual Cast).
--// Double-cast không đồng bộ (task.spawn) để hoàn toàn KHÔNG chặn luồng di chuyển, chống khựng bước.
local function fireSkill(skillKey)
	local hold = shared.GetKeyHoldTime() or 0.05
	local delayTime = doubleClickDelay
	task.spawn(function()
		pcall(function()
			local function sendKey(keyCode, down)
				VirtualInputManager:SendKeyEvent(down, keyCode, false, game)
			end

			local function triggerCombo(key)
				if key == "Q" then
					sendKey(Enum.KeyCode.Q, true)
					task.wait(hold)
					sendKey(Enum.KeyCode.Q, false)
				elseif key == "E" then
					sendKey(Enum.KeyCode.E, true)
					task.wait(hold)
					sendKey(Enum.KeyCode.E, false)
				else
					-- "QE", "Q+E", "M2" hoặc nil: Bắn đồng thời cả Q và E
					sendKey(Enum.KeyCode.Q, true)
					sendKey(Enum.KeyCode.E, true)
					task.wait(hold)
					sendKey(Enum.KeyCode.Q, false)
					sendKey(Enum.KeyCode.E, false)
				end
			end

			-- Lần bấm 1
			triggerCombo(skillKey)

			-- Khoảng nghỉ trước lần bấm 2 (tùy chỉnh qua slider)
			if delayTime > 0 then
				task.wait(delayTime)
			end

			-- Lần bấm 2 (double-tap đảm bảo ăn skill nếu lệch CD tích tắc)
			triggerCombo(skillKey)
		end)
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

--// Xoay mượt đón đầu (Pre-Aim Lerp) về hướng ngắm mục tiêu từ xa
local function smoothFacing(root, faceLook, alpha)
	if not root or not root.Parent then return end
	local hum = shared.GetHumanoid()
	if hum and hum.AutoRotate ~= false then hum.AutoRotate = false end
	local look = faceLook or Vector3.new(1, 0, 0)
	if look.Magnitude < 0.1 then look = Vector3.new(1, 0, 0) end
	look = Vector3.new(look.X, 0, look.Z).Unit
	pcall(function()
		local p = root.Position
		local targetCF = CFrame.lookAt(p, p + look)
		root.CFrame = root.CFrame:Lerp(targetCF, math.clamp(alpha or 0.35, 0.05, 1))
	end)
end

local function restoreAutoRotate()
	local hum = shared.GetHumanoid()
	if hum then hum.AutoRotate = true end
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

	currentProgress = 0
	totalProgress = total
	progressPercent = 0
	fireStatus("progress_init")

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

	--// Tính Lookahead thích ứng theo độ uốn của quỹ đạo phía trước (Adaptive Lookahead):
	--// - Góc cua gấp (>= 60°-90°): Lookahead giảm xuống LOOKAHEAD_MIN (2.0 studs) để bám sát cua (chống cắt góc/rơi vực).
	--// - Đường thẳng: Lookahead tăng lên LOOKAHEAD_MAX (4.5 studs) để chạy liền mạch, mượt mà.
	local function getAdaptiveLookahead(curProgress)
		local remain = total - curProgress
		if remain <= 1.0 then return math.max(0.2, remain) end

		local d1 = math.min(curProgress + 2.0, total)
		local d2 = math.min(curProgress + 4.5, total)
		if d2 - curProgress < 0.8 then return math.min(LOOKAHEAD_MIN, remain) end

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
			local lk = LOOKAHEAD_MIN + (LOOKAHEAD_MAX - LOOKAHEAD_MIN) * t
			return math.min(lk, remain)
		end
		return math.min(LOOKAHEAD_MAX, remain)
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
			local arcVal = projectPoint(d.pos)
			local durVal = d.dur or 0
			-- Nếu đây là Dwell ở node xuất phát (arc <= 0.8) hoặc node kết thúc (arc >= total - 0.8), dùng thời gian từ Slider thay thế
			if arcVal <= 0.8 or arcVal >= total - 0.8 then
				durVal = startPauseTime
			end
			dwells[i] = {
				arc = arcVal,
				dur = durVal,
				facing = d.facing,
				skills = {},
				pos = d.pos,
			}
		end
		-- Nếu chưa có dwell ở start nhưng slider startPauseTime > 0, thêm 1 nhịp dừng xuất phát
		if startPauseTime > 0 and (#dwells == 0 or dwells[1].arc > 0.8) then
			table.insert(dwells, 1, {
				arc = 0,
				dur = startPauseTime,
				facing = segment.events and segment.events.startFacing or nil,
				skills = {},
				pos = segment.startPos or path[1],
			})
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
		if not isPlaying or (dwell.dur or 0) <= 0 then return true end
		if replayPauses then
			setMoveZero()

			if replayFacing and dwell.facing then
				setFacing(root, dwell.facing)
			end

			local startT = os.clock()
			local firedSkills = {}
			local dwellFaceHoldUntil = 0

			while isPlaying and (os.clock() - startT < dwell.dur) do
				if not root or not root.Parent then return false, "no_root" end
				if shared.IsDead() then return false, "dead" end
				if shared.GetCurrentRoomIndex() ~= room then return false, "room_changed" end
				if shared.IsBossActive() and not allowBoss then return false, "boss" end

				-- Ngăn di chuyển trong lúc dwell
				setMoveZero()

				-- Kích hoạt mọi skill khi đến mốc tOff
				local elapsed = os.clock() - startT
				for sIdx, sk in ipairs(dwell.skills or {}) do
					if not firedSkills[sIdx] and elapsed >= (sk.tOff or 0) then
						firedSkills[sIdx] = true
						if replayFacing and sk.facing and shouldAimSkill(sk.key) then
							setFacing(root, sk.facing)
							dwellFaceHoldUntil = os.clock() + skillFaceHold
						end
						if replaySkills then
							fireSkill(sk.key or "QE")
						end
					end
				end

				task.wait(0.03)
			end

			-- Đảm bảo xả nốt skill nào chưa kịp xả do dwell duration kết thúc sớm
			for sIdx, sk in ipairs(dwell.skills or {}) do
				if not firedSkills[sIdx] then
					firedSkills[sIdx] = true
					if replayFacing and sk.facing and shouldAimSkill(sk.key) then
						setFacing(root, sk.facing)
						dwellFaceHoldUntil = os.clock() + skillFaceHold
					end
					if replaySkills then
						fireSkill(sk.key or "QE")
					end
				end
			end

			-- Giữ facing sau skill cuối trong dwell
			while isPlaying and os.clock() < dwellFaceHoldUntil do
				setMoveZero()
				task.wait(0.03)
			end

			if replayFacing then restoreAutoRotate() end
		end
		return true
	end

	--// Tiếp cận node đầu tiên: di chuyển mượt mà tới gần rồi snap vào vị trí xuất phát.
	local startNode = segment.startPos or path[1]
	local curPos = getSafePosition(root)
	if curPos and startNode then
		local dist = flatDistance(curPos, startNode)
		if dist > 1.8 then
			local repositionDeadline = os.clock() + START_REPOSITION_TIMEOUT
			while isPlaying and os.clock() < repositionDeadline do
				local p = getSafePosition(root)
				if not p then break end
				local curDist = flatDistance(p, startNode)
				if curDist <= 1.8 then break end
				if shared.IsDead() or shared.GetCurrentRoomIndex() ~= room then break end

				setMoveTarget(startNode)
				task.wait(0.03)
			end
			setMoveZero()
		end

		-- Snap trực tiếp vào vị trí xuất phát khi đã tới gần (< 3.0 studs)
		local finalP = getSafePosition(root)
		if finalP and flatDistance(finalP, startNode) <= 3.0 then
			pcall(function()
				local currentRot = root.CFrame.Rotation
				root.CFrame = CFrame.new(startNode.X, root.Position.Y, startNode.Z) * currentRot
				root.AssemblyLinearVelocity = Vector3.zero
				root.AssemblyAngularVelocity = Vector3.zero
			end)
		end
	end

	-- Chỉ bắt đầu play path sau khi đã snap/đứng tại vị trí xuất phát
	local progress = 0
	local prevPos = startNode or getSafePosition(root)
	local lastMoved = os.clock()
	local dwellIdx = 1
	local skillIdx = 1
	local faceLockUntil = 0
	local lastSkillFacing = nil

	-- Đảm bảo Move Driver đang chạy liên tục ở mỗi frame
	startMoveDriver()

	while isPlaying do
		if not root or not root.Parent then restoreAutoRotate(); return false, "no_root" end
		if shared.IsDead() then restoreAutoRotate(); return false, "dead" end
		if shared.GetCurrentRoomIndex() ~= room then restoreAutoRotate(); return false, "room_changed" end
		if shared.IsBossActive() and not allowBoss then restoreAutoRotate(); return false, "boss" end -- boss mới xuất hiện -> đứng yên (chỉ khi NORMAL)

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

		currentProgress = progress
		progressPercent = total > 0 and math.clamp(math.floor((progress / total) * 100), 0, 100) or 0

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
		--// Khoá facing SKILL_FACE_HOLD sau khi xả để game kịp ghi nhận hướng cast.
		while skillIdx <= #walkSkills and walkSkills[skillIdx].arc <= progress do
			local sk = walkSkills[skillIdx]
			if replayFacing and sk.facing and shouldAimSkill(sk.key) then
				setFacing(root, sk.facing)
				lastSkillFacing = sk.facing
				faceLockUntil = os.clock() + skillFaceHold
			end
			if replaySkills then
				fireSkill(sk.key or "QE")
			end
			skillIdx += 1
		end

		--// Đứng chờ ĐÚNG thời lượng record tại vị trí tương ứng.
		while dwellIdx <= #dwells and progress >= dwells[dwellIdx].arc do
			local currentDw = dwells[dwellIdx]
			local dOk, dErr = runDwell(currentDw)
			if not dOk then setMoveZero(); restoreAutoRotate(); return false, dErr end
			dwellIdx += 1
			prevPos = getSafePosition(root)
			lastMoved = os.clock()
		end

		--// Early Facing: Tìm hướng quay đón đầu của node sự kiện tiếp theo (Skill / Dwell).
		local nextEventFacing = nil
		if replayFacing then
			local bestArc = math.huge
			local dIdx = dwellIdx
			while dIdx <= #dwells do
				local dw = dwells[dIdx]
				local dFace = nil
				if dw.skills and #dw.skills > 0 then
					for _, sk in ipairs(dw.skills) do
						if sk.facing and shouldAimSkill(sk.key) then
							dFace = sk.facing
							break
						end
					end
				end
				dFace = dFace or dw.facing
				if dFace then
					if dw.arc < bestArc then
						bestArc = dw.arc
						nextEventFacing = dFace
					end
					break
				end
				dIdx += 1
			end

			local sIdx = skillIdx
			while sIdx <= #walkSkills do
				local sk = walkSkills[sIdx]
				if sk.facing and shouldAimSkill(sk.key) then
					if sk.arc < bestArc then
						bestArc = sk.arc
						nextEventFacing = sk.facing
					end
					break
				end
				sIdx += 1
			end
		end

		--// Điều phối hướng quay khi di chuyển:
		--// 1. Đang trong cửa sổ giữ hướng sau xả chiêu (faceLockUntil) -> giữ chặt hướng chiêu vừa bắn.
		--// 2. Có sự kiện kế tiếp -> chủ động quay trước (Early Facing) theo hướng của node đó.
		--// 3. Không còn sự kiện nào trong phòng -> trả lại AutoRotate tự nhiên theo hướng bước đi.
		if replayFacing then
			if os.clock() < faceLockUntil then
				if lastSkillFacing then
					smoothFacing(root, lastSkillFacing, 0.45)
				end
				if humanoid.AutoRotate ~= false then humanoid.AutoRotate = false end
			elseif nextEventFacing then
				smoothFacing(root, nextEventFacing, 0.35)
				if humanoid.AutoRotate ~= false then humanoid.AutoRotate = false end
			else
				if humanoid.AutoRotate ~= true then humanoid.AutoRotate = true end
			end
		else
			if humanoid.AutoRotate ~= true then humanoid.AutoRotate = true end
		end

		--// Gần cuối -> đi thẳng nốt tới điểm cuối rồi kết thúc lượt.
		if progress >= total - ARRIVE_DIST then
			-- Xả nốt toàn bộ Dwell & Skill còn sót lại ở cuối phòng
			while dwellIdx <= #dwells do
				local currentDw = dwells[dwellIdx]
				local dOk, dErr = runDwell(currentDw)
				if not dOk then setMoveZero(); restoreAutoRotate(); return false, dErr end
				dwellIdx += 1
			end
			while skillIdx <= #walkSkills do
				local sk = walkSkills[skillIdx]
				if replayFacing and sk.facing and shouldAimSkill(sk.key) then
					setFacing(root, sk.facing)
					lastSkillFacing = sk.facing
					faceLockUntil = os.clock() + skillFaceHold
				end
				if replaySkills then
					fireSkill(sk.key or "QE")
				end
				skillIdx += 1
			end

			local deadline = os.clock() + 5
			while isPlaying do
				local p2 = getSafePosition(root)
				if not p2 then break end
				local curDist = flatDistance(p2, path[n])
				if curDist <= ARRIVE_DIST then break end
				if shared.GetCurrentRoomIndex() ~= room then setMoveZero(); restoreAutoRotate(); return false, "room_changed" end
				if (shared.IsBossActive() and not allowBoss) or shared.IsDead() then setMoveZero(); restoreAutoRotate(); return false, "dead" end
				if os.clock() >= deadline then break end

				setMoveTarget(path[n])

				if os.clock() < faceLockUntil then
					if lastSkillFacing then smoothFacing(root, lastSkillFacing, 0.45) end
					if humanoid.AutoRotate ~= false then humanoid.AutoRotate = false end
				elseif humanoid.AutoRotate ~= true then
					humanoid.AutoRotate = true
				end
				task.wait(0.03)
			end
			setMoveZero()
			restoreAutoRotate()
			currentProgress = total
			progressPercent = 100
			return true, "completed"
		end

		--// Đích luôn ở phía trước -> humanoid đi liền mạch (Adaptive Lookahead).
		local currentLookahead = getAdaptiveLookahead(progress)
		local target = pointAt(math.min(progress + currentLookahead, total - 0.01))
		setMoveTarget(target)
		task.wait(0.03)
	end
	setMoveZero()
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
			currentProgress = 0
			totalProgress = 0
			progressPercent = 0
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
			currentProgress = totalProgress
			progressPercent = 100
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
	stopMoveDriver()
	enableControls()
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
		progressPercent = progressPercent,
		progressStuds = currentProgress,
		totalStuds = totalProgress,
	}
end

function mover.OnStatusChanged(callback)
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
	currentProgress = 0
	totalProgress = 0
	progressPercent = 0
	isPlaying = true
	disableControls()
	startMoveDriver()
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
	currentProgress = 0
	totalProgress = 0
	progressPercent = 0
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
function mover.PauseForExclusive()
	if not isPlaying then return end

	resumeWanted = true
	isPlaying = false
	playFullMap = false
	currentProgress = 0
	totalProgress = 0
	progressPercent = 0
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