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
local coordinator = require("@routes/DungeonQuest/core/coordinator")
local smartDodge = require("@routes/DungeonQuest/core/smartDodge")
local macLib = require("@packages/Maclib")

--// Services
local HttpService = game:GetService("HttpService")

--// Persistence (nhớ trạng thái debug overlay giữa các lần execute)
local SETTINGS_FILE = macLib.Folder .. "/settings/pathfinder-debug.json"
local ANCHORS_FILE = macLib.Folder .. "/settings/anchors.json"

--// State persist (khai báo TRƯỚC các hàm load/save để tham chiếu đúng local, không phải global).
local visualDebug = true
local debugPathMode = "Sphere" --// cách render path debug: "Sphere" (sphere nhỏ) hoặc "Line" (đường thẳng)
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
		if decoded.mode == "Sphere" or decoded.mode == "Line" then debugPathMode = decoded.mode end
	end
end

local function saveDebugSettings()
	if not (isfile and writefile) then return end
	pcall(function()
		writefile(SETTINGS_FILE, HttpService:JSONEncode({
			enabled = visualDebug,
			showAnchors = showAnchorMarkers,
			mode = debugPathMode,
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
--// HOLD có 2 chế độ: "Orbit" = đứng yên trên quỹ đạo tĩnh (HOLD cũ, orbit speed 0);
--// "SmartDodge" = KHÔNG orbit/CFrame/rotation gì cả — đứng im để Smart Dodge tự né danger chủ động
--// và chỉ cast skill khi nhân vật KHÔNG đang trong lúc né.
local holdMode = "Orbit"
--// Độ lệch hướng nhìn tối đa (độ) so với hướng tới enemy để được phép cast skill.
--// Gate "phải facing đã mới cast": lệch quá ngưỡng này thì frame đó chỉ xoay mặt, chưa cast.
local faceToleranceDeg = 20
--// Mode 2 (SmartDodge): giữ khoảng cách MIN với enemy gần nhất. Khi enemy lọt vào vùng
--// < minDistance, nhân vật bị "đẩy" lùi mượt theo hướng radial (CFrame — cơ chế giống Mode 1
--// orbit) và VẪN cast skill trong lúc lùi. 0 = tắt (đứng yên như cũ).
local minDistance = 4
--// Snapshot trạng thái Smart Dodge (enabled + auto-dodge) khi AutoFarm nắm quyền ở Mode 2,
--// để khôi phục chính xác trạng thái người dùng khi AutoFarm tắt hoặc chuyển về Orbit.
local smartDodgeSnapshot = nil

--// Runtime
local moveConnection = nil
local enemyChangedConnection = nil --// sự kiện enemy đổi -> reselect target (event-driven)
local respawnConnection = nil --// reset trạng thái khi nhân vật respawn
local lastSkillTime = 0
local cachedNearestEnemy = nil --// cache enemy gần nhất trong 1 frame (tránh gọi getNearestEnemy nhiều lần)
local cachedNearestValid = false
local selectToken = 0 --// generation token cho lần chọn target theo path-cost (hủy kết quả cũ khi có reselect mới xen vào)
local selectRunning = false --// đang chạy cost-select async (chặn heartbeat tự chọn lại bằng straight-line gây phá kết quả)
local RESCAN_TARGET_INTERVAL = 2 --// giây: rescan theo chu kì chọn lại target theo path-cost (bắt cost thay đổi khi enemy di chuyển)
local lastRescanTargetAt = 0
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
local debugPathParts = {} --// các sphere xanh lá show path (mode "Sphere")
local debugPathLines = {} --// các LineHandleAdornment từng đoạn show path (mode "Line")
local debugPathAdornee = nil --// phần đế cố định (0,0,0) cho LineHandleAdornment
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
local ANCHOR_STUCK_WINDOW = 1.0 --// giây: đứng im quá lâu khi đi anchor thì rebuild path 1 lần
--// Free-walk sau khi hết anchor: đi thẳng trong FREE_WALK_DURATION để băng qua khúc navmesh không
--// phủ, rồi quay lại pathfinding (resume CHASE). KHÔNG liên quan enemy. Hướng đi: ưu tiên theo
--// anchor1 -> anchor2 của room (nếu room có đủ 2 anchor); ngược lại fallback theo hướng đang nhìn.
local freeWalkActive = false
local freeWalkDir = nil --// hướng đi (Vector3 ngang, đơn vị) cố định trong suốt free-walk
local freeWalkTimer = 0 --// thời gian còn lại của free-walk
local freeWalkDest = nil --// đích MoveTo rất xa phía trước theo hướng đã chọn (đi thẳng đáng tin cậy)
local FREE_WALK_DURATION = 1.5 --// giây đi thẳng mỗi lần hết anchor
local FREE_WALK_DISTANCE = 40 --// stud: đích MoveTo cách player (đủ xa để đi thẳng trong FREE_WALK_DURATION)
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
local RETRY_COOLDOWN = 1.0 --// giây giữa 2 lần retry build path cùng enemy đứng yên
--// Chống self-kill lặp liên tục khi thật sự không path được (kill xong respawn -> lại thử).
local lastSelfKillTime = 0
local SELF_KILL_COOLDOWN = 1.0
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

--// ---------- Chọn target bằng CHI PHÍ PATH (thay cho "nearest straight-line") ----------
--// Lý do: map dungeon nhiều tầng/độ cao — "gần nhất" theo đường thẳng thường lệch xa chi phí thật
--// (phải đi vòng/leo qua chokepoint). Ví dụ 3 chốt A->B->C: enemy ở C gần theo đường thẳng nhưng thật
--// ra phải đi qua B; đáng lẽ enemy B nằm trên đường phải được xử trước — trước đây cost không tính nên
--// đi xuyên qua B. Vì path tới B luôn ngắn hơn path tới C nên cách này tự quét dần từng chốt theo
--// thứ tự đi thật chứ không bỏ sót enemy trên đường.
--// Ước lượng chi phí di chuyển từ start tới dest qua Pathfinding (tổng độ dài waypoint theo ngang).
--// Trả về số stud hoặc nil nếu không tính được path.
--// Có cache: cùng 1 enemy (đích) được rescan định kỳ mỗi RESCAN_TARGET_INTERVAL. Chỉ tái dùng
--// kết quả cũ khi CẢ player (start) và enemy (dest) chưa dịch chuyển đáng kể — giảm gọi
--// PathfindingService (tốn CPU) mà không ảnh hưởng độ chính xác khi bot đang di chuyển.
local COST_CACHE_TOL = 3 --// stud: start hoặc dest dịch chuyển dưới mức này thì tái dùng cost
local costCache = {} --// { [model] = { keyStart = Vector3, keyDest = Vector3, cost = number } }
local function measurePathCost(start, dest, model)
	if model then
		local hit = costCache[model]
		if hit and hit.cost ~= nil and hit.keyDest
			and (hit.keyDest - dest).Magnitude <= COST_CACHE_TOL
			and (hit.keyStart - start).Magnitude <= COST_CACHE_TOL then
			return hit.cost
		end
	end
	local path = PathfindingService:CreatePath(PATH_PARAMS)
	local ok = pcall(function() path:ComputeAsync(start, dest) end)
	local waypoints = nil
	if ok and path.Status == Enum.PathStatus.Success then
		waypoints = path:GetWaypoints()
	end
	pcall(function() path:Destroy() end)
	if not waypoints or #waypoints == 0 then return nil end
	local total = 0
	local prev = start
	for i = 1, #waypoints do
		local w = waypoints[i].Position
		local dx, dz = w.X - prev.X, w.Z - prev.Z
		total += math.sqrt(dx * dx + dz * dz)
		prev = w
	end
	if model then
		costCache[model] = { keyStart = start, keyDest = dest, cost = total }
	end
	return total
end

--// Gán target mới nếu khác target hiện tại: hủy path cũ (frame sau sẽ rebuild sang target mới).
--// Giải phóng lock HOLD nếu enemy bị lock đã biến mất.
local function commitTarget(model)
	if model == chaseModel then return chaseModel end
	chaseModel = model
	if currentPath then pcall(function() currentPath:Destroy() end) end
	currentPath = nil
	pathComputed = false
	chasePathTargetModel = nil
	if lockedTargetModel and not getEnemyByModel(lockedTargetModel) then
		lockedTargetModel = nil
		holdAngle = nil
		holdRadius = nil
	end
	return chaseModel
end

--// Chạy async: tính path cost cho từng enemy, chọn con có cost nhỏ nhất rồi commit.
--// Duyệt theo khoảng cách NGANG tăng dần + prune bằng cận dưới (pathLen >= khoảng cách ngang):
--// tới con kế mà khoảng cách ngang đã >= bestCost hiện tại thì các con sau không thể rẻ hơn -> dừng.
--// Chạy trong task.spawn nên CHASE vẫn đi theo target cũ trong lúc tính; guard bằng selectToken khi
--// có reselect mới xen giữa chừng (enemy spawn/chết liên tục) để bỏ kết quả cũ.
local function kickOffCostSelect(fallbackNearest)
	selectToken += 1
	local token = selectToken
	if selectRunning then return end
	selectRunning = true
	task.spawn(function()
		local ok, err = pcall(function()
			local playerRoot = getPlayerRoot()
			local playerPos = playerRoot and getSafePosition(playerRoot) or nil
			local chosen = nil
			local chosenCost = math.huge
			if playerPos then
				local candidates = {}
				for _, data in ipairs(shared.GetTrackedEnemyData()) do
					if data and data.Root and data.Root.Parent then
						local rp = getSafePosition(data.Root)
						if rp then
							local dx, dz = rp.X - playerPos.X, rp.Z - playerPos.Z
							local straight = math.sqrt(dx * dx + dz * dz)
							table.insert(candidates, { data = data, straight = straight })
						end
					end
				end
				table.sort(candidates, function(a, b) return a.straight < b.straight end)
				for i = 1, #candidates do
					if token ~= selectToken then return end
					local cand = candidates[i]
					if cand.straight >= chosenCost then break end
					local cpos = getSafePosition(cand.data.Root)
					if cpos then
						local cost = measurePathCost(playerPos, cpos, cand.data.Model)
						if token ~= selectToken then return end
						if cost and cost < chosenCost then
							chosenCost = cost
							chosen = cand.data
						end
					end
				end
				--// Trong lúc tính, nếu có enemy lọt vào tầm thẳng thì ưu tiên HOLD ngay chứ không chọn theo cost.
				if not chosen or chosenCost > skillRange then
					local nearest = getNearestEnemy()
					if nearest then
						local np = getSafePosition(nearest.Root)
						if np then
							local dx, dz = np.X - playerPos.X, np.Z - playerPos.Z
							if math.sqrt(dx * dx + dz * dz) <= skillRange then chosen = nearest end
						end
					end
				end
			end
			if not enabled or not running then return end
			if anchorWalking then return end --// đang rơi vào luồng anchor: không commit, tránh hủy path anchor
			if chosen then
				commitTarget(chosen.Model)
			elseif fallbackNearest then
				commitTarget(fallbackNearest.Model)
			end
		end)
		selectRunning = false
		if not ok then
			warn(("[PathSelector] lỗi cost-select: %s"):format(tostring(err)))
		end
	end)
end

--// Tìm anchor cần reach khi nopath của ROOM hiện tại: chỉ trả về anchor ĐẦU TIÊN chưa visited
--// của room (theo thứ tự đặt). Anchor thứ 2 của room KHÔNG được target/đi tới — nó chỉ dùng để
--// định hướng free-walk (anchor1 -> anchor2). Hết anchor hợp lệ -> trả nil (để vào free-walk).
--// Trả về Vector3 hoặc nil.
local nearAnchorTol = 5

local refreshAnchorMarkers --// forward ref (định nghĩa sau)

--// Quét anchor map hiện tại THEO VỊ TRÍ mỗi frame: anchor nào player đang đứng gần (<= nearAnchorTol)
--// mà đã TỪNG ở xa nó (wasFar) -> đánh dấu visited (đã đi qua/tiến tới nó từ xa). Trả về true nếu có
--// thay đổi (để refresh marker đổi màu + không target lại). KHÔNG mark ngay khi player chỉ đứng
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
	if not (type(mapName) == "string" and #mapName > 0) or not list then return nil end

	local current = shared.GetCurrentRoomIndex()
	current = (type(current) == "number" and current) or -1

	--// Gate THEO ROOM: chỉ dùng anchor khi ĐANG TRONG đúng 1 room đang có quái (current == room anchor).
	--// current = room của enemy đang track; lúc CHUYỂN ROOM (xong quái room này, chờ quái room sau)
	--// thì không còn quái -> current = 0 -> KHÔNG được dùng anchor nào (tránh nhảy target sang
	--// anchor room khác khi chưa tới đó). Anchor room nào chỉ áp dụng khi current == room đó.
	if current <= 0 then return nil end

	--// Chỉ trả về anchor ĐẦU TIÊN của room hiện tại (nếu chưa visited). Anchor thứ 2 bỏ qua:
	--// nó chỉ định hướng free-walk (anchor1 -> anchor2), không có vai trò đi tới.
	for _, a in ipairs(list) do
		if a.room == current then
			if a.visited then return nil end
			return a.pos
		end
	end
	return nil
end

--// Lấy (tối đa 2) anchor của ROOM hiện tại theo thứ tự đặt (lọc đúng room). Dùng cho free-walk:
--// room có đủ 2 anchor -> hướng đi thẳng là anchor1 -> anchor2; chưa đủ 2 -> fallback hướng nhìn.
local function getRoomAnchors()
	local mapName = shared.GetCurrentDungeonName()
	local list = (type(mapName) == "string" and anchors[mapName]) or nil
	if not list or #list == 0 then return {} end
	local current = shared.GetCurrentRoomIndex()
	current = (type(current) == "number" and current) or -1
	local out = {}
	for _, a in ipairs(list) do
		if a.room == current and a.pos then
			out[#out + 1] = a.pos
			if #out >= 2 then break end
		end
	end
	return out
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
			--// chỉ rebuild khi kẹt thật (stuck detection) hoặc khi đi hết waypoint.
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

	--// 1) Thử path tới enemy (params chính → relaxed). Thành công -> thoát luồng anchor,
	--// lần nopath sau sẽ vào anchor lại từ đầu.
	if tryBuildPath(start, targetPos, enemy.Model, false) then
		--// Có path tới enemy -> KHÔNG ở luồng anchor nữa (chase bình thường).
		anchorWalking = false
		return true
	end

	--// 2) Nopath tới enemy -> FALLBACK ANCHOR (chỉ khi toggle anchorFallback bật). Tìm anchor hợp lệ
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
				warn("[PathAnchor] FALLBACK: đang rơi vào anchor cho room hiện tại")
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

--// ---------- Tích hợp Smart Dodge (Mode 2: holdMode == "SmartDodge") ----------

--// Chụp trạng thái Smart Dodge hiện tại làm snapshot khôi phục khi trả quyền. Idempotent.
--// GHI CHÚ: phải gọi TRƯỚC EnableExclusive("AutoFarm") vì EnableExclusive sẽ tự dừng SmartDodge
--// đang chạy (qua coordinator) — chụp sau sẽ luôn thấy wasEnabled=false.
local function captureSmartDodgeSnapshot()
	if smartDodgeSnapshot then return end
	smartDodgeSnapshot = {
		wasEnabled = smartDodge.IsEnabled(),
		wasAutoDodge = smartDodge.IsAutoDodgeEnabled(),
	}
end

--// Provider vị trí cần quay mặt khi Smart Dodge né (enemy gần nhất) — dùng cho "luôn facing":
--// dù đang blink/di chuyển né thì nhân vật vẫn quay mặt enemy, không quay theo hướng nhảy.
local function smartDodgeFaceTarget()
	local enemy = getNearestEnemy()
	if enemy and enemy.Root and enemy.Root.Parent then
		return getSafePosition(enemy.Root)
	end
	return nil
end

--// Chiếm / GIỮ quyền sở hữu engine Smart Dodge: luôn đảm bảo engine + auto-dodge đang BẬT.
--// (auto-dodge là thứ thực sự move nhân vật né danger). Dùng mỗi frame trong Mode 2 để tự phục hồi
--// mỗi khi bị tắt ngoài ý muốn (ví dụ toggle standalone SmartDodge chạm StopEngine/Toggle(false)).
local function ensureSmartDodgeOwned()
	captureSmartDodgeSnapshot()
	if not smartDodge.IsEnabled() then smartDodge.StartEngine() end
	if not smartDodge.IsAutoDodgeEnabled() then smartDodge.SetAutoDodge(true) end
	smartDodge.SetFaceTargetProvider(smartDodgeFaceTarget)
end

--// Trả quyền: khôi phục đúng trạng thái Smart Dodge như trước khi AutoFarm chiếm
--// (engine chỉ tắt nếu AutoFarm là người bật nó; auto-dodge trả về giá trị cũ). Idempotent.
local function releaseSmartDodge()
	smartDodge.SetFaceTargetProvider(nil)
	if not smartDodgeSnapshot then return end
	local snap = smartDodgeSnapshot
	smartDodgeSnapshot = nil
	if not snap.wasEnabled and smartDodge.IsEnabled() then
		smartDodge.StopEngine()
	end
	if smartDodge.IsAutoDodgeEnabled() ~= snap.wasAutoDodge then
		smartDodge.SetAutoDodge(snap.wasAutoDodge)
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

--// Render path debug theo mode:
--//  * "Sphere": các sphere xanh lá tại từng waypoint (mode cũ).
--//  * "Line": LineHandleAdornment nối từng cặp waypoint liên tiếp.
--// Chỉ rebuild khi path đổi (currentPath mới) hoặc đổi mode, tránh destroy/create mỗi frame.
local DEBUG_PATH_SPHERE_SIZE = 0.9
local DEBUG_LINE_THICKNESS = 2
local debugPathCachePath = nil

local function destroyPathVisuals(list)
	for _, obj in ipairs(list) do
		pcall(function() obj:Destroy() end)
	end
	table.clear(list)
end

local function cleanupPathVisuals()
	destroyPathVisuals(debugPathParts)
	destroyPathVisuals(debugPathLines)
	debugPathCachePath = nil
end

local function ensureDebugPathAdornee()
	if debugPathAdornee and debugPathAdornee.Parent then return debugPathAdornee end
	debugPathAdornee = Instance.new("Part")
	debugPathAdornee.Name = "PathfinderPathAdornee_Debug"
	debugPathAdornee.Anchored = true
	debugPathAdornee.CanCollide = false
	debugPathAdornee.CanQuery = false
	debugPathAdornee.CanTouch = false
	debugPathAdornee.Transparency = 1
	debugPathAdornee.Size = Vector3.new(1, 1, 1)
	debugPathAdornee.CFrame = CFrame.new(0, 0, 0)
	debugPathAdornee.Parent = workspace
	return debugPathAdornee
end

local function updateDebugPathVisuals()
	if not visualDebug then
		cleanupPathVisuals()
		return nil
	end
	if currentPath == debugPathCachePath then return nil end

	cleanupPathVisuals()

	if not currentPath or not pathComputed then return nil end

	local ok, waypoints = pcall(function() return currentPath:GetWaypoints() end)
	if not ok or not waypoints then return nil end

	if debugPathMode == "Line" then
		local anchor = ensureDebugPathAdornee()
		for i = 2, #waypoints do
			local a = waypoints[i - 1]
			local b = waypoints[i]
			if a and b and a.Position and b.Position then
				local dist = (b.Position - a.Position).Magnitude
				if dist > 0.01 then
					local line = Instance.new("LineHandleAdornment")
					line.Name = "PathfinderPath_Debug"
					line.Adornee = anchor
					line.Length = dist
					line.Thickness = DEBUG_LINE_THICKNESS
					line.Transparency = 0.3
					line.Color3 = Color3.fromRGB(0, 255, 120)
					line.ZIndex = 0
					line.CFrame = CFrame.lookAt(a.Position, b.Position)
					line.Parent = workspace
					debugPathLines[#debugPathLines + 1] = line
				end
			end
		end
	else
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

	debugPathCachePath = currentPath
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
	cleanupPathVisuals()
	if debugPathAdornee then
		pcall(function() debugPathAdornee:Destroy() end)
		debugPathAdornee = nil
	end
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

--// Dọn toàn bộ state runtime (path/target/lock/stuck/select/anchor) để tái sử dụng
--// cho cả trường hợp Toggle off và respawn. KHÔNG dọn kết nối/Heartbeat (do caller quản lý).
local function resetRuntimeState()
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
	freeWalkDest = nil
	cachedNearestEnemy = nil
	cachedNearestValid = false
	table.clear(costCache) --// enemy cũ có thể đã bị destroy -> dọn cache cost để không giữ ref rác
	selectToken += 1 --// hủy cost-select đang chạy (nếu có)
	selectRunning = false
	lastRescanTargetAt = 0
	lastFailedModel = nil
	lastFailedDest = nil
	lastFailedTime = 0
	resetStuckCheck()
end

--// ---------- Event-driven: chọn/chuyển target theo sự kiện (không poll theo interval) ----------

--// Chọn lại target MỘT LẦN (do sự kiện enemy đổi trigger). Nếu target model khác
--// target hiện tại thì hủy path cũ (frame sau sẽ rebuild sang target mới). Giải phóng lock HOLD
--// nếu enemy bị lock đã biến mất. Trả về model mục tiêu mới (hoặc nil).
--// CHỌN TARGET: enemy trong tầm thẳng -> lock ngay (HOLD). Ngược lại chọn theo CHI PHÍ PATH
--// async (không block CHASE hiện tại) thay vì "nearest straight-line" — xem kickOffCostSelect.
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
	--// Enemy trong tầm thẳng -> lock ngay, không cần tính path cost.
	if nearest then
		local npos = getSafePosition(nearest.Root)
		local ppos = getSafePosition(playerRoot)
		if npos and ppos then
			local dx, dz = npos.X - ppos.X, npos.Z - ppos.Z
			if math.sqrt(dx * dx + dz * dz) <= skillRange then
				return commitTarget(nearest.Model)
			end
		end
	end
	if not nearest then return commitTarget(nil) end
	--// Không ai trong tầm -> chọn bằng path cost. Trong lúc tính, CHASE vẫn đi theo target hiện tại.
	kickOffCostSelect(nearest)
	return chaseModel
end

--// Sự kiện tập enemy track thay đổi (thêm/xoá) -> reselect target tức thì, không chờ poll.
local function onEnemyChanged()
	if not enabled or not running then return end
	reselectTarget()
end

--// Nhân vật respawn (tự kill / chết) -> dọn path cũ + target cũ, chờ reselect sau.
	local function onRespawn()
	resetRuntimeState()
	reselectTarget() --// chọn lại target (ưu tiên path-cost) ngay sau respawn, không chờ event
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

--// LUỒNG DI CHUYỂN ANCHOR RIÊNG (fallback): vẽ path tới anchor của room hiện tại 1 lần rồi đi
--// thẳng tới đó theo pathfinder (theo địa hình). KHÔNG xử lý enemy, không chuyển HOLD khi enemy vào
--// tầm, không retarget. Khi tới anchor -> đánh dấu visited. Hết anchor hợp lệ (hoặc nopath tới anchor)
--// -> FREE-WALK đi thẳng theo hướng định sẵn rồi thoát luồng (về CHASE bình thường).
--// Luôn facing cho luồng di chuyển (anchor + free-walk): có enemy gần nhất -> tắt AutoRotate + tự
--// xoay mặt enemy mỗi frame (MoveTo lo tịnh tiến — nhân vật đi nhưng mặt luôn hướng target, "shift
--// lock"). Không có enemy -> trả về xoay tự nhiên theo hướng đi (AutoRotate bật).
local function faceNearestOrNatural(humanoid, playerRoot)
	local enemy = getNearestEnemy()
	local targetPos
	if enemy and enemy.Root and enemy.Root.Parent then
		targetPos = getSafePosition(enemy.Root)
	end
	if autoRotateOwner then restoreAutoRotate() end
	if targetPos then
		humanoid.AutoRotate = false
		local origin = playerRoot.CFrame.Position
		local dx = targetPos.X - origin.X
		local dz = targetPos.Z - origin.Z
		if dx * dx + dz * dz > 0.25 then
			playerRoot.CFrame = CFrame.lookAt(origin, targetPos)
		end
	else
		humanoid.AutoRotate = true
	end
end

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

	--// Chưa có path anchor -> build path tới anchor hợp lệ 1 lần rồi bắt đầu đi (không build lại
	--// mỗi frame). Nopath tới anchor (hoặc hết anchor hợp lệ) -> rơi thẳng vào FREE-WALK (không
	--// thoát luồng giữa chừng để rồi vào lại → tránh spam log mỗi frame).
	if not currentPath then
		local anchorPos = findNextAnchor()
		if anchorPos and tryBuildPath(playerPos, anchorPos, nil, true) then
			anchorStuckPos = nil
			anchorStuckTimer = 0
			return --// vừa build xong, frame sau đi theo waypoint
		end
		--// Hết anchor hợp lệ trong room (đã visited) HOẶC nopath tới anchor -> FREE-WALK: đi thẳng
		--// trong FREE_WALK_DURATION để băng qua khúc navmesh không phủ, rồi quay lại CHASE (resume).
		--// Hướng đi ưu tiên theo anchor1 -> anchor2 của room (nếu có đủ 2 anchor), ngược lại theo
		--// hướng nhìn. KHÔNG liên quan enemy. Hết thời gian -> thoát luồng anchor (về CHASE/stand/self-kill).
		if not freeWalkActive then
			freeWalkActive = true
			freeWalkTimer = FREE_WALK_DURATION
			--// Hướng đi: nếu room hiện tại có đủ 2 anchor thì đi theo hướng anchor1 -> anchor2
			--// (anchor thứ 2 chỉ dùng để định hướng, không vai trò khác). Ngược lại fallback theo
			--// hướng NHÌN thực tế (LookVector của HumanoidRootPart). KHÔNG dùng Orientation.Y /
			--// FindFirstChild("HumanoidRootPart") vì playerRoot CHÍNH là HumanoidRootPart
			--// (getPlayerRoot trả root) -> FindFirstChild trả nil -> cũ code luôn ra hướng +X,
			--// sai hướng nhìn. Chuẩn hoá về mặt phẳng XZ.
			local roomAnchors = getRoomAnchors()
			if #roomAnchors >= 2 then
				local d = roomAnchors[2] - roomAnchors[1]
				freeWalkDir = Vector3.new(d.X, 0, d.Z)
			else
				local look = playerRoot.CFrame.LookVector
				freeWalkDir = Vector3.new(look.X, 0, look.Z)
			end
			if freeWalkDir.Magnitude < 0.01 then
				freeWalkDir = Vector3.new(0, 0, -1)
			else
				freeWalkDir = freeWalkDir.Unit
			end
			--// Đích tạm rất xa phía trước theo hướng đã chọn -> MoveTo đi thẳng. Dùng chung cơ chế
			--// MoveTo như toàn bộ pathfinder (đáng tin cậy hơn humanoid:Move(vector) — cái sau
			--// dễ bị mất hiệu lực sau một MoveTo trước đó, làm "đứng im không đi").
			freeWalkDest = playerPos + freeWalkDir * FREE_WALK_DISTANCE
			if #roomAnchors >= 2 then
				if visualDebug then warn(("[PathAnchor] hết anchor -> FREE-WALK %gs theo hướng anchor1->anchor2"):format(FREE_WALK_DURATION)) end
			elseif visualDebug then
				warn(("[PathAnchor] hết anchor -> FREE-WALK %gs theo hướng nhìn"):format(FREE_WALK_DURATION))
			end
		end
		--// Đi thẳng theo hướng cố định (không cần path). MoveTo đích rất xa -> nhân vật bước thẳng,
		--// Humanoid tự nhân với WalkSpeed. Luôn facing target nếu có (không tái bật AutoRotate).
		faceNearestOrNatural(humanoid, playerRoot)
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

	local waypoints = currentPath:GetWaypoints()
	if not waypoints or #waypoints == 0 then
		currentPath = nil
		pathComputed = false
		return
	end
	if waypointIndex > #waypoints then
		--// Đã đi hết waypoint = ĐÃ TỚI anchor đích. Mark visited anchor có pos trùng chaseTarget
		--// (findNextAnchor chỉ target 1 anchor duy nhất của room) — không đo lại khoảng cách để
		--// tránh lệch vài stud gây rebuild lặp. Frame kế: hết anchor hợp lệ -> rơi vào free-walk.
		local mapName = shared.GetCurrentDungeonName()
		local list = (type(mapName) == "string" and anchors[mapName]) or nil
		if list then
			for _, a in ipairs(list) do
				if not a.visited and a.pos and chaseTarget and (a.pos - chaseTarget).Magnitude <= nearAnchorTol then
					a.visited = true
					refreshAnchorMarkers()
					if visualDebug then warn(("[PathAnchor] TỚI anchor (R%d) -> visited"):format(a.room)) end
					break
				end
			end
		end
		currentPath = nil
		pathComputed = false
		return --// frame kế: findNextAnchor hết anchor -> rơi vào free-walk
	end

	--// Đi theo waypoint giống CHASE (Click-to-Move, pathfinder theo địa hình): nhân vật tự đi + tự quay.
	--// Luôn facing target nếu có (không tái bật AutoRotate → mặt giữ hướng enemy khi di chuyển).
	faceNearestOrNatural(humanoid, playerRoot)
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

--// Góc lệch NGANG (độ) giữa hướng nhìn nhân vật và hướng tới enemy (chỉ xét XZ, bỏ chênh dọc).
--// 0 = đang nhìn thẳng mặt enemy. Dùng để gate cast skill: chỉ cast khi đã facing trong tolerance.
local function getFacingErrorDeg(playerRoot, fromPos, enemyPos)
	local look = playerRoot.CFrame.LookVector
	local relX = enemyPos.X - fromPos.X
	local relZ = enemyPos.Z - fromPos.Z
	local relLen = math.sqrt(relX * relX + relZ * relZ)
	if relLen < 0.01 then return 0 end
	--// Chuẩn hoá hướng nhìn theo trục ngang (bỏ Y để đo "mặt quay đi hướng nào", không quan tâm nhìn xuống)
	local lookX, lookZ = look.X, look.Z
	local lookLen = math.sqrt(lookX * lookX + lookZ * lookZ)
	if lookLen < 0.01 then return 0 end
	local dot = (lookX / lookLen) * (relX / relLen) + (lookZ / lookLen) * (relZ / relLen)
	dot = math.max(-1, math.min(1, dot))
	return math.deg(math.acos(dot))
end

--// "Luôn facing target" (cơ chế tương đương shift lock): xoay nhân vật mặt target bằng CFrame mà
--// CHỈ đổi hướng (giữ nguyên vị trí hiện tại tại playerRoot.Position) — MoveTo/humanoid lo phần
--// tịnh tiến, ta không teleport di chuyển. Trả về false khi không thể xoay (target trùng vị trí).
local function faceTowards(playerRoot, targetPos)
	local origin = playerRoot.CFrame.Position
	local dx = targetPos.X - origin.X
	local dz = targetPos.Z - origin.Z
	if dx * dx + dz * dz <= 0.25 then return false end
	playerRoot.CFrame = CFrame.lookAt(origin, targetPos)
	return true
end

--// HOLD MODE 2 (SmartDodge): KHÔNG orbit — lock target, huỷ path đang CHASE và cast skill TRỪ KHI
--// nhân vật đang giữa lúc né (dodge) hoặc CHƯA FACING enemy.
--// Giữ khoảng cách MIN với enemy gần nhất: enemy lọt vào vùng < minDistance (và không dodging) thì
--// nhân vật bị "đẩy" lùi mượt theo hướng radial bằng CFrame (cơ chế giống Mode 1 orbit) đồng thời
--// VẪN cast skill trong lúc lùi. Đang dodging thì nhường toàn bộ cho Smart Dodge (không can thiệp).
--// Lý do gate skill theo dodge: performDodge teleport/micro-blink liên tục trên HumanoidRootPart —
--// bấm phím skill cùng lúc không phá dodge nhưng chiêu giữa lúc dịch chuyển thường whiff, nên bỏ qua.
--// Lý do gate theo facing: "phải facing đã mới cast" — hướng nhìn lệch enemy quá threshold thì frame
--// này chỉ xoay mặt (CFrame, giữ nguyên vị trí; KHÔNG đụng vào khi đang né) và đợi frame sau mới cast.
local function stepHoldSmartDodge(deltaTime, humanoid, playerRoot, enemy, enemyPos, playerPos)
	holdAngle = nil
	holdRadius = nil
	local dodging = smartDodge.IsDodging()
	if not lockedTargetModel then lockedTargetModel = enemy.Model end
	if currentPath then pcall(function() currentPath:Destroy() end) end
	currentPath = nil
	pathComputed = false
	chaseTarget = nil
	resetStuckCheck()
	if not dodging then
		--// Luôn facing target: tắt AutoRotate để Roblox không tự xoay theo hướng di chuyển/kéo back.
		humanoid.AutoRotate = false
		local dx = playerPos.X - enemyPos.X
		local dz = playerPos.Z - enemyPos.Z
		local dist = math.sqrt(dx * dx + dz * dz)
		if minDistance > 0 and dist < minDistance then
			--// Enemy lọt vào vùng min -> "đẩy" lùi mượt theo radial (CFrame). Di chuyển bị dodge
			--// ghi đè tuyệt đối khi nguy hiểm (frame này không chạy lúc dodging).
			local push = math.min(moveSpeed * math.max(deltaTime, 1 / 60), minDistance - dist)
			local pushedPos = playerPos
			if dist > 0.01 then
				pushedPos = Vector3.new(
					playerPos.X + (dx / dist) * push,
					playerPos.Y,
					playerPos.Z + (dz / dist) * push
				)
			end
			--// Huỷ MoveTo cũ để CFrame push không bị MoveTo khác kéo qua chỗ khác.
			pcall(function() humanoid:MoveTo(playerPos) end)
			--// Cast cả lúc lùi: gate facing dùng hướng nhìn frame trước (lookAt gán bên dưới
			--// game chưa kịp xử lý, đúng quy tắc "phải facing đã mới cast").
			if skillEnabled and getFacingErrorDeg(playerRoot, playerPos, enemyPos) <= faceToleranceDeg then
				fireSkills()
			end
			playerRoot.CFrame = CFrame.lookAt(pushedPos, enemyPos)
			playerRoot.AssemblyLinearVelocity = Vector3.zero
			playerRoot.AssemblyAngularVelocity = Vector3.zero
			return
		end
		--// Enemy ngoài vùng min (hoặc minDistance = 0 đã tắt): đứng yên + LUÔN facing + cast theo gate.
		pcall(function() humanoid:MoveTo(playerPos) end)
		if getFacingErrorDeg(playerRoot, playerPos, enemyPos) > faceToleranceDeg then
			--// Chưa facing: xoay mặt enemy (giữ nguyên vị trí), cast chờ frame sau.
			faceTowards(playerRoot, enemyPos)
		end
		if skillEnabled and getFacingErrorDeg(playerRoot, playerPos, enemyPos) <= faceToleranceDeg then
			fireSkills()
		end
	end
end

--// HOLD: enemy trong tầm -> lock, orbit tốc độ thấp (center = enemy), quay mặt enemy + spam skill.
--// Tách riêng khỏi stepMovement để cô lập lỗi: nếu phần CFrame/velocity của 1 frame throw thì chỉ
--// ảnh hưởng frame đó (được log ở caller), không làm abrt toàn bộ pipeline CHASE/anchor.
local function stepHold(deltaTime, humanoid, playerRoot, enemy, enemyPos, playerPos)
	if holdMode == "SmartDodge" then
		stepHoldSmartDodge(deltaTime, humanoid, playerRoot, enemy, enemyPos, playerPos)
		return
	end
	ensureAutoRotateDisabled()
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
	--// Gate skill theo facing: chỉ cast khi hướng nhìn frame trước đã khớp enemy. Dùng góc đo TRƯỚC
	--// khi gán CFrame bên dưới — vì CFrame vừa set game chưa kịp xử lý, cast cùng frame sẽ dựa vào
	--// hướng cũ (chưa chắc đã mặt enemy). Lệch > tolerance thì frame này chỉ xoay (CFrame lookAt sẽ
	--// nhìn thẳng enemy), frame sau mới cast.
	if skillEnabled and getFacingErrorDeg(playerRoot, pos, enemyPos) <= faceToleranceDeg then
		fireSkills()
	end
	playerRoot.CFrame = CFrame.lookAt(newPos, enemyPos)
	playerRoot.AssemblyLinearVelocity = Vector3.zero
	playerRoot.AssemblyAngularVelocity = Vector3.zero
end

--// CHASE: pathfinder tới vị trí enemy; ra khỏi tầm -> giải phóng lock, build/follow path, gỡ kẹt.
--// Tách riêng để lỗi ở phần move/waypoint của 1 frame không làm abrt pipeline cùng frame.
local function stepChase(deltaTime, humanoid, playerRoot, enemy, enemyPos, playerPos)
	holdAngle = nil
	holdRadius = nil
	lockedTargetModel = nil
	--// LUÔN facing target (tương đương shift lock): tắt AutoRotate để Roblox không quay nhân vật theo
	--// hướng di chuyển waypoint nữa, tự xoay mặt enemy mỗi frame (CFrame chỉ đổi hướng, giữ vị trí).
	--// Nhờ vậy khi vào HOLD nhân vật đã mặt enemy, cast không phải chờ thêm 1 frame xoay.
	humanoid.AutoRotate = false
	faceTowards(playerRoot, enemyPos)
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
			warn(("[PathAnchor] anchor path HOÀN THÀNH (đã đi hết waypoint idx=%d) -> tính lại"):format(waypointIndex))
		end
		pathComputed = false
		return
	end

	--// Di chuyển Click-to-Move: Humanoid:MoveTo — AutoRotate đã bị tắt + faceTowards ở đầu stepChase
	--// (luôn-facing target), KHÔNG bật lại ở đây kẻo nhân vật quay theo hướng di chuyển lấn mặt target.
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

--// Di chuyển: CHASE theo trạng thái, HOLD khi enemy trong tầm.
--// Orchestrator: resolve chung (guards, rescan, target) rồi dispatch HOLD/CHASE vào từng hàm
--// riêng, mỗi hàm chạy trong 1 pcall độc lập để lỗi 1 phase không abrt cả frame.
local function stepMovement(deltaTime)
	--// Mode 2: tái xác nhận quyền sở hữu engine Smart Dodge MỖI FRAME (chỉ là vài boolean check)
	--// để tự phục hồi nếu engine/auto-dodge bị tắt ngoài ý muốn (vd toggle standalone chạm vào).
	if holdMode == "SmartDodge" then ensureSmartDodgeOwned() end
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

	--// RESCAN THEO CHU KÌ: định kỳ chọn lại target bằng path-cost (ngoài event-driven), để bắt
	--// trường hợp enemy di chuyển làm cost thay đổi mà tập enemy không đổi (event không fire).
	--// KHÔNG rescan khi đang LOCK HOLD (tránh nhảy target giữa các con trong tầm).
	local rescanNow = os.clock()
	if rescanNow - lastRescanTargetAt >= RESCAN_TARGET_INTERVAL then
		lastRescanTargetAt = rescanNow
		if not lockedTargetModel then reselectTarget() end
	end
	--// Guard debug: chỉ render khi bật visualDebug (tránh call mỗi frame khi tắt).
	if visualDebug then
		updateDebugVisuals()
		updateDebugPathVisuals()
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
			--// Fallback: không có chaseModel nhưng vẫn có enemy đang track (ví dụ sau
			--// respawn, tập enemy không đổi nên OnEnemyChanged không fire) → chọn lại ngay.
			--// TRÁNH CHÈN ÉP: nếu đang có lần chọn theo path-cost (selectRunning) thì KHÔNG tự
			--// chọn straight-line ở đây — đứng yên chờ cost-select commit, kẻo phá kết quả chọn.
			local nearest = getNearestEnemy()
			if nearest and not selectRunning then
				chaseModel = nearest.Model
				enemy = nearest
			end
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
		--// Mode 2: đang né giữa chừng thì để Smart Dodge hoàn tất, không ghi đè MoveTo(safePos).
		if not (holdMode == "SmartDodge" and smartDodge.IsDodging()) then
			pcall(function() humanoid:MoveTo(getSafePosition(playerRoot)) end)
		end
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
		local ok, err = pcall(stepHold, deltaTime, humanoid, playerRoot, enemy, enemyPos, playerPos)
		if not ok then
			warn(("[AutoFarmPathfinder] lỗi HOLD: %s"):format(tostring(err)))
		end
		return
	end

	--// HOLD MODE 2 gate CHASE: khi đang né (dodging) hoặc vùng nguy hiểm còn kích hoạt thì KHÔNG
	--// đuổi — hủy MoveTo cũ để đứng yên, để Smart Dodge hoàn tất né an toàn. Hết danger mà enemy
	--// vẫn ngoài tầm thì frame sau vào CHASE bình thường.
	if holdMode == "SmartDodge" then
		local dodging = smartDodge.IsDodging()
		local inDanger = smartDodge.IsInDanger()
		if dodging or inDanger then
			--// Đang né thì KHÔNG ghi đè MoveTo(safePos) của Smart Dodge (tránh xung đột đích đi).
			if not dodging then
				pcall(function() humanoid:MoveTo(getSafePosition(playerRoot)) end)
				--// Luôn facing target kể cả đang đứng chờ hết danger (không cast — chỉ xoay mặt).
				faceTowards(playerRoot, enemyPos)
			end
			return
		end
	end

	local ok, err = pcall(stepChase, deltaTime, humanoid, playerRoot, enemy, enemyPos, playerPos)
	if not ok then
		warn(("[AutoFarmPathfinder] lỗi CHASE: %s"):format(tostring(err)))
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
	local raw = tonumber(value) or skillInterval
	--// Clamp tối thiểu theo thời gian giữ phím (tránh spam key event nhanh hơn game xử lý được,
	--// gây bỏ phím/trùng lặp). Thêm 1 frame an toàn sau khi nhả phím.
	local minInterval = shared.GetKeyHoldTime() + 0.02
	skillInterval = math.max(raw, minInterval)
end

function autoFarmPathfinder.GetSkillMode()
	return skillMode
end

function autoFarmPathfinder.SetSkillMode(value)
	if value == "Both" or value == "Alternate" then
		skillMode = value
	end
end

function autoFarmPathfinder.GetHoldMode()
	return holdMode
end

--// Chuyển chế độ HOLD: "Orbit" (HOLD cũ: đứng yên trên quỹ đạo, quay mặt enemy) /
--// "SmartDodge" (không orbit, đứng im để Smart Dodge né chủ động). Nếu AutoFarm đang chạy,
--// bật/tắt quyền điều khiển Smart Dodge tương ứng ngay lập tức.
function autoFarmPathfinder.SetHoldMode(value)
	if value ~= "Orbit" and value ~= "SmartDodge" then return end
	if holdMode == value then return end
	holdMode = value
	if running then
		if holdMode == "SmartDodge" then
			ensureSmartDodgeOwned()
		else
			releaseSmartDodge()
		end
	end
end

--// Độ lệch hướng nhìn tối đa (độ) để cast skill (gate "facing đã mới cast"). Clamp 0..90.
function autoFarmPathfinder.GetFaceTolerance()
	return faceToleranceDeg
end

function autoFarmPathfinder.SetFaceTolerance(value)
	faceToleranceDeg = math.clamp(tonumber(value) or faceToleranceDeg, 0, 90)
end

--// Khoảng cách MIN giữa nhân vật và enemy gần nhất (Mode 2 SmartDodge). 0 = tắt (đứng yên).
function autoFarmPathfinder.GetMinDistance()
	return minDistance
end

function autoFarmPathfinder.SetMinDistance(value)
	minDistance = math.clamp(tonumber(value) or minDistance, 0, 50)
end

function autoFarmPathfinder.IsVisualDebugEnabled()
	return visualDebug
end

function autoFarmPathfinder.SetVisualDebug(value)
	visualDebug = value == true
	saveDebugSettings()
	if not visualDebug then cleanupDebugVisuals() end
end

function autoFarmPathfinder.GetDebugPathMode()
	return debugPathMode
end

function autoFarmPathfinder.SetDebugPathMode(value)
	if value ~= "Sphere" and value ~= "Line" then return end
	if debugPathMode == value then return end
	debugPathMode = value
	cleanupPathVisuals()
	saveDebugSettings()
	if visualDebug then updateDebugPathVisuals() end
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

--// Thêm anchor mới cho room hiện tại tại vị trí player (mỗi room TỐI ĐA 2 anchor: anchor thứ 2
--// chỉ dùng để định hướng free-walk theo hướng anchor1 -> anchor2). mapName: map cần gắn anchor
--// (mặc định map đang chơi). Trả về số thứ tự mới hoặc nil nếu thất bại/room đã đủ 2 anchor.
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
	--// Limit: mỗi room tối đa 2 anchor (anchor thứ 2 chỉ mang vai trò định hướng free-walk).
	local roomCount = 0
	for _, a in ipairs(list) do
		if a.room == room then roomCount += 1 end
	end
	if roomCount >= 2 then
		warn(("[AutoFarmPathfinder] Room %d đã có đủ 2 anchor, không thể thêm"):format(room))
		return nil
	end
	anchorSeq += 1
	list[#list + 1] = { id = anchorSeq, room = room, pos = pos }
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
		--// Loại trừ lẫn nhau với SmartDodge (2 hệ thống điều khiển nhân vật, không chạy chung).
		--// Mode 2: chụp snapshot TRƯỚC khi EnableExclusive (EnableExclusive sẽ dừng engine SmartDodge
		--// đang chạy nếu có) để khôi phục đúng trạng thái trước khi AutoFarm nắm quyền.
		if holdMode == "SmartDodge" then captureSmartDodgeSnapshot() end
		coordinator.EnableExclusive("AutoFarm")
		--// Mode 2: chiếm Smart Dodge làm chủ di chuyển + bật auto-dodge để nhân vật né chủ động.
		if holdMode == "SmartDodge" then ensureSmartDodgeOwned() end
		if moveConnection then moveConnection:Disconnect(); moveConnection = nil end
		running = true
		lastSkillTime = 0
		cachedNearestEnemy = nil
		cachedNearestValid = false
		selectToken = 0
		selectRunning = false
		lastRescanTargetAt = 0
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
			local ok, err = pcall(function()
				stepMovement(deltaTime)
			end)
			if not ok then
				warn(("[AutoFarmPathfinder] lỗi stepMovement: %s"):format(tostring(err)))
			end
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
		resetRuntimeState()
		cleanupDebugVisuals()
		--// Mode 2: trả quyền điều khiển Smart Dodge (khôi phục engine + auto-dodge như trước).
		releaseSmartDodge()
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
	local faceErrDeg = 0

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
		if phase == "HOLD" then
			faceErrDeg = getFacingErrorDeg(playerRoot, playerPos, displayPos)
		end
	end

	--// Mode 2 (SmartDodge): expose trạng thái né/threat để UI debug theo dõi realtime.
	local smartDodgeActive = holdMode == "SmartDodge"
	local dodging = smartDodgeActive and smartDodge.IsDodging() or false
	local threatActive = smartDodgeActive and smartDodge.IsInDanger() or false

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
		holdMode = holdMode,
		dodging = dodging,
		threatActive = threatActive,
		faceTolerance = faceToleranceDeg,
		faceErr = faceErrDeg,
		minDistance = minDistance,
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

--// Đăng ký hệ thống để coordinator có thể tự tắt khi hệ thống khác bật lên.
coordinator.Register("AutoFarm", autoFarmPathfinder.Toggle, autoFarmPathfinder.IsEnabled)

return autoFarmPathfinder
