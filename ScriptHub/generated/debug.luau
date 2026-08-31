--!nocheck
--!nolint

--[[
    @authors YOUR_NAME
    @repository YOUR_REPOSITORY

    This file was automatically generated with darklua, it is not intended for manual editing.
--]]

_P = {
    genDate = "2026-08-31T09:30:50.187819900+00:00",
    cfg = "Debug",
    vers = "v0.0.0"
}

--// Types
type Window__DARKLUA_TYPE_a = { Visible: boolean? }
local __DIST __DIST={cache={}, load=function(m)if not __DIST.cache[m]then __DIST.cache[m]={c=__DIST[m]()}end return __DIST.cache[m].c end}do function __DIST.a()local MacLib = { 
	Options = {}, 
	Folder = "Maclib", 
	contextData = {},
	GetService = function(service)
		return cloneref and cloneref(game:GetService(service)) or game:GetService(service)
	end
}

--// Services
local TweenService = MacLib.GetService("TweenService")
local RunService = MacLib.GetService("RunService")
local HttpService = MacLib.GetService("HttpService")
local ContentProvider = MacLib.GetService("ContentProvider")
local UserInputService = MacLib.GetService("UserInputService")
local Lighting = MacLib.GetService("Lighting")
local Players = MacLib.GetService("Players")

--// Variables
local isStudio = RunService:IsStudio()
local LocalPlayer = Players.LocalPlayer

local windowState
local acrylicBlur
local hasGlobalSetting

local tabs = {}
local currentTabInstance = nil
local tabIndex = 0
local unloaded = false

local assets = {
	interFont = "rbxassetid://12187365364",
	userInfoBlurred = "rbxassetid://18824089198",
	toggleBackground = "rbxassetid://18772190202",
	togglerHead = "rbxassetid://18772309008",
	buttonImage = "rbxassetid://10709791437",
	searchIcon = "rbxassetid://86737463322606",
	colorWheel = "rbxassetid://2849458409",
	colorTarget = "rbxassetid://73265255323268",
	grid = "rbxassetid://121484455191370",
	globe = "rbxassetid://108952102602834",
	transform = "rbxassetid://90336395745819",
	dropdown = "rbxassetid://18865373378",
	sliderbar = "rbxassetid://18772615246",
	sliderhead = "rbxassetid://18772834246",
}

--// Functions
local function GetGui()
	local newGui = Instance.new("ScreenGui")
	newGui.ScreenInsets = Enum.ScreenInsets.None
	newGui.ResetOnSpawn = false
	newGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	newGui.DisplayOrder = 2147483647

	local parent = RunService:IsStudio() 
		and LocalPlayer:FindFirstChild("PlayerGui")
		or (gethui and gethui())
		or (cloneref and cloneref(MacLib.GetService("CoreGui")) or MacLib.GetService("CoreGui"))

	newGui.Parent = parent
	return newGui
end

local function Tween(instance, tweeninfo, propertytable)
	return TweenService:Create(instance, tweeninfo, propertytable)
end

--// Library Functions
function MacLib:Window(Settings)
	local WindowFunctions = {Settings = Settings}
	if Settings.AcrylicBlur ~= nil then
		acrylicBlur = Settings.AcrylicBlur
	else
		acrylicBlur = true
	end

	local macLib = GetGui()

	local notifications = Instance.new("Frame")
	notifications.Name = "Notifications"
	notifications.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	notifications.BackgroundTransparency = 1
	notifications.BorderColor3 = Color3.fromRGB(0, 0, 0)
	notifications.BorderSizePixel = 0
	notifications.Size = UDim2.fromScale(1, 1)
	notifications.Parent = macLib
	notifications.ZIndex = 2

	local notificationsUIListLayout = Instance.new("UIListLayout")
	notificationsUIListLayout.Name = "NotificationsUIListLayout"
	notificationsUIListLayout.Padding = UDim.new(0, 10)
	notificationsUIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	notificationsUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	notificationsUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	notificationsUIListLayout.Parent = notifications

	local notificationsUIPadding = Instance.new("UIPadding")
	notificationsUIPadding.Name = "NotificationsUIPadding"
	notificationsUIPadding.PaddingBottom = UDim.new(0, 10)
	notificationsUIPadding.PaddingLeft = UDim.new(0, 10)
	notificationsUIPadding.PaddingRight = UDim.new(0, 10)
	notificationsUIPadding.PaddingTop = UDim.new(0, 10)
	notificationsUIPadding.Parent = notifications

	local base = Instance.new("Frame")
	base.Name = "Base"
	base.AnchorPoint = Vector2.new(0.5, 0.5)
	base.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	base.BackgroundTransparency = Settings.AcrylicBlur and 0.05 or 0
	base.BorderColor3 = Color3.fromRGB(0, 0, 0)
	base.BorderSizePixel = 0
	base.Position = UDim2.fromScale(0.5, 0.5)
	base.Size = Settings.Size or UDim2.fromOffset(868, 650)

	local baseUIScale = Instance.new("UIScale")
	baseUIScale.Name = "BaseUIScale"
	baseUIScale.Parent = base

	local baseUICorner = Instance.new("UICorner")
	baseUICorner.Name = "BaseUICorner"
	baseUICorner.CornerRadius = UDim.new(0, 10)
	baseUICorner.Parent = base

	local baseUIStroke = Instance.new("UIStroke")
	baseUIStroke.Name = "BaseUIStroke"
	baseUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	baseUIStroke.Color = Color3.fromRGB(255, 255, 255)
	baseUIStroke.Transparency = 0.9
	baseUIStroke.Parent = base

	local sidebar = Instance.new("Frame")
	sidebar.Name = "Sidebar"
	sidebar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	sidebar.BackgroundTransparency = 1
	sidebar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	sidebar.BorderSizePixel = 0
	sidebar.Position = UDim2.fromScale(-3.52e-08, 4.69e-08)
	sidebar.Size = UDim2.fromScale(0.325, 1)

	local divider = Instance.new("Frame")
	divider.Name = "Divider"
	divider.AnchorPoint = Vector2.new(1, 0)
	divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	divider.BackgroundTransparency = 0.9
	divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	divider.BorderSizePixel = 0
	divider.Position = UDim2.fromScale(1, 0)
	divider.Size = UDim2.new(0, 1, 1, 0)
	divider.Parent = sidebar

	local dividerInteract = Instance.new("TextButton")
	dividerInteract.Name = "DividerInteract"
	dividerInteract.AnchorPoint = Vector2.new(0.5, 0)
	dividerInteract.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	dividerInteract.BackgroundTransparency = 1
	dividerInteract.BorderColor3 = Color3.fromRGB(0, 0, 0)
	dividerInteract.BorderSizePixel = 0
	dividerInteract.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	dividerInteract.Position = UDim2.fromScale(0.5, 0)
	dividerInteract.Size = UDim2.new(1, 6, 1, 0)
	dividerInteract.Text = ""
	dividerInteract.TextColor3 = Color3.fromRGB(0, 0, 0)
	dividerInteract.TextSize = 14
	dividerInteract.Parent = divider

	local windowControls = Instance.new("Frame")
	windowControls.Name = "WindowControls"
	windowControls.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	windowControls.BackgroundTransparency = 1
	windowControls.BorderColor3 = Color3.fromRGB(0, 0, 0)
	windowControls.BorderSizePixel = 0
	windowControls.Size = UDim2.new(1, 0, 0, 31)

	local controls = Instance.new("Frame")
	controls.Name = "Controls"
	controls.BackgroundColor3 = Color3.fromRGB(119, 174, 94)
	controls.BackgroundTransparency = 1
	controls.BorderColor3 = Color3.fromRGB(0, 0, 0)
	controls.BorderSizePixel = 0
	controls.Size = UDim2.fromScale(1, 1)

	local uIListLayout = Instance.new("UIListLayout")
	uIListLayout.Name = "UIListLayout"
	uIListLayout.Padding = UDim.new(0, 5)
	uIListLayout.FillDirection = Enum.FillDirection.Horizontal
	uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	uIListLayout.Parent = controls

	local uIPadding = Instance.new("UIPadding")
	uIPadding.Name = "UIPadding"
	uIPadding.PaddingLeft = UDim.new(0, 11)
	uIPadding.Parent = controls

	local windowControlSettings = {
		sizes = { enabled = UDim2.fromOffset(8, 8), disabled = UDim2.fromOffset(7, 7) },
		transparencies = { enabled = 0, disabled = 1 },
		strokeTransparency = 0.9,
	}

	local stroke = Instance.new("UIStroke")
	stroke.Name = "BaseUIStroke"
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	stroke.Color = Color3.fromRGB(255, 255, 255)
	stroke.Transparency = windowControlSettings.strokeTransparency

	local exit = Instance.new("TextButton")
	exit.Name = "Exit"
	exit.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	exit.Text = ""
	exit.TextColor3 = Color3.fromRGB(0, 0, 0)
	exit.TextSize = 14
	exit.AutoButtonColor = false
	exit.BackgroundColor3 = Color3.fromRGB(250, 93, 86)
	exit.BorderColor3 = Color3.fromRGB(0, 0, 0)
	exit.BorderSizePixel = 0

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.CornerRadius = UDim.new(1, 0)
	uICorner.Parent = exit

	exit.Parent = controls

	local minimize = Instance.new("TextButton")
	minimize.Name = "Minimize"
	minimize.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	minimize.Text = ""
	minimize.TextColor3 = Color3.fromRGB(0, 0, 0)
	minimize.TextSize = 14
	minimize.AutoButtonColor = false
	minimize.BackgroundColor3 = Color3.fromRGB(252, 190, 57)
	minimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
	minimize.BorderSizePixel = 0
	minimize.LayoutOrder = 1

	local uICorner1 = Instance.new("UICorner")
	uICorner1.Name = "UICorner"
	uICorner1.CornerRadius = UDim.new(1, 0)
	uICorner1.Parent = minimize

	minimize.Parent = controls

	local maximize = Instance.new("TextButton")
	maximize.Name = "Maximize"
	maximize.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	maximize.Text = ""
	maximize.TextColor3 = Color3.fromRGB(0, 0, 0)
	maximize.TextSize = 14
	maximize.AutoButtonColor = false
	maximize.BackgroundColor3 = Color3.fromRGB(119, 174, 94)
	maximize.BorderColor3 = Color3.fromRGB(0, 0, 0)
	maximize.BorderSizePixel = 0
	maximize.LayoutOrder = 1

	local uICorner2 = Instance.new("UICorner")
	uICorner2.Name = "UICorner"
	uICorner2.CornerRadius = UDim.new(1, 0)
	uICorner2.Parent = maximize

	maximize.Parent = controls

	local function applyState(button, enabled)
		local size = enabled and windowControlSettings.sizes.enabled or windowControlSettings.sizes.disabled
		local transparency = enabled and windowControlSettings.transparencies.enabled or windowControlSettings.transparencies.disabled

		button.Size = size
		button.BackgroundTransparency = transparency
		button.Active = enabled
		button.Interactable = enabled

		for _, child in ipairs(button:GetChildren()) do
			if child:IsA("UIStroke") then
				child.Transparency = transparency
			end
		end
		if not enabled then
			stroke:Clone().Parent = button
		end
	end

	applyState(maximize, false)

	local controlsList = {exit, minimize}
	for _, button in pairs(controlsList) do
		local buttonName = button.Name
		local isEnabled = true

		if Settings.DisabledWindowControls and table.find(Settings.DisabledWindowControls, buttonName) then
			isEnabled = false
		end

		applyState(button, isEnabled)
	end

	controls.Parent = windowControls

	local divider1 = Instance.new("Frame")
	divider1.Name = "Divider"
	divider1.AnchorPoint = Vector2.new(0, 1)
	divider1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	divider1.BackgroundTransparency = 0.9
	divider1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	divider1.BorderSizePixel = 0
	divider1.Position = UDim2.fromScale(0, 1)
	divider1.Size = UDim2.new(1, 0, 0, 1)
	divider1.Parent = windowControls

	windowControls.Parent = sidebar

	local information = Instance.new("Frame")
	information.Name = "Information"
	information.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	information.BackgroundTransparency = 1
	information.BorderColor3 = Color3.fromRGB(0, 0, 0)
	information.BorderSizePixel = 0
	information.Position = UDim2.fromOffset(0, 31)
	information.Size = UDim2.new(1, 0, 0, 60)

	local divider2 = Instance.new("Frame")
	divider2.Name = "Divider"
	divider2.AnchorPoint = Vector2.new(0, 1)
	divider2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	divider2.BackgroundTransparency = 0.9
	divider2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	divider2.BorderSizePixel = 0
	divider2.Position = UDim2.fromScale(0, 1)
	divider2.Size = UDim2.new(1, 0, 0, 1)
	divider2.Parent = information

	local informationHolder = Instance.new("Frame")
	informationHolder.Name = "InformationHolder"
	informationHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	informationHolder.BackgroundTransparency = 1
	informationHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	informationHolder.BorderSizePixel = 0
	informationHolder.Size = UDim2.fromScale(1, 1)

	local informationHolderUIPadding = Instance.new("UIPadding")
	informationHolderUIPadding.Name = "InformationHolderUIPadding"
	informationHolderUIPadding.PaddingBottom = UDim.new(0, 10)
	informationHolderUIPadding.PaddingLeft = UDim.new(0, 23)
	informationHolderUIPadding.PaddingRight = UDim.new(0, 22)
	informationHolderUIPadding.PaddingTop = UDim.new(0, 10)
	informationHolderUIPadding.Parent = informationHolder

	local globalSettingsButton = Instance.new("ImageButton")
	globalSettingsButton.Name = "GlobalSettingsButton"
	globalSettingsButton.Image = assets.globe
	globalSettingsButton.ImageTransparency = 0.5
	globalSettingsButton.AnchorPoint = Vector2.new(1, 0.5)
	globalSettingsButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	globalSettingsButton.BackgroundTransparency = 1
	globalSettingsButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	globalSettingsButton.BorderSizePixel = 0
	globalSettingsButton.Position = UDim2.fromScale(1, 0.5)
	globalSettingsButton.Size = UDim2.fromOffset(16,16)
	globalSettingsButton.Parent = informationHolder

	local function ChangeGlobalSettingsButtonState(State)
		if State == "Default" then
			Tween(globalSettingsButton, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
				ImageTransparency = 0.5
			}):Play()
		elseif State == "Hover" then
			Tween(globalSettingsButton, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
				ImageTransparency = 0.3
			}):Play()
		end
	end

	globalSettingsButton.MouseEnter:Connect(function()
		ChangeGlobalSettingsButtonState("Hover")
	end)
	globalSettingsButton.MouseLeave:Connect(function()
		ChangeGlobalSettingsButtonState("Default")
	end)

	local titleFrame = Instance.new("Frame")
	titleFrame.Name = "TitleFrame"
	titleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	titleFrame.BackgroundTransparency = 1
	titleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	titleFrame.BorderSizePixel = 0
	titleFrame.Size = UDim2.fromScale(1, 1)

	local title = Instance.new("TextLabel")
	title.Name = "Title"
	title.FontFace = Font.new(
		assets.interFont,
		Enum.FontWeight.SemiBold,
		Enum.FontStyle.Normal
	)
	title.Text = Settings.Title
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.RichText = true
	title.TextSize = 18
	title.TextTransparency = 0.1
	title.TextTruncate = Enum.TextTruncate.SplitWord
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.TextYAlignment = Enum.TextYAlignment.Top
	title.AutomaticSize = Enum.AutomaticSize.Y
	title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1
	title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	title.BorderSizePixel = 0
	title.Size = UDim2.new(1, -20, 0, 0)
	title.Parent = titleFrame

	local subtitle = Instance.new("TextLabel")
	subtitle.Name = "Subtitle"
	subtitle.FontFace = Font.new(
		assets.interFont,
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	subtitle.RichText = true
	subtitle.Text = Settings.Subtitle
	subtitle.RichText = true
	subtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	subtitle.TextSize = 12
	subtitle.TextTransparency = 0.7
	subtitle.TextTruncate = Enum.TextTruncate.SplitWord
	subtitle.TextXAlignment = Enum.TextXAlignment.Left
	subtitle.TextYAlignment = Enum.TextYAlignment.Top
	subtitle.AutomaticSize = Enum.AutomaticSize.Y
	subtitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	subtitle.BackgroundTransparency = 1
	subtitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	subtitle.BorderSizePixel = 0
	subtitle.LayoutOrder = 1
	subtitle.Size = UDim2.new(1, -20, 0, 0)
	subtitle.Parent = titleFrame

	local titleFrameUIListLayout = Instance.new("UIListLayout")
	titleFrameUIListLayout.Name = "TitleFrameUIListLayout"
	titleFrameUIListLayout.Padding = UDim.new(0, 3)
	titleFrameUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	titleFrameUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	titleFrameUIListLayout.Parent = titleFrame

	titleFrame.Parent = informationHolder

	informationHolder.Parent = information

	information.Parent = sidebar

	local sidebarGroup = Instance.new("Frame")
	sidebarGroup.Name = "SidebarGroup"
	sidebarGroup.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	sidebarGroup.BackgroundTransparency = 1
	sidebarGroup.BorderColor3 = Color3.fromRGB(0, 0, 0)
	sidebarGroup.BorderSizePixel = 0
	sidebarGroup.Position = UDim2.fromOffset(0, 91)
	sidebarGroup.Size = UDim2.new(1, 0, 1, -91)

	local userInfo = Instance.new("Frame")
	userInfo.Name = "UserInfo"
	userInfo.AnchorPoint = Vector2.new(0, 1)
	userInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	userInfo.BackgroundTransparency = 1
	userInfo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	userInfo.BorderSizePixel = 0
	userInfo.Position = UDim2.fromScale(0, 1)
	userInfo.Size = UDim2.new(1, 0, 0, 107)

	local informationGroup = Instance.new("Frame")
	informationGroup.Name = "InformationGroup"
	informationGroup.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	informationGroup.BackgroundTransparency = 1
	informationGroup.BorderColor3 = Color3.fromRGB(0, 0, 0)
	informationGroup.BorderSizePixel = 0
	informationGroup.Size = UDim2.fromScale(1, 1)

	local informationGroupUIPadding = Instance.new("UIPadding")
	informationGroupUIPadding.Name = "InformationGroupUIPadding"
	informationGroupUIPadding.PaddingBottom = UDim.new(0, 17)
	informationGroupUIPadding.PaddingLeft = UDim.new(0, 25)
	informationGroupUIPadding.Parent = informationGroup

	local informationGroupUIListLayout = Instance.new("UIListLayout")
	informationGroupUIListLayout.Name = "InformationGroupUIListLayout"
	informationGroupUIListLayout.FillDirection = Enum.FillDirection.Horizontal
	informationGroupUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	informationGroupUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	informationGroupUIListLayout.Parent = informationGroup

	local userId = LocalPlayer.UserId
	local thumbType = Enum.ThumbnailType.AvatarBust
	local thumbSize = Enum.ThumbnailSize.Size48x48
	local headshotImage, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

	local headshot = Instance.new("ImageLabel")
	headshot.Name = "Headshot"
	headshot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	headshot.BackgroundTransparency = 1
	headshot.BorderColor3 = Color3.fromRGB(0, 0, 0)
	headshot.BorderSizePixel = 0
	headshot.Size = UDim2.fromOffset(32, 32)
	headshot.Image = (isReady and headshotImage) or "rbxassetid://0"

	local uICorner3 = Instance.new("UICorner")
	uICorner3.Name = "UICorner"
	uICorner3.CornerRadius = UDim.new(1, 0)
	uICorner3.Parent = headshot

	local baseUIStroke2 = Instance.new("UIStroke")
	baseUIStroke2.Name = "BaseUIStroke"
	baseUIStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	baseUIStroke2.Color = Color3.fromRGB(255, 255, 255)
	baseUIStroke2.Transparency = 0.9
	baseUIStroke2.Parent = headshot

	headshot.Parent = informationGroup

	local userAndDisplayFrame = Instance.new("Frame")
	userAndDisplayFrame.Name = "UserAndDisplayFrame"
	userAndDisplayFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	userAndDisplayFrame.BackgroundTransparency = 1
	userAndDisplayFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	userAndDisplayFrame.BorderSizePixel = 0
	userAndDisplayFrame.LayoutOrder = 1
	userAndDisplayFrame.Size = UDim2.new(1, -42, 0, 32)

	local displayName = Instance.new("TextLabel")
	displayName.Name = "DisplayName"
	displayName.FontFace = Font.new(
		assets.interFont,
		Enum.FontWeight.SemiBold,
		Enum.FontStyle.Normal
	)
	displayName.Text = LocalPlayer.DisplayName
	displayName.TextColor3 = Color3.fromRGB(255, 255, 255)
	displayName.TextSize = 13
	displayName.TextTransparency = 0.1
	displayName.TextTruncate = Enum.TextTruncate.SplitWord
	displayName.TextXAlignment = Enum.TextXAlignment.Left
	displayName.TextYAlignment = Enum.TextYAlignment.Top
	displayName.AutomaticSize = Enum.AutomaticSize.XY
	displayName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	displayName.BackgroundTransparency = 1
	displayName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	displayName.BorderSizePixel = 0
	displayName.Parent = userAndDisplayFrame
	displayName.Size = UDim2.fromScale(1,0)

	local userAndDisplayFrameUIPadding = Instance.new("UIPadding")
	userAndDisplayFrameUIPadding.Name = "UserAndDisplayFrameUIPadding"
	userAndDisplayFrameUIPadding.PaddingLeft = UDim.new(0, 8)
	userAndDisplayFrameUIPadding.PaddingTop = UDim.new(0, 3)
	userAndDisplayFrameUIPadding.Parent = userAndDisplayFrame

	local userAndDisplayFrameUIListLayout = Instance.new("UIListLayout")
	userAndDisplayFrameUIListLayout.Name = "UserAndDisplayFrameUIListLayout"
	userAndDisplayFrameUIListLayout.Padding = UDim.new(0, 1)
	userAndDisplayFrameUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	userAndDisplayFrameUIListLayout.Parent = userAndDisplayFrame

	local username = Instance.new("TextLabel")
	username.Name = "Username"
	username.FontFace = Font.new(
		assets.interFont,
		Enum.FontWeight.SemiBold,
		Enum.FontStyle.Normal
	)
	username.Text = "@" .. LocalPlayer.Name
	username.TextColor3 = Color3.fromRGB(255, 255, 255)
	username.TextSize = 12
	username.TextTransparency = 0.7
	username.TextTruncate = Enum.TextTruncate.SplitWord
	username.TextXAlignment = Enum.TextXAlignment.Left
	username.TextYAlignment = Enum.TextYAlignment.Top
	username.AutomaticSize = Enum.AutomaticSize.XY
	username.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	username.BackgroundTransparency = 1
	username.BorderColor3 = Color3.fromRGB(0, 0, 0)
	username.BorderSizePixel = 0
	username.LayoutOrder = 1
	username.Parent = userAndDisplayFrame
	username.Size = UDim2.fromScale(1,0)

	userAndDisplayFrame.Parent = informationGroup

	informationGroup.Parent = userInfo

	local userInfoUIPadding = Instance.new("UIPadding")
	userInfoUIPadding.Name = "UserInfoUIPadding"
	userInfoUIPadding.PaddingLeft = UDim.new(0, 10)
	userInfoUIPadding.PaddingRight = UDim.new(0, 10)
	userInfoUIPadding.Parent = userInfo

	userInfo.Parent = sidebarGroup

	local sidebarGroupUIPadding = Instance.new("UIPadding")
	sidebarGroupUIPadding.Name = "SidebarGroupUIPadding"
	sidebarGroupUIPadding.PaddingLeft = UDim.new(0, 10)
	sidebarGroupUIPadding.PaddingRight = UDim.new(0, 10)
	sidebarGroupUIPadding.PaddingTop = UDim.new(0, 31)
	sidebarGroupUIPadding.Parent = sidebarGroup

	local tabSwitchers = Instance.new("Frame")
	tabSwitchers.Name = "TabSwitchers"
	tabSwitchers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tabSwitchers.BackgroundTransparency = 1
	tabSwitchers.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabSwitchers.BorderSizePixel = 0
	tabSwitchers.Size = UDim2.new(1, 0, 1, -107)

	local tabSwitchersScrollingFrame = Instance.new("ScrollingFrame")
	tabSwitchersScrollingFrame.Name = "TabSwitchersScrollingFrame"
	tabSwitchersScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	tabSwitchersScrollingFrame.BottomImage = ""
	tabSwitchersScrollingFrame.CanvasSize = UDim2.new()
	tabSwitchersScrollingFrame.ScrollBarImageTransparency = 0.8
	tabSwitchersScrollingFrame.ScrollBarThickness = 1
	tabSwitchersScrollingFrame.TopImage = ""
	tabSwitchersScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tabSwitchersScrollingFrame.BackgroundTransparency = 1
	tabSwitchersScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabSwitchersScrollingFrame.BorderSizePixel = 0
	tabSwitchersScrollingFrame.Size = UDim2.fromScale(1, 1)

	local tabSwitchersScrollingFrameUIListLayout = Instance.new("UIListLayout")
	tabSwitchersScrollingFrameUIListLayout.Name = "TabSwitchersScrollingFrameUIListLayout"
	tabSwitchersScrollingFrameUIListLayout.Padding = UDim.new(0, 17)
	tabSwitchersScrollingFrameUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	tabSwitchersScrollingFrameUIListLayout.Parent = tabSwitchersScrollingFrame

	local tabSwitchersScrollingFrameUIPadding = Instance.new("UIPadding")
	tabSwitchersScrollingFrameUIPadding.Name = "TabSwitchersScrollingFrameUIPadding"
	tabSwitchersScrollingFrameUIPadding.PaddingTop = UDim.new(0, 2)
	tabSwitchersScrollingFrameUIPadding.Parent = tabSwitchersScrollingFrame

	tabSwitchersScrollingFrame.Parent = tabSwitchers

	tabSwitchers.Parent = sidebarGroup

	sidebarGroup.Parent = sidebar

	sidebar.Parent = base

	local content = Instance.new("Frame")
	content.Name = "Content"
	content.AnchorPoint = Vector2.new(1, 0)
	content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	content.BackgroundTransparency = 1
	content.BorderColor3 = Color3.fromRGB(0, 0, 0)
	content.BorderSizePixel = 0
	content.Position = UDim2.fromScale(1, 4.69e-08)
	content.Size = UDim2.new(0, (base.AbsoluteSize.X - sidebar.AbsoluteSize.X), 1, 0)

	local resizingContent = false
	local defaultSidebarWidth = sidebar.AbsoluteSize.X
	local initialMouseX, initialSidebarWidth
	local snapRange = 20
	local minSidebarWidth = 107
	local maxSidebarWidth = base.AbsoluteSize.X - minSidebarWidth

	local TweenSettings = {
		DefaultTransparency = 0.9,
		HoverTransparency = 0.85,

		EasingStyle = Enum.EasingStyle.Sine
	}

	local function ChangeState(State)
		Tween(divider, TweenInfo.new(0.2, TweenSettings.EasingStyle), {
			BackgroundTransparency = State == "Idle" and TweenSettings.DefaultTransparency or TweenSettings.HoverTransparency
		}):Play()  
	end

	dividerInteract.MouseEnter:Connect(function()
		ChangeState("Hover")
	end)
	dividerInteract.MouseLeave:Connect(function()
		ChangeState("Idle")
	end)

	dividerInteract.MouseButton1Down:Connect(function()
		resizingContent = true
		initialMouseX = UserInputService:GetMouseLocation().X
		initialSidebarWidth = sidebar.AbsoluteSize.X
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			resizingContent = false
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if resizingContent and input.UserInputType == Enum.UserInputType.MouseMovement then
			local deltaX = UserInputService:GetMouseLocation().X - initialMouseX
			local newSidebarWidth = initialSidebarWidth + deltaX

			if math.abs(newSidebarWidth - defaultSidebarWidth) < snapRange then
				newSidebarWidth = defaultSidebarWidth
			else
				newSidebarWidth = math.clamp(newSidebarWidth, minSidebarWidth, maxSidebarWidth)
			end

			sidebar.Size = UDim2.new(0, newSidebarWidth, 1, 0)
			content.Size = UDim2.new(0, base.AbsoluteSize.X - newSidebarWidth, 1, 0)
		end
	end)

	local topbar = Instance.new("Frame")
	topbar.Name = "Topbar"
	topbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	topbar.BackgroundTransparency = 1
	topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	topbar.BorderSizePixel = 0
	topbar.Size = UDim2.new(1, 0, 0, 63)

	local divider4 = Instance.new("Frame")
	divider4.Name = "Divider"
	divider4.AnchorPoint = Vector2.new(0, 1)
	divider4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	divider4.BackgroundTransparency = 0.9
	divider4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	divider4.BorderSizePixel = 0
	divider4.Position = UDim2.fromScale(0, 1)
	divider4.Size = UDim2.new(1, 0, 0, 1)
	divider4.Parent = topbar

	local elements = Instance.new("Frame")
	elements.Name = "Elements"
	elements.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	elements.BackgroundTransparency = 1
	elements.BorderColor3 = Color3.fromRGB(0, 0, 0)
	elements.BorderSizePixel = 0
	elements.Size = UDim2.fromScale(1, 1)

	local uIPadding2 = Instance.new("UIPadding")
	uIPadding2.Name = "UIPadding"
	uIPadding2.PaddingLeft = UDim.new(0, 20)
	uIPadding2.PaddingRight = UDim.new(0, 20)
	uIPadding2.Parent = elements

	local moveIcon = Instance.new("ImageButton")
	moveIcon.Name = "MoveIcon"
	moveIcon.Image = assets.transform
	moveIcon.ImageTransparency = 0.7
	moveIcon.AnchorPoint = Vector2.new(1, 0.5)
	moveIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	moveIcon.BackgroundTransparency = 1
	moveIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	moveIcon.BorderSizePixel = 0
	moveIcon.Position = UDim2.fromScale(1, 0.5)
	moveIcon.Size = UDim2.fromOffset(15, 15)
	moveIcon.Parent = elements
	moveIcon.Visible = not Settings.DragStyle or Settings.DragStyle == 1

	local interact = Instance.new("TextButton")
	interact.Name = "Interact"
	interact.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	interact.Text = ""
	interact.TextColor3 = Color3.fromRGB(0, 0, 0)
	interact.TextSize = 14
	interact.AnchorPoint = Vector2.new(0.5, 0.5)
	interact.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	interact.BackgroundTransparency = 1
	interact.BorderColor3 = Color3.fromRGB(0, 0, 0)
	interact.BorderSizePixel = 0
	interact.Position = UDim2.fromScale(0.5, 0.5)
	interact.Size = UDim2.fromOffset(40, 40)
	interact.Parent = moveIcon

	local function ChangemoveIconState(State)
		if State == "Default" then
			Tween(moveIcon, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
				ImageTransparency = 0.7
			}):Play()
		elseif State == "Hover" then
			Tween(moveIcon, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
				ImageTransparency = 0.4
			}):Play()
		end
	end

	interact.MouseEnter:Connect(function()
		ChangemoveIconState("Hover")
	end)
	interact.MouseLeave:Connect(function()
		ChangemoveIconState("Default")
	end)

	local dragging_ = false
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		base.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	local function onDragStart(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging_ = true
			dragStart = input.Position
			startPos = base.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging_ = false
				end
			end)
		end
	end

	local function onDragUpdate(input)
		if dragging_ and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			dragInput = input
		end
	end

	if not Settings.DragStyle or Settings.DragStyle == 1 then
		interact.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				onDragStart(input)
			end
		end)

		interact.InputChanged:Connect(onDragUpdate)

		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging_ then
				update(input)
			end
		end)

		interact.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging_ = false
			end
		end)
	elseif Settings.DragStyle == 2 then
		base.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				onDragStart(input)
			end
		end)

		base.InputChanged:Connect(onDragUpdate)

		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging_ then
				update(input)
			end
		end)

		base.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging_ = false
			end
		end)
	end

	local currentTab = Instance.new("TextLabel")
	currentTab.Name = "CurrentTab"
	currentTab.FontFace = Font.new(assets.interFont)
	currentTab.RichText = true
	currentTab.Text = ""
	currentTab.RichText = true
	currentTab.TextColor3 = Color3.fromRGB(255, 255, 255)
	currentTab.TextSize = 15
	currentTab.TextTransparency = 0.5
	currentTab.TextTruncate = Enum.TextTruncate.SplitWord
	currentTab.TextXAlignment = Enum.TextXAlignment.Left
	currentTab.TextYAlignment = Enum.TextYAlignment.Top
	currentTab.AnchorPoint = Vector2.new(0, 0.5)
	currentTab.AutomaticSize = Enum.AutomaticSize.Y
	currentTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	currentTab.BackgroundTransparency = 1
	currentTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	currentTab.BorderSizePixel = 0
	currentTab.Position = UDim2.fromScale(0, 0.5)
	currentTab.Size = UDim2.fromScale(0.9, 0)
	currentTab.Parent = elements

	elements.Parent = topbar

	topbar.Parent = content

	content.Parent = base

	local globalSettings = Instance.new("Frame")
	globalSettings.Name = "GlobalSettings"
	globalSettings.AutomaticSize = Enum.AutomaticSize.XY
	globalSettings.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	globalSettings.BorderColor3 = Color3.fromRGB(0, 0, 0)
	globalSettings.BorderSizePixel = 0
	globalSettings.Position = UDim2.fromScale(0.298, 0.104)

	local globalSettingsUIStroke = Instance.new("UIStroke")
	globalSettingsUIStroke.Name = "GlobalSettingsUIStroke"
	globalSettingsUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	globalSettingsUIStroke.Color = Color3.fromRGB(255, 255, 255)
	globalSettingsUIStroke.Transparency = 0.9
	globalSettingsUIStroke.Parent = globalSettings

	local globalSettingsUICorner = Instance.new("UICorner")
	globalSettingsUICorner.Name = "GlobalSettingsUICorner"
	globalSettingsUICorner.CornerRadius = UDim.new(0, 10)
	globalSettingsUICorner.Parent = globalSettings

	local globalSettingsUIPadding = Instance.new("UIPadding")
	globalSettingsUIPadding.Name = "GlobalSettingsUIPadding"
	globalSettingsUIPadding.PaddingBottom = UDim.new(0, 10)
	globalSettingsUIPadding.PaddingTop = UDim.new(0, 10)
	globalSettingsUIPadding.Parent = globalSettings

	local globalSettingsUIListLayout = Instance.new("UIListLayout")
	globalSettingsUIListLayout.Name = "GlobalSettingsUIListLayout"
	globalSettingsUIListLayout.Padding = UDim.new(0, 5)
	globalSettingsUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	globalSettingsUIListLayout.Parent = globalSettings

	local globalSettingsUIScale = Instance.new("UIScale")
	globalSettingsUIScale.Name = "GlobalSettingsUIScale"
	globalSettingsUIScale.Scale = 1e-07
	globalSettingsUIScale.Parent = globalSettings
	globalSettings.Parent = base
	base.Parent = macLib

	function WindowFunctions:UpdateTitle(NewTitle)
		title.Text = NewTitle
	end

	function WindowFunctions:UpdateSubtitle(NewSubtitle)
		subtitle.Text = NewSubtitle
	end

	local hovering
	local toggled = globalSettingsUIScale.Scale == 1 and true or false
	local function toggle()
		if not toggled then
			local intween = Tween(globalSettingsUIScale, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				Scale = 1
			})
			intween:Play()
			intween.Completed:Wait()
			toggled = true
		elseif toggled then
			local outtween = Tween(globalSettingsUIScale, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				Scale = 0
			})
			outtween:Play()
			outtween.Completed:Wait()
			toggled = false
		end
	end
	globalSettingsButton.MouseButton1Click:Connect(function()
		if not hasGlobalSetting then return end
		toggle()
	end)
	globalSettings.MouseEnter:Connect(function()
		hovering = true
	end)
	globalSettings.MouseLeave:Connect(function()
		hovering = false
	end)
	UserInputService.InputEnded:Connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseButton1 and toggled and not hovering then
			toggle()
		end
	end)

	local BlurTarget = base

	local HS = HttpService
	local camera = workspace.CurrentCamera
	local MTREL = "Glass"
	local binds = {}
	local wedgeguid = HS:GenerateGUID(true)

	local DepthOfField

	for _,v in pairs(Lighting:GetChildren()) do
		if not v:IsA("DepthOfFieldEffect") and v:HasTag(".") then
			DepthOfField = Instance.new('DepthOfFieldEffect')
			DepthOfField.FarIntensity = 0
			DepthOfField.FocusDistance = 51.6
			DepthOfField.InFocusRadius = 50
			DepthOfField.NearIntensity = 1
			DepthOfField.Name = HS:GenerateGUID(true)
			DepthOfField:AddTag(".")
		elseif v:IsA("DepthOfFieldEffect") and v:HasTag(".") then
			DepthOfField = v
		end
	end

	if not DepthOfField then
		DepthOfField = Instance.new('DepthOfFieldEffect')
		DepthOfField.FarIntensity = 0
		DepthOfField.FocusDistance = 51.6
		DepthOfField.InFocusRadius = 50
		DepthOfField.NearIntensity = 1
		DepthOfField.Name = HS:GenerateGUID(true)
		DepthOfField:AddTag(".")
	end

	local frame = Instance.new('Frame')
	frame.Parent = BlurTarget
	frame.Size = UDim2.new(0.97, 0, 0.97, 0)
	frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.BackgroundTransparency = 1
	frame.Name = HS:GenerateGUID(true)

	do
		local function IsNotNaN(x)
			return x == x
		end
		local continue = IsNotNaN(camera:ScreenPointToRay(0,0).Origin.x)
		while not continue do
			RunService.RenderStepped:Wait()
			continue = IsNotNaN(camera:ScreenPointToRay(0,0).Origin.x)
		end
	end

	local DrawQuad; do
		local acos, max, pi, sqrt = math.acos, math.max, math.pi, math.sqrt
		local sz = 0.2

		local function DrawTriangle(v1, v2, v3, p0, p1)
			local s1 = (v1 - v2).magnitude
			local s2 = (v2 - v3).magnitude
			local s3 = (v3 - v1).magnitude
			local smax = max(s1, s2, s3)
			local A, B, C
			if s1 == smax then
				A, B, C = v1, v2, v3
			elseif s2 == smax then
				A, B, C = v2, v3, v1
			elseif s3 == smax then
				A, B, C = v3, v1, v2
			end

			local para = ( (B-A).x*(C-A).x + (B-A).y*(C-A).y + (B-A).z*(C-A).z ) / (A-B).magnitude
			local perp = sqrt((C-A).magnitude^2 - para*para)
			local dif_para = (A - B).magnitude - para

			local st = CFrame.new(B, A)
			local za = CFrame.Angles(pi/2,0,0)

			local cf0 = st

			local Top_Look = (cf0 * za).lookVector
			local Mid_Point = A + CFrame.new(A, B).lookVector * para
			local Needed_Look = CFrame.new(Mid_Point, C).lookVector
			local dot = Top_Look.x*Needed_Look.x + Top_Look.y*Needed_Look.y + Top_Look.z*Needed_Look.z

			local ac = CFrame.Angles(0, 0, acos(dot))

			cf0 = cf0 * ac
			if ((cf0 * za).lookVector - Needed_Look).magnitude > 0.01 then
				cf0 = cf0 * CFrame.Angles(0, 0, -2*acos(dot))
			end
			cf0 = cf0 * CFrame.new(0, perp/2, -(dif_para + para/2))

			local cf1 = st * ac * CFrame.Angles(0, pi, 0)
			if ((cf1 * za).lookVector - Needed_Look).magnitude > 0.01 then
				cf1 = cf1 * CFrame.Angles(0, 0, 2*acos(dot))
			end
			cf1 = cf1 * CFrame.new(0, perp/2, dif_para/2)

			if not p0 then
				p0 = Instance.new('Part')
				p0.FormFactor = 'Custom'
				p0.TopSurface = 0
				p0.BottomSurface = 0
				p0.Anchored = true
				p0.CanCollide = false
				p0.CastShadow = false
				p0.Material = MTREL
				p0.Size = Vector3.new(sz, sz, sz)
				p0.Name = HS:GenerateGUID(true)
				local mesh = Instance.new('SpecialMesh', p0)
				mesh.MeshType = 2
				mesh.Name = wedgeguid
			end
			p0[wedgeguid].Scale = Vector3.new(0, perp/sz, para/sz)
			p0.CFrame = cf0

			if not p1 then
				p1 = p0:clone()
			end
			p1[wedgeguid].Scale = Vector3.new(0, perp/sz, dif_para/sz)
			p1.CFrame = cf1

			return p0, p1
		end

		function DrawQuad(v1, v2, v3, v4, parts)
			parts[1], parts[2] = DrawTriangle(v1, v2, v3, parts[1], parts[2])
			parts[3], parts[4] = DrawTriangle(v3, v2, v4, parts[3], parts[4])
		end
	end

	if binds[frame] then
		return binds[frame].parts
	end

	local parts = {}

	local parents = {}
	do
		local function add(child)
			if child:IsA'GuiObject' then
				parents[#parents + 1] = child
				add(child.Parent)
			end
		end
		add(frame)
	end

	local function IsVisible(instance)
		while instance do
			if instance:IsA("GuiObject") then
				if not instance.Visible then
					return false
				end
			elseif instance:IsA("ScreenGui") then
				if not instance.Enabled then
					return false
				end
				break
			end
			instance = instance.Parent
		end
		return true
	end

	local function UpdateOrientation(fetchProps)
		if not IsVisible(frame) or not acrylicBlur or unloaded then
			for _, pt in pairs(parts) do
				pt.Parent = nil
				DepthOfField.Enabled = false
				DepthOfField.Parent = nil
			end
			return
		end
		if not DepthOfField.Parent then
			DepthOfField.Parent = Lighting
		end
		DepthOfField.Enabled = true
		local properties = {
			Transparency = 0.98;
			BrickColor = BrickColor.new('Institutional white');
		}
		local zIndex = 1 - 0.05*frame.ZIndex

		local tl, br = frame.AbsolutePosition, frame.AbsolutePosition + frame.AbsoluteSize
		local tr, bl = Vector2.new(br.x, tl.y), Vector2.new(tl.x, br.y)
		do
			local rot = 0;
			for _, v in ipairs(parents) do
				rot = rot + v.Rotation
			end
			if rot ~= 0 and rot%180 ~= 0 then
				local mid = tl:lerp(br, 0.5)
				local s, c = math.sin(math.rad(rot)), math.cos(math.rad(rot))
				local vec = tl
				tl = Vector2.new(c*(tl.x - mid.x) - s*(tl.y - mid.y), s*(tl.x - mid.x) + c*(tl.y - mid.y)) + mid
				tr = Vector2.new(c*(tr.x - mid.x) - s*(tr.y - mid.y), s*(tr.x - mid.x) + c*(tr.y - mid.y)) + mid
				bl = Vector2.new(c*(bl.x - mid.x) - s*(bl.y - mid.y), s*(bl.x - mid.x) + c*(bl.y - mid.y)) + mid
				br = Vector2.new(c*(br.x - mid.x) - s*(br.y - mid.y), s*(br.x - mid.x) + c*(br.y - mid.y)) + mid
			end
		end
		DrawQuad(
			camera:ScreenPointToRay(tl.x, tl.y, zIndex).Origin, 
			camera:ScreenPointToRay(tr.x, tr.y, zIndex).Origin, 
			camera:ScreenPointToRay(bl.x, bl.y, zIndex).Origin, 
			camera:ScreenPointToRay(br.x, br.y, zIndex).Origin, 
			parts
		)
		if fetchProps then
			for _, pt in pairs(parts) do
				pt.Parent = camera
			end
			for propName, propValue in pairs(properties) do
				for _, pt in pairs(parts) do
					pt[propName] = propValue
				end
			end
		end
	end

	UpdateOrientation(true)

	RunService.RenderStepped:Connect(UpdateOrientation)

	function WindowFunctions:GlobalSetting(Settings)
		hasGlobalSetting = true
		local GlobalSettingFunctions = {}
		local globalSetting = Instance.new("TextButton")
		globalSetting.Name = "GlobalSetting"
		globalSetting.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
		globalSetting.Text = ""
		globalSetting.TextColor3 = Color3.fromRGB(0, 0, 0)
		globalSetting.TextSize = 14
		globalSetting.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		globalSetting.BackgroundTransparency = 1
		globalSetting.BorderColor3 = Color3.fromRGB(0, 0, 0)
		globalSetting.BorderSizePixel = 0
		globalSetting.Size = UDim2.fromOffset(200, 30)

		local globalSettingToggleUIPadding = Instance.new("UIPadding")
		globalSettingToggleUIPadding.Name = "GlobalSettingToggleUIPadding"
		globalSettingToggleUIPadding.PaddingLeft = UDim.new(0, 15)
		globalSettingToggleUIPadding.Parent = globalSetting

		local settingName = Instance.new("TextLabel")
		settingName.Name = "SettingName"
		settingName.FontFace = Font.new(assets.interFont)
		settingName.Text = Settings.Name
		settingName.RichText = true
		settingName.TextColor3 = Color3.fromRGB(255, 255, 255)
		settingName.TextSize = 13
		settingName.TextTransparency = 0.5
		settingName.TextTruncate = Enum.TextTruncate.SplitWord
		settingName.TextXAlignment = Enum.TextXAlignment.Left
		settingName.TextYAlignment = Enum.TextYAlignment.Top
		settingName.AnchorPoint = Vector2.new(0, 0.5)
		settingName.AutomaticSize = Enum.AutomaticSize.Y
		settingName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		settingName.BackgroundTransparency = 1
		settingName.BorderColor3 = Color3.fromRGB(0, 0, 0)
		settingName.BorderSizePixel = 0
		settingName.Position = UDim2.fromScale(1.3e-07, 0.5)
		settingName.Size = UDim2.new(1,-40,0,0)
		settingName.Parent = globalSetting

		local globalSettingToggleUIListLayout = Instance.new("UIListLayout")
		globalSettingToggleUIListLayout.Name = "GlobalSettingToggleUIListLayout"
		globalSettingToggleUIListLayout.Padding = UDim.new(0, 10)
		globalSettingToggleUIListLayout.FillDirection = Enum.FillDirection.Horizontal
		globalSettingToggleUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		globalSettingToggleUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		globalSettingToggleUIListLayout.Parent = globalSetting

		local checkmark = Instance.new("TextLabel")
		checkmark.Name = "Checkmark"
		checkmark.FontFace = Font.new(
			assets.interFont,
			Enum.FontWeight.Medium,
			Enum.FontStyle.Normal
		)
		checkmark.Text = "✓"
		checkmark.TextColor3 = Color3.fromRGB(255, 255, 255)
		checkmark.TextSize = 13
		checkmark.TextTransparency = 1
		checkmark.TextXAlignment = Enum.TextXAlignment.Left
		checkmark.TextYAlignment = Enum.TextYAlignment.Top
		checkmark.AnchorPoint = Vector2.new(0, 0.5)
		checkmark.AutomaticSize = Enum.AutomaticSize.Y
		checkmark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		checkmark.BackgroundTransparency = 1
		checkmark.BorderColor3 = Color3.fromRGB(0, 0, 0)
		checkmark.BorderSizePixel = 0
		checkmark.LayoutOrder = -1
		checkmark.Position = UDim2.fromScale(1.3e-07, 0.5)
		checkmark.Size = UDim2.fromOffset(-10, 0)
		checkmark.Parent = globalSetting

		globalSetting.Parent = globalSettings

		local tweensettings = {
			duration = 0.2,
			easingStyle = Enum.EasingStyle.Quint,
			transparencyIn = 0.2,
			transparencyOut = 0.5,
			checkSizeIncrease = 12,
			checkSizeDecrease = -globalSettingToggleUIListLayout.Padding.Offset,
			waitTime = 1
		}

		local tweens = {
			checkIn = Tween(checkmark, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle), {
				Size = UDim2.new(checkmark.Size.X.Scale, tweensettings.checkSizeIncrease, checkmark.Size.Y.Scale, checkmark.Size.Y.Offset)
			}),
			checkOut = Tween(checkmark, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle),{
				Size = UDim2.new(checkmark.Size.X.Scale, tweensettings.checkSizeDecrease, checkmark.Size.Y.Scale, checkmark.Size.Y.Offset)
			}),
			nameIn = Tween(settingName, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle),{
				TextTransparency = tweensettings.transparencyIn
			}),
			nameOut = Tween(settingName, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle),{
				TextTransparency = tweensettings.transparencyOut
			})
		}

		local function Toggle(State)
			if not State then
				tweens.checkOut:Play()
				tweens.nameOut:Play()
				checkmark:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
					if checkmark.AbsoluteSize.X <= 0 then
						checkmark.TextTransparency = 1
					end
				end)
			else
				tweens.checkIn:Play()
				tweens.nameIn:Play()
				checkmark:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
					if checkmark.AbsoluteSize.X > 0 then
						checkmark.TextTransparency = 0
					end
				end)
			end
		end

		local toggled = Settings.Default
		Toggle(toggled)

		globalSetting.MouseButton1Click:Connect(function()
			toggled = not toggled
			Toggle(toggled)

			task.spawn(function()
				if Settings.Callback then
					Settings.Callback(toggled)
				end
			end)
		end)

		function GlobalSettingFunctions:UpdateName(NewName)
			settingName.Text = NewName
		end

		function GlobalSettingFunctions:UpdateState(NewState)
			Toggle(NewState)
			toggled = NewState
		end

		return GlobalSettingFunctions
	end

	function WindowFunctions:TabGroup()
		local SectionFunctions = {}

		local tabGroup = Instance.new("Frame")
		tabGroup.Name = "Section"
		tabGroup.AutomaticSize = Enum.AutomaticSize.Y
		tabGroup.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		tabGroup.BackgroundTransparency = 1
		tabGroup.BorderColor3 = Color3.fromRGB(0, 0, 0)
		tabGroup.BorderSizePixel = 0
		tabGroup.Size = UDim2.fromScale(1, 0)

		local divider3 = Instance.new("Frame")
		divider3.Name = "Divider"
		divider3.AnchorPoint = Vector2.new(0.5, 1)
		divider3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		divider3.BackgroundTransparency = 0.9
		divider3.BorderColor3 = Color3.fromRGB(0, 0, 0)
		divider3.BorderSizePixel = 0
		divider3.Position = UDim2.fromScale(0.5, 1)
		divider3.Size = UDim2.new(1, -21, 0, 1)
		divider3.Parent = tabGroup

		local sectionTabSwitchers = Instance.new("Frame")
		sectionTabSwitchers.Name = "SectionTabSwitchers"
		sectionTabSwitchers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		sectionTabSwitchers.BackgroundTransparency = 1
		sectionTabSwitchers.BorderColor3 = Color3.fromRGB(0, 0, 0)
		sectionTabSwitchers.BorderSizePixel = 0
		sectionTabSwitchers.Size = UDim2.fromScale(1, 1)

		local uIListLayout1 = Instance.new("UIListLayout")
		uIListLayout1.Name = "UIListLayout"
		uIListLayout1.Padding = UDim.new(0, 15)
		uIListLayout1.HorizontalAlignment = Enum.HorizontalAlignment.Center
		uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
		uIListLayout1.Parent = sectionTabSwitchers

		local uIPadding1 = Instance.new("UIPadding")
		uIPadding1.Name = "UIPadding"
		uIPadding1.PaddingBottom = UDim.new(0, 15)
		uIPadding1.Parent = sectionTabSwitchers

		sectionTabSwitchers.Parent = tabGroup
		tabGroup.Parent = tabSwitchersScrollingFrame

		function SectionFunctions:Tab(Settings)
			local TabFunctions = {Settings = Settings}
			local tabSwitcher = Instance.new("TextButton")
			tabSwitcher.Name = "TabSwitcher"
			tabSwitcher.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
			tabSwitcher.Text = ""
			tabSwitcher.TextColor3 = Color3.fromRGB(0, 0, 0)
			tabSwitcher.TextSize = 14
			tabSwitcher.AutoButtonColor = false
			tabSwitcher.AnchorPoint = Vector2.new(0.5, 0)
			tabSwitcher.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			tabSwitcher.BackgroundTransparency = 1
			tabSwitcher.BorderColor3 = Color3.fromRGB(0, 0, 0)
			tabSwitcher.BorderSizePixel = 0
			tabSwitcher.Position = UDim2.fromScale(0.5, 0)
			tabSwitcher.Size = UDim2.new(1, -21, 0, 40)

			tabIndex += 1
			tabSwitcher.LayoutOrder = tabIndex

			local tabSwitcherUICorner = Instance.new("UICorner")
			tabSwitcherUICorner.Name = "TabSwitcherUICorner"
			tabSwitcherUICorner.Parent = tabSwitcher

			local tabSwitcherUIStroke = Instance.new("UIStroke")
			tabSwitcherUIStroke.Name = "TabSwitcherUIStroke"
			tabSwitcherUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			tabSwitcherUIStroke.Color = Color3.fromRGB(255, 255, 255)
			tabSwitcherUIStroke.Transparency = 1
			tabSwitcherUIStroke.Parent = tabSwitcher

			local tabSwitcherUIListLayout = Instance.new("UIListLayout")
			tabSwitcherUIListLayout.Name = "TabSwitcherUIListLayout"
			tabSwitcherUIListLayout.Padding = UDim.new(0, 9)
			tabSwitcherUIListLayout.FillDirection = Enum.FillDirection.Horizontal
			tabSwitcherUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			tabSwitcherUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
			tabSwitcherUIListLayout.Parent = tabSwitcher

			local tabImage

			if Settings.Image then
				tabImage = Instance.new("ImageLabel")
				tabImage.Name = "TabImage"
				tabImage.Image = Settings.Image
				tabImage.ImageTransparency = 0.5
				tabImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				tabImage.BackgroundTransparency = 1
				tabImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
				tabImage.BorderSizePixel = 0
				tabImage.Size = UDim2.fromOffset(18, 18)
				tabImage.Parent = tabSwitcher
			end

			local tabSwitcherName = Instance.new("TextLabel")
			tabSwitcherName.Name = "TabSwitcherName"
			tabSwitcherName.FontFace = Font.new(
				assets.interFont,
				Enum.FontWeight.Medium,
				Enum.FontStyle.Normal
			)
			tabSwitcherName.Text = Settings.Name
			tabSwitcherName.RichText = true
			tabSwitcherName.TextColor3 = Color3.fromRGB(255, 255, 255)
			tabSwitcherName.TextSize = 16
			tabSwitcherName.TextTransparency = 0.5
			tabSwitcherName.TextTruncate = Enum.TextTruncate.SplitWord
			tabSwitcherName.TextXAlignment = Enum.TextXAlignment.Left
			tabSwitcherName.TextYAlignment = Enum.TextYAlignment.Top
			tabSwitcherName.AutomaticSize = Enum.AutomaticSize.Y
			tabSwitcherName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			tabSwitcherName.BackgroundTransparency = 1
			tabSwitcherName.BorderColor3 = Color3.fromRGB(0, 0, 0)
			tabSwitcherName.BorderSizePixel = 0
			tabSwitcherName.Size = UDim2.fromScale(1, 0)
			tabSwitcherName.Parent = tabSwitcher
			tabSwitcherName.LayoutOrder = 1

			local tabSwitcherUIPadding = Instance.new("UIPadding")
			tabSwitcherUIPadding.Name = "TabSwitcherUIPadding"
			tabSwitcherUIPadding.PaddingLeft = UDim.new(0, 24)
			tabSwitcherUIPadding.PaddingRight = UDim.new(0, 35)
			tabSwitcherUIPadding.PaddingTop = UDim.new(0, 1)
			tabSwitcherUIPadding.Parent = tabSwitcher

			tabSwitcher.Parent = sectionTabSwitchers

			local elements1 = Instance.new("Frame")
			elements1.Name = "Elements"
			elements1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			elements1.BackgroundTransparency = 1
			elements1.BorderColor3 = Color3.fromRGB(0, 0, 0)
			elements1.BorderSizePixel = 0
			elements1.Position = UDim2.fromOffset(0, 63)
			elements1.Size = UDim2.new(1, 0, 1, -63)
			elements1.ClipsDescendants = true

			local elementsUIPadding = Instance.new("UIPadding")
			elementsUIPadding.Name = "ElementsUIPadding"
			elementsUIPadding.PaddingRight = UDim.new(0, 5)
			elementsUIPadding.PaddingTop = UDim.new(0, 10)
			elementsUIPadding.PaddingBottom = UDim.new(0, 10)
			elementsUIPadding.Parent = elements1

			local elementsScrolling = Instance.new("ScrollingFrame")
			elementsScrolling.Name = "ElementsScrolling"
			elementsScrolling.AutomaticCanvasSize = Enum.AutomaticSize.Y
			elementsScrolling.BottomImage = ""
			elementsScrolling.CanvasSize = UDim2.new()
			elementsScrolling.ScrollBarImageTransparency = 0.5
			elementsScrolling.ScrollBarThickness = 1
			elementsScrolling.TopImage = ""
			elementsScrolling.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			elementsScrolling.BackgroundTransparency = 1
			elementsScrolling.BorderColor3 = Color3.fromRGB(0, 0, 0)
			elementsScrolling.BorderSizePixel = 0
			elementsScrolling.Size = UDim2.fromScale(1, 1)
			elementsScrolling.ClipsDescendants = false

			local elementsScrollingUIPadding = Instance.new("UIPadding")
			elementsScrollingUIPadding.Name = "ElementsScrollingUIPadding"
			elementsScrollingUIPadding.PaddingBottom = UDim.new(0, 5)
			elementsScrollingUIPadding.PaddingLeft = UDim.new(0, 11)
			elementsScrollingUIPadding.PaddingRight = UDim.new(0, 3)
			elementsScrollingUIPadding.PaddingTop = UDim.new(0, 5)
			elementsScrollingUIPadding.Parent = elementsScrolling

			local elementsScrollingUIListLayout = Instance.new("UIListLayout")
			elementsScrollingUIListLayout.Name = "ElementsScrollingUIListLayout"
			elementsScrollingUIListLayout.Padding = UDim.new(0, 15)
			elementsScrollingUIListLayout.FillDirection = Enum.FillDirection.Horizontal
			elementsScrollingUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			elementsScrollingUIListLayout.Parent = elementsScrolling

			local left = Instance.new("Frame")
			left.Name = "Left"
			left.AutomaticSize = Enum.AutomaticSize.Y
			left.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			left.BackgroundTransparency = 1
			left.BorderColor3 = Color3.fromRGB(0, 0, 0)
			left.BorderSizePixel = 0
			left.Position = UDim2.fromScale(0.512, 0)
			left.Size = UDim2.new(0.5, -10, 0, 0)

			local leftUIListLayout = Instance.new("UIListLayout")
			leftUIListLayout.Name = "LeftUIListLayout"
			leftUIListLayout.Padding = UDim.new(0, 15)
			leftUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			leftUIListLayout.Parent = left

			left.Parent = elementsScrolling

			local right = Instance.new("Frame")
			right.Name = "Right"
			right.AutomaticSize = Enum.AutomaticSize.Y
			right.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			right.BackgroundTransparency = 1
			right.BorderColor3 = Color3.fromRGB(0, 0, 0)
			right.BorderSizePixel = 0
			right.LayoutOrder = 1
			right.Position = UDim2.fromScale(0.512, 0)
			right.Size = UDim2.new(0.5, -10, 0, 0)

			local rightUIListLayout = Instance.new("UIListLayout")
			rightUIListLayout.Name = "RightUIListLayout"
			rightUIListLayout.Padding = UDim.new(0, 15)
			rightUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			rightUIListLayout.Parent = right

			right.Parent = elementsScrolling

			elementsScrolling.Parent = elements1

			function TabFunctions:Section(Settings)
				local SectionFunctions = {}
				local section = Instance.new("Frame")
				section.Name = "Section"
				section.AutomaticSize = Enum.AutomaticSize.Y
				section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				section.BackgroundTransparency = 0.98
				section.BorderColor3 = Color3.fromRGB(0, 0, 0)
				section.BorderSizePixel = 0
				section.Position = UDim2.fromScale(0, 6.78e-08)
				section.Size = UDim2.fromScale(1, 0)
				section.ClipsDescendants = true
				section.Parent = Settings.Side == "Left" and left or right

				local sectionUICorner = Instance.new("UICorner")
				sectionUICorner.Name = "SectionUICorner"
				sectionUICorner.Parent = section

				local sectionUIStroke = Instance.new("UIStroke")
				sectionUIStroke.Name = "SectionUIStroke"
				sectionUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				sectionUIStroke.Color = Color3.fromRGB(255, 255, 255)
				sectionUIStroke.Transparency = 0.95
				sectionUIStroke.Parent = section

				local sectionUIListLayout = Instance.new("UIListLayout")
				sectionUIListLayout.Name = "SectionUIListLayout"
				sectionUIListLayout.Padding = UDim.new(0, 10)
				sectionUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				sectionUIListLayout.Parent = section

				local sectionUIPadding = Instance.new("UIPadding")
				sectionUIPadding.Name = "SectionUIPadding"
				sectionUIPadding.PaddingBottom = UDim.new(0, 20)
				sectionUIPadding.PaddingLeft = UDim.new(0, 20)
				sectionUIPadding.PaddingRight = UDim.new(0, 18)
				sectionUIPadding.PaddingTop = UDim.new(0, 22)
				sectionUIPadding.Parent = section

				function SectionFunctions:Button(Settings, Flag)
					local ButtonFunctions = {Settings = Settings}
					local button = Instance.new("Frame")
					button.Name = "Button"
					button.AutomaticSize = Enum.AutomaticSize.Y
					button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					button.BackgroundTransparency = 1
					button.BorderColor3 = Color3.fromRGB(0, 0, 0)
					button.BorderSizePixel = 0
					button.Size = UDim2.new(1, 0, 0, 38)
					button.Parent = section

					local buttonInteract = Instance.new("TextButton")
					buttonInteract.Name = "ButtonInteract"
					buttonInteract.FontFace = Font.new(assets.interFont)
					buttonInteract.RichText = true
					buttonInteract.TextColor3 = Color3.fromRGB(255, 255, 255)
					buttonInteract.TextSize = 13
					buttonInteract.TextTransparency = 0.5
					buttonInteract.TextTruncate = Enum.TextTruncate.AtEnd
					buttonInteract.TextXAlignment = Enum.TextXAlignment.Left
					buttonInteract.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					buttonInteract.BackgroundTransparency = 1
					buttonInteract.BorderColor3 = Color3.fromRGB(0, 0, 0)
					buttonInteract.BorderSizePixel = 0
					buttonInteract.Size = UDim2.fromScale(1, 1)
					buttonInteract.Parent = button
					buttonInteract.Text = ButtonFunctions.Settings.Name

					local buttonImage = Instance.new("ImageLabel")
					buttonImage.Name = "ButtonImage"
					buttonImage.Image = assets.buttonImage
					buttonImage.ImageTransparency = 0.5
					buttonImage.AnchorPoint = Vector2.new(1, 0.5)
					buttonImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					buttonImage.BackgroundTransparency = 1
					buttonImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
					buttonImage.BorderSizePixel = 0
					buttonImage.Position = UDim2.fromScale(1, 0.5)
					buttonImage.Size = UDim2.fromOffset(15, 15)
					buttonImage.Parent = button

					local TweenSettings = {
						DefaultTransparency = 0.5,
						HoverTransparency = 0.3,

						EasingStyle = Enum.EasingStyle.Sine
					}

					local function ChangeState(State)
						if State == "Idle" then
							Tween(buttonInteract, TweenInfo.new(0.2, TweenSettings.EasingStyle), {
								TextTransparency = TweenSettings.DefaultTransparency
							}):Play()
							Tween(buttonImage, TweenInfo.new(0.2, TweenSettings.EasingStyle), {
								ImageTransparency = TweenSettings.DefaultTransparency
							}):Play()
						elseif State == "Hover" then
							Tween(buttonInteract, TweenInfo.new(0.2, TweenSettings.EasingStyle), {
								TextTransparency = TweenSettings.HoverTransparency
							}):Play()
							Tween(buttonImage, TweenInfo.new(0.2, TweenSettings.EasingStyle), {
								ImageTransparency = TweenSettings.HoverTransparency
							}):Play()
						end
					end

					local function Callback()
						if ButtonFunctions.Settings.Callback then
							ButtonFunctions.Settings.Callback()
						end
					end

					buttonInteract.MouseEnter:Connect(function()
						ChangeState("Hover")
					end)
					buttonInteract.MouseLeave:Connect(function()
						ChangeState("Idle")
					end)

					buttonInteract.MouseButton1Click:Connect(Callback)
					function ButtonFunctions:UpdateName(Name)
						buttonInteract.Text = Name
					end
					function ButtonFunctions:SetVisibility(State)
						button.Visible = State
					end

					if Flag then
						MacLib.Options[Flag] = ButtonFunctions
					end
					return ButtonFunctions
				end

				function SectionFunctions:Toggle(Settings, Flag)
					local ToggleFunctions = { Settings = Settings, IgnoreConfig = false, Class = "Toggle" }
					local toggle = Instance.new("Frame")
					toggle.Name = "Toggle"
					toggle.AutomaticSize = Enum.AutomaticSize.Y
					toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					toggle.BackgroundTransparency = 1
					toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
					toggle.BorderSizePixel = 0
					toggle.Size = UDim2.new(1, 0, 0, 38)
					toggle.Parent = section

					local toggleName = Instance.new("TextLabel")
					toggleName.Name = "ToggleName"
					toggleName.FontFace = Font.new(assets.interFont)
					toggleName.Text = ToggleFunctions.Settings.Name
					toggleName.RichText = true
					toggleName.TextColor3 = Color3.fromRGB(255, 255, 255)
					toggleName.TextSize = 13
					toggleName.TextTransparency = 0.5
					toggleName.TextTruncate = Enum.TextTruncate.AtEnd
					toggleName.TextXAlignment = Enum.TextXAlignment.Left
					toggleName.TextYAlignment = Enum.TextYAlignment.Top
					toggleName.AnchorPoint = Vector2.new(0, 0.5)
					toggleName.AutomaticSize = Enum.AutomaticSize.Y
					toggleName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					toggleName.BackgroundTransparency = 1
					toggleName.BorderColor3 = Color3.fromRGB(0, 0, 0)
					toggleName.BorderSizePixel = 0
					toggleName.Position = UDim2.fromScale(0, 0.5)
					toggleName.Size = UDim2.new(1, -50, 0, 0)
					toggleName.Parent = toggle

					local toggle1 = Instance.new("ImageButton")
					toggle1.Name = "Toggle"
					toggle1.Image = assets.toggleBackground
					toggle1.ImageColor3 = Color3.fromRGB(87, 86, 86)
					toggle1.AutoButtonColor = false
					toggle1.AnchorPoint = Vector2.new(1, 0.5)
					toggle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					toggle1.BackgroundTransparency = 1
					toggle1.BorderColor3 = Color3.fromRGB(0, 0, 0)
					toggle1.BorderSizePixel = 0
					toggle1.Position = UDim2.fromScale(1, 0.5)
					toggle1.Size = UDim2.fromOffset(41, 21)
					toggle1.ImageTransparency = 0.5

					local toggleUIPadding = Instance.new("UIPadding")
					toggleUIPadding.Name = "ToggleUIPadding"
					toggleUIPadding.PaddingBottom = UDim.new(0, 1)
					toggleUIPadding.PaddingLeft = UDim.new(0, -2)
					toggleUIPadding.PaddingRight = UDim.new(0, 3)
					toggleUIPadding.PaddingTop = UDim.new(0, 1)
					toggleUIPadding.Parent = toggle1

					local togglerHead = Instance.new("ImageLabel")
					togglerHead.Name = "TogglerHead"
					togglerHead.Image = assets.togglerHead
					togglerHead.ImageColor3 = Color3.fromRGB(255, 255, 255)
					togglerHead.AnchorPoint = Vector2.new(1, 0.5)
					togglerHead.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					togglerHead.BackgroundTransparency = 1
					togglerHead.BorderColor3 = Color3.fromRGB(0, 0, 0)
					togglerHead.BorderSizePixel = 0
					togglerHead.Position = UDim2.fromScale(0.5, 0.5)
					togglerHead.Size = UDim2.fromOffset(15, 15)
					togglerHead.ZIndex = 2
					togglerHead.Parent = toggle1
					togglerHead.ImageTransparency = 0.8

					toggle1.Parent = toggle

					local toggle1Transparency = {Enabled = 0, Disabled = 0.5}
					local togglerHeadTransparency = {Enabled = 0, Disabled = 0.85}

					local TweenSettings = {
						Info = TweenInfo.new(0.15, Enum.EasingStyle.Quad),

						EnabledPosition = UDim2.new(1, 0, 0.5, 0),
						DisabledPosition = UDim2.new(0.5, 0, 0.5, 0),
					}

					local togglebool = ToggleFunctions.Settings.Default

					local function NewState(State, callback)
						local transparencyValues = State and {toggle1Transparency.Enabled, togglerHeadTransparency.Enabled}
							or {toggle1Transparency.Disabled, togglerHeadTransparency.Disabled}
						local position = State and TweenSettings.EnabledPosition or TweenSettings.DisabledPosition

						Tween(toggle1, TweenSettings.Info, {
							ImageTransparency = transparencyValues[1]
						}):Play()

						Tween(togglerHead, TweenSettings.Info, {
							ImageTransparency = transparencyValues[2]
						}):Play()

						Tween(togglerHead, TweenSettings.Info, {
							Position = position
						}):Play()

						ToggleFunctions.State = State
						if callback then
							callback(togglebool)
						end
					end

					NewState(togglebool)

					local function Toggle()
						togglebool = not togglebool
						NewState(togglebool, ToggleFunctions.Settings.Callback)
					end

					toggle1.MouseButton1Click:Connect(Toggle)

					function ToggleFunctions:Toggle()
						Toggle()
					end
					function ToggleFunctions:UpdateState(State)
						togglebool = State
						NewState(togglebool, ToggleFunctions.Settings.Callback)
					end
					function ToggleFunctions:GetState()
						return togglebool
					end
					function ToggleFunctions:UpdateName(Name)
						toggleName.Text = Name
					end
					function ToggleFunctions:SetVisibility(State)
						toggle.Visible = State
					end

					if Flag then
						MacLib.Options[Flag] = ToggleFunctions
					end
					return ToggleFunctions
				end

				function SectionFunctions:Slider(Settings, Flag)
					local SliderFunctions = { Settings = Settings, IgnoreConfig = false, Class = "Slider" }
					local slider = Instance.new("Frame")
					slider.Name = "Slider"
					slider.AutomaticSize = Enum.AutomaticSize.Y
					slider.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					slider.BackgroundTransparency = 1
					slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
					slider.BorderSizePixel = 0
					slider.Size = UDim2.new(1, 0, 0, 38)
					slider.Parent = section

					local sliderName = Instance.new("TextLabel")
					sliderName.Name = "SliderName"
					sliderName.FontFace = Font.new(assets.interFont)
					sliderName.Text = SliderFunctions.Settings.Name
					sliderName.RichText = true
					sliderName.TextColor3 = Color3.fromRGB(255, 255, 255)
					sliderName.TextSize = 13
					sliderName.TextTransparency = 0.5
					sliderName.TextTruncate = Enum.TextTruncate.AtEnd
					sliderName.TextXAlignment = Enum.TextXAlignment.Left
					sliderName.TextYAlignment = Enum.TextYAlignment.Top
					sliderName.AnchorPoint = Vector2.new(0, 0.5)
					sliderName.AutomaticSize = Enum.AutomaticSize.XY
					sliderName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					sliderName.BackgroundTransparency = 1
					sliderName.BorderColor3 = Color3.fromRGB(0, 0, 0)
					sliderName.BorderSizePixel = 0
					sliderName.Position = UDim2.fromScale(1.3e-07, 0.5)
					sliderName.Parent = slider

					local sliderElements = Instance.new("Frame")
					sliderElements.Name = "SliderElements"
					sliderElements.AnchorPoint = Vector2.new(1, 0)
					sliderElements.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					sliderElements.BackgroundTransparency = 1
					sliderElements.BorderColor3 = Color3.fromRGB(0, 0, 0)
					sliderElements.BorderSizePixel = 0
					sliderElements.Position = UDim2.fromScale(1, 0)
					sliderElements.Size = UDim2.fromScale(1, 1)

					local sliderValue = Instance.new("TextBox")
					sliderValue.Name = "SliderValue"
					sliderValue.FontFace = Font.new(assets.interFont)
					sliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
					sliderValue.TextSize = 12
					sliderValue.TextTransparency = 0.1
					--sliderValue.TextTruncate = Enum.TextTruncate.AtEnd
					sliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					sliderValue.BackgroundTransparency = 0.95
					sliderValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
					sliderValue.BorderSizePixel = 0
					sliderValue.LayoutOrder = 1
					sliderValue.Position = UDim2.fromScale(-0.0789, 0.171)
					sliderValue.Size = UDim2.fromOffset(41, 21)
					sliderValue.ClipsDescendants = true

					local sliderValueUICorner = Instance.new("UICorner")
					sliderValueUICorner.Name = "SliderValueUICorner"
					sliderValueUICorner.CornerRadius = UDim.new(0, 4)
					sliderValueUICorner.Parent = sliderValue

					local sliderValueUIStroke = Instance.new("UIStroke")
					sliderValueUIStroke.Name = "SliderValueUIStroke"
					sliderValueUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					sliderValueUIStroke.Color = Color3.fromRGB(255, 255, 255)
					sliderValueUIStroke.Transparency = 0.9
					sliderValueUIStroke.Parent = sliderValue

					local sliderValueUIPadding = Instance.new("UIPadding")
					sliderValueUIPadding.Name = "SliderValueUIPadding"
					sliderValueUIPadding.PaddingLeft = UDim.new(0, 2)
					sliderValueUIPadding.PaddingRight = UDim.new(0, 2)
					sliderValueUIPadding.Parent = sliderValue

					sliderValue.Parent = sliderElements

					local sliderElementsUIListLayout = Instance.new("UIListLayout")
					sliderElementsUIListLayout.Name = "SliderElementsUIListLayout"
					sliderElementsUIListLayout.Padding = UDim.new(0, 20)
					sliderElementsUIListLayout.FillDirection = Enum.FillDirection.Horizontal
					sliderElementsUIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
					sliderElementsUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					sliderElementsUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
					sliderElementsUIListLayout.Parent = sliderElements

					local sliderBar = Instance.new("ImageLabel")
					sliderBar.Name = "SliderBar"
					sliderBar.Image = assets.sliderbar
					sliderBar.ImageColor3 = Color3.fromRGB(87, 86, 86)
					sliderBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					sliderBar.BackgroundTransparency = 1
					sliderBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
					sliderBar.BorderSizePixel = 0
					sliderBar.Position = UDim2.fromScale(0.219, 0.457)
					sliderBar.Size = UDim2.fromOffset(123, 3)

					local sliderHead = Instance.new("ImageButton")
					sliderHead.Name = "SliderHead"
					sliderHead.Image = assets.sliderhead
					sliderHead.AnchorPoint = Vector2.new(0.5, 0.5)
					sliderHead.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					sliderHead.BackgroundTransparency = 1
					sliderHead.BorderColor3 = Color3.fromRGB(0, 0, 0)
					sliderHead.BorderSizePixel = 0
					sliderHead.Position = UDim2.fromScale(1, 0.5)
					sliderHead.Size = UDim2.fromOffset(12, 12)
					sliderHead.Parent = sliderBar

					sliderBar.Parent = sliderElements

					local sliderElementsUIPadding = Instance.new("UIPadding")
					sliderElementsUIPadding.Name = "SliderElementsUIPadding"
					sliderElementsUIPadding.PaddingTop = UDim.new(0, 3)
					sliderElementsUIPadding.Parent = sliderElements

					sliderElements.Parent = slider

					local dragging = false

					local DisplayMethods = {
						Hundredths = function(sliderValue) -- Deprecated use Settings.Precision
							return string.format("%.2f", sliderValue)
						end,
						Tenths = function(sliderValue) -- Deprecated use Settings.Precision
							return string.format("%.1f", sliderValue)
						end,
						Round = function(sliderValue, precision)
							if precision then
								return string.format("%." .. precision .. "f", sliderValue)
							else
								return tostring(math.round(sliderValue))
							end
						end,
						Degrees = function(sliderValue, precision)
							local formattedValue = precision and string.format("%." .. precision .. "f", sliderValue) or tostring(sliderValue)
							return formattedValue .. "°"
						end,
						Percent = function(sliderValue, precision)
							local percentage = (sliderValue - SliderFunctions.Settings.Minimum) / (SliderFunctions.Settings.Maximum - SliderFunctions.Settings.Minimum) * 100
							return precision and string.format("%." .. precision .. "f", percentage) .. "%" or tostring(math.round(percentage)) .. "%"
						end,
						Value = function(sliderValue, precision)
							return precision and string.format("%." .. precision .. "f", sliderValue) or tostring(sliderValue)
						end
					}

					local ValueDisplayMethod = DisplayMethods[SliderFunctions.Settings.DisplayMethod] or DisplayMethods.Value
					local finalValue

					local function SetValue(val, ignorecallback)
						local posXScale

						if typeof(val) == "Instance" then
							local input = val
							posXScale = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
						else
							local value = val
							posXScale = (value - SliderFunctions.Settings.Minimum) / (SliderFunctions.Settings.Maximum - Settings.Minimum)
						end

						local pos = UDim2.new(posXScale, 0, 0.5, 0)
						sliderHead.Position = pos

						finalValue = posXScale * (SliderFunctions.Settings.Maximum - SliderFunctions.Settings.Minimum) + Settings.Minimum

						sliderValue.Text = (Settings.Prefix or "") .. ValueDisplayMethod(finalValue, SliderFunctions.Settings.Precision) .. (Settings.Suffix or "")

						if not ignorecallback then
							task.spawn(function()
								if SliderFunctions.Settings.Callback then
									SliderFunctions.Settings.Callback(finalValue)
								end
							end)
						end

						SliderFunctions.Value = finalValue
					end

					SetValue(SliderFunctions.Settings.Default, true)

					sliderHead.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							dragging = true
							SetValue(input)
						end
					end)

					sliderHead.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							dragging = false
							if SliderFunctions.Settings.onInputComplete then
								SliderFunctions.Settings.onInputComplete(finalValue)
							end
						end
					end)

					sliderValue.FocusLost:Connect(function(enterPressed)
						local inputText = sliderValue.Text
						local value, isPercent = inputText:match("^(%-?%d+%.?%d*)(%%?)$")

						if value then
							value = tonumber(value)
							isPercent = isPercent == "%"

							if isPercent then
								value = SliderFunctions.Settings.Minimum + (value / 100) * (SliderFunctions.Settings.Maximum - SliderFunctions.Settings.Minimum)
							end

							local newValue = math.clamp(value, SliderFunctions.Settings.Minimum, SliderFunctions.Settings.Maximum)
							SetValue(newValue)
						else
							sliderValue.Text = ValueDisplayMethod(finalValue)
						end

						if SliderFunctions.Settings.onInputComplete then
							SliderFunctions.Settings.onInputComplete(finalValue)
						end
					end)

					UserInputService.InputChanged:Connect(function(input)
						if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
							SetValue(input)
						end
					end)

					local function updateSliderBarSize()
						local padding = sliderElementsUIListLayout.Padding.Offset
						local sliderValueWidth = sliderValue.AbsoluteSize.X
						local sliderNameWidth = sliderName.AbsoluteSize.X
						local totalWidth = sliderElements.AbsoluteSize.X

						local newBarWidth = (totalWidth - (padding + sliderValueWidth + sliderNameWidth + 20)) / baseUIScale.Scale
						sliderBar.Size = UDim2.new(sliderBar.Size.X.Scale, newBarWidth, sliderBar.Size.Y.Scale, sliderBar.Size.Y.Offset)
					end

					updateSliderBarSize()

					sliderName:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateSliderBarSize)
					section:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateSliderBarSize)

					function SliderFunctions:UpdateName(Name)
						sliderName = Name
					end
					function SliderFunctions:SetVisibility(State)
						slider.Visible = State
					end
					function SliderFunctions:UpdateValue(Value)
						SetValue(tonumber(Value), true)
					end
					function SliderFunctions:GetValue()
						return finalValue
					end

					if Flag then
						MacLib.Options[Flag] = SliderFunctions
					end
					return SliderFunctions
				end

				function SectionFunctions:Input(Settings, Flag)
					local InputFunctions = { Settings = Settings, IgnoreConfig = false, Class = "Input" }
					local input = Instance.new("Frame")
					input.Name = "Input"
					input.AutomaticSize = Enum.AutomaticSize.Y
					input.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					input.BackgroundTransparency = 1
					input.BorderColor3 = Color3.fromRGB(0, 0, 0)
					input.BorderSizePixel = 0
					input.Size = UDim2.new(1, 0, 0, 38)
					input.Parent = section

					local inputName = Instance.new("TextLabel")
					inputName.Name = "InputName"
					inputName.FontFace = Font.new(assets.interFont)
					inputName.Text = InputFunctions.Settings.Name
					inputName.RichText = true
					inputName.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputName.TextSize = 13
					inputName.TextTransparency = 0.5
					inputName.TextTruncate = Enum.TextTruncate.AtEnd
					inputName.TextXAlignment = Enum.TextXAlignment.Left
					inputName.TextYAlignment = Enum.TextYAlignment.Top
					inputName.AnchorPoint = Vector2.new(0, 0.5)
					inputName.AutomaticSize = Enum.AutomaticSize.XY
					inputName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputName.BackgroundTransparency = 1
					inputName.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputName.BorderSizePixel = 0
					inputName.Position = UDim2.fromScale(0, 0.5)
					inputName.Parent = input

					local inputBox = Instance.new("TextBox")
					inputBox.Name = "InputBox"
					inputBox.FontFace = Font.new(assets.interFont)
					inputBox.Text = "Hello world!"
					inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputBox.TextSize = 12
					inputBox.TextTransparency = 0.1
					inputBox.AnchorPoint = Vector2.new(1, 0.5)
					inputBox.AutomaticSize = Enum.AutomaticSize.X
					inputBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputBox.BackgroundTransparency = 0.95
					inputBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputBox.BorderSizePixel = 0
					inputBox.ClipsDescendants = true
					inputBox.LayoutOrder = 1
					inputBox.Position = UDim2.fromScale(1, 0.5)
					inputBox.Size = UDim2.fromOffset(21, 21)
					inputBox.TextXAlignment = Enum.TextXAlignment.Right

					local inputBoxUICorner = Instance.new("UICorner")
					inputBoxUICorner.Name = "InputBoxUICorner"
					inputBoxUICorner.CornerRadius = UDim.new(0, 4)
					inputBoxUICorner.Parent = inputBox

					local inputBoxUIStroke = Instance.new("UIStroke")
					inputBoxUIStroke.Name = "InputBoxUIStroke"
					inputBoxUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					inputBoxUIStroke.Color = Color3.fromRGB(255, 255, 255)
					inputBoxUIStroke.Transparency = 0.9
					inputBoxUIStroke.Parent = inputBox

					local inputBoxUIPadding = Instance.new("UIPadding")
					inputBoxUIPadding.Name = "InputBoxUIPadding"
					inputBoxUIPadding.PaddingLeft = UDim.new(0, 5)
					inputBoxUIPadding.PaddingRight = UDim.new(0, 5)
					inputBoxUIPadding.Parent = inputBox

					local inputBoxUISizeConstraint = Instance.new("UISizeConstraint")
					inputBoxUISizeConstraint.Name = "InputBoxUISizeConstraint"
					inputBoxUISizeConstraint.Parent = inputBox

					inputBox.Parent = input

					local Input = input
					local InputBox = inputBox
					local InputName = inputName
					local Constraint = inputBoxUISizeConstraint

					local function applyCharacterLimit(value)
						if InputFunctions.Settings.CharacterLimit then
							return value:sub(1, InputFunctions.Settings.CharacterLimit)
						end
						return value
					end

					local CharacterSubs = {
						All = function(value)
							return applyCharacterLimit(value)
						end,
						Numeric = function(value)
							local result = value:match("^%-?%d*$") and value or value:gsub("[^%d-]", ""):gsub("(%-)", function(match, pos)
								return pos == 1 and match or ""
							end)
							return applyCharacterLimit(result)
						end,
						Alphabetic = function(value)
							return applyCharacterLimit(value:gsub("[^a-zA-Z ]", ""))
						end,
						AlphaNumeric = function(value)
							return applyCharacterLimit(value:gsub("[^a-zA-Z0-9]", ""))
						end,
					}

					local AcceptedCharacters

					if type(InputFunctions.Settings.AcceptedCharacters) == "function" then
						AcceptedCharacters = InputFunctions.Settings.AcceptedCharacters
					else
						AcceptedCharacters = CharacterSubs[InputFunctions.Settings.AcceptedCharacters] or CharacterSubs.All
					end

					InputBox.AutomaticSize = Enum.AutomaticSize.X

					local function checkSize()
						local nameWidth = InputName.AbsoluteSize.X
						local totalWidth = Input.AbsoluteSize.X

						local maxWidth = (totalWidth - nameWidth - 20) / baseUIScale.Scale
						Constraint.MaxSize = Vector2.new(maxWidth, 9e9)
					end

					checkSize()
					InputName:GetPropertyChangedSignal("AbsoluteSize"):Connect(checkSize)

					InputBox.FocusLost:Connect(function()
						local inputText = InputBox.Text
						local filteredText = AcceptedCharacters(inputText)
						InputBox.Text = filteredText
						task.spawn(function()
							if InputFunctions.Settings.Callback then
								InputFunctions.Settings.Callback(filteredText)
							end
						end)
					end)
					InputBox.Text = InputFunctions.Settings.Default or ""
					InputBox.PlaceholderText = InputFunctions.Settings.Placeholder or ""

					InputBox:GetPropertyChangedSignal("Text"):Connect(function()
						InputBox.Text = AcceptedCharacters(InputBox.Text)
						if InputFunctions.Settings.onChanged then
							InputFunctions.Settings.onChanged(InputBox.Text)
						end
						InputFunctions.Text = InputBox.Text
					end)

					function InputFunctions:UpdateName(Name)
						inputName.Text = Name
					end
					function InputFunctions:SetVisibility(State)
						input.Visible = State
					end
					function InputFunctions:GetInput()
						return InputBox.Text
					end
					function InputFunctions:UpdatePlaceholder(Placeholder)
						inputBox.PlaceholderText = Placeholder
					end
					function InputFunctions:UpdateText(Text)
						local filteredText = AcceptedCharacters(Text)
						InputBox.Text = filteredText
						InputFunctions.Text = filteredText
						task.spawn(function()
							if InputFunctions.Settings.Callback then
								InputFunctions.Settings.Callback(filteredText)
							end
						end)
					end

					if Flag then
						MacLib.Options[Flag] = InputFunctions
					end
					return InputFunctions
				end

				function SectionFunctions:Keybind(Settings, Flag)
					local KeybindFunctions = { Settings = Settings, IgnoreConfig = false, Class = "Keybind" }
					local keybind = Instance.new("Frame")
					keybind.Name = "Keybind"
					keybind.AutomaticSize = Enum.AutomaticSize.Y
					keybind.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					keybind.BackgroundTransparency = 1
					keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
					keybind.BorderSizePixel = 0
					keybind.Size = UDim2.new(1, 0, 0, 38)
					keybind.Parent = section

					local keybindName = Instance.new("TextLabel")
					keybindName.Name = "KeybindName"
					keybindName.FontFace = Font.new(assets.interFont)
					keybindName.Text = KeybindFunctions.Settings.Name
					keybindName.RichText = true
					keybindName.TextColor3 = Color3.fromRGB(255, 255, 255)
					keybindName.TextSize = 13
					keybindName.TextTransparency = 0.5
					keybindName.TextTruncate = Enum.TextTruncate.AtEnd
					keybindName.TextXAlignment = Enum.TextXAlignment.Left
					keybindName.TextYAlignment = Enum.TextYAlignment.Top
					keybindName.AnchorPoint = Vector2.new(0, 0.5)
					keybindName.AutomaticSize = Enum.AutomaticSize.XY
					keybindName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					keybindName.BackgroundTransparency = 1
					keybindName.BorderColor3 = Color3.fromRGB(0, 0, 0)
					keybindName.BorderSizePixel = 0
					keybindName.Position = UDim2.fromScale(0, 0.5)
					keybindName.Parent = keybind

					local binderBox = Instance.new("TextBox")
					binderBox.Name = "BinderBox"
					binderBox.CursorPosition = -1
					binderBox.FontFace = Font.new(assets.interFont)
					binderBox.PlaceholderText = "..."
					binderBox.Text = ""
					binderBox.TextColor3 = Color3.fromRGB(255, 255, 255)
					binderBox.TextSize = 12
					binderBox.TextTransparency = 0.1
					binderBox.AnchorPoint = Vector2.new(1, 0.5)
					binderBox.AutomaticSize = Enum.AutomaticSize.X
					binderBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					binderBox.BackgroundTransparency = 0.95
					binderBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
					binderBox.BorderSizePixel = 0
					binderBox.ClipsDescendants = true
					binderBox.LayoutOrder = 1
					binderBox.Position = UDim2.fromScale(1, 0.5)
					binderBox.Size = UDim2.fromOffset(21, 21)

					local binderBoxUICorner = Instance.new("UICorner")
					binderBoxUICorner.Name = "BinderBoxUICorner"
					binderBoxUICorner.CornerRadius = UDim.new(0, 4)
					binderBoxUICorner.Parent = binderBox

					local binderBoxUIStroke = Instance.new("UIStroke")
					binderBoxUIStroke.Name = "BinderBoxUIStroke"
					binderBoxUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					binderBoxUIStroke.Color = Color3.fromRGB(255, 255, 255)
					binderBoxUIStroke.Transparency = 0.9
					binderBoxUIStroke.Parent = binderBox

					local binderBoxUIPadding = Instance.new("UIPadding")
					binderBoxUIPadding.Name = "BinderBoxUIPadding"
					binderBoxUIPadding.PaddingLeft = UDim.new(0, 5)
					binderBoxUIPadding.PaddingRight = UDim.new(0, 5)
					binderBoxUIPadding.Parent = binderBox

					local binderBoxUISizeConstraint = Instance.new("UISizeConstraint")
					binderBoxUISizeConstraint.Name = "BinderBoxUISizeConstraint"
					binderBoxUISizeConstraint.Parent = binderBox

					binderBox.Parent = keybind

					local focused
					local isBinding = false
					local reset = false
					local binded = KeybindFunctions.Settings.Default

					local function resetFocusState()
						focused = false
						isBinding = false
						binderBox:ReleaseFocus()
					end

					if binded then
						binderBox.Text = binded.Name
					end

					binderBox.Focused:Connect(function()
						focused = true
					end)

					binderBox.FocusLost:Connect(function()
						focused = false
					end)

					UserInputService.InputBegan:Connect(function(inp)
						if focused and not isBinding then
							isBinding = true

							local Event
							Event = UserInputService.InputBegan:Connect(function(input)
								if KeybindFunctions.Settings.Blacklist and (table.find(KeybindFunctions.KeybindFunctions.Settings.Blacklist, input.KeyCode) or table.find(KeybindFunctions.Settings.Blacklist, input.UserInputType)) then
									binderBox:ReleaseFocus()
									resetFocusState()
									Event:Disconnect()
									return
								end

								if input.UserInputType == Enum.UserInputType.Keyboard then
									binded = input.KeyCode
									binderBox.Text = input.KeyCode.Name
								elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
									binded = input.UserInputType
									binderBox.Text = input.UserInputType.Name
								end

								if KeybindFunctions.Settings.onBinded then
									KeybindFunctions.Settings.onBinded(binded)
								end
								reset = true
								resetFocusState()
								Event:Disconnect()
							end)
						else
							if not reset and (inp.KeyCode == binded or inp.UserInputType == binded) then
								if KeybindFunctions.Settings.Callback then
									KeybindFunctions.Settings.Callback(binded)
								end
								if KeybindFunctions.Settings.onBindHeld then
									KeybindFunctions.Settings.onBindHeld(true, binded)
								end
							else
								reset = false
							end
						end
					end)

					UserInputService.InputEnded:Connect(function(inp)
						if not focused and not isBinding then
							if inp.KeyCode == binded or inp.UserInputType == binded then
								if Settings.onBindHeld then
									Settings.onBindHeld(false, binded)
								end
							end
						end
					end)

					function KeybindFunctions:Bind(Key)
						binded = Key
						binderBox.Text = Key.Name
					end

					function KeybindFunctions:Unbind()
						binded = nil
						binderBox.Text = ""
					end

					function KeybindFunctions:GetBind()
						return binded
					end

					function KeybindFunctions:UpdateName(Name)
						keybindName = Name
					end

					function KeybindFunctions:SetVisibility(State)
						keybind.Visible = State
					end

					if Flag then
						MacLib.Options[Flag] = KeybindFunctions
					end

					return KeybindFunctions
				end

				function SectionFunctions:Dropdown(Settings, Flag)
					local DropdownFunctions = { Settings = Settings, IgnoreConfig = false, Class = "Dropdown" }
					local Selected = {}
					local OptionObjs = {}

					local dropdown = Instance.new("Frame")
					dropdown.Name = "Dropdown"
					dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					dropdown.BackgroundTransparency = 0.985
					dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
					dropdown.BorderSizePixel = 0
					dropdown.Size = UDim2.new(1, 0, 0, 38)
					dropdown.Parent = section
					dropdown.ClipsDescendants = true

					local dropdownUIPadding = Instance.new("UIPadding")
					dropdownUIPadding.Name = "DropdownUIPadding"
					dropdownUIPadding.PaddingLeft = UDim.new(0, 15)
					dropdownUIPadding.PaddingRight = UDim.new(0, 15)
					dropdownUIPadding.Parent = dropdown

					local interact = Instance.new("TextButton")
					interact.Name = "Interact"
					interact.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
					interact.Text = ""
					interact.TextColor3 = Color3.fromRGB(0, 0, 0)
					interact.TextSize = 14
					interact.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					interact.BackgroundTransparency = 1
					interact.BorderColor3 = Color3.fromRGB(0, 0, 0)
					interact.BorderSizePixel = 0
					interact.Size = UDim2.new(1, 0, 0, 38)
					interact.Parent = dropdown

					local dropdownName = Instance.new("TextLabel")
					dropdownName.Name = "DropdownName"
					dropdownName.FontFace = Font.new(assets.interFont)
					dropdownName.Text = Settings.Default and (DropdownFunctions.Settings.Name .. " • " .. table.concat(Selected, ", ")) or (DropdownFunctions.Settings.Name .. "...")
					dropdownName.RichText = true
					dropdownName.TextColor3 = Color3.fromRGB(255, 255, 255)
					dropdownName.TextSize = 13
					dropdownName.TextTransparency = 0.5
					dropdownName.TextTruncate = Enum.TextTruncate.SplitWord
					dropdownName.TextXAlignment = Enum.TextXAlignment.Left
					dropdownName.AutomaticSize = Enum.AutomaticSize.Y
					dropdownName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					dropdownName.BackgroundTransparency = 1
					dropdownName.BorderColor3 = Color3.fromRGB(0, 0, 0)
					dropdownName.BorderSizePixel = 0
					dropdownName.Size = UDim2.new(1, -20, 0, 38)
					dropdownName.Parent = dropdown

					local dropdownUIStroke = Instance.new("UIStroke")
					dropdownUIStroke.Name = "DropdownUIStroke"
					dropdownUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					dropdownUIStroke.Color = Color3.fromRGB(255, 255, 255)
					dropdownUIStroke.Transparency = 0.95
					dropdownUIStroke.Parent = dropdown

					local dropdownUICorner = Instance.new("UICorner")
					dropdownUICorner.Name = "DropdownUICorner"
					dropdownUICorner.CornerRadius = UDim.new(0, 6)
					dropdownUICorner.Parent = dropdown

					local dropdownImage = Instance.new("ImageLabel")
					dropdownImage.Name = "DropdownImage"
					dropdownImage.Image = assets.dropdown
					dropdownImage.ImageTransparency = 0.5
					dropdownImage.AnchorPoint = Vector2.new(1, 0)
					dropdownImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					dropdownImage.BackgroundTransparency = 1
					dropdownImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
					dropdownImage.BorderSizePixel = 0
					dropdownImage.Position = UDim2.new(1, 0, 0, 12)
					dropdownImage.Size = UDim2.fromOffset(14, 14)
					dropdownImage.Parent = dropdown

					local dropdownFrame = Instance.new("Frame")
					dropdownFrame.Name = "DropdownFrame"
					dropdownFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					dropdownFrame.BackgroundTransparency = 1
					dropdownFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
					dropdownFrame.BorderSizePixel = 0
					dropdownFrame.ClipsDescendants = true
					dropdownFrame.Size = UDim2.fromScale(1, 1)
					dropdownFrame.Visible = false
					dropdownFrame.AutomaticSize = Enum.AutomaticSize.Y

					local dropdownFrameUIPadding = Instance.new("UIPadding")
					dropdownFrameUIPadding.Name = "DropdownFrameUIPadding"
					dropdownFrameUIPadding.PaddingTop = UDim.new(0, 38)
					dropdownFrameUIPadding.PaddingBottom = UDim.new(0, 10)
					dropdownFrameUIPadding.Parent = dropdownFrame

					local dropdownFrameUIListLayout = Instance.new("UIListLayout")
					dropdownFrameUIListLayout.Name = "DropdownFrameUIListLayout"
					dropdownFrameUIListLayout.Padding = UDim.new(0, 5)
					dropdownFrameUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					dropdownFrameUIListLayout.Parent = dropdownFrame

					local search = Instance.new("Frame")
					search.Name = "Search"
					search.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					search.BackgroundTransparency = 0.95
					search.BorderColor3 = Color3.fromRGB(0, 0, 0)
					search.BorderSizePixel = 0
					search.LayoutOrder = -1
					search.Size = UDim2.new(1, 0, 0, 30)
					search.Parent = dropdownFrame
					search.Visible = DropdownFunctions.Settings.Search

					local sectionUICorner = Instance.new("UICorner")
					sectionUICorner.Name = "SectionUICorner"
					sectionUICorner.Parent = search

					local searchIcon = Instance.new("ImageLabel")
					searchIcon.Name = "SearchIcon"
					searchIcon.Image = assets.searchIcon
					searchIcon.ImageColor3 = Color3.fromRGB(180, 180, 180)
					searchIcon.AnchorPoint = Vector2.new(0, 0.5)
					searchIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					searchIcon.BackgroundTransparency = 1
					searchIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
					searchIcon.BorderSizePixel = 0
					searchIcon.Position = UDim2.fromScale(0, 0.5)
					searchIcon.Size = UDim2.fromOffset(12, 12)
					searchIcon.Parent = search

					local uIPadding = Instance.new("UIPadding")
					uIPadding.Name = "UIPadding"
					uIPadding.PaddingLeft = UDim.new(0, 15)
					uIPadding.Parent = search

					local searchBox = Instance.new("TextBox")
					searchBox.Name = "SearchBox"
					searchBox.CursorPosition = -1
					searchBox.FontFace = Font.new(
						assets.interFont,
						Enum.FontWeight.Medium,
						Enum.FontStyle.Normal
					)
					searchBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
					searchBox.PlaceholderText = "Search..."
					searchBox.Text = ""
					searchBox.TextColor3 = Color3.fromRGB(200, 200, 200)
					searchBox.TextSize = 14
					searchBox.TextXAlignment = Enum.TextXAlignment.Left
					searchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					searchBox.BackgroundTransparency = 1
					searchBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
					searchBox.BorderSizePixel = 0
					searchBox.Size = UDim2.fromScale(1, 1)

					local function CalculateDropdownSize()
						local totalHeight = 0
						local visibleChildrenCount = 0
						local padding = dropdownFrameUIPadding.PaddingTop.Offset + dropdownFrameUIPadding.PaddingBottom.Offset

						for _, v in pairs(dropdownFrame:GetChildren()) do
							if not v:IsA("UIComponent") and v.Visible then
								totalHeight += v.AbsoluteSize.Y
								visibleChildrenCount += 1
							end
						end

						local spacing = dropdownFrameUIListLayout.Padding.Offset * (visibleChildrenCount - 1)

						return totalHeight + spacing + padding
					end

					local function findOption()
						local searchTerm = searchBox.Text:lower()

						for _, v in pairs(OptionObjs) do
							local optionText = v.NameLabel.Text:lower()
							local isVisible = string.find(optionText, searchTerm) ~= nil

							if v.Button.Visible ~= isVisible then
								v.Button.Visible = isVisible
							end
						end

						dropdown.Size = UDim2.new(1, 0, 0, CalculateDropdownSize())
					end

					searchBox:GetPropertyChangedSignal("Text"):Connect(findOption)

					local uIPadding1 = Instance.new("UIPadding")
					uIPadding1.Name = "UIPadding"
					uIPadding1.PaddingLeft = UDim.new(0, 23)
					uIPadding1.Parent = searchBox

					searchBox.Parent = search

					local tweensettings = {
						duration = 0.2,
						easingStyle = Enum.EasingStyle.Quint,
						transparencyIn = 0.2,
						transparencyOut = 0.5,
						checkSizeIncrease = 12,
						checkSizeDecrease = -13,
						waitTime = 1
					}

					local function Toggle(optionName, State)
						local option = OptionObjs[optionName]

						if not option then return end

						local checkmark = option.Checkmark
						local optionNameLabel = option.NameLabel

						if State then
							if DropdownFunctions.Settings.Multi then
								if not table.find(Selected, optionName) then
									table.insert(Selected, optionName)
									DropdownFunctions.Value = Selected
								end
							else
								for name, opt in pairs(OptionObjs) do
									if name ~= optionName then
										Tween(opt.Checkmark, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle), {
											Size = UDim2.new(opt.Checkmark.Size.X.Scale, tweensettings.checkSizeDecrease, opt.Checkmark.Size.Y.Scale, opt.Checkmark.Size.Y.Offset)
										}):Play()
										Tween(opt.NameLabel, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle), {
											TextTransparency = tweensettings.transparencyOut
										}):Play()
										opt.Checkmark.TextTransparency = 1
									end
								end
								Selected = {optionName}
								DropdownFunctions.Value = Selected[1]
							end
							Tween(checkmark, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle), {
								Size = UDim2.new(checkmark.Size.X.Scale, tweensettings.checkSizeIncrease, checkmark.Size.Y.Scale, checkmark.Size.Y.Offset)
							}):Play()
							Tween(optionNameLabel, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle), {
								TextTransparency = tweensettings.transparencyIn
							}):Play()
							checkmark.TextTransparency = 0
						else
							if DropdownFunctions.Settings.Multi then
								local idx = table.find(Selected, optionName)
								if idx then
									table.remove(Selected, idx)
								end
							else
								Selected = {}
							end
							Tween(checkmark, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle), {
								Size = UDim2.new(checkmark.Size.X.Scale, tweensettings.checkSizeDecrease, checkmark.Size.Y.Scale, checkmark.Size.Y.Offset)
							}):Play()
							Tween(optionNameLabel, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle), {
								TextTransparency = tweensettings.transparencyOut
							}):Play()
							checkmark.TextTransparency = 1
						end

						if Settings.Required and #Selected == 0 and not State then
							return
						end

						if #Selected > 0 then
							dropdownName.Text = DropdownFunctions.Settings.Name .. " • " .. table.concat(Selected, ", ")
						else
							dropdownName.Text = DropdownFunctions.Settings.Name .. "..."
						end
					end

					local dropped = false
					local db = false

					local function ToggleDropdown()
						if db then return end
						db = true
						local defaultDropdownSize = 38
						local isDropdownOpen = not dropped
						local targetSize = isDropdownOpen and UDim2.new(1, 0, 0, CalculateDropdownSize()) or UDim2.new(1, 0, 0, defaultDropdownSize)

						local dropTween = Tween(dropdown, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
							Size = targetSize
						})
						local iconTween = Tween(dropdownImage, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							Rotation = isDropdownOpen and -90 or 0
						})

						dropTween:Play()
						iconTween:Play()

						if isDropdownOpen then
							dropdownFrame.Visible = true
							dropTween.Completed:Connect(function()
								db = false
							end)
						else
							dropTween.Completed:Connect(function()
								dropdownFrame.Visible = false
								db = false
							end)
						end

						dropped = isDropdownOpen
					end

					interact.MouseButton1Click:Connect(ToggleDropdown)

					local function addOption(i, v)
						local option = Instance.new("TextButton")
						option.Name = "Option"
						option.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
						option.Text = ""
						option.TextColor3 = Color3.fromRGB(0, 0, 0)
						option.TextSize = 14
						option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						option.BackgroundTransparency = 1
						option.BorderColor3 = Color3.fromRGB(0, 0, 0)
						option.BorderSizePixel = 0
						option.Size = UDim2.new(1, 0, 0, 30)

						local optionUIPadding = Instance.new("UIPadding")
						optionUIPadding.Name = "OptionUIPadding"
						optionUIPadding.PaddingLeft = UDim.new(0, 15)
						optionUIPadding.Parent = option

						local optionName = Instance.new("TextLabel")
						optionName.Name = "OptionName"
						optionName.FontFace = Font.new(assets.interFont)
						optionName.Text = v
						optionName.RichText = true
						optionName.TextColor3 = Color3.fromRGB(255, 255, 255)
						optionName.TextSize = 13
						optionName.TextTransparency = 0.5
						optionName.TextTruncate = Enum.TextTruncate.AtEnd
						optionName.TextXAlignment = Enum.TextXAlignment.Left
						optionName.TextYAlignment = Enum.TextYAlignment.Top
						optionName.AnchorPoint = Vector2.new(0, 0.5)
						optionName.AutomaticSize = Enum.AutomaticSize.XY
						optionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						optionName.BackgroundTransparency = 1
						optionName.BorderColor3 = Color3.fromRGB(0, 0, 0)
						optionName.BorderSizePixel = 0
						optionName.Position = UDim2.fromScale(1.3e-07, 0.5)
						optionName.Parent = option

						local optionUIListLayout = Instance.new("UIListLayout")
						optionUIListLayout.Name = "OptionUIListLayout"
						optionUIListLayout.Padding = UDim.new(0, 10)
						optionUIListLayout.FillDirection = Enum.FillDirection.Horizontal
						optionUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
						optionUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
						optionUIListLayout.Parent = option

						local checkmark = Instance.new("TextLabel")
						checkmark.Name = "Checkmark"
						checkmark.FontFace = Font.new(assets.interFont)
						checkmark.Text = "✓"
						checkmark.TextColor3 = Color3.fromRGB(255, 255, 255)
						checkmark.TextSize = 13
						checkmark.TextTransparency = 1
						checkmark.TextXAlignment = Enum.TextXAlignment.Left
						checkmark.TextYAlignment = Enum.TextYAlignment.Top
						checkmark.AnchorPoint = Vector2.new(0, 0.5)
						checkmark.AutomaticSize = Enum.AutomaticSize.Y
						checkmark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						checkmark.BackgroundTransparency = 1
						checkmark.BorderColor3 = Color3.fromRGB(0, 0, 0)
						checkmark.BorderSizePixel = 0
						checkmark.LayoutOrder = -1
						checkmark.Position = UDim2.fromScale(1.3e-07, 0.5)
						checkmark.Size = UDim2.fromOffset(-10, 0)
						checkmark.Parent = option

						option.Parent = dropdownFrame

						dropdownFrame.Parent = dropdown
						OptionObjs[v] = {
							Index = i,
							Button = option,
							NameLabel = optionName,
							Checkmark = checkmark
						}

						local tweensettings = {
							duration = 0.2,
							easingStyle = Enum.EasingStyle.Quint,
							transparencyIn = 0.2,
							transparencyOut = 0.5,
							checkSizeIncrease = 12,
							checkSizeDecrease = -optionUIListLayout.Padding.Offset,
							waitTime = 1
						}
						local tweens = {
							checkIn = Tween(checkmark, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle), {
								Size = UDim2.new(checkmark.Size.X.Scale, tweensettings.checkSizeIncrease, checkmark.Size.Y.Scale, checkmark.Size.Y.Offset)
							}),
							checkOut = Tween(checkmark, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle),{
								Size = UDim2.new(checkmark.Size.X.Scale, tweensettings.checkSizeDecrease, checkmark.Size.Y.Scale, checkmark.Size.Y.Offset)
							}),
							nameIn = Tween(optionName, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle),{
								TextTransparency = tweensettings.transparencyIn
							}),
							nameOut = Tween(optionName, TweenInfo.new(tweensettings.duration, tweensettings.easingStyle),{
								TextTransparency = tweensettings.transparencyOut
							})
						}

						local isSelected = false
						if DropdownFunctions.Settings.Default then
							if DropdownFunctions.Settings.Multi then
								isSelected = table.find(DropdownFunctions.Settings.Default, v) and true or false
							else
								isSelected = (DropdownFunctions.Settings.Default == i) and true or false
							end
						end
						Toggle(v, isSelected)

						local option = OptionObjs[v].Button

						option.MouseButton1Click:Connect(function()
							local isSelected = table.find(Selected, v) and true or false
							local newSelected = not isSelected

							if DropdownFunctions.Settings.Required and not newSelected and #Selected <= 1 then
								return
							end

							Toggle(v, newSelected)

							task.spawn(function()
								if DropdownFunctions.Settings.Multi then
									local Return = {}
									for _, opt in ipairs(Selected) do
										Return[opt] = true
									end
									if DropdownFunctions.Settings.Callback then
										DropdownFunctions.Settings.Callback(Return)
									end

								else
									if newSelected and DropdownFunctions.Settings.Callback then
										DropdownFunctions.Settings.Callback(Selected[1] or nil)
									end
								end
							end)
						end)

						if dropped then
							dropdown.Size = UDim2.new(1, 0, 0, CalculateDropdownSize())
						end
					end

					if DropdownFunctions.Settings.Options then
						for i, v in pairs(DropdownFunctions.Settings.Options) do
							addOption(i, v)
						end
					end

					function DropdownFunctions:UpdateName(New)
						dropdownName.Text = New
					end
					function DropdownFunctions:SetVisibility(State)
						dropdown.Visible = State
					end
					function DropdownFunctions:UpdateSelection(newSelection)
						if not newSelection then return end

						for option, _ in pairs(OptionObjs) do
							Toggle(option, false)
						end

						local selectedOptions = {}
						if type(newSelection) == "number" then
							for option, data in pairs(OptionObjs) do
								local isSelected = data.Index == newSelection
								Toggle(option, isSelected)
								if isSelected then
									table.insert(selectedOptions, option)
								end
							end
						elseif type(newSelection) == "string" then
							for option, data in pairs(OptionObjs) do
								local isSelected = option == newSelection
								Toggle(option, isSelected)
								if isSelected then
									table.insert(selectedOptions, option)
								end
							end
						elseif type(newSelection) == "table" then
							for option, _ in pairs(OptionObjs) do
								local isSelected = table.find(newSelection, option) ~= nil
								Toggle(option, isSelected)
								if isSelected then
									table.insert(selectedOptions, option)
								end
							end
						end

						if DropdownFunctions.Settings.Callback then
							if DropdownFunctions.Settings.Multi then
								local Return = {}
								for _, opt in ipairs(selectedOptions) do
									Return[opt] = true
								end
								DropdownFunctions.Settings.Callback(Return)
							else
								DropdownFunctions.Settings.Callback(selectedOptions[1] or nil)
							end
						end
					end
					function DropdownFunctions:InsertOptions(newOptions)
						if not newOptions then return end
						DropdownFunctions.Settings.Options = newOptions
						for i, v in pairs(newOptions) do
							addOption(i, v)
						end
					end
					function DropdownFunctions:ClearOptions()
						for _, optionData in pairs(OptionObjs) do
							optionData.Button:Destroy()
						end
						OptionObjs = {}
						Selected = {}

						if dropped then
							dropdown.Size = UDim2.new(1, 0, 0, CalculateDropdownSize())
						end
					end
					function DropdownFunctions:GetOptions()
						local optionsStatus = {}

						for option, data in pairs(OptionObjs) do
							local isSelected = table.find(Selected, option) and true or false
							optionsStatus[option] = isSelected
						end

						return optionsStatus
					end

					function DropdownFunctions:RemoveOptions(remove)
						if not remove then return end
						for _, optionName in ipairs(remove) do
							local optionData = OptionObjs[optionName]

							if optionData then
								for i = #Selected, 1, -1 do
									if Selected[i] == optionName then
										table.remove(Selected, i)
									end
								end

								optionData.Button:Destroy()

								OptionObjs[optionName] = nil
							end
						end

						if dropped then
							dropdown.Size = UDim2.new(1, 0, 0, CalculateDropdownSize())
						end
					end
					function DropdownFunctions:IsOption(optionName)
						if not optionName then return end
						return OptionObjs[optionName] ~= nil
					end

					if Flag then
						MacLib.Options[Flag] = DropdownFunctions
					end

					return DropdownFunctions
				end

				function SectionFunctions:Colorpicker(Settings, Flag)
					local ColorpickerFunctions = { Settings = Settings, IgnoreConfig = false, Class = "Colorpicker" }

					local isAlpha = ColorpickerFunctions.Settings.Alpha and true or false
					ColorpickerFunctions.Color = ColorpickerFunctions.Settings.Default
					ColorpickerFunctions.Alpha = isAlpha and ColorpickerFunctions.Settings.Alpha

					local colorpicker = Instance.new("Frame")
					colorpicker.Name = "Colorpicker"
					colorpicker.AutomaticSize = Enum.AutomaticSize.Y
					colorpicker.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					colorpicker.BackgroundTransparency = 1
					colorpicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
					colorpicker.BorderSizePixel = 0
					colorpicker.Size = UDim2.new(1, 0, 0, 38)
					colorpicker.Parent = section

					local colorpickerName = Instance.new("TextLabel")
					colorpickerName.Name = "KeybindName"
					colorpickerName.FontFace = Font.new(assets.interFont)
					colorpickerName.Text = Settings.Name
					colorpickerName.TextColor3 = Color3.fromRGB(255, 255, 255)
					colorpickerName.TextSize = 13
					colorpickerName.TextTransparency = 0.5
					colorpickerName.RichText = true
					colorpickerName.TextTruncate = Enum.TextTruncate.AtEnd
					colorpickerName.TextXAlignment = Enum.TextXAlignment.Left
					colorpickerName.TextYAlignment = Enum.TextYAlignment.Top
					colorpickerName.AnchorPoint = Vector2.new(0, 0.5)
					colorpickerName.AutomaticSize = Enum.AutomaticSize.XY
					colorpickerName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					colorpickerName.BackgroundTransparency = 1
					colorpickerName.BorderColor3 = Color3.fromRGB(0, 0, 0)
					colorpickerName.BorderSizePixel = 0
					colorpickerName.Position = UDim2.fromScale(0, 0.5)
					colorpickerName.Parent = colorpicker

					local colorCbg = Instance.new("ImageLabel")
					colorCbg.Name = "NewColor"
					colorCbg.Image = assets.grid
					colorCbg.ScaleType = Enum.ScaleType.Tile
					colorCbg.TileSize = UDim2.fromOffset(500, 500)
					colorCbg.AnchorPoint = Vector2.new(1, 0.5)
					colorCbg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					colorCbg.BackgroundTransparency = 1
					colorCbg.BorderColor3 = Color3.fromRGB(0, 0, 0)
					colorCbg.BorderSizePixel = 0
					colorCbg.Position = UDim2.fromScale(1, 0.5)
					colorCbg.Size = UDim2.fromOffset(21, 21)

					local colorC = Instance.new("Frame")
					colorC.Name = "Color"
					colorC.AnchorPoint = Vector2.new(0.5, 0.5)
					colorC.BackgroundColor3 = ColorpickerFunctions.Color
					colorC.BorderSizePixel = 0
					colorC.Position = UDim2.fromScale(0.5, 0.5)
					colorC.Size = UDim2.fromScale(1, 1)
					colorC.BackgroundTransparency = ColorpickerFunctions.Alpha or 0

					local uICorner = Instance.new("UICorner")
					uICorner.Name = "UICorner"
					uICorner.CornerRadius = UDim.new(0, 6)
					uICorner.Parent = colorC

					local interact = Instance.new("TextButton")
					interact.Name = "Interact"
					interact.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
					interact.Text = ""
					interact.TextColor3 = Color3.fromRGB(0, 0, 0)
					interact.TextSize = 14
					interact.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					interact.BackgroundTransparency = 1
					interact.BorderColor3 = Color3.fromRGB(0, 0, 0)
					interact.BorderSizePixel = 0
					interact.Size = UDim2.fromScale(1, 1)
					interact.Parent = colorC

					colorC.Parent = colorCbg

					local uICorner1 = Instance.new("UICorner")
					uICorner1.Name = "UICorner"
					uICorner1.CornerRadius = UDim.new(0, 8)
					uICorner1.Parent = colorCbg

					colorCbg.Parent = colorpicker

					local colorPicker = Instance.new("Frame")
					colorPicker.Name = "ColorPicker"
					colorPicker.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					colorPicker.BackgroundTransparency = 0.5
					colorPicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
					colorPicker.BorderSizePixel = 0
					colorPicker.Size = UDim2.fromScale(1, 1)
					colorPicker.Visible = false

					local baseUICorner = Instance.new("UICorner")
					baseUICorner.Name = "BaseUICorner"
					baseUICorner.CornerRadius = UDim.new(0, 10)
					baseUICorner.Parent = colorPicker

					local prompt = Instance.new("Frame")
					prompt.Name = "Prompt"
					prompt.AnchorPoint = Vector2.new(0.5, 0.5)
					prompt.AutomaticSize = Enum.AutomaticSize.Y
					prompt.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
					prompt.BorderColor3 = Color3.fromRGB(0, 0, 0)
					prompt.BorderSizePixel = 0
					prompt.Position = UDim2.fromScale(0.5, 0.5)
					prompt.Size = UDim2.fromOffset(420, 0)

					local promptUIScale = Instance.new("UIScale")
					promptUIScale.Name = "BaseUIScale"
					promptUIScale.Parent = prompt
					promptUIScale.Scale = 0.95

					local globalSettingsUIStroke = Instance.new("UIStroke")
					globalSettingsUIStroke.Name = "GlobalSettingsUIStroke"
					globalSettingsUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					globalSettingsUIStroke.Color = Color3.fromRGB(255, 255, 255)
					globalSettingsUIStroke.Transparency = 0.9
					globalSettingsUIStroke.Parent = prompt

					local globalSettingsUICorner = Instance.new("UICorner")
					globalSettingsUICorner.Name = "GlobalSettingsUICorner"
					globalSettingsUICorner.CornerRadius = UDim.new(0, 10)
					globalSettingsUICorner.Parent = prompt

					local uIListLayout = Instance.new("UIListLayout")
					uIListLayout.Name = "UIListLayout"
					uIListLayout.Padding = UDim.new(0, 10)
					uIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
					uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout.Parent = prompt

					local colorOptions = Instance.new("Frame")
					colorOptions.Name = "ColorOptions"
					colorOptions.AutomaticSize = Enum.AutomaticSize.XY
					colorOptions.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					colorOptions.BackgroundTransparency = 1
					colorOptions.BorderColor3 = Color3.fromRGB(0, 0, 0)
					colorOptions.BorderSizePixel = 0
					colorOptions.LayoutOrder = 1
					colorOptions.Size = UDim2.fromScale(1, 0)

					local value = Instance.new("TextButton")
					value.Name = "Value"
					value.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
					value.Text = ""
					value.TextColor3 = Color3.fromRGB(0, 0, 0)
					value.TextSize = 14
					value.AutoButtonColor = false
					value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					value.BorderColor3 = Color3.fromRGB(0, 0, 0)
					value.BorderSizePixel = 0
					value.LayoutOrder = 1
					value.Position = UDim2.fromScale(0.092, 0.886)
					value.Size = UDim2.new(1, 0, 0, 15)

					local uIGradient = Instance.new("UIGradient")
					uIGradient.Name = "UIGradient"
					uIGradient.Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
						ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
					})
					uIGradient.Parent = value

					local slide = Instance.new("Frame")
					slide.Name = "Slide"
					slide.AnchorPoint = Vector2.new(0, 0.5)
					slide.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					slide.BorderColor3 = Color3.fromRGB(27, 42, 53)
					slide.BorderSizePixel = 0
					slide.Position = UDim2.fromScale(0, 0.5)
					slide.Size = UDim2.new(0, 13, 1, 8)

					local uICorner = Instance.new("UICorner")
					uICorner.Name = "UICorner"
					uICorner.CornerRadius = UDim.new(1, 0)
					uICorner.Parent = slide

					local uIStroke = Instance.new("UIStroke")
					uIStroke.Name = "UIStroke"
					uIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					uIStroke.Transparency = 0.5
					uIStroke.Parent = slide

					slide.Parent = value

					local uICorner1 = Instance.new("UICorner")
					uICorner1.Name = "UICorner"
					uICorner1.CornerRadius = UDim.new(0, 6)
					uICorner1.Parent = value

					local uIStroke1 = Instance.new("UIStroke")
					uIStroke1.Name = "UIStroke"
					uIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					uIStroke1.Color = Color3.fromRGB(255, 255, 255)
					uIStroke1.Transparency = 0.9

					local uIGradient1 = Instance.new("UIGradient")
					uIGradient1.Name = "UIGradient"
					uIGradient1.Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
						ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
					})
					uIGradient1.Rotation = 180
					uIGradient1.Parent = uIStroke1

					uIStroke1.Parent = value

					value.Parent = colorOptions

					local uIListLayout1 = Instance.new("UIListLayout")
					uIListLayout1.Name = "UIListLayout"
					uIListLayout1.Padding = UDim.new(0, 25)
					uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout1.Parent = colorOptions

					local wheel = Instance.new("Frame")
					wheel.Name = "Wheel"
					wheel.AutomaticSize = Enum.AutomaticSize.Y
					wheel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					wheel.BackgroundTransparency = 1
					wheel.BorderColor3 = Color3.fromRGB(0, 0, 0)
					wheel.BorderSizePixel = 0
					wheel.Size = UDim2.new(1, 0, 0, 100)

					local wheel1 = Instance.new("ImageButton")
					wheel1.Name = "Wheel"
					wheel1.Image = assets.colorWheel
					wheel1.AutoButtonColor = false
					wheel1.Active = false
					wheel1.BackgroundColor3 = Color3.fromRGB(248, 248, 248)
					wheel1.BackgroundTransparency = 1
					wheel1.BorderColor3 = Color3.fromRGB(27, 42, 53)
					wheel1.Selectable = false
					wheel1.Size = UDim2.fromOffset(220, 220)
					wheel1.SizeConstraint = Enum.SizeConstraint.RelativeYY

					local target = Instance.new("ImageLabel")
					target.Name = "Target"
					target.Image = assets.colorTarget
					target.ImageColor3 = Color3.fromRGB(0, 0, 0)
					target.AnchorPoint = Vector2.new(0.5, 0.5)
					target.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					target.BackgroundTransparency = 1
					target.BorderColor3 = Color3.fromRGB(27, 42, 53)
					target.Position = UDim2.fromScale(0.5, 0.5)
					target.Size = UDim2.fromOffset(22, 22)
					target.SizeConstraint = Enum.SizeConstraint.RelativeYY
					target.Parent = wheel1

					wheel1.Parent = wheel

					local inputs = Instance.new("Frame")
					inputs.Name = "Inputs"
					inputs.AnchorPoint = Vector2.new(1, 0.5)
					inputs.AutomaticSize = Enum.AutomaticSize.XY
					inputs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputs.BackgroundTransparency = 1
					inputs.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputs.BorderSizePixel = 0
					inputs.LayoutOrder = 1
					inputs.Position = UDim2.fromScale(1, 0.5)

					local uIListLayout2 = Instance.new("UIListLayout")
					uIListLayout2.Name = "UIListLayout"
					uIListLayout2.Padding = UDim.new(0, 5)
					uIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout2.Parent = inputs

					local red = Instance.new("Frame")
					red.Name = "Red"
					red.AutomaticSize = Enum.AutomaticSize.XY
					red.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					red.BackgroundTransparency = 1
					red.BorderColor3 = Color3.fromRGB(0, 0, 0)
					red.BorderSizePixel = 0
					red.LayoutOrder = 1
					red.Size = UDim2.fromOffset(0, 38)

					local inputName = Instance.new("TextLabel")
					inputName.Name = "InputName"
					inputName.FontFace = Font.new(assets.interFont)
					inputName.Text = "Red"
					inputName.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputName.TextSize = 13
					inputName.TextTransparency = 0.5
					inputName.TextTruncate = Enum.TextTruncate.AtEnd
					inputName.TextXAlignment = Enum.TextXAlignment.Left
					inputName.TextYAlignment = Enum.TextYAlignment.Top
					inputName.AnchorPoint = Vector2.new(0, 0.5)
					inputName.AutomaticSize = Enum.AutomaticSize.XY
					inputName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputName.BackgroundTransparency = 1
					inputName.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputName.BorderSizePixel = 0
					inputName.LayoutOrder = 2
					inputName.Position = UDim2.fromScale(0, 0.5)
					inputName.Parent = red

					local uIListLayout3 = Instance.new("UIListLayout")
					uIListLayout3.Name = "UIListLayout"
					uIListLayout3.Padding = UDim.new(0, 15)
					uIListLayout3.FillDirection = Enum.FillDirection.Horizontal
					uIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout3.VerticalAlignment = Enum.VerticalAlignment.Center
					uIListLayout3.Parent = red

					local inputBox = Instance.new("TextBox")
					inputBox.Name = "InputBox"
					inputBox.ClearTextOnFocus = false
					inputBox.CursorPosition = -1
					inputBox.FontFace = Font.new(assets.interFont)
					inputBox.Text = "255"
					inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputBox.TextSize = 12
					inputBox.TextTransparency = 0.1
					inputBox.TextXAlignment = Enum.TextXAlignment.Left
					inputBox.AnchorPoint = Vector2.new(1, 0.5)
					inputBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputBox.BackgroundTransparency = 0.95
					inputBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputBox.BorderSizePixel = 0
					inputBox.ClipsDescendants = true
					inputBox.LayoutOrder = 1
					inputBox.Position = UDim2.fromScale(1, 0.5)
					inputBox.Size = UDim2.fromOffset(75, 25)

					local inputBoxUICorner = Instance.new("UICorner")
					inputBoxUICorner.Name = "InputBoxUICorner"
					inputBoxUICorner.CornerRadius = UDim.new(0, 4)
					inputBoxUICorner.Parent = inputBox

					local inputBoxUIStroke = Instance.new("UIStroke")
					inputBoxUIStroke.Name = "InputBoxUIStroke"
					inputBoxUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					inputBoxUIStroke.Color = Color3.fromRGB(255, 255, 255)
					inputBoxUIStroke.Transparency = 0.9
					inputBoxUIStroke.Parent = inputBox

					local inputBoxUISizeConstraint = Instance.new("UISizeConstraint")
					inputBoxUISizeConstraint.Name = "InputBoxUISizeConstraint"
					inputBoxUISizeConstraint.Parent = inputBox

					local inputBoxUIPadding = Instance.new("UIPadding")
					inputBoxUIPadding.Name = "InputBoxUIPadding"
					inputBoxUIPadding.PaddingLeft = UDim.new(0, 8)
					inputBoxUIPadding.PaddingRight = UDim.new(0, 10)
					inputBoxUIPadding.Parent = inputBox

					inputBox.Parent = red

					red.Parent = inputs

					local green = Instance.new("Frame")
					green.Name = "Green"
					green.AutomaticSize = Enum.AutomaticSize.XY
					green.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					green.BackgroundTransparency = 1
					green.BorderColor3 = Color3.fromRGB(0, 0, 0)
					green.BorderSizePixel = 0
					green.LayoutOrder = 2
					green.Size = UDim2.fromOffset(0, 38)

					local inputName1 = Instance.new("TextLabel")
					inputName1.Name = "InputName"
					inputName1.FontFace = Font.new(assets.interFont)
					inputName1.Text = "Green"
					inputName1.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputName1.TextSize = 13
					inputName1.TextTransparency = 0.5
					inputName1.TextTruncate = Enum.TextTruncate.AtEnd
					inputName1.TextXAlignment = Enum.TextXAlignment.Left
					inputName1.TextYAlignment = Enum.TextYAlignment.Top
					inputName1.AnchorPoint = Vector2.new(0, 0.5)
					inputName1.AutomaticSize = Enum.AutomaticSize.XY
					inputName1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputName1.BackgroundTransparency = 1
					inputName1.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputName1.BorderSizePixel = 0
					inputName1.LayoutOrder = 2
					inputName1.Position = UDim2.fromScale(0, 0.5)
					inputName1.Parent = green

					local uIListLayout4 = Instance.new("UIListLayout")
					uIListLayout4.Name = "UIListLayout"
					uIListLayout4.Padding = UDim.new(0, 15)
					uIListLayout4.FillDirection = Enum.FillDirection.Horizontal
					uIListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout4.VerticalAlignment = Enum.VerticalAlignment.Center
					uIListLayout4.Parent = green

					local inputBox1 = Instance.new("TextBox")
					inputBox1.Name = "InputBox"
					inputBox1.ClearTextOnFocus = false
					inputBox1.FontFace = Font.new(assets.interFont)
					inputBox1.Text = "255"
					inputBox1.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputBox1.TextSize = 12
					inputBox1.TextTransparency = 0.1
					inputBox1.TextXAlignment = Enum.TextXAlignment.Left
					inputBox1.AnchorPoint = Vector2.new(1, 0.5)
					inputBox1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputBox1.BackgroundTransparency = 0.95
					inputBox1.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputBox1.BorderSizePixel = 0
					inputBox1.ClipsDescendants = true
					inputBox1.LayoutOrder = 1
					inputBox1.Position = UDim2.fromScale(1, 0.5)
					inputBox1.Size = UDim2.fromOffset(75, 25)

					local inputBoxUICorner1 = Instance.new("UICorner")
					inputBoxUICorner1.Name = "InputBoxUICorner"
					inputBoxUICorner1.CornerRadius = UDim.new(0, 4)
					inputBoxUICorner1.Parent = inputBox1

					local inputBoxUIStroke1 = Instance.new("UIStroke")
					inputBoxUIStroke1.Name = "InputBoxUIStroke"
					inputBoxUIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					inputBoxUIStroke1.Color = Color3.fromRGB(255, 255, 255)
					inputBoxUIStroke1.Transparency = 0.9
					inputBoxUIStroke1.Parent = inputBox1

					local inputBoxUISizeConstraint1 = Instance.new("UISizeConstraint")
					inputBoxUISizeConstraint1.Name = "InputBoxUISizeConstraint"
					inputBoxUISizeConstraint1.Parent = inputBox1

					local inputBoxUIPadding1 = Instance.new("UIPadding")
					inputBoxUIPadding1.Name = "InputBoxUIPadding"
					inputBoxUIPadding1.PaddingLeft = UDim.new(0, 8)
					inputBoxUIPadding1.PaddingRight = UDim.new(0, 10)
					inputBoxUIPadding1.Parent = inputBox1

					inputBox1.Parent = green

					green.Parent = inputs

					local blue = Instance.new("Frame")
					blue.Name = "Blue"
					blue.AutomaticSize = Enum.AutomaticSize.XY
					blue.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					blue.BackgroundTransparency = 1
					blue.BorderColor3 = Color3.fromRGB(0, 0, 0)
					blue.BorderSizePixel = 0
					blue.LayoutOrder = 3
					blue.Size = UDim2.fromOffset(0, 38)

					local inputName2 = Instance.new("TextLabel")
					inputName2.Name = "InputName"
					inputName2.FontFace = Font.new(assets.interFont)
					inputName2.Text = "Blue"
					inputName2.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputName2.TextSize = 13
					inputName2.TextTransparency = 0.5
					inputName2.TextTruncate = Enum.TextTruncate.AtEnd
					inputName2.TextXAlignment = Enum.TextXAlignment.Left
					inputName2.TextYAlignment = Enum.TextYAlignment.Top
					inputName2.AnchorPoint = Vector2.new(0, 0.5)
					inputName2.AutomaticSize = Enum.AutomaticSize.XY
					inputName2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputName2.BackgroundTransparency = 1
					inputName2.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputName2.BorderSizePixel = 0
					inputName2.LayoutOrder = 2
					inputName2.Position = UDim2.fromScale(0, 0.5)
					inputName2.Parent = blue

					local uIListLayout5 = Instance.new("UIListLayout")
					uIListLayout5.Name = "UIListLayout"
					uIListLayout5.Padding = UDim.new(0, 15)
					uIListLayout5.FillDirection = Enum.FillDirection.Horizontal
					uIListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout5.VerticalAlignment = Enum.VerticalAlignment.Center
					uIListLayout5.Parent = blue

					local inputBox2 = Instance.new("TextBox")
					inputBox2.Name = "InputBox"
					inputBox2.ClearTextOnFocus = false
					inputBox2.FontFace = Font.new(assets.interFont)
					inputBox2.Text = "255"
					inputBox2.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputBox2.TextSize = 12
					inputBox2.TextTransparency = 0.1
					inputBox2.TextXAlignment = Enum.TextXAlignment.Left
					inputBox2.AnchorPoint = Vector2.new(1, 0.5)
					inputBox2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputBox2.BackgroundTransparency = 0.95
					inputBox2.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputBox2.BorderSizePixel = 0
					inputBox2.ClipsDescendants = true
					inputBox2.LayoutOrder = 1
					inputBox2.Position = UDim2.fromScale(1, 0.5)
					inputBox2.Size = UDim2.fromOffset(75, 25)

					local inputBoxUICorner2 = Instance.new("UICorner")
					inputBoxUICorner2.Name = "InputBoxUICorner"
					inputBoxUICorner2.CornerRadius = UDim.new(0, 4)
					inputBoxUICorner2.Parent = inputBox2

					local inputBoxUIStroke2 = Instance.new("UIStroke")
					inputBoxUIStroke2.Name = "InputBoxUIStroke"
					inputBoxUIStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					inputBoxUIStroke2.Color = Color3.fromRGB(255, 255, 255)
					inputBoxUIStroke2.Transparency = 0.9
					inputBoxUIStroke2.Parent = inputBox2

					local inputBoxUISizeConstraint2 = Instance.new("UISizeConstraint")
					inputBoxUISizeConstraint2.Name = "InputBoxUISizeConstraint"
					inputBoxUISizeConstraint2.Parent = inputBox2

					local inputBoxUIPadding2 = Instance.new("UIPadding")
					inputBoxUIPadding2.Name = "InputBoxUIPadding"
					inputBoxUIPadding2.PaddingLeft = UDim.new(0, 8)
					inputBoxUIPadding2.PaddingRight = UDim.new(0, 10)
					inputBoxUIPadding2.Parent = inputBox2

					inputBox2.Parent = blue

					blue.Parent = inputs

					local alpha = Instance.new("Frame")
					alpha.Name = "Alpha"
					alpha.AutomaticSize = Enum.AutomaticSize.XY
					alpha.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					alpha.BackgroundTransparency = 1
					alpha.BorderColor3 = Color3.fromRGB(0, 0, 0)
					alpha.BorderSizePixel = 0
					alpha.LayoutOrder = 4
					alpha.Size = UDim2.fromOffset(0, 38)
					alpha.Visible = isAlpha

					local inputName3 = Instance.new("TextLabel")
					inputName3.Name = "InputName"
					inputName3.FontFace = Font.new(assets.interFont)
					inputName3.Text = "Alpha"
					inputName3.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputName3.TextSize = 13
					inputName3.TextTransparency = 0.5
					inputName3.TextTruncate = Enum.TextTruncate.AtEnd
					inputName3.TextXAlignment = Enum.TextXAlignment.Left
					inputName3.TextYAlignment = Enum.TextYAlignment.Top
					inputName3.AnchorPoint = Vector2.new(0, 0.5)
					inputName3.AutomaticSize = Enum.AutomaticSize.XY
					inputName3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputName3.BackgroundTransparency = 1
					inputName3.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputName3.BorderSizePixel = 0
					inputName3.LayoutOrder = 2
					inputName3.Position = UDim2.fromScale(0, 0.5)
					inputName3.Parent = alpha

					local uIListLayout6 = Instance.new("UIListLayout")
					uIListLayout6.Name = "UIListLayout"
					uIListLayout6.Padding = UDim.new(0, 15)
					uIListLayout6.FillDirection = Enum.FillDirection.Horizontal
					uIListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout6.VerticalAlignment = Enum.VerticalAlignment.Center
					uIListLayout6.Parent = alpha

					local inputBox3 = Instance.new("TextBox")
					inputBox3.Name = "InputBox"
					inputBox3.ClearTextOnFocus = false
					inputBox3.FontFace = Font.new(assets.interFont)
					inputBox3.Text = "0"
					inputBox3.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputBox3.TextSize = 12
					inputBox3.TextTransparency = 0.1
					inputBox3.TextXAlignment = Enum.TextXAlignment.Left
					inputBox3.AnchorPoint = Vector2.new(1, 0.5)
					inputBox3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputBox3.BackgroundTransparency = 0.95
					inputBox3.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputBox3.BorderSizePixel = 0
					inputBox3.ClipsDescendants = true
					inputBox3.LayoutOrder = 1
					inputBox3.Position = UDim2.fromScale(1, 0.5)
					inputBox3.Size = UDim2.fromOffset(75, 25)

					local inputBoxUICorner3 = Instance.new("UICorner")
					inputBoxUICorner3.Name = "InputBoxUICorner"
					inputBoxUICorner3.CornerRadius = UDim.new(0, 4)
					inputBoxUICorner3.Parent = inputBox3

					local inputBoxUIStroke3 = Instance.new("UIStroke")
					inputBoxUIStroke3.Name = "InputBoxUIStroke"
					inputBoxUIStroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					inputBoxUIStroke3.Color = Color3.fromRGB(255, 255, 255)
					inputBoxUIStroke3.Transparency = 0.9
					inputBoxUIStroke3.Parent = inputBox3

					local inputBoxUISizeConstraint3 = Instance.new("UISizeConstraint")
					inputBoxUISizeConstraint3.Name = "InputBoxUISizeConstraint"
					inputBoxUISizeConstraint3.Parent = inputBox3

					local inputBoxUIPadding3 = Instance.new("UIPadding")
					inputBoxUIPadding3.Name = "InputBoxUIPadding"
					inputBoxUIPadding3.PaddingLeft = UDim.new(0, 8)
					inputBoxUIPadding3.PaddingRight = UDim.new(0, 10)
					inputBoxUIPadding3.Parent = inputBox3

					inputBox3.Parent = alpha

					alpha.Parent = inputs

					local hex = Instance.new("Frame")
					hex.Name = "Hex"
					hex.AutomaticSize = Enum.AutomaticSize.XY
					hex.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					hex.BackgroundTransparency = 1
					hex.BorderColor3 = Color3.fromRGB(0, 0, 0)
					hex.BorderSizePixel = 0
					hex.Size = UDim2.fromOffset(0, 38)

					local inputName4 = Instance.new("TextLabel")
					inputName4.Name = "InputName"
					inputName4.FontFace = Font.new(assets.interFont)
					inputName4.Text = "Hex"
					inputName4.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputName4.TextSize = 13
					inputName4.TextTransparency = 0.5
					inputName4.TextTruncate = Enum.TextTruncate.AtEnd
					inputName4.TextXAlignment = Enum.TextXAlignment.Left
					inputName4.TextYAlignment = Enum.TextYAlignment.Top
					inputName4.AnchorPoint = Vector2.new(0, 0.5)
					inputName4.AutomaticSize = Enum.AutomaticSize.XY
					inputName4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputName4.BackgroundTransparency = 1
					inputName4.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputName4.BorderSizePixel = 0
					inputName4.LayoutOrder = 2
					inputName4.Position = UDim2.fromScale(0, 0.5)
					inputName4.Parent = hex

					local uIListLayout7 = Instance.new("UIListLayout")
					uIListLayout7.Name = "UIListLayout"
					uIListLayout7.Padding = UDim.new(0, 15)
					uIListLayout7.FillDirection = Enum.FillDirection.Horizontal
					uIListLayout7.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout7.VerticalAlignment = Enum.VerticalAlignment.Center
					uIListLayout7.Parent = hex

					local inputBox4 = Instance.new("TextBox")
					inputBox4.Name = "InputBox"
					inputBox4.ClearTextOnFocus = false
					inputBox4.CursorPosition = -1
					inputBox4.FontFace = Font.new(assets.interFont)
					inputBox4.Text = "255"
					inputBox4.TextColor3 = Color3.fromRGB(255, 255, 255)
					inputBox4.TextSize = 12
					inputBox4.TextTransparency = 0.1
					inputBox4.TextXAlignment = Enum.TextXAlignment.Left
					inputBox4.AnchorPoint = Vector2.new(1, 0.5)
					inputBox4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					inputBox4.BackgroundTransparency = 0.95
					inputBox4.BorderColor3 = Color3.fromRGB(0, 0, 0)
					inputBox4.BorderSizePixel = 0
					inputBox4.ClipsDescendants = true
					inputBox4.LayoutOrder = 1
					inputBox4.Position = UDim2.fromScale(1, 0.5)
					inputBox4.Size = UDim2.fromOffset(75, 25)

					local inputBoxUICorner4 = Instance.new("UICorner")
					inputBoxUICorner4.Name = "InputBoxUICorner"
					inputBoxUICorner4.CornerRadius = UDim.new(0, 4)
					inputBoxUICorner4.Parent = inputBox4

					local inputBoxUIStroke4 = Instance.new("UIStroke")
					inputBoxUIStroke4.Name = "InputBoxUIStroke"
					inputBoxUIStroke4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					inputBoxUIStroke4.Color = Color3.fromRGB(255, 255, 255)
					inputBoxUIStroke4.Transparency = 0.9
					inputBoxUIStroke4.Parent = inputBox4

					local inputBoxUISizeConstraint4 = Instance.new("UISizeConstraint")
					inputBoxUISizeConstraint4.Name = "InputBoxUISizeConstraint"
					inputBoxUISizeConstraint4.Parent = inputBox4

					local inputBoxUIPadding4 = Instance.new("UIPadding")
					inputBoxUIPadding4.Name = "InputBoxUIPadding"
					inputBoxUIPadding4.PaddingLeft = UDim.new(0, 8)
					inputBoxUIPadding4.PaddingRight = UDim.new(0, 10)
					inputBoxUIPadding4.Parent = inputBox4

					inputBox4.Parent = hex

					hex.Parent = inputs

					inputs.Parent = wheel

					local uIPadding = Instance.new("UIPadding")
					uIPadding.Name = "UIPadding"
					uIPadding.PaddingRight = UDim.new(0, 5)
					uIPadding.Parent = wheel

					wheel.Parent = colorOptions

					local colorWells = Instance.new("Frame")
					colorWells.Name = "ColorWells"
					colorWells.AutomaticSize = Enum.AutomaticSize.Y
					colorWells.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					colorWells.BackgroundTransparency = 1
					colorWells.BorderColor3 = Color3.fromRGB(0, 0, 0)
					colorWells.BorderSizePixel = 0
					colorWells.LayoutOrder = 2
					colorWells.Size = UDim2.fromScale(1, 0)

					local uIGridLayout = Instance.new("UIGridLayout")
					uIGridLayout.Name = "UIGridLayout"
					uIGridLayout.CellPadding = UDim2.fromOffset(10, 0)
					uIGridLayout.CellSize = UDim2.new(0.5, -5, 0, 30)
					uIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
					uIGridLayout.Parent = colorWells

					local newColor = Instance.new("ImageLabel")
					newColor.Name = "NewColor"
					newColor.Image = assets.grid
					newColor.ScaleType = Enum.ScaleType.Tile
					newColor.TileSize = UDim2.fromOffset(500, 500)
					newColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					newColor.BackgroundTransparency = 1
					newColor.BorderColor3 = Color3.fromRGB(0, 0, 0)
					newColor.BorderSizePixel = 0
					newColor.Size = UDim2.fromOffset(100, 100)

					local uICorner2 = Instance.new("UICorner")
					uICorner2.Name = "UICorner"
					uICorner2.Parent = newColor

					local color = Instance.new("Frame")
					color.Name = "Color"
					color.AnchorPoint = Vector2.new(0.5, 0.5)
					color.BorderColor3 = Color3.fromRGB(27, 42, 53)
					color.BorderSizePixel = 0
					color.Position = UDim2.fromScale(0.5, 0.5)
					color.Size = UDim2.new(1, 1, 1, 1)

					local uICorner3 = Instance.new("UICorner")
					uICorner3.Name = "UICorner"
					uICorner3.Parent = color

					color.Parent = newColor

					newColor.Parent = colorWells

					local oldColor = Instance.new("ImageLabel")
					oldColor.Name = "OldColor"
					oldColor.Image = assets.grid
					oldColor.ScaleType = Enum.ScaleType.Tile
					oldColor.TileSize = UDim2.fromOffset(500, 500)
					oldColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					oldColor.BackgroundTransparency = 1
					oldColor.BorderColor3 = Color3.fromRGB(0, 0, 0)
					oldColor.BorderSizePixel = 0
					oldColor.LayoutOrder = 1
					oldColor.Size = UDim2.fromOffset(100, 100)

					local uICorner4 = Instance.new("UICorner")
					uICorner4.Name = "UICorner"
					uICorner4.Parent = oldColor

					local color1 = Instance.new("Frame")
					color1.Name = "Color"
					color1.AnchorPoint = Vector2.new(0.5, 0.5)
					color1.BorderColor3 = Color3.fromRGB(27, 42, 53)
					color1.BorderSizePixel = 0
					color1.Position = UDim2.fromScale(0.5, 0.5)
					color1.Size = UDim2.new(1, 1, 1, 1)

					local uICorner5 = Instance.new("UICorner")
					uICorner5.Name = "UICorner"
					uICorner5.Parent = color1

					color1.Parent = oldColor

					oldColor.Parent = colorWells

					colorWells.Parent = colorOptions

					colorOptions.Parent = prompt

					local interactions = Instance.new("Frame")
					interactions.Name = "Interactions"
					interactions.AutomaticSize = Enum.AutomaticSize.Y
					interactions.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					interactions.BackgroundTransparency = 1
					interactions.BorderColor3 = Color3.fromRGB(0, 0, 0)
					interactions.BorderSizePixel = 0
					interactions.LayoutOrder = 2
					interactions.Size = UDim2.fromScale(1, 0)

					local uIListLayout8 = Instance.new("UIListLayout")
					uIListLayout8.Name = "UIListLayout"
					uIListLayout8.Padding = UDim.new(0, 10)
					uIListLayout8.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout8.Parent = interactions

					local confirm = Instance.new("TextButton")
					confirm.Name = "Confirm"
					confirm.FontFace = Font.new(
						"rbxassetid://12187365364",
						Enum.FontWeight.Medium,
						Enum.FontStyle.Normal
					)
					confirm.Text = "Confirm"
					confirm.TextColor3 = Color3.fromRGB(255, 255, 255)
					confirm.TextSize = 15
					confirm.TextTransparency = 0.5
					confirm.TextTruncate = Enum.TextTruncate.AtEnd
					confirm.AutoButtonColor = false
					confirm.AutomaticSize = Enum.AutomaticSize.Y
					confirm.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
					confirm.BorderColor3 = Color3.fromRGB(0, 0, 0)
					confirm.BorderSizePixel = 0
					confirm.Size = UDim2.fromScale(1, 0)

					local uIPadding1 = Instance.new("UIPadding")
					uIPadding1.Name = "UIPadding"
					uIPadding1.PaddingBottom = UDim.new(0, 9)
					uIPadding1.PaddingLeft = UDim.new(0, 10)
					uIPadding1.PaddingRight = UDim.new(0, 10)
					uIPadding1.PaddingTop = UDim.new(0, 9)
					uIPadding1.Parent = confirm

					local baseUICorner = Instance.new("UICorner")
					baseUICorner.Name = "BaseUICorner"
					baseUICorner.CornerRadius = UDim.new(0, 10)
					baseUICorner.Parent = confirm

					confirm.Parent = interactions

					local cancel = Instance.new("TextButton")
					cancel.Name = "Cancel"
					cancel.FontFace = Font.new(
						"rbxassetid://12187365364",
						Enum.FontWeight.Medium,
						Enum.FontStyle.Normal
					)
					cancel.Text = "Cancel"
					cancel.TextColor3 = Color3.fromRGB(255, 255, 255)
					cancel.TextSize = 15
					cancel.TextTransparency = 0.5
					cancel.TextTruncate = Enum.TextTruncate.AtEnd
					cancel.AutoButtonColor = false
					cancel.AutomaticSize = Enum.AutomaticSize.Y
					cancel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
					cancel.BorderColor3 = Color3.fromRGB(0, 0, 0)
					cancel.BorderSizePixel = 0
					cancel.Size = UDim2.fromScale(1, 0)

					local baseUICorner1 = Instance.new("UICorner")
					baseUICorner1.Name = "BaseUICorner"
					baseUICorner1.CornerRadius = UDim.new(0, 10)
					baseUICorner1.Parent = cancel

					local uIPadding2 = Instance.new("UIPadding")
					uIPadding2.Name = "UIPadding"
					uIPadding2.PaddingBottom = UDim.new(0, 9)
					uIPadding2.PaddingLeft = UDim.new(0, 10)
					uIPadding2.PaddingRight = UDim.new(0, 10)
					uIPadding2.PaddingTop = UDim.new(0, 9)
					uIPadding2.Parent = cancel

					cancel.Parent = interactions

					local uIPadding3 = Instance.new("UIPadding")
					uIPadding3.Name = "UIPadding"
					uIPadding3.PaddingTop = UDim.new(0, 10)
					uIPadding3.Parent = interactions

					interactions.Parent = prompt

					local globalSettingsUIPadding = Instance.new("UIPadding")
					globalSettingsUIPadding.Name = "GlobalSettingsUIPadding"
					globalSettingsUIPadding.PaddingBottom = UDim.new(0, 20)
					globalSettingsUIPadding.PaddingLeft = UDim.new(0, 20)
					globalSettingsUIPadding.PaddingRight = UDim.new(0, 20)
					globalSettingsUIPadding.PaddingTop = UDim.new(0, 20)
					globalSettingsUIPadding.Parent = prompt

					local paragraph = Instance.new("Frame")
					paragraph.Name = "Paragraph"
					paragraph.AutomaticSize = Enum.AutomaticSize.Y
					paragraph.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					paragraph.BackgroundTransparency = 1
					paragraph.BorderColor3 = Color3.fromRGB(0, 0, 0)
					paragraph.BorderSizePixel = 0
					paragraph.Size = UDim2.fromScale(1, 0)

					local paragraphHeader = Instance.new("TextLabel")
					paragraphHeader.Name = "ParagraphHeader"
					paragraphHeader.FontFace = Font.new(
						"rbxassetid://12187365364",
						Enum.FontWeight.SemiBold,
						Enum.FontStyle.Normal
					)
					paragraphHeader.RichText = true
					paragraphHeader.Text = ColorpickerFunctions.Settings.Name
					paragraphHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
					paragraphHeader.TextSize = 18
					paragraphHeader.TextTransparency = 0.4
					paragraphHeader.TextWrapped = true
					paragraphHeader.TextYAlignment = Enum.TextYAlignment.Top
					paragraphHeader.AutomaticSize = Enum.AutomaticSize.XY
					paragraphHeader.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					paragraphHeader.BackgroundTransparency = 1
					paragraphHeader.BorderColor3 = Color3.fromRGB(0, 0, 0)
					paragraphHeader.BorderSizePixel = 0
					paragraphHeader.Size = UDim2.fromScale(1, 0)
					paragraphHeader.Parent = paragraph

					local uIListLayout9 = Instance.new("UIListLayout")
					uIListLayout9.Name = "UIListLayout"
					uIListLayout9.Padding = UDim.new(0, 15)
					uIListLayout9.HorizontalAlignment = Enum.HorizontalAlignment.Center
					uIListLayout9.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout9.Parent = paragraph

					local uIPadding4 = Instance.new("UIPadding")
					uIPadding4.Name = "UIPadding"
					uIPadding4.PaddingBottom = UDim.new(0, 15)
					uIPadding4.Parent = paragraph

					local line = Instance.new("Frame")
					line.Name = "Line"
					line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					line.BackgroundTransparency = 0.9
					line.BorderColor3 = Color3.fromRGB(0, 0, 0)
					line.BorderSizePixel = 0
					line.LayoutOrder = 1
					line.Size = UDim2.new(1, 0, 0, 1)
					line.Parent = paragraph

					paragraph.Parent = prompt

					prompt.Parent = colorPicker

					colorPicker.Parent = base

					local fromHSV, fromRGB, v2, udim2 = Color3.fromHSV, Color3.fromRGB, Vector2.new, UDim2.new

					local wheel = wheel1
					local ring = target
					local slider = value
					local colour = color

					local modifierInputs = {
						Hex = hex.InputBox,
						Red = red.InputBox,
						Green = green.InputBox,
						Blue = blue.InputBox,
						Alpha = alpha.InputBox
					}

					local Mouse = LocalPlayer:GetMouse()

					local WheelDown, SlideDown = false, false
					local hue, saturation, value = 0, 0, 1

					local function toPolar(v)
						return math.atan2(v.y, v.x), v.magnitude
					end

					local function radToDeg(x)
						return ((x + math.pi) / (2 * math.pi)) * 360
					end

					local function degToRad(degrees)
						return degrees * (math.pi / 180)
					end

					local function hexToRGB(hex)
						hex = hex:gsub("#","")
						if #hex ~= 6 then return 0, 0, 0 end
						local r = tonumber(hex:sub(1, 2), 16) or 0
						local g = tonumber(hex:sub(3, 4), 16) or 0
						local b = tonumber(hex:sub(5, 6), 16) or 0
						return r, g, b
					end

					local function clampInput(value, min, max)
						local num = tonumber(value)
						if num then
							return math.clamp(num, min, max)
						end
						return min
					end

					local function update()
						local c = fromHSV(hue, saturation, value)
						colour.BackgroundColor3 = c
						colour.BackgroundTransparency = clampInput(modifierInputs.Alpha.Text, 0, 1)

						modifierInputs.Red.Text = tostring(math.floor(c.r * 255 + 0.5))
						modifierInputs.Green.Text = tostring(math.floor(c.g * 255 + 0.5))
						modifierInputs.Blue.Text = tostring(math.floor(c.b * 255 + 0.5))
						modifierInputs.Alpha.Text = clampInput(modifierInputs.Alpha.Text, 0, 1)

						local hexColor = string.format("#%02X%02X%02X", 
							math.floor(c.r * 255 + 0.5),
							math.floor(c.g * 255 + 0.5),
							math.floor(c.b * 255 + 0.5))
						modifierInputs.Hex.Text = hexColor
					end

					local function UpdateSlide(iX)
						local rY = iX - slider.AbsolutePosition.X
						local cY = math.clamp(rY, 0, slider.AbsoluteSize.X - slide.AbsoluteSize.X)
						slide.Position = udim2(0, cY, 0.5, 0)
						value = 1 - (cY / (slider.AbsoluteSize.X - slide.AbsoluteSize.X))
						update()
					end

					local function UpdateRing(iX, iY)
						local r = wheel.AbsoluteSize.x / 2
						local d = v2(iX, iY) - wheel.AbsolutePosition - wheel.AbsoluteSize / 2

						if d:Dot(d) > r * r then
							d = d.unit * r
						end

						ring.Position = udim2(0.5, d.x, 0.5, d.y)
						local phi, len = toPolar(d * v2(1, -1))
						hue, saturation = radToDeg(phi) / 360, math.clamp(len / r, 0, 1)
						slider.BackgroundColor3 = fromHSV(hue, saturation, 1)
						update()
					end

					local function UpdateSlideFromValue(value)
						local cY = (1 - value) * (slider.AbsoluteSize.X - slide.AbsoluteSize.X)
						slide.Position = UDim2.new(0, cY, 0.5, 0)
					end

					local function UpdateRingFromHSV(hue, saturation)
						local r = wheel.AbsoluteSize.X / 2
						local phi = degToRad(hue * 360)
						local len = saturation * r
						local x = len * math.cos(phi)
						local y = len * math.sin(phi)

						ring.Position = UDim2.new(0.5, -x, 0.5, y)
						slider.BackgroundColor3 = fromHSV(hue, saturation, 1)
					end

					local function updateFromRGB()
						local r = clampInput(modifierInputs.Red.Text, 0, 255)
						local g = clampInput(modifierInputs.Green.Text, 0, 255)
						local b = clampInput(modifierInputs.Blue.Text, 0, 255)
						modifierInputs.Red.Text = r
						modifierInputs.Green.Text = g
						modifierInputs.Blue.Text = b

						hue, saturation, value = Color3.fromRGB(r, g, b):ToHSV()

						UpdateSlideFromValue(value)
						UpdateRingFromHSV(hue, saturation)
						update()
					end

					local function updateFromHex()
						local hex = modifierInputs.Hex.Text
						local r, g, b = hexToRGB(hex)

						r = clampInput(r, 0, 255)
						g = clampInput(g, 0, 255)
						b = clampInput(b, 0, 255)

						modifierInputs.Red.Text = r
						modifierInputs.Green.Text = g
						modifierInputs.Blue.Text = b

						hue, saturation, value = Color3.fromRGB(r, g, b):ToHSV()
						UpdateSlideFromValue(value)
						UpdateRingFromHSV(hue, saturation)
						update()
					end

					local function updateFromSettings()
						local r = math.floor(ColorpickerFunctions.Color.R * 255 + 0.5)
						local g = math.floor(ColorpickerFunctions.Color.G * 255 + 0.5)
						local b = math.floor(ColorpickerFunctions.Color.B * 255 + 0.5)
						modifierInputs.Red.Text = r
						modifierInputs.Green.Text = g
						modifierInputs.Blue.Text = b
						modifierInputs.Alpha.Text = isAlpha and ColorpickerFunctions.Alpha or 0

						local hexColor = string.format("#%02X%02X%02X", r,g,b)
						modifierInputs.Hex.Text = hexColor

						hue, saturation, value = Color3.fromRGB(r, g, b):ToHSV()

						color1.BackgroundColor3 = ColorpickerFunctions.Color
						color1.BackgroundTransparency = isAlpha and ColorpickerFunctions.Alpha or 0

						colour.BackgroundColor3 = Color3.fromRGB(r,g,b)
						colour.BackgroundTransparency = isAlpha and ColorpickerFunctions.Alpha or 0

						UpdateSlideFromValue(value)
						UpdateRingFromHSV(hue, saturation)
					end

					wheel.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							WheelDown = true
							UpdateRing(Mouse.X, Mouse.Y)
						end
					end)

					slider.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							SlideDown = true
							UpdateSlide(Mouse.X)
						end
					end)

					slider.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							SlideDown = false
						end
					end)

					wheel.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							WheelDown = false
						end
					end)

					UserInputService.InputChanged:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
							if SlideDown then
								UpdateSlide(Mouse.X)
							elseif WheelDown then
								UpdateRing(Mouse.X, Mouse.Y)
							end
						end
					end)

					local function onFocusEnter(instance)
						local placeholder = instance.Text
						instance.Text = ""
						instance.PlaceholderText = placeholder
					end

					modifierInputs.Hex.FocusLost:Connect(updateFromHex)
					modifierInputs.Red.FocusLost:Connect(updateFromRGB)
					modifierInputs.Green.FocusLost:Connect(updateFromRGB)
					modifierInputs.Blue.FocusLost:Connect(updateFromRGB)
					modifierInputs.Alpha.FocusLost:Connect(update)

					modifierInputs.Hex.Focused:Connect(function()
						onFocusEnter(modifierInputs.Hex)
					end)
					modifierInputs.Red.Focused:Connect(function()
						onFocusEnter(modifierInputs.Red)
					end)
					modifierInputs.Green.Focused:Connect(function()
						onFocusEnter(modifierInputs.Green)
					end)
					modifierInputs.Blue.Focused:Connect(function()
						onFocusEnter(modifierInputs.Blue)
					end)
					modifierInputs.Alpha.Focused:Connect(function()
						onFocusEnter(modifierInputs.Alpha)
					end)

					local function makeCanvas()
						local ColorPickerCanvas = Instance.new("CanvasGroup")
						ColorPickerCanvas.Name = "ColorPickerCanvas"
						ColorPickerCanvas.BackgroundTransparency = 1
						ColorPickerCanvas.BorderSizePixel = 0
						ColorPickerCanvas.Size = UDim2.fromScale(1, 1)
						ColorPickerCanvas.ZIndex = 5
						ColorPickerCanvas.GroupTransparency = 1
						ColorPickerCanvas.Parent = base
						ColorPickerCanvas.Visible = false
						return ColorPickerCanvas
					end

					local function transition(isIn)
						local canvas = makeCanvas()
						local tweenTransparency = isIn and 0 or 1
						local tweenScale = isIn and 1 or 0.95
						local stateTransparency = isIn and 1 or 0
						local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Sine)
						local canvasTween = Tween(canvas, tweenInfo, { GroupTransparency = tweenTransparency })
						local scaleTween = Tween(promptUIScale, tweenInfo, { Scale = tweenScale })

						colorPicker.Visible = true
						colorPicker.Parent = canvas
						canvas.Visible = true
						canvas.GroupTransparency = stateTransparency
						canvasTween:Play()
						scaleTween:Play()
						canvasTween.Completed:Wait()

						if not isIn then
							colorPicker.Visible = false
							canvas.Visible = false
						end

						colorPicker.Parent = base
						canvas:Destroy()
					end

					local function colorpickerIn()
						transition(true)
					end

					local function colorpickerOut()
						transition(false)
					end

					interact.MouseButton1Click:Connect(colorpickerIn)

					cancel.MouseButton1Click:Connect(colorpickerOut)
					confirm.MouseButton1Click:Connect(function()
						colorpickerOut()
						local c = fromHSV(hue, saturation, value)
						ColorpickerFunctions.Color = Color3.fromRGB(c.r * 255, c.g * 255, c.b * 255)
						ColorpickerFunctions.Alpha = isAlpha and clampInput(modifierInputs.Alpha.Text, 0, 1)

						color1.BackgroundColor3 = ColorpickerFunctions.Color
						color1.BackgroundTransparency = isAlpha and ColorpickerFunctions.Alpha or 0

						colorC.BackgroundColor3 = ColorpickerFunctions.Color
						colorC.BackgroundTransparency = isAlpha and ColorpickerFunctions.Alpha or 0

						if ColorpickerFunctions.Settings.Callback then
							task.spawn(function()
								ColorpickerFunctions.Settings.Callback(ColorpickerFunctions.Color, isAlpha and ColorpickerFunctions.Alpha)
							end)
						end
					end)

					updateFromSettings()

					function ColorpickerFunctions:UpdateName(New)
						colorpickerName.Text = New
					end
					function ColorpickerFunctions:SetVisibility(State)
						colorpicker.Visible = State
					end

					function ColorpickerFunctions:SetColor(color3)
						ColorpickerFunctions.Color = color3
						colorC.BackgroundColor3 = color3

						local r = math.floor(ColorpickerFunctions.Color.R * 255 + 0.5)
						local g = math.floor(ColorpickerFunctions.Color.G * 255 + 0.5)
						local b = math.floor(ColorpickerFunctions.Color.B * 255 + 0.5)
						modifierInputs.Red.Text = r
						modifierInputs.Green.Text = g
						modifierInputs.Blue.Text = b

						local hexColor = string.format("#%02X%02X%02X", r,g,b)
						modifierInputs.Hex.Text = hexColor

						hue, saturation, value = Color3.fromRGB(r, g, b):ToHSV()

						color1.BackgroundColor3 = ColorpickerFunctions.Color
						colour.BackgroundColor3 = Color3.fromRGB(r,g,b)

						UpdateSlideFromValue(value)
						UpdateRingFromHSV(hue, saturation)

						if ColorpickerFunctions.Settings.Callback then
							task.spawn(function()
								ColorpickerFunctions.Settings.Callback(ColorpickerFunctions.Color, isAlpha and ColorpickerFunctions.Alpha)
							end)
						end
					end

					function ColorpickerFunctions:SetAlpha(alpha)
						ColorpickerFunctions.Alpha = alpha
						colorC.Transparency = alpha
						updateFromSettings()
					end

					if Flag then
						MacLib.Options[Flag] = ColorpickerFunctions
					end
					return ColorpickerFunctions
				end

				function SectionFunctions:Header(Settings, Flag)
					local HeaderFunctions = {Settings = Settings}

					local header = Instance.new("Frame")
					header.Name = "Header"
					header.AutomaticSize = Enum.AutomaticSize.Y
					header.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					header.BackgroundTransparency = 1
					header.BorderColor3 = Color3.fromRGB(0, 0, 0)
					header.BorderSizePixel = 0
					header.LayoutOrder = 0
					header.Size = UDim2.fromScale(1, 0)
					header.Parent = section

					local uIPadding = Instance.new("UIPadding")
					uIPadding.Name = "UIPadding"
					uIPadding.PaddingBottom = UDim.new(0, 5)
					uIPadding.Parent = header

					local headerText = Instance.new("TextLabel")
					headerText.Name = "HeaderText"
					headerText.FontFace = Font.new(
						assets.interFont,
						Enum.FontWeight.Medium,
						Enum.FontStyle.Normal
					)
					headerText.RichText = true
					headerText.Text = HeaderFunctions.Settings.Text or HeaderFunctions.Settings.Name
					headerText.TextColor3 = Color3.fromRGB(255, 255, 255)
					headerText.TextSize = 16
					headerText.TextTransparency = 0.3
					headerText.TextWrapped = true
					headerText.TextXAlignment = Enum.TextXAlignment.Left
					headerText.AutomaticSize = Enum.AutomaticSize.Y
					headerText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					headerText.BackgroundTransparency = 1
					headerText.BorderColor3 = Color3.fromRGB(0, 0, 0)
					headerText.BorderSizePixel = 0
					headerText.Size = UDim2.fromScale(1, 0)
					headerText.Parent = header

					function HeaderFunctions:UpdateName(New)
						headerText.Text = New
					end
					function HeaderFunctions:SetVisibility(State)
						header.Visible = State
					end

					if Flag then
						MacLib.Options[Flag] = HeaderFunctions
					end
					return HeaderFunctions
				end

				function SectionFunctions:Label(Settings, Flag)
					local LabelFunctions = {Settings = Settings}

					local label = Instance.new("Frame")
					label.Name = "Label"
					label.AutomaticSize = Enum.AutomaticSize.Y
					label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					label.BackgroundTransparency = 1
					label.BorderColor3 = Color3.fromRGB(0, 0, 0)
					label.BorderSizePixel = 0
					label.Size = UDim2.new(1, 0, 0, 38)
					label.Parent = section

					local labelText = Instance.new("TextLabel")
					labelText.Name = "LabelText"
					labelText.FontFace = Font.new(assets.interFont)
					labelText.RichText = true
					labelText.Text = LabelFunctions.Settings.Text or LabelFunctions.Settings.Name -- Settings.Name Deprecated use Settings.Text
					labelText.TextColor3 = Color3.fromRGB(255, 255, 255)
					labelText.TextSize = 13
					labelText.TextTransparency = 0.5
					labelText.TextWrapped = true
					labelText.TextXAlignment = Enum.TextXAlignment.Left
					labelText.AutomaticSize = Enum.AutomaticSize.Y
					labelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					labelText.BackgroundTransparency = 1
					labelText.BorderColor3 = Color3.fromRGB(0, 0, 0)
					labelText.BorderSizePixel = 0
					labelText.Size = UDim2.fromScale(1, 1)
					labelText.Parent = label

					function LabelFunctions:UpdateName(New)
						labelText.Text = New
					end
					function LabelFunctions:SetVisibility(State)
						label.Visible = State
					end

					if Flag then
						MacLib.Options[Flag] = LabelFunctions
					end
					return LabelFunctions
				end

				function SectionFunctions:SubLabel(Settings, Flag)
					local SubLabelFunctions = {Settings = Settings}

					local subLabel = Instance.new("Frame")
					subLabel.Name = "SubLabel"
					subLabel.AutomaticSize = Enum.AutomaticSize.Y
					subLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					subLabel.BackgroundTransparency = 1
					subLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
					subLabel.BorderSizePixel = 0
					subLabel.Size = UDim2.new(1, 0, 0, 0)
					subLabel.Parent = section

					local subLabelText = Instance.new("TextLabel")
					subLabelText.Name = "SubLabelText"
					subLabelText.FontFace = Font.new(assets.interFont)
					subLabelText.RichText = true
					subLabelText.Text = SubLabelFunctions.Settings.Text or SubLabelFunctions.Settings.Name -- Settings.Name Deprecated use Settings.Text
					subLabelText.TextColor3 = Color3.fromRGB(255, 255, 255)
					subLabelText.TextSize = 12
					subLabelText.TextTransparency = 0.7
					subLabelText.TextWrapped = true
					subLabelText.TextXAlignment = Enum.TextXAlignment.Left
					subLabelText.AutomaticSize = Enum.AutomaticSize.Y
					subLabelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					subLabelText.BackgroundTransparency = 1
					subLabelText.BorderColor3 = Color3.fromRGB(0, 0, 0)
					subLabelText.BorderSizePixel = 0
					subLabelText.Size = UDim2.fromScale(1, 1)
					subLabelText.Parent = subLabel

					function SubLabelFunctions:UpdateName(New)
						subLabelText.Text = New
					end
					function SubLabelFunctions:SetVisibility(State)
						subLabel.Visible = State
					end

					if Flag then
						MacLib.Options[Flag] = SubLabelFunctions
					end
					return SubLabelFunctions
				end

				function SectionFunctions:Paragraph(Settings, Flag)
					local ParagraphFunctions = {Settings = Settings}

					local paragraph = Instance.new("Frame")
					paragraph.Name = "Paragraph"
					paragraph.AutomaticSize = Enum.AutomaticSize.Y
					paragraph.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					paragraph.BackgroundTransparency = 1
					paragraph.BorderColor3 = Color3.fromRGB(0, 0, 0)
					paragraph.BorderSizePixel = 0
					paragraph.Size = UDim2.new(1, 0, 0, 38)
					paragraph.Parent = section

					local paragraphHeader = Instance.new("TextLabel")
					paragraphHeader.Name = "ParagraphHeader"
					paragraphHeader.FontFace = Font.new(
						assets.interFont,
						Enum.FontWeight.Medium,
						Enum.FontStyle.Normal
					)
					paragraphHeader.RichText = true
					paragraphHeader.Text = ParagraphFunctions.Settings.Header
					paragraphHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
					paragraphHeader.TextSize = 15
					paragraphHeader.TextTransparency = 0.4
					paragraphHeader.TextWrapped = true
					paragraphHeader.TextXAlignment = Enum.TextXAlignment.Left
					paragraphHeader.AutomaticSize = Enum.AutomaticSize.Y
					paragraphHeader.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					paragraphHeader.BackgroundTransparency = 1
					paragraphHeader.BorderColor3 = Color3.fromRGB(0, 0, 0)
					paragraphHeader.BorderSizePixel = 0
					paragraphHeader.Size = UDim2.fromScale(1, 0)
					paragraphHeader.Parent = paragraph

					local uIListLayout = Instance.new("UIListLayout")
					uIListLayout.Name = "UIListLayout"
					uIListLayout.Padding = UDim.new(0, 5)
					uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout.Parent = paragraph

					local paragraphBody = Instance.new("TextLabel")
					paragraphBody.Name = "ParagraphBody"
					paragraphBody.FontFace = Font.new(assets.interFont)
					paragraphBody.RichText = true
					paragraphBody.Text = ParagraphFunctions.Settings.Body
					paragraphBody.TextColor3 = Color3.fromRGB(255, 255, 255)
					paragraphBody.TextSize = 13
					paragraphBody.TextTransparency = 0.5
					paragraphBody.TextWrapped = true
					paragraphBody.TextXAlignment = Enum.TextXAlignment.Left
					paragraphBody.AutomaticSize = Enum.AutomaticSize.Y
					paragraphBody.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					paragraphBody.BackgroundTransparency = 1
					paragraphBody.BorderColor3 = Color3.fromRGB(0, 0, 0)
					paragraphBody.BorderSizePixel = 0
					paragraphBody.LayoutOrder = 1
					paragraphBody.Size = UDim2.fromScale(1, 0)
					paragraphBody.Parent = paragraph

					function ParagraphFunctions:UpdateHeader(New)
						paragraphHeader.Text = New
					end
					function ParagraphFunctions:UpdateBody(New)
						paragraphBody.Text = New
					end
					function ParagraphFunctions:SetVisibility(State)
						paragraph.Visible = State
					end

					if Flag then
						MacLib.Options[Flag] = ParagraphFunctions
					end
					return ParagraphFunctions
				end

				function SectionFunctions:Divider()
					local DividerFunctions = {}

					local divider = Instance.new("Frame")
					divider.Name = "Divider"
					divider.AnchorPoint = Vector2.new(0, 1)
					divider.AutomaticSize = Enum.AutomaticSize.Y
					divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					divider.BackgroundTransparency = 1
					divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
					divider.BorderSizePixel = 0
					divider.Position = UDim2.fromScale(0, 1)
					divider.Size = UDim2.new(1, 0, 0, 1)
					divider.Parent = section

					local uIPadding = Instance.new("UIPadding")
					uIPadding.Name = "UIPadding"
					uIPadding.PaddingBottom = UDim.new(0, 8)
					uIPadding.PaddingTop = UDim.new(0, 8)
					uIPadding.Parent = divider

					local uIListLayout = Instance.new("UIListLayout")
					uIListLayout.Name = "UIListLayout"
					uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					uIListLayout.Parent = divider

					local line = Instance.new("Frame")
					line.Name = "Line"
					line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					line.BackgroundTransparency = 0.9
					line.BorderColor3 = Color3.fromRGB(0, 0, 0)
					line.BorderSizePixel = 0
					line.Size = UDim2.new(1, 0, 0, 1)
					line.Parent = divider

					function DividerFunctions:Remove()
						divider:Destroy()
					end
					function DividerFunctions:SetVisibility(State)
						divider.Visible = State
					end

					return DividerFunctions
				end

				function SectionFunctions:Spacer()
					local SpacerFunctions = {}

					local spacer = Instance.new("Frame")
					spacer.Name = "Spacer"
					spacer.AnchorPoint = Vector2.new(0, 1)
					spacer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					spacer.BackgroundTransparency = 1
					spacer.BorderColor3 = Color3.fromRGB(0, 0, 0)
					spacer.BorderSizePixel = 0
					spacer.Position = UDim2.fromScale(0, 1)
					spacer.Parent = section

					function SpacerFunctions:Remove()
						spacer:Destroy()
					end
					function SpacerFunctions:SetVisibility(State)
						spacer.Visible = State
					end

					return SpacerFunctions
				end

				return SectionFunctions
			end

			local function SelectCurrentTab()
				local easetime = 0.15

				if currentTabInstance then
					currentTabInstance.Parent = nil
				end

				for i, tabInfo in pairs(tabs) do
					Tween(i, TweenInfo.new(easetime, Enum.EasingStyle.Sine), {
						BackgroundTransparency = (i == tabSwitcher and 0.98 or 1)
					}):Play()

					if tabInfo.tabStroke then
						Tween(tabInfo.tabStroke, TweenInfo.new(easetime, Enum.EasingStyle.Sine), {
							Transparency = (i == tabSwitcher and 0.95 or 1)
						}):Play()
					end
					if tabInfo.switcherImage then
						Tween(tabInfo.switcherImage, TweenInfo.new(easetime, Enum.EasingStyle.Sine), {
							ImageTransparency = (i == tabSwitcher and 0.1 or 0.5)
						}):Play()
					end
					if tabInfo.switcherName then
						Tween(tabInfo.switcherName, TweenInfo.new(easetime, Enum.EasingStyle.Sine), {
							TextTransparency = (i == tabSwitcher and 0.1 or 0.5)
						}):Play()
					end
				end

				tabs[tabSwitcher].tabContent.Parent = content
				currentTabInstance = tabs[tabSwitcher].tabContent
				currentTab.Text = Settings.Name
			end

			tabSwitcher.MouseButton1Click:Connect(function()
				SelectCurrentTab()
			end)

			function TabFunctions:Select()
				SelectCurrentTab()
			end

			function TabFunctions:InsertConfigSection(Side)
				local configSection = TabFunctions:Section({ Side = "Left" })

				if isStudio then
					configSection:Label({Text = "Config system unavailable. (Environment isStudio)"})
					return "Config system unavailable." 
				end

				local inputPath = nil
				local selectedConfig = nil

				configSection:Input({
					Name = "Config Name",
					Placeholder = "Name",
					AcceptedCharacters = "All",
					Callback = function(input)
						inputPath = input
					end,
				})

				local configSelection = configSection:Dropdown({
					Name = "Select Config",
					Multi = false,
					Required = false,
					Options = MacLib:RefreshConfigList(),
					Callback = function(Value)
						selectedConfig = Value
					end,
				})

				configSection:Button({
					Name = "Create Config",
					Callback = function()
						if not inputPath or string.gsub(inputPath, " ", "") == "" then
							WindowFunctions:Notify({
								Title = "Interface",
								Description = "Config name cannot be empty."
							})
							return
						end

						local success, returned = MacLib:SaveConfig(inputPath)
						if not success then
							WindowFunctions:Notify({
								Title = "Interface",
								Description = "Unable to save config, return error: " .. returned
							})
						end

						WindowFunctions:Notify({
							Title = "Interface",
							Description = string.format("Created config %q", inputPath),
						})

						configSelection:ClearOptions()
						configSelection:InsertOptions(MacLib:RefreshConfigList())
					end,
				})

				configSection:Button({
					Name = "Load Config",
					Callback = function()
						local success, returned = MacLib:LoadConfig(configSelection.Value)
						if not success then
							WindowFunctions:Notify({
								Title = "Interface",
								Description = "Unable to load config, return error: " .. returned
							})
							return
						end

						WindowFunctions:Notify({
							Title = "Interface",
							Description = string.format("Loaded config %q", configSelection.Value),
						})
					end,
				})

				configSection:Button({
					Name = "Overwrite Config",
					Callback = function()
						local success, returned = MacLib:SaveConfig(configSelection.Value)
						if not success then
							WindowFunctions:Notify({
								Title = "Interface",
								Description = "Unable to overwrite config, return error: " .. returned
							})
							return
						end

						WindowFunctions:Notify({
							Title = "Interface",
							Description = string.format("Overwrote config %q", configSelection.Value),
						})
					end,
				})

				configSection:Button({
					Name = "Refresh Config List",
					Callback = function()
						configSelection:ClearOptions()
						configSelection:InsertOptions(MacLib:RefreshConfigList())
					end,
				})

				local autoloadLabel

				configSection:Button({
					Name = "Set as autoload",
					Callback = function()
						local name = configSelection.Value
						writefile(MacLib.Folder .. "/settings/autoload.txt", name)
						autoloadLabel:UpdateName("Autoload config: " .. name)
						WindowFunctions:Notify({
							Title = "Interface",
							Description = string.format("Set %q as autoload", name),
						})
					end,
				})

				autoloadLabel = configSection:Label({Text = "Autoload config: None"})

				if isfile(MacLib.Folder .. "/settings/autoload.txt") then
					local name = readfile(MacLib.Folder .. "/settings/autoload.txt")
					autoloadLabel:UpdateName("Autoload config: " .. name)
				end
			end

			tabs[tabSwitcher] = {
				tabContent = elements1,
				tabStroke = tabSwitcherUIStroke,
				switcherImage = tabImage,
				switcherName = tabSwitcherName,
			}

			return TabFunctions
		end

		return SectionFunctions
	end

	function WindowFunctions:Notify(Settings)
		local NotificationFunctions = {}

		local notification = Instance.new("Frame")
		notification.Name = "Notification"
		notification.AnchorPoint = Vector2.new(0.5, 0.5)
		notification.AutomaticSize = Enum.AutomaticSize.Y
		notification.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		notification.BorderColor3 = Color3.fromRGB(0, 0, 0)
		notification.BorderSizePixel = 0
		notification.Position = UDim2.fromScale(0.5, 0.5)
		notification.Size = UDim2.fromOffset(Settings.SizeX or 250, 0)

		notification.Parent = notifications

		local notificationUIStroke = Instance.new("UIStroke")
		notificationUIStroke.Name = "NotificationUIStroke"
		notificationUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		notificationUIStroke.Color = Color3.fromRGB(255, 255, 255)
		notificationUIStroke.Transparency = 0.9
		notificationUIStroke.Parent = notification

		local notificationUICorner = Instance.new("UICorner")
		notificationUICorner.Name = "NotificationUICorner"
		notificationUICorner.CornerRadius = UDim.new(0, 10)
		notificationUICorner.Parent = notification

		local notificationUIScale = Instance.new("UIScale")
		notificationUIScale.Name = "NotificationUIScale"
		notificationUIScale.Parent = notification
		notificationUIScale.Scale = 0

		local notificationInformation = Instance.new("Frame")
		notificationInformation.Name = "NotificationInformation"
		notificationInformation.AutomaticSize = Enum.AutomaticSize.Y
		notificationInformation.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		notificationInformation.BackgroundTransparency = 1
		notificationInformation.BorderColor3 = Color3.fromRGB(0, 0, 0)
		notificationInformation.BorderSizePixel = 0
		notificationInformation.Size = UDim2.fromScale(1, 1)

		local notificationTitle = Instance.new("TextLabel")
		notificationTitle.Name = "NotificationTitle"
		notificationTitle.FontFace = Font.new(
			assets.interFont,
			Enum.FontWeight.SemiBold,
			Enum.FontStyle.Normal
		)
		notificationTitle.RichText = true
		notificationTitle.Text = Settings.Title
		notificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		notificationTitle.TextSize = 13
		notificationTitle.TextTransparency = 0.2
		notificationTitle.TextTruncate = Enum.TextTruncate.SplitWord
		notificationTitle.TextXAlignment = Enum.TextXAlignment.Left
		notificationTitle.TextYAlignment = Enum.TextYAlignment.Top
		notificationTitle.AutomaticSize = Enum.AutomaticSize.XY
		notificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		notificationTitle.BackgroundTransparency = 1
		notificationTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
		notificationTitle.BorderSizePixel = 0
		notificationTitle.Size = UDim2.new(1, -12, 0, 0)

		local notificationTitleUIPadding = Instance.new("UIPadding")
		notificationTitleUIPadding.Name = "NotificationTitleUIPadding"
		notificationTitleUIPadding.PaddingRight = UDim.new(0, 25)
		notificationTitleUIPadding.Parent = notificationTitle

		notificationTitle.Parent = notificationInformation

		local notificationDescription = Instance.new("TextLabel")
		notificationDescription.Name = "NotificationDescription"
		notificationDescription.FontFace = Font.new(
			assets.interFont,
			Enum.FontWeight.Medium,
			Enum.FontStyle.Normal
		)
		notificationDescription.Text = Settings.Description
		notificationDescription.TextColor3 = Color3.fromRGB(255, 255, 255)
		notificationDescription.TextSize = 11
		notificationDescription.TextTransparency = 0.5
		notificationDescription.TextWrapped = true
		notificationDescription.RichText = true
		notificationDescription.TextXAlignment = Enum.TextXAlignment.Left
		notificationDescription.TextYAlignment = Enum.TextYAlignment.Top
		notificationDescription.AutomaticSize = Enum.AutomaticSize.XY
		notificationDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		notificationDescription.BackgroundTransparency = 1
		notificationDescription.BorderColor3 = Color3.fromRGB(0, 0, 0)
		notificationDescription.BorderSizePixel = 0
		notificationDescription.Size = UDim2.new(1, -12, 0, 0)

		local notificationDescriptionUIPadding = Instance.new("UIPadding")
		notificationDescriptionUIPadding.Name = "NotificationDescriptionUIPadding"
		notificationDescriptionUIPadding.PaddingRight = UDim.new(0, 25)
		notificationDescriptionUIPadding.PaddingTop = UDim.new(0, 17)
		notificationDescriptionUIPadding.Parent = notificationDescription

		notificationDescription.Parent = notificationInformation

		local notificationUIPadding = Instance.new("UIPadding")
		notificationUIPadding.Name = "NotificationUIPadding"
		notificationUIPadding.PaddingBottom = UDim.new(0, 12)
		notificationUIPadding.PaddingLeft = UDim.new(0, 10)
		notificationUIPadding.PaddingRight = UDim.new(0, 10)
		notificationUIPadding.PaddingTop = UDim.new(0, 10)
		notificationUIPadding.Parent = notificationInformation

		notificationInformation.Parent = notification

		local notificationControls = Instance.new("Frame")
		notificationControls.Name = "NotificationControls"
		notificationControls.AutomaticSize = Enum.AutomaticSize.Y
		notificationControls.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		notificationControls.BackgroundTransparency = 1
		notificationControls.BorderColor3 = Color3.fromRGB(0, 0, 0)
		notificationControls.BorderSizePixel = 0
		notificationControls.Size = UDim2.fromScale(1, 1)

		local interactable = Instance.new("TextButton")
		interactable.Name = "Interactable"
		interactable.FontFace = Font.new(assets.interFont)
		interactable.Text = "✓"
		interactable.TextColor3 = Color3.fromRGB(255, 255, 255)
		interactable.TextSize = 17
		interactable.TextTransparency = 0.2
		interactable.AnchorPoint = Vector2.new(1, 0.5)
		interactable.AutomaticSize = Enum.AutomaticSize.XY
		interactable.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		interactable.BackgroundTransparency = 1
		interactable.BorderColor3 = Color3.fromRGB(0, 0, 0)
		interactable.BorderSizePixel = 0
		interactable.LayoutOrder = 1
		interactable.Position = UDim2.fromScale(1, 0.5)
		interactable.Parent = notificationControls

		local uIPadding = Instance.new("UIPadding")
		uIPadding.Name = "UIPadding"
		uIPadding.PaddingBottom = UDim.new(0, 6)
		uIPadding.PaddingRight = UDim.new(0, 13)
		uIPadding.PaddingTop = UDim.new(0, 6)
		uIPadding.Parent = notificationControls

		notificationControls.Parent = notification

		local tweens = {
			In = Tween(notificationUIScale, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				Scale = Settings.Scale or 1
			}),
			Out = Tween(notificationUIScale, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				Scale = 0
			}),
		}

		local styles = {
			None = function() interactable:Destroy() end,
			Confirm = function() interactable.Text = "✓" end,
			Cancel = function() interactable.Text = "✗" end
		}

		local style = styles[Settings.Style] or function() interactable:Destroy() end
		style()

		if interactable then
			interactable.MouseButton1Click:Connect(function()
				NotificationFunctions:Cancel()
				if Settings.Callback then
					task.spawn(Settings.Callback)
				end
			end)
		end

		local AnimateNotification = task.spawn(function()
			tweens.In:Play()

			Settings.Lifetime = Settings.Lifetime or 3

			if Settings.Lifetime ~= 0 then
				task.wait(Settings.Lifetime)

				local out = tweens.Out
				out:Play()
				out.Completed:Wait()
				notification:Destroy()
			end
		end)

		function NotificationFunctions:UpdateTitle(New)
			notificationTitle.Text = New
		end

		function NotificationFunctions:UpdateDescription(New)
			notificationDescription.Text = New
		end

		function NotificationFunctions:Resize(X)
			local targ = X or 250
			notification.Size = UDim2.fromOffset(targ, 0)
		end

		function NotificationFunctions:Cancel()
			task.cancel(AnimateNotification)

			local out = tweens.Out
			out:Play()
			out.Completed:Wait()
			notification:Destroy()
		end

		return NotificationFunctions
	end

	function WindowFunctions:Dialog(Settings)
		local DialogFunctions = {}

		local dialogCanvas = Instance.new("CanvasGroup")
		dialogCanvas.Name = "DialogCanvas"
		dialogCanvas.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		dialogCanvas.BackgroundTransparency = 1
		dialogCanvas.BorderColor3 = Color3.fromRGB(0, 0, 0)
		dialogCanvas.BorderSizePixel = 0
		dialogCanvas.Size = UDim2.fromScale(1, 1)
		dialogCanvas.GroupTransparency = 1
		dialogCanvas.Parent = base

		local dialog = Instance.new("Frame")
		dialog.Name = "Dialog"
		dialog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		dialog.BackgroundTransparency = 0.5
		dialog.BorderColor3 = Color3.fromRGB(0, 0, 0)
		dialog.BorderSizePixel = 0
		dialog.Size = UDim2.fromScale(1, 1)

		local dialogUICorner = Instance.new("UICorner")
		dialogUICorner.Name = "BaseUICorner"
		dialogUICorner.CornerRadius = UDim.new(0, 10)
		dialogUICorner.Parent = dialog

		local prompt = Instance.new("Frame")
		prompt.Name = "Prompt"
		prompt.AnchorPoint = Vector2.new(0.5, 0.5)
		prompt.AutomaticSize = Enum.AutomaticSize.Y
		prompt.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		prompt.BorderColor3 = Color3.fromRGB(0, 0, 0)
		prompt.BorderSizePixel = 0
		prompt.Position = UDim2.fromScale(0.5, 0.5)
		prompt.Size = UDim2.fromOffset(280, 0)

		local promptUIScale = Instance.new("UIScale")
		promptUIScale.Name = "BaseUIScale"
		promptUIScale.Parent = prompt
		promptUIScale.Scale = 0.95

		local globalSettingsUIStroke = Instance.new("UIStroke")
		globalSettingsUIStroke.Name = "GlobalSettingsUIStroke"
		globalSettingsUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		globalSettingsUIStroke.Color = Color3.fromRGB(255, 255, 255)
		globalSettingsUIStroke.Transparency = 0.9
		globalSettingsUIStroke.Parent = prompt

		local globalSettingsUICorner = Instance.new("UICorner")
		globalSettingsUICorner.Name = "GlobalSettingsUICorner"
		globalSettingsUICorner.CornerRadius = UDim.new(0, 10)
		globalSettingsUICorner.Parent = prompt

		local globalSettingsUIPadding = Instance.new("UIPadding")
		globalSettingsUIPadding.Name = "GlobalSettingsUIPadding"
		globalSettingsUIPadding.PaddingBottom = UDim.new(0, 20)
		globalSettingsUIPadding.PaddingLeft = UDim.new(0, 20)
		globalSettingsUIPadding.PaddingRight = UDim.new(0, 20)
		globalSettingsUIPadding.PaddingTop = UDim.new(0, 20)
		globalSettingsUIPadding.Parent = prompt

		local paragraph = Instance.new("Frame")
		paragraph.Name = "Paragraph"
		paragraph.AutomaticSize = Enum.AutomaticSize.Y
		paragraph.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		paragraph.BackgroundTransparency = 1
		paragraph.BorderColor3 = Color3.fromRGB(0, 0, 0)
		paragraph.BorderSizePixel = 0
		paragraph.Size = UDim2.new(1, 0, 0, 38)

		local paragraphHeader = Instance.new("TextLabel")
		paragraphHeader.Name = "ParagraphHeader"
		paragraphHeader.FontFace = Font.new(
			assets.interFont,
			Enum.FontWeight.Medium,
			Enum.FontStyle.Normal
		)
		paragraphHeader.RichText = true
		paragraphHeader.Text = Settings.Title
		paragraphHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
		paragraphHeader.TextSize = 18
		paragraphHeader.TextTransparency = 0.4
		paragraphHeader.TextWrapped = true
		paragraphHeader.AutomaticSize = Enum.AutomaticSize.Y
		paragraphHeader.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		paragraphHeader.BackgroundTransparency = 1
		paragraphHeader.BorderColor3 = Color3.fromRGB(0, 0, 0)
		paragraphHeader.BorderSizePixel = 0
		paragraphHeader.Size = UDim2.fromScale(1, 0)
		paragraphHeader.Parent = paragraph

		local uIListLayout = Instance.new("UIListLayout")
		uIListLayout.Name = "UIListLayout"
		uIListLayout.Padding = UDim.new(0, 15)
		uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uIListLayout.Parent = paragraph

		local paragraphBody = Instance.new("TextLabel")
		paragraphBody.Name = "ParagraphBody"
		paragraphBody.FontFace = Font.new(assets.interFont)
		paragraphBody.RichText = true
		paragraphBody.Text = Settings.Description
		paragraphBody.TextColor3 = Color3.fromRGB(255, 255, 255)
		paragraphBody.TextSize = 14
		paragraphBody.TextTransparency = 0.5
		paragraphBody.TextWrapped = true
		paragraphBody.AutomaticSize = Enum.AutomaticSize.Y
		paragraphBody.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		paragraphBody.BackgroundTransparency = 1
		paragraphBody.BorderColor3 = Color3.fromRGB(0, 0, 0)
		paragraphBody.BorderSizePixel = 0
		paragraphBody.LayoutOrder = 1
		paragraphBody.Size = UDim2.fromScale(1, 0)
		paragraphBody.Parent = paragraph

		paragraph.Parent = prompt

		local interactions = Instance.new("Frame")
		interactions.Name = "Interactions"
		interactions.AutomaticSize = Enum.AutomaticSize.Y
		interactions.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		interactions.BackgroundTransparency = 1
		interactions.BorderColor3 = Color3.fromRGB(0, 0, 0)
		interactions.BorderSizePixel = 0
		interactions.LayoutOrder = 1
		interactions.Size = UDim2.fromScale(1, 0)

		local uIListLayout1 = Instance.new("UIListLayout")
		uIListLayout1.Name = "UIListLayout"
		uIListLayout1.Padding = UDim.new(0, 10)
		uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
		uIListLayout1.Parent = interactions

		local uIPadding = Instance.new("UIPadding")
		uIPadding.Name = "UIPadding"
		uIPadding.PaddingTop = UDim.new(0, 20)
		uIPadding.Parent = interactions

		interactions.Parent = prompt

		local uIListLayout2 = Instance.new("UIListLayout")
		uIListLayout2.Name = "UIListLayout"
		uIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
		uIListLayout2.Parent = prompt

		prompt.Parent = dialog

		dialog.Parent = dialogCanvas

		local canvasIn = Tween(dialogCanvas, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { GroupTransparency = 0 })
		local canvasOut = Tween(dialogCanvas, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { GroupTransparency = 1 })

		local scaleIn = Tween(promptUIScale, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { Scale = 1 })
		local scaleOut = Tween(promptUIScale, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { Scale = 0.95 })

		local function dialogIn()
			canvasIn:Play()
			scaleIn:Play()
			canvasIn.Completed:Wait()
			dialog.Parent = base
		end

		local function dialogOut()
			if not dialog.Parent then return end
			dialog.Parent = dialogCanvas
			canvasOut:Play()
			scaleOut:Play()
			canvasOut.Completed:Wait()
			dialogCanvas:Destroy()
		end

		for _, v in pairs(Settings.Buttons) do
			local button = Instance.new("TextButton")
			button.Name = "Button"
			button.FontFace = Font.new(assets.interFont)
			button.Text = v.Name
			button.TextColor3 = Color3.fromRGB(255, 255, 255)
			button.TextSize = 15
			button.TextTransparency = 0.5
			button.TextTruncate = Enum.TextTruncate.AtEnd
			button.AutoButtonColor = false
			button.AutomaticSize = Enum.AutomaticSize.Y
			button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button.BorderSizePixel = 0
			button.Size = UDim2.fromScale(1, 0)

			local uIPadding1 = Instance.new("UIPadding")
			uIPadding1.Name = "UIPadding"
			uIPadding1.PaddingBottom = UDim.new(0, 9)
			uIPadding1.PaddingLeft = UDim.new(0, 10)
			uIPadding1.PaddingRight = UDim.new(0, 10)
			uIPadding1.PaddingTop = UDim.new(0, 9)
			uIPadding1.Parent = button

			local baseUICorner1 = Instance.new("UICorner")
			baseUICorner1.Name = "BaseUICorner"
			baseUICorner1.CornerRadius = UDim.new(0, 10)
			baseUICorner1.Parent = button

			button.Parent = interactions

			local TweenSettings = {
				DefaultTransparency = 0,
				DefaultTransparency2 = 0.5,
				HoverTransparency = 0.3,
				HoverTransparency2 = 0.6,

				EasingStyle = Enum.EasingStyle.Sine
			}

			local function ChangeState(State)
				if State == "Idle" then
					Tween(button, TweenInfo.new(0.2, TweenSettings.EasingStyle), {
						BackgroundTransparency = TweenSettings.DefaultTransparency,
						TextTransparency = TweenSettings.DefaultTransparency2
					}):Play()
				elseif State == "Hover" then
					Tween(button, TweenInfo.new(0.2, TweenSettings.EasingStyle), {
						BackgroundTransparency = TweenSettings.HoverTransparency,
						TextTransparency = TweenSettings.HoverTransparency2
					}):Play()
				end
			end

			button.MouseButton1Click:Connect(function()
				if dialogCanvas.GroupTransparency ~= 0 then return end
				if v.Callback then
					v.Callback()
				end

				dialogOut()
			end)

			button.MouseEnter:Connect(function()
				ChangeState("Hover")
			end)
			button.MouseLeave:Connect(function()
				ChangeState("Idle")
			end)
		end

		dialogIn()

		function DialogFunctions:UpdateTitle(New)
			paragraphHeader.Text = New
		end
		function DialogFunctions:UpdateDescription(New)
			paragraphBody.Text = New
		end

		function DialogFunctions:Cancel()
			dialogOut()
		end

		return DialogFunctions
	end

	function WindowFunctions:SetNotificationsState(State)
		notifications.Visible = State
	end

	function WindowFunctions:GetNotificationsState(State)
		return notifications.Visible
	end

	function WindowFunctions:SetState(State)
		windowState = State
		base.Visible = State
	end

	function WindowFunctions:GetState()
		return windowState
	end

	local onUnloadCallback

	function WindowFunctions:Unload()
		if onUnloadCallback then
			onUnloadCallback()  
		end
		macLib:Destroy()
		unloaded = true
	end

	function WindowFunctions.onUnloaded(callback)
		onUnloadCallback = callback
	end

	local MenuKeybind = Settings.Keybind or Enum.KeyCode.RightControl

	local function ToggleMenu()
		local state = not WindowFunctions:GetState()
		WindowFunctions:SetState(state)
		WindowFunctions:Notify({
			Title = Settings.Title,
			Description = (state and "Maximized " or "Minimized ") .. "the menu. Use " .. tostring(MenuKeybind.Name) .. " to toggle it.",
			Lifetime = 5
		})
	end

	UserInputService.InputEnded:Connect(function(inp, gpe)
		if gpe then return end
		if inp.KeyCode == MenuKeybind then
			ToggleMenu()
		end
	end)

	minimize.MouseButton1Click:Connect(ToggleMenu)
	exit.MouseButton1Click:Connect(function()
		WindowFunctions:Dialog({
			Title = Settings.Title,
			Description = "Are you sure you want to exit the menu? You will lose any unsaved configurations.",
			Buttons = {
				{
					Name = "Confirm",
					Callback = function()
						WindowFunctions:Unload()
					end,
				},
				{
					Name = "Cancel"
				}
			}
		})
	end)

	function WindowFunctions:SetKeybind(Keycode)
		MenuKeybind = Keycode
	end

	function WindowFunctions:SetAcrylicBlurState(State)
		acrylicBlur = State
		base.BackgroundTransparency = State and 0.05 or 0
	end

	function WindowFunctions:GetAcrylicBlurState()
		return acrylicBlur
	end

	local function _SetUserInfoState(State)
		if State then
			headshot.Image = (isReady and headshotImage) or "rbxassetid://0"
			username.Text = "@" .. LocalPlayer.Name
			displayName.Text = LocalPlayer.DisplayName
		else
			headshot.Image = assets.userInfoBlurred
			local nameLength = #LocalPlayer.Name
			local displayNameLength = #LocalPlayer.DisplayName
			username.Text = "@" .. string.rep(".", nameLength)
			displayName.Text = string.rep(".", displayNameLength)
		end
	end

	local showUserInfo
	if Settings.ShowUserInfo ~= nil then
		showUserInfo = Settings.ShowUserInfo
	else
		showUserInfo = true
	end

	_SetUserInfoState(showUserInfo)

	function WindowFunctions:SetUserInfoState(State)
		_SetUserInfoState(State)
	end
	function WindowFunctions:GetUserInfoState(State)
		return showUserInfo
	end

	function WindowFunctions:SetSize(Size)
		base.Size = Size
	end
	function WindowFunctions:GetSize(Size)
		return base.Size
	end

	function WindowFunctions:SetScale(Scale)
		baseUIScale.Scale = Scale
	end
	function WindowFunctions:GetScale()
		return baseUIScale.Scale
	end

	local ClassParser = {
		["Toggle"] = {
			Save = function(Flag, data)
				return {
					type = "Toggle", 
					flag = Flag, 
					state = data.State or false
				}
			end,
			Load = function(Flag, data)
				if MacLib.Options[Flag] and data.state then
					MacLib.Options[Flag]:UpdateState(data.state)
				end
			end
		},
		["Slider"] = {
			Save = function(Flag, data)
				return {
					type = "Slider", 
					flag = Flag, 
					value = (data.Value and tostring(data.Value)) or false
				}
			end,
			Load = function(Flag, data)
				if MacLib.Options[Flag] and data.value then
					MacLib.Options[Flag]:UpdateValue(data.value)
				end
			end
		},
		["Input"] = {
			Save = function(Flag, data)
				return {
					type = "Input", 
					flag = Flag, 
					text = data.Text
				}
			end,
			Load = function(Flag, data)
				if MacLib.Options[Flag] and data.text and type(data.text) == "string" then
					MacLib.Options[Flag]:UpdateText(data.text)
				end
			end
		},
		["Keybind"] = {
			Save = function(Flag, data)
				return {
					type = "Keybind", 
					flag = Flag, 
					bind = (typeof(data.Bind) == "EnumItem" and data.Bind.Name) or nil
				}
			end,
			Load = function(Flag, data)
				if MacLib.Options[Flag] and data.bind then
					MacLib.Options[Flag]:Bind(Enum.KeyCode[data.bind])
				end
			end
		},
		["Dropdown"] = {
			Save = function(Flag, data)
				return {
					type = "Dropdown", 
					flag = Flag, 
					value = data.Value
				}
			end,
			Load = function(Flag, data)
				if MacLib.Options[Flag] and data.value then
					MacLib.Options[Flag]:UpdateSelection(data.value)
				end
			end
		},
		["Colorpicker"] = {
			Save = function(Flag, data)
				local function Color3ToHex(color)
					return string.format("#%02X%02X%02X", math.floor(color.R * 255), math.floor(color.G * 255), math.floor(color.B * 255))
				end

				return {
					type = "Colorpicker", 
					flag = Flag, 
					color = Color3ToHex(data.Color) or nil,
					alpha = data.Alpha
				}
			end,
			Load = function(Flag, data)
				local function HexToColor3(hex)
					local r = tonumber(hex:sub(2, 3), 16) / 255
					local g = tonumber(hex:sub(4, 5), 16) / 255
					local b = tonumber(hex:sub(6, 7), 16) / 255
					return Color3.new(r, g, b)
				end

				if MacLib.Options[Flag] and data.color then
					MacLib.Options[Flag]:SetColor(HexToColor3(data.color)) 
					if data.alpha then
						MacLib.Options[Flag]:SetAlpha(data.alpha)
					end
				end
			end
		}
	}

	local function BuildFolderTree()
		if isStudio or not (isfolder and makefolder) then return "Config system unavailable." end

		local paths = {
			MacLib.Folder,
			MacLib.Folder .. "/settings"
		}

		for i = 1, #paths do
			local str = paths[i]
			if not isfolder(str) then
				makefolder(str)
			end
		end
	end

	function MacLib:LoadAutoLoadConfig()
		if isStudio or not (isfile and readfile) then return "Config system unavailable." end

		if isfile(MacLib.Folder .. "/settings/autoload.txt") then
			local name = readfile(MacLib.Folder .. "/settings/autoload.txt")

			local suc, err = MacLib:LoadConfig(name)
			if not suc then
				WindowFunctions:Notify({
					Title = "Interface",
					Description = "Error loading autoload config: " .. err
				})
			end

			WindowFunctions:Notify({
				Title = "Interface",
				Description = string.format("Autoloaded config: %q", name),
			})
		end
	end

	function MacLib:SetFolder(Folder)
		if isStudio then return "Config system unavailable." end

		MacLib.Folder = Folder;
		BuildFolderTree()
	end

	function MacLib:SaveConfig(Path)
		if isStudio or not writefile then return "Config system unavailable." end

		if (not Path) then
			return false, "Please select a config file."
		end

		local fullPath = MacLib.Folder .. "/settings/" .. Path .. ".json"

		local data = {
			objects = {},
			contextData = MacLib.contextData or {},
		}

		for flag, option in next, MacLib.Options do
			if not ClassParser[option.Class] then continue end
			if option.IgnoreConfig then continue end

			table.insert(data.objects, ClassParser[option.Class].Save(flag, option))
		end	

		local success, encoded = pcall(HttpService.JSONEncode, HttpService, data)
		if not success then
			return false, "Unable to encode into JSON data"
		end

		writefile(fullPath, encoded)
		return true
	end

	function MacLib:LoadConfig(Path)
		if isStudio or not (isfile and readfile) then return "Config system unavailable." end

		if (not Path) then
			return false, "Please select a config file."
		end

		local file = MacLib.Folder .. "/settings/" .. Path .. ".json"
		if not isfile(file) then return false, "Invalid file" end

		local success, decoded = pcall(HttpService.JSONDecode, HttpService, readfile(file))
		if not success then return false, "Unable to decode JSON data." end

		MacLib.contextData = decoded.contextData or {}

		for _, option in next, decoded.objects do
			if ClassParser[option.type] then
				task.spawn(function() 
					ClassParser[option.type].Load(option.flag, option) 
				end)
			end
		end

		return true
	end

	function MacLib:RefreshConfigList()
		if isStudio or not (isfolder and listfiles) then return "Config system unavailable." end

		local list = (isfolder(MacLib.Folder) and isfolder(MacLib.Folder .. "/settings")) and listfiles(MacLib.Folder .. "/settings") or {}

		local out = {}
		for i = 1, #list do
			local file = list[i]
			if file:sub(-5) == ".json" then
				local pos = file:find(".json", 1, true)
				local start = pos

				local char = file:sub(pos, pos)
				while char ~= "/" and char ~= "\\" and char ~= "" do
					pos = pos - 1
					char = file:sub(pos, pos)
				end

				if char == "/" or char == "\\" then
					local name = file:sub(pos + 1, start - 1)
					if name ~= "options" then
						table.insert(out, name)
					end
				end
			end
		end

		return out
	end

	macLib.Enabled = false

	local assetList = {}
	for _, assetId in pairs(assets) do
		table.insert(assetList, assetId)
	end

	ContentProvider:PreloadAsync(assetList)
	macLib.Enabled = true
	windowState = true

	return WindowFunctions
end

function MacLib:Demo()
	local Window = MacLib:Window({
		Title = "Maclib Demo",
		Subtitle = "This is a subtitle.",
		Size = UDim2.fromOffset(868, 650),
		DragStyle = 1,
		DisabledWindowControls = {},
		ShowUserInfo = true,
		Keybind = Enum.KeyCode.RightControl,
		AcrylicBlur = true,
	})

	local globalSettings = {
		UIBlurToggle = Window:GlobalSetting({
			Name = "UI Blur",
			Default = Window:GetAcrylicBlurState(),
			Callback = function(bool)
				Window:SetAcrylicBlurState(bool)
				Window:Notify({
					Title = Window.Settings.Title,
					Description = (bool and "Enabled" or "Disabled") .. " UI Blur",
					Lifetime = 5
				})
			end,
		}),
		NotificationToggler = Window:GlobalSetting({
			Name = "Notifications",
			Default = Window:GetNotificationsState(),
			Callback = function(bool)
				Window:SetNotificationsState(bool)
				Window:Notify({
					Title = Window.Settings.Title,
					Description = (bool and "Enabled" or "Disabled") .. " Notifications",
					Lifetime = 5
				})
			end,
		}),
		ShowUserInfo = Window:GlobalSetting({
			Name = "Show User Info",
			Default = Window:GetUserInfoState(),
			Callback = function(bool)
				Window:SetUserInfoState(bool)
				Window:Notify({
					Title = Window.Settings.Title,
					Description = (bool and "Showing" or "Redacted") .. " User Info",
					Lifetime = 5
				})
			end,
		})
	}

	local tabGroups = {
		TabGroup1 = Window:TabGroup()
	}

	local tabs = {
		Main = tabGroups.TabGroup1:Tab({ Name = "Demo", Image = "rbxassetid://18821914323" }),
		Settings = tabGroups.TabGroup1:Tab({ Name = "Settings", Image = "rbxassetid://10734950309" })
	}

	local sections = {
		MainSection1 = tabs.Main:Section({ Side = "Left" }),
	}

	sections.MainSection1:Header({
		Name = "Header #1"
	})

	sections.MainSection1:Button({
		Name = "Button",
		Callback = function()
			Window:Dialog({
				Title = Window.Settings.Title,
				Description = "Lorem ipsum odor amet, consectetuer adipiscing elit. Eros vestibulum aliquet mattis, ex platea nunc.",
				Buttons = {
					{
						Name = "Confirm",
						Callback = function()
							print("Confirmed!")
						end,
					},
					{
						Name = "Cancel"
					}
				}
			})
		end,
	})

	sections.MainSection1:Input({
		Name = "Input",
		Placeholder = "Input",
		AcceptedCharacters = "All",
		Callback = function(input)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = "Successfully set input to " .. input
			})
		end,
		onChanged = function(input)
			print("Input is now " .. input)
		end,
	}, "Input")

	sections.MainSection1:Slider({
		Name = "Slider",
		Default = 50,
		Minimum = 0,
		Maximum = 100,
		DisplayMethod = "Percent",
		Precision = 0,
		Callback = function(Value)
			print("Changed to ".. Value)
		end
	}, "Slider")

	sections.MainSection1:Toggle({
		Name = "Toggle",
		Default = false,
		Callback = function(value)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = (value and "Enabled " or "Disabled ") .. "Toggle"
			})
		end,
	}, "Toggle")

	sections.MainSection1:Keybind({
		Name = "Keybind",
		Blacklist = false,
		Callback = function(binded)
			Window:Notify({
				Title = "Demo Window",
				Description = "Pressed keybind - "..tostring(binded.Name),
				Lifetime = 3
			})
		end,
		onBinded = function(bind)
			Window:Notify({
				Title = "Demo Window",
				Description = "Successfully Binded Keybind to - "..tostring(bind.Name),
				Lifetime = 3
			})
		end,
	}, "Keybind")

	sections.MainSection1:Colorpicker({
		Name = "Colorpicker",
		Default = Color3.fromRGB(0, 255, 255),
		Callback = function(color)
			print("Color: ", color)
		end,
	}, "Colorpicker")

	local alphaColorPicker = sections.MainSection1:Colorpicker({
		Name = "Transparency Colorpicker",
		Default = Color3.fromRGB(255,0,0),
		Alpha = 0,
		Callback = function(color, alpha)
			print("Color: ", color, " Alpha: ", alpha)
		end,
	}, "TransparencyColorpicker")

	local rainbowActive
	local rainbowConnection
	local hue = 0

	sections.MainSection1:Toggle({
		Name = "Rainbow",
		Default = false,
		Callback = function(value)
			rainbowActive = value

			if rainbowActive then
				rainbowConnection = game:GetService("RunService").RenderStepped:Connect(function(deltaTime)
					hue = (hue + deltaTime * 0.1) % 1
					alphaColorPicker:SetColor(Color3.fromHSV(hue, 1, 1))
				end)
			elseif rainbowConnection then
				rainbowConnection:Disconnect()
				rainbowConnection = nil
			end
		end,
	}, "RainbowToggle")

	local optionTable = {
		"Apple",
		"Banana",
		"Orange",
		"Grapes",
		"Pineapple",
		"Mango",
		"Strawberry",
		"Blueberry",
		"Watermelon",
		"Peach"
	}

	local Dropdown = sections.MainSection1:Dropdown({
		Name = "Dropdown",
		Multi = false,
		Required = true,
		Options = optionTable,
		Default = 1,
		Callback = function(Value)
			print("Dropdown changed: ".. Value)
		end,
	}, "Dropdown")

	local MultiDropdown = sections.MainSection1:Dropdown({
		Name = "Multi Dropdown",
		Search = true,
		Multi = true,
		Required = false,
		Options = optionTable,
		Default = {"Apple", "Orange"},
		Callback = function(Value)
			local Values = {}
			for Value, State in next, Value do
				table.insert(Values, Value)
			end
			print("Mutlidropdown changed:", table.concat(Values, ", "))
		end,
	}, "MultiDropdown")

	sections.MainSection1:Button({
		Name = "Update Selection",
		Callback = function()
			Dropdown:UpdateSelection("Grapes")
			MultiDropdown:UpdateSelection({"Banana", "Pineapple"})
		end,
	})

	sections.MainSection1:Divider()

	sections.MainSection1:Header({
		Text = "Header #2"
	})

	sections.MainSection1:Paragraph({
		Header = "Paragraph",
		Body = "Paragraph body. Lorem ipsum odor amet, consectetuer adipiscing elit. Morbi tempus netus aliquet per velit est gravida."
	})

	sections.MainSection1:Label({
		Text = "Label. Lorem ipsum odor amet, consectetuer adipiscing elit."
	})

	sections.MainSection1:SubLabel({
		Text = "Sub-Label. Lorem ipsum odor amet, consectetuer adipiscing elit."
	})

	MacLib:SetFolder("Maclib")
	tabs.Settings:InsertConfigSection("Left")

	Window.onUnloaded(function()
		print("Unloaded!")
	end)

	tabs.Main:Select()
	MacLib:LoadAutoLoadConfig()
end

return MacLib end function __DIST.b()-- Hàm thông báo an toàn dùng chung cho DungeonQuest.
-- Nhận Window tham chiếu qua SetWindow (vì Window được tạo sau khi require module).

--// Variables

local window

--// Table
local notifier = {}

--// Methods
function notifier:SetWindow(newWindow)
	window = newWindow
end

function notifier.Notify(title, desc, lifetime)
	lifetime = lifetime or 3

	if window then
		local ok = pcall(function()
			window:Notify({ Title = title, Description = desc, Lifetime = lifetime })
		end)
		if ok then return end
	end

	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = title,
			Text = desc,
			Duration = lifetime,
		})
	end)
end

return notifier
end function __DIST.c()-- Cache toàn bộ services + tham chiếu LocalPlayer dùng chung cho DungeonQuest.

--// Services

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")

--// Player
local player = Players.LocalPlayer
if not player then
	local timeoutClock = os.clock() + 5
	repeat
		player = Players.LocalPlayer
		if player then break end
		task.wait(0.1)
	until os.clock() > timeoutClock
end

return {
	Players = Players,
	UserInputService = UserInputService,
	RunService = RunService,
	VirtualInputManager = VirtualInputManager,
	player = player,
}
end function __DIST.d()-- Engine dùng chung cho DungeonQuest: quản lý state, tracking dungeon/kẻ địch,
-- speed, skill, và các helper di chuyển farm. Các module chuyên biệt
-- (combat, farm, autoStart...) thao tác lên module này để tránh circular dependency.

--// Imports

local services = __DIST.load('c')
local notifier = __DIST.load('b')

--// References
local Players = services.Players
local UserInputService = services.UserInputService
local RunService = services.RunService
local VirtualInputManager = services.VirtualInputManager
local player = services.player

--// Constants
local FREEZE_TIME = 0.15

local ORBIT_RADIUS = 50
local ORBIT_HEIGHT = 24
local ORBIT_SPEED = 40

--// Khoảng thời gian (giây) giữa các lần nhảy góc trong farm mode "Orbit Tele".
--// Giữa các nhảy nhân vật vẫn được PivotTo giữ vị trí mới (không ghost), chỉ có
--// góc farmAngle tăng theo bước mỗi khoảng này.
local ORBIT_TELE_INTERVAL = 0.15

local AUTO_SKILL_INTERVAL = 2.0
local AUTO_KEY_HOLD_TIME = 0.05
local SKILL_RANGE = 60
local SHORTCUT_TELEPORT_HEIGHT = 0
local SHORTCUT_ORBIT_DURATION = 0.3
local SHORTCUT_ORBIT_SPEED = 0

local FARM_SCAN_INTERVAL = 0.15
local FARM_ENGAGE_DISTANCE = 45
local FARM_APPROACH_SPEED = 90
local FARM_APPROACH_EPSILON = 1.5
local HOVER_HEIGHT = ORBIT_HEIGHT

--// Bật/tắt chế độ blacklist quái khi chọn mục tiêu (true = bật, false = tắt -> chọn mọi quái)
local BLACKLIST_ENABLED = true

--// Folder trong ReplicatedStorage chứa toàn bộ model/projectile của enemy.
--// Dùng chung cho Highlight Hitbox (ESP) và Basic Orbit Dodge.
local PROJECTILE_FOLDER = "enemyProjectiles"

--// Danh sách tên quái KHÔNG được chọn làm mục tiêu (retarget/ban đầu).
--// Chỉnh sửa trực tiếp tại đây.
--// VD: BLACKLIST_ENEMIES = { "Northern Mage", "Northern Spearman" }
local BLACKLIST_ENEMIES = {"Northern Warrior"}

local GUI_UPDATE_INTERVAL = 0.5

--// Table
local shared = {}

--// State
local humanoid = nil

local enabled = false
local fastSpeed = 50
local normalSpeed = 16

local teleporting = false

local dodging = false

local dungeonStartTime = nil

--// Boss state (dựa trên GUI bossHealth xuất hiện khi có boss trong room)
local bossActive = false
local bossCallbacks = {}

--// Chỉ số boss hiện tại trong 1 dungeon (thường 1 dungeon có 3 boss).
--// Tăng 1 mỗi lần IsBossActive chuyển false -> true (boss 1 = 1); reset về 0
--// khi vào dungeon mới.
local bossIndex = 0
local bossIndexCallbacks = {}

--// Lưu trạng thái retarget trước khi vào boss để khôi phục khi rời boss
local retargetSavedDuringBoss = nil

--// Maintain orbit height khi đánh boss: giữ cố định độ cao bằng cách bù offset
--// khi boss hạ thấp vị trí (track pos Y của boss)
local maintainBossHeight = false
local bossStartY = nil

local farmEnabled = false
local farmMode = "Orbit"
local farmTarget = nil
local farmAngle = 0
local farmApproaching = false
local farmOldAutoRotate = true
local farmRunning = false
local farmLastSkillTime = 0
local shortcutOrbitId = 0
local nearestTeleportDistance = 12
local farthestTeleportDistance = 12
--// Bước góc (độ) mỗi lần tele trong farm mode "Orbit Tele" (real alias là rad sau đó)
local orbitTeleStepDeg = 15
--// Thời điểm lần nhảy góc gần nhất (điều khiển nhịp ORBIT_TELE_INTERVAL)
local lastTeleStepTime = 0

local retargetEnabled = false
local retargetInterval = 5
local retargetMethod = "Auto"
--// Cách chọn mục tiêu của Auto Retarget: "Nearest" (gần nhất) hoặc "Farthest" (xa nhất)
local retargetMode = "Nearest"
local orbitReverseEnabled = false
local farmOrbitDirection = 1
local basicOrbitDirection = nil
local blacklistEnemies = {}
for _, name in ipairs(BLACKLIST_ENEMIES) do
	if type(name) == "string" and name ~= "" then
		table.insert(blacklistEnemies, name)
	end
end

local autoSkillEnabled = false
local autoSkillRunning = false
local autoSkillMode = "Spam"

local dungeon = nil
local trackedRooms = {}
local trackedEnemies = {}
local roomConnections = {}
local enemyConnections = {}
local pendingModels = {}
local enemyCount = 0

--// Tên dungeon đang chơi, đọc từ workspace.dungeonName.
--// Lưu ý: trong Workspace có 2 instance tên "dungeonName", chỉ 1 cái mang giá trị
--// dungeon thật; giá trị còn lại là placeholder ("unknown") hoặc rỗng khi ở lobby
--// -> chỉ nhận chuỗi KHÁC placeholder (xem readDungeonName).
local currentDungeonName = nil
local dungeonNameCallbacks = {}

--// Giá trị placeholder của workspace.dungeonName khi chưa vào dungeon (lobby).
local DUNGEON_NAME_PLACEHOLDER = "unknown"

--// Trạng thái LOBBY vs DUNGEON. Lobby = chưa có tên dungeon thật
--// (workspace.dungeonName placeholder "unknown"/rỗng). Có tên thật -> trong dungeon.
local inLobby = true
local lobbyCallbacks = {}

--// Forward declarations
local cleanupEnemies
local getNearestEnemy
local getFarthestEnemy
local initializeRooms
local resetDungeon
local leaveFarmTarget
local moveFarmTarget
local farmTeleportTo
local fireFarmSkills

--// Respawn hooks (các module khác đăng ký để reset trạng thái khi respawn)
local respawnCallbacks = {}

function shared.OnRespawn(callback)
	table.insert(respawnCallbacks, callback)
end

--// Enemy helpers
local function getModelRoot(model)
	if not model or not model:IsA("Model") then return nil end
	local root = model:FindFirstChild("HumanoidRootPart")
	if root and root:IsA("BasePart") then return root end
	if model.PrimaryPart and model.PrimaryPart:IsA("BasePart") then return model.PrimaryPart end
	for _, object in ipairs(model:GetDescendants()) do
		if object:IsA("BasePart") then return object end
	end
	return nil
end

local function isValidEnemy(model)
	if not model or not model:IsA("Model") or not model.Parent or model == player.Character then return false end
	local enemyHumanoid = model:FindFirstChildOfClass("Humanoid")
	if not enemyHumanoid or enemyHumanoid.Health <= 0 then return false end
	return getModelRoot(model) ~= nil
end

local function disconnectEnemyConnections(enemy)
	local connections = enemyConnections[enemy]
	if not connections then return end
	if connections.Died then connections.Died:Disconnect(); connections.Died = nil end
	enemyConnections[enemy] = nil
end

local function untrackEnemy(enemy)
	if not enemy or not trackedEnemies[enemy] then return end
	pendingModels[enemy] = nil
	trackedEnemies[enemy] = nil
	enemyCount -= 1
	disconnectEnemyConnections(enemy)
end

local function trackEnemy(enemy)
	if not isValidEnemy(enemy) or trackedEnemies[enemy] then return end
	local root = getModelRoot(enemy)
	local enemyHumanoid = enemy:FindFirstChildOfClass("Humanoid")
	if not root or not enemyHumanoid then return end

	trackedEnemies[enemy] = { Model = enemy, Root = root, Humanoid = enemyHumanoid }
	enemyCount += 1
	enemyConnections[enemy] = { Died = enemyHumanoid.Died:Connect(function() untrackEnemy(enemy) end) }
end

local function waitAndTrackModel(model)
	if not model then return end
	if isValidEnemy(model) then trackEnemy(model); return end
	if pendingModels[model] then return end
	pendingModels[model] = true
	task.spawn(function()
		local timeout = os.clock() + 3
		while model.Parent and os.clock() < timeout do
			if isValidEnemy(model) then
				pendingModels[model] = nil
				trackEnemy(model)
				return
			end
			task.wait(0.1)
		end
		pendingModels[model] = nil
		if model.Parent and isValidEnemy(model) then trackEnemy(model) end
	end)
end

local function trackRoom(room)
	if not room or trackedRooms[room] then return end
	trackedRooms[room] = true
	for _, object in ipairs(room:GetDescendants()) do
		if object:IsA("Model") and isValidEnemy(object) then trackEnemy(object) end
	end
	roomConnections[room] = {
		Added = room.DescendantAdded:Connect(function(object)
			if object:IsA("Model") then
				waitAndTrackModel(object)
			elseif object:IsA("Humanoid") then
				local possibleModel = object:FindFirstAncestorOfClass("Model")
				if possibleModel then waitAndTrackModel(possibleModel) end
			end
		end),
		Removed = room.DescendantRemoving:Connect(function(object)
			if object:IsA("Model") then untrackEnemy(object) end
		end),
	}
end

initializeRooms = function()
	if not dungeon then dungeon = workspace:WaitForChild("dungeon", 30) end
	if not dungeon then return false end

	bossIndex = 0
	for i = #bossIndexCallbacks, 1, -1 do
		pcall(bossIndexCallbacks[i], bossIndex)
	end

	for _, room in ipairs(dungeon:GetChildren()) do
		if room:IsA("Folder") or room:IsA("Model") then trackRoom(room) end
	end
	return true
end

resetDungeon = function()
	if not dungeon then return end
	for room, conns in pairs(roomConnections) do
		if conns.Added then pcall(function() conns.Added:Disconnect() end) end
		if conns.Removed then pcall(function() conns.Removed:Disconnect() end) end
	end
	roomConnections = {}
	trackedRooms = {}
	for enemy in pairs(trackedEnemies) do
		disconnectEnemyConnections(enemy)
	end
	trackedEnemies = {}
	enemyCount = 0
	pendingModels = {}
	if farmTarget then leaveFarmTarget() end
	dungeon = nil
end

cleanupEnemies = function()
	for enemy, data in pairs(trackedEnemies) do
		if not enemy or not enemy.Parent then
			untrackEnemy(enemy)
		else
			local enemyHumanoid = data.Humanoid or enemy:FindFirstChildOfClass("Humanoid")
			data.Humanoid = enemyHumanoid
			if not enemyHumanoid or enemyHumanoid.Health <= 0 then
				untrackEnemy(enemy)
			else
				local root = data.Root
				if not root or not root.Parent then
					root = getModelRoot(enemy)
					if root then data.Root = root else untrackEnemy(enemy) end
				end
			end
		end
	end
end

local function isBlacklisted(name)
	if not BLACKLIST_ENABLED then return false end
	for _, n in ipairs(blacklistEnemies) do
		if n == name then return true end
	end
	return false
end

getNearestEnemy = function()
	local character = player.Character
	if not character or not character.Parent then return nil end
	local playerRoot = character:FindFirstChild("HumanoidRootPart")
	if not playerRoot then return nil end

	local best, bestDistance = nil, math.huge
	local fallback, fallbackDistance = nil, math.huge
	for enemy, data in pairs(trackedEnemies) do
		if enemy and enemy.Parent and data and data.Root and data.Root.Parent then
			local distance = (playerRoot.Position - data.Root.Position).Magnitude
			if isBlacklisted(enemy.Name) then
				--// blacklist: chỉ nhắm khi không còn enemy bình thường nào tồn tại
				if distance < fallbackDistance then
					fallbackDistance = distance
					fallback = { Model = enemy, Root = data.Root, Distance = distance }
				end
			elseif distance < bestDistance then
				bestDistance = distance
				best = { Model = enemy, Root = data.Root, Distance = distance }
			end
		end
	end
	--// hết enemy bình thường -> chấp nhận đánh enemy trong blacklist
	if not best then return fallback end
	return best
end

getFarthestEnemy = function()
	local character = player.Character
	if not character or not character.Parent then return nil end
	local playerRoot = character:FindFirstChild("HumanoidRootPart")
	if not playerRoot then return nil end

	local best, bestDistance = nil, -1
	local fallback, fallbackDistance = nil, -1
	for enemy, data in pairs(trackedEnemies) do
		if enemy and enemy.Parent and data and data.Root and data.Root.Parent then
			local distance = (playerRoot.Position - data.Root.Position).Magnitude
			if isBlacklisted(enemy.Name) then
				--// blacklist: chỉ nhắm khi không còn enemy bình thường nào tồn tại
				if distance > fallbackDistance then
					fallbackDistance = distance
					fallback = { Model = enemy, Root = data.Root, Distance = distance }
				end
			elseif distance > bestDistance then
				bestDistance = distance
				best = { Model = enemy, Root = data.Root, Distance = distance }
			end
		end
	end
	--// hết enemy bình thường -> chấp nhận enemy trong blacklist
	if not best then return fallback end
	return best
end

--// Skill helpers
local function getLockedSkillTarget()
	if farmEnabled and farmTarget and trackedEnemies[farmTarget] then
		local data = trackedEnemies[farmTarget]
		if data.Root and data.Root.Parent then return data.Root end
	end
	return nil
end

local function canFireSkill()
	if autoSkillMode ~= "Target Only" then return true end
	local root = getLockedSkillTarget()
	if not root then return false end
	local character = player.Character
	local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
	if not playerRoot then return false end
	return (playerRoot.Position - root.Position).Magnitude <= SKILL_RANGE
end

--// Farm movement helpers
leaveFarmTarget = function()
	if not farmTarget then return end
	farmTarget = nil
	farmApproaching = false
	if humanoid and humanoid.Parent then humanoid.AutoRotate = farmOldAutoRotate end
end

local function getOrbitPosition(center, angle)
	local height = ORBIT_HEIGHT
	if bossActive and center then
		if maintainBossHeight then
			if not bossStartY then bossStartY = center.Y end
			local drop = bossStartY - center.Y
			if drop > 0 then height = height + drop end
		end
	end
	return center + Vector3.new(math.cos(angle) * ORBIT_RADIUS, height, math.sin(angle) * ORBIT_RADIUS)
end

moveFarmTarget = function(deltaTime)
	if dodging then return end
	local enemy = farmTarget
	if not enemy or not trackedEnemies[enemy] or not trackedEnemies[enemy].Root or not trackedEnemies[enemy].Root.Parent then
		leaveFarmTarget()
		return
	end
	local character = player.Character
	local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
	if not character or not playerRoot or not playerRoot.Parent then leaveFarmTarget(); return end
	if not character.PrimaryPart then character.PrimaryPart = playerRoot end
	if not character.PrimaryPart then leaveFarmTarget(); return end

	local center = trackedEnemies[enemy].Root.Position
	local targetPosition
	if farmMode == "Hover" then
		farmApproaching = false
		targetPosition = center + Vector3.new(0, HOVER_HEIGHT, 0)
	elseif farmMode == "Orbit Tele" then
		--// Giả lập quỹ đạo bằng tele rời rạc: không move mượt (speed quỹ đạo = 0),
		--// chỉ tăng góc theo từng bước cố định mỗi ORBIT_TELE_INTERVAL. Nhưng vẫn
		--// PivotTo mỗi frame (như orbit thường) để giữ vị trí thật, tránh ghost.
		if teleporting then return end
		local effDir = basicOrbitDirection or farmOrbitDirection
		if not farmApproaching then
			if os.clock() - lastTeleStepTime >= ORBIT_TELE_INTERVAL then
				farmAngle = (farmAngle + effDir * math.rad(orbitTeleStepDeg)) % (math.pi * 2)
				lastTeleStepTime = os.clock()
			end
		end
		targetPosition = getOrbitPosition(center, farmAngle)
		if farmApproaching then
			local toPoint = targetPosition - playerRoot.Position
			local dist = toPoint.Magnitude
			if dist <= FARM_APPROACH_EPSILON then
				farmApproaching = false
			else
				targetPosition = playerRoot.Position + toPoint.Unit * math.min(dist, FARM_APPROACH_SPEED * deltaTime)
			end
		end
	else
		local effDir = basicOrbitDirection or farmOrbitDirection
		farmAngle = (farmAngle + effDir * math.rad(ORBIT_SPEED) * deltaTime) % (math.pi * 2)
		targetPosition = getOrbitPosition(center, farmAngle)
		if farmApproaching then
			local toPoint = targetPosition - playerRoot.Position
			local dist = toPoint.Magnitude
			if dist <= FARM_APPROACH_EPSILON then
				farmApproaching = false
			else
				targetPosition = playerRoot.Position + toPoint.Unit * math.min(dist, FARM_APPROACH_SPEED * deltaTime)
			end
		end
	end

	character:PivotTo(CFrame.lookAt(targetPosition, center))
	playerRoot.AssemblyLinearVelocity = Vector3.zero
	playerRoot.AssemblyAngularVelocity = Vector3.zero
end

--// Teleport tới vị trí orbit dùng khi Auto Farm nhận mục tiêu mới. Phím tắt
--// cũng dùng chính phép dịch chuyển này để giữ hành vi nhất quán với Auto Farm.
local function teleportToFarmOrbit(enemy, restoreAutoRotate, targetPosition)
	if teleporting then return end
	local character = player.Character
	local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
	local currentHumanoid = character and character:FindFirstChild("Humanoid")
	local data = trackedEnemies[enemy]
	if not character or not playerRoot or not currentHumanoid or not data or not data.Root or not data.Root.Parent then return false end

	local enemyRoot = data.Root
	local oldAnchored, oldAutoRotate = playerRoot.Anchored, currentHumanoid.AutoRotate
	if not character.PrimaryPart then character.PrimaryPart = playerRoot end
	teleporting = true

	local s, err = pcall(function()
		currentHumanoid.AutoRotate = false
		playerRoot.Anchored = true
		playerRoot.AssemblyLinearVelocity, playerRoot.AssemblyAngularVelocity = Vector3.zero, Vector3.zero

		targetPosition = targetPosition or getOrbitPosition(enemyRoot.Position, farmAngle)

		character:PivotTo(CFrame.lookAt(targetPosition, enemyRoot.Position))
		playerRoot.AssemblyLinearVelocity, playerRoot.AssemblyAngularVelocity = Vector3.zero, Vector3.zero

		task.wait(FREEZE_TIME)

		if playerRoot and playerRoot.Parent and currentHumanoid and currentHumanoid.Parent then
			playerRoot.Anchored = oldAnchored
			if restoreAutoRotate then currentHumanoid.AutoRotate = oldAutoRotate end
		end
	end)
	if not s then warn("[Teleport] orbit teleport error:", tostring(err)) end
	teleporting = false
	return s
end

farmTeleportTo = function(enemy)
	teleportToFarmOrbit(enemy, false)
end

--// Giữ mục tiêu theo đúng nhịp Orbit / Orbit Tele của Auto Farm trong một
--// khoảng ngắn sau khi dùng phím tắt. Không đụng tới farmTarget nên không
--// làm thay đổi trạng thái Auto Farm đang chạy.
local function maintainShortcutOrbit(enemy, orbitId, angle, radius, height, duration, speed)
	local deadline = os.clock() + duration
	local previousTime = os.clock()

	while orbitId == shortcutOrbitId and os.clock() < deadline do
		local data = trackedEnemies[enemy]
		local character = player.Character
		local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
		if not data or not data.Root or not data.Root.Parent or not character or not playerRoot or not playerRoot.Parent then
			return
		end
		if not character.PrimaryPart then character.PrimaryPart = playerRoot end
		if not character.PrimaryPart then return end

		local now = os.clock()
		local deltaTime = now - previousTime
		previousTime = now
		local center = data.Root.Position
		local targetPosition

		angle = (angle + math.rad(speed) * deltaTime) % (math.pi * 2)
		targetPosition = center + Vector3.new(math.cos(angle) * radius, height, math.sin(angle) * radius)

		character:PivotTo(CFrame.lookAt(targetPosition, center))
		playerRoot.AssemblyLinearVelocity = Vector3.zero
		playerRoot.AssemblyAngularVelocity = Vector3.zero
		RunService.Heartbeat:Wait()
	end
end

fireFarmSkills = function()
	if not canFireSkill() then return end
	if os.clock() - farmLastSkillTime < AUTO_SKILL_INTERVAL then return end
	if autoSkillMode == "Target Only" then task.wait(0.1) end
	farmLastSkillTime = os.clock()
	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
	task.delay(AUTO_KEY_HOLD_TIME, function()
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
	end)
end

--// Teleport phím tắt dùng cùng điểm orbit ban đầu của Auto Farm.
local function getShortcutTeleportPosition(enemyRoot, playerRoot, mode, distance, height)
	local direction
	if mode == "Behind" then
		direction = -enemyRoot.CFrame.LookVector
	else
		direction = playerRoot.Position - enemyRoot.Position
	end

	direction = Vector3.new(direction.X, 0, direction.Z)
	if direction.Magnitude < 0.01 then direction = Vector3.new(0, 0, -1) end
	direction = direction.Unit
	local angle = math.atan2(direction.Z, direction.X)
	local position = enemyRoot.Position + Vector3.new(direction.X * distance, height, direction.Z * distance)
	return position, angle
end

local function teleportToSelectedEnemy(selector, mode, distance, height, orbitDuration, orbitSpeed)
	if teleporting then return end

	local s, err = pcall(function()
		if shared.IsInLobby() then return end
		if not dungeon and not initializeRooms() then return end
		cleanupEnemies()

		local target = selector()
		if not target then
			notifier.Notify("Teleport", "No enemy found.", 3)
			return
		end

		local character = player.Character
		local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
		if not playerRoot then return end
		local position, angle = getShortcutTeleportPosition(target.Root, playerRoot, mode, distance, height)

		if teleportToFarmOrbit(target.Model, true, position) then
			notifier.Notify("Teleport", "Teleported to " .. target.Model.Name, 2)
			shortcutOrbitId += 1
			local orbitId = shortcutOrbitId
			task.spawn(function()
				maintainShortcutOrbit(target.Model, orbitId, angle, distance, height, orbitDuration, orbitSpeed)
			end)
		end
	end)
	if not s then warn("[Teleport] shortcut error:", tostring(err)) end
end

function shared.TeleportToNearestEnemy()
	teleportToSelectedEnemy(getNearestEnemy, "Nearest", nearestTeleportDistance, SHORTCUT_TELEPORT_HEIGHT, SHORTCUT_ORBIT_DURATION, SHORTCUT_ORBIT_SPEED)
end

function shared.TeleportBehindFarthestEnemy()
	teleportToSelectedEnemy(getFarthestEnemy, "Behind", farthestTeleportDistance, SHORTCUT_TELEPORT_HEIGHT, SHORTCUT_ORBIT_DURATION, SHORTCUT_ORBIT_SPEED)
end

--// Speed state (Speed tab thao tác lên đây)
function shared.SetFastSpeed(value)
	fastSpeed = value
	if enabled and humanoid and humanoid.Parent then
		humanoid.WalkSpeed = fastSpeed
	end
end

function shared.SetSpeedEnabled(state)
	enabled = state
	if humanoid and humanoid.Parent then
		humanoid.WalkSpeed = enabled and fastSpeed or normalSpeed
	end
end

function shared.IsSpeedEnabled()
	return enabled
end

function shared.GetFastSpeed()
	return fastSpeed
end

function shared.GetNearestTeleportDistance()
	return nearestTeleportDistance
end

function shared.SetNearestTeleportDistance(value)
	nearestTeleportDistance = tonumber(value) or nearestTeleportDistance
end

function shared.GetFarthestTeleportDistance()
	return farthestTeleportDistance
end

function shared.SetFarthestTeleportDistance(value)
	farthestTeleportDistance = tonumber(value) or farthestTeleportDistance
end

--// Humanoid setup
local speedConnection = nil
local function connectSpeedListener()
	if speedConnection then
		speedConnection:Disconnect()
		speedConnection = nil
	end
	if not humanoid or not humanoid.Parent then return end
	speedConnection = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
		if enabled and humanoid and humanoid.Parent and humanoid.WalkSpeed ~= fastSpeed then
			humanoid.WalkSpeed = fastSpeed
		end
	end)
end

function shared.SetHumanoid(character)
	if not character then return end
	local newHumanoid = character:WaitForChild("Humanoid", 10)
	if not newHumanoid then return end

	humanoid = newHumanoid
	normalSpeed = humanoid.WalkSpeed
	if enabled then humanoid.WalkSpeed = fastSpeed end
end

--// Farm state accessors
function shared.IsFarmEnabled()
	return farmEnabled
end

function shared.GetFarmMode()
	return farmMode
end

function shared.SetFarmMode(mode)
	farmMode = mode
end

function shared.GetFarmRunning()
	return farmRunning
end

function shared.SetFarmRunning(value)
	farmRunning = value
end

function shared.SetFarmEnabled(value)
	farmEnabled = value
end

function shared.GetRetargetEnabled()
	return retargetEnabled
end

function shared.SetRetargetEnabled(value)
	retargetEnabled = value == true
end

function shared.GetRetargetInterval()
	return retargetInterval
end

function shared.SetRetargetInterval(value)
	retargetInterval = tonumber(value) or retargetInterval
end

function shared.GetRetargetMethod()
	return retargetMethod
end

function shared.SetRetargetMethod(value)
	retargetMethod = value or "Auto"
end

function shared.GetRetargetMode()
	return retargetMode
end

function shared.SetRetargetMode(value)
	if value == "Nearest" or value == "Farthest" then retargetMode = value end
end

function shared.GetOrbitReverseEnabled()
	return orbitReverseEnabled
end

function shared.SetOrbitReverseEnabled(value)
	orbitReverseEnabled = value == true
end

--// Basic Orbit Dodge: điều khiển hướng orbit hiệu dụng (nil = dùng farmOrbitDirection)
function shared.SetBasicOrbitDirection(value)
	basicOrbitDirection = value
end

function shared.GetBasicOrbitDirection()
	return basicOrbitDirection
end

function shared.FlipBasicOrbitDirection()
	if basicOrbitDirection then basicOrbitDirection = -basicOrbitDirection end
end

function shared.GetFarmOrbitDirection()
	return farmOrbitDirection
end

function shared.GetOrbitAngle()
	return farmAngle
end

function shared.SetOrbitAngle(value)
	farmAngle = (((value % (math.pi * 2)) + math.pi * 2) % (math.pi * 2))
end

--// Vị trí tâm + độ cao orbit hiện tại (để tele skip)
function shared.GetOrbitCenter()
	if not farmTarget or not trackedEnemies[farmTarget] then return nil end
	local data = trackedEnemies[farmTarget]
	if data.Root and data.Root.Parent then return data.Root.Position end
	return nil
end

function shared.GetOrbitHeight()
	return ORBIT_HEIGHT
end

function shared.SetDodging(value)
	dodging = value == true
end

function shared.IsDodging()
	return dodging
end

function shared.GetDungeonStartTime()
	return dungeonStartTime
end

function shared.SetDungeonStartTime(value)
	dungeonStartTime = value
end

function shared.GetDungeonElapsed()
	if not dungeonStartTime then return nil end
	return os.clock() - dungeonStartTime
end

function shared.ClearFarmTarget()
	leaveFarmTarget()
end

--// Farm internals (farm.luau sử dụng)
function shared.ReadyDungeon()
	if not dungeon and not initializeRooms() then return false end
	return true
end

function shared.FarmPickTarget()
	cleanupEnemies()

	local function pickBest()
		return (retargetMode == "Farthest") and getFarthestEnemy() or getNearestEnemy()
	end

	local pick
	if farmTarget then
		local cur = trackedEnemies[farmTarget]
		if cur and cur.Root and cur.Root.Parent then
			--// Realtime retarget: mục tiêu hiện tại còn sống, mỗi lần quét so ngay
			--// với đối tượng TỐT NHẤT hiện có (Nearest/Farthest theo mode). Không chờ
			--// interval — xuất hiện đối tượng hơn liền switch qua nó.
			if retargetEnabled then
				pick = pickBest()
				if pick and pick.Model ~= farmTarget then
					if orbitReverseEnabled then farmOrbitDirection = -farmOrbitDirection end
					leaveFarmTarget()
				else
					return true
				end
			else
				return true
			end
		end
	end
	if farmTarget then return true end
	pick = pickBest()
	if pick and pick.Model and pick.Root and pick.Root.Parent then
		farmTarget = pick.Model
		if humanoid and humanoid.Parent then
			farmOldAutoRotate = humanoid.AutoRotate
			humanoid.AutoRotate = false
		end
		if retargetMethod == "Tele" then
			farmTeleportTo(farmTarget)
			farmApproaching = false
		elseif retargetMethod == "Tween" then
			farmApproaching = true
		else
			--// "Auto": tele khi còn quá xa (chưa trong phạm vi engage), còn lại tiếp cận.
			if pick.Distance > FARM_ENGAGE_DISTANCE then
				farmTeleportTo(farmTarget)
				farmApproaching = false
			else
				farmApproaching = true
			end
		end
		return true
	end
	if not dungeon then initializeRooms() end
	return false
end

function shared.FarmStep(deltaTime)
	if not inLobby and farmEnabled and not teleporting then moveFarmTarget(deltaTime) end
end

function shared.FarmFireSkills()
	if farmTarget and trackedEnemies[farmTarget] then fireFarmSkills() end
end

function shared.CanFireSkill()
	return canFireSkill()
end

function shared.FarmTargetAlive()
	local data = trackedEnemies[farmTarget]
	return farmTarget and farmTarget.Parent and data and data.Root and data.Root.Parent
end

--// Vị trí farm target hiện tại (boss/đối tượng farm) để dodge giữ hướng nhìn.
--// Trả về Vector3 hoặc nil nếu không có.
function shared.GetFarmTargetPosition()
	if not farmTarget or not trackedEnemies[farmTarget] then return nil end
	local data = trackedEnemies[farmTarget]
	if data.Root and data.Root.Parent then return data.Root.Position end
	return nil
end

function shared.GetHumanoid()
	return humanoid
end

function shared.RestoreAutoRotate()
	if humanoid and humanoid.Parent then humanoid.AutoRotate = farmOldAutoRotate end
end

--// Auto skill state
function shared.IsAutoSkillEnabled()
	return autoSkillEnabled
end

function shared.SetAutoSkillEnabled(value)
	autoSkillEnabled = value
end

function shared.GetAutoSkillRunning()
	return autoSkillRunning
end

function shared.SetAutoSkillRunning(value)
	autoSkillRunning = value
end

function shared.SetAutoSkillMode(mode)
	autoSkillMode = mode
end

function shared.GetAutoSkillMode()
	return autoSkillMode
end

--// Trả về danh sách tên các loại enemy có trong màn (dungeon + đang track)
function shared.GetEnemyNames()
	local names = {}
	local function add(name)
		if name and name ~= "" and name ~= player.Name then names[name] = true end
	end
	if dungeon then
		for _, room in ipairs(dungeon:GetChildren()) do
			if room:IsA("Folder") or room:IsA("Model") then
				for _, obj in ipairs(room:GetDescendants()) do
					if obj:IsA("Model") and obj:FindFirstChildOfClass("Humanoid") then
						add(obj.Name)
					end
				end
			end
		end
	end
	for enemy in pairs(trackedEnemies) do
		add(enemy.Name)
	end
	local out = {}
	for name in pairs(names) do table.insert(out, name) end
	table.sort(out)
	return out
end

--// Số enemy còn sống đang track trong màn (cập nhật thời gian thực)
function shared.GetEnemyCount()
	return enemyCount
end

--// Trả về set tên projectile của enemy từ ReplicatedStorage.enemyProjectiles
--// (bao gồm Model, MeshPart, Part). Dùng chung cho ESP và Basic Orbit Dodge.
function shared.GetEnemyProjectileNames()
	local names = {}
	local rs = game:GetService("ReplicatedStorage")
	local folder = rs:FindFirstChild(PROJECTILE_FOLDER)
	if not folder then return names end
	for _, obj in ipairs(folder:GetChildren()) do
		local cls = obj.ClassName
		if cls == "Model" or cls == "MeshPart" or cls == "Part" then
			names[obj.Name] = true
		end
	end
	return names
end

--// Tunable constants accessors (UI tabs cập nhật qua đây)
function shared.GetSkillInterval()
	return AUTO_SKILL_INTERVAL
end

function shared.SetSkillInterval(value)
	AUTO_SKILL_INTERVAL = value
end

function shared.GetSkillRange()
	return SKILL_RANGE
end

function shared.SetSkillRange(value)
	SKILL_RANGE = value
end

function shared.GetKeyHoldTime()
	return AUTO_KEY_HOLD_TIME
end

function shared.GetOrbitRadius()
	return ORBIT_RADIUS
end

function shared.SetOrbitRadius(value)
	ORBIT_RADIUS = value
end

function shared.GetOrbitSpeed()
	return ORBIT_SPEED
end

function shared.SetOrbitSpeed(value)
	ORBIT_SPEED = value
end

function shared.GetOrbitTeleStep()
	return orbitTeleStepDeg
end

function shared.SetOrbitTeleStep(value)
	orbitTeleStepDeg = value
end

function shared.GetOrbitHeight()
	return ORBIT_HEIGHT
end

function shared.SetOrbitHeight(value)
	ORBIT_HEIGHT = value
end

--// Y hiện tại của boss đang farm (để bù offset khi boss hạ độ cao)
local function currentFarmTargetY()
	local data = farmTarget and trackedEnemies[farmTarget]
	if data and data.Root and data.Root.Parent then return data.Root.Position.Y end
	return nil
end

--// Maintain orbit height khi đánh boss
function shared.GetMaintainBossHeight()
	return maintainBossHeight
end

function shared.SetMaintainBossHeight(value)
	maintainBossHeight = value == true
	if maintainBossHeight then
		if bossActive then
			bossStartY = currentFarmTargetY() or bossStartY
		end
	else
		bossStartY = nil
	end
end

function shared.GetHoverHeight()
	return HOVER_HEIGHT
end

function shared.SetHoverHeight(value)
	HOVER_HEIGHT = value
end

function shared.GetFarmEngageDistance()
	return FARM_ENGAGE_DISTANCE
end

function shared.SetFarmEngageDistance(value)
	FARM_ENGAGE_DISTANCE = value
end

function shared.GetFarmScanInterval()
	return FARM_SCAN_INTERVAL
end

--// Initialization: character hiện tại + listeners
if player and player.Character and player.Character.Parent then
	shared.SetHumanoid(player.Character)
	connectSpeedListener()
else
	local character = player and player.CharacterAdded and task.spawn(function()
		local char = player.CharacterAdded:Wait()
		if char then shared.SetHumanoid(char); connectSpeedListener() end
	end)
end

if player then
	player.CharacterAdded:Connect(function(character)
		local ok, err = pcall(function()
			farmTarget = nil; farmAngle = 0; farmApproaching = false; farmOldAutoRotate = true
			if humanoid and humanoid.Parent then humanoid.AutoRotate = farmOldAutoRotate end
			if not character then return end
			shared.SetHumanoid(character)
			connectSpeedListener()

			for _, callback in ipairs(respawnCallbacks) do
				pcall(callback)
			end
		end)
		if not ok then warn("[Shared] respawn handler error:", tostring(err)) end
	end)
end

local lastHeartbeatWarn = 0
RunService.Heartbeat:Connect(function(deltaTime)
	local ok, err = pcall(function()
		shared.FarmStep(deltaTime)
	end)
	if not ok then
		local now = os.clock()
		if now - lastHeartbeatWarn > 5 then
			lastHeartbeatWarn = now
			warn("[Heartbeat] error:", tostring(err))
		end
	end
end)

--// Dungeon watcher
task.spawn(function()
	while true do
		task.wait(GUI_UPDATE_INTERVAL)
		local currentDungeon = workspace:FindFirstChild("dungeon")
		if dungeon and currentDungeon ~= dungeon then
			resetDungeon()
		elseif not dungeon and currentDungeon then
			initializeRooms()
		end
	end
end)

--// Dungeon name watcher: theo dõi tên dungeon thật. Ở lobby workspace.dungeonName
--// mang placeholder "unknown" (hoặc rỗng) -> coi như CHƯA vào dungeon (trả nil).
local function readDungeonName()
	local Workspace = game:GetService("Workspace")
	for _, obj in ipairs(Workspace:GetDescendants()) do
		if obj.Name == "dungeonName" and obj:IsA("ValueBase") then
			local value = obj.Value
			if type(value) == "string" then
				local trimmed = string.gsub(value, "%s+", "")
				if trimmed ~= "" and string.lower(trimmed) ~= DUNGEON_NAME_PLACEHOLDER then
					return value
				end
			end
		end
	end
	return nil
end

task.spawn(function()
	while true do
		task.wait(GUI_UPDATE_INTERVAL)
		local name = readDungeonName()
		if name ~= currentDungeonName then
			currentDungeonName = name
			if name then shared.ResetBossIndex() end
			for i = #dungeonNameCallbacks, 1, -1 do
				pcall(dungeonNameCallbacks[i], name)
			end
		end
	end
end)

--// Xác định trạng thái lobby dựa trên tên dungeon: có tên dungeon thật = đang ở
--// trong dungeon; chưa có (placeholder "unknown"/rỗng) = lobby. Không phụ thuộc
--// nút start ngoài UI.
local function determineLobbyState()
	return not (currentDungeonName and #currentDungeonName > 0)
end

--// Lobby watcher: lobby = startButton hiện diện khi đang ở ngoài dungeon
task.spawn(function()
	while true do
		task.wait(GUI_UPDATE_INTERVAL)
		local lobby = determineLobbyState()
		if lobby ~= inLobby then
			inLobby = lobby
			for i = #lobbyCallbacks, 1, -1 do
				pcall(lobbyCallbacks[i], inLobby)
			end
		end
	end
end)

task.spawn(function()
	local success, errorMessage = pcall(function() return initializeRooms() end)
	if not success then
		warn("[EnemyTracker] Initialization error:", errorMessage)
	end
end)

--// Boss state API
function shared.IsBossActive()
	return bossActive
end

function shared.OnBossActiveChanged(callback)
	if type(callback) ~= "function" then return function() end end
	table.insert(bossCallbacks, callback)
	return function()
		for i, cb in ipairs(bossCallbacks) do
			if cb == callback then table.remove(bossCallbacks, i) break end
		end
	end
end

function shared.GetCurrentBossIndex()
	return bossIndex
end

--// Xác định loại mục tiêu đang farm để áp setting combat theo context:
--// "Mob" (quái thường) hoặc "Boss1"/"Boss2"/"Boss3" theo thứ tự boss hiện tại.
function shared.GetCombatTargetKey()
	if not bossActive then return "Mob" end
	local idx = math.clamp(bossIndex, 1, 3)
	return "Boss" .. tostring(idx)
end

function shared.ResetBossIndex()
	bossIndex = 0
	for i = #bossIndexCallbacks, 1, -1 do
		pcall(bossIndexCallbacks[i], bossIndex)
	end
end

function shared.OnBossIndexChanged(callback)
	if type(callback) ~= "function" then return function() end end
	table.insert(bossIndexCallbacks, callback)
	return function()
		for i, cb in ipairs(bossIndexCallbacks) do
			if cb == callback then table.remove(bossIndexCallbacks, i) break end
		end
	end
end

--// ---- Dungeon name ----
function shared.GetCurrentDungeonName()
	return currentDungeonName
end

function shared.OnDungeonNameChanged(callback)
	if type(callback) ~= "function" then return function() end end
	table.insert(dungeonNameCallbacks, callback)
	return function()
		for i, cb in ipairs(dungeonNameCallbacks) do
			if cb == callback then table.remove(dungeonNameCallbacks, i) break end
		end
	end
end

--// ---- Lobby / Dungeon state ----
function shared.IsInLobby()
	return inLobby
end

function shared.OnLobbyChanged(callback)
	if type(callback) ~= "function" then return function() end end
	table.insert(lobbyCallbacks, callback)
	return function()
		for i, cb in ipairs(lobbyCallbacks) do
			if cb == callback then table.remove(lobbyCallbacks, i) break end
		end
	end
end

--// Boss GUI tracker: theo dõi PlayerGui để phát hiện bossHealth xuất hiện/biến mất
local bossHealthRef = nil
local function setBossActive(active)
	if bossActive == active then return end
	bossActive = active
	if active then
		bossIndex += 1
		for i = #bossIndexCallbacks, 1, -1 do
			pcall(bossIndexCallbacks[i], bossIndex)
		end
		retargetSavedDuringBoss = retargetEnabled
		retargetEnabled = false
		if maintainBossHeight then bossStartY = currentFarmTargetY() end
	else
		if retargetSavedDuringBoss ~= nil then
			retargetEnabled = retargetSavedDuringBoss
			retargetSavedDuringBoss = nil
		end
		bossStartY = nil
	end
	for i = #bossCallbacks, 1, -1 do
		pcall(bossCallbacks[i], bossActive)
	end
end

local function scanBossGui()
	if not player then return end
	local playerGui = player:FindFirstChild("PlayerGui")
	if not playerGui then
		bossHealthRef = nil
		setBossActive(false)
		return
	end
	local found = playerGui:FindFirstChild("bossHealth", true)
	if found then
		if found ~= bossHealthRef then
			bossHealthRef = found
			if bossHealthRef:IsA("GuiObject") or bossHealthRef:IsA("ScreenGui") then
				bossHealthRef:GetPropertyChangedSignal("Enabled"):Connect(scanBossGui)
			end
		end
		setBossActive(not (type(found.Enabled) == "boolean") or found.Enabled == true)
	else
		bossHealthRef = nil
		setBossActive(false)
	end
end

task.spawn(function()
	if not player then return end
	local playerGui = player:WaitForChild("PlayerGui", 30)
	if not playerGui then return end

	playerGui.DescendantAdded:Connect(scanBossGui)
	playerGui.DescendantRemoving:Connect(scanBossGui)
	scanBossGui()

	--// Poll an toàn phòng trường hợp DescendantRemoving bỏ sót khi GUI bị xóa cục bộ
	while task.wait(0.5) do
		scanBossGui()
	end
end)

--// Table
return shared
end function __DIST.e()-- Tiện ích UI dùng chung cho các tab DungeonQuest (Maclib).

--// Table

local ui = {}

-- Fix: Maclib Slider Load chỉ cập nhật UI (SetValue ignorecallback=true),
-- nên patch UpdateValue để sau khi load vẫn gọi lại Callback => backend đồng bộ.
function ui.PatchSliderLoadCallback(sliderElement)
	if not sliderElement or type(sliderElement.UpdateValue) ~= "function" then return sliderElement end
	local originalUpdateValue = sliderElement.UpdateValue
	sliderElement.UpdateValue = function(self, Value)
		originalUpdateValue(self, Value)
		local settings = self.Settings
		if settings and settings.Callback then
			task.spawn(function()
				pcall(settings.Callback, tonumber(Value))
			end)
		end
	end
	return sliderElement
end

return ui
end function __DIST.f()-- Auto-save config cho DungeonQuest: tự động lưu mỗi khi control thay đổi,
-- không cần bấm "Overwrite" thủ công. Chỉ lưu khi có config active đang chọn.

--// Imports

local macLib = __DIST.load('a')
local notifier = __DIST.load('b')

--// Table
local autoSave = {}

--// Variables
local activeConfig = nil
local saveQueued = false

-- Cập nhật tên config đang active (gọi từ Config tab khi chọn/tạo/tải config)
function autoSave.SetActive(name)
	activeConfig = (typeof(name) == "string" and #name > 0) and name or nil
end

function autoSave.GetActive()
	return activeConfig
end

-- Lưu ngay lập tức (gọi trực tiếp)
function autoSave.SaveNow()
	if not activeConfig then return end

	local success, err = macLib:SaveConfig(activeConfig)
	if not success and err and err ~= "Please select a config file." then
		notifier.Notify("AutoSave", "Không lưu được config: " .. tostring(err), 3)
	end
end

-- Lưu có debounce: dồn nhiều thay đổi (vd kéo slider) thành 1 lần lưu
function autoSave.Save()
	if not activeConfig then return end
	if saveQueued then return end
	saveQueued = true

	task.delay(0.5, function()
		saveQueued = false
		if autoSave.GetActive() then
			autoSave.SaveNow()
		end
	end)
end

-- Bọc một callback control để tự lưu sau khi callback chạy
function autoSave.Wrap(callback)
	if type(callback) ~= "function" then return callback end
	return function(...)
		callback(...)
		autoSave.Save()
	end
end

return autoSave
end function __DIST.g()-- Auto Farm cho DungeonQuest (Orbit / Hover). Chạy vòng lặp săn kẻ địch gần nhất.

--// Imports

local shared = __DIST.load('d')
local notifier = __DIST.load('b')

--// Table
local farm = {}

--// Methods
function farm.Start()
	if shared.GetFarmRunning() then return end
	shared.SetFarmRunning(true)
	shared.SetFarmEnabled(true)

	local lastWarnClock = 0

	task.spawn(function()
		--// Chờ rời lobby (đã vào dungeon) trước khi scan để không abort sớm khi
		--// bật Auto Farm ngay từ màn hình chờ. Timeout 30s cho load chậm.
		local waited = 0
		while shared.IsInLobby() and shared.IsFarmEnabled() do
			task.wait(0.5)
			waited = waited + 0.5
			if waited >= 30 then
				shared.SetFarmEnabled(false)
				shared.SetFarmRunning(false)
				notifier.Notify("Auto Farm", "Still in lobby — aborted. Toggle again inside the dungeon.", 4)
				return
			end
		end
		if not shared.IsFarmEnabled() then
			shared.SetFarmRunning(false)
			return
		end

		if not shared.ReadyDungeon() then
			shared.SetFarmEnabled(false)
			shared.SetFarmRunning(false)
			notifier.Notify("Auto Farm", "Failed to detect dungeon.", 3)
			return
		end

		while shared.IsFarmEnabled() do
			local humanoid = shared.GetHumanoid()
			if not humanoid or not humanoid.Parent or humanoid.Health <= 0 then
				task.wait(shared.GetFarmScanInterval())
				continue
			end

			local ok, err = pcall(function()
				if not shared.FarmPickTarget() then
					task.wait(0.5)
				else
					if not shared.FarmTargetAlive() then
						shared.ClearFarmTarget()
					else
						shared.FarmFireSkills()
					end
				end
			end)
			if not ok and os.clock() - lastWarnClock > 5 then
				lastWarnClock = os.clock()
				warn("[AutoFarm] error:", tostring(err))
			end
			if not shared.IsFarmEnabled() then break end
			task.wait(shared.GetFarmScanInterval())
		end

		shared.ClearFarmTarget()
		shared.SetFarmRunning(false)
	end)
end

function farm.Stop()
	shared.SetFarmEnabled(false)
	shared.ClearFarmTarget()
	shared.RestoreAutoRotate()
end

function farm.Toggle(state)
	if state then
		farm.Start()
		notifier.Notify("Auto Farm", "Auto Farm Started", 2)
	else
		farm.Stop()
		notifier.Notify("Auto Farm", "Auto Farm Stopped", 2)
	end
end

return farm
end function __DIST.h()-- Tab Speed (DungeonQuest).

--// Imports

local shared = __DIST.load('d')
local ui = __DIST.load('e')
local autoSave = __DIST.load('f')
local farm = __DIST.load('g')

return function(window, tab)
	local section = tab:Section({ Side = "Left" })
	section:Header({ Name = "Movement Speed" })

	section:Toggle({
		Name = "Fast Speed",
		Default = shared.IsSpeedEnabled(),
		Callback = autoSave.Wrap(function(state)
			shared.SetSpeedEnabled(state)
		end),
	}, "Toggle_FastSpeed")

	ui.PatchSliderLoadCallback(section:Slider({
		Name = "Custom Fast Speed",
		Default = shared.GetFastSpeed(),
		Minimum = 16,
		Maximum = 24,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			shared.SetFastSpeed(Value)
		end),
	}, "Slider_FastSpeed"))

	section:Header({ Name = "Teleport" })

	section:Button({
		Name = "Teleport Nearest (Key: R)",
		Callback = function()
			task.spawn(function()
				shared.TeleportToNearestEnemy()
			end)
		end,
	})

	ui.PatchSliderLoadCallback(section:Slider({
		Name = "R Teleport Distance",
		Default = shared.GetNearestTeleportDistance(),
		Minimum = 1,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(value)
			shared.SetNearestTeleportDistance(value)
		end),
	}, "Slider_TeleportNearestDistance"))

	section:Button({
		Name = "Teleport Behind Farthest (Key: C)",
		Callback = function()
			task.spawn(function()
				shared.TeleportBehindFarthestEnemy()
			end)
		end,
	})

	ui.PatchSliderLoadCallback(section:Slider({
		Name = "C Teleport Distance",
		Default = shared.GetFarthestTeleportDistance(),
		Minimum = 1,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(value)
			shared.SetFarthestTeleportDistance(value)
		end),
	}, "Slider_TeleportFarthestDistance"))

	--// Auto Farm toggle qua phím tắt
	section:Header({ Name = "Auto Farm" })

	section:Keybind({
		Name = "Toggle Auto Farm",
		Default = Enum.KeyCode.X,
		Callback = function()
			farm.Toggle(not shared.IsFarmEnabled())
		end,
	}, "Keybind_AutoFarm")

end
end function __DIST.i()-- Auto Skill (Q+E) cho DungeonQuest. Quản lý vòng lặp bấm phím, dựa trên shared state.

--// Imports

local services = __DIST.load('c')
local shared = __DIST.load('d')
local notifier = __DIST.load('b')

--// References
local VirtualInputManager = services.VirtualInputManager

--// Table
local combat = {}

--// Methods
function combat.StartAutoSkill()
	if shared.GetAutoSkillRunning() then return end
	shared.SetAutoSkillRunning(true)

	local lastWarnClock = 0

	task.spawn(function()
		while shared.IsAutoSkillEnabled() do
			local humanoid = shared.GetHumanoid()
			if not humanoid or not humanoid.Parent or humanoid.Health <= 0 then
				task.wait(shared.GetSkillInterval())
				continue
			end

			--// Chỉ bấm skill khi đang ở trong dungeon (không spam Q+E ngoài lobby)
			if shared.IsInLobby() then
				task.wait(shared.GetSkillInterval())
				continue
			end

			local ok, err = pcall(function()
				if shared.CanFireSkill() then
					VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
					VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
					task.wait(shared.GetKeyHoldTime())
					VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
					VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
				else
					task.wait(0.2)
				end
			end)
			if not ok and os.clock() - lastWarnClock > 5 then
				lastWarnClock = os.clock()
				warn("[AutoSkill] error:", tostring(err))
			end
			if not shared.IsAutoSkillEnabled() then break end
			task.wait(shared.GetSkillInterval())
		end
		shared.SetAutoSkillRunning(false)
	end)
end

function combat.StopAutoSkill()
	shared.SetAutoSkillEnabled(false)
end

function combat.ToggleAutoSkill(state)
	shared.SetAutoSkillEnabled(state)
	if state then
		combat.StartAutoSkill()
		notifier.Notify("Auto Skill", "Auto Q+E Started", 2)
	else
		combat.StopAutoSkill()
		notifier.Notify("Auto Skill", "Auto Q+E Stopped", 2)
	end
end

return combat
end function __DIST.j()-- Auto Start Game cho DungeonQuest: chờ tới khi ở LOBBY (startButton hiện + ngoài
-- dungeon) rồi fire remote start. Trạng thái lobby/dungeon tính tập trung ở shared
-- để autoStart, webhook... dùng chung, tránh mỗi nơi tự poll startButton riêng.

--// Imports

local shared = __DIST.load('d')
local notifier = __DIST.load('b')

--// State
local autoStartEnabled = false
local autoStartRunning = false
local autoStartTriggered = false
local autoStartCommand = 'game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("changeStartValue"):FireServer()'
local autoStartCommandFn = nil

--// Điều kiện kích hoạt: đang ở lobby (startButton hiện, ngoài dungeon) do shared tính
local function lobbyCondition()
	return shared.IsInLobby()
end

--// Compile remote start command (giữ hành vi cũ, loadstring có sẵn trong executor)
local s2, cmdFn2 = pcall(loadstring, autoStartCommand)
if s2 and type(cmdFn2) == "function" then autoStartCommandFn = cmdFn2 end

--// Table
local autoStart = {}

--// Methods
function autoStart.Start()
	if autoStartRunning then return end
	autoStartRunning = true
	autoStartTriggered = false
	task.spawn(function()
		while autoStartEnabled do
			local sCond, res = pcall(lobbyCondition)
			local met = sCond and res == true

			if met and not autoStartTriggered then
				autoStartTriggered = true
				if autoStartCommandFn then
					local sCmd, err = pcall(autoStartCommandFn)
					if sCmd then
						notifier.Notify("Auto Start", "Game started!", 3)
					else
						notifier.Notify("Auto Start", "Trigger failed: " .. tostring(err), 3)
					end
				else
					notifier.Notify("Auto Start", "Remote command invalid", 3)
				end
			end

			--// Hết lobby (vào dungeon / đang chơi) -> cho phép kích lại ở lobby lần sau
			if not met and autoStartTriggered then
				autoStartTriggered = false
			end

			if not autoStartEnabled then break end
			task.wait(1)
		end
		autoStartRunning = false
	end)
end

function autoStart.Stop()
	autoStartEnabled = false
end

function autoStart.Toggle(state)
	autoStartEnabled = state
	if state then
		autoStart.Start()
		notifier.Notify("Auto Start", "Waiting for lobby...", 2)
	else
		autoStart.Stop()
		notifier.Notify("Auto Start", "Stopped", 2)
	end
end

--// Reset trigger mỗi khi respawn
shared.OnRespawn(function()
	autoStartTriggered = false
end)

return autoStart end function __DIST.k()-- Auto Retry Dungeon cho DungeonQuest: khi reward holder có >= 2 item thì fire replayDungeon.

--// Imports

local services = __DIST.load('c')
local notifier = __DIST.load('b')

--// References
local player = services.player

--// State
local AUTO_RETRY_MIN_ITEMS = 2
local autoRetryEnabled = false
local autoRetryRunning = false
local autoRetryTriggered = false
local timeRetryEnabled = false
local timeRetryThreshold = 60
local timeRetryTriggered = false
local autoRetryCommand = [==[
local ReplayDungeon = game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("replayDungeon")

local payload = {}
local function collectValue(name)
	local value = workspace:FindFirstChild(name)
	if value and value:IsA("ValueBase") then
		payload[name] = value.Value
	end
end

collectValue("dungeonName")
collectValue("dungeonProgress")
collectValue("dungeonStarted")

local hardcore = workspace:FindFirstChild("hardcore")
if hardcore and hardcore:IsA("BoolValue") then
	payload.hardcore = hardcore.Value
	payload.isHardcore = hardcore.Value
end

local dungeon = workspace:FindFirstChild("dungeon")
if dungeon then
	for _, value in ipairs(dungeon:GetChildren()) do
		if value:IsA("ValueBase") then payload[value.Name] = value.Value end
	end
	local bossRoom = dungeon:FindFirstChild("bossRoom")
	if bossRoom then
		for _, value in ipairs(bossRoom:GetChildren()) do
			if value:IsA("ValueBase") then payload[value.Name] = value.Value end
		end
	end
end

if not payload.dungeonName then return end
ReplayDungeon:FireServer(payload)
]==]
local autoRetryHolderPath = 'game:GetService("Players").LocalPlayer.PlayerGui.rewardGuiHolder.holder'
local autoRetryCommandFn = nil
local autoRetryHolderFn = nil

--// Helpers (validation dùng loadstring, giữ logic gốc)
local function validateConditionText(text)
	local s, fn = pcall(loadstring, "return " .. text)
	if s and type(fn) == "function" then return fn end
	return nil
end

local sRetryCmd, compiledRetryCmd = pcall(loadstring, autoRetryCommand)
if sRetryCmd and type(compiledRetryCmd) == "function" then autoRetryCommandFn = compiledRetryCmd end

autoRetryHolderFn = validateConditionText(autoRetryHolderPath)
if not autoRetryHolderFn then
	autoRetryHolderFn = function()
		return player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("rewardGuiHolder") and player.PlayerGui.rewardGuiHolder:FindFirstChild("holder")
	end
end

--// Đọc thẳng giá trị thời gian còn lại từ UI game: PlayerGui.timeLeftGui.Frame.time
local function readTimeLeft()
	local ok, inst = pcall(function()
		local PlayerGui = player:FindFirstChild("PlayerGui")
		local gui = PlayerGui and PlayerGui:FindFirstChild("timeLeftGui")
		local frame = gui and gui:FindFirstChild("Frame")
		return frame and frame:FindFirstChild("time")
	end)
	if not ok or typeof(inst) ~= "Instance" then return nil end

	--// Ưu tiên ValueBase (NumberValue...), nếu không thì đọc Text của TextLabel
	local raw
	if inst:IsA("ValueBase") then
		raw = inst.Value
	else
		raw = inst.Text
	end
	if type(raw) == "number" then return raw end
	if type(raw) == "string" then
		local cleaned = raw:gsub("%s+", ""):gsub("^%[", ""):gsub("%]$", "")
		local m, s = cleaned:match("^(%d+):(%d+)$")
		if m and s then return tonumber(m) * 60 + tonumber(s) end
		local sec = tonumber(cleaned)
		if sec then return sec end
	end
	return nil
end

--// Table
local autoRetry = {}

--// Fire remote retry, trả về true nếu thành công
local function fireRetry()
	if not autoRetryCommandFn then
		notifier.Notify("Auto Retry", "Remote command invalid", 3)
		return false
	end
	local sCmd, err = pcall(autoRetryCommandFn)
	if sCmd then
		notifier.Notify("Auto Retry", "Retrying dungeon!", 3)
		return true
	end
	notifier.Notify("Auto Retry", "Trigger failed: " .. tostring(err), 3)
	return false
end

--// Methods
function autoRetry.Start()
	if autoRetryRunning then return end
	autoRetryRunning = true
	autoRetryTriggered = false
	timeRetryTriggered = false
	task.spawn(function()
		while autoRetryEnabled or timeRetryEnabled do
			--// Điều kiện reward (>= 2 item) - chạy riêng theo master Auto Retry
			if autoRetryEnabled then
				local count = 0
				if autoRetryHolderFn then
					local sok, holder = pcall(autoRetryHolderFn)
					if sok and typeof(holder) == "Instance" and holder.Parent then
						count = #holder:GetChildren()
					end
				end
				if count >= AUTO_RETRY_MIN_ITEMS and not autoRetryTriggered then
					autoRetryTriggered = true
					fireRetry()
				elseif count < AUTO_RETRY_MIN_ITEMS then
					autoRetryTriggered = false
				end
			end

			--// Điều kiện hết giờ (chạy độc lập khi bật Retry on Time Low):
			--// UI còn < X giây thì retry
			if timeRetryEnabled then
				local remaining = readTimeLeft()
				if remaining and remaining < timeRetryThreshold and not timeRetryTriggered then
					timeRetryTriggered = true
					fireRetry()
				elseif remaining and remaining >= timeRetryThreshold then
					timeRetryTriggered = false
				end
			end

			if not autoRetryEnabled and not timeRetryEnabled then break end
			task.wait(0.75)
		end
		autoRetryRunning = false
	end)
end

function autoRetry.Stop()
	autoRetryEnabled = false
end

function autoRetry.Toggle(state)
	autoRetryEnabled = state
	if state then
		timeRetryTriggered = false
		autoRetry.Start()
		notifier.Notify("Auto Retry", "Watching reward holder...", 2)
	else
		autoRetry.Stop()
		notifier.Notify("Auto Retry", "Stopped", 2)
	end
end

function autoRetry.SetTimeRetryEnabled(value)
	timeRetryEnabled = value == true
	if timeRetryEnabled then
		timeRetryTriggered = false
		autoRetry.Start()
		notifier.Notify("Auto Retry", "Watching time left...", 2)
	else
		notifier.Notify("Auto Retry", "Time retry stopped", 2)
	end
end

function autoRetry.GetTimeRetryEnabled()
	return timeRetryEnabled
end

function autoRetry.SetTimeRetryThreshold(value)
	timeRetryThreshold = value
end

function autoRetry.GetTimeRetryThreshold()
	return timeRetryThreshold
end

--// Đọc thời gian còn lại (giây) như đúng logic time-low đang dùng (UI playerGui.timeLeftGui.Frame.<time>)
function autoRetry.GetTimeLeft()
	return readTimeLeft()
end

function autoRetry.RetryNow()
	task.spawn(function()
		fireRetry()
	end)
end

return autoRetry
end function __DIST.l()-- Basic Orbit Dodge cho DungeonQuest (tích hợp tracking + safe-node từ Smart Dodge).
-- Kiểu dodge đơn giản: KHÔNG tắt orbit, player chạy orbit bình thường.
-- Dead zone = CHÍNH XÁC giao diện "Highlight Hitbox": mọi object trong Workspace có
-- tên trùng projectile enemy (ReplicatedStorage.enemyProjectiles) đều là dead zone,
-- xử lý như hitbox thật (OBB). Không phân biệt kinematic/predictive, không dự đoán
-- trajectory — tối giản đúng những gì Highlight Hitbox vẽ được.
-- Khi phát hiện hazard ở PHÍA TRƯỚC hướng đi -> đảo chiều orbit.
-- Khi bị KẸP 2 phía -> TÍNH NODE AN TOÀN NHẤT (safety score trên danger map) rồi nhảy tới đó.

--// Imports

local services = __DIST.load('c')
local shared = __DIST.load('d')

--// References
local player = services.player
local RunService = services.RunService

--// Configuration
--// Bán kính vùng detect quanh player (stud) - hành lang phía trước hướng đi
local DETECT_RADIUS = 15
--// Bán kính vùng PANIC: hazard quá gần player (bất kể hướng, bất kể cooldown
--// flip) -> tele thẳng tới node an toàn nhất (last-resort cho projectile cực nhanh)
local PANIC_RADIUS = 8
--// Cooldown giữa các lần panic tele (giây) - tránh spam tele mỗi heartbeat
local PANIC_COOLDOWN = 0.2
--// Cooldown chống lật hướng liên tục (giây)
local FLIP_COOLDOWN = 0.15
--// Số node phía trước (theo hướng đi) để coi là "có nguy hiểm đang tới"
local FLIP_LOOKAHEAD = 6
--// Số frame liên tiếp không có hazard trước khi reset hướng orbit về bình thường
local ALL_CLEAR_FRAMES = 5
--// Cooldown giữa các lần nhảy tới node an toàn (giây)
local JUMP_COOLDOWN = 0.3
--// Thời gian object invisible liên tục trước khi coi là "hết sát thương" (giây).
--// Chiêu thường fade ra (Transparency->1) nhưng model còn tồn tại 1 lúc; lúc đó
--// vô hại -> không đếm vào dead zone. Ngưỡng nhỏ để chống nhấp nháy giả.
local INACTIVE_DELAY = 0.15

--// ---- Danger map (kế thừa Smart Dodge) ----
--// PADDING quanh hitbox thật (OBB) để được coi là dead zone. Volume nguy hiểm khớp
--// kích thước từng object; fallback sphere khi không OBB.
DANGER_RADIUS = 1
--// Cap khoảng cách tới dead zone khi chấm điểm (tránh chênh lệch cực lớn)
local MAX_MARGIN_CAP = 30
--// Độ phân giải góc quét (độ)
local SAMPLE_STEP = 2
--// Số mẫu góc trên 360°
local N = math.floor(360 / SAMPLE_STEP)

--// Hiển thị trực quan dead zone (debug): folder chứa các part vẽ.
local VISUALS_FOLDER = "DeadZone_Visuals"
local VISUALS_BALL_COLOR = Color3.fromRGB(255, 60, 60)
local VISUALS_ARC_COLOR = Color3.fromRGB(255, 40, 40)
local VISUALS_DETECTOR_COLOR = Color3.fromRGB(60, 180, 255)
local VISUALS_PANIC_COLOR = Color3.fromRGB(255, 220, 60)

--// Tốc độ làm tươi visuals (giây)
local VISUALS_REFRESH_INTERVAL = 0.1

--// Table
local basicDodge = {}

--// State
local enabled = false
--// Chế độ hoạt động: "All" = mọi lúc, "Boss" = chỉ khi đang boss
local dodgeMode = "All"
local connection = nil
local lastFlipTime = 0
local lastJumpTime = 0
local lastPanicTime = 0
local noHazardCount = 0
local trackedColumns = {}
local debugVisuals = false
local detectorVisuals = false
--// Hình dạng detector: "Cone" (hình nón trước mặt) hoặc "Circle" (vòng tròn)
local detectorMode = "Circle"
local renderLoopRunning = false

--// Vị trí tâm (X/Y/Z) của object trong Workspace.
local function getObjectPosition(obj)
	if not obj then return nil end
	if obj:IsA("BasePart") then
		local ok, pos = pcall(function() return obj.Position end)
		if ok then return pos end
		return nil
	end
	local ok, primary = pcall(function() return obj.PrimaryPart end)
	if ok and primary and primary:IsA("BasePart") then return primary.Position end
	for _, c in ipairs(obj:GetChildren()) do
		if c:IsA("BasePart") then return c.Position end
	end
	return nil
end

--// Còn "hiển thị" (đang có khả năng gây sát thương) ?
--//  - BasePart: Transparency < 1.
--//  - Model: có part trong suốt, hoặc particle/beam/trail/decal đang Enabled.
--// Không thấy nữa = vô hại (không nên tính vào dead zone).
local function objectIsVisible(obj)
	if obj:IsA("BasePart") then
		return (obj.Transparency or 1) < 1
	end
	for _, d in ipairs(obj:GetDescendants()) do
		if d:IsA("BasePart") then
			if (d.Transparency or 0) < 1 then return true end
		elseif d:IsA("ParticleEmitter") or d:IsA("Beam") or d:IsA("Trail") then
			if d.Enabled then return true end
		elseif d:IsA("Decal") then
			if (d.Transparency or 0) < 1 then return true end
		end
	end
	return false
end

--// OBB (CFrame + Size) thật của hitbox để dead zone khớp hình dạng từng đối tượng.
local function getOBB(obj)
	if obj:IsA("BasePart") then
		return obj.CFrame, obj.Size
	end
	if obj:IsA("Model") then
		local ok, cframe, size = pcall(function()
			return obj:GetBoundingBox()
		end)
		if ok and cframe and size then return cframe, size end
	end
	return nil
end

--// Khoảng cách từ điểm tới OBB (dùng trong isSampleDanger: dead khi <= padding).
--// Chỉ tính trên mặt phẳng NGANG (X/Z), bỏ trục đứng (Y) để thay đổi orbit height
--// không làm dodge bỏ sót hazard.
local function pointToOBBDistance(pt, obbCFrame, obbSize)
	local localPt = obbCFrame:Inverse() * pt
	local hx = obbSize.X / 2
	local hz = obbSize.Z / 2
	local dx = math.max(math.abs(localPt.X) - hx, 0)
	local dz = math.max(math.abs(localPt.Z) - hz, 0)
	return math.sqrt(dx * dx + dz * dz)
end

--// Phát hiện object mới xuất hiện / loại bỏ object biến mất (quản lý membership).
local function tryTrackObject(child, seen)
	seen[child] = true
	local entry = trackedColumns[child]
	if not entry then
		local pos = getObjectPosition(child)
		if pos then
			local obbCFrame, obbSize = getOBB(child)
			trackedColumns[child] = {
				Instance = child,
				Position = pos,
				OBBFrame = obbCFrame,
				OBBSize = obbSize,
				Inactive = false,
				InvisibleSince = nil,
			}
		end
	end
end

local function refreshColumns()
	local Workspace = game:GetService("Workspace")
	--// Dead zone = mọi object trong Workspace tên trùng projectile enemy (như ESP),
	--// kể cả nằm sâu trong hậu duệ của một object Workspace.
	local projectileNames = shared.GetEnemyProjectileNames()
	local seen = {}
	for _, child in ipairs(Workspace:GetChildren()) do
		if projectileNames[child.Name] then
			tryTrackObject(child, seen)
		end
		for _, obj in ipairs(child:GetDescendants()) do
			if projectileNames[obj.Name] then
				tryTrackObject(obj, seen)
			end
		end
	end
	for inst in pairs(trackedColumns) do
		if not seen[inst] or not inst.Parent then
			trackedColumns[inst] = nil
		end
	end
end

--// Cập nhật vị trí object mỗi lần tính toán (bám theo chuyển động nhanh).
local function updateColumnPositions(now)
	for _, col in pairs(trackedColumns) do
		if col and col.Instance then
			local pos = getObjectPosition(col.Instance)
			if pos then
				col.Position = pos
				--// Trạng thái "vô hại": mất đi 1 phần thì vô hại ngay, mất hẳn (invisible
				--// liên tục đủ lâu) mới bỏ hẳn khỏi dead zone để chống nhấp nháy.
				if objectIsVisible(col.Instance) then
					col.InvisibleSince = nil
				elseif not col.InvisibleSince then
					col.InvisibleSince = now
				end
				col.Inactive = col.InvisibleSince ~= nil and (now - col.InvisibleSince) >= INACTIVE_DELAY
				--// OBB bám theo vị trí/rotation hiện tại của hitbox
				local obbCFrame, obbSize = getOBB(col.Instance)
				if obbCFrame and obbSize then
					col.OBBFrame = obbCFrame
					col.OBBSize = obbSize
				end
			end
		end
	end
end

local function horizontalDistance(a, b)
	local dx = b.X - a.X
	local dz = b.Z - a.Z
	return math.sqrt(dx * dx + dz * dz)
end

--// Có node nguy hiểm nào trong FLIP_LOOKAHEAD node phía trước theo hướng đi ?
--// Dựa trên danger map (cùng nguồn với jump), nên quyết định flip được thống nhất.
local function dangerAhead(danger, curIdx, effDir)
	for i = 1, FLIP_LOOKAHEAD do
		local idx = (curIdx + effDir * i) % N
		if idx < 0 then idx = idx + N end
		if danger[idx] then return true end
	end
	return false
end

--// Tele player tới góc theta (rad) trên orbit quanh center (đồng bộ farmAngle).
local function teleportToAngle(center, theta)
	local character = player.Character
	local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
	if not character or not playerRoot or not playerRoot.Parent then return end
	if not character.PrimaryPart then character.PrimaryPart = playerRoot end

	local radius = shared.GetOrbitRadius() or 0
	local height = shared.GetOrbitHeight() or 0
	local targetPos = center + Vector3.new(math.cos(theta) * radius, height, math.sin(theta) * radius)

	local humanoid = character:FindFirstChild("Humanoid")
	local oldAutoRotate = humanoid and humanoid.AutoRotate
	if humanoid then humanoid.AutoRotate = false end
	character:PivotTo(CFrame.lookAt(targetPos, center))
	playerRoot.AssemblyLinearVelocity, playerRoot.AssemblyAngularVelocity = Vector3.zero, Vector3.zero
	if humanoid then humanoid.AutoRotate = oldAutoRotate end

	--// đồng bộ farmAngle để moveFarmTarget tiếp tục đúng
	shared.SetOrbitAngle(theta)
end

--// ---- Danger map (chọn node an toàn nhất trên orbit) ----
local function orbitPoint(center, radius, angle, height)
	return Vector3.new(center.X + math.cos(angle) * radius, height, center.Z + math.sin(angle) * radius)
end

local function degToIdx(deg)
	return math.floor((((deg % 360) + 360) % 360) / SAMPLE_STEP) % N
end

local function idxToRad(idx)
	return math.rad(idx * SAMPLE_STEP)
end

--// Điểm orbit tại idx có nằm trong phạm vi nguy hiểm của hitbox nào.
--// Dùng OBB thật (khớp hitbox dài/ngang/xiên) + padding DANGER_RADIUS;
--// fallback sphere quanh tâm khi không lấy được OBB.
local function isSampleDanger(bossPos, radius, height, idx)
	local point = orbitPoint(bossPos, radius, idxToRad(idx), height)
	for _, col in pairs(trackedColumns) do
		if col and col.Position and not col.Inactive then
			if col.OBBFrame and col.OBBSize then
				if pointToOBBDistance(point, col.OBBFrame, col.OBBSize) <= DANGER_RADIUS then
					return true
				end
			elseif horizontalDistance(point, col.Position) < DANGER_RADIUS then
				return true
			end
		end
	end
	return false
end

--// Xây Danger Map: mọi tracked object (dead zone = hitbox ESP) chặn quanh vị trí.
local function buildDangerMap(bossPos, radius, height)
	local danger = {}
	for i = 0, N - 1 do
		danger[i] = isSampleDanger(bossPos, radius, height, i)
	end
	return danger
end

--// Khoảng cách (số node) từ idx tới dead zone gần nhất, cap ở MAX_MARGIN_CAP.
local function marginToDanger(danger, idx)
	if danger[idx] then return 0 end
	local margin = 0
	while margin < MAX_MARGIN_CAP do
		if danger[(idx + margin) % N] or danger[(idx - margin + N) % N] then break end
		margin = margin + 1
	end
	return margin
end

--// Độ dài run an toàn (số node, kể cả wrap) chứa idx.
local function safeRunWidth(danger, idx)
	if danger[idx] then return 0 end
	local width = 1
	local prev = (idx - 1 + N) % N
	while prev ~= idx and not danger[prev] do
		width = width + 1
		prev = (prev - 1 + N) % N
	end
	local nxt = (idx + 1) % N
	while nxt ~= idx and not danger[nxt] do
		width = width + 1
		nxt = (nxt + 1) % N
	end
	return width
end

--// Điểm an toàn của node: ưu tiên margin tới dead zone, phá quãng bằng run width.
local function safetyScore(danger, idx)
	if danger[idx] then return -1 end
	return marginToDanger(danger, idx) * 1000 + math.min(safeRunWidth(danger, idx), MAX_MARGIN_CAP)
end

--// Node an toàn nhất trên toàn orbit (điểm cao nhất). Trả về idx + điểm.
local function bestSafeIndex(danger, curIdx)
	local bestIdx, bestScore = curIdx, safetyScore(danger, curIdx)
	for idx = 0, N - 1 do
		local s = safetyScore(danger, idx)
		if s > bestScore then
			bestScore = s
			bestIdx = idx
		end
	end
	return bestIdx, bestScore
end

--// ---------- Dead zone visuals (debug) ----------

local function clearVisuals()
	local parent = game:GetService("Workspace"):FindFirstChild(VISUALS_FOLDER)
	if parent then parent:Destroy() end
end

local function createVisualPart(parent, transparent)
	local p = Instance.new("Part")
	p.Anchored = true
	p.CanCollide = false
	p.CanTouch = false
	p.CanQuery = false
	p.Material = Enum.Material.Neon
	p.Transparency = transparent or 0.5
	p.CastShadow = false
	p.Parent = parent
	return p
end

local function drawSegment(parent, a, b, thickness, transparent, color)
	local mid = a + (b - a) * 0.5
	local part = createVisualPart(parent, transparent)
	part.Shape = Enum.PartType.Block
	part.Color = color
	part.Size = Vector3.new(thickness, thickness, (a - b).Magnitude)
	if (a - b).Magnitude > 0.001 then
		part.CFrame = CFrame.lookAt(mid, b)
	end
end

--// Dead zone = chính xác hitbox ESP vẽ được: OBB thật inflated padding
--// DANGER_RADIUS (fallback sphere quanh tâm khi không có OBB).
local function renderDeadZoneBalls(parent)
	for _, col in pairs(trackedColumns) do
		if col and col.Position and not col.Inactive then
			local part = createVisualPart(parent, 0.65)
			if col.OBBFrame and col.OBBSize then
				part.Shape = Enum.PartType.Block
				part.Size = col.OBBSize + Vector3.new(DANGER_RADIUS, DANGER_RADIUS, DANGER_RADIUS) * 2
				part.CFrame = col.OBBFrame
			else
				part.Shape = Enum.PartType.Ball
				part.Size = Vector3.new(DANGER_RADIUS * 2, DANGER_RADIUS * 2, DANGER_RADIUS * 2)
				part.CFrame = CFrame.new(col.Position)
			end
			part.Color = VISUALS_BALL_COLOR
		end
	end
end

--// Vành đai cung dangerous trên orbit (các góc bị chặn trong danger map)
local function renderArc(parent, bossPos, radius, height, danger)
	for idx = 0, N - 1 do
		if danger[idx] then
			local nxt = (idx + 1) % N
			local p1 = orbitPoint(bossPos, radius, idxToRad(idx), height)
			local p2 = orbitPoint(bossPos, radius, idxToRad(nxt), height)
			drawSegment(parent, p1, p2, 0.9, 0.5, VISUALS_ARC_COLOR)
		end
	end
end

--// Vùng detect phía trước hướng đi (hình quạt: bán kính DETECT_RADIUS,
--// góc mở cố định quanh tiếp tuyến của orbit tại vị trí player).
local DETECTOR_ANGLE = 120
local CIRCLE_SECTIONS = 32
local function renderCircleAt(parent, playerPos, radius, color)
	local p = Vector3.new(playerPos.X, playerPos.Y, playerPos.Z)
	for i = 0, CIRCLE_SECTIONS - 1 do
		local t1 = i / CIRCLE_SECTIONS
		local t2 = (i + 1) / CIRCLE_SECTIONS
		local a1 = t1 * math.pi * 2
		local a2 = t2 * math.pi * 2
		local p1 = p + Vector3.new(math.cos(a1) * radius, 0, math.sin(a1) * radius)
		local p2 = p + Vector3.new(math.cos(a2) * radius, 0, math.sin(a2) * radius)
		drawSegment(parent, p1, p2, 0.12, 0.3, color)
	end
end

local function renderDetector(parent, playerPos, bossPos)
	local radius = shared.GetOrbitRadius()
	if not radius or radius <= 0 then return end
	if detectorMode == "Circle" then
		renderCircleAt(parent, playerPos, DETECT_RADIUS, VISUALS_DETECTOR_COLOR)
		renderCircleAt(parent, playerPos, PANIC_RADIUS, VISUALS_PANIC_COLOR)
		return
	end
	local effDir = shared.GetBasicOrbitDirection()
	if not effDir then effDir = shared.GetFarmOrbitDirection() or 1 end
	local radial = playerPos - bossPos
	local ang = math.atan2(radial.Z, radial.X)
	--// tiếp tuyến tại điểm player: đạo hàm (cosθ,sinθ) = (-sinθ, cosθ), nhân effDir
	local tx = -math.sin(ang) * effDir
	local tz = math.cos(ang) * effDir
	local tangent = Vector3.new(tx, 0, tz)
	local half = math.rad(DETECTOR_ANGLE / 2)

	--// Hai cạnh quạt
	local a2 = Vector3.new(tangent.X * math.cos(half) - tangent.Z * math.sin(half), 0, tangent.X * math.sin(half) + tangent.Z * math.cos(half)) * DETECT_RADIUS
	local b1 = Vector3.new(tangent.X * math.cos(-half) - tangent.Z * math.sin(-half), 0, tangent.X * math.sin(-half) + tangent.Z * math.cos(-half)) * DETECT_RADIUS
	local p = Vector3.new(playerPos.X, playerPos.Y, playerPos.Z)
	local pA2 = p + a2
	local pB1 = p + b1
	drawSegment(parent, p, pA2, 0.12, 0.3, VISUALS_DETECTOR_COLOR)
	drawSegment(parent, p, pB1, 0.12, 0.3, VISUALS_DETECTOR_COLOR)
	--// Cung trước
	local sections = 16
	for i = 0, sections - 1 do
		local t1 = i / sections
		local t2 = (i + 1) / sections
		local arcT1 = -half + (2 * half) * t1
		local arcT2 = -half + (2 * half) * t2
		local p1 = p + Vector3.new(tangent.X * math.cos(arcT1) - tangent.Z * math.sin(arcT1), 0, tangent.X * math.sin(arcT1) + tangent.Z * math.cos(arcT1)) * DETECT_RADIUS
		local p2 = p + Vector3.new(tangent.X * math.cos(arcT2) - tangent.Z * math.sin(arcT2), 0, tangent.X * math.sin(arcT2) + tangent.Z * math.cos(arcT2)) * DETECT_RADIUS
		drawSegment(parent, p1, p2, 0.12, 0.3, VISUALS_DETECTOR_COLOR)
	end
	--// Vùng PANIC: vòng tròn nhỏ màu vàng (dù chọn mode nào)
	renderCircleAt(parent, playerPos, PANIC_RADIUS, VISUALS_PANIC_COLOR)
end

--// Vẽ toàn bộ visuals cho 1 khung hình (xóa cũ, vẽ mới).
--// Tách riêng: Detector Visuals chỉ vẽ vòng detect/panic; Dead Zone Visuals
--// mới vẽ sphere kinematic + tia predictive + cung danger.
local function renderVisuals(bossPos, radius, height)
	clearVisuals()
	if not debugVisuals and not detectorVisuals then return end
	local parent = Instance.new("Folder")
	parent.Name = VISUALS_FOLDER
	parent.Parent = game:GetService("Workspace")
	local danger = nil
	if detectorVisuals then
		local character = player.Character
		local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
		if playerRoot and playerRoot.Parent then
			renderDetector(parent, playerRoot.Position, bossPos)
		end
	end
	if debugVisuals then
		danger = buildDangerMap(bossPos, radius, height)
		renderDeadZoneBalls(parent)
		renderArc(parent, bossPos, radius, height, danger)
	end
end

--// Loop vẽ visuals độc lập (chạy khi bật Dead Zone Visuals hoặc Detector Visuals).
local function ensureRenderLoop()
	if renderLoopRunning then return end
	renderLoopRunning = true
	task.spawn(function()
		while true do
			if debugVisuals or detectorVisuals then
				pcall(function()
					local center = shared.GetOrbitCenter()
					if center then
						refreshColumns()
						updateColumnPositions(os.clock())
						local radius = shared.GetOrbitRadius()
						local height = shared.GetOrbitHeight() or 0
						if radius and radius > 0 then
							renderVisuals(center, radius, height)
						end
					end
				end)
			end
			task.wait(VISUALS_REFRESH_INTERVAL)
		end
	end)
end

local function updateRenderLoop()
	if debugVisuals or detectorVisuals then
		ensureRenderLoop()
	else
		clearVisuals()
	end
end

--// Khi bị kẹp: nhảy tới node an toàn nhất trên vòng orbit (thay cho skip cứng).
local function jumpToSafeNode(center)
	local radius = shared.GetOrbitRadius()
	if not radius or radius <= 0 then return end
	local character = player.Character
	local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
	if not character or not playerRoot or not playerRoot.Parent then return end

	local height = shared.GetOrbitHeight() or 0
	local toPlayer = playerRoot.Position - center
	local curIdx = degToIdx(math.deg(math.atan2(toPlayer.Z, toPlayer.X)))
	local danger = buildDangerMap(center, radius, height)
	local bestIdx, bestScore = bestSafeIndex(danger, curIdx)
	if bestScore >= 0 and bestIdx ~= curIdx then
		teleportToAngle(center, idxToRad(bestIdx))
	end
end

--// Danh sách vị trí hazard đang được track (cho flip detection).
local function collectHazardPositions()
	local out = {}
	for _, col in pairs(trackedColumns) do
		if col and col.Position and not col.Inactive then table.insert(out, col.Position) end
	end
	return out
end

--// Có hazard nào đang nằm trong vùng PANIC quanh player (khoảng cách ngang) ?
local function panicHazardNearby(playerPos)
	for _, col in pairs(trackedColumns) do
		if col and col.Position and not col.Inactive and horizontalDistance(playerPos, col.Position) < PANIC_RADIUS then
			return true
		end
	end
	return false
end

local function basicStep()
	--// Chỉ né khi đang trong dungeon; không chạy ngoài lobby (không có hazard).
	if shared.IsInLobby() then return end
	local character = player.Character
	local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
	if not character or not playerRoot or not playerRoot.Parent then return end
	local mode = shared.GetFarmMode()
	if mode ~= "Orbit" and mode ~= "Orbit Tele" then return end
	--// Chế độ Boss Only: bỏ qua khi chưa trong boss room
	if dodgeMode == "Boss" and not shared.IsBossActive() then return end

	local center = shared.GetOrbitCenter()
	if not center then return end

	local playerPos = playerRoot.Position
	local now = os.clock()

	--// hướng hiệu dụng (khởi tạo nếu chưa)
	local effDir = shared.GetBasicOrbitDirection()
	if not effDir then
		effDir = shared.GetFarmOrbitDirection() or 1
		shared.SetBasicOrbitDirection(effDir)
	end

	--// tracking + cập nhật vị trí toàn bộ đối tượng cần né
	refreshColumns()
	updateColumnPositions(now)

	local hazards = collectHazardPositions()
	if #hazards == 0 then
		--// hazard biến mất tạm thời (beam đổi parent/primary part) không reset ngay;
		--// chỉ trả hướng về bình thường sau ALL_CLEAR_FRAMES frame liên tiếp
		noHazardCount = noHazardCount + 1
		if noHazardCount >= ALL_CLEAR_FRAMES then
			shared.SetBasicOrbitDirection(nil)
			noHazardCount = 0
		end
		return
	end
	noHazardCount = 0

	--// Xây danger map 1 lần, dùng chung cho quyết định flip và jump node an toàn.
	local height = shared.GetOrbitHeight() or 0
	local toPlayer = playerPos - center
	local curIdx = degToIdx(math.deg(math.atan2(toPlayer.Z, toPlayer.X)))
	local danger = buildDangerMap(center, shared.GetOrbitRadius(), height)

	--// PANIC: hazard lọt vào vùng cấm sát player -> tele thẳng node an toàn
	--// (bất chấp logic flip/kẹp, chỉ giữ cooldown riêng chống spam).
	if panicHazardNearby(playerPos) and now - lastPanicTime > PANIC_COOLDOWN then
		lastPanicTime = now
		jumpToSafeNode(center)
		return
	end

	if dangerAhead(danger, curIdx, effDir) then
		if now - lastFlipTime > FLIP_COOLDOWN then
			local newDir = -effDir
			shared.SetBasicOrbitDirection(newDir)
			lastFlipTime = now
			--// kẹt 2 phía: vẫn nguy hiểm trước hướng mới -> nhảy node an toàn
			if dangerAhead(danger, curIdx, newDir) and now - lastJumpTime > JUMP_COOLDOWN then
				lastJumpTime = now
				jumpToSafeNode(center)
			end
		elseif now - lastJumpTime > JUMP_COOLDOWN then
			--// trong cooldown flip mà vẫn còn nguy hiểm trước -> nhảy node an toàn
			lastJumpTime = now
			jumpToSafeNode(center)
		end
	end
end

function basicDodge.Toggle(state)
	enabled = state == true
	if enabled then
		lastFlipTime = 0
		lastJumpTime = 0
		lastPanicTime = 0
		noHazardCount = 0
		if not connection then
			connection = RunService.Heartbeat:Connect(function()
				basicStep()
			end)
		end
	else
		if connection then
			connection:Disconnect()
			connection = nil
		end
		trackedColumns = {}
		shared.SetBasicOrbitDirection(nil)
	end
end

function basicDodge.IsEnabled()
	return enabled
end

function basicDodge.GetMode()
	return dodgeMode
end

function basicDodge.SetMode(mode)
	if mode == "Boss" or mode == "All" then dodgeMode = mode end
end

function basicDodge.GetDetectRadius()
	return DETECT_RADIUS
end

function basicDodge.SetDetectRadius(value)
	DETECT_RADIUS = value
end

function basicDodge.GetPanicRadius()
	return PANIC_RADIUS
end

function basicDodge.SetPanicRadius(value)
	PANIC_RADIUS = value
end

function basicDodge.GetPanicCooldown()
	return PANIC_COOLDOWN
end

function basicDodge.SetPanicCooldown(value)
	PANIC_COOLDOWN = value
end

function basicDodge.GetFlipCooldown()
	return FLIP_COOLDOWN
end

function basicDodge.SetFlipCooldown(value)
	FLIP_COOLDOWN = value
end

function basicDodge.GetJumpCooldown()
	return JUMP_COOLDOWN
end

function basicDodge.SetJumpCooldown(value)
	JUMP_COOLDOWN = value
end

function basicDodge.GetDangerRadius()
	return DANGER_RADIUS
end

function basicDodge.SetDangerRadius(value)
	DANGER_RADIUS = value
end

function basicDodge.GetAllClearFrames()
	return ALL_CLEAR_FRAMES
end

function basicDodge.SetAllClearFrames(value)
	ALL_CLEAR_FRAMES = value
end

function basicDodge.GetFlipLookAhead()
	return FLIP_LOOKAHEAD
end

function basicDodge.SetFlipLookAhead(value)
	FLIP_LOOKAHEAD = value
end

--// ---- Chẩn đoán hazard (State tab) ----
--// Số hazard đang track còn hoạt động (chưa Inactive) - đúng thứ danger map dùng.
function basicDodge.GetHazardCount()
	local count = 0
	for _, col in pairs(trackedColumns) do
		if col and col.Position and not col.Inactive then count = count + 1 end
	end
	return count
end

--// Tên các hazard đang track (unique, sắp xếp) để đối chiếu với những gì thấy trong game.
function basicDodge.GetHazardNames()
	local names = {}
	for _, col in pairs(trackedColumns) do
		if col and col.Position and not col.Inactive and col.Instance then
			names[col.Instance.Name] = true
		end
	end
	local out = {}
	for name in pairs(names) do table.insert(out, name) end
	table.sort(out)
	return out
end

function basicDodge.GetInactiveDelay()
	return INACTIVE_DELAY
end

function basicDodge.SetInactiveDelay(value)
	INACTIVE_DELAY = value
end

function basicDodge.SetDebugVisuals(value)
	debugVisuals = value == true
	updateRenderLoop()
end

function basicDodge.IsDebugVisuals()
	return debugVisuals
end

function basicDodge.SetDetectorVisuals(value)
	detectorVisuals = value == true
	updateRenderLoop()
end

function basicDodge.IsDetectorVisuals()
	return detectorVisuals
end

function basicDodge.GetDetectorMode()
	return detectorMode
end

function basicDodge.SetDetectorMode(mode)
	if mode == "Cone" or mode == "Circle" then detectorMode = mode end
end

--// ---- Preset đã cấu hình hardcode trong source ----
--// "Custom" = giữ nguyên các giá trị chỉnh tay hiện tại (mặc định).
--// "Ultra Instinct" = né hoàn hảo nhất có thể: phát hiện sớm, biên an toàn rộng,
--// cooldown tối thiểu, nhạy với mọi hazard, phục hồi hướng orbit cực nhanh.
local DODGE_PRESETS = {
	["Custom"] = {},
	["Ultra Instinct"] = {
		Mode = "All",
		DetectRadius = 45,
		DangerRadius = 4,
		PanicRadius = 25,
		PanicCooldown = 0.05,
		FlipCooldown = 0.05,
		JumpCooldown = 0.1,
		FlipLookAhead = 10,
		AllClearFrames = 1,
		InactiveDelay = 0.1,
	},
}

local currentPreset = "Custom"

function basicDodge.ApplyPreset(name)
	if not DODGE_PRESETS[name] then return false end
	currentPreset = name
	local p = DODGE_PRESETS[name]
	if p.Mode then basicDodge.SetMode(p.Mode) end
	if p.DetectRadius then basicDodge.SetDetectRadius(p.DetectRadius) end
	if p.DangerRadius then basicDodge.SetDangerRadius(p.DangerRadius) end
	if p.PanicRadius then basicDodge.SetPanicRadius(p.PanicRadius) end
	if p.PanicCooldown then basicDodge.SetPanicCooldown(p.PanicCooldown) end
	if p.FlipCooldown then basicDodge.SetFlipCooldown(p.FlipCooldown) end
	if p.JumpCooldown then basicDodge.SetJumpCooldown(p.JumpCooldown) end
	if p.FlipLookAhead then basicDodge.SetFlipLookAhead(p.FlipLookAhead) end
	if p.AllClearFrames then basicDodge.SetAllClearFrames(p.AllClearFrames) end
	if p.InactiveDelay then basicDodge.SetInactiveDelay(p.InactiveDelay) end
	return true
end

function basicDodge.GetPreset()
	return currentPreset
end

function basicDodge.GetPresetNames()
	local out = {}
	for k in pairs(DODGE_PRESETS) do table.insert(out, k) end
	table.sort(out)
	return out
end

return basicDodge end function __DIST.m()-- Death Logger v2 cho DungeonQuest (executor-level hook).
-- Mục tiêu: biết CHÍNH XÁC nguyên nhân chết thay vì đoán theo vị trí.
--
-- Chiến lược phát hiện (theo độ chính xác giảm dần):
--   1. Hook `Humanoid.TakeDamage` (global, cài 1 lần ở Init). Mỗi đòn damage
--      trúng nhân vật local đều ghi lại {thời điểm, amount, source, vị trí}.
--      Đòn cuối cùng trong KILL_WINDOW (giây) trước lúc chết = killing blow.
--   2. Đọc engine props `LastHurtPart` / `LastHurtByHumanoid` + `lastCombatant`
--      (legacy) NGAY tại thời điểm chết — bắt được damage do server đè trực
--      tiếp Health mà không đi qua TakeDamage (vd: killplane, fall damage).
--   3. Quét object nghi ngờ quanh điểm chết CHỈ làm tham khảo (ưu tiên thấp).

--// Imports

local services = __DIST.load('c')
local player = services.player

--// Configuration
--// Tổng số damage record giữ lại (ring buffer, giữ lịch sử gần nhất)
local MAX_RECORDS = 64
--// Bán kính quét các object nghi ngờ quanh điểm chết (chỉ tính trong bán kính này)
local LOG_RADIUS = 25
--// Số candidate top hiển thị trong danh sách tham khảo
local TOP_N = 3
--// Khoảng (giây) giữa lúc chết và đòn TakeDamage gần nhất để coi là "killing blow"
local KILL_WINDOW = 2.0

--// Các pattern tên nghi ngờ là hazard/skill (khớp chuỗi con, không phân biệt hoa thường)
local CANDIDATE_PATTERNS = {
	"firstBoss", "CrissCross", "Spike", "Hitbox", "hitBox",
	"Skill", "Orb", "Spear", "Poison", "Arrow", "Projectile",
}

--// Table
local deathLog = {}

--// State
local enabled = false
local hookInstalled = false
local diedConnection = nil
local damageRecords = {}
local lastWarnClock = 0

--// Wrap closure để hook (một số executor bắt buộc C closure trên hook C function)
local wrapClosure = nil
if type(newcclosure) == "function" then
	wrapClosure = newcclosure
else
	wrapClosure = function(f) return f end
end

local function getLocalHumanoid()
	if not player then return nil end
	local character = player.Character
	if not character or not character.Parent then return nil end
	return character:FindFirstChildOfClass("Humanoid")
end

--// Tìm tên player sở hữu `source` (PvP) bằng cách đi lên chuỗi ancestor
local function resolveOwnerName(source)
	if not source then return nil end
	local ok, name = pcall(function()
		local Players = services.Players
		local ancestor = source
		local guard = 0
		while ancestor and ancestor.Parent and guard < 8 do
			local plr = Players:GetPlayerFromCharacter(ancestor)
			if plr then return plr.Name end
			ancestor = ancestor.Parent
			guard += 1
		end
		return nil
	end)
	return ok and name or nil
end

--// Liệt kê nguồn gây damage dưới dạng chuỗi (name + owner/tool + class + path)
local function describeSource(source)
	if not source then return "nil" end
	local name = nil
	local owner = nil
	local toolName = nil
	local cls = nil
	local path = nil
	pcall(function() name = source.Name end)
	pcall(function() cls = source.ClassName end)
	pcall(function()
		local ancestor = source.Parent
		local guard = 0
		while ancestor and ancestor.Parent and guard < 8 do
			if not toolName and ancestor:IsA("Tool") then toolName = ancestor.Name end
			ancestor = ancestor.Parent
			guard += 1
		end
	end)
	pcall(function() path = source:GetFullName() end)
	owner = resolveOwnerName(source)

	local out = name and name ~= "" and name or "?"
	if toolName then out = out .. " / " .. toolName end
	if owner then out = out .. " (by " .. owner .. ")" end
	out = out .. " [" .. (cls or "?") .. "]"
	if path and path ~= "" then out = out .. " {" .. path .. "}" end
	return out
end

--// Tạo record damage từ hook. Trả về rec để hook cập nhật healthAfter sau damage.
local function makeRecord(victim, amount, source)
	if type(amount) ~= "number" then return nil end
	local rec = {
		time = os.clock(),
		amount = amount,
		healthAfter = nil,
		source = source,
		victimPos = nil,
		sourcePos = nil,
		dist = nil,
	}
	if victim and victim.Parent then
		pcall(function()
			local root = victim.Parent:FindFirstChild("HumanoidRootPart")
			if root and root:IsA("BasePart") then rec.victimPos = root.Position end
		end)
	end
	if source then
		pcall(function()
			if source:IsA("BasePart") then
				rec.sourcePos = source.Position
			elseif source:IsA("Model") then
				local p = source.PrimaryPart
				if p and p:IsA("BasePart") then rec.sourcePos = p.Position end
			end
		end)
		if rec.sourcePos and rec.victimPos then
			rec.dist = (rec.sourcePos - rec.victimPos).Magnitude
		end
	end

	if #damageRecords >= MAX_RECORDS then
		table.remove(damageRecords, 1)
	end
	table.insert(damageRecords, rec)
	return rec
end

--// Cài hook `TakeDamage` GLOBAL cho mọi Humanoid, chỉ record khi victim là ta.
--// Đã hook thì giữ nguyên qua các lần respawn (character mới vẫn dùng chung method).
local function installTakeDamageHook()
	if hookInstalled then return true end
	if type(hookfunction) ~= "function" then return false end

	local ok = pcall(function()
		local prototype = Instance.new("Humanoid")
		local original = prototype.TakeDamage
		hookInstalled = hookfunction(original, wrapClosure(function(self, ...)
			if enabled and self and self == getLocalHumanoid() then
				local args = {...}
				local rec = makeRecord(self, args[1], args[2])
				local results = { original(self, ...) }
				if rec then pcall(function() rec.healthAfter = self.Health end) end
				return unpack(results)
			end
			return original(self, ...)
		end)) ~= nil
		prototype:Destroy()
	end)

	if not ok then hookInstalled = false end
	if not hookInstalled then
		local now = os.clock()
		if now - lastWarnClock > 5 then
			lastWarnClock = now
			warn("[DeathLog] Hook TakeDamage failed -> chỉ dùng engine props + scan tham khảo.")
		end
	end
	return hookInstalled
end

--// Đọc engine props xác định kẻ đã đánh phát cuối (chạy sát lúc chết)
local function engineKillerInfo(humanoid)
	local info = {}
	if not humanoid then return info end
	pcall(function()
		local v = humanoid.lastCombatant
		if v then
			if v.Parent then info.lastCombatant = v.Parent.Name else info.lastCombatant = tostring(v) end
		end
	end)
	pcall(function()
		local v = humanoid.LastHurtByHumanoid
		if v and v.Parent then info.lastHurtByHumanoid = v.Parent.Name else info.lastHurtByHumanoid = tostring(v) end
	end)
	pcall(function()
		local v = humanoid.LastHurtPart
		if v then info.lastHurtPart = v.Name end
	end)
	return info
end

--// Các pattern/hàm scan vật thể quanh điểm chết (tham khảo)
local function matchesCandidate(name)
	if not name then return false end
	local lower = name:lower()
	for _, p in ipairs(CANDIDATE_PATTERNS) do
		if lower:find(p:lower(), 1, true) then return true end
	end
	return false
end

local function describeObject(obj)
	local kind = nil
	local name = nil
	local rootPos = nil
	pcall(function()
		kind = obj:IsA("BasePart") and "Part" or obj.ClassName
		name = obj.Name
	end)
	if obj:IsA("BasePart") then
		rootPos = obj.Position
	elseif obj:IsA("Model") then
		local p = obj.PrimaryPart
		if p and p:IsA("BasePart") then
			rootPos = p.Position
		else
			for _, c in ipairs(obj:GetChildren()) do
				if c:IsA("BasePart") then rootPos = c.Position; break end
			end
		end
	end
	return name, kind, rootPos
end

local function scanCandidates(deathPos)
	local Workspace = game:GetService("Workspace")
	local hits = {}
	for _, child in ipairs(Workspace:GetChildren()) do
		if not child:IsA("Folder") and matchesCandidate(child.Name) then
			local name, kind, pos = describeObject(child)
			if pos then
				table.insert(hits, { name = name, kind = kind, dist = (pos - deathPos).Magnitude, lvl = 0 })
			end
		end
	end
	table.sort(hits, function(a, b) return a.dist < b.dist end)
	return hits
end

local function formatRecord(deathTime, rec)
	local amount = rec.amount or 0
	local ago = deathTime - (rec.time or deathTime)
	local dist = rec.dist and string.format("dist=%.1f", rec.dist) or "dist=?"
	local healthAfter = rec.healthAfter and string.format("remaining=%.1f", rec.healthAfter) or "remaining=?"
	return string.format("[DEATH-LOG]   | %-8.1f HP | %7.2fs before death | %s | %s | %s",
		amount, ago, dist, healthAfter, describeSource(rec.source))
end

local function logDeath(deathPos, humanoid)
	if not enabled then return end
	local deathTime = os.clock()

	print("[DEATH-LOG] ========================================")
	print("[DEATH-LOG] PLAYER DIED")
	print("[DEATH-LOG]   position: " .. tostring(deathPos))

	--// 1) Engine props: nguồn chính xác nhất nếu server tự đè Health
	local info = engineKillerInfo(humanoid)
	print("[DEATH-LOG] engine killsource:")
	print("[DEATH-LOG]   lastHurtPart      = " .. tostring(info.lastHurtPart or "none"))
	print("[DEATH-LOG]   lastHurtByHumanoid = " .. tostring(info.lastHurtByHumanoid or "none"))
	print("[DEATH-LOG]   lastCombatant     = " .. tostring(info.lastCombatant or "none"))

	--// 2) Hook records: killing blow
	local lastRec = damageRecords[#damageRecords]
	local hasRecent = lastRec and (deathTime - lastRec.time) <= KILL_WINDOW
	if hasRecent then
		print("[DEATH-LOG] >> KILLING BLOW (last TakeDamage within " .. KILL_WINDOW .. "s):")
		print("[DEATH-LOG]    " .. formatRecord(deathTime, lastRec))
	elseif #damageRecords > 0 then
		print("[DEATH-LOG] >> No TakeDamage hit within " .. KILL_WINDOW
			.. "s of death -> có thể do fall / killplane / damage do server đặt trực tiếp Health"
			.. " (xem engine killsource bên trên).")
	else
		print("[DEATH-LOG] >> No TakeDamage records captured (game không damage qua client).")
	end

	--// Liệt kê 3 hit gần nhất (để thấy chuỗi damage trước khi chết)
	local count = math.min(#damageRecords, 3)
	if count > 0 then
		print("[DEATH-LOG] last " .. count .. " damage hits:")
		for i = #damageRecords - count + 1, #damageRecords do
			print(formatRecord(deathTime, damageRecords[i]))
		end
	end

	--// 3) Tham khảo hazard quanh điểm chết (ưu tiên thấp)
	local hits = scanCandidates(deathPos)
	local inRange = {}
	for _, h in ipairs(hits) do
		if h.dist <= LOG_RADIUS then table.insert(inRange, h) end
	end
	local n = math.min(#inRange, TOP_N)
	if n > 0 then
		print("[DEATH-LOG] reference hazard near death (khoảng " .. LOG_RADIUS .. " stud):")
		for i = 1, n do
			local h = inRange[i]
			print(string.format("[DEATH-LOG]   %d) %-40s %-10s dist=%.1f", i, h.name, h.kind, h.dist))
		end
	end
	print("[DEATH-LOG] ========================================")
end

function deathLog.Init()
	installTakeDamageHook()

	local function bindCharacter(character)
		if not character or not character.Parent then return end
		local hum = character:FindFirstChildOfClass("Humanoid")
		if not hum then
			task.spawn(function()
				local h = character:WaitForChild("Humanoid", 10)
				if h then bindCharacter(character) end
			end)
			return
		end
		if diedConnection then
			pcall(function() diedConnection:Disconnect() end)
			diedConnection = nil
		end
		diedConnection = hum.Died:Connect(function()
			local root = character:FindFirstChild("HumanoidRootPart")
			logDeath(root and root.Position or Vector3.zero, hum)
		end)
	end

	if player then
		local initial = player.Character
		if initial then
			bindCharacter(initial)
		end
		player.CharacterAdded:Connect(bindCharacter)
	end
end

function deathLog.Toggle(state)
	enabled = state == true
	if enabled then
		installTakeDamageHook()
	end
end

function deathLog.IsEnabled()
	return enabled
end

return deathLog end function __DIST.n()-- Catalog map + độ khó cho DungeonQuest, dựa trên module chooseDungeon của game.
-- Map thường: fetch động qua remote getDungeonStats (có cache).
-- Map đặc biệt (Egg Island, Krampus, Tutorial): override tĩnh đúng như game gốc.

--// Data

local DIFFICULTIES = { "Easy", "Medium", "Hard", "Insane", "Nightmare" }

local DUNGEONS = {
	"Desert Temple",
	"Winter Outpost",
	"Pirate Island",
	"King's Castle",
	"The Underworld",
	"Samurai Palace",
	"The Canals",
	"Ghastly Harbor",
	"Steampunk Sewers",
	"Orbital Outpost",
	"Volcanic Chambers",
	"Aquatic Temple",
	"Enchanted Forest",
	"Egg Island",
	"Krampus",
	"Tutorial Dungeon",
}

local SPECIAL_DUNGEONS = {
	["Egg Island"] = { Difficulties = { "Easy", "Nightmare" }, LevelReq = 0 },
	["Krampus"] = { Difficulties = { "Nightmare" }, LevelReq = 195 },
	["Tutorial Dungeon"] = { Difficulties = { "Easy" }, LevelReq = 0 },
}

--// Table
local dungeonCatalog = {}

--// Cache
local statsCache = {}
local dynamicDungeons = nil

--// Persisted map list (lưu list đã lấy từ lobby UI để dùng tiếp khi ở trong map)
local HttpService = game:GetService("HttpService")
local MAP_LIST_CACHE_FILE = "Maclib/DungeonQuest_MapList.json"

local function persistMapList(list)
	if not (isfile and writefile and makefolder and isfolder) then return end
	pcall(function()
		if not isfolder("Maclib") then makefolder("Maclib") end
	end)
	pcall(function()
		writefile(MAP_LIST_CACHE_FILE, HttpService:JSONEncode(list))
	end)
end

local function loadPersistedMapList()
	if not (isfile and readfile) or not isfile(MAP_LIST_CACHE_FILE) then return nil end
	local ok, data = pcall(function()
		return HttpService:JSONDecode(readfile(MAP_LIST_CACHE_FILE))
	end)
	if not ok or typeof(data) ~= "table" then return nil end

	local list = {}
	for _, name in ipairs(data) do
		if type(name) == "string" and #name > 0 then
			table.insert(list, name)
		end
	end
	return (#list > 0) and list or nil
end

local function mergeDungeonLists(primary)
	local seen = {}
	local merged = {}
	for _, name in ipairs(primary or {}) do
		if not seen[name] then
			seen[name] = true
			table.insert(merged, name)
		end
	end
	for _, name in ipairs(DUNGEONS) do
		if not seen[name] then
			seen[name] = true
			table.insert(merged, name)
		end
	end
	return merged
end

--// Helpers
local function findScrollingFrame()
	local player = game:GetService("Players").LocalPlayer
	if not player then return nil end
	local playerGui = player:FindFirstChild("PlayerGui")
	if not playerGui then return nil end
	local queueGui = playerGui:FindFirstChild("queueGui")
	if not queueGui then return nil end
	local chooseDungeon = queueGui:FindFirstChild("chooseDungeon")
	if not chooseDungeon then return nil end
	local backgroundFillLeft = chooseDungeon:FindFirstChild("backgroundFillLeft")
	if not backgroundFillLeft then return nil end
	return backgroundFillLeft:FindFirstChild("ScrollingFrame")
end

local function collectDungeonsFromUi()
	local scrollingFrame = findScrollingFrame()
	if not scrollingFrame then return nil end

	local list = {}
	for _, child in ipairs(scrollingFrame:GetChildren()) do
		if child:IsA("ImageLabel") and #child.Name > 0 then
			table.insert(list, child.Name)
		end
	end
	return (#list > 0) and list or nil
end

--// Methods
function dungeonCatalog.GetDungeons()
	if dynamicDungeons then return dynamicDungeons end

	local uiList = collectDungeonsFromUi()
	if uiList then
		local merged = mergeDungeonLists(uiList)
		dynamicDungeons = merged
		persistMapList(merged)
		return merged
	end

	local persisted = loadPersistedMapList()
	if persisted then
		local merged = mergeDungeonLists(persisted)
		dynamicDungeons = merged
		return merged
	end

	return DUNGEONS
end

function dungeonCatalog.RefreshDungeons()
	dynamicDungeons = nil
	return dungeonCatalog.GetDungeons()
end

function dungeonCatalog.GetDungeonStats(name)
	if type(name) ~= "string" or #name == 0 then return nil end
	if statsCache[name] ~= nil then return statsCache[name] end

	local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("remotes")
	local getStats = remotes and remotes:FindFirstChild("getDungeonStats")
	if not getStats then return nil end

	local ok, result = pcall(function() return getStats:InvokeServer(name) end)
	if ok and typeof(result) == "table" then
		statsCache[name] = result
		return result
	end
	return nil
end

function dungeonCatalog.GetAllowedDifficulties(name)
	if type(name) ~= "string" then return DIFFICULTIES end

	local special = SPECIAL_DUNGEONS[name]
	if special then return special.Difficulties end

	local stats = dungeonCatalog.GetDungeonStats(name)
	local allowed = {}
	if stats then
		for _, difficulty in ipairs(DIFFICULTIES) do
			if stats[difficulty] then table.insert(allowed, difficulty) end
		end
	end
	if #allowed > 0 then return allowed end
	return DIFFICULTIES
end

function dungeonCatalog.IsDifficultyAllowed(name, difficulty)
	if type(difficulty) ~= "string" then return false end
	for _, option in ipairs(dungeonCatalog.GetAllowedDifficulties(name)) do
		if option == difficulty then return true end
	end
	return false
end

function dungeonCatalog.GetLevelReq(name, difficulty)
	if type(name) ~= "string" then return 0 end

	local special = SPECIAL_DUNGEONS[name]
	if special then return special.LevelReq or 0 end

	local stats = dungeonCatalog.GetDungeonStats(name)
	if stats and type(difficulty) == "string" and stats[difficulty] then
		return tonumber(stats[difficulty].levelReq) or 0
	end
	return 0
end

--// Table
dungeonCatalog.DUNGEONS = DUNGEONS
dungeonCatalog.DIFFICULTIES = DIFFICULTIES

return dungeonCatalog end function __DIST.o()-- Contextual Auto-Farm settings cho DungeonQuest.
-- Cho phép cấu hình riêng nhóm Auto Farm (Farm Mode, sliders orbit/hover/tele,
-- retarget, maintain-height) theo DUNGEON x LOẠI MỤC TIÊU (Quái thường / Boss 1/2/3).
-- Giá trị lưu per-context trong JSON (Maclib/DungeonQuest_ContextCombat.json).
-- Khi 1 context chưa có override thì fallback về giá trị global hiện tại (shared).

--// Imports

local shared = __DIST.load('d')
local notifier = __DIST.load('b')
local macLib = __DIST.load('a')
local autoSave = __DIST.load('f')
local dungeonCatalog = __DIST.load('n')

--// Table
local contextual = {}

--// Metadata field -> get/set trên shared (Auto Farm group)
local FIELD_DEFS = {
	FarmMode = { get = function() return shared.GetFarmMode() end, set = function(v) shared.SetFarmMode(v) end },
	OrbitRadius = { get = function() return shared.GetOrbitRadius() end, set = function(v) shared.SetOrbitRadius(v) end },
	OrbitSpeed = { get = function() return shared.GetOrbitSpeed() end, set = function(v) shared.SetOrbitSpeed(v) end },
	OrbitTeleStep = { get = function() return shared.GetOrbitTeleStep() end, set = function(v) shared.SetOrbitTeleStep(v) end },
	OrbitHeight = { get = function() return shared.GetOrbitHeight() end, set = function(v) shared.SetOrbitHeight(v) end },
	HoverHeight = { get = function() return shared.GetHoverHeight() end, set = function(v) shared.SetHoverHeight(v) end },
	TeleportDistance = { get = function() return shared.GetFarmEngageDistance() end, set = function(v) shared.SetFarmEngageDistance(v) end },
	AutoRetarget = { get = function() return shared.GetRetargetEnabled() end, set = function(v) shared.SetRetargetEnabled(v) end },
	RetargetMethod = { get = function() return shared.GetRetargetMethod() end, set = function(v) shared.SetRetargetMethod(v) end },
	RetargetMode = { get = function() return shared.GetRetargetMode() end, set = function(v) shared.SetRetargetMode(v) end },
	ReverseOrbitOnRetarget = { get = function() return shared.GetOrbitReverseEnabled() end, set = function(v) shared.SetOrbitReverseEnabled(v) end },
	MaintainBossHeight = { get = function() return shared.GetMaintainBossHeight() end, set = function(v) shared.SetMaintainBossHeight(v) end },
}

local DISPLAY_TO_KEY = {
	["Normal"] = "Mob",
	["Boss 1"] = "Boss1",
	["Boss 2"] = "Boss2",
	["Boss 3"] = "Boss3",
}
local KEY_TO_DISPLAY = {
	["Mob"] = "Normal",
	["Boss1"] = "Boss 1",
	["Boss2"] = "Boss 2",
	["Boss3"] = "Boss 3",
}

--// Storage: data[dungeon][target][field] = value
--// Sống trong config đang chọn (nhúng vào file config .json qua MacLib.contextData)
local data = {}
local lastDataRef = nil
local activeConfig = nil
local configChangedCallback = nil

--// Cho phép tab đăng ký callback khi đổi config (để làm mới UI context)
function contextual.OnConfigChanged(cb)
	configChangedCallback = cb
end

--// Nạp dữ liệu từ config đang chọn. Trả về true nếu vừa đổi config / đổi data context.
function contextual.ReloadFromConfig()
	local macData = macLib.contextData or {}
	local newActive = autoSave.GetActive()

	local configChanged = newActive ~= activeConfig
	--// MacLib:LoadConfig tạo bảng contextData MỚI -> phát hiện khi data vừa được nạp (kể cả
	--// khi tên config không đổi, vd autoload) để refresh UI + re-apply context.
	local dataChanged = macData ~= lastDataRef

	data = macData
	lastDataRef = macData
	activeConfig = newActive

	if (configChanged or dataChanged) and configChangedCallback then
		pcall(configChangedCallback, newActive)
	end
	return configChanged or dataChanged
end

--// Đồng bộ dữ liệu lên MacLib để mỗi lần save config là lưu kèm contextData
local function bindMacLib()
	macLib.contextData = data
end

--// Lưu dữ liệu vào config đang chọn
local function persist()
	bindMacLib()
	autoSave.SaveNow()
end

--// Đảm bảo context có đầy đủ tất cả field (điền mặc định = global fallback nếu thiếu)
--// Trả về true nếu có field được khởi tạo mới.
local function ensureContextComplete(dungeon, targetKey)
	if not (dungeon and type(dungeon) == "string" and #dungeon > 0) then return end
	if not KEY_TO_DISPLAY[targetKey] then return end

	data[dungeon] = data[dungeon] or {}
	data[dungeon][targetKey] = data[dungeon][targetKey] or {}
	local ctx = data[dungeon][targetKey]

	local changed = false
	for f in pairs(FIELD_DEFS) do
		if ctx[f] == nil then
			ctx[f] = FIELD_DEFS[f].get()
			changed = true
		end
	end
	return changed
end

--// Tự khởi tạo context base cho TOÀN BỘ map x target khi khởi tạo script.
--// Đảm bảo mọi dungeon trong catalog đều có sẵn đủ 12 field (= giá trị global hiện tại)
--// thay vì chỉ tạo khi người dùng bắt đầu chỉnh sửa. Không ghi đè override đã lưu.
function contextual.SeedAllDefaults()
	local targets = { "Mob", "Boss1", "Boss2", "Boss3" }
	local seededAny = false
	for _, dungeon in ipairs(dungeonCatalog.GetDungeons()) do
		for _, targetKey in ipairs(targets) do
			if ensureContextComplete(dungeon, targetKey) then
				seededAny = true
			end
		end
	end
	if seededAny then
		persist()
	end
	return seededAny
end

--// Ghi override cho context cụ thể (context luôn đầy đủ 12 field)
function contextual.SetField(dungeon, targetKey, field, value)
	if not (dungeon and type(dungeon) == "string" and #dungeon > 0) then return end
	if not KEY_TO_DISPLAY[targetKey] then return end
	if not FIELD_DEFS[field] then return end

	ensureContextComplete(dungeon, targetKey)
	data[dungeon][targetKey][field] = value
	persist()
end

--// Xóa hết override của 1 context (về global)
function contextual.ClearContext(dungeon, targetKey)
	if type(dungeon) ~= "string" or #dungeon == 0 then return end
	if data[dungeon] and data[dungeon][targetKey] then
		data[dungeon][targetKey] = nil
		if next(data[dungeon]) == nil then data[dungeon] = nil end
		persist()
	end
end

--// Đọc giá trị 1 field CỦA context (override nếu có, ngược lại global hiện tại)
function contextual.GetField(dungeon, targetKey, field)
	local def = FIELD_DEFS[field]
	if not def then return nil end
	--// Ngoài dungeon (tên nil/rỗng) -> không có context -> dùng global hiện tại
	if type(dungeon) == "string" and #dungeon > 0 then
		local ctx = data[dungeon] and data[dungeon][targetKey]
		if ctx and ctx[field] ~= nil then return ctx[field] end
	end
	return def.get()
end

--// Đọc BỘ giá trị của 1 context (đã fallback global)
function contextual.GetContext(dungeon, targetKey)
	local out = {}
	for field in pairs(FIELD_DEFS) do
		out[field] = contextual.GetField(dungeon, targetKey, field)
	end
	return out
end

--// Áp bộ giá trị của 1 context vào shared (để farm dùng)
function contextual.ApplyContext(dungeon, targetKey)
	local ctx = contextual.GetContext(dungeon, targetKey)
	for field, def in pairs(FIELD_DEFS) do
		def.set(ctx[field])
	end
end

--// Áp context HIỆN TẠI (dungeon đang chơi + mục tiêu đang farm) lên shared.
function contextual.ApplyCurrent()
	local dungeon = shared.GetCurrentDungeonName()
	local targetKey = shared.GetCombatTargetKey()
	contextual.ApplyContext(dungeon, targetKey)
	return dungeon, targetKey
end

--// Metadata
function contextual.GetFields()
	local out = {}
	for field in pairs(FIELD_DEFS) do table.insert(out, field) end
	return out
end

function contextual.GetTargets()
	local out = {}
	for _, key in ipairs({ "Mob", "Boss1", "Boss2", "Boss3" }) do
		table.insert(out, { Key = key, Display = KEY_TO_DISPLAY[key] })
	end
	return out
end

function contextual.GetDisplayForTarget(key)
	return KEY_TO_DISPLAY[key]
end

--// Auto-switch watcher: lắng nghe dungeon/boss đổi -> áp context hiện tại + thông báo.
local lastApplied = nil
local lastDungeon = nil
local function findAndApply(force)
	local dungeon = shared.GetCurrentDungeonName()
	local targetKey = shared.GetCombatTargetKey()

	--// Rời dungeon hoặc chưa vào -> reset cache để lần vào lại được áp dụng lại context
	if not dungeon then
		lastDungeon = nil
		lastApplied = nil
		return
	end

	--// Đảm bảo áp lại khi cùng dungeon cùng target (vd vừa vào lại dungeon)
	if not force and dungeon == lastDungeon and targetKey == lastApplied then return end

	contextual.ApplyContext(dungeon, targetKey)

	if targetKey ~= "Mob" then
		notifier.Notify("Auto Farm Context", dungeon .. " - " .. KEY_TO_DISPLAY[targetKey], 2)
	end
	lastApplied = targetKey
	lastDungeon = dungeon
end

function contextual.Init()
	contextual.ReloadFromConfig()
	contextual.SeedAllDefaults()
	bindMacLib()

	shared.OnDungeonNameChanged(function() findAndApply(false) end)
	shared.OnBossIndexChanged(function() findAndApply(false) end)
	shared.OnBossActiveChanged(function() findAndApply(false) end)

	task.spawn(function()
		while true do
			task.wait(0.5)
			--// Đổi config -> nạp lại dữ liệu context của config mới (+ re-apply)
			if contextual.ReloadFromConfig() then
				findAndApply(true)
			end
			findAndApply(false)
		end
	end)
end

return contextual
end function __DIST.p()-- Tab Auto Farm (DungeonQuest): Farm, Combat, Auto Start/Retry.

--// Imports

local macLib = __DIST.load('a')
local shared = __DIST.load('d')
local ui = __DIST.load('e')
local combat = __DIST.load('i')
local farm = __DIST.load('g')
local autoStart = __DIST.load('j')
local autoRetry = __DIST.load('k')
local autoSave = __DIST.load('f')
local basicOrbitDodge = __DIST.load('l')
local deathLog = __DIST.load('m')
local contextual = __DIST.load('o')

return function(window, tab)
	--// Sections
	local farmSection = tab:Section({ Side = "Left" })
	local combatSection = tab:Section({ Side = "Right" })
	local startSection = tab:Section({ Side = "Left" })

	farmSection:Header({ Name = "Auto Farm" })
	combatSection:Header({ Name = "Combat" })
	startSection:Header({ Name = "Auto Start Game" })

	--// Farm (nhóm Auto Farm: per-context theo dungeon x target)
	local autoFarmToggle = farmSection:Toggle({
		Name = "Auto Farm",
		Default = shared.IsFarmEnabled(),
		Callback = autoSave.Wrap(function(state)
			farm.Toggle(state)
		end),
	}, "Toggle_AutoFarm")

	--// Auto Farm Context (per dungeon x per mob/boss)
	farmSection:Header({ Name = "Auto Farm Context" })

	local activeCtxLabel = farmSection:Label({ Text = "" })
	local function updateActiveCtxLabel()
		local dungeon = shared.GetCurrentDungeonName()
		local targetKey = shared.GetCombatTargetKey()
		activeCtxLabel:UpdateName("Active: <font color='rgb(120,200,255)'>" .. (dungeon or "Not in dungeon") .. "</font> / " .. contextual.GetDisplayForTarget(targetKey))
	end

	local editDungeon = shared.GetCurrentDungeonName()
	local editTarget = "Mob"

	local isSyncing = false
	local applyFarmModeVisibility
	local refreshContextControls
	local setEditControlsVisible
	local editCtxLabel
	local farmModeDropdown
	local orbitRadiusSlider
	local orbitSpeedSlider
	local orbitTeleStepSlider
	local orbitHeightSlider
	local maintainBossHeightToggle
	local hoverHeightSlider
	local teleportDistanceSlider
	local autoRetargetToggle
	local retargetMethodDropdown
	local retargetModeDropdown
	local reverseOrbitToggle
	local resetCtxButton

	local function isActiveContext()
		return editDungeon == shared.GetCurrentDungeonName() and editTarget == shared.GetCombatTargetKey()
	end

	local editTargetDropdown = farmSection:Dropdown({
		Name = "Edit Target",
		Options = { "Normal", "Boss 1", "Boss 2", "Boss 3" },
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			local map = { ["Normal"] = "Mob", ["Boss 1"] = "Boss1", ["Boss 2"] = "Boss2", ["Boss 3"] = "Boss3" }
			editTarget = map[option] or "Mob"
			refreshContextControls()
		end),
	}, "Dropdown_FarmTarget")

	--// Nút Reset dễ ấn nhầm, đổi sang cơ chế 2 bước: click lần 1 -> arm "Confirm?",
	--// click lần 2 trong thời hạn -> mới thực sự reset. Tự disarm sau ARM_TIMEOUT
	--// hoặc khi đổi context.
	local resetArmed = false
	local resetDisarmTimer = nil
	local RESET_NAME = "Reset Context to Global"
	local RESET_CONFIRM_NAME = "<font color='rgb(255,80,80)'>Confirm Reset?</font>"
	local RESET_TIMEOUT = 3
	local function disarmReset()
		if not resetArmed then return end
		resetArmed = false
		if resetDisarmTimer then task.cancel(resetDisarmTimer); resetDisarmTimer = nil end
		pcall(function() resetCtxButton:UpdateName(RESET_NAME) end)
	end

	resetCtxButton = farmSection:Button({
		Name = RESET_NAME,
		Callback = autoSave.Wrap(function()
			if not resetArmed then
				resetArmed = true
				if resetDisarmTimer then task.cancel(resetDisarmTimer) end
				resetDisarmTimer = task.delay(RESET_TIMEOUT, disarmReset)
				pcall(function() resetCtxButton:UpdateName(RESET_CONFIRM_NAME) end)
				return
			end
			disarmReset()
			contextual.ClearContext(editDungeon, editTarget)
			refreshContextControls()
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	})

	editCtxLabel = farmSection:Label({ Text = "" })

	farmModeDropdown = farmSection:Dropdown({
		Name = "Farm Mode",
		Options = { "Orbit", "Orbit Tele", "Hover" },
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			if not option or isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "FarmMode", option)
			applyFarmModeVisibility()
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Dropdown_FarmMode")

	orbitRadiusSlider = farmSection:Slider({
		Name = "Orbit Radius",
		Default = contextual.GetField(editDungeon, editTarget, "OrbitRadius"),
		Minimum = 5,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "OrbitRadius", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_OrbitRadius")

	orbitSpeedSlider = farmSection:Slider({
		Name = "Orbit Speed",
		Default = contextual.GetField(editDungeon, editTarget, "OrbitSpeed"),
		Minimum = 24,
		Maximum = 96,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "OrbitSpeed", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_OrbitSpeed")

	orbitTeleStepSlider = farmSection:Slider({
		Name = "Orbit Tele Step",
		Default = contextual.GetField(editDungeon, editTarget, "OrbitTeleStep"),
		Minimum = 5,
		Maximum = 90,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "OrbitTeleStep", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_OrbitTeleStep")

	orbitHeightSlider = farmSection:Slider({
		Name = "Orbit Height",
		Default = contextual.GetField(editDungeon, editTarget, "OrbitHeight"),
		Minimum = 0,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "OrbitHeight", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_OrbitHeight")

	maintainBossHeightToggle = farmSection:Toggle({
		Name = "Maintain Orbit Height on Boss",
		Default = contextual.GetField(editDungeon, editTarget, "MaintainBossHeight"),
		Callback = autoSave.Wrap(function(state)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "MaintainBossHeight", state)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Toggle_MaintainBossHeight")

	hoverHeightSlider = farmSection:Slider({
		Name = "Hover Height",
		Default = contextual.GetField(editDungeon, editTarget, "HoverHeight"),
		Minimum = 0,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "HoverHeight", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_HoverHeight")

	teleportDistanceSlider = farmSection:Slider({
		Name = "Teleport Distance",
		Default = contextual.GetField(editDungeon, editTarget, "TeleportDistance"),
		Minimum = 5,
		Maximum = 300,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "TeleportDistance", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_TeleportDistance")

	autoRetargetToggle = farmSection:Toggle({
		Name = "Auto Retarget",
		Default = contextual.GetField(editDungeon, editTarget, "AutoRetarget"),
		Callback = autoSave.Wrap(function(state)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "AutoRetarget", state)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Toggle_Retarget")

	retargetMethodDropdown = farmSection:Dropdown({
		Name = "Retarget Method",
		Options = { "Auto", "Tele", "Tween" },
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			if not option or isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "RetargetMethod", option)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Dropdown_RetargetMethod")

	retargetModeDropdown = farmSection:Dropdown({
		Name = "Retarget Mode",
		Options = { "Nearest", "Farthest" },
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			if not option or isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "RetargetMode", option)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Dropdown_RetargetMode")

	reverseOrbitToggle = farmSection:Toggle({
		Name = "Reverse Orbit on Retarget",
		Default = contextual.GetField(editDungeon, editTarget, "ReverseOrbitOnRetarget"),
		Callback = autoSave.Wrap(function(state)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "ReverseOrbitOnRetarget", state)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Toggle_OrbitReverse")

	applyFarmModeVisibility = function()
		local mode = contextual.GetField(editDungeon, editTarget, "FarmMode")
		local isOrbit = mode == "Orbit"
		local isOrbitTele = mode == "Orbit Tele"
		local isOrbitLike = isOrbit or isOrbitTele
		pcall(function() orbitRadiusSlider:SetVisibility(isOrbitLike) end)
		pcall(function() orbitSpeedSlider:SetVisibility(isOrbit) end)
		pcall(function() orbitTeleStepSlider:SetVisibility(isOrbitTele) end)
		pcall(function() orbitHeightSlider:SetVisibility(isOrbitLike) end)
		pcall(function() hoverHeightSlider:SetVisibility(not isOrbitLike) end)
	end

	refreshContextControls = function()
		isSyncing = true
		disarmReset()
		pcall(function() farmModeDropdown:UpdateSelection(contextual.GetField(editDungeon, editTarget, "FarmMode")) end)
		pcall(function() orbitRadiusSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "OrbitRadius")) end)
		pcall(function() orbitSpeedSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "OrbitSpeed")) end)
		pcall(function() orbitTeleStepSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "OrbitTeleStep")) end)
		pcall(function() orbitHeightSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "OrbitHeight")) end)
		pcall(function() maintainBossHeightToggle:UpdateState(contextual.GetField(editDungeon, editTarget, "MaintainBossHeight")) end)
		pcall(function() hoverHeightSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "HoverHeight")) end)
		pcall(function() teleportDistanceSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "TeleportDistance")) end)
		pcall(function() autoRetargetToggle:UpdateState(contextual.GetField(editDungeon, editTarget, "AutoRetarget")) end)
		pcall(function() retargetMethodDropdown:UpdateSelection(contextual.GetField(editDungeon, editTarget, "RetargetMethod")) end)
		pcall(function() retargetModeDropdown:UpdateSelection(contextual.GetField(editDungeon, editTarget, "RetargetMode")) end)
		pcall(function() reverseOrbitToggle:UpdateState(contextual.GetField(editDungeon, editTarget, "ReverseOrbitOnRetarget")) end)
		isSyncing = false
		pcall(function() editCtxLabel:UpdateName("Editing: <font color='rgb(150,255,150)'>" .. (editDungeon or "Not in dungeon") .. "</font> / " .. contextual.GetDisplayForTarget(editTarget)) end)
		applyFarmModeVisibility()
	end

	setEditControlsVisible = function(visible)
		pcall(function() farmModeDropdown:SetVisibility(visible) end)
		pcall(function() orbitRadiusSlider:SetVisibility(visible) end)
		pcall(function() orbitSpeedSlider:SetVisibility(visible) end)
		pcall(function() orbitTeleStepSlider:SetVisibility(visible) end)
		pcall(function() orbitHeightSlider:SetVisibility(visible) end)
		pcall(function() maintainBossHeightToggle:SetVisibility(visible) end)
		pcall(function() hoverHeightSlider:SetVisibility(visible) end)
		pcall(function() teleportDistanceSlider:SetVisibility(visible) end)
		pcall(function() autoRetargetToggle:SetVisibility(visible) end)
		pcall(function() retargetMethodDropdown:SetVisibility(visible) end)
		pcall(function() retargetModeDropdown:SetVisibility(visible) end)
		pcall(function() reverseOrbitToggle:SetVisibility(visible) end)
		pcall(function() resetCtxButton:SetVisibility(visible) end)
		if visible then applyFarmModeVisibility() end
	end

	--// Mỗi lần load vào màn chơi (dungeon mới): Edit Target về "Normal" + re-sync Auto Farm
	local function resetToMob()
		editTarget = "Mob"
		pcall(function() editTargetDropdown:UpdateSelection("Normal") end)
		pcall(function() autoFarmToggle:UpdateState(shared.IsFarmEnabled()) end)
		refreshContextControls()
	end

	local prevDungeonInGame = editDungeon ~= nil
	local function onDungeonChanged()
		local newName = shared.GetCurrentDungeonName()
		local nowInGame = newName ~= nil
		editDungeon = newName
		if nowInGame and not prevDungeonInGame then
			resetToMob()
		end
		prevDungeonInGame = nowInGame
		updateActiveCtxLabel()
		refreshContextControls()
		setEditControlsVisible(nowInGame)
	end
	shared.OnDungeonNameChanged(onDungeonChanged)
	shared.OnBossIndexChanged(updateActiveCtxLabel)
	shared.OnBossActiveChanged(updateActiveCtxLabel)
	contextual.OnConfigChanged(function()
		editDungeon = shared.GetCurrentDungeonName()
		updateActiveCtxLabel()
		refreshContextControls()
		setEditControlsVisible(editDungeon ~= nil)
	end)

	updateActiveCtxLabel()
	refreshContextControls()
	setEditControlsVisible(editDungeon ~= nil)

	--// Combat
	combatSection:Header({ Name = "Skill" })

	local applySkillModeVisibility
	combatSection:Toggle({
		Name = "Auto Skill (Q + E)",
		Default = shared.IsAutoSkillEnabled(),
		Callback = autoSave.Wrap(function(state)
			combat.ToggleAutoSkill(state)
		end),
	}, "Toggle_AutoSkill")

	combatSection:Dropdown({
		Name = "Auto Skill Mode",
		Options = { "Spam", "Target Only" },
		Default = (shared.GetAutoSkillMode() == "Target Only" and 2) or 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			if option then shared.SetAutoSkillMode(option) end
			applySkillModeVisibility()
		end),
	}, "Dropdown_AutoSkillMode")

	local skillRangeSlider = ui.PatchSliderLoadCallback(combatSection:Slider({
		Name = "Skill Range",
		Default = shared.GetSkillRange(),
		Minimum = 5,
		Maximum = 200,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			shared.SetSkillRange(Value)
		end),
	}, "Slider_SkillRange"))

	ui.PatchSliderLoadCallback(combatSection:Slider({
		Name = "Skill Interval",
		Default = shared.GetSkillInterval(),
		Minimum = 0.1,
		Maximum = 10,
		DisplayMethod = "Round",
		Precision = 1,
		Suffix = "s",
		Callback = autoSave.Wrap(function(Value)
			shared.SetSkillInterval(Value)
		end),
	}, "Slider_SkillInterval"))

	applySkillModeVisibility = function()
		local targetOnly = shared.GetAutoSkillMode() == "Target Only"
		pcall(function() skillRangeSlider:SetVisibility(targetOnly) end)
	end
	applySkillModeVisibility()

	combatSection:Toggle({
		Name = "Basic Orbit Dodge",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			basicOrbitDodge.Toggle(state)
		end),
	}, "Toggle_BasicOrbitDodge")

	local dodgeModeDropdown = combatSection:Dropdown({
		Name = "Dodge Mode",
		Options = { "All", "Boss Only" },
		Default = (basicOrbitDodge.GetMode() == "Boss" and 2) or 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			if option == "Boss Only" then
				basicOrbitDodge.SetMode("Boss")
			else
				basicOrbitDodge.SetMode("All")
			end
		end),
	}, "Dropdown_DodgeMode")

	local detectRadiusSlider = ui.PatchSliderLoadCallback(combatSection:Slider({
		Name = "Dodge Detect Radius",
		Default = basicOrbitDodge.GetDetectRadius(),
		Minimum = 5,
		Maximum = 50,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			basicOrbitDodge.SetDetectRadius(Value)
		end),
	}, "Slider_BasicDetectRadius"))

	local dangerMarginSlider = ui.PatchSliderLoadCallback(combatSection:Slider({
		Name = "Dodge Danger Margin",
		Default = basicOrbitDodge.GetDangerRadius(),
		Minimum = 1,
		Maximum = 15,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			basicOrbitDodge.SetDangerRadius(Value)
		end),
	}, "Slider_BasicDangerMargin"))

	local panicRadiusSlider = ui.PatchSliderLoadCallback(combatSection:Slider({
		Name = "Panic Radius",
		Default = basicOrbitDodge.GetPanicRadius(),
		Minimum = 3,
		Maximum = 30,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			basicOrbitDodge.SetPanicRadius(Value)
		end),
	}, "Slider_BasicPanicRadius"))

	local panicCooldownSlider = ui.PatchSliderLoadCallback(combatSection:Slider({
		Name = "Panic Cooldown",
		Default = basicOrbitDodge.GetPanicCooldown(),
		Minimum = 0.05,
		Maximum = 1,
		DisplayMethod = "Round",
		Precision = 2,
		Suffix = "s",
		Callback = autoSave.Wrap(function(Value)
			basicOrbitDodge.SetPanicCooldown(Value)
		end),
	}, "Slider_BasicPanicCooldown"))

	local flipCooldownSlider = ui.PatchSliderLoadCallback(combatSection:Slider({
		Name = "Dodge Flip Cooldown",
		Default = basicOrbitDodge.GetFlipCooldown(),
		Minimum = 0.05,
		Maximum = 1,
		DisplayMethod = "Round",
		Precision = 2,
		Suffix = "s",
		Callback = autoSave.Wrap(function(Value)
			basicOrbitDodge.SetFlipCooldown(Value)
		end),
	}, "Slider_BasicFlipCooldown"))

	local jumpCooldownSlider = ui.PatchSliderLoadCallback(combatSection:Slider({
		Name = "Dodge Jump Cooldown",
		Default = basicOrbitDodge.GetJumpCooldown(),
		Minimum = 0.1,
		Maximum = 2,
		DisplayMethod = "Round",
		Precision = 2,
		Suffix = "s",
		Callback = autoSave.Wrap(function(Value)
			basicOrbitDodge.SetJumpCooldown(Value)
		end),
	}, "Slider_BasicJumpCooldown"))

	combatSection:Dropdown({
		Name = "Dodge Preset",
		Options = basicOrbitDodge.GetPresetNames(),
		Default = (function()
			local names = basicOrbitDodge.GetPresetNames()
			local cur = basicOrbitDodge.GetPreset()
			for i, n in ipairs(names) do
				if n == cur then return i end
			end
			return 1
		end)(),
		Required = true,
		Callback = autoSave.Wrap(function(option)
			basicOrbitDodge.ApplyPreset(option)
			pcall(function() dodgeModeDropdown:UpdateSelection(basicOrbitDodge.GetMode() == "Boss" and "Boss Only" or "All") end)
			pcall(function() detectRadiusSlider:UpdateValue(basicOrbitDodge.GetDetectRadius()) end)
			pcall(function() dangerMarginSlider:UpdateValue(basicOrbitDodge.GetDangerRadius()) end)
			pcall(function() panicRadiusSlider:UpdateValue(basicOrbitDodge.GetPanicRadius()) end)
			pcall(function() panicCooldownSlider:UpdateValue(basicOrbitDodge.GetPanicCooldown()) end)
			pcall(function() flipCooldownSlider:UpdateValue(basicOrbitDodge.GetFlipCooldown()) end)
			pcall(function() jumpCooldownSlider:UpdateValue(basicOrbitDodge.GetJumpCooldown()) end)
		end),
	}, "Dropdown_DodgePreset")

	combatSection:Toggle({
		Name = "Death Log",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			deathLog.Toggle(state)
		end),
	}, "Toggle_DeathLog")

	applyFarmModeVisibility()

	--// Auto Start / Retry
	startSection:Toggle({
		Name = "Auto Start",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			autoStart.Toggle(state)
		end),
	}, "Toggle_AutoStart")

	startSection:Toggle({
		Name = "Auto Retry",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			autoRetry.Toggle(state)
		end),
	}, "Toggle_AutoRetry")

	startSection:Button({
		Name = "Manual Retry",
		Callback = function()
			task.spawn(function()
				autoRetry.RetryNow()
			end)
		end,
	})

	startSection:Toggle({
		Name = "Retry on Time Low",
		Default = autoRetry.GetTimeRetryEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoRetry.SetTimeRetryEnabled(state)
		end),
	}, "Toggle_RetryTimeLow")

	ui.PatchSliderLoadCallback(startSection:Slider({
		Name = "Retry Time Threshold",
		Default = autoRetry.GetTimeRetryThreshold(),
		Minimum = 5,
		Maximum = 120,
		DisplayMethod = "Round",
		Precision = 0,
		Suffix = "s",
		Callback = autoSave.Wrap(function(Value)
			autoRetry.SetTimeRetryThreshold(Value)
		end),
	}, "Slider_RetryTimeThreshold"))
end
end function __DIST.q()-- Auto Join Dungeon cho DungeonQuest: tạo phòng (createLobby) + whitelist + start dungeon.
-- Scalable: map/độ khó lấy từ dungeonCatalog (động qua getDungeonStats + override map đặc biệt).

--// Imports

local services = __DIST.load('c')
local notifier = __DIST.load('b')
local dungeonCatalog = __DIST.load('n')
local shared = __DIST.load('d')

local playerName = services.player.Name

--// State
local autoJoinEnabled = false
local autoJoinRunning = false
local autoJoinCancel = false
local selectedDungeon = "Desert Temple"
local selectedDifficulty = "Easy"
local hardcoreEnabled = false
local privateEnabled = true
local waveDefenceEnabled = false
local autoJoinDelay = 3

local LOBBY_PLACE_IDS_AJ = {
	[77649408247578] = true,
	[3220968688] = true,
	[2414851778] = true,
}

--// Callbacks (UI đăng ký để refresh difficulty dropdown theo map)
local dungeonChangedCallbacks = {}

--// Helpers
local function inLobbyPlace()
	return LOBBY_PLACE_IDS_AJ[game.PlaceId] == true
end

local function fireDungeonChanged()
	for _, callback in ipairs(dungeonChangedCallbacks) do
		pcall(callback, selectedDungeon, dungeonCatalog.GetAllowedDifficulties(selectedDungeon))
	end
end

local function joinDungeonNow()
	if autoJoinRunning then return end
	autoJoinRunning = true
	autoJoinCancel = false
	task.spawn(function()
		local ok, err = pcall(function()
			local remotes = game:GetService("ReplicatedStorage"):WaitForChild("remotes", 15)
			if not remotes then error("remotes not found") end

			local levelReq = dungeonCatalog.GetLevelReq(selectedDungeon, selectedDifficulty)
			pcall(function()
				remotes:WaitForChild("createLobby", 10):InvokeServer(
					selectedDungeon,
					selectedDifficulty,
					levelReq,
					hardcoreEnabled,
					privateEnabled,
					waveDefenceEnabled
				)
			end)
			if autoJoinCancel then return end
			task.wait(autoJoinDelay)
			if autoJoinCancel then return end

			if privateEnabled then
				pcall(function()
					remotes:WaitForChild("addPlayerToWhitelist", 10):FireServer(playerName)
				end)
				if autoJoinCancel then return end
				task.wait(autoJoinDelay)
				if autoJoinCancel then return end
			end

			local waitClock = 0
			while waitClock < 10 do
				local lobby = workspace:FindFirstChild("games") and workspace.games:FindFirstChild("inLobby")
				if lobby then break end
				task.wait(0.5)
				waitClock = waitClock + 0.5
				if autoJoinCancel then return end
			end
			if autoJoinCancel then return end

			task.wait(autoJoinDelay)
			if autoJoinCancel then return end
			pcall(function()
				remotes:WaitForChild("startDungeon", 10):FireServer()
			end)
		end)
		autoJoinRunning = false
		if autoJoinCancel then return end
		if ok then
			notifier.Notify("Auto Join", "Joined: " .. selectedDungeon, 3)
		else
			notifier.Notify("Auto Join", "Join failed: " .. tostring(err), 4)
		end
	end)
end

local function joinDungeonWatcher()
	while true do
		task.wait(0.5)
		if autoJoinEnabled and not autoJoinRunning and inLobbyPlace() and shared.IsInLobby() then
			joinDungeonNow()
		end
	end
end

--// Table
local autoJoin = {}

--// Methods
function autoJoin.Toggle(state)
	autoJoinEnabled = state
	if autoJoinEnabled then
		notifier.Notify("Auto Join", "Enabled", 2)
	else
		autoJoinCancel = true
		notifier.Notify("Auto Join", "Stopped", 2)
	end
end

function autoJoin.SetDungeon(name)
	if type(name) ~= "string" or #name == 0 then return end
	selectedDungeon = name
	if not dungeonCatalog.IsDifficultyAllowed(selectedDungeon, selectedDifficulty) then
		local allowed = dungeonCatalog.GetAllowedDifficulties(selectedDungeon)
		if #allowed > 0 then selectedDifficulty = allowed[1] end
	end
	fireDungeonChanged()
end

function autoJoin.SetDifficulty(name)
	if type(name) ~= "string" then return end
	if dungeonCatalog.IsDifficultyAllowed(selectedDungeon, name) then
		selectedDifficulty = name
	end
end

function autoJoin.SetHardcore(state)
	hardcoreEnabled = state
end

function autoJoin.SetPrivate(state)
	privateEnabled = state
end

function autoJoin.SetWaveDefence(state)
	waveDefenceEnabled = state
end

function autoJoin.SetDelay(value)
	autoJoinDelay = value
end

function autoJoin.GetSelectedDungeon()
	return selectedDungeon
end

function autoJoin.GetSelectedDifficulty()
	return selectedDifficulty
end

function autoJoin.GetAllowedDifficulties()
	return dungeonCatalog.GetAllowedDifficulties(selectedDungeon)
end

function autoJoin.OnDungeonChanged(callback)
	if type(callback) == "function" then table.insert(dungeonChangedCallbacks, callback) end
end

autoJoin.JoinNow = function()
	task.spawn(function() joinDungeonNow() end)
end

--// Initialize: watcher
task.spawn(joinDungeonWatcher)

return autoJoin end function __DIST.r()-- Tab Dungeon (DungeonQuest): Auto Join Dungeon scalable.
-- Difficulty dropdown tự update options theo map đang chọn (lấy từ dungeonCatalog).

--// Imports

local ui = __DIST.load('e')
local autoJoin = __DIST.load('q')
local autoSave = __DIST.load('f')
local dungeonCatalog = __DIST.load('n')

return function(window, tab)
	local section = tab:Section({ Side = "Left" })
	section:Header({ Name = "Auto Join Dungeon" })

	section:Toggle({
		Name = "Auto Join Dungeon",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			autoJoin.Toggle(state)
		end),
	}, "Toggle_AutoJoin")

	local dungeonDropdown = section:Dropdown({
		Name = "Dungeon",
		Options = dungeonCatalog.GetDungeons(),
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			autoJoin.SetDungeon(option)
		end),
	}, "Dropdown_Dungeon")

	section:Button({
		Name = "Refresh Map List",
		Callback = function()
			task.spawn(function()
				local newList = dungeonCatalog.RefreshDungeons()
				if not newList or #newList == 0 then return end
				pcall(function()
					dungeonDropdown:ClearOptions()
					dungeonDropdown:InsertOptions(newList)
				end)
				local current = autoJoin.GetSelectedDungeon()
				if not table.find(newList, current) then
					autoJoin.SetDungeon(newList[1])
				end
				pcall(function()
					dungeonDropdown:UpdateSelection(autoJoin.GetSelectedDungeon())
				end)
			end)
		end,
	})

	local levelReqLabel = section:Label({
		Text = "Recommended Level: ...",
	}, "Label_RecommendedLevel")

	local function updateLevelLabel()
		pcall(function()
			local levelReq = dungeonCatalog.GetLevelReq(
				autoJoin.GetSelectedDungeon(),
				autoJoin.GetSelectedDifficulty()
			)
			levelReqLabel:UpdateName("Recommended Level: " .. tostring(levelReq))
		end)
	end
	updateLevelLabel()

	local difficultyDropdown = section:Dropdown({
		Name = "Difficulty",
		Options = autoJoin.GetAllowedDifficulties(),
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			autoJoin.SetDifficulty(option)
			updateLevelLabel()
		end),
	}, "Dropdown_Difficulty")

	section:Toggle({
		Name = "Hardcore",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			autoJoin.SetHardcore(state)
		end),
	}, "Toggle_HardcoreAJ")

	section:Toggle({
		Name = "Private Room",
		Default = true,
		Callback = autoSave.Wrap(function(state)
			autoJoin.SetPrivate(state)
		end),
	}, "Toggle_PrivateAJ")

	section:Toggle({
		Name = "Wave Defence",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			autoJoin.SetWaveDefence(state)
		end),
	}, "Toggle_WaveDefenceAJ")

	ui.PatchSliderLoadCallback(section:Slider({
		Name = "Delay",
		Default = 3,
		Minimum = 0,
		Maximum = 15,
		DisplayMethod = "Round",
		Precision = 1,
		Suffix = "s",
		Callback = autoSave.Wrap(function(Value)
			autoJoin.SetDelay(Value)
		end),
	}, "Slider_JoinDelay"))

	section:Button({
		Name = "Join Now",
		Callback = function()
			autoJoin.JoinNow()
		end,
	})

	-- Đồng bộ difficulty dropdown khi đổi map (cũng chạy khi config load).
	autoJoin.OnDungeonChanged(function(dungeon, allowed)
		pcall(function()
			difficultyDropdown:ClearOptions()
			difficultyDropdown:InsertOptions(allowed)
			difficultyDropdown:UpdateSelection(autoJoin.GetSelectedDifficulty())
		end)
		updateLevelLabel()
	end)
end end function __DIST.s()-- Highlight hitbox (ESP SelectionBox) cho DungeonQuest.
-- Chỉ highlight các object trùng tên với model projectile trong
-- ReplicatedStorage.enemyProjectiles, khi chúng xuất hiện trong Workspace.

--// Imports

local services = __DIST.load('c')
local shared = __DIST.load('d')

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
end function __DIST.t()-- Tab Visual (DungeonQuest): các tính năng hiển thị trực quan (visual).

--// Imports

local autoSave = __DIST.load('f')
local esp = __DIST.load('s')
local basicOrbitDodge = __DIST.load('l')

return function(window, tab)
	local section = tab:Section({ Side = "Left" })
	section:Header({ Name = "Hitbox" })

	section:Toggle({
		Name = "Highlight Hitboxes",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			esp.Toggle(state)
		end),
	}, "Toggle_HighlightHitboxes")

	section:Toggle({
		Name = "Player Real Hitbox",
		Default = esp.IsPlayerHitboxEnabled(),
		Callback = autoSave.Wrap(function(state)
			esp.TogglePlayerHitbox(state)
		end),
	}, "Toggle_PlayerRealHitbox")

	section:Header({ Name = "Dodge Visuals" })

	section:Toggle({
		Name = "Dead Zone Visuals",
		Default = basicOrbitDodge.IsDebugVisuals(),
		Callback = autoSave.Wrap(function(state)
			basicOrbitDodge.SetDebugVisuals(state)
		end),
	}, "Toggle_DeadZoneVisuals")

	section:Toggle({
		Name = "Detector Visuals",
		Default = basicOrbitDodge.IsDetectorVisuals(),
		Callback = autoSave.Wrap(function(state)
			basicOrbitDodge.SetDetectorVisuals(state)
		end),
	}, "Toggle_DetectorVisuals")

	section:Dropdown({
		Name = "Detector Shape",
		Options = { "Circle", "Cone" },
		Default = (basicOrbitDodge.GetDetectorMode() == "Cone" and 2) or 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			if option == "Cone" then
				basicOrbitDodge.SetDetectorMode("Cone")
			else
				basicOrbitDodge.SetDetectorMode("Circle")
			end
		end),
	}, "Dropdown_DetectorShape")
end end function __DIST.u()-- Auto Hide UI cho DungeonQuest: tự ẩn cửa sổ script hub ngay sau khi execute.
-- Hiện lại bằng keybind mặc định (RightControl) mà Maclib đã cấu hình sẵn.

--// Imports

local macLib = __DIST.load('a')
local notifier = __DIST.load('b')

--// Services
local HttpService = game:GetService("HttpService")

--// Constants
local SETTINGS_FILE = macLib.Folder .. "/settings/autohide.json"

--// Table
local autoHide = {}

--// State
local enabled = false
local window = nil

--// Persistence
local function loadSettings()
	if not (isfile and isfile(SETTINGS_FILE)) then return end
	local ok, decoded = pcall(function()
		return HttpService:JSONDecode(readfile(SETTINGS_FILE))
	end)
	if ok and type(decoded) == "table" then
		enabled = decoded.enabled == true
	end
end

local function saveSettings()
	if not (isfile and writefile) then return end
	pcall(function()
		writefile(SETTINGS_FILE, HttpService:JSONEncode({ enabled = enabled }))
	end)
end

--// Methods
function autoHide.SetWindow(newWindow)
	window = newWindow
end

function autoHide.SetEnabled(state)
	enabled = state == true
	saveSettings()
end

function autoHide.IsEnabled()
	return enabled
end

--// Ẩn cửa sổ ngay lập tức (dùng SetState(false) như Maclib minimize, hiện lại bằng keybind)
function autoHide.Hide()
	if not enabled or not window then return end
	local ok = pcall(function()
		window:SetState(false)
	end)
	if not ok then warn("[AutoHide] Không ẩn được window") end
end

--// Chạy sau khi init xong: ẩn ngay nếu được bật
function autoHide.Execute()
	if not enabled then return end
	task.spawn(function()
		task.wait(0.5)
		autoHide.Hide()
	end)
end

--// Load settings lúc require
loadSettings()

return autoHide
end function __DIST.v()-- Tab Config (DungeonQuest): tự build config section dùng API có sẵn của Maclib
-- (SaveConfig/LoadConfig/RefreshConfigList) và Dropdown (UpdateSelection/IsOption/Value...).
-- Hỗ trợ auto-select config autoload + auto-save (xem core/autoSave).

--// Imports

local macLib = __DIST.load('a')
local autoSave = __DIST.load('f')
local autoHide = __DIST.load('u')

return function(window, tab)
	local folder = macLib.Folder
	local autoloadPath = folder .. "/settings/autoload.txt"

	local function getAutoloadName()
		if isfile and isfile(autoloadPath) then
			return readfile(autoloadPath)
		end
		return nil
	end

	local function activate(name)
		autoSave.SetActive(name)
	end

	local section = tab:Section({ Side = "Left" })
	section:Header({ Name = "Configs" })

	local inputPath = nil
	local configSelection
	local autoloadLabel

	local function refreshOptions(keep)
		local options = macLib:RefreshConfigList()
		configSelection:ClearOptions()
		configSelection:InsertOptions(options)
		if keep then
			if not configSelection:IsOption(keep) then
				configSelection:InsertOptions({ keep })
			end
			configSelection:UpdateSelection(keep)
		end
	end

	section:Input({
		Name = "Config Name",
		Placeholder = "Name",
		AcceptedCharacters = "All",
		Callback = function(input)
			inputPath = input
		end,
	})

	configSelection = section:Dropdown({
		Name = "Select Config",
		Multi = false,
		Required = false,
		Options = macLib:RefreshConfigList(),
		Callback = function(value)
			activate(value)
		end,
	})

	--// Auto-select config autoload (nếu đã set) để dropdown luôn chỉ đúng config đang dùng
	local autoloadName = getAutoloadName()
	if autoloadName and autoloadName ~= "" then
		if not configSelection:IsOption(autoloadName) then
			configSelection:InsertOptions({ autoloadName })
		end
		configSelection:UpdateSelection(autoloadName)
		activate(autoloadName)
	end

	section:Button({
		Name = "Create Config",
		Callback = function()
			if not inputPath or string.gsub(inputPath, " ", "") == "" then
				window:Notify({ Title = "Interface", Description = "Config name cannot be empty." })
				return
			end

			local success, err = macLib:SaveConfig(inputPath)
			if not success then
				window:Notify({ Title = "Interface", Description = "Unable to save config: " .. tostring(err) })
				return
			end

			window:Notify({ Title = "Interface", Description = string.format("Created config %q", inputPath) })
			refreshOptions(inputPath)
			activate(inputPath)
		end,
	})

	section:Button({
		Name = "Load Config",
		Callback = function()
			local name = configSelection.Value
			local success, err = macLib:LoadConfig(name)
			if not success then
				window:Notify({ Title = "Interface", Description = "Unable to load config: " .. tostring(err) })
				return
			end

			window:Notify({ Title = "Interface", Description = string.format("Loaded config %q", name) })
			activate(name)
		end,
	})

	section:Button({
		Name = "Overwrite Config",
		Callback = function()
			local name = configSelection.Value
			local success, err = macLib:SaveConfig(name)
			if not success then
				window:Notify({ Title = "Interface", Description = "Unable to overwrite config: " .. tostring(err) })
				return
			end

			window:Notify({ Title = "Interface", Description = string.format("Overwrote config %q", name) })
			activate(name)
		end,
	})

	section:Button({
		Name = "Set as autoload",
		Callback = function()
			local name = configSelection.Value
			if not name then
				window:Notify({ Title = "Interface", Description = "Please select a config first." })
				return
			end

			writefile(autoloadPath, name)
			autoloadLabel:UpdateName("Autoload config: " .. name)
			window:Notify({ Title = "Interface", Description = string.format("Set %q as autoload", name) })
			activate(name)
		end,
	})

	section:Button({
		Name = "Refresh Config List",
		Callback = function()
			refreshOptions(configSelection.Value)
		end,
	})

	autoloadLabel = section:Label({ Text = "Autoload config: None" })
	local currentAuto = getAutoloadName()
	if currentAuto and currentAuto ~= "" then
		autoloadLabel:UpdateName("Autoload config: " .. currentAuto)
	end

	section:Header({ Name = "Auto Hide UI" })
	section:Toggle({
		Name = "Hide window after execute",
		Default = autoHide.IsEnabled(),
		Callback = function(state)
			autoHide.SetEnabled(state)
		end,
	}, "Toggle_AutoHide")

	section:Label({
		Text = "Press RightControl to show the window again.",
	})
end
end function __DIST.w()-- Webhook Discord cho DungeonQuest: gửi thông báo WIN + Reward qua Discord.
-- Bắt sự kiện `cloneRewardGui` (RemoteEvent do game fire khi thắng dungeon), đọc
-- reward, build Discord embed và gửi qua HttpService / `request` của executor.

--// Imports

local macLib = __DIST.load('a')
local notifier = __DIST.load('b')
local shared = __DIST.load('d')

--// Services
local HttpService = game:GetService("HttpService")

--// Constants
local SETTINGS_FILE = macLib.Folder .. "/settings/webhook.json"

--// Table
local webhook = {}

--// State
local webhookUrl = ""
local enabled = false
local connected = false

local pingEnabled = false
local pingMention = ""
local pingTiers = { "Tier6" } -- danh sách tier đã chọn (Secret = Tier6)

--// Color theo rarity (Discord embed Decimal color)
local RARITY_COLORS = {
	common = 9807270,
	uncommon = 43520,
	rare = 3447003,
	epic = 10181046,
	legendary = 15844367,
	mythic = 15277667,
}
local DEFAULT_COLOR = 10181046

--// Dropdown Tier: Secret được coi là Tier6 (mức cao nhất)
local PING_TIER_OPTIONS = { "Tier1", "Tier2", "Tier3", "Tier4", "Tier5", "Tier6" }

local function tierOptionToLevel(option)
	local num = tonumber(tostring(option or ""):match("Tier(%d+)"))
	return num or 6
end

--// Tập hợp các mức tier đang được chọn (dưới dạng set level số)
local selectedTierLevels = nil
local function getSelectedTierLevels()
	if selectedTierLevels then return selectedTierLevels end
	selectedTierLevels = {}
	for _, option in ipairs(pingTiers) do
		selectedTierLevels[tierOptionToLevel(option)] = true
	end
	return selectedTierLevels
end

--// Rarity -> mức tier (vì rarify chính là tier: uncommon=1, common=2, ... secret=6)
--// Dùng khi item không có field `tier` (vd kỹ năng/ability).
local RARITY_TO_TIER = {
	uncommon = 1,
	common = 2,
	rare = 3,
	epic = 4,
	legendary = 5,
	secret = 6,
}

--// Lấy mức tier của item: ưu tiên field `tier`, nếu không có thì map từ rarity.
local function getItemTierLevel(item)
	if not item then return nil end
	local tierNum = tonumber(tostring(item.tier or ""):match("tier(%d+)"))
	if tierNum then return tierNum end
	if item.secret == true then return 6 end
	return RARITY_TO_TIER[string.lower(tostring(item.rarity or ""))]
end

--// Trạng thái đo lường dungeon (XP trước + đồng hồ hoàn thành)
local xpBefore = nil

--// Lấy tên hiển thị của player (ưu tiên DisplayName, fallback Name)
local function getPlayerName()
	local p = game:GetService("Players").LocalPlayer
	if not p then return "?" end
	if p.DisplayName and p.DisplayName ~= "" then return p.DisplayName end
	return p.Name
end

--// Lấy XP hiện tại của player (Players.LocalPlayer.XP - IntValue)
local function getXp()
	local p = game:GetService("Players").LocalPlayer
	if not p then return nil end
	local xp = p:FindFirstChild("XP")
	if xp and xp:IsA("IntValue") then return xp.Value end
	return nil
end

--// Tìm kiếm đệ quy instance theo tên (tránh phụ thuộc path cứng)
local function findChildRecursive(parent, name, maxDepth)
	maxDepth = maxDepth or 12
	if maxDepth < 0 then return nil end
	local direct = parent:FindFirstChild(name)
	if direct then return direct end
	for _, child in ipairs(parent:GetChildren()) do
		local found = findChildRecursive(child, name, maxDepth - 1)
		if found then return found end
	end
	return nil
end

--// Lấy Level hiện tại: Players.LocalPlayer.PlayerGui.playerStatus.Frame.levelBorder.level (TextLabel)
local function getLevel()
	local p = game:GetService("Players").LocalPlayer
	if not p or not p:FindFirstChild("PlayerGui") then return "?" end
	local playerStatus = p.PlayerGui:FindFirstChild("playerStatus")
	if not playerStatus then return "?" end
	local levelBorder = findChildRecursive(playerStatus, "levelBorder")
	if not levelBorder then return "?" end
	local label = levelBorder:FindFirstChild("level")
	if label and label:IsA("TextLabel") then return label.Text end
	return "?"
end

--// Reset bộ đếm: ghi nhận XP trước dungeon (khi đang ở lobby/startButton hiện)
local function resetRun()
	xpBefore = getXp()
	shared.SetDungeonStartTime(nil)
end

--// Bắt đầu tính thời gian hoàn thành (startButton biến mất -> vào dungeon)
local function startRun()
	if not shared.GetDungeonStartTime() then shared.SetDungeonStartTime(os.clock()) end
	if xpBefore == nil then xpBefore = getXp() end
end

--// Theo dõi trạng thái lobby/dungeon qua shared (startButton + dungName):
--// lobby = reset bộ đếm XP, vào dungeon = bắt đầu tính thời gian hoàn thành.
local function startDungeonWatcher()
	local function onLobbyChanged(lobby)
		if lobby then
			resetRun()
		else
			startRun()
		end
	end
	onLobbyChanged(shared.IsInLobby())
	shared.OnLobbyChanged(onLobbyChanged)
end

--// Định dạng thời gian hoàn thành (giây -> MM:SS)
local function formatDuration(seconds)
	seconds = math.max(0, math.floor(seconds or 0))
	local m = math.floor(seconds / 60)
	local s = seconds % 60
	return string.format("%d:%02d", m, s)
end

--// Persistence (writefile/readfile/isfile có sẵn trong executor)
local function loadSettings()
	if not (isfile and isfile(SETTINGS_FILE)) then return end
	local ok, decoded = pcall(function()
		return HttpService:JSONDecode(readfile(SETTINGS_FILE))
	end)
	if ok and type(decoded) == "table" then
		webhookUrl = type(decoded.url) == "string" and decoded.url or ""
		enabled = decoded.enabled == true
		pingEnabled = decoded.pingEnabled == true
		pingMention = type(decoded.pingMention) == "string" and decoded.pingMention or ""
		local rawTiers = decoded.pingTiers
		if type(rawTiers) == "string" then rawTiers = { rawTiers } end
		if type(rawTiers) == "table" then
			local valid = {}
			for _, opt in ipairs(rawTiers) do
				if table.find(PING_TIER_OPTIONS, opt) and not table.find(valid, opt) then
					table.insert(valid, opt)
				end
			end
			if #valid > 0 then pingTiers = valid end
		end
		selectedTierLevels = nil
	end
end

local function saveSettings()
	if not (isfile and writefile) then return end
	pcall(function()
		writefile(SETTINGS_FILE, HttpService:JSONEncode({
			url = webhookUrl,
			enabled = enabled,
			pingEnabled = pingEnabled,
			pingMention = pingMention,
			pingTiers = pingTiers,
		}))
	end)
end

--// Discord send helpers
local function buildItemsText(items)
	local lines = {}
	for _, item in ipairs(items or {}) do
		local name = item.itemName or "Unknown"
		local meta = {}
		if item.itemType and item.itemType ~= "gold" then table.insert(meta, item.itemType) end
		if item.rarity then table.insert(meta, item.rarity) end
		if item.tier then table.insert(meta, item.tier) end
		if #meta > 0 then
			table.insert(lines, string.format("%s (%s)", tostring(name), table.concat(meta, ", ")))
		else
			table.insert(lines, tostring(name))
		end
	end
	return table.concat(lines, "\n")
end

-- Kiểm tra item có tier NẰM TRONG danh sách tier đã chọn hay không.
-- Lấy mức tier từ field `tier` (giáp/vũ khí) hoặc map từ rarity (kỹ năng).
local function itemIsRare(item)
	if not item then return false end
	local level = getItemTierLevel(item)
	if not level then return false end
	return getSelectedTierLevels()[level] == true
end

local function shouldPing(items)
	if not pingEnabled or pingMention == "" then return false end
	for _, item in ipairs(items or {}) do
		if itemIsRare(item) then return true end
	end
	return false
end

local function buildEmbed(reward, meta)
	local gold = tonumber(reward.gold) or 0
	local items = {}
	for _, item in ipairs(reward.items or {}) do
		if item.itemName and item.itemName ~= "gold" then
			table.insert(items, item)
		end
	end

	local color = DEFAULT_COLOR
	local topRarity
	for _, item in ipairs(items) do
		local rarity = tostring(item.rarity or "")
		if RARITY_COLORS[rarity] ~= nil then
			if topRarity == nil or RARITY_COLORS[rarity] > RARITY_COLORS[topRarity] then
				topRarity = rarity
			end
		end
	end
	if topRarity then color = RARITY_COLORS[topRarity] end

	meta = meta or {}
	local level = tostring(meta.level or "?")
	local expGained = tonumber(meta.expGained)
	local expText = expGained and string.format("%s XP", tostring(expGained)) or "?"
	local durationText = formatDuration(meta.duration)

	local fields = {
		{
			name = "Player",
			value = getPlayerName(),
			inline = true,
		},
		{
			name = "Level",
			value = level,
			inline = true,
		},
		{
			name = "XP Gained",
			value = expText,
			inline = true,
		},
		{
			name = "Time",
			value = durationText,
			inline = true,
		},
		{
			name = "Gold",
			value = tostring(gold),
			inline = true,
		},
		{
			name = "Rewards",
			value = #items > 0 and buildItemsText(items) or "None",
			inline = true,
		},
	}

	local description = "You cleared the dungeon and received your rewards!"
	if shouldPing(items) then
		description = description .. "\n\n" .. pingMention
	end

	return {
		embeds = {
			{
				title = "Dungeon WIN",
				description = description,
				color = color,
				fields = fields,
				timestamp = DateTime.now():ToIsoDate(),
			},
		},
	}
end

local function sendEmbed(reward, meta)
	if webhookUrl == "" or string.find(webhookUrl, "^https://discord%.com/api/webhooks/") == nil then
		return false, "Invalid webhook URL"
	end

	local payload = buildEmbed(reward, meta)
	local ok, body = pcall(function()
		return HttpService:JSONEncode(payload)
	end)
	if not ok then return false, "Could not encode payload" end

	local reqOk, response = pcall(function()
		return request({
			Url = webhookUrl,
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
				["User-Agent"] = "ScriptHub-DungeonQuest (https://www.roblox.com)",
			},
			Body = body,
		})
	end)

	if not reqOk then
		return false, "Request error: " .. tostring(response)
	end

	if response and response.Success then
		return true
	end

	local code = response and response.StatusCode or "?"
	return false, "HTTP " .. tostring(code)
end

--// Public methods
function webhook.SetUrl(url)
	webhookUrl = url or ""
	saveSettings()
end

function webhook.GetUrl()
	return webhookUrl
end

function webhook.SetEnabled(state)
	enabled = state == true
	saveSettings()
end

function webhook.IsEnabled()
	return enabled
end

function webhook.SetPingEnabled(state)
	pingEnabled = state == true
	saveSettings()
end

function webhook.IsPingEnabled()
	return pingEnabled
end

function webhook.SetPingMention(mention)
	pingMention = mention or ""
	saveSettings()
end

function webhook.GetPingMention()
	return pingMention
end

--// Nhận danh sách tier đã chọn: có thể là table dạng { [option] = true } (từ Multi dropdown)
--// hoặc mảng {"Tier1", ...}. Lọc theo PING_TIER_OPTIONS.
function webhook.SetPingTiers(tiers)
	if type(tiers) ~= "table" then return end

	local valid = {}
	local seen = {}
	local function add(opt)
		if not seen[opt] and table.find(PING_TIER_OPTIONS, opt) then
			seen[opt] = true
			table.insert(valid, opt)
		end
	end

	for k, v in pairs(tiers) do
		-- dạng { [option] = true }
		if type(k) == "string" and v == true then
			add(k)
		elseif type(v) == "string" then
			-- dạng mảng {"Tier1", ...}
			add(v)
		end
	end

	if #valid == 0 then return end
	pingTiers = valid
	selectedTierLevels = nil
	saveSettings()
end

function webhook.GetPingTiers()
	return pingTiers
end

function webhook.GetPingTierOptions()
	return PING_TIER_OPTIONS
end

function webhook.Send()
	if not enabled then
		notifier.Notify("Webhook", "Notifications is disabled", 3)
		return
	end
	local ok, msg = sendEmbed({
		items = { { itemName = "Test Reward", rarity = "common", itemType = "item" } },
		gold = 0,
	}, {
		level = getLevel(),
		expGained = 0,
		duration = 0,
	})
	if ok then
		notifier.Notify("Webhook", "Test sent successfully", 3)
	else
		notifier.Notify("Webhook", "Send failed: " .. tostring(msg), 4)
	end
end

--// Hook `cloneRewardGui` để bắt WIN + reward
function webhook.Init()
	if connected then return end

	local remotes
	local created = pcall(function()
		remotes = game:GetService("ReplicatedStorage"):WaitForChild("remotes", 30)
	end)
	if not created or not remotes then
		warn("[Webhook] Could not find ReplicatedStorage.remotes")
		return
	end

	local rewardRemote = remotes:FindFirstChild("cloneRewardGui")
	if not rewardRemote then
		warn("[Webhook] Could not find remote cloneRewardGui")
		return
	end

	rewardRemote.OnClientEvent:Connect(function(reward)
		if not enabled then return end

		local duration = shared.GetDungeonStartTime() and shared.GetDungeonElapsed() or 0

		task.spawn(function()
			--// Chờ XP cập nhật sau khi nhận reward rồi mới lấy XP cuối
			task.wait(1.5)

			local xpAfter = getXp()
			local expGained = nil
			if xpBefore ~= nil and xpAfter ~= nil then
				expGained = math.max(0, xpAfter - xpBefore)
			end

			local ok, msg = sendEmbed(reward, {
				level = getLevel(),
				expGained = expGained,
				duration = duration,
			})
			if not ok then
				notifier.Notify("Webhook WIN", "Send failed: " .. tostring(msg), 4)
			end
		end)
	end)

	connected = true
	notifier.Notify("Webhook", "Webhook notifications ready", 2)
	startDungeonWatcher()
end

--// Load settings lúc require
loadSettings()

return webhook
end function __DIST.x()-- Tab Notifications (DungeonQuest): cấu hình thông báo Webhook Discord.
-- Input webhook URL + toggle bật/tắt + nút test gửi thử + cấu hình ping.

--// Imports

local webhook = __DIST.load('w')

return function(window, tab)
	local section = tab:Section({ Side = "Left" })
	section:Header({ Name = "Discord Webhook" })

	section:Input({
		Name = "Webhook URL",
		Placeholder = "https://discord.com/api/webhooks/...",
		AcceptedCharacters = "All",
		Default = webhook.GetUrl(),
		Callback = function(input)
			webhook.SetUrl(input)
		end,
	})

	section:Toggle({
		Name = "Enable Notifications",
		Default = webhook.IsEnabled(),
		Callback = function(state)
			webhook.SetEnabled(state)
		end,
	}, "Toggle_Webhook")

	section:Button({
		Name = "Send Test Notification",
		Callback = function()
			webhook.Send()
		end,
	})

	local pingSection = tab:Section({ Side = "Left" })
	pingSection:Header({ Name = "Ping on Drops" })

	pingSection:Toggle({
		Name = "Enable Ping",
		Default = webhook.IsPingEnabled(),
		Callback = function(state)
			webhook.SetPingEnabled(state)
		end,
	}, "Toggle_Ping")

	pingSection:Input({
		Name = "Mention (User/Role ID)",
		Placeholder = "<@123456789012345678>",
		AcceptedCharacters = "All",
		Default = webhook.GetPingMention(),
		Callback = function(input)
			webhook.SetPingMention(input)
		end,
	})

	pingSection:Dropdown({
		Name = "Ping Tier",
		Multi = true,
		Required = false,
		Options = webhook.GetPingTierOptions(),
		Default = webhook.GetPingTiers(),
		Callback = function(value)
			webhook.SetPingTiers(value)
		end,
	})

	pingSection:Label({
		Text = "Ping triggers when a reward item matches any selected Tier (multi-select, Secret = Tier6).",
	})
end
end function __DIST.y()-- Tab State (DungeonQuest): hiển thị trạng thái thời gian thực của script.

--// Imports

local shared = __DIST.load('d')
local autoRetry = __DIST.load('k')
local basicDodge = __DIST.load('l')

local BOSS_LABEL = "Boss Active"
local BOSS_INDEX_LABEL = "Boss"
local DUNGEON_LABEL = "Dungeon"
local TIMER_LABEL = "Time Left"

return function(window, tab)
	local section = tab:Section({ Side = "Left" })
	section:Header({ Name = "Status" })

	local bossLabel = section:Label({
		Text = BOSS_LABEL .. ": " .. (shared.IsBossActive() and "Yes" or "No"),
	})

	local function updateBoss(active)
		local color = active and "0, 255, 0" or "255, 80, 80"
		bossLabel:UpdateName(BOSS_LABEL .. ": <font color='rgb(" .. color .. ")'>" .. (active and "Yes" or "No") .. "</font>")
	end

	updateBoss(shared.IsBossActive())

	shared.OnBossActiveChanged(function(active)
		updateBoss(active)
	end)

	local bossIndexLabel = section:Label({
		Text = BOSS_INDEX_LABEL .. ": 0",
	})

	local function updateBossIndex()
		bossIndexLabel:UpdateName(BOSS_INDEX_LABEL .. ": " .. shared.GetCurrentBossIndex())
	end

	updateBossIndex()

	shared.OnBossIndexChanged(function()
		updateBossIndex()
	end)

	local enemyCountLabel = section:Label({
		Text = "Enemies: 0",
	})

	local function updateEnemyCount()
		if not shared.IsInLobby() and not shared.GetCurrentDungeonName() then
			enemyCountLabel:UpdateName("Enemies: <font color='rgb(160, 160, 160)'>--</font>")
			return
		end
		local count = shared.GetEnemyCount()
		local color = count > 0 and "0, 255, 0" or "255, 80, 80"
		enemyCountLabel:UpdateName("Enemies: <font color='rgb(" .. color .. ")'>" .. count .. "</font>")
	end

	section:Header({ Name = "Timer" })

	local timeLeftLabel = section:Label({
		Text = TIMER_LABEL .. ": --",
	})

	local function updateTimeLeft()
		local remaining = autoRetry.GetTimeLeft()
		if not remaining then
			timeLeftLabel:UpdateName(TIMER_LABEL .. ": <font color='rgb(160, 160, 160)'>--</font>")
			return
		end
		local total = math.floor(remaining)
		local formatted = string.format("%d:%02d", math.floor(total / 60), total % 60)
		local low = autoRetry.GetTimeRetryEnabled() and remaining < autoRetry.GetTimeRetryThreshold()
		local color = low and "255, 80, 80" or "0, 255, 0"
		timeLeftLabel:UpdateName(TIMER_LABEL .. ": <font color='rgb(" .. color .. ")'>" .. formatted .. "</font>")
	end

	updateEnemyCount()

	updateTimeLeft()

	section:Header({ Name = "Dodge" })

	local hazardCountLabel = section:Label({
		Text = "Hazards: 0",
	})

	local function updateHazardCount()
		local count = basicDodge.GetHazardCount()
		local color = count > 0 and "0, 255, 0" or "160, 160, 160"
		hazardCountLabel:UpdateName("Hazards: <font color='rgb(" .. color .. ")'>" .. count .. "</font>")
	end

	updateHazardCount()

	section:Button({
		Name = "Log Dodge Hazards to Console",
		Callback = function()
			local names = basicDodge.GetHazardNames()
			print("[DungeonQuest] Dodge hazards being tracked (" .. #names .. "):")
			if #names == 0 then
				print("  (none - dodge scanner sees nothing)")
			else
				for _, name in ipairs(names) do
					print("  - " .. name)
				end
			end
		end,
	})

	--// Forward declaration: updateLobby được định nghĩa phía dưới nhưng poll loop
	--// ở đây chạy trước -> nếu không khai báo trước sẽ thành global nil.
	local updateLobby

	task.spawn(function()
		while task.wait(0.5) do
			updateBoss(shared.IsBossActive())
			updateBossIndex()
			updateEnemyCount()
			updateHazardCount()
			updateLobby()
			updateTimeLeft()
		end
	end)

	section:Header({ Name = "Level Info" })

	local dungeonLabel = section:Label({
		Text = DUNGEON_LABEL .. ": Unknown",
	})

	local function updateDungeon()
		local name = shared.GetCurrentDungeonName()
		if name then
			dungeonLabel:UpdateName(DUNGEON_LABEL .. ": " .. name)
		else
			dungeonLabel:UpdateName(DUNGEON_LABEL .. ": <font color='rgb(255, 80, 80)'>Unknown</font>")
		end
	end

	updateDungeon()

	shared.OnDungeonNameChanged(function()
		updateDungeon()
	end)

	section:Header({ Name = "Lobby / Dungeon" })

	local lobbyLabel = section:Label({
		Text = "Lobby: Unknown",
	})

	updateLobby = function()
		local inLobby = shared.IsInLobby()
		local color = inLobby and "0, 255, 0" or "255, 80, 80"
		lobbyLabel:UpdateName("Lobby: <font color='rgb(" .. color .. ")'>" .. (inLobby and "Yes" or "No") .. "</font>")
	end

	updateLobby()

	shared.OnLobbyChanged(function()
		updateLobby()
	end)

	section:Button({
		Name = "Log Enemy Types to Console",
		Callback = function()
			local names = shared.GetEnemyNames()
			print("[DungeonQuest] Enemy types in map (" .. #names .. "):")
			if #names == 0 then
				print("  (no enemies found)")
			else
				for _, name in ipairs(names) do
					print("  - " .. name)
				end
			end
		end,
	})
end
end function __DIST.z()-- Phím tắt R: teleport tới kẻ địch gần nhất. C: teleport về sau kẻ địch xa nhất.

--// Imports

local services = __DIST.load('c')
local shared = __DIST.load('d')

--// References
local UserInputService = services.UserInputService

--// Table
local shortcuts = {}

--// Initialize
function shortcuts.Init()
	if shortcuts.inited then return end
	shortcuts.inited = true

	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then return end
		if input.KeyCode == Enum.KeyCode.R then
			task.spawn(function()
				shared.TeleportToNearestEnemy()
			end)
		elseif input.KeyCode == Enum.KeyCode.C then
			task.spawn(function()
				shared.TeleportBehindFarthestEnemy()
			end)
		end
	end)
end

return shortcuts
end function __DIST.A()-- DungeonQuest: khởi tạo window + tabs, nạp core logic và các tab UI.


return function(self)
	--// Quan trọng: Maclib capture `Players.LocalPlayer` NGAY KHI require module
	--// (trong Maclib: `local LocalPlayer = Players.LocalPlayer` ở top-level).
	--// Nếu script chạy quá nhanh khi inject, LocalPlayer còn nil, và biến bên trong
	--// Maclib giữ nil vĩnh viễn -> tạo window (ShowUserInfo) crash "attempt to index
	--// nil with 'UserId'". Vì vậy phải chờ LocalPlayer TRƯỚC KHI require Maclib.
	local Players = game:GetService("Players")
	local timeout = os.clock() + 15
	while not Players.LocalPlayer do
		if os.clock() > timeout then break end
		task.wait(0.1)
	end
	local localPlayer = Players.LocalPlayer
	if not localPlayer then
		return warn("[DungeonQuest] Không lấy được LocalPlayer, hủy khởi tạo script.")
	end

	--// Imports
	local macLib = __DIST.load('a')

	--// Window
	local window = macLib:Window({
		Title = "DungeonQuest",
		Subtitle = "EsclipseHub",
		Size = UDim2.fromOffset(900, 600),
		DragStyle = 1,
		DisabledWindowControls = {},
		ShowUserInfo = true,
		Keybind = Enum.KeyCode.RightControl,
		AcrylicBlur = true,
	})

	local notifier = __DIST.load('b')
	notifier:SetWindow(window)

	--// Đăng ký UI vào registry để unload UI cũ trước mỗi lần execute script mới
	_G.ScriptHub_UI = window

	--// Tabs
	local tabGroup = window:TabGroup()
	local tabs = {
		Player = tabGroup:Tab({ Name = "Player", Image = "rbxassetid://10734950309" }),
		Farm = tabGroup:Tab({ Name = "Auto Farm", Image = "rbxassetid://18821914323" }),
		Dungeon = tabGroup:Tab({ Name = "Dungeon Joiner", Image = "rbxassetid://10734950309" }),
		Visual = tabGroup:Tab({ Name = "Visual", Image = "rbxassetid://10734950309" }),
		Config = tabGroup:Tab({ Name = "Configs", Image = "rbxassetid://10734950309" }),
		Notifications = tabGroup:Tab({ Name = "Notifications", Image = "rbxassetid://10734950309" }),
		State = tabGroup:Tab({ Name = "State", Image = "rbxassetid://10734950309" }),
	}

	--// Config
	macLib:SetFolder("EsclipseHub")

	--// Tab UI (mỗi tab trigger require các core logic tương ứng)
	local speedTab = __DIST.load('h')
	local combatTab = __DIST.load('p')
	local dungeonTab = __DIST.load('r')
	local visualTab = __DIST.load('t')
	local configTab = __DIST.load('v')
	local notificationsTab = __DIST.load('x')
	local stateTab = __DIST.load('y')

	speedTab(window, tabs.Player)
	combatTab(window, tabs.Farm)
	dungeonTab(window, tabs.Dungeon)
	visualTab(window, tabs.Visual)
	configTab(window, tabs.Config)
	notificationsTab(window, tabs.Notifications)
	stateTab(window, tabs.State)

	--// Phím tắt
	local shortcuts = __DIST.load('z')
	shortcuts.Init()

	--// Webhook Discord (thông báo WIN + Reward)
	local webhook = __DIST.load('w')
	webhook.Init()
__DIST.load('l')

	--// Contextual Combat settings (per dungeon x per boss/mob) - auto-switch
	

local contextual = __DIST.load('o')

	--// Death Logger (điều tra nguyên nhân chết -> khảo sát hazard)
	local deathLog = __DIST.load('m')
	deathLog.Init()

	--// Auto Hide UI (ẩn cửa sổ sau khi execute)
	local autoHide = __DIST.load('u')
	autoHide.SetWindow(window)
	autoHide.Execute()

	--// Khởi chạy
	tabs.Player:Select()
	macLib:LoadAutoLoadConfig()

	--// Nạp context data SAU khi config (kể cả autoload) được load, để context đọc đúng
	--// dữ liệu đã lưu thay vì fallback về global.
	contextual.Init()
end
end function __DIST.B()
local flags = {}

function flags:Export()
    local result = {}

    for key, component in pairs(self) do
        if typeof(component) == "Instance" or type(component) == "table" then
            local success, value = pcall(function()
                -- return component.Value
            end)

            if success and value ~= nil then
                result[key] = value
            end
        end
    end

    return result
end

function flags:Import(data)
	for key, value in pairs(data) do
		local component = self[key]

		if component and component.Value ~= nil then
			local success = pcall(function()
				-- component:SetValue(value)
			end)

			if not success then
				warn(`Failed to import value for flag "{key}"`)
			end
		end
	end
end

function flags:Reset()
	for k in pairs(self) do
		self[k] = nil
	end
end

return flags end function __DIST.C()
local binder = {}

function binder.Apply(properties: { [string]: any }, object: any, excludes: { [number]: string }?): any
	for property, value in pairs(properties) do
		if excludes and table.find(excludes, property) then
			continue
		end

		pcall(function()
			object[property] = value
		end)
	end

	return object
end

function binder.Wrap(
	object: { [string]: any },
	bindings: { [string]: (any) -> () },
	excludes: { [number]: any }?,
	instance: Instance?
): any
	local proxy = {}

	setmetatable(proxy, {
		__index = function(_, key)
			if object[key] ~= nil then
				return object[key]
			elseif instance then
				local ok, value = pcall(function()
					return instance[key]
				end)

				if ok then
					return value
				end
			end

			return
		end,

		__newindex = function(_, key, value)
			local handler = bindings[key]

			if handler then
				handler(value)

				if not (excludes and table.find(excludes, key)) then
					object[key] = value
				end
			elseif instance then
				local ok, _ = pcall(function()
					instance[key] = value
				end)

				if not ok then
					object[key] = value
				end
			else
				object[key] = value
			end
		end,
	})

	return proxy
end

return binder
end function __DIST.D()
--// Imports



local binder = __DIST.load('C')

--// Variables
local interface = {}

--// Initialize
function interface:Window(properties: Window__DARKLUA_TYPE_a): Window__DARKLUA_TYPE_a
	properties = properties or {}
	print("Made a window")

	local object = binder.Wrap(properties, {
		Visible = function(value: boolean)
			print("Set window visibility to:", value)
		end,
	})

	return binder.Apply(properties, object)
end

return interface
end function __DIST.E()--// Imports

local binder = __DIST.load('C')

--// Variables
local esp = {}

--// Initialize
return binder.Wrap(esp, {
	Enabled = function(value: boolean)
		print(`{value and "Enabled" or "Disabled"} ESP.`)
	end,
}) :: { Enabled: boolean }
end function __DIST.F()--// Imports

local flags = __DIST.load('B')
local interface = __DIST.load('D')
local esp = __DIST.load('E')

--// Initialize
local window = interface:Window({
	Visible = true,
})

return {
	Flags = flags,
	Esp = esp,
	Interface = interface,
	Window = window,

	Tabs = {
		Home = function(self)
			-- ....

			-- return tab
		end,

		Visuals = function(self)
			-- ....

			-- return tab
		end,

		Settings = function(self)
			-- ....

			-- return tab
		end,

		Config = function(self)
			-- ....

			-- return tab
		end,
	},
}
end function __DIST.G()--// Variables

local utility = {}

--// Initialize
function utility.GetPlayer(): Player?
	local success, result = pcall(function()
		return game:GetService("Players")
	end)

	return success and (result :: Players).LocalPlayer
end

function utility.GetCharacter(player: Player?): Model?
	local success, result = pcall(function()
		return player and player.Character
	end)

	return success and result
end

function utility.GetHumanoid(player: Player?): Humanoid?
	local success, result = pcall(function()
		local character = utility.GetCharacter(player)
		
		return character and character:FindFirstChildOfClass("Humanoid")
	end)

	return success and result
end

return utility
end function __DIST.H()--// Functions

local function cast(service: string): any
	return game:GetService(service)
end

--// Initialize
return {
	Players = cast("Players") :: Players,
}
end function __DIST.I()-- You can go even further by seperating tabs into different files, eg, Game 1/tabs/exploits.luau


return function(self)
	--// Imports
	local base = __DIST.load('F')
	local utility = __DIST.load('G')
	local services = __DIST.load('H')

	--// References
	local flags = base.Flags
	local esp = base.Esp
	local interface = base.Interface
	local window = base.Window
	local tabs = base.Tabs

	local localPlayer = utility.GetPlayer()

	local players = services.Players

	--// UI
	do -- Home
		tabs.Home(self)
	end

	do -- Exploits
		local tab = window:Tab({ Name = "Exploits" })

		tab:Toggle({
			Name = "Flight",
		})
	end

	do -- Visuals
		tabs.Visuals(self)
	end

	do -- Settings
		local tab = tabs.Settings(self)

		tab:Toggle({
			Name = "Dark Mode",
		})
	end

	do -- Config
		tabs.Config(self)
	end

	--// Initialize
	window.Title = self.Name
end
end end-- This is an autoloader, you can make this a GUI if you want.

--// Unload UI cũ mỗi lần execute script mới (tránh trùng cửa sổ)

local oldUI = _G.ScriptHub_UI
if typeof(oldUI) == "table" and typeof(oldUI.Unload) == "function" then
	pcall(oldUI.Unload, oldUI)
end
_G.ScriptHub_UI = nil

--// Variables
local routes = {
	{
		Name = "DungeonQuest",
		Load = __DIST.load('A'),
		UniverseId = 9931749389,
		Places = {
			77649408247578,
			3220968688,
			2414851778,
		},
	},

	{
		Name = "Game 2",
		Load = __DIST.load('I'),
		Places = {
			123456789,
			987654321,
		},
	},
}

--// Chờ game info sẵn sàng (tránh inject sớm làm GameId/PlaceId chưa đúng -> route không khớp)
for _ = 1, 300 do
	if game.GameId ~= 0 and game.PlaceId ~= 0 then break end
	task.wait(0.1)
end

--// Initialize
for _, route in pairs(routes) do
	if route.Places then
		for _, placeId in ipairs(route.Places) do
			if placeId == game.PlaceId then
				return route:Load()
			end
		end
	end

	if route.UniverseId and route.UniverseId == game.GameId then
		return route:Load()
	end
end