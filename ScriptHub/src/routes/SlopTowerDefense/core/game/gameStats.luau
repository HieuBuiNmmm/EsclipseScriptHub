-- GameStats: Module đọc và chuẩn hóa dữ liệu trận đấu thời gian thực.
-- Hỗ trợ:
--   • Match Elapsed Time (Thời gian tăng dần từ khi Start đến khi End)
--   • Wave Countdown Timer (Đếm ngược của từng wave từ game)
--   • Cash / Gold, Wave, Base HP, Message

local Players = game:GetService("Players")
local zoneGuard = require("./zoneGuard")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")

export type GameStatsSnapshot = {
	Cash: number,
	CashFormatted: string,
	Wave: number,
	MaxWave: number | string,
	WaveFormatted: string,
	-- Thời gian trận đấu tăng dần (Stopwatch: Start -> End)
	ElapsedTime: number,
	ElapsedTimeFormatted: string,
	IsMatchActive: boolean,
	-- Thời gian đếm ngược wave của game (Countdown)
	WaveTimerSeconds: number,
	WaveTimerFormatted: string,
	-- Máu nhà chính
	BaseHp: number,
	BaseMaxHp: number,
	BaseHealthFormatted: string,
	Message: string,
}

local gameStats = {}

local matchStartTime: number? = nil
local matchEndTime: number? = nil
local isMatchActive = false

local currentSnapshot: GameStatsSnapshot = {
	Cash = 0,
	CashFormatted = "$0",
	Wave = 0,
	MaxWave = 0,
	WaveFormatted = "0/0",
	ElapsedTime = 0,
	ElapsedTimeFormatted = "00:00.00",
	IsMatchActive = false,
	WaveTimerSeconds = 0,
	WaveTimerFormatted = "0:00",
	BaseHp = 100,
	BaseMaxHp = 100,
	BaseHealthFormatted = "100/100",
	Message = "",
}

local listeners: { (GameStatsSnapshot) -> () } = {}
local activeConnections: { [string]: RBXScriptConnection } = {}
local isWatcherRunning = false

-- Format số giây thành chuỗi thời gian MM:SS.ss hoặc HH:MM:SS.ss
local function formatElapsedTime(sec: number): string
	sec = math.max(0, sec)
	local m = math.floor(sec / 60)
	local s = sec % 60
	if m >= 60 then
		local h = math.floor(m / 60)
		m = m % 60
		return string.format("%02d:%02d:%05.2f", h, m, s)
	end
	return string.format("%02d:%05.2f", m, s)
end

-- Tìm kiếm an toàn Frame Info trong PlayerGui
local function getInfoFrame(): Frame?
	local player = Players.LocalPlayer
	if not player then return nil end

	local playerGui = player:FindFirstChild("PlayerGui")
	if not playerGui then return nil end

	local gameGui = playerGui:FindFirstChild("GameGui")
	if not gameGui then return nil end

	local info = gameGui:FindFirstChild("Info", true)
	if info and info:IsA("Frame") then
		return info
	end

	return nil
end

-- Tìm các nhãn TextLabel chứa dữ liệu
local function getLabels(): (TextLabel?, TextLabel?, TextLabel?, TextLabel?, TextLabel?)
	local info = getInfoFrame()
	if not info then return nil, nil, nil, nil, nil end

	local stats = info:FindFirstChild("Stats")
	local goldLabel = stats and stats:FindFirstChild("Gold") :: TextLabel?
	local waveLabel = stats and stats:FindFirstChild("Wave") :: TextLabel?
	local timerLabel = stats and stats:FindFirstChild("Timer") :: TextLabel?

	local health = info:FindFirstChild("Health")
	local healthLabel = health and health:FindFirstChild("Title") :: TextLabel?

	local messageLabel = info:FindFirstChild("Message") :: TextLabel?

	return goldLabel, waveLabel, timerLabel, healthLabel, messageLabel
end

-- Parse số tiền từ chuỗi "$755" hoặc "$1,200"
local function parseCash(text: string): (number, string)
	if not text or text == "" then return 0, "$0" end
	local cleanDigits = text:gsub("[^%d]", "")
	local num = tonumber(cleanDigits) or 0
	local formatted = text:match("%$[0-9,]+") or string.format("$%d", num)
	return num, formatted
end

-- Parse Wave từ chuỗi "Wave: 1/∞" hoặc "Wave: 3/20"
local function parseWave(text: string): (number, number | string, string)
	if not text or text == "" then return 0, 0, "0/0" end
	local currentStr, maxStr = text:match("Wave:%s*(%d+)%s*/%s*(.+)")
	if not currentStr then
		currentStr, maxStr = text:match("(%d+)%s*/%s*(.+)")
	end

	local current = tonumber(currentStr) or 0
	local max: number | string = maxStr or "?"
	if maxStr and maxStr:find("∞") then
		max = "∞"
	else
		max = tonumber(maxStr) or (maxStr or "?")
	end

	local formatted = string.format("%d/%s", current, tostring(max))
	return current, max, formatted
end

-- Parse Wave Timer từ chuỗi "0:10" hoặc "1:25"
local function parseWaveTimer(text: string): (number, string)
	if not text or text == "" then return 0, "0:00" end
	local minStr, secStr = text:match("(%d+):(%d+)")
	if minStr and secStr then
		local totalSec = (tonumber(minStr) or 0) * 60 + (tonumber(secStr) or 0)
		return totalSec, text
	end
	return 0, text
end

-- Parse Base HP từ chuỗi "100/100"
local function parseBaseHp(text: string): (number, number, string)
	if not text or text == "" then return 100, 100, "100/100" end
	local curStr, maxStr = text:match("(%d+)%s*/%s*(%d+)")
	local cur = tonumber(curStr) or 100
	local max = tonumber(maxStr) or 100
	return cur, max, string.format("%d/%d", cur, max)
end

-- Tìm kiếm giao diện kết thúc trận (GameGui.EndScreen)
local function getEndScreen(): GuiObject?
	local player = Players.LocalPlayer
	local playerGui = player and player:FindFirstChild("PlayerGui")
	local gameGui = playerGui and playerGui:FindFirstChild("GameGui")
	if not gameGui then return nil end

	local endScreen = gameGui:FindFirstChild("EndScreen", true)
	if endScreen and endScreen:IsA("GuiObject") then
		return endScreen
	end
	return nil
end

-- Kiểm tra xem giao diện GameGui.EndScreen có đang hiển thị (Visible = true) không
local function isGameOverUiPresent(): boolean
	local endScreen = getEndScreen()
	return endScreen ~= nil and endScreen.Visible == true
end

-- Cập nhật đồng hồ trận đấu tăng dần (Stopwatch)
local function updateMatchTimer()
	if not zoneGuard.IsInGame() then
		-- Ở Lobby -> Reset
		matchStartTime = nil
		matchEndTime = nil
		isMatchActive = false
		currentSnapshot.ElapsedTime = 0
		currentSnapshot.ElapsedTimeFormatted = "00:00.00"
		currentSnapshot.IsMatchActive = false
		return
	end

	-- Nhận diện BẮT ĐẦU trận:
	local _, _, _, _, messageLabel = getLabels()
	local infoFrame = getInfoFrame()
	local isInfoVisible = infoFrame and infoFrame.Visible ~= false
	local isMessageVisible = messageLabel and messageLabel.Visible ~= false and messageLabel.TextTransparency < 1
	local msgLower = currentSnapshot.Message:lower()
	local count = tonumber(msgLower:match("starting in[^%d]*(%d+)"))

	-- Chỉ coi là đếm ngược bắt đầu khi count > 0 (ví dụ 5, 4, 3, 2, 1)
	-- Tránh chuỗi tĩnh mặc định "Game starting in...0" tồn tại từ lúc chưa bắt đầu trận
	local isStartingCountdown = isInfoVisible and isMessageVisible and (count ~= nil and count > 0)

	-- Trường hợp trận đấu đã diễn ra (Wave >= 1 và hết dòng thông báo đếm ngược, hoặc Wave >= 2)
	local isMatchInProgress = (currentSnapshot.Wave >= 1 and currentSnapshot.Message == "") or currentSnapshot.Wave >= 2

	-- Nếu có ván mới bắt đầu lại trong cùng server: reset trạng thái kết thúc cũ
	if isStartingCountdown and matchEndTime then
		matchEndTime = nil
		matchStartTime = nil
		isMatchActive = false
	end

	if not isMatchActive and not matchEndTime then
		if isStartingCountdown or isMatchInProgress then
			matchStartTime = os.clock()
			isMatchActive = true
			currentSnapshot.IsMatchActive = true
		end
	end

	-- Nhận diện KẾT THÚC trận: Máu nhà <= 0 hoặc có màn hình Game Over
	if isMatchActive then
		if (currentSnapshot.BaseHp <= 0 and currentSnapshot.Wave >= 1) or isGameOverUiPresent() then
			matchEndTime = os.clock()
			isMatchActive = false
			currentSnapshot.IsMatchActive = false
		end
	end

	-- Tính số giây trôi qua (số thập phân làm tròn 2 chữ số)
	local elapsed = 0
	if matchStartTime then
		if isMatchActive then
			elapsed = os.clock() - matchStartTime
		elseif matchEndTime then
			elapsed = matchEndTime - matchStartTime
		end
	end

	currentSnapshot.ElapsedTime = math.round(elapsed * 100) / 100
	currentSnapshot.ElapsedTimeFormatted = formatElapsedTime(elapsed)
	currentSnapshot.IsMatchActive = isMatchActive
end

-- Cập nhật snapshot hiện tại từ các TextLabel
local function updateSnapshot(): boolean
	local goldLabel, waveLabel, timerLabel, healthLabel, messageLabel = getLabels()
	if not goldLabel and not waveLabel and not timerLabel and not healthLabel then
		return false
	end

	local changed = false

	if goldLabel then
		local num, fmt = parseCash(goldLabel.Text)
		if currentSnapshot.Cash ~= num or currentSnapshot.CashFormatted ~= fmt then
			currentSnapshot.Cash = num
			currentSnapshot.CashFormatted = fmt
			changed = true
		end
	end

	if waveLabel then
		local cur, max, fmt = parseWave(waveLabel.Text)
		if currentSnapshot.Wave ~= cur or currentSnapshot.WaveFormatted ~= fmt then
			currentSnapshot.Wave = cur
			currentSnapshot.MaxWave = max
			currentSnapshot.WaveFormatted = fmt
			changed = true
		end
	end

	if timerLabel then
		local sec, fmt = parseWaveTimer(timerLabel.Text)
		if currentSnapshot.WaveTimerSeconds ~= sec or currentSnapshot.WaveTimerFormatted ~= fmt then
			currentSnapshot.WaveTimerSeconds = sec
			currentSnapshot.WaveTimerFormatted = fmt
			changed = true
		end
	end

	if healthLabel then
		local cur, max, fmt = parseBaseHp(healthLabel.Text)
		if currentSnapshot.BaseHp ~= cur or currentSnapshot.BaseHealthFormatted ~= fmt then
			currentSnapshot.BaseHp = cur
			currentSnapshot.BaseMaxHp = max
			currentSnapshot.BaseHealthFormatted = fmt
			changed = true
		end
	end

	if messageLabel then
		local msg = messageLabel.Text or ""
		if currentSnapshot.Message ~= msg then
			currentSnapshot.Message = msg
			changed = true
		end
	end

	local oldFormatted = currentSnapshot.ElapsedTimeFormatted
	updateMatchTimer()
	if oldFormatted ~= currentSnapshot.ElapsedTimeFormatted then
		changed = true
	end

	if changed then
		for _, listener in ipairs(listeners) do
			task.spawn(listener, currentSnapshot)
		end
	end

	return true
end

-- Ngắt các kết nối lắng nghe
local function cleanupConnections()
	for key, conn in pairs(activeConnections) do
		pcall(function() conn:Disconnect() end)
		activeConnections[key] = nil
	end
end

-- Gắn lắng nghe sự kiện thay đổi thuộc tính Text
local function bindListeners()
	cleanupConnections()

	local goldLabel, waveLabel, timerLabel, healthLabel, messageLabel = getLabels()
	if goldLabel then
		activeConnections["Gold"] = goldLabel:GetPropertyChangedSignal("Text"):Connect(function()
			updateSnapshot()
		end)
	end
	if waveLabel then
		activeConnections["Wave"] = waveLabel:GetPropertyChangedSignal("Text"):Connect(function()
			updateSnapshot()
		end)
	end
	if timerLabel then
		activeConnections["Timer"] = timerLabel:GetPropertyChangedSignal("Text"):Connect(function()
			updateSnapshot()
		end)
	end
	if healthLabel then
		activeConnections["Health"] = healthLabel:GetPropertyChangedSignal("Text"):Connect(function()
			updateSnapshot()
		end)
	end
	local infoFrame = getInfoFrame()
	if infoFrame then
		activeConnections["InfoVisible"] = infoFrame:GetPropertyChangedSignal("Visible"):Connect(function()
			updateSnapshot()
		end)
	end

	if messageLabel then
		activeConnections["Message"] = messageLabel:GetPropertyChangedSignal("Text"):Connect(function()
			updateSnapshot()
		end)
		activeConnections["MessageVisible"] = messageLabel:GetPropertyChangedSignal("Visible"):Connect(function()
			updateSnapshot()
		end)
	end

	local endScreen = getEndScreen()
	if endScreen then
		activeConnections["EndScreenVisible"] = endScreen:GetPropertyChangedSignal("Visible"):Connect(function()
			updateSnapshot()
		end)
	end

	updateSnapshot()
end

-- Vòng lặp giám sát: tự động đếm nhịp mỗi giây cho Elapsed Time và kiểm tra kết nối lại
local function startWatcher()
	if isWatcherRunning then return end
	isWatcherRunning = true

	task.spawn(function()
		while isWatcherRunning and lifecycle.IsActive() do
			if zoneGuard.IsInGame() then
				local goldLabel = getLabels()
				if goldLabel and not activeConnections["Gold"] then
					bindListeners()
				else
					updateSnapshot()
				end
			else
				cleanupConnections()
				if matchStartTime then
					matchStartTime = nil
					matchEndTime = nil
					isMatchActive = false
					updateSnapshot()
				end
			end
			task.wait(isMatchActive and 0.1 or 0.5)
		end
		cleanupConnections()
		isWatcherRunning = false
	end)
end

-- Khởi động giám sát ngay
startWatcher()

--// Public API
function gameStats.GetCash(): number
	updateSnapshot()
	return currentSnapshot.Cash
end

function gameStats.GetCashFormatted(): string
	updateSnapshot()
	return currentSnapshot.CashFormatted
end

function gameStats.GetWave(): (number, number | string)
	updateSnapshot()
	return currentSnapshot.Wave, currentSnapshot.MaxWave
end

function gameStats.GetWaveFormatted(): string
	updateSnapshot()
	return currentSnapshot.WaveFormatted
end

-- Thời gian tăng dần từ lúc bắt đầu trận (Stopwatch)
function gameStats.GetElapsedTime(): number
	updateSnapshot()
	return currentSnapshot.ElapsedTime
end

function gameStats.GetElapsedTimeFormatted(): string
	updateSnapshot()
	return currentSnapshot.ElapsedTimeFormatted
end

function gameStats.IsMatchActive(): boolean
	return isMatchActive
end

-- Thời gian đếm ngược của wave hiện tại (từ UI game)
function gameStats.GetWaveTimer(): number
	updateSnapshot()
	return currentSnapshot.WaveTimerSeconds
end

function gameStats.GetWaveTimerFormatted(): string
	updateSnapshot()
	return currentSnapshot.WaveTimerFormatted
end

function gameStats.GetBaseHealth(): (number, number)
	updateSnapshot()
	return currentSnapshot.BaseHp, currentSnapshot.BaseMaxHp
end

function gameStats.GetBaseHealthFormatted(): string
	updateSnapshot()
	return currentSnapshot.BaseHealthFormatted
end

function gameStats.GetMessage(): string
	updateSnapshot()
	return currentSnapshot.Message
end

-- Đánh dấu bắt đầu trận thủ công hoặc từ script khác
function gameStats.StartMatch()
	matchStartTime = os.clock()
	matchEndTime = nil
	isMatchActive = true
	updateSnapshot()
end

-- Đánh dấu kết thúc trận thủ công hoặc khi nhận diện xong
function gameStats.EndMatch()
	matchEndTime = os.clock()
	isMatchActive = false
	updateSnapshot()
end

function gameStats.GetAll(): GameStatsSnapshot
	updateSnapshot()
	return {
		Cash = currentSnapshot.Cash,
		CashFormatted = currentSnapshot.CashFormatted,
		Wave = currentSnapshot.Wave,
		MaxWave = currentSnapshot.MaxWave,
		WaveFormatted = currentSnapshot.WaveFormatted,
		ElapsedTime = currentSnapshot.ElapsedTime,
		ElapsedTimeFormatted = currentSnapshot.ElapsedTimeFormatted,
		IsMatchActive = currentSnapshot.IsMatchActive,
		WaveTimerSeconds = currentSnapshot.WaveTimerSeconds,
		WaveTimerFormatted = currentSnapshot.WaveTimerFormatted,
		BaseHp = currentSnapshot.BaseHp,
		BaseMaxHp = currentSnapshot.BaseMaxHp,
		BaseHealthFormatted = currentSnapshot.BaseHealthFormatted,
		Message = currentSnapshot.Message,
	}
end

-- Đăng ký nhận thông báo mỗi khi chỉ số thay đổi
function gameStats.Subscribe(callback: (GameStatsSnapshot) -> ()): () -> ()
	table.insert(listeners, callback)
	task.spawn(callback, gameStats.GetAll())

	return function()
		local idx = table.find(listeners, callback)
		if idx then
			table.remove(listeners, idx)
		end
	end
end

-- Dọn dẹp khi reload
lifecycle.Register(function()
	isWatcherRunning = false
	cleanupConnections()
	table.clear(listeners)
end)

return gameStats
