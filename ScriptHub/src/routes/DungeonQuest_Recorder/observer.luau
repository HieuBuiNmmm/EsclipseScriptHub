--// Observer: Ghi nhận vi mô toàn bộ hành vi di chuyển và phản xạ của Player (Read-Only)
--// Thu thập trực tiếp MoveDirection, LinearVelocity, Yaw, Jump, và tương quan với Hazards.

local Players = game:GetService("Players")

local observer = {}

local function getYawDegrees(lookVector)
	if not lookVector or lookVector.Magnitude < 0.001 then return 0 end
	return math.deg(math.atan2(lookVector.X, -lookVector.Z))
end

-- Tính toán xem điểm P có nằm trong vùng nguy hiểm không và khoảng cách tới tâm/mép
local function evaluateHazardOverlap(playerX, playerZ, hazard)
	local dx = playerX - hazard.x
	local dz = playerZ - hazard.z
	local distCenter = math.sqrt(dx * dx + dz * dz)

	if hazard.shape == "Circle" then
		local rad = hazard.radius or 10
		local inHazard = distCenter <= rad
		local distEdge = distCenter - rad -- âm nếu ở trong, dương nếu ở ngoài
		return inHazard, distCenter, distEdge
	else
		-- Dạng Box OBB xoay theo Yaw
		local yawRad = math.rad(hazard.yaw or 0)
		local cosY = math.cos(-yawRad)
		local sinY = math.sin(-yawRad)
		local localX = math.abs(dx * cosY - dz * sinY)
		local localZ = math.abs(dx * sinY + dz * cosY)

		local halfW = (hazard.width or 10) / 2
		local halfL = (hazard.length or 10) / 2

		local inHazard = (localX <= halfW) and (localZ <= halfL)
		local edgeDx = math.max(0, localX - halfW)
		local edgeDz = math.max(0, localZ - halfL)
		local distEdge = inHazard and -math.min(halfW - localX, halfL - localZ) or math.sqrt(edgeDx * edgeDx + edgeDz * edgeDz)

		return inHazard, distCenter, distEdge
	end
end

-- Lấy mẫu toàn diện của Player tại thời điểm t
function observer.Sample(activeHazards, bossData)
	local lp = Players.LocalPlayer
	local char = lp and lp.Character
	local root = char and (char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart)
	local hum = char and char:FindFirstChildOfClass("Humanoid")

	if not root or not hum then
		return nil
	end

	local pos = root.Position
	local lookVec = root.CFrame.LookVector
	local yaw = getYawDegrees(lookVec)
	local moveDir = hum.MoveDirection
	local vel = root.AssemblyLinearVelocity

	-- Đánh giá tương quan với tất cả các hazards
	local inDanger = false
	local nearestHazard = nil
	local minEdgeDist = 99999
	local minCenterDist = 99999

	if activeHazards and #activeHazards > 0 then
		for _, h in ipairs(activeHazards) do
			local inside, dCenter, dEdge = evaluateHazardOverlap(pos.X, pos.Z, h)
			if inside then
				inDanger = true
			end
			if dEdge < minEdgeDist then
				minEdgeDist = dEdge
				minCenterDist = dCenter
				nearestHazard = {
					name = h.name,
					shape = h.shape,
					distEdge = math.round(dEdge * 10) / 10,
					distCenter = math.round(dCenter * 10) / 10,
				}
			end
		end
	end

	-- Đánh giá tương quan với Boss
	local bossRelation = nil
	if bossData then
		local bdx = bossData.x - pos.X
		local bdz = bossData.z - pos.Z
		local bossDist = math.sqrt(bdx * bdx + bdz * bdz)
		local angleToBoss = math.deg(math.atan2(bdx, -bdz))
		local deltaYaw = (yaw - angleToBoss)
		if deltaYaw > 180 then deltaYaw = deltaYaw - 360 elseif deltaYaw < -180 then deltaYaw = deltaYaw + 360 end

		bossRelation = {
			name = bossData.name,
			distance = math.round(bossDist * 10) / 10,
			angleToBoss = math.round(deltaYaw * 10) / 10, -- 0° = đang nhìn thẳng Boss
			bossHp = bossData.hp,
			bossMaxHp = bossData.maxHp,
		}
	end

	return {
		player = {
			name = lp.Name,
			x = math.round(pos.X * 10) / 10,
			y = math.round(pos.Y * 10) / 10,
			z = math.round(pos.Z * 10) / 10,
			yaw = math.round(yaw * 10) / 10,
			moveX = math.round(moveDir.X * 1000) / 1000,
			moveZ = math.round(moveDir.Z * 1000) / 1000,
			moveMagnitude = math.round(Vector3.new(moveDir.X, 0, moveDir.Z).Magnitude * 1000) / 1000,
			velX = math.round(vel.X * 10) / 10,
			velY = math.round(vel.Y * 10) / 10,
			velZ = math.round(vel.Z * 10) / 10,
			speed = math.round(Vector3.new(vel.X, 0, vel.Z).Magnitude * 10) / 10,
			walkSpeed = hum.WalkSpeed,
			health = math.round(hum.Health),
			maxHealth = math.round(hum.MaxHealth),
			isJumping = hum.Jump or (vel.Y > 5),
		},
		danger = {
			inDanger = inDanger,
			nearestHazard = nearestHazard,
		},
		boss = bossRelation,
	}
end

return observer
