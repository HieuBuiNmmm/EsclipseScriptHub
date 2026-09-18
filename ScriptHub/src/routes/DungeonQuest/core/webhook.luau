-- Webhook Discord cho DungeonQuest: gửi thông báo WIN + Reward qua Discord.
-- Bắt sự kiện `cloneRewardGui` (RemoteEvent do game fire khi thắng dungeon), đọc
-- reward, build Discord embed và gửi qua HttpService / `request` của executor.

--// Imports
local macLib = require("@packages/Maclib")
local notifier = require("@routes/DungeonQuest/core/notifier")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")

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
local showPotential = true
local preRunItemIds = {}
local isSnapshotting = false

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

--// Lưu cache level thực tế cuối cùng để tránh bị mất nếu UI bị che/mask
local cachedRealLevel = nil

--// Lấy Level hiện tại (không bị ảnh hưởng bởi Streaming Mode / UI Masking)
local function getLevel(): string
	-- 1. Ưu tiên kiểm tra shared module
	if shared and type(shared.GetRealPlayerLevel) == "function" then
		local lvl = shared.GetRealPlayerLevel()
		if lvl then
			local num = tonumber(tostring(lvl):match("%d+"))
			if num and num > 0 then
				cachedRealLevel = tostring(num)
				return cachedRealLevel
			end
		end
	end

	-- 2. Kiểm tra _G / getgenv
	local gLvl = _G.RealPlayerLevel or (type(getgenv) == "function" and getgenv().RealPlayerLevel)
	if gLvl then
		local num = tonumber(tostring(gLvl):match("%d+"))
		if num and num > 0 then
			cachedRealLevel = tostring(num)
			return cachedRealLevel
		end
	end

	local p = game:GetService("Players").LocalPlayer
	if not p then return cachedRealLevel or "?" end

	-- 3. Quét leaderstats của LocalPlayer
	local leaderstats = p:FindFirstChild("leaderstats")
	if leaderstats then
		for _, child in ipairs(leaderstats:GetChildren()) do
			local n = string.lower(child.Name)
			if string.find(n, "level") or string.find(n, "lvl") then
				local num = tonumber(tostring(child.Value):match("%d+"))
				if num and num > 0 then
					cachedRealLevel = tostring(num)
					if shared and shared.SetRealPlayerLevel then shared.SetRealPlayerLevel(cachedRealLevel) end
					return cachedRealLevel
				end
			end
		end
	end

	-- 4. Quét ValueBase trực tiếp dưới LocalPlayer
	for _, child in ipairs(p:GetChildren()) do
		local n = string.lower(child.Name)
		if n == "level" or n == "lvl" or string.find(n, "level") then
			if child:IsA("ValueBase") then
				local num = tonumber(tostring(child.Value):match("%d+"))
				if num and num > 0 then
					cachedRealLevel = tostring(num)
					if shared and shared.SetRealPlayerLevel then shared.SetRealPlayerLevel(cachedRealLevel) end
					return cachedRealLevel
				end
			end
		end
	end

	-- 5. Quét Attributes trên LocalPlayer
	for attrName, attrVal in pairs(p:GetAttributes()) do
		local n = string.lower(attrName)
		if string.find(n, "level") or string.find(n, "lvl") then
			local num = tonumber(tostring(attrVal):match("%d+"))
			if num and num > 0 then
				cachedRealLevel = tostring(num)
				if shared and shared.SetRealPlayerLevel then shared.SetRealPlayerLevel(cachedRealLevel) end
				return cachedRealLevel
			end
		end
	end

	-- 6. Quét UI playerStatus
	if p:FindFirstChild("PlayerGui") then
		local playerStatus = p.PlayerGui:FindFirstChild("playerStatus")
		if playerStatus then
			local levelBorder = findChildRecursive(playerStatus, "levelBorder")
			if levelBorder then
				local label = levelBorder:FindFirstChild("level")
				if label and label:IsA("TextLabel") then
					-- Attribute RealLevel do streamingMode gán vào
					local realAttr = label:GetAttribute("RealLevel") or label:GetAttribute("OriginalText")
					if realAttr then
						local num = tonumber(tostring(realAttr):match("%d+"))
						if num and num > 0 then
							cachedRealLevel = tostring(num)
							if shared and shared.SetRealPlayerLevel then shared.SetRealPlayerLevel(cachedRealLevel) end
							return cachedRealLevel
						end
					end

					-- Nếu TextLabel hiện tại có chứa số (chưa bị mask thành ???)
					local txt = label.Text
					local num = tonumber(tostring(txt):match("%d+"))
					if num and num > 0 then
						cachedRealLevel = tostring(num)
						if shared and shared.SetRealPlayerLevel then shared.SetRealPlayerLevel(cachedRealLevel) end
						return cachedRealLevel
					end
				end
			end
		end
	end

	return cachedRealLevel or "?"
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

--// Inventory fetch & Snapshot cho tính toán Potential
local function fetchRawInventory()
	local ok, rs = pcall(function()
		return game:GetService("ReplicatedStorage"):WaitForChild("remotes", 5):WaitForChild("reloadInvy", 5)
	end)
	if not ok or not rs or not rs:IsA("RemoteFunction") then return nil end

	local ok2, data = pcall(function()
		return rs:InvokeServer()
	end)
	if not ok2 or data == nil then return nil end

	if type(data) == "table" and data["1"] and type(data["1"]) == "table" then
		return data["1"]
	end
	return data
end

local function isInventoryItem(t)
	return type(t) == "table" and (t.sellPrice ~= nil or t.UniqueItemID ~= nil or t.rarity ~= nil or t.name ~= nil)
end

local function collectInventoryItems(data)
	if type(data) ~= "table" then return {} end
	local items = {}
	local seen = {}

	local function walk(node, category)
		if type(node) ~= "table" or seen[node] then return end
		seen[node] = true

		if isInventoryItem(node) then
			local id = (node.UniqueItemID and tostring(node.UniqueItemID))
				or (node.uniqueItemNum and tostring(node.uniqueItemNum))
				or nil
			table.insert(items, {
				category = category,
				raw = node,
				id = id,
				name = tostring(node.name or node.itemName or ""),
				rarity = tostring(node.rarity or ""):lower(),
			})
			return
		end

		for key, val in pairs(node) do
			if type(val) == "table" then
				local newCat = category
				if key == "weapons" or key == "weapon" then newCat = "weapon"
				elseif key == "helmets" or key == "helmet" then newCat = "helmet"
				elseif key == "chests" or key == "chest" then newCat = "chest"
				elseif key == "abilities" or key == "ability" then newCat = "ability"
				end
				walk(val, newCat)
			end
		end
	end

	walk(data, nil)
	return items
end

local function snapshotInventory()
	if not showPotential or isSnapshotting then return end
	isSnapshotting = true
	task.spawn(function()
		local data = fetchRawInventory()
		if data then
			local items = collectInventoryItems(data)
			local newSet = {}
			for _, it in ipairs(items) do
				if it.id then
					newSet[it.id] = true
				end
			end
			preRunItemIds = newSet
		end
		isSnapshotting = false
	end)
end

--// Reset bộ đếm: ghi nhận XP trước dungeon (khi đang ở lobby/startButton hiện)
local function resetRun()
	xpBefore = getXp()
	if xpBefore == nil then ensureXpBefore() end
	shared.SetDungeonStartTime(nil)
	if showPotential then snapshotInventory() end
end

--// Bắt đầu tính thời gian hoàn thành (startButton biến mất -> vào dungeon)
local function startRun()
	if not shared.GetDungeonStartTime() then shared.SetDungeonStartTime(os.clock()) end
	if xpBefore == nil then ensureXpBefore() end
	if showPotential then snapshotInventory() end
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

--// Định dạng số có dấu phẩy phân tách hàng nghìn (ví dụ: 1,008,500)
local function formatNumber(n)
	if not n then return "0" end
	local formatted = tostring(math.floor(n))
	local k
	while true do
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", "%1,%2")
		if k == 0 then break end
	end
	return formatted
end

--// Trích xuất curUpgrades và maxUpgrades từ chuỗi (vd: "0/123773" -> 0, 123773)
local function parseUpgrades(upgradesStr)
	if not upgradesStr then return 0, 0 end
	local clean = string.gsub(tostring(upgradesStr), ",", "")
	local curStr, maxStr = string.match(clean, "(%d+)%s*/%s*(%d+)")
	if curStr and maxStr then
		return tonumber(curStr) or 0, tonumber(maxStr) or 0
	end
	local single = tonumber(string.match(clean, "^%s*([%d.-]+)"))
	return 0, single or 0
end

--// Gắn potentialInfo cho các món đồ rơi ra từ reward bằng cách so sánh Inventory Diff
local function attachPotentialInfo(reward)
	if not showPotential or not reward or type(reward.items) ~= "table" or #reward.items == 0 then
		return
	end

	local updatedData = fetchRawInventory()
	if not updatedData then return end

	local updatedItems = collectInventoryItems(updatedData)
	if #updatedItems == 0 then return end

	-- 1. Lọc ra các item mới xuất hiện so với preRunItemIds
	local newlyDropped = {}
	for _, it in ipairs(updatedItems) do
		if it.id and not preRunItemIds[it.id] then
			table.insert(newlyDropped, it)
		end
	end

	-- Fallback nếu snapshot rỗng (vd inject script giữa chừng)
	local candidatePool = (#newlyDropped > 0) and newlyDropped or updatedItems
	local usedCandidates = {}

	for _, rewItem in ipairs(reward.items) do
		local itType = tostring(rewItem.itemType or ""):lower()
		if itType == "ability" or itType == "gold" or rewItem.itemName == "gold" then
			continue
		end

		local rewName = tostring(rewItem.itemName or ""):lower()
		local matched = nil

		for idx, cand in ipairs(candidatePool) do
			if not usedCandidates[idx] then
				local candName = cand.name:lower()
				if candName == rewName or string.find(candName, rewName, 1, true) or string.find(rewName, candName, 1, true) then
					usedCandidates[idx] = true
					matched = cand
					break
				end
			end
		end

		if matched then
			local raw = matched.raw
			local itemName = tostring(raw.name or raw.itemName or rewItem.itemName or "")
			local category = matched.category or itType

			local rawMax = raw.totalUpgrades
				or raw.maxUpgrades
				or raw.totalUpgrade
				or raw.maxUpgrade
				or raw.upgradesTotal
				or raw.upgradesMax
				or raw.upgradeTotal
				or raw.upgradeLimit
				or raw.availableUpgrades

			local curUpgrades, maxUpgrades = 0, 0
			if rawMax ~= nil then
				maxUpgrades = tonumber(rawMax) or 0
			end
			if raw.curUpgrades ~= nil or raw.currentUpgrades ~= nil then
				curUpgrades = tonumber(raw.curUpgrades or raw.currentUpgrades) or 0
			end

			if raw.upgrades ~= nil then
				if type(raw.upgrades) == "string" then
					local c, m = parseUpgrades(raw.upgrades)
					curUpgrades = curUpgrades ~= 0 and curUpgrades or c
					maxUpgrades = maxUpgrades ~= 0 and maxUpgrades or m
				elseif type(raw.upgrades) == "number" then
					curUpgrades = curUpgrades ~= 0 and curUpgrades or raw.upgrades
				elseif type(raw.upgrades) == "table" then
					local c = raw.upgrades.cur or raw.upgrades.current or raw.upgrades[1]
					local m = raw.upgrades.max or raw.upgrades.total or raw.upgrades.totalUpgrades or raw.upgrades[2]
					if c ~= nil then curUpgrades = curUpgrades ~= 0 and curUpgrades or (tonumber(c) or 0) end
					if m ~= nil then maxUpgrades = maxUpgrades ~= 0 and maxUpgrades or (tonumber(m) or 0) end
				end
			end

			local physVal = tonumber(raw.physicalDamage or raw.physicalPower or 0) or 0
			local spellVal = tonumber(raw.spellPower or 0) or 0
			local healthVal = tonumber(raw.health or 0) or 0

			local statName = ""
			local statVal = 0
			local icon = ""

			if category == "weapon" or string.find(category, "weapon") then
				if spellVal > physVal then
					statName = "Spell"
					statVal = spellVal
					icon = "🔮"
				else
					statName = "Phys"
					statVal = physVal
					icon = "⚔️"
				end
			else
				local lowerName = itemName:lower()
				if string.find(lowerName, "guardian") then
					statName = "HP"
					statVal = healthVal
					icon = "🛡️"
				elseif string.find(lowerName, "mage") then
					statName = "Spell"
					statVal = spellVal
					icon = "🔮"
				elseif string.find(lowerName, "warrior") then
					statName = "Phys"
					statVal = physVal
					icon = "⚔️"
				else
					if healthVal > 10000 and healthVal > (physVal * 10) then
						statName = "HP"
						statVal = healthVal
						icon = "🛡️"
					elseif spellVal > physVal then
						statName = "Spell"
						statVal = spellVal
						icon = "🔮"
					else
						statName = "Phys"
						statVal = physVal
						icon = "⚔️"
					end
				end
			end

			local remainingUpgrades = math.max(0, maxUpgrades - curUpgrades)
			local maxPotential = statVal + (remainingUpgrades * 10)

			if statVal > 0 or maxUpgrades > 0 then
				rewItem.potentialInfo = {
					statName = statName,
					statVal = statVal,
					maxPotential = maxPotential,
					curUpgrades = curUpgrades,
					maxUpgrades = maxUpgrades,
					icon = icon,
				}
			end
		end
	end

	-- Cập nhật lại preRunItemIds để các lần chạy sau (auto retry) có baseline mới
	local newSet = {}
	for _, it in ipairs(updatedItems) do
		if it.id then newSet[it.id] = true end
	end
	preRunItemIds = newSet
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
		if decoded.showPotential ~= nil then
			showPotential = decoded.showPotential == true
		end
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
			showPotential = showPotential,
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

		local line = ""
		if #meta > 0 then
			line = string.format("%s (%s)", tostring(name), table.concat(meta, ", "))
		else
			line = tostring(name)
		end

		if showPotential and item.potentialInfo then
			local p = item.potentialInfo
			local icon = (p.icon and p.icon ~= "") and (p.icon .. " ") or ""
			local sub = string.format("  └ %sMaxPot: %s", icon, formatNumber(p.maxPotential))
			table.insert(lines, line .. "\n" .. sub)
		else
			table.insert(lines, line)
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
	if level == "???" or level == "?" or level == "" or not level:match("%d+") then
		level = getLevel()
	end
	if level == "???" or not level:match("%d+") then
		level = "?"
	end
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
			value = string.format("||%s|| (lv %s)", getPlayerName(), level),
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

function webhook.SetShowPotential(state)
	showPotential = state == true
	saveSettings()
end

function webhook.IsShowPotential()
	return showPotential
end

function webhook.Send()
	if not enabled then
		notifier.Notify("Webhook", "Notifications is disabled", 3)
		return
	end
	local testItems = {
		{
			itemName = "Valhalla Mage Armor",
			rarity = "uncommon",
			itemType = "chest",
			potentialInfo = showPotential and {
				statName = "Spell",
				statVal = 12400,
				maxPotential = 1212400,
				curUpgrades = 0,
				maxUpgrades = 120000,
				icon = "🔮",
			} or nil,
		},
		{
			itemName = "Gale Barrage",
			rarity = "epic",
			itemType = "ability",
		},
	}
	local ok, msg = sendEmbed({
		items = testItems,
		gold = 931797476,
	}, {
		level = getLevel(),
		expGained = 49530000000,
		duration = 448,
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

			if showPotential then
				pcall(attachPotentialInfo, reward)
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
	if showPotential then
		snapshotInventory()
	end
end

--// Load settings lúc require
loadSettings()

lifecycle.Register(function()
	if rewardConnection then rewardConnection:Disconnect(); rewardConnection = nil end
	if disconnectDungeonWatcher then disconnectDungeonWatcher(); disconnectDungeonWatcher = nil end
	connected = false
end)

return webhook
