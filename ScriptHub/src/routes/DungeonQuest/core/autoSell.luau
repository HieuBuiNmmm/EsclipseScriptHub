-- Auto Sell (DungeonQuest): bán vật phẩm trong inventory theo điều kiện lọc.
-- Cơ chế: bấm nút "Sell Now" -> đọc inventory (remote `reloadInvy`) -> lọc theo
-- rarity/type/prefix-name/levelReq/equipped -> gom index theo category -> fire
-- remote `sellItemEvent` (payload { [category] = {index,...} }, vd { weapon = {49} }).

--// Imports
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local notifier = require("@routes/DungeonQuest/core/notifier")
local shared = require("@routes/DungeonQuest/core/shared")

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
