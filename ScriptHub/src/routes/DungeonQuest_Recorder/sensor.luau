--// Sensor: Thu thập và phân tích dữ liệu Môi trường (Hazards, Boss, Mobs) siêu nhẹ (Read-Only)
--// Tuyệt đối không can thiệp hay điều khiển bất kỳ object nào trong game.

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local sensor = {}

--// State
local activeHazards = {} -- [BasePart] = HazardData
local bossData = nil
local trackedMobs = {}
local isRunning = false
local connections = {}
local motionHistory = {} -- [BasePart] = { lastPos, lastYaw, lastTime }

--// Player Ignore Templates Cache
local ignoreTemplates = {}

local KNOWN_PLAYER_ABILITIES = {
	["groundaura"] = true, ["genericneonball"] = true, ["genericattachpart"] = true,
	["berserk"] = true, ["demonspikeone"] = true, ["demonspiketwo"] = true,
	["demonspikethree"] = true, ["groundslam"] = true, ["guardianblessingball"] = true,
	["holybarrier"] = true, ["holycircle"] = true, ["innervate"] = true,
	["lightningstrike"] = true, ["overcharge"] = true, ["pulsefire"] = true,
	["pulsewaveswave"] = true, ["redemption"] = true, ["starfallstar"] = true,
	["starbarrage"] = true, ["taunt"] = true, ["tsunami"] = true,
	["voidspherespawn"] = true, ["vortex"] = true, ["whirlwind"] = true,
	["chainedenergyblasts"] = true, ["orbofdestruction"] = true,
	["explosivepunchcone"] = true, ["explosivepunchring"] = true,
	["arrowrain"] = true, ["arrowrainarrow"] = true, ["phantomflames"] = true,
	["infernalblastcylinder"] = true, ["chainlightning"] = true,
	["mightyleapslamcircle"] = true, ["arrowbarrage"] = true,
	["moltenball"] = true, ["smallmoltenball"] = true, ["electricgrinder"] = true,
	["demoniccurse"] = true, ["twinslash"] = true, ["aquaticsmitecast"] = true,
	["icecrash"] = true, ["fungalpoison"] = true, ["agonyorbsmainorb"] = true,
	["lightningburst"] = true, ["piercingroots"] = true, ["crystalinecannonblast"] = true,
	["concussiveblasttrail"] = true, ["windblast"] = true, ["revitalize"] = true,
	["flamestrike"] = true, ["frostcone"] = true, ["souldrain"] = true,
	["geyser"] = true, ["flameshuriken"] = true, ["galebarrage"] = true,
	["solarbeam"] = true, ["godspearmodel"] = true, ["bladebarragesword"] = true,
	["amethystbeamorb"] = true, ["jaderoller"] = true, ["jaderaincircle"] = true,
	["carrotbarrage"] = true, ["eggbomb"] = true, ["phaseball"] = true,
	["phasering"] = true, ["moltenshard"] = true, ["lavabeam"] = true,
}

local function sanitize(str)
	if typeof(str) ~= "string" then return "" end
	return str:lower():gsub("%s+", ""):gsub("%d+", ""):gsub("%(clone%)", ""):gsub("_", ""):gsub("%-", "")
end

local function addIgnore(name)
	local s = sanitize(name)
	if #s > 0 then ignoreTemplates[s] = true end
end

-- Đọc templates từ ReplicatedStorage
local function initIgnoreTemplates()
	for k in pairs(KNOWN_PLAYER_ABILITIES) do
		ignoreTemplates[k] = true
	end
	pcall(function()
		for _, fName in ipairs({ "abilities", "projectiles" }) do
			local f = ReplicatedStorage:FindFirstChild(fName)
			if f then
				for _, item in ipairs(f:GetDescendants()) do
					addIgnore(item.Name)
				end
			end
		end
	end)
end

initIgnoreTemplates()

-- Kiểm tra xem 1 part/model có phải thuộc Player hoặc đòn đánh của Player không
local function isPlayerRelated(inst)
	if not inst then return true end
	local lp = Players.LocalPlayer
	if lp and lp.Character and (inst == lp.Character or inst:IsDescendantOf(lp.Character)) then
		return true
	end
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Character and (inst == p.Character or inst:IsDescendantOf(p.Character)) then
			return true
		end
	end
	local sName = sanitize(inst.Name)
	if ignoreTemplates[sName] then return true end
	if inst.Parent and ignoreTemplates[sanitize(inst.Parent.Name)] then return true end
	return false
end

-- Helper: Lấy góc Yaw theo độ
local function getYaw(cf)
	if not cf then return 0 end
	local lv = cf.LookVector
	if not lv or lv.Magnitude < 0.001 then return 0 end
	return math.deg(math.atan2(lv.X, -lv.Z))
end

-- Phân loại hình học Hazard an toàn
local function analyzeHazardPart(part, level1Parent)
	if not part or not part:IsA("BasePart") then return nil end
	
	local size = part.Size
	local pos = part.Position
	local cf = part.CFrame
	local yaw = getYaw(cf)
	local shape = "Box"
	local radius = 0
	local length = size.Z
	local width = size.X

	local rootName = level1Parent and level1Parent.Name or (part.Parent and part.Parent.Name) or part.Name
	local lowerName = rootName:lower()

	local isMeshCylinder = false
	if part:IsA("MeshPart") then
		local meshIdStr = tostring(part.MeshId):lower()
		if string.find(meshIdStr, "cylinder", 1, true) then
			isMeshCylinder = true
		end
	end

	local isPartCylinder = false
	if part:IsA("Part") then
		pcall(function()
			if part.Shape == Enum.PartType.Cylinder or part.Shape == Enum.PartType.Ball then
				isPartCylinder = true
			end
		end)
	end

	if isMeshCylinder or string.find(lowerName, "circle", 1, true) or string.find(lowerName, "ring", 1, true) or string.find(lowerName, "disc", 1, true) then
		shape = "Circle"
		radius = math.max(size.X, size.Z) / 2
	elseif isPartCylinder then
		shape = "Circle"
		radius = math.max(size.Y, size.Z) / 2
	elseif math.abs(size.X - size.Z) < 1.0 and (size.X > 6 or size.Z > 6) and (string.find(lowerName, "circle", 1, true) or string.find(lowerName, "slam", 1, true) or string.find(lowerName, "zone", 1, true)) then
		shape = "Circle"
		radius = math.max(size.X, size.Z) / 2
	else
		shape = "Box"
		length = size.Z
		width = size.X
		radius = math.max(size.X, size.Z) / 2
	end

	-- Tính vận tốc tuyến tính và vận tốc góc
	local now = os.clock()
	local vx, vz, vYaw = 0, 0, 0
	local hist = motionHistory[part]
	if hist then
		local dt = math.max(0.001, now - hist.lastTime)
		vx = (pos.X - hist.lastPos.X) / dt
		vz = (pos.Z - hist.lastPos.Z) / dt
		local dyaw = (yaw - hist.lastYaw)
		if dyaw > 180 then dyaw = dyaw - 360 elseif dyaw < -180 then dyaw = dyaw + 360 end
		vYaw = dyaw / dt
	end
	motionHistory[part] = { lastPos = pos, lastYaw = yaw, lastTime = now }

	return {
		part = part,
		name = rootName,
		partName = part.Name,
		shape = shape,
		x = math.round(pos.X * 10) / 10,
		y = math.round(pos.Y * 10) / 10,
		z = math.round(pos.Z * 10) / 10,
		radius = math.round(radius * 10) / 10,
		width = math.round(width * 10) / 10,
		length = math.round(length * 10) / 10,
		yaw = math.round(yaw * 10) / 10,
		vx = math.round(vx * 10) / 10,
		vz = math.round(vz * 10) / 10,
		vYaw = math.round(vYaw * 10) / 10,
		spawnTime = now,
	}
end

-- Kiểm tra xem 1 Level 1 child có phải là Hazard hợp lệ không
local function registerCandidate(child)
	if not child or not child.Parent or child.Parent ~= Workspace then return end
	if child:IsA("Folder") then return end
	if child:IsA("Terrain") or child:IsA("Camera") then return end
	if isPlayerRelated(child) then return end

	local rootName = child.Name:lower()
	local isIceSpike = string.find(rootName, "icespike", 1, true) ~= nil

	local function processPart(p)
		if not p or not p:IsA("BasePart") then return end
		if isPlayerRelated(p) then return end
		if p.Material == Enum.Material.Neon or isIceSpike then
			pcall(function()
				local data = analyzeHazardPart(p, child)
				if data then
					activeHazards[p] = data
				end
			end)
		end
	end

	if child:IsA("BasePart") then
		processPart(child)
	end
	for _, desc in ipairs(child:GetDescendants()) do
		processPart(desc)
	end

	child.DescendantAdded:Connect(function(desc)
		processPart(desc)
	end)
end

-- Cập nhật Boss & Mobs
local function scanEntities()
	local dungeon = Workspace:FindFirstChild("dungeon")
	local mobsList = {}
	local currentBoss = nil

	if dungeon then
		for _, child in ipairs(dungeon:GetChildren()) do
			if child:IsA("Model") and child:FindFirstChildOfClass("Humanoid") then
				local hum = child:FindFirstChildOfClass("Humanoid")
				local root = child:FindFirstChild("HumanoidRootPart") or child.PrimaryPart
				if hum and hum.Health > 0 and root then
					local mName = child.Name
					local isBoss = string.find(mName:lower(), "boss", 1, true) ~= nil
					local mobEntry = {
						name = mName,
						x = math.round(root.Position.X * 10) / 10,
						y = math.round(root.Position.Y * 10) / 10,
						z = math.round(root.Position.Z * 10) / 10,
						yaw = math.round(getYaw(root.CFrame) * 10) / 10,
						hp = math.round(hum.Health),
						maxHp = math.round(hum.MaxHealth),
						isBoss = isBoss,
					}
					table.insert(mobsList, mobEntry)
					if isBoss then
						currentBoss = mobEntry
					end
				end
			end
		end
	end

	bossData = currentBoss
	trackedMobs = mobsList
end

function sensor.Start()
	if isRunning then return end
	isRunning = true
	table.clear(activeHazards)
	table.clear(motionHistory)

	pcall(function()
		for _, child in ipairs(Workspace:GetChildren()) do
			registerCandidate(child)
		end
	end)

	table.insert(connections, Workspace.ChildAdded:Connect(function(child)
		registerCandidate(child)
	end))

	table.insert(connections, Workspace.ChildRemoved:Connect(function(child)
		for p, data in pairs(activeHazards) do
			if p == child or p:IsDescendantOf(child) or not p.Parent then
				activeHazards[p] = nil
				motionHistory[p] = nil
			end
		end
	end))
end

function sensor.Stop()
	isRunning = false
	for _, conn in ipairs(connections) do
		pcall(function() conn:Disconnect() end)
	end
	table.clear(connections)
	table.clear(activeHazards)
	table.clear(motionHistory)
end

function sensor.GetActiveHazards()
	local list = {}
	local now = os.clock()
	for part, data in pairs(activeHazards) do
		if part and part.Parent then
			pcall(function()
				local pos = part.Position
				local cf = part.CFrame
				local yaw = getYaw(cf)
				data.x = math.round(pos.X * 10) / 10
				data.y = math.round(pos.Y * 10) / 10
				data.z = math.round(pos.Z * 10) / 10
				data.yaw = math.round(yaw * 10) / 10
				data.age = math.round((now - data.spawnTime) * 100) / 100
				table.insert(list, data)
			end)
		else
			activeHazards[part] = nil
			motionHistory[part] = nil
		end
	end
	return list
end

function sensor.GetBossData()
	return bossData
end

function sensor.GetMobsData()
	return trackedMobs
end

function sensor.UpdateEntities()
	pcall(scanEntities)
end

return sensor
