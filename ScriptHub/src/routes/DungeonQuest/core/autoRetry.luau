-- Auto Retry Dungeon cho DungeonQuest: khi reward holder có >= 2 item thì fire replayDungeon.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local notifier = require("@routes/DungeonQuest/core/notifier")

--// References
local player = services.player

--// State
local AUTO_RETRY_MIN_ITEMS = 2
local autoRetryEnabled = false
local autoRetryRunning = false
local autoRetryTriggered = false
local autoRetryCommand = [==[
local Event = game:GetService("ReplicatedStorage").remotes.replayDungeon
Event:FireServer(
	{
		dungeonProgress = "",
		dungeonStarted = false,
		hardcore = false,
		dungeonFinished = false,
		dungeonName = "Enchanted Forest",
		isHardcore = false,
		fightingBoss = false
	}
)
]==]
local autoRetryHolderPath = 'game:GetService("Players").LocalPlayer.PlayerGui.rewardGuiHolder.holder'
local autoRetryCommandFn = nil
local autoRetryHolderFn = nil

--// Helpers (validation dùng loadstring, giữ logic gốc)
local function validateConditionText(text)
	local s, fn = pcall(loadstring, "return " .. text)
	if s and type(fn) == "function" then return fn end
	return nil
end

local sRetryCmd, compiledRetryCmd = pcall(loadstring, autoRetryCommand)
if sRetryCmd and type(compiledRetryCmd) == "function" then autoRetryCommandFn = compiledRetryCmd end

autoRetryHolderFn = validateConditionText(autoRetryHolderPath)
if not autoRetryHolderFn then
	autoRetryHolderFn = function()
		return player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("rewardGuiHolder") and player.PlayerGui.rewardGuiHolder:FindFirstChild("holder")
	end
end

--// Table
local autoRetry = {}

--// Methods
function autoRetry.Start()
	if autoRetryRunning then return end
	autoRetryRunning = true
	autoRetryTriggered = false
	task.spawn(function()
		while autoRetryEnabled do
			local count = 0
			if autoRetryHolderFn then
				local sok, holder = pcall(autoRetryHolderFn)
				if sok and typeof(holder) == "Instance" and holder.Parent then
					count = #holder:GetChildren()
				end
			end
			if count >= AUTO_RETRY_MIN_ITEMS and not autoRetryTriggered then
				autoRetryTriggered = true
				if autoRetryCommandFn then
					local sCmd, err = pcall(autoRetryCommandFn)
					if sCmd then
						notifier.Notify("Auto Retry", "Retrying dungeon!", 3)
					else
						notifier.Notify("Auto Retry", "Trigger failed: " .. tostring(err), 3)
					end
				else
					notifier.Notify("Auto Retry", "Remote command invalid", 3)
				end
			elseif count < AUTO_RETRY_MIN_ITEMS then
				autoRetryTriggered = false
			end
			if not autoRetryEnabled then break end
			task.wait(0.75)
		end
		autoRetryRunning = false
	end)
end

function autoRetry.Stop()
	autoRetryEnabled = false
end

function autoRetry.Toggle(state)
	autoRetryEnabled = state
	if state then
		autoRetry.Start()
		notifier.Notify("Auto Retry", "Watching reward holder...", 2)
	else
		autoRetry.Stop()
		notifier.Notify("Auto Retry", "Stopped", 2)
	end
end

return autoRetry
