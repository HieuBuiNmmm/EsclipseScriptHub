-- MapMacroManager: Quản lý cấu hình gán Macro riêng cho từng Map & Universe.
-- Cho phép Macro Player tự động ưu tiên kịch bản được chỉ định khi vào ván.

local HttpService = game:GetService("HttpService")
local storage = require("./storage")
local logger = require("@routes/SlopTowerDefense/core/system/logger")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")

local mapMacroManager = {}

export type MapEntry = {
	Key: string,
	DisplayName: string,
}

export type UniverseDef = {
	Name: string,
	Side: "Left" | "Right",
	IsRaid: boolean?,
	Description: string?,
	Maps: { MapEntry },
}

-- Danh mục Universe & Map chuẩn trong Slop Tower Defense
mapMacroManager.Universes = {
	{
		Name = "Brainrot Bases",
		Side = "Left",
		Maps = {
			{ Key = "Night Base", DisplayName = "Night Base" },
			{ Key = "Base", DisplayName = "Base" },
			{ Key = "Gold Base", DisplayName = "Gold Base" },
			{ Key = "BrainrotEndless", DisplayName = "BrainrotEndless" },
		},
	},
	{
		Name = "Toilet Territory",
		Side = "Left",
		Maps = {
			{ Key = "Desert", DisplayName = "Desert" },
			{ Key = "Toilet City", DisplayName = "Toilet City" },
			{ Key = "Ruined City", DisplayName = "Ruined City" },
			{ Key = "ToiletEndless", DisplayName = "ToiletEndless" },
		},
	},
	{
		Name = "Retro Revival",
		Side = "Left",
		Maps = {
			{ Key = "Happy Home", DisplayName = "Happy Home" },
			{ Key = "Crossroads", DisplayName = "Crossroads" },
			{ Key = "Doomspire", DisplayName = "Doomspire" },
			{ Key = "RetroEndless", DisplayName = "RetroEndless" },
		},
	},
	{
		Name = "Garden",
		Side = "Right",
		Maps = {
			{ Key = "Plot", DisplayName = "Plot" },
			{ Key = "NightPlot", DisplayName = "NightPlot" },
			{ Key = "RichPlot", DisplayName = "RichPlot" },
			{ Key = "GardenEndless", DisplayName = "GardenEndless" },
		},
	},
	{
		Name = "Backrooms",
		Side = "Right",
		Maps = {
			{ Key = "Level0", DisplayName = "Level0" },
			{ Key = "Poolrooms", DisplayName = "Poolrooms" },
			{ Key = "Level94", DisplayName = "Level94" },
			{ Key = "BackroomsEndless", DisplayName = "BackroomsEndless" },
		},
	},
	{
		Name = "Raid Progression (Stages)",
		Side = "Right",
		IsRaid = true,
		Description = "⚔️ <b>Raid Stages:</b> Raid consists of 4 sequential stages in one match (Raid ➜ Raid2 ➜ Raid3 ➜ Raid4). Assign a macro for each stage to automatically transition as the raid advances.",
		Maps = {
			{ Key = "Raid", DisplayName = "Stage 1: Raid" },
			{ Key = "Raid2", DisplayName = "Stage 2: Raid2" },
			{ Key = "Raid3", DisplayName = "Stage 3: Raid3" },
			{ Key = "Raid4", DisplayName = "Stage 4: Raid4" },
		},
	},
} :: { UniverseDef }

-- Bảng ánh xạ trong bộ nhớ: MapName -> MacroName
local mappings: { [string]: string } = {}
local listeners: { (mapName: string, macroName: string?) -> () } = {}
local listChangeListeners: { () -> () } = {}

local CONFIG_FILE = "EsclipseHub/SlopTowerDefense/map_macros.json"

local function hasFileSystemSupport(): boolean
	return (isfile ~= nil and readfile ~= nil and writefile ~= nil)
end

-- Tải cấu hình từ file JSON (nếu có)
function mapMacroManager.Load()
	if not hasFileSystemSupport() then return end
	pcall(function()
		if isfile(CONFIG_FILE) then
			local content = readfile(CONFIG_FILE)
			if content and content ~= "" then
				local decoded = HttpService:JSONDecode(content)
				if type(decoded) == "table" then
					for map, macro in pairs(decoded) do
						if type(map) == "string" and type(macro) == "string" then
							mappings[map] = macro
						end
					end

					-- Tự động di chuyển / chuẩn hóa các key Raid cũ (vd: "Raid 1", "Raid 2") sang key chuẩn
					if mappings["Raid 1"] and not mappings["Raid"] then
						mappings["Raid"] = mappings["Raid 1"]
						mappings["Raid 1"] = nil
					end
					for i = 2, 4 do
						local oldKey = "Raid " .. i
						local newKey = "Raid" .. i
						if mappings[oldKey] and not mappings[newKey] then
							mappings[newKey] = mappings[oldKey]
							mappings[oldKey] = nil
						end
					end
				end
			end
		end
	end)
end

-- Lưu cấu hình ra file JSON
function mapMacroManager.Save()
	if not hasFileSystemSupport() then return end
	pcall(function()
		local folder = "EsclipseHub/SlopTowerDefense"
		if isfolder and not isfolder(folder) then
			makefolder(folder)
		end
		local encoded = HttpService:JSONEncode(mappings)
		writefile(CONFIG_FILE, encoded)
	end)
end

-- Gán Macro cho Map (hoặc gỡ bỏ nếu truyền nil/"None")
function mapMacroManager.SetMapMacro(mapName: string, macroName: string?)
	if not mapName or mapName == "" then return end

	local cleanMacro = (macroName and macroName ~= "" and macroName ~= "None") and macroName or nil
	if mappings[mapName] == cleanMacro then return end

	mappings[mapName] = cleanMacro
	mapMacroManager.Save()

	for _, cb in ipairs(listeners) do
		task.spawn(pcall, cb, mapName, cleanMacro)
	end
end

-- Lấy Macro đã gán cho Map
function mapMacroManager.GetMapMacro(mapName: string?): string?
	if not mapName or mapName == "" then return nil end

	-- 1. Khớp chính xác tên map
	if mappings[mapName] and mappings[mapName] ~= "None" then
		return mappings[mapName]
	end

	-- 2. Khớp case-insensitive
	local mapLower = mapName:lower()
	for mName, macro in pairs(mappings) do
		if mName:lower() == mapLower and macro ~= "None" then
			return macro
		end
	end

	return nil
end

function mapMacroManager.GetAllMappings(): { [string]: string }
	return table.clone(mappings)
end

function mapMacroManager.ClearAll()
	table.clear(mappings)
	mapMacroManager.Save()
	for _, cb in ipairs(listeners) do
		task.spawn(pcall, cb, "*", nil)
	end
end

function mapMacroManager.OnMappingChanged(callback: (mapName: string, macroName: string?) -> ()): () -> ()
	table.insert(listeners, callback)
	return function()
		local idx = table.find(listeners, callback)
		if idx then table.remove(listeners, idx) end
	end
end

function mapMacroManager.OnMacroListChanged(callback: () -> ()): () -> ()
	table.insert(listChangeListeners, callback)
	return function()
		local idx = table.find(listChangeListeners, callback)
		if idx then table.remove(listChangeListeners, idx) end
	end
end

function mapMacroManager.NotifyMacroListChanged()
	for _, cb in ipairs(listChangeListeners) do
		task.spawn(pcall, cb)
	end
end

-- Tự động nạp khi module khởi tạo
mapMacroManager.Load()

local unsubStorage = storage.OnMacroListChanged(function()
	mapMacroManager.NotifyMacroListChanged()
end)

lifecycle.Register(function()
	if unsubStorage then
		pcall(unsubStorage)
	end
	table.clear(listeners)
	table.clear(listChangeListeners)
end)

return mapMacroManager
