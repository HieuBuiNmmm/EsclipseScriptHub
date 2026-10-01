-- MatchSetup: Tự động chọn Universe, Map và Difficulty khi vào In-Game sau n(s).

local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local zoneGuard = require("./zoneGuard")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")
local logger = require("@routes/SlopTowerDefense/core/system/logger")

local matchSetup = {
	AutoPickMapEnabled = false,
	SelectedUniverse = "Brainrot Bases",
	NormalUniverses = {
		"Brainrot Bases",
		"Toilet Territory",
		"Retro Revival",
		"Garden",
		"Backrooms",
	},
	RaidUniverses = {
		"Raid",
	},
	Universes = {
		"Brainrot Bases",
		"Toilet Territory",
		"Retro Revival",
		"Garden",
		"Backrooms",
	},

	UniverseMaps = {
		["Brainrot Bases"] = {
			"Night Base",
			"Base",
			"Gold Base",
			"BrainrotEndless",
		},
		["Toilet Territory"] = {
			"Desert",
			"Toilet City",
			"Ruined City",
			"ToiletEndless",
		},
		["Retro Revival"] = {
			"Happy Home",
			"Crossroads",
			"Doomspire",
			"RetroEndless",
		},
		["Garden"] = {
			"Plot",
			"NightPlot",
			"RichPlot",
			"GardenEndless",
		},
		["Backrooms"] = {
			"Level0",
			"Poolrooms",
			"Level94",
			"BackroomsEndless",
		},
		["Raid"] = {
			"Raid",
		},
	},

	SelectedMap = "Night Base",

	AutoDifficultyEnabled = false,
	SelectedDifficulty = "Normal",
	Difficulties = {
		"Normal",
		"Hard",
		"Nightmare",
		"Chaos",
	},

	VoteDelay = 2, -- Giây chờ trước khi bắt đầu chọn Universe & Map
}

local hasVotedUniverseMap = false
local hasVotedDifficulty = false
local watcherRunning = false

-- Live Match Info: Ghi nhận trực tiếp từ lượt click UI của Player trong game
local liveUniverse: string? = nil
local liveMap: string? = nil
local liveDifficulty: string? = nil
local hookedButtons: { [Instance]: boolean } = {}

function matchSetup.RecordLiveUniverse(name: string)
	if not name or name == "" then return end
	liveUniverse = name
	logger.Log("[MatchSetup] 🎯 Ghi nhận Live Universe:", name)
end

function matchSetup.RecordLiveMap(name: string)
	if not name or name == "" then return end
	liveMap = name
	logger.Log("[MatchSetup] 🎯 Ghi nhận Live Map:", name)
end

function matchSetup.RecordLiveDifficulty(diff: string)
	if not diff or diff == "" then return end
	liveDifficulty = diff
	logger.Log("[MatchSetup] 🎯 Ghi nhận Live Difficulty:", diff)
end

function matchSetup.GetLiveUniverse(): string?
	return liveUniverse
end

function matchSetup.GetLiveMap(): string?
	return liveMap
end

function matchSetup.GetLiveDifficulty(): string?
	return liveDifficulty
end

function matchSetup.GetLiveMatchInfo(): (string?, string?, string?)
	-- Nếu max wave là 100 hoặc có dấu hiệu Raid -> tự động xác nhận Raid
	local p = Players.LocalPlayer
	local playerGui = p and p:FindFirstChild("PlayerGui")
	local gameGui = playerGui and playerGui:FindFirstChild("GameGui")
	local info = gameGui and gameGui:FindFirstChild("Info", true)
	local stats = info and info:FindFirstChild("Stats")
	local waveLabel = stats and stats:FindFirstChild("Wave") :: TextLabel?
	if waveLabel and waveLabel.Text:find("/%s*100") then
		liveUniverse = "Raid"
		liveMap = "Raid"
		liveDifficulty = "Raid"
	end

	return liveUniverse, liveMap, liveDifficulty
end

function matchSetup.ResetLiveMatchInfo()
	liveUniverse = nil
	liveMap = nil
	liveDifficulty = nil
	table.clear(hookedButtons)
end

-- Lắng nghe trực tiếp sự kiện click trên các nút của game GUI (Voting / ComplicationVoting)
local function hookVotingButtons(container: Instance?, category: "Universe" | "Map" | "Difficulty")
	if not container then return end

	local function hookButton(child: Instance)
		if hookedButtons[child] then return end
		if not (child:IsA("GuiButton") or child:IsA("ImageButton") or child:IsA("TextButton")) then return end
		hookedButtons[child] = true

		local btnName = child.Name
		local function onTriggered()
			if category == "Universe" then
				matchSetup.RecordLiveUniverse(btnName)
			elseif category == "Map" then
				matchSetup.RecordLiveMap(btnName)
			elseif category == "Difficulty" then
				matchSetup.RecordLiveDifficulty(btnName)
			end
		end

		child.Activated:Connect(onTriggered)
		child.MouseButton1Click:Connect(onTriggered)
	end

	for _, child in ipairs(container:GetChildren()) do
		hookButton(child)
	end

	container.ChildAdded:Connect(hookButton)
end

-- Hàm click button an toàn, kết hợp cả 3 phương thức để đảm bảo 100% ăn lệnh
local function clickButton(button: Instance)
	if not button then return end

	logger.Log("[MatchSetup] Đang thực hiện click vào nút:", button.Name)

	-- Cách 1: firesignal MouseButton1Click, Activated, MouseButton1Up
	pcall(function()
		local fs = (firesignal or (syn and syn.firesignal))
		if fs and button:IsA("GuiButton") then
			fs(button.MouseButton1Click)
			fs(button.Activated)
			fs(button.MouseButton1Up)
		end
	end)

	-- Cách 2: VirtualInputManager click trực tiếp tại tọa độ tâm nút
	pcall(function()
		if button:IsA("GuiObject") then
			local absPos = button.AbsolutePosition
			local absSize = button.AbsoluteSize
			local centerX = absPos.X + absSize.X / 2
			local centerY = absPos.Y + absSize.Y / 2
			VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, true, game, 1)
			task.wait(0.05)
			VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, false, game, 1)
		end
	end)

	-- Cách 3: GuiService SelectedObject + phím Enter
	pcall(function()
		if button:IsA("GuiButton") then
			GuiService.SelectedObject = button
			task.wait(0.05)
			VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
			task.wait(0.05)
			VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
			task.wait(0.05)
			GuiService.SelectedObject = nil
		end
	end)
end

-- Tìm nút chính xác hoặc theo tên không phân biệt hoa thường / Title
local function findButton(parent: Instance, targetName: string): GuiButton?
	if not parent then return nil end

	-- 1. Tìm trực tiếp theo Name
	local direct = parent:FindFirstChild(targetName)
	if direct and (direct:IsA("GuiButton") or direct:IsA("ImageButton") or direct:IsA("TextButton")) then
		return direct
	end

	-- 2. Tìm không phân biệt hoa thường
	local lowerTarget = string.lower(targetName)
	for _, child in ipairs(parent:GetChildren()) do
		if child:IsA("GuiButton") or child:IsA("ImageButton") or child:IsA("TextButton") then
			if string.lower(child.Name) == lowerTarget then
				return child
			end
		end
	end

	-- 3. Tìm theo TextLabel (Title) bên trong child
	for _, child in ipairs(parent:GetChildren()) do
		if child:IsA("GuiButton") or child:IsA("ImageButton") or child:IsA("TextButton") then
			local title = child:FindFirstChild("Title") or child:FindFirstChildWhichIsA("TextLabel", true)
			if title and string.lower(title.Text) == lowerTarget then
				return child
			end
		end
	end

	return nil
end

-- Kiểm tra xem Voting GUI có đang hiển thị trên màn hình không
local function isVotingActive(voting: Instance): boolean
	if not voting then return false end
	if voting:IsA("GuiObject") and not voting.Visible then
		return false
	end

	local universes = voting:FindFirstChild("Universes")
	if universes then
		for _, child in ipairs(universes:GetChildren()) do
			if (child:IsA("GuiButton") or child:IsA("ImageButton")) and child.Visible then
				return true
			end
		end
	end

	local maps = voting:FindFirstChild("Maps")
	if maps then
		for _, child in ipairs(maps:GetChildren()) do
			if (child:IsA("GuiButton") or child:IsA("ImageButton")) and child.Visible then
				return true
			end
		end
	end

	return false
end

-- Kiểm tra xem bảng chọn độ khó ComplicationVoting có đang hiển thị không
local function isComplicationVotingActive(compVoting: Instance): boolean
	if not compVoting then return false end
	if compVoting:IsA("GuiObject") and not compVoting.Visible then
		return false
	end

	local modes = compVoting:FindFirstChild("Modes")
	if modes then
		for _, child in ipairs(modes:GetChildren()) do
			if (child:IsA("GuiButton") or child:IsA("ImageButton")) and child.Visible then
				return true
			end
		end
	end

	return false
end

local function runVotingWatcher()
	if watcherRunning then return end
	watcherRunning = true
	logger.Log("[MatchSetup] Trình theo dõi Match Setup đã khởi động.")

	local wasVotingActive = false
	local wasCompVotingActive = false

	while lifecycle.IsActive() and zoneGuard.IsInGame() do
		local player = Players.LocalPlayer
		local playerGui = player and player:FindFirstChild("PlayerGui")
		local gameGui = playerGui and playerGui:FindFirstChild("GameGui")

		if gameGui then
			local voting = gameGui:FindFirstChild("Voting")
			local compVoting = gameGui:FindFirstChild("ComplicationVoting")

			-- 1. Lắng nghe trực tiếp các nút trong Voting & ComplicationVoting để bắt mọi lượt click của Player
			if voting then
				local universes = voting:FindFirstChild("Universes")
				local maps = voting:FindFirstChild("Maps")
				if universes then hookVotingButtons(universes, "Universe") end
				if maps then hookVotingButtons(maps, "Map") end
			end
			if compVoting then
				local modes = compVoting:FindFirstChild("Modes")
				if modes then hookVotingButtons(modes, "Difficulty") end
			end

			-- 2. Quản lý trạng thái chuyển đổi giữa các ván Replay
			local votingActive = voting and isVotingActive(voting) or false
			if votingActive and not wasVotingActive then
				-- Bảng chọn Universe/Map xuất hiện lại -> cho phép vote lại
				hasVotedUniverseMap = false
			end
			wasVotingActive = votingActive

			local compActive = compVoting and isComplicationVotingActive(compVoting) or false
			if compActive and not wasCompVotingActive then
				-- Bảng chọn độ khó xuất hiện lại (ví dụ sau khi Replay) -> cho phép vote lại độ khó
				hasVotedDifficulty = false
			end
			wasCompVotingActive = compActive

			-- 3. Tự động vote Universe & Map (nếu bật Auto Pick Map)
			local needMap = matchSetup.AutoPickMapEnabled and not hasVotedUniverseMap
			if needMap and votingActive then
				logger.Log(string.format("[MatchSetup] Phát hiện giao diện Voting! Chờ Vote Delay %d giây...", matchSetup.VoteDelay))
				if matchSetup.VoteDelay > 0 then
					task.wait(matchSetup.VoteDelay)
				end

				if not lifecycle.IsActive() or not zoneGuard.IsInGame() then break end

				local universes = voting:FindFirstChild("Universes")
				local mapsFolder = voting:FindFirstChild("Maps")

				-- 1. Click chọn Universe
				if universes then
					logger.Log("[MatchSetup] Đang tìm Universe:", matchSetup.SelectedUniverse)
					local uBtn = findButton(universes, matchSetup.SelectedUniverse)
					if uBtn then
						clickButton(uBtn)
						matchSetup.RecordLiveUniverse(matchSetup.SelectedUniverse)
						logger.Log("[MatchSetup] -> Đã click Universe:", matchSetup.SelectedUniverse)
					else
						logger.Warn("[MatchSetup] Không tìm thấy nút Universe:", matchSetup.SelectedUniverse)
					end
				end

				task.wait(0.4)

				-- 2. Click chọn Map trong mapsFolder
				if mapsFolder then
					logger.Log("[MatchSetup] Đang chờ và tìm nút Map:", matchSetup.SelectedMap)
					local targetMap = matchSetup.SelectedMap
					local mapBtn = nil

					for _ = 1, 40 do
						mapBtn = findButton(mapsFolder, targetMap)
						if mapBtn and mapBtn.Visible then
							break
						end
						task.wait(0.1)
					end

					if mapBtn then
						clickButton(mapBtn)
						hasVotedUniverseMap = true
						matchSetup.RecordLiveMap(targetMap)
						logger.Log("[MatchSetup] -> Đã click Map thành công:", targetMap)
						notifier.Notify("Match Setup", string.format("Selected: %s - %s", matchSetup.SelectedUniverse, targetMap), 3)
					else
						-- Fallback: bấm nút visible đầu tiên trong Maps
						for _, btn in ipairs(mapsFolder:GetChildren()) do
							if (btn:IsA("GuiButton") or btn:IsA("ImageButton")) and btn.Visible then
								clickButton(btn)
								hasVotedUniverseMap = true
								matchSetup.RecordLiveMap(btn.Name)
								logger.Log("[MatchSetup] -> Đã click Map fallback:", btn.Name)
								notifier.Notify("Match Setup", string.format("Selected fallback Map: %s", btn.Name), 3)
								break
							end
						end
						if not hasVotedUniverseMap then
							logger.Warn("[MatchSetup] Không tìm thấy nút Map nào đang hiển thị trong Voting.Maps!")
						end
					end
				end
			end

			-- 4. Tự động vote Difficulty (nếu bật Auto Select Difficulty)
			local needDiff = matchSetup.AutoDifficultyEnabled and not hasVotedDifficulty
			if needDiff and compActive then
				logger.Log("[MatchSetup] Phát hiện giao diện ComplicationVoting!")
				local modes = compVoting:FindFirstChild("Modes")
				if modes then
					local targetDiff = matchSetup.SelectedDifficulty
					logger.Log("[MatchSetup] Đang tìm Difficulty:", targetDiff)
					local diffBtn = findButton(modes, targetDiff)

					if diffBtn then
						task.wait(0.2)
						clickButton(diffBtn)
						hasVotedDifficulty = true
						matchSetup.RecordLiveDifficulty(targetDiff)
						logger.Log("[MatchSetup] -> Đã click Difficulty thành công:", targetDiff)
						notifier.Notify("Match Setup", string.format("Selected Difficulty: %s", targetDiff), 3)
					else
						-- Fallback
						for _, btn in ipairs(modes:GetChildren()) do
							if (btn:IsA("GuiButton") or btn:IsA("ImageButton")) and btn.Visible then
								clickButton(btn)
								hasVotedDifficulty = true
								matchSetup.RecordLiveDifficulty(btn.Name)
								logger.Log("[MatchSetup] -> Đã click Difficulty fallback:", btn.Name)
								notifier.Notify("Match Setup", string.format("Selected fallback Difficulty: %s", btn.Name), 3)
								break
							end
						end
					end
				end
			end
		end

		task.wait(0.5)
	end

	watcherRunning = false
	logger.Log("[MatchSetup] Trình theo dõi Match Setup đã kết thúc vòng lặp.")
end

function matchSetup.StartVotingWatcher()
	hasVotedUniverseMap = false
	hasVotedDifficulty = false
	if not watcherRunning then
		task.spawn(runVotingWatcher)
	end
end

function matchSetup.StopVotingWatcher()
	hasVotedUniverseMap = false
	hasVotedDifficulty = false
end

function matchSetup.GetUniversesForMode(mode: string?): { string }
	if mode == "Raid" then
		return matchSetup.RaidUniverses
	end
	return matchSetup.NormalUniverses
end

function matchSetup.GetMapsForUniverse(universeName: string): { string }
	return matchSetup.UniverseMaps[universeName] or {}
end

function matchSetup.SetAutoPickMap(state: boolean)
	matchSetup.AutoPickMapEnabled = state
	logger.Log("[MatchSetup] Cập nhật Auto Pick Map:", state)
	if state and zoneGuard.IsInGame() then
		matchSetup.StartVotingWatcher()
	end
end

function matchSetup.SetUniverse(universeName: string)
	matchSetup.SelectedUniverse = universeName
	logger.Log("[MatchSetup] Đã chọn Universe mục tiêu:", universeName)
end

function matchSetup.SetMap(mapName: string)
	matchSetup.SelectedMap = mapName
	logger.Log("[MatchSetup] Đã chọn Map mục tiêu:", mapName)
end

function matchSetup.SetAutoDifficulty(state: boolean)
	matchSetup.AutoDifficultyEnabled = state
	logger.Log("[MatchSetup] Cập nhật Auto Select Difficulty:", state)
	if state and zoneGuard.IsInGame() then
		matchSetup.StartVotingWatcher()
	end
end

function matchSetup.SetDifficulty(diff: string)
	matchSetup.SelectedDifficulty = diff
	logger.Log("[MatchSetup] Đã chọn Difficulty mục tiêu:", diff)
end

function matchSetup.SetVoteDelay(seconds: number)
	matchSetup.VoteDelay = math.clamp(tonumber(seconds) or 0, 0, 30)
end

function matchSetup.GetVoteDelay(): number
	return matchSetup.VoteDelay
end

-- Tự động kích hoạt khi ở InGame
zoneGuard.Register({
	Name = "MatchSetup",
	Zone = "InGame",
	OnEnter = function()
		logger.Log("[MatchSetup] Vào In-Game -> Khởi động Match Setup.")
		matchSetup.StartVotingWatcher()
	end,
	OnLeave = function()
		logger.Log("[MatchSetup] Rời In-Game -> Reset trạng thái Match Setup.")
		matchSetup.StopVotingWatcher()
		matchSetup.ResetLiveMatchInfo()
	end,
})

-- Dọn dẹp khi script unload
lifecycle.Register(function()
	matchSetup.StopVotingWatcher()
end)

return matchSetup
