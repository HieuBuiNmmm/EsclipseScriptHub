-- Script dò tìm đường dẫn Text hiển thị thông báo chuyển Raid / Countdown
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Dọn dẹp script cũ nếu đang chạy
if _G.__RaidScannerConn then
	for _, conn in ipairs(_G.__RaidScannerConn) do
		pcall(function() conn:Disconnect() end)
	end
end
_G.__RaidScannerConn = {}

local function getFullPath(inst: Instance): string
	local parts = { inst.Name }
	local current = inst.Parent
	while current and current ~= game do
		table.insert(parts, 1, current.Name)
		current = current.Parent
	end
	return "game." .. table.concat(parts, ".")
end

local function checkText(label: TextLabel | TextButton | TextBox, trigger: string)
	local text = label.Text
	if not text or text == "" then return end
	local lower = text:lower()

	-- Bắt các từ khóa thông báo đếm ngược / Raid / Wave
	local isMatch = lower:find("raid")
		or lower:find("move")
		or lower:find("stage")
		or lower:find("start")
		or lower:find("%.%.%.")
		or (lower:find("wave") and not lower:find("wave:%s*%d+/%d+"))

	if isMatch then
		local path = getFullPath(label)
		local visible = false
		pcall(function()
			visible = (label.Visible == true) and (label.TextTransparency < 1)
		end)
		warn(string.format("[Raid Scanner - %s]\n• Path: %s\n• Text: %q\n• Visible: %s\n• Transparency: %s",
			trigger, path, text, tostring(visible), tostring(label.TextTransparency)))
	end
end

-- 1. Quét và hook toàn bộ TextLabel / TextButton hiện tại trong PlayerGui
print("[Raid Scanner] Đang quét ban đầu các UI trong PlayerGui...")
local count = 0
for _, desc in ipairs(playerGui:GetDescendants()) do
	if desc:IsA("TextLabel") or desc:IsA("TextButton") then
		count += 1
		checkText(desc, "QUÉT BAN ĐẦU")

		-- Hook lắng nghe khi nội dung Text thay đổi thời gian thực
		local conn = desc:GetPropertyChangedSignal("Text"):Connect(function()
			checkText(desc, "TEXT THAY ĐỔI")
		end)
		table.insert(_G.__RaidScannerConn, conn)

		local connVis = desc:GetPropertyChangedSignal("Visible"):Connect(function()
			if desc.Visible and desc.Text and desc.Text ~= "" then
				checkText(desc, "VISIBLE THAY ĐỔI")
			end
		end)
		table.insert(_G.__RaidScannerConn, connVis)
	end
end

-- 2. Hook lắng nghe khi có UI mới được sinh ra vào PlayerGui
local connAdd = playerGui.DescendantAdded:Connect(function(desc)
	if desc:IsA("TextLabel") or desc:IsA("TextButton") then
		task.wait(0.05)
		checkText(desc, "UI MỚI XUẤT HIỆN")
		local conn = desc:GetPropertyChangedSignal("Text"):Connect(function()
			checkText(desc, "TEXT THAY ĐỔI")
		end)
		table.insert(_G.__RaidScannerConn, conn)
	end
end)
table.insert(_G.__RaidScannerConn, connAdd)

print(string.format("✅ [Raid Scanner] Đã hook thành công %d UI elements!", count))
print("👉 Hãy quan sát màn hình hoặc mở Console F9 khi game chuẩn bị sang Wave 26 / chuyển Raid.")
print("👉 Để dừng scanner bất cứ lúc nào, chạy: _G.__StopRaidScanner()")

_G.__StopRaidScanner = function()
	for _, conn in ipairs(_G.__RaidScannerConn or {}) do
		pcall(function() conn:Disconnect() end)
	end
	_G.__RaidScannerConn = nil
	print("🛑 [Raid Scanner] Đã dừng toàn bộ scanner.")
end
