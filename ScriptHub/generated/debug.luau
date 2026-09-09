--!nocheck
--!nolint

--[[
    @authors YOUR_NAME
    @repository YOUR_REPOSITORY

    This file was automatically generated with darklua, it is not intended for manual editing.
--]]

_P = {
    genDate = "2026-09-09T23:22:11.295732200+00:00",
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

-- Lưu ngay lập tức (gọi trực tiếp)
function autoSave.SaveNow()
	if autoSave.IsSuspended() then return end
	if not activeConfig then return end

	local success, err = macLib:SaveConfig(activeConfig)
	if not success and err and err ~= "Please select a config file." then
		notifier.Notify("AutoSave", "Không lưu được config: " .. tostring(err), 3)
	end
end

-- Lưu có debounce: dồn nhiều thay đổi (vd kéo slider) thành 1 lần lưu
function autoSave.Save()
	if autoSave.IsSuspended() then return end
	if not activeConfig then return end
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

--// Panic Speed state (Smart Dodge Panic Sprint)
local panicSpeedActive = false
local panicSpeedThread = nil

function shared.TriggerPanicSpeed(panicSpeed, duration)
	panicSpeed = panicSpeed or 24
	duration = duration or 1.5
	if not humanoid or not humanoid.Parent then return false end

	-- Nếu player đã có WalkSpeed >= panicSpeed (do skill buff của game hoặc tab Speed), không kích hoạt
	if humanoid.WalkSpeed >= panicSpeed then
		return false
	end

	if panicSpeedThread then
		task.cancel(panicSpeedThread)
		panicSpeedThread = nil
	end

	panicSpeedActive = true
	isSettingSpeed = true
	if humanoid.WalkSpeed < panicSpeed then
		humanoid.WalkSpeed = panicSpeed
	end
	isSettingSpeed = false

	panicSpeedThread = task.delay(duration, function()
		panicSpeedActive = false
		panicSpeedThread = nil
		if humanoid and humanoid.Parent then
			isSettingSpeed = true
			if enabled then
				humanoid.WalkSpeed = fastSpeed
			else
				humanoid.WalkSpeed = normalSpeed
			end
			isSettingSpeed = false
		end
	end)
	return true
end

function shared.CancelPanicSpeed()
	if not panicSpeedActive and not panicSpeedThread then return end
	if panicSpeedThread then
		task.cancel(panicSpeedThread)
		panicSpeedThread = nil
	end
	panicSpeedActive = false
	if humanoid and humanoid.Parent then
		isSettingSpeed = true
		if enabled then
			humanoid.WalkSpeed = fastSpeed
		else
			humanoid.WalkSpeed = normalSpeed
		end
		isSettingSpeed = false
	end
end

function shared.IsPanicSpeedActive()
	return panicSpeedActive
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
		if panicSpeedActive then
			if curSpeed < 24 then
				isSettingSpeed = true
				humanoid.WalkSpeed = 24
				isSettingSpeed = false
			end
			return
		end
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
		shared.CancelPanicSpeed()
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

--// ---- Room index ----

--// Đọc số room từ tên (room1 -> 1, room12 -> 12...). Trả 0 nếu không khớp.
local function parseRoomNumber(name)
	if type(name) ~= "string" then return 0 end
	local number = string.match(name, "^room(%d+)$")
	if not number then return 0 end
	return tonumber(number) or 0
end

--// Tính room hiện tại: room chứa enemy đang track còn sống.
--// Game clear theo kiểu tuần tự: xong quái room này mới spawn quái room sau, nên
--// tại 1 thời điểm chỉ có đúng 1 room có quái -> room của bất kỳ quái đang track
--// chính là room hiện tại (không cần scan theo khoảng cách).
--// Room nhận diện qua TÊN "room<so>" (room1, room2...). Không có enemy/dungeon -> 0.
local function computeRoomIndex()
	if not dungeon then return 0 end
	for model, data in pairs(trackedEnemies) do
		if data and data.Room then
			local idx = parseRoomNumber(data.Room.Name)
			if idx > 0 then return idx end
		end
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
		DisplayMethod = "Round",
		Precision = 0,
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
endend function __DIST.j()-- Coordinator (DungeonQuest): Điều phối loại trừ lẫn nhau giữa các hệ thống điều khiển nhân vật.
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

return coordinator end function __DIST.k()-- Catalog map + độ khó cho DungeonQuest, dựa trên module chooseDungeon của game.
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

return dungeonCatalog end function __DIST.l()--==============================================================--
-- Smart Dodge – Skill Timing Manager
-- Quản lý dữ liệu thời gian tồn tại (lifetime) và điểm nổ (hit delay) của chiêu thức.
-- Hỗ trợ 2 chế độ riêng biệt:
--   1. "Default Preset": Dùng bảng số liệu cứng chuẩn đã đo đạc (Zero I/O, cực kỳ ổn định)
--   2. "Trained Preset": Dùng dữ liệu JSON được huấn luyện riêng theo từng Map (Zero I/O khi né, nạp 1 lần vào RAM)
-- Chế độ Huấn luyện (Recording):
--   - Người chơi tự chơi chay trong map để thu thập nhịp chiêu thức
--   - Toàn bộ dữ liệu ghi nhận lưu tạm trong RAM, chỉ ghi ra file khi người chơi chủ động bấm Save
--==============================================================--


local services = __DIST.load('e')
local shared = __DIST.load('f')
local dungeonCatalog = __DIST.load('k')
local notifier = __DIST.load('c')
local macLib = __DIST.load('a')

local HttpService = game:GetService("HttpService")

local skillTimingManager = {}

--// Bảng Preset mặc định chuẩn (Hardcoded Presets)
local DEFAULT_PRESETS = {
	["mediumIceSpikes"] = { hitDelay = 1.1, totalLifetime = 1.5, isProjectile = false, skillType = "AoE" },
	["largeIceSpikes"] = { hitDelay = 1.4, totalLifetime = 1.8, isProjectile = false, skillType = "AoE" },
	["thirdBossMultiRings"] = { hitDelay = 2.0, totalLifetime = 2.8, isProjectile = false, skillType = "AoE" },
	["firstBossCrissCross"] = { hitDelay = 0.0, totalLifetime = 2.2, isProjectile = true, skillType = "Projectile" },
	["firstBossSeekingSpikes"] = { hitDelay = 0.0, totalLifetime = 2.5, isProjectile = true, skillType = "Projectile" },
	["firstBossBigSpike"] = { hitDelay = 0.0, totalLifetime = 2.0, isProjectile = true, skillType = "Projectile" },
	["firstBossBeamPart"] = { hitDelay = 0.0, totalLifetime = 2.0, isProjectile = true, skillType = "Projectile" },
	["secondBossMovingBeam"] = { hitDelay = 0.0, totalLifetime = 3.5, isProjectile = true, skillType = "Projectile" },
	["secondbossyelloworb"] = { hitDelay = 0.0, totalLifetime = 4.0, isProjectile = true, skillType = "Projectile" },
	["secondbossredorb"] = { hitDelay = 0.0, totalLifetime = 4.0, isProjectile = true, skillType = "Projectile" },
	["secondbossgreenorb"] = { hitDelay = 0.0, totalLifetime = 4.0, isProjectile = true, skillType = "Projectile" },
	["thirdBossMissile"] = { hitDelay = 0.0, totalLifetime = 3.5, isProjectile = true, skillType = "Projectile" },
}

--// Thư mục lưu dữ liệu theo Map
local SKILLS_FOLDER = macLib.Folder .. "/skills_data"

local function ensureFolder()
	if makefolder and isfolder then
		pcall(function()
			if not isfolder(macLib.Folder) then makefolder(macLib.Folder) end
			if not isfolder(SKILLS_FOLDER) then makefolder(SKILLS_FOLDER) end
		end)
	end
end

--// Trạng thái vận hành
local currentMode = "Default Preset" -- "Default Preset" | "Trained Preset"
local selectedMap = nil

-- RAM Data cho Mode 2 (Trained Preset)
local loadedTrainedData = {}
local loadedSkillCount = 0

-- RAM Data cho Huấn luyện Chơi chay (Recording Session)
local isRecording = false
local recordedSessionData = {}
local recordedSkillCount = 0
local totalSamplesCount = 0

local changeListeners = {}

local function fireChange()
	for _, cb in ipairs(changeListeners) do
		pcall(cb, {
			mode = currentMode,
			selectedMap = selectedMap,
			loadedCount = loadedSkillCount,
			isRecording = isRecording,
			recordedCount = recordedSkillCount,
			totalSamples = totalSamplesCount,
		})
	end
end

-- Chuẩn hóa tên file an toàn cho hệ thống tệp
local function sanitizeFileName(name)
	if not name or #name == 0 then return "Unknown" end
	return (name:gsub("[\\/:*?\"<>|]", "_"))
end

local function getFilePathForMap(mapName)
	ensureFolder()
	return SKILLS_FOLDER .. "/" .. sanitizeFileName(mapName) .. ".json"
end

--// ĐỌC DỮ LIỆU MAP VÀO RAM (Chỉ đọc 1 lần khi chọn map hoặc vào phòng)
function skillTimingManager.LoadMapData(mapName)
	mapName = mapName or selectedMap or shared.GetCurrentDungeonName() or "Unknown"
	local filePath = getFilePathForMap(mapName)

	table.clear(loadedTrainedData)
	loadedSkillCount = 0

	if isfile and isfile(filePath) then
		local ok, content = pcall(readfile, filePath)
		if ok and content and #content > 0 then
			local parseOk, parsed = pcall(function() return HttpService:JSONDecode(content) end)
			if parseOk and type(parsed) == "table" then
				for skillName, data in pairs(parsed) do
					if type(data) == "table" and type(data.avgLifetime) == "number" then
						loadedTrainedData[skillName] = {
							totalLifetime = tonumber(data.avgLifetime) or 2.0,
							hitDelay = tonumber(data.avgHitDelay) or (tonumber(data.avgLifetime) * 0.75),
							count = tonumber(data.count) or 1,
							minLifetime = tonumber(data.minLifetime),
							maxLifetime = tonumber(data.maxLifetime),
							isProjectile = data.isProjectile == true,
							skillType = data.skillType or (data.isProjectile and "Projectile" or "AoE"),
						}
						loadedSkillCount = loadedSkillCount + 1
					end
				end
			end
		end
	end

	fireChange()
	return loadedSkillCount
end

--// LẤY DỮ LIỆU TIMING (Được Smart Dodge / 3D Countdown gọi mỗi frame - 100% TRÊN RAM)
function skillTimingManager.GetSkillTiming(skillName)
	if currentMode == "Trained Preset" then
		local trained = loadedTrainedData[skillName]
		if trained and trained.totalLifetime then
			local hitDelay = trained.hitDelay
			if trained.isProjectile or hitDelay == 0 then
				hitDelay = 0.0
			end
			return trained.totalLifetime, (hitDelay or (trained.totalLifetime * 0.75))
		end
	end

	-- Mode 1 hoặc fallback: Bảng cứng Preset
	local preset = DEFAULT_PRESETS[skillName]
	if preset then
		return preset.totalLifetime or 2.0, preset.hitDelay or 1.5
	end

	return 2.5, 1.8
end

--// CHẾ ĐỘ HUẤN LUYỆN CHƠI CHAY (MANUAL TRAINING)
function skillTimingManager.SetRecordingEnabled(state)
	isRecording = state and true or false
	if isRecording then
		notifier.Notify("Skill Training", "Bắt đầu thu thập dữ liệu skill (Chơi chay)! Hãy tự né và đánh Boss.", 4)
	else
		notifier.Notify("Skill Training", ("Đã dừng ghi nhận. Thu thập được %d chiêu thức."):format(recordedSkillCount), 3)
	end
	fireChange()
end

function skillTimingManager.IsRecording()
	return isRecording
end

-- Ghi nhận 1 skill vào RAM buffer (hoàn toàn không đụng file I/O)
function skillTimingManager.RecordSkill(skillName, duration, hitDelay, isProjectile)
	if not isRecording then return end
	if not skillName or not duration or duration < 0.2 or duration > 30.0 then return end

	totalSamplesCount = totalSamplesCount + 1

	if isProjectile then
		hitDelay = 0.0
	end

	local rec = recordedSessionData[skillName]
	if not rec then
		local isProj = isProjectile and true or false
		recordedSessionData[skillName] = {
			count = 1,
			avgLifetime = duration,
			avgHitDelay = hitDelay or 0.0,
			minLifetime = duration,
			maxLifetime = duration,
			isProjectile = isProj,
			skillType = isProj and "Projectile" or "AoE",
		}
		recordedSkillCount = recordedSkillCount + 1
	else
		rec.count = rec.count + 1
		rec.isProjectile = rec.isProjectile or (isProjectile and true or false)
		rec.skillType = rec.isProjectile and "Projectile" or "AoE"

		if rec.isProjectile then
			-- Với Projectile: Sát thương gây ra liên tục suốt hành trình bay
			rec.avgHitDelay = 0.0

			-- Xử lý va chạm nổ sớm (Loại 1) vs Đạn xuyên thấu (Loại 2):
			-- Nếu duration quá ngắn so với thời gian bay tối đa từng đo (< 60% maxLifetime),
			-- đây là trường hợp đạn va chạm người chơi/tường nổ sớm -> Không kéo tụt avgLifetime!
			if duration >= (rec.maxLifetime * 0.60) then
				local weight = math.min(rec.count, 8)
				rec.avgLifetime = rec.avgLifetime + (duration - rec.avgLifetime) / weight
			end
			rec.maxLifetime = math.max(rec.maxLifetime, duration)
			rec.minLifetime = math.min(rec.minLifetime, duration)
		else
			-- Với AoE / Telegraph nổ mặt đất:
			local weight = math.min(rec.count, 8)
			rec.avgLifetime = rec.avgLifetime + (duration - rec.avgLifetime) / weight
			if hitDelay then
				rec.avgHitDelay = (rec.avgHitDelay or hitDelay) + (hitDelay - (rec.avgHitDelay or hitDelay)) / weight
			end
			rec.minLifetime = math.min(rec.minLifetime, duration)
			rec.maxLifetime = math.max(rec.maxLifetime, duration)
		end
	end

	local tag = rec.isProjectile and "🚀 Projectile" or "💥 AoE"
	print(("[SkillTimingManager] ✅ Recorded '%s' [%s] (hits: %d, avgLife: %.2fs, hitDelay: %.2fs) | RAM: %d unique, %d total hits")
		:format(skillName, tag, rec.count, rec.avgLifetime, rec.avgHitDelay or 0, recordedSkillCount, totalSamplesCount))

	fireChange()
end

-- Đóng gói dữ liệu Map thành định dạng JSON chuẩn có thụt dòng đẹp, dễ đọc, ưu tiên trường isProjectile và skillType
local function serializeSkillData(data)
	local lines = { "{\n" }
	local sortedKeys = {}
	for k in pairs(data) do
		table.insert(sortedKeys, k)
	end
	table.sort(sortedKeys)

	for i, skillName in ipairs(sortedKeys) do
		local info = data[skillName]
		local isProj = (info.isProjectile == true)
		local skillType = info.skillType or (isProj and "Projectile" or "AoE")
		local avgLife = tonumber(info.avgLifetime) or 2.0
		local hitDelay = tonumber(info.avgHitDelay) or (isProj and 0.0 or 1.5)
		local count = tonumber(info.count) or 1
		local minLife = tonumber(info.minLifetime) or avgLife
		local maxLife = tonumber(info.maxLifetime) or avgLife

		local comma = (i < #sortedKeys) and "," or ""
		table.insert(lines, string.format('  %q: {\n', skillName))
		table.insert(lines, string.format('    "skillType": %q,\n', skillType))
		table.insert(lines, string.format('    "isProjectile": %s,\n', isProj and "true" or "false"))
		table.insert(lines, string.format('    "avgLifetime": %.2f,\n', avgLife))
		table.insert(lines, string.format('    "avgHitDelay": %.2f,\n', hitDelay))
		table.insert(lines, string.format('    "count": %d,\n', count))
		table.insert(lines, string.format('    "minLifetime": %.2f,\n', minLife))
		table.insert(lines, string.format('    "maxLifetime": %.2f\n', maxLife))
		table.insert(lines, "  }" .. comma .. "\n")
	end
	table.insert(lines, "}")
	return table.concat(lines)
end

-- Lưu RAM buffer ra file của Map (Chỉ chạy 1 lần khi người chơi bấm nút Save)
function skillTimingManager.SaveRecordedData(targetMapName)
	targetMapName = targetMapName or selectedMap or shared.GetCurrentDungeonName() or "Unknown"
	if not (writefile and isfile) then
		notifier.Notify("Training Error", "Executor không hỗ trợ writefile!", 3)
		return false, 0
	end

	if recordedSkillCount == 0 then
		notifier.Notify("Skill Training", "Chưa có dữ liệu skill nào được ghi trong phiên chơi!", 3)
		return false, 0
	end

	local filePath = getFilePathForMap(targetMapName)
	local existingData = {}

	if isfile(filePath) then
		pcall(function()
			local raw = readfile(filePath)
			if raw and #raw > 0 then
				local parsed = HttpService:JSONDecode(raw)
				if type(parsed) == "table" then
					existingData = parsed
				end
			end
		end)
	end

	-- Merge session data vào existing data
	local mergedCount = 0
	for sName, sData in pairs(recordedSessionData) do
		local old = existingData[sName]
		if not old then
			sData.isProjectile = sData.isProjectile and true or false
			sData.skillType = sData.isProjectile and "Projectile" or "AoE"
			existingData[sName] = sData
		else
			old.count = (old.count or 1) + (sData.count or 1)
			if sData.isProjectile or old.isProjectile then
				old.isProjectile = true
				old.skillType = "Projectile"
				old.avgHitDelay = 0.0
				old.maxLifetime = math.max(old.maxLifetime or sData.maxLifetime, sData.maxLifetime)
				old.minLifetime = math.min(old.minLifetime or sData.minLifetime, sData.minLifetime)
				old.avgLifetime = math.max(old.avgLifetime or 0, sData.avgLifetime or 0)
			else
				old.isProjectile = false
				old.skillType = "AoE"
				old.avgLifetime = (old.avgLifetime + sData.avgLifetime) / 2
				old.avgHitDelay = ((old.avgHitDelay or old.avgLifetime * 0.75) + (sData.avgHitDelay or sData.avgLifetime * 0.75)) / 2
				old.minLifetime = math.min(old.minLifetime or sData.minLifetime, sData.minLifetime)
				old.maxLifetime = math.max(old.maxLifetime or sData.maxLifetime, sData.maxLifetime)
			end
		end
		mergedCount = mergedCount + 1
	end

	local saveOk = pcall(function()
		ensureFolder()
		local jsonText
		local encodeOk, encoded = pcall(serializeSkillData, existingData)
		if encodeOk and encoded and #encoded > 0 then
			jsonText = encoded
		else
			jsonText = HttpService:JSONEncode(existingData)
		end
		writefile(filePath, jsonText)
	end)

	if saveOk then
		-- Tự động nạp luôn vào bộ nhớ cho Mode 2
		skillTimingManager.LoadMapData(targetMapName)
		notifier.Notify("Skill Training", ("Đã lưu thành công %d chiêu thức vào map [%s]!"):format(mergedCount, targetMapName), 4)
		table.clear(recordedSessionData)
		recordedSkillCount = 0
		totalSamplesCount = 0
		fireChange()
		return true, mergedCount
	else
		notifier.Notify("Training Error", "Lỗi trong quá trình ghi file!", 3)
		return false, 0
	end
end

function skillTimingManager.ClearRecordedSession()
	table.clear(recordedSessionData)
	recordedSkillCount = 0
	totalSamplesCount = 0
	fireChange()
	notifier.Notify("Skill Training", "Đã xóa bộ nhớ đệm phiên huấn luyện.", 2)
end

-- In dữ liệu phiên huấn luyện (Buffer trong RAM) ra console F9
function skillTimingManager.PrintRecordedData()
	print("================ [SkillTiming] Recorded Session Buffer ================")
	local count = 0
	for name, data in pairs(recordedSessionData) do
		count = count + 1
		local tag = data.isProjectile and "🚀 Projectile" or "💥 AoE"
		print(string.format("[%d] '%s' [%s] | avgLife: %.2fs | hitDelay: %.2fs | hits: %d (min: %.2fs, max: %.2fs)",
			count, name, tag, data.avgLifetime or 0, data.avgHitDelay or 0, data.count or 1, data.minLifetime or 0, data.maxLifetime or 0))
	end
	if count == 0 then
		print("No skills recorded in current session buffer.")
	end
	print("=======================================================================")
	return count
end

-- In dữ liệu Map đã nạp vào RAM ra console F9
function skillTimingManager.PrintLoadedMapData()
	local mapName = selectedMap or shared.GetCurrentDungeonName() or "Unknown"
	print(string.format("================ [SkillTiming] Loaded RAM Data for [%s] ================", mapName))
	local count = 0
	for name, data in pairs(loadedTrainedData) do
		count = count + 1
		local tag = data.isProjectile and "🚀 Projectile" or "💥 AoE"
		print(string.format("[%d] '%s' [%s] | avgLife: %.2fs | hitDelay: %.2fs | hits: %d",
			count, name, tag, data.totalLifetime or 0, data.hitDelay or 0, data.count or 1))
	end
	if count == 0 then
		print("No trained skills loaded for this map.")
	end
	print("=======================================================================")
	return count
end

--// GETTERS & SETTERS
function skillTimingManager.SetMode(mode)
	if mode == "Default Preset" or mode == "Trained Preset" then
		currentMode = mode
		if currentMode == "Trained Preset" then
			skillTimingManager.LoadMapData(selectedMap)
		end
		fireChange()
	end
end

function skillTimingManager.GetMode()
	return currentMode
end

function skillTimingManager.SetSelectedMap(mapName)
	if mapName and #mapName > 0 then
		selectedMap = mapName
		if currentMode == "Trained Preset" then
			skillTimingManager.LoadMapData(selectedMap)
		end
		fireChange()
	end
end

function skillTimingManager.GetSelectedMap()
	if not selectedMap then
		selectedMap = shared.GetCurrentDungeonName()
		if not selectedMap or #selectedMap == 0 then
			local dList = dungeonCatalog.GetDungeons()
			selectedMap = (dList and dList[1]) or "Desert Temple"
		end
	end
	return selectedMap
end

function skillTimingManager.GetLoadedSkillCount()
	return loadedSkillCount
end

function skillTimingManager.GetRecordedSkillCount()
	return recordedSkillCount
end

function skillTimingManager.GetTotalSamplesCount()
	return totalSamplesCount
end

function skillTimingManager.GetDefaultPresets()
	return DEFAULT_PRESETS
end

function skillTimingManager.OnChanged(callback)
	if type(callback) == "function" then
		table.insert(changeListeners, callback)
	end
end

-- Tự động nhận diện map khi vào Dungeon mới
task.spawn(function()
	while true do
		local curDungeon = shared.GetCurrentDungeonName()
		if curDungeon and curDungeon ~= selectedMap and currentMode == "Trained Preset" then
			selectedMap = curDungeon
			skillTimingManager.LoadMapData(curDungeon)
		end
		task.wait(2.0)
	end
end)

return skillTimingManager
end function __DIST.m()-- Smart Dodge – Module 2: Geometry & Hazard Hit-testing (DungeonQuest).
-- Các "thuật toán chấm điểm": isPointInPart (OBB), ring bán nguyệt phân cực, hành lang
-- projectile, isPointInAnyHazard, getFloorPosition. Data hiểm họa được Engine bơm vào qua
-- BindDetection (đứt vòng phụ thuộc detection -> geometry), nên module thuần số học + logic.

--// References

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

--// State
local playerHitboxPadding = 1.8     -- Bù trừ bán kính cơ thể nhân vật (studs) để phát hiện khi chạm mép
local RAYCAST_DOWN_DIST = 150       -- Khoảng cách bắn raycast xuống mặt đất (studs) - đủ sâu để bắt sàn từ độ cao của Boss
local MAX_HEIGHT_TOLERANCE = 150.0  -- Chiêu trong Dungeon Quest gây sát thương toàn bộ cột không gian X-Z bất kể độ cao

--// Data source hiểm họa do Engine bơm vào (tránh require trực tiếp detection — đứt vòng phụ thuộc).
local data = nil

local geometry = {}

function geometry.BindDetection(dataSource)
	data = dataSource or nil
end

local function det()
	return data
end

function geometry.GetHitboxPadding()
	return playerHitboxPadding
end

function geometry.SetHitboxPadding(value)
	if type(value) == "number" and value >= 0 then
		playerHitboxPadding = value
	end
end

--// Raycast Parameters dùng chung
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Exclude
raycastParams.IgnoreWater = true

local cachedIgnoreList = {}
local lastFilterRebuildTime = 0

local function updateRaycastFilter(force)
	local now = os.clock()
	if not force and (now - lastFilterRebuildTime < 0.25) then
		return
	end
	lastFilterRebuildTime = now

	table.clear(cachedIgnoreList)
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Character then table.insert(cachedIgnoreList, p.Character) end
	end
	if Workspace:FindFirstChild("RaycastIgnore") then
		table.insert(cachedIgnoreList, Workspace.RaycastIgnore)
	end
	for inst in pairs(det().GetActiveHazardsMap()) do
		table.insert(cachedIgnoreList, inst)
	end
	raycastParams.FilterDescendantsInstances = cachedIgnoreList
end

local player = Players.LocalPlayer

--// Bắn raycast kiểm tra sàn nhà và snap tọa độ xuống mặt đất
function geometry.GetFloorPosition(pos)
	updateRaycastFilter(false)

	local rayOrigin = Vector3.new(pos.X, pos.Y + 10, pos.Z)
	local rayDir = Vector3.new(0, -RAYCAST_DOWN_DIST, 0)
	local result = Workspace:Raycast(rayOrigin, rayDir, raycastParams)

	if result and result.Position then
		return Vector3.new(pos.X, result.Position.Y + 3, pos.Z), true
	end
	return pos, false
end

--// Bắn raycast kiểm tra sàn nhà và trả về cao độ Y thực tế của mặt sàn (không cộng offset +3)
function geometry.GetRawFloorY(pos)
	updateRaycastFilter(false)

	local rayOrigin = Vector3.new(pos.X, pos.Y + 12, pos.Z)
	local rayDir = Vector3.new(0, -RAYCAST_DOWN_DIST, 0)
	local result = Workspace:Raycast(rayOrigin, rayDir, raycastParams)

	if result and result.Position then
		return result.Position.Y, true
	end

	-- Fallback kiểm tra dưới chân Player
	local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if rootPart then
		local pOrigin = Vector3.new(pos.X, rootPart.Position.Y + 8, pos.Z)
		local pResult = Workspace:Raycast(pOrigin, rayDir, raycastParams)
		if pResult and pResult.Position then
			return pResult.Position.Y, true
		end
		return rootPart.Position.Y - 2.8, false
	end

	return pos.Y, false
end

--// Kiểm tra xem điểm P có nằm trong hành lang quỹ đạo của một Projectile Part không
function geometry.IsPointInTrajectory(point, part)
	local det = det()
	local data = det.GetLockedProjectiles()[part]
	if not data then
		data = det.LockTrajectoryForPart and det.LockTrajectoryForPart(part)
	end
	if not data then return false end

	local origin = part.Position
	local forward = data.forward2D
	local maxDist = data.maxLookahead
	local radius = data.dangerRadius

	local toPoint = point - origin
	local toPoint2D = Vector3.new(toPoint.X, 0, toPoint.Z)
	local dotForward = toPoint2D:Dot(forward)

	if data.config and data.config.isDynamicMoving then
		-- Với Dynamic Moving Beam (vùng màu cam di động quét sàn thời gian thực):
		-- Giới hạn chiều sâu từ phía sau beam -4 studs đến trước beam +maxDist
		if dotForward < -4 or dotForward > (maxDist + 2) then
			return false
		end

		local projOnAxis = forward * dotForward
		local perpVec = toPoint2D - projOnAxis
		local perpDist = perpVec.Magnitude

		local checkY = data.lockedVisualY or (data.rawFloorY and (data.rawFloorY + 2.8)) or origin.Y
		local heightDiff = math.abs(point.Y - checkY)
		if heightDiff > MAX_HEIGHT_TOLERANCE then
			return false
		end

		if perpDist <= (radius + playerHitboxPadding) then
			return true, perpDist, radius, forward, origin, maxDist
		end
		return false
	end

	-- Điểm P phải nằm trong khoảng từ ngay sau đạn (-radius) tới hết tầm maxDist
	if dotForward < -radius or dotForward > maxDist then
		return false
	end

	local projOnAxis = forward * dotForward
	local perpVec = toPoint2D - projOnAxis
	local perpDist = perpVec.Magnitude

	-- Kiểm tra độ cao Y theo độ cao sàn đã khóa (Raw Floor Y) của chiêu
	local checkY = data.rawFloorY and (data.rawFloorY + 2.8) or origin.Y
	local heightDiff = math.abs(point.Y - checkY)
	if heightDiff > MAX_HEIGHT_TOLERANCE then
		return false
	end

	if perpDist <= (radius + playerHitboxPadding) then
		return true, perpDist, radius, forward, origin, maxDist
	end

	return false
end

--// Kiểm tra xem một điểm P có nằm trong phạm vi sát thương của một BasePart không
function geometry.IsPointInPart(point, part)
	if not part or not part:IsA("BasePart") or not part.Parent or det().IsIgnoredPart(part) then
		return false
	end

	-- 1. Dạng hình cầu / hình trụ (Circle / Ball / Cylinder AoE)
	if part:IsA("Part") and (part.Shape == Enum.PartType.Ball or part.Shape == Enum.PartType.Cylinder) then
		local radius = math.max(part.Size.X, part.Size.Z) / 2 + playerHitboxPadding
		local dX = point.X - part.Position.X
		local dZ = point.Z - part.Position.Z
		local distSq = dX * dX + dZ * dZ
		local heightDiff = math.abs(point.Y - part.Position.Y)
		return (distSq <= radius * radius) and (heightDiff <= MAX_HEIGHT_TOLERANCE)
	end

	-- 2. Dạng Moving Beam (secondBossMovingBeam) xoay lộn quanh trục X:
	local isMovingBeam = part.Name:lower():find("movingbeam") or (part.Parent and part.Parent.Name:lower():find("movingbeam"))
	if isMovingBeam then
		local localPos = part.CFrame:PointToObjectSpace(point)
		-- Chiều dài thanh beam dọc theo trục X (vùng sải ngang quét qua phòng):
		local halfLength = math.max(part.Size.X, part.Size.Z) / 2 + playerHitboxPadding
		-- Bán kính tiết diện xoay quanh trục X (đường kính thanh beam):
		local beamRadius = math.max(part.Size.Y, math.min(part.Size.X, part.Size.Z)) / 2 + playerHitboxPadding
		if beamRadius < 3.5 then beamRadius = 3.5 end

		-- Khoảng cách vuông góc với trục beam trong mặt phẳng Y-Z (miễn nhiễm với góc xoay lộn quanh trục X):
		local radialDistSq = localPos.Y * localPos.Y + localPos.Z * localPos.Z
		local heightDiff = math.abs(point.Y - part.Position.Y)

		return (math.abs(localPos.X) <= halfLength)
			and (radialDistSq <= (beamRadius + 1.5) * (beamRadius + 1.5))
			and (heightDiff <= MAX_HEIGHT_TOLERANCE)
	end

	-- 3. Dạng hình chữ nhật / hộp có hướng (Oriented Bounding Box - OBB)
	local localPos = part.CFrame:PointToObjectSpace(point)
	local halfX = part.Size.X / 2 + playerHitboxPadding
	local halfZ = part.Size.Z / 2 + playerHitboxPadding
	local halfY = math.max(MAX_HEIGHT_TOLERANCE, part.Size.Y / 2 + 5)

	return math.abs(localPos.X) <= halfX
		and math.abs(localPos.Z) <= halfZ
		and math.abs(localPos.Y) <= halfY
end

--// Kiểm tra xem một điểm P có nằm trong vành khuyên / bán nguyệt của một UnionOperation 'ring' không
function geometry.IsPointInRingPart(point, ringPart)
	if not ringPart or not ringPart:IsA("BasePart") or not ringPart.Parent or det().IsIgnoredPart(ringPart) then
		return false
	end

	-- 1. Xác định tâm thực của cả Model (Center Part)
	local centerPart = ringPart.Parent:FindFirstChild("center")
		or ringPart.Parent:FindFirstChild("Center")
	local centerPos = centerPart and centerPart.Position or ringPart.Position

	-- 2. Kiểm tra độ cao Y
	local heightDiff = math.abs(point.Y - centerPos.Y)
	if heightDiff > MAX_HEIGHT_TOLERANCE then
		return false
	end

	-- 3. Đưa tọa độ điểm P và vị trí Ring về mặt phẳng 2D (X-Z)
	local diffX = point.X - centerPos.X
	local diffZ = point.Z - centerPos.Z
	local r = math.sqrt(diffX * diffX + diffZ * diffZ)

	-- 4. Bán kính ngoài thực tế của Ring từ kích thước Size.Z (Size = Diameter x Height x Radius)
	local radiusOuter = ringPart.Size.Z
	if radiusOuter < 1 then
		radiusOuter = math.max(ringPart.Size.X, ringPart.Size.Z) / 2
	end

	-- Bề dày dải Cyan: 12.5 studs cho các ring 1-6 (Size.X: 50, 75, 100, 125, 150, 175) và 17.5 studs cho ring 7 (Size.X: 210)
	local bandThickness = (radiusOuter > 90) and 18.0 or 13.0
	local radiusInner = math.max(0, radiusOuter - bandThickness)

	-- 5. Kiểm tra khoảng rỗng ở giữa: Nếu r nằm trong lỗ trống -> AN TOÀN!
	if r < radiusInner - playerHitboxPadding then
		return false
	end

	-- 6. Nếu r vượt quá bán kính ngoài -> Nằm ngoài Ring này
	if r > radiusOuter + playerHitboxPadding then
		return false
	end

	-- 7. Kiểm tra hướng bán nguyệt bằng Tích Vô Hướng (Vector Dot Product):
	local offX = ringPart.Position.X - centerPos.X
	local offZ = ringPart.Position.Z - centerPos.Z
	local offMag = math.sqrt(offX * offX + offZ * offZ)

	if offMag > 0.5 then
		local dirUnitX = offX / offMag
		local dirUnitZ = offZ / offMag
		local dot = (diffX * dirUnitX) + (diffZ * dirUnitZ)

		-- Nếu dot < -playerHitboxPadding -> Nằm ở nửa đối diện (Khoảng đất trống an toàn 100%)
		if dot < -playerHitboxPadding then
			return false
		end
	end

	return true, r, radiusInner, radiusOuter, centerPos, ringPart.CFrame
end

--// Kiểm tra xem điểm P có bị dính bất kỳ vòng nào trong Model thirdBossMultiRings không
function geometry.IsPointInThirdBossMultiRings(point, hazardInfo)
	if not hazardInfo or not hazardInfo.Instance or not hazardInfo.Instance.Parent then
		return false, nil
	end

	local fadeThreshold = det().GetFadeThreshold()

	if hazardInfo.ActiveParts then
		for part in pairs(hazardInfo.ActiveParts) do
			if part and part.Parent and part:IsA("BasePart") and part.Transparency < fadeThreshold then
				local inRing = geometry.IsPointInRingPart(point, part)
				if inRing then
					return true, part
				end
			end
		end
	end

	return false, nil
end

--// Kiểm tra xem điểm P có nằm trong vùng nguy hiểm của Model secondBossMovingBeam không
function geometry.IsPointInSecondBossMovingBeam(point, hazardInfo)
	if not hazardInfo or not hazardInfo.Instance or not hazardInfo.Instance.Parent then
		return false, nil, nil
	end

	local inst = hazardInfo.Instance
	local det = det()
	local trajData = det.GetLockedProjectiles()[inst]
	if not trajData and det.LockSecondBossMovingBeam then
		trajData = det.LockSecondBossMovingBeam(inst)
	end
	if not trajData and det.LockBossOrb then
		trajData = det.LockBossOrb(inst)
	end
	if not trajData then
		return false, nil, nil
	end

	local primary = inst:IsA("Model") and inst:FindFirstChildWhichIsA("BasePart") or (inst:IsA("BasePart") and inst)
	local curPos = (primary and primary.Position) or (inst:IsA("Model") and select(1, inst:GetBoundingBox()).Position) or inst.Position

	if trajData.isBossOrb then
		-- Boss 2 Orb là quả cầu bám đuổi (chỉ gây nổ tử thần khi va chạm trong cự ly gần <= radius + padding).
		-- TUYỆT ĐỐI KHÔNG coi toàn bộ hành lang 50-80 studs nối từ quả cầu tới Player là vùng nguy hiểm hình học!
		-- (Vì nếu coi cả dải nối là hazard thì Player luôn bị dính hazard, và khi né chiêu khác tia này sẽ quét qua
		-- làm biến mất điểm an toàn luân phiên -> gây giật giật giậm chân tại chỗ).
		local toPoint = point - curPos
		local toPoint2D = Vector3.new(toPoint.X, 0, toPoint.Z)
		local distToOrb = toPoint2D.Magnitude
		local orbDangerRadius = (trajData.dangerRadius or 5.0) + playerHitboxPadding
		if distToOrb <= orbDangerRadius then
			local checkY = trajData.lockedVisualY or curPos.Y
			local heightDiff = math.abs(point.Y - checkY)
			if heightDiff <= MAX_HEIGHT_TOLERANCE then
				local hitPart = primary or (inst:IsA("Model") and inst:FindFirstChildWhichIsA("BasePart")) or inst
				local foundTraj = {
					isTrajectory = true,
					isDynamicMoving = true,
					isBossOrb = true,
					perpDist = distToOrb,
					dangerRadius = trajData.dangerRadius or 5.0,
					forward2D = trajData.forward2D or Vector3.new(0, 0, -1),
					originPos = curPos,
					maxLookahead = orbDangerRadius,
				}
				return true, hitPart, foundTraj
			end
		end
		return false, nil, nil
	end

	local forward = trajData.forward2D or Vector3.new(0, 0, -1)
	local radius = trajData.dangerRadius or 25.0
	local maxDist = trajData.maxLookahead or 50.0

	local toPoint = point - curPos
	local toPoint2D = Vector3.new(toPoint.X, 0, toPoint.Z)
	local dotForward = toPoint2D:Dot(forward)

	-- Chiều sâu tịnh tiến: từ sau hazard (-4 studs) đến trước hazard +maxDist
	if dotForward < -4 or dotForward > (maxDist + 2) then
		return false, nil, nil
	end

	local projOnAxis = forward * dotForward
	local perpVec = toPoint2D - projOnAxis
	local perpDist = perpVec.Magnitude

	local checkY = trajData.lockedVisualY or curPos.Y
	local heightDiff = math.abs(point.Y - checkY)
	if heightDiff > MAX_HEIGHT_TOLERANCE then
		return false, nil, nil
	end

	if perpDist <= (radius + playerHitboxPadding) then
		local hitPart = primary or (inst:IsA("Model") and inst:FindFirstChildWhichIsA("BasePart")) or inst
		local foundTraj = {
			isTrajectory = true,
			isDynamicMoving = true,
			perpDist = perpDist,
			dangerRadius = radius,
			forward2D = forward,
			originPos = curPos,
			maxLookahead = maxDist,
		}
		return true, hitPart, foundTraj
	end

	return false, nil, nil
end

--// Kiểm tra xem một điểm P có đang bị dính bất kỳ mối nguy hiểm nào không
function geometry.IsPointInAnyHazard(point, ignoredInstance)
	local det = det()
	local bestDistSq = math.huge
	local foundInfo, foundPart = nil, nil
	local foundTraj = nil

	for _, info in pairs(det.GetActiveHazardsMap()) do
		if ignoredInstance then
			if info.Instance == ignoredInstance
				or (info.Instance and info.Instance.Name == ignoredInstance.Name)
				or (info.Name and info.Name == ignoredInstance.Name) then
				continue
			end
		end

		local isMultiRings = info.Name and info.Name:lower():find("multiring") ~= nil
		local isMovingBeam = info.Instance and info.Instance:IsA("Model") and (
			(info.Name and info.Name:lower():find("movingbeam") ~= nil)
			or (info.Instance.Name and info.Instance.Name:lower():find("movingbeam") ~= nil)
		)
		local isMovingHazard = isMovingBeam or (info.Instance and det.GetLockedProjectiles()[info.Instance] ~= nil)

		if isMultiRings then
			-- ÁP DỤNG THỬ NGHIỆM 2: Giải Tích Tọa Độ Cực (Polar Annulus) RIÊNG CHO thirdBossMultiRings
			local inRing, hitPart = geometry.IsPointInThirdBossMultiRings(point, info)
			if inRing then
				local distSq = (point - hitPart.Position).Magnitude
				if distSq < bestDistSq then
					bestDistSq = distSq
					foundInfo = info
					foundPart = hitPart
					foundTraj = nil
				end
			end
		elseif isMovingHazard then
			-- ÁP DỤNG XỬ LÝ CẤP MODEL CHO secondBossMovingBeam & Boss Orbs
			local inBeam, hitPart, trajData = geometry.IsPointInSecondBossMovingBeam(point, info)
			if inBeam then
				local distSq = (point - (hitPart and hitPart.Position or info.Instance.Position)).Magnitude
				if distSq < bestDistSq then
					bestDistSq = distSq
					foundInfo = info
					foundPart = hitPart or info.Instance
					foundTraj = trajData
				end
			end
		elseif info.ActiveParts then
			for part in pairs(info.ActiveParts) do
				if ignoredInstance and (part == ignoredInstance or part.Name == ignoredInstance.Name) then
					continue
				end
				local trajConfig = det.GetTrajectoryConfigForPart(part)
				if trajConfig then
					local inTraj, perpDist, radius, forward, origin, maxDist = geometry.IsPointInTrajectory(point, part)
					if inTraj then
						local distSq = (point - part.Position).Magnitude
						if distSq < bestDistSq then
							bestDistSq = distSq
							foundInfo = info
							foundPart = part
							foundTraj = {
								isTrajectory = true,
								perpDist = perpDist,
								dangerRadius = radius,
								forward2D = forward,
								originPos = origin,
								maxLookahead = maxDist,
							}
						end
					end
				else
					-- Các skill khác dùng OBB / Radius thông thường
					if geometry.IsPointInPart(point, part) then
						local distSq = (point - part.Position).Magnitude
						if distSq < bestDistSq then
							bestDistSq = distSq
							foundInfo = info
							foundPart = part
							foundTraj = nil
						end
					end
				end
			end
		end
	end

	if foundPart then
		return true, foundInfo, foundPart, foundTraj
	end
	return false, nil, nil, nil
end

--// Kiểm tra xem một đĩa tròn quanh điểm P có hoàn toàn an toàn (không chạm bất kỳ hazard nào) không
--// Cấu hình Cân Bằng (Balanced): Kiểm tra tâm (fast reject) + 4 hướng chính ở bán kính safeRadius
local CHECK_OFFSETS_4 = {
	Vector3.new(1, 0, 0),
	Vector3.new(-1, 0, 0),
	Vector3.new(0, 0, 1),
	Vector3.new(0, 0, -1),
}

function geometry.IsSpotFullySafe(centerPoint, safeRadius, ignoredInstance)
	if not centerPoint then return false end
	safeRadius = safeRadius or 0.5

	-- 1. Kiểm tra chính tâm điểm P (Loại bỏ ngay 90% điểm không hợp lệ mà không tốn thêm CPU)
	if geometry.IsPointInAnyHazard(centerPoint, ignoredInstance) then
		return false
	end

	-- 2. Kiểm tra 4 hướng chính ở chu vi an toàn
	for _, off in ipairs(CHECK_OFFSETS_4) do
		local sample = centerPoint + (off * safeRadius)
		if geometry.IsPointInAnyHazard(sample, ignoredInstance) then
			return false
		end
	end

	return true
end

--// Lấy danh sách tất cả các Hazard Instance đang bao phủ điểm P (hỗ trợ nhiều chiêu đè nhau)
function geometry.GetAllHazardsAtPoint(point)
	local det = det()
	local hazardsSet = {}
	local count = 0

	for _, info in pairs(det.GetActiveHazardsMap()) do
		local isMultiRings = info.Name and info.Name:lower():find("multiring") ~= nil
		if isMultiRings then
			local inRing, hitPart = geometry.IsPointInThirdBossMultiRings(point, info)
			if inRing then
				hazardsSet[hitPart] = true
				if info.Instance then hazardsSet[info.Instance] = true end
				count = count + 1
			end
		elseif info.Instance and info.Instance:IsA("Model") and (
			(info.Name and info.Name:lower():find("movingbeam") ~= nil)
			or (info.Instance.Name and info.Instance.Name:lower():find("movingbeam") ~= nil)
		) then
			local inBeam, hitPart = geometry.IsPointInSecondBossMovingBeam(point, info)
			if inBeam then
				hazardsSet[hitPart or info.Instance] = true
				if info.Instance then hazardsSet[info.Instance] = true end
				count = count + 1
			end
		elseif info.ActiveParts then
			for part in pairs(info.ActiveParts) do
				local trajConfig = det.GetTrajectoryConfigForPart(part)
				if trajConfig then
					local inTraj = geometry.IsPointInTrajectory(point, part)
					if inTraj then
						hazardsSet[part] = true
						if info.Instance then hazardsSet[info.Instance] = true end
						if part.Parent and part.Parent ~= Workspace then hazardsSet[part.Parent] = true end
						count = count + 1
					end
				else
					if geometry.IsPointInPart(point, part) then
						hazardsSet[part] = true
						if info.Instance then hazardsSet[info.Instance] = true end
						if part.Parent and part.Parent ~= Workspace then hazardsSet[part.Parent] = true end
						count = count + 1
					end
				end
			end
		end
	end

	return hazardsSet, count
end

--// Kiểm tra xem đoạn đường di chuyển từ fromPos -> toPos có an toàn không (Path Clearance)
--// currentHazardsSet: tập hợp các Hazard mà người chơi ĐANG ĐỨNG TRONG (được phép băng qua để thoát ra)
function geometry.IsPathSafe(fromPos, toPos, currentHazardsSet, fallbackCurrentDangerPart, ignoredInstance)
	local dist = (toPos - fromPos).Magnitude
	if dist <= 1.2 then
		return true -- Chỉ bỏ qua bước cực ngắn <= 1.2 studs
	end

	-- Bước chia mẫu 1.8 studs (nhỏ hơn hitbox người chơi 2.5 studs, tối đa 32 bước để không bỏ lọt bất kỳ chiêu nào trên đường dài)
	local steps = math.clamp(math.ceil(dist / 1.8), 2, 32)
	for i = 1, steps - 1 do
		local t = i / steps
		local samplePos = fromPos:Lerp(toPos, t)
		local inDanger, hitInfo, hitPart, hitTraj = geometry.IsPointInAnyHazard(samplePos, ignoredInstance)
		if inDanger then
			local hitInst = (hitInfo and hitInfo.Instance)
			local hitParent = hitPart and hitPart.Parent

			local isKnown = false
			if currentHazardsSet and next(currentHazardsSet) ~= nil then
				isKnown = (hitPart and currentHazardsSet[hitPart])
					or (hitInst and currentHazardsSet[hitInst])
					or (hitParent and currentHazardsSet[hitParent])
			elseif fallbackCurrentDangerPart then
				local currentInst = fallbackCurrentDangerPart:IsA("Model") and fallbackCurrentDangerPart or fallbackCurrentDangerPart.Parent
				isKnown = (hitPart and hitPart == fallbackCurrentDangerPart)
					or (currentInst and hitInst and currentInst == hitInst)
					or (currentInst and hitParent and currentInst == hitParent)
			end

			-- 1. Nếu trúng đạn bắn (Projectile Trajectory) MỚI mà người chơi KHÔNG đứng trong đó -> Tuyệt đối không băng qua
			--    Nếu là chính Trajectory mà người chơi đang đứng trong đó -> Cho phép bước ra khỏi mép!
			if hitTraj and hitTraj.isTrajectory and not isKnown then
				return false
			end

			-- 2. Nếu trúng một Hazard MỚI mà người chơi KHÔNG đứng trong đó -> Bị cản đường, từ chối ngay
			if not isKnown then
				return false
			end
		end
	end
	return true
end

return geometry end function __DIST.n()-- Smart Dodge – Module 1: Threat Detection Engine (DungeonQuest).
-- Chuyên trách: quét Workspace Depth 1, nhận diện hiểm họa (Neon / ngoại lệ), khóa quỹ đạo
-- projectile, SelectionBox ESP, hành lang quỹ đạo cảnh báo, registry tên skill player.
-- State riêng: activeHazards, lockedProjectiles, activeTrajectoryVisuals, các flag debug.

--// Imports

local services = __DIST.load('e')
local shared = __DIST.load('f')
local macLib = __DIST.load('a')
local lifecycle = __DIST.load('b')
local skillTimingManager = __DIST.load('l')

--// Lazy require Module Geometry (tránh vòng phụ thuộc: geometry đọc data detection qua lazy quay lại)
local geometryRef
local function getGeometry()
	if not geometryRef then
		geometryRef = __DIST.load('m')
	end
	return geometryRef
end

--// References
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local player = services.player

--// Table
local detection = {}

--// State
local threatDetectorEnabled = false
local logHazards = false
local visualEspEnabled = true
local showSkillTimers = true
local autoLearnSkillLifetimes = true
local activeHazards = {} -- [Instance] = { Name, Class, Position, Distance, NeonCount, Connections, ActiveParts, Highlight, Caster, CasterHumanoid, TimerBillboard, TimerLabel, TimerStroke }
local hazardCount = 0
local hazardChangedCallbacks = {}
local lastHazardInfo = nil
local connections = {}
local sharedCleanups = {}

--// Bảng cơ sở dữ liệu thời gian sống học được từ các kỹ năng (Skill Lifetime Profiler)
local skillProfiles = {} -- [string skillName] = { count = number, avgLifetime = number, minLifetime = number, maxLifetime = number }

--// Các mốc thời gian sống chuẩn mặc định của kỹ năng Boss trong Dungeon Quest (giây): { hitDelay, totalLifetime }
local KNOWN_SKILL_LIFETIMES = {
	["smallIceSpikes"] = { hitDelay = 0.8, totalLifetime = 1.2 },
	["mediumIceSpikes"] = { hitDelay = 1.1, totalLifetime = 1.5 },
	["largeIceSpikes"] = { hitDelay = 1.4, totalLifetime = 1.8 },
	["thirdBossMultiRings"] = { hitDelay = 2.0, totalLifetime = 2.8 },
	["firstBossCrissCross"] = { hitDelay = 1.6, totalLifetime = 2.2 },
	["firstBossSeekingSpikes"] = { hitDelay = 1.8, totalLifetime = 2.5 },
	["firstBossBigSpike"] = { hitDelay = 1.5, totalLifetime = 2.0 },
	["firstBossBeamPart"] = { hitDelay = 1.5, totalLifetime = 2.0 },
	["secondBossMovingBeam"] = { hitDelay = 0.0, totalLifetime = 3.5 },
	["secondbossyelloworb"] = { hitDelay = 0.0, totalLifetime = 4.0 },
	["secondbossredorb"] = { hitDelay = 0.0, totalLifetime = 4.0 },
	["secondbossgreenorb"] = { hitDelay = 0.0, totalLifetime = 4.0 },
}

local ignoredSkillNames = {
	["DodgeNode_ESP"] = true,
	["Enhanced Aura Ring"] = true,
	["EnhancedAuraRing"] = true,
	["Enhanced Aura"] = true,
	["EnhancedAura"] = true,
	["Aura Ring"] = true,
	["AuraRing"] = true,
	["AuraRingMesh"] = true,
	["groundAura"] = true,
	["GroundAura"] = true,
	["Ground Aura"] = true,
	["ground aura"] = true,
}

--// Danh sách các skill ngoại lệ (không dùng Material Neon, ví dụ có child precast bằng Plastic)
local CUSTOM_HAZARD_EXCEPTIONS = {
	["largeIceSpikes"] = true,
	["mediumIceSpikes"] = true,
	["smallIceSpikes"] = true,
	["thirdBossMultiRings"] = true,
	["thirdBossMissile"] = true,
	["thirdBossBeamPart"] = true,
	["firstBossCrissCross"] = true,
	["firstBossSeekingSpikes"] = true,
	["firstBossBigSpike"] = true,
	["firstBossBeamPart"] = true,
	["secondBossMovingBeam"] = true,
	["secondbossyelloworb"] = true,
	["secondbossredorb"] = true,
	["secondbossgreenorb"] = true,
}

--// Ngưỡng coi như chiêu đã mờ hoàn toàn/kết thúc
local FADE_TRANSPARENCY_THRESHOLD = 0.85

--// Danh sách các đối tượng Workspace cấp 1 cần bỏ qua
local IGNORED_NAMES = {
	["dungeon"] = true,
	["Dungeon"] = true,
	["Terrain"] = true,
	["Camera"] = true,
	["CurrentCamera"] = true,
	["RaycastIgnore"] = true,
	["Drops"] = true,
	["Loot"] = true,
	["DodgeNode_ESP"] = true,
	["SmartDodge_SafeMarker"] = true,
	["SmartDodge_SelectionBox"] = true,
	["SmartDodge_TrajectoryBox"] = true,
	["SmartDodge_CrystalGuideBox"] = true,
	["secondBossCrystals"] = true,
	["secondbosscrystals"] = true,
	["Enhanced Aura Ring"] = true,
	["EnhancedAuraRing"] = true,
	["Enhanced Aura"] = true,
	["EnhancedAura"] = true,
	["Aura Ring"] = true,
	["AuraRing"] = true,
	["groundAura"] = true,
	["GroundAura"] = true,
	["Ground Aura"] = true,
	["ground aura"] = true,
}

--// Cấu hình nhận diện Boss 2 Orbs (Northern Lands / Winter Outpost)
local BOSS_ORB_CONFIGS = {
	["secondbossyelloworb"] = {
		colorName = "yellow",
		color = Color3.fromRGB(255, 230, 0),
		surfaceColor = Color3.fromRGB(255, 215, 0),
	},
	["secondbossredorb"] = {
		colorName = "red",
		color = Color3.fromRGB(255, 45, 45),
		surfaceColor = Color3.fromRGB(255, 30, 30),
	},
	["secondbossgreenorb"] = {
		colorName = "green",
		color = Color3.fromRGB(50, 255, 50),
		surfaceColor = Color3.fromRGB(40, 220, 40),
	},
}

--// Cấu hình các kỹ năng Projectile dạng quỹ đạo bắn thẳng (Trajectory / Corridor Telegraph)
--// Lưu ý: dangerRadius ở đây chỉ là sàn an toàn tối thiểu (fallback floor). Hệ thống sẽ tự động
--// bóc tách kích thước thật (Beam.Width0, Mesh.Scale, Part.Size) qua Auto Dimension Detection.
local TRAJECTORY_PROJECTILE_CONFIGS = {
	["firstbosscrisscross"] = {
		name = "firstBossCrissCross",
		dangerRadius = 4.0,       -- Sàn an toàn tối thiểu (sẽ tự động mở rộng theo kích thước thật)
		maxLookahead = nil,       -- Tự động đo độ dài hoặc dùng trajectoryLookahead động
		visualColor = Color3.fromRGB(255, 130, 0), -- Màu cam cho quỹ đạo
	},
	["firstbossseekingspikes"] = {
		name = "firstBossSeekingSpikes",
		dangerRadius = 4.0,       -- Sàn an toàn tối thiểu
		maxLookahead = nil,       -- Chiều dài hành lang dự đoán
		visualColor = Color3.fromRGB(255, 110, 0), -- Màu cam đậm cho Seeking Spikes
	},
	["firstbossbigspike"] = {
		name = "firstBossBigSpike",
		dangerRadius = 20.0,      -- Beam.Width0 = 40 studs -> bán kính 20 studs (tổng bề rộng 40 studs)
		maxLookahead = 140.0,     -- Chiều dài hành lang dự đoán xuyên phòng
		visualColor = Color3.fromRGB(255, 130, 0), -- Màu cam cho Big Spike
	},
	["firstbossbeampart"] = {
		name = "firstBossBeamPart",
		dangerRadius = 20.0,      -- Beam.Width0 = 40 studs -> bán kính 20 studs (tổng bề rộng 40 studs)
		maxLookahead = 140.0,     -- Chiều dài hành lang dự đoán
		visualColor = Color3.fromRGB(255, 130, 0), -- Màu cam cho Beam Telegraph
	},
	["secondbossmovingbeam"] = {
		name = "secondBossMovingBeam",
		dangerRadius = 25.0,      -- Sàn an toàn nửa độ rộng sải ngang beam (tự động đọc sải ngang thật ~50 studs)
		maxLookahead = nil,       -- Dùng chung setting Tra lookahead length động (từ slider UI)
		visualColor = Color3.fromRGB(255, 130, 0), -- Màu cam cho Moving Beam
		isDynamicMoving = true,   -- Đánh dấu là Dynamic Moving Hazard (Tiếp cận 2)
	},
	["secondbossyelloworb"] = {
		name = "secondBossYellowOrb",
		dangerRadius = 5.0,       -- Bán kính vùng nguy hiểm cơ bản của Orb
		maxLookahead = 22.0,      -- Chiều dài hành lang dự đoán phía trước hướng di chuyển
		visualColor = Color3.fromRGB(255, 130, 0), -- Vùng màu cam cảnh báo quỹ đạo
		isDynamicMoving = true,
		isBossOrb = true,
		orbColorName = "yellow",
	},
	["secondbossredorb"] = {
		name = "secondBossRedOrb",
		dangerRadius = 5.0,
		maxLookahead = 22.0,
		visualColor = Color3.fromRGB(255, 130, 0),
		isDynamicMoving = true,
		isBossOrb = true,
		orbColorName = "red",
	},
	["secondbossgreenorb"] = {
		name = "secondBossGreenOrb",
		dangerRadius = 5.0,
		maxLookahead = 22.0,
		visualColor = Color3.fromRGB(255, 130, 0),
		isDynamicMoving = true,
		isBossOrb = true,
		orbColorName = "green",
	},
	["thirdbossmissile"] = {
		name = "thirdBossMissile",
		dangerRadius = 6.0,       -- Bán kính vùng nguy hiểm cơ bản (tự động đọc Beam/Part size)
		maxLookahead = 140.0,     -- Chiều dài hành lang dự đoán xuyên phòng
		visualColor = Color3.fromRGB(255, 130, 0), -- Màu cam cảnh báo quỹ đạo
	},
	["thirdbossbeampart"] = {
		name = "thirdBossBeamPart",
		dangerRadius = 6.0,       -- Bán kính vùng nguy hiểm của tia laser báo trước
		maxLookahead = 140.0,
		visualColor = Color3.fromRGB(255, 130, 0),
	},
}

--// Cấu hình động cho hành lang quỹ đạo đạn (Trajectory Tuning)
local trajectoryLookahead = 50.0          -- Chiều dài hành lang dự đoán (mặc định 50 studs thay vì 300 để tránh tắc map)
local trajectoryWidthPadding = 2.5        -- Khoảng đệm nới rộng 2 bên sườn dựa trên kích thước thật của chiêu (studs)

--// Bảng lưu trữ trạng thái khóa hướng quỹ đạo (Direction Locking & State Tracking)
local lockedProjectiles = {} -- [BasePart] = { originPos, forward2D, dangerRadius, maxLookahead, locked, config }
local activeTrajectoryVisuals = {} -- [BasePart] = Part

--// Getters/Setters cho cấu hình Trajectory
detection.SetTrajectoryLookahead = function(val)
	if type(val) == "number" and val >= 10 then
		trajectoryLookahead = val
	end
end

detection.GetTrajectoryLookahead = function()
	return trajectoryLookahead
end

detection.SetTrajectoryWidthPadding = function(val)
	if type(val) == "number" and val >= 0 then
		trajectoryWidthPadding = val
	end
end

detection.GetTrajectoryWidthPadding = function()
	return trajectoryWidthPadding
end

--// Getters nội bộ cho geometry (tránh vòng phụ thuộc detection -> geometry: geometry đọc qua lazy require).
detection.GetActiveHazardsMap = function()
	return activeHazards
end

detection.GetLockedProjectiles = function()
	return lockedProjectiles
end

detection.GetFadeThreshold = function()
	return FADE_TRANSPARENCY_THRESHOLD
end

detection.IsEnabled = function()
	return threatDetectorEnabled
end

detection.SetEnabled = function(state)
	threatDetectorEnabled = state and true or false
end

--// Xóa toàn bộ visual quỹ đạo + lock data (dùng khi stop loop / shutdown)
detection.ClearTrajectoryVisuals = function()
	for part, vPart in pairs(activeTrajectoryVisuals) do
		pcall(function() vPart:Destroy() end)
	end
	table.clear(activeTrajectoryVisuals)
	table.clear(lockedProjectiles)
end

--// Thêm một Skill vào danh sách ngoại lệ
function detection.AddCustomHazard(skillName)
	if type(skillName) == "string" and #skillName > 0 then
		CUSTOM_HAZARD_EXCEPTIONS[skillName] = true
	end
end

--// Thêm một Skill vào danh sách Trajectory Projectile
function detection.AddTrajectoryProjectile(skillName, dangerRadius, maxLookahead)
	if type(skillName) == "string" and #skillName > 0 then
		local clean = skillName:lower():gsub("%s+", "")
		TRAJECTORY_PROJECTILE_CONFIGS[clean] = {
			name = skillName,
			dangerRadius = dangerRadius or 4.0,
			maxLookahead = maxLookahead,
			visualColor = Color3.fromRGB(255, 130, 0),
		}
		if logHazards then
			print(("[SmartDodge] 🚀 Registered Trajectory Projectile: %s"):format(skillName))
		end
	end
end

--// Kiểm tra xem part có thuộc cấu hình kỹ năng Trajectory hay không
local function getTrajectoryConfigForPart(part)
	if not part then return nil end
	local nameLower = part.Name:lower():gsub("%s+", "")
	if TRAJECTORY_PROJECTILE_CONFIGS[nameLower] then
		return TRAJECTORY_PROJECTILE_CONFIGS[nameLower]
	end
	if part.Parent and part.Parent:IsA("Model") then
		local parentLower = part.Parent.Name:lower():gsub("%s+", "")
		if TRAJECTORY_PROJECTILE_CONFIGS[parentLower] then
			return TRAJECTORY_PROJECTILE_CONFIGS[parentLower]
		end
	end
	return nil
end

detection.GetTrajectoryConfigForPart = function(part)
	return getTrajectoryConfigForPart(part)
end

--// Tự động phát hiện kích thước thực tế của chiêu thức (Auto Dimension Detection)
--// Quét linh hoạt theo thứ tự ưu tiên: Beam Width -> SpecialMesh Scale -> BasePart Cross-Section
local function getPartAutoDimensions(part)
	if not part or not part:IsA("BasePart") then
		return 6.0, nil
	end

	local detectedWidth = nil
	local detectedLength = nil

	-- 1. ƯU TIÊN 1: Tia Beam / Laser (như firstBossBeamPart, movingBeam...)
	local beam = part:FindFirstChildOfClass("Beam") or (part.Parent and part.Parent:FindFirstChildOfClass("Beam"))
	if beam then
		local w0 = beam.Width0 or 0
		local w1 = beam.Width1 or 0
		local maxW = math.max(w0, w1)
		if maxW > 0.5 then
			detectedWidth = maxW
		end
	end

	-- Đo chiều dài và hướng từ Attachment2 nếu có (vết đích của tia beam)
	local att2 = part:FindFirstChild("Attachment2") or (part.Parent and part.Parent:FindFirstChild("Attachment2"))
	if att2 and att2:IsA("Attachment") then
		local delta = att2.WorldPosition - part.Position
		if delta.Magnitude > 5 then
			detectedLength = delta.Magnitude
		end
	end

	-- 2. ƯU TIÊN 2: SpecialMesh với Scale nhân trực tiếp lên Size của Part
	local mesh = part:FindFirstChildOfClass("SpecialMesh")
	local scaleX = (mesh and mesh.Scale.X) or 1
	local scaleY = (mesh and mesh.Scale.Y) or 1
	local scaleZ = (mesh and mesh.Scale.Z) or 1
	local effectiveSize = Vector3.new(
		part.Size.X * math.abs(scaleX),
		part.Size.Y * math.abs(scaleY),
		part.Size.Z * math.abs(scaleZ)
	)

	if not detectedWidth then
		local isMovingBeam = part.Name:lower():find("movingbeam") or (part.Parent and part.Parent.Name:lower():find("movingbeam"))
		local isBigSpike = part.Name:lower():find("bigspike") or (part.Parent and part.Parent.Name:lower():find("bigspike"))
		if isMovingBeam then
			-- Với Moving Beam quét ngang sân, bề ngang của hiểm họa chính là chiều dài sải ngang của thanh beam
			detectedWidth = math.max(effectiveSize.X, effectiveSize.Z)
		elseif isBigSpike then
			-- Với firstBossBigSpike, tia beam thật đi kèm (firstBossBeamPart) có Width0 = Width1 = 40 studs
			detectedWidth = 40.0
			if not detectedLength then
				detectedLength = 140.0
			end
		else
			-- Đo tiết diện ngang vuông góc (loại trừ trục dài nhất của đạn)
			local minDim = math.min(effectiveSize.X, effectiveSize.Z)
			local maxDim = math.max(effectiveSize.X, effectiveSize.Z)

			-- Nếu một trục quá nhỏ (ví dụ tấm phẳng mỏng < 1.2 studs), lấy trục lớn hơn
			if minDim < 1.2 and maxDim >= 1.2 then
				detectedWidth = maxDim
			else
				detectedWidth = minDim
			end
		end
	end

	-- 3. Giới hạn khoảng an toàn hợp lý (tối thiểu 3.0 studs, tối đa 60.0 studs)
	local finalWidth = math.clamp(detectedWidth or 6.0, 3.0, 60.0)

	return finalWidth, detectedLength
end

--// Khóa hướng bay ngay tại Frame 0 trước khi đạn bị xoay quanh trục Y bởi game
local function lockTrajectoryForPart(part)
	if not part or not part:IsA("BasePart") then return nil end
	if lockedProjectiles[part] then
		return lockedProjectiles[part]
	end

	local config = getTrajectoryConfigForPart(part)
	if not config then return nil end

	-- Với Moving Beam (chứa 2 quả cầu 2 đầu và thanh beam ở giữa), chỉ khóa thanh beam dài nhất
	if config.isDynamicMoving then
		local isMovingBeam = part.Name:lower():find("movingbeam") or (part.Parent and part.Parent.Name:lower():find("movingbeam"))
		if isMovingBeam then
			local maxDim = math.max(part.Size.X, part.Size.Z)
			if maxDim < 8 then
				return nil -- Bỏ qua quả cầu 2 đầu, chỉ tạo 1 hộp cam cho thanh beam chính
			end
		end
	end

	-- Bắt hướng bay từ Velocity (nếu đang bay) hoặc CFrame.LookVector tại thời điểm spawn
	local forward2D = Vector3.new(0, 0, -1)
	local vel = (part.AssemblyLinearVelocity or (part:IsA("BasePart") and part.Velocity))
	if vel and Vector3.new(vel.X, 0, vel.Z).Magnitude > 2 then
		forward2D = Vector3.new(vel.X, 0, vel.Z).Unit
	elseif config.isDynamicMoving then
		-- Trục RightVector (X) là phương nằm ngang của thanh beam.
		-- Hướng tịnh tiến quét sàn là phương vuông góc với thanh beam trên mặt sàn X-Z.
		local rv = part.CFrame.RightVector
		local right2D = Vector3.new(rv.X, 0, rv.Z)
		if right2D.Magnitude > 0.01 then
			right2D = right2D.Unit
		else
			right2D = Vector3.new(1, 0, 0)
		end
		local perp = Vector3.new(-right2D.Z, 0, right2D.X)
		local look2D = Vector3.new(part.CFrame.LookVector.X, 0, part.CFrame.LookVector.Z)
		if look2D.Magnitude > 0.01 and perp:Dot(look2D.Unit) < 0 then
			perp = -perp
		end
		forward2D = perp
	else
		-- Nếu part có Attachment2 (đường điều hướng như firstBossBeamPart)
		local att2 = part:FindFirstChild("Attachment2") or (part.Parent and part.Parent:FindFirstChild("Attachment2"))
		if att2 and att2:IsA("Attachment") then
			local delta = att2.WorldPosition - part.Position
			local delta2D = Vector3.new(delta.X, 0, delta.Z)
			if delta2D.Magnitude > 0.1 then
				forward2D = delta2D.Unit
			end
		else
			local look = part.CFrame.LookVector
			local look2D = Vector3.new(look.X, 0, look.Z)
			if look2D.Magnitude > 0.001 then
				forward2D = look2D.Unit
			end
		end

		-- Nếu là missile, kiểm tra companion thirdBossBeamPart để lấy hướng và độ dài chuẩn từ Attachment2
		if part.Name:lower():find("missile") then
			for otherPart, otherData in pairs(lockedProjectiles) do
				if otherPart and otherPart.Parent and otherPart.Name:lower():find("beampart") and otherData and otherData.forward2D then
					if (otherPart.Position - part.Position).Magnitude < 10 then
						forward2D = otherData.forward2D
						if otherData.maxLookahead then
							autoLength = otherData.maxLookahead
						end
						break
					end
				end
			end
		end
	end

	-- TỰ ĐỘNG BÓC TÁCH KÍCH THƯỚC THẬT (Auto Dimension Detection):
	local autoWidth, autoLength = getPartAutoDimensions(part)
	local baseRadius = autoWidth / 2

	-- Nếu config có dangerRadius sàn cao hơn (safety floor), tôn trọng giá trị an toàn
	if config.dangerRadius and config.dangerRadius > baseRadius then
		baseRadius = config.dangerRadius
	end

	local finalDangerRadius = baseRadius + trajectoryWidthPadding
	local finalMaxLookahead = autoLength or config.maxLookahead or trajectoryLookahead

	-- KHÓA TRỤC Y NGAY TẠI THỜI ĐIỂM SPAWN:
	-- Lấy cao độ sàn mặt đất (Raw Floor Y) để vùng màu cam và hitbox luôn dán chặt vào mặt đất,
	-- không bị trôi nổi trên không trung hay nhấp nhô theo trục Y của viên đạn.
	local rawFloorY, hasFloor = getGeometry().GetRawFloorY(part.Position)
	local boxThickness = 0.8 -- Chiều cao của vùng màu cam trên mặt đất (studs)
	local lockedVisualY = rawFloorY + (boxThickness / 2) + 0.05 -- Đặt đáy hộp nằm sát trên sàn để không chìm vào mesh sàn

	local data = {
		part = part,
		originPos = part.Position,
		forward2D = forward2D,
		dangerRadius = finalDangerRadius,
		maxLookahead = finalMaxLookahead,
		config = config,
		spawnTime = os.clock(),
		locked = true,
		rawFloorY = rawFloorY,
		lockedVisualY = lockedVisualY,
		boxThickness = boxThickness,
	}

	lockedProjectiles[part] = data
	if logHazards then
		print(("[SmartDodge] 🚀 Locked Trajectory for %s | Dir: (%.2f, %.2f) | Lookahead: %.0fm | Auto Width: %.1fm (Radius: %.1fm) | Locked Floor Y: %.2f"):format(
			part.Name, forward2D.X, forward2D.Z, data.maxLookahead, autoWidth, data.dangerRadius, rawFloorY
		))
	end

	return data
end

detection.LockTrajectoryForPart = function(part)
	return lockTrajectoryForPart(part)
end

--// Khóa quỹ đạo trực tiếp cho Model Second Boss Moving Beam (tính toán độc lập với Visual ESP)
local function lockSecondBossMovingBeam(inst)
	if not inst or not inst.Parent then return nil end
	if lockedProjectiles[inst] then return lockedProjectiles[inst] end

	local modelCFrame, modelSize = inst:GetBoundingBox()
	local primary = inst:FindFirstChildWhichIsA("BasePart")
	local curPos = (primary and primary.Position) or modelCFrame.Position

	local rv = (primary and primary.CFrame.RightVector) or modelCFrame.RightVector
	local right2D = Vector3.new(rv.X, 0, rv.Z)
	if right2D.Magnitude > 0.01 then
		right2D = right2D.Unit
	else
		right2D = Vector3.new(1, 0, 0)
	end
	local forward2D = Vector3.new(-right2D.Z, 0, right2D.X)
	local look = (primary and primary.CFrame.LookVector) or modelCFrame.LookVector
	local look2D = Vector3.new(look.X, 0, look.Z)
	if look2D.Magnitude > 0.01 and forward2D:Dot(look2D.Unit) < 0 then
		forward2D = -forward2D
	end

	local beamSpan = math.max(modelSize.X, modelSize.Y, modelSize.Z)
	if beamSpan < 12 then beamSpan = 50.0 end
	local dangerWidth = beamSpan + trajectoryWidthPadding * 2
	local dangerDepth = trajectoryLookahead

	local curFloorY = getGeometry().GetRawFloorY(curPos)
	local thickness = 0.8
	local lockedY = curFloorY + (thickness / 2) + 0.05

	local trajData = {
		instance = inst,
		lastPos = curPos,
		curPos = curPos,
		forward2D = forward2D,
		dangerRadius = dangerWidth / 2,
		dangerWidth = dangerWidth,
		maxLookahead = dangerDepth,
		dangerDepth = dangerDepth,
		lockedVisualY = lockedY,
		boxThickness = thickness,
		isDynamicMoving = true,
		config = TRAJECTORY_PROJECTILE_CONFIGS["secondbossmovingbeam"],
	}
	lockedProjectiles[inst] = trajData
	return trajData
end

detection.LockSecondBossMovingBeam = lockSecondBossMovingBeam

--// Khởi tạo theo dõi quỹ đạo động cho Boss 2 Orbs (Yellow / Red / Green Orb luôn hướng về Player)
local function lockBossOrb(inst, config)
	if not inst or not inst.Parent then return nil end
	if lockedProjectiles[inst] then return lockedProjectiles[inst] end

	local primary = inst:IsA("BasePart") and inst or (inst:IsA("Model") and inst:FindFirstChildWhichIsA("BasePart"))
	local modelCFrame, modelSize
	if inst:IsA("Model") then
		modelCFrame, modelSize = inst:GetBoundingBox()
	end
	local curPos = (primary and primary.Position) or (modelCFrame and modelCFrame.Position) or inst.Position

	-- Xác định hướng và chiều dài ban đầu: Hướng thẳng từ Quả Cầu tới Player
	local forward2D = Vector3.new(0, 0, -1)
	local dangerDepth = 22.0
	local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local playerPos = rootPart and rootPart.Position

	if playerPos then
		local diff = Vector3.new(playerPos.X - curPos.X, 0, playerPos.Z - curPos.Z)
		local dist = diff.Magnitude
		if dist > 0.3 then
			forward2D = diff.Unit
			dangerDepth = math.clamp(dist + 4.0, 10.0, 80.0)
		end
	end

	local partSize = (primary and primary.Size) or modelSize or Vector3.new(6, 6, 6)
	local baseRadius = math.max(partSize.X, partSize.Z) / 2
	if baseRadius < 4.0 then baseRadius = 4.0 end
	local dangerRadius = baseRadius + trajectoryWidthPadding
	local dangerWidth = dangerRadius * 2

	local curFloorY = getGeometry().GetRawFloorY(curPos)
	local thickness = 0.8
	local lockedY = curFloorY + (thickness / 2) + 0.05

	local trajData = {
		instance = inst,
		lastPos = curPos,
		curPos = curPos,
		forward2D = forward2D,
		dangerRadius = dangerRadius,
		dangerWidth = dangerWidth,
		maxLookahead = dangerDepth,
		dangerDepth = dangerDepth,
		lockedVisualY = lockedY,
		boxThickness = thickness,
		isDynamicMoving = true,
		isBossOrb = true,
		config = config or TRAJECTORY_PROJECTILE_CONFIGS[inst.Name:lower():gsub("%s+", "")],
	}
	lockedProjectiles[inst] = trajData
	return trajData
end

local initBossOrb = lockBossOrb
detection.LockBossOrb = lockBossOrb
detection.InitBossOrb = lockBossOrb

--// Đăng ký tên kỹ năng của Player để loại trừ
function detection.RegisterPlayerSkill(skillName)
	if type(skillName) == "string" and #skillName > 0 then
		local cleanName = skillName:gsub("^%s+", ""):gsub("%s+$", "")
		if not ignoredSkillNames[cleanName] then
			ignoredSkillNames[cleanName] = true
			local normalized = cleanName:lower():gsub("%s+", "")
			ignoredSkillNames[normalized] = true
			if logHazards then
				print(("[SmartDodge] 🛡️ Registered Player Skill (Ignored): %s"):format(cleanName))
			end
		end
	end
end

--// Tự động quét và lắng nghe kỹ năng trong Backpack / Character của Player và đồng đội
local function initPlayerSkillWatcher()
	local function scanPlayer(p)
		if not p then return end

		local function scanContainer(container)
			if not container then return end
			for _, child in ipairs(container:GetChildren()) do
				detection.RegisterPlayerSkill(child.Name)
			end
		end

		local function watchBackpack(bp)
			if not bp then return end
			scanContainer(bp)
			bp.ChildAdded:Connect(function(child)
				detection.RegisterPlayerSkill(child.Name)
			end)
		end

		local function watchCharacter(char)
			if not char then return end
			scanContainer(char)
			char.ChildAdded:Connect(function(child)
				if child:IsA("Tool") then
					detection.RegisterPlayerSkill(child.Name)
				end
			end)
		end

		if p:FindFirstChild("Backpack") then
			watchBackpack(p.Backpack)
		end
		p.ChildAdded:Connect(function(child)
			if child.Name == "Backpack" or child:IsA("Backpack") then
				watchBackpack(child)
			end
		end)

		if p.Character then
			watchCharacter(p.Character)
		end
		p.CharacterAdded:Connect(watchCharacter)
	end

	for _, p in ipairs(Players:GetPlayers()) do
		scanPlayer(p)
	end
	Players.PlayerAdded:Connect(scanPlayer)

	-- Quét định kỳ mỗi 1 giây trong trường hợp đồ trong Backpack được game nạp trễ
	task.spawn(function()
		while threatDetectorEnabled or #Players:GetPlayers() > 0 do
			for _, p in ipairs(Players:GetPlayers()) do
				if p:FindFirstChild("Backpack") then
					for _, item in ipairs(p.Backpack:GetChildren()) do
						detection.RegisterPlayerSkill(item.Name)
					end
				end
				if p.Character then
					for _, item in ipairs(p.Character:GetChildren()) do
						if item:IsA("Tool") then
							detection.RegisterPlayerSkill(item.Name)
						end
					end
				end
			end
			task.wait(1)
		end
	end)
end

--// Tự động quét và nạp danh sách toàn bộ kỹ năng của game từ ReplicatedStorage.abilities
local function scanAbilityInstance(ability)
	if not ability then return end
	detection.RegisterPlayerSkill(ability.Name)

	local nameVal = ability:FindFirstChild("name")
	if nameVal and nameVal:IsA("ValueBase") and tostring(nameVal.Value) ~= "" then
		detection.RegisterPlayerSkill(tostring(nameVal.Value))
	end

	local attrName = ability:GetAttribute("name") or ability:GetAttribute("Name")
	if type(attrName) == "string" and attrName ~= "" then
		detection.RegisterPlayerSkill(attrName)
	end

	-- Quét các BasePart/MeshPart/Projectiles bên trong ability (nếu có)
	for _, desc in ipairs(ability:GetDescendants()) do
		if desc:IsA("BasePart") and desc.Name ~= "Handle" and desc.Name ~= "Part" and desc.Name ~= "Union" then
			detection.RegisterPlayerSkill(desc.Name)
		end
	end
end

local function initReplicatedAbilitiesWatcher()
	local function hookFolder(folder)
		for _, child in ipairs(folder:GetChildren()) do
			scanAbilityInstance(child)
		end
		folder.ChildAdded:Connect(function(child)
			scanAbilityInstance(child)
		end)
		if logHazards then
			print(("[SmartDodge] 📚 Loaded %d player abilities from ReplicatedStorage.abilities"):format(#folder:GetChildren()))
		end
	end

	local abilitiesFolder = ReplicatedStorage:FindFirstChild("abilities")
	if abilitiesFolder then
		hookFolder(abilitiesFolder)
	else
		task.spawn(function()
			local folder = ReplicatedStorage:WaitForChild("abilities", 10)
			if folder then
				hookFolder(folder)
			end
		end)
	end
end

--// Tự động quét và nạp toàn bộ danh mục EFFECT / đạn / vòng sáng từ ReplicatedStorage.projectiles
local function scanProjectileInstance(proj)
	if not proj then return end
	detection.RegisterPlayerSkill(proj.Name)

	-- Quét toàn bộ part/mesh/model con bên trong
	for _, desc in ipairs(proj:GetDescendants()) do
		if desc:IsA("BasePart") and desc.Name ~= "Handle" and desc.Name ~= "Part" and desc.Name ~= "Union" then
			detection.RegisterPlayerSkill(desc.Name)
		end
	end
end

local function initReplicatedProjectilesWatcher()
	local function hookFolder(folder)
		for _, child in ipairs(folder:GetChildren()) do
			scanProjectileInstance(child)
		end
		folder.ChildAdded:Connect(function(child)
			scanProjectileInstance(child)
		end)
		if logHazards then
			print(("[SmartDodge] 🎆 Loaded %d player projectiles/effects from ReplicatedStorage.projectiles"):format(#folder:GetChildren()))
		end
	end

	local projFolder = ReplicatedStorage:FindFirstChild("projectiles")
	if projFolder then
		hookFolder(projFolder)
	else
		task.spawn(function()
			local folder = ReplicatedStorage:WaitForChild("projectiles", 10)
			if folder then
				hookFolder(folder)
			end
		end)
	end
end

initPlayerSkillWatcher()
initReplicatedAbilitiesWatcher()
initReplicatedProjectilesWatcher()

--// Kiểm tra xem đối tượng có phải là của Player (hoặc skill của Player) không
local function isPlayerAsset(instance)
	if not instance then return true end

	local instNameClean = instance.Name:gsub("^%s+", ""):gsub("%s+$", "")
	local instNameLower = instNameClean:lower():gsub("%s+", "")

	-- 0. Ngoại lệ chiêu của Boss / Enemy -> Tuyệt đối không phải của Player
	local repEnemyProj = ReplicatedStorage:FindFirstChild("enemyProjectiles")
	if repEnemyProj and (repEnemyProj:FindFirstChild(instance.Name, true) or repEnemyProj:FindFirstChild(instNameClean, true)) then
		return false
	end

	if CUSTOM_HAZARD_EXCEPTIONS[instance.Name]
		or instNameLower:find("boss")
		or instNameLower:find("enemy")
		or instNameLower:find("mob")
		or instNameLower:find("multiring")
		or instNameLower:find("crisscross")
		or instNameLower:find("seekingspike")
		or instNameLower:find("bigspike")
		or instNameLower:find("beampart")
		or instNameLower:find("movingbeam")
		or instNameLower:find("thirdboss") then
		return false
	end

	-- 1. Kiểm tra trực thuộc Character của bất kỳ người chơi nào
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Character and (instance == p.Character or instance:IsDescendantOf(p.Character)) then
			return true
		end
	end

	-- 2. Kiểm tra trực tiếp trong Backpack & Character của mọi người chơi (Khớp chính xác tên, không fuzzy substring)
	instNameClean = instance.Name:gsub("^%s+", ""):gsub("%s+$", "")
	instNameLower = instNameClean:lower():gsub("%s+", "")

	for _, p in ipairs(Players:GetPlayers()) do
		local bp = p:FindFirstChild("Backpack")
		if bp then
			if bp:FindFirstChild(instance.Name) or bp:FindFirstChild(instNameClean) then
				detection.RegisterPlayerSkill(instance.Name)
				return true
			end
			for _, item in ipairs(bp:GetChildren()) do
				local itemLower = item.Name:lower():gsub("%s+", "")
				if item.Name == instance.Name or itemLower == instNameLower then
					detection.RegisterPlayerSkill(item.Name)
					return true
				end
			end
		end

		if p.Character then
			if p.Character:FindFirstChild(instance.Name) or p.Character:FindFirstChild(instNameClean) then
				detection.RegisterPlayerSkill(instance.Name)
				return true
			end
			for _, item in ipairs(p.Character:GetChildren()) do
				if item:IsA("Tool") then
					local itemLower = item.Name:lower():gsub("%s+", "")
					if item.Name == instance.Name or itemLower == instNameLower then
						detection.RegisterPlayerSkill(item.Name)
						return true
					end
				end
			end
		end
	end

	-- 3. Kiểm tra các Tag/Attribute/ObjectValue sở hữu (creator, owner, player, caster)
	local creatorVal = instance:FindFirstChild("creator") or instance:FindFirstChild("Creator")
		or instance:FindFirstChild("owner") or instance:FindFirstChild("Owner")
		or instance:FindFirstChild("player") or instance:FindFirstChild("Player")
		or instance:FindFirstChild("caster") or instance:FindFirstChild("Caster")
	if creatorVal then
		if creatorVal:IsA("ObjectValue") and creatorVal.Value and creatorVal.Value:IsA("Player") then
			return true
		elseif creatorVal:IsA("StringValue") and Players:FindFirstChild(creatorVal.Value) then
			return true
		end
	end

	local ownerAttr = instance:GetAttribute("Owner") or instance:GetAttribute("Player")
		or instance:GetAttribute("creator") or instance:GetAttribute("Creator")
	if ownerAttr then
		if type(ownerAttr) == "string" and Players:FindFirstChild(ownerAttr) then
			return true
		end
	end

	-- 4. Kiểm tra tên Instance có chứa tên hoặc UserId của Player không
	for _, p in ipairs(Players:GetPlayers()) do
		local pNameLower = p.Name:lower()
		if instNameLower:find(pNameLower, 1, true) or instance.Name:find(tostring(p.UserId), 1, true) then
			return true
		end
	end

	-- 5. So khớp với danh sách tên kỹ năng đã đăng ký (Chính xác tên, không fuzzy substring tránh trùng tên chiêu Boss)
	if ignoredSkillNames[instance.Name] or ignoredSkillNames[instNameClean] or ignoredSkillNames[instNameLower] then
		return true
	end

	-- 6. Kiểm tra trực tiếp thư mục ReplicatedStorage.abilities & projectiles (phòng trường hợp chiêu/effect mới chưa kịp nạp)
	local repAbilities = ReplicatedStorage:FindFirstChild("abilities")
	if repAbilities and (repAbilities:FindFirstChild(instance.Name) or repAbilities:FindFirstChild(instNameClean)) then
		detection.RegisterPlayerSkill(instance.Name)
		return true
	end

	local repProjectiles = ReplicatedStorage:FindFirstChild("projectiles")
	if repProjectiles and (repProjectiles:FindFirstChild(instance.Name) or repProjectiles:FindFirstChild(instNameClean)) then
		detection.RegisterPlayerSkill(instance.Name)
		return true
	end

	-- Riêng các hiệu ứng Aura thông dụng của player
	if instNameLower:find("enhancedaura", 1, true) or instNameLower:find("auraring", 1, true) or instNameLower:find("groundaura", 1, true) then
		return true
	end

	return false
end

--// Danh sách tên các Part bổ trợ / không gây sát thương cần lọc bỏ
local HELPER_PART_NAMES = {
	["primarypart"] = true,
	["center"] = true,
	["root"] = true,
	["main"] = true,
	["handle"] = true,
	["humanoidrootpart"] = true,
}

--// Kiểm tra xem một Part/MeshPart cụ thể có thuộc danh sách bỏ qua hay không
local function isIgnoredPart(part)
	if not part then return true end
	--// Marker "SmartDodge_SafeMarker" đã bị chặn sẵn bằng tên chứa "SmartDodge" (CanQuery=false),
	--// nên không cần so sánh instance marker riêng nữa (refactor ra nhiều module).
	if part.Name:find("SmartDodge") then return true end
	local nameClean = part.Name:gsub("^%s+", ""):gsub("%s+$", "")
	local nameLower = nameClean:lower():gsub("%s+", "")

	if CUSTOM_HAZARD_EXCEPTIONS[part.Name] or (part.Parent and CUSTOM_HAZARD_EXCEPTIONS[part.Parent.Name])
		or part.Name:lower():find("multiring") or (part.Parent and part.Parent.Name:lower():find("multiring"))
		or part.Name:lower():find("crisscross") or (part.Parent and part.Parent.Name:lower():find("crisscross"))
		or part.Name:lower():find("seekingspike") or (part.Parent and part.Parent.Name:lower():find("seekingspike"))
		or part.Name:lower():find("bigspike") or (part.Parent and part.Parent.Name:lower():find("bigspike"))
		or part.Name:lower():find("beampart") or (part.Parent and part.Parent.Name:lower():find("beampart"))
		or part.Name:lower():find("movingbeam") or (part.Parent and part.Parent.Name:lower():find("movingbeam"))
		or part.Name:lower():find("thirdboss") or (part.Parent and part.Parent.Name:lower():find("thirdboss"))
		or part.Name:lower():find("missile") or (part.Parent and part.Parent.Name:lower():find("missile")) then
		return false
	end

	if ignoredSkillNames[part.Name] or ignoredSkillNames[nameClean] or ignoredSkillNames[nameLower] or IGNORED_NAMES[part.Name] then
		return true
	end

	if nameLower:find("enhancedaura", 1, true) or nameLower:find("auraring", 1, true) or nameLower:find("groundaura", 1, true) then
		return true
	end
	return false
end

detection.IsIgnoredPart = function(part)
	return isIgnoredPart(part)
end

--// Tìm các Part nguy hiểm bên trong instance (Depth 1 BasePart hoặc Model)
local function extractHazardParts(instance)
	local parts = {}
	if not instance or instance.Name:find("SmartDodge") or isIgnoredPart(instance) then
		return parts, false
	end
	local isException = CUSTOM_HAZARD_EXCEPTIONS[instance.Name]
		or instance.Name:lower():find("multiring")
		or instance.Name:lower():find("crisscross")
		or instance.Name:lower():find("seekingspike")
		or instance.Name:lower():find("bigspike")
		or instance.Name:lower():find("beampart")
		or instance.Name:lower():find("movingbeam")
		or instance.Name:lower():find("thirdboss")
		or instance.Name:lower():find("missile")

	local function isValidHazardPart(part)
		if not part or not part:IsA("BasePart") or isIgnoredPart(part) then return false end
		local nameLower = part.Name:lower():gsub("%s+", "")
		if HELPER_PART_NAMES[nameLower] then return false end

		-- Với chiêu multi rings, chỉ nhận các part tên 'ring'
		if instance.Name:lower():find("multiring") and not nameLower:find("ring") then
			return false
		end

		-- Chiêu Trajectory Projectile / Beam Telegraph (firstBossBigSpike, firstBossBeamPart...)
		-- có thể là Part vô hình (Transparency = 1) ở pha precast telegraph
		if getTrajectoryConfigForPart(part) then
			return true
		end

		return part.Transparency < FADE_TRANSPARENCY_THRESHOLD
	end

	if isException then
		-- Ngoại lệ đặc biệt: tìm các part 'precast', 'ring' hoặc Part Neon có trong model
		if instance:IsA("BasePart") then
			if isValidHazardPart(instance) then
				table.insert(parts, instance)
			end
		elseif instance:IsA("Model") then
			local precasts = {}
			for _, desc in ipairs(instance:GetDescendants()) do
				if isValidHazardPart(desc) and (desc.Name:lower():find("precast") or desc.Name:lower():find("ring")) then
					table.insert(precasts, desc)
				end
			end
			if #precasts > 0 then
				parts = precasts
			else
				-- Nếu không có part precast/ring cụ thể, CHỈ lấy các part Neon thực sự (tuyệt đối không lấy part hộp/PrimaryPart)
				for _, desc in ipairs(instance:GetDescendants()) do
					if isValidHazardPart(desc) and desc.Material == Enum.Material.Neon then
						table.insert(parts, desc)
					end
				end
			end
		end
	else
		-- Tiêu chuẩn chung: CHỈ nhận Material == Neon
		if instance:IsA("BasePart") then
			if isValidHazardPart(instance) and instance.Material == Enum.Material.Neon then
				table.insert(parts, instance)
			end
		elseif instance:IsA("Model") then
			for _, desc in ipairs(instance:GetDescendants()) do
				if isValidHazardPart(desc) and desc.Material == Enum.Material.Neon then
					table.insert(parts, desc)
				end
			end
		end
	end

	return parts, isException
end

--// Lấy vị trí trung tâm của instance (Ưu tiên tuyệt đối hazardParts thực tế, KHÔNG dùng PrimaryPart)
local function getInstancePosition(instance, hazardParts)
	if hazardParts and #hazardParts > 0 then
		return hazardParts[1].Position
	end

	if instance:IsA("BasePart") then
		return instance.Position
	elseif instance:IsA("Model") then
		local pivot = instance:GetPivot()
		if pivot and pivot.Position ~= Vector3.zero then
			return pivot.Position
		end
	end

	return Vector3.zero
end

local function fireHazardChanged()
	for _, cb in ipairs(hazardChangedCallbacks) do
		pcall(cb, hazardCount, lastHazardInfo)
	end
end

--// Forward declaration
local unregisterHazard

--// Tạo và gắn SelectionBox 3D lên từng Part của chiêu thức
local function attachSelectionBoxes(hazardParts)
	local boxes = {}
	for _, part in ipairs(hazardParts) do
		if part and part:IsA("BasePart") and part.Parent then
			-- SelectionBox CHỈ bọc các Part phát sáng Neon thực sự hoặc các part precast/ring/trajectory/orb
			-- Tuyệt đối KHÔNG bọc các part hộp/mesh to đùng không phải Neon
			local isNeon = (part.Material == Enum.Material.Neon)
			local orbConf = BOSS_ORB_CONFIGS[part.Name:lower()]
				or (part.Parent and BOSS_ORB_CONFIGS[part.Parent.Name:lower()])
			local isPrecast = part.Name:lower():find("precast") ~= nil
			local isRing = part.Name:lower():find("ring") ~= nil
			local isTraj = getTrajectoryConfigForPart(part) ~= nil

			if isNeon or orbConf or isPrecast or isRing or isTraj then
				local box = Instance.new("SelectionBox")
				box.Name = "SmartDodge_SelectionBox"

				if orbConf then
					box.Color3 = orbConf.color
					box.SurfaceColor3 = orbConf.surfaceColor
					box.SurfaceTransparency = 0.5
					box.LineThickness = 0.08
				else
					box.Color3 = Color3.fromRGB(255, 45, 45)
					box.SurfaceColor3 = Color3.fromRGB(255, 30, 30)
					box.SurfaceTransparency = 0.6
					box.LineThickness = 0.05
				end

				box.Adornee = part
				box.Parent = part
				table.insert(boxes, box)
			end
		end
	end
	return boxes
end

--// Ước tính tổng thời gian tồn tại và thời điểm kích nổ sát thương (Total Lifetime & Hit Delay)
local function getEstimatedSkillLifetime(skillName)
	if skillTimingManager then
		return skillTimingManager.GetSkillTiming(skillName)
	end
	local known = KNOWN_SKILL_LIFETIMES[skillName]
	if known then
		if type(known) == "table" then
			return known.totalLifetime or 2.0, known.hitDelay or 1.5
		else
			return known, known * 0.70
		end
	end
	return 2.5, 1.8
end

--// Gắn BillboardGui 3D đếm ngược thời gian tồn tại của hazard
local function attachHazardTimerBillboard(instance, hazardParts, skillName)
	if not showSkillTimers then return nil, nil end
	local targetPart = hazardParts and hazardParts[1]
	if not targetPart or not targetPart:IsA("BasePart") then
		if instance:IsA("BasePart") then
			targetPart = instance
		elseif instance:IsA("Model") then
			targetPart = instance:FindFirstChildWhichIsA("BasePart")
		else
			return nil, nil
		end
	end

	local billboard = Instance.new("BillboardGui")
	billboard.Name = "SmartDodge_TimerBillboard"
	billboard.Adornee = targetPart
	billboard.Size = UDim2.new(0, 160, 0, 40)
	billboard.StudsOffset = Vector3.new(0, 4.0, 0)
	billboard.AlwaysOnTop = true
	billboard.ResetOnSpawn = false

	local label = Instance.new("TextLabel")
	label.Name = "TimerLabel"
	label.Size = UDim2.new(1, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.GothamBold
	label.TextSize = 13
	label.TextColor3 = Color3.fromRGB(255, 220, 80)
	label.Text = skillName .. "\n⏳ calculating..."

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(0, 0, 0)
	stroke.Thickness = 1.5
	stroke.Parent = label

	label.Parent = billboard
	billboard.Parent = targetPart

	return billboard, label
end

--// Tìm đối tượng tung chiêu (Caster) để theo dõi vòng đời sống/chết (Tầng 2)
local function findCasterForHazard(instance, pos)
	if not instance then return nil, nil end

	-- 1. Kiểm tra các thuộc tính/ObjectValue sở hữu nếu game có đính kèm
	local creatorVal = instance:FindFirstChild("creator") or instance:FindFirstChild("Creator")
		or instance:FindFirstChild("owner") or instance:FindFirstChild("Owner")
		or instance:FindFirstChild("caster") or instance:FindFirstChild("Caster")
	if creatorVal and creatorVal:IsA("ObjectValue") and creatorVal.Value and creatorVal.Value:IsA("Model") then
		local hum = creatorVal.Value:FindFirstChildOfClass("Humanoid")
		if hum and hum.Health > 0 then
			return creatorVal.Value, hum
		end
	end

	local tracked = shared.GetTrackedEnemyData()
	if not tracked or #tracked == 0 then
		return nil, nil
	end

	-- 2. Nếu đang trong Boss Room hoặc chỉ còn đúng 1 quái trong phòng -> Caster chính là con quái/boss đó
	if #tracked == 1 or shared.IsBossActive() then
		local data = tracked[1]
		if data and data.Model and data.Humanoid and data.Humanoid.Health > 0 then
			return data.Model, data.Humanoid
		end
	end

	-- 3. Nếu có nhiều quái: Tìm quái sống gần vị trí spawn của chiêu nhất (bán kính <= 35 studs)
	if pos then
		local nearestModel, nearestHum = nil, nil
		local nearestDistSq = 35 * 35
		for _, data in ipairs(tracked) do
			if data and data.Root and data.Root.Parent then
				local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
				if hum and hum.Health > 0 then
					local distSq = (data.Root.Position - pos).Magnitude ^ 2
					if distSq < nearestDistSq then
						nearestDistSq = distSq
						nearestModel = data.Model
						nearestHum = hum
					end
				end
			end
		end
		if nearestModel and nearestHum then
			return nearestModel, nearestHum
		end
	end

	return nil, nil
end

--// Đăng ký một Instance (Depth 1) là hiểm họa và gắn listeners theo dõi độ mờ
local function registerHazard(instance)
	if not threatDetectorEnabled or not instance or activeHazards[instance] then return end
	if instance:IsA("Folder") then return end
	if instance:FindFirstChildOfClass("Humanoid") then return end
	if instance.Name:find("SmartDodge") then return end
	if IGNORED_NAMES[instance.Name] or ignoredSkillNames[instance.Name] then return end

	-- FAST REJECTION (Tầng 1): Nếu phòng đã dọn sạch quái và không ở Boss room -> Bỏ qua
	-- Ngoại lệ: khi đang bật Huấn luyện (Recording) thì không bỏ qua để đảm bảo bắt trọn mọi chiêu thức
	if not (skillTimingManager and skillTimingManager.IsRecording()) then
		if shared.GetEnemyCount() == 0 and not shared.IsBossActive() then return end
	end

	-- FAST REJECTION: Trích xuất part hiểm họa trước.
	-- Nếu không có part Neon và không thuộc ngoại lệ -> Bỏ qua ngay lập tức trong 0.0001ms mà KHÔNG chạy isPlayerAsset
	local hazardParts, isException = extractHazardParts(instance)
	if #hazardParts == 0 then
		-- Nếu là Model mới tạo, các part con có thể chưa kịp replicate hoặc parent vào Model
		if instance:IsA("Model") then
			local c
			c = instance.DescendantAdded:Connect(function(desc)
				if desc:IsA("BasePart") and desc.Transparency < FADE_TRANSPARENCY_THRESHOLD then
					if isException or desc.Material == Enum.Material.Neon then
						if c then c:Disconnect(); c = nil end
						registerHazard(instance)
					end
				end
			end)
			task.delay(1.5, function()
				if c then c:Disconnect(); c = nil end
			end)
		elseif instance:IsA("BasePart") and instance.Transparency < FADE_TRANSPARENCY_THRESHOLD then
			local c
			c = instance:GetPropertyChangedSignal("Material"):Connect(function()
				if instance.Material == Enum.Material.Neon then
					if c then c:Disconnect(); c = nil end
					registerHazard(instance)
				end
			end)
			task.delay(1.5, function()
				if c then c:Disconnect(); c = nil end
			end)
		end
		return
	end

	-- Chỉ khi chắc chắn có Part nguy hiểm thực sự mới kiểm tra xem có phải skill của Player/Đồng đội không
	if isPlayerAsset(instance) then return end

	local pos = getInstancePosition(instance, hazardParts)

	-- Tầng 2: Tìm Caster của chiêu thức
	local casterModel, casterHumanoid = findCasterForHazard(instance, pos)
	if casterHumanoid and casterHumanoid.Health <= 0 then
		-- Quái tung chiêu này đã chết -> Bỏ qua ngay lập tức!
		return
	end

	local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local dist = rootPart and math.floor((pos - rootPart.Position).Magnitude) or 0

	local activePartsSet = {}
	local partConnections = {}

	-- Bộ theo dõi chu kỳ chớp sáng (Flash Peak & Decay Tracker) cho từng Part
	local partMinTrans = {}      -- [Part] = number (độ mờ thấp nhất / sáng nhất từng ghi nhận)
	local partHasFlashed = {}    -- [Part] = boolean (đã từng đạt trạng thái chớp sáng kích nổ chưa)

	for _, part in ipairs(hazardParts) do
		activePartsSet[part] = true
		local initT = part.Transparency
		partMinTrans[part] = initT
		partHasFlashed[part] = (initT <= 0.28)
	end

	local visualBoxes = visualEspEnabled and attachSelectionBoxes(hazardParts) or {}
	local timerBillboard, timerLabel = nil, nil
	if showSkillTimers then
		timerBillboard, timerLabel = attachHazardTimerBillboard(instance, hazardParts, instance.Name)
	end

	local info = {
		Instance = instance,
		Name = instance.Name,
		Class = instance.ClassName,
		Position = pos,
		SpawnPosition = pos,
		Distance = dist,
		NeonCount = #hazardParts,
		SpawnTime = os.clock(),
		HitTime = nil, -- Ghi nhận thời điểm nháy kích nổ sát thương
		Connections = partConnections,
		ActiveParts = activePartsSet,
		VisualBoxes = visualBoxes,
		TimerBillboard = timerBillboard,
		TimerLabel = timerLabel,
		IsException = isException,
		Caster = casterModel,
		CasterHumanoid = casterHumanoid,
	}

	activeHazards[instance] = info
	hazardCount = hazardCount + 1
	lastHazardInfo = info

	-- Lắng nghe sự kiện Caster chết để hủy sớm toàn bộ hitbox chiêu này (Tầng 2)
	if casterModel and casterHumanoid then
		table.insert(partConnections, casterHumanoid.Died:Connect(function()
			unregisterHazard(instance, "Caster Dead")
		end))
		table.insert(partConnections, casterModel.AncestryChanged:Connect(function(_, parent)
			if not parent then
				unregisterHazard(instance, "Caster Removed")
			end
		end))
	end

	-- Lắng nghe âm thanh nổ hoặc particles bung ra để bắt trọn thời điểm nháy damage
	for _, desc in ipairs(instance:GetDescendants()) do
		if desc:IsA("Sound") then
			table.insert(partConnections, desc.Played:Connect(function()
				if not info.HitTime then
					info.HitTime = os.clock()
				end
			end))
		end
	end

	if instance:IsA("Model") then
		table.insert(partConnections, instance.DescendantAdded:Connect(function(desc)
			if not info.HitTime and (desc:IsA("ParticleEmitter") or desc:IsA("Sound") or (desc:IsA("BasePart") and desc.Name ~= "precast")) then
				info.HitTime = os.clock()
			end
		end))
	end

	-- Khóa hướng bay ngay tại Frame 0 cho các chiêu đạn bay / Projectile
	local instNameLower = (instance.Name or ""):lower():gsub("%s+", "")
	if instance:IsA("Model") and (instNameLower:find("movingbeam") ~= nil or (instance.Name and instance.Name:lower():find("movingbeam") ~= nil)) then
		lockSecondBossMovingBeam(instance)
	end
	if BOSS_ORB_CONFIGS[instNameLower] or (instance.Name and BOSS_ORB_CONFIGS[instance.Name:lower():gsub("%s+", "")]) then
		lockBossOrb(instance, TRAJECTORY_PROJECTILE_CONFIGS[instNameLower])
	end

	for _, part in ipairs(hazardParts) do
		if getTrajectoryConfigForPart(part) then
			lockTrajectoryForPart(part)
		end
	end

	-- Gắn sự kiện lắng nghe Transparency và Material thay đổi trên từng Part
	local function checkPartStatus(part)
		if not activeHazards[instance] or not activePartsSet[part] then return end

		-- Kiểm tra xem Caster có vừa chết hay biến mất không (Tầng 2)
		if info.CasterHumanoid and (info.CasterHumanoid.Health <= 0 or not info.Caster or not info.Caster.Parent) then
			unregisterHazard(instance, "Caster Dead")
			return
		end

		local curTrans = part.Transparency
		local minT = partMinTrans[part] or curTrans
		if curTrans < minT then
			minT = curTrans
			partMinTrans[part] = minT
		end

		-- Pha Kích nổ / Sát thương: Khi part đạt độ sáng chói (Transparency tụt xuống <= 0.28)
		if minT <= 0.28 then
			partHasFlashed[part] = true
			if not info.HitTime then
				info.HitTime = os.clock()
			end
		end

		-- Pha Tan biến sau khi chớp sáng (Early Hitbox Clearance):
		-- Một khi đã từng chớp sáng, chỉ cần Transparency bắt đầu tăng lên (curTrans >= minT + 0.18 hoặc curTrans >= 0.40)
		-- -> Sát thương đã nổ xong 100%, loại bỏ hitbox ngay lập tức không cần đợi tới 0.85/0.95!
		local hasDecayedAfterFlash = partHasFlashed[part] and (curTrans >= (minT + 0.18) or curTrans >= 0.40)

		local isTraj = getTrajectoryConfigForPart(part) ~= nil
		local isExpired = false

		if not part.Parent then
			isExpired = true
		elseif isTraj then
			-- Với Trajectory Projectile (như firstBossBigSpike, firstBossBeamPart):
			-- Khi mới spawn ở pha precast telegraph, Transparency có thể = 1.
			-- Khi đạn bắn ra, Transparency tụt xuống < FADE_TRANSPARENCY_THRESHOLD -> đánh dấu đã bước vào pha bay
			if curTrans < FADE_TRANSPARENCY_THRESHOLD then
				partHasFlashed[part] = true
			end

			-- Chỉ coi là hết hạn nếu: ĐÃ TỪNG BẮN (partHasFlashed) và giờ mờ đi lại (curTrans >= FADE_TRANSPARENCY_THRESHOLD),
			-- hoặc part đã nổ/tan biến sau chớp sáng.
			if partHasFlashed[part] and (curTrans >= FADE_TRANSPARENCY_THRESHOLD or hasDecayedAfterFlash) then
				isExpired = true
			end
		else
			isExpired = hasDecayedAfterFlash
				or (curTrans >= FADE_TRANSPARENCY_THRESHOLD)
				or (not isException and part.Material ~= Enum.Material.Neon)
		end

		if isExpired then
			activePartsSet[part] = nil
			partMinTrans[part] = nil
			partHasFlashed[part] = nil

			if activeTrajectoryVisuals[part] then
				pcall(function() activeTrajectoryVisuals[part]:Destroy() end)
				activeTrajectoryVisuals[part] = nil
			end
			if lockedProjectiles[part] then
				lockedProjectiles[part] = nil
			end

			-- Kiểm tra xem còn Part nào đang hoạt động không
			local remaining = 0
			for _ in pairs(activePartsSet) do
				remaining = remaining + 1
			end

			if remaining == 0 then
				local reason = hasDecayedAfterFlash and "Post-flash Decay (Early Hitbox Clearance)" or "Faded / Finished"
				unregisterHazard(instance, reason)
			else
				info.NeonCount = remaining
			end
		end
	end

	for _, part in ipairs(hazardParts) do
		table.insert(partConnections, part:GetPropertyChangedSignal("Transparency"):Connect(function()
			checkPartStatus(part)
		end))
		if not isException then
			table.insert(partConnections, part:GetPropertyChangedSignal("Material"):Connect(function()
				checkPartStatus(part)
			end))
		end
		table.insert(partConnections, part.AncestryChanged:Connect(function()
			checkPartStatus(part)
		end))
	end

	-- Lắng nghe các Part con được nạp trễ vào Model (Ví dụ các Ring được gán vào sau)
	if instance:IsA("Model") then
		table.insert(partConnections, instance.DescendantAdded:Connect(function(desc)
			if not activeHazards[instance] then return end
			local isValid = desc:IsA("BasePart") and not isIgnoredPart(desc) and desc.Transparency < FADE_TRANSPARENCY_THRESHOLD
			if isValid then
				local nameLower = desc.Name:lower():gsub("%s+", "")
				if not HELPER_PART_NAMES[nameLower] then
					if isException or desc.Material == Enum.Material.Neon then
						if not activePartsSet[desc] then
							activePartsSet[desc] = true
							info.NeonCount = info.NeonCount + 1

							local initT = desc.Transparency
							partMinTrans[desc] = initT
							partHasFlashed[desc] = (initT <= 0.28)

							if getTrajectoryConfigForPart(desc) then
								lockTrajectoryForPart(desc)
							end

							if visualEspEnabled then
								local boxes = attachSelectionBoxes({ desc })
								if boxes and #boxes > 0 then
									for _, b in ipairs(boxes) do table.insert(info.VisualBoxes, b) end
								end
							end

							table.insert(partConnections, desc:GetPropertyChangedSignal("Transparency"):Connect(function()
								checkPartStatus(desc)
							end))
							table.insert(partConnections, desc.AncestryChanged:Connect(function()
								checkPartStatus(desc)
							end))
						end
					end
				end
			end
		end))
	end

	-- Tự động in cấu trúc chi tiết của thirdBossMultiRings để phân tích thông số hình học
	if instance.Name:lower():find("multiring") then
		task.delay(0.3, function()
			if not instance or not instance.Parent then return end
			local centerPart = instance:FindFirstChild("center") or instance:FindFirstChild("Center") or (hazardParts and hazardParts[1])
			local centerPos = centerPart and centerPart.Position or Vector3.zero
			print("================ [MULTIRINGS INSPECTOR DUMP] ================")
			print(("[MultiRings] Model: %s | Center: (%.1f, %.1f, %.1f)"):format(instance.Name, centerPos.X, centerPos.Y, centerPos.Z))

			local idx = 0
			for _, child in ipairs(instance:GetDescendants()) do
				if child:IsA("BasePart") then
					idx = idx + 1
					local off = child.Position - centerPos
					local _, rotY = child.CFrame:ToOrientation()
					print(("[%d] Name: '%s' | Class: %s | Size: (%.1f, %.1f, %.1f) | Offset: (%.1f, %.1f, %.1f) | RotY: %.1f deg"):format(
						idx, child.Name, child.ClassName, child.Size.X, child.Size.Y, child.Size.Z, off.X, off.Y, off.Z, math.deg(rotY)
					))
				end
			end
			print("=============================================================")
		end)
	end

	if logHazards then
		print(("[SmartDodge][Hazard] 🚨 Hazard Detected: %s | Class: %s | Parts: %d | Dist: %d studs%s")
			:format(info.Name, info.Class, info.NeonCount, info.Distance, isException and " (Exception)" or ""))
	end

	fireHazardChanged()
end

--// Hủy đăng ký hiểm họa (khi mờ, đổi material, hoặc bị xóa khỏi Workspace)
function unregisterHazard(instance, reason)
	if not activeHazards[instance] then return end
	local info = activeHazards[instance]

	-- Dọn dẹp SelectionBoxes
	if info.VisualBoxes then
		for _, box in ipairs(info.VisualBoxes) do
			pcall(function() box:Destroy() end)
		end
		table.clear(info.VisualBoxes)
	end

	-- Dọn dẹp connection của từng part
	if info.Connections then
		for _, c in ipairs(info.Connections) do
			pcall(function() c:Disconnect() end)
		end
		table.clear(info.Connections)
	end

	-- Dọn dẹp Trajectory visuals và locked data
	if info.ActiveParts then
		for p in pairs(info.ActiveParts) do
			if activeTrajectoryVisuals[p] then
				pcall(function() activeTrajectoryVisuals[p]:Destroy() end)
				activeTrajectoryVisuals[p] = nil
			end
			if lockedProjectiles[p] then
				lockedProjectiles[p] = nil
			end
		end
	end

	-- Dọn dẹp Timer Billboard
	if info.TimerBillboard then
		pcall(function() info.TimerBillboard:Destroy() end)
		info.TimerBillboard = nil
		info.TimerLabel = nil
	end

	-- Nếu đang bật chế độ Huấn luyện chơi chay (Manual Training): Ghi nhận nhịp chiêu vào RAM buffer
	if skillTimingManager and skillTimingManager.IsRecording() and info.SpawnTime then
		local duration = os.clock() - info.SpawnTime
		local hitDelay = info.HitTime and (info.HitTime - info.SpawnTime) or nil

		-- Nhận diện xem chiêu thức có phải là Projectile / Đạn bay di chuyển hay không
		local currentPos = getInstancePosition(instance, nil)
		local travelDist = (currentPos - (info.SpawnPosition or info.Position or Vector3.zero)).Magnitude
		local nameClean = (info.Name or ""):lower():gsub("%s+", "")
		local isProjectile = (TRAJECTORY_PROJECTILE_CONFIGS[nameClean] ~= nil)
			or (nameClean:find("projectile") ~= nil)
			or (nameClean:find("missile") ~= nil)
			or (nameClean:find("orb") ~= nil)
			or (nameClean:find("bullet") ~= nil)
			or (nameClean:find("ball") ~= nil)
			or (nameClean:find("movingbeam") ~= nil)
			or (nameClean:find("crisscross") ~= nil)
			or (nameClean:find("seekingspike") ~= nil)
			or (travelDist >= 6.0)

		if isProjectile then
			-- Chiêu projectile gây sát thương xuyên suốt toàn bộ vòng đời bay (HitDelay = 0.0s)
			hitDelay = 0.0
		elseif not hitDelay or hitDelay < 0.1 or hitDelay > duration then
			local _, defaultHit = getEstimatedSkillLifetime(info.Name)
			hitDelay = math.min(defaultHit, duration * 0.75)
		end

		if duration >= 0.2 and duration <= 25.0 then
			skillTimingManager.RecordSkill(info.Name, duration, hitDelay, isProjectile)
			local typeTag = isProjectile and "🚀 Projectile" or "💥 AoE"
			print(("[SkillTiming] 📝 Recorded: '%s' [%s] | Lifetime: %.2fs | HitDelay: %.2fs (%s)")
				:format(info.Name, typeTag, duration, hitDelay, reason or "Despawned"))
		else
			print(("[SkillTiming] ⚠️ Skipped '%s': duration %.2fs out of range [0.2, 25.0]")
				:format(info.Name, duration))
		end
	end

	activeHazards[instance] = nil
	hazardCount = math.max(0, hazardCount - 1)

	if logHazards and info then
		local reasonStr = reason and (" (" .. reason .. ")") or ""
		print(("[SmartDodge][Hazard] 🟢 Hazard Expired: %s%s")
			:format(info.Name, reasonStr))
	end

	fireHazardChanged()
end

--// Nội bộ cho engine: đăng ký/hủy hazard 1 instance (Workspace ChildAdded/ChildRemoved)
detection.RegisterHazard = registerHazard
detection.UnregisterHazard = unregisterHazard

--// Cập nhật tọa độ và logic quỹ đạo đạn bay / moving beam theo thời gian thực (độc lập 100% với Visual ESP)
function detection.UpdateTrajectories()
	if not threatDetectorEnabled then
		table.clear(lockedProjectiles)
		return
	end

	local currentActiveKeys = {}

	for _, info in pairs(activeHazards) do
		local inst = info.Instance
		if inst and inst.Parent then
			local instNameLower = (inst.Name or ""):lower():gsub("%s+", "")
			local isMovingBeam = inst:IsA("Model") and (instNameLower:find("movingbeam") ~= nil or (info.Name and info.Name:lower():find("movingbeam") ~= nil))

			local orbConfig = BOSS_ORB_CONFIGS[instNameLower] or (info.Name and BOSS_ORB_CONFIGS[info.Name:lower():gsub("%s+", "")])
			local isBossOrb = (orbConfig ~= nil) or (TRAJECTORY_PROJECTILE_CONFIGS[instNameLower] and TRAJECTORY_PROJECTILE_CONFIGS[instNameLower].isBossOrb)

			if isMovingBeam then
				-- Cập nhật động cho Model secondBossMovingBeam
				currentActiveKeys[inst] = true

				local modelCFrame, modelSize = inst:GetBoundingBox()
				local primary = inst:FindFirstChildWhichIsA("BasePart")
				local curPos = (primary and primary.Position) or modelCFrame.Position

				local trajData = lockedProjectiles[inst]
				if not trajData then
					trajData = lockSecondBossMovingBeam(inst)
				end

				if trajData then
					-- Cập nhật hướng tịnh tiến thực tế từ frame này sang frame khác
					local moveDelta = curPos - trajData.lastPos
					local moveDelta2D = Vector3.new(moveDelta.X, 0, moveDelta.Z)
					if moveDelta2D.Magnitude > 0.08 then
						trajData.forward2D = moveDelta2D.Unit
					end
					trajData.lastPos = curPos
					trajData.curPos = curPos

					-- Bề ngang beam bao quát cả Model (lấy trục dài nhất của BoundingBox)
					local beamSpan = math.max(modelSize.X, modelSize.Y, modelSize.Z)
					if beamSpan < 12 then beamSpan = 50.0 end
					local dangerWidth = beamSpan + trajectoryWidthPadding * 2
					local maxLookahead = (trajData.config and trajData.config.maxLookahead) or trajectoryLookahead
					local dangerDepth = maxLookahead

					trajData.dangerRadius = dangerWidth / 2
					trajData.dangerWidth = dangerWidth
					trajData.maxLookahead = dangerDepth
					trajData.dangerDepth = dangerDepth

					-- Cao độ dán chặt mặt sàn
					local curFloorY = getGeometry().GetRawFloorY(curPos)
					local thickness = 0.8
					local lockedY = curFloorY + (thickness / 2) + 0.05
					trajData.lockedVisualY = lockedY
					trajData.boxThickness = thickness
				end
			elseif isBossOrb then
				-- Cập nhật động cho Boss 2 Orbs (Yellow / Red / Green Orb bám đuổi)
				currentActiveKeys[inst] = true

				local primary = inst:IsA("BasePart") and inst or (inst:IsA("Model") and inst:FindFirstChildWhichIsA("BasePart"))
				local modelCFrame, modelSize
				if inst:IsA("Model") then
					modelCFrame, modelSize = inst:GetBoundingBox()
				end
				local curPos = (primary and primary.Position) or (modelCFrame and modelCFrame.Position) or inst.Position

				local trajData = lockedProjectiles[inst]
				if not trajData then
					trajData = lockBossOrb(inst, TRAJECTORY_PROJECTILE_CONFIGS[instNameLower])
				end

				if trajData then
					-- CẬP NHẬT ĐỘNG THEO THỜI GIAN THỰC TÙY VÀO VỊ TRÍ CỦA QUẢ CẦU VÀ VỊ TRÍ NGƯỜI CHƠI
					local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
					local playerPos = rootPart and rootPart.Position

					local dangerDepth = 22.0
					if playerPos then
						local diff = Vector3.new(playerPos.X - curPos.X, 0, playerPos.Z - curPos.Z)
						local distToPlayer = diff.Magnitude
						if distToPlayer > 0.3 then
							trajData.forward2D = diff.Unit
							-- Chiều dài hành lang cam bao trùm từ quả cầu đến tận chân người chơi (+ 4 studs buffer phía sau người chơi)
							dangerDepth = math.clamp(distToPlayer + 4.0, 10.0, 80.0)
						end
					else
						-- Fallback khi người chơi chưa spawn / đã chết: theo delta di chuyển hoặc vận tốc
						local vel = primary and (primary.AssemblyLinearVelocity or (primary:IsA("BasePart") and primary.Velocity))
						local vel2D = vel and Vector3.new(vel.X, 0, vel.Z)
						if vel2D and vel2D.Magnitude > 1.5 then
							trajData.forward2D = vel2D.Unit
						else
							local moveDelta = curPos - trajData.lastPos
							local moveDelta2D = Vector3.new(moveDelta.X, 0, moveDelta.Z)
							if moveDelta2D.Magnitude > 0.05 then
								trajData.forward2D = moveDelta2D.Unit
							end
						end
					end

					trajData.lastPos = curPos
					trajData.curPos = curPos

					local partSize = (primary and primary.Size) or modelSize or Vector3.new(6, 6, 6)
					local baseRadius = math.max(partSize.X, partSize.Z) / 2
					if baseRadius < 4.0 then baseRadius = 4.0 end
					local dangerRadius = baseRadius + trajectoryWidthPadding
					local dangerWidth = dangerRadius * 2

					trajData.dangerRadius = dangerRadius
					trajData.dangerWidth = dangerWidth
					trajData.maxLookahead = dangerDepth
					trajData.dangerDepth = dangerDepth

					local curFloorY = getGeometry().GetRawFloorY(curPos)
					local thickness = 0.8
					local lockedY = curFloorY + (thickness / 2) + 0.05
					trajData.lockedVisualY = lockedY
					trajData.boxThickness = thickness
				end
			else
				-- Cập nhật cho các Part Projectile khác (Spike, Telegraph Beam, v.v.)
				if info.ActiveParts then
					for part in pairs(info.ActiveParts) do
						if part and part.Parent and part:IsA("BasePart") then
							local trajConfig = getTrajectoryConfigForPart(part)
							if trajConfig then
								currentActiveKeys[part] = true
								local trajData = lockedProjectiles[part] or lockTrajectoryForPart(part)
								if trajData and trajData.forward2D then
									local autoWidth, autoLength = getPartAutoDimensions(part)
									local baseMinRadius = autoWidth / 2
									if trajData.config and trajData.config.dangerRadius and trajData.config.dangerRadius > baseMinRadius then
										baseMinRadius = trajData.config.dangerRadius
									end
									local dangerRadius = baseMinRadius + trajectoryWidthPadding
									local maxLookahead = autoLength or (trajData.config and trajData.config.maxLookahead) or trajData.maxLookahead or trajectoryLookahead

									trajData.dangerRadius = dangerRadius
									trajData.maxLookahead = maxLookahead
								end
							end
						end
					end
				end
			end
		end
	end

	-- Dọn dẹp những projectile không còn hoạt động trong activeHazards
	for key in pairs(lockedProjectiles) do
		if not currentActiveKeys[key] then
			lockedProjectiles[key] = nil
		end
	end
end

--// Cập nhật Visual ESP cho các hành lang quỹ đạo (Trajectory Boxes)
function detection.UpdateTrajectoryVisuals()
	if not visualEspEnabled or not threatDetectorEnabled then
		for part, vPart in pairs(activeTrajectoryVisuals) do
			pcall(function() vPart:Destroy() end)
		end
		table.clear(activeTrajectoryVisuals)
		return
	end

	local currentActiveVisuals = {}

	for _, info in pairs(activeHazards) do
		local inst = info.Instance
		if inst and inst.Parent then
			local instNameLower = (inst.Name or ""):lower():gsub("%s+", "")
			local isMovingBeam = (instNameLower:find("movingbeam") ~= nil or (info.Name and info.Name:lower():find("movingbeam") ~= nil))
			local orbConfig = BOSS_ORB_CONFIGS[instNameLower] or (info.Name and BOSS_ORB_CONFIGS[info.Name:lower():gsub("%s+", "")])
			local isBossOrb = (orbConfig ~= nil) or (TRAJECTORY_PROJECTILE_CONFIGS[instNameLower] and TRAJECTORY_PROJECTILE_CONFIGS[instNameLower].isBossOrb)

			if isMovingBeam then
				-- =========================================================================
				-- XỬ LÝ VISUAL CẤP MODEL CHO SECOND BOSS MOVING BEAM
				-- =========================================================================
				local trajData = lockedProjectiles[inst]
				if not trajData and lockSecondBossMovingBeam then
					trajData = lockSecondBossMovingBeam(inst)
				end
				if trajData then
					currentActiveVisuals[inst] = true

					local curPos = trajData.curPos or (inst:IsA("Model") and select(1, inst:GetBoundingBox()).Position) or inst.Position
					local forward2D = trajData.forward2D or Vector3.new(0, 0, -1)
					local dangerWidth = trajData.dangerWidth or (trajData.dangerRadius * 2)
					local dangerDepth = trajData.dangerDepth or trajData.maxLookahead or 50.0
					local lockedY = trajData.lockedVisualY or (getGeometry().GetRawFloorY(curPos) + 0.45)
					local thickness = trajData.boxThickness or 0.8

					local vPart = activeTrajectoryVisuals[inst]
					if not vPart or not vPart.Parent then
						vPart = Instance.new("Part")
						vPart.Name = "SmartDodge_TrajectoryBox"
						vPart.Material = Enum.Material.Neon
						vPart.Color = Color3.fromRGB(255, 130, 0)
						vPart.Transparency = 0.82
						vPart.Anchored = true
						vPart.CanCollide = false
						vPart.CanQuery = false
						vPart.CanTouch = false

						local box = Instance.new("SelectionBox")
						box.Name = "TrajectoryBorder"
						box.Color3 = Color3.fromRGB(255, 150, 30)
						box.SurfaceColor3 = Color3.fromRGB(255, 130, 0)
						box.SurfaceTransparency = 0.8
						box.LineThickness = 0.04
						box.Adornee = vPart
						box.Parent = vPart

						local bb = Instance.new("BillboardGui")
						bb.Name = "TrajGui"
						bb.Size = UDim2.fromOffset(220, 26)
						bb.StudsOffset = Vector3.new(0, 2.5, 0)
						bb.AlwaysOnTop = true
						bb.Adornee = vPart
						bb.Parent = vPart

						local label = Instance.new("TextLabel")
						label.Name = "Label"
						label.Size = UDim2.fromScale(1, 1)
						label.BackgroundTransparency = 1
						label.TextColor3 = Color3.fromRGB(255, 170, 40)
						label.TextStrokeTransparency = 0
						label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
						label.Font = Enum.Font.GothamBold
						label.TextSize = 12
						label.Text = ("🚀 MOVING BEAM: %s (%.0fm | W:%.1fm)"):format(inst.Name, dangerDepth, dangerWidth)
						label.Parent = bb

						activeTrajectoryVisuals[inst] = vPart
					else
						local tg = vPart:FindFirstChild("TrajGui")
						local lbl = tg and tg:FindFirstChild("Label")
						if lbl and lbl:IsA("TextLabel") then
							lbl.Text = ("🚀 MOVING BEAM: %s (%.0fm | W:%.1fm)"):format(inst.Name, dangerDepth, dangerWidth)
						end
					end

					vPart.Size = Vector3.new(dangerWidth, thickness, dangerDepth)
					local visualCenter = Vector3.new(curPos.X, lockedY, curPos.Z) + forward2D * ((dangerDepth / 2) - 1.5)
					vPart.CFrame = CFrame.lookAt(visualCenter, visualCenter + forward2D)
					vPart.Parent = Workspace.Terrain
				end
			elseif isBossOrb then
				-- =========================================================================
				-- XỬ LÝ VISUAL CHO BOSS 2 ORBS (Yellow / Red / Green Orb)
				-- =========================================================================
				local trajData = lockedProjectiles[inst]
				if trajData then
					currentActiveVisuals[inst] = true

					local curPos = trajData.curPos or inst.Position
					local forward2D = trajData.forward2D or Vector3.new(0, 0, -1)
					local dangerWidth = trajData.dangerWidth or (trajData.dangerRadius * 2)
					local dangerDepth = trajData.dangerDepth or trajData.maxLookahead or 22.0
					local lockedY = trajData.lockedVisualY or (getGeometry().GetRawFloorY(curPos) + 0.45)
					local thickness = trajData.boxThickness or 0.8
					local orbColorName = (trajData.config and trajData.config.orbColorName) or (orbConfig and orbConfig.colorName) or "orb"

					local vPart = activeTrajectoryVisuals[inst]
					if not vPart or not vPart.Parent then
						vPart = Instance.new("Part")
						vPart.Name = "SmartDodge_TrajectoryBox"
						vPart.Material = Enum.Material.Neon
						vPart.Color = Color3.fromRGB(255, 130, 0)
						vPart.Transparency = 0.82
						vPart.Anchored = true
						vPart.CanCollide = false
						vPart.CanQuery = false
						vPart.CanTouch = false

						local box = Instance.new("SelectionBox")
						box.Name = "TrajectoryBorder"
						box.Color3 = Color3.fromRGB(255, 150, 30)
						box.SurfaceColor3 = Color3.fromRGB(255, 130, 0)
						box.SurfaceTransparency = 0.8
						box.LineThickness = 0.04
						box.Adornee = vPart
						box.Parent = vPart

						local bb = Instance.new("BillboardGui")
						bb.Name = "TrajGui"
						bb.Size = UDim2.fromOffset(220, 26)
						bb.StudsOffset = Vector3.new(0, 2.5, 0)
						bb.AlwaysOnTop = true
						bb.Adornee = vPart
						bb.Parent = vPart

						local label = Instance.new("TextLabel")
						label.Name = "Label"
						label.Size = UDim2.fromScale(1, 1)
						label.BackgroundTransparency = 1
						label.TextColor3 = Color3.fromRGB(255, 170, 40)
						label.TextStrokeTransparency = 0
						label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
						label.Font = Enum.Font.GothamBold
						label.TextSize = 12
						label.Text = ("🚀 %s ORB: %s (%.0fm | W:%.1fm)"):format(orbColorName:upper(), inst.Name, dangerDepth, dangerWidth)
						label.Parent = bb

						activeTrajectoryVisuals[inst] = vPart
					else
						local tg = vPart:FindFirstChild("TrajGui")
						local lbl = tg and tg:FindFirstChild("Label")
						if lbl and lbl:IsA("TextLabel") then
							lbl.Text = ("🚀 %s ORB: %s (%.0fm | W:%.1fm)"):format(orbColorName:upper(), inst.Name, dangerDepth, dangerWidth)
						end
					end

					vPart.Size = Vector3.new(dangerWidth, thickness, dangerDepth)
					local visualCenter = Vector3.new(curPos.X, lockedY, curPos.Z) + forward2D * ((dangerDepth / 2) - 2.0)
					vPart.CFrame = CFrame.lookAt(visualCenter, visualCenter + forward2D)
					vPart.Parent = Workspace.Terrain
				end
			else
				-- =========================================================================
				-- XỬ LÝ CHO CÁC PART PROJECTILE KHÁC (Spike, Telegraph Beam, v.v.)
				-- =========================================================================
				if info.ActiveParts then
					for part in pairs(info.ActiveParts) do
						if part and part.Parent and part:IsA("BasePart") then
							local trajConfig = getTrajectoryConfigForPart(part)
							if trajConfig then
								local isBeam = part.Name:lower():find("beampart") ~= nil
								local isMissile = part.Name:lower():find("missile") ~= nil
								local hasDuplicate = false
								if isBeam or isMissile then
									for otherPart in pairs(currentActiveVisuals) do
										if otherPart ~= part and otherPart:IsA("BasePart") and (otherPart.Position - part.Position).Magnitude < 6 then
											hasDuplicate = true
											break
										end
									end
								end

								if not hasDuplicate then
									local trajData = lockedProjectiles[part]
									if trajData and trajData.forward2D then
										currentActiveVisuals[part] = true

										local maxLookahead = trajData.maxLookahead or trajectoryLookahead
										local dangerRadius = trajData.dangerRadius or 4.0
										local forward2D = trajData.forward2D
										local originPos = part.Position
										local centerPos = originPos + forward2D * (maxLookahead / 2)

										local lockedY = trajData.lockedVisualY or (trajData.rawFloorY and (trajData.rawFloorY + 0.45)) or (getGeometry().GetRawFloorY(originPos) + 0.45)
										local thickness = trajData.boxThickness or 0.8

										local depth = maxLookahead
										local boxWidth = dangerRadius * 2
										local labelText = ("🚀 TRAJECTORY: %s (%.0fm | W:%.1fm)"):format(part.Name, maxLookahead, boxWidth)

										local vPart = activeTrajectoryVisuals[part]
										if not vPart or not vPart.Parent then
											vPart = Instance.new("Part")
											vPart.Name = "SmartDodge_TrajectoryBox"
											vPart.Material = Enum.Material.Neon
											vPart.Color = trajConfig.visualColor or Color3.fromRGB(255, 130, 0)
											vPart.Transparency = 0.82
											vPart.Anchored = true
											vPart.CanCollide = false
											vPart.CanQuery = false
											vPart.CanTouch = false

											local box = Instance.new("SelectionBox")
											box.Name = "TrajectoryBorder"
											box.Color3 = Color3.fromRGB(255, 150, 30)
											box.SurfaceColor3 = trajConfig.visualColor or Color3.fromRGB(255, 130, 0)
											box.SurfaceTransparency = 0.8
											box.LineThickness = 0.04
											box.Adornee = vPart
											box.Parent = vPart

											local bb = Instance.new("BillboardGui")
											bb.Name = "TrajGui"
											bb.Size = UDim2.fromOffset(200, 26)
											bb.StudsOffset = Vector3.new(0, 2.5, 0)
											bb.AlwaysOnTop = true
											bb.Adornee = vPart
											bb.Parent = vPart

											local label = Instance.new("TextLabel")
											label.Name = "Label"
											label.Size = UDim2.fromScale(1, 1)
											label.BackgroundTransparency = 1
											label.TextColor3 = Color3.fromRGB(255, 170, 40)
											label.TextStrokeTransparency = 0
											label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
											label.Font = Enum.Font.GothamBold
											label.TextSize = 12
											label.Text = labelText
											label.Parent = bb

											activeTrajectoryVisuals[part] = vPart
										else
											local tg = vPart:FindFirstChild("TrajGui")
											local lbl = tg and tg:FindFirstChild("Label")
											if lbl and lbl:IsA("TextLabel") then
												lbl.Text = labelText
											end
										end

										vPart.Size = Vector3.new(boxWidth, thickness, depth)
										local visualCenter = Vector3.new(centerPos.X, lockedY, centerPos.Z)
										vPart.CFrame = CFrame.lookAt(visualCenter, visualCenter + forward2D)
										vPart.Parent = Workspace.Terrain
									end
								end
							end
						end
					end
				end
			end
		end
	end

	-- Dọn dẹp những visual đã hết hạn
	for part, vPart in pairs(activeTrajectoryVisuals) do
		if not currentActiveVisuals[part] then
			pcall(function() vPart:Destroy() end)
			activeTrajectoryVisuals[part] = nil
		end
	end
end

--// Dọn sạch toàn bộ visual của các hành lang đạn bay (không xóa lockedProjectiles)
function detection.ClearTrajectoryVisuals()
	for part, vPart in pairs(activeTrajectoryVisuals) do
		pcall(function() vPart:Destroy() end)
	end
	table.clear(activeTrajectoryVisuals)
end

--// Xóa sạch toàn bộ hiểm họa hiện tại (khi Boss chết, phòng dọn sạch hoặc engine dừng) (Tầng 1)
function detection.ClearAllHazards(reason)
	local toRemove = {}
	for inst in pairs(activeHazards) do
		table.insert(toRemove, inst)
	end
	for _, inst in ipairs(toRemove) do
		unregisterHazard(inst, reason or "Purged")
	end
	table.clear(activeHazards)
	table.clear(lockedProjectiles)
	hazardCount = 0
	detection.ClearTrajectoryVisuals()
	fireHazardChanged()
	if logHazards and reason then
		print(("[SmartDodge][Hazard] 🧹 All hazards cleared: %s"):format(reason))
	end
end

--// Bắt đầu quét & lắng nghe sự kiện Workspace cấp 1 (được engine gọi khi StartEngine)
function detection.StartScan()
	-- Dọn dẹp connection cũ nếu có
	for _, c in ipairs(connections) do c:Disconnect() end
	table.clear(connections)

	for _, cleanup in ipairs(sharedCleanups) do pcall(cleanup) end
	table.clear(sharedCleanups)

	-- Dọn dẹp hazards cũ
	detection.ClearAllHazards("StartScan Reset")

	-- 1. Quét tức thời các child Depth 1 hiện tại trong Workspace
	for _, child in ipairs(Workspace:GetChildren()) do
		registerHazard(child)
	end

	-- 2. Lắng nghe vật thể mới sinh ra ở Workspace (Depth 1)
	table.insert(connections, Workspace.ChildAdded:Connect(function(child)
		registerHazard(child)
	end))

	-- 3. Lắng nghe vật thể bị xóa khỏi Workspace (Depth 1)
	table.insert(connections, Workspace.ChildRemoved:Connect(function(child)
		unregisterHazard(child, "Destroyed")
	end))

	-- 4. Lắng nghe Boss bị tiêu diệt hoặc kết thúc Boss Room (Tầng 1)
	local unsubBoss = shared.OnBossActiveChanged(function(active)
		if not active then
			detection.ClearAllHazards("Boss Defeated")
		end
	end)
	table.insert(sharedCleanups, unsubBoss)

	-- 5. Lắng nghe kẻ địch chết hoặc phòng được dọn sạch (Tầng 1 & 2)
	local unsubEnemy = shared.OnEnemyChanged(function()
		local count = shared.GetEnemyCount()
		if count == 0 and not shared.IsBossActive() then
			detection.ClearAllHazards("Room Cleared")
		else
			-- Quét nhanh hủy các chiêu có Caster vừa tử trận
			for inst, info in pairs(activeHazards) do
				if info.CasterHumanoid and (info.CasterHumanoid.Health <= 0 or not info.Caster or not info.Caster.Parent) then
					task.spawn(function()
						unregisterHazard(inst, "Caster Dead")
					end)
				end
			end
		end
	end)
	table.insert(sharedCleanups, unsubEnemy)

	if logHazards then
		print("[SmartDodge] 📡 Threat Detector & Safe Spot Engine started!")
	end
end

--// Dừng quét, dọn hazards và connection (được engine gọi khi StopEngine/Shutdown)
function detection.StopScan()
	for _, c in ipairs(connections) do c:Disconnect() end
	table.clear(connections)

	for _, cleanup in ipairs(sharedCleanups) do pcall(cleanup) end
	table.clear(sharedCleanups)

	detection.ClearAllHazards("StopScan")

	if logHazards then
		print("[SmartDodge] 🛑 Threat Detector stopped.")
	end
end

--// Public accessors (facade chỉ proxy)
function detection.SetLogHazards(state)
	logHazards = state and true or false
end

function detection.IsLogHazardsEnabled()
	return logHazards
end

function detection.SetVisualEsp(state)
	visualEspEnabled = state and true or false
	detection.UpdateTrajectoryVisuals()
	if visualEspEnabled then
		for _, info in pairs(activeHazards) do
			if (not info.VisualBoxes or #info.VisualBoxes == 0) and info.ActiveParts then
				local partsList = {}
				for p in pairs(info.ActiveParts) do
					table.insert(partsList, p)
				end
				info.VisualBoxes = attachSelectionBoxes(partsList)
			end
		end
	else
		for _, info in pairs(activeHazards) do
			if info.VisualBoxes then
				for _, box in ipairs(info.VisualBoxes) do
					pcall(function() box:Destroy() end)
				end
				table.clear(info.VisualBoxes)
			end
		end
	end
end

function detection.IsVisualEspEnabled()
	return visualEspEnabled
end

function detection.GetHazardCount()
	return hazardCount
end

function detection.GetActiveHazards()
	local list = {}
	for _, data in pairs(activeHazards) do
		if data.Instance and data.Instance.Parent == Workspace then
			table.insert(list, data)
		end
	end
	return list
end

function detection.GetLastHazardInfo()
	return lastHazardInfo
end

function detection.OnHazardChanged(callback)
	if type(callback) ~= "function" then return end
	table.insert(hazardChangedCallbacks, callback)
end

--// Trả về Boss 2 Orb đang kích hoạt (nếu có): part, colorName ("yellow"|"red"|"green"), instance, config
function detection.GetActiveBossOrb()
	for inst, info in pairs(activeHazards) do
		if inst and inst.Parent then
			local cleanName = (inst.Name or ""):lower():gsub("%s+", "")
			local orbConf = BOSS_ORB_CONFIGS[cleanName]
			if not orbConf then
				if cleanName:find("yelloworb") then
					orbConf = BOSS_ORB_CONFIGS["secondbossyelloworb"]
				elseif cleanName:find("redorb") then
					orbConf = BOSS_ORB_CONFIGS["secondbossredorb"]
				elseif cleanName:find("greenorb") then
					orbConf = BOSS_ORB_CONFIGS["secondbossgreenorb"]
				end
			end

			if orbConf then
				local part = inst:IsA("BasePart") and inst or nil
				if not part and info.ActiveParts then
					for p in pairs(info.ActiveParts) do
						if p and p.Parent and p:IsA("BasePart") then
							part = p
							break
						end
					end
				end
				if not part then
					part = inst:FindFirstChildWhichIsA("BasePart")
				end
				if part and part.Parent then
					return part, orbConf.colorName, inst, orbConf
				end
			end
		end
	end
	return nil, nil, nil, nil
end

--// Trả về thời gian còn lại (giây) của một hazard trước khi tự biến mất và trước khi giáng damage
function detection.GetHazardTimeRemaining(instance)
	local info = activeHazards[instance]
	if not info or not info.SpawnTime then return nil, nil, 0, nil, nil end
	local elapsed = os.clock() - info.SpawnTime
	local estTotal, estHit = getEstimatedSkillLifetime(info.Name)
	local remainingTotal = math.max(0, estTotal - elapsed)
	local remainingToHit = math.max(0, estHit - elapsed)
	return remainingTotal, estTotal, elapsed, remainingToHit, estHit
end

--// Lấy thông tin thống kê thời gian sống của một kỹ năng
function detection.GetSkillProfile(skillName)
	return skillProfiles[skillName]
end

--// Lấy toàn bộ hồ sơ thời gian sống của các chiêu thức đã học
function detection.GetAllSkillProfiles()
	return skillProfiles
end

--// Cập nhật nhãn đếm ngược 3D trên đầu các hazard đang hoạt động
function detection.UpdateHazardTimers()
	if not showSkillTimers then return end
	local now = os.clock()
	for _, info in pairs(activeHazards) do
		if info.TimerLabel and info.SpawnTime then
			local elapsed = now - info.SpawnTime
			local estTotal, estHit = getEstimatedSkillLifetime(info.Name)
			local remainingTotal = math.max(0, estTotal - elapsed)
			local remainingToHit = math.max(0, estHit - elapsed)

			local color
			local text
			if remainingToHit > 0 then
				-- Đang trong giai đoạn telegraph / chuẩn bị giáng damage
				if remainingToHit <= 0.4 then
					color = Color3.fromRGB(255, 60, 60) -- Đỏ rực: sát thương sắp giáng xuống!
				elseif remainingToHit <= 1.0 then
					color = Color3.fromRGB(255, 160, 0) -- Cam: sắp nổ
				else
					color = Color3.fromRGB(255, 230, 80) -- Vàng: đang precast
				end
				text = string.format("%s\n💥 HIT IN: %.1fs (⏳ %.1fs)", info.Name, remainingToHit, remainingTotal)
			else
				-- Đã kích nổ damage xong! Đang trong giai đoạn tàn dư animation/fading
				color = Color3.fromRGB(80, 255, 120) -- Xanh neon: Đã nổ xong (an toàn để bước vào nếu tàn dư vô hại)
				text = string.format("%s\n✅ DETONATED! (⏳ %.1fs)", info.Name, remainingTotal)
			end

			info.TimerLabel.TextColor3 = color
			info.TimerLabel.Text = text
		end
	end
end

--// Bật/tắt hiển thị đếm ngược 3D Countdown trên đầu chiêu thức
function detection.SetShowSkillTimers(state)
	showSkillTimers = state and true or false
	if not showSkillTimers then
		for _, info in pairs(activeHazards) do
			if info.TimerBillboard then
				pcall(function() info.TimerBillboard:Destroy() end)
				info.TimerBillboard = nil
				info.TimerLabel = nil
			end
		end
	else
		for inst, info in pairs(activeHazards) do
			if not info.TimerBillboard and info.ActiveParts then
				local partsList = {}
				for p in pairs(info.ActiveParts) do
					table.insert(partsList, p)
				end
				info.TimerBillboard, info.TimerLabel = attachHazardTimerBillboard(inst, partsList, info.Name)
			end
		end
	end
end

function detection.IsShowSkillTimersEnabled()
	return showSkillTimers
end

--// Bật/tắt chế độ tự động học thời gian tồn tại & điểm kích nổ sát thương của kỹ năng
function detection.SetAutoLearnSkillLifetimes(state)
	autoLearnSkillLifetimes = state and true or false
end

function detection.IsAutoLearnSkillLifetimesEnabled()
	return autoLearnSkillLifetimes
end

detection.SaveSkillProfiles = skillTimingManager.SaveRecordedData
detection.LoadSkillProfiles = skillTimingManager.LoadMapData
detection.skillTimingManager = skillTimingManager

return detection end function __DIST.o()-- Target Movement System – Component C: Target Selector & Path Calculator
-- Spec: Sections 5 & 6 (Roblox_Target_Movement_System_AI_Spec.txt)


local PathfindingService = game:GetService("PathfindingService")

local selector = {}

local PATH_PARAMS = {
	AgentRadius = 1,
	AgentHeight = 5,
	AgentCanJump = true,
	AgentCanClimb = true,
	AgentMaxSlope = 75,
	WaypointSpacing = 4,
	Costs = { Water = 20, Lava = 20 },
}

local PATH_PARAMS_RELAXED = {
	AgentRadius = 0.25,
	AgentHeight = 4,
	AgentCanJump = true,
	AgentCanClimb = true,
	AgentMaxSlope = 90,
	WaypointSpacing = 6,
	Costs = {},
}

--// Computes Pathfinding path and movement cost along waypoints.
function selector.ComputePathWithCost(startPos, destPos)
	for _, params in ipairs({ PATH_PARAMS, PATH_PARAMS_RELAXED }) do
		local path = PathfindingService:CreatePath(params)
		local ok = pcall(function()
			path:ComputeAsync(startPos, destPos)
		end)
		if ok and path.Status == Enum.PathStatus.Success then
			local waypoints = path:GetWaypoints()
			if waypoints and #waypoints > 0 then
				local totalCost = 0
				local prev = startPos
				for i = 1, #waypoints do
					local w = waypoints[i].Position
					totalCost += (w - prev).Magnitude
					prev = w
				end
				return path, waypoints, totalCost
			end
		end
		pcall(function() path:Destroy() end)
	end
	return nil, nil, math.huge
end

--// Evaluates all valid enemies and selects the one with the lowest Pathfinding movement cost.
function selector.SelectBestTarget(playerPos, validEnemies, cancelCheck)
	local bestTarget = nil
	local bestCost = math.huge
	local bestPath = nil
	local bestWaypoints = nil
	local bestPos = nil

	for _, enemyData in ipairs(validEnemies) do
		if cancelCheck and cancelCheck() then
			if bestPath then pcall(function() bestPath:Destroy() end) end
			return nil, nil, nil, nil, math.huge
		end

		local root = enemyData.Root
		if root and root.Parent then
			local ePos = root.Position
			local path, waypoints, cost = selector.ComputePathWithCost(playerPos, ePos)
			if cancelCheck and cancelCheck() then
				if path then pcall(function() path:Destroy() end) end
				if bestPath then pcall(function() bestPath:Destroy() end) end
				return nil, nil, nil, nil, math.huge
			end

			if path and cost < bestCost then
				if bestPath then pcall(function() bestPath:Destroy() end) end
				bestCost = cost
				bestTarget = enemyData
				bestPath = path
				bestWaypoints = waypoints
				bestPos = ePos
			else
				if path then pcall(function() path:Destroy() end) end
			end
		end
	end

	return bestTarget, bestPath, bestWaypoints, bestPos, bestCost
end

return selector
end function __DIST.p()-- Auto Farm System – Component A & B: Enemy Scanner & Enemy Validator
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
end function __DIST.q()-- Target Movement System – Component D: Target Tracker & Path Manager
-- Spec: Sections 7, 8, 14, 15 (Roblox_Target_Movement_System_AI_Spec.txt)


local selector = __DIST.load('o')
local scanner = __DIST.load('p')

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
end function __DIST.r()-- Smart Dodge – Module phụ: Target Facing Manager (DungeonQuest)
-- Chuyên trách: Tự động định vị mục tiêu hiện tại (Target của Auto Farm hoặc quái gần nhất)
-- và điều khiển nhân vật luôn quay mặt về phía mục tiêu (sử dụng Humanoid.AutoRotate = false).

--// Imports

local services = __DIST.load('e')
local shared = __DIST.load('f')
local lifecycle = __DIST.load('b')
local tracker = __DIST.load('q')

--// References
local player = services.player

--// State
local enabled = false
local facingThread = nil
local isDodging = false

local targetFacing = {}

function targetFacing.SetDodging(state)
	isDodging = state and true or false
end

local function getPlayerRoot()
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if root and root.Parent then return root end
	return nil
end

local function getHumanoid()
	local char = player and player.Character
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Parent then return hum end
	return nil
end

local function applyAutoRotateState()
	local hum = getHumanoid()
	if hum then
		if enabled and targetFacing.IsTargetActive() then
			hum.AutoRotate = false
		else
			hum.AutoRotate = true
		end
	end
end

--// Lấy vị trí Vector3 của Target hiện tại (Auto Farm target hoặc quái gần nhất)
function targetFacing.GetTargetPosition()
	-- 1. Ưu tiên target của Auto Farm nếu đang có
	local afTarget = tracker.GetTarget()
	if afTarget and afTarget.Root and afTarget.Root.Parent then
		local hum = afTarget.Humanoid or (afTarget.Model and afTarget.Model:FindFirstChildOfClass("Humanoid"))
		if hum and hum.Health > 0 then
			return afTarget.Root.Position
		end
	end

	-- 2. Fallback: Lấy quái gần nhất trong danh sách đang track của shared
	local rootPart = getPlayerRoot()
	local pPos = rootPart and rootPart.Position
	local tracked = shared.GetTrackedEnemyData()
	if tracked and #tracked > 0 and pPos then
		local nearestPos = nil
		local nearestDistSq = math.huge
		for _, data in ipairs(tracked) do
			if data and data.Root and data.Root.Parent then
				local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
				if hum and hum.Health > 0 then
					local distSq = (data.Root.Position - pPos).Magnitude
					if distSq < nearestDistSq then
						nearestDistSq = distSq
						nearestPos = data.Root.Position
					end
				end
			end
		end
		return nearestPos
	end

	return nil
end

--// Kiểm tra xem có mục tiêu đang hoạt động hay không
function targetFacing.IsTargetActive()
	return targetFacing.GetTargetPosition() ~= nil
end

--// Vòng lặp ép quay mặt về mục tiêu
local function startFacingLoop()
	if facingThread then return end
	applyAutoRotateState()

	facingThread = task.spawn(function()
		while enabled and lifecycle.IsActive() do
			if not isDodging then
				local targetPos = targetFacing.GetTargetPosition()
				local rootPart = getPlayerRoot()
				local humanoid = getHumanoid()

				if targetPos then
					if rootPart and humanoid and humanoid.Health > 0 then
						-- Chỉ khóa AutoRotate khi CÓ MỤC TIÊU
						if humanoid.AutoRotate ~= false then
							humanoid.AutoRotate = false
						end

						local pPos = rootPart.Position
						local target = Vector3.new(targetPos.X, pPos.Y, targetPos.Z)
						local diff = target - pPos

						if diff.Magnitude > 0.5 then
							local curLook = rootPart.CFrame.LookVector
							local wantLook = Vector3.new(diff.X, 0, diff.Z).Unit
							-- Chỉ chỉnh CFrame nếu góc lệch đáng kể để mượt mà
							if curLook:Dot(wantLook) < 0.999 then
								rootPart.CFrame = CFrame.lookAt(pPos, target)
							end
						end
					end
				else
					-- KHÔNG CÓ ENEMY -> Mở lại AutoRotate để nhân vật xoay hướng tự nhiên
					if humanoid and humanoid.Health > 0 and humanoid.AutoRotate ~= true then
						humanoid.AutoRotate = true
					end
				end
			end
			task.wait(0.03)
		end
		facingThread = nil
	end)
end

local function stopFacingLoop()
	if facingThread then
		task.cancel(facingThread)
		facingThread = nil
	end
	-- Khôi phục lại AutoRotate = true
	local hum = getHumanoid()
	if hum then
		hum.AutoRotate = true
	end
end

--// Bật / tắt tính năng Auto Face Target
function targetFacing.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		startFacingLoop()
	else
		stopFacingLoop()
	end
end

function targetFacing.IsEnabled()
	return enabled
end

--// Lắng nghe respawn để set lại AutoRotate
shared.OnRespawn(function()
	if enabled then
		task.defer(function()
			applyAutoRotateState()
		end)
	end
end)

--// Tự động dọn dẹp khi script shutdown
lifecycle.Register(function()
	stopFacingLoop()
end)

return targetFacing
end function __DIST.s()-- Smart Dodge – Module 3+4: Safe Spot Calculation & Player Visuals (DungeonQuest).
-- Chuyên trách: Tính toán điểm thoát nạn (CalculateSafeSpot + latching lock + 3 chiến lược thoát)
-- và visual quanh người: Safe Marker xanh, Hitbox Padding cyan.

--// Imports

local services = __DIST.load('e')
local shared = __DIST.load('f')
local geometry = __DIST.load('m')
local detection = __DIST.load('n')
local targetFacing = __DIST.load('r')

--// References
local Workspace = game:GetService("Workspace")
local player = services.player

--// State
local showSafeMarker = true
local showPlayerRadar = true
local lockedSafeSpot = nil
local lockedHazardCount = 0
local safeSpotMarkerPart = nil
local hitboxVisualPart = nil
local showHitboxVisual = false
local ESCAPE_MARGIN = 2.6           -- Khoảng cách đệm an toàn sau khi ra khỏi mép (studs) - đảm bảo vượt qua playerHitboxPadding 1.8m
local BOSS1_DEFAULT_RADIUS = 50.0   -- Bán kính mặc định sàn đấu Boss 1 nếu không tìm thấy FirstPart
local boss1ArenaRadius = BOSS1_DEFAULT_RADIUS
local boss1ArenaCenter = nil
local boss1ArenaVisualPart = nil
local lockedArenaFloorY = nil
local RADIAL_DISTANCES = { 2.5, 4.5, 7.0, 10.5, 15.0, 20.0, 26.0, 33.0, 42.0, 52.0 }
local ANGLE_OFFSETS_12 = { 0, 30, -30, 60, -60, 90, -90, 120, -120, 150, -150, 180 }

--// Trạng thái visual gần nhất (để replay khi bật/tắt toggle từ UI — engine cập nhật mỗi nhịp)
local lastMarkerPos, lastMarkerInDanger, lastMarkerEscapeDist = nil, false, 0
local lastHitboxPlayerPos = nil
local lastRadarPlayerPos, lastRadarInDanger = nil, false
local playerRadarPool = {}
local radarLatchedOrigin = nil
local isDodgeRadarActive = false
local currentRadarDodgeKey = nil
local lastDangerPart = nil
local lastCurrentHazardsSet = nil

local safeSpot = {}

--// Public: accessor show/marker/hitbox

function safeSpot.IsShowSafeMarkerEnabled()
	return showSafeMarker
end

function safeSpot.SetShowSafeMarker(state)
	showSafeMarker = state and true or false
	safeSpot.UpdateMarker(lastMarkerPos, lastMarkerInDanger, lastMarkerEscapeDist)
end

function safeSpot.IsShowPlayerRadarEnabled()
	return showPlayerRadar
end

function safeSpot.SetShowPlayerRadar(state)
	showPlayerRadar = state and true or false
	if not showPlayerRadar then
		safeSpot.ClearPlayerRadar()
	else
		safeSpot.UpdatePlayerRadar(lastRadarPlayerPos, lastRadarInDanger)
	end
end


function safeSpot.IsShowHitboxVisualEnabled()
	return showHitboxVisual
end

function safeSpot.SetShowHitboxVisual(state)
	showHitboxVisual = state and true or false
	safeSpot.UpdateHitbox(lastHitboxPlayerPos)
end

--// Set Hitbox Padding: cập nhật số học (module geometry) + resize visual nếu đang hiển thị
function safeSpot.SetHitboxPadding(value)
	geometry.SetHitboxPadding(value)
	if hitboxVisualPart and hitboxVisualPart.Parent then
		local diameter = math.max(0.4, geometry.GetHitboxPadding() * 2)
		hitboxVisualPart.Size = Vector3.new(0.15, diameter, diameter)
	end
end

function safeSpot.GetBoss1ArenaCenter()
	return boss1ArenaCenter
end

function safeSpot.GetBoss1ArenaRadius()
	return boss1ArenaRadius or BOSS1_DEFAULT_RADIUS
end

--// Quản lý Highlight cột pha lê Boss 2 (secondBossCrystals)
local targetCrystalHighlight = nil
local lastHighlightedCrystal = nil

local function clearCrystalHighlight()
	if targetCrystalHighlight then
		pcall(function() targetCrystalHighlight:Destroy() end)
		targetCrystalHighlight = nil
	end
	lastHighlightedCrystal = nil
end

local function updateCrystalHighlight(crystalPart, colorName)
	if not crystalPart or not crystalPart.Parent then
		clearCrystalHighlight()
		return
	end
	if lastHighlightedCrystal == crystalPart and targetCrystalHighlight and targetCrystalHighlight.Parent then
		return
	end

	clearCrystalHighlight()
	lastHighlightedCrystal = crystalPart

	pcall(function()
		local box = Instance.new("SelectionBox")
		box.Name = "SmartDodge_CrystalGuideBox"
		local c = (colorName == "green" and Color3.fromRGB(50, 255, 50))
			or (colorName == "yellow" and Color3.fromRGB(255, 230, 0))
			or Color3.fromRGB(255, 45, 45)
		box.Color3 = c
		box.SurfaceColor3 = c
		box.SurfaceTransparency = 0.5
		box.LineThickness = 0.08
		box.Adornee = crystalPart
		box.Parent = crystalPart
		targetCrystalHighlight = box
	end)
end

local cachedSecondBossCrystals = nil

local function getBossCrystal(colorName)
	local crystalsModel = cachedSecondBossCrystals
	if not crystalsModel or not crystalsModel.Parent then
		crystalsModel = Workspace:FindFirstChild("secondBossCrystals")
		if not crystalsModel then
			local dungeon = Workspace:FindFirstChild("dungeon")
			if dungeon then
				crystalsModel = dungeon:FindFirstChild("secondBossCrystals", true)
			end
		end
		if not crystalsModel then
			crystalsModel = Workspace:FindFirstChild("secondBossCrystals", true)
		end
		if crystalsModel then
			cachedSecondBossCrystals = crystalsModel
		end
	end
	if not crystalsModel then return nil, {} end

	local targetCrystal = nil
	local wrongCrystals = {}
	local targetColorLower = colorName and colorName:lower() or ""

	for _, child in ipairs(crystalsModel:GetChildren()) do
		local cNameLower = child.Name:lower()
		local p = child:IsA("BasePart") and child or child:FindFirstChildWhichIsA("BasePart")
		if p then
			if #targetColorLower > 0 and (cNameLower == targetColorLower or cNameLower:find(targetColorLower)) then
				targetCrystal = p
			else
				table.insert(wrongCrystals, p)
			end
		end
	end

	return targetCrystal, wrongCrystals
end

local cachedFirstBossPart = nil

--// Tìm kiếm Part giới hạn sàn đấu Boss 1 của game (workspace.FirstPart)
local function getFirstBossArenaPart()
	if cachedFirstBossPart and cachedFirstBossPart.Parent then
		return cachedFirstBossPart
	end

	-- 1. Tìm trực tiếp tại root Workspace (0.001ms)
	local p = Workspace:FindFirstChild("FirstPart")
	-- 2. Quét trong folder dungeon nếu có
	if not p then
		local dungeon = Workspace:FindFirstChild("dungeon")
		if dungeon then
			p = dungeon:FindFirstChild("FirstPart", true)
		end
	end
	-- 3. Fallback quét toàn bộ Workspace 1 lần duy nhất
	if not p then
		p = Workspace:FindFirstChild("FirstPart", true)
	end

	if p and p:IsA("BasePart") then
		cachedFirstBossPart = p
		return p
	end
	return nil
end

--// Quản lý Visual và giới hạn Sàn Đấu Boss 1 (Boss 1 Arena Visual & Boundary)
local function clearBoss1ArenaVisual()
	if boss1ArenaVisualPart then
		pcall(function() boss1ArenaVisualPart:Destroy() end)
		boss1ArenaVisualPart = nil
	end
	cachedFirstBossPart = nil
	lockedArenaFloorY = nil
end

-- Khóa cố định cao độ trục Y của sàn đấu ngay từ nhịp đầu tiên
local function getOrLockFloorY(centerPos, playerPos, firstPart)
	if lockedArenaFloorY then
		return lockedArenaFloorY
	end

	local floorY = nil
	if playerPos then
		local rawFloorY, hasFloor = geometry.GetRawFloorY(playerPos)
		if hasFloor and rawFloorY then
			floorY = rawFloorY + 0.1
		end
	end

	if not floorY and firstPart then
		-- Khóa theo điểm tiếp giáp sàn của FirstPart
		floorY = firstPart.Position.Y - (firstPart.Size.Y / 2) + 0.1
	end

	if not floorY and centerPos then
		local rawFloorY, hasFloor = geometry.GetRawFloorY(centerPos)
		if hasFloor and rawFloorY then
			floorY = rawFloorY + 0.1
		end
	end

	if floorY then
		lockedArenaFloorY = floorY
	end

	return lockedArenaFloorY or (playerPos and (playerPos.Y - 2.8)) or (centerPos and (centerPos.Y - 2.8)) or 0
end

local function updateBoss1ArenaVisual(centerPos, playerPos, firstPart)
	if not centerPos then
		clearBoss1ArenaVisual()
		return
	end

	-- Khóa trục Y cố định theo mặt sàn đấu
	local arenaFloorY = getOrLockFloorY(centerPos, playerPos, firstPart)

	local radius = boss1ArenaRadius or BOSS1_DEFAULT_RADIUS
	local diameter = (firstPart and firstPart.Size.X) or (radius * 2)
	local targetCF = CFrame.new(centerPos.X, arenaFloorY, centerPos.Z) * CFrame.Angles(0, 0, math.rad(90))

	if boss1ArenaVisualPart and boss1ArenaVisualPart.Parent then
		if math.abs(boss1ArenaVisualPart.Size.Y - diameter) > 0.5 then
			boss1ArenaVisualPart.Size = Vector3.new(0.2, diameter, diameter)
		end
		return
	end

	pcall(function()
		local part = Instance.new("Part")
		part.Name = "SmartDodge_Boss1ArenaVisual"
		part.Shape = Enum.PartType.Cylinder
		part.Size = Vector3.new(0.2, diameter, diameter)
		part.Color = Color3.fromRGB(0, 220, 255)
		part.Material = Enum.Material.Neon
		part.Transparency = 0.88
		part.Anchored = true
		part.CanCollide = false
		part.CanTouch = false
		part.CanQuery = false

		local highlight = Instance.new("Highlight")
		highlight.Name = "ArenaOutline"
		highlight.FillColor = Color3.fromRGB(0, 180, 255)
		highlight.FillTransparency = 0.92
		highlight.OutlineColor = Color3.fromRGB(0, 240, 255)
		highlight.OutlineTransparency = 0.1
		highlight.Adornee = part
		highlight.Parent = part

		local bb = Instance.new("BillboardGui")
		bb.Name = "ArenaLabel"
		bb.Size = UDim2.fromOffset(180, 26)
		bb.StudsOffset = Vector3.new(0, 3, 0)
		bb.AlwaysOnTop = true
		bb.Adornee = part
		bb.Parent = part

		local label = Instance.new("TextLabel")
		label.Name = "Label"
		label.Size = UDim2.fromScale(1, 1)
		label.BackgroundTransparency = 1
		label.TextColor3 = Color3.fromRGB(0, 230, 255)
		label.TextStrokeTransparency = 0.2
		label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		label.Font = Enum.Font.GothamBold
		label.TextSize = 13
		label.Text = "BOSS 1 ARENA (Safe Zone)"
		label.Parent = bb

		part.CFrame = targetCF
		part.Parent = Workspace.Terrain
		boss1ArenaVisualPart = part
	end)
end

local function isInsideBoss1Arena(pos, playerPos)
	if not boss1ArenaCenter then return true end
	local cand2D = Vector3.new(pos.X, 0, pos.Z)
	local center2D = Vector3.new(boss1ArenaCenter.X, 0, boss1ArenaCenter.Z)
	local candDist = (cand2D - center2D).Magnitude

	local maxRadius = boss1ArenaRadius or BOSS1_DEFAULT_RADIUS
	local playerDist = maxRadius
	if playerPos then
		local p2D = Vector3.new(playerPos.X, 0, playerPos.Z)
		playerDist = (p2D - center2D).Magnitude
	end

	local maxAllowed = math.max(maxRadius, playerDist - 0.5)
	return candDist <= maxAllowed
end

local function getBoss1ArenaScoreAdjustment(pos, playerPos)
	if not boss1ArenaCenter or not playerPos then return 0 end
	local center2D = Vector3.new(boss1ArenaCenter.X, 0, boss1ArenaCenter.Z)
	local pDist = (Vector3.new(playerPos.X, 0, playerPos.Z) - center2D).Magnitude
	local cDist = (Vector3.new(pos.X, 0, pos.Z) - center2D).Magnitude

	local maxRadius = boss1ArenaRadius or BOSS1_DEFAULT_RADIUS
	local pullThreshold = maxRadius * 0.70

	-- Nếu player đang bị dạt sát mép ngoài sàn đấu:
	if pDist > pullThreshold then
		if cDist < pDist - 0.5 then
			return -2.0 -- Thưởng nhẹ hướng về tâm sàn khi tương đồng khoảng cách
		elseif cDist > pDist + 0.5 then
			return 3.0  -- Phạt nhẹ dạt tiếp ra ngoài mép
		end
	end
	return 0
end

-- Tự động dọn visual và mở khóa Arena Center khi Boss 1 bị hạ gục hoặc chuyển màn
shared.OnBossActiveChanged(function(active)
	if not active then
		boss1ArenaCenter = nil
		boss1ArenaRadius = BOSS1_DEFAULT_RADIUS
		cachedFirstBossPart = nil
		cachedSecondBossCrystals = nil
		clearBoss1ArenaVisual()
	end
end)

shared.OnBossIndexChanged(function(index)
	cachedFirstBossPart = nil
	cachedSecondBossCrystals = nil
	if index ~= 1 then
		boss1ArenaCenter = nil
		boss1ArenaRadius = BOSS1_DEFAULT_RADIUS
		clearBoss1ArenaVisual()
	end
end)

--// Dọn visual marker/hitbox/radar: unparent (giữ object để tái sử dụng) — engine stop loop gọi
function safeSpot.HideVisuals()
	if safeSpotMarkerPart and safeSpotMarkerPart.Parent then
		safeSpotMarkerPart.Parent = nil
	end
	if hitboxVisualPart and hitboxVisualPart.Parent then
		hitboxVisualPart.Parent = nil
	end
	safeSpot.ClearPlayerRadar()
	clearBoss1ArenaVisual()
	clearCrystalHighlight()
	lastMarkerPos = nil
	lastMarkerInDanger = false
	lastMarkerEscapeDist = 0
	lastHitboxPlayerPos = nil
end

--// Hủy hoàn toàn visual khi shutdown (lifecycle)
function safeSpot.DestroyVisuals()
	if safeSpotMarkerPart then
		pcall(function() safeSpotMarkerPart:Destroy() end)
		safeSpotMarkerPart = nil
	end
	if hitboxVisualPart then
		pcall(function() hitboxVisualPart:Destroy() end)
		hitboxVisualPart = nil
	end
	safeSpot.ClearPlayerRadar()
	for _, item in ipairs(playerRadarPool) do
		if item.shaft then pcall(function() item.shaft:Destroy() end) end
		if item.head then pcall(function() item.head:Destroy() end) end
	end
	table.clear(playerRadarPool)
	clearBoss1ArenaVisual()
	clearCrystalHighlight()
end

--// Reset lock an toàn (engine gọi khi dừng loop — tương đương lockedSafeSpot = nil)
function safeSpot.ResetLock()
	lockedSafeSpot = nil
	lockedHazardCount = 0
	clearCrystalHighlight()
end

--// Tạo / Lấy Part hiển thị Hitbox Padding của Player quanh người
local function getOrCreateHitboxVisual()
	if hitboxVisualPart and hitboxVisualPart.Parent then
		return hitboxVisualPart
	end

	local part = Instance.new("Part")
	part.Name = "SmartDodge_HitboxVisual"
	part.Shape = Enum.PartType.Cylinder
	local diameter = math.max(0.4, geometry.GetHitboxPadding() * 2)
	part.Size = Vector3.new(0.15, diameter, diameter)
	part.Color = Color3.fromRGB(0, 220, 255)
	part.Material = Enum.Material.Neon
	part.Transparency = 0.75
	part.Anchored = true
	part.CanCollide = false
	part.CanQuery = false
	part.CanTouch = false

	local selectionBox = Instance.new("SelectionBox")
	selectionBox.Name = "HitboxBorder"
	selectionBox.Color3 = Color3.fromRGB(120, 240, 255)
	selectionBox.SurfaceColor3 = Color3.fromRGB(0, 220, 255)
	selectionBox.SurfaceTransparency = 0.8
	selectionBox.LineThickness = 0.04
	selectionBox.Adornee = part
	selectionBox.Parent = part

	hitboxVisualPart = part
	return part
end

--// Cập nhật vị trí và kích thước vòng tròn Hitbox của Player
function safeSpot.UpdateHitbox(playerPos)
	lastHitboxPlayerPos = playerPos
	if not showHitboxVisual or not detection.IsEnabled() or not playerPos then
		if hitboxVisualPart then
			hitboxVisualPart.Parent = nil
		end
		return
	end

	local part = getOrCreateHitboxVisual()
	local diameter = math.max(0.4, geometry.GetHitboxPadding() * 2)
	part.Size = Vector3.new(0.15, diameter, diameter)

	local floorPos, hasFloor = geometry.GetFloorPosition(playerPos)
	local yPos = hasFloor and (floorPos.Y - 2.8) or (playerPos.Y - 2.8)
	local visualPos = Vector3.new(playerPos.X, yPos, playerPos.Z)

	part.CFrame = CFrame.new(visualPos) * CFrame.Angles(0, 0, math.rad(90))
	part.Parent = Workspace.Terrain
end

--// CẤU HÌNH VÀNH ĐAI VECTOR ĐA TẦNG (TWO-TIER ADAPTIVE SPIDERWEB RADAR)
--// Tầng 1 (Inner Belt): 2.5m -> 15.0m (Chuyên Micro-Dodge sát mép, giữ cự ly tấn công tối đa)
--// Tầng 2 (Outer Belt): 20.0m -> 52.0m (Chuyên Macro-Dodge khi Boss tung đại chiêu diện rộng)
local PLAYER_RADAR_RAY_COUNT = 24
local PLAYER_RADAR_INNER_OFFSET = 0.8
local INNER_BELT_MAX_DIST = 15.0
local MARCH_STEPS = { 2.5, 4.5, 7.0, 10.5, 15.0, 20.0, 26.0, 33.0, 42.0, 52.0 }
local MAX_MARCH_DIST = 52.0

local COLOR_PLAYER_RADAR_SAFE = Color3.fromRGB(0, 255, 120)     -- Xanh lá neon khi thoát ra vùng an toàn gần (Tier 1)
local COLOR_PLAYER_RADAR_OUTER = Color3.fromRGB(0, 220, 255)    -- Xanh ngọc Cyan neon khi vươn ra vành đai xa (Tier 2)
local COLOR_PLAYER_RADAR_DANGER = Color3.fromRGB(255, 200, 50)  -- Vàng neon khi xuyên qua vùng chiêu thức nguy hiểm

local function getOrCreatePlayerRadarArrow(index)
	local item = playerRadarPool[index]
	if item then
		return item
	end

	local shaft = Instance.new("Part")
	shaft.Name = "SmartDodge_PlayerShaft_" .. index
	shaft.Material = Enum.Material.Neon
	shaft.Anchored = true
	shaft.CanCollide = false
	shaft.CanQuery = false
	shaft.CanTouch = false
	shaft.CastShadow = false
	shaft.Transparency = 0.15

	local head = Instance.new("Part")
	head.Name = "SmartDodge_PlayerHead_" .. index
	head.Material = Enum.Material.Neon
	head.Anchored = true
	head.CanCollide = false
	head.CanQuery = false
	head.CanTouch = false
	head.CastShadow = false
	head.Transparency = 0.15
	head.Size = Vector3.new(0.32, 0.04, 0.32)

	item = { shaft = shaft, head = head }
	playerRadarPool[index] = item
	return item
end

function safeSpot.ClearPlayerRadar()
	for _, item in ipairs(playerRadarPool) do
		if item.shaft and item.shaft.Parent then
			item.shaft.Parent = nil
		end
		if item.head and item.head.Parent then
			item.head.Parent = nil
		end
	end
	radarLatchedOrigin = nil
	isDodgeRadarActive = false
	currentRadarDodgeKey = nil
end

--// Cập nhật Mạng Nhện Dò Biên An Toàn (Adaptive Contour Spiderweb):
--// Bắn 24 tia vector từ điểm bắt đầu né chiêu. Giữ nguyên trên sàn trong suốt lần né và sau khi né xong!
--// Chỉ xóa và cập nhật mới khi bắt đầu một lần dodge mới!
--// Triệt tiêu các tia đâm sâu vào lòng skill (không cho bắn xuyên qua skill).
function safeSpot.UpdatePlayerRadar(playerPos, inDanger)
	lastRadarPlayerPos, lastRadarInDanger = playerPos, inDanger or false

	if not showPlayerRadar or not detection.IsEnabled() or not playerPos then
		safeSpot.ClearPlayerRadar()
		return
	end

	-- Nếu đang an toàn (không dính chiêu):
	if not inDanger then
		-- Đánh dấu phiên né chiêu đã kết thúc để sẵn sàng cho lần dodge mới tiếp theo
		isDodgeRadarActive = false
		currentRadarDodgeKey = nil
		-- GIỮ NGUYÊN các tia vector của lần dodge trước đó trên sàn! Không xóa!
		return
	end

	-- KHI ĐANG DÍNH CHIÊU (inDanger == true):
	-- Kiểm tra xem có phải là lần dodge MỚI không (vừa dính chiêu hoặc đổi chiêu mới):
	local isNewDodge = not isDodgeRadarActive or (lastDangerPart and lastDangerPart ~= currentRadarDodgeKey)

	if not isNewDodge then
		-- Đợt dodge hiện tại đang diễn ra -> CỐ ĐỊNH 100% các tia tại vị trí gốc đã lưu, không rung giật, không dời vị trí!
		return
	end

	-- BẮT ĐẦU ĐỢT DODGE MỚI:
	isDodgeRadarActive = true
	currentRadarDodgeKey = lastDangerPart
	radarLatchedOrigin = playerPos

	-- Thu hồi các tia của lần dodge trước đó
	for _, item in ipairs(playerRadarPool) do
		if item.shaft and item.shaft.Parent then item.shaft.Parent = nil end
		if item.head and item.head.Parent then item.head.Parent = nil end
	end

	local floorY = radarLatchedOrigin.Y - 2.8
	local arrowY = floorY + 0.12 -- Nằm sát mặt sàn
	local stepDeg = 360 / PLAYER_RADAR_RAY_COUNT

	for i = 1, PLAYER_RADAR_RAY_COUNT do
		local angleDeg = (i - 1) * stepDeg
		local rad = math.rad(angleDeg)
		local dirX = math.cos(rad)
		local dirZ = math.sin(rad)
		local dir = Vector3.new(dirX, 0, dirZ)

		-- Dò từng nấc khoảng cách dọc theo tia để tìm điểm đầu tiên bước ra khỏi chiêu thức (0 Raycast, cực nhẹ)
		local foundSafeDist = nil
		for _, dist in ipairs(MARCH_STEPS) do
			local testWorld = Vector3.new(radarLatchedOrigin.X + dirX * dist, radarLatchedOrigin.Y, radarLatchedOrigin.Z + dirZ * dist)
			if not geometry.IsPointInAnyHazard(testWorld) then
				if not (boss1ArenaCenter and not isInsideBoss1Arena(testWorld, radarLatchedOrigin)) then
					foundSafeDist = dist
					break
				end
			end
		end

		local arrow = getOrCreatePlayerRadarArrow(i)

		-- NGUYÊN TẮC: TUYỆT ĐỐI KHÔNG BẮN TIA XUYÊN QUA SKILL!
		-- Nếu hướng này không tìm thấy lối thoát an toàn (đâm sâu vào lòng chiêu thức hoặc bị chặn):
		-- -> Ẩn tia này đi, không vẽ đâm bừa vào trong lòng skill!
		if not foundSafeDist then
			if arrow.shaft.Parent then arrow.shaft.Parent = nil end
			if arrow.head.Parent then arrow.head.Parent = nil end
			continue
		end

		local rayDist = foundSafeDist
		local isOuterBelt = (foundSafeDist > INNER_BELT_MAX_DIST)
		local shaftLen = math.max(0.4, rayDist - PLAYER_RADAR_INNER_OFFSET)
		local shaftCenterDist = PLAYER_RADAR_INNER_OFFSET + (shaftLen / 2)
		local headCenterDist = PLAYER_RADAR_INNER_OFFSET + shaftLen + 0.16

		-- Màu sắc & Kích thước phân biệt 2 vành đai:
		-- Tier 1 (Inner Belt <= 15m): Đầu Xanh Lá Neon (0, 255, 120), kích thước tiêu chuẩn
		-- Tier 2 (Outer Belt > 15m): Đầu Xanh Ngọc Cyan Neon (0, 220, 255), kích thước nổi bật
		local headColor = isOuterBelt and COLOR_PLAYER_RADAR_OUTER or COLOR_PLAYER_RADAR_SAFE
		local shaftColor = (foundSafeDist <= 3.5) and COLOR_PLAYER_RADAR_SAFE or COLOR_PLAYER_RADAR_DANGER
		local headSize = isOuterBelt and Vector3.new(0.42, 0.05, 0.42) or Vector3.new(0.32, 0.04, 0.32)

		-- Cập nhật Thân tia (Shaft)
		arrow.shaft.Size = Vector3.new(isOuterBelt and 0.15 or 0.12, 0.04, shaftLen)
		local shaftCenter = Vector3.new(radarLatchedOrigin.X + dirX * shaftCenterDist, arrowY, radarLatchedOrigin.Z + dirZ * shaftCenterDist)
		arrow.shaft.CFrame = CFrame.lookAt(shaftCenter, shaftCenter + dir)
		arrow.shaft.Color = shaftColor
		arrow.shaft.Parent = Workspace.Terrain

		-- Cập nhật Đầu mũi tên (Diamond Head) chốt chặn ở ranh giới an toàn
		arrow.head.Size = headSize
		local headCenter = Vector3.new(radarLatchedOrigin.X + dirX * headCenterDist, arrowY, radarLatchedOrigin.Z + dirZ * headCenterDist)
		arrow.head.CFrame = CFrame.lookAt(headCenter, headCenter + dir) * CFrame.Angles(0, math.rad(45), 0)
		arrow.head.Color = headColor
		arrow.head.Parent = Workspace.Terrain
	end
end

--// Tạo / Lấy Visual Marker phát sáng màu Xanh Lá (Hình Cầu Nhỏ Sát Đất)
local function getOrCreateSafeMarker()
	if safeSpotMarkerPart and safeSpotMarkerPart.Parent then
		return safeSpotMarkerPart
	end

	local part = Instance.new("Part")
	part.Name = "SmartDodge_SafeMarker"
	part.Shape = Enum.PartType.Ball
	part.Size = Vector3.new(1.5, 1.5, 1.5)
	part.Color = Color3.fromRGB(0, 255, 120)
	part.Material = Enum.Material.Neon
	part.Transparency = 0.2
	part.Anchored = true
	part.CanCollide = false
	part.CanQuery = false
	part.CanTouch = false

	local bb = Instance.new("BillboardGui")
	bb.Name = "MarkerGui"
	bb.Size = UDim2.fromOffset(130, 24)
	bb.StudsOffset = Vector3.new(0, 1.5, 0)
	bb.AlwaysOnTop = true
	bb.Adornee = part
	bb.Parent = part

	local label = Instance.new("TextLabel")
	label.Name = "Label"
	label.Size = UDim2.fromScale(1, 1)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.fromRGB(80, 255, 160)
	label.TextStrokeTransparency = 0
	label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	label.Font = Enum.Font.GothamBold
	label.TextSize = 12
	label.Text = "🟢 SAFE SPOT"
	label.Parent = bb

	safeSpotMarkerPart = part
	return part
end

local lastRenderedMarkerPos = nil
local lastRenderedEscapeDist = -1

--// Cập nhật vị trí hiển thị của Safe Marker (đặt đáy hình cầu sát mặt đất nhất có thể)
function safeSpot.UpdateMarker(pos, inDanger, escapeDist)
	lastMarkerPos, lastMarkerInDanger, lastMarkerEscapeDist = pos, inDanger or false, escapeDist or 0
	if not showSafeMarker or not inDanger or not pos then
		if safeSpotMarkerPart then
			safeSpotMarkerPart.Parent = nil
		end
		lastRenderedMarkerPos = nil
		lastRenderedEscapeDist = -1
		return
	end

	local marker = getOrCreateSafeMarker()
	-- pos.Y được tính là Floor_Y + 3. Quả cầu bán kính 0.75 nên đặt tâm ở (Floor_Y + 0.8) = (pos.Y - 2.2) để sát đất
	local floorBallY = pos.Y - 2.2
	local newPos = Vector3.new(pos.X, floorBallY, pos.Z)

	if not lastRenderedMarkerPos or (newPos - lastRenderedMarkerPos).Magnitude > 0.1 then
		lastRenderedMarkerPos = newPos
		marker.CFrame = CFrame.new(newPos)
	end
	if not marker.Parent then
		marker.Parent = Workspace.Terrain
	end

	local curDist = escapeDist or 0
	if math.abs(curDist - lastRenderedEscapeDist) >= 0.2 then
		lastRenderedEscapeDist = curDist
		local bb = marker:FindFirstChild("MarkerGui")
		local label = bb and bb:FindFirstChild("Label")
		if label then
			label.Text = ("🟢 SAFE SPOT (%.1fm)"):format(curDist)
		end
	end
end

local HYSTERESIS_THRESHOLD = 3.0     -- Ngưỡng chênh lệch cự ly (studs) để chuyển khóa sang điểm an toàn mới gần hơn

--// Tính vector lực đẩy tổng hợp (Multi-Hazard Repulsion Force) từ tâm chiêu thức đang đè/gần Player ra ngoài
local function computeRepulsionVector(playerPos, dangerPart)
	-- Ưu tiên số 1: Lực đẩy trực tiếp từ tâm chiêu thức đang dính ra vị trí Player
	if dangerPart and dangerPart.Parent and dangerPart:IsA("BasePart") then
		local diffX = playerPos.X - dangerPart.Position.X
		local diffZ = playerPos.Z - dangerPart.Position.Z
		local distSq = diffX * diffX + diffZ * diffZ
		if distSq > 0.04 then
			local dist = math.sqrt(distSq)
			return Vector3.new(diffX / dist, 0, diffZ / dist)
		end
	end

	local netX, netZ = 0, 0
	local activeHazards = detection.GetActiveHazardsMap and detection.GetActiveHazardsMap()
	if activeHazards then
		local count = 0
		for _, info in pairs(activeHazards) do
			-- Lấy vị trí trung tâm đại diện của từng Skill theo thời gian thực (ưu tiên ActiveParts / info.Position, KHÔNG dùng PrimaryPart)
			local centerPos = nil
			if info.ActiveParts then
				for part in pairs(info.ActiveParts) do
					if part and part.Parent and part:IsA("BasePart") then
						centerPos = part.Position
						break
					end
				end
			end
			if not centerPos and info.Instance and info.Instance.Parent then
				if info.Instance:IsA("BasePart") then
					centerPos = info.Instance.Position
				end
			end
			centerPos = centerPos or info.Position

			if centerPos then
				local diffX = playerPos.X - centerPos.X
				local diffZ = playerPos.Z - centerPos.Z
				local distSq = diffX * diffX + diffZ * diffZ
				if distSq < 1600 and distSq > 0.01 then
					local dist = math.sqrt(distSq)
					local weight = 1 / math.max(1, dist)
					netX = netX + (diffX / dist) * weight
					netZ = netZ + (diffZ / dist) * weight
					count = count + 1
				end
			end
		end

		local netMagSq = netX * netX + netZ * netZ
		if count > 0 and netMagSq > 0.001 then
			local netMag = math.sqrt(netMagSq)
			return Vector3.new(netX / netMag, 0, netZ / netMag)
		end
	end

	-- Fallback cuối cùng: Nếu không xác định được tâm chiêu, mới lùi ra xa mục tiêu
	if targetFacing then
		local tPos = targetFacing.GetTargetPosition()
		if tPos then
			local diffX = playerPos.X - tPos.X
			local diffZ = playerPos.Z - tPos.Z
			local distSq = diffX * diffX + diffZ * diffZ
			if distSq > 0.01 then
				local dist = math.sqrt(distSq)
				return Vector3.new(diffX / dist, 0, diffZ / dist)
			end
		end
	end

	return nil
end

--// Trả về danh sách 12 góc quét được sắp xếp ưu tiên theo hướng di chuyển của Player hoặc lực đẩy thoát hiểm
local function getSearchAngles(repVector, moveDir)
	local baseAngleDeg = 0
	if moveDir then
		baseAngleDeg = math.deg(math.atan2(moveDir.Z, moveDir.X))
	elseif repVector then
		baseAngleDeg = math.deg(math.atan2(repVector.Z, repVector.X))
	end

	local angles = table.create(12)
	for i, off in ipairs(ANGLE_OFFSETS_12) do
		angles[i] = (baseAngleDeg + off) % 360
	end
	return angles
end

--// Đánh giá vùng đệm an toàn xung quanh điểm candidate (4 hướng chính ở bán kính 2.5m, cực nhẹ)
local CLEARANCE_OFFSETS_4 = {
	Vector3.new(2.5, 0, 0),
	Vector3.new(-2.5, 0, 0),
	Vector3.new(0, 0, 2.5),
	Vector3.new(0, 0, -2.5),
}

local function getClearanceBonus(point)
	local safeCount = 0
	for _, off in ipairs(CLEARANCE_OFFSETS_4) do
		if not geometry.IsPointInAnyHazard(point + off) then
			safeCount = safeCount + 1
		end
	end
	return safeCount * 0.75
end

--// Tính điểm ưu tiên cho một ứng viên vị trí an toàn (Score càng THẤP càng ƯU TIÊN):
--// Tận dụng Hệ quy chiếu Face-to-Target: Ưu tiên Lách Ngang (Strafe), Phạt Lùi Xéo Sâu, Phạt Cự Ly
local function scoreCandidate(playerPos, candPos, repVector, moveDir)
	-- Hard check cho Boss 1 Arena: Không chọn điểm ra ngoài phạm vi sàn đấu
	if boss1ArenaCenter and not isInsideBoss1Arena(candPos, playerPos) then
		return math.huge
	end

	-- Tránh né thẳng vào Boss Orb (nếu có quả cầu Boss 2 đang hoạt động):
	local activeOrb = detection.GetActiveBossOrb and detection.GetActiveBossOrb()
	if activeOrb and activeOrb.Position then
		local dOrb = (Vector3.new(candPos.X - activeOrb.Position.X, 0, candPos.Z - activeOrb.Position.Z)).Magnitude
		if dOrb < 12.0 then
			return math.huge -- Tuyệt đối không chọn điểm né nằm gần quả cầu!
		end
	end

	local moveDist = (candPos - playerPos).Magnitude
	local clearance = getClearanceBonus(candPos)
	-- Cự ly là tiêu chí sống còn: mỗi stud chạy thêm làm tăng nguy cơ deal dame
	local score = (moveDist * 2.0) - (clearance * 0.35)
	if moveDist > 12.0 then
		-- Phạt lũy tiến nặng nề cho các điểm cách xa (> 12 studs):
		-- Triệt tiêu hoàn toàn lỗi chọn điểm góc 30-40 studs khi chỉ cần bước 2-3 studs là an toàn
		score = score + ((moveDist - 12.0) * 3.5)
	end

	-- TẬN DỤNG HỆ QUY CHIẾU CHIẾN ĐẤU FACE-TO-TARGET (Nhìn Boss)
	local targetPos = targetFacing and targetFacing.GetTargetPosition and targetFacing.GetTargetPosition()
	if targetPos and moveDist > 0.3 then
		local toTarget2D = Vector3.new(targetPos.X - playerPos.X, 0, targetPos.Z - playerPos.Z)
		if toTarget2D.Magnitude > 1.0 then
			local fwd = toTarget2D.Unit
			local right = Vector3.new(-fwd.Z, 0, fwd.X)
			local toCand2D = Vector3.new(candPos.X - playerPos.X, 0, candPos.Z - playerPos.Z)

			local depthOffset = toCand2D:Dot(fwd)                  -- > 0: Tiến | < 0: Lùi
			local strafeRatio = math.abs(toCand2D.Unit:Dot(right)) -- 1.0: Lách ngang sườn thuần túy

			-- 1. Thưởng lớn cho bước LÁCH NGANG (Strafe giữ cự ly với Boss - Điểm 1)
			if strafeRatio >= 0.82 and math.abs(depthOffset) <= 2.2 then
				score = score - 6.0
			end

			-- 2. Phạt điểm nếu LÙI XÉO RA SAU LƯNG (như Điểm 2: mất tầm đánh, chạy lâu trong vùng đỏ)
			if depthOffset < -2.0 then
				score = score + (math.abs(depthOffset) * 1.8)
			end

			-- 3. Phạt nếu TIẾN THẲNG VÀO MẶT BOSS khi đang né chiêu
			if depthOffset > 2.5 then
				score = score + (depthOffset * 1.2)
			end
		end
	end

	if moveDist > 0.5 then
		local dir = (candPos - playerPos).Unit
		if moveDir then
			local dotMove = dir:Dot(moveDir)
			if dotMove > 0 then
				-- Cùng phía / thuận hướng Player đang chủ động di chuyển: thưởng tới 3.5 studs
				score = score - (dotMove * 3.5)
			else
				-- Ngược hướng Player đang di chuyển: phạt nhẹ (+2.0 studs)
				score = score + (math.abs(dotMove) * 2.0)
			end
		elseif repVector and not targetPos then
			local dot = dir:Dot(repVector)
			score = score - (dot * 2.0)
		end
	end

	-- Ưu tiên kéo về tâm sàn đấu Boss 1 nếu đang dạt ra xa
	if boss1ArenaCenter then
		score = score + getBoss1ArenaScoreAdjustment(candPos, playerPos)
	end

	return score
end

--// Thuật toán Quét Tỏa Tròn Đa Hướng (Fine-Grained Radial Sweep): tìm khoảng hở an toàn gần nhất kết hợp Path Check & Clearance
--// TỐI ƯU HÓA ĐỈNH CAO: Không bắn bất kỳ tia Raycast nào trong vòng lặp quét! Chỉ snap sàn 1 lần duy nhất cho điểm chốt cuối cùng.
local function searchRadialSafeSpot(playerPos, repVector, currentHazardsSet, dangerPart, moveDir)
	local angles = getSearchAngles(repVector, moveDir)
	local bestPos = nil
	local bestScore = math.huge
	local fallbackPos = nil
	local fallbackScore = math.huge

	for _, dist in ipairs(RADIAL_DISTANCES) do
		local foundAtRadius = nil
		local bestScoreAtRadius = math.huge

		for _, angleDeg in ipairs(angles) do
			local rad = math.rad(angleDeg)
			local offset = Vector3.new(math.cos(rad) * dist, 0, math.sin(rad) * dist)
			local testWorld = playerPos + offset

			-- TỐI ƯU HIỆU SUẤT CPU: Kiểm tra hình học thuần túy (0 Raycast)
			if geometry.IsSpotFullySafe(testWorld, 0.5) then
				local score = scoreCandidate(playerPos, testWorld, repVector, moveDir)

				-- Fallback lưu điểm an toàn tại đích (phòng khi không có đường đi thẳng an toàn)
				if score < fallbackScore then
					fallbackScore = score
					fallbackPos = testWorld
				end

				-- Ưu tiên số 1: Đoạn đường di chuyển từ playerPos -> testWorld an toàn (cho phép băng qua các chiêu đang đè)
				if geometry.IsPathSafe(playerPos, testWorld, currentHazardsSet, dangerPart) then
					if score < bestScoreAtRadius then
						bestScoreAtRadius = score
						foundAtRadius = testWorld
					end
				end
			end
		end

		-- Ngay khi ở vòng bán kính gần nhất này tìm được khe an toàn -> CHỌN NGAY LẬP TỨC và dừng tìm kiếm
		if foundAtRadius then
			bestPos = foundAtRadius
			bestScore = bestScoreAtRadius
			break
		end
	end

	local chosenPos = bestPos or fallbackPos
	local chosenScore = bestPos and bestScore or fallbackScore

	-- CHỈ BẮN DUY NHẤT 1 TIA RAYCAST cho ứng viên tốt nhất đã chọn để snap chính xác xuống mặt đất
	if chosenPos then
		local snapped, hasFloor = geometry.GetFloorPosition(chosenPos)
		local finalPos = hasFloor and snapped or chosenPos
		return finalPos, chosenScore
	end

	return nil, math.huge
end

--// Thuật toán cốt lõi: Tính toán vị trí an toàn (Safe Spot Calculation)
function safeSpot.CalculateSafeSpot(customPlayerPos)
	local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local humanoid = player and player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	local playerPos = customPlayerPos or (rootPart and rootPart.Position)
	if not playerPos then
		lockedSafeSpot = nil
		lockedHazardCount = 0
		clearCrystalHighlight()
		return false, nil, nil, 0
	end

	-- Quản lý Arena Center & Visual cho Boss 1:
	local isBoss1 = shared.IsBossActive() and shared.GetCurrentBossIndex() == 1
	if isBoss1 then
		local firstPart = getFirstBossArenaPart()
		if firstPart then
			local fpPos = firstPart.Position
			local floorY = getOrLockFloorY(fpPos, playerPos, firstPart)
			boss1ArenaCenter = Vector3.new(fpPos.X, floorY, fpPos.Z)
			local fpRadius = math.max(firstPart.Size.X, firstPart.Size.Z) / 2
			boss1ArenaRadius = math.max(20, fpRadius - 2.5)
			updateBoss1ArenaVisual(boss1ArenaCenter, playerPos, firstPart)
		elseif not boss1ArenaCenter then
			local bPos = targetFacing.GetTargetPosition()
			if not bPos then
				local tracked = shared.GetTrackedEnemyData()
				if tracked and #tracked > 0 and tracked[1].Root and tracked[1].Root.Parent then
					bPos = tracked[1].Root.Position
				end
			end
			if bPos then
				local floorY = getOrLockFloorY(bPos, playerPos, nil)
				boss1ArenaCenter = Vector3.new(bPos.X, floorY, bPos.Z)
				boss1ArenaRadius = BOSS1_DEFAULT_RADIUS
				updateBoss1ArenaVisual(boss1ArenaCenter, playerPos, nil)
			end
		elseif boss1ArenaCenter then
			updateBoss1ArenaVisual(boss1ArenaCenter, playerPos, nil)
		end
	else
		if boss1ArenaCenter then
			boss1ArenaCenter = nil
			boss1ArenaRadius = BOSS1_DEFAULT_RADIUS
			clearBoss1ArenaVisual()
		end
	end

	-- Tầng 1 & 3: Nếu không còn kẻ địch nào trong phòng và không ở boss room -> Hoàn toàn an toàn
	if shared.GetEnemyCount() == 0 and not shared.IsBossActive() then
		lockedSafeSpot = nil
		lockedHazardCount = 0
		clearCrystalHighlight()
		return false, nil, nil, 0
	end

	-- Tầng 3: Zero Nearby Enemies Filter (ngoài Boss Room)
	-- Nếu không có bất kỳ con quái sống nào trong bán kính 85 studs -> Bỏ qua các chiêu rác/phantom
	if not shared.IsBossActive() then
		local tracked = shared.GetTrackedEnemyData()
		local hasNearbyEnemy = false
		if tracked and #tracked > 0 then
			for _, data in ipairs(tracked) do
				if data and data.Root and data.Root.Parent then
					local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
					if hum and hum.Health > 0 then
						if (data.Root.Position - playerPos).Magnitude <= 85 then
							hasNearbyEnemy = true
							break
						end
					end
				end
			end
		end
		if not hasNearbyEnemy then
			lockedSafeSpot = nil
			lockedHazardCount = 0
			clearCrystalHighlight()
			return false, nil, nil, 0
		end
	end

	-- Lấy Boss 2 Orb đang kích hoạt (nếu có) để highlight cột pha lê và xử lý ưu tiên né khẩn cấp
	local activeOrbPart, orbColorName = detection.GetActiveBossOrb()
	if activeOrbPart and orbColorName then
		local targetCrystal = getBossCrystal(orbColorName)
		if targetCrystal then
			updateCrystalHighlight(targetCrystal, orbColorName)
		end
	else
		clearCrystalHighlight()
	end

	local distToOrb = math.huge
	local isOrbTooClose = false
	if activeOrbPart and activeOrbPart.Position then
		distToOrb = (Vector3.new(activeOrbPart.Position.X - playerPos.X, 0, activeOrbPart.Position.Z - playerPos.Z)).Magnitude
		-- Cự ly an toàn với Quả Cầu: Luôn duy trì khoảng cách an toàn >= 16.0 studs!
		-- Nếu quả cầu tiến vào cự ly < 16.0 studs -> Kích hoạt né/kite khẩn cấp, tuyệt đối không đứng yên!
		if distToOrb < 16.0 then
			isOrbTooClose = true
		end
	end

	-- 1. ƯU TIÊN SỐ 1: NÉ TRƯỚC (DODGE HAZARDS FIRST)
	-- Kiểm tra xem Player có đang đứng trong bất kỳ vùng nguy hiểm nào không.
	-- - Nếu quả cầu ở cự ly an toàn (>= 16.0 studs): Tạm bỏ qua quả cầu để né các chiêu khác hoặc dẫn cầu về cột.
	-- - Nếu quả cầu áp sát nguy hiểm (< 16.0 studs): TUYỆT ĐỐI KHÔNG BỎ QUA! Kích hoạt né khẩn cấp quả cầu.
	local ignoredOrb = (not isOrbTooClose) and activeOrbPart or nil
	local inDanger, dangerInfo, dangerPart, dangerTraj = geometry.IsPointInAnyHazard(playerPos, ignoredOrb)

	-- Can thiệp khẩn cấp: Nếu không dính chiêu sàn nào khác nhưng quả cầu đã áp sát < 16.0 studs:
	if not inDanger and isOrbTooClose then
		inDanger = true
		dangerPart = activeOrbPart
		dangerInfo = { Name = ("%s Orb (Maintain Safe Distance)"):format(orbColorName and orbColorName:upper() or "BOSS") }
		local fwd = (playerPos - activeOrbPart.Position)
		local fwd2D = (fwd.Magnitude > 0.1) and Vector3.new(fwd.X, 0, fwd.Z).Unit or Vector3.new(0, 0, 1)
		dangerTraj = {
			isTrajectory = true,
			isDynamicMoving = true,
			isBossOrb = true,
			perpDist = 0,
			dangerRadius = 6.0,
			forward2D = fwd2D,
			originPos = activeOrbPart.Position,
			maxLookahead = 25.0,
		}
	end
	if not inDanger or not dangerPart then
		-- 2. ƯU TIÊN SỐ 2: DẪN ORB VỀ CỘT KHI ĐANG AN TOÀN
		if activeOrbPart and orbColorName then
			local targetCrystal, wrongCrystals = getBossCrystal(orbColorName)
			if targetCrystal then
				-- KIỂM TRA SÀN SẠCH & VÙNG ĐỆM AN TOÀN:
				-- Nếu người chơi vừa né ra mép một chiêu thức sát thương (ví dụ hình chữ nhật hay MovingBeam)
				-- mà chiêu đó vẫn đang tồn tại sát chân:
				-- NẾU CÓ QUẢ CẦU ĐANG Ở GẦN (< 28 studs): TUYỆT ĐỐI KHÔNG ĐỨNG YÊN CHỜ AOE NỔ!
				-- Phải tiếp tục lùi/kite dọc theo hành lang an toàn ra xa quả cầu!
				local hasActiveFloorHazard = false
				local allHazards = detection.GetActiveHazards and detection.GetActiveHazards()
				if allHazards and #allHazards > 0 then
					for _, hData in ipairs(allHazards) do
						local hInst = hData.Instance
						if hInst and hInst ~= activeOrbPart and hInst ~= (activeOrbPart and activeOrbPart.Parent) then
							if not geometry.IsSpotFullySafe(playerPos, 4.5, activeOrbPart) then
								hasActiveFloorHazard = true
								break
							end
						end
					end
				end

				if hasActiveFloorHazard then
					if distToOrb < 28.0 and activeOrbPart and activeOrbPart.Position then
						local fwdOrb = (playerPos - activeOrbPart.Position)
						local fwdOrb2D = (fwdOrb.Magnitude > 0.1) and Vector3.new(fwdOrb.X, 0, fwdOrb.Z).Unit or Vector3.new(0, 0, 1)
						local perpOrb = Vector3.new(-fwdOrb2D.Z, 0, fwdOrb2D.X)

						local corridorSteps = { 6.0, 10.0, 15.0, 20.0, 26.0, 32.0 }
						local corridorPerp = { 0, 2.0, -2.0, 4.0, -4.0 }
						local bestKite = nil
						local bestKiteDist = -math.huge

						for _, stepDist in ipairs(corridorSteps) do
							for _, pOff in ipairs(corridorPerp) do
								local cand = playerPos + fwdOrb2D * stepDist + perpOrb * pOff
								if geometry.IsSpotFullySafe(cand, 0.5, activeOrbPart) then
									if geometry.IsPathSafe(playerPos, cand, nil, nil, activeOrbPart) then
										local dToOrb = (Vector3.new(cand.X - activeOrbPart.Position.X, 0, cand.Z - activeOrbPart.Position.Z)).Magnitude
										if dToOrb > bestKiteDist then
											bestKiteDist = dToOrb
											bestKite = cand
										end
									end
								end
							end
						end

						if bestKite then
							local sFloor, hasF = geometry.GetFloorPosition(bestKite)
							local finalKite = hasF and sFloor or bestKite
							lockedSafeSpot = finalKite
							lockedHazardCount = 1
							return true, finalKite, ("Kiting along corridor away from %s"):format(orbColorName:upper()), (finalKite - playerPos).Magnitude
						end
					end

					-- Chỉ đứng yên khi quả cầu ở cự ly an toàn rất xa (>= 28 studs):
					if distToOrb >= 28.0 then
						lockedSafeSpot = playerPos
						lockedHazardCount = 1
						return true, playerPos, ("Waiting for nearby AoE to explode before leading %s"):format(orbColorName:upper()), 0
					end
				end

				local orbPos = activeOrbPart.Position
				local crystalPos = targetCrystal.Position

				-- Vector hướng từ quả cầu tới cột pha lê (Orb -> Crystal)
				local dirFromOrb = Vector3.new(crystalPos.X - orbPos.X, 0, crystalPos.Z - orbPos.Z)
				if dirFromOrb.Magnitude > 0.5 then
					dirFromOrb = dirFromOrb.Unit
				else
					dirFromOrb = Vector3.new(0, 0, 1)
				end

				-- Vị trí đứng chuẩn: Đứng ngay phía sau cột pha lê (cột nằm giữa quả cầu và player)
				local behindCrystal = crystalPos + dirFromOrb * 3.8

				-- Kiểm tra xem quả cầu có đang chắn ngay trên đường chạy thẳng từ player tới cột không
				local vecToCrystal = Vector3.new(crystalPos.X - playerPos.X, 0, crystalPos.Z - playerPos.Z)
				local distToCrystal = vecToCrystal.Magnitude
				local vecToOrb = Vector3.new(orbPos.X - playerPos.X, 0, orbPos.Z - playerPos.Z)
				local distToOrb = vecToOrb.Magnitude

				local chosenTarget = behindCrystal

				-- Nếu player đang ở xa (> 8 studs) và quả cầu đang chặn giữa player và cột -> Bước chếch sang bên hông (flank)
				if distToCrystal > 8 and distToOrb < distToCrystal and distToOrb < 25 then
					local dirPC = vecToCrystal.Unit
					local dirPO = vecToOrb.Unit
					local dot = dirPC:Dot(dirPO)
					if dot > 0.75 then
						local perp = Vector3.new(-dirPC.Z, 0, dirPC.X)
						local cand1 = playerPos + (dirPC * 0.6 + perp * 0.8).Unit * 12
						local cand2 = playerPos + (dirPC * 0.6 - perp * 0.8).Unit * 12
						if (cand1 - orbPos).Magnitude > (cand2 - orbPos).Magnitude then
							chosenTarget = cand1
						else
							chosenTarget = cand2
						end
					end
				end

				-- Tránh xa 2 cột khác màu (wrong crystals)
				for _, wrongCr in ipairs(wrongCrystals) do
					local wPos = wrongCr.Position
					local diffW = Vector3.new(chosenTarget.X - wPos.X, 0, chosenTarget.Z - wPos.Z)
					if diffW.Magnitude < 10 and diffW.Magnitude > 0.1 then
						chosenTarget = chosenTarget + diffW.Unit * (10 - diffW.Magnitude)
					end
				end

				-- Snap xuống mặt sàn
				local snapped, hasFloor = geometry.GetFloorPosition(chosenTarget)
				local finalGuidePos = hasFloor and snapped or chosenTarget

				-- NẾU ĐÍCH ĐẾN TẠI CỘT BỊ DÍNH SKILL CỦA BOSS (Ví dụ gai nhọn cắm ngay sau cột)
				-- Xoay nhẹ góc đứng quanh cột (±30°, ±45°, ±60°, ±90°) để chọn điểm an toàn nhất vẫn giữ cột chặn bóng
				if not geometry.IsSpotFullySafe(finalGuidePos, 0.5, activeOrbPart) then
					local testAngles = { 30, -30, 45, -45, 60, -60, 90, -90, 120, -120 }
					for _, angleDeg in ipairs(testAngles) do
						local rad = math.rad(angleDeg)
						local cosA = math.cos(rad)
						local sinA = math.sin(rad)
						local rotDir = Vector3.new(dirFromOrb.X * cosA - dirFromOrb.Z * sinA, 0, dirFromOrb.X * sinA + dirFromOrb.Z * cosA)
						local altPos = crystalPos + rotDir * 4.0

						if geometry.IsSpotFullySafe(altPos, 0.5, activeOrbPart) then
							local sFloor, hasF = geometry.GetFloorPosition(altPos)
							finalGuidePos = hasF and sFloor or altPos
							break
						end
					end
				end

				-- KIỂM TRA ĐOẠN ĐƯỜNG CHẠY TỚI CỘT: CÓ BỊ SKILL KHÁC CHẶN ĐƯỜNG KHÔNG?
				local isDirectPathSafe = geometry.IsPathSafe(playerPos, finalGuidePos, nil, nil, activeOrbPart)
				if not isDirectPathSafe then
					local forward = Vector3.new(finalGuidePos.X - playerPos.X, 0, finalGuidePos.Z - playerPos.Z)
					local distToTarget = forward.Magnitude
					local fUnit = distToTarget > 1 and forward.Unit or Vector3.new(0, 0, 1)
					local perp = Vector3.new(-fUnit.Z, 0, fUnit.X)

					local detourCandidates = {}
					local testSteps = { 6, 10, 15, 20 }
					local testLateral = { 8, -8, 12, -12, 16, -16, 20, -20 }
					for _, s in ipairs(testSteps) do
						if s < distToTarget then
							for _, lat in ipairs(testLateral) do
								local cand = playerPos + fUnit * s + perp * lat
								table.insert(detourCandidates, cand)
							end
						end
					end

					local bestDetour = nil
					local bestScore = math.huge
					-- Đánh giá detour thuần toán học (0 Raycast trong loop)
					for _, cand in ipairs(detourCandidates) do
						if geometry.IsSpotFullySafe(cand, 0.5, activeOrbPart) then
							if geometry.IsPathSafe(playerPos, cand, nil, nil, activeOrbPart) then
								local safeFromWrong = true
								for _, wCr in ipairs(wrongCrystals) do
									if (cand - wCr.Position).Magnitude < 10 then
										safeFromWrong = false
										break
									end
								end
								if safeFromWrong then
									local score = (cand - finalGuidePos).Magnitude
									if score < bestScore then
										bestScore = score
										bestDetour = cand
									end
								end
							end
						end
					end

					if bestDetour then
						local snappedFloor, hasF = geometry.GetFloorPosition(bestDetour)
						local finalDetour = hasF and snappedFloor or bestDetour
						lockedSafeSpot = finalDetour
						lockedHazardCount = 1
						return true, finalDetour, ("Detour around skill -> %s Crystal"):format(orbColorName:upper()), (finalDetour - playerPos).Magnitude
					else
						-- Đường đi tới cột bị chặn hoàn toàn bởi chiêu thức nguy hiểm (ví dụ hình chữ nhật đỏ):
						-- NẾU CÓ QUẢ CẦU ĐANG Ở GẦN (< 28 studs): TUYỆT ĐỐI KHÔNG ĐỨNG YÊN CHỜ NỔ!
						-- Lùi/Kite dọc theo hành lang an toàn (hướng ra xa quả cầu) để giữ cự ly sinh tồn:
						if activeOrbPart and activeOrbPart.Position and distToOrb < 28.0 then
							local fwdOrb = (playerPos - activeOrbPart.Position)
							local fwdOrb2D = (fwdOrb.Magnitude > 0.1) and Vector3.new(fwdOrb.X, 0, fwdOrb.Z).Unit or Vector3.new(0, 0, 1)
							local perpOrb = Vector3.new(-fwdOrb2D.Z, 0, fwdOrb2D.X)

							local corridorSteps = { 6.0, 10.0, 15.0, 20.0, 26.0, 32.0 }
							local corridorPerp = { 0, 2.0, -2.0, 4.0, -4.0 }
							local bestKite = nil
							local bestKiteDist = -math.huge

							for _, stepDist in ipairs(corridorSteps) do
								for _, pOff in ipairs(corridorPerp) do
									local cand = playerPos + fwdOrb2D * stepDist + perpOrb * pOff
									if geometry.IsSpotFullySafe(cand, 0.5, activeOrbPart) then
										if geometry.IsPathSafe(playerPos, cand, nil, nil, activeOrbPart) then
											local dToOrb = (Vector3.new(cand.X - activeOrbPart.Position.X, 0, cand.Z - activeOrbPart.Position.Z)).Magnitude
											if dToOrb > bestKiteDist then
												bestKiteDist = dToOrb
												bestKite = cand
											end
										end
									end
								end
							end

							if bestKite then
								local sFloor, hasF = geometry.GetFloorPosition(bestKite)
								local finalKite = hasF and sFloor or bestKite
								lockedSafeSpot = finalKite
								lockedHazardCount = 1
								return true, finalKite, ("Kiting along corridor away from %s"):format(orbColorName:upper()), (finalKite - playerPos).Magnitude
							end
						end

						-- Chỉ khi không có quả cầu đe dọa mới đứng yên tại vị trí an toàn hiện tại đợi chiêu tan biến:
						lockedSafeSpot = playerPos
						lockedHazardCount = 1
						return true, playerPos, ("Waiting for path to clear -> %s Crystal"):format(orbColorName:upper()), 0
					end
				end

				local escapeDist = (finalGuidePos - playerPos).Magnitude
				lockedSafeSpot = finalGuidePos
				lockedHazardCount = 1

				return true, finalGuidePos, ("Lead %s -> %s Crystal"):format(activeOrbPart.Name, orbColorName:upper()), escapeDist
			end
		end

		lockedSafeSpot = nil
		lockedHazardCount = 0
		clearCrystalHighlight()
		return false, nil, nil, 0
	end

	-- KHI TỚI ĐÂY: inDanger == true (Player đang dính chiêu nguy hiểm của Boss)
	-- -> THỰC THI NÉ TRƯỚC (DODGE HAZARDS FIRST) THEO THUẬT TOÁN TIÊU CHUẨN!
	local hazardName = dangerInfo.Name or "Unknown"

	-- Xác định hướng di chuyển chủ động hiện tại của Player (độ ưu tiên: Humanoid.MoveDirection -> RootPart.AssemblyLinearVelocity)
	local moveDir = nil
	if humanoid and humanoid.MoveDirection.Magnitude > 0.1 then
		moveDir = Vector3.new(humanoid.MoveDirection.X, 0, humanoid.MoveDirection.Z).Unit
	elseif rootPart then
		local vel = rootPart.AssemblyLinearVelocity
		local vel2D = Vector3.new(vel.X, 0, vel.Z)
		if vel2D.Magnitude > 1.5 then
			moveDir = vel2D.Unit
		end
	end

	-- Lấy toàn bộ các hazard đang bao phủ vị trí Player (hỗ trợ nhiều chiêu đè nhau)
	local currentHazardsSet, currentHazardCount = geometry.GetAllHazardsAtPoint(playerPos)
	lastDangerPart = dangerPart
	lastCurrentHazardsSet = currentHazardsSet

	-- 2. CƠ CHẾ STRICT LATCHING KẾT HỢP OPPORTUNISTIC RETARGETING:
	-- Kiểm tra tính hợp lệ của điểm khóa an toàn hiện tại (nếu có):
	local isOldPointStillSafe = false
	local lockedDist = math.huge
	if lockedSafeSpot and geometry.IsSpotFullySafe(lockedSafeSpot, 0.5) then
		local inArena = not (boss1ArenaCenter and not isInsideBoss1Arena(lockedSafeSpot, playerPos))
		if inArena then
			lockedDist = (lockedSafeSpot - playerPos).Magnitude
			if lockedDist <= 45 and geometry.IsPathSafe(playerPos, lockedSafeSpot, currentHazardsSet, dangerPart) then
				isOldPointStillSafe = true

				-- NẾU CÓ QUẢ CẦU ĐANG Ở GẦN (< 24 studs):
				-- Tuyệt đối KHÔNG giữ điểm khóa nếu điểm đó quá gần quả cầu (< 18 studs)
				-- hoặc nếu nhân vật đã tới nơi (lockedDist <= 1.5) nhưng quả cầu vẫn đang dí -> Buộc tính điểm lùi tiếp theo!
				if activeOrbPart and activeOrbPart.Position then
					local distOrbToLocked = (Vector3.new(lockedSafeSpot.X - activeOrbPart.Position.X, 0, lockedSafeSpot.Z - activeOrbPart.Position.Z)).Magnitude
					if distOrbToLocked < 18.0 and distToOrb < 24.0 then
						isOldPointStillSafe = false
					elseif lockedDist <= 1.5 and distToOrb < 24.0 then
						isOldPointStillSafe = false
					end
				end

				-- NẾU ĐÃ CÓ ĐIỂM KHÓA HỢP LỆ VÀ ĐANG TRÊN ĐƯỜNG CHẠY TỚI (lockedDist <= 6.5 studs):
				-- Giữ nguyên 100% điểm này, triệt tiêu hoàn toàn hiện tượng nhảy điểm giậm chân tại chỗ!
				if isOldPointStillSafe and lockedDist <= 6.5 then
					local finalDist = math.floor(lockedDist * 10) / 10
					return true, lockedSafeSpot, hazardName, finalDist
				end
			end
		end
	end

	-- Điểm khóa cũ bị skill mới đè hoặc không còn an toàn -> Xóa khóa
	if not isOldPointStillSafe then
		lockedSafeSpot = nil
		lockedHazardCount = currentHazardCount
	end

	local candidatePos = nil
	local isMultiRings = hazardName:lower():find("multiring") ~= nil
		or (dangerInfo.Instance and dangerInfo.Instance.Name:lower():find("multiring") ~= nil)

	-- 3. Tính Vector Lực Đẩy Thoát Nạn Tổng Hợp (Multi-Hazard Repulsion)
	local repVector = computeRepulsionVector(playerPos, dangerPart)

	if isMultiRings then
		-- Tính điểm thoát nhanh cho thirdBossMultiRings:
		local inRing, r, rIn, rOut, centerPos, ringCF = geometry.IsPointInRingPart(playerPos, dangerPart)
		local candidates = {}

		if inRing and centerPos and r and r > 0.1 then
			local diffX = playerPos.X - centerPos.X
			local diffZ = playerPos.Z - centerPos.Z
			local unitX = diffX / r
			local unitZ = diffZ / r

			-- Thử bước vào lỗ trong (nhích nhẹ 3 studs)
			if rIn and rIn > 2.0 then
				local stepIn = Vector3.new(centerPos.X + unitX * (rIn - 2.5), playerPos.Y, centerPos.Z + unitZ * (rIn - 2.5))
				table.insert(candidates, stepIn)
			end

			-- Thử bước vào khoảng hở ngoài (nhích nhẹ 3 studs)
			if rOut then
				local stepOut = Vector3.new(centerPos.X + unitX * (rOut + 2.5), playerPos.Y, centerPos.Z + unitZ * (rOut + 2.5))
				table.insert(candidates, stepOut)
			end

			-- Thử bước sang nửa đối diện nếu là bán nguyệt
			local stepFlip = Vector3.new(centerPos.X - diffX, playerPos.Y, centerPos.Z - diffZ)
			table.insert(candidates, stepFlip)
		end

		-- Quét tỏa tròn 8 hướng bổ trợ (Cân bằng hiệu suất CPU tối ưu)
		local multiRingsRadii = { 3.5, 7.0, 12.0, 18.0, 26.0, 35.0 }
		local multiRingsAngles = { 0, 45, 90, 135, 180, 225, 270, 315 }

		for _, dist in ipairs(multiRingsRadii) do
			for _, angleDeg in ipairs(multiRingsAngles) do
				local rad = math.rad(angleDeg)
				local offset = Vector3.new(math.cos(rad) * dist, 0, math.sin(rad) * dist)
				table.insert(candidates, playerPos + offset)
			end
		end

		local bestPos = nil
		local bestScore = math.huge
		local fallbackPos = nil
		local fallbackScore = math.huge

		-- TỐI ƯU HIỆU SUẤT CPU: Đánh giá thuần túy bằng toán hình học (0 Raycast trong loop)
		for _, candWorld in ipairs(candidates) do
			if boss1ArenaCenter and not isInsideBoss1Arena(candWorld, playerPos) then
				continue
			end
			-- Tránh né thẳng vào Boss Orb (nếu có quả cầu Boss 2 đang hoạt động):
			if activeOrbPart and activeOrbPart.Position then
				local dOrb = (Vector3.new(candWorld.X - activeOrbPart.Position.X, 0, candWorld.Z - activeOrbPart.Position.Z)).Magnitude
				if dOrb < 12.0 then
					continue
				end
			end
			if geometry.IsSpotFullySafe(candWorld, 0.5) then
				local moveDist = (candWorld - playerPos).Magnitude
				local score = moveDist - getClearanceBonus(candWorld)
				if score < fallbackScore then
					fallbackScore = score
					fallbackPos = candWorld
				end
				if geometry.IsPathSafe(playerPos, candWorld, currentHazardsSet, dangerPart) then
					if score < bestScore then
						bestScore = score
						bestPos = candWorld
					end
				end
			end
		end

		-- Chỉ bắn DUY NHẤT 1 TIA RAYCAST cho điểm ứng viên tốt nhất đã chọn
		local chosenMultiRing = bestPos or fallbackPos
		if chosenMultiRing then
			local snapped, hasFloor = geometry.GetFloorPosition(chosenMultiRing)
			if hasFloor and geometry.IsSpotFullySafe(snapped, 0.5) then
				if not (boss1ArenaCenter and not isInsideBoss1Arena(snapped, playerPos)) then
					candidatePos = snapped
				else
					candidatePos = chosenMultiRing
				end
			else
				candidatePos = chosenMultiRing
			end
		end
	elseif dangerTraj and dangerTraj.isTrajectory then
		-- 4. CHIẾN LƯỢC CHO PROJECTILE / MOVING BEAM:
		-- NGUYÊN TẮC VÀNG: TUYỆT ĐỐI KHÔNG NÉ VỀ PHÍA TRƯỚC THEO HƯỚNG BAY CỦA CHIÊU!
		-- (Vì né về phía trước theo hướng bay sẽ làm Green Spot xuất hiện trên đường đi của chiêu -> Player bị đẩy dần)
		-- Chỉ né theo 2 hướng an toàn:
		-- 1) Thoát ngang vuông góc sang 2 bên sườn (Perpendicular Left / Right)
		-- 2) Thoát lùi về phía sau (Behind / Backwards) sau khi thanh beam / đạn vừa quét qua!

		local forward2D = dangerTraj.forward2D
		local perpDist = dangerTraj.perpDist
		local dangerRadius = dangerTraj.dangerRadius
		local stepNeeded = math.max(3.5, (dangerRadius - perpDist) + ESCAPE_MARGIN)

		-- Vector vuông góc sang phải và sang trái (90 deg trên mặt phẳng X-Z)
		local perpRight = Vector3.new(forward2D.Z, 0, -forward2D.X)
		local perpLeft = Vector3.new(-forward2D.Z, 0, forward2D.X)

		local isMovingBeam = hazardName:lower():find("movingbeam") ~= nil
			or (dangerPart and dangerPart.Name:lower():find("movingbeam") ~= nil)
		local isBossOrb = (dangerTraj and dangerTraj.isBossOrb)
			or (hazardName:lower():find("orb") ~= nil)
			or (dangerPart and dangerPart.Name:lower():find("orb") ~= nil)

		local trajCandidates = {}

		if isBossOrb then
			-- CHIẾN LƯỢC CHO BOSS 2 ORB (Yellow/Red/Green Orb):
			-- Quả cầu dí theo Player. Thoát hiểm và DUY TRÌ KHOẢNG CÁCH AN TOÀN (>= 18 studs):
			-- forward2D ở đây là vector hướng từ Quả Cầu ra vị trí Player!
			-- Do đó, playerPos + forward2D * kDist là chạy THẲNG RA XA Quả Cầu (tăng cự ly an toàn)!
			-- Kết hợp lách sườn perpRight * pOff để khiến quả cầu bay chệch hướng (Flank & Kite)
			local kiteDists = { 6.0, 10.0, 15.0, 20.0, 26.0, 32.0 }
			local perpOffsets = { 0, 2.0, -2.0, 4.5, -4.5, 7.0, -7.0 }
			for _, kDist in ipairs(kiteDists) do
				for _, pOff in ipairs(perpOffsets) do
					local kitePos = playerPos + forward2D * kDist + perpRight * pOff
					table.insert(trajCandidates, kitePos)
				end
			end
		elseif isMovingBeam then
			-- CHIẾN LƯỢC MOVING BEAM (Boss 2): Cho phép lùi sau đuôi beam đã quét qua
			local fOffsets = { 0, -3, -6, -10 }
			for _, fOff in ipairs(fOffsets) do
				local fVec = forward2D * fOff
				table.insert(trajCandidates, playerPos + perpRight * stepNeeded + fVec)
				table.insert(trajCandidates, playerPos + perpLeft * stepNeeded + fVec)
				table.insert(trajCandidates, playerPos + perpRight * (stepNeeded + 2.5) + fVec)
				table.insert(trajCandidates, playerPos + perpLeft * (stepNeeded + 2.5) + fVec)
			end

			if dangerPart and dangerPart.Parent then
				local bPos = Vector3.new(dangerPart.Position.X, playerPos.Y, dangerPart.Position.Z)
				table.insert(trajCandidates, bPos - forward2D * 7.0)
				table.insert(trajCandidates, bPos - forward2D * 11.0)
				table.insert(trajCandidates, bPos - forward2D * 7.0 + perpRight * 5.0)
				table.insert(trajCandidates, bPos - forward2D * 7.0 + perpLeft * 5.0)
			end
			table.insert(trajCandidates, playerPos - forward2D * (ESCAPE_MARGIN + 4.0))
			table.insert(trajCandidates, playerPos - forward2D * (ESCAPE_MARGIN + 8.0))
			table.insert(trajCandidates, playerPos - forward2D * (ESCAPE_MARGIN + 12.0))
		else
			-- CHIẾN LƯỢC PROJECTILE / BEAM CỦA BOSS 1 (firstBossBigSpike, seekingSpikes):
			-- ƯU TIÊN TUYỆT ĐỐI: Lách ngang vuông góc thuần túy 90° (Điểm 1) - Thoát hiểm nhanh nhất
			local latSteps = { stepNeeded, stepNeeded + 2.0, stepNeeded + 4.0 }
			for _, sDist in ipairs(latSteps) do
				table.insert(trajCandidates, playerPos + perpRight * sDist)
				table.insert(trajCandidates, playerPos + perpLeft * sDist)
			end

			-- Dự phòng lệch nhẹ chỉ khi cả 2 hướng ngang thuần túy đều bị chướng ngại vật cản:
			local backupFOffsets = { -1.5, 1.5, -3.0 }
			for _, fOff in ipairs(backupFOffsets) do
				local fVec = forward2D * fOff
				table.insert(trajCandidates, playerPos + perpRight * stepNeeded + fVec)
				table.insert(trajCandidates, playerPos + perpLeft * stepNeeded + fVec)
			end
		end

		local bestPos = nil
		local bestScore = math.huge
		local fallbackPos = nil
		local fallbackScore = math.huge

		-- TỐI ƯU HIỆU SUẤT CPU: Đánh giá thuần túy bằng toán hình học (0 Raycast trong loop)
		for _, candWorld in ipairs(trajCandidates) do
			-- Hard gate Arena Boss 1: Không chọn điểm ra khỏi sàn đấu
			if boss1ArenaCenter and not isInsideBoss1Arena(candWorld, playerPos) then
				continue
			end

			-- Tránh né thẳng vào Boss Orb (nếu đang né chiêu khác mà có quả cầu ở gần):
			if not isBossOrb and activeOrbPart and activeOrbPart.Position then
				local dOrb = (Vector3.new(candWorld.X - activeOrbPart.Position.X, 0, candWorld.Z - activeOrbPart.Position.Z)).Magnitude
				if dOrb < 12.0 then
					continue
				end
			end

			-- LỌC CHẶN TRIỆT ĐỂ:
			local toCand = candWorld - playerPos
			if toCand.Magnitude > 0.5 then
				local dotForward = toCand.Unit:Dot(forward2D)
				if isBossOrb then
					-- Với Quả Cầu (forward2D hướng từ Quả Cầu tới Player):
					-- Tuyệt đối không chọn điểm chạy đâm đầu ngược lại vào Quả Cầu (dotForward < -0.25)
					if dotForward < -0.25 then
						continue
					end
				else
					-- Với Tia bắn thẳng / Moving Beam (forward2D hướng theo chiều đạn bay):
					-- Tuyệt đối không chọn điểm nằm về phía trước theo hướng bay của chiêu (dotForward > 0.25)
					if dotForward > 0.25 then
						continue
					end
				end
			end

			if geometry.IsSpotFullySafe(candWorld, 0.5) then
				-- Chấm điểm ưu tiên: Cự ly ngắn nhất = thời gian ở trong vùng đỏ ít nhất
				local moveDist = toCand.Magnitude
				local clearance = getClearanceBonus(candWorld)
				local score = (moveDist * 1.6) - (clearance * 0.3)

				local dotFwd = toCand.Magnitude > 0.5 and toCand.Unit:Dot(forward2D) or 0
				if isBossOrb then
					-- Thưởng lớn cho việc gia tăng khoảng cách an toàn với Quả Cầu (Kiting Safe Distance):
					if activeOrbPart and activeOrbPart.Position then
						local newDistOrb = (Vector3.new(candWorld.X - activeOrbPart.Position.X, 0, candWorld.Z - activeOrbPart.Position.Z)).Magnitude
						if newDistOrb < 15.0 then
							score = score + (15.0 - newDistOrb) * 10.0 -- Phạt nặng nếu điểm ứng viên vẫn quá gần quả cầu
						else
							score = score - math.min(25.0, (newDistOrb - 15.0) * 2.0) -- Thưởng điểm cực lớn khi mở rộng cự ly an toàn
						end
					end
					local dotPerp = toCand.Magnitude > 0.5 and math.abs(toCand.Unit:Dot(perpRight)) or 0
					if dotPerp >= 0.65 then
						score = score - 8.0 -- Thưởng lách sườn
					end
				elseif isMovingBeam and dotFwd < -0.2 then
					-- Chỉ thưởng lùi ra sau cho Moving Beam của Boss 2!
					score = score - 15.0
				elseif not isMovingBeam then
					-- Thưởng áp đảo cho bước né thuần ngang vuông góc (Perpendicular - Điểm 1)
					local dotPerp = toCand.Magnitude > 0.5 and math.abs(toCand.Unit:Dot(perpRight)) or 0
					if dotPerp >= 0.90 then
						score = score - 12.0 -- Điểm 1: Lách ngang sườn ngắn nhất, không bị deal dame
					elseif dotPerp < 0.80 then
						score = score + 4.0  -- Điểm 2: Đi chéo/lùi xéo bị phạt điểm nặng
					end
				end

				-- Ưu tiên kéo về tâm sàn đấu Boss 1 nếu đang dạt ra xa
				if boss1ArenaCenter then
					score = score + getBoss1ArenaScoreAdjustment(candWorld, playerPos)
				end

				-- Ưu tiên hướng Player đang chủ động di chuyển (Chống giật đổi hướng 180 độ):
				if moveDir and moveDist > 0.5 then
					local dotMove = toCand.Unit:Dot(moveDir)
					if dotMove > 0.15 then
						score = score - (dotMove * 5.0) -- Thưởng lớn cho hướng đang chạy
					elseif dotMove < -0.15 then
						score = score + (math.abs(dotMove) * 6.0) -- Phạt nặng việc quay xe giật lùi ngược hướng
					end
				end

				-- Anti-Flicker Hysteresis: Ưu tiên duy trì điểm Safe Spot đã khóa trước đó
				if lockedSafeSpot then
					local distToLocked = (candWorld - lockedSafeSpot).Magnitude
					if distToLocked < 3.0 then
						score = score - 8.0
					end
				end

				if score < fallbackScore then
					fallbackScore = score
					fallbackPos = candWorld
				end
				if geometry.IsPathSafe(playerPos, candWorld, currentHazardsSet, dangerPart) then
					if score < bestScore then
						bestScore = score
						bestPos = candWorld
					end
				end
			end
		end

		if not bestPos then
			-- Fallback: Quét tỏa các góc LÙI VÀ NGANG thuần toán học (0 Raycast)
			local fwdAngleDeg = math.deg(math.atan2(forward2D.Z, forward2D.X))
			local testAngles = isMovingBeam and { 90, -90, 120, -120, 150, -150, 180 }
				or isBossOrb and { 0, 15, -15, 30, -30, 45, -45, 60, -60 }
				or { 90, -90, 75, -75, 105, -105, 60, -60, 120, -120 }
			local backRadii = { 4.0, 7.0, 11.0, 16.0, 22.0 }

			for _, dist in ipairs(backRadii) do
				for _, offDeg in ipairs(testAngles) do
					local testRad = math.rad(fwdAngleDeg + offDeg)
					local testWorld = playerPos + Vector3.new(math.cos(testRad) * dist, 0, math.sin(testRad) * dist)
					if boss1ArenaCenter and not isInsideBoss1Arena(testWorld, playerPos) then
						continue
					end
					if geometry.IsSpotFullySafe(testWorld, 0.5) then
						if geometry.IsPathSafe(playerPos, testWorld, currentHazardsSet, dangerPart) then
							bestPos = testWorld
							break
						end
					end
				end
				if bestPos then break end
			end
		end

		-- Chỉ bắn DUY NHẤT 1 TIA RAYCAST cho điểm ứng viên tốt nhất đã chọn
		local chosenTraj = bestPos or fallbackPos
		if chosenTraj then
			local snapped, hasFloor = geometry.GetFloorPosition(chosenTraj)
			if hasFloor and geometry.IsSpotFullySafe(snapped, 0.5) then
				if not (boss1ArenaCenter and not isInsideBoss1Arena(snapped, playerPos)) then
					candidatePos = snapped
				else
					candidatePos = chosenTraj
				end
			else
				candidatePos = chosenTraj
			end
		end
	else
		-- 5. CHIẾN LƯỢC CHO KỸ NĂNG THÔNG THƯỜNG / ĐÈ NHAU (MULTI-HAZARD SOLVER)
		-- ƯU TIÊN SỐ 1: THOÁT MÉP HÌNH HỌC TRỰC TIẾP NGẮN NHẤT (SHORTEST GEOMETRIC EXIT)
		-- Đo chính xác khoảng cách từ Player ra mép chiêu gần nhất -> Nhích đúng 1.5 studs qua vạch đỏ là an toàn ngay!
		local bestPos = nil
		local bestScore = math.huge
		local fallbackPos = nil
		local fallbackScore = math.huge

		if dangerPart and dangerPart.Parent and dangerPart:IsA("BasePart") then
			local directCandidates = {}

			if dangerPart:IsA("Part") and (dangerPart.Shape == Enum.PartType.Ball or dangerPart.Shape == Enum.PartType.Cylinder) then
				-- A1. Chiêu hình tròn / hình trụ: Thoát theo hướng xuyên tâm + 6 góc rẻ quạt
				local radius = math.max(dangerPart.Size.X, dangerPart.Size.Z) / 2
				local escapeRadius = radius + ESCAPE_MARGIN
				local diff = Vector3.new(playerPos.X - dangerPart.Position.X, 0, playerPos.Z - dangerPart.Position.Z)
				local distFromCenter = diff.Magnitude
				local outDir = distFromCenter > 0.1 and (diff / distFromCenter) or (moveDir or (repVector or Vector3.new(0, 0, 1)))
				local baseAngle = math.atan2(outDir.Z, outDir.X)

				-- Điểm thoát ngắn nhất tuyệt đối: Chiếu thẳng từ tâm qua chân người chơi ra ngoài mép
				table.insert(directCandidates, dangerPart.Position + outDir * escapeRadius)

				-- 6 góc rẻ quạt dự phòng (±20°, ±40°, ±65°)
				local fanAngles = { math.rad(20), -math.rad(20), math.rad(40), -math.rad(40), math.rad(65), -math.rad(65) }
				for _, angOff in ipairs(fanAngles) do
					local a = baseAngle + angOff
					table.insert(directCandidates, dangerPart.Position + Vector3.new(math.cos(a) * escapeRadius, 0, math.sin(a) * escapeRadius))
				end
			elseif dangerPart.Name:lower():find("movingbeam") or (dangerPart.Parent and dangerPart.Parent.Name:lower():find("movingbeam")) then
				-- A2. Moving Beam
				local rightVec = dangerPart.CFrame.RightVector
				local right2D = Vector3.new(rightVec.X, 0, rightVec.Z)
				if right2D.Magnitude > 0.001 then right2D = right2D.Unit else right2D = Vector3.new(1, 0, 0) end
				local forward2D = Vector3.new(-right2D.Z, 0, right2D.X)
				local halfLength = math.max(dangerPart.Size.X, dangerPart.Size.Z) / 2
				local beamRadius = math.max(dangerPart.Size.Y, math.min(dangerPart.Size.X, dangerPart.Size.Z)) / 2
				if beamRadius < 3.5 then beamRadius = 3.5 end

				table.insert(directCandidates, dangerPart.Position + right2D * (halfLength + ESCAPE_MARGIN + 1.0))
				table.insert(directCandidates, dangerPart.Position - right2D * (halfLength + ESCAPE_MARGIN + 1.0))
				table.insert(directCandidates, dangerPart.Position + forward2D * (beamRadius + ESCAPE_MARGIN + 1.5))
				table.insert(directCandidates, dangerPart.Position - forward2D * (beamRadius + ESCAPE_MARGIN + 1.5))
			else
				-- A3. Chiêu hình chữ nhật / OBB: Tự động phát hiện trục Dài/Rộng
				local localPos = dangerPart.CFrame:PointToObjectSpace(playerPos)
				local halfX = dangerPart.Size.X / 2
				local halfZ = dangerPart.Size.Z / 2

				-- Tự động nhận diện trục dài (Length) và trục hẹp (Width) của hành lang:
				if halfZ >= halfX * 1.4 then
					-- Trục Z là hành lang dài, trục X là bề sườn hẹp:
					-- ƯU TIÊN TUYỆT ĐỐI: Thoát vuông góc sang 2 bên sườn trục X tại đúng vị trí Z của người chơi!
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(halfX + ESCAPE_MARGIN, localPos.Y, localPos.Z)))
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(-(halfX + ESCAPE_MARGIN), localPos.Y, localPos.Z)))
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(halfX + ESCAPE_MARGIN + 2.0, localPos.Y, localPos.Z)))
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(-(halfX + ESCAPE_MARGIN + 2.0), localPos.Y, localPos.Z)))
				elseif halfX >= halfZ * 1.4 then
					-- Trục X là hành lang dài, trục Z là bề sườn hẹp:
					-- ƯU TIÊN TUYỆT ĐỐI: Thoát vuông góc sang 2 bên sườn trục Z tại đúng vị trí X của người chơi!
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(localPos.X, localPos.Y, halfZ + ESCAPE_MARGIN)))
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(localPos.X, localPos.Y, -(halfZ + ESCAPE_MARGIN))))
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(localPos.X, localPos.Y, halfZ + ESCAPE_MARGIN + 2.0)))
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(localPos.X, localPos.Y, -(halfZ + ESCAPE_MARGIN + 2.0))))
				else
					-- Chiêu hình vuông hoặc chữ nhật đều: Thoát 4 cạnh gần nhất (TUYỆT ĐỐI KHÔNG sinh 4 góc chéo xa)
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(halfX + ESCAPE_MARGIN, localPos.Y, localPos.Z)))
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(-(halfX + ESCAPE_MARGIN), localPos.Y, localPos.Z)))
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(localPos.X, localPos.Y, halfZ + ESCAPE_MARGIN)))
					table.insert(directCandidates, dangerPart.CFrame:PointToWorldSpace(Vector3.new(localPos.X, localPos.Y, -(halfZ + ESCAPE_MARGIN))))
				end
			end

			-- Đánh giá các điểm thoát trực tiếp (0 Raycast)
			for _, candWorld in ipairs(directCandidates) do
				if boss1ArenaCenter and not isInsideBoss1Arena(candWorld, playerPos) then
					continue
				end
				if geometry.IsSpotFullySafe(candWorld, 0.5) then
					local score = scoreCandidate(playerPos, candWorld, repVector, moveDir)
					if score < fallbackScore then
						fallbackScore = score
						fallbackPos = candWorld
					end
					if geometry.IsPathSafe(playerPos, candWorld, currentHazardsSet, dangerPart) then
						if score < bestScore then
							bestScore = score
							bestPos = candWorld
						end
					end
				end
			end
		end

		-- ƯU TIÊN SỐ 2: NẾU THOÁT TRỰC TIẾP BỊ VƯỚNG -> QUÉT TỎA TRÒN MỊN (RADIAL SWEEP)
		if not bestPos then
			local radPos, radScore = searchRadialSafeSpot(playerPos, repVector, currentHazardsSet, dangerPart, moveDir)
			if radPos and radScore < bestScore then
				bestPos = radPos
				bestScore = radScore
			end
		end

		-- Chọn điểm tốt nhất và snap sàn bằng duy nhất 1 Raycast
		local chosenFinal = bestPos or fallbackPos
		if chosenFinal then
			local snapped, hasFloor = geometry.GetFloorPosition(chosenFinal)
			if hasFloor and geometry.IsSpotFullySafe(snapped, 0.5) then
				if not (boss1ArenaCenter and not isInsideBoss1Arena(snapped, playerPos)) then
					candidatePos = snapped
				else
					candidatePos = chosenFinal
				end
			else
				candidatePos = chosenFinal
			end
		end

		-- Fallback khẩn cấp nếu mọi hướng đều bị kẹt hoặc chiêu quá lớn:
		-- Đẩy Player chạy dạt ra xa theo hướng lực đẩy thoát hiểm (Repulsion Vector) thay vì đứng yên chịu trận
		if not candidatePos then
			local escapeDir = (repVector and repVector.Magnitude > 0.01) and repVector.Unit
				or (moveDir and moveDir.Magnitude > 0.01 and moveDir.Unit)
				or Vector3.new(0, 0, 1)
			local emergencyPos = playerPos + (escapeDir * 18.0)
			if boss1ArenaCenter and not isInsideBoss1Arena(emergencyPos, playerPos) then
				emergencyPos = playerPos + (boss1ArenaCenter - playerPos).Unit * 15.0
			end
			local snappedEmerg, hasFloorEmerg = geometry.GetFloorPosition(emergencyPos)
			candidatePos = hasFloorEmerg and snappedEmerg or emergencyPos
		end
	end

	-- 6. KHÓA CHẶT ĐIỂM AN TOÀN VỪA TÌM ĐƯỢC KẾT HỢP OPPORTUNISTIC RETARGETING:
	if candidatePos then
		-- Nếu điểm cũ vẫn an toàn nhưng điểm mới gần hơn vượt trội (>= HYSTERESIS_THRESHOLD studs):
		-- -> Bẻ lái sang điểm mới gần hơn ngay lập tức (ví dụ: né dải xanh vừa biến mất chỉ cách 2-3 studs thay vì chạy 15 studs ra mép)!
		-- Ngược lại, nếu điểm mới không gần hơn đủ nhiều -> Tiếp tục giữ điểm cũ để tránh rung giật
		if isOldPointStillSafe then
			local newDist = (candidatePos - playerPos).Magnitude
			if (lockedDist - newDist) >= HYSTERESIS_THRESHOLD then
				lockedSafeSpot = candidatePos
				lockedHazardCount = currentHazardCount
				local finalDist = math.floor(newDist * 10) / 10
				return true, candidatePos, hazardName, finalDist
			else
				local finalDist = math.floor(lockedDist * 10) / 10
				return true, lockedSafeSpot, hazardName, finalDist
			end
		end

		lockedSafeSpot = candidatePos
		lockedHazardCount = currentHazardCount
		local finalDist = math.floor((candidatePos - playerPos).Magnitude * 10) / 10
		return true, candidatePos, hazardName, finalDist
	elseif isOldPointStillSafe then
		-- Không tìm thấy candidatePos mới tốt hơn -> Tiếp tục giữ điểm cũ
		local finalDist = math.floor(lockedDist * 10) / 10
		return true, lockedSafeSpot, hazardName, finalDist
	end

	lockedSafeSpot = nil
	lockedHazardCount = 0
	return true, nil, hazardName, 0
end

return safeSpot end function __DIST.t()--==============================================================--
-- Smart Dodge – Module 5: Dodge Execution
-- MoveTo Hybrid + Snap + Time Budget
-- DungeonQuest
--
-- HYBRID:
--   (1) Safe Spot <= Max Snap Distance
--       -> SNAP immediately.
--
--   (2) Safe Spot farther away
--       -> Humanoid:MoveTo() toward target.
--       -> Walk for at most Max Dodge Time.
--       -> When distance <= Max Snap Distance -> SNAP.
--       -> When Time Budget expires -> SNAP remainder.
--
--   (3) Real-time Target Tracking
--       -> currentTargetPos can be updated by Perform().
--       -> MoveTo() is refreshed only when target moves enough.
--
--   (4) Flat Floor Movement
--       -> MoveTo target uses X/Z from Safe Spot.
--       -> Y is kept at the player's current/starting movement height.
--
--   (5) Maintain Snap Height
--       -> Snap keeps the player's original Y when enabled.
--
-- IMPORTANT:
--   WALK no longer directly manipulates CFrame or velocity.
--   Humanoid:MoveTo() is responsible for normal character movement.
--
--==============================================================--

--// Imports

local services = __DIST.load('e')
local shared = __DIST.load('f')
local targetFacing = __DIST.load('r')
local RunService = services.RunService

--// References
local player = services.player

--// State
local autoDodgeEnabled = false
local dodgeMode = "HumanoidMove" -- "HumanoidMove" | "Blink" | "MoveTo"

local maxSnapDistance = 1.0
local blinkStep = 1.0 -- Cự ly mỗi nhịp chớp Blink (studs)

local FINAL_ADJUST_DIST = 0.5

local maintainSnapHeight = true

local isDodging = false
local dodgeThread = nil
local activeMoveConn = nil

local currentTargetPos = nil

--// Panic Sprint (Phương án B: Tăng tốc khi tình huống nguy cấp)
local panicSprintEnabled = true
local panicSpeed = 24
local panicDuration = 1.5
local panicCooldown = 5.0
local lastPanicTime = 0

local dodgeStatusCallbacks = {}

--// MoveTo tuning
--
-- Don't re-issue MoveTo every frame.
-- This prevents constantly resetting the Humanoid's movement target.
local MOVE_TARGET_UPDATE_DISTANCE = 1.5

-- Minimum distance before considering movement finished.
local MOVE_FINISH_DISTANCE = 1.0

-- How often we check the target / danger state.
local MOVE_CHECK_INTERVAL = 0.03

--// Provider trả về vị trí cần quay mặt khi né
--// Ví dụ enemy — do AutoFarm Mode 2 đăng ký.
--// nil = giữ hành vi cũ.
local faceTargetProvider = nil

--// Raycast Parameters cho Blink kiểm tra tường và sàn (Anti-Cheat Protection)
local blinkRayParams = RaycastParams.new()
blinkRayParams.FilterType = Enum.RaycastFilterType.Exclude
blinkRayParams.IgnoreWater = true

local function updateBlinkRayFilter()
	local ignoreList = {}
	for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
		if p.Character then table.insert(ignoreList, p.Character) end
	end
	if workspace:FindFirstChild("RaycastIgnore") then
		table.insert(ignoreList, workspace.RaycastIgnore)
	end
	blinkRayParams.FilterDescendantsInstances = ignoreList
end

--// Runtime do engine bơm:
--// { getInDanger = fn, getLogInDanger = fn }
local runtime = nil

local dodge = {}

--==============================================================--
-- Runtime
--==============================================================--

function dodge.SetRuntime(ctx)
	runtime = ctx or nil
end

local function getInDanger()
	return runtime
		and runtime.getInDanger
		and runtime.getInDanger()
		or false
end

local function getLogInDanger()
	return runtime
		and runtime.getLogInDanger
		and runtime.getLogInDanger()
		or false
end

local function getActiveBossOrb()
	return runtime
		and runtime.getActiveBossOrb
		and runtime.getActiveBossOrb()
end

--==============================================================--
-- Status callbacks
--==============================================================--

local function fireDodgeStatus(status)
	for _, cb in ipairs(dodgeStatusCallbacks) do
		pcall(cb, status)
	end
end

dodge.FireStatus = fireDodgeStatus

--==============================================================--
-- Face target
--==============================================================--

local function getFaceTarget()
	if faceTargetProvider then
		local ok, pos = pcall(faceTargetProvider)
		if ok and type(pos) == "table" and pos.X and pos.Z then
			return pos
		end
	end

	-- Luôn luôn lấy vị trí mục tiêu nếu có (Bất kể toggle UI bật hay tắt)
	-- Đảm bảo yêu cầu cốt lõi: "Dù đang né thì vẫn phải nhìn vào mục tiêu."
	if targetFacing then
		local tPos = targetFacing.GetTargetPosition()
		if tPos then
			return tPos
		end
	end

	return nil
end

--==============================================================--
-- Helpers
--==============================================================--

local function getCharacterParts()
	local char = player and player.Character

	if not char then
		return nil, nil, nil
	end

	local rootPart = char:FindFirstChild("HumanoidRootPart")
	local humanoid = char:FindFirstChild("Humanoid")

	if not rootPart or not humanoid then
		return char, nil, nil
	end

	return char, rootPart, humanoid
end

-- Flat X/Z distance.
local function flatDistance(a, b)
	if not a or not b then
		return math.huge
	end

	local dx = a.X - b.X
	local dz = a.Z - b.Z

	return math.sqrt(dx * dx + dz * dz)
end

-- Convert arbitrary target into a flat MoveTo position.
--
-- We intentionally do not ask Humanoid to walk toward
-- the Safe Spot's raw Y value.
--
-- This keeps movement primarily horizontal.
local function makeMoveTarget(rootPart, pos)
	if not rootPart or not pos then
		return nil
	end

	return Vector3.new(
		pos.X,
		rootPart.Position.Y,
		pos.Z
	)
end

--==============================================================--
-- Snap
--==============================================================--
--
-- Teleport dứt điểm:
--   - X/Z = Safe Spot
--   - Y = starting player height if maintainSnapHeight
--   - otherwise calculate floor-relative height
--   - face enemy if provider exists
--
local function snapFace(rootPart, humanoid, pos, startHeight)
	if not rootPart or not pos then
		return
	end

	local targetY = startHeight or pos.Y

	if not maintainSnapHeight and humanoid and humanoid.HipHeight and rootPart then
		local rootOffset = humanoid.HipHeight + (rootPart.Size.Y / 2)
		local rayOrigin = Vector3.new(pos.X, (startHeight or rootPart.Position.Y) + 6, pos.Z)
		local rayDir = Vector3.new(0, -20, 0)
		local floorResult = workspace:Raycast(rayOrigin, rayDir, blinkRayParams)
		if floorResult and floorResult.Position then
			targetY = floorResult.Position.Y + rootOffset
		else
			local floorY = pos.Y - 3
			targetY = floorY + rootOffset
		end
	end

	local actualPos = Vector3.new(
		pos.X,
		targetY,
		pos.Z
	)

	local targetPos = getFaceTarget()

	if targetPos then
		rootPart.CFrame = CFrame.lookAt(
			actualPos,
			Vector3.new(
				targetPos.X,
				targetY,
				targetPos.Z
			)
		)
	else
		-- Preserve current facing direction.
		local look = rootPart.CFrame.LookVector

		local flatLook = Vector3.new(
			look.X,
			0,
			look.Z
		)

		if flatLook.Magnitude > 0.001 then
			flatLook = flatLook.Unit

			rootPart.CFrame = CFrame.lookAt(
				actualPos,
				actualPos + flatLook
			)
		else
			rootPart.CFrame = CFrame.new(actualPos)
		end
	end

	-- Only zero residual velocity AFTER snap.
	--
	-- During WALK we deliberately do NOT do this because
	-- Humanoid movement needs the normal character controller.
	rootPart.AssemblyLinearVelocity = Vector3.zero
	rootPart.AssemblyAngularVelocity = Vector3.zero
end

--==============================================================--
-- Face while walking
--==============================================================--
--
-- We do NOT set CFrame here.
--
-- AutoRotate is used so Humanoid movement remains responsible
-- for the character's orientation.
--
-- If an external faceTargetProvider exists, we temporarily
-- disable AutoRotate and rotate using Humanoid:MoveTo() only
-- is not enough to guarantee facing an arbitrary enemy.
--
-- Therefore:
--   - normal mode -> AutoRotate = true
--   - face-target mode -> AutoRotate = false
--     and use a lightweight orientation adjustment.
--
-- IMPORTANT:
-- This is intentionally not done every frame.
--
local function updateWalkFacing(rootPart, humanoid)
	local faceTarget = getFaceTarget()

	if not faceTarget then
		humanoid.AutoRotate = true
		return
	end

	humanoid.AutoRotate = false

	local current = rootPart.Position

	local target = Vector3.new(
		faceTarget.X,
		current.Y,
		faceTarget.Z
	)

	local diff = target - current

	if diff.Magnitude > 0.05 then
		local look = diff.Unit

		-- Rotate only.
		--
		-- This does not change position.
		rootPart.CFrame = CFrame.lookAt(
			current,
			current + look
		)
	end
end

local function tryTriggerPanicSprint(safePos, escapeDist, hazardName, rootPart, humanoid)
	if not panicSprintEnabled then return end
	if dodgeMode ~= "HumanoidMove" and dodgeMode ~= "MoveTo" then return end
	if not rootPart or not rootPart.Parent then return end

	-- TỐI ƯU HÓA: Kiểm tra nếu Player đã có sẵn tốc độ hoặc Velocity >= 24 (do chiêu buff tốc chính thức của game)
	-- -> Bỏ qua kích hoạt Panic để tiết kiệm cooldown 5s và tránh can thiệp vào buff của game
	local curWalkSpeed = humanoid and humanoid.WalkSpeed or 0
	local vel = rootPart.AssemblyLinearVelocity
	local horizVelocity = vel and Vector3.new(vel.X, 0, vel.Z).Magnitude or 0

	if curWalkSpeed >= (panicSpeed - 0.5) or horizVelocity >= (panicSpeed - 1.0) then
		return
	end

	local now = os.clock()
	if (now - lastPanicTime) < panicCooldown then return end

	local isEmergency = false
	local panicReason = nil

	-- 1. Cự ly né xa (escapeDist >= 10.0 studs)
	local currentDist = escapeDist or (safePos and (Vector3.new(safePos.X - rootPart.Position.X, 0, safePos.Z - rootPart.Position.Z).Magnitude)) or 0
	if currentDist >= 10.0 then
		isEmergency = true
		panicReason = ("Long escape distance (%.1f studs)"):format(currentDist)
	end

	-- 2. Chiêu khẩn cấp / Bị bao vây / Kiting / Lối đi bị chặn
	if not isEmergency and hazardName then
		local hLow = hazardName:lower()
		if hLow:find("emergency") or hLow:find("kiting") or hLow:find("waiting for path") or hLow:find("lead") then
			isEmergency = true
			panicReason = ("Hazard threat (%s)"):format(hazardName)
		end
	end

	-- 3. Quả Cầu (Boss Orb) hoặc Projectile nguy hiểm đang áp sát (< 15.0 studs)
	if not isEmergency then
		local activeOrb = getActiveBossOrb()
		local orbPart = activeOrb and (activeOrb.Position and activeOrb or activeOrb.Instance)
		local orbPos = orbPart and orbPart.Position
		if orbPos then
			local dOrb = (Vector3.new(orbPos.X - rootPart.Position.X, 0, orbPos.Z - rootPart.Position.Z)).Magnitude
			if dOrb < 15.0 then
				isEmergency = true
				panicReason = ("Boss Orb closing in (%.1f studs)"):format(dOrb)
			end
		end
	end

	if isEmergency then
		lastPanicTime = now
		if shared.TriggerPanicSpeed then
			shared.TriggerPanicSpeed(panicSpeed, panicDuration)
		end
		if getLogInDanger() then
			print(("[SmartDodge][Panic] 💨 PANIC SPRINT ACTIVATED! WalkSpeed boosted to %d for %.1fs (Reason: %s)")
				:format(panicSpeed, panicDuration, panicReason or "Emergency"))
		end
	end
end

--==============================================================--
-- Perform Dodge
--==============================================================--

function dodge.Perform(safePos, escapeDist, hazardName)
	-- Bỏ qua né chiêu khi nhân vật đang trong trạng thái bất tử (ForceField hoặc mới hồi sinh)
	if shared.IsInvulnerable and shared.IsInvulnerable() then
		return
	end

	local char, rootPart, humanoid = getCharacterParts()

	if not rootPart
		or not humanoid
		or humanoid.Health <= 0
	then
		return
	end

	if not safePos then
		return
	end

	-- Always update latest target.
	currentTargetPos = safePos

	-- Đánh giá kích hoạt Panic Sprint (Phương án B: Tình huống nguy cấp)
	tryTriggerPanicSprint(safePos, escapeDist, hazardName, rootPart, humanoid)

	-- If already dodging, do NOT spawn another thread.
	--
	-- The active thread will pick up currentTargetPos.
	if isDodging then
		return
	end

	dodgeThread = task.spawn(function()
		isDodging = true
		targetFacing.SetDodging(true)

		fireDodgeStatus("Dodging")


		--======================================================--
		-- Initial state
		--======================================================--

		local startHeight = rootPart.Position.Y
		local activeGyro = nil

		local function cleanGyro()
			if activeGyro and activeGyro.Parent then
				pcall(function() activeGyro:Destroy() end)
				activeGyro = nil
			end
			if humanoid and humanoid.Parent then
				local hasEnemy = targetFacing and targetFacing.IsEnabled and targetFacing.IsEnabled() and targetFacing.IsTargetActive and targetFacing.IsTargetActive()
				if hasEnemy then
					humanoid.AutoRotate = false
				else
					humanoid.AutoRotate = true
				end
			end
		end

		local function finish()
			cleanGyro()

			if activeMoveConn then
				pcall(function() activeMoveConn:Disconnect() end)
				activeMoveConn = nil
			end

			if rootPart and rootPart.Parent then
				rootPart.AssemblyLinearVelocity = Vector3.zero
				rootPart.AssemblyAngularVelocity = Vector3.zero
			end

			if humanoid and humanoid.Parent and dodgeMode == "HumanoidMove" then
				pcall(function()
					humanoid:Move(Vector3.zero, false)
					local root = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
					if root then humanoid:MoveTo(root.Position) end
				end)
			end

			-- Hủy Panic Speed ngay khi đã thoát hiểm xong về đích
			if shared.CancelPanicSpeed then
				shared.CancelPanicSpeed()
			end

			isDodging = false
			targetFacing.SetDodging(false)
			currentTargetPos = nil

			fireDodgeStatus("Safe")
		end

		local ok, err = pcall(function()
			--======================================================--
			-- Initial target
			--======================================================--

			local targetPos = currentTargetPos or safePos
			local currentPos = rootPart.Position

			local totalDist = (Vector3.new(targetPos.X, 0, targetPos.Z) - Vector3.new(currentPos.X, 0, currentPos.Z)).Magnitude

			-- 1. Nếu cự ly tới Safe Spot <= snapDistance -> Snap dứt điểm ngay lập tức (1 bước duy nhất)
			-- Trong chế độ Blink: Không bao giờ snap 1 bước lớn hơn blinkStep để chống giật anticheat sync
			local effectiveSnapDist = (dodgeMode == "Blink") and math.min(maxSnapDistance, blinkStep) or maxSnapDistance
			if totalDist <= effectiveSnapDist then
				snapFace(
					rootPart,
					humanoid,
					targetPos,
					startHeight
				)

				if getLogInDanger() then
					print(
						("[SmartDodge][Dodge] ⚡ Instant Snap (%.1f studs) to Safe Spot!")
							:format(totalDist)
					)
				end

				return
			end

			if dodgeMode == "HumanoidMove" then
				-- PURE PHYSICAL INPUT WALK (ZERO CFRAME OVERWRITE / ZERO HEIGHT JITTER)
				if getLogInDanger() then
					print(("[SmartDodge][Dodge] 🏃 Humanoid:Move (Pure Physics Walk) (%.1f studs)..."):format(totalDist))
				end

				local startTime = os.clock()
				local MAX_WALK_TIMEOUT = 4.0

				local targetEnemy = getFaceTarget()
				if targetEnemy then
					humanoid.AutoRotate = false
				else
					humanoid.AutoRotate = true
				end

				local moveTarget = Vector3.new(targetPos.X, rootPart.Position.Y, targetPos.Z)
				humanoid:MoveTo(moveTarget)

				if activeMoveConn then
					pcall(function() activeMoveConn:Disconnect() end)
					activeMoveConn = nil
				end

				activeMoveConn = RunService.RenderStepped:Connect(function()
					if not rootPart.Parent or not humanoid.Parent or humanoid.Health <= 0 then
						if activeMoveConn then activeMoveConn:Disconnect(); activeMoveConn = nil end
						return
					end

					local curTarget = currentTargetPos or safePos
					if not curTarget then return end

					local curDiff = Vector3.new(curTarget.X - rootPart.Position.X, 0, curTarget.Z - rootPart.Position.Z)
					if curDiff.Magnitude > 0.6 then
						humanoid:Move(curDiff.Unit, false)
					else
						humanoid:Move(Vector3.zero, false)
					end

					-- STRAFE FACING: Vừa rảo bước né đòn vừa giữ nguyên góc nhìn dán chặt vào mục tiêu
					if targetFacing and targetFacing.IsEnabled and targetFacing.IsEnabled() then
						local curEnemy = getFaceTarget()
						if curEnemy then
							if humanoid.AutoRotate ~= false then
								humanoid.AutoRotate = false
							end
							local pPos = rootPart.Position
							local diff = Vector3.new(curEnemy.X - pPos.X, 0, curEnemy.Z - pPos.Z)
							if diff.Magnitude > 0.5 then
								local curLook = rootPart.CFrame.LookVector
								local wantLook = diff.Unit
								if curLook:Dot(wantLook) < 0.999 then
									rootPart.CFrame = CFrame.lookAt(pPos, Vector3.new(curEnemy.X, pPos.Y, curEnemy.Z))
								end
							end
						else
							if humanoid.AutoRotate ~= true then
								humanoid.AutoRotate = true
							end
						end
					end
				end)

				while autoDodgeEnabled and (os.clock() - startTime < MAX_WALK_TIMEOUT) do
					if not rootPart.Parent or not humanoid.Parent or humanoid.Health <= 0 then
						break
					end

					-- Nếu đã an toàn (không còn hiểm họa đè) -> dừng bước
					if not getInDanger() then
						break
					end

					targetPos = currentTargetPos or safePos
					if not targetPos then break end

					currentPos = rootPart.Position
					local diff = Vector3.new(targetPos.X - currentPos.X, 0, targetPos.Z - currentPos.Z)
					local dist = diff.Magnitude

					-- SNAP DỨT ĐIỂM Ở BƯỚC CUỐI (FINAL STEP SNAP):
					-- Khi chạy gần tới Safe Spot (cự ly <= maxSnapDistance) -> Snap dứt điểm ngay vào đích!
					if dist <= maxSnapDistance then
						snapFace(rootPart, humanoid, targetPos, startHeight)
						if getLogInDanger() then
							print(("[SmartDodge][Dodge] ⚡ HumanoidMove Final Snap (%.1f studs) to Safe Spot!"):format(dist))
						end
						break
					end

					-- Nếu đã an toàn (không còn hiểm họa đè) -> dừng bước (hoặc snap nốt nếu trong cự ly)
					if not getInDanger() then
						if dist <= maxSnapDistance then
							snapFace(rootPart, humanoid, targetPos, startHeight)
						end
						break
					end

					humanoid:MoveTo(Vector3.new(targetPos.X, currentPos.Y, targetPos.Z))

					-- Tự động nhảy nếu gặp gờ bậc thang / chướng ngại vật thấp
					local waistOrigin = currentPos + Vector3.new(0, 0.5, 0)
					local waistDir = diff.Unit * 2.0
					local obstacleHit = workspace:Raycast(waistOrigin, waistDir, blinkRayParams)
					if obstacleHit and obstacleHit.Instance and obstacleHit.Instance.CanCollide and obstacleHit.Normal.Y < 0.7 then
						humanoid.Jump = true
					end

					task.wait(0.03)
				end

				-- Final check sau khi thoát loop HumanoidMove: Nếu còn trong cự ly snap, snap dứt điểm
				if rootPart.Parent and humanoid.Parent and humanoid.Health > 0 then
					targetPos = currentTargetPos or safePos
					if targetPos then
						local remainingDiff = Vector3.new(targetPos.X - rootPart.Position.X, 0, targetPos.Z - rootPart.Position.Z)
						if remainingDiff.Magnitude <= maxSnapDistance then
							snapFace(rootPart, humanoid, targetPos, startHeight)
						end
					end
				end

				finish()
				return
			end

			if dodgeMode == "Blink" then
				-- RAPID CONTINUOUS BLINK (ANTI-CHEAT HARDENED):
				-- 1. blinkStep studs mỗi 0.025s (vận tốc ~112 studs/s chuẩn Dash skill)
				-- 2. Quét raycast vật cản ngang thắt lưng (Anti No-Clip): không blink xuyên tường/cột
				-- 3. Bám sàn động (Dynamic Floor Snapping): tự nâng/hạ chân theo dốc/bậc thang
				-- 4. Triệt tiêu gia tốc vật lý (AssemblyLinearVelocity = 0): chống desync
				local currentStep = blinkStep or 1.0
				local blinkStart = os.clock()
				local MAX_BLINK_TIMEOUT = 2.5 -- Giới hạn an toàn chống kẹt

				updateBlinkRayFilter()

				while autoDodgeEnabled and (os.clock() - blinkStart < MAX_BLINK_TIMEOUT) do
					if not rootPart.Parent or not humanoid.Parent or humanoid.Health <= 0 then
						return
					end

					targetPos = currentTargetPos or safePos
					if not targetPos then break end

					currentPos = rootPart.Position
					local diff = Vector3.new(targetPos.X - currentPos.X, 0, targetPos.Z - currentPos.Z)
					local dist = diff.Magnitude

					-- Nếu đã tới cự ly snap hoặc khoảng cách quá ngắn -> Snap dứt điểm (không vượt quá currentStep)
					local snapThreshold = math.min(maxSnapDistance, currentStep)
					if dist <= snapThreshold then
						snapFace(rootPart, humanoid, targetPos, startHeight)
						if getLogInDanger() then
							print(("[SmartDodge][Dodge] ⚡ Rapid Blink reached Safe Spot (%.1f studs) -> SNAP!"):format(dist))
						end
						return
					end

					-- Nếu đã thoát hiểm hoàn toàn (không còn dính hazard) và cự ly còn lại nhỏ (<= currentStep) -> Snap và dừng
					if not getInDanger() and dist <= currentStep then
						snapFace(rootPart, humanoid, targetPos, startHeight)
						return
					end

					local stepDist = math.min(currentStep, dist)
					local stepDir = diff.Unit

					-- KIỂM TRA RAYCAST VẬT CẢN (ANTI NO-CLIP RUBBERBAND):
					-- Quét tia ngang ở tầm thắt lưng (Y + 1.5) để phát hiện tường / cột cản
					local waistOrigin = currentPos + Vector3.new(0, 1.5, 0)
					local waistDir = stepDir * (stepDist + 0.4)
					local wallHit = workspace:Raycast(waistOrigin, waistDir, blinkRayParams)

					if wallHit and wallHit.Instance and wallHit.Instance.CanCollide and wallHit.Normal.Y <= 0.65 then
						local hitDist = (wallHit.Position - waistOrigin).Magnitude
						if hitDist <= 0.7 then
							-- Đã sát tường cản, không thể tiến thêm về hướng này
							break
						else
							stepDist = math.max(0, hitDist - 0.4)
						end
					end

					local stepPos = currentPos + stepDir * stepDist
					snapFace(rootPart, humanoid, stepPos, startHeight)

					task.wait(0.025)
				end

				-- Final check sau khi thoát loop Blink: Chỉ snap nếu cự ly còn lại <= currentStep
				if rootPart.Parent and humanoid.Parent and humanoid.Health > 0 then
					targetPos = currentTargetPos or safePos
					if targetPos then
						local remainingDiff = Vector3.new(targetPos.X - rootPart.Position.X, 0, targetPos.Z - rootPart.Position.Z)
						if remainingDiff.Magnitude <= math.min(maxSnapDistance, currentStep) then
							snapFace(rootPart, humanoid, targetPos, startHeight)
						end
					end
				end
				return
			end

			-- MoveTo Walk Mode (chỉ dùng khi mode == "MoveTo")
			if getLogInDanger() then
				print(
					("[SmartDodge][Dodge] 🚶 MoveTo Walk (%.1f studs)...")
						:format(totalDist)
				)
			end

			-- DÙNG BODYGYRO ĐỂ XOAY MẶT VỀ BOSS MÀ KHÔNG LÀM ĐỨNG YÊN NHÂN VẬT
			local targetEnemy = getFaceTarget()
			if targetEnemy then
				humanoid.AutoRotate = false
				pcall(function()
					local g = Instance.new("BodyGyro")
					g.Name = "SmartDodge_FacingGyro"
					g.MaxTorque = Vector3.new(0, 400000, 0)
					g.P = 25000
					g.D = 500
					local pPos = rootPart.Position
					g.CFrame = CFrame.lookAt(pPos, Vector3.new(targetEnemy.X, pPos.Y, targetEnemy.Z))
					g.Parent = rootPart
					activeGyro = g
				end)
			else
				humanoid.AutoRotate = true
			end

			local startTime = os.clock()
			local MAX_SAFETY_TIMEOUT = 10.0 -- Giới hạn an toàn chống kẹt vĩnh viễn nếu bị tường cản

			--======================================================--
			-- WALK LOOP: Humanoid:MoveTo di chuyển tự nhiên đến khi an toàn hoặc tới Safe Spot
			--======================================================--

			while autoDodgeEnabled and (os.clock() - startTime < MAX_SAFETY_TIMEOUT) do
				if not rootPart.Parent
					or not humanoid.Parent
					or humanoid.Health <= 0
				then
					break
				end

				-- Nếu đã an toàn (không còn hiểm họa đè) -> dừng bước
				if not getInDanger() then
					break
				end

				targetPos = currentTargetPos or safePos
				if not targetPos then
					break
				end

				currentPos = rootPart.Position

				local distRemaining = flatDistance(
					currentPos,
					targetPos
				)

				if distRemaining <= maxSnapDistance then
					snapFace(
						rootPart,
						humanoid,
						targetPos,
						startHeight
					)

					if getLogInDanger() then
						print(
							("[SmartDodge][Dodge] 🎯 Reached snap range (%.2f studs) -> SNAP")
								:format(distRemaining)
						)
					end

					break
				end

				-- Cập nhật góc quay của Gyro nếu Boss dịch chuyển
				if activeGyro and activeGyro.Parent then
					local enemyPos = getFaceTarget()
					if enemyPos then
						activeGyro.CFrame = CFrame.lookAt(currentPos, Vector3.new(enemyPos.X, currentPos.Y, enemyPos.Z))
					end
				end

				local moveTarget = makeMoveTarget(
					rootPart,
					targetPos
				)

				-- Phát MoveTo để Humanoid tự động bước đi
				humanoid:MoveTo(moveTarget)

				task.wait(0.05)
			end

			cleanGyro()

			--======================================================--
			-- (3) Final decision after WALK
			--======================================================--

			if not rootPart.Parent
				or not humanoid.Parent
				or humanoid.Health <= 0
			then
				return
			end

			targetPos = currentTargetPos or safePos
			if not targetPos then return end

			local remainingDist = flatDistance(
				rootPart.Position,
				targetPos
			)

			if remainingDist <= maxSnapDistance then
				snapFace(
					rootPart,
					humanoid,
					targetPos,
					startHeight
				)

				if getLogInDanger() then
					print(
						("[SmartDodge][Dodge] ⚡ Final snap from %.2f studs.")
							:format(remainingDist)
					)
				end
			end
		end)

		if not ok then
			warn("[SmartDodge][Dodge] Error during dodge execution: " .. tostring(err))
		end

		finish()
	end)
end

--==============================================================--
-- Cancel
--==============================================================--

function dodge.Cancel()
	if dodgeThread then
		task.cancel(dodgeThread)
		dodgeThread = nil
	end

	local char, rootPart, humanoid = getCharacterParts()

	if humanoid then
		pcall(function()
			humanoid:Move(Vector3.zero, false)
		end)
		local hasEnemy = targetFacing and targetFacing.IsEnabled and targetFacing.IsEnabled() and targetFacing.IsTargetActive and targetFacing.IsTargetActive()
		if hasEnemy then
			humanoid.AutoRotate = false
		else
			humanoid.AutoRotate = true
		end
	end

	if rootPart and rootPart.Parent and dodgeMode ~= "HumanoidMove" then
		rootPart.AssemblyLinearVelocity = Vector3.zero
		rootPart.AssemblyAngularVelocity = Vector3.zero
	end

	isDodging = false
	targetFacing.SetDodging(false)
	currentTargetPos = nil
end

--==============================================================--
-- Status
--==============================================================--

function dodge.FireStatus(status)
	fireDodgeStatus(status)
end

--==============================================================--
-- Auto Dodge
--==============================================================--

function dodge.SetAutoDodge(state)
	autoDodgeEnabled = state and true or false
end

function dodge.IsAutoDodgeEnabled()
	return autoDodgeEnabled
end

--==============================================================--
-- Dodge Movement Mode ("MoveTo" | "Blink")
--==============================================================--

function dodge.SetDodgeMode(mode)
	if mode == "MoveTo" or mode == "Blink" or mode == "HumanoidMove" then
		dodgeMode = mode
	end
end

function dodge.GetDodgeMode()
	return dodgeMode
end

--==============================================================--
-- Max Snap Distance
--==============================================================--

function dodge.SetMaxSnapDistance(value)
	if type(value) == "number"
		and value > 0
	then
		maxSnapDistance = value
	end
end

function dodge.GetMaxSnapDistance()
	return maxSnapDistance
end

--==============================================================--
-- Backward compatibility
--==============================================================--

dodge.SetMaxTeleportStep = dodge.SetMaxSnapDistance
dodge.GetMaxTeleportStep = dodge.GetMaxSnapDistance

--==============================================================--
-- Blink Step Distance
--==============================================================--

function dodge.SetBlinkStep(value)
	if type(value) == "number" and value > 0 then
		blinkStep = value
	end
end

function dodge.GetBlinkStep()
	return blinkStep
end

--==============================================================--
-- Maintain Snap Height
--==============================================================--

function dodge.SetMaintainSnapHeight(state)
	maintainSnapHeight = state and true or false
end

function dodge.IsMaintainSnapHeightEnabled()
	return maintainSnapHeight
end

--==============================================================--
-- State
--==============================================================--

function dodge.IsDodging()
	return isDodging
end

--==============================================================--
-- Face Target Provider
--==============================================================--

function dodge.SetFaceTargetProvider(func)
	faceTargetProvider =
		type(func) == "function"
		and func
		or nil
end

--==============================================================--
-- Status Getter
--==============================================================--

function dodge.GetStatus()
	if isDodging then
		return "Dodging"
	elseif shared.IsInvulnerable and shared.IsInvulnerable() and getInDanger() then
		return "🛡️ Paused (Invulnerable)"
	elseif getInDanger() then
		return "Safe (Standing in Spot)"
	else
		return "Idle"
	end
end

--==============================================================--
-- Status Callback
--==============================================================--

function dodge.OnDodgeStatusChanged(callback)
	if type(callback) ~= "function" then
		return
	end

	table.insert(
		dodgeStatusCallbacks,
		callback
	)
end

--==============================================================--
-- Dodge Cancellation
--==============================================================--

function dodge.Cancel()
	if dodgeThread then
		task.cancel(dodgeThread)
		dodgeThread = nil
	end
	if activeMoveConn then
		pcall(function() activeMoveConn:Disconnect() end)
		activeMoveConn = nil
	end
	local _, rootPart, humanoid = getCharacterParts()
	if humanoid and humanoid.Parent and dodgeMode == "HumanoidMove" then
		pcall(function()
			humanoid:Move(Vector3.zero, false)
		end)
	end
	if shared.CancelPanicSpeed then
		shared.CancelPanicSpeed()
	end
	isDodging = false
	targetFacing.SetDodging(false)
	currentTargetPos = nil
	fireDodgeStatus("Idle")
end

--==============================================================--
-- Panic Sprint Accessors
--==============================================================--

function dodge.SetPanicSprintEnabled(state)
	panicSprintEnabled = state and true or false
end

function dodge.IsPanicSprintEnabled()
	return panicSprintEnabled
end

function dodge.SetPanicSpeed(value)
	if type(value) == "number" and value > 0 then
		panicSpeed = value
	end
end

function dodge.GetPanicSpeed()
	return panicSpeed
end

function dodge.SetPanicDuration(value)
	if type(value) == "number" and value > 0 then
		panicDuration = value
	end
end

function dodge.GetPanicDuration()
	return panicDuration
end

function dodge.SetPanicCooldown(value)
	if type(value) == "number" and value > 0 then
		panicCooldown = value
	end
end

function dodge.GetPanicCooldown()
	return panicCooldown
end

function dodge.IsPanicActive()
	return shared.IsPanicSpeedActive and shared.IsPanicSpeedActive() or false
end

--==============================================================--
-- Return
--==============================================================--

return dodge end function __DIST.u()-- Smart Dodge – Module 6: Engine Orchestrator (DungeonQuest).
-- Chuyên trách: kết nối Detection + SafeSpot + Dodge. Vòng lặp đánh giá nguy hiểm theo thời
-- gian thực (safe spot loop), quản lý vòng đời engine (Start/Stop/Toggle), trạng thái danger
-- hiện tại, fire callbacks SafeSpotChanged, coordinator.Register + dodge runtime bơm cho Module 5.

--// Imports

local services = __DIST.load('e')
local shared = __DIST.load('f')
local coordinator = __DIST.load('j')
local detection = __DIST.load('n')
local geometry = __DIST.load('m')
local safeSpot = __DIST.load('s')
local dodge = __DIST.load('t')

--// Bơm data hiểm họa cho module Geometry (đứt vòng phụ thuộc — geometry không require detection).
geometry.BindDetection({
	GetActiveHazardsMap = detection.GetActiveHazardsMap,
	GetLockedProjectiles = detection.GetLockedProjectiles,
	GetTrajectoryConfigForPart = detection.GetTrajectoryConfigForPart,
	LockTrajectoryForPart = detection.LockTrajectoryForPart,
	IsIgnoredPart = detection.IsIgnoredPart,
	GetFadeThreshold = detection.GetFadeThreshold,
})

--// References
local player = services.player

--// State
local isEngineActive = false
local isPlayerInDanger = false
local currentSafeSpot = nil
local currentDangerHazardName = nil
local currentEscapeDist = 0
local safeSpotCallbacks = {}
local safeSpotLoopThread = nil
local logInDanger = true
local ignoreDodgeWhenInvulnerable = true

--// Bơm runtime cho module Dodge: đọc trạng thái danger & log trực tiếp từ engine (tránh vòng require)
dodge.SetRuntime({
	getInDanger = function()
		return isPlayerInDanger
	end,
	getLogInDanger = function()
		return logInDanger
	end,
	getActiveBossOrb = detection.GetActiveBossOrb,
})

local engine = {}

local lastDeadState = false
local lastInvulnState = false
local lastUIUpdateTime = 0

local function fireSafeSpotChanged(inDanger, safePos, hazardName, escapeDist, isInvulnerable, invulnReason, isDead)
	for _, cb in ipairs(safeSpotCallbacks) do
		pcall(cb, inDanger, safePos, hazardName, escapeDist, isInvulnerable, invulnReason, isDead)
	end
end

--// Vòng lặp đánh giá nguy hiểm và cập nhật Safe Spot theo thời gian thực
local function startSafeSpotLoop()
	if safeSpotLoopThread then return end
	safeSpotLoopThread = task.spawn(function()
		local lastLogTime = 0
		while isEngineActive do
			-- Tầng 1: Nếu không ở Boss Room và toàn bộ quái trong phòng đã chết -> Dọn sạch toàn bộ hazard tồn đọng
			if not shared.IsBossActive() and shared.GetEnemyCount() == 0 and detection.GetHazardCount() > 0 then
				detection.ClearAllHazards("Room Cleared")
			end

			-- 0. Luôn cập nhật quỹ đạo đạn bay & moving beam toán học TRƯỚC KHI tính Safe Spot (độc lập 100% với Visual ESP)
			detection.UpdateTrajectories()

			local isDead = shared.IsDead and shared.IsDead() or false
			local inDanger, safePos, hazardName, escapeDist
			if isDead then
				inDanger = false
				safePos = nil
				hazardName = "Dead"
				escapeDist = 0
			else
				inDanger, safePos, hazardName, escapeDist = safeSpot.CalculateSafeSpot()
			end

			local isInvulnerable, invulnReason = shared.IsInvulnerable()

			isPlayerInDanger = inDanger
			currentSafeSpot = safePos
			currentDangerHazardName = hazardName
			currentEscapeDist = escapeDist or 0

			safeSpot.UpdateMarker(safePos, inDanger, escapeDist)

			local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
			local pPos = rootPart and rootPart.Position
			safeSpot.UpdateHitbox(pPos)
			safeSpot.UpdatePlayerRadar(pPos, inDanger)
			detection.UpdateTrajectoryVisuals()
			detection.UpdateHazardTimers()

			-- Kích hoạt Thực thi Né Chiêu (Bài toán 3)
			if inDanger and safePos and dodge.IsAutoDodgeEnabled() then
				if isInvulnerable and ignoreDodgeWhenInvulnerable then
					-- Người chơi đang trong trạng thái bất tử (ForceField hoặc mới hồi sinh)
					-- -> Hủy hoặc không né chiêu để tận dụng tối đa thời gian bất tử tấn công quái / boss!
					if dodge.IsDodging() then
						dodge.Cancel()
					end
				else
					dodge.Perform(safePos, escapeDist, hazardName)
				end
			end

			local now = os.clock()
			local invulnTimeTick = isInvulnerable and (now - lastUIUpdateTime >= 0.25)
			local stateChanged = (inDanger ~= isPlayerInDanger)
				or (safePos ~= currentSafeSpot)
				or (isDead ~= lastDeadState)
				or (isInvulnerable ~= lastInvulnState)
				or invulnTimeTick

			if stateChanged then
				lastUIUpdateTime = now
				lastDeadState = isDead
				lastInvulnState = isInvulnerable

				fireSafeSpotChanged(inDanger, safePos, hazardName, escapeDist, isInvulnerable, invulnReason, isDead)

				if logInDanger and inDanger and safePos and (os.clock() - lastLogTime > 0.5) then
					lastLogTime = os.clock()
					if isInvulnerable and ignoreDodgeWhenInvulnerable then
						print(("[SmartDodge][Invulnerable] 🛡️ IN DANGER (%s) but INVULNERABLE (%s) -> Dodge Paused")
							:format(hazardName, invulnReason or "Protection"))
					else
						print(("[SmartDodge][InDanger] ⚠️ IN DANGER: %s | Escape Dist: %.1f studs -> SafePos: (%.1f, %.1f, %.1f)")
							:format(hazardName, escapeDist, safePos.X, safePos.Y, safePos.Z))
					end
				end
			end

			task.wait(0.05)
		end
	end)
end

local function stopSafeSpotLoop()
	if safeSpotLoopThread then
		task.cancel(safeSpotLoopThread)
		safeSpotLoopThread = nil
	end
	dodge.Cancel()
	safeSpot.HideVisuals()
	detection.ClearTrajectoryVisuals()
	safeSpot.ResetLock()
	isPlayerInDanger = false
	currentSafeSpot = nil
	currentDangerHazardName = nil
	fireSafeSpotChanged(false, nil, nil, 0)
	dodge.FireStatus("Idle")
end

local function startTracking()
	detection.StartScan()
	startSafeSpotLoop()
end

local function stopTracking()
	detection.StopScan()
	stopSafeSpotLoop()
end

--// Bật/thay đổi engine KHÔNG liên quan tới độc quyền coordinator: Auto Farm có thể điều khiển
--// Smart Dodge làm chủ di chuyển (Mode 2) mà không đụng chạy tới các hệ thống khác.
function engine.StartEngine()
	if isEngineActive then return end
	isEngineActive = true
	detection.SetEnabled(true)
	startTracking()
end

function engine.StopEngine()
	if not isEngineActive then return end
	isEngineActive = false
	stopSafeSpotLoop()

	-- Chỉ dừng bộ quét detection nếu tính năng Record cũng không đang chạy
	local skillTimingManager = detection.skillTimingManager
	if not (skillTimingManager and skillTimingManager.IsRecording()) then
		detection.SetEnabled(false)
		detection.StopScan()
	end
end

--// Toggle độc lập (UI): bật engine + tự tuyên bố độc quyền (tắt các hệ thống điều khiển nhân vật khác).
function engine.Toggle(state)
	if state then
		engine.StartEngine()
		coordinator.EnableExclusive("SmartDodge")
	else
		engine.StopEngine()
	end
end

function engine.IsEnabled()
	return isEngineActive
end

--// Dọn dẹp toàn diện khi shutdown (lifecycle): dừng tracking + hủy visual hoàn toàn
function engine.Shutdown()
	isEngineActive = false
	stopTracking()
	safeSpot.DestroyVisuals()
	detection.ClearTrajectoryVisuals()
	dodge.Cancel()
end

--// Accessors

function engine.SetLogInDanger(state)
	logInDanger = state and true or false
end

function engine.IsLogInDangerEnabled()
	return logInDanger
end

function engine.SetIgnoreDodgeWhenInvulnerable(state)
	ignoreDodgeWhenInvulnerable = state and true or false
end

function engine.IsIgnoreDodgeWhenInvulnerableEnabled()
	return ignoreDodgeWhenInvulnerable
end

function engine.IsDead()
	return shared.IsDead and shared.IsDead() or false
end

function engine.IsInDanger()
	return isPlayerInDanger
end

function engine.GetCurrentSafeSpot()
	return currentSafeSpot, isPlayerInDanger, currentDangerHazardName, currentEscapeDist
end

function engine.OnSafeSpotChanged(callback)
	if type(callback) ~= "function" then return end
	table.insert(safeSpotCallbacks, callback)
end

return engine end function __DIST.v()--==============================================================--
-- Smart Dodge – Speed Debug HUD
-- Hiển thị trực quan tốc độ hiện tại (WalkSpeed) của Player
-- trực tiếp trên màn hình game (Screen HUD) kèm đổi màu theo trạng thái:
--   - Màu TRẮNG: Tốc độ thường (Normal)
--   - Màu ĐỎ:    Đang ép WalkSpeed = Panic (Panic Sprint)
--   - Màu XANH LÁ: Đang hưởng tốc độ từ Skill chính thức của game
--==============================================================--


local services = __DIST.load('e')
local shared = __DIST.load('f')
local lifecycle = __DIST.load('b')

local RunService = services.RunService
local UserInputService = services.UserInputService
local player = services.player

local speedDebugHud = {}

local enabled = false
local screenGui = nil
local mainFrame = nil
local speedLabel = nil
local uiStroke = nil
local updateConn = nil

local COLOR_WHITE = Color3.fromRGB(255, 255, 255)
local COLOR_RED = Color3.fromRGB(255, 65, 65)
local COLOR_GREEN = Color3.fromRGB(50, 255, 120)

local STROKE_NORMAL = Color3.fromRGB(60, 60, 70)
local STROKE_RED = Color3.fromRGB(220, 50, 50)
local STROKE_GREEN = Color3.fromRGB(40, 200, 90)

-- Lấy parent an toàn nhất cho Gui
local function getGuiParent()
	local success, result = pcall(function()
		if typeof(gethui) == "function" then
			local h = gethui()
			if h then return h end
		end
		local coreGui = game:GetService("CoreGui")
		if coreGui then return coreGui end
		return nil
	end)
	if success and result then return result end

	local p = player or services.player
	return p and p:FindFirstChild("PlayerGui")
end

-- Tạo giao diện HUD kéo thả được
local function createHud()
	if screenGui and screenGui.Parent then return end

	local parent = getGuiParent()
	if not parent then return end

	-- Dọn dẹp bản cũ nếu có
	local old = parent:FindFirstChild("DQ_SpeedDebugHud")
	if old then
		pcall(function() old:Destroy() end)
	end

	screenGui = Instance.new("ScreenGui")
	screenGui.Name = "DQ_SpeedDebugHud"
	screenGui.ResetOnSpawn = false
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	-- Frame chính (Kéo thả được)
	mainFrame = Instance.new("Frame")
	mainFrame.Name = "SpeedBadge"
	mainFrame.Size = UDim2.new(0, 168, 0, 34)
	mainFrame.Position = UDim2.new(0.5, -84, 0, 50)
	mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
	mainFrame.BackgroundTransparency = 0.25
	mainFrame.BorderSizePixel = 0
	mainFrame.Active = true
	mainFrame.Parent = screenGui

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = mainFrame

	uiStroke = Instance.new("UIStroke")
	uiStroke.Thickness = 1.4
	uiStroke.Color = STROKE_NORMAL
	uiStroke.Transparency = 0.2
	uiStroke.Parent = mainFrame

	speedLabel = Instance.new("TextLabel")
	speedLabel.Name = "SpeedText"
	speedLabel.Size = UDim2.new(1, -10, 1, 0)
	speedLabel.Position = UDim2.new(0, 5, 0, 0)
	speedLabel.BackgroundTransparency = 1
	speedLabel.Font = Enum.Font.GothamBold
	speedLabel.TextSize = 13
	speedLabel.TextColor3 = COLOR_WHITE
	speedLabel.Text = "SPEED: 16.0"
	speedLabel.TextXAlignment = Enum.TextXAlignment.Center
	speedLabel.TextYAlignment = Enum.TextYAlignment.Center
	speedLabel.Parent = mainFrame

	-- Cơ chế kéo thả linh hoạt (Draggable)
	local dragging = false
	local dragStart = nil
	local startPos = nil

	mainFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = mainFrame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	mainFrame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragging and dragStart and startPos then
				local delta = input.Position - dragStart
				mainFrame.Position = UDim2.new(
					startPos.X.Scale,
					startPos.X.Offset + delta.X,
					startPos.Y.Scale,
					startPos.Y.Offset + delta.Y
				)
			end
		end
	end)

	screenGui.Parent = parent
end

local function destroyHud()
	if updateConn then
		updateConn:Disconnect()
		updateConn = nil
	end
	if screenGui and screenGui.Parent then
		pcall(function() screenGui:Destroy() end)
		screenGui = nil
		mainFrame = nil
		speedLabel = nil
		uiStroke = nil
	end
end

-- Vòng lặp cập nhật thông số và màu sắc theo thời gian thực
local function startUpdating()
	if updateConn then return end

	local lastUpdate = 0
	updateConn = RunService.RenderStepped:Connect(function()
		local now = os.clock()
		if (now - lastUpdate) < 0.04 then return end
		lastUpdate = now

		if not screenGui or not screenGui.Parent or not speedLabel or not speedLabel.Parent then
			createHud()
			return
		end

		local char = player and player.Character
		local humanoid = char and char:FindFirstChild("Humanoid")
		local rootPart = char and char:FindFirstChild("HumanoidRootPart")

		if not humanoid or humanoid.Health <= 0 then
			speedLabel.Text = "SPEED: 💀 DEAD"
			speedLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
			if uiStroke then uiStroke.Color = STROKE_NORMAL end
			return
		end

		local curWalkSpeed = humanoid.WalkSpeed or 0
		local vel = rootPart and rootPart.AssemblyLinearVelocity
		local horizVel = vel and Vector3.new(vel.X, 0, vel.Z).Magnitude or 0

		local isPanic = shared.IsPanicSpeedActive and shared.IsPanicSpeedActive()
		local isSkillBuff = (not isPanic) and (curWalkSpeed >= 23.5 or horizVel >= 23.0)

		if isPanic then
			-- 1. Đang ép WalkSpeed = Panic (MÀU ĐỎ)
			speedLabel.TextColor3 = COLOR_RED
			speedLabel.Text = ("SPD: %.1f [PANIC 💨]"):format(curWalkSpeed)
			if uiStroke then uiStroke.Color = STROKE_RED end
		elseif isSkillBuff then
			-- 2. Đang là speed từ chiêu thức của game (MÀU XANH LÁ)
			speedLabel.TextColor3 = COLOR_GREEN
			speedLabel.Text = ("SPD: %.1f [SKILL ⚡]"):format(curWalkSpeed)
			if uiStroke then uiStroke.Color = STROKE_GREEN end
		else
			-- 3. Speed thường (MÀU TRẮNG)
			speedLabel.TextColor3 = COLOR_WHITE
			speedLabel.Text = ("SPD: %.1f"):format(curWalkSpeed)
			if uiStroke then uiStroke.Color = STROKE_NORMAL end
		end
	end)
end

function speedDebugHud.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		createHud()
		startUpdating()
	else
		destroyHud()
	end
end

function speedDebugHud.IsEnabled()
	return enabled
end

-- Tự động dọn dẹp khi Hub tắt
lifecycle.Register(function()
	speedDebugHud.SetEnabled(false)
end)

-- Khởi động mặc định
speedDebugHud.SetEnabled(true)

return speedDebugHud
end function __DIST.w()-- Smart Dodge (DungeonQuest) – Facade: tổng hợp 6 module nhỏ thành API pública đầy đủ.
-- Các module thành phần: detection (quét hiểm họa) / geometry (hit-test) / safeSpot
-- (tính điểm an toàn + visual) / dodge (Walk+Snap) / engine (orchestrator).
-- Đường dẫn require "@routes/DungeonQuest/core/smartDodge" vẫn giữ nguyên (init.luau).

--// Imports

local lifecycle = __DIST.load('b')
local coordinator = __DIST.load('j')
local detection = __DIST.load('n')
local geometry = __DIST.load('m')
local safeSpot = __DIST.load('s')
local dodge = __DIST.load('t')
local engine = __DIST.load('u')
local targetFacing = __DIST.load('r')
local speedDebugHud = __DIST.load('v')
local skillTimingManager = __DIST.load('l')
local shared = __DIST.load('f')

--// Table
local smartDodge = {}

--// Skill Timing & Training
smartDodge.skillTiming = skillTimingManager
smartDodge.SetSkillTimingMode = skillTimingManager.SetMode
smartDodge.GetSkillTimingMode = skillTimingManager.GetMode
smartDodge.SetSelectedSkillMap = skillTimingManager.SetSelectedMap
smartDodge.GetSelectedSkillMap = skillTimingManager.GetSelectedMap
smartDodge.LoadSkillMapData = skillTimingManager.LoadMapData
smartDodge.SetSkillRecordingEnabled = skillTimingManager.SetRecordingEnabled
smartDodge.IsSkillRecordingEnabled = skillTimingManager.IsRecording
smartDodge.SaveRecordedSkillData = skillTimingManager.SaveRecordedData
smartDodge.ClearRecordedSkillSession = skillTimingManager.ClearRecordedSession
smartDodge.GetLoadedSkillCount = skillTimingManager.GetLoadedSkillCount
smartDodge.GetRecordedSkillCount = skillTimingManager.GetRecordedSkillCount
smartDodge.GetTotalSamplesCount = skillTimingManager.GetTotalSamplesCount
smartDodge.OnSkillTimingChanged = skillTimingManager.OnChanged

--// Threat Detection (Module 1)
smartDodge.StartDetection = detection.StartScan
smartDodge.StopDetection = detection.StopScan
smartDodge.IsDetectionEnabled = detection.IsEnabled
smartDodge.SetDetectionEnabled = detection.SetEnabled
smartDodge.AddCustomHazard = detection.AddCustomHazard
smartDodge.AddTrajectoryProjectile = detection.AddTrajectoryProjectile
smartDodge.SetTrajectoryLookahead = detection.SetTrajectoryLookahead
smartDodge.GetTrajectoryLookahead = detection.GetTrajectoryLookahead
smartDodge.SetTrajectoryWidthPadding = detection.SetTrajectoryWidthPadding
smartDodge.GetTrajectoryWidthPadding = detection.GetTrajectoryWidthPadding
smartDodge.RegisterPlayerSkill = detection.RegisterPlayerSkill
smartDodge.GetActiveBossOrb = detection.GetActiveBossOrb

smartDodge.SetLogHazards = detection.SetLogHazards
smartDodge.IsLogHazardsEnabled = detection.IsLogHazardsEnabled
-- Backward compatibility aliases
smartDodge.SetLogThreats = smartDodge.SetLogHazards
smartDodge.IsLogThreatsEnabled = smartDodge.IsLogHazardsEnabled

smartDodge.SetVisualEsp = detection.SetVisualEsp
smartDodge.IsVisualEspEnabled = detection.IsVisualEspEnabled
smartDodge.SetShowSkillTimers = detection.SetShowSkillTimers
smartDodge.IsShowSkillTimersEnabled = detection.IsShowSkillTimersEnabled
smartDodge.GetHazardTimeRemaining = detection.GetHazardTimeRemaining

smartDodge.GetHazardCount = detection.GetHazardCount
smartDodge.GetActiveHazards = detection.GetActiveHazards
smartDodge.GetLastHazardInfo = detection.GetLastHazardInfo
smartDodge.OnHazardChanged = detection.OnHazardChanged

--// Safe Spot (Module 3+4)
smartDodge.CalculateSafeSpot = safeSpot.CalculateSafeSpot
smartDodge.SetShowSafeMarker = safeSpot.SetShowSafeMarker
smartDodge.IsShowSafeMarkerEnabled = safeSpot.IsShowSafeMarkerEnabled
smartDodge.SetShowPlayerRadar = safeSpot.SetShowPlayerRadar
smartDodge.IsShowPlayerRadarEnabled = safeSpot.IsShowPlayerRadarEnabled
smartDodge.UpdatePlayerRadar = safeSpot.UpdatePlayerRadar
smartDodge.ClearPlayerRadar = safeSpot.ClearPlayerRadar
smartDodge.SetShowHitboxVisual = safeSpot.SetShowHitboxVisual
smartDodge.IsShowHitboxVisualEnabled = safeSpot.IsShowHitboxVisualEnabled
smartDodge.SetHitboxPadding = safeSpot.SetHitboxPadding
smartDodge.GetHitboxPadding = geometry.GetHitboxPadding
smartDodge.GetBoss1ArenaCenter = safeSpot.GetBoss1ArenaCenter
smartDodge.GetBoss1ArenaRadius = safeSpot.GetBoss1ArenaRadius

--// Dodge (Module 5)
smartDodge.SetAutoDodge = dodge.SetAutoDodge
smartDodge.IsAutoDodgeEnabled = dodge.IsAutoDodgeEnabled
smartDodge.SetDodgeMode = dodge.SetDodgeMode
smartDodge.GetDodgeMode = dodge.GetDodgeMode
smartDodge.SetBlinkStep = dodge.SetBlinkStep
smartDodge.GetBlinkStep = dodge.GetBlinkStep
smartDodge.SetMaxSnapDistance = dodge.SetMaxSnapDistance
smartDodge.GetMaxSnapDistance = dodge.GetMaxSnapDistance
smartDodge.SetMaxTeleportStep = dodge.SetMaxTeleportStep
smartDodge.GetMaxTeleportStep = dodge.GetMaxTeleportStep
smartDodge.SetMaintainSnapHeight = dodge.SetMaintainSnapHeight
smartDodge.IsMaintainSnapHeightEnabled = dodge.IsMaintainSnapHeightEnabled
smartDodge.IsDodging = dodge.IsDodging
smartDodge.SetFaceTargetProvider = dodge.SetFaceTargetProvider
smartDodge.GetDodgeStatus = dodge.GetStatus
smartDodge.OnDodgeStatusChanged = dodge.OnDodgeStatusChanged
smartDodge.Cancel = dodge.Cancel

--// Panic Sprint (Kích tốc né nguy cấp)
smartDodge.SetPanicSprintEnabled = dodge.SetPanicSprintEnabled
smartDodge.IsPanicSprintEnabled = dodge.IsPanicSprintEnabled
smartDodge.SetPanicSpeed = dodge.SetPanicSpeed
smartDodge.GetPanicSpeed = dodge.GetPanicSpeed
smartDodge.SetPanicDuration = dodge.SetPanicDuration
smartDodge.GetPanicDuration = dodge.GetPanicDuration
smartDodge.SetPanicCooldown = dodge.SetPanicCooldown
smartDodge.GetPanicCooldown = dodge.GetPanicCooldown
smartDodge.IsPanicActive = dodge.IsPanicActive

--// Speed Debug HUD (Màn hình chơi)
smartDodge.SetSpeedDebugHudEnabled = speedDebugHud.SetEnabled
smartDodge.IsSpeedDebugHudEnabled = speedDebugHud.IsEnabled

--// Target Facing
smartDodge.SetAutoFaceTarget = targetFacing.SetEnabled
smartDodge.IsAutoFaceTargetEnabled = targetFacing.IsEnabled
smartDodge.GetTargetPosition = targetFacing.GetTargetPosition
-- Backward compatibility aliases
smartDodge.SetAutoFaceBoss = smartDodge.SetAutoFaceTarget
smartDodge.IsAutoFaceBossEnabled = smartDodge.IsAutoFaceTargetEnabled
smartDodge.GetBossPosition = smartDodge.GetTargetPosition
smartDodge.IsTargetActive = targetFacing.IsTargetActive
smartDodge.IsBossActive = targetFacing.IsTargetActive

--// Engine (Module 6)
smartDodge.StartEngine = engine.StartEngine
smartDodge.StopEngine = engine.StopEngine
smartDodge.Toggle = engine.Toggle
smartDodge.IsEnabled = engine.IsEnabled
smartDodge.SetLogInDanger = engine.SetLogInDanger
smartDodge.IsLogInDangerEnabled = engine.IsLogInDangerEnabled
smartDodge.IsInDanger = engine.IsInDanger
smartDodge.GetCurrentSafeSpot = engine.GetCurrentSafeSpot
smartDodge.OnSafeSpotChanged = engine.OnSafeSpotChanged

--// Invulnerability & Respawn Protection
smartDodge.SetIgnoreDodgeWhenInvulnerable = engine.SetIgnoreDodgeWhenInvulnerable
smartDodge.IsIgnoreDodgeWhenInvulnerableEnabled = engine.IsIgnoreDodgeWhenInvulnerableEnabled
smartDodge.SetRespawnProtectionDuration = shared.SetRespawnProtectionDuration
smartDodge.GetRespawnProtectionDuration = shared.GetRespawnProtectionDuration
smartDodge.GetRespawnProtectionRemaining = shared.GetRespawnProtectionRemaining
smartDodge.IsInvulnerable = shared.IsInvulnerable
smartDodge.IsDead = shared.IsDead

--// Đăng ký với coordinator: khi hệ thống khác (Auto Farm) chiếm độc quyền thì engine Smart Dodge
--// bị tắt qua StopEngine; IsEnabled dùng để coordinator biết engine đang chạy.
coordinator.Register("SmartDodge", smartDodge.StopEngine, smartDodge.IsEnabled)

--// Dọn dẹp toàn diện khi shutdown
lifecycle.Register(function()
	engine.Shutdown()
end)

return smartDodge end function __DIST.x()-- Module Smart Dodge trong tab Combat (DungeonQuest): quản lý tính năng né chiêu thông minh.
-- Giai đoạn 1, 2 & 3: Threat Detection, Safe Spot Calculation & Dodge Execution.
-- Cơ chế né duy nhất: Walk + Snap (MoveTo đi bộ, snap tới đích khi còn cự ly ≤ Max Snap).

--// Imports

local ui = __DIST.load('g')
local autoSave = __DIST.load('d')
local smartDodge = __DIST.load('w')

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Threat & Dodge Controls" })

	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Real-time Dodge Monitor" })

	--// Right Section Labels
	local statusLabel = rightSection:Label({ Text = "Detector: <font color='rgb(255,80,80)'>Disabled</font>" })
	local activeCountLabel = rightSection:Label({ Text = "Active Hazards: <font color='rgb(160,160,160)'>0</font>" })
	local playerStateLabel = rightSection:Label({ Text = "Player State: <font color='rgb(0,255,0)'>SAFE</font>" })
	local safeSpotLabel = rightSection:Label({ Text = "Safe Target: <font color='rgb(160,160,160)'>None (No Dodge Needed)</font>" })
	local dodgeActionLabel = rightSection:Label({ Text = "Dodge Action: <font color='rgb(160,160,160)'>Idle</font>" })
	local lastHazardLabel = rightSection:Label({ Text = "Last Detected: <font color='rgb(160,160,160)'>None</font>" })

	local function updateMonitor(count, lastInfo)
		count = count or smartDodge.GetHazardCount()
		lastInfo = lastInfo or smartDodge.GetLastHazardInfo()

		local isEnabled = smartDodge.IsEnabled()
		local statusColor = isEnabled and "0, 255, 0" or "255, 80, 80"
		local statusText = isEnabled and "Active (Scanning & Calculating)" or "Disabled"

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

	local function updateSafeSpotUI(inDanger, safePos, hazardName, escapeDist, isInvulnerable, invulnReason, isDead)
		if isDead == nil then
			isDead = smartDodge.IsDead and smartDodge.IsDead() or false
		end
		if isInvulnerable == nil then
			isInvulnerable, invulnReason = smartDodge.IsInvulnerable()
		end

		if isDead then
			pcall(function()
				playerStateLabel:UpdateName("Player State: <font color='rgb(160,160,160)'>💀 DEAD</font>")
				safeSpotLabel:UpdateName("Safe Target: <font color='rgb(160,160,160)'>None (Player Dead)</font>")
			end)
		elseif isInvulnerable and smartDodge.IsIgnoreDodgeWhenInvulnerableEnabled() then
			pcall(function()
				playerStateLabel:UpdateName(("Player State: <font color='rgb(0,220,255)'>🛡️ INVULNERABLE (%s)</font>"):format(invulnReason or "Protection"))
				if inDanger and safePos then
					safeSpotLabel:UpdateName(("Safe Target: <font color='rgb(0,220,255)'>🛡️ Dodge Paused (%.1fm to Safe)</font>"):format(escapeDist or 0))
				else
					safeSpotLabel:UpdateName("Safe Target: <font color='rgb(160,160,160)'>None (Invulnerable)</font>")
				end
			end)
		elseif inDanger then
			pcall(function()
				playerStateLabel:UpdateName(("Player State: <font color='rgb(255,60,60)'>⚠️ IN DANGER (%s)</font>"):format(hazardName or "Hazard"))
				if safePos then
					safeSpotLabel:UpdateName(("Safe Target: <font color='rgb(0,255,120)'>🟢 (%.1f, %.1f, %.1f) - %.1fm</font>"):format(
						safePos.X, safePos.Y, safePos.Z, escapeDist or 0
					))
				else
					safeSpotLabel:UpdateName("Safe Target: <font color='rgb(255,160,0)'>⚠️ Calculating Safe Spot...</font>")
				end
			end)
		else
			pcall(function()
				playerStateLabel:UpdateName("Player State: <font color='rgb(0,255,0)'>🟢 SAFE</font>")
				safeSpotLabel:UpdateName("Safe Target: <font color='rgb(160,160,160)'>None (No Dodge Needed)</font>")
			end)
		end
	end

	local function updateDodgeStatusUI(status)
		local isDead = smartDodge.IsDead and smartDodge.IsDead() or false
		if isDead then
			pcall(function()
				dodgeActionLabel:UpdateName("Dodge Action: <font color='rgb(160, 160, 160)'>Dead</font>")
			end)
			return
		end

		status = status or smartDodge.GetDodgeStatus()
		local isInvuln = smartDodge.IsInvulnerable()
		if isInvuln and smartDodge.IsIgnoreDodgeWhenInvulnerableEnabled() and smartDodge.IsInDanger() then
			status = "🛡️ Paused (Invulnerable)"
		end

		local isPanic = smartDodge.IsPanicActive and smartDodge.IsPanicActive()
		if isPanic and status == "Dodging" then
			status = "Dodging (💨 PANIC SPRINT)"
		end

		local color = "160, 160, 160"
		if status == "Dodging" then
			color = "255, 200, 50"
		elseif status == "Returning" then
			color = "255, 140, 0"
		elseif status:find("Safe") then
			color = "0, 255, 120"
		elseif status:find("Invulnerable") then
			color = "0, 220, 255"
		end

		pcall(function()
			dodgeActionLabel:UpdateName("Dodge Action: <font color='rgb(" .. color .. ")'>" .. status .. "</font>")
		end)
	end

	-- Lắng nghe cập nhật tức thời từ core
	smartDodge.OnHazardChanged(function(count, lastInfo)
		updateMonitor(count, lastInfo)
	end)

	smartDodge.OnSafeSpotChanged(function(inDanger, safePos, hazardName, escapeDist, isInvulnerable, invulnReason, isDead)
		updateSafeSpotUI(inDanger, safePos, hazardName, escapeDist, isInvulnerable, invulnReason, isDead)
		updateDodgeStatusUI()
	end)

	smartDodge.OnDodgeStatusChanged(function(status)
		updateDodgeStatusUI(status)
	end)

	--// Left Section Controls
	leftSection:Toggle({
		Name = "Enable Threat & Safe Spot Engine",
		Default = smartDodge.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.Toggle(state)
			updateMonitor()
		end),
	}, "Toggle_SmartDodgeThreatDetection")

	leftSection:Toggle({
		Name = "Auto Dodge Execution",
		Default = smartDodge.IsAutoDodgeEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetAutoDodge(state)
		end),
	}, "Toggle_SmartDodgeAutoExecution")

	local DODGE_MODE_OPTIONS = { "HumanoidMove", "Blink", "MoveTo" }
	local currentMode = smartDodge.GetDodgeMode()
	local defaultIdx = 1
	if currentMode == "Blink" then
		defaultIdx = 2
	elseif currentMode == "MoveTo" then
		defaultIdx = 3
	end

	leftSection:Dropdown({
		Name = "Dodge Movement Mode",
		Options = DODGE_MODE_OPTIONS,
		Default = defaultIdx,
		Required = true,
		Callback = autoSave.Wrap(function(mode)
			smartDodge.SetDodgeMode(mode)
		end),
	}, "Dropdown_SmartDodgeMode")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Blink Step Distance",
		Suffix = " std",
		Default = smartDodge.GetBlinkStep(),
		Minimum = 0.2,
		Maximum = 2.0,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			smartDodge.SetBlinkStep(value)
		end),
	}, "Slider_SmartDodgeBlinkStep"))

	leftSection:Toggle({
		Name = "Auto Face Target (Luôn nhìn về mục tiêu)",
		Default = smartDodge.IsAutoFaceTargetEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetAutoFaceTarget(state)
		end),
	}, "Toggle_SmartDodgeAutoFaceTarget")

	leftSection:Toggle({
		Name = "Pause Dodge When Invulnerable (Respawn)",
		Default = smartDodge.IsIgnoreDodgeWhenInvulnerableEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetIgnoreDodgeWhenInvulnerable(state)
		end),
	}, "Toggle_SmartDodgeIgnoreInvulnerable")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Respawn Protection",
		Suffix = "s",
		Default = smartDodge.GetRespawnProtectionDuration(),
		Minimum = 0,
		Maximum = 10,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			smartDodge.SetRespawnProtectionDuration(value)
		end),
	}, "Slider_SmartDodgeRespawnProtectionDuration"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Final Snap Distance",
		Suffix = " std",
		Default = smartDodge.GetMaxSnapDistance(),
		Minimum = 0.2,
		Maximum = 6.0,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			smartDodge.SetMaxSnapDistance(value)
		end),
	}, "Slider_SmartDodgeMaxStep"))

	leftSection:Toggle({
		Name = "Maintain Height When Snapping",
		Default = smartDodge.IsMaintainSnapHeightEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetMaintainSnapHeight(state)
		end),
	}, "Toggle_SmartDodgeMaintainHeight")

	leftSection:Toggle({
		Name = "Panic Sprint on Danger (Tăng tốc né khẩn cấp)",
		Default = smartDodge.IsPanicSprintEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetPanicSprintEnabled(state)
		end),
	}, "Toggle_SmartDodgePanicSprint")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Panic WalkSpeed",
		Suffix = " spd",
		Default = smartDodge.GetPanicSpeed(),
		Minimum = 18,
		Maximum = 32,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(value)
			smartDodge.SetPanicSpeed(value)
		end),
	}, "Slider_SmartDodgePanicSpeed"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Panic Duration",
		Suffix = "s",
		Default = smartDodge.GetPanicDuration(),
		Minimum = 0.5,
		Maximum = 3.0,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			smartDodge.SetPanicDuration(value)
		end),
	}, "Slider_SmartDodgePanicDuration"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Panic Cooldown",
		Suffix = "s",
		Default = smartDodge.GetPanicCooldown(),
		Minimum = 2.0,
		Maximum = 10.0,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			smartDodge.SetPanicCooldown(value)
		end),
	}, "Slider_SmartDodgePanicCooldown"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Hitbox Padding",
		Suffix = " std",
		Default = smartDodge.GetHitboxPadding(),
		Minimum = 0,
		Maximum = 5,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			smartDodge.SetHitboxPadding(value)
		end),
	}, "Slider_SmartDodgeHitboxPadding"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Trajectory Lookahead",
		Suffix = " std",
		Default = smartDodge.GetTrajectoryLookahead(),
		Minimum = 20,
		Maximum = 150,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			smartDodge.SetTrajectoryLookahead(value)
		end),
	}, "Slider_SmartDodgeTrajLookahead"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Trajectory Width",
		Suffix = " std",
		Default = smartDodge.GetTrajectoryWidthPadding(),
		Minimum = 0.5,
		Maximum = 6.0,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			smartDodge.SetTrajectoryWidthPadding(value)
		end),
	}, "Slider_SmartDodgeTrajPadding"))

	leftSection:Toggle({
		Name = "Show Hitbox Padding Visual (Cyan Circle)",
		Default = smartDodge.IsShowHitboxVisualEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetShowHitboxVisual(state)
		end),
	}, "Toggle_SmartDodgeHitboxVisual")

	leftSection:Toggle({
		Name = "Player Threat Radar (24-Ray Sonar)",
		Default = smartDodge.IsShowPlayerRadarEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetShowPlayerRadar(state)
		end),
	}, "Toggle_SmartDodgePlayerRadar")

	leftSection:Toggle({
		Name = "Threat Visual ESP (SelectionBox)",
		Default = smartDodge.IsVisualEspEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetVisualEsp(state)
		end),
	}, "Toggle_SmartDodgeVisualEsp")

	leftSection:Toggle({
		Name = "Show Skill Lifetime Timers (3D Countdown)",
		Default = smartDodge.IsShowSkillTimersEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetShowSkillTimers(state)
		end),
	}, "Toggle_SmartDodgeSkillTimers")

	leftSection:Toggle({
		Name = "Show Safe Spot Marker (Green ESP)",
		Default = smartDodge.IsShowSafeMarkerEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetShowSafeMarker(state)
		end),
	}, "Toggle_SmartDodgeShowSafeMarker")

	leftSection:Toggle({
		Name = "Show Speed Debug HUD (Tốc độ trên màn hình)",
		Default = smartDodge.IsSpeedDebugHudEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetSpeedDebugHudEnabled(state)
		end),
	}, "Toggle_SmartDodgeSpeedDebugHud")

	leftSection:Toggle({
		Name = "Log Hazards (Spawns / Despawns)",
		Default = smartDodge.IsLogHazardsEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetLogHazards(state)
		end),
	}, "Toggle_SmartDodgeLogHazards")

	leftSection:Toggle({
		Name = "Log In Danger & Safe Spot",
		Default = smartDodge.IsLogInDangerEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetLogInDanger(state)
		end),
	}, "Toggle_SmartDodgeLogInDanger")

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
	local curSpot, inDang, hName, eDist = smartDodge.GetCurrentSafeSpot()
	updateSafeSpotUI(inDang, curSpot, hName, eDist)
	updateDodgeStatusUI()
end
end function __DIST.y()--==============================================================--
-- Module Skill Timing & Training trong tab Combat (DungeonQuest)
-- Tách biệt rõ ràng thành bảng riêng (Section riêng):
--   1. Section "Skill Timing Profiles":
--      - Mode 1: Default Preset (bảng cứng chuẩn, ổn định tuyệt đối)
--      - Mode 2: Trained Preset (chọn file JSON theo từng Map, nạp 1 lần vào RAM)
--   2. Section "Manual Skill Training":
--      - Chế độ chơi chay thu thập dữ liệu nhịp chiêu thức
--      - Hoàn toàn 0% disk I/O khi né đòn, chỉ lưu file khi chủ động bấm Save
--==============================================================--


local ui = __DIST.load('g')
local autoSave = __DIST.load('d')
local smartDodge = __DIST.load('w')
local dungeonCatalog = __DIST.load('k')
local shared = __DIST.load('f')
local notifier = __DIST.load('c')

return function(window, tab)
	local section = tab:Section({ Side = "Right" })
	section:Header({ Name = "Skill Timing Profiles" })

	local manager = smartDodge.skillTiming
	local TIMING_MODES = { "Default Preset", "Trained Preset" }

	local currentMode = manager.GetMode()
	local defaultModeIdx = (currentMode == "Trained Preset") and 2 or 1

	-- Mode Selector
	local modeDropdown = section:Dropdown({
		Name = "Timing Source Mode",
		Options = TIMING_MODES,
		Default = defaultModeIdx,
		Required = true,
		Callback = autoSave.Wrap(function(mode)
			manager.SetMode(mode)
		end),
	}, "Dropdown_SkillTimingMode")

	-- Map Selector
	local allDungeons = dungeonCatalog.GetDungeons() or { "Desert Temple" }
	local curSelectedMap = manager.GetSelectedMap()
	local defaultMapIdx = 1
	for i, dName in ipairs(allDungeons) do
		if dName == curSelectedMap then
			defaultMapIdx = i
			break
		end
	end

	local mapDropdown = section:Dropdown({
		Name = "Select Map Profile (Mode 2)",
		Options = allDungeons,
		Default = defaultMapIdx,
		Required = true,
		Callback = autoSave.Wrap(function(mapName)
			manager.SetSelectedMap(mapName)
		end),
	}, "Dropdown_SkillTimingSelectedMap")

	local profileStatusLabel = section:Label({
		Text = "Profile Status: <font color='rgb(0, 255, 120)'>Default Presets Active</font>",
	})

	section:Button({
		Name = "Reload Map Data to RAM",
		Callback = function()
			local curMap = manager.GetSelectedMap()
			local count = manager.LoadMapData(curMap)
			local countStr = count > 0 and ("<font color='rgb(0, 255, 120)'>" .. tostring(count) .. " skills loaded</font>")
				or "<font color='rgb(255, 160, 0)'>0 skills (No file found)</font>"
			profileStatusLabel:UpdateName("Profile Status: " .. countStr .. " for [" .. curMap .. "]")
		end,
	})

	section:Button({
		Name = "View Map Skills in Console (F9)",
		Callback = function()
			local count = manager.PrintLoadedMapData()
			notifier.Notify("Skill Timing", ("Đã in %d chiêu của Map ra Console (F9)"):format(count), 2)
		end,
	})

	-- Training Section
	section:Header({ Name = "Manual Training (Chơi Chay)" })

	local recordToggle = section:Toggle({
		Name = "Record Skill Timings (Chơi Chay)",
		Default = manager.IsRecording(),
		Callback = function(state)
			manager.SetRecordingEnabled(state)
			if state then
				-- Khởi động ĐỘC LẬP bộ quét hiểm họa để bắt nhịp chiêu thức vào RAM
				-- Tuyệt đối KHÔNG bật Safe Spot Engine, KHÔNG hiện Safe Spot ESP, KHÔNG can thiệp di chuyển né đòn
				smartDodge.SetDetectionEnabled(true)
				smartDodge.StartDetection()
			else
				-- Khi tắt Record: nếu người chơi không bật Smart Dodge Engine thì dừng hẳn bộ quét
				if not smartDodge.IsEnabled() then
					smartDodge.SetDetectionEnabled(false)
					smartDodge.StopDetection()
				end
			end
		end,
	})

	local recordStatusLabel = section:Label({
		Text = "Recording: <font color='rgb(160, 160, 160)'>Idle (0 skills, 0 hits)</font>",
	})

	section:Button({
		Name = "Save Trained Data to Map File",
		Callback = function()
			local curMap = manager.GetSelectedMap()
			local ok, count = manager.SaveRecordedData(curMap)
			if ok then
				recordStatusLabel:UpdateName("Recording: <font color='rgb(0, 255, 120)'>Saved " .. tostring(count) .. " skills to " .. curMap .. "!</font>")
			end
		end,
	})

	section:Button({
		Name = "Clear Recording Buffer",
		Callback = function()
			manager.ClearRecordedSession()
			recordStatusLabel:UpdateName("Recording: <font color='rgb(160, 160, 160)'>Buffer Cleared (0 skills, 0 hits)</font>")
		end,
	})

	section:Button({
		Name = "View Buffer in Console (F9)",
		Callback = function()
			local count = manager.PrintRecordedData()
			notifier.Notify("Skill Training", ("Đã in %d chiêu trong Buffer ra Console (F9)"):format(count), 2)
		end,
	})

	-- Lắng nghe cập nhật real-time để cập nhật Text Labels
	local function updateLabels(info)
		pcall(function()
			if info.mode == "Default Preset" then
				profileStatusLabel:UpdateName("Profile Status: <font color='rgb(0, 255, 120)'>Default Presets Active (Stable)</font>")
			else
				local curMap = info.selectedMap or manager.GetSelectedMap() or "Unknown"
				if info.loadedCount > 0 then
					profileStatusLabel:UpdateName(("Profile Status: <font color='rgb(0, 255, 120)'>%d skills</font> from [%s] in RAM"):format(info.loadedCount, curMap))
				else
					profileStatusLabel:UpdateName(("Profile Status: <font color='rgb(255, 160, 0)'>0 skills</font> (No file) for [%s]"):format(curMap))
				end
			end

			local totalSamples = info.totalSamples or manager.GetTotalSamplesCount()
			if info.isRecording then
				recordStatusLabel:UpdateName(("Recording: <font color='rgb(255, 60, 60)'>🔴 ACTIVE</font> (%d skills, %d hits in RAM)"):format(info.recordedCount, totalSamples))
			else
				recordStatusLabel:UpdateName(("Recording: <font color='rgb(160, 160, 160)'>Idle</font> (%d skills, %d hits buffered)"):format(info.recordedCount, totalSamples))
			end
		end)
	end

	manager.OnChanged(updateLabels)

	-- Khởi tạo ban đầu
	updateLabels({
		mode = manager.GetMode(),
		selectedMap = manager.GetSelectedMap(),
		loadedCount = manager.GetLoadedSkillCount(),
		isRecording = manager.IsRecording(),
		recordedCount = manager.GetRecordedSkillCount(),
		totalSamples = manager.GetTotalSamplesCount(),
	})
end
end function __DIST.z()-- Target Movement System – Component E & F: Movement Controller & Blocking Checker
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

end function __DIST.A()-- Auto Farm System – Component G: State / Interrupt Manager & Facade
-- Spec: Sections 2, 16, 17, 18, 19, 20 (Roblox_Target_Movement_System_AI_Spec.txt)

--// Imports

local services = __DIST.load('e')
local shared = __DIST.load('f')
local lifecycle = __DIST.load('b')
local coordinator = __DIST.load('j')

local scanner = __DIST.load('p')
local selector = __DIST.load('o')
local tracker = __DIST.load('q')
local movement = __DIST.load('z')

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
	BLOCKED = "BLOCKED",
	REPATHING = "REPATHING",
}

local autoFarm = {}

--// Configuration Parameters
local enabled = false
local running = false
local scanInterval = 1.5 -- Seconds between periodic target scans
local reachDistance = 8.0 -- Studs distance to consider target reached (HOLD state)
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

local function applyTargetSwitch(newTarget, newPath, newWaypoints, newPos)
	local cur = tracker.GetTarget()
	if isSameTarget(cur, newTarget) then
		if newPath then
			tracker.UpdatePath(newPath, newWaypoints, newPos)
		end
		return
	end

	-- Priority 2: New target selected -> Interrupt current movement
	tracker.SetTarget(newTarget, newPath, newWaypoints, newPos)
	currentDestination = nil
	currentDestMode = "None"
	currentDestNodeIndex = nil
	lastBlockerData = nil
	stuckTimer = 0


	if newTarget then
		if newPath and newWaypoints and #newWaypoints > 0 then
			currentState = State.TRACKING_TARGET
		else
			currentState = State.REPATHING
		end
	else
		currentState = State.NO_TARGET
	end
end


evaluateTarget = function()
	if selectRunning or not enabled or not running then return end
	selectToken += 1
	local token = selectToken
	selectRunning = true

	task.spawn(function()
		local ok, err = pcall(function()
			local root = getPlayerRoot()
			local playerPos = root and getSafePosition(root)
			if not playerPos then
				selectRunning = false
				return
			end

			local validList = scanner.Scan()
			if #validList == 0 then
				if token == selectToken and enabled and running then
					applyTargetSwitch(nil, nil, nil, nil)
				end
				selectRunning = false
				return
			end

			local bestTarget, bestPath, bestWaypoints, bestPos = selector.SelectBestTarget(
				playerPos,
				validList,
				function()
					return token ~= selectToken or not enabled or not running
				end
			)

			if token == selectToken and enabled and running then
				applyTargetSwitch(bestTarget, bestPath, bestWaypoints, bestPos)
			else
				if bestPath then pcall(function() bestPath:Destroy() end) end
			end
		end)

		selectRunning = false
		if not ok then
			warn(("[AutoFarm] Error in evaluation: %s"):format(tostring(err)))
		end
	end)
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

	-- Nếu đang tạm dừng di chuyển (giữ vị trí khi combat hoặc né) -> không bước tiếp
	if isPaused then
		return
	end

	-- Periodic Target Rescan (System A)
	local now = os.clock()
	if now - lastScanTime >= scanInterval then
		lastScanTime = now
		if currentState ~= State.HOLD then
			evaluateTarget()
		end
	end

	-- Priority 1: Current target invalid/dead/destroyed
	local target = tracker.GetTarget()
	if target then
		if not tracker.IsTargetValid() then
			-- Immediate Target Invalidation (Section 14)
			tracker.ClearTarget()
			currentState = State.NO_TARGET
			currentDestination = nil
			currentDestMode = "None"
			lastBlockerData = nil
			evaluateTarget()
			pcall(function() humanoid:MoveTo(playerPos) end)
			return
		end
	end

	-- Priority 1b: No target
	if not target or currentState == State.NO_TARGET then
		currentDestination = nil
		currentDestMode = "None"
		lastBlockerData = nil
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
		return
	end

	-- Check Target Reach Condition (Enter HOLD State)
	local flatDist = Vector3.new(enemyPos.X - playerPos.X, 0, enemyPos.Z - playerPos.Z).Magnitude
	if flatDist <= reachDistance then
		currentState = State.HOLD
		currentDestination = nil
		currentDestMode = "Hold"
		stuckTimer = 0
		pcall(function() humanoid:MoveTo(playerPos) end)
		-- State HOLD: Currently holds position (idle)
		return
	else
		if currentState == State.HOLD then
			currentState = State.CHASE
		end
	end

	-- Target Tracking & Repath check (Sections 7 & 15)
	local needsRepath = false
	if currentState == State.REPATHING or currentState == State.BLOCKED or not tracker.GetPathInstance() then
		needsRepath = true
	elseif tracker.NeedsRepath(enemyPos) then
		needsRepath = true
	end

	if needsRepath then
		local repathSuccess = tracker.Repath(playerPos, enemyPos)
		if repathSuccess then
			currentState = State.CHASE
		else
			-- Target unreachable
			currentState = State.BLOCKED
			currentDestination = nil
			currentDestMode = "Blocked"
			pcall(function() humanoid:MoveTo(playerPos) end)
			return
		end
	end

	-- Advance Waypoint Progression
	tracker.AdvanceWaypointIndex(playerPos)

	-- Blocking Checker & Blocked Destination Loop (Sections 10, 11, 12, 13)
	local waypoints = tracker.GetWaypoints()
	local waypointIdx = tracker.GetWaypointIndex()
	local ignoreList = { player.Character }
	if target.Model then
		table.insert(ignoreList, target.Model)
	end

	local chosenDest, mode, nodeIdx, blockerData = movement.ResolveDestination(playerPos, enemyPos, waypoints, waypointIdx, ignoreList)
	lastBlockerData = blockerData

	if mode == "Blocked" or not chosenDest then
		-- Blocking loop reached dead-end -> State = BLOCKED -> repath next frame
		currentState = State.BLOCKED
		currentDestination = nil
		currentDestMode = "Blocked"
		pcall(function() humanoid:MoveTo(playerPos) end)
		return
	end

	-- Movement Controller: Freewalk execution (State CHASE)
	currentState = State.CHASE
	currentDestination = chosenDest
	currentDestMode = mode
	currentDestNodeIndex = nodeIdx

	movement.ExecuteMove(humanoid, playerPos, chosenDest, waypoints, waypointIdx)

	-- Velocity-Based Stuck Detection & Auto-Jump
	local distToDest = (chosenDest - playerPos).Magnitude
	if distToDest >= 1.5 then
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
			-- If stuck for >= 1.5s despite jumping -> Repath!
			if stuckTimer >= 1.5 then
				currentState = State.REPATHING
				stuckTimer = 0
			end
		else
			stuckTimer = 0
		end
	else
		stuckTimer = 0
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

function autoFarm.GetReachDistance()
	return reachDistance
end

function autoFarm.SetReachDistance(val)
	if type(val) == "number" and val >= 1 then
		reachDistance = val
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
			local p = getSafePosition(r)
			if p then
				pcall(function() h:MoveTo(p) end)
			end
		end
	end
end

function autoFarm.IsPaused()
	return isPaused
end

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
			local p = getSafePosition(r)
			if p then
				pcall(function() h:MoveTo(p) end)
			end
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
end function __DIST.B()-- Core Contextual cho DungeonQuest: quản lý thiết lập Auto Farm (Target Reach Distance...)
-- riêng biệt theo từng DUNGEON x LOẠI MỤC TIÊU (Normal, Boss 1, Boss 2, Boss 3).
-- Dữ liệu lưu trong file config JSON qua macLib.contextData.

--// Imports

local macLib = __DIST.load('a')
local autoSave = __DIST.load('d')
local shared = __DIST.load('f')
local dungeonCatalog = __DIST.load('k')
local notifier = __DIST.load('c')
local lifecycle = __DIST.load('b')
local autoFarm = __DIST.load('A')

--// Table
local contextual = {}

--// Metadata field -> get/set trên autoFarm
local FIELD_DEFS = {
	TargetReachDistance = {
		get = function()
			return autoFarm.GetReachDistance()
		end,
		set = function(v)
			autoFarm.SetReachDistance(v)
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
end function __DIST.C()-- Module Auto Farm trong tab Combat (DungeonQuest)
-- Tích hợp Auto Farm AI (Scanner, Validator, Selector, Tracker, Movement Controller, Blocker Checker)
-- và Auto Farm Context (Target Reach Distance theo từng Dungeon x Target).

--// Imports

local autoSave = __DIST.load('d')
local autoFarm = __DIST.load('A')
local contextual = __DIST.load('B')
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
		Name = "Target Reach Distance",
		Suffix = " std",
		Default = autoFarm.GetReachDistance(),
		Minimum = 2,
		Maximum = 200,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetReachDistance(val)
		end),
	}, "Slider_AF_ReachDistance")

	leftSection:Slider({
		Name = "Repath Distance",
		Suffix = " std",
		Default = autoFarm.GetRepathDistance(),
		Minimum = 2,
		Maximum = 20,
		DisplayMethod = "Round",
		Precision = 0,
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
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			autoFarm.SetStuckVelocityThreshold(val)
		end),
	}, "Slider_AF_StuckVelocity"))

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

	editCtxLabel = ctxSection:Label({ Text = "" })

	reachDistanceSlider = ui.PatchSliderLoadCallback(ctxSection:Slider({
		Name = "Target Reach Distance",
		Suffix = " std",
		Default = contextual.GetField(editDungeon, editTarget, "TargetReachDistance"),
		Minimum = 2,
		Maximum = 200,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "TargetReachDistance", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_AF_CtxReachDistance"))

	refreshContextControls = function()
		isSyncing = true
		disarmReset()
		pcall(function() reachDistanceSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "TargetReachDistance")) end)
		isSyncing = false
		pcall(function() editCtxLabel:UpdateName("Editing: <font color='rgb(150,255,150)'>" .. (editDungeon or "Not in dungeon") .. "</font> / " .. contextual.GetDisplayForTarget(editTarget)) end)
	end

	setEditControlsVisible = function(visible)
		pcall(function() reachDistanceSlider:SetVisibility(visible) end)
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
end function __DIST.D()--==============================================================--
-- Smart Auto Play – Submodule: Auto Skill (DungeonQuest)
-- Tự động xả kỹ năng thông minh theo 2 lối chơi:
--   1. FULL DAMAGE: Cả 2 skill gây dame -> xả skill liên tục như bình thường.
--   2. BUFF + DAMAGE: 1 skill Inner Focus (Buff) + 1 skill Dame ->
--      Luôn luôn kích hoạt Buff trước -> chờ nhận hiệu lực -> xả chiêu Dame.
--      Không xả lẻ tẻ chiêu dame khi buff đang hồi chiêu (chống thọt dame).
--==============================================================--


local services = __DIST.load('e')
local shared = __DIST.load('f')
local lifecycle = __DIST.load('b')
local targetFacing = __DIST.load('r')
local smartDodge = __DIST.load('w')

local UserInputService = services.UserInputService
local VirtualInputManager = services.VirtualInputManager
local VirtualUser = game:GetService("VirtualUser")
local player = services.player

local autoSkill = {}

--// Settings
local enabled = false
local useSkillQ = true
local useSkillE = true
local castInterval = 0.25 -- Chu kỳ kiểm tra & xả chiêu cho Full Dame (giây)
local keyHoldDuration = 0.08
local buffDelay = 0.25 -- Thời gian chờ sau khi ấn Buff để nhận hiệu lực rồi mới xả Dame (giây)
local comboCooldownOverride = 0 -- 0 = tự động nhận từ game, >0 = ghi đè thủ công

-- Playstyle Mode: "Auto" | "FullDamage" | "BuffAndDamage"
local playstyleModeSetting = "Auto"

--// State
local loopThread = nil
local isCasting = false
local currentEnemyCount = 0
local nearestTargetInfo = nil
local statusListeners = {}

-- Skill Info
local skillQ = {
	name = "Scanning...",
	key = Enum.KeyCode.Q,
	slotKey = "q",
	isBuff = false,
	cooldown = 15.0,
	tool = nil,
}

local skillE = {
	name = "Scanning...",
	key = Enum.KeyCode.E,
	slotKey = "e",
	isBuff = false,
	cooldown = 15.0,
	tool = nil,
}

local detectedPlaystyle = "FullDamage" -- "FullDamage" | "BuffAndDamage"
local buffSkill = nil
local damageSkill = nil
local lastBuffCastTime = 0
local lastDamageCastTime = 0
local lastScanTime = 0

-- Reference tới hàm lấy bán kính R từ smartAutoPlay facade
local getCombatRadius = nil
function autoSkill.BindRadiusGetter(getterFn)
	getCombatRadius = getterFn
end

local function getEffectivePlaystyle()
	if playstyleModeSetting == "FullDamage" then
		return "FullDamage"
	elseif playstyleModeSetting == "BuffAndDamage" then
		return "BuffAndDamage"
	end
	return detectedPlaystyle
end

-- Tìm Tool kỹ năng trong Backpack hoặc Character theo slotKey ("q" hoặc "e")
local function findAbilityTool(slotKey)
	local bp = player and player:FindFirstChild("Backpack")
	if bp then
		for _, child in ipairs(bp:GetChildren()) do
			local slotVal = child:FindFirstChild("abilitySlot")
			if slotVal and slotVal.Value == slotKey then
				return child
			end
		end
	end

	local char = player and player.Character
	if char then
		for _, child in ipairs(char:GetChildren()) do
			if child:IsA("Tool") then
				local slotVal = child:FindFirstChild("abilitySlot")
				if slotVal and slotVal.Value == slotKey then
					return child
				end
			end
		end
	end

	return nil
end

-- Kiểm tra nhân vật có đang bận cast chiêu không (busyCasting)
local function isCharacterBusyCasting()
	local char = player and player.Character
	if char then
		local busy = char:FindFirstChild("busyCasting")
		if busy and busy:IsA("BoolValue") and busy.Value == true then
			return true
		end
	end
	return false
end

local function getComboCooldownRemaining()
	local activeStyle = getEffectivePlaystyle()
	if activeStyle ~= "BuffAndDamage" or not buffSkill then return 0 end

	-- Nếu người chơi cấu hình ghi đè bằng slider
	if comboCooldownOverride > 0 and lastBuffCastTime > 0 then
		local elapsed = os.clock() - lastBuffCastTime
		return math.max(0, comboCooldownOverride - elapsed)
	end

	-- Lấy Cooldown thời gian thực trực tiếp từ Tool trong Backpack / Character
	local tool = buffSkill.tool or findAbilityTool(buffSkill.slotKey)
	if tool and tool.Parent then
		local cdVal = tool:FindFirstChild("cooldown")
		if cdVal and cdVal:IsA("ValueBase") then
			return math.max(0, tonumber(cdVal.Value) or 0)
		end
	end

	-- Fallback tính theo đồng hồ
	if lastBuffCastTime > 0 then
		local cd = buffSkill.cooldown or 15.0
		local elapsed = os.clock() - lastBuffCastTime
		return math.max(0, cd - elapsed)
	end

	return 0
end

local function fireStatusChange()
	local activeStyle = getEffectivePlaystyle()
	local info = {
		enabled = enabled,
		isCasting = isCasting,
		playstyle = activeStyle,
		skillQ = skillQ,
		skillE = skillE,
		buffSkill = buffSkill,
		damageSkill = damageSkill,
		cooldownRemaining = getComboCooldownRemaining(),
		enemyCount = currentEnemyCount,
		targetName = nearestTargetInfo and nearestTargetInfo.name or nil,
		targetDist = nearestTargetInfo and nearestTargetInfo.dist or nil,
	}
	for _, cb in ipairs(statusListeners) do
		pcall(cb, info)
	end
end

-- Kích hoạt kỹ năng (ưu tiên gọi localEvent của Tool, đồng thời nhấn phím)
local function castAbility(tool, key)
	if tool and tool.Parent then
		local localEvent = tool:FindFirstChild("localEvent")
		if localEvent and localEvent:IsA("BindableEvent") then
			pcall(function()
				localEvent:Fire()
			end)
		end
	end

	if key then
		local holdTime = shared.GetKeyHoldTime() or keyHoldDuration
		pcall(function()
			VirtualInputManager:SendKeyEvent(true, key, false, game)
			task.wait(holdTime)
			VirtualInputManager:SendKeyEvent(false, key, false, game)
		end)
	end
end

--// Quét thông tin trang bị kỹ năng trực tiếp từ Backpack / Character
function autoSkill.ScanEquippedSkills()
	local toolQ = findAbilityTool("q")
	local toolE = findAbilityTool("e")

	local function parseTool(tool, defaultName, key, slotKey)
		if not tool then
			return {
				name = defaultName,
				key = key,
				slotKey = slotKey,
				isBuff = false,
				cooldown = 15.0,
				tool = nil,
			}
		end

		local rawName = tool.Name
		local nameLower = rawName:lower()
		-- Kỹ năng chỉ cần chứa từ "inner" trong tên thì được xem là BUFF
		local isBuff = nameLower:find("inner") ~= nil

		local maxCd = 15.0
		local cdLen = tool:FindFirstChild("cooldownLength")
		if cdLen and cdLen:IsA("ValueBase") and tonumber(cdLen.Value) and tonumber(cdLen.Value) > 0 then
			maxCd = tonumber(cdLen.Value)
		end

		return {
			name = rawName,
			key = key,
			slotKey = slotKey,
			isBuff = isBuff,
			cooldown = maxCd,
			tool = tool,
		}
	end

	skillQ = parseTool(toolQ, "Skill Q", Enum.KeyCode.Q, "q")
	skillE = parseTool(toolE, "Skill E", Enum.KeyCode.E, "e")

	-- Phân loại lối chơi tự động
	if skillQ.isBuff and not skillE.isBuff then
		detectedPlaystyle = "BuffAndDamage"
		buffSkill = skillQ
		damageSkill = skillE
	elseif skillE.isBuff and not skillQ.isBuff then
		detectedPlaystyle = "BuffAndDamage"
		buffSkill = skillE
		damageSkill = skillQ
	else
		detectedPlaystyle = "FullDamage"
		buffSkill = nil
		damageSkill = nil
	end

	lastScanTime = os.clock()
	fireStatusChange()
end

-- Tự động theo dõi Backpack và Character để cập nhật ngay khi đổi đồ hoặc hồi sinh
local function hookBackpackEvents()
	local bp = player and player:FindFirstChild("Backpack")
	if bp then
		bp.ChildAdded:Connect(function()
			task.delay(0.15, autoSkill.ScanEquippedSkills)
		end)
		bp.ChildRemoved:Connect(function()
			task.delay(0.15, autoSkill.ScanEquippedSkills)
		end)
	end
end

hookBackpackEvents()

if player then
	player.CharacterAdded:Connect(function()
		task.delay(0.5, function()
			hookBackpackEvents()
			autoSkill.ScanEquippedSkills()
		end)
	end)
end

shared.OnRespawn(function()
	task.delay(0.5, function()
		hookBackpackEvents()
		autoSkill.ScanEquippedSkills()
	end)
end)

task.spawn(function()
	task.wait(0.5)
	autoSkill.ScanEquippedSkills()
end)

-- Tìm tất cả kẻ địch còn sống trong bán kính R phẳng (X/Z) xung quanh người chơi
local function getEnemiesInRadius(r)
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not root then return {} end

	local pPos = root.Position
	local inRange = {}

	local tracked = shared.GetTrackedEnemyData()
	for _, data in ipairs(tracked) do
		if data and data.Root and data.Root.Parent then
			local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
			if hum and hum.Health > 0 then
				local dx = data.Root.Position.X - pPos.X
				local dz = data.Root.Position.Z - pPos.Z
				local flatDist = math.sqrt(dx * dx + dz * dz)
				if flatDist <= r then
					table.insert(inRange, {
						data = data,
						dist = flatDist,
						model = data.Model,
						name = (data.Model and data.Model.Name) or "Enemy",
						pos = data.Root.Position,
					})
				end
			end
		end
	end

	table.sort(inRange, function(a, b) return a.dist < b.dist end)
	return inRange
end

-- Kích hoạt đòn đánh / phím kỹ năng
local function executeCombat()
	local activeStyle = getEffectivePlaystyle()

	-- Đảm bảo Tool reference luôn hợp lệ
	if not skillQ.tool or not skillQ.tool.Parent then
		skillQ.tool = findAbilityTool("q")
	end
	if not skillE.tool or not skillE.tool.Parent then
		skillE.tool = findAbilityTool("e")
	end

	if activeStyle == "BuffAndDamage" and buffSkill and damageSkill then
		-- LỐI CHƠI 2: BUFF + DAMAGE
		local buffTool = buffSkill.tool or findAbilityTool(buffSkill.slotKey)
		local damageTool = damageSkill.tool or findAbilityTool(damageSkill.slotKey)

		-- Kiểm tra xem chiêu Buff đã hồi xong chưa
		local isBuffReady = false
		if comboCooldownOverride > 0 then
			local elapsed = os.clock() - lastBuffCastTime
			isBuffReady = (lastBuffCastTime == 0 or elapsed >= comboCooldownOverride)
		elseif buffTool and buffTool.Parent then
			local cdVal = buffTool:FindFirstChild("cooldown")
			if cdVal and cdVal:IsA("ValueBase") then
				isBuffReady = (tonumber(cdVal.Value) or 0) <= 0.05
			else
				local elapsed = os.clock() - lastBuffCastTime
				isBuffReady = (lastBuffCastTime == 0 or elapsed >= buffSkill.cooldown)
			end
		else
			local elapsed = os.clock() - lastBuffCastTime
			isBuffReady = (lastBuffCastTime == 0 or elapsed >= buffSkill.cooldown)
		end

		if isBuffReady and not isCharacterBusyCasting() then
			isCasting = true

			-- Bước 1: Kích hoạt BUFF
			castAbility(buffTool, buffSkill.key)
			lastBuffCastTime = os.clock()

			-- Bước 2: Chờ nhận hiệu lực buff (buffDelay)
			task.wait(buffDelay)

			-- Bước 3: Kích hoạt DAME
			castAbility(damageTool, damageSkill.key)
			lastDamageCastTime = os.clock()

			isCasting = false
		end
	else
		-- LỐI CHƠI 1: FULL DAMAGE (Spam Q & E như bình thường)
		isCasting = true
		if useSkillQ then
			local qTool = skillQ.tool or findAbilityTool("q")
			local qCdVal = qTool and qTool:FindFirstChild("cooldown")
			local qReady = not qCdVal or ((tonumber(qCdVal.Value) or 0) <= 0.05)
			if qReady and not isCharacterBusyCasting() then
				castAbility(qTool, Enum.KeyCode.Q)
			end
		end

		if useSkillE then
			local eTool = skillE.tool or findAbilityTool("e")
			local eCdVal = eTool and eTool:FindFirstChild("cooldown")
			local eReady = not eCdVal or ((tonumber(eCdVal.Value) or 0) <= 0.05)
			if eReady and not isCharacterBusyCasting() then
				castAbility(eTool, Enum.KeyCode.E)
			end
		end
		isCasting = false
	end
end

-- Vòng lặp quét quái trong tầm và xả chiêu
local function startLoop()
	if loopThread then return end

	-- Quét cập nhật trang bị ngay khi bắt đầu bật
	autoSkill.ScanEquippedSkills()

	loopThread = task.spawn(function()
		while enabled do
			-- Không thao tác khi nhân vật đã chết hoặc đang mở khung gõ chữ (chat box)
			if not shared.IsDead() and not UserInputService:GetFocusedTextBox() then
				local r = (getCombatRadius and getCombatRadius()) or 15.0
				local enemies = getEnemiesInRadius(r)
				currentEnemyCount = #enemies

				if #enemies > 0 then
					nearestTargetInfo = enemies[1]

					-- Thực thi tấn công theo lối chơi tương ứng
					executeCombat()
				else
					nearestTargetInfo = nil
					isCasting = false
				end

				fireStatusChange()
			else
				isCasting = false
				currentEnemyCount = 0
				nearestTargetInfo = nil
				fireStatusChange()
			end

			local activeStyle = getEffectivePlaystyle()
			if activeStyle == "BuffAndDamage" then
				-- Trong chế độ Buff+Dame, loop tick nhanh (0.08s) để chớp thời cơ xả ngay khi hồi chiêu
				task.wait(0.08)
			else
				task.wait(castInterval)
			end
		end

		isCasting = false
		currentEnemyCount = 0
		nearestTargetInfo = nil
		fireStatusChange()
		loopThread = nil
	end)
end

local function stopLoop()
	enabled = false
	isCasting = false
	currentEnemyCount = 0
	nearestTargetInfo = nil
	fireStatusChange()
end

--// Public API
function autoSkill.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		startLoop()
	else
		stopLoop()
	end
end

function autoSkill.IsEnabled()
	return enabled
end

function autoSkill.SetSkillQ(state)
	useSkillQ = state and true or false
end

function autoSkill.IsSkillQEnabled()
	return useSkillQ
end

function autoSkill.SetSkillE(state)
	useSkillE = state and true or false
end

function autoSkill.IsSkillEEnabled()
	return useSkillE
end

function autoSkill.SetAutoAttack(state)
	useAttack = state and true or false
end

function autoSkill.IsAutoAttackEnabled()
	return useAttack
end

function autoSkill.SetAutoFace(state)
	autoFace = state and true or false
	if not autoFace and not enabled then
		targetFacing.SetEnabled(false)
	end
end

function autoSkill.IsAutoFaceEnabled()
	return autoFace
end

function autoSkill.SetInterval(val)
	if type(val) == "number" and val >= 0.05 then
		castInterval = math.clamp(val, 0.05, 2.0)
	end
end

function autoSkill.GetInterval()
	return castInterval
end

function autoSkill.SetBuffDelay(val)
	if type(val) == "number" and val >= 0.05 then
		buffDelay = math.clamp(val, 0.05, 1.5)
	end
end

function autoSkill.GetBuffDelay()
	return buffDelay
end

function autoSkill.SetComboCooldownOverride(val)
	if type(val) == "number" and val >= 0 then
		comboCooldownOverride = val
	end
end

function autoSkill.GetComboCooldownOverride()
	return comboCooldownOverride
end

function autoSkill.SetPlaystyleMode(mode)
	if mode == "Auto" or mode == "FullDamage" or mode == "BuffAndDamage" then
		playstyleModeSetting = mode
		fireStatusChange()
	end
end

function autoSkill.GetPlaystyleMode()
	return playstyleModeSetting
end

function autoSkill.GetEffectivePlaystyle()
	return getEffectivePlaystyle()
end

function autoSkill.GetSkillQInfo()
	return skillQ
end

function autoSkill.GetSkillEInfo()
	return skillE
end

function autoSkill.GetBuffSkill()
	return buffSkill
end

function autoSkill.GetDamageSkill()
	return damageSkill
end

function autoSkill.GetComboCooldownRemaining()
	return getComboCooldownRemaining()
end

function autoSkill.GetStatus()
	local activeStyle = getEffectivePlaystyle()
	return {
		enabled = enabled,
		isCasting = isCasting,
		playstyle = activeStyle,
		skillQ = skillQ,
		skillE = skillE,
		buffSkill = buffSkill,
		damageSkill = damageSkill,
		cooldownRemaining = getComboCooldownRemaining(),
		enemyCount = currentEnemyCount,
		targetName = nearestTargetInfo and nearestTargetInfo.name or nil,
		targetDist = nearestTargetInfo and nearestTargetInfo.dist or nil,
	}
end

function autoSkill.OnStatusChanged(callback)
	if type(callback) == "function" then
		table.insert(statusListeners, callback)
	end
end

-- Lifecycle Cleanup
lifecycle.Register(function()
	autoSkill.SetEnabled(false)
end)

return autoSkill
end function __DIST.E()--==============================================================--
-- Smart Auto Play – Submodule: Auto Approach (DungeonQuest)
-- Quản lý tiếp cận mục tiêu bằng Pathfinding (AutoFarm) dựa trên Combat Radius R:
--   - Khi KHÔNG CÓ quái nào trong vòng tròn R: Bật AutoFarm dẫn đường tiếp cận mục tiêu.
--   - Khi BẮT ĐẦU CÓ quái bước vào vòng tròn R: Lập tức dừng AutoFarm để giữ cự ly chiến đấu.
--   - Khi tiêu diệt hết quái trong R: Tự động tiếp tục bật AutoFarm tìm cụm quái tiếp theo.
--==============================================================--


local services = __DIST.load('e')
local shared = __DIST.load('f')
local lifecycle = __DIST.load('b')
local autoFarm = __DIST.load('A')
local tracker = __DIST.load('q')

local player = services.player

local autoApproach = {}

--// Settings
local enabled = false
local hysteresisBuffer = 2.0 -- Đệm chống rung giật mép vòng tròn (studs)
local checkInterval = 0.15 -- Chu kỳ kiểm tra (giây)

--// State
local loopThread = nil
local currentState = "Disabled" -- "Disabled" | "Approaching" | "InCombat" | "NoEnemies"
local currentTargetName = nil
local currentTargetDist = nil
local statusListeners = {}

-- Reference tới hàm lấy bán kính R từ smartAutoPlay facade
local getCombatRadius = nil
function autoApproach.BindRadiusGetter(getterFn)
	getCombatRadius = getterFn
end

local function fireStatusChange()
	local info = {
		enabled = enabled,
		state = currentState,
		targetName = currentTargetName,
		targetDist = currentTargetDist,
	}
	for _, cb in ipairs(statusListeners) do
		pcall(cb, info)
	end
end

-- Tìm quái gần nhất và kiểm tra xem có quái nào nằm trong bán kính R không
local function evaluateEnemies(r)
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not root then return false, 0, nil, nil end

	local pPos = root.Position
	local tracked = shared.GetTrackedEnemyData()

	local hasEnemyInRadius = false
	local nearestDist = math.huge
	local nearestName = nil
	local totalAlive = 0

	for _, data in ipairs(tracked) do
		if data and data.Root and data.Root.Parent then
			local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
			if hum and hum.Health > 0 then
				totalAlive = totalAlive + 1
				local dx = data.Root.Position.X - pPos.X
				local dz = data.Root.Position.Z - pPos.Z
				local flatDist = math.sqrt(dx * dx + dz * dz)

				if flatDist < nearestDist then
					nearestDist = flatDist
					nearestName = (data.Model and data.Model.Name) or "Enemy"
				end

				if flatDist <= r then
					hasEnemyInRadius = true
				end
			end
		end
	end

	-- Kiểm tra thêm target hiện tại của AutoFarm nếu có
	local afTarget = tracker.GetTarget()
	if afTarget and afTarget.Root and afTarget.Root.Parent then
		local hum = afTarget.Humanoid or (afTarget.Model and afTarget.Model:FindFirstChildOfClass("Humanoid"))
		if hum and hum.Health > 0 then
			local dx = afTarget.Root.Position.X - pPos.X
			local dz = afTarget.Root.Position.Z - pPos.Z
			local flatDist = math.sqrt(dx * dx + dz * dz)
			if flatDist <= r then
				hasEnemyInRadius = true
			end
			if flatDist < nearestDist then
				nearestDist = flatDist
				nearestName = (afTarget.Model and afTarget.Model.Name) or "Target"
			end
		end
	end

	return hasEnemyInRadius, totalAlive, nearestName, (nearestDist < math.huge and nearestDist or nil)
end

-- Vòng lặp điều phối trạng thái tiếp cận
local function startLoop()
	if loopThread then return end

	loopThread = task.spawn(function()
		while enabled do
			if not shared.IsDead() then
				local r = (getCombatRadius and getCombatRadius()) or 15.0

				-- Đồng bộ reachDistance của AutoFarm theo bán kính R để thuật toán Pathfinding dừng chuẩn
				if autoFarm.GetReachDistance and autoFarm.SetReachDistance then
					if math.abs(autoFarm.GetReachDistance() - r) > 0.5 then
						autoFarm.SetReachDistance(r)
					end
				end

				-- Đánh giá tình hình quái xung quanh
				-- Khi đang ở trạng thái InCombat, mở rộng ngưỡng so sánh thêm hysteresisBuffer để không bị bật/tắt liên tục
				local checkR = (currentState == "InCombat") and (r + hysteresisBuffer) or r
				local hasEnemyInRange, totalAlive, nName, nDist = evaluateEnemies(checkR)

				currentTargetName = nName
				currentTargetDist = nDist

				if totalAlive == 0 then
					-- Không có quái nào còn sống trong phòng/dungeon
					currentState = "NoEnemies"
					if autoFarm.IsEnabled() then
						autoFarm.Toggle(false)
					end
				elseif hasEnemyInRange then
					-- ĐÃ CÓ QUÁI TRONG VÒNG TRÒN R -> Dừng Pathfinding của AutoFarm ngay lập tức!
					currentState = "InCombat"
					if autoFarm.IsEnabled() then
						autoFarm.Toggle(false)
					end
				else
					-- CHƯA CÓ QUÁI TRONG R -> Bật AutoFarm để tìm đường tiếp cận mục tiêu!
					currentState = "Approaching"
					if not autoFarm.IsEnabled() then
						autoFarm.Toggle(true)
					end
				end

				fireStatusChange()
			else
				-- Nhân vật tử trận -> Tạm dừng AutoFarm
				if autoFarm.IsEnabled() then
					autoFarm.Toggle(false)
				end
			end

			task.wait(checkInterval)
		end

		if autoFarm.IsEnabled() then
			autoFarm.Toggle(false)
		end
		currentState = "Disabled"
		currentTargetName = nil
		currentTargetDist = nil
		fireStatusChange()
		loopThread = nil
	end)
end

local function stopLoop()
	enabled = false
	if autoFarm.IsEnabled() then
		autoFarm.Toggle(false)
	end
	currentState = "Disabled"
	currentTargetName = nil
	currentTargetDist = nil
	fireStatusChange()
end

--// Public API
function autoApproach.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		startLoop()
	else
		stopLoop()
	end
end

function autoApproach.IsEnabled()
	return enabled
end

function autoApproach.GetStatus()
	return {
		enabled = enabled,
		state = currentState,
		targetName = currentTargetName,
		targetDist = currentTargetDist,
	}
end

function autoApproach.OnStatusChanged(callback)
	if type(callback) == "function" then
		table.insert(statusListeners, callback)
	end
end

-- Lifecycle Cleanup
lifecycle.Register(function()
	autoApproach.SetEnabled(false)
end)

return autoApproach
end function __DIST.F()--==============================================================--
-- Smart Auto Play Core (DungeonQuest)
-- Master Orchestrator: Tích hợp thành 1 toggle duy nhất Smart Auto Play
--   1. Visual Combat Radius R: Hiển thị vòng tròn hạt neon cyan quanh người chơi.
--   2. Priority 1 (DANGER): Boss/Hazard ra chiêu -> Dừng AutoFarm ngay lập tức,
--      Smart Dodge nắm toàn quyền đưa nhân vật đến Safe Spot an toàn.
--   3. Priority 2 (IN COMBAT RANGE): Có quái trong bán kính R -> Dừng AutoFarm,
--      tự động xả kỹ năng (Auto Skill Q, E, Attack) và khóa mặt vào quái (Target Facing).
--   4. Priority 3 (APPROACH): Quái ở xa ngoài bán kính R -> Tự động dùng AutoFarm
--      (Pathfinding) tìm đường tiếp cận mục tiêu đến mép R, vẫn khóa mặt vào mục tiêu.
--   5. Priority 4 (ROOM CLEARED): Quái chết hết -> Nghỉ ngơi chờ quái mới / qua phòng.
--==============================================================--


local services = __DIST.load('e')
local shared = __DIST.load('f')
local lifecycle = __DIST.load('b')
local coordinator = __DIST.load('j')

local autoFarm = __DIST.load('A')
local tracker = __DIST.load('q')
local smartDodge = __DIST.load('w')
local geometry = __DIST.load('m')
local targetFacing = __DIST.load('r')
local autoSkill = __DIST.load('D')
local autoApproach = __DIST.load('E')

local RunService = services.RunService
local player = services.player

local smartAutoPlay = {}

--// Settings & State
local masterEnabled = false
local masterLoopThread = nil
local masterState = "Disabled" -- "Disabled" | "Dodging" | "InCombat" | "Approaching" | "WaitingHazard" | "RoomCleared" | "Dead"
local currentHazardName = nil
local currentEscapeDist = 0
local currentTargetName = nil
local currentTargetDist = nil
local masterStatusListeners = {}
local lastDodgeTimestamp = 0

local smartAutoSkillEnabled = true
local showRadiusCircle = false
local radius = 15.0 -- Combat Radius R in studs
local SPHERE_COUNT = 36 -- 36 spheres = 1 sphere every 10 degrees
local sphereSize = 0.35 -- Diameter of each sphere in studs
local SPHERE_COLOR = Color3.fromRGB(0, 225, 255) -- Vibrant Neon Cyan
local HYSTERESIS_BUFFER = 2.0 -- Đệm chống rung giật mép vòng tròn (studs)

local sphereParts = {}
local visualFolder = nil
local updateConnection = nil

-- Kết nối hàm lấy bán kính R cho autoSkill
local function getRadius()
	return smartAutoPlay.GetRadius()
end
autoSkill.BindRadiusGetter(getRadius)

smartAutoPlay.autoSkill = autoSkill
smartAutoPlay.autoApproach = autoApproach
smartAutoPlay.smartDodge = smartDodge
smartAutoPlay.autoFarm = autoFarm

--// Status Dispatcher
local function fireMasterStatus()
	local info = {
		enabled = masterEnabled,
		state = masterState,
		hazardName = currentHazardName,
		escapeDist = currentEscapeDist,
		targetName = currentTargetName,
		targetDist = currentTargetDist,
		radius = radius,
	}
	for _, cb in ipairs(masterStatusListeners) do
		pcall(cb, info)
	end
end

--// Floor Raycast Parameters cho Visual Circle
local floorRayParams = RaycastParams.new()
floorRayParams.FilterType = Enum.RaycastFilterType.Exclude
floorRayParams.IgnoreWater = true

local function updateRayFilter()
	local ignore = {}
	if player and player.Character then
		table.insert(ignore, player.Character)
	end
	local rayIgnore = workspace:FindFirstChild("RaycastIgnore")
	if rayIgnore then
		table.insert(ignore, rayIgnore)
	end
	floorRayParams.FilterDescendantsInstances = ignore
end

local function getOrCreateVisualFolder()
	if visualFolder and visualFolder.Parent then
		return visualFolder
	end

	local container = workspace.CurrentCamera or workspace
	local folder = container:FindFirstChild("SmartAutoPlay_RadiusVisual")
	if not folder then
		folder = Instance.new("Folder")
		folder.Name = "SmartAutoPlay_RadiusVisual"
		folder.Parent = container
	end
	visualFolder = folder
	return folder
end

local function getOrCreateSpheres()
	local folder = getOrCreateVisualFolder()

	while #sphereParts < SPHERE_COUNT do
		local idx = #sphereParts + 1
		local p = Instance.new("Part")
		p.Name = ("RadiusSphere_%02d"):format(idx)
		p.Shape = Enum.PartType.Ball
		p.Size = Vector3.new(sphereSize, sphereSize, sphereSize)
		p.Material = Enum.Material.Neon
		p.Color = SPHERE_COLOR
		p.Transparency = 0.2
		p.Anchored = true
		p.CanCollide = false
		p.CanTouch = false
		p.CanQuery = false
		p.CastShadow = false
		p.Parent = folder
		table.insert(sphereParts, p)
	end

	return sphereParts
end

local function hideSpheres()
	for _, p in ipairs(sphereParts) do
		p.Transparency = 1
	end
end

local function updateCirclePositions()
	if not showRadiusCircle then
		hideSpheres()
		return
	end

	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not root or not root.Parent then
		hideSpheres()
		return
	end

	updateRayFilter()
	local spheres = getOrCreateSpheres()
	local pPos = root.Position
	local angleStep = (2 * math.pi) / SPHERE_COUNT

	-- Single locked Y level beneath player for all spheres
	local floorHit = workspace:Raycast(pPos, Vector3.new(0, -12.0, 0), floorRayParams)
	local lockedY = floorHit and (floorHit.Position.Y + (sphereSize / 2)) or (pPos.Y - 2.8)

	for i = 1, SPHERE_COUNT do
		local angle = (i - 1) * angleStep
		local targetX = pPos.X + math.cos(angle) * radius
		local targetZ = pPos.Z + math.sin(angle) * radius

		local part = spheres[i]
		if part and part.Parent then
			part.Position = Vector3.new(targetX, lockedY, targetZ)
			part.Transparency = 0.2
			part.Color = SPHERE_COLOR
		end
	end
end

local function startVisualLoop()
	if updateConnection then return end
	updateConnection = RunService.RenderStepped:Connect(function()
		pcall(updateCirclePositions)
	end)
end

local function stopVisualLoop()
	if updateConnection then
		updateConnection:Disconnect()
		updateConnection = nil
	end
	hideSpheres()
end

--// Enemy Evaluation (Flat Distance X/Z - Bỏ qua trục Y)
local function evaluateEnemies(checkRadius)
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not root then return false, 0, nil, nil, nil end

	local pPos = root.Position
	local tracked = shared.GetTrackedEnemyData()

	local hasEnemyInRadius = false
	local nearestDist = math.huge
	local nearestName = nil
	local nearestPos = nil
	local totalAlive = 0

	for _, data in ipairs(tracked) do
		if data and data.Root and data.Root.Parent then
			local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
			if hum and hum.Health > 0 then
				totalAlive = totalAlive + 1
				local dx = data.Root.Position.X - pPos.X
				local dz = data.Root.Position.Z - pPos.Z
				local flatDist = math.sqrt(dx * dx + dz * dz)

				if flatDist < nearestDist then
					nearestDist = flatDist
					nearestName = (data.Model and data.Model.Name) or "Enemy"
					nearestPos = data.Root.Position
				end

				if flatDist <= checkRadius then
					hasEnemyInRadius = true
				end
			end
		end
	end

	-- Kiểm tra thêm target hiện tại của AutoFarm nếu có
	local afTarget = tracker.GetTarget()
	if afTarget and afTarget.Root and afTarget.Root.Parent then
		local hum = afTarget.Humanoid or (afTarget.Model and afTarget.Model:FindFirstChildOfClass("Humanoid"))
		if hum and hum.Health > 0 then
			local dx = afTarget.Root.Position.X - pPos.X
			local dz = afTarget.Root.Position.Z - pPos.Z
			local flatDist = math.sqrt(dx * dx + dz * dz)
			if flatDist <= checkRadius then
				hasEnemyInRadius = true
			end
			if flatDist < nearestDist then
				nearestDist = flatDist
				nearestName = (afTarget.Model and afTarget.Model.Name) or "Target"
				nearestPos = afTarget.Root.Position
			end
		end
	end

	return hasEnemyInRadius, totalAlive, nearestName, (nearestDist < math.huge and nearestDist or nil), nearestPos
end


--// Kiểm tra xem đường đi từ người chơi đến mục tiêu có bị chiêu/hazard nào của quái cản đường không
local function isApproachPathBlockedByHazard(pPos, targetPos, maxCheckDist)
	if not targetPos then return false end
	if smartDodge.GetHazardCount and smartDodge.GetHazardCount() == 0 then
		return false
	end

	local diff = targetPos - pPos
	local flatDiff = Vector3.new(diff.X, 0, diff.Z)
	local dist = flatDiff.Magnitude
	if dist < 0.5 then return false end

	local dir = flatDiff.Unit
	local checkLimit = math.min(dist, maxCheckDist or 35.0)

	-- Lấy mẫu các điểm cách nhau 2.5 studs trên đường chạy đến quái
	for d = 2.0, checkLimit, 2.5 do
		local samplePt = pPos + dir * d
		local inDanger, hazardInfo = geometry.IsPointInAnyHazard(samplePt)
		if inDanger then
			local hName = (hazardInfo and hazardInfo.Name) or "Active Hazard"
			return true, hName, samplePt
		end
	end

	return false
end

--// Boss 1 Arena Boundary Helper (Đảm bảo Player luôn phải bước vào trong sàn đấu của Boss 1)
local cachedFirstBossPart = nil

local function getFirstBossArenaPart()
	if cachedFirstBossPart and cachedFirstBossPart.Parent then
		return cachedFirstBossPart
	end
	local p = workspace:FindFirstChild("FirstPart")
	if not p then
		local dungeon = workspace:FindFirstChild("dungeon")
		if dungeon then
			p = dungeon:FindFirstChild("FirstPart", true)
		end
	end
	if not p then
		p = workspace:FindFirstChild("FirstPart", true)
	end
	if p and p:IsA("BasePart") then
		cachedFirstBossPart = p
		return p
	end
	return nil
end

local function getBoss1ArenaInfo()
	local center = smartDodge.GetBoss1ArenaCenter and smartDodge.GetBoss1ArenaCenter()
	local radius = smartDodge.GetBoss1ArenaRadius and smartDodge.GetBoss1ArenaRadius()
	if center and radius and radius > 0 then
		return center, radius
	end

	local fp = getFirstBossArenaPart()
	if fp then
		local r = math.max(fp.Size.X, fp.Size.Z) / 2
		return fp.Position, math.max(20, r - 2.5)
	end
	return nil, nil
end

local function isPlayerInsideBoss1Arena(pPos)
	if not pPos then return true end
	local center, arenaRadius = getBoss1ArenaInfo()
	if not center or not arenaRadius then return true end

	local dist2D = (Vector3.new(pPos.X - center.X, 0, pPos.Z - center.Z)).Magnitude
	return dist2D <= (arenaRadius - 1.5)
end

--// Master Orchestrator Loop
local function startMasterLoop()
	if masterLoopThread then return end

	masterLoopThread = task.spawn(function()
		while masterEnabled do
			-- 0. Kiểm tra tử trận
			if shared.IsDead() then
				if autoFarm.IsEnabled() then
					autoFarm.Toggle(false)
				end
				masterState = "Dead"
				currentHazardName = nil
				currentEscapeDist = 0
				currentTargetName = nil
				currentTargetDist = nil
				fireMasterStatus()
				task.wait(0.2)
				continue
			end

			-- 1. Ưu tiên 1: NGUY HIỂM (DODGE MODE)
			local inDanger = (smartDodge.IsInDanger and smartDodge.IsInDanger())
				or (smartDodge.IsDodging and smartDodge.IsDodging())

			if inDanger then
				lastDodgeTimestamp = os.clock()
				-- Tạm dừng AutoFarm để nhường toàn quyền di chuyển cho Smart Dodge!
				if not autoFarm.IsPaused() then
					autoFarm.SetPaused(true)
				end

				local _, _, hazardName, escapeDist = smartDodge.GetCurrentSafeSpot()
				masterState = "Dodging"
				currentHazardName = hazardName or "Hazard"
				currentEscapeDist = escapeDist or 0

				fireMasterStatus()
				task.wait(0.04)
				continue
			end

			-- 2. Đánh giá quái xung quanh theo Combat Radius R
			local r = radius
			-- Khi đang ở InCombat, mở rộng thêm HYSTERESIS_BUFFER để tránh rung bật/tắt ở mép
			local checkR = (masterState == "InCombat") and (r + HYSTERESIS_BUFFER) or r
			local hasEnemyInRadius, totalAlive, nName, nDist, nPos = evaluateEnemies(checkR)

			currentTargetName = nName
			currentTargetDist = nDist
			currentHazardName = nil
			currentEscapeDist = 0

			-- Ràng buộc nghiêm ngặt Sàn Đấu Boss 1:
			-- Player BẮT BUỘC phải đứng bên trong sàn đấu của Boss 1 (FirstPart)
			local char = player and player.Character
			local root = char and char:FindFirstChild("HumanoidRootPart")
			local pPos = root and root.Position
			local isBossActive = shared.IsBossActive()
			local bossIdx = shared.GetCurrentBossIndex()
			local isBoss1 = isBossActive and (bossIdx <= 1) and (getFirstBossArenaPart() ~= nil)
			local inBoss1Arena = not isBoss1 or isPlayerInsideBoss1Arena(pPos)

			if isBoss1 and not inBoss1Arena then
				-- Người chơi đang đứng ngoài sàn đấu Boss 1 (ví dụ trên lối vào / bậc thềm cao)
				-- Cưỡng chế hasEnemyInRadius = false để bán kính R KHÔNG làm nhân vật dừng lại bên ngoài!
				hasEnemyInRadius = false
			end

			if totalAlive == 0 then
				-- Ưu tiên 4: Toàn bộ quái đã chết (Đã dọn phòng)
				if not autoFarm.IsPaused() then
					autoFarm.SetPaused(true)
				end
				targetFacing.SetEnabled(false)
				masterState = "RoomCleared"
			elseif hasEnemyInRadius then
				-- Ưu tiên 2: CÓ QUÁI TRONG TẦM BÁN KÍNH R -> IN COMBAT!
				-- Tạm dừng bước chân AutoFarm để giữ cự ly chiến đấu (chỉ pause khi chưa pause)
				if not autoFarm.IsPaused() then
					autoFarm.SetPaused(true)
				end

				-- Khôi phục reachDistance chuẩn cho AutoFarm
				if autoFarm.GetReachDistance and autoFarm.SetReachDistance then
					if math.abs(autoFarm.GetReachDistance() - r) > 0.5 then
						autoFarm.SetReachDistance(r)
					end
				end

				-- Tự động khóa mặt vào quái khi trong tầm chiến đấu
				targetFacing.SetEnabled(true)

				masterState = "InCombat"
			else
				-- Ưu tiên 3: QUÁI Ở XA NGOÀI R -> AUTO APPROACH!

				-- KIỂM TRA ĐẶC BIỆT: Đường tiếp cận quái có đang bị chiêu/vùng nguy hiểm chặn không?
				local isPathBlocked, blockingHazardName = isApproachPathBlockedByHazard(pPos, nPos, 35.0)
				local isJustDodged = (os.clock() - lastDodgeTimestamp < 0.6) and (smartDodge.GetHazardCount and smartDodge.GetHazardCount() > 0)

				if isPathBlocked or isJustDodged then
					-- Đường đi đang bị chặn bởi chiêu hoặc vừa né xong chiêu chưa tan!
					-- Tạm dừng AutoFarm, giữ nguyên vị trí an toàn, khóa mặt vào quái
					if not autoFarm.IsPaused() then
						autoFarm.SetPaused(true)
					end
					targetFacing.SetEnabled(true)
					masterState = "WaitingHazard"
					currentHazardName = blockingHazardName or "Active Hazard"
				else
					-- Đường đi an toàn -> Mở đường cho AutoFarm tiếp cận mục tiêu
					targetFacing.SetEnabled(false)

					-- Nếu đang ở Boss 1 và chưa vào trong sàn đấu: Đặt reachDistance thật ngắn (2.5 studs)
					-- để AutoFarm dẫn đường chạy thẳng vào trong sàn đấu chứ không dừng lại ở mép ngoài!
					local effectiveReach = (isBoss1 and not inBoss1Arena) and 2.5 or r
					if autoFarm.GetReachDistance and autoFarm.SetReachDistance then
						if math.abs(autoFarm.GetReachDistance() - effectiveReach) > 0.5 then
							autoFarm.SetReachDistance(effectiveReach)
						end
					end

					if not autoFarm.IsEnabled() then
						autoFarm.SetPaused(false)
						autoFarm.Toggle(true, true)
					else
						autoFarm.SetPaused(false)
					end

					if isBoss1 and not inBoss1Arena then
						masterState = "EnteringArena"
					else
						masterState = "Approaching"
					end
				end
			end

			fireMasterStatus()
			task.wait(0.06)
		end

		masterLoopThread = nil
	end)
end

local function stopMasterLoop()
	masterEnabled = false
	if masterLoopThread then
		task.cancel(masterLoopThread)
		masterLoopThread = nil
	end

	-- Dừng các hệ thống con
	autoFarm.SetPaused(false)
	if autoFarm.IsEnabled() then
		autoFarm.Toggle(false)
	end
	autoSkill.SetEnabled(false)
	targetFacing.SetEnabled(false)
	smartDodge.StopEngine()

	masterState = "Disabled"
	currentHazardName = nil
	currentEscapeDist = 0
	currentTargetName = nil
	currentTargetDist = nil
	fireMasterStatus()
end

--// Public API: Master Switch
function smartAutoPlay.SetMasterEnabled(state)
	local want = state and true or false
	if want == masterEnabled then return end
	masterEnabled = want

	if masterEnabled then
		-- Tuyên bố độc quyền trong coordinator để tắt AutoFarm thủ công cũ nếu có
		coordinator.EnableExclusive("SmartAutoPlay")

		-- Kích hoạt Smart Dodge ngầm (sẵn sàng né frame-0)
		smartDodge.StartEngine()
		smartDodge.SetAutoDodge(true)

		-- Kích hoạt Auto Skill (nếu được bật)
		if smartAutoSkillEnabled then
			autoSkill.SetEnabled(true)
		else
			autoSkill.SetEnabled(false)
		end

		-- Kích hoạt AutoFarm dẫn đường với bán kính dừng R
		if autoFarm.GetReachDistance and autoFarm.SetReachDistance then
			autoFarm.SetReachDistance(radius)
		end
		autoFarm.SetPaused(false)
		autoFarm.Toggle(true, true)

		startMasterLoop()
	else
		stopMasterLoop()
	end
end

function smartAutoPlay.IsMasterEnabled()
	return masterEnabled
end

function smartAutoPlay.SetAutoSkillEnabled(state)
	smartAutoSkillEnabled = state and true or false
	if masterEnabled then
		autoSkill.SetEnabled(smartAutoSkillEnabled)
	else
		autoSkill.SetEnabled(false)
	end
	fireMasterStatus()
end

function smartAutoPlay.IsAutoSkillEnabled()
	return smartAutoSkillEnabled
end

function smartAutoPlay.GetMasterStatus()
	return {
		enabled = masterEnabled,
		state = masterState,
		autoSkillEnabled = smartAutoSkillEnabled,
		hazardName = currentHazardName,
		escapeDist = currentEscapeDist,
		targetName = currentTargetName,
		targetDist = currentTargetDist,
		radius = radius,
	}
end

function smartAutoPlay.OnMasterStatusChanged(callback)
	if type(callback) == "function" then
		table.insert(masterStatusListeners, callback)
	end
end

--// Visual API
function smartAutoPlay.SetShowRadiusCircle(state)
	showRadiusCircle = state and true or false
	if showRadiusCircle then
		startVisualLoop()
	else
		stopVisualLoop()
	end
end

function smartAutoPlay.IsShowRadiusCircleEnabled()
	return showRadiusCircle
end

function smartAutoPlay.SetRadius(val)
	if type(val) == "number" and val > 0 then
		radius = math.clamp(val, 2.0, 100.0)
	end
end

function smartAutoPlay.GetRadius()
	return radius
end

function smartAutoPlay.SetSphereSize(val)
	if type(val) == "number" and val > 0 then
		sphereSize = math.clamp(val, 0.1, 3.0)
		for _, p in ipairs(sphereParts) do
			p.Size = Vector3.new(sphereSize, sphereSize, sphereSize)
		end
	end
end

function smartAutoPlay.GetSphereSize()
	return sphereSize
end

--// Đăng ký Coordinator để hệ thống khác (hoặc phím tắt) có thể tắt Smart Auto Play
coordinator.Register("SmartAutoPlay", smartAutoPlay.SetMasterEnabled, smartAutoPlay.IsMasterEnabled)

--// Tự động tiếp tục hoạt động khi respawn hoặc chuyển map
shared.OnRespawn(function()
	if masterEnabled then
		task.delay(0.5, function()
			if not masterEnabled then return end
			smartDodge.StartEngine()
			smartDodge.SetAutoDodge(true)
			if smartAutoSkillEnabled then
				autoSkill.SetEnabled(true)
			end
			if autoFarm.GetReachDistance and autoFarm.SetReachDistance then
				autoFarm.SetReachDistance(radius)
			end
			autoFarm.SetPaused(false)
			if not autoFarm.IsEnabled() then
				autoFarm.Toggle(true, true)
			end
		end)
	end
end)

--// Lifecycle Cleanup
lifecycle.Register(function()
	smartAutoPlay.SetMasterEnabled(false)
	stopVisualLoop()
	for _, p in ipairs(sphereParts) do
		pcall(function() p:Destroy() end)
	end
	table.clear(sphereParts)
	if visualFolder then
		pcall(function() visualFolder:Destroy() end)
		visualFolder = nil
	end
end)

return smartAutoPlay
end function __DIST.G()-- Tab Combat - Submodule Smart Auto Play (DungeonQuest)
-- Unified Master System: Tích hợp hoàn chỉnh Auto Farm (tiếp cận) + Auto Skill (xả chiêu) + Smart Dodge (né chiêu)


local ui = __DIST.load('g')
local autoSave = __DIST.load('d')
local smartAutoPlay = __DIST.load('F')

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Smart Auto Play - Master System" })

	-- 1. Master Toggle duy nhất
	local masterToggle = leftSection:Toggle({
		Name = "Enable Smart Auto Play",
		Default = smartAutoPlay.IsMasterEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartAutoPlay.SetMasterEnabled(state)
		end),
	}, "Toggle_SAP_Master")

	local masterStatusLabel = leftSection:Label({
		Text = "Status: <font color='rgb(160, 160, 160)'>Disabled</font>",
	})

	-- 2. Combat Radius R & Visuals
	leftSection:Header({ Name = "Combat Radius R & Visuals" })

	leftSection:Toggle({
		Name = "Show Radius Circle (Spheres)",
		Default = smartAutoPlay.IsShowRadiusCircleEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartAutoPlay.SetShowRadiusCircle(state)
		end),
	}, "Toggle_SAP_RadiusCircle")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Combat Radius R",
		Suffix = " std",
		Default = smartAutoPlay.GetRadius(),
		Minimum = 4,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			smartAutoPlay.SetRadius(val)
		end),
	}, "Slider_SAP_Radius"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Sphere Size",
		Suffix = " std",
		Default = smartAutoPlay.GetSphereSize(),
		Minimum = 0.1,
		Maximum = 2.0,
		DisplayMethod = "Round",
		Precision = 2,
		Callback = autoSave.Wrap(function(val)
			smartAutoPlay.SetSphereSize(val)
		end),
	}, "Slider_SAP_SphereSize"))

	-- Right Section: Combat Settings & Monitor
	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Combat & Skill Options" })

	local autoSkill = smartAutoPlay.autoSkill

	rightSection:Toggle({
		Name = "Enable Smart Auto Skill",
		Default = smartAutoPlay.IsAutoSkillEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartAutoPlay.SetAutoSkillEnabled(state)
		end),
	}, "Toggle_SAP_AutoSkill")

	local PLAYSTYLE_OPTIONS = { "Auto (Detect)", "Buff + Damage", "Full Damage" }
	local defaultPlaystyleIdx = 1
	local curMode = autoSkill.GetPlaystyleMode()
	if curMode == "BuffAndDamage" then
		defaultPlaystyleIdx = 2
	elseif curMode == "FullDamage" then
		defaultPlaystyleIdx = 3
	end

	rightSection:Dropdown({
		Name = "Playstyle Mode",
		Options = PLAYSTYLE_OPTIONS,
		Default = defaultPlaystyleIdx,
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			if selected == "Buff + Damage" then
				autoSkill.SetPlaystyleMode("BuffAndDamage")
			elseif selected == "Full Damage" then
				autoSkill.SetPlaystyleMode("FullDamage")
			else
				autoSkill.SetPlaystyleMode("Auto")
			end
		end),
	}, "Dropdown_SAP_PlaystyleMode")

	rightSection:Toggle({
		Name = "Auto Jump When Stuck",
		Default = smartAutoPlay.autoFarm.IsAutoJumpOnStuckEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartAutoPlay.autoFarm.SetAutoJumpOnStuck(state)
		end),
	}, "Toggle_SAP_AutoJumpOnStuck")


	ui.PatchSliderLoadCallback(rightSection:Slider({
		Name = "Cast Interval",
		Suffix = " s",
		Default = autoSkill.GetInterval(),
		Minimum = 0.05,
		Maximum = 1.0,
		DisplayMethod = "Round",
		Precision = 2,
		Callback = autoSave.Wrap(function(val)
			autoSkill.SetInterval(val)
		end),
	}, "Slider_SAP_CastInterval"))

	ui.PatchSliderLoadCallback(rightSection:Slider({
		Name = "Buff Cast Delay",
		Suffix = " s",
		Default = autoSkill.GetBuffDelay(),
		Minimum = 0.05,
		Maximum = 1.0,
		DisplayMethod = "Round",
		Precision = 2,
		Callback = autoSave.Wrap(function(val)
			autoSkill.SetBuffDelay(val)
		end),
	}, "Slider_SAP_BuffDelay"))

	ui.PatchSliderLoadCallback(rightSection:Slider({
		Name = "Combo CD Override (0 = Auto)",
		Suffix = " s",
		Default = autoSkill.GetComboCooldownOverride(),
		Minimum = 0,
		Maximum = 60,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			autoSkill.SetComboCooldownOverride(val)
		end),
	}, "Slider_SAP_ComboCDOverride"))

	rightSection:Button({
		Name = "Scan / Refresh Equipped Skills",
		Callback = function()
			autoSkill.ScanEquippedSkills()
		end,
	})

	-- System Monitor
	rightSection:Header({ Name = "Real-time System Monitor" })

	local stateMonitorLabel = rightSection:Label({
		Text = "State: <font color='rgb(160, 160, 160)'>Disabled</font>",
	})

	local targetMonitorLabel = rightSection:Label({
		Text = "Target: <font color='rgb(160, 160, 160)'>None</font>",
	})

	local dodgeMonitorLabel = rightSection:Label({
		Text = "Smart Dodge: <font color='rgb(160, 160, 160)'>Offline</font>",
	})

	local playstyleMonitorLabel = rightSection:Label({
		Text = "Playstyle: <font color='rgb(160, 160, 160)'>Scanning...</font>",
	})

	local skillsMonitorLabel = rightSection:Label({
		Text = "Skills: <font color='rgb(160, 160, 160)'>Scanning...</font>",
	})

	local comboCdMonitorLabel = rightSection:Label({
		Text = "Combo CD: <font color='rgb(0, 255, 120)'>Ready</font>",
	})

	-- Cập nhật real-time toàn bộ trạng thái Master
	local function updateAllStatus(info)
		pcall(function()
			if not info.enabled then
				masterStatusLabel:UpdateName("Status: <font color='rgb(160, 160, 160)'>Disabled</font>")
				stateMonitorLabel:UpdateName("State: <font color='rgb(160, 160, 160)'>Disabled</font>")
				targetMonitorLabel:UpdateName("Target: <font color='rgb(160, 160, 160)'>None</font>")
				dodgeMonitorLabel:UpdateName("Smart Dodge: <font color='rgb(160, 160, 160)'>Offline</font>")
			elseif info.state == "Dodging" then
				local text = string.format("Status: <font color='rgb(255, 65, 65)'>🛡️ DODGING! Hazard: %s (%.1f std)</font>",
					info.hazardName or "Hazard", info.escapeDist or 0)
				masterStatusLabel:UpdateName(text)
				stateMonitorLabel:UpdateName("State: <font color='rgb(255, 65, 65)'>🛡️ DODGING (Safe Spot Escape)</font>")
				targetMonitorLabel:UpdateName(info.targetName and string.format("Target: %s (%.1f std)", info.targetName, info.targetDist or 0) or "Target: In Range")
				dodgeMonitorLabel:UpdateName(string.format("Smart Dodge: <font color='rgb(255, 65, 65)'>ACTIVE (Dodging %s)</font>", info.hazardName or "Danger"))
			elseif info.state == "InCombat" then
				local targetText = info.targetName and string.format("%s (%.1f std)", info.targetName, info.targetDist or 0) or "In Range"
				masterStatusLabel:UpdateName(string.format("Status: <font color='rgb(0, 255, 120)'>⚔️ IN COMBAT: Casting on %s</font>", targetText))
				stateMonitorLabel:UpdateName("State: <font color='rgb(0, 255, 120)'>⚔️ IN COMBAT (Casting & Holding)</font>")
				targetMonitorLabel:UpdateName("Target: " .. targetText)
				dodgeMonitorLabel:UpdateName("Smart Dodge: <font color='rgb(0, 255, 120)'>Standby (Ready Frame-0)</font>")
			elseif info.state == "WaitingHazard" then
				local targetText = info.targetName and string.format("%s (%.1f std)", info.targetName, info.targetDist or 0) or "Target"
				local text = string.format("Status: <font color='rgb(255, 170, 0)'>⏳ WAITING: %s blocking path (Holding Safe Spot)</font>",
					info.hazardName or "Skill")
				masterStatusLabel:UpdateName(text)
				stateMonitorLabel:UpdateName(string.format("State: <font color='rgb(255, 170, 0)'>⏳ Waiting Hazard (%s)</font>", info.hazardName or "Skill"))
				targetMonitorLabel:UpdateName("Target: " .. targetText)
				dodgeMonitorLabel:UpdateName("Smart Dodge: <font color='rgb(0, 255, 120)'>Holding Safe Spot</font>")
			elseif info.state == "EnteringArena" then
				local targetText = info.targetName and string.format("%s (%.1f std)", info.targetName, info.targetDist or 0) or "Boss 1"
				local text = string.format("Status: <font color='rgb(0, 210, 255)'>🏟️ ENTERING ARENA: Dropping inside Boss 1 Arena (%s)</font>", targetText)
				masterStatusLabel:UpdateName(text)
				stateMonitorLabel:UpdateName("State: <font color='rgb(0, 210, 255)'>🏟️ Entering Boss 1 Arena</font>")
				targetMonitorLabel:UpdateName("Target: " .. targetText)
				dodgeMonitorLabel:UpdateName("Smart Dodge: <font color='rgb(0, 255, 120)'>Standby (Ready Frame-0)</font>")
			elseif info.state == "Approaching" then
				local targetText = info.targetName and string.format("%s (%.1f std)", info.targetName, info.targetDist or 0) or "Searching"
				masterStatusLabel:UpdateName(string.format("Status: <font color='rgb(0, 210, 255)'>🏃 APPROACHING: Moving to %s</font>", targetText))
				stateMonitorLabel:UpdateName("State: <font color='rgb(0, 210, 255)'>🏃 APPROACHING (AutoFarm Pathfind)</font>")
				targetMonitorLabel:UpdateName("Target: " .. targetText)
				dodgeMonitorLabel:UpdateName("Smart Dodge: <font color='rgb(0, 255, 120)'>Standby (Ready Frame-0)</font>")
			elseif info.state == "RoomCleared" then
				masterStatusLabel:UpdateName("Status: <font color='rgb(255, 200, 0)'>🏆 ROOM CLEARED: Waiting for enemies</font>")
				stateMonitorLabel:UpdateName("State: <font color='rgb(255, 200, 0)'>🏆 Room Cleared</font>")
				targetMonitorLabel:UpdateName("Target: None (All Dead)")
				dodgeMonitorLabel:UpdateName("Smart Dodge: <font color='rgb(0, 255, 120)'>Standby</font>")
			elseif info.state == "Dead" then
				masterStatusLabel:UpdateName("Status: <font color='rgb(220, 60, 60)'>💀 DEAD: Waiting for respawn</font>")
				stateMonitorLabel:UpdateName("State: <font color='rgb(220, 60, 60)'>💀 Dead</font>")
				targetMonitorLabel:UpdateName("Target: None")
				dodgeMonitorLabel:UpdateName("Smart Dodge: <font color='rgb(160, 160, 160)'>Paused</font>")
			else
				masterStatusLabel:UpdateName("Status: <font color='rgb(160, 160, 160)'>Idle</font>")
				stateMonitorLabel:UpdateName("State: <font color='rgb(160, 160, 160)'>Idle</font>")
				targetMonitorLabel:UpdateName("Target: None")
				dodgeMonitorLabel:UpdateName("Smart Dodge: <font color='rgb(0, 255, 120)'>Standby</font>")
			end
		end)
	end

	-- Cập nhật real-time thông tin Skill & Playstyle
	local function updateSkillStatus(info)
		pcall(function()
			local style = info.playstyle
			local isSkillOn = smartAutoPlay.IsAutoSkillEnabled()
			local styleText
			if not isSkillOn then
				styleText = "<font color='rgb(160, 160, 160)'>Disabled (Auto Skill Off)</font>"
			elseif style == "BuffAndDamage" then
				styleText = "<font color='rgb(0, 210, 255)'>🛡️ Buff + Damage (Inner Buff Combo)</font>"
			else
				styleText = "<font color='rgb(255, 180, 50)'>⚔️ Full Damage (Q & E Spam)</font>"
			end
			playstyleMonitorLabel:UpdateName("Playstyle: " .. styleText)

			local q = info.skillQ or {}
			local e = info.skillE or {}
			local qBadge = q.isBuff and "<font color='rgb(0, 210, 255)'>[Buff]</font>" or "<font color='rgb(255, 100, 100)'>[Dame]</font>"
			local eBadge = e.isBuff and "<font color='rgb(0, 210, 255)'>[Buff]</font>" or "<font color='rgb(255, 100, 100)'>[Dame]</font>"
			local qCdText = string.format("%.1fs", q.cooldown or 15)
			local eCdText = string.format("%.1fs", e.cooldown or 15)

			skillsMonitorLabel:UpdateName(string.format("Skills: Q: %s %s (%s) | E: %s %s (%s)",
				q.name or "None", qBadge, qCdText,
				e.name or "None", eBadge, eCdText
			))

			if not isSkillOn then
				comboCdMonitorLabel:UpdateName("Combo CD: <font color='rgb(160, 160, 160)'>Disabled</font>")
			elseif style == "BuffAndDamage" then
				local rem = info.cooldownRemaining or 0
				if rem > 0 then
					comboCdMonitorLabel:UpdateName(string.format("Combo CD: <font color='rgb(255, 160, 50)'>⏳ %.1fs remaining</font>", rem))
				else
					comboCdMonitorLabel:UpdateName("Combo CD: <font color='rgb(0, 255, 120)'>⚡ Ready to Cast</font>")
				end
			else
				comboCdMonitorLabel:UpdateName("Combo CD: <font color='rgb(160, 160, 160)'>N/A (Full Damage Mode)</font>")
			end
		end)
	end

	smartAutoPlay.OnMasterStatusChanged(function(info)
		updateAllStatus(info)
		pcall(function()
			if masterToggle and masterToggle.GetState and masterToggle:GetState() ~= info.enabled then
				masterToggle:UpdateState(info.enabled)
			end
		end)
		updateSkillStatus(autoSkill.GetStatus())
	end)
	updateAllStatus(smartAutoPlay.GetMasterStatus())

	autoSkill.OnStatusChanged(updateSkillStatus)
	updateSkillStatus(autoSkill.GetStatus())
end
end function __DIST.H()-- Tab Combat (DungeonQuest): gộp Player (Speed) + Smart Dodge.
-- Mỗi module con render sections vào cùng 2 cột của tab này (gọi theo thứ tự).


return function(window, tab)
__DIST.load('i')(window, tab)
__DIST.load('x')(window, tab)
__DIST.load('y')(window, tab)
__DIST.load('C')(window, tab)
__DIST.load('G')(window, tab)
end

end function __DIST.I()-- Auto Join Dungeon cho DungeonQuest: tạo phòng (createLobby) + whitelist + start dungeon.
-- Scalable: map/độ khó lấy từ dungeonCatalog (động qua getDungeonStats + override map đặc biệt).

--// Imports

local services = __DIST.load('e')
local notifier = __DIST.load('c')
local dungeonCatalog = __DIST.load('k')
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
end function __DIST.J()-- Auto Start Game cho DungeonQuest: chờ tới khi đang ở TRONG dungeon rồi fire
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

return autoStart end function __DIST.K()-- Auto-press nút Start ở LOBBY cho DungeonQuest: chờ nút Start (introGui.title.Frame.
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

return autoStartLobby end function __DIST.L()-- Auto Retry Dungeon cho DungeonQuest: khi reward holder có >= 2 item thì fire replayDungeon.

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
end function __DIST.M()-- Tab Dungeon (DungeonQuest): Auto Join Dungeon scalable.
-- Difficulty dropdown tự update options theo map đang chọn (lấy từ dungeonCatalog).

--// Imports

local ui = __DIST.load('g')
local autoJoin = __DIST.load('I')
local autoStart = __DIST.load('J')
local autoStartLobby = __DIST.load('K')
local autoRetry = __DIST.load('L')
local autoSave = __DIST.load('d')
local dungeonCatalog = __DIST.load('k')

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
		DisplayMethod = "Round",
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
		DisplayMethod = "Round",
		Precision = 0,
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
end function __DIST.N()-- Auto Sell (DungeonQuest): bán vật phẩm trong inventory theo điều kiện lọc.
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
end function __DIST.O()-- Tab Inventory (DungeonQuest): AutoSell section - sell items by filter.
-- Uses multichoice dropdowns for Rarity and Item Type; "Sell Now" sells once
-- after a confirmation dialog.

--// Imports

local autoSave = __DIST.load('d')
local autoSell = __DIST.load('N')
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
end function __DIST.P()-- ESP hitbox cho DungeonQuest.
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
end function __DIST.Q()-- ESP Enemy (Highlight) cho DungeonQuest.
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
end function __DIST.R()-- Map Optimizer (DungeonQuest): Clean Map
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

return mapOptimizer end function __DIST.S()-- Module Visual trong tab Utilities (DungeonQuest): các tính năng hiển thị trực quan.

--// Imports
	
local autoSave = __DIST.load('d')
	local esp = __DIST.load('P')
	local enemyEsp = __DIST.load('Q')
	local mapOptimizer = __DIST.load('R')
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
end function __DIST.T()-- Webhook Discord cho DungeonQuest: gửi thông báo WIN + Reward qua Discord.
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
end function __DIST.U()-- Module Notifications trong tab Utilities (DungeonQuest): cấu hình Webhook Discord.
-- Input webhook URL + toggle bật/tắt + nút test gửi thử + cấu hình ping.

--// Imports

local webhook = __DIST.load('T')

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
end function __DIST.V()
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
end function __DIST.W()--// Anti AFK Universal: ngăn bị kick vì idle (auto click qua VirtualUser).
--// Có thể dùng ở bất kỳ route nào (Universal, Game 2, ...) mà không phụ thuộc game.

--// Imports

local binder = __DIST.load('V')

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
end function __DIST.X()-- Module Mix trong tab Utilities (DungeonQuest): các tiện ích tổng hợp (anti afk, ...).

--// Imports

local autoSave = __DIST.load('d')
local ui = __DIST.load('g')
local antiAfk = __DIST.load('W')

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
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(value)
			antiAfk.SetInterval(value)
		end),
	}, "Slider_AntiAFKInterval"))
end
end function __DIST.Y()-- Tab Utilities (DungeonQuest): gộp Visual + Notifications (Webhook) + Mix (Anti AFK).
-- Mỗi module con render sections vào cùng 2 cột của tab này (gọi theo thứ tự).


return function(window, tab)
__DIST.load('S')(window, tab)
__DIST.load('U')(window, tab)
__DIST.load('X')(window, tab)
end end function __DIST.Z()-- Auto Hide UI cho DungeonQuest: tự ẩn cửa sổ script hub ngay sau khi execute.
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
end function __DIST._()-- Module Config trong tab Configs (DungeonQuest): tự build config section dùng API Maclib
-- (SaveConfig/LoadConfig/RefreshConfigList) và Dropdown (UpdateSelection/IsOption/Value...).
-- Hỗ trợ auto-select config autoload + auto-save (xem core/autoSave).

--// Imports

local macLib = __DIST.load('a')
local autoSave = __DIST.load('d')
local autoHide = __DIST.load('Z')

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
end function __DIST.aa()-- Module State trong tab Configs (DungeonQuest): hiển thị trạng thái thời gian thực.

--// Imports

local shared = __DIST.load('f')
local autoRetry = __DIST.load('L')

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
end function __DIST.ab()-- Tab Configs (DungeonQuest): gộp Config (quản lý config) + State (giám sát realtime).
-- Mỗi module con render sections vào cùng 2 cột của tab này (gọi theo thứ tự).


return function(window, tab)
__DIST.load('_')(window, tab)
__DIST.load('aa')(window, tab)
end end function __DIST.ac()-- DungeonQuest: khởi tạo window + tabs, nạp core logic và các tab UI.


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
	}

	--// Config
	macLib:SetFolder("EsclipseHub")

	--// Tab UI (mỗi tab trigger require các core logic tương ứng)
	local combatTab = __DIST.load('H')
	local dungeonTab = __DIST.load('M')
	local inventoryTab = __DIST.load('O')
	local utilitiesTab = __DIST.load('Y')
	local configsTab = __DIST.load('ab')

	combatTab(window, tabs.Combat)
	dungeonTab(window, tabs.Dungeon)
	inventoryTab(window, tabs.Inventory)
	utilitiesTab(window, tabs.Utilities)
	configsTab(window, tabs.Configs)

	--// Phím tắt
	local shortcuts = __DIST.load('h')
	shortcuts.Init()

	--// Webhook Discord (thông báo WIN + Reward)
	local webhook = __DIST.load('T')
	webhook.Init()
__DIST.load('Q')

	--// Auto Hide UI (ẩn cửa sổ sau khi execute)
	

local autoHide = __DIST.load('Z')
	autoHide.SetWindow(window)
	autoHide.Execute()

	--// Contextual (tự động áp dụng setting theo Dungeon x Target)
	local contextual = __DIST.load('B')
	contextual.Init()

	--// Khởi chạy
	tabs.Combat:Select()

	local coordinator = __DIST.load('j')
	local smartAutoPlay = __DIST.load('F')

	coordinator.SetLocked(true)
	macLib:LoadAutoLoadConfig()

	task.delay(0.3, function()
		coordinator.SetLocked(false)

		-- Đảm bảo Smart Auto Play kích hoạt chính xác nếu toggle được lưu là ON
		local sapOpt = macLib.Options and macLib.Options["Toggle_SAP_Master"]
		if sapOpt and sapOpt:GetState() == true then
			if not smartAutoPlay.IsMasterEnabled() then
				smartAutoPlay.SetMasterEnabled(true)
			end
		end
	end)

	--// Kích hoạt lại autoSave sau khi toàn bộ UI và config đã nạp xong ổn định
	task.delay(1.5, function()
		autoSave.Resume()
	end)
end
end function __DIST.ad()
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

return flags end function __DIST.ae()
--// Imports



local binder = __DIST.load('V')

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
end function __DIST.af()--// Imports

local binder = __DIST.load('V')

--// Variables
local esp = {}

--// Initialize
return binder.Wrap(esp, {
	Enabled = function(value: boolean)
		print(`{value and "Enabled" or "Disabled"} ESP.`)
	end,
}) :: { Enabled: boolean }
end function __DIST.ag()--// Imports

local flags = __DIST.load('ad')
local interface = __DIST.load('ae')
local esp = __DIST.load('af')

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
end function __DIST.ah()--// Variables

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
end function __DIST.ai()--// Functions

local function cast(service: string): any
	return game:GetService(service)
end

--// Initialize
return {
	Players = cast("Players") :: Players,
}
end function __DIST.aj()-- You can go even further by seperating tabs into different files, eg, Game 1/tabs/exploits.luau


return function(self)
	--// Imports
	local base = __DIST.load('ag')
	local utility = __DIST.load('ah')
	local services = __DIST.load('ai')

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
		Load = __DIST.load('ac'),
		UniverseId = 9931749389,
		Places = {
			77649408247578,
			3220968688,
			2414851778,
		},
	},

	{
		Name = "Game 2",
		Load = __DIST.load('aj'),
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
