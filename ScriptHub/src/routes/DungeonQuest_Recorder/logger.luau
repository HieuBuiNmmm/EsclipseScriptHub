--// Logger: Flight Data Recorder & WebSocket Telemetry Streamer
--// Sử dụng trực tiếp Scanner tinh gọn. Tuyệt đối KHÔNG nạp SafeSpot hay Danger HUD Indicator.

local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

local scanner = require("@routes/DungeonQuest_Recorder/scanner")
local observer = require("@routes/DungeonQuest_Recorder/observer")

local logger = {}

--// State
local isInitialized = false
local isRecording = false
local recordingStartTime = 0
local frameIndex = 0
local buffer = {}
local targetFps = 30
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
		notifyStatsChanged()
		return
	end

	wsStatus = "Connecting"
	notifyStatsChanged()
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

local function getYawDegrees(lookVector)
	if not lookVector or lookVector.Magnitude < 0.001 then return 0 end
	return math.deg(math.atan2(lookVector.X, -lookVector.Z))
end

local function getEnemiesTelemetry()
	local list = {}
	local dungeon = Workspace:FindFirstChild("dungeon")
	if dungeon then
		for _, child in ipairs(dungeon:GetChildren()) do
			if child:IsA("Model") and child:FindFirstChildOfClass("Humanoid") then
				local hum = child:FindFirstChildOfClass("Humanoid")
				local root = child:FindFirstChild("HumanoidRootPart") or child.PrimaryPart
				if hum and hum.Health > 0 and root then
					local mName = child.Name
					table.insert(list, {
						name = mName,
						x = math.round(root.Position.X * 10) / 10,
						y = math.round(root.Position.Y * 10) / 10,
						z = math.round(root.Position.Z * 10) / 10,
						yaw = math.round(getYawDegrees(root.CFrame.LookVector) * 10) / 10,
						health = math.round(hum.Health),
						maxHealth = math.round(hum.MaxHealth),
						isBoss = string.find(mName:lower(), "boss") ~= nil,
					})
				end
			end
		end
	end
	return list
end

local function getCurrentDungeonName()
	local dungeon = Workspace:FindFirstChild("dungeon")
	if dungeon and dungeon:FindFirstChild("dungeonName") then
		local val = dungeon.dungeonName.Value
		if typeof(val) == "string" and #val > 0 then return val end
	end
	return "DungeonQuest"
end

local function getCurrentRoomIndex()
	local dungeon = Workspace:FindFirstChild("dungeon")
	if dungeon and dungeon:FindFirstChild("currentRoom") then
		local val = dungeon.currentRoom.Value
		if typeof(val) == "number" then return val end
	end
	return 0
end

local function onHeartbeat()
	pcall(function()
		local now = os.clock()
		local interval = 1 / targetFps
		if (now - lastSampleTime) < interval then
			return
		end
		lastSampleTime = now

		-- Cập nhật dữ liệu từ Scanner
		local hazards = scanner.GetActiveHazardsTelemetry()
		local boss = scanner.GetBossTelegraphTelemetry()
		local mobs = getEnemiesTelemetry()
		local memory = scanner.GetMemoryGameTelemetry and scanner.GetMemoryGameTelemetry() or nil

		-- Lấy mẫu hành vi nhân vật
		local sample = observer.Sample(hazards, boss)
		if not sample then
			local lp = Players.LocalPlayer
			sample = {
				player = {
					name = lp and lp.Name or "Player",
					x = 0, y = 0, z = 0, yaw = 0,
					moveX = 0, moveZ = 0, moveMagnitude = 0,
					velX = 0, velY = 0, velZ = 0, speed = 0,
					walkSpeed = 16, health = 100, maxHealth = 100, isJumping = false,
				},
				danger = { inDanger = false, nearestHazard = nil },
				boss = nil,
			}
		end

		if isRecording then
			frameIndex = frameIndex + 1
			local frameData = {
				f = frameIndex,
				t = math.round((now - recordingStartTime) * 1000) / 1000,
				player = sample.player,
				danger = sample.danger,
				boss = boss,
				hazards = hazards,
				memory = memory,
				mobsCount = #mobs,
			}
			if #buffer < 40000 then
				table.insert(buffer, frameData)
			end
		end

		-- Stream gói Telemetry chuẩn V2 sang Web 2D Radar liên tục
		if wsConn and wsStatus == "Connected" then
			local isInvuln, invulnReason = false, nil
			local lp = Players.LocalPlayer
			if lp and lp.Character and lp.Character:FindFirstChildOfClass("ForceField") then
				isInvuln = true
				invulnReason = "ForceField"
			end

			local telemetryPacket = {
				type = "TELEMETRY",
				version = "V2",
				timestamp = now,
				dungeon = getCurrentDungeonName(),
				inLobby = (Workspace:FindFirstChild("dungeon") == nil),
				room = getCurrentRoomIndex(),
				player = {
					name = sample.player.name,
					x = sample.player.x,
					y = sample.player.y,
					z = sample.player.z,
					yaw = sample.player.yaw,
					moveX = sample.player.moveX,
					moveZ = sample.player.moveZ,
					health = sample.player.health,
					maxHealth = sample.player.maxHealth,
					healthPercent = math.clamp((sample.player.health / math.max(1, sample.player.maxHealth)) * 100, 0, 100),
					isInvulnerable = isInvuln,
					invulnReason = invulnReason,
					isDead = sample.player.health <= 0,
				},
				boss = boss,
				enemies = mobs,
				hazards = hazards,
				memory = memory,
			}

			pcall(function()
				safeWsSend(wsConn, HttpService:JSONEncode(telemetryPacket))
			end)
		end

		local ticker = isRecording and frameIndex or math.floor(now * 4)
		if ticker % 6 == 0 then
			notifyStatsChanged()
		end
	end)
end

-- Khởi tạo Engine (quét & stream ngầm)
function logger.Init()
	if isInitialized then return end
	isInitialized = true

	scanner.Start()
	logger.ConnectWebSocket()

	if not heartbeatConn then
		heartbeatConn = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

-- API Ghi chép (Record)
function logger.Start()
	logger.Init()
	if isRecording then return end
	isRecording = true
	recordingStartTime = os.clock()
	frameIndex = 0
	table.clear(buffer)
	lastSavedFilePath = nil
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
	local hazardsList = scanner.GetActiveHazardsTelemetry()
	return {
		isRecording = isRecording,
		frameCount = #buffer,
		duration = math.round(duration * 10) / 10,
		activeHazards = #hazardsList,
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
	scanner.Stop()
	logger.DisconnectWebSocket()
	if heartbeatConn then
		pcall(function() heartbeatConn:Disconnect() end)
		heartbeatConn = nil
	end
	table.clear(buffer)
	table.clear(statsChangedCallbacks)
	isInitialized = false
end

return logger
