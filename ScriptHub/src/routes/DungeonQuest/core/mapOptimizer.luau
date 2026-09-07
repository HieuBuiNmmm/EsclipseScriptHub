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
local connections = {}
local modifiedCollisions = {} -- [part] = { CanCollide, CanTouch }
local modifiedSnowParts = {} -- [part] = originalTransparency

local CLEANUP_INTERVAL = 2

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

--// Xử lý một child/descendant bất kỳ (chỉ xử lý borders, không đổi transparency)
local function processInstance(inst)
	if not enabled or not inst then return end
	if isStairRamp(inst) then return end

	-- Nếu là Model / Folder tên chứa "border"
	if (inst:IsA("Model") or inst:IsA("Folder")) and inst.Name:lower():find("border") then
		for _, desc in ipairs(inst:GetDescendants()) do
			if desc:IsA("BasePart") and not isStairRamp(desc) then
				processBorderPart(desc)
			end
		end
		return
	end

	-- Duyệt các descendant bên dưới tìm borders
	for _, desc in ipairs(inst:GetDescendants()) do
		if (desc:IsA("Model") or desc:IsA("Folder")) and desc.Name:lower():find("border") then
			for _, p in ipairs(desc:GetDescendants()) do
				if p:IsA("BasePart") and not isStairRamp(p) then
					processBorderPart(p)
				end
			end
		end
	end
end

--// Danh sách tên object cấp 1 cần giữ lại trong workspace.Map
local KEEP_LV1_NAMES = {
	["meshes/ice3"] = true,
	["meshes/snow"] = true,
	["invisible platform"] = true,
	["part"] = true,
}

local function shouldKeepChildLv1(child)
	if not child then return true end
	if child:IsA("Model") or child:IsA("Folder") then
		return true
	end
	local nameLower = child.Name:lower()
	if KEEP_LV1_NAMES[nameLower] or child.Name == "Meshes/Ice3" or child.Name == "Meshes/Snow" or child.Name == "Invisible platform" or child.Name == "Part" then
		return true
	end
	return false
end

--// Xóa toàn bộ child của các Model tên "borders" (hoặc chứa "border")
local function cleanBorderModels()
	if not enabled then return end

	local mapFolder = workspace:FindFirstChild("Map")
	if not mapFolder then return end

	for _, desc in ipairs(mapFolder:GetDescendants()) do
		if (desc:IsA("Model") or desc:IsA("Folder")) and desc.Name:lower():find("border") then
			for _, child in ipairs(desc:GetChildren()) do
				pcall(function()
					child:Destroy()
				end)
			end
		end
	end
end

--// Xóa các Model có chứa child/descendant có tên "Wooden plank"
local function cleanWoodenPlankModels()
	if not enabled then return end

	local mapFolder = workspace:FindFirstChild("Map")
	if not mapFolder then return end

	for _, desc in ipairs(mapFolder:GetDescendants()) do
		if desc.Name:lower():find("wooden plank") then
			local parent = desc.Parent
			while parent and parent ~= mapFolder and parent ~= workspace do
				if parent:IsA("Model") then
					pcall(function()
						parent:Destroy()
					end)
					break
				end
				parent = parent.Parent
			end
		end
	end
end

--// Quét các child cấp 1 trong Map và Destroy hết mọi thứ không thuộc danh sách giữ lại
local function cleanMapChildrenLv1()
	if not enabled then return end

	local mapFolder = workspace:FindFirstChild("Map")
	if not mapFolder then return end

	for _, child in ipairs(mapFolder:GetChildren()) do
		if not shouldKeepChildLv1(child) then
			pcall(function()
				child:Destroy()
			end)
		end
	end
end

--// Danh sách tọa độ Model cần xóa
local DELETE_MODEL_POSITIONS = {
	Vector3.new(-724.4873046875, 33.9286003112793, 174.7227325439453),
	Vector3.new(-697.8023681640625, 26.397010803222656, 380.60272216796875),
	Vector3.new(-649.3167724609375, 31.39712905883789, 397.80535888671875),
	Vector3.new(-581.634033203125, 3.4567506313323975, 318.2510070800781),
	Vector3.new(-491.9974365234375, 41.522090911865234, 384.67694091796875),
	Vector3.new(-484.0378723144531, 35.76678466796875, 418.82659912109375),
	Vector3.new(-470.1619567871094, 32.919700622558594, 461.6861267089844),
	Vector3.new(-468.8152770996094, 39.06712341308594, 514.388916015625),
	Vector3.new(-600.4266357421875, 13.99144172668457, 570.6660766601562),
	Vector3.new(-338.2521667480469, 42.990394592285156, 439.36456298828125),
	Vector3.new(-355.2449951171875, 57.510982513427734, 385.5475769042969),
	Vector3.new(-606.5220336914062, 37.41774368286133, 372.6407470703125),
}

local EXACT_TOLERANCE = 0.2 -- Sai số so khớp Position chính xác (studs)

local function matchesDeletePosition(pos)
	if not pos then return false end
	for _, targetPos in ipairs(DELETE_MODEL_POSITIONS) do
		if (pos - targetPos).Magnitude <= EXACT_TOLERANCE then
			return true
		end
	end
	return false
end

local function shouldDeleteModelByPosition(model)
	if not model or not model:IsA("Model") or not model.Parent then return false end

	-- 1. So khớp trực tiếp Pivot Position của Model
	local ok1, pivot = pcall(function() return model:GetPivot().Position end)
	if ok1 and pivot and matchesDeletePosition(pivot) then
		return true
	end

	-- 2. So khớp trực tiếp PrimaryPart Position của Model
	if model.PrimaryPart and matchesDeletePosition(model.PrimaryPart.Position) then
		return true
	end

	-- 3. So khớp trực tiếp Position của từng BasePart bên trong Model
	for _, desc in ipairs(model:GetDescendants()) do
		if desc:IsA("BasePart") and matchesDeletePosition(desc.Position) then
			return true
		end
	end

	return false
end

--// Xóa các Model/Part có Position khớp chính xác với danh sách DELETE_MODEL_POSITIONS trong workspace.Map
local function cleanModelsByPosition()
	if not enabled then return end

	local mapFolder = workspace:FindFirstChild("Map") or workspace:FindFirstChild("dungeon") or workspace:FindFirstChild("Dungeon")
	if not mapFolder then return end

	for _, desc in ipairs(mapFolder:GetDescendants()) do
		if not desc.Parent then continue end

		if desc:IsA("Model") then
			if shouldDeleteModelByPosition(desc) then
				pcall(function()
					desc:Destroy()
				end)
			end
		elseif desc:IsA("BasePart") then
			if matchesDeletePosition(desc.Position) then
				local parentModel = desc:FindFirstAncestorOfClass("Model")
				if parentModel and parentModel ~= workspace and parentModel ~= mapFolder then
					pcall(function()
						parentModel:Destroy()
					end)
				else
					pcall(function()
						desc:Destroy()
					end)
				end
			end
		end
	end
end

--// Làm tàng hình riêng các part Meshes/Snow
local function processSnowPart(part)
	if not enabled or not part or not part:IsA("BasePart") then return end
	if part.Name == "Meshes/Snow" or part.Name:lower():find("meshes/snow") or part.Name:lower() == "snow" then
		if modifiedSnowParts[part] == nil then
			modifiedSnowParts[part] = part.Transparency
		end
		pcall(function()
			part.Transparency = 1
		end)
	end
end

local function cleanSnowParts()
	if not enabled then return end

	local mapFolder = workspace:FindFirstChild("Map")
	if not mapFolder then return end

	for _, desc in ipairs(mapFolder:GetDescendants()) do
		if desc:IsA("BasePart") and (desc.Name == "Meshes/Snow" or desc.Name:lower():find("meshes/snow") or desc.Name:lower() == "snow") then
			processSnowPart(desc)
		end
	end
end

--// Quét và xử lý toàn bộ trong workspace.Map
local function cleanMapFolder()
	if not enabled then return end

	-- 1. Xóa các child cấp 1 không hợp lệ
	cleanMapChildrenLv1()

	-- 2. Xóa các child của model borders
	cleanBorderModels()

	-- 3. Xóa các Model có chứa child tên Wooden plank
	cleanWoodenPlankModels()

	-- 4. Xóa các Model theo tọa độ chỉ định
	cleanModelsByPosition()

	-- 5. Làm tàng hình riêng Meshes/Snow
	cleanSnowParts()
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



--// Lắng nghe sự kiện thêm mới trong Map
local function attachListeners()
	for _, c in ipairs(connections) do
		pcall(function() c:Disconnect() end)
	end
	table.clear(connections)

	local function hookMap(mapFolder)
		if not mapFolder then return end

		-- Lắng nghe child cấp 1 mới được thêm vào Map để dọn dẹp ngay nếu không thuộc whitelist
		table.insert(connections, mapFolder.ChildAdded:Connect(function(child)
			if not enabled then return end
			if not shouldKeepChildLv1(child) then
				pcall(function()
					child:Destroy()
				end)
			end
		end))

		-- Lắng nghe part/model mới được thêm vào Map
		table.insert(connections, mapFolder.DescendantAdded:Connect(function(desc)
			if not enabled then return end

			-- 1. Nếu là Wooden plank -> xóa toàn bộ Model cha chứa nó
			if desc.Name:lower():find("wooden plank") then
				local parent = desc.Parent
				while parent and parent ~= mapFolder and parent ~= workspace do
					if parent:IsA("Model") then
						pcall(function()
							parent:Destroy()
						end)
						return
					end
					parent = parent.Parent
				end
			end

			-- 2. Nếu nằm trong Model borders -> xóa ngay
			local borderParent = desc.Parent
			while borderParent and borderParent ~= mapFolder and borderParent ~= workspace do
				if (borderParent:IsA("Model") or borderParent:IsA("Folder")) and borderParent.Name:lower():find("border") then
					pcall(function()
						desc:Destroy()
					end)
					break
				end
				borderParent = borderParent.Parent
			end

			-- 3. Nếu là Model hoặc BasePart khớp tọa độ chỉ định -> xóa ngay
			if desc:IsA("Model") and shouldDeleteModelByPosition(desc) then
				pcall(function()
					desc:Destroy()
				end)
				return
			elseif desc:IsA("BasePart") and matchesDeletePosition(desc.Position) then
				local parentModel = desc:FindFirstAncestorOfClass("Model")
				if parentModel and parentModel ~= workspace and parentModel ~= mapFolder then
					pcall(function()
						parentModel:Destroy()
					end)
				else
					pcall(function()
						desc:Destroy()
					end)
				end
				return
			end

			-- 4. Nếu là Meshes/Snow -> làm tàng hình
			if desc:IsA("BasePart") and (desc.Name == "Meshes/Snow" or desc.Name:lower():find("meshes/snow") or desc.Name:lower() == "snow") then
				processSnowPart(desc)
			end
		end))
	end

	local map = workspace:FindFirstChild("Map") or workspace:FindFirstChild("dungeon") or workspace:FindFirstChild("Dungeon")
	if map then
		hookMap(map)
	end

	-- Lắng nghe khi Folder Map được tạo/tải lại khi chuyển màn
	table.insert(connections, workspace.ChildAdded:Connect(function(child)
		if not enabled then return end
		local nameLower = child.Name:lower()
		if nameLower == "map" or nameLower == "dungeon" then
			hookMap(child)
			task.delay(0.2, cleanMapFolder)
		end
	end))
end

--// Phục hồi lại trạng thái ban đầu khi tắt
local function restoreMap()
	-- 1. Phục hồi Transparency cho riêng các part Meshes/Snow
	for part, originalTransparency in pairs(modifiedSnowParts) do
		if part and part.Parent then
			pcall(function()
				part.Transparency = originalTransparency
			end)
		end
	end
	table.clear(modifiedSnowParts)

	-- 2. Phục hồi Collision & Touch cho các borders/walls đã tắt va chạm
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
	else
		for _, c in ipairs(connections) do
			pcall(function() c:Disconnect() end)
		end
		table.clear(connections)

		if loopThread then task.cancel(loopThread); loopThread = nil end
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