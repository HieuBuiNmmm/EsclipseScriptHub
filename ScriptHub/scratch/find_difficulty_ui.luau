-- Script tự động quét và bắt trọn giao diện Difficulty (cả quét tĩnh có sẵn & bắt sự kiện xuất hiện tức thì).

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player and player:WaitForChild("PlayerGui", 10)

if not playerGui then
	return warn("[DiffFinder] Không tìm thấy PlayerGui!")
end

local dumpLines = {}
local function log(str)
	print(str)
	table.insert(dumpLines, str)
end

log("================== [ TÌM KIẾM GIAO DIỆN DIFFICULTY ] ==================")

-- 1. QUÉT TĨNH: Hầu hết các game Roblox đều tạo sẵn Frame Difficulty trong PlayerGui từ trước (chỉ để Visible = false)
log("--> Đang quét toàn bộ PlayerGui để tìm các Frame/Button liên quan đến Difficulty...")

local keywords = { "diff", "easy", "normal", "hard", "nightmare", "insane", "vote", "mode" }
local foundStatic = false

for _, obj in ipairs(playerGui:GetDescendants()) do
	local nameLower = string.lower(obj.Name)
	local isMatch = false

	for _, kw in ipairs(keywords) do
		if string.find(nameLower, kw) then
			isMatch = true
			break
		end
	end

	-- Kiểm tra nếu là TextLabel/TextButton có nội dung chứa Easy/Hard
	if not isMatch and (obj:IsA("TextLabel") or obj:IsA("TextButton")) and type(obj.Text) == "string" then
		local textLower = string.lower(obj.Text)
		if string.find(textLower, "easy") or string.find(textLower, "normal") or string.find(textLower, "hard") then
			isMatch = true
		end
	end

	if isMatch and (obj:IsA("GuiObject") or obj:IsA("ScreenGui")) then
		foundStatic = true
		local path = obj:GetFullName()
		log(string.format("[TÌM THẤY] Class: %s | Name: %q | Visible: %s\n   Path: %s", obj.ClassName, obj.Name, tostring(obj.Visible), path))

		-- In các con trực tiếp nếu là Frame/Folder
		if #obj:GetChildren() > 0 then
			log("   Children:")
			for _, child in ipairs(obj:GetChildren()) do
				if child:IsA("GuiObject") then
					log(string.format("     - %s (%q) [Visible: %s]", child.ClassName, child.Name, tostring(child.Visible)))
				end
			end
		end
		log("----------------------------------------------------------------")
	end
end

if not foundStatic then
	log("--> Chưa tìm thấy frame tĩnh khớp từ khóa.")
end

-- 2. BẮT ĐỘNG: Lắng nghe sự kiện Visible/Added theo thời gian thực (dù hiện trong 1s cũng bắt được)
log("\n--> Đang bật Listener thời gian thực... Bạn hãy thao tác vào phòng/chọn map.")
log("--> Bất kỳ UI nào vừa bật Visible hoặc vừa được sinh ra sẽ tự động ghi lại!")

local captured = {}

local function inspectAndDump(guiObj: GuiObject, reason: string)
	if captured[guiObj] then return end
	-- Chỉ bắt các Frame/Panel/Button có kích thước thực tế
	if not guiObj:IsA("GuiObject") then return end

	local nameLower = string.lower(guiObj.Name)
	-- Bỏ qua các frame phụ hoặc background không quan trọng
	if nameLower == "uipadding" or nameLower == "uistroke" or nameLower == "uicorner" then return end

	captured[guiObj] = true
	local fullPath = guiObj:GetFullName()
	local info = string.format("[BẮT ĐƯỢC UI] (%s) %s\nPath: %s\nSize: %s | Pos: %s", reason, guiObj.Name, fullPath, tostring(guiObj.Size), tostring(guiObj.Position))
	log(info)

	-- In danh sách button con bên trong
	local buttons = {}
	for _, desc in ipairs(guiObj:GetDescendants()) do
		if desc:IsA("GuiButton") then
			table.insert(buttons, string.format("   + Button: %q (Class: %s, Visible: %s)", desc.Name, desc.ClassName, tostring(desc.Visible)))
		end
	end

	if #buttons > 0 then
		log("   Các nút bấm bên trong:")
		for _, b in ipairs(buttons) do log(b) end
	end
	log("----------------------------------------------------------------")

	-- Tự động lưu ra file ổ đĩa phòng trường hợp console trôi nhanh
	if writefile then
		pcall(writefile, "slop_difficulty_dump.txt", table.concat(dumpLines, "\n"))
	end
end

-- Lắng nghe Visible của mọi GuiObject trong PlayerGui.GameGui (hoặc PlayerGui)
local gameGui = playerGui:FindFirstChild("GameGui") or playerGui
for _, desc in ipairs(gameGui:GetDescendants()) do
	if desc:IsA("GuiObject") then
		desc:GetPropertyChangedSignal("Visible"):Connect(function()
			if desc.Visible then
				inspectAndDump(desc, "Visible = true")
			end
		end)
	end
end

gameGui.DescendantAdded:Connect(function(desc)
	if desc:IsA("GuiObject") then
		task.wait(0.05)
		if desc.Visible then
			inspectAndDump(desc, "Vừa thêm mới")
		end
	end
end)

log("[DiffFinder] Đã sẵn sàng! Dữ liệu cũng sẽ tự động lưu vào file 'slop_difficulty_dump.txt'.")
log("========================================================================")
