--!nocheck
-- HazardScannerV2 - On-Screen Danger & Safety HUD Dot Indicator
-- Hiển thị trực tiếp lên màn hình một Custom HUD Widget với Dot Xanh (SAFE) / Đỏ (IN DANGER).
-- Hỗ trợ Kéo & Thả (Draggable) đến bất kỳ vị trí nào trên màn hình.

--// Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local services = require("@routes/DungeonQuest/core/services")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")

--// Table
local hudIndicator = {}

--// State
local enabled = true
local currentInDanger = false
local currentThreatName: string? = nil

--// GUI Instances
local screenGui: ScreenGui? = nil
local mainFrame: Frame? = nil
local statusDot: Frame? = nil
local dotGlow: Frame? = nil
local statusText: TextLabel? = nil
local strokeBorder: UIStroke? = nil
local dotStroke: UIStroke? = nil
local pulseTween: Tween? = nil

--// Colors
local COLOR_SAFE = Color3.fromRGB(0, 255, 170)     -- Xanh ngọc Neon khi an toàn
local COLOR_DANGER = Color3.fromRGB(255, 45, 45)   -- Đỏ tươi Neon khi gặp nguy hiểm
local BG_COLOR = Color3.fromRGB(13, 17, 23)        -- Nền kính tối Cyberpunk

--// Lấy container GUI an toàn trên mọi Executor
local function getGuiContainer(): Instance?
	if typeof(gethui) == "function" then
		local success, hui = pcall(gethui)
		if success and hui then return hui end
	end
	local success, coreGui = pcall(function() return game:GetService("CoreGui") end)
	if success and coreGui then return coreGui end
	local lp = (services and services.player) or Players.LocalPlayer
	if lp then
		return lp:FindFirstChild("PlayerGui") or lp:WaitForChild("PlayerGui", 5)
	end
	return nil
end

--// Hỗ trợ Kéo & Thả (Draggable) mượt mà cho chuột và màn hình cảm ứng
local function makeDraggable(frame: GuiObject)
	local dragging = false
	local dragInput = nil
	local dragStart = nil
	local startPos = nil

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position

			local endedConn
			endedConn = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
					if endedConn then
						endedConn:Disconnect()
						endedConn = nil
					end
				end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging and startPos and dragStart then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)
end

--// Khởi tạo các thành phần ScreenGui
local function ensureGui()
	if screenGui and screenGui.Parent and mainFrame and mainFrame.Parent then
		return
	end

	local container = getGuiContainer()
	if not container then return end

	-- Dọn dẹp GUI cũ nếu còn sót
	local oldGui = container:FindFirstChild("HazardScannerV2_HUD")
	if oldGui then
		pcall(function() oldGui:Destroy() end)
	end

	screenGui = Instance.new("ScreenGui")
	screenGui.Name = "HazardScannerV2_HUD"
	screenGui.ResetOnSpawn = false
	screenGui.DisplayOrder = 1000
	screenGui.Enabled = enabled
	screenGui.Parent = container

	mainFrame = Instance.new("Frame")
	mainFrame.Name = "MainHUD"
	mainFrame.Size = UDim2.fromOffset(108, 30)
	mainFrame.Position = UDim2.new(0.5, -54, 0, 24)
	mainFrame.BackgroundColor3 = BG_COLOR
	mainFrame.BackgroundTransparency = 0.22
	mainFrame.BorderSizePixel = 0
	mainFrame.Active = true
	mainFrame.Parent = screenGui

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 15)
	corner.Parent = mainFrame

	strokeBorder = Instance.new("UIStroke")
	strokeBorder.Name = "BorderStroke"
	strokeBorder.Color = COLOR_SAFE
	strokeBorder.Thickness = 1.4
	strokeBorder.Transparency = 0.30
	strokeBorder.Parent = mainFrame

	-- Glow hiệu ứng xung quanh Dot
	dotGlow = Instance.new("Frame")
	dotGlow.Name = "DotGlow"
	dotGlow.Size = UDim2.fromOffset(20, 20)
	dotGlow.Position = UDim2.new(0, 5, 0.5, -10)
	dotGlow.BackgroundColor3 = COLOR_SAFE
	dotGlow.BackgroundTransparency = 0.75
	dotGlow.BorderSizePixel = 0
	dotGlow.Parent = mainFrame

	local glowCorner = Instance.new("UICorner")
	glowCorner.CornerRadius = UDim.new(1, 0)
	glowCorner.Parent = dotGlow

	-- Dot tròn chính (Xanh = Safe, Đỏ = Danger)
	statusDot = Instance.new("Frame")
	statusDot.Name = "StatusDot"
	statusDot.Size = UDim2.fromOffset(12, 12)
	statusDot.Position = UDim2.new(0, 9, 0.5, -6)
	statusDot.BackgroundColor3 = COLOR_SAFE
	statusDot.BorderSizePixel = 0
	statusDot.Parent = mainFrame

	local dotCorner = Instance.new("UICorner")
	dotCorner.CornerRadius = UDim.new(1, 0)
	dotCorner.Parent = statusDot

	dotStroke = Instance.new("UIStroke")
	dotStroke.Name = "DotStroke"
	dotStroke.Color = COLOR_SAFE
	dotStroke.Thickness = 1.5
	dotStroke.Transparency = 0.15
	dotStroke.Parent = statusDot

	-- Nhãn Text trạng thái
	statusText = Instance.new("TextLabel")
	statusText.Name = "StatusText"
	statusText.Size = UDim2.new(1, -26, 1, 0)
	statusText.Position = UDim2.new(0, 26, 0, 0)
	statusText.BackgroundTransparency = 1
	statusText.Font = Enum.Font.GothamBold
	statusText.TextSize = 11
	statusText.TextColor3 = COLOR_SAFE
	statusText.TextXAlignment = Enum.TextXAlignment.Center
	statusText.TextYAlignment = Enum.TextYAlignment.Center
	statusText.RichText = true
	statusText.Text = "<b>SAFE</b>"
	statusText.Parent = mainFrame

	makeDraggable(mainFrame)
end

--// Bắt đầu / dừng animation nhấp nháy Pulse khi nguy hiểm
local function setPulseAnimation(isPulsing: boolean)
	if pulseTween then
		pulseTween:Cancel()
		pulseTween = nil
	end

	if not dotGlow then return end

	if isPulsing then
		dotGlow.BackgroundTransparency = 0.35
		dotGlow.Size = UDim2.fromOffset(18, 18)
		dotGlow.Position = UDim2.new(0, 6, 0.5, -9)

		local tweenInfo = TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
		pulseTween = TweenService:Create(dotGlow, tweenInfo, {
			BackgroundTransparency = 0.85,
			Size = UDim2.fromOffset(24, 24),
			Position = UDim2.new(0, 3, 0.5, -12),
		})
		pulseTween:Play()
	else
		dotGlow.BackgroundTransparency = 0.75
		dotGlow.Size = UDim2.fromOffset(20, 20)
		dotGlow.Position = UDim2.new(0, 5, 0.5, -10)
	end
end

--// Cập nhật trạng thái hiển thị của HUD
function hudIndicator.UpdateStatus(inDanger: boolean, threatName: string?)
	currentInDanger = inDanger and true or false
	currentThreatName = threatName

	if not enabled then
		if screenGui then screenGui.Enabled = false end
		return
	end

	ensureGui()
	if not screenGui or not mainFrame or not statusDot or not statusText or not strokeBorder or not dotStroke or not dotGlow then
		return
	end

	screenGui.Enabled = true

	local targetColor = currentInDanger and COLOR_DANGER or COLOR_SAFE

	statusDot.BackgroundColor3 = targetColor
	dotStroke.Color = targetColor
	strokeBorder.Color = targetColor
	dotGlow.BackgroundColor3 = targetColor

	if currentInDanger then
		local displayName = threatName and (#threatName > 0) and threatName or "DANGER"
		if #displayName > 18 then
			displayName = string.sub(displayName, 1, 16) .. ".."
		end

		if threatName and #threatName > 0 then
			mainFrame.Size = UDim2.fromOffset(math.clamp(100 + (#displayName * 6), 116, 220), 30)
			statusText.Text = string.format("<b>DANGER</b> <font color='rgb(255,200,80)'>| %s</font>", displayName)
		else
			mainFrame.Size = UDim2.fromOffset(116, 30)
			statusText.Text = "<b>IN DANGER</b>"
		end
		statusText.TextColor3 = COLOR_DANGER
		setPulseAnimation(true)
	else
		mainFrame.Size = UDim2.fromOffset(100, 30)
		statusText.Text = "<b>SAFE</b>"
		statusText.TextColor3 = COLOR_SAFE
		setPulseAnimation(false)
	end
end

--// Bật / tắt HUD Indicator
function hudIndicator.SetEnabled(state: boolean)
	enabled = state and true or false
	if screenGui then
		screenGui.Enabled = enabled
	end
	if enabled then
		ensureGui()
		hudIndicator.UpdateStatus(currentInDanger, currentThreatName)
	else
		setPulseAnimation(false)
	end
end

function hudIndicator.IsEnabled(): boolean
	return enabled
end

--// Dọn dẹp hoàn toàn khi tắt script
function hudIndicator.Clear()
	setPulseAnimation(false)
	if screenGui then
		pcall(function() screenGui:Destroy() end)
		screenGui = nil
	end
	mainFrame = nil
	statusDot = nil
	dotGlow = nil
	statusText = nil
	strokeBorder = nil
	dotStroke = nil
end

lifecycle.Register(function()
	hudIndicator.Clear()
end)

return hudIndicator
