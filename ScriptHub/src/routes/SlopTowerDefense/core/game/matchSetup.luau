-- MatchSetup: Tự động chọn Universe, Map và Difficulty khi vào In-Game sau n(s).

local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local zoneGuard = require("./zoneGuard")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")

local matchSetup = {
	AutoPickMapEnabled = false,
	SelectedUniverse = "Brainrot Bases",
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

-- Hàm click button an toàn, kết hợp cả 3 phương thức để đảm bảo 100% ăn lệnh
local function clickButton(button: Instance)
	if not button then return end

	print("[MatchSetup] Đang thực hiện click vào nút:", button.Name)

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
	print("[MatchSetup] Trình theo dõi Match Setup đã khởi động.")

	while lifecycle.IsActive() and zoneGuard.IsInGame() do
		local needMap = matchSetup.AutoPickMapEnabled and not hasVotedUniverseMap
		local needDiff = matchSetup.AutoDifficultyEnabled and not hasVotedDifficulty

		-- Nếu không cần làm gì ở vòng lặp này -> nghỉ 1 giây rồi kiểm tra tiếp (tuyệt đối không break!)
		if not needMap and not needDiff then
			task.wait(1)
			continue
		end

		local player = Players.LocalPlayer
		local playerGui = player and player:FindFirstChild("PlayerGui")
		local gameGui = playerGui and playerGui:FindFirstChild("GameGui")

		-- Phase 1: Universe & Map Voting
		if needMap and gameGui then
			local voting = gameGui:FindFirstChild("Voting")
			if voting and isVotingActive(voting) then
				print(string.format("[MatchSetup] Phát hiện giao diện Voting! Chờ Vote Delay %d giây...", matchSetup.VoteDelay))
				if matchSetup.VoteDelay > 0 then
					task.wait(matchSetup.VoteDelay)
				end

				if not lifecycle.IsActive() or not zoneGuard.IsInGame() then break end

				local universes = voting:FindFirstChild("Universes")
				local mapsFolder = voting:FindFirstChild("Maps")

				-- 1. Click chọn Universe
				if universes then
					print("[MatchSetup] Đang tìm Universe:", matchSetup.SelectedUniverse)
					local uBtn = findButton(universes, matchSetup.SelectedUniverse)
					if uBtn then
						clickButton(uBtn)
						print("[MatchSetup] -> Đã click Universe:", matchSetup.SelectedUniverse)
					else
						warn("[MatchSetup] Không tìm thấy nút Universe:", matchSetup.SelectedUniverse)
					end
				end

				task.wait(0.4)

				-- 2. Click chọn Map trong mapsFolder
				if mapsFolder then
					print("[MatchSetup] Đang chờ và tìm nút Map:", matchSetup.SelectedMap)
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
						print("[MatchSetup] -> Đã click Map thành công:", targetMap)
						notifier.Notify("Match Setup", string.format("Đã chọn: %s - %s", matchSetup.SelectedUniverse, targetMap), 3)
					else
						-- Fallback: bấm nút visible đầu tiên trong Maps
						for _, btn in ipairs(mapsFolder:GetChildren()) do
							if (btn:IsA("GuiButton") or btn:IsA("ImageButton")) and btn.Visible then
								clickButton(btn)
								hasVotedUniverseMap = true
								print("[MatchSetup] -> Đã click Map fallback:", btn.Name)
								notifier.Notify("Match Setup", string.format("Đã chọn Map fallback: %s", btn.Name), 3)
								break
							end
						end
						if not hasVotedUniverseMap then
							warn("[MatchSetup] Không tìm thấy nút Map nào đang hiển thị trong Voting.Maps!")
						end
					end
				end
			end
		end

		-- Phase 2: Difficulty Voting (ComplicationVoting)
		if needDiff and gameGui then
			local compVoting = gameGui:FindFirstChild("ComplicationVoting")
			if compVoting and isComplicationVotingActive(compVoting) then
				print("[MatchSetup] Phát hiện giao diện ComplicationVoting!")
				local modes = compVoting:FindFirstChild("Modes")
				if modes then
					local targetDiff = matchSetup.SelectedDifficulty
					print("[MatchSetup] Đang tìm Difficulty:", targetDiff)
					local diffBtn = findButton(modes, targetDiff)

					if diffBtn then
						task.wait(0.2)
						clickButton(diffBtn)
						hasVotedDifficulty = true
						print("[MatchSetup] -> Đã click Difficulty thành công:", targetDiff)
						notifier.Notify("Match Setup", string.format("Đã chọn độ khó: %s", targetDiff), 3)
					else
						-- Fallback
						for _, btn in ipairs(modes:GetChildren()) do
							if (btn:IsA("GuiButton") or btn:IsA("ImageButton")) and btn.Visible then
								clickButton(btn)
								hasVotedDifficulty = true
								print("[MatchSetup] -> Đã click Difficulty fallback:", btn.Name)
								notifier.Notify("Match Setup", string.format("Đã chọn độ khó fallback: %s", btn.Name), 3)
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
	print("[MatchSetup] Trình theo dõi Match Setup đã kết thúc vòng lặp.")
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

function matchSetup.GetMapsForUniverse(universeName: string): { string }
	return matchSetup.UniverseMaps[universeName] or {}
end

function matchSetup.SetAutoPickMap(state: boolean)
	matchSetup.AutoPickMapEnabled = state
	print("[MatchSetup] Cập nhật Auto Pick Map:", state)
	if state and zoneGuard.IsInGame() then
		matchSetup.StartVotingWatcher()
	end
end

function matchSetup.SetUniverse(universeName: string)
	matchSetup.SelectedUniverse = universeName
	print("[MatchSetup] Đã chọn Universe mục tiêu:", universeName)
end

function matchSetup.SetMap(mapName: string)
	matchSetup.SelectedMap = mapName
	print("[MatchSetup] Đã chọn Map mục tiêu:", mapName)
end

function matchSetup.SetAutoDifficulty(state: boolean)
	matchSetup.AutoDifficultyEnabled = state
	print("[MatchSetup] Cập nhật Auto Select Difficulty:", state)
	if state and zoneGuard.IsInGame() then
		matchSetup.StartVotingWatcher()
	end
end

function matchSetup.SetDifficulty(diff: string)
	matchSetup.SelectedDifficulty = diff
	print("[MatchSetup] Đã chọn Difficulty mục tiêu:", diff)
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
		print("[MatchSetup] Vào In-Game -> Khởi động Match Setup.")
		matchSetup.StartVotingWatcher()
	end,
	OnLeave = function()
		print("[MatchSetup] Rời In-Game -> Reset trạng thái Match Setup.")
		matchSetup.StopVotingWatcher()
	end,
})

-- Dọn dẹp khi script unload
lifecycle.Register(function()
	matchSetup.StopVotingWatcher()
end)

return matchSetup
