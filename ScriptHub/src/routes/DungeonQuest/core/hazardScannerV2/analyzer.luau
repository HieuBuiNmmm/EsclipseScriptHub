-- HazardScannerV2 - Shape & Color Analyzer
-- Trích xuất hình học chính xác (Circle / Box OBB) và Màu sắc phát sáng Neon thực tế từ Part.

--// Imports
local filter = require("@routes/DungeonQuest/core/hazardScannerV2/filter")

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
function analyzer.AnalyzeHazardPart(part)
	if not part or not part:IsA("BasePart") or not part.Parent then
		return nil
	end

	local size = part.Size
	local cf = part.CFrame
	local pos = cf.Position
	local yaw = getYawDegrees(cf)
	local hexColor = colorToHex(part.Color)

	-- Xử lý màu riêng cho Ice Spikes (Material Plastic) thành màu xanh băng phát sáng
	if filter.IsIceSpikes(part) or (part.Parent and filter.IsIceSpikes(part.Parent)) then
		hexColor = "#38d9ff"
	end

	-- Xử lý màu riêng cho bonusBossSweepingFlames (Lửa cam neon rực rỡ)
	if filter.IsSweepingFlames(part) or (part.Parent and filter.IsSweepingFlames(part.Parent)) or (part.Parent and part.Parent.Parent and filter.IsSweepingFlames(part.Parent.Parent)) then
		hexColor = "#ff6b22"
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

	-- 3. Hộp chữ nhật xoay (OBB Box)
	local halfX = math.max(0.5, size.X / 2)
	local halfZ = math.max(0.5, size.Z / 2)

	-- 4 đỉnh thế giới (World-space 4 corners) chiếu xuống mặt phẳng 2D (X, Z)
	local c1 = cf:PointToWorldSpace(Vector3.new(halfX, 0, halfZ))
	local c2 = cf:PointToWorldSpace(Vector3.new(-halfX, 0, halfZ))
	local c3 = cf:PointToWorldSpace(Vector3.new(-halfX, 0, -halfZ))
	local c4 = cf:PointToWorldSpace(Vector3.new(halfX, 0, -halfZ))

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
		halfX = halfX,
		halfZ = halfZ,
		yaw = yaw,
		vertices = boxVertices,
		color = hexColor,
		transparency = part.Transparency,
		part = part,
	}
end
analyzer.AnalyzeNeonPart = analyzer.AnalyzeHazardPart

return analyzer
