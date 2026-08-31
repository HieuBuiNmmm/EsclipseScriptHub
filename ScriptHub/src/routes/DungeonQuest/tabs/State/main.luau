-- Tab State (DungeonQuest): hiển thị trạng thái thời gian thực của script.

--// Imports
local shared = require("@routes/DungeonQuest/core/shared")
local autoRetry = require("@routes/DungeonQuest/core/autoRetry")
local basicDodge = require("@routes/DungeonQuest/core/basicOrbitDodge")

local BOSS_LABEL = "Boss Active"
local BOSS_INDEX_LABEL = "Boss"
local DUNGEON_LABEL = "Dungeon"
local TIMER_LABEL = "Time Left"

return function(window, tab)
	local section = tab:Section({ Side = "Left" })
	section:Header({ Name = "Status" })

	local bossLabel = section:Label({
		Text = BOSS_LABEL .. ": " .. (shared.IsBossActive() and "Yes" or "No"),
	})

	local function updateBoss(active)
		local color = active and "0, 255, 0" or "255, 80, 80"
		bossLabel:UpdateName(BOSS_LABEL .. ": <font color='rgb(" .. color .. ")'>" .. (active and "Yes" or "No") .. "</font>")
	end

	updateBoss(shared.IsBossActive())

	shared.OnBossActiveChanged(function(active)
		updateBoss(active)
	end)

	local bossIndexLabel = section:Label({
		Text = BOSS_INDEX_LABEL .. ": 0",
	})

	local function updateBossIndex()
		bossIndexLabel:UpdateName(BOSS_INDEX_LABEL .. ": " .. shared.GetCurrentBossIndex())
	end

	updateBossIndex()

	shared.OnBossIndexChanged(function()
		updateBossIndex()
	end)

	local enemyCountLabel = section:Label({
		Text = "Enemies: 0",
	})

	local function updateEnemyCount()
		if not shared.IsInLobby() and not shared.GetCurrentDungeonName() then
			enemyCountLabel:UpdateName("Enemies: <font color='rgb(160, 160, 160)'>--</font>")
			return
		end
		local count = shared.GetEnemyCount()
		local color = count > 0 and "0, 255, 0" or "255, 80, 80"
		enemyCountLabel:UpdateName("Enemies: <font color='rgb(" .. color .. ")'>" .. count .. "</font>")
	end

	section:Header({ Name = "Timer" })

	local timeLeftLabel = section:Label({
		Text = TIMER_LABEL .. ": --",
	})

	local function updateTimeLeft()
		local remaining = autoRetry.GetTimeLeft()
		if not remaining then
			timeLeftLabel:UpdateName(TIMER_LABEL .. ": <font color='rgb(160, 160, 160)'>--</font>")
			return
		end
		local total = math.floor(remaining)
		local formatted = string.format("%d:%02d", math.floor(total / 60), total % 60)
		local low = autoRetry.GetTimeRetryEnabled() and remaining < autoRetry.GetTimeRetryThreshold()
		local color = low and "255, 80, 80" or "0, 255, 0"
		timeLeftLabel:UpdateName(TIMER_LABEL .. ": <font color='rgb(" .. color .. ")'>" .. formatted .. "</font>")
	end

	updateEnemyCount()

	updateTimeLeft()

	section:Header({ Name = "Dodge" })

	local hazardCountLabel = section:Label({
		Text = "Hazards: 0",
	})

	local function updateHazardCount()
		local count = basicDodge.GetHazardCount()
		local color = count > 0 and "0, 255, 0" or "160, 160, 160"
		hazardCountLabel:UpdateName("Hazards: <font color='rgb(" .. color .. ")'>" .. count .. "</font>")
	end

	updateHazardCount()

	section:Button({
		Name = "Log Dodge Hazards to Console",
		Callback = function()
			local names = basicDodge.GetHazardNames()
			print("[DungeonQuest] Dodge hazards being tracked (" .. #names .. "):")
			if #names == 0 then
				print("  (none - dodge scanner sees nothing)")
			else
				for _, name in ipairs(names) do
					print("  - " .. name)
				end
			end
		end,
	})

	--// Forward declaration: updateLobby được định nghĩa phía dưới nhưng poll loop
	--// ở đây chạy trước -> nếu không khai báo trước sẽ thành global nil.
	local updateLobby

	task.spawn(function()
		while task.wait(0.5) do
			updateBoss(shared.IsBossActive())
			updateBossIndex()
			updateEnemyCount()
			updateHazardCount()
			updateLobby()
			updateTimeLeft()
		end
	end)

	section:Header({ Name = "Level Info" })

	local dungeonLabel = section:Label({
		Text = DUNGEON_LABEL .. ": Unknown",
	})

	local function updateDungeon()
		local name = shared.GetCurrentDungeonName()
		if name then
			dungeonLabel:UpdateName(DUNGEON_LABEL .. ": " .. name)
		else
			dungeonLabel:UpdateName(DUNGEON_LABEL .. ": <font color='rgb(255, 80, 80)'>Unknown</font>")
		end
	end

	updateDungeon()

	shared.OnDungeonNameChanged(function()
		updateDungeon()
	end)

	section:Header({ Name = "Lobby / Dungeon" })

	local lobbyLabel = section:Label({
		Text = "Lobby: Unknown",
	})

	updateLobby = function()
		local inLobby = shared.IsInLobby()
		local color = inLobby and "0, 255, 0" or "255, 80, 80"
		lobbyLabel:UpdateName("Lobby: <font color='rgb(" .. color .. ")'>" .. (inLobby and "Yes" or "No") .. "</font>")
	end

	updateLobby()

	shared.OnLobbyChanged(function()
		updateLobby()
	end)

	section:Button({
		Name = "Log Enemy Types to Console",
		Callback = function()
			local names = shared.GetEnemyNames()
			print("[DungeonQuest] Enemy types in map (" .. #names .. "):")
			if #names == 0 then
				print("  (no enemies found)")
			else
				for _, name in ipairs(names) do
					print("  - " .. name)
				end
			end
		end,
	})
end
