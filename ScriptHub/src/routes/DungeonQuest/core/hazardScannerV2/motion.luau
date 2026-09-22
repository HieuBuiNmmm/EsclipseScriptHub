-- HazardScannerV2 - Neon Kinematics & Motion Engine
-- Đo lường vận tốc tịnh tiến, vận tốc góc xoay quanh trục và dự báo quỹ đạo cho các Neon Hazard Parts.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local Players = game:GetService("Players")

--// Table
local motion = {}

--// State
local trackedRecords = {} -- [BasePart] = { lastPos, lastYaw, lastTime, velocity, speed, angularVel, motionType }

--// Constants
local MIN_MOVING_SPEED = 2.0 -- studs/s
local MIN_SPINNING_ANGULAR_VEL = 15.0 -- degrees/s

local function getPlayerPos()
	local lp = services.player or Players.LocalPlayer
	local char = lp and lp.Character
	local root = char and (char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart)
	return root and root.Position or nil
end

function motion.UpdateRecord(part, currentPos, currentYaw)
	if not part or not currentPos then return nil end

	local now = os.clock()
	local record = trackedRecords[part]

	if not record then
		record = {
			part = part,
			lastPos = currentPos,
			lastYaw = currentYaw or 0,
			lastTime = now,
			velocity = Vector3.zero,
			speed = 0,
			angularVel = 0,
			headingDir = Vector3.zero,
			motionType = "STATIC",
			spawnTime = now,
		}
		trackedRecords[part] = record
		return record
	end

	local dt = now - record.lastTime
	if dt >= 0.015 then
		local deltaPos = currentPos - record.lastPos
		local deltaPos2D = Vector3.new(deltaPos.X, 0, deltaPos.Z)
		local currentSpeed = deltaPos2D.Magnitude / dt
		local currentVel = deltaPos2D / dt

		local deltaYaw = (currentYaw or 0) - record.lastYaw
		while deltaYaw > 180 do deltaYaw -= 360 end
		while deltaYaw < -180 do deltaYaw += 360 end
		local currentAngularVel = deltaYaw / dt

		record.speed = record.speed * 0.4 + currentSpeed * 0.6
		record.velocity = record.velocity * 0.4 + currentVel * 0.6
		record.angularVel = record.angularVel * 0.4 + currentAngularVel * 0.6

		if record.speed > 0.1 then
			record.headingDir = record.velocity.Unit
		end

		if record.speed >= MIN_MOVING_SPEED then
			local pPos = getPlayerPos()
			if pPos and (pPos - currentPos).Magnitude < 100 then
				local toPlayer = (pPos - currentPos).Unit
				local dot = record.headingDir:Dot(toPlayer)
				if dot > 0.85 then
					record.motionType = "HOMING"
				else
					record.motionType = "LINEAR"
				end
			else
				record.motionType = "LINEAR"
			end
			record.angularVel = 0
		elseif math.abs(record.angularVel) >= MIN_SPINNING_ANGULAR_VEL then
			record.motionType = "SPINNING"
		else
			record.motionType = "STATIC"
		end

		record.lastPos = currentPos
		record.lastYaw = currentYaw or 0
		record.lastTime = now
	end

	return record
end

function motion.GetRecord(part)
	return trackedRecords[part]
end

function motion.GetTrajectoryProjection(part, duration)
	local rec = trackedRecords[part]
	if not rec or rec.motionType == "STATIC" then
		return nil
	end

	duration = duration or 1.5
	local points = {}
	local steps = 5
	local stepTime = duration / steps

	for i = 1, steps do
		local t = i * stepTime
		if rec.motionType == "SPINNING" then
			local futureYaw = rec.lastYaw + (rec.angularVel * t)
			table.insert(points, {
				time = t,
				x = rec.lastPos.X,
				z = rec.lastPos.Z,
				yaw = futureYaw,
			})
		else
			local fPos = rec.lastPos + (rec.velocity * t)
			table.insert(points, {
				time = t,
				x = fPos.X,
				z = fPos.Z,
				yaw = rec.lastYaw,
			})
		end
	end

	return {
		motionType = rec.motionType,
		speed = rec.speed,
		angularVel = rec.angularVel,
		dirX = rec.headingDir.X,
		dirZ = rec.headingDir.Z,
		futurePoints = points,
	}
end

function motion.RemoveRecord(part)
	trackedRecords[part] = nil
end

function motion.ClearAll()
	table.clear(trackedRecords)
end

return motion
