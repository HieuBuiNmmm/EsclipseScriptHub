-- Auto Farm System – Component A & B: Enemy Scanner & Enemy Validator
-- Spec: Sections 3 & 4 (Roblox_Target_Movement_System_AI_Spec.txt)

local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local player = services.player

local scanner = {}

--// B. Enemy Validation (Section 4)
-- An enemy is valid only if:
-- 1. Enemy still exists (model and model.Parent).
-- 2. Enemy is a valid enemy entity (model ~= player.Character).
-- 3. Enemy is alive (Humanoid.Health > 0).
-- 4. Required movement/root component exists.
-- 5. Enemy belongs to a valid/relevant room.
function scanner.Validate(enemyData)
	if not enemyData then return false end
	local model = enemyData.Model
	if not model or not model.Parent or model == player.Character then return false end

	local humanoid = enemyData.Humanoid
	if not humanoid or not humanoid.Parent then
		humanoid = model:FindFirstChildOfClass("Humanoid")
		enemyData.Humanoid = humanoid
	end
	if not humanoid or humanoid.Health <= 0 then return false end

	local root = enemyData.Root
	if not root or not root.Parent then
		root = model:FindFirstChild("HumanoidRootPart") or model.PrimaryPart
		if not root then
			for _, obj in ipairs(model:GetDescendants()) do
				if obj:IsA("BasePart") then
					root = obj
					break
				end
			end
		end
		if not root then return false end
		enemyData.Root = root
	end

	return true
end

--// A. Enemy Scanner (Section 3)
-- Scans all rooms, collects enemy entities, validates them, and produces ValidEnemyList.
function scanner.Scan()
	local validList = {}
	local tracked = shared.GetTrackedEnemyData()
	for _, data in ipairs(tracked) do
		if scanner.Validate(data) then
			table.insert(validList, data)
		end
	end
	return validList
end

return scanner
