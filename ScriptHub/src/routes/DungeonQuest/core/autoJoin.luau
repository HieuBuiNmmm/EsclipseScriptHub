-- Auto Join Dungeon cho DungeonQuest: tạo phòng + whitelist + start dungeon khi ở lobby.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local notifier = require("@routes/DungeonQuest/core/notifier")

local playerName = services.player.Name

--// State
local autoJoinEnabled = false
local autoJoinRunning = false
local selectedDungeon = "Desert Temple"
local selectedDifficulty = "Easy"
local hardcoreEnabled = false
local autoJoinDelay = 3

local LOBBY_PLACE_IDS_AJ = {
	[77649408247578] = true,
	[3220968688] = true,
	[2414851778] = true,
}

--// Helpers
local function inLobbyPlace()
	return LOBBY_PLACE_IDS_AJ[game.PlaceId] == true
end

local function joinDungeonNow()
	if autoJoinRunning then return end
	autoJoinRunning = true
	task.spawn(function()
		local ok, err = pcall(function()
			local remotes = game:GetService("ReplicatedStorage"):WaitForChild("remotes", 15)
			if not remotes then error("remotes not found") end

			pcall(function()
				remotes:WaitForChild("createLobby", 10):InvokeServer(selectedDungeon, selectedDifficulty, 0, hardcoreEnabled, true, false)
			end)
			task.wait(autoJoinDelay)

			pcall(function()
				remotes:WaitForChild("addPlayerToWhitelist", 10):FireServer(playerName)
			end)
			task.wait(autoJoinDelay)

			local waitClock = 0
			while waitClock < 10 do
				local lobby = workspace:FindFirstChild("games") and workspace.games:FindFirstChild("inLobby")
				if lobby then break end
				task.wait(0.5)
				waitClock = waitClock + 0.5
			end

			task.wait(autoJoinDelay)
			pcall(function()
				remotes:WaitForChild("startDungeon", 10):FireServer()
			end)
		end)
		if ok then
			notifier.Notify("Auto Join", "Joined: " .. selectedDungeon, 3)
		else
			notifier.Notify("Auto Join", "Join failed: " .. tostring(err), 4)
		end
		autoJoinRunning = false
	end)
end

local function joinDungeonWatcher()
	while true do
		task.wait(0.5)
		if autoJoinEnabled and not autoJoinRunning and inLobbyPlace() then
			joinDungeonNow()
		end
	end
end

--// Table
local autoJoin = {}

--// Methods
function autoJoin.Toggle(state)
	autoJoinEnabled = state
	if autoJoinEnabled then
		notifier.Notify("Auto Join", "Enabled", 2)
	else
		notifier.Notify("Auto Join", "Stopped", 2)
	end
end

function autoJoin.SetDungeon(name)
	if name then selectedDungeon = name end
end

function autoJoin.SetDifficulty(name)
	if name then selectedDifficulty = name end
end

function autoJoin.SetHardcore(state)
	hardcoreEnabled = state
end

function autoJoin.SetDelay(value)
	autoJoinDelay = value
end

autoJoin.JoinNow = function()
	task.spawn(function() joinDungeonNow() end)
end

--// Initialize: watcher
task.spawn(joinDungeonWatcher)

return autoJoin
