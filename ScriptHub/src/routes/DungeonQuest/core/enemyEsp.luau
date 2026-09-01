-- ESP Enemy (Highlight) cho DungeonQuest.
-- Vẽ highlight phủ toàn bộ model enemy (giống glow Minecraft) đang track trong
-- dungeon, dựa trên shared.GetTrackedEnemyData. Màu cam để phân biệt với ESP
-- hitbox projectile (đỏ) và player hitbox (xanh lá).

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")

--// Table
local enemyEsp = {}

--// Configuration
local FILL_COLOR = Color3.fromRGB(255, 170, 0)
local FILL_TRANSPARENCY = 0.55
local ESP_NAME = "Enemy_ESP"
local SCAN_INTERVAL = 0.5

--// Màu cho highlight (tên hiển thị -> màu thật).
--// Đồng bộ với danh sách option trong tab Visual.
local COLOR_PALETTE = {
	Orange = Color3.fromRGB(255, 170, 0),
	Red = Color3.fromRGB(255, 0, 0),
	Yellow = Color3.fromRGB(255, 255, 0),
	Green = Color3.fromRGB(0, 255, 0),
	Cyan = Color3.fromRGB(0, 255, 255),
	Blue = Color3.fromRGB(0, 120, 255),
	Magenta = Color3.fromRGB(255, 0, 255),
	White = Color3.fromRGB(255, 255, 255),
}

--// State
local enabled = false
local scanThread = nil
local selectedColorName = "Orange"

--// Helpers
local function getFillColor()
	return COLOR_PALETTE[selectedColorName] or FILL_COLOR
end

local function createHighlight(model)
	if not model or not model:IsA("Model") then return end
	if not model:FindFirstChild(ESP_NAME) then
		local hl = Instance.new("Highlight")
		hl.Name = ESP_NAME
		hl.Adornee = model
		hl.FillColor = getFillColor()
		hl.FillTransparency = FILL_TRANSPARENCY
		hl.OutlineColor = getFillColor()
		hl.OutlineTransparency = 1
		hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		hl.Parent = model
	end
end

--// Cập nhật màu cho highlight đã vẽ sẵn (gọi khi đổi màu).
local function updateAllHighlightColors()
	local color = getFillColor()
	for _, obj in ipairs(game:GetService("Workspace"):GetDescendants()) do
		local hl = obj:FindFirstChild(ESP_NAME)
		if hl and hl:IsA("Highlight") then
			hl.FillColor = color
			hl.OutlineColor = color
		end
	end
end

--// Xóa mọi Highlight ESP Enemy giống đã vẽ trong Workspace + nhân vật.
local function removeAllHighlights()
	for _, obj in ipairs(game:GetService("Workspace"):GetDescendants()) do
		local hl = obj:FindFirstChild(ESP_NAME)
		if hl then hl:Destroy() end
	end
	for _, p in ipairs(services.Players:GetPlayers()) do
		local char = p.Character
		if char then
			for _, desc in ipairs(char:GetDescendants()) do
				if desc.Name == ESP_NAME then desc:Destroy() end
			end
		end
	end
end

--// Methods
function enemyEsp.Toggle(state)
	if state == enabled then return end
	enabled = state

	if enabled then
		if scanThread then task.cancel(scanThread); scanThread = nil end
		scanThread = task.spawn(function()
			while enabled do
				local ok, err = pcall(function()
					for _, data in ipairs(shared.GetTrackedEnemyData()) do
						if data.Model and data.Model.Parent then
							createHighlight(data.Model)
						end
					end
				end)
				if not ok then
					if os.clock() - (enemyEsp.lastWarn or 0) > 5 then
						enemyEsp.lastWarn = os.clock()
						warn("[EnemyESP] error:", tostring(err))
					end
				end
				task.wait(SCAN_INTERVAL)
			end
		end)
	else
		if scanThread then task.cancel(scanThread); scanThread = nil end
		local ok = pcall(removeAllHighlights)
		if not ok then warn("[EnemyESP] cleanup error") end
	end
end

function enemyEsp.IsEnabled()
	return enabled
end

function enemyEsp.GetColorNames()
	local names = {}
	for name in pairs(COLOR_PALETTE) do table.insert(names, name) end
	table.sort(names)
	return names
end

function enemyEsp.GetSelectedColor()
	return selectedColorName
end

function enemyEsp.SetSelectedColor(name)
	if not COLOR_PALETTE[name] then return end
	if name == selectedColorName then return end
	selectedColorName = name
	local ok = pcall(updateAllHighlightColors)
	if not ok then warn("[EnemyESP] recolor error") end
end

return enemyEsp
