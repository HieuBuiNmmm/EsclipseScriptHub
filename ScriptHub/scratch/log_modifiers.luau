-- Script quét và log toàn bộ TextLabel trong PlayerGui.GameGui.ModifierVoting

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player and player:WaitForChild("PlayerGui", 10)

if not playerGui then
	return warn("[LogModifiers] Không tìm thấy PlayerGui!")
end

local gameGui = playerGui:WaitForChild("GameGui", 10)
local modifierVoting = gameGui and gameGui:WaitForChild("ModifierVoting", 10)

if not modifierVoting then
	return warn("[LogModifiers] Không tìm thấy ModifierVoting trong PlayerGui.GameGui!")
end

local function scanTextLabels(source: string?)
	local labels = {}
	local count = 0
	local logLines = {}

	for _, desc in ipairs(modifierVoting:GetDescendants()) do
		if desc:IsA("TextLabel") then
			count += 1
			-- Đường dẫn tương đối từ ModifierVoting
			local full = desc:GetFullName()
			local relPath = string.gsub(full, "^.-GameGui%.ModifierVoting%.?", "")

			table.insert(labels, {
				Name = desc.Name,
				Text = desc.Text,
				Visible = desc.Visible,
				Path = relPath,
			})
			table.insert(logLines, string.format("[%d] Name: %q | Text: %q | Visible: %s\n     Path: %s", 
				count, desc.Name, desc.Text, tostring(desc.Visible), relPath
			))
		end
	end

	print("================ [ MODIFIER VOTING TEXTLABELS ] ================")
	if source then
		print("Kích hoạt bởi: " .. source)
	end
	print("Tổng số TextLabel tìm thấy: " .. tostring(count))
	for _, line in ipairs(logLines) do
		print(line)
	end
	print("================================================================")

	-- Tự động copy ra Clipboard nếu có executor hỗ trợ setclipboard
	if setclipboard and #logLines > 0 then
		local copyText = table.concat(logLines, "\n")
		pcall(setclipboard, copyText)
		print("[LogModifiers] Đã copy toàn bộ danh sách TextLabel vào Clipboard!")
	end
end

-- 1. Quét kiểm tra ngay lập tức
scanTextLabels("Quét ban đầu")

-- 2. Tự động quét lại khi ModifierVoting chuyển sang Visible = true
if modifierVoting:IsA("GuiObject") then
	modifierVoting:GetPropertyChangedSignal("Visible"):Connect(function()
		if modifierVoting.Visible then
			task.wait(0.3) -- Chờ game nạp nội dung text
			scanTextLabels("ModifierVoting vừa mở (Visible = true)")
		end
	end)
end

-- 3. Lắng nghe nếu có TextLabel con thay đổi Text
for _, desc in ipairs(modifierVoting:GetDescendants()) do
	if desc:IsA("TextLabel") then
		desc:GetPropertyChangedSignal("Text"):Connect(function()
			task.wait(0.1)
			scanTextLabels("Nội dung Text thay đổi ở: " .. desc.Name)
		end)
	end
end

-- 4. Tự động bắt khi có phần tử mới được sinh ra trong ModifierVoting
modifierVoting.DescendantAdded:Connect(function(desc)
	if desc:IsA("TextLabel") then
		task.wait(0.2)
		scanTextLabels("TextLabel mới xuất hiện: " .. desc.Name)
	end
end)
