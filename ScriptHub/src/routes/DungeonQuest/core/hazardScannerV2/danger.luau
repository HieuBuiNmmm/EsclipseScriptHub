--!nocheck
-- HazardScannerV2 - Real-Time Danger Detection Engine & Player Footprint Monitor
-- Quản lý:
-- 1. Đĩa tròn 2D hitbox dưới chân Player (Xanh ngọc = An toàn, Đỏ tươi = Nguy hiểm).
-- 2. Kiểm tra va chạm hình học 2D siêu tốc (What You See Is What You Dodge) dựa trực tiếp
--    trên Single Source of Truth (shapeData của Ground Visualizer & Threat Corridor).
-- 3. Cung cấp API đánh giá an toàn thời gian thực cho Auto-Dodge & Safe Spot Sampling.

--// Imports
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local contextual = require("@routes/DungeonQuest/core/contextual")
local corridor = require("@routes/DungeonQuest/core/hazardScannerV2/corridor")

--// Table
local danger = {}

--// State
local enabled = false
local visualEnabled = true
local shapeMode = "Disc" -- "Disc" | "Rectangle"
local playerRadius = 1.8 -- studs (bán kính khi ở mode Disc)
local playerWidth = 2.5 -- studs (chiều rộng trục ngang khi ở mode Rectangle)
local playerLength = 2.5 -- studs (chiều dài trục dọc khi ở mode Rectangle)
local isPlayerInDanger = false
local currentThreat = nil
local currentThreatType = nil -- "Ground Zone" | "Threat Corridor"
local dangerCallbacks = {}
local heartbeatConnection = nil
local activeHazardsRef = nil -- Tham chiếu tới activeHazards từ init.luau

--// Visual Handle
local playerAdornment = nil

--// Styling
local COLOR_SAFE = Color3.fromRGB(0, 255, 170) -- Xanh ngọc khi an toàn
local COLOR_DANGER = Color3.fromRGB(255, 35, 35) -- Đỏ tươi khi gặp nguy hiểm
local TRANSPARENCY_SAFE = 0.45
local TRANSPARENCY_DANGER = 0.20
local GROUND_THICKNESS = 0.20

--// Helper lấy HumanoidRootPart của Player
local function getPlayerRoot()
	local lp = (services and services.player) or Players.LocalPlayer
	local char = lp and lp.Character
	if not char or not char.Parent then return nil end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then return nil end
	return char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
end

--// Helper lấy độ cao mặt sàn dưới chân Player
local function getPlayerGroundY(root)
	if not root then return 0 end
	return root.Position.Y - 2.5
end

--// Helper lấy hướng nhìn ngang (XZ) của Player
local function getPlayerOrientation(root)
	if not root then
		return Vector3.new(0, 0, -1), Vector3.new(1, 0, 0)
	end
	local look = root.CFrame.LookVector
	local look2D = Vector3.new(look.X, 0, look.Z)
	local fwd = (look2D.Magnitude > 0.001) and look2D.Unit or Vector3.new(0, 0, -1)
	local right = Vector3.new(-fwd.Z, 0, fwd.X)
	return fwd, right
end

--// Quản lý Adornment Hitbox 2D dưới chân Player (Hỗ trợ CylinderHandleAdornment & BoxHandleAdornment)
local function ensureAdornment(root)
	local expectedClass = (shapeMode == "Rectangle") and "BoxHandleAdornment" or "CylinderHandleAdornment"

	if playerAdornment then
		if not playerAdornment:IsA(expectedClass)
			or playerAdornment.Parent ~= root
			or not playerAdornment:IsDescendantOf(Workspace) then
			pcall(function() playerAdornment:Destroy() end)
			playerAdornment = nil
		else
			if playerAdornment.Adornee ~= root then
				playerAdornment.Adornee = root
			end
			return playerAdornment
		end
	end

	if not root or not root.Parent then return nil end

	if shapeMode == "Rectangle" then
		local ad = Instance.new("BoxHandleAdornment")
		ad.Name = "Player_2D_HitboxVisualV2_Box"
		ad.Adornee = root
		ad.Size = Vector3.new(playerWidth, GROUND_THICKNESS, playerLength)
		ad.Color3 = isPlayerInDanger and COLOR_DANGER or COLOR_SAFE
		ad.Transparency = isPlayerInDanger and TRANSPARENCY_DANGER or TRANSPARENCY_SAFE
		ad.ZIndex = 5
		ad.AlwaysOnTop = false
		ad.Visible = visualEnabled and enabled
		ad.Parent = root
		playerAdornment = ad
		return ad
	else
		local ad = Instance.new("CylinderHandleAdornment")
		ad.Name = "Player_2D_HitboxVisualV2_Disc"
		ad.Adornee = root
		ad.Radius = playerRadius
		ad.Height = GROUND_THICKNESS
		ad.Color3 = isPlayerInDanger and COLOR_DANGER or COLOR_SAFE
		ad.Transparency = isPlayerInDanger and TRANSPARENCY_DANGER or TRANSPARENCY_SAFE
		ad.ZIndex = 5
		ad.AlwaysOnTop = false
		ad.Visible = visualEnabled and enabled
		ad.Parent = root
		playerAdornment = ad
		return ad
	end
end

local function updateVisualColor(inDanger)
	if not playerAdornment or not playerAdornment.Parent then return end
	playerAdornment.Color3 = inDanger and COLOR_DANGER or COLOR_SAFE
	playerAdornment.Transparency = inDanger and TRANSPARENCY_DANGER or TRANSPARENCY_SAFE
end

--==============================================================================
-- 2D GEOMETRIC INTERSECTION ENGINE (NARROW-PHASE)
--==============================================================================

-- 1a. Kiểm tra vòng tròn người chơi với Circle AOE
local function isCircleHit(px, pz, cx, cz, radius, pad)
	local dx = px - cx
	local dz = pz - cz
	local totalR = radius + pad
	return (dx * dx + dz * dz) <= (totalR * totalR)
end

-- 1b. Kiểm tra OBB người chơi với Circle AOE
local function isCircleVsObbHit(cx, cz, circleRadius, px, pz, halfWidth, halfLength, fwd2D, right2D, pad)
	local vx = cx - px
	local vz = cz - pz

	local projFwd = vx * fwd2D.X + vz * fwd2D.Z
	local projRight = vx * right2D.X + vz * right2D.Z

	local dFwd = math.max(0, math.abs(projFwd) - halfLength)
	local dRight = math.max(0, math.abs(projRight) - halfWidth)

	local totalR = circleRadius + pad
	return (dFwd * dFwd + dRight * dRight) <= (totalR * totalR)
end

-- 2a. Kiểm tra vòng tròn người chơi với Planar OBB Box
local function isBoxHit(px, pz, cx, cz, halfWidth, halfLength, fwd2D, right2D, pad)
	local vx = px - cx
	local vz = pz - cz

	local projU = vx * fwd2D.X + vz * fwd2D.Z
	local projN = vx * right2D.X + vz * right2D.Z

	if pad <= 0 then
		return math.abs(projU) <= halfLength and math.abs(projN) <= halfWidth
	end

	local dU = math.max(0, math.abs(projU) - halfLength)
	local dN = math.max(0, math.abs(projN) - halfWidth)
	return (dU * dU + dN * dN) <= (pad * pad)
end

-- 2b. Kiểm tra OBB người chơi với OBB Hazard (SAT - Separating Axis Theorem 2D)
local function isObbVsObbHit(px, pz, pHalfW, pHalfL, pFwd, pRight, hx, hz, hHalfW, hHalfL, hFwd, hRight, pad)
	local dx = hx - px
	local dz = hz - pz

	local function axisSeparates(ax, az)
		local dist = math.abs(dx * ax + dz * az)
		local rP = pHalfL * math.abs(pFwd.X * ax + pFwd.Z * az)
			+ pHalfW * math.abs(pRight.X * ax + pRight.Z * ax)
		local rH = hHalfL * math.abs(hFwd.X * ax + hFwd.Z * az)
			+ hHalfW * math.abs(hRight.X * ax + hRight.Z * az)
		return dist > (rP + rH + pad)
	end

	if axisSeparates(pFwd.X, pFwd.Z) then return false end
	if axisSeparates(pRight.X, pRight.Z) then return false end
	if axisSeparates(hFwd.X, hFwd.Z) then return false end
	if axisSeparates(hRight.X, hRight.Z) then return false end

	return true
end

-- 3a. Kiểm tra vòng tròn người chơi với 7 Vòng Bán Nguyệt Mê Cung (thirdBossMultiRings)
local function isMultiRingHit(px, pz, shape, pad)
	local cx = shape.x
	local cz = shape.z
	local dx = px - cx
	local dz = pz - cz
	local dist = math.sqrt(dx * dx + dz * dz)

	-- Lõi tâm hình tròn (Core Circle)
	local coreR = shape.coreRadius or 12.5
	if dist <= (coreR + pad) then
		return true
	end

	-- 7 Vành bán nguyệt
	local rings = shape.rings
	if not rings or #rings == 0 then return false end

	local pointYaw = math.deg(math.atan2(dx, -dz))

	for _, ring in ipairs(rings) do
		local rIn = ring.rIn or 12.5
		local rOut = ring.rOut or 25.0

		if dist >= (rIn - pad) and dist <= (rOut + pad) then
			local rYaw = ring.yaw or 0
			local diff = (pointYaw - rYaw + 180) % 360 - 180

			local padAngle = 0
			if dist > 1.0 and pad > 0 then
				padAngle = math.deg(math.asin(math.clamp(pad / dist, 0, 1)))
			end

			if math.abs(diff) <= (90 + padAngle) then
				return true
			end
		end
	end

	return false
end

-- 3b. Kiểm tra OBB người chơi với 7 Vành bán nguyệt Mê Cung
local function isMultiRingHitObb(px, pz, hw, hl, fwd2D, right2D, shape, pad)
	local coreR = shape.coreRadius or 12.5
	if isCircleVsObbHit(shape.x, shape.z, coreR, px, pz, hw, hl, fwd2D, right2D, pad) then
		return true
	end

	local rings = shape.rings
	if not rings or #rings == 0 then return false end

	local corners = {
		Vector3.new(px, 0, pz),
		Vector3.new(px + hl * fwd2D.X + hw * right2D.X, 0, pz + hl * fwd2D.Z + hw * right2D.Z),
		Vector3.new(px + hl * fwd2D.X - hw * right2D.X, 0, pz + hl * fwd2D.Z - hw * right2D.Z),
		Vector3.new(px - hl * fwd2D.X + hw * right2D.X, 0, pz - hl * fwd2D.Z + hw * right2D.Z),
		Vector3.new(px - hl * fwd2D.X - hw * right2D.X, 0, pz - hl * fwd2D.Z - hw * right2D.Z),
	}

	for _, pt in ipairs(corners) do
		local dx = pt.X - shape.x
		local dz = pt.Z - shape.z
		local dist = math.sqrt(dx * dx + dz * dz)

		for _, ring in ipairs(rings) do
			local rIn = ring.rIn or 12.5
			local rOut = ring.rOut or 25.0
			if dist >= (rIn - pad) and dist <= (rOut + pad) then
				local rYaw = ring.yaw or 0
				local pointYaw = math.deg(math.atan2(dx, -dz))
				local diff = (pointYaw - rYaw + 180) % 360 - 180
				local padAngle = (dist > 1.0 and pad > 0) and math.deg(math.asin(math.clamp(pad / dist, 0, 1))) or 0
				if math.abs(diff) <= (90 + padAngle) then
					return true
				end
			end
		end
	end

	return false
end

-- 4b. Kiểm tra OBB người chơi với Threat Corridor (Hỗ trợ phân biệt Imminent vs Threat Path)
local function isCorridorHitObb(px, pz, hw, hl, fwd2D, right2D, corridorData, pad, isImminentOnly, motionRecord)
	local centerPt = Vector3.new(px, 0, pz)

	if isImminentOnly then
		if corridor.IsThreatImminent(centerPt, corridorData, motionRecord, pad) then
			return true
		end

		local corners = {
			Vector3.new(px + hl * fwd2D.X + hw * right2D.X, 0, pz + hl * fwd2D.Z + hw * right2D.Z),
			Vector3.new(px + hl * fwd2D.X - hw * right2D.X, 0, pz + hl * fwd2D.Z - hw * right2D.Z),
			Vector3.new(px - hl * fwd2D.X + hw * right2D.X, 0, pz - hl * fwd2D.Z + hw * right2D.Z),
			Vector3.new(px - hl * fwd2D.X - hw * right2D.X, 0, pz - hl * fwd2D.Z - hw * right2D.Z),
		}
		for _, c in ipairs(corners) do
			if corridor.IsThreatImminent(c, corridorData, motionRecord, pad) then
				return true
			end
		end
		return false
	else
		if corridor.IsPointInThreatPath(centerPt, corridorData, pad) then
			return true
		end

		local corners = {
			Vector3.new(px + hl * fwd2D.X + hw * right2D.X, 0, pz + hl * fwd2D.Z + hw * right2D.Z),
			Vector3.new(px + hl * fwd2D.X - hw * right2D.X, 0, pz + hl * fwd2D.Z - hw * right2D.Z),
			Vector3.new(px - hl * fwd2D.X + hw * right2D.X, 0, pz - hl * fwd2D.Z + hw * right2D.Z),
			Vector3.new(px - hl * fwd2D.X - hw * right2D.X, 0, pz - hl * fwd2D.Z - hw * right2D.Z),
		}
		for _, c in ipairs(corners) do
			if corridor.IsPointInThreatPath(c, corridorData, pad) then
				return true
			end
		end
		return false
	end
end

-- 5. Kiểm tra xem điểm có nằm trong ô Sanctuary / Vùng An Toàn Ưu Tiên (Memory Good Zone) không
local function isPointInSanctuary(px, pz, shape, pad, isRect, hw, hl, fwd2D, right2D)
	if not shape then return false end
	if shape.color == "#22ff88" then
		if isRect and hw and hl and fwd2D and right2D then
			if shape.shape == "circle" and shape.radius then
				return isCircleVsObbHit(shape.x, shape.z, shape.radius, px, pz, hw, hl, fwd2D, right2D, 0)
			elseif shape.shape == "box" and shape.halfWidth and shape.halfLength and shape.fwd2D and shape.right2D then
				return isObbVsObbHit(px, pz, hw, hl, fwd2D, right2D, shape.x, shape.z, shape.halfWidth, shape.halfLength, shape.fwd2D, shape.right2D, 0)
			end
		else
			if shape.shape == "circle" and shape.radius then
				return isCircleHit(px, pz, shape.x, shape.z, shape.radius, 0)
			elseif shape.shape == "box" and shape.halfWidth and shape.halfLength and shape.fwd2D and shape.right2D then
				return isBoxHit(px, pz, shape.x, shape.z, shape.halfWidth, shape.halfLength, shape.fwd2D, shape.right2D, 0)
			end
		end
	end
	return false
end

--==============================================================================
-- PUBLIC QUERY INTERFACES
--==============================================================================

-- Gán nguồn danh sách hazard từ init.luau
function danger.SetHazardsMap(hazardsMap)
	activeHazardsRef = hazardsMap
end

-- Lấy danh sách hazard đang hoạt động
function danger.GetActiveHazards()
	return activeHazardsRef or {}
end

-- Kiểm tra xem 1 toạ độ bất kỳ (hoặc vòng tròn bán kính extraPadding) có nằm trong vùng nguy hiểm không
-- Tham số isImminentOnly:
--   true  -> CHỈ báo nguy hiểm khi đạn ĐÃ ĐẾN GẦN (Lead Time / Lead Distance), dùng cho né Player ("tàu cách 100km thì không né")
--   false -> Báo nguy hiểm toàn bộ dải hành lang phía trước đạn (threat path), dùng để cấm Safe Spot trên đường ray
-- Trả về: inDanger (boolean), threatData (hazard đe dọa gần nhất), threatType ("Ground Zone" | "Threat Corridor" | nil)
function danger.IsPointInDanger(point, extraPadding, ignoredHazard, isImminentOnly)
	if not point then return false, nil, nil end
	local hazards = activeHazardsRef
	if not hazards or next(hazards) == nil then
		return false, nil, nil
	end

	local px = point.X
	local pz = point.Z

	local isRect = (shapeMode == "Rectangle")
	local root = getPlayerRoot()
	local fwd2D, right2D
	local hw, hl
	local pad

	if isRect then
		fwd2D, right2D = getPlayerOrientation(root)
		hw = (playerWidth / 2) + (extraPadding or 0)
		hl = (playerLength / 2) + (extraPadding or 0)
		pad = extraPadding or 0
	else
		pad = playerRadius + (extraPadding or 0)
	end

	-- 1. KIỂM TRA SANCTUARY (Vùng an toàn ưu tiên của Simon Says / PrecastGood)
	-- Nếu đang đứng trong ô an toàn màu xanh lá thì miễn nhiễm mọi sát thương đè lên
	for part, data in pairs(hazards) do
		if data.shape and isPointInSanctuary(px, pz, data.shape, pad, isRect, hw, hl, fwd2D, right2D) then
			return false, nil, nil
		end
	end

	local bestDistSq = math.huge
	local foundThreat = nil
	local foundType = nil

	for part, data in pairs(hazards) do
		if ignoredHazard and (ignoredHazard == part or ignoredHazard == data) then
			continue
		end

		local shape = data.shape
		if not shape then continue end

		local sx = shape.x or (part and part.Position.X) or 0
		local sz = shape.z or (part and part.Position.Z) or 0
		local dx = px - sx
		local dz = pz - sz
		local distSq = dx * dx + dz * dz

		-- A. KIỂM TRA GROUND ZONE
		local isGroundHit = false
		if isRect then
			if shape.shape == "circle" and shape.radius then
				isGroundHit = isCircleVsObbHit(sx, sz, shape.radius, px, pz, hw, hl, fwd2D, right2D, 0)
			elseif shape.shape == "box" and shape.halfWidth and shape.halfLength and shape.fwd2D and shape.right2D then
				isGroundHit = isObbVsObbHit(px, pz, hw, hl, fwd2D, right2D, sx, sz, shape.halfWidth, shape.halfLength, shape.fwd2D, shape.right2D, 0)
			elseif shape.shape == "compound_multiring" then
				isGroundHit = isMultiRingHitObb(px, pz, hw, hl, fwd2D, right2D, shape, 0)
			end
		else
			if shape.shape == "circle" and shape.radius then
				isGroundHit = isCircleHit(px, pz, sx, sz, shape.radius, pad)
			elseif shape.shape == "box" and shape.halfWidth and shape.halfLength and shape.fwd2D and shape.right2D then
				isGroundHit = isBoxHit(px, pz, sx, sz, shape.halfWidth, shape.halfLength, shape.fwd2D, shape.right2D, pad)
			elseif shape.shape == "compound_multiring" then
				isGroundHit = isMultiRingHit(px, pz, shape, pad)
			end
		end

		if isGroundHit then
			if distSq < bestDistSq then
				bestDistSq = distSq
				foundThreat = data
				foundType = "Ground Zone"
			end
		end

		-- B. KIỂM TRA THREAT CORRIDOR (Hành lang cam)
		if shape.corridor then
			local isCorridorHit = false
			local mot = data.motion

			if isImminentOnly then
				-- Chế độ CẬP KỀ: Chỉ nguy hiểm khi đạn đã bay gần tới (Lead Time / Lead Distance)
				if isRect then
					isCorridorHit = isCorridorHitObb(px, pz, hw, hl, fwd2D, right2D, shape.corridor, extraPadding or 0, true, mot)
				else
					isCorridorHit = corridor.IsThreatImminent(point, shape.corridor, mot, pad)
				end
			else
				-- Chế độ TOÀN VÙNG: Vùng phía trước đạn đang bay tới (dùng cấm đặt Safe Spot)
				if isRect then
					isCorridorHit = isCorridorHitObb(px, pz, hw, hl, fwd2D, right2D, shape.corridor, extraPadding or 0, false, mot)
				else
					isCorridorHit = corridor.IsPointInThreatPath(point, shape.corridor, pad)
				end
			end

			if isCorridorHit then
				if distSq < bestDistSq then
					bestDistSq = distSq
					foundThreat = data
					foundType = "Threat Corridor"
				end
			end
		end
	end

	return (foundThreat ~= nil), foundThreat, foundType
end

-- Kiểm tra xem 1 toạ độ có TUYỆT ĐỐI AN TOÀN không (dùng cho thuật toán tìm Safe Spot)
-- Bao gồm cả kiểm tra ràng buộc không được chạy ra ngoài Boss Area
function danger.IsPointSafe(point, extraPadding)
	if not point then return false end
	local p2D = Vector3.new(point.X, 0, point.Z)

	-- 1. Kiểm tra Boss Area Constraint & Donut Inner Deadzone
	local isBossAreaActive, bossAreaRadius, bossAreaCenter, isInnerDeadzoneActive, innerDeadzoneRadius = contextual.GetActiveBossArea()
	if isBossAreaActive and bossAreaCenter and bossAreaRadius and bossAreaRadius > 0 then
		local bCenter2D = Vector3.new(bossAreaCenter.X, 0, bossAreaCenter.Z)
		local distToCenter = (p2D - bCenter2D).Magnitude

		-- A. Giới hạn ngoài: Không được vượt ra ngoài vòng tròn xanh (Outer boundary)
		if distToCenter > bossAreaRadius then
			return false
		end

		-- B. Giới hạn trong: Không được né chui vào lỗ donut (Inner deadzone / cấm né áp sát tâm Boss)
		if isInnerDeadzoneActive and innerDeadzoneRadius and innerDeadzoneRadius > 0 then
			if distToCenter < innerDeadzoneRadius then
				return false
			end
		end
	end

	-- 2. Kiểm tra không bị dính bất kỳ Hazard hay quỹ đạo đạn Threat Corridor nào (isImminentOnly = false)
	local inDanger = danger.IsPointInDanger(p2D, extraPadding, nil, false)
	return not inDanger
end

-- Kiểm tra trạng thái nguy hiểm thời gian thực của chính nhân vật Player
function danger.IsPlayerInDanger()
	local root = getPlayerRoot()
	if not root then
		return false, nil, nil
	end

	-- 1. Kiểm tra Invulnerability Bypass (vừa hồi sinh / có Shield bảo vệ)
	if shared.IsInvulnerable and shared.IsInvulnerable() then
		return false, nil, nil
	end

	-- 2. Kiểm tra Contextual Room / Boss Disable Dodge
	if contextual.IsActiveDodgeDisabled and contextual.IsActiveDodgeDisabled() then
		return false, nil, nil
	end
	if contextual.IsActiveHazardScannerEnabled and not contextual.IsActiveHazardScannerEnabled() then
		return false, nil, nil
	end

	-- Đối với Player: CHỈ né khi nguy hiểm cập kề (isImminentOnly = true)
	-- Nếu đạn còn cách xa trên đường ray -> hoàn toàn KHÔNG né, giữ nguyên chuyển động tự nhiên
	return danger.IsPointInDanger(root.Position, 0, nil, true)
end

-- Lấy danh sách các hazard nằm gần điểm origin (Spatial Culling phục vụ Safe Spot Sampling nhanh)
function danger.GetRelevantHazards(origin, searchRadius)
	local list = {}
	local hazards = activeHazardsRef
	if not hazards then return list end

	local ox = origin.X
	local oz = origin.Z
	local rMax = searchRadius or 75
	local rMaxSq = rMax * rMax

	for part, data in pairs(hazards) do
		local shape = data.shape
		if shape then
			local sx = shape.x or 0
			local sz = shape.z or 0
			local distSq = (ox - sx) * (ox - sx) + (oz - sz) * (oz - sz)
			if distSq <= rMaxSq then
				table.insert(list, data)
			end
		end
	end
	return list
end

-- Lấy trạng thái hiện tại
function danger.GetStatus()
	return isPlayerInDanger, currentThreat, currentThreatType
end

-- Đăng ký nhận thông báo khi trạng thái Danger thay đổi
function danger.OnDangerChanged(callback)
	if type(callback) == "function" then
		table.insert(dangerCallbacks, callback)
	end
end

-- Bật / tắt hiển thị đĩa tròn hitbox chân người chơi
function danger.SetVisualEnabled(state)
	visualEnabled = state and true or false
	if playerAdornment and playerAdornment.Parent then
		playerAdornment.Visible = visualEnabled and enabled
	end
end

function danger.IsVisualEnabled()
	return visualEnabled
end

-- Kiểu hình Hitbox người chơi: "Disc" (hình đĩa tròn) | "Rectangle" (hình chữ nhật OBB)
function danger.GetShapeMode()
	return shapeMode
end

function danger.SetShapeMode(mode)
	if mode == "Rectangle" or mode == "Disc" then
		if shapeMode ~= mode then
			shapeMode = mode
			if playerAdornment then
				pcall(function() playerAdornment:Destroy() end)
				playerAdornment = nil
			end
			local root = getPlayerRoot()
			if root and enabled then
				ensureAdornment(root)
			end
		end
	end
end

-- Bán kính Hitbox người chơi (Disc mode)
function danger.GetPlayerRadius()
	return playerRadius
end

function danger.SetPlayerRadius(rad)
	if type(rad) == "number" and rad > 0 then
		playerRadius = rad
		if shapeMode == "Disc" and playerAdornment and playerAdornment.Parent and playerAdornment:IsA("CylinderHandleAdornment") then
			playerAdornment.Radius = rad
		end
	end
end

-- Chiều rộng Hitbox người chơi (Rectangle mode)
function danger.GetPlayerWidth()
	return playerWidth
end

function danger.SetPlayerWidth(w)
	if type(w) == "number" and w > 0 then
		playerWidth = w
		if shapeMode == "Rectangle" and playerAdornment and playerAdornment.Parent and playerAdornment:IsA("BoxHandleAdornment") then
			playerAdornment.Size = Vector3.new(playerWidth, GROUND_THICKNESS, playerLength)
		end
	end
end

-- Chiều dài Hitbox người chơi (Rectangle mode)
function danger.GetPlayerLength()
	return playerLength
end

function danger.SetPlayerLength(l)
	if type(l) == "number" and l > 0 then
		playerLength = l
		if shapeMode == "Rectangle" and playerAdornment and playerAdornment.Parent and playerAdornment:IsA("BoxHandleAdornment") then
			playerAdornment.Size = Vector3.new(playerWidth, GROUND_THICKNESS, playerLength)
		end
	end
end

--==============================================================================
-- HEARTBEAT LOOP (60 FPS MONITORING)
--==============================================================================

local function onHeartbeat()
	local root = getPlayerRoot()
	if not root or not root.Parent then
		if playerAdornment and playerAdornment.Parent then
			playerAdornment.Visible = false
		end
		if isPlayerInDanger then
			isPlayerInDanger = false
			currentThreat = nil
			currentThreatType = nil
			for _, cb in ipairs(dangerCallbacks) do
				pcall(cb, false, nil, nil)
			end
		end
		return
	end

	-- 1. Cập nhật vị trí & trạng thái ghim sàn của Hitbox Player
	local ad = ensureAdornment(root)
	if ad and ad.Parent then
		ad.Visible = visualEnabled and enabled

		local targetY = getPlayerGroundY(root)
		local pos2D = Vector3.new(root.Position.X, targetY, root.Position.Z)

		if shapeMode == "Rectangle" then
			ad.Size = Vector3.new(playerWidth, GROUND_THICKNESS, playerLength)
			local fwd2D = getPlayerOrientation(root)
			local desiredWorldCFrame = CFrame.lookAt(pos2D, pos2D + fwd2D)
			ad.CFrame = root.CFrame:ToObjectSpace(desiredWorldCFrame)
		else
			ad.Radius = playerRadius
			local desiredWorldCFrame = CFrame.new(pos2D) * CFrame.Angles(math.rad(90), 0, 0)
			ad.CFrame = root.CFrame:ToObjectSpace(desiredWorldCFrame)
		end
	end

	if not enabled then
		if isPlayerInDanger then
			isPlayerInDanger = false
			currentThreat = nil
			currentThreatType = nil
			updateVisualColor(false)
			for _, cb in ipairs(dangerCallbacks) do
				pcall(cb, false, nil, nil)
			end
		end
		return
	end

	-- 2. Đánh giá trạng thái nguy hiểm thời gian thực
	local nowInDanger, nowThreat, nowThreatType = danger.IsPlayerInDanger()

	if nowInDanger ~= isPlayerInDanger or nowThreat ~= currentThreat then
		isPlayerInDanger = nowInDanger
		currentThreat = nowThreat
		currentThreatType = nowThreatType

		updateVisualColor(nowInDanger)

		for _, cb in ipairs(dangerCallbacks) do
			pcall(cb, nowInDanger, nowThreat, nowThreatType)
		end
	end
end

-- Bật / tắt hệ thống Danger Detection
function danger.SetEnabled(state)
	local shouldEnable = state and true or false
	if enabled == shouldEnable then return end
	enabled = shouldEnable

	if enabled then
		if not heartbeatConnection then
			heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
		end
	else
		if heartbeatConnection then
			heartbeatConnection:Disconnect()
			heartbeatConnection = nil
		end
		isPlayerInDanger = false
		currentThreat = nil
		currentThreatType = nil
		updateVisualColor(false)
		if playerAdornment and playerAdornment.Parent then
			playerAdornment.Visible = false
		end
		for _, cb in ipairs(dangerCallbacks) do
			pcall(cb, false, nil, nil)
		end
	end
end

function danger.IsEnabled()
	return enabled
end

-- Dọn dẹp hoàn toàn bộ nhớ
function danger.Clear()
	danger.SetEnabled(false)
	if playerAdornment then
		pcall(function() playerAdornment:Destroy() end)
		playerAdornment = nil
	end
end

return danger
