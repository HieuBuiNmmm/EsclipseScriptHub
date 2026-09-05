-- ESP hitbox cho DungeonQuest.
-- Bao gồm Player/Enemy Hitbox (Real/Custom) + Show Skill Hitbox (tạm thời chỉ northernMageShot - precast).

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

--// Chu kỳ quét hiển thị hitbox skill (nhịp cập nhật trực quan).
local SKILL_SCAN_INTERVAL = 0.01

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

--// ========== [Show Skill Hitbox] Vẽ SelectionBox đỏ cho skill trong Workspace ==========
--// Before start: snapshot toàn bộ level-1 child của Workspace vào blacklist (static:
--// dungeon folder, boss parts, arena...). Chỉ BasePart mới xuất hiện SAU mốc đó
--// (skill/attack) mới được vẽ.

local SKILL_ESP_COLOR = Color3.fromRGB(255, 0, 0)
local SKILL_ESP_NAME = "SkillESP"

--// Backlist: level-1 child của Workspace đã tồn tại lúc snapshot -> static.
--// Mọi descendant trong nhánh đó mặc định cũng static (check theo cây ancestor,
--// không cần liệt kê từng phần tử con khi snapshot).
local skillBlackList = {}
--// Mốc snapshot đã xong chưa. Chưa = chưa biết gì là "static" -> không vẽ gì cả.
local skillBlacklistReady = false

local skillBoxEnabled = false
local skillBoxThread = nil

--// Snapshot: blacklist các level-1 child của Workspace hiện tại.
local function snapshotSkillBlacklist()
	table.clear(skillBlackList)
	local Workspace = game:GetService("Workspace")
	for _, child in ipairs(Workspace:GetChildren()) do
		skillBlackList[child] = true
	end
	skillBlacklistReady = true
end

--// [1] Before start: blacklist toàn bộ level-1 child hiện có của Workspace
--// (static: dungeon folder, boss parts, arena...) -> không bị vẽ.
snapshotSkillBlacklist()

--// Kiểm tra part có thuộc character của player không (để bỏ qua, không vẽ).
local function isPlayerPart(part)
	local character = player.Character
	if not character then return false end
	local obj = part
	while obj do
		if obj == character then return true end
		obj = obj.Parent
	end
	return false
end

--// Part nằm trong nhánh của level-1 child đã bị blacklist (static) -> không vẽ.
local function isBlacklistedPart(part)
	local obj = part
	while obj do
		if skillBlackList[obj] then return true end
		obj = obj.Parent
	end
	return false
end

--// Tạo SelectionBox đỏ đơn giản trên BasePart nếu chưa có.
local function createSkillBox(part)
	if not skillBlacklistReady then return end
	if isBlacklistedPart(part) then return end
	if isPlayerPart(part) then return end
	if part:FindFirstChild(SKILL_ESP_NAME) then return end
	local box = Instance.new("SelectionBox")
	box.Name = SKILL_ESP_NAME
	box.Adornee = part
	box.Color3 = SKILL_ESP_COLOR
	box.SurfaceColor3 = SKILL_ESP_COLOR
	box.SurfaceTransparency = 0.8
	box.Parent = part
end

--// Quét toàn bộ descendants, chỉ vẽ BasePart không nằm trong blacklist.
local function scanSkillHitboxes()
	if not skillBlacklistReady then return end
	local Workspace = game:GetService("Workspace")
	for _, child in ipairs(Workspace:GetChildren()) do
		if child:IsA("BasePart") then
			createSkillBox(child)
		end
		for _, desc in ipairs(child:GetDescendants()) do
			if desc:IsA("BasePart") then
				createSkillBox(desc)
			end
		end
	end
end

local function clearSkillBoxes()
	if skillBoxThread then task.cancel(skillBoxThread); skillBoxThread = nil end
	local Workspace = game:GetService("Workspace")
	for _, desc in ipairs(Workspace:GetDescendants()) do
		local box = desc:FindFirstChild(SKILL_ESP_NAME)
		if box then box:Destroy() end
	end
end

function esp.ToggleSkillHitbox(state)
	if state == skillBoxEnabled then return end
	skillBoxEnabled = state
	if skillBoxEnabled then
		if skillBoxThread then task.cancel(skillBoxThread); skillBoxThread = nil end
		skillBoxThread = task.spawn(function()
			while skillBoxEnabled do
				local ok, err = pcall(scanSkillHitboxes)
				if not ok and os.clock() - (esp.lastSkillWarnH or 0) > 5 then
					esp.lastSkillWarnH = os.clock()
					warn("[SkillHitbox] error:", tostring(err))
				end
				task.wait(SKILL_SCAN_INTERVAL)
			end
		end)
	else
		clearSkillBoxes()
	end
end

function esp.IsSkillHitboxEnabled()
	return skillBoxEnabled
end

return esp
