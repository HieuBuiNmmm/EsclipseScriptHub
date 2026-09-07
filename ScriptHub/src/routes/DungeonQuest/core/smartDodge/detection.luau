-- Smart Dodge – Module 1: Threat Detection Engine (DungeonQuest).
-- Chuyên trách: quét Workspace Depth 1, nhận diện hiểm họa (Neon / ngoại lệ), khóa quỹ đạo
-- projectile, SelectionBox ESP, hành lang quỹ đạo cảnh báo, registry tên skill player.
-- State riêng: activeHazards, lockedProjectiles, activeTrajectoryVisuals, các flag debug.

--// Imports
local services = require("@routes/DungeonQuest/core/services")

--// Lazy require Module Geometry (tránh vòng phụ thuộc: geometry đọc data detection qua lazy quay lại)
local geometryRef
local function getGeometry()
	if not geometryRef then
		geometryRef = require("@routes/DungeonQuest/core/smartDodge/geometry")
	end
	return geometryRef
end

--// References
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local player = services.player

--// Table
local detection = {}

--// State
local threatDetectorEnabled = false
local logHazards = false
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
	["firstBossCrissCross"] = true,
	["firstBossSeekingSpikes"] = true,
}

--// Ngưỡng coi như chiêu đã mờ hoàn toàn/kết thúc
local FADE_TRANSPARENCY_THRESHOLD = 0.85

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
	["SmartDodge_TrajectoryBox"] = true,
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

--// Cấu hình các kỹ năng Projectile dạng quỹ đạo bắn thẳng (Trajectory / Corridor Telegraph)
local TRAJECTORY_PROJECTILE_CONFIGS = {
	["firstbosscrisscross"] = {
		name = "firstBossCrissCross",
		dangerRadius = 4.0,       -- Bán kính vùng sát thương tối thiểu của đạn (studs)
		maxLookahead = nil,       -- Chiều dài hành lang dự đoán (nil = dùng trajectoryLookahead động)
		visualColor = Color3.fromRGB(255, 130, 0), -- Màu cam cho quỹ đạo
	},
	["firstbossseekingspikes"] = {
		name = "firstBossSeekingSpikes",
		dangerRadius = 4.5,       -- Bán kính vùng sát thương tối thiểu của đạn (studs)
		maxLookahead = nil,       -- Chiều dài hành lang dự đoán (nil = dùng trajectoryLookahead động)
		visualColor = Color3.fromRGB(255, 110, 0), -- Màu cam đậm cho Seeking Spikes
	},
}

--// Cấu hình động cho hành lang quỹ đạo đạn (Trajectory Tuning)
local trajectoryLookahead = 50.0          -- Chiều dài hành lang dự đoán (mặc định 50 studs thay vì 300 để tránh tắc map)
local trajectoryWidthPadding = 2.5        -- Khoảng đệm nới rộng 2 bên sườn dựa trên kích thước thật của chiêu (studs)

--// Bảng lưu trữ trạng thái khóa hướng quỹ đạo (Direction Locking & State Tracking)
local lockedProjectiles = {} -- [BasePart] = { originPos, forward2D, dangerRadius, maxLookahead, locked, config }
local activeTrajectoryVisuals = {} -- [BasePart] = Part

--// Getters/Setters cho cấu hình Trajectory
detection.SetTrajectoryLookahead = function(val)
	if type(val) == "number" and val >= 10 then
		trajectoryLookahead = val
	end
end

detection.GetTrajectoryLookahead = function()
	return trajectoryLookahead
end

detection.SetTrajectoryWidthPadding = function(val)
	if type(val) == "number" and val >= 0 then
		trajectoryWidthPadding = val
	end
end

detection.GetTrajectoryWidthPadding = function()
	return trajectoryWidthPadding
end

--// Getters nội bộ cho geometry (tránh vòng phụ thuộc detection -> geometry: geometry đọc qua lazy require).
detection.GetActiveHazardsMap = function()
	return activeHazards
end

detection.GetLockedProjectiles = function()
	return lockedProjectiles
end

detection.GetFadeThreshold = function()
	return FADE_TRANSPARENCY_THRESHOLD
end

detection.IsEnabled = function()
	return threatDetectorEnabled
end

detection.SetEnabled = function(state)
	threatDetectorEnabled = state and true or false
end

--// Xóa toàn bộ visual quỹ đạo + lock data (dùng khi stop loop / shutdown)
detection.ClearTrajectoryVisuals = function()
	for part, vPart in pairs(activeTrajectoryVisuals) do
		pcall(function() vPart:Destroy() end)
	end
	table.clear(activeTrajectoryVisuals)
	table.clear(lockedProjectiles)
end

--// Thêm một Skill vào danh sách ngoại lệ
function detection.AddCustomHazard(skillName)
	if type(skillName) == "string" and #skillName > 0 then
		CUSTOM_HAZARD_EXCEPTIONS[skillName] = true
	end
end

--// Thêm một Skill vào danh sách Trajectory Projectile
function detection.AddTrajectoryProjectile(skillName, dangerRadius, maxLookahead)
	if type(skillName) == "string" and #skillName > 0 then
		local clean = skillName:lower():gsub("%s+", "")
		TRAJECTORY_PROJECTILE_CONFIGS[clean] = {
			name = skillName,
			dangerRadius = dangerRadius or 4.0,
			maxLookahead = maxLookahead,
			visualColor = Color3.fromRGB(255, 130, 0),
		}
		if logHazards then
			print(("[SmartDodge] 🚀 Registered Trajectory Projectile: %s"):format(skillName))
		end
	end
end

--// Kiểm tra xem part có thuộc cấu hình kỹ năng Trajectory hay không
local function getTrajectoryConfigForPart(part)
	if not part then return nil end
	local nameLower = part.Name:lower():gsub("%s+", "")
	if TRAJECTORY_PROJECTILE_CONFIGS[nameLower] then
		return TRAJECTORY_PROJECTILE_CONFIGS[nameLower]
	end
	if part.Parent and part.Parent:IsA("Model") then
		local parentLower = part.Parent.Name:lower():gsub("%s+", "")
		if TRAJECTORY_PROJECTILE_CONFIGS[parentLower] then
			return TRAJECTORY_PROJECTILE_CONFIGS[parentLower]
		end
	end
	return nil
end

detection.GetTrajectoryConfigForPart = function(part)
	return getTrajectoryConfigForPart(part)
end

--// Khóa hướng bay ngay tại Frame 0 trước khi đạn bị xoay quanh trục Y bởi game
local function lockTrajectoryForPart(part)
	if not part or not part:IsA("BasePart") then return nil end
	if lockedProjectiles[part] then
		return lockedProjectiles[part]
	end

	local config = getTrajectoryConfigForPart(part)
	if not config then return nil end

	-- Bắt hướng bay từ Velocity (nếu đang bay) hoặc CFrame.LookVector tại thời điểm spawn
	local forward2D = Vector3.new(0, 0, -1)
	local vel = (part.AssemblyLinearVelocity or (part:IsA("BasePart") and part.Velocity))
	if vel and Vector3.new(vel.X, 0, vel.Z).Magnitude > 2 then
		forward2D = Vector3.new(vel.X, 0, vel.Z).Unit
	else
		local look = part.CFrame.LookVector
		local look2D = Vector3.new(look.X, 0, look.Z)
		if look2D.Magnitude > 0.001 then
			forward2D = look2D.Unit
		end
	end

	-- Đo bề ngang tiết diện thực tế (cross-section) vuông góc với hướng bay:
	-- Dùng math.min(Size.X, Size.Z) để lấy bề ngang viên đạn, tránh lấy chiều dài thân đạn (Length)
	local crossSectionWidth = math.min(part.Size.X, part.Size.Z)
	if crossSectionWidth < 1 then
		crossSectionWidth = math.max(part.Size.X, part.Size.Z)
	end
	crossSectionWidth = math.clamp(crossSectionWidth, 2.0, 12.0)

	local baseMinRadius = config.dangerRadius or (crossSectionWidth / 2)
	local finalDangerRadius = baseMinRadius + trajectoryWidthPadding
	local finalMaxLookahead = config.maxLookahead or trajectoryLookahead

	-- KHÓA TRỤC Y NGAY TẠI THỜI ĐIỂM SPAWN:
	-- Lấy cao độ sàn mặt đất (Raw Floor Y) để vùng màu cam và hitbox luôn dán chặt vào mặt đất,
	-- không bị trôi nổi trên không trung hay nhấp nhô theo trục Y của viên đạn.
	local rawFloorY, hasFloor = getGeometry().GetRawFloorY(part.Position)
	local boxThickness = 0.8 -- Chiều cao của vùng màu cam trên mặt đất (studs)
	local lockedVisualY = rawFloorY + (boxThickness / 2) + 0.05 -- Đặt đáy hộp nằm sát trên sàn để không chìm vào mesh sàn

	local data = {
		part = part,
		originPos = part.Position,
		forward2D = forward2D,
		dangerRadius = finalDangerRadius,
		maxLookahead = finalMaxLookahead,
		config = config,
		spawnTime = os.clock(),
		locked = true,
		rawFloorY = rawFloorY,
		lockedVisualY = lockedVisualY,
		boxThickness = boxThickness,
	}

	lockedProjectiles[part] = data
	if logHazards then
		print(("[SmartDodge] 🚀 Locked Trajectory for %s | Dir: (%.2f, %.2f) | Lookahead: %.0fm | Width: %.1fm | Locked Floor Y: %.2f"):format(
			part.Name, forward2D.X, forward2D.Z, data.maxLookahead, data.dangerRadius * 2, rawFloorY
		))
	end

	return data
end

detection.LockTrajectoryForPart = function(part)
	return lockTrajectoryForPart(part)
end

--// Đăng ký tên kỹ năng của Player để loại trừ
function detection.RegisterPlayerSkill(skillName)
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
				detection.RegisterPlayerSkill(child.Name)
			end
		end

		local function watchBackpack(bp)
			if not bp then return end
			scanContainer(bp)
			bp.ChildAdded:Connect(function(child)
				detection.RegisterPlayerSkill(child.Name)
			end)
		end

		local function watchCharacter(char)
			if not char then return end
			scanContainer(char)
			char.ChildAdded:Connect(function(child)
				if child:IsA("Tool") then
					detection.RegisterPlayerSkill(child.Name)
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
						detection.RegisterPlayerSkill(item.Name)
					end
				end
				if p.Character then
					for _, item in ipairs(p.Character:GetChildren()) do
						if item:IsA("Tool") then
							detection.RegisterPlayerSkill(item.Name)
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

	local instNameClean = instance.Name:gsub("^%s+", ""):gsub("%s+$", "")
	local instNameLower = instNameClean:lower():gsub("%s+", "")

	-- 0. Ngoại lệ chiêu của Boss / Enemy -> Tuyệt đối không phải của Player
	if CUSTOM_HAZARD_EXCEPTIONS[instance.Name]
		or instNameLower:find("boss")
		or instNameLower:find("enemy")
		or instNameLower:find("mob")
		or instNameLower:find("multiring")
		or instNameLower:find("crisscross")
		or instNameLower:find("seekingspike")
		or instNameLower:find("thirdboss") then
		return false
	end

	-- 1. Kiểm tra trực thuộc Character của bất kỳ người chơi nào
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Character and (instance == p.Character or instance:IsDescendantOf(p.Character)) then
			return true
		end
	end

	-- 2. Kiểm tra trực tiếp trong Backpack & Character của mọi người chơi (Khớp chính xác tên, không fuzzy substring)
	local instNameClean = instance.Name:gsub("^%s+", ""):gsub("%s+$", "")
	local instNameLower = instNameClean:lower():gsub("%s+", "")

	for _, p in ipairs(Players:GetPlayers()) do
		local bp = p:FindFirstChild("Backpack")
		if bp then
			if bp:FindFirstChild(instance.Name) or bp:FindFirstChild(instNameClean) then
				detection.RegisterPlayerSkill(instance.Name)
				return true
			end
			for _, item in ipairs(bp:GetChildren()) do
				local itemLower = item.Name:lower():gsub("%s+", "")
				if item.Name == instance.Name or itemLower == instNameLower then
					detection.RegisterPlayerSkill(item.Name)
					return true
				end
			end
		end

		if p.Character then
			if p.Character:FindFirstChild(instance.Name) or p.Character:FindFirstChild(instNameClean) then
				detection.RegisterPlayerSkill(instance.Name)
				return true
			end
			for _, item in ipairs(p.Character:GetChildren()) do
				if item:IsA("Tool") then
					local itemLower = item.Name:lower():gsub("%s+", "")
					if item.Name == instance.Name or itemLower == instNameLower then
						detection.RegisterPlayerSkill(item.Name)
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

	-- 5. So khớp với danh sách tên kỹ năng đã đăng ký (Chính xác tên, không fuzzy substring tránh trùng tên chiêu Boss)
	if ignoredSkillNames[instance.Name] or ignoredSkillNames[instNameClean] or ignoredSkillNames[instNameLower] then
		return true
	end

	-- Riêng các hiệu ứng Aura thông dụng của player
	if instNameLower:find("enhancedaura", 1, true) or instNameLower:find("auraring", 1, true) or instNameLower:find("groundaura", 1, true) then
		return true
	end

	return false
end

--// Danh sách tên các Part bổ trợ / không gây sát thương cần lọc bỏ
local HELPER_PART_NAMES = {
	["primarypart"] = true,
	["center"] = true,
	["root"] = true,
	["main"] = true,
	["handle"] = true,
	["humanoidrootpart"] = true,
}

--// Kiểm tra xem một Part/MeshPart cụ thể có thuộc danh sách bỏ qua hay không
local function isIgnoredPart(part)
	if not part then return true end
	--// Marker "SmartDodge_SafeMarker" đã bị chặn sẵn bằng tên chứa "SmartDodge" (CanQuery=false),
	--// nên không cần so sánh instance marker riêng nữa (refactor ra nhiều module).
	if part.Name:find("SmartDodge") then return true end
	local nameClean = part.Name:gsub("^%s+", ""):gsub("%s+$", "")
	local nameLower = nameClean:lower():gsub("%s+", "")

	if CUSTOM_HAZARD_EXCEPTIONS[part.Name] or (part.Parent and CUSTOM_HAZARD_EXCEPTIONS[part.Parent.Name])
		or part.Name:lower():find("multiring") or (part.Parent and part.Parent.Name:lower():find("multiring"))
		or part.Name:lower():find("crisscross") or (part.Parent and part.Parent.Name:lower():find("crisscross"))
		or part.Name:lower():find("seekingspike") or (part.Parent and part.Parent.Name:lower():find("seekingspike"))
		or part.Name:lower():find("thirdboss") or (part.Parent and part.Parent.Name:lower():find("thirdboss")) then
		return false
	end

	if ignoredSkillNames[part.Name] or ignoredSkillNames[nameClean] or ignoredSkillNames[nameLower] or IGNORED_NAMES[part.Name] then
		return true
	end

	if nameLower:find("enhancedaura", 1, true) or nameLower:find("auraring", 1, true) or nameLower:find("groundaura", 1, true) then
		return true
	end
	return false
end

detection.IsIgnoredPart = function(part)
	return isIgnoredPart(part)
end

--// Tìm các Part nguy hiểm bên trong instance (Depth 1 BasePart hoặc Model)
local function extractHazardParts(instance)
	local parts = {}
	if not instance or instance.Name:find("SmartDodge") or isIgnoredPart(instance) then
		return parts, false
	end
	local isException = CUSTOM_HAZARD_EXCEPTIONS[instance.Name]
		or instance.Name:lower():find("multiring")
		or instance.Name:lower():find("crisscross")
		or instance.Name:lower():find("seekingspike")
		or instance.Name:lower():find("thirdboss")

	local function isValidHazardPart(part)
		if not part or not part:IsA("BasePart") or isIgnoredPart(part) then return false end
		local nameLower = part.Name:lower():gsub("%s+", "")
		if HELPER_PART_NAMES[nameLower] then return false end

		-- Với chiêu multi rings, chỉ nhận các part tên 'ring'
		if instance.Name:lower():find("multiring") and not nameLower:find("ring") then
			return false
		end

		return part.Transparency < FADE_TRANSPARENCY_THRESHOLD
	end

	if isException then
		-- Ngoại lệ đặc biệt: tìm các part 'precast', 'ring' hoặc BaseParts có trong model
		if instance:IsA("BasePart") then
			if isValidHazardPart(instance) then
				table.insert(parts, instance)
			end
		elseif instance:IsA("Model") then
			local precasts = {}
			for _, desc in ipairs(instance:GetDescendants()) do
				if isValidHazardPart(desc) and desc.Name:lower():find("precast") then
					table.insert(precasts, desc)
				end
			end
			if #precasts > 0 then
				parts = precasts
			else
				for _, desc in ipairs(instance:GetDescendants()) do
					if isValidHazardPart(desc) then
						table.insert(parts, desc)
					end
				end
			end
		end
	else
		-- Tiêu chuẩn chung: Material == Neon
		if instance:IsA("BasePart") then
			if isValidHazardPart(instance) and instance.Material == Enum.Material.Neon then
				table.insert(parts, instance)
			end
		elseif instance:IsA("Model") then
			for _, desc in ipairs(instance:GetDescendants()) do
				if isValidHazardPart(desc) and desc.Material == Enum.Material.Neon then
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
	if instance:FindFirstChildOfClass("Humanoid") then return end
	if instance.Name:find("SmartDodge") then return end
	if IGNORED_NAMES[instance.Name] or ignoredSkillNames[instance.Name] then return end

	-- FAST REJECTION: Trích xuất part hiểm họa trước.
	-- Nếu không có part Neon và không thuộc ngoại lệ -> Bỏ qua ngay lập tức trong 0.0001ms mà KHÔNG chạy isPlayerAsset
	local hazardParts, isException = extractHazardParts(instance)
	if #hazardParts == 0 then
		-- Nếu là Model mới tạo, các part con có thể chưa kịp replicate hoặc parent vào Model
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
			task.delay(1.5, function()
				if c then c:Disconnect(); c = nil end
			end)
		elseif instance:IsA("BasePart") and instance.Transparency < FADE_TRANSPARENCY_THRESHOLD then
			local c
			c = instance:GetPropertyChangedSignal("Material"):Connect(function()
				if instance.Material == Enum.Material.Neon then
					if c then c:Disconnect(); c = nil end
					registerHazard(instance)
				end
			end)
			task.delay(1.5, function()
				if c then c:Disconnect(); c = nil end
			end)
		end
		return
	end

	-- Chỉ khi chắc chắn có Part nguy hiểm thực sự mới kiểm tra xem có phải skill của Player/Đồng đội không
	if isPlayerAsset(instance) then return end

	local pos = getInstancePosition(instance, hazardParts)
	local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local dist = rootPart and math.floor((pos - rootPart.Position).Magnitude) or 0

	local activePartsSet = {}
	local partConnections = {}

	-- Bộ theo dõi chu kỳ chớp sáng (Flash Peak & Decay Tracker) cho từng Part
	local partMinTrans = {}      -- [Part] = number (độ mờ thấp nhất / sáng nhất từng ghi nhận)
	local partHasFlashed = {}    -- [Part] = boolean (đã từng đạt trạng thái chớp sáng kích nổ chưa)

	for _, part in ipairs(hazardParts) do
		activePartsSet[part] = true
		local initT = part.Transparency
		partMinTrans[part] = initT
		partHasFlashed[part] = (initT <= 0.28)
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

	-- Khóa hướng bay ngay tại Frame 0 cho các chiêu đạn bay / Projectile
	for _, part in ipairs(hazardParts) do
		if getTrajectoryConfigForPart(part) then
			lockTrajectoryForPart(part)
		end
	end

	-- Gắn sự kiện lắng nghe Transparency và Material thay đổi trên từng Part
	local function checkPartStatus(part)
		if not activeHazards[instance] or not activePartsSet[part] then return end

		local curTrans = part.Transparency
		local minT = partMinTrans[part] or curTrans
		if curTrans < minT then
			minT = curTrans
			partMinTrans[part] = minT
		end

		-- Pha Kích nổ / Sát thương: Khi part đạt độ sáng chói (Transparency tụt xuống <= 0.28)
		if minT <= 0.28 then
			partHasFlashed[part] = true
		end

		-- Pha Tan biến sau khi chớp sáng (Early Hitbox Clearance):
		-- Một khi đã từng chớp sáng, chỉ cần Transparency bắt đầu tăng lên (curTrans >= minT + 0.18 hoặc curTrans >= 0.40)
		-- -> Sát thương đã nổ xong 100%, loại bỏ hitbox ngay lập tức không cần đợi tới 0.85/0.95!
		local hasDecayedAfterFlash = partHasFlashed[part] and (curTrans >= (minT + 0.18) or curTrans >= 0.40)

		local isExpired = (not part.Parent)
			or hasDecayedAfterFlash
			or (curTrans >= FADE_TRANSPARENCY_THRESHOLD)
			or (not isException and part.Material ~= Enum.Material.Neon)

		if isExpired then
			activePartsSet[part] = nil
			partMinTrans[part] = nil
			partHasFlashed[part] = nil

			if activeTrajectoryVisuals[part] then
				pcall(function() activeTrajectoryVisuals[part]:Destroy() end)
				activeTrajectoryVisuals[part] = nil
			end
			if lockedProjectiles[part] then
				lockedProjectiles[part] = nil
			end

			-- Kiểm tra xem còn Part nào đang hoạt động không
			local remaining = 0
			for _ in pairs(activePartsSet) do
				remaining = remaining + 1
			end

			if remaining == 0 then
				local reason = hasDecayedAfterFlash and "Post-flash Decay (Early Hitbox Clearance)" or "Faded / Finished"
				unregisterHazard(instance, reason)
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

	-- Lắng nghe các Part con được nạp trễ vào Model (Ví dụ các Ring được gán vào sau)
	if instance:IsA("Model") then
		table.insert(partConnections, instance.DescendantAdded:Connect(function(desc)
			if not activeHazards[instance] then return end
			local isValid = desc:IsA("BasePart") and not isIgnoredPart(desc) and desc.Transparency < FADE_TRANSPARENCY_THRESHOLD
			if isValid then
				local nameLower = desc.Name:lower():gsub("%s+", "")
				if not HELPER_PART_NAMES[nameLower] then
					if isException or desc.Material == Enum.Material.Neon then
						if not activePartsSet[desc] then
							activePartsSet[desc] = true
							info.NeonCount = info.NeonCount + 1

							local initT = desc.Transparency
							partMinTrans[desc] = initT
							partHasFlashed[desc] = (initT <= 0.28)

							if getTrajectoryConfigForPart(desc) then
								lockTrajectoryForPart(desc)
							end

							if visualEspEnabled then
								local boxes = attachSelectionBoxes({ desc })
								if boxes and #boxes > 0 then
									for _, b in ipairs(boxes) do table.insert(info.VisualBoxes, b) end
								end
							end

							table.insert(partConnections, desc:GetPropertyChangedSignal("Transparency"):Connect(function()
								checkPartStatus(desc)
							end))
							table.insert(partConnections, desc.AncestryChanged:Connect(function()
								checkPartStatus(desc)
							end))
						end
					end
				end
			end
		end))
	end

	-- Tự động in cấu trúc chi tiết của thirdBossMultiRings để phân tích thông số hình học
	if instance.Name:lower():find("multiring") then
		task.delay(0.3, function()
			if not instance or not instance.Parent then return end
			local centerPart = instance:FindFirstChild("center") or instance:FindFirstChild("Center") or instance.PrimaryPart
			local centerPos = centerPart and centerPart.Position or Vector3.zero
			print("================ [MULTIRINGS INSPECTOR DUMP] ================")
			print(("[MultiRings] Model: %s | Center: (%.1f, %.1f, %.1f)"):format(instance.Name, centerPos.X, centerPos.Y, centerPos.Z))

			local idx = 0
			for _, child in ipairs(instance:GetDescendants()) do
				if child:IsA("BasePart") then
					idx = idx + 1
					local off = child.Position - centerPos
					local _, rotY = child.CFrame:ToOrientation()
					print(("[%d] Name: '%s' | Class: %s | Size: (%.1f, %.1f, %.1f) | Offset: (%.1f, %.1f, %.1f) | RotY: %.1f deg"):format(
						idx, child.Name, child.ClassName, child.Size.X, child.Size.Y, child.Size.Z, off.X, off.Y, off.Z, math.deg(rotY)
					))
				end
			end
			print("=============================================================")
		end)
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

	-- Dọn dẹp Trajectory visuals và locked data
	if info.ActiveParts then
		for p in pairs(info.ActiveParts) do
			if activeTrajectoryVisuals[p] then
				pcall(function() activeTrajectoryVisuals[p]:Destroy() end)
				activeTrajectoryVisuals[p] = nil
			end
			if lockedProjectiles[p] then
				lockedProjectiles[p] = nil
			end
		end
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

--// Nội bộ cho engine: đăng ký/hủy hazard 1 instance (Workspace ChildAdded/ChildRemoved)
detection.RegisterHazard = registerHazard
detection.UnregisterHazard = unregisterHazard

--// Cập nhật Visual ESP cho các hành lang quỹ đạo (Trajectory Boxes)
function detection.UpdateTrajectoryVisuals()
	if not visualEspEnabled or not threatDetectorEnabled then
		for part, vPart in pairs(activeTrajectoryVisuals) do
			pcall(function() vPart:Destroy() end)
		end
		table.clear(activeTrajectoryVisuals)
		return
	end

	local currentActiveParts = {}

	for _, info in pairs(activeHazards) do
		if info.ActiveParts then
			for part in pairs(info.ActiveParts) do
				if part and part.Parent and part:IsA("BasePart") and part.Transparency < FADE_TRANSPARENCY_THRESHOLD then
					local trajConfig = getTrajectoryConfigForPart(part)
					if trajConfig then
						local trajData = lockedProjectiles[part] or lockTrajectoryForPart(part)
						if trajData and trajData.forward2D then
							currentActiveParts[part] = true

							-- Cập nhật động kích thước theo slider UI thời gian thực
							local crossSectionWidth = math.min(part.Size.X, part.Size.Z)
							if crossSectionWidth < 1 then
								crossSectionWidth = math.max(part.Size.X, part.Size.Z)
							end
							crossSectionWidth = math.clamp(crossSectionWidth, 2.0, 12.0)

							local baseMinRadius = trajData.config.dangerRadius or (crossSectionWidth / 2)
							local dangerRadius = baseMinRadius + trajectoryWidthPadding
							local maxLookahead = trajData.config.maxLookahead or trajectoryLookahead

							trajData.dangerRadius = dangerRadius
							trajData.maxLookahead = maxLookahead

							local forward2D = trajData.forward2D
							local originPos = part.Position
							local centerPos = originPos + forward2D * (maxLookahead / 2)

							-- Khóa cứng độ cao trục Y (lockedVisualY) đã tính và cố định từ khi spawn
							local lockedY = trajData.lockedVisualY or (trajData.rawFloorY and (trajData.rawFloorY + 0.45)) or originPos.Y
							local thickness = trajData.boxThickness or 0.8

							local vPart = activeTrajectoryVisuals[part]
							if not vPart or not vPart.Parent then
								vPart = Instance.new("Part")
								vPart.Name = "SmartDodge_TrajectoryBox"
								vPart.Material = Enum.Material.Neon
								vPart.Color = trajConfig.visualColor or Color3.fromRGB(255, 130, 0)
								vPart.Transparency = 0.82
								vPart.Anchored = true
								vPart.CanCollide = false
								vPart.CanQuery = false
								vPart.CanTouch = false

								local box = Instance.new("SelectionBox")
								box.Name = "TrajectoryBorder"
								box.Color3 = Color3.fromRGB(255, 150, 30)
								box.SurfaceColor3 = trajConfig.visualColor or Color3.fromRGB(255, 130, 0)
								box.SurfaceTransparency = 0.8
								box.LineThickness = 0.04
								box.Adornee = vPart
								box.Parent = vPart

								local bb = Instance.new("BillboardGui")
								bb.Name = "TrajGui"
								bb.Size = UDim2.fromOffset(200, 26)
								bb.StudsOffset = Vector3.new(0, 2.5, 0)
								bb.AlwaysOnTop = true
								bb.Adornee = vPart
								bb.Parent = vPart

								local label = Instance.new("TextLabel")
								label.Name = "Label"
								label.Size = UDim2.fromScale(1, 1)
								label.BackgroundTransparency = 1
								label.TextColor3 = Color3.fromRGB(255, 170, 40)
								label.TextStrokeTransparency = 0
								label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
								label.Font = Enum.Font.GothamBold
								label.TextSize = 12
								label.Text = ("🚀 TRAJECTORY: %s (%.0fm | W:%.1fm)"):format(part.Name, maxLookahead, dangerRadius * 2)
								label.Parent = bb

								activeTrajectoryVisuals[part] = vPart
							end

							vPart.Size = Vector3.new(dangerRadius * 2, thickness, maxLookahead)
							local visualCenter = Vector3.new(centerPos.X, lockedY, centerPos.Z)
							vPart.CFrame = CFrame.lookAt(visualCenter, visualCenter + forward2D)
							vPart.Parent = Workspace.Terrain
						end
					end
				end
			end
		end
	end

	-- Dọn dẹp những part đã hết hạn
	for part, vPart in pairs(activeTrajectoryVisuals) do
		if not currentActiveParts[part] then
			pcall(function() vPart:Destroy() end)
			activeTrajectoryVisuals[part] = nil
			lockedProjectiles[part] = nil
		end
	end
end

--// Bắt đầu quét & lắng nghe sự kiện Workspace cấp 1 (được engine gọi khi StartEngine)
function detection.StartScan()
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

	if logHazards then
		print("[SmartDodge] 📡 Threat Detector & Safe Spot Engine started!")
	end
end

--// Dừng quét, dọn hazards và connection (được engine gọi khi StopEngine/Shutdown)
function detection.StopScan()
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

	if logHazards then
		print("[SmartDodge] 🛑 Threat Detector stopped.")
	end
end

--// Public accessors (facade chỉ proxy)
function detection.SetLogHazards(state)
	logHazards = state and true or false
end

function detection.IsLogHazardsEnabled()
	return logHazards
end

function detection.SetVisualEsp(state)
	visualEspEnabled = state and true or false
	detection.UpdateTrajectoryVisuals()
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

function detection.IsVisualEspEnabled()
	return visualEspEnabled
end

function detection.GetHazardCount()
	return hazardCount
end

function detection.GetActiveHazards()
	local list = {}
	for _, data in pairs(activeHazards) do
		if data.Instance and data.Instance.Parent == Workspace then
			table.insert(list, data)
		end
	end
	return list
end

function detection.GetLastHazardInfo()
	return lastHazardInfo
end

function detection.OnHazardChanged(callback)
	if type(callback) ~= "function" then return end
	table.insert(hazardChangedCallbacks, callback)
end

return detection