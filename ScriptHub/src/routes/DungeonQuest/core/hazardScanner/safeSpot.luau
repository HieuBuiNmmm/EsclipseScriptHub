-- HazardScanner – Safe Spot Engine (DungeonQuest).
-- Logic xác định điểm an toàn gần nhất (Safe Spot) bằng thuật toán Progressive Radial Sampling.
-- Tích hợp Broad-Phase Spatial Culling, Momentum Alignment (ưu tiên theo đà chạy) và Dynamic Scheduling (tiết kiệm CPU khi rảnh rỗi).

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local geometry = require("@routes/DungeonQuest/core/hazardScanner/geometry")
local trajectory = require("@routes/DungeonQuest/core/hazardScanner/trajectory")
local playerVisual = require("@routes/DungeonQuest/core/hazardScanner/playerVisual")
local candidateGenerator = require("@routes/DungeonQuest/core/hazardScanner/candidateGenerator")
local safeSpotVisual = require("@routes/DungeonQuest/core/hazardScanner/safeSpotVisual")
local contextual = require("@routes/DungeonQuest/core/contextual")

local RunService = services.RunService or game:GetService("RunService")
local Players = game:GetService("Players")
local player = services.player

--// Table
local safeSpot = {}

--// State
local enabled = true
local visualEnabled = true
local showCandidatesVisual = true
local safetyBuffer = 2.0 -- studs (khoảng cách đẩy xa thêm ra khỏi mép danger zone để đứng an toàn)
local currentTargetSafeSpot = nil
local currentThreatInstance = nil
local currentThreatType = nil
local lastDistance = 0
local isFindingSafeSpot = false
local heartbeatConnection = nil
local dangerChangedConnection = nil
local safeSpotChangedCallbacks = {}
local lastEvaluatedCandidates = {}
local lastIdleCheck = 0

--// Lấy HumanoidRootPart của người chơi
local function getPlayerRoot()
	local lp = player or Players.LocalPlayer
	if not lp then return nil end
	local char = lp.Character
	if not char or not char.Parent then return nil end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then return nil end
	return char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
end

--// Lấy vector hướng đang chạy thực tế của người chơi (Running Momentum Direction)
local function getPlayerRunningDirection(root)
	local lp = player or Players.LocalPlayer
	if not lp then return nil end
	local char = lp.Character
	if not char or not char.Parent then return nil end

	-- 1. Ưu tiên đọc Humanoid.MoveDirection (hướng người chơi đang chủ động di chuyển bằng phím/joystick/script)
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health > 0 then
		local moveDir = hum.MoveDirection
		if moveDir and moveDir.Magnitude > 0.1 then
			return Vector3.new(moveDir.X, 0, moveDir.Z).Unit
		end
	end

	-- 2. Đọc theo vận tốc vật lý thực tế của HumanoidRootPart nếu đang di chuyển
	if root and root.Parent then
		local vel = Vector3.zero
		pcall(function()
			vel = root.AssemblyLinearVelocity or root.Velocity or Vector3.zero
		end)
		local hVel = Vector3.new(vel.X, 0, vel.Z)
		if hVel.Magnitude >= 2.0 then
			return hVel.Unit
		end
	end

	return nil
end

--// Lấy độ cao mặt sàn dưới chân người chơi
local function getPlayerGroundY(root)
	if not root then return 0 end
	return root.Position.Y - 2.5
end

--// Kiểm tra xem một điểm P (X-Z) có an toàn (Player Circle nằm ngoài mọi Ground Zone & Trajectory và trong Boss Area) không
function safeSpot.IsPointSafe(point, extraMargin)
	if not point then return false end
	local p2D = Vector3.new(point.X, 0, point.Z)

	-- 0. Kiểm tra Boss Area Constraint nếu đang đấu Boss
	local isBossAreaActive, bossAreaRadius, bossAreaCenter = contextual.GetActiveBossArea()
	if isBossAreaActive and bossAreaCenter and bossAreaRadius and bossAreaRadius > 0 then
		local bossCenter2D = Vector3.new(bossAreaCenter.X, 0, bossAreaCenter.Z)
		if (p2D - bossCenter2D).Magnitude > bossAreaRadius then
			return false
		end
	end

	local playerRad = (playerVisual.GetRadius and playerVisual.GetRadius() or 1.8) + (extraMargin or 0)

	-- 1. Kiểm tra Ground Danger Zones (Đĩa đỏ / Vùng tròn / OBB trên mặt sàn)
	if geometry.IsPointInAnyHazard and geometry.IsPointInAnyHazard(p2D, nil, playerRad) then
		return false
	end

	-- 2. Kiểm tra Trajectory Corridors (Hành lang cam của đạn đang bay)
	if trajectory.IsPointInAnyTrajectory and trajectory.IsPointInAnyTrajectory(p2D, playerRad) then
		return false
	end

	return true
end

--// Thuật toán Progressive Radial Escape Sampling: Tìm điểm an toàn gần nhất từ tọa độ origin
--// Tích hợp Broad-Phase Spatial Culling và Momentum Alignment (ưu tiên theo đà chạy của nhân vật)
function safeSpot.FindNearestSafeSpot(origin)
	local root = getPlayerRoot()
	if not origin then
		if not root then return nil, false, 0, Vector3.zero end
		origin = root.Position
	end

	local origin2D = Vector3.new(origin.X, 0, origin.Z)
	local momentumDir = getPlayerRunningDirection(root)
	table.clear(lastEvaluatedCandidates)

	-- 0. Kiểm tra Boss Area Constraint
	local isBossAreaActive, bossAreaRadius, bossAreaCenter = contextual.GetActiveBossArea()
	local bossAreaCenter2D = (isBossAreaActive and bossAreaCenter and bossAreaRadius and bossAreaRadius > 0)
		and Vector3.new(bossAreaCenter.X, 0, bossAreaCenter.Z)
		or nil

	-- 1. Broad-Phase Spatial Culling: Lọc nhanh các hazard & trajectory trong phạm vi ảnh hưởng (65 studs)
	local relevantHazards = geometry.GetNearbyHazards and geometry.GetNearbyHazards(origin2D, 65) or nil
	local relevantTrajectories = trajectory.GetNearbyTrajectories and trajectory.GetNearbyTrajectories(origin2D, 65) or nil

	-- Hàm kiểm tra an toàn tối ưu chỉ duyệt qua danh sách relevant đã lọc
	local function isPointSafeScoped(candPoint, extraMargin)
		if not candPoint then return false end
		local p2D = Vector3.new(candPoint.X, 0, candPoint.Z)

		-- Kiểm tra giới hạn Boss Area (không chọn safe spot nằm ngoài vùng Boss Arena)
		if bossAreaCenter2D and bossAreaRadius then
			local distToCenter = (p2D - bossAreaCenter2D).Magnitude
			if distToCenter > bossAreaRadius then
				return false
			end
		end

		local playerRad = (playerVisual.GetRadius and playerVisual.GetRadius() or 1.8) + (extraMargin or 0)

		if geometry.IsPointInAnyHazard and geometry.IsPointInAnyHazard(p2D, nil, playerRad, relevantHazards) then
			return false
		end

		if trajectory.IsPointInAnyTrajectory and trajectory.IsPointInAnyTrajectory(p2D, playerRad, relevantTrajectories) then
			return false
		end

		return true
	end

	-- 2. Nếu không có bất kỳ mối nguy nào trong phạm vi hoặc vị trí hiện tại đã an toàn -> Xong ngay lập tức
	if (relevantHazards and #relevantHazards == 0 and relevantTrajectories and #relevantTrajectories == 0 and not bossAreaCenter2D) or isPointSafeScoped(origin2D, 0) then
		table.insert(lastEvaluatedCandidates, { pos = origin2D, isSafe = true, isChosen = true })
		return origin2D, true, 0, Vector3.zero
	end

	-- 3. Xác định hướng ưu tiên né (Preferred Escape Direction):
	local preferredDir = momentumDir
	local playerRad = playerVisual.GetRadius and playerVisual.GetRadius() or 1.8
	local inTraj, _, trajDir, trajCentroid = trajectory.IsPointInAnyTrajectory(origin2D, playerRad, relevantTrajectories)

	if inTraj and trajDir and trajCentroid then
		local normalLeft = Vector3.new(-trajDir.Z, 0, trajDir.X)
		local normalRight = Vector3.new(trajDir.Z, 0, -trajDir.X)
		local toPlayer = origin2D - trajCentroid
		local projLeft = toPlayer.X * normalLeft.X + toPlayer.Z * normalLeft.Z

		local chosenNormal = projLeft >= 0 and normalLeft or normalRight

		if momentumDir and momentumDir.Magnitude > 0.1 then
			local dotLeft = momentumDir.X * normalLeft.X + momentumDir.Z * normalLeft.Z
			local dotRight = momentumDir.X * normalRight.X + momentumDir.Z * normalRight.Z
			if dotLeft > dotRight + 0.3 then
				chosenNormal = normalLeft
			elseif dotRight > dotLeft + 0.3 then
				chosenNormal = normalRight
			end
		end

		-- Tính hệ số xéo lùi k linh hoạt trong dải góc từ 100° (k = 0.18) đến 135° (k = 1.0)
		local k = 0.45
		if momentumDir and momentumDir.Magnitude > 0.1 then
			local dotBack = -(momentumDir.X * trajDir.X + momentumDir.Z * trajDir.Z)
			local dotNorm = math.abs(momentumDir.X * chosenNormal.X + momentumDir.Z * chosenNormal.Z)
			if dotNorm > 0.05 then
				local dynamicK = dotBack / dotNorm
				k = math.clamp(dynamicK, 0.18, 1.0)
			elseif dotBack > 0 then
				k = 1.0
			else
				k = 0.18
			end
		end

		local obliqueEscape = (chosenNormal - k * trajDir).Unit
		preferredDir = obliqueEscape
	elseif bossAreaCenter2D and (origin2D - bossAreaCenter2D).Magnitude > bossAreaRadius then
		-- Nếu đang đứng ngoài Boss Area và không có quỹ đạo đạn: Ưu tiên hướng né chạy thẳng vào tâm Boss Area
		preferredDir = (bossAreaCenter2D - origin2D).Unit
	end

	-- Tier 1: Coarse Pass (8 hướng, bán kính thưa, yêu cầu buffer an toàn, ưu tiên theo hướng né tối ưu)
	local bestPoint, found, bestDist, bestDir = candidateGenerator.SamplePass(
		origin2D,
		candidateGenerator.COARSE_DIRECTIONS,
		candidateGenerator.COARSE_RADII,
		safetyBuffer,
		true,
		isPointSafeScoped,
		lastEvaluatedCandidates,
		preferredDir
	)

	-- Tier 2: Fine Pass (16 hướng, bán kính chi tiết, yêu cầu buffer an toàn, ưu tiên theo hướng né tối ưu)
	if not found then
		bestPoint, found, bestDist, bestDir = candidateGenerator.SamplePass(
			origin2D,
			candidateGenerator.FINE_DIRECTIONS,
			candidateGenerator.FINE_RADII,
			safetyBuffer,
			true,
			isPointSafeScoped,
			lastEvaluatedCandidates,
			preferredDir
		)
	end

	-- Tier 3: Emergency Fallback Pass (16 hướng, bán kính chi tiết, không bắt buộc buffer, ưu tiên theo hướng né tối ưu)
	if not found then
		bestPoint, found, bestDist, bestDir = candidateGenerator.SamplePass(
			origin2D,
			candidateGenerator.FINE_DIRECTIONS,
			candidateGenerator.FINE_RADII,
			0,
			false,
			isPointSafeScoped,
			lastEvaluatedCandidates,
			preferredDir
		)
	end

	if found and bestPoint then
		-- Đánh dấu candidate được chọn trong danh sách debug visual
		for _, cand in ipairs(lastEvaluatedCandidates) do
			if (cand.pos - bestPoint).Magnitude < 0.25 then
				cand.isChosen = true
				break
			end
		end
		return bestPoint, true, bestDist, bestDir
	end

	-- Không tìm thấy điểm an toàn trong phạm vi tối đa
	return origin2D, false, math.huge, Vector3.zero
end

--// Vòng lặp Heartbeat: Thực hiện kiểm tra với Dynamic Scheduling (tiết kiệm CPU khi an toàn)
local function onHeartbeat()
	if not enabled then
		safeSpotVisual.Hide()
		return
	end

	local root = getPlayerRoot()
	if not root or not root.Parent then
		safeSpotVisual.Hide()
		return
	end

	-- Kiểm tra xem Player có đang trong vùng nguy hiểm không
	local inDanger, threatInfo, threatType = false, nil, nil
	if playerVisual.IsPlayerInDanger then
		inDanger, threatInfo, threatType = playerVisual.IsPlayerInDanger()
	end

	-- Dynamic Scheduling: Khi Player hoàn toàn an toàn và không đang tìm/né Safe Spot, throttle kiểm tra ~20Hz
	local isCurrentlyActive = inDanger or (currentTargetSafeSpot ~= nil) or isFindingSafeSpot
	if not isCurrentlyActive then
		local now = os.clock()
		if now - lastIdleCheck < 0.05 then
			return
		end
		lastIdleCheck = now
	end

	local targetY = getPlayerGroundY(root)
	local playerPos2D = Vector3.new(root.Position.X, 0, root.Position.Z)

	if inDanger then
		-- Kiểm tra xem Safe Spot đã chọn trước đó còn hợp lệ không:
		-- 1. Điểm đó vẫn phải Safe (không bị đè bởi vùng đỏ hoặc vùng cam mới).
		-- 2. Mối đe dọa (threat) của Player không bị đổi sang chiêu/loại khác.
		local distToTarget = currentTargetSafeSpot and (currentTargetSafeSpot - playerPos2D).Magnitude or 0
		local isTargetStillSafe = currentTargetSafeSpot and safeSpot.IsPointSafe(currentTargetSafeSpot)
		local isSameThreat = (threatInfo == currentThreatInstance and threatType == currentThreatType)

		-- Nếu Safe Spot cũ bị đè HOẶC Player bị dính thêm/đổi Threat mới HOẶC chưa có Safe Spot:
		if not isTargetStillSafe or not isSameThreat or not currentTargetSafeSpot then
			local spot, found, dist, dir = safeSpot.FindNearestSafeSpot(root.Position)

			if found and spot then
				currentTargetSafeSpot = spot
				currentThreatInstance = threatInfo
				currentThreatType = threatType
				lastDistance = dist
				isFindingSafeSpot = true

				safeSpotVisual.Update(root, spot, targetY, lastEvaluatedCandidates, visualEnabled, showCandidatesVisual)

				for _, cb in ipairs(safeSpotChangedCallbacks) do
					pcall(cb, true, spot, dist)
				end
			else
				safeSpotVisual.Hide()
			end
		else
			-- Safe Spot cũ vẫn an toàn và cùng mối nguy -> GIỮ NGUYÊN để chuyển động né mượt mà không rung lắc
			lastDistance = distToTarget
			safeSpotVisual.Update(root, currentTargetSafeSpot, targetY, lastEvaluatedCandidates, visualEnabled, showCandidatesVisual)

			for _, cb in ipairs(safeSpotChangedCallbacks) do
				pcall(cb, true, currentTargetSafeSpot, distToTarget)
			end
		end
	else
		-- Khi player đã bước ra ngoài vùng nguy hiểm:
		-- Nếu vẫn còn targetSafeSpot và người chơi chưa chạm tới đích (distToTarget > 0.8 studs), tiếp tục duy trì để Auto-Dodge snap hoàn tất
		local distToTarget = currentTargetSafeSpot and (currentTargetSafeSpot - playerPos2D).Magnitude or 0
		local isTargetStillSafe = currentTargetSafeSpot and safeSpot.IsPointSafe(currentTargetSafeSpot)

		if isTargetStillSafe and distToTarget > 0.8 then
			lastDistance = distToTarget
			safeSpotVisual.Update(root, currentTargetSafeSpot, targetY, lastEvaluatedCandidates, visualEnabled, showCandidatesVisual)
			for _, cb in ipairs(safeSpotChangedCallbacks) do
				pcall(cb, true, currentTargetSafeSpot, distToTarget)
			end
		else
			-- Khi đã thực sự tới đích hoặc điểm không còn an toàn -> ẩn visual và reset
			if isFindingSafeSpot or currentTargetSafeSpot then
				isFindingSafeSpot = false
				currentTargetSafeSpot = nil
				currentThreatInstance = nil
				currentThreatType = nil
				lastDistance = 0
				safeSpotVisual.Hide()

				for _, cb in ipairs(safeSpotChangedCallbacks) do
					pcall(cb, false, nil, 0)
				end
			end
		end
	end
end

--// Khởi động tracking
local function startTracking()
	if not heartbeatConnection then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
	if not dangerChangedConnection and playerVisual.OnDangerStatusChanged then
		-- Event-Driven Wakeup: Phản hồi ngay lập tức tại frame nguy hiểm xuất hiện
		dangerChangedConnection = playerVisual.OnDangerStatusChanged(function(nowInDanger)
			if nowInDanger and enabled then
				onHeartbeat()
			end
		end)
	end
end

--// Xóa sạch trạng thái Safe Spot hiện tại (khi hết hiểm họa, đổi room, hoặc hết quái)
function safeSpot.Clear()
	if isFindingSafeSpot or currentTargetSafeSpot then
		isFindingSafeSpot = false
		currentTargetSafeSpot = nil
		currentThreatInstance = nil
		currentThreatType = nil
		lastDistance = 0
		table.clear(lastEvaluatedCandidates)
		safeSpotVisual.Hide()

		for _, cb in ipairs(safeSpotChangedCallbacks) do
			pcall(cb, false, nil, 0)
		end
	end
end

--// Dọn dẹp Safe Spot
function safeSpot.Cleanup()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	safeSpotVisual.Cleanup()
	table.clear(lastEvaluatedCandidates)
	currentTargetSafeSpot = nil
	currentThreatInstance = nil
	currentThreatType = nil
	lastDistance = 0
	isFindingSafeSpot = false
	lastIdleCheck = 0
end

--// API Public
function safeSpot.GetLastSafeSpot()
	return currentTargetSafeSpot, lastDistance, isFindingSafeSpot
end

function safeSpot.OnSafeSpotChanged(callback)
	if type(callback) == "function" then
		table.insert(safeSpotChangedCallbacks, callback)
	end
end

function safeSpot.SetVisualEnabled(state)
	visualEnabled = state and true or false
	if not visualEnabled then
		safeSpotVisual.Hide()
	end
end

function safeSpot.IsVisualEnabled()
	return visualEnabled
end

function safeSpot.SetShowCandidates(state)
	showCandidatesVisual = state and true or false
	if not showCandidatesVisual then
		safeSpotVisual.HideCandidates()
	end
end

function safeSpot.IsShowCandidates()
	return showCandidatesVisual
end

function safeSpot.SetEnabled(state)
	enabled = state and true or false
	if not enabled then
		safeSpotVisual.Hide()
	end
end

function safeSpot.IsEnabled()
	return enabled
end

function safeSpot.SetSafetyBuffer(val)
	if type(val) == "number" and val >= 0 then
		safetyBuffer = val
	end
end

function safeSpot.GetSafetyBuffer()
	return safetyBuffer
end

-- Lắng nghe hồi sinh nhân vật để dọn visual cũ
local function hookRespawn()
	local lp = player or Players.LocalPlayer
	if not lp then return end
	lp.CharacterAdded:Connect(function()
		safeSpot.Clear()
	end)
end
hookRespawn()

-- Lắng nghe room thay đổi hoặc hết quái để lập tức dọn sạch Safe Spot cũ
if shared.OnRoomIndexChanged then
	shared.OnRoomIndexChanged(function()
		safeSpot.Clear()
	end)
end

if shared.OnEnemyChanged then
	shared.OnEnemyChanged(function()
		if shared.GetEnemyCount and shared.GetEnemyCount() == 0 then
			safeSpot.Clear()
		end
	end)
end

if shared.OnLobbyChanged then
	shared.OnLobbyChanged(function()
		safeSpot.Clear()
	end)
end

if shared.OnBossActiveChanged then
	shared.OnBossActiveChanged(function()
		safeSpot.Clear()
	end)
end

-- Khởi động tracking
startTracking()

-- Dọn dẹp khi shutdown
lifecycle.Register(function()
	safeSpot.Cleanup()
end)

return safeSpot
