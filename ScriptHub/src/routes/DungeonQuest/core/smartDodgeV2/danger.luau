-- Smart Dodge V2: Danger Detection & Geometry Engine
-- Chuyên trách: Nhận diện trạng thái IN DANGER theo thời gian thực (Player / Point in Hazard).
-- Hỗ trợ 100% các dạng hình học: OBB, Circle AoE, Polar Annulus Ring, Moving Beam, và Moving Trajectory Corridors.

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

local types = require("@routes/DungeonQuest/core/smartDodgeV2/types")
local detection = require("@routes/DungeonQuest/core/smartDodgeV2/detection")
local visuals = require("@routes/DungeonQuest/core/smartDodgeV2/visuals")

local danger = {}

--// Cấu hình & Tham số
local enabled = true
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

--// 1. Kiểm tra hình chữ nhật định hướng (Oriented Bounding Box - OBB)
function danger.IsPointInPartOBB(point: Vector3, part: BasePart, padding: number?): boolean
	if not part or not part:IsA("BasePart") or not part.Parent then return false end

	local pad = padding or playerHitboxPadding
	local partPos = part.Position

	-- Broadphase Pruning: Bỏ qua nhanh nếu quá xa
	local dX = point.X - partPos.X
	local dZ = point.Z - partPos.Z
	local pSize = part.Size
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

	local heightDiff = math.abs(point.Y - partPos.Y)
	if heightDiff > MAX_HEIGHT_TOLERANCE then
		return false
	end

	local dX = point.X - partPos.X
	local dZ = point.Z - partPos.Z
	local radius = (math.max(part.Size.X, part.Size.Z) / 2) + pad
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

--// 5. Kiểm tra xem một điểm P có nằm trong vùng nguy hiểm của một Hazard cụ thể không
function danger.IsPointInHazard(point: Vector3, hazard: types.ActiveHazard, padding: number?): boolean
	if not hazard or not hazard.instance or not hazard.instance.Parent then return false end

	local pad = padding or playerHitboxPadding

	-- Bước 1: ƯU TIÊN KIỂM TRA HÀNH LANG TIA ĐỊNH HƯỚNG / MOVING TRAJECTORY (Vùng màu Cam)
	-- Nếu hazard có hành lang màu Cam (corridorPart do Visuals tạo ra), kiểm tra OBB của corridorPart trước!
	-- Lưu ý: Phải kiểm tra TRƯỚC broadphase distance pruning vì hành lang kéo dài xuyên suốt phòng (100-140 studs),
	-- trong khi tâm hazard.position nằm ở Boss nên pruning theo Boss sẽ loại nhầm người chơi ở xa!
	local visualData = visuals.GetHazardVisualData(hazard)
	if visualData and visualData.corridorPart and visualData.corridorPart.Parent then
		local inCorridor = danger.IsPointInPartOBB(point, visualData.corridorPart, pad)
		if inCorridor then
			return true
		end
	end

	-- Bước 2: Broadphase distance pruning theo tâm hazard cho các Part vật lý
	local instNameLower = hazard.instance.Name:lower():gsub("%s+", "")
	local isMultiRings = instNameLower:find("multiring") ~= nil
	local isMovingBeam = instNameLower:find("movingbeam") ~= nil

	local maxReach = (hazard.telegraphLength or 50.0) + pad + 25.0
	local checkCenter = hazard.position

	if isMultiRings then
		-- MultiRings có bán kính ngoài lên tới 105 studs + padding -> mở rộng maxReach lên 135 studs
		maxReach = 135.0
		local centerPart = hazard.instance:FindFirstChild("center") or hazard.instance:FindFirstChild("Center")
		if centerPart and centerPart:IsA("BasePart") then
			checkCenter = centerPart.Position
		elseif hazard.instance:IsA("Model") then
			checkCenter = hazard.instance:GetPivot().Position
		end
	elseif isMovingBeam then
		maxReach = 140.0
	end

	local diffX = point.X - checkCenter.X
	local diffZ = point.Z - checkCenter.Z
	if (diffX * diffX + diffZ * diffZ) > (maxReach * maxReach) then
		return false
	end

	-- Bước 3: Kiểm tra các Part vật lý nguy hiểm (Vùng màu Vàng / Part thực tế)

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

--// 6. Kiểm tra xem một điểm P có bị dính bất kỳ hiểm họa nào đang kích hoạt không
function danger.IsPointInAnyHazard(point: Vector3, ignoredInstance: Instance?): (boolean, types.ActiveHazard?)
	if not enabled or not detection.IsEnabled() then
		return false, nil
	end

	local activeHazards = detection.GetActiveHazards()
	for _, hazard in pairs(activeHazards) do
		if ignoredInstance and (hazard.instance == ignoredInstance or hazard.instance.Name == ignoredInstance.Name) then
			continue
		end

		if danger.IsPointInHazard(point, hazard) then
			return true, hazard
		end
	end

	return false, nil
end

--// 7. Kiểm tra trạng thái của Nhân vật Player hiện tại
function danger.IsPlayerInDanger(): (boolean, types.ActiveHazard?)
	local localPlayer = Players.LocalPlayer
	local character = localPlayer and localPlayer.Character
	if not character then return false, nil end

	local rootPart = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso")
	if not rootPart or not rootPart:IsA("BasePart") then return false, nil end

	return danger.IsPointInAnyHazard(rootPart.Position)
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

return danger