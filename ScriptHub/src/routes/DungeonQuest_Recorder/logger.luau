--// Logger: Flight Data Recorder (Ghi chép hộp đen) & WebSocket Streamer
--// Quản lý buffer dữ liệu, xuất file JSON, và truyền dữ liệu thời gian thực lên Web Radar.

local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

local sensor = require("@routes/DungeonQuest_Recorder/sensor")
local observer = require("@routes/DungeonQuest_Recorder/observer")

local logger = {}

--// State
local isRecording = false
local recordingStartTime = 0
local frameIndex = 0
local buffer = {} -- Mảng chứa toàn bộ các frame
local targetFps = 30 -- 30 hoặc 60 FPS
local lastSampleTime = 0
local heartbeatConn = nil
local wsConn = nil
local wsUrl = "ws://127.0.0.1:8765"
local wsStreamEnabled = true
local wsStatus = "Disconnected"
local lastSavedFilePath = nil

-- Callbacks
local statsChangedCallbacks = {}

local function notifyStatsChanged()
	local stats = logger.GetStats()
	for _, cb in ipairs(statsChangedCallbacks) do
		pcall(cb, stats)
	end
end

--// WebSocket Helper
local function getWebSocketConnectFunction()
	if typeof(WebSocket) == "table" and typeof(WebSocket.connect) == "function" then
		return WebSocket.connect
	elseif typeof(WebSocket) == "table" and typeof(WebSocket.Connect) == "function" then
		return WebSocket.Connect
	elseif typeof(websocket) == "table" and typeof(websocket.connect) == "function" then
		return websocket.connect
	elseif typeof(syn) == "table" and typeof(syn.websocket) == "table" and typeof(syn.websocket.connect) == "function" then
		return syn.websocket.connect
	end
	return nil
end

local function safeWsSend(ws, data)
	if not ws then return false end
	if typeof(ws.Send) == "function" then
		return pcall(function() ws:Send(data) end)
	elseif typeof(ws.send) == "function" then
		return pcall(function() ws:send(data) end)
	end
	return false
end

function logger.ConnectWebSocket()
	if not wsStreamEnabled then return end
	if wsConn then return end

	local connectFn = getWebSocketConnectFunction()
	if not connectFn then
		wsStatus = "Unsupported"
		return
	end

	wsStatus = "Connecting"
	task.spawn(function()
		local success, socket = pcall(connectFn, wsUrl)
		if success and socket then
			wsConn = socket
			wsStatus = "Connected"
			if socket.OnClose then
				socket.OnClose:Connect(function()
					wsConn = nil
					wsStatus = "Disconnected"
					notifyStatsChanged()
				end)
			end
			if socket.OnError then
				socket.OnError:Connect(function()
					wsConn = nil
					wsStatus = "Error"
					notifyStatsChanged()
				end)
			end
		else
			wsConn = nil
			wsStatus = "Disconnected"
		end
		notifyStatsChanged()
	end)
end

function logger.DisconnectWebSocket()
	if wsConn then
		pcall(function()
			if typeof(wsConn.Close) == "function" then wsConn:Close()
			elseif typeof(wsConn.close) == "function" then wsConn:close() end
		end)
		wsConn = nil
		wsStatus = "Disconnected"
		notifyStatsChanged()
	end
end

-- Lấy tên Dungeon hiện tại từ Workspace
local function getCurrentDungeonName()
	local dungeon = Workspace:FindFirstChild("dungeon")
	if dungeon and dungeon:FindFirstChild("dungeonName") then
		local val = dungeon.dungeonName.Value
		if typeof(val) == "string" and #val > 0 then return val end
	end
	return "UnknownDungeon"
end

-- Lấy số phòng hiện tại
local function getCurrentRoomIndex()
	local dungeon = Workspace:FindFirstChild("dungeon")
	if dungeon and dungeon:FindFirstChild("currentRoom") then
		local val = dungeon.currentRoom.Value
		if typeof(val) == "number" then return val end
	end
	return 0
end

-- Frame sampling loop
local function onHeartbeat()
	local now = os.clock()
	local interval = 1 / targetFps
	if (now - lastSampleTime) < interval then
		return
	end
	lastSampleTime = now

	-- Cập nhật sensor
	sensor.UpdateEntities()
	local hazards = sensor.GetActiveHazards()
	local boss = sensor.GetBossData()
	local mobs = sensor.GetMobsData()

	-- Observer lấy mẫu player
	local sample = observer.Sample(hazards, boss)
	if not sample then return end

	frameIndex = frameIndex + 1

	local frameData = {
		f = frameIndex,
		t = math.round((now - recordingStartTime) * 1000) / 1000,
		player = sample.player,
		danger = sample.danger,
		boss = sample.boss,
		hazards = hazards,
		mobsCount = #mobs,
	}

	-- Nếu đang trong phiên ghi REC thì lưu vào buffer
	if isRecording then
		-- Giới hạn an toàn bộ nhớ (tối đa 40,000 frames ~ 22 phút)
		if #buffer < 40000 then
			table.insert(buffer, frameData)
		end
	end

	-- Nếu có mở WebSocket stream -> gửi frame trực tiếp lên Live 2D Radar
	if wsConn and wsStatus == "Connected" then
		local telemetryPacket = {
			type = "TELEMETRY",
			version = "Recorder_V1",
			timestamp = now,
			dungeon = getCurrentDungeonName(),
			room = getCurrentRoomIndex(),
			player = sample.player,
			boss = boss,
			hazards = hazards,
			enemies = mobs,
			danger = sample.danger,
		}
		pcall(function()
			safeWsSend(wsConn, HttpService:JSONEncode(telemetryPacket))
		end)
	end

	if frameIndex % 30 == 0 then
		notifyStatsChanged()
	end
end

-- API
function logger.Start()
	if isRecording then return end
	isRecording = true
	recordingStartTime = os.clock()
	frameIndex = 0
	table.clear(buffer)
	lastSavedFilePath = nil

	sensor.Start()
	logger.ConnectWebSocket()

	if not heartbeatConn then
		heartbeatConn = RunService.Heartbeat:Connect(onHeartbeat)
	end
	notifyStatsChanged()
end

function logger.Stop()
	if not isRecording then return end
	isRecording = false
	notifyStatsChanged()
end

function logger.Clear()
	table.clear(buffer)
	frameIndex = 0
	lastSavedFilePath = nil
	notifyStatsChanged()
end

function logger.SaveToFile(customName)
	if #buffer == 0 then
		return false, "Buffer trống, chưa có dữ liệu nào được ghi!"
	end

	local now = os.date("!*t")
	local timeStr = string.format("%04d%02d%02d_%02d%02d%02d", now.year, now.month, now.day, now.hour, now.min, now.sec)
	local mapName = getCurrentDungeonName():gsub("%s+", "_"):gsub("[^%w_]", "")
	local fileName = customName or string.format("DQ_FlightLog_%s_%s.json", mapName, timeStr)
	local folderName = "DQ_FlightLogs"

	-- Tạo folder nếu executor hỗ trợ
	pcall(function()
		if typeof(makefolder) == "function" then
			makefolder(folderName)
		end
	end)

	local fullPath = folderName .. "/" .. fileName
	local sessionPayload = {
		metadata = {
			game = "DungeonQuest",
			dungeon = getCurrentDungeonName(),
			room = getCurrentRoomIndex(),
			date = os.date("%Y-%m-%d %H:%M:%S"),
			totalFrames = #buffer,
			durationSeconds = math.round((os.clock() - recordingStartTime) * 10) / 10,
			targetFps = targetFps,
			player = Players.LocalPlayer and Players.LocalPlayer.Name or "Unknown",
		},
		frames = buffer,
	}

	local jsonStr
	local encodeOk, encodeErr = pcall(function()
		jsonStr = HttpService:JSONEncode(sessionPayload)
	end)

	if not encodeOk or not jsonStr then
		return false, "Lỗi mã hoá JSON: " .. tostring(encodeErr)
	end

	local writeOk, writeErr = pcall(function()
		if typeof(writefile) == "function" then
			writefile(fullPath, jsonStr)
			return true
		end
		error("Executor không hỗ trợ writefile")
	end)

	if writeOk then
		lastSavedFilePath = fullPath
		notifyStatsChanged()
		return true, fullPath
	else
		return false, "Lỗi ghi file: " .. tostring(writeErr)
	end
end

function logger.GetStats()
	local duration = isRecording and (os.clock() - recordingStartTime) or (#buffer > 0 and (buffer[#buffer].t or 0) or 0)
	return {
		isRecording = isRecording,
		frameCount = #buffer,
		duration = math.round(duration * 10) / 10,
		activeHazards = #sensor.GetActiveHazards(),
		wsStatus = wsStatus,
		lastSavedFilePath = lastSavedFilePath,
	}
end

function logger.SetFps(fps)
	targetFps = math.clamp(fps or 30, 10, 60)
end

function logger.GetFps()
	return targetFps
end

function logger.SetWsUrl(url)
	wsUrl = url or "ws://127.0.0.1:8765"
end

function logger.GetWsUrl()
	return wsUrl
end

function logger.ToggleWsStream(enable)
	wsStreamEnabled = enable
	if enable then
		logger.ConnectWebSocket()
	else
		logger.DisconnectWebSocket()
	end
end

function logger.IsWsStreamEnabled()
	return wsStreamEnabled
end

function logger.OnStatsChanged(callback)
	table.insert(statsChangedCallbacks, callback)
end

function logger.Cleanup()
	logger.Stop()
	sensor.Stop()
	logger.DisconnectWebSocket()
	if heartbeatConn then
		pcall(function() heartbeatConn:Disconnect() end)
		heartbeatConn = nil
	end
	table.clear(buffer)
	table.clear(statsChangedCallbacks)
end

return logger
