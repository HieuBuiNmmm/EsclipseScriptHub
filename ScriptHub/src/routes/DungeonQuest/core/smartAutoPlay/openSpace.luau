--==============================================================--
-- Smart Auto Play – Open Space Repositioning (DungeonQuest)
-- Sau khi né chiêu (Post-Dodge):
--   1. Bắn các vector toả tròn với bán kính lớn hơn (1.5x Combat Radius R)
--   2. Tìm điểm có "Không gian đủ rộng" (High Wall Clearance, Safe Floor, No Hazard)
--   3. Hiển thị Visual Marker màu XANH DƯƠNG (Blue Spot) tại điểm đích
--   4. Nhân vật chủ động di chuyển đến bãi đất trống để chuẩn bị né các đòn tiếp theo
--   5. Nếu xuất hiện nguy hiểm mới hoặc đường đi bị chặn -> Lập tức hủy và né tiếp!
--==============================================================--

local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local geometry = require("@routes/DungeonQuest/core/smartDodge/geometry")
local smartDodge = require("@routes/DungeonQuest/core/smartDodge")

local Workspace = workspace
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

local function updateWallRayFilter()
	local ignore = {}
	if player and player.Character then
		table.insert(ignore, player.Character)
	end
	local rayIgnore = Workspace:FindFirstChild("RaycastIgnore")
	if rayIgnore then
		table.insert(ignore, rayIgnore)
	end
	local tracked = shared.GetTrackedEnemyData()
	if tracked then
		for _, data in ipairs(tracked) do
			if data and data.Model and data.Model.Parent then
				table.insert(ignore, data.Model)
			end
		end
	end
	wallRayParams.FilterDescendantsInstances = ignore
end

--// Đo độ thoáng tường (Wall Clearance) xung quanh một điểm P
-- Trả về: minWallDist, avgWallDist
local function measureWallClearance(pPos)
	local totalDist = 0
	local minDist = MAX_CLEARANCE_CHECK_DIST
	local rayOrigin = Vector3.new(pPos.X, pPos.Y + 1.2, pPos.Z)

	for i = 1, CLEARANCE_DIRECTIONS do
		local angle = (i - 1) * (2 * math.pi / CLEARANCE_DIRECTIONS)
		local dir = Vector3.new(math.cos(angle), 0, math.sin(angle))
		local hit = Workspace:Raycast(rayOrigin, dir * MAX_CLEARANCE_CHECK_DIST, wallRayParams)
		local d = hit and hit.Distance or MAX_CLEARANCE_CHECK_DIST
		if d < minDist then
			minDist = d
		end
		totalDist = totalDist + d
	end

	return minDist, totalDist / CLEARANCE_DIRECTIONS
end

--// Kiểm tra đường chạy từ fromPos đến toPos có bị hazard chặn không
local function isPathSafeFromHazards(fromPos, toPos)
	local diff = toPos - fromPos
	local flatDiff = Vector3.new(diff.X, 0, diff.Z)
	local dist = flatDiff.Magnitude
	if dist < 0.5 then return true end

	local dir = flatDiff.Unit
	local step = 2.5
	-- Bắt đầu từ 3.0 studs để tránh false positive ngay tại mép hazard người chơi vừa thoát ra
	local cur = 3.0
	while cur <= dist do
		local pt = fromPos + dir * cur
		if geometry.IsPointInAnyHazard(pt) then
			return false
		end
		cur = cur + step
	end

	return true
end

--// Tìm điểm Open Space Reposition tốt nhất
-- playerPos: Vector3
-- enemyPos: Vector3 | nil
-- combatRadius: number
-- isBoss1: boolean
-- isInsideArenaFunc: ((Vector3) -> boolean) | nil
-- isBoss: boolean | nil
function openSpace.FindBestRepositionSpot(playerPos, enemyPos, combatRadius, isBoss1, isInsideArenaFunc, isBoss)
	if not enabled or not playerPos then return nil end

	updateWallRayFilter()

	local isBossTarget = (isBoss == true) or (shared.IsBossActive and shared.IsBossActive() == true)
	local baseR = combatRadius or 15.0
	local maxSearchDist = baseR * radiusMultiplier
	local minSearchDist = math.max(5.5, baseR * 0.4)

	-- Phân tích hướng và cự ly đối với quái/boss
	local curEnemyDist = nil
	local enemyFlatDir = nil
	if enemyPos then
		local ex = enemyPos.X - playerPos.X
		local ez = enemyPos.Z - playerPos.Z
		curEnemyDist = math.sqrt(ex * ex + ez * ez)
		if curEnemyDist > 0.1 then
			enemyFlatDir = Vector3.new(ex / curEnemyDist, 0, ez / curEnemyDist)
		end
	end

	local bestSpot = nil
	local bestScore = -math.huge

	-- Thử các cự ly toả tròn từ minSearchDist đến maxSearchDist (4 bước cự ly)
	local distanceSteps = {
		minSearchDist,
		minSearchDist + (maxSearchDist - minSearchDist) * 0.35,
		minSearchDist + (maxSearchDist - minSearchDist) * 0.70,
		maxSearchDist
	}

	local rayOrigin = Vector3.new(playerPos.X, playerPos.Y + 1.2, playerPos.Z)

	-- Lấy cao độ mặt sàn thực tế nơi người chơi đang đứng để so sánh chênh lệch độ cao
	local playerFloorY = playerPos.Y - 2.8
	local pRawFloorY, pHasFloor = geometry.GetRawFloorY(playerPos)
	if pHasFloor and pRawFloorY then
		playerFloorY = pRawFloorY
	end

	for i = 1, NUM_DIRECTIONS do
		local angle = (i - 1) * (2 * math.pi / NUM_DIRECTIONS)
		local dir = Vector3.new(math.cos(angle), 0, math.sin(angle))

		-- QUY TẮC AN TOÀN BẮT BUỘC: TUYỆT ĐỐI KHÔNG CHỌN HƯỚNG LAO VỀ PHÍA QUÁI / BOSS
		if enemyFlatDir then
			local forwardDot = dir.X * enemyFlatDir.X + dir.Z * enemyFlatDir.Z
			-- Nếu vector này hướng về phía quái (forwardDot > 0.15) -> LOẠI BỎ HOÀN TOÀN!
			-- Chỉ chấp nhận di chuyển tạt ngang (Strafe/Flank: |forwardDot| <= 0.35) hoặc lùi/chéo ra xa (forwardDot < -0.1)
			if forwardDot > 0.15 then
				continue
			end
		end

		-- Bắn 1 raycast ngang theo hướng này để xem có bị tường chặn ở khoảng cách nào
		local wallHit = Workspace:Raycast(rayOrigin, dir * maxSearchDist, wallRayParams)
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

						-- 1. An toàn tối thiểu: Không chọn điểm áp sát quái dưới 10.0 studs
						local minSafeDist = math.max(10.0, math.min(curEnemyDist, baseR - 2.5))
						if candEnemyDist < minSafeDist then
							continue
						end

						-- 2. ĐẶC BIỆT DÀNH RIÊNG CHO QUÁI THƯỜNG (MOBS ONLY):
						-- Bắt buộc phải giữ quái nằm bên trong bán kính chiến đấu (candEnemyDist <= baseR)
						if not isBossTarget then
							if curEnemyDist <= (baseR + 1.0) then
								-- Nếu đang ở trong tầm R -> Bắt buộc điểm đến cũng phải nằm trọn vẹn trong R
								if candEnemyDist > baseR then
									continue
								end
							else
								-- Nếu né chiêu khiến người chơi vô tình văng ra ngoài R -> Không được chọn điểm xa hơn cự ly hiện tại
								if candEnemyDist > curEnemyDist then
									continue
								end
							end
						end
					end

					-- 1. Kiểm tra Boss 1 Arena (nếu có)
					local arenaOk = true
					local b1Center = smartDodge.GetBoss1ArenaCenter and smartDodge.GetBoss1ArenaCenter()
					local b1Radius = smartDodge.GetBoss1ArenaRadius and smartDodge.GetBoss1ArenaRadius()
					if b1Center and b1Radius and b1Radius > 0 then
						local c2D = Vector3.new(candPos.X, 0, candPos.Z)
						local o2D = Vector3.new(b1Center.X, 0, b1Center.Z)
						arenaOk = (c2D - o2D).Magnitude <= (b1Radius - 3.5)
					elseif isBoss1 and isInsideArenaFunc then
						arenaOk = isInsideArenaFunc(candPos)
					end

					if arenaOk then
						-- 2. Kiểm tra mặt sàn (Floor & Cliff Check)
						local rawFloorY, hasFloor, floorNormal = geometry.GetRawFloorY(candPos)
						if hasFloor and rawFloorY then
							local deltaY = math.abs(rawFloorY - playerFloorY)
							-- Kiểm tra độ dốc sàn: góc nghiêng <= 28 độ (Normal.Y >= 0.88) để loại bỏ vách đá/mép dốc
							local slopeOk = not floorNormal or (floorNormal.Y >= 0.88)

							-- Hard Filter: Cao độ không chênh lệch quá 1.8 studs so với mặt đất người chơi đang đứng
							if deltaY <= 1.8 and slopeOk then
								local floorPos = Vector3.new(candPos.X, rawFloorY + 2.8, candPos.Z)

								-- 3. Kiểm tra Hazard tại điểm đích (kèm padding 2 studs)
								local inHazard = geometry.IsPointInAnyHazard(floorPos)
								if not inHazard then
									-- Kiểm tra thêm 4 hướng xung quanh điểm đích xem có sát mép hazard không
									local safeEdge = not geometry.IsPointInAnyHazard(floorPos + Vector3.new(2, 0, 0))
										and not geometry.IsPointInAnyHazard(floorPos + Vector3.new(-2, 0, 0))
										and not geometry.IsPointInAnyHazard(floorPos + Vector3.new(0, 0, 2))
										and not geometry.IsPointInAnyHazard(floorPos + Vector3.new(0, 0, -2))

									if safeEdge then
										-- 4. Kiểm tra đường chạy từ playerPos đến floorPos không bị hazard chặn
										if isPathSafeFromHazards(playerPos, floorPos) then
											-- 5. CHẤM ĐIỂM "KHÔNG GIAN ĐỦ RỘNG" (Clearance Score)
											local minWallDist, avgWallDist = measureWallClearance(floorPos)

											-- Điểm càng thoáng tường càng cao
											local score = (minWallDist * 4.0) + (avgWallDist * 2.0)

											-- ƯU TIÊN ĐỘ CAO SÀN GẦN VỚI PLAYER (ELEVATION SCORE):
											if deltaY <= 0.4 then
												score = score + 25.0 -- Bonus sàn phẳng cùng mặt phẳng
											else
												score = score - (deltaY * 20.0) -- Phạt mạnh nếu chênh lệch độ cao Y
											end

											-- Phạt nặng nếu minWallDist quá nhỏ (sát góc tường)
											if minWallDist < 4.5 then
												score = score - 30.0
											end

											-- Chấm điểm theo cự ly an toàn tới quái / boss
											if enemyPos and curEnemyDist then
												local cdx = floorPos.X - enemyPos.X
												local cdz = floorPos.Z - enemyPos.Z
												local candDist = math.sqrt(cdx * cdx + cdz * cdz)

												if not isBossTarget then
													-- ĐỐI VỚI QUÁI THƯỜNG: Thưởng cực lớn khi giữ quái trong R (11.0 ~ baseR)
													if candDist >= 11.0 and candDist <= baseR then
														score = score + 45.0 -- Điểm tuyệt đối: giữ mob trong R + an toàn
													end
												else
													-- ĐỐI VỚI BOSS: Càng thoáng càng tốt
													if candDist >= (baseR - 1.0) and candDist <= (baseR + 5.0) then
														score = score + 35.0
													elseif candDist > (baseR + 5.0) then
														score = score + 20.0
													end
												end
											end

											-- Thưởng cho việc di chuyển đủ xa khỏi vị trí vừa né (ít nhất 6-7 studs)
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
		end
	end

	return bestSpot
end

--// Visual Marker màu Xanh Dương (Blue Spot)
local function getOrCreateBlueMarker()
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
	bb.Size = UDim2.fromOffset(140, 24)
	bb.StudsOffset = Vector3.new(0, 1.8, 0)
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

function openSpace.UpdateVisualMarker(spotPos, visible, distance)
	if not visible or not spotPos then
		if blueMarkerPart then
			blueMarkerPart.Parent = nil
		end
		lastRenderedDist = -1
		return
	end

	local marker = getOrCreateBlueMarker()
	-- Hạ tâm quả cầu xuống sát đất một chút cho đẹp
	local floorBallY = spotPos.Y - 1.6
	local newPos = Vector3.new(spotPos.X, floorBallY, spotPos.Z)

	marker.CFrame = CFrame.new(newPos)
	if not marker.Parent then
		marker.Parent = Workspace.Terrain
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

--// Getter / Setter
function openSpace.SetEnabled(val)
	enabled = val and true or false
	if not enabled then
		openSpace.ClearVisualMarker()
	end
end

function openSpace.IsEnabled()
	return enabled
end

function openSpace.SetRadiusMultiplier(val)
	if type(val) == "number" and val >= 1.0 and val <= 3.0 then
		radiusMultiplier = val
	end
end

function openSpace.GetRadiusMultiplier()
	return radiusMultiplier
end

return openSpace
