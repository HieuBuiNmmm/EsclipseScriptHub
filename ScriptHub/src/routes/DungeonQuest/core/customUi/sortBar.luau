-- Custom In-Game UI: sortBarFrame (DungeonQuest)
-- Khởi tạo thanh Sort Bar đính kèm vào GUI kho đồ trong game với Responsive Layout.
local function createSortBarFrame(parent)
	local sortBarFrame = Instance.new("Frame")
	sortBarFrame.Name = "sortBarFrame"
	sortBarFrame.Size = UDim2.new(0, 50, 0, 0)
	sortBarFrame.AutomaticSize = Enum.AutomaticSize.Y
	sortBarFrame.AnchorPoint = Vector2.new(0, 1)
	sortBarFrame.Position = UDim2.new(1, 30, 1, 15)
	sortBarFrame.BackgroundColor3 = Color3.fromRGB(18, 20, 26)
	sortBarFrame.BackgroundTransparency = 0.15
	sortBarFrame.BorderSizePixel = 0
	sortBarFrame.LayoutOrder = 0
	sortBarFrame.ZIndex = 2
	sortBarFrame.Visible = true
	sortBarFrame.Parent = parent

	local UICorner_SortBar = Instance.new("UICorner")
	UICorner_SortBar.CornerRadius = UDim.new(0, 8)
	UICorner_SortBar.Parent = sortBarFrame

	local UIStroke_SortBar = Instance.new("UIStroke")
	UIStroke_SortBar.Name = "DockStroke"
	UIStroke_SortBar.Thickness = 1.2
	UIStroke_SortBar.Color = Color3.fromRGB(65, 72, 90)
	UIStroke_SortBar.Transparency = 0.3
	UIStroke_SortBar.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke_SortBar.Parent = sortBarFrame

	local UIPadding_SortBar = Instance.new("UIPadding")
	UIPadding_SortBar.PaddingTop = UDim.new(0, 5)
	UIPadding_SortBar.PaddingBottom = UDim.new(0, 5)
	UIPadding_SortBar.PaddingLeft = UDim.new(0, 5)
	UIPadding_SortBar.PaddingRight = UDim.new(0, 5)
	UIPadding_SortBar.Parent = sortBarFrame

	local UIScale_SortBar = Instance.new("UIScale")
	UIScale_SortBar.Name = "SortBarUIScale"
	UIScale_SortBar.Scale = 1.25
	UIScale_SortBar.Parent = sortBarFrame

	local UIListLayout_SortBar = Instance.new("UIListLayout")
	UIListLayout_SortBar.Name = "UIListLayout"
	UIListLayout_SortBar.Padding = UDim.new(0, 6)
	UIListLayout_SortBar.FillDirection = Enum.FillDirection.Vertical
	UIListLayout_SortBar.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout_SortBar.VerticalAlignment = Enum.VerticalAlignment.Top
	UIListLayout_SortBar.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_SortBar.Parent = sortBarFrame

	local function createButton(name: string, layoutOrder: number, iconName: string, iconAsset: string)
		local btn = Instance.new("ImageButton")
		btn.Name = name
		btn.Size = UDim2.new(0, 40, 0, 40)
		btn.Position = UDim2.new(0, 0, 0, 0)
		btn.AnchorPoint = Vector2.new(0, 0)
		btn.BackgroundColor3 = Color3.fromRGB(25, 28, 36)
		btn.BackgroundTransparency = 0.65
		btn.BorderSizePixel = 0
		btn.LayoutOrder = layoutOrder
		btn.ZIndex = 2
		btn.Visible = true
		btn.Image = ""
		btn.AutoButtonColor = false
		btn.Parent = sortBarFrame

		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 6)
		corner.Parent = btn

		local stroke = Instance.new("UIStroke")
		stroke.Thickness = 1.2
		stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		stroke.Transparency = 0.85
		stroke.Color = Color3.fromRGB(60, 66, 82)
		stroke.Parent = btn

		local pad = Instance.new("UIPadding")
		pad.PaddingTop = UDim.new(0, 7)
		pad.PaddingBottom = UDim.new(0, 7)
		pad.PaddingLeft = UDim.new(0, 7)
		pad.PaddingRight = UDim.new(0, 7)
		pad.Parent = btn

		local icon = Instance.new("ImageLabel")
		icon.Name = iconName
		icon.Size = UDim2.new(1, 0, 1, 0)
		icon.Position = UDim2.new(0.5, 0, 0.5, 0)
		icon.AnchorPoint = Vector2.new(0.5, 0.5)
		icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		icon.BackgroundTransparency = 1
		icon.BorderSizePixel = 0
		icon.LayoutOrder = 0
		icon.ZIndex = 2
		icon.Visible = true
		icon.Image = iconAsset
		icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
		icon.ImageTransparency = 0.35
		icon.ScaleType = Enum.ScaleType.Fit
		icon.Parent = btn

		return btn
	end

	createButton("IBmainFilter", 1, "imageSort", "rbxassetid://73746166761985")
	createButton("IBrarity", 2, "imageRarity", "rbxassetid://105634041692696")
	createButton("IBphysic", 3, "imagePhysic", "rbxassetid://121406454377051")
	createButton("IBspell", 4, "imageSpell", "rbxassetid://125012650497883")
	createButton("IBhealth", 5, "imageHealth", "rbxassetid://88525382655929")
	createButton("IBability", 6, "imageAbility", "rbxassetid://109718589733073")

	return sortBarFrame
end

return createSortBarFrame