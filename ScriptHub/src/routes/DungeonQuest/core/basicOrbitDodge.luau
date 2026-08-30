-- Basic Orbit Dodge cho DungeonQuest.
-- Kiểu dodge đơn giản dành cho chiêu boss tốc độ BÌNH THƯỜNG: KHÔNG tắt orbit,
-- player cứ chạy orbit như bình thường. Có vùng detect quanh player
-- (DETECT_RADIUS); khi phát hiện hazard ở PHÍA TRƯỚC hướng đi -> đảo chiều orbit.
-- Nếu sau khi đảo vẫn phát hiện hazard phía trước hướng mới (kẹt 2 phía) ->
-- tele SKIP một góc (SKIP_ANGLE) để thoát.
-- Tận dụng cơ chế orbit có sẵn (shared.basicOrbitDirection đè hướng hiệu dụng).

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")

--// References
local player = services.player
local RunService = services.RunService

--// Configuration
--// Danh sách chiêu/hazard thuộc kiểu "tốc độ bình thường" (tự add).
local BASIC_DODGE_NAMES = {
	["firstBossCrissCross"] = true,
	["secondBossMovingBeam"] = true,
}

--// Bán kính vùng detect quanh player (stud)
local DETECT_RADIUS = 15
--// Góc mở "phía trước hướng đi" (độ, 2 chiều) để coi hazard là phía trước
local FRONT_ANGLE = 120
--// Góc skip khi kẹt 2 phía (độ)
local SKIP_ANGLE = 90
--// Cooldown chống lật hướng liên tục (giây)
local FLIP_COOLDOWN = 0.15
--// Cooldown giữa các lần tele skip (giây)
local SKIP_COOLDOWN = 0.3

--// Table
local basicDodge = {}

--// State
local enabled = false
local connection = nil
local lastFlipTime = 0
local lastSkipTime = 0

local function getObjectPosition(obj)
	if not obj then return nil end
	if obj:IsA("BasePart") then
		local ok, pos = pcall(function() return obj.Position end)
		if ok then return pos end
		return nil
	end
	local ok, primary = pcall(function() return obj.PrimaryPart end)
	if ok and primary and primary:IsA("BasePart") then return primary.Position end
	for _, c in ipairs(obj:GetChildren()) do
		if c:IsA("BasePart") then return c.Position end
	end
	return nil
end

--// Quét object thuộc BASIC_DODGE_NAMES (child-level Workspace) trả danh sách vị trí
local function scanHazards()
	local Workspace = game:GetService("Workspace")
	local out = {}
	for _, c in ipairs(Workspace:GetChildren()) do
		if BASIC_DODGE_NAMES[c.Name] then
			local pos = getObjectPosition(c)
			if pos then table.insert(out, pos) end
		end
	end
	return out
end

local function horizontalDist(a, b)
	local dx = b.X - a.X
	local dz = b.Z - a.Z
	return math.sqrt(dx * dx + dz * dz)
end

--// Có hazard nào nằm trong DETECT_RADIUS và phía trước (theo tangent hướng dir) ?
local function hasHazardAhead(playerPos, bossPos, effDir, hazards)
	local radius = shared.GetOrbitRadius()
	if not radius or radius <= 0 then return false end
	local radial = playerPos - bossPos
	local ang = math.atan2(radial.Z, radial.X)
	--// tiếp tuyến tại điểm player: đạo hàm (cosθ,sinθ) = (-sinθ, cosθ), nhân effDir
	local tx = -math.sin(ang) * effDir
	local tz = math.cos(ang) * effDir
	local tangent = Vector3.new(tx, 0, tz)
	local cosHalf = math.cos(math.rad(FRONT_ANGLE / 2))
	for _, h in ipairs(hazards) do
		if horizontalDist(playerPos, h) <= DETECT_RADIUS then
			local toH = h - playerPos
			toH = Vector3.new(toH.X, 0, toH.Z)
			local mag = toH.Magnitude
			if mag > 0.001 and tangent:Dot(toH.Unit) >= cosHalf then
				return true
			end
		end
	end
	return false
end

--// Tele player tới góc theta (rad) trên orbit quanh center (bỏ qua SKIP_ANGLE)
local function teleportToAngle(center, theta)
	local character = player.Character
	local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
	if not character or not playerRoot or not playerRoot.Parent then return end
	if not character.PrimaryPart then character.PrimaryPart = playerRoot end

	local radius = shared.GetOrbitRadius() or 0
	local height = shared.GetOrbitHeight() or 0
	local targetPos = center + Vector3.new(math.cos(theta) * radius, height, math.sin(theta) * radius)

	local humanoid = character:FindFirstChild("Humanoid")
	local oldAutoRotate = humanoid and humanoid.AutoRotate
	if humanoid then humanoid.AutoRotate = false end
	character:PivotTo(CFrame.lookAt(targetPos, center))
	playerRoot.AssemblyLinearVelocity, playerRoot.AssemblyAngularVelocity = Vector3.zero, Vector3.zero
	if humanoid then humanoid.AutoRotate = oldAutoRotate end

	--// đồng bộ farmAngle để moveFarmTarget tiếp tục đúng
	shared.SetOrbitAngle(theta)
end

local function basicStep()
	local character = player.Character
	local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
	if not character or not playerRoot or not playerRoot.Parent then return end
	if shared.GetFarmMode() ~= "Orbit" then return end

	local center = shared.GetOrbitCenter()
	if not center then return end

	local playerPos = playerRoot.Position
	local now = os.clock()

	--// hướng hiệu dụng (khởi tạo nếu chưa)
	local effDir = shared.GetBasicOrbitDirection()
	if not effDir then
		effDir = shared.GetFarmOrbitDirection() or 1
		shared.SetBasicOrbitDirection(effDir)
	end

	local hazards = scanHazards()
	if #hazards == 0 then
		--// hết nguy hiểm -> trả hướng về bình thường của farm
		shared.SetBasicOrbitDirection(nil)
		return
	end

	if hasHazardAhead(playerPos, center, effDir, hazards) then
		if now - lastFlipTime > FLIP_COOLDOWN then
			local newDir = -effDir
			shared.SetBasicOrbitDirection(newDir)
			lastFlipTime = now
			--// kẹt 2 phía: sau khi đảo vẫn có hazard phía trước hướng mới -> skip
			if hasHazardAhead(playerPos, center, newDir, hazards) and now - lastSkipTime > SKIP_COOLDOWN then
				lastSkipTime = now
				local radial = playerPos - center
				local theta = math.atan2(radial.Z, radial.X)
				local skipRad = math.rad(SKIP_ANGLE) * newDir
				teleportToAngle(center, theta + skipRad)
			end
		elseif now - lastSkipTime > SKIP_COOLDOWN then
			--// trong cooldown flip mà vẫn còn hazard trước -> thử skip
			if hasHazardAhead(playerPos, center, effDir, hazards) then
				lastSkipTime = now
				local radial = playerPos - center
				local theta = math.atan2(radial.Z, radial.X)
				local skipRad = math.rad(SKIP_ANGLE) * effDir
				teleportToAngle(center, theta + skipRad)
			end
		end
	end
end

function basicDodge.Toggle(state)
	enabled = state == true
	if enabled then
		if not connection then
			connection = RunService.Heartbeat:Connect(function()
				basicStep()
			end)
		end
	else
		if connection then
			connection:Disconnect()
			connection = nil
		end
		shared.SetBasicOrbitDirection(nil)
	end
end

function basicDodge.IsEnabled()
	return enabled
end

function basicDodge.GetDetectRadius()
	return DETECT_RADIUS
end

function basicDodge.SetDetectRadius(value)
	DETECT_RADIUS = value
end

function basicDodge.GetFrontAngle()
	return FRONT_ANGLE
end

function basicDodge.SetFrontAngle(value)
	FRONT_ANGLE = value
end

function basicDodge.GetSkipAngle()
	return SKIP_ANGLE
end

function basicDodge.SetSkipAngle(value)
	SKIP_ANGLE = value
end

function basicDodge.AddBasicDodgeName(name)
	if name and type(name) == "string" then BASIC_DODGE_NAMES[name] = true end
end

function basicDodge.GetBasicDodgeNames()
	local out = {}
	for k in pairs(BASIC_DODGE_NAMES) do table.insert(out, k) end
	table.sort(out)
	return out
end

return basicDodge
