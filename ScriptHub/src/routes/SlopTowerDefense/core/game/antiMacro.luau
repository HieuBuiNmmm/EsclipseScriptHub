-- AntiMacro: Tự động phát hiện và giải quyết popup kiểm tra Anti-Macro / AFK Check trong game.
local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")
local GuiService = game:GetService("GuiService")

local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")
local logger = require("@routes/SlopTowerDefense/core/system/logger")

local antiMacro = {
	Enabled = false,
}

local childAddedConn: RBXScriptConnection? = nil
local charConn: RBXScriptConnection? = nil
local loopThread: thread? = nil
local lastSolvedTime = 0
local isSolving = false

-- Kiểm tra xem ScreenGui / Frame có phải là hộp thoại Anti Macro không
local function isAntiMacroGui(gui: Instance): boolean
	if not gui then return false end
	local name = gui.Name
	if name == "AntiMacroCheck" or name == "ACX" or string.find(string.lower(name), "antimacro") or string.find(string.lower(name), "afkcheck") then
		return true
	end
	return false
end

-- Tìm nút bấm xác nhận trong GUI
local function findClickableButton(gui: Instance): GuiButton?
	-- 1. Ưu tiên cấu trúc chuẩn trong game: gui.Frame.TextButton
	local frame = gui:FindFirstChild("Frame")
	if frame then
		local directBtn = frame:FindFirstChild("TextButton")
		if directBtn and directBtn:IsA("GuiButton") and directBtn.Visible and directBtn.AbsolutePosition.X > 0 and directBtn.AbsolutePosition.Y > 0 then
			return directBtn
		end
		local anyFrameBtn = frame:FindFirstChildWhichIsA("GuiButton", true)
		if anyFrameBtn and anyFrameBtn.Visible and anyFrameBtn.AbsolutePosition.X > 0 and anyFrameBtn.AbsolutePosition.Y > 0 and anyFrameBtn.AbsoluteSize.X > 0 and anyFrameBtn.AbsoluteSize.Y > 0 then
			return anyFrameBtn
		end
	end

	-- 2. Tìm theo tên gợi ý phổ biến
	for _, desc in ipairs(gui:GetDescendants()) do
		if desc:IsA("GuiButton") and desc.Visible and desc.AbsolutePosition.X > 0 and desc.AbsolutePosition.Y > 0 and desc.AbsoluteSize.X > 0 and desc.AbsoluteSize.Y > 0 then
			local lowerName = string.lower(desc.Name)
			if lowerName == "textbutton" or string.find(lowerName, "confirm") or string.find(lowerName, "verify") or string.find(lowerName, "click") then
				return desc
			end
		end
	end

	-- 3. Fallback: GuiButton đầu tiên hiển thị trên màn hình
	for _, desc in ipairs(gui:GetDescendants()) do
		if desc:IsA("GuiButton") and desc.Visible and desc.AbsolutePosition.X > 0 and desc.AbsolutePosition.Y > 0 and desc.AbsoluteSize.X > 0 and desc.AbsoluteSize.Y > 0 then
			return desc
		end
	end

	return nil
end

-- Hàm click button an toàn với 4 tầng fallback
local function clickButton(button: GuiButton): boolean
	if not button or not button:IsA("GuiButton") then return false end

	-- Cách 1: firesignal (nhanh và chuẩn nhất cho executor)
	pcall(function()
		local fs = (firesignal or (syn and syn.firesignal) or (getgenv and getgenv().firesignal))
		if fs then
			fs(button.MouseButton1Click)
			fs(button.Activated)
			fs(button.MouseButton1Up)
		end
	end)

	-- Cách 2: getconnections (kích hoạt callback trực tiếp)
	pcall(function()
		local gc = (getconnections or (syn and syn.getconnections) or (getgenv and getgenv().getconnections))
		if gc then
			for _, conn in ipairs(gc(button.MouseButton1Click)) do
				if conn.Fire then conn:Fire() elseif conn.fire then conn:fire() end
			end
			for _, conn in ipairs(gc(button.Activated)) do
				if conn.Fire then conn:Fire() elseif conn.fire then conn:fire() end
			end
			for _, conn in ipairs(gc(button.MouseButton1Up)) do
				if conn.Fire then conn:Fire() elseif conn.fire then conn:fire() end
			end
		end
	end)

	-- Cách 3: VirtualInputManager click tại tâm nút (bù trừ GuiInset)
	pcall(function()
		local absPos = button.AbsolutePosition
		local absSize = button.AbsoluteSize
		if absSize.X > 0 and absSize.Y > 0 then
			local inset = GuiService:GetGuiInset()
			local clickX = absPos.X + (absSize.X / 2)
			local clickY = absPos.Y + (absSize.Y / 2) + inset.Y

			VirtualInputManager:SendMouseMoveEvent(clickX, clickY, game)
			task.wait(0.05)
			VirtualInputManager:SendMouseButtonEvent(clickX, clickY, 0, true, game, 1)
			task.wait(0.05)
			VirtualInputManager:SendMouseButtonEvent(clickX, clickY, 0, false, game, 1)
		end
	end)

	-- Cách 4: GuiService SelectedObject + phím Enter
	pcall(function()
		GuiService.SelectedObject = button
		task.wait(0.05)
		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
		task.wait(0.05)
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
		task.wait(0.05)
		GuiService.SelectedObject = nil
	end)

	return true
end

-- Xử lý bấm nút giải Anti-Macro
local function trySolveGui(gui: Instance): boolean
	if not antiMacro.Enabled then return false end
	if isSolving then return false end
	if (os.clock() - lastSolvedTime) < 1.5 then return false end

	local button = findClickableButton(gui)
	if not button then return false end

	isSolving = true

	task.spawn(function()
		task.wait(0.1) -- Độ trễ tự nhiên
		if not antiMacro.Enabled then
			isSolving = false
			return
		end

		local clicked = clickButton(button)
		if clicked then
			lastSolvedTime = os.clock()
			logger.Log(string.format("[SlopTD - AntiMacro] Đã tự động vượt qua %s (Nút: %s) thành công!", gui.Name, button.Name))
			notifier.Notify("Anti Macro", "Đã tự động xác nhận Anti-Macro thành công!", 3)
		end

		task.wait(0.5)
		isSolving = false
	end)

	return true
end

-- Lấy PlayerGui an toàn
local function getPlayerGui(): PlayerGui?
	local player = Players.LocalPlayer
	if not player then return nil end
	return player:FindFirstChild("PlayerGui")
end

-- Quét toàn bộ PlayerGui hiện tại
local function scanAndSolve()
	if not antiMacro.Enabled or isSolving then return end
	local playerGui = getPlayerGui()
	if not playerGui then return end

	for _, child in ipairs(playerGui:GetChildren()) do
		if isAntiMacroGui(child) then
			trySolveGui(child)
			break
		end
	end
end

-- Lắng nghe sự kiện thêm UI mới
local function hookPlayerGui()
	if childAddedConn then
		childAddedConn:Disconnect()
		childAddedConn = nil
	end

	local playerGui = getPlayerGui()
	if not playerGui then return end

	childAddedConn = playerGui.ChildAdded:Connect(function(child)
		if not antiMacro.Enabled then return end
		if isAntiMacroGui(child) then
			task.delay(0.1, function()
				if not antiMacro.Enabled then return end
				trySolveGui(child)
			end)
		end
	end)
end

-- Bắt đầu hệ thống giám sát Anti-Macro
local function startMonitoring()
	hookPlayerGui()

	local player = Players.LocalPlayer
	if player and not charConn then
		charConn = player.CharacterAdded:Connect(function()
			task.wait(0.5)
			if antiMacro.Enabled then
				hookPlayerGui()
				scanAndSolve()
			end
		end)
	end

	if not loopThread then
		loopThread = task.spawn(function()
			while antiMacro.Enabled and lifecycle.IsActive() do
				scanAndSolve()
				task.wait(0.3)
			end
			loopThread = nil
		end)
	end
end

-- Dừng hệ thống giám sát
local function stopMonitoring()
	if childAddedConn then
		childAddedConn:Disconnect()
		childAddedConn = nil
	end
	if charConn then
		charConn:Disconnect()
		charConn = nil
	end
	loopThread = nil
end

function antiMacro.SetEnabled(state: boolean)
	if antiMacro.Enabled == state then return end
	antiMacro.Enabled = (state == true)

	if antiMacro.Enabled then
		startMonitoring()
		scanAndSolve()
		logger.Log("[SlopTD - AntiMacro] Auto Anti Macro đã được bật.")
	else
		stopMonitoring()
		logger.Log("[SlopTD - AntiMacro] Auto Anti Macro đã tắt.")
	end
end

function antiMacro.IsEnabled(): boolean
	return antiMacro.Enabled
end

-- Tự động dọn dẹp khi reload script
lifecycle.Register(function()
	antiMacro.Enabled = false
	stopMonitoring()
end)

return antiMacro
