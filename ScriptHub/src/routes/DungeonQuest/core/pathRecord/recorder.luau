-- Path Record System – Recorder: ghi 1 SEGMENT (1 room) mỗi phiên.
--   - Bấm Record: vị trí đứng hiện tại = điểm khởi đầu của room này.
--   - TỰ TẮT + lưu khi CHUYỂN ROOM (OnRoomIndexChanged), khi vào BOSS, hoặc về LOBBY.
--   - Mỗi lần lưu gộp segment vào macro của MAP (mỗi room 1 segment; ghi lại room
--     nào thì ghi đè segment cũ của room đó). Macro = toàn bộ room đã record của map.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local storage = require("@routes/DungeonQuest/core/pathRecord/storage")
local notifier = require("@routes/DungeonQuest/core/notifier")

local RunService = services.RunService
local player = services.player
local UserInputService = services.UserInputService

--// Constants
local MIN_SPACING = 0.2 -- Studs tối thiểu giữa 2 điểm khi ghi (bắt mịn hơn để khớp vị trí)
local MAX_POINTS = 4000 -- Giới hạn điểm 1 segment
local SIMPLIFY_TOL = 1.0 -- Studs: dung sai làm mịn Douglas-Peucker khi lưu
local DWELL_MIN = 0.5 -- Giây đứng yên tối thiểu mới ghi event "dừng"
local MOVING_EPS = 0.15 -- Studs/frame: coi là đang di chuyển nếu vượt ngưỡng này

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
local startRoom = 0
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

--// Listeners
local statusListeners = {}

local function fireStatus()
	local info = {
		recording = isRecording,
		map = recMap,
		room = startRoom,
		pointCount = #points,
		dwellCount = #dwells,
		skillCount = #skills,
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

--// Khởi động LẠI segment từ vị trí hiện tại (chết/hồi sinh hoặc dịch chuyển lớn):
--// xoá points + timeline cũ -> KHÔNG còn đường nối thẳng (teleport line) từ chỗ cũ.
local function restartSegment()
	local target = getPlayerRoot()
	if not target then return false end
	local pos = target.Position
	startPos = pos
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
	fireStatus()
	return true
end

function recorder.IsRecording()
	return isRecording
end

function recorder.GetStartRoom()
	return startRoom
end

--// Điểm đang ghi (cho visual / status).
function recorder.GetCurrentPoints()
	return points
end

function recorder.GetStatus()
	return {
		recording = isRecording,
		map = recMap,
		room = startRoom,
		pointCount = #points,
	}
end

function recorder.OnStatusChanged(callback)
	if type(callback) == "function" then
		table.insert(statusListeners, callback)
	end
end

--// Bắt đầu record 1 room. Trả về ok, err.
function recorder.Start()
	if isRecording then return false, "đang record rồi" end

	local root = getPlayerRoot()
	if not root then return false, "chưa có nhân vật" end
	if shared.IsDead() then return false, "nhân vật đang chết" end
	if shared.IsBossActive() then return false, "boss room (dùng Smart Dodge)" end

	local room = shared.GetCurrentRoomIndex()
	if room <= 0 then return false, "không nằm trong dungeon" end

	local map = shared.GetCurrentDungeonName()
	if not map or #map == 0 then return false, "không xác định được map" end

	recMap = map
	startRoom = room
	startPos = root.Position
	points = { startPos }
	isRecording = true

	--// Timeline (dwells/skills) của đoạn record này.
	recStartT = os.clock()
	dwells = {}
	skills = {}
	currentDwell = nil
	currentDwellStartRel = 0
	stationarySince = nil
	standingAnchor = nil
	standingFacing = nil
	prevFramePos = root.Position
	roomChangePending = false
	movedDist = 0
	movingTime = 0
	lastFrameT = os.clock()

	--// Sample vị trí nhân vật + phát hiện đứng yên (dwell) để ghép timeline.
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
		if shared.IsBossActive() then return end
		local pos = target.Position

		--// Nhảy vọt vị trí bất thường (chết/teleport/respawn KHÔNG có CharacterAdded):
		--// cmt lại segment từ điểm hiện tại, không nối thẳng sang vị trí mới.
		local lastPt = points[#points]
		if lastPt and (pos - lastPt).Magnitude > 35 then
			restartSegment()
			return
		end

		--// Ước lượng tốc độ di chuyển: cộng dồn quãng đường + thời gian đang đi (luôn chạy).
		local now = os.clock()
		local moved = prevFramePos and (pos - prevFramePos).Magnitude or 0
		prevFramePos = pos
		local dt = lastFrameT and math.max(0, now - lastFrameT) or 0
		lastFrameT = now
		if moved >= MOVING_EPS then
			movedDist += moved
			movingTime += dt
		end

		--// Dwell detection: đứng yên liên tục -> gộp thành event "dừng" (vị trí+thời gian+facing).
		if captureDwells then
			if moved < MOVING_EPS then
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
				end
			else
				stationarySince = nil
				currentDwell = nil
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

	--// Capture chuột phải = kích hoạt skill (kèm vị trí + facing + thời gian trong dwell).
	if captureSkills then
		inputConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
			if not isRecording or not captureSkills then return end
			if input.UserInputType ~= Enum.UserInputType.MouseButton2 then return end
			if gameProcessed then return end
			if UserInputService:GetFocusedTextBox() then return end
			if shared.IsDead() then return end

			local target = getPlayerRoot()
			if not target then return end

			local ev = {
				pos = target.Position,
				facing = getFacing(),
				dw = 0,
				dwT = 0,
			}
			if currentDwell then
				ev.dw = currentDwell.index
				ev.dwT = math.max(0, (os.clock() - recStartT) - currentDwellStartRel)
			end
			table.insert(skills, ev)
		end)
	end

	--// TỰ TẮT khi chuyển room (callback không truyền tham số -> đọc lại index).
	--// TRỄ 1 GIÂY: vừa đổi room vẫn ghi nốt đoạn đi qua trong 1s rồi mới dừng.
	--// roomChangePending chống stack nhiều lần đổi room trong khoảng chờ.
	roomChangeConnection = shared.OnRoomIndexChanged(function()
		if isRecording then
			local current = shared.GetCurrentRoomIndex()
			if current ~= startRoom and not roomChangePending then
				roomChangePending = true
				task.delay(1, function()
					roomChangePending = false
					if isRecording then recorder.Stop("chuyển room") end
				end)
			end
		end
	end)

	--// Vào boss -> tắt + lưu segment đã ghi.
	bossConnection = shared.OnBossActiveChanged(function(active)
		if isRecording and active then
			recorder.Stop("vào boss room")
		end
	end)

	--// Về lobby -> hết map -> tắt + lưu.
	lobbyConnection = shared.OnLobbyChanged(function(inLobby)
		if isRecording and inLobby then
			recorder.Stop("về lobby")
		end
	end)

	--// Bắt sự kiện hồi sinh khi đang record: làm mới segment room hiện tại từ vị trí hồi sinh mới,
	--// loại bỏ hoàn toàn đoạn nối thẳng (teleport line) từ điểm chết về điểm hồi sinh.
	--// (TH hồi sinh KHÔNG có CharacterAdded vẫn được bắt qua guard gap > 35 ở heartbeat.)
	respawnConnection = shared.OnRespawn(function()
		if not isRecording then return end
		task.delay(0.2, function()
			if not isRecording or shared.IsDead() then return end
			if restartSegment() then
				notifier.Notify("Path Record", ("Phát hiện hồi sinh: Tự động ghi lại room %d từ điểm hồi sinh"):format(startRoom), 3)
			end
		end)
	end)

	notifier.Notify("Path Record", ("Bắt đầu record room %d (%s)"):format(room, map), 2)
	fireStatus()
	return true
end

--// Dừng + gộp segment vào macro của map. Trả về ok.
function recorder.Stop(reason)
	if not isRecording then return false end

	isRecording = false
	stopSubscriptions()

	--// Gói timeline events (dwells + skills) nếu có.
	local events
	if #dwells > 0 or #skills > 0 then
		events = { dwells = dwells, skills = skills }
	end

	--// Tốc độ trung bình thực tế lúc di chuyển; playback ép lại tốc độ này để
	--// nhân vật tới vị trí ĐÚNG LÚC như record (skill không bị trễ/quá nhanh).
	local avgSpeed = 0
	if movingTime > 0.5 and movedDist > 5 then
		avgSpeed = math.clamp(movedDist / movingTime, 5, 100)
	end

	local clean = storage.SimplifyPath(points, SIMPLIFY_TOL)
	local saved = storage.SaveSegment(recMap, startRoom, startPos, clean, events, avgSpeed)
	if saved then
		local extra = ""
		if events then
			extra = (" (%d điểm gốc -> %d mịn, %d skill, %d nhịp dừng, %.1fspd)"):format(#points, #clean, #skills, #dwells, avgSpeed)
		else
			extra = (" (%d điểm gốc -> %d mịn, %.1fspd)"):format(#points, #clean, avgSpeed)
		end
		notifier.Notify("Path Record", ("Đã lưu room %d%s vào map [%s] %s"):format(startRoom, extra, recMap, reason and ("- " .. reason) or ""), 3)
	end

	recMap = nil
	startRoom = 0
	startPos = nil
	points = {}
	dwells = {}
	skills = {}
	currentDwell = nil
	stationarySince = nil
	prevFramePos = nil
	roomChangePending = false
	movedDist = 0
	movingTime = 0
	lastFrameT = nil
	fireStatus()
	return saved
end

--// Huỷ record KHÔNG lưu (shutdown / discard).
function recorder.Cancel()
	if not isRecording then return end

	stopSubscriptions()
	recMap = nil
	startRoom = 0
	startPos = nil
	points = {}
	dwells = {}
	skills = {}
	currentDwell = nil
	stationarySince = nil
	prevFramePos = nil
	roomChangePending = false
	movedDist = 0
	movingTime = 0
	lastFrameT = nil
	isRecording = false
	fireStatus()
end

return recorder