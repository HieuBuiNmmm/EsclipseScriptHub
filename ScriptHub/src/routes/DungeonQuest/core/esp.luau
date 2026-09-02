-- Highlight hitbox (ESP SelectionBox) cho DungeonQuest.
-- Chỉ highlight các object trùng tên với model projectile trong
-- ReplicatedStorage.enemyProjectiles, khi chúng xuất hiện trong Workspace.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")

--// Table
local esp = {}

--// Configuration
local BOX_COLOR = Color3.fromRGB(255, 0, 0)
local LINE_THICKNESS = 0.05
local SURFACE_TRANSPARENCY = 0.8

local PLAYER_BOX_COLOR = Color3.fromRGB(0, 255, 0)
local PLAYER_BOX_NAME = "PlayerHitbox_ESP"

local ENEMY_BOX_COLOR = Color3.fromRGB(255, 0, 0)
local ENEMY_BOX_NAME = "EnemyHitbox_ESP"

local ESP_NAME = "Hitbox_ESP"
local SCAN_INTERVAL = 0.1
local TRANSPARENCY_VISIBLE_THRESHOLD = 0.55

--// Proxy part theo shape: vẽ đúng hình dáng thật (Block/Ball/Cylinder) thay vì hộp.
local PROXY_TRANSPARENCY = 0.55
local SHAPE_PROXY_PREFIX = "Hitbox_ShapeProxy_"

--// Precast Block dùng SelectionBox (outline). Cylinder/Ball dùng proxy mờ nhẹ.
local PRECAST_PROXY_TRANSPARENCY = 0.7

--// Hitbox mode constants
local HITBOX_MODE_REAL = "Real"
local HITBOX_MODE_CUSTOM = "Custom"
local HITBOX_MODE_PRECAST = "precast"
local HITBOX_MODE_PROJECTILE = "Projectile"
local HITBOX_MODE_ALL = "All"

--// Tên object "hitBox"/"hitBot"/"precast" bên trong để nhận diện skill model
local SKILL_MARKER_NAMES = {
	["hitBox"] = true,
	["hitBot"] = true,
	["precast"] = true,
}

--// Màu cho từng object con của skill model trong mode "All".
--// Chỉ precast (telegraph) được tô. hitBox/hitBot chỉ để nhận diện skill model.
local CHILD_BOX_COLORS = {
	precast = Color3.fromRGB(255, 200, 0),
}

local CHILD_BOX_NAME_PREFIX = "Hitbox_ESP_All_"

--// State
local enabled = false
local scanThread = nil
local projectileNames = {}
local hitboxMode = HITBOX_MODE_PRECAST
local skillMarkerCache = setmetatable({}, { __mode = "k" })
local precastLifeConnections = setmetatable({}, { __mode = "k" })
local shapeProxyState = setmetatable({}, { __mode = "k" })

local playerBoxEnabled = false
local playerBoxThread = nil
local playerBoxMode = HITBOX_MODE_REAL
local playerBoxScale = 1.5
local player = services.player

local enemyBoxEnabled = false
local enemyBoxThread = nil
local enemyBoxMode = HITBOX_MODE_REAL
local enemyBoxScale = 1.5

--// Helpers
local function createTypedBox(boxName, targetObj, color)
	local existing = targetObj:FindFirstChild(boxName)
	if existing then return existing end

	local box = Instance.new("SelectionBox")
	box.Name = boxName
	box.Adornee = targetObj
	box.Color3 = color
	box.LineThickness = LINE_THICKNESS
	box.SurfaceColor3 = color
	box.SurfaceTransparency = SURFACE_TRANSPARENCY
	box.Parent = targetObj
	return box
end

local createShapeProxy --// forward declaration: gán bên dưới, dùng trong createBox/createChildBox

local function createBox(targetObj)
	--// Ưu tiên proxy part theo shape thật; fallback về SelectionBox (hộp) nếu không vẽ được theo shape.
	local proxy = createShapeProxy(targetObj, BOX_COLOR)
	if proxy then
		return proxy
	end
	return createTypedBox(ESP_NAME, targetObj, BOX_COLOR)
end

--// Tạo proxy Part kế thừa shape thật (Block/Ball/Cylinder) của part gốc, tự bám
--// theo CFrame/Size mỗi frame. Trả về proxy part (hoặc nil nếu không vẽ được
--// theo shape, ví dụ part không phải 1 trong 3 shape cơ bản).
createShapeProxy = function(targetObj, color, transparency)
	if not (targetObj:IsA("BasePart") and targetObj:IsA("Part")) then
		return nil
	end
	if not (targetObj.Shape == Enum.PartType.Block
		or targetObj.Shape == Enum.PartType.Ball
		or targetObj.Shape == Enum.PartType.Cylinder) then
		return nil
	end

	local existing = shapeProxyState[targetObj]
	if existing and existing.Proxy and existing.Proxy.Parent then
		return existing.Proxy
	end

	local proxy = Instance.new("Part")
	proxy.Name = SHAPE_PROXY_PREFIX .. targetObj.Name
	proxy.Anchored = true
	proxy.CanCollide = false
	proxy.CanQuery = false
	proxy.CanTouch = false
	proxy.Material = Enum.Material.Neon
	proxy.Shape = targetObj.Shape
	proxy.Size = targetObj.Size
	proxy.Color = color
	local proxyTransparency = transparency or PROXY_TRANSPARENCY
	proxy.Transparency = proxyTransparency
	proxy:SetAttribute("ESPTransparency", proxyTransparency)
	proxy.CFrame = targetObj.CFrame
	proxy.Parent = targetObj

	local conns = {
		targetObj:GetPropertyChangedSignal("CFrame"):Connect(function()
			if proxy and proxy.Parent then proxy.CFrame = targetObj.CFrame end
		end),
		targetObj:GetPropertyChangedSignal("Size"):Connect(function()
			if proxy and proxy.Parent then proxy.Size = targetObj.Size end
		end),
	}
	shapeProxyState[targetObj] = { Proxy = proxy, Connections = conns }
	return proxy
end

local function createChildBox(childObj, color)
	--// SelectionBox chỉ bám được BasePart/Attachment -> nếu child là Model
	--// (vd hitBot chứa part bên trong) thì resolve part thật để box hiển thị.
	local target = childObj
	if not (target:IsA("BasePart") or target:IsA("Attachment")) then
		if target:IsA("Model") then
			target = target.PrimaryPart
			if not target then
				for _, desc in ipairs(childObj:GetDescendants()) do
					if desc:IsA("BasePart") then
						target = desc
						break
					end
				end
			end
		end
	end
	if not target then return nil, nil end

	--// Precast: Block dùng SelectionBox (outline khung chữ nhật chuẩn).
	--// Cylinder/Ball mới dùng proxy part mờ nhẹ để giữ đúng shape tròn/trụ.
	if target:IsA("Part") and (target.Shape == Enum.PartType.Cylinder or target.Shape == Enum.PartType.Ball) then
		local proxy = createShapeProxy(target, color, PRECAST_PROXY_TRANSPARENCY)
		if proxy then
			return proxy, target
		end
	end

	local box = createTypedBox(CHILD_BOX_NAME_PREFIX .. childObj.Name, target, color)
	return box, target
end

--// Load danh sách tên projectile từ shared (ReplicatedStorage.enemyProjectiles).
local function refreshProjectileNames()
	projectileNames = shared.GetEnemyProjectileNames()
end

--// Chỉ highlight object trùng tên với danh sách projectile, kể cả khi
--// nằm sâu trong hậu duệ của một object Workspace.
--// 3 mode:
--//   "precast"    -> chỉ box precast (telegraph, hiện khi part xuất hiện, ẩn khi bị xóa)
--//   "Projectile" -> chỉ box projectile (trùng tên trong enemyProjectiles)
--//   "All"        -> hiện cả 2 loại trên
--// Nhận diện skill model cho mode precast/All: model có chứa hitBox/hitBot/precast.

--// Nhận diện skill model: model có chứa hitBox/hitBot/precast bên trong
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

--// Bật/tắt hiển thị cho loại box hiện tại (SelectionBox/Highlight dùng .Visible/.Enabled,
--// proxy part dùng .Transparency - 1 để ẩn).
local function setBoxVisible(box, visible)
	if not box then return end
	if box:IsA("BasePart") then
		box.Transparency = if visible then (box:GetAttribute("ESPTransparency") or PROXY_TRANSPARENCY) else 1
		return
	end
	if box:IsA("Highlight") then
		box.Enabled = visible
	else
		box.Visible = visible
	end
end

--// Box precast: HIỆN ngay lập tức khi part xuất hiện (không chờ Transparency),
--// và ẨN khi part fade-out về > ngưỡng (cuối chiêu) hoặc khi part bị xóa.
--// Điều kiện xuất hiện sớm để bắt đúng lúc vùng chiêu hiện ra (kể cả boss).
local function watchPrecastLife(part, box)
	if not part or not box or precastLifeConnections[part] then return end
	setBoxVisible(box, true)
	precastLifeConnections[part] = part:GetPropertyChangedSignal("Transparency"):Connect(function()
		--// Chỉ ẩn khi Transparency vượt ngưỡng (fade-out cuối chiêu)
		if part.Transparency > TRANSPARENCY_VISIBLE_THRESHOLD and box and box.Parent then
			setBoxVisible(box, false)
		end
	end)
end

local function addPrecastBox(skillModel)
	for _, obj in ipairs(skillModel:GetDescendants()) do
		if CHILD_BOX_COLORS[obj.Name] then
			local box, target = createChildBox(obj, CHILD_BOX_COLORS[obj.Name])
			if box and target then
				watchPrecastLife(target, box)
			end
		end
	end
end

local function addProjectileBox(root)
	if projectileNames[root.Name] then
		createBox(root)
	end
	for _, obj in ipairs(root:GetDescendants()) do
		if projectileNames[obj.Name] then
			createBox(obj)
		end
	end
end

local function addHitboxes(root)
	if hitboxMode == HITBOX_MODE_ALL or hitboxMode == HITBOX_MODE_PRECAST then
		if hasSkillMarker(root) then
			addPrecastBox(root)
		end
		for _, obj in ipairs(root:GetDescendants()) do
			if hasSkillMarker(obj) then
				addPrecastBox(obj)
			end
		end
	end

	if hitboxMode == HITBOX_MODE_ALL or hitboxMode == HITBOX_MODE_PROJECTILE then
		addProjectileBox(root)
	end
end

--// Xóa mọi box ESP đã vẽ trong Workspace (Hitbox_ESP + Hitbox_ESP_All_<child> + shape proxy).
local function removeESPFolder()
	for _, obj in ipairs(game:GetService("Workspace"):GetDescendants()) do
		for _, child in ipairs(obj:GetChildren()) do
			if string.sub(child.Name, 1, #ESP_NAME) == ESP_NAME
				or string.sub(child.Name, 1, #SHAPE_PROXY_PREFIX) == SHAPE_PROXY_PREFIX then
				child:Destroy()
			end
		end
	end
end

--// Dọn sạch toàn bộ shape proxy: hủy proxy part + ngắt connection theo dõi.
local function cleanupShapeProxies()
	for targetObj, state in pairs(shapeProxyState) do
		for _, conn in ipairs(state.Connections) do
			pcall(function() conn:Disconnect() end)
		end
		if state.Proxy then
			pcall(function() state.Proxy:Destroy() end)
		end
	end
	table.clear(shapeProxyState)
end

--// Methods
function esp.Toggle(state)
	if state == enabled then return end
	enabled = state

	if enabled then
		if scanThread then task.cancel(scanThread); scanThread = nil end
		scanThread = task.spawn(function()
			local Workspace = game:GetService("Workspace")
			while enabled do
				local ok, err = pcall(function()
					--// Load danh sách projectile từ storage; quét Workspace và vẽ hitbox
					refreshProjectileNames()
					for _, child in ipairs(Workspace:GetChildren()) do
						addHitboxes(child)
					end
				end)
				if not ok then
					if os.clock() - (esp.lastWarn or 0) > 5 then
						esp.lastWarn = os.clock()
						warn("[ESP] error:", tostring(err))
					end
				end
				task.wait(SCAN_INTERVAL)
			end
		end)
	else
		if scanThread then task.cancel(scanThread); scanThread = nil end
		projectileNames = {}
		table.clear(skillMarkerCache)
		for _, connection in pairs(precastLifeConnections) do
			pcall(function() connection:Disconnect() end)
		end
		table.clear(precastLifeConnections)
		cleanupShapeProxies()
		local ok = pcall(removeESPFolder)
		if not ok then warn("[ESP] cleanup error") end
	end
end

function esp.IsEnabled()
	return enabled
end

function esp.GetHitboxMode()
	return hitboxMode
end

function esp.SetHitboxMode(mode)
	if mode ~= HITBOX_MODE_ALL and mode ~= HITBOX_MODE_PRECAST and mode ~= HITBOX_MODE_PROJECTILE then return end
	hitboxMode = mode
	if enabled then
		table.clear(skillMarkerCache)
		cleanupShapeProxies()
		pcall(removeESPFolder)
	end
end

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

return esp
