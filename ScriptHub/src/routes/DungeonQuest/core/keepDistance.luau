-- Keep Distance (Push) – module STANDALONE, có thể xóa bất kỳ lúc nào.
-- Chuyên trách: giữ khoảng cách với kẻ địch GẦN NHẤT bằng cơ chế "đẩy" (CFrame).
-- Khi enemy gần nhất lọt vào vùng < MinDistance, nhân vật bị đẩy lùi mượt theo hướng
-- radial mỗi frame (CFrame + delta frame, như push cũ trong autoFarm HOLD Mode 2) cho tới
-- khi ra khỏi vùng. Cancel MoveTo đang chạy để CFrame không bị pathfinding/humanoid kéo
-- ngược lại, đồng thời xoá vận tốc (AssemblyLinearVelocity) tránh bị trôi sau khi dừng.
-- NGUYÊN TẮC HOẠT ĐỘNG ĐỘC LẬP:
--  * Không cần bật Auto Farm — chỉ cần tracking enemy của shared (đang chạy nền sẵn).
--  * Nhường tuyệt đối cho Smart Dodge đang né (không đẩy khi isDodging).
--  * Không đẩy khi nhân vật chết.
-- XÓA SẠCH = xóa 3 thứ này (không vướng 1 chỗ nào khác):
--  1) core/keepDistance.luau
--  2) tabs/Combat/keepDistance.luau
--  3) dòng require trong tabs/Combat/main.luau

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")

--// References
local player = services.player
local RunService = services.RunService

--// Table
local keepDistance = {}

--// State
local enabled = false
local minDistance = 4 --// stud: enemy lọt vào vùng nhỏ hơn mức này thì bị đẩy lùi. 0 = tắt.
local pushSpeed = 50 --// tốc độ đẩy lùi tối đa (stud/giây). Có chặn không đẩy quá MinDistance.
local MIN_PUSH_DIST = 0.01 --// ngưỡng tránh chia cho 0 khi enemy trùng vị trí player

--// Lazy require Smart Dodge (tránh vòng require + module bị xóa 1 phía vẫn không crash).
local isDodgingFn = nil
local function isDodging()
	if isDodgingFn == nil then
		local ok, smartDodge = pcall(function()
			return require("@routes/DungeonQuest/core/smartDodge")
		end)
		isDodgingFn = ok and smartDodge and smartDodge.IsDodging or function() return false end
	end
	return isDodgingFn()
end

local function getPlayerRoot()
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if root and root.Parent then return root end
	return nil
end

--// Đọc vị trí part an toàn (đề phòng enemy chết/rm giữa chừng).
local function getSafePosition(part)
	if not part or not part.Parent then return nil end
	local ok, pos = pcall(function()
		return part.Position
	end)
	if not ok or not pos then return nil end
	return pos
end

--// Vị trí + khoảng cách NGANG (XZ) tới kẻ địch gần nhất. Trả (nil, math.huge) khi không có enemy.
local function getNearestEnemyInfo(playerPos)
	local nearestPos = nil
	local nearestDist = math.huge
	for _, data in ipairs(shared.GetTrackedEnemyData()) do
		if data and data.Root and data.Root.Parent then
			local pos = getSafePosition(data.Root)
			if pos then
				local dx = pos.X - playerPos.X
				local dz = pos.Z - playerPos.Z
				local d = math.sqrt(dx * dx + dz * dz)
				if d < nearestDist then
					nearestDist = d
					nearestPos = pos
				end
			end
		end
	end
	return nearestPos, nearestDist
end

--// AutoRotate tạm tắt khi ĐANG ĐẨY (click-to-move tự quay theo hướng đi sẽ chống đối CFrame),
--// khôi phục đúng giá trị cũ khi hết đẩy. Chỉ capture 1 lần mỗi phiên đẩy.
local autoRotateHumanoid = nil
local oldAutoRotate = nil
local function setAutoRotate(humanoid, off)
	if off then
		if humanoid == autoRotateHumanoid then return end
		if autoRotateHumanoid then
			pcall(function() autoRotateHumanoid.AutoRotate = oldAutoRotate end)
		end
		oldAutoRotate = humanoid.AutoRotate
		humanoid.AutoRotate = false
		autoRotateHumanoid = humanoid
	else
		local h = autoRotateHumanoid
		if not h then return end
		pcall(function() h.AutoRotate = oldAutoRotate end)
		autoRotateHumanoid = nil
		oldAutoRotate = nil
	end
end

--// Một frame đẩy: trả true nếu frame đó thực hiện đẩy (để biết phiên đẩy đang diễn ra).
local function step(deltaTime)
	if not enabled then return false end

	local rootPart = getPlayerRoot()
	if not rootPart then return false end
	local char = rootPart:FindFirstAncestorOfClass("Model")
	local humanoid = char and char:FindFirstChildOfClass("Humanoid")
	if not humanoid or not humanoid.Parent or humanoid.Health <= 0 then return false end
	if isDodging() then return false end

	local playerPos = rootPart.Position
	local enemyPos, dist = getNearestEnemyInfo(playerPos)
	if not enemyPos or minDistance <= 0 or dist >= minDistance then return false end

	--// Enemy lọt vào vùng min -> đẩy lùi mượt theo radial (CFrame, có delta frame).
	setAutoRotate(humanoid, true)
	local dx = playerPos.X - enemyPos.X
	local dz = playerPos.Z - enemyPos.Z
	local push = math.min(pushSpeed * math.max(deltaTime, 1 / 60), minDistance - dist)
	local pushedPos = playerPos
	if dist > MIN_PUSH_DIST then
		pushedPos = Vector3.new(
			playerPos.X + (dx / dist) * push,
			playerPos.Y,
			playerPos.Z + (dz / dist) * push
		)
	end
	--// Cancel MoveTo cũ để CFrame push không bị MoveTo khác kéo qua chỗ khác.
	pcall(function() humanoid:MoveTo(playerPos) end)
	rootPart.CFrame = CFrame.lookAt(pushedPos, enemyPos)
	rootPart.AssemblyLinearVelocity = Vector3.zero
	rootPart.AssemblyAngularVelocity = Vector3.zero
	return true
end

--// Heartbeat loop: chạy khi module load, chỉ làm việc khi enabled. Dừng theo lifecycle.
task.spawn(function()
	local lastTimestamp = os.clock()
	while lifecycle.IsActive() do
		local dt = RunService.Heartbeat:Wait()
		if type(dt) ~= "number" then
			local now = os.clock()
			dt = now - lastTimestamp
			lastTimestamp = now
		end
		if not step(dt) then
			--// Không còn đẩy (tắt / hết vùng / né / chết) -> trả AutoRotate về cũ nếu đang tạm tắt.
			setAutoRotate(nil, false)
		end
	end
	setAutoRotate(nil, false)
end)

--// Accessors

function keepDistance.SetEnabled(state)
	enabled = state and true or false
end

function keepDistance.Toggle()
	enabled = not enabled
	return enabled
end

function keepDistance.IsEnabled()
	return enabled
end

function keepDistance.SetMinDistance(value)
	minDistance = math.max(tonumber(value) or minDistance, 0)
end

function keepDistance.GetMinDistance()
	return minDistance
end

function keepDistance.SetPushSpeed(value)
	pushSpeed = math.max(tonumber(value) or pushSpeed, 0)
end

function keepDistance.GetPushSpeed()
	return pushSpeed
end

--// Table
return keepDistance