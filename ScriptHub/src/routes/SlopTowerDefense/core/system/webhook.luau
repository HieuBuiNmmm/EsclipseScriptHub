-- Webhook: Quản lý và gửi thông báo Discord Webhook cho Slop Tower Defense
-- Hỗ trợ: Kết quả trận đấu (Win/Loss), Auto Summon, Hoàn thành Macro, và Test Webhook.

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local constants = require("@routes/SlopTowerDefense/core/game/constants")
local gameStats = require("@routes/SlopTowerDefense/core/game/gameStats")
local matchSetup = require("@routes/SlopTowerDefense/core/game/matchSetup")
local playerProfile = require("@routes/SlopTowerDefense/core/game/playerProfile")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")
local logger = require("@routes/SlopTowerDefense/core/system/logger")

local matchStartProfile: playerProfile.PlayerProfileData? = nil

local webhook = {
	Url = "",
	Enabled = false,
	NotifyMatchEnd = true,
	NotifySummon = true,
	NotifyMacro = true,
	PingUserId = "",
}

-- Hàm gửi HTTP Request an toàn hỗ trợ đa số các executor
local function sendHttpRequest(url: string, payload: any): (boolean, string?)
	if not url or url == "" or not url:find("^https://") then
		return false, "Invalid Webhook URL!"
	end

	local httpReq = (request or http_request or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request))
	if not httpReq then
		return false, "Executor does not support HTTP requests (request / http_request)"
	end

	local ok, body = pcall(function()
		return HttpService:JSONEncode(payload)
	end)
	if not ok then
		return false, "Unable to encode JSON payload: " .. tostring(body)
	end

	local reqOk, response = pcall(function()
		return httpReq({
			Url = url,
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
			},
			Body = body,
		})
	end)

	if not reqOk then
		return false, "Error sending request: " .. tostring(response)
	end

	local status = response and (response.StatusCode or response.Status)
	if status and status >= 200 and status < 300 then
		return true, nil
	end

	return false, "HTTP response code: " .. tostring(status)
end

-- Lấy chuỗi mention ping user nếu có cấu hình
local function getPingMention(): string?
	if webhook.PingUserId and webhook.PingUserId ~= "" then
		local cleanId = webhook.PingUserId:gsub("%D", "")
		if #cleanId > 0 then
			return string.format("<@%s>", cleanId)
		end
	end
	return nil
end

-- 1. Gửi tin nhắn Test kiểm tra kết nối
function webhook.SendTest(): (boolean, string?)
	local player = Players.LocalPlayer
	local playerName = player and player.Name or "Unknown"
	local profile = playerProfile.GetData()

	local payload = {
		content = getPingMention(),
		embeds = {
			{
				title = "🧪 Slop Tower Defense • Test Webhook",
				description = "Discord Webhook connection from **EsclipseScriptHub** is working successfully!",
				color = 15844367, -- Gold
				fields = {
					{
						name = "👤 Player",
						value = string.format("`%s`", playerName),
						inline = true,
					},
					{
						name = "📍 Location",
						value = string.format("`%s`", constants.GetLocationName()),
						inline = true,
					},
					{
						name = "⚡ Status",
						value = "🟢 Operational",
						inline = true,
					},
					{
						name = "💎 Gems",
						value = string.format("`%s`", playerProfile.FormatNumber(profile.Gems)),
						inline = true,
					},
					{
						name = "⭐ Stars",
						value = string.format("`%s`", playerProfile.FormatNumber(profile.Stars)),
						inline = true,
					},
					{
						name = "💰 Sheckles",
						value = string.format("`%s`", playerProfile.FormatNumber(profile.Sheckles)),
						inline = true,
					},
					{
						name = "🏆 Total Wins",
						value = string.format("`%s`", playerProfile.FormatNumber(profile.Wins)),
						inline = true,
					},
				},
				footer = {
					text = "EsclipseScriptHub • Slop Tower Defense",
				},
				timestamp = DateTime.now():ToIsoDate(),
			},
		},
	}

	return sendHttpRequest(webhook.Url, payload)
end

-- Đọc tiêu đề EndScreen từ đường dẫn:
-- game:GetService("Players").LocalPlayer.PlayerGui.GameGui.EndScreen.Content.Title
local function getEndScreenTitleText(): string?
	local player = Players.LocalPlayer
	local playerGui = player and player:FindFirstChild("PlayerGui")
	local gameGui = playerGui and playerGui:FindFirstChild("GameGui")
	if not gameGui then return nil end

	local endScreen = gameGui:FindFirstChild("EndScreen")
	if not endScreen then return nil end

	-- 1. Đường dẫn chính xác từ người dùng: EndScreen.Content.Title
	local content = endScreen:FindFirstChild("Content")
	local title = content and content:FindFirstChild("Title")
	if title and title:IsA("TextLabel") and title.Text ~= "" then
		return title.Text
	end

	-- 2. Fallback tìm kiếm linh hoạt bên trong EndScreen
	local deepTitle = endScreen:FindFirstChild("Title", true)
	if deepTitle and deepTitle:IsA("TextLabel") and deepTitle.Text ~= "" then
		return deepTitle.Text
	end

	return nil
end

-- Phân biệt Thắng / Thua:
-- Nếu là "Defeat" -> Thua
-- Ngược lại nếu là một chữ khác -> Thắng (Win)
local function determineVictory(deltaWins: number?, preReadTitle: string?): (boolean, string)
	local rawTitle = preReadTitle or getEndScreenTitleText()
	if rawTitle and #rawTitle > 0 then
		local cleanTitle = rawTitle:match("^%s*(.-)%s*$") or rawTitle
		local lower = cleanTitle:lower()
		if lower:find("defeat") then
			return false, cleanTitle
		else
			return true, cleanTitle
		end
	end

	-- Fallback phụ nếu Title chưa render xong
	if deltaWins and deltaWins > 0 then
		return true, "Victory"
	end

	return false, "Defeat"
end

-- 2. Gửi thông báo kết quả trận đấu (Match End - Phương án B Đầy đủ & Chi tiết)
function webhook.SendMatchEnd(
	stats: gameStats.GameStatsSnapshot?,
	startSnapshot: playerProfile.PlayerProfileData?,
	preReadTitle: string?
): (boolean, string?)
	if not webhook.Enabled or not webhook.NotifyMatchEnd or webhook.Url == "" then
		return false, "Webhook is disabled or URL is empty"
	end

	local player = Players.LocalPlayer
	local playerName = player and player.Name or "Unknown"
	stats = stats or gameStats.GetSnapshot()

	-- Lấy hồ sơ tài khoản sau trận
	local postProfile = playerProfile.GetData()
	local start = startSnapshot or matchStartProfile or postProfile

	-- Tính chênh lệch từng loại tài nguyên trong trận (Delta)
	local deltaGems = postProfile.Gems - start.Gems
	local deltaStars = postProfile.Stars - start.Stars
	local deltaWins = postProfile.Wins - start.Wins
	local deltaCrystals = postProfile.Crystals - start.Crystals
	local deltaSheckles = postProfile.Sheckles - start.Sheckles
	local deltaTokens = postProfile.Tokens - start.Tokens
	local deltaSlopbux = postProfile.Slopbux - start.Slopbux
	local deltaCogs = postProfile.Cogs - start.Cogs

	logger.Log(string.format("[Webhook] Delta tính toán: Crystals: %d -> %d (+%d) | Sheckles: %d -> %d (+%d) | Gems: %d -> %d (+%d) | Wins: %d -> %d (+%d)",
		start.Crystals, postProfile.Crystals, deltaCrystals,
		start.Sheckles, postProfile.Sheckles, deltaSheckles,
		start.Gems, postProfile.Gems, deltaGems,
		start.Wins, postProfile.Wins, deltaWins))

	-- Xác định kết quả dựa trên EndScreen.Content.Title (ưu tiên preReadTitle chụp trước khi AutoReplay đóng UI)
	local isVictory, outcomeTitle = determineVictory(deltaWins, preReadTitle)
	local resultTitle = isVictory and "🏆 MATCH ENDED • VICTORY" or "💀 MATCH ENDED • DEFEAT"
	local resultColor = isVictory and 3066993 or 15158332 -- Green (Win) / Red (Loss)

	-- Format chuỗi Delta hiển thị
	local function formatDeltaText(currentVal: number, delta: number): string
		local formatted = playerProfile.FormatNumber(currentVal)
		if delta > 0 then
			return string.format("%s `(+%s)`", formatted, playerProfile.FormatNumber(delta))
		elseif delta < 0 then
			return string.format("%s `(-%s)`", formatted, playerProfile.FormatNumber(math.abs(delta)))
		end
		return string.format("%s `(+0)`", formatted)
	end

	-- Danh sách tài nguyên chi tiết (Phương án B)
	local rewardsLines = {
		string.format("💎 **Gems:** %s", formatDeltaText(postProfile.Gems, deltaGems)),
		string.format("⭐ **Stars:** %s", formatDeltaText(postProfile.Stars, deltaStars)),
		string.format("💰 **Sheckles:** %s", formatDeltaText(postProfile.Sheckles, deltaSheckles)),
		string.format("🏆 **Total Wins:** %s", formatDeltaText(postProfile.Wins, deltaWins)),
		string.format("🔮 **Crystals:** %s", formatDeltaText(postProfile.Crystals, deltaCrystals)),
		string.format("🪙 **Tokens:** %s", formatDeltaText(postProfile.Tokens, deltaTokens)),
		string.format("🍔 **Slopbux:** %s", formatDeltaText(postProfile.Slopbux, deltaSlopbux)),
		string.format("⚙️ **Cogs:** %s", formatDeltaText(postProfile.Cogs, deltaCogs)),
	}
	local rewardsText = table.concat(rewardsLines, "\n")

	-- Cập nhật lại snapshot cho ván tiếp theo
	matchStartProfile = playerProfile.GetSnapshot()

	local payload = {
		content = getPingMention(),
		embeds = {
			{
				title = resultTitle,
				color = resultColor,
				fields = {
					{
						name = "👤 Player",
						value = string.format("`%s`", playerName),
						inline = true,
					},
					{
						name = "🎯 Result",
						value = isVictory and string.format("🟢 **%s**", outcomeTitle) or string.format("🔴 **%s**", outcomeTitle),
						inline = true,
					},
					{
						name = "🗺️ Map",
						value = string.format("`%s`", matchSetup.SelectedMap or "Unknown"),
						inline = true,
					},
					{
						name = "⚙️ Difficulty",
						value = string.format("`%s`", matchSetup.SelectedDifficulty or "Normal"),
						inline = true,
					},
					{
						name = "🌊 Wave Reached",
						value = string.format("`%s`", stats.WaveFormatted or "0/0"),
						inline = true,
					},
					{
						name = "⏱️ Match Duration",
						value = string.format("`%s`", stats.ElapsedTimeFormatted or "00:00"),
						inline = true,
					},
					{
						name = "🎒 Inventory",
						value = string.format("`%d / %d`", postProfile.TowersCount, postProfile.InventorySpace),
						inline = true,
					},
					{
						name = "🎁 Rewards & Currency",
						value = rewardsText,
						inline = false,
					},
				},
				footer = {
					text = "EsclipseScriptHub • Slop Tower Defense",
				},
				timestamp = DateTime.now():ToIsoDate(),
			},
		},
	}

	return sendHttpRequest(webhook.Url, payload)
end

-- 3. Gửi thông báo Auto Summon
function webhook.SendSummon(banner: string, amount: string): (boolean, string?)
	if not webhook.Enabled or not webhook.NotifySummon or webhook.Url == "" then
		return false, "Webhook is disabled or URL is empty"
	end

	local player = Players.LocalPlayer
	local playerName = player and player.Name or "Unknown"

	local payload = {
		content = getPingMention(),
		embeds = {
			{
				title = "✨ AUTO SUMMON • SUMMON UNIT",
				color = 10181046, -- Purple
				fields = {
					{
						name = "👤 Player",
						value = string.format("`%s`", playerName),
						inline = true,
					},
					{
						name = "🎁 Banner",
						value = string.format("`%s`", banner),
						inline = true,
					},
					{
						name = "🔢 Amount",
						value = string.format("`%s`", amount),
						inline = true,
					},
				},
				footer = {
					text = "EsclipseScriptHub • Slop Tower Defense",
				},
				timestamp = DateTime.now():ToIsoDate(),
			},
		},
	}

	return sendHttpRequest(webhook.Url, payload)
end

-- 4. Gửi thông báo Macro
function webhook.SendMacro(macroName: string, totalSteps: number, status: string): (boolean, string?)
	if not webhook.Enabled or not webhook.NotifyMacro or webhook.Url == "" then
		return false, "Webhook is disabled or URL is empty"
	end

	local player = Players.LocalPlayer
	local playerName = player and player.Name or "Unknown"

	local isSuccess = status == "Completed"
	local color = isSuccess and 3066993 or 15158332

	local payload = {
		content = getPingMention(),
		embeds = {
			{
				title = isSuccess and "📋 MACRO COMPLETED" or "⚠️ MACRO STOPPED",
				color = color,
				fields = {
					{
						name = "👤 Player",
						value = string.format("`%s`", playerName),
						inline = true,
					},
					{
						name = "📁 Macro",
						value = string.format("`%s`", macroName),
						inline = true,
					},
					{
						name = "🔢 Total Steps",
						value = string.format("`%d steps`", totalSteps),
						inline = true,
					},
					{
						name = "⚡ Status",
						value = string.format("`%s`", status),
						inline = true,
					},
				},
				footer = {
					text = "EsclipseScriptHub • Slop Tower Defense",
				},
				timestamp = DateTime.now():ToIsoDate(),
			},
		},
	}

	return sendHttpRequest(webhook.Url, payload)
end

-- Giám sát tự động trận đấu để gửi kết quả khi kết thúc
local wasMatchActive = false
local lastMatchStats: gameStats.GameStatsSnapshot? = nil

local function onGameStatsUpdate(data: gameStats.GameStatsSnapshot)
	-- 1. Khi trận đấu BẮT ĐẦU: Chụp snapshot profile trước trận
	if not wasMatchActive and data.IsMatchActive then
		task.spawn(function()
			if not playerProfile.GetData().Loaded then
				playerProfile.Fetch(true)
			end
			matchStartProfile = playerProfile.GetSnapshot()
			logger.Log(string.format("[Webhook] Match BẮT ĐẦU -> Lưu snapshot trước trận (Crystals: %d, Sheckles: %d, Gems: %d, Wins: %d)",
				matchStartProfile.Crystals, matchStartProfile.Sheckles, matchStartProfile.Gems, matchStartProfile.Wins))
		end)
	end

	-- 2. Khi trận đấu KẾT THÚC:
	if wasMatchActive and not data.IsMatchActive then
		local statsToSend = lastMatchStats or data
		-- LƯU NGAY snapshot trước trận của ván này vào biến cục bộ (closure)
		-- để nếu ván tiếp theo bắt đầu ngay lập tức (AutoReplay) thì ván này vẫn dùng đúng dữ liệu trước trận của nó!
		local startSnapshot = matchStartProfile or playerProfile.GetSnapshot()
		local endTitle = getEndScreenTitleText()

		logger.Log(string.format("[Webhook] Match KẾT THÚC -> Bắt đầu gửi Webhook (Start Crystals: %d, Title: %s)",
			startSnapshot.Crystals, tostring(endTitle)))

		if webhook.Enabled and webhook.NotifyMatchEnd and webhook.Url ~= "" then
			task.spawn(function()
				-- Chờ 1.0s để server Roblox ghi nhận và cộng thưởng vào tài khoản
				task.wait(1.0)
				-- Refresh lại profile từ server để lấy dữ liệu sau trận
				playerProfile.Fetch(true)
				-- Gửi thông báo kèm chính xác snapshot trước trận và title của ván này
				webhook.SendMatchEnd(statsToSend, startSnapshot, endTitle)
			end)
		end
	end

	wasMatchActive = data.IsMatchActive
	lastMatchStats = data
end

local unsubscribeStats = gameStats.Subscribe(onGameStatsUpdate)
lifecycle.Register(unsubscribeStats)

-- Khởi tạo snapshot ban đầu ngay khi script load hoặc khi profile sẵn sàng
local function initStartProfile()
	if playerProfile.GetData().Loaded then
		matchStartProfile = playerProfile.GetSnapshot()
		logger.Log(string.format("[Webhook] Đã khởi tạo snapshot ban đầu (Crystals: %d, Gems: %d)",
			matchStartProfile.Crystals, matchStartProfile.Gems))
	end
end

initStartProfile()
playerProfile.Subscribe(function(data)
	if data.Loaded and not matchStartProfile then
		matchStartProfile = playerProfile.GetSnapshot()
		logger.Log(string.format("[Webhook] Đã khởi tạo snapshot ban đầu qua Subscribe (Crystals: %d, Gems: %d)",
			matchStartProfile.Crystals, matchStartProfile.Gems))
	end
end)

-- Getters & Setters
function webhook.SetUrl(url: string)
	webhook.Url = url or ""
end

function webhook.GetUrl(): string
	return webhook.Url
end

function webhook.SetEnabled(state: boolean)
	webhook.Enabled = (state == true)
end

function webhook.IsEnabled(): boolean
	return webhook.Enabled
end

function webhook.SetNotifyMatchEnd(state: boolean)
	webhook.NotifyMatchEnd = (state == true)
end

function webhook.IsNotifyMatchEnd(): boolean
	return webhook.NotifyMatchEnd
end

function webhook.SetNotifySummon(state: boolean)
	webhook.NotifySummon = (state == true)
end

function webhook.IsNotifySummon(): boolean
	return webhook.NotifySummon
end

function webhook.SetNotifyMacro(state: boolean)
	webhook.NotifyMacro = (state == true)
end

function webhook.IsNotifyMacro(): boolean
	return webhook.NotifyMacro
end

function webhook.SetPingUserId(id: string)
	webhook.PingUserId = id or ""
end

function webhook.GetPingUserId(): string
	return webhook.PingUserId
end

function webhook.Reset()
	webhook.Enabled = false
end

lifecycle.Register(function()
	webhook.Reset()
end)

return webhook
