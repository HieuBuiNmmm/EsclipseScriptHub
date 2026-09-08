-- Smart Dodge – Module 2: Geometry & Hazard Hit-testing (DungeonQuest).
-- Các "thuật toán chấm điểm": isPointInPart (OBB), ring bán nguyệt phân cực, hành lang
-- projectile, isPointInAnyHazard, getFloorPosition. Data hiểm họa được Engine bơm vào qua
-- BindDetection (đứt vòng phụ thuộc detection -> geometry), nên module thuần số học + logic.

--// References
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

--// State
local playerHitboxPadding = 1.8     -- Bù trừ bán kính cơ thể nhân vật (studs) để phát hiện khi chạm mép
local RAYCAST_DOWN_DIST = 150       -- Khoảng cách bắn raycast xuống mặt đất (studs) - đủ sâu để bắt sàn từ độ cao của Boss
local MAX_HEIGHT_TOLERANCE = 150.0  -- Chiêu trong Dungeon Quest gây sát thương toàn bộ cột không gian X-Z bất kể độ cao

--// Data source hiểm họa do Engine bơm vào (tránh require trực tiếp detection — đứt vòng phụ thuộc).
local data = nil

local geometry = {}

function geometry.BindDetection(dataSource)
	data = dataSource or nil
end

local function det()
	return data
end

function geometry.GetHitboxPadding()
	return playerHitboxPadding
end

function geometry.SetHitboxPadding(value)
	if type(value) == "number" and value >= 0 then
		playerHitboxPadding = value
	end
end

--// Raycast Parameters dùng chung
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Exclude
raycastParams.IgnoreWater = true

local cachedIgnoreList = {}
local lastFilterRebuildTime = 0

local function updateRaycastFilter(force)
	local now = os.clock()
	if not force and (now - lastFilterRebuildTime < 0.25) then
		return
	end
	lastFilterRebuildTime = now

	table.clear(cachedIgnoreList)
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Character then table.insert(cachedIgnoreList, p.Character) end
	end
	if Workspace:FindFirstChild("RaycastIgnore") then
		table.insert(cachedIgnoreList, Workspace.RaycastIgnore)
	end
	for inst in pairs(det().GetActiveHazardsMap()) do
		table.insert(cachedIgnoreList, inst)
	end
	raycastParams.FilterDescendantsInstances = cachedIgnoreList
end

local player = Players.LocalPlayer

--// Bắn raycast kiểm tra sàn nhà và snap tọa độ xuống mặt đất
function geometry.GetFloorPosition(pos)
	updateRaycastFilter(false)

	local rayOrigin = Vector3.new(pos.X, pos.Y + 10, pos.Z)
	local rayDir = Vector3.new(0, -RAYCAST_DOWN_DIST, 0)
	local result = Workspace:Raycast(rayOrigin, rayDir, raycastParams)

	if result and result.Position then
		return Vector3.new(pos.X, result.Position.Y + 3, pos.Z), true
	end
	return pos, false
end

--// Bắn raycast kiểm tra sàn nhà và trả về cao độ Y thực tế của mặt sàn (không cộng offset +3)
function geometry.GetRawFloorY(pos)
	updateRaycastFilter(false)

	local rayOrigin = Vector3.new(pos.X, pos.Y + 12, pos.Z)
	local rayDir = Vector3.new(0, -RAYCAST_DOWN_DIST, 0)
	local result = Workspace:Raycast(rayOrigin, rayDir, raycastParams)

	if result and result.Position then
		return result.Position.Y, true
	end

	-- Fallback kiểm tra dưới chân Player
	local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if rootPart then
		local pOrigin = Vector3.new(pos.X, rootPart.Position.Y + 8, pos.Z)
		local pResult = Workspace:Raycast(pOrigin, rayDir, raycastParams)
		if pResult and pResult.Position then
			return pResult.Position.Y, true
		end
		return rootPart.Position.Y - 2.8, false
	end

	return pos.Y, false
end

--// Kiểm tra xem điểm P có nằm trong hành lang quỹ đạo của một Projectile Part không
function geometry.IsPointInTrajectory(point, part)
	local det = det()
	local data = det.GetLockedProjectiles()[part]
	if not data then
		data = det.LockTrajectoryForPart and det.LockTrajectoryForPart(part)
	end
	if not data then return false end

	local origin = part.Position
	local forward = data.forward2D
	local maxDist = data.maxLookahead
	local radius = data.dangerRadius

	local toPoint = point - origin
	local toPoint2D = Vector3.new(toPoint.X, 0, toPoint.Z)
	local dotForward = toPoint2D:Dot(forward)

	if data.config and data.config.isDynamicMoving then
		-- Với Dynamic Moving Beam (vùng màu cam di động quét sàn thời gian thực):
		-- Giới hạn chiều sâu từ phía sau beam -4 studs đến trước beam +maxDist
		if dotForward < -4 or dotForward > (maxDist + 2) then
			return false
		end

		local projOnAxis = forward * dotForward
		local perpVec = toPoint2D - projOnAxis
		local perpDist = perpVec.Magnitude

		local checkY = data.lockedVisualY or (data.rawFloorY and (data.rawFloorY + 2.8)) or origin.Y
		local heightDiff = math.abs(point.Y - checkY)
		if heightDiff > MAX_HEIGHT_TOLERANCE then
			return false
		end

		if perpDist <= (radius + playerHitboxPadding) then
			return true, perpDist, radius, forward, origin, maxDist
		end
		return false
	end

	-- Điểm P phải nằm trong khoảng từ ngay sau đạn (-radius) tới hết tầm maxDist
	if dotForward < -radius or dotForward > maxDist then
		return false
	end

	local projOnAxis = forward * dotForward
	local perpVec = toPoint2D - projOnAxis
	local perpDist = perpVec.Magnitude

	-- Kiểm tra độ cao Y theo độ cao sàn đã khóa (Raw Floor Y) của chiêu
	local checkY = data.rawFloorY and (data.rawFloorY + 2.8) or origin.Y
	local heightDiff = math.abs(point.Y - checkY)
	if heightDiff > MAX_HEIGHT_TOLERANCE then
		return false
	end

	if perpDist <= (radius + playerHitboxPadding) then
		return true, perpDist, radius, forward, origin, maxDist
	end

	return false
end

--// Kiểm tra xem một điểm P có nằm trong phạm vi sát thương của một BasePart không
function geometry.IsPointInPart(point, part)
	if not part or not part:IsA("BasePart") or not part.Parent or det().IsIgnoredPart(part) then
		return false
	end

	-- 1. Dạng hình cầu / hình trụ (Circle / Ball / Cylinder AoE)
	if part:IsA("Part") and (part.Shape == Enum.PartType.Ball or part.Shape == Enum.PartType.Cylinder) then
		local radius = math.max(part.Size.X, part.Size.Z) / 2 + playerHitboxPadding
		local dX = point.X - part.Position.X
		local dZ = point.Z - part.Position.Z
		local distSq = dX * dX + dZ * dZ
		local heightDiff = math.abs(point.Y - part.Position.Y)
		return (distSq <= radius * radius) and (heightDiff <= MAX_HEIGHT_TOLERANCE)
	end

	-- 2. Dạng Moving Beam (secondBossMovingBeam) xoay lộn quanh trục X:
	local isMovingBeam = part.Name:lower():find("movingbeam") or (part.Parent and part.Parent.Name:lower():find("movingbeam"))
	if isMovingBeam then
		local localPos = part.CFrame:PointToObjectSpace(point)
		-- Chiều dài thanh beam dọc theo trục X (vùng sải ngang quét qua phòng):
		local halfLength = math.max(part.Size.X, part.Size.Z) / 2 + playerHitboxPadding
		-- Bán kính tiết diện xoay quanh trục X (đường kính thanh beam):
		local beamRadius = math.max(part.Size.Y, math.min(part.Size.X, part.Size.Z)) / 2 + playerHitboxPadding
		if beamRadius < 3.5 then beamRadius = 3.5 end

		-- Khoảng cách vuông góc với trục beam trong mặt phẳng Y-Z (miễn nhiễm với góc xoay lộn quanh trục X):
		local radialDistSq = localPos.Y * localPos.Y + localPos.Z * localPos.Z
		local heightDiff = math.abs(point.Y - part.Position.Y)

		return (math.abs(localPos.X) <= halfLength)
			and (radialDistSq <= (beamRadius + 1.5) * (beamRadius + 1.5))
			and (heightDiff <= MAX_HEIGHT_TOLERANCE)
	end

	-- 3. Dạng hình chữ nhật / hộp có hướng (Oriented Bounding Box - OBB)
	local localPos = part.CFrame:PointToObjectSpace(point)
	local halfX = part.Size.X / 2 + playerHitboxPadding
	local halfZ = part.Size.Z / 2 + playerHitboxPadding
	local halfY = math.max(MAX_HEIGHT_TOLERANCE, part.Size.Y / 2 + 5)

	return math.abs(localPos.X) <= halfX
		and math.abs(localPos.Z) <= halfZ
		and math.abs(localPos.Y) <= halfY
end

--// Kiểm tra xem một điểm P có nằm trong vành khuyên / bán nguyệt của một UnionOperation 'ring' không
function geometry.IsPointInRingPart(point, ringPart)
	if not ringPart or not ringPart:IsA("BasePart") or not ringPart.Parent or det().IsIgnoredPart(ringPart) then
		return false
	end

	-- 1. Xác định tâm thực của cả Model (Center Part)
	local centerPart = ringPart.Parent:FindFirstChild("center")
		or ringPart.Parent:FindFirstChild("Center")
		or ringPart.Parent.PrimaryPart
	local centerPos = centerPart and centerPart.Position or ringPart.Position

	-- 2. Kiểm tra độ cao Y
	local heightDiff = math.abs(point.Y - centerPos.Y)
	if heightDiff > MAX_HEIGHT_TOLERANCE then
		return false
	end

	-- 3. Đưa tọa độ điểm P và vị trí Ring về mặt phẳng 2D (X-Z)
	local diffX = point.X - centerPos.X
	local diffZ = point.Z - centerPos.Z
	local r = math.sqrt(diffX * diffX + diffZ * diffZ)

	-- 4. Bán kính ngoài thực tế của Ring từ kích thước Size.Z (Size = Diameter x Height x Radius)
	local radiusOuter = ringPart.Size.Z
	if radiusOuter < 1 then
		radiusOuter = math.max(ringPart.Size.X, ringPart.Size.Z) / 2
	end

	-- Bề dày dải Cyan: 12.5 studs cho các ring 1-6 (Size.X: 50, 75, 100, 125, 150, 175) và 17.5 studs cho ring 7 (Size.X: 210)
	local bandThickness = (radiusOuter > 90) and 18.0 or 13.0
	local radiusInner = math.max(0, radiusOuter - bandThickness)

	-- 5. Kiểm tra khoảng rỗng ở giữa: Nếu r nằm trong lỗ trống -> AN TOÀN!
	if r < radiusInner - playerHitboxPadding then
		return false
	end

	-- 6. Nếu r vượt quá bán kính ngoài -> Nằm ngoài Ring này
	if r > radiusOuter + playerHitboxPadding then
		return false
	end

	-- 7. Kiểm tra hướng bán nguyệt bằng Tích Vô Hướng (Vector Dot Product):
	local offX = ringPart.Position.X - centerPos.X
	local offZ = ringPart.Position.Z - centerPos.Z
	local offMag = math.sqrt(offX * offX + offZ * offZ)

	if offMag > 0.5 then
		local dirUnitX = offX / offMag
		local dirUnitZ = offZ / offMag
		local dot = (diffX * dirUnitX) + (diffZ * dirUnitZ)

		-- Nếu dot < -playerHitboxPadding -> Nằm ở nửa đối diện (Khoảng đất trống an toàn 100%)
		if dot < -playerHitboxPadding then
			return false
		end
	end

	return true, r, radiusInner, radiusOuter, centerPos, ringPart.CFrame
end

--// Kiểm tra xem điểm P có bị dính bất kỳ vòng nào trong Model thirdBossMultiRings không
function geometry.IsPointInThirdBossMultiRings(point, hazardInfo)
	if not hazardInfo or not hazardInfo.Instance or not hazardInfo.Instance.Parent then
		return false, nil
	end

	local fadeThreshold = det().GetFadeThreshold()

	if hazardInfo.ActiveParts then
		for part in pairs(hazardInfo.ActiveParts) do
			if part and part.Parent and part:IsA("BasePart") and part.Transparency < fadeThreshold then
				local inRing = geometry.IsPointInRingPart(point, part)
				if inRing then
					return true, part
				end
			end
		end
	end

	return false, nil
end

--// Kiểm tra xem điểm P có nằm trong vùng nguy hiểm của Model secondBossMovingBeam không
function geometry.IsPointInSecondBossMovingBeam(point, hazardInfo)
	if not hazardInfo or not hazardInfo.Instance or not hazardInfo.Instance.Parent then
		return false, nil, nil
	end

	local inst = hazardInfo.Instance
	local det = det()
	local trajData = det.GetLockedProjectiles()[inst]
	if not trajData then
		return false, nil, nil
	end

	local primary = inst:IsA("Model") and (inst.PrimaryPart or inst:FindFirstChildWhichIsA("BasePart"))
	local curPos = (primary and primary.Position) or (inst:IsA("Model") and select(1, inst:GetBoundingBox()).Position) or inst.Position

	local forward = trajData.forward2D or Vector3.new(0, 0, -1)
	local radius = trajData.dangerRadius or 25.0
	local maxDist = trajData.maxLookahead or 50.0

	local toPoint = point - curPos
	local toPoint2D = Vector3.new(toPoint.X, 0, toPoint.Z)
	local dotForward = toPoint2D:Dot(forward)

	-- Chiều sâu tịnh tiến: từ sau beam -4 studs đến trước beam +maxDist
	if dotForward < -4 or dotForward > (maxDist + 2) then
		return false, nil, nil
	end

	local projOnAxis = forward * dotForward
	local perpVec = toPoint2D - projOnAxis
	local perpDist = perpVec.Magnitude

	local checkY = trajData.lockedVisualY or curPos.Y
	local heightDiff = math.abs(point.Y - checkY)
	if heightDiff > MAX_HEIGHT_TOLERANCE then
		return false, nil, nil
	end

	if perpDist <= (radius + playerHitboxPadding) then
		local hitPart = primary or inst:FindFirstChildWhichIsA("BasePart")
		local foundTraj = {
			isTrajectory = true,
			isDynamicMoving = true,
			perpDist = perpDist,
			dangerRadius = radius,
			forward2D = forward,
			originPos = curPos,
			maxLookahead = maxDist,
		}
		return true, hitPart, foundTraj
	end

	return false, nil, nil
end

--// Kiểm tra xem một điểm P có đang bị dính bất kỳ mối nguy hiểm nào không
function geometry.IsPointInAnyHazard(point, ignoredInstance)
	local det = det()
	local bestDistSq = math.huge
	local foundInfo, foundPart = nil, nil
	local foundTraj = nil

	for _, info in pairs(det.GetActiveHazardsMap()) do
		if ignoredInstance then
			if info.Instance == ignoredInstance
				or (info.Instance and info.Instance.Name == ignoredInstance.Name)
				or (info.Name and info.Name == ignoredInstance.Name) then
				continue
			end
		end

		local isMultiRings = info.Name and info.Name:lower():find("multiring") ~= nil
		local isMovingBeam = info.Instance and info.Instance:IsA("Model") and (
			(info.Name and info.Name:lower():find("movingbeam") ~= nil)
			or (info.Instance.Name and info.Instance.Name:lower():find("movingbeam") ~= nil)
		)

		if isMultiRings then
			-- ÁP DỤNG THỬ NGHIỆM 2: Giải Tích Tọa Độ Cực (Polar Annulus) RIÊNG CHO thirdBossMultiRings
			local inRing, hitPart = geometry.IsPointInThirdBossMultiRings(point, info)
			if inRing then
				local distSq = (point - hitPart.Position).Magnitude
				if distSq < bestDistSq then
					bestDistSq = distSq
					foundInfo = info
					foundPart = hitPart
					foundTraj = nil
				end
			end
		elseif isMovingBeam then
			-- ÁP DỤNG XỬ LÝ CẤP MODEL CHO secondBossMovingBeam (TIẾP CẬN 2)
			local inBeam, hitPart, trajData = geometry.IsPointInSecondBossMovingBeam(point, info)
			if inBeam then
				local distSq = (point - (hitPart and hitPart.Position or info.Instance.Position)).Magnitude
				if distSq < bestDistSq then
					bestDistSq = distSq
					foundInfo = info
					foundPart = hitPart or info.Instance
					foundTraj = trajData
				end
			end
		elseif info.ActiveParts then
			for part in pairs(info.ActiveParts) do
				if ignoredInstance and (part == ignoredInstance or part.Name == ignoredInstance.Name) then
					continue
				end
				local trajConfig = det.GetTrajectoryConfigForPart(part)
				if trajConfig then
					local inTraj, perpDist, radius, forward, origin, maxDist = geometry.IsPointInTrajectory(point, part)
					if inTraj then
						local distSq = (point - part.Position).Magnitude
						if distSq < bestDistSq then
							bestDistSq = distSq
							foundInfo = info
							foundPart = part
							foundTraj = {
								isTrajectory = true,
								perpDist = perpDist,
								dangerRadius = radius,
								forward2D = forward,
								originPos = origin,
								maxLookahead = maxDist,
							}
						end
					end
				else
					-- Các skill khác dùng OBB / Radius thông thường
					if geometry.IsPointInPart(point, part) then
						local distSq = (point - part.Position).Magnitude
						if distSq < bestDistSq then
							bestDistSq = distSq
							foundInfo = info
							foundPart = part
							foundTraj = nil
						end
					end
				end
			end
		end
	end

	if foundPart then
		return true, foundInfo, foundPart, foundTraj
	end
	return false, nil, nil, nil
end

--// Kiểm tra xem một đĩa tròn quanh điểm P có hoàn toàn an toàn (không chạm bất kỳ hazard nào) không
--// Cấu hình Cân Bằng (Balanced): Kiểm tra tâm (fast reject) + 4 hướng chính ở bán kính safeRadius
local CHECK_OFFSETS_4 = {
	Vector3.new(1, 0, 0),
	Vector3.new(-1, 0, 0),
	Vector3.new(0, 0, 1),
	Vector3.new(0, 0, -1),
}

function geometry.IsSpotFullySafe(centerPoint, safeRadius, ignoredInstance)
	if not centerPoint then return false end
	safeRadius = safeRadius or 0.5

	-- 1. Kiểm tra chính tâm điểm P (Loại bỏ ngay 90% điểm không hợp lệ mà không tốn thêm CPU)
	if geometry.IsPointInAnyHazard(centerPoint, ignoredInstance) then
		return false
	end

	-- 2. Kiểm tra 4 hướng chính ở chu vi an toàn
	for _, off in ipairs(CHECK_OFFSETS_4) do
		local sample = centerPoint + (off * safeRadius)
		if geometry.IsPointInAnyHazard(sample, ignoredInstance) then
			return false
		end
	end

	return true
end

--// Lấy danh sách tất cả các Hazard Instance đang bao phủ điểm P (hỗ trợ nhiều chiêu đè nhau)
function geometry.GetAllHazardsAtPoint(point)
	local det = det()
	local hazardsSet = {}
	local count = 0

	for _, info in pairs(det.GetActiveHazardsMap()) do
		local isMultiRings = info.Name and info.Name:lower():find("multiring") ~= nil
		if isMultiRings then
			local inRing, hitPart = geometry.IsPointInThirdBossMultiRings(point, info)
			if inRing then
				hazardsSet[hitPart] = true
				if info.Instance then hazardsSet[info.Instance] = true end
				count = count + 1
			end
		elseif info.Instance and info.Instance:IsA("Model") and (
			(info.Name and info.Name:lower():find("movingbeam") ~= nil)
			or (info.Instance.Name and info.Instance.Name:lower():find("movingbeam") ~= nil)
		) then
			local inBeam, hitPart = geometry.IsPointInSecondBossMovingBeam(point, info)
			if inBeam then
				hazardsSet[hitPart or info.Instance] = true
				if info.Instance then hazardsSet[info.Instance] = true end
				count = count + 1
			end
		elseif info.ActiveParts then
			for part in pairs(info.ActiveParts) do
				local trajConfig = det.GetTrajectoryConfigForPart(part)
				if trajConfig then
					local inTraj = geometry.IsPointInTrajectory(point, part)
					if inTraj then
						hazardsSet[part] = true
						if info.Instance then hazardsSet[info.Instance] = true end
						if part.Parent and part.Parent ~= Workspace then hazardsSet[part.Parent] = true end
						count = count + 1
					end
				else
					if geometry.IsPointInPart(point, part) then
						hazardsSet[part] = true
						if info.Instance then hazardsSet[info.Instance] = true end
						if part.Parent and part.Parent ~= Workspace then hazardsSet[part.Parent] = true end
						count = count + 1
					end
				end
			end
		end
	end

	return hazardsSet, count
end

--// Kiểm tra xem đoạn đường di chuyển từ fromPos -> toPos có an toàn không (Path Clearance)
--// currentHazardsSet: tập hợp các Hazard mà người chơi ĐANG ĐỨNG TRONG (được phép băng qua để thoát ra)
function geometry.IsPathSafe(fromPos, toPos, currentHazardsSet, fallbackCurrentDangerPart, ignoredInstance)
	local dist = (toPos - fromPos).Magnitude
	if dist <= 1.2 then
		return true -- Chỉ bỏ qua bước cực ngắn <= 1.2 studs
	end

	-- Bước chia mẫu 1.5 studs (vừa khít nhỏ hơn hitbox 2.2 studs, số bước tối đa 8 để không gây giật lag)
	local steps = math.clamp(math.ceil(dist / 1.5), 2, 8)
	for i = 1, steps - 1 do
		local t = i / steps
		local samplePos = fromPos:Lerp(toPos, t)
		local inDanger, hitInfo, hitPart, hitTraj = geometry.IsPointInAnyHazard(samplePos, ignoredInstance)
		if inDanger then
			-- 1. Nếu trúng đạn bắn (Projectile Trajectory) đang bay -> Tuyệt đối không băng qua
			if hitTraj and hitTraj.isTrajectory then
				return false
			end
			-- 2. Nếu trúng một Hazard MỚI mà người chơi KHÔNG đứng trong đó -> Bị cản đường, từ chối ngay
			local hitInst = (hitInfo and hitInfo.Instance)
			local hitParent = hitPart and hitPart.Parent

			if currentHazardsSet and next(currentHazardsSet) ~= nil then
				local isKnown = (hitPart and currentHazardsSet[hitPart])
					or (hitInst and currentHazardsSet[hitInst])
					or (hitParent and currentHazardsSet[hitParent])
				if not isKnown then
					return false
				end
			elseif fallbackCurrentDangerPart then
				local currentInst = fallbackCurrentDangerPart:IsA("Model") and fallbackCurrentDangerPart or fallbackCurrentDangerPart.Parent
				local isKnown = (hitPart and hitPart == fallbackCurrentDangerPart)
					or (currentInst and hitInst and currentInst == hitInst)
					or (currentInst and hitParent and currentInst == hitParent)
				if not isKnown then
					return false
				end
			else
				return false
			end
		end
	end
	return true
end

return geometry