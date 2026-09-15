--!nocheck
--!nolint

--[[
    @authors YOUR_NAME
    @repository YOUR_REPOSITORY

    This file was automatically generated with darklua, it is not intended for manual editing.
--]]

_P = {
    genDate = "2026-09-15T01:25:58.765182200+00:00",
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
	sidebar.Size = Settings.SidebarWidth and UDim2.new(0, Settings.SidebarWidth, 1, 0) or UDim2.fromScale(0.325, 1)

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
				local ok, err = pcall(function()
					if v.Callback then
						v.Callback()
					end
				end)

				dialogOut()

				if not ok then
					warn("[Dialog] Button callback error: " .. tostring(err))
				end
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
				if MacLib.Options[Flag] and data.state ~= nil then
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

		MacLib.LoadingConfig = true
		MacLib.contextData = decoded.contextData or {}

		for _, option in next, decoded.objects do
			if ClassParser[option.type] then
				pcall(function() 
					ClassParser[option.type].Load(option.flag, option) 
				end)
			end
		end

		task.delay(1, function()
			MacLib.LoadingConfig = false
		end)

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

return MacLib end function __DIST.b()-- Owns resources that must be released when the hub is unloaded or executed again.

local lifecycle = {
	cleaned = false,
	callbacks = {},
}

function lifecycle.Register(callback)
	if type(callback) ~= "function" then return function() end end
	if lifecycle.cleaned then
		pcall(callback)
		return function() end
	end

	table.insert(lifecycle.callbacks, callback)
	return function()
		for index, registered in ipairs(lifecycle.callbacks) do
			if registered == callback then
				table.remove(lifecycle.callbacks, index)
				break
			end
		end
	end
end

function lifecycle.Cleanup()
	if lifecycle.cleaned then return end
	lifecycle.cleaned = true
	for index = #lifecycle.callbacks, 1, -1 do
		pcall(lifecycle.callbacks[index])
	end
	table.clear(lifecycle.callbacks)
end

function lifecycle.IsActive()
	return not lifecycle.cleaned
end

return lifecycle
end function __DIST.c()-- Hàm thông báo an toàn dùng chung cho DungeonQuest.
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
end function __DIST.d()-- Auto-save config cho DungeonQuest: tự động lưu mỗi khi control thay đổi,
-- không cần bấm "Overwrite" thủ công. Chỉ lưu khi có config active đang chọn.

--// Imports

local macLib = __DIST.load('a')
local notifier = __DIST.load('c')

--// Table
local autoSave = {}

--// Variables
local activeConfig = nil
local saveQueued = false
local suspended = false

function autoSave.Suspend()
	suspended = true
	saveQueued = false
end

function autoSave.Resume()
	suspended = false
end

function autoSave.IsSuspended()
	return suspended or (macLib.LoadingConfig == true)
end

-- Cập nhật tên config đang active (gọi từ Config tab khi chọn/tạo/tải config)
function autoSave.SetActive(name)
	activeConfig = (typeof(name) == "string" and #name > 0) and name or nil
end

function autoSave.GetActive()
	return activeConfig
end

-- Fallback: nếu chưa có config active (không bấm chọn trong tab Configs) nhưng có
-- config autoload trong autoload.txt thì dùng luôn tên đó -> đảm bảo mọi slider/
-- toggle đều được lưu mà không phụ thuộc thứ tự khởi tạo tab.
local function resolveActiveConfig()
	if activeConfig then return activeConfig end

	local folder = macLib.Folder
	local path = folder .. "/settings/autoload.txt"
	if not (isfile and readfile) then return nil end
	if isfile(path) then
		local ok, name = pcall(readfile, path)
		if ok and typeof(name) == "string" and #name > 0 then
			activeConfig = name
			return activeConfig
		end
	end
	return nil
end

-- Lưu ngay lập tức (gọi trực tiếp)
function autoSave.SaveNow()
	if autoSave.IsSuspended() then return end
	local name = resolveActiveConfig()
	if not name then return end

	local success, err = macLib:SaveConfig(name)
	if not success and err and err ~= "Please select a config file." then
		notifier.Notify("AutoSave", "Không lưu được config: " .. tostring(err), 3)
	end
end

-- Lưu có debounce: dồn nhiều thay đổi (vd kéo slider) thành 1 lần lưu
function autoSave.Save()
	if autoSave.IsSuspended() then return end
	if not resolveActiveConfig() then return end
	if saveQueued then return end
	saveQueued = true

	task.delay(0.5, function()
		saveQueued = false
		if not autoSave.IsSuspended() and autoSave.GetActive() then
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
end function __DIST.e()-- Cache toàn bộ services + tham chiếu LocalPlayer dùng chung cho DungeonQuest.

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
end function __DIST.f()-- Engine dùng chung cho DungeonQuest: quản lý state, tracking dungeon/kẻ địch,
-- speed và các API cho module chuyên biệt (webhook, ESP...)
-- thao tác lên module này để tránh circular dependency.

--// Imports

local services = __DIST.load('e')
local lifecycle = __DIST.load('b')

--// References
local player = services.player

--// Constants
local AUTO_KEY_HOLD_TIME = 0.05

--// Folder in ReplicatedStorage that contains enemy projectile models for ESP.
local PROJECTILE_FOLDER = "enemyProjectiles"

local GUI_UPDATE_INTERVAL = 0.5

--// Table
local shared = {}

--// State
local humanoid = nil
local rootPart = nil

local enabled = false
local fastSpeed = 16
local normalSpeed = 16
local instantAccelEnabled = true
local isSettingSpeed = false

local dungeonStartTime = nil

--// Boss state (dựa trên "boss room": room chỉ chứa đúng 1 enemy).
--// Boss room = room có duy nhất 1 quái; bossActive = đang ở boss room.
local bossActive = false
local bossCallbacks = {}
local bossRoomRef = nil --// room model của boss hiện tại (tránh đếm lại cùng room)

--// Chỉ số boss hiện tại trong 1 dungeon (thường 1 dungeon có 3 boss).
--// Tăng 1 mỗi lần bước vào boss room mới (boss 1 = 1); reset về 0 khi vào dungeon mới.
local bossIndex = 0
local bossIndexCallbacks = {}

--// Room index: số room hiện tại, lấy từ TÊN room có quái ("room<so>").
--// Reset khi vào dungeon mới.
local roomIndex = 0
local roomIndexCallbacks = {}

local dungeon = nil
local trackedRooms = {}
local trackedEnemies = {}
local roomConnections = {}
local enemyConnections = {}
local pendingModels = {}
local enemyCount = 0
--// Thông báo khi tập enemy track THAY ĐỔI (thêm/xoá). Dùng cho luồng event-driven:
--// module pathfinder thay vì poll theo interval thì subscribe sự kiện này để recompute target tức thì.
local enemyChangedCallbacks = {}
local function fireEnemyChanged()
	for i = #enemyChangedCallbacks, 1, -1 do
		pcall(enemyChangedCallbacks[i])
	end
end

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
local initializeRooms
local resetDungeon
local refreshRoomIndex

--// Respawn hooks & Invulnerability tracking
local respawnCallbacks = {}
local cleanupConnections = {}
local speedConnection = nil
local diedConnection = nil
local lastRespawnTime = 0
local respawnProtectionDuration = 4.0 -- Thời gian bất tử mặc định sau khi hồi sinh (giây)
local wasDead = false

local function trackCleanupConnection(connection)
	if connection then table.insert(cleanupConnections, connection) end
	return connection
end

function shared.OnRespawn(callback)
	table.insert(respawnCallbacks, callback)
end

function shared.GetLastRespawnTime()
	return lastRespawnTime
end

function shared.GetRespawnProtectionDuration()
	return respawnProtectionDuration
end

function shared.SetRespawnProtectionDuration(seconds)
	if type(seconds) == "number" and seconds >= 0 then
		respawnProtectionDuration = seconds
	end
end

function shared.GetRespawnProtectionRemaining()
	if lastRespawnTime == 0 then return 0 end
	local elapsed = os.clock() - lastRespawnTime
	local remaining = respawnProtectionDuration - elapsed
	return math.max(0, remaining)
end

function shared.IsJustRespawned(gracePeriodSeconds)
	local period = gracePeriodSeconds or respawnProtectionDuration
	if lastRespawnTime == 0 then return false end
	return (os.clock() - lastRespawnTime) <= period
end

function shared.WasDead()
	return wasDead
end

function shared.IsDead()
	local char = player and player.Character
	if not char or not char.Parent then return true end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if not hum or hum.Health <= 0 then return true end
	return false
end

--// Kiểm tra xem nhân vật hiện tại có đang trong trạng thái BẤT TỬ (Invulnerable) không
--// Hỗ trợ: ForceField của Roblox, Tag/Attribute chuẩn của game, và Bộ đếm bảo vệ sau khi hồi sinh
function shared.IsInvulnerable()
	local char = player and player.Character
	if not char or not char.Parent then return false, nil end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then
		return false, nil -- Khi đã chết thì không tính là bất tử
	end

	-- 1. Kiểm tra ForceField nguyên bản của Roblox
	local ff = char:FindFirstChildOfClass("ForceField")
	if ff and ff.Visible ~= false then
		return true, "ForceField"
	end

	-- 2. Kiểm tra Attribute hoặc Tag của game (chỉ nhận khi có giá trị true chính xác)
	local attrInvuln = char:GetAttribute("Invulnerable")
	local attrImmune = char:GetAttribute("Immune")
	local attrRespawn = char:GetAttribute("Respawning")
	if attrInvuln == true or attrImmune == true or attrRespawn == true then
		return true, "Attribute"
	end

	-- 3. Kiểm tra BoolValue của game (chỉ nhận khi đúng là BoolValue và Value == true)
	local valInvuln = char:FindFirstChild("Invulnerable")
	local valImmune = char:FindFirstChild("Immune")
	local valRespawn = char:FindFirstChild("Respawning")
	if (valInvuln and valInvuln:IsA("BoolValue") and valInvuln.Value == true)
		or (valImmune and valImmune:IsA("BoolValue") and valImmune.Value == true)
		or (valRespawn and valRespawn:IsA("BoolValue") and valRespawn.Value == true) then
		return true, "Value"
	end

	-- 4. Kiểm tra Thời gian bảo vệ sau khi hồi sinh thực sự (chỉ tính qua CharacterAdded)
	local remaining = shared.GetRespawnProtectionRemaining()
	if remaining > 0 then
		return true, ("Respawn Shield (%.1fs)"):format(remaining)
	end

	return false, nil
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
	fireEnemyChanged()
	refreshRoomIndex()
end

--// Tìm room (con trực tiếp của dungeon) chứa model.
local function getEnemyRoom(model)
	if not dungeon or not model then return nil end
	local parent = model.Parent
	while parent do
		if parent == dungeon then return nil end
		if parent.Parent == dungeon and (parent:IsA("Folder") or parent:IsA("Model")) then
			return parent
		end
		parent = parent.Parent
	end
	return nil
end

local function trackEnemy(enemy)
	if not isValidEnemy(enemy) or trackedEnemies[enemy] then return end
	local root = getModelRoot(enemy)
	local enemyHumanoid = enemy:FindFirstChildOfClass("Humanoid")
	if not root or not enemyHumanoid then return end

	trackedEnemies[enemy] = { Model = enemy, Root = root, Humanoid = enemyHumanoid, Room = getEnemyRoom(enemy) }
	enemyCount += 1
	enemyConnections[enemy] = { Died = enemyHumanoid.Died:Connect(function() untrackEnemy(enemy) end) }
	fireEnemyChanged()
	refreshRoomIndex()
end

local function waitAndTrackModel(model)
	if not model then return end
	if isValidEnemy(model) then trackEnemy(model); return end
	if pendingModels[model] then return end
	pendingModels[model] = true
	task.spawn(function()
		local timeout = os.clock() + 2
		while model.Parent and os.clock() < timeout do
			if isValidEnemy(model) then
				pendingModels[model] = nil
				trackEnemy(model)
				return
			end
			task.wait(0.03)
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

	roomIndex = 0
	for i = #roomIndexCallbacks, 1, -1 do
		pcall(roomIndexCallbacks[i], roomIndex)
	end

	for _, room in ipairs(dungeon:GetChildren()) do
		if room:IsA("Folder") or room:IsA("Model") then trackRoom(room) end
	end

	--// Theo dõi cấp DUNGEON (không chỉ từng room): bắt được kẻ địch/room được thêm
	--// vào sau khi init (phòng sinh sau, respawn trong room chưa được track...).
	--// Không dùng DescendantAdded riêng cho từng room để tránh phát hiện trùng.
	roomConnections[dungeon] = {
		Added = dungeon.DescendantAdded:Connect(function(object)
			if object:IsA("Model") then
				waitAndTrackModel(object)
			elseif object:IsA("Humanoid") then
				local possibleModel = object:FindFirstAncestorOfClass("Model")
				if possibleModel then waitAndTrackModel(possibleModel) end
			end
		end),
		Removed = dungeon.DescendantRemoving:Connect(function(object)
			if object:IsA("Model") then untrackEnemy(object) end
		end),
	}
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

--// Speed state (Speed tab thao tác lên đây)
function shared.SetFastSpeed(value)
	fastSpeed = value
	if enabled and humanoid and humanoid.Parent then
		if humanoid.WalkSpeed < fastSpeed then
			isSettingSpeed = true
			humanoid.WalkSpeed = fastSpeed
			isSettingSpeed = false
		end
	end
end

function shared.SetSpeedEnabled(state)
	enabled = state
	if humanoid and humanoid.Parent then
		isSettingSpeed = true
		if enabled then
			if humanoid.WalkSpeed < fastSpeed then
				humanoid.WalkSpeed = fastSpeed
			end
		else
			humanoid.WalkSpeed = normalSpeed
		end
		isSettingSpeed = false
	end
end

function shared.IsSpeedEnabled()
	return enabled
end

function shared.GetFastSpeed()
	return fastSpeed
end

function shared.SetInstantAccelEnabled(state)
	instantAccelEnabled = state and true or false
end

function shared.IsInstantAccelEnabled()
	return instantAccelEnabled
end

--// Humanoid setup
local function connectSpeedListener()
	if speedConnection then
		speedConnection:Disconnect()
		speedConnection = nil
	end
	if not humanoid or not humanoid.Parent then return end
	speedConnection = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
		if isSettingSpeed then return end
		if not humanoid or not humanoid.Parent then return end
		local curSpeed = humanoid.WalkSpeed
		if enabled then
			-- Floor Speed / Anti-Slow: Nếu tốc độ hiện tại thấp hơn fastSpeed (ví dụ 16 hoặc bị làm chậm),
			-- ta ép lên mức sàn fastSpeed. Nhưng nếu game buff tốc cao hơn (ví dụ skill buff lên 24),
			-- ta giữ nguyên để người chơi được hưởng trọn vẹn buff của game mà không bị bóp nghẹt.
			if curSpeed < fastSpeed then
				isSettingSpeed = true
				humanoid.WalkSpeed = fastSpeed
				isSettingSpeed = false
			end
		else
			normalSpeed = curSpeed
		end
	end)
end

function shared.SetHumanoid(character)
	if not character then return end
	local newHumanoid = character:WaitForChild("Humanoid", 10)
	if not newHumanoid then return end

	humanoid = newHumanoid
	rootPart = character:WaitForChild("HumanoidRootPart", 10) or character.PrimaryPart
	normalSpeed = humanoid.WalkSpeed
	if enabled and humanoid.WalkSpeed < fastSpeed then
		isSettingSpeed = true
		humanoid.WalkSpeed = fastSpeed
		isSettingSpeed = false
	end

	if diedConnection then
		diedConnection:Disconnect()
		diedConnection = nil
	end
	diedConnection = humanoid.Died:Connect(function()
		wasDead = true
	end)

	trackCleanupConnection(humanoid.HealthChanged:Connect(function(health)
		if health <= 0 then
			wasDead = true
		elseif wasDead and health > 0 then
			wasDead = false
		end
	end))
end

--// Instant Movement (Acceleration)
local function updateInstantMovement()
	if not lifecycle.IsActive() then return end
	if not instantAccelEnabled then return end
	if not humanoid or not humanoid.Parent or humanoid.Health <= 0 or humanoid.Sit then return end
	if not rootPart or not rootPart.Parent then
		local char = player and player.Character
		rootPart = char and char:FindFirstChild("HumanoidRootPart")
		if not rootPart then return end
	end
	if rootPart.Anchored then return end

	local moveDir = humanoid.MoveDirection
	local curVel = rootPart.AssemblyLinearVelocity

	if moveDir.Magnitude > 0.05 then
		local targetSpeed = enabled and math.max(fastSpeed, humanoid.WalkSpeed) or humanoid.WalkSpeed
		rootPart.AssemblyLinearVelocity = Vector3.new(
			moveDir.X * targetSpeed,
			curVel.Y,
			moveDir.Z * targetSpeed
		)
	end
end

if services.RunService then
	local simEvent = services.RunService.PreSimulation or services.RunService.Heartbeat
	if simEvent then
		trackCleanupConnection(simEvent:Connect(updateInstantMovement))
	end
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

--// Ensures dungeon tracking is ready.
function shared.ReadyDungeon()
	if not dungeon and not initializeRooms() then return false end
	return true
end

function shared.GetHumanoid()
	return humanoid
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

--// Trả về mảng dữ liệu enemy đang track (Model, Root, Humanoid) để ESP Enemy dùng.
function shared.GetTrackedEnemyData()
	local out = {}
	for model, data in pairs(trackedEnemies) do
		if data and data.Root and data.Root.Parent then
			out[#out + 1] = data
		end
	end
	return out
end

--// Event-driven: đăng ký callback chạy khi tập enemy track thay đổi (thêm/xoá).
--// Trả về hàm huỷ callback.
function shared.OnEnemyChanged(callback)
	if type(callback) ~= "function" then return function() end end
	table.insert(enemyChangedCallbacks, callback)
	return function()
		for i, cb in ipairs(enemyChangedCallbacks) do
			if cb == callback then table.remove(enemyChangedCallbacks, i) break end
		end
	end
end

--// Returns enemy projectile names from ReplicatedStorage.enemyProjectiles for ESP.
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

function shared.GetKeyHoldTime()
	return AUTO_KEY_HOLD_TIME
end

--// Initialization: character hiện tại + listeners
if player and player.Character and player.Character.Parent then
	shared.SetHumanoid(player.Character)
	connectSpeedListener()
else
	local character = player and player.CharacterAdded and task.spawn(function()
		local char = player.CharacterAdded:Wait()
		if char and lifecycle.IsActive() then shared.SetHumanoid(char); connectSpeedListener() end
	end)
end

if player then
	trackCleanupConnection(player.CharacterAdded:Connect(function(character)
		local ok, err = pcall(function()
			if not character then return end
			lastRespawnTime = os.clock()
			shared.SetHumanoid(character)
			connectSpeedListener()

			for _, callback in ipairs(respawnCallbacks) do
				pcall(callback)
			end
		end)
		if not ok then warn("[Shared] respawn handler error:", tostring(err)) end
	end))
end

--// Dungeon watcher
task.spawn(function()
	while lifecycle.IsActive() do
		task.wait(GUI_UPDATE_INTERVAL)
		local currentDungeon = workspace:FindFirstChild("dungeon")
		if dungeon and currentDungeon ~= dungeon then
			resetDungeon()
		elseif not dungeon and currentDungeon then
			initializeRooms()
		end
		--// Cập nhật room hiện tại khi dungeon/enemy thay đổi.
		refreshRoomIndex()
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
	while lifecycle.IsActive() do
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
	while lifecycle.IsActive() do
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

--// Re-scan định kỳ: reconcile trackedEnemies với nội dung dungeon hiện tại.
--// Đảm bảo bắt được kẻ địch mà cơ chế event (DescendantAdded) bỏ lỡ do timing
--// (Humanoid Health = 0 lúc sinh, room tạo sau init...) -> hết "không thấy kẻ địch".
local lastRescan = 0
local RESCAN_INTERVAL = 2
task.spawn(function()
	while lifecycle.IsActive() do
		task.wait(RESCAN_INTERVAL)
		local now = os.clock()
		if now - lastRescan < RESCAN_INTERVAL then continue end
		lastRescan = now
		if not dungeon then continue end
		local ok = pcall(function()
			for _, room in ipairs(dungeon:GetChildren()) do
				if room:IsA("Folder") or room:IsA("Model") then
					for _, object in ipairs(room:GetDescendants()) do
						if object:IsA("Model") then
							waitAndTrackModel(object)
						end
					end
				end
			end
			cleanupEnemies()
		end)
		if not ok then
			warn("[EnemyTracker] rescan error")
		end
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

--// Xác định loại mục tiêu đang đánh để áp setting theo context:
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

--// Đọc số room từ tên (room1 -> 1, room12 -> 12...). Trả 0 nếu không khớp.
local function parseRoomNumber(name)
	if type(name) ~= "string" then return 0 end
	local lower = string.lower(name)
	local bossMatch = string.match(lower, "boss.*(%d+)")
	if bossMatch then
		return 100 + (tonumber(bossMatch) or 1)
	end
	if string.find(lower, "boss") then
		return 100 + math.max(1, bossIndex)
	end
	local number = string.match(name, "^room(%d+)$")
	if not number then return 0 end
	return tonumber(number) or 0
end

--// Tính room hiện tại: room chứa enemy đang track còn sống.
--// Game clear theo kiểu tuần tự: xong quái room này mới spawn quái room sau, nên
--// tại 1 thời điểm chỉ có đúng 1 room có quái -> room của bất kỳ quái đang track
--// chính là room hiện tại (không cần scan theo khoảng cách).
--// Room nhận diện qua TÊN "room<so>" (room1, room2...). Không có enemy/dungeon -> 0.
--// Fallback phòng Boss: nếu bossActive = true, trả về 100 + math.max(1, bossIndex) (101, 102...).
local function computeRoomIndex()
	if not dungeon then return 0 end
	for model, data in pairs(trackedEnemies) do
		if data and data.Room then
			local idx = parseRoomNumber(data.Room.Name)
			if idx > 0 then return idx end
		end
	end
	if bossActive then
		return 100 + math.max(1, bossIndex)
	end
	return 0
end

--// Đồng bộ roomIndex hiện tại, fire callback nếu đổi.
refreshRoomIndex = function()
	local newIndex = computeRoomIndex()
	if newIndex == roomIndex then return end
	roomIndex = newIndex
	for i = #roomIndexCallbacks, 1, -1 do
		pcall(roomIndexCallbacks[i], roomIndex)
	end
end

function shared.GetCurrentRoomIndex()
	return roomIndex
end

function shared.OnRoomIndexChanged(callback)
	if type(callback) ~= "function" then return function() end end
	table.insert(roomIndexCallbacks, callback)
	return function()
		for i, cb in ipairs(roomIndexCallbacks) do
			if cb == callback then table.remove(roomIndexCallbacks, i) break end
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
	end
	for i = #bossCallbacks, 1, -1 do
		pcall(bossCallbacks[i], bossActive)
	end
	refreshRoomIndex()
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
			if bossHealthRef:IsA("ScreenGui") then
				trackCleanupConnection(bossHealthRef:GetPropertyChangedSignal("Enabled"):Connect(scanBossGui))
			elseif bossHealthRef:IsA("GuiObject") then
				trackCleanupConnection(bossHealthRef:GetPropertyChangedSignal("Visible"):Connect(scanBossGui))
			end
		end
		local visible = if found:IsA("ScreenGui") then found.Enabled elseif found:IsA("GuiObject") then found.Visible else true
		setBossActive(visible)
	else
		bossHealthRef = nil
		setBossActive(false)
	end
end

task.spawn(function()
	if not player then return end
	local playerGui = player:WaitForChild("PlayerGui", 30)
	if not playerGui then return end

	trackCleanupConnection(playerGui.DescendantAdded:Connect(scanBossGui))
	trackCleanupConnection(playerGui.DescendantRemoving:Connect(scanBossGui))
	scanBossGui()

	--// Poll an toàn phòng trường hợp DescendantRemoving bỏ sót khi GUI bị xóa cục bộ
	while lifecycle.IsActive() and task.wait(0.5) do
		scanBossGui()
	end
end)

lifecycle.Register(function()
	if speedConnection then speedConnection:Disconnect(); speedConnection = nil end
	for _, connection in ipairs(cleanupConnections) do
		pcall(function() connection:Disconnect() end)
	end
	table.clear(cleanupConnections)
	resetDungeon()
end)

--// Table
return shared
end function __DIST.g()-- Tiện ích UI dùng chung cho các tab DungeonQuest (Maclib).

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

-- Fix: Maclib Dropdown Load gọi UpdateSelection(đã lưu) và IM LẶNG BỎ QUA nếu tên
-- option không còn trong danh sách hiện tại -> config bị mất khi load lại (đặc biệt
-- với danh sách dungeon động). Patch UpdateSelection: tự chèn option còn thiếu
-- (insertMissing=true) hoặc fallback chuyển sang option hợp lệ đầu tiên để không bao
-- giờ rơi vào trạng thái selection rỗng.
function ui.PatchDropdownRestore(dropdownElement, insertMissing)
	if not dropdownElement or type(dropdownElement.UpdateSelection) ~= "function" then return dropdownElement end
	local originalUpdateSelection = dropdownElement.UpdateSelection
	dropdownElement.UpdateSelection = function(self, newSelection)
		if type(newSelection) == "string" and newSelection ~= "" and not self:IsOption(newSelection) then
			if insertMissing then
				pcall(function()
					self:InsertOptions({ newSelection })
				end)
			else
				local opts = self.Settings and self.Settings.Options
				if type(opts) == "table" and #opts > 0 then
					newSelection = opts[1]
				else
					local firstOption = next(self:GetOptions())
					if firstOption then newSelection = firstOption end
				end
			end
		end
		originalUpdateSelection(self, newSelection)
	end
	return dropdownElement
end

return ui
end function __DIST.h()-- Phím tắt: chuột phải kích hoạt combo Q+E (toggle enabled qua tab Auto Farm).

--// Imports

local services = __DIST.load('e')
local shared = __DIST.load('f')
local lifecycle = __DIST.load('b')

--// References
local UserInputService = services.UserInputService
local VirtualInputManager = services.VirtualInputManager

--// Table
local shortcuts = {}

--// Bật/tắt tính năng ẩn: chuột phải kích hoạt combo Q+E.
local comboEnabled = false
local inputConnection = nil

function shortcuts.IsMouseComboEnabled()
	return comboEnabled
end

function shortcuts.SetMouseComboEnabled(value)
	comboEnabled = value == true
end

--// Kích hoạt combo E+Q (giống Auto Skill): gửi Q+E giữ theo chu kỳ hold.
--// Khi kích hoạt từ E vật lý / chuột phải, game tự nhận phím chính, nên chỉ cần
--// bấm thêm phím còn lại giữ đúng chu kỳ hold để 2 phím bắt đúng thời điểm.
local function fireCombo()
	task.spawn(function()
		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
		task.wait(shared.GetKeyHoldTime())
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
	end)
end

--// Initialize
function shortcuts.Init()
	if shortcuts.inited then return end
	shortcuts.inited = true

	inputConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			if UserInputService:GetFocusedTextBox() then return end
			if comboEnabled then
				fireCombo()
			end
		end
	end)

end

lifecycle.Register(function()
	if inputConnection then inputConnection:Disconnect(); inputConnection = nil end
	shortcuts.inited = false
end)

return shortcuts
end function __DIST.i()-- Module Player trong tab Combat (DungeonQuest).

--// Imports

local shared = __DIST.load('f')
local ui = __DIST.load('g')
local autoSave = __DIST.load('d')
local shortcuts = __DIST.load('h')

return function(window, tab)
	local section = tab:Section({ Side = "Right" })
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
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(Value)
			shared.SetFastSpeed(Value)
		end),
	}, "Slider_FastSpeed"))

	section:Toggle({
		Name = "Instant Acceleration (Max Speed tức thì)",
		Default = shared.IsInstantAccelEnabled(),
		Callback = autoSave.Wrap(function(state)
			shared.SetInstantAccelEnabled(state)
		end),
	}, "Toggle_InstantAcceleration")

	section:Header({ Name = "Shortcuts" })

	section:Toggle({
		Name = "Right Click Combo (Q+E)",
		Default = shortcuts.IsMouseComboEnabled(),
		Callback = autoSave.Wrap(function(state)
			shortcuts.SetMouseComboEnabled(state)
		end),
	}, "Toggle_MouseCombo")
endend function __DIST.j()-- HazardScanner - Geometry & Danger Zones (DungeonQuest).
-- Range quét: chỉ X-Z (bỏ hẳn Y - chiêu đánh cả sàn).
-- Zone = union per-part: mỗi BasePart còn rõ (Transparency <= 0.85) trở thành 1 vùng con
-- (vòng tròn nếu Ball/Cylinder, OBB nếu box/union/mesh). Query point nặng 1 vùng con
-- nào là dính hazard. Broad phase: distSq tới bounding radius -> reject nhanh.
-- HazardZones cache trong info, nhưng mỗi vùng con vẫn re-check part còn sống lúc query
-- (part mờ > 0.85 tự ngừng gây nguy hiểm).

--// Table

local geometry = {}

--// State
local FADE_TRANSPARENCY_THRESHOLD = 0.85
local hazardPadding = 0.0 -- Mặc định = 0.0 (vừa khít 100% với kích thước thực tế của part)
local data = nil
local paddingChangedCallbacks = {}

--// Gioi han so vung con toi da 1 hazard (chong DoS qua nhieu part/mot object)
local MAX_PARTS_PER_HAZARD = 64

--// Data source do detection bom vao (tranh vong phu thuoc)
function geometry.BindDetection(dataSource)
	data = dataSource or nil
end

function geometry.GetHazardPadding()
	return hazardPadding
end
geometry.GetHitboxPadding = geometry.GetHazardPadding

--// Xoa toan bo HazardZones cache tren cac hazard hien tai
function geometry.InvalidateCache()
	if data and data.GetActiveHazardsMap then
		for _, info in pairs(data.GetActiveHazardsMap()) do
			info.HazardZones = nil
		end
	end
end

function geometry.OnPaddingChanged(callback)
	if type(callback) == "function" then
		table.insert(paddingChangedCallbacks, callback)
	end
end

function geometry.SetHazardPadding(value)
	if type(value) == "number" and value >= 0 and value ~= hazardPadding then
		hazardPadding = value
		geometry.InvalidateCache()
		for _, cb in ipairs(paddingChangedCallbacks) do
			pcall(cb, hazardPadding)
		end
	end
end
geometry.SetHitboxPadding = geometry.SetHazardPadding

--// Danh sách ngoại lệ: các đối tượng (theo tên hoặc từ khóa) bị xem là Box/Mesh
--// nhưng thực tế nên được vẽ và tính toán thành VÙNG TRÒN (Circle Danger Zone).
local FORCE_CIRCLE_NAMES = {
	"firstBossCrissCross",
	"firstBossBigSpike",
	"firstBossSeekingSpikes",
}

local function isForceCircle(hazardName)
	if not hazardName or type(hazardName) ~= "string" then return false end
	local clean = hazardName:lower():gsub("%s+", "")
	if #clean == 0 then return false end
	for _, target in ipairs(FORCE_CIRCLE_NAMES) do
		local cleanTarget = target:lower():gsub("%s+", "")
		if #cleanTarget > 0 and string.find(clean, cleanTarget, 1, true) then
			return true
		end
	end
	return false
end

function geometry.IsForceCircle(hazardName)
	return isForceCircle(hazardName)
end

function geometry.AddForceCircleName(name)
	if type(name) == "string" and #name > 0 then
		table.insert(FORCE_CIRCLE_NAMES, name)
		geometry.InvalidateCache()
	end
end

function geometry.GetForceCircleNames()
	return FORCE_CIRCLE_NAMES
end

--// Kiem tra part con hoat dong (khong mo qua nguong, con nam trong Workspace)
local function isPartAlive(part)
	return part and part.Parent and part.Transparency <= FADE_TRANSPARENCY_THRESHOLD
end

--// Tinh zone con cho 1 BasePart theo shape:
--// - Part Ball/Cylinder HOẶC nằm trong danh sách ngoại lệ (isForceCircle) -> vong tron X-Z (radius = 1/2 cạnh vuông)
--// - Box / Union / Mesh  -> OBB theo CFrame
local function computePartZone(part, forceCircle)
	local size = part.Size
	if forceCircle or (part:IsA("Part") and (part.Shape == Enum.PartType.Ball or part.Shape == Enum.PartType.Cylinder)) then
		return { radius = math.max(size.X, size.Y, size.Z) / 2 }
	end

	local half = Vector3.new(math.max(size.X, 0) / 2 + hazardPadding, 0, math.max(size.Z, 0) / 2 + hazardPadding)
	return { half = half, cframe = part.CFrame }
end

--// Kiem tra diem P (X-Z) hoac vong tron ban kinh extraRadius co giao thoa voi 1 zone con khong
local function isPointInZone(point, zone, extraRadius)
	if not zone then return false end
	local px, pz = point.X, point.Z
	extraRadius = extraRadius or 0

	if zone.radius then
		local pos = (zone.part and zone.part.Parent) and zone.part.Position
		local cx = pos and pos.X or zone.cx or 0
		local cz = pos and pos.Z or zone.cz or 0
		local dx = px - cx
		local dz = pz - cz
		local r = zone.radius + hazardPadding + extraRadius
		return (dx * dx + dz * dz) <= (r * r)
	end

	local cf = (zone.part and zone.part.Parent) and zone.part.CFrame or zone.cframe
	if cf then
		local localPoint = cf:PointToObjectSpace(point)
		local halfX = zone.half.X
		local halfZ = zone.half.Z

		if extraRadius <= 0 then
			return math.abs(localPoint.X) <= halfX and math.abs(localPoint.Z) <= halfZ
		else
			-- Giao thoa chính xác giữa Vòng tròn Player (bán kính extraRadius) với Hộp OBB
			local dx = math.max(0, math.abs(localPoint.X) - halfX)
			local dz = math.max(0, math.abs(localPoint.Z) - halfZ)
			return (dx * dx + dz * dz) <= (extraRadius * extraRadius)
		end
	end

	return false
end

--// Chuan bi danh sach zone + bounding radius cua 1 hazard (cache vao info.HazardZones)
local function buildHazardZones(hazardInfo)
	if not hazardInfo or not hazardInfo.Instance or not hazardInfo.Instance.Parent then return nil end

	local instance = hazardInfo.Instance
	local hazardName = hazardInfo.Name or (instance and instance.Name) or ""
	local forceCircle = isForceCircle(hazardName)
	local parts

	if instance:IsA("BasePart") then
		if not isPartAlive(instance) then return nil end
		parts = { instance }
	else
		parts = {}
		for _, desc in ipairs(instance:GetDescendants()) do
			if #parts >= MAX_PARTS_PER_HAZARD then break end
			if desc:IsA("BasePart") and isPartAlive(desc) and desc.Parent then
				parts[#parts + 1] = desc
			end
		end
		if #parts == 0 then return nil end
	end

	local zones = {}
	local minX, maxX, minZ, maxZ = math.huge, -math.huge, math.huge, -math.huge

	for _, part in ipairs(parts) do
		local pos = part.Position
		local size = part.Size
		local radius2D = math.max(size.X, size.Y, size.Z) / 2 + hazardPadding

		minX = math.min(minX, pos.X - radius2D)
		maxX = math.max(maxX, pos.X + radius2D)
		minZ = math.min(minZ, pos.Z - radius2D)
		maxZ = math.max(maxZ, pos.Z + radius2D)

		local zone = computePartZone(part, forceCircle)
		if zone then
			if zone.radius then
				zone.cx, zone.cz = pos.X, pos.Z
			end
			zone.part = part
			zones[#zones + 1] = zone
		end
	end

	if #zones == 0 then return nil end

	local centerX = (minX + maxX) / 2
	local centerZ = (minZ + maxZ) / 2
	local halfX = (maxX - minX) / 2
	local halfZ = (maxZ - minZ) / 2

	return {
		zones = zones,
		center = Vector3.new(centerX, 0, centerZ),
		boundingRadius = math.sqrt(halfX * halfX + halfZ * halfZ),
	}
end

--// Lay hoac cache HazardZones cho 1 hazard
local function getHazardZones(info)
	local zones = info and info.HazardZones
	if not zones then
		zones = buildHazardZones(info)
		if zones and info then info.HazardZones = zones end
	end
	return zones
end

function geometry.GetHazardZones(info)
	return getHazardZones(info)
end

--// Lấy danh sách các Hazards nằm trong phạm vi maxRadius xung quanh origin (Broad-Phase Spatial Culling)
function geometry.GetNearbyHazards(origin, maxRadius)
	local det = data
	if not det then return {} end
	maxRadius = maxRadius or 65

	local nearby = {}
	local ox, oz = origin.X, origin.Z

	for _, info in pairs(det.GetActiveHazardsMap()) do
		local inst = info.Instance
		local hazardZones = getHazardZones(info)
		if hazardZones then
			local cx = hazardZones.center.X
			local cz = hazardZones.center.Z
			if inst and inst.Parent then
				local livePart = inst:IsA("BasePart") and inst or inst.PrimaryPart or inst:FindFirstChildWhichIsA("BasePart")
				if livePart then
					cx = livePart.Position.X
					cz = livePart.Position.Z
				end
			end

			local dx = ox - cx
			local dz = oz - cz
			local distSq = dx * dx + dz * dz
			local totalReach = maxRadius + hazardZones.boundingRadius
			if distSq <= totalReach * totalReach then
				table.insert(nearby, info)
			end
		end
	end

	return nearby
end

--// Query: kiem tra diem P (hoac vong tron player ban kinh extraRadius) co dính hazard nao khong
--// Tra ve: hit (bool), hazardInfo (gan nhat), hitPart
function geometry.IsPointInAnyHazard(point, ignoredInstance, extraRadius, hazardList)
	local det = data
	if not det then return false, nil, nil end
	extraRadius = extraRadius or 0

	local bestDistSq = math.huge
	local foundInfo, foundPart = nil, nil
	local list = hazardList or det.GetActiveHazardsMap()

	for key, info in pairs(list) do
		local inst = info.Instance or (typeof(key) == "Instance" and key)
		if ignoredInstance and (ignoredInstance == inst or (inst and ignoredInstance.Name == inst.Name)) then
			continue
		end

		local hazardZones = getHazardZones(info)
		if not hazardZones then continue end

		-- Broad phase: reject nhanh bang distSq to center (uu tien vi tri part thoi gian thuc)
		local cx = hazardZones.center.X
		local cz = hazardZones.center.Z
		if inst and inst.Parent then
			local livePart = inst:IsA("BasePart") and inst or inst.PrimaryPart or inst:FindFirstChildWhichIsA("BasePart")
			if livePart then
				cx = livePart.Position.X
				cz = livePart.Position.Z
			end
		end

		local dx = point.X - cx
		local dz = point.Z - cz
		local distSq = dx * dx + dz * dz
		local totalBounding = hazardZones.boundingRadius + extraRadius
		if distSq > totalBounding * totalBounding then
			continue
		end

		-- Narrow phase: union per-part, re-check part con song
		for i = 1, #hazardZones.zones do
			local zone = hazardZones.zones[i]
			if isPartAlive(zone.part) and isPointInZone(point, zone, extraRadius) then
				local d2 = (point - zone.part.Position).Magnitude
				if d2 < bestDistSq then
					bestDistSq = d2
					foundInfo = info
					foundPart = zone.part
				end
				break
			end
		end
	end

	return foundPart ~= nil, foundInfo, foundPart
end

return geometry end function __DIST.k()-- HazardScanner – Visualizer: Vẽ trực quan vùng toán học (Ground Visualizer)
-- dựa trên mô hình hình học của geometry.luau (đã bao gồm Hitbox Padding).
-- Hỗ trợ vẽ đĩa tròn phẳng (CylinderHandleAdornment) cho Ball/Cylinder
-- và hộp chữ nhật phẳng (BoxHandleAdornment) cho Box/OBB.

--// Imports
--// Imports

local services = __DIST.load('e')
local lifecycle = __DIST.load('b')
local geometry = __DIST.load('j')

local RunService = services.RunService or game:GetService("RunService")
local player = services.player

--// Table
local visualizer = {}

--// State
local enabled = false
local data = nil
local activeVisuals = {} -- [hazardInfo] = { items = {}, adornments = {}, connections = {} }
local heartbeatConnection = nil

--// Constants
local FADE_TRANSPARENCY_THRESHOLD = 0.85
local ZONE_COLOR = Color3.fromRGB(255, 45, 45)
local ZONE_TRANSPARENCY = 0.55
local GROUND_THICKNESS = 0.25

--// Lay do cao mat san theo chan nguoi choi tai thoi diem ve
local function getPlayerGroundY()
	local char = player and player.Character
	if not char then return nil end
	local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
	if not root then return nil end
	return root.Position.Y - 2.5
end

--// Gán data source từ detection (tránh circular dependency)
function visualizer.BindDetection(dataSource)
	data = dataSource or nil
end

function visualizer.IsEnabled()
	return enabled
end

--// Cập nhật vị trí và góc xoay của một Adornment ghim thẳng đứng xuống mặt đất mỗi frame
local function updateVisualCFrame(item, targetY)
	local part = item.part
	local ad = item.ad
	if not part or not part.Parent or not ad or not ad.Parent then return end

	local worldPos = part.Position
	local worldTargetPos = Vector3.new(worldPos.X, targetY or worldPos.Y, worldPos.Z)

	if item.isCircle then
		-- Đĩa tròn: Cố định nằm ngang hoàn toàn trên mặt phẳng World X-Z
		local desiredWorldCFrame = CFrame.new(worldTargetPos) * CFrame.Angles(math.rad(90), 0, 0)
		ad.CFrame = part.CFrame:ToObjectSpace(desiredWorldCFrame)
	else
		-- Hộp OBB: Giữ hướng quay Yaw trên sàn, triệt tiêu Pitch/Roll
		local _, yaw, _ = part.CFrame:ToOrientation()
		local desiredWorldCFrame = CFrame.new(worldTargetPos) * CFrame.Angles(0, yaw, 0)
		ad.CFrame = part.CFrame:ToObjectSpace(desiredWorldCFrame)
	end
end

--// Vòng lặp Heartbeat: Ghim toàn bộ visual thẳng đứng xuống mặt đất liên tục mỗi frame
local function onHeartbeat()
	if not enabled then return end
	local hasAny = false
	local targetY = getPlayerGroundY()

	for info, record in pairs(activeVisuals) do
		if not info.Instance or not info.Instance.Parent then
			visualizer.DetachZoneVisuals(info)
		else
			hasAny = true
			if record.items then
				for _, item in ipairs(record.items) do
					updateVisualCFrame(item, targetY)
				end
			end
		end
	end

	if not hasAny and heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
end

local function ensureHeartbeat()
	if not heartbeatConnection and enabled then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

--// Xóa visual của một hazard
function visualizer.DetachZoneVisuals(hazardInfo)
	if not hazardInfo then return end
	local record = activeVisuals[hazardInfo]
	if not record then return end

	if record.adornments then
		for _, ad in ipairs(record.adornments) do
			pcall(function() ad:Destroy() end)
		end
		table.clear(record.adornments)
	end

	if record.connections then
		for _, c in ipairs(record.connections) do
			pcall(function() c:Disconnect() end)
		end
		table.clear(record.connections)
	end

	if record.items then
		table.clear(record.items)
	end

	activeVisuals[hazardInfo] = nil
end

--// Vẽ visual cho một hazard (Ghim thẳng đứng xuống mặt đất)
function visualizer.AttachZoneVisuals(hazardInfo)
	if not enabled or not hazardInfo then return end
	if activeVisuals[hazardInfo] then
		visualizer.DetachZoneVisuals(hazardInfo)
	end

	local hazardZones = geometry.GetHazardZones(hazardInfo)
	if not hazardZones or not hazardZones.zones then return end

	local padding = geometry.GetHitboxPadding()
	local targetY = getPlayerGroundY()
	local items = {}
	local adornments = {}
	local connections = {}

	for _, zone in ipairs(hazardZones.zones) do
		local part = zone.part
		if part and part.Parent and part.Transparency <= FADE_TRANSPARENCY_THRESHOLD then
			local ad = nil
			local isCircle = false

			if zone.radius then
				isCircle = true
				local cyl = Instance.new("CylinderHandleAdornment")
				cyl.Name = "HazardGroundCircle"
				cyl.Adornee = part
				cyl.Radius = zone.radius + padding
				cyl.Height = GROUND_THICKNESS
				cyl.Color3 = ZONE_COLOR
				cyl.Transparency = ZONE_TRANSPARENCY
				cyl.ZIndex = 2
				cyl.AlwaysOnTop = true
				cyl.Parent = part
				ad = cyl
			elseif zone.half and zone.cframe then
				local box = Instance.new("BoxHandleAdornment")
				box.Name = "HazardGroundBox"
				box.Adornee = part
				box.Size = Vector3.new(zone.half.X * 2, GROUND_THICKNESS, zone.half.Z * 2)
				box.Color3 = ZONE_COLOR
				box.Transparency = ZONE_TRANSPARENCY
				box.ZIndex = 2
				box.AlwaysOnTop = true
				box.Parent = part
				ad = box
			end

			if ad then
				local item = {
					ad = ad,
					part = part,
					isCircle = isCircle,
					zone = zone,
				}
				updateVisualCFrame(item, targetY)
				table.insert(items, item)
				table.insert(adornments, ad)

				-- Tự động destroy visual khi part mờ dần
				local conn = part:GetPropertyChangedSignal("Transparency"):Connect(function()
					if part.Parent and part.Transparency > FADE_TRANSPARENCY_THRESHOLD then
						pcall(function() ad:Destroy() end)
					end
				end)
				table.insert(connections, conn)
			end
		end
	end

	if #adornments > 0 then
		activeVisuals[hazardInfo] = {
			items = items,
			adornments = adornments,
			connections = connections,
		}
		ensureHeartbeat()
	end
end

--// Xóa toàn bộ visual
function visualizer.ClearAll()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	for info in pairs(activeVisuals) do
		visualizer.DetachZoneVisuals(info)
	end
	table.clear(activeVisuals)
end

--// Refresh lại toàn bộ visual đang hoạt động
function visualizer.RefreshAll()
	visualizer.ClearAll()
	if not enabled or not data then return end

	for _, info in pairs(data.GetActiveHazardsMap()) do
		visualizer.AttachZoneVisuals(info)
	end
end

--// Bật / tắt Ground Visualizer
function visualizer.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		visualizer.RefreshAll()
	else
		visualizer.ClearAll()
	end
end

--// Lang nghe thay doi padding de refresh visual
geometry.OnPaddingChanged(function()
	if enabled then
		visualizer.RefreshAll()
	end
end)

--// Dọn dẹp khi script shutdown
lifecycle.Register(function()
	visualizer.ClearAll()
end)

return visualizer
end function __DIST.l()-- HazardScanner – Trajectory Visualizer (DungeonQuest):
-- Dự báo và vẽ đường quỹ đạo nguy hiểm (Orange Trajectory Corridor) tĩnh cho các chiêu thức đang di chuyển.
-- Chiều dài dải cam được cố định theo cấu hình slider (predictionLength).
-- Vùng màu cam được đối xử như một Danger Zone thực thụ: bất kỳ điểm nào nằm trong hành lang cam đều là Nguy Hiểm,
-- buộc hệ thống tìm Safe Spot bước ngang thoát hoàn toàn ra ngoài quỹ đạo đạn (Side-Step Escape).

--// Imports

local services = __DIST.load('e')
local lifecycle = __DIST.load('b')
local geometry = __DIST.load('j')

local RunService = services.RunService or game:GetService("RunService")
local player = services.player

--// Table
local trajectory = {}

--// State
local enabled = false
local data = nil
local predictionLength = 45 -- studs (chiều dài dải visual hiển thị quỹ đạo đạn)
local activeRecords = {} -- [hazardInfo] = { ad = BoxHandleAdornment, mainPart = BasePart, connections = {}, lastPos = Vector3, lastClock = number, velocity = Vector3, dir = Vector3, isMoving = boolean }
local heartbeatConnection = nil

--// Constants
local FADE_TRANSPARENCY_THRESHOLD = 0.85
local TRAJECTORY_COLOR = Color3.fromRGB(255, 140, 0) -- Màu cam nổi bật
local TRAJECTORY_TRANSPARENCY = 0.65
local GROUND_THICKNESS = 0.20
local MOVING_SPEED_THRESHOLD = 3.5 -- studs/s (ngưỡng tốc độ để coi là đang di chuyển)

--// Lấy độ cao mặt sàn theo chân người chơi
local function getPlayerGroundY()
	local char = player and player.Character
	if not char then return nil end
	local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
	if not root then return nil end
	return root.Position.Y - 2.5
end

--// Gán data source từ detection (tránh circular dependency)
function trajectory.BindDetection(dataSource)
	data = dataSource or nil
end

function trajectory.IsEnabled()
	return enabled
end

function trajectory.GetPredictionLength()
	return predictionLength
end

function trajectory.SetPredictionLength(val)
	if type(val) == "number" and val > 0 then
		predictionLength = math.clamp(val, 10, 200)
		trajectory.RefreshAll()
	end
end

--// Tính trọng tâm (Centroid) và Độ rộng bao quát thực tế (Span Width) vuông góc với hướng di chuyển
--// Sử dụng định lý chiếu OBB (Separating Axis Theorem): chiếu chính xác 3 trục của từng Part lên vector pháp tuyến normal
local function getHazardCentroidAndSpan(hazardInfo, dir)
	local inst = hazardInfo.Instance
	if not inst or not inst.Parent then return nil, 4 end

	local padding = geometry.GetHitboxPadding()
	local parts = {}
	local hazardName = hazardInfo.Name or (inst and inst.Name) or ""
	local forceCircle = geometry.IsForceCircle and geometry.IsForceCircle(hazardName)

	if inst:IsA("BasePart") then
		if inst.Transparency <= FADE_TRANSPARENCY_THRESHOLD then
			table.insert(parts, inst)
		end
	else
		for _, desc in ipairs(inst:GetDescendants()) do
			if desc:IsA("BasePart") and desc.Parent and desc.Transparency <= FADE_TRANSPARENCY_THRESHOLD then
				table.insert(parts, desc)
			end
		end
	end

	if #parts == 0 then return nil, 4 end

	-- Vector pháp tuyến vuông góc với hướng bay trên mặt sàn X-Z: normal = (-dir.Z, 0, dir.X)
	local normal = Vector3.new(-dir.Z, 0, dir.X)
	local minProjN, maxProjN = math.huge, -math.huge
	local sumProjU = 0

	for _, p in ipairs(parts) do
		local pos = p.Position
		local s = p.Size

		-- Bán kính chiếu nửa bề rộng (Half-extent) lên vector normal
		local halfExtent = 0
		if forceCircle or (p:IsA("Part") and (p.Shape == Enum.PartType.Ball or p.Shape == Enum.PartType.Cylinder)) then
			halfExtent = math.max(s.X, s.Y, s.Z) / 2
		else
			-- Định lý chiếu OBB khi bay thẳng: r = hx * |Right . n| + hy * |Up . n| + hz * |Look . n|
			local cf = p.CFrame
			local rx = cf.RightVector
			local ry = cf.UpVector
			local rz = cf.LookVector
			local hx = s.X / 2
			local hy = s.Y / 2
			local hz = s.Z / 2
			halfExtent = hx * math.abs(rx.X * normal.X + rx.Z * normal.Z)
				+ hy * math.abs(ry.X * normal.X + ry.Z * normal.Z)
				+ hz * math.abs(rz.X * normal.X + rz.Z * normal.Z)
		end

		local projN = pos.X * normal.X + pos.Z * normal.Z
		minProjN = math.min(minProjN, projN - halfExtent)
		maxProjN = math.max(maxProjN, projN + halfExtent)

		local projU = pos.X * dir.X + pos.Z * dir.Z
		sumProjU += projU
	end

	-- Bề rộng chuẩn xác = (max - min) + 2 * padding
	local spanWidth = math.max(1, (maxProjN - minProjN) + padding * 2)

	-- Tọa độ trung tâm chiếu: trung điểm khoảng cách trên trục normal và trung bình trên trục dir
	local centerN = (minProjN + maxProjN) / 2
	local centerU = sumProjU / #parts

	-- Tái lập vector tọa độ tâm trong không gian thế giới
	local centerBase = dir * centerU + normal * centerN

	return centerBase, spanWidth
end

--// Cập nhật vị trí và góc xoay của dải quỹ đạo màu cam đối xứng hoàn hảo
local function updateTrajectoryCFrame(ad, mainPart, centroid, dir, targetY, length, width)
	if not mainPart or not mainPart.Parent or not ad or not ad.Parent then return end

	-- Tâm của dải quỹ đạo bắt đầu từ trọng tâm toàn hazard và kéo dài về phía trước (centroid + dir * (length / 2))
	local halfLength = length / 2
	local centerPos = Vector3.new(
		centroid.X + dir.X * halfLength,
		targetY or centroid.Y,
		centroid.Z + dir.Z * halfLength
	)

	-- LookAt theo hướng di chuyển dir
	local targetLook = centerPos + Vector3.new(dir.X, 0, dir.Z)
	local desiredWorldCFrame = CFrame.lookAt(centerPos, targetLook)
	local localCFrame = mainPart.CFrame:ToObjectSpace(desiredWorldCFrame)

	ad.CFrame = localCFrame
	ad.Size = Vector3.new(width, GROUND_THICKNESS, length)
	if not ad.Visible then ad.Visible = true end
end

--// Vòng lặp Heartbeat: theo dõi hướng di chuyển và ghim dải quỹ đạo tĩnh
local function onHeartbeat()
	if not enabled then return end
	local hasAny = false
	local now = os.clock()
	local targetY = getPlayerGroundY()

	for info, record in pairs(activeRecords) do
		local inst = info.Instance
		if not inst or not inst.Parent then
			trajectory.DetachTrajectoryVisuals(info)
		else
			hasAny = true
			local mainPart = record.mainPart
			if mainPart and mainPart.Parent then
				local currentPos = mainPart.Position
				local dt = now - (record.lastClock or now)

				-- Cập nhật hướng di chuyển định kỳ (mỗi ~0.035s)
				if dt >= 0.035 then
					local delta = currentPos - (record.lastPos or currentPos)
					local speed = delta.Magnitude / dt
					local hDelta = Vector3.new(delta.X, 0, delta.Z)
					local hSpeed = hDelta.Magnitude / dt

					if hSpeed >= MOVING_SPEED_THRESHOLD then
						record.isMoving = true
						record.dir = hDelta.Unit
					else
						if dt >= 0.25 and speed < MOVING_SPEED_THRESHOLD then
							record.isMoving = false
						end
					end

					record.lastPos = currentPos
					record.lastClock = now
				end

				-- Nếu đang di chuyển, cập nhật visual quỹ đạo tĩnh theo predictionLength
				if record.isMoving and record.dir and record.ad then
					local centroid, spanWidth = getHazardCentroidAndSpan(info, record.dir)
					if centroid then
						updateTrajectoryCFrame(record.ad, mainPart, centroid, record.dir, targetY, predictionLength, spanWidth)
					end
				else
					if record.ad and record.ad.Visible then
						record.ad.Visible = false
					end
				end
			end
		end
	end

	if not hasAny and heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
end

local function ensureHeartbeat()
	if not heartbeatConnection and enabled then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

--// Gỡ visual quỹ đạo của một hazard
function trajectory.DetachTrajectoryVisuals(hazardInfo)
	if not hazardInfo then return end
	local record = activeRecords[hazardInfo]
	if not record then return end

	if record.ad then
		pcall(function() record.ad:Destroy() end)
		record.ad = nil
	end

	if record.connections then
		for _, c in ipairs(record.connections) do
			pcall(function() c:Disconnect() end)
		end
		table.clear(record.connections)
	end

	activeRecords[hazardInfo] = nil
end

--// Gắn visual quỹ đạo cho một hazard
function trajectory.AttachTrajectoryVisuals(hazardInfo)
	if not enabled or not hazardInfo then return end
	if activeRecords[hazardInfo] then
		trajectory.DetachTrajectoryVisuals(hazardInfo)
	end

	local inst = hazardInfo.Instance
	if not inst or not inst.Parent then return end

	local mainPart = nil
	if inst:IsA("BasePart") then
		mainPart = inst
	else
		mainPart = inst.PrimaryPart or inst:FindFirstChildWhichIsA("BasePart")
		if not mainPart then
			for _, desc in ipairs(inst:GetDescendants()) do
				if desc:IsA("BasePart") and desc.Parent then
					mainPart = desc
					break
				end
			end
		end
	end

	if not mainPart or not mainPart.Parent then return end

	local box = Instance.new("BoxHandleAdornment")
	box.Name = "HazardTrajectoryCorridor"
	box.Adornee = mainPart
	box.Size = Vector3.new(4, GROUND_THICKNESS, predictionLength)
	box.Color3 = TRAJECTORY_COLOR
	box.Transparency = TRAJECTORY_TRANSPARENCY
	box.ZIndex = 1 -- Nằm dưới đĩa đỏ (ZIndex = 2)
	box.AlwaysOnTop = true
	box.Visible = false -- Tạm ẩn cho đến khi đo được hướng di chuyển thực tế
	box.Parent = mainPart

	local connections = {}
	local conn = mainPart:GetPropertyChangedSignal("Transparency"):Connect(function()
		if mainPart.Parent and mainPart.Transparency > FADE_TRANSPARENCY_THRESHOLD then
			pcall(function() box:Destroy() end)
		end
	end)
	table.insert(connections, conn)

	activeRecords[hazardInfo] = {
		ad = box,
		connections = connections,
		mainPart = mainPart,
		lastPos = mainPart.Position,
		lastClock = os.clock(),
		velocity = Vector3.zero,
		dir = nil,
		isMoving = false,
	}

	ensureHeartbeat()
end

--// Xóa toàn bộ visual quỹ đạo
function trajectory.ClearAll()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	for info in pairs(activeRecords) do
		trajectory.DetachTrajectoryVisuals(info)
	end
	table.clear(activeRecords)
end

--// Refresh lại toàn bộ visual quỹ đạo
function trajectory.RefreshAll()
	trajectory.ClearAll()
	if not enabled or not data then return end

	for _, info in pairs(data.GetActiveHazardsMap()) do
		trajectory.AttachTrajectoryVisuals(info)
	end
end

--// Kiểm tra xem điểm P (hoặc vòng tròn bán kính extraRadius) có đang nằm trong hành lang nguy hiểm màu cam hay không.
--// Lấy danh sách các Trajectory Records nằm trong phạm vi maxRadius xung quanh origin (Broad-Phase Spatial Culling)
function trajectory.GetNearbyTrajectories(origin, maxRadius)
	maxRadius = maxRadius or 65
	local nearby = {}
	local ox, oz = origin.X, origin.Z

	for info, record in pairs(activeRecords) do
		if record.isMoving and record.dir and record.mainPart and record.mainPart.Parent then
			local centroid, spanWidth = getHazardCentroidAndSpan(info, record.dir)
			if centroid and spanWidth then
				local cx = centroid.X
				local cz = centroid.Z
				local dx = ox - cx
				local dz = oz - cz
				local distSq = dx * dx + dz * dz
				local totalReach = maxRadius + predictionLength + (spanWidth / 2)
				if distSq <= totalReach * totalReach then
					table.insert(nearby, { info = info, record = record })
				end
			end
		end
	end

	return nearby
end

--// Kiểm tra xem điểm P (hoặc vòng tròn bán kính extraRadius) có đang nằm trong hành lang nguy hiểm màu cam hay không.
--// Đối xử vùng màu cam như một Danger Zone thực thụ: Bất kỳ điểm nào giao thoa với vùng cam đều là NGUY HIỂM.
function trajectory.IsPointInAnyTrajectory(point, extraRadius, trajectoryList)
	local px, pz = point.X, point.Z
	extraRadius = extraRadius or 0

	if trajectoryList then
		for _, item in ipairs(trajectoryList) do
			local info = item.info
			local record = item.record
			if record and record.isMoving and record.dir and record.mainPart and record.mainPart.Parent then
				local centroid, spanWidth = getHazardCentroidAndSpan(info, record.dir)
				if centroid and spanWidth then
					local dir = record.dir
					local normal = Vector3.new(-dir.Z, 0, dir.X)
					local vx = px - centroid.X
					local vz = pz - centroid.Z

					local projU = vx * dir.X + vz * dir.Z
					local projN = vx * normal.X + vz * normal.Z
					local halfWidth = spanWidth / 2

					if extraRadius <= 0 then
						if projU >= 0 and projU <= predictionLength and math.abs(projN) <= halfWidth then
							return true, info
						end
					else
						local dU = 0
						if projU < 0 then
							dU = -projU
						elseif projU > predictionLength then
							dU = projU - predictionLength
						end
						local dN = math.max(0, math.abs(projN) - halfWidth)
						if (dU * dU + dN * dN) <= (extraRadius * extraRadius) then
							return true, info
						end
					end
				end
			end
		end
		return false, nil
	end

	for info, record in pairs(activeRecords) do
		if record.isMoving and record.dir and record.mainPart and record.mainPart.Parent then
			local centroid, spanWidth = getHazardCentroidAndSpan(info, record.dir)
			if centroid and spanWidth then
				local dir = record.dir
				local normal = Vector3.new(-dir.Z, 0, dir.X)
				local vx = px - centroid.X
				local vz = pz - centroid.Z

				-- Chiếu tọa độ điểm P lên trục di chuyển U và trục pháp tuyến N
				local projU = vx * dir.X + vz * dir.Z
				local projN = vx * normal.X + vz * normal.Z
				local halfWidth = spanWidth / 2

				-- Kiểm tra giao thoa hình học trực tiếp với dải hình hộp màu cam cố định
				if extraRadius <= 0 then
					if projU >= 0 and projU <= predictionLength and math.abs(projN) <= halfWidth then
						return true, info
					end
				else
					local dU = 0
					if projU < 0 then
						dU = -projU
					elseif projU > predictionLength then
						dU = projU - predictionLength
					end
					local dN = math.max(0, math.abs(projN) - halfWidth)
					if (dU * dU + dN * dN) <= (extraRadius * extraRadius) then
						return true, info
					end
				end
			end
		end
	end

	return false, nil
end

--// Bật / tắt Trajectory Visualizer
function trajectory.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		trajectory.RefreshAll()
	else
		trajectory.ClearAll()
	end
end

--// Lắng nghe thay đổi padding để refresh visual
geometry.OnPaddingChanged(function()
	if enabled then
		trajectory.RefreshAll()
	end
end)

--// Dọn dẹp khi shutdown
lifecycle.Register(function()
	trajectory.ClearAll()
end)

return trajectory
end function __DIST.m()-- HazardScanner – Module: Threat Detection Engine (DungeonQuest).
-- Đơn giản hóa hoàn toàn: chỉ phát hiện đối tượng skill xuất hiện trong Workspace
-- qua ChildAdded/ChildRemoved, CHỈ chạy sau sự kiện start dungeon (không còn ở lobby),
-- và vẽ SelectionBox đơn giản cho từng đối tượng được xác định.
-- Không còn trajectory / whitelist / boss orb / ngoại lệ / hitbox padding / tên 3D.

--// Imports

local services = __DIST.load('e')
local shared = __DIST.load('f')
local lifecycle = __DIST.load('b')
local geometry = __DIST.load('j')
local visualizer = __DIST.load('k')
local trajectory = __DIST.load('l')

--// References
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = services.player

--// Table
local detection = {}

--// State
local enabled = false
local inDungeon = false
local selectionBoxesEnabled = true
local logHazards = false
local logFailed = false
local inspectTargetName = ""
local inspectEnabled = false
local activeHazards = {} -- [Instance] = { Name, Class, Distance, Boxes = {} }
local hazardCount = 0
local hazardChangedCallbacks = {}
local lastHazardInfo = nil
local connections = {}
local roomCleanup = nil

--// Danh sách folder template trong ReplicatedStorage: các đối tượng clone từ đây
--// xuất hiện trong Workspace sẽ KHÔNG được vẽ box.
local IGNORE_FOLDERS = { "abilities", "projectiles" }
local ignoreNamesLoaded = false
local ignoreNames = {} -- [cleanName] = true

local function loadIgnoreNames()
	if ignoreNamesLoaded then return end
	ignoreNamesLoaded = true
	for _, folderName in ipairs(IGNORE_FOLDERS) do
		local folder = ReplicatedStorage:FindFirstChild(folderName)
		if folder then
			for _, obj in ipairs(folder:GetChildren()) do
				local clean = (obj.Name or ""):lower():gsub("%s+", "")
				if #clean > 0 then ignoreNames[clean] = true end
			end
		end
	end
end

local function isIgnoredName(instance)
	if not instance then return false end
	local clean = (instance.Name or ""):lower():gsub("%s+", "")
	return #clean > 0 and ignoreNames[clean] == true
end

--// Kiểm tra xem instance có phải là nhân vật người chơi (LocalPlayer hoặc đồng đội) không
local function isPlayerCharacter(instance)
	if not instance then return false end
	if Players:GetPlayerFromCharacter(instance) then return true end
	if Players:FindFirstChild(instance.Name) then return true end
	for _, p in ipairs(Players:GetPlayers()) do
		if instance.Name == p.Name then return true end
		local c = p.Character
		if c and (instance == c or instance:IsDescendantOf(c)) then
			return true
		end
	end
	local char = player and player.Character
	if char and (instance == char or instance:IsDescendantOf(char)) then return true end
	return false
end

--// Fire callback thay đổi hazard (count, lastInfo)
local function fireHazardChanged()
	local count = 0
	for _ in pairs(activeHazards) do count += 1 end
	hazardCount = count
	for i = #hazardChangedCallbacks, 1, -1 do
		pcall(hazardChangedCallbacks[i], count, lastHazardInfo)
	end
end

--// Ngưỡng coi như part đã mờ hoàn toàn -> không vẽ box
local FADE_TRANSPARENCY_THRESHOLD = 0.85

--// Retry: object xuất hiện nhưng chưa kịp khởi tạo đủ parts (DescendantAdded đến sau
--// ChildAdded). Retry tối đa MAX_REGISTER_RETRIES lần mỗi khi có descendant mới.
local MAX_REGISTER_RETRIES = 50
local RETRY_INTERVAL = 0.05
local retryStates = {} -- [Instance] = { active = boolean, count = number }

local function stopRetry(instance)
	local state = retryStates[instance]
	if state then
		state.active = false
		retryStates[instance] = nil
	end
end

local function stopAllRetries()
	for _, state in pairs(retryStates) do
		if state then state.active = false end
	end
	table.clear(retryStates)
end

--// Lay danh sach BasePart cua instance (BasePart -> chinh no; Model / Folder -> cac BasePart descendant)
--// Chỉ lấy part còn rõ (Transparency <= 0.85)
local function getBaseParts(instance)
	if not instance then return {} end
	local parts = {}
	local function addPart(part)
		if part and part.Parent and part.Transparency <= FADE_TRANSPARENCY_THRESHOLD then
			parts[#parts + 1] = part
		end
	end
	if instance:IsA("BasePart") then
		addPart(instance)
	else
		for _, desc in ipairs(instance:GetDescendants()) do
			if desc:IsA("BasePart") and desc.Parent then
				addPart(desc)
			end
		end
	end
	return parts
end

--// Khoang cach tu player den instance (studs, lam tron)
local function computeDistance(instance)
	local char = player and player.Character
	if not char then return 0 end
	local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
	if not root then return 0 end
	local rootPos = root.Position

	local pos
	if instance:IsA("BasePart") then
		pos = instance.Position
	elseif instance:IsA("Model") then
		local ok, pivot = pcall(function()
			return instance:GetPivot().Position
		end)
		if ok then
			pos = pivot
		else
			local part = instance:FindFirstChildWhichIsA("BasePart")
			pos = part and part.Position
		end
	end
	if not pos then return 0 end
	return math.floor((rootPos - pos).Magnitude + 0.5)
end

--// Tao va gan SelectionBox don gian len tung BasePart.
--// Khi part mo dan (Transparency > 0.85) thi box tu destroy.
local function attachSelectionBoxes(parts, fadeConnections)
	local boxes = {}
	for _, part in ipairs(parts) do
		if part and part.Parent then
			local box = Instance.new("SelectionBox")
			box.Name = "HazardSelectionBox"
			box.Color3 = Color3.fromRGB(255, 45, 45)
			box.SurfaceColor3 = Color3.fromRGB(255, 30, 30)
			box.SurfaceTransparency = 0.6
			box.LineThickness = 0.05
			box.Adornee = part
			box.Parent = part

			local connection = part:GetPropertyChangedSignal("Transparency"):Connect(function()
				if part.Parent and part.Transparency > FADE_TRANSPARENCY_THRESHOLD then
					pcall(function() box:Destroy() end)
				end
			end)
			if fadeConnections then table.insert(fadeConnections, connection) end

			boxes[#boxes + 1] = box
		end
	end
	return boxes
end

--// Specific Skill Deep Inspector
local function matchesInspectTarget(name)
	if not inspectEnabled or inspectTargetName == "" then return false end
	if not name or type(name) ~= "string" then return false end
	local cleanTarget = inspectTargetName:lower():gsub("%s+", "")
	if #cleanTarget == 0 then return false end
	local cleanName = name:lower():gsub("%s+", "")
	return string.find(cleanName, cleanTarget, 1, true) ~= nil
end

local function formatVector3(v)
	if not v then return "nil" end
	return ("(%.2f, %.2f, %.2f)"):format(v.X, v.Y, v.Z)
end

local function printDeepInspect(instance, eventType, extraReason, infoData)
	if not instance then return end
	local name = instance.Name
	if not matchesInspectTarget(name) then return end

	local class = instance.ClassName
	local parentPath = instance.Parent and instance.Parent:GetFullName() or "nil"
	local distance = computeDistance(instance)

	print("================== 🔍 [HAZARD DEEP INSPECT] 🔍 ==================")
	print(("  🎯 Target Name    : %s (%s)"):format(name, class))
	print(("  📌 Event Type     : %s%s"):format(eventType, extraReason and (" -> " .. tostring(extraReason)) or ""))
	print(("  📍 Full Path      : %s"):format(parentPath))
	print(("  📏 Dist to Player : %d studs"):format(distance))

	if eventType == "SPAWN" then
		local parts = {}
		if instance:IsA("BasePart") then
			table.insert(parts, instance)
		else
			for _, desc in ipairs(instance:GetDescendants()) do
				if desc:IsA("BasePart") then
					table.insert(parts, desc)
				end
			end
		end

		print(("  🧩 Total Parts (%d) :"):format(#parts))
		for idx, p in ipairs(parts) do
			local shapeStr = p:IsA("Part") and tostring(p.Shape.Name) or (p.ClassName == "MeshPart" and "MeshPart" or p.ClassName)
			print(("     [%d] %q (%s)"):format(idx, p.Name, p.ClassName))
			print(("         • Size: %s | Shape: %s | Trans: %.2f | CanCollide: %s"):format(
				formatVector3(p.Size),
				shapeStr,
				p.Transparency,
				tostring(p.CanCollide)
			))
			print(("         • Pos : %s"):format(formatVector3(p.Position)))
		end

		local hazardZones = geometry.GetHazardZones(infoData)
		if hazardZones and hazardZones.zones then
			local pad = geometry.GetHitboxPadding()
			print(("  📐 Math Geometry (Zones: %d, BoundingRadius: %.1f studs):"):format(
				#hazardZones.zones,
				hazardZones.boundingRadius or 0
			))
			for idx, z in ipairs(hazardZones.zones) do
				if z.radius then
					print(("     - Zone [%d]: Circle/Ball (Base Radius: %.2f + Pad: %.2f = %.2f studs)"):format(
						idx, z.radius, pad, z.radius + pad
					))
				elseif z.half then
					print(("     - Zone [%d]: Box/OBB (HalfSize: %s)"):format(
						idx, formatVector3(z.half)
					))
				end
			end
		end

		-- Bắt đầu theo dõi phân tích chuyển động xoay (Spinning Analysis)
		task.spawn(function()
			local targetPart = nil
			if instance:IsA("BasePart") then
				targetPart = instance
			elseif instance:IsA("Model") then
				targetPart = instance.PrimaryPart or instance:FindFirstChildWhichIsA("BasePart")
			end
			if not targetPart then return end

			local t0 = os.clock()
			local cf0 = targetPart.CFrame
			task.wait(0.12)

			if not instance.Parent or not targetPart.Parent then return end

			local t1 = os.clock()
			local cf1 = targetPart.CFrame
			local dt = t1 - t0
			if dt <= 0 then return end

			-- Delta trong hệ tọa độ Thế giới (World Space)
			local worldDelta = cf1 * cf0:Inverse()
			local worldAxis, worldAngle = worldDelta:ToAxisAngle()
			local worldDegPerSec = math.deg(worldAngle) / dt

			-- Delta trong hệ tọa độ Cục bộ (Local Space)
			local localDelta = cf0:Inverse() * cf1
			local localAxis, localAngle = localDelta:ToAxisAngle()

			if math.abs(math.deg(worldAngle)) >= 1.5 then
				local worldAxisDesc = "Trục tự do / Hỗn hợp"
				if math.abs(worldAxis.Y) >= 0.8 then
					worldAxisDesc = "Trục Y (Yaw - Quét ngang mặt sàn)"
				elseif math.abs(worldAxis.X) >= 0.8 then
					worldAxisDesc = "Trục X (Pitch - Lăn nhào lộn)"
				elseif math.abs(worldAxis.Z) >= 0.8 then
					worldAxisDesc = "Trục Z (Roll - Nghiêng lật bên)"
				end

				local localAxisDesc = "Trục tự do"
				if math.abs(localAxis.Y) >= 0.8 then
					localAxisDesc = "Trục Local Y"
				elseif math.abs(localAxis.X) >= 0.8 then
					localAxisDesc = "Trục Local X"
				elseif math.abs(localAxis.Z) >= 0.8 then
					localAxisDesc = "Trục Local Z"
				end

				print("================== 🔄 [INSPECT: SPINNING DETECTED] 🔄 ==================")
				print(("  🎯 Target Name    : %s (%s)"):format(instance.Name, targetPart.Name))
				print(("  ⚡ Tốc độ xoay    : %.2f °/s (%.2f rad/s)"):format(worldDegPerSec, worldAngle / dt))
				print(("  🌐 World Spin Axis: %s -> %s"):format(formatVector3(worldAxis), worldAxisDesc))
				print(("  🧩 Local Spin Axis: %s -> %s"):format(formatVector3(localAxis), localAxisDesc))
				print("========================================================================")
			end
		end)
	elseif eventType == "DESPAWN" then
		if infoData and infoData.SpawnClock then
			local elapsed = os.clock() - infoData.SpawnClock
			print(("  ⏱️ Lifetime Active: %.2f seconds"):format(elapsed))
		end
	elseif eventType == "REJECTED" then
		print(("  ⚠️ Rejection Reason: %s"):format(tostring(extraReason)))
	end
	print("================================================================")
end

--// Log đối tượng không vẽ được (bị loại qua gate hoặc không có gì để vẽ)
local function logReject(instance, reason)
	printDeepInspect(instance, "REJECTED", reason, nil)
	if not logFailed then return end
	local name = instance and instance.Name or "?"
	local class = instance and instance.ClassName or "?"
	print(("[HazardScanner][Reject] ⚪ %s (%s) — %s"):format(name, class, reason))
end

local registerHazard

--// Lên lịch retry khi object chưa đủ parts để vẽ (polling 10 lần, mỗi 0.05s).
--// In kết quả chi tiết từng lần retry ra console nếu đang inspect hoặc bật logFailed.
local function retryRegister(instance)
	if not instance or not instance.Parent then return end
	if isPlayerCharacter(instance) then return end
	if activeHazards[instance] then return end
	if retryStates[instance] then return end

	local state = { active = true, count = 0 }
	retryStates[instance] = state

	task.spawn(function()
		while state.active and instance.Parent and enabled and inDungeon do
			if isPlayerCharacter(instance) then
				stopRetry(instance)
				return
			end
			state.count += 1
			local allDesc = instance:GetDescendants()
			local validParts = getBaseParts(instance)

			local isTarget = matchesInspectTarget(instance.Name)
			if logFailed or isTarget then
				print(("[HazardScanner][Retry] 🔄 Lần %d/%d: %q (%s) | Descendants: %d | Valid Parts (Trans<=%.2f): %d"):format(
					state.count,
					MAX_REGISTER_RETRIES,
					instance.Name,
					instance.ClassName,
					#allDesc,
					FADE_TRANSPARENCY_THRESHOLD,
					#validParts
				))
			end

			if #validParts > 0 then
				if logFailed or isTarget then
					print(("[HazardScanner][Retry] ✅ Lần %d/%d: %q Đã tìm thấy %d part(s)! Tiến hành vẽ..."):format(
						state.count,
						MAX_REGISTER_RETRIES,
						instance.Name,
						#validParts
					))
				end
				stopRetry(instance)
				registerHazard(instance)
				return
			end

			if state.count >= MAX_REGISTER_RETRIES then
				logReject(instance, ("Hết %d lượt retry mà không tìm thấy BasePart hợp lệ (Descendants: %d)"):format(
					MAX_REGISTER_RETRIES,
					#allDesc
				))
				stopRetry(instance)
				return
			end

			task.wait(RETRY_INTERVAL)
		end
		stopRetry(instance)
	end)
end

--// Dang ky hazard: vẽ SelectionBox quanh moi object xuat hien trong Workspace
registerHazard = function(instance)
	if not enabled or not inDungeon then
		logReject(instance, "Chưa trong dungeon")
		return false
	end
	if not instance or not instance.Parent then
		logReject(instance, "Không còn Parent")
		return false
	end
	if isPlayerCharacter(instance) then
		logReject(instance, "Nhân vật người chơi (Player/Teammate)")
		return false
	end
	if activeHazards[instance] then return true end

	loadIgnoreNames()
	if isIgnoredName(instance) then
		logReject(instance, "Trùng tên trong ReplicatedStorage (abilities/projectiles)")
		return false
	end

	local parts = getBaseParts(instance)
	if #parts == 0 then
		logReject(instance, "Chưa có part để vẽ (sẽ retry)")
		retryRegister(instance)
		return false
	end

	local fadeConnections = {}
	local boxes = {}
	if selectionBoxesEnabled then
		boxes = attachSelectionBoxes(parts, fadeConnections)
	end
	local distance = computeDistance(instance)

	local info = {
		Instance = instance,
		Name = instance.Name,
		Class = instance.ClassName,
		Distance = distance,
		Boxes = boxes,
		Connections = fadeConnections,
		SpawnClock = os.clock(),
	}
	activeHazards[instance] = info
	lastHazardInfo = {
		Name = instance.Name,
		Class = instance.ClassName,
		Distance = distance,
	}

	if visualizer.IsEnabled() then
		visualizer.AttachZoneVisuals(info)
	end
	if trajectory.IsEnabled() then
		trajectory.AttachTrajectoryVisuals(info)
	end

	stopRetry(instance)

	printDeepInspect(instance, "SPAWN", "Passed all gates", info)

	if logHazards then
		print(("[HazardScanner][Hazard] 🔴 Hazard Detected: %s (%s, %d studs)")
			:format(instance.Name, instance.ClassName, distance))
	end
	fireHazardChanged()
	return true
end

--// Huy dong hazard: gỡ SelectionBox va xoa khoi activeHazards
local function unregisterHazard(instance, reason)
	local info = activeHazards[instance]
	if not info then
		stopRetry(instance)
		return
	end

	printDeepInspect(instance, "DESPAWN", reason, info)

	visualizer.DetachZoneVisuals(info)
	trajectory.DetachTrajectoryVisuals(info)

	if info.Boxes then
		for _, box in ipairs(info.Boxes) do
			pcall(function() box:Destroy() end)
		end
		table.clear(info.Boxes)
	end

	if info.Connections then
		for _, c in ipairs(info.Connections) do
			pcall(function() c:Disconnect() end)
		end
		table.clear(info.Connections)
	end

	activeHazards[instance] = nil

	if logHazards then
		local reasonStr = reason and (" (" .. reason .. ")") or ""
		print(("[HazardScanner][Hazard] 🟢 Hazard Expired: %s%s")
			:format(tostring(info.Name), reasonStr))
	end
	fireHazardChanged()
end

--// Xoa toan bo hazard hien tai
function detection.ClearAllHazards(reason)
	visualizer.ClearAll()
	trajectory.ClearAll()
	stopAllRetries()
	local toRemove = {}
	for inst in pairs(activeHazards) do
		table.insert(toRemove, inst)
	end
	for _, inst in ipairs(toRemove) do
		unregisterHazard(inst, reason)
	end
	if logHazards and reason then
		print(("[HazardScanner][Hazard] 🧹 All hazards cleared: %s"):format(reason))
	end
end

--// Bat dau quét: lang nghe ChildAdded/ChildRemoved cua Workspace (chi chay sau start dungeon)
function detection.StartScan()
	if enabled then return end
	enabled = true

	visualizer.BindDetection(detection)
	trajectory.BindDetection(detection)
	detection.ClearAllHazards("StartScan Reset")

	for _, c in ipairs(connections) do c:Disconnect() end
	table.clear(connections)

	table.insert(connections, Workspace.ChildAdded:Connect(function(child)
		if isPlayerCharacter(child) then return end
		registerHazard(child)
	end))

	table.insert(connections, Workspace.ChildRemoved:Connect(function(child)
		unregisterHazard(child, "Destroyed")
	end))

	-- Gate "start dungeon": dựa vào room index (0 = "Room--").
	-- CHỈ vẽ các child level 1 MỚI được add (qua ChildAdded) sau khi room >= 1.
	-- KHÔNG vẽ child level 1 có sẵn từ trước và KHÔNG vẽ child level 2.
	inDungeon = shared.GetCurrentRoomIndex() > 0

	if roomCleanup then pcall(roomCleanup); roomCleanup = nil end
	roomCleanup = shared.OnRoomIndexChanged(function(room)
		if room > 0 then
			inDungeon = true
		elseif room <= 0 and inDungeon then
			inDungeon = false
			detection.ClearAllHazards("Dungeon Ended")
		end
	end)

	if logHazards then
		print("[HazardScanner] 📡 Threat Detector started!")
	end
end

--// Dung quét: gỡ connection va dọn hazards
function detection.StopScan()
	enabled = false
	inDungeon = false

	for _, c in ipairs(connections) do c:Disconnect() end
	table.clear(connections)

	if roomCleanup then pcall(roomCleanup); roomCleanup = nil end

	detection.ClearAllHazards("StopScan")

	if logHazards then
		print("[HazardScanner] 🛑 Threat Detector stopped.")
	end
end

--// Public accessors
function detection.IsEnabled()
	return enabled
end

function detection.SetEnabled(state)
	if state then
		detection.StartScan()
	else
		detection.StopScan()
	end
end

function detection.SetSelectionBoxesEnabled(state)
	selectionBoxesEnabled = state and true or false
	if selectionBoxesEnabled then
		for inst, info in pairs(activeHazards) do
			if inst and inst.Parent and (not info.Boxes or #info.Boxes == 0) then
				local parts = getBaseParts(inst)
				info.Connections = info.Connections or {}
				info.Boxes = attachSelectionBoxes(parts, info.Connections)
			end
		end
	else
		for _, info in pairs(activeHazards) do
			if info.Boxes then
				for _, box in ipairs(info.Boxes) do
					pcall(function() box:Destroy() end)
				end
				table.clear(info.Boxes)
			end
		end
	end
end

function detection.IsSelectionBoxesEnabled()
	return selectionBoxesEnabled
end

function detection.SetLogHazards(state)
	logHazards = state and true or false
end

function detection.IsLogHazardsEnabled()
	return logHazards
end

function detection.SetLogFailed(state)
	logFailed = state and true or false
end

function detection.IsLogFailedEnabled()
	return logFailed
end

function detection.SetInspectTarget(name)
	inspectTargetName = type(name) == "string" and name or ""
end

function detection.GetInspectTarget()
	return inspectTargetName
end

function detection.SetInspectEnabled(state)
	inspectEnabled = state and true or false
end

function detection.IsInspectEnabled()
	return inspectEnabled
end

function detection.GetHazardCount()
	return hazardCount
end

function detection.GetActiveHazards()
	local list = {}
	for inst, data in pairs(activeHazards) do
		if inst and inst.Parent == Workspace then
			list[#list + 1] = data
		end
	end
	return list
end

function detection.GetActiveHazardsMap()
	return activeHazards
end

function detection.GetLastHazardInfo()
	return lastHazardInfo
end

function detection.OnHazardChanged(callback)
	if type(callback) ~= "function" then return end
	table.insert(hazardChangedCallbacks, callback)
end

--// Dong nap khi shutdown
lifecycle.Register(function()
	detection.StopScan()
	detection.ClearAllHazards("Shutdown")
end)

return detection end function __DIST.n()-- HazardScanner – Player Visualizer & Danger Detection (DungeonQuest).
-- Quản lý visual 2D hình tròn (filled) ghim dưới chân Player biểu thị hitbox 2D trên sàn
-- và liên tục kiểm tra xem Player có đang đứng trong vùng nguy hiểm (Ground Zone hoặc Trajectory Corridor) hay không.

--// Imports

local services = __DIST.load('e')
local lifecycle = __DIST.load('b')
local geometry = __DIST.load('j')
local trajectory = __DIST.load('l')

local RunService = services.RunService or game:GetService("RunService")
local player = services.player

--// Table
local playerVisual = {}

--// State
local visualEnabled = true
local isPlayerInDanger = false
local currentThreat = nil
local currentThreatType = nil
local statusCallbacks = {}
local heartbeatConnection = nil
local playerRadius = 1.8

--// Visual Handle
local playerAdornment = nil
local playerCharConnection = nil

--// Visual Colors & Styling
local COLOR_SAFE = Color3.fromRGB(0, 255, 170) -- Xanh ngọc / Cyan khi an toàn
local COLOR_DANGER = Color3.fromRGB(255, 35, 35) -- Đỏ tươi khi trong vùng nguy hiểm
local TRANSPARENCY_SAFE = 0.45
local TRANSPARENCY_DANGER = 0.20
local GROUND_THICKNESS = 0.20

local Players = game:GetService("Players")

--// Lấy HumanoidRootPart của người chơi (trả về nil nếu player đã chết)
local function getPlayerRoot()
	local lp = player or Players.LocalPlayer
	if not lp then return nil end
	local char = lp.Character
	if not char or not char.Parent then return nil end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then
		return nil -- Player đã chết
	end
	return char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
end

--// Lấy độ cao mặt sàn dưới chân người chơi
local function getPlayerGroundY(root)
	if not root then return 0 end
	return root.Position.Y - 2.5
end

--// Tạo hoặc lấy adornment đĩa tròn 2D dưới chân người chơi
local function ensureAdornment(root)
	if playerAdornment then
		-- Nếu adornment không thuộc về root hiện tại hoặc đã bị gỡ khỏi Workspace
		if playerAdornment.Parent ~= root or not playerAdornment:IsDescendantOf(workspace) then
			pcall(function() playerAdornment:Destroy() end)
			playerAdornment = nil
		else
			if playerAdornment.Adornee ~= root then
				playerAdornment.Adornee = root
			end
			return playerAdornment
		end
	end

	if not root or not root.Parent then return nil end

	local ad = Instance.new("CylinderHandleAdornment")
	ad.Name = "Player_2D_HitboxVisual"
	ad.Adornee = root
	ad.Radius = playerRadius
	ad.Height = GROUND_THICKNESS
	ad.Color3 = isPlayerInDanger and COLOR_DANGER or COLOR_SAFE
	ad.Transparency = isPlayerInDanger and TRANSPARENCY_DANGER or TRANSPARENCY_SAFE
	ad.ZIndex = 5
	ad.AlwaysOnTop = false
	ad.Visible = visualEnabled
	ad.Parent = root

	playerAdornment = ad
	return ad
end

--// Cập nhật trạng thái màu sắc đĩa tròn
local function updateVisualState(inDanger)
	if not playerAdornment or not playerAdornment.Parent then return end
	playerAdornment.Color3 = inDanger and COLOR_DANGER or COLOR_SAFE
	playerAdornment.Transparency = inDanger and TRANSPARENCY_DANGER or TRANSPARENCY_SAFE
end

--// Vòng lặp Heartbeat: Cập nhật vị trí ghim sàn và đánh giá Danger Status
local function onHeartbeat()
	local root = getPlayerRoot()
	if not root or not root.Parent then
		-- Nhân vật đã chết hoặc đang chờ hồi sinh: ẩn visual và reset trạng thái nguy hiểm
		if playerAdornment and playerAdornment.Parent then
			playerAdornment.Visible = false
		end
		if isPlayerInDanger then
			isPlayerInDanger = false
			currentThreat = nil
			currentThreatType = nil
			for _, cb in ipairs(statusCallbacks) do
				pcall(cb, false, nil, nil)
			end
		end
		return
	end

	-- 1. Ghim Visual phẳng nằm ngang trên sàn X-Z
	local ad = ensureAdornment(root)
	if ad and ad.Parent then
		ad.Visible = visualEnabled
		ad.Radius = playerRadius

		local targetY = getPlayerGroundY(root)
		local desiredWorldCFrame = CFrame.new(Vector3.new(root.Position.X, targetY, root.Position.Z))
			* CFrame.Angles(math.rad(90), 0, 0)
		ad.CFrame = root.CFrame:ToObjectSpace(desiredWorldCFrame)
	end

	-- 2. Đánh giá trạng thái nguy hiểm (In Danger Check: Giao thoa Vòng tròn Player với Danger Zones)
	local playerPos = Vector3.new(root.Position.X, 0, root.Position.Z)

	-- Kiểm tra Ground Danger Zones với bán kính vòng tròn Player
	local inGround, hazardInfo, hitPart = geometry.IsPointInAnyHazard(playerPos, nil, playerRadius)
	local inTraj, trajHazard = false, nil

	-- Nếu chưa dính Ground Zone, kiểm tra tiếp Trajectory Corridor với bán kính vòng tròn Player
	if not inGround and trajectory.IsPointInAnyTrajectory then
		inTraj, trajHazard = trajectory.IsPointInAnyTrajectory(playerPos, playerRadius)
	end

	local nowInDanger = (inGround or inTraj)
	local nowThreat = hazardInfo or trajHazard
	local nowThreatType = inGround and "Ground Zone" or (inTraj and "Trajectory Corridor" or nil)

	-- Kiểm tra nếu trạng thái thay đổi
	if nowInDanger ~= isPlayerInDanger or nowThreat ~= currentThreat then
		isPlayerInDanger = nowInDanger
		currentThreat = nowThreat
		currentThreatType = nowThreatType

		updateVisualState(nowInDanger)

		for _, cb in ipairs(statusCallbacks) do
			pcall(cb, nowInDanger, nowThreat, nowThreatType)
		end
	end
end

--// Khởi tạo vòng lặp
local function startTracking()
	if not heartbeatConnection then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

--// Dọn dẹp visual
function playerVisual.Cleanup()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	if playerAdornment then
		pcall(function() playerAdornment:Destroy() end)
		playerAdornment = nil
	end
	isPlayerInDanger = false
	currentThreat = nil
	currentThreatType = nil
end

--// Kiểm tra xem player có đang trong vùng nguy hiểm không
function playerVisual.IsPlayerInDanger()
	return isPlayerInDanger, currentThreat, currentThreatType
end

--// Lấy đối tượng threat hiện tại
function playerVisual.GetCurrentThreat()
	return currentThreat, currentThreatType
end

--// Đăng ký callback khi trạng thái nguy hiểm thay đổi
function playerVisual.OnDangerStatusChanged(callback)
	if type(callback) == "function" then
		table.insert(statusCallbacks, callback)
	end
end

--// Bật / tắt hiển thị visual 2D dưới chân player
function playerVisual.SetVisualEnabled(state)
	visualEnabled = state and true or false
	if playerAdornment then
		playerAdornment.Visible = visualEnabled
	end
end

function playerVisual.IsVisualEnabled()
	return visualEnabled
end

--// Cài đặt bán kính đĩa tròn 2D Hitbox của player
function playerVisual.SetRadius(val)
	if type(val) == "number" and val >= 0.1 then
		playerRadius = val
		if playerAdornment and playerAdornment.Parent then
			playerAdornment.Radius = playerRadius
		end
	end
end

function playerVisual.GetRadius()
	return playerRadius
end

--// Tự động dọn dẹp và kết nối khi hồi sinh nhân vật mới
local function hookLocalPlayer()
	local lp = player or Players.LocalPlayer
	if not lp then return end

	local function onCharAdded(newChar)
		if playerAdornment then
			pcall(function() playerAdornment:Destroy() end)
			playerAdornment = nil
		end
		-- Lắng nghe sự kiện chết để ẩn ngay lập tức
		task.spawn(function()
			local hum = newChar:WaitForChild("Humanoid", 3)
			if hum then
				hum.Died:Connect(function()
					if playerAdornment then
						playerAdornment.Visible = false
					end
				end)
			end
		end)
	end

	playerCharConnection = lp.CharacterAdded:Connect(onCharAdded)
	if lp.Character then
		onCharAdded(lp.Character)
	end
end

hookLocalPlayer()

-- Tự động kích hoạt tracking
startTracking()

-- Dọn dẹp khi shutdown
lifecycle.Register(function()
	if playerCharConnection then
		playerCharConnection:Disconnect()
		playerCharConnection = nil
	end
	playerVisual.Cleanup()
end)

return playerVisual
end function __DIST.o()-- HazardScanner – Candidate Generator (DungeonQuest).
-- Module chuyên trách sinh tập điểm ứng viên (Candidate Generation) bằng thuật toán Progressive Radial Sampling.
-- Độc lập hoàn toàn với Rendering và State (Pure Math / Stateless).
-- Hỗ trợ Momentum Alignment: Ưu tiên chọn hướng né thuận theo hướng người chơi đang chạy.

--// Table

local candidateGenerator = {}

--// Cấu hình Progressive Radial Directions
-- Tier 1 (Coarse Resolution): 8 hướng (mỗi 45 độ)
local COARSE_DIRECTIONS = {}
local NUM_COARSE = 8
for i = 1, NUM_COARSE do
	local angle = (i - 1) * (2 * math.pi / NUM_COARSE)
	COARSE_DIRECTIONS[i] = Vector3.new(math.cos(angle), 0, math.sin(angle))
end

-- Tier 2 (Fine Resolution): 16 hướng (mỗi 22.5 độ)
local FINE_DIRECTIONS = {}
local NUM_FINE = 16
for i = 1, NUM_FINE do
	local angle = (i - 1) * (2 * math.pi / NUM_FINE)
	FINE_DIRECTIONS[i] = Vector3.new(math.cos(angle), 0, math.sin(angle))
end

-- Bán kính lấy mẫu thô (Coarse Radii) và đầy đủ (Fine Radii)
local COARSE_RADII = { 1.5, 3.0, 5.0, 8.0, 12.0, 18.0, 25.0 }
local FINE_RADII = { 1.5, 3.0, 4.5, 6.0, 8.0, 10.5, 13.5, 17.0, 21.0, 26.0, 32.0, 40.0 }

candidateGenerator.COARSE_DIRECTIONS = COARSE_DIRECTIONS
candidateGenerator.FINE_DIRECTIONS = FINE_DIRECTIONS
candidateGenerator.COARSE_RADII = COARSE_RADII
candidateGenerator.FINE_RADII = FINE_RADII

--// Chạy 1 pass quét lấy mẫu xung quanh origin2D
function candidateGenerator.SamplePass(origin2D, directions, radii, safetyBuffer, requireBuffer, isPointSafeFn, evaluatedList, momentumDir)
	local bestPoint = nil
	local bestDist = math.huge
	local bestDir = Vector3.zero
	local found = false

	-- Sắp xếp thứ tự kiểm tra hướng theo độ thuận chiều với hướng đang chạy (Momentum Alignment)
	local sortedDirections = directions
	if momentumDir and momentumDir.Magnitude > 0.1 then
		local mDir = Vector3.new(momentumDir.X, 0, momentumDir.Z).Unit
		sortedDirections = table.clone(directions)
		table.sort(sortedDirections, function(a, b)
			local dotA = a.X * mDir.X + a.Z * mDir.Z
			local dotB = b.X * mDir.X + b.Z * mDir.Z
			return dotA > dotB -- Hướng nào thuận chiều với đà chạy hơn được xét trước
		end)
	end

	for _, radius in ipairs(radii) do
		local foundAtThisRadius = false

		for _, dir in ipairs(sortedDirections) do
			local candidate = origin2D + dir * radius
			local isSafe = isPointSafeFn(candidate)

			if evaluatedList then
				table.insert(evaluatedList, {
					pos = candidate,
					isSafe = isSafe,
					isChosen = false,
				})
			end

			if isSafe then
				local targetPoint = candidate
				if requireBuffer and safetyBuffer > 0 then
					local pushed = candidate + dir * safetyBuffer
					if isPointSafeFn(pushed) then
						targetPoint = pushed
					end
				end

				local dist = (targetPoint - origin2D).Magnitude
				if dist < bestDist then
					bestDist = dist
					bestPoint = targetPoint
					bestDir = dir
					foundAtThisRadius = true
				end
			end
		end

		if foundAtThisRadius and bestPoint then
			found = true
			break
		end
	end

	return bestPoint, found, bestDist, bestDir
end

return candidateGenerator
end function __DIST.p()-- HazardScanner – Safe Spot Visualizer (DungeonQuest).
-- Module chuyên trách vẽ và quản lý Adornments hiển thị Safe Spot Marker và Candidate Debug Grid.

--// Constants & Colors

local COLOR_SAFE_SPOT = Color3.fromRGB(0, 255, 120) -- Xanh lá Neon dạ quang
local COLOR_LINE = Color3.fromRGB(0, 255, 150)
local COLOR_CENTER = Color3.fromRGB(255, 255, 255) -- Tâm trắng nổi bật
local COLOR_CANDIDATE_SAFE = Color3.fromRGB(0, 235, 140)
local COLOR_CANDIDATE_UNSAFE = Color3.fromRGB(255, 60, 60)

local GROUND_THICKNESS = 0.20
local MARKER_RADIUS = 1.4 -- studs
local CENTER_RADIUS = 0.45 -- studs

--// Table
local safeSpotVisual = {}

--// State
local markerAdornment = nil
local centerAdornment = nil
local lineAdornment = nil
local candidatePool = {}

--// Đảm bảo adornments chính của Safe Spot tồn tại
local function ensureMainVisuals(root)
	if not root then return end

	-- Marker đĩa tròn ngoài
	if not markerAdornment or not markerAdornment.Parent then
		if markerAdornment then pcall(function() markerAdornment:Destroy() end) end
		local ad = Instance.new("CylinderHandleAdornment")
		ad.Name = "SafeSpot_OuterMarker"
		ad.Adornee = root
		ad.Radius = MARKER_RADIUS
		ad.Height = GROUND_THICKNESS
		ad.Color3 = COLOR_SAFE_SPOT
		ad.Transparency = 0.35
		ad.ZIndex = 6
		ad.AlwaysOnTop = false
		ad.Visible = false
		ad.Parent = root
		markerAdornment = ad
	end

	-- Điểm tâm tròn màu trắng
	if not centerAdornment or not centerAdornment.Parent then
		if centerAdornment then pcall(function() centerAdornment:Destroy() end) end
		local cad = Instance.new("CylinderHandleAdornment")
		cad.Name = "SafeSpot_CenterDot"
		cad.Adornee = root
		cad.Radius = CENTER_RADIUS
		cad.Height = GROUND_THICKNESS + 0.05
		cad.Color3 = COLOR_CENTER
		cad.Transparency = 0.15
		cad.ZIndex = 7
		cad.AlwaysOnTop = false
		cad.Visible = false
		cad.Parent = root
		centerAdornment = cad
	end

	-- Đường dẫn nối từ Player -> Safe Spot
	if not lineAdornment or not lineAdornment.Parent then
		if lineAdornment then pcall(function() lineAdornment:Destroy() end) end
		local lad = Instance.new("LineHandleAdornment")
		lad.Name = "SafeSpot_EscapeLine"
		lad.Adornee = root
		lad.Color3 = COLOR_LINE
		lad.Thickness = 3.5
		lad.Transparency = 0.20
		lad.ZIndex = 6
		lad.AlwaysOnTop = false
		lad.Visible = false
		lad.Parent = root
		lineAdornment = lad
	end
end

--// Đảm bảo adornment cho từng candidate trong pool
local function ensureCandidateAdornment(index, root)
	local entry = candidatePool[index]
	if not entry then
		local dot = Instance.new("CylinderHandleAdornment")
		dot.Name = "SafeSpot_CandidateDot_" .. index
		dot.Adornee = root
		dot.Radius = 0.25
		dot.Height = GROUND_THICKNESS
		dot.ZIndex = 4
		dot.AlwaysOnTop = false
		dot.Visible = false
		dot.Parent = root

		local line = Instance.new("LineHandleAdornment")
		line.Name = "SafeSpot_CandidateLine_" .. index
		line.Adornee = root
		line.Thickness = 1.2
		line.ZIndex = 4
		line.AlwaysOnTop = false
		line.Visible = false
		line.Parent = root

		entry = { dot = dot, line = line }
		candidatePool[index] = entry
	else
		if entry.dot and entry.dot.Adornee ~= root then
			entry.dot.Adornee = root
			entry.dot.Parent = root
		end
		if entry.line and entry.line.Adornee ~= root then
			entry.line.Adornee = root
			entry.line.Parent = root
		end
	end
	return entry
end

--// Ẩn toàn bộ candidate visuals
function safeSpotVisual.HideCandidates()
	for _, entry in ipairs(candidatePool) do
		if entry.dot and entry.dot.Parent then entry.dot.Visible = false end
		if entry.line and entry.line.Parent then entry.line.Visible = false end
	end
end

--// Ẩn toàn bộ visuals
function safeSpotVisual.Hide()
	if markerAdornment and markerAdornment.Parent then markerAdornment.Visible = false end
	if centerAdornment and centerAdornment.Parent then centerAdornment.Visible = false end
	if lineAdornment and lineAdornment.Parent then lineAdornment.Visible = false end
	safeSpotVisual.HideCandidates()
end

--// Cập nhật hiển thị Candidate Debug Grid
local function updateCandidateGrid(root, targetY, evaluatedCandidates, isShowCandidates)
	if not isShowCandidates or not evaluatedCandidates or #evaluatedCandidates == 0 then
		safeSpotVisual.HideCandidates()
		return
	end

	local playerFeetWorld = Vector3.new(root.Position.X, targetY + 0.05, root.Position.Z)
	local localStart = root.CFrame:PointToObjectSpace(playerFeetWorld)

	for i, cand in ipairs(evaluatedCandidates) do
		local entry = ensureCandidateAdornment(i, root)
		local candWorld = Vector3.new(cand.pos.X, targetY + 0.05, cand.pos.Z)
		local localEnd = root.CFrame:PointToObjectSpace(candWorld)

		local color = cand.isSafe and COLOR_CANDIDATE_SAFE or COLOR_CANDIDATE_UNSAFE
		local alpha = cand.isSafe and 0.35 or 0.55

		-- 1. Dot tại điểm candidate
		if entry.dot and entry.dot.Parent then
			local desiredDotCF = CFrame.new(candWorld) * CFrame.Angles(math.rad(90), 0, 0)
			entry.dot.CFrame = root.CFrame:ToObjectSpace(desiredDotCF)
			entry.dot.Color3 = color
			entry.dot.Transparency = alpha
			entry.dot.Radius = cand.isSafe and 0.30 or 0.20
			entry.dot.Visible = true
		end

		-- 2. Line nối từ chân Player -> candidate
		if entry.line and entry.line.Parent then
			local delta = localEnd - localStart
			local length = delta.Magnitude
			if length > 0.2 then
				entry.line.CFrame = CFrame.lookAt(localStart, localEnd)
				entry.line.Length = length
				entry.line.Color3 = color
				entry.line.Transparency = alpha + 0.15
				entry.line.Thickness = cand.isSafe and 1.4 or 0.9
				entry.line.Visible = true
			else
				entry.line.Visible = false
			end
		end
	end

	-- Ẩn các adornment không dùng đến
	for i = #evaluatedCandidates + 1, #candidatePool do
		local entry = candidatePool[i]
		if entry.dot and entry.dot.Parent then entry.dot.Visible = false end
		if entry.line and entry.line.Parent then entry.line.Visible = false end
	end
end

--// Cập nhật hiển thị Safe Spot chính và Candidates
function safeSpotVisual.Update(root, safePos, targetY, evaluatedCandidates, isVisualEnabled, isShowCandidates)
	if not root or not root.Parent or not isVisualEnabled or not safePos then
		safeSpotVisual.Hide()
		return
	end

	ensureMainVisuals(root)

	local worldTargetPos = Vector3.new(safePos.X, targetY, safePos.Z)

	-- 1. Marker đĩa tròn ngoài
	if markerAdornment and markerAdornment.Parent then
		local desiredWorldCF = CFrame.new(worldTargetPos) * CFrame.Angles(math.rad(90), 0, 0)
		markerAdornment.CFrame = root.CFrame:ToObjectSpace(desiredWorldCF)
		markerAdornment.Visible = true
	end

	-- 2. Điểm tâm tròn màu trắng
	if centerAdornment and centerAdornment.Parent then
		local desiredCenterCF = CFrame.new(worldTargetPos) * CFrame.Angles(math.rad(90), 0, 0)
		centerAdornment.CFrame = root.CFrame:ToObjectSpace(desiredCenterCF)
		centerAdornment.Visible = true
	end

	-- 3. Line dẫn đường từ chân Player -> Safe Spot
	if lineAdornment and lineAdornment.Parent then
		local playerFeetWorld = Vector3.new(root.Position.X, targetY + 0.1, root.Position.Z)
		local safeFeetWorld = Vector3.new(safePos.X, targetY + 0.1, safePos.Z)

		local localStart = root.CFrame:PointToObjectSpace(playerFeetWorld)
		local localEnd = root.CFrame:PointToObjectSpace(safeFeetWorld)
		local delta = localEnd - localStart
		local length = delta.Magnitude

		if length > 0.3 then
			lineAdornment.CFrame = CFrame.new(localStart)
			lineAdornment.Length = length
			lineAdornment.CFrame = CFrame.lookAt(localStart, localEnd)
			lineAdornment.Visible = true
		else
			lineAdornment.Visible = false
		end
	end

	-- 4. Candidate debug grid
	updateCandidateGrid(root, targetY, evaluatedCandidates, isShowCandidates)
end

--// Dọn dẹp toàn bộ visual
function safeSpotVisual.Cleanup()
	if markerAdornment then pcall(function() markerAdornment:Destroy() end); markerAdornment = nil end
	if centerAdornment then pcall(function() centerAdornment:Destroy() end); centerAdornment = nil end
	if lineAdornment then pcall(function() lineAdornment:Destroy() end); lineAdornment = nil end

	for _, entry in ipairs(candidatePool) do
		if entry.dot then pcall(function() entry.dot:Destroy() end) end
		if entry.line then pcall(function() entry.line:Destroy() end) end
	end
	table.clear(candidatePool)
end

return safeSpotVisual
end function __DIST.q()-- HazardScanner – Safe Spot Engine (DungeonQuest).
-- Logic xác định điểm an toàn gần nhất (Safe Spot) bằng thuật toán Progressive Radial Sampling.
-- Tích hợp Broad-Phase Spatial Culling, Momentum Alignment (ưu tiên theo đà chạy) và Dynamic Scheduling (tiết kiệm CPU khi rảnh rỗi).

--// Imports

local services = __DIST.load('e')
local lifecycle = __DIST.load('b')
local geometry = __DIST.load('j')
local trajectory = __DIST.load('l')
local playerVisual = __DIST.load('n')
local candidateGenerator = __DIST.load('o')
local safeSpotVisual = __DIST.load('p')

local RunService = services.RunService or game:GetService("RunService")
local Players = game:GetService("Players")
local player = services.player

--// Table
local safeSpot = {}

--// State
local enabled = true
local visualEnabled = true
local showCandidatesVisual = true
local safetyBuffer = 2.0 -- studs (khoảng cách đẩy xa thêm ra khỏi mép danger zone để đứng an toàn)
local currentTargetSafeSpot = nil
local currentThreatInstance = nil
local currentThreatType = nil
local lastDistance = 0
local isFindingSafeSpot = false
local heartbeatConnection = nil
local dangerChangedConnection = nil
local safeSpotChangedCallbacks = {}
local lastEvaluatedCandidates = {}
local lastIdleCheck = 0

--// Lấy HumanoidRootPart của người chơi
local function getPlayerRoot()
	local lp = player or Players.LocalPlayer
	if not lp then return nil end
	local char = lp.Character
	if not char or not char.Parent then return nil end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then return nil end
	return char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
end

--// Lấy vector hướng đang chạy thực tế của người chơi (Running Momentum Direction)
local function getPlayerRunningDirection(root)
	local lp = player or Players.LocalPlayer
	if not lp then return nil end
	local char = lp.Character
	if not char or not char.Parent then return nil end

	-- 1. Ưu tiên đọc Humanoid.MoveDirection (hướng người chơi đang chủ động di chuyển bằng phím/joystick/script)
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health > 0 then
		local moveDir = hum.MoveDirection
		if moveDir and moveDir.Magnitude > 0.1 then
			return Vector3.new(moveDir.X, 0, moveDir.Z).Unit
		end
	end

	-- 2. Đọc theo vận tốc vật lý thực tế của HumanoidRootPart nếu đang di chuyển
	if root and root.Parent then
		local vel = Vector3.zero
		pcall(function()
			vel = root.AssemblyLinearVelocity or root.Velocity or Vector3.zero
		end)
		local hVel = Vector3.new(vel.X, 0, vel.Z)
		if hVel.Magnitude >= 2.0 then
			return hVel.Unit
		end
	end

	return nil
end

--// Lấy độ cao mặt sàn dưới chân người chơi
local function getPlayerGroundY(root)
	if not root then return 0 end
	return root.Position.Y - 2.5
end

--// Kiểm tra xem một điểm P (X-Z) có an toàn (Player Circle nằm ngoài mọi Ground Zone & Trajectory) không
function safeSpot.IsPointSafe(point, extraMargin)
	if not point then return false end
	local p2D = Vector3.new(point.X, 0, point.Z)
	local playerRad = (playerVisual.GetRadius and playerVisual.GetRadius() or 1.8) + (extraMargin or 0)

	-- 1. Kiểm tra Ground Danger Zones (Đĩa đỏ / Vùng tròn / OBB trên mặt sàn)
	if geometry.IsPointInAnyHazard and geometry.IsPointInAnyHazard(p2D, nil, playerRad) then
		return false
	end

	-- 2. Kiểm tra Trajectory Corridors (Hành lang cam của đạn đang bay)
	if trajectory.IsPointInAnyTrajectory and trajectory.IsPointInAnyTrajectory(p2D, playerRad) then
		return false
	end

	return true
end

--// Thuật toán Progressive Radial Escape Sampling: Tìm điểm an toàn gần nhất từ tọa độ origin
--// Tích hợp Broad-Phase Spatial Culling và Momentum Alignment (ưu tiên theo đà chạy của nhân vật)
function safeSpot.FindNearestSafeSpot(origin)
	local root = getPlayerRoot()
	if not origin then
		if not root then return nil, false, 0, Vector3.zero end
		origin = root.Position
	end

	local origin2D = Vector3.new(origin.X, 0, origin.Z)
	local momentumDir = getPlayerRunningDirection(root)
	table.clear(lastEvaluatedCandidates)

	-- 1. Broad-Phase Spatial Culling: Lọc nhanh các hazard & trajectory trong phạm vi ảnh hưởng (65 studs)
	local relevantHazards = geometry.GetNearbyHazards and geometry.GetNearbyHazards(origin2D, 65) or nil
	local relevantTrajectories = trajectory.GetNearbyTrajectories and trajectory.GetNearbyTrajectories(origin2D, 65) or nil

	-- Hàm kiểm tra an toàn tối ưu chỉ duyệt qua danh sách relevant đã lọc
	local function isPointSafeScoped(candPoint, extraMargin)
		if not candPoint then return false end
		local p2D = Vector3.new(candPoint.X, 0, candPoint.Z)
		local playerRad = (playerVisual.GetRadius and playerVisual.GetRadius() or 1.8) + (extraMargin or 0)

		if geometry.IsPointInAnyHazard and geometry.IsPointInAnyHazard(p2D, nil, playerRad, relevantHazards) then
			return false
		end

		if trajectory.IsPointInAnyTrajectory and trajectory.IsPointInAnyTrajectory(p2D, playerRad, relevantTrajectories) then
			return false
		end

		return true
	end

	-- 2. Nếu không có bất kỳ mối nguy nào trong phạm vi hoặc vị trí hiện tại đã an toàn -> Xong ngay lập tức
	if (relevantHazards and #relevantHazards == 0 and relevantTrajectories and #relevantTrajectories == 0) or isPointSafeScoped(origin2D, 0) then
		table.insert(lastEvaluatedCandidates, { pos = origin2D, isSafe = true, isChosen = true })
		return origin2D, true, 0, Vector3.zero
	end

	-- Tier 1: Coarse Pass (8 hướng, bán kính thưa, yêu cầu buffer an toàn, ưu tiên theo đà chạy)
	local bestPoint, found, bestDist, bestDir = candidateGenerator.SamplePass(
		origin2D,
		candidateGenerator.COARSE_DIRECTIONS,
		candidateGenerator.COARSE_RADII,
		safetyBuffer,
		true,
		isPointSafeScoped,
		lastEvaluatedCandidates,
		momentumDir
	)

	-- Tier 2: Fine Pass (16 hướng, bán kính chi tiết, yêu cầu buffer an toàn, ưu tiên theo đà chạy)
	if not found then
		bestPoint, found, bestDist, bestDir = candidateGenerator.SamplePass(
			origin2D,
			candidateGenerator.FINE_DIRECTIONS,
			candidateGenerator.FINE_RADII,
			safetyBuffer,
			true,
			isPointSafeScoped,
			lastEvaluatedCandidates,
			momentumDir
		)
	end

	-- Tier 3: Emergency Fallback Pass (16 hướng, bán kính chi tiết, không bắt buộc buffer, ưu tiên theo đà chạy)
	if not found then
		bestPoint, found, bestDist, bestDir = candidateGenerator.SamplePass(
			origin2D,
			candidateGenerator.FINE_DIRECTIONS,
			candidateGenerator.FINE_RADII,
			0,
			false,
			isPointSafeScoped,
			lastEvaluatedCandidates,
			momentumDir
		)
	end

	if found and bestPoint then
		-- Đánh dấu candidate được chọn trong danh sách debug visual
		for _, cand in ipairs(lastEvaluatedCandidates) do
			if (cand.pos - bestPoint).Magnitude < 0.25 then
				cand.isChosen = true
				break
			end
		end
		return bestPoint, true, bestDist, bestDir
	end

	-- Không tìm thấy điểm an toàn trong phạm vi tối đa
	return origin2D, false, math.huge, Vector3.zero
end

--// Vòng lặp Heartbeat: Thực hiện kiểm tra với Dynamic Scheduling (tiết kiệm CPU khi an toàn)
local function onHeartbeat()
	if not enabled then
		safeSpotVisual.Hide()
		return
	end

	local root = getPlayerRoot()
	if not root or not root.Parent then
		safeSpotVisual.Hide()
		return
	end

	-- Kiểm tra xem Player có đang trong vùng nguy hiểm không
	local inDanger, threatInfo, threatType = false, nil, nil
	if playerVisual.IsPlayerInDanger then
		inDanger, threatInfo, threatType = playerVisual.IsPlayerInDanger()
	end

	-- Dynamic Scheduling: Khi Player hoàn toàn an toàn và không đang tìm/né Safe Spot, throttle kiểm tra ~20Hz
	local isCurrentlyActive = inDanger or (currentTargetSafeSpot ~= nil) or isFindingSafeSpot
	if not isCurrentlyActive then
		local now = os.clock()
		if now - lastIdleCheck < 0.05 then
			return
		end
		lastIdleCheck = now
	end

	local targetY = getPlayerGroundY(root)
	local playerPos2D = Vector3.new(root.Position.X, 0, root.Position.Z)

	if inDanger then
		-- Kiểm tra xem Safe Spot đã chọn trước đó còn hợp lệ không:
		-- 1. Điểm đó vẫn phải Safe (không bị đè bởi vùng đỏ hoặc vùng cam mới).
		-- 2. Mối đe dọa (threat) của Player không bị đổi sang chiêu/loại khác.
		local distToTarget = currentTargetSafeSpot and (currentTargetSafeSpot - playerPos2D).Magnitude or 0
		local isTargetStillSafe = currentTargetSafeSpot and safeSpot.IsPointSafe(currentTargetSafeSpot)
		local isSameThreat = (threatInfo == currentThreatInstance and threatType == currentThreatType)

		-- Nếu Safe Spot cũ bị đè HOẶC Player bị dính thêm/đổi Threat mới HOẶC chưa có Safe Spot:
		if not isTargetStillSafe or not isSameThreat or not currentTargetSafeSpot then
			local spot, found, dist, dir = safeSpot.FindNearestSafeSpot(root.Position)

			if found and spot then
				currentTargetSafeSpot = spot
				currentThreatInstance = threatInfo
				currentThreatType = threatType
				lastDistance = dist
				isFindingSafeSpot = true

				safeSpotVisual.Update(root, spot, targetY, lastEvaluatedCandidates, visualEnabled, showCandidatesVisual)

				for _, cb in ipairs(safeSpotChangedCallbacks) do
					pcall(cb, true, spot, dist)
				end
			else
				safeSpotVisual.Hide()
			end
		else
			-- Safe Spot cũ vẫn an toàn và cùng mối nguy -> GIỮ NGUYÊN để chuyển động né mượt mà không rung lắc
			lastDistance = distToTarget
			safeSpotVisual.Update(root, currentTargetSafeSpot, targetY, lastEvaluatedCandidates, visualEnabled, showCandidatesVisual)

			for _, cb in ipairs(safeSpotChangedCallbacks) do
				pcall(cb, true, currentTargetSafeSpot, distToTarget)
			end
		end
	else
		-- Khi player đã bước ra ngoài vùng nguy hiểm:
		-- Nếu vẫn còn targetSafeSpot và người chơi chưa chạm tới đích (distToTarget > 0.8 studs), tiếp tục duy trì để Auto-Dodge snap hoàn tất
		local distToTarget = currentTargetSafeSpot and (currentTargetSafeSpot - playerPos2D).Magnitude or 0
		local isTargetStillSafe = currentTargetSafeSpot and safeSpot.IsPointSafe(currentTargetSafeSpot)

		if isTargetStillSafe and distToTarget > 0.8 then
			lastDistance = distToTarget
			safeSpotVisual.Update(root, currentTargetSafeSpot, targetY, lastEvaluatedCandidates, visualEnabled, showCandidatesVisual)
			for _, cb in ipairs(safeSpotChangedCallbacks) do
				pcall(cb, true, currentTargetSafeSpot, distToTarget)
			end
		else
			-- Khi đã thực sự tới đích hoặc điểm không còn an toàn -> ẩn visual và reset
			if isFindingSafeSpot or currentTargetSafeSpot then
				isFindingSafeSpot = false
				currentTargetSafeSpot = nil
				currentThreatInstance = nil
				currentThreatType = nil
				lastDistance = 0
				safeSpotVisual.Hide()

				for _, cb in ipairs(safeSpotChangedCallbacks) do
					pcall(cb, false, nil, 0)
				end
			end
		end
	end
end

--// Khởi động tracking
local function startTracking()
	if not heartbeatConnection then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
	if not dangerChangedConnection and playerVisual.OnDangerStatusChanged then
		-- Event-Driven Wakeup: Phản hồi ngay lập tức tại frame nguy hiểm xuất hiện
		dangerChangedConnection = playerVisual.OnDangerStatusChanged(function(nowInDanger)
			if nowInDanger and enabled then
				onHeartbeat()
			end
		end)
	end
end

--// Dọn dẹp Safe Spot
function safeSpot.Cleanup()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	safeSpotVisual.Cleanup()
	table.clear(lastEvaluatedCandidates)
	currentTargetSafeSpot = nil
	currentThreatInstance = nil
	currentThreatType = nil
	lastDistance = 0
	isFindingSafeSpot = false
	lastIdleCheck = 0
end

--// API Public
function safeSpot.GetLastSafeSpot()
	return currentTargetSafeSpot, lastDistance, isFindingSafeSpot
end

function safeSpot.OnSafeSpotChanged(callback)
	if type(callback) == "function" then
		table.insert(safeSpotChangedCallbacks, callback)
	end
end

function safeSpot.SetVisualEnabled(state)
	visualEnabled = state and true or false
	if not visualEnabled then
		safeSpotVisual.Hide()
	end
end

function safeSpot.IsVisualEnabled()
	return visualEnabled
end

function safeSpot.SetShowCandidates(state)
	showCandidatesVisual = state and true or false
	if not showCandidatesVisual then
		safeSpotVisual.HideCandidates()
	end
end

function safeSpot.IsShowCandidates()
	return showCandidatesVisual
end

function safeSpot.SetEnabled(state)
	enabled = state and true or false
	if not enabled then
		safeSpotVisual.Hide()
	end
end

function safeSpot.IsEnabled()
	return enabled
end

function safeSpot.SetSafetyBuffer(val)
	if type(val) == "number" and val >= 0 then
		safetyBuffer = val
	end
end

function safeSpot.GetSafetyBuffer()
	return safetyBuffer
end

-- Lắng nghe hồi sinh nhân vật để dọn visual cũ
local function hookRespawn()
	local lp = player or Players.LocalPlayer
	if not lp then return end
	lp.CharacterAdded:Connect(function()
		safeSpotVisual.Cleanup()
	end)
end
hookRespawn()

-- Khởi động tracking
startTracking()

-- Dọn dẹp khi shutdown
lifecycle.Register(function()
	safeSpot.Cleanup()
end)

return safeSpot
end function __DIST.r()-- HazardScanner – Dodge Controller (DungeonQuest).
-- Quản lý logic tự động né đòn (Auto-Dodge):
-- Di chuyển bằng Humanoid:Move() về hướng Safe Spot và thực hiện Snap pha cuối khi tới gần (flatDist <= snapDistance)
-- để đảm bảo nhân vật đáp đúng 100% tọa độ an toàn, triệt tiêu sai số quán tính của Roblox physics.

--// Imports

local services = __DIST.load('e')
local lifecycle = __DIST.load('b')
local playerVisual = __DIST.load('n')
local safeSpot = __DIST.load('q')

local RunService = services.RunService or game:GetService("RunService")
local Players = game:GetService("Players")
local player = services.player

--// Table
local dodgeController = {}

--// State
local enabled = false
local snapDistance = 2.0 -- studs (khoảng cách pha cuối để snap chuẩn xác vào vị trí)
local isDodging = false
local activeTargetSpot = nil
local heartbeatConnection = nil
local dodgeStateCallbacks = {}

--// Lấy Humanoid và HumanoidRootPart của người chơi
local function getPlayerComponents()
	local lp = player or Players.LocalPlayer
	if not lp then return nil, nil, nil end
	local char = lp.Character
	if not char or not char.Parent then return nil, nil, nil end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then return nil, nil, nil end
	local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
	if not root then return nil, nil, nil end
	return char, hum, root
end

--// Dừng di chuyển của Humanoid
local function stopMove(hum, root)
	if hum and root and root.Parent then
		pcall(function() hum:MoveTo(root.Position) end)
	end
end

--// Vòng lặp Heartbeat: Thực hiện Auto-Dodge khi Player gặp nguy hiểm
local function onHeartbeat()
	if not enabled then
		if isDodging or activeTargetSpot then
			activeTargetSpot = nil
			isDodging = false
			local _, hum, root = getPlayerComponents()
			stopMove(hum, root)
			for _, cb in ipairs(dodgeStateCallbacks) do
				pcall(cb, false, nil, 0)
			end
		end
		return
	end

	local char, hum, root = getPlayerComponents()
	if not char or not hum or not root then
		if isDodging or activeTargetSpot then
			activeTargetSpot = nil
			isDodging = false
			for _, cb in ipairs(dodgeStateCallbacks) do
				pcall(cb, false, nil, 0)
			end
		end
		return
	end

	-- Kiểm tra xem Player có đang trong nguy hiểm hoặc có Safe Spot từ engine không
	local inDanger = playerVisual.IsPlayerInDanger and playerVisual.IsPlayerInDanger()
	local targetSpot, distToSpot, isFinding = safeSpot.GetLastSafeSpot()

	-- Nếu có Safe Spot mới được tính ra, đồng bộ làm mục tiêu né chính
	if targetSpot then
		activeTargetSpot = targetSpot
	end

	-- Kiểm tra xem mục tiêu activeTargetSpot có còn hợp lệ và an toàn không
	local isTargetStillSafe = activeTargetSpot and safeSpot.IsPointSafe and safeSpot.IsPointSafe(activeTargetSpot)

	if activeTargetSpot and isTargetStillSafe then
		local playerPos = root.Position
		local flatDelta = Vector3.new(activeTargetSpot.X - playerPos.X, 0, activeTargetSpot.Z - playerPos.Z)
		local flatDist = flatDelta.Magnitude

		-- Pha 1: Snap pha cuối khi cự ly đã vào phạm vi an toàn cực gần
		if flatDist <= snapDistance then
			-- Giữ nguyên độ cao Y và góc xoay hiện tại của nhân vật
			local currentCF = root.CFrame
			local targetWorldPos = Vector3.new(activeTargetSpot.X, playerPos.Y, activeTargetSpot.Z)
			local targetCF = CFrame.new(targetWorldPos) * (currentCF - currentCF.Position)

			char:PivotTo(targetCF)
			stopMove(hum, root)

			local reachedSpot = activeTargetSpot
			activeTargetSpot = nil

			if isDodging then
				isDodging = false
				for _, cb in ipairs(dodgeStateCallbacks) do
					pcall(cb, false, reachedSpot, flatDist)
				end
			end
		else
			-- Pha 2: Di chuyển bằng MoveTo về hướng Safe Spot
			local moveTarget = Vector3.new(activeTargetSpot.X, playerPos.Y, activeTargetSpot.Z)
			hum:MoveTo(moveTarget)

			if not isDodging then
				isDodging = true
				for _, cb in ipairs(dodgeStateCallbacks) do
					pcall(cb, true, activeTargetSpot, flatDist)
				end
			end
		end
	else
		-- Khi đã an toàn và hoàn tất né / hoặc không còn Safe Spot hợp lệ
		if isDodging or activeTargetSpot then
			activeTargetSpot = nil
			isDodging = false
			stopMove(hum, root)
			for _, cb in ipairs(dodgeStateCallbacks) do
				pcall(cb, false, nil, 0)
			end
		end
	end
end

--// Khởi động tracking
local function startTracking()
	if not heartbeatConnection then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

--// Dọn dẹp
function dodgeController.Cleanup()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	if isDodging or activeTargetSpot then
		local _, hum, root = getPlayerComponents()
		stopMove(hum, root)
	end
	activeTargetSpot = nil
	isDodging = false
end

--// Public APIs
function dodgeController.SetEnabled(state)
	enabled = state and true or false
	if not enabled then
		local _, hum, root = getPlayerComponents()
		stopMove(hum, root)
		activeTargetSpot = nil
		isDodging = false
	end
end

function dodgeController.IsEnabled()
	return enabled
end

function dodgeController.SetSnapDistance(val)
	if type(val) == "number" and val >= 0.5 then
		snapDistance = val
	end
end

function dodgeController.GetSnapDistance()
	return snapDistance
end

function dodgeController.IsDodging()
	return isDodging
end

function dodgeController.OnDodgeStateChanged(callback)
	if type(callback) == "function" then
		table.insert(dodgeStateCallbacks, callback)
	end
end

-- Tự động kích hoạt tracking
startTracking()

-- Dọn dẹp khi shutdown
lifecycle.Register(function()
	dodgeController.Cleanup()
end)

return dodgeController
end function __DIST.s()-- HazardScanner (DungeonQuest) – Facade: quét hiểm họa + vẽ SelectionBox đơn giản.
-- Đơn giản hóa hoàn toàn: chỉ phát hiện đối tượng xuất hiện trong Workspace qua
-- ChildAdded/ChildRemoved sau sự kiện start dungeon, vẽ SelectionBox quanh từng đối tượng.
-- Không còn trajectory / whitelist / boss orb / ngoại lệ / hitbox padding / tên 3D.
-- Đường dẫn require "@routes/DungeonQuest/core/hazardScanner" vẫn giữ nguyên (init.luau).

--// Imports

local lifecycle = __DIST.load('b')
local detection = __DIST.load('m')
local geometry = __DIST.load('j')
local visualizer = __DIST.load('k')
local trajectory = __DIST.load('l')
local playerVisual = __DIST.load('n')
local safeSpot = __DIST.load('q')
local dodgeController = __DIST.load('r')

--// Table
local hazardScanner = {}

--// Bind data sources (tranh vong phu thuoc)
geometry.BindDetection(detection)
visualizer.BindDetection(detection)
trajectory.BindDetection(detection)

--// Geometry (Danger Zones)
hazardScanner.IsPointInAnyHazard = geometry.IsPointInAnyHazard
hazardScanner.GetHazardPadding = geometry.GetHazardPadding
hazardScanner.SetHazardPadding = geometry.SetHazardPadding
hazardScanner.GetHitboxPadding = geometry.GetHazardPadding
hazardScanner.SetHitboxPadding = geometry.SetHazardPadding
hazardScanner.GetHazardZones = geometry.GetHazardZones
hazardScanner.GetNearbyHazards = geometry.GetNearbyHazards
hazardScanner.AddForceCircleName = geometry.AddForceCircleName
hazardScanner.GetForceCircleNames = geometry.GetForceCircleNames
hazardScanner.IsForceCircle = geometry.IsForceCircle

--// Player 2D Visualizer & Danger Detection
hazardScanner.IsPlayerInDanger = playerVisual.IsPlayerInDanger
hazardScanner.GetPlayerThreat = playerVisual.GetCurrentThreat
hazardScanner.OnPlayerDangerChanged = playerVisual.OnDangerStatusChanged
hazardScanner.SetPlayerVisualEnabled = playerVisual.SetVisualEnabled
hazardScanner.IsPlayerVisualEnabled = playerVisual.IsVisualEnabled
hazardScanner.SetPlayerHitboxRadius = playerVisual.SetRadius
hazardScanner.GetPlayerHitboxRadius = playerVisual.GetRadius

--// Safe Spot Engine (Radial Escape)
hazardScanner.FindNearestSafeSpot = safeSpot.FindNearestSafeSpot
hazardScanner.IsPointSafe = safeSpot.IsPointSafe
hazardScanner.GetLastSafeSpot = safeSpot.GetLastSafeSpot
hazardScanner.OnSafeSpotChanged = safeSpot.OnSafeSpotChanged
hazardScanner.SetSafeSpotVisualEnabled = safeSpot.SetVisualEnabled
hazardScanner.IsSafeSpotVisualEnabled = safeSpot.IsVisualEnabled
hazardScanner.SetSafeSpotEnabled = safeSpot.SetEnabled
hazardScanner.IsSafeSpotEnabled = safeSpot.IsEnabled
hazardScanner.SetSafeSpotBuffer = safeSpot.SetSafetyBuffer
hazardScanner.GetSafeSpotBuffer = safeSpot.GetSafetyBuffer
hazardScanner.SetShowCandidates = safeSpot.SetShowCandidates
hazardScanner.IsShowCandidates = safeSpot.IsShowCandidates

--// Auto Dodge Controller (MoveTo + Final Snap)
hazardScanner.SetAutoDodgeEnabled = dodgeController.SetEnabled
hazardScanner.IsAutoDodgeEnabled = dodgeController.IsEnabled
hazardScanner.SetDodgeSnapDistance = dodgeController.SetSnapDistance
hazardScanner.GetDodgeSnapDistance = dodgeController.GetSnapDistance
hazardScanner.IsCurrentlyDodging = dodgeController.IsDodging
hazardScanner.OnDodgeStateChanged = dodgeController.OnDodgeStateChanged

--// Ground Visualizer (Debug Danger Zones)
hazardScanner.SetVisualizerEnabled = visualizer.SetEnabled
hazardScanner.IsVisualizerEnabled = visualizer.IsEnabled
hazardScanner.RefreshVisuals = visualizer.RefreshAll

--// Trajectory Visualizer (Orange Corridor)
hazardScanner.SetTrajectoryEnabled = trajectory.SetEnabled
hazardScanner.IsTrajectoryEnabled = trajectory.IsEnabled
hazardScanner.SetTrajectoryLength = trajectory.SetPredictionLength
hazardScanner.GetTrajectoryLength = trajectory.GetPredictionLength
hazardScanner.RefreshTrajectory = trajectory.RefreshAll
hazardScanner.IsPointInAnyTrajectory = trajectory.IsPointInAnyTrajectory
hazardScanner.GetNearbyTrajectories = trajectory.GetNearbyTrajectories

--// 3D Selection Box (Parts)
hazardScanner.SetSelectionBoxesEnabled = detection.SetSelectionBoxesEnabled
hazardScanner.IsSelectionBoxesEnabled = detection.IsSelectionBoxesEnabled

--// Detection (Scan + SelectionBox)
hazardScanner.StartDetection = detection.StartScan
hazardScanner.StopDetection = detection.StopScan
hazardScanner.IsDetectionEnabled = detection.IsEnabled
hazardScanner.SetDetectionEnabled = detection.SetEnabled

hazardScanner.SetLogHazards = detection.SetLogHazards
hazardScanner.IsLogHazardsEnabled = detection.IsLogHazardsEnabled
-- Backward compatibility aliases
hazardScanner.SetLogThreats = hazardScanner.SetLogHazards
hazardScanner.IsLogThreatsEnabled = hazardScanner.IsLogHazardsEnabled

hazardScanner.SetLogFailed = detection.SetLogFailed
hazardScanner.IsLogFailedEnabled = detection.IsLogFailedEnabled

--// Skill Deep Inspector (Debug By Name)
hazardScanner.SetInspectTarget = detection.SetInspectTarget
hazardScanner.GetInspectTarget = detection.GetInspectTarget
hazardScanner.SetInspectEnabled = detection.SetInspectEnabled
hazardScanner.IsInspectEnabled = detection.IsInspectEnabled

hazardScanner.GetHazardCount = detection.GetHazardCount
hazardScanner.GetActiveHazards = detection.GetActiveHazards
hazardScanner.GetLastHazardInfo = detection.GetLastHazardInfo
hazardScanner.OnHazardChanged = detection.OnHazardChanged

--// Bật scanner: bắt đầu quét Workspace
function hazardScanner.StartScan()
	detection.StartScan()
end

--// Tắt scanner: dừng quét + dọn visual
function hazardScanner.StopScan()
	detection.StopScan()
end

--// Toggle độc lập (UI)
function hazardScanner.Toggle(state)
	if state then
		hazardScanner.StartScan()
	else
		hazardScanner.StopScan()
	end
end

function hazardScanner.IsEnabled()
	return detection.IsEnabled()
end

--// Dọn dẹp toàn diện khi shutdown
lifecycle.Register(function()
	detection.StopScan()
end)

return hazardScanner end function __DIST.t()-- Module Hazard Scanner trong tab Combat (DungeonQuest): quét đối tượng skill xuất hiện
-- trong Workspace sau sự kiện start dungeon và vẽ SelectionBox đơn giản cho từng đối tượng.
-- Không còn trajectory / whitelist / ngoại lệ / hitbox padding / tên 3D.

--// Imports

local autoSave = __DIST.load('d')
local hazardScanner = __DIST.load('s')
local ui = __DIST.load('g')

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Hazard Scanner Controls" })

	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Real-time Hazard Monitor" })

	--// Right Section Labels
	local statusLabel = rightSection:Label({ Text = "Detector: <font color='rgb(255,80,80)'>Disabled</font>" })
	local playerDangerLabel = rightSection:Label({ Text = "Player: <font color='rgb(0,255,170)'>SAFE</font>" })
	local safeSpotLabel = rightSection:Label({ Text = "Safe Spot: <font color='rgb(160,160,160)'>None Needed</font>" })
	local dodgeStatusLabel = rightSection:Label({ Text = "Auto Dodge: <font color='rgb(160,160,160)'>Idle</font>" })
	local activeCountLabel = rightSection:Label({ Text = "Active Hazards: <font color='rgb(160,160,160)'>0</font>" })
	local lastHazardLabel = rightSection:Label({ Text = "Last Detected: <font color='rgb(160,160,160)'>None</font>" })

	local function updatePlayerDanger(inDanger, threatInfo, threatType)
		if inDanger then
			local threatName = threatInfo and threatInfo.Name or "Unknown Threat"
			local typeStr = threatType and (" [" .. threatType .. "]") or ""
			pcall(function()
				playerDangerLabel:UpdateName(("Player: <font color='rgb(255,50,50)'><b>DANGER</b></font> (%s%s)"):format(
					threatName, typeStr
				))
			end)
		else
			pcall(function()
				playerDangerLabel:UpdateName("Player: <font color='rgb(0,255,170)'><b>SAFE</b></font>")
			end)
		end
	end

	hazardScanner.OnPlayerDangerChanged(function(inDanger, threatInfo, threatType)
		updatePlayerDanger(inDanger, threatInfo, threatType)
	end)

	hazardScanner.OnSafeSpotChanged(function(inDanger, spot, dist)
		if inDanger and spot then
			pcall(function()
				safeSpotLabel:UpdateName(("Safe Spot: <font color='rgb(0,255,120)'><b>Found (%.1f studs)</b></font>"):format(dist))
			end)
		else
			pcall(function()
				safeSpotLabel:UpdateName("Safe Spot: <font color='rgb(160,160,160)'>None Needed</font>")
			end)
		end
	end)

	hazardScanner.OnDodgeStateChanged(function(isDodging, spot, dist)
		if isDodging and spot then
			pcall(function()
				dodgeStatusLabel:UpdateName(("Auto Dodge: <font color='rgb(0,255,200)'><b>Dodging (%.1f studs)</b></font>"):format(dist))
			end)
		else
			pcall(function()
				dodgeStatusLabel:UpdateName("Auto Dodge: <font color='rgb(160,160,160)'>Idle</font>")
			end)
		end
	end)

	local function updateMonitor(count, lastInfo)
		count = count or hazardScanner.GetHazardCount()
		lastInfo = lastInfo or hazardScanner.GetLastHazardInfo()

		local isEnabled = hazardScanner.IsEnabled()
		local statusColor = isEnabled and "0, 255, 0" or "255, 80, 80"
		local statusText = isEnabled and "Active (Scanning & SelectionBox)" or "Disabled"

		pcall(function()
			statusLabel:UpdateName("Detector: <font color='rgb(" .. statusColor .. ")'>" .. statusText .. "</font>")
		end)

		local countColor = count > 0 and "255, 60, 60" or "0, 255, 0"
		pcall(function()
			activeCountLabel:UpdateName("Active Hazards: <font color='rgb(" .. countColor .. ")'>" .. tostring(count) .. "</font>")
		end)

		if lastInfo then
			pcall(function()
				lastHazardLabel:UpdateName(("Last Detected: <font color='rgb(255,220,120)'>%s</font> (%s, %d studs)"):format(
					lastInfo.Name, lastInfo.Class, lastInfo.Distance
				))
			end)
		else
			pcall(function()
				lastHazardLabel:UpdateName("Last Detected: <font color='rgb(160,160,160)'>None</font>")
			end)
		end
	end

	--// Right Section - Specific Skill Inspector
	rightSection:Header({ Name = "Specific Skill Inspector" })

	rightSection:Toggle({
		Name = "Enable Deep Inspector",
		Default = hazardScanner.IsInspectEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetInspectEnabled(state)
		end),
	}, "Toggle_HazardDeepInspector")

	rightSection:Input({
		Name = "Target Skill Name",
		Placeholder = "e.g. Meteor, Spike, Flame...",
		AcceptedCharacters = "All",
		Default = hazardScanner.GetInspectTarget(),
		Callback = autoSave.Wrap(function(text)
			hazardScanner.SetInspectTarget(text)
		end),
	})

	hazardScanner.OnHazardChanged(function(count, lastInfo)
		updateMonitor(count, lastInfo)
	end)

	--// Left Section Controls
	leftSection:Toggle({
		Name = "Enable Hazard Scanner",
		Default = hazardScanner.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.Toggle(state)
			updateMonitor()
		end),
	}, "Toggle_SmartDodgeThreatDetection")

	leftSection:Toggle({
		Name = "Show Player 2D Hitbox (Ground Visual)",
		Default = hazardScanner.IsPlayerVisualEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetPlayerVisualEnabled(state)
		end),
	}, "Toggle_HazardPlayer2DVisual")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Player 2D Hitbox Radius",
		Suffix = " studs",
		Default = hazardScanner.GetPlayerHitboxRadius(),
		Minimum = 0.5,
		Maximum = 8,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			hazardScanner.SetPlayerHitboxRadius(val)
		end),
	}, "Slider_HazardPlayer2DHitboxRadius"))

	leftSection:Toggle({
		Name = "Show 3D Selection Boxes (Parts)",
		Default = hazardScanner.IsSelectionBoxesEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetSelectionBoxesEnabled(state)
		end),
	}, "Toggle_HazardSelectionBoxes")

	leftSection:Toggle({
		Name = "Show Danger Zones (Ground Visualizer)",
		Default = hazardScanner.IsVisualizerEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetVisualizerEnabled(state)
		end),
	}, "Toggle_HazardGroundVisualizer")

	leftSection:Toggle({
		Name = "Show Trajectory Paths (Orange)",
		Default = hazardScanner.IsTrajectoryEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetTrajectoryEnabled(state)
		end),
	}, "Toggle_HazardTrajectoryVisualizer")

	leftSection:Toggle({
		Name = "Show Safe Spot Marker (Green Visual)",
		Default = hazardScanner.IsSafeSpotVisualEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetSafeSpotVisualEnabled(state)
		end),
	}, "Toggle_HazardSafeSpotVisual")

	leftSection:Toggle({
		Name = "Show Candidate Points & Rays (Scan Grid)",
		Default = hazardScanner.IsShowCandidates(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetShowCandidates(state)
		end),
	}, "Toggle_HazardShowCandidates")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Safe Spot Safety Margin",
		Suffix = " studs",
		Default = hazardScanner.GetSafeSpotBuffer(),
		Minimum = 0.0,
		Maximum = 6.0,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			hazardScanner.SetSafeSpotBuffer(val)
		end),
	}, "Slider_HazardSafeSpotBuffer"))

	leftSection:Toggle({
		Name = "Enable Auto Dodge (Move + Snap)",
		Default = hazardScanner.IsAutoDodgeEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetAutoDodgeEnabled(state)
		end),
	}, "Toggle_HazardAutoDodgeEnabled")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Dodge Snap Distance",
		Suffix = " studs",
		Default = hazardScanner.GetDodgeSnapDistance(),
		Minimum = 0.5,
		Maximum = 5.0,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			hazardScanner.SetDodgeSnapDistance(val)
		end),
	}, "Slider_HazardDodgeSnapDistance"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Trajectory Length",
		Suffix = " studs",
		Default = hazardScanner.GetTrajectoryLength(),
		Minimum = 10,
		Maximum = 150,
		DisplayMethod = "Value",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			hazardScanner.SetTrajectoryLength(val)
		end),
	}, "Slider_HazardTrajectoryLength"))

	leftSection:Toggle({
		Name = "Log Hazards (Spawns / Despawns)",
		Default = hazardScanner.IsLogHazardsEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetLogHazards(state)
		end),
	}, "Toggle_SmartDodgeLogHazards")

	leftSection:Toggle({
		Name = "Log Rejected (Không vẽ được)",
		Default = hazardScanner.IsLogFailedEnabled(),
		Callback = autoSave.Wrap(function(state)
			hazardScanner.SetLogFailed(state)
		end),
	}, "Toggle_SmartDodgeLogRejected")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Danger Zone Padding",
		Suffix = " studs",
		Default = hazardScanner.GetHazardPadding(),
		Minimum = 0,
		Maximum = 10,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			hazardScanner.SetHazardPadding(val)
		end),
	}, "Slider_HazardZonePadding"))

	leftSection:Button({
		Name = "Clear Console",
		Callback = function()
			pcall(function()
				if rconsoleclear then rconsoleclear() end
			end)
		end,
	})

	-- Khởi tạo monitor
	updateMonitor()
end end function __DIST.u()-- Coordinator (DungeonQuest): Điều phối loại trừ lẫn nhau giữa các hệ thống điều khiển nhân vật.
-- Module lá — không require ai để tránh cycle import bị darklua (bundler) phát hiện.


local coordinator = {}
local features = {}
local locked = false

--// Khóa coordinator: dùng trong quá trình nạp config (LoadConfig) để tránh
--// các toggle cũ / toggle thành phần đè chết toggle master hệ thống.
function coordinator.SetLocked(state)
	locked = state and true or false
end

function coordinator.IsLocked()
	return locked
end

--// Đăng ký 1 hệ thống có thể bị tắt độc quyền. setEnabled(false) được gọi khi
--// một hệ thống khác bật lên. isEnabled() trả về trạng thái đang chạy.
function coordinator.Register(name, setEnabled, isEnabled)
	if type(name) ~= "string" or type(setEnabled) ~= "function" or type(isEnabled) ~= "function" then return end
	features[name] = {
		setEnabled = setEnabled,
		isEnabled = isEnabled,
	}
end

--// Bật độc quyền 1 hệ thống: tự động TẮT toàn bộ hệ thống khác đang chạy trước đó.
function coordinator.EnableExclusive(name)
	if locked then return end
	for otherName, feat in pairs(features) do
		if otherName ~= name and feat.isEnabled() then
			pcall(feat.setEnabled, false)
		end
	end
end

function coordinator.IsEnabled(name)
	local feat = features[name]
	return feat ~= nil and feat.isEnabled()
end

return coordinator end function __DIST.v()-- Auto Farm System – Component A & B: Enemy Scanner & Enemy Validator
-- Spec: Sections 3 & 4 (Roblox_Target_Movement_System_AI_Spec.txt)


local services = __DIST.load('e')
local shared = __DIST.load('f')
local player = services.player

local scanner = {}

--// B. Enemy Validation (Section 4)
-- An enemy is valid only if:
-- 1. Enemy still exists (model and model.Parent).
-- 2. Enemy is a valid enemy entity (model ~= player.Character).
-- 3. Enemy is alive (Humanoid.Health > 0).
-- 4. Required movement/root component exists.
-- 5. Enemy belongs to a valid/relevant room.
function scanner.Validate(enemyData)
	if not enemyData then return false end
	local model = enemyData.Model
	if not model or not model.Parent or model == player.Character then return false end

	local humanoid = enemyData.Humanoid
	if not humanoid or not humanoid.Parent then
		humanoid = model:FindFirstChildOfClass("Humanoid")
		enemyData.Humanoid = humanoid
	end
	if not humanoid or humanoid.Health <= 0 then return false end

	local root = enemyData.Root
	if not root or not root.Parent then
		root = model:FindFirstChild("HumanoidRootPart") or model.PrimaryPart
		if not root then
			for _, obj in ipairs(model:GetDescendants()) do
				if obj:IsA("BasePart") then
					root = obj
					break
				end
			end
		end
		if not root then return false end
		enemyData.Root = root
	end

	return true
end

--// A. Enemy Scanner (Section 3)
-- Scans all rooms, collects enemy entities, validates them, and produces ValidEnemyList.
function scanner.Scan()
	local validList = {}
	local tracked = shared.GetTrackedEnemyData()
	for _, data in ipairs(tracked) do
		if scanner.Validate(data) then
			table.insert(validList, data)
		end
	end
	return validList
end

return scanner
end function __DIST.w()-- Target Movement System – Component C: Target Selector
-- Selects the nearest valid enemy instantaneously (0ms, no Pathfinding latency)


local selector = {}

--// Evaluates all valid enemies and selects the one nearest to the player
function selector.SelectBestTarget(playerPos, validEnemies, cancelCheck)
	local bestTarget = nil
	local bestDistSq = math.huge
	local bestPos = nil

	for _, enemyData in ipairs(validEnemies) do
		if cancelCheck and cancelCheck() then
			return nil, nil, nil, nil, math.huge
		end

		local root = enemyData.Root
		if root and root.Parent then
			local ePos = root.Position
			local dx = ePos.X - playerPos.X
			local dz = ePos.Z - playerPos.Z
			local distSq = dx * dx + dz * dz

			if distSq < bestDistSq then
				bestDistSq = distSq
				bestTarget = enemyData
				bestPos = ePos
			end
		end
	end

	local bestDist = bestDistSq < math.huge and math.sqrt(bestDistSq) or math.huge
	return bestTarget, nil, nil, bestPos, bestDist
end

return selector
end function __DIST.x()-- Target Movement System – Component D: Target Tracker & Path Manager
-- Spec: Sections 7, 8, 14, 15 (Roblox_Target_Movement_System_AI_Spec.txt)


local selector = __DIST.load('w')
local scanner = __DIST.load('v')

local tracker = {}

local currentTarget = nil
local currentPathInstance = nil
local currentWaypoints = {}
local currentWaypointIndex = 1
local lastPathDestPos = nil
local repathThreshold = 6 -- Studs target must move to trigger repath

function tracker.GetTarget()
	return currentTarget
end

function tracker.GetPathInstance()
	return currentPathInstance
end

function tracker.GetWaypoints()
	return currentWaypoints
end

function tracker.GetWaypointIndex()
	return currentWaypointIndex
end

function tracker.SetWaypointIndex(val)
	currentWaypointIndex = math.clamp(val, 1, math.max(1, #currentWaypoints))
end

function tracker.AdvanceWaypointIndex(playerPos)
	if not currentWaypoints or #currentWaypoints == 0 then return end
	local wp = currentWaypoints[currentWaypointIndex]
	if wp then
		local flatDist = Vector3.new(wp.Position.X - playerPos.X, 0, wp.Position.Z - playerPos.Z).Magnitude
		if flatDist <= 3.5 then
			currentWaypointIndex = math.min(#currentWaypoints + 1, currentWaypointIndex + 1)
		end
	end
end

function tracker.GetLastPathDestPos()
	return lastPathDestPos
end

function tracker.SetRepathThreshold(val)
	if type(val) == "number" and val > 0 then
		repathThreshold = val
	end
end

function tracker.GetRepathThreshold()
	return repathThreshold
end

function tracker.SetTarget(target, pathInstance, waypoints, destPos)
	if currentPathInstance and currentPathInstance ~= pathInstance then
		pcall(function() currentPathInstance:Destroy() end)
	end

	currentTarget = target
	currentPathInstance = pathInstance
	currentWaypoints = waypoints or {}
	currentWaypointIndex = 1
	lastPathDestPos = destPos
end

function tracker.UpdatePath(pathInstance, waypoints, destPos)
	if currentPathInstance and currentPathInstance ~= pathInstance then
		pcall(function() currentPathInstance:Destroy() end)
	end

	currentPathInstance = pathInstance
	currentWaypoints = waypoints or {}
	currentWaypointIndex = 1
	lastPathDestPos = destPos
end


function tracker.ClearTarget()
	if currentPathInstance then
		pcall(function() currentPathInstance:Destroy() end)
	end
	currentTarget = nil
	currentPathInstance = nil
	currentWaypoints = {}
	currentWaypointIndex = 1
	lastPathDestPos = nil
end

-- Validates whether the current target is still active, alive, and exists
function tracker.IsTargetValid()
	if not currentTarget then return false end
	return scanner.Validate(currentTarget)
end

-- Checks if target position shifted beyond repath threshold
function tracker.NeedsRepath(currentEnemyPos)
	if not currentPathInstance or not currentWaypoints or #currentWaypoints == 0 then
		return true
	end
	if not lastPathDestPos or not currentEnemyPos then
		return true
	end
	return (currentEnemyPos - lastPathDestPos).Magnitude > repathThreshold
end

-- Repaths toward current target's current position
function tracker.Repath(playerPos, currentEnemyPos)
	if not currentEnemyPos then return false end

	local path, waypoints, cost = selector.ComputePathWithCost(playerPos, currentEnemyPos)
	if path and #waypoints > 0 then
		if currentPathInstance then pcall(function() currentPathInstance:Destroy() end) end
		currentPathInstance = path
		currentWaypoints = waypoints
		currentWaypointIndex = 1
		lastPathDestPos = currentEnemyPos
		return true
	end

	return false
end

return tracker
end function __DIST.y()-- Target Movement System – Component E & F: Movement Controller & Blocking Checker
-- Spec: Sections 9, 10, 11, 12, 13 (Roblox_Target_Movement_System_AI_Spec.txt)


local services = __DIST.load('e')
local player = services.player

local movement = {}

--// Builds base ignore list for Raycast
local function buildBaseIgnoreList(customIgnoreList)
	local list = {}
	if customIgnoreList then
		for _, item in ipairs(customIgnoreList) do
			if item and item.Parent then table.insert(list, item) end
		end
	end

	if player and player.Character and player.Character.Parent then
		table.insert(list, player.Character)
	end

	local rayIgnore = workspace:FindFirstChild("RaycastIgnore")
	if rayIgnore then
		table.insert(list, rayIgnore)
	end

	return list
end

--// Single Penetrative Raycast
-- Steps through any non-collidable parts (CanCollide == false)
-- Stops and reports blocked as soon as any collidable obstacle (CanCollide == true) is hit.
function movement.CastRay(fromPos, toPos, ignoreList)
	local direction = toPos - fromPos
	local dist = direction.Magnitude
	if dist < 0.3 then return false, nil, toPos end

	local rayParams = RaycastParams.new()
	rayParams.FilterType = Enum.RaycastFilterType.Exclude
	rayParams.FilterDescendantsInstances = buildBaseIgnoreList(ignoreList)
	rayParams.IgnoreWater = true

	local currentOrigin = fromPos
	local remainingDir = direction
	local maxSteps = 8

	for _ = 1, maxSteps do
		local result = workspace:Raycast(currentOrigin, remainingDir, rayParams)
		if not result then
			return false, nil, toPos
		end

		local hit = result.Instance
		if hit and hit.CanCollide and hit.CanQuery ~= false then
			-- Filter out walkable floors, slopes, ramps, and stairs
			-- Walkable surfaces have Normal.Y > 0.65 (slopes up to ~50° that player can step over)
			if result.Normal.Y > 0.65 then
				-- Walkable ground/slope -> advance past it
				local advance = (result.Position - currentOrigin).Magnitude + 0.15
				if advance >= remainingDir.Magnitude then
					return false, nil, toPos
				end
				currentOrigin = result.Position + remainingDir.Unit * 0.15
				remainingDir = toPos - currentOrigin
			else
				-- Steep vertical wall/pillar/obstacle (Normal.Y <= 0.65) -> BLOCKER!
				return true, hit, result.Position
			end
		else
			-- Advance origin slightly past this non-collidable part
			local advance = (result.Position - currentOrigin).Magnitude + 0.15
			if advance >= remainingDir.Magnitude then
				return false, nil, toPos
			end
			currentOrigin = result.Position + remainingDir.Unit * 0.15
			remainingDir = toPos - currentOrigin
		end
	end

	return false, nil, toPos
end

--// Multi-Ray Clearance Check
-- Checks Center ray + Left & Right shoulder clearance (prevents corner snagging)
function movement.CheckClearance(fromPos, toPos, ignoreList)
	-- 1. Center Ray
	local blocked, hitPart, hitPos = movement.CastRay(fromPos, toPos, ignoreList)
	if blocked then
		return true, hitPart, hitPos
	end

	-- 2. Side Clearance Rays (Offset by 0.6 studs)
	local flat = Vector3.new(toPos.X - fromPos.X, 0, toPos.Z - fromPos.Z)
	if flat.Magnitude > 0.8 then
		local forward = flat.Unit
		local sideOffset = Vector3.new(-forward.Z, 0, forward.X) * 0.6

		-- Check Left Shoulder
		local lOrigin = fromPos + sideOffset
		local lDest = toPos + sideOffset
		local lStartBlocked = movement.CastRay(fromPos, lOrigin, ignoreList)
		if not lStartBlocked then
			local lBlocked, lHitPart, lHitPos = movement.CastRay(lOrigin, lDest, ignoreList)
			if lBlocked and (lHitPos - lOrigin).Magnitude > 1.0 then
				return true, lHitPart, lHitPos
			end
		end

		-- Check Right Shoulder
		local rOrigin = fromPos - sideOffset
		local rDest = toPos - sideOffset
		local rStartBlocked = movement.CastRay(fromPos, rOrigin, ignoreList)
		if not rStartBlocked then
			local rBlocked, rHitPart, rHitPos = movement.CastRay(rOrigin, rDest, ignoreList)
			if rBlocked and (rHitPos - rOrigin).Magnitude > 1.0 then
				return true, rHitPart, rHitPos
			end
		end
	end

	return false, nil, toPos
end

--// Blocked Destination Resolution (Sections 11, 12, 13)
-- Iterates backward through path nodes when direct target line is blocked
function movement.ResolveDestination(playerPos, targetPos, waypoints, startWaypointIndex, ignoreList)
	local rayOrigin = playerPos
	local rayTarget = targetPos

	local blockerData = {
		origin = rayOrigin,
		targetPos = rayTarget,
		directBlocked = false,
		directHitPart = nil,
		directHitPos = nil,
		chosenDest = nil,
		mode = "None",
		nodeIdx = nil,
	}

	-- 1. Check direct line to target
	local directBlocked, hitPart, hitPos = movement.CheckClearance(rayOrigin, rayTarget, ignoreList)
	blockerData.directBlocked = directBlocked
	blockerData.directHitPart = hitPart
	blockerData.directHitPos = hitPos

	if not directBlocked then
		blockerData.chosenDest = targetPos
		blockerData.mode = "Direct"
		return targetPos, "Direct", nil, blockerData
	end

	-- 2. Direct line blocked: Iterate backward through path nodes (Node N -> Node startWaypointIndex)
	local minIndex = math.clamp(startWaypointIndex or 1, 1, waypoints and #waypoints or 1)
	if waypoints and #waypoints > 0 then
		for i = #waypoints, minIndex, -1 do
			local wp = waypoints[i]
			local nodePos = wp.Position
			local rayNode = nodePos + Vector3.new(0, 2.0, 0) -- Lift waypoint to match player waist height
			local nodeBlocked, nHitPart, nHitPos = movement.CheckClearance(rayOrigin, rayNode, ignoreList)
			if not nodeBlocked then
				blockerData.chosenDest = nodePos
				blockerData.mode = "Waypoint"
				blockerData.nodeIdx = i
				return nodePos, "Waypoint", i, blockerData
			end
		end
	end

	-- 3. All destinations blocked / No valid previous node exists
	blockerData.mode = "Blocked"
	return nil, "Blocked", nil, blockerData
end

--// Movement Controller (Section 9)
-- Executes Freewalk / direct MoveTo toward the clear destination
function movement.ExecuteMove(humanoid, playerPos, destination, waypoints, currentWaypointIndex)
	if not humanoid or not destination then return end

	humanoid:MoveTo(destination)

	-- 1. Check elevation jump to destination
	local elevDiff = destination.Y - playerPos.Y
	local flatDistToDest = Vector3.new(destination.X - playerPos.X, 0, destination.Z - playerPos.Z).Magnitude
	if elevDiff > 1.8 and flatDistToDest <= 7.0 then
		humanoid.Jump = true
		return
	end

	-- 2. Check path waypoints jump action for nearby upcoming waypoints
	if waypoints and #waypoints > 0 then
		local idx = math.clamp(currentWaypointIndex or 1, 1, #waypoints)
		for i = idx, math.min(idx + 2, #waypoints) do
			local wp = waypoints[i]
			if wp then
				local flatDist = Vector3.new(wp.Position.X - playerPos.X, 0, wp.Position.Z - playerPos.Z).Magnitude
				if flatDist <= 5.0 then
					if wp.Action == Enum.PathWaypointAction.Jump or (wp.Position.Y - playerPos.Y) > 1.8 then
						humanoid.Jump = true
						break
					end
				end
			end
		end
	end
end

return movement

end function __DIST.z()-- Auto Farm System – Smart Auto Skill Manager (DungeonQuest)
-- Quản lý logic kích hoạt skill thông minh chạy HOÀN TOÀN ĐỘC LẬP VÀ SONG SONG:
-- - Có vòng lặp Heartbeat riêng, không bị phụ thuộc/chặn bởi Auto Farm di chuyển hay Auto Dodge né đòn.
-- - Cast Q và Cast E trong task.spawn riêng biệt, không block lẫn nhau và không block luồng game.
--
-- Logic:
-- 1. Skill Q (Buff Damage & Speed): Tự động kích hoạt/spam khi có Enemy tồn tại còn sống trên map.
-- 2. Skill E (Damage Skill): Chỉ kích hoạt khi:
--    - Khoảng cách 2D tới mục tiêu <= Skill E Cast Range (Slider độc lập).
--    - Chiêu Q đang có hiệu lực buff (nhận biết qua effect 'groundAura' tồn tại trong workspace).


local services = __DIST.load('e')
local shared = __DIST.load('f')
local lifecycle = __DIST.load('b')
local tracker = __DIST.load('x')

local RunService = services.RunService or game:GetService("RunService")
local VirtualInputManager = services.VirtualInputManager or game:GetService("VirtualInputManager")
local player = services.player

local autoSkill = {}

--// State
local enabled = false
local skillERange = 35.0 -- studs (Khoảng cách cast chiêu E độc lập)
local spamInterval = 0.15 -- giây giữa các lần bấm phím

local lastCastQ = 0
local lastCastE = 0
local isCastingQ = false
local isCastingE = false
local heartbeatConnection = nil

function autoSkill.IsEnabled()
	return enabled
end

-- Forward declaration
local startHeartbeat, stopHeartbeat

function autoSkill.SetEnabled(state)
	local want = state == true
	if want == enabled then return end
	enabled = want
	if enabled then
		startHeartbeat()
	else
		stopHeartbeat()
	end
end

-- Aliases for backward compatibility
autoSkill.IsSkillQEnabled = autoSkill.IsEnabled
autoSkill.SetSkillQEnabled = autoSkill.SetEnabled
autoSkill.IsSkillEEnabled = autoSkill.IsEnabled
autoSkill.SetSkillEEnabled = autoSkill.SetEnabled

function autoSkill.GetSkillERange()
	return skillERange
end

function autoSkill.SetSkillERange(val)
	if type(val) == "number" and val >= 2 then
		skillERange = val
	end
end

function autoSkill.GetSpamInterval()
	return spamInterval
end

function autoSkill.SetSpamInterval(val)
	if type(val) == "number" and val >= 0.05 then
		spamInterval = val
	end
end

--// Kiểm tra xem chiêu Q (Buff) có đang có hiệu lực hay không dựa vào effect 'groundAura' trong workspace
function autoSkill.IsBuffActive()
	local ok, aura = pcall(function()
		return workspace:FindFirstChild("groundAura")
	end)
	return ok and aura ~= nil
end

--// Lấy HumanoidRootPart của người chơi
local function getPlayerRoot()
	local lp = player or game:GetService("Players").LocalPlayer
	local char = lp and lp.Character
	local root = char and (char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart)
	if root and root.Parent then return root end
	return nil
end

--// Lấy Enemy mục tiêu tốt nhất và tính khoảng cách 2D phẳng (X-Z)
local function getBestEnemyAndDistance()
	local root = getPlayerRoot()
	if not root then return nil, math.huge, false end
	local playerPos = root.Position

	-- 1. Ưu tiên target hiện tại của AutoFarm Tracker
	local curTarget = tracker.GetTarget and tracker.GetTarget()
	if curTarget and curTarget.Root and curTarget.Root.Parent then
		local hum = curTarget.Humanoid or (curTarget.Model and curTarget.Model:FindFirstChildOfClass("Humanoid"))
		if hum and hum.Health > 0 then
			local ePos = curTarget.Root.Position
			local flatDist = Vector3.new(ePos.X - playerPos.X, 0, ePos.Z - playerPos.Z).Magnitude
			return curTarget, flatDist, true
		end
	end

	-- 2. Tìm quái sống gần nhất từ shared.GetTrackedEnemyData()
	local tracked = shared.GetTrackedEnemyData and shared.GetTrackedEnemyData()
	local closestTarget = nil
	local closestDistSq = math.huge
	local hasAnyLivingEnemy = false

	if tracked and #tracked > 0 then
		for _, data in ipairs(tracked) do
			if data and data.Root and data.Root.Parent then
				local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
				if hum and hum.Health > 0 then
					hasAnyLivingEnemy = true
					local ePos = data.Root.Position
					local dx = ePos.X - playerPos.X
					local dz = ePos.Z - playerPos.Z
					local distSq = dx * dx + dz * dz
					if distSq < closestDistSq then
						closestDistSq = distSq
						closestTarget = data
					end
				end
			end
		end
	end

	local closestFlatDist = closestDistSq < math.huge and math.sqrt(closestDistSq) or math.huge
	return closestTarget, closestFlatDist, hasAnyLivingEnemy
end

--// Bấm và nhả phím Q đơn lập (Buff) trong luồng độc lập
function autoSkill.CastSkillQ()
	if isCastingQ then return end
	isCastingQ = true
	task.spawn(function()
		local holdTime = (shared.GetKeyHoldTime and shared.GetKeyHoldTime()) or 0.05
		pcall(function()
			VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
		end)
		task.wait(holdTime)
		pcall(function()
			VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
		end)
		isCastingQ = false
	end)
end

--// Bấm và nhả phím E đơn lập (Damage) trong luồng độc lập
function autoSkill.CastSkillE()
	if isCastingE then return end
	isCastingE = true
	task.spawn(function()
		local holdTime = (shared.GetKeyHoldTime and shared.GetKeyHoldTime()) or 0.05
		pcall(function()
			VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
		end)
		task.wait(holdTime)
		pcall(function()
			VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
		end)
		isCastingE = false
	end)
end

--// Vòng lặp chính xử lý Smart Skills độc lập trên Heartbeat
local function onHeartbeat()
	if not enabled or shared.IsInLobby() then return end

	local root = getPlayerRoot()
	if not root then return end

	local char = root.Parent
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then return end

	local target, flatDist, hasEnemy = getBestEnemyAndDistance()
	local now = os.clock()

	-- 1. Xử lý Skill Q (Buff): Kích hoạt song song khi có Enemy tồn tại trên map
	if (now - lastCastQ >= spamInterval) and not isCastingQ then
		if hasEnemy then
			lastCastQ = now
			autoSkill.CastSkillQ()
		end
	end

	-- 2. Xử lý Skill E (Damage): Kích hoạt song song khi có Target, nằm trong tầm range độc lập VÀ chiêu Q đang buff (groundAura)
	if (now - lastCastE >= spamInterval) and not isCastingE then
		if target and flatDist <= skillERange then
			local buffActive = autoSkill.IsBuffActive()
			if buffActive then
				lastCastE = now
				autoSkill.CastSkillE()
			end
		end
	end
end

startHeartbeat = function()
	if not heartbeatConnection then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

stopHeartbeat = function()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	isCastingQ = false
	isCastingE = false
end

-- Hook trực tiếp Step từ bên ngoài nếu cần
function autoSkill.Step(deltaTime, currentTarget, flatDistToTarget)
	-- Heartbeat riêng đã tự động xử lý 100% song song và độc lập
end

lifecycle.Register(function()
	autoSkill.SetEnabled(false)
end)

return autoSkill
end function __DIST.A()-- Auto Farm System – Component G: State / Interrupt Manager & Facade
-- Spec: Sections 2, 16, 17, 18, 19, 20 (Roblox_Target_Movement_System_AI_Spec.txt)

--// Imports

local services = __DIST.load('e')
local shared = __DIST.load('f')
local lifecycle = __DIST.load('b')
local coordinator = __DIST.load('u')

local scanner = __DIST.load('v')
local selector = __DIST.load('w')
local tracker = __DIST.load('x')
local movement = __DIST.load('y')
local hazardScanner = __DIST.load('s')
local autoSkill = __DIST.load('z')

--// Services
local RunService = services.RunService
local player = services.player

--// State Machine Enum
local State = {
	NO_TARGET = "NO_TARGET",
	ACQUIRING_TARGET = "ACQUIRING_TARGET",
	TRACKING_TARGET = "TRACKING_TARGET",
	CHASE = "CHASE",
	HOLD = "HOLD",
	KITE = "KITE",
	BLOCKED = "BLOCKED",
	REPATHING = "REPATHING",
}

local autoFarm = {}

--// Configuration Parameters
local enabled = false
local running = false
local scanInterval = 1.5 -- Seconds between periodic target scans
local minCombatDistance = 25.0 -- Studs: khoảng cách tối thiểu (lùi lại kiting khi quái lại gần hơn mức này)
local maxCombatDistance = 50.0 -- Studs: khoảng cách tối đa (tiến lại gần khi quái xa hơn mức này)
local autoFaceTarget = true -- Tự động xoay mặt nhìn về phía kẻ địch khi combat
local repathDistance = 6.0 -- Studs target moves before triggering repath

--// Visual Debug Flags
local showPlannedPath = true
local showActualPath = true
local showTargetVisual = true
local showBlockerRay = true -- Show Red/Green Blocker Detection Ray

--// Runtime State
local currentState = State.NO_TARGET
local currentDestination = nil
local currentDestMode = "None"
local currentDestNodeIndex = nil
local lastBlockerData = nil
local lastScanTime = 0
local selectToken = 0
local selectRunning = false
local moveConnection = nil
local enemyChangedConnection = nil
local respawnConnection = nil
local dunReady = false

--// Velocity Stuck Detection State
local stuckTimer = 0
local lastJumpTime = 0
local autoJumpOnStuck = false -- Toggle tự động nhảy khi vận tốc thấp
local stuckVelocityThreshold = 10.0 -- Ngưỡng vận tốc (studs/s)
local isPaused = false -- Tạm dừng di chuyển mà không hủy path





--// Visual Instances
local debugTargetPart = nil
local debugEnemyHighlight = nil
local debugPathLines = {}
local debugPathAdornee = nil
local debugActualLine = nil
local debugActualMarkerPart = nil
local debugBlockerLine = nil
local debugBlockerHitMarker = nil
local debugPathCacheKey = nil

--// Forward declarations
local evaluateTarget

--// ============================================================
--// HELPERS
--// ============================================================

local function getPlayerRoot()
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if root and root.Parent then return root end
	return nil
end

local function getSafePosition(part)
	if not part or not part.Parent then return nil end
	local ok, pos = pcall(function() return part.Position end)
	if not ok or not pos then return nil end
	return pos
end

--// ============================================================
--// TARGET SWITCHING & EVALUATION (System A)
--// ============================================================

local function isSameTarget(a, b)
	if a == b then return true end
	if a and b and a.Model and b.Model and a.Model == b.Model then
		return true
	end
	return false
end

local function applyTargetSwitch(newTarget, newPos)
	local cur = tracker.GetTarget()
	if isSameTarget(cur, newTarget) then
		return
	end

	-- Priority 2: New target selected -> Interrupt current movement
	tracker.SetTarget(newTarget, nil, nil, newPos)
	currentDestination = nil
	currentDestMode = "None"
	currentDestNodeIndex = nil
	lastBlockerData = nil
	stuckTimer = 0

	if newTarget then
		currentState = State.CHASE
	else
		currentState = State.NO_TARGET
	end
end


evaluateTarget = function()
	if selectRunning or not enabled or not running then return end
	selectToken += 1
	local token = selectToken
	selectRunning = true

	local root = getPlayerRoot()
	local playerPos = root and getSafePosition(root)
	if not playerPos then
		selectRunning = false
		return
	end

	local validList = scanner.Scan()
	if #validList == 0 then
		if token == selectToken and enabled and running then
			applyTargetSwitch(nil, nil)
		end
		selectRunning = false
		return
	end

	local bestTarget, _, _, bestPos = selector.SelectBestTarget(
		playerPos,
		validList,
		function()
			return token ~= selectToken or not enabled or not running
		end
	)

	if token == selectToken and enabled and running then
		applyTargetSwitch(bestTarget, bestPos)
	end

	selectRunning = false
end

--// ============================================================
--// MOVEMENT LOOP (System B - Continuous on Heartbeat)
--// ============================================================

local function stepMovementLoop(deltaTime)
	if shared.IsInLobby() or not dunReady then return end

	local playerRoot = getPlayerRoot()
	local humanoid = shared.GetHumanoid()
	if not playerRoot or not humanoid or humanoid.Health <= 0 then
		return
	end

	local playerPos = getSafePosition(playerRoot)
	if not playerPos then return end

	-- Nếu Auto-Dodge đang chủ động né nguy hiểm -> tạm nhường quyền điều khiển di chuyển
	if hazardScanner.IsCurrentlyDodging and hazardScanner.IsCurrentlyDodging() then
		return
	end

	-- Nếu đang tạm dừng di chuyển (giữ vị trí khi combat hoặc né) -> không bước tiếp
	if isPaused then
		return
	end

	-- Periodic Target Rescan (System A)
	local now = os.clock()
	if now - lastScanTime >= scanInterval then
		lastScanTime = now
		if currentState ~= State.HOLD and currentState ~= State.KITE then
			evaluateTarget()
		end
	end

	-- Priority 1: Current target invalid/dead/destroyed
	local target = tracker.GetTarget()
	if target then
		if not tracker.IsTargetValid() then
			tracker.ClearTarget()
			currentState = State.NO_TARGET
			currentDestination = nil
			currentDestMode = "None"
			lastBlockerData = nil
			pcall(function()
				humanoid:MoveTo(playerPos)
				humanoid.AutoRotate = true
			end)
			evaluateTarget()
			return
		end
	end

	-- Priority 1b: No target
	if not target or currentState == State.NO_TARGET then
		currentDestination = nil
		currentDestMode = "None"
		lastBlockerData = nil
		pcall(function()
			humanoid:MoveTo(playerPos)
			humanoid.AutoRotate = true
		end)
		if not selectRunning and now - lastScanTime >= 0.5 then
			lastScanTime = now
			evaluateTarget()
		end
		return
	end

	local enemyPos = target.Root and getSafePosition(target.Root)
	if not enemyPos then
		tracker.ClearTarget()
		currentState = State.NO_TARGET
		lastBlockerData = nil
		pcall(function()
			humanoid:MoveTo(playerPos)
			humanoid.AutoRotate = true
		end)
		return
	end

	-- Check Target Reach & Combat Range Condition ([minCombatDistance, maxCombatDistance])
	local flatDelta = Vector3.new(enemyPos.X - playerPos.X, 0, enemyPos.Z - playerPos.Z)
	local flatDist = flatDelta.Magnitude

	-- Auto Face Target (Khóa xoay mặt nhìn thẳng về phía kẻ địch khi trong tầm combat)
	if autoFaceTarget and flatDist <= (maxCombatDistance + 25) then
		pcall(function()
			humanoid.AutoRotate = false
			local lookPos = Vector3.new(enemyPos.X, playerRoot.Position.Y, enemyPos.Z)
			if (lookPos - playerRoot.Position).Magnitude > 0.5 then
				playerRoot.CFrame = CFrame.lookAt(playerRoot.Position, lookPos)
			end
		end)
	else
		pcall(function() humanoid.AutoRotate = true end)
	end

	-- Auto Skill: Quản lý smart skill Q (Buff khi có hazard) và E (Damage khi có buff & trong tầm range)
	autoSkill.Step(deltaTime, target, flatDist)

	if flatDist < minCombatDistance then
		-- Case 1: Quá gần (< minCombatDistance) -> KITE / Lùi thẳng ra xa giữ cự ly
		local awayDelta = Vector3.new(playerPos.X - enemyPos.X, 0, playerPos.Z - enemyPos.Z)
		local awayDir = awayDelta.Magnitude > 0.1 and awayDelta.Unit or Vector3.new(0, 0, 1)
		local backDist = math.clamp(minCombatDistance - flatDist + 6, 4, 15)
		local backTarget = playerPos + awayDir * backDist

		-- Kiểm tra xem điểm lùi về có an toàn không
		local isBackSafe = true
		if hazardScanner and hazardScanner.IsPointSafe then
			isBackSafe = hazardScanner.IsPointSafe(backTarget, 0.5)
		end

		if not isBackSafe then
			currentState = State.HOLD
			currentDestMode = "Hold (Danger Behind)"
			currentDestination = nil
			stuckTimer = 0
			pcall(function() humanoid:MoveTo(playerPos) end)
		else
			currentState = State.KITE
			currentDestMode = "Kite"
			stuckTimer = 0
			currentDestination = backTarget
			humanoid:MoveTo(backTarget)
		end
	elseif flatDist <= maxCombatDistance then
		-- Case 2: Nằm trong khoảng lý tưởng [minCombatDistance, maxCombatDistance] -> HOLD
		currentState = State.HOLD
		currentDestination = nil
		currentDestMode = "Hold"
		stuckTimer = 0
		pcall(function() humanoid:MoveTo(playerPos) end)
	else
		-- Case 3: Quá xa (> maxCombatDistance) -> CHASE / Tiến thẳng lại gần mục tiêu
		local approachDir = flatDelta.Magnitude > 0.1 and flatDelta.Unit or Vector3.new(0, 0, 1)

		-- Kiểm tra xem hướng bước tới (Lookahead Points) có đang nằm trong vùng nguy hiểm / đạn bay không
		local dangerAhead = false
		if hazardScanner and hazardScanner.IsPointSafe then
			-- Check các điểm trước mặt ở cự ly 3 studs, 6 studs, 10 studs
			for _, stepDist in ipairs({ 3, 6, 10 }) do
				if stepDist < flatDist then
					local checkPoint = playerPos + approachDir * stepDist
					if not hazardScanner.IsPointSafe(checkPoint, 0.5) then
						dangerAhead = true
						break
					end
				end
			end
		end

		if dangerAhead then
			-- Phía trước có bẫy / đạn / vùng đỏ -> ĐỨNG YÊN (HOLD) chờ nguy hiểm qua đi, không cắm đầu chạy vào!
			currentState = State.HOLD
			currentDestMode = "Hold (Danger Ahead)"
			currentDestination = nil
			stuckTimer = 0
			pcall(function() humanoid:MoveTo(playerPos) end)
		else
			currentState = State.CHASE
			currentDestMode = "Chase"
			local chaseTarget = Vector3.new(enemyPos.X, playerPos.Y, enemyPos.Z)
			currentDestination = chaseTarget

			humanoid:MoveTo(chaseTarget)

			-- Auto jump khi có chênh lệch độ cao (bậc thang, dốc)
			local elevDiff = enemyPos.Y - playerPos.Y
			if elevDiff > 1.8 and flatDist <= 8.0 then
				humanoid.Jump = true
			end

			-- Velocity-Based Stuck Detection & Auto-Jump
			local rootVel = playerRoot.AssemblyLinearVelocity or playerRoot.Velocity
			local horizontalSpeed = rootVel and Vector3.new(rootVel.X, 0, rootVel.Z).Magnitude or 0
			local dt = (type(deltaTime) == "number" and deltaTime > 0) and deltaTime or 0.016

			if horizontalSpeed < stuckVelocityThreshold then
				stuckTimer += dt
				if autoJumpOnStuck and (now - lastJumpTime) >= 0.4 then
					humanoid.Jump = true
					pcall(function() humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end)
					lastJumpTime = now
				end
			else
				stuckTimer = 0
			end
		end
	end
end






--// ============================================================
--// VISUAL DEBUGGING (Planned Path, Actual Move, Blocker Ray, Target)
--// ============================================================

local function ensureDebugTargetPart()
	if debugTargetPart and debugTargetPart.Parent then return debugTargetPart end
	debugTargetPart = Instance.new("Part")
	debugTargetPart.Name = "TM_TargetPart_Debug"
	debugTargetPart.Anchored = true
	debugTargetPart.CanCollide = false
	debugTargetPart.CanQuery = false
	debugTargetPart.CanTouch = false
	debugTargetPart.Size = Vector3.new(2, 2, 2)
	debugTargetPart.Transparency = 0.4
	debugTargetPart.Color = Color3.fromRGB(255, 50, 50)
	debugTargetPart.Material = Enum.Material.Neon
	debugTargetPart.Parent = workspace
	return debugTargetPart
end

local function ensureDebugHighlight()
	if debugEnemyHighlight and debugEnemyHighlight.Parent then return debugEnemyHighlight end
	if debugEnemyHighlight then
		pcall(function() debugEnemyHighlight:Destroy() end)
		debugEnemyHighlight = nil
	end
	debugEnemyHighlight = Instance.new("Highlight")
	debugEnemyHighlight.Name = "TM_EnemyHighlight_Debug"
	debugEnemyHighlight.FillColor = Color3.fromRGB(255, 200, 0)
	debugEnemyHighlight.FillTransparency = 0.5
	debugEnemyHighlight.OutlineColor = Color3.fromRGB(255, 0, 0)
	debugEnemyHighlight.OutlineTransparency = 0
	debugEnemyHighlight.Parent = workspace
	return debugEnemyHighlight
end

local function ensureDebugPathAdornee()
	if debugPathAdornee and debugPathAdornee.Parent then return debugPathAdornee end
	debugPathAdornee = Instance.new("Part")
	debugPathAdornee.Name = "TM_PathAdornee_Debug"
	debugPathAdornee.Anchored = true
	debugPathAdornee.CanCollide = false
	debugPathAdornee.CanQuery = false
	debugPathAdornee.CanTouch = false
	debugPathAdornee.Transparency = 1
	debugPathAdornee.Size = Vector3.new(1, 1, 1)
	debugPathAdornee.CFrame = CFrame.new(0, 0, 0)
	debugPathAdornee.Parent = workspace
	return debugPathAdornee
end

local function destroyPathVisuals()
	for _, obj in ipairs(debugPathLines) do
		pcall(function() obj:Destroy() end)
	end
	table.clear(debugPathLines)
	debugPathCacheKey = nil
end

local function updateVisualDebugs()
	if shared.IsInLobby() then return end

	local curTarget = tracker.GetTarget()
	local playerRoot = getPlayerRoot()
	local playerPos = playerRoot and getSafePosition(playerRoot)

	-- 1. Target Visuals
	if not showTargetVisual or not curTarget or not curTarget.Root then
		if debugTargetPart and debugTargetPart.Parent then
			debugTargetPart.CFrame = CFrame.new(0, -1000, 0)
		end
		if debugEnemyHighlight and debugEnemyHighlight.Parent then
			debugEnemyHighlight.Enabled = false
		end
	else
		local ePos = getSafePosition(curTarget.Root)
		if ePos then
			local part = ensureDebugTargetPart()
			part.CFrame = CFrame.new(ePos)
		end
		local hl = ensureDebugHighlight()
		if curTarget.Model and curTarget.Model.Parent then
			hl.Adornee = curTarget.Model
			hl.Enabled = true
		else
			hl.Enabled = false
		end
	end

	-- 2. Planned Path Visuals (Green line along waypoints)
	local waypoints = tracker.GetWaypoints()
	local pathInst = tracker.GetPathInstance()
	if not showPlannedPath or not waypoints or #waypoints == 0 then
		destroyPathVisuals()
	else
		local cacheKey = tostring(pathInst) .. "_" .. tostring(#waypoints)
		if debugPathCacheKey ~= cacheKey then
			destroyPathVisuals()
			local anchor = ensureDebugPathAdornee()
			for i = 2, #waypoints do
				local a = waypoints[i - 1].Position
				local b = waypoints[i].Position
				local dist = (b - a).Magnitude
				if dist > 0.01 then
					local line = Instance.new("LineHandleAdornment")
					line.Name = "TM_PathLine_Debug"
					line.Adornee = anchor
					line.Length = dist
					line.Thickness = 2
					line.Transparency = 0.3
					line.Color3 = Color3.fromRGB(0, 255, 120)
					line.ZIndex = 0
					line.CFrame = CFrame.lookAt(a, b)
					line.Parent = workspace
					debugPathLines[#debugPathLines + 1] = line
				end
			end
			debugPathCacheKey = cacheKey
		end
	end

	-- 3. Actual Destination Visuals (Cyan line + sphere marker)
	if not showActualPath or not currentDestination or not playerPos then
		if debugActualLine then debugActualLine.Visible = false end
		if debugActualMarkerPart and debugActualMarkerPart.Parent then
			debugActualMarkerPart.CFrame = CFrame.new(0, -1000, 0)
		end
	else
		local pPos = playerPos + Vector3.new(0, 0.5, 0)
		local dPos = currentDestination + Vector3.new(0, 0.5, 0)
		local dist = (dPos - pPos).Magnitude

		if dist >= 0.3 then
			if not debugActualLine or not debugActualLine.Parent then
				local anchor = ensureDebugPathAdornee()
				debugActualLine = Instance.new("LineHandleAdornment")
				debugActualLine.Name = "TM_ActualPath_Debug"
				debugActualLine.Adornee = anchor
				debugActualLine.Thickness = 3.5
				debugActualLine.Transparency = 0.15
				debugActualLine.Color3 = Color3.fromRGB(0, 230, 255)
				debugActualLine.ZIndex = 2
				debugActualLine.Parent = workspace
			end
			debugActualLine.Length = dist
			debugActualLine.CFrame = CFrame.lookAt(pPos, dPos)
			debugActualLine.Visible = true

			if not debugActualMarkerPart or not debugActualMarkerPart.Parent then
				debugActualMarkerPart = Instance.new("Part")
				debugActualMarkerPart.Name = "TM_ActualMarker_Debug"
				debugActualMarkerPart.Anchored = true
				debugActualMarkerPart.CanCollide = false
				debugActualMarkerPart.CanQuery = false
				debugActualMarkerPart.CanTouch = false
				debugActualMarkerPart.Shape = Enum.PartType.Ball
				debugActualMarkerPart.Size = Vector3.new(1.3, 1.3, 1.3)
				debugActualMarkerPart.Transparency = 0.2
				debugActualMarkerPart.Material = Enum.Material.Neon
				debugActualMarkerPart.Color = Color3.fromRGB(0, 230, 255)
				debugActualMarkerPart.Parent = workspace
			end
			debugActualMarkerPart.CFrame = CFrame.new(dPos)
		else
			if debugActualLine then debugActualLine.Visible = false end
			if debugActualMarkerPart and debugActualMarkerPart.Parent then
				debugActualMarkerPart.CFrame = CFrame.new(0, -1000, 0)
			end
		end
	end

	-- 4. Blocker Detection Ray Visual (Red line when blocked, Green when clear)
	if not showBlockerRay or not lastBlockerData or not playerPos or not curTarget then
		if debugBlockerLine then debugBlockerLine.Visible = false end
		if debugBlockerHitMarker and debugBlockerHitMarker.Parent then
			debugBlockerHitMarker.CFrame = CFrame.new(0, -1000, 0)
		end
	else
		local origin = lastBlockerData.origin or (playerPos + Vector3.new(0, 1.5, 0))
		local targetEnd = lastBlockerData.directHitPos or lastBlockerData.targetPos
		local isBlocked = lastBlockerData.directBlocked

		if targetEnd then
			local rayDist = (targetEnd - origin).Magnitude
			if rayDist >= 0.2 then
				if not debugBlockerLine or not debugBlockerLine.Parent then
					local anchor = ensureDebugPathAdornee()
					debugBlockerLine = Instance.new("LineHandleAdornment")
					debugBlockerLine.Name = "TM_BlockerRay_Debug"
					debugBlockerLine.Adornee = anchor
					debugBlockerLine.Thickness = 3
					debugBlockerLine.Transparency = 0.2
					debugBlockerLine.ZIndex = 3
					debugBlockerLine.Parent = workspace
				end

				debugBlockerLine.Length = rayDist
				debugBlockerLine.Color3 = isBlocked and Color3.fromRGB(255, 30, 30) or Color3.fromRGB(50, 255, 50)
				debugBlockerLine.CFrame = CFrame.lookAt(origin, targetEnd)
				debugBlockerLine.Visible = true

				-- Marker part at blocker hit location
				if isBlocked and lastBlockerData.directHitPos then
					if not debugBlockerHitMarker or not debugBlockerHitMarker.Parent then
						debugBlockerHitMarker = Instance.new("Part")
						debugBlockerHitMarker.Name = "TM_BlockerHitMarker_Debug"
						debugBlockerHitMarker.Anchored = true
						debugBlockerHitMarker.CanCollide = false
						debugBlockerHitMarker.CanQuery = false
						debugBlockerHitMarker.CanTouch = false
						debugBlockerHitMarker.Shape = Enum.PartType.Ball
						debugBlockerHitMarker.Size = Vector3.new(1.0, 1.0, 1.0)
						debugBlockerHitMarker.Material = Enum.Material.Neon
						debugBlockerHitMarker.Color = Color3.fromRGB(255, 30, 30)
						debugBlockerHitMarker.Parent = workspace
					end
					debugBlockerHitMarker.CFrame = CFrame.new(lastBlockerData.directHitPos)
				else
					if debugBlockerHitMarker and debugBlockerHitMarker.Parent then
						debugBlockerHitMarker.CFrame = CFrame.new(0, -1000, 0)
					end
				end
			else
				if debugBlockerLine then debugBlockerLine.Visible = false end
				if debugBlockerHitMarker and debugBlockerHitMarker.Parent then
					debugBlockerHitMarker.CFrame = CFrame.new(0, -1000, 0)
				end
			end
		end
	end
end

local function cleanupDebugVisuals()
	if debugTargetPart then pcall(function() debugTargetPart:Destroy() end); debugTargetPart = nil end
	if debugEnemyHighlight then pcall(function() debugEnemyHighlight:Destroy() end); debugEnemyHighlight = nil end
	if debugActualLine then pcall(function() debugActualLine:Destroy() end); debugActualLine = nil end
	if debugActualMarkerPart then pcall(function() debugActualMarkerPart:Destroy() end); debugActualMarkerPart = nil end
	if debugBlockerLine then pcall(function() debugBlockerLine:Destroy() end); debugBlockerLine = nil end
	if debugBlockerHitMarker then pcall(function() debugBlockerHitMarker:Destroy() end); debugBlockerHitMarker = nil end
	destroyPathVisuals()
	if debugPathAdornee then pcall(function() debugPathAdornee:Destroy() end); debugPathAdornee = nil end
end

--// ============================================================
--// PUBLIC API & ACCESSORS
--// ============================================================

function autoFarm.IsEnabled()
	return enabled
end

function autoFarm.IsRunning()
	return running
end

function autoFarm.GetState()
	return currentState
end

function autoFarm.GetScanInterval()
	return scanInterval
end

function autoFarm.SetScanInterval(val)
	if type(val) == "number" and val > 0.1 then
		scanInterval = val
	end
end

function autoFarm.GetMinCombatDistance()
	return minCombatDistance
end

function autoFarm.SetMinCombatDistance(val)
	if type(val) == "number" and val >= 1 then
		minCombatDistance = val
		if minCombatDistance > maxCombatDistance then
			maxCombatDistance = minCombatDistance + 5
		end
	end
end

function autoFarm.GetMaxCombatDistance()
	return maxCombatDistance
end

function autoFarm.SetMaxCombatDistance(val)
	if type(val) == "number" and val >= 2 then
		maxCombatDistance = val
		if minCombatDistance > maxCombatDistance then
			minCombatDistance = math.max(1, maxCombatDistance - 5)
		end
	end
end

function autoFarm.IsAutoFaceTargetEnabled()
	return autoFaceTarget
end

function autoFarm.SetAutoFaceTarget(state)
	autoFaceTarget = state and true or false
	if not autoFaceTarget then
		local h = shared.GetHumanoid()
		if h and h.Parent then
			pcall(function() h.AutoRotate = true end)
		end
	end
end

-- Backward compatibility for reachDistance
function autoFarm.GetReachDistance()
	return maxCombatDistance
end

function autoFarm.SetReachDistance(val)
	if type(val) == "number" and val >= 2 then
		maxCombatDistance = val
		minCombatDistance = math.clamp(val * 0.6, 2, val - 2)
	end
end

function autoFarm.GetRepathDistance()
	return repathDistance
end

function autoFarm.SetRepathDistance(val)
	if type(val) == "number" and val >= 1 then
		repathDistance = val
		tracker.SetRepathThreshold(val)
	end
end

function autoFarm.SetAutoJumpOnStuck(state)
	autoJumpOnStuck = state and true or false
end

function autoFarm.IsAutoJumpOnStuckEnabled()
	return autoJumpOnStuck
end

function autoFarm.SetStuckVelocityThreshold(val)
	if type(val) == "number" and val >= 1 then
		stuckVelocityThreshold = val
	end
end

function autoFarm.GetStuckVelocityThreshold()
	return stuckVelocityThreshold
end

function autoFarm.SetPaused(state)
	local want = state and true or false
	if want == isPaused then return end
	isPaused = want
	if isPaused then
		local h = shared.GetHumanoid()
		local r = getPlayerRoot()
		if h and h.Parent and r then
			pcall(function()
				h:MoveTo(r.Position)
				h.AutoRotate = true
			end)
		end
	end
end

function autoFarm.IsPaused()
	return isPaused
end

--// Auto Skill APIs (Smart Skills Q & E)
autoFarm.IsAutoSkillEnabled = autoSkill.IsEnabled
autoFarm.SetAutoSkillEnabled = autoSkill.SetEnabled
autoFarm.IsAutoSkillQEnabled = autoSkill.IsSkillQEnabled
autoFarm.SetAutoSkillQEnabled = autoSkill.SetSkillQEnabled
autoFarm.IsAutoSkillEEnabled = autoSkill.IsSkillEEnabled
autoFarm.SetAutoSkillEEnabled = autoSkill.SetSkillEEnabled
autoFarm.GetSkillERange = autoSkill.GetSkillERange
autoFarm.SetSkillERange = autoSkill.SetSkillERange
autoFarm.GetSkillSpamInterval = autoSkill.GetSpamInterval
autoFarm.SetSkillSpamInterval = autoSkill.SetSpamInterval
autoFarm.IsBuffActive = autoSkill.IsBuffActive
autoFarm.CastSkillQ = autoSkill.CastSkillQ
autoFarm.CastSkillE = autoSkill.CastSkillE

function autoFarm.IsPlannedPathVisualEnabled()
	return showPlannedPath
end

function autoFarm.SetPlannedPathVisual(val)
	showPlannedPath = val == true
	if not showPlannedPath then destroyPathVisuals() end
end

function autoFarm.IsActualPathVisualEnabled()
	return showActualPath
end

function autoFarm.SetActualPathVisual(val)
	showActualPath = val == true
	if not showActualPath then
		if debugActualLine then debugActualLine.Visible = false end
		if debugActualMarkerPart and debugActualMarkerPart.Parent then
			debugActualMarkerPart.CFrame = CFrame.new(0, -1000, 0)
		end
	end
end

function autoFarm.IsBlockerRayVisualEnabled()
	return showBlockerRay
end

function autoFarm.SetBlockerRayVisual(val)
	showBlockerRay = val == true
	if not showBlockerRay then
		if debugBlockerLine then debugBlockerLine.Visible = false end
		if debugBlockerHitMarker and debugBlockerHitMarker.Parent then
			debugBlockerHitMarker.CFrame = CFrame.new(0, -1000, 0)
		end
	end
end

function autoFarm.IsTargetVisualEnabled()
	return showTargetVisual
end

function autoFarm.SetTargetVisual(val)
	showTargetVisual = val == true
	if not showTargetVisual then
		if debugTargetPart and debugTargetPart.Parent then
			debugTargetPart.CFrame = CFrame.new(0, -1000, 0)
		end
		if debugEnemyHighlight and debugEnemyHighlight.Parent then
			debugEnemyHighlight.Enabled = false
		end
	end
end

function autoFarm.GetDebugInfo()
	local root = getPlayerRoot()
	local playerPos = root and getSafePosition(root)
	local curTarget = tracker.GetTarget()
	local enemyName = "-"
	local enemyDist = 0
	local enemyFlat = 0
	local waypoints = tracker.GetWaypoints()

	if curTarget and curTarget.Model then
		enemyName = curTarget.Model.Name or "-"
		local ePos = getSafePosition(curTarget.Root)
		if ePos and playerPos then
			enemyDist = (ePos - playerPos).Magnitude
			enemyFlat = Vector3.new(ePos.X - playerPos.X, 0, ePos.Z - playerPos.Z).Magnitude
		end
	end

	local blockerInfo = {
		directBlocked = false,
		blockerName = "None",
		blockerDist = 0,
	}

	if lastBlockerData then
		blockerInfo.directBlocked = lastBlockerData.directBlocked == true
		if lastBlockerData.directHitPart then
			blockerInfo.blockerName = lastBlockerData.directHitPart.Name or "Part"
		end
		if lastBlockerData.directHitPos and playerPos then
			blockerInfo.blockerDist = (lastBlockerData.directHitPos - playerPos).Magnitude
		end
	end

	local horizontalSpeed = 0
	local verticalSpeed = 0
	if root then
		local rootVel = root.AssemblyLinearVelocity or root.Velocity
		if rootVel then
			horizontalSpeed = Vector3.new(rootVel.X, 0, rootVel.Z).Magnitude
			verticalSpeed = rootVel.Y
		end
	end

	return {
		state = currentState,
		enemyName = enemyName,
		enemyDist = enemyDist,
		enemyFlat = enemyFlat,
		hasTarget = curTarget ~= nil,
		destMode = currentDestMode,
		nodeIndex = currentDestNodeIndex,
		waypointCount = waypoints and #waypoints or 0,
		hasDestination = currentDestination ~= nil,
		blocker = blockerInfo,
		velocity = horizontalSpeed,
		verticalVelocity = verticalSpeed,
		stuckTimer = stuckTimer,
	}
end


function autoFarm.Toggle(state, bypassCoordinator)
	if state == enabled then return end
	enabled = state

	if enabled then
		if not bypassCoordinator then
			coordinator.EnableExclusive("AutoFarm")
		end
		if moveConnection then moveConnection:Disconnect(); moveConnection = nil end

		running = true
		selectToken = 0
		selectRunning = false
		lastScanTime = 0
		tracker.SetRepathThreshold(repathDistance)

		if not enemyChangedConnection then
			enemyChangedConnection = shared.OnEnemyChanged(function()
				if enabled and running and currentState ~= State.HOLD then
					evaluateTarget()
				end
			end)
		end

		if not respawnConnection then
			respawnConnection = shared.OnRespawn(function()
				tracker.ClearTarget()
				currentState = State.NO_TARGET
				lastBlockerData = nil
				evaluateTarget()
			end)
		end

		if not dunReady then
			task.spawn(function()
				if shared.ReadyDungeon() then dunReady = true end
			end)
		end

		task.defer(evaluateTarget)

		moveConnection = RunService.Heartbeat:Connect(function(deltaTime)
			local ok, err = pcall(stepMovementLoop, deltaTime)
			if not ok then
				warn(("[AutoFarm] Error in stepMovementLoop: %s"):format(tostring(err)))
			end
			updateVisualDebugs()
		end)
	else
		if moveConnection then moveConnection:Disconnect(); moveConnection = nil end
		running = false
		if enemyChangedConnection then enemyChangedConnection(); enemyChangedConnection = nil end
		if respawnConnection then respawnConnection(); respawnConnection = nil end

		local h = shared.GetHumanoid()
		local r = getPlayerRoot()
		if h and h.Parent and r then
			pcall(function()
				h:MoveTo(r.Position)
				h.AutoRotate = true
			end)
		end

		tracker.ClearTarget()
		currentState = State.NO_TARGET
		currentDestination = nil
		currentDestMode = "None"
		lastBlockerData = nil
		stuckTimer = 0
		selectToken += 1
		selectRunning = false
		cleanupDebugVisuals()




	end
end

--// Coordinator Registration & Lifecycle
coordinator.Register("AutoFarm", autoFarm.Toggle, autoFarm.IsEnabled)

lifecycle.Register(function()
	autoFarm.Toggle(false)
	cleanupDebugVisuals()
end)

return autoFarm
end function __DIST.B()-- Catalog map + độ khó cho DungeonQuest, dựa trên module chooseDungeon của game.
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

return dungeonCatalog end function __DIST.C()-- Core Contextual cho DungeonQuest: quản lý thiết lập Auto Farm (Target Reach Distance...)
-- riêng biệt theo từng DUNGEON x LOẠI MỤC TIÊU (Normal, Boss 1, Boss 2, Boss 3).
-- Dữ liệu lưu trong file config JSON qua macLib.contextData.

--// Imports

local macLib = __DIST.load('a')
local autoSave = __DIST.load('d')
local shared = __DIST.load('f')
local dungeonCatalog = __DIST.load('B')
local notifier = __DIST.load('c')
local lifecycle = __DIST.load('b')
local autoFarm = __DIST.load('A')

--// Table
local contextual = {}

--// Metadata field -> get/set trên autoFarm
local FIELD_DEFS = {
	MinCombatDistance = {
		get = function()
			return autoFarm.GetMinCombatDistance()
		end,
		set = function(v)
			autoFarm.SetMinCombatDistance(v)
		end,
	},
	MaxCombatDistance = {
		get = function()
			return autoFarm.GetMaxCombatDistance()
		end,
		set = function(v)
			autoFarm.SetMaxCombatDistance(v)
		end,
	},
	TargetReachDistance = {
		get = function()
			return autoFarm.GetMaxCombatDistance()
		end,
		set = function(v)
			autoFarm.SetMaxCombatDistance(v)
		end,
	},
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
--// Sống trong config đang chọn (nhúng vào file config .json qua macLib.contextData)
local data = {}
local lastDataRef = nil
local activeConfig = nil
local configChangedCallbacks = {}

--// Các tab đăng ký callback khi đổi config (để làm mới UI context).
function contextual.OnConfigChanged(cb)
	if type(cb) ~= "function" then return end
	table.insert(configChangedCallbacks, cb)
end

--// Nạp dữ liệu từ config đang chọn. Trả về true nếu vừa đổi config / đổi data context.
function contextual.ReloadFromConfig()
	local macData = macLib.contextData or {}
	local newActive = autoSave.GetActive()

	local configChanged = newActive ~= activeConfig
	local dataChanged = macData ~= lastDataRef

	data = macData
	lastDataRef = macData
	activeConfig = newActive

	if (configChanged or dataChanged) and #configChangedCallbacks > 0 then
		for _, cb in ipairs(configChangedCallbacks) do
			pcall(cb, newActive)
		end
	end
	return configChanged or dataChanged
end

--// Đồng bộ dữ liệu lên macLib để mỗi lần save config là lưu kèm contextData
local function bindMacLib()
	macLib.contextData = data
end

--// Lưu dữ liệu vào config đang chọn
local function persist()
	bindMacLib()
	autoSave.SaveNow()
end

--// Đảm bảo context có đầy đủ tất cả field (điền mặc định = global fallback nếu thiếu)
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

--// Ghi override cho context cụ thể
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

--// Áp bộ giá trị của 1 context vào autoFarm
function contextual.ApplyContext(dungeon, targetKey)
	local ctx = contextual.GetContext(dungeon, targetKey)
	for field, def in pairs(FIELD_DEFS) do
		def.set(ctx[field])
	end
end

--// Áp context HIỆN TẠI (dungeon đang chơi + mục tiêu đang farm) lên autoFarm.
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
	return KEY_TO_DISPLAY[key] or "Normal"
end

--// Auto-switch watcher: lắng nghe dungeon/boss đổi -> áp context hiện tại + thông báo.
local lastApplied = nil
local lastDungeon = nil
local function findAndApply(force)
	local dungeon = shared.GetCurrentDungeonName()
	local targetKey = shared.GetCombatTargetKey()

	if not dungeon then
		lastDungeon = nil
		lastApplied = nil
		return
	end

	if not force and dungeon == lastDungeon and targetKey == lastApplied then return end

	contextual.ApplyContext(dungeon, targetKey)

	if targetKey ~= "Mob" then
		notifier.Notify("Auto Farm Context", dungeon .. " - " .. (KEY_TO_DISPLAY[targetKey] or targetKey), 2)
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
		while lifecycle.IsActive() do
			task.wait(1.0)
			if contextual.ReloadFromConfig() then
				findAndApply(true)
			end
		end
	end)
end

return contextual
end function __DIST.D()-- Module Auto Farm trong tab Combat (DungeonQuest)
-- Tích hợp Auto Farm AI (Scanner, Validator, Selector, Tracker, Movement Controller, Blocker Checker)
-- và Auto Farm Context (Target Reach Distance theo từng Dungeon x Target).

--// Imports

local autoSave = __DIST.load('d')
local autoFarm = __DIST.load('A')
local contextual = __DIST.load('C')
local shared = __DIST.load('f')
local services = __DIST.load('e')
local ui = __DIST.load('g')
local lifecycle = __DIST.load('b')
local RunService = services.RunService

return function(window, tab)
	--// ============================================================
	--// LEFT COLUMN: Auto Farm Controls & Visual Debug
	--// ============================================================
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Auto Farm" })

	leftSection:Toggle({
		Name = "Enable Auto Farm",
		Default = autoFarm.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoFarm.Toggle(state)
		end),
	}, "Toggle_AutoFarm")

	leftSection:Slider({
		Name = "Rescan Interval",
		Suffix = "s",
		Default = autoFarm.GetScanInterval(),
		Minimum = 0.5,
		Maximum = 5.0,
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetScanInterval(val)
		end),
	}, "Slider_AF_ScanInterval")

	leftSection:Slider({
		Name = "Min Combat Distance",
		Suffix = " studs",
		Default = autoFarm.GetMinCombatDistance(),
		Minimum = 2,
		Maximum = 150,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetMinCombatDistance(val)
		end),
	}, "Slider_AF_MinCombatDistance")

	leftSection:Slider({
		Name = "Max Combat Distance",
		Suffix = " studs",
		Default = autoFarm.GetMaxCombatDistance(),
		Minimum = 5,
		Maximum = 200,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetMaxCombatDistance(val)
		end),
	}, "Slider_AF_MaxCombatDistance")

	leftSection:Toggle({
		Name = "Auto Face Target (Look At Enemy)",
		Default = autoFarm.IsAutoFaceTargetEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoFarm.SetAutoFaceTarget(state)
		end),
	}, "Toggle_AF_AutoFaceTarget")

	leftSection:Slider({
		Name = "Repath Distance",
		Suffix = " std",
		Default = autoFarm.GetRepathDistance(),
		Minimum = 2,
		Maximum = 20,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetRepathDistance(val)
		end),
	}, "Slider_AF_RepathDistance")

	leftSection:Toggle({
		Name = "Auto Jump When Stuck (Low Velocity)",
		Default = autoFarm.IsAutoJumpOnStuckEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoFarm.SetAutoJumpOnStuck(state)
		end),
	}, "Toggle_AF_AutoJumpOnStuck")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Stuck Velocity Threshold",
		Suffix = " studs/s",
		Default = autoFarm.GetStuckVelocityThreshold(),
		Minimum = 2,
		Maximum = 20,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetStuckVelocityThreshold(val)
		end),
	}, "Slider_AF_StuckVelocity"))

	leftSection:Header({ Name = "Auto Skill (Smart Buff & Damage)" })

	leftSection:Toggle({
		Name = "Enable Auto Skill (Smart Q + E)",
		Default = autoFarm.IsAutoSkillEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoFarm.SetAutoSkillEnabled(state)
		end),
	}, "Toggle_AF_AutoSkill")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Skill E Cast Range",
		Suffix = " studs",
		Default = autoFarm.GetSkillERange(),
		Minimum = 5,
		Maximum = 150,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetSkillERange(val)
		end),
	}, "Slider_AF_SkillERange"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Skill Spam Interval",
		Suffix = "s",
		Default = autoFarm.GetSkillSpamInterval(),
		Minimum = 0.05,
		Maximum = 1.0,
		DisplayMethod = "Value",
		Precision = 2,
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetSkillSpamInterval(val)
		end),
	}, "Slider_AF_SkillSpamInterval"))

	leftSection:Header({ Name = "Visual Debug" })

	leftSection:Toggle({
		Name = "Show Blocker Ray (Red/Green)",
		Default = autoFarm.IsBlockerRayVisualEnabled(),
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetBlockerRayVisual(val)
		end),
	}, "Toggle_AF_BlockerRay")

	leftSection:Toggle({
		Name = "Show Planned Path (Green)",
		Default = autoFarm.IsPlannedPathVisualEnabled(),
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetPlannedPathVisual(val)
		end),
	}, "Toggle_AF_PlannedPath")

	leftSection:Toggle({
		Name = "Show Actual Destination (Cyan)",
		Default = autoFarm.IsActualPathVisualEnabled(),
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetActualPathVisual(val)
		end),
	}, "Toggle_AF_ActualPath")

	leftSection:Toggle({
		Name = "Show Target Indicator (Red/Glow)",
		Default = autoFarm.IsTargetVisualEnabled(),
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetTargetVisual(val)
		end),
	}, "Toggle_AF_TargetVisual")

	--// ============================================================
	--// RIGHT COLUMN TOP: Auto Farm Monitor
	--// ============================================================
	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Auto Farm Monitor" })

	local stateLabel = rightSection:Label({ Text = "State: <font color='rgb(160,160,160)'>NO_TARGET</font>" })
	local targetLabel = rightSection:Label({ Text = "Target: <font color='rgb(160,160,160)'>None</font>" })
	local distanceLabel = rightSection:Label({ Text = "Distance: <font color='rgb(160,160,160)'>-</font>" })
	local velocityLabel = rightSection:Label({ Text = "Velocity: <font color='rgb(160,160,160)'>0.0 studs/s</font>" })
	local blockerLabel = rightSection:Label({ Text = "Blocker Detection: <font color='rgb(160,160,160)'>-</font>" })
	local modeLabel = rightSection:Label({ Text = "Destination Mode: <font color='rgb(160,160,160)'>None</font>" })
	local waypointsLabel = rightSection:Label({ Text = "Path Nodes: <font color='rgb(160,160,160)'>0</font>" })

	local monitorConnection = nil

	local function updateMonitor()
		local info = autoFarm.GetDebugInfo()
		local stateColor = "160,160,160"

		if info.state == "CHASE" then
			stateColor = "0,255,120"
		elseif info.state == "HOLD" then
			stateColor = "255,200,0"
		elseif info.state == "BLOCKED" then
			stateColor = "255,60,60"
		elseif info.state == "REPATHING" or info.state == "ACQUIRING_TARGET" or info.state == "TRACKING_TARGET" then
			stateColor = "0,200,255"
		end

		pcall(function()
			stateLabel:UpdateName(("State: <font color='rgb(%s)'>%s</font>"):format(stateColor, info.state))
		end)

		pcall(function()
			if info.hasTarget then
				targetLabel:UpdateName(("Target: <font color='rgb(255,220,120)'>%s</font>"):format(info.enemyName))
				distanceLabel:UpdateName(("Distance: <font color='rgb(0,255,255)'>%.1f studs (flat %.1f)</font>"):format(info.enemyDist, info.enemyFlat))
			else
				targetLabel:UpdateName("Target: <font color='rgb(160,160,160)'>None</font>")
				distanceLabel:UpdateName("Distance: <font color='rgb(160,160,160)'>-</font>")
			end
		end)

		pcall(function()
			local vel = info.velocity or 0
			local velColor = vel >= 12.0 and "0,255,120" or (vel >= 10.0 and "255,200,0" or "255,80,80")
			velocityLabel:UpdateName(("Velocity: <font color='rgb(%s)'>%.1f studs/s</font>"):format(velColor, vel))
		end)



		pcall(function()
			if info.hasTarget and info.blocker then
				if info.blocker.directBlocked then
					blockerLabel:UpdateName(("Blocker: <font color='rgb(255,60,60)'>BLOCKED by '%s' (%.1fm)</font>"):format(
						info.blocker.blockerName, info.blocker.blockerDist
					))
				else
					blockerLabel:UpdateName("Blocker: <font color='rgb(0,255,120)'>CLEAR (Direct Line to Target)</font>")
				end
			else
				blockerLabel:UpdateName("Blocker: <font color='rgb(160,160,160)'>None</font>")
			end
		end)

		pcall(function()
			local modeText = info.destMode
			if info.nodeIndex then
				modeText = ("%s (Node #%d)"):format(info.destMode, info.nodeIndex)
			end
			local modeColor = info.destMode == "Direct" and "0,255,255" or (info.destMode == "Waypoint" and "255,200,0" or (info.destMode == "Hold" and "255,200,0" or "255,80,80"))
			modeLabel:UpdateName(("Destination Mode: <font color='rgb(%s)'>%s</font>"):format(modeColor, modeText))
		end)

		pcall(function()
			waypointsLabel:UpdateName(("Path Nodes: <font color='rgb(160,255,160)'>%d waypoints</font>"):format(info.waypointCount))
		end)
	end

	local lastUiUpdate = 0
	monitorConnection = RunService.Heartbeat:Connect(function()
		local now = os.clock()
		if now - lastUiUpdate >= 0.25 then
			lastUiUpdate = now
			updateMonitor()
		end
	end)

	lifecycle.Register(function()
		if monitorConnection then
			monitorConnection:Disconnect()
			monitorConnection = nil
		end
	end)

	--// ============================================================
	--// RIGHT COLUMN BOTTOM: Auto Farm Context
	--// ============================================================
	local ctxSection = tab:Section({ Side = "Right" })
	ctxSection:Header({ Name = "Auto Farm Context" })

	local activeCtxLabel = ctxSection:Label({ Text = "" })
	local function updateActiveCtxLabel()
		local dungeon = shared.GetCurrentDungeonName()
		local targetKey = shared.GetCombatTargetKey()
		activeCtxLabel:UpdateName("Active: <font color='rgb(120,200,255)'>" .. (dungeon or "Not in dungeon") .. "</font> / " .. contextual.GetDisplayForTarget(targetKey))
	end

	local editDungeon = shared.GetCurrentDungeonName()
	local editTarget = "Mob"

	local isSyncing = false
	local refreshContextControls
	local setEditControlsVisible
	local editCtxLabel
	local editTargetDropdown
	local reachDistanceSlider
	local resetCtxButton

	local function isActiveContext()
		return editDungeon == shared.GetCurrentDungeonName() and editTarget == shared.GetCombatTargetKey()
	end

	editTargetDropdown = ctxSection:Dropdown({
		Name = "Edit Target",
		Options = { "Normal", "Boss 1", "Boss 2", "Boss 3" },
		Default = 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			local map = { ["Normal"] = "Mob", ["Boss 1"] = "Boss1", ["Boss 2"] = "Boss2", ["Boss 3"] = "Boss3" }
			editTarget = map[option] or "Mob"
			refreshContextControls()
		end),
	}, "Dropdown_AutoFarmTarget")

	--// Nút Reset 2 bước (arm Confirm -> click lần 2 trong hạn)
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

	resetCtxButton = ctxSection:Button({
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

	local minDistanceSlider
	local maxDistanceSlider

	minDistanceSlider = ui.PatchSliderLoadCallback(ctxSection:Slider({
		Name = "Min Combat Distance",
		Suffix = " studs",
		Default = contextual.GetField(editDungeon, editTarget, "MinCombatDistance") or 25,
		Minimum = 2,
		Maximum = 150,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "MinCombatDistance", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_AF_CtxMinCombatDistance"))

	maxDistanceSlider = ui.PatchSliderLoadCallback(ctxSection:Slider({
		Name = "Max Combat Distance",
		Suffix = " studs",
		Default = contextual.GetField(editDungeon, editTarget, "MaxCombatDistance") or 50,
		Minimum = 5,
		Maximum = 200,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "MaxCombatDistance", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_AF_CtxMaxCombatDistance"))

	refreshContextControls = function()
		isSyncing = true
		disarmReset()
		pcall(function() minDistanceSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "MinCombatDistance") or 25) end)
		pcall(function() maxDistanceSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "MaxCombatDistance") or 50) end)
		isSyncing = false
		pcall(function() editCtxLabel:UpdateName("Editing: <font color='rgb(150,255,150)'>" .. (editDungeon or "Not in dungeon") .. "</font> / " .. contextual.GetDisplayForTarget(editTarget)) end)
	end

	setEditControlsVisible = function(visible)
		pcall(function() minDistanceSlider:SetVisibility(visible) end)
		pcall(function() maxDistanceSlider:SetVisibility(visible) end)
		pcall(function() resetCtxButton:SetVisibility(visible) end)
	end

	local function resetToMob()
		editTarget = "Mob"
		pcall(function() editTargetDropdown:UpdateSelection("Normal") end)
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
end
end function __DIST.E()-- Tab Combat (DungeonQuest): gộp Player (Speed) + Hazard Scanner (vùng nguy hiểm) + AutoFarm.
-- Mỗi module con render sections vào cùng 2 cột của tab này (gọi theo thứ tự).


return function(window, tab)
__DIST.load('i')(window, tab)
__DIST.load('t')(window, tab)
__DIST.load('D')(window, tab)
end

end function __DIST.F()-- Auto Join Dungeon cho DungeonQuest: tạo phòng (createLobby) + whitelist + start dungeon.
-- Scalable: map/độ khó lấy từ dungeonCatalog (động qua getDungeonStats + override map đặc biệt).

--// Imports

local services = __DIST.load('e')
local notifier = __DIST.load('c')
local dungeonCatalog = __DIST.load('B')
local shared = __DIST.load('f')
local lifecycle = __DIST.load('b')

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
	while lifecycle.IsActive() do
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

lifecycle.Register(function()
	autoJoin.Toggle(false)
end)

return autoJoin
end function __DIST.G()-- Auto Start Game cho DungeonQuest: chờ tới khi đang ở TRONG dungeon rồi fire
-- remote start. Dungeon được xác định bằng cách LOẠI TRỪ các placeId lobby: ngoài
-- 2 lobby (Lobby1/Lobby2) thì mọi place khác đều coi là dungeon. Ở lobby không
-- hoạt động dù toggle có bật.

--// Imports

local shared = __DIST.load('f')
local notifier = __DIST.load('c')

--// Lobby placeId — ngoài các place này ra thì đều là dungeon
local LOBBY_PLACE_IDS = {
	[77649408247578] = true,
	[115445507767090] = true,
}

--// State
local autoStartEnabled = false
local autoStartRunning = false
local autoStartTriggered = false
local autoStartDelay = 3
local autoStartCommand = 'game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("changeStartValue"):FireServer()'
local autoStartCommandFn = nil

--// Điều kiện kích hoạt: đang ở dungeon (place hiện tại KHÔNG phải placeId lobby).
local function lobbyCondition()
	return not LOBBY_PLACE_IDS[game.PlaceId]
end

--// Compile remote start command (giữ hành vi cũ, loadstring có sẵn trong executor)
local s2, cmdFn2 = pcall(loadstring, autoStartCommand)
if s2 and type(cmdFn2) == "function" then autoStartCommandFn = cmdFn2 end

--// Table
local autoStart = {}

--// Callbacks chạy sau khi fire remote start thành công (đánh dấu mốc run bắt đầu).
local startCallbacks = {}

--// Methods
function autoStart.OnStart(callback)
	if type(callback) ~= "function" then return function() end end
	table.insert(startCallbacks, callback)
	return function()
		for i, cb in ipairs(startCallbacks) do
			if cb == callback then table.remove(startCallbacks, i) break end
		end
	end
end

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
				--// Chờ delay để asset load xong; nếu bị tắt giữa chừng thì bỏ qua.
				local waited = 0
				while waited < autoStartDelay and autoStartEnabled do
					task.wait(0.1)
					waited = waited + 0.1
				end
				if not autoStartEnabled then
					autoStartTriggered = false
					break
				end
				if autoStartCommandFn then
					local sCmd, err = pcall(autoStartCommandFn)
					if sCmd then
						notifier.Notify("Auto Start", "Game started!", 3)
						for i = #startCallbacks, 1, -1 do
							pcall(startCallbacks[i])
						end
					else
						notifier.Notify("Auto Start", "Trigger failed: " .. tostring(err), 3)
					end
				else
					notifier.Notify("Auto Start", "Remote command invalid", 3)
				end
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

--// Delay (giây) chờ thêm sau khi vào lobby trước khi fire start — chờ asset load xong.
function autoStart.SetDelay(value)
	autoStartDelay = tonumber(value) or 3
end

function autoStart.GetDelay()
	return autoStartDelay
end

function autoStart.Toggle(state)
	autoStartEnabled = state
	if state then
		autoStart.Start()
	else
		autoStart.Stop()
	end
end

--// Vào dungeon = teleport đổi placeId -> script reload -> autoStartTriggered khởi tạo
--// lại = false, nên fire đúng 1 lần mỗi dungeon mà không cần reset qua callback.
--// KHÔNG dùng OnDungeonNameChanged để reset vì trong lúc load tên dungeon có thể dao
--// động giữa placeholder/tên thật -> reset sai thời điểm gây fire trùng "Game started!".

return autoStart end function __DIST.H()-- Auto-press nút Start ở LOBBY cho DungeonQuest: chờ nút Start (introGui.title.Frame.
-- TextButton) xuất hiện rồi mô phỏng nhấn Enter như Script3.txt. Chỉ hoạt động khi
-- đang ở lobby place; vào dungeon (đổi place) thì script reload ngừng hẳn. Sau khi
-- bấm, introGui biến mất nên phải chờ cả introGui + nút xuất hiện lại mới bấm lần nữa.

--// Imports

--// Lobby placeId — auto-press chỉ hoạt động tại đây

local LOBBY_PLACE_IDS = {
	[77649408247578] = true,
	[115445507767090] = true,
}

--// Có đang ở lobby place không
local function inLobbyPlace()
	return LOBBY_PLACE_IDS[game.PlaceId] == true
end

--// State
local enabled = false

--// References
local VirtualInputManager = game:GetService("VirtualInputManager")
local GuiService = game:GetService("GuiService")

--// Nút Start trong introGui; button tồn tại khi introGui tồn tại (introGui biến mất
--// sau khi bấm -> phải check cả introGui lẫn chính nút).
local function findStartButton()
	local player = game:GetService("Players").LocalPlayer
	if not player then return nil end
	local playerGui = player:FindFirstChild("PlayerGui")
	if not playerGui then return nil end
	local introGui = playerGui:FindFirstChild("introGui")
	if not introGui or not introGui:IsA("ScreenGui") or not introGui.Enabled then return nil end
	local title = introGui:FindFirstChild("title")
	if not title then return nil end
	local frame = title:FindFirstChild("Frame")
	if not frame then return nil end
	local button = frame:FindFirstChild("TextButton")
	if not button or not button:IsA("TextButton") or not button.Visible then return nil end
	--// Chỉ chấp nhận nút có nhãn chứa "Play" để chắc tìm đúng nút Start.
	local labelText = ""
	if button.Text and type(button.Text) == "string" then
		labelText = button.Text
	end
	if not string.find(string.lower(labelText), "play") then return nil end
	return button
end

--// Mô phỏng chọn nút + nhấn Enter (theo Script3.txt), rồi BỎ CHỌN để thoát trạng
--// thái selection/focus sau khi bấm cho sạch.
local function pressStartButton(button)
	pcall(function()
		GuiService.SelectedObject = button
	end)
	task.wait(0.1)
	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
	task.wait()
	VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
	task.wait(0.1)
	pcall(function()
		GuiService.SelectedObject = nil
	end)
end

--// Loop: bấm lặp lại nút Start tới khi introGui biến mất (đã press được) rồi NGỪNG
--// HẲN. Chống bấm quá sớm do animation: nếu nút chưa sẵn sàng lần đầu, các lần sau
--// bấm tới khi dính. Chỉ hoạt động ở lobby place; vào dungeon ngừng hẳn.
local function runLoop()
	task.spawn(function()
		local hadButton = false
		while enabled do
			--// Chỉ hoạt động ở lobby place; vào dungeon ngừng hẳn.
			if not inLobbyPlace() then
				task.wait(1)
				continue
			end

			local button = findStartButton()
			if button then
				--// Bấm; nếu press thành công, introGui biến mất -> vòng sau không thấy nút.
				pressStartButton(button)
				hadButton = true
			elseif hadButton then
				--// Đã từng bấm mà giờ nút biến mất -> press thành công (introGui đóng).
				print("[AutoStartLobby] Pressed Start")
				break
			end

			if not enabled then break end
			task.wait(0.2)
		end
	end)
end

--// Table
local autoStartLobby = {}

--// Methods
function autoStartLobby.Toggle(state)
	enabled = state
	if enabled then
		runLoop()
	end
end

return autoStartLobby end function __DIST.I()-- Auto Retry Dungeon cho DungeonQuest: khi reward holder có >= 2 item thì fire replayDungeon.

--// Imports

local services = __DIST.load('e')
local notifier = __DIST.load('c')

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
end function __DIST.J()-- Tab Dungeon (DungeonQuest): Auto Join Dungeon scalable.
-- Difficulty dropdown tự update options theo map đang chọn (lấy từ dungeonCatalog).

--// Imports

local ui = __DIST.load('g')
local autoJoin = __DIST.load('F')
local autoStart = __DIST.load('G')
local autoStartLobby = __DIST.load('H')
local autoRetry = __DIST.load('I')
local autoSave = __DIST.load('d')
local dungeonCatalog = __DIST.load('B')

return function(window, tab)
	local section = tab:Section({ Side = "Left" })
	local runSection = tab:Section({ Side = "Right" })

	local function indexOf(list, name)
		for i, v in ipairs(list) do
			if v == name then return i end
		end
		return nil
	end
	section:Header({ Name = "Auto Join Dungeon" })
	runSection:Header({ Name = "Dungeon Run Automation" })

	section:Toggle({
		Name = "Auto Join Dungeon",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			autoJoin.Toggle(state)
		end),
	}, "Toggle_AutoJoin")

	local dungeonOptions = dungeonCatalog.GetDungeons()
	local dungeonDropdown = ui.PatchDropdownRestore(section:Dropdown({
		Name = "Dungeon",
		Options = dungeonOptions,
		Default = indexOf(dungeonOptions, autoJoin.GetSelectedDungeon()) or 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			autoJoin.SetDungeon(option)
		end),
	}, "Dropdown_Dungeon"), true)

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

	local difficultyOptions = autoJoin.GetAllowedDifficulties()
	local difficultyDropdown = ui.PatchDropdownRestore(section:Dropdown({
		Name = "Difficulty",
		Options = difficultyOptions,
		Default = indexOf(difficultyOptions, autoJoin.GetSelectedDifficulty()) or 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			autoJoin.SetDifficulty(option)
			updateLevelLabel()
		end),
	}, "Dropdown_Difficulty"), true)

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
		DisplayMethod = "Value",
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

	runSection:Toggle({
		Name = "Auto Start",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			autoStart.Toggle(state)
		end),
	}, "Toggle_AutoStart")

	ui.PatchSliderLoadCallback(runSection:Slider({
		Name = "Start Delay",
		Default = autoStart.GetDelay(),
		Minimum = 0,
		Maximum = 15,
		DisplayMethod = "Value",
		Precision = 1,
		Suffix = "s",
		Callback = autoSave.Wrap(function(Value)
			autoStart.SetDelay(Value)
		end),
	}, "Slider_AutoStartDelay"))

	runSection:Toggle({
		Name = "Auto Start Lobby",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			autoStartLobby.Toggle(state)
		end),
	}, "Toggle_AutoStartLobby")

	runSection:Toggle({
		Name = "Auto Retry",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			autoRetry.Toggle(state)
		end),
	}, "Toggle_AutoRetry")

	runSection:Button({
		Name = "Manual Retry",
		Callback = function()
			task.spawn(function()
				autoRetry.RetryNow()
			end)
		end,
	})

	runSection:Toggle({
		Name = "Retry on Time Low",
		Default = autoRetry.GetTimeRetryEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoRetry.SetTimeRetryEnabled(state)
		end),
	}, "Toggle_RetryTimeLow")

	ui.PatchSliderLoadCallback(runSection:Slider({
		Name = "Retry Time Threshold",
		Default = autoRetry.GetTimeRetryThreshold(),
		Minimum = 5,
		Maximum = 120,
		DisplayMethod = "Value",
		Precision = 1,
		Suffix = "s",
		Callback = autoSave.Wrap(function(Value)
			autoRetry.SetTimeRetryThreshold(Value)
		end),
	}, "Slider_RetryTimeThreshold"))

	-- Đồng bộ difficulty dropdown khi đổi map (cũng chạy khi config load).
	autoJoin.OnDungeonChanged(function(dungeon, allowed)
		pcall(function()
			difficultyDropdown:ClearOptions()
			difficultyDropdown:InsertOptions(allowed)
			difficultyDropdown:UpdateSelection(autoJoin.GetSelectedDifficulty())
		end)
		updateLevelLabel()
	end)
end
end function __DIST.K()-- Auto Sell (DungeonQuest): bán vật phẩm trong inventory theo điều kiện lọc.
-- Cơ chế: bấm nút "Sell Now" -> đọc inventory (remote `reloadInvy`) -> lọc theo
-- rarity/type/prefix-name/levelReq/equipped -> gom index theo category -> fire
-- remote `sellItemEvent` (payload { [category] = {index,...} }, vd { weapon = {49} }).

--// Imports

local lifecycle = __DIST.load('b')
local notifier = __DIST.load('c')
local shared = __DIST.load('f')

--// Lobby placeId — ngoài các place này ra thì đều là dungeon
local LOBBY_PLACE_IDS = {
	[77649408247578] = true,
	[115445507767090] = true,
}

--// Table
local autoSell = {}

--// State
local autoSellEnabled = false
local dungeonSellTriggered = false
local excludeEquipped = true
local rarityFilter = {} -- set: rarity string -> true
local typeFilter = {} -- set: type string -> true
local levelReqExactFilter = {} -- set: level number -> true (chọn đích danh các mốc)
local levelReqMode = "None" -- "None" = exact multi, "Below" = ≤, "Above" = ≥
local sellRunning = false

--// Các category có trong inventory (từ log reloadInvy)
local CATEGORY_TYPES = {
	weapons = "Weapons",
	helmets = "Helmets",
	chests = "Chests",
	abilities = "Abilities",
}

--// Cấp hiếm hợp lệ (để biết option nào là rarity)
local RARITY_OPTIONS = { "Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic" }

--// Các mốc Level Req tĩnh cho dropdown multi-select (hỗ trợ tìm kiếm theo mốc 5 và 10)
local LEVEL_REQ_OPTIONS = {
	"1", "5", "10", "15", "20", "25", "30", "35", "40", "45", "50",
	"55", "60", "65", "70", "75", "80", "85", "90", "95", "100",
	"105", "110", "115", "120", "125", "130", "135", "140", "145", "150",
	"155", "160", "165", "170", "175", "180", "185", "190", "195", "200",
	"205", "210", "215", "220", "225", "230", "235", "240", "245", "250",
	"255", "260", "265", "270", "275", "280", "285", "290", "295", "300",
}

--// Chế độ lọc Level Req: None = chọn đích danh, Below = ≤, Above = ≥
local LEVEL_REQ_MODE_OPTIONS = { "None", "Below", "Above" }

--// Độ hiếm -> số 0..5 (dùng để map item.rarity sang RarityValue)
local RARITY_ORDER = {
	Common = 0,
	Uncommon = 1,
	Rare = 2,
	Epic = 3,
	Legendary = 4,
	Mythic = 5,
}
local isRarityOption = {}
for _, r in ipairs(RARITY_OPTIONS) do isRarityOption[r] = true end

--// Map rarity dạng tùy ý (chữ thường "epic", hoa "EPIC", lẫn lộn...) -> dạng chuẩn.
--// Dữ liệu từ game là chữ thường (epic/rare/legendary) nên cần chuẩn hóa để khớp với
--// option dropdown (viết hoa chữ cái đầu) khi so sánh filter.
local RARITY_BY_KEY = {}
for _, r in ipairs(RARITY_OPTIONS) do
	RARITY_BY_KEY[string.lower(r)] = r
end

local function normalizeRarity(value)
	if type(value) ~= "string" then return nil end
	return RARITY_BY_KEY[string.lower(value)]
end

--// Sell action - mặc định:
--//   gom theo category rồi fire remote `sellItemEvent`.
--//   Nhận: (categoryMap: { [singular] = {index,...} }, items) -> trả (ok, gold)
local function defaultSellAction(categoryMap)
	local remote
	pcall(function()
		remote = game:GetService("ReplicatedStorage"):WaitForChild("remotes", 5)
			:WaitForChild("sellItemEvent", 5)
	end)
	if not remote then return false, 0 end

	--// Chỉ gửi category có ít nhất 1 index. Không sửa key để tránh lệch với server.
	local payload = {}
	for singular, list in pairs(categoryMap) do
		if type(list) == "table" and #list > 0 then
			payload[singular] = list
		end
	end

	if next(payload) == nil then return false, 0 end

	local ok = pcall(function()
		remote:FireServer(payload)
	end)
	if not ok then return false, 0 end
	return true, 0
end

local sellAction = defaultSellAction

function autoSell.SetSellAction(callback)
	if type(callback) == "function" then sellAction = callback end
end

--// Đọc inventory từ remote `reloadInvy` (RemoteFunction InvokeServer).
--// Dữ liệu thật có thể bọc nhiều lớp (vd { ["1"] = { categories... } }) và có thể
--// khác nhau giữa các lần. Vì vậy ta flatten đệ quy: nhận diện 1 "item" bằng dấu hiệu
--// (table có sellPrice/UniqueItemID/rarity), và coi mọi category đã biết là 1 item.
--// Mỗi item lưu cả `Index` (số thứ tự lấy từ key `category_số`, dùng để bán qua
--// sellItemEvent) và `Category` (singular key: weapon/helmet/chest/ability).
--// Trả về mảng item.
local function fetchInventoryItems()
	local ok, rs = pcall(function()
		return game:GetService("ReplicatedStorage"):WaitForChild("remotes", 5):WaitForChild("reloadInvy", 5)
	end)
	if not ok or not rs then return nil, "Could not find remote reloadInvy" end

	local ok2, data = pcall(function()
		return rs:InvokeServer()
	end)
	if not ok2 or data == nil then return nil, "Could not read inventory" end

	local items = {}
	local seen = {} -- tránh lặp vô hạn khi có cyclic reference

	local function isItemTable(t)
		return t.sellPrice ~= nil or t.UniqueItemID ~= nil or t.rarity ~= nil
	end

	--// Parse index + singular category từ key item dạng "weapon_49", "helmet_5", ...
	--// -> trả ("weapon", 49). Không khớp dạng -> trả (nil, nil).
	local function parseItemKey(key)
		local s = tostring(key)
		local index = tonumber(s:match("_(%d+)$"))
		if not index then return nil, nil end
		local singular = s:match("^(.-)_%d+$")
		return singular, index
	end

	local function addItem(node, pluralCat, singularKey, index)
		local equipped = false
		if type(node.equipped) == "boolean" then
			equipped = node.equipped
		elseif type(node.equipped) == "table" then
			for _, eq in pairs(node.equipped) do
				if eq == true then equipped = true break end
			end
		end
		local rarityNorm = normalizeRarity(node.rarity) or "Common"
		table.insert(items, {
			Type = CATEGORY_TYPES[pluralCat] or pluralCat or "Unknown",
			Category = singularKey or pluralCat,
			Index = index,
			Name = tostring(node.name or node.UniqueItemID or "?"),
			Rarity = rarityNorm,
			RarityValue = RARITY_ORDER[rarityNorm],
			SellPrice = tonumber(node.sellPrice) or 0,
			UniqueItemID = node.UniqueItemID,
			Equipped = equipped,
			LevelReq = tonumber(node.levelReq) or 0,
			Raw = node,
		})
	end

	--// Duyệt đệ quy. `pluralCat` = plural category (weapons/helmets/... /nil).
	--// `singularKey` = singular category cho sellItemEvent (weapon/helmet/... /nil).
	--// `index` = số thứ tự item trong category (từ key `category_số`).
	local function walk(node, pluralCat, singularKey, index)
		if type(node) ~= "table" then return end
		if seen[node] then return end
		seen[node] = true

		if isItemTable(node) then
			addItem(node, pluralCat, singularKey, index)
			return
		end

		for key, value in pairs(node) do
			if CATEGORY_TYPES[key] then
				walk(value, key, nil, nil)
			elseif type(value) == "table" and isItemTable(value) then
				local sg, idx = parseItemKey(key)
				walk(value, pluralCat, sg, idx)
			else
				walk(value, pluralCat, singularKey, index)
			end
		end
	end

	walk(data, nil, nil, nil)
	return items
end

--// Kiểm tra 1 item có đủ điều kiện bán không
function autoSell.ShouldSellItem(item)
	if not item then return false end

	if excludeEquipped and item.Equipped then return false end

	if next(rarityFilter) and isRarityOption[item.Rarity] and not rarityFilter[item.Rarity] then
		return false
	end

	if next(typeFilter) and item.Type and not typeFilter[item.Type] then
		return false
	end

	--// Level filter: NẾU KHÔNG chọn mốc nào -> fallback an toàn = chính xác level 1.
	--// KHÔNG BAO GIỜ để trạng thái "none" (không lọc theo level) vì sẽ bán hết inventory.
	local lvSet = levelReqExactFilter
	local lvMode = levelReqMode
	if next(lvSet) == nil then
		lvSet = { [1] = true }
		lvMode = "None"
	end
	local lvl = item.LevelReq or 0
	if lvMode == "Below" then
		-- Bán item có LevelReq ≤ mốc đã chọn (lấy max trong set)
		local threshold
		for v in pairs(lvSet) do
			if not threshold or v > threshold then threshold = v end
		end
		if threshold and lvl > threshold then return false end
	elseif lvMode == "Above" then
		-- Bán item có LevelReq ≥ mốc đã chọn (lấy min trong set)
		local threshold
		for v in pairs(lvSet) do
			if not threshold or v < threshold then threshold = v end
		end
		if threshold and lvl < threshold then return false end
	else
		-- None: chỉ bán đúng các mốc đã tick (fallback 1 => chỉ LevelReq == 1)
		if not lvSet[lvl] then return false end
	end

	return true
end

--// Có ít nhất 1 điều kiện lọc đang active hay không.
--// Dùng để cảnh báo khi user sắp bán mà không có filter nào (rủi ro bán sạch).
function autoSell.HasAnyFilter()
	return next(rarityFilter) ~= nil or next(typeFilter) ~= nil or next(levelReqExactFilter) ~= nil
end

--// Đếm tổng số item khớp điều kiện (gọi khi bấm nút Search, không bán).
--// Trả về { total, matching, byCategory, error }
function autoSell.CountMatches()
	local items, err = fetchInventoryItems()
	if not items then
		return { total = 0, matching = 0, error = err or "Error reading inventory" }
	end

	local matching = 0
	local byCategory = {}
	for _, item in ipairs(items) do
		byCategory[item.Type] = (byCategory[item.Type] or 0) + 1
		if autoSell.ShouldSellItem(item) then matching += 1 end
	end

	return { total = #items, matching = matching, byCategory = byCategory }
end

--// Bán toàn bộ item khớp điều kiện (gọi khi bấm nút). Trả kết quả { sold, skipped, gold }
function autoSell.SellItems()
	if sellRunning then return nil end
	sellRunning = true

	local result = { sold = 0, skipped = 0, gold = 0, error = nil }
	local items, err = fetchInventoryItems()
	if not items then
		result.error = err or "Error reading inventory"
		sellRunning = false
		return result
	end

	--// Gom các item khớp lọc theo category (singular key của sellItemEvent).
	local categoryMap = {}
	for _, item in ipairs(items) do
		if autoSell.ShouldSellItem(item) then
			if item.Index then
				result.sold += 1
				local sg = item.Category or item.Type
				categoryMap[sg] = categoryMap[sg] or {}
				table.insert(categoryMap[sg], item.Index)
			end
		else
			result.skipped += 1
		end
	end

	local ok, gold = pcall(sellAction, categoryMap)
	if ok and gold and type(gold) == "number" then result.gold = gold end

	sellRunning = false
	return result
end

function autoSell.SetLevelReqMode(value)
	if value == "Below" or value == "Above" then
		levelReqMode = value
	else
		levelReqMode = "None"
	end
end

function autoSell.GetLevelReqMode()
	return levelReqMode
end

function autoSell.SetExcludeEquipped(state)
	excludeEquipped = state
end

function autoSell.GetExcludeEquipped()
	return excludeEquipped
end

--// Rarity filter dạng mảng các chuỗi đã chọn
function autoSell.SetRarityFilter(selected)
	rarityFilter = {}
	if type(selected) == "table" then
		for k, v in pairs(selected) do
			if v == true and type(k) == "string" then
				local norm = normalizeRarity(k) or k
				rarityFilter[norm] = true
			elseif type(v) == "string" then
				local norm = normalizeRarity(v) or v
				rarityFilter[norm] = true
			end
		end
	elseif type(selected) == "string" then
		local norm = normalizeRarity(selected) or selected
		rarityFilter[norm] = true
	end
end

function autoSell.GetRarityFilter()
	local out = {}
	for r in pairs(rarityFilter) do table.insert(out, r) end
	return out
end

--// Type filter dạng mảng các chuỗi đã chọn
function autoSell.SetTypeFilter(selected)
	typeFilter = {}
	if type(selected) == "table" then
		for k, v in pairs(selected) do
			if v == true and type(k) == "string" then
				typeFilter[k] = true
			elseif type(v) == "string" then
				typeFilter[v] = true
			end
		end
	elseif type(selected) == "string" then
		typeFilter[selected] = true
	end
end

function autoSell.GetTypeFilter()
	local out = {}
	for t in pairs(typeFilter) do table.insert(out, t) end
	return out
end

--// Level Req Exact filter dạng mảng các chuỗi đã chọn (vd {"1","15","145"})
function autoSell.SetLevelReqExactFilter(selected)
	levelReqExactFilter = {}
	if type(selected) == "table" then
		for k, v in pairs(selected) do
			if v == true then
				local n = tonumber(k)
				if n then levelReqExactFilter[n] = true end
			else
				local n = tonumber(v)
				if n then levelReqExactFilter[n] = true end
			end
		end
	elseif type(selected) == "string" or type(selected) == "number" then
		local n = tonumber(selected)
		if n then levelReqExactFilter[n] = true end
	end
end

function autoSell.GetLevelReqExactFilter()
	local out = {}
	for lvl in pairs(levelReqExactFilter) do table.insert(out, tostring(lvl)) end
	return out
end

--// Auto Sell Toggle & Dungeon Start Watcher
local function isDungeon()
	return not LOBBY_PLACE_IDS[game.PlaceId]
end

local function triggerDungeonStartSell()
	if not autoSellEnabled then return end
	if dungeonSellTriggered then return end
	if not isDungeon() then return end
	if not autoSell.HasAnyFilter() then return end

	dungeonSellTriggered = true
	task.spawn(function()
		-- Chờ 2.5s để server load dữ liệu inventory sau khi teleport/vào dungeon
		task.wait(2.5)
		if not autoSellEnabled or not isDungeon() then return end

		local result = autoSell.SellItems()
		if result and result.sold and result.sold > 0 then
			notifier.Notify("AutoSell", ("Auto-sold %d item(s) on dungeon start."):format(result.sold), 3)
		end
	end)
end

function autoSell.Toggle(state)
	autoSellEnabled = state and true or false
	if autoSellEnabled and isDungeon() and not dungeonSellTriggered then
		triggerDungeonStartSell()
	end
end

function autoSell.IsEnabled()
	return autoSellEnabled
end

--// Lắng nghe thay đổi dungeon để reset cờ và trigger bán cho run mới
shared.OnDungeonNameChanged(function(name)
	dungeonSellTriggered = false
	if name then
		triggerDungeonStartSell()
	end
end)

shared.OnLobbyChanged(function(inLobby)
	if not inLobby then
		dungeonSellTriggered = false
		triggerDungeonStartSell()
	else
		dungeonSellTriggered = false
	end
end)

task.spawn(function()
	while lifecycle.IsActive() do
		task.wait(1)
		if autoSellEnabled and isDungeon() and not dungeonSellTriggered then
			triggerDungeonStartSell()
		end
	end
end)

lifecycle.Register(function()
	autoSellEnabled = false
end)

--// Export constants
autoSell.LEVEL_REQ_OPTIONS = LEVEL_REQ_OPTIONS
autoSell.LEVEL_REQ_MODE_OPTIONS = LEVEL_REQ_MODE_OPTIONS

return autoSell
end function __DIST.L()-- Tab Inventory (DungeonQuest): AutoSell section - sell items by filter.
-- Uses multichoice dropdowns for Rarity and Item Type; "Sell Now" sells once
-- after a confirmation dialog.

--// Imports

local autoSave = __DIST.load('d')
local autoSell = __DIST.load('K')
local notifier = __DIST.load('c')

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "AutoSell" })

	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Filter Summary" })

	--// Right Section Labels (Filter Summary)
	local summaryStatusLabel = rightSection:Label({ Text = "Status: --" })
	local summarySafetyLabel = rightSection:Label({ Text = "Safety: --" })
	local summaryTriggerLabel = rightSection:Label({ Text = "Trigger: <font color='rgb(200,200,255)'>On Dungeon Start</font>" })
	local summaryRarityLabel = rightSection:Label({ Text = "Rarities: --" })
	local summaryTypeLabel = rightSection:Label({ Text = "Item Types: --" })
	local summaryLevelLabel = rightSection:Label({ Text = "Level Req: --" })
	local summaryEquippedLabel = rightSection:Label({ Text = "Exclude Equipped: --" })

	local function updateSummary()
		-- Status
		local isAuto = autoSell.IsEnabled()
		local statusColor = isAuto and "0, 255, 0" or "255, 80, 80"
		local statusText = isAuto and "Enabled" or "Disabled"
		pcall(function()
			summaryStatusLabel:UpdateName("Status: <font color='rgb(" .. statusColor .. ")'>" .. statusText .. "</font>")
		end)

		-- Safety Status
		local hasFilter = autoSell.HasAnyFilter()
		local safetyColor = hasFilter and "0, 255, 0" or "255, 80, 80"
		local safetyText = hasFilter and "✓ Active (Configured)" or "⚠ NO filter selected"
		pcall(function()
			summarySafetyLabel:UpdateName("Safety: <font color='rgb(" .. safetyColor .. ")'>" .. safetyText .. "</font>")
		end)

		-- Rarities
		local rarities = autoSell.GetRarityFilter()
		local rarityText = #rarities > 0 and table.concat(rarities, ", ") or "All (No filter)"
		local rarityColor = #rarities > 0 and "255, 220, 120" or "160, 160, 160"
		pcall(function()
			summaryRarityLabel:UpdateName("Rarities: <font color='rgb(" .. rarityColor .. ")'>" .. rarityText .. "</font>")
		end)

		-- Types
		local types = autoSell.GetTypeFilter()
		local typeText = #types > 0 and table.concat(types, ", ") or "All (No filter)"
		local typeColor = #types > 0 and "255, 220, 120" or "160, 160, 160"
		pcall(function()
			summaryTypeLabel:UpdateName("Item Types: <font color='rgb(" .. typeColor .. ")'>" .. typeText .. "</font>")
		end)

		-- Level Req
		local mode = autoSell.GetLevelReqMode()
		local exactLevels = autoSell.GetLevelReqExactFilter()
		table.sort(exactLevels, function(a, b) return (tonumber(a) or 0) < (tonumber(b) or 0) end)
		local levelText = "1 (Safe Fallback)"
		local levelColor = "255, 160, 80"
		if #exactLevels > 0 then
			levelColor = "255, 220, 120"
			if mode == "Below" then
				levelText = "Below (≤ " .. exactLevels[#exactLevels] .. ")"
			elseif mode == "Above" then
				levelText = "Above (≥ " .. exactLevels[1] .. ")"
			else
				levelText = "Exact (" .. table.concat(exactLevels, ", ") .. ")"
			end
		end
		pcall(function()
			summaryLevelLabel:UpdateName("Level Req: <font color='rgb(" .. levelColor .. ")'>" .. levelText .. "</font>")
		end)

		-- Exclude Equipped
		local exclude = autoSell.GetExcludeEquipped()
		local excludeColor = exclude and "0, 255, 0" or "255, 80, 80"
		local excludeText = exclude and "Yes (Protected)" or "No (May Sell)"
		pcall(function()
			summaryEquippedLabel:UpdateName("Exclude Equipped: <font color='rgb(" .. excludeColor .. ")'>" .. excludeText .. "</font>")
		end)
	end

	--// Left Section Controls
	leftSection:Toggle({
		Name = "Auto Sell on Dungeon Start",
		Default = autoSell.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoSell.Toggle(state)
			updateSummary()
		end),
	}, "Toggle_AutoSellEnabled")

	local RARITY_OPTIONS = { "Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic" }
	local TYPE_OPTIONS = { "Weapons", "Helmets", "Chests", "Abilities" }

	leftSection:Dropdown({
		Name = "Rarity Filter",
		Options = RARITY_OPTIONS,
		Default = autoSell.GetRarityFilter(),
		Multi = true,
		Required = false,
		Callback = autoSave.Wrap(function(selected)
			autoSell.SetRarityFilter(selected)
			updateSummary()
		end),
	}, "Dropdown_AutoSellRarity")

	leftSection:Dropdown({
		Name = "Item Type Filter",
		Options = TYPE_OPTIONS,
		Default = autoSell.GetTypeFilter(),
		Multi = true,
		Required = false,
		Callback = autoSave.Wrap(function(selected)
			autoSell.SetTypeFilter(selected)
			updateSummary()
		end),
	}, "Dropdown_AutoSellType")

	local levelReqDropdown -- forward declaration để mode callback có thể truy cập

	local currentMode = autoSell.GetLevelReqMode()
	local currentModeIndex = table.find(autoSell.LEVEL_REQ_MODE_OPTIONS, currentMode) or 1
	leftSection:Dropdown({
		Name = "Level Req Mode",
		Options = autoSell.LEVEL_REQ_MODE_OPTIONS,
		Default = currentModeIndex,
		Multi = false,
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			autoSell.SetLevelReqMode(selected)
			if levelReqDropdown then
				local isMulti = (selected == "None")
				levelReqDropdown.Settings.Multi = isMulti
				levelReqDropdown.Settings.Required = not isMulti
				local currentFilters = autoSell.GetLevelReqExactFilter()
				if #currentFilters > 0 then
					if not isMulti and #currentFilters > 1 then
						levelReqDropdown:UpdateSelection(currentFilters[1])
					else
						levelReqDropdown:UpdateSelection(currentFilters)
					end
				end
			end
			updateSummary()
		end),
	}, "Dropdown_AutoSellLevelReqMode")

	levelReqDropdown = leftSection:Dropdown({
		Name = "Level Req Filter",
		Options = autoSell.LEVEL_REQ_OPTIONS,
		Default = autoSell.GetLevelReqExactFilter(),
		Multi = currentMode == "None",
		Required = currentMode ~= "None",
		Search = true,
		Callback = autoSave.Wrap(function(selected)
			autoSell.SetLevelReqExactFilter(selected)
			updateSummary()
		end),
	}, "Dropdown_AutoSellLevelReq")

	leftSection:Toggle({
		Name = "Exclude Equipped Items",
		Default = autoSell.GetExcludeEquipped(),
		Callback = autoSave.Wrap(function(state)
			autoSell.SetExcludeEquipped(state)
			updateSummary()
		end),
	}, "Toggle_AutoSellExcludeEquipped")

	local resultLabel = leftSection:Label({
		Text = "No search made yet.",
	}, "Label_AutoSellResult")

	leftSection:Button({
		Name = "Search",
		Callback = function()
			task.spawn(function()
				pcall(function() resultLabel:UpdateName("Reading inventory...") end)
				local result = autoSell.CountMatches()
				if not result then return end
				if result.error then
					pcall(function() resultLabel:UpdateName("<font color='rgb(255,80,80)'>Error: " .. result.error .. "</font>") end)
					return
				end
				local text = ("Found <font color='rgb(0,255,0)'>%d</font>/<font color='rgb(240,240,240)'>%d</font> matching items.\n")
					:format(result.matching, result.total)
				local first = true
				for _, cat in ipairs({ "Weapons", "Helmets", "Chests", "Abilities" }) do
					local n = result.byCategory and result.byCategory[cat]
					if n then
						if first then text ..= cat .. ": " .. n else text ..= " • " .. cat .. ": " .. n end
						first = false
					end
				end
				pcall(function() resultLabel:UpdateName(text) end)
			end)
		end,
	})

	leftSection:Button({
		Name = "Sell Now",
		Callback = function()
			task.spawn(function()
				pcall(function() resultLabel:UpdateName("Reading inventory...") end)

				local preview = autoSell.CountMatches()
				if not preview then
					pcall(function() resultLabel:UpdateName("<font color='rgb(255,80,80)'>A sale is already running.</font>") end)
					return
				end
				if preview.error then
					pcall(function() resultLabel:UpdateName("<font color='rgb(255,80,80)'>Error: " .. preview.error .. "</font>") end)
					return
				end

				local hasFilter = autoSell.HasAnyFilter()
				local warning = ""
				if not hasFilter then
					warning = '\n\n<font color="rgb(255,80,80)"><b>⚠ NO filter selected!</b> This will sell the ENTIRE inventory (except equipped items).</font>'
				end

				local desc = ("Sell <font color='rgb(0,255,0)'>%d</font>/<font color='rgb(240,240,240)'>%d</font> matching item(s) with current filters."):format(preview.matching, preview.total)
				desc = desc .. warning .. "\n\nAre you sure?"

				window:Dialog({
					Title = "Confirm Sale",
					Description = desc,
					Buttons = {
						{
							Name = "Confirm",
							Callback = function()
								task.spawn(function()
									pcall(function() resultLabel:UpdateName("Reading inventory...") end)
									notifier.Notify("AutoSell", "Selling...", 2)

									local result = autoSell.SellItems()
									if not result then
										pcall(function() resultLabel:UpdateName("<font color='rgb(255,80,80)'>A sale is already running.</font>") end)
										return
									end

									if result.error then
										pcall(function() resultLabel:UpdateName("<font color='rgb(255,80,80)'>Error: " .. result.error .. "</font>") end)
										return
									end

									local text = ("Done: <font color='rgb(0,255,0)'>%d</font> sold, <font color='rgb(255,200,0)'>%d</font> skipped, <font color='rgb(255,220,120)'>%s</font> gold earned.")
										:format(result.sold, result.skipped, tostring(result.gold))
									pcall(function() resultLabel:UpdateName(text) end)
								end)
							end,
						},
						{
							Name = "Cancel",
						},
					},
				})
			end)
		end,
	})

	-- Khởi tạo hiển thị summary lần đầu
	updateSummary()
end
end function __DIST.M()-- ESP hitbox cho DungeonQuest.
-- Bao gồm Player/Enemy Hitbox (Real/Custom) + Show Skill Hitbox (tạm thời chỉ northernMageShot - precast).

--// Imports

local services = __DIST.load('e')
local shared = __DIST.load('f')

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
end function __DIST.N()-- ESP Enemy (Highlight) cho DungeonQuest.
-- Vẽ highlight phủ toàn bộ model enemy (giống glow Minecraft) đang track trong
-- dungeon, dựa trên shared.GetTrackedEnemyData. Màu cam để phân biệt với ESP
-- hitbox projectile (đỏ) và player hitbox (xanh lá).

--// Imports

local services = __DIST.load('e')
local shared = __DIST.load('f')

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
end function __DIST.O()-- Map Optimizer (DungeonQuest): Clean Map
-- 1. Làm tàng hình (Transparency = 1) đối với tất cả các Part trong workspace.Map.
-- 2. Bắn Raycast theo trục X và Z xung quanh người chơi: nếu gặp vật cản/tường xung quanh thì lập tức set CanCollide = false và CanTouch = false (ngoại trừ "Solid spikes").

--// Imports

local services = __DIST.load('e')
local lifecycle = __DIST.load('b')

--// Table
local mapOptimizer = {}

--// State
local enabled = false
local loopThread = nil
local connections = {}
local modifiedCollisions = {} -- [part] = { CanCollide, CanTouch }
local modifiedSnowParts = {} -- [part] = originalTransparency

local CLEANUP_INTERVAL = 2

--// Kiểm tra xem instance có phải là Model/Part thuộc danh sách ngoại lệ (stairRamps, Steps, Meshes/Cylinder) hay không
local function isStairRamp(inst)
	if not inst then return false end
	local current = inst
	while current and current ~= workspace do
		local nameLower = current.Name:lower()
		if nameLower:find("stairramp") or nameLower:find("step") or nameLower:find("meshes/cylinder") or nameLower:find("cylinder") then
			return true
		end
		current = current.Parent
	end
	return false
end

--// Xử lý part thuộc model borders (Tắt va chạm & trigger)
local function processBorderPart(part)
	if not enabled or not part or not part:IsA("BasePart") then return end
	if isStairRamp(part) then return end

	if not modifiedCollisions[part] then
		modifiedCollisions[part] = {
			CanCollide = part.CanCollide,
			CanTouch = part.CanTouch,
		}
	end

	pcall(function()
		part.CanCollide = false
		part.CanTouch = false
	end)
end

--// Xử lý một child/descendant bất kỳ (chỉ xử lý borders, không đổi transparency)
local function processInstance(inst)
	if not enabled or not inst then return end
	if isStairRamp(inst) then return end

	-- Nếu là Model / Folder tên chứa "border"
	if (inst:IsA("Model") or inst:IsA("Folder")) and inst.Name:lower():find("border") then
		for _, desc in ipairs(inst:GetDescendants()) do
			if desc:IsA("BasePart") and not isStairRamp(desc) then
				processBorderPart(desc)
			end
		end
		return
	end

	-- Duyệt các descendant bên dưới tìm borders
	for _, desc in ipairs(inst:GetDescendants()) do
		if (desc:IsA("Model") or desc:IsA("Folder")) and desc.Name:lower():find("border") then
			for _, p in ipairs(desc:GetDescendants()) do
				if p:IsA("BasePart") and not isStairRamp(p) then
					processBorderPart(p)
				end
			end
		end
	end
end

--// Danh sách tên object cấp 1 cần giữ lại trong workspace.Map
local KEEP_LV1_NAMES = {
	["meshes/ice3"] = true,
	["meshes/snow"] = true,
	["invisible platform"] = true,
	["part"] = true,
}

local function shouldKeepChildLv1(child)
	if not child then return true end
	if child:IsA("Model") or child:IsA("Folder") then
		return true
	end
	local nameLower = child.Name:lower()
	if KEEP_LV1_NAMES[nameLower] or child.Name == "Meshes/Ice3" or child.Name == "Meshes/Snow" or child.Name == "Invisible platform" or child.Name == "Part" then
		return true
	end
	return false
end

--// Xóa toàn bộ child của các Model tên "borders" (hoặc chứa "border")
local function cleanBorderModels()
	if not enabled then return end

	local mapFolder = workspace:FindFirstChild("Map")
	if not mapFolder then return end

	for _, desc in ipairs(mapFolder:GetDescendants()) do
		if (desc:IsA("Model") or desc:IsA("Folder")) and desc.Name:lower():find("border") then
			for _, child in ipairs(desc:GetChildren()) do
				pcall(function()
					child:Destroy()
				end)
			end
		end
	end
end

--// Xóa các Model có chứa child/descendant có tên "Wooden plank"
local function cleanWoodenPlankModels()
	if not enabled then return end

	local mapFolder = workspace:FindFirstChild("Map")
	if not mapFolder then return end

	for _, desc in ipairs(mapFolder:GetDescendants()) do
		if desc.Name:lower():find("wooden plank") then
			local parent = desc.Parent
			while parent and parent ~= mapFolder and parent ~= workspace do
				if parent:IsA("Model") then
					pcall(function()
						parent:Destroy()
					end)
					break
				end
				parent = parent.Parent
			end
		end
	end
end

--// Quét các child cấp 1 trong Map và Destroy hết mọi thứ không thuộc danh sách giữ lại
local function cleanMapChildrenLv1()
	if not enabled then return end

	local mapFolder = workspace:FindFirstChild("Map")
	if not mapFolder then return end

	for _, child in ipairs(mapFolder:GetChildren()) do
		if not shouldKeepChildLv1(child) then
			pcall(function()
				child:Destroy()
			end)
		end
	end
end

--// Danh sách tọa độ Model cần xóa
local DELETE_MODEL_POSITIONS = {
	Vector3.new(-724.4873046875, 33.9286003112793, 174.7227325439453),
	Vector3.new(-697.8023681640625, 26.397010803222656, 380.60272216796875),
	Vector3.new(-649.3167724609375, 31.39712905883789, 397.80535888671875),
	Vector3.new(-581.634033203125, 3.4567506313323975, 318.2510070800781),
	Vector3.new(-491.9974365234375, 41.522090911865234, 384.67694091796875),
	Vector3.new(-484.0378723144531, 35.76678466796875, 418.82659912109375),
	Vector3.new(-470.1619567871094, 32.919700622558594, 461.6861267089844),
	Vector3.new(-468.8152770996094, 39.06712341308594, 514.388916015625),
	Vector3.new(-600.4266357421875, 13.99144172668457, 570.6660766601562),
	Vector3.new(-338.2521667480469, 42.990394592285156, 439.36456298828125),
	Vector3.new(-355.2449951171875, 57.510982513427734, 385.5475769042969),
	Vector3.new(-606.5220336914062, 37.41774368286133, 372.6407470703125),
}

local EXACT_TOLERANCE = 0.2 -- Sai số so khớp Position chính xác (studs)

local function matchesDeletePosition(pos)
	if not pos then return false end
	for _, targetPos in ipairs(DELETE_MODEL_POSITIONS) do
		if (pos - targetPos).Magnitude <= EXACT_TOLERANCE then
			return true
		end
	end
	return false
end

local function shouldDeleteModelByPosition(model)
	if not model or not model:IsA("Model") or not model.Parent then return false end

	-- 1. So khớp trực tiếp Pivot Position của Model
	local ok1, pivot = pcall(function() return model:GetPivot().Position end)
	if ok1 and pivot and matchesDeletePosition(pivot) then
		return true
	end

	-- 2. So khớp trực tiếp PrimaryPart Position của Model
	if model.PrimaryPart and matchesDeletePosition(model.PrimaryPart.Position) then
		return true
	end

	-- 3. So khớp trực tiếp Position của từng BasePart bên trong Model
	for _, desc in ipairs(model:GetDescendants()) do
		if desc:IsA("BasePart") and matchesDeletePosition(desc.Position) then
			return true
		end
	end

	return false
end

--// Xóa các Model/Part có Position khớp chính xác với danh sách DELETE_MODEL_POSITIONS trong workspace.Map
local function cleanModelsByPosition()
	if not enabled then return end

	local mapFolder = workspace:FindFirstChild("Map") or workspace:FindFirstChild("dungeon") or workspace:FindFirstChild("Dungeon")
	if not mapFolder then return end

	for _, desc in ipairs(mapFolder:GetDescendants()) do
		if not desc.Parent then continue end

		if desc:IsA("Model") then
			if shouldDeleteModelByPosition(desc) then
				pcall(function()
					desc:Destroy()
				end)
			end
		elseif desc:IsA("BasePart") then
			if matchesDeletePosition(desc.Position) then
				local parentModel = desc:FindFirstAncestorOfClass("Model")
				if parentModel and parentModel ~= workspace and parentModel ~= mapFolder then
					pcall(function()
						parentModel:Destroy()
					end)
				else
					pcall(function()
						desc:Destroy()
					end)
				end
			end
		end
	end
end

--// Làm tàng hình riêng các part Meshes/Snow
local function processSnowPart(part)
	if not enabled or not part or not part:IsA("BasePart") then return end
	if part.Name == "Meshes/Snow" or part.Name:lower():find("meshes/snow") or part.Name:lower() == "snow" then
		if modifiedSnowParts[part] == nil then
			modifiedSnowParts[part] = part.Transparency
		end
		pcall(function()
			part.Transparency = 1
		end)
	end
end

local function cleanSnowParts()
	if not enabled then return end

	local mapFolder = workspace:FindFirstChild("Map")
	if not mapFolder then return end

	for _, desc in ipairs(mapFolder:GetDescendants()) do
		if desc:IsA("BasePart") and (desc.Name == "Meshes/Snow" or desc.Name:lower():find("meshes/snow") or desc.Name:lower() == "snow") then
			processSnowPart(desc)
		end
	end
end

--// Quét và xử lý toàn bộ trong workspace.Map
local function cleanMapFolder()
	if not enabled then return end

	-- 1. Xóa các child cấp 1 không hợp lệ
	cleanMapChildrenLv1()

	-- 2. Xóa các child của model borders
	cleanBorderModels()

	-- 3. Xóa các Model có chứa child tên Wooden plank
	cleanWoodenPlankModels()

	-- 4. Xóa các Model theo tọa độ chỉ định
	cleanModelsByPosition()

	-- 5. Làm tàng hình riêng Meshes/Snow
	cleanSnowParts()
end

--// Kiểm tra xem part có phải là Solid spikes nằm trong một Model hay không
local function isSpikeInModel(part)
	if not part then return false end
	local nameLower = part.Name:lower()
	if nameLower:find("solid spikes") then
		local parent = part.Parent
		if parent and parent:IsA("Model") and parent ~= workspace then
			return true
		end
	end
	return false
end



--// Lắng nghe sự kiện thêm mới trong Map
local function attachListeners()
	for _, c in ipairs(connections) do
		pcall(function() c:Disconnect() end)
	end
	table.clear(connections)

	local function hookMap(mapFolder)
		if not mapFolder then return end

		-- Lắng nghe child cấp 1 mới được thêm vào Map để dọn dẹp ngay nếu không thuộc whitelist
		table.insert(connections, mapFolder.ChildAdded:Connect(function(child)
			if not enabled then return end
			if not shouldKeepChildLv1(child) then
				pcall(function()
					child:Destroy()
				end)
			end
		end))

		-- Lắng nghe part/model mới được thêm vào Map
		table.insert(connections, mapFolder.DescendantAdded:Connect(function(desc)
			if not enabled then return end

			-- 1. Nếu là Wooden plank -> xóa toàn bộ Model cha chứa nó
			if desc.Name:lower():find("wooden plank") then
				local parent = desc.Parent
				while parent and parent ~= mapFolder and parent ~= workspace do
					if parent:IsA("Model") then
						pcall(function()
							parent:Destroy()
						end)
						return
					end
					parent = parent.Parent
				end
			end

			-- 2. Nếu nằm trong Model borders -> xóa ngay
			local borderParent = desc.Parent
			while borderParent and borderParent ~= mapFolder and borderParent ~= workspace do
				if (borderParent:IsA("Model") or borderParent:IsA("Folder")) and borderParent.Name:lower():find("border") then
					pcall(function()
						desc:Destroy()
					end)
					break
				end
				borderParent = borderParent.Parent
			end

			-- 3. Nếu là Model hoặc BasePart khớp tọa độ chỉ định -> xóa ngay
			if desc:IsA("Model") and shouldDeleteModelByPosition(desc) then
				pcall(function()
					desc:Destroy()
				end)
				return
			elseif desc:IsA("BasePart") and matchesDeletePosition(desc.Position) then
				local parentModel = desc:FindFirstAncestorOfClass("Model")
				if parentModel and parentModel ~= workspace and parentModel ~= mapFolder then
					pcall(function()
						parentModel:Destroy()
					end)
				else
					pcall(function()
						desc:Destroy()
					end)
				end
				return
			end

			-- 4. Nếu là Meshes/Snow -> làm tàng hình
			if desc:IsA("BasePart") and (desc.Name == "Meshes/Snow" or desc.Name:lower():find("meshes/snow") or desc.Name:lower() == "snow") then
				processSnowPart(desc)
			end
		end))
	end

	local map = workspace:FindFirstChild("Map") or workspace:FindFirstChild("dungeon") or workspace:FindFirstChild("Dungeon")
	if map then
		hookMap(map)
	end

	-- Lắng nghe khi Folder Map được tạo/tải lại khi chuyển màn
	table.insert(connections, workspace.ChildAdded:Connect(function(child)
		if not enabled then return end
		local nameLower = child.Name:lower()
		if nameLower == "map" or nameLower == "dungeon" then
			hookMap(child)
			task.delay(0.2, cleanMapFolder)
		end
	end))
end

--// Phục hồi lại trạng thái ban đầu khi tắt
local function restoreMap()
	-- 1. Phục hồi Transparency cho riêng các part Meshes/Snow
	for part, originalTransparency in pairs(modifiedSnowParts) do
		if part and part.Parent then
			pcall(function()
				part.Transparency = originalTransparency
			end)
		end
	end
	table.clear(modifiedSnowParts)

	-- 2. Phục hồi Collision & Touch cho các borders/walls đã tắt va chạm
	for part, originalState in pairs(modifiedCollisions) do
		if part and part.Parent then
			pcall(function()
				part.CanCollide = originalState.CanCollide
				part.CanTouch = originalState.CanTouch
			end)
		end
	end
	table.clear(modifiedCollisions)
end

function mapOptimizer.Toggle(state)
	if state == enabled then return end
	enabled = state and true or false

	if enabled then
		cleanMapFolder()
		attachListeners()

		if loopThread then task.cancel(loopThread); loopThread = nil end
		loopThread = task.spawn(function()
			while enabled do
				task.wait(CLEANUP_INTERVAL)
				pcall(cleanMapFolder)
			end
		end)
	else
		for _, c in ipairs(connections) do
			pcall(function() c:Disconnect() end)
		end
		table.clear(connections)

		if loopThread then task.cancel(loopThread); loopThread = nil end
		restoreMap()
	end
end

function mapOptimizer.IsEnabled()
	return enabled
end

lifecycle.Register(function()
	mapOptimizer.Toggle(false)
end)

return mapOptimizer end function __DIST.P()-- Module Visual trong tab Utilities (DungeonQuest): các tính năng hiển thị trực quan.

--// Imports
	
local autoSave = __DIST.load('d')
	local esp = __DIST.load('M')
	local enemyEsp = __DIST.load('N')
	local mapOptimizer = __DIST.load('O')
	local ui = __DIST.load('g')

--// Hitbox mode options
local HITBOX_OPTIONS = { "Custom Hitbox", "Real Hitbox" }
local function hitboxModeToIndex(mode)
	return (mode == "Custom" and 1) or 2
end
local function hitboxLabelToMode(label)
	return (label == HITBOX_OPTIONS[1] and "Custom") or "Real"
end

return function(window, tab)
	local applyHitboxVisibility

	local playerSection = tab:Section({ Side = "Left" })
	playerSection:Header({ Name = "Player" })

	playerSection:Toggle({
		Name = "Hitbox",
		Default = esp.IsPlayerHitboxEnabled(),
		Callback = autoSave.Wrap(function(state)
			esp.TogglePlayerHitbox(state)
		end),
	}, "Toggle_PlayerHitbox")

	playerSection:Dropdown({
		Name = "Hitbox Mode",
		Options = HITBOX_OPTIONS,
		Default = hitboxModeToIndex(esp.GetPlayerHitboxMode()),
		Required = true,
		Callback = autoSave.Wrap(function(option)
			esp.SetPlayerHitboxMode(hitboxLabelToMode(option))
			applyHitboxVisibility()
		end),
	}, "Dropdown_PlayerHitboxMode")

	local playerSizeSlider = ui.PatchSliderLoadCallback(playerSection:Slider({
		Name = "Hitbox Size",
		Default = esp.GetPlayerHitboxScale(),
		Minimum = 1,
		Maximum = 5,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(Value)
			esp.SetPlayerHitboxScale(Value)
		end),
	}, "Slider_PlayerHitboxSize"))

	local enemySection = tab:Section({ Side = "Left" })
	enemySection:Header({ Name = "Enemy" })

	enemySection:Toggle({
		Name = "Model Highlight",
		Default = enemyEsp.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			enemyEsp.Toggle(state)
		end),
	}, "Toggle_EnemyESP")

	local highlightColors = enemyEsp.GetColorNames()
	local currentColor = enemyEsp.GetSelectedColor()
	local colorDefaultIndex = 1
	for i, name in ipairs(highlightColors) do
		if name == currentColor then
			colorDefaultIndex = i
			break
		end
	end

	enemySection:Dropdown({
		Name = "Highlight Color",
		Options = highlightColors,
		Default = colorDefaultIndex,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			enemyEsp.SetSelectedColor(option)
		end),
	}, "Dropdown_HighlightColor")

	enemySection:Toggle({
		Name = "Hitbox",
		Default = esp.IsEnemyHitboxEnabled(),
		Callback = autoSave.Wrap(function(state)
			esp.ToggleEnemyHitbox(state)
		end),
	}, "Toggle_EnemyHitbox")

	enemySection:Dropdown({
		Name = "Hitbox Mode",
		Options = HITBOX_OPTIONS,
		Default = hitboxModeToIndex(esp.GetEnemyHitboxMode()),
		Required = true,
		Callback = autoSave.Wrap(function(option)
			esp.SetEnemyHitboxMode(hitboxLabelToMode(option))
			applyHitboxVisibility()
		end),
	}, "Dropdown_EnemyHitboxMode")

	local enemySizeSlider = ui.PatchSliderLoadCallback(enemySection:Slider({
		Name = "Hitbox Size",
		Default = esp.GetEnemyHitboxScale(),
		Minimum = 1,
		Maximum = 5,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(Value)
			esp.SetEnemyHitboxScale(Value)
		end),
	}, "Slider_EnemyHitboxSize"))

	enemySection:Toggle({
		Name = "Show Skill Hitbox",
		Default = esp.IsSkillHitboxEnabled(),
		Callback = autoSave.Wrap(function(state)
			esp.ToggleSkillHitbox(state)
		end),
	}, "Toggle_SkillHitbox")

	applyHitboxVisibility = function()
		pcall(function() playerSizeSlider:SetVisibility(esp.GetPlayerHitboxMode() == "Custom") end)
		pcall(function() enemySizeSlider:SetVisibility(esp.GetEnemyHitboxMode() == "Custom") end)
	end
	applyHitboxVisibility()

	local mapSection = tab:Section({ Side = "Right" })
	mapSection:Header({ Name = "Map" })

	mapSection:Toggle({
		Name = "Map Optimizer",
		Default = mapOptimizer.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			mapOptimizer.Toggle(state)
		end),
	}, "Toggle_MapOptimizer")

end
end function __DIST.Q()-- Webhook Discord cho DungeonQuest: gửi thông báo WIN + Reward qua Discord.
-- Bắt sự kiện `cloneRewardGui` (RemoteEvent do game fire khi thắng dungeon), đọc
-- reward, build Discord embed và gửi qua HttpService / `request` của executor.

--// Imports

local macLib = __DIST.load('a')
local notifier = __DIST.load('c')
local shared = __DIST.load('f')
local lifecycle = __DIST.load('b')

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
local rewardConnection = nil
local disconnectDungeonWatcher = nil

local pingEnabled = false
local pingMention = ""
local pingTiers = { "Tier6" } -- danh sách tier đã chọn (Secret = Tier6)

--// Color theo rarity (Discord embed Decimal color)
local RARITY_COLORS = {
	common = 9807270,      -- Xám
	uncommon = 43520,      -- Xanh lá
	rare = 3447003,        -- Xanh dương
	epic = 10181046,       -- Tím
	legendary = 16766720,  -- Vàng
	--// Cấp cao nhất (ultimate): game có thể gọi bằng nhiều tên, map chung về ĐỎ
	secret = 15158332,
	ultimate = 15158332,
	mythic = 15158332,
}
--// Thứ tự cấp rarity (càng về sau càng cao) để lấy màu cao nhất
local RARITY_ORDER = {
	common = 1,
	uncommon = 2,
	rare = 3,
	epic = 4,
	legendary = 5,
	secret = 6,
	ultimate = 6,
	mythic = 6,
}
local DEFAULT_COLOR = 10181046

--// Đồ hiếm đặc biệt: mỗi map Nightmare có "bộ giáp xịn" với prefix tên riêng
--// (vd Northenland -> "Valhalla"). Item có prefix này -> nổi bật (⭐). Match theo tên
--// map hiện tại (substring, không phân biệt hoa/thường). Set tĩnh, luôn bật.
local SPECIAL_ARMOR_BY_MAP = {
	{ match = "northen", prefix = "Valhalla" },
	{ match = "northern", prefix = "Valhalla" },
}
--// Màu đồng nhấn cho item đặc biệt trong embed
local SPECIAL_COLOR = 16766720 -- Vàng

--// Lấy prefix giáp xịn của map hiện tại (dựa trên GetCurrentDungeonName), nếu có.
local function getSpecialPrefix()
	local dungeon = shared.GetCurrentDungeonName()
	if not dungeon or dungeon == "" then return nil end
	local lower = string.lower(dungeon)
	for _, entry in ipairs(SPECIAL_ARMOR_BY_MAP) do
		if string.find(lower, entry.match, 1, true) then
			return entry.prefix
		end
	end
	return nil
end

--// Item có "đồ hiếm" (cần nổi bật) hay không:
--//  1. tên bắt đầu bằng prefix giáp xịn của map hiện tại (vd "Valhalla...")
--//  2. HOẶC rarity thuộc cấp cao nhất: legendary / ultimate (secret, mythic)
--//     Game có thể gọi "ultimate" bằng nhiều tên (secret/mythic) -> map chung.
--// Luôn bật, không cần toggle.
local SPECIAL_RARITIES = {
	legendary = true,
	secret = true,
	ultimate = true,
	mythic = true,
}
local function isSpecialItem(item)
	if not item then return false end
	if SPECIAL_RARITIES[tostring(item.rarity or ""):lower()] then return true end
	local prefix = getSpecialPrefix()
	if prefix and prefix ~= "" then
		local name = tostring(item.itemName or "")
		return string.sub(name, 1, #prefix) == prefix
	end
	return false
end

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

--// Lấy tên hiển thị của player (username Name, fallback DisplayName)
local function getPlayerName()
	local p = game:GetService("Players").LocalPlayer
	if not p then return "?" end
	if p.Name and p.Name ~= "" then return p.Name end
	return p.DisplayName or "?"
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

--// Retry lấy XP trước dungeon cho tới khi có (tránh nil do timing/XP chưa sẵn sàng).
--// Chạy 1 lần rồi thoát; nếu vẫn chưa có thì thử lại sau – gọi lại từ nơi khác nếu cần.
local xpBeforeTaskRunning = false
local function ensureXpBefore()
	if xpBefore ~= nil or xpBeforeTaskRunning then return end
	xpBeforeTaskRunning = true
	task.spawn(function()
		local timeout = os.clock() + 8
		while xpBefore == nil and os.clock() < timeout do
			xpBefore = getXp()
			if xpBefore ~= nil then break end
			task.wait(0.25)
		end
		xpBeforeTaskRunning = false
	end)
end

--// Reset bộ đếm: ghi nhận XP trước dungeon (khi đang ở lobby/startButton hiện)
local function resetRun()
	xpBefore = getXp()
	if xpBefore == nil then ensureXpBefore() end
	shared.SetDungeonStartTime(nil)
end

--// Bắt đầu tính thời gian hoàn thành (startButton biến mất -> vào dungeon)
local function startRun()
	if not shared.GetDungeonStartTime() then shared.SetDungeonStartTime(os.clock()) end
	if xpBefore == nil then ensureXpBefore() end
end

--// Theo dõi trạng thái lobby/dungeon qua shared (startButton + dungName):
--// lobby = reset bộ đếm XP, vào dungeon = bắt đầu tính thời gian hoàn thành.
local function startDungeonWatcher()
	if disconnectDungeonWatcher then return end
	local function onLobbyChanged(lobby)
		if lobby then
			resetRun()
		else
			startRun()
		end
	end
	onLobbyChanged(shared.IsInLobby())
	disconnectDungeonWatcher = shared.OnLobbyChanged(onLobbyChanged)
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
		local special = isSpecialItem(item)
		if special then name = "⭐ " .. name end
		local meta = {}
		if item.itemType and item.itemType ~= "gold" then table.insert(meta, item.itemType) end
		if item.rarity then table.insert(meta, item.rarity) end
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
	local hasSpecial = false
	local specialTop = nil
	local topRarity
	local function higherRarity(a, b)
		if a == nil then return b end
		if b == nil then return a end
		return (RARITY_ORDER[a] or 0) >= (RARITY_ORDER[b] or 0) and a or b
	end
	for _, item in ipairs(items) do
		local rarity = tostring(item.rarity or ""):lower()
		if isSpecialItem(item) then
			hasSpecial = true
			specialTop = higherRarity(specialTop, rarity)
		end
		if RARITY_COLORS[rarity] ~= nil then
			topRarity = higherRarity(topRarity, rarity)
		end
	end
	if hasSpecial then
		color = specialTop and (RARITY_COLORS[specialTop] or SPECIAL_COLOR) or SPECIAL_COLOR
	elseif topRarity then
		color = RARITY_COLORS[topRarity]
	end

	meta = meta or {}
	local level = tostring(meta.level or "?")
	local expGained = tonumber(meta.expGained)
	local expText = expGained and string.format("+%s XP", tostring(expGained)) or "?"
	local durationText = formatDuration(meta.duration)

	local summary = {}
	if expGained then table.insert(summary, expText) end
	if gold > 0 then table.insert(summary, string.format("+%s gold", tostring(gold))) end
	local summaryText = #summary > 0 and table.concat(summary, "  ") or ""

	local rewardsText = #items > 0 and buildItemsText(items) or "None"
	local rewardsValue = rewardsText
	if summaryText ~= "" then
		rewardsValue = summaryText .. (rewardsText ~= "None" and ("\n" .. rewardsText) or "")
	end

	local fields = {
		{
			name = "Player",
			value = string.format("%s (lv %s)", getPlayerName(), level),
			inline = true,
		},
		{
			name = "Map",
			value = shared.GetCurrentDungeonName() or "Unknown",
			inline = true,
		},
		{
			name = "Time",
			value = durationText,
			inline = true,
		},
		{
			name = "Rewards",
			value = rewardsValue,
			inline = false,
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

	rewardConnection = rewardRemote.OnClientEvent:Connect(function(reward)
		if not enabled then return end

		ensureXpBefore()

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

lifecycle.Register(function()
	if rewardConnection then rewardConnection:Disconnect(); rewardConnection = nil end
	if disconnectDungeonWatcher then disconnectDungeonWatcher(); disconnectDungeonWatcher = nil end
	connected = false
end)

return webhook
end function __DIST.R()-- Module Notifications trong tab Utilities (DungeonQuest): cấu hình Webhook Discord.
-- Input webhook URL + toggle bật/tắt + nút test gửi thử + cấu hình ping.

--// Imports

local webhook = __DIST.load('Q')

return function(window, tab)
	local section = tab:Section({ Side = "Right" })
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

	local pingSection = tab:Section({ Side = "Right" })
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
end function __DIST.S()
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
end function __DIST.T()--// Anti AFK Universal: ngăn bị kick vì idle (auto click qua VirtualUser).
--// Có thể dùng ở bất kỳ route nào (Universal, Game 2, ...) mà không phụ thuộc game.

--// Imports

local binder = __DIST.load('S')

--// Services
local VirtualUser = game:GetService("VirtualUser")

--// Table
local antiAfk = {}

--// State
local enabled = false
local interval = 60 -- giây giữa mỗi lần "hoạt động" giả lập
local thread = nil

--// Gửi 1 lần tín hiệu "đang hoạt động" (click chuột trái/phải)
local function sendActivity()
	pcall(function()
		VirtualUser:CaptureController()
		VirtualUser:Button1Down(Vector2.new(0, 0))
		VirtualUser:Button1Up(Vector2.new(0, 0))
		VirtualUser:Button2Down(Vector2.new(0, 0))
		VirtualUser:Button2Up(Vector2.new(0, 0))
	end)
end

--// Vòng lặp giữ session không bị kick
local function kickLoop()
	while enabled do
		sendActivity()

		local waitTime = interval
		while waitTime > 0 and enabled do
			local step = math.min(waitTime, 0.5)
			task.wait(step)
			waitTime -= step
		end
	end
	thread = nil
end

--// Methods
function antiAfk.Start()
	if enabled or thread then return end
	enabled = true

	--// Gửi ngay tức thì để session hoạt động ngay khi bật
	task.spawn(sendActivity)
	thread = task.spawn(kickLoop)
end

function antiAfk.Stop()
	enabled = false
end

function antiAfk.IsEnabled()
	return enabled
end

function antiAfk.SetInterval(seconds)
	seconds = tonumber(seconds)
	if seconds and seconds > 0 then
		interval = seconds
	else
		interval = 60
	end
end

function antiAfk.GetInterval()
	return interval
end

--// Wrap với binder để gán qua property (tương thích tab:Toggle/tab:Slider)
return binder.Wrap(antiAfk, {
	Enabled = function(value: boolean)
		if value then
			antiAfk.Start()
		else
			antiAfk.Stop()
		end
	end,

	Interval = function(value: number)
		antiAfk.SetInterval(value)
	end,
}) :: {
	Enabled: boolean,
	Interval: number,
	Start: () -> (),
	Stop: () -> (),
	IsEnabled: () -> boolean,
	SetInterval: (number) -> (),
	GetInterval: () -> number
}
end function __DIST.U()-- Module Mix trong tab Utilities (DungeonQuest): các tiện ích tổng hợp (anti afk, ...).

--// Imports

local autoSave = __DIST.load('d')
local ui = __DIST.load('g')
local antiAfk = __DIST.load('T')

return function(window, tab)
	local section = tab:Section({ Side = "Left" })
	section:Header({ Name = "Anti AFK" })

	section:Toggle({
		Name = "Anti AFK",
		Default = antiAfk.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			if state then
				antiAfk.Start()
			else
				antiAfk.Stop()
			end
		end),
	}, "Toggle_AntiAFK")

	ui.PatchSliderLoadCallback(section:Slider({
		Name = "Interval (giây)",
		Default = antiAfk.GetInterval(),
		Minimum = 5,
		Maximum = 300,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			antiAfk.SetInterval(value)
		end),
	}, "Slider_AntiAFKInterval"))
end
end function __DIST.V()-- Tab Utilities (DungeonQuest): gộp Visual + Notifications (Webhook) + Mix (Anti AFK).
-- Mỗi module con render sections vào cùng 2 cột của tab này (gọi theo thứ tự).


return function(window, tab)
__DIST.load('P')(window, tab)
__DIST.load('R')(window, tab)
__DIST.load('U')(window, tab)
end end function __DIST.W()-- Auto Hide UI cho DungeonQuest: tự ẩn cửa sổ script hub ngay sau khi execute.
-- Hiện lại bằng keybind mặc định (RightControl) mà Maclib đã cấu hình sẵn.

--// Imports

local macLib = __DIST.load('a')
local notifier = __DIST.load('c')

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
end function __DIST.X()-- Module Config trong tab Configs (DungeonQuest): tự build config section dùng API Maclib
-- (SaveConfig/LoadConfig/RefreshConfigList) và Dropdown (UpdateSelection/IsOption/Value...).
-- Hỗ trợ auto-select config autoload + auto-save (xem core/autoSave).

--// Imports

local macLib = __DIST.load('a')
local autoSave = __DIST.load('d')
local autoHide = __DIST.load('W')

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
end function __DIST.Y()-- Module State trong tab Configs (DungeonQuest): hiển thị trạng thái thời gian thực.

--// Imports

local shared = __DIST.load('f')
local autoRetry = __DIST.load('I')

local BOSS_LABEL = "Boss Active"
local BOSS_INDEX_LABEL = "Boss"
local DUNGEON_LABEL = "Dungeon"
local TIMER_LABEL = "Time Left"

return function(window, tab)
	local section = tab:Section({ Side = "Right" })
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

	local roomLabel = section:Label({
		Text = "Room: --",
	})

	local function updateRoom()
		local room = shared.GetCurrentRoomIndex()
		if room <= 0 then
			roomLabel:UpdateName("Room: <font color='rgb(160, 160, 160)'>--</font>")
			return
		end
		local isBoss = room >= 100
		local color = isBoss and "255, 200, 80" or "0, 255, 0"
		roomLabel:UpdateName("Room: <font color='rgb(" .. color .. ")'>" .. tostring(room) .. "</font>")
	end

	updateRoom()

	shared.OnRoomIndexChanged(function()
		updateRoom()
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

	--// Forward declaration: updateLobby được định nghĩa phía dưới nhưng poll loop
	--// ở đây chạy trước -> nếu không khai báo trước sẽ thành global nil.
	local updateLobby

	task.spawn(function()
		while task.wait(0.5) do
			updateBoss(shared.IsBossActive())
			updateBossIndex()
			updateRoom()
			updateEnemyCount()
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
end function __DIST.Z()-- Tab Configs (DungeonQuest): gộp Config (quản lý config) + State (giám sát realtime).
-- Mỗi module con render sections vào cùng 2 cột của tab này (gọi theo thứ tự).


return function(window, tab)
__DIST.load('X')(window, tab)
__DIST.load('Y')(window, tab)
end end function __DIST._()-- Path Record System – Storage: quản lý MACRO bản ghi cho từng MAP.
--   - Macro = 1 bản ghi cho cả map, chứa toàn bộ segment của các room đã record.
--   - Mỗi segment = 1 room (auto-split khi record liên tục xuyên các room); segment
--     phòng bosss được đánh dấu `boss: true`.
--   - Mode của map (NORMAL skips boss / FULL record + phát cả boss room) lưu ở `mode`
--     trong CHÍNH file macro -> "tùy map".
--   - Lưu thành các file JSON độc lập trong thư mục của Hub: "EsclipseHub/DQMacro/<MapName>.json".
--   - Tự động quét tất cả file .json trong folder khi khởi động hoặc reload.
--   - Tự động migrate data cũ (từ Maclib config hoặc folder root cũ) sang EsclipseHub/DQMacro/.
--   - Format của mỗi file JSON:
--     {
--       "map": "TênMap",
--       "version": 3,
--       "created": os.time(),
--       "updated": os.time(),
--       "mode": "normal" | "full",
--       "rooms": {
--         "1": { "startPos": {X,Y,Z}, "points": [ {X,Y,Z}, ... ], "speed": 18, "events": { ... }, "boss": true },
--         ...
--       }
--     }

--// Imports

local services = __DIST.load('e')
local macLib = __DIST.load('a')
local autoSave = __DIST.load('d')

local HttpService = services.HttpService or game:GetService("HttpService")

--// Table
local storage = {}

--// Constants
local SUB_FOLDER = "DQMacro"
local LEGACY_STORAGE_KEY = "pathRecord"
local CURRENT_VERSION = 3

--// Mode của map (lưu trong file macro): NORMAL = bỏ qua boss (dùng Hazard Scanner),
--// FULL = record + phát luôn cả phòng boss theo path đã ghi.
local MODE_NORMAL = "normal"
local MODE_FULL = "full"

local function normalizeMode(mode)
	if mode == MODE_FULL then return MODE_FULL end
	return MODE_NORMAL
end

--// File system check
local hasFileSystem = (isfile ~= nil and writefile ~= nil and makefolder ~= nil and isfolder ~= nil)

--// In-memory cache
local cache = {} -- [mapName] = rawMacroTable
local isInitialized = false

--// Listeners (UI cập nhật khi bản ghi thay đổi)
local changedListeners = {}

local function fireChanged()
	for i = #changedListeners, 1, -1 do
		pcall(changedListeners[i])
	end
end

--// Đường dẫn thư mục macro nằm BÊN TRONG folder của Hub (ví dụ: EsclipseHub/DQMacro)
local function getMacroDir()
	local base = macLib.Folder or "EsclipseHub"
	return base .. "/" .. SUB_FOLDER
end

--// Đảm bảo thư mục EsclipseHub/ và EsclipseHub/DQMacro/ tồn tại
local function ensureFolder()
	if not hasFileSystem then return end
	pcall(function()
		local base = macLib.Folder or "EsclipseHub"
		if not isfolder(base) then
			makefolder(base)
		end
		local macroDir = getMacroDir()
		if not isfolder(macroDir) then
			makefolder(macroDir)
		end
	end)
end

--// Tên file an toàn không chứa ký tự cấm của hệ điều hành
local function sanitizeFileName(name)
	if type(name) ~= "string" then return "Unknown" end
	return (string.gsub(name, '[/\\:*?"<>|]', "_"))
end

local function getFilePathForMap(mapName)
	return getMacroDir() .. "/" .. sanitizeFileName(mapName) .. ".json"
end

local function encodeVec(vec)
	if not vec then return nil end
	return { X = vec.X, Y = vec.Y, Z = vec.Z }
end

local function decodeVec(t)
	if not t or type(t) ~= "table" then return nil end
	return Vector3.new(t.X or 0, t.Y or 0, t.Z or 0)
end

local function isRoomSeg(raw)
	return type(raw) == "table" and type(raw.points) == "table" and #raw.points > 0
end

--// Facing lưu dạng {X,Z} (trục ngang của LookVector). Decode -> Vector3 unit (X,0,Z).
local function decodeFacing(f)
	if type(f) ~= "table" or type(f.X) ~= "number" then return nil end
	local look = Vector3.new(f.X, 0, f.Z)
	if look.Magnitude < 0.001 then return nil end
	return look.Unit
end

--// Decode events của segment: dwells (đứng chờ) + skills (chuột phải).
local function decodeEvents(rawEvents)
	if type(rawEvents) ~= "table" then return nil end

	local dwells = {}
	for _, d in ipairs(rawEvents.dwells or {}) do
		local pos = decodeVec(d.pos)
		if pos then
			dwells[#dwells + 1] = {
				pos = pos,
				dur = tonumber(d.dur) or 0,
				facing = decodeFacing(d.facing),
			}
		end
	end

	local skills = {}
	for _, s in ipairs(rawEvents.skills or {}) do
		local pos = decodeVec(s.pos)
		if pos then
			skills[#skills + 1] = {
				pos = pos,
				facing = decodeFacing(s.facing),
				key = s.key, --// "M2" | "Q" | "E" (nil = macro cũ -> mặc định chuột phải)
				dw = math.floor(tonumber(s.dw) or 0), --// index dwell liên kết (0 = không)
				dwT = tonumber(s.dwT) or 0, --// giây sau khi vào dwell (dwell-linked)
			}
		end
	end

	if #dwells == 0 and #skills == 0 then return nil end
	return { dwells = dwells, skills = skills }
end

--// Khởi tạo & quét toàn bộ macro từ disk
local function initStorage()
	if isInitialized then return end
	isInitialized = true

	if hasFileSystem then
		ensureFolder()
		local macroDir = getMacroDir()

		-- Migration từ folder DQMacro ngoài root (nếu có trước đây) sang EsclipseHub/DQMacro
		if isfolder("DQMacro") and listfiles then
			pcall(function()
				local rootFiles = listfiles("DQMacro")
				if type(rootFiles) == "table" then
					for _, rPath in ipairs(rootFiles) do
						if type(rPath) == "string" and string.lower(string.sub(rPath, -5)) == ".json" and isfile(rPath) then
							local fileName = string.match(rPath, "([^/\\]+)$") or "unknown.json"
							local destPath = macroDir .. "/" .. fileName
							local content = readfile(rPath)
							writefile(destPath, content)
							delfile(rPath)
						end
					end
				end
			end)
		end

		-- Quét tất cả file .json trong EsclipseHub/DQMacro/
		if listfiles and isfolder(macroDir) then
			local ok, files = pcall(function()
				return listfiles(macroDir)
			end)
			if ok and type(files) == "table" then
				for _, filePath in ipairs(files) do
					if type(filePath) == "string" and string.lower(string.sub(filePath, -5)) == ".json" then
						pcall(function()
							if isfile(filePath) then
								local content = readfile(filePath)
								local raw = HttpService:JSONDecode(content)
								if type(raw) == "table" and type(raw.map) == "string" and type(raw.rooms) == "table" then
									cache[raw.map] = raw
								end
							end
						end)
					end
				end
			end
		end

		-- Migration từ Maclib contextData cũ (nếu có) sang EsclipseHub/DQMacro/
		local context = macLib.contextData
		if type(context) == "table" and type(context[LEGACY_STORAGE_KEY]) == "table" then
			local legacyData = context[LEGACY_STORAGE_KEY]
			local migratedAny = false
			for mapName, macro in pairs(legacyData) do
				if type(mapName) == "string" and type(macro) == "table" then
					if not cache[mapName] then
						cache[mapName] = macro
					end
					pcall(function()
						writefile(getFilePathForMap(mapName), HttpService:JSONEncode(macro))
					end)
					migratedAny = true
				end
			end
			if migratedAny then
				context[LEGACY_STORAGE_KEY] = nil
				autoSave.Save()
			end
		end
	else
		-- Fallback nếu executor không hỗ trợ file system
		local context = macLib.contextData
		if type(context) == "table" and type(context[LEGACY_STORAGE_KEY]) == "table" then
			for mapName, macro in pairs(context[LEGACY_STORAGE_KEY]) do
				if type(mapName) == "string" and type(macro) == "table" then
					cache[mapName] = macro
				end
			end
		end
	end
end

--// Làm mịn đường gấp khúc (Douglas-Peucker trên mặt phẳng XZ) kèm bảo toàn góc cua gấp (Smart Corner Preservation).
--// - Quét tìm các điểm đổi hướng lớn (> 35°) làm điểm neo (Keypoints) bắt buộc giữ lại.
--// - Áp dụng Douglas-Peucker giữa các điểm neo để làm thẳng các đoạn zíc-zắc mà không làm mất góc cua hiểm hóc.
local MIN_KEEP_SPACING = 0.1 -- Studs tối thiểu giữa 2 điểm giữ lại (độ phân giải cao)
local CORNER_COS_THRESHOLD = 0.82 -- ~35° (cos(35°) ≈ 0.819): góc lệch lớn hơn mức này coi là cua gắt
local MIN_CORNER_ARM = 0.3 -- Studs tối thiểu mỗi cánh để tránh jitter cục bộ

local function flatDistance(a, b)
	local dx = a.X - b.X
	local dz = a.Z - b.Z
	return math.sqrt(dx * dx + dz * dz)
end

function storage.SimplifyPath(points, tol)
	local n = #points
	if n <= 2 then return points end

	local keep = {}
	for i = 1, n do keep[i] = false end
	keep[1] = true
	keep[n] = true

	-- Pre-scan tìm các đỉnh cua gắt (Smart Corner Preservation)
	local keypoints = { 1 }
	for i = 2, n - 1 do
		local a = points[i - 1]
		local b = points[i]
		local c = points[i + 1]

		local v1x = b.X - a.X
		local v1z = b.Z - a.Z
		local len1 = math.sqrt(v1x * v1x + v1z * v1z)

		local v2x = c.X - b.X
		local v2z = c.Z - b.Z
		local len2 = math.sqrt(v2x * v2x + v2z * v2z)

		if len1 >= MIN_CORNER_ARM and len2 >= MIN_CORNER_ARM then
			local dot = (v1x * v2x + v1z * v2z) / (len1 * len2)
			if dot < CORNER_COS_THRESHOLD then
				keep[i] = true
				table.insert(keypoints, i)
			end
		end
	end
	table.insert(keypoints, n)

	local tol2 = tol * tol
	local stack = {}
	for k = 1, #keypoints - 1 do
		local kA, kB = keypoints[k], keypoints[k + 1]
		if kB - kA > 1 then
			table.insert(stack, { kA, kB })
		end
	end

	while #stack > 0 do
		local seg = table.remove(stack)
		local a, b = seg[1], seg[2]
		local ax, az = points[a].X, points[a].Z
		local bx, bz = points[b].X, points[b].Z
		local dx = bx - ax
		local dz = bz - az
		local len2 = dx * dx + dz * dz

		local maxD = -1
		local maxI = 0
		for i = a + 1, b - 1 do
			local t = 0
			if len2 > 0 then
				t = ((points[i].X - ax) * dx + (points[i].Z - az) * dz) / len2
				t = math.clamp(t, 0, 1)
			end
			local ex = points[i].X - (ax + dx * t)
			local ez = points[i].Z - (az + dz * t)
			local d2 = ex * ex + ez * ez
			if d2 > maxD then
				maxD = d2
				maxI = i
			end
		end
		if maxI > 0 and maxD > tol2 then
			keep[maxI] = true
			table.insert(stack, { a, maxI })
			table.insert(stack, { maxI, b })
		end
	end

	local out = {}
	for i = 1, n do
		if keep[i] and (#out == 0 or flatDistance(out[#out], points[i]) >= MIN_KEEP_SPACING or i == n) then
			table.insert(out, points[i])
		end
	end
	if #out == 1 then table.insert(out, points[n]) end
	return out
end

function storage.OnChanged(callback)
	if type(callback) ~= "function" then return function() end end
	table.insert(changedListeners, callback)
	return function()
		for i, cb in ipairs(changedListeners) do
			if cb == callback then table.remove(changedListeners, i) break end
		end
	end
end

--// Có macro cho map này không?
function storage.HasMap(mapName)
	if type(mapName) ~= "string" or #mapName == 0 then return false end
	initStorage()
	local macro = cache[mapName]
	if not macro or type(macro.rooms) ~= "table" then return false end
	for _, r in pairs(macro.rooms) do
		if isRoomSeg(r) and #r.points > 0 then return true end
	end
	return false
end

--// Decode 1 phase segment độc lập
local function decodePhaseSeg(raw)
	if not raw or type(raw) ~= "table" or type(raw.points) ~= "table" then return nil end
	local points = {}
	for _, p in ipairs(raw.points) do
		local vec = decodeVec(p)
		if vec then points[#points + 1] = vec end
	end
	if #points == 0 then return nil end
	return {
		startPos = decodeVec(raw.startPos) or points[1],
		points = points,
		events = raw.events and decodeEvents(raw.events) or nil,
		speed = tonumber(raw.speed) or 0,
	}
end

--// Lấy 1 segment (room) từ macro của map. Trả về { startPos, points, events, speed, boss, phases } hoặc nil.
function storage.GetRoomSegment(mapName, roomIndex)
	if type(mapName) ~= "string" or type(roomIndex) ~= "number" then return nil end
	initStorage()
	local macro = cache[mapName]
	if not macro or type(macro.rooms) ~= "table" then return nil end

	local raw = macro.rooms[tostring(roomIndex)]
	if not isRoomSeg(raw) then return nil end

	local points = {}
	for _, p in ipairs(raw.points) do
		local vec = decodeVec(p)
		if vec then points[#points + 1] = vec end
	end
	if #points == 0 then return nil end

	local mainSeg = {
		startPos = decodeVec(raw.startPos) or points[1],
		points = points,
		events = raw.events and decodeEvents(raw.events) or nil,
		speed = tonumber(raw.speed) or 0,
		boss = raw.boss == true,
	}

	-- Decode phases nếu có (multi-phase / multi-life)
	local phases = {}
	if type(raw.phases) == "table" and #raw.phases > 0 then
		for _, rawP in ipairs(raw.phases) do
			local pSeg = decodePhaseSeg(rawP)
			if pSeg then
				pSeg.boss = raw.boss == true
				phases[#phases + 1] = pSeg
			end
		end
	end

	-- Fallback nếu file macro cũ chỉ có 1 path đơn: phase 1 chính là mainSeg
	if #phases == 0 then
		phases[1] = mainSeg
	end
	mainSeg.phases = phases

	return mainSeg
end

--// Có segment (room) trong macro của map không?
function storage.HasSegmentOrMacro(mapName, roomIndex)
	return storage.GetRoomSegment(mapName, roomIndex) ~= nil
end

--// Macro map đầy đủ (đã decode): { map, version, rooms = {[idx] = {startPos, points, events, speed, boss, phases}}, created, updated }
function storage.GetMap(mapName)
	if not storage.HasMap(mapName) then return nil end
	initStorage()
	local macro = cache[mapName]
	if not macro then return nil end

	local rooms = {}
	for key, raw in pairs(macro.rooms or {}) do
		local room = tonumber(key)
		if room and isRoomSeg(raw) then
			local seg = storage.GetRoomSegment(mapName, room)
			if seg then
				rooms[room] = seg
			end
		end
	end

	return {
		map = mapName,
		version = macro.version,
		rooms = rooms,
		created = macro.created,
		updated = macro.updated,
		mode = normalizeMode(macro.mode),
	}
end

--// Danh sách các map đã có macro (sắp theo tên).
function storage.GetMaps()
	initStorage()
	local out = {}
	for mapName, macro in pairs(cache) do
		if type(mapName) == "string" and type(macro) == "table" and macro.map == mapName and type(macro.rooms) == "table" then
			local roomCount = 0
			local bossCount = 0
			local pointCount = 0
			local phaseCount = 0
			for key, raw in pairs(macro.rooms) do
				if tonumber(key) ~= nil and isRoomSeg(raw) then
					roomCount += 1
					if raw.boss == true then bossCount += 1 end
					pointCount += #raw.points
					if type(raw.phases) == "table" and #raw.phases > 0 then
						phaseCount += #raw.phases
						for _, p in ipairs(raw.phases) do
							if p ~= raw and type(p.points) == "table" then
								pointCount += #p.points
							end
						end
					else
						phaseCount += 1
					end
				end
			end
			if roomCount > 0 then
				table.insert(out, {
					map = mapName,
					roomCount = roomCount,
					bossCount = bossCount,
					pointCount = pointCount,
					phaseCount = phaseCount,
					updated = macro.updated,
					mode = normalizeMode(macro.mode),
				})
			end
		end
	end
	table.sort(out, function(a, b)
		return a.map < b.map
	end)
	return out
end

function storage.Count()
	return #storage.GetMaps()
end

--// Lưu/ghi đè 1 segment (room) vào macro của map (hỗ trợ multi-phase / nhiều mạng).
--// phasesList (optional): danh sách các phase { { startPos, points, events, speed }, ... }
--// isBoss (optional): segment thuộc phòng boss -> đánh dấu `boss: true`.
--// Ghi trực tiếp ra file EsclipseHub/DQMacro/<mapName>.json.
function storage.SaveSegment(mapName, roomIndex, startPos, points, events, speed, isBoss, phasesList)
	if type(mapName) ~= "string" or #mapName == 0 then return false end
	if type(roomIndex) ~= "number" or roomIndex <= 0 then return false end
	if not startPos or not points or #points == 0 then return false end

	initStorage()

	local macro = cache[mapName]
	if not macro or type(macro) ~= "table" then
		macro = {
			map = mapName,
			version = CURRENT_VERSION,
			created = os.time(),
			updated = os.time(),
			mode = MODE_NORMAL,
			rooms = {},
		}
		cache[mapName] = macro
	end
	if type(macro.rooms) ~= "table" then macro.rooms = {} end

	local encoded = {}
	for _, p in ipairs(points) do
		encoded[#encoded + 1] = encodeVec(p)
	end
	local seg = {
		startPos = encodeVec(startPos) or encoded[1],
		points = encoded,
	}
	if isBoss then
		seg.boss = true
	end
	if type(speed) == "number" and speed > 0 then
		seg.speed = speed
	end

	local function encodeEventsTable(ev)
		if not ev or type(ev) ~= "table" then return nil end
		local nD = #(ev.dwells or {})
		local nS = #(ev.skills or {})
		if nD == 0 and nS == 0 then return nil end
		local encEvents = { dwells = {}, skills = {} }
		for _, d in ipairs(ev.dwells or {}) do
			encEvents.dwells[#encEvents.dwells + 1] = {
				pos = encodeVec(d.pos),
				dur = d.dur or 0,
				facing = d.facing,
			}
		end
		for _, s in ipairs(ev.skills or {}) do
			encEvents.skills[#encEvents.skills + 1] = {
				pos = encodeVec(s.pos),
				facing = s.facing,
				key = s.key,
				dw = s.dw or 0,
				dwT = s.dwT or 0,
			}
		end
		return encEvents
	end

	if events and type(events) == "table" then
		local enc = encodeEventsTable(events)
		if enc then seg.events = enc end
	end

	-- Lưu danh sách phases (nếu có nhiều phase được truyền vào)
	if type(phasesList) == "table" and #phasesList > 0 then
		local encPhases = {}
		for _, pData in ipairs(phasesList) do
			if pData and pData.points and #pData.points > 0 then
				local pEncoded = {}
				for _, pt in ipairs(pData.points) do
					pEncoded[#pEncoded + 1] = encodeVec(pt)
				end
				local pSeg = {
					startPos = encodeVec(pData.startPos) or pEncoded[1],
					points = pEncoded,
					speed = type(pData.speed) == "number" and pData.speed > 0 and pData.speed or nil,
					events = encodeEventsTable(pData.events),
				}
				encPhases[#encPhases + 1] = pSeg
			end
		end
		if #encPhases > 0 then
			seg.phases = encPhases
		end
	end

	macro.rooms[tostring(roomIndex)] = seg
	macro.version = CURRENT_VERSION
	macro.map = mapName
	macro.updated = os.time()

	-- Ghi ra file JSON riêng trong folder EsclipseHub/DQMacro/
	if hasFileSystem then
		ensureFolder()
		pcall(function()
			writefile(getFilePathForMap(mapName), HttpService:JSONEncode(macro))
		end)
	else
		local context = macLib.contextData
		if type(context) == "table" then
			if not context[LEGACY_STORAGE_KEY] then context[LEGACY_STORAGE_KEY] = {} end
			context[LEGACY_STORAGE_KEY][mapName] = macro
			autoSave.Save()
		end
	end

	fireChanged()
	return true
end

--// Mode của map (NORMAL/FULL). Chưa có macro hoặc macro cũ (không có field) -> NORMAL.
function storage.GetMapMode(mapName)
	if type(mapName) ~= "string" or #mapName == 0 then return MODE_NORMAL end
	initStorage()
	local macro = cache[mapName]
	if type(macro) ~= "table" then return MODE_NORMAL end
	return normalizeMode(macro.mode)
end

--// Lưu mode cho map (tùy map). Map chưa có macro -> tạo file placeholder (rooms rỗng,
--// không xuất hiện trong danh sách macro vì GetMaps filter roomCount > 0).
function storage.SetMapMode(mapName, mode)
	if type(mapName) ~= "string" or #mapName == 0 then return false end
	local nextMode = normalizeMode(mode)

	initStorage()

	local macro = cache[mapName]
	if not macro or type(macro) ~= "table" then
		macro = {
			map = mapName,
			version = CURRENT_VERSION,
			created = os.time(),
			updated = os.time(),
			mode = MODE_NORMAL,
			rooms = {},
		}
		cache[mapName] = macro
	end
	macro.mode = nextMode
	macro.map = mapName
	macro.updated = os.time()

	if hasFileSystem then
		ensureFolder()
		pcall(function()
			writefile(getFilePathForMap(mapName), HttpService:JSONEncode(macro))
		end)
	else
		local context = macLib.contextData
		if type(context) == "table" then
			if not context[LEGACY_STORAGE_KEY] then context[LEGACY_STORAGE_KEY] = {} end
			context[LEGACY_STORAGE_KEY][mapName] = macro
			autoSave.Save()
		end
	end

	fireChanged()
	return true
end

--// Xoá macro của 1 map (xoá file EsclipseHub/DQMacro/<mapName>.json).
function storage.RemoveMap(mapName)
	initStorage()
	if not cache[mapName] then return false end

	cache[mapName] = nil

	if hasFileSystem then
		local path = getFilePathForMap(mapName)
		pcall(function()
			if isfile(path) then
				delfile(path)
			end
		end)
	else
		local context = macLib.contextData
		if type(context) == "table" and context[LEGACY_STORAGE_KEY] then
			context[LEGACY_STORAGE_KEY][mapName] = nil
			autoSave.Save()
		end
	end

	fireChanged()
	return true
end

--// Xoá toàn bộ macro (xoá tất cả file trong EsclipseHub/DQMacro/).
function storage.ClearAll()
	initStorage()
	if next(cache) == nil then return end

	local macroDir = getMacroDir()
	if hasFileSystem and isfolder(macroDir) and listfiles then
		pcall(function()
			local files = listfiles(macroDir)
			if type(files) == "table" then
				for _, f in ipairs(files) do
					if type(f) == "string" and string.lower(string.sub(f, -5)) == ".json" and isfile(f) then
						delfile(f)
					end
				end
			end
		end)
	end

	table.clear(cache)

	local context = macLib.contextData
	if type(context) == "table" and context[LEGACY_STORAGE_KEY] then
		context[LEGACY_STORAGE_KEY] = nil
		autoSave.Save()
	end

	fireChanged()
end

--// Quét lại toàn bộ file từ disk (dùng khi người dùng vừa copy file JSON mới vào EsclipseHub/DQMacro/)
function storage.ReloadFromDisk()
	table.clear(cache)
	isInitialized = false
	initStorage()
	fireChanged()
end

--// Alias tương thích
function storage.ReloadFromConfig()
	storage.ReloadFromDisk()
end

return storage end function __DIST.aa()-- Path Record System – Recorder: ghi 1 SESSION liên tục cho toàn map.
--   - Bấm Record 1 lần ở map = ghi NHIỀU room: khi CHUYỂN ROOM tự "rollover"
--     (lưu segment room cũ + mở slice mới cho room mới tại vị trí cạnh cửa).
--   - TỰ TẮT + lưu khi về LOBBY (hết map), vào BOSS (mode NORMAL), hoặc giới hạn điểm.
--   - Mode FULL của map: cho phép record qua luôn BOSS room (segment đánh dấu `boss: true`).
--   - Mỗi slice gộp vào macro của MAP (mỗi room 1 segment; ghi lại room nào thì ghi
--     đè segment cũ của room đó). Macro = toàn bộ room đã record của map.

--// Imports

local services = __DIST.load('e')
local shared = __DIST.load('f')
local storage = __DIST.load('_')
local notifier = __DIST.load('c')

local RunService = services.RunService
local player = services.player
local UserInputService = services.UserInputService

--// Constants
local MIN_SPACING = 0.1 -- Studs tối thiểu giữa 2 điểm khi ghi (bắt siêu mịn để khớp tuyệt đối vị trí)
local MAX_POINTS = 8000 -- Giới hạn điểm 1 segment
local SIMPLIFY_TOL = 0.4 -- Studs: dung sai làm mịn Douglas-Peucker khi lưu (độ chính xác cao)
local DWELL_MIN = 0.25 -- Giây đứng yên tối thiểu mới ghi event "dừng" (bắt cả nhấp nhả ngắn)
local MOVING_EPS = 0.15 -- Studs/frame: coi là đang di chuyển nếu vượt ngưỡng này
local ROLLOVER_DELAY = 1.0 -- Giây trễ khi phát hiện đổi room: ghi nốt đoạn đi qua cửa rồi mới rollover
local RUN_END_TIMEOUT = 6.0 -- Giây chờ room mới sau khi boss chết / teleport; hết mà chưa có room -> hết map, dừng record

--// Table
local recorder = {}

--// Settings
local captureDwells = true
local captureSkills = true

function recorder.SetCapture(state)
	state = state and true or false
	captureDwells = state
	captureSkills = state
end

function recorder.IsCaptureEnabled()
	return captureDwells or captureSkills
end

--// State
local isRecording = false
local recMap = nil
local startRoom = 0 --// Room của SLICE đang ghi (đổi room -> rollover sang slice mới)
local startPos = nil
local points = {}
local captureConnection = nil
local inputConnection = nil
local roomChangeConnection = nil
local lobbyConnection = nil
local bossConnection = nil
local respawnConnection = nil

--// Timeline events (dwells + skills) của segment đang record.
local recStartT = 0
local dwells = {}
local skills = {}
local currentDwell = nil
local currentDwellStartRel = 0
local stationarySince = nil
local standingAnchor = nil
local standingFacing = nil
local prevFramePos = nil
local roomChangePending = false
--// Tốc độ di chuyển trung bình trong lúc record (để playback ép đúng tốc độ -> khớp thời gian).
local movedDist = 0
local movingTime = 0
local lastFrameT = nil

--// Mode FULL của map: cho phép ghi qua boss room.
local allowBoss = false
--// Slice hiện tại có phải phòng boss không (đánh dấu segment khi lưu).
local sliceIsBoss = false
--// Slice đang-active hay đã "mồ côi" (finalize xong, chờ room mới / hết map).
--// Deactivated: finalizeSlice bỏ qua (không ghi đè room vừa lưu).
local sliceActive = false
--// Danh sách các phase đã hoàn thành trong room hiện tại (chết -> chốt phase cũ, mở phase mới)
local roomPhases = {}
--// Thống kê TOÀN SESSION đã rollover: số slice đã lưu + boss + tổng điểm gốc (dùng cho notify gộp).
local sessionRooms = 0
local sessionBossRooms = 0
local sessionRawPts = 0

--// Listeners
local statusListeners = {}

local function fireStatus()
	local info = {
		recording = isRecording,
		map = recMap,
		room = startRoom,
		pointCount = #points,
		phaseCount = #roomPhases + 1,
		dwellCount = #dwells,
		skillCount = #skills,
		savedRooms = sessionRooms,
	}
	for _, cb in ipairs(statusListeners) do
		pcall(cb, info)
	end
end

local function getPlayerRoot()
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if root and root.Parent then return root end
	return nil
end

--// Facing ngang hiện tại của nhân vật dạng {X,Z}.
local function getFacing()
	local root = getPlayerRoot()
	if not root then return nil end
	local look = root.CFrame.LookVector
	if look.Magnitude < 0.001 then return nil end
	return { X = look.X / look.Magnitude, Z = look.Z / look.Magnitude }
end

local function stopSubscriptions()
	if captureConnection then captureConnection:Disconnect(); captureConnection = nil end
	if inputConnection then inputConnection:Disconnect(); inputConnection = nil end
	if roomChangeConnection then roomChangeConnection(); roomChangeConnection = nil end
	if lobbyConnection then lobbyConnection(); lobbyConnection = nil end
	if bossConnection then bossConnection(); bossConnection = nil end
	if respawnConnection then respawnConnection(); respawnConnection = nil end
end

--// Bắt đầu 1 SLICE (room) mới của session: reset points + timeline tại vị trí hiện tại.
--// Gọi khi rollover sang room khác.
local function beginSlice(room, pos)
	startRoom = room
	startPos = pos
	sliceActive = true
	points = { pos }
	dwells = {}
	skills = {}
	currentDwell = nil
	currentDwellStartRel = 0
	stationarySince = nil
	standingAnchor = nil
	standingFacing = nil
	prevFramePos = pos
	movedDist = 0
	movingTime = 0
	recStartT = os.clock()
	lastFrameT = os.clock()
	roomChangePending = false
	sliceIsBoss = shared.IsBossActive()
	roomPhases = {}
end

--// Chốt phase hiện tại (do chết / hồi sinh) và mở phase tiếp theo từ điểm hồi sinh mới.
local function sealCurrentPhaseAndStartNext(newRespawnPos)
	if not sliceActive then return false end
	local clean = storage.SimplifyPath(points, SIMPLIFY_TOL)
	if #clean >= 2 then
		local events
		if #dwells > 0 or #skills > 0 then
			events = { dwells = dwells, skills = skills }
		end
		local avgSpeed = 0
		if movingTime > 0.5 and movedDist > 5 then
			avgSpeed = math.clamp(movedDist / movingTime, 5, 100)
		end
		table.insert(roomPhases, {
			startPos = startPos,
			points = clean,
			events = events,
			speed = avgSpeed,
		})
		sessionRawPts += #points
	end

	-- Khởi tạo phase tiếp theo từ vị trí hồi sinh mới
	startPos = newRespawnPos
	points = { newRespawnPos }
	dwells = {}
	skills = {}
	currentDwell = nil
	currentDwellStartRel = 0
	stationarySince = nil
	standingAnchor = nil
	standingFacing = nil
	prevFramePos = newRespawnPos
	movedDist = 0
	movingTime = 0
	recStartT = os.clock()
	lastFrameT = os.clock()
	roomChangePending = false
	fireStatus()
	return true
end

--// Chốt slice hiện tại: gói timeline + tốc độ + làm mịn + ghi ĐÈ segment của room này
--// vào macro (hỗ trợ multi-phase). Mặc định silent (rollover không spam notify).
local function finalizeSlice(reason, silent)
	if not sliceActive then return nil end
	local clean = storage.SimplifyPath(points, SIMPLIFY_TOL)
	if #clean >= 2 then
		local events
		if #dwells > 0 or #skills > 0 then
			events = { dwells = dwells, skills = skills }
		end
		local avgSpeed = 0
		if movingTime > 0.5 and movedDist > 5 then
			avgSpeed = math.clamp(movedDist / movingTime, 5, 100)
		end
		table.insert(roomPhases, {
			startPos = startPos,
			points = clean,
			events = events,
			speed = avgSpeed,
		})
		sessionRawPts += #points
	end

	if #roomPhases == 0 then return nil end

	local phase1 = roomPhases[1]
	local saved = storage.SaveSegment(
		recMap,
		startRoom,
		phase1.startPos,
		phase1.points,
		phase1.events,
		phase1.speed,
		sliceIsBoss,
		roomPhases
	)
	if not saved then return nil end

	sessionRooms += 1
	if sliceIsBoss then sessionBossRooms += 1 end

	if not silent then
		local extra = ""
		if #roomPhases > 1 then
			extra = (" (%d phases/mạng hồi sinh, %d điểm phase 1)"):format(#roomPhases, #phase1.points)
		elseif phase1.events then
			extra = (" (%d điểm mịn, %d skill, %d nhịp dừng, %.1fspd)"):format(#phase1.points, #(phase1.events.skills or {}), #(phase1.events.dwells or {}), phase1.speed or 0)
		else
			extra = (" (%d điểm mịn, %.1fspd)"):format(#phase1.points, phase1.speed or 0)
		end
		notifier.Notify("Path Record", ("Đã lưu room %d%s vào map [%s] %s"):format(startRoom, extra, recMap, reason and ("- " .. reason) or ""), 3)
	end

	return { phaseCount = #roomPhases, phase1 = phase1 }
end

function recorder.IsRecording()
	return isRecording
end

function recorder.GetStartRoom()
	return startRoom
end

function recorder.GetCurrentPhaseIndex()
	return #roomPhases + 1
end

--// Điểm đang ghi (cho visual / status).
function recorder.GetCurrentPoints()
	return points
end

function recorder.GetStatus()
	return {
		recording = isRecording,
		map = recMap,
		room = startRoom,
		pointCount = #points,
		phaseCount = #roomPhases + 1,
		savedRooms = sessionRooms,
	}
end

function recorder.OnStatusChanged(callback)
	if type(callback) == "function" then
		table.insert(statusListeners, callback)
	end
end

--// Bắt đầu record 1 session (1 map, tự rollover theo room). Trả về ok, err.
function recorder.Start()
	if isRecording then return false, "đang record rồi" end

	local root = getPlayerRoot()
	if not root then return false, "chưa có nhân vật" end
	if shared.IsDead() then return false, "nhân vật đang chết" end

	local room = shared.GetCurrentRoomIndex()
	if room <= 0 then return false, "không nằm trong dungeon" end

	local map = shared.GetCurrentDungeonName()
	if not map or #map == 0 then return false, "không xác định được map" end

	allowBoss = storage.GetMapMode(map) == "full"
	if shared.IsBossActive() and not allowBoss then return false, "boss room (dùng Hazard Scanner)" end

	recMap = map
	beginSlice(room, root.Position)
	isRecording = true
	sessionRooms = 0
	sessionBossRooms = 0
	sessionRawPts = 0

	--// Sample vị trí nhân vật + phát hiện đứng yên (dwell) để ghép timeline.
	--// (Luôn sample kể cả khi boss active: mode FULL record luôn cả phòng boss.)
	captureConnection = RunService.Heartbeat:Connect(function()
		if not isRecording then return end
		if shared.IsDead() then
			stationarySince = nil
			currentDwell = nil
			prevFramePos = nil
			return
		end

		local target = getPlayerRoot()
		if not target then return end
		local pos = target.Position

		--// Nhảy vọt vị trí bất thường (teleport / hết run, respawn KHÔNG có CharacterAdded):
		--// LƯU slice hiện tại TRƯỚC (không vứt — trước đây vứt làm mất đoạn đánh boss cuối
		--// khi kết thúc run), rồi cmt lại từ vị trí mới, không nối thẳng sang vị trí mới.
		local lastPt = points[#points]
		if lastPt and (pos - lastPt).Magnitude > 35 then
			finalizeSlice("dịch chuyển lớn", true)
			local r = shared.GetCurrentRoomIndex()
			if r == startRoom then r = 0 end -- deactivate nếu room cũ chưa untrack (không ghi đè)
			beginSlice(r, pos)
			fireStatus()
			--// Room không xác định -> có thể hết map: chờ room mới, không có thì tự dừng.
			task.spawn(function()
				task.wait(RUN_END_TIMEOUT)
				if isRecording and startRoom <= 0 then
					recorder.Stop("hết map")
				end
			end)
			return
		end

		--// Ước lượng tốc độ di chuyển: cộng dồn quãng đường + thời gian đang đi (luôn chạy).
		local now = os.clock()
		local moved = prevFramePos and (pos - prevFramePos).Magnitude or 0
		prevFramePos = pos
		local dt = lastFrameT and math.max(0, now - lastFrameT) or 0
		lastFrameT = now
		if moved >= MOVING_EPS then
			movedDist += moved
			movingTime += dt
		end

		--// Dwell detection: đứng yên liên tục -> gộp thành event "dừng" (vị trí+thời gian+facing).
		if captureDwells then
			if moved < MOVING_EPS then
				if not stationarySince then
					stationarySince = now
					standingAnchor = pos
					standingFacing = getFacing()
				end
				if currentDwell then
					currentDwell.dur = now - stationarySince
					currentDwell.facing = getFacing() or standingFacing
				elseif now - stationarySince >= DWELL_MIN then
					currentDwellStartRel = stationarySince - recStartT
					currentDwell = {
						pos = standingAnchor,
						dur = now - stationarySince,
						facing = standingFacing,
						index = #dwells + 1,
					}
					table.insert(dwells, currentDwell)
				end
			else
				stationarySince = nil
				currentDwell = nil
			end
		end

		local last = points[#points]
		if last and (pos - last).Magnitude < MIN_SPACING then return end
		if #points >= MAX_POINTS then
			recorder.Stop("đạt giới hạn điểm")
			return
		end
		table.insert(points, pos)
	end)

	--// Capture skill: chuột phải hoặc phím Q / E (kèm vị trí + facing + thời gian trong dwell).
	--// Ghi rõ `key` (M2 / Q / E) để player tái hiện đúng nút. Bỏ qua gameProcessed cho Q/E
	--// vì game xử lý phím này (skill) cũng là thao tác cần ghi lại.
	if captureSkills then
		inputConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
			if not isRecording or not captureSkills then return end
			if UserInputService:GetFocusedTextBox() then return end
			if shared.IsDead() then return end

			local skillKey
			if input.UserInputType == Enum.UserInputType.MouseButton2 then
				if gameProcessed then return end
				skillKey = "M2"
			elseif input.UserInputType == Enum.UserInputType.Keyboard
				and (input.KeyCode == Enum.KeyCode.Q or input.KeyCode == Enum.KeyCode.E) then
				skillKey = input.KeyCode == Enum.KeyCode.Q and "Q" or "E"
			else
				return
			end

			local target = getPlayerRoot()
			if not target then return end

			local ev = {
				pos = target.Position,
				facing = getFacing(),
				key = skillKey,
				dw = 0,
				dwT = 0,
			}
			if currentDwell then
				ev.dw = currentDwell.index
				ev.dwT = math.max(0, (os.clock() - recStartT) - currentDwellStartRel)
			end
			table.insert(skills, ev)
		end)
	end

	--// ĐỔI ROOM giữa session: TRỄ 1 GIÂY ghi nốt đoạn đi qua cửa rồi ROLLOVER
	--// (lưu slice room cũ + mở slice mới cho room hiện tại) -> record 1 lần cả map.
	--// roomChangePending chống stack nhiều lần đổi room trong khoảng chờ.
	--// Lazy-bind: khi slice mới đang mở ở room 0 (khe giữa 2 room / boss chưa bind
	--// room do rollover chạy trước khi enemy phòng mới spawn), room resolve về >0
	--// thì bind NGAY về room thật -> boss chết lưu đúng room thay vì lưu room 0 (mất đoạn).
	roomChangeConnection = shared.OnRoomIndexChanged(function()
		if isRecording then
			local current = shared.GetCurrentRoomIndex()
			if sliceActive and startRoom <= 0 and current > 0 then
				startRoom = current
				return
			end
			if current ~= startRoom and not roomChangePending then
				roomChangePending = true
				task.delay(ROLLOVER_DELAY, function()
					roomChangePending = false
					if isRecording then
						recorder.Rollover()
					end
				end)
			end
		end
	end)

	--// Vào boss: mode NORMAL -> tắt + lưu segment đã ghi; mode FULL -> đánh dấu
	--// slice là phòng boss (heartbeat vẫn sample để record đường né).
	--// Boss chết (active=false) khi đang record phòng boss (FULL): chốt slice NGAY tại đó
	--// (không phụ thuộc teleport/đổi room — trước đây bị teleport hết run xóa mất đoạn
	--// đánh boss cuối), rồi tạm "mồ côi" (deactivate) chờ room mới.
	--// Không mở được room mới trong RUN_END_TIMEOUT -> tự dừng (hết map / hết run).
	bossConnection = shared.OnBossActiveChanged(function(active)
		if not isRecording then return end
		if active then
			if allowBoss then
				sliceIsBoss = true
			else
				recorder.Stop("vào boss room")
			end
			return
		end

		if allowBoss and sliceIsBoss then
			finalizeSlice("xong boss", true)
			sliceIsBoss = false
			sliceActive = false
			task.spawn(function()
				task.wait(RUN_END_TIMEOUT)
				if isRecording and not sliceActive then
					recorder.Stop("hết map")
				end
			end)
		end
	end)

	--// Về lobby -> hết map -> tắt + lưu.
	lobbyConnection = shared.OnLobbyChanged(function(inLobby)
		if isRecording and inLobby then
			recorder.Stop("về lobby")
		end
	end)

	--// Bắt sự kiện hồi sinh khi đang record: chốt Phase của mạng trước và mở Phase tiếp theo từ điểm hồi sinh mới.
	--// Người chơi không bị mất tiến trình đã đi; khi replay, bot sẽ đi lần lượt từng Phase tương ứng mỗi lần chết.
	respawnConnection = shared.OnRespawn(function()
		if not isRecording then return end
		task.delay(0.2, function()
			if not isRecording or shared.IsDead() then return end
			local target = getPlayerRoot()
			if not target then return end
			if sealCurrentPhaseAndStartNext(target.Position) then
				local curP = #roomPhases + 1
				notifier.Notify(
					"Path Record",
					("Hồi sinh: Đã lưu Phase %d, đang ghi tiếp Phase %d cho room %d"):format(curP - 1, curP, startRoom),
					3
				)
			end
		end)
	end)

	notifier.Notify("Path Record", ("Bắt đầu record room %d (%s)"):format(room, map), 2)
	fireStatus()
	return true
end

--// Rollover khi đổi room (đang record session liên tục): chốt slice room cũ (silent)
--// + mở slice mới ngay tại vị trí hiện tại. Session vẫn tiếp tục.
function recorder.Rollover()
	if not isRecording then return false end
	finalizeSlice("chuyển room", true)
	local root = getPlayerRoot()
	local pos = root and root.Position or startPos
	beginSlice(shared.GetCurrentRoomIndex(), pos)
	fireStatus()
	return true
end

--// Dừng session + chốt nốt slice hiện tại, gộp toàn bộ slice đã rollover vào macro.
function recorder.Stop(reason)
	if not isRecording then return false end

	isRecording = false
	stopSubscriptions()

	local slice = finalizeSlice(reason, true)
	if slice then
		if sessionRooms > 1 then
			--// Record liên tục nhiều room: báo tổng hợp 1 lần.
			local bossPart = sessionBossRooms > 0 and (" | %d boss"):format(sessionBossRooms) or ""
			notifier.Notify("Path Record", ("Đã lưu map [%s] %s: %d room%s (%d điểm gốc)"):format(recMap, reason or "xong", sessionRooms, bossPart, sessionRawPts), 4)
		else
			local extra = ""
			if slice.events then
				extra = (" (%d skill, %d nhịp dừng, %.1fspd)"):format(slice.skills, slice.dwells, slice.avgSpeed)
			else
				extra = (" (%.1fspd)"):format(slice.avgSpeed)
			end
			local bossTag = startRoom > 0 and (sliceIsBoss and " (boss)" or "") or ""
			notifier.Notify("Path Record", ("Đã lưu room %d%s%s vào map [%s] %s"):format(startRoom, extra, bossTag, recMap, reason and ("- " .. reason) or ""), 3)
		end
	elseif sessionRooms > 0 then
		--// Slice cuối bị "mồ côi" (room 0: kết thúc run tại boss hoặc teleport hết map):
		--// các room trước đã lưu xong, vẫn báo tổng hợp để người dùng biết đã lưu.
		local bossPart = sessionBossRooms > 0 and (" | %d boss"):format(sessionBossRooms) or ""
		notifier.Notify("Path Record", ("Đã lưu map [%s] %s: %d room%s (%d điểm gốc)"):format(recMap, reason or "xong", sessionRooms, bossPart, sessionRawPts), 4)
	end

	recMap = nil
	startRoom = 0
	startPos = nil
	points = {}
	dwells = {}
	skills = {}
	currentDwell = nil
	currentDwellStartRel = 0
	stationarySince = nil
	standingAnchor = nil
	standingFacing = nil
	prevFramePos = nil
	roomChangePending = false
	movedDist = 0
	movingTime = 0
	lastFrameT = nil
	sliceIsBoss = false
	sliceActive = false
	allowBoss = false
	sessionRooms = 0
	sessionBossRooms = 0
	sessionRawPts = 0
	fireStatus()
	return slice ~= nil
end

--// Huỷ record KHÔNG lưu (shutdown / discard).
function recorder.Cancel()
	if not isRecording then return end

	stopSubscriptions()
	recMap = nil
	startRoom = 0
	startPos = nil
	points = {}
	dwells = {}
	skills = {}
	currentDwell = nil
	currentDwellStartRel = 0
	stationarySince = nil
	standingAnchor = nil
	standingFacing = nil
	prevFramePos = nil
	roomChangePending = false
	movedDist = 0
	movingTime = 0
	lastFrameT = nil
	sliceIsBoss = false
	sliceActive = false
	allowBoss = false
	sessionRooms = 0
	sessionBossRooms = 0
	sessionRawPts = 0
	isRecording = false
	fireStatus()
end

return recorder end function __DIST.ab()-- Path Record System – Player: chạy MACRO của 1 map (toàn bộ room đã record) ĐÚNG 1 LẦN.
--   - Đi qua từng room có segment trong macro; mỗi room đi hết 1 lượt rồi
--     ĐỨNG YÊN chờ đổi room (không đi qua lại trong room).
--   - BOSS room:
--       * Mode NORMAL: KHÔNG đi (ngẫu nhiên, dùng Hazard Scanner) -> đứng yên chờ. Nếu
--         hệ thống khác (HazardScanner/AutoFarm) chiếm quyền -> PauseForExclusive:
--         nhường + tự resume khi sang room quái thường có segment.
--       * Mode FULL (map tùy chỉnh): ĐI theo path đã record qua cả boss room; giữ
--         độc quyền và KHÔNG đứng yên ở boss.
--   - Room chưa có segment trong macro -> đứng yên chờ đổi room.
--   - Hết map (lobby) -> dừng hẳn playback (đi 1 lần, không tự phát lại).

--// Imports

local services = __DIST.load('e')
local shared = __DIST.load('f')
local storage = __DIST.load('_')
local notifier = __DIST.load('c')
local selector = __DIST.load('w')
local movement = __DIST.load('y')

local player = services.player
local VirtualInputManager = services.VirtualInputManager
local UserInputService = services.UserInputService

--// Constants
local SIMPLIFY_TOL = 0.4 -- Studs: làm mịn quỹ đạo khi load (độ chính xác cao, bám sát từng centimet)
local ARRIVE_DIST = 0.5 -- Studs: ngưỡng coi là đã tới đích cuối (chuẩn xác từng node)
local START_REPOSITION_TIMEOUT = 8.0 -- Giây tối đa đi về node đầu trước khi phát
local LOOKAHEAD_MIN = 2.0 -- Studs: lookahead tối thiểu tại góc cua gắt (chống cắt góc/rơi vực)
local LOOKAHEAD_MAX = 4.5 -- Studs: lookahead tối đa trên đường thẳng (bám sát lòng đường tuyệt đối)
local PRE_AIM_DIST = 1.5 -- Studs: khoảng cách bắt đầu xoay mặt đón đầu trước khi chạm mốc xả skill
local PROJECT_BACK = 8.0 -- Studs: hình chiếu chỉ tìm trong cửa sổ quanh progress (chống nhảy nhánh giao)
local PROJECT_FRONT = 14.0 -- Studs: >= LOOKAHEAD_MAX + margin; nhánh giao/đường vòng nằm ngoài -> không bao giờ bị bắt hụt
local STUCK_TIMEOUT = 8.0 -- Giây không nhúc nhích -> nghi bị kẹt
local STUCK_BUMP = 2.0 -- Studs: nhảy tới trước khi nghi kẹt
local SKILL_FACE_HOLD_MIN = 0.5 -- Giây tối thiểu giữ facing sau khi xả skill
local SKILL_FACE_HOLD_MAX = 2.0 -- Giây tối đa giữ facing sau khi xả skill
local DOUBLE_CLICK_DELAY_MIN = 0.001 -- Giây tối thiểu giữa 2 lần click
local DOUBLE_CLICK_DELAY_MAX = 0.1 -- Giây tối đa giữa 2 lần click

--// Table
local mover = {}

--// Settings: tái hiện timeline record (dừng + skill + xoay mặt).
local replayPauses = true
local replaySkills = true
local replayFacing = true
local skillFaceHold = 0.6 -- Giây giữ facing sau khi xả skill khi đang đi (mặc định 0.6s)
local doubleClickDelay = 0.005 -- Giây khoảng nghỉ giữa 2 lần click (mặc định 0.005s)

function mover.SetSkillFaceHold(seconds)
	if type(seconds) == "number" then
		skillFaceHold = math.clamp(seconds, SKILL_FACE_HOLD_MIN, SKILL_FACE_HOLD_MAX)
	end
end

function mover.GetSkillFaceHold()
	return skillFaceHold
end

function mover.SetDoubleClickDelay(seconds)
	if type(seconds) == "number" then
		doubleClickDelay = math.clamp(seconds, DOUBLE_CLICK_DELAY_MIN, DOUBLE_CLICK_DELAY_MAX)
	end
end

function mover.GetDoubleClickDelay()
	return doubleClickDelay
end

function mover.SetReplayTimeline(state)
	state = state and true or false
	replayPauses = state
	replaySkills = state
	replayFacing = state
end

function mover.IsReplayTimelineEnabled()
	return replayPauses
end

--// Settings: ép tốc chạy = tốc độ record để VỊ TRÍ và THỜI GIAN khớp nhau
--// (nhân vật tới điểm bắn skill/dừng đúng lúc như người chơi đã làm)
--// hoặc ép theo tốc độ Fast Speed ở tab Combat/Player.
local matchRecordSpeed = true
local useFastSpeed = false
local appliedSpeed = nil
local restoreSpeed = nil

function mover.SetSpeedMatch(state)
	matchRecordSpeed = state and true or false
end

function mover.IsSpeedMatchEnabled()
	return matchRecordSpeed
end

function mover.SetUseFastSpeed(state)
	useFastSpeed = state and true or false
end

function mover.IsUseFastSpeedEnabled()
	return useFastSpeed
end

--// Ép WalkSpeed theo tốc độ đã ghi của segment hoặc Fast Speed; nhớ giá trị gốc để khôi phục.
local function applyPlaybackSpeed(segmentSpeed)
	local targetSpeed = nil
	if useFastSpeed then
		local fs = shared.GetFastSpeed()
		if type(fs) == "number" and fs > 0 then
			targetSpeed = fs
		end
	elseif matchRecordSpeed then
		if type(segmentSpeed) == "number" and segmentSpeed > 0 then
			targetSpeed = segmentSpeed
		end
	end

	if not targetSpeed or targetSpeed <= 0 then return end
	local hum = shared.GetHumanoid()
	if not hum then return end
	if appliedSpeed == nil then restoreSpeed = hum.WalkSpeed end
	appliedSpeed = targetSpeed
	if hum.WalkSpeed ~= targetSpeed then hum.WalkSpeed = targetSpeed end
end

local function restorePlaybackSpeed()
	if appliedSpeed == nil then return end
	local hum = shared.GetHumanoid()
	if restoreSpeed and hum and hum.WalkSpeed ~= restoreSpeed then
		hum.WalkSpeed = restoreSpeed
	end
	appliedSpeed = nil
	restoreSpeed = nil
end

--// State
local isPlaying = false
local resumeWanted = false -- Bật cờ "tự resume" khi room có segment xuất hiện
local activeMap = nil -- Map đang playback
local playFullMap = false -- Mode FULL của map: đi qua cả boss room theo path đã ghi
local playThread = nil
local currentPhaseIndex = 1
local statusListeners = {}

local function fireStatus(reason)
	local info = {
		playing = isPlaying,
		map = activeMap,
		room = shared.GetCurrentRoomIndex(),
		boss = shared.IsBossActive(),
		phase = currentPhaseIndex,
		resume = resumeWanted,
		reason = reason,
	}
	for _, cb in ipairs(statusListeners) do
		pcall(cb, info)
	end
end

function mover.GetCurrentPhaseIndex()
	return currentPhaseIndex
end

local function getPlayerRoot()
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if root and root.Parent then return root end
	return nil
end

local function getSafePosition(part)
	if not part or not part.Parent then return nil end
	local ok, pos = pcall(function()
		return part.Position
	end)
	if not ok or not pos then return nil end
	return pos
end

local function flatDistance(a, b)
	local dx = a.X - b.X
	local dz = a.Z - b.Z
	return math.sqrt(dx * dx + dz * dz)
end

--// Dừng hẳn nhân vật (khi tắt phát / nhường quyền).
local function cancelMove(humanoid)
	local root = getPlayerRoot()
	if root and humanoid then
		local pos = getSafePosition(root)
		if pos then pcall(function() humanoid:MoveTo(pos) end) end
	end
end

--// Mô phỏng kích hoạt skill ThĐÚNG nút như lúc record:
--//   - "Q"/"E": VirtualInputManager:SendKeyEvent
--//   - "M2" (hoặc nil = macro cũ): chuột phải như trước.
--// Double-cast không đồng bộ (task.spawn) để hoàn toàn KHÔNG chặn luồng di chuyển, chống khựng bước.
local function fireSkill(skillKey)
	local hold = shared.GetKeyHoldTime() or 0.05
	local delayTime = doubleClickDelay
	local mouse = UserInputService:GetMouseLocation()
	task.spawn(function()
		pcall(function()
			local function send(down)
				if skillKey == "Q" or skillKey == "E" then
					local code = skillKey == "Q" and Enum.KeyCode.Q or Enum.KeyCode.E
					VirtualInputManager:SendKeyEvent(down, code, false, game)
				else
					VirtualInputManager:SendMouseButtonEvent(mouse.X, mouse.Y, 1, down, game, false)
				end
			end

			-- Lần bấm 1
			send(true)
			task.wait(hold)
			send(false)

			-- Khoảng nghỉ trước lần bấm 2 (tùy chỉnh qua slider)
			if delayTime > 0 then
				task.wait(delayTime)
			end

			-- Lần bấm 2 (double-tap đảm bảo ăn skill nếu lệch CD tích tắc)
			send(true)
			task.wait(hold)
			send(false)
		end)
	end)
end

--// Xoay nhân vật theo hướng record (tắt AutoRotate để giữ mặt cố định).
local function setFacing(root, faceLook)
	if not root or not root.Parent then return end
	local hum = shared.GetHumanoid()
	if hum then hum.AutoRotate = false end
	local look = faceLook or Vector3.new(1, 0, 0)
	if look.Magnitude < 0.1 then look = Vector3.new(1, 0, 0) end
	look = Vector3.new(look.X, 0, look.Z).Unit
	pcall(function()
		local p = root.Position
		root.CFrame = CFrame.lookAt(p, p + look)
	end)
end

local function restoreAutoRotate()
	local hum = shared.GetHumanoid()
	if hum then hum.AutoRotate = true end
end

--// Đánh bóng: dẫn đường bằng Pathfinding (tái sử dụng pha CHASE của AutoFarm) để
--// tiếp cận node đầu của segment thay vì MoveTo thẳng (kẹt tường/cầu thang/mương).
--//  - Tìm path: thử params chuẩn -> relaxed (nhỏ hơn, leo dốc cao hơn).
--//  - Bám waypoint: tới gần cách <= 3.5 stud -> nhảy waypoint tiếp theo.
--//  - Blocking checker: MoveTo thẳng đích kẹt tường/mương -> lùi chọn node waypoint
--//    còn nhìn thấy; hết sạch -> repath.
--//  - Kẹt (vận tốc thấp): tự nhảy + repath sau 1.5s.
--// Trả về true khi tới node đầu; false + lý do khi bị ngắt giữa chừng.
local function chaseToStart(humanoid, root, room, allowBoss, target, deadline)
	local ignoreList = { player.Character }
	local pathInstance = nil
	local waypoints = {}
	local waypointIdx = 1
	local stuckTimer = 0
	local lastJumpTime = 0

	while isPlaying do
		if not root or not root.Parent then restoreAutoRotate(); return false, "no_root" end
		if shared.IsDead() then restoreAutoRotate(); return false, "dead" end
		if shared.GetCurrentRoomIndex() ~= room then restoreAutoRotate(); return false, "room_changed" end
		if shared.IsBossActive() and not allowBoss then restoreAutoRotate(); return false, "boss" end

		local pos = getSafePosition(root)
		if not pos then
			task.wait(0.08)
			continue
		end

		--// Tới node đầu -> xong.
		if flatDistance(pos, target) <= ARRIVE_DIST then break end
		if os.clock() >= deadline then break end

		--// Nếu chưa có path hoặc bị BLOCKED/REPATHING -> tìm lại đường.
		if not pathInstance or #waypoints == 0 then
			if pathInstance then pcall(function() pathInstance:Destroy() end) end
			pathInstance, waypoints = nil, {}
			local p, wps = selector.ComputePathWithCost(pos, target)
			if p and wps and #wps > 0 then
				pathInstance = p
				waypoints = wps
				waypointIdx = 1
				stuckTimer = 0
			else
				--// Không tìm thấy đường (navmesh thiếu) -> nhảy thẳng về đích,
				--// chờ repath khi gần hoặc kẹt.
				pcall(function() humanoid:MoveTo(target) end)
				task.wait(0.1)
				continue
			end
		end

		--// Bám waypoint: đã tới cách <= 3.5 stud -> tăng chỉ số.
		local wp = waypoints[waypointIdx]
		if wp and flatDistance(pos, wp.Position) <= 3.5 then
			waypointIdx = math.min(#waypoints + 1, waypointIdx + 1)
		end

		--// Blocking checker (giống AutoFarm CHASE): MoveTo thẳng trúng vật cản thì
		--// lùi chọn node waypoint còn "nhìn thấy"; hết sạch -> repath frame sau.
		local chosenDest, mode = movement.ResolveDestination(pos, target, waypoints, waypointIdx, ignoreList)
		if mode == "Blocked" or not chosenDest then
			if pathInstance then pcall(function() pathInstance:Destroy() end) end
			pathInstance, waypoints = nil, {}
			pcall(function() humanoid:MoveTo(pos) end)
			task.wait(0.1)
			continue
		end

		--// Di chuyển + nhảy nếu vượt chướng ngại cao / waypoint yêu cầu Jump.
		movement.ExecuteMove(humanoid, pos, chosenDest, waypoints, waypointIdx)

		--// Kẹt bằng vận tốc: vận tốc ngang thấp -> nhảy (chống vướng chân),
		--// kẹt lâu 1.5s -> repath.
		local distToDest = (chosenDest - pos).Magnitude
		if distToDest >= 1.5 then
			local vel = root.AssemblyLinearVelocity or root.Velocity
			local speed = vel and Vector3.new(vel.X, 0, vel.Z).Magnitude or 0
			local now = os.clock()
			if speed < 10 then
				stuckTimer += 0.1
				if (now - lastJumpTime) >= 0.4 then
					pcall(function() humanoid.Jump = true end)
					lastJumpTime = now
				end
				if stuckTimer >= 1.5 then
					if pathInstance then pcall(function() pathInstance:Destroy() end) end
					pathInstance, waypoints = nil, {}
					stuckTimer = 0
				end
			else
				stuckTimer = 0
			end
		else
			stuckTimer = 0
		end

		task.wait(0.1)
	end

	if pathInstance then pcall(function() pathInstance:Destroy() end) end
	pathInstance = nil
	if not isPlaying then return false, "stopped" end
	return true
end

--// Đi liên tục toàn bộ quỹ đạo 1 segment — KHÔNG bao giờ dừng giữa chừng.
--// allowBoss (true khi mode FULL): bỏ check boss -> đi theo path đã record qua boss room.
--// Cách hoạt động (bám quỹ đạo + projection + lookahead):
--//   1. Làm mịn đường (Douglas-Peucker) khi load: macro cũ ghi dày 0.3 stud + wiggle
--//      sẽ bị "kéo thẳng" thành đường chính, tránh việc dừng gật gù từng phần.
--//   2. Quy đổi sang tổng chiều dài cung; progress = hình chiếu GẦN NHẤT của nhân
--//      vật lên đường -> LUÔN dính theo vị trí (không lỡ đỉnh khi cắt góc).
--//   3. Đích = điểm cách LOOKAHEAD studs phía trước trên đường -> humanoid không
--//      bao giờ "tới đích" để giảm tốc/dừng, chạy liền mạch theo quỹ đạo.
--//   4. Nhân vật đứng yên quá STUCK_TIMEOUT -> đẩy progress tới trước để lách vật cản.
local function walkThrough(segment, room, allowBoss)
	local humanoid = shared.GetHumanoid()
	local root = getPlayerRoot()
	if not humanoid or not root then return end

	--// Ép đúng tốc độ record hoặc fast speed trước cả bước kéo về node đầu (để timing khớp ngay từ đầu).
	applyPlaybackSpeed(segment.speed)

	local path = storage.SimplifyPath(segment.points, SIMPLIFY_TOL)
	local n = #path
	if n < 2 then return end

	local total = 0
	local cum = {}
	cum[1] = 0
	for i = 2, n do
		local segLen = flatDistance(path[i - 1], path[i])
		total += segLen
		cum[i] = total
	end

	--// Hình chiếu gần nhất của 1 điểm lên đường -> chiều dài cung tương ứng.
	--// Chỉ xét các SEGMENT trong cửa sổ [minArc, maxArc] quanh progress hiện tại:
	--// - Ngăn path tự giao (đường vòng cắt chính nó): nhánh kia dù XZ trùng nhưng nằm
	--//   ngoài cửa sổ -> progress không bị nảy tới nhánh đó (khỏi bỏ qua vòng).
	--// - Vẫn gần gũi khi đi từng đoạn/cắt góc (cửa sổ đủ rộng).
	local function projectPoint(pos, minArc, maxArc)
		minArc = minArc or 0
		maxArc = maxArc or total
		local bestArc = 0
		local bestD2 = math.huge
		for k = 2, n do
			if cum[k] < minArc then continue end
			if cum[k - 1] > maxArc then continue end
			local a, b = path[k - 1], path[k]
			local ax, az = a.X, a.Z
			local dx = b.X - ax
			local dz = b.Z - az
			local len2 = dx * dx + dz * dz
			local t = 0
			if len2 > 0 then
				t = ((pos.X - ax) * dx + (pos.Z - az) * dz) / len2
				t = math.clamp(t, 0, 1)
			end
			local ex = pos.X - (ax + dx * t)
			local ez = pos.Z - (az + dz * t)
			local d2 = ex * ex + ez * ez
			if d2 < bestD2 then
				bestD2 = d2
				bestArc = cum[k - 1] + math.sqrt(len2) * t
			end
		end
		return bestArc
	end

	--// Điểm trên đường tại chiều dài cung `dist` (nội suy tuyến tính).
	--// PHẢI trả Vector3 thật: Humanoid:MoveTo không chấp nhận bảng {X,Y,Z}.
	local function pointAt(dist)
		local k = 2
		while k <= n and cum[k] < dist do k += 1 end
		k = math.min(k, n)
		local segLen = cum[k] - cum[k - 1]
		if segLen <= 0 then return path[k] end
		local t = math.clamp((dist - cum[k - 1]) / segLen, 0, 1)
		local a, b = path[k - 1], path[k]
		return Vector3.new(
			a.X + (b.X - a.X) * t,
			a.Y + (b.Y - a.Y) * t,
			a.Z + (b.Z - a.Z) * t
		)
	end

	--// Tính Lookahead thích ứng theo độ uốn của quỹ đạo phía trước (Adaptive Lookahead):
	--// - Góc cua gấp (>= 60°-90°): Lookahead giảm xuống LOOKAHEAD_MIN (2.5 - 3.5 studs) để bám sát cua (chống cắt góc/rơi vực).
	--// - Đường thẳng: Lookahead tăng lên LOOKAHEAD_MAX (7.0 studs) để chạy liền mạch, mượt mà.
	local function getAdaptiveLookahead(curProgress)
		local d1 = math.min(curProgress + 2.5, total)
		local d2 = math.min(curProgress + 5.5, total)
		if d2 - curProgress < 1.0 then return LOOKAHEAD_MIN end

		local p0 = pointAt(curProgress)
		local p1 = pointAt(d1)
		local p2 = pointAt(d2)

		local dx1, dz1 = p1.X - p0.X, p1.Z - p0.Z
		local dx2, dz2 = p2.X - p1.X, p2.Z - p1.Z
		local len1 = math.sqrt(dx1 * dx1 + dz1 * dz1)
		local len2 = math.sqrt(dx2 * dx2 + dz2 * dz2)

		if len1 > 0.1 and len2 > 0.1 then
			local dot = math.clamp((dx1 * dx2 + dz1 * dz2) / (len1 * len2), -1, 1)
			-- dot = 1.0 (thẳng) -> t = 1.0 -> LOOKAHEAD_MAX
			-- dot <= 0 (cua gắt >= 90°) -> t = 0 -> LOOKAHEAD_MIN
			local t = math.clamp((dot + 0.2) / 1.2, 0, 1)
			return LOOKAHEAD_MIN + (LOOKAHEAD_MAX - LOOKAHEAD_MIN) * t
		end
		return LOOKAHEAD_MAX
	end

	--// ---- Timeline events (record: đứng chờ + skill chuột phải) ----
	--// Anchor theo VỊ TRÍ trên đường (project lên path đã làm mịn) -> tốc độ
	--// chạy lại khác bản gốc vẫn khớp. Skill trong khoảng đứng yên được nội
	--// suy theo thời gian tương đối trong dwell; skill khi di chuyển bắn khi
	--// nhân vật cắt qua đúng vị trí.
	local dwells = {}
	local walkSkills = {}
	if segment.events and (replayPauses or replaySkills or replayFacing) then
		local rawDwells = segment.events.dwells or {}
		local rawSkills = segment.events.skills or {}
		for i, d in ipairs(rawDwells) do
			dwells[i] = {
				arc = projectPoint(d.pos),
				dur = d.dur or 0,
				facing = d.facing,
				skills = {},
			}
		end
		for _, s in ipairs(rawSkills) do
			local attached = (replayPauses and s.dw > 0 and dwells[s.dw]) and dwells[s.dw] or nil
			if attached then
				table.insert(attached.skills, { tOff = s.dwT or 0, facing = s.facing, key = s.key })
			else
				table.insert(walkSkills, {
					arc = projectPoint(s.pos),
					facing = s.facing,
					key = s.key,
				})
			end
		end
		table.sort(walkSkills, function(a, b) return a.arc < b.arc end)
	end

	--// Đứng yên re-run theo đúng duration record (xoay mặt + xả skill trong khoảng dừng).
	local function runDwell(dwell)
		if not isPlaying or dwell.dur <= 0 then return true end
		if replayPauses then
			if replayFacing then setFacing(root, dwell.facing) end
			local p0 = getSafePosition(root)
			local startT = os.clock()
			local skIdx = 1
			while isPlaying and os.clock() - startT < dwell.dur do
				if not root or not root.Parent then return false, "no_root" end
				if shared.IsDead() then return false, "dead" end
				if shared.GetCurrentRoomIndex() ~= room then return false, "room_changed" end
				if shared.IsBossActive() and not allowBoss then return false, "boss" end
				--// Giữ chân tại chỗ (chống đẩy lệch) trong suốt khoảng dừng.
				local anchor = p0 or getSafePosition(root)
				if anchor then pcall(function() humanoid:MoveTo(anchor) end) end
				local sk = dwell.skills[skIdx]
				if sk and os.clock() - startT >= sk.tOff then
					if replaySkills then
						if replayFacing then setFacing(root, sk.facing) end
						fireSkill(sk.key or "M2")
					elseif replayFacing then
						setFacing(root, sk.facing)
					end
					skIdx += 1
				end
				task.wait(0.05)
			end
			if replayFacing then restoreAutoRotate() end
		end
		return true
	end

	--// Đảm bảo khi bắt đầu di chuyển: luôn đi về NODE ĐẦU TIÊN (path[1] - vị trí xuất phát).
	--// Không chiếu tìm node giữa đường (tránh bị nhảy cóc sang nhánh khác khi đi ngang qua).
	--// Tiếp cận bằng Pathfinding (giống pha CHASE của AutoFarm) thay vì MoveTo thẳng.
	local repositionStart = path[1]
	local repositionDeadline = os.clock() + START_REPOSITION_TIMEOUT
	local rpOk, rpErr = chaseToStart(humanoid, root, room, allowBoss, repositionStart, repositionDeadline)
	if (not rpOk) and rpErr and rpErr ~= "stopped" then
		return false, rpErr
	end

	local progress = 0
	local prevPos = getSafePosition(root)
	local lastMoved = os.clock()
	local dwellIdx = 1
	local skillIdx = 1
	local faceLockUntil = 0
	local lastSkillFacing = nil

	--// Throttle MoveTo: chỉ gửi lệnh mới khi target nhích ≥ STEP hoặc quá TIMEOUT.
	--// Giảm tải pathfinding của game (đỡ treo client khi chạy set cấu hình 10Hz).
	local lastTargetPos = nil
	local lastMoveToAt = 0
	local function sendMove(target)
		local now = os.clock()
		local movedBy = lastTargetPos and flatDistance(lastTargetPos, target) or math.huge
		if movedBy > 0.5 or now - lastMoveToAt >= 0.25 then
			lastTargetPos = target
			lastMoveToAt = now
			pcall(function() humanoid:MoveTo(target) end)
		end
	end

	while isPlaying do
		if not root or not root.Parent then restoreAutoRotate(); return false, "no_root" end
		if shared.IsDead() then restoreAutoRotate(); return false, "dead" end
		if shared.GetCurrentRoomIndex() ~= room then restoreAutoRotate(); return false, "room_changed" end
		if shared.IsBossActive() and not allowBoss then restoreAutoRotate(); return false, "boss" end -- boss mới xuất hiện -> đứng yên (chỉ khi NORMAL)

		local pos = getSafePosition(root)
		if not pos then
			task.wait(0.08)
			continue
		end

		--// Progress bám hình chiếu gần nhất (trong cửa sổ quanh progress); chỉ tiến, không lùi.
		local projected = projectPoint(
			pos,
			math.max(0, progress - PROJECT_BACK),
			math.min(total, progress + PROJECT_FRONT)
		)
		if projected > progress then progress = projected end

		--// Nghi kẹt: vị trí không nhúc nhích trong STUCK_TIMEOUT -> đẩy target tới.
		if prevPos then
			if flatDistance(pos, prevPos) > 0.02 then lastMoved = os.clock() end
		end
		prevPos = pos
		if os.clock() - lastMoved > STUCK_TIMEOUT then
			progress = math.min(progress + STUCK_BUMP, total - ARRIVE_DIST)
			lastMoved = os.clock()
			prevPos = pos
		end

		--// Pre-Aim Skill: Xoay mặt đón đầu trước khi chạm điểm xả chiêu (cách PRE_AIM_DIST studs).
		--// Đảm bảo khi tới điểm xả thì hướng mặt đã ổn định 100%, không bị lệch tia.
		local nextSkill = walkSkills[skillIdx]
		local isPreAiming = false
		if nextSkill and replayFacing and nextSkill.facing then
			if progress >= nextSkill.arc - PRE_AIM_DIST and progress < nextSkill.arc then
				setFacing(root, nextSkill.facing)
				isPreAiming = true
			end
		end

		--// Bắn skill lúc di chuyển: nhân vật cắt qua đúng vị trí đã bấm chuột phải.
		--// Khoá facing SKILL_FACE_HOLD sau khi xả để game kịp ghi nhận hướng cast
		--// (không quay về hướng đi ngay -> skill không bị bắn lệch).
		while skillIdx <= #walkSkills and walkSkills[skillIdx].arc <= progress do
			local sk = walkSkills[skillIdx]
			if replayFacing then
				setFacing(root, sk.facing)
				lastSkillFacing = sk.facing
				faceLockUntil = os.clock() + skillFaceHold
			end
			if replaySkills then
				fireSkill(sk.key or "M2")
			end
			skillIdx += 1
		end

		--// Đứng chờ ĐÚNG thời lượng record tại vị trí tương ứng.
		local nextDwell = dwells[dwellIdx]
		if nextDwell and progress >= nextDwell.arc then
			local dOk, dErr = runDwell(nextDwell)
			if not dOk then restoreAutoRotate(); return false, dErr end
			dwellIdx += 1
			prevPos = getSafePosition(root)
			lastMoved = os.clock()
			continue
		end

		--// Gần cuối -> đi thẳng nốt tới điểm cuối rồi kết thúc lượt.
		if progress >= total - ARRIVE_DIST then
			restoreAutoRotate()
			pcall(function() humanoid:MoveTo(path[n]) end)
			local deadline = os.clock() + 5
			while isPlaying do
				local p2 = getSafePosition(root)
				if p2 and flatDistance(p2, path[n]) <= ARRIVE_DIST then break end
				if shared.GetCurrentRoomIndex() ~= room then restoreAutoRotate(); return false, "room_changed" end
				if (shared.IsBossActive() and not allowBoss) or shared.IsDead() then restoreAutoRotate(); return false, "dead" end
				if os.clock() >= deadline then break end
				if os.clock() >= faceLockUntil and humanoid.AutoRotate ~= true then
					humanoid.AutoRotate = true
				end
				task.wait(0.08)
			end
			restoreAutoRotate()
			return true, "completed"
		end

		--// Đích luôn ở phía trước -> humanoid đi liền mạch (Adaptive Lookahead).
		if os.clock() < faceLockUntil or isPreAiming then
			--// Đang trong cửa sổ giữ facing hoặc Pre-Aim: khoá AutoRotate để nhân vật giữ góc quay lúc cast chiêu.
			if humanoid.AutoRotate ~= false then humanoid.AutoRotate = false end
		elseif humanoid.AutoRotate ~= true then
			humanoid.AutoRotate = true
		end
		local currentLookahead = getAdaptiveLookahead(progress)
		local target = pointAt(math.min(progress + currentLookahead, total - 0.01))
		sendMove(target)
		task.wait(0.1)
	end
	restoreAutoRotate()
	return false, "stopped"
end

local function playbackLoop()
	--// Đi ĐÚNG 1 LẦN: mỗi room đi hết segment 1 lượt rồi ĐỨNG YÊN chờ đổi room;
	--// không đi qua lại trong room. Khi hết map (lobby) -> dừng hẳn.
	local visitedRoom = 0
	local walkedThisVisit = false
	local wasDead = false
	currentPhaseIndex = 1

	while isPlaying do
		if resumeWanted then break end

		if shared.IsDead() then
			wasDead = true
			task.wait(0.25)
			continue
		end
		if wasDead then
			wasDead = false
		end
		if shared.IsInLobby() then
			--// Hết run: dừng playback, không tự phát lại (đi 1 lần).
			resumeWanted = false
			isPlaying = false
			break
		end
		if shared.IsBossActive() and not playFullMap then
			--// Boss (mode NORMAL): đứng yên (dùng Hazard Scanner).
			task.wait(0.25)
			continue
		end

		local room = shared.GetCurrentRoomIndex()
		if room <= 0 then
			task.wait(0.1)
			continue
		end

		--// Đổi room -> lượt đi mới cho room đó (reset về Phase 1).
		if room ~= visitedRoom then
			visitedRoom = room
			walkedThisVisit = false
			currentPhaseIndex = 1
		end

		local segment = storage.GetRoomSegment(activeMap, room)
		if not segment then
			--// Room chưa record trong macro -> đứng yên chờ đổi room.
			task.wait(0.1)
			continue
		end

		local phases = segment.phases or { segment }
		local totalPhases = #phases

		if walkedThisVisit then
			--// Đã đi xong lượt của room -> đứng yên, chờ đổi room.
			task.wait(0.1)
			continue
		end

		local phaseData = phases[math.min(currentPhaseIndex, totalPhases)] or segment

		local ok, reason = walkThrough(phaseData, room, playFullMap)
		restoreAutoRotate()
		if ok then
			walkedThisVisit = true
		else
			--// Bị chết giữa chừng: tăng phase index để khi hồi sinh chạy Phase tiếp theo
			if reason == "dead" then
				currentPhaseIndex += 1
				local nextPhaseNum = math.min(currentPhaseIndex, totalPhases)
				if totalPhases > 1 then
					notifier.Notify(
						"Path Record",
						("Tử trận (Phase %d/%d): Chờ hồi sinh để chạy Phase %d..."):format(
							currentPhaseIndex - 1,
							totalPhases,
							nextPhaseNum
						),
						3
					)
				else
					notifier.Notify("Path Record", "Tử trận: Đang chờ hồi sinh để đi lại...", 2)
				end

				while isPlaying and shared.IsDead() do
					task.wait(0.2)
				end
				task.wait(0.6) -- Chờ nhân vật load xong hoàn toàn
			end
		end
	end
	restorePlaybackSpeed()
	restoreAutoRotate()
	playThread = nil
	fireStatus()
end

function mover.IsPlaying()
	return isPlaying
end

function mover.ResumeWanted()
	return resumeWanted
end

function mover.GetActiveMap()
	return activeMap
end

--// Playback đang ở chế độ FULL (đi qua boss room theo path)?
function mover.IsBossPlayActive()
	return playFullMap
end

function mover.GetStatus()
	return {
		playing = isPlaying,
		map = activeMap,
		room = shared.GetCurrentRoomIndex(),
		boss = shared.IsBossActive(),
		phase = currentPhaseIndex,
		resume = resumeWanted,
	}
end

function mover.OnStatusChanged(callback)
	if type(callback) == "function" then
		table.insert(statusListeners, callback)
	end
end

--// Bắt đầu phát. Trả về ok, err.
function mover.Start()
	if isPlaying then return false, "đang phát rồi" end
	if shared.IsInLobby() then return false, "đang ở lobby" end

	local room = shared.GetCurrentRoomIndex()
	if room <= 0 then return false, "chưa có room" end

	local map = shared.GetCurrentDungeonName()
	if not map or #map == 0 then return false, "không xác định được map" end
	if not storage.HasSegmentOrMacro(map, room) then
		return false, ("map [%s] chưa có segment room %d"):format(map, room)
	end

	--// Mode FULL: đi qua luôn boss room (miễn room đó có segment đã ghi).
	local full = storage.GetMapMode(map) == "full"
	if shared.IsBossActive() and (not full or not storage.HasSegmentOrMacro(map, room)) then
		return false, "boss room (hãy dùng Hazard Scanner)"
	end

	activeMap = map
	playFullMap = full
	resumeWanted = false
	currentPhaseIndex = 1
	isPlaying = true
	playThread = task.spawn(playbackLoop)
	fireStatus("started")
	return true
end

--// Dừng (thủ công): không tự resume nữa.
function mover.Stop()
	isPlaying = false
	resumeWanted = false
	activeMap = nil
	playFullMap = false
	currentPhaseIndex = 1
	if playThread then
		task.cancel(playThread)
		playThread = nil
	end
	cancelMove(shared.GetHumanoid())
	restorePlaybackSpeed()
	restoreAutoRotate()
	fireStatus("stopped")
end

--// Nhường độc quyền cho hệ thống khác (HazardScanner/AutoFarm...): dừng nhưng
--// giữ ý định tự resume khi vào room có segment.
function mover.PauseForExclusive()
	if not isPlaying then return end

	resumeWanted = true
	isPlaying = false
	playFullMap = false
	if playThread then
		task.cancel(playThread)
		playThread = nil
	end
	cancelMove(shared.GetHumanoid())
	restorePlaybackSpeed()
	restoreAutoRotate()
	notifier.Notify("Path Record", "Nhường điều khiển: sẽ tự phát tiếp khi vào room có bản ghi", 3)
	fireStatus("paused")
end

return mover end function __DIST.ac()-- Path Record System – Visual: vẽ quỹ đạo record (đỏ khi đang record /
-- cyan khi đang play / xám xanh nhạt khi xem trước macro của map).

--// Imports

local Workspace = game:GetService("Workspace")

--// Table
local visual = {}

--// State
local anchor = nil
local lines = {}
local drawnKey = nil
local lastUpdate = 0

--// Style áp dụng lúc tạo LineHandleAdornment (thay đổi qua tab Path Record).
local style = {
	thickness = 3,
	transparency = 0.25,
}

function visual.SetStyle(update)
	if type(update) ~= "table" then return end
	if update.thickness ~= nil then
		style.thickness = math.clamp(update.thickness, 1, 10)
	end
	if update.transparency ~= nil then
		style.transparency = math.clamp(update.transparency, 0, 0.9)
	end
end

function visual.GetStyle()
	return { thickness = style.thickness, transparency = style.transparency }
end

--// Constants
local THROTTLE = 0.4 -- Giây tối thiểu giữa 2 lần rebuild (đang record điểm đổi liên tục)

local function ensureAnchor()
	if anchor and anchor.Parent then return anchor end
	anchor = Instance.new("Part")
	anchor.Name = "PR_PathAnchor_Visual"
	anchor.Anchored = true
	anchor.CanCollide = false
	anchor.CanQuery = false
	anchor.CanTouch = false
	anchor.Transparency = 1
	anchor.Size = Vector3.new(1, 1, 1)
	anchor.CFrame = CFrame.new(0, 0, 0)
	anchor.Parent = Workspace
	return anchor
end

function visual.Clear()
	for _, line in ipairs(lines) do
		pcall(function() line:Destroy() end)
	end
	table.clear(lines)
	drawnKey = nil
end

--// Vẽ nhiều polyline (mỗi segment 1 màu riêng). Tự skip khi key không đổi.
--// polys: { { points = {Vector3...}, color = Color3, tag = any }, ... }
function visual.DrawPolylines(polys, key, force)
	if not polys or #polys == 0 then
		visual.Clear()
		return
	end

	local strKey = tostring(key)
	if strKey == drawnKey then return end
	if not force and os.clock() - lastUpdate < THROTTLE and #lines > 0 then return end

	visual.Clear()
	drawnKey = strKey
	lastUpdate = os.clock()

	local adornee = ensureAnchor()
	for _, poly in ipairs(polys) do
		local points = poly.points
		if points and #points >= 2 then
			for i = 2, #points do
				local a = points[i - 1]
				local b = points[i]
				local dist = (b - a).Magnitude
				if dist > 0.01 then
					local line = Instance.new("LineHandleAdornment")
					line.Name = "PR_PathLine_Visual"
					line.Adornee = adornee
					line.Length = dist
					line.Thickness = style.thickness
					line.Transparency = style.transparency
					line.Color3 = poly.color or Color3.fromRGB(0, 230, 255)
					line.ZIndex = 1
					line.CFrame = CFrame.lookAt(a, b)
					line.Parent = Workspace
					table.insert(lines, line)
				end
			end
		end
	end
	if #lines == 0 then drawnKey = nil end
end

return visual end function __DIST.ad()-- Path Record System – Range Visual: Vòng tròn trực quan quanh nhân vật
-- giúp người chơi ước lượng phạm vi/tầm đánh của Skill (AOE) để căn điểm record.
-- Đồng thời tự động HIGHLIGHT kẻ địch khi chúng bước vào trong tầm (in-range).

--// Imports

local services = __DIST.load('e')
local shared = __DIST.load('f')
local lifecycle = __DIST.load('b')

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
end function __DIST.ae()-- Path Record System (DungeonQuest) – Facade: điều phối Record / Playback.
--   - Macro = 1 bản ghi cho cả MAP, record liên tục nhiều room trong 1 session
--     (tự auto-split theo room; segment phòng boss đánh dấu `boss`).
--   - Mode của map do người dùng chọn (lưu trong file macro):
--       * NORMAL (mặc định): chỉ room quái thường; BOSS ngẫu nhiên -> dùng Hazard Scanner
--         (pathRecord tự nhường quyền + auto-resume khi sang room có bản ghi).
--       * FULL: record + phát luôn cả boss room theo path đã ghi; giữ độc quyền khi boss.

--// Imports

local services = __DIST.load('e')
local shared = __DIST.load('f')
local lifecycle = __DIST.load('b')
local coordinator = __DIST.load('u')
local notifier = __DIST.load('c')

local storage = __DIST.load('_')
local recorder = __DIST.load('aa')
local mover = __DIST.load('ab')
local visual = __DIST.load('ac')
local rangeVisual = __DIST.load('ad')

local RunService = services.RunService

--// Table
local pathRecord = {}

--// Settings
local showVisual = true

--// Bộ màu line path (dropdown trong tab) + style kích thước (slider).
local DEFAULT_THEME = "Default (Red/Cyan/Teal)"
local THEMES = {
	[DEFAULT_THEME] = {
		rec = Color3.fromRGB(255, 60, 60),
		play = Color3.fromRGB(0, 230, 255),
		idle = Color3.fromRGB(90, 190, 200),
	},
	["Oceana"] = {
		rec = Color3.fromRGB(0, 190, 255),
		play = Color3.fromRGB(80, 255, 220),
		idle = Color3.fromRGB(120, 210, 255),
	},
	["Sunset"] = {
		rec = Color3.fromRGB(255, 120, 60),
		play = Color3.fromRGB(255, 220, 80),
		idle = Color3.fromRGB(255, 150, 160),
	},
	["Emerald"] = {
		rec = Color3.fromRGB(80, 255, 140),
		play = Color3.fromRGB(0, 220, 120),
		idle = Color3.fromRGB(140, 255, 180),
	},
	["Violet"] = {
		rec = Color3.fromRGB(200, 90, 255),
		play = Color3.fromRGB(170, 120, 255),
		idle = Color3.fromRGB(150, 150, 255),
	},
}

local visualStyle = {
	thickness = 3,
	transparency = 0.25, --// 0 = đậm nhất, 0.9 = gần như mất
	theme = DEFAULT_THEME,
}

function pathRecord.GetStyle()
	return {
		thickness = visualStyle.thickness,
		transparency = visualStyle.transparency,
		theme = visualStyle.theme,
	}
end

function pathRecord.GetThemeNames()
	local names = {}
	for name in pairs(THEMES) do
		names[#names + 1] = name
	end
	table.sort(names)
	return names
end

--// Áp style mới (từ slider/dropdown) -> đẩy sang visual + ép redraw sớm nhất.
function pathRecord.SetStyle(update)
	if type(update) ~= "table" then return end
	if update.thickness ~= nil then visualStyle.thickness = math.clamp(update.thickness, 1, 10) end
	if update.transparency ~= nil then visualStyle.transparency = math.clamp(update.transparency, 0, 0.9) end
	if update.theme and THEMES[update.theme] then visualStyle.theme = update.theme end
	visual.SetStyle({ thickness = visualStyle.thickness, transparency = visualStyle.transparency })
	lastBuildKey = nil
	fireStatus("style")
end

--// Timeline record/replay: đứng chờ (dwell) + kích hoạt skill (chuột phải) + facing.
local timelineCapture = true
local timelineReplay = true

function pathRecord.IsTimelineCaptureEnabled()
	return timelineCapture
end

function pathRecord.SetTimelineCapture(state)
	timelineCapture = state and true or false
	recorder.SetCapture(timelineCapture)
	fireStatus("timeline")
end

function pathRecord.IsTimelineReplayEnabled()
	return timelineReplay
end

function pathRecord.SetTimelineReplay(state)
	timelineReplay = state and true or false
	mover.SetReplayTimeline(timelineReplay)
	fireStatus("timeline")
end

--// Ép tốc chạy = tốc độ record khi phát (khớp thời gian skill/dừng, mặc định bật).
function pathRecord.IsSpeedMatchEnabled()
	return mover.IsSpeedMatchEnabled()
end

function pathRecord.SetSpeedMatch(state)
	mover.SetSpeedMatch(state and true or false)
	fireStatus("speedmatch")
end

--// Dùng tốc độ Fast Speed từ tab Combat/Player khi phát macro
function pathRecord.IsUseFastSpeedEnabled()
	return mover.IsUseFastSpeedEnabled()
end

function pathRecord.SetUseFastSpeed(state)
	mover.SetUseFastSpeed(state and true or false)
	fireStatus("usefastspeed")
end

--// Giữ facing sau khi xả skill khi đang đi (0.5s - 2s) để game kịp ghi nhận hướng cast.
function pathRecord.GetSkillFaceHold()
	return mover.GetSkillFaceHold()
end

function pathRecord.SetSkillFaceHold(seconds)
	mover.SetSkillFaceHold(seconds)
	fireStatus("facehold")
end

--// Khoảng nghỉ giữa 2 lần click khi double-cast skill (0.001s - 0.1s).
function pathRecord.GetDoubleClickDelay()
	return mover.GetDoubleClickDelay()
end

function pathRecord.SetDoubleClickDelay(seconds)
	mover.SetDoubleClickDelay(seconds)
	fireStatus("doubleclick")
end

--// State
local statusListeners = {}
local bossConnection = nil
local drawConnection = nil
local storageUnsub = nil
local roomUnsub = nil
local mapUnsub = nil

local function fireStatus(reason)
	local recStat = recorder.GetStatus()
	local info = {
		recording = recorder.IsRecording(),
		playing = mover.IsPlaying(),
		resume = mover.ResumeWanted(),
		autoPlayWanted = autoPlayWanted,
		inLobby = shared.IsInLobby(),
		map = shared.GetCurrentDungeonName(),
		room = shared.GetCurrentRoomIndex(),
		boss = shared.IsBossActive(),
		recordedMaps = storage.Count(),
		pointCount = recorder.IsRecording() and recStat.pointCount or 0,
		phase = mover.IsPlaying() and mover.GetCurrentPhaseIndex() or (recorder.IsRecording() and recStat.phaseCount or 1),
		reason = reason,
	}
	for _, cb in ipairs(statusListeners) do
		pcall(cb, info)
	end
end

--// ---------- Record ----------

function pathRecord.ToggleRecord(state)
	if state then
		if recorder.IsRecording() then return true end
		if mover.IsPlaying() then mover.Stop() end

		local ok, err = recorder.Start()
		if not ok then
			notifier.Notify("Path Record", "Không bắt đầu record: " .. tostring(err), 3)
		end
		fireStatus()
		return ok
	else
		local was = recorder.IsRecording()
		recorder.Stop()
		fireStatus()
		return was
	end
end

function pathRecord.IsRecording()
	return recorder.IsRecording()
end

--// Room hiện tại đã có segment trong macro chưa? (để xác nhận trước khi record ghi đè)
function pathRecord.CurrentRoomHasRecord()
	return storage.HasSegmentOrMacro(shared.GetCurrentDungeonName(), shared.GetCurrentRoomIndex())
end

--// ---------- Map Mode (NORMAL / FULL) ----------

--// Mode cho 1 map: "normal" (skip boss, dùng Hazard Scanner) hoặc "full" (record + phát cả boss room).
function pathRecord.GetMapMode(mapName)
	return storage.GetMapMode(mapName)
end

function pathRecord.SetMapMode(mapName, mode)
	if storage.SetMapMode(mapName, mode) then
		fireStatus("mode")
	end
end

--// ---------- Playback ----------

--// Flag persists "wants to auto-play macro" (được lưu qua config, không phải runtime state).
--// Khi bật: đang ở dungeon có macro -> phát ngay; phòng boss đang active -> bỏ qua nếu mode NORMAL.
--// Giữ nguyên trạng thái armed khi ở lobby hoặc khi room đang load.
local autoPlayWanted = false

function pathRecord.IsAutoPlayWanted()
	return autoPlayWanted
end

function pathRecord.TogglePlay(state)
	autoPlayWanted = state and true or false

	if autoPlayWanted then
		if mover.IsPlaying() then
			fireStatus("already_playing")
			return true
		end
		if recorder.IsRecording() then
			recorder.Stop()
		end

		if shared.IsInLobby() then
			fireStatus("armed_lobby")
			return true
		end

		local map = shared.GetCurrentDungeonName()
		local room = shared.GetCurrentRoomIndex()

		if not map or #map == 0 or room <= 0 then
			fireStatus("armed_waiting")
			return true
		end

		if shared.IsBossActive() and storage.GetMapMode(map) ~= "full" then
			fireStatus("armed_boss")
			return true
		end

		if storage.HasSegmentOrMacro(map, room) then
			coordinator.EnableExclusive("PathRecord")
			mover.Start()
		end

		fireStatus("play_started")
		return true
	else
		local was = mover.IsPlaying()
		mover.Stop()
		fireStatus("play_stopped")
		return was
	end
end

function pathRecord.IsPlaying()
	return mover.IsPlaying()
end

--// Chủ quyền di chuyển = playback (record chỉ quan sát, không điều khiển nhân vật).
function pathRecord.IsEnabled()
	return mover.IsPlaying()
end

--// ---------- Settings ----------

function pathRecord.SetShowVisual(state)
	showVisual = state and true or false
	if not showVisual then visual.Clear() end
	fireStatus()
end

function pathRecord.IsShowVisualEnabled()
	return showVisual
end

--// ---------- Skill Range Visual (Vòng tròn quanh nhân vật) ----------

function pathRecord.SetRangeVisual(state)
	rangeVisual.SetEnabled(state)
	fireStatus("rangevisual")
end

function pathRecord.IsRangeVisualEnabled()
	return rangeVisual.IsEnabled()
end

function pathRecord.SetRangeVisualRadius(radius)
	rangeVisual.SetRadius(radius)
	fireStatus("rangeradius")
end

function pathRecord.GetRangeVisualRadius()
	return rangeVisual.GetRadius()
end

function pathRecord.SetRangeVisualFill(state)
	rangeVisual.SetFillEnabled(state)
	fireStatus("rangefill")
end

function pathRecord.IsRangeVisualFillEnabled()
	return rangeVisual.IsFillEnabled()
end

function pathRecord.SetHighlightInRange(state)
	rangeVisual.SetHighlightInRange(state)
	fireStatus("rangehighlight")
end

function pathRecord.IsHighlightInRangeEnabled()
	return rangeVisual.IsHighlightInRangeEnabled()
end

function pathRecord.GetRangeColorNames()
	return rangeVisual.GetColorNames()
end

function pathRecord.GetSelectedCircleColor()
	return rangeVisual.GetSelectedCircleColor()
end

function pathRecord.SetCircleColor(name)
	rangeVisual.SetCircleColor(name)
	fireStatus("circlecolor")
end

function pathRecord.GetSelectedHighlightColor()
	return rangeVisual.GetSelectedHighlightColor()
end

function pathRecord.SetHighlightColor(name)
	rangeVisual.SetHighlightColor(name)
	fireStatus("highlightcolor")
end

--// ---------- Storage passthrough ----------

function pathRecord.GetMaps()
	return storage.GetMaps()
end

function pathRecord.GetMacro(mapName)
	return storage.GetMap(mapName)
end

function pathRecord.RemoveMap(mapName)
	storage.RemoveMap(mapName)
	fireStatus("removed")
end

function pathRecord.ClearAll()
	storage.ClearAll()
	fireStatus("cleared")
end

function pathRecord.ReloadFromDisk()
	storage.ReloadFromDisk()
	fireStatus("reloaded")
end

--// ---------- Status ----------

function pathRecord.GetStatus()
	local recStat = recorder.GetStatus()
	return {
		recording = recorder.IsRecording(),
		playing = mover.IsPlaying(),
		resume = mover.ResumeWanted(),
		autoPlayWanted = autoPlayWanted,
		inLobby = shared.IsInLobby(),
		map = shared.GetCurrentDungeonName(),
		room = shared.GetCurrentRoomIndex(),
		boss = shared.IsBossActive(),
		recordedMaps = storage.Count(),
		pointCount = recStat.pointCount,
		phase = mover.IsPlaying() and mover.GetCurrentPhaseIndex() or (recorder.IsRecording() and recStat.phaseCount or 1),
	}
end

function pathRecord.OnStatusChanged(callback)
	if type(callback) == "function" then
		table.insert(statusListeners, callback)
	end
end

--// ---------- Autonomous behavior ----------

--// Vào boss room:
--//   - Mode FULL: đang phát -> giữ/giành độc quyền (đi path đã record qua boss);
--//     đang chờ resume hoặc autoPlayWanted -> gọi phát lại luôn vào boss room có segment.
--//   - Mode NORMAL: chỉ báo + đứng yên (dùng Hazard Scanner); nếu bật Hazard Scanner
--//     nó chiếm độc quyền -> pathRecord nhường và auto-resume khi sang room thường.
bossConnection = shared.OnBossActiveChanged(function(active)
	if not active then return end

	if mover.ResumeWanted() or autoPlayWanted then
		local map = mover.GetActiveMap() or shared.GetCurrentDungeonName()
		if map and storage.GetMapMode(map) == "full" then
			local room = shared.GetCurrentRoomIndex()
			if room > 0 and storage.HasSegmentOrMacro(map, room) then
				coordinator.EnableExclusive("PathRecord")
				mover.Start()
				fireStatus("boss")
			end
		end
		return
	end

	if mover.IsPlaying() then
		local map = mover.GetActiveMap() or shared.GetCurrentDungeonName()
		if map and storage.GetMapMode(map) == "full" then
			coordinator.EnableExclusive("PathRecord")
		else
			notifier.Notify("Path Record", "Boss room: tạm dừng, dùng Hazard Scanner", 3)
			fireStatus("boss")
		end
	end
end)

--// Bản ghi thay đổi -> cập nhật UI.
storageUnsub = storage.OnChanged(function()
	fireStatus("storage")
end)

--// Auto-resume & Auto-play: khi sang room mới có segment trong macro -> tự động phát tiếp.
--// Room boss được auto-resume chỉ khi map ở mode FULL (room đó đã được record).
roomUnsub = shared.OnRoomIndexChanged(function()
	if not autoPlayWanted and not mover.ResumeWanted() then return end

	local room = shared.GetCurrentRoomIndex()
	if room <= 0 or shared.IsInLobby() or shared.IsDead() then return end

	local map = shared.GetCurrentDungeonName()
	if not map or #map == 0 then return end
	if mover.GetActiveMap() and mover.GetActiveMap() ~= map then return end
	if shared.IsBossActive() and storage.GetMapMode(map) ~= "full" then return end
	if not storage.HasSegmentOrMacro(map, room) then return end

	if not mover.IsPlaying() then
		coordinator.EnableExclusive("PathRecord")
		mover.Start()
		fireStatus("resumed")
	end
end)

--// Đổi map giữa chừng: commit nốt record đang dở + dọn trạng thái playback map cũ.
--// Khi vào map mới và autoPlayWanted bật: nếu room 1 đã có macro -> tự động khởi chạy.
mapUnsub = shared.OnDungeonNameChanged(function(name)
	if recorder.IsRecording() then
		recorder.Stop("đổi map")
	end
	if mover.IsPlaying() or mover.ResumeWanted() then
		local currentMap = mover.GetActiveMap()
		if currentMap and currentMap ~= name then
			mover.Stop()
		end
	end
	if autoPlayWanted and name and #name > 0 then
		task.delay(0.3, function()
			if not autoPlayWanted or mover.IsPlaying() or recorder.IsRecording() then return end
			local room = shared.GetCurrentRoomIndex()
			if room > 0 and storage.HasSegmentOrMacro(name, room) then
				if not (shared.IsBossActive() and storage.GetMapMode(name) ~= "full") then
					coordinator.EnableExclusive("PathRecord")
					mover.Start()
					fireStatus("map_autoplay")
				end
			end
		end)
	end
	fireStatus("map")
end)

--// Render quỹ đạo: đỏ (record), cyan (play), xanh nhạt (xem trước macro khi idle).
--// Tối ưu: dùng "chìa khoá tín hiệu" (cheap, KHÔNG decode) -> chỉ decode + dựng
--// polyline khi tín hiệu ĐỔI; trước đây decode toàn bộ macro + dựng object mỗi frame.
--// Tổng số LineHandleAdornment cũng giảm mạnh nhờ làm mịn trước khi vẽ.
local function macroStamp(map)
	if not map or #map == 0 then return "-" end
	for _, rec in ipairs(storage.GetMaps()) do
		if rec.map == map then
			return tostring(rec.updated or "-") .. ":" .. tostring(rec.roomCount)
		end
	end
	return "-"
end

local lastDrawTag = nil
local lastBuildKey = nil
visual.SetStyle({ thickness = visualStyle.thickness, transparency = visualStyle.transparency })
recorder.SetCapture(timelineCapture)
mover.SetReplayTimeline(timelineReplay)
drawConnection = RunService.Heartbeat:Connect(function()
	if not showVisual then
		if lastDrawTag then visual.Clear(); lastDrawTag = nil end
		return
	end

	local map = shared.GetCurrentDungeonName()
	local room = shared.GetCurrentRoomIndex()

	local buildKey
	if recorder.IsRecording() then
		buildKey = "rec:" .. recorder.GetCurrentPhaseIndex() .. ":" .. #recorder.GetCurrentPoints()
	elseif mover.IsPlaying() then
		buildKey = "play:" .. tostring(room) .. ":" .. mover.GetCurrentPhaseIndex() .. ":" .. macroStamp(map)
	else
		buildKey = "idle:" .. macroStamp(map)
	end
	if buildKey == lastBuildKey then return end
	lastBuildKey = buildKey

	local theme = THEMES[visualStyle.theme] or THEMES[DEFAULT_THEME]
	local polys = {}

	if recorder.IsRecording() then
		--// Đang record: vẽ segment hiện tại màu sắc theo theme (points là Vector3 sống, không decode).
		local pts = recorder.GetCurrentPoints()
		if #pts >= 2 then
			polys[1] = { points = pts, color = theme.rec, tag = "rec" }
		end
	elseif mover.IsPlaying() then
		--// Đang play: vẽ segment/phase của room hiện tại (đã làm mịn như lúc đi).
		if map and room > 0 then
			local seg = storage.GetRoomSegment(map, room)
			if seg then
				local phases = seg.phases or { seg }
				local curPIdx = mover.GetCurrentPhaseIndex() or 1
				local pData = phases[math.min(curPIdx, #phases)] or seg
				if pData and pData.points and #pData.points >= 2 then
					polys[1] = {
						points = storage.SimplifyPath(pData.points, 0.4),
						color = theme.play,
						tag = ("play_%s_p%d"):format(tostring(room), curPIdx),
					}
				end
			end
		end
	else
		--// Idle: xem trước toàn bộ macro của map hiện tại (bao gồm các phase).
		if map then
			local macro = storage.GetMap(map)
			if macro then
				local roomKeys = {}
				for r in pairs(macro.rooms) do
					roomKeys[#roomKeys + 1] = r
				end
				table.sort(roomKeys)
				for _, r in ipairs(roomKeys) do
					local seg = macro.rooms[r]
					if seg then
						local phases = seg.phases or { seg }
						for pIdx, pData in ipairs(phases) do
							if pData and pData.points and #pData.points >= 2 then
								polys[#polys + 1] = {
									points = storage.SimplifyPath(pData.points, 0.4),
									color = seg.boss and Color3.fromRGB(255, 140, 255) or theme.idle,
									tag = ("macro_%s_p%d"):format(tostring(r), pIdx),
								}
							end
						end
					end
				end
			end
		end
	end

	if #polys > 0 then
		--// Key theo nội dung để visual tự skip rebuild (throttle 0.4s).
		local parts = {}
		for _, p in ipairs(polys) do
			parts[#parts + 1] = (p.tag or "x") .. ":" .. #p.points
		end
		visual.DrawPolylines(polys, table.concat(parts, "|"))
		lastDrawTag = "drawn"
	elseif lastDrawTag then
		visual.Clear()
		lastDrawTag = nil
	end
end)

--// ---------- Coordinator & Lifecycle ----------

--// Hệ thống khác chiếm độc quyền (HazardScanner/AutoFarm...) -> nhường + auto-resume.
coordinator.Register("PathRecord", function(state)
	if not state then
		mover.PauseForExclusive()
	end
	fireStatus("disabled")
end, pathRecord.IsEnabled)

--// Startup: nếu autoPlayWanted (từ config) và đang ở dungeon có macro -> auto-play.
task.delay(1.0, function()
	if autoPlayWanted and not mover.IsPlaying() and not recorder.IsRecording() then
		local map = shared.GetCurrentDungeonName()
		if map and #map > 0 and not shared.IsInLobby() then
			if storage.HasSegmentOrMacro(map, shared.GetCurrentRoomIndex()) then
				pathRecord.TogglePlay(true)
			end
		end
	end
end)

lifecycle.Register(function()
	mover.Stop()
	recorder.Cancel()
	visual.Clear()
	if bossConnection then bossConnection(); bossConnection = nil end
	if drawConnection then drawConnection:Disconnect(); drawConnection = nil end
	if roomUnsub then roomUnsub(); roomUnsub = nil end
	if mapUnsub then mapUnsub(); mapUnsub = nil end
	if storageUnsub then storageUnsub(); storageUnsub = nil end
end)

return pathRecord end function __DIST.af()-- Tab Path Record (DungeonQuest): thử nghiệm macro di chuyển theo quỹ đạo record sẵn.
--   - MACRO = 1 bản ghi cho cả map: bấm Record 1 lần, tự ghi liên tục qua các room
--     (auto-split segment theo room), tự lưu khi về lobby. Record lại room nào thì ghi đè room đó.
--   - Mode theo map: NORMAL (mặc định) skip boss, dùng Hazard Scanner; FULL record & phát luôn cả boss room.

--// Imports

local services = __DIST.load('e')
local lifecycle = __DIST.load('b')
local pathRecord = __DIST.load('ae')
local autoSave = __DIST.load('d')
local ui = __DIST.load('g')
local notifier = __DIST.load('c')

local RunService = services.RunService

return function(window, tab)
	--// ============================================================
	--// LEFT COLUMN: Điều khiển
	--// ============================================================
	local left = tab:Section({ Side = "Left" })
	left:Header({ Name = "Path Record" })
	left:Label({
		Text = "Macro = 1 bản ghi cho cả map, <font color='rgb(0,255,120)'>bấm Record 1 lần là ghi liên tục</font> qua từng room (tự lưu khi về lobby). Mode FULL -> record & phát luôn cả boss room.",
	})

	local isSyncingRecord = false
	local isSyncingPlay = false
	local isSyncingMode = false
	local isPromptingRecord = false
	local macroDropdown = nil
	local updateStatus = nil
	local syncToggles = nil

	local function getSelectedMapFromDropdown()
		if not macroDropdown then return nil end
		local selected = macroDropdown:GetOptions()
		for option, isSelected in pairs(selected) do
			if isSelected and option ~= "None" then
				local mapName = string.match(option, "^Map %[(.+)%] %(%d+ rooms%)$")
				if mapName and #mapName > 0 then
					return mapName
				end
			end
		end
		return nil
	end

	local recordToggle = left:Toggle({
		Name = "Record Path (Macro)",
		Default = pathRecord.IsRecording(),
		Callback = function(state)
			if isSyncingRecord then return end

			if state then
				-- Đã đang record rồi -> không làm gì thêm
				if pathRecord.IsRecording() then return end

				--// Room đã có macro -> record sẽ GHI ĐÈ segment cũ: hỏi xác nhận trước.
				if pathRecord.CurrentRoomHasRecord() then
					if isPromptingRecord then return end
					isPromptingRecord = true

					window:Dialog({
						Title = "Confirm Record",
						Description = "Room này <font color='rgb(255,200,0)'>đã có macro được lưu</font>."
							.. "\n\nRecord bây giờ sẽ <b>GHI ĐÈ segment cũ</b> của room đó.\nBạn vẫn muốn record lại chứ?",
						Buttons = {
							{
								Name = "Record (Overwrite)",
								Callback = function()
									isPromptingRecord = false
									local ok = pathRecord.ToggleRecord(true)
									if not ok then
										pcall(function()
											isSyncingRecord = true
											recordToggle:UpdateState(false)
											isSyncingRecord = false
										end)
									end
								end,
							},
							{
								Name = "Cancel",
								Callback = function()
									isPromptingRecord = false
									local ok, err = pcall(function()
										isSyncingRecord = true
										recordToggle:UpdateState(false)
										isSyncingRecord = false
									end)
									if not ok then
										isSyncingRecord = false
										warn("Path Record: Cancel failed to reset toggle - " .. tostring(err))
									end
								end,
							},
						},
					})
					return
				end
				pathRecord.ToggleRecord(true)
			else
				isPromptingRecord = false
				if pathRecord.IsRecording() then
					pathRecord.ToggleRecord(false)
				end
			end
		end,
	})
	left:Label({
		Text = "Record sẽ bắt cả <font color='rgb(255,150,80)'>khoảng đứng chờ</font> + <font color='rgb(255,80,80)'>skill (chuột phải / Q / E)</font> + hướng mặt, Play sẽ tái hiện lại đúng vị trí, giây & nút đã record.",
	})

	--// Mode theo map: NORMAL = skip boss (dùng Hazard Scanner); FULL = record & phát luôn cả boss room.
	local modeLabel = left:Label({
		Text = "Record Mode (theo map): <font color='rgb(120,200,255)'>NORMAL</font>",
	})

	local recordBossToggle = left:Toggle({
		Name = "Full Mode (Record & Play Boss Rooms)",
		Default = false,
		Callback = function(state)
			if isSyncingMode then return end

			local currentMap = pathRecord.GetStatus().map
			local targetMap = (currentMap and #currentMap > 0) and currentMap or getSelectedMapFromDropdown()

			if not targetMap or #targetMap == 0 then
				notifier.Notify("Path Record", "Chưa có map nào được chọn. Hãy chọn map trong dropdown hoặc vào dungeon.", 3)
				pcall(function()
					isSyncingMode = true
					recordBossToggle:UpdateState(false)
					isSyncingMode = false
				end)
				return
			end
			pathRecord.SetMapMode(targetMap, state and "full" or "normal")
			notifier.Notify("Path Record", ("Map [%s]: Chế độ %s"):format(targetMap, state and "FULL (record & phát cả boss room)" or "NORMAL (bỏ qua boss, dùng Hazard Scanner)"), 3)
			if updateStatus then
				updateStatus(pathRecord.GetStatus())
			end
		end,
	})
	left:Label({
		Text = "Mode lưu theo <font color='rgb(150,255,150)'>từng map</font>. <font color='rgb(255,140,255)'>FULL</font>: ghi liên tục qua cả boss room & phát theo path đã record. <font color='rgb(120,200,255)'>NORMAL</font> (mặc định): chỉ room quái thường, boss dùng Hazard Scanner.",
	})

	local playToggle = left:Toggle({
		Name = "Play Path (Macro)",
		Default = pathRecord.IsAutoPlayWanted(),
		Callback = autoSave.Wrap(function(state)
			if isSyncingPlay then return end
			pathRecord.TogglePlay(state)
		end),
	}, "Toggle_PR_Play")

	--// Timeline: ghi/tái hiện khoảng dừng + skill chuột phải + hướng mặt.
	local captureTimeline = left:Toggle({
		Name = "Record Pauses & Skills",
		Default = pathRecord.IsTimelineCaptureEnabled(),
		Callback = autoSave.Wrap(function(state)
			pathRecord.SetTimelineCapture(state)
		end),
	}, "Toggle_PR_TimelineCapture")

	local replayTimeline = left:Toggle({
		Name = "Replay Pauses & Skills",
		Default = pathRecord.IsTimelineReplayEnabled(),
		Callback = autoSave.Wrap(function(state)
			pathRecord.SetTimelineReplay(state)
		end),
	}, "Toggle_PR_TimelineReplay")

	local speedMatch = left:Toggle({
		Name = "Match Record Speed (Precise)",
		Default = pathRecord.IsSpeedMatchEnabled(),
		Callback = autoSave.Wrap(function(state)
			pathRecord.SetSpeedMatch(state)
		end),
	}, "Toggle_PR_SpeedMatch")

	local useFastSpeed = left:Toggle({
		Name = "Use Player Fast Speed",
		Default = pathRecord.IsUseFastSpeedEnabled(),
		Callback = autoSave.Wrap(function(state)
			pathRecord.SetUseFastSpeed(state)
		end),
	}, "Toggle_PR_UseFastSpeed")

	--// Giữ facing sau khi xả skill khi đang đi (0.5s - 2s).
	ui.PatchSliderLoadCallback(left:Slider({
		Name = "Skill Face Hold (s)",
		Default = pathRecord.GetSkillFaceHold(),
		Minimum = 0.5,
		Maximum = 2,
		DisplayMethod = "Value",
		Precision = 2,
		Callback = autoSave.Wrap(function(v)
			pathRecord.SetSkillFaceHold(v)
		end),
		onInputComplete = function(v)
			autoSave.SaveNow()
			notifier.Notify("Path Record", ("Saved Skill Face Hold = %ss"):format(tostring(v)), 2)
		end,
	}, "Slider_PR_SkillFaceHold"))

	--// Khoảng nghỉ giữa 2 lần click khi double-cast skill (0.005s - 0.1s).
	ui.PatchSliderLoadCallback(left:Slider({
		Name = "Skill Double Click Delay (s)",
		Default = pathRecord.GetDoubleClickDelay(),
		Minimum = 0.005,
		Maximum = 0.1,
		DisplayMethod = "Value",
		Precision = 3,
		Callback = autoSave.Wrap(function(v)
			pathRecord.SetDoubleClickDelay(v)
		end),
		onInputComplete = function(v)
			autoSave.SaveNow()
			notifier.Notify("Path Record", ("Saved Double Click Delay = %ss"):format(tostring(v)), 2)
		end,
	}, "Slider_PR_DoubleClickDelay"))

	local visualToggle = left:Toggle({
		Name = "Show Path Visual",
		Default = pathRecord.IsShowVisualEnabled(),
		Callback = autoSave.Wrap(function(state)
			pathRecord.SetShowVisual(state)
		end),
	}, "Toggle_PR_Visual")

	--// Tuỳ chỉnh cách hiển thị line path (kích thước + màu).
	local prStyle = pathRecord.GetStyle()

	ui.PatchSliderLoadCallback(left:Slider({
		Name = "Line Thickness",
		Default = prStyle.thickness,
		Minimum = 1,
		Maximum = 10,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(v)
			pathRecord.SetStyle({ thickness = v })
		end),
		onInputComplete = function(v)
			autoSave.SaveNow()
		end,
	}, "Slider_PR_LineThickness"))

	ui.PatchSliderLoadCallback(left:Slider({
		Name = "Line Opacity",
		Default = math.round((1 - prStyle.transparency) * 100),
		Minimum = 10,
		Maximum = 100,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(v)
			pathRecord.SetStyle({ transparency = 1 - v / 100 })
		end),
		onInputComplete = function(v)
			autoSave.SaveNow()
		end,
	}, "Slider_PR_LineOpacity"))

	local themeNames = pathRecord.GetThemeNames()
	local themeIdx = 1
	for i, name in ipairs(themeNames) do
		if name == prStyle.theme then
			themeIdx = i
			break
		end
	end
	ui.PatchDropdownRestore(left:Dropdown({
		Name = "Path Color Theme",
		Options = themeNames,
		Default = themeIdx,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			pathRecord.SetStyle({ theme = option })
		end),
	}, "Dropdown_PR_Theme"), false)

	--// ============================================================
	--// LEFT COLUMN: Quản lý macro
	--// ============================================================
	left:Header({ Name = "Macros" })

	macroDropdown = ui.PatchDropdownRestore(left:Dropdown({
		Name = "Map Recording",
		Options = { "None" },
		Default = 1,
		Required = true,
		Callback = function(option)
			local info = pathRecord.GetStatus()
			if updateStatus then updateStatus(info) end
			if syncToggles then syncToggles(info) end
		end,
	}), false)

	local deleteBtn = left:Button({
		Name = "Delete Selected Map",
		Callback = autoSave.Wrap(function()
			local mapName = getSelectedMapFromDropdown()
			if mapName and #mapName > 0 then
				pathRecord.RemoveMap(mapName)
			end
		end),
	})

	local reloadBtn = left:Button({
		Name = "Reload Macros (EsclipseHub/DQMacro)",
		Callback = function()
			pathRecord.ReloadFromDisk()
			notifier.Notify("Path Record", "Đã quét và tải lại các file macro từ EsclipseHub/DQMacro/", 2)
		end,
	})

	--// Nút Clear 2 bước (arm Confirm -> bấm lại trong hạn).
	local clearArmed = false
	local clearTimer = nil
	local CLEAR_NAME = "Clear All Recordings"
	local CLEAR_CONFIRM_NAME = "<font color='rgb(255,80,80)'>Confirm Clear All?</font>"
	local CLEAR_TIMEOUT = 3

	local function disarmClear()
		if not clearArmed then return end
		clearArmed = false
		if clearTimer then task.cancel(clearTimer); clearTimer = nil end
		pcall(function() clearBtn:UpdateName(CLEAR_NAME) end)
	end

	local clearBtn = left:Button({
		Name = CLEAR_NAME,
		Callback = function()
			if not clearArmed then
				clearArmed = true
				if clearTimer then task.cancel(clearTimer) end
				clearTimer = task.delay(CLEAR_TIMEOUT, disarmClear)
				pcall(function() clearBtn:UpdateName(CLEAR_CONFIRM_NAME) end)
				return
			end
			disarmClear()
			pathRecord.ClearAll()
		end,
	})

	--// ============================================================
	--// RIGHT COLUMN: Status & Range Visual
	--// ============================================================
	local right = tab:Section({ Side = "Right" })
	right:Header({ Name = "Status Monitor" })

	local stateLabel = right:Label({ Text = "State: <font color='rgb(160,160,160)'>Idle</font>" })
	local roomLabel = right:Label({ Text = "Room: <font color='rgb(160,160,160)'>-</font> | Boss: <font color='rgb(160,160,160)'>-</font>" })
	local pointsLabel = right:Label({ Text = "Points: <font color='rgb(160,160,160)'>-</font>" })
	local recordingsLabel = right:Label({ Text = "Macros: <font color='rgb(160,160,160)'>None</font>" })

	--// ============================================================
	--// RIGHT COLUMN: Skill Range Visual (Section riêng)
	--// ============================================================
	local rangeSection = tab:Section({ Side = "Right" })
	rangeSection:Header({ Name = "Skill Range Visual" })
	rangeSection:Label({
		Text = "Vòng tròn quanh nhân vật giúp ước lượng <font color='rgb(0,255,200)'>tầm đánh / phạm vi AOE</font> của skill để căn góc và vị trí xả chiêu khi record.",
	})

	local rangeToggle = rangeSection:Toggle({
		Name = "Show Range Circle",
		Default = pathRecord.IsRangeVisualEnabled(),
		Callback = autoSave.Wrap(function(state)
			pathRecord.SetRangeVisual(state)
		end),
	}, "Toggle_PR_RangeVisual")

	ui.PatchSliderLoadCallback(rangeSection:Slider({
		Name = "Skill Range (Studs)",
		Default = pathRecord.GetRangeVisualRadius(),
		Minimum = 5,
		Maximum = 120,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(v)
			pathRecord.SetRangeVisualRadius(v)
		end),
		onInputComplete = function(v)
			autoSave.SaveNow()
		end,
	}, "Slider_PR_RangeRadius"))

	rangeSection:Toggle({
		Name = "Fill Circle Area",
		Default = pathRecord.IsRangeVisualFillEnabled(),
		Callback = autoSave.Wrap(function(state)
			pathRecord.SetRangeVisualFill(state)
		end),
	}, "Toggle_PR_RangeFill")

	local rangeColorNames = pathRecord.GetRangeColorNames()

	local curCircleColor = pathRecord.GetSelectedCircleColor()
	local circleColorDefaultIdx = 1
	for i, name in ipairs(rangeColorNames) do
		if name == curCircleColor then
			circleColorDefaultIdx = i
			break
		end
	end

	ui.PatchDropdownRestore(rangeSection:Dropdown({
		Name = "Circle Color",
		Options = rangeColorNames,
		Default = circleColorDefaultIdx,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			pathRecord.SetCircleColor(option)
		end),
	}, "Dropdown_PR_CircleColor"), false)

	local inRangeHighlightToggle = rangeSection:Toggle({
		Name = "Highlight In-Range Enemies (Glow)",
		Default = pathRecord.IsHighlightInRangeEnabled(),
		Callback = autoSave.Wrap(function(state)
			pathRecord.SetHighlightInRange(state)
		end),
	}, "Toggle_PR_HighlightInRange")

	local curHlColor = pathRecord.GetSelectedHighlightColor()
	local hlColorDefaultIdx = 2 -- Default Red
	for i, name in ipairs(rangeColorNames) do
		if name == curHlColor then
			hlColorDefaultIdx = i
			break
		end
	end

	ui.PatchDropdownRestore(rangeSection:Dropdown({
		Name = "Enemy Highlight Color",
		Options = rangeColorNames,
		Default = hlColorDefaultIdx,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			pathRecord.SetHighlightColor(option)
		end),
	}, "Dropdown_PR_HighlightColor"), false)

	--// Đồng bộ toggle UI theo trạng thái thực tế (không gọi lại Callback gây loop).
	syncToggles = function(info)
		if not isPromptingRecord then
			pcall(function()
				if recordToggle and recordToggle.GetState and recordToggle:GetState() ~= info.recording then
					isSyncingRecord = true
					recordToggle:UpdateState(info.recording)
					isSyncingRecord = false
				end
			end)
		end
		pcall(function()
			local wantPlay = pathRecord.IsAutoPlayWanted()
			if playToggle and playToggle.GetState and playToggle:GetState() ~= wantPlay then
				isSyncingPlay = true
				playToggle:UpdateState(wantPlay)
				isSyncingPlay = false
			end
		end)
		pcall(function()
			local currentMap = info.map
			local targetMap = (currentMap and #currentMap > 0) and currentMap or getSelectedMapFromDropdown()
			local wantMode = targetMap and pathRecord.GetMapMode(targetMap) == "full" or false
			if recordBossToggle and recordBossToggle.GetState and recordBossToggle:GetState() ~= wantMode then
				isSyncingMode = true
				recordBossToggle:UpdateState(wantMode)
				isSyncingMode = false
			end
		end)
		pcall(function()
			if visualToggle and visualToggle.GetState and visualToggle:GetState() ~= pathRecord.IsShowVisualEnabled() then
				visualToggle:UpdateState(pathRecord.IsShowVisualEnabled())
			end
		end)
		pcall(function()
			if rangeToggle and rangeToggle.GetState and rangeToggle:GetState() ~= pathRecord.IsRangeVisualEnabled() then
				rangeToggle:UpdateState(pathRecord.IsRangeVisualEnabled())
			end
		end)
		pcall(function()
			if inRangeHighlightToggle and inRangeHighlightToggle.GetState and inRangeHighlightToggle:GetState() ~= pathRecord.IsHighlightInRangeEnabled() then
				inRangeHighlightToggle:UpdateState(pathRecord.IsHighlightInRangeEnabled())
			end
		end)
	end

	local function mapOptionList(maps)
		local options = {}
		for _, rec in ipairs(maps) do
			options[#options + 1] = ("Map [%s] (%d rooms)"):format(rec.map, rec.roomCount)
		end
		if #options == 0 then
			options[1] = "None"
		end
		return options
	end

	--// Chỉ rebuild dropdown khi danh sách map đổi (tránh churn mỗi tick).
	local lastMapOptionsKey = nil

	local function refreshDropdown(maps)
		local options = mapOptionList(maps)
		local key = table.concat(options, "|")

		if key == lastMapOptionsKey then return end
		lastMapOptionsKey = key

		local prevSelected = nil
		for option, isSelected in pairs(macroDropdown:GetOptions()) do
			if isSelected then prevSelected = option; break end
		end

		pcall(function() macroDropdown:ClearOptions() end)
		pcall(function() macroDropdown:InsertOptions(options) end)

		--// Giữ selection cũ nếu còn tồn tại, không thì chọn option đầu tiên.
		local newSelection = prevSelected
		if not newSelection or not macroDropdown:IsOption(newSelection) then
			newSelection = options[1]
		end
		pcall(function() macroDropdown:UpdateSelection(newSelection) end)
	end

	updateStatus = function(info)
		local isFullMap = false
		local currentMap = info.map
		local targetMap = (currentMap and #currentMap > 0) and currentMap or getSelectedMapFromDropdown()
		if targetMap then
			isFullMap = pathRecord.GetMapMode(targetMap) == "full"
		end

		local stateText
		if info.recording then
			stateText = "<font color='rgb(255,90,90)'>Recording...</font>"
		elseif info.playing then
			stateText = "<font color='rgb(0,230,255)'>Playing</font>"
		elseif info.resume then
			stateText = "<font color='rgb(255,200,0)'>Waiting (auto-resume)</font>"
		elseif info.autoPlayWanted then
			if info.inLobby then
				stateText = "<font color='rgb(100,220,100)'>Armed (Lobby)</font>"
			elseif not info.map or #info.map == 0 then
				stateText = "<font color='rgb(100,220,100)'>Armed (Loading...)</font>"
			elseif info.boss and not isFullMap then
				stateText = "<font color='rgb(255,160,50)'>Waiting (Boss Room)</font>"
			else
				stateText = "<font color='rgb(100,220,100)'>Armed (Waiting for Room)</font>"
			end
		else
			stateText = "<font color='rgb(160,160,160)'>Idle</font>"
		end
		pcall(function() stateLabel:UpdateName("State: " .. stateText) end)

		local modeText = isFullMap
			and "<font color='rgb(255,140,255)'>FULL</font>"
			or "<font color='rgb(120,200,255)'>NORMAL</font>"
		local mapContextText = targetMap and (" (map [" .. targetMap .. "])") or " (theo map)"
		pcall(function() modeLabel:UpdateName("Record Mode" .. mapContextText .. ": " .. modeText) end)

		local bossText
		if info.boss then
			if isFullMap then
				bossText = "<font color='rgb(255,140,255)'>YES (FULL path)</font>"
			else
				bossText = "<font color='rgb(255,80,80)'>YES (dùng Hazard Scanner)</font>"
			end
		else
			bossText = "<font color='rgb(0,255,120)'>No</font>"
		end
		local roomText = info.room and info.room > 0
			and ("<font color='rgb(0,255,255)'>room %d</font>"):format(info.room)
			or "<font color='rgb(160,160,160)'>-</font>"
		local mapText = info.map and #info.map > 0
			and ("<font color='rgb(150,255,150)'>%s</font>"):format(info.map)
			or "<font color='rgb(160,160,160)'>-</font>"
		pcall(function() roomLabel:UpdateName("Map: " .. mapText .. " | Room: " .. roomText .. " | Boss: " .. bossText) end)

		if info.recording then
			local curP = info.phase or 1
			pcall(function() pointsLabel:UpdateName(("Points: <font color='rgb(255,170,60)'>%d</font> (room %s | Phase %d)"):format(info.pointCount, tostring(info.room), curP)) end)
		elseif info.playing then
			local curP = info.phase or 1
			pcall(function() pointsLabel:UpdateName(("Playing: <font color='rgb(0,230,255)'>Phase %d</font>"):format(curP)) end)
		else
			pcall(function() pointsLabel:UpdateName("Points: <font color='rgb(160,160,160)'>-</font>") end)
		end

		local maps = pathRecord.GetMaps()
		if #maps == 0 then
			pcall(function() recordingsLabel:UpdateName("Macros: <font color='rgb(160,160,160)'>None</font>") end)
		else
			local parts = {}
			for _, rec in ipairs(maps) do
				local bossPart = rec.bossCount and rec.bossCount > 0 and ("+%db"):format(rec.bossCount) or ""
				local phasePart = rec.phaseCount and rec.phaseCount > rec.roomCount and ("/%dph"):format(rec.phaseCount) or ""
				parts[#parts + 1] = ("%s(%dr%s/%dp%s)"):format(rec.map, rec.roomCount, phasePart, rec.pointCount, bossPart)
			end
			pcall(function() recordingsLabel:UpdateName("Macros: <font color='rgb(150,255,150)'>" .. table.concat(parts, ", ") .. "</font>") end)
		end

		refreshDropdown(maps)
	end

	pathRecord.OnStatusChanged(function(info)
		updateStatus(info)
		syncToggles(info)
	end)

	--// Monitor định kỳ (đảm bảo UI phản ánh đúng cả khi config đổi).
	local lastUpdate = 0
	local monitorConnection = RunService.Heartbeat:Connect(function()
		local now = os.clock()
		if now - lastUpdate < 0.4 then return end
		lastUpdate = now
		local info = pathRecord.GetStatus()
		updateStatus(info)
		syncToggles(info)
	end)

	lifecycle.Register(function()
		if monitorConnection then monitorConnection:Disconnect(); monitorConnection = nil end
	end)

	updateStatus(pathRecord.GetStatus())
	syncToggles(pathRecord.GetStatus())
end end function __DIST.ag()-- DungeonQuest: khởi tạo window + tabs, nạp core logic và các tab UI.


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
	local lifecycle = __DIST.load('b')
	local autoSave = __DIST.load('d')

	--// Tạm khóa autoSave trong quá trình khởi tạo UI và nạp config để tránh ghi đè file trên đĩa
	autoSave.Suspend()

	--// Window
	local window = macLib:Window({
		Title = "DungeonQuest",
		Subtitle = "EsclipseHub",
		Size = UDim2.fromOffset(1000, 600),
		SidebarWidth = 300,
		DragStyle = 1,
		DisabledWindowControls = {},
		ShowUserInfo = true,
		Keybind = Enum.KeyCode.RightControl,
		AcrylicBlur = true,
	})

	local notifier = __DIST.load('c')
	notifier:SetWindow(window)

	--// Đăng ký UI vào registry để unload UI cũ trước mỗi lần execute script mới
	_G.ScriptHub_UI = window
	_G.ScriptHub_Cleanup = function()
		lifecycle.Cleanup()
	end
	window.onUnloaded(function()
		lifecycle.Cleanup()
		if _G.ScriptHub_UI == window then _G.ScriptHub_UI = nil end
	end)

	--// Tabs
	local tabGroup = window:TabGroup()
	local tabs = {
		Combat = tabGroup:Tab({ Name = "Combat", Image = "rbxassetid://10734975692" }),
		Dungeon = tabGroup:Tab({ Name = "Dungeon Joiner", Image = "rbxassetid://10734886202" }),
		Inventory = tabGroup:Tab({ Name = "Inventory", Image = "rbxassetid://10709769841" }),
		Utilities = tabGroup:Tab({ Name = "Utilities", Image = "rbxassetid://10747383470" }),
		Configs = tabGroup:Tab({ Name = "Configs", Image = "rbxassetid://10734950309" }),
		PathRecord = tabGroup:Tab({ Name = "Path Record", Image = "rbxassetid://10734950309" }),
	}

	--// Config
	macLib:SetFolder("EsclipseHub")

	--// Tab UI (mỗi tab trigger require các core logic tương ứng)
	local combatTab = __DIST.load('E')
	local dungeonTab = __DIST.load('J')
	local inventoryTab = __DIST.load('L')
	local utilitiesTab = __DIST.load('V')
	local configsTab = __DIST.load('Z')
	local pathRecordTab = __DIST.load('af')

	combatTab(window, tabs.Combat)
	dungeonTab(window, tabs.Dungeon)
	inventoryTab(window, tabs.Inventory)
	utilitiesTab(window, tabs.Utilities)
	configsTab(window, tabs.Configs)
	pathRecordTab(window, tabs.PathRecord)

	--// Phím tắt
	local shortcuts = __DIST.load('h')
	shortcuts.Init()

	--// Webhook Discord (thông báo WIN + Reward)
	local webhook = __DIST.load('Q')
	webhook.Init()
__DIST.load('N')

	--// Auto Hide UI (ẩn cửa sổ sau khi execute)
	

local autoHide = __DIST.load('W')
	autoHide.SetWindow(window)
	autoHide.Execute()

	--// Contextual (tự động áp dụng setting theo Dungeon x Target)
	local contextual = __DIST.load('C')
	contextual.Init()

	--// Khởi chạy
	tabs.Combat:Select()

	local coordinator = __DIST.load('u')

	coordinator.SetLocked(true)
	macLib:LoadAutoLoadConfig()

	--// Đồng bộ config autoload vào autoSave: nếu không gọi SetActive thì
	--// autoSave.Save() sẽ KHÔNG lưu bất kỳ slider/toggle nào khi thay đổi.
	local function syncActiveConfigFromAutoload()
		local path = macLib.Folder .. "/settings/autoload.txt"
		if isfile and isfile(path) then
			local ok, name = pcall(readfile, path)
			if ok and type(name) == "string" and #name > 0 then
				autoSave.SetActive(name)
			end
		end
	end
	syncActiveConfigFromAutoload()

	task.delay(0.3, function()
		coordinator.SetLocked(false)
	end)

	--// Kích hoạt lại autoSave sau khi toàn bộ UI và config đã nạp xong ổn định
	task.delay(1.5, function()
		autoSave.Resume()
	end)
end
end function __DIST.ah()
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

return flags end function __DIST.ai()
--// Imports



local binder = __DIST.load('S')

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
end function __DIST.aj()--// Imports

local binder = __DIST.load('S')

--// Variables
local esp = {}

--// Initialize
return binder.Wrap(esp, {
	Enabled = function(value: boolean)
		print(`{value and "Enabled" or "Disabled"} ESP.`)
	end,
}) :: { Enabled: boolean }
end function __DIST.ak()--// Imports

local flags = __DIST.load('ah')
local interface = __DIST.load('ai')
local esp = __DIST.load('aj')

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
end function __DIST.al()--// Variables

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
end function __DIST.am()--// Functions

local function cast(service: string): any
	return game:GetService(service)
end

--// Initialize
return {
	Players = cast("Players") :: Players,
}
end function __DIST.an()-- You can go even further by seperating tabs into different files, eg, Game 1/tabs/exploits.luau


return function(self)
	--// Imports
	local base = __DIST.load('ak')
	local utility = __DIST.load('al')
	local services = __DIST.load('am')

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

--// Dừng logic cũ trước khi unload UI, tránh listener/vòng lặp bị nhân đôi khi execute lại.

local oldCleanup = _G.ScriptHub_Cleanup
if typeof(oldCleanup) == "function" then
	pcall(oldCleanup)
end
_G.ScriptHub_Cleanup = nil

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
		Load = __DIST.load('ag'),
		UniverseId = 9931749389,
		Places = {
			77649408247578,
			3220968688,
			2414851778,
		},
	},

	{
		Name = "Game 2",
		Load = __DIST.load('an'),
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
