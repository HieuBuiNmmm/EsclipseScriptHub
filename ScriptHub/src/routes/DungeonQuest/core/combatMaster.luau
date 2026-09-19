-- Combat Master System (DungeonQuest)
-- Cầu dao tổng điều phối toàn bộ cụm Combat:
-- 1. Hazard Scanner (Dò hiểm họa)
-- 2. Auto Dodge (Tự động né chiêu)
-- 3. Auto Farm (Tiếp cận & target quái/boss)
-- 4. Smart Auto Skill (Tự động xả Q + E)

local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local autoFarm = require("@routes/DungeonQuest/core/autoFarm")
local evasion = require("@routes/DungeonQuest/core/evasion")
local coordinator = require("@routes/DungeonQuest/core/coordinator")
local notifier = require("@routes/DungeonQuest/core/notifier")

local combatMaster = {}

local isMasterEnabled = false
local autoBossCombat = true -- Tự động kích hoạt khi gặp Boss trong Macro Skip Boss
local autoTriggeredByBoss = false -- Đánh dấu trạng thái được kích hoạt tự động bởi Boss
local stateListeners = {}

local function fireStateChanged()
	for _, cb in ipairs(stateListeners) do
		pcall(cb, isMasterEnabled)
	end
end

function combatMaster.IsEnabled()
	return isMasterEnabled
end

function combatMaster.Toggle(state, isAutoBoss)
	local want = state == true
	if isMasterEnabled == want then
		if not want then
			autoTriggeredByBoss = false
		end
		return
	end
	isMasterEnabled = want

	if isAutoBoss then
		autoTriggeredByBoss = want
	elseif not want then
		autoTriggeredByBoss = false
	end

	if want then
		-- Bật độc quyền CombatMaster qua Coordinator (tự động nhường/tắt PathRecord)
		coordinator.EnableExclusive("CombatMaster")

		-- Bật Evasion & Auto Dodge
		evasion.Toggle(true)
		evasion.SetAutoDodgeEnabled(true)

		-- Bật Auto Farm & Smart Auto Skill (bypass coordinator để không đá CombatMaster)
		autoFarm.Toggle(true, true)
		autoFarm.SetAutoSkillEnabled(true)
	else
		-- Tắt Auto Farm & Smart Auto Skill
		autoFarm.Toggle(false, true)
		autoFarm.SetAutoSkillEnabled(false)

		-- Tắt Auto Dodge & Evasion
		evasion.SetAutoDodgeEnabled(false)
		evasion.Toggle(false)
	end

	fireStateChanged()
end

function combatMaster.IsAutoTriggeredByBoss()
	return autoTriggeredByBoss
end

function combatMaster.SetAutoBossCombat(state)
	autoBossCombat = state == true
end

function combatMaster.IsAutoBossCombatEnabled()
	return autoBossCombat
end

function combatMaster.OnStateChanged(callback)
	if type(callback) ~= "function" then
		return function() end
	end
	table.insert(stateListeners, callback)
	return function()
		for i, cb in ipairs(stateListeners) do
			if cb == callback then
				table.remove(stateListeners, i)
				break
			end
		end
	end
end

--// Đăng ký Coordinator: khi hệ thống khác (PathRecord) chiếm độc quyền -> tự tắt CombatMaster
coordinator.Register("CombatMaster", function(state)
	if not state then
		combatMaster.Toggle(false)
	end
end, combatMaster.IsEnabled)

lifecycle.Register(function()
	combatMaster.Toggle(false)
end)

return combatMaster
