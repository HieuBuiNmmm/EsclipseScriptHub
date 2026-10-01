-- SlopMutator: Tự động bình chọn Slop Mutator theo độ ưu tiên (Priority Sliders)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local zoneGuard = require("./zoneGuard")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")
local logger = require("@routes/SlopTowerDefense/core/system/logger")

type MutatorInfo = {
	Id: string,
	Name: string,
	DefaultPriority: number,
	Description: string?,
}

local slopMutator = {
	Enabled = false,
	VoteDelay = 1, -- Giây chờ trước khi vote Mutator

	Catalog = {
		{ Id = "None", Name = "No Mutator", DefaultPriority = 100, Description = "Normal (No bonus)" },
		{ Id = "Brainrot", Name = "Brainrot", DefaultPriority = 80, Description = "Random enemy speed (+20% Rewards)" },
		{ Id = "Blackout", Name = "Blackout", DefaultPriority = 70, Description = "Lights out, glowing eyes (+25% Rewards)" },
		{ Id = "Gigantism", Name = "Gigantism", DefaultPriority = 60, Description = "Enemies x1.5 size & HP (+30% Rewards)" },
		{ Id = "Speedrun", Name = "Speedrun", DefaultPriority = 50, Description = "Enemies run +40% faster" },
		{ Id = "ArmoredSlop", Name = "Armored Slop", DefaultPriority = 40, Description = "Enemies x2.5 HP, -20% speed" },
		{ Id = "Regeneration", Name = "Regeneration", DefaultPriority = 30, Description = "Enemies regenerate 2% HP per second" },
		{ Id = "BossRush", Name = "Boss Rush", DefaultPriority = 20, Description = "Boss x2 HP, normal enemies +25% HP" },
		{ Id = "TinySlop", Name = "Tiny Slop", DefaultPriority = 10, Description = "Tiny enemies, +20% run speed" },
	} :: { MutatorInfo },

	Priorities = {
		None = 100,
		Brainrot = 80,
		Blackout = 70,
		Gigantism = 60,
		Speedrun = 50,
		ArmoredSlop = 40,
		Regeneration = 30,
		BossRush = 20,
		TinySlop = 10,
	} :: { [string]: number },
}

local hasVotedThisRound = false
local remoteConnection: RBXScriptConnection? = nil
local guiWatcherThread: thread? = nil

-- Hàm click button an toàn
local function clickButton(button: Instance)
	if not button then return end

	-- Cách 1: firesignal
	pcall(function()
		local fs = (firesignal or (syn and syn.firesignal))
		if fs and button:IsA("GuiButton") then
			fs(button.MouseButton1Click)
			fs(button.Activated)
			fs(button.MouseButton1Up)
		end
	end)

	-- Cách 2: VirtualInputManager click trực tiếp tại tâm nút
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

-- Lấy RemoteEvent SlopMutator trong ReplicatedStorage.Events
local function getSlopMutatorRemote(): RemoteEvent?
	local events = ReplicatedStorage:FindFirstChild("Events")
	if not events then return nil end
	local remote = events:FindFirstChild("SlopMutator")
	if remote and remote:IsA("RemoteEvent") then
		return remote
	end
	return nil
end

-- Thực hiện vote Mutator tốt nhất từ danh sách ứng viên
local function performVote(candidates: { { Id: string, Title: string?, Good: string?, Bad: string? } })
	if not slopMutator.Enabled or not zoneGuard.IsInGame() then return end
	if hasVotedThisRound or #candidates == 0 then return end

	local bestCandidate = nil
	local bestScore = -999999

	for _, cand in ipairs(candidates) do
		local id = cand.Id
		local score = slopMutator.Priorities[id]
		if score == nil then
			-- Nếu có mutator mới chưa có trong danh sách cố định, gán mặc định là 50
			score = 50
		end

		if score > bestScore then
			bestScore = score
			bestCandidate = cand
		end
	end

	if not bestCandidate then
		bestCandidate = candidates[1]
	end

	hasVotedThisRound = true

	task.spawn(function()
		if slopMutator.VoteDelay > 0 then
			task.wait(slopMutator.VoteDelay)
		end

		if not slopMutator.Enabled or not zoneGuard.IsInGame() then return end

		local remote = getSlopMutatorRemote()

		-- 1. Gửi RemoteEvent trực tiếp lên Server
		if remote then
			pcall(function()
				remote:FireServer("Vote", bestCandidate.Id)
			end)
		end

		-- 2. Giả lập click trên GUI SlopMutatorGui.MutatorVoting
		pcall(function()
			local player = Players.LocalPlayer
			local playerGui = player and player:FindFirstChild("PlayerGui")
			local slopGui = playerGui and playerGui:FindFirstChild("SlopMutatorGui")
			local voting = slopGui and slopGui:FindFirstChild("MutatorVoting")
			if voting then
				local card = voting:FindFirstChild(bestCandidate.Id)
				if card and (card:IsA("GuiButton") or card:IsA("GuiObject")) then
					clickButton(card)
				end
			end
		end)

		local displayTitle = bestCandidate.Title or bestCandidate.Id
		logger.Log(string.format("[SlopMutator] Đã vote Mutator: %q (%s) với điểm ưu tiên: %d", bestCandidate.Id, displayTitle, bestScore))
		notifier.Notify("Slop Mutator", string.format("Voted: %s (Priority: %d)", displayTitle, bestScore), 3)
	end)
end

-- Kết nối RemoteEvent SlopMutator
local function hookRemote()
	if remoteConnection then
		remoteConnection:Disconnect()
		remoteConnection = nil
	end

	local remote = getSlopMutatorRemote()
	if not remote then return end

	remoteConnection = remote.OnClientEvent:Connect(function(action, data)
		if not slopMutator.Enabled or not zoneGuard.IsInGame() then return end

		if action == "Vote" and typeof(data) == "table" then
			logger.Log("[SlopMutator] Nhận được danh sách bình chọn Mutator từ Server...")
			performVote(data)
		elseif action == "Active" then
			-- Khi Mutator đã được chốt và vòng vote kết thúc
			hasVotedThisRound = false
		end
	end)
end

-- Vòng lặp theo dõi GUI dự phòng (khi GUI MutatorVoting mở lên)
local function startGuiWatcher()
	if guiWatcherThread then return end

	guiWatcherThread = task.spawn(function()
		while lifecycle.IsActive() and zoneGuard.IsInGame() do
			if slopMutator.Enabled and not hasVotedThisRound then
				local player = Players.LocalPlayer
				local playerGui = player and player:FindFirstChild("PlayerGui")
				local slopGui = playerGui and playerGui:FindFirstChild("SlopMutatorGui")
				local mutatorVoting = slopGui and slopGui:FindFirstChild("MutatorVoting")

				if mutatorVoting and mutatorVoting:IsA("GuiObject") and mutatorVoting.Visible then
					local candidates = {}
					for _, child in ipairs(mutatorVoting:GetChildren()) do
						if child:IsA("GuiButton") and child.Visible then
							table.insert(candidates, {
								Id = child.Name,
								Title = child.Name,
							})
						end
					end

					if #candidates > 0 then
						logger.Log("[SlopMutator] Phát hiện bảng MutatorVoting trên GUI, chuẩn bị vote...")
						performVote(candidates)
					end
				end
			end
			task.wait(0.5)
		end
		guiWatcherThread = nil
	end)
end

function slopMutator.SetEnabled(state: boolean)
	slopMutator.Enabled = state
	logger.Log("[SlopMutator] Cập nhật Auto Slop Mutator:", state)
	if state and zoneGuard.IsInGame() then
		hookRemote()
		startGuiWatcher()
	end
end

function slopMutator.SetVoteDelay(delay: number)
	slopMutator.VoteDelay = math.clamp(tonumber(delay) or 0, 0, 10)
end

function slopMutator.GetVoteDelay(): number
	return slopMutator.VoteDelay
end

function slopMutator.SetPriority(id: string, priority: number)
	slopMutator.Priorities[id] = math.clamp(tonumber(priority) or 0, 0, 100)
end

function slopMutator.GetPriority(id: string): number
	return slopMutator.Priorities[id] or 50
end

-- Reset trạng thái khi chuyển ván hoặc đổi zone
function slopMutator.Reset()
	hasVotedThisRound = false
	if remoteConnection then
		remoteConnection:Disconnect()
		remoteConnection = nil
	end
	guiWatcherThread = nil
end

-- Đăng ký với ZoneGuard
zoneGuard.Register({
	Name = "SlopMutator",
	Zone = "InGame",
	OnEnter = function()
		hasVotedThisRound = false
		if slopMutator.Enabled then
			hookRemote()
			startGuiWatcher()
		end
	end,
	OnLeave = function()
		slopMutator.Reset()
	end,
})

-- Dọn dẹp khi reload script
lifecycle.Register(function()
	slopMutator.Reset()
end)

return slopMutator
