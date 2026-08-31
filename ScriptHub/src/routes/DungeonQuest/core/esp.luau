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

local ESP_NAME = "Hitbox_ESP"
local SCAN_INTERVAL = 0.5

--// State
local enabled = false
local scanThread = nil
local projectileNames = {}

local playerBoxEnabled = false
local playerBoxThread = nil
local player = services.player

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

--// Highlight hitbox THẬT của player (quanh HumanoidRootPart) để phân biệt với
--// "ghost" (bản nhân vật ảo hiển thị khi teleport orbit). Màu xanh lá, khác hẳn
--// hitbox enemy đỏ. Tự bám theo nhân vật khi respawn.
local function attachPlayerBox()
	local character = player and player.Character
	local root = character and character:FindFirstChild("HumanoidRootPart")
	if not root or not root.Parent then return end
	if root:FindFirstChild(PLAYER_BOX_NAME) then return end

	local box = Instance.new("SelectionBox")
	box.Name = PLAYER_BOX_NAME
	box.Adornee = root
	box.Color3 = PLAYER_BOX_COLOR
	box.LineThickness = LINE_THICKNESS * 4
	box.SurfaceColor3 = PLAYER_BOX_COLOR
	box.SurfaceTransparency = SURFACE_TRANSPARENCY
	box.Parent = root
end

local function clearPlayerBox()
	if playerBoxThread then task.cancel(playerBoxThread); playerBoxThread = nil end
	local function clearCharacter(character)
		if not character then return end
		for _, desc in ipairs(character:GetDescendants()) do
			if desc.Name == PLAYER_BOX_NAME then desc:Destroy() end
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
				task.wait(SCAN_INTERVAL)
			end
		end)
	else
		clearPlayerBox()
	end
end

function esp.IsPlayerHitboxEnabled()
	return playerBoxEnabled
end

return esp
