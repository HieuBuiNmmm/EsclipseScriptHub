-- Auto Farm cho DungeonQuest (Orbit / Hover). Chạy vòng lặp săn kẻ địch gần nhất.

--// Imports
local shared = require("@routes/DungeonQuest/core/shared")
local notifier = require("@routes/DungeonQuest/core/notifier")

--// Table
local farm = {}

--// Methods
function farm.Start()
	if shared.GetFarmRunning() then return end
	shared.SetFarmRunning(true)
	shared.SetFarmEnabled(true)

	local lastWarnClock = 0

	task.spawn(function()
		--// Chờ rời lobby (đã vào dungeon) trước khi scan để không abort sớm khi
		--// bật Auto Farm ngay từ màn hình chờ. Timeout 30s cho load chậm.
		local waited = 0
		while shared.IsInLobby() and shared.IsFarmEnabled() do
			task.wait(0.5)
			waited = waited + 0.5
			if waited >= 30 then
				shared.SetFarmEnabled(false)
				shared.SetFarmRunning(false)
				notifier.Notify("Auto Farm", "Still in lobby — aborted. Toggle again inside the dungeon.", 4)
				return
			end
		end
		if not shared.IsFarmEnabled() then
			shared.SetFarmRunning(false)
			return
		end

		if not shared.ReadyDungeon() then
			shared.SetFarmEnabled(false)
			shared.SetFarmRunning(false)
			notifier.Notify("Auto Farm", "Failed to detect dungeon.", 3)
			return
		end

		while shared.IsFarmEnabled() do
			local humanoid = shared.GetHumanoid()
			if not humanoid or not humanoid.Parent or humanoid.Health <= 0 then
				task.wait(shared.GetFarmScanInterval())
				continue
			end

			local ok, err = pcall(function()
				if not shared.FarmPickTarget() then
					task.wait(0.5)
				else
					if not shared.FarmTargetAlive() then
						shared.ClearFarmTarget()
					else
						shared.FarmFireSkills()
					end
				end
			end)
			if not ok and os.clock() - lastWarnClock > 5 then
				lastWarnClock = os.clock()
				warn("[AutoFarm] error:", tostring(err))
			end
			if not shared.IsFarmEnabled() then break end
			task.wait(shared.GetFarmScanInterval())
		end

		shared.ClearFarmTarget()
		shared.SetFarmRunning(false)
	end)
end

function farm.Stop()
	shared.SetFarmEnabled(false)
	shared.ClearFarmTarget()
	shared.RestoreAutoRotate()
end

function farm.Toggle(state)
	if state then
		farm.Start()
		notifier.Notify("Auto Farm", "Auto Farm Started", 2)
	else
		farm.Stop()
		notifier.Notify("Auto Farm", "Auto Farm Stopped", 2)
	end
end

return farm
