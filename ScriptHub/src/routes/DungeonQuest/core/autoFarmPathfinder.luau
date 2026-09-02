-- AutoFarm Pathfinder (v2): cơ chế 2 pha dựa trên state.
--  * Scan 1 lần all enemy -> lock target kẻ địch gần nhất (highlight lock target).
--  * CHASE (chưa trong tầm): Pathfinding chạy thẳng tới vị trí kẻ địch bị lock.
--    Heartbeat check khoảng cách player <-> enemy lock realtime.
--  * HOLD (lọt vào tầm skillRange): hủy pathfinding, đứng yên ở chính vị trí hiện tại
--    (orbit tĩnh, tâm là kẻ địch lock, speed 0, giữ nguyên height) + quay mặt enemy
--    + Auto Skill spam Q+E liên tục.
-- Tách biệt hoàn toàn với AutoFarm v1 (orbit).

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")

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
local skillRange = 15
local moveSpeed = 50
local retargetInterval = 1.0
local skillEnabled = true
local skillInterval = 2.0
local skillMode = "Both" --// "Both" = Q+E cùng lúc, "Alternate" = Q -> E -> Q -> E
local skillTurn = 0 --// dùng cho mode Alternate (0 = Q, 1 = E)
local visualDebug = true

--// Runtime
local moveConnection = nil
local skillConnection = nil
local lastSkillTime = 0
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
local holdAngle = nil
local holdRadius = nil
local lockedTargetModel = nil
local chaseModel = nil
local chasePathTargetModel = nil
local retargetTimer = 0
--// Stuck detection: phát hiện đứng im dù path đang chạy -> tự nhảy gỡ kẹt
--// (vật cản thấp/kệ mép mà path không đánh dấu Jump waypoint).
local stuckCheckPos = nil
local stuckCheckTimer = 0
local stuckJumpCooldown = 0
local STUCK_DIST = 0.3 --// chuyển động < 0.3 stud sau cửa sổ => kẹt
local STUCK_WINDOW = 0.6 --// giây đứng im trước khi nhảy
local STUCK_JUMP_COOLDOWN = 0.6 --// chống spam nhảy liên tục

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

--// Chống kẹt "path none": nếu ComputeAsync trả NoPath cho 1 enemy (thường do enemy
--// kẹt sau tường/vật thể/terrain, spawn trong góc không có lối), ta tạm "ban" enemy đó
--// vài giây để retarget sang enemy khác có thể tới được, tránh kẹt mãi 1 con.
local pathFailBlacklist = {} --// [Model] = os.clock() lúc hết hạn ban
local PATH_FAIL_BAN_SECONDS = 3

local function banPathFailEnemy(model)
	if model then pathFailBlacklist[model] = os.clock() + PATH_FAIL_BAN_SECONDS end
end

local function isEnemyPathBanned(model)
	if not model then return false end
	local untilTime = pathFailBlacklist[model]
	if untilTime and untilTime > os.clock() then return true end
	if untilTime then pathFailBlacklist[model] = nil end --// hết hạn -> cho retry lại
	return false
end

local function getBannedCount()
	local t = os.clock()
	local n = 0
	for _, untilTime in pairs(pathFailBlacklist) do
		if untilTime > t then n += 1 end
	end
	return n
end

--// Lấy kẻ địch gần nhất theo khoảng cách tới player (bỏ qua enemy đang bị ban).
local function getNearestEnemy()
	local playerRoot = getPlayerRoot()
	if not playerRoot then return nil end
	local playerPos = getSafePosition(playerRoot)
	if not playerPos then return nil end
	local nearest = nil
	local nearestDist = math.huge
	for _, data in ipairs(shared.GetTrackedEnemyData()) do
		if data and data.Root and data.Root.Parent and not isEnemyPathBanned(data.Model) then
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

--// MoveSpeed slider map sang Humanoid.WalkSpeed (tốc độ di chuyển của MoveTo).
local oldWalkSpeed = nil
local function applyMoveSpeed(speed)
	local humanoid = shared.GetHumanoid()
	if not humanoid or not humanoid.Parent then return end
	if oldWalkSpeed == nil then oldWalkSpeed = humanoid.WalkSpeed end
	humanoid.WalkSpeed = speed
end

local function restoreWalkSpeed()
	if oldWalkSpeed == nil then return end
	local humanoid = shared.GetHumanoid()
	if humanoid and humanoid.Parent then humanoid.WalkSpeed = oldWalkSpeed end
	oldWalkSpeed = nil
end

local PATH_PARAMS = {
	AgentRadius = 2,
	AgentHeight = 5,
	AgentCanJump = true,
	AgentCanClimb = false,
	--// Nới độ dốc tối đa: enemy trên cao (bậc/dốc) thường > 45 độ khiến
	--// PathfindingService trả NoPath. 85 độ cho phép bám dốc/rìa cao hơn.
	AgentMaxSlope = 85,
	WaypointSpacing = 3,
	Costs = {},
}

--// CHASE: path từ vị trí player tới thẳng vị trí kẻ địch gần nhất (retarget theo interval).
local pathRetryCooldown = 0
local noPathSince = nil --// thời điểm bắt đầu fallback MoveTo (khi path không tính được)
local NO_PATH_BAN_AFTER = 4 --// kẹt fallback lâu quá -> đổi mục tiêu

--// Trả về true nếu đã có path, false nếu không tính được (NoPath / chưa đủ cooldown).
local function computeChasePath()
	--// Hạn chế gọi ComputeAsync quá dày khi path liên tục fail.
	if os.clock() < pathRetryCooldown then return false end
	local playerRoot = getPlayerRoot()
	if not playerRoot then return false end
	local playerPos = getSafePosition(playerRoot)
	if not playerPos then return false end
	local enemy = getNearestEnemy()
	local targetPos = enemy and getSafePosition(enemy.Root) or nil
	if not enemy or not targetPos then
		currentPath = nil
		pathComputed = false
		chaseTarget = nil
		chasePathTargetModel = nil
		return false
	end

	local start = playerPos
	--// Enemy đứng trên cao -> Root của nó cao hơn mặt navmesh, ComputeAsync thẳng tới
	--// đó hay NoPath (navmesh đề-của trả NoPath khi đích không snap được vào ô nối).
	--// Thử nhiều đích theo thứ tự ưu tiên, cái nào ComputeAsync thành công thì dùng:
	--//  1) enemy.Root (chạy thẳng lên đúng enemy)
	--//  2) "chân" enemy: cùng XZ, cao độ = player -> chạy tới là vào HOLD (HOLD tính XZ)
	--//  3) lùi 5 stud về phía player khỏi chân enemy -> nới thêm dung sai snap navmesh
	local candidates = { targetPos }
	local foot = Vector3.new(targetPos.X, playerPos.Y, targetPos.Z)
	candidates[2] = foot
	local backXZ = Vector3.new(targetPos.X - playerPos.X, 0, targetPos.Z - playerPos.Z)
	if backXZ.Magnitude > 1 then
		candidates[3] = backXZ.Unit * -5 + foot
	end

	if currentPath then pcall(function() currentPath:Destroy() end) end
	local path = nil
	local target = nil
	for i = 1, #candidates do
		local candidate = candidates[i]
		path = PathfindingService:CreatePath(PATH_PARAMS)
		local ok = pcall(function()
			path:ComputeAsync(start, candidate)
		end)
		if ok and path.Status == Enum.PathStatus.Success and #path:GetWaypoints() > 0 then
			target = candidate
			break
		end
		path:Destroy()
		path = nil
	end
	if not path or not target then
		currentPath = nil
		pathComputed = false
		chaseTarget = nil
		chasePathTargetModel = nil
		pathRetryCooldown = os.clock() + 0.5
		return false
	end

	chaseTarget = target
	chasePathTargetModel = enemy.Model
	path.Blocked:Connect(function()
		currentPath = nil
		pathComputed = false
		retargetTimer = 0
	end)

	currentPath = path
	waypointIndex = 1
	pathComputed = true
	return true
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

--// Luồng Auto Skill: spam khi kẻ địch (nearest nếu CHASE / lock nếu HOLD) trong tầm
--// skillRange (khoảng cách phẳng XZ).
local function skillLoop()
	if shared.IsInLobby() then return end
	if not dunReady then return end
	if not skillEnabled then return end
	local playerRoot = getPlayerRoot()
	if not playerRoot then return end
	local enemy = getEnemyByModel(lockedTargetModel) or getNearestEnemy()
	local enemyPos = enemy and getSafePosition(enemy.Root) or nil
	local playerPos = getSafePosition(playerRoot)
	if not enemyPos or not playerPos then return end
	local flat = Vector3.new(enemyPos.X - playerPos.X, 0, enemyPos.Z - playerPos.Z)
	if flat.Magnitude <= skillRange then
		fireSkills()
	end
end

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
		local nearest = getNearestEnemy()
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

--// Reset trạng thái phát hiện kẹt khi thoát khỏi pha di chuyển theo path.
local function resetStuckCheck()
	stuckCheckPos = nil
	stuckCheckTimer = 0
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
		return
	end
updateDebugVisuals()
	updateDebugPathSpheres()

	--// CHASE: retarget liên tục theo interval (chọn nearest). Chỉ LOCK khi lọt vào tầm (HOLD).
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
		--// CHASE: retarget theo retargetInterval.
		retargetTimer += deltaTime
		--// chaseModel đang trỏ enemy bị ban (NoPath) -> bắt buộc chọn lại ngay.
		if chaseModel and isEnemyPathBanned(chaseModel) then
			chaseModel = nil
			retargetTimer = retargetInterval
		end
		if retargetTimer >= retargetInterval or not chaseModel then
			retargetTimer = 0
			local nearest = getNearestEnemy()
			chaseModel = nearest and nearest.Model or nil
		end
		enemy = getEnemyByModel(chaseModel) or getNearestEnemy()
	end
	if not enemy or not enemy.Root or not enemy.Root.Parent then
		--// Không có target -> đứng yên, đợi retarget lần sau.
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

	local flat = Vector3.new(enemyPos.X - playerPos.X, 0, enemyPos.Z - playerPos.Z)
	if flat.Magnitude <= skillRange then
		--// HOLD: lọt tầm -> LOCK target này, orbit tốc độ thấp — center = enemy lock,
		--// giữ khoảng cách (holdRadius) + góc (holdAngle) đúng như lúc vào HOLD,
		--// xích ra/lùi theo enemy. Không retarget.
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
		playerRoot.CFrame = CFrame.lookAt(newPos, enemyPos)
		playerRoot.AssemblyLinearVelocity = Vector3.zero
		playerRoot.AssemblyAngularVelocity = Vector3.zero
		return
	end

	--// CHASE: pathfinding tới thẳng vị trí nearest (retarget theo interval).
	--// Ra khỏi tầm -> giải phóng lock, quay lại chế độ retarget.
	holdAngle = nil
	holdRadius = nil
	lockedTargetModel = nil
	--// Path stale khi target hiện tại KHÁC target của path (enemy cũ chết / retarget
	--// sang con khác) -> hủy path ngay để recompute sang target mới, không đi tiếp
	--// theo path cũ dẫn tới chỗ xác (gây "state=CHASE nhưng không di chuyển").
	if currentPath and chasePathTargetModel and chasePathTargetModel ~= enemy.Model then
		pcall(function() currentPath:Destroy() end)
		currentPath = nil
		pathComputed = false
	end
	if not pathComputed or not currentPath then
		local ok = computeChasePath()
		if ok then
			noPathSince = nil
			resetStuckCheck()
			return --// đã có path, frame sau đi theo waypoint
		end

		--// NoPath với enemy hiện tại: thử chạy thẳng tới "chân" enemy (cùng XZ, cao độ
		--// = player) bằng MoveTo — humanoid tự đi + leo dốc/nhảy được địa hình cao
		--// mà navmesh không nối, tiến tới thì HOLD (tính XZ) sẽ kích hoạt.
		ensureAutoRotateEnabled()
		applyMoveSpeed(moveSpeed)
		local enemyRootPos = enemy and enemy.Root and getSafePosition(enemy.Root)
		if enemyRootPos then
			local footPos = Vector3.new(enemyRootPos.X, playerPos.Y, enemyRootPos.Z)
			humanoid:MoveTo(footPos)
		end

		--// Theo dõi thời gian kẹt: vẫn không có đường sau N giây -> ban enemy,
		--// retarget sang con khác để không đứng im mãi.
		if not noPathSince then noPathSince = os.clock() end
		if os.clock() - noPathSince > NO_PATH_BAN_AFTER then
			banPathFailEnemy(enemy.Model)
			noPathSince = nil
			chaseModel = nil
			retargetTimer = retargetInterval
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
		pathComputed = false
		return
	end

	--// Di chuyển theo chuẩn Click-to-Move: Humanoid:MoveTo + AutoRotate bật,
	--// nhân vật tự đi + tự quay theo hướng di chuyển (animation, va chạm).
	ensureAutoRotateEnabled()
	applyMoveSpeed(moveSpeed)

	local wp = waypoints[waypointIndex]
	local dest = wp.Position
	local pos = playerPos
	local toDest = Vector3.new(dest.X - pos.X, 0, dest.Z - pos.Z)
	local dist = toDest.Magnitude
	local tolerate = (wp.Action == Enum.PathWaypointAction.Jump and 2.5) or 2.0

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
	--// không đánh dấu Jump) -> tự nhảy để leo qua. Nếu âm lượng vẫn ổn -> tiếp tục.
	if stuckCheckPos then
		local moved = (playerPos - stuckCheckPos).Magnitude
		if moved > STUCK_DIST then
			stuckCheckPos = playerPos
			stuckCheckTimer = 0
		else
			stuckCheckTimer += deltaTime
			if stuckCheckTimer >= STUCK_WINDOW and os.clock() >= stuckJumpCooldown then
				humanoid.Jump = true
				stuckJumpCooldown = os.clock() + STUCK_JUMP_COOLDOWN
				stuckCheckTimer = 0
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
	if not visualDebug then cleanupDebugVisuals() end
end

--// ---------- Methods ----------

function autoFarmPathfinder.Toggle(state)
	if state == enabled then return end
	enabled = state

	if enabled then
		if moveConnection then moveConnection:Disconnect(); moveConnection = nil end
		if skillConnection then skillConnection:Disconnect(); skillConnection = nil end
		running = true
		retargetTimer = 0
		lastSkillTime = 0
		--// Khởi tạo tracking enemy trong dungeon (không block luồng chính)
		if not dunReady then
			task.spawn(function()
				if shared.ReadyDungeon() then dunReady = true end
			end)
		end
		moveConnection = RunService.Heartbeat:Connect(function(deltaTime)
			pcall(stepMovement, deltaTime)
		end)
		skillConnection = RunService.Heartbeat:Connect(function(deltaTime)
			pcall(skillLoop, deltaTime)
		end)
	else
		if moveConnection then moveConnection:Disconnect(); moveConnection = nil end
		if skillConnection then skillConnection:Disconnect(); skillConnection = nil end
		running = false
		restoreAutoRotate()
		restoreWalkSpeed()
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
		retargetTimer = 0
		noPathSince = nil
		pathFailBlacklist = {}
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
		dunReady = dunReady,
		enabled = enabled,
		pathBanned = getBannedCount(),
		noPathSince = noPathSince,
	}
end

lifecycle.Register(function()
	autoFarmPathfinder.Toggle(false)
end)

return autoFarmPathfinder
