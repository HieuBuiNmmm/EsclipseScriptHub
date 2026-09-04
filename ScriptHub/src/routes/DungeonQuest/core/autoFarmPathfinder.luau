-- AutoFarm Pathfinder (v2): cơ chế 2 pha dựa trên state.
--  * Scan 1 lần all enemy -> lock target kẻ địch gần nhất (highlight lock target).
--  * CHASE (chưa trong tầm): Pathfinding di chuyển theo waypoint tới kẻ địch.
--    Heartbeat check khoảng cách player <-> enemy lock realtime.
--  * HOLD (lọt vào tầm skillRange): hủy pathfinding, đứng yên ở chính vị trí hiện tại
--    (orbit tĩnh, tâm là kẻ địch lock, speed 0, giữ nguyên height) + quay mặt enemy
--    + Auto Skill spam Q+E liên tục.
-- Tách biệt hoàn toàn với AutoFarm v1 (orbit).

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local macLib = require("@packages/Maclib")

--// Services
local HttpService = game:GetService("HttpService")

--// Persistence (nhớ trạng thái debug overlay giữa các lần execute)
local SETTINGS_FILE = macLib.Folder .. "/settings/pathfinder-debug.json"
local ANCHORS_FILE = macLib.Folder .. "/settings/anchors.json"

--// State persist (khai báo TRƯỚC các hàm load/save để tham chiếu đúng local, không phải global).
local visualDebug = true
local respawnOnNoPath = true --// khi cả path enemy + anchor đều fail -> self-kill để respawn
local anchorFallback = false --// toggle: có dùng anchor để reach (fallback) khi nopath enemy hay không (mặc định tắt)
local showAnchorMarkers = true --// hiện marker vị trí các anchor đã đặt

--// Anchor: nhóm theo MAP (dungeon). anchors[mapName] = mảng { id, room, pos } theo thứ tự đặt.
--// Khi nopath, pathfinder reach anchor tiếp theo của map hiện tại (ưu tiên room hiện tại) để
--// path graph tiếp tục hoạt động thay vì kill/reset player. Lưu riêng file anchors.json để dùng
--// lại giữa các lần chơi (mỗi map có danh sách anchor riêng, giống contextual).
local anchors = {} --// { [mapName] = { {id, room, pos}, ... } }
local anchorSeq = 0 --// id tăng dần toàn cục, dùng để phân biệt/xóa ổn định

local function loadDebugSettings()
	if not (isfile and isfile(SETTINGS_FILE)) then return end
	local ok, decoded = pcall(function()
		return HttpService:JSONDecode(readfile(SETTINGS_FILE))
	end)
	if ok and type(decoded) == "table" then
		if decoded.enabled ~= nil then visualDebug = decoded.enabled == true end
		if decoded.showAnchors ~= nil then showAnchorMarkers = decoded.showAnchors == true end
	end
end

local function saveDebugSettings()
	if not (isfile and writefile) then return end
	pcall(function()
		writefile(SETTINGS_FILE, HttpService:JSONEncode({
			enabled = visualDebug,
			showAnchors = showAnchorMarkers,
		}))
	end)
end

--// ---------- Anchor persistence (tách file riêng, chia theo map) ----------
local function anchorToSerialized(a)
	return { id = a.id, room = a.room, pos = { a.pos.X, a.pos.Y, a.pos.Z } }
end

local function loadAnchors()
	if not (isfile and isfile(ANCHORS_FILE)) then return end
	local ok, decoded = pcall(function()
		return HttpService:JSONDecode(readfile(ANCHORS_FILE))
	end)
	if not ok or type(decoded) ~= "table" then return end
	anchors = {}
	anchorSeq = 0
	for mapName, list in pairs(decoded) do
		if type(mapName) == "string" and #mapName > 0 and type(list) == "table" then
			local out = {}
			for _, entry in ipairs(list) do
				local room = typeof(entry.room) == "number" and entry.room or nil
				local id = typeof(entry.id) == "number" and entry.id or nil
				local pos = nil
				if typeof(entry.pos) == "table" and typeof(entry.pos[1]) == "number"
					and typeof(entry.pos[2]) == "number" and typeof(entry.pos[3]) == "number" then
					pos = Vector3.new(entry.pos[1], entry.pos[2], entry.pos[3])
				end
				if room and id and pos then
					table.insert(out, { id = id, room = room, pos = pos })
					if id > anchorSeq then anchorSeq = id end
				end
			end
			if #out > 0 then anchors[mapName] = out end
		end
	end
end

local function saveAnchors()
	if not (isfile and writefile) then return end
	local out = {}
	for mapName, list in pairs(anchors) do
		local arr = {}
		for i = 1, #list do arr[i] = anchorToSerialized(list[i]) end
		out[mapName] = arr
	end
	pcall(function()
		writefile(ANCHORS_FILE, HttpService:JSONEncode(out))
	end)
end

--// References
local RunService = services.RunService
local VirtualInputManager = services.VirtualInputManager
local player = services.player
local PathfindingService = game:GetService("PathfindingService")

--// Table
local autoFarmPathfinder = {}

--// Configuration (state)
local enabled = false
local running = false
local skillRange = 70
local moveSpeed = 50
	local retargetInterval = 1.0 --// giữ cho accessor/UI cũ không lỗi; không còn điều khiển poll (event-driven)
local skillEnabled = true
local skillInterval = 0.5
local skillMode = "Alternate" --// "Both" = Q+E cùng lúc, "Alternate" = Q -> E -> Q -> E
local skillTurn = 0 --// dùng cho mode Alternate (0 = Q, 1 = E)

--// Runtime
local moveConnection = nil
local enemyChangedConnection = nil --// sự kiện enemy đổi -> reselect target (event-driven)
local respawnConnection = nil --// reset trạng thái khi nhân vật respawn
local lastSkillTime = 0
local cachedNearestEnemy = nil --// cache enemy gần nhất trong 1 frame (tránh gọi getNearestEnemy nhiều lần)
local cachedNearestValid = false
local dunReady = false
local currentPath = nil
local waypointIndex = 1
local pathComputed = false
local chaseTarget = nil
local autoRotateOwner = false
local autoRotateHumanoid = nil
local oldAutoRotate = nil
local debugTargetPart = nil
local debugEnemyHighlight = nil
local debugPathParts = {} --// các sphere xanh lá show path
local debugAnchorParts = {} --// marker (part + label) hiện vị trí anchor đã đặt
local holdAngle = nil
local holdRadius = nil
local lockedTargetModel = nil
local chaseModel = nil
local chasePathTargetModel = nil
local pathIsAnchor = false --// path hiện tại là đi tới anchor (không phải enemy)
local anchorWalking = false --// ĐANG Ở LUỒNG DI CHUYỂN ANCHOR RIÊNG: hiện là no-op (debug), chỉ để giữ trạng thái
--// và tránh retry/log lại mỗi frame khi đang fallback anchor.
local lastFallbackLogAt = 0 --// throttle log rơi vào fallback anchor (chỉ in 1 lần mỗi episode, không spam)
local anchorStuckPos = nil --// vị trí theo dõi kẹt nhẹ khi đi ở luồng anchor walk
local anchorStuckTimer = 0 --// thời gian đứng im trong luồng anchor walk
local ANCHOR_STUCK_WINDOW = 3.0 --// giây: đứng im quá lâu khi đi anchor thì rebuild path 1 lần
--// Free-walk sau khi hết anchor: đi thẳng theo hướng đang facing trong N giây để băng qua khúc
--// navmesh không phủ, rồi quay lại pathfinding (resume CHASE). KHÔNG liên quan enemy.
local freeWalkActive = false
local freeWalkDir = nil --// hướng đi (Vector3 ngang, đơn vị) cố định trong suốt free-walk
local freeWalkTimer = 0 --// thời gian còn lại của free-walk
local freeWalkDest = nil --// đích MoveTo rất xa phía trước theo hướng nhìn (đi thẳng đáng tin cậy)
local FREE_WALK_DURATION = 1.5 --// giây đi thẳng mỗi lần hết anchor
local FREE_WALK_DISTANCE = 40 --// stud: đích MoveTo cách player (đủ xa để đi thẳng trong FREE_WALK_DURATION)
--// Anchor chain (có lock): khi nopath tới enemy, pathfinder khóa vào anchor (anchorChainIndex)
--// và đi tới nơi; chỉ advance sang anchor kế theo thứ tự đặt khi đã TỚI anchor hiện tại mà vẫn
--// nopath (tránh spam đổi target / vẽ path lung tung). anchorChainMap nhớ map đang duyệt.
local anchorChainMap = nil --// map mà chain đang duyệt
local anchorChainIndex = 0 --// index anchor đang KHOÁ (target hiện tại)
--// Gate path build theo STATE (không theo time cooldown): chỉ build path khi thật sự cần.
--// Spam trước đây do khi nopath, computeChasePath retry cùng enemy mỗi frame vô hạn. Giải pháp:
--// nhớ target (enemy + vị trí đích) của lần build FAIL gần nhất; KHÔNG retry build path tới cùng
--// target unreachable (player/enemy chưa dịch chuyển đáng kể) -> đứng yên/đi anchor thay vì spam.
--// Chỉ build lại khi: target đổi, hoặc vị trí đích đã dịch chuyển > REPATH_TOL.
local lastFailedModel = nil --// enemy model của lần build path fail gần nhất
local lastFailedDest = nil --// vị trí đích (enemy) của lần build fail gần nhất
local REPATH_TOL = 3 --// stud: đích dịch chuyển trên mức này thì đủ điều kiện build lại
--// Cooldown retry path cho cùng 1 enemy + đích đứng yên: stand không "khoá cứng" mà thử lại
--// build path sau mỗi RETRY_COOLDOWN giây (chống spam mỗi frame, vẫn tự hồi phục khi có đường).
local lastFailedTime = 0 --// os.clock() của lần build path fail gần nhất
local RETRY_COOLDOWN = 1.5 --// giây giữa 2 lần retry build path cùng enemy đứng yên
--// Chống self-kill lặp liên tục khi thật sự không path được (kill xong respawn -> lại thử).
local lastSelfKillTime = 0
local SELF_KILL_COOLDOWN = 2.0
--// Stuck detection: phát hiện đứng im dù path đang chạy -> chạy chuỗi gỡ kẹt:
--// nhảy -> strafe trái -> strafe phải -> reset player (Health=0 để game respawn).
--// (vật cản thấp/kệ mép mà path không đánh dấu Jump waypoint).
local stuckCheckPos = nil
local stuckCheckTimer = 0
local stuckStage = 0 --// 0=chưa xử lý, 1=đã nhảy, 2=đang strafe trái, 3=đang strafe phải, 4=đã reset
local stuckStrafeDir = 0 --// -1 = trái, 1 = phải
local stuckStrafeEndTime = 0
local STUCK_DIST = 0.3 --// tiến tới < 0.3 stud (ngang, không tính Y) sau cửa sổ => kẹt
local STUCK_WINDOW = 0.6 --// giây đứng im trước khi chuyển bước xử lý kẹt
local STUCK_STRAFE_DIST = 5 --// độ lệch sang trái/phải khỏi waypoint
local STUCK_STRAFE_HOLD = 1.0 --// giây duy trì hướng strafe trước khi kiểm tra lại

--// Helpers
local function getPlayerRoot()
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if root and root.Parent then return root end
	return nil
end

--// Đọc vị trí của root an toàn (đề phòng root bị destroy/rm giữa chừng lúc enemy chết
--// -> tránh throw lỗi làm abort stepMovement, gây "state=CHASE nhưng không di chuyển").
local function getSafePosition(part)
	if not part or not part.Parent then return nil end
	local ok, pos = pcall(function()
		return part.Position
	end)
	if not ok or not pos then return nil end
	return pos
end

--// Lấy kẻ địch gần nhất theo khoảng cách tới player.
local function getNearestEnemy()
	local playerRoot = getPlayerRoot()
	if not playerRoot then return nil end
	local playerPos = getSafePosition(playerRoot)
	if not playerPos then return nil end
	local nearest = nil
	local nearestDist = math.huge
	for _, data in ipairs(shared.GetTrackedEnemyData()) do
		if data and data.Root and data.Root.Parent then
			local rootPos = getSafePosition(data.Root)
			if rootPos then
				local dist = (rootPos - playerPos).Magnitude
				if dist < nearestDist then
					nearestDist = dist
					nearest = data
				end
			end
		end
	end
	return nearest
end

--// Lấy data theo model cụ thể (dùng cho enemy bị khóa trong HOLD).
local function getEnemyByModel(model)
	if not model then return nil end
	for _, data in ipairs(shared.GetTrackedEnemyData()) do
		if data and data.Model == model and data.Root and data.Root.Parent then
			return data
		end
	end
	return nil
end

--// Khôi phục AutoRotate lúc tắt luồng hoặc khi đổi nhân vật.
local function restoreAutoRotate()
	if not autoRotateOwner then return end
	local humanoid = autoRotateHumanoid or shared.GetHumanoid()
	if humanoid and humanoid.Parent then humanoid.AutoRotate = oldAutoRotate end
	autoRotateOwner = false
	autoRotateHumanoid = nil
	oldAutoRotate = nil
end

--// Tắt AutoRotate khi có humanoid để không chống đối việc xoay thủ công.
--// Nếu đổi nhân vật (respawn) thì capture lại AutoRotate của nhân vật mới.
local function ensureAutoRotateDisabled()
	local humanoid = shared.GetHumanoid()
	if not humanoid or not humanoid.Parent then return end
	if autoRotateOwner and humanoid == autoRotateHumanoid then return end
	if autoRotateOwner then restoreAutoRotate() end
	oldAutoRotate = humanoid.AutoRotate
	humanoid.AutoRotate = false
	autoRotateHumanoid = humanoid
	autoRotateOwner = true
end

--// Bật lại AutoRotate cho CHASE: MoveTo sẽ tự xoay nhân vật theo hướng đi,
--// đúng hành vi Click-to-Move của Roblox. Tắt lại ở HOLD để xoay thủ công.
local function ensureAutoRotateEnabled()
	if not autoRotateOwner then return end
	local humanoid = autoRotateHumanoid or shared.GetHumanoid()
	if humanoid and humanoid.Parent then humanoid.AutoRotate = true end
	autoRotateOwner = false
	autoRotateHumanoid = nil
	oldAutoRotate = nil
end

local PATH_PARAMS = {
	AgentRadius = 1,
	AgentHeight = 5,
	AgentCanJump = true,
	AgentCanClimb = true,
	AgentMaxSlope = 75,
	WaypointSpacing = 2,
	Costs = { Water = 20, Lava = 20 },
}

--// Fallback: nới lỏng hơn nữa khi path chính fail (địa hình phức tạp, navmesh gaps, bậc thang cao).
local PATH_PARAMS_RELAXED = {
	AgentRadius = 0.25,
	AgentHeight = 4,
	AgentCanJump = true,
	AgentCanClimb = true,
	AgentMaxSlope = 90,
	WaypointSpacing = 6,
	Costs = {},
}

--// Tìm anchor cần reach khi nopath của MAP hiện tại, theo cơ chế CHAIN có LOCK:
--// KHÓA VÀO 1 anchor duy nhất (anchorChainIndex) và đi tới nơi (trong nearAnchorTol studs).
--// Chỉ advance sang anchor KẾ TIẾP theo đúng thứ tự đặt khi đã thực sự TỚI anchor hiện tại
--// mà vẫn nopath tới enemy. Tránh spam đổi target anchor (trước đây advance mỗi lần recompute
--// -> vẽ path lung tung qua nhiều anchor). Anchor nào ĐÃ TỚI (reach) sẽ được đánh dấu visited
--// -> đổi màu marker + KHÔNG target lại trong phiên này. Trả về Vector3 hoặc nil.
local nearAnchorTol = 5

local refreshAnchorMarkers --// forward ref (định nghĩa sau)

--// Quét anchor map hiện tại THEO VỊ TRÍ mỗi frame: anchor nào player đang đứng gần (<= nearAnchorTol)
--// mà đã TỪNG ở xa nó (wasFar) -> đánh dấu visited (đã đi qua/tiến tới nó từ xa). Trả về true nếu có
--// thay đổi (để refresh marker đổi màu + chain không target lại). KHÔNG mark ngay khi player chỉ đứng
--// sẵn gần anchor từ đầu (anchor thường đặt tại vị trí đang đứng) để không mất anchor chưa thực sự dùng.
local function sweepNearbyAnchors(playerPos)
	local mapName = shared.GetCurrentDungeonName()
	local list = (type(mapName) == "string" and anchors[mapName]) or nil
	if not list then return false end
	local current = shared.GetCurrentRoomIndex()
	current = (type(current) == "number" and current) or -1
	local changed = false
	for _, a in ipairs(list) do
		--// Gate THEO ROOM: chỉ đánh dấu visited khi ĐÚNG room của anchor (anchor room nào tới đó
		--// mới tính). Lúc chuyển room (current<=0) không đánh dấu bất kỳ anchor nào.
		if a.room ~= current then continue end
		local d = a.pos and playerPos and (a.pos - playerPos).Magnitude or math.huge
		if not a.visited and d > nearAnchorTol then
			a.wasFar = true
		elseif not a.visited and a.wasFar and d <= nearAnchorTol then
			a.visited = true
			a.wasFar = nil
			changed = true
		end
	end
	if changed then refreshAnchorMarkers() end
	return changed
end

local function findNextAnchor()
	local mapName = shared.GetCurrentDungeonName()
	local list = (type(mapName) == "string" and anchors[mapName]) or nil
	if not (type(mapName) == "string" and #mapName > 0) or not list then
		anchorChainMap = nil
		anchorChainIndex = 0
		return nil
	end
	if anchorChainMap ~= mapName then
		anchorChainMap = mapName
		anchorChainIndex = 0
	end

	local playerRoot = getPlayerRoot()
	local playerPos = playerRoot and getSafePosition(playerRoot) or nil
	local current = shared.GetCurrentRoomIndex()
	current = (type(current) == "number" and current) or -1

	--// Gate THEO ROOM: chỉ dùng anchor khi ĐANG TRONG đúng 1 room đang có quái (current == room anchor).
	--// current = room của enemy đang track; lúc CHUYỂN ROOM (xong quái room này, chờ quái room sau)
	--// thì không còn quái -> current = 0 -> KHÔNG được dùng anchor nào (tránh nhảy target sang
	--// anchor room khác khi chưa tới đó). Anchor room nào chỉ áp dụng khi current == room đó.
	if current <= 0 then
		anchorChainIndex = 0
		return nil
	end

	local function distTo(a)
		return (playerPos and a.pos and (a.pos - playerPos).Magnitude) or math.huge
	end

	--// Đang khoá 1 anchor hợp lệ -> chỉ hợp lệ khi VẪN đúng room hiện tại (nếu đổi room thì hủy lock).
	local target = (anchorChainIndex >= 1 and anchorChainIndex <= #list) and list[anchorChainIndex] or nil
	if target and not target.visited and target.room == current then
		if distTo(target) > nearAnchorTol then
			return target.pos
		end
		--// Đã tới anchor này -> đánh dấu visited (không target lại) + đổi màu marker.
		target.visited = true
		refreshAnchorMarkers()
	end

	--// Chọn target MỚI: chỉ anchor trong ĐÚNG room hiện tại (anchor room nào thì tới đó mới dùng),
	--// theo thứ tự đặt (không quay đầu), bỏ qua anchor đang đứng cạnh + anchor đã visited.
	local best = nil
	for i = anchorChainIndex + 1, #list do
		local a = list[i]
		if not a.visited and a.room == current and distTo(a) > nearAnchorTol then
			best = i
			break
		end
	end
	anchorChainIndex = best or 0
	if anchorChainIndex == 0 then return nil end
	return list[anchorChainIndex].pos
end

--// Thử build path từ start tới dest với 2 bộ params (chính + relaxed).
--// Mount path thành path hiện tại nếu thành công. Trả về true/false.
local function tryBuildPath(start, dest, mountModel, isAnchor)
	if currentPath then pcall(function() currentPath:Destroy() end) end
	for _, params in ipairs({ PATH_PARAMS, PATH_PARAMS_RELAXED }) do
		local path = PathfindingService:CreatePath(params)
		local ok = pcall(function()
			path:ComputeAsync(start, dest)
		end)
		if ok and path.Status == Enum.PathStatus.Success and #path:GetWaypoints() > 0 then
			chaseTarget = dest
			chasePathTargetModel = mountModel
			pathIsAnchor = isAnchor == true
			--// Build path thành công -> xoá marker target fail trước đó, cho phép build lại khi cần.
			lastFailedModel = nil
			lastFailedDest = nil
			--// Path BỊ CHẶN (blocked). Với path ANCHOR: CHỈ tear-down khi THỰC SỰ KẸT (stuckStage>=1,
			--// tức không tiến được trong STUCK_WINDOW). PathfindingService có thể fire Blocked với
			--// failedWaypointIndex = nil/0 (block tổng quát) -> nếu bỏ path theo index sẽ tear-down
			--// MỖI FRAME -> rebuild path anchor liên tục cùng 1 đích (spam "REBUILD" + "Lock keep",
			--// nhân vật "đi rồi cố về" lặp lại). Vì vậy KHÔNG tear-down theo index; đích ổn định,
			--// chỉ rebuild khi kẹt thật (stuck detection) hoặc khi đi hết waypoint (advance).
			path.Blocked:Connect(function()
				if isAnchor then
					if stuckStage >= 1 then
						if visualDebug then warn("[PathAnchor] anchor path blocked + đang kẹt -> rebuild") end
						currentPath = nil
						pathComputed = false
					end
					return
				end
				currentPath = nil
				pathComputed = false
			end)
			currentPath = path
			waypointIndex = 1
			pathComputed = true
			return true
		end
		path:Destroy()
	end
	return false
end

--// CHASE: path từ vị trí player theo pathfinder tới kẻ địch gần nhất (retarget theo interval).

--// Trả về true nếu đã có path, false nếu không tính được.
--// Nhận sẵn enemy + targetPos (đã có từ stepMovement) để tránh gọi getNearestEnemy lại lần nữa.
--// Nếu path tới enemy không tính được (nopath), thử reach anchor của room hiện tại/kế bên
--// trước khi bỏ cuộc (kill để respawn).
local function computeChasePath(enemy, targetPos)
	local playerRoot = getPlayerRoot()
	if not playerRoot then return false end
	local playerPos = getSafePosition(playerRoot)
	if not playerPos then return false end
	if not enemy or not targetPos then
		currentPath = nil
		pathComputed = false
		chaseTarget = nil
		chasePathTargetModel = nil
		pathIsAnchor = false
		return false
	end

	local start = playerPos

	--// 1) Thử path tới enemy (params chính → relaxed). Thành công -> reset chuỗi anchor
	--// (đã có path tới enemy, lần nopath sau bắt đầu lại anchor đầu).
	if tryBuildPath(start, targetPos, enemy.Model, false) then
		--// Có path tới enemy -> KHÔNG ở luồng anchor nữa (chase bình thường).
		anchorWalking = false
		--// Chỉ reset + log khi chain anchor thực sự đang active (đang fallback). Nếu chain đã
		--// rỗng từ đầu (đang CHASE bình thường chưa rơi vô fallback) thì không có gì để reset,
		--// tránh spam "enemy path OK -> reset anchor chain" mỗi lần build path tới enemy.
		if anchorChainMap ~= nil or anchorChainIndex > 0 then
			anchorChainMap = nil
			anchorChainIndex = 0
			if visualDebug then warn("[PathAnchor] enemy path OK -> reset anchor chain") end
		end
		return true
	end

	--// 2) Nopath tới enemy -> FALLBACK ANCHOR (chỉ khi toggle anchorFallback bật). Khóa anchor hợp lệ
	--// cho room hiện tại (findNextAnchor) rồi vào luồng di chuyển anchor riêng. Khi tắt toggle -> bỏ qua
	--// hẳn, rơi thẳng xuống "cả 2 fail" (stand hoặc self-kill theo respawnOnNoPath).
	if anchorFallback then
		local anchorPos = findNextAnchor()
		if anchorPos then
			--// Set pathComputed=true để qua gate (line slide) KHÔNG re-invoke computeChasePath mỗi frame,
			--// chống spam ngay cả khi divert không kịp — đánh dấu đã "xử lý xong" lần này.
			pathComputed = true
			pathIsAnchor = true
			anchorWalking = true
			local now = os.clock()
			if now - lastFallbackLogAt >= 3 then
				lastFallbackLogAt = now
				warn("[PathAnchor] FALLBACK: đang rơi vào anchor (idx=" .. tostring(anchorChainIndex) .. ") cho room hiện tại")
			end
			return true
		end
	end

	--// Cả path enemy + anchor đều fail.
	currentPath = nil
	pathComputed = false
	chaseTarget = nil
	chasePathTargetModel = nil
	pathIsAnchor = false
	anchorWalking = false
	--// Nhớ target FAIL này để không retry build path vô hạn cùng enemy (spam). Chỉ build lại khi
	--// enemy đổi hoặc đích đã dịch chuyển > REPATH_TOL (xem gate trong stepMovement).
	lastFailedModel = enemy.Model
	lastFailedDest = targetPos
	lastFailedTime = os.clock()
	if visualDebug then warn("[PathAnchor] no enemy path, no anchor -> " .. (respawnOnNoPath and "self-kill" or "stand")) end
	--// Self-kill (respawn) chỉ khi bật toggle, và CÓ COOLDOWN để không kill lặp liên tục mỗi frame
	--// khi thật sự không path được (kill -> respawn -> thử lại sau quãng nghỉ).
	if respawnOnNoPath and os.clock() - lastSelfKillTime >= SELF_KILL_COOLDOWN then
		lastSelfKillTime = os.clock()
		local h = shared.GetHumanoid()
		if h and h.Parent then h.Health = 0 end
	end
	return false
end

--// Bắn combo Q+E (giống Auto Skill).
--// Mode "Both": bấm Q+E cùng lúc mỗi interval.
--// Mode "Alternate": luân phiên Q -> E -> Q -> E ... mỗi interval 1 phím.
local function fireSkills()
	if not skillEnabled then return end
	if os.clock() - lastSkillTime < skillInterval then return end
	local humanoid = shared.GetHumanoid()
	if not humanoid or not humanoid.Parent or humanoid.Health <= 0 then return end
	if shared.IsInLobby() then return end
	lastSkillTime = os.clock()

	local function pressKey(key)
		VirtualInputManager:SendKeyEvent(true, key, false, game)
		task.delay(shared.GetKeyHoldTime(), function()
			VirtualInputManager:SendKeyEvent(false, key, false, game)
		end)
	end

	if skillMode == "Alternate" then
		local key = (skillTurn == 0) and Enum.KeyCode.Q or Enum.KeyCode.E
		skillTurn = 1 - skillTurn
		pressKey(key)
	else
		pressKey(Enum.KeyCode.Q)
		pressKey(Enum.KeyCode.E)
	end
end

--// (Skill-fire đã gộp vào pipeline frame của stepMovement — tái dùng enemy/vị trí đã resolve,
--// chỉ 1 lần resolve + 1 lần đo khoảng cách mỗi frame, không spam scan.)

--// ---------- Visual debug ----------

local function ensureDebugTargetPart()
	if debugTargetPart and debugTargetPart.Parent then return debugTargetPart end
	debugTargetPart = Instance.new("Part")
	debugTargetPart.Name = "PathfinderTarget_Debug"
	debugTargetPart.Anchored = true
	debugTargetPart.CanCollide = false
	debugTargetPart.CanQuery = false
	debugTargetPart.CanTouch = false
	debugTargetPart.Size = Vector3.new(2, 2, 2)
	debugTargetPart.Transparency = 0.4
	debugTargetPart.Color = Color3.fromRGB(255, 0, 0)
	debugTargetPart.Material = Enum.Material.Neon
	debugTargetPart.Parent = workspace
	return debugTargetPart
end

--// Highlight dùng CHUNG 1 instance làm con workspace + đổi qua Adornee mỗi frame.
--// Lý do: nếu làm con của model enemy thì enemy chết -> model bị destroy -> highlight
--// chết theo và để lại instance rác gây lỗi "destroyed" ở frame sau (highlight 1s rồi hết).
local function ensureDebugHighlight()
	if debugEnemyHighlight and debugEnemyHighlight.Parent then return debugEnemyHighlight end
	if debugEnemyHighlight then
		pcall(function() debugEnemyHighlight:Destroy() end)
		debugEnemyHighlight = nil
	end
	debugEnemyHighlight = Instance.new("Highlight")
	debugEnemyHighlight.Name = "PathfinderEnemy_Debug"
	debugEnemyHighlight.FillColor = Color3.fromRGB(255, 200, 0)
	debugEnemyHighlight.FillTransparency = 0.5
	debugEnemyHighlight.OutlineColor = Color3.fromRGB(255, 0, 0)
	debugEnemyHighlight.OutlineTransparency = 0
	debugEnemyHighlight.Parent = workspace
	return debugEnemyHighlight
end

--// Cập nhật ô đỏ tại điểm đuổi (enemy khi CHASE) + highlight kẻ địch gần nhất.
local function updateDebugVisuals()
	if shared.IsInLobby() then return end
	if not visualDebug then return end

	if chaseTarget then
		local part = ensureDebugTargetPart()
		part.CFrame = CFrame.new(chaseTarget)
	elseif debugTargetPart and debugTargetPart.Parent then
		debugTargetPart.CFrame = CFrame.new(0, -1000, 0)
	end

	--// Highlight target hiện tại: lock (HOLD) nếu có, ngược lại nearest (CHASE).
	local model = nil
	if lockedTargetModel then
		local locked = getEnemyByModel(lockedTargetModel)
		model = locked and locked.Model or nil
	end
	if not model then
		--// Dùng enemy cache của frame hiện tại nếu khả dụng, tránh scan lại toàn bộ.
		local nearest = cachedNearestValid and cachedNearestEnemy or getNearestEnemy()
		model = nearest and nearest.Model or nil
	end
	local highlight = ensureDebugHighlight()
	if not model or not model.Parent then
		highlight.Enabled = false
		return
	end
	highlight.Adornee = model
	highlight.Enabled = true
end

--// Render path bằng các sphere xanh lá tại từng waypoint.
--// Chỉ rebuild khi path đổi (currentPath mới), tránh destroy/create mỗi frame.
local DEBUG_PATH_SPHERE_SIZE = 0.9
local debugPathCachePath = nil
local function updateDebugPathSpheres()
	if not visualDebug then
		if #debugPathParts > 0 then
			for _, part in ipairs(debugPathParts) do
				pcall(function() part:Destroy() end)
			end
			table.clear(debugPathParts)
		end
		return nil
	end
	if currentPath == debugPathCachePath then return nil end

	for _, part in ipairs(debugPathParts) do
		pcall(function() part:Destroy() end)
	end
	table.clear(debugPathParts)
	debugPathCachePath = currentPath

	if not currentPath or not pathComputed then return nil end

	local ok, waypoints = pcall(function() return currentPath:GetWaypoints() end)
	if not ok or not waypoints then return nil end
	for i = 1, #waypoints do
		local wp = waypoints[i]
		if wp then
			local sphere = Instance.new("Part")
			sphere.Name = "PathfinderPath_Debug"
			sphere.Anchored = true
			sphere.CanCollide = false
			sphere.CanQuery = false
			sphere.CanTouch = false
			sphere.Size = Vector3.new(DEBUG_PATH_SPHERE_SIZE, DEBUG_PATH_SPHERE_SIZE, DEBUG_PATH_SPHERE_SIZE)
			sphere.Shape = Enum.PartType.Ball
			sphere.Transparency = 0.3
			sphere.Color = Color3.fromRGB(0, 255, 120)
			sphere.Material = Enum.Material.Neon
			sphere.CFrame = CFrame.new(wp.Position)
			sphere.Parent = workspace
			debugPathParts[#debugPathParts + 1] = sphere
		end
	end
end

--// ---------- Anchor markers (đánh dấu vị trí anchor đã đặt) ----------

local function cleanupAnchorMarkers()
	for _, part in ipairs(debugAnchorParts) do
		pcall(function() part:Destroy() end)
	end
	table.clear(debugAnchorParts)
end

local function cleanupDebugVisuals()
	if debugTargetPart then
		pcall(function() debugTargetPart:Destroy() end)
		debugTargetPart = nil
	end
	if debugEnemyHighlight then
		pcall(function() debugEnemyHighlight:Destroy() end)
		debugEnemyHighlight = nil
	end
	for _, part in ipairs(debugPathParts) do
		pcall(function() part:Destroy() end)
	end
	table.clear(debugPathParts)
	debugPathCachePath = nil
end

--// Render lại toàn bộ marker theo anchors của MAP hiện tại (không gọi nếu tắt showAnchorMarkers).
--// Chỉ được gọi từ các thao tác set/remove/clear + đổi map + khi reach anchor (không chạy mỗi frame).
--// Anchor đã reach (visited) vẽ màu XANH LÁ, chưa reach màu XANH DƯƠNG.
refreshAnchorMarkers = function()
	if not showAnchorMarkers then
		cleanupAnchorMarkers()
		return
	end
	local mapName = shared.GetCurrentDungeonName()
	local list = {}
	if type(mapName) == "string" and #mapName > 0 and anchors[mapName] then
		list = anchors[mapName]
	end

	for _, part in ipairs(debugAnchorParts) do
		pcall(function() part:Destroy() end)
	end
	table.clear(debugAnchorParts)

	for index, a in ipairs(list) do
		local visited = a.visited == true
		local color = visited and Color3.fromRGB(0, 200, 120) or Color3.fromRGB(0, 150, 255)
		local sphere = Instance.new("Part")
		sphere.Name = "PathfinderAnchor_Debug"
		sphere.Anchored = true
		sphere.CanCollide = false
		sphere.CanQuery = false
		sphere.CanTouch = false
		sphere.Size = Vector3.new(2, 2, 2)
		sphere.Transparency = 0.3
		sphere.Color = color
		sphere.Material = Enum.Material.Neon
		sphere.CFrame = CFrame.new(a.pos)
		sphere.Parent = workspace
		debugAnchorParts[#debugAnchorParts + 1] = sphere

		local label = Instance.new("BillboardGui")
		label.Name = "PathfinderAnchorLabel"
		label.Adornee = sphere
		label.Size = UDim2.fromOffset(120, 30)
		label.StudsOffset = Vector3.new(0, 2, 0)
		label.AlwaysOnTop = true
		local text = Instance.new("TextLabel")
		text.Size = UDim2.fromScale(1, 1)
		text.BackgroundTransparency = 1
		text.Text = ("R%d #%d%s"):format(a.room, index, visited and " ✓" or "")
		text.TextColor3 = color
		text.TextSize = 14
		text.Font = Enum.Font.GothamBold
		text.TextStrokeTransparency = 0
		text.Parent = label
		label.Parent = sphere
		debugAnchorParts[#debugAnchorParts + 1] = label
	end
end

--// Reset trạng thái phát hiện kẹt khi thoát khỏi pha di chuyển theo path.
local function resetStuckCheck()
	stuckCheckPos = nil
	stuckCheckTimer = 0
	stuckStage = 0
	stuckStrafeDir = 0
end

--// ---------- Event-driven: chọn/chuyển target theo sự kiện (không poll theo interval) ----------

--// Chọn lại nearest target MỘT LẦN (do sự kiện enemy đổi trigger). Nếu target model khác
--// target hiện tại thì hủy path cũ (frame sau sẽ rebuild sang target mới). Giải phóng lock HOLD
--// nếu enemy bị lock đã biến mất. Trả về model mục tiêu mới (hoặc nil).
	local function reselectTarget()
	local playerRoot = getPlayerRoot()
	if not playerRoot then return end
	local nearest = getNearestEnemy()
	cachedNearestEnemy = nearest
	cachedNearestValid = nearest ~= nil
	--// ĐANG Ở LUỒNG ANCHOR WALK: chỉ cập nhật cache target, KHÔNG đụng tới path anchor đang đi
	--// (enemy spawn/die trong lúc di chuyển tới anchor KHÔNG được làm gián đoạn path). Khi thoát
	--// luồng anchor sẽ reselect lại bình thường.
	if anchorWalking then return chaseModel end
	local newModel = nearest and nearest.Model or nil
	if newModel ~= chaseModel then
		chaseModel = newModel
		--// Target đổi -> path cũ lỗi thời, hủy để frame kế rebuild sang target mới.
		if currentPath then pcall(function() currentPath:Destroy() end) end
		currentPath = nil
		pathComputed = false
		chasePathTargetModel = nil
		--// Đang HOLD mà enemy lock đã mất -> giải phóng lock.
		if lockedTargetModel and not getEnemyByModel(lockedTargetModel) then
			lockedTargetModel = nil
			holdAngle = nil
			holdRadius = nil
		end
	end
	return chaseModel
end

--// Sự kiện tập enemy track thay đổi (thêm/xoá) -> reselect target tức thì, không chờ poll.
local function onEnemyChanged()
	if not enabled or not running then return end
	reselectTarget()
end

--// Nhân vật respawn (tự kill / chết) -> dọn path cũ + target cũ, chờ reselect sau.
	local function onRespawn()
	currentPath = nil
	pathComputed = false
	pathIsAnchor = false
	anchorWalking = false
	freeWalkActive = false
	freeWalkDir = nil
	freeWalkDest = nil
	chasePathTargetModel = nil
	chaseModel = nil
	lockedTargetModel = nil
	holdAngle = nil
	holdRadius = nil
	resetStuckCheck()
end

--// Bước hành động tiếp theo của chuỗi gỡ kẹt: nhảy -> strafe trái -> strafe phải
--// -> reset player (giết nhân vật để game respawn về spawn room).
local function advanceStuckAction(humanoid)
	if stuckStage == 0 then
		stuckStage = 1
		humanoid.Jump = true
	elseif stuckStage == 1 then
		stuckStage = 2
		stuckStrafeDir = -1
		stuckStrafeEndTime = os.clock() + STUCK_STRAFE_HOLD
	elseif stuckStage == 2 then
		stuckStage = 3
		stuckStrafeDir = 1
		stuckStrafeEndTime = os.clock() + STUCK_STRAFE_HOLD
	elseif stuckStage == 3 then
		stuckStage = 4
		if humanoid and humanoid.Parent then
			humanoid.Health = 0
		end
		resetStuckCheck()
	end
end

--// LUỒNG DI CHUYỂN ANCHOR RIÊNG (fallback): vẽ path tới anchor đích (idx = anchorChainIndex, được
--// khóa bởi findNextAnchor trong computeChasePath) 1 lần rồi đi thẳng tới đó theo pathfinder (theo địa
--// hình). KHÔNG xử lý enemy, không chuyển HOLD khi enemy vào tầm, không retarget. Khi tới anchor ->
--// đánh dấu visited + rebuild path tới anchor kế. Hết anchor hợp lệ -> thoát luồng (về CHASE bình thường).
local function stepAnchorWalking(deltaTime, humanoid, playerRoot)
	local playerPos = getSafePosition(playerRoot)
	if not playerPos then return end

	local function exitAnchorFlow()
		anchorWalking = false
		pathIsAnchor = false
		anchorStuckPos = nil
		anchorStuckTimer = 0
	end

	--// Nếu toggle anchorFallback bị tắt (giữa chừng hoặc trước đó) -> thoát luồng anchor ngay.
	if not anchorFallback then
		exitAnchorFlow()
		return
	end

	--// Chưa có path anchor -> build path 1 lần rồi bắt đầu đi (không build lại mỗi frame).
	if not currentPath then
		local anchorPos = findNextAnchor()
		if not anchorPos then
			--// Hết anchor hợp lệ trong room -> FREE-WALK: đi thẳng theo hướng đang facing trong
			--// FREE_WALK_DURATION để băng qua khúc navmesh không phủ, rồi quay lại CHASE (resume).
			--// KHÔNG liên quan enemy. Khi hết thời gian -> thoát luồng anchor (về CHASE/stand/self-kill).
			if not freeWalkActive then
				freeWalkActive = true
				freeWalkTimer = FREE_WALK_DURATION
				--// Hướng đi = hướng NHÌN thực tế (LookVector của HumanoidRootPart). KHÔNG dùng
				--// Orientation.Y / FindFirstChild("HumanoidRootPart") vì playerRoot CHÍNH là
				--// HumanoidRootPart (getPlayerRoot trả root) -> FindFirstChild trả nil -> cũ code
				--// luôn ra hướng +X, sai hướng nhìn. Chuẩn hoá về mặt phẳng XZ.
				local look = playerRoot.CFrame.LookVector
				freeWalkDir = Vector3.new(look.X, 0, look.Z)
				if freeWalkDir.Magnitude < 0.01 then
					freeWalkDir = Vector3.new(0, 0, -1)
				else
					freeWalkDir = freeWalkDir.Unit
				end
				--// Đích tạm rất xa phía trước theo hướng nhìn -> MoveTo đi thẳng. Dùng chung cơ chế
				--// MoveTo như toàn bộ pathfinder (đáng tin cậy hơn humanoid:Move(vector) — cái sau
				--// dễ bị mất hiệu lực sau một MoveTo trước đó, làm "đứng im không đi").
				freeWalkDest = playerPos + freeWalkDir * FREE_WALK_DISTANCE
				if visualDebug then warn(("[PathAnchor] hết anchor -> FREE-WALK %gs theo hướng nhìn"):format(FREE_WALK_DURATION)) end
			end
			--// Đi thẳng theo hướng cố định (không cần path). MoveTo đích rất xa -> nhân vật bước thẳng,
			--// Humanoid tự nhân với WalkSpeed.
			ensureAutoRotateEnabled()
			humanoid:MoveTo(freeWalkDest)
			freeWalkTimer -= deltaTime
			if freeWalkTimer <= 0 then
				freeWalkActive = false
				freeWalkDir = nil
				freeWalkDest = nil
				exitAnchorFlow()
				return
			end
			return
		end
		if tryBuildPath(playerPos, anchorPos, nil, true) then
			anchorStuckPos = nil
			anchorStuckTimer = 0
			return --// vừa build xong, frame sau đi theo waypoint
		end
		--// Nopath tới anchor này -> thoát luồng anchor.
		if visualDebug then warn("[PathAnchor] nopath tới anchor -> thoát luồng anchor walk") end
		exitAnchorFlow()
		return
	end

	local waypoints = currentPath:GetWaypoints()
	if not waypoints or #waypoints == 0 then
		currentPath = nil
		pathComputed = false
		return
	end
	if waypointIndex > #waypoints then
		--// Đã đi hết waypoint = ĐÃ TỚI anchor đích (idx = anchorChainIndex). Mark visited TRỰC TIẾP
		--// (không đo lại khoảng cách — tránh lệch vài stud gây rebuild lặp). Frame kế findNextAnchor
		--// sẽ advance sang anchor kế trong cùng room (hoặc return nil khi hết -> thoát luồng).
		local mapName = shared.GetCurrentDungeonName()
		local list = (type(mapName) == "string" and anchors[mapName]) or nil
		if list and anchorChainIndex >= 1 and anchorChainIndex <= #list and not list[anchorChainIndex].visited then
			list[anchorChainIndex].visited = true
			refreshAnchorMarkers()
			if visualDebug then warn(("[PathAnchor] TỚI anchor idx=%d -> visited"):format(anchorChainIndex)) end
		end
		currentPath = nil
		pathComputed = false
		return --// frame kế: build path tới anchor kế (findNextAnchor) hoặc thoát nếu hết anchor
	end

	--// Đi theo waypoint giống CHASE (Click-to-Move, pathfinder theo địa hình): nhân vật tự đi + tự quay.
	ensureAutoRotateEnabled()
	local wp = waypoints[waypointIndex]
	local dest = wp.Position
	local pos = playerPos
	local toDest = Vector3.new(dest.X - pos.X, 0, dest.Z - pos.Z)
	local dist = toDest.Magnitude
	local tolerate = (wp.Action == Enum.PathWaypointAction.Jump and 2.5) or 2.0

	if dist <= tolerate then
		waypointIndex += 1
		if wp.Action == Enum.PathWaypointAction.Jump then humanoid.Jump = true end
		return
	end

	humanoid:MoveTo(dest)

	--// Kẹt nhẹ: đứng im quá lâu thì để frame sau rebuild path 1 lần (vòng vật cản). KHÔNG dùng chuỗi
	--// gỡ phức tạp / self-respawn của luồng chung vì anchor chỉ cần hoàn thành 1 path di chuyển tới đích.
	if anchorStuckPos then
		if (playerPos - anchorStuckPos).Magnitude > 0.5 then
			anchorStuckPos = playerPos
			anchorStuckTimer = 0
		else
			anchorStuckTimer += deltaTime
			if anchorStuckTimer >= ANCHOR_STUCK_WINDOW then
				anchorStuckPos = nil
				anchorStuckTimer = 0
				currentPath = nil
				pathComputed = false
			end
		end
	else
		anchorStuckPos = playerPos
		anchorStuckTimer = 0
	end
end

--// Di chuyển: CHASE theo trạng thái, HOLD khi enemy trong tầm.
local function stepMovement(deltaTime)
	if shared.IsInLobby() then return end
	if not dunReady then return end

	local playerRoot = getPlayerRoot()
	local humanoid = shared.GetHumanoid()
	if not playerRoot or not playerRoot.Parent or not humanoid or not humanoid.Parent or humanoid.Health <= 0 then
		currentPath = nil
		pathComputed = false
		cachedNearestValid = false
		return
	end
	--// Guard debug: chỉ render khi bật visualDebug (tránh call mỗi frame khi tắt).
	if visualDebug then
		updateDebugVisuals()
		updateDebugPathSpheres()
	end

	--// LUỒNG DI CHUYỂN ANCHOR RIÊNG: khi đang fallback anchor, chuyển hẳn sang hàm chuyên biệt,
	--// KHÔNG chạy CHASE/HOLD (không xử lý enemy khi đang đi tới anchor). Nếu đang trong luồng này thì
	--// bỏ qua mọi logic khác để "vẽ path 1 lần, đi thẳng tới đích" — không spam, không can thiệp.
	if anchorWalking then
		stepAnchorWalking(deltaTime, humanoid, playerRoot)
		return
	end

	--// Target được duy trì EVENT-DRIVEN qua shared.OnEnemyChanged -> reselectTarget().
	--// Heartbeat CHỈ thực thi (follow path / HOLD), KHÔNG poll scan hay đổi target theo interval.
	local enemy
	if lockedTargetModel then
		--// Đang HOLD -> bám enemy đã lock, không retarget.
		enemy = getEnemyByModel(lockedTargetModel)
		if not enemy then
			lockedTargetModel = nil
			holdAngle = nil
			holdRadius = nil
		end
	end
	if not enemy then
		--// enemy theo chaseModel (đã cập nhật bởi event). Nếu model cũ mất mà event chưa tới thì
		--// xoá chaseModel để reselect sau; KHÔNG scan lại mỗi frame.
		enemy = getEnemyByModel(chaseModel)
		if not enemy then
			chaseModel = nil
		end
	end
	cachedNearestEnemy = enemy
	cachedNearestValid = enemy ~= nil
	if not enemy or not enemy.Root or not enemy.Root.Parent then
		--// Không có target -> đứng yên. Event OnEnemyChanged sẽ reselect khi có enemy mới.
		if currentPath then pcall(function() currentPath:Destroy() end) end
		currentPath = nil
		pathComputed = false
		chaseTarget = nil
		pcall(function() humanoid:MoveTo(getSafePosition(playerRoot)) end)
		return
	end

	local enemyPos = enemy and getSafePosition(enemy.Root) or nil
	local playerPos = getSafePosition(playerRoot)
	if not enemyPos or not playerPos then
		return
	end

	--// Đánh dấu anchor đã đi qua (visited) theo vị trí thực tế -> đổi màu + không target lại.
	--// KHÔNG huỷ path ở đây: việc hủy path ngay lúc vừa build khiến player "đi chút rồi vòng về"
	--// (vì anchor thường đặt tại vị trí đang đứng, nên player luôn trong tầm nearAnchorTol).
	sweepNearbyAnchors(playerPos)

	local flat = Vector3.new(enemyPos.X - playerPos.X, 0, enemyPos.Z - playerPos.Z)
	if flat.Magnitude <= skillRange then
		--// HOLD: lọt tầm -> LOCK target này, orbit tốc độ thấp — center = enemy lock,
		--// giữ khoảng cách (holdRadius) + góc (holdAngle) đúng như lúc vào HOLD,
		--// xích ra/lùi theo enemy. Không retarget.
		ensureAutoRotateDisabled()
		--// Skill-fire: tái dùng enemy + vị trí đã resolve trong frame này (không resolve lại 2 lần/frame).
		if skillEnabled then fireSkills() end
		--// Huỷ MoveTo của CHASE trước đó để không chống đối việc set CFrame thủ công.
		pcall(function() humanoid:MoveTo(playerPos) end)
		if not lockedTargetModel then lockedTargetModel = enemy.Model end
		if currentPath then pcall(function() currentPath:Destroy() end) end
		currentPath = nil
		pathComputed = false
		chaseTarget = nil
		resetStuckCheck()
		--// Capture góc & bán kính từ vị trí hiện tại lúc vào HOLD.
		--// Dùng offset = playerPos - enemyPos (hướng từ enemy tới player) để
		--// orbitPos == vị trí player hiện tại, tránh bị dội ngược phía đối diện.
		local offsetXZ = Vector3.new(playerPos.X - enemyPos.X, 0, playerPos.Z - enemyPos.Z)
		if not holdAngle then
			holdAngle = math.atan2(offsetXZ.Z, offsetXZ.X)
			holdRadius = offsetXZ.Magnitude
		end
		--// Vị trí mong muốn trên quỹ đạo quanh enemy (theo enemy di chuyển)
		local orbitPos = Vector3.new(
			enemyPos.X + math.cos(holdAngle) * holdRadius,
			playerPos.Y,
			enemyPos.Z + math.sin(holdAngle) * holdRadius
		)
		--// Xích mượt về orbitPos (đứng yên nếu đã đúng vị trí, theo enemy nếu enemy di chuyển)
		local pos = playerPos
		local toOrbit = Vector3.new(orbitPos.X - pos.X, 0, orbitPos.Z - pos.Z)
		local dist = toOrbit.Magnitude
		local thisStep = moveSpeed * math.max(deltaTime, 1 / 60)
		local newPos = pos
		if dist > 0.01 then
			if dist <= thisStep then
				newPos = Vector3.new(orbitPos.X, pos.Y, orbitPos.Z)
			else
				newPos = pos + toOrbit.Unit * thisStep
			end
		end
		playerRoot.CFrame = CFrame.lookAt(newPos, enemyPos)
		playerRoot.AssemblyLinearVelocity = Vector3.zero
		playerRoot.AssemblyAngularVelocity = Vector3.zero
		return
	end

	--// CHASE: pathfinder tới vị trí nearest (retarget theo interval).
	--// Ra khỏi tầm -> giải phóng lock, quay lại chế độ retarget.
	holdAngle = nil
	holdRadius = nil
	lockedTargetModel = nil
	--// Path stale khi target hiện tại KHÁC target của path (enemy cũ chết / retarget
	--// sang con khác) -> hủy path ngay để recompute sang target mới, không đi tiếp
	--// theo path cũ dẫn tới chỗ xác (gây "state=CHASE nhưng không di chuyển").
	--// LƯU Ý: chỉ áp dụng cho path ENEMY (chasePathTargetModel là model enemy). Path ANCHOR
	--// được build với chasePathTargetModel = nil; nếu để điều kiện này chạy thì `nil ~= enemy.Model`
	--// luôn đúng -> path anchor bị destroy + rebuild lại từ đầu MỖI FRAME -> nhân vật "đi 1 chút
	--// rồi vòng về đầu path" lặp lại. Vì vậy bỏ qua khi pathIsAnchor.
	if not pathIsAnchor and currentPath and chasePathTargetModel and chasePathTargetModel ~= enemy.Model then
		pcall(function() currentPath:Destroy() end)
		currentPath = nil
		pathComputed = false
	end
	if not pathComputed or not currentPath then
		--// Gate theo STATE: chỉ build path khi thật sự cần (target đổi / đích dịch chuyển đáng kể /
		--// hoặc đã qua RETRY_COOLDOWN kể từ lần fail gần nhất). Stand không khoá cứng — sau quãng
		--// nghỉ cooldown nó thử lại build path (có đường mới sẽ chạy tiếp), chống spam mỗi frame.
		local sameFailedTarget = lastFailedModel ~= nil and lastFailedModel == enemy.Model
			and lastFailedDest ~= nil and (enemyPos - lastFailedDest).Magnitude <= REPATH_TOL
		if not sameFailedTarget or os.clock() - lastFailedTime >= RETRY_COOLDOWN then
			local ok = computeChasePath(enemy, enemyPos)
			if ok then
				resetStuckCheck()
				return --// đã có path, frame sau đi theo waypoint
			end
			--// computeChasePath tự kill player khi cả 2 lần fail -> không cần xử lý thêm.
			return
		end
		return
	end

	local waypoints = currentPath:GetWaypoints()
	if not waypoints or #waypoints == 0 then
		currentPath = nil
		pathComputed = false
		return
	end
	if waypointIndex > #waypoints then
		if visualDebug and pathIsAnchor then
			warn(("[PathAnchor] anchor path HOÀN THÀNH (đã đi hết waypoint idx=%d) -> advance"):format(waypointIndex))
		end
		pathComputed = false
		return
	end

	--// Di chuyển theo chuẩn Click-to-Move: Humanoid:MoveTo + AutoRotate bật,
	--// nhân vật tự đi + tự quay theo hướng di chuyển (animation, va chạm).
	ensureAutoRotateEnabled()

	local wp = waypoints[waypointIndex]
	local dest = wp.Position
	local pos = playerPos
	local toDest = Vector3.new(dest.X - pos.X, 0, dest.Z - pos.Z)
	local dist = toDest.Magnitude
	local tolerate = (wp.Action == Enum.PathWaypointAction.Jump and 2.5) or 2.0

	--// Stuck: lệch hướng sang trái/phải khỏi waypoint để vòng qua vật cản.
	if stuckStage >= 2 and os.clock() < stuckStrafeEndTime and dist > 0.01 then
		local dir = toDest.Unit
		local perp = Vector3.new(-dir.Z, 0, dir.X)
		dest = dest + perp * (stuckStrafeDir * STUCK_STRAFE_DIST)
		toDest = Vector3.new(dest.X - pos.X, 0, dest.Z - pos.Z)
		dist = toDest.Magnitude
	end

	if dist <= tolerate then
		waypointIndex += 1
		--// Waypoint Jump: bảo humanoid nhảy qua chướng ngại.
		if wp.Action == Enum.PathWaypointAction.Jump then
			humanoid.Jump = true
		end
		resetStuckCheck()
		return
	end

	humanoid:MoveTo(dest)

	--// Stuck detection: path có nhưng nhân vật đứng im (kẹt vật cản thấp mà path
	--// không đánh dấu Jump) -> chạy chuỗi gỡ: nhảy -> strafe trái -> strafe phải
	--// -> reset player. Dừng ngay khi tự tiến tới được (so khoảng cách NGANG để
	--// nhảy lên tại chỗ không bị tính nhầm là đã thoát kẹt).
	if stuckCheckPos then
		local delta = playerPos - stuckCheckPos
		local moved = Vector3.new(delta.X, 0, delta.Z).Magnitude
		if moved > STUCK_DIST then
			stuckCheckPos = playerPos
			stuckCheckTimer = 0
			stuckStage = 0
			stuckStrafeDir = 0
		else
			stuckCheckTimer += deltaTime
			if stuckCheckTimer >= STUCK_WINDOW then
				stuckCheckPos = playerPos
				stuckCheckTimer = 0
				--// Kẹt thật sự (không tiến được). Nếu đang đi path ANCHOR thì dọn path để frame kế
				--// rebuild lại từ vị trí hiện tại (sau bước gỡ kẹt), vòng quanh vật cản thật sự.
				if pathIsAnchor then
					currentPath = nil
					pathComputed = false
					if visualDebug then warn("[PathAnchor] stuck while anchor path -> dọn path để re-route") end
				end
				advanceStuckAction(humanoid)
			end
		end
	else
		stuckCheckPos = playerPos
		stuckCheckTimer = 0
	end
end

--// ---------- Accessors (tab UI dùng) ----------

function autoFarmPathfinder.IsEnabled()
	return enabled
end

function autoFarmPathfinder.GetSkillRange()
	return skillRange
end

function autoFarmPathfinder.SetSkillRange(value)
	skillRange = tonumber(value) or skillRange
end

function autoFarmPathfinder.GetMoveSpeed()
	return moveSpeed
end

function autoFarmPathfinder.SetMoveSpeed(value)
	moveSpeed = tonumber(value) or moveSpeed
end

function autoFarmPathfinder.GetRetargetInterval()
	return retargetInterval
end

function autoFarmPathfinder.SetRetargetInterval(value)
	retargetInterval = tonumber(value) or retargetInterval
end

function autoFarmPathfinder.IsSkillEnabled()
	return skillEnabled
end

function autoFarmPathfinder.SetSkillEnabled(value)
	skillEnabled = value == true
end

function autoFarmPathfinder.GetSkillInterval()
	return skillInterval
end

function autoFarmPathfinder.SetSkillInterval(value)
	skillInterval = tonumber(value) or skillInterval
end

function autoFarmPathfinder.GetSkillMode()
	return skillMode
end

function autoFarmPathfinder.SetSkillMode(value)
	if value == "Both" or value == "Alternate" then
		skillMode = value
	end
end

function autoFarmPathfinder.IsVisualDebugEnabled()
	return visualDebug
end

function autoFarmPathfinder.SetVisualDebug(value)
	visualDebug = value == true
	saveDebugSettings()
	if not visualDebug then cleanupDebugVisuals() end
end

function autoFarmPathfinder.IsRespawnOnNoPathEnabled()
	return respawnOnNoPath
end

function autoFarmPathfinder.SetRespawnOnNoPath(value)
	respawnOnNoPath = value == true
end

function autoFarmPathfinder.IsAnchorFallbackEnabled()
	return anchorFallback
end

function autoFarmPathfinder.SetAnchorFallback(value)
	anchorFallback = value == true
	if not anchorFallback then
		--// Tắt fallback anchor giữa chừng -> thoát luồng anchor ngay (về CHASE/stand/self-kill).
		anchorWalking = false
		pathIsAnchor = false
		if currentPath then pcall(function() currentPath:Destroy() end) end
		currentPath = nil
		pathComputed = false
		freeWalkActive = false
		freeWalkDir = nil
		freeWalkDest = nil
	end
end

function autoFarmPathfinder.IsAnchorMarkersEnabled()
	return showAnchorMarkers
end

function autoFarmPathfinder.SetAnchorMarkers(value)
	showAnchorMarkers = value == true
	saveDebugSettings()
	if showAnchorMarkers then
		refreshAnchorMarkers()
	else
		cleanupAnchorMarkers()
	end
end

--// ---------- Anchor (điểm người dùng đặt để reach khi nopath, chia theo map) ----------

--// Map hiện tại (dungeon đang chơi). Trả về string hoặc nil.
function autoFarmPathfinder.GetCurrentAnchorMap()
	local name = shared.GetCurrentDungeonName()
	if type(name) == "string" and #name > 0 then return name end
	return nil
end

--// Thêm anchor mới cho room hiện tại tại vị trí player (mỗi room có thể nhiều anchor).
--// mapName: map cần gắn anchor (mặc định map đang chơi). Trả về id hoặc nil nếu thất bại.
function autoFarmPathfinder.SetAnchor(mapName)
	local targetMap = mapName
	if not (type(targetMap) == "string" and #targetMap > 0) then
		targetMap = shared.GetCurrentDungeonName()
	end
	if not (type(targetMap) == "string" and #targetMap > 0) then
		warn("[AutoFarmPathfinder] Chưa xác định map hiện tại, không đặt anchor được")
		return nil
	end
	local room = shared.GetCurrentRoomIndex()
	if room == nil or room <= 0 then
		warn("[AutoFarmPathfinder] Chưa xác định room hiện tại, không đặt anchor được")
		return nil
	end
	local root = getPlayerRoot()
	if not root then return nil end
	local pos = getSafePosition(root)
	if not pos then return nil end
	local list = anchors[targetMap]
	if not list then list = {}; anchors[targetMap] = list end
	anchorSeq += 1
	list[#list + 1] = { id = anchorSeq, room = room, pos = pos }
	anchorChainMap = nil
	anchorChainIndex = 0
	refreshAnchorMarkers()
	saveAnchors()
	return #list
end

--// Xóa anchor theo SỐ THỨ TỰ (index trong list, 1..N liên tục). Xóa index i là list dịch lại
--// nên số thứ tự còn lại tự động liên tục. Trả về true nếu xóa được.
function autoFarmPathfinder.RemoveAnchor(mapName, index)
	if not (type(mapName) == "string" and #mapName > 0) then return false end
	local list = anchors[mapName]
	if not list then return false end
	if type(index) ~= "number" or index < 1 or index > #list then return false end
	table.remove(list, index)
	if #list == 0 then
		anchors[mapName] = nil
		anchorSeq = 0 --// xóa hết -> id nội bộ về lại đầu
	end
	anchorChainMap = nil
	anchorChainIndex = 0
	refreshAnchorMarkers()
	saveAnchors()
	return true
end

--// Xóa toàn bộ anchor của 1 map (nil = tất cả các map).
function autoFarmPathfinder.ClearAllAnchors(mapName)
	if type(mapName) == "string" and #mapName > 0 then
		if anchors[mapName] then anchorSeq = 0; anchors[mapName] = nil end
	else
		anchors = {}
		anchorSeq = 0
	end
	anchorChainMap = nil
	anchorChainIndex = 0
	refreshAnchorMarkers()
	saveAnchors()
end

--// Trả về danh sách anchor của 1 map theo thứ tự đặt (mảng { {id, room, pos}, ... }).
--// mapName nil -> map đang chơi.
function autoFarmPathfinder.GetAnchors(mapName)
	local name = mapName
	if not (type(name) == "string" and #name > 0) then
		name = shared.GetCurrentDungeonName()
	end
	local out = {}
	local list = (type(name) == "string" and anchors[name]) or nil
	if list then
		for i = 1, #list do out[i] = list[i] end
	end
	return out
end

--// Danh sách tên các map đã có anchor (dùng cho UI dropdown).
function autoFarmPathfinder.GetAnchorMapNames()
	local out = {}
	for name in pairs(anchors) do
		table.insert(out, name)
	end
	table.sort(out)
	return out
end

--// ---------- Methods ----------

function autoFarmPathfinder.Toggle(state)
	if state == enabled then return end
	enabled = state

	if enabled then
		if moveConnection then moveConnection:Disconnect(); moveConnection = nil end
		running = true
		lastSkillTime = 0
		cachedNearestEnemy = nil
		cachedNearestValid = false
		pathIsAnchor = false
		lastFailedModel = nil
		lastFailedDest = nil
		lastSelfKillTime = 0
		chaseModel = nil
		--// Event-driven: reselect target khi tập enemy thay đổi + reset khi respawn.
		if not enemyChangedConnection then
			enemyChangedConnection = shared.OnEnemyChanged(onEnemyChanged)
		end
		if not respawnConnection then
			respawnConnection = shared.OnRespawn(onRespawn)
		end
		--// Khởi tạo tracking enemy trong dungeon (không block luồng chính)
		if not dunReady then
			task.spawn(function()
				if shared.ReadyDungeon() then dunReady = true end
			end)
		end
		--// Seed target ban đầu: nếu đang có enemy (bật giữa trận) thì chọn nearest ngay.
		task.defer(reselectTarget)
		--// Gộp movement + skill vào 1 Heartbeat để giảm số connection/frame.
		moveConnection = RunService.Heartbeat:Connect(function(deltaTime)
			pcall(function()
				stepMovement(deltaTime)
			end)
		end)
	else
		if moveConnection then moveConnection:Disconnect(); moveConnection = nil end
		running = false
		if enemyChangedConnection then enemyChangedConnection(); enemyChangedConnection = nil end
		if respawnConnection then respawnConnection(); respawnConnection = nil end
		restoreAutoRotate()
		local h = shared.GetHumanoid()
		local r = getPlayerRoot()
		if h and h.Parent and r and r.Parent then pcall(function() h:MoveTo(getSafePosition(r)) end) end
		if currentPath then pcall(function() currentPath:Destroy() end) end
		currentPath = nil
		pathComputed = false
		chaseTarget = nil
		holdAngle = nil
		holdRadius = nil
		lockedTargetModel = nil
		chaseModel = nil
		chasePathTargetModel = nil
		pathIsAnchor = false
		anchorWalking = false
		freeWalkActive = false
		freeWalkDir = nil
		cachedNearestEnemy = nil
		cachedNearestValid = false
		resetStuckCheck()
		cleanupDebugVisuals()
	end
end

function autoFarmPathfinder.IsRunning()
	return running
end

--// Trả về thông tin debug realtime (dùng cho debug panel trên UI).
function autoFarmPathfinder.GetDebugInfo()
	local playerRoot = getPlayerRoot()
	local enemy = getNearestEnemy()
	local locked = lockedTargetModel and getEnemyByModel(lockedTargetModel) --// target bị khóa
	local display = locked or enemy
	local phase = "IDLE"
	local enemyName = "-"
	local enemyDist = 0
	local enemyFlat = 0
	local lockedName = "-"

	if locked then lockedName = locked.Model and locked.Model.Name or "-" end
	if display and display.Root and display.Root.Parent then
		local displayPos = getSafePosition(display.Root)
		local playerPos = getSafePosition(playerRoot)
		enemyName = display.Model and display.Model.Name or "-"
		if displayPos and playerPos then
			enemyDist = (displayPos - playerPos).Magnitude
			local flat = Vector3.new(displayPos.X - playerPos.X, 0, displayPos.Z - playerPos.Z)
			enemyFlat = flat.Magnitude
		end
		phase = enemyFlat <= skillRange and "HOLD" or "CHASE"
	end

	return {
		phase = phase,
		enemyName = enemyName,
		enemyDist = enemyDist,
		enemyFlat = enemyFlat,
		lockedName = lockedName,
		locked = locked ~= nil,
		skillRange = skillRange,
		holdAngle = holdAngle,
		holdRadius = holdRadius,
		pathComputed = pathComputed,
		chaseTarget = chaseTarget,
		isAnchor = pathIsAnchor,
		dunReady = dunReady,
		enabled = enabled,
	}
end

lifecycle.Register(function()
	autoFarmPathfinder.Toggle(false)
	cleanupAnchorMarkers()
end)

--// Load debug setting + anchors lúc require (nhớ trạng thái qua các lần execute).
loadDebugSettings()
loadAnchors()

--// Render marker cho anchor đã lưu ngay sau khi load (nếu đang bật hiện marker).
--// Marker hiện theo map đang chơi, nên refresh lại mỗi khi đổi map.
shared.OnDungeonNameChanged(function()
	refreshAnchorMarkers()
end)
task.defer(function()
	refreshAnchorMarkers()
end)

return autoFarmPathfinder
