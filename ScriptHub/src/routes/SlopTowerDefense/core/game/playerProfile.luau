-- PlayerProfile: Quản lý và cache dữ liệu người chơi từ Remotes.PlayerData.GetData
-- Cung cấp Pity đếm ngược cho Auto Summon và thông tin ví/thống kê cho Player Dashboard.

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")
local logger = require("@routes/SlopTowerDefense/core/system/logger")

export type PityStats = {
	Godly: number,
	Mythical: number,
	Celestial: number,
	Sloppy: number,
	Secret: number,
}

export type PlayerProfileData = {
	Loaded: boolean,
	LastUpdated: number,
	Gems: number,
	Crystals: number,
	Stars: number,
	Slopbux: number,
	Tokens: number,
	Cash: number,
	Sheckles: number,
	Cogs: number,
	Wins: number,
	TotalPlayTime: number,
	TotalPlayTimeFormatted: string,
	TowersCount: number,
	InventorySpace: number,
	PityBasic: PityStats,
	PityPremium: PityStats,
	ActiveLoadout: { [string]: string },
	RawData: { [string]: any }?,
}

local playerProfile = {}

local cachedData: PlayerProfileData = {
	Loaded = false,
	LastUpdated = 0,
	Gems = 0,
	Crystals = 0,
	Stars = 0,
	Slopbux = 0,
	Tokens = 0,
	Cash = 0,
	Sheckles = 0,
	Cogs = 0,
	Wins = 0,
	TotalPlayTime = 0,
	TotalPlayTimeFormatted = "0m",
	TowersCount = 0,
	InventorySpace = 500,
	PityBasic = {
		Godly = 0,
		Mythical = 0,
		Celestial = 0,
		Sloppy = 0,
		Secret = 0,
	},
	PityPremium = {
		Godly = 0,
		Mythical = 0,
		Celestial = 0,
		Sloppy = 0,
		Secret = 0,
	},
	ActiveLoadout = {},
	RawData = nil,
}

local subscribers: { (PlayerProfileData) -> () } = {}
local isFetching = false
local lastFetchTime = 0
local getDataRemote: RemoteFunction? = nil

-- Định dạng số có dấu phẩy (vd: 12154 -> "12,154")
function playerProfile.FormatNumber(val: number?): string
	local n = tonumber(val) or 0
	local formatted = tostring(math.floor(n))
	local k
	while true do
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", "%1,%2")
		if k == 0 then break end
	end
	return formatted
end

-- Định dạng thời gian chơi (vd: 31985 giây -> "8h 53m")
local function formatPlayTime(seconds: number?): string
	local sec = tonumber(seconds) or 0
	local hours = math.floor(sec / 3600)
	local mins = math.floor((sec % 3600) / 60)
	if hours > 0 then
		return string.format("%dh %dm", hours, mins)
	end
	return string.format("%dm", mins)
end

-- Tìm RemoteFunction GetData chính xác
local function getRemote(): RemoteFunction?
	if getDataRemote and getDataRemote.Parent then
		return getDataRemote
	end

	local remotesFolder = ReplicatedStorage:FindFirstChild("Remotes")
	local playerDataFolder = remotesFolder and remotesFolder:FindFirstChild("PlayerData")
	if playerDataFolder then
		local r = playerDataFolder:FindFirstChild("GetData")
		if r and r:IsA("RemoteFunction") then
			getDataRemote = r
			return r
		end
	end

	local fallback = ReplicatedStorage:FindFirstChild("GetData", true)
	if fallback and fallback:IsA("RemoteFunction") then
		getDataRemote = fallback
		return fallback
	end

	return nil
end

local function notifySubscribers()
	for _, sub in ipairs(subscribers) do
		pcall(sub, cachedData)
	end
end

-- Lấy và cập nhật dữ liệu từ server
function playerProfile.Fetch(force: boolean?): boolean
	local now = os.clock()
	if not force and (now - lastFetchTime < 1.5 or isFetching) then
		return false
	end

	local remote = getRemote()
	if not remote then
		logger.Warn("[PlayerProfile] Không tìm thấy RemoteFunction: Remotes.PlayerData.GetData")
		return false
	end

	isFetching = true
	local ok, raw = pcall(function()
		return remote:InvokeServer()
	end)
	isFetching = false
	lastFetchTime = os.clock()

	if not ok or type(raw) ~= "table" then
		logger.Warn("[PlayerProfile] Lỗi gọi GetData:", tostring(raw))
		return false
	end

	-- Cập nhật dữ liệu vào cache
	cachedData.Loaded = true
	cachedData.LastUpdated = lastFetchTime
	cachedData.RawData = raw

	-- Tiền tệ
	cachedData.Gems = tonumber(raw.Gems) or 0
	cachedData.Crystals = tonumber(raw.Crystals) or 0
	cachedData.Stars = tonumber(raw.Stars) or 0
	cachedData.Slopbux = tonumber(raw.Slopbux) or 0
	cachedData.Tokens = tonumber(raw.Tokens) or 0
	cachedData.Cash = tonumber(raw.Cash) or 0
	cachedData.Sheckles = tonumber(raw.Sheckles) or 0
	cachedData.Cogs = tonumber(raw.Cogs) or 0

	-- Thống kê
	cachedData.Wins = tonumber(raw.Wins) or 0
	cachedData.TotalPlayTime = tonumber(raw.TotalPlayTime) or 0
	cachedData.TotalPlayTimeFormatted = formatPlayTime(cachedData.TotalPlayTime)
	cachedData.InventorySpace = tonumber(raw.InventorySpace) or 500

	-- Đếm số lượng tháp sở hữu
	local count = 0
	if type(raw.Towers) == "table" then
		for _ in pairs(raw.Towers) do
			count += 1
		end
	end
	cachedData.TowersCount = count

	-- Pity
	if type(raw.Pity) == "table" then
		local b = raw.Pity.Basic or {}
		cachedData.PityBasic.Godly = tonumber(b.Godly) or 0
		cachedData.PityBasic.Mythical = tonumber(b.Mythical) or 0
		cachedData.PityBasic.Celestial = tonumber(b.Celestial) or 0
		cachedData.PityBasic.Sloppy = tonumber(b.Sloppy) or 0
		cachedData.PityBasic.Secret = tonumber(b.Secret) or 0

		local p = raw.Pity.Premium or {}
		cachedData.PityPremium.Godly = tonumber(p.Godly) or 0
		cachedData.PityPremium.Mythical = tonumber(p.Mythical) or 0
		cachedData.PityPremium.Celestial = tonumber(p.Celestial) or 0
		cachedData.PityPremium.Sloppy = tonumber(p.Sloppy) or 0
		cachedData.PityPremium.Secret = tonumber(p.Secret) or 0
	end

	-- Đội hình (Active Loadout)
	table.clear(cachedData.ActiveLoadout)
	if type(raw.Loadouts) == "table" then
		local deck = raw.Loadouts["1"] or raw.Loadouts[1]
		if type(deck) == "table" then
			for slot, towerName in pairs(deck) do
				cachedData.ActiveLoadout[tostring(slot)] = tostring(towerName)
			end
		end
	end

	notifySubscribers()
	return true
end

function playerProfile.GetData(): PlayerProfileData
	return cachedData
end

-- Lấy bản sao snapshot tĩnh của hồ sơ tại một thời điểm
function playerProfile.GetSnapshot(): PlayerProfileData
	return {
		Loaded = cachedData.Loaded,
		LastUpdated = cachedData.LastUpdated,
		Gems = cachedData.Gems,
		Crystals = cachedData.Crystals,
		Stars = cachedData.Stars,
		Slopbux = cachedData.Slopbux,
		Tokens = cachedData.Tokens,
		Cash = cachedData.Cash,
		Sheckles = cachedData.Sheckles,
		Cogs = cachedData.Cogs,
		Wins = cachedData.Wins,
		TotalPlayTime = cachedData.TotalPlayTime,
		TotalPlayTimeFormatted = cachedData.TotalPlayTimeFormatted,
		TowersCount = cachedData.TowersCount,
		InventorySpace = cachedData.InventorySpace,
		PityBasic = {
			Godly = cachedData.PityBasic.Godly,
			Mythical = cachedData.PityBasic.Mythical,
			Celestial = cachedData.PityBasic.Celestial,
			Sloppy = cachedData.PityBasic.Sloppy,
			Secret = cachedData.PityBasic.Secret,
		},
		PityPremium = {
			Godly = cachedData.PityPremium.Godly,
			Mythical = cachedData.PityPremium.Mythical,
			Celestial = cachedData.PityPremium.Celestial,
			Sloppy = cachedData.PityPremium.Sloppy,
			Secret = cachedData.PityPremium.Secret,
		},
		ActiveLoadout = table.clone(cachedData.ActiveLoadout),
		RawData = nil,
	}
end

function playerProfile.GetPity(banner: string?): PityStats
	if banner == "Premium" then
		return cachedData.PityPremium
	end
	return cachedData.PityBasic
end

-- Đăng ký lắng nghe thay đổi hồ sơ người chơi
function playerProfile.Subscribe(callback: (PlayerProfileData) -> ()): () -> ()
	table.insert(subscribers, callback)
	task.spawn(callback, cachedData)

	return function()
		local idx = table.find(subscribers, callback)
		if idx then
			table.remove(subscribers, idx)
		end
	end
end

-- Vòng lặp định kỳ tự động làm mới dữ liệu
local isWatcherRunning = true
task.spawn(function()
	task.wait(1.0)
	playerProfile.Fetch(true)

	while isWatcherRunning and lifecycle.IsActive() do
		task.wait(10.0)
		if isWatcherRunning and lifecycle.IsActive() then
			playerProfile.Fetch()
		end
	end
end)

lifecycle.Register(function()
	isWatcherRunning = false
	table.clear(subscribers)
end)

return playerProfile
