-- Highlight hitbox (ESP SelectionBox) cho DungeonQuest.
-- Chỉ highlight các object trùng tên với model projectile trong
-- ReplicatedStorage.enemyProjectiles, khi chúng xuất hiện trong Workspace.

--// Table
local esp = {}

--// Configuration
--// ReplicatedStorage.enemyProjectiles là kho lưu model template của enemy.
--// Ta đọc tên các model đó làm danh sách projectile; khi model cùng tên
--// xuất hiện trong Workspace thì highlight đúng vật đang bay.
local PROJECTILE_FOLDER = "enemyProjectiles"

local BOX_COLOR = Color3.fromRGB(255, 0, 0)
local LINE_THICKNESS = 0.05
local SURFACE_TRANSPARENCY = 0.8

local ESP_NAME = "Hitbox_ESP"
local SCAN_INTERVAL = 0.5

--// State
local enabled = false
local scanThread = nil
local projectileNames = {}

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

--// Load danh sách tên projectile từ ReplicatedStorage.enemyProjectiles
--// (bao gồm Model, MeshPart, Part).
local function refreshProjectileNames()
	projectileNames = {}
	local rs = game:GetService("ReplicatedStorage")
	local folder = rs:FindFirstChild(PROJECTILE_FOLDER)
	if not folder then return end
	for _, obj in ipairs(folder:GetChildren()) do
		local cls = obj.ClassName
		if cls == "Model" or cls == "MeshPart" or cls == "Part" then
			projectileNames[obj.Name] = true
		end
	end
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

return esp
