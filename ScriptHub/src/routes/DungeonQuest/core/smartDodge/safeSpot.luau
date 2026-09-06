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
local RADIAL_DISTANCES = { 6, 10, 14, 18, 24, 30 }
local RADIAL_ANGLES = { 0, 45, 90, 135, 180, 225, 270, 315 }

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

--// Tạo / Lấy Visual Marker phát sáng màu Xanh Lá
local function getOrCreateSafeMarker()
	if safeSpotMarkerPart and safeSpotMarkerPart.Parent then
		return safeSpotMarkerPart
	end

	local part = Instance.new("Part")
	part.Name = "SmartDodge_SafeMarker"
	part.Shape = Enum.PartType.Cylinder
	part.Size = Vector3.new(0.4, 3.5, 3.5)
	part.Color = Color3.fromRGB(0, 255, 120)
	part.Material = Enum.Material.Neon
	part.Transparency = 0.3
	part.Anchored = true
	part.CanCollide = false
	part.CanQuery = false
	part.CanTouch = false

	local selectionBox = Instance.new("SelectionBox")
	selectionBox.Name = "MarkerBorder"
	selectionBox.Color3 = Color3.fromRGB(80, 255, 160)
	selectionBox.SurfaceColor3 = Color3.fromRGB(0, 255, 120)
	selectionBox.SurfaceTransparency = 0.5
	selectionBox.LineThickness = 0.05
	selectionBox.Adornee = part
	selectionBox.Parent = part

	local bb = Instance.new("BillboardGui")
	bb.Name = "MarkerGui"
	bb.Size = UDim2.fromOffset(140, 30)
	bb.StudsOffset = Vector3.new(0, 3, 0)
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
	label.TextSize = 13
	label.Text = "🟢 SAFE SPOT"
	label.Parent = bb

	safeSpotMarkerPart = part
	return part
end

--// Cập nhật vị trí hiển thị của Safe Marker (engine gọi mỗi nhịp loop)
function safeSpot.UpdateMarker(pos, inDanger, escapeDist)
	lastMarkerPos, lastMarkerInDanger, lastMarkerEscapeDist = pos, inDanger or false, escapeDist or 0
	if not showSafeMarker or not inDanger or not pos then
		if safeSpotMarkerPart then
			safeSpotMarkerPart.Parent = nil
		end
		return
	end

	local marker = getOrCreateSafeMarker()
	marker.CFrame = CFrame.new(pos) * CFrame.Angles(0, 0, math.rad(90))
	marker.Parent = Workspace.Terrain

	local bb = marker:FindFirstChild("MarkerGui")
	local label = bb and bb:FindFirstChild("Label")
	if label then
		label.Text = ("🟢 SAFE SPOT (%.1fm)"):format(escapeDist or 0)
	end
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

	-- 2. KHÓA ĐIỂM AN TOÀN (Latching Lock): Nếu điểm an toàn trước đó vẫn an toàn, GIỮ NGUYÊN 100% không tính lại
	if lockedSafeSpot and not geometry.IsPointInAnyHazard(lockedSafeSpot) then
		local dist = (lockedSafeSpot - playerPos).Magnitude
		if dist <= 35 then
			return true, lockedSafeSpot, hazardName, math.floor(dist * 10) / 10
		end
	end

	local candidatePos = nil
	local isMultiRings = hazardName:lower():find("multiring") ~= nil
		or (dangerInfo.Instance and dangerInfo.Instance.Name:lower():find("multiring") ~= nil)

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
		local bestDist = math.huge

		for _, candWorld in ipairs(candidates) do
			local snapped, hasFloor = geometry.GetFloorPosition(candWorld)
			if hasFloor and not geometry.IsPointInAnyHazard(snapped) then
				local moveDist = (snapped - playerPos).Magnitude
				if moveDist < bestDist then
					bestDist = moveDist
					bestPos = snapped
				end
			end
		end

		candidatePos = bestPos
	elseif dangerTraj and dangerTraj.isTrajectory then
		-- 3. CHIẾN LƯỢC CHO PROJECTILE: Thoát Ngang Vuông Góc 90 Độ (Perpendicular Lateral Escape)
		local forward2D = dangerTraj.forward2D
		local perpDist = dangerTraj.perpDist
		local dangerRadius = dangerTraj.dangerRadius
		local stepNeeded = math.max(3.5, (dangerRadius - perpDist) + ESCAPE_MARGIN)

		-- Vector vuông góc sang phải và sang trái (90 deg trên mặt phẳng X-Z)
		local perpRight = Vector3.new(forward2D.Z, 0, -forward2D.X)
		local perpLeft = Vector3.new(-forward2D.Z, 0, forward2D.X)

		local trajCandidates = {
			playerPos + perpRight * stepNeeded,
			playerPos + perpLeft * stepNeeded,
			playerPos + (perpRight * (stepNeeded + 2.0)),
			playerPos + (perpLeft * (stepNeeded + 2.0)),
			playerPos + (perpRight * stepNeeded) + (forward2D * 2),
			playerPos + (perpLeft * stepNeeded) + (forward2D * 2),
		}

		local bestPos = nil
		local bestDist = math.huge

		for _, candWorld in ipairs(trajCandidates) do
			local snapped, hasFloor = geometry.GetFloorPosition(candWorld)
			if hasFloor and not geometry.IsPointInAnyHazard(snapped) then
				local moveDist = (snapped - playerPos).Magnitude
				if moveDist < bestDist then
					bestDist = moveDist
					bestPos = snapped
				end
			end
		end

		if not bestPos then
			-- Fallback lưới tỏa tròn nếu cả 2 bên sườn đều bị vướng
			for _, dist in ipairs(RADIAL_DISTANCES) do
				for _, angleDeg in ipairs(RADIAL_ANGLES) do
					local rad = math.rad(angleDeg)
					local offset = Vector3.new(math.cos(rad) * dist, 0, math.sin(rad) * dist)
					local testWorld = playerPos + offset
					local snapped, hasFloor = geometry.GetFloorPosition(testWorld)

					if hasFloor and not geometry.IsPointInAnyHazard(snapped) then
						local moveDist = (snapped - playerPos).Magnitude
						if moveDist < bestDist then
							bestDist = moveDist
							bestPos = snapped
						end
					end
				end
				if bestPos then break end
			end
		end

		candidatePos = bestPos
	else
		-- 3. Chiến lược A: Thoát trực tiếp (Direct Escape Vector) từ Part gây nguy hiểm gần nhất cho các skill thông thường
		if dangerPart:IsA("Part") and (dangerPart.Shape == Enum.PartType.Ball or dangerPart.Shape == Enum.PartType.Cylinder) then
			-- A1. Chiêu hình tròn / hình cầu: Đẩy thẳng ra ngoài bán kính
			local radius = math.max(dangerPart.Size.X, dangerPart.Size.Z) / 2
			local diff = Vector3.new(playerPos.X - dangerPart.Position.X, 0, playerPos.Z - dangerPart.Position.Z)
			local dir = diff.Magnitude > 0.1 and diff.Unit or Vector3.new(0, 0, 1)
			local directWorld = dangerPart.Position + dir * (radius + ESCAPE_MARGIN)
			local snapped, hasFloor = geometry.GetFloorPosition(directWorld)

			if hasFloor and not geometry.IsPointInAnyHazard(snapped) then
				candidatePos = snapped
			end
		else
			-- A2. Chiêu hình chữ nhật / OBB: Thoát ngang 90 độ theo cạnh hẹp nhất
			local localPos = dangerPart.CFrame:PointToObjectSpace(playerPos)
			local halfX = dangerPart.Size.X / 2
			local halfZ = dangerPart.Size.Z / 2
			local targetLocal = nil

			if halfX <= halfZ then
				-- Cạnh X hẹp hơn -> Thoát ngang theo trục X
				local sign = (localPos.X >= 0) and 1 or -1
				targetLocal = Vector3.new(sign * (halfX + ESCAPE_MARGIN), 0, localPos.Z)
			else
				-- Cạnh Z hẹp hơn -> Thoát ngang theo trục Z
				local sign = (localPos.Z >= 0) and 1 or -1
				targetLocal = Vector3.new(localPos.X, 0, sign * (halfZ + ESCAPE_MARGIN))
			end

			local directWorld = dangerPart.CFrame:PointToWorldSpace(targetLocal)
			local snapped, hasFloor = geometry.GetFloorPosition(directWorld)

			if hasFloor and not geometry.IsPointInAnyHazard(snapped) then
				candidatePos = snapped
			end
		end

		-- 4. Chiến lược B: Lưới Tỏa Tròn (Radial Grid Search Fallback nếu thoát trực tiếp bị vướng)
		if not candidatePos then
			local bestPos = nil
			local bestDist = math.huge

			for _, dist in ipairs(RADIAL_DISTANCES) do
				for _, angleDeg in ipairs(RADIAL_ANGLES) do
					local rad = math.rad(angleDeg)
					local offset = Vector3.new(math.cos(rad) * dist, 0, math.sin(rad) * dist)
					local testWorld = playerPos + offset
					local snapped, hasFloor = geometry.GetFloorPosition(testWorld)

					if hasFloor and not geometry.IsPointInAnyHazard(snapped) then
						local moveDist = (snapped - playerPos).Magnitude
						if moveDist < bestDist then
							bestDist = moveDist
							bestPos = snapped
						end
					end
				end
				if bestPos then break end -- Ưu tiên vòng bán kính nhỏ nhất trước
			end

			candidatePos = bestPos
		end
	end

	if candidatePos then
		lockedSafeSpot = candidatePos
		local escapeDist = math.floor((candidatePos - playerPos).Magnitude * 10) / 10
		return true, candidatePos, hazardName, escapeDist
	end

	lockedSafeSpot = nil
	return true, nil, hazardName, 0
end

return safeSpot