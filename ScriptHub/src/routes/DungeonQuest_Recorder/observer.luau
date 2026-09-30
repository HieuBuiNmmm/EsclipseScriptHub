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
	if not hazard or not hazard.x or not hazard.z then
		return false, 99999, 99999
	end

	local dx = playerX - hazard.x
	local dz = playerZ - hazard.z
	local distCenter = math.sqrt(dx * dx + dz * dz)
	local shapeName = tostring(hazard.shape):lower()

	if shapeName == "circle" then
		local rad = hazard.radius or 10
		local inHazard = distCenter <= rad
		local distEdge = distCenter - rad -- âm nếu ở trong, dương nếu ở ngoài
		return inHazard, distCenter, distEdge
	elseif shapeName == "compound_multiring" then
		local maxRad = hazard.maxRadius or 105
		local inHazard = distCenter <= maxRad
		local distEdge = distCenter - maxRad
		return inHazard, distCenter, distEdge
	else
		-- Dạng Box OBB xoay theo Yaw
		local yawRad = math.rad(hazard.yaw or 0)
		local cosY = math.cos(-yawRad)
		local sinY = math.sin(-yawRad)
		local localX = math.abs(dx * cosY - dz * sinY)
		local localZ = math.abs(dx * sinY + dz * cosY)

		local halfW = (hazard.halfWidth or hazard.halfX or (hazard.width and hazard.width / 2) or 5)
		local halfL = (hazard.halfLength or hazard.halfZ or (hazard.length and hazard.length / 2) or 5)

		local inHazard = (localX <= halfW) and (localZ <= halfL)
		local edgeDx = math.max(0, localX - halfW)
		local edgeDz = math.max(0, localZ - halfL)
		local distEdge = inHazard and -math.min(halfW - localX, halfL - localZ) or math.sqrt(edgeDx * edgeDx + edgeDz * edgeDz)

		return inHazard, distCenter, distEdge
	end
end

-- Lấy mẫu toàn diện của Player tại thời điểm t (được bọc an toàn tuyệt đối)
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
	local moveDir = hum.MoveDirection or Vector3.zero
	local vel = Vector3.zero
	pcall(function()
		vel = root.AssemblyLinearVelocity or root.Velocity or Vector3.zero
	end)

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
					name = h.name or "Hazard",
					shape = h.shape or "box",
					distEdge = math.round(dEdge * 10) / 10,
					distCenter = math.round(dCenter * 10) / 10,
				}
			end
		end
	end

	-- Đánh giá tương quan với Boss (chỉ khi có Boss active)
	local bossRelation = nil
	if bossData and bossData.active and bossData.x and bossData.z then
		local bdx = bossData.x - pos.X
		local bdz = bossData.z - pos.Z
		local bossDist = math.sqrt(bdx * bdx + bdz * bdz)
		local angleToBoss = math.deg(math.atan2(bdx, -bdz))
		local deltaYaw = (yaw - angleToBoss)
		if deltaYaw > 180 then deltaYaw = deltaYaw - 360 elseif deltaYaw < -180 then deltaYaw = deltaYaw + 360 end

		bossRelation = {
			name = bossData.name or "Boss",
			distance = math.round(bossDist * 10) / 10,
			angleToBoss = math.round(deltaYaw * 10) / 10, -- 0° = đang nhìn thẳng Boss
			bossHp = bossData.health or bossData.hp or 0,
			bossMaxHp = bossData.maxHealth or bossData.maxHp or 100,
		}
	end

	return {
		player = {
			name = lp.Name or "Player",
			x = math.round(pos.X * 10) / 10,
			y = math.round(pos.Y * 10) / 10,
			z = math.round(pos.Z * 10) / 10,
			yaw = math.round(yaw * 10) / 10,
			moveX = math.round((moveDir.X or 0) * 1000) / 1000,
			moveZ = math.round((moveDir.Z or 0) * 1000) / 1000,
			moveMagnitude = math.round(Vector3.new(moveDir.X or 0, 0, moveDir.Z or 0).Magnitude * 1000) / 1000,
			velX = math.round((vel.X or 0) * 10) / 10,
			velY = math.round((vel.Y or 0) * 10) / 10,
			velZ = math.round((vel.Z or 0) * 10) / 10,
			speed = math.round(Vector3.new(vel.X or 0, 0, vel.Z or 0).Magnitude * 10) / 10,
			walkSpeed = hum.WalkSpeed or 16,
			health = math.round(hum.Health or 100),
			maxHealth = math.round(hum.MaxHealth or 100),
			isJumping = hum.Jump or ((vel.Y or 0) > 5),
		},
		danger = {
			inDanger = inDanger,
			nearestHazard = nearestHazard,
		},
		boss = bossRelation,
	}
end

return observer
