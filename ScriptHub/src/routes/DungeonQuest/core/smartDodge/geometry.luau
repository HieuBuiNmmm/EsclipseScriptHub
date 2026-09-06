-- Smart Dodge – Module 2: Geometry & Hazard Hit-testing (DungeonQuest).
-- Các "thuật toán chấm điểm": isPointInPart (OBB), ring bán nguyệt phân cực, hành lang
-- projectile, isPointInAnyHazard, getFloorPosition. Data hiểm họa được Engine bơm vào qua
-- BindDetection (đứt vòng phụ thuộc detection -> geometry), nên module thuần số học + logic.

--// References
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

--// State
local playerHitboxPadding = 2.2     -- Bù trừ bán kính cơ thể nhân vật (studs) để phát hiện khi chạm mép
local RAYCAST_DOWN_DIST = 25        -- Khoảng cách bắn raycast xuống mặt đất (studs)

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

--// Bắn raycast kiểm tra sàn nhà và snap tọa độ xuống mặt đất
function geometry.GetFloorPosition(pos)
	local ignoreList = {}
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Character then table.insert(ignoreList, p.Character) end
	end
	if Workspace:FindFirstChild("RaycastIgnore") then
		table.insert(ignoreList, Workspace.RaycastIgnore)
	end
	--// (Refactor) Marker "SmartDodge_SafeMarker" không cần filter: CanQuery=false nên raycast
	--// không bao giờ trúng — tên cũng đã chứa "SmartDodge" để lọc ở các chỗ khác.
	for inst in pairs(det().GetActiveHazardsMap()) do
		table.insert(ignoreList, inst)
	end
	raycastParams.FilterDescendantsInstances = ignoreList

	local rayOrigin = Vector3.new(pos.X, pos.Y + 6, pos.Z)
	local rayDir = Vector3.new(0, -RAYCAST_DOWN_DIST, 0)
	local result = Workspace:Raycast(rayOrigin, rayDir, raycastParams)

	if result and result.Position then
		return Vector3.new(pos.X, result.Position.Y + 3, pos.Z), true
	end
	return pos, false
end

--// Kiểm tra xem điểm P có nằm trong hành lang quỹ đạo của một Projectile Part không
function geometry.IsPointInTrajectory(point, part)
	local det = det()
	local data = det.GetLockedProjectiles()[part]
	if not data then
		data = det.LockTrajectoryForPart(part)
	end
	if not data then return false end

	local origin = part.Position
	local forward = data.forward2D
	local maxDist = data.maxLookahead
	local radius = data.dangerRadius

	local toPoint = point - origin
	local toPoint2D = Vector3.new(toPoint.X, 0, toPoint.Z)
	local dotForward = toPoint2D:Dot(forward)

	-- Điểm P phải nằm trong khoảng từ ngay sau đạn (-radius) tới hết tầm maxDist
	if dotForward < -radius or dotForward > maxDist then
		return false
	end

	local projOnAxis = forward * dotForward
	local perpVec = toPoint2D - projOnAxis
	local perpDist = perpVec.Magnitude

	-- Kiểm tra độ cao Y
	local heightDiff = math.abs(point.Y - origin.Y)
	if heightDiff > 14 then
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
		return (distSq <= radius * radius) and (heightDiff <= math.max(10, part.Size.Y / 2 + 5))
	end

	-- 2. Dạng hình chữ nhật / hộp có hướng (Oriented Bounding Box - OBB)
	local localPos = part.CFrame:PointToObjectSpace(point)
	local halfX = part.Size.X / 2 + playerHitboxPadding
	local halfZ = part.Size.Z / 2 + playerHitboxPadding
	local halfY = math.max(8, part.Size.Y / 2 + 5)

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
	if heightDiff > math.max(14, ringPart.Size.Y / 2 + 8) then
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

--// Kiểm tra xem một điểm P có đang bị dính bất kỳ mối nguy hiểm nào không
function geometry.IsPointInAnyHazard(point)
	local det = det()
	local bestDistSq = math.huge
	local foundInfo, foundPart = nil, nil
	local foundTraj = nil

	for _, info in pairs(det.GetActiveHazardsMap()) do
		local isMultiRings = info.Name and info.Name:lower():find("multiring") ~= nil

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
		elseif info.ActiveParts then
			for part in pairs(info.ActiveParts) do
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
				local inst = info.Instance or (hitPart and hitPart.Parent)
				if inst then
					hazardsSet[inst] = true
					count = count + 1
				end
			end
		elseif info.ActiveParts then
			for part in pairs(info.ActiveParts) do
				local trajConfig = det.GetTrajectoryConfigForPart(part)
				if trajConfig then
					local inTraj = geometry.IsPointInTrajectory(point, part)
					if inTraj then
						local inst = info.Instance or part
						hazardsSet[inst] = true
						count = count + 1
						break
					end
				else
					if geometry.IsPointInPart(point, part) then
						local inst = info.Instance or (part:IsA("Model") and part or part.Parent)
						hazardsSet[inst] = true
						count = count + 1
						break
					end
				end
			end
		end
	end

	return hazardsSet, count
end

--// Kiểm tra xem đoạn đường di chuyển từ fromPos -> toPos có an toàn không (Path Clearance)
--// currentHazardsSet: tập hợp các Hazard mà người chơi ĐANG ĐỨNG TRONG (được phép băng qua để thoát ra)
function geometry.IsPathSafe(fromPos, toPos, currentHazardsSet, fallbackCurrentDangerPart)
	local dist = (toPos - fromPos).Magnitude
	if dist <= 4.0 then
		return true -- Bước ngắn / Instant Snap an toàn
	end

	local steps = math.clamp(math.floor(dist / 3.0), 2, 5)
	for i = 1, steps - 1 do
		local t = i / steps
		local samplePos = fromPos:Lerp(toPos, t)
		local inDanger, hitInfo, hitPart, hitTraj = geometry.IsPointInAnyHazard(samplePos)
		if inDanger then
			-- 1. Nếu trúng đạn bắn (Projectile Trajectory) đang bay -> Tuyệt đối không băng qua
			if hitTraj and hitTraj.isTrajectory then
				return false
			end
			-- 2. Nếu trúng một Hazard MỚI mà người chơi KHÔNG đứng trong đó -> Bị cản đường
			local hitInst = (hitInfo and hitInfo.Instance)
				or (hitPart and (hitPart:IsA("Model") and hitPart or hitPart.Parent))

			if currentHazardsSet and next(currentHazardsSet) ~= nil then
				if hitInst and not currentHazardsSet[hitInst] then
					return false
				end
			elseif fallbackCurrentDangerPart then
				local currentInst = fallbackCurrentDangerPart:IsA("Model") and fallbackCurrentDangerPart or fallbackCurrentDangerPart.Parent
				if currentInst and hitInst and currentInst ~= hitInst then
					return false
				end
			end
		end
	end
	return true
end

return geometry