--================================================================--
-- Smart Dodge V2: Universal Boss Arena Limiter (Per-Boss Spawn Anchor)
--
-- Cơ chế: Hệ thống quản lý sàn đấu toàn năng cho TẤT CẢ các Boss (Boss 1, 2, 3+).
-- Cho phép người chơi dễ dàng:
--   1. Bật / Tắt (Enable/Disable) riêng biệt cho từng Boss.
--   2. Tùy chỉnh Bán kính (Radius 15-200 std) riêng biệt cho từng Boss.
--   3. Tự động chuyển đổi cấu hình tương ứng khi bước vào từng Boss.
--   4. Neo tâm sàn đấu tại vị trí Boss xuất hiện ban đầu (Spawn Anchor)
--      và tự động hạ cao độ xuống mặt đất thực tế (tránh tảng đá/bục đài).
--================================================================--

local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local tracker = require("@routes/DungeonQuest/core/autoFarm/tracker")

local bossArea = {}

--// Cấu hình riêng cho từng Boss
type BossConfig = {
	enabled: boolean,
	radius: number,
}

local bossConfigs: { [number]: BossConfig } = {
	[1] = { enabled = true, radius = 45.0 },  -- Boss 1: Mặc định BẬT (phòng out-of-bounds death)
	[2] = { enabled = false, radius = 55.0 }, -- Boss 2: Mặc định TẮT (tùy người chơi bật)
	[3] = { enabled = false, radius = 65.0 }, -- Boss 3: Mặc định TẮT (tùy người chơi bật)
}

local DEFAULT_RADIUS = 45.0
local BOUNDARY_SAFETY_PADDING = 1.0 -- Khoảng cách đệm an toàn lùi vào trong mép (studs)
local COLOR_ARENA = Color3.fromRGB(0, 220, 255)       -- Hologram Cyan
local COLOR_ARENA_OUTLINE = Color3.fromRGB(0, 245, 255) -- Radiant Cyan Neon

--// Cấu hình Boss 1 Center Deadzone (Tránh né vào trung tâm)
local boss1AvoidCenter = true
local boss1CenterRadius = 16.0
local COLOR_DEADZONE = Color3.fromRGB(255, 60, 40)
local COLOR_DEADZONE_OUTLINE = Color3.fromRGB(255, 120, 50)

--// State chung
local showVisual = false           -- Hiển thị đĩa Hologram & đường viền ranh giới
local anchorCenter: Vector3? = nil
local anchorFloorY: number? = nil
local currentLockedBossIndex: number? = nil
local captureThread: thread? = nil
local statusCallbacks: { (boolean, Vector3?, number, number?) -> () } = {}

--// Visuals
local visualFolder: Folder? = nil
local visualDisk: Part? = nil
local visualDeadzoneDisk: Part? = nil
local visualDeadzoneHighlight: Highlight? = nil
local visualHighlight: Highlight? = nil
local visualBillboard: BillboardGui? = nil
local visualStatusLabel: TextLabel? = nil

-- Raycast params kiểm tra sàn vật lý thật
local floorRayParams = RaycastParams.new()
floorRayParams.FilterType = Enum.RaycastFilterType.Exclude
floorRayParams.IgnoreWater = true

--// ------------------------------------------------------------------ //
-- Helpers
--// ------------------------------------------------------------------ //

local function getActiveConfig(): (BossConfig, number)
	local curIdx = currentLockedBossIndex or shared.GetCurrentBossIndex()
	if curIdx <= 0 then curIdx = 1 end
	local cfg = bossConfigs[curIdx] or (curIdx > 3 and bossConfigs[3]) or bossConfigs[1]
	return cfg, curIdx
end

local function fireStatusChanged()
	local isLocked = (anchorCenter ~= nil)
	local cfg, curIdx = getActiveConfig()
	for _, cb in ipairs(statusCallbacks) do
		pcall(cb, isLocked, anchorCenter, cfg.radius, currentLockedBossIndex)
	end
end

-- Raycast tìm cao độ sàn vật lý thật (bỏ qua mọi spell/hitbox/mesh hiệu ứng)
local function getSolidFloorY(pos: Vector3, fallbackY: number): number
	local rayOrigin = Vector3.new(pos.X, pos.Y + 6.0, pos.Z)
	local curOrigin = rayOrigin
	local curDir = Vector3.new(0, -60.0, 0)

	local filterList = {}
	local player = services.player
	if player and player.Character then table.insert(filterList, player.Character) end
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player and p.Character then table.insert(filterList, p.Character) end
	end
	local rayIgnore = Workspace:FindFirstChild("RaycastIgnore")
	if rayIgnore then table.insert(filterList, rayIgnore) end
	local vFolder = Workspace:FindFirstChild("SmartDodgeV2_Visuals")
	if vFolder then table.insert(filterList, vFolder) end
	if visualFolder then table.insert(filterList, visualFolder) end

	local tracked = shared.GetTrackedEnemyData and shared.GetTrackedEnemyData()
	if tracked then
		for _, data in ipairs(tracked) do
			if data and data.Model and data.Model.Parent then
				table.insert(filterList, data.Model)
			end
		end
	end
	floorRayParams.FilterDescendantsInstances = filterList

	for _ = 1, 6 do
		local hit = Workspace:Raycast(curOrigin, curDir, floorRayParams)
		if not hit then break end

		local inst = hit.Instance
		if inst and (inst:IsA("Terrain") or inst.CanCollide) then
			local instName = inst.Name:lower()
			local isSpellPart = instName:find("indicator") ~= nil
				or instName:find("hitbox") ~= nil
				or instName:find("circle") ~= nil
				or instName:find("ring") ~= nil
				or instName:find("beam") ~= nil
				or instName:find("spike") ~= nil
				or instName:find("aoe") ~= nil
				or instName:find("hazard") ~= nil

			if not isSpellPart and not inst:FindFirstAncestorOfClass("Humanoid") then
				return hit.Position.Y
			end
		end

		table.insert(filterList, inst)
		floorRayParams.FilterDescendantsInstances = filterList

		local nextY = hit.Position.Y - 0.05
		local remainingDist = (rayOrigin.Y - 60.0) - nextY
		if remainingDist >= 0 then break end
		curOrigin = Vector3.new(hit.Position.X, nextY, hit.Position.Z)
		curDir = Vector3.new(0, remainingDist, 0)
	end

	return fallbackY
end

-- Tìm RootPart của Boss hiện tại trong thế giới
local function findCurrentBossRoot(): BasePart?
	-- 1. Scan danh sách tracked enemies của shared
	local tracked = shared.GetTrackedEnemyData and shared.GetTrackedEnemyData()
	if tracked then
		for _, data in ipairs(tracked) do
			if data and data.Model and data.Root and data.Root.Parent then
				if shared.IsBossEnemy(data.Model, data.Model.Name) then
					local hum = data.Humanoid or data.Model:FindFirstChildOfClass("Humanoid")
					if hum and hum.Health > 0 then
						return data.Root
					end
				end
			end
		end
	end

	-- 2. Fallback: AutoFarm tracker target
	local afTarget = tracker.GetTarget and tracker.GetTarget()
	if afTarget and afTarget.Model and afTarget.Root and afTarget.Root.Parent then
		if shared.IsBossEnemy(afTarget.Model, afTarget.Model.Name) then
			local hum = afTarget.Humanoid or afTarget.Model:FindFirstChildOfClass("Humanoid")
			if hum and hum.Health > 0 then
				return afTarget.Root
			end
		end
	end

	-- 3. Fallback: Quét folder dungeon
	local dungeon = Workspace:FindFirstChild("dungeon")
	if dungeon then
		for _, desc in ipairs(dungeon:GetDescendants()) do
			if desc:IsA("Model") and shared.IsBossEnemy(desc, desc.Name) then
				local hum = desc:FindFirstChildOfClass("Humanoid")
				if hum and hum.Health > 0 then
					local root = desc:FindFirstChild("HumanoidRootPart") or desc.PrimaryPart or desc:FindFirstChildWhichIsA("BasePart")
					if root then return root end
				end
			end
		end

		-- 4. Fallback sâu: Tìm model có MaxHealth lớn nhất trong dungeon (khi shared.trackedEnemies chưa kịp đồng bộ)
		local highestHp = 0
		local bestRoot: BasePart? = nil
		for _, desc in ipairs(dungeon:GetDescendants()) do
			if desc:IsA("Model") then
				local hum = desc:FindFirstChildOfClass("Humanoid")
				if hum and hum.Health > 0 and hum.MaxHealth > highestHp then
					local root = desc:FindFirstChild("HumanoidRootPart") or desc.PrimaryPart or desc:FindFirstChildWhichIsA("BasePart")
					if root then
						highestHp = hum.MaxHealth
						bestRoot = root
					end
				end
			end
		end
		if bestRoot then
			return bestRoot
		end
	end

	return nil
end

--// ------------------------------------------------------------------ //
-- Visual Management (Đĩa Hologram + Đường viền ranh giới sàn đấu)
--// ------------------------------------------------------------------ //

local function getOrCreateVisualFolder(): Folder
	if visualFolder and visualFolder.Parent then
		return visualFolder
	end
	local container = Workspace
	local f = container:FindFirstChild("SmartDodgeV2_BossAreaVisual")
	if not f then
		f = Instance.new("Folder")
		f.Name = "SmartDodgeV2_BossAreaVisual"
		f.Parent = container
	end
	visualFolder = f
	return f
end

local function destroyVisual()
	if visualDisk then
		pcall(function() visualDisk:Destroy() end)
		visualDisk = nil
	end
	if visualDeadzoneDisk then
		pcall(function() visualDeadzoneDisk:Destroy() end)
		visualDeadzoneDisk = nil
	end
	visualDeadzoneHighlight = nil
	visualHighlight = nil
	visualBillboard = nil
	visualStatusLabel = nil
	if visualFolder and visualFolder.Parent then
		pcall(function() visualFolder:Destroy() end)
		visualFolder = nil
	end
end

local function updateVisual()
	local cfg, curIdx = getActiveConfig()

	if not showVisual or not anchorCenter then
		if visualDisk then visualDisk.Transparency = 1 end
		if visualDeadzoneDisk then visualDeadzoneDisk.Transparency = 1 end
		if visualHighlight then visualHighlight.Enabled = false end
		if visualDeadzoneHighlight then visualDeadzoneHighlight.Enabled = false end
		if visualBillboard then visualBillboard.Enabled = false end
		return
	end

	local radius = cfg.radius or DEFAULT_RADIUS
	local diameter = radius * 2
	local folder = getOrCreateVisualFolder()
	local floorY = anchorFloorY or (anchorCenter and anchorCenter.Y) or 0
	local targetCF = CFrame.new(anchorCenter.X, floorY + 0.15, anchorCenter.Z) * CFrame.Angles(0, 0, math.rad(90))

	if not visualDisk or not visualDisk.Parent then
		local disk = Instance.new("Part")
		disk.Name = "SDV2_BossArenaDisk"
		disk.Shape = Enum.PartType.Cylinder
		disk.Size = Vector3.new(0.12, diameter, diameter)
		disk.Material = Enum.Material.Neon
		disk.Color = COLOR_ARENA
		disk.Transparency = 0.88
		disk.Anchored = true
		disk.CanCollide = false
		disk.CanTouch = false
		disk.CanQuery = false
		disk.CastShadow = false
		disk.Massless = true
		disk.CFrame = targetCF
		disk.Parent = folder
		visualDisk = disk

		local hl = Instance.new("Highlight")
		hl.Name = "ArenaBoundaryRing"
		hl.Adornee = disk
		hl.FillColor = COLOR_ARENA
		hl.FillTransparency = 0.94
		hl.OutlineColor = COLOR_ARENA_OUTLINE
		hl.OutlineTransparency = 0.15
		hl.Parent = disk
		visualHighlight = hl

		local bb = Instance.new("BillboardGui")
		bb.Name = "ArenaLabel"
		bb.AlwaysOnTop = true
		bb.Size = UDim2.fromOffset(220, 36)
		bb.StudsOffsetWorldSpace = Vector3.new(0, 3.5, 0)
		bb.Adornee = disk
		bb.Parent = disk
		visualBillboard = bb

		local frame = Instance.new("Frame")
		frame.Size = UDim2.fromScale(1, 1)
		frame.BackgroundColor3 = Color3.fromRGB(12, 18, 26)
		frame.BackgroundTransparency = 0.3
		frame.BorderSizePixel = 0
		frame.Parent = bb

		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 6)
		corner.Parent = frame

		local stroke = Instance.new("UIStroke")
		stroke.Color = COLOR_ARENA_OUTLINE
		stroke.Thickness = 1.2
		stroke.Transparency = 0.2
		stroke.Parent = frame

		local lbl = Instance.new("TextLabel")
		lbl.Name = "Text"
		lbl.Size = UDim2.fromScale(1, 1)
		lbl.BackgroundTransparency = 1
		lbl.Font = Enum.Font.GothamBold
		lbl.TextSize = 11
		lbl.TextColor3 = COLOR_ARENA_OUTLINE
		lbl.TextStrokeTransparency = 0.4
		lbl.RichText = true
		lbl.Parent = frame
		visualStatusLabel = lbl
	end

	if visualDisk and visualDisk.Parent then
		visualDisk.Transparency = 0.88
		visualDisk.Size = Vector3.new(0.12, diameter, diameter)
		visualDisk.CFrame = targetCF
	end
	if visualHighlight then
		visualHighlight.Enabled = true
	end
	if visualBillboard then
		visualBillboard.Enabled = true
	end

	-- Visual cho Vùng Cấm Trung Tâm Boss 1 (Center Deadzone)
	local isBoss1 = (curIdx == 1)
	local showDeadzone = isBoss1 and boss1AvoidCenter and (boss1CenterRadius > 0)
	if showDeadzone then
		local dzDiameter = boss1CenterRadius * 2
		local dzCF = CFrame.new(anchorCenter.X, floorY + 0.18, anchorCenter.Z) * CFrame.Angles(0, 0, math.rad(90))

		if not visualDeadzoneDisk or not visualDeadzoneDisk.Parent then
			local dzDisk = Instance.new("Part")
			dzDisk.Name = "SDV2_Boss1DeadzoneDisk"
			dzDisk.Shape = Enum.PartType.Cylinder
			dzDisk.Size = Vector3.new(0.14, dzDiameter, dzDiameter)
			dzDisk.Material = Enum.Material.Neon
			dzDisk.Color = COLOR_DEADZONE
			dzDisk.Transparency = 0.80
			dzDisk.Anchored = true
			dzDisk.CanCollide = false
			dzDisk.CanTouch = false
			dzDisk.CanQuery = false
			dzDisk.CastShadow = false
			dzDisk.Massless = true
			dzDisk.CFrame = dzCF
			dzDisk.Parent = folder
			visualDeadzoneDisk = dzDisk

			local dzHl = Instance.new("Highlight")
			dzHl.Name = "DeadzoneOutline"
			dzHl.Adornee = dzDisk
			dzHl.FillColor = COLOR_DEADZONE
			dzHl.FillTransparency = 0.90
			dzHl.OutlineColor = COLOR_DEADZONE_OUTLINE
			dzHl.OutlineTransparency = 0.1
			dzHl.Parent = dzDisk
			visualDeadzoneHighlight = dzHl
		else
			visualDeadzoneDisk.Transparency = 0.80
			visualDeadzoneDisk.Size = Vector3.new(0.14, dzDiameter, dzDiameter)
			visualDeadzoneDisk.CFrame = dzCF
			if visualDeadzoneHighlight then
				visualDeadzoneHighlight.Enabled = true
			end
		end
	else
		if visualDeadzoneDisk then visualDeadzoneDisk.Transparency = 1 end
		if visualDeadzoneHighlight then visualDeadzoneHighlight.Enabled = false end
	end

	if visualStatusLabel then
		local dzInfo = (curIdx == 1 and boss1AvoidCenter) and string.format(" | <font color='rgb(255,100,50)'>Deadzone: %.0fm</font>", boss1CenterRadius) or ""
		visualStatusLabel.Text = string.format("<b>🛡️ BOSS %d ARENA</b> <font color='rgb(255,255,255)'>(R: %.0fm)</font>%s", curIdx, radius, dzInfo)
	end
end

--// ------------------------------------------------------------------ //
-- Floor Calculation & Rock Avoidance
--// ------------------------------------------------------------------ //

-- Lấy độ cao mặt sàn từ vị trí của Player (người chơi luôn đứng/chạy trên sàn đấu thật)
local function getPlayerFloorY(): number?
	local player = services.player
	local char = player and player.Character
	local root = char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso"))
	if root and root.Parent then
		return getSolidFloorY(root.Position, root.Position.Y - 2.8)
	end
	return nil
end

-- Khảo sát các điểm xung quanh Boss ở cự ly 15-20 studs (tránh tảng đá/bục đài mà Boss đứng lên)
local function getSurroundingFloorY(bPos: Vector3): number?
	local sampleOffsets = {
		Vector3.new(20, 0, 0),
		Vector3.new(-20, 0, 0),
		Vector3.new(0, 0, 20),
		Vector3.new(0, 0, -20),
		Vector3.new(15, 0, 15),
		Vector3.new(-15, 0, -15),
		Vector3.new(15, 0, -15),
		Vector3.new(-15, 0, 15),
	}
	local lowest = math.huge
	for _, offset in ipairs(sampleOffsets) do
		local sPos = bPos + offset
		local fY = getSolidFloorY(sPos, bPos.Y - 2.8)
		if fY and fY < lowest then
			lowest = fY
		end
	end
	if lowest < math.huge then
		return lowest
	end
	return nil
end

-- Xác định độ cao sàn đấu thực tế (hạ độ cao xuống mặt đất nếu Boss đứng trên tảng đá)
local function resolveArenaFloorY(bPos: Vector3): number
	local pFloor = getPlayerFloorY()
	local surrFloor = getSurroundingFloorY(bPos)

	-- 1. Ưu tiên cao độ sàn của Player nếu Player đang ở thấp hơn Boss (chứng tỏ Boss đứng trên đá)
	if pFloor and pFloor < bPos.Y - 1.5 then
		return pFloor
	end

	-- 2. Ưu tiên các điểm khảo sát ngoài tảng đá nếu tìm thấy sàn thấp hơn Boss
	if surrFloor and surrFloor < bPos.Y - 1.5 then
		return surrFloor
	end

	-- 3. Fallback theo Player nếu có
	if pFloor then
		return pFloor
	end

	-- 4. Fallback theo khảo sát xung quanh
	if surrFloor then
		return surrFloor
	end

	-- 5. Fallback cuối cùng: Bắn thẳng xuống từ Boss
	return getSolidFloorY(bPos, bPos.Y - 2.8)
end

--// ------------------------------------------------------------------ //
-- Anchor Capture & Lifecycle
--// ------------------------------------------------------------------ //

local function captureAnchor(bPos: Vector3, bossIdx: number)
	if anchorCenter and currentLockedBossIndex == bossIdx then return end
	local floorY = resolveArenaFloorY(bPos)
	anchorCenter = Vector3.new(bPos.X, floorY, bPos.Z)
	anchorFloorY = floorY
	currentLockedBossIndex = bossIdx
	updateVisual()
	fireStatusChanged()
end

local function clearAnchor()
	if captureThread then
		task.cancel(captureThread)
		captureThread = nil
	end
	anchorCenter = nil
	anchorFloorY = nil
	currentLockedBossIndex = nil
	destroyVisual()
	fireStatusChanged()
end

local function tryStartCapture()
	if not shared.IsBossActive() then
		clearAnchor()
		return
	end

	local curIdx = shared.GetCurrentBossIndex()
	if curIdx <= 0 then curIdx = 1 end

	local cfg = bossConfigs[curIdx] or (curIdx > 3 and bossConfigs[3])
	if (not cfg or not cfg.enabled) and not showVisual then
		clearAnchor()
		return
	end

	-- Đã chốt cho đúng boss hiện tại rồi
	if anchorCenter and currentLockedBossIndex == curIdx then
		updateVisual()
		return
	end

	-- Nếu đổi boss khác -> dọn visual cũ
	if currentLockedBossIndex and currentLockedBossIndex ~= curIdx then
		clearAnchor()
	end

	-- Bắt đầu polling tìm vị trí Boss lúc spawn (tăng timeout lên 15s phòng cutscene / animation trễ)
	if captureThread then task.cancel(captureThread) end
	captureThread = task.spawn(function()
		local timeout = os.clock() + 15.0
		while os.clock() < timeout and not anchorCenter do
			if not shared.IsBossActive() or shared.GetCurrentBossIndex() ~= curIdx then
				break
			end
			local root = findCurrentBossRoot()
			if root and root.Parent then
				captureAnchor(root.Position, curIdx)
				break
			end
			task.wait(0.1)
		end
		captureThread = nil
	end)
end

-- Vòng lặp giám sát liên tục:
-- 1. Phục hồi tìm Boss nếu đợt spawn đầu bị trễ (cutscene, lag, delay) -> đảm bảo 100% bắt được Anchor
-- 2. Auto-leveling: Tự động kéo đĩa visual và anchor xuống đúng sàn khi Player đứng thấp hơn tảng đá
task.spawn(function()
	while lifecycle.IsActive() do
		task.wait(0.5)
		if shared.IsBossActive() then
			local curIdx = shared.GetCurrentBossIndex()
			if curIdx <= 0 then curIdx = 1 end
			local cfg = bossConfigs[curIdx] or (curIdx > 3 and bossConfigs[3])

			if not anchorCenter and ((cfg and cfg.enabled) or showVisual) then
				local root = findCurrentBossRoot()
				if root and root.Parent then
					captureAnchor(root.Position, curIdx)
				end
			elseif anchorCenter and anchorFloorY then
				local pFloor = getPlayerFloorY()
				if pFloor and pFloor < (anchorFloorY - 1.5) then
					anchorFloorY = pFloor
					anchorCenter = Vector3.new(anchorCenter.X, pFloor, anchorCenter.Z)
					updateVisual()
				end
			end
		end
	end
end)

-- Lắng nghe thay đổi trạng thái Boss từ shared
shared.OnBossActiveChanged(function(active)
	if active then
		tryStartCapture()
	else
		clearAnchor()
	end
end)

shared.OnBossIndexChanged(function(index)
	if shared.IsBossActive() then
		tryStartCapture()
	else
		clearAnchor()
	end
end)

-- Kiểm tra ngay lúc init phòng trường hợp script inject khi Boss đã xuất hiện
task.spawn(function()
	task.wait(0.5)
	if shared.IsBossActive() and not anchorCenter then
		tryStartCapture()
	end
end)

lifecycle.Register(function()
	clearAnchor()
end)

--// ------------------------------------------------------------------ //
-- Core Boundary Math (Ray-Circle Intersection in 2D)
--// ------------------------------------------------------------------ //

--- Tính khoảng cách tối đa ray có thể vươn tới trước khi chạm mép sàn đấu Boss.
--- Trả về: (allowedDist: number?, isLimited: boolean)
function bossArea.GetRayLimit(origin: Vector3, dir: Vector3, maxDist: number): (number?, boolean)
	if not shared.IsBossActive() then return nil, false end
	local curIdx = shared.GetCurrentBossIndex()
	if curIdx <= 0 then return nil, false end

	local cfg = bossConfigs[curIdx] or (curIdx > 3 and bossConfigs[3])
	if not cfg or not cfg.enabled then return nil, false end
	if not anchorCenter then return nil, false end

	local radius = cfg.radius or DEFAULT_RADIUS
	local ox = origin.X - anchorCenter.X
	local oz = origin.Z - anchorCenter.Z
	local dx = dir.X
	local dz = dir.Z
	local dLen = math.sqrt(dx * dx + dz * dz)
	if dLen < 1e-4 then return nil, false end
	dx, dz = dx / dLen, dz / dLen

	local r = math.max(5.0, radius - BOUNDARY_SAFETY_PADDING)
	local pDistSq = ox * ox + oz * oz
	local pDist = math.sqrt(pDistSq)

	-- Trường hợp 1: Người chơi đã bị dạt sát mép hoặc ra ngoài sàn đấu (pDist >= r)
	if pDist >= r then
		local dot = ox * dx + oz * dz
		if dot >= 0 then
			-- Tia hướng RA NGOÀI xa hơn -> CẤM TIỆT
			return 0, true
		else
			-- Tia hướng VÀO LÒNG sàn đấu -> Cho phép quét hướng về tâm
			return maxDist, true
		end
	end

	-- Trường hợp 2: Người chơi nằm trong sàn đấu (pDist < r)
	-- Giải phương trình bậc 2 giao điểm tia với đường tròn bán kính r:
	-- |p + t * d|^2 = r^2
	-- t^2 + 2*(p . d)*t + (|p|^2 - r^2) = 0
	local b = ox * dx + oz * dz
	local c = pDistSq - r * r -- âm vì pDist < r
	local delta = b * b - c    -- luôn dương vì c < 0

	local t = -b + math.sqrt(delta)
	if t <= 0 then
		return 0, true
	end

	return math.min(maxDist, t), true
end

--- Kiểm tra xem 1 điểm Vector3 có nằm trọn trong lòng sàn đấu Boss hay không.
function bossArea.IsPointInArena(point: Vector3, margin: number?): boolean
	if not shared.IsBossActive() then return true end
	local curIdx = shared.GetCurrentBossIndex()
	if curIdx <= 0 then return true end

	local cfg = bossConfigs[curIdx] or (curIdx > 3 and bossConfigs[3])
	if not cfg or not cfg.enabled then return true end
	if not anchorCenter then return true end

	local radius = cfg.radius or DEFAULT_RADIUS
	local pad = margin or 0
	local maxR = math.max(2.0, radius - BOUNDARY_SAFETY_PADDING + pad)
	local dx = point.X - anchorCenter.X
	local dz = point.Z - anchorCenter.Z
	return (dx * dx + dz * dz) <= (maxR * maxR)
end

--- Kiểm tra xem 1 điểm Vector3 có nằm trong vùng cấm trung tâm của Boss 1 hay không
--- (Giúp người chơi không bao giờ né đâm vào giữa phòng Boss 1, nơi dính trùm các skill nan hoa / radial star burst)
function bossArea.IsPointInBoss1Center(point: Vector3, margin: number?): boolean
	if not boss1AvoidCenter then return false end
	if not shared.IsBossActive() then return false end
	local curIdx = currentLockedBossIndex or shared.GetCurrentBossIndex()
	if curIdx ~= 1 then return false end
	if not anchorCenter then return false end

	local pad = margin or 0
	local maxR = math.max(1.0, boss1CenterRadius + pad)
	local dx = point.X - anchorCenter.X
	local dz = point.Z - anchorCenter.Z
	return (dx * dx + dz * dz) <= (maxR * maxR)
end

function bossArea.SetBoss1AvoidCenter(state: boolean)
	boss1AvoidCenter = (state == true)
	updateVisual()
	fireStatusChanged()
end

function bossArea.IsBoss1AvoidCenter(): boolean
	return boss1AvoidCenter
end

function bossArea.SetBoss1CenterRadius(val: number)
	if type(val) == "number" and val >= 3 then
		boss1CenterRadius = val
		updateVisual()
		fireStatusChanged()
	end
end

function bossArea.GetBoss1CenterRadius(): number
	return boss1CenterRadius
end

--// ------------------------------------------------------------------ //
-- Public API & Getters / Setters (Hỗ trợ từng Boss)
--// ------------------------------------------------------------------ //

function bossArea.SetBossEnabled(bossIndex: number, state: boolean)
	bossIndex = math.max(1, math.floor(bossIndex or 1))
	if not bossConfigs[bossIndex] then
		bossConfigs[bossIndex] = { enabled = state and true or false, radius = DEFAULT_RADIUS }
	else
		bossConfigs[bossIndex].enabled = state and true or false
	end

	if shared.IsBossActive() and shared.GetCurrentBossIndex() == bossIndex then
		if bossConfigs[bossIndex].enabled or showVisual then
			tryStartCapture()
		else
			clearAnchor()
		end
	end
	fireStatusChanged()
end

function bossArea.IsBossEnabled(bossIndex: number): boolean
	bossIndex = math.max(1, math.floor(bossIndex or 1))
	local cfg = bossConfigs[bossIndex] or (bossIndex > 3 and bossConfigs[3])
	return cfg and cfg.enabled or false
end

function bossArea.SetBossRadius(bossIndex: number, val: number)
	bossIndex = math.max(1, math.floor(bossIndex or 1))
	if type(val) == "number" and val >= 10 then
		if not bossConfigs[bossIndex] then
			bossConfigs[bossIndex] = { enabled = false, radius = val }
		else
			bossConfigs[bossIndex].radius = val
		end

		if currentLockedBossIndex == bossIndex then
			updateVisual()
			fireStatusChanged()
		end
	end
end

function bossArea.GetBossRadius(bossIndex: number): number
	bossIndex = math.max(1, math.floor(bossIndex or 1))
	local cfg = bossConfigs[bossIndex] or (bossIndex > 3 and bossConfigs[3])
	return cfg and cfg.radius or DEFAULT_RADIUS
end

-- Backward compatibility & General Accessors
function bossArea.SetEnabled(state: boolean)
	bossArea.SetBossEnabled(1, state)
end

function bossArea.IsEnabled(): boolean
	return bossArea.IsBossEnabled(1)
end

function bossArea.SetRadius(val: number)
	bossArea.SetBossRadius(1, val)
end

function bossArea.GetRadius(): number
	local cfg, _ = getActiveConfig()
	return cfg.radius or DEFAULT_RADIUS
end

function bossArea.SetShowVisual(state: boolean)
	showVisual = state and true or false
	if showVisual and not anchorCenter and shared.IsBossActive() then
		tryStartCapture()
	else
		updateVisual()
	end
end

function bossArea.IsShowVisual(): boolean
	return showVisual
end

function bossArea.GetAnchorCenter(): Vector3?
	return anchorCenter
end

function bossArea.GetAnchorFloorY(): number?
	return anchorFloorY
end

function bossArea.GetLockedBossIndex(): number?
	return currentLockedBossIndex
end

function bossArea.IsLocked(): boolean
	return anchorCenter ~= nil
end

function bossArea.OnStatusChanged(cb: (boolean, Vector3?, number, number?) -> ()): () -> ()
	table.insert(statusCallbacks, cb)
	return function()
		for i, c in ipairs(statusCallbacks) do
			if c == cb then
				table.remove(statusCallbacks, i)
				break
			end
		end
	end
end

function bossArea.Reset()
	clearAnchor()
end

return bossArea
