-- Script kiểm tra tại sao Timer bắt đầu đếm
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local playerGui = player:FindFirstChild("PlayerGui")
local gameGui = playerGui and playerGui:FindFirstChild("GameGui")
local info = gameGui and gameGui:FindFirstChild("Info", true)

print("===== [ DEBUG START TRIGGER ] =====")
if not info then
	print("GameGui.Info: KHÔNG TỒN TẠI (Đang ở Lobby hoặc chưa load)")
else
	print("Info.Visible:", info.Visible)
	local messageLabel = info:FindFirstChild("Message")
	if messageLabel then
		print(string.format("Message: Text = %q | Visible = %s | TextTransparency = %s", 
			messageLabel.Text, tostring(messageLabel.Visible), tostring(messageLabel.TextTransparency)))
		local msgLower = messageLabel.Text:lower()
		print("  -> msgLower:find('starting in'):", msgLower:find("starting in") ~= nil)
		print("  -> msgLower:find('game starting'):", msgLower:find("game starting") ~= nil)
	else
		print("Message: KHÔNG TÌM THẤY")
	end

	local stats = info:FindFirstChild("Stats")
	local waveLabel = stats and stats:FindFirstChild("Wave")
	if waveLabel then
		print(string.format("WaveLabel: Text = %q | Visible = %s", waveLabel.Text, tostring(waveLabel.Visible)))
		local curStr = waveLabel.Text:match("Wave:%s*(%d+)") or waveLabel.Text:match("(%d+)")
		print("  -> Parsed Wave number:", tonumber(curStr))
	end
end
print("====================================")
