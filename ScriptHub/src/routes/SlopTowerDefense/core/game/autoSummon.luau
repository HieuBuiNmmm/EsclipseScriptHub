-- AutoSummon: Tự động triệu hồi (Summon/Roll) Unit trong Lobby cho Slop Tower Defense
-- Hỗ trợ 2 Banner: Basic (Remotes.Summon.Summon) và Premium (Remotes.Summon.SummonPremium) với các mốc x1, x10, x50.

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local constants = require("./constants")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")
local logger = require("@routes/SlopTowerDefense/core/system/logger")

local autoSummon = {
	Enabled = false,
	SelectedBanner = "Basic",
	Banners = { "Basic", "Premium" },
	SummonAmount = "x10",
	Amounts = { "x1", "x10", "x50" },
	SummonDelay = 0.5,
}

local activeThread: thread? = nil
local lastSummonTime = 0

-- Tìm RemoteFunction Summon chính xác trong ReplicatedStorage.Remotes.Summon
local function getSummonRemote(banner: string): RemoteFunction?
	local remotesFolder = ReplicatedStorage:FindFirstChild("Remotes")
	local summonFolder = remotesFolder and remotesFolder:FindFirstChild("Summon")
	if not summonFolder then
		summonFolder = ReplicatedStorage:FindFirstChild("Summon", true)
	end

	local remoteName = (banner == "Premium") and "SummonPremium" or "Summon"

	if summonFolder then
		local r = summonFolder:FindFirstChild(remoteName)
		if r and r:IsA("RemoteFunction") then
			return r
		end
	end

	-- Fallback tìm đệ quy trong toàn bộ ReplicatedStorage
	local fallback = ReplicatedStorage:FindFirstChild(remoteName, true)
	if fallback and fallback:IsA("RemoteFunction") then
		return fallback
	end

	return nil
end

-- Chuyển đổi định dạng mốc số lượng từ chuỗi ("x1", "x10", "x50") sang số
local function getAmountNumber(): number
	if autoSummon.SummonAmount == "x50" then
		return 50
	elseif autoSummon.SummonAmount == "x10" then
		return 10
	end
	return 1
end

-- Thực hiện 1 lượt triệu hồi
function autoSummon.ExecuteSummon(): boolean
	local remote = getSummonRemote(autoSummon.SelectedBanner)
	local amountNum = getAmountNumber()

	if not remote then
		logger.Warn(string.format("[Auto Summon] Không tìm thấy RemoteFunction: Remotes.Summon.%s",
			(autoSummon.SelectedBanner == "Premium") and "SummonPremium" or "Summon"))
		return false
	end

	local success, result = pcall(function()
		return remote:InvokeServer(amountNum)
	end)

	if not success then
		logger.Warn("[Auto Summon] Lỗi gọi Remote:", tostring(result))
		return false
	end

	if result == false then
		return false
	end

	pcall(function()
		local webhook = require("@routes/SlopTowerDefense/core/system/webhook")
		webhook.SendSummon(autoSummon.SelectedBanner, autoSummon.SummonAmount)
	end)

	pcall(function()
		local playerProfile = require("./playerProfile")
		task.spawn(function()
			task.wait(0.2)
			playerProfile.Fetch(true)
		end)
	end)

	return true
end

-- Vòng lặp Auto Summon
local function runLoop()
	while autoSummon.Enabled and lifecycle.IsActive() do
		-- Chỉ triệu hồi khi đang ở sảnh (Lobby)
		if constants.IsLobby() then
			local now = os.clock()
			if now - lastSummonTime >= autoSummon.SummonDelay then
				lastSummonTime = now
				local ok = autoSummon.ExecuteSummon()
				if not ok then
					-- Nếu thất bại (hết tiền, kho đầy hoặc remote bận), chờ 1 giây trước khi thử lại
					task.wait(1.0)
				end
			end
		else
			-- Nếu vào trận thì tạm ngừng kiểm tra
			task.wait(1.0)
		end
		task.wait(0.05)
	end
	activeThread = nil
end

function autoSummon.SetEnabled(state: boolean)
	if autoSummon.Enabled == state then return end
	autoSummon.Enabled = (state == true)

	if autoSummon.Enabled then
		if not activeThread then
			activeThread = task.spawn(runLoop)
		end
		notifier.Notify("Auto Summon", string.format("Auto Summon enabled (%s - %s).", autoSummon.SelectedBanner, autoSummon.SummonAmount), 2)
	else
		activeThread = nil
		notifier.Notify("Auto Summon", "Auto Summon disabled.", 2)
	end
end

function autoSummon.IsEnabled(): boolean
	return autoSummon.Enabled
end

function autoSummon.SetBanner(banner: string)
	if banner == "Basic" or banner == "Premium" then
		autoSummon.SelectedBanner = banner
	end
end

function autoSummon.GetBanner(): string
	return autoSummon.SelectedBanner
end

function autoSummon.SetAmount(amount: string)
	if amount == "x1" or amount == "x10" or amount == "x50" then
		autoSummon.SummonAmount = amount
	end
end

function autoSummon.GetAmount(): string
	return autoSummon.SummonAmount
end

function autoSummon.SetDelay(sec: number)
	autoSummon.SummonDelay = math.clamp(tonumber(sec) or 0.5, 0.1, 5)
end

function autoSummon.GetDelay(): number
	return autoSummon.SummonDelay
end

-- Tự động dọn dẹp khi reload script
lifecycle.Register(function()
	autoSummon.Enabled = false
	activeThread = nil
end)

return autoSummon
