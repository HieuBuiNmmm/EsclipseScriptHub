-- Auto Retry Dungeon cho DungeonQuest: khi reward holder có >= 2 item thì fire replayDungeon.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local notifier = require("@routes/DungeonQuest/core/notifier")

--// References
local player = services.player

--// State
local AUTO_RETRY_MIN_ITEMS = 2
local TIME_LIMIT = 720 --// 12 phút tính ra giây
local autoRetryEnabled = false
local autoRetryRunning = false
local autoRetryTriggered = false
local timeRetryEnabled = false
local timeRetryThreshold = 60
local timeRetryTriggered = false
local autoRetryCommand = [==[
local ReplayDungeon = game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("replayDungeon")

local payload = {}
local function collectValue(name)
	local value = workspace:FindFirstChild(name)
	if value and value:IsA("ValueBase") then
		payload[name] = value.Value
	end
end

collectValue("dungeonName")
collectValue("dungeonProgress")
collectValue("dungeonStarted")

local hardcore = workspace:FindFirstChild("hardcore")
if hardcore and hardcore:IsA("BoolValue") then
	payload.hardcore = hardcore.Value
	payload.isHardcore = hardcore.Value
end

local dungeon = workspace:FindFirstChild("dungeon")
if dungeon then
	for _, value in ipairs(dungeon:GetChildren()) do
		if value:IsA("ValueBase") then payload[value.Name] = value.Value end
	end
	local bossRoom = dungeon:FindFirstChild("bossRoom")
	if bossRoom then
		for _, value in ipairs(bossRoom:GetChildren()) do
			if value:IsA("ValueBase") then payload[value.Name] = value.Value end
		end
	end
end

if not payload.dungeonName then return end
ReplayDungeon:FireServer(payload)
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

--// Fire remote retry, trả về true nếu thành công
local function fireRetry()
	if not autoRetryCommandFn then
		notifier.Notify("Auto Retry", "Remote command invalid", 3)
		return false
	end
	local sCmd, err = pcall(autoRetryCommandFn)
	if sCmd then
		notifier.Notify("Auto Retry", "Retrying dungeon!", 3)
		return true
	end
	notifier.Notify("Auto Retry", "Trigger failed: " .. tostring(err), 3)
	return false
end

--// Methods
function autoRetry.Start()
	if autoRetryRunning then return end
	autoRetryRunning = true
	autoRetryTriggered = false
	timeRetryTriggered = false
	task.spawn(function()
		while autoRetryEnabled do
			local count = 0
			if autoRetryHolderFn then
				local sok, holder = pcall(autoRetryHolderFn)
				if sok and typeof(holder) == "Instance" and holder.Parent then
					count = #holder:GetChildren()
				end
			end
			--// Điều kiện reward (>= 2 item)
			if count >= AUTO_RETRY_MIN_ITEMS and not autoRetryTriggered then
				autoRetryTriggered = true
				fireRetry()
			elseif count < AUTO_RETRY_MIN_ITEMS then
				autoRetryTriggered = false
			end

			--// Điều kiện hết giờ (tách riêng): còn < X giây thì retry
			if timeRetryEnabled then
				local elapsed = shared.GetDungeonElapsed()
				local remaining = elapsed and (TIME_LIMIT - elapsed)
				if remaining and remaining < timeRetryThreshold and not timeRetryTriggered then
					timeRetryTriggered = true
					fireRetry()
				elseif not remaining or remaining >= timeRetryThreshold then
					timeRetryTriggered = false
				end
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
		timeRetryTriggered = false
		autoRetry.Start()
		notifier.Notify("Auto Retry", "Watching reward holder...", 2)
	else
		autoRetry.Stop()
		notifier.Notify("Auto Retry", "Stopped", 2)
	end
end

function autoRetry.SetTimeRetryEnabled(value)
	timeRetryEnabled = value == true
end

function autoRetry.GetTimeRetryEnabled()
	return timeRetryEnabled
end

function autoRetry.SetTimeRetryThreshold(value)
	timeRetryThreshold = value
end

function autoRetry.GetTimeRetryThreshold()
	return timeRetryThreshold
end

function autoRetry.GetTimeLimit()
	return TIME_LIMIT
end

function autoRetry.RetryNow()
	task.spawn(function()
		fireRetry()
	end)
end

return autoRetry
