-- Script log danh sách Map (ImageButton visible) trong PlayerGui.GameGui.Voting.Universes

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player and player:WaitForChild("PlayerGui", 10)

if not playerGui then
	return warn("[LogMaps] Không tìm thấy PlayerGui!")
end

local gameGui = playerGui:WaitForChild("GameGui", 10)
local voting = gameGui and gameGui:WaitForChild("Voting", 10)
local universes = voting and voting:WaitForChild("Universes", 10)

if not universes then
	return warn("[LogMaps] Không tìm thấy Universes trong PlayerGui.GameGui.Voting!")
end

local visibleMaps = {}
local details = {}

for _, child in ipairs(universes:GetChildren()) do
	if child:IsA("ImageButton") or child:IsA("GuiButton") then
		if child.Visible then
			local displayName = child.Name
			-- Quét TextLabel con nếu có hiển thị tên map
			local label = child:FindFirstChildWhichIsA("TextLabel", true)
			if label and label.Text and #label.Text > 0 then
				displayName = displayName .. " (Label: " .. label.Text .. ")"
			end

			table.insert(visibleMaps, child.Name)
			table.insert(details, string.format("- Name: %q | Chi tiết: %s", child.Name, displayName))
		end
	end
end

print("---------------- [ MAPS LOG ] ----------------")
print("Tổng số Map Visible: " .. tostring(#visibleMaps))
for _, line in ipairs(details) do
	print(line)
end

-- Xuất sẵn dạng bảng Luau
local tableStr = "{\n"
for _, name in ipairs(visibleMaps) do
	tableStr ..= string.format('\t%q,\n', name)
end
tableStr ..= "}"
print("Dạng Table Luau:\n" .. tableStr)

if setclipboard then
	pcall(setclipboard, tableStr)
	print("[LogMaps] Đã copy danh sách Table vào Clipboard!")
end
print("----------------------------------------------")
