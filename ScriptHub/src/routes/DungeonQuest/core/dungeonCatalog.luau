-- Catalog map + độ khó cho DungeonQuest, dựa trên module chooseDungeon của game.
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

return dungeonCatalog