-- Smart Dodge – Module 3+4: Safe Spot Calculation & Player Visuals (DungeonQuest).
-- Chuyên trách: Tính toán điểm thoát nạn (CalculateSafeSpot + latching lock + 3 chiến lược thoát)
-- và visual quanh người: Safe Marker xanh, Hitbox Padding cyan.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local geometry = require("@routes/DungeonQuest/core/smartDodge/geometry")
local detection = require("@routes/DungeonQuest/core/smartDodge/detection")

--// References
local Workspace = game:GetService("Workspace")
local player = services.player

--// State
local showSafeMarker = true
local lockedSafeSpot = nil
local safeSpotMarkerPart = nil
local showHitboxVisual = false
local hitboxVisualPart = nil
local ESCAPE_MARGIN = 4.5           -- Khoảng cách đệm an toàn sau khi ra khỏi mép (studs)
local RADIAL_DISTANCES = { 3.5, 5.5, 7.5, 10, 13, 16, 20, 25 }
local ANGLE_OFFSETS_24 = { 0, 15, -15, 30, -30, 45, -45, 60, -60, 75, -75, 90, -90, 105, -105, 120, -120, 135, -135, 150, -150, 165, -165, 180 }

--// Trạng thái visual gần nhất (để replay khi bật/tắt toggle từ UI — engine cập nhật mỗi nhịp)
local lastMarkerPos, lastMarkerInDanger, lastMarkerEscapeDist = nil, false, 0
local lastHitboxPlayerPos = nil

local safeSpot = {}

--// Public: accessor show/marker/hitbox

function safeSpot.IsShowSafeMarkerEnabled()
	return showSafeMarker
end

function safeSpot.SetShowSafeMarker(state)
	showSafeMarker = state and true or false
	safeSpot.UpdateMarker(lastMarkerPos, lastMarkerInDanger, lastMarkerEscapeDist)
end

function safeSpot.IsShowHitboxVisualEnabled()
	return showHitboxVisual
end

function safeSpot.SetShowHitboxVisual(state)
	showHitboxVisual = state and true or false
	safeSpot.UpdateHitbox(lastHitboxPlayerPos)
end

--// Set Hitbox Padding: cập nhật số học (module geometry) + resize visual nếu đang hiển thị
function safeSpot.SetHitboxPadding(value)
	geometry.SetHitboxPadding(value)
	if hitboxVisualPart and hitboxVisualPart.Parent then
		local diameter = math.max(0.4, geometry.GetHitboxPadding() * 2)
		hitboxVisualPart.Size = Vector3.new(0.15, diameter, diameter)
	end
end

--// Dọn visual marker/hitbox: unparent (giữ object để tái sử dụng) — engine stop loop gọi
function safeSpot.HideVisuals()
	if safeSpotMarkerPart then
		safeSpotMarkerPart.Parent = nil
	end
	if hitboxVisualPart then
		hitboxVisualPart.Parent = nil
	end
end

--// Destroy marker/hitbox hoàn toàn (lifecycle shutdown)
function safeSpot.DestroyVisuals()
	if safeSpotMarkerPart then
		pcall(function() safeSpotMarkerPart:Destroy() end)
		safeSpotMarkerPart = nil
	end
	if hitboxVisualPart then
		pcall(function() hitboxVisualPart:Destroy() end)
		hitboxVisualPart = nil
	end
end

--// Reset lock an toàn (engine gọi khi dừng loop — tương đương lockedSafeSpot = nil)
function safeSpot.ResetLock()
	lockedSafeSpot = nil
end

--// Tạo / Lấy Part hiển thị Hitbox Padding của Player quanh người
local function getOrCreateHitboxVisual()
	if hitboxVisualPart and hitboxVisualPart.Parent then
		return hitboxVisualPart
	end

	local part = Instance.new("Part")
	part.Name = "SmartDodge_HitboxVisual"
	part.Shape = Enum.PartType.Cylinder
	local diameter = math.max(0.4, geometry.GetHitboxPadding() * 2)
	part.Size = Vector3.new(0.15, diameter, diameter)
	part.Color = Color3.fromRGB(0, 220, 255)
	part.Material = Enum.Material.Neon
	part.Transparency = 0.75
	part.Anchored = true
	part.CanCollide = false
	part.CanQuery = false
	part.CanTouch = false

	local selectionBox = Instance.new("SelectionBox")
	selectionBox.Name = "HitboxBorder"
	selectionBox.Color3 = Color3.fromRGB(120, 240, 255)
	selectionBox.SurfaceColor3 = Color3.fromRGB(0, 220, 255)
	selectionBox.SurfaceTransparency = 0.8
	selectionBox.LineThickness = 0.04
	selectionBox.Adornee = part
	selectionBox.Parent = part

	hitboxVisualPart = part
	return part
end

--// Cập nhật vị trí và kích thước vòng tròn Hitbox của Player
function safeSpot.UpdateHitbox(playerPos)
	lastHitboxPlayerPos = playerPos
	if not showHitboxVisual or not detection.IsEnabled() or not playerPos then
		if hitboxVisualPart then
			hitboxVisualPart.Parent = nil
		end
		return
	end

	local part = getOrCreateHitboxVisual()
	local diameter = math.max(0.4, geometry.GetHitboxPadding() * 2)
	part.Size = Vector3.new(0.15, diameter, diameter)

	local floorPos, hasFloor = geometry.GetFloorPosition(playerPos)
	local yPos = hasFloor and (floorPos.Y - 2.8) or (playerPos.Y - 2.8)
	local visualPos = Vector3.new(playerPos.X, yPos, playerPos.Z)

	part.CFrame = CFrame.new(visualPos) * CFrame.Angles(0, 0, math.rad(90))
	part.Parent = Workspace.Terrain
end

--// Tạo / Lấy Visual Marker phát sáng màu Xanh Lá (Hình Cầu Nhỏ Sát Đất)
local function getOrCreateSafeMarker()
	if safeSpotMarkerPart and safeSpotMarkerPart.Parent then
		return safeSpotMarkerPart
	end

	local part = Instance.new("Part")
	part.Name = "SmartDodge_SafeMarker"
	part.Shape = Enum.PartType.Ball
	part.Size = Vector3.new(1.5, 1.5, 1.5)
	part.Color = Color3.fromRGB(0, 255, 120)
	part.Material = Enum.Material.Neon
	part.Transparency = 0.2
	part.Anchored = true
	part.CanCollide = false
	part.CanQuery = false
	part.CanTouch = false

	local bb = Instance.new("BillboardGui")
	bb.Name = "MarkerGui"
	bb.Size = UDim2.fromOffset(130, 24)
	bb.StudsOffset = Vector3.new(0, 1.5, 0)
	bb.AlwaysOnTop = true
	bb.Adornee = part
	bb.Parent = part

	local label = Instance.new("TextLabel")
	label.Name = "Label"
	label.Size = UDim2.fromScale(1, 1)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.fromRGB(80, 255, 160)
	label.TextStrokeTransparency = 0
	label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	label.Font = Enum.Font.GothamBold
	label.TextSize = 12
	label.Text = "🟢 SAFE SPOT"
	label.Parent = bb

	safeSpotMarkerPart = part
	return part
end

--// Cập nhật vị trí hiển thị của Safe Marker (đặt đáy hình cầu sát mặt đất nhất có thể)
function safeSpot.UpdateMarker(pos, inDanger, escapeDist)
	lastMarkerPos, lastMarkerInDanger, lastMarkerEscapeDist = pos, inDanger or false, escapeDist or 0
	if not showSafeMarker or not inDanger or not pos then
		if safeSpotMarkerPart then
			safeSpotMarkerPart.Parent = nil
		end
		return
	end

	local marker = getOrCreateSafeMarker()
	-- pos.Y được tính là Floor_Y + 3. Quả cầu bán kính 0.75 nên đặt tâm ở (Floor_Y + 0.8) = (pos.Y - 2.2) để sát đất
	local floorBallY = pos.Y - 2.2
	marker.CFrame = CFrame.new(pos.X, floorBallY, pos.Z)
	marker.Parent = Workspace.Terrain

	local bb = marker:FindFirstChild("MarkerGui")
	local label = bb and bb:FindFirstChild("Label")
	if label then
		label.Text = ("🟢 SAFE SPOT (%.1fm)"):format(escapeDist or 0)
	end
end

local HYSTERESIS_THRESHOLD = 4.0     -- Ngưỡng chênh lệch cự ly (studs) để chuyển khóa sang điểm an toàn mới gần hơn

--// Tính vector lực đẩy tổng hợp (Multi-Hazard Repulsion Force) từ tất cả các hazard đang đè/gần Player (1 vector/chiêu)
local function computeRepulsionVector(playerPos)
	local netX, netZ = 0, 0
	local activeHazards = detection.GetActiveHazardsMap and detection.GetActiveHazardsMap()
	if not activeHazards then return nil end

	local count = 0
	for _, info in pairs(activeHazards) do
		-- Lấy vị trí trung tâm đại diện của từng Skill (tránh việc Model 10 part bị áp đảo Model 1 part)
		local centerPos = info.Position
		if not centerPos and info.ActiveParts then
			for part in pairs(info.ActiveParts) do
				if part and part.Parent and part:IsA("BasePart") then
					centerPos = part.Position
					break
				end
			end
		end

		if centerPos then
			local diffX = playerPos.X - centerPos.X
			local diffZ = playerPos.Z - centerPos.Z
			local distSq = diffX * diffX + diffZ * diffZ
			if distSq < 1600 and distSq > 0.01 then
				local dist = math.sqrt(distSq)
				local weight = 1 / math.max(1, dist)
				netX = netX + (diffX / dist) * weight
				netZ = netZ + (diffZ / dist) * weight
				count = count + 1
			end
		end
	end

	local netMagSq = netX * netX + netZ * netZ
	if count > 0 and netMagSq > 0.001 then
		local netMag = math.sqrt(netMagSq)
		return Vector3.new(netX / netMag, 0, netZ / netMag)
	end
	return nil
end

--// Trả về danh sách 24 góc quét được sắp xếp ưu tiên theo hướng lực đẩy thoát nạn tự nhiên
local function getSearchAngles(repVector)
	local baseAngleDeg = 0
	if repVector then
		baseAngleDeg = math.deg(math.atan2(repVector.Z, repVector.X))
	end

	local angles = table.create(24)
	for i, off in ipairs(ANGLE_OFFSETS_24) do
		angles[i] = (baseAngleDeg + off) % 360
	end
	return angles
end

--// Đánh giá vùng đệm an toàn xung quanh điểm candidate (Clearance Safety Margin Scoring)
local function getClearanceBonus(point)
	local buffer = 1.5
	local offsets = {
		Vector3.new(buffer, 0, 0),
		Vector3.new(-buffer, 0, 0),
		Vector3.new(0, 0, buffer),
		Vector3.new(0, 0, -buffer),
	}
	local safeCount = 0
	for _, off in ipairs(offsets) do
		if not geometry.IsPointInAnyHazard(point + off) then
			safeCount = safeCount + 1
		end
	end
	-- Điểm thưởng tối đa 1.6 studs cho vị trí có không gian đệm rộng rãi 4 phía
	return safeCount * 0.4
end

--// Thuật toán Quét Tỏa Tròn Đa Hướng (Fine-Grained Radial Sweep): tìm khoảng hở an toàn gần nhất kết hợp Path Check & Clearance
local function searchRadialSafeSpot(playerPos, repVector, currentHazardsSet, dangerPart)
	local angles = getSearchAngles(repVector)
	local bestPos = nil
	local bestScore = math.huge
	local fallbackPos = nil
	local fallbackScore = math.huge

	for _, dist in ipairs(RADIAL_DISTANCES) do
		local foundAtRadius = nil
		local bestScoreAtRadius = math.huge
		local fallbackAtRadius = nil
		local bestFallbackScoreAtRadius = math.huge

		for _, angleDeg in ipairs(angles) do
			local rad = math.rad(angleDeg)
			local offset = Vector3.new(math.cos(rad) * dist, 0, math.sin(rad) * dist)
			local testWorld = playerPos + offset
			local snapped, hasFloor = geometry.GetFloorPosition(testWorld)

			if hasFloor and not geometry.IsPointInAnyHazard(snapped) then
				local moveDist = (snapped - playerPos).Magnitude
				local score = moveDist - getClearanceBonus(snapped)

				-- Fallback lưu điểm an toàn tại đích
				if score < bestFallbackScoreAtRadius then
					bestFallbackScoreAtRadius = score
					fallbackAtRadius = snapped
				end

				-- Ưu tiên số 1: Đoạn đường di chuyển từ playerPos -> snapped an toàn (cho phép băng qua các chiêu đang đè)
				if geometry.IsPathSafe(playerPos, snapped, currentHazardsSet, dangerPart) then
					if score < bestScoreAtRadius then
						bestScoreAtRadius = score
						foundAtRadius = snapped
					end
				end
			end
		end

		if foundAtRadius then
			bestScore = bestScoreAtRadius
			bestPos = foundAtRadius
			break -- Ưu tiên vòng bán kính nhỏ nhất có đường đi an toàn
		elseif fallbackAtRadius and not fallbackPos then
			fallbackScore = bestFallbackScoreAtRadius
			fallbackPos = fallbackAtRadius
		end
	end

	if bestPos then
		return bestPos, bestScore
	end
	return fallbackPos, fallbackScore
end

--// Thuật toán cốt lõi: Tính toán vị trí an toàn (Safe Spot Calculation)
function safeSpot.CalculateSafeSpot(customPlayerPos)
	local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local playerPos = customPlayerPos or (rootPart and rootPart.Position)
	if not playerPos then
		lockedSafeSpot = nil
		return false, nil, nil, 0
	end

	-- 1. Kiểm tra xem Player có đang đứng trong bất kỳ vùng nguy hiểm nào không
	local inDanger, dangerInfo, dangerPart, dangerTraj = geometry.IsPointInAnyHazard(playerPos)
	if not inDanger or not dangerPart then
		lockedSafeSpot = nil
		return false, nil, nil, 0
	end

	local hazardName = dangerInfo.Name or "Unknown"

	-- Lấy toàn bộ các hazard đang bao phủ vị trí Player (hỗ trợ nhiều chiêu đè nhau)
	local currentHazardsSet = geometry.GetAllHazardsAtPoint(playerPos)

	-- 2. ĐÁNH GIÁ KHÓA ĐIỂM HIỆN TẠI (Smart Latching with Hysteresis & Path Safety Check):
	local hasValidLock = false
	local lockedDist = math.huge
	if lockedSafeSpot and not geometry.IsPointInAnyHazard(lockedSafeSpot) then
		lockedDist = (lockedSafeSpot - playerPos).Magnitude
		-- Đề xuất 1 & 5: Điểm khóa phải nằm trong tầm và đường chạy tới điểm khóa vẫn phải an toàn
		if lockedDist <= 35 and geometry.IsPathSafe(playerPos, lockedSafeSpot, currentHazardsSet, dangerPart) then
			hasValidLock = true
		else
			lockedSafeSpot = nil
		end
	else
		lockedSafeSpot = nil
	end

	local candidatePos = nil
	local isMultiRings = hazardName:lower():find("multiring") ~= nil
		or (dangerInfo.Instance and dangerInfo.Instance.Name:lower():find("multiring") ~= nil)

	-- 3. Tính Vector Lực Đẩy Thoát Nạn Tổng Hợp (Multi-Hazard Repulsion)
	local repVector = computeRepulsionVector(playerPos)

	if isMultiRings then
		-- Tính điểm thoát nhanh cho thirdBossMultiRings:
		local inRing, r, rIn, rOut, centerPos, ringCF = geometry.IsPointInRingPart(playerPos, dangerPart)
		local candidates = {}

		if inRing and centerPos and r and r > 0.1 then
			local diffX = playerPos.X - centerPos.X
			local diffZ = playerPos.Z - centerPos.Z
			local unitX = diffX / r
			local unitZ = diffZ / r

			-- Thử bước vào lỗ trong (nhích nhẹ 3 studs)
			if rIn and rIn > 2.0 then
				local stepIn = Vector3.new(centerPos.X + unitX * (rIn - 2.5), playerPos.Y, centerPos.Z + unitZ * (rIn - 2.5))
				table.insert(candidates, stepIn)
			end

			-- Thử bước vào khoảng hở ngoài (nhích nhẹ 3 studs)
			if rOut then
				local stepOut = Vector3.new(centerPos.X + unitX * (rOut + 2.5), playerPos.Y, centerPos.Z + unitZ * (rOut + 2.5))
				table.insert(candidates, stepOut)
			end

			-- Thử bước sang nửa đối diện nếu là bán nguyệt
			local stepFlip = Vector3.new(centerPos.X - diffX, playerPos.Y, centerPos.Z - diffZ)
			table.insert(candidates, stepFlip)
		end

		-- Quét tỏa tròn 16 hướng bổ trợ
		local multiRingsRadii = { 3, 6, 9, 12, 15, 18, 22, 26, 30, 35, 40 }
		local multiRingsAngles = { 0, 22.5, 45, 67.5, 90, 112.5, 135, 157.5, 180, 202.5, 225, 247.5, 270, 292.5, 315, 337.5 }

		for _, dist in ipairs(multiRingsRadii) do
			for _, angleDeg in ipairs(multiRingsAngles) do
				local rad = math.rad(angleDeg)
				local offset = Vector3.new(math.cos(rad) * dist, 0, math.sin(rad) * dist)
				table.insert(candidates, playerPos + offset)
			end
		end

		local bestPos = nil
		local bestScore = math.huge
		local fallbackPos = nil
		local fallbackScore = math.huge

		for _, candWorld in ipairs(candidates) do
			local snapped, hasFloor = geometry.GetFloorPosition(candWorld)
			if hasFloor and not geometry.IsPointInAnyHazard(snapped) then
				local moveDist = (snapped - playerPos).Magnitude
				local score = moveDist - getClearanceBonus(snapped)
				if score < fallbackScore then
					fallbackScore = score
					fallbackPos = snapped
				end
				if geometry.IsPathSafe(playerPos, snapped, currentHazardsSet, dangerPart) then
					if score < bestScore then
						bestScore = score
						bestPos = snapped
					end
				end
			end
		end

		candidatePos = bestPos or fallbackPos
	elseif dangerTraj and dangerTraj.isTrajectory then
		-- 4. CHIẾN LƯỢC CHO PROJECTILE: Thoát Ngang Vuông Góc + Offset Quỹ Đạo Đa Hướng
		local forward2D = dangerTraj.forward2D
		local perpDist = dangerTraj.perpDist
		local dangerRadius = dangerTraj.dangerRadius
		local stepNeeded = math.max(3.5, (dangerRadius - perpDist) + ESCAPE_MARGIN)

		-- Vector vuông góc sang phải và sang trái (90 deg trên mặt phẳng X-Z)
		local perpRight = Vector3.new(forward2D.Z, 0, -forward2D.X)
		local perpLeft = Vector3.new(-forward2D.Z, 0, forward2D.X)

		local fOffsets = { 0, 3, -3, 6, -6 }
		local trajCandidates = {}
		for _, fOff in ipairs(fOffsets) do
			local fVec = forward2D * fOff
			table.insert(trajCandidates, playerPos + perpRight * stepNeeded + fVec)
			table.insert(trajCandidates, playerPos + perpLeft * stepNeeded + fVec)
			table.insert(trajCandidates, playerPos + perpRight * (stepNeeded + 2.0) + fVec)
			table.insert(trajCandidates, playerPos + perpLeft * (stepNeeded + 2.0) + fVec)
		end

		local bestPos = nil
		local bestScore = math.huge
		local fallbackPos = nil
		local fallbackScore = math.huge

		for _, candWorld in ipairs(trajCandidates) do
			local snapped, hasFloor = geometry.GetFloorPosition(candWorld)
			if hasFloor and not geometry.IsPointInAnyHazard(snapped) then
				local moveDist = (snapped - playerPos).Magnitude
				local score = moveDist - getClearanceBonus(snapped)
				if score < fallbackScore then
					fallbackScore = score
					fallbackPos = snapped
				end
				if geometry.IsPathSafe(playerPos, snapped, currentHazardsSet, dangerPart) then
					if score < bestScore then
						bestScore = score
						bestPos = snapped
					end
				end
			end
		end

		if not bestPos then
			-- Fallback quét tỏa tròn 24 hướng nếu cả 2 bên sườn bị kẹt bởi skill khác
			local radPos, radScore = searchRadialSafeSpot(playerPos, repVector, currentHazardsSet, dangerPart)
			if radPos then
				bestPos = radPos
				bestScore = radScore
			end
		end

		candidatePos = bestPos or fallbackPos
	else
		-- 5. CHIẾN LƯỢC CHO KỸ NĂNG THÔNG THƯỜNG / ĐÈ NHAU (MULTI-HAZARD SOLVER)
		local bestPos = nil
		local bestScore = math.huge
		local fallbackPos = nil
		local fallbackScore = math.huge
		local directCandidates = {}

		if dangerPart:IsA("Part") and (dangerPart.Shape == Enum.PartType.Ball or dangerPart.Shape == Enum.PartType.Cylinder) then
			-- A1. Chiêu hình tròn / hình cầu: Tạo các điểm thoát rẻ quạt (Fan Escapes: 0, ±25°, ±50°)
			local radius = math.max(dangerPart.Size.X, dangerPart.Size.Z) / 2
			local diff = Vector3.new(playerPos.X - dangerPart.Position.X, 0, playerPos.Z - dangerPart.Position.Z)
			local baseAngle = diff.Magnitude > 0.1 and math.atan2(diff.Z, diff.X) or 0
			local escapeRadius = radius + ESCAPE_MARGIN

			local fanOffsets = { 0, math.rad(25), -math.rad(25), math.rad(50), -math.rad(50) }
			for _, angOffset in ipairs(fanOffsets) do
				local testAngle = baseAngle + angOffset
				local directWorld = dangerPart.Position + Vector3.new(math.cos(testAngle) * escapeRadius, 0, math.sin(testAngle) * escapeRadius)
				table.insert(directCandidates, directWorld)
			end
		else
			-- A2. Chiêu hình chữ nhật / OBB: Thoát theo cả 4 cạnh và 4 góc của hộp
			local localPos = dangerPart.CFrame:PointToObjectSpace(playerPos)
			local halfX = dangerPart.Size.X / 2
			local halfZ = dangerPart.Size.Z / 2

			-- 4 cạnh thoát mép
			table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(halfX + ESCAPE_MARGIN, 0, localPos.Z)))
			table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(-(halfX + ESCAPE_MARGIN), 0, localPos.Z)))
			table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(localPos.X, 0, halfZ + ESCAPE_MARGIN)))
			table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(localPos.X, 0, -(halfZ + ESCAPE_MARGIN))))

			-- 4 góc chéo
			table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(halfX + ESCAPE_MARGIN, 0, halfZ + ESCAPE_MARGIN)))
			table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(halfX + ESCAPE_MARGIN, 0, -(halfZ + ESCAPE_MARGIN))))
			table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(-(halfX + ESCAPE_MARGIN), 0, halfZ + ESCAPE_MARGIN)))
			table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(-(halfX + ESCAPE_MARGIN), 0, -(halfZ + ESCAPE_MARGIN))))
		end

		-- Đánh giá các điểm thoát trực tiếp
		for _, candWorld in ipairs(directCandidates) do
			local snapped, hasFloor = geometry.GetFloorPosition(candWorld)
			if hasFloor and not geometry.IsPointInAnyHazard(snapped) then
				local moveDist = (snapped - playerPos).Magnitude
				local score = moveDist - getClearanceBonus(snapped)
				if score < fallbackScore then
					fallbackScore = score
					fallbackPos = snapped
				end
				if geometry.IsPathSafe(playerPos, snapped, currentHazardsSet, dangerPart) then
					if score < bestScore then
						bestScore = score
						bestPos = snapped
					end
				end
			end
		end

		-- Quét tỏa tròn đa hướng (Multi-Hazard Gap Detection): tìm khoảng trống hở nhỏ nhất giữa 2 chiêu đè nhau
		local radPos, radScore = searchRadialSafeSpot(playerPos, repVector, currentHazardsSet, dangerPart)
		if radPos and (not bestPos or radScore < bestScore) then
			bestScore = radScore
			bestPos = radPos
		end

		candidatePos = bestPos or fallbackPos
	end

	-- 6. ÁP DỤNG CƠ CHẾ KHÓA ĐIỂM THÔNG MINH (Smart Latching Hysteresis Logic)
	if candidatePos then
		local candidateDist = (candidatePos - playerPos).Magnitude

		if hasValidLock then
			-- Điểm mới phải gần hơn điểm đang khóa một khoảng >= HYSTERESIS_THRESHOLD studs thì mới đổi khóa
			if (candidateDist + HYSTERESIS_THRESHOLD) < lockedDist then
				lockedSafeSpot = candidatePos
			end
		else
			lockedSafeSpot = candidatePos
		end

		local finalDist = math.floor((lockedSafeSpot - playerPos).Magnitude * 10) / 10
		return true, lockedSafeSpot, hazardName, finalDist
	end

	-- Nếu không tìm được candidate mới nhưng điểm khóa cũ vẫn an toàn và đường đi thông suốt
	if hasValidLock then
		local finalDist = math.floor(lockedDist * 10) / 10
		return true, lockedSafeSpot, hazardName, finalDist
	end

	lockedSafeSpot = nil
	return true, nil, hazardName, 0
end

return safeSpot