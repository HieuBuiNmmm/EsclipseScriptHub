-- HazardScanner – Dodge Controller (DungeonQuest).
-- Quản lý logic tự động né đòn (Auto-Dodge / Action Execution Layer):
-- Di chuyển bằng Humanoid:Move() về hướng Safe Spot và thực hiện Snap pha cuối khi tới gần (flatDist <= snapDistance)
-- để đảm bảo nhân vật đáp đúng 100% tọa độ an toàn, triệt tiêu sai số quán tính của Roblox physics.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local playerHitbox = require("@routes/DungeonQuest/core/evasion/solver/playerHitbox")
local safeSpot = require("@routes/DungeonQuest/core/evasion/solver/safeSpot")
local contextual = require("@routes/DungeonQuest/core/contextual")

local RunService = services.RunService or game:GetService("RunService")
local Players = game:GetService("Players")
local player = services.player

--// Table
local dodgeController = {}

--// State
local enabled = false
local snapDistance = 2.0 -- studs (khoảng cách pha cuối để snap chuẩn xác vào vị trí)
local isDodging = false
local activeTargetSpot = nil
local heartbeatConnection = nil
local dodgeStateCallbacks = {}

--// Lấy Humanoid và HumanoidRootPart của người chơi
local function getPlayerComponents()
	local lp = player or Players.LocalPlayer
	if not lp then return nil, nil, nil end
	local char = lp.Character
	if not char or not char.Parent then return nil, nil, nil end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then return nil, nil, nil end
	local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
	if not root then return nil, nil, nil end
	return char, hum, root
end

--// ControlModule management (ngăn Roblox ControlModule ghi đè Move(0,0,0) mỗi frame)
local function disableControls()
	if shared.DisableControls then
		shared.DisableControls("Dodge")
	end
end

local function enableControls()
	if shared.EnableControls then
		shared.EnableControls("Dodge")
	end
end

--// Per-frame Move Driver (cấp vector di chuyển liên tục trước bước tính toán vật lý)
local activeMoveVector = Vector3.zero
local moveDriverConnection = nil

local function startMoveDriver()
	if moveDriverConnection then return end
	local stepSignal = RunService.PreSimulation or RunService.RenderStepped or RunService.Heartbeat
	moveDriverConnection = stepSignal:Connect(function()
		if not isDodging then return end
		local _, hum = getPlayerComponents()
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
end

local function setMoveTarget(targetPos)
	local _, _, root = getPlayerComponents()
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
end

--// Dừng di chuyển của Humanoid
local function stopMove(hum, root)
	setMoveZero()
	stopMoveDriver()
	if hum then
		pcall(function() hum:Move(Vector3.zero, false) end)
	end
	enableControls()
end

--// Vòng lặp Heartbeat: Thực hiện Auto-Dodge khi Player gặp nguy hiểm
local function onHeartbeat()
	if not enabled then
		if isDodging or activeTargetSpot then
			activeTargetSpot = nil
			isDodging = false
			local _, hum, root = getPlayerComponents()
			stopMove(hum, root)
			for _, cb in ipairs(dodgeStateCallbacks) do
				pcall(cb, false, nil, 0)
			end
		end
		return
	end

	local char, hum, root = getPlayerComponents()
	if not char or not hum or not root then
		if isDodging or activeTargetSpot then
			activeTargetSpot = nil
			isDodging = false
			for _, cb in ipairs(dodgeStateCallbacks) do
				pcall(cb, false, nil, 0)
			end
		end
		return
	end

	-- Kiểm tra trạng thái bất tử (sau khi hồi sinh / có Shield bảo vệ) -> Không né, cho phép chạy thẳng tới quái
	if shared.IsInvulnerable and shared.IsInvulnerable() then
		if isDodging or activeTargetSpot then
			activeTargetSpot = nil
			isDodging = false
			local _, hum, root = getPlayerComponents()
			stopMove(hum, root)
			for _, cb in ipairs(dodgeStateCallbacks) do
				pcall(cb, false, nil, 0)
			end
		end
		if safeSpot and safeSpot.Clear then
			safeSpot.Clear()
		end
		return
	end

	-- Kiểm tra nếu mục tiêu hiện tại (Boss) được cấu hình tắt né đòn hoặc tắt Hazard Scanner trong Contextual
	if (contextual.IsActiveDodgeDisabled and contextual.IsActiveDodgeDisabled())
		or (contextual.IsActiveHazardScannerEnabled and not contextual.IsActiveHazardScannerEnabled()) then
		if isDodging or activeTargetSpot then
			activeTargetSpot = nil
			isDodging = false
			local _, hum, root = getPlayerComponents()
			stopMove(hum, root)
			for _, cb in ipairs(dodgeStateCallbacks) do
				pcall(cb, false, nil, 0)
			end
		end
		if safeSpot and safeSpot.Clear then
			safeSpot.Clear()
		end
		return
	end

	-- Kiểm tra xem Player có đang trong nguy hiểm hoặc có Safe Spot từ engine không
	local inDanger = playerHitbox.IsPlayerInDanger and playerHitbox.IsPlayerInDanger()
	local targetSpot, distToSpot, isFinding = safeSpot.GetLastSafeSpot()

	-- Nếu có Safe Spot mới được tính ra, đồng bộ làm mục tiêu né chính
	if targetSpot then
		activeTargetSpot = targetSpot
	end

	-- Kiểm tra xem mục tiêu activeTargetSpot có còn hợp lệ và an toàn không
	local isTargetStillSafe = activeTargetSpot and safeSpot.IsPointSafe and safeSpot.IsPointSafe(activeTargetSpot)

	if activeTargetSpot and isTargetStillSafe then
		local playerPos = root.Position
		local flatDelta = Vector3.new(activeTargetSpot.X - playerPos.X, 0, activeTargetSpot.Z - playerPos.Z)
		local flatDist = flatDelta.Magnitude

		-- Pha 1: Snap pha cuối khi cự ly đã vào phạm vi an toàn cực gần
		if flatDist <= snapDistance then
			-- Giữ nguyên độ cao Y và góc xoay hiện tại của nhân vật
			local currentCF = root.CFrame
			local targetWorldPos = Vector3.new(activeTargetSpot.X, playerPos.Y, activeTargetSpot.Z)
			local targetCF = CFrame.new(targetWorldPos) * (currentCF - currentCF.Position)

			char:PivotTo(targetCF)
			stopMove(hum, root)

			local reachedSpot = activeTargetSpot
			activeTargetSpot = nil

			if isDodging then
				isDodging = false
				for _, cb in ipairs(dodgeStateCallbacks) do
					pcall(cb, false, reachedSpot, flatDist)
				end
			end
		else
			-- Pha 2: Di chuyển bằng Move Driver (theo cơ chế PathRecord) về hướng Safe Spot
			if not isDodging then
				isDodging = true
				disableControls()
				startMoveDriver()
				for _, cb in ipairs(dodgeStateCallbacks) do
					pcall(cb, true, activeTargetSpot, flatDist)
				end
			end
			setMoveTarget(activeTargetSpot)
		end
	else
		-- Khi đã an toàn và hoàn tất né / hoặc không còn Safe Spot hợp lệ
		if isDodging or activeTargetSpot then
			activeTargetSpot = nil
			isDodging = false
			stopMove(hum, root)
			for _, cb in ipairs(dodgeStateCallbacks) do
				pcall(cb, false, nil, 0)
			end
		end
	end
end

--// Khởi động tracking
local function startTracking()
	if not heartbeatConnection then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

--// Xóa sạch trạng thái né đòn hiện tại (khi hết quái, đổi room, hoặc an toàn)
function dodgeController.Clear()
	if isDodging or activeTargetSpot then
		activeTargetSpot = nil
		isDodging = false
		local _, hum, root = getPlayerComponents()
		stopMove(hum, root)
		for _, cb in ipairs(dodgeStateCallbacks) do
			pcall(cb, false, nil, 0)
		end
	end
end

--// Dọn dẹp
function dodgeController.Cleanup()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	dodgeController.Clear()
end

--// Public APIs
function dodgeController.SetEnabled(state)
	enabled = state and true or false
	if not enabled then
		local _, hum, root = getPlayerComponents()
		stopMove(hum, root)
		activeTargetSpot = nil
		isDodging = false
	end
end

function dodgeController.IsEnabled()
	return enabled
end

function dodgeController.SetSnapDistance(val)
	if type(val) == "number" and val >= 0.5 then
		snapDistance = val
	end
end

function dodgeController.GetSnapDistance()
	return snapDistance
end

function dodgeController.IsDodging()
	return isDodging
end

function dodgeController.OnDodgeStateChanged(callback)
	if type(callback) == "function" then
		table.insert(dodgeStateCallbacks, callback)
	end
end

-- Lắng nghe room thay đổi hoặc hết quái để lập tức hủy lệnh né cũ
if shared.OnRoomIndexChanged then
	shared.OnRoomIndexChanged(function()
		dodgeController.Clear()
	end)
end

if shared.OnEnemyChanged then
	shared.OnEnemyChanged(function()
		if shared.GetEnemyCount and shared.GetEnemyCount() == 0 then
			dodgeController.Clear()
		end
	end)
end

if shared.OnLobbyChanged then
	shared.OnLobbyChanged(function()
		dodgeController.Clear()
	end)
end

if shared.OnBossActiveChanged then
	shared.OnBossActiveChanged(function()
		dodgeController.Clear()
	end)
end

-- Tự động kích hoạt tracking
startTracking()

-- Dọn dẹp khi shutdown
lifecycle.Register(function()
	dodgeController.Cleanup()
end)

return dodgeController
