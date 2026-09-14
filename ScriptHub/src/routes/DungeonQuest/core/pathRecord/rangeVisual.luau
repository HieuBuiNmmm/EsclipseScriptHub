-- Path Record System – Range Visual: Vòng tròn trực quan quanh nhân vật
-- giúp người chơi ước lượng phạm vi/tầm đánh của Skill (AOE) để căn điểm record.
-- Đồng thời tự động HIGHLIGHT kẻ địch khi chúng bước vào trong tầm (in-range).

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")

local player = services.player
local RunService = services.RunService
local CoreGui = services.CoreGui or game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")

--// Table
local rangeVisual = {}

--// Bảng màu cho Circle & Highlight
local COLOR_PALETTE = {
	["Cyan"] = Color3.fromRGB(0, 230, 255),
	["Red"] = Color3.fromRGB(255, 60, 60),
	["Orange"] = Color3.fromRGB(255, 140, 0),
	["Yellow"] = Color3.fromRGB(255, 220, 40),
	["Green"] = Color3.fromRGB(0, 255, 120),
	["Emerald"] = Color3.fromRGB(40, 220, 160),
	["Blue"] = Color3.fromRGB(0, 140, 255),
	["Purple"] = Color3.fromRGB(180, 80, 255),
	["Magenta"] = Color3.fromRGB(255, 60, 200),
	["White"] = Color3.fromRGB(255, 255, 255),
}

--// State & Settings
local enabled = false
local rangeRadius = 25 -- Studs (mặc định 25)
local ringThickness = 0.4 -- Độ dày của viền vòng tròn
local fillEnabled = true
local highlightInRange = true -- Highlight quái khi trong tầm (mặc định BẬT)

local selectedCircleColorName = "Cyan"
local selectedHighlightColorName = "Red"

local ringOpacity = 0.8 -- Độ đậm viền ngoài (0.1 - 1.0)
local fillOpacity = 0.15 -- Độ đậm vùng trong (0.0 - 0.5)

local HIGHLIGHT_NAME = "PR_InRange_Highlight"
local ringAdornment = nil
local fillAdornment = nil
local updateConnection = nil
local lastRoot = nil
local activeHighlights = {} -- [model] = Highlight

local function getCircleColor()
	return COLOR_PALETTE[selectedCircleColorName] or COLOR_PALETTE["Cyan"]
end

local function getHighlightColor()
	return COLOR_PALETTE[selectedHighlightColorName] or COLOR_PALETTE["Red"]
end

local function getPlayerRoot()
	local char = player and player.Character
	if not char or not char.Parent then return nil end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then return nil end
	local root = char:FindFirstChild("HumanoidRootPart")
	if root and root.Parent then return root end
	return nil
end

local function cleanupHighlights()
	for model, hl in pairs(activeHighlights) do
		pcall(function() hl:Destroy() end)
	end
	table.clear(activeHighlights)
	pcall(function()
		for _, desc in ipairs(Workspace:GetDescendants()) do
			if desc.Name == HIGHLIGHT_NAME then
				pcall(function() desc:Destroy() end)
			end
		end
	end)
end

local function cleanupAdornments()
	if ringAdornment then
		pcall(function() ringAdornment:Destroy() end)
		ringAdornment = nil
	end
	if fillAdornment then
		pcall(function() fillAdornment:Destroy() end)
		fillAdornment = nil
	end
	lastRoot = nil
	cleanupHighlights()
end

local function ensureAdornments()
	if not ringAdornment or not ringAdornment.Parent then
		pcall(function() if ringAdornment then ringAdornment:Destroy() end end)
		ringAdornment = Instance.new("CylinderHandleAdornment")
		ringAdornment.Name = "PR_SkillRangeRing"
		ringAdornment.AlwaysOnTop = true
		ringAdornment.ZIndex = 5
		ringAdornment.Parent = CoreGui
	end

	if fillEnabled then
		if not fillAdornment or not fillAdornment.Parent then
			pcall(function() if fillAdornment then fillAdornment:Destroy() end end)
			fillAdornment = Instance.new("CylinderHandleAdornment")
			fillAdornment.Name = "PR_SkillRangeFill"
			fillAdornment.AlwaysOnTop = true
			fillAdornment.ZIndex = 4
			fillAdornment.Parent = CoreGui
		end
	else
		if fillAdornment then
			pcall(function() fillAdornment:Destroy() end)
			fillAdornment = nil
		end
	end
end

local function applyAdornmentProperties(root)
	if not enabled then
		cleanupAdornments()
		return
	end

	ensureAdornments()

	local floorOffset = 2.6 -- Đẩy xuống mặt sàn dưới chân nhân vật
	local color = getCircleColor()
	local worldTargetPos = Vector3.new(root.Position.X, root.Position.Y - floorOffset, root.Position.Z)
	local desiredWorldCFrame = CFrame.new(worldTargetPos) * CFrame.Angles(math.rad(90), 0, 0)
	local localCFrame = root.CFrame:ToObjectSpace(desiredWorldCFrame)

	if ringAdornment then
		ringAdornment.Adornee = root
		ringAdornment.Height = 0.06
		ringAdornment.Radius = rangeRadius
		ringAdornment.InnerRadius = math.max(0.1, rangeRadius - ringThickness)
		ringAdornment.Color3 = color
		ringAdornment.Transparency = 1 - ringOpacity
		ringAdornment.CFrame = localCFrame
		ringAdornment.Visible = (root ~= nil and root.Parent ~= nil)
	end

	if fillAdornment and fillEnabled then
		fillAdornment.Adornee = root
		fillAdornment.Height = 0.02
		fillAdornment.Radius = rangeRadius
		fillAdornment.InnerRadius = 0
		fillAdornment.Color3 = color
		fillAdornment.Transparency = 1 - fillOpacity
		fillAdornment.CFrame = localCFrame
		fillAdornment.Visible = (root ~= nil and root.Parent ~= nil)
	end
end

--// Highlight kẻ địch đang nằm trong tầm bán kính của nhân vật
local function updateEnemyHighlights(root)
	if not enabled or not highlightInRange or not root then
		if next(activeHighlights) ~= nil then cleanupHighlights() end
		return
	end

	local tracked = shared.GetTrackedEnemyData()
	local pPos = root.Position
	local r2 = rangeRadius * rangeRadius
	local inRangeSet = {}
	local hlColor = getHighlightColor()

	for _, data in ipairs(tracked) do
		local model = data.Model
		local eRoot = data.Root
		local hum = data.Humanoid
		if model and model.Parent and eRoot and eRoot.Parent and hum and hum.Health > 0 then
			local dx = eRoot.Position.X - pPos.X
			local dz = eRoot.Position.Z - pPos.Z
			if (dx * dx + dz * dz) <= r2 then
				inRangeSet[model] = true
			end
		end
	end

	-- Xóa highlight cho quái đã ra ngoài tầm hoặc đã chết
	for model, hl in pairs(activeHighlights) do
		if not inRangeSet[model] or not model.Parent then
			pcall(function() hl:Destroy() end)
			activeHighlights[model] = nil
		end
	end

	-- Tạo hoặc cập nhật highlight cho quái trong tầm
	for model in pairs(inRangeSet) do
		if not activeHighlights[model] or not activeHighlights[model].Parent then
			local existing = model:FindFirstChild(HIGHLIGHT_NAME)
			local hl = (existing and existing:IsA("Highlight")) and existing or Instance.new("Highlight")
			hl.Name = HIGHLIGHT_NAME
			hl.Adornee = model
			hl.FillColor = hlColor
			hl.FillTransparency = 0.35
			hl.OutlineColor = Color3.fromRGB(255, 255, 255)
			hl.OutlineTransparency = 0.1
			hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			hl.Parent = model
			activeHighlights[model] = hl
		else
			local hl = activeHighlights[model]
			if hl.FillColor ~= hlColor then hl.FillColor = hlColor end
			if not hl.Enabled then hl.Enabled = true end
		end
	end
end

local function onHeartbeat()
	if not enabled then return end

	local root = getPlayerRoot()
	if not root then
		if ringAdornment then ringAdornment.Visible = false end
		if fillAdornment then fillAdornment.Visible = false end
		if next(activeHighlights) ~= nil then cleanupHighlights() end
		lastRoot = nil
		return
	end

	-- Khóa mặt phẳng vòng tròn nằm ngang phẳng tuyệt đối theo World X-Z dưới chân nhân vật
	local floorOffset = 2.6
	local worldTargetPos = Vector3.new(root.Position.X, root.Position.Y - floorOffset, root.Position.Z)
	local desiredWorldCFrame = CFrame.new(worldTargetPos) * CFrame.Angles(math.rad(90), 0, 0)
	local localCFrame = root.CFrame:ToObjectSpace(desiredWorldCFrame)

	-- Nếu chưa tạo adornment hoặc đổi nhân vật/HumanoidRootPart mới
	if not ringAdornment or not ringAdornment.Parent or root ~= lastRoot then
		lastRoot = root
		applyAdornmentProperties(root)
	else
		if ringAdornment.Adornee ~= root then ringAdornment.Adornee = root end
		ringAdornment.CFrame = localCFrame
		if not ringAdornment.Visible then ringAdornment.Visible = true end

		if fillEnabled then
			if not fillAdornment or not fillAdornment.Parent then
				applyAdornmentProperties(root)
			else
				if fillAdornment.Adornee ~= root then fillAdornment.Adornee = root end
				fillAdornment.CFrame = localCFrame
				if not fillAdornment.Visible then fillAdornment.Visible = true end
			end
		elseif fillAdornment and fillAdornment.Visible then
			fillAdornment.Visible = false
		end
	end

	-- Cập nhật highlight kẻ địch trong tầm
	updateEnemyHighlights(root)
end

function rangeVisual.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		local root = getPlayerRoot()
		if root then
			applyAdornmentProperties(root)
			lastRoot = root
			updateEnemyHighlights(root)
		end
		if not updateConnection then
			updateConnection = RunService.Heartbeat:Connect(onHeartbeat)
		end
	else
		cleanupAdornments()
		if updateConnection then
			updateConnection:Disconnect()
			updateConnection = nil
		end
		lastRoot = nil
	end
end

function rangeVisual.IsEnabled()
	return enabled
end

function rangeVisual.SetRadius(radius)
	if type(radius) == "number" then
		rangeRadius = math.clamp(radius, 5, 150)
		local root = getPlayerRoot()
		if enabled and root then
			applyAdornmentProperties(root)
			updateEnemyHighlights(root)
		end
	end
end

function rangeVisual.GetRadius()
	return rangeRadius
end

function rangeVisual.SetFillEnabled(state)
	fillEnabled = state and true or false
	local root = getPlayerRoot()
	if enabled and root then
		applyAdornmentProperties(root)
	end
end

function rangeVisual.IsFillEnabled()
	return fillEnabled
end

function rangeVisual.SetHighlightInRange(state)
	highlightInRange = state and true or false
	if not highlightInRange then
		cleanupHighlights()
	else
		local root = getPlayerRoot()
		if enabled and root then
			updateEnemyHighlights(root)
		end
	end
end

function rangeVisual.IsHighlightInRangeEnabled()
	return highlightInRange
end

--// Colors API
function rangeVisual.GetColorNames()
	local names = { "Cyan", "Red", "Orange", "Yellow", "Green", "Emerald", "Blue", "Purple", "Magenta", "White" }
	return names
end

function rangeVisual.GetSelectedCircleColor()
	return selectedCircleColorName
end

function rangeVisual.SetCircleColor(name)
	if type(name) == "string" and COLOR_PALETTE[name] then
		selectedCircleColorName = name
		local root = getPlayerRoot()
		if enabled and root then
			applyAdornmentProperties(root)
		end
	end
end

function rangeVisual.GetSelectedHighlightColor()
	return selectedHighlightColorName
end

function rangeVisual.SetHighlightColor(name)
	if type(name) == "string" and COLOR_PALETTE[name] then
		selectedHighlightColorName = name
		local root = getPlayerRoot()
		if enabled and root then
			updateEnemyHighlights(root)
		end
	end
end

--// Character respawn & load listeners
if player then
	player.CharacterAdded:Connect(function(char)
		if enabled then
			task.spawn(function()
				local root = char:WaitForChild("HumanoidRootPart", 10)
				if root and enabled then
					applyAdornmentProperties(root)
					lastRoot = root
					updateEnemyHighlights(root)
				end
			end)
		end
	end)
end

shared.OnRespawn(function()
	if enabled then
		task.delay(0.2, function()
			local root = getPlayerRoot()
			if root and enabled then
				applyAdornmentProperties(root)
				lastRoot = root
				updateEnemyHighlights(root)
			end
		end)
	end
end)

lifecycle.Register(function()
	rangeVisual.SetEnabled(false)
	cleanupAdornments()
end)

return rangeVisual
