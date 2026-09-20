-- HazardScanner – Deep Inspector (Debug Layer, tách khỏi core detection).
-- Toàn bộ công cụ inspect chi tiết (SPAWN/DESPAWN/REJECTED + Spinning Analysis) nằm ở đây,
-- KHÔNG thuộc pipeline quyết định hazard. Detection chỉ gọi LogSpawn/LogDespawn/LogReject khi cần.

--// Imports
local geometry = require("@routes/DungeonQuest/core/evasion/spatial/geometry")

--// Table
local deepInspect = {}

--// State (chỉ phục vụ debug)
local inspectTargetName = ""
local inspectEnabled = false

--// Distance được Detection bind vào (tránh trùng lặp logic)
local computeDistanceFn = nil

function deepInspect.BindComputeDistance(fn)
	if type(fn) == "function" then
		computeDistanceFn = fn
	end
end

local function getDistance(instance)
	if type(computeDistanceFn) == "function" then
		return computeDistanceFn(instance)
	end
	return 0
end

function deepInspect.SetInspectTarget(name)
	inspectTargetName = typeof(name) == "string" and name or ""
end

function deepInspect.GetInspectTarget()
	return inspectTargetName
end

function deepInspect.SetInspectEnabled(state)
	inspectEnabled = state and true or false
end

function deepInspect.IsInspectEnabled()
	return inspectEnabled
end

function deepInspect.Matches(name)
	if not inspectEnabled or inspectTargetName == "" then return false end
	if not name or type(name) ~= "string" then return false end
	local cleanTarget = inspectTargetName:lower():gsub("%s+", "")
	if #cleanTarget == 0 then return false end
	local cleanName = name:lower():gsub("%s+", "")
	return string.find(cleanName, cleanTarget, 1, true) ~= nil
end

local function formatVector3(v)
	if not v then return "nil" end
	return ("(%.2f, %.2f, %.2f)"):format(v.X, v.Y, v.Z)
end

local function printBlock(instance, eventType, extraReason, infoData)
	if not instance then return end
	local name = instance.Name
	if not deepInspect.Matches(name) then return end

	local class = instance.ClassName
	local parentPath = instance.Parent and instance.Parent:GetFullName() or "nil"
	local distance = getDistance(instance)

	print("================== 🔍 [HAZARD DEEP INSPECT] 🔍 ==================")
	print(("  🎯 Target Name    : %s (%s)"):format(name, class))
	print(("  📌 Event Type     : %s%s"):format(eventType, extraReason and (" -> " .. tostring(extraReason)) or ""))
	print(("  📍 Full Path      : %s"):format(parentPath))
	print(("  📏 Dist to Player : %d studs"):format(distance))

	if eventType == "SPAWN" then
		local parts = {}
		if instance:IsA("BasePart") then
			table.insert(parts, instance)
		else
			for _, desc in ipairs(instance:GetDescendants()) do
				if desc:IsA("BasePart") then
					table.insert(parts, desc)
				end
			end
		end

		print(("  🧩 Total Parts (%d) :"):format(#parts))
		for idx, p in ipairs(parts) do
			local shapeStr = p:IsA("Part") and tostring(p.Shape.Name) or (p.ClassName == "MeshPart" and "MeshPart" or p.ClassName)
			print(("     [%d] %q (%s)"):format(idx, p.Name, p.ClassName))
			print(("         • Size: %s | Shape: %s | Trans: %.2f | CanCollide: %s"):format(
				formatVector3(p.Size),
				shapeStr,
				p.Transparency,
				tostring(p.CanCollide)
			))
			print(("         • Pos : %s"):format(formatVector3(p.Position)))
		end

		local hazardZones = geometry.GetHazardZones(infoData)
		if hazardZones and hazardZones.zones then
			local pad = geometry.GetHitboxPadding()
			print(("  📐 Math Geometry (Zones: %d, BoundingRadius: %.1f studs):"):format(
				#hazardZones.zones,
				hazardZones.boundingRadius or 0
			))
			for idx, z in ipairs(hazardZones.zones) do
				if z.radius then
					print(("     - Zone [%d]: Circle/Ball (Base Radius: %.2f + Pad: %.2f = %.2f studs)"):format(
						idx, z.radius, pad, z.radius + pad
					))
				elseif z.half then
					print(("     - Zone [%d]: Box/OBB (HalfSize: %s)"):format(
						idx, formatVector3(z.half)
					))
				end
			end
		end

		-- Bắt đầu theo dõi phân tích chuyển động xoay (Spinning Analysis)
		task.spawn(function()
			local targetPart = nil
			if instance:IsA("BasePart") then
				targetPart = instance
			elseif instance:IsA("Model") then
				targetPart = instance.PrimaryPart or instance:FindFirstChildWhichIsA("BasePart")
			end
			if not targetPart then return end

			local t0 = os.clock()
			local cf0 = targetPart.CFrame
			task.wait(0.12)

			if not instance.Parent or not targetPart.Parent then return end

			local t1 = os.clock()
			local cf1 = targetPart.CFrame
			local dt = t1 - t0
			if dt <= 0 then return end

			-- Delta trong hệ tọa độ Thế giới (World Space)
			local worldDelta = cf1 * cf0:Inverse()
			local worldAxis, worldAngle = worldDelta:ToAxisAngle()
			local worldDegPerSec = math.deg(worldAngle) / dt

			-- Delta trong hệ tọa độ Cục bộ (Local Space)
			local localDelta = cf0:Inverse() * cf1
			local localAxis, localAngle = localDelta:ToAxisAngle()

			if math.abs(math.deg(worldAngle)) >= 1.5 then
				local worldAxisDesc = "Trục tự do / Hỗn hợp"
				if math.abs(worldAxis.Y) >= 0.8 then
					worldAxisDesc = "Trục Y (Yaw - Quét ngang mặt sàn)"
				elseif math.abs(worldAxis.X) >= 0.8 then
					worldAxisDesc = "Trục X (Pitch - Lăn nhào lộn)"
				elseif math.abs(worldAxis.Z) >= 0.8 then
					worldAxisDesc = "Trục Z (Roll - Nghiêng lật bên)"
				end

				local localAxisDesc = "Trục tự do"
				if math.abs(localAxis.Y) >= 0.8 then
					localAxisDesc = "Trục Local Y"
				elseif math.abs(localAxis.X) >= 0.8 then
					localAxisDesc = "Trục Local X"
				elseif math.abs(localAxis.Z) >= 0.8 then
					localAxisDesc = "Trục Local Z"
				end

				print("================== 🔄 [INSPECT: SPINNING DETECTED] 🔄 ==================")
				print(("  🎯 Target Name    : %s (%s)"):format(instance.Name, targetPart.Name))
				print(("  ⚡ Tốc độ xoay    : %.2f °/s (%.2f rad/s)"):format(worldDegPerSec, worldAngle / dt))
				print(("  🌐 World Spin Axis: %s -> %s"):format(formatVector3(worldAxis), worldAxisDesc))
				print(("  🧩 Local Spin Axis: %s -> %s"):format(formatVector3(localAxis), localAxisDesc))
				print("========================================================================")
			end
		end)
	elseif eventType == "DESPAWN" then
		if infoData and infoData.SpawnClock then
			local elapsed = os.clock() - infoData.SpawnClock
			print(("  ⏱️ Lifetime Active: %.2f seconds"):format(elapsed))
		end
	elseif eventType == "REJECTED" then
		print(("  ⚠️ Rejection Reason: %s"):format(tostring(extraReason)))
	end
	print("================================================================")
end

function deepInspect.LogSpawn(instance, info)
	printBlock(instance, "SPAWN", "Passed all gates", info)
end

function deepInspect.LogDespawn(instance, reason, info)
	printBlock(instance, "DESPAWN", reason, info)
end

function deepInspect.LogReject(instance, reason)
	printBlock(instance, "REJECTED", reason, nil)
end

return deepInspect