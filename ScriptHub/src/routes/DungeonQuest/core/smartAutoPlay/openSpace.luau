--==============================================================--
-- Smart Auto Play – Open Space Repositioning (DungeonQuest V1 Mode)
-- Sau khi né chiêu (Post-Dodge):
--   1. Bắn các vector toả tròn với bán kính lớn hơn (1.5x Combat Radius R)
--   2. Tìm điểm có "Không gian đủ rộng" (High Wall Clearance, Safe Floor, No Hazard)
--   3. Hiển thị Visual Marker màu XANH DƯƠNG (🔵 Blue Spot) tại điểm đích
--   4. Nhân vật chủ động di chuyển đến bãi đất trống để chuẩn bị né các đòn tiếp theo
--   5. Nếu xuất hiện nguy hiểm mới hoặc đường đi bị chặn -> Lập tức hủy và né tiếp!
--==============================================================--

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local sdv2 = require("@routes/DungeonQuest/core/smartDodgeV2")
local bossArea = require("@routes/DungeonQuest/core/smartDodgeV2/bossArea")

local player = services.player
local openSpace = {}

--// Cấu hình
local enabled = true
local radiusMultiplier = 1.5 -- 1.5x Combat Radius R
local NUM_DIRECTIONS = 24    -- 24 hướng quét toả tròn 360 độ (mỗi 15 độ)
local CLEARANCE_DIRECTIONS = 8 -- 8 hướng đo độ rộng không gian xung quanh điểm tiềm năng
local MAX_CLEARANCE_CHECK_DIST = 14.0 -- Khoảng cách đo độ thoáng tường (studs)

--// Visual Marker màu Xanh Dương (Blue Spot)
local blueMarkerPart = nil
local lastRenderedDist = -1
local BLUE_COLOR = Color3.fromRGB(0, 150, 255)
local BLUE_LABEL_COLOR = Color3.fromRGB(120, 210, 255)

--// Raycast Filters
local wallRayParams = RaycastParams.new()
wallRayParams.FilterType = Enum.RaycastFilterType.Exclude
wallRayParams.IgnoreWater = true

local floorRayParams = RaycastParams.new()
floorRayParams.FilterType = Enum.RaycastFilterType.Exclude
floorRayParams.IgnoreWater = true

local function updateRayFilters()
	local ignore = {}
	if player and player.Character then
		table.insert(ignore, player.Character)
	end
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player and p.Character then
			table.insert(ignore, p.Character)
		end
	end
	local rayIgnore = Workspace:FindFirstChild("RaycastIgnore")
	if rayIgnore then table.insert(ignore, rayIgnore) end
	local vFolder = Workspace:FindFirstChild("SmartDodgeV2_Visuals")
	if vFolder then table.insert(ignore, vFolder) end
	local aFolder = Workspace:FindFirstChild("SmartDodgeV2_BossAreaVisual")
	if aFolder then table.insert(ignore, aFolder) end

	local tracked = shared.GetTrackedEnemyData and shared.GetTrackedEnemyData()
	if tracked then
		for _, data in ipairs(tracked) do
			if data and data.Model and data.Model.Parent then
				table.insert(ignore, data.Model)
			end
		end
	end

	wallRayParams.FilterDescendantsInstances = ignore
	floorRayParams.FilterDescendantsInstances = ignore
end

-- Raycast tìm cao độ sàn vật lý thật
local function getSolidFloor(pos: Vector3, fallbackY: number): (number?, boolean, Vector3?)
	updateRayFilters()
	local rayOrigin = Vector3.new(pos.X, pos.Y + 6.0, pos.Z)
	local curOrigin = rayOrigin
	local curDir = Vector3.new(0, -50.0, 0)

	for _ = 1, 5 do
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
				return hit.Position.Y, true, hit.Normal
			end
		end
		curOrigin = Vector3.new(hit.Position.X, hit.Position.Y - 0.05, hit.Position.Z)
		curDir = Vector3.new(0, (rayOrigin.Y - 50.0) - curOrigin.Y, 0)
		if curDir.Y >= 0 then break end
	end
	return fallbackY, false, nil
end

-- Đo độ rộng không gian xung quanh một điểm (Wall Clearance)
local function measureWallClearance(originPos: Vector3): (number, number)
	updateRayFilters()
	local rayHeight = originPos.Y + 1.2
	local minWallDist = MAX_CLEARANCE_CHECK_DIST
	local totalDist = 0

	for i = 0, CLEARANCE_DIRECTIONS - 1 do
		local angle = (i / CLEARANCE_DIRECTIONS) * (math.pi * 2)
		local dir = Vector3.new(math.cos(angle), 0, math.sin(angle))
		local rayStart = Vector3.new(originPos.X, rayHeight, originPos.Z)
		local rayVector = dir * MAX_CLEARANCE_CHECK_DIST

		local hit = Workspace:Raycast(rayStart, rayVector, wallRayParams)
		local dist = hit and hit.Distance or MAX_CLEARANCE_CHECK_DIST

		if dist < minWallDist then
			minWallDist = dist
		end
		totalDist = totalDist + dist
	end

	local avgWallDist = totalDist / CLEARANCE_DIRECTIONS
	return minWallDist, avgWallDist
end

--// Tìm điểm Reposition tốt nhất (Open Space)
function openSpace.FindBestRepositionSpot(playerPos: Vector3, enemyPos: Vector3?, baseRadius: number?, isBoss1: boolean?, isInsideArenaFunc: ((Vector3) -> boolean)?, isBossActive: boolean?): Vector3?
	if not playerPos then return nil end

	updateRayFilters()
	local baseR = baseRadius or 15.0
	local maxSearchDist = math.clamp(baseR * radiusMultiplier, 8.0, 32.0)
	local minSearchDist = 5.0

	local playerFloorY = playerPos.Y - 2.8

	local curEnemyDist = nil
	if enemyPos then
		local ex = enemyPos.X - playerPos.X
		local ez = enemyPos.Z - playerPos.Z
		curEnemyDist = math.sqrt(ex * ex + ez * ez)
	end

	local bestSpot: Vector3? = nil
	local bestScore = -math.huge

	-- 3 bước cự ly tìm kiếm: Gần (0.35 max), Trung bình (0.70 max), Xa (1.0 max)
	local distanceSteps = {
		minSearchDist + (maxSearchDist - minSearchDist) * 0.35,
		minSearchDist + (maxSearchDist - minSearchDist) * 0.70,
		maxSearchDist,
	}

	for i = 0, NUM_DIRECTIONS - 1 do
		local angle = (i / NUM_DIRECTIONS) * (math.pi * 2)
		local dir = Vector3.new(math.cos(angle), 0, math.sin(angle))

		-- Bắn Raycast kiểm tra tường thẳng theo hướng này
		local rayOrigin = Vector3.new(playerPos.X, playerPos.Y + 1.2, playerPos.Z)
		local wallHit = Workspace:Raycast(rayOrigin, dir * (maxSearchDist + 2.0), wallRayParams)
		local maxAllowedDist = maxSearchDist
		if wallHit and wallHit.Instance and wallHit.Instance.CanCollide and wallHit.Normal.Y <= 0.65 then
			maxAllowedDist = math.max(0, wallHit.Distance - 2.5)
		end

		if maxAllowedDist >= minSearchDist then
			for _, testDist in ipairs(distanceSteps) do
				if testDist <= maxAllowedDist then
					local candPos = playerPos + dir * testDist

					-- RÀNG BUỘC KHOẢNG CÁCH AN TOÀN VỚI QUÁI:
					if enemyPos and curEnemyDist then
						local cdx = candPos.X - enemyPos.X
						local cdz = candPos.Z - enemyPos.Z
						local candEnemyDist = math.sqrt(cdx * cdx + cdz * cdz)

						-- Không chọn điểm áp sát quái dưới 8.0 studs
						local minSafeDist = math.max(8.0, math.min(curEnemyDist, baseR - 2.5))
						if candEnemyDist < minSafeDist then
							continue
						end

						-- Đối với quái thường: không chọn điểm quá xa quái khiến mất tầm chiến đấu
						if not isBossActive then
							if candEnemyDist > math.max(32.0, baseR + 14.0) then
								continue
							end
						end
					end

					-- 1. Kiểm tra Boss Arena & Center Deadzone
					if bossArea and bossArea.IsPointInArena and not bossArea.IsPointInArena(candPos, 0) then
						continue
					end
					if bossArea and bossArea.IsPointInBoss1Center and bossArea.IsPointInBoss1Center(candPos) then
						continue
					end

					-- 2. Kiểm tra mặt sàn
					local rawFloorY, hasFloor, floorNormal = getSolidFloor(candPos, playerFloorY)
					if hasFloor and rawFloorY then
						local deltaY = math.abs(rawFloorY - playerFloorY)
						local slopeOk = not floorNormal or (floorNormal.Y >= 0.85)

						if deltaY <= 1.8 and slopeOk then
							local floorPos = Vector3.new(candPos.X, rawFloorY + 2.8, candPos.Z)

							-- 3. Kiểm tra Hazard tại điểm đích
							local inHazard = sdv2 and sdv2.danger and sdv2.danger.IsPointInAnyHazard(floorPos, nil, 1.5)
							if not inHazard then
								-- 4. Kiểm tra đường chạy từ playerPos đến floorPos không bị hazard chặn
								local pathSafe = not (sdv2 and sdv2.danger and not sdv2.danger.IsPathSafe(playerPos, floorPos))
								if pathSafe then
									-- 5. CHẤM ĐIỂM "KHÔNG GIAN ĐỦ RỘNG" (Clearance Score)
									local minWallDist, avgWallDist = measureWallClearance(floorPos)

									local score = (minWallDist * 4.0) + (avgWallDist * 2.0)

									if deltaY <= 0.4 then
										score = score + 25.0
									else
										score = score - (deltaY * 20.0)
									end

									if minWallDist < 4.5 then
										score = score - 30.0
									end

									if enemyPos and curEnemyDist then
										local cdx = floorPos.X - enemyPos.X
										local cdz = floorPos.Z - enemyPos.Z
										local candDist = math.sqrt(cdx * cdx + cdz * cdz)
										if not isBossActive then
											if candDist >= 10.0 and candDist <= baseR then
												score = score + 40.0
											end
										else
											if candDist >= (baseR - 1.0) and candDist <= (baseR + 4.0) then
												score = score + 35.0
											end
										end
									end

									if testDist >= 6.5 then
										score = score + 15.0
									end

									if score > bestScore then
										bestScore = score
										bestSpot = floorPos
									end
								end
							end
						end
					end
				end
			end
		end
	end

	return bestSpot
end

--// Visual Marker màu Xanh Dương (Blue Spot)
local function getOrCreateBlueMarker(): Part
	if blueMarkerPart and blueMarkerPart.Parent then
		return blueMarkerPart
	end

	local part = Instance.new("Part")
	part.Name = "SmartAutoPlay_OpenSpaceMarker"
	part.Shape = Enum.PartType.Ball
	part.Size = Vector3.new(1.8, 1.8, 1.8)
	part.Color = BLUE_COLOR
	part.Material = Enum.Material.Neon
	part.Transparency = 0.25
	part.Anchored = true
	part.CanCollide = false
	part.CanQuery = false
	part.CanTouch = false

	local bb = Instance.new("BillboardGui")
	bb.Name = "MarkerGui"
	bb.Size = UDim2.fromOffset(150, 26)
	bb.StudsOffset = Vector3.new(0, 2.0, 0)
	bb.AlwaysOnTop = true
	bb.Adornee = part
	bb.Parent = part

	local label = Instance.new("TextLabel")
	label.Name = "Label"
	label.Size = UDim2.fromScale(1, 1)
	label.BackgroundTransparency = 1
	label.TextColor3 = BLUE_LABEL_COLOR
	label.TextStrokeTransparency = 0
	label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	label.Font = Enum.Font.GothamBold
	label.TextSize = 12
	label.Text = "🔵 REPOSITION SPOT"
	label.Parent = bb

	blueMarkerPart = part
	return part
end

function openSpace.UpdateVisualMarker(spotPos: Vector3?, visible: boolean, distance: number?)
	if not visible or not spotPos then
		if blueMarkerPart then
			blueMarkerPart.Parent = nil
		end
		lastRenderedDist = -1
		return
	end

	local marker = getOrCreateBlueMarker()
	local floorBallY = spotPos.Y - 1.6
	local newPos = Vector3.new(spotPos.X, floorBallY, spotPos.Z)

	marker.CFrame = CFrame.new(newPos)
	if not marker.Parent then
		marker.Parent = Workspace
	end

	local curDist = distance or 0
	if math.abs(curDist - lastRenderedDist) >= 0.2 then
		lastRenderedDist = curDist
		local bb = marker:FindFirstChild("MarkerGui")
		local label = bb and bb:FindFirstChild("Label")
		if label then
			label.Text = string.format("🔵 REPOSITION (%.1fm)", curDist)
		end
	end
end

function openSpace.ClearVisualMarker()
	if blueMarkerPart then
		pcall(function() blueMarkerPart:Destroy() end)
		blueMarkerPart = nil
	end
	lastRenderedDist = -1
end

function openSpace.SetEnabled(val: boolean)
	enabled = val and true or false
	if not enabled then
		openSpace.ClearVisualMarker()
	end
end

function openSpace.IsEnabled(): boolean
	return enabled
end

function openSpace.SetRadiusMultiplier(val: number)
	if type(val) == "number" and val >= 1.0 and val <= 3.0 then
		radiusMultiplier = val
	end
end

function openSpace.GetRadiusMultiplier(): number
	return radiusMultiplier
end

return openSpace
