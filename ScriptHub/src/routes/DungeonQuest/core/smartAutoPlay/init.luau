-- Smart Auto Play Core (DungeonQuest)
-- Step 1: Visual Combat Radius R circle around player formed by small spheres.

local services = require("@routes/DungeonQuest/core/services")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local RunService = services.RunService
local player = services.player

local smartAutoPlay = {}

--// Settings & State
local showRadiusCircle = false
local radius = 15.0 -- Combat Radius R in studs
local SPHERE_COUNT = 36 -- 36 spheres = 1 sphere every 10 degrees
local sphereSize = 0.35 -- Diameter of each sphere in studs
local SPHERE_COLOR = Color3.fromRGB(0, 225, 255) -- Vibrant Neon Cyan

local sphereParts = {}
local visualFolder = nil
local updateConnection = nil

--// Floor Raycast Parameters
local floorRayParams = RaycastParams.new()
floorRayParams.FilterType = Enum.RaycastFilterType.Exclude
floorRayParams.IgnoreWater = true

local function updateRayFilter()
	local ignore = {}
	if player and player.Character then
		table.insert(ignore, player.Character)
	end
	local rayIgnore = workspace:FindFirstChild("RaycastIgnore")
	if rayIgnore then
		table.insert(ignore, rayIgnore)
	end
	floorRayParams.FilterDescendantsInstances = ignore
end

local function getOrCreateVisualFolder()
	if visualFolder and visualFolder.Parent then
		return visualFolder
	end

	local container = workspace.CurrentCamera or workspace
	local folder = container:FindFirstChild("SmartAutoPlay_RadiusVisual")
	if not folder then
		folder = Instance.new("Folder")
		folder.Name = "SmartAutoPlay_RadiusVisual"
		folder.Parent = container
	end
	visualFolder = folder
	return folder
end

local function getOrCreateSpheres()
	local folder = getOrCreateVisualFolder()

	while #sphereParts < SPHERE_COUNT do
		local idx = #sphereParts + 1
		local p = Instance.new("Part")
		p.Name = ("RadiusSphere_%02d"):format(idx)
		p.Shape = Enum.PartType.Ball
		p.Size = Vector3.new(sphereSize, sphereSize, sphereSize)
		p.Material = Enum.Material.Neon
		p.Color = SPHERE_COLOR
		p.Transparency = 0.2
		p.Anchored = true
		p.CanCollide = false
		p.CanTouch = false
		p.CanQuery = false
		p.CastShadow = false
		p.Parent = folder
		table.insert(sphereParts, p)
	end

	return sphereParts
end

local function hideSpheres()
	for _, p in ipairs(sphereParts) do
		p.Transparency = 1
	end
end

local function updateCirclePositions()
	if not showRadiusCircle then
		hideSpheres()
		return
	end

	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not root or not root.Parent then
		hideSpheres()
		return
	end

	updateRayFilter()
	local spheres = getOrCreateSpheres()
	local pPos = root.Position
	local angleStep = (2 * math.pi) / SPHERE_COUNT

	-- Single locked Y level beneath player for all spheres
	local floorHit = workspace:Raycast(pPos, Vector3.new(0, -12.0, 0), floorRayParams)
	local lockedY = floorHit and (floorHit.Position.Y + (sphereSize / 2)) or (pPos.Y - 2.8)

	for i = 1, SPHERE_COUNT do
		local angle = (i - 1) * angleStep
		local targetX = pPos.X + math.cos(angle) * radius
		local targetZ = pPos.Z + math.sin(angle) * radius

		local part = spheres[i]
		if part and part.Parent then
			part.Position = Vector3.new(targetX, lockedY, targetZ)
			part.Transparency = 0.2
			part.Color = SPHERE_COLOR
		end
	end
end

local function startLoop()
	if updateConnection then return end
	updateConnection = RunService.RenderStepped:Connect(function()
		pcall(updateCirclePositions)
	end)
end

local function stopLoop()
	if updateConnection then
		updateConnection:Disconnect()
		updateConnection = nil
	end
	hideSpheres()
end

--// Public API

function smartAutoPlay.SetShowRadiusCircle(state)
	showRadiusCircle = state and true or false
	if showRadiusCircle then
		startLoop()
	else
		stopLoop()
	end
end

function smartAutoPlay.IsShowRadiusCircleEnabled()
	return showRadiusCircle
end

function smartAutoPlay.SetRadius(val)
	if type(val) == "number" and val > 0 then
		radius = math.clamp(val, 2.0, 100.0)
	end
end

function smartAutoPlay.GetRadius()
	return radius
end

function smartAutoPlay.SetSphereSize(val)
	if type(val) == "number" and val > 0 then
		sphereSize = math.clamp(val, 0.1, 3.0)
		for _, p in ipairs(sphereParts) do
			p.Size = Vector3.new(sphereSize, sphereSize, sphereSize)
		end
	end
end

function smartAutoPlay.GetSphereSize()
	return sphereSize
end

--// Lifecycle Cleanup
lifecycle.Register(function()
	stopLoop()
	for _, p in ipairs(sphereParts) do
		pcall(function() p:Destroy() end)
	end
	table.clear(sphereParts)
	if visualFolder then
		pcall(function() visualFolder:Destroy() end)
		visualFolder = nil
	end
end)

return smartAutoPlay
