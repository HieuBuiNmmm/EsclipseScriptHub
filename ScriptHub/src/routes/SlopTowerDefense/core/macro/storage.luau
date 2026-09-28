-- Storage: Quản lý đọc, ghi và lưu trữ file Macro dưới dạng JSON trong executor.
local HttpService = game:GetService("HttpService")
local types = require("./types")
local macLib = require("@packages/Maclib")

local storage = {}

local BASE_DIR = "EsclipseHub/SlopTowerDefense/Macros"
local hasFileSystem = (isfile ~= nil and writefile ~= nil and makefolder ~= nil and isfolder ~= nil)

local memoryCache: { [string]: types.MacroData } = {}
local isInitialized = false

local function getMacroDir(): string
	local base = macLib.Folder or "EsclipseHub/SlopTowerDefense"
	if not base:find("SlopTowerDefense") then
		base = base .. "/SlopTowerDefense"
	end
	return base .. "/Macros"
end

local function getFilePath(macroName: string): string
	return string.format("%s/%s.json", getMacroDir(), macroName)
end

-- Đảm bảo thư mục lưu trữ tồn tại
local function ensureFolder()
	if not hasFileSystem then return end
	pcall(function()
		local macroDir = getMacroDir()
		local parts = macroDir:split("/")
		local current = ""
		for _, part in ipairs(parts) do
			current = (current == "") and part or (current .. "/" .. part)
			if not isfolder(current) then
				makefolder(current)
			end
		end
	end)
end

-- Khởi tạo và nạp danh sách macro từ ổ đĩa
local function initialize()
	if isInitialized then return end
	isInitialized = true

	ensureFolder()

	if hasFileSystem and listfiles then
		pcall(function()
			local dir = getMacroDir()
			if isfolder(dir) then
				local files = listfiles(dir)
				for _, filePath in ipairs(files) do
					if filePath:sub(-5) == ".json" then
						local fileName = filePath:match("([^/\\]+)%.json$")
						if fileName and #fileName > 0 then
							pcall(function()
								local content = readfile(filePath)
								local data = HttpService:JSONDecode(content) :: types.MacroData
								if data and data.Metadata then
									memoryCache[fileName] = data
								end
							end)
						end
					end
				end
			end
		end)
	end
end

-- Lấy danh sách tên tất cả các macro hiện có
function storage.ListMacros(): { string }
	initialize()

	local list = {}
	for name in pairs(memoryCache) do
		table.insert(list, name)
	end
	table.sort(list)
	return list
end

-- Kiểm tra xem macro có tồn tại không
function storage.HasMacro(name: string): boolean
	initialize()
	return memoryCache[name] ~= nil
end

-- Lấy dữ liệu của 1 macro
function storage.GetMacro(name: string): types.MacroData?
	initialize()
	return memoryCache[name]
end

-- Tạo mới 1 macro rỗng
function storage.CreateMacro(name: string): types.MacroData
	initialize()

	name = name:gsub("[%s/\\]+", "_")

	local newMacro: types.MacroData = {
		Metadata = {
			Name = name,
			CreatedAt = os.time(),
			UpdatedAt = os.time(),
			TotalSteps = 0,
			TotalDuration = 0,
		},
		Steps = {},
	}

	memoryCache[name] = newMacro
	storage.SaveMacro(name, newMacro)

	return newMacro
end

-- Lưu dữ liệu macro vào file JSON
function storage.SaveMacro(name: string, data: types.MacroData): boolean
	initialize()

	data.Metadata.UpdatedAt = os.time()
	data.Metadata.TotalSteps = #data.Steps
	memoryCache[name] = data

	if hasFileSystem then
		ensureFolder()
		local path = getFilePath(name)
		local ok, encoded = pcall(function()
			return HttpService:JSONEncode(data)
		end)
		if ok and encoded then
			local writeOk = pcall(function()
				writefile(path, encoded)
			end)
			return writeOk
		end
	end

	return true
end

-- Xóa 1 macro
function storage.DeleteMacro(name: string): boolean
	initialize()

	memoryCache[name] = nil

	if hasFileSystem and delfile then
		local path = getFilePath(name)
		if isfile(path) then
			pcall(function()
				delfile(path)
			end)
		end
	end

	return true
end

return storage
