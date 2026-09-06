-- Map Optimizer (DungeonQuest): Clean Map
-- 1. Làm tàng hình (Transparency = 1) đối với tất cả các Part trong workspace.Map.
-- 2. Bắn Raycast theo trục X và Z xung quanh người chơi: nếu gặp vật cản/tường xung quanh thì lập tức set CanCollide = false và CanTouch = false (ngoại trừ "Solid spikes").

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")

--// Table
local mapOptimizer = {}

--// State
local enabled = false
local loopThread = nil
local raycastThread = nil
local connections = {}
local modifiedParts = {} -- [part] = originalTransparency
local modifiedCollisions = {} -- [part] = { CanCollide, CanTouch }

local CLEANUP_INTERVAL = 2
local RAY_INTERVAL = 0.05
local RAY_COUNT = 16
local RAY_DISTANCE = 30

--// Kiểm tra xem instance có phải là Model/Part thuộc danh sách ngoại lệ (stairRamps, Steps, Meshes/Cylinder) hay không
local function isStairRamp(inst)
	if not inst then return false end
	local current = inst
	while current and current ~= workspace do
		local nameLower = current.Name:lower()
		if nameLower:find("stairramp") or nameLower:find("step") or nameLower:find("meshes/cylinder") or nameLower:find("cylinder") then
			return true
		end
		current = current.Parent
	end
	return false
end

--// Xử lý part thuộc model borders (Tắt va chạm & trigger)
local function processBorderPart(part)
	if not enabled or not part or not part:IsA("BasePart") then return end
	if isStairRamp(part) then return end

	if not modifiedCollisions[part] then
		modifiedCollisions[part] = {
			CanCollide = part.CanCollide,
			CanTouch = part.CanTouch,
		}
	end

	pcall(function()
		part.CanCollide = false
		part.CanTouch = false
	end)
end

--// Xử lý một BasePart (Tàng hình)
local function processPart(part)
	if not enabled or not part or not part:IsA("BasePart") then return end
	if isStairRamp(part) then return end

	-- Lưu lại Transparency ban đầu nếu chưa lưu
	if modifiedParts[part] == nil then
		modifiedParts[part] = part.Transparency
	end

	pcall(function()
		part.Transparency = 1
	end)
end

--// Xử lý một child/descendant bất kỳ
local function processInstance(inst)
	if not enabled or not inst then return end
	if isStairRamp(inst) then return end

	-- 1. Nếu là Model / Folder tên chứa "border"
	if (inst:IsA("Model") or inst:IsA("Folder")) and inst.Name:lower():find("border") then
		for _, desc in ipairs(inst:GetDescendants()) do
			if desc:IsA("BasePart") and not isStairRamp(desc) then
				processPart(desc)
				processBorderPart(desc)
			end
		end
		return
	end

	-- 2. Nếu là BasePart
	if inst:IsA("BasePart") then
		processPart(inst)
	end

	-- 3. Duyệt các descendant bên dưới
	for _, desc in ipairs(inst:GetDescendants()) do
		if desc:IsA("BasePart") then
			processPart(desc)
		elseif (desc:IsA("Model") or desc:IsA("Folder")) and desc.Name:lower():find("border") then
			for _, p in ipairs(desc:GetDescendants()) do
				if p:IsA("BasePart") and not isStairRamp(p) then
					processPart(p)
					processBorderPart(p)
				end
			end
		end
	end
end

--// Quét và xử lý toàn bộ trong workspace.Map
local function cleanMapFolder()
	if not enabled then return end

	local mapFolder = workspace:FindFirstChild("Map")
	if not mapFolder then return end

	for _, child in ipairs(mapFolder:GetChildren()) do
		processInstance(child)
	end
end

--// Kiểm tra xem part có phải là Solid spikes nằm trong một Model hay không
local function isSpikeInModel(part)
	if not part then return false end
	local nameLower = part.Name:lower()
	if nameLower:find("solid spikes") then
		local parent = part.Parent
		if parent and parent:IsA("Model") and parent ~= workspace then
			return true
		end
	end
	return false
end

--// Bắn Raycast theo trục X và Z xung quanh người chơi
local function runSurroundingRaycasts()
	local player = services.player
	local character = player and player.Character
	local hrp = character and character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	local raycastParams = RaycastParams.new()
	raycastParams.FilterType = Enum.RaycastFilterType.Exclude
	raycastParams.FilterDescendantsInstances = { character, workspace.Terrain }
	raycastParams.IgnoreWater = true

	-- Bắn ở 2 cao độ: ngang chân (+0.5) và ngang ngực (+2.0)
	local heightOffsets = { 0.5, 2.0 }
	local originPos = hrp.Position

	for _, yOffset in ipairs(heightOffsets) do
		local rayOrigin = Vector3.new(originPos.X, originPos.Y + yOffset, originPos.Z)

		for i = 1, RAY_COUNT do
			local angle = (i / RAY_COUNT) * (math.pi * 2)
			local direction = Vector3.new(math.cos(angle), 0, math.sin(angle)) * RAY_DISTANCE

			local result = workspace:Raycast(rayOrigin, direction, raycastParams)
			if result and result.Instance and result.Instance:IsA("BasePart") then
				local hitPart = result.Instance

				-- Bỏ qua nếu là stairRamps hoặc Solid spikes trong Model
				if not isStairRamp(hitPart) and not isSpikeInModel(hitPart) then
					if not modifiedCollisions[hitPart] then
						modifiedCollisions[hitPart] = {
							CanCollide = hitPart.CanCollide,
							CanTouch = hitPart.CanTouch,
						}
					end

					pcall(function()
						hitPart.CanCollide = false
						hitPart.CanTouch = false
					end)
				end
			end
		end
	end
end

--// Lắng nghe sự kiện thêm mới trong Map
local function attachListeners()
	for _, c in ipairs(connections) do
		pcall(function() c:Disconnect() end)
	end
	table.clear(connections)

	local function hookMap(mapFolder)
		if not mapFolder then return end

		-- Lắng nghe part/model mới được thêm vào Map
		table.insert(connections, mapFolder.DescendantAdded:Connect(function(desc)
			if not enabled then return end
			if desc:IsA("BasePart") and not isStairRamp(desc) then
				processPart(desc)

				-- Kiểm tra xem có nằm trong Model borders không
				local parent = desc.Parent
				while parent and parent ~= mapFolder and parent ~= workspace do
					if (parent:IsA("Model") or parent:IsA("Folder")) and parent.Name:lower():find("border") then
						processBorderPart(desc)
						break
					end
					parent = parent.Parent
				end
			end
		end))
	end

	local map = workspace:FindFirstChild("Map")
	if map then
		hookMap(map)
	end

	-- Lắng nghe khi Folder Map được tạo/tải lại khi chuyển màn
	table.insert(connections, workspace.ChildAdded:Connect(function(child)
		if not enabled then return end
		if child.Name == "Map" then
			hookMap(child)
			task.delay(0.2, cleanMapFolder)
		end
	end))
end

--// Phục hồi lại trạng thái ban đầu khi tắt
local function restoreMap()
	-- 1. Phục hồi Transparency
	for part, originalTransparency in pairs(modifiedParts) do
		if part and part.Parent then
			pcall(function()
				part.Transparency = originalTransparency
			end)
		end
	end
	table.clear(modifiedParts)

	-- 2. Phục hồi Collision & Touch
	for part, originalState in pairs(modifiedCollisions) do
		if part and part.Parent then
			pcall(function()
				part.CanCollide = originalState.CanCollide
				part.CanTouch = originalState.CanTouch
			end)
		end
	end
	table.clear(modifiedCollisions)
end

function mapOptimizer.Toggle(state)
	if state == enabled then return end
	enabled = state and true or false

	if enabled then
		cleanMapFolder()
		attachListeners()

		if loopThread then task.cancel(loopThread); loopThread = nil end
		loopThread = task.spawn(function()
			while enabled do
				task.wait(CLEANUP_INTERVAL)
				pcall(cleanMapFolder)
			end
		end)

		if raycastThread then task.cancel(raycastThread); raycastThread = nil end
		raycastThread = task.spawn(function()
			while enabled do
				task.wait(RAY_INTERVAL)
				pcall(runSurroundingRaycasts)
			end
		end)
	else
		for _, c in ipairs(connections) do
			pcall(function() c:Disconnect() end)
		end
		table.clear(connections)

		if loopThread then task.cancel(loopThread); loopThread = nil end
		if raycastThread then task.cancel(raycastThread); raycastThread = nil end
		restoreMap()
	end
end

function mapOptimizer.IsEnabled()
	return enabled
end

lifecycle.Register(function()
	mapOptimizer.Toggle(false)
end)

return mapOptimizer