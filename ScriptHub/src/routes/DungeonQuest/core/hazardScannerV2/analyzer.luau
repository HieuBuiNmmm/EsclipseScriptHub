-- HazardScannerV2 - Shape & Color Analyzer
-- Trích xuất hình học chính xác (Circle / Box OBB) và Màu sắc phát sáng Neon thực tế từ Part.

--// Imports
local filter = require("@routes/DungeonQuest/core/hazardScannerV2/filter")
local corridor = require("@routes/DungeonQuest/core/hazardScannerV2/corridor")

--// Table
local analyzer = {}

-- Chuyển đổi Color3 sang mã màu Hex cho Web Canvas
local function colorToHex(color)
	if not color then return "#ff2a55" end
	local r = math.clamp(math.floor(color.R * 255), 0, 255)
	local g = math.clamp(math.floor(color.G * 255), 0, 255)
	local b = math.clamp(math.floor(color.B * 255), 0, 255)
	return string.format("#%02x%02x%02x", r, g, b)
end

-- Lấy góc hướng Yaw chuẩn (0° = North/-Z, +90° = East/+X, 180° = South/+Z, -90° = West/-X)
local function getYawDegrees(cf)
	if not cf then return 0 end
	local lv = cf.LookVector
	if not lv or lv.Magnitude < 0.001 then return 0 end
	return math.deg(math.atan2(lv.X, -lv.Z))
end

-- Ground-Truth Data từ Dungeon Quest Studio (image2.png):
-- Core: R = 12.5 studs (Diameter 25 studs)
-- Ring 1: R_in = 12.5, R_out = 25.0, YawOffset = 180° (Side B)
-- Ring 2: R_in = 25.0, R_out = 37.5, YawOffset = 0°   (Side A)
-- Ring 3: R_in = 37.5, R_out = 50.0, YawOffset = 180° (Side B)
-- Ring 4: R_in = 50.0, R_out = 62.5, YawOffset = 0°   (Side A)
-- Ring 5: R_in = 62.5, R_out = 75.0, YawOffset = 180° (Side B)
-- Ring 6: R_in = 75.0, R_out = 87.5, YawOffset = 0°   (Side A)
-- Ring 7: R_in = 87.5, R_out = 105.0, YawOffset = 180° (Side B)
local MULTI_RINGS_GROUND_TRUTH = {
	coreRadius = 12.5,
	maxRadius = 105.0,
	rings = {
		{ rIn = 12.5, rOut = 25.0, yawOffset = 180, side = 1 },
		{ rIn = 25.0, rOut = 37.5, yawOffset = 0,   side = 0 },
		{ rIn = 37.5, rOut = 50.0, yawOffset = 180, side = 1 },
		{ rIn = 50.0, rOut = 62.5, yawOffset = 0,   side = 0 },
		{ rIn = 62.5, rOut = 75.0, yawOffset = 180, side = 1 },
		{ rIn = 75.0, rOut = 87.5, yawOffset = 0,   side = 0 },
		{ rIn = 87.5, rOut = 105.0, yawOffset = 180, side = 1 },
	}
}

-- Rời rạc hóa (tessellation) một cung tròn thành Đa giác Polygon (mảng đỉnh 2D x, z)
local function generateArcPolygon(cx, cz, rIn, rOut, centerYaw, angleSpan, steps)
	steps = steps or 12
	local vertices = {}
	local halfSpan = (angleSpan or 180) / 2
	local startDeg = centerYaw - halfSpan
	local endDeg = centerYaw + halfSpan
	local startRad = math.rad(startDeg)
	local endRad = math.rad(endDeg)
	local span = endRad - startRad

	-- Đi dọc theo cung ngoài (Outer Arc)
	for i = 0, steps do
		local a = startRad + (span * (i / steps))
		local x = cx + math.sin(a) * rOut
		local z = cz - math.cos(a) * rOut
		table.insert(vertices, { x = x, z = z })
	end

	-- Đi ngược lại dọc theo cung trong (Inner Arc)
	for i = steps, 0, -1 do
		local a = startRad + (span * (i / steps))
		local x = cx + math.sin(a) * rIn
		local z = cz - math.cos(a) * rIn
		table.insert(vertices, { x = x, z = z })
	end

	return vertices
end

-- Rời rạc hóa vòng tròn tâm thành Polygon
local function generateCirclePolygon(cx, cz, radius, steps)
	steps = steps or 16
	local vertices = {}
	for i = 0, steps - 1 do
		local a = (math.pi * 2) * (i / steps)
		local x = cx + math.sin(a) * radius
		local z = cz - math.cos(a) * radius
		table.insert(vertices, { x = x, z = z })
	end
	return vertices
end

-- Phân tích 1 Hazard Part đơn lẻ thành dạng hình học 2D chuẩn xác
local function analyzeHazardPartInternal(part, motionRecord)
	if not part or not part:IsA("BasePart") or not part.Parent then
		return nil
	end

	local size = part.Size
	local cf = part.CFrame
	local pos = cf.Position
	local yaw = getYawDegrees(cf)
	local hexColor = colorToHex(part.Color)

	-- Xử lý màu riêng cho bonusBossSweepingFlames (Lửa cam neon rực rỡ)
	if filter.IsSweepingFlames(part) or (part.Parent and filter.IsSweepingFlames(part.Parent)) or (part.Parent and part.Parent.Parent and filter.IsSweepingFlames(part.Parent.Parent)) then
		hexColor = "#ff6b22"
	end

	-- Xử lý màu riêng cho bonusBossMemoryModel (Good = Xanh lá #22ff88, Danger/Hitbox = Đỏ #ff2a55)
	if filter.IsMemoryModel(part) or (part.Parent and filter.IsMemoryModel(part.Parent)) then
		local pLower = part.Name:lower()
		if pLower:find("good") then
			hexColor = "#22ff88"
		else
			hexColor = "#ff2a55"
		end
	end

	-- Xử lý scale nếu có SpecialMesh
	local mesh = part:FindFirstChildWhichIsA("SpecialMesh", true)
	if mesh then
		local sx = math.abs(mesh.Scale.X)
		local sy = math.abs(mesh.Scale.Y)
		local sz = math.abs(mesh.Scale.Z)
		size = Vector3.new(size.X * sx, size.Y * sy, size.Z * sz)
	end

	-- 0. Nhận diện thirdBossMultiRings (Đại diện bằng Part 'center' hoặc Model)
	local pName = part.Name:lower()
	local parentName = (part.Parent and part.Parent.Name:lower()) or ""
	local isMultiRingSkill = filter.IsMultiRing(part) or filter.IsMultiRing(part.Parent) or (pName == "center" and string.find(parentName, "ring") ~= nil)

	if isMultiRingSkill then
		local centerPos = pos
		local centerPart = part
		local model = (part.Parent and part.Parent:IsA("Model")) and part.Parent or nil

		if model then
			local cObj = model:FindFirstChild("center", true)
			if cObj and cObj:IsA("BasePart") then
				centerPos = cObj.Position
				centerPart = cObj
			end
		end

		local skillYaw = yaw
		if centerPart and centerPart.CFrame then
			skillYaw = (getYawDegrees(centerPart.CFrame) + 180) % 360
		end

		local ringsList = {}
		local polygonsList = {}
		
		-- Core Polygon
		table.insert(polygonsList, generateCirclePolygon(centerPos.X, centerPos.Z, MULTI_RINGS_GROUND_TRUTH.coreRadius, 16))

		-- 7 Ground-Truth Semicircle Rings
		for idx, rDef in ipairs(MULTI_RINGS_GROUND_TRUTH.rings) do
			local ringYaw = (skillYaw + rDef.yawOffset) % 360
			local poly = generateArcPolygon(centerPos.X, centerPos.Z, rDef.rIn, rDef.rOut, ringYaw, 180, 12)
			
			table.insert(ringsList, {
				rIn = rDef.rIn,
				rOut = rDef.rOut,
				yaw = ringYaw,
				yawOffset = rDef.yawOffset,
				span = 180,
				side = rDef.side,
				polygon = poly,
			})
			table.insert(polygonsList, poly)
		end

		return {
			shape = "compound_multiring",
			x = centerPos.X,
			y = centerPos.Y,
			z = centerPos.Z,
			yaw = skillYaw,
			color = "#3cd0d0",
			transparency = part.Transparency or 0.5,
			coreRadius = MULTI_RINGS_GROUND_TRUTH.coreRadius,
			maxRadius = MULTI_RINGS_GROUND_TRUTH.maxRadius,
			rings = ringsList,
			polygons = polygonsList,
			part = part,
		}
	end

	-- 0.7. Nhận diện Ice Spikes precast (largeIceSpikes, mediumIceSpikes, smallIceSpikes): Vùng báo động gai băng hình tròn
	local isIceSpikes = filter.IsIceSpikes(part) or (part.Parent and filter.IsIceSpikes(part.Parent))
	if isIceSpikes then
		local dims = { size.X, size.Y, size.Z }
		table.sort(dims)
		local rad = math.max(dims[2], dims[3]) / 2
		if rad < 2.0 then rad = 4.0 end
		return {
			shape = "circle",
			x = pos.X,
			y = pos.Y,
			z = pos.Z,
			radius = rad,
			color = hexColor,
			transparency = part.Transparency,
			part = part,
		}
	end

	-- 0.8. Nhận diện firstBossBigSpike (Boss 1): Gai xoay tròn -> Đổ bóng Hình tròn Circle
	local isBigSpike = filter.IsFirstBossBigSpike(part) or (part.Parent and filter.IsFirstBossBigSpike(part.Parent))
	if isBigSpike then
		local dims = { size.X, size.Y, size.Z }
		table.sort(dims)
		local maxDim = math.max(dims[2], dims[3])
		local rad = math.clamp(maxDim / 2, 10.0, 35.0)
		if rad < 12.0 then rad = 14.0 end
		return {
			shape = "circle",
			x = pos.X,
			y = pos.Y,
			z = pos.Z,
			radius = rad,
			color = hexColor,
			transparency = part.Transparency,
			part = part,
		}
	end

	-- 0.9. Nhận diện Bouncing Orb (thirdBossBouncingOrb / bonusBossBouncingOrb): Vòng tròn Circle
	local isBouncingOrb = filter.IsBouncingOrb(part) or (part.Parent and filter.IsBouncingOrb(part.Parent))
	if isBouncingOrb then
		local dims = { size.X, size.Y, size.Z }
		table.sort(dims)
		local rad = math.max(dims[2], dims[3]) / 2
		if rad < 2.0 then rad = 4.0 end
		return {
			shape = "circle",
			x = pos.X,
			y = pos.Y,
			z = pos.Z,
			radius = rad,
			color = hexColor,
			transparency = part.Transparency,
			part = part,
		}
	end

	-- 1. Nếu là Ball -> Hình tròn Circle
	if part:IsA("Part") and part.Shape == Enum.PartType.Ball then
		local rad = math.max(size.X, size.Y, size.Z) / 2
		return {
			shape = "circle",
			x = pos.X,
			y = pos.Y,
			z = pos.Z,
			radius = rad,
			color = hexColor,
			transparency = part.Transparency,
			part = part,
		}
	end

	-- 1.5. Nếu là Cylinder -> Chỉ là Circle nếu Cylinder ĐỨNG THẲNG
	if part:IsA("Part") and part.Shape == Enum.PartType.Cylinder then
		if math.abs(cf.RightVector.Y) > 0.75 then
			local rad = math.max(size.Y, size.Z) / 2
			return {
				shape = "circle",
				x = pos.X,
				y = pos.Y,
				z = pos.Z,
				radius = rad,
				color = hexColor,
				transparency = part.Transparency,
				part = part,
			}
		end
		-- Nếu Cylinder nằm ngang (Laser / Beam) -> Xuống mục 3 thành Box OBB!
	end

	-- 2. Nếu đĩa tròn mỏng đứng trên sàn -> Hình tròn Circle
	local maxXZ = math.max(size.X, size.Z)
	local minXZ = math.min(size.X, size.Z)
	if minXZ > 0 and (maxXZ / minXZ) <= 1.15 and not part:IsA("WedgePart") and size.Y <= math.min(size.X, size.Z) then
		return {
			shape = "circle",
			x = pos.X,
			y = pos.Y,
			z = pos.Z,
			radius = maxXZ / 2,
			color = hexColor,
			transparency = part.Transparency,
			part = part,
		}
	end

	-- 3. Hộp chữ nhật chuẩn hóa theo mặt phẳng 2D (Planar OBB Box)
	local isHorizontalCylinder = (part:IsA("Part") and part.Shape == Enum.PartType.Cylinder)
	local isMovingBeam = (pName:find("movingbeam") ~= nil) or (parentName:find("movingbeam") ~= nil)
	local isMissile = (pName:find("missile") ~= nil) or (parentName:find("missile") ~= nil)

	local fwd2D, right2D, halfWidth, halfLength

	if isMovingBeam then
		-- BOSS 2: Moving Beam (Sải ngang rộng dọc theo right2D, bề dày mỏng dọc theo fwd2D)
		halfWidth = math.max(size.X, size.Z) / 2
		halfLength = math.max(2.0, math.min(size.X, math.max(size.Y, size.Z)) / 2)

		local horizRv = Vector3.new(cf.RightVector.X, 0, cf.RightVector.Z)
		if horizRv.Magnitude > 0.01 then
			right2D = horizRv.Unit
		else
			right2D = Vector3.new(1, 0, 0)
		end
		fwd2D = Vector3.new(-right2D.Z, 0, right2D.X)

		if motionRecord and motionRecord.headingDir and motionRecord.headingDir.Magnitude > 0.1 then
			if fwd2D:Dot(motionRecord.headingDir) < 0 then
				fwd2D = -fwd2D
				right2D = -right2D
			end
		end
	elseif isMissile then
		-- BOSS 3: Missile (Chiều dài dọc theo fwd2D, tiết diện ngang dọc theo right2D)
		local maxDim = math.max(size.X, math.max(size.Y, size.Z))
		local minDim = math.min(size.X, math.min(size.Y, size.Z))
		halfLength = math.max(0.5, maxDim / 2)
		halfWidth = math.max(1.5, minDim / 2)

		if motionRecord and motionRecord.speed and motionRecord.speed >= 1.0 and motionRecord.headingDir and motionRecord.headingDir.Magnitude > 0.1 then
			fwd2D = Vector3.new(motionRecord.headingDir.X, 0, motionRecord.headingDir.Z).Unit
			right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
		else
			local lv = cf.LookVector
			local horizLv = Vector3.new(lv.X, 0, lv.Z)
			if horizLv.Magnitude > 0.01 then
				fwd2D = horizLv.Unit
			else
				fwd2D = Vector3.new(0, 0, -1)
			end
			right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
		end

		if motionRecord and motionRecord.headingDir and motionRecord.headingDir.Magnitude > 0.1 and motionRecord.speed and motionRecord.speed >= 1.0 then
			if fwd2D:Dot(motionRecord.headingDir) < 0 then
				fwd2D = -fwd2D
				right2D = -right2D
			end
		end
	elseif isHorizontalCylinder then
		local rv = cf.RightVector
		local horizRv = Vector3.new(rv.X, 0, rv.Z)
		if horizRv.Magnitude > 0.01 then
			fwd2D = horizRv.Unit
		else
			fwd2D = Vector3.new(0, 0, -1)
		end
		right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
		halfLength = math.max(0.5, size.X / 2)
		halfWidth = math.max(0.5, math.max(size.Y, size.Z) / 2)
	else
		-- Hazard tĩnh thông thường: dùng trục chuẩn LookVector và RightVector
		local halfX = math.max(0.5, size.X / 2)
		local halfZ = math.max(0.5, size.Z / 2)
		halfWidth = halfX
		halfLength = halfZ

		local lv = cf.LookVector
		local horizLv = Vector3.new(lv.X, 0, lv.Z)
		if horizLv.Magnitude > 0.01 then
			fwd2D = horizLv.Unit
		else
			fwd2D = Vector3.new(0, 0, -1)
		end
		right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
	end

	local planarYaw = math.deg(math.atan2(fwd2D.X, -fwd2D.Z))

	local cx, cz = pos.X, pos.Z
	local c1 = Vector3.new(cx, pos.Y, cz) + right2D * halfWidth + fwd2D * halfLength
	local c2 = Vector3.new(cx, pos.Y, cz) - right2D * halfWidth + fwd2D * halfLength
	local c3 = Vector3.new(cx, pos.Y, cz) - right2D * halfWidth - fwd2D * halfLength
	local c4 = Vector3.new(cx, pos.Y, cz) + right2D * halfWidth - fwd2D * halfLength

	local boxVertices = {
		{ x = c1.X, z = c1.Z },
		{ x = c2.X, z = c2.Z },
		{ x = c3.X, z = c3.Z },
		{ x = c4.X, z = c4.Z },
	}

	return {
		shape = "box",
		x = pos.X,
		y = pos.Y,
		z = pos.Z,
		halfX = halfWidth,
		halfZ = halfLength,
		halfWidth = halfWidth,
		halfLength = halfLength,
		fwd2D = fwd2D,
		right2D = right2D,
		yaw = planarYaw,
		vertices = boxVertices,
		color = hexColor,
		transparency = part.Transparency,
		part = part,
	}
end
function analyzer.AnalyzeHazardPart(part, motionRecord)
	local shapeData = analyzeHazardPartInternal(part, motionRecord)
	if shapeData and corridor.IsCorridorSkill(part) then
		shapeData.corridor = corridor.ComputeCorridor(part, shapeData, motionRecord)
	end
	return shapeData
end
analyzer.AnalyzeNeonPart = analyzer.AnalyzeHazardPart

return analyzer
