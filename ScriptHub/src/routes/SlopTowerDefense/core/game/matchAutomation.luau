-- MatchAutomation: Module tự động hóa các tính năng trong trận (Auto Replay, Auto Speed, Auto Skip)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local GuiService = game:GetService("GuiService")

local zoneGuard = require("./zoneGuard")
local gameStats = require("./gameStats")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")
local logger = require("@routes/SlopTowerDefense/core/system/logger")

local matchAutomation = {}

matchAutomation.AutoReplayEnabled = false
matchAutomation.AutoSpeedEnabled = false
matchAutomation.AutoSkipEnabled = false
matchAutomation.SelectedSpeed = "x2"
matchAutomation.Speeds = { "x1", "x2", "x3", "x4", "x5" }

local isRunning = true
local lastReplayTriggerTime = 0
local lastSpeedCheckTime = 0
local lastSkipTriggerTime = 0
local endScreenConn: RBXScriptConnection? = nil
local waveSkipConn: RBXScriptConnection? = nil

-- Hàm click button an toàn, kết hợp đa phương thức (getconnections, firesignal, VirtualInputManager, GuiService)
local function clickButton(button: GuiButton): boolean
	if not button or not button:IsA("GuiButton") then return false end

	-- Cách 1: getconnections (Kích hoạt trực tiếp handler Luau đã bind vào event)
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

	-- Cách 2: firesignal
	pcall(function()
		local fs = (firesignal or (syn and syn.firesignal) or (getgenv and getgenv().firesignal))
		if fs then
			fs(button.MouseButton1Click)
			fs(button.Activated)
			fs(button.MouseButton1Down)
			fs(button.MouseButton1Up)
		end
	end)

	-- Cách 3: VirtualInputManager click trực tiếp tại tâm nút
	pcall(function()
		local absPos = button.AbsolutePosition
		local absSize = button.AbsoluteSize
		if absSize.X > 0 and absSize.Y > 0 then
			local centerX = absPos.X + absSize.X / 2
			local centerY = absPos.Y + absSize.Y / 2
			VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, true, game, 1)
			task.wait(0.05)
			VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, false, game, 1)
		end
	end)

	-- Cách 4: GuiService.SelectedObject + Enter Key
	pcall(function()
		GuiService.SelectedObject = button
		task.wait(0.05)
		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
		task.wait(0.05)
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
		GuiService.SelectedObject = nil
	end)

	return true
end

-- Tìm EndScreen trong PlayerGui.GameGui
-- Đường dẫn: game:GetService("Players").LocalPlayer.PlayerGui.GameGui.EndScreen
local function getEndScreen(): GuiObject?
	local player = Players.LocalPlayer
	local playerGui = player and player:FindFirstChild("PlayerGui")
	local gameGui = playerGui and playerGui:FindFirstChild("GameGui")
	if not gameGui then return nil end

	local endScreen = gameGui:FindFirstChild("EndScreen")
	if endScreen and endScreen:IsA("GuiObject") then
		return endScreen
	end
	return nil
end

-- Kiểm tra xem EndScreen có đang hiển thị hay không
local function isEndScreenVisible(endScreen: GuiObject?): boolean
	if not endScreen or not endScreen:IsA("GuiObject") then return false end
	return endScreen.Visible == true
end

-- Lấy nút Replay từ EndScreen
-- Đường dẫn: EndScreen.Replay
local function getReplayButton(endScreen: GuiObject): GuiButton?
	if not endScreen then return nil end

	-- 1. Ưu tiên đúng đường dẫn con trực tiếp: EndScreen.Replay
	local replay = endScreen:FindFirstChild("Replay")
	if replay and replay:IsA("GuiButton") then
		return replay
	end

	-- 2. Fallback quét đệ quy nếu Replay được bọc trong một container con
	local deepReplay = endScreen:FindFirstChild("Replay", true)
	if deepReplay and deepReplay:IsA("GuiButton") then
		return deepReplay
	end

	return nil
end

-- Thực thi bấm nút Replay khi EndScreen hiển thị
local function checkAndTriggerReplay(): boolean
	if not matchAutomation.AutoReplayEnabled then return false end

	local endScreen = getEndScreen()
	if not endScreen or not isEndScreenVisible(endScreen) then return false end

	local replayBtn = getReplayButton(endScreen)
	if not replayBtn then return false end

	local now = os.clock()
	if now - lastReplayTriggerTime < 3.0 then return false end -- Debounce 3 giây
	lastReplayTriggerTime = now

	task.spawn(function()
		task.wait(1.8) -- Chờ 1.8s để server kịp ghi nhận DataStore và Webhook sync đủ phần thưởng
		if matchAutomation.AutoReplayEnabled and isEndScreenVisible(endScreen) and replayBtn and replayBtn.Parent then
			clickButton(replayBtn)
			notifier.Notify("Auto Replay", "Automatically clicked Replay!", 2.5)
		end
	end)

	return true
end

-- Lắng nghe sự kiện Visible của EndScreen để kích hoạt tức thì không cần chờ vòng lặp
local function hookEndScreenListener()
	if endScreenConn and endScreenConn.Connected then return end

	local endScreen = getEndScreen()
	if endScreen then
		endScreenConn = endScreen:GetPropertyChangedSignal("Visible"):Connect(function()
			if endScreen.Visible and matchAutomation.AutoReplayEnabled then
				checkAndTriggerReplay()
			end
		end)
	end
end

-- Lấy WaveSkipGui trong PlayerGui.GameGui
-- Đường dẫn: game:GetService("Players").LocalPlayer.PlayerGui.GameGui.WaveSkipGui
local function getWaveSkipGui(): Instance?
	local player = Players.LocalPlayer
	local playerGui = player and player:FindFirstChild("PlayerGui")
	local gameGui = playerGui and playerGui:FindFirstChild("GameGui")
	if not gameGui then return nil end

	local skipGui = gameGui:FindFirstChild("WaveSkipGui")
	if skipGui then
		return skipGui
	end
	return nil
end

-- Kiểm tra xem WaveSkipGui có đang hiển thị hay không (Visible == true)
local function isWaveSkipGuiVisible(skipGui: Instance?): boolean
	if not skipGui then return false end
	if skipGui:IsA("GuiObject") then
		return skipGui.Visible == true
	elseif skipGui:IsA("ScreenGui") then
		return skipGui.Enabled == true
	end
	local ok, vis = pcall(function() return (skipGui :: any).Visible end)
	return ok and vis == true
end

-- Gửi Remote VoteSkip đến server
-- Remote: game:GetService("ReplicatedStorage").Functions.VoteSkip:InvokeServer()
local function sendVoteSkip(): boolean
	local functions = ReplicatedStorage:FindFirstChild("Functions")
	local voteSkip = functions and functions:FindFirstChild("VoteSkip")
	if not voteSkip then
		voteSkip = ReplicatedStorage:FindFirstChild("VoteSkip", true)
	end

	if voteSkip and voteSkip:IsA("RemoteFunction") then
		task.spawn(function()
			pcall(function()
				voteSkip:InvokeServer()
			end)
		end)
		return true
	end
	return false
end

-- Kiểm tra và kích hoạt VoteSkip nếu WaveSkipGui visible
local function checkAndTriggerVoteSkip(): boolean
	if not matchAutomation.AutoSkipEnabled then return false end
	if not zoneGuard.IsInGame() then return false end

	local skipGui = getWaveSkipGui()
	if not skipGui or not isWaveSkipGuiVisible(skipGui) then return false end

	local now = os.clock()
	if now - lastSkipTriggerTime < 1.5 then return false end -- Debounce 1.5s tránh spam server
	lastSkipTriggerTime = now

	logger.Log("[Auto Skip] Phát hiện WaveSkipGui đang hiển thị -> Gửi RemoteFunction VoteSkip:InvokeServer()")
	sendVoteSkip()
	notifier.Notify("Auto Skip", "Sent Vote Skip Wave!", 2)
	return true
end

-- Lắng nghe sự kiện Visible của WaveSkipGui để kích hoạt tức thì không cần chờ vòng lặp
local function hookWaveSkipListener()
	if waveSkipConn and waveSkipConn.Connected then return end

	local skipGui = getWaveSkipGui()
	if skipGui then
		waveSkipConn = skipGui:GetPropertyChangedSignal("Visible"):Connect(function()
			if matchAutomation.AutoSkipEnabled and isWaveSkipGuiVisible(skipGui) then
				checkAndTriggerVoteSkip()
			end
		end)
	end
end

-- Gửi Remote ChangeSpeed đến server
-- Remote: game:GetService("ReplicatedStorage").Functions.ChangeSpeed:InvokeServer(speedNumber)
local function sendChangeSpeed(speedNum: number?): boolean
	local num = speedNum or tonumber(matchAutomation.SelectedSpeed:match("%d+")) or 2
	local functions = ReplicatedStorage:FindFirstChild("Functions")
	local changeSpeed = functions and functions:FindFirstChild("ChangeSpeed")

	if not changeSpeed then
		changeSpeed = ReplicatedStorage:FindFirstChild("ChangeSpeed", true)
	end

	if changeSpeed and changeSpeed:IsA("RemoteFunction") then
		task.spawn(function()
			pcall(function()
				changeSpeed:InvokeServer(num)
			end)
		end)
		return true
	end

	return false
end

-- API công khai để áp dụng speed trực tiếp
function matchAutomation.ApplySpeed(speedNum: number?)
	local num = speedNum or tonumber(matchAutomation.SelectedSpeed:match("%d+")) or 2
	sendChangeSpeed(num)
end

-- Lấy tốc độ trận đấu hiện tại từ GameGui.SpeedUp.Message (định dạng ": x1", ": x2", ...)
function matchAutomation.GetCurrentSpeed(): number
	local player = Players.LocalPlayer
	local playerGui = player and player:FindFirstChild("PlayerGui")
	local gameGui = playerGui and playerGui:FindFirstChild("GameGui")
	if not gameGui then return 1 end

	local speedUp = gameGui:FindFirstChild("SpeedUp")
	local messageLabel = speedUp and speedUp:FindFirstChild("Message")
	if messageLabel and messageLabel:IsA("TextLabel") then
		local num = tonumber(messageLabel.Text:match("%d+"))
		if num and num >= 1 and num <= 5 then
			return num
		end
	end

	-- Fallback nếu SpeedUp nằm sâu hơn
	local deepSpeedUp = gameGui:FindFirstChild("SpeedUp", true)
	if deepSpeedUp then
		local deepMsg = deepSpeedUp:FindFirstChild("Message")
		if deepMsg and deepMsg:IsA("TextLabel") then
			local num = tonumber(deepMsg.Text:match("%d+"))
			if num and num >= 1 and num <= 5 then
				return num
			end
		end
	end

	return 1
end

-- Kiểm tra xem Macro Player có đang kiểm soát Speed của trận đấu không
local function isMacroControllingSpeed(): boolean
	local ok, playerModule = pcall(function()
		return require("@routes/SlopTowerDefense/core/macro/player")
	end)
	if ok and playerModule then
		if playerModule.IsEnabled and playerModule.IsEnabled() then
			if playerModule.IsSpeedSyncEnabled and playerModule.IsSpeedSyncEnabled() then
				return true
			end
		end
	end
	return false
end

-- Quản lý trạng thái để gửi Remote ngay khi Start
local wasMatchActive = false
local lastAppliedWave = 0

local function onGameStatsUpdate(snapshot: gameStats.GameStatsSnapshot)
	if not matchAutomation.AutoSpeedEnabled or isMacroControllingSpeed() then
		wasMatchActive = snapshot.IsMatchActive
		return
	end

	if not zoneGuard.IsInGame() then
		wasMatchActive = false
		lastAppliedWave = 0
		return
	end

	local speedNum = tonumber(matchAutomation.SelectedSpeed:match("%d+")) or 2

	-- 1. Kích hoạt ngay khi Start (IsMatchActive chuyển từ false -> true)
	if snapshot.IsMatchActive and not wasMatchActive then
		wasMatchActive = true
		task.spawn(function()
			task.wait(0.2) -- Chờ nhẹ 0.2s để server nạp xong môi trường trận
			if matchAutomation.AutoSpeedEnabled and not isMacroControllingSpeed() and zoneGuard.IsInGame() then
				sendChangeSpeed(speedNum)
				notifier.Notify("Auto Speed", string.format("Changed game speed to: x%d", speedNum), 2)
			end
		end)
	elseif not snapshot.IsMatchActive then
		wasMatchActive = false
		lastAppliedWave = 0
	end

	-- 2. Gửi lại khi Wave 1 chính thức bắt đầu (đảm bảo không bị nuốt lệnh nếu server khóa speed lúc countdown)
	if snapshot.IsMatchActive and snapshot.Wave == 1 and lastAppliedWave ~= 1 then
		lastAppliedWave = 1
		task.spawn(function()
			task.wait(0.1)
			if matchAutomation.AutoSpeedEnabled and not isMacroControllingSpeed() and zoneGuard.IsInGame() then
				sendChangeSpeed(speedNum)
			end
		end)
	end
end

local unsubGameStats = gameStats.Subscribe(onGameStatsUpdate)

-- Vòng lặp giám sát Match Automation
task.spawn(function()
	while isRunning and lifecycle.IsActive() do
		-- Hook listener khi EndScreen xuất hiện
		hookEndScreenListener()

		-- Hook listener khi WaveSkipGui xuất hiện
		hookWaveSkipListener()

		-- Xử lý Auto Skip nếu WaveSkipGui visible
		if matchAutomation.AutoSkipEnabled then
			checkAndTriggerVoteSkip()
		end

		-- Xử lý Auto Replay (kiểm tra liên tục qua EndScreen.Replay)
		if matchAutomation.AutoReplayEnabled then
			checkAndTriggerReplay()
		end

		-- Xử lý Auto Speed dự phòng nếu sự kiện snapshot bị bỏ lỡ
		if matchAutomation.AutoSpeedEnabled and not isMacroControllingSpeed() and zoneGuard.IsInGame() and gameStats.IsMatchActive() and not wasMatchActive then
			wasMatchActive = true
			local speedNum = tonumber(matchAutomation.SelectedSpeed:match("%d+")) or 2
			sendChangeSpeed(speedNum)
		end

		task.wait(0.25)
	end
end)

-- Public API
function matchAutomation.SetAutoReplay(enabled: boolean)
	matchAutomation.AutoReplayEnabled = enabled
	if enabled then
		lastReplayTriggerTime = 0 -- Reset debounce để click ngay lập tức nếu đang ở EndScreen
		hookEndScreenListener()
		checkAndTriggerReplay()
	end
end

function matchAutomation.SetAutoSpeed(enabled: boolean)
	matchAutomation.AutoSpeedEnabled = enabled
	if enabled and not isMacroControllingSpeed() and zoneGuard.IsInGame() and gameStats.IsMatchActive() then
		local speedNum = tonumber(matchAutomation.SelectedSpeed:match("%d+")) or 2
		sendChangeSpeed(speedNum)
		notifier.Notify("Auto Speed", string.format("Changed game speed to: x%d", speedNum), 2)
	end
end

function matchAutomation.SetAutoSkip(enabled: boolean)
	matchAutomation.AutoSkipEnabled = (enabled == true)
	if matchAutomation.AutoSkipEnabled then
		lastSkipTriggerTime = 0
		hookWaveSkipListener()
		checkAndTriggerVoteSkip()
	end
end

function matchAutomation.IsAutoSkipEnabled(): boolean
	return matchAutomation.AutoSkipEnabled
end

function matchAutomation.SetSpeed(speed: string)
	if table.find(matchAutomation.Speeds, speed) then
		matchAutomation.SelectedSpeed = speed
		if matchAutomation.AutoSpeedEnabled and not isMacroControllingSpeed() and zoneGuard.IsInGame() and gameStats.IsMatchActive() then
			local speedNum = tonumber(speed:match("%d+")) or 2
			sendChangeSpeed(speedNum)
			notifier.Notify("Auto Speed", string.format("Changed game speed to: x%d", speedNum), 2)
		end
	end
end

lifecycle.Register(function()
	isRunning = false
	if endScreenConn then
		endScreenConn:Disconnect()
		endScreenConn = nil
	end
	if waveSkipConn then
		waveSkipConn:Disconnect()
		waveSkipConn = nil
	end
	if unsubGameStats then
		unsubGameStats()
	end
end)

return matchAutomation
