-- Script phân tích chi tiết cấu trúc của PlayerGui.GameGui.Info
-- Tự động in cây phân cấp (tree view), text, thuộc tính và lắng nghe thay đổi thời gian thực (15s)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local playerGui = player:WaitForChild("PlayerGui", 5)
if not playerGui then
	return warn("[Inspect] Không tìm thấy PlayerGui!")
end

local gameGui = playerGui:WaitForChild("GameGui", 5)
if not gameGui then
	return warn("[Inspect] Không tìm thấy GameGui trong PlayerGui!")
end

local info = gameGui:FindFirstChild("Info")
if not info then
	-- Thử tìm đệ quy nếu Info nằm bên trong Frame khác
	info = gameGui:FindFirstChild("Info", true)
end

if not info then
	return warn("[Inspect] Không tìm thấy đối tượng 'Info' trong GameGui!")
end

print("==================== [ CHI TIẾT CẤU TRÚC: GameGui.Info ] ====================")
print(string.format("Path: %s", info:GetFullName()))
print(string.format("Class: %s | Visible: %s", info.ClassName, tostring((info :: any).Visible)))

-- In attributes nếu có
local rootAttrs = info:GetAttributes()
if next(rootAttrs) then
	print("Attributes của Info:")
	for k, v in pairs(rootAttrs) do
		print(string.format("  • [Attr] %s = %s", k, tostring(v)))
	end
end

print("\n---------------- [ CÂY ĐỐI TƯỢNG CON (TREE VIEW) ] ----------------")

local textMonitors: { TextLabel } = {}

local function printHierarchy(parent: Instance, indent: string)
	local children = parent:GetChildren()
	for i, child in ipairs(children) do
		local isLast = (i == #children)
		local branch = isLast and "└── " or "├── "
		local nextIndent = indent .. (isLast and "    " or "│   ")

		local extraInfo = ""
		if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
			extraInfo = string.format(" | Text: %q | Visible: %s", (child :: any).Text, tostring((child :: any).Visible))
			if child:IsA("TextLabel") then
				table.insert(textMonitors, child :: TextLabel)
			end
		elseif child:IsA("ImageLabel") or child:IsA("ImageButton") then
			extraInfo = string.format(" | Image: %s | Visible: %s", tostring((child :: any).Image), tostring((child :: any).Visible))
		elseif child:IsA("ValueBase") then
			extraInfo = string.format(" | Value = %s", tostring((child :: any).Value))
		elseif child:IsA("GuiObject") then
			extraInfo = string.format(" | Visible: %s", tostring((child :: any).Visible))
		end

		-- Attributes
		local attrs = child:GetAttributes()
		local attrStr = ""
		if next(attrs) then
			local parts = {}
			for k, v in pairs(attrs) do
				table.insert(parts, string.format("%s=%s", k, tostring(v)))
			end
			attrStr = string.format(" | Attrs: {%s}", table.concat(parts, ", "))
		end

		print(string.format("%s%s[%s] %s%s%s", indent, branch, child.ClassName, child.Name, extraInfo, attrStr))

		-- Đệ quy kiểm tra các con cháu bên trong
		printHierarchy(child, nextIndent)
	end
end

printHierarchy(info, "")

print("\n---------------- [ THEO DÕI THAY ĐỔI TEXT (15 GIÂY) ] ----------------")
print("-> Đang lắng nghe xem nhãn nào nhảy số (Tiền thay đổi, Timer đếm ngược, Wave tăng)...")

local connections = {}
for _, label in ipairs(textMonitors) do
	local path = label:GetFullName():gsub("^.*GameGui%.Info%.", "")
	local conn = label:GetPropertyChangedSignal("Text"):Connect(function()
		print(string.format("  [CẬP NHẬT] %s -> %q", path, label.Text))
	end)
	table.insert(connections, conn)
end

task.delay(15, function()
	for _, c in ipairs(connections) do
		c:Disconnect()
	end
	table.clear(connections)
	print("---------------- [ KẾT THÚC 15S THEO DÕI THAY ĐỔI ] ----------------")
end)

print("============================================================================")
