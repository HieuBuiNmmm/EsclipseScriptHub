-- Script tự động theo dõi và log danh sách Difficulty (Voting.Maps) khi người chơi chọn Map.

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player and player:WaitForChild("PlayerGui", 10)

if not playerGui then
	return warn("[LogDiff] Không tìm thấy PlayerGui!")
end

local gameGui = playerGui:WaitForChild("GameGui", 10)
local voting = gameGui and gameGui:WaitForChild("Voting", 10)

if not voting then
	return warn("[LogDiff] Không tìm thấy Voting trong PlayerGui.GameGui!")
end

local mapsFolder = voting:WaitForChild("Maps", 10)
local universesFolder = voting:FindFirstChild("Universes")

if not mapsFolder then
	return warn("[LogDiff] Không tìm thấy thư mục/frame Maps trong Voting!")
end

print("[LogDiff] Đang lắng nghe... Khi bạn click chọn một Map bất kỳ, danh sách Difficulty sẽ tự động in ra!")

local function logVisibleDifficulties(triggerSource: string?)
	local visibleDiffs = {}
	local details = {}

	for _, child in ipairs(mapsFolder:GetChildren()) do
		if child:IsA("ImageButton") or child:IsA("GuiButton") then
			if child.Visible then
				local name = child.Name
				local labelText = ""

				-- Quét tìm TextLabel nếu có mô tả thêm (ví dụ: Easy, Hard, Modifiers...)
				for _, descendant in ipairs(child:GetDescendants()) do
					if descendant:IsA("TextLabel") and descendant.Visible and #descendant.Text > 0 then
						labelText = labelText .. " | " .. descendant.Name .. ": " .. descendant.Text
					end
				end

				table.insert(visibleDiffs, name)
				table.insert(details, string.format("  • Name: %q%s", name, labelText))
			end
		end
	end

	if #visibleDiffs > 0 then
		print("================ [ DIFFICULTIES LOG ] ================")
		if triggerSource then
			print("Kích hoạt bởi: " .. triggerSource)
		end
		print("Tổng số Difficulty Visible: " .. tostring(#visibleDiffs))
		for _, line in ipairs(details) do
			print(line)
		end

		local tableStr = "{\n"
		for _, name in ipairs(visibleDiffs) do
			tableStr ..= string.format('\t%q,\n', name)
		end
		tableStr ..= "}"
		print("Bảng Luau:\n" .. tableStr)

		if setclipboard then
			pcall(setclipboard, tableStr)
			print("[LogDiff] Đã tự động copy bảng Difficulty vào Clipboard!")
		end
		print("======================================================")
	end
end

-- 1. Lắng nghe khi bạn bấm vào bất kỳ Map nào trong Universes
if universesFolder then
	for _, mapBtn in ipairs(universesFolder:GetChildren()) do
		if mapBtn:IsA("GuiButton") then
			mapBtn.MouseButton1Click:Connect(function()
				task.wait(0.3) -- Chờ game bật Visible các nút difficulty
				logVisibleDifficulties("Click Map: " .. mapBtn.Name)
			end)
		end
	end
end

-- 2. Lắng nghe trực tiếp sự kiện thay đổi Visible của từng nút trong Maps
for _, diffBtn in ipairs(mapsFolder:GetChildren()) do
	if diffBtn:IsA("GuiObject") then
		diffBtn:GetPropertyChangedSignal("Visible"):Connect(function()
			if diffBtn.Visible then
				task.wait(0.1)
				logVisibleDifficulties("Visible thay đổi: " .. diffBtn.Name)
			end
		end)
	end
end

-- 3. Quét kiểm tra ngay nếu hiện tại đã có nút nào đang visible sẵn
logVisibleDifficulties("Kiểm tra ban đầu")
