-- Smart Dodge – Module 3+4: Safe Spot Calculation & Player Visuals (DungeonQuest).
-- Chuyên trách: Tính toán điểm thoát nạn (CalculateSafeSpot + latching lock + 3 chiến lược thoát)
-- và visual quanh người: Safe Marker xanh, Hitbox Padding cyan.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
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
local safeSpotMarkerPart = nil
local hitboxVisualPart = nil
local showHitboxVisual = false
local ESCAPE_MARGIN = 4.5           -- Khoảng cách đệm an toàn sau khi ra khỏi mép (studs)
local BOSS1_DEFAULT_RADIUS = 50.0   -- Bán kính mặc định sàn đấu Boss 1 nếu không tìm thấy FirstPart
local boss1ArenaRadius = BOSS1_DEFAULT_RADIUS
local boss1ArenaCenter = nil
local boss1ArenaVisualPart = nil
local lockedArenaFloorY = nil
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

function safeSpot.GetBoss1ArenaCenter()
	return boss1ArenaCenter
end

function safeSpot.GetBoss1ArenaRadius()
	return boss1ArenaRadius or BOSS1_DEFAULT_RADIUS
end

--// Quản lý Highlight cột pha lê Boss 2 (secondBossCrystals)
local targetCrystalHighlight = nil
local lastHighlightedCrystal = nil

local function clearCrystalHighlight()
	if targetCrystalHighlight then
		pcall(function() targetCrystalHighlight:Destroy() end)
		targetCrystalHighlight = nil
	end
	lastHighlightedCrystal = nil
end

local function updateCrystalHighlight(crystalPart, colorName)
	if not crystalPart or not crystalPart.Parent then
		clearCrystalHighlight()
		return
	end
	if lastHighlightedCrystal == crystalPart and targetCrystalHighlight and targetCrystalHighlight.Parent then
		return
	end

	clearCrystalHighlight()
	lastHighlightedCrystal = crystalPart

	pcall(function()
		local box = Instance.new("SelectionBox")
		box.Name = "SmartDodge_CrystalGuideBox"
		local c = (colorName == "green" and Color3.fromRGB(50, 255, 50))
			or (colorName == "yellow" and Color3.fromRGB(255, 230, 0))
			or Color3.fromRGB(255, 45, 45)
		box.Color3 = c
		box.SurfaceColor3 = c
		box.SurfaceTransparency = 0.5
		box.LineThickness = 0.08
		box.Adornee = crystalPart
		box.Parent = crystalPart
		targetCrystalHighlight = box
	end)
end

local cachedSecondBossCrystals = nil

local function getBossCrystal(colorName)
	local crystalsModel = cachedSecondBossCrystals
	if not crystalsModel or not crystalsModel.Parent then
		crystalsModel = Workspace:FindFirstChild("secondBossCrystals")
		if not crystalsModel then
			local dungeon = Workspace:FindFirstChild("dungeon")
			if dungeon then
				crystalsModel = dungeon:FindFirstChild("secondBossCrystals", true)
			end
		end
		if not crystalsModel then
			crystalsModel = Workspace:FindFirstChild("secondBossCrystals", true)
		end
		if crystalsModel then
			cachedSecondBossCrystals = crystalsModel
		end
	end
	if not crystalsModel then return nil, {} end

	local targetCrystal = crystalsModel:FindFirstChild(colorName)
	if targetCrystal and not targetCrystal:IsA("BasePart") then
		targetCrystal = targetCrystal:FindFirstChildWhichIsA("BasePart")
	end

	local wrongCrystals = {}
	for _, child in ipairs(crystalsModel:GetChildren()) do
		if child.Name:lower() ~= colorName:lower() then
			local p = child:IsA("BasePart") and child or child:FindFirstChildWhichIsA("BasePart")
			if p then
				table.insert(wrongCrystals, p)
			end
		end
	end

	return targetCrystal, wrongCrystals
end

local cachedFirstBossPart = nil

--// Tìm kiếm Part giới hạn sàn đấu Boss 1 của game (workspace.FirstPart)
local function getFirstBossArenaPart()
	if cachedFirstBossPart and cachedFirstBossPart.Parent then
		return cachedFirstBossPart
	end

	-- 1. Tìm trực tiếp tại root Workspace (0.001ms)
	local p = Workspace:FindFirstChild("FirstPart")
	-- 2. Quét trong folder dungeon nếu có
	if not p then
		local dungeon = Workspace:FindFirstChild("dungeon")
		if dungeon then
			p = dungeon:FindFirstChild("FirstPart", true)
		end
	end
	-- 3. Fallback quét toàn bộ Workspace 1 lần duy nhất
	if not p then
		p = Workspace:FindFirstChild("FirstPart", true)
	end

	if p and p:IsA("BasePart") then
		cachedFirstBossPart = p
		return p
	end
	return nil
end

--// Quản lý Visual và giới hạn Sàn Đấu Boss 1 (Boss 1 Arena Visual & Boundary)
local function clearBoss1ArenaVisual()
	if boss1ArenaVisualPart then
		pcall(function() boss1ArenaVisualPart:Destroy() end)
		boss1ArenaVisualPart = nil
	end
	cachedFirstBossPart = nil
	lockedArenaFloorY = nil
end

-- Khóa cố định cao độ trục Y của sàn đấu ngay từ nhịp đầu tiên
local function getOrLockFloorY(centerPos, playerPos, firstPart)
	if lockedArenaFloorY then
		return lockedArenaFloorY
	end

	local floorY = nil
	if playerPos then
		local rawFloorY, hasFloor = geometry.GetRawFloorY(playerPos)
		if hasFloor and rawFloorY then
			floorY = rawFloorY + 0.1
		end
	end

	if not floorY and firstPart then
		-- Khóa theo điểm tiếp giáp sàn của FirstPart
		floorY = firstPart.Position.Y - (firstPart.Size.Y / 2) + 0.1
	end

	if not floorY and centerPos then
		local rawFloorY, hasFloor = geometry.GetRawFloorY(centerPos)
		if hasFloor and rawFloorY then
			floorY = rawFloorY + 0.1
		end
	end

	if floorY then
		lockedArenaFloorY = floorY
	end

	return lockedArenaFloorY or (playerPos and (playerPos.Y - 2.8)) or (centerPos and (centerPos.Y - 2.8)) or 0
end

local function updateBoss1ArenaVisual(centerPos, playerPos, firstPart)
	if not centerPos then
		clearBoss1ArenaVisual()
		return
	end

	-- Khóa trục Y cố định theo mặt sàn đấu
	local arenaFloorY = getOrLockFloorY(centerPos, playerPos, firstPart)

	local radius = boss1ArenaRadius or BOSS1_DEFAULT_RADIUS
	local diameter = (firstPart and firstPart.Size.X) or (radius * 2)
	local targetCF = CFrame.new(centerPos.X, arenaFloorY, centerPos.Z) * CFrame.Angles(0, 0, math.rad(90))

	if boss1ArenaVisualPart and boss1ArenaVisualPart.Parent then
		if math.abs(boss1ArenaVisualPart.Size.Y - diameter) > 0.5 then
			boss1ArenaVisualPart.Size = Vector3.new(0.2, diameter, diameter)
		end
		return
	end

	pcall(function()
		local part = Instance.new("Part")
		part.Name = "SmartDodge_Boss1ArenaVisual"
		part.Shape = Enum.PartType.Cylinder
		part.Size = Vector3.new(0.2, diameter, diameter)
		part.Color = Color3.fromRGB(0, 220, 255)
		part.Material = Enum.Material.Neon
		part.Transparency = 0.88
		part.Anchored = true
		part.CanCollide = false
		part.CanTouch = false
		part.CanQuery = false

		local highlight = Instance.new("Highlight")
		highlight.Name = "ArenaOutline"
		highlight.FillColor = Color3.fromRGB(0, 180, 255)
		highlight.FillTransparency = 0.92
		highlight.OutlineColor = Color3.fromRGB(0, 240, 255)
		highlight.OutlineTransparency = 0.1
		highlight.Adornee = part
		highlight.Parent = part

		local bb = Instance.new("BillboardGui")
		bb.Name = "ArenaLabel"
		bb.Size = UDim2.fromOffset(180, 26)
		bb.StudsOffset = Vector3.new(0, 3, 0)
		bb.AlwaysOnTop = true
		bb.Adornee = part
		bb.Parent = part

		local label = Instance.new("TextLabel")
		label.Name = "Label"
		label.Size = UDim2.fromScale(1, 1)
		label.BackgroundTransparency = 1
		label.TextColor3 = Color3.fromRGB(0, 230, 255)
		label.TextStrokeTransparency = 0.2
		label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		label.Font = Enum.Font.GothamBold
		label.TextSize = 13
		label.Text = "BOSS 1 ARENA (Safe Zone)"
		label.Parent = bb

		part.CFrame = targetCF
		part.Parent = Workspace.Terrain
		boss1ArenaVisualPart = part
	end)
end

local function isInsideBoss1Arena(pos, playerPos)
	if not boss1ArenaCenter then return true end
	local cand2D = Vector3.new(pos.X, 0, pos.Z)
	local center2D = Vector3.new(boss1ArenaCenter.X, 0, boss1ArenaCenter.Z)
	local candDist = (cand2D - center2D).Magnitude

	local maxRadius = boss1ArenaRadius or BOSS1_DEFAULT_RADIUS
	local playerDist = maxRadius
	if playerPos then
		local p2D = Vector3.new(playerPos.X, 0, playerPos.Z)
		playerDist = (p2D - center2D).Magnitude
	end

	local maxAllowed = math.max(maxRadius, playerDist - 0.5)
	return candDist <= maxAllowed
end

local function getBoss1ArenaScoreAdjustment(pos, playerPos)
	if not boss1ArenaCenter or not playerPos then return 0 end
	local center2D = Vector3.new(boss1ArenaCenter.X, 0, boss1ArenaCenter.Z)
	local pDist = (Vector3.new(playerPos.X, 0, playerPos.Z) - center2D).Magnitude
	local cDist = (Vector3.new(pos.X, 0, pos.Z) - center2D).Magnitude

	local maxRadius = boss1ArenaRadius or BOSS1_DEFAULT_RADIUS
	local pullThreshold = maxRadius * 0.55

	-- Nếu player đang bị dạt xa tâm:
	if pDist > pullThreshold then
		if cDist < pDist - 0.5 then
			return -12.0 -- Thưởng lớn kéo về tâm sàn
		elseif cDist > pDist + 0.5 then
			return 15.0  -- Phạt nặng dạt ra xa mép
		end
	end
	return 0
end

-- Tự động dọn visual và mở khóa Arena Center khi Boss 1 bị hạ gục hoặc chuyển màn
shared.OnBossActiveChanged(function(active)
	if not active then
		boss1ArenaCenter = nil
		boss1ArenaRadius = BOSS1_DEFAULT_RADIUS
		cachedFirstBossPart = nil
		cachedSecondBossCrystals = nil
		clearBoss1ArenaVisual()
	end
end)

shared.OnBossIndexChanged(function(index)
	cachedFirstBossPart = nil
	cachedSecondBossCrystals = nil
	if index ~= 1 then
		boss1ArenaCenter = nil
		boss1ArenaRadius = BOSS1_DEFAULT_RADIUS
		clearBoss1ArenaVisual()
	end
end)

--// Dọn visual marker/hitbox: unparent (giữ object để tái sử dụng) — engine stop loop gọi
function safeSpot.HideVisuals()
	if safeSpotMarkerPart and safeSpotMarkerPart.Parent then
		safeSpotMarkerPart.Parent = nil
	end
	if hitboxVisualPart and hitboxVisualPart.Parent then
		hitboxVisualPart.Parent = nil
	end
	clearBoss1ArenaVisual()
	clearCrystalHighlight()
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
	clearBoss1ArenaVisual()
	clearCrystalHighlight()
end

--// Reset lock an toàn (engine gọi khi dừng loop — tương đương lockedSafeSpot = nil)
function safeSpot.ResetLock()
	lockedSafeSpot = nil
	lockedHazardCount = 0
	clearCrystalHighlight()
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
	-- Ưu tiên số 1: Nếu có mục tiêu -> Luôn ép vector lực đẩy LÙI thẳng ra xa mục tiêu
	if targetFacing then
		local tPos = targetFacing.GetTargetPosition()
		if tPos then
			local diffX = playerPos.X - tPos.X
			local diffZ = playerPos.Z - tPos.Z
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
		-- Lấy vị trí trung tâm đại diện của từng Skill theo thời gian thực (hỗ trợ skill di động như movingBeam)
		local centerPos = nil
		if info.Instance and info.Instance.Parent then
			if info.Instance:IsA("Model") and info.Instance.PrimaryPart then
				centerPos = info.Instance.PrimaryPart.Position
			elseif info.Instance:IsA("BasePart") then
				centerPos = info.Instance.Position
			end
		end
		if not centerPos and info.ActiveParts then
			for part in pairs(info.ActiveParts) do
				if part and part.Parent and part:IsA("BasePart") then
					centerPos = part.Position
					break
				end
			end
		end
		centerPos = centerPos or info.Position

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

--// Trả về danh sách 12 góc quét được sắp xếp ưu tiên theo hướng di chuyển của Player hoặc lực đẩy thoát hiểm
local function getSearchAngles(repVector, moveDir)
	local baseAngleDeg = 0
	if moveDir then
		baseAngleDeg = math.deg(math.atan2(moveDir.Z, moveDir.X))
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
--// Ưu tiên hướng di chuyển của Player, hướng lùi tự nhiên và cự ly an toàn
local function scoreCandidate(playerPos, candPos, repVector, moveDir)
	-- Hard check cho Boss 1 Arena: Không chọn điểm ra ngoài phạm vi sàn đấu
	if boss1ArenaCenter and not isInsideBoss1Arena(candPos, playerPos) then
		return math.huge
	end

	local moveDist = (candPos - playerPos).Magnitude
	local clearance = getClearanceBonus(candPos)
	local score = moveDist - (clearance * 0.5)

	if moveDist > 0.5 then
		local dir = (candPos - playerPos).Unit
		if moveDir then
			local dotMove = dir:Dot(moveDir)
			if dotMove > 0 then
				-- Cùng phía / thuận hướng Player đang chủ động di chuyển: thưởng tới 3.5 studs
				score = score - (dotMove * 3.5)
			else
				-- Ngược hướng Player đang di chuyển: phạt nhẹ (+2.0 studs)
				score = score + (math.abs(dotMove) * 2.0)
			end
		elseif repVector then
			local dot = dir:Dot(repVector)
			score = score - (dot * 2.5) -- Thưởng tới 2.5 studs cho hướng lùi thoát hiểm tự nhiên ra sau
		end
	end

	-- Ưu tiên kéo về tâm sàn đấu Boss 1 nếu đang dạt ra xa
	if boss1ArenaCenter then
		score = score + getBoss1ArenaScoreAdjustment(candPos, playerPos)
	end

	return score
end

--// Thuật toán Quét Tỏa Tròn Đa Hướng (Fine-Grained Radial Sweep): tìm khoảng hở an toàn gần nhất kết hợp Path Check & Clearance
--// TỐI ƯU HÓA ĐỈNH CAO: Không bắn bất kỳ tia Raycast nào trong vòng lặp quét! Chỉ snap sàn 1 lần duy nhất cho điểm chốt cuối cùng.
local function searchRadialSafeSpot(playerPos, repVector, currentHazardsSet, dangerPart, moveDir)
	local angles = getSearchAngles(repVector, moveDir)
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
				local score = scoreCandidate(playerPos, testWorld, repVector, moveDir)

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
	local humanoid = player and player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	local playerPos = customPlayerPos or (rootPart and rootPart.Position)
	if not playerPos then
		lockedSafeSpot = nil
		lockedHazardCount = 0
		clearCrystalHighlight()
		return false, nil, nil, 0
	end

	-- Quản lý Arena Center & Visual cho Boss 1:
	local isBoss1 = shared.IsBossActive() and shared.GetCurrentBossIndex() == 1
	if isBoss1 then
		local firstPart = getFirstBossArenaPart()
		if firstPart then
			local fpPos = firstPart.Position
			local floorY = getOrLockFloorY(fpPos, playerPos, firstPart)
			boss1ArenaCenter = Vector3.new(fpPos.X, floorY, fpPos.Z)
			local fpRadius = math.max(firstPart.Size.X, firstPart.Size.Z) / 2
			boss1ArenaRadius = math.max(20, fpRadius - 2.5)
			updateBoss1ArenaVisual(boss1ArenaCenter, playerPos, firstPart)
		elseif not boss1ArenaCenter then
			local bPos = targetFacing.GetTargetPosition()
			if not bPos then
				local tracked = shared.GetTrackedEnemyData()
				if tracked and #tracked > 0 and tracked[1].Root and tracked[1].Root.Parent then
					bPos = tracked[1].Root.Position
				end
			end
			if bPos then
				local floorY = getOrLockFloorY(bPos, playerPos, nil)
				boss1ArenaCenter = Vector3.new(bPos.X, floorY, bPos.Z)
				boss1ArenaRadius = BOSS1_DEFAULT_RADIUS
				updateBoss1ArenaVisual(boss1ArenaCenter, playerPos, nil)
			end
		elseif boss1ArenaCenter then
			updateBoss1ArenaVisual(boss1ArenaCenter, playerPos, nil)
		end
	else
		if boss1ArenaCenter then
			boss1ArenaCenter = nil
			boss1ArenaRadius = BOSS1_DEFAULT_RADIUS
			clearBoss1ArenaVisual()
		end
	end

	-- Tầng 1 & 3: Nếu không còn kẻ địch nào trong phòng và không ở boss room -> Hoàn toàn an toàn
	if shared.GetEnemyCount() == 0 and not shared.IsBossActive() then
		lockedSafeSpot = nil
		lockedHazardCount = 0
		clearCrystalHighlight()
		return false, nil, nil, 0
	end

	-- Tầng 3: Zero Nearby Enemies Filter (ngoài Boss Room)
	-- Nếu không có bất kỳ con quái sống nào trong bán kính 85 studs -> Bỏ qua các chiêu rác/phantom
	if not shared.IsBossActive() then
		local tracked = shared.GetTrackedEnemyData()
		local hasNearbyEnemy = false
		if tracked and #tracked > 0 then
			for _, data in ipairs(tracked) do
				if data and data.Root and data.Root.Parent then
					local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
					if hum and hum.Health > 0 then
						if (data.Root.Position - playerPos).Magnitude <= 85 then
							hasNearbyEnemy = true
							break
						end
					end
				end
			end
		end
		if not hasNearbyEnemy then
			lockedSafeSpot = nil
			lockedHazardCount = 0
			clearCrystalHighlight()
			return false, nil, nil, 0
		end
	end

	-- Lấy Boss 2 Orb đang kích hoạt (nếu có) để highlight cột pha lê và loại trừ khỏi check né giật cục
	local activeOrbPart, orbColorName = detection.GetActiveBossOrb()
	if activeOrbPart and orbColorName then
		local targetCrystal = getBossCrystal(orbColorName)
		if targetCrystal then
			updateCrystalHighlight(targetCrystal, orbColorName)
		end
	else
		clearCrystalHighlight()
	end

	-- 1. ƯU TIÊN SỐ 1: NÉ TRƯỚC (DODGE HAZARDS FIRST)
	-- Kiểm tra xem Player có đang đứng trong bất kỳ vùng nguy hiểm nào không (bỏ qua quả cầu đang dí)
	local inDanger, dangerInfo, dangerPart, dangerTraj = geometry.IsPointInAnyHazard(playerPos, activeOrbPart)
	if not inDanger or not dangerPart then
		-- 2. ƯU TIÊN SỐ 2: DẪN ORB VỀ CỘT KHI ĐANG AN TOÀN
		if activeOrbPart and orbColorName then
			local targetCrystal, wrongCrystals = getBossCrystal(orbColorName)
			if targetCrystal then
				local orbPos = activeOrbPart.Position
				local crystalPos = targetCrystal.Position

				-- Vector hướng từ quả cầu tới cột pha lê (Orb -> Crystal)
				local dirFromOrb = Vector3.new(crystalPos.X - orbPos.X, 0, crystalPos.Z - orbPos.Z)
				if dirFromOrb.Magnitude > 0.5 then
					dirFromOrb = dirFromOrb.Unit
				else
					dirFromOrb = Vector3.new(0, 0, 1)
				end

				-- Vị trí đứng chuẩn: Đứng ngay phía sau cột pha lê (cột nằm giữa quả cầu và player)
				local behindCrystal = crystalPos + dirFromOrb * 3.8

				-- Kiểm tra xem quả cầu có đang chắn ngay trên đường chạy thẳng từ player tới cột không
				local vecToCrystal = Vector3.new(crystalPos.X - playerPos.X, 0, crystalPos.Z - playerPos.Z)
				local distToCrystal = vecToCrystal.Magnitude
				local vecToOrb = Vector3.new(orbPos.X - playerPos.X, 0, orbPos.Z - playerPos.Z)
				local distToOrb = vecToOrb.Magnitude

				local chosenTarget = behindCrystal

				-- Nếu player đang ở xa (> 8 studs) và quả cầu đang chặn giữa player và cột -> Bước chếch sang bên hông (flank)
				if distToCrystal > 8 and distToOrb < distToCrystal and distToOrb < 25 then
					local dirPC = vecToCrystal.Unit
					local dirPO = vecToOrb.Unit
					local dot = dirPC:Dot(dirPO)
					if dot > 0.75 then
						local perp = Vector3.new(-dirPC.Z, 0, dirPC.X)
						local cand1 = playerPos + (dirPC * 0.6 + perp * 0.8).Unit * 12
						local cand2 = playerPos + (dirPC * 0.6 - perp * 0.8).Unit * 12
						if (cand1 - orbPos).Magnitude > (cand2 - orbPos).Magnitude then
							chosenTarget = cand1
						else
							chosenTarget = cand2
						end
					end
				end

				-- Tránh xa 2 cột khác màu (wrong crystals)
				for _, wrongCr in ipairs(wrongCrystals) do
					local wPos = wrongCr.Position
					local diffW = Vector3.new(chosenTarget.X - wPos.X, 0, chosenTarget.Z - wPos.Z)
					if diffW.Magnitude < 10 and diffW.Magnitude > 0.1 then
						chosenTarget = chosenTarget + diffW.Unit * (10 - diffW.Magnitude)
					end
				end

				-- Snap xuống mặt sàn
				local snapped, hasFloor = geometry.GetFloorPosition(chosenTarget)
				local finalGuidePos = hasFloor and snapped or chosenTarget

				-- NẾU ĐÍCH ĐẾN TẠI CỘT BỊ DÍNH SKILL CỦA BOSS (Ví dụ gai nhọn cắm ngay sau cột)
				-- Xoay nhẹ góc đứng quanh cột (±30°, ±45°, ±60°, ±90°) để chọn điểm an toàn nhất vẫn giữ cột chặn bóng
				if not geometry.IsSpotFullySafe(finalGuidePos, 0.8, activeOrbPart) then
					local testAngles = { 30, -30, 45, -45, 60, -60, 90, -90, 120, -120 }
					for _, angleDeg in ipairs(testAngles) do
						local rad = math.rad(angleDeg)
						local cosA = math.cos(rad)
						local sinA = math.sin(rad)
						local rotDir = Vector3.new(dirFromOrb.X * cosA - dirFromOrb.Z * sinA, 0, dirFromOrb.X * sinA + dirFromOrb.Z * cosA)
						local altPos = crystalPos + rotDir * 4.0
						local sFloor, hasF = geometry.GetFloorPosition(altPos)
						local candAlt = hasF and sFloor or altPos

						if geometry.IsSpotFullySafe(candAlt, 0.8, activeOrbPart) then
							finalGuidePos = candAlt
							break
						end
					end
				end

				-- KIỂM TRA ĐOẠN ĐƯỜNG CHẠY TỚI CỘT: CÓ BỊ SKILL KHÁC CHẶN ĐƯỜNG KHÔNG?
				local isDirectPathSafe = geometry.IsPathSafe(playerPos, finalGuidePos, nil, nil, activeOrbPart)
				if not isDirectPathSafe then
					local forward = Vector3.new(finalGuidePos.X - playerPos.X, 0, finalGuidePos.Z - playerPos.Z)
					local distToTarget = forward.Magnitude
					local fUnit = distToTarget > 1 and forward.Unit or Vector3.new(0, 0, 1)
					local perp = Vector3.new(-fUnit.Z, 0, fUnit.X)

					local detourCandidates = {}
					local testSteps = { 6, 10, 15, 20 }
					local testLateral = { 8, -8, 12, -12, 16, -16, 20, -20 }
					for _, s in ipairs(testSteps) do
						if s < distToTarget then
							for _, lat in ipairs(testLateral) do
								local cand = playerPos + fUnit * s + perp * lat
								table.insert(detourCandidates, cand)
							end
						end
					end

					local bestDetour = nil
					local bestScore = math.huge
					for _, cand in ipairs(detourCandidates) do
						local snappedFloor, hasF = geometry.GetFloorPosition(cand)
						local testPos = hasF and snappedFloor or cand
						if geometry.IsSpotFullySafe(testPos, 0.8, activeOrbPart) then
							if geometry.IsPathSafe(playerPos, testPos, nil, nil, activeOrbPart) then
								local safeFromWrong = true
								for _, wCr in ipairs(wrongCrystals) do
									if (testPos - wCr.Position).Magnitude < 10 then
										safeFromWrong = false
										break
									end
								end
								if safeFromWrong then
									local score = (testPos - finalGuidePos).Magnitude
									if score < bestScore then
										bestScore = score
										bestDetour = testPos
									end
								end
							end
						end
					end

					if bestDetour then
						lockedSafeSpot = bestDetour
						lockedHazardCount = 1
						return true, bestDetour, ("Detour around skill -> %s Crystal"):format(orbColorName:upper()), (bestDetour - playerPos).Magnitude
					else
						-- Đường đi bị chặn hoàn toàn bởi chiêu thức nguy hiểm và không có ngách vòng:
						-- GIỮ NGUYÊN VỊ TRÍ AN TOÀN HIỆN TẠI đợi chiêu tan biến thay vì đâm đầu tự sát!
						lockedSafeSpot = playerPos
						lockedHazardCount = 1
						return true, playerPos, ("Waiting for path to clear -> %s Crystal"):format(orbColorName:upper()), 0
					end
				end

				local escapeDist = (finalGuidePos - playerPos).Magnitude
				lockedSafeSpot = finalGuidePos
				lockedHazardCount = 1

				return true, finalGuidePos, ("Lead %s -> %s Crystal"):format(activeOrbPart.Name, orbColorName:upper()), escapeDist
			end
		end

		lockedSafeSpot = nil
		lockedHazardCount = 0
		clearCrystalHighlight()
		return false, nil, nil, 0
	end

	-- KHI TỚI ĐÂY: inDanger == true (Player đang dính chiêu nguy hiểm của Boss)
	-- -> THỰC THI NÉ TRƯỚC (DODGE HAZARDS FIRST) THEO THUẬT TOÁN TIÊU CHUẨN!
	local hazardName = dangerInfo.Name or "Unknown"

	-- Xác định hướng di chuyển chủ động hiện tại của Player (độ ưu tiên: Humanoid.MoveDirection -> RootPart.AssemblyLinearVelocity)
	local moveDir = nil
	if humanoid and humanoid.MoveDirection.Magnitude > 0.1 then
		moveDir = Vector3.new(humanoid.MoveDirection.X, 0, humanoid.MoveDirection.Z).Unit
	elseif rootPart then
		local vel = rootPart.AssemblyLinearVelocity
		local vel2D = Vector3.new(vel.X, 0, vel.Z)
		if vel2D.Magnitude > 1.5 then
			moveDir = vel2D.Unit
		end
	end

	-- Lấy toàn bộ các hazard đang bao phủ vị trí Player (hỗ trợ nhiều chiêu đè nhau)
	local currentHazardsSet, currentHazardCount = geometry.GetAllHazardsAtPoint(playerPos)

	-- 2. ĐÁNH GIÁ KHÓA ĐIỂM HIỆN TẠI (Smart Latching with Hysteresis & Path Safety Check):
	local hasValidLock = false
	local lockedDist = math.huge
	if lockedSafeSpot and geometry.IsSpotFullySafe(lockedSafeSpot, 0.8) then
		if boss1ArenaCenter and not isInsideBoss1Arena(lockedSafeSpot, playerPos) then
			lockedSafeSpot = nil
		else
			lockedDist = (lockedSafeSpot - playerPos).Magnitude
			-- Đề xuất 1 & 5: Điểm khóa phải nằm trong tầm và đường chạy tới điểm khóa vẫn phải an toàn
			if lockedDist <= 35 and geometry.IsPathSafe(playerPos, lockedSafeSpot, currentHazardsSet, dangerPart) then
				hasValidLock = true
			else
				lockedSafeSpot = nil
			end
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
			if boss1ArenaCenter and not isInsideBoss1Arena(candWorld, playerPos) then
				continue
			end
			if geometry.IsSpotFullySafe(candWorld, 0.8) then
				local snapped, hasFloor = geometry.GetFloorPosition(candWorld)
				if hasFloor and geometry.IsSpotFullySafe(snapped, 0.8) then
					if boss1ArenaCenter and not isInsideBoss1Arena(snapped, playerPos) then
						continue
					end
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
		-- 4. CHIẾN LƯỢC CHO PROJECTILE / MOVING BEAM:
		-- NGUYÊN TẮC VÀNG: TUYỆT ĐỐI KHÔNG NÉ VỀ PHÍA TRƯỚC THEO HƯỚNG BAY CỦA CHIÊU!
		-- (Vì né về phía trước theo hướng bay sẽ làm Green Spot xuất hiện trên đường đi của chiêu -> Player bị đẩy dần)
		-- Chỉ né theo 2 hướng an toàn:
		-- 1) Thoát ngang vuông góc sang 2 bên sườn (Perpendicular Left / Right)
		-- 2) Thoát lùi về phía sau (Behind / Backwards) sau khi thanh beam / đạn vừa quét qua!

		local forward2D = dangerTraj.forward2D
		local perpDist = dangerTraj.perpDist
		local dangerRadius = dangerTraj.dangerRadius
		local stepNeeded = math.max(3.5, (dangerRadius - perpDist) + ESCAPE_MARGIN)

		-- Vector vuông góc sang phải và sang trái (90 deg trên mặt phẳng X-Z)
		local perpRight = Vector3.new(forward2D.Z, 0, -forward2D.X)
		local perpLeft = Vector3.new(-forward2D.Z, 0, forward2D.X)

		local isMovingBeam = hazardName:lower():find("movingbeam") ~= nil
			or (dangerPart and dangerPart.Name:lower():find("movingbeam") ~= nil)

		local trajCandidates = {}

		if isMovingBeam then
			-- CHIẾN LƯỢC MOVING BEAM (Boss 2): Cho phép lùi sau đuôi beam đã quét qua
			local fOffsets = { 0, -3, -6, -10 }
			for _, fOff in ipairs(fOffsets) do
				local fVec = forward2D * fOff
				table.insert(trajCandidates, playerPos + perpRight * stepNeeded + fVec)
				table.insert(trajCandidates, playerPos + perpLeft * stepNeeded + fVec)
				table.insert(trajCandidates, playerPos + perpRight * (stepNeeded + 2.5) + fVec)
				table.insert(trajCandidates, playerPos + perpLeft * (stepNeeded + 2.5) + fVec)
			end

			if dangerPart and dangerPart.Parent then
				local bPos = Vector3.new(dangerPart.Position.X, playerPos.Y, dangerPart.Position.Z)
				table.insert(trajCandidates, bPos - forward2D * 7.0)
				table.insert(trajCandidates, bPos - forward2D * 11.0)
				table.insert(trajCandidates, bPos - forward2D * 7.0 + perpRight * 5.0)
				table.insert(trajCandidates, bPos - forward2D * 7.0 + perpLeft * 5.0)
			end
			table.insert(trajCandidates, playerPos - forward2D * (ESCAPE_MARGIN + 4.0))
			table.insert(trajCandidates, playerPos - forward2D * (ESCAPE_MARGIN + 8.0))
			table.insert(trajCandidates, playerPos - forward2D * (ESCAPE_MARGIN + 12.0))
		else
			-- CHIẾN LƯỢC PROJECTILE / BEAM CỦA BOSS 1 (firstBossBigSpike, seekingSpikes):
			-- TUYỆT ĐỐI KHÔNG NÉ LÙI DỌC CHIÊU! Chỉ né vuông góc ngang sang 2 bên sườn (Perpendicular Lateral Escapes)
			local latSteps = { stepNeeded, stepNeeded + 2.5, stepNeeded + 5.0 }
			local smallFOffsets = { 0, 1.5, -1.5, 3.0, -3.0 }
			for _, sDist in ipairs(latSteps) do
				for _, fOff in ipairs(smallFOffsets) do
					local fVec = forward2D * fOff
					table.insert(trajCandidates, playerPos + perpRight * sDist + fVec)
					table.insert(trajCandidates, playerPos + perpLeft * sDist + fVec)
				end
			end
		end

		local bestPos = nil
		local bestScore = math.huge
		local fallbackPos = nil
		local fallbackScore = math.huge

		for _, candWorld in ipairs(trajCandidates) do
			-- Hard gate Arena Boss 1: Không chọn điểm ra khỏi sàn đấu
			if boss1ArenaCenter and not isInsideBoss1Arena(candWorld, playerPos) then
				continue
			end

			-- LỌC CHẶN TRIỆT ĐỂ: Tuyệt đối không chọn điểm nào nằm về phía trước theo hướng bay của chiêu (+forward2D)
			local toCand = candWorld - playerPos
			if toCand.Magnitude > 0.5 then
				local dotForward = toCand.Unit:Dot(forward2D)
				if dotForward > 0.25 then
					continue
				end
			end

			if geometry.IsSpotFullySafe(candWorld, 0.8) then
				local snapped, hasFloor = geometry.GetFloorPosition(candWorld)
				if hasFloor and geometry.IsSpotFullySafe(snapped, 0.8) then
					-- Hard gate Arena Boss 1 cho điểm sau khi snap sàn
					if boss1ArenaCenter and not isInsideBoss1Arena(snapped, playerPos) then
						continue
					end

					-- Kiểm tra lại điểm đã snap xuống sàn cũng không được nằm về phía trước
					local toSnapped = snapped - playerPos
					if toSnapped.Magnitude > 0.5 and toSnapped.Unit:Dot(forward2D) > 0.25 then
						continue
					end

					-- Chấm điểm ưu tiên
					local moveDist = (snapped - playerPos).Magnitude
					local clearance = getClearanceBonus(snapped)
					local score = moveDist - (clearance * 0.5)

					local dotFwd = toSnapped.Magnitude > 0.5 and toSnapped.Unit:Dot(forward2D) or 0
					if isMovingBeam and dotFwd < -0.2 then
						-- Chỉ thưởng lùi ra sau cho Moving Beam của Boss 2!
						score = score - 15.0
					elseif not isMovingBeam then
						-- Với Boss 1: Thưởng né thuần ngang vuông góc (Perpendicular)
						local dotPerp = toSnapped.Magnitude > 0.5 and math.abs(toSnapped.Unit:Dot(perpRight)) or 0
						if dotPerp > 0.7 then
							score = score - 8.0 -- Thưởng lớn cho bước né thuần ngang sang 2 bên sườn
						end
					end

					-- Ưu tiên kéo về tâm sàn đấu Boss 1 nếu đang dạt ra xa
					if boss1ArenaCenter then
						score = score + getBoss1ArenaScoreAdjustment(snapped, playerPos)
					end

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
			-- Fallback: KHÔNG dùng repVector (vì repVector chỉ về phía trước)!
			-- Quét tỏa các góc LÙI VÀ NGANG:
			-- Với Moving Beam: 90°, -90°, 120°, -120°, 150°, -150°, 180°
			-- Với Boss 1: Chỉ quét các góc thuần ngang 90°, -90° và chéo nhẹ 75°, -75°, 105°, -105°, 60°, -60°, 120°, -120° (KHÔNG lùi 180°)
			local fwdAngleDeg = math.deg(math.atan2(forward2D.Z, forward2D.X))
			local testAngles = isMovingBeam and { 90, -90, 120, -120, 150, -150, 180 }
				or { 90, -90, 75, -75, 105, -105, 60, -60, 120, -120 }
			local backRadii = { 4.0, 7.0, 11.0, 16.0, 22.0 }

			for _, dist in ipairs(backRadii) do
				for _, offDeg in ipairs(testAngles) do
					local testRad = math.rad(fwdAngleDeg + offDeg)
					local testWorld = playerPos + Vector3.new(math.cos(testRad) * dist, 0, math.sin(testRad) * dist)
					if boss1ArenaCenter and not isInsideBoss1Arena(testWorld, playerPos) then
						continue
					end
					if geometry.IsSpotFullySafe(testWorld, 0.8) then
						local snapped, hasFloor = geometry.GetFloorPosition(testWorld)
						if hasFloor and geometry.IsSpotFullySafe(snapped, 0.8) then
							if boss1ArenaCenter and not isInsideBoss1Arena(snapped, playerPos) then
								continue
							end
							if geometry.IsPathSafe(playerPos, snapped, currentHazardsSet, dangerPart) then
								bestPos = snapped
								break
							end
						end
					end
				end
				if bestPos then break end
			end
		end

		candidatePos = bestPos or fallbackPos
	else
		-- 5. CHIẾN LƯỢC CHO KỸ NĂNG THÔNG THƯỜNG / ĐÈ NHAU (MULTI-HAZARD SOLVER)
		-- Ưu tiên số 1: Quét tỏa tròn 360 độ (ưu tiên theo hướng di chuyển của Player hoặc lùi ra xa Boss/vụ nổ)
		local radPos, radScore = searchRadialSafeSpot(playerPos, repVector, currentHazardsSet, dangerPart, moveDir)

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
			elseif dangerPart.Name:lower():find("movingbeam") or (dangerPart.Parent and dangerPart.Parent.Name:lower():find("movingbeam")) then
				-- A2. Kỹ năng Moving Beam (thanh beam di động quét sàn xoay quanh trục X):
				-- Thoát sang 2 đầu thanh beam (trái / phải) hoặc lùi sau thanh beam đã đi qua
				local rightVec = dangerPart.CFrame.RightVector
				local right2D = Vector3.new(rightVec.X, 0, rightVec.Z)
				if right2D.Magnitude > 0.001 then
					right2D = right2D.Unit
				else
					right2D = Vector3.new(1, 0, 0)
				end
				local forward2D = Vector3.new(-right2D.Z, 0, right2D.X)
				local halfLength = math.max(dangerPart.Size.X, dangerPart.Size.Z) / 2
				local beamRadius = math.max(dangerPart.Size.Y, math.min(dangerPart.Size.X, dangerPart.Size.Z)) / 2
				if beamRadius < 3.5 then beamRadius = 3.5 end

				-- Thoát sang 2 đầu thanh beam (trái / phải)
				table.insert(directCandidates, dangerPart.Position + right2D * (halfLength + ESCAPE_MARGIN + 2.0))
				table.insert(directCandidates, dangerPart.Position - right2D * (halfLength + ESCAPE_MARGIN + 2.0))

				-- Thoát ra trước / sau thanh beam (vượt qua hoặc lùi sau thanh beam)
				table.insert(directCandidates, dangerPart.Position + forward2D * (beamRadius + ESCAPE_MARGIN + 3.0))
				table.insert(directCandidates, dangerPart.Position - forward2D * (beamRadius + ESCAPE_MARGIN + 3.0))
				table.insert(directCandidates, dangerPart.Position + forward2D * (beamRadius + ESCAPE_MARGIN + 6.0))
				table.insert(directCandidates, dangerPart.Position - forward2D * (beamRadius + ESCAPE_MARGIN + 6.0))
			else
				-- A3. Chiêu hình chữ nhật / OBB: Thoát theo cả 4 cạnh và 4 góc của hộp
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
						local score = scoreCandidate(playerPos, snapped, repVector, moveDir)
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

	-- 6. ÁP DỤNG CƠ CHẾ KHÓA ĐIỂM ĐỘNG THÔNG MINH (Dynamic Real-time Safe Spot Hysteresis)
	local chosenSpot = nil

	if candidatePos and geometry.IsSpotFullySafe(candidatePos, 0.8) then
		local candDist = (candidatePos - playerPos).Magnitude

		if hasValidLock and lockedSafeSpot then
			-- So sánh giữa điểm khóa cũ (lockedSafeSpot) và điểm mới tính (candidatePos)
			local distAdvantage = lockedDist - candDist -- Độ lợi cự ly nếu đổi sang candidate mới
			local hazardSetChanged = (currentHazardCount > lockedHazardCount)

			-- Kiểm tra xem Player có đang chủ động di chuyển về phía candidate mới không
			local playerMovingTowardsCand = false
			if moveDir and candDist > 0.5 then
				local candVec = Vector3.new(candidatePos.X - playerPos.X, 0, candidatePos.Z - playerPos.Z)
				if candVec.Magnitude > 0.01 and candVec.Unit:Dot(moveDir) > 0.3 then
					playerMovingTowardsCand = true
				end
			end

			-- Chuyển sang candidate mới khi:
			-- 1. Có thêm chiêu mới xuất hiện (hazardSetChanged)
			-- 2. Player đang chủ động di chuyển về phía candidate mới VÀ candidate mới gần bằng hoặc gần hơn điểm cũ (candDist <= lockedDist + 1.0)
			-- 3. Candidate mới gần hơn rõ rệt (distAdvantage >= 1.5 studs)
			-- 4. Điểm cũ còn xa (> 6.0 studs) trong khi candidate mới thoát hiểm rất gần (<= 4.0 studs)
			if hazardSetChanged 
				or (playerMovingTowardsCand and candDist <= (lockedDist + 1.0))
				or distAdvantage >= 1.5 
				or (lockedDist > 6.0 and candDist <= 4.0) then
				chosenSpot = candidatePos
				lockedSafeSpot = candidatePos
				lockedHazardCount = currentHazardCount
			else
				-- Giữ nguyên điểm khóa cũ để chống rung lắc (Anti-jitter) khi đứng yên
				chosenSpot = lockedSafeSpot
			end
		else
			-- Chưa có khóa hoặc khóa cũ đã hỏng (bị chiêu đè) -> Khóa ngay điểm candidate mới
			chosenSpot = candidatePos
			lockedSafeSpot = candidatePos
			lockedHazardCount = currentHazardCount
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
	return true, nil, hazardName, 0
end

return safeSpot