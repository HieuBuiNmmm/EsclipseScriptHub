-- Webhook: Quản lý và gửi thông báo Discord Webhook cho Slop Tower Defense
-- Hỗ trợ: Kết quả trận đấu (Win/Loss), Auto Summon, Hoàn thành Macro, và Test Webhook.

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local constants = require("@routes/SlopTowerDefense/core/game/constants")
local gameStats = require("@routes/SlopTowerDefense/core/game/gameStats")
local matchSetup = require("@routes/SlopTowerDefense/core/game/matchSetup")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")

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
		return false, "URL Webhook không hợp lệ!"
	end

	local httpReq = (request or http_request or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request))
	if not httpReq then
		return false, "Executor không hỗ trợ hàm gửi HTTP request (request / http_request)"
	end

	local ok, body = pcall(function()
		return HttpService:JSONEncode(payload)
	end)
	if not ok then
		return false, "Không thể mã hóa dữ liệu JSON: " .. tostring(body)
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
		return false, "Lỗi gửi request: " .. tostring(response)
	end

	local status = response and (response.StatusCode or response.Status)
	if status and status >= 200 and status < 300 then
		return true, nil
	end

	return false, "Mã phản hồi HTTP: " .. tostring(status)
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

	local payload = {
		content = getPingMention(),
		embeds = {
			{
				title = "🧪 Slop Tower Defense • Test Webhook",
				description = "Kết nối Discord Webhook từ **EsclipseScriptHub** hoạt động thành công!",
				color = 15844367, -- Gold
				fields = {
					{
						name = "👤 Người chơi",
						value = string.format("`%s`", playerName),
						inline = true,
					},
					{
						name = "📍 Vị trí",
						value = string.format("`%s`", constants.GetLocationName()),
						inline = true,
					},
					{
						name = "⚡ Trạng thái",
						value = "🟢 Hoạt động tốt",
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

-- 2. Gửi thông báo kết quả trận đấu (Match End)
function webhook.SendMatchEnd(stats: gameStats.GameStatsSnapshot?): (boolean, string?)
	if not webhook.Enabled or not webhook.NotifyMatchEnd or webhook.Url == "" then
		return false, "Webhook chưa bật hoặc URL rỗng"
	end

	local player = Players.LocalPlayer
	local playerName = player and player.Name or "Unknown"
	stats = stats or gameStats.GetSnapshot()

	local isVictory = (stats.BaseHp or 0) > 0
	local resultTitle = isVictory and "🏆 TRẬN ĐẤU KẾT THÚC • CHIẾN THẮNG" or "💀 TRẬN ĐẤU KẾT THÚC • THẤT BẠI"
	local resultColor = isVictory and 3066993 or 15158332 -- Xanh lá (Win) / Đỏ (Loss)

	local payload = {
		content = getPingMention(),
		embeds = {
			{
				title = resultTitle,
				color = resultColor,
				fields = {
					{
						name = "👤 Người chơi",
						value = string.format("`%s`", playerName),
						inline = true,
					},
					{
						name = "🗺️ Bản đồ",
						value = string.format("`%s`", matchSetup.SelectedMap or "Unknown"),
						inline = true,
					},
					{
						name = "⚙️ Độ khó",
						value = string.format("`%s`", matchSetup.SelectedDifficulty or "Normal"),
						inline = true,
					},
					{
						name = "🌊 Wave đạt được",
						value = string.format("`%s`", stats.WaveFormatted or "0/0"),
						inline = true,
					},
					{
						name = "⏱️ Thời gian trận",
						value = string.format("`%s`", stats.ElapsedTimeFormatted or "00:00"),
						inline = true,
					},
					{
						name = "💰 Tiền cuối trận",
						value = string.format("`%s`", stats.CashFormatted or "$0"),
						inline = true,
					},
					{
						name = "❤️ Máu căn cứ",
						value = string.format("`%s`", stats.BaseHealthFormatted or "0/100"),
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

-- 3. Gửi thông báo Auto Summon
function webhook.SendSummon(banner: string, amount: string): (boolean, string?)
	if not webhook.Enabled or not webhook.NotifySummon or webhook.Url == "" then
		return false, "Webhook chưa bật hoặc URL rỗng"
	end

	local player = Players.LocalPlayer
	local playerName = player and player.Name or "Unknown"

	local payload = {
		content = getPingMention(),
		embeds = {
			{
				title = "✨ AUTO SUMMON • TRIỆU HỒI UNIT",
				color = 10181046, -- Tím
				fields = {
					{
						name = "👤 Người chơi",
						value = string.format("`%s`", playerName),
						inline = true,
					},
					{
						name = "🎁 Banner",
						value = string.format("`%s`", banner),
						inline = true,
					},
					{
						name = "🔢 Số lượng",
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
		return false, "Webhook chưa bật hoặc URL rỗng"
	end

	local player = Players.LocalPlayer
	local playerName = player and player.Name or "Unknown"

	local isSuccess = status == "Completed"
	local color = isSuccess and 3066993 or 15158332

	local payload = {
		content = getPingMention(),
		embeds = {
			{
				title = isSuccess and "📋 MACRO HOÀN THÀNH" or "⚠️ MACRO DỪNG LẠI",
				color = color,
				fields = {
					{
						name = "👤 Người chơi",
						value = string.format("`%s`", playerName),
						inline = true,
					},
					{
						name = "📁 Macro",
						value = string.format("`%s`", macroName),
						inline = true,
					},
					{
						name = "🔢 Tổng số bước",
						value = string.format("`%d bước`", totalSteps),
						inline = true,
					},
					{
						name = "⚡ Trạng thái",
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
	if wasMatchActive and not data.IsMatchActive then
		-- Vừa kết thúc trận đấu
		local statsToSend = lastMatchStats or data
		if webhook.Enabled and webhook.NotifyMatchEnd and webhook.Url ~= "" then
			task.spawn(function()
				task.wait(1.0)
				webhook.SendMatchEnd(statsToSend)
			end)
		end
	end

	wasMatchActive = data.IsMatchActive
	lastMatchStats = data
end

local unsubscribeStats = gameStats.Subscribe(onGameStatsUpdate)
lifecycle.Register(unsubscribeStats)

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
