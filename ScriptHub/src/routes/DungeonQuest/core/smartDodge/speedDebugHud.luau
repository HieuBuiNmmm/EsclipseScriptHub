--==============================================================--
-- Smart Dodge – Speed Debug HUD
-- Hiển thị trực quan tốc độ hiện tại (WalkSpeed) của Player
-- trực tiếp trên màn hình game (Screen HUD) kèm đổi màu theo trạng thái:
--   - Màu TRẮNG: Tốc độ thường (Normal)
--   - Màu ĐỎ:    Đang ép WalkSpeed = Panic (Panic Sprint)
--   - Màu XANH LÁ: Đang hưởng tốc độ từ Skill chính thức của game
--==============================================================--

local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")

local RunService = services.RunService
local UserInputService = services.UserInputService
local player = services.player

local speedDebugHud = {}

local enabled = false
local screenGui = nil
local mainFrame = nil
local speedLabel = nil
local uiStroke = nil
local updateConn = nil

local COLOR_WHITE = Color3.fromRGB(255, 255, 255)
local COLOR_RED = Color3.fromRGB(255, 65, 65)
local COLOR_GREEN = Color3.fromRGB(50, 255, 120)

local STROKE_NORMAL = Color3.fromRGB(60, 60, 70)
local STROKE_RED = Color3.fromRGB(220, 50, 50)
local STROKE_GREEN = Color3.fromRGB(40, 200, 90)

-- Lấy parent an toàn nhất cho Gui
local function getGuiParent()
	local success, result = pcall(function()
		if typeof(gethui) == "function" then
			local h = gethui()
			if h then return h end
		end
		local coreGui = game:GetService("CoreGui")
		if coreGui then return coreGui end
		return nil
	end)
	if success and result then return result end

	local p = player or services.player
	return p and p:FindFirstChild("PlayerGui")
end

-- Tạo giao diện HUD kéo thả được
local function createHud()
	if screenGui and screenGui.Parent then return end

	local parent = getGuiParent()
	if not parent then return end

	-- Dọn dẹp bản cũ nếu có
	local old = parent:FindFirstChild("DQ_SpeedDebugHud")
	if old then
		pcall(function() old:Destroy() end)
	end

	screenGui = Instance.new("ScreenGui")
	screenGui.Name = "DQ_SpeedDebugHud"
	screenGui.ResetOnSpawn = false
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	-- Frame chính (Kéo thả được)
	mainFrame = Instance.new("Frame")
	mainFrame.Name = "SpeedBadge"
	mainFrame.Size = UDim2.new(0, 168, 0, 34)
	mainFrame.Position = UDim2.new(0.5, -84, 0, 50)
	mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
	mainFrame.BackgroundTransparency = 0.25
	mainFrame.BorderSizePixel = 0
	mainFrame.Active = true
	mainFrame.Parent = screenGui

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = mainFrame

	uiStroke = Instance.new("UIStroke")
	uiStroke.Thickness = 1.4
	uiStroke.Color = STROKE_NORMAL
	uiStroke.Transparency = 0.2
	uiStroke.Parent = mainFrame

	speedLabel = Instance.new("TextLabel")
	speedLabel.Name = "SpeedText"
	speedLabel.Size = UDim2.new(1, -10, 1, 0)
	speedLabel.Position = UDim2.new(0, 5, 0, 0)
	speedLabel.BackgroundTransparency = 1
	speedLabel.Font = Enum.Font.GothamBold
	speedLabel.TextSize = 13
	speedLabel.TextColor3 = COLOR_WHITE
	speedLabel.Text = "SPEED: 16.0"
	speedLabel.TextXAlignment = Enum.TextXAlignment.Center
	speedLabel.TextYAlignment = Enum.TextYAlignment.Center
	speedLabel.Parent = mainFrame

	-- Cơ chế kéo thả linh hoạt (Draggable)
	local dragging = false
	local dragStart = nil
	local startPos = nil

	mainFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = mainFrame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	mainFrame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragging and dragStart and startPos then
				local delta = input.Position - dragStart
				mainFrame.Position = UDim2.new(
					startPos.X.Scale,
					startPos.X.Offset + delta.X,
					startPos.Y.Scale,
					startPos.Y.Offset + delta.Y
				)
			end
		end
	end)

	screenGui.Parent = parent
end

local function destroyHud()
	if updateConn then
		updateConn:Disconnect()
		updateConn = nil
	end
	if screenGui and screenGui.Parent then
		pcall(function() screenGui:Destroy() end)
		screenGui = nil
		mainFrame = nil
		speedLabel = nil
		uiStroke = nil
	end
end

-- Vòng lặp cập nhật thông số và màu sắc theo thời gian thực
local function startUpdating()
	if updateConn then return end

	local lastUpdate = 0
	updateConn = RunService.RenderStepped:Connect(function()
		local now = os.clock()
		if (now - lastUpdate) < 0.04 then return end
		lastUpdate = now

		if not screenGui or not screenGui.Parent or not speedLabel or not speedLabel.Parent then
			createHud()
			return
		end

		local char = player and player.Character
		local humanoid = char and char:FindFirstChild("Humanoid")
		local rootPart = char and char:FindFirstChild("HumanoidRootPart")

		if not humanoid or humanoid.Health <= 0 then
			speedLabel.Text = "SPEED: 💀 DEAD"
			speedLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
			if uiStroke then uiStroke.Color = STROKE_NORMAL end
			return
		end

		local curWalkSpeed = humanoid.WalkSpeed or 0
		local vel = rootPart and rootPart.AssemblyLinearVelocity
		local horizVel = vel and Vector3.new(vel.X, 0, vel.Z).Magnitude or 0

		local isPanic = shared.IsPanicSpeedActive and shared.IsPanicSpeedActive()
		local isSkillBuff = (not isPanic) and (curWalkSpeed >= 23.5 or horizVel >= 23.0)

		if isPanic then
			-- 1. Đang ép WalkSpeed = Panic (MÀU ĐỎ)
			speedLabel.TextColor3 = COLOR_RED
			speedLabel.Text = ("SPD: %.1f [PANIC 💨]"):format(curWalkSpeed)
			if uiStroke then uiStroke.Color = STROKE_RED end
		elseif isSkillBuff then
			-- 2. Đang là speed từ chiêu thức của game (MÀU XANH LÁ)
			speedLabel.TextColor3 = COLOR_GREEN
			speedLabel.Text = ("SPD: %.1f [SKILL ⚡]"):format(curWalkSpeed)
			if uiStroke then uiStroke.Color = STROKE_GREEN end
		else
			-- 3. Speed thường (MÀU TRẮNG)
			speedLabel.TextColor3 = COLOR_WHITE
			speedLabel.Text = ("SPD: %.1f"):format(curWalkSpeed)
			if uiStroke then uiStroke.Color = STROKE_NORMAL end
		end
	end)
end

function speedDebugHud.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		createHud()
		startUpdating()
	else
		destroyHud()
	end
end

function speedDebugHud.IsEnabled()
	return enabled
end

-- Tự động dọn dẹp khi Hub tắt
lifecycle.Register(function()
	speedDebugHud.SetEnabled(false)
end)

-- Khởi động mặc định
speedDebugHud.SetEnabled(true)

return speedDebugHud
