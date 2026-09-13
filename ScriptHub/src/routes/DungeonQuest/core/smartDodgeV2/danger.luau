-- Smart Dodge V2: Danger Detection & Geometry Engine
-- Chuyên trách: Nhận diện trạng thái IN DANGER theo thời gian thực (Player / Point in Hazard).
-- Hỗ trợ 100% các dạng hình học: OBB, Circle AoE, Polar Annulus Ring, Moving Beam, và Moving Trajectory Corridors.

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

local types = require("@routes/DungeonQuest/core/smartDodgeV2/types")
local detection = require("@routes/DungeonQuest/core/smartDodgeV2/detection")
local visuals = require("@routes/DungeonQuest/core/smartDodgeV2/visuals")
local shared = require("@routes/DungeonQuest/core/shared")

local danger = {}

--// Cấu hình & Tham số
local enabled = true
local targetScope = "All"            -- "All" | "Boss" | "Mobs"
local dodgeBossEnabled = true        -- Bật/tắt né chiêu của Boss
local dodgeEnemyEnabled = true       -- Bật/tắt né chiêu của Quái thường
local playerHitboxPadding = 1.8      -- Bù trừ bán kính cơ thể nhân vật (studs)
local hitboxDownwardOffset = 2.85    -- Khoảng cách hạ thấp từ HumanoidRootPart xuống sát chân (studs)
local MAX_HEIGHT_TOLERANCE = 150.0   -- Cột không gian sát thương chiều dọc trong Dungeon Quest
local RAYCAST_DOWN_DIST = 150.0      -- Khoảng cách quét sàn nhà

--// Trạng thái InDanger
local isPlayerInDanger = false
local currentDangerHazard: types.ActiveHazard? = nil
local dangerCallbacks: { (inDanger: boolean, hazard: types.ActiveHazard?) -> () } = {}

--// Raycast Parameters
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Exclude
raycastParams.IgnoreWater = true
local cachedIgnoreList: { Instance } = {}
local lastFilterRebuildTime = 0

local function updateRaycastFilter(force: boolean?)
	local now = os.clock()
	if not force and (now - lastFilterRebuildTime < 0.3) then
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
	for inst in pairs(detection.GetActiveHazards()) do
		table.insert(cachedIgnoreList, inst)
	end
	raycastParams.FilterDescendantsInstances = cachedIgnoreList
end

--// Bắn raycast kiểm tra sàn nhà và snap tọa độ xuống mặt đất
function danger.GetFloorPosition(pos: Vector3): (Vector3, boolean)
	updateRaycastFilter(false)

	local rayOrigin = Vector3.new(pos.X, pos.Y + 10, pos.Z)
	local rayDir = Vector3.new(0, -RAYCAST_DOWN_DIST, 0)
	local result = Workspace:Raycast(rayOrigin, rayDir, raycastParams)

	if result and result.Position then
		return Vector3.new(pos.X, result.Position.Y + 3, pos.Z), true
	end
	return pos, false
end

--// Bắn raycast kiểm tra sàn nhà và trả về cao độ Y thực tế của mặt sàn
function danger.GetRawFloorY(pos: Vector3): (number, boolean)
	updateRaycastFilter(false)

	local rayOrigin = Vector3.new(pos.X, pos.Y + 12, pos.Z)
	local rayDir = Vector3.new(0, -RAYCAST_DOWN_DIST, 0)
	local result = Workspace:Raycast(rayOrigin, rayDir, raycastParams)

	if result and result.Position then
		return result.Position.Y, true
	end

	local localPlayer = Players.LocalPlayer
	local rootPart = localPlayer and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
	if rootPart and rootPart:IsA("BasePart") then
		return rootPart.Position.Y - 2.8, false
	end

	return pos.Y, false
end

--// Lấy kích thước thực tế của Part (tính cả độ phóng đại của SpecialMesh nếu có)
local function getEffectivePartSize(part: BasePart): Vector3
	local mesh = part:FindFirstChildOfClass("SpecialMesh")
	if mesh then
		local s = mesh.Scale
		return Vector3.new(
			part.Size.X * math.abs(s.X),
			part.Size.Y * math.abs(s.Y),
			part.Size.Z * math.abs(s.Z)
		)
	end
	return part.Size
end

--// 1. Kiểm tra hình chữ nhật định hướng (Oriented Bounding Box - OBB)
function danger.IsPointInPartOBB(point: Vector3, part: BasePart, padding: number?): boolean
	if not part or not part:IsA("BasePart") or not part.Parent then return false end

	local pad = padding or playerHitboxPadding
	local partPos = part.Position
	local pSize = getEffectivePartSize(part)

	-- Broadphase Pruning: Bỏ qua nhanh nếu quá xa
	local dX = point.X - partPos.X
	local dZ = point.Z - partPos.Z
	local maxDim = math.max(pSize.X, pSize.Z)
	local maxRadius = (maxDim * 0.7072) + pad + 3.0
	if (dX * dX + dZ * dZ) > (maxRadius * maxRadius) then
		return false
	end

	-- Kiểm tra độ cao Y
	local heightDiff = math.abs(point.Y - partPos.Y)
	if heightDiff > MAX_HEIGHT_TOLERANCE then
		return false
	end

	-- Chuyển tọa độ sang Local Space của Part
	local localPos = part.CFrame:PointToObjectSpace(point)
	local halfX = (pSize.X / 2) + pad
	local halfZ = (pSize.Z / 2) + pad
	local halfY = math.max(MAX_HEIGHT_TOLERANCE, (pSize.Y / 2) + 5)

	return math.abs(localPos.X) <= halfX
		and math.abs(localPos.Z) <= halfZ
		and math.abs(localPos.Y) <= halfY
end

--// 2. Kiểm tra hình cầu / hình trụ (Circle / Ball / Cylinder AoE)
function danger.IsPointInSphere(point: Vector3, part: BasePart, padding: number?): boolean
	if not part or not part:IsA("BasePart") or not part.Parent then return false end

	local pad = padding or playerHitboxPadding
	local partPos = part.Position
	local pSize = getEffectivePartSize(part)

	local heightDiff = math.abs(point.Y - partPos.Y)
	if heightDiff > MAX_HEIGHT_TOLERANCE then
		return false
	end

	local dX = point.X - partPos.X
	local dZ = point.Z - partPos.Z
	local radius = (math.max(pSize.X, pSize.Z) / 2) + pad
	return (dX * dX + dZ * dZ) <= (radius * radius)
end

--// 3. Kiểm tra vành khuyên / bán nguyệt (Polar Annulus Ring - thirdBossMultiRings)
function danger.IsPointInRing(point: Vector3, ringPart: BasePart, padding: number?): boolean
	if not ringPart or not ringPart:IsA("BasePart") or not ringPart.Parent then return false end

	-- Đòn đánh chỉ gây sát thương khi đang hiển thị rõ nét (chưa mờ / chưa tan biến)
	if ringPart.Transparency >= 0.85 then
		return false
	end

	local pad = padding or playerHitboxPadding

	-- 1. Tìm tâm thực của Model chứa các vòng Ring (Center Part)
	local parentModel = ringPart:FindFirstAncestorOfClass("Model") or ringPart.Parent
	local centerPart = parentModel and (parentModel:FindFirstChild("center") or parentModel:FindFirstChild("Center") or (parentModel:IsA("Model") and parentModel.PrimaryPart))
	local centerPos = (centerPart and centerPart:IsA("BasePart")) and centerPart.Position
		or (parentModel and parentModel:IsA("Model") and parentModel:GetPivot().Position)
		or ringPart.Position

	-- 2. Kiểm tra độ cao Y
	local heightDiff = math.abs(point.Y - centerPos.Y)
	if heightDiff > MAX_HEIGHT_TOLERANCE then
		return false
	end

	-- 3. Bán kính 2D từ tâm Model tới điểm P
	local diffX = point.X - centerPos.X
	local diffZ = point.Z - centerPos.Z
	local r = math.sqrt(diffX * diffX + diffZ * diffZ)

	-- 4. Bán kính ngoài thực tế của Ring từ Size.Z
	local radiusOuter = ringPart.Size.Z
	if radiusOuter < 1 then
		radiusOuter = math.max(ringPart.Size.X, ringPart.Size.Z) / 2
	end

	-- Bề dày dải Ring sát thương (13 studs cho vòng nhỏ, 18 studs cho vòng lớn)
	local bandThickness = (radiusOuter > 90) and 18.0 or 13.0
	local radiusInner = math.max(0, radiusOuter - bandThickness)

	-- 5. Kiểm tra khoảng rỗng ở tâm (lỗ an toàn)
	if r < (radiusInner - pad) then
		return false
	end

	-- 6. Kiểm tra nằm ngoài bán kính ngoài
	if r > (radiusOuter + pad) then
		return false
	end

	-- 7. Kiểm tra hướng bán nguyệt (Semicircle Direction)
	local offX = ringPart.Position.X - centerPos.X
	local offZ = ringPart.Position.Z - centerPos.Z
	local offMag = math.sqrt(offX * offX + offZ * offZ)
	if offMag > 0.5 then
		local dirUnitX = offX / offMag
		local dirUnitZ = offZ / offMag
		local dot = (diffX * dirUnitX) + (diffZ * dirUnitZ)
		-- Nếu dot < -pad: nằm ở nửa đối diện (vùng an toàn 100%)
		if dot < -pad then
			return false
		end
	end

	return true
end

--// 4. Kiểm tra Moving Beam (Boss 2 - Thanh beam lăn tròn quanh trục X)
function danger.IsPointInMovingBeam(point: Vector3, part: BasePart, padding: number?): boolean
	if not part or not part:IsA("BasePart") or not part.Parent then return false end

	local pad = padding or playerHitboxPadding
	local localPos = part.CFrame:PointToObjectSpace(point)
	local pSize = part.Size

	-- Chiều dài sải ngang quét phòng dọc theo trục X
	local halfLength = (math.max(pSize.X, pSize.Z) / 2) + pad
	-- Bán kính tiết diện xoay quanh trục X
	local beamRadius = (math.max(pSize.Y, math.min(pSize.X, pSize.Z)) / 2) + pad
	if beamRadius < 3.5 then beamRadius = 3.5 end

	local radialDistSq = localPos.Y * localPos.Y + localPos.Z * localPos.Z
	return (math.abs(localPos.X) <= halfLength)
		and (radialDistSq <= (beamRadius + 1.5) * (beamRadius + 1.5))
end

--// 4b. Kiểm tra xem một điểm P có nằm trong hành lang tia Beam / Laser / Projectile thẳng không (Pure 2D Cylinder Math chuẩn V1)
function danger.IsPointInBeamCorridor(
	point: Vector3,
	originPos: Vector3,
	forward2D: Vector3,
	beamRadius: number,
	maxReach: number,
	padding: number?
): (boolean, number, number)
	local pad = padding or playerHitboxPadding
	local effectiveRadius = beamRadius + pad

	-- Kiểm tra độ cao Y
	local heightDiff = math.abs(point.Y - originPos.Y)
	if heightDiff > MAX_HEIGHT_TOLERANCE then
		return false, 0, 0
	end

	-- Vector 2D từ origin tới điểm point
	local toP = Vector3.new(point.X - originPos.X, 0, point.Z - originPos.Z)
	local dotForward = toP:Dot(forward2D)

	-- Cho phép lùi sau gốc phát tia (-effectiveRadius) để bảo vệ người chơi khi đứng sát/trong người Boss
	if dotForward < -effectiveRadius or dotForward > (maxReach + pad) then
		return false, 0, 0
	end

	-- Khoảng cách vuông góc tới trục tia (Perpendicular Distance)
	local proj = forward2D * dotForward
	local perpDist = (toP - proj).Magnitude

	if perpDist <= effectiveRadius then
		return true, perpDist, dotForward
	end

	return false, perpDist, dotForward
end

--// 4c. Kiểm tra xem một điểm P có nằm trong vùng nón mở rộng (Expanding Cone Corridor - Boss 2 Circle Hitbox chuẩn V1)
function danger.IsPointInExpandingCone(
	point: Vector3,
	originPos: Vector3,
	forward2D: Vector3,
	baseRadius: number,
	maxReach: number,
	expansionRate: number?,
	padding: number?
): (boolean, number, number, number)
	local pad = padding or playerHitboxPadding
	local rate = expansionRate or 0.25

	-- Kiểm tra độ cao Y
	local heightDiff = math.abs(point.Y - originPos.Y)
	if heightDiff > MAX_HEIGHT_TOLERANCE then
		return false, 0, 0, baseRadius
	end

	-- Vector 2D từ origin tới điểm point
	local toP = Vector3.new(point.X - originPos.X, 0, point.Z - originPos.Z)
	local dotForward = toP:Dot(forward2D)

	-- Bán kính phình to dần theo chiều dọc đòn đánh
	local effectiveRadius = baseRadius + math.max(0, dotForward * rate)
	if dotForward < -effectiveRadius or dotForward > (maxReach + pad) then
		return false, 0, dotForward, effectiveRadius
	end

	-- Khoảng cách vuông góc tới trục chính
	local proj = forward2D * dotForward
	local perpDist = (toP - proj).Magnitude

	if perpDist <= (effectiveRadius + pad) then
		return true, perpDist, dotForward, effectiveRadius
	end

	return false, perpDist, dotForward, effectiveRadius
end

--// Kiểm tra xem một hiểm họa có phải là Quả Cầu rượt đuổi của Boss 2 hay không
function danger.IsBoss2OrbHazard(hazard: types.ActiveHazard): boolean
	if not hazard then return false end
	local name = (hazard.cleanName or hazard.name or ""):lower():gsub("%s+", "")
	return (name:find("secondboss") ~= nil and name:find("orb") ~= nil and name:find("explosion") == nil)
		or name:find("yelloworb") ~= nil
		or name:find("redorb") ~= nil
		or name:find("greenorb") ~= nil
end

--// 5. Kiểm tra xem một điểm P có nằm trong vùng nguy hiểm của một Hazard cụ thể không
function danger.IsPointInHazard(point: Vector3, hazard: types.ActiveHazard, padding: number?): boolean
	if not hazard or not hazard.instance or not hazard.instance.Parent then return false end

	local isSpikeBeam = hazard.cleanName:lower():find("seekingspike") ~= nil or hazard.cleanName:lower():find("bigspike") ~= nil

	-- Nếu part chính đã mờ hoặc tan biến (Transparency >= 0.85): chiêu thức đã kết thúc, TUYỆT ĐỐI không gây sát thương
	-- NGOẠI TRỪ: tia định hướng (luôn có Part trong suốt) hoặc đòn Spike (có giai đoạn tụ lực trong suốt trước khi phóng)
	if not hazard.isTelegraph and not isSpikeBeam and hazard.instance:IsA("BasePart") and hazard.instance.Transparency >= 0.85 and not hazard.isMultiWave then
		return false
	end

	-- Nếu tất cả các part trong activeParts đều đã mờ (Transparency >= 0.85): bỏ qua không xét
	if not hazard.isTelegraph and not isSpikeBeam and not hazard.isMultiWave and hazard.activeParts then
		local hasActiveVisible = false
		for p in pairs(hazard.activeParts) do
			if p and p.Parent and p:IsA("BasePart") and p.Transparency < 0.85 then
				hasActiveVisible = true
				break
			end
		end
		if not hasActiveVisible and next(hazard.activeParts) ~= nil then
			return false
		end
	end

	local pad = padding or playerHitboxPadding
	local isBoss2Orb = danger.IsBoss2OrbHazard(hazard)

	-- Bước 1: ƯU TIÊN GIẢI TÍCH TOÁN HỌC 2D CHO TIA BEAM / PROJECTILE / EXPANDING CONE (Độc lập 100% với Visuals, chuẩn V1)
	-- Quả Cầu Boss 2 là quả cầu vật lý lăn/bay theo người chơi, TUYỆT ĐỐI không áp dụng hình học Beam
	if not isBoss2Orb and hazard.forward2D and hazard.dangerRadius then
		local origin: Vector3
		local reach: number
		local isExpandingCone = hazard.isExpandingCone or hazard.cleanName:lower():find("cricle") ~= nil or hazard.cleanName:lower():find("circle") ~= nil

		if isExpandingCone then
			origin = hazard.beamOrigin or hazard.position
			reach = hazard.maxLookahead or hazard.telegraphLength or 95.0
			local inCone = danger.IsPointInExpandingCone(point, origin, hazard.forward2D, hazard.dangerRadius, reach, hazard.expansionRate or 0.25, pad)
			if inCone then
				return true
			end
		elseif hazard.isTelegraph or isSpikeBeam then
			-- Tia định hướng (Beam hoặc Spike Direction Beam): xuất phát từ gốc phát tia và bao quát toàn bộ chiều dài telegraph
			origin = hazard.beamOrigin or hazard.position
			reach = hazard.maxLookahead or hazard.telegraphLength or 140.0
			local inBeam = danger.IsPointInBeamCorridor(point, origin, hazard.forward2D, hazard.dangerRadius, reach, pad)
			if inBeam then
				return true
			end
		else
			-- Đạn bay / Moving Projectile: vùng nguy hiểm xuất phát từ vị trí hiện tại của đạn tiến về phía trước
			origin = hazard.position
			reach = hazard.telegraphLength or hazard.maxLookahead or 40.0
			local inBeam = danger.IsPointInBeamCorridor(point, origin, hazard.forward2D, hazard.dangerRadius, reach, pad)
			if inBeam then
				return true
			end
		end
	end

	-- Bước 2: KIỂM TRA HÀNH LANG TIA ĐỊNH HƯỚNG / MOVING TRAJECTORY (Vùng màu Cam)
	-- Quả Cầu Boss 2 TUYỆT ĐỐI không coi hành lang cam định hướng là hitbox gây sát thương
	if not isBoss2Orb then
		local visualData = visuals.GetHazardVisualData(hazard)
		if visualData and visualData.corridorPart and visualData.corridorPart.Parent then
			local inCorridor = danger.IsPointInPartOBB(point, visualData.corridorPart, pad)
			if inCorridor then
				return true
			end
		end
	end

	-- Bước 3: Kiểm tra các Part vật lý nguy hiểm (Vùng màu Vàng / Part thực tế)
	local instNameLower = hazard.instance.Name:lower():gsub("%s+", "")
	local isMultiRings = instNameLower:find("multiring") ~= nil
	local isMovingBeam = instNameLower:find("movingbeam") ~= nil

	for part in pairs(hazard.activeParts) do
		if part and part.Parent and part:IsA("BasePart") then
			if isMultiRings or part.Name:lower():find("ring") then
				if danger.IsPointInRing(point, part, pad) then
					return true
				end
			elseif isMovingBeam then
				if danger.IsPointInMovingBeam(point, part, pad) then
					return true
				end
			elseif part:IsA("Part") and (part.Shape == Enum.PartType.Ball or part.Shape == Enum.PartType.Cylinder) then
				if danger.IsPointInSphere(point, part, pad) then
					return true
				end
			else
				if danger.IsPointInPartOBB(point, part, pad) then
					return true
				end
			end
		end
	end

	return false
end

--// Phân loại đòn đánh xuất phát từ Boss hay Quái thường
function danger.IsBossHazard(hazard: types.ActiveHazard): boolean
	if not hazard then return false end

	-- Mốc thời gian: Mọi chiêu thức sinh ra TRƯỚC thời điểm Boss spawn thì 100% là của Enemy/Quái cũ
	local bossSpawnTime = detection.GetLastBossSpawnTime and detection.GetLastBossSpawnTime() or 0
	if bossSpawnTime > 0 and hazard.spawnTime and hazard.spawnTime < bossSpawnTime then
		return false
	end

	-- Nếu Boss hiện tại không active trong game, không thể có đòn đánh nào của Boss
	if shared.IsBossActive and not shared.IsBossActive() then
		return false
	end

	if hazard.isBossHazard ~= nil then
		return hazard.isBossHazard
	end
	local nameLower = hazard.name:lower()
	if nameLower:find("boss") ~= nil then
		return true
	end
	if hazard.instance and hazard.instance.Parent and hazard.instance.Parent.Name:lower():find("boss") ~= nil then
		return true
	end
	return false
end

--// Kiểm tra xem một hiểm họa có bị bỏ qua né dựa theo cài đặt Boss/Enemy không
function danger.IsHazardIgnored(hazard: types.ActiveHazard): boolean
	if not hazard then return true end
	local isBoss = danger.IsBossHazard(hazard)
	if targetScope == "Boss" and not isBoss then
		return true
	elseif targetScope == "Mobs" and isBoss then
		return true
	end
	if isBoss then
		return not dodgeBossEnabled
	else
		return not dodgeEnemyEnabled
	end
end

--// 6. Kiểm tra xem một điểm P có bị dính bất kỳ hiểm họa nào đang kích hoạt không (hỗ trợ custom padding)
function danger.IsPointInAnyHazard(point: Vector3, ignoredInstance: Instance?, padding: number?): (boolean, types.ActiveHazard?)
	if not enabled or not detection.IsEnabled() then
		return false, nil
	end

	local activeHazards = detection.GetActiveHazards()
	local list = {}
	for _, hazard in pairs(activeHazards) do
		if ignoredInstance then
			local shouldIgnore = (hazard.instance == ignoredInstance)
				or (hazard.instance and hazard.instance.Name == ignoredInstance.Name)
				or (hazard.instance and hazard.instance:IsDescendantOf(ignoredInstance))
				or (ignoredInstance:IsDescendantOf(hazard.instance))

			if not shouldIgnore and danger.IsBoss2OrbHazard(hazard) then
				local ignName = ignoredInstance.Name:lower():gsub("%s+", "")
				if ignName:find("orb") or ignName:find("secondboss") then
					shouldIgnore = true
				end
			end

			if shouldIgnore then
				continue
			end
		end

		-- Bỏ qua hiểm họa nếu người dùng tắt né Boss hoặc tắt né Quái thường
		if danger.IsHazardIgnored(hazard) then
			continue
		end

		table.insert(list, hazard)
	end

	if #list > 1 then
		table.sort(list, function(a, b)
			local da = (Vector3.new(a.position.X - point.X, 0, a.position.Z - point.Z)).Magnitude
			local db = (Vector3.new(b.position.X - point.X, 0, b.position.Z - point.Z)).Magnitude
			if math.abs(da - db) > 0.5 then
				return da < db
			end
			return (a.name or "") < (b.name or "")
		end)
	end

	for _, hazard in ipairs(list) do
		if danger.IsPointInHazard(point, hazard, padding) then
			return true, hazard
		end
	end

	return false, nil
end

--// Kiểm tra xem đoạn đường di chuyển từ fromPos -> toPos có an toàn không (Path Clearance)
function danger.IsPathSafe(fromPos: Vector3, toPos: Vector3, ignoredInstance: Instance?): boolean
	local dist = (toPos - fromPos).Magnitude
	if dist <= 1.2 then return true end

	-- Bước chia mẫu 2.8 studs (tối đa 14 bước để tối ưu CPU)
	local steps = math.clamp(math.ceil(dist / 2.8), 2, 14)
	for i = 1, steps - 1 do
		local t = i / steps
		local samplePos = fromPos:Lerp(toPos, t)
		if danger.IsPointInAnyHazard(samplePos, ignoredInstance) then
			return false
		end
	end
	return true
end

--// 7. Kiểm tra trạng thái của Nhân vật Player hiện tại
function danger.IsPlayerInDanger(): (boolean, types.ActiveHazard?)
	local localPlayer = Players.LocalPlayer
	local character = localPlayer and localPlayer.Character
	if not character then return false, nil end

	local rootPart = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso")
	if not rootPart or not rootPart:IsA("BasePart") then return false, nil end

	-- 1. Kiểm tra vị trí ngang thắt lưng (RootPart)
	local inDanger, hazard = danger.IsPointInAnyHazard(rootPart.Position)
	if inDanger then
		return true, hazard
	end

	-- 2. Kiểm tra vị trí ngang bàn chân (chạm sàn nhà, tránh bỏ sót đòn bệt mặt đất)
	local footPos = rootPart.Position - Vector3.new(0, hitboxDownwardOffset, 0)
	return danger.IsPointInAnyHazard(footPos)
end

--// Lắng nghe sự kiện thay đổi trạng thái Danger
function danger.OnDangerStateChanged(callback: (inDanger: boolean, hazard: types.ActiveHazard?) -> ())
	if type(callback) == "function" then
		table.insert(dangerCallbacks, callback)
	end
end

--// Getters & Setters
function danger.GetHitboxPadding(): number
	return playerHitboxPadding
end

function danger.SetHitboxPadding(value: number)
	if type(value) == "number" and value >= 0 then
		playerHitboxPadding = value
	end
end

function danger.GetHitboxDownwardOffset(): number
	return hitboxDownwardOffset
end

function danger.SetHitboxDownwardOffset(value: number)
	if type(value) == "number" and value >= 0 then
		hitboxDownwardOffset = value
	end
end

function danger.IsEnabled(): boolean
	return enabled
end

function danger.SetEnabled(state: boolean)
	enabled = (state == true)
	if not enabled then
		isPlayerInDanger = false
		currentDangerHazard = nil
	end
end

function danger.GetCurrentDangerHazard(): types.ActiveHazard?
	return currentDangerHazard
end

function danger.SetDodgeBossEnabled(state: boolean)
	dodgeBossEnabled = (state == true)
	if dodgeBossEnabled and not dodgeEnemyEnabled then
		targetScope = "Boss"
	elseif not dodgeBossEnabled and dodgeEnemyEnabled then
		targetScope = "Mobs"
	elseif dodgeBossEnabled and dodgeEnemyEnabled then
		targetScope = "All"
	end
end

function danger.IsDodgeBossEnabled(): boolean
	return dodgeBossEnabled
end

function danger.SetDodgeEnemyEnabled(state: boolean)
	dodgeEnemyEnabled = (state == true)
	if dodgeBossEnabled and not dodgeEnemyEnabled then
		targetScope = "Boss"
	elseif not dodgeBossEnabled and dodgeEnemyEnabled then
		targetScope = "Mobs"
	elseif dodgeBossEnabled and dodgeEnemyEnabled then
		targetScope = "All"
	end
end

function danger.IsDodgeEnemyEnabled(): boolean
	return dodgeEnemyEnabled
end

function danger.SetTargetScope(scope: string)
	if scope == "Boss" then
		targetScope = "Boss"
		dodgeBossEnabled = true
		dodgeEnemyEnabled = false
	elseif scope == "Mobs" then
		targetScope = "Mobs"
		dodgeBossEnabled = false
		dodgeEnemyEnabled = true
	else
		targetScope = "All"
		dodgeBossEnabled = true
		dodgeEnemyEnabled = true
	end
end

function danger.GetTargetScope(): string
	return targetScope
end

--// Heartbeat Runner: Theo dõi và cập nhật trạng thái IN DANGER thời gian thực
RunService.Heartbeat:Connect(function()
	if not enabled or not detection.IsEnabled() then
		if isPlayerInDanger then
			isPlayerInDanger = false
			currentDangerHazard = nil
			for _, cb in ipairs(dangerCallbacks) do
				pcall(cb, false, nil)
			end
		end
		visuals.UpdatePlayerHitboxVisual(nil)
		return
	end

	local inDanger, hazard = danger.IsPlayerInDanger()
	if inDanger ~= isPlayerInDanger or hazard ~= currentDangerHazard then
		isPlayerInDanger = inDanger
		currentDangerHazard = hazard

		for _, cb in ipairs(dangerCallbacks) do
			pcall(cb, inDanger, hazard)
		end
	end

	-- Cập nhật vòng tròn 3D Hitbox quanh chân nhân vật (luôn neo theo tâm Player với offset hạ thấp)
	local localPlayer = Players.LocalPlayer
	local character = localPlayer and localPlayer.Character
	local rootPart = character and (character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso"))
	if rootPart and rootPart:IsA("BasePart") then
		local pPos = rootPart.Position
		local footY = pPos.Y - hitboxDownwardOffset
		visuals.UpdatePlayerHitboxVisual(pPos, inDanger, playerHitboxPadding, footY)
	else
		visuals.UpdatePlayerHitboxVisual(nil)
	end
end)

danger.IsPointInDanger = danger.IsPointInAnyHazard

return danger