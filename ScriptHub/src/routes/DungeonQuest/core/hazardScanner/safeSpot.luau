-- HazardScanner – Safe Spot Engine (DungeonQuest).
-- Logic xác định điểm an toàn gần nhất (Safe Spot) bằng thuật toán Radial Escape Sampling.
-- Khi người chơi bị dính vùng nguy hiểm (Đỏ/Cam), hệ thống quét đa hướng theo các vòng tròn đồng tâm
-- để tìm ra vị trí an toàn gần nhất (thoát hiểm với quãng đường ngắn nhất) và vẽ visual chỉ đường trên sàn.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local geometry = require("@routes/DungeonQuest/core/hazardScanner/geometry")
local trajectory = require("@routes/DungeonQuest/core/hazardScanner/trajectory")
local playerVisual = require("@routes/DungeonQuest/core/hazardScanner/playerVisual")

local RunService = services.RunService or game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local player = services.player

--// Table
local safeSpot = {}

--// State
local enabled = true
local visualEnabled = true
local showCandidatesVisual = true
local safetyBuffer = 2.0 -- studs (khoảng cách đẩy xa thêm ra khỏi mép danger zone để đứng thoải mái)
local currentTargetSafeSpot = nil
local currentThreatInstance = nil
local currentThreatType = nil
local lastDistance = 0
local isFindingSafeSpot = false
local heartbeatConnection = nil
local safeSpotChangedCallbacks = {}
local lastEvaluatedCandidates = {}

--// Visual Adornments
local markerAdornment = nil
local centerAdornment = nil
local lineAdornment = nil
local candidatePool = {}

--// Constants & Colors
local COLOR_SAFE_SPOT = Color3.fromRGB(0, 255, 120) -- Xanh lá Neon dạ quang
local COLOR_LINE = Color3.fromRGB(0, 255, 150)
local COLOR_CENTER = Color3.fromRGB(255, 255, 255) -- Tâm trắng nổi bật
local GROUND_THICKNESS = 0.20
local MARKER_RADIUS = 1.4 -- studs
local CENTER_RADIUS = 0.45 -- studs

--// Cấu hình Radial Sampling
-- 16 hướng quét bao quanh 360 độ (mỗi hướng lệch 22.5 độ)
local SAMPLE_DIRECTIONS = {}
local NUM_DIRECTIONS = 16
for i = 1, NUM_DIRECTIONS do
	local angle = (i - 1) * (2 * math.pi / NUM_DIRECTIONS)
	SAMPLE_DIRECTIONS[i] = Vector3.new(math.cos(angle), 0, math.sin(angle))
end

-- Bán kính lấy mẫu tăng dần từ gần tới xa (studs)
local SAMPLE_RADII = { 1.5, 3.0, 4.5, 6.0, 8.0, 10.5, 13.5, 17.0, 21.0, 26.0, 32.0, 40.0 }

--// Lấy HumanoidRootPart của người chơi
local function getPlayerRoot()
	local lp = player or Players.LocalPlayer
	if not lp then return nil end
	local char = lp.Character
	if not char or not char.Parent then return nil end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then return nil end
	return char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
end

--// Lấy độ cao mặt sàn dưới chân người chơi
local function getPlayerGroundY(root)
	if not root then return 0 end
	return root.Position.Y - 2.5
end

--// Kiểm tra xem một điểm P (X-Z) có hoàn toàn an toàn (toàn bộ vòng tròn Player nằm ngoài mọi Ground Zone & Trajectory) không
function safeSpot.IsPointSafe(point)
	if not point then return false end
	local p2D = Vector3.new(point.X, 0, point.Z)
	local playerRad = playerVisual.GetRadius and playerVisual.GetRadius() or 1.8

	-- 1. Kiểm tra Ground Danger Zones với bán kính vòng tròn Player
	if geometry.IsPointInAnyHazard and geometry.IsPointInAnyHazard(p2D, nil, playerRad) then
		return false
	end

	-- 2. Kiểm tra Trajectory Corridors với bán kính vòng tròn Player
	if trajectory.IsPointInAnyTrajectory and trajectory.IsPointInAnyTrajectory(p2D, playerRad) then
		return false
	end

	return true
end

--// Thuật toán Radial Escape Sampling: Tìm điểm an toàn gần nhất từ tọa độ origin
function safeSpot.FindNearestSafeSpot(origin)
	local root = getPlayerRoot()
	if not origin then
		if not root then return nil, false, 0 end
		origin = root.Position
	end

	local origin2D = Vector3.new(origin.X, 0, origin.Z)
	table.clear(lastEvaluatedCandidates)

	-- Nếu vị trí hiện tại đã an toàn -> Safe Spot chính là vị trí hiện tại
	if safeSpot.IsPointSafe(origin2D) then
		table.insert(lastEvaluatedCandidates, { pos = origin2D, isSafe = true, isChosen = true })
		return origin2D, true, 0, Vector3.zero
	end

	-- Quét theo từng vòng bán kính tăng dần
	local bestPoint = nil
	local bestDist = math.huge
	local bestDir = Vector3.zero

	for _, radius in ipairs(SAMPLE_RADII) do
		local foundAtThisRadius = false

		for _, dir in ipairs(SAMPLE_DIRECTIONS) do
			local candidate = origin2D + dir * radius
			local isSafe = safeSpot.IsPointSafe(candidate)

			table.insert(lastEvaluatedCandidates, {
				pos = candidate,
				isSafe = isSafe,
				isChosen = false,
			})

			if isSafe then
				local dist = (candidate - origin2D).Magnitude
				if dist < bestDist then
					bestDist = dist
					bestPoint = candidate
					bestDir = dir
					foundAtThisRadius = true
				end
			end
		end

		-- Do bán kính tăng dần, điểm an toàn đầu tiên tìm thấy ở vòng nhỏ nhất chính là điểm gần nhất
		if foundAtThisRadius and bestPoint then
			-- Đẩy xa thêm một đoạn safetyBuffer theo hướng thoát để đứng cách xa mép nguy hiểm thoải mái
			if safetyBuffer > 0 and bestDir ~= Vector3.zero then
				local pushedPoint = bestPoint + bestDir * safetyBuffer
				if safeSpot.IsPointSafe(pushedPoint) then
					bestPoint = pushedPoint
					bestDist = (bestPoint - origin2D).Magnitude
				end
			end

			-- Đánh dấu candidate được chọn
			for _, cand in ipairs(lastEvaluatedCandidates) do
				if (cand.pos - bestPoint).Magnitude < 0.2 then
					cand.isChosen = true
					break
				end
			end

			return bestPoint, true, bestDist, bestDir
		end
	end

	-- Không tìm thấy điểm an toàn trong phạm vi tối đa 40 studs
	return origin2D, false, math.huge, Vector3.zero
end

--// Khởi tạo Adornments hiển thị Safe Spot
local function ensureVisuals(root)
	if not root then return end

	-- Marker đĩa tròn xanh lá ngoài
	if not markerAdornment or not markerAdornment.Parent then
		if markerAdornment then pcall(function() markerAdornment:Destroy() end) end
		local ad = Instance.new("CylinderHandleAdornment")
		ad.Name = "SafeSpot_OuterMarker"
		ad.Adornee = root
		ad.Radius = MARKER_RADIUS
		ad.Height = GROUND_THICKNESS
		ad.Color3 = COLOR_SAFE_SPOT
		ad.Transparency = 0.35
		ad.ZIndex = 6
		ad.AlwaysOnTop = false
		ad.Visible = false
		ad.Parent = root
		markerAdornment = ad
	end

	-- Điểm tâm tròn màu trắng
	if not centerAdornment or not centerAdornment.Parent then
		if centerAdornment then pcall(function() centerAdornment:Destroy() end) end
		local cad = Instance.new("CylinderHandleAdornment")
		cad.Name = "SafeSpot_CenterDot"
		cad.Adornee = root
		cad.Radius = CENTER_RADIUS
		cad.Height = GROUND_THICKNESS + 0.05
		cad.Color3 = COLOR_CENTER
		cad.Transparency = 0.15
		cad.ZIndex = 7
		cad.AlwaysOnTop = false
		cad.Visible = false
		cad.Parent = root
		centerAdornment = cad
	end

	-- Đường dẫn nối từ Player -> Safe Spot
	if not lineAdornment or not lineAdornment.Parent then
		if lineAdornment then pcall(function() lineAdornment:Destroy() end) end
		local lad = Instance.new("LineHandleAdornment")
		lad.Name = "SafeSpot_EscapeLine"
		lad.Adornee = root
		lad.Color3 = COLOR_LINE
		lad.Thickness = 3.5
		lad.Transparency = 0.20
		lad.ZIndex = 6
		lad.AlwaysOnTop = false
		lad.Visible = false
		lad.Parent = root
		lineAdornment = lad
	end
end

--// Khởi tạo adornment cho từng điểm candidate
local function ensureCandidateAdornment(index, root)
	local entry = candidatePool[index]
	if not entry then
		local dot = Instance.new("CylinderHandleAdornment")
		dot.Name = "SafeSpot_CandidateDot_" .. index
		dot.Adornee = root
		dot.Radius = 0.25
		dot.Height = GROUND_THICKNESS
		dot.ZIndex = 4
		dot.AlwaysOnTop = false
		dot.Visible = false
		dot.Parent = root

		local line = Instance.new("LineHandleAdornment")
		line.Name = "SafeSpot_CandidateLine_" .. index
		line.Adornee = root
		line.Thickness = 1.2
		line.ZIndex = 4
		line.AlwaysOnTop = false
		line.Visible = false
		line.Parent = root

		entry = { dot = dot, line = line }
		candidatePool[index] = entry
	else
		if entry.dot and entry.dot.Adornee ~= root then
			entry.dot.Adornee = root
			entry.dot.Parent = root
		end
		if entry.line and entry.line.Adornee ~= root then
			entry.line.Adornee = root
			entry.line.Parent = root
		end
	end
	return entry
end

--// Ẩn visual candidate
local function hideCandidateVisuals()
	for _, entry in ipairs(candidatePool) do
		if entry.dot and entry.dot.Parent then entry.dot.Visible = false end
		if entry.line and entry.line.Parent then entry.line.Visible = false end
	end
end

--// Ẩn toàn bộ visual
local function hideVisuals()
	if markerAdornment and markerAdornment.Parent then markerAdornment.Visible = false end
	if centerAdornment and centerAdornment.Parent then centerAdornment.Visible = false end
	if lineAdornment and lineAdornment.Parent then lineAdornment.Visible = false end
	hideCandidateVisuals()
end

--// Cập nhật visual cho các điểm candidate đã quét
local function updateCandidateVisuals(root, targetY)
	if not showCandidatesVisual or not visualEnabled or not root or not root.Parent then
		hideCandidateVisuals()
		return
	end

	local playerFeetWorld = Vector3.new(root.Position.X, targetY + 0.05, root.Position.Z)
	local localStart = root.CFrame:PointToObjectSpace(playerFeetWorld)

	for i, cand in ipairs(lastEvaluatedCandidates) do
		local entry = ensureCandidateAdornment(i, root)
		local candWorld = Vector3.new(cand.pos.X, targetY + 0.05, cand.pos.Z)
		local localEnd = root.CFrame:PointToObjectSpace(candWorld)

		local color = cand.isSafe and Color3.fromRGB(0, 235, 140) or Color3.fromRGB(255, 60, 60)
		local alpha = cand.isSafe and 0.35 or 0.55

		-- 1. Dot tại điểm candidate
		if entry.dot and entry.dot.Parent then
			local desiredDotCF = CFrame.new(candWorld) * CFrame.Angles(math.rad(90), 0, 0)
			entry.dot.CFrame = root.CFrame:ToObjectSpace(desiredDotCF)
			entry.dot.Color3 = color
			entry.dot.Transparency = alpha
			entry.dot.Radius = cand.isSafe and 0.30 or 0.20
			entry.dot.Visible = true
		end

		-- 2. Line nối từ chân Player -> candidate
		if entry.line and entry.line.Parent then
			local delta = localEnd - localStart
			local length = delta.Magnitude
			if length > 0.2 then
				entry.line.CFrame = CFrame.lookAt(localStart, localEnd)
				entry.line.Length = length
				entry.line.Color3 = color
				entry.line.Transparency = alpha + 0.15
				entry.line.Thickness = cand.isSafe and 1.4 or 0.9
				entry.line.Visible = true
			else
				entry.line.Visible = false
			end
		end
	end

	-- Ẩn các adornment không dùng đến
	for i = #lastEvaluatedCandidates + 1, #candidatePool do
		local entry = candidatePool[i]
		if entry.dot and entry.dot.Parent then entry.dot.Visible = false end
		if entry.line and entry.line.Parent then entry.line.Visible = false end
	end
end

--// Cập nhật vị trí hiển thị Safe Spot Marker trên sàn
local function updateVisuals(root, safePos, targetY)
	if not root or not root.Parent or not visualEnabled then
		hideVisuals()
		return
	end

	ensureVisuals(root)

	local worldTargetPos = Vector3.new(safePos.X, targetY, safePos.Z)

	-- 1. Cập nhật Marker ngoài
	if markerAdornment and markerAdornment.Parent then
		local desiredWorldCF = CFrame.new(worldTargetPos) * CFrame.Angles(math.rad(90), 0, 0)
		markerAdornment.CFrame = root.CFrame:ToObjectSpace(desiredWorldCF)
		markerAdornment.Visible = true
	end

	-- 2. Cập nhật Center dot
	if centerAdornment and centerAdornment.Parent then
		local desiredCenterCF = CFrame.new(worldTargetPos) * CFrame.Angles(math.rad(90), 0, 0)
		centerAdornment.CFrame = root.CFrame:ToObjectSpace(desiredCenterCF)
		centerAdornment.Visible = true
	end

	-- 3. Cập nhật Line dẫn đường từ chân Player -> Safe Spot
	if lineAdornment and lineAdornment.Parent then
		local playerFeetWorld = Vector3.new(root.Position.X, targetY + 0.1, root.Position.Z)
		local safeFeetWorld = Vector3.new(safePos.X, targetY + 0.1, safePos.Z)

		local localStart = root.CFrame:PointToObjectSpace(playerFeetWorld)
		local localEnd = root.CFrame:PointToObjectSpace(safeFeetWorld)
		local delta = localEnd - localStart
		local length = delta.Magnitude

		if length > 0.3 then
			lineAdornment.CFrame = CFrame.new(localStart)
			lineAdornment.Length = length
			lineAdornment.CFrame = CFrame.lookAt(localStart, localEnd)
			lineAdornment.Visible = true
		else
			lineAdornment.Visible = false
		end
	end

	-- 4. Cập nhật Candidate Dots & Lines
	updateCandidateVisuals(root, targetY)
end

--// Vòng lặp Heartbeat: Khi Player dính nguy hiểm, tự động tính và giữ ổn định Safe Spot
local function onHeartbeat()
	if not enabled then
		hideVisuals()
		return
	end

	local root = getPlayerRoot()
	if not root or not root.Parent then
		hideVisuals()
		return
	end

	-- Kiểm tra xem Player có đang trong vùng nguy hiểm không
	local inDanger, threatInfo, threatType = false, nil, nil
	if playerVisual.IsPlayerInDanger then
		inDanger, threatInfo, threatType = playerVisual.IsPlayerInDanger()
	end

	local targetY = getPlayerGroundY(root)

	if inDanger then
		local playerPos2D = Vector3.new(root.Position.X, 0, root.Position.Z)

		-- Kiểm tra xem Safe Spot đã chọn trước đó còn hợp lệ không:
		-- 1. Điểm đó vẫn phải Safe (không bị chiêu mới đè lên).
		-- 2. Mối đe dọa (threat) của Player không bị đổi sang chiêu/loại khác.
		local isTargetStillSafe = currentTargetSafeSpot and safeSpot.IsPointSafe(currentTargetSafeSpot)
		local isSameThreat = (threatInfo == currentThreatInstance and threatType == currentThreatType)

		-- Nếu Safe Spot cũ bị đè HOẶC Player bị dính thêm/đổi Threat mới HOẶC chưa có Safe Spot:
		if not isTargetStillSafe or not isSameThreat or not currentTargetSafeSpot then
			local spot, found, dist, dir = safeSpot.FindNearestSafeSpot(root.Position)

			if found and spot then
				currentTargetSafeSpot = spot
				currentThreatInstance = threatInfo
				currentThreatType = threatType
				lastDistance = dist
				isFindingSafeSpot = true

				updateVisuals(root, spot, targetY)

				for _, cb in ipairs(safeSpotChangedCallbacks) do
					pcall(cb, true, spot, dist)
				end
			else
				hideVisuals()
			end
		else
			-- Safe Spot cũ vẫn an toàn và cùng mối nguy -> GIỮ NGUYÊN để không bị giật rung
			local currentDist = (currentTargetSafeSpot - playerPos2D).Magnitude
			lastDistance = currentDist

			updateVisuals(root, currentTargetSafeSpot, targetY)

			for _, cb in ipairs(safeSpotChangedCallbacks) do
				pcall(cb, true, currentTargetSafeSpot, currentDist)
			end
		end
	else
		-- Khi player không còn trong vùng nguy hiểm:
		-- Nếu vẫn còn targetSafeSpot và người chơi chưa chạm tới đích (currentDist > 0.8 studs), tiếp tục duy trì visual
		local playerPos2D = Vector3.new(root.Position.X, 0, root.Position.Z)
		local isTargetStillSafe = currentTargetSafeSpot and safeSpot.IsPointSafe(currentTargetSafeSpot)
		local currentDist = currentTargetSafeSpot and (currentTargetSafeSpot - playerPos2D).Magnitude or 0

		if isTargetStillSafe and currentDist > 0.8 then
			lastDistance = currentDist
			updateVisuals(root, currentTargetSafeSpot, targetY)
			for _, cb in ipairs(safeSpotChangedCallbacks) do
				pcall(cb, true, currentTargetSafeSpot, currentDist)
			end
		else
			-- Khi đã thực sự tới đích hoặc điểm không còn an toàn -> ẩn visual và reset
			if isFindingSafeSpot or currentTargetSafeSpot then
				isFindingSafeSpot = false
				currentTargetSafeSpot = nil
				currentThreatInstance = nil
				currentThreatType = nil
				lastDistance = 0
				hideVisuals()

				for _, cb in ipairs(safeSpotChangedCallbacks) do
					pcall(cb, false, nil, 0)
				end
			end
		end
	end
end

--// Khởi động tracking
local function startTracking()
	if not heartbeatConnection then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

--// Dọn dẹp Safe Spot
function safeSpot.Cleanup()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	if markerAdornment then pcall(function() markerAdornment:Destroy() end); markerAdornment = nil end
	if centerAdornment then pcall(function() centerAdornment:Destroy() end); centerAdornment = nil end
	if lineAdornment then pcall(function() lineAdornment:Destroy() end); lineAdornment = nil end
	for _, entry in ipairs(candidatePool) do
		if entry.dot then pcall(function() entry.dot:Destroy() end) end
		if entry.line then pcall(function() entry.line:Destroy() end) end
	end
	table.clear(candidatePool)
	table.clear(lastEvaluatedCandidates)
	currentTargetSafeSpot = nil
	currentThreatInstance = nil
	currentThreatType = nil
	lastDistance = 0
	isFindingSafeSpot = false
end

--// API Public
function safeSpot.GetLastSafeSpot()
	return currentTargetSafeSpot, lastDistance, isFindingSafeSpot
end

function safeSpot.OnSafeSpotChanged(callback)
	if type(callback) == "function" then
		table.insert(safeSpotChangedCallbacks, callback)
	end
end

function safeSpot.SetVisualEnabled(state)
	visualEnabled = state and true or false
	if not visualEnabled then
		hideVisuals()
	end
end

function safeSpot.IsVisualEnabled()
	return visualEnabled
end

function safeSpot.SetShowCandidates(state)
	showCandidatesVisual = state and true or false
	if not showCandidatesVisual then
		hideCandidateVisuals()
	end
end

function safeSpot.IsShowCandidates()
	return showCandidatesVisual
end

function safeSpot.SetEnabled(state)
	enabled = state and true or false
	if not enabled then
		hideVisuals()
	end
end

function safeSpot.IsEnabled()
	return enabled
end

function safeSpot.SetSafetyBuffer(val)
	if type(val) == "number" and val >= 0 then
		safetyBuffer = val
	end
end

function safeSpot.GetSafetyBuffer()
	return safetyBuffer
end

-- Lắng nghe hồi sinh nhân vật để dọn visual cũ
local function hookRespawn()
	local lp = player or Players.LocalPlayer
	if not lp then return end
	lp.CharacterAdded:Connect(function()
		if markerAdornment then pcall(function() markerAdornment:Destroy() end); markerAdornment = nil end
		if centerAdornment then pcall(function() centerAdornment:Destroy() end); centerAdornment = nil end
		if lineAdornment then pcall(function() lineAdornment:Destroy() end); lineAdornment = nil end
		for _, entry in ipairs(candidatePool) do
			if entry.dot then pcall(function() entry.dot:Destroy() end) end
			if entry.line then pcall(function() entry.line:Destroy() end) end
		end
		table.clear(candidatePool)
	end)
end
hookRespawn()

-- Khởi động tracking
startTracking()

-- Dọn dẹp khi shutdown
lifecycle.Register(function()
	safeSpot.Cleanup()
end)

return safeSpot
