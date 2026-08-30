-- Highlight hitbox (ESP SelectionBox) cho DungeonQuest.
-- Quét từng child (1 level) của Workspace mỗi 0.5s.
-- Chỉ add ESP cho part có tên `hitBox` nếu bên trong child đó có.

--// Table
local esp = {}

--// Configuration
local HITBOX_NAME = "hitBox"

--// Các skill đặc biệt không có part `hitBox` bên trong, highlight trực tiếp object
local SKILL_NAMES = {
	["firstBossCrissCross"] = true,
	["firstBossSeekingSpikes"] = true,
}

local BOX_COLOR = Color3.fromRGB(255, 0, 0)
local LINE_THICKNESS = 0.05
local SURFACE_TRANSPARENCY = 0.8

local ESP_NAME = "Hitbox_ESP"
local SCAN_INTERVAL = 0.5

--// State
local enabled = false
local scanThread = nil

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

--// Thêm ESP cho root nếu bản thân nó là hitBox/skill đặc biệt, và cho mọi part
--// tên `hitBox` hoặc skill đặc biệt nằm trong hậu duệ của root.
local function addHitboxes(root)
	if root.Name == HITBOX_NAME or SKILL_NAMES[root.Name] then
		createBox(root)
	end
	for _, obj in ipairs(root:GetDescendants()) do
		if obj.Name == HITBOX_NAME or SKILL_NAMES[obj.Name] then
			createBox(obj)
		end
	end
end

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
					--// Quét từng child (1 level) của Workspace; add ESP nếu trong đó có part hitBox
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
		local ok = pcall(removeESPFolder)
		if not ok then warn("[ESP] cleanup error") end
	end
end

function esp.IsEnabled()
	return enabled
end

return esp
