-- Path Record System – Storage: quản lý MACRO bản ghi cho từng MAP.
--   - Macro = 1 bản ghi cho cả map, chứa toàn bộ segment của các ROOM QUÁI THƯỜNG.
--   - Lưu trong MacLib config qua macLib.contextData.pathRecord (tồn tại qua phiên).
--   - Format:
--     contextData.pathRecord[mapName] = {
--       map = "TênMap",
--       version = 2,
--       created = os.time(),
--       updated = os.time(),
--       rooms = {
--         ["3"] = { startPos = {X,Y,Z}, points = {{X,Y,Z}...} }, -- segment theo room index
--         ...
--       }
--     }
--   - Boss room KHÔNG có segment (ngẫu nhiên -> dùng SmartDodge).

--// Imports
local macLib = require("@packages/Maclib")
local autoSave = require("@routes/DungeonQuest/core/autoSave")

--// Table
local storage = {}

--// Constants
local STORAGE_KEY = "pathRecord"
local CURRENT_VERSION = 3

--// Listeners (UI cập nhật khi bản ghi thay đổi)
local changedListeners = {}

local function fireChanged()
	for i = #changedListeners, 1, -1 do
		pcall(changedListeners[i])
	end
end

--// Đọc sub-table pathRecord trong contextData hiện tại.
--// macLib thay ref contextData mỗi lần LoadConfig nên đọc trực tiếp, không cache.
local function currentData()
	local context = macLib.contextData
	if type(context) ~= "table" then return nil end
	return context[STORAGE_KEY]
end

local function encodeVec(vec)
	if not vec then return nil end
	return { X = vec.X, Y = vec.Y, Z = vec.Z }
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
				dw = math.floor(tonumber(s.dw) or 0), --// index dwell liên kết (0 = không)
				dwT = tonumber(s.dwT) or 0, --// giây sau khi vào dwell (dwell-linked)
			}
		end
	end

	if #dwells == 0 and #skills == 0 then return nil end
	return { dwells = dwells, skills = skills }
end

--// Làm mịn đường gấp khúc (Douglas-Peucker trên mặt phẳng XZ).
--// Chấp nhận mảng Vector3 (decode) hoặc bảng {X,Y,Z} (ghi); rút gọn số điểm,
--// KHÔNG đổi kiểu của từng phần tử (giữ nguyên ref). Đệ quy bằng stack để an toàn
--// với 4000 điểm.
local MIN_KEEP_SPACING = 0.2 -- Studs tối thiểu giữa 2 điểm giữ lại

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

	local tol2 = tol * tol
	local stack = { { 1, n } }
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

	local out = {}
	for i = 1, n do
		if keep[i] and (#out == 0 or flatDistance(out[#out], points[i]) >= MIN_KEEP_SPACING) then
			table.insert(out, points[i])
		end
	end
	if #out == 1 then table.insert(out, points[n]) end
	return out
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
	local data = currentData()
	return data ~= nil and data[mapName] ~= nil
end

--// Lấy 1 segment (room) từ macro của map. Trả về { startPos, points } hoặc nil.
function storage.GetRoomSegment(mapName, roomIndex)
	if type(mapName) ~= "string" or type(roomIndex) ~= "number" then return nil end
	local data = currentData()
	if not data then return nil end
	local macro = data[mapName]
	if not macro or type(macro.rooms) ~= "table" then return nil end

	local raw = macro.rooms[tostring(roomIndex)]
	if not isRoomSeg(raw) then return nil end

	local points = {}
	for _, p in ipairs(raw.points) do
		local vec = decodeVec(p)
		if vec then points[#points + 1] = vec end
	end
	if #points == 0 then return nil end

	return {
		startPos = decodeVec(raw.startPos) or points[1],
		points = points,
		events = raw.events and decodeEvents(raw.events) or nil,
		speed = tonumber(raw.speed) or 0,
	}
end

--// Có segment (room) trong macro của map không?
function storage.HasSegmentOrMacro(mapName, roomIndex)
	return storage.GetRoomSegment(mapName, roomIndex) ~= nil
end

--// Macro map đầy đủ (đã decode): { map, version, rooms = {[idx] = {startPos, points}}, created, updated }
function storage.GetMap(mapName)
	if not storage.HasMap(mapName) then return nil end
	local data = currentData()
	local macro = data[mapName]

	local rooms = {}
	for key, raw in pairs(macro.rooms or {}) do
		local room = tonumber(key)
		if room and isRoomSeg(raw) then
			local points = {}
			for _, p in ipairs(raw.points) do
				local vec = decodeVec(p)
				if vec then points[#points + 1] = vec end
			end
			if #points > 0 then
				rooms[room] = {
					startPos = decodeVec(raw.startPos) or points[1],
					points = points,
					events = raw.events and decodeEvents(raw.events) or nil,
					speed = tonumber(raw.speed) or 0,
				}
			end
		end
	end

	return {
		map = mapName,
		version = macro.version,
		rooms = rooms,
		created = macro.created,
		updated = macro.updated,
	}
end

--// Danh sách các map đã có macro (sắp theo tên).
function storage.GetMaps()
	local data = currentData()
	if not data then return {} end

	local out = {}
	for mapName, macro in pairs(data) do
		if type(mapName) == "string" and type(macro) == "table" and macro.map == mapName and type(macro.rooms) == "table" then
			local roomCount = 0
			local pointCount = 0
			for key, raw in pairs(macro.rooms) do
				if tonumber(key) ~= nil and isRoomSeg(raw) then
					roomCount += 1
					pointCount += #raw.points
				end
			end
			if roomCount > 0 then
				table.insert(out, {
					map = mapName,
					roomCount = roomCount,
					pointCount = pointCount,
					updated = macro.updated,
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
--// Macro của map tích lũy dần qua nhiều lần record (mỗi room 1 segment).
--// events (optional): { dwells = { {pos, dur, facing} }, skills = { {pos, facing, dw, dwT} } }
--// speed (optional): tốc độ di chuyển trung bình khi record (playback ép lại để khớp thời gian).
function storage.SaveSegment(mapName, roomIndex, startPos, points, events, speed)
	if type(mapName) ~= "string" or #mapName == 0 then return false end
	if type(roomIndex) ~= "number" or roomIndex <= 0 then return false end
	if not startPos or not points or #points == 0 then return false end

	local context = macLib.contextData
	if type(context) ~= "table" then
		context = {}
		macLib.contextData = context
	end

	local data = context[STORAGE_KEY]
	if not data then
		data = {}
		context[STORAGE_KEY] = data
	end

	local macro = data[mapName]
	if not macro or type(macro) ~= "table" then
		macro = {
			map = mapName,
			version = CURRENT_VERSION,
			created = os.time(),
			updated = os.time(),
			rooms = {},
		}
		data[mapName] = macro
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
	if type(speed) == "number" and speed > 0 then
		seg.speed = speed
	end

	if events and type(events) == "table" then
		local nD = #(events.dwells or {})
		local nS = #(events.skills or {})
		if nD > 0 or nS > 0 then
			local encEvents = { dwells = {}, skills = {} }
			for _, d in ipairs(events.dwells) do
				encEvents.dwells[#encEvents.dwells + 1] = {
					pos = encodeVec(d.pos),
					dur = d.dur or 0,
					facing = d.facing,
				}
			end
			for _, s in ipairs(events.skills) do
				encEvents.skills[#encEvents.skills + 1] = {
					pos = encodeVec(s.pos),
					facing = s.facing,
					dw = s.dw or 0,
					dwT = s.dwT or 0,
				}
			end
			seg.events = encEvents
		end
	end

	macro.rooms[tostring(roomIndex)] = seg
	macro.version = CURRENT_VERSION
	macro.map = mapName
	macro.updated = os.time()

	autoSave.Save()
	fireChanged()
	return true
end

--// Xoá macro của 1 map.
function storage.RemoveMap(mapName)
	local data = currentData()
	if not data or not data[mapName] then return false end

	data[mapName] = nil
	if next(data) == nil then
		local context = macLib.contextData
		if type(context) == "table" then context[STORAGE_KEY] = nil end
	end
	autoSave.Save()
	fireChanged()
	return true
end

--// Xoá toàn bộ metadata.
function storage.ClearAll()
	local data = currentData()
	local hasData = false
	if data then
		for mapName, macro in pairs(data) do
			if type(mapName) == "string" then hasData = true; break end
		end
	end
	if not hasData then return end

	table.clear(data)
	local context = macLib.contextData
	if type(context) == "table" then context[STORAGE_KEY] = nil end
	autoSave.Save()
	fireChanged()
end

--// Đồng bộ lại từ config (macLib tự thay ref; gọi để UI làm mới).
function storage.ReloadFromConfig()
	fireChanged()
end

return storage