-- HazardScanner – Player Visualizer & Danger Detection (DungeonQuest).
-- Quản lý visual 2D hình tròn (filled) ghim dưới chân Player biểu thị hitbox 2D trên sàn
-- và liên tục kiểm tra xem Player có đang đứng trong vùng nguy hiểm (Ground Zone hoặc Trajectory Corridor) hay không.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local geometry = require("@routes/DungeonQuest/core/hazardScanner/geometry")
local trajectory = require("@routes/DungeonQuest/core/hazardScanner/trajectory")

local RunService = services.RunService or game:GetService("RunService")
local player = services.player

--// Table
local playerVisual = {}

--// State
local visualEnabled = true
local isPlayerInDanger = false
local currentThreat = nil
local currentThreatType = nil
local statusCallbacks = {}
local heartbeatConnection = nil
local playerRadius = 1.8

--// Visual Handle
local playerAdornment = nil
local playerCharConnection = nil

--// Visual Colors & Styling
local COLOR_SAFE = Color3.fromRGB(0, 255, 170) -- Xanh ngọc / Cyan khi an toàn
local COLOR_DANGER = Color3.fromRGB(255, 35, 35) -- Đỏ tươi khi trong vùng nguy hiểm
local TRANSPARENCY_SAFE = 0.45
local TRANSPARENCY_DANGER = 0.20
local GROUND_THICKNESS = 0.20

local Players = game:GetService("Players")

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

	local ad = Instance.new("CylinderHandleAdornment")
	ad.Name = "Player_2D_HitboxVisual"
	ad.Adornee = root
	ad.Radius = playerRadius
	ad.Height = GROUND_THICKNESS
	ad.Color3 = isPlayerInDanger and COLOR_DANGER or COLOR_SAFE
	ad.Transparency = isPlayerInDanger and TRANSPARENCY_DANGER or TRANSPARENCY_SAFE
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

--// Vòng lặp Heartbeat: Cập nhật vị trí ghim sàn và đánh giá Danger Status
local function onHeartbeat()
	local root = getPlayerRoot()
	if not root or not root.Parent then
		-- Nhân vật đã chết hoặc đang chờ hồi sinh: ẩn visual và reset trạng thái nguy hiểm
		if playerAdornment and playerAdornment.Parent then
			playerAdornment.Visible = false
		end
		if isPlayerInDanger then
			isPlayerInDanger = false
			currentThreat = nil
			currentThreatType = nil
			for _, cb in ipairs(statusCallbacks) do
				pcall(cb, false, nil, nil)
			end
		end
		return
	end

	-- 1. Ghim Visual phẳng nằm ngang trên sàn X-Z
	local ad = ensureAdornment(root)
	if ad and ad.Parent then
		ad.Visible = visualEnabled
		ad.Radius = playerRadius

		local targetY = getPlayerGroundY(root)
		local desiredWorldCFrame = CFrame.new(Vector3.new(root.Position.X, targetY, root.Position.Z))
			* CFrame.Angles(math.rad(90), 0, 0)
		ad.CFrame = root.CFrame:ToObjectSpace(desiredWorldCFrame)
	end

	-- 2. Đánh giá trạng thái nguy hiểm (In Danger Check: Giao thoa Vòng tròn Player với Danger Zones)
	local playerPos = Vector3.new(root.Position.X, 0, root.Position.Z)

	-- Kiểm tra Ground Danger Zones với bán kính vòng tròn Player
	local inGround, hazardInfo, hitPart = geometry.IsPointInAnyHazard(playerPos, nil, playerRadius)
	local inTraj, trajHazard = false, nil

	-- Nếu chưa dính Ground Zone, kiểm tra tiếp Trajectory Corridor với bán kính vòng tròn Player
	if not inGround and trajectory.IsPointInAnyTrajectory then
		inTraj, trajHazard = trajectory.IsPointInAnyTrajectory(playerPos, playerRadius)
	end

	local nowInDanger = (inGround or inTraj)
	local nowThreat = hazardInfo or trajHazard
	local nowThreatType = inGround and "Ground Zone" or (inTraj and "Trajectory Corridor" or nil)

	-- Kiểm tra nếu trạng thái thay đổi
	if nowInDanger ~= isPlayerInDanger or nowThreat ~= currentThreat then
		isPlayerInDanger = nowInDanger
		currentThreat = nowThreat
		currentThreatType = nowThreatType

		updateVisualState(nowInDanger)

		for _, cb in ipairs(statusCallbacks) do
			pcall(cb, nowInDanger, nowThreat, nowThreatType)
		end
	end
end

--// Khởi tạo vòng lặp
local function startTracking()
	if not heartbeatConnection then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

--// Dọn dẹp visual
function playerVisual.Cleanup()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	if playerAdornment then
		pcall(function() playerAdornment:Destroy() end)
		playerAdornment = nil
	end
	isPlayerInDanger = false
	currentThreat = nil
	currentThreatType = nil
end

--// Kiểm tra xem player có đang trong vùng nguy hiểm không
function playerVisual.IsPlayerInDanger()
	return isPlayerInDanger, currentThreat, currentThreatType
end

--// Lấy đối tượng threat hiện tại
function playerVisual.GetCurrentThreat()
	return currentThreat, currentThreatType
end

--// Đăng ký callback khi trạng thái nguy hiểm thay đổi
function playerVisual.OnDangerStatusChanged(callback)
	if type(callback) == "function" then
		table.insert(statusCallbacks, callback)
	end
end

--// Bật / tắt hiển thị visual 2D dưới chân player
function playerVisual.SetVisualEnabled(state)
	visualEnabled = state and true or false
	if playerAdornment then
		playerAdornment.Visible = visualEnabled
	end
end

function playerVisual.IsVisualEnabled()
	return visualEnabled
end

--// Cài đặt bán kính đĩa tròn 2D Hitbox của player
function playerVisual.SetRadius(val)
	if type(val) == "number" and val >= 0.1 then
		playerRadius = val
		if playerAdornment and playerAdornment.Parent then
			playerAdornment.Radius = playerRadius
		end
	end
end

function playerVisual.GetRadius()
	return playerRadius
end

--// Tự động dọn dẹp và kết nối khi hồi sinh nhân vật mới
local function hookLocalPlayer()
	local lp = player or Players.LocalPlayer
	if not lp then return end

	local function onCharAdded(newChar)
		if playerAdornment then
			pcall(function() playerAdornment:Destroy() end)
			playerAdornment = nil
		end
		-- Lắng nghe sự kiện chết để ẩn ngay lập tức
		task.spawn(function()
			local hum = newChar:WaitForChild("Humanoid", 3)
			if hum then
				hum.Died:Connect(function()
					if playerAdornment then
						playerAdornment.Visible = false
					end
				end)
			end
		end)
	end

	playerCharConnection = lp.CharacterAdded:Connect(onCharAdded)
	if lp.Character then
		onCharAdded(lp.Character)
	end
end

hookLocalPlayer()

-- Tự động kích hoạt tracking
startTracking()

-- Dọn dẹp khi shutdown
lifecycle.Register(function()
	if playerCharConnection then
		playerCharConnection:Disconnect()
		playerCharConnection = nil
	end
	playerVisual.Cleanup()
end)

return playerVisual
