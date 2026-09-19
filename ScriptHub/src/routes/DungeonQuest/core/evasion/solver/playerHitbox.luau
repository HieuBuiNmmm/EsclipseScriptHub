-- HazardScanner – Player Hitbox & Danger Evaluation (DungeonQuest).
-- Quản lý logic đánh giá va chạm của Player (Logic thuần túy, không chứa Adornment visual).
-- Liên tục kiểm tra xem Player có đang đứng trong vùng nguy hiểm (Ground Zone hoặc Trajectory Corridor) hay không.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local geometry = require("@routes/DungeonQuest/core/evasion/spatial/geometry")
local trajectory = require("@routes/DungeonQuest/core/evasion/spatial/trajectory")
local contextual = require("@routes/DungeonQuest/core/contextual")

local RunService = services.RunService or game:GetService("RunService")
local Players = game:GetService("Players")
local player = services.player

--// Table
local playerHitbox = {}

--// State
local isPlayerInDanger = false
local currentThreat = nil
local currentThreatType = nil
local statusCallbacks = {}
local heartbeatConnection = nil
local playerRadius = 1.8

--// Lấy HumanoidRootPart của người chơi (trả về nil nếu player đã chết)
local function getPlayerRoot()
	local lp = player or Players.LocalPlayer
	if not lp then return nil end
	local char = lp.Character
	if not char or not char.Parent then return nil end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then
		return nil -- Player đã chết
	end
	return char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
end

--// Đánh giá trạng thái nguy hiểm của Player
local function evaluateDanger()
	local root = getPlayerRoot()
	if not root or not root.Parent then
		if isPlayerInDanger then
			isPlayerInDanger = false
			currentThreat = nil
			currentThreatType = nil
			for _, cb in ipairs(statusCallbacks) do
				pcall(cb, false, nil, nil)
			end
		end
		return false, nil, nil
	end

	-- Nếu mục tiêu hiện tại bị tắt Hazard Scanner trong Contextual: coi như an toàn
	if contextual.IsActiveHazardScannerEnabled and not contextual.IsActiveHazardScannerEnabled() then
		if isPlayerInDanger then
			isPlayerInDanger = false
			currentThreat = nil
			currentThreatType = nil
			for _, cb in ipairs(statusCallbacks) do
				pcall(cb, false, nil, nil)
			end
		end
		return false, nil, nil
	end

	local playerPos = Vector3.new(root.Position.X, 0, root.Position.Z)

	-- Kiểm tra Ground Danger Zones với bán kính vòng tròn Player
	local inGround, hazardInfo, _ = geometry.IsPointInAnyHazard(playerPos, nil, playerRadius)
	local inTraj, trajHazard = false, nil

	if not inGround and trajectory.IsPointInAnyTrajectory then
		inTraj, trajHazard = trajectory.IsPointInAnyTrajectory(playerPos, playerRadius)
	end

	local nowInDanger = inGround or inTraj
	local threatInfo = inGround and hazardInfo or (inTraj and trajHazard or nil)
	local threatType = inGround and "GroundZone" or (inTraj and "Trajectory" or nil)

	if nowInDanger ~= isPlayerInDanger or threatInfo ~= currentThreat then
		isPlayerInDanger = nowInDanger
		currentThreat = threatInfo
		currentThreatType = threatType

		for _, cb in ipairs(statusCallbacks) do
			pcall(cb, nowInDanger, threatInfo, threatType)
		end
	end

	return nowInDanger, threatInfo, threatType
end

--// Vòng lặp Heartbeat: Cập nhật đánh giá Danger Status
local function onHeartbeat()
	evaluateDanger()
end

local function startTracking()
	if not heartbeatConnection then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

--// Public API
function playerHitbox.IsPlayerInDanger()
	return evaluateDanger()
end

function playerHitbox.GetCurrentThreat()
	return currentThreat, currentThreatType
end

function playerHitbox.GetRadius()
	return playerRadius
end

function playerHitbox.SetRadius(val)
	if type(val) == "number" and val >= 0.5 then
		playerRadius = val
	end
end

function playerHitbox.OnDangerStatusChanged(callback)
	if type(callback) == "function" then
		table.insert(statusCallbacks, callback)
	end
	return callback
end

function playerHitbox.GetPlayerRoot()
	return getPlayerRoot()
end

-- Khởi động tracking
startTracking()

-- Dọn dẹp khi shutdown
lifecycle.Register(function()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	table.clear(statusCallbacks)
end)

return playerHitbox
