-- ESP hitbox cho DungeonQuest.
-- Đang làm mới: chỉ giữ Player/Enemy Hitbox (Real/Custom) là hoạt động.
-- Phần Show Hitbox Skill (enemy) sẽ được viết lại trong bước tiếp theo.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")

--// Table
local esp = {}

--// Configuration
local LINE_THICKNESS = 0.05
local SURFACE_TRANSPARENCY = 0.8

local PLAYER_BOX_COLOR = Color3.fromRGB(0, 255, 0)
local PLAYER_BOX_NAME = "PlayerHitbox_ESP"

local ENEMY_BOX_COLOR = Color3.fromRGB(255, 0, 0)
local ENEMY_BOX_NAME = "EnemyHitbox_ESP"

--// Hitbox mode constants
local HITBOX_MODE_REAL = "Real"
local HITBOX_MODE_CUSTOM = "Custom"

--// State
local playerBoxEnabled = false
local playerBoxThread = nil
local playerBoxMode = HITBOX_MODE_REAL
local playerBoxScale = 1.5
local player = services.player

local enemyBoxEnabled = false
local enemyBoxThread = nil
local enemyBoxMode = HITBOX_MODE_REAL
local enemyBoxScale = 1.5

--// Tạo SelectionBox bám vào một adornee (Root hoặc proxy part).
local function createSelectionBox(boxName, adornee, color)
	local box = Instance.new("SelectionBox")
	box.Name = boxName
	box.Adornee = adornee
	box.Color3 = color
	box.LineThickness = LINE_THICKNESS * 4
	box.SurfaceColor3 = color
	box.SurfaceTransparency = SURFACE_TRANSPARENCY
	box.Parent = adornee
end

--// Cập nhật box cho một Root theo mode hiện tại.
--// REAL: SelectionBox bám trực tiếp Root (kích thước thật).
--// CUSTOM: proxy part vô hình kích thước = Root.Size * scale, bám theo Root.
local function updateEntityBox(boxName, root, color, mode, scale)
	if not root or not root.Parent then return end
	local proxyName = boxName .. "_Proxy"
	local existingBox = root:FindFirstChild(boxName)
	local existingProxy = root:FindFirstChild(proxyName)

	if mode == HITBOX_MODE_CUSTOM then
		if existingBox and existingBox:IsA("SelectionBox") and existingBox.Adornee == root then
			existingBox:Destroy()
		end

		if not existingProxy then
			existingProxy = Instance.new("Part")
			existingProxy.Name = proxyName
			existingProxy.Anchored = true
			existingProxy.CanCollide = false
			existingProxy.CanQuery = false
			existingProxy.CanTouch = false
			existingProxy.Transparency = 1
			existingProxy.Parent = root
			createSelectionBox(boxName, existingProxy, color)
		end

		local rootSize = root.Size
		local maxDim = math.max(math.abs(rootSize.X), math.abs(rootSize.Y), math.abs(rootSize.Z))
		local customSize = math.max(maxDim * scale, 1)
		existingProxy.Size = Vector3.new(customSize, customSize, customSize)
		existingProxy.CFrame = root.CFrame
	else
		if existingProxy then existingProxy:Destroy() end
		if existingBox and existingBox:IsA("SelectionBox") and existingBox.Adornee ~= root then
			existingBox:Destroy()
			existingBox = nil
		end
		if not existingBox or not existingBox:IsA("SelectionBox") or existingBox.Adornee ~= root then
			createSelectionBox(boxName, root, color)
		end
	end
end

--// Highlight hitbox THẬT của player (quanh HumanoidRootPart) để phân biệt với
--// "ghost" (bản nhân vật ảo hiển thị khi teleport orbit). Màu xanh lá, khác hẳn
--// hitbox enemy đỏ. Tự bám theo nhân vật khi respawn.
local function attachPlayerBox()
	local character = player and player.Character
	local root = character and character:FindFirstChild("HumanoidRootPart")
	if not root or not root.Parent then return end
	updateEntityBox(PLAYER_BOX_NAME, root, PLAYER_BOX_COLOR, playerBoxMode, playerBoxScale)
end

local function clearPlayerBox()
	if playerBoxThread then task.cancel(playerBoxThread); playerBoxThread = nil end
	local function clearCharacter(character)
		if not character then return end
		for _, desc in ipairs(character:GetDescendants()) do
			if desc.Name == PLAYER_BOX_NAME or desc.Name == PLAYER_BOX_NAME .. "_Proxy" then
				desc:Destroy()
			end
		end
	end
	clearCharacter(player and player.Character)
	for _, p in ipairs(services.Players:GetPlayers()) do
		clearCharacter(p.Character)
	end
end

function esp.TogglePlayerHitbox(state)
	if state == playerBoxEnabled then return end
	playerBoxEnabled = state

	if playerBoxEnabled then
		if playerBoxThread then task.cancel(playerBoxThread); playerBoxThread = nil end
		playerBoxThread = task.spawn(function()
			while playerBoxEnabled do
				local ok, err = pcall(attachPlayerBox)
				if not ok then
					if os.clock() - (esp.lastPlayerWarn or 0) > 5 then
						esp.lastPlayerWarn = os.clock()
						warn("[PlayerHitbox] error:", tostring(err))
					end
				end
				services.RunService.Heartbeat:Wait()
			end
		end)
	else
		clearPlayerBox()
	end
end

function esp.IsPlayerHitboxEnabled()
	return playerBoxEnabled
end

function esp.GetPlayerHitboxMode()
	return playerBoxMode
end

function esp.SetPlayerHitboxMode(mode)
	if mode ~= HITBOX_MODE_REAL and mode ~= HITBOX_MODE_CUSTOM then return end
	playerBoxMode = mode
end

function esp.GetPlayerHitboxScale()
	return playerBoxScale
end

function esp.SetPlayerHitboxScale(scale)
	playerBoxScale = scale
end

--// Highlight hitbox THẬT của từng enemy đang track (quanh Root) khi ENGAGE.
--// Màu đỏ, dày như player hitbox, dùng chung cơ chế SelectionBox nhưng tự
--// bám theo enemy model khi di chuyển/spawn.
local function attachEnemyBoxes()
	for _, data in ipairs(shared.GetTrackedEnemyData()) do
		local root = data.Root
		if root and root.Parent then
			updateEntityBox(ENEMY_BOX_NAME, root, ENEMY_BOX_COLOR, enemyBoxMode, enemyBoxScale)
		end
	end
end

local function clearEnemyBoxes()
	if enemyBoxThread then task.cancel(enemyBoxThread); enemyBoxThread = nil end
	for _, obj in ipairs(game:GetService("Workspace"):GetDescendants()) do
		local box = obj:FindFirstChild(ENEMY_BOX_NAME)
		local proxy = obj:FindFirstChild(ENEMY_BOX_NAME .. "_Proxy")
		if box then box:Destroy() end
		if proxy then proxy:Destroy() end
	end
end

function esp.ToggleEnemyHitbox(state)
	if state == enemyBoxEnabled then return end
	enemyBoxEnabled = state

	if enemyBoxEnabled then
		if enemyBoxThread then task.cancel(enemyBoxThread); enemyBoxThread = nil end
		enemyBoxThread = task.spawn(function()
			while enemyBoxEnabled do
				local ok, err = pcall(attachEnemyBoxes)
				if not ok then
					if os.clock() - (esp.lastEnemyWarn or 0) > 5 then
						esp.lastEnemyWarn = os.clock()
						warn("[EnemyHitbox] error:", tostring(err))
					end
				end
				services.RunService.Heartbeat:Wait()
			end
		end)
	else
		clearEnemyBoxes()
	end
end

function esp.IsEnemyHitboxEnabled()
	return enemyBoxEnabled
end

function esp.GetEnemyHitboxMode()
	return enemyBoxMode
end

function esp.SetEnemyHitboxMode(mode)
	if mode ~= HITBOX_MODE_REAL and mode ~= HITBOX_MODE_CUSTOM then return end
	enemyBoxMode = mode
end

function esp.GetEnemyHitboxScale()
	return enemyBoxScale
end

function esp.SetEnemyHitboxScale(scale)
	enemyBoxScale = scale
end

--// ===== Show Hitbox Skill (enemy) — dạng 1: chiêu cast từ enemy =====
--// Cách nhận diện: skill model có chứa marker "precast" (telegraph) — precast làm chủ.
--// Cách hiển thị: phủ theo MESH THẬT — clone nguyên đối tượng (giữ MeshId/Shape/Union),
--// set màu Neon + trong suốt + bám theo CFrame/Size từng frame.

--// Config
local SKILL_BOX_COLOR = Color3.fromRGB(255, 200, 0)
local SKILL_PROXY_TRANSPARENCY = 0.6
local SKILL_PROXY_PREFIX = "SkillHitbox_Mesh_"
local SKILL_SCAN_INTERVAL = 0.1
local SKILL_TRANSPARENCY_VISIBLE_THRESHOLD = 0.55

--// Tên object dùng để nhận diện skill model. "precast" làm chủ (dạng 1);
--// hitBox/hitBot giữ làm marker phụ để bắt skill model.
local SKILL_MARKER_NAMES = {
	["precast"] = true,
	["hitBot"] = true,
}

--// Dạng 2 — skill summon trên bản đồ: danh sách tên cố định. Render:
--// Model -> Highlight bám mesh; part đơn lẻ -> box; ngoại lệ (orb hình cầu) -> mesh proxy.
local SUMMON_SKILL_NAMES = {
	["firstBossCrissCross"] = true,
	["firstBossBigSpike"] = true,
	["firstBossSeekingSpikes"] = true,
	["secondBossMovingBeam"] = true,
}

--// Tên child chứa hitbox của orb (MeshPart) — box đúng object này.
local SUMMON_HITBOX_CHILD_NAME = "ColorblindRune"

local SUMMON_SKILL_MESH_PART_NAMES = {
	["secondBossGreenOrb"] = true,
	["secondBossRedOrb"] = true,
	["secondBossYellowOrb"] = true,
}
local SUMMON_BOX_PREFIX = "SkillHitbox_SummonBox_"
local SUMMON_BOX_TRANSPARENCY = 0.5
local SUMMON_BOX_SCALE = 1.05
local SUMMON_HIGHLIGHT_TRANSPARENCY = 0.45
local SUMMON_HIGHLIGHT_OUTLINE_TRANSPARENCY = 0.2

--// State
local skillHitboxEnabled = false
local skillScanThread = nil
local skillMarkerCache = setmetatable({}, { __mode = "k" })
local skillLifeConnections = setmetatable({}, { __mode = "k" })
local skillProxyState = setmetatable({}, { __mode = "k" })
local skillDebugSeen = setmetatable({}, { __mode = "k" })

--// Resolve BasePart thật từ một object (Part/MeshPart/UnionOperation hoặc Model chứa part).
local function resolveSkillPart(obj)
	if obj:IsA("BasePart") then return obj end
	if obj:IsA("Model") then
		local primary = obj.PrimaryPart
		if primary then return primary end
		for _, desc in ipairs(obj:GetDescendants()) do
			if desc:IsA("BasePart") then return desc end
		end
	end
	return nil
end

--// Tạo proxy phủ theo mesh: clone nguyên đối tượng (giữ mesh/shape/union thật),
--// đổi màu Neon + trong suốt, không va chạm, tự bám theo CFrame/Size.
local function createMeshProxy(target, color)
	if not target:IsA("BasePart") then return nil end

	local existing = skillProxyState[target]
	if existing and existing.Proxy and existing.Proxy.Parent then
		return existing.Proxy
	end

	local proxy = target:Clone()
	proxy.Name = SKILL_PROXY_PREFIX .. target.Name
	proxy.Anchored = true
	proxy.CanCollide = false
	proxy.CanQuery = false
	proxy.CanTouch = false
	proxy.Material = Enum.Material.Neon
	proxy.Color = color
	proxy.CFrame = target.CFrame
	proxy.Transparency = SKILL_PROXY_TRANSPARENCY
	proxy.Parent = target

	--// Xóa texture/decal để màu Neon phủ đồng đều lên mesh thật
	for _, desc in ipairs(proxy:GetDescendants()) do
		if desc:IsA("SurfaceAppearance") or desc:IsA("Texture") or desc:IsA("Decal") then
			desc:Destroy()
		end
	end

	local conns = {
		target:GetPropertyChangedSignal("CFrame"):Connect(function()
			if proxy and proxy.Parent then proxy.CFrame = target.CFrame end
		end),
		target:GetPropertyChangedSignal("Size"):Connect(function()
			if proxy and proxy.Parent then proxy.Size = target.Size end
		end),
	}
	skillProxyState[target] = { Proxy = proxy, Connections = conns }
	return proxy
end

--// Bật/tắt hiển thị proxy (dùng Transparency)
local function setSkillProxyVisible(proxy, visible)
	if not proxy then return end
	proxy.Transparency = if visible then SKILL_PROXY_TRANSPARENCY else 1
end

--// Dạng 2 — tạo box phủ tạm thời: Part Block Neon trong suốt, bám theo CFrame/Size.
local function createSummonBox(target, color)
	if not target:IsA("BasePart") then return nil end

	local existing = skillProxyState[target]
	if existing and existing.Proxy and existing.Proxy.Parent then
		return existing.Proxy
	end

	local box = Instance.new("Part")
	box.Name = SUMMON_BOX_PREFIX .. target.Name
	box.Shape = Enum.PartType.Block
	box.Anchored = true
	box.CanCollide = false
	box.CanQuery = false
	box.CanTouch = false
	box.Material = Enum.Material.Neon
	box.Color = color
	box.Transparency = SUMMON_BOX_TRANSPARENCY
	box.Size = target.Size * SUMMON_BOX_SCALE
	box.CFrame = target.CFrame
	box.Parent = target

	local conns = {
		target:GetPropertyChangedSignal("CFrame"):Connect(function()
			if box and box.Parent then box.CFrame = target.CFrame end
		end),
		target:GetPropertyChangedSignal("Size"):Connect(function()
			if box and box.Parent then box.Size = target.Size * SUMMON_BOX_SCALE end
		end),
	}
	skillProxyState[target] = { Proxy = box, Connections = conns }
	return box
end

--// Dạng 2 — Highlight cho Model (như secondBossMovingBeam): 1 Highlight bám đúng
--// mesh từng part, tự động theo chuyển động/xoay (render native, gần như 0 lag),
--// thay box GetBoundingBox (bự + lệch) và phủ mesh clone (lag).
local function createSummonModelHighlight(model, color)
	if not model:IsA("Model") then return nil end

	local existing = skillProxyState[model]
	if existing and existing.Proxy and existing.Proxy.Parent then
		return existing.Proxy
	end

	local highlight = Instance.new("Highlight")
	highlight.Name = SUMMON_BOX_PREFIX .. model.Name
	highlight.Adornee = model
	highlight.FillColor = color
	highlight.FillTransparency = SUMMON_HIGHLIGHT_TRANSPARENCY
	highlight.OutlineColor = color
	highlight.OutlineTransparency = SUMMON_HIGHLIGHT_OUTLINE_TRANSPARENCY
	highlight.Parent = model

	skillProxyState[model] = { Proxy = highlight, Connections = {} }
	return highlight
end

--// Theo dõi vòng đời precast: HIỆN ngay khi part xuất hiện, ẨN khi fade-out cuối chiêu.
local function watchSkillLife(part, proxy)
	if not part or not proxy or skillLifeConnections[part] then return end
	setSkillProxyVisible(proxy, true)
	skillLifeConnections[part] = part:GetPropertyChangedSignal("Transparency"):Connect(function()
		if part.Transparency > SKILL_TRANSPARENCY_VISIBLE_THRESHOLD and proxy and proxy.Parent then
			setSkillProxyVisible(proxy, false)
		end
	end)
end

--// Nhận diện skill model dạng 1: model có chứa marker precast/hitBox/hitBot bên trong.
local function hasSkillMarker(root)
	if not root then return false end
	local cached = skillMarkerCache[root]
	if cached ~= nil then return cached end

	local found = false
	for _, obj in ipairs(root:GetDescendants()) do
		if SKILL_MARKER_NAMES[obj.Name] then
			found = true
			break
		end
	end
	skillMarkerCache[root] = found
	return found
end

--// Thêm proxy phủ mesh cho tất cả marker precast trong một skill model.
local function addSkillHitboxes(skillModel)
	for _, obj in ipairs(skillModel:GetDescendants()) do
		if SKILL_MARKER_NAMES[obj.Name] then
			local target = resolveSkillPart(obj)
			if target then
				local proxy = createMeshProxy(target, SKILL_BOX_COLOR)
				if proxy then
					watchSkillLife(target, proxy)
				end
			end
		end
	end
end

--// Hàm trả tên skill summon mà `name` chứa (khớp mọi cấp nesting, chịu hậu tố clone).
local function matchSummonName(name)
	for skillName in pairs(SUMMON_SKILL_NAMES) do
		if string.find(name, skillName, 1, true) then
			return skillName
		end
	end
	return nil
end

--// Log chẩn đoán chỉ 1 lần cho mỗi object (spawn mới sẽ log lại).
local function skillDebugLog(obj, message)
	if skillDebugSeen[obj] then return end
	skillDebugSeen[obj] = true
	warn("[SkillHitbox] " .. obj:GetFullName() .. " :: " .. message)
end

--// Quét Workspace: mọi chiêu cast đều xuất hiện trong Workspace. Tìm skill model
--// (có marker) ở mọi cấp, kể cả bị lồng trong object khác.
local function scanSkillHitboxes()
	local Workspace = game:GetService("Workspace")
	for _, child in ipairs(Workspace:GetChildren()) do
		if hasSkillMarker(child) then
			addSkillHitboxes(child)
		end
		for _, obj in ipairs(child:GetDescendants()) do
			if hasSkillMarker(obj) then
				addSkillHitboxes(obj)
			end
		end
	end

	--// Dạng 2: tìm object trong Workspace mà TÊN CÓ CHỨA một trong SUMMON_SKILL_NAMES
	--// (khớp contains để bắt cả trường hợp clone đổi hậu tố như "secondBossGreenOrb (1)").
	for _, obj in ipairs(Workspace:GetDescendants()) do
		local matchedSkill = matchSummonName(obj.Name)
		if matchedSkill then
			--// Model -> Highlight bám mesh; orb (chứa child ColorblindRune) -> box đúng child;
			--// còn lại -> box theo part.
			if SUMMON_SKILL_MESH_PART_NAMES[matchedSkill] then
				local orbPart = obj.Name == SUMMON_HITBOX_CHILD_NAME and obj or nil
				if not orbPart then
					for _, desc in ipairs(obj:GetDescendants()) do
						if desc.Name == SUMMON_HITBOX_CHILD_NAME then
							orbPart = desc
							break
						end
					end
				end
				if orbPart then
					skillDebugLog(obj, ("khớp %q | class=%s | child ColorblindRune: %s | size=%s")
						:format(matchedSkill, obj.ClassName, orbPart:GetFullName(), tostring(orbPart.Size)))
					createSummonBox(orbPart, SKILL_BOX_COLOR)
				else
					skillDebugLog(obj, ("khớp %q | KHÔNG tìm thấy child %q — liệt kê descendants:")
						:format(matchedSkill, SUMMON_HITBOX_CHILD_NAME))
					for _, desc in ipairs(obj:GetDescendants()) do
						warn("[SkillHitbox]   ancestor=" .. desc:GetFullName())
					end
				end
			elseif obj:IsA("Model") then
				skillDebugLog(obj, ("khớp %q | Model -> Highlight (children=%d)")
					:format(matchedSkill, #obj:GetChildren()))
				createSummonModelHighlight(obj, SKILL_BOX_COLOR)
			else
				local target = resolveSkillPart(obj)
				if target then
					skillDebugLog(obj, ("khớp %q | part -> box | class=%s | size=%s")
						:format(matchedSkill, target.ClassName, tostring(target.Size)))
					createSummonBox(target, SKILL_BOX_COLOR)
				else
					skillDebugLog(obj, ("khớp %q | KHÔNG resolve được BasePart") :format(matchedSkill))
				end
			end
		end
	end
end

--// Dọn toàn bộ trạng thái skill hitbox (thread, cache, connection, proxy).
local function cleanupSkillHitbox()
	if skillScanThread then task.cancel(skillScanThread); skillScanThread = nil end
	table.clear(skillMarkerCache)
	for _, connection in pairs(skillLifeConnections) do
		pcall(function() connection:Disconnect() end)
	end
	table.clear(skillLifeConnections)
	for target, state in pairs(skillProxyState) do
		for _, conn in ipairs(state.Connections) do
			pcall(function() conn:Disconnect() end)
		end
		if state.Proxy then
			pcall(function() state.Proxy:Destroy() end)
		end
	end
	table.clear(skillProxyState)
	table.clear(skillDebugSeen)

	--// Dọn các proxy còn sót trong Workspace theo prefix (phòng trường hợp bỏ sót cache)
	for _, obj in ipairs(game:GetService("Workspace"):GetDescendants()) do
		for _, child in ipairs(obj:GetChildren()) do
			if string.sub(child.Name, 1, #SKILL_PROXY_PREFIX) == SKILL_PROXY_PREFIX
				or string.sub(child.Name, 1, #SUMMON_BOX_PREFIX) == SUMMON_BOX_PREFIX then
				child:Destroy()
			end
		end
	end
end

function esp.ToggleSkillHitbox(state)
	if state == skillHitboxEnabled then return end
	skillHitboxEnabled = state

	if skillHitboxEnabled then
		cleanupSkillHitbox()
		skillScanThread = task.spawn(function()
			local Workspace = game:GetService("Workspace")
			while skillHitboxEnabled do
				local ok, err = pcall(scanSkillHitboxes)
				if not ok then
					if os.clock() - (esp.lastSkillWarn or 0) > 5 then
						esp.lastSkillWarn = os.clock()
						warn("[SkillHitbox] error:", tostring(err))
					end
				end
				task.wait(SKILL_SCAN_INTERVAL)
			end
		end)
	else
		cleanupSkillHitbox()
	end
end

function esp.IsSkillHitboxEnabled()
	return skillHitboxEnabled
end

--// ===== Auto Attack Tracker (chế độ tự động — tách riêng khỏi name-based) =====
--// Chỉ highlight object MỚI xuất hiện khi đang có enemy (in combat).
--// Idle -> re-baseline toàn Workspace làm "nền tĩnh"; object sống quá
--// AUTO_BASELINE_EXPIRE giây trong combat -> coi như tĩnh, gỡ highlight.
--// Filter loại: player char, Model chứa Humanoid, tên trùng enemy, proxy của ta.

local AUTO_HIGHLIGHT_COLOR = SKILL_BOX_COLOR
local AUTO_HIGHLIGHT_PREFIX = "SkillHitbox_Auto_"
local AUTO_SCAN_INTERVAL = 0.1
local AUTO_BASELINE_EXPIRE = 10
local AUTO_SELECTION_TRANSPARENCY = 0.8
local AUTO_SELECTION_LINE_THICKNESS = 0.2

local autoTrackerEnabled = false
local autoTrackerThread = nil
local autoBaseline = setmetatable({}, { __mode = "k" }) -- object -> đã có sẵn/tĩnh
local autoFirstSeen = setmetatable({}, { __mode = "k" }) -- object -> lần đầu gặp trong combat
local autoHighlightState = setmetatable({}, { __mode = "k" }) -- object -> SelectionBox
local autoAssigned = setmetatable({}, { __mode = "k" }) -- object đã gán box -> không gán lại
local autoTotalDetected = 0 -- tổng object mới phát hiện (đòn đánh tiềm năng)
local autoLobbyDisconnect = nil -- disconnect OnLobbyChanged

local function createAutoSelectionBox(target, color)
	local existing = autoHighlightState[target]
	if existing and existing.Parent then return existing end

	local box = Instance.new("SelectionBox")
	box.Name = AUTO_HIGHLIGHT_PREFIX .. target.Name
	box.Adornee = target
	box.Color3 = color
	box.LineThickness = LINE_THICKNESS * 4
	box.SurfaceColor3 = color
	box.SurfaceTransparency = AUTO_SELECTION_TRANSPARENCY
	box.Parent = target
	autoHighlightState[target] = box
	return box
end

local function removeAutoSelectionBox(target)
	local box = autoHighlightState[target]
	if box then pcall(function() box:Destroy() end) end
	autoHighlightState[target] = nil
end

--// Dọn TẤT CẢ SelectionBox của một attack object (base/descendants).
local function cleanupAutoAttackBoxes(attackObj)
	local targets = {}
	targets[attackObj] = true
	if attackObj:IsA("Model") then
		for _, desc in ipairs(attackObj:GetDescendants()) do
			targets[desc] = true
		end
	end
	for target in pairs(targets) do
		if autoHighlightState[target] then
			removeAutoSelectionBox(target)
		end
	end
end

--// Danh sách tên child BẠN KHÔNG VẼ SelectionBox dù đó là BasePart.
--// Bỏ qua hoàn toàn, không box.
local AUTO_SELECTION_EXCLUDE_NAMES = {
	["primary"] = true,
}

--// Resolve tất cả BasePart cần gắn SelectionBox: ưu tiên child "precast",
--// nếu không có thì tất cả BasePart con (trừ child trong EXCEPTION).
local function resolveAutoSelectionTargets(obj)
	local targets = {}
	if not (obj:IsA("BasePart") or obj:IsA("Model")) then return targets end

	if obj:IsA("BasePart") then
		table.insert(targets, obj)
		return targets
	end

	--// Model: tìm precast trước; nếu không có, lấy toàn bộ BasePart con (trừ exception).
	for _, desc in ipairs(obj:GetDescendants()) do
		if desc.Name == "precast" and desc:IsA("BasePart") then
			table.insert(targets, desc)
			return targets
		end
	end
	for _, desc in ipairs(obj:GetDescendants()) do
		if desc:IsA("BasePart") and not AUTO_SELECTION_EXCLUDE_NAMES[desc.Name] then
			table.insert(targets, desc)
		end
	end
	return targets
end

--// Danh sách tên object KHÔNG VẼ SelectionBox dù có BasePart con.
--// Overlay effect / helper → bỏ qua hoàn toàn.
local AUTO_SKIP_OBJECT_NAMES = {
	["npcDeathEffect"] = true,
	["playerDeathEffect"] = true,
}

local function shouldSkipAutoObject(obj, enemyNames)
	if not (obj:IsA("BasePart") or obj:IsA("Model")) then return true end
	if player.Character and obj:IsDescendantOf(player.Character) then return true end
	if obj:IsA("Model") and obj:FindFirstChildOfClass("Humanoid") then return true end
	if enemyNames[obj.Name] then return true end
	if string.find(obj.Name, "SkillHitbox_", 1, true) then return true end
	if AUTO_SKIP_OBJECT_NAMES[obj.Name] then return true end
	return false
end

local function runAutoScan()
	local Workspace = game:GetService("Workspace")
	local now = os.clock()
	local inCombat = #shared.GetTrackedEnemyData() > 0 and not shared.IsInLobby()

	if not inCombat then
		--// Idle: gấp mọi child cấp 1 hiện có vào baseline, dọn box cũ.
		for _, obj in ipairs(Workspace:GetChildren()) do
			autoBaseline[obj] = true
		end
		--// Thu thập targets trước, rồi mới dọn.
		local targets = {}
		for target in pairs(autoHighlightState) do
			targets[#targets + 1] = target
		end
		for _, target in ipairs(targets) do
			removeAutoSelectionBox(target)
		end
		table.clear(autoFirstSeen)
		return
	end

	local enemyNames = {}
	for _, name in ipairs(shared.GetEnemyNames()) do
		enemyNames[name] = true
	end

	for _, obj in ipairs(Workspace:GetChildren()) do
		if autoBaseline[obj] then continue end
		--// Đã gán box rồi -> không gán lại; chỉ kiểm tra hết hạn để gỡ.
		if autoAssigned[obj] then
			if now - autoFirstSeen[obj] > AUTO_BASELINE_EXPIRE then
				cleanupAutoAttackBoxes(obj)
				autoBaseline[obj] = true
				autoFirstSeen[obj] = nil
				autoAssigned[obj] = nil
			end
			continue
		end
		if shouldSkipAutoObject(obj, enemyNames) then
			autoBaseline[obj] = true
		else
			if not autoFirstSeen[obj] then
				autoFirstSeen[obj] = now
				autoTotalDetected += 1
			end
			local selTargets = resolveAutoSelectionTargets(obj)
			for _, selTarget in ipairs(selTargets) do
				createAutoSelectionBox(selTarget, AUTO_HIGHLIGHT_COLOR)
			end
			if obj:IsA("Model") then
				for _, d in ipairs(obj:GetDescendants()) do
					autoBaseline[d] = true
				end
			end
			autoAssigned[obj] = true
		end
	end
end

local function cleanupAutoTracker()
	if autoTrackerThread then task.cancel(autoTrackerThread); autoTrackerThread = nil end
	if autoLobbyDisconnect then pcall(autoLobbyDisconnect); autoLobbyDisconnect = nil end
	--// Thu thập targets trước, rồi mới dọn (tránh modify table khi iterate).
	local targets = {}
	for target in pairs(autoHighlightState) do
		targets[#targets + 1] = target
	end
	for _, target in ipairs(targets) do
		removeAutoSelectionBox(target)
	end
	table.clear(autoHighlightState)
	table.clear(autoBaseline)
	table.clear(autoFirstSeen)
	table.clear(autoAssigned)
	autoTotalDetected = 0

	for _, o in ipairs(game:GetService("Workspace"):GetDescendants()) do
		for _, c in ipairs(o:GetChildren()) do
			if string.sub(c.Name, 1, #AUTO_HIGHLIGHT_PREFIX) == AUTO_HIGHLIGHT_PREFIX then
				c:Destroy()
			end
		end
	end
end

--// Snapshot baseline: mọi child cấp 1 hiện có coi là "nền tĩnh" — các object mới
--// xuất hiện sau đó mới được xét. Gọi ở chỗ bắt đầu game (khi rời lobby).
local function rebuildAutoBaseline()
	local Workspace = game:GetService("Workspace")
	table.clear(autoBaseline)
	table.clear(autoFirstSeen)
	table.clear(autoAssigned)
	--// Thu thập targets trước, rồi mới dọn.
	local targets = {}
	for target in pairs(autoHighlightState) do
		targets[#targets + 1] = target
	end
	for _, target in ipairs(targets) do
		removeAutoSelectionBox(target)
	end
	table.clear(autoHighlightState)
	autoTotalDetected = 0
	for _, obj in ipairs(Workspace:GetChildren()) do
		autoBaseline[obj] = true
	end
end

function esp.ToggleAutoSkillHitbox(state)
	if state == autoTrackerEnabled then return end
	autoTrackerEnabled = state

	if autoTrackerEnabled then
		cleanupAutoTracker()

		--// Tín hiệu "start game": khi rời lobby (vào dungeon) -> chụp baseline mới.
		--// Chỉ 1 lần/game; object xuất hiện đúng lúc này là đòn đánh tiềm năng.
		autoLobbyDisconnect = shared.OnLobbyChanged(function(inLobby)
			if not inLobby and autoTrackerEnabled then
				rebuildAutoBaseline()
			end
		end)

		rebuildAutoBaseline()
		autoTrackerThread = task.spawn(function()
			while autoTrackerEnabled do
				local ok, err = pcall(runAutoScan)
				if not ok then
					if os.clock() - (esp.lastAutoWarn or 0) > 5 then
						esp.lastAutoWarn = os.clock()
						warn("[AutoHitbox] error:", tostring(err))
					end
				end
				task.wait(AUTO_SCAN_INTERVAL)
			end
		end)
	else
		cleanupAutoTracker()
	end
end

function esp.IsAutoSkillHitboxEnabled()
	return autoTrackerEnabled
end

--// Trả thông tin Auto Tracker: tổng đòn đánh đã detect + số đang highlight hiện tại.
function esp.GetAutoSkillHitboxInfo()
	local active = 0
	for _ in pairs(autoHighlightState) do
		active += 1
	end
	return autoTotalDetected, active
end

return esp