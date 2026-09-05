-- Smart Dodge (DungeonQuest): Phát hiện vùng nguy hiểm (Threat Detection) dựa trên
-- thuộc tính Material == Enum.Material.Neon của các skill, projectile, và telegraphs.
-- Giai đoạn 1: Quét, nhận diện hiểm họa ở Workspace (Depth 1) và giám sát trạng thái Fade/Destroy thời gian thực.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local notifier = require("@routes/DungeonQuest/core/notifier")

--// References
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local player = services.player

--// Table
local smartDodge = {}

--// State
local threatDetectorEnabled = false
local logHazards = false
local logInDanger = true
local visualEspEnabled = true
local activeHazards = {} -- [Instance] = { Name, Class, Position, Distance, NeonCount, Connections, ActiveParts, Highlight }
local hazardCount = 0
local hazardChangedCallbacks = {}
local lastHazardInfo = nil
local connections = {}
local ignoredSkillNames = {
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

--// Danh sách các skill ngoại lệ (không dùng Material Neon, ví dụ có child precast bằng Plastic)
local CUSTOM_HAZARD_EXCEPTIONS = {
	["largeIceSpikes"] = true,
	["mediumIceSpikes"] = true,
	["smallIceSpikes"] = true,
	["thirdBossMultiRings"] = true,
}

--// Ngưỡng coi như chiêu đã mờ hoàn toàn/kết thúc
local FADE_TRANSPARENCY_THRESHOLD = 0.95

--// Danh sách các đối tượng Workspace cấp 1 cần bỏ qua
local IGNORED_NAMES = {
	["dungeon"] = true,
	["Dungeon"] = true,
	["Terrain"] = true,
	["Camera"] = true,
	["CurrentCamera"] = true,
	["RaycastIgnore"] = true,
	["Drops"] = true,
	["Loot"] = true,
	["DodgeNode_ESP"] = true,
	["SmartDodge_SafeMarker"] = true,
	["SmartDodge_SelectionBox"] = true,
	["Enhanced Aura Ring"] = true,
	["EnhancedAuraRing"] = true,
	["Enhanced Aura"] = true,
	["EnhancedAura"] = true,
	["Aura Ring"] = true,
	["AuraRing"] = true,
	["groundAura"] = true,
	["GroundAura"] = true,
	["Ground Aura"] = true,
	["ground aura"] = true,
}

--// Thêm một Skill vào danh sách ngoại lệ
function smartDodge.AddCustomHazard(skillName)
	if type(skillName) == "string" and #skillName > 0 then
		CUSTOM_HAZARD_EXCEPTIONS[skillName] = true
	end
end

--// Đăng ký tên kỹ năng của Player để loại trừ
function smartDodge.RegisterPlayerSkill(skillName)
	if type(skillName) == "string" and #skillName > 0 then
		local cleanName = skillName:gsub("^%s+", ""):gsub("%s+$", "")
		if not ignoredSkillNames[cleanName] then
			ignoredSkillNames[cleanName] = true
			local normalized = cleanName:lower():gsub("%s+", "")
			ignoredSkillNames[normalized] = true
			if logHazards then
				print(("[SmartDodge] 🛡️ Registered Player Skill (Ignored): %s"):format(cleanName))
			end
		end
	end
end

--// Tự động quét và lắng nghe kỹ năng trong Backpack / Character của Player và đồng đội
local function initPlayerSkillWatcher()
	local function scanPlayer(p)
		if not p then return end

		local function scanContainer(container)
			if not container then return end
			for _, child in ipairs(container:GetChildren()) do
				smartDodge.RegisterPlayerSkill(child.Name)
			end
		end

		local function watchBackpack(bp)
			if not bp then return end
			scanContainer(bp)
			bp.ChildAdded:Connect(function(child)
				smartDodge.RegisterPlayerSkill(child.Name)
			end)
		end

		local function watchCharacter(char)
			if not char then return end
			scanContainer(char)
			char.ChildAdded:Connect(function(child)
				if child:IsA("Tool") then
					smartDodge.RegisterPlayerSkill(child.Name)
				end
			end)
		end

		if p:FindFirstChild("Backpack") then
			watchBackpack(p.Backpack)
		end
		p.ChildAdded:Connect(function(child)
			if child.Name == "Backpack" or child:IsA("Backpack") then
				watchBackpack(child)
			end
		end)

		if p.Character then
			watchCharacter(p.Character)
		end
		p.CharacterAdded:Connect(watchCharacter)
	end

	for _, p in ipairs(Players:GetPlayers()) do
		scanPlayer(p)
	end
	Players.PlayerAdded:Connect(scanPlayer)

	-- Quét định kỳ mỗi 1 giây trong trường hợp đồ trong Backpack được game nạp trễ
	task.spawn(function()
		while threatDetectorEnabled or #Players:GetPlayers() > 0 do
			for _, p in ipairs(Players:GetPlayers()) do
				if p:FindFirstChild("Backpack") then
					for _, item in ipairs(p.Backpack:GetChildren()) do
						smartDodge.RegisterPlayerSkill(item.Name)
					end
				end
				if p.Character then
					for _, item in ipairs(p.Character:GetChildren()) do
						if item:IsA("Tool") then
							smartDodge.RegisterPlayerSkill(item.Name)
						end
					end
				end
			end
			task.wait(1)
		end
	end)
end

initPlayerSkillWatcher()

--// Kiểm tra xem đối tượng có phải là của Player (hoặc skill của Player) không
local function isPlayerAsset(instance)
	if not instance then return true end

	-- 1. Kiểm tra trực thuộc Character của bất kỳ người chơi nào
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Character and (instance == p.Character or instance:IsDescendantOf(p.Character)) then
			return true
		end
	end

	-- 2. Kiểm tra trực tiếp trong Backpack & Character của mọi người chơi tại thời điểm t = 0
	local instNameClean = instance.Name:gsub("^%s+", ""):gsub("%s+$", "")
	local instNameLower = instNameClean:lower():gsub("%s+", "")

	for _, p in ipairs(Players:GetPlayers()) do
		local bp = p:FindFirstChild("Backpack")
		if bp then
			if bp:FindFirstChild(instance.Name) or bp:FindFirstChild(instNameClean) then
				smartDodge.RegisterPlayerSkill(instance.Name)
				return true
			end
			for _, item in ipairs(bp:GetChildren()) do
				local itemLower = item.Name:lower():gsub("%s+", "")
				if item.Name == instance.Name or itemLower == instNameLower or instNameLower:find(itemLower, 1, true) or itemLower:find(instNameLower, 1, true) then
					smartDodge.RegisterPlayerSkill(item.Name)
					return true
				end
			end
		end

		if p.Character then
			if p.Character:FindFirstChild(instance.Name) or p.Character:FindFirstChild(instNameClean) then
				smartDodge.RegisterPlayerSkill(instance.Name)
				return true
			end
			for _, item in ipairs(p.Character:GetChildren()) do
				if item:IsA("Tool") then
					local itemLower = item.Name:lower():gsub("%s+", "")
					if item.Name == instance.Name or itemLower == instNameLower or instNameLower:find(itemLower, 1, true) or itemLower:find(instNameLower, 1, true) then
						smartDodge.RegisterPlayerSkill(item.Name)
						return true
					end
				end
			end
		end
	end

	-- 3. Kiểm tra các Tag/Attribute/ObjectValue sở hữu (creator, owner, player, caster)
	local creatorVal = instance:FindFirstChild("creator") or instance:FindFirstChild("Creator")
		or instance:FindFirstChild("owner") or instance:FindFirstChild("Owner")
		or instance:FindFirstChild("player") or instance:FindFirstChild("Player")
		or instance:FindFirstChild("caster") or instance:FindFirstChild("Caster")
	if creatorVal then
		if creatorVal:IsA("ObjectValue") and creatorVal.Value and creatorVal.Value:IsA("Player") then
			return true
		elseif creatorVal:IsA("StringValue") and Players:FindFirstChild(creatorVal.Value) then
			return true
		end
	end

	local ownerAttr = instance:GetAttribute("Owner") or instance:GetAttribute("Player")
		or instance:GetAttribute("creator") or instance:GetAttribute("Creator")
	if ownerAttr then
		if type(ownerAttr) == "string" and Players:FindFirstChild(ownerAttr) then
			return true
		end
	end

	-- 4. Kiểm tra tên Instance có chứa tên hoặc UserId của Player không
	for _, p in ipairs(Players:GetPlayers()) do
		local pNameLower = p.Name:lower()
		if instNameLower:find(pNameLower, 1, true) or instance.Name:find(tostring(p.UserId), 1, true) then
			return true
		end
	end

	-- 5. So khớp mềm (Fuzzy Match) với danh sách tên kỹ năng đã đăng ký
	if ignoredSkillNames[instance.Name] or ignoredSkillNames[instNameClean] or ignoredSkillNames[instNameLower] then
		return true
	end

	for skillName in pairs(ignoredSkillNames) do
		local sLower = skillName:lower():gsub("%s+", "")
		if #sLower >= 3 and (instNameLower:find(sLower, 1, true) or sLower:find(instNameLower, 1, true)) then
			return true
		end
	end

	return false
end

--// Kiểm tra xem một Part/MeshPart cụ thể có thuộc danh sách bỏ qua hay không
local function isIgnoredPart(part)
	if not part then return true end
	if part == safeSpotMarkerPart or part.Name:find("SmartDodge") then return true end
	local nameClean = part.Name:gsub("^%s+", ""):gsub("%s+$", "")
	local nameLower = nameClean:lower():gsub("%s+", "")
	if ignoredSkillNames[part.Name] or ignoredSkillNames[nameClean] or ignoredSkillNames[nameLower] or IGNORED_NAMES[part.Name] then
		return true
	end
	if nameLower:find("enhancedaura", 1, true) or nameLower:find("auraring", 1, true) or nameLower:find("groundaura", 1, true) then
		return true
	end
	return false
end

--// Tìm các Part nguy hiểm bên trong instance (Depth 1 BasePart hoặc Model)
local function extractHazardParts(instance)
	local parts = {}
	if not instance or instance.Name:find("SmartDodge") or instance == safeSpotMarkerPart or isIgnoredPart(instance) then
		return parts, false
	end
	local isException = CUSTOM_HAZARD_EXCEPTIONS[instance.Name]

	if isException then
		-- Ngoại lệ đặc biệt: tìm các part 'precast' hoặc BaseParts có trong model
		if instance:IsA("BasePart") then
			if not isIgnoredPart(instance) and instance.Transparency < FADE_TRANSPARENCY_THRESHOLD then
				table.insert(parts, instance)
			end
		elseif instance:IsA("Model") then
			local precasts = {}
			for _, desc in ipairs(instance:GetDescendants()) do
				if desc:IsA("BasePart") and not isIgnoredPart(desc) and desc.Name:lower():find("precast") and desc.Transparency < FADE_TRANSPARENCY_THRESHOLD then
					table.insert(precasts, desc)
				end
			end
			if #precasts > 0 then
				parts = precasts
			else
				for _, desc in ipairs(instance:GetDescendants()) do
					if desc:IsA("BasePart") and not isIgnoredPart(desc) and desc.Transparency < FADE_TRANSPARENCY_THRESHOLD then
						table.insert(parts, desc)
					end
				end
			end
		end
	else
		-- Tiêu chuẩn chung: Material == Neon
		if instance:IsA("BasePart") then
			if not isIgnoredPart(instance) and instance.Material == Enum.Material.Neon and instance.Transparency < FADE_TRANSPARENCY_THRESHOLD then
				table.insert(parts, instance)
			end
		elseif instance:IsA("Model") then
			for _, desc in ipairs(instance:GetDescendants()) do
				if desc:IsA("BasePart") and not isIgnoredPart(desc) and desc.Material == Enum.Material.Neon and desc.Transparency < FADE_TRANSPARENCY_THRESHOLD then
					table.insert(parts, desc)
				end
			end
		end
	end

	return parts, isException
end

--// Lấy vị trí trung tâm của instance
local function getInstancePosition(instance, hazardParts)
	if instance:IsA("BasePart") then
		return instance.Position
	elseif instance:IsA("Model") then
		if instance.PrimaryPart then
			return instance.PrimaryPart.Position
		end
		local pivot = instance:GetPivot()
		if pivot and pivot.Position ~= Vector3.zero then
			return pivot.Position
		end
	end

	if hazardParts and #hazardParts > 0 then
		return hazardParts[1].Position
	end

	return Vector3.zero
end

local function fireHazardChanged()
	for _, cb in ipairs(hazardChangedCallbacks) do
		pcall(cb, hazardCount, lastHazardInfo)
	end
end

--// Forward declaration
local unregisterHazard

--// Tạo và gắn SelectionBox đỏ 3D lên từng Part của chiêu thức
local function attachSelectionBoxes(hazardParts)
	local boxes = {}
	for _, part in ipairs(hazardParts) do
		if part and part:IsA("BasePart") and part.Parent then
			local box = Instance.new("SelectionBox")
			box.Name = "SmartDodge_SelectionBox"
			box.Color3 = Color3.fromRGB(255, 45, 45)
			box.SurfaceColor3 = Color3.fromRGB(255, 30, 30)
			box.SurfaceTransparency = 0.6
			box.LineThickness = 0.05
			box.Adornee = part
			box.Parent = part
			table.insert(boxes, box)
		end
	end
	return boxes
end

--// Đăng ký một Instance (Depth 1) là hiểm họa và gắn listeners theo dõi độ mờ
local function registerHazard(instance)
	if not threatDetectorEnabled or not instance or activeHazards[instance] then return end
	if instance:IsA("Folder") then return end
	if instance.Name:find("SmartDodge") or instance == safeSpotMarkerPart then return end
	if IGNORED_NAMES[instance.Name] or ignoredSkillNames[instance.Name] or isPlayerAsset(instance) then return end

	local hazardParts, isException = extractHazardParts(instance)
	if #hazardParts == 0 then
		-- Nếu là Model mới tạo có thể các part con chưa kịp parent vào Model
		if instance:IsA("Model") then
			local c
			c = instance.DescendantAdded:Connect(function(desc)
				if desc:IsA("BasePart") and desc.Transparency < FADE_TRANSPARENCY_THRESHOLD then
					if isException or desc.Material == Enum.Material.Neon then
						if c then c:Disconnect(); c = nil end
						registerHazard(instance)
					end
				end
			end)
			task.delay(1, function()
				if c then c:Disconnect(); c = nil end
			end)
		end
		return
	end

	local pos = getInstancePosition(instance, hazardParts)
	local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local dist = rootPart and math.floor((pos - rootPart.Position).Magnitude) or 0

	local activePartsSet = {}
	local partConnections = {}

	for _, part in ipairs(hazardParts) do
		activePartsSet[part] = true
	end

	local visualBoxes = visualEspEnabled and attachSelectionBoxes(hazardParts) or {}

	local info = {
		Instance = instance,
		Name = instance.Name,
		Class = instance.ClassName,
		Position = pos,
		Distance = dist,
		NeonCount = #hazardParts,
		SpawnTime = os.clock(),
		Connections = partConnections,
		ActiveParts = activePartsSet,
		VisualBoxes = visualBoxes,
		IsException = isException,
	}

	activeHazards[instance] = info
	hazardCount = hazardCount + 1
	lastHazardInfo = info

	-- Gắn sự kiện lắng nghe Transparency và Material thay đổi trên từng Part
	local function checkPartStatus(part)
		if not activeHazards[instance] or not activePartsSet[part] then return end

		local isExpired = (not part.Parent)
			or (part.Transparency >= FADE_TRANSPARENCY_THRESHOLD)
			or (not isException and part.Material ~= Enum.Material.Neon)

		if isExpired then
			activePartsSet[part] = nil
			-- Kiểm tra xem còn Part nào đang hoạt động không
			local remaining = 0
			for _ in pairs(activePartsSet) do
				remaining = remaining + 1
			end

			if remaining == 0 then
				unregisterHazard(instance, "Faded / Finished")
			else
				info.NeonCount = remaining
			end
		end
	end

	for _, part in ipairs(hazardParts) do
		table.insert(partConnections, part:GetPropertyChangedSignal("Transparency"):Connect(function()
			checkPartStatus(part)
		end))
		if not isException then
			table.insert(partConnections, part:GetPropertyChangedSignal("Material"):Connect(function()
				checkPartStatus(part)
			end))
		end
		table.insert(partConnections, part.AncestryChanged:Connect(function()
			checkPartStatus(part)
		end))
	end

	if logHazards then
		print(("[SmartDodge][Hazard] 🚨 Hazard Detected: %s | Class: %s | Parts: %d | Dist: %d studs%s")
			:format(info.Name, info.Class, info.NeonCount, info.Distance, isException and " (Exception)" or ""))
	end

	fireHazardChanged()
end

--// Hủy đăng ký hiểm họa (khi mờ, đổi material, hoặc bị xóa khỏi Workspace)
function unregisterHazard(instance, reason)
	if not activeHazards[instance] then return end
	local info = activeHazards[instance]

	-- Dọn dẹp SelectionBoxes
	if info.VisualBoxes then
		for _, box in ipairs(info.VisualBoxes) do
			pcall(function() box:Destroy() end)
		end
		table.clear(info.VisualBoxes)
	end

	-- Dọn dẹp connection của từng part
	if info.Connections then
		for _, c in ipairs(info.Connections) do
			pcall(function() c:Disconnect() end)
		end
		table.clear(info.Connections)
	end

	activeHazards[instance] = nil
	hazardCount = math.max(0, hazardCount - 1)

	if logHazards and info then
		local reasonStr = reason and (" (" .. reason .. ")") or ""
		print(("[SmartDodge][Hazard] 🟢 Hazard Expired: %s%s")
			:format(info.Name, reasonStr))
	end

	fireHazardChanged()
end

--// Cấu hình tính toán điểm an toàn (Bài toán 2)
local playerHitboxPadding = 2.2     -- Bù trừ bán kính cơ thể nhân vật (studs) để phát hiện khi chạm mép
local showHitboxVisual = false      -- Hiển thị vòng tròn trực quan hitbox padding quanh người
local hitboxVisualPart = nil        -- Part visual hitbox tròn quanh chân
local ESCAPE_MARGIN = 4.5           -- Khoảng cách đệm an toàn sau khi ra khỏi mép (studs)
local RAYCAST_DOWN_DIST = 25        -- Khoảng cách bắn raycast xuống mặt đất (studs)
local RADIAL_DISTANCES = { 6, 10, 14, 18, 24, 30 }
local RADIAL_ANGLES = { 0, 45, 90, 135, 180, 225, 270, 315 }

--// Safe Spot State
local showSafeMarker = true
local currentSafeSpot = nil
local lockedSafeSpot = nil
local isPlayerInDanger = false
local currentDangerHazardName = nil
local currentEscapeDist = 0
local safeSpotCallbacks = {}
local safeSpotMarkerPart = nil
local safeSpotLoopThread = nil

--// Cấu hình Thực thi Né Chiêu (Bài toán 3: Hybrid MoveTo + Micro-Teleport)
local autoDodgeEnabled = false
local maxTeleportStep = 3.0          -- Bước teleport an toàn tối đa (studs) để chống anti-cheat
local microBlinkInterval = 0.05      -- Khoảng thời gian giữa các bước nhích MoveTo + Teleport
local isDodging = false
local dodgeThread = nil
local dodgeStatusCallbacks = {}

--// Raycast Parameters dùng chung
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Exclude
raycastParams.IgnoreWater = true

--// Bắn raycast kiểm tra sàn nhà và snap tọa độ xuống mặt đất
local function getFloorPosition(pos)
	local ignoreList = {}
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Character then table.insert(ignoreList, p.Character) end
	end
	if Workspace:FindFirstChild("RaycastIgnore") then
		table.insert(ignoreList, Workspace.RaycastIgnore)
	end
	if safeSpotMarkerPart then
		table.insert(ignoreList, safeSpotMarkerPart)
	end
	for inst in pairs(activeHazards) do
		table.insert(ignoreList, inst)
	end
	raycastParams.FilterDescendantsInstances = ignoreList

	local rayOrigin = Vector3.new(pos.X, pos.Y + 6, pos.Z)
	local rayDir = Vector3.new(0, -RAYCAST_DOWN_DIST, 0)
	local result = Workspace:Raycast(rayOrigin, rayDir, raycastParams)

	if result and result.Position then
		return Vector3.new(pos.X, result.Position.Y + 3, pos.Z), true
	end
	return pos, false
end

--// Kiểm tra xem một điểm P có nằm trong phạm vi sát thương của một BasePart không
local function isPointInPart(point, part)
	if not part or not part:IsA("BasePart") or not part.Parent or isIgnoredPart(part) then
		return false
	end

	-- 1. Dạng hình cầu / hình trụ (Circle / Ball / Cylinder AoE)
	if part:IsA("Part") and (part.Shape == Enum.PartType.Ball or part.Shape == Enum.PartType.Cylinder) then
		local radius = math.max(part.Size.X, part.Size.Z) / 2 + playerHitboxPadding
		local dX = point.X - part.Position.X
		local dZ = point.Z - part.Position.Z
		local distSq = dX * dX + dZ * dZ
		local heightDiff = math.abs(point.Y - part.Position.Y)
		return (distSq <= radius * radius) and (heightDiff <= math.max(10, part.Size.Y / 2 + 5))
	end

	-- 2. Dạng hình chữ nhật / hộp có hướng (Oriented Bounding Box - OBB)
	local localPos = part.CFrame:PointToObjectSpace(point)
	local halfX = part.Size.X / 2 + playerHitboxPadding
	local halfZ = part.Size.Z / 2 + playerHitboxPadding
	local halfY = math.max(8, part.Size.Y / 2 + 5)

	return math.abs(localPos.X) <= halfX
		and math.abs(localPos.Z) <= halfZ
		and math.abs(localPos.Y) <= halfY
end

--// Kiểm tra xem một điểm P có đang bị dính bất kỳ mối nguy hiểm nào không
local function isPointInAnyHazard(point)
	local bestDistSq = math.huge
	local foundInfo, foundPart = nil, nil

	for _, info in pairs(activeHazards) do
		if info.ActiveParts then
			for part in pairs(info.ActiveParts) do
				if isPointInPart(point, part) then
					local distSq = (point - part.Position).Magnitude
					if distSq < bestDistSq then
						bestDistSq = distSq
						foundInfo = info
						foundPart = part
					end
				end
			end
		end
	end

	if foundPart then
		return true, foundInfo, foundPart
	end
	return false, nil, nil
end

--// Tạo / Lấy Part hiển thị Hitbox Padding của Player quanh người
local function getOrCreateHitboxVisual()
	if hitboxVisualPart and hitboxVisualPart.Parent then
		return hitboxVisualPart
	end

	local part = Instance.new("Part")
	part.Name = "SmartDodge_HitboxVisual"
	part.Shape = Enum.PartType.Cylinder
	local diameter = math.max(0.4, playerHitboxPadding * 2)
	part.Size = Vector3.new(0.15, diameter, diameter)
	part.Color = Color3.fromRGB(0, 220, 255)
	part.Material = Enum.Material.Neon
	part.Transparency = 0.75
	part.Anchored = true
	part.CanCollide = false
	part.CanQuery = false
	part.CanTouch = false

	local selectionBox = Instance.new("SelectionBox")
	selectionBox.Name = "HitboxBorder"
	selectionBox.Color3 = Color3.fromRGB(120, 240, 255)
	selectionBox.SurfaceColor3 = Color3.fromRGB(0, 220, 255)
	selectionBox.SurfaceTransparency = 0.8
	selectionBox.LineThickness = 0.04
	selectionBox.Adornee = part
	selectionBox.Parent = part

	hitboxVisualPart = part
	return part
end

--// Cập nhật vị trí và kích thước vòng tròn Hitbox của Player
local function updateHitboxVisual(playerPos)
	if not showHitboxVisual or not threatDetectorEnabled or not playerPos then
		if hitboxVisualPart then
			hitboxVisualPart.Parent = nil
		end
		return
	end

	local part = getOrCreateHitboxVisual()
	local diameter = math.max(0.4, playerHitboxPadding * 2)
	part.Size = Vector3.new(0.15, diameter, diameter)

	local floorPos, hasFloor = getFloorPosition(playerPos)
	local yPos = hasFloor and (floorPos.Y - 2.8) or (playerPos.Y - 2.8)
	local visualPos = Vector3.new(playerPos.X, yPos, playerPos.Z)

	part.CFrame = CFrame.new(visualPos) * CFrame.Angles(0, 0, math.rad(90))
	part.Parent = Workspace.Terrain
end

--// Tạo / Lấy Visual Marker phát sáng màu Xanh Lá
local function getOrCreateSafeMarker()
	if safeSpotMarkerPart and safeSpotMarkerPart.Parent then
		return safeSpotMarkerPart
	end

	local part = Instance.new("Part")
	part.Name = "SmartDodge_SafeMarker"
	part.Shape = Enum.PartType.Cylinder
	part.Size = Vector3.new(0.4, 3.5, 3.5)
	part.Color = Color3.fromRGB(0, 255, 120)
	part.Material = Enum.Material.Neon
	part.Transparency = 0.3
	part.Anchored = true
	part.CanCollide = false
	part.CanQuery = false
	part.CanTouch = false

	local selectionBox = Instance.new("SelectionBox")
	selectionBox.Name = "MarkerBorder"
	selectionBox.Color3 = Color3.fromRGB(80, 255, 160)
	selectionBox.SurfaceColor3 = Color3.fromRGB(0, 255, 120)
	selectionBox.SurfaceTransparency = 0.5
	selectionBox.LineThickness = 0.05
	selectionBox.Adornee = part
	selectionBox.Parent = part

	local bb = Instance.new("BillboardGui")
	bb.Name = "MarkerGui"
	bb.Size = UDim2.fromOffset(140, 30)
	bb.StudsOffset = Vector3.new(0, 3, 0)
	bb.AlwaysOnTop = true
	bb.Adornee = part
	bb.Parent = part

	local label = Instance.new("TextLabel")
	label.Name = "Label"
	label.Size = UDim2.fromScale(1, 1)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.fromRGB(80, 255, 160)
	label.TextStrokeTransparency = 0
	label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	label.Font = Enum.Font.GothamBold
	label.TextSize = 13
	label.Text = "🟢 SAFE SPOT"
	label.Parent = bb

	safeSpotMarkerPart = part
	return part
end

--// Cập nhật vị trí hiển thị của Safe Marker
local function updateSafeMarkerVisual(pos, inDanger, escapeDist)
	if not showSafeMarker or not inDanger or not pos then
		if safeSpotMarkerPart then
			safeSpotMarkerPart.Parent = nil
		end
		return
	end

	local marker = getOrCreateSafeMarker()
	marker.CFrame = CFrame.new(pos) * CFrame.Angles(0, 0, math.rad(90))
	marker.Parent = Workspace.Terrain

	local bb = marker:FindFirstChild("MarkerGui")
	local label = bb and bb:FindFirstChild("Label")
	if label then
		label.Text = ("🟢 SAFE SPOT (%.1fm)"):format(escapeDist or 0)
	end
end

--// Thuật toán cốt lõi: Tính toán vị trí an toàn (Safe Spot Calculation)
function smartDodge.CalculateSafeSpot(customPlayerPos)
	local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local playerPos = customPlayerPos or (rootPart and rootPart.Position)
	if not playerPos then
		lockedSafeSpot = nil
		return false, nil, nil, 0
	end

	-- 1. Kiểm tra xem Player có đang đứng trong bất kỳ vùng nguy hiểm nào không
	local inDanger, dangerInfo, dangerPart = isPointInAnyHazard(playerPos)
	if not inDanger or not dangerPart then
		lockedSafeSpot = nil
		return false, nil, nil, 0
	end

	local hazardName = dangerInfo.Name or "Unknown"

	-- 2. KHÓA ĐIỂM AN TOÀN (Latching Lock): Nếu điểm an toàn trước đó vẫn an toàn, GIỮ NGUYÊN 100% không tính lại
	if lockedSafeSpot and not isPointInAnyHazard(lockedSafeSpot) then
		local dist = (lockedSafeSpot - playerPos).Magnitude
		if dist <= 35 then
			return true, lockedSafeSpot, hazardName, math.floor(dist * 10) / 10
		end
	end

	-- 3. Chiến lược A: Thoát trực tiếp (Direct Escape Vector) từ Part gây nguy hiểm gần nhất
	local candidatePos = nil

	if dangerPart:IsA("Part") and (dangerPart.Shape == Enum.PartType.Ball or dangerPart.Shape == Enum.PartType.Cylinder) then
		-- A1. Chiêu hình tròn / hình cầu: Đẩy thẳng ra ngoài bán kính
		local radius = math.max(dangerPart.Size.X, dangerPart.Size.Z) / 2
		local diff = Vector3.new(playerPos.X - dangerPart.Position.X, 0, playerPos.Z - dangerPart.Position.Z)
		local dir = diff.Magnitude > 0.1 and diff.Unit or Vector3.new(0, 0, 1)
		local directWorld = dangerPart.Position + dir * (radius + ESCAPE_MARGIN)
		local snapped, hasFloor = getFloorPosition(directWorld)

		if hasFloor and not isPointInAnyHazard(snapped) then
			candidatePos = snapped
		end
	else
		-- A2. Chiêu hình chữ nhật / OBB: Thoát ngang 90 độ theo cạnh hẹp nhất
		local localPos = dangerPart.CFrame:PointToObjectSpace(playerPos)
		local halfX = dangerPart.Size.X / 2
		local halfZ = dangerPart.Size.Z / 2
		local targetLocal = nil

		if halfX <= halfZ then
			-- Cạnh X hẹp hơn -> Thoát ngang theo trục X
			local sign = (localPos.X >= 0) and 1 or -1
			targetLocal = Vector3.new(sign * (halfX + ESCAPE_MARGIN), 0, localPos.Z)
		else
			-- Cạnh Z hẹp hơn -> Thoát ngang theo trục Z
			local sign = (localPos.Z >= 0) and 1 or -1
			targetLocal = Vector3.new(localPos.X, 0, sign * (halfZ + ESCAPE_MARGIN))
		end

		local directWorld = dangerPart.CFrame:PointToWorldSpace(targetLocal)
		local snapped, hasFloor = getFloorPosition(directWorld)

		if hasFloor and not isPointInAnyHazard(snapped) then
			candidatePos = snapped
		end
	end

	-- 4. Chiến lược B: Lưới Tỏa Tròn (Radial Grid Search Fallback nếu thoát trực tiếp bị vướng)
	if not candidatePos then
		local bestPos = nil
		local bestDist = math.huge

		for _, dist in ipairs(RADIAL_DISTANCES) do
			for _, angleDeg in ipairs(RADIAL_ANGLES) do
				local rad = math.rad(angleDeg)
				local offset = Vector3.new(math.cos(rad) * dist, 0, math.sin(rad) * dist)
				local testWorld = playerPos + offset
				local snapped, hasFloor = getFloorPosition(testWorld)

				if hasFloor and not isPointInAnyHazard(snapped) then
					local moveDist = (snapped - playerPos).Magnitude
					if moveDist < bestDist then
						bestDist = moveDist
						bestPos = snapped
					end
				end
			end
			if bestPos then break end -- Ưu tiên vòng bán kính nhỏ nhất trước
		end

		candidatePos = bestPos
	end

	if candidatePos then
		lockedSafeSpot = candidatePos
		local escapeDist = math.floor((candidatePos - playerPos).Magnitude * 10) / 10
		return true, candidatePos, hazardName, escapeDist
	end

	lockedSafeSpot = nil
	return true, nil, hazardName, 0
end

local function fireSafeSpotChanged(inDanger, safePos, hazardName, escapeDist)
	for _, cb in ipairs(safeSpotCallbacks) do
		pcall(cb, inDanger, safePos, hazardName, escapeDist)
	end
end

local function fireDodgeStatus(status)
	for _, cb in ipairs(dodgeStatusCallbacks) do
		pcall(cb, status)
	end
end

--// Thực thi né sang Safe Spot bằng cơ chế Hybrid MoveTo + Micro-Teleport
local function performDodge(safePos, escapeDist)
	local char = player and player.Character
	local rootPart = char and char:FindFirstChild("HumanoidRootPart")
	local humanoid = char and char:FindFirstChild("Humanoid")
	if not rootPart or not humanoid or humanoid.Health <= 0 then return end

	if isDodging then return end

	dodgeThread = task.spawn(function()
		isDodging = true
		fireDodgeStatus("Dodging")

		local currentPos = rootPart.Position
		local totalDist = (safePos - currentPos).Magnitude

		-- Trường hợp 1: Khoảng cách ngắn (<= maxTeleportStep, ví dụ <= 3.0 studs) -> Teleport dứt điểm 1 nhịp
		if totalDist <= maxTeleportStep then
			rootPart.CFrame = CFrame.new(safePos, safePos + rootPart.CFrame.LookVector)
			if logInDanger then
				print(("[SmartDodge][Dodge] ⚡ Instant Micro-Teleport (%.1f studs) to Safe Spot!"):format(totalDist))
			end
			isDodging = false
			fireDodgeStatus("Safe")
			return
		end

		-- Trường hợp 2: Khoảng cách xa (> 3.0 studs) -> MoveTo kết hợp Micro-Blink
		if logInDanger then
			print(("[SmartDodge][Dodge] 🏃 Hybrid MoveTo + Micro-Blink (%.1f studs) to Safe Spot..."):format(totalDist))
		end

		local startTime = os.clock()
		local timeout = 2.0 -- Timeout an toàn 2s

		while isPlayerInDanger and autoDodgeEnabled and (os.clock() - startTime < timeout) do
			if not rootPart.Parent or not humanoid.Parent or humanoid.Health <= 0 then break end
			currentPos = rootPart.Position
			local distRemaining = (safePos - currentPos).Magnitude

			-- Nếu đã tới cự ly micro-teleport cuối cùng
			if distRemaining <= maxTeleportStep then
				rootPart.CFrame = CFrame.new(safePos, safePos + rootPart.CFrame.LookVector)
				humanoid:MoveTo(safePos)
				break
			end

			local dir = (safePos - currentPos).Unit
			local stepDist = math.min(maxTeleportStep, distRemaining - 0.5)

			humanoid:MoveTo(safePos)

			local newPos = currentPos + dir * stepDist
			local lookTarget = newPos + dir
			rootPart.CFrame = CFrame.new(newPos, Vector3.new(lookTarget.X, newPos.Y, lookTarget.Z))

			task.wait(microBlinkInterval)
		end

		isDodging = false
		fireDodgeStatus("Safe")
	end)
end

--// Vòng lặp đánh giá nguy hiểm và cập nhật Safe Spot theo thời gian thực
local function startSafeSpotLoop()
	if safeSpotLoopThread then return end
	safeSpotLoopThread = task.spawn(function()
		local lastLogTime = 0
		while threatDetectorEnabled do
			local inDanger, safePos, hazardName, escapeDist = smartDodge.CalculateSafeSpot()
			local stateChanged = (inDanger ~= isPlayerInDanger) or (safePos ~= currentSafeSpot)

			isPlayerInDanger = inDanger
			currentSafeSpot = safePos
			currentDangerHazardName = hazardName
			currentEscapeDist = escapeDist or 0

			updateSafeMarkerVisual(safePos, inDanger, escapeDist)

			local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
			local pPos = rootPart and rootPart.Position
			updateHitboxVisual(pPos)

			-- Kích hoạt Thực thi Né Chiêu (Bài toán 3)
			if inDanger and safePos and autoDodgeEnabled then
				performDodge(safePos, escapeDist)
			end

			if stateChanged then
				fireSafeSpotChanged(inDanger, safePos, hazardName, escapeDist)

				if logInDanger and inDanger and safePos and (os.clock() - lastLogTime > 0.5) then
					lastLogTime = os.clock()
					print(("[SmartDodge][InDanger] ⚠️ IN DANGER: %s | Escape Dist: %.1f studs -> SafePos: (%.1f, %.1f, %.1f)")
						:format(hazardName, escapeDist, safePos.X, safePos.Y, safePos.Z))
				end
			end

			task.wait(0.05)
		end
	end)
end

local function stopSafeSpotLoop()
	if safeSpotLoopThread then
		task.cancel(safeSpotLoopThread)
		safeSpotLoopThread = nil
	end
	if dodgeThread then
		task.cancel(dodgeThread)
		dodgeThread = nil
	end
	if safeSpotMarkerPart then
		safeSpotMarkerPart.Parent = nil
	end
	if hitboxVisualPart then
		hitboxVisualPart.Parent = nil
	end
	isDodging = false
	isPlayerInDanger = false
	currentSafeSpot = nil
	lockedSafeSpot = nil
	currentDangerHazardName = nil
	fireSafeSpotChanged(false, nil, nil, 0)
	fireDodgeStatus("Idle")
end

--// Bắt đầu quét & lắng nghe sự kiện Workspace cấp 1
local function startTracking()
	-- Dọn dẹp connection cũ nếu có
	for _, c in ipairs(connections) do c:Disconnect() end
	table.clear(connections)

	-- Dọn dẹp hazards cũ
	for inst, info in pairs(activeHazards) do
		if info.VisualBoxes then
			for _, box in ipairs(info.VisualBoxes) do pcall(function() box:Destroy() end) end
		end
		if info.Connections then
			for _, c in ipairs(info.Connections) do pcall(function() c:Disconnect() end) end
		end
	end
	table.clear(activeHazards)
	hazardCount = 0

	-- 1. Quét tức thời các child Depth 1 hiện tại trong Workspace
	for _, child in ipairs(Workspace:GetChildren()) do
		registerHazard(child)
	end

	-- 2. Lắng nghe vật thể mới sinh ra ở Workspace (Depth 1)
	table.insert(connections, Workspace.ChildAdded:Connect(function(child)
		registerHazard(child)
	end))

	-- 3. Lắng nghe vật thể bị xóa khỏi Workspace (Depth 1)
	table.insert(connections, Workspace.ChildRemoved:Connect(function(child)
		unregisterHazard(child, "Destroyed")
	end))

	-- Khởi chạy vòng lặp đánh giá Safe Spot
	startSafeSpotLoop()

	if logHazards then
		print("[SmartDodge] 📡 Threat Detector & Safe Spot Engine started!")
	end
end

local function stopTracking()
	for _, c in ipairs(connections) do c:Disconnect() end
	table.clear(connections)

	for inst, info in pairs(activeHazards) do
		if info.VisualBoxes then
			for _, box in ipairs(info.VisualBoxes) do pcall(function() box:Destroy() end) end
		end
		if info.Connections then
			for _, c in ipairs(info.Connections) do pcall(function() c:Disconnect() end) end
		end
	end
	table.clear(activeHazards)
	hazardCount = 0
	fireHazardChanged()

	stopSafeSpotLoop()

	if logHazards then
		print("[SmartDodge] 🛑 Threat Detector stopped.")
	end
end

--// Methods
function smartDodge.Toggle(state)
	threatDetectorEnabled = state and true or false
	if threatDetectorEnabled then
		startTracking()
	else
		stopTracking()
	end
end

function smartDodge.IsEnabled()
	return threatDetectorEnabled
end

function smartDodge.SetLogHazards(state)
	logHazards = state and true or false
end

function smartDodge.IsLogHazardsEnabled()
	return logHazards
end

function smartDodge.SetLogInDanger(state)
	logInDanger = state and true or false
end

function smartDodge.IsLogInDangerEnabled()
	return logInDanger
end

-- Backward compatibility aliases
smartDodge.SetLogThreats = smartDodge.SetLogHazards
smartDodge.IsLogThreatsEnabled = smartDodge.IsLogHazardsEnabled

function smartDodge.SetVisualEsp(state)
	visualEspEnabled = state and true or false
	if visualEspEnabled then
		for _, info in pairs(activeHazards) do
			if (not info.VisualBoxes or #info.VisualBoxes == 0) and info.ActiveParts then
				local partsList = {}
				for p in pairs(info.ActiveParts) do
					table.insert(partsList, p)
				end
				info.VisualBoxes = attachSelectionBoxes(partsList)
			end
		end
	else
		for _, info in pairs(activeHazards) do
			if info.VisualBoxes then
				for _, box in ipairs(info.VisualBoxes) do
					pcall(function() box:Destroy() end)
				end
				table.clear(info.VisualBoxes)
			end
		end
	end
end

function smartDodge.IsVisualEspEnabled()
	return visualEspEnabled
end

function smartDodge.SetShowSafeMarker(state)
	showSafeMarker = state and true or false
	updateSafeMarkerVisual(currentSafeSpot, isPlayerInDanger, currentEscapeDist)
end

function smartDodge.IsShowSafeMarkerEnabled()
	return showSafeMarker
end

function smartDodge.IsInDanger()
	return isPlayerInDanger
end

function smartDodge.GetCurrentSafeSpot()
	return currentSafeSpot, isPlayerInDanger, currentDangerHazardName, currentEscapeDist
end

function smartDodge.OnSafeSpotChanged(callback)
	if type(callback) ~= "function" then return end
	table.insert(safeSpotCallbacks, callback)
end

function smartDodge.GetHazardCount()
	return hazardCount
end

function smartDodge.GetActiveHazards()
	local list = {}
	for _, data in pairs(activeHazards) do
		if data.Instance and data.Instance.Parent == Workspace then
			table.insert(list, data)
		end
	end
	return list
end

function smartDodge.GetLastHazardInfo()
	return lastHazardInfo
end

function smartDodge.OnHazardChanged(callback)
	if type(callback) ~= "function" then return end
	table.insert(hazardChangedCallbacks, callback)
end

function smartDodge.SetAutoDodge(state)
	autoDodgeEnabled = state and true or false
end

function smartDodge.IsAutoDodgeEnabled()
	return autoDodgeEnabled
end

function smartDodge.SetMaxTeleportStep(step)
	if type(step) == "number" and step > 0 then
		maxTeleportStep = step
	end
end

function smartDodge.GetMaxTeleportStep()
	return maxTeleportStep
end

function smartDodge.GetDodgeStatus()
	if isDodging then
		return "Dodging"
	elseif isPlayerInDanger then
		return "Safe (Standing in Spot)"
	else
		return "Idle"
	end
end

function smartDodge.OnDodgeStatusChanged(callback)
	if type(callback) ~= "function" then return end
	table.insert(dodgeStatusCallbacks, callback)
end

function smartDodge.SetShowHitboxVisual(state)
	showHitboxVisual = state and true or false
	local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local pPos = rootPart and rootPart.Position
	updateHitboxVisual(pPos)
end

function smartDodge.IsShowHitboxVisualEnabled()
	return showHitboxVisual
end

function smartDodge.SetHitboxPadding(value)
	if type(value) == "number" and value >= 0 then
		playerHitboxPadding = value
		if hitboxVisualPart and hitboxVisualPart.Parent then
			local diameter = math.max(0.4, playerHitboxPadding * 2)
			hitboxVisualPart.Size = Vector3.new(0.15, diameter, diameter)
		end
	end
end

function smartDodge.GetHitboxPadding()
	return playerHitboxPadding
end

function smartDodge.SetMicroBlinkInterval(value)
	if type(value) == "number" and value > 0 then
		if value >= 1 then
			microBlinkInterval = value / 1000
		else
			microBlinkInterval = value
		end
	end
end

function smartDodge.GetMicroBlinkIntervalMs()
	return math.floor(microBlinkInterval * 1000 + 0.5)
end

function smartDodge.GetMicroBlinkInterval()
	return microBlinkInterval
end

lifecycle.Register(function()
	stopTracking()
	if safeSpotMarkerPart then
		pcall(function() safeSpotMarkerPart:Destroy() end)
		safeSpotMarkerPart = nil
	end
	if hitboxVisualPart then
		pcall(function() hitboxVisualPart:Destroy() end)
		hitboxVisualPart = nil
	end
	if dodgeThread then
		pcall(function() task.cancel(dodgeThread) end)
		dodgeThread = nil
	end
	isDodging = false
end)

return smartDodge
