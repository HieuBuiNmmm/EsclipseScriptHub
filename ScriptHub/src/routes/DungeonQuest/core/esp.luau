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
local SCAN_INTERVAL = 0.5

--// Hitbox mode constants
local HITBOX_MODE_REAL = "Real"
local HITBOX_MODE_CUSTOM = "Custom"

--// State
local enabled = false
local scanThread = nil
local projectileNames = {}

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
local function createBox(targetObj)
	if not targetObj:FindFirstChild(ESP_NAME) then
		local box = Instance.new("SelectionBox")
		box.Name = ESP_NAME
		box.Adornee = targetObj
		box.Color3 = BOX_COLOR
		box.LineThickness = LINE_THICKNESS
		box.SurfaceColor3 = BOX_COLOR
		box.SurfaceTransparency = SURFACE_TRANSPARENCY
		box.Parent = targetObj
	end
end

--// Load danh sách tên projectile từ shared (ReplicatedStorage.enemyProjectiles).
local function refreshProjectileNames()
	projectileNames = shared.GetEnemyProjectileNames()
end

--// Chỉ highlight object trùng tên với danh sách projectile, kể cả khi
--// nằm sâu trong hậu duệ của một object Workspace.
local function addHitboxes(root)
	if projectileNames[root.Name] then
		createBox(root)
	end
	for _, obj in ipairs(root:GetDescendants()) do
		if projectileNames[obj.Name] then
			createBox(obj)
		end
	end
end

--// Xóa mọi box ESP giống đã vẽ trong Workspace.
local function removeESPFolder()
	for _, obj in ipairs(game:GetService("Workspace"):GetDescendants()) do
		local box = obj:FindFirstChild(ESP_NAME)
		if box then
			box:Destroy()
		end
	end
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
		local ok = pcall(removeESPFolder)
		if not ok then warn("[ESP] cleanup error") end
	end
end

function esp.IsEnabled()
	return enabled
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
