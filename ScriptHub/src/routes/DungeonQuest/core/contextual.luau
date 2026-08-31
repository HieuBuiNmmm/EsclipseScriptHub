-- Contextual Auto-Farm settings cho DungeonQuest.
-- Cho phép cấu hình riêng nhóm Auto Farm (Farm Mode, sliders orbit/hover/tele,
-- retarget, maintain-height) theo DUNGEON x LOẠI MỤC TIÊU (Quái thường / Boss 1/2/3).
-- Giá trị lưu per-context trong JSON (Maclib/DungeonQuest_ContextCombat.json).
-- Khi 1 context chưa có override thì fallback về giá trị global hiện tại (shared).

--// Imports
local shared = require("@routes/DungeonQuest/core/shared")
local notifier = require("@routes/DungeonQuest/core/notifier")
local macLib = require("@packages/Maclib")
local autoSave = require("@routes/DungeonQuest/core/autoSave")

--// Table
local contextual = {}

--// Metadata field -> get/set trên shared (Auto Farm group)
local FIELD_DEFS = {
	FarmMode = { get = function() return shared.GetFarmMode() end, set = function(v) shared.SetFarmMode(v) end },
	OrbitRadius = { get = function() return shared.GetOrbitRadius() end, set = function(v) shared.SetOrbitRadius(v) end },
	OrbitSpeed = { get = function() return shared.GetOrbitSpeed() end, set = function(v) shared.SetOrbitSpeed(v) end },
	OrbitTeleStep = { get = function() return shared.GetOrbitTeleStep() end, set = function(v) shared.SetOrbitTeleStep(v) end },
	OrbitHeight = { get = function() return shared.GetOrbitHeight() end, set = function(v) shared.SetOrbitHeight(v) end },
	HoverHeight = { get = function() return shared.GetHoverHeight() end, set = function(v) shared.SetHoverHeight(v) end },
	TeleportDistance = { get = function() return shared.GetFarmEngageDistance() end, set = function(v) shared.SetFarmEngageDistance(v) end },
	AutoRetarget = { get = function() return shared.GetRetargetEnabled() end, set = function(v) shared.SetRetargetEnabled(v) end },
	RetargetMethod = { get = function() return shared.GetRetargetMethod() end, set = function(v) shared.SetRetargetMethod(v) end },
	RetargetMode = { get = function() return shared.GetRetargetMode() end, set = function(v) shared.SetRetargetMode(v) end },
	ReverseOrbitOnRetarget = { get = function() return shared.GetOrbitReverseEnabled() end, set = function(v) shared.SetOrbitReverseEnabled(v) end },
	MaintainBossHeight = { get = function() return shared.GetMaintainBossHeight() end, set = function(v) shared.SetMaintainBossHeight(v) end },
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

--// Storage: data[dungeon][target][field] = value
--// Sống trong config đang chọn (nhúng vào file config .json qua MacLib.contextData)
local data = {}
local lastDataRef = nil
local activeConfig = nil
local configChangedCallback = nil

--// Cho phép tab đăng ký callback khi đổi config (để làm mới UI context)
function contextual.OnConfigChanged(cb)
	configChangedCallback = cb
end

--// Nạp dữ liệu từ config đang chọn. Trả về true nếu vừa đổi config / đổi data context.
function contextual.ReloadFromConfig()
	local macData = macLib.contextData or {}
	local newActive = autoSave.GetActive()

	local configChanged = newActive ~= activeConfig
	--// MacLib:LoadConfig tạo bảng contextData MỚI -> phát hiện khi data vừa được nạp (kể cả
	--// khi tên config không đổi, vd autoload) để refresh UI + re-apply context.
	local dataChanged = macData ~= lastDataRef

	data = macData
	lastDataRef = macData
	activeConfig = newActive

	if (configChanged or dataChanged) and configChangedCallback then
		pcall(configChangedCallback, newActive)
	end
	return configChanged or dataChanged
end

--// Đồng bộ dữ liệu lên MacLib để mỗi lần save config là lưu kèm contextData
local function bindMacLib()
	macLib.contextData = data
end

--// Lưu dữ liệu vào config đang chọn
local function persist()
	bindMacLib()
	autoSave.SaveNow()
end

--// Đảm bảo context có đầy đủ tất cả field (điền mặc định = global fallback nếu thiếu)
--// Trả về true nếu có field được khởi tạo mới.
local function ensureContextComplete(dungeon, targetKey)
	if not (dungeon and type(dungeon) == "string" and #dungeon > 0) then return end
	if not KEY_TO_DISPLAY[targetKey] then return end

	data[dungeon] = data[dungeon] or {}
	data[dungeon][targetKey] = data[dungeon][targetKey] or {}
	local ctx = data[dungeon][targetKey]

	local changed = false
	for f in pairs(FIELD_DEFS) do
		if ctx[f] == nil then
			ctx[f] = FIELD_DEFS[f].get()
			changed = true
		end
	end
	return changed
end

--// Ghi override cho context cụ thể (context luôn đầy đủ 12 field)
function contextual.SetField(dungeon, targetKey, field, value)
	if not (dungeon and type(dungeon) == "string" and #dungeon > 0) then return end
	if not KEY_TO_DISPLAY[targetKey] then return end
	if not FIELD_DEFS[field] then return end

	ensureContextComplete(dungeon, targetKey)
	data[dungeon][targetKey][field] = value
	persist()
end

--// Xóa hết override của 1 context (về global)
function contextual.ClearContext(dungeon, targetKey)
	if type(dungeon) ~= "string" or #dungeon == 0 then return end
	if data[dungeon] and data[dungeon][targetKey] then
		data[dungeon][targetKey] = nil
		if next(data[dungeon]) == nil then data[dungeon] = nil end
		persist()
	end
end

--// Đọc giá trị 1 field CỦA context (override nếu có, ngược lại global hiện tại)
function contextual.GetField(dungeon, targetKey, field)
	local def = FIELD_DEFS[field]
	if not def then return nil end
	--// Ngoài dungeon (tên nil/rỗng) -> không có context -> dùng global hiện tại
	if type(dungeon) == "string" and #dungeon > 0 then
		local ctx = data[dungeon] and data[dungeon][targetKey]
		if ctx and ctx[field] ~= nil then return ctx[field] end
	end
	return def.get()
end

--// Đọc BỘ giá trị của 1 context (đã fallback global)
function contextual.GetContext(dungeon, targetKey)
	local out = {}
	for field in pairs(FIELD_DEFS) do
		out[field] = contextual.GetField(dungeon, targetKey, field)
	end
	return out
end

--// Áp bộ giá trị của 1 context vào shared (để farm dùng)
function contextual.ApplyContext(dungeon, targetKey)
	local ctx = contextual.GetContext(dungeon, targetKey)
	for field, def in pairs(FIELD_DEFS) do
		def.set(ctx[field])
	end
end

--// Áp context HIỆN TẠI (dungeon đang chơi + mục tiêu đang farm) lên shared.
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
	return KEY_TO_DISPLAY[key]
end

--// Auto-switch watcher: lắng nghe dungeon/boss đổi -> áp context hiện tại + thông báo.
local lastApplied = nil
local lastDungeon = nil
local function findAndApply(force)
	local dungeon = shared.GetCurrentDungeonName()
	local targetKey = shared.GetCombatTargetKey()

	--// Rời dungeon hoặc chưa vào -> reset cache để lần vào lại được áp dụng lại context
	if not dungeon then
		lastDungeon = nil
		lastApplied = nil
		return
	end

	--// Đảm bảo áp lại khi cùng dungeon cùng target (vd vừa vào lại dungeon)
	if not force and dungeon == lastDungeon and targetKey == lastApplied then return end

	contextual.ApplyContext(dungeon, targetKey)

	if targetKey ~= "Mob" then
		notifier.Notify("Auto Farm Context", dungeon .. " - " .. KEY_TO_DISPLAY[targetKey], 2)
	end
	lastApplied = targetKey
	lastDungeon = dungeon
end

function contextual.Init()
	contextual.ReloadFromConfig()
	bindMacLib()

	shared.OnDungeonNameChanged(function() findAndApply(false) end)
	shared.OnBossIndexChanged(function() findAndApply(false) end)
	shared.OnBossActiveChanged(function() findAndApply(false) end)

	task.spawn(function()
		while true do
			task.wait(0.5)
			--// Đổi config -> nạp lại dữ liệu context của config mới (+ re-apply)
			if contextual.ReloadFromConfig() then
				findAndApply(true)
			end
			findAndApply(false)
		end
	end)
end

return contextual
