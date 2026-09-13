-- Smart Dodge V2: Filter Engine
-- Bộ lọc tốc độ cao: Loại trừ 100% chiêu thức người chơi, đồng đội, vũ khí, hiệu ứng Aura, và vật thể môi trường.

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local filter = {}

--// Bảng các tên vật thể Workspace cấp 1 cần bỏ qua
local IGNORED_WORKSPACE_NAMES = {
	["dungeon"] = true,
	["Dungeon"] = true,
	["Terrain"] = true,
	["Camera"] = true,
	["CurrentCamera"] = true,
	["RaycastIgnore"] = true,
	["Drops"] = true,
	["Loot"] = true,
	["DodgeNode_ESP"] = true,
	["secondBossCrystals"] = true,
	["secondbosscrystals"] = true,
	["thirdBossBeamPart"] = true,
	["thirdbossbeampart"] = true,
}

--// Bảng tên các Part bổ trợ / cấu trúc không gây sát thương
local HELPER_PART_NAMES = {
	["primarypart"] = true,
	["center"] = true,
	["root"] = true,
	["main"] = true,
	["handle"] = true,
	["humanoidrootpart"] = true,
	["head"] = true,
	["torso"] = true,
	["uppertorso"] = true,
	["lowertorso"] = true,
}

--// Bảng tên kỹ năng của người chơi (Player Abilities / Tools)
local ignoredSkillNames: { [string]: boolean } = {
	["DodgeNode_ESP"] = true,
	["Enhanced Aura Ring"] = true,
	["EnhancedAuraRing"] = true,
	["Enhanced Aura"] = true,
	["EnhancedAura"] = true,
	["Aura Ring"] = true,
	["AuraRing"] = true,
	["AuraRingMesh"] = true,
	["groundAura"] = true,
	["GroundAura"] = true,
	["Ground Aura"] = true,
	["ground aura"] = true,
}

local connections: { RBXScriptConnection } = {}

--// Đăng ký tên kỹ năng cần bỏ qua
function filter.RegisterIgnoredSkill(skillName: string)
	if type(skillName) ~= "string" or #skillName == 0 then return end
	local cleanName = skillName:gsub("^%s+", ""):gsub("%s+$", "")
	if not ignoredSkillNames[cleanName] then
		ignoredSkillNames[cleanName] = true
		local lowerClean = cleanName:lower():gsub("%s+", "")
		ignoredSkillNames[lowerClean] = true
	end
end

--// Kiểm tra xem đối tượng có phải là vật thể debug, marker, hoặc visual nội bộ của script/hub không
local function isInternalDebugOrVisual(inst: Instance): boolean
	if not inst then return true end
	local name = inst.Name
	local lower = name:lower()

	-- 1. Chứa từ khóa debug
	if lower:find("debug", 1, true) then return true end

	-- 2. Tiền tố TM_ hoặc AutoFarm debug helper
	if name:sub(1, 3) == "TM_" or lower:find("tm_", 1, true) then return true end

	-- 3. Các đối tượng của SmartDodge, AutoPlay, SmartAutoPlay
	if lower:find("smartdodge", 1, true) or lower:find("dodgenode", 1, true) then return true end
	if lower:find("smartautoplay", 1, true) or lower:find("autoplay", 1, true) then return true end

	-- 4. Các visual spheres và markers của Hub
	if lower:find("radiussphere", 1, true) or lower:find("skillsphere", 1, true) then return true end
	if lower:find("safemarker", 1, true) or lower:find("repositionmarker", 1, true) then return true end
	if lower:find("beaconpillar", 1, true) or lower:find("hitboxcircle", 1, true) then return true end
	if lower:find("areavisual", 1, true) or lower:find("crystalguidebox", 1, true) then return true end
	if lower:find("movingtrajectory", 1, true) or lower:find("telegraphcorridor", 1, true) then return true end

	-- 5. SelectionBox, BillboardGui, Highlight, Adornments
	if inst:IsA("SelectionBox") or inst:IsA("BillboardGui") or inst:IsA("Highlight") or inst:IsA("HandleAdornment") then
		return true
	end

	-- 6. Kiểm tra Parent nếu là con của các folder/model debug nội bộ
	if inst.Parent and inst.Parent ~= Workspace then
		local pName = inst.Parent.Name
		local pLower = pName:lower()
		if pLower:find("debug", 1, true) or pName:sub(1, 3) == "TM_" then return true end
		if pLower:find("smartdodge", 1, true) or pLower:find("smartautoplay", 1, true) then return true end
		if pLower:find("safemarker", 1, true) or pLower:find("repositionmarker", 1, true) then return true end
		if pLower:find("radiusvisual", 1, true) then return true end
	end

	return false
end

--// Kiểm tra xem một Instance cấp cao (Model / Folder / Part) có bị bỏ qua không
function filter.IsIgnoredInstance(inst: Instance): boolean
	if not inst then return true end

	-- 1. Bỏ qua TUYỆT ĐỐI tất cả các Folder (Folder chỉ là container hệ thống/map, không phải skill)
	if inst:IsA("Folder") or inst:IsA("Configuration") then
		return true
	end

	-- 2. Bỏ qua TUYỆT ĐỐI các đối tượng Debug / Visual nội bộ của Hub
	if isInternalDebugOrVisual(inst) then
		return true
	end

	-- 3. Bỏ qua danh sách cố định
	if IGNORED_WORKSPACE_NAMES[inst.Name] then
		return true
	end

	-- 4. Bỏ qua nếu là Character của bất kỳ Player nào trong server
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Character == inst then
			return true
		end
	end

	-- 5. Bỏ qua theo tên kỹ năng Player đã học được
	local nameLower = inst.Name:lower():gsub("%s+", "")
	if ignoredSkillNames[inst.Name] or ignoredSkillNames[nameLower] then
		return true
	end

	-- 6. Bỏ qua các hiệu ứng Aura thông dụng
	if nameLower:find("enhancedaura", 1, true) or nameLower:find("auraring", 1, true) or nameLower:find("groundaura", 1, true) then
		return true
	end

	return false
end

--// Kiểm tra xem một BasePart cụ thể có bị bỏ qua không
function filter.IsIgnoredPart(part: BasePart): boolean
	if not part or not part:IsA("BasePart") then return true end

	-- 1. Bỏ qua Part thuộc về Character của Player
	if part:FindFirstAncestorOfClass("Model") and Players:GetPlayerFromCharacter(part:FindFirstAncestorOfClass("Model")) then
		return true
	end

	-- 2. Bỏ qua TUYỆT ĐỐI các đối tượng Debug / Visual nội bộ của Hub
	if isInternalDebugOrVisual(part) then
		return true
	end

	-- 3. Bỏ qua các Part xương cốt / helper
	local nameLower = part.Name:lower():gsub("%s+", "")
	if HELPER_PART_NAMES[nameLower] then return true end

	-- 4. Bỏ qua theo tên kỹ năng Player
	if ignoredSkillNames[part.Name] or ignoredSkillNames[nameLower] then
		return true
	end

	-- 5. Bỏ qua Aura
	if nameLower:find("enhancedaura", 1, true) or nameLower:find("auraring", 1, true) or nameLower:find("groundaura", 1, true) then
		return true
	end

	return false
end

--// Khởi tạo watcher tự động lắng nghe Backpack & ReplicatedStorage để nạp kỹ năng player
function filter.Init()
	filter.Cleanup()

	local function scanPlayer(p: Player)
		if not p then return end

		local function scanContainer(container: Instance)
			if not container then return end
			for _, child in ipairs(container:GetChildren()) do
				filter.RegisterIgnoredSkill(child.Name)
			end
		end

		local function watchBackpack(bp: Instance?)
			if not bp then return end
			scanContainer(bp)
			table.insert(connections, bp.ChildAdded:Connect(function(child)
				filter.RegisterIgnoredSkill(child.Name)
			end))
		end

		local function watchCharacter(char: Model?)
			if not char then return end
			scanContainer(char)
			table.insert(connections, char.ChildAdded:Connect(function(child)
				if child:IsA("Tool") then
					filter.RegisterIgnoredSkill(child.Name)
				end
			end))
		end

		local bp = p:FindFirstChild("Backpack")
		if bp then
			watchBackpack(bp)
		end
		table.insert(connections, p.ChildAdded:Connect(function(child)
			if child.Name == "Backpack" or child:IsA("Backpack") then
				watchBackpack(child)
			end
		end))

		if p.Character then
			watchCharacter(p.Character)
		end
		table.insert(connections, p.CharacterAdded:Connect(watchCharacter))
	end

	for _, p in ipairs(Players:GetPlayers()) do
		scanPlayer(p)
	end
	table.insert(connections, Players.PlayerAdded:Connect(scanPlayer))

	-- Tự động quét ReplicatedStorage.abilities (nếu có)
	local function scanFolder(folder: Instance?)
		if not folder then return end
		for _, child in ipairs(folder:GetChildren()) do
			filter.RegisterIgnoredSkill(child.Name)
			local nameVal = child:FindFirstChild("name") or child:FindFirstChild("Name")
			if nameVal and nameVal:IsA("ValueBase") and tostring(nameVal.Value) ~= "" then
				filter.RegisterIgnoredSkill(tostring(nameVal.Value))
			end
		end
		table.insert(connections, folder.ChildAdded:Connect(function(child)
			filter.RegisterIgnoredSkill(child.Name)
		end))
	end

	local abilitiesFolder = ReplicatedStorage:FindFirstChild("abilities")
	if abilitiesFolder then
		scanFolder(abilitiesFolder)
	end

	local projFolder = ReplicatedStorage:FindFirstChild("projectiles")
	if projFolder then
		scanFolder(projFolder)
	end
end

function filter.Cleanup()
	for _, conn in ipairs(connections) do
		pcall(function() conn:Disconnect() end)
	end
	table.clear(connections)
end

return filter
