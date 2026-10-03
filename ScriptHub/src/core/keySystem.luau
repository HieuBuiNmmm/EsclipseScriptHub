--// KeySystem: Luarmor-style Key Authentication System for EsclipseScriptHub
--// Features: HWID Binding, Silent Login via Local Cache, Modern Sleek UI, Cloudflare Worker Backend Support

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")

local keySystem = {}

export type KeySystemConfig = {
	Title: string?,
	Subtitle: string?,
	ApiUrl: string,             -- Base URL of Cloudflare Worker (e.g. "https://api.yourdomain.workers.dev")
	GetKeyUrl: string?,         -- Direct link or checkpoint URL (Linkvertise / LootLabs / etc.)
	DiscordUrl: string?,        -- Discord Invite Link
	SaveFileName: string?,      -- File name to cache key (default: "EsclipseKey.json")
	BypassKey: boolean?,        -- Developer bypass for testing
}

type VerificationResult = {
	Success: boolean,
	Message: string,
	ExpiresAt: number?,
	DaysLeft: number?,
	Payload: string?,
}

-- 1. Helper: Safe HTTP Request
local function makeRequest(options: { [string]: any }): (boolean, any)
	local httpReq = (request or http_request or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request))
	if not httpReq then
		return false, "Executor does not support HTTP requests (request/http_request missing)"
	end

	local success, response = pcall(function()
		return httpReq(options)
	end)

	if not success then
		return false, tostring(response)
	end

	return true, response
end

-- 2. Helper: Clipboard Copy
local function copyToClipboard(text: string): boolean
	local setClip = (setclipboard or toclipboard or (syn and syn.write_clipboard) or (Clipboard and Clipboard.set))
	if setClip then
		pcall(setClip, text)
		return true
	end
	return false
end

-- 3. Helper: HWID Extraction (Supports multi-executor detection + robust fallback)
function keySystem.GetHWID(): string
	local hwid: string? = nil

	-- Executor-specific native HWID grabbers
	pcall(function()
		local gHwid = (gethwid or get_hwid or (syn and syn.get_hwid) or rbx_gethwid)
		if gHwid then
			hwid = tostring(gHwid())
		end
	end)

	if hwid and #hwid > 5 then
		return hwid
	end

	-- Fallback: Generate consistent device ID via RbxAnalyticsService + LocalPlayer info
	pcall(function()
		local clientId = RbxAnalyticsService:GetClientId()
		local player = Players.LocalPlayer
		local userId = player and player.UserId or 0
		if clientId and #clientId > 5 then
			hwid = string.format("CID-%s-UID-%s", tostring(clientId), tostring(userId))
		end
	end)

	if hwid and #hwid > 5 then
		return hwid
	end

	-- Secondary Fallback
	local player = Players.LocalPlayer
	local userId = player and player.UserId or 0
	local name = player and player.Name or "Unknown"
	return string.format("FALLBACK-%d-%s", userId, name)
end

-- 4. Helper: Local File Cache
local function getFileApi()
	local isFileFunc = isfile or (syn and syn.isfile) or (getgenv and getgenv().isfile)
	local readFileFunc = readfile or (syn and syn.readfile) or (getgenv and getgenv().readfile)
	local writeFileFunc = writefile or (syn and syn.writefile) or (getgenv and getgenv().writefile)
	local delFileFunc = delfile or (syn and syn.delfile) or (getgenv and getgenv().delfile)
	local isFolderFunc = isfolder or (syn and syn.isfolder) or (getgenv and getgenv().isfolder)
	local makeFolderFunc = makefolder or (syn and syn.makefolder) or (getgenv and getgenv().makefolder)
	return isFileFunc, readFileFunc, writeFileFunc, delFileFunc, isFolderFunc, makeFolderFunc
end

local function getCacheFilePath(config: KeySystemConfig): (string, string)
	local folder = (config :: any).SaveFolder or "EsclipseHub"
	local fileName = config.SaveFileName or "key.json"
	-- If user provided a path with folder already, e.g. "EsclipseHub/key.json"
	if fileName:find("/") then
		local parts = fileName:split("/")
		local fName = parts[#parts]
		table.remove(parts, #parts)
		return fileName, table.concat(parts, "/")
	end
	return folder .. "/" .. fileName, folder
end

local function ensureFolder(folderPath: string)
	local _, _, _, _, isFolderFunc, makeFolderFunc = getFileApi()
	if not isFolderFunc or not makeFolderFunc then return end

	local parts = folderPath:split("/")
	local current = ""
	for _, part in ipairs(parts) do
		if #part > 0 then
			current = (#current > 0) and (current .. "/" .. part) or part
			local exists = false
			pcall(function() exists = isFolderFunc(current) end)
			if not exists then
				pcall(function() makeFolderFunc(current) end)
			end
		end
	end
end

local function loadCachedKey(config: KeySystemConfig): string?
	local isFileFunc, readFileFunc = getFileApi()
	if not isFileFunc or not readFileFunc then return nil end

	local primaryPath = getCacheFilePath(config)
	local exists = false
	pcall(function() exists = isFileFunc(primaryPath) end)

	local targetPath = primaryPath
	if not exists then
		-- Fallback to legacy root file if present
		local legacyPath = "EsclipseKey.json"
		local legacyExists = false
		pcall(function() legacyExists = isFileFunc(legacyPath) end)
		if legacyExists then
			targetPath = legacyPath
			exists = true
		end
	end

	if not exists then return nil end

	local content: string? = nil
	pcall(function()
		content = readFileFunc(targetPath)
	end)

	if not content or content == "" then return nil end

	local ok, decoded = pcall(function()
		return HttpService:JSONDecode(content)
	end)

	if ok and type(decoded) == "table" and decoded.Key then
		return tostring(decoded.Key)
	elseif not ok and #content > 4 then
		-- Plain text fallback
		return content:gsub("%s+", "")
	end

	return nil
end

local function saveCachedKey(config: KeySystemConfig, key: string, expiresAt: number?)
	local _, _, writeFileFunc = getFileApi()
	if not writeFileFunc then return end

	local targetPath, folder = getCacheFilePath(config)
	ensureFolder(folder)

	local payload = {
		Key = key,
		HWID = keySystem.GetHWID(),
		ExpiresAt = expiresAt or 0,
		SavedAt = os.time(),
	}

	pcall(function()
		writeFileFunc(targetPath, HttpService:JSONEncode(payload))
	end)
end

local function deleteCachedKey(config: KeySystemConfig)
	local isFileFunc, _, _, delFileFunc = getFileApi()
	if not isFileFunc or not delFileFunc then return end

	local primaryPath = getCacheFilePath(config)
	pcall(function()
		if isFileFunc(primaryPath) then
			delFileFunc(primaryPath)
		end
		-- Also clean up legacy file if present
		if isFileFunc("EsclipseKey.json") then
			delFileFunc("EsclipseKey.json")
		end
	end)
end

-- 5. API Verification
function keySystem.VerifyKeyOnline(config: KeySystemConfig, keyToVerify: string): VerificationResult
	if not keyToVerify or keyToVerify == "" then
		return { Success = false, Message = "Please enter a key!" }
	end

	local trimmed = keyToVerify:gsub("^%s+", ""):gsub("%s+$", "")
	if #trimmed < 3 then
		return { Success = false, Message = "Invalid key format!" }
	end

	-- Demo / Test Mode when API URL is not set yet
	if config.ApiUrl:find("your%-worker") or config.ApiUrl == "" then
		if trimmed:upper() == "ESCLIPSE-DEV" or trimmed:upper() == "ESCLIPSE-TEST-KEY" then
			return {
				Success = true,
				Message = "Demo key verified! (Deploy Cloudflare Worker to use live keys)",
				ExpiresAt = os.time() + 86400 * 30,
				DaysLeft = 30,
			}
		else
			return {
				Success = false,
				Message = "Demo Mode: Use key 'ESCLIPSE-DEV' or configure your Worker URL!",
			}
		end
	end

	local hwid = keySystem.GetHWID()
	local endpoint = string.format("%s/api/verify", config.ApiUrl:gsub("/+$", ""))

	local bodyPayload = HttpService:JSONEncode({
		key = trimmed,
		hwid = hwid,
		userId = Players.LocalPlayer and Players.LocalPlayer.UserId or 0,
		username = Players.LocalPlayer and Players.LocalPlayer.Name or "Unknown",
	})

	local reqOk, response = makeRequest({
		Url = endpoint,
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json",
		},
		Body = bodyPayload,
	})

	if not reqOk then
		return {
			Success = false,
			Message = "Connection failed: " .. tostring(response),
		}
	end

	local statusCode = response and (response.StatusCode or response.Status) or 0
	local responseBody = response and (response.Body or response.body) or ""

	local parseOk, parsed = pcall(function()
		return HttpService:JSONDecode(responseBody)
	end)

	if not parseOk or type(parsed) ~= "table" then
		return {
			Success = false,
			Message = string.format("Invalid server response (HTTP %d)", statusCode),
		}
	end

	if parsed.success == true or parsed.Success == true then
		return {
			Success = true,
			Message = parsed.message or "Key verified successfully!",
			ExpiresAt = parsed.expiresAt,
			DaysLeft = parsed.daysLeft,
			Payload = parsed.payload or parsed.Payload,
		}
	else
		return {
			Success = false,
			Message = parsed.message or parsed.error or "Invalid or expired key!",
		}
	end
end

-- 6. Modern Luarmor-Style UI Implementation
local function getGuiContainer(): Instance
	local getHuiFunc = (gethui or (syn and syn.get_hui))
	if getHuiFunc then
		local hui = getHuiFunc()
		if hui then return hui end
	end

	local protectFunc = (syn and syn.protect_gui)
	if protectFunc and CoreGui then
		local sg = Instance.new("Folder")
		sg.Name = "EsclipseHost"
		protectFunc(sg)
		sg.Parent = CoreGui
		return sg
	end

	if CoreGui then
		return CoreGui
	end

	local localPlayer = Players.LocalPlayer
	return localPlayer:WaitForChild("PlayerGui")
end

local function createKeyGui(config: KeySystemConfig, onVerified: (string, string?) -> (), onClosed: () -> ())
	local container = getGuiContainer()
	local localPlayer = Players.LocalPlayer
	local hwid = keySystem.GetHWID()

	-- Clean up previous instance if running
	local oldGui = container:FindFirstChild("EsclipseKeySystemGui")
	if oldGui then
		oldGui:Destroy()
	end

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "EsclipseKeySystemGui"
	screenGui.ResetOnSpawn = false
	screenGui.DisplayOrder = 9999
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.Parent = container

	-- Dim background overlay
	local overlay = Instance.new("Frame")
	overlay.Name = "Overlay"
	overlay.Size = UDim2.fromScale(1, 1)
	overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	overlay.BackgroundTransparency = 0.5
	overlay.BorderSizePixel = 0
	overlay.Parent = screenGui

	-- Main Modal Frame (430 x 395)
	local mainFrame = Instance.new("Frame")
	mainFrame.Name = "MainFrame"
	mainFrame.Size = UDim2.fromOffset(430, 395)
	mainFrame.Position = UDim2.fromScale(0.5, 0.5)
	mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
	mainFrame.BorderSizePixel = 0
	mainFrame.ClipsDescendants = true
	mainFrame.Parent = screenGui

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 10)
	corner.Parent = mainFrame

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(40, 40, 48)
	stroke.Thickness = 1
	stroke.Parent = mainFrame

	-- Top Header Bar (Draggable)
	local topBar = Instance.new("Frame")
	topBar.Name = "TopBar"
	topBar.Size = UDim2.new(1, 0, 0, 48)
	topBar.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
	topBar.BorderSizePixel = 0
	topBar.Parent = mainFrame

	local topBarCorner = Instance.new("UICorner")
	topBarCorner.CornerRadius = UDim.new(0, 10)
	topBarCorner.Parent = topBar

	-- Straighten bottom edge of topBar
	local topBarBottomCover = Instance.new("Frame")
	topBarBottomCover.Size = UDim2.new(1, 0, 0, 10)
	topBarBottomCover.Position = UDim2.new(0, 0, 1, -10)
	topBarBottomCover.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
	topBarBottomCover.BorderSizePixel = 0
	topBarBottomCover.Parent = topBar

	-- Top Accent Line (Indigo glow)
	local accentLine = Instance.new("Frame")
	accentLine.Size = UDim2.new(1, 0, 0, 2)
	accentLine.Position = UDim2.new(0, 0, 1, -1)
	accentLine.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
	accentLine.BorderSizePixel = 0
	accentLine.Parent = topBar

	-- TopBar Logo Icon (Key/Security Shield)
	local logoIcon = Instance.new("ImageLabel")
	logoIcon.Name = "LogoIcon"
	logoIcon.Size = UDim2.fromOffset(22, 22)
	logoIcon.Position = UDim2.fromOffset(14, 13)
	logoIcon.BackgroundTransparency = 1
	logoIcon.Image = "rbxassetid://10709791437" -- Key / Security Icon
	logoIcon.ImageColor3 = Color3.fromRGB(99, 102, 241) -- Indigo accent
	logoIcon.Parent = topBar

	-- Title and Subtitle
	local titleLabel = Instance.new("TextLabel")
	titleLabel.Name = "Title"
	titleLabel.Text = config.Title or "ESCLIPSE SCRIPT HUB"
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.TextSize = 13
	titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.Position = UDim2.fromOffset(42, 8)
	titleLabel.Size = UDim2.fromOffset(260, 18)
	titleLabel.BackgroundTransparency = 1
	titleLabel.Parent = topBar

	local subtitleLabel = Instance.new("TextLabel")
	subtitleLabel.Name = "Subtitle"
	subtitleLabel.Text = config.Subtitle or "Key Authentication System"
	subtitleLabel.Font = Enum.Font.Gotham
	subtitleLabel.TextSize = 11
	subtitleLabel.TextColor3 = Color3.fromRGB(150, 150, 165)
	subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
	subtitleLabel.Position = UDim2.fromOffset(42, 26)
	subtitleLabel.Size = UDim2.fromOffset(260, 14)
	subtitleLabel.BackgroundTransparency = 1
	subtitleLabel.Parent = topBar

	-- Close Button
	local closeBtn = Instance.new("TextButton")
	closeBtn.Name = "CloseBtn"
	closeBtn.Text = "X"
	closeBtn.Font = Enum.Font.GothamBold
	closeBtn.TextSize = 13
	closeBtn.TextColor3 = Color3.fromRGB(160, 160, 170)
	closeBtn.Size = UDim2.fromOffset(28, 28)
	closeBtn.Position = UDim2.new(1, -38, 0.5, -14)
	closeBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
	closeBtn.BorderSizePixel = 0
	closeBtn.Parent = topBar

	local closeCorner = Instance.new("UICorner")
	closeCorner.CornerRadius = UDim.new(0, 6)
	closeCorner.Parent = closeBtn

	closeBtn.MouseEnter:Connect(function()
		TweenService:Create(closeBtn, TweenInfo.new(0.15), {
			BackgroundColor3 = Color3.fromRGB(239, 68, 68),
			TextColor3 = Color3.fromRGB(255, 255, 255),
		}):Play()
	end)
	closeBtn.MouseLeave:Connect(function()
		TweenService:Create(closeBtn, TweenInfo.new(0.15), {
			BackgroundColor3 = Color3.fromRGB(28, 28, 35),
			TextColor3 = Color3.fromRGB(160, 160, 170),
		}):Play()
	end)

	-- Content Area
	local content = Instance.new("Frame")
	content.Name = "Content"
	content.Size = UDim2.new(1, -32, 1, -64)
	content.Position = UDim2.fromOffset(16, 56)
	content.BackgroundTransparency = 1
	content.Parent = mainFrame

	-- 1. Player Info Card (Avatar + Username + HWID)
	local userCard = Instance.new("Frame")
	userCard.Name = "UserCard"
	userCard.Size = UDim2.new(1, 0, 0, 56)
	userCard.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
	userCard.BorderSizePixel = 0
	userCard.Parent = content

	local userCardCorner = Instance.new("UICorner")
	userCardCorner.CornerRadius = UDim.new(0, 8)
	userCardCorner.Parent = userCard

	local userCardStroke = Instance.new("UIStroke")
	userCardStroke.Color = Color3.fromRGB(35, 35, 42)
	userCardStroke.Thickness = 1
	userCardStroke.Parent = userCard

	-- Avatar Thumbnail
	local avatarImg = Instance.new("ImageLabel")
	avatarImg.Name = "Avatar"
	avatarImg.Size = UDim2.fromOffset(40, 40)
	avatarImg.Position = UDim2.fromOffset(8, 8)
	avatarImg.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
	avatarImg.BorderSizePixel = 0
	avatarImg.Parent = userCard

	local avatarCorner = Instance.new("UICorner")
	avatarCorner.CornerRadius = UDim.new(0, 20)
	avatarCorner.Parent = avatarImg

	local userId = localPlayer and localPlayer.UserId or 0
	if userId > 0 then
		-- 1. Native rbxthumb (synchronous & reliable in Roblox engine)
		avatarImg.Image = string.format("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150", userId)
	else
		avatarImg.Image = "rbxassetid://10723415766" -- Fallback generic avatar
	end

	-- 2. Secondary fallback via GetUserThumbnailAsync
	task.spawn(function()
		if userId > 0 then
			pcall(function()
				local thumb, isReady = Players:GetUserThumbnailAsync(
					userId,
					Enum.ThumbnailType.HeadShot,
					Enum.ThumbnailSize.Size100x100
				)
				if thumb and thumb ~= "" then
					avatarImg.Image = thumb
				end
			end)
		end
	end)

	local displayName = localPlayer and localPlayer.DisplayName or "Player"
	local username = localPlayer and localPlayer.Name or ""
	local nameDisplay = (username ~= "" and username ~= displayName)
		and string.format("%s (@%s)", displayName, username)
		or displayName

	local nameLabel = Instance.new("TextLabel")
	nameLabel.Name = "NameLabel"
	nameLabel.Text = nameDisplay
	nameLabel.Font = Enum.Font.GothamBold
	nameLabel.TextSize = 13
	nameLabel.TextColor3 = Color3.fromRGB(240, 240, 245)
	nameLabel.TextXAlignment = Enum.TextXAlignment.Left
	nameLabel.Position = UDim2.fromOffset(56, 10)
	nameLabel.Size = UDim2.new(1, -140, 0, 16)
	nameLabel.BackgroundTransparency = 1
	nameLabel.Parent = userCard

	local hwidDisplay = #hwid > 16 and (hwid:sub(1, 8) .. "..." .. hwid:sub(#hwid - 5)) or hwid
	local hwidLabel = Instance.new("TextLabel")
	hwidLabel.Name = "HwidLabel"
	hwidLabel.Text = "HWID: " .. hwidDisplay
	hwidLabel.Font = Enum.Font.Code
	hwidLabel.TextSize = 11
	hwidLabel.TextColor3 = Color3.fromRGB(140, 140, 155)
	hwidLabel.TextXAlignment = Enum.TextXAlignment.Left
	hwidLabel.Position = UDim2.fromOffset(56, 28)
	hwidLabel.Size = UDim2.new(1, -120, 0, 16)
	hwidLabel.BackgroundTransparency = 1
	hwidLabel.Parent = userCard

	-- Copy HWID Button
	local copyHwidBtn = Instance.new("TextButton")
	copyHwidBtn.Name = "CopyHwid"
	copyHwidBtn.Text = "Copy HWID"
	copyHwidBtn.Font = Enum.Font.GothamMedium
	copyHwidBtn.TextSize = 10
	copyHwidBtn.TextColor3 = Color3.fromRGB(180, 180, 200)
	copyHwidBtn.Size = UDim2.fromOffset(72, 26)
	copyHwidBtn.Position = UDim2.new(1, -80, 0.5, -13)
	copyHwidBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
	copyHwidBtn.BorderSizePixel = 0
	copyHwidBtn.Parent = userCard

	local copyCorner = Instance.new("UICorner")
	copyCorner.CornerRadius = UDim.new(0, 5)
	copyCorner.Parent = copyHwidBtn

	copyHwidBtn.MouseButton1Click:Connect(function()
		copyToClipboard(hwid)
		copyHwidBtn.Text = "Copied!"
		task.delay(1.5, function()
			if copyHwidBtn and copyHwidBtn.Parent then
				copyHwidBtn.Text = "Copy HWID"
			end
		end)
	end)

	-- 2. Key Input Box
	local inputLabel = Instance.new("TextLabel")
	inputLabel.Text = "ENTER KEY:"
	inputLabel.Font = Enum.Font.GothamBold
	inputLabel.TextSize = 11
	inputLabel.TextColor3 = Color3.fromRGB(150, 150, 165)
	inputLabel.TextXAlignment = Enum.TextXAlignment.Left
	inputLabel.Position = UDim2.fromOffset(0, 68)
	inputLabel.Size = UDim2.new(1, 0, 0, 16)
	inputLabel.BackgroundTransparency = 1
	inputLabel.Parent = content

	local inputBoxContainer = Instance.new("Frame")
	inputBoxContainer.Name = "InputContainer"
	inputBoxContainer.Size = UDim2.new(1, 0, 0, 42)
	inputBoxContainer.Position = UDim2.fromOffset(0, 88)
	inputBoxContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
	inputBoxContainer.BorderSizePixel = 0
	inputBoxContainer.Parent = content

	local inputCorner = Instance.new("UICorner")
	inputCorner.CornerRadius = UDim.new(0, 8)
	inputCorner.Parent = inputBoxContainer

	local inputStroke = Instance.new("UIStroke")
	inputStroke.Color = Color3.fromRGB(45, 45, 55)
	inputStroke.Thickness = 1
	inputStroke.Parent = inputBoxContainer

	local keyTextBox = Instance.new("TextBox")
	keyTextBox.Name = "KeyInput"
	keyTextBox.Text = "" -- Important: Clear default "TextBox" text so placeholder shows
	keyTextBox.Size = UDim2.new(1, -70, 1, 0)
	keyTextBox.Position = UDim2.fromOffset(12, 0)
	keyTextBox.BackgroundTransparency = 1
	keyTextBox.Font = Enum.Font.Gotham
	keyTextBox.TextSize = 13
	keyTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	keyTextBox.PlaceholderText = "Paste your key here..."
	keyTextBox.PlaceholderColor3 = Color3.fromRGB(90, 90, 105)
	keyTextBox.TextXAlignment = Enum.TextXAlignment.Left
	keyTextBox.ClearTextOnFocus = false
	keyTextBox.Parent = inputBoxContainer

	-- Paste Button inside input box
	local pasteBtn = Instance.new("TextButton")
	pasteBtn.Name = "PasteBtn"
	pasteBtn.Text = "Paste"
	pasteBtn.Font = Enum.Font.GothamMedium
	pasteBtn.TextSize = 11
	pasteBtn.TextColor3 = Color3.fromRGB(180, 180, 210)
	pasteBtn.Size = UDim2.fromOffset(48, 26)
	pasteBtn.Position = UDim2.new(1, -56, 0.5, -13)
	pasteBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
	pasteBtn.BorderSizePixel = 0
	pasteBtn.Parent = inputBoxContainer

	local pasteCorner = Instance.new("UICorner")
	pasteCorner.CornerRadius = UDim.new(0, 5)
	pasteCorner.Parent = pasteBtn

	pasteBtn.MouseButton1Click:Connect(function()
		-- Some executors allow getclipboard
		local getClip = (getclipboard or (Clipboard and Clipboard.get) or (syn and syn.read_clipboard))
		if getClip then
			local ok, text = pcall(getClip)
			if ok and type(text) == "string" and #text > 0 then
				keyTextBox.Text = text
			end
		end
	end)

	-- 3. Save Key Checkbox
	local saveKeyEnabled = true
	local saveKeyRow = Instance.new("TextButton")
	saveKeyRow.Name = "SaveKeyRow"
	saveKeyRow.Size = UDim2.new(1, 0, 0, 20)
	saveKeyRow.Position = UDim2.fromOffset(0, 136)
	saveKeyRow.BackgroundTransparency = 1
	saveKeyRow.Text = ""
	saveKeyRow.Parent = content

	local checkIcon = Instance.new("Frame")
	checkIcon.Name = "Checkbox"
	checkIcon.Size = UDim2.fromOffset(16, 16)
	checkIcon.Position = UDim2.fromOffset(2, 2)
	checkIcon.BackgroundColor3 = Color3.fromRGB(99, 102, 241) -- Checked by default
	checkIcon.BorderSizePixel = 0
	checkIcon.Parent = saveKeyRow

	local checkCorner = Instance.new("UICorner")
	checkCorner.CornerRadius = UDim.new(0, 4)
	checkCorner.Parent = checkIcon

	local checkMark = Instance.new("TextLabel")
	checkMark.Size = UDim2.fromScale(1, 1)
	checkMark.BackgroundTransparency = 1
	checkMark.Text = "✓"
	checkMark.Font = Enum.Font.GothamBold
	checkMark.TextSize = 11
	checkMark.TextColor3 = Color3.fromRGB(255, 255, 255)
	checkMark.Parent = checkIcon

	local saveKeyLabel = Instance.new("TextLabel")
	saveKeyLabel.Size = UDim2.new(1, -28, 1, 0)
	saveKeyLabel.Position = UDim2.fromOffset(26, 0)
	saveKeyLabel.BackgroundTransparency = 1
	saveKeyLabel.Text = "Save key on this device (Auto-Login)"
	saveKeyLabel.Font = Enum.Font.Gotham
	saveKeyLabel.TextSize = 11
	saveKeyLabel.TextColor3 = Color3.fromRGB(180, 180, 195)
	saveKeyLabel.TextXAlignment = Enum.TextXAlignment.Left
	saveKeyLabel.Parent = saveKeyRow

	saveKeyRow.MouseButton1Click:Connect(function()
		saveKeyEnabled = not saveKeyEnabled
		if saveKeyEnabled then
			checkIcon.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
			checkMark.Visible = true
		else
			checkIcon.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
			checkMark.Visible = false
		end
	end)

	-- 4. Dynamic Status Message Box
	local statusLabel = Instance.new("TextLabel")
	statusLabel.Name = "StatusLabel"
	statusLabel.Text = "Please enter your key or click 'Get Key'."
	statusLabel.Font = Enum.Font.Gotham
	statusLabel.TextSize = 11
	statusLabel.TextColor3 = Color3.fromRGB(140, 140, 155)
	statusLabel.TextXAlignment = Enum.TextXAlignment.Center
	statusLabel.Position = UDim2.fromOffset(0, 160)
	statusLabel.Size = UDim2.new(1, 0, 0, 20)
	statusLabel.BackgroundTransparency = 1
	statusLabel.Parent = content

	local function setStatus(msg: string, color: Color3?)
		statusLabel.Text = msg
		statusLabel.TextColor3 = color or Color3.fromRGB(140, 140, 155)
	end

	-- 5. Primary Submit / Check Button
	local submitBtn = Instance.new("TextButton")
	submitBtn.Name = "SubmitBtn"
	submitBtn.Text = "Submit Key"
	submitBtn.Font = Enum.Font.GothamBold
	submitBtn.TextSize = 13
	submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	submitBtn.Size = UDim2.new(1, 0, 0, 40)
	submitBtn.Position = UDim2.fromOffset(0, 184)
	submitBtn.BackgroundColor3 = Color3.fromRGB(99, 102, 241) -- Indigo Accent
	submitBtn.BorderSizePixel = 0
	submitBtn.Parent = content

	local submitCorner = Instance.new("UICorner")
	submitCorner.CornerRadius = UDim.new(0, 8)
	submitCorner.Parent = submitBtn

	-- 6. Secondary Utility Buttons: "Get Key" & "Discord"
	local btnRow = Instance.new("Frame")
	btnRow.Name = "BtnRow"
	btnRow.Size = UDim2.new(1, 0, 0, 36)
	btnRow.Position = UDim2.fromOffset(0, 232)
	btnRow.BackgroundTransparency = 1
	btnRow.Parent = content

	local getKeyBtn = Instance.new("TextButton")
	getKeyBtn.Name = "GetKeyBtn"
	getKeyBtn.Text = "🔗 Get Key Link"
	getKeyBtn.Font = Enum.Font.GothamBold
	getKeyBtn.TextSize = 12
	getKeyBtn.TextColor3 = Color3.fromRGB(220, 220, 230)
	getKeyBtn.Size = UDim2.new(0.5, -4, 1, 0)
	getKeyBtn.Position = UDim2.new(0, 0, 0, 0)
	getKeyBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
	getKeyBtn.BorderSizePixel = 0
	getKeyBtn.Parent = btnRow

	local getKeyCorner = Instance.new("UICorner")
	getKeyCorner.CornerRadius = UDim.new(0, 8)
	getKeyCorner.Parent = getKeyBtn

	local getKeyStroke = Instance.new("UIStroke")
	getKeyStroke.Color = Color3.fromRGB(45, 45, 55)
	getKeyStroke.Thickness = 1
	getKeyStroke.Parent = getKeyBtn

	local discordBtn = Instance.new("TextButton")
	discordBtn.Name = "DiscordBtn"
	discordBtn.Text = "💬 Discord"
	discordBtn.Font = Enum.Font.GothamBold
	discordBtn.TextSize = 12
	discordBtn.TextColor3 = Color3.fromRGB(220, 220, 230)
	discordBtn.Size = UDim2.new(0.5, -4, 1, 0)
	discordBtn.Position = UDim2.new(0.5, 4, 0, 0)
	discordBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
	discordBtn.BorderSizePixel = 0
	discordBtn.Parent = btnRow

	local discordCorner = Instance.new("UICorner")
	discordCorner.CornerRadius = UDim.new(0, 8)
	discordCorner.Parent = discordBtn

	local discordStroke = Instance.new("UIStroke")
	discordStroke.Color = Color3.fromRGB(45, 45, 55)
	discordStroke.Thickness = 1
	discordStroke.Parent = discordBtn

	-- Button Actions
	getKeyBtn.MouseButton1Click:Connect(function()
		local baseUrl = config.GetKeyUrl or (config.ApiUrl .. "/getkey")
		local sep = baseUrl:find("%?") and "&" or "?"
		local url = baseUrl:find("hwid=") and baseUrl or (baseUrl .. sep .. "hwid=" .. hwid)
		local copied = copyToClipboard(url)
		if copied then
			setStatus("✅ Key link copied to clipboard!", Color3.fromRGB(34, 197, 94))
		else
			setStatus("Key URL: " .. url, Color3.fromRGB(240, 240, 240))
		end
	end)

	discordBtn.MouseButton1Click:Connect(function()
		local dUrl = config.DiscordUrl or "https://discord.gg/"
		local copied = copyToClipboard(dUrl)
		if copied then
			setStatus("✅ Discord link copied to clipboard!", Color3.fromRGB(99, 102, 241))
		else
			setStatus("Discord: " .. dUrl, Color3.fromRGB(240, 240, 240))
		end
	end)

	local isSubmitting = false
	local function doVerify()
		if isSubmitting then return end
		local key = keyTextBox.Text
		if not key or key == "" then
			setStatus("⚠️ Please enter a key!", Color3.fromRGB(239, 68, 68))
			return
		end

		isSubmitting = true
		submitBtn.Text = "Checking..."
		submitBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
		setStatus("Contacting server to verify key...", Color3.fromRGB(234, 179, 8))

		task.spawn(function()
			local result = keySystem.VerifyKeyOnline(config, key)
			if result.Success then
				setStatus("✅ " .. result.Message, Color3.fromRGB(34, 197, 94))
				submitBtn.Text = "Verified!"
				submitBtn.BackgroundColor3 = Color3.fromRGB(34, 197, 94)

				-- Save key locally so user doesn't have to enter it again
				if saveKeyEnabled then
					saveCachedKey(config, key, result.ExpiresAt)
				else
					deleteCachedKey(config)
				end

				task.wait(1.0)
				-- Fade out and destroy
				TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					Position = UDim2.fromScale(0.5, 0.55),
				}):Play()
				TweenService:Create(overlay, TweenInfo.new(0.3), {
					BackgroundTransparency = 1,
				}):Play()

				task.wait(0.35)
				screenGui:Destroy()
				onVerified(key, result.Payload)
			else
				setStatus("❌ " .. result.Message, Color3.fromRGB(239, 68, 68))
				submitBtn.Text = "Submit Key"
				submitBtn.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
				isSubmitting = false
			end
		end)
	end

	submitBtn.MouseButton1Click:Connect(doVerify)
	keyTextBox.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			doVerify()
		end
	end)

	closeBtn.MouseButton1Click:Connect(function()
		screenGui:Destroy()
		onClosed()
	end)

	-- Smooth Dragging Implementation for TopBar
	local dragging = false
	local dragInput = nil
	local dragStart = nil
	local startPos = nil

	topBar.InputBegan:Connect(function(input)
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

	topBar.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			mainFrame.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)

	-- Open Animation (Slide up & Fade in)
	mainFrame.Position = UDim2.fromScale(0.5, 0.53)
	overlay.BackgroundTransparency = 1
	TweenService:Create(overlay, TweenInfo.new(0.25), { BackgroundTransparency = 0.5 }):Play()
	TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
		Position = UDim2.fromScale(0.5, 0.5),
	}):Play()
end

-- 7. Main Entry Point: Authenticate (Yielding / Blocking until authenticated)
function keySystem.Authenticate(config: KeySystemConfig): (boolean, string?)
	-- 0. Developer Bypass
	if config.BypassKey == true then
		return true, nil
	end

	-- 1. Silent Check: Check local cached key first
	local cached = loadCachedKey(config)
	if cached and #cached > 0 then
		local silentResult = keySystem.VerifyKeyOnline(config, cached)
		if silentResult.Success then
			-- Valid! Skip UI and launch immediately
			return true, silentResult.Payload
		else
			-- Expired or invalidated -> delete outdated cache
			deleteCachedKey(config)
		end
	end

	-- 2. Prompt Key UI and wait for user completion
	local authenticated = false
	local receivedPayload: string? = nil
	local completed = false

	createKeyGui(config, function(_validKey, payload)
		authenticated = true
		receivedPayload = payload
		completed = true
	end, function()
		authenticated = false
		completed = true
	end)

	while not completed do
		task.wait(0.1)
	end

	return authenticated, receivedPayload
end

return keySystem
