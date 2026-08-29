-- Auto Skill (Q+E) cho DungeonQuest. Quản lý vòng lặp bấm phím, dựa trên shared state.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local notifier = require("@routes/DungeonQuest/core/notifier")

--// References
local VirtualInputManager = services.VirtualInputManager

--// Table
local combat = {}

--// Methods
function combat.StartAutoSkill()
	if shared.GetAutoSkillRunning() then return end
	shared.SetAutoSkillRunning(true)

	local lastWarnClock = 0

	task.spawn(function()
		while shared.IsAutoSkillEnabled() do
			local humanoid = shared.GetHumanoid()
			if not humanoid or not humanoid.Parent or humanoid.Health <= 0 then
				task.wait(shared.GetSkillInterval())
				continue
			end

			local ok, err = pcall(function()
				if shared.CanFireSkill() then
					VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
					VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
					task.wait(shared.GetKeyHoldTime())
					VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
					VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
				else
					task.wait(0.2)
				end
			end)
			if not ok and os.clock() - lastWarnClock > 5 then
				lastWarnClock = os.clock()
				warn("[AutoSkill] error:", tostring(err))
			end
			if not shared.IsAutoSkillEnabled() then break end
			task.wait(shared.GetSkillInterval())
		end
		shared.SetAutoSkillRunning(false)
	end)
end

function combat.StopAutoSkill()
	shared.SetAutoSkillEnabled(false)
end

function combat.ToggleAutoSkill(state)
	shared.SetAutoSkillEnabled(state)
	if state then
		combat.StartAutoSkill()
		notifier.Notify("Auto Skill", "Auto Q+E Started", 2)
	else
		combat.StopAutoSkill()
		notifier.Notify("Auto Skill", "Auto Q+E Stopped", 2)
	end
end

return combat
