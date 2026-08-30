-- Webhook Discord cho DungeonQuest: gửi thông báo WIN + Reward qua Discord.
-- Bắt sự kiện `cloneRewardGui` (RemoteEvent do game fire khi thắng dungeon), đọc
-- reward, build Discord embed và gửi qua HttpService / `request` của executor.

--// Imports
local macLib = require("@packages/Maclib")
local notifier = require("@routes/DungeonQuest/core/notifier")
local shared = require("@routes/DungeonQuest/core/shared")

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

--// Theo dõi startButton: hiện = lobby (reset), mất = vào dungeon (bắt đầu đếm)
local function startDungeonWatcher()
	task.spawn(function()
		while true do
			local p = game:GetService("Players").LocalPlayer
			local gui = p and p:FindFirstChild("PlayerGui")
			if gui and gui:FindFirstChild("startButton") then
				resetRun()
			else
				startRun()
			end
			task.wait(0.5)
		end
	end)
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
