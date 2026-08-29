-- Auto Start Game cho DungeonQuest: chờ startButton xuất hiện rồi fire remote start.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local notifier = require("@routes/DungeonQuest/core/notifier")

--// References
local player = services.player

--// State
local autoStartEnabled = false
local autoStartRunning = false
local autoStartTriggered = false
local autoStartCommand = 'game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("changeStartValue"):FireServer()'
local autoStartConditionText = 'game:GetService("Players").LocalPlayer.PlayerGui.startButton'
local autoStartConditionFn = nil
local autoStartCommandFn = nil

--// Helpers
local function validateConditionText(text)
	local s, fn = pcall(loadstring, "return " .. text)
	if s and type(fn) == "function" then return fn end
	return nil
end

autoStartConditionFn = validateConditionText(autoStartConditionText)
if not autoStartConditionFn then
	autoStartConditionFn = function()
		return player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("startButton")
	end
end

local s2, cmdFn2 = pcall(loadstring, autoStartCommand)
if s2 and type(cmdFn2) == "function" then autoStartCommandFn = cmdFn2 end

--// Table
local autoStart = {}

--// Methods
function autoStart.Start()
	if autoStartRunning then return end
	autoStartRunning = true
	autoStartTriggered = false
	task.spawn(function()
		while autoStartEnabled do
			local met = false
			if autoStartConditionFn then
				local sCond, res = pcall(autoStartConditionFn)
				met = sCond and res ~= nil
			end
			if met and not autoStartTriggered then
				autoStartTriggered = true
				if autoStartCommandFn then
					local sCmd, err = pcall(autoStartCommandFn)
					if sCmd then
						notifier.Notify("Auto Start", "Game started!", 3)
					else
						notifier.Notify("Auto Start", "Trigger failed: " .. tostring(err), 3)
					end
				else
					notifier.Notify("Auto Start", "Remote command invalid", 3)
				end
			end
			if not autoStartEnabled then break end
			task.wait(1)
		end
		autoStartRunning = false
	end)
end

function autoStart.Stop()
	autoStartEnabled = false
end

function autoStart.Toggle(state)
	autoStartEnabled = state
	if state then
		autoStart.Start()
		notifier.Notify("Auto Start", "Waiting for start button...", 2)
	else
		autoStart.Stop()
		notifier.Notify("Auto Start", "Stopped", 2)
	end
end

--// Reset trigger mỗi khi respawn
shared.OnRespawn(function()
	autoStartTriggered = false
end)

return autoStart
