-- Core Contextual cho DungeonQuest: Quản lý thiết lập khoảng cách chiến đấu (Min/Max Combat Distance)
-- riêng biệt theo từng DUNGEON x LOẠI MỤC TIÊU (Normal, Boss 1, Boss 2, Boss 3).
-- Dữ liệu được nhúng và lưu trữ trực tiếp trong config MacLib (macLib.contextData).

--// Imports
local macLib = require("@packages/Maclib")
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local shared = require("@routes/DungeonQuest/core/shared")

--// Table
local contextual = {}

--// Default Values per Target Type
local DEFAULT_DISTANCES = {
	Mob = { Min = 15.0, Max = 35.0, BossArea = false, BossAreaRadius = 80.0 },
	Boss1 = { Min = 25.0, Max = 50.0, BossArea = false, BossAreaRadius = 80.0 },
	Boss2 = { Min = 25.0, Max = 50.0, BossArea = false, BossAreaRadius = 80.0 },
	Boss3 = { Min = 25.0, Max = 50.0, BossArea = false, BossAreaRadius = 80.0 },
}

local TARGET_KEYS = { "Mob", "Boss1", "Boss2", "Boss3" }

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

--// Storage: data[dungeonName][targetKey] = { Min = number, Max = number }
local data = {}
local dataChangedCallbacks = {}

function contextual.GetTargetDisplay(key)
	return KEY_TO_DISPLAY[key] or "Normal"
end

function contextual.GetTargetKey(display)
	return DISPLAY_TO_KEY[display] or "Mob"
end

function contextual.GetTargetOptions()
	return { "Normal", "Boss 1", "Boss 2", "Boss 3" }
end

--// Nạp và xuất dữ liệu config
function contextual.GetSaveData()
	return data
end

function contextual.LoadData(incomingData)
	if type(incomingData) == "table" then
		data = incomingData
	else
		data = {}
	end
	macLib.contextData = data

	for _, cb in ipairs(dataChangedCallbacks) do
		pcall(cb)
	end
end

function contextual.OnDataChanged(callback)
	if type(callback) ~= "function" then return function() end end
	table.insert(dataChangedCallbacks, callback)
	return function()
		for i, cb in ipairs(dataChangedCallbacks) do
			if cb == callback then
				table.remove(dataChangedCallbacks, i)
				break
			end
		end
	end
end

local function syncToMacLibAndSave()
	macLib.contextData = data
	autoSave.Save()
end

--// Lấy khoảng cách Min/Max của 1 Dungeon x Target cụ thể
function contextual.GetCombatDistances(dungeonName, targetKey)
	local tKey = targetKey or "Mob"
	local def = DEFAULT_DISTANCES[tKey] or DEFAULT_DISTANCES.Mob

	if type(dungeonName) == "string" and #dungeonName > 0 and data[dungeonName] and data[dungeonName][tKey] then
		local entry = data[dungeonName][tKey]
		local minVal = (type(entry.Min) == "number" and entry.Min > 0) and entry.Min or def.Min
		local maxVal = (type(entry.Max) == "number" and entry.Max > 0) and entry.Max or def.Max
		return minVal, maxVal
	end

	return def.Min, def.Max
end

--// Lấy khoảng cách Min/Max hiện tại dựa trên Dungeon và Target đang chiến đấu
function contextual.GetActiveCombatDistances(target)
	local dungeon = shared.GetCurrentDungeonName()
	local targetKey = "Mob"

	local isBoss = false
	if shared.IsBossActive and shared.IsBossActive() then
		isBoss = true
		targetKey = shared.GetCombatTargetKey()
	elseif target then
		if target.Room and type(target.Room.Name) == "string" and string.find(string.lower(target.Room.Name), "boss") then
			isBoss = true
		elseif target.Model then
			local mName = string.lower(target.Model.Name)
			if string.find(mName, "boss") then
				isBoss = true
			else
				local parent = target.Model.Parent
				if parent and string.find(string.lower(parent.Name), "boss") then
					isBoss = true
				end
			end
		end
		if isBoss then
			local bIdx = shared.GetCurrentBossIndex and shared.GetCurrentBossIndex() or 1
			targetKey = "Boss" .. tostring(math.clamp(bIdx, 1, 3))
		end
	end

	return contextual.GetCombatDistances(dungeon, targetKey)
end

--// Lấy thiết lập Boss Area (Enabled, Radius) của 1 Dungeon x Target cụ thể (chỉ Boss)
function contextual.GetBossArea(dungeonName, targetKey)
	local tKey = targetKey or "Mob"
	if tKey == "Mob" then
		return false, 80.0
	end
	local def = DEFAULT_DISTANCES[tKey] or DEFAULT_DISTANCES.Boss1
	if type(dungeonName) == "string" and #dungeonName > 0 and data[dungeonName] and data[dungeonName][tKey] then
		local entry = data[dungeonName][tKey]
		local enabled = entry.BossArea == true
		local radius = (type(entry.BossAreaRadius) == "number" and entry.BossAreaRadius > 0) and entry.BossAreaRadius or (def.BossAreaRadius or 80.0)
		return enabled, radius
	end
	return def.BossArea or false, def.BossAreaRadius or 80.0
end

--// Cập nhật Boss Area Enabled
function contextual.SetBossAreaEnabled(dungeonName, targetKey, enabled)
	if not (type(dungeonName) == "string" and #dungeonName > 0) then return end
	local tKey = targetKey or "Mob"
	if tKey == "Mob" then return end -- Boss Area chỉ áp dụng cho Boss

	data[dungeonName] = data[dungeonName] or {}
	data[dungeonName][tKey] = data[dungeonName][tKey] or {}
	data[dungeonName][tKey].BossArea = enabled and true or false

	syncToMacLibAndSave()
end

--// Cập nhật Boss Area Radius
function contextual.SetBossAreaRadius(dungeonName, targetKey, radius)
	if not (type(dungeonName) == "string" and #dungeonName > 0) then return end
	local tKey = targetKey or "Mob"
	if tKey == "Mob" then return end -- Boss Area chỉ áp dụng cho Boss
	if type(radius) ~= "number" or radius <= 0 then return end

	data[dungeonName] = data[dungeonName] or {}
	data[dungeonName][tKey] = data[dungeonName][tKey] or {}
	data[dungeonName][tKey].BossAreaRadius = radius

	syncToMacLibAndSave()
end

--// Lấy thông tin Boss Area đang hoạt động trong trận chiến hiện tại: (enabled, radius, centerPosition)
function contextual.GetActiveBossArea(target)
	local dungeon = shared.GetCurrentDungeonName()
	local targetKey = "Mob"

	local isBoss = false
	if shared.IsBossActive and shared.IsBossActive() then
		isBoss = true
		targetKey = shared.GetCombatTargetKey()
	elseif target then
		if target.Room and type(target.Room.Name) == "string" and string.find(string.lower(target.Room.Name), "boss") then
			isBoss = true
		elseif target.Model then
			local mName = string.lower(target.Model.Name)
			if string.find(mName, "boss") then
				isBoss = true
			else
				local parent = target.Model.Parent
				if parent and string.find(string.lower(parent.Name), "boss") then
					isBoss = true
				end
			end
		end
		if isBoss then
			local bIdx = shared.GetCurrentBossIndex and shared.GetCurrentBossIndex() or 1
			targetKey = "Boss" .. tostring(math.clamp(bIdx, 1, 3))
		end
	end

	if not isBoss or targetKey == "Mob" then
		return false, 0, nil
	end

	local enabled, radius = contextual.GetBossArea(dungeon, targetKey)
	if not enabled then
		return false, radius, nil
	end

	local center = shared.GetBossSpawnPosition and shared.GetBossSpawnPosition()
	if not center and target and target.Root then
		center = target.Root.Position
		if shared.SetBossSpawnPosition then
			shared.SetBossSpawnPosition(center)
		end
	end

	return enabled, radius, center
end

--// Cập nhật Min Combat Distance
function contextual.SetMinCombatDistance(dungeonName, targetKey, minVal)
	if not (type(dungeonName) == "string" and #dungeonName > 0) then return end
	local tKey = targetKey or "Mob"
	if type(minVal) ~= "number" or minVal <= 0 then return end

	data[dungeonName] = data[dungeonName] or {}
	data[dungeonName][tKey] = data[dungeonName][tKey] or {}

	local currentMax = data[dungeonName][tKey].Max or (DEFAULT_DISTANCES[tKey] or DEFAULT_DISTANCES.Mob).Max
	data[dungeonName][tKey].Min = minVal

	if minVal > currentMax then
		data[dungeonName][tKey].Max = minVal + 5.0
	end

	syncToMacLibAndSave()
end

--// Cập nhật Max Combat Distance
function contextual.SetMaxCombatDistance(dungeonName, targetKey, maxVal)
	if not (type(dungeonName) == "string" and #dungeonName > 0) then return end
	local tKey = targetKey or "Mob"
	if type(maxVal) ~= "number" or maxVal <= 0 then return end

	data[dungeonName] = data[dungeonName] or {}
	data[dungeonName][tKey] = data[dungeonName][tKey] or {}

	local currentMin = data[dungeonName][tKey].Min or (DEFAULT_DISTANCES[tKey] or DEFAULT_DISTANCES.Mob).Min
	data[dungeonName][tKey].Max = maxVal

	if maxVal < currentMin then
		data[dungeonName][tKey].Min = math.max(1.0, maxVal - 5.0)
	end

	syncToMacLibAndSave()
end

--// Reset một target trong dungeon về mặc định
function contextual.ResetTarget(dungeonName, targetKey)
	if not (type(dungeonName) == "string" and #dungeonName > 0) then return end
	local tKey = targetKey or "Mob"
	if data[dungeonName] then
		data[dungeonName][tKey] = nil
		if next(data[dungeonName]) == nil then
			data[dungeonName] = nil
		end
		syncToMacLibAndSave()
	end
end

--// Reset toàn bộ các target của 1 dungeon về mặc định
function contextual.ResetDungeon(dungeonName)
	if not (type(dungeonName) == "string" and #dungeonName > 0) then return end
	if data[dungeonName] then
		data[dungeonName] = nil
		syncToMacLibAndSave()
	end
end

return contextual
