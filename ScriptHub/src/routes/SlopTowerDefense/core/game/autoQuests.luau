-- AutoQuests: Tự động kiểm tra và nhận thưởng Nhiệm vụ Daily & Weekly cho Slop Tower Defense
-- Remotes sử dụng: ReplicatedStorage.Network.RemoteEvents.CollectQuest:FireServer(questId, category)
-- Theo dõi trạng thái mốc thưởng qua LocalPlayer Attributes (DailyQuestsClaimed, DailyBonusClaimed,...)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")
local gameStats = require("./gameStats")
local zoneGuard = require("./zoneGuard")

export type QuestItem = {
	Id: string,
	Category: "Daily" | "Weekly",
	IsReady: boolean,
	IsClaimed: boolean,
}

export type QuestsSnapshot = {
	DailyClaimed: number,
	DailyTotal: number,
	DailyBonusClaimed: boolean,
	WeeklyClaimed: number,
	WeeklyTotal: number,
	WeeklyBonusClaimed: boolean,
	ReadyQuestsCount: number,
	ClaimedCountSession: number,
	LastChecked: number,
}

local autoQuests = {
	Enabled = false,
	CheckInterval = 20,
	ClaimCountSession = 0,
	LastChecked = 0,
}

local activeThread: thread? = nil
local collectRemote: RemoteEvent? = nil
local subscribers: { (QuestsSnapshot) -> () } = {}
local isChecking = false
local wasMatchActive = false

-- Tìm RemoteEvent CollectQuest chính xác trong ReplicatedStorage
local function getCollectRemote(): RemoteEvent?
	if collectRemote and collectRemote.Parent then
		return collectRemote
	end

	local network = ReplicatedStorage:FindFirstChild("Network")
	local remoteEvents = network and network:FindFirstChild("RemoteEvents")
	if remoteEvents then
		local r = remoteEvents:FindFirstChild("CollectQuest")
		if r and r:IsA("RemoteEvent") then
			collectRemote = r
			return r
		end
	end

	local fallback = ReplicatedStorage:FindFirstChild("CollectQuest", true)
	if fallback and fallback:IsA("RemoteEvent") then
		collectRemote = fallback
		return fallback
	end

	return nil
end

-- Hàm kích hoạt nút an toàn
local function clickButton(button: GuiButton)
	if not button or not button:IsA("GuiButton") then return end

	pcall(function()
		local gc = (getconnections or (syn and syn.getconnections) or (getgenv and getgenv().getconnections))
		if gc then
			for _, conn in ipairs(gc(button.MouseButton1Click)) do
				if conn.Fire then conn:Fire() elseif conn.fire then conn:fire() end
			end
			for _, conn in ipairs(gc(button.Activated)) do
				if conn.Fire then conn:Fire() elseif conn.fire then conn:fire() end
			end
		end
	end)

	pcall(function()
		local fs = (firesignal or (syn and syn.firesignal) or (getgenv and getgenv().firesignal))
		if fs then
			fs(button.MouseButton1Click)
			fs(button.Activated)
		end
	end)
end

-- Lấy thư mục chứa danh sách nhiệm vụ trong PlayerGui
local function getAllQuestsFolder(): Instance?
	local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
	if not playerGui then return nil end

	local mainGui = playerGui:FindFirstChild("Main")
	if not mainGui then return nil end

	local questsFrame = mainGui:FindFirstChild("QuestsFrame", true)
	if not questsFrame then return nil end

	return questsFrame:FindFirstChild("AllQuests", true)
end

-- Lấy snapshot dữ liệu tiến độ nhiệm vụ và bonus hiện tại
function autoQuests.GetSnapshot(): QuestsSnapshot
	local dailyClaimed = tonumber(LocalPlayer:GetAttribute("DailyQuestsClaimed")) or 0
	local dailyTotal = tonumber(LocalPlayer:GetAttribute("DailyQuestsTotal")) or 4
	local dailyBonus = LocalPlayer:GetAttribute("DailyBonusClaimed") == true

	local weeklyClaimed = tonumber(LocalPlayer:GetAttribute("WeeklyQuestsClaimed")) or 0
	local weeklyTotal = tonumber(LocalPlayer:GetAttribute("WeeklyQuestsTotal")) or 4
	local weeklyBonus = LocalPlayer:GetAttribute("WeeklyBonusClaimed") == true

	local readyCount = 0
	local allQuests = getAllQuestsFolder()
	if allQuests then
		for _, cat in ipairs({ "Daily", "Weekly" }) do
			local catFolder = allQuests:FindFirstChild(cat)
			if catFolder then
				for _, questObj in ipairs(catFolder:GetChildren()) do
					if questObj:IsA("GuiObject") then
						local btn = questObj:FindFirstChild("ClaimButton", true)
						if btn and btn:IsA("GuiButton") and btn.Visible then
							readyCount += 1
						end
					end
				end
			end
		end
	end

	return {
		DailyClaimed = dailyClaimed,
		DailyTotal = dailyTotal,
		DailyBonusClaimed = dailyBonus,
		WeeklyClaimed = weeklyClaimed,
		WeeklyTotal = weeklyTotal,
		WeeklyBonusClaimed = weeklyBonus,
		ReadyQuestsCount = readyCount,
		ClaimedCountSession = autoQuests.ClaimCountSession,
		LastChecked = autoQuests.LastChecked,
	}
end

-- Thông báo cho UI subscribers
local function notifySubscribers()
	local snapshot = autoQuests.GetSnapshot()
	for _, sub in ipairs(subscribers) do
		pcall(sub, snapshot)
	end
end

-- Quét và nhận tất cả nhiệm vụ đã hoàn thành (Chỉ hoạt động ở Lobby)
function autoQuests.CheckAndClaim(): (number, number)
	if isChecking or not zoneGuard.IsLobby() then
		return 0, 0
	end

	local remote = getCollectRemote()
	local allQuests = getAllQuestsFolder()

	if not allQuests then
		return 0, 0
	end

	isChecking = true
	local claimedCount = 0
	local eligibleCount = 0

	for _, category in ipairs({ "Daily", "Weekly" }) do
		local catFolder = allQuests:FindFirstChild(category)
		if catFolder then
			for _, questFrame in ipairs(catFolder:GetChildren()) do
				if questFrame:IsA("GuiObject") then
					local claimBtn = questFrame:FindFirstChild("ClaimButton", true)
					if claimBtn and claimBtn:IsA("GuiButton") and claimBtn.Visible then
						eligibleCount += 1
						local questId = questFrame.Name

						print(string.format("[Auto Quests] Phát hiện quest hoàn thành: [%s] %s -> Đang nhận...", category, questId))

						-- Cách 1: Gửi trực tiếp RemoteEvent CollectQuest
						if remote then
							pcall(function()
								remote:FireServer(questId, category)
							end)
						end

						-- Cách 2: Kích hoạt click trực tiếp nút ClaimButton (hỗ trợ dual trigger)
						clickButton(claimBtn)

						claimedCount += 1
						autoQuests.ClaimCountSession += 1

						notifier.Notify("Quest Claimed", string.format("Claimed [%s] %s!", category, questId), 3)
						print(string.format("[Auto Quests] Đã nhận thành công quest: [%s] %s", category, questId))

						task.wait(0.5) -- Giãn cách an toàn
					end
				end
			end
		end
	end

	autoQuests.LastChecked = os.clock()
	notifySubscribers()

	isChecking = false
	return claimedCount, eligibleCount
end

-- Vòng lặp chạy nền định kỳ
local function runLoop()
	while autoQuests.Enabled and lifecycle.IsActive() do
		local now = os.clock()
		if zoneGuard.IsLobby() and (now - autoQuests.LastChecked >= autoQuests.CheckInterval) then
			autoQuests.CheckAndClaim()
		end
		task.wait(1.0)
	end
	activeThread = nil
end

function autoQuests.SetEnabled(state: boolean)
	if autoQuests.Enabled == state then return end
	autoQuests.Enabled = (state == true)

	if autoQuests.Enabled then
		if not activeThread then
			activeThread = task.spawn(runLoop)
		end
		notifier.Notify("Auto Quests", "Auto Claim Quests enabled.", 2)

		task.spawn(function()
			task.wait(0.5)
			if autoQuests.Enabled and lifecycle.IsActive() and zoneGuard.IsLobby() then
				autoQuests.CheckAndClaim()
			end
		end)
	else
		activeThread = nil
		notifier.Notify("Auto Quests", "Auto Claim Quests disabled.", 2)
	end
end

function autoQuests.IsEnabled(): boolean
	return autoQuests.Enabled
end

function autoQuests.SetInterval(sec: number)
	autoQuests.CheckInterval = math.clamp(tonumber(sec) or 20, 5, 120)
end

function autoQuests.GetInterval(): number
	return autoQuests.CheckInterval
end

function autoQuests.Subscribe(callback: (QuestsSnapshot) -> ()): () -> ()
	table.insert(subscribers, callback)
	task.spawn(callback, autoQuests.GetSnapshot())

	return function()
		local idx = table.find(subscribers, callback)
		if idx then
			table.remove(subscribers, idx)
		end
	end
end

-- Lắng nghe thay đổi Attributes của LocalPlayer để cập nhật ngay lập tức
for _, attrName in ipairs({
	"DailyQuestsClaimed", "DailyQuestsTotal", "DailyBonusClaimed",
	"WeeklyQuestsClaimed", "WeeklyQuestsTotal", "WeeklyBonusClaimed",
}) do
	local conn = LocalPlayer:GetAttributeChangedSignal(attrName):Connect(function()
		notifySubscribers()
	end)
	lifecycle.Register(function()
		pcall(function() conn:Disconnect() end)
	end)
end

-- Lắng nghe GameStats để tự động kiểm tra nhận thưởng khi kết thúc trận
local unsubStats = gameStats.Subscribe(function(snapshot: gameStats.GameStatsSnapshot)
	if autoQuests.Enabled and wasMatchActive and not snapshot.IsMatchActive then
		task.spawn(function()
			task.wait(1.5)
			if autoQuests.Enabled and lifecycle.IsActive() then
				autoQuests.CheckAndClaim()
			end
		end)
	end
	wasMatchActive = snapshot.IsMatchActive
end)
lifecycle.Register(unsubStats)

-- Khởi tạo ban đầu
task.spawn(function()
	task.wait(1.5)
	if lifecycle.IsActive() then
		notifySubscribers()
	end
end)

-- Dọn dẹp khi reload script
lifecycle.Register(function()
	autoQuests.Enabled = false
	activeThread = nil
	table.clear(subscribers)
end)

return autoQuests
