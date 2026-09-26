--// HUD: Giao diện nổi siêu nhỏ gọn (Mini Floating HUD) điều khiển ghi chép Flight Log
--// Không chiếm diện tích màn hình, kéo thả được, tương thích mọi Executor.

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local logger = require("@routes/DungeonQuest_Recorder/logger")

local hud = {}
local screenGui = nil
local isMinimized = false

-- Lấy container GUI an toàn trên mọi Executor
local function getGuiContainer()
	if typeof(gethui) == "function" then
		local ok, hui = pcall(gethui)
		if ok and hui then return hui end
	end
	local ok, coreGui = pcall(function() return game:GetService("CoreGui") end)
	if ok and coreGui then
		local testOk = pcall(function()
			local test = Instance.new("Folder")
			test.Parent = coreGui
			test:Destroy()
		end)
		if testOk then return coreGui end
	end
	local lp = Players.LocalPlayer
	if lp then
		return lp:FindFirstChild("PlayerGui") or lp:WaitForChild("PlayerGui", 5)
	end
	return nil
end

function hud.Create()
	if screenGui then
		screenGui:Destroy()
		screenGui = nil
	end

	local container = getGuiContainer()
	if not container then
		return warn("[FlightRecorder HUD] Không tìm thấy GUI Container phù hợp.")
	end

	screenGui = Instance.new("ScreenGui")
	screenGui.Name = "Esclipse_FlightRecorder_HUD"
	screenGui.ResetOnSpawn = false
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	pcall(function()
		screenGui.Parent = container
	end)

	-- Main Container Frame
	local mainFrame = Instance.new("Frame")
	mainFrame.Name = "MainCard"
	mainFrame.Size = UDim2.fromOffset(260, 220)
	mainFrame.Position = UDim2.new(0, 20, 0, 100)
	mainFrame.BackgroundColor3 = Color3.fromRGB(12, 18, 28)
	mainFrame.BorderSizePixel = 0
	mainFrame.Active = true
	mainFrame.ClipsDescendants = true
	mainFrame.Parent = screenGui

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 10)
	corner.Parent = mainFrame

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(30, 48, 80)
	stroke.Thickness = 1.5
	stroke.Parent = mainFrame

	-- Dragging Logic
	local dragging, dragInput, dragStart, startPos
	local function update(input)
		local delta = input.Position - dragStart
		mainFrame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end

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
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)

	-- Title Bar
	local titleBar = Instance.new("Frame")
	titleBar.Size = UDim2.new(1, 0, 0, 32)
	titleBar.BackgroundColor3 = Color3.fromRGB(18, 26, 40)
	titleBar.BorderSizePixel = 0
	titleBar.Parent = mainFrame

	local titleCorner = Instance.new("UICorner")
	titleCorner.CornerRadius = UDim.new(0, 10)
	titleCorner.Parent = titleBar

	local titleLabel = Instance.new("TextLabel")
	titleLabel.Size = UDim2.new(1, -60, 1, 0)
	titleLabel.Position = UDim2.new(0, 12, 0, 0)
	titleLabel.BackgroundTransparency = 1
	titleLabel.Text = "⚡ Flight Recorder"
	titleLabel.TextColor3 = Color3.fromRGB(0, 240, 255)
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.TextSize = 13
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.Parent = titleBar

	-- Minimize Button
	local minBtn = Instance.new("TextButton")
	minBtn.Size = UDim2.fromOffset(24, 24)
	minBtn.Position = UDim2.new(1, -52, 0, 4)
	minBtn.BackgroundColor3 = Color3.fromRGB(28, 40, 60)
	minBtn.Text = "—"
	minBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
	minBtn.Font = Enum.Font.GothamBold
	minBtn.TextSize = 12
	minBtn.Parent = titleBar

	local minBtnCorner = Instance.new("UICorner")
	minBtnCorner.CornerRadius = UDim.new(0, 6)
	minBtnCorner.Parent = minBtn

	-- Close Button
	local closeBtn = Instance.new("TextButton")
	closeBtn.Size = UDim2.fromOffset(24, 24)
	closeBtn.Position = UDim2.new(1, -26, 0, 4)
	closeBtn.BackgroundColor3 = Color3.fromRGB(50, 20, 25)
	closeBtn.Text = "✕"
	closeBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
	closeBtn.Font = Enum.Font.GothamBold
	closeBtn.TextSize = 11
	closeBtn.Parent = titleBar

	local closeBtnCorner = Instance.new("UICorner")
	closeBtnCorner.CornerRadius = UDim.new(0, 6)
	closeBtnCorner.Parent = closeBtn

	-- Content Container
	local content = Instance.new("Frame")
	content.Name = "Content"
	content.Size = UDim2.new(1, -20, 1, -42)
	content.Position = UDim2.new(0, 10, 0, 36)
	content.BackgroundTransparency = 1
	content.Parent = mainFrame

	-- Status Label
	local statusLabel = Instance.new("TextLabel")
	statusLabel.Size = UDim2.new(1, 0, 0, 20)
	statusLabel.BackgroundTransparency = 1
	statusLabel.Text = "Status: ⚪ IDLE"
	statusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
	statusLabel.Font = Enum.Font.GothamMedium
	statusLabel.TextSize = 12
	statusLabel.TextXAlignment = Enum.TextXAlignment.Left
	statusLabel.RichText = true
	statusLabel.Parent = content

	-- Frame Stats Label
	local framesLabel = Instance.new("TextLabel")
	framesLabel.Size = UDim2.new(1, 0, 0, 18)
	framesLabel.Position = UDim2.new(0, 0, 0, 22)
	framesLabel.BackgroundTransparency = 1
	framesLabel.Text = "Recorded: 0 frames (0.0s)"
	framesLabel.TextColor3 = Color3.fromRGB(140, 150, 170)
	framesLabel.Font = Enum.Font.Gotham
	framesLabel.TextSize = 11
	framesLabel.TextXAlignment = Enum.TextXAlignment.Left
	framesLabel.Parent = content

	-- Environment Info Label
	local envLabel = Instance.new("TextLabel")
	envLabel.Size = UDim2.new(1, 0, 0, 18)
	envLabel.Position = UDim2.new(0, 0, 0, 40)
	envLabel.BackgroundTransparency = 1
	envLabel.Text = "Hazards: 0 | Radar: Disconnected"
	envLabel.TextColor3 = Color3.fromRGB(140, 150, 170)
	envLabel.Font = Enum.Font.Gotham
	envLabel.TextSize = 11
	envLabel.TextXAlignment = Enum.TextXAlignment.Left
	envLabel.Parent = content

	-- Buttons Container
	local btnRec = Instance.new("TextButton")
	btnRec.Size = UDim2.new(1, 0, 0, 28)
	btnRec.Position = UDim2.new(0, 0, 0, 64)
	btnRec.BackgroundColor3 = Color3.fromRGB(0, 160, 90)
	btnRec.Text = "🔴 START RECORDING"
	btnRec.TextColor3 = Color3.fromRGB(255, 255, 255)
	btnRec.Font = Enum.Font.GothamBold
	btnRec.TextSize = 12
	btnRec.Parent = content

	local btnRecCorner = Instance.new("UICorner")
	btnRecCorner.CornerRadius = UDim.new(0, 6)
	btnRecCorner.Parent = btnRec

	local btnSave = Instance.new("TextButton")
	btnSave.Size = UDim2.new(0.48, 0, 0, 26)
	btnSave.Position = UDim2.new(0, 0, 0, 98)
	btnSave.BackgroundColor3 = Color3.fromRGB(30, 60, 100)
	btnSave.Text = "💾 Save JSON"
	btnSave.TextColor3 = Color3.fromRGB(200, 230, 255)
	btnSave.Font = Enum.Font.GothamMedium
	btnSave.TextSize = 11
	btnSave.Parent = content

	local btnSaveCorner = Instance.new("UICorner")
	btnSaveCorner.CornerRadius = UDim.new(0, 6)
	btnSaveCorner.Parent = btnSave

	local btnClear = Instance.new("TextButton")
	btnClear.Size = UDim2.new(0.48, 0, 0, 26)
	btnClear.Position = UDim2.new(0.52, 0, 0, 98)
	btnClear.BackgroundColor3 = Color3.fromRGB(50, 30, 40)
	btnClear.Text = "🗑 Clear Buffer"
	btnClear.TextColor3 = Color3.fromRGB(255, 180, 180)
	btnClear.Font = Enum.Font.GothamMedium
	btnClear.TextSize = 11
	btnClear.Parent = content

	local btnClearCorner = Instance.new("UICorner")
	btnClearCorner.CornerRadius = UDim.new(0, 6)
	btnClearCorner.Parent = btnClear

	local btnWs = Instance.new("TextButton")
	btnWs.Size = UDim2.new(1, 0, 0, 24)
	btnWs.Position = UDim2.new(0, 0, 0, 130)
	btnWs.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
	btnWs.Text = "📡 Live Radar: ws://localhost:8765"
	btnWs.TextColor3 = Color3.fromRGB(150, 180, 220)
	btnWs.Font = Enum.Font.Gotham
	btnWs.TextSize = 10
	btnWs.Parent = content

	local btnWsCorner = Instance.new("UICorner")
	btnWsCorner.CornerRadius = UDim.new(0, 6)
	btnWsCorner.Parent = btnWs

	local logPathLabel = Instance.new("TextLabel")
	logPathLabel.Size = UDim2.new(1, 0, 0, 16)
	logPathLabel.Position = UDim2.new(0, 0, 0, 158)
	logPathLabel.BackgroundTransparency = 1
	logPathLabel.Text = "Ready to record."
	logPathLabel.TextColor3 = Color3.fromRGB(100, 220, 150)
	logPathLabel.Font = Enum.Font.Gotham
	logPathLabel.TextSize = 10
	logPathLabel.TextTruncate = Enum.TextTruncate.AtEnd
	logPathLabel.Parent = content

	-- Update UI State Function
	local function updateDisplay(stats)
		pcall(function()
			stats = stats or logger.GetStats()
			if stats.isRecording then
				statusLabel.Text = "Status: <font color='rgb(255,50,80)'><b>🔴 RECORDING...</b></font>"
				btnRec.Text = "⏹ STOP RECORDING"
				btnRec.BackgroundColor3 = Color3.fromRGB(180, 30, 40)
			else
				statusLabel.Text = "Status: <font color='rgb(160,160,160)'>⚪ IDLE</font>"
				btnRec.Text = "🔴 START RECORDING"
				btnRec.BackgroundColor3 = Color3.fromRGB(0, 160, 90)
			end

			framesLabel.Text = string.format("Recorded: %d frames (%.1fs)", stats.frameCount, stats.duration)
			envLabel.Text = string.format("Hazards: %d | Radar: %s", stats.activeHazards, stats.wsStatus)

			if stats.lastSavedFilePath then
				logPathLabel.Text = "Saved: " .. stats.lastSavedFilePath
			end
		end)
	end

	logger.OnStatsChanged(function(stats)
		updateDisplay(stats)
	end)

	-- Event Handlers
	btnRec.MouseButton1Click:Connect(function()
		local stats = logger.GetStats()
		if stats.isRecording then
			logger.Stop()
		else
			logger.Start()
		end
	end)

	btnSave.MouseButton1Click:Connect(function()
		local success, result = logger.SaveToFile()
		if success then
			logPathLabel.Text = "Saved: " .. tostring(result)
			logPathLabel.TextColor3 = Color3.fromRGB(0, 255, 140)
		else
			logPathLabel.Text = "Err: " .. tostring(result)
			logPathLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
		end
	end)

	btnClear.MouseButton1Click:Connect(function()
		logger.Clear()
		logPathLabel.Text = "Buffer cleared."
		logPathLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
	end)

	btnWs.MouseButton1Click:Connect(function()
		local newState = not logger.IsWsStreamEnabled()
		logger.ToggleWsStream(newState)
		btnWs.Text = newState and "📡 Live Radar: STREAMING" or "📡 Live Radar: OFF"
	end)

	minBtn.MouseButton1Click:Connect(function()
		isMinimized = not isMinimized
		if isMinimized then
			content.Visible = false
			mainFrame.Size = UDim2.fromOffset(260, 32)
			minBtn.Text = "□"
		else
			content.Visible = true
			mainFrame.Size = UDim2.fromOffset(260, 220)
			minBtn.Text = "—"
		end
	end)

	closeBtn.MouseButton1Click:Connect(function()
		hud.Destroy()
	end)

	updateDisplay()
end

function hud.Destroy()
	if screenGui then
		screenGui:Destroy()
		screenGui = nil
	end
end

return hud
