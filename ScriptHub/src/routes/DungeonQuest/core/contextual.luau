-- Core Contextual cho DungeonQuest: quản lý thiết lập Auto Farm (Min/Max Combat Distance)
-- riêng biệt theo từng DUNGEON x LOẠI MỤC TIÊU (Normal, Boss 1, Boss 2, Boss 3).
-- Dữ liệu lưu trong file config JSON qua macLib.contextData.

--// Imports
local macLib = require("@packages/Maclib")
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local shared = require("@routes/DungeonQuest/core/shared")
local dungeonCatalog = require("@routes/DungeonQuest/core/dungeonCatalog")
local notifier = require("@routes/DungeonQuest/core/notifier")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local autoFarm = require("@routes/DungeonQuest/core/autoFarm")

--// Table
local contextual = {}

--// Default Values per Target Type
local DEFAULT_DISTANCES = {
	Mob = { Min = 15, Max = 35 },
	Boss1 = { Min = 25, Max = 50 },
	Boss2 = { Min = 25, Max = 50 },
	Boss3 = { Min = 25, Max = 50 },
}

local DISPLAY_TO_KEY = {
	["Normal"] = "Mob",
	["Boss 1"] = "Boss1",
	["Boss 2"] = "Boss2",
	["Boss 3"] = "Boss3",
}

local KEY_TO_DISPLAY = {
	["Mob"] = "Normal",
	["Boss1"] = "Boss 1",
	["Boss2"] = "Boss 2",
	["Boss3"] = "Boss 3",
}

--// Metadata field -> get/set trên autoFarm
local FIELD_DEFS = {
	MinCombatDistance = {
		get = function()
			return autoFarm.GetMinCombatDistance()
		end,
		set = function(v)
			autoFarm.SetMinCombatDistance(v)
		end,
	},
	MaxCombatDistance = {
		get = function()
			return autoFarm.GetMaxCombatDistance()
		end,
		set = function(v)
			autoFarm.SetMaxCombatDistance(v)
		end,
	},
}

--// Storage: data[dungeon][target][field] = value
--// Sống trong config đang chọn (nhúng vào file config .json qua macLib.contextData)
local data = {}
local lastDataRef = nil
local activeConfig = nil
local configChangedCallbacks = {}
local eventConnections = {}

--// Các tab đăng ký callback khi đổi config (để làm mới UI context).
function contextual.OnConfigChanged(cb)
	if type(cb) ~= "function" then return end
	table.insert(configChangedCallbacks, cb)
end

--// Nạp dữ liệu từ config đang chọn. Trả về true nếu vừa đổi config / đổi data context.
function contextual.ReloadFromConfig()
	local macData = macLib.contextData or {}
	local newActive = autoSave.GetActive()

	local configChanged = newActive ~= activeConfig
	local dataChanged = macData ~= lastDataRef

	data = macData
	lastDataRef = macData
	activeConfig = newActive

	if (configChanged or dataChanged) and #configChangedCallbacks > 0 then
		for _, cb in ipairs(configChangedCallbacks) do
			pcall(cb, newActive)
		end
	end
	return configChanged or dataChanged
end

--// Đồng bộ dữ liệu lên macLib để mỗi lần save config là lưu kèm contextData
local function bindMacLib()
	macLib.contextData = data
end

--// Lưu dữ liệu vào config đang chọn
local function persist()
	bindMacLib()
	autoSave.SaveNow()
end

--// Đảm bảo context có đầy đủ tất cả field (điền mặc định nếu thiếu)
local function ensureContextComplete(dungeon, targetKey)
	if not (dungeon and type(dungeon) == "string" and #dungeon > 0) then return end
	if not KEY_TO_DISPLAY[targetKey] then return end

	data[dungeon] = data[dungeon] or {}
	data[dungeon][targetKey] = data[dungeon][targetKey] or {}
	local ctx = data[dungeon][targetKey]

	local defs = DEFAULT_DISTANCES[targetKey] or DEFAULT_DISTANCES.Mob
	local changed = false

	if ctx.MinCombatDistance == nil then
		ctx.MinCombatDistance = defs.Min
		changed = true
	end
	if ctx.MaxCombatDistance == nil then
		ctx.MaxCombatDistance = ctx.TargetReachDistance or defs.Max
		changed = true
	end
	-- Dọn dẹp key cũ TargetReachDistance để không bị xung đột dữ liệu
	if ctx.TargetReachDistance ~= nil then
		ctx.TargetReachDistance = nil
		changed = true
	end

	return changed
end

--// Tự khởi tạo context base cho TOÀN BỘ map x target khi khởi tạo script.
function contextual.SeedAllDefaults()
	local targets = { "Mob", "Boss1", "Boss2", "Boss3" }
	local seededAny = false
	for _, dungeon in ipairs(dungeonCatalog.GetDungeons()) do
		for _, targetKey in ipairs(targets) do
			if ensureContextComplete(dungeon, targetKey) then
				seededAny = true
			end
		end
	end
	if seededAny then
		persist()
	end
	return seededAny
end

--// Ghi override cho context cụ thể (có auto-clamp bảo toàn Min <= Max)
function contextual.SetField(dungeon, targetKey, field, value)
	if not (dungeon and type(dungeon) == "string" and #dungeon > 0) then return end
	if not KEY_TO_DISPLAY[targetKey] then return end
	if not FIELD_DEFS[field] then return end

	ensureContextComplete(dungeon, targetKey)
	local ctx = data[dungeon][targetKey]
	ctx[field] = value

	if field == "MinCombatDistance" and ctx.MaxCombatDistance and value > ctx.MaxCombatDistance then
		ctx.MaxCombatDistance = value + 5
	elseif field == "MaxCombatDistance" and ctx.MinCombatDistance and value < ctx.MinCombatDistance then
		ctx.MinCombatDistance = math.max(1, value - 5)
	end

	persist()
end

--// Xóa override của 1 context (đưa về default chuẩn của loại target đó)
function contextual.ClearContext(dungeon, targetKey)
	if type(dungeon) ~= "string" or #dungeon == 0 then return end
	if not KEY_TO_DISPLAY[targetKey] then return end

	data[dungeon] = data[dungeon] or {}
	local defs = DEFAULT_DISTANCES[targetKey] or DEFAULT_DISTANCES.Mob
	data[dungeon][targetKey] = {
		MinCombatDistance = defs.Min,
		MaxCombatDistance = defs.Max,
	}
	persist()
end

--// Đọc giá trị 1 field CỦA context (override nếu có, ngược lại fallback default)
function contextual.GetField(dungeon, targetKey, field)
	local def = FIELD_DEFS[field]
	if not def then return nil end
	if type(dungeon) == "string" and #dungeon > 0 then
		local ctx = data[dungeon] and data[dungeon][targetKey]
		if ctx and ctx[field] ~= nil then return ctx[field] end
	end
	local defs = DEFAULT_DISTANCES[targetKey] or DEFAULT_DISTANCES.Mob
	if field == "MinCombatDistance" then return defs.Min end
	if field == "MaxCombatDistance" then return defs.Max end
	return def.get()
end

--// Đọc BỘ giá trị của 1 context
function contextual.GetContext(dungeon, targetKey)
	local out = {}
	for field in pairs(FIELD_DEFS) do
		out[field] = contextual.GetField(dungeon, targetKey, field)
	end
	return out
end

--// Áp bộ giá trị của 1 context vào autoFarm
function contextual.ApplyContext(dungeon, targetKey)
	local ctx = contextual.GetContext(dungeon, targetKey)
	if ctx.MinCombatDistance ~= nil and ctx.MaxCombatDistance ~= nil then
		autoFarm.SetMinCombatDistance(ctx.MinCombatDistance)
		autoFarm.SetMaxCombatDistance(ctx.MaxCombatDistance)
	else
		for field, def in pairs(FIELD_DEFS) do
			if ctx[field] ~= nil then
				def.set(ctx[field])
			end
		end
	end
end

--// Áp context HIỆN TẠI (dungeon đang chơi + mục tiêu đang farm) lên autoFarm.
function contextual.ApplyCurrent()
	local dungeon = shared.GetCurrentDungeonName()
	local targetKey = shared.GetCombatTargetKey()
	contextual.ApplyContext(dungeon, targetKey)
	return dungeon, targetKey
end

--// Metadata
function contextual.GetFields()
	local out = {}
	for field in pairs(FIELD_DEFS) do table.insert(out, field) end
	return out
end

function contextual.GetTargets()
	local out = {}
	for _, key in ipairs({ "Mob", "Boss1", "Boss2", "Boss3" }) do
		table.insert(out, { Key = key, Display = KEY_TO_DISPLAY[key] })
	end
	return out
end

function contextual.GetDisplayForTarget(key)
	return KEY_TO_DISPLAY[key] or "Normal"
end

--// Auto-switch watcher: lắng nghe dungeon/boss đổi -> áp context hiện tại + thông báo.
local lastApplied = nil
local lastDungeon = nil
local function findAndApply(force)
	local dungeon = shared.GetCurrentDungeonName()
	local targetKey = shared.GetCombatTargetKey()

	if not dungeon then
		lastDungeon = nil
		lastApplied = nil
		return
	end

	if not force and dungeon == lastDungeon and targetKey == lastApplied then return end

	contextual.ApplyContext(dungeon, targetKey)

	if targetKey ~= "Mob" then
		notifier.Notify("Auto Farm Context", dungeon .. " - " .. (KEY_TO_DISPLAY[targetKey] or targetKey), 2)
	end
	lastApplied = targetKey
	lastDungeon = dungeon
end

function contextual.Init()
	-- Contextual disabled in favor of 4 direct global distance sliders
end

lifecycle.Register(function()
	for _, disconnect in ipairs(eventConnections) do
		pcall(disconnect)
	end
	table.clear(eventConnections)
	lastApplied = nil
	lastDungeon = nil
end)

return contextual
