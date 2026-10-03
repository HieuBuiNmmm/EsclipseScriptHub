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

-- Chuẩn hóa dữ liệu macro khi nạp từ file: hỗ trợ cả dạng Dictionary {"1": {...}} lẫn Array [{...}]
local function normalizeMacroData(data: any): types.MacroData?
	if type(data) ~= "table" then return nil end
	data.Metadata = data.Metadata or {
		Name = "Unknown",
		CreatedAt = os.time(),
		UpdatedAt = os.time(),
		TotalSteps = 0,
		TotalDuration = 0,
	}

	local rawSteps = data.Steps
	local arraySteps: { types.MacroStep } = {}

	if type(rawSteps) == "table" then
		-- Kiểm tra xem Steps đang ở dạng Array hay Dictionary
		local isArray = (#rawSteps > 0 and rawSteps[1] ~= nil)
		local function sanitizeStep(step: any, idx: number)
			if type(step) ~= "table" then return end
			step.Index = step.Index or idx
			if step.Type == "Speed" then
				step.TowerId = step.TowerId or "SPEED"
				step.TowerName = step.TowerName or "GameSpeed"
			elseif step.Type == "VoteSkip" then
				step.TowerId = step.TowerId or "SKIP"
				step.TowerName = step.TowerName or "VoteSkip"
			elseif step.Type == "StageTransition" then
				step.TowerId = step.TowerId or "STAGE"
				step.TowerName = step.TowerName or string.format("Raid Stage %d", step.Stage or 2)
			end
			-- Đồng bộ trường Cost và TowerCost (gộp 2 trường)
			if step.Cost == nil and step.TowerCost ~= nil then
				step.Cost = step.TowerCost
			elseif step.TowerCost == nil and step.Cost ~= nil then
				step.TowerCost = step.Cost
			end
			return step
		end

		if isArray then
			for idx, step in ipairs(rawSteps) do
				local s = sanitizeStep(step, idx)
				if s then
					table.insert(arraySteps, s)
				end
			end
		else
			-- Dạng Dictionary: {"1": {...}, "2": {...}}
			local indices = {}
			for k in pairs(rawSteps) do
				local idx = tonumber(k)
				if idx then
					table.insert(indices, idx)
				end
			end
			table.sort(indices)
			for _, idx in ipairs(indices) do
				local step = rawSteps[tostring(idx)] or rawSteps[idx]
				local s = sanitizeStep(step, idx)
				if s then
					table.insert(arraySteps, s)
				end
			end
		end
	end

	data.Steps = arraySteps
	data.Metadata.TotalSteps = #arraySteps
	return data :: types.MacroData
end

-- Xuất dữ liệu macro thành chuỗi JSON đẹp mắt, chuẩn RFC 8259, giữ nguyên tuyệt đối số thực của Position và CFrame
local function serializeMacro(data: types.MacroData): string
	local lines = {}
	table.insert(lines, "{")

	-- 1. Metadata đặt ở đầu file
	table.insert(lines, '  "Metadata": {')
	local meta = data.Metadata or {}
	local metaLines = {}
	if meta.Name then
		table.insert(metaLines, string.format('    "Name": %s', HttpService:JSONEncode(meta.Name)))
	end
	if meta.TotalSteps then
		table.insert(metaLines, string.format('    "TotalSteps": %d', meta.TotalSteps))
	end
	if meta.TotalDuration then
		table.insert(metaLines, string.format('    "TotalDuration": %s', tostring(meta.TotalDuration)))
	end
	if meta.InitialSpeed then
		table.insert(metaLines, string.format('    "InitialSpeed": %d', meta.InitialSpeed))
	end
	if meta.CreatedAt then
		table.insert(metaLines, string.format('    "CreatedAt": %s', tostring(meta.CreatedAt)))
	end
	if meta.UpdatedAt then
		table.insert(metaLines, string.format('    "UpdatedAt": %s', tostring(meta.UpdatedAt)))
	end
	if meta.Universe then
		table.insert(metaLines, string.format('    "Universe": %s', HttpService:JSONEncode(meta.Universe)))
	end
	if meta.Map then
		table.insert(metaLines, string.format('    "Map": %s', HttpService:JSONEncode(meta.Map)))
	end
	if meta.Difficulty then
		table.insert(metaLines, string.format('    "Difficulty": %s', HttpService:JSONEncode(meta.Difficulty)))
	end
	table.insert(lines, table.concat(metaLines, ",\n"))
	table.insert(lines, "  },")

	-- 2. Steps dạng Dictionary {"1": { ... }, "2": { ... }}
	local stepCount = #data.Steps
	if stepCount == 0 then
		table.insert(lines, '  "Steps": {}')
	else
		table.insert(lines, '  "Steps": {')
		for i, step in ipairs(data.Steps) do
			local stepKey = tostring(step.Index or i)
			table.insert(lines, string.format('    %q: {', stepKey))

			local fields = {}
			-- Nhóm 1: Định danh bước
			if step.Type then
				table.insert(fields, string.format('      "Type": %s', HttpService:JSONEncode(step.Type)))
			end
			if step.TowerId and step.TowerId ~= "SKIP" and step.TowerId ~= "SPEED" and step.TowerId ~= "STAGE" then
				table.insert(fields, string.format('      "TowerId": %s', HttpService:JSONEncode(step.TowerId)))
			end
			if step.TowerName and step.TowerName ~= "VoteSkip" and step.TowerName ~= "GameSpeed" and step.TowerName ~= "Unknown" and not step.TowerName:find("^Raid Stage") then
				table.insert(fields, string.format('      "TowerName": %s', HttpService:JSONEncode(step.TowerName)))
			end
			if step.Level ~= nil then
				table.insert(fields, string.format('      "Level": %d', step.Level))
			end
			if step.LayoutOrder ~= nil then
				table.insert(fields, string.format('      "LayoutOrder": %d', step.LayoutOrder))
			end

			-- Nhóm 2: Thời điểm & Tốc độ
			if step.Wave ~= nil then
				table.insert(fields, string.format('      "Wave": %d', step.Wave))
			end
			if step.Time ~= nil then
				table.insert(fields, string.format('      "Time": %s', tostring(step.Time)))
			end
			if step.RecordSpeed ~= nil then
				table.insert(fields, string.format('      "RecordSpeed": %d', step.RecordSpeed))
			end

			-- Nhóm 3: Chi phí (gộp TowerCost và Cost thành trường Cost duy nhất)
			local costVal = step.Cost or step.TowerCost
			if costVal ~= nil then
				table.insert(fields, string.format('      "Cost": %s', tostring(costVal)))
			end

			-- Nhóm 4: Tọa độ & CFrame (Giữ nguyên số thực gốc 100%, format gọn gàng 1 dòng)
			if step.Position and #step.Position > 0 then
				local posVals = {}
				for _, p in ipairs(step.Position) do
					table.insert(posVals, tostring(p))
				end
				table.insert(fields, string.format('      "Position": [%s]', table.concat(posVals, ", ")))
			end
			if step.CFrame and #step.CFrame > 0 then
				local cfVals = {}
				for _, c in ipairs(step.CFrame) do
					table.insert(cfVals, tostring(c))
				end
				table.insert(fields, string.format('      "CFrame": [%s]', table.concat(cfVals, ", ")))
			end

			-- Nhóm 5: Thuộc tính riêng từng loại hành động
			if step.TargetMode then
				table.insert(fields, string.format('      "TargetMode": %s', HttpService:JSONEncode(step.TargetMode)))
			end
			if step.Speed ~= nil then
				table.insert(fields, string.format('      "Speed": %d', step.Speed))
			end
			if step.Arg3 ~= nil and step.Arg3 ~= false then
				table.insert(fields, string.format('      "Arg3": %s', tostring(step.Arg3)))
			end
			if step.Arg4 then
				table.insert(fields, string.format('      "Arg4": %s', HttpService:JSONEncode(step.Arg4)))
			end
			if step.Arg5 and #step.Arg5 > 0 then
				local modVals = {}
				for _, m in ipairs(step.Arg5) do
					table.insert(modVals, HttpService:JSONEncode(m))
				end
				table.insert(fields, string.format('      "Arg5": [%s]', table.concat(modVals, ", ")))
			end

			local comma = (i < stepCount) and "    }," or "    }"
			table.insert(lines, table.concat(fields, ",\n"))
			table.insert(lines, comma)
		end
		table.insert(lines, "  }")
	end
	table.insert(lines, "}")

	return table.concat(lines, "\n")
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
								local rawData = HttpService:JSONDecode(content)
								local data = normalizeMacroData(rawData)
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

-- Tìm kiếm tên Macro phù hợp nhất với tên Map hiện tại (hỗ trợ "Raid", "Raid 1", "Raid_1", "Raid1", v.v.)
function storage.FindMacroForMap(mapName: string?): string?
	if not mapName or mapName == "" then return nil end
	initialize()

	-- 1. Ưu tiên 1: Khớp chính xác tuyệt đối tên (kể cả không phân biệt hoa thường)
	if memoryCache[mapName] then
		return mapName
	end
	for name in pairs(memoryCache) do
		if name:lower() == mapName:lower() then
			return name
		end
	end

	-- Chuẩn hóa tên map (chữ thường, loại bỏ khoảng trắng, gạch dưới, gạch ngang, từ khóa 'stage')
	local cleanMap = mapName:lower():gsub("[%s_%-]+", ""):gsub("stage", "")
	local mapNum = cleanMap:match("%d+$") -- Số hiệu của map nếu có (vd: "2" cho "Raid2" hoặc "Stage 2")

	-- 2. Ưu tiên 2: Khớp sau khi chuẩn hóa đầy đủ (ví dụ "Raid Stage 2" hoặc "Raid_2" khớp với "Raid2")
	for name in pairs(memoryCache) do
		local cleanName = name:lower():gsub("[%s_%-]+", ""):gsub("stage", "")
		if cleanName == cleanMap then
			return name
		end
	end

	-- 3. Ưu tiên 3: Khớp tiền tố/hậu tố nhưng đảm bảo ràng buộc số hiệu map
	for name in pairs(memoryCache) do
		local cleanName = name:lower():gsub("[%s_%-]+", ""):gsub("stage", "")
		local nameNum = cleanName:match("%d+$")

		-- Nếu map không có số (ví dụ: map "Raid"): tuyệt đối không khớp với macro có số ("Raid 2", "Raid 3")
		if not mapNum then
			if not nameNum and (cleanName:find(cleanMap, 1, true) or cleanMap:find(cleanName, 1, true)) then
				return name
			end
		else
			-- Nếu map có số (ví dụ: map "Raid2"): bắt buộc macro cũng phải có cùng số hiệu (nameNum == mapNum)
			if nameNum == mapNum and (cleanName:find(cleanMap, 1, true) or cleanMap:find(cleanName, 1, true)) then
				return name
			end
		end
	end

	return nil
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
			return serializeMacro(data)
		end)
		if not ok or not encoded then
			ok, encoded = pcall(function()
				return HttpService:JSONEncode(data)
			end)
		end
		if ok and encoded then
			local writeOk = pcall(function()
				writefile(path, encoded)
			end)
			if writeOk then
				storage.NotifyListChanged()
			end
			return writeOk
		end
	else
		storage.NotifyListChanged()
	end

	return true
end

-- Xóa 1 macro
function storage.DeleteMacro(name: string): boolean
	initialize()

	memoryCache[name] = nil

	if hasFileSystem then
		local delFn = delfile or (syn and syn.delfile)
		if delFn then
			local path = getFilePath(name)
			if isfile(path) then
				pcall(function()
					delFn(path)
				end)
			end
		end
	end

	storage.NotifyListChanged()
	return true
end

local listListeners: { () -> () } = {}

function storage.OnMacroListChanged(callback: () -> ()): () -> ()
	table.insert(listListeners, callback)
	return function()
		local idx = table.find(listListeners, callback)
		if idx then table.remove(listListeners, idx) end
	end
end

function storage.NotifyListChanged()
	for _, cb in ipairs(listListeners) do
		task.spawn(pcall, cb)
	end
end

return storage
