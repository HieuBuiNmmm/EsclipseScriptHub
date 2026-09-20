-- Live Radar (DungeonQuest): WebSocket Telemetry Streamer (V2 Architecture).
-- Sử dụng hoàn toàn HazardScannerV2 để quét hình học tổng quát, động học và telegraph.
-- Truyền dữ liệu thời gian thực qua WebSocket (ws://localhost:8765) tới công cụ Web 2D Radar.
-- ĐỘC LẬP HOÀN TOÀN: Không can thiệp hay phụ thuộc vào hệ thống hazard scanner V1 cũ.

--// Imports
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local contextual = require("@routes/DungeonQuest/core/contextual")
local hazardScannerV2 = require("@routes/DungeonQuest/core/hazardScannerV2")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")

--// Table
local liveRadar = {}

--// State
local enabled = false
local wsUrl = "ws://127.0.0.1:8765"
local targetFps = 30
local status = "Disconnected" -- "Disconnected" | "Connecting" | "Connected" | "Error"
local wsInstance = nil
local sendThread = nil
local reconnectThread = nil
local statusCallbacks = {}

--// Helper: Lấy hàm kết nối WebSocket hỗ trợ trên các Executor phổ biến (Synapse, Wave, Solara, Swift, KRNL, ...)
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

local function setStatus(newStatus)
	if status == newStatus then return end
	status = newStatus
	for _, cb in ipairs(statusCallbacks) do
		pcall(cb, status)
	end
end

--// Trích xuất góc quay Yaw (degrees) từ LookVector
local function getYawDegrees(lookVector)
	if not lookVector or lookVector.Magnitude < 0.001 then return 0 end
	return math.deg(math.atan2(lookVector.X, -lookVector.Z))
end

--// Đọc danh sách tất cả các quái vật / enemy đang track
local function getEnemiesTelemetry()
	local list = {}
	if not shared.GetTrackedEnemyData then return list end

	local enemies = shared.GetTrackedEnemyData()
	for _, enemy in ipairs(enemies) do
		if enemy and enemy.Model and enemy.Root and enemy.Humanoid and enemy.Humanoid.Health > 0 then
			local mName = enemy.Model.Name
			local isBoss = string.find(mName:lower(), "boss") ~= nil
			table.insert(list, {
				name = mName,
				x = enemy.Root.Position.X,
				y = enemy.Root.Position.Y,
				z = enemy.Root.Position.Z,
				yaw = enemy.Root and getYawDegrees(enemy.Root.CFrame.LookVector) or 0,
				health = math.max(0, enemy.Humanoid.Health),
				maxHealth = math.max(1, enemy.Humanoid.MaxHealth),
				isBoss = isBoss,
			})
		end
	end
	return list
end

--// Tổng hợp gói Telemetry toàn diện gửi lên WebSocket
local function buildTelemetryPacket()
	local lp = services.player or Players.LocalPlayer
	local char = lp and lp.Character
	local root = char and (char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart)
	local hum = char and char:FindFirstChildOfClass("Humanoid")

	local playerPos = root and root.Position or Vector3.zero
	local playerYaw = root and getYawDegrees(root.CFrame.LookVector) or 0
	local moveDir = hum and hum.MoveDirection or Vector3.zero

	local isInvuln, invulnReason = false, nil
	if shared.IsInvulnerable then
		isInvuln, invulnReason = shared.IsInvulnerable()
	end

	-- Lấy dữ liệu Hazards & Boss từ HazardScannerV2
	local hazardsList = hazardScannerV2.GetActiveHazardsTelemetry()
	local bossData = hazardScannerV2.GetBossTelegraphTelemetry()

	local packet = {
		type = "TELEMETRY",
		version = "V2",
		timestamp = os.clock(),
		dungeon = (shared.GetCurrentDungeonName and shared.GetCurrentDungeonName()) or "Unknown",
		inLobby = (shared.IsInLobby and shared.IsInLobby()) or false,
		room = (shared.GetCurrentRoomIndex and shared.GetCurrentRoomIndex()) or 0,
		player = {
			name = lp and lp.Name or "Player",
			x = playerPos.X,
			y = playerPos.Y,
			z = playerPos.Z,
			yaw = playerYaw,
			moveX = moveDir.X,
			moveZ = moveDir.Z,
			health = hum and math.max(0, hum.Health) or 100,
			maxHealth = hum and math.max(1, hum.MaxHealth) or 100,
			healthPercent = hum and math.clamp((hum.Health / hum.MaxHealth) * 100, 0, 100) or 100,
			isInvulnerable = isInvuln,
			invulnReason = invulnReason,
			isDead = (shared.IsDead and shared.IsDead()) or (hum and hum.Health <= 0) or false,
		},
		boss = bossData,
		enemies = getEnemiesTelemetry(),
		hazards = hazardsList,
	}

	return packet
end

--// Helper: Gọi Send an toàn cho mọi loại executor
local function safeWsSend(ws, data)
	if not ws then return false, "No websocket instance" end
	if typeof(ws.Send) == "function" then
		return pcall(function() ws:Send(data) end)
	elseif typeof(ws.send) == "function" then
		return pcall(function() ws:send(data) end)
	end
	return false, "No Send method on websocket object"
end

--// Helper: Gọi Close an toàn cho mọi loại executor
local function safeWsClose(ws)
	if not ws then return end
	if typeof(ws.Close) == "function" then
		pcall(function() ws:Close() end)
	elseif typeof(ws.close) == "function" then
		pcall(function() ws:close() end)
	end
end

--// Vòng lặp truyền dữ liệu (Streaming Loop)
local function startStreamingLoop()
	if sendThread then return end

	sendThread = task.spawn(function()
		while enabled and wsInstance do
			local interval = 1 / math.clamp(targetFps, 5, 60)
			local t0 = os.clock()

			local ok, packet = pcall(buildTelemetryPacket)
			if ok and packet and wsInstance then
				local jsonOk, jsonStr = pcall(function()
					return HttpService:JSONEncode(packet)
				end)

				if jsonOk and jsonStr and wsInstance then
					local sendOk, sendErr = safeWsSend(wsInstance, jsonStr)
					if not sendOk then
						-- Xử lý an toàn khi mất kết nối
						local ws = wsInstance
						wsInstance = nil
						if ws then
							safeWsClose(ws)
						end
						hazardScannerV2.StopScan()
						setStatus("Disconnected")
						break
					end
				end
			end

			local elapsed = os.clock() - t0
			local sleepTime = math.max(0.01, interval - elapsed)
			task.wait(sleepTime)
		end
		sendThread = nil
	end)
end

--// Kết nối WebSocket
function liveRadar.Connect()
	if wsInstance then
		liveRadar.Disconnect()
	end

	local connectFn = getWebSocketConnectFunction()
	if not connectFn then
		setStatus("Error")
		return false
	end

	setStatus("Connecting")

	-- Thử kết nối với wsUrl hiện tại (ưu tiên ws://127.0.0.1:8765)
	local targetUrl = wsUrl
	if not targetUrl or #targetUrl == 0 then
		targetUrl = "ws://127.0.0.1:8765"
	end

	local ok, ws = pcall(connectFn, targetUrl)
	-- Nếu thất bại với localhost, tự động fallback sang 127.0.0.1
	if (not ok or not ws) and string.find(targetUrl, "localhost") then
		local fallbackUrl = string.gsub(targetUrl, "localhost", "127.0.0.1")
		ok, ws = pcall(connectFn, fallbackUrl)
	end

	if not ok or not ws then
		setStatus("Disconnected")
		return false
	end

	wsInstance = ws
	setStatus("Connected")

	-- Khởi động HazardScannerV2
	hazardScannerV2.StartScan()

	-- Lắng nghe OnClose nếu executor hỗ trợ
	pcall(function()
		if ws.OnClose and typeof(ws.OnClose.Connect) == "function" then
			ws.OnClose:Connect(function()
				liveRadar.Disconnect()
			end)
		elseif typeof(ws.OnClose) == "function" then
			ws.OnClose = function()
				liveRadar.Disconnect()
			end
		end
	end)

	startStreamingLoop()
	return true
end

--// Ngắt kết nối WebSocket
function liveRadar.Disconnect()
	-- Không hủy thread cưỡng bức để tránh lỗi "cannot cancel thread", chỉ cần gỡ wsInstance
	local ws = wsInstance
	wsInstance = nil
	sendThread = nil

	if ws then
		safeWsClose(ws)
	end

	-- Dừng HazardScannerV2
	hazardScannerV2.StopScan()

	setStatus("Disconnected")
end

--// Bắt đầu hoặc dừng tự động Reconnect khi Enabled
local function maintainConnection()
	if reconnectThread then return end

	reconnectThread = task.spawn(function()
		while enabled and lifecycle.IsActive() do
			if enabled and (not wsInstance or status == "Disconnected" or status == "Error") then
				liveRadar.Connect()
			end
			task.wait(3.0)
		end
		reconnectThread = nil
	end)
end

--// API Điều khiển
function liveRadar.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		maintainConnection()
		liveRadar.Connect()
	else
		if reconnectThread then
			task.cancel(reconnectThread)
			reconnectThread = nil
		end
		liveRadar.Disconnect()
	end
end

function liveRadar.IsEnabled()
	return enabled
end

function liveRadar.SetUrl(url)
	if type(url) == "string" and #url > 0 and url ~= wsUrl then
		wsUrl = url
		if enabled then
			liveRadar.Connect()
		end
	end
end

function liveRadar.GetUrl()
	return wsUrl
end

function liveRadar.SetFps(fps)
	if type(fps) == "number" and fps >= 5 and fps <= 60 then
		targetFps = math.floor(fps)
	end
end

function liveRadar.GetFps()
	return targetFps
end

function liveRadar.GetStatus()
	return status
end

function liveRadar.OnStatusChanged(callback)
	if type(callback) == "function" then
		table.insert(statusCallbacks, callback)
	end
end

--// Dọn dẹp khi shutdown
lifecycle.Register(function()
	liveRadar.SetEnabled(false)
end)

return liveRadar
