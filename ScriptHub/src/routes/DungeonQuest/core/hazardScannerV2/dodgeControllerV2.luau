--!nocheck
-- HazardScannerV2 - Dodge Controller V2 (Pure Locomotion & Anti Ping-Pong Engine)
-- Thiết kế chuyên biệt cho Tự Động Di Chuyển & Né Đòn (KHÔNG can thiệp skill hay sát thương):
-- 1. LOCOMOTION ENGINE:
--    - Di chuyển bằng PreSimulation / RenderStepped 60 FPS theo đúng vector an toàn của SafeSpotV2.
--    - Không đâm đầu vào tường vì vector đã được kiểm tra va chạm địa hình map thực tế.
-- 2. ANTI PING-PONG ENGINE:
--    - Khử hoàn toàn lỗi bóng bàn (vừa bước ra khỏi mép thì AutoFarm kéo ngược vào lửa).
--    - Cơ chế HOLDING_SAFE: Giữ nhân vật tại điểm an toàn cho đến khi chiêu thức nguy hiểm tắt hẳn.
-- 3. SMOOTH DECELERATION & SNAP:
--    - Triệt tiêu quán tính trượt bằng AssemblyLinearVelocity = Vector3.zero.
--    - Tùy chọn Instant Snap khi tới cự ly gần.
-- 4. EMERGENCY ESCAPE SUPPORT:
--    - Tự động duy trì chạy tháo lui khi đối mặt với AoE khổng lồ vượt quá bán kính quét.

--// Imports
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local contextual = require("@routes/DungeonQuest/core/contextual")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local danger = require("@routes/DungeonQuest/core/hazardScannerV2/danger")
local safeSpotV2 = require("@routes/DungeonQuest/core/hazardScannerV2/safeSpotV2")
local bossWatcher = require("@routes/DungeonQuest/core/hazardScannerV2/bossWatcher")

--// Table
local dodgeControllerV2 = {}

--// State
local enabled = false
local snapDistance = 1.2          -- studs (khoảng cách coi như đã tới đích an toàn)
local enableSnap = false           -- Mặc định false (dừng êm bằng physics, không dịch chuyển giật hình)
local enableHolding = true        -- Bật/tắt trạng thái HOLDING_SAFE sau khi né (Anti Ping-Pong)
local isDodging = false            -- Trạng thái đang né hoặc đang giữ vị trí an toàn (để AutoFarm nhường quyền)
local activeTargetSpot: Vector3? = nil
local dodgeState = "IDLE"          -- "IDLE" | "DODGING" | "HOLDING_SAFE"
local holdStartTime = 0
local MAX_HOLD_TIMEOUT = 3.0       -- Giây tối đa giữ chân nếu quái không tắt chiêu

-- Phase 3: Organic Steering & Strafing Settings
local enableMomentumBlending = true  -- Pha trộn quán tính làm mượt chuyển hướng (Vector Slerp/Lerp)
local enableCombatFacing = true      -- Khóa xoay nhìn Boss / Enemy khi né (Strafe animations)
local enableArcStrafing = true       -- Bo cua tiếp tuyến ôm viền chiêu thức hình tròn/hộp
local enableFlowState = true         -- Nối chuỗi né liên hoàn không bị khựng giật
local turnSharpness = 14.0           -- Hệ số bẻ lái mượt mà (chuyển hướng tự nhiên)

--// Drivers & Connections
local activeMoveVector = Vector3.zero
local targetMoveVector = Vector3.zero
local smoothedMoveVector = Vector3.zero
local lastFrameTime = os.clock()
local moveDriverConn: RBXScriptConnection? = nil
local heartbeatConn: RBXScriptConnection? = nil
local dodgeCallbacks = {}

--// Helpers lấy Components
local function getPlayerComponents()
	local lp = (services and services.player) or Players.LocalPlayer
	if not lp then return nil, nil, nil end
	local char = lp.Character
	if not char or not char.Parent then return nil, nil, nil end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then return nil, nil, nil end
	local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
	if not root then return nil, nil, nil end
	return char, hum, root
end

--// Quản lý khóa phím điều khiển (ngăn Roblox ControlModule ghi đè vector 0)
local function disableControls()
	if shared.DisableControls then
		shared.DisableControls("DodgeV2")
	end
end

local function enableControls()
	if shared.EnableControls then
		shared.EnableControls("DodgeV2")
	end
end

-- Khóa xoay nhìn Boss / Enemy khi né để thực hiện Tactical Strafe
local function updateCombatFacing(root, hum)
	if not enableCombatFacing or not root or not hum then return end

	local faceTargetPos = nil
	local bossModel, _, bossRoot = bossWatcher.FindBossModel and bossWatcher.FindBossModel()
	if bossRoot then
		faceTargetPos = bossRoot.Position
	else
		local target = shared.GetCombatTarget and shared.GetCombatTarget()
		if target and target.Root then
			faceTargetPos = target.Root.Position
		end
	end

	if faceTargetPos then
		local flatDiff = Vector3.new(faceTargetPos.X - root.Position.X, 0, faceTargetPos.Z - root.Position.Z)
		if flatDiff.Magnitude > 2.0 then
			pcall(function()
				hum.AutoRotate = false
				root.CFrame = CFrame.lookAt(root.Position, Vector3.new(faceTargetPos.X, root.Position.Y, faceTargetPos.Z))
			end)
			return
		end
	end

	pcall(function() hum.AutoRotate = true end)
end

-- Arc Strafing & Tangential Steering (Bo cua tiếp tuyến ôm viền chiêu thức)
local function computeSteeringVector(playerPos: Vector3, targetPos: Vector3): Vector3
	local directOffset = Vector3.new(targetPos.X - playerPos.X, 0, targetPos.Z - playerPos.Z)
	local dist = directOffset.Magnitude
	if dist <= 0.1 then
		return Vector3.zero
	end
	local directDir = directOffset.Unit

	if not enableArcStrafing or dist <= 3.0 then
		return directDir
	end

	-- Kiểm tra nếu đoạn giữa đường đi trực tiếp cắt ngang qua vùng nguy hiểm
	local midPoint = playerPos + directDir * (dist * 0.5)
	if not danger.IsPointSafe(midPoint, 0.5) then
		local activeHazards = danger.GetActiveHazards()
		if activeHazards then
			for _, data in pairs(activeHazards) do
				if data.shape and data.shape.x and data.shape.z then
					local hPos = Vector3.new(data.shape.x, 0, data.shape.z)
					local toPlayer = Vector3.new(playerPos.X - hPos.X, 0, playerPos.Z - hPos.Z)
					if toPlayer.Magnitude > 0.1 then
						local rad = toPlayer.Unit
						local tan1 = Vector3.new(-rad.Z, 0, rad.X)
						local tan2 = Vector3.new(rad.Z, 0, -rad.X)
						local chosenTan = (tan1:Dot(directDir) > tan2:Dot(directDir)) and tan1 or tan2
						local arcDir = (directDir + chosenTan * 0.70).Unit
						return arcDir
					end
				end
			end
		end
	end

	return directDir
end

--// PreSimulation Move Driver (Cấp lực di chuyển liên tục trước bước tính vật lý)
local function startMoveDriver()
	if moveDriverConn then return end
	local stepSignal = RunService.PreSimulation or RunService.RenderStepped or RunService.Heartbeat
	lastFrameTime = os.clock()
	moveDriverConn = stepSignal:Connect(function()
		if not isDodging or dodgeState == "HOLDING_SAFE" then return end
		local _, hum, root = getPlayerComponents()
		if not hum or not root then return end

		local now = os.clock()
		local dt = math.clamp(now - lastFrameTime, 0.001, 0.1)
		lastFrameTime = now

		-- 1. Momentum & Slerp/Lerp Blending
		if enableMomentumBlending and targetMoveVector.Magnitude > 0.01 then
			local blendAlpha = math.clamp(dt * turnSharpness, 0.08, 0.40)
			smoothedMoveVector = smoothedMoveVector:Lerp(targetMoveVector, blendAlpha)
			if smoothedMoveVector.Magnitude > 0.01 then
				activeMoveVector = smoothedMoveVector.Unit
			else
				activeMoveVector = targetMoveVector
			end
		else
			activeMoveVector = targetMoveVector
			smoothedMoveVector = targetMoveVector
		end

		if activeMoveVector.Magnitude > 0.01 then
			hum:Move(activeMoveVector, false)
		end

		-- 2. Combat Facing (Khóa nhìn Boss / Enemy khi né)
		if enableCombatFacing then
			updateCombatFacing(root, hum)
		end
	end)
end

local function stopMoveDriver()
	if moveDriverConn then
		moveDriverConn:Disconnect()
		moveDriverConn = nil
	end
	targetMoveVector = Vector3.zero
	smoothedMoveVector = Vector3.zero
	activeMoveVector = Vector3.zero
end

local function setMoveTarget(targetPos: Vector3)
	local _, _, root = getPlayerComponents()
	if not root or not targetPos then
		targetMoveVector = Vector3.zero
		activeMoveVector = Vector3.zero
		return
	end
	targetMoveVector = computeSteeringVector(root.Position, targetPos)
end

-- Triệt tiêu quán tính trượt ngang (X, Z), BẢO TOÀN 100% trọng lực trục Y để chân bám sàn
local function zeroHorizontalVelocity(root)
	if not root then return end
	pcall(function()
		local vel = root.AssemblyLinearVelocity or root.Velocity
		if vel then
			root.AssemblyLinearVelocity = Vector3.new(0, vel.Y, 0)
		end
	end)
end

local function stopMove(hum, root)
	targetMoveVector = Vector3.zero
	smoothedMoveVector = Vector3.zero
	activeMoveVector = Vector3.zero
	stopMoveDriver()
	if hum then
		pcall(function()
			hum:Move(Vector3.zero, false)
			hum.AutoRotate = true
		end)
	end
	if root then
		zeroHorizontalVelocity(root)
	end
	enableControls()
end

--// Thông báo Callbacks
local function fireCallbacks(dodging: boolean, spot: Vector3?, dist: number, state: string)
	for _, cb in ipairs(dodgeCallbacks) do
		pcall(cb, dodging, spot, dist, state)
	end
end

--// Kiểm tra xem có hiểm họa nào đang cháy gần nhân vật không (phục vụ Anti Ping-Pong)
local function hasActiveHazardsNearby(centerPos: Vector3, checkRadius: number): boolean
	local activeHazards = danger.GetActiveHazards()
	if not activeHazards or next(activeHazards) == nil then
		return false
	end
	local rSq = checkRadius * checkRadius
	for part, data in pairs(activeHazards) do
		if data.shape then
			local sx = data.shape.x or 0
			local sz = data.shape.z or 0
			local distSq = (centerPos.X - sx)^2 + (centerPos.Z - sz)^2
			if distSq <= rSq then
				return true
			end
		end
	end
	return false
end

--// Reset toàn bộ trạng thái
function dodgeControllerV2.Clear()
	if isDodging or activeTargetSpot or dodgeState ~= "IDLE" then
		activeTargetSpot = nil
		isDodging = false
		dodgeState = "IDLE"
		local _, hum, root = getPlayerComponents()
		stopMove(hum, root)
		fireCallbacks(false, nil, 0, "IDLE")
	end
end

--// Vòng lặp giám sát và điều khiển di chuyển
local function onHeartbeat()
	if not enabled then
		if isDodging or activeTargetSpot or dodgeState ~= "IDLE" then
			dodgeControllerV2.Clear()
		end
		return
	end

	local char, hum, root = getPlayerComponents()
	if not char or not hum or not root then
		if isDodging or activeTargetSpot or dodgeState ~= "IDLE" then
			dodgeControllerV2.Clear()
		end
		return
	end

	-- 1. Bỏ qua nếu đang bất tử (vừa hồi sinh / khiên bảo vệ)
	if shared.IsInvulnerable and shared.IsInvulnerable() then
		dodgeControllerV2.Clear()
		return
	end

	-- 2. Bỏ qua nếu mục tiêu Boss cấu hình tắt né trong Contextual
	if (contextual.IsActiveDodgeDisabled and contextual.IsActiveDodgeDisabled())
		or (contextual.IsActiveHazardScannerEnabled and not contextual.IsActiveHazardScannerEnabled()) then
		dodgeControllerV2.Clear()
		return
	end

	local inDanger, threatData, threatType = danger.IsPlayerInDanger()

	--==========================================================================
	-- NẾU AN TOÀN VÀ ĐANG Ở TRẠNG THÁI IDLE: HOÀN TOÀN KHÔNG CAN THIỆP!
	-- Trả lại 100% quyền điều khiển, animation bước chân và trọng lực tự nhiên cho Roblox
	--==========================================================================
	if not inDanger and dodgeState == "IDLE" then
		if isDodging or activeTargetSpot then
			dodgeControllerV2.Clear()
		end
		return
	end

	local now = os.clock()
	local playerPos = root.Position

	-- CHỈ tìm hoặc cập nhật Safe Spot khi ĐANG GẶP NGUY HIỂM hoặc ĐANG NÉ
	local targetSpot, hasSpot, distToSpot = safeSpotV2.GetSafeSpot()

	-- Cập nhật mục tiêu né nếu SafeSpotV2 tìm thấy điểm an toàn
	if targetSpot then
		activeTargetSpot = targetSpot
	elseif inDanger and not activeTargetSpot then
		local foundSpot = safeSpotV2.FindNearestSafeSpot(playerPos, true)
		if foundSpot then
			activeTargetSpot = foundSpot
		end
	end

	-- Kiểm tra nếu activeTargetSpot hiện tại bị nguy hiểm đè lên (dynamic hazard/corridor)
	if activeTargetSpot and not safeSpotV2.IsPointSafe(activeTargetSpot, 0.5) then
		local newSpot = safeSpotV2.FindNearestSafeSpot(playerPos, true)
		if newSpot then
			activeTargetSpot = newSpot
		end
	end

	--==========================================================================
	-- TRƯỜNG HỢP 1: ĐANG NẰM TRONG NGUY HIỂM HOẶC CẦN CHẠY TỚI ĐIỂM AN TOÀN
	--==========================================================================
	if inDanger or (activeTargetSpot and dodgeState == "DODGING") then
		if not activeTargetSpot then
			return
		end

		local flatDelta = Vector3.new(activeTargetSpot.X - playerPos.X, 0, activeTargetSpot.Z - playerPos.Z)
		local flatDist = flatDelta.Magnitude

		-- ĐÃ ĐẾN NƠI (Cự ly lọt vào khoảng đệm an toàn)
		if flatDist <= snapDistance or (not inDanger and flatDist <= 2.0) then
			-- Tùy chọn Snap nếu người dùng bật
			if enableSnap and flatDist <= snapDistance then
				local currentCF = root.CFrame
				local targetWorldPos = Vector3.new(activeTargetSpot.X, playerPos.Y, activeTargetSpot.Z)
				char:PivotTo(CFrame.new(targetWorldPos) * (currentCF - currentCF.Position))
			end

			-- PROACTIVE REPOSITIONING: Nếu đã an toàn nhưng điểm đứng còn chật hẹp / gần lửa / sát tường
			-- Tiếp tục lướt mượt mà sang vùng đất rộng (Sweet-spot) mà không phanh dừng lại ở mép lửa!
			if not inDanger and safeSpotV2.FindRepositionSpot then
				local bossModel, _, bossRoot = bossWatcher.FindBossModel and bossWatcher.FindBossModel()
				local enemyPos = bossRoot and bossRoot.Position
				if not enemyPos then
					local curTarget = shared.GetCombatTarget and shared.GetCombatTarget()
					if curTarget and curTarget.Root then
						enemyPos = curTarget.Root.Position
					end
				end

				if enemyPos then
					local minD, maxD = contextual.GetActiveCombatDistances()
					local repoSpot, needsRepo = safeSpotV2.FindRepositionSpot(playerPos, enemyPos, minD, maxD)
					if needsRepo and repoSpot and (repoSpot - playerPos).Magnitude > 2.0 then
						activeTargetSpot = repoSpot
						dodgeState = "DODGING"
						isDodging = true
						setMoveTarget(repoSpot)
						fireCallbacks(true, activeTargetSpot, (repoSpot - playerPos).Magnitude, "REPOSITIONING")
						return
					end
				end
			end

			-- Triệt tiêu quán tính trượt ngang (BẢO TOÀN Y trọng lực bám sàn)
			zeroHorizontalVelocity(root)
			targetMoveVector = Vector3.zero
			smoothedMoveVector = Vector3.zero
			activeMoveVector = Vector3.zero
			stopMoveDriver()
			if hum then
				pcall(function()
					hum:Move(Vector3.zero, false)
					hum.AutoRotate = true
				end)
			end

			-- CƠ CHẾ ANTI PING-PONG:
			-- Kiểm tra xem chiêu thức vừa né có còn đang cháy ở gần đó không (nếu bật Holding)
			local hasNearby = enableHolding and hasActiveHazardsNearby(playerPos, 40)
			if hasNearby then
				dodgeState = "HOLDING_SAFE"
				holdStartTime = now
				isDodging = true -- Giữ cờ true để AutoFarm không giật bot bước ngược vào chiêu thức
				fireCallbacks(true, activeTargetSpot, flatDist, "HOLDING_SAFE")
			else
				-- Không còn chiêu nào đe dọa hoặc tính năng Holding bị tắt -> nhả quyền điều khiển lại cho AutoFarm / Player
				dodgeState = "IDLE"
				isDodging = false
				activeTargetSpot = nil
				enableControls()
				fireCallbacks(false, nil, 0, "IDLE")
			end
		else
			-- CHƯA ĐẾN NƠI -> Tiếp tục chạy theo vector an toàn
			if dodgeState ~= "DODGING" then
				dodgeState = "DODGING"
				isDodging = true
				disableControls()
				startMoveDriver()
				fireCallbacks(true, activeTargetSpot, flatDist, "DODGING")
			end
			setMoveTarget(activeTargetSpot)
		end
		return
	end

	--==========================================================================
	-- TRƯỜNG HỢP 2: ĐANG GIỮ CHÂN TẠI VÙNG AN TOÀN (HOLDING_SAFE)
	--==========================================================================
	if dodgeState == "HOLDING_SAFE" then
		-- Chỉ triệt tiêu nếu có ngoại lực đẩy trượt ngang, không gọi liên tục ép Y
		pcall(function()
			local vel = root.AssemblyLinearVelocity or root.Velocity
			if vel and (vel.X * vel.X + vel.Z * vel.Z > 1.0) then
				root.AssemblyLinearVelocity = Vector3.new(0, vel.Y, 0)
			end
		end)
		activeMoveVector = Vector3.zero

		-- Nếu có chiêu mới tràn tới đè lên chân hoặc hiểm họa cập kề -> Lập tức thoát Hold để né tiếp!
		if inDanger then
			dodgeState = "DODGING"
			isDodging = true
			disableControls()
			startMoveDriver()
			return
		end

		-- Kiểm tra xem chiêu thức nguy hiểm đã biến mất chưa
		local hasNearby = hasActiveHazardsNearby(playerPos, 40)
		if not hasNearby or (now - holdStartTime >= MAX_HOLD_TIMEOUT) then
			-- Chiêu thức đã tắt hẳn -> Hoàn tất né, trả lại quyền di chuyển cho AutoFarm / Player
			dodgeState = "IDLE"
			isDodging = false
			activeTargetSpot = nil
			stopMoveDriver()
			enableControls()
			fireCallbacks(false, nil, 0, "IDLE")
		end
		return
	end

	--==========================================================================
	-- TRƯỜNG HỢP 3: AN TOÀN TUYỆT ĐỐI (IDLE)
	--==========================================================================
	if isDodging or activeTargetSpot or dodgeState ~= "IDLE" then
		dodgeControllerV2.Clear()
	end
end

--// Khởi động tracking
local function startTracking()
	if not heartbeatConn then
		heartbeatConn = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

--// Dọn dẹp module
function dodgeControllerV2.Cleanup()
	if heartbeatConn then
		heartbeatConn:Disconnect()
		heartbeatConn = nil
	end
	dodgeControllerV2.Clear()
	table.clear(dodgeCallbacks)
end

--// Public APIs
function dodgeControllerV2.SetEnabled(state: boolean)
	enabled = state and true or false
	if not enabled then
		dodgeControllerV2.Clear()
	end
end

function dodgeControllerV2.IsEnabled(): boolean
	return enabled
end

function dodgeControllerV2.IsDodging(): boolean
	return isDodging
end

function dodgeControllerV2.GetState(): string
	return dodgeState
end

function dodgeControllerV2.GetTargetSpot(): Vector3?
	return activeTargetSpot
end

function dodgeControllerV2.SetSnapDistance(val: number)
	if type(val) == "number" and val >= 0.5 and val <= 5.0 then
		snapDistance = val
	end
end

function dodgeControllerV2.GetSnapDistance(): number
	return snapDistance
end

function dodgeControllerV2.SetEnableSnap(state: boolean)
	enableSnap = state and true or false
end

function dodgeControllerV2.IsEnableSnap(): boolean
	return enableSnap
end

function dodgeControllerV2.SetEnableHolding(state: boolean)
	enableHolding = state and true or false
	if not enableHolding and dodgeState == "HOLDING_SAFE" then
		dodgeState = "IDLE"
		isDodging = false
		activeTargetSpot = nil
		stopMoveDriver()
		enableControls()
		fireCallbacks(false, nil, 0, "IDLE")
	end
end

function dodgeControllerV2.IsEnableHolding(): boolean
	return enableHolding
end

function dodgeControllerV2.OnDodgeStateChanged(callback)
	if type(callback) == "function" then
		table.insert(dodgeCallbacks, callback)
	end
end

-- Phase 3 APIs
function dodgeControllerV2.SetMomentumBlending(state: boolean)
	enableMomentumBlending = state and true or false
end

function dodgeControllerV2.IsMomentumBlending(): boolean
	return enableMomentumBlending
end

function dodgeControllerV2.SetCombatFacing(state: boolean)
	enableCombatFacing = state and true or false
end

function dodgeControllerV2.IsCombatFacing(): boolean
	return enableCombatFacing
end

function dodgeControllerV2.SetArcStrafing(state: boolean)
	enableArcStrafing = state and true or false
end

function dodgeControllerV2.IsArcStrafing(): boolean
	return enableArcStrafing
end

function dodgeControllerV2.SetFlowState(state: boolean)
	enableFlowState = state and true or false
end

function dodgeControllerV2.IsFlowState(): boolean
	return enableFlowState
end

function dodgeControllerV2.SetTurnSharpness(val: number)
	if type(val) == "number" and val >= 2.0 and val <= 40.0 then
		turnSharpness = val
	end
end

function dodgeControllerV2.GetTurnSharpness(): number
	return turnSharpness
end

-- Lắng nghe các sự kiện đổi room, đổi quái để xóa sạch trạng thái né cũ
if shared.OnRoomIndexChanged then
	shared.OnRoomIndexChanged(function()
		dodgeControllerV2.Clear()
	end)
end

if shared.OnEnemyChanged then
	shared.OnEnemyChanged(function()
		if shared.GetEnemyCount and shared.GetEnemyCount() == 0 then
			dodgeControllerV2.Clear()
		end
	end)
end

if shared.OnLobbyChanged then
	shared.OnLobbyChanged(function()
		dodgeControllerV2.Clear()
	end)
end

if shared.OnBossActiveChanged then
	shared.OnBossActiveChanged(function()
		dodgeControllerV2.Clear()
	end)
end

startTracking()

lifecycle.Register(function()
	dodgeControllerV2.Cleanup()
end)

return dodgeControllerV2
