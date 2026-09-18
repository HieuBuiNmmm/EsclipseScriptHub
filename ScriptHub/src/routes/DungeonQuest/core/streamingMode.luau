--// Thay thế tất cả sự xuất hiện của tên người chơi thành "Username" (hoặc chuỗi tùy chọn)
--// để hỗ trợ quay video, livestream mà không làm lộ tên tài khoản Roblox.
--// Hỗ trợ tự khôi phục lại tên gốc khi tắt, an toàn với RichText tags và chống đệ quy.

--// Imports
local macLib = require("@packages/Maclib")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local binder = require("@core/binder")
local shared = require("@routes/DungeonQuest/core/shared")

--// Services
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

--// Types
type TrackedRecord = {
	original: string,
	conns: { RBXScriptConnection },
}

--// Constants
local DEFAULT_REPLACEMENT = "Username"
local function getFolder(): string
	return (macLib and macLib.Folder) or "EsclipseHub"
end
local function getSettingsFile(): string
	return getFolder() .. "/settings/streaming_mode.json"
end

--// Table
local streamingMode = {}

--// State
local enabled = false
local isRunning = false
local replacementText = DEFAULT_REPLACEMENT
local isMasking = false
local currentWindow = nil
local inited = false
local maskStats = false

local tracked: { [Instance]: TrackedRecord } = {}
local containerConns: { RBXScriptConnection } = {}
local sweepTask: thread? = nil

local statTracked: { [TextLabel]: { original: string, originalFontFace: any, originalFont: any, conn: RBXScriptConnection? } } = {}
local isMaskingStat = false
local statsLoopTask: thread? = nil
local statsContainerConns: { RBXScriptConnection } = {}

local QUESTION_MARK_ICON = "rbxassetid://92481398073007"
local portraitTracked: { [ImageLabel]: { originalImage: string, conn: RBXScriptConnection? } } = {}
local isMaskingPortrait = false

--// Helper: Lấy LocalPlayer an toàn
local function getPlayer(): Player?
	return Players.LocalPlayer
end

--// Persistence: Tạo thư mục nếu chưa tồn tại
local function ensureFolder()
	if not (isfolder and makefolder) then return end
	pcall(function()
		local folder = getFolder()
		if not isfolder(folder) then
			makefolder(folder)
		end
		local settingsFolder = folder .. "/settings"
		if not isfolder(settingsFolder) then
			makefolder(settingsFolder)
		end
	end)
end

--// Persistence: Đọc cấu hình từ file json
local function loadSettings()
	local filePath = getSettingsFile()
	if not (isfile and isfile(filePath)) then return end
	local ok, decoded = pcall(function()
		return HttpService:JSONDecode(readfile(filePath))
	end)
	if ok and type(decoded) == "table" then
		if decoded.enabled ~= nil then
			enabled = decoded.enabled == true
		end
		if type(decoded.replacement) == "string" and #decoded.replacement > 0 then
			if decoded.replacement == "EclipseHub" then
				replacementText = DEFAULT_REPLACEMENT
			else
				replacementText = decoded.replacement
			end
		end
		if decoded.maskStats ~= nil then
			maskStats = decoded.maskStats == true
		end
	end
end

--// Persistence: Lưu cấu hình ra file json
local function saveSettings()
	if not (writefile and isfile) then return end
	ensureFolder()
	pcall(function()
		writefile(getSettingsFile(), HttpService:JSONEncode({
			enabled = enabled,
			replacement = replacementText,
			maskStats = maskStats,
		}))
	end)
end

--// Danh sách các chuỗi mục tiêu cần ẩn (Name, DisplayName), sắp xếp từ dài đến ngắn
local function getTargets(): { string }
	local targets = {}
	local p = getPlayer()
	if not p then return targets end

	local pName = p.Name
	local pDisplay = p.DisplayName
	local repLower = string.lower(replacementText)

	if pName and #pName >= 2 and string.lower(pName) ~= repLower then
		table.insert(targets, pName)
	end
	if pDisplay and #pDisplay >= 2 and string.lower(pDisplay) ~= repLower and string.lower(pDisplay) ~= string.lower(pName) then
		table.insert(targets, pDisplay)
	end

	-- Sắp xếp chuỗi dài hơn lên trước để tránh thay thế một phần (ví dụ DisplayName chứa Name)
	table.sort(targets, function(a, b)
		return #a > #b
	end)

	return targets
end

--// Thay thế chuỗi không phân biệt hoa thường theo thứ tự không đè nhau (non-overlapping)
local function replaceTargetsInText(text: string, targets: { string }, replacement: string): string
	if #text == 0 or #targets == 0 then return text end

	local lowerText = string.lower(text)
	local parts = {}
	local lastIndex = 1

	while lastIndex <= #text do
		local bestStart = nil
		local bestEnd = nil
		local bestTarget = nil

		for _, target in ipairs(targets) do
			local sStart, sEnd = string.find(lowerText, string.lower(target), lastIndex, true)
			if sStart then
				if bestStart == nil or sStart < bestStart or (sStart == bestStart and #target > #bestTarget) then
					bestStart = sStart
					bestEnd = sEnd
					bestTarget = target
				end
			end
		end

		if not bestStart then
			table.insert(parts, string.sub(text, lastIndex))
			break
		end

		if bestStart > lastIndex then
			table.insert(parts, string.sub(text, lastIndex, bestStart - 1))
		end

		table.insert(parts, replacement)
		lastIndex = bestEnd + 1
	end

	return table.concat(parts)
end

--// Thay thế text nhưng bảo vệ toàn vẹn các thẻ RichText XML (như <font color="...">, <b>, ...)
local function maskStringRich(text: string, targets: { string }, replacement: string): string
	if #text == 0 or #targets == 0 then return text end

	-- Nếu không có dấu thẻ XML thì thay thế trực tiếp
	if not string.find(text, "<") or not string.find(text, ">") then
		return replaceTargetsInText(text, targets, replacement)
	end

	local parts = {}
	local lastIndex = 1
	while lastIndex <= #text do
		local tagStart, tagEnd = string.find(text, "<[^>]->", lastIndex)
		if not tagStart then
			local segment = string.sub(text, lastIndex)
			table.insert(parts, replaceTargetsInText(segment, targets, replacement))
			break
		end

		if tagStart > lastIndex then
			local segment = string.sub(text, lastIndex, tagStart - 1)
			table.insert(parts, replaceTargetsInText(segment, targets, replacement))
		end

		table.insert(parts, string.sub(text, tagStart, tagEnd))
		lastIndex = tagEnd + 1
	end

	return table.concat(parts)
end

--// Kiểm tra xem Instance có phải là đối tượng Text hiển thị trên UI không
local function isTextInstance(inst: Instance): boolean
	return inst:IsA("TextLabel") or inst:IsA("TextButton") or inst:IsA("TextBox")
end

--// Danh sách container CoreGui an toàn nếu executor hỗ trợ
local function getCoreContainers(): { Instance }
	local containers = {}
	pcall(function()
		if typeof(gethui) == "function" then
			local hui = gethui()
			if hui and hui ~= game:GetService("CoreGui") then
				table.insert(containers, hui)
			end
		end
	end)
	pcall(function()
		local coreGui = game:GetService("CoreGui")
		if coreGui then
			table.insert(containers, coreGui)
		end
	end)
	return containers
end

--// Xử lý và che dấu tên trên 1 đối tượng Text
local function processInstance(inst: Instance)
	if not isTextInstance(inst) then return end

	-- Bỏ qua TextBox khi người chơi đang gõ để tránh gián đoạn con trỏ chuột
	if inst:IsA("TextBox") and inst:IsFocused() then return end

	local targets = getTargets()
	if #targets == 0 then return end

	local record = tracked[inst]
	if record then
		local currentText = inst.Text
		local masked = maskStringRich(currentText, targets, replacementText)
		if masked ~= currentText then
			record.original = currentText
			isMasking = true
			inst.Text = masked
			isMasking = false
		end
		return
	end

	-- Đối tượng mới
	local currentText = inst.Text
	local masked = maskStringRich(currentText, targets, replacementText)

	local newRecord: TrackedRecord = {
		original = currentText,
		conns = {},
	}

	if masked ~= currentText then
		isMasking = true
		inst.Text = masked
		isMasking = false
	end

	-- Lắng nghe Text thay đổi từ game / UI
	local textConn = inst:GetPropertyChangedSignal("Text"):Connect(function()
		if isMasking then return end
		if not isRunning then return end

		local newText = inst.Text
		local newTargets = getTargets()
		local newMasked = maskStringRich(newText, newTargets, replacementText)
		if newMasked ~= newText then
			newRecord.original = newText
			isMasking = true
			inst.Text = newMasked
			isMasking = false
		else
			newRecord.original = newText
		end
	end)
	table.insert(newRecord.conns, textConn)

	-- Nếu là TextBox, cập nhật lại sau khi FocusLost
	if inst:IsA("TextBox") then
		local focusConn = inst.FocusLost:Connect(function()
			if not isRunning then return end
			local newText = inst.Text
			local newTargets = getTargets()
			local newMasked = maskStringRich(newText, newTargets, replacementText)
			if newMasked ~= newText then
				newRecord.original = newText
				isMasking = true
				inst.Text = newMasked
				isMasking = false
			end
		end)
		table.insert(newRecord.conns, focusConn)
	end

	-- Tự giải phóng khi đối tượng bị xoá khỏi cây phân cấp
	local destroyConn
	destroyConn = inst.AncestryChanged:Connect(function(_, parent)
		if not parent then
			for _, c in ipairs(newRecord.conns) do
				pcall(function() c:Disconnect() end)
			end
			tracked[inst] = nil
		end
	end)
	table.insert(newRecord.conns, destroyConn)

	tracked[inst] = newRecord
end

--// Quét toàn bộ phần tử con của 1 container
local function sweepContainer(container: Instance)
	if not container then return end
	pcall(function()
		for _, desc in ipairs(container:GetDescendants()) do
			if isTextInstance(desc) then
				processInstance(desc)
			end
		end
	end)
end

--// Lắng nghe DescendantAdded trên 1 container
local function hookContainer(container: Instance)
	if not container then return end
	local ok, conn = pcall(function()
		return container.DescendantAdded:Connect(function(desc)
			if not isRunning then return end
			task.spawn(processInstance, desc)
		end)
	end)
	if ok and conn then
		table.insert(containerConns, conn)
	end
end

--// Khôi phục tất cả Text về nguyên bản khi tắt chế độ
local function unmaskAll()
	local targets = getTargets()
	for inst, record in pairs(tracked) do
		for _, conn in ipairs(record.conns) do
			pcall(function() conn:Disconnect() end)
		end
		pcall(function()
			if inst and inst.Parent and record.original then
				local current = inst.Text
				local expected = maskStringRich(record.original, targets, replacementText)
				if current == expected then
					isMasking = true
					inst.Text = record.original
					isMasking = false
				end
			end
		end)
	end
	table.clear(tracked)
end

--// Áp dụng trạng thái UserInfo trên Window của Maclib
local function updateMaclibWindowUserInfo()
	if currentWindow and typeof(currentWindow.SetUserInfoState) == "function" then
		pcall(function()
			-- Khi enabled = true thì ẩn/che thông tin (State = false)
			currentWindow:SetUserInfoState(not enabled)
		end)
	end
end

--// Bắt đầu che giấu
function streamingMode.Start()
	enabled = true
	saveSettings()
	if isRunning then return end
	isRunning = true

	local p = getPlayer()

	-- Quét PlayerGui
	if p then
		local pg = p:FindFirstChild("PlayerGui")
		if pg then
			sweepContainer(pg)
			hookContainer(pg)
		else
			local pgConn
			pgConn = p.ChildAdded:Connect(function(child)
				if child.Name == "PlayerGui" then
					if pgConn then pgConn:Disconnect() end
					if isRunning then
						sweepContainer(child)
						hookContainer(child)
					end
				end
			end)
			table.insert(containerConns, pgConn)
		end

		-- Quét Character hiện tại và lắng nghe CharacterAdded
		if p.Character then
			sweepContainer(p.Character)
			hookContainer(p.Character)
		end
		local charConn = p.CharacterAdded:Connect(function(newChar)
			if not isRunning then return end
			task.wait(0.2)
			if not isRunning then return end
			sweepContainer(newChar)
			hookContainer(newChar)
		end)
		table.insert(containerConns, charConn)
	end

	-- Lắng nghe BillboardGui / SurfaceGui trong workspace (nametag tùy biến)
	pcall(function()
		local wsConn = workspace.DescendantAdded:Connect(function(desc)
			if not isRunning then return end
			if desc:IsA("BillboardGui") or desc:IsA("SurfaceGui") then
				for _, child in ipairs(desc:GetDescendants()) do
					processInstance(child)
				end
				local childConn = desc.DescendantAdded:Connect(function(child)
					if not isRunning then return end
					processInstance(child)
				end)
				table.insert(containerConns, childConn)
			end
		end)
		table.insert(containerConns, wsConn)
	end)

	-- Quét CoreGui / gethui (leaderboard, Roblox chat, Maclib UI)
	for _, core in ipairs(getCoreContainers()) do
		sweepContainer(core)
		hookContainer(core)
	end

	-- Cập nhật Maclib window user info
	updateMaclibWindowUserInfo()

	-- Quét bổ sung theo các mốc thời gian đầu khi game/UI đang load dở
	task.spawn(function()
		for _, delaySec in ipairs({ 0.3, 0.8, 1.5, 3.0 }) do
			task.wait(delaySec)
			if not isRunning then break end
			local currentPlayer = getPlayer()
			if currentPlayer then
				local pg = currentPlayer:FindFirstChild("PlayerGui")
				if pg then sweepContainer(pg) end
				if currentPlayer.Character then sweepContainer(currentPlayer.Character) end
			end
			for _, core in ipairs(getCoreContainers()) do
				sweepContainer(core)
			end
		end
	end)

	-- Vòng lặp định kỳ (0.5s) để đảm bảo không lọt bất kỳ text nào tạo động
	if sweepTask then
		pcall(task.cancel, sweepTask)
	end
	sweepTask = task.spawn(function()
		while isRunning do
			task.wait(0.5)
			if not isRunning then break end
			local currentPlayer = getPlayer()
			if currentPlayer then
				local pg = currentPlayer:FindFirstChild("PlayerGui")
				if pg then sweepContainer(pg) end
				if currentPlayer.Character then sweepContainer(currentPlayer.Character) end
			end
			for _, core in ipairs(getCoreContainers()) do
				sweepContainer(core)
			end
		end
	end)
end

--// Dừng che giấu và khôi phục text gốc
function streamingMode.Stop()
	enabled = false
	saveSettings()
	if not isRunning then return end
	isRunning = false

	if sweepTask then
		pcall(task.cancel, sweepTask)
		sweepTask = nil
	end

	for _, conn in ipairs(containerConns) do
		pcall(function() conn:Disconnect() end)
	end
	table.clear(containerConns)

	unmaskAll()
	updateMaclibWindowUserInfo()
end

function streamingMode.IsEnabled(): boolean
	return enabled
end

function streamingMode.IsRunning(): boolean
	return isRunning
end

--// ==========================================
--// Stats Masking (Chuyển XP và HP thành %)
--// ==========================================
local SUFFIX_MULTIPLIERS = {
	k = 1e3,
	m = 1e6,
	b = 1e9,
	t = 1e12,
	qa = 1e15,
	qi = 1e18,
}

local function parseSuffixedNumber(str: string): number?
	if not str then return nil end
	local clean = string.gsub(str, "[,%s]", "")
	local numStr, suffix = string.match(clean, "^([%-%d.]+)%s*(%a*)$")
	if not numStr then return nil end
	local val = tonumber(numStr)
	if not val then return nil end
	if suffix and #suffix > 0 then
		local mult = SUFFIX_MULTIPLIERS[string.lower(suffix)]
		if mult then val = val * mult end
	end
	return val
end

local function formatToPercentage(text: string): string?
	if not text or #text == 0 then return nil end
	local plain = string.gsub(text, "<[^>]->", "")
	local curStr, maxStr = string.match(plain, "^%s*([%-%d.,]+%s*%a*)%s*/%s*([%-%d.,]+%s*%a*)%s*$")
	if not curStr or not maxStr then return nil end

	local cur = parseSuffixedNumber(curStr)
	local max = parseSuffixedNumber(maxStr)
	if not cur or not max or max <= 0 then return nil end

	local pct = math.clamp((cur / max) * 100, 0, 100)
	if pct == math.floor(pct) then
		return string.format("%d%%", pct)
	else
		return string.format("%.1f%%", pct)
	end
end

local function findChildRecursive(parent: Instance, name: string, maxDepth: number?): Instance?
	local depth = maxDepth or 6
	if depth < 0 or not parent then return nil end
	local direct = parent:FindFirstChild(name)
	if direct then return direct end
	for _, child in ipairs(parent:GetChildren()) do
		local found = findChildRecursive(child, name, depth - 1)
		if found then return found end
	end
	return nil
end

local function findStatLabels(): { TextLabel }
	local p = getPlayer()
	if not p then return {} end
	local pg = p:FindFirstChild("PlayerGui")
	if not pg then return {} end
	local playerStatus = pg:FindFirstChild("playerStatus")
	if not playerStatus then return {} end
	local frame = playerStatus:FindFirstChild("Frame")
	if not frame then return {} end

	local labels = {}

	-- 1. XP label: check xpFrame.xp
	local xpFrame = frame:FindFirstChild("xpFrame")
	local xpLabel = nil
	if xpFrame then
		xpLabel = xpFrame:FindFirstChild("xp")
		if not (xpLabel and xpLabel:IsA("TextLabel")) then
			xpLabel = xpFrame:FindFirstChildWhichIsA("TextLabel")
		end
	end
	if not xpLabel then
		local found = findChildRecursive(frame, "xp", 4)
		if found and found:IsA("TextLabel") then
			xpLabel = found
		end
	end
	if xpLabel and xpLabel:IsA("TextLabel") then
		table.insert(labels, xpLabel)
	end

	-- 2. HP label: check healthFrame.health / hpFrame.hp
	local healthFrame = frame:FindFirstChild("healthFrame") or frame:FindFirstChild("hpFrame")
	local hpLabel = nil
	if healthFrame then
		hpLabel = healthFrame:FindFirstChild("health") or healthFrame:FindFirstChild("hp")
		if not (hpLabel and hpLabel:IsA("TextLabel")) then
			hpLabel = healthFrame:FindFirstChildWhichIsA("TextLabel")
		end
	end
	if not hpLabel then
		local found = findChildRecursive(frame, "health", 4) or findChildRecursive(frame, "hp", 4)
		if found and found:IsA("TextLabel") then
			hpLabel = found
		end
	end
	if hpLabel and hpLabel:IsA("TextLabel") then
		table.insert(labels, hpLabel)
	end

	-- 3. Level label: check levelBorder.level
	local levelBorder = frame:FindFirstChild("levelBorder")
	local levelLabel = nil
	if levelBorder then
		levelLabel = levelBorder:FindFirstChild("level")
		if not (levelLabel and levelLabel:IsA("TextLabel")) then
			levelLabel = levelBorder:FindFirstChildWhichIsA("TextLabel")
		end
	end
	if not levelLabel then
		local found = findChildRecursive(frame, "level", 4)
		if found and found:IsA("TextLabel") then
			levelLabel = found
		end
	end
	if levelLabel and levelLabel:IsA("TextLabel") then
		table.insert(labels, levelLabel)
	end

	return labels
end

local function isLevelLabel(label: TextLabel): boolean
	if label.Name == "level" then return true end
	if label.Parent and label.Parent.Name == "levelBorder" then return true end
	return false
end

local function getMaskedText(label: TextLabel, text: string): string?
	if isLevelLabel(label) then
		return "???"
	end
	return formatToPercentage(text)
end

local function applyGothamFont(label: TextLabel)
	pcall(function()
		label.FontFace = Font.fromName("GothamSSm", Enum.FontWeight.Bold)
	end)
	pcall(function()
		label.Font = Enum.Font.GothamBold
	end)
end

local function restoreFont(label: TextLabel, record)
	pcall(function()
		if record.originalFontFace then
			label.FontFace = record.originalFontFace
		elseif record.originalFont then
			label.Font = record.originalFont
		end
	end)
end

local function processStatLabel(label: TextLabel)
	if not label or not label:IsA("TextLabel") then return end
	if statTracked[label] then return end

	local orig = label.Text
	local maskedText = getMaskedText(label, orig)

	local record = {
		original = orig,
		originalFontFace = label.FontFace,
		originalFont = label.Font,
		conn = nil :: RBXScriptConnection?,
	}

	if isLevelLabel(label) then
		local num = tonumber(tostring(orig):match("%d+"))
		if num and num > 0 then
			local numStr = tostring(num)
			pcall(function() label:SetAttribute("RealLevel", numStr) end)
			if shared and shared.SetRealPlayerLevel then shared.SetRealPlayerLevel(numStr) end
			_G.RealPlayerLevel = numStr
		end
	end

	applyGothamFont(label)

	if maskedText and maskedText ~= orig then
		isMaskingStat = true
		label.Text = maskedText
		isMaskingStat = false
	end

	local textConn = label:GetPropertyChangedSignal("Text"):Connect(function()
		if isMaskingStat then return end
		if not maskStats then return end

		local current = label.Text
		local newMasked = getMaskedText(label, current)
		applyGothamFont(label)
		if newMasked and newMasked ~= current then
			record.original = current
			if isLevelLabel(label) then
				local num = tonumber(tostring(current):match("%d+"))
				if num and num > 0 then
					local numStr = tostring(num)
					pcall(function() label:SetAttribute("RealLevel", numStr) end)
					if shared and shared.SetRealPlayerLevel then shared.SetRealPlayerLevel(numStr) end
					_G.RealPlayerLevel = numStr
				end
			end
			isMaskingStat = true
			label.Text = newMasked
			isMaskingStat = false
		elseif not newMasked and not string.find(current, "%%") and current ~= "???" then
			record.original = current
			if isLevelLabel(label) then
				local num = tonumber(tostring(current):match("%d+"))
				if num and num > 0 then
					local numStr = tostring(num)
					pcall(function() label:SetAttribute("RealLevel", numStr) end)
					if shared and shared.SetRealPlayerLevel then shared.SetRealPlayerLevel(numStr) end
					_G.RealPlayerLevel = numStr
				end
			end
		end
	end)
	record.conn = textConn

	local destroyConn
	destroyConn = label.AncestryChanged:Connect(function(_, parent)
		if not parent then
			if record.conn then pcall(function() record.conn:Disconnect() end) end
			pcall(function() destroyConn:Disconnect() end)
			statTracked[label] = nil
		end
	end)

	statTracked[label] = record
end

local function unmaskStats()
	for label, record in pairs(statTracked) do
		if record.conn then
			pcall(function() record.conn:Disconnect() end)
		end
		pcall(function()
			if label and label.Parent then
				if record.original then
					isMaskingStat = true
					label.Text = record.original
					isMaskingStat = false
				end
				restoreFont(label, record)
			end
		end)
	end
	table.clear(statTracked)
end

local function findPortraitLabel(): ImageLabel?
	local p = getPlayer()
	if not p then return nil end
	local pg = p:FindFirstChild("PlayerGui")
	if not pg then return nil end
	local playerStatus = pg:FindFirstChild("playerStatus")
	if not playerStatus then return nil end
	local frame = playerStatus:FindFirstChild("Frame")
	if not frame then return nil end

	local portraitBorder = frame:FindFirstChild("portraitBorder")
	if portraitBorder then
		local portrait = portraitBorder:FindFirstChild("portrait")
		if portrait and portrait:IsA("ImageLabel") then
			return portrait
		end
		local found = portraitBorder:FindFirstChildWhichIsA("ImageLabel")
		if found then return found end
	end

	local foundRecursive = findChildRecursive(frame, "portrait", 4)
	if foundRecursive and foundRecursive:IsA("ImageLabel") then
		return foundRecursive
	end
	return nil
end

local function processPortraitLabel(portrait: ImageLabel)
	if not portrait or not portrait:IsA("ImageLabel") then return end
	if portraitTracked[portrait] then return end

	local origImg = portrait.Image
	local record = {
		originalImage = origImg,
		conn = nil :: RBXScriptConnection?,
	}

	if origImg ~= QUESTION_MARK_ICON then
		isMaskingPortrait = true
		portrait.Image = QUESTION_MARK_ICON
		isMaskingPortrait = false
	end

	local imgConn = portrait:GetPropertyChangedSignal("Image"):Connect(function()
		if isMaskingPortrait then return end
		if not maskStats then return end

		local currentImg = portrait.Image
		if currentImg ~= QUESTION_MARK_ICON then
			record.originalImage = currentImg
			isMaskingPortrait = true
			portrait.Image = QUESTION_MARK_ICON
			isMaskingPortrait = false
		end
	end)
	record.conn = imgConn

	local destroyConn
	destroyConn = portrait.AncestryChanged:Connect(function(_, parent)
		if not parent then
			if record.conn then pcall(function() record.conn:Disconnect() end) end
			pcall(function() destroyConn:Disconnect() end)
			portraitTracked[portrait] = nil
		end
	end)

	portraitTracked[portrait] = record
end

local function unmaskPortrait()
	for portrait, record in pairs(portraitTracked) do
		if record.conn then
			pcall(function() record.conn:Disconnect() end)
		end
		pcall(function()
			if portrait and portrait.Parent and record.originalImage then
				isMaskingPortrait = true
				portrait.Image = record.originalImage
				isMaskingPortrait = false
			end
		end)
	end
	table.clear(portraitTracked)
end

local function sweepStats()
	if not maskStats then return end
	local labels = findStatLabels()
	for _, lbl in ipairs(labels) do
		processStatLabel(lbl)
		if statTracked[lbl] then
			applyGothamFont(lbl)
		end
	end

	local portrait = findPortraitLabel()
	if portrait then
		processPortraitLabel(portrait)
		if portraitTracked[portrait] and portrait.Image ~= QUESTION_MARK_ICON then
			isMaskingPortrait = true
			portrait.Image = QUESTION_MARK_ICON
			isMaskingPortrait = false
		end
	end
end

local function startStatsLoop()
	if statsLoopTask then return end
	sweepStats()
	statsLoopTask = task.spawn(function()
		while maskStats do
			sweepStats()
			task.wait(0.5)
		end
		statsLoopTask = nil
	end)
end

local function stopStatsLoop()
	if statsLoopTask then
		pcall(task.cancel, statsLoopTask)
		statsLoopTask = nil
	end
	for _, conn in ipairs(statsContainerConns) do
		pcall(function() conn:Disconnect() end)
	end
	table.clear(statsContainerConns)
	unmaskStats()
	unmaskPortrait()
end

function streamingMode.SetMaskStats(state: boolean)
	maskStats = state == true
	saveSettings()
	if maskStats then
		startStatsLoop()
	else
		stopStatsLoop()
	end
end

function streamingMode.IsMaskStats(): boolean
	return maskStats
end

function streamingMode.SetReplacement(newText: string)
	if typeof(newText) ~= "string" or #newText == 0 then
		newText = DEFAULT_REPLACEMENT
	end
	if replacementText == newText then return end

	local wasRunning = isRunning
	if wasRunning then
		streamingMode.Stop()
	end
	replacementText = newText
	saveSettings()
	if wasRunning then
		streamingMode.Start()
	end
end

function streamingMode.GetReplacement(): string
	return replacementText
end

function streamingMode.SetWindow(window)
	currentWindow = window
	if isRunning or enabled then
		updateMaclibWindowUserInfo()
	end
end

--// Khởi tạo (tự động bật nếu config lưu trước đó là true)
function streamingMode.Init()
	if inited then return end
	inited = true

	if enabled and not isRunning then
		-- Tự kích hoạt lại nếu đã lưu là bật
		streamingMode.Start()
	end
	if maskStats then
		startStatsLoop()
	end
end

function streamingMode.GetRealLevel(): string?
	for label, record in pairs(statTracked) do
		if isLevelLabel(label) and record.original then
			local num = tonumber(tostring(record.original):match("%d+"))
			if num and num > 0 then
				return tostring(num)
			end
		end
	end
	if _G.RealPlayerLevel then
		return _G.RealPlayerLevel
	end
	return nil
end

--// Nạp settings lúc require module
loadSettings()

--// Đăng ký dọn dẹp khi Hub unload hoặc script được execute lại
lifecycle.Register(function()
	if isRunning then
		streamingMode.Stop()
	end
	if maskStats then
		stopStatsLoop()
	end
	inited = false
end)

return binder.Wrap(streamingMode, {
	Enabled = function(value: boolean)
		if value then
			streamingMode.Start()
		else
			streamingMode.Stop()
		end
	end,
	Replacement = function(value: string)
		streamingMode.SetReplacement(value)
	end,
	MaskStats = function(value: boolean)
		streamingMode.SetMaskStats(value)
	end,
}) :: {
	Start: () -> (),
	Stop: () -> (),
	IsEnabled: () -> boolean,
	SetReplacement: (string) -> (),
	GetReplacement: () -> string,
	SetWindow: (any) -> (),
	Init: () -> (),
	SetMaskStats: (boolean) -> (),
	IsMaskStats: () -> boolean,
	GetRealLevel: () -> string?,
	Enabled: boolean,
	Replacement: string,
	MaskStats: boolean,
}
