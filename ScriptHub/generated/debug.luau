--!nocheck
--!nolint

--[[
    @authors YOUR_NAME
    @repository YOUR_REPOSITORY

    This file was automatically generated with darklua, it is not intended for manual editing.
--]]

_P = {
    genDate = "2026-09-05T11:34:48.578079800+00:00",
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
end function __DIST.d()-- Cache toàn bộ services + tham chiếu LocalPlayer dùng chung cho DungeonQuest.

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
end function __DIST.e()-- Engine dùng chung cho DungeonQuest: quản lý state, tracking dungeon/kẻ địch,
-- speed và các API cho module chuyên biệt (autoFarmPathfinder, webhook, ESP...)
-- thao tác lên module này để tránh circular dependency.

--// Imports

local services = __DIST.load('d')
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

local enabled = false
local fastSpeed = 50
local normalSpeed = 16

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

--// Respawn hooks (các module khác đăng ký để reset trạng thái khi respawn)
local respawnCallbacks = {}
local cleanupConnections = {}
local speedConnection = nil

local function trackCleanupConnection(connection)
	if connection then table.insert(cleanupConnections, connection) end
	return connection
end

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
	fireEnemyChanged()
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

--// Humanoid setup
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

--// Ensures dungeon tracking is ready (autoFarmPathfinder dùng).
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
end function __DIST.f()-- Tiện ích UI dùng chung cho các tab DungeonQuest (Maclib).

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
end function __DIST.g()-- Auto-save config cho DungeonQuest: tự động lưu mỗi khi control thay đổi,
-- không cần bấm "Overwrite" thủ công. Chỉ lưu khi có config active đang chọn.

--// Imports

local macLib = __DIST.load('a')
local notifier = __DIST.load('c')

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
end function __DIST.h()-- AutoFarm Pathfinder (v2): cơ chế 2 pha dựa trên state.
--  * Scan 1 lần all enemy -> lock target kẻ địch gần nhất (highlight lock target).
--  * CHASE (chưa trong tầm): Pathfinding di chuyển theo waypoint tới kẻ địch.
--    Heartbeat check khoảng cách player <-> enemy lock realtime.
--  * HOLD (lọt vào tầm skillRange): hủy pathfinding, đứng yên ở chính vị trí hiện tại
--    (orbit tĩnh, tâm là kẻ địch lock, speed 0, giữ nguyên height) + quay mặt enemy
--    + Auto Skill spam Q+E liên tục.
-- Tách biệt hoàn toàn với AutoFarm v1 (orbit).

--// Imports

local services = __DIST.load('d')
local shared = __DIST.load('e')
local lifecycle = __DIST.load('b')
local macLib = __DIST.load('a')

--// Services
local HttpService = game:GetService("HttpService")

--// Persistence (nhớ trạng thái debug overlay giữa các lần execute)
local SETTINGS_FILE = macLib.Folder .. "/settings/pathfinder-debug.json"
local ANCHORS_FILE = macLib.Folder .. "/settings/anchors.json"

--// State persist (khai báo TRƯỚC các hàm load/save để tham chiếu đúng local, không phải global).
local visualDebug = true
local respawnOnNoPath = true --// khi cả path enemy + anchor đều fail -> self-kill để respawn
local anchorFallback = false --// toggle: có dùng anchor để reach (fallback) khi nopath enemy hay không (mặc định tắt)
local showAnchorMarkers = true --// hiện marker vị trí các anchor đã đặt

--// Anchor: nhóm theo MAP (dungeon). anchors[mapName] = mảng { id, room, pos } theo thứ tự đặt.
--// Khi nopath, pathfinder reach anchor tiếp theo của map hiện tại (ưu tiên room hiện tại) để
--// path graph tiếp tục hoạt động thay vì kill/reset player. Lưu riêng file anchors.json để dùng
--// lại giữa các lần chơi (mỗi map có danh sách anchor riêng, giống contextual).
local anchors = {} --// { [mapName] = { {id, room, pos}, ... } }
local anchorSeq = 0 --// id tăng dần toàn cục, dùng để phân biệt/xóa ổn định

local function loadDebugSettings()
	if not (isfile and isfile(SETTINGS_FILE)) then return end
	local ok, decoded = pcall(function()
		return HttpService:JSONDecode(readfile(SETTINGS_FILE))
	end)
	if ok and type(decoded) == "table" then
		if decoded.enabled ~= nil then visualDebug = decoded.enabled == true end
		if decoded.showAnchors ~= nil then showAnchorMarkers = decoded.showAnchors == true end
	end
end

local function saveDebugSettings()
	if not (isfile and writefile) then return end
	pcall(function()
		writefile(SETTINGS_FILE, HttpService:JSONEncode({
			enabled = visualDebug,
			showAnchors = showAnchorMarkers,
		}))
	end)
end

--// ---------- Anchor persistence (tách file riêng, chia theo map) ----------
local function anchorToSerialized(a)
	return { id = a.id, room = a.room, pos = { a.pos.X, a.pos.Y, a.pos.Z } }
end

local function loadAnchors()
	if not (isfile and isfile(ANCHORS_FILE)) then return end
	local ok, decoded = pcall(function()
		return HttpService:JSONDecode(readfile(ANCHORS_FILE))
	end)
	if not ok or type(decoded) ~= "table" then return end
	anchors = {}
	anchorSeq = 0
	for mapName, list in pairs(decoded) do
		if type(mapName) == "string" and #mapName > 0 and type(list) == "table" then
			local out = {}
			for _, entry in ipairs(list) do
				local room = typeof(entry.room) == "number" and entry.room or nil
				local id = typeof(entry.id) == "number" and entry.id or nil
				local pos = nil
				if typeof(entry.pos) == "table" and typeof(entry.pos[1]) == "number"
					and typeof(entry.pos[2]) == "number" and typeof(entry.pos[3]) == "number" then
					pos = Vector3.new(entry.pos[1], entry.pos[2], entry.pos[3])
				end
				if room and id and pos then
					table.insert(out, { id = id, room = room, pos = pos })
					if id > anchorSeq then anchorSeq = id end
				end
			end
			if #out > 0 then anchors[mapName] = out end
		end
	end
end

local function saveAnchors()
	if not (isfile and writefile) then return end
	local out = {}
	for mapName, list in pairs(anchors) do
		local arr = {}
		for i = 1, #list do arr[i] = anchorToSerialized(list[i]) end
		out[mapName] = arr
	end
	pcall(function()
		writefile(ANCHORS_FILE, HttpService:JSONEncode(out))
	end)
end

--// References
local RunService = services.RunService
local VirtualInputManager = services.VirtualInputManager
local player = services.player
local PathfindingService = game:GetService("PathfindingService")

--// Table
local autoFarmPathfinder = {}

--// Configuration (state)
local enabled = false
local running = false
local skillRange = 70
local moveSpeed = 50
	local retargetInterval = 1.0 --// giữ cho accessor/UI cũ không lỗi; không còn điều khiển poll (event-driven)
local skillEnabled = true
local skillInterval = 0.5
local skillMode = "Alternate" --// "Both" = Q+E cùng lúc, "Alternate" = Q -> E -> Q -> E
local skillTurn = 0 --// dùng cho mode Alternate (0 = Q, 1 = E)

--// Runtime
local moveConnection = nil
local enemyChangedConnection = nil --// sự kiện enemy đổi -> reselect target (event-driven)
local respawnConnection = nil --// reset trạng thái khi nhân vật respawn
local lastSkillTime = 0
local cachedNearestEnemy = nil --// cache enemy gần nhất trong 1 frame (tránh gọi getNearestEnemy nhiều lần)
local cachedNearestValid = false
local selectToken = 0 --// generation token cho lần chọn target theo path-cost (hủy kết quả cũ khi có reselect mới xen vào)
local selectRunning = false --// đang chạy cost-select async (chặn heartbeat tự chọn lại bằng straight-line gây phá kết quả)
local RESCAN_TARGET_INTERVAL = 2 --// giây: rescan theo chu kì chọn lại target theo path-cost (bắt cost thay đổi khi enemy di chuyển)
local lastRescanTargetAt = 0
local dunReady = false
local currentPath = nil
local waypointIndex = 1
local pathComputed = false
local chaseTarget = nil
local autoRotateOwner = false
local autoRotateHumanoid = nil
local oldAutoRotate = nil
local debugTargetPart = nil
local debugEnemyHighlight = nil
local debugPathParts = {} --// các sphere xanh lá show path
local debugAnchorParts = {} --// marker (part + label) hiện vị trí anchor đã đặt
local holdAngle = nil
local holdRadius = nil
local lockedTargetModel = nil
local chaseModel = nil
local chasePathTargetModel = nil
local pathIsAnchor = false --// path hiện tại là đi tới anchor (không phải enemy)
local anchorWalking = false --// ĐANG Ở LUỒNG DI CHUYỂN ANCHOR RIÊNG: hiện là no-op (debug), chỉ để giữ trạng thái
--// và tránh retry/log lại mỗi frame khi đang fallback anchor.
local lastFallbackLogAt = 0 --// throttle log rơi vào fallback anchor (chỉ in 1 lần mỗi episode, không spam)
local anchorStuckPos = nil --// vị trí theo dõi kẹt nhẹ khi đi ở luồng anchor walk
local anchorStuckTimer = 0 --// thời gian đứng im trong luồng anchor walk
local ANCHOR_STUCK_WINDOW = 1.0 --// giây: đứng im quá lâu khi đi anchor thì rebuild path 1 lần
--// Free-walk sau khi hết anchor: đi thẳng trong FREE_WALK_DURATION để băng qua khúc navmesh không
--// phủ, rồi quay lại pathfinding (resume CHASE). KHÔNG liên quan enemy. Hướng đi: ưu tiên theo
--// anchor1 -> anchor2 của room (nếu room có đủ 2 anchor); ngược lại fallback theo hướng đang nhìn.
local freeWalkActive = false
local freeWalkDir = nil --// hướng đi (Vector3 ngang, đơn vị) cố định trong suốt free-walk
local freeWalkTimer = 0 --// thời gian còn lại của free-walk
local freeWalkDest = nil --// đích MoveTo rất xa phía trước theo hướng đã chọn (đi thẳng đáng tin cậy)
local FREE_WALK_DURATION = 1.5 --// giây đi thẳng mỗi lần hết anchor
local FREE_WALK_DISTANCE = 40 --// stud: đích MoveTo cách player (đủ xa để đi thẳng trong FREE_WALK_DURATION)
--// Gate path build theo STATE (không theo time cooldown): chỉ build path khi thật sự cần.
--// Spam trước đây do khi nopath, computeChasePath retry cùng enemy mỗi frame vô hạn. Giải pháp:
--// nhớ target (enemy + vị trí đích) của lần build FAIL gần nhất; KHÔNG retry build path tới cùng
--// target unreachable (player/enemy chưa dịch chuyển đáng kể) -> đứng yên/đi anchor thay vì spam.
--// Chỉ build lại khi: target đổi, hoặc vị trí đích đã dịch chuyển > REPATH_TOL.
local lastFailedModel = nil --// enemy model của lần build path fail gần nhất
local lastFailedDest = nil --// vị trí đích (enemy) của lần build fail gần nhất
local REPATH_TOL = 3 --// stud: đích dịch chuyển trên mức này thì đủ điều kiện build lại
--// Cooldown retry path cho cùng 1 enemy + đích đứng yên: stand không "khoá cứng" mà thử lại
--// build path sau mỗi RETRY_COOLDOWN giây (chống spam mỗi frame, vẫn tự hồi phục khi có đường).
local lastFailedTime = 0 --// os.clock() của lần build path fail gần nhất
local RETRY_COOLDOWN = 1.0 --// giây giữa 2 lần retry build path cùng enemy đứng yên
--// Chống self-kill lặp liên tục khi thật sự không path được (kill xong respawn -> lại thử).
local lastSelfKillTime = 0
local SELF_KILL_COOLDOWN = 1.0
--// Stuck detection: phát hiện đứng im dù path đang chạy -> chạy chuỗi gỡ kẹt:
--// nhảy -> strafe trái -> strafe phải -> reset player (Health=0 để game respawn).
--// (vật cản thấp/kệ mép mà path không đánh dấu Jump waypoint).
local stuckCheckPos = nil
local stuckCheckTimer = 0
local stuckStage = 0 --// 0=chưa xử lý, 1=đã nhảy, 2=đang strafe trái, 3=đang strafe phải, 4=đã reset
local stuckStrafeDir = 0 --// -1 = trái, 1 = phải
local stuckStrafeEndTime = 0
local STUCK_DIST = 0.3 --// tiến tới < 0.3 stud (ngang, không tính Y) sau cửa sổ => kẹt
local STUCK_WINDOW = 0.6 --// giây đứng im trước khi chuyển bước xử lý kẹt
local STUCK_STRAFE_DIST = 5 --// độ lệch sang trái/phải khỏi waypoint
local STUCK_STRAFE_HOLD = 1.0 --// giây duy trì hướng strafe trước khi kiểm tra lại

--// Helpers
local function getPlayerRoot()
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if root and root.Parent then return root end
	return nil
end

--// Đọc vị trí của root an toàn (đề phòng root bị destroy/rm giữa chừng lúc enemy chết
--// -> tránh throw lỗi làm abort stepMovement, gây "state=CHASE nhưng không di chuyển").
local function getSafePosition(part)
	if not part or not part.Parent then return nil end
	local ok, pos = pcall(function()
		return part.Position
	end)
	if not ok or not pos then return nil end
	return pos
end

--// Lấy kẻ địch gần nhất theo khoảng cách tới player.
local function getNearestEnemy()
	local playerRoot = getPlayerRoot()
	if not playerRoot then return nil end
	local playerPos = getSafePosition(playerRoot)
	if not playerPos then return nil end
	local nearest = nil
	local nearestDist = math.huge
	for _, data in ipairs(shared.GetTrackedEnemyData()) do
		if data and data.Root and data.Root.Parent then
			local rootPos = getSafePosition(data.Root)
			if rootPos then
				local dist = (rootPos - playerPos).Magnitude
				if dist < nearestDist then
					nearestDist = dist
					nearest = data
				end
			end
		end
	end
	return nearest
end

--// Lấy data theo model cụ thể (dùng cho enemy bị khóa trong HOLD).
local function getEnemyByModel(model)
	if not model then return nil end
	for _, data in ipairs(shared.GetTrackedEnemyData()) do
		if data and data.Model == model and data.Root and data.Root.Parent then
			return data
		end
	end
	return nil
end

--// Khôi phục AutoRotate lúc tắt luồng hoặc khi đổi nhân vật.
local function restoreAutoRotate()
	if not autoRotateOwner then return end
	local humanoid = autoRotateHumanoid or shared.GetHumanoid()
	if humanoid and humanoid.Parent then humanoid.AutoRotate = oldAutoRotate end
	autoRotateOwner = false
	autoRotateHumanoid = nil
	oldAutoRotate = nil
end

--// Tắt AutoRotate khi có humanoid để không chống đối việc xoay thủ công.
--// Nếu đổi nhân vật (respawn) thì capture lại AutoRotate của nhân vật mới.
local function ensureAutoRotateDisabled()
	local humanoid = shared.GetHumanoid()
	if not humanoid or not humanoid.Parent then return end
	if autoRotateOwner and humanoid == autoRotateHumanoid then return end
	if autoRotateOwner then restoreAutoRotate() end
	oldAutoRotate = humanoid.AutoRotate
	humanoid.AutoRotate = false
	autoRotateHumanoid = humanoid
	autoRotateOwner = true
end

--// Bật lại AutoRotate cho CHASE: MoveTo sẽ tự xoay nhân vật theo hướng đi,
--// đúng hành vi Click-to-Move của Roblox. Tắt lại ở HOLD để xoay thủ công.
local function ensureAutoRotateEnabled()
	if not autoRotateOwner then return end
	local humanoid = autoRotateHumanoid or shared.GetHumanoid()
	if humanoid and humanoid.Parent then humanoid.AutoRotate = true end
	autoRotateOwner = false
	autoRotateHumanoid = nil
	oldAutoRotate = nil
end

local PATH_PARAMS = {
	AgentRadius = 1,
	AgentHeight = 5,
	AgentCanJump = true,
	AgentCanClimb = true,
	AgentMaxSlope = 75,
	WaypointSpacing = 2,
	Costs = { Water = 20, Lava = 20 },
}

--// Fallback: nới lỏng hơn nữa khi path chính fail (địa hình phức tạp, navmesh gaps, bậc thang cao).
local PATH_PARAMS_RELAXED = {
	AgentRadius = 0.25,
	AgentHeight = 4,
	AgentCanJump = true,
	AgentCanClimb = true,
	AgentMaxSlope = 90,
	WaypointSpacing = 6,
	Costs = {},
}

--// ---------- Chọn target bằng CHI PHÍ PATH (thay cho "nearest straight-line") ----------
--// Lý do: map dungeon nhiều tầng/độ cao — "gần nhất" theo đường thẳng thường lệch xa chi phí thật
--// (phải đi vòng/leo qua chokepoint). Ví dụ 3 chốt A->B->C: enemy ở C gần theo đường thẳng nhưng thật
--// ra phải đi qua B; đáng lẽ enemy B nằm trên đường phải được xử trước — trước đây cost không tính nên
--// đi xuyên qua B. Vì path tới B luôn ngắn hơn path tới C nên cách này tự quét dần từng chốt theo
--// thứ tự đi thật chứ không bỏ sót enemy trên đường.
--// Ước lượng chi phí di chuyển từ start tới dest qua Pathfinding (tổng độ dài waypoint theo ngang).
--// Trả về số stud hoặc nil nếu không tính được path.
--// Có cache: cùng 1 enemy (đích) được rescan định kỳ mỗi RESCAN_TARGET_INTERVAL. Chỉ tái dùng
--// kết quả cũ khi CẢ player (start) và enemy (dest) chưa dịch chuyển đáng kể — giảm gọi
--// PathfindingService (tốn CPU) mà không ảnh hưởng độ chính xác khi bot đang di chuyển.
local COST_CACHE_TOL = 3 --// stud: start hoặc dest dịch chuyển dưới mức này thì tái dùng cost
local costCache = {} --// { [model] = { keyStart = Vector3, keyDest = Vector3, cost = number } }
local function measurePathCost(start, dest, model)
	if model then
		local hit = costCache[model]
		if hit and hit.cost ~= nil and hit.keyDest
			and (hit.keyDest - dest).Magnitude <= COST_CACHE_TOL
			and (hit.keyStart - start).Magnitude <= COST_CACHE_TOL then
			return hit.cost
		end
	end
	local path = PathfindingService:CreatePath(PATH_PARAMS)
	local ok = pcall(function() path:ComputeAsync(start, dest) end)
	local waypoints = nil
	if ok and path.Status == Enum.PathStatus.Success then
		waypoints = path:GetWaypoints()
	end
	pcall(function() path:Destroy() end)
	if not waypoints or #waypoints == 0 then return nil end
	local total = 0
	local prev = start
	for i = 1, #waypoints do
		local w = waypoints[i].Position
		local dx, dz = w.X - prev.X, w.Z - prev.Z
		total += math.sqrt(dx * dx + dz * dz)
		prev = w
	end
	if model then
		costCache[model] = { keyStart = start, keyDest = dest, cost = total }
	end
	return total
end

--// Gán target mới nếu khác target hiện tại: hủy path cũ (frame sau sẽ rebuild sang target mới).
--// Giải phóng lock HOLD nếu enemy bị lock đã biến mất.
local function commitTarget(model)
	if model == chaseModel then return chaseModel end
	chaseModel = model
	if currentPath then pcall(function() currentPath:Destroy() end) end
	currentPath = nil
	pathComputed = false
	chasePathTargetModel = nil
	if lockedTargetModel and not getEnemyByModel(lockedTargetModel) then
		lockedTargetModel = nil
		holdAngle = nil
		holdRadius = nil
	end
	return chaseModel
end

--// Chạy async: tính path cost cho từng enemy, chọn con có cost nhỏ nhất rồi commit.
--// Duyệt theo khoảng cách NGANG tăng dần + prune bằng cận dưới (pathLen >= khoảng cách ngang):
--// tới con kế mà khoảng cách ngang đã >= bestCost hiện tại thì các con sau không thể rẻ hơn -> dừng.
--// Chạy trong task.spawn nên CHASE vẫn đi theo target cũ trong lúc tính; guard bằng selectToken khi
--// có reselect mới xen giữa chừng (enemy spawn/chết liên tục) để bỏ kết quả cũ.
local function kickOffCostSelect(fallbackNearest)
	selectToken += 1
	local token = selectToken
	if selectRunning then return end
	selectRunning = true
	task.spawn(function()
		local ok, err = pcall(function()
			local playerRoot = getPlayerRoot()
			local playerPos = playerRoot and getSafePosition(playerRoot) or nil
			local chosen = nil
			local chosenCost = math.huge
			if playerPos then
				local candidates = {}
				for _, data in ipairs(shared.GetTrackedEnemyData()) do
					if data and data.Root and data.Root.Parent then
						local rp = getSafePosition(data.Root)
						if rp then
							local dx, dz = rp.X - playerPos.X, rp.Z - playerPos.Z
							local straight = math.sqrt(dx * dx + dz * dz)
							table.insert(candidates, { data = data, straight = straight })
						end
					end
				end
				table.sort(candidates, function(a, b) return a.straight < b.straight end)
				for i = 1, #candidates do
					if token ~= selectToken then return end
					local cand = candidates[i]
					if cand.straight >= chosenCost then break end
					local cpos = getSafePosition(cand.data.Root)
					if cpos then
						local cost = measurePathCost(playerPos, cpos, cand.data.Model)
						if token ~= selectToken then return end
						if cost and cost < chosenCost then
							chosenCost = cost
							chosen = cand.data
						end
					end
				end
				--// Trong lúc tính, nếu có enemy lọt vào tầm thẳng thì ưu tiên HOLD ngay chứ không chọn theo cost.
				if not chosen or chosenCost > skillRange then
					local nearest = getNearestEnemy()
					if nearest then
						local np = getSafePosition(nearest.Root)
						if np then
							local dx, dz = np.X - playerPos.X, np.Z - playerPos.Z
							if math.sqrt(dx * dx + dz * dz) <= skillRange then chosen = nearest end
						end
					end
				end
			end
			if not enabled or not running then return end
			if anchorWalking then return end --// đang rơi vào luồng anchor: không commit, tránh hủy path anchor
			if chosen then
				commitTarget(chosen.Model)
			elseif fallbackNearest then
				commitTarget(fallbackNearest.Model)
			end
		end)
		selectRunning = false
		if not ok then
			warn(("[PathSelector] lỗi cost-select: %s"):format(tostring(err)))
		end
	end)
end

--// Tìm anchor cần reach khi nopath của ROOM hiện tại: chỉ trả về anchor ĐẦU TIÊN chưa visited
--// của room (theo thứ tự đặt). Anchor thứ 2 của room KHÔNG được target/đi tới — nó chỉ dùng để
--// định hướng free-walk (anchor1 -> anchor2). Hết anchor hợp lệ -> trả nil (để vào free-walk).
--// Trả về Vector3 hoặc nil.
local nearAnchorTol = 5

local refreshAnchorMarkers --// forward ref (định nghĩa sau)

--// Quét anchor map hiện tại THEO VỊ TRÍ mỗi frame: anchor nào player đang đứng gần (<= nearAnchorTol)
--// mà đã TỪNG ở xa nó (wasFar) -> đánh dấu visited (đã đi qua/tiến tới nó từ xa). Trả về true nếu có
--// thay đổi (để refresh marker đổi màu + không target lại). KHÔNG mark ngay khi player chỉ đứng
--// sẵn gần anchor từ đầu (anchor thường đặt tại vị trí đang đứng) để không mất anchor chưa thực sự dùng.
local function sweepNearbyAnchors(playerPos)
	local mapName = shared.GetCurrentDungeonName()
	local list = (type(mapName) == "string" and anchors[mapName]) or nil
	if not list then return false end
	local current = shared.GetCurrentRoomIndex()
	current = (type(current) == "number" and current) or -1
	local changed = false
	for _, a in ipairs(list) do
		--// Gate THEO ROOM: chỉ đánh dấu visited khi ĐÚNG room của anchor (anchor room nào tới đó
		--// mới tính). Lúc chuyển room (current<=0) không đánh dấu bất kỳ anchor nào.
		if a.room ~= current then continue end
		local d = a.pos and playerPos and (a.pos - playerPos).Magnitude or math.huge
		if not a.visited and d > nearAnchorTol then
			a.wasFar = true
		elseif not a.visited and a.wasFar and d <= nearAnchorTol then
			a.visited = true
			a.wasFar = nil
			changed = true
		end
	end
	if changed then refreshAnchorMarkers() end
	return changed
end

local function findNextAnchor()
	local mapName = shared.GetCurrentDungeonName()
	local list = (type(mapName) == "string" and anchors[mapName]) or nil
	if not (type(mapName) == "string" and #mapName > 0) or not list then return nil end

	local current = shared.GetCurrentRoomIndex()
	current = (type(current) == "number" and current) or -1

	--// Gate THEO ROOM: chỉ dùng anchor khi ĐANG TRONG đúng 1 room đang có quái (current == room anchor).
	--// current = room của enemy đang track; lúc CHUYỂN ROOM (xong quái room này, chờ quái room sau)
	--// thì không còn quái -> current = 0 -> KHÔNG được dùng anchor nào (tránh nhảy target sang
	--// anchor room khác khi chưa tới đó). Anchor room nào chỉ áp dụng khi current == room đó.
	if current <= 0 then return nil end

	--// Chỉ trả về anchor ĐẦU TIÊN của room hiện tại (nếu chưa visited). Anchor thứ 2 bỏ qua:
	--// nó chỉ định hướng free-walk (anchor1 -> anchor2), không có vai trò đi tới.
	for _, a in ipairs(list) do
		if a.room == current then
			if a.visited then return nil end
			return a.pos
		end
	end
	return nil
end

--// Lấy (tối đa 2) anchor của ROOM hiện tại theo thứ tự đặt (lọc đúng room). Dùng cho free-walk:
--// room có đủ 2 anchor -> hướng đi thẳng là anchor1 -> anchor2; chưa đủ 2 -> fallback hướng nhìn.
local function getRoomAnchors()
	local mapName = shared.GetCurrentDungeonName()
	local list = (type(mapName) == "string" and anchors[mapName]) or nil
	if not list or #list == 0 then return {} end
	local current = shared.GetCurrentRoomIndex()
	current = (type(current) == "number" and current) or -1
	local out = {}
	for _, a in ipairs(list) do
		if a.room == current and a.pos then
			out[#out + 1] = a.pos
			if #out >= 2 then break end
		end
	end
	return out
end

--// Thử build path từ start tới dest với 2 bộ params (chính + relaxed).
--// Mount path thành path hiện tại nếu thành công. Trả về true/false.
local function tryBuildPath(start, dest, mountModel, isAnchor)
	if currentPath then pcall(function() currentPath:Destroy() end) end
	for _, params in ipairs({ PATH_PARAMS, PATH_PARAMS_RELAXED }) do
		local path = PathfindingService:CreatePath(params)
		local ok = pcall(function()
			path:ComputeAsync(start, dest)
		end)
		if ok and path.Status == Enum.PathStatus.Success and #path:GetWaypoints() > 0 then
			chaseTarget = dest
			chasePathTargetModel = mountModel
			pathIsAnchor = isAnchor == true
			--// Build path thành công -> xoá marker target fail trước đó, cho phép build lại khi cần.
			lastFailedModel = nil
			lastFailedDest = nil
			--// Path BỊ CHẶN (blocked). Với path ANCHOR: CHỈ tear-down khi THỰC SỰ KẸT (stuckStage>=1,
			--// tức không tiến được trong STUCK_WINDOW). PathfindingService có thể fire Blocked với
			--// failedWaypointIndex = nil/0 (block tổng quát) -> nếu bỏ path theo index sẽ tear-down
			--// MỖI FRAME -> rebuild path anchor liên tục cùng 1 đích (spam "REBUILD" + "Lock keep",
			--// nhân vật "đi rồi cố về" lặp lại). Vì vậy KHÔNG tear-down theo index; đích ổn định,
			--// chỉ rebuild khi kẹt thật (stuck detection) hoặc khi đi hết waypoint.
			path.Blocked:Connect(function()
				if isAnchor then
					if stuckStage >= 1 then
						if visualDebug then warn("[PathAnchor] anchor path blocked + đang kẹt -> rebuild") end
						currentPath = nil
						pathComputed = false
					end
					return
				end
				currentPath = nil
				pathComputed = false
			end)
			currentPath = path
			waypointIndex = 1
			pathComputed = true
			return true
		end
		path:Destroy()
	end
	return false
end

--// CHASE: path từ vị trí player theo pathfinder tới kẻ địch gần nhất (retarget theo interval).

--// Trả về true nếu đã có path, false nếu không tính được.
--// Nhận sẵn enemy + targetPos (đã có từ stepMovement) để tránh gọi getNearestEnemy lại lần nữa.
--// Nếu path tới enemy không tính được (nopath), thử reach anchor của room hiện tại/kế bên
--// trước khi bỏ cuộc (kill để respawn).
local function computeChasePath(enemy, targetPos)
	local playerRoot = getPlayerRoot()
	if not playerRoot then return false end
	local playerPos = getSafePosition(playerRoot)
	if not playerPos then return false end
	if not enemy or not targetPos then
		currentPath = nil
		pathComputed = false
		chaseTarget = nil
		chasePathTargetModel = nil
		pathIsAnchor = false
		return false
	end

	local start = playerPos

	--// 1) Thử path tới enemy (params chính → relaxed). Thành công -> thoát luồng anchor,
	--// lần nopath sau sẽ vào anchor lại từ đầu.
	if tryBuildPath(start, targetPos, enemy.Model, false) then
		--// Có path tới enemy -> KHÔNG ở luồng anchor nữa (chase bình thường).
		anchorWalking = false
		return true
	end

	--// 2) Nopath tới enemy -> FALLBACK ANCHOR (chỉ khi toggle anchorFallback bật). Tìm anchor hợp lệ
	--// cho room hiện tại (findNextAnchor) rồi vào luồng di chuyển anchor riêng. Khi tắt toggle -> bỏ qua
	--// hẳn, rơi thẳng xuống "cả 2 fail" (stand hoặc self-kill theo respawnOnNoPath).
	if anchorFallback then
		local anchorPos = findNextAnchor()
		if anchorPos then
			--// Set pathComputed=true để qua gate (line slide) KHÔNG re-invoke computeChasePath mỗi frame,
			--// chống spam ngay cả khi divert không kịp — đánh dấu đã "xử lý xong" lần này.
			pathComputed = true
			pathIsAnchor = true
			anchorWalking = true
			local now = os.clock()
			if now - lastFallbackLogAt >= 3 then
				lastFallbackLogAt = now
				warn("[PathAnchor] FALLBACK: đang rơi vào anchor cho room hiện tại")
			end
			return true
		end
	end

	--// Cả path enemy + anchor đều fail.
	currentPath = nil
	pathComputed = false
	chaseTarget = nil
	chasePathTargetModel = nil
	pathIsAnchor = false
	anchorWalking = false
	--// Nhớ target FAIL này để không retry build path vô hạn cùng enemy (spam). Chỉ build lại khi
	--// enemy đổi hoặc đích đã dịch chuyển > REPATH_TOL (xem gate trong stepMovement).
	lastFailedModel = enemy.Model
	lastFailedDest = targetPos
	lastFailedTime = os.clock()
	if visualDebug then warn("[PathAnchor] no enemy path, no anchor -> " .. (respawnOnNoPath and "self-kill" or "stand")) end
	--// Self-kill (respawn) chỉ khi bật toggle, và CÓ COOLDOWN để không kill lặp liên tục mỗi frame
	--// khi thật sự không path được (kill -> respawn -> thử lại sau quãng nghỉ).
	if respawnOnNoPath and os.clock() - lastSelfKillTime >= SELF_KILL_COOLDOWN then
		lastSelfKillTime = os.clock()
		local h = shared.GetHumanoid()
		if h and h.Parent then h.Health = 0 end
	end
	return false
end

--// Bắn combo Q+E (giống Auto Skill).
--// Mode "Both": bấm Q+E cùng lúc mỗi interval.
--// Mode "Alternate": luân phiên Q -> E -> Q -> E ... mỗi interval 1 phím.
local function fireSkills()
	if not skillEnabled then return end
	if os.clock() - lastSkillTime < skillInterval then return end
	local humanoid = shared.GetHumanoid()
	if not humanoid or not humanoid.Parent or humanoid.Health <= 0 then return end
	if shared.IsInLobby() then return end
	lastSkillTime = os.clock()

	local function pressKey(key)
		VirtualInputManager:SendKeyEvent(true, key, false, game)
		task.delay(shared.GetKeyHoldTime(), function()
			VirtualInputManager:SendKeyEvent(false, key, false, game)
		end)
	end

	if skillMode == "Alternate" then
		local key = (skillTurn == 0) and Enum.KeyCode.Q or Enum.KeyCode.E
		skillTurn = 1 - skillTurn
		pressKey(key)
	else
		pressKey(Enum.KeyCode.Q)
		pressKey(Enum.KeyCode.E)
	end
end

--// (Skill-fire đã gộp vào pipeline frame của stepMovement — tái dùng enemy/vị trí đã resolve,
--// chỉ 1 lần resolve + 1 lần đo khoảng cách mỗi frame, không spam scan.)

--// ---------- Visual debug ----------

local function ensureDebugTargetPart()
	if debugTargetPart and debugTargetPart.Parent then return debugTargetPart end
	debugTargetPart = Instance.new("Part")
	debugTargetPart.Name = "PathfinderTarget_Debug"
	debugTargetPart.Anchored = true
	debugTargetPart.CanCollide = false
	debugTargetPart.CanQuery = false
	debugTargetPart.CanTouch = false
	debugTargetPart.Size = Vector3.new(2, 2, 2)
	debugTargetPart.Transparency = 0.4
	debugTargetPart.Color = Color3.fromRGB(255, 0, 0)
	debugTargetPart.Material = Enum.Material.Neon
	debugTargetPart.Parent = workspace
	return debugTargetPart
end

--// Highlight dùng CHUNG 1 instance làm con workspace + đổi qua Adornee mỗi frame.
--// Lý do: nếu làm con của model enemy thì enemy chết -> model bị destroy -> highlight
--// chết theo và để lại instance rác gây lỗi "destroyed" ở frame sau (highlight 1s rồi hết).
local function ensureDebugHighlight()
	if debugEnemyHighlight and debugEnemyHighlight.Parent then return debugEnemyHighlight end
	if debugEnemyHighlight then
		pcall(function() debugEnemyHighlight:Destroy() end)
		debugEnemyHighlight = nil
	end
	debugEnemyHighlight = Instance.new("Highlight")
	debugEnemyHighlight.Name = "PathfinderEnemy_Debug"
	debugEnemyHighlight.FillColor = Color3.fromRGB(255, 200, 0)
	debugEnemyHighlight.FillTransparency = 0.5
	debugEnemyHighlight.OutlineColor = Color3.fromRGB(255, 0, 0)
	debugEnemyHighlight.OutlineTransparency = 0
	debugEnemyHighlight.Parent = workspace
	return debugEnemyHighlight
end

--// Cập nhật ô đỏ tại điểm đuổi (enemy khi CHASE) + highlight kẻ địch gần nhất.
local function updateDebugVisuals()
	if shared.IsInLobby() then return end
	if not visualDebug then return end

	if chaseTarget then
		local part = ensureDebugTargetPart()
		part.CFrame = CFrame.new(chaseTarget)
	elseif debugTargetPart and debugTargetPart.Parent then
		debugTargetPart.CFrame = CFrame.new(0, -1000, 0)
	end

	--// Highlight target hiện tại: lock (HOLD) nếu có, ngược lại nearest (CHASE).
	local model = nil
	if lockedTargetModel then
		local locked = getEnemyByModel(lockedTargetModel)
		model = locked and locked.Model or nil
	end
	if not model then
		--// Dùng enemy cache của frame hiện tại nếu khả dụng, tránh scan lại toàn bộ.
		local nearest = cachedNearestValid and cachedNearestEnemy or getNearestEnemy()
		model = nearest and nearest.Model or nil
	end
	local highlight = ensureDebugHighlight()
	if not model or not model.Parent then
		highlight.Enabled = false
		return
	end
	highlight.Adornee = model
	highlight.Enabled = true
end

--// Render path bằng các sphere xanh lá tại từng waypoint.
--// Chỉ rebuild khi path đổi (currentPath mới), tránh destroy/create mỗi frame.
local DEBUG_PATH_SPHERE_SIZE = 0.9
local debugPathCachePath = nil
local function updateDebugPathSpheres()
	if not visualDebug then
		if #debugPathParts > 0 then
			for _, part in ipairs(debugPathParts) do
				pcall(function() part:Destroy() end)
			end
			table.clear(debugPathParts)
		end
		return nil
	end
	if currentPath == debugPathCachePath then return nil end

	for _, part in ipairs(debugPathParts) do
		pcall(function() part:Destroy() end)
	end
	table.clear(debugPathParts)
	debugPathCachePath = currentPath

	if not currentPath or not pathComputed then return nil end

	local ok, waypoints = pcall(function() return currentPath:GetWaypoints() end)
	if not ok or not waypoints then return nil end
	for i = 1, #waypoints do
		local wp = waypoints[i]
		if wp then
			local sphere = Instance.new("Part")
			sphere.Name = "PathfinderPath_Debug"
			sphere.Anchored = true
			sphere.CanCollide = false
			sphere.CanQuery = false
			sphere.CanTouch = false
			sphere.Size = Vector3.new(DEBUG_PATH_SPHERE_SIZE, DEBUG_PATH_SPHERE_SIZE, DEBUG_PATH_SPHERE_SIZE)
			sphere.Shape = Enum.PartType.Ball
			sphere.Transparency = 0.3
			sphere.Color = Color3.fromRGB(0, 255, 120)
			sphere.Material = Enum.Material.Neon
			sphere.CFrame = CFrame.new(wp.Position)
			sphere.Parent = workspace
			debugPathParts[#debugPathParts + 1] = sphere
		end
	end
end

--// ---------- Anchor markers (đánh dấu vị trí anchor đã đặt) ----------

local function cleanupAnchorMarkers()
	for _, part in ipairs(debugAnchorParts) do
		pcall(function() part:Destroy() end)
	end
	table.clear(debugAnchorParts)
end

local function cleanupDebugVisuals()
	if debugTargetPart then
		pcall(function() debugTargetPart:Destroy() end)
		debugTargetPart = nil
	end
	if debugEnemyHighlight then
		pcall(function() debugEnemyHighlight:Destroy() end)
		debugEnemyHighlight = nil
	end
	for _, part in ipairs(debugPathParts) do
		pcall(function() part:Destroy() end)
	end
	table.clear(debugPathParts)
	debugPathCachePath = nil
end

--// Render lại toàn bộ marker theo anchors của MAP hiện tại (không gọi nếu tắt showAnchorMarkers).
--// Chỉ được gọi từ các thao tác set/remove/clear + đổi map + khi reach anchor (không chạy mỗi frame).
--// Anchor đã reach (visited) vẽ màu XANH LÁ, chưa reach màu XANH DƯƠNG.
refreshAnchorMarkers = function()
	if not showAnchorMarkers then
		cleanupAnchorMarkers()
		return
	end
	local mapName = shared.GetCurrentDungeonName()
	local list = {}
	if type(mapName) == "string" and #mapName > 0 and anchors[mapName] then
		list = anchors[mapName]
	end

	for _, part in ipairs(debugAnchorParts) do
		pcall(function() part:Destroy() end)
	end
	table.clear(debugAnchorParts)

	for index, a in ipairs(list) do
		local visited = a.visited == true
		local color = visited and Color3.fromRGB(0, 200, 120) or Color3.fromRGB(0, 150, 255)
		local sphere = Instance.new("Part")
		sphere.Name = "PathfinderAnchor_Debug"
		sphere.Anchored = true
		sphere.CanCollide = false
		sphere.CanQuery = false
		sphere.CanTouch = false
		sphere.Size = Vector3.new(2, 2, 2)
		sphere.Transparency = 0.3
		sphere.Color = color
		sphere.Material = Enum.Material.Neon
		sphere.CFrame = CFrame.new(a.pos)
		sphere.Parent = workspace
		debugAnchorParts[#debugAnchorParts + 1] = sphere

		local label = Instance.new("BillboardGui")
		label.Name = "PathfinderAnchorLabel"
		label.Adornee = sphere
		label.Size = UDim2.fromOffset(120, 30)
		label.StudsOffset = Vector3.new(0, 2, 0)
		label.AlwaysOnTop = true
		local text = Instance.new("TextLabel")
		text.Size = UDim2.fromScale(1, 1)
		text.BackgroundTransparency = 1
		text.Text = ("R%d #%d%s"):format(a.room, index, visited and " ✓" or "")
		text.TextColor3 = color
		text.TextSize = 14
		text.Font = Enum.Font.GothamBold
		text.TextStrokeTransparency = 0
		text.Parent = label
		label.Parent = sphere
		debugAnchorParts[#debugAnchorParts + 1] = label
	end
end

--// Reset trạng thái phát hiện kẹt khi thoát khỏi pha di chuyển theo path.
local function resetStuckCheck()
	stuckCheckPos = nil
	stuckCheckTimer = 0
	stuckStage = 0
	stuckStrafeDir = 0
end

--// Dọn toàn bộ state runtime (path/target/lock/stuck/select/anchor) để tái sử dụng
--// cho cả trường hợp Toggle off và respawn. KHÔNG dọn kết nối/Heartbeat (do caller quản lý).
local function resetRuntimeState()
	if currentPath then pcall(function() currentPath:Destroy() end) end
	currentPath = nil
	pathComputed = false
	chaseTarget = nil
	holdAngle = nil
	holdRadius = nil
	lockedTargetModel = nil
	chaseModel = nil
	chasePathTargetModel = nil
	pathIsAnchor = false
	anchorWalking = false
	freeWalkActive = false
	freeWalkDir = nil
	freeWalkDest = nil
	cachedNearestEnemy = nil
	cachedNearestValid = false
	table.clear(costCache) --// enemy cũ có thể đã bị destroy -> dọn cache cost để không giữ ref rác
	selectToken += 1 --// hủy cost-select đang chạy (nếu có)
	selectRunning = false
	lastRescanTargetAt = 0
	lastFailedModel = nil
	lastFailedDest = nil
	lastFailedTime = 0
	resetStuckCheck()
end

--// ---------- Event-driven: chọn/chuyển target theo sự kiện (không poll theo interval) ----------

--// Chọn lại target MỘT LẦN (do sự kiện enemy đổi trigger). Nếu target model khác
--// target hiện tại thì hủy path cũ (frame sau sẽ rebuild sang target mới). Giải phóng lock HOLD
--// nếu enemy bị lock đã biến mất. Trả về model mục tiêu mới (hoặc nil).
--// CHỌN TARGET: enemy trong tầm thẳng -> lock ngay (HOLD). Ngược lại chọn theo CHI PHÍ PATH
--// async (không block CHASE hiện tại) thay vì "nearest straight-line" — xem kickOffCostSelect.
local function reselectTarget()
	local playerRoot = getPlayerRoot()
	if not playerRoot then return end
	local nearest = getNearestEnemy()
	cachedNearestEnemy = nearest
	cachedNearestValid = nearest ~= nil
	--// ĐANG Ở LUỒNG ANCHOR WALK: chỉ cập nhật cache target, KHÔNG đụng tới path anchor đang đi
	--// (enemy spawn/die trong lúc di chuyển tới anchor KHÔNG được làm gián đoạn path). Khi thoát
	--// luồng anchor sẽ reselect lại bình thường.
	if anchorWalking then return chaseModel end
	--// Enemy trong tầm thẳng -> lock ngay, không cần tính path cost.
	if nearest then
		local npos = getSafePosition(nearest.Root)
		local ppos = getSafePosition(playerRoot)
		if npos and ppos then
			local dx, dz = npos.X - ppos.X, npos.Z - ppos.Z
			if math.sqrt(dx * dx + dz * dz) <= skillRange then
				return commitTarget(nearest.Model)
			end
		end
	end
	if not nearest then return commitTarget(nil) end
	--// Không ai trong tầm -> chọn bằng path cost. Trong lúc tính, CHASE vẫn đi theo target hiện tại.
	kickOffCostSelect(nearest)
	return chaseModel
end

--// Sự kiện tập enemy track thay đổi (thêm/xoá) -> reselect target tức thì, không chờ poll.
local function onEnemyChanged()
	if not enabled or not running then return end
	reselectTarget()
end

--// Nhân vật respawn (tự kill / chết) -> dọn path cũ + target cũ, chờ reselect sau.
	local function onRespawn()
	resetRuntimeState()
	reselectTarget() --// chọn lại target (ưu tiên path-cost) ngay sau respawn, không chờ event
end

--// Bước hành động tiếp theo của chuỗi gỡ kẹt: nhảy -> strafe trái -> strafe phải
--// -> reset player (giết nhân vật để game respawn về spawn room).
local function advanceStuckAction(humanoid)
	if stuckStage == 0 then
		stuckStage = 1
		humanoid.Jump = true
	elseif stuckStage == 1 then
		stuckStage = 2
		stuckStrafeDir = -1
		stuckStrafeEndTime = os.clock() + STUCK_STRAFE_HOLD
	elseif stuckStage == 2 then
		stuckStage = 3
		stuckStrafeDir = 1
		stuckStrafeEndTime = os.clock() + STUCK_STRAFE_HOLD
	elseif stuckStage == 3 then
		stuckStage = 4
		if humanoid and humanoid.Parent then
			humanoid.Health = 0
		end
		resetStuckCheck()
	end
end

--// LUỒNG DI CHUYỂN ANCHOR RIÊNG (fallback): vẽ path tới anchor của room hiện tại 1 lần rồi đi
--// thẳng tới đó theo pathfinder (theo địa hình). KHÔNG xử lý enemy, không chuyển HOLD khi enemy vào
--// tầm, không retarget. Khi tới anchor -> đánh dấu visited. Hết anchor hợp lệ (hoặc nopath tới anchor)
--// -> FREE-WALK đi thẳng theo hướng định sẵn rồi thoát luồng (về CHASE bình thường).
local function stepAnchorWalking(deltaTime, humanoid, playerRoot)
	local playerPos = getSafePosition(playerRoot)
	if not playerPos then return end

	local function exitAnchorFlow()
		anchorWalking = false
		pathIsAnchor = false
		anchorStuckPos = nil
		anchorStuckTimer = 0
	end

	--// Nếu toggle anchorFallback bị tắt (giữa chừng hoặc trước đó) -> thoát luồng anchor ngay.
	if not anchorFallback then
		exitAnchorFlow()
		return
	end

	--// Chưa có path anchor -> build path tới anchor hợp lệ 1 lần rồi bắt đầu đi (không build lại
	--// mỗi frame). Nopath tới anchor (hoặc hết anchor hợp lệ) -> rơi thẳng vào FREE-WALK (không
	--// thoát luồng giữa chừng để rồi vào lại → tránh spam log mỗi frame).
	if not currentPath then
		local anchorPos = findNextAnchor()
		if anchorPos and tryBuildPath(playerPos, anchorPos, nil, true) then
			anchorStuckPos = nil
			anchorStuckTimer = 0
			return --// vừa build xong, frame sau đi theo waypoint
		end
		--// Hết anchor hợp lệ trong room (đã visited) HOẶC nopath tới anchor -> FREE-WALK: đi thẳng
		--// trong FREE_WALK_DURATION để băng qua khúc navmesh không phủ, rồi quay lại CHASE (resume).
		--// Hướng đi ưu tiên theo anchor1 -> anchor2 của room (nếu có đủ 2 anchor), ngược lại theo
		--// hướng nhìn. KHÔNG liên quan enemy. Hết thời gian -> thoát luồng anchor (về CHASE/stand/self-kill).
		if not freeWalkActive then
			freeWalkActive = true
			freeWalkTimer = FREE_WALK_DURATION
			--// Hướng đi: nếu room hiện tại có đủ 2 anchor thì đi theo hướng anchor1 -> anchor2
			--// (anchor thứ 2 chỉ dùng để định hướng, không vai trò khác). Ngược lại fallback theo
			--// hướng NHÌN thực tế (LookVector của HumanoidRootPart). KHÔNG dùng Orientation.Y /
			--// FindFirstChild("HumanoidRootPart") vì playerRoot CHÍNH là HumanoidRootPart
			--// (getPlayerRoot trả root) -> FindFirstChild trả nil -> cũ code luôn ra hướng +X,
			--// sai hướng nhìn. Chuẩn hoá về mặt phẳng XZ.
			local roomAnchors = getRoomAnchors()
			if #roomAnchors >= 2 then
				local d = roomAnchors[2] - roomAnchors[1]
				freeWalkDir = Vector3.new(d.X, 0, d.Z)
			else
				local look = playerRoot.CFrame.LookVector
				freeWalkDir = Vector3.new(look.X, 0, look.Z)
			end
			if freeWalkDir.Magnitude < 0.01 then
				freeWalkDir = Vector3.new(0, 0, -1)
			else
				freeWalkDir = freeWalkDir.Unit
			end
			--// Đích tạm rất xa phía trước theo hướng đã chọn -> MoveTo đi thẳng. Dùng chung cơ chế
			--// MoveTo như toàn bộ pathfinder (đáng tin cậy hơn humanoid:Move(vector) — cái sau
			--// dễ bị mất hiệu lực sau một MoveTo trước đó, làm "đứng im không đi").
			freeWalkDest = playerPos + freeWalkDir * FREE_WALK_DISTANCE
			if #roomAnchors >= 2 then
				if visualDebug then warn(("[PathAnchor] hết anchor -> FREE-WALK %gs theo hướng anchor1->anchor2"):format(FREE_WALK_DURATION)) end
			elseif visualDebug then
				warn(("[PathAnchor] hết anchor -> FREE-WALK %gs theo hướng nhìn"):format(FREE_WALK_DURATION))
			end
		end
		--// Đi thẳng theo hướng cố định (không cần path). MoveTo đích rất xa -> nhân vật bước thẳng,
		--// Humanoid tự nhân với WalkSpeed.
		ensureAutoRotateEnabled()
		humanoid:MoveTo(freeWalkDest)
		freeWalkTimer -= deltaTime
		if freeWalkTimer <= 0 then
			freeWalkActive = false
			freeWalkDir = nil
			freeWalkDest = nil
			exitAnchorFlow()
			return
		end
		return
	end

	local waypoints = currentPath:GetWaypoints()
	if not waypoints or #waypoints == 0 then
		currentPath = nil
		pathComputed = false
		return
	end
	if waypointIndex > #waypoints then
		--// Đã đi hết waypoint = ĐÃ TỚI anchor đích. Mark visited anchor có pos trùng chaseTarget
		--// (findNextAnchor chỉ target 1 anchor duy nhất của room) — không đo lại khoảng cách để
		--// tránh lệch vài stud gây rebuild lặp. Frame kế: hết anchor hợp lệ -> rơi vào free-walk.
		local mapName = shared.GetCurrentDungeonName()
		local list = (type(mapName) == "string" and anchors[mapName]) or nil
		if list then
			for _, a in ipairs(list) do
				if not a.visited and a.pos and chaseTarget and (a.pos - chaseTarget).Magnitude <= nearAnchorTol then
					a.visited = true
					refreshAnchorMarkers()
					if visualDebug then warn(("[PathAnchor] TỚI anchor (R%d) -> visited"):format(a.room)) end
					break
				end
			end
		end
		currentPath = nil
		pathComputed = false
		return --// frame kế: findNextAnchor hết anchor -> rơi vào free-walk
	end

	--// Đi theo waypoint giống CHASE (Click-to-Move, pathfinder theo địa hình): nhân vật tự đi + tự quay.
	ensureAutoRotateEnabled()
	local wp = waypoints[waypointIndex]
	local dest = wp.Position
	local pos = playerPos
	local toDest = Vector3.new(dest.X - pos.X, 0, dest.Z - pos.Z)
	local dist = toDest.Magnitude
	local tolerate = (wp.Action == Enum.PathWaypointAction.Jump and 2.5) or 2.0

	if dist <= tolerate then
		waypointIndex += 1
		if wp.Action == Enum.PathWaypointAction.Jump then humanoid.Jump = true end
		return
	end

	humanoid:MoveTo(dest)

	--// Kẹt nhẹ: đứng im quá lâu thì để frame sau rebuild path 1 lần (vòng vật cản). KHÔNG dùng chuỗi
	--// gỡ phức tạp / self-respawn của luồng chung vì anchor chỉ cần hoàn thành 1 path di chuyển tới đích.
	if anchorStuckPos then
		if (playerPos - anchorStuckPos).Magnitude > 0.5 then
			anchorStuckPos = playerPos
			anchorStuckTimer = 0
		else
			anchorStuckTimer += deltaTime
			if anchorStuckTimer >= ANCHOR_STUCK_WINDOW then
				anchorStuckPos = nil
				anchorStuckTimer = 0
				currentPath = nil
				pathComputed = false
			end
		end
	else
		anchorStuckPos = playerPos
		anchorStuckTimer = 0
	end
end

--// HOLD: enemy trong tầm -> lock, orbit tốc độ thấp (center = enemy), quay mặt enemy + spam skill.
--// Tách riêng khỏi stepMovement để cô lập lỗi: nếu phần CFrame/velocity của 1 frame throw thì chỉ
--// ảnh hưởng frame đó (được log ở caller), không làm abrt toàn bộ pipeline CHASE/anchor.
local function stepHold(deltaTime, humanoid, playerRoot, enemy, enemyPos, playerPos)
	ensureAutoRotateDisabled()
	--// Skill-fire: tái dùng enemy + vị trí đã resolve trong frame này (không resolve lại 2 lần/frame).
	if skillEnabled then fireSkills() end
	--// Huỷ MoveTo của CHASE trước đó để không chống đối việc set CFrame thủ công.
	pcall(function() humanoid:MoveTo(playerPos) end)
	if not lockedTargetModel then lockedTargetModel = enemy.Model end
	if currentPath then pcall(function() currentPath:Destroy() end) end
	currentPath = nil
	pathComputed = false
	chaseTarget = nil
	resetStuckCheck()
	--// Capture góc & bán kính từ vị trí hiện tại lúc vào HOLD.
	--// Dùng offset = playerPos - enemyPos (hướng từ enemy tới player) để
	--// orbitPos == vị trí player hiện tại, tránh bị dội ngược phía đối diện.
	local offsetXZ = Vector3.new(playerPos.X - enemyPos.X, 0, playerPos.Z - enemyPos.Z)
	if not holdAngle then
		holdAngle = math.atan2(offsetXZ.Z, offsetXZ.X)
		holdRadius = offsetXZ.Magnitude
	end
	--// Vị trí mong muốn trên quỹ đạo quanh enemy (theo enemy di chuyển)
	local orbitPos = Vector3.new(
		enemyPos.X + math.cos(holdAngle) * holdRadius,
		playerPos.Y,
		enemyPos.Z + math.sin(holdAngle) * holdRadius
	)
	--// Xích mượt về orbitPos (đứng yên nếu đã đúng vị trí, theo enemy nếu enemy di chuyển)
	local pos = playerPos
	local toOrbit = Vector3.new(orbitPos.X - pos.X, 0, orbitPos.Z - pos.Z)
	local dist = toOrbit.Magnitude
	local thisStep = moveSpeed * math.max(deltaTime, 1 / 60)
	local newPos = pos
	if dist > 0.01 then
		if dist <= thisStep then
			newPos = Vector3.new(orbitPos.X, pos.Y, orbitPos.Z)
		else
			newPos = pos + toOrbit.Unit * thisStep
		end
	end
	playerRoot.CFrame = CFrame.lookAt(newPos, enemyPos)
	playerRoot.AssemblyLinearVelocity = Vector3.zero
	playerRoot.AssemblyAngularVelocity = Vector3.zero
end

--// CHASE: pathfinder tới vị trí enemy; ra khỏi tầm -> giải phóng lock, build/follow path, gỡ kẹt.
--// Tách riêng để lỗi ở phần move/waypoint của 1 frame không làm abrt pipeline cùng frame.
local function stepChase(deltaTime, humanoid, playerRoot, enemy, enemyPos, playerPos)
	holdAngle = nil
	holdRadius = nil
	lockedTargetModel = nil
	--// Path stale khi target hiện tại KHÁC target của path (enemy cũ chết / retarget
	--// sang con khác) -> hủy path ngay để recompute sang target mới, không đi tiếp
	--// theo path cũ dẫn tới chỗ xác (gây "state=CHASE nhưng không di chuyển").
	--// LƯU Ý: chỉ áp dụng cho path ENEMY (chasePathTargetModel là model enemy). Path ANCHOR
	--// được build với chasePathTargetModel = nil; nếu để điều kiện này chạy thì `nil ~= enemy.Model`
	--// luôn đúng -> path anchor bị destroy + rebuild lại từ đầu MỖI FRAME -> nhân vật "đi 1 chút
	--// rồi vòng về đầu path" lặp lại. Vì vậy bỏ qua khi pathIsAnchor.
	if not pathIsAnchor and currentPath and chasePathTargetModel and chasePathTargetModel ~= enemy.Model then
		pcall(function() currentPath:Destroy() end)
		currentPath = nil
		pathComputed = false
	end
	if not pathComputed or not currentPath then
		--// Gate theo STATE: chỉ build path khi thật sự cần (target đổi / đích dịch chuyển đáng kể /
		--// hoặc đã qua RETRY_COOLDOWN kể từ lần fail gần nhất). Stand không khoá cứng — sau quãng
		--// nghỉ cooldown nó thử lại build path (có đường mới sẽ chạy tiếp), chống spam mỗi frame.
		local sameFailedTarget = lastFailedModel ~= nil and lastFailedModel == enemy.Model
			and lastFailedDest ~= nil and (enemyPos - lastFailedDest).Magnitude <= REPATH_TOL
		if not sameFailedTarget or os.clock() - lastFailedTime >= RETRY_COOLDOWN then
			local ok = computeChasePath(enemy, enemyPos)
			if ok then
				resetStuckCheck()
				return --// đã có path, frame sau đi theo waypoint
			end
			--// computeChasePath tự kill player khi cả 2 lần fail -> không cần xử lý thêm.
			return
		end
		return
	end

	local waypoints = currentPath:GetWaypoints()
	if not waypoints or #waypoints == 0 then
		currentPath = nil
		pathComputed = false
		return
	end
	if waypointIndex > #waypoints then
		if visualDebug and pathIsAnchor then
			warn(("[PathAnchor] anchor path HOÀN THÀNH (đã đi hết waypoint idx=%d) -> tính lại"):format(waypointIndex))
		end
		pathComputed = false
		return
	end

	--// Di chuyển theo chuẩn Click-to-Move: Humanoid:MoveTo + AutoRotate bật,
	--// nhân vật tự đi + tự quay theo hướng di chuyển (animation, va chạm).
	ensureAutoRotateEnabled()

	local wp = waypoints[waypointIndex]
	local dest = wp.Position
	local pos = playerPos
	local toDest = Vector3.new(dest.X - pos.X, 0, dest.Z - pos.Z)
	local dist = toDest.Magnitude
	local tolerate = (wp.Action == Enum.PathWaypointAction.Jump and 2.5) or 2.0

	--// Stuck: lệch hướng sang trái/phải khỏi waypoint để vòng qua vật cản.
	if stuckStage >= 2 and os.clock() < stuckStrafeEndTime and dist > 0.01 then
		local dir = toDest.Unit
		local perp = Vector3.new(-dir.Z, 0, dir.X)
		dest = dest + perp * (stuckStrafeDir * STUCK_STRAFE_DIST)
		toDest = Vector3.new(dest.X - pos.X, 0, dest.Z - pos.Z)
		dist = toDest.Magnitude
	end

	if dist <= tolerate then
		waypointIndex += 1
		--// Waypoint Jump: bảo humanoid nhảy qua chướng ngại.
		if wp.Action == Enum.PathWaypointAction.Jump then
			humanoid.Jump = true
		end
		resetStuckCheck()
		return
	end

	humanoid:MoveTo(dest)

	--// Stuck detection: path có nhưng nhân vật đứng im (kẹt vật cản thấp mà path
	--// không đánh dấu Jump) -> chạy chuỗi gỡ: nhảy -> strafe trái -> strafe phải
	--// -> reset player. Dừng ngay khi tự tiến tới được (so khoảng cách NGANG để
	--// nhảy lên tại chỗ không bị tính nhầm là đã thoát kẹt).
	if stuckCheckPos then
		local delta = playerPos - stuckCheckPos
		local moved = Vector3.new(delta.X, 0, delta.Z).Magnitude
		if moved > STUCK_DIST then
			stuckCheckPos = playerPos
			stuckCheckTimer = 0
			stuckStage = 0
			stuckStrafeDir = 0
		else
			stuckCheckTimer += deltaTime
			if stuckCheckTimer >= STUCK_WINDOW then
				stuckCheckPos = playerPos
				stuckCheckTimer = 0
				--// Kẹt thật sự (không tiến được). Nếu đang đi path ANCHOR thì dọn path để frame kế
				--// rebuild lại từ vị trí hiện tại (sau bước gỡ kẹt), vòng quanh vật cản thật sự.
				if pathIsAnchor then
					currentPath = nil
					pathComputed = false
					if visualDebug then warn("[PathAnchor] stuck while anchor path -> dọn path để re-route") end
				end
				advanceStuckAction(humanoid)
			end
		end
	else
		stuckCheckPos = playerPos
		stuckCheckTimer = 0
	end
end

--// Di chuyển: CHASE theo trạng thái, HOLD khi enemy trong tầm.
--// Orchestrator: resolve chung (guards, rescan, target) rồi dispatch HOLD/CHASE vào từng hàm
--// riêng, mỗi hàm chạy trong 1 pcall độc lập để lỗi 1 phase không abrt cả frame.
local function stepMovement(deltaTime)
	if shared.IsInLobby() then return end
	if not dunReady then return end

	local playerRoot = getPlayerRoot()
	local humanoid = shared.GetHumanoid()
	if not playerRoot or not playerRoot.Parent or not humanoid or not humanoid.Parent or humanoid.Health <= 0 then
		currentPath = nil
		pathComputed = false
		cachedNearestValid = false
		return
	end

	--// RESCAN THEO CHU KÌ: định kỳ chọn lại target bằng path-cost (ngoài event-driven), để bắt
	--// trường hợp enemy di chuyển làm cost thay đổi mà tập enemy không đổi (event không fire).
	--// KHÔNG rescan khi đang LOCK HOLD (tránh nhảy target giữa các con trong tầm).
	local rescanNow = os.clock()
	if rescanNow - lastRescanTargetAt >= RESCAN_TARGET_INTERVAL then
		lastRescanTargetAt = rescanNow
		if not lockedTargetModel then reselectTarget() end
	end
	--// Guard debug: chỉ render khi bật visualDebug (tránh call mỗi frame khi tắt).
	if visualDebug then
		updateDebugVisuals()
		updateDebugPathSpheres()
	end

	--// LUỒNG DI CHUYỂN ANCHOR RIÊNG: khi đang fallback anchor, chuyển hẳn sang hàm chuyên biệt,
	--// KHÔNG chạy CHASE/HOLD (không xử lý enemy khi đang đi tới anchor). Nếu đang trong luồng này thì
	--// bỏ qua mọi logic khác để "vẽ path 1 lần, đi thẳng tới đích" — không spam, không can thiệp.
	if anchorWalking then
		stepAnchorWalking(deltaTime, humanoid, playerRoot)
		return
	end

	--// Target được duy trì EVENT-DRIVEN qua shared.OnEnemyChanged -> reselectTarget().
	--// Heartbeat CHỈ thực thi (follow path / HOLD), KHÔNG poll scan hay đổi target theo interval.
	local enemy
	if lockedTargetModel then
		--// Đang HOLD -> bám enemy đã lock, không retarget.
		enemy = getEnemyByModel(lockedTargetModel)
		if not enemy then
			lockedTargetModel = nil
			holdAngle = nil
			holdRadius = nil
		end
	end
	if not enemy then
		--// enemy theo chaseModel (đã cập nhật bởi event). Nếu model cũ mất mà event chưa tới thì
		--// xoá chaseModel để reselect sau; KHÔNG scan lại mỗi frame.
		enemy = getEnemyByModel(chaseModel)
		if not enemy then
			chaseModel = nil
			--// Fallback: không có chaseModel nhưng vẫn có enemy đang track (ví dụ sau
			--// respawn, tập enemy không đổi nên OnEnemyChanged không fire) → chọn lại ngay.
			--// TRÁNH CHÈN ÉP: nếu đang có lần chọn theo path-cost (selectRunning) thì KHÔNG tự
			--// chọn straight-line ở đây — đứng yên chờ cost-select commit, kẻo phá kết quả chọn.
			local nearest = getNearestEnemy()
			if nearest and not selectRunning then
				chaseModel = nearest.Model
				enemy = nearest
			end
		end
	end
	cachedNearestEnemy = enemy
	cachedNearestValid = enemy ~= nil
	if not enemy or not enemy.Root or not enemy.Root.Parent then
		--// Không có target -> đứng yên. Event OnEnemyChanged sẽ reselect khi có enemy mới.
		if currentPath then pcall(function() currentPath:Destroy() end) end
		currentPath = nil
		pathComputed = false
		chaseTarget = nil
		pcall(function() humanoid:MoveTo(getSafePosition(playerRoot)) end)
		return
	end

	local enemyPos = enemy and getSafePosition(enemy.Root) or nil
	local playerPos = getSafePosition(playerRoot)
	if not enemyPos or not playerPos then
		return
	end

	--// Đánh dấu anchor đã đi qua (visited) theo vị trí thực tế -> đổi màu + không target lại.
	--// KHÔNG huỷ path ở đây: việc hủy path ngay lúc vừa build khiến player "đi chút rồi vòng về"
	--// (vì anchor thường đặt tại vị trí đang đứng, nên player luôn trong tầm nearAnchorTol).
	sweepNearbyAnchors(playerPos)

	local flat = Vector3.new(enemyPos.X - playerPos.X, 0, enemyPos.Z - playerPos.Z)
	if flat.Magnitude <= skillRange then
		local ok, err = pcall(stepHold, deltaTime, humanoid, playerRoot, enemy, enemyPos, playerPos)
		if not ok then
			warn(("[AutoFarmPathfinder] lỗi HOLD: %s"):format(tostring(err)))
		end
		return
	end

	local ok, err = pcall(stepChase, deltaTime, humanoid, playerRoot, enemy, enemyPos, playerPos)
	if not ok then
		warn(("[AutoFarmPathfinder] lỗi CHASE: %s"):format(tostring(err)))
	end
end

--// ---------- Accessors (tab UI dùng) ----------

function autoFarmPathfinder.IsEnabled()
	return enabled
end

function autoFarmPathfinder.GetSkillRange()
	return skillRange
end

function autoFarmPathfinder.SetSkillRange(value)
	skillRange = tonumber(value) or skillRange
end

function autoFarmPathfinder.GetMoveSpeed()
	return moveSpeed
end

function autoFarmPathfinder.SetMoveSpeed(value)
	moveSpeed = tonumber(value) or moveSpeed
end

function autoFarmPathfinder.GetRetargetInterval()
	return retargetInterval
end

function autoFarmPathfinder.SetRetargetInterval(value)
	retargetInterval = tonumber(value) or retargetInterval
end

function autoFarmPathfinder.IsSkillEnabled()
	return skillEnabled
end

function autoFarmPathfinder.SetSkillEnabled(value)
	skillEnabled = value == true
end

function autoFarmPathfinder.GetSkillInterval()
	return skillInterval
end

function autoFarmPathfinder.SetSkillInterval(value)
	local raw = tonumber(value) or skillInterval
	--// Clamp tối thiểu theo thời gian giữ phím (tránh spam key event nhanh hơn game xử lý được,
	--// gây bỏ phím/trùng lặp). Thêm 1 frame an toàn sau khi nhả phím.
	local minInterval = shared.GetKeyHoldTime() + 0.02
	skillInterval = math.max(raw, minInterval)
end

function autoFarmPathfinder.GetSkillMode()
	return skillMode
end

function autoFarmPathfinder.SetSkillMode(value)
	if value == "Both" or value == "Alternate" then
		skillMode = value
	end
end

function autoFarmPathfinder.IsVisualDebugEnabled()
	return visualDebug
end

function autoFarmPathfinder.SetVisualDebug(value)
	visualDebug = value == true
	saveDebugSettings()
	if not visualDebug then cleanupDebugVisuals() end
end

function autoFarmPathfinder.IsRespawnOnNoPathEnabled()
	return respawnOnNoPath
end

function autoFarmPathfinder.SetRespawnOnNoPath(value)
	respawnOnNoPath = value == true
end

function autoFarmPathfinder.IsAnchorFallbackEnabled()
	return anchorFallback
end

function autoFarmPathfinder.SetAnchorFallback(value)
	anchorFallback = value == true
	if not anchorFallback then
		--// Tắt fallback anchor giữa chừng -> thoát luồng anchor ngay (về CHASE/stand/self-kill).
		anchorWalking = false
		pathIsAnchor = false
		if currentPath then pcall(function() currentPath:Destroy() end) end
		currentPath = nil
		pathComputed = false
		freeWalkActive = false
		freeWalkDir = nil
		freeWalkDest = nil
	end
end

function autoFarmPathfinder.IsAnchorMarkersEnabled()
	return showAnchorMarkers
end

function autoFarmPathfinder.SetAnchorMarkers(value)
	showAnchorMarkers = value == true
	saveDebugSettings()
	if showAnchorMarkers then
		refreshAnchorMarkers()
	else
		cleanupAnchorMarkers()
	end
end

--// ---------- Anchor (điểm người dùng đặt để reach khi nopath, chia theo map) ----------

--// Map hiện tại (dungeon đang chơi). Trả về string hoặc nil.
function autoFarmPathfinder.GetCurrentAnchorMap()
	local name = shared.GetCurrentDungeonName()
	if type(name) == "string" and #name > 0 then return name end
	return nil
end

--// Thêm anchor mới cho room hiện tại tại vị trí player (mỗi room TỐI ĐA 2 anchor: anchor thứ 2
--// chỉ dùng để định hướng free-walk theo hướng anchor1 -> anchor2). mapName: map cần gắn anchor
--// (mặc định map đang chơi). Trả về số thứ tự mới hoặc nil nếu thất bại/room đã đủ 2 anchor.
function autoFarmPathfinder.SetAnchor(mapName)
	local targetMap = mapName
	if not (type(targetMap) == "string" and #targetMap > 0) then
		targetMap = shared.GetCurrentDungeonName()
	end
	if not (type(targetMap) == "string" and #targetMap > 0) then
		warn("[AutoFarmPathfinder] Chưa xác định map hiện tại, không đặt anchor được")
		return nil
	end
	local room = shared.GetCurrentRoomIndex()
	if room == nil or room <= 0 then
		warn("[AutoFarmPathfinder] Chưa xác định room hiện tại, không đặt anchor được")
		return nil
	end
	local root = getPlayerRoot()
	if not root then return nil end
	local pos = getSafePosition(root)
	if not pos then return nil end
	local list = anchors[targetMap]
	if not list then list = {}; anchors[targetMap] = list end
	--// Limit: mỗi room tối đa 2 anchor (anchor thứ 2 chỉ mang vai trò định hướng free-walk).
	local roomCount = 0
	for _, a in ipairs(list) do
		if a.room == room then roomCount += 1 end
	end
	if roomCount >= 2 then
		warn(("[AutoFarmPathfinder] Room %d đã có đủ 2 anchor, không thể thêm"):format(room))
		return nil
	end
	anchorSeq += 1
	list[#list + 1] = { id = anchorSeq, room = room, pos = pos }
	refreshAnchorMarkers()
	saveAnchors()
	return #list
end

--// Xóa anchor theo SỐ THỨ TỰ (index trong list, 1..N liên tục). Xóa index i là list dịch lại
--// nên số thứ tự còn lại tự động liên tục. Trả về true nếu xóa được.
function autoFarmPathfinder.RemoveAnchor(mapName, index)
	if not (type(mapName) == "string" and #mapName > 0) then return false end
	local list = anchors[mapName]
	if not list then return false end
	if type(index) ~= "number" or index < 1 or index > #list then return false end
	table.remove(list, index)
	if #list == 0 then
		anchors[mapName] = nil
		anchorSeq = 0 --// xóa hết -> id nội bộ về lại đầu
	end
	refreshAnchorMarkers()
	saveAnchors()
	return true
end

--// Xóa toàn bộ anchor của 1 map (nil = tất cả các map).
function autoFarmPathfinder.ClearAllAnchors(mapName)
	if type(mapName) == "string" and #mapName > 0 then
		if anchors[mapName] then anchorSeq = 0; anchors[mapName] = nil end
	else
		anchors = {}
		anchorSeq = 0
	end
	refreshAnchorMarkers()
	saveAnchors()
end

--// Trả về danh sách anchor của 1 map theo thứ tự đặt (mảng { {id, room, pos}, ... }).
--// mapName nil -> map đang chơi.
function autoFarmPathfinder.GetAnchors(mapName)
	local name = mapName
	if not (type(name) == "string" and #name > 0) then
		name = shared.GetCurrentDungeonName()
	end
	local out = {}
	local list = (type(name) == "string" and anchors[name]) or nil
	if list then
		for i = 1, #list do out[i] = list[i] end
	end
	return out
end

--// Danh sách tên các map đã có anchor (dùng cho UI dropdown).
function autoFarmPathfinder.GetAnchorMapNames()
	local out = {}
	for name in pairs(anchors) do
		table.insert(out, name)
	end
	table.sort(out)
	return out
end

--// ---------- Methods ----------

function autoFarmPathfinder.Toggle(state)
	if state == enabled then return end
	enabled = state

	if enabled then
		if moveConnection then moveConnection:Disconnect(); moveConnection = nil end
		running = true
		lastSkillTime = 0
		cachedNearestEnemy = nil
		cachedNearestValid = false
		selectToken = 0
		selectRunning = false
		lastRescanTargetAt = 0
		pathIsAnchor = false
		lastFailedModel = nil
		lastFailedDest = nil
		lastSelfKillTime = 0
		chaseModel = nil
		--// Event-driven: reselect target khi tập enemy thay đổi + reset khi respawn.
		if not enemyChangedConnection then
			enemyChangedConnection = shared.OnEnemyChanged(onEnemyChanged)
		end
		if not respawnConnection then
			respawnConnection = shared.OnRespawn(onRespawn)
		end
		--// Khởi tạo tracking enemy trong dungeon (không block luồng chính)
		if not dunReady then
			task.spawn(function()
				if shared.ReadyDungeon() then dunReady = true end
			end)
		end
		--// Seed target ban đầu: nếu đang có enemy (bật giữa trận) thì chọn nearest ngay.
		task.defer(reselectTarget)
		--// Gộp movement + skill vào 1 Heartbeat để giảm số connection/frame.
		moveConnection = RunService.Heartbeat:Connect(function(deltaTime)
			local ok, err = pcall(function()
				stepMovement(deltaTime)
			end)
			if not ok then
				warn(("[AutoFarmPathfinder] lỗi stepMovement: %s"):format(tostring(err)))
			end
		end)
	else
		if moveConnection then moveConnection:Disconnect(); moveConnection = nil end
		running = false
		if enemyChangedConnection then enemyChangedConnection(); enemyChangedConnection = nil end
		if respawnConnection then respawnConnection(); respawnConnection = nil end
		restoreAutoRotate()
		local h = shared.GetHumanoid()
		local r = getPlayerRoot()
		if h and h.Parent and r and r.Parent then pcall(function() h:MoveTo(getSafePosition(r)) end) end
		resetRuntimeState()
		cleanupDebugVisuals()
	end
end

function autoFarmPathfinder.IsRunning()
	return running
end

--// Trả về thông tin debug realtime (dùng cho debug panel trên UI).
function autoFarmPathfinder.GetDebugInfo()
	local playerRoot = getPlayerRoot()
	local enemy = getNearestEnemy()
	local locked = lockedTargetModel and getEnemyByModel(lockedTargetModel) --// target bị khóa
	local display = locked or enemy
	local phase = "IDLE"
	local enemyName = "-"
	local enemyDist = 0
	local enemyFlat = 0
	local lockedName = "-"

	if locked then lockedName = locked.Model and locked.Model.Name or "-" end
	if display and display.Root and display.Root.Parent then
		local displayPos = getSafePosition(display.Root)
		local playerPos = getSafePosition(playerRoot)
		enemyName = display.Model and display.Model.Name or "-"
		if displayPos and playerPos then
			enemyDist = (displayPos - playerPos).Magnitude
			local flat = Vector3.new(displayPos.X - playerPos.X, 0, displayPos.Z - playerPos.Z)
			enemyFlat = flat.Magnitude
		end
		phase = enemyFlat <= skillRange and "HOLD" or "CHASE"
	end

	return {
		phase = phase,
		enemyName = enemyName,
		enemyDist = enemyDist,
		enemyFlat = enemyFlat,
		lockedName = lockedName,
		locked = locked ~= nil,
		skillRange = skillRange,
		holdAngle = holdAngle,
		holdRadius = holdRadius,
		pathComputed = pathComputed,
		chaseTarget = chaseTarget,
		isAnchor = pathIsAnchor,
		dunReady = dunReady,
		enabled = enabled,
	}
end

lifecycle.Register(function()
	autoFarmPathfinder.Toggle(false)
	cleanupAnchorMarkers()
end)

--// Load debug setting + anchors lúc require (nhớ trạng thái qua các lần execute).
loadDebugSettings()
loadAnchors()

--// Render marker cho anchor đã lưu ngay sau khi load (nếu đang bật hiện marker).
--// Marker hiện theo map đang chơi, nên refresh lại mỗi khi đổi map.
shared.OnDungeonNameChanged(function()
	refreshAnchorMarkers()
end)
task.defer(function()
	refreshAnchorMarkers()
end)

return autoFarmPathfinder
end function __DIST.i()-- Tab Speed (DungeonQuest).

--// Imports

local shared = __DIST.load('e')
local ui = __DIST.load('f')
local autoSave = __DIST.load('g')
local autoFarmPathfinder = __DIST.load('h')
local macLib = __DIST.load('a')

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

	--// Auto Farm (Pathfinder v2) toggle qua phím tắt
	section:Header({ Name = "Auto Farm" })

	local function toggleAutoFarmFromKey()
		local newState = not autoFarmPathfinder.IsEnabled()
		--// Đồng bộ UI toggle Auto Farm ở tab Auto Farm - drive farm qua callback của nó
		local opt = macLib.Options and macLib.Options["Toggle_PathfinderFarm"]
		if opt and opt.UpdateState then
			opt:UpdateState(newState)
		else
			autoFarmPathfinder.Toggle(newState)
		end
	end

	section:Keybind({
		Name = "Toggle Auto Farm",
		Default = Enum.KeyCode.X,
		Callback = function()
			toggleAutoFarmFromKey()
		end,
	}, "Keybind_AutoFarm")

end end function __DIST.j()-- Catalog map + độ khó cho DungeonQuest, dựa trên module chooseDungeon của game.
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

return dungeonCatalog end function __DIST.k()-- Contextual AutoFarm Pathfinder settings (v2) cho DungeonQuest.
-- Cho phép cấu hình riêng nhóm Auto Farm (Move Speed, Retarget Interval, Skill
-- Range/Interval/Enabled/Mode, field prefix "Pathfinder...") theo DUNGEON x
-- LOẠI MỤC TIÊU (Quái thường / Boss 1/2/3).
-- Giá trị lưu per-context trong JSON (Maclib/DungeonQuest_ContextCombat.json).
-- Khi 1 context chưa có override thì fallback về giá trị global hiện tại (autoFarmPathfinder).

--// Imports

local shared = __DIST.load('e')
local notifier = __DIST.load('c')
local macLib = __DIST.load('a')
local autoSave = __DIST.load('g')
local dungeonCatalog = __DIST.load('j')
local lifecycle = __DIST.load('b')
local autoFarmPathfinder = __DIST.load('h')

--// Table
local contextual = {}

--// Metadata field -> get/set trên autoFarmPathfinder (group AutoFarm Pathfinder v2).
local FIELD_DEFS = {
	PathfinderRetargetInterval = { get = function() return autoFarmPathfinder.GetRetargetInterval() end, set = function(v) autoFarmPathfinder.SetRetargetInterval(v) end },
	PathfinderSkillRange = { get = function() return autoFarmPathfinder.GetSkillRange() end, set = function(v) autoFarmPathfinder.SetSkillRange(v) end },
	PathfinderSkillInterval = { get = function() return autoFarmPathfinder.GetSkillInterval() end, set = function(v) autoFarmPathfinder.SetSkillInterval(v) end },
	PathfinderSkillEnabled = { get = function() return autoFarmPathfinder.IsSkillEnabled() end, set = function(v) autoFarmPathfinder.SetSkillEnabled(v) end },
	PathfinderSkillMode = { get = function() return autoFarmPathfinder.GetSkillMode() end, set = function(v) autoFarmPathfinder.SetSkillMode(v) end },
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
local configChangedCallbacks = {}

--// Các tab đăng ký callback khi đổi config (để làm mới UI context). Hỗ trợ nhiều tab.
function contextual.OnConfigChanged(cb)
	if type(cb) ~= "function" then return end
	table.insert(configChangedCallbacks, cb)
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

	if (configChanged or dataChanged) and #configChangedCallbacks > 0 then
		for _, cb in ipairs(configChangedCallbacks) do
			pcall(cb, newActive)
		end
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
--// Đảm bảo mọi dungeon trong catalog đều có sẵn đủ field (= giá trị global hiện tại)
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

--// Ghi override cho context cụ thể (context luôn đầy đủ tất cả field)
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

	--// Poll ít hơn: dungeon/boss đổi đã được xử lý bằng event callbacks trên, poll chỉ
	--// còn để bắt thay đổi config file từ bên ngoài -> giảm CPU nền.
	task.spawn(function()
		while lifecycle.IsActive() do
			task.wait(1.0)
			--// Đổi config -> nạp lại dữ liệu context của config mới (+ re-apply)
			if contextual.ReloadFromConfig() then
				findAndApply(true)
			end
		end
	end)
end

return contextual
end function __DIST.l()-- Phím tắt: chuột phải kích hoạt combo Q+E (toggle enabled qua tab Auto Farm).

--// Imports

local services = __DIST.load('d')
local shared = __DIST.load('e')
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
		if gameProcessed then return end
		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			--// Ẩn: chuột phải kích hoạt E + Q (chỉ khi toggle bật).
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
end function __DIST.m()-- Tab AutoFarm Pathfinder (v2): cơ chế 2 pha.
-- CHASE: pathfinding chạy thẳng tới kẻ địch gần nhất khi ngoài tầm.
-- HOLD: khi trong tầm skill range, giữ khoảng cách bằng orbit tốc độ 0 (đứng yên + quay mặt
-- enemy) và tự spam Q+E. Kèm Visual Debug (ô đỏ điểm đuổi + highlight kẻ gần nhất).

--// Imports

local autoSave = __DIST.load('g')
local autoFarmPathfinder = __DIST.load('h')
local shared = __DIST.load('e')
local contextual = __DIST.load('k')
local shortcuts = __DIST.load('l')
local ui = __DIST.load('f')
local dungeonCatalog = __DIST.load('j')

return function(window, tab)
	--// Bảng Auto Farm: bật/tắt + combo chuột
	local farmSection = tab:Section({ Side = "Left" })
	farmSection:Header({ Name = "Auto Farm" })

	farmSection:Toggle({
		Name = "Enable Pathfinder Farm",
		Default = autoFarmPathfinder.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoFarmPathfinder.Toggle(state)
		end),
	}, "Toggle_PathfinderFarm")

	farmSection:Toggle({
		Name = "Right Click Combo (Q+E)",
		Default = shortcuts.IsMouseComboEnabled(),
		Callback = autoSave.Wrap(function(state)
			shortcuts.SetMouseComboEnabled(state)
		end),
	}, "Toggle_PathfinderMouseCombo")

	--// Bảng Fallback: 2 cơ chế khi nopath enemy
	local fallbackSection = tab:Section({ Side = "Left" })
	fallbackSection:Header({ Name = "Fallback" })

	fallbackSection:Toggle({
		Name = "Anchor Fallback",
		Default = autoFarmPathfinder.IsAnchorFallbackEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoFarmPathfinder.SetAnchorFallback(state)
		end),
	}, "Toggle_PathfinderAnchorFallback")

	fallbackSection:Toggle({
		Name = "Respawn On No Path",
		Default = autoFarmPathfinder.IsRespawnOnNoPathEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoFarmPathfinder.SetRespawnOnNoPath(state)
		end),
	}, "Toggle_PathfinderSelfKill")

	--// Bảng Anchor Manager: quản lý anchor theo map
	local anchorSection = tab:Section({ Side = "Left" })
	anchorSection:Header({ Name = "Anchor Manager" })

	--// Anchor chia theo MAP (dungeon). Dropdown chọn map để quản lý anchor của map đó.
	--// Mỗi map có danh sách anchor riêng, lưu riêng file anchors.json.
	local function buildAnchorMapOptions()
		local names = {}
		local seen = {}
		local cur = autoFarmPathfinder.GetCurrentAnchorMap()
		if cur and #cur > 0 then table.insert(names, cur); seen[cur] = true end
		for _, n in ipairs(dungeonCatalog.GetDungeons()) do
			if type(n) == "string" and #n > 0 and not seen[n] then seen[n] = true; table.insert(names, n) end
		end
		return names
	end

	local anchorMapOptions = buildAnchorMapOptions()
	local selectedAnchorMap = autoFarmPathfinder.GetCurrentAnchorMap()
	if not selectedAnchorMap then selectedAnchorMap = anchorMapOptions[1] end

	local function indexOfOption(opts, name)
		if not name then return 1 end
		for i, n in ipairs(opts) do if n == name then return i end end
		return 1
	end

	local refreshAnchorLabel

	local anchorMapDropdown = anchorSection:Dropdown({
		Name = "Map (Edit Anchors)",
		Options = anchorMapOptions,
		Default = indexOfOption(anchorMapOptions, selectedAnchorMap),
		Required = true,
		Callback = function(option)
			selectedAnchorMap = option
			refreshAnchorLabel()
		end,
	}, "Dropdown_PathfinderAnchorMap")

	local anchorLabel = anchorSection:Label({ Text = "No anchors set" })

	refreshAnchorLabel = function()
		local list = autoFarmPathfinder.GetAnchors(selectedAnchorMap)
		if #list == 0 then
			anchorLabel:UpdateName("Map: " .. tostring(selectedAnchorMap or "-") .. "\nNo anchors set")
			return
		end
		local parts = {}
		for i, a in ipairs(list) do
			table.insert(parts, (("%d.R%d"):format(i, a.room)))
		end
		anchorLabel:UpdateName("Map: " .. tostring(selectedAnchorMap or "-") .. "\nOrder: " .. table.concat(parts, " "))
	end

	anchorSection:Button({
		Name = "Add Anchor at Current Room",
		Callback = function()
			local mapToUse = selectedAnchorMap or autoFarmPathfinder.GetCurrentAnchorMap()
			local num = autoFarmPathfinder.SetAnchor(mapToUse)
			if num then
				window:Notify({ Title = "Auto Farm", Description = ("Anchor #%d added"):format(num) })
			else
				window:Notify({ Title = "Auto Farm", Description = "Không thêm được anchor (room đã đủ 2 hoặc chưa xác định room/map)" })
			end
			refreshAnchorLabel()
		end,
	})

	local inputAnchorNum
	anchorSection:Input({
		Name = "Anchor Number to Remove",
		Placeholder = "number",
		AcceptedCharacters = "Numeric",
		Callback = function(v)
			inputAnchorNum = v
		end,
	})

	anchorSection:Button({
		Name = "Remove Anchor",
		Callback = function()
			local num = inputAnchorNum and tonumber(inputAnchorNum)
			local mapToUse = selectedAnchorMap
			if num and mapToUse and autoFarmPathfinder.RemoveAnchor(mapToUse, num) then
				window:Notify({ Title = "Auto Farm", Description = ("Removed anchor #%d"):format(num) })
			else
				window:Notify({ Title = "Auto Farm", Description = "Không tìm thấy anchor #" .. tostring(inputAnchorNum) })
			end
			refreshAnchorLabel()
		end,
	})

	anchorSection:Button({
		Name = "Clear Anchors for Selected Map",
		Callback = function()
			local mapToUse = selectedAnchorMap
			if mapToUse then
				autoFarmPathfinder.ClearAllAnchors(mapToUse)
				window:Notify({ Title = "Auto Farm", Description = ("Cleared anchors: %s"):format(mapToUse) })
			end
			refreshAnchorLabel()
		end,
	})

	anchorSection:Toggle({
		Name = "Show Anchor Markers",
		Default = autoFarmPathfinder.IsAnchorMarkersEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoFarmPathfinder.SetAnchorMarkers(state)
		end),
	}, "Toggle_PathfinderAnchorMarkers")

	--// Khi vào/ra dungeon (map hiện tại đổi) -> chọn map hiện tại trong dropdown + cập nhật label.
	shared.OnDungeonNameChanged(function()
		local cur = autoFarmPathfinder.GetCurrentAnchorMap()
		if cur and #cur > 0 then
			selectedAnchorMap = cur
			pcall(function() anchorMapDropdown:UpdateSelection(cur) end)
		end
		refreshAnchorLabel()
	end)

	refreshAnchorLabel()

	--// Bảng Visual Debug
	local visualSection = tab:Section({ Side = "Left" })
	visualSection:Header({ Name = "Visual Debug" })

	visualSection:Toggle({
		Name = "Show Debug Overlays",
		Default = autoFarmPathfinder.IsVisualDebugEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoFarmPathfinder.SetVisualDebug(state)
		end),
	}, "Toggle_PathfinderDebug")

	--// Bảng Debug: trạng thái realtime
	local debugSection = tab:Section({ Side = "Left" })
	debugSection:Header({ Name = "Debug" })

	local stateLabel = debugSection:Label({ Text = "Initializing..." })

	local PHASE_COLORS = {
		CHASE = "0, 255, 255",
		HOLD = "255, 200, 0",
		IDLE = "160, 160, 160",
	}

	local function formatBool(v)
		return v and "<font color='rgb(0,255,0)'>Yes</font>" or "<font color='rgb(255,80,80)'>No</font>"
	end

	local function updateStateLabel()
		local ok, info = pcall(autoFarmPathfinder.GetDebugInfo)
		if not ok or not info then return end
		local phaseColor = PHASE_COLORS[info.phase] or "160, 160, 160"
		local angle = info.holdAngle
		local angleStr = angle and string.format("%.1fdeg", math.deg(angle)) or "-"
		local radiusStr = info.holdRadius and string.format("%.1f", info.holdRadius) or "-"
		local roomIdx = shared.GetCurrentRoomIndex()
		local bossIdx = shared.GetCurrentBossIndex()
		local enemyCount = shared.GetEnemyCount()
		local roomStr = (roomIdx and roomIdx > 0) and tostring(roomIdx) or "-"
		local bossStr = (bossIdx and bossIdx > 0) and tostring(bossIdx) or "-"
		local text = table.concat({
			"State: <font color='rgb(" .. phaseColor .. ")'>" .. info.phase .. "</font>\n",
			"Room: " .. roomStr .. " / Boss: " .. bossStr .. " / Enemies: " .. tostring(enemyCount) .. "\n",
			"Locked: " .. (info.locked and ("<font color='rgb(255,200,0)'>" .. info.lockedName .. "</font>") or "No") .. "\n",
			"Current: " .. info.enemyName .. "\n",
			"Dist 3D: " .. string.format("%.1f", info.enemyDist) .. "\n",
			"Dist XZ: " .. string.format("%.1f", info.enemyFlat) .. " / SkillRange " .. info.skillRange .. "\n",
			"Orbit: angle " .. angleStr .. " / radius " .. radiusStr .. "\n",
			"Path: " .. (info.pathComputed and (info.isAnchor and "<font color='rgb(0,255,0)'>anchor</font>" or "active") or "none") .. "\n",
			"Tracking: " .. formatBool(info.dunReady) .. " / Enabled " .. formatBool(info.enabled),
		})
		pcall(function()
			stateLabel:UpdateName(text)
		end)
	end

	updateStateLabel()

	task.spawn(function()
		while task.wait(0.25) do
			updateStateLabel()
		end
	end)

	--// AutoFarm Pathfinder Context (per dungeon x per target).
	--
	--// Cấu hình riêng Move Speed / Retarget Interval / Skill Range / Skill Interval /
	--// Skill Enabled / Skill Mode theo DUNGEON x LOẠI MỤC TIÊU (Normal / Boss 1/2/3),
	--// y như Auto Farm Context. Lưu chung blob contextData qua core/contextual.
	--// Fallback về global (autoFarmPathfinder) khi context chưa có override.
	local ctxSection = tab:Section({ Side = "Right" })
	ctxSection:Header({ Name = "AutoFarm Pathfinder Context" })

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
	local retargetIntervalSlider
	local skillRangeSlider
	local skillIntervalSlider
	local skillEnabledToggle
	local skillModeDropdown
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
	}, "Dropdown_PathfinderTarget")

	--// Nút Reset dễ ấn nhầm -> cơ chế 2 bước (arm Confirm -> click lần 2 trong hạn).
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

	retargetIntervalSlider = ui.PatchSliderLoadCallback(ctxSection:Slider({
		Name = "Retarget Interval",
		Default = contextual.GetField(editDungeon, editTarget, "PathfinderRetargetInterval"),
		Minimum = 0.2,
		Maximum = 5,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "PathfinderRetargetInterval", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_PathfinderCtxRetarget"))

	skillRangeSlider = ui.PatchSliderLoadCallback(ctxSection:Slider({
		Name = "Skill Range",
		Default = contextual.GetField(editDungeon, editTarget, "PathfinderSkillRange"),
		Minimum = 1,
		Maximum = 200,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "PathfinderSkillRange", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_PathfinderCtxSkillRange"))

	skillIntervalSlider = ui.PatchSliderLoadCallback(ctxSection:Slider({
		Name = "Skill Interval",
		Default = contextual.GetField(editDungeon, editTarget, "PathfinderSkillInterval"),
		Minimum = 0.2,
		Maximum = 10,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(Value)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "PathfinderSkillInterval", Value)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Slider_PathfinderCtxSkillInterval"))

	skillEnabledToggle = ctxSection:Toggle({
		Name = "Skill Enabled",
		Default = contextual.GetField(editDungeon, editTarget, "PathfinderSkillEnabled"),
		Callback = autoSave.Wrap(function(state)
			if isSyncing then return end
			contextual.SetField(editDungeon, editTarget, "PathfinderSkillEnabled", state)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Toggle_PathfinderCtxSkillEnabled")

	local SKILL_MODE_OPTIONS = { "Both (Q+E cùng lúc)", "Alternate (Q -> E -> Q -> E)" }
	local function skillModeToOption(mode)
		if mode == "Alternate" then return SKILL_MODE_OPTIONS[2] end
		return SKILL_MODE_OPTIONS[1]
	end

	skillModeDropdown = ctxSection:Dropdown({
		Name = "Skill Mode",
		Options = SKILL_MODE_OPTIONS,
		Default = skillModeToOption(contextual.GetField(editDungeon, editTarget, "PathfinderSkillMode")) == SKILL_MODE_OPTIONS[2] and 2 or 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			if not option or isSyncing then return end
			local mode = option:find("Alternate") and "Alternate" or "Both"
			contextual.SetField(editDungeon, editTarget, "PathfinderSkillMode", mode)
			if isActiveContext() then contextual.ApplyContext(editDungeon, editTarget) end
		end),
	}, "Dropdown_PathfinderCtxSkillMode")

	refreshContextControls = function()
		isSyncing = true
		disarmReset()
		pcall(function() retargetIntervalSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "PathfinderRetargetInterval")) end)
		pcall(function() skillRangeSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "PathfinderSkillRange")) end)
		pcall(function() skillIntervalSlider:UpdateValue(contextual.GetField(editDungeon, editTarget, "PathfinderSkillInterval")) end)
		pcall(function() skillEnabledToggle:UpdateState(contextual.GetField(editDungeon, editTarget, "PathfinderSkillEnabled")) end)
		pcall(function() skillModeDropdown:UpdateSelection(skillModeToOption(contextual.GetField(editDungeon, editTarget, "PathfinderSkillMode"))) end)
		isSyncing = false
		pcall(function() editCtxLabel:UpdateName("Editing: <font color='rgb(150,255,150)'>" .. (editDungeon or "Not in dungeon") .. "</font> / " .. contextual.GetDisplayForTarget(editTarget)) end)
	end

	setEditControlsVisible = function(visible)
		pcall(function() retargetIntervalSlider:SetVisibility(visible) end)
		pcall(function() skillRangeSlider:SetVisibility(visible) end)
		pcall(function() skillIntervalSlider:SetVisibility(visible) end)
		pcall(function() skillEnabledToggle:SetVisibility(visible) end)
		pcall(function() skillModeDropdown:SetVisibility(visible) end)
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
end end function __DIST.n()-- Auto Join Dungeon cho DungeonQuest: tạo phòng (createLobby) + whitelist + start dungeon.
-- Scalable: map/độ khó lấy từ dungeonCatalog (động qua getDungeonStats + override map đặc biệt).

--// Imports

local services = __DIST.load('d')
local notifier = __DIST.load('c')
local dungeonCatalog = __DIST.load('j')
local shared = __DIST.load('e')
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
end function __DIST.o()-- Auto Start Game cho DungeonQuest: chờ tới khi đang ở TRONG dungeon rồi fire
-- remote start. Dungeon được xác định bằng cách LOẠI TRỪ các placeId lobby: ngoài
-- 2 lobby (Lobby1/Lobby2) thì mọi place khác đều coi là dungeon. Ở lobby không
-- hoạt động dù toggle có bật.

--// Imports

local shared = __DIST.load('e')
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

return autoStart end function __DIST.p()-- Auto-press nút Start ở LOBBY cho DungeonQuest: chờ nút Start (introGui.title.Frame.
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

return autoStartLobby end function __DIST.q()-- Auto Retry Dungeon cho DungeonQuest: khi reward holder có >= 2 item thì fire replayDungeon.

--// Imports

local services = __DIST.load('d')
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
end function __DIST.r()-- Tab Dungeon (DungeonQuest): Auto Join Dungeon scalable.
-- Difficulty dropdown tự update options theo map đang chọn (lấy từ dungeonCatalog).

--// Imports

local ui = __DIST.load('f')
local autoJoin = __DIST.load('n')
local autoStart = __DIST.load('o')
local autoStartLobby = __DIST.load('p')
local autoRetry = __DIST.load('q')
local autoSave = __DIST.load('g')
local dungeonCatalog = __DIST.load('j')

return function(window, tab)
	local section = tab:Section({ Side = "Left" })
	local runSection = tab:Section({ Side = "Right" })
	section:Header({ Name = "Auto Join Dungeon" })
	runSection:Header({ Name = "Dungeon Run Automation" })

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
end function __DIST.s()-- Auto Sell (DungeonQuest): bán vật phẩm trong inventory theo điều kiện lọc.
-- Cơ chế: bấm nút "Sell Now" -> đọc inventory (remote `reloadInvy`) -> lọc theo
-- rarity/type/prefix-name/levelReq/equipped -> gom index theo category -> fire
-- remote `sellItemEvent` (payload { [category] = {index,...} }, vd { weapon = {49} }).

--// Imports

local lifecycle = __DIST.load('b')
local notifier = __DIST.load('c')
local shared = __DIST.load('e')

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

--// Các mốc Level Req tĩnh cho dropdown multi-select
local LEVEL_REQ_OPTIONS = {
	"1", "5", "15", "25", "35", "45", "55", "65", "75", "85",
	"95", "105", "115", "125", "135", "145", "155", "165", "175", "185",
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

	if next(levelReqExactFilter) then
		local lvl = item.LevelReq or 0
		if levelReqMode == "Below" then
			-- Bán item có LevelReq ≤ mốc đã chọn (lấy max trong set)
			local threshold
			for v in pairs(levelReqExactFilter) do
				if not threshold or v > threshold then threshold = v end
			end
			if threshold and lvl > threshold then return false end
		elseif levelReqMode == "Above" then
			-- Bán item có LevelReq ≥ mốc đã chọn (lấy min trong set)
			local threshold
			for v in pairs(levelReqExactFilter) do
				if not threshold or v < threshold then threshold = v end
			end
			if threshold and lvl < threshold then return false end
		else
			-- None: chỉ bán đúng các mốc đã tick
			if not levelReqExactFilter[lvl] then return false end
		end
	end

	return true
end

--// Có ít nhất 1 điều kiện lọc đang active hay không.
--// Dùng để cảnh báo khi user sắp bán mà không có filter nào (rủi ro bán sạch).
function autoSell.HasAnyFilter()
	return (
		next(rarityFilter) ~= nil
		or next(typeFilter) ~= nil
		or next(levelReqExactFilter) ~= nil
		or (not excludeEquipped)
	)
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
		for _, r in ipairs(selected) do rarityFilter[r] = true end
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
		for _, t in ipairs(selected) do typeFilter[t] = true end
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
		for _, v in ipairs(selected) do
			local n = tonumber(v)
			if n then levelReqExactFilter[n] = true end
		end
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
end function __DIST.t()-- Tab Inventory (DungeonQuest): AutoSell section - sell items by filter.
-- Uses multichoice dropdowns for Rarity and Item Type; "Sell Now" sells once
-- after a confirmation dialog.

--// Imports

local autoSave = __DIST.load('g')
local autoSell = __DIST.load('s')
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
		local levelText = "All (No filter)"
		local levelColor = "160, 160, 160"
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
			local list = {}
			for rarity in pairs(selected) do table.insert(list, rarity) end
			autoSell.SetRarityFilter(list)
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
			local list = {}
			for itemType in pairs(selected) do table.insert(list, itemType) end
			autoSell.SetTypeFilter(list)
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
				levelReqDropdown:UpdateSelection({})
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
			local list = {}
			if type(selected) == "table" then
				for level in pairs(selected) do table.insert(list, level) end
			elseif type(selected) == "string" then
				table.insert(list, selected)
			end
			autoSell.SetLevelReqExactFilter(list)
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
end function __DIST.u()-- ESP hitbox cho DungeonQuest.
-- Bao gồm Player/Enemy Hitbox (Real/Custom) + Show Skill Hitbox (tạm thời chỉ northernMageShot - precast).

--// Imports

local services = __DIST.load('d')
local shared = __DIST.load('e')

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
end function __DIST.v()-- ESP Enemy (Highlight) cho DungeonQuest.
-- Vẽ highlight phủ toàn bộ model enemy (giống glow Minecraft) đang track trong
-- dungeon, dựa trên shared.GetTrackedEnemyData. Màu cam để phân biệt với ESP
-- hitbox projectile (đỏ) và player hitbox (xanh lá).

--// Imports

local services = __DIST.load('d')
local shared = __DIST.load('e')

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
end function __DIST.w()-- Map Optimizer (DungeonQuest): gộp 3 script thành 1 tính năng toggle.
-- Script1: ép hiện hình liên tục các phần map bị ẩn/thuỷ tinh.
-- Script2: dọn dẹp vật thể rác (decoration) ở lớp ngoài cùng của Map.
-- Script3: radar hitbox quét quanh nhân vật, xóa part có độ cao (Y) > 80.

--// Imports

local services = __DIST.load('d')

--// Table
local mapOptimizer = {}

--// State
local enabled = false
local cleanupThread = nil
local visibilityThread = nil
local radarThread = nil

local CLEANUP_INTERVAL = 2
local FORCE_VISIBLE_INTERVAL = 0.5
local RADAR_INTERVAL = 0.2
local RADAR_HITBOX_SIZE = Vector3.new(20, 200, 20)
local RADAR_MIN_Y = 80

--// DANH SÁCH 1: Xóa nếu tên object ở Depth 1 khớp chính xác
local DEPTH1_NAMES_TO_DELETE = {
	["Stone"] = true,
	["Dead Tree"] = true,
	["Eye Rune"] = true,
	["Meshes/Ice shard"] = true,
	["Small snow patch"] = true,
	["snow patch"] = true,
	["Meshes/Root4"] = true,
	["snow machine"] = true,
	["Meshes/Ice3"] = true,
	["Meshes/ice plates_Circle.004"] = true,
}

--// DANH SÁCH 2: Xóa object Depth 1 nếu BÊN TRONG nó có chứa tên này
local DESCENDANT_NAMES_TO_TARGET = {
	["Wooden plank"] = true,
	["Meshes/Root4"] = true,
}

local function getMap()
	return workspace:WaitForChild("Map", 5)
end

--// Dọn dẹp vật thể rác ở Depth 1 (Script2)
local function cleanUpMap()
	local map = getMap()
	if not map then return end

	for _, child in ipairs(map:GetChildren()) do
		local shouldDelete = DEPTH1_NAMES_TO_DELETE[child.Name]
		if not shouldDelete then
			for _, descendant in ipairs(child:GetDescendants()) do
				if DESCENDANT_NAMES_TO_TARGET[descendant.Name] then
					shouldDelete = true
					break
				end
			end
		end
		if shouldDelete then
			child:Destroy()
		end
	end
end

--// Ép hiện hình cho một container (Script1)
local function forceVisible(container)
	if not container then return end
	for _, object in ipairs(container:GetDescendants()) do
		if object:IsA("BasePart") and object.Transparency ~= 0 then
			object.Transparency = 0
		end
	end
end

--// Radar hitbox: quét quanh nhân vật và xóa part cao (Y > RADAR_MIN_Y) (Script3)
local function runRadar()
	local player = services.player
	if not player then return end
	local character = player.Character
	local hrp = character and character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	local map = getMap()
	if not map then return end

	local filterList = {}
	local borders = map:FindFirstChild("borders")
	local container143 = map:GetChildren()[143]
	if borders then table.insert(filterList, borders) end
	if container143 then table.insert(filterList, container143) end

	local overlapParams = OverlapParams.new()
	overlapParams.FilterType = Enum.RaycastFilterType.Include
	overlapParams.FilterDescendantsInstances = filterList

	local hitboxCFrame = hrp.CFrame * CFrame.new(0, 100, 0)
	local partsInHitbox = workspace:GetPartBoundsInBox(hitboxCFrame, RADAR_HITBOX_SIZE, overlapParams)

	for _, hitPart in ipairs(partsInHitbox) do
		if hitPart.Name ~= "borders" and hitPart.Name ~= "Baseplate" then
			if hitPart.CFrame.Position.Y > RADAR_MIN_Y then
				hitPart:Destroy()
			end
		end
	end
end

function mapOptimizer.Toggle(state)
	if state == enabled then return end
	enabled = state

	if enabled then
		local ok, err = pcall(cleanUpMap)
		if not ok then
			warn("[MapOptimizer] cleanup error:", tostring(err))
		end

		if cleanupThread then task.cancel(cleanupThread); cleanupThread = nil end
		cleanupThread = task.spawn(function()
			while enabled do
				task.wait(CLEANUP_INTERVAL)
				local ok, err = pcall(cleanUpMap)
				if not ok then
					warn("[MapOptimizer] cleanup error:", tostring(err))
				end
			end
		end)

		if visibilityThread then task.cancel(visibilityThread); visibilityThread = nil end
		visibilityThread = task.spawn(function()
			while enabled do
				local ok, err = pcall(function()
					local map = getMap()
					local container143 = map and map:GetChildren()[143]
					local borders = map and map:FindFirstChild("borders")
					forceVisible(container143)
					forceVisible(borders)
				end)
				if not ok then
					warn("[MapOptimizer] visibility error:", tostring(err))
				end
				task.wait(FORCE_VISIBLE_INTERVAL)
			end
		end)

		if radarThread then task.cancel(radarThread); radarThread = nil end
		radarThread = task.spawn(function()
			while enabled do
				local ok, err = pcall(runRadar)
				if not ok then
					warn("[MapOptimizer] radar error:", tostring(err))
				end
				task.wait(RADAR_INTERVAL)
			end
		end)
	else
		if cleanupThread then task.cancel(cleanupThread); cleanupThread = nil end
		if visibilityThread then task.cancel(visibilityThread); visibilityThread = nil end
		if radarThread then task.cancel(radarThread); radarThread = nil end
	end
end

function mapOptimizer.IsEnabled()
	return enabled
end

return mapOptimizer end function __DIST.x()-- Tab Visual (DungeonQuest): các tính năng hiển thị trực quan (visual).

--// Imports
	
local autoSave = __DIST.load('g')
	local esp = __DIST.load('u')
	local enemyEsp = __DIST.load('v')
	local mapOptimizer = __DIST.load('w')
	local ui = __DIST.load('f')

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
end function __DIST.y()-- Smart Dodge (DungeonQuest): Phát hiện vùng nguy hiểm (Threat Detection) dựa trên
-- thuộc tính Material == Enum.Material.Neon của các skill, projectile, và telegraphs.
-- Giai đoạn 1: Quét, nhận diện hiểm họa ở Workspace (Depth 1) và giám sát trạng thái Fade/Destroy thời gian thực.

--// Imports

local services = __DIST.load('d')
local lifecycle = __DIST.load('b')
local notifier = __DIST.load('c')

--// References
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local player = services.player

--// Table
local smartDodge = {}

--// State
local threatDetectorEnabled = false
local logHazards = false
local logInDanger = true
local visualEspEnabled = true
local activeHazards = {} -- [Instance] = { Name, Class, Position, Distance, NeonCount, Connections, ActiveParts, Highlight }
local hazardCount = 0
local hazardChangedCallbacks = {}
local lastHazardInfo = nil
local connections = {}
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
}

--// Ngưỡng coi như chiêu đã mờ hoàn toàn/kết thúc
local FADE_TRANSPARENCY_THRESHOLD = 0.95

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

--// Thêm một Skill vào danh sách ngoại lệ
function smartDodge.AddCustomHazard(skillName)
	if type(skillName) == "string" and #skillName > 0 then
		CUSTOM_HAZARD_EXCEPTIONS[skillName] = true
	end
end

--// Đăng ký tên kỹ năng của Player để loại trừ
function smartDodge.RegisterPlayerSkill(skillName)
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
				smartDodge.RegisterPlayerSkill(child.Name)
			end
		end

		local function watchBackpack(bp)
			if not bp then return end
			scanContainer(bp)
			bp.ChildAdded:Connect(function(child)
				smartDodge.RegisterPlayerSkill(child.Name)
			end)
		end

		local function watchCharacter(char)
			if not char then return end
			scanContainer(char)
			char.ChildAdded:Connect(function(child)
				if child:IsA("Tool") then
					smartDodge.RegisterPlayerSkill(child.Name)
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
						smartDodge.RegisterPlayerSkill(item.Name)
					end
				end
				if p.Character then
					for _, item in ipairs(p.Character:GetChildren()) do
						if item:IsA("Tool") then
							smartDodge.RegisterPlayerSkill(item.Name)
						end
					end
				end
			end
			task.wait(1)
		end
	end)
end

initPlayerSkillWatcher()

--// Kiểm tra xem đối tượng có phải là của Player (hoặc skill của Player) không
local function isPlayerAsset(instance)
	if not instance then return true end

	-- 1. Kiểm tra trực thuộc Character của bất kỳ người chơi nào
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Character and (instance == p.Character or instance:IsDescendantOf(p.Character)) then
			return true
		end
	end

	-- 2. Kiểm tra trực tiếp trong Backpack & Character của mọi người chơi tại thời điểm t = 0
	local instNameClean = instance.Name:gsub("^%s+", ""):gsub("%s+$", "")
	local instNameLower = instNameClean:lower():gsub("%s+", "")

	for _, p in ipairs(Players:GetPlayers()) do
		local bp = p:FindFirstChild("Backpack")
		if bp then
			if bp:FindFirstChild(instance.Name) or bp:FindFirstChild(instNameClean) then
				smartDodge.RegisterPlayerSkill(instance.Name)
				return true
			end
			for _, item in ipairs(bp:GetChildren()) do
				local itemLower = item.Name:lower():gsub("%s+", "")
				if item.Name == instance.Name or itemLower == instNameLower or instNameLower:find(itemLower, 1, true) or itemLower:find(instNameLower, 1, true) then
					smartDodge.RegisterPlayerSkill(item.Name)
					return true
				end
			end
		end

		if p.Character then
			if p.Character:FindFirstChild(instance.Name) or p.Character:FindFirstChild(instNameClean) then
				smartDodge.RegisterPlayerSkill(instance.Name)
				return true
			end
			for _, item in ipairs(p.Character:GetChildren()) do
				if item:IsA("Tool") then
					local itemLower = item.Name:lower():gsub("%s+", "")
					if item.Name == instance.Name or itemLower == instNameLower or instNameLower:find(itemLower, 1, true) or itemLower:find(instNameLower, 1, true) then
						smartDodge.RegisterPlayerSkill(item.Name)
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

	-- 5. So khớp mềm (Fuzzy Match) với danh sách tên kỹ năng đã đăng ký
	if ignoredSkillNames[instance.Name] or ignoredSkillNames[instNameClean] or ignoredSkillNames[instNameLower] then
		return true
	end

	for skillName in pairs(ignoredSkillNames) do
		local sLower = skillName:lower():gsub("%s+", "")
		if #sLower >= 3 and (instNameLower:find(sLower, 1, true) or sLower:find(instNameLower, 1, true)) then
			return true
		end
	end

	return false
end

--// Kiểm tra xem một Part/MeshPart cụ thể có thuộc danh sách bỏ qua hay không
local function isIgnoredPart(part)
	if not part then return true end
	if part == safeSpotMarkerPart or part.Name:find("SmartDodge") then return true end
	local nameClean = part.Name:gsub("^%s+", ""):gsub("%s+$", "")
	local nameLower = nameClean:lower():gsub("%s+", "")
	if ignoredSkillNames[part.Name] or ignoredSkillNames[nameClean] or ignoredSkillNames[nameLower] or IGNORED_NAMES[part.Name] then
		return true
	end
	if nameLower:find("enhancedaura", 1, true) or nameLower:find("auraring", 1, true) or nameLower:find("groundaura", 1, true) then
		return true
	end
	return false
end

--// Tìm các Part nguy hiểm bên trong instance (Depth 1 BasePart hoặc Model)
local function extractHazardParts(instance)
	local parts = {}
	if not instance or instance.Name:find("SmartDodge") or instance == safeSpotMarkerPart or isIgnoredPart(instance) then
		return parts, false
	end
	local isException = CUSTOM_HAZARD_EXCEPTIONS[instance.Name]

	if isException then
		-- Ngoại lệ đặc biệt: tìm các part 'precast' hoặc BaseParts có trong model
		if instance:IsA("BasePart") then
			if not isIgnoredPart(instance) and instance.Transparency < FADE_TRANSPARENCY_THRESHOLD then
				table.insert(parts, instance)
			end
		elseif instance:IsA("Model") then
			local precasts = {}
			for _, desc in ipairs(instance:GetDescendants()) do
				if desc:IsA("BasePart") and not isIgnoredPart(desc) and desc.Name:lower():find("precast") and desc.Transparency < FADE_TRANSPARENCY_THRESHOLD then
					table.insert(precasts, desc)
				end
			end
			if #precasts > 0 then
				parts = precasts
			else
				for _, desc in ipairs(instance:GetDescendants()) do
					if desc:IsA("BasePart") and not isIgnoredPart(desc) and desc.Transparency < FADE_TRANSPARENCY_THRESHOLD then
						table.insert(parts, desc)
					end
				end
			end
		end
	else
		-- Tiêu chuẩn chung: Material == Neon
		if instance:IsA("BasePart") then
			if not isIgnoredPart(instance) and instance.Material == Enum.Material.Neon and instance.Transparency < FADE_TRANSPARENCY_THRESHOLD then
				table.insert(parts, instance)
			end
		elseif instance:IsA("Model") then
			for _, desc in ipairs(instance:GetDescendants()) do
				if desc:IsA("BasePart") and not isIgnoredPart(desc) and desc.Material == Enum.Material.Neon and desc.Transparency < FADE_TRANSPARENCY_THRESHOLD then
					table.insert(parts, desc)
				end
			end
		end
	end

	return parts, isException
end

--// Lấy vị trí trung tâm của instance
local function getInstancePosition(instance, hazardParts)
	if instance:IsA("BasePart") then
		return instance.Position
	elseif instance:IsA("Model") then
		if instance.PrimaryPart then
			return instance.PrimaryPart.Position
		end
		local pivot = instance:GetPivot()
		if pivot and pivot.Position ~= Vector3.zero then
			return pivot.Position
		end
	end

	if hazardParts and #hazardParts > 0 then
		return hazardParts[1].Position
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

--// Tạo và gắn SelectionBox đỏ 3D lên từng Part của chiêu thức
local function attachSelectionBoxes(hazardParts)
	local boxes = {}
	for _, part in ipairs(hazardParts) do
		if part and part:IsA("BasePart") and part.Parent then
			local box = Instance.new("SelectionBox")
			box.Name = "SmartDodge_SelectionBox"
			box.Color3 = Color3.fromRGB(255, 45, 45)
			box.SurfaceColor3 = Color3.fromRGB(255, 30, 30)
			box.SurfaceTransparency = 0.6
			box.LineThickness = 0.05
			box.Adornee = part
			box.Parent = part
			table.insert(boxes, box)
		end
	end
	return boxes
end

--// Đăng ký một Instance (Depth 1) là hiểm họa và gắn listeners theo dõi độ mờ
local function registerHazard(instance)
	if not threatDetectorEnabled or not instance or activeHazards[instance] then return end
	if instance:IsA("Folder") then return end
	if instance.Name:find("SmartDodge") or instance == safeSpotMarkerPart then return end
	if IGNORED_NAMES[instance.Name] or ignoredSkillNames[instance.Name] or isPlayerAsset(instance) then return end

	local hazardParts, isException = extractHazardParts(instance)
	if #hazardParts == 0 then
		-- Nếu là Model mới tạo có thể các part con chưa kịp parent vào Model
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
			task.delay(1, function()
				if c then c:Disconnect(); c = nil end
			end)
		end
		return
	end

	local pos = getInstancePosition(instance, hazardParts)
	local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local dist = rootPart and math.floor((pos - rootPart.Position).Magnitude) or 0

	local activePartsSet = {}
	local partConnections = {}

	for _, part in ipairs(hazardParts) do
		activePartsSet[part] = true
	end

	local visualBoxes = visualEspEnabled and attachSelectionBoxes(hazardParts) or {}

	local info = {
		Instance = instance,
		Name = instance.Name,
		Class = instance.ClassName,
		Position = pos,
		Distance = dist,
		NeonCount = #hazardParts,
		SpawnTime = os.clock(),
		Connections = partConnections,
		ActiveParts = activePartsSet,
		VisualBoxes = visualBoxes,
		IsException = isException,
	}

	activeHazards[instance] = info
	hazardCount = hazardCount + 1
	lastHazardInfo = info

	-- Gắn sự kiện lắng nghe Transparency và Material thay đổi trên từng Part
	local function checkPartStatus(part)
		if not activeHazards[instance] or not activePartsSet[part] then return end

		local isExpired = (not part.Parent)
			or (part.Transparency >= FADE_TRANSPARENCY_THRESHOLD)
			or (not isException and part.Material ~= Enum.Material.Neon)

		if isExpired then
			activePartsSet[part] = nil
			-- Kiểm tra xem còn Part nào đang hoạt động không
			local remaining = 0
			for _ in pairs(activePartsSet) do
				remaining = remaining + 1
			end

			if remaining == 0 then
				unregisterHazard(instance, "Faded / Finished")
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

	activeHazards[instance] = nil
	hazardCount = math.max(0, hazardCount - 1)

	if logHazards and info then
		local reasonStr = reason and (" (" .. reason .. ")") or ""
		print(("[SmartDodge][Hazard] 🟢 Hazard Expired: %s%s")
			:format(info.Name, reasonStr))
	end

	fireHazardChanged()
end

--// Cấu hình tính toán điểm an toàn (Bài toán 2)
local playerHitboxPadding = 2.2     -- Bù trừ bán kính cơ thể nhân vật (studs) để phát hiện khi chạm mép
local showHitboxVisual = false      -- Hiển thị vòng tròn trực quan hitbox padding quanh người
local hitboxVisualPart = nil        -- Part visual hitbox tròn quanh chân
local ESCAPE_MARGIN = 4.5           -- Khoảng cách đệm an toàn sau khi ra khỏi mép (studs)
local RAYCAST_DOWN_DIST = 25        -- Khoảng cách bắn raycast xuống mặt đất (studs)
local RADIAL_DISTANCES = { 6, 10, 14, 18, 24, 30 }
local RADIAL_ANGLES = { 0, 45, 90, 135, 180, 225, 270, 315 }

--// Safe Spot State
local showSafeMarker = true
local currentSafeSpot = nil
local lockedSafeSpot = nil
local isPlayerInDanger = false
local currentDangerHazardName = nil
local currentEscapeDist = 0
local safeSpotCallbacks = {}
local safeSpotMarkerPart = nil
local safeSpotLoopThread = nil

--// Cấu hình Thực thi Né Chiêu (Bài toán 3: Hybrid MoveTo + Micro-Teleport)
local autoDodgeEnabled = false
local maxTeleportStep = 3.0          -- Bước teleport an toàn tối đa (studs) để chống anti-cheat
local microBlinkInterval = 0.05      -- Khoảng thời gian giữa các bước nhích MoveTo + Teleport
local isDodging = false
local dodgeThread = nil
local dodgeStatusCallbacks = {}

--// Raycast Parameters dùng chung
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Exclude
raycastParams.IgnoreWater = true

--// Bắn raycast kiểm tra sàn nhà và snap tọa độ xuống mặt đất
local function getFloorPosition(pos)
	local ignoreList = {}
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Character then table.insert(ignoreList, p.Character) end
	end
	if Workspace:FindFirstChild("RaycastIgnore") then
		table.insert(ignoreList, Workspace.RaycastIgnore)
	end
	if safeSpotMarkerPart then
		table.insert(ignoreList, safeSpotMarkerPart)
	end
	for inst in pairs(activeHazards) do
		table.insert(ignoreList, inst)
	end
	raycastParams.FilterDescendantsInstances = ignoreList

	local rayOrigin = Vector3.new(pos.X, pos.Y + 6, pos.Z)
	local rayDir = Vector3.new(0, -RAYCAST_DOWN_DIST, 0)
	local result = Workspace:Raycast(rayOrigin, rayDir, raycastParams)

	if result and result.Position then
		return Vector3.new(pos.X, result.Position.Y + 3, pos.Z), true
	end
	return pos, false
end

--// Kiểm tra xem một điểm P có nằm trong phạm vi sát thương của một BasePart không
local function isPointInPart(point, part)
	if not part or not part:IsA("BasePart") or not part.Parent or isIgnoredPart(part) then
		return false
	end

	-- 1. Dạng hình cầu / hình trụ (Circle / Ball / Cylinder AoE)
	if part:IsA("Part") and (part.Shape == Enum.PartType.Ball or part.Shape == Enum.PartType.Cylinder) then
		local radius = math.max(part.Size.X, part.Size.Z) / 2 + playerHitboxPadding
		local dX = point.X - part.Position.X
		local dZ = point.Z - part.Position.Z
		local distSq = dX * dX + dZ * dZ
		local heightDiff = math.abs(point.Y - part.Position.Y)
		return (distSq <= radius * radius) and (heightDiff <= math.max(10, part.Size.Y / 2 + 5))
	end

	-- 2. Dạng hình chữ nhật / hộp có hướng (Oriented Bounding Box - OBB)
	local localPos = part.CFrame:PointToObjectSpace(point)
	local halfX = part.Size.X / 2 + playerHitboxPadding
	local halfZ = part.Size.Z / 2 + playerHitboxPadding
	local halfY = math.max(8, part.Size.Y / 2 + 5)

	return math.abs(localPos.X) <= halfX
		and math.abs(localPos.Z) <= halfZ
		and math.abs(localPos.Y) <= halfY
end

--// Kiểm tra xem một điểm P có đang bị dính bất kỳ mối nguy hiểm nào không
local function isPointInAnyHazard(point)
	local bestDistSq = math.huge
	local foundInfo, foundPart = nil, nil

	for _, info in pairs(activeHazards) do
		if info.ActiveParts then
			for part in pairs(info.ActiveParts) do
				if isPointInPart(point, part) then
					local distSq = (point - part.Position).Magnitude
					if distSq < bestDistSq then
						bestDistSq = distSq
						foundInfo = info
						foundPart = part
					end
				end
			end
		end
	end

	if foundPart then
		return true, foundInfo, foundPart
	end
	return false, nil, nil
end

--// Tạo / Lấy Part hiển thị Hitbox Padding của Player quanh người
local function getOrCreateHitboxVisual()
	if hitboxVisualPart and hitboxVisualPart.Parent then
		return hitboxVisualPart
	end

	local part = Instance.new("Part")
	part.Name = "SmartDodge_HitboxVisual"
	part.Shape = Enum.PartType.Cylinder
	local diameter = math.max(0.4, playerHitboxPadding * 2)
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
local function updateHitboxVisual(playerPos)
	if not showHitboxVisual or not threatDetectorEnabled or not playerPos then
		if hitboxVisualPart then
			hitboxVisualPart.Parent = nil
		end
		return
	end

	local part = getOrCreateHitboxVisual()
	local diameter = math.max(0.4, playerHitboxPadding * 2)
	part.Size = Vector3.new(0.15, diameter, diameter)

	local floorPos, hasFloor = getFloorPosition(playerPos)
	local yPos = hasFloor and (floorPos.Y - 2.8) or (playerPos.Y - 2.8)
	local visualPos = Vector3.new(playerPos.X, yPos, playerPos.Z)

	part.CFrame = CFrame.new(visualPos) * CFrame.Angles(0, 0, math.rad(90))
	part.Parent = Workspace.Terrain
end

--// Tạo / Lấy Visual Marker phát sáng màu Xanh Lá
local function getOrCreateSafeMarker()
	if safeSpotMarkerPart and safeSpotMarkerPart.Parent then
		return safeSpotMarkerPart
	end

	local part = Instance.new("Part")
	part.Name = "SmartDodge_SafeMarker"
	part.Shape = Enum.PartType.Cylinder
	part.Size = Vector3.new(0.4, 3.5, 3.5)
	part.Color = Color3.fromRGB(0, 255, 120)
	part.Material = Enum.Material.Neon
	part.Transparency = 0.3
	part.Anchored = true
	part.CanCollide = false
	part.CanQuery = false
	part.CanTouch = false

	local selectionBox = Instance.new("SelectionBox")
	selectionBox.Name = "MarkerBorder"
	selectionBox.Color3 = Color3.fromRGB(80, 255, 160)
	selectionBox.SurfaceColor3 = Color3.fromRGB(0, 255, 120)
	selectionBox.SurfaceTransparency = 0.5
	selectionBox.LineThickness = 0.05
	selectionBox.Adornee = part
	selectionBox.Parent = part

	local bb = Instance.new("BillboardGui")
	bb.Name = "MarkerGui"
	bb.Size = UDim2.fromOffset(140, 30)
	bb.StudsOffset = Vector3.new(0, 3, 0)
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
	label.TextSize = 13
	label.Text = "🟢 SAFE SPOT"
	label.Parent = bb

	safeSpotMarkerPart = part
	return part
end

--// Cập nhật vị trí hiển thị của Safe Marker
local function updateSafeMarkerVisual(pos, inDanger, escapeDist)
	if not showSafeMarker or not inDanger or not pos then
		if safeSpotMarkerPart then
			safeSpotMarkerPart.Parent = nil
		end
		return
	end

	local marker = getOrCreateSafeMarker()
	marker.CFrame = CFrame.new(pos) * CFrame.Angles(0, 0, math.rad(90))
	marker.Parent = Workspace.Terrain

	local bb = marker:FindFirstChild("MarkerGui")
	local label = bb and bb:FindFirstChild("Label")
	if label then
		label.Text = ("🟢 SAFE SPOT (%.1fm)"):format(escapeDist or 0)
	end
end

--// Thuật toán cốt lõi: Tính toán vị trí an toàn (Safe Spot Calculation)
function smartDodge.CalculateSafeSpot(customPlayerPos)
	local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local playerPos = customPlayerPos or (rootPart and rootPart.Position)
	if not playerPos then
		lockedSafeSpot = nil
		return false, nil, nil, 0
	end

	-- 1. Kiểm tra xem Player có đang đứng trong bất kỳ vùng nguy hiểm nào không
	local inDanger, dangerInfo, dangerPart = isPointInAnyHazard(playerPos)
	if not inDanger or not dangerPart then
		lockedSafeSpot = nil
		return false, nil, nil, 0
	end

	local hazardName = dangerInfo.Name or "Unknown"

	-- 2. KHÓA ĐIỂM AN TOÀN (Latching Lock): Nếu điểm an toàn trước đó vẫn an toàn, GIỮ NGUYÊN 100% không tính lại
	if lockedSafeSpot and not isPointInAnyHazard(lockedSafeSpot) then
		local dist = (lockedSafeSpot - playerPos).Magnitude
		if dist <= 35 then
			return true, lockedSafeSpot, hazardName, math.floor(dist * 10) / 10
		end
	end

	-- 3. Chiến lược A: Thoát trực tiếp (Direct Escape Vector) từ Part gây nguy hiểm gần nhất
	local candidatePos = nil

	if dangerPart:IsA("Part") and (dangerPart.Shape == Enum.PartType.Ball or dangerPart.Shape == Enum.PartType.Cylinder) then
		-- A1. Chiêu hình tròn / hình cầu: Đẩy thẳng ra ngoài bán kính
		local radius = math.max(dangerPart.Size.X, dangerPart.Size.Z) / 2
		local diff = Vector3.new(playerPos.X - dangerPart.Position.X, 0, playerPos.Z - dangerPart.Position.Z)
		local dir = diff.Magnitude > 0.1 and diff.Unit or Vector3.new(0, 0, 1)
		local directWorld = dangerPart.Position + dir * (radius + ESCAPE_MARGIN)
		local snapped, hasFloor = getFloorPosition(directWorld)

		if hasFloor and not isPointInAnyHazard(snapped) then
			candidatePos = snapped
		end
	else
		-- A2. Chiêu hình chữ nhật / OBB: Thoát ngang 90 độ theo cạnh hẹp nhất
		local localPos = dangerPart.CFrame:PointToObjectSpace(playerPos)
		local halfX = dangerPart.Size.X / 2
		local halfZ = dangerPart.Size.Z / 2
		local targetLocal = nil

		if halfX <= halfZ then
			-- Cạnh X hẹp hơn -> Thoát ngang theo trục X
			local sign = (localPos.X >= 0) and 1 or -1
			targetLocal = Vector3.new(sign * (halfX + ESCAPE_MARGIN), 0, localPos.Z)
		else
			-- Cạnh Z hẹp hơn -> Thoát ngang theo trục Z
			local sign = (localPos.Z >= 0) and 1 or -1
			targetLocal = Vector3.new(localPos.X, 0, sign * (halfZ + ESCAPE_MARGIN))
		end

		local directWorld = dangerPart.CFrame:PointToWorldSpace(targetLocal)
		local snapped, hasFloor = getFloorPosition(directWorld)

		if hasFloor and not isPointInAnyHazard(snapped) then
			candidatePos = snapped
		end
	end

	-- 4. Chiến lược B: Lưới Tỏa Tròn (Radial Grid Search Fallback nếu thoát trực tiếp bị vướng)
	if not candidatePos then
		local bestPos = nil
		local bestDist = math.huge

		for _, dist in ipairs(RADIAL_DISTANCES) do
			for _, angleDeg in ipairs(RADIAL_ANGLES) do
				local rad = math.rad(angleDeg)
				local offset = Vector3.new(math.cos(rad) * dist, 0, math.sin(rad) * dist)
				local testWorld = playerPos + offset
				local snapped, hasFloor = getFloorPosition(testWorld)

				if hasFloor and not isPointInAnyHazard(snapped) then
					local moveDist = (snapped - playerPos).Magnitude
					if moveDist < bestDist then
						bestDist = moveDist
						bestPos = snapped
					end
				end
			end
			if bestPos then break end -- Ưu tiên vòng bán kính nhỏ nhất trước
		end

		candidatePos = bestPos
	end

	if candidatePos then
		lockedSafeSpot = candidatePos
		local escapeDist = math.floor((candidatePos - playerPos).Magnitude * 10) / 10
		return true, candidatePos, hazardName, escapeDist
	end

	lockedSafeSpot = nil
	return true, nil, hazardName, 0
end

local function fireSafeSpotChanged(inDanger, safePos, hazardName, escapeDist)
	for _, cb in ipairs(safeSpotCallbacks) do
		pcall(cb, inDanger, safePos, hazardName, escapeDist)
	end
end

local function fireDodgeStatus(status)
	for _, cb in ipairs(dodgeStatusCallbacks) do
		pcall(cb, status)
	end
end

--// Thực thi né sang Safe Spot bằng cơ chế Hybrid MoveTo + Micro-Teleport
local function performDodge(safePos, escapeDist)
	local char = player and player.Character
	local rootPart = char and char:FindFirstChild("HumanoidRootPart")
	local humanoid = char and char:FindFirstChild("Humanoid")
	if not rootPart or not humanoid or humanoid.Health <= 0 then return end

	if isDodging then return end

	dodgeThread = task.spawn(function()
		isDodging = true
		fireDodgeStatus("Dodging")

		local currentPos = rootPart.Position
		local totalDist = (safePos - currentPos).Magnitude

		-- Trường hợp 1: Khoảng cách ngắn (<= maxTeleportStep, ví dụ <= 3.0 studs) -> Teleport dứt điểm 1 nhịp
		if totalDist <= maxTeleportStep then
			rootPart.CFrame = CFrame.new(safePos, safePos + rootPart.CFrame.LookVector)
			if logInDanger then
				print(("[SmartDodge][Dodge] ⚡ Instant Micro-Teleport (%.1f studs) to Safe Spot!"):format(totalDist))
			end
			isDodging = false
			fireDodgeStatus("Safe")
			return
		end

		-- Trường hợp 2: Khoảng cách xa (> 3.0 studs) -> MoveTo kết hợp Micro-Blink
		if logInDanger then
			print(("[SmartDodge][Dodge] 🏃 Hybrid MoveTo + Micro-Blink (%.1f studs) to Safe Spot..."):format(totalDist))
		end

		local startTime = os.clock()
		local timeout = 2.0 -- Timeout an toàn 2s

		while isPlayerInDanger and autoDodgeEnabled and (os.clock() - startTime < timeout) do
			if not rootPart.Parent or not humanoid.Parent or humanoid.Health <= 0 then break end
			currentPos = rootPart.Position
			local distRemaining = (safePos - currentPos).Magnitude

			-- Nếu đã tới cự ly micro-teleport cuối cùng
			if distRemaining <= maxTeleportStep then
				rootPart.CFrame = CFrame.new(safePos, safePos + rootPart.CFrame.LookVector)
				humanoid:MoveTo(safePos)
				break
			end

			local dir = (safePos - currentPos).Unit
			local stepDist = math.min(maxTeleportStep, distRemaining - 0.5)

			humanoid:MoveTo(safePos)

			local newPos = currentPos + dir * stepDist
			local lookTarget = newPos + dir
			rootPart.CFrame = CFrame.new(newPos, Vector3.new(lookTarget.X, newPos.Y, lookTarget.Z))

			task.wait(microBlinkInterval)
		end

		isDodging = false
		fireDodgeStatus("Safe")
	end)
end

--// Vòng lặp đánh giá nguy hiểm và cập nhật Safe Spot theo thời gian thực
local function startSafeSpotLoop()
	if safeSpotLoopThread then return end
	safeSpotLoopThread = task.spawn(function()
		local lastLogTime = 0
		while threatDetectorEnabled do
			local inDanger, safePos, hazardName, escapeDist = smartDodge.CalculateSafeSpot()
			local stateChanged = (inDanger ~= isPlayerInDanger) or (safePos ~= currentSafeSpot)

			isPlayerInDanger = inDanger
			currentSafeSpot = safePos
			currentDangerHazardName = hazardName
			currentEscapeDist = escapeDist or 0

			updateSafeMarkerVisual(safePos, inDanger, escapeDist)

			local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
			local pPos = rootPart and rootPart.Position
			updateHitboxVisual(pPos)

			-- Kích hoạt Thực thi Né Chiêu (Bài toán 3)
			if inDanger and safePos and autoDodgeEnabled then
				performDodge(safePos, escapeDist)
			end

			if stateChanged then
				fireSafeSpotChanged(inDanger, safePos, hazardName, escapeDist)

				if logInDanger and inDanger and safePos and (os.clock() - lastLogTime > 0.5) then
					lastLogTime = os.clock()
					print(("[SmartDodge][InDanger] ⚠️ IN DANGER: %s | Escape Dist: %.1f studs -> SafePos: (%.1f, %.1f, %.1f)")
						:format(hazardName, escapeDist, safePos.X, safePos.Y, safePos.Z))
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
	if dodgeThread then
		task.cancel(dodgeThread)
		dodgeThread = nil
	end
	if safeSpotMarkerPart then
		safeSpotMarkerPart.Parent = nil
	end
	if hitboxVisualPart then
		hitboxVisualPart.Parent = nil
	end
	isDodging = false
	isPlayerInDanger = false
	currentSafeSpot = nil
	lockedSafeSpot = nil
	currentDangerHazardName = nil
	fireSafeSpotChanged(false, nil, nil, 0)
	fireDodgeStatus("Idle")
end

--// Bắt đầu quét & lắng nghe sự kiện Workspace cấp 1
local function startTracking()
	-- Dọn dẹp connection cũ nếu có
	for _, c in ipairs(connections) do c:Disconnect() end
	table.clear(connections)

	-- Dọn dẹp hazards cũ
	for inst, info in pairs(activeHazards) do
		if info.VisualBoxes then
			for _, box in ipairs(info.VisualBoxes) do pcall(function() box:Destroy() end) end
		end
		if info.Connections then
			for _, c in ipairs(info.Connections) do pcall(function() c:Disconnect() end) end
		end
	end
	table.clear(activeHazards)
	hazardCount = 0

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

	-- Khởi chạy vòng lặp đánh giá Safe Spot
	startSafeSpotLoop()

	if logHazards then
		print("[SmartDodge] 📡 Threat Detector & Safe Spot Engine started!")
	end
end

local function stopTracking()
	for _, c in ipairs(connections) do c:Disconnect() end
	table.clear(connections)

	for inst, info in pairs(activeHazards) do
		if info.VisualBoxes then
			for _, box in ipairs(info.VisualBoxes) do pcall(function() box:Destroy() end) end
		end
		if info.Connections then
			for _, c in ipairs(info.Connections) do pcall(function() c:Disconnect() end) end
		end
	end
	table.clear(activeHazards)
	hazardCount = 0
	fireHazardChanged()

	stopSafeSpotLoop()

	if logHazards then
		print("[SmartDodge] 🛑 Threat Detector stopped.")
	end
end

--// Methods
function smartDodge.Toggle(state)
	threatDetectorEnabled = state and true or false
	if threatDetectorEnabled then
		startTracking()
	else
		stopTracking()
	end
end

function smartDodge.IsEnabled()
	return threatDetectorEnabled
end

function smartDodge.SetLogHazards(state)
	logHazards = state and true or false
end

function smartDodge.IsLogHazardsEnabled()
	return logHazards
end

function smartDodge.SetLogInDanger(state)
	logInDanger = state and true or false
end

function smartDodge.IsLogInDangerEnabled()
	return logInDanger
end

-- Backward compatibility aliases
smartDodge.SetLogThreats = smartDodge.SetLogHazards
smartDodge.IsLogThreatsEnabled = smartDodge.IsLogHazardsEnabled

function smartDodge.SetVisualEsp(state)
	visualEspEnabled = state and true or false
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

function smartDodge.IsVisualEspEnabled()
	return visualEspEnabled
end

function smartDodge.SetShowSafeMarker(state)
	showSafeMarker = state and true or false
	updateSafeMarkerVisual(currentSafeSpot, isPlayerInDanger, currentEscapeDist)
end

function smartDodge.IsShowSafeMarkerEnabled()
	return showSafeMarker
end

function smartDodge.IsInDanger()
	return isPlayerInDanger
end

function smartDodge.GetCurrentSafeSpot()
	return currentSafeSpot, isPlayerInDanger, currentDangerHazardName, currentEscapeDist
end

function smartDodge.OnSafeSpotChanged(callback)
	if type(callback) ~= "function" then return end
	table.insert(safeSpotCallbacks, callback)
end

function smartDodge.GetHazardCount()
	return hazardCount
end

function smartDodge.GetActiveHazards()
	local list = {}
	for _, data in pairs(activeHazards) do
		if data.Instance and data.Instance.Parent == Workspace then
			table.insert(list, data)
		end
	end
	return list
end

function smartDodge.GetLastHazardInfo()
	return lastHazardInfo
end

function smartDodge.OnHazardChanged(callback)
	if type(callback) ~= "function" then return end
	table.insert(hazardChangedCallbacks, callback)
end

function smartDodge.SetAutoDodge(state)
	autoDodgeEnabled = state and true or false
end

function smartDodge.IsAutoDodgeEnabled()
	return autoDodgeEnabled
end

function smartDodge.SetMaxTeleportStep(step)
	if type(step) == "number" and step > 0 then
		maxTeleportStep = step
	end
end

function smartDodge.GetMaxTeleportStep()
	return maxTeleportStep
end

function smartDodge.GetDodgeStatus()
	if isDodging then
		return "Dodging"
	elseif isPlayerInDanger then
		return "Safe (Standing in Spot)"
	else
		return "Idle"
	end
end

function smartDodge.OnDodgeStatusChanged(callback)
	if type(callback) ~= "function" then return end
	table.insert(dodgeStatusCallbacks, callback)
end

function smartDodge.SetShowHitboxVisual(state)
	showHitboxVisual = state and true or false
	local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local pPos = rootPart and rootPart.Position
	updateHitboxVisual(pPos)
end

function smartDodge.IsShowHitboxVisualEnabled()
	return showHitboxVisual
end

function smartDodge.SetHitboxPadding(value)
	if type(value) == "number" and value >= 0 then
		playerHitboxPadding = value
		if hitboxVisualPart and hitboxVisualPart.Parent then
			local diameter = math.max(0.4, playerHitboxPadding * 2)
			hitboxVisualPart.Size = Vector3.new(0.15, diameter, diameter)
		end
	end
end

function smartDodge.GetHitboxPadding()
	return playerHitboxPadding
end

function smartDodge.SetMicroBlinkInterval(value)
	if type(value) == "number" and value > 0 then
		if value >= 1 then
			microBlinkInterval = value / 1000
		else
			microBlinkInterval = value
		end
	end
end

function smartDodge.GetMicroBlinkIntervalMs()
	return math.floor(microBlinkInterval * 1000 + 0.5)
end

function smartDodge.GetMicroBlinkInterval()
	return microBlinkInterval
end

lifecycle.Register(function()
	stopTracking()
	if safeSpotMarkerPart then
		pcall(function() safeSpotMarkerPart:Destroy() end)
		safeSpotMarkerPart = nil
	end
	if hitboxVisualPart then
		pcall(function() hitboxVisualPart:Destroy() end)
		hitboxVisualPart = nil
	end
	if dodgeThread then
		pcall(function() task.cancel(dodgeThread) end)
		dodgeThread = nil
	end
	isDodging = false
end)

return smartDodge
end function __DIST.z()-- Tab SmartDodge (DungeonQuest): Quản lý tính năng né chiêu thông minh.
-- Giai đoạn 1, 2 & 3: Threat Detection, Safe Spot Calculation & Dodge Execution.

--// Imports

local ui = __DIST.load('f')
local autoSave = __DIST.load('g')
local smartDodge = __DIST.load('y')

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

	local function updateSafeSpotUI(inDanger, safePos, hazardName, escapeDist)
		if inDanger and safePos then
			pcall(function()
				playerStateLabel:UpdateName(("Player State: <font color='rgb(255,60,60)'>⚠️ IN DANGER (%s)</font>"):format(hazardName or "Hazard"))
				safeSpotLabel:UpdateName(("Safe Target: <font color='rgb(0,255,120)'>🟢 (%.1f, %.1f, %.1f) - %.1fm</font>"):format(
					safePos.X, safePos.Y, safePos.Z, escapeDist or 0
				))
			end)
		else
			pcall(function()
				playerStateLabel:UpdateName("Player State: <font color='rgb(0,255,0)'>🟢 SAFE</font>")
				safeSpotLabel:UpdateName("Safe Target: <font color='rgb(160,160,160)'>None (No Dodge Needed)</font>")
			end)
		end
	end

	local function updateDodgeStatusUI(status)
		status = status or smartDodge.GetDodgeStatus()
		local color = "160, 160, 160"
		if status == "Dodging" then
			color = "255, 200, 50"
		elseif status == "Returning" then
			color = "80, 180, 255"
		elseif status:find("Safe") then
			color = "0, 255, 120"
		end

		pcall(function()
			dodgeActionLabel:UpdateName("Dodge Action: <font color='rgb(" .. color .. ")'>" .. status .. "</font>")
		end)
	end

	-- Lắng nghe cập nhật tức thời từ core
	smartDodge.OnHazardChanged(function(count, lastInfo)
		updateMonitor(count, lastInfo)
	end)

	smartDodge.OnSafeSpotChanged(function(inDanger, safePos, hazardName, escapeDist)
		updateSafeSpotUI(inDanger, safePos, hazardName, escapeDist)
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
		Name = "Auto Dodge Execution (Hybrid MoveTo + Teleport)",
		Default = smartDodge.IsAutoDodgeEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetAutoDodge(state)
		end),
	}, "Toggle_SmartDodgeAutoExecution")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Max Teleport Step (studs)",
		Default = smartDodge.GetMaxTeleportStep(),
		Minimum = 1,
		Maximum = 4,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			smartDodge.SetMaxTeleportStep(value)
		end),
	}, "Slider_SmartDodgeMaxStep"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Step Interval Delay (ms)",
		Default = smartDodge.GetMicroBlinkIntervalMs(),
		Minimum = 10,
		Maximum = 200,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(value)
			smartDodge.SetMicroBlinkInterval(value)
		end),
	}, "Slider_SmartDodgeStepInterval"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Player Hitbox Padding (studs)",
		Default = smartDodge.GetHitboxPadding(),
		Minimum = 0,
		Maximum = 5,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(value)
			smartDodge.SetHitboxPadding(value)
		end),
	}, "Slider_SmartDodgeHitboxPadding"))

	leftSection:Toggle({
		Name = "Show Hitbox Padding Visual (Cyan Circle)",
		Default = smartDodge.IsShowHitboxVisualEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetShowHitboxVisual(state)
		end),
	}, "Toggle_SmartDodgeHitboxVisual")

	leftSection:Toggle({
		Name = "Threat Visual ESP (SelectionBox)",
		Default = smartDodge.IsVisualEspEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetVisualEsp(state)
		end),
	}, "Toggle_SmartDodgeVisualEsp")

	leftSection:Toggle({
		Name = "Show Safe Spot Marker (Green ESP)",
		Default = smartDodge.IsShowSafeMarkerEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartDodge.SetShowSafeMarker(state)
		end),
	}, "Toggle_SmartDodgeShowSafeMarker")

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
end function __DIST.A()-- Auto Hide UI cho DungeonQuest: tự ẩn cửa sổ script hub ngay sau khi execute.
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
end function __DIST.B()-- Tab Config (DungeonQuest): tự build config section dùng API có sẵn của Maclib
-- (SaveConfig/LoadConfig/RefreshConfigList) và Dropdown (UpdateSelection/IsOption/Value...).
-- Hỗ trợ auto-select config autoload + auto-save (xem core/autoSave).

--// Imports

local macLib = __DIST.load('a')
local autoSave = __DIST.load('g')
local autoHide = __DIST.load('A')

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
end function __DIST.C()-- Webhook Discord cho DungeonQuest: gửi thông báo WIN + Reward qua Discord.
-- Bắt sự kiện `cloneRewardGui` (RemoteEvent do game fire khi thắng dungeon), đọc
-- reward, build Discord embed và gửi qua HttpService / `request` của executor.

--// Imports

local macLib = __DIST.load('a')
local notifier = __DIST.load('c')
local shared = __DIST.load('e')
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
end function __DIST.D()-- Tab Notifications (DungeonQuest): cấu hình thông báo Webhook Discord.
-- Input webhook URL + toggle bật/tắt + nút test gửi thử + cấu hình ping.

--// Imports

local webhook = __DIST.load('C')

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
end function __DIST.E()-- Tab State (DungeonQuest): hiển thị trạng thái thời gian thực của script.

--// Imports

local shared = __DIST.load('e')
local autoRetry = __DIST.load('q')

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
end function __DIST.F()-- DungeonQuest: khởi tạo window + tabs, nạp core logic và các tab UI.


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
		Player = tabGroup:Tab({ Name = "Player", Image = "rbxassetid://10734950309" }),
		Pathfinder = tabGroup:Tab({ Name = "Auto Farm", Image = "rbxassetid://18821914323" }),
		Dungeon = tabGroup:Tab({ Name = "Dungeon Joiner", Image = "rbxassetid://10734950309" }),
		Inventory = tabGroup:Tab({ Name = "Inventory", Image = "rbxassetid://10734950309" }),
		Visual = tabGroup:Tab({ Name = "Visual", Image = "rbxassetid://10734950309" }),
		SmartDodge = tabGroup:Tab({ Name = "Smart Dodge", Image = "rbxassetid://10734950309" }),
		Config = tabGroup:Tab({ Name = "Configs", Image = "rbxassetid://10734950309" }),
		Notifications = tabGroup:Tab({ Name = "Notifications", Image = "rbxassetid://10734950309" }),
		State = tabGroup:Tab({ Name = "State", Image = "rbxassetid://10734950309" }),
	}

	--// Config
	macLib:SetFolder("EsclipseHub")

	--// Tab UI (mỗi tab trigger require các core logic tương ứng)
	local speedTab = __DIST.load('i')
	local autoFarmPathfinderTab = __DIST.load('m')
	local dungeonTab = __DIST.load('r')
	local inventoryTab = __DIST.load('t')
	local visualTab = __DIST.load('x')
	local smartDodgeTab = __DIST.load('z')
	local configTab = __DIST.load('B')
	local notificationsTab = __DIST.load('D')
	local stateTab = __DIST.load('E')

	speedTab(window, tabs.Player)
	autoFarmPathfinderTab(window, tabs.Pathfinder)
	dungeonTab(window, tabs.Dungeon)
	inventoryTab(window, tabs.Inventory)
	visualTab(window, tabs.Visual)
	smartDodgeTab(window, tabs.SmartDodge)
	configTab(window, tabs.Config)
	notificationsTab(window, tabs.Notifications)
	stateTab(window, tabs.State)

	--// Phím tắt
	local shortcuts = __DIST.load('l')
	shortcuts.Init()

	--// Webhook Discord (thông báo WIN + Reward)
	local webhook = __DIST.load('C')
	webhook.Init()
__DIST.load('v')

	--// Contextual Combat settings (per dungeon x per boss/mob) - auto-switch
	

local contextual = __DIST.load('k')

	--// Auto Hide UI (ẩn cửa sổ sau khi execute)
	local autoHide = __DIST.load('A')
	autoHide.SetWindow(window)
	autoHide.Execute()

	--// Khởi chạy
	tabs.Player:Select()
	macLib:LoadAutoLoadConfig()

	--// Nạp context data SAU khi config (kể cả autoload) được load, để context đọc đúng
	--// dữ liệu đã lưu thay vì fallback về global.
	contextual.Init()
end
end function __DIST.G()
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

return flags end function __DIST.H()
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
end function __DIST.I()
--// Imports



local binder = __DIST.load('H')

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
end function __DIST.J()--// Imports

local binder = __DIST.load('H')

--// Variables
local esp = {}

--// Initialize
return binder.Wrap(esp, {
	Enabled = function(value: boolean)
		print(`{value and "Enabled" or "Disabled"} ESP.`)
	end,
}) :: { Enabled: boolean }
end function __DIST.K()--// Imports

local flags = __DIST.load('G')
local interface = __DIST.load('I')
local esp = __DIST.load('J')

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
end function __DIST.L()--// Variables

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
end function __DIST.M()--// Functions

local function cast(service: string): any
	return game:GetService(service)
end

--// Initialize
return {
	Players = cast("Players") :: Players,
}
end function __DIST.N()-- You can go even further by seperating tabs into different files, eg, Game 1/tabs/exploits.luau


return function(self)
	--// Imports
	local base = __DIST.load('K')
	local utility = __DIST.load('L')
	local services = __DIST.load('M')

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
		Load = __DIST.load('F'),
		UniverseId = 9931749389,
		Places = {
			77649408247578,
			3220968688,
			2414851778,
		},
	},

	{
		Name = "Game 2",
		Load = __DIST.load('N'),
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
