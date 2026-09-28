-- Script khảo sát và định vị toàn bộ thông số trận đấu (Money, Wave, Time, Base HP, v.v.)
-- Chạy script này khi đang ở In-Game (trong trận đấu)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

print("================ [ BẮT ĐẦU KHẢO SÁT GAME STATS ] ================")

-- 1. KIỂM TRA LEADERSTATS & ATTRIBUTES CỦA LOCALPLAYER
print("\n----- [ 1. LOCALPLAYER STATS & ATTRIBUTES ] -----")
local leaderstats = player:FindFirstChild("leaderstats")
if leaderstats then
	print("Found player.leaderstats:")
	for _, stat in ipairs(leaderstats:GetChildren()) do
		print(string.format("  • leaderstats.%s = %s (%s)", stat.Name, tostring((stat :: any).Value), stat.ClassName))
	end
else
	print("player.leaderstats: Không có")
end

local playerAttrs = player:GetAttributes()
if next(playerAttrs) then
	print("player Attributes:")
	for k, v in pairs(playerAttrs) do
		print(string.format("  • [Attr] player:%s = %s (%s)", k, tostring(v), typeof(v)))
	end
else
	print("player Attributes: Không có")
end

-- Kiểm tra các Value trực tiếp trong player
for _, child in ipairs(player:GetChildren()) do
	if child:IsA("ValueBase") then
		print(string.format("  • player.%s = %s (%s)", child.Name, tostring((child :: any).Value), child.ClassName))
	end
end

-- 2. KIỂM TRA REPLICATEDSTORAGE ATTRIBUTES & VALUES
print("\n----- [ 2. REPLICATEDSTORAGE ATTRIBUTES & GAME STATE ] -----")
local repAttrs = ReplicatedStorage:GetAttributes()
if next(repAttrs) then
	print("ReplicatedStorage Attributes:")
	for k, v in pairs(repAttrs) do
		print(string.format("  • [Attr] ReplicatedStorage:%s = %s (%s)", k, tostring(v), typeof(v)))
	end
else
	print("ReplicatedStorage Attributes: Không có")
end

for _, name in ipairs({ "State", "GameState", "Match", "GameData", "Stats", "Values", "Wave", "Game" }) do
	local f = ReplicatedStorage:FindFirstChild(name)
	if f then
		print(string.format("Tìm thấy ReplicatedStorage.%s (%s):", name, f.ClassName))
		for _, child in ipairs(f:GetChildren()) do
			if child:IsA("ValueBase") then
				print(string.format("    - %s = %s (%s)", child.Name, tostring((child :: any).Value), child.ClassName))
			else
				print(string.format("    - %s (%s)", child.Name, child.ClassName))
			end
		end
		for k, v in pairs(f:GetAttributes()) do
			print(string.format("    - [Attr] %s = %s", k, tostring(v)))
		end
	end
end

-- 3. KIỂM TRA WORKSPACE ATTRIBUTES & BASE HP
print("\n----- [ 3. WORKSPACE ATTRIBUTES & BASE HP ] -----")
local wsAttrs = workspace:GetAttributes()
if next(wsAttrs) then
	print("workspace Attributes:")
	for k, v in pairs(wsAttrs) do
		print(string.format("  • [Attr] workspace:%s = %s (%s)", k, tostring(v), typeof(v)))
	end
else
	print("workspace Attributes: Không có")
end

for _, child in ipairs(workspace:GetChildren()) do
	local nameLower = child.Name:lower()
	if nameLower:find("base") or nameLower:find("core") or nameLower:find("heart") or nameLower:find("nexus") then
		print(string.format("  • workspace.%s (%s)", child.Name, child.ClassName))
		for k, v in pairs(child:GetAttributes()) do
			print(string.format("      - [Attr] %s = %s", k, tostring(v)))
		end
		local hum = child:FindFirstChildOfClass("Humanoid")
		if hum then
			print(string.format("      - Humanoid Health: %d/%d", hum.Health, hum.MaxHealth))
		end
	end
end

-- 4. QUÉT GIAO DIỆN PLAYERGUI TÌM MONEY, WAVE, TIMER, HEALTH
print("\n----- [ 4. QUÉT TEXTLABEL TRONG PLAYERGUI ] -----")
local playerGui = player:FindFirstChild("PlayerGui")
if playerGui then
	local matches = {}
	for _, desc in ipairs(playerGui:GetDescendants()) do
		if desc:IsA("TextLabel") and desc.Visible then
			local text = desc.Text:gsub("%s+", " ")
			local textLower = text:lower()

			-- Tìm các TextLabel có dấu hiệu của:
			-- Tiền: có $, hoặc số lớn có dấu phẩy
			-- Wave: có chữ "wave", hoặc dạng "1/20", "W1"
			-- Time: có dấu ":", hoặc "s" đếm ngược
			-- HP: có "%", "hp", "health"
			local isMatch = false
			local tag = ""

			if text:find("%$") or textLower:find("cash") or textLower:find("money") then
				isMatch = true
				tag = "[TIỀN/CASH]"
			elseif textLower:find("wave") or text:match("^%d+/%d+$") or text:match("^%d+%s*/%s*%d+$") then
				isMatch = true
				tag = "[WAVE]"
			elseif text:match("%d+:%d+") or textLower:find("time") or text:match("^%d+s$") then
				isMatch = true
				tag = "[TIMER]"
			elseif textLower:find("hp") or textLower:find("health") or text:find("%%") then
				isMatch = true
				tag = "[BASE HP]"
			end

			if isMatch and #text < 50 then
				table.insert(matches, {
					Tag = tag,
					Path = desc:GetFullName():gsub("^PlayerGui%.", ""),
					Text = text,
				})
			end
		end
	end

	table.sort(matches, function(a, b) return a.Tag < b.Tag end)
	for _, m in ipairs(matches) do
		print(string.format("  %-12s | Text: %-20s | Path: %s", m.Tag, string.format("%q", m.Text), m.Path))
	end
else
	print("PlayerGui: Không tìm thấy")
end

-- 5. KIỂM TRA CÁC MODULE TRONG REPLICATEDSTORAGE LIÊN QUAN DATA
print("\n----- [ 5. CÁC MODULE DATA TRONG REPLICATEDSTORAGE ] -----")
local modulesFolder = ReplicatedStorage:FindFirstChild("Modules")
if modulesFolder then
	for _, mod in ipairs(modulesFolder:GetChildren()) do
		local nameLower = mod.Name:lower()
		if nameLower:find("data") or nameLower:find("game") or nameLower:find("state") 
			or nameLower:find("wave") or nameLower:find("money") or nameLower:find("player") then
			print(string.format("  • ReplicatedStorage.Modules.%s", mod.Name))
		end
	end
end

print("\n================ [ HOÀN TẤT KHẢO SÁT ] ================")
