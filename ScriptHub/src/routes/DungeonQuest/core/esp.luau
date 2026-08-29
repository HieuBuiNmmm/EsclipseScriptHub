-- Highlight hitbox (ESP SelectionBox) cho DungeonQuest.
-- Quét Workspace mỗi 0.5s, vẽ viền đỏ cho các mục tiêu hitbox.
-- Khi tắt: dừng quét và xóa toàn bộ box đã tạo.

--// Table
local esp = {}

--// Configuration
local targetNames = {
	["poisonCircle"] = true,
	["spearmanHitbox"] = true,
	["battleMageOrb"] = true,
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

local function applyESP(obj)
	if targetNames[obj.Name] then
		createBox(obj)
		return
	end

	if obj.Name == "hitBox" and obj.Parent and obj.Parent.Name == "mushroomWizardShot" then
		createBox(obj)
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
		if scanThread then scanThread:Cancel() end
		scanThread = task.spawn(function()
			local Workspace = game:GetService("Workspace")
			while enabled do
				local ok, err = pcall(function()
					for _, obj in ipairs(Workspace:GetDescendants()) do
						applyESP(obj)
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
		if scanThread then scanThread:Cancel(); scanThread = nil end
		local ok = pcall(removeESPFolder)
		if not ok then warn("[ESP] cleanup error") end
	end
end

function esp.IsEnabled()
	return enabled
end

return esp
