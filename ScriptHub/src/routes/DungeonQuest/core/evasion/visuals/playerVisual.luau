-- HazardScanner – Player Visualizer (DungeonQuest).
-- Quản lý visual 2D hình tròn (filled) ghim dưới chân Player biểu thị hitbox 2D trên sàn.
-- Nhận dữ liệu trạng thái nguy hiểm từ solver/playerHitbox để đổi màu (Cyan khi an toàn, Đỏ khi nguy hiểm).

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local playerHitbox = require("@routes/DungeonQuest/core/evasion/solver/playerHitbox")

local RunService = services.RunService or game:GetService("RunService")
local player = services.player

--// Table
local playerVisual = {}

--// State
local visualEnabled = true
local playerAdornment = nil
local heartbeatConnection = nil

--// Visual Colors & Styling
local COLOR_SAFE = Color3.fromRGB(0, 255, 170) -- Xanh ngọc / Cyan khi an toàn
local COLOR_DANGER = Color3.fromRGB(255, 35, 35) -- Đỏ tươi khi trong vùng nguy hiểm
local TRANSPARENCY_SAFE = 0.45
local TRANSPARENCY_DANGER = 0.20
local GROUND_THICKNESS = 0.20

local Players = game:GetService("Players")

--// Lấy HumanoidRootPart của người chơi
local function getPlayerRoot()
	return playerHitbox.GetPlayerRoot()
end

--// Lấy độ cao mặt sàn dưới chân người chơi
local function getPlayerGroundY(root)
	if not root then return 0 end
	return root.Position.Y - 2.5
end

--// Tạo hoặc lấy adornment đĩa tròn 2D dưới chân người chơi
local function ensureAdornment(root)
	if playerAdornment then
		-- Nếu adornment không thuộc về root hiện tại hoặc đã bị gỡ khỏi Workspace
		if playerAdornment.Parent ~= root or not playerAdornment:IsDescendantOf(workspace) then
			pcall(function() playerAdornment:Destroy() end)
			playerAdornment = nil
		else
			if playerAdornment.Adornee ~= root then
				playerAdornment.Adornee = root
			end
			return playerAdornment
		end
	end

	if not root or not root.Parent then return nil end

	local inDanger = playerHitbox.IsPlayerInDanger()
	local rad = playerHitbox.GetRadius()

	local ad = Instance.new("CylinderHandleAdornment")
	ad.Name = "Player_2D_HitboxVisual"
	ad.Adornee = root
	ad.Radius = rad
	ad.Height = GROUND_THICKNESS
	ad.Color3 = inDanger and COLOR_DANGER or COLOR_SAFE
	ad.Transparency = inDanger and TRANSPARENCY_DANGER or TRANSPARENCY_SAFE
	ad.ZIndex = 5
	ad.AlwaysOnTop = false
	ad.Visible = visualEnabled
	ad.Parent = root

	playerAdornment = ad
	return ad
end

--// Cập nhật trạng thái màu sắc đĩa tròn
local function updateVisualState(inDanger)
	if not playerAdornment or not playerAdornment.Parent then return end
	playerAdornment.Color3 = inDanger and COLOR_DANGER or COLOR_SAFE
	playerAdornment.Transparency = inDanger and TRANSPARENCY_DANGER or TRANSPARENCY_SAFE
end

--// Vòng lặp Heartbeat: Cập nhật vị trí ghim sàn
local function onHeartbeat()
	local root = getPlayerRoot()
	if not root or not root.Parent then
		if playerAdornment and playerAdornment.Parent then
			playerAdornment.Visible = false
		end
		return
	end

	local ad = ensureAdornment(root)
	if ad and ad.Parent then
		ad.Visible = visualEnabled
		ad.Radius = playerHitbox.GetRadius()

		local targetY = getPlayerGroundY(root)
		local desiredWorldCFrame = CFrame.new(Vector3.new(root.Position.X, targetY, root.Position.Z))
			* CFrame.Angles(math.rad(90), 0, 0)
		ad.CFrame = root.CFrame:ToObjectSpace(desiredWorldCFrame)
	end
end

--// Lắng nghe sự kiện đổi trạng thái nguy hiểm từ playerHitbox
playerHitbox.OnDangerStatusChanged(function(inDanger)
	updateVisualState(inDanger)
end)

local function startTracking()
	if not heartbeatConnection then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

--// Public API
function playerVisual.SetVisualEnabled(state)
	visualEnabled = state and true or false
	if playerAdornment and playerAdornment.Parent then
		playerAdornment.Visible = visualEnabled
	end
end

function playerVisual.IsVisualEnabled()
	return visualEnabled
end

-- Backward compatibility delegation to playerHitbox
playerVisual.IsPlayerInDanger = playerHitbox.IsPlayerInDanger
playerVisual.GetCurrentThreat = playerHitbox.GetCurrentThreat
playerVisual.GetRadius = playerHitbox.GetRadius
playerVisual.SetRadius = playerHitbox.SetRadius
playerVisual.OnDangerStatusChanged = playerHitbox.OnDangerStatusChanged

-- Khởi động tracking
startTracking()

-- Dọn dẹp khi shutdown
lifecycle.Register(function()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	if playerAdornment then
		pcall(function() playerAdornment:Destroy() end)
		playerAdornment = nil
	end
end)

return playerVisual
