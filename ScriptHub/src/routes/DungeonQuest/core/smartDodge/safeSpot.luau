-- Smart Dodge – Module 3+4: Safe Spot Calculation & Player Visuals (DungeonQuest).
-- Chuyên trách: Tính toán điểm thoát nạn (CalculateSafeSpot + latching lock + 3 chiến lược thoát)
-- và visual quanh người: Safe Marker xanh, Hitbox Padding cyan.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local geometry = require("@routes/DungeonQuest/core/smartDodge/geometry")
local detection = require("@routes/DungeonQuest/core/smartDodge/detection")
local targetFacing = require("@routes/DungeonQuest/core/smartDodge/targetFacing")


--// References
local Workspace = game:GetService("Workspace")
local player = services.player

--// State
local showSafeMarker = true
local lockedSafeSpot = nil
local lockedHazardCount = 0
local lockedEscapeDirection = nil    -- Vector hướng né đã chốt trên mặt phẳng X-Z (chống quay đầu)
local safeSpotMarkerPart = nil
local showHitboxVisual = false
local ESCAPE_MARGIN = 4.5           -- Khoảng cách đệm an toàn sau khi ra khỏi mép (studs)
local RADIAL_DISTANCES = { 4.0, 7.0, 10.5, 15.0, 20.0, 25.0 }
local ANGLE_OFFSETS_12 = { 0, 30, -30, 60, -60, 90, -90, 120, -120, 150, -150, 180 }

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
	if safeSpotMarkerPart and safeSpotMarkerPart.Parent then
		safeSpotMarkerPart.Parent = nil
	end
	if hitboxVisualPart and hitboxVisualPart.Parent then
		hitboxVisualPart.Parent = nil
	end
	lastMarkerPos = nil
	lastMarkerInDanger = false
	lastMarkerEscapeDist = 0
	lastHitboxPlayerPos = nil
end

--// Hủy hoàn toàn visual khi shutdown (lifecycle)
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
	lockedHazardCount = 0
	lockedEscapeDirection = nil
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

local lastRenderedMarkerPos = nil
local lastRenderedEscapeDist = -1

--// Cập nhật vị trí hiển thị của Safe Marker (đặt đáy hình cầu sát mặt đất nhất có thể)
function safeSpot.UpdateMarker(pos, inDanger, escapeDist)
	lastMarkerPos, lastMarkerInDanger, lastMarkerEscapeDist = pos, inDanger or false, escapeDist or 0
	if not showSafeMarker or not inDanger or not pos then
		if safeSpotMarkerPart then
			safeSpotMarkerPart.Parent = nil
		end
		lastRenderedMarkerPos = nil
		lastRenderedEscapeDist = -1
		return
	end

	local marker = getOrCreateSafeMarker()
	-- pos.Y được tính là Floor_Y + 3. Quả cầu bán kính 0.75 nên đặt tâm ở (Floor_Y + 0.8) = (pos.Y - 2.2) để sát đất
	local floorBallY = pos.Y - 2.2
	local newPos = Vector3.new(pos.X, floorBallY, pos.Z)

	if not lastRenderedMarkerPos or (newPos - lastRenderedMarkerPos).Magnitude > 0.1 then
		lastRenderedMarkerPos = newPos
		marker.CFrame = CFrame.new(newPos)
	end
	if not marker.Parent then
		marker.Parent = Workspace.Terrain
	end

	local curDist = escapeDist or 0
	if math.abs(curDist - lastRenderedEscapeDist) >= 0.2 then
		lastRenderedEscapeDist = curDist
		local bb = marker:FindFirstChild("MarkerGui")
		local label = bb and bb:FindFirstChild("Label")
		if label then
			label.Text = ("🟢 SAFE SPOT (%.1fm)"):format(curDist)
		end
	end
end

local HYSTERESIS_THRESHOLD = 3.0     -- Ngưỡng chênh lệch cự ly (studs) để chuyển khóa sang điểm an toàn mới gần hơn

--// Tính vector lực đẩy tổng hợp (Multi-Hazard Repulsion Force) từ tất cả các hazard đang đè/gần Player (1 vector/chiêu)
local function computeRepulsionVector(playerPos)
	-- Ưu tiên số 1: Nếu bật Auto Face Target -> Luôn ép vector lực đẩy LÙI thẳng ra xa mục tiêu
	if targetFacing and targetFacing.IsEnabled() then
		local targetPos = targetFacing.GetTargetPosition()
		if targetPos then
			local diffX = playerPos.X - targetPos.X
			local diffZ = playerPos.Z - targetPos.Z
			local distSq = diffX * diffX + diffZ * diffZ
			if distSq > 0.01 then
				local dist = math.sqrt(distSq)
				return Vector3.new(diffX / dist, 0, diffZ / dist)
			end
		end
	end


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

--// Trả về danh sách 12 góc quét được sắp xếp ưu tiên theo hướng thoát hiểm (ưu tiên hướng né đã khóa)
local function getSearchAngles(repVector)
	local baseAngleDeg = 0
	if lockedEscapeDirection then
		baseAngleDeg = math.deg(math.atan2(lockedEscapeDirection.Z, lockedEscapeDirection.X))
	elseif repVector then
		baseAngleDeg = math.deg(math.atan2(repVector.Z, repVector.X))
	end

	local angles = table.create(12)
	for i, off in ipairs(ANGLE_OFFSETS_12) do
		angles[i] = (baseAngleDeg + off) % 360
	end
	return angles
end

--// Đánh giá vùng đệm an toàn xung quanh điểm candidate (Clearance Safety Margin Scoring)
--// Quét nhanh 4 hướng chính ở bán kính 2.5m (Tối ưu hóa CPU: chỉ 4 điểm thay vì 12 điểm)
local function getClearanceBonus(point)
	local offsets = {
		Vector3.new(2.5, 0, 0),
		Vector3.new(-2.5, 0, 0),
		Vector3.new(0, 0, 2.5),
		Vector3.new(0, 0, -2.5),
	}
	local safeCount = 0
	for _, off in ipairs(offsets) do
		if not geometry.IsPointInAnyHazard(point + off) then
			safeCount = safeCount + 1
		end
	end
	-- Tối đa 4 điểm an toàn -> Điểm thưởng tối đa: 4 * 0.7 = 2.8 studs
	return safeCount * 0.7
end

--// Tính điểm ưu tiên cho một ứng viên vị trí an toàn (Score càng THẤP càng ƯU TIÊN):
--// Ưu tiên mạnh mẽ hướng né đã khóa (chống quay đầu), hướng lùi tự nhiên và cự ly an toàn
local function scoreCandidate(playerPos, candPos, repVector)
	local moveDist = (candPos - playerPos).Magnitude
	local clearance = getClearanceBonus(candPos)
	local score = moveDist - (clearance * 0.5)

	if moveDist > 0.5 then
		local dir = (candPos - playerPos).Unit
		if lockedEscapeDirection then
			local dotHeading = dir:Dot(lockedEscapeDirection)
			if dotHeading >= 0 then
				-- Cùng phía / thuận hướng né hiện tại: thưởng cự ly tới 4.0 studs (ưu tiên cao)
				score = score - (dotHeading * 4.0)
			else
				-- Ngược hướng né hiện tại (quay đầu > 90 độ): phạt rất nặng (+12 studs)
				score = score + (math.abs(dotHeading) * 12.0)
			end
		elseif repVector then
			local dot = dir:Dot(repVector)
			score = score - (dot * 2.5) -- Thưởng tới 2.5 studs cho hướng lùi thoát hiểm tự nhiên ra sau
		end
	end

	return score
end

--// Thuật toán Quét Tỏa Tròn Đa Hướng (Fine-Grained Radial Sweep): tìm khoảng hở an toàn gần nhất kết hợp Path Check & Clearance
--// TỐI ƯU HÓA ĐỈNH CAO: Không bắn bất kỳ tia Raycast nào trong vòng lặp quét! Chỉ snap sàn 1 lần duy nhất cho điểm chốt cuối cùng.
local function searchRadialSafeSpot(playerPos, repVector, currentHazardsSet, dangerPart)
	local angles = getSearchAngles(repVector)
	local bestPos = nil
	local bestScore = math.huge
	local fallbackPos = nil
	local fallbackScore = math.huge

	for _, dist in ipairs(RADIAL_DISTANCES) do
		local foundAtRadius = nil
		local bestScoreAtRadius = math.huge

		for _, angleDeg in ipairs(angles) do
			local rad = math.rad(angleDeg)
			local offset = Vector3.new(math.cos(rad) * dist, 0, math.sin(rad) * dist)
			local testWorld = playerPos + offset

			-- TỐI ƯU HIỆU SUẤT CPU: Kiểm tra hình học thuần túy (0 Raycast)
			if geometry.IsSpotFullySafe(testWorld, 0.8) then
				local score = scoreCandidate(playerPos, testWorld, repVector)

				-- Fallback lưu điểm an toàn tại đích (phòng khi không có đường đi thẳng an toàn)
				if score < fallbackScore then
					fallbackScore = score
					fallbackPos = testWorld
				end

				-- Ưu tiên số 1: Đoạn đường di chuyển từ playerPos -> testWorld an toàn (cho phép băng qua các chiêu đang đè)
				if geometry.IsPathSafe(playerPos, testWorld, currentHazardsSet, dangerPart) then
					if score < bestScoreAtRadius then
						bestScoreAtRadius = score
						foundAtRadius = testWorld
					end
				end
			end
		end

		-- Ngay khi ở vòng bán kính gần nhất này tìm được khe an toàn -> CHỌN NGAY LẬP TỨC và dừng tìm kiếm
		if foundAtRadius then
			bestPos = foundAtRadius
			bestScore = bestScoreAtRadius
			break
		end
	end

	local chosenPos = bestPos or fallbackPos
	local chosenScore = bestPos and bestScore or fallbackScore

	-- CHỈ BẮN DUY NHẤT 1 TIA RAYCAST cho ứng viên tốt nhất đã chọn để snap chính xác xuống mặt đất
	if chosenPos then
		local snapped, hasFloor = geometry.GetFloorPosition(chosenPos)
		local finalPos = hasFloor and snapped or chosenPos
		return finalPos, chosenScore
	end

	return nil, math.huge
end

--// Thuật toán cốt lõi: Tính toán vị trí an toàn (Safe Spot Calculation)
function safeSpot.CalculateSafeSpot(customPlayerPos)
	local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local playerPos = customPlayerPos or (rootPart and rootPart.Position)
	if not playerPos then
		lockedSafeSpot = nil
		lockedHazardCount = 0
		lockedEscapeDirection = nil
		return false, nil, nil, 0
	end

	-- 1. Kiểm tra xem Player có đang đứng trong bất kỳ vùng nguy hiểm nào không
	local inDanger, dangerInfo, dangerPart, dangerTraj = geometry.IsPointInAnyHazard(playerPos)
	if not inDanger or not dangerPart then
		lockedSafeSpot = nil
		lockedHazardCount = 0
		lockedEscapeDirection = nil
		return false, nil, nil, 0
	end

	local hazardName = dangerInfo.Name or "Unknown"

	-- Lấy toàn bộ các hazard đang bao phủ vị trí Player (hỗ trợ nhiều chiêu đè nhau)
	local currentHazardsSet, currentHazardCount = geometry.GetAllHazardsAtPoint(playerPos)

	-- 2. ĐÁNH GIÁ KHÓA ĐIỂM HIỆN TẠI (Smart Latching with Hysteresis & Path Safety Check):
	local hasValidLock = false
	local lockedDist = math.huge
	if lockedSafeSpot and geometry.IsSpotFullySafe(lockedSafeSpot, 0.8) then
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
			if geometry.IsSpotFullySafe(candWorld, 0.8) then
				local snapped, hasFloor = geometry.GetFloorPosition(candWorld)
				if hasFloor and geometry.IsSpotFullySafe(snapped, 0.8) then
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
			if geometry.IsSpotFullySafe(candWorld, 0.8) then
				local snapped, hasFloor = geometry.GetFloorPosition(candWorld)
				if hasFloor and geometry.IsSpotFullySafe(snapped, 0.8) then
					local score = scoreCandidate(playerPos, snapped, repVector)
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
		-- Ưu tiên số 1: Quét tỏa tròn 360 độ (ưu tiên hướng lùi ra sau xa tâm Boss/vụ nổ)
		local radPos, radScore = searchRadialSafeSpot(playerPos, repVector, currentHazardsSet, dangerPart)

		local bestPos = radPos
		local bestScore = radScore
		local fallbackPos = nil
		local fallbackScore = math.huge

		-- Nếu quét tỏa tròn chưa tìm được đường đi an toàn, thử thêm các điểm thoát trực tiếp của Part
		if not bestPos then
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
				if geometry.IsSpotFullySafe(candWorld, 0.8) then
					local snapped, hasFloor = geometry.GetFloorPosition(candWorld)
					if hasFloor and geometry.IsSpotFullySafe(snapped, 0.8) then
						local score = scoreCandidate(playerPos, snapped, repVector)
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
			end
		end

		candidatePos = bestPos or fallbackPos
	end

	-- 6. ÁP DỤNG CƠ CHẾ KHÓA ĐIỂM ĐỘNG THÔNG MINH + KHÓA HƯỚNG NÉ (Directional Momentum Lock)
	local chosenSpot = nil

	if candidatePos and geometry.IsSpotFullySafe(candidatePos, 0.8) then
		local candDist = (candidatePos - playerPos).Magnitude

		if hasValidLock and lockedSafeSpot then
			-- So sánh giữa điểm khóa cũ (lockedSafeSpot) và điểm mới tính (candidatePos)
			local distAdvantage = lockedDist - candDist -- Độ lợi cự ly nếu đổi sang candidate mới
			local hazardSetChanged = (currentHazardCount > lockedHazardCount)

			-- Kiểm tra góc hướng của candidate mới so với hướng né đang khóa
			local isForwardDirection = true
			if lockedEscapeDirection and candDist > 0.5 then
				local candVec = Vector3.new(candidatePos.X - playerPos.X, 0, candidatePos.Z - playerPos.Z)
				if candVec.Magnitude > 0.01 then
					local dot = candVec.Unit:Dot(lockedEscapeDirection)
					-- dot < 0 nghĩa là góc lệch > 90 độ (quay đầu / ngược hướng với đường đang chạy)
					if dot < 0 then
						isForwardDirection = false
					end
				end
			end

			if not isForwardDirection then
				-- CHỐT CHẶN CẤM QUAY ĐẦU (ANTI-U-TURN GATE):
				-- Điểm khóa cũ vẫn còn an toàn (hasValidLock == true), candidate mới lại ở hướng ngược lại
				-- -> TUYỆT ĐỐI KHÔNG ĐỔI! Giữ nguyên điểm cũ để tiếp tục di chuyển cùng một phía.
				chosenSpot = lockedSafeSpot
			else
				-- Candidate mới cùng phía thuận hướng:
				-- Chuyển sang candidate mới khi:
				-- 1. Có thêm chiêu mới xuất hiện (hazardSetChanged)
				-- 2. Candidate mới gần hơn rõ rệt (distAdvantage >= HYSTERESIS_THRESHOLD)
				-- 3. Điểm cũ còn xa (> 7.0 studs) trong khi candidate mới thoát hiểm cực gần (<= 4.0 studs)
				if hazardSetChanged or distAdvantage >= HYSTERESIS_THRESHOLD or (lockedDist > 7.0 and candDist <= 4.0) then
					chosenSpot = candidatePos
					lockedSafeSpot = candidatePos
					lockedHazardCount = currentHazardCount

					local newVec = Vector3.new(candidatePos.X - playerPos.X, 0, candidatePos.Z - playerPos.Z)
					if newVec.Magnitude > 0.5 then
						lockedEscapeDirection = newVec.Unit
					end
				else
					-- Giữ nguyên điểm khóa cũ để chống rung lắc (Anti-jitter)
					chosenSpot = lockedSafeSpot
				end
			end
		else
			-- Chưa có khóa hoặc khóa cũ đã hỏng (bị chiêu đè) -> Khóa ngay điểm candidate mới
			chosenSpot = candidatePos
			lockedSafeSpot = candidatePos
			lockedHazardCount = currentHazardCount

			local newVec = Vector3.new(candidatePos.X - playerPos.X, 0, candidatePos.Z - playerPos.Z)
			if newVec.Magnitude > 0.5 then
				lockedEscapeDirection = newVec.Unit
			else
				lockedEscapeDirection = nil
			end
		end
	elseif hasValidLock and lockedSafeSpot then
		-- Không tìm được candidate mới nhưng điểm cũ vẫn còn an toàn -> Giữ điểm cũ
		chosenSpot = lockedSafeSpot
	end

	if chosenSpot then
		local finalDist = math.floor((chosenSpot - playerPos).Magnitude * 10) / 10
		return true, chosenSpot, hazardName, finalDist
	end

	lockedSafeSpot = nil
	lockedHazardCount = 0
	lockedEscapeDirection = nil
	return true, nil, hazardName, 0
end

return safeSpot