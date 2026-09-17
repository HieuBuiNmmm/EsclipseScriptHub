-- Path Record System – Storage: quản lý MACRO bản ghi cho từng MAP.
--   - Macro = 1 bản ghi cho cả map, chứa toàn bộ segment của các room đã record.
--   - Mỗi segment = 1 room (auto-split khi record liên tục xuyên các room); segment
--     phòng bosss được đánh dấu `boss: true`.
--   - Mode của map (NORMAL skips boss / FULL record + phát cả boss room) lưu ở `mode`
--     trong CHÍNH file macro -> "tùy map".
--   - Lưu thành các file JSON độc lập trong thư mục của Hub: "EsclipseHub/DQMacro/<MapName>.json".
--   - Tự động quét tất cả file .json trong folder khi khởi động hoặc reload.
--   - Tự động migrate data cũ (từ Maclib config hoặc folder root cũ) sang EsclipseHub/DQMacro/.
--   - Format của mỗi file JSON:
--     {
--       "map": "TênMap",
--       "version": 3,
--       "created": os.time(),
--       "updated": os.time(),
--       "mode": "normal" | "full",
--       "rooms": {
--         "1": { "startPos": {X,Y,Z}, "points": [ {X,Y,Z}, ... ], "speed": 18, "events": { ... }, "boss": true },
--         ...
--       }
--     }

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local macLib = require("@packages/Maclib")
local autoSave = require("@routes/DungeonQuest/core/autoSave")

local HttpService = services.HttpService or game:GetService("HttpService")

--// Table
local storage = {}

--// Constants
local SUB_FOLDER = "DQMacro"
local LEGACY_STORAGE_KEY = "pathRecord"
local CURRENT_VERSION = 3

--// Mode của map (lưu trong file macro): NORMAL = bỏ qua boss (dùng Hazard Scanner),
--// FULL = record + phát luôn cả phòng boss theo path đã ghi.
local MODE_NORMAL = "normal"
local MODE_FULL = "full"

local function normalizeMode(mode)
	if mode == MODE_FULL then return MODE_FULL end
	return MODE_NORMAL
end

--// File system check
local hasFileSystem = (isfile ~= nil and writefile ~= nil and makefolder ~= nil and isfolder ~= nil)

--// In-memory cache
local cache = {} -- [mapName] = rawMacroTable
local isInitialized = false

--// Listeners (UI cập nhật khi bản ghi thay đổi)
local changedListeners = {}

local function fireChanged()
	for i = #changedListeners, 1, -1 do
		pcall(changedListeners[i])
	end
end

--// Đường dẫn thư mục macro nằm BÊN TRONG folder của Hub (ví dụ: EsclipseHub/DQMacro)
local function getMacroDir()
	local base = macLib.Folder or "EsclipseHub"
	return base .. "/" .. SUB_FOLDER
end

--// Đảm bảo thư mục EsclipseHub/ và EsclipseHub/DQMacro/ tồn tại
local function ensureFolder()
	if not hasFileSystem then return end
	pcall(function()
		local base = macLib.Folder or "EsclipseHub"
		if not isfolder(base) then
			makefolder(base)
		end
		local macroDir = getMacroDir()
		if not isfolder(macroDir) then
			makefolder(macroDir)
		end
	end)
end

--// Tên file an toàn không chứa ký tự cấm của hệ điều hành
local function sanitizeFileName(name)
	if type(name) ~= "string" then return "Unknown" end
	return (string.gsub(name, '[/\\:*?"<>|]', "_"))
end

local function getFilePathForMap(mapName)
	return getMacroDir() .. "/" .. sanitizeFileName(mapName) .. ".json"
end

local function encodeVec(vec)
	if not vec then return nil end
	return { X = math.round(vec.X * 100) / 100, Y = math.round(vec.Y * 100) / 100, Z = math.round(vec.Z * 100) / 100 }
end

local function decodeVec(t)
	if not t or type(t) ~= "table" then return nil end
	return Vector3.new(t.X or 0, t.Y or 0, t.Z or 0)
end

local function isRoomSeg(raw)
	return type(raw) == "table" and type(raw.points) == "table" and #raw.points > 0
end

--// Facing lưu dạng {X,Z} (trục ngang của LookVector). Decode -> Vector3 unit (X,0,Z).
local function decodeFacing(f)
	if type(f) ~= "table" or type(f.X) ~= "number" then return nil end
	local look = Vector3.new(f.X, 0, f.Z)
	if look.Magnitude < 0.001 then return nil end
	return look.Unit
end

--// Decode events của segment: dwells (đứng chờ) + skills (chuột phải).
local function decodeEvents(rawEvents)
	if type(rawEvents) ~= "table" then return nil end

	local dwells = {}
	for _, d in ipairs(rawEvents.dwells or {}) do
		local pos = decodeVec(d.pos)
		if pos then
			dwells[#dwells + 1] = {
				pos = pos,
				dur = tonumber(d.dur) or 0,
				facing = decodeFacing(d.facing),
			}
		end
	end

	local skills = {}
	for _, s in ipairs(rawEvents.skills or {}) do
		local pos = decodeVec(s.pos)
		if pos then
			skills[#skills + 1] = {
				pos = pos,
				facing = decodeFacing(s.facing),
				key = s.key, --// "M2" | "Q" | "E" (nil = macro cũ -> mặc định chuột phải)
				dw = math.floor(tonumber(s.dw) or 0), --// index dwell liên kết (0 = không)
				dwT = tonumber(s.dwT) or 0, --// giây sau khi vào dwell (dwell-linked)
			}
		end
	end

	if #dwells == 0 and #skills == 0 then return nil end
	return { dwells = dwells, skills = skills }
end

--// Khởi tạo & quét toàn bộ macro từ disk
local function initStorage()
	if isInitialized then return end
	isInitialized = true

	if hasFileSystem then
		ensureFolder()
		local macroDir = getMacroDir()

		-- Migration từ folder DQMacro ngoài root (nếu có trước đây) sang EsclipseHub/DQMacro
		if isfolder("DQMacro") and listfiles then
			pcall(function()
				local rootFiles = listfiles("DQMacro")
				if type(rootFiles) == "table" then
					for _, rPath in ipairs(rootFiles) do
						if type(rPath) == "string" and string.lower(string.sub(rPath, -5)) == ".json" and isfile(rPath) then
							local fileName = string.match(rPath, "([^/\\]+)$") or "unknown.json"
							local destPath = macroDir .. "/" .. fileName
							local content = readfile(rPath)
							writefile(destPath, content)
							delfile(rPath)
						end
					end
				end
			end)
		end

		-- Quét tất cả file .json trong EsclipseHub/DQMacro/
		if listfiles and isfolder(macroDir) then
			local ok, files = pcall(function()
				return listfiles(macroDir)
			end)
			if ok and type(files) == "table" then
				for _, filePath in ipairs(files) do
					if type(filePath) == "string" and string.lower(string.sub(filePath, -5)) == ".json" then
						pcall(function()
							if isfile(filePath) then
								local content = readfile(filePath)
								local raw = HttpService:JSONDecode(content)
								if type(raw) == "table" and type(raw.map) == "string" and type(raw.rooms) == "table" then
									cache[raw.map] = raw
								end
							end
						end)
					end
				end
			end
		end

		-- Migration từ Maclib contextData cũ (nếu có) sang EsclipseHub/DQMacro/
		local context = macLib.contextData
		if type(context) == "table" and type(context[LEGACY_STORAGE_KEY]) == "table" then
			local legacyData = context[LEGACY_STORAGE_KEY]
			local migratedAny = false
			for mapName, macro in pairs(legacyData) do
				if type(mapName) == "string" and type(macro) == "table" then
					if not cache[mapName] then
						cache[mapName] = macro
					end
					pcall(function()
						writefile(getFilePathForMap(mapName), HttpService:JSONEncode(macro))
					end)
					migratedAny = true
				end
			end
			if migratedAny then
				context[LEGACY_STORAGE_KEY] = nil
				autoSave.Save()
			end
		end
	else
		-- Fallback nếu executor không hỗ trợ file system
		local context = macLib.contextData
		if type(context) == "table" and type(context[LEGACY_STORAGE_KEY]) == "table" then
			for mapName, macro in pairs(context[LEGACY_STORAGE_KEY]) do
				if type(mapName) == "string" and type(macro) == "table" then
					cache[mapName] = macro
				end
			end
		end
	end
end

--// Làm mịn đường gấp khúc (Douglas-Peucker trên mặt phẳng XZ) kèm bảo toàn góc cua gấp (Smart Corner Preservation).
--// - Quét tìm các điểm đổi hướng lớn (> 35°) làm điểm neo (Keypoints) bắt buộc giữ lại.
--// - Áp dụng Douglas-Peucker giữa các điểm neo để làm thẳng các đoạn zíc-zắc mà không làm mất góc cua hiểm hóc.
local MIN_KEEP_SPACING = 0.1 -- Studs tối thiểu giữa 2 điểm giữ lại (độ phân giải cao)
local CORNER_COS_THRESHOLD = 0.82 -- ~35° (cos(35°) ≈ 0.819): góc lệch lớn hơn mức này coi là cua gắt
local MIN_CORNER_ARM = 0.3 -- Studs tối thiểu mỗi cánh để tránh jitter cục bộ

local function flatDistance(a, b)
	local dx = a.X - b.X
	local dz = a.Z - b.Z
	return math.sqrt(dx * dx + dz * dz)
end

function storage.SimplifyPath(points, tol)
	local n = #points
	if n <= 2 then return points end

	local keep = {}
	for i = 1, n do keep[i] = false end
	keep[1] = true
	keep[n] = true

	-- Pre-scan tìm các đỉnh cua gắt (Smart Corner Preservation)
	local keypoints = { 1 }
	for i = 2, n - 1 do
		local a = points[i - 1]
		local b = points[i]
		local c = points[i + 1]

		local v1x = b.X - a.X
		local v1z = b.Z - a.Z
		local len1 = math.sqrt(v1x * v1x + v1z * v1z)

		local v2x = c.X - b.X
		local v2z = c.Z - b.Z
		local len2 = math.sqrt(v2x * v2x + v2z * v2z)

		if len1 >= MIN_CORNER_ARM and len2 >= MIN_CORNER_ARM then
			local dot = (v1x * v2x + v1z * v2z) / (len1 * len2)
			if dot < CORNER_COS_THRESHOLD then
				keep[i] = true
				table.insert(keypoints, i)
			end
		end
	end
	table.insert(keypoints, n)

	local tol2 = tol * tol
	local stack = {}
	for k = 1, #keypoints - 1 do
		local kA, kB = keypoints[k], keypoints[k + 1]
		if kB - kA > 1 then
			table.insert(stack, { kA, kB })
		end
	end

	while #stack > 0 do
		local seg = table.remove(stack)
		local a, b = seg[1], seg[2]
		local ax, az = points[a].X, points[a].Z
		local bx, bz = points[b].X, points[b].Z
		local dx = bx - ax
		local dz = bz - az
		local len2 = dx * dx + dz * dz

		local maxD = -1
		local maxI = 0
		for i = a + 1, b - 1 do
			local t = 0
			if len2 > 0 then
				t = ((points[i].X - ax) * dx + (points[i].Z - az) * dz) / len2
				t = math.clamp(t, 0, 1)
			end
			local ex = points[i].X - (ax + dx * t)
			local ez = points[i].Z - (az + dz * t)
			local d2 = ex * ex + ez * ez
			if d2 > maxD then
				maxD = d2
				maxI = i
			end
		end
		if maxI > 0 and maxD > tol2 then
			keep[maxI] = true
			table.insert(stack, { a, maxI })
			table.insert(stack, { maxI, b })
		end
	end

	local outPts = {}
	for i = 1, n do
		if keep[i] and (#outPts == 0 or flatDistance(outPts[#outPts], points[i]) >= MIN_KEEP_SPACING or i == n) then
			table.insert(outPts, points[i])
		end
	end
	if #outPts == 1 then
		table.insert(outPts, points[n])
	end
	return outPts
end

function storage.OnChanged(callback)
	if type(callback) ~= "function" then return function() end end
	table.insert(changedListeners, callback)
	return function()
		for i, cb in ipairs(changedListeners) do
			if cb == callback then table.remove(changedListeners, i) break end
		end
	end
end

--// Có macro cho map này không?
function storage.HasMap(mapName)
	if type(mapName) ~= "string" or #mapName == 0 then return false end
	initStorage()
	local macro = cache[mapName]
	if not macro or type(macro.rooms) ~= "table" then return false end
	for _, r in pairs(macro.rooms) do
		if isRoomSeg(r) and #r.points > 0 then return true end
	end
	return false
end

--// Lấy 1 segment (room) từ macro của map. Trả về { startPos, points, events, speed, boss } hoặc nil.
function storage.GetRoomSegment(mapName, roomIndex)
	if type(mapName) ~= "string" or type(roomIndex) ~= "number" then return nil end
	initStorage()
	local macro = cache[mapName]
	if not macro or type(macro.rooms) ~= "table" then return nil end

	local raw = macro.rooms[tostring(roomIndex)]
	if not isRoomSeg(raw) then return nil end

	local points = {}
	for _, p in ipairs(raw.points) do
		local vec = decodeVec(p)
		if vec then
			points[#points + 1] = vec
		end
	end
	if #points == 0 then return nil end

	return {
		startPos = decodeVec(raw.startPos) or points[1],
		points = points,
		events = raw.events and decodeEvents(raw.events) or nil,
		speed = tonumber(raw.speed) or 0,
		boss = raw.boss == true,
	}
end

--// Có segment (room) trong macro của map không?
function storage.HasSegmentOrMacro(mapName, roomIndex)
	return storage.GetRoomSegment(mapName, roomIndex) ~= nil
end

--// Macro map đầy đủ (đã decode): { map, version, rooms = {[idx] = {startPos, points, events, speed, boss}}, created, updated }
function storage.GetMap(mapName)
	if not storage.HasMap(mapName) then return nil end
	initStorage()
	local macro = cache[mapName]
	if not macro then return nil end

	local rooms = {}
	for key, raw in pairs(macro.rooms or {}) do
		local room = tonumber(key)
		if room and isRoomSeg(raw) then
			local seg = storage.GetRoomSegment(mapName, room)
			if seg then
				rooms[room] = seg
			end
		end
	end

	return {
		map = mapName,
		version = macro.version,
		rooms = rooms,
		created = macro.created,
		updated = macro.updated,
		mode = normalizeMode(macro.mode),
	}
end

--// Danh sách các map đã có macro (sắp theo tên).
function storage.GetMaps()
	initStorage()
	local out = {}
	for mapName, macro in pairs(cache) do
		if type(mapName) == "string" and type(macro) == "table" and macro.map == mapName and type(macro.rooms) == "table" then
			local roomCount = 0
			local bossCount = 0
			local pointCount = 0
			for key, raw in pairs(macro.rooms) do
				if tonumber(key) ~= nil and isRoomSeg(raw) then
					roomCount += 1
					if raw.boss == true then bossCount += 1 end
					pointCount += #raw.points
				end
			end
			if roomCount > 0 then
				table.insert(out, {
					map = mapName,
					roomCount = roomCount,
					bossCount = bossCount,
					pointCount = pointCount,
					updated = macro.updated,
					mode = normalizeMode(macro.mode),
				})
			end
		end
	end
	table.sort(out, function(a, b)
		return a.map < b.map
	end)
	return out
end

function storage.Count()
	return #storage.GetMaps()
end

--// Lưu/ghi đè 1 segment (room) vào macro của map.
--// isBoss (optional): segment thuộc phòng boss -> đánh dấu `boss: true`.
--// Ghi trực tiếp ra file EsclipseHub/DQMacro/<mapName>.json.
function storage.SaveSegment(mapName, roomIndex, startPos, points, events, speed, isBoss)
	if type(mapName) ~= "string" or #mapName == 0 then return false end
	if type(roomIndex) ~= "number" or roomIndex <= 0 then return false end
	if not startPos or not points or #points == 0 then return false end

	initStorage()

	local macro = cache[mapName]
	if not macro or type(macro) ~= "table" then
		macro = {
			map = mapName,
			version = CURRENT_VERSION,
			created = os.time(),
			updated = os.time(),
			mode = MODE_NORMAL,
			rooms = {},
		}
		cache[mapName] = macro
	end
	if type(macro.rooms) ~= "table" then macro.rooms = {} end

	local encoded = {}
	for _, p in ipairs(points) do
		encoded[#encoded + 1] = encodeVec(p)
	end
	local seg = {
		startPos = encodeVec(startPos) or encoded[1],
		points = encoded,
	}
	if isBoss then
		seg.boss = true
	end
	if type(speed) == "number" and speed > 0 then
		seg.speed = speed
	end

	local function encodeEventsTable(ev)
		if not ev or type(ev) ~= "table" then return nil end
		local nD = #(ev.dwells or {})
		local nS = #(ev.skills or {})
		if nD == 0 and nS == 0 then return nil end
		local encEvents = { dwells = {}, skills = {} }
		for _, d in ipairs(ev.dwells or {}) do
			encEvents.dwells[#encEvents.dwells + 1] = {
				pos = encodeVec(d.pos),
				dur = d.dur or 0,
				facing = d.facing,
			}
		end
		for _, s in ipairs(ev.skills or {}) do
			encEvents.skills[#encEvents.skills + 1] = {
				pos = encodeVec(s.pos),
				facing = s.facing,
				key = s.key,
				dw = s.dw or 0,
				dwT = s.dwT or 0,
			}
		end
		return encEvents
	end

	if events and type(events) == "table" then
		local enc = encodeEventsTable(events)
		if enc then seg.events = enc end
	end

	macro.rooms[tostring(roomIndex)] = seg
	macro.version = CURRENT_VERSION
	macro.map = mapName
	macro.updated = os.time()

	-- Ghi ra file JSON riêng trong folder EsclipseHub/DQMacro/
	if hasFileSystem then
		ensureFolder()
		pcall(function()
			writefile(getFilePathForMap(mapName), HttpService:JSONEncode(macro))
		end)
	else
		local context = macLib.contextData
		if type(context) == "table" then
			if not context[LEGACY_STORAGE_KEY] then context[LEGACY_STORAGE_KEY] = {} end
			context[LEGACY_STORAGE_KEY][mapName] = macro
			autoSave.Save()
		end
	end

	fireChanged()
	return true
end

--// Mode của map (NORMAL/FULL). Chưa có macro hoặc macro cũ (không có field) -> NORMAL.
function storage.GetMapMode(mapName)
	if type(mapName) ~= "string" or #mapName == 0 then return MODE_NORMAL end
	initStorage()
	local macro = cache[mapName]
	if type(macro) ~= "table" then return MODE_NORMAL end
	return normalizeMode(macro.mode)
end

--// Lưu mode cho map (tùy map). Map chưa có macro -> tạo file placeholder (rooms rỗng,
--// không xuất hiện trong danh sách macro vì GetMaps filter roomCount > 0).
function storage.SetMapMode(mapName, mode)
	if type(mapName) ~= "string" or #mapName == 0 then return false end
	local nextMode = normalizeMode(mode)

	initStorage()

	local macro = cache[mapName]
	if not macro or type(macro) ~= "table" then
		macro = {
			map = mapName,
			version = CURRENT_VERSION,
			created = os.time(),
			updated = os.time(),
			mode = MODE_NORMAL,
			rooms = {},
		}
		cache[mapName] = macro
	end
	macro.mode = nextMode
	macro.map = mapName
	macro.updated = os.time()

	if hasFileSystem then
		ensureFolder()
		pcall(function()
			writefile(getFilePathForMap(mapName), HttpService:JSONEncode(macro))
		end)
	else
		local context = macLib.contextData
		if type(context) == "table" then
			if not context[LEGACY_STORAGE_KEY] then context[LEGACY_STORAGE_KEY] = {} end
			context[LEGACY_STORAGE_KEY][mapName] = macro
			autoSave.Save()
		end
	end

	fireChanged()
	return true
end

--// Xoá macro của 1 map (xoá file EsclipseHub/DQMacro/<mapName>.json).
function storage.RemoveMap(mapName)
	initStorage()
	if not cache[mapName] then return false end

	cache[mapName] = nil

	if hasFileSystem then
		local path = getFilePathForMap(mapName)
		pcall(function()
			if isfile(path) then
				delfile(path)
			end
		end)
	else
		local context = macLib.contextData
		if type(context) == "table" and context[LEGACY_STORAGE_KEY] then
			context[LEGACY_STORAGE_KEY][mapName] = nil
			autoSave.Save()
		end
	end

	fireChanged()
	return true
end

--// Xoá toàn bộ macro (xoá tất cả file trong EsclipseHub/DQMacro/).
function storage.ClearAll()
	initStorage()
	if next(cache) == nil then return end

	local macroDir = getMacroDir()
	if hasFileSystem and isfolder(macroDir) and listfiles then
		pcall(function()
			local files = listfiles(macroDir)
			if type(files) == "table" then
				for _, f in ipairs(files) do
					if type(f) == "string" and string.lower(string.sub(f, -5)) == ".json" and isfile(f) then
						delfile(f)
					end
				end
			end
		end)
	end

	table.clear(cache)

	local context = macLib.contextData
	if type(context) == "table" and context[LEGACY_STORAGE_KEY] then
		context[LEGACY_STORAGE_KEY] = nil
		autoSave.Save()
	end

	fireChanged()
end

--// Quét lại toàn bộ file từ disk (dùng khi người dùng vừa copy file JSON mới vào EsclipseHub/DQMacro/)
function storage.ReloadFromDisk()
	table.clear(cache)
	isInitialized = false
	initStorage()
	fireChanged()
end

--// Alias tương thích
function storage.ReloadFromConfig()
	storage.ReloadFromDisk()
end

return storage