-- Script hỗ trợ khảo sát Remote và hành động Tháp (Tower Placement, Upgrade, Sell, Skip Wave)
-- Chạy script này In-Game và thử thực hiện:
-- 1. Đặt 1 trụ (Place)
-- 2. Nâng cấp 1 trụ (Upgrade)
-- 3. Bán 1 trụ (Sell)
-- 4. Bấm Skip Wave (nếu có)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

print("================ [ BẮT ĐẦU QUÉT HỆ THỐNG TOWER ] ================")

-- 1. Liệt kê toàn bộ Remote trong ReplicatedStorage
print("----- [ DANH SÁCH REMOTES TRONG REPLICATEDSTORAGE ] -----")
local eventsFolder = ReplicatedStorage:FindFirstChild("Events")
if eventsFolder then
	print("Thư mục ReplicatedStorage.Events có:")
	for _, child in ipairs(eventsFolder:GetChildren()) do
		if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") then
			print(string.format("  • [%s] %s", child.ClassName, child.Name))
		end
	end
end

for _, child in ipairs(ReplicatedStorage:GetDescendants()) do
	if (child:IsA("RemoteEvent") or child:IsA("RemoteFunction")) and child.Parent ~= eventsFolder then
		print(string.format("  • [%s] %s (Path: %s)", child.ClassName, child.Name, child:GetFullName()))
	end
end

-- 2. Kiểm tra thư mục chứa trụ trong Workspace
print("----- [ DANH SÁCH FOLDER TRONG WORKSPACE LIÊN QUAN TOWER ] -----")
for _, child in ipairs(workspace:GetChildren()) do
	if child:IsA("Folder") or child:IsA("Model") then
		local nameLower = child.Name:lower()
		if nameLower:find("tower") or nameLower:find("unit") or nameLower:find("placed") or nameLower:find("troop") then
			print(string.format("  • [Tìm thấy]: workspace.%s (%d children)", child.Name, #child:GetChildren()))
		end
	end
end

-- 3. Khởi tạo Hook Remote Spy đơn giản để bắt các lệnh gọi Remote của Client
print("----- [ ĐANG LẮNG NGHE CÁC HOẠT ĐỘNG: PLACE / UPGRADE / SELL / SKIP ] -----")
print("-> Hãy thử: Đặt trụ, Nâng cấp trụ, Bán trụ hoặc Skip Wave trong game!")

local function serialize(val, depth)
	depth = depth or 0
	if depth > 2 then return tostring(val) end
	if typeof(val) == "Vector3" then
		return string.format("Vector3.new(%.2f, %.2f, %.2f)", val.X, val.Y, val.Z)
	elseif typeof(val) == "CFrame" then
		local p = val.Position
		return string.format("CFrame.new(%.2f, %.2f, %.2f)", p.X, p.Y, p.Z)
	elseif typeof(val) == "Instance" then
		return string.format("%s (%s)", val:GetFullName(), val.ClassName)
	elseif type(val) == "table" then
		local parts = {}
		for k, v in pairs(val) do
			table.insert(parts, string.format("[%s] = %s", tostring(k), serialize(v, depth + 1)))
		end
		return "{" .. table.concat(parts, ", ") .. "}"
	else
		return tostring(val)
	end
end

if hookmetamethod then
	local oldNamecall
	oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
		local method = getnamecallmethod()
		if method == "FireServer" or method == "InvokeServer" then
			local name = self.Name
			local nameLower = name:lower()
			-- Lọc các remote liên quan đến Tower / Placement / Wave / Game
			if nameLower:find("tower") or nameLower:find("place") or nameLower:find("upgrade") or nameLower:find("sell") 
				or nameLower:find("skip") or nameLower:find("wave") or nameLower:find("vote") or nameLower:find("game") 
				or self.Parent == eventsFolder then
				
				local args = { ... }
				local argStrings = {}
				for i, arg in ipairs(args) do
					table.insert(argStrings, string.format("arg%d = %s", i, serialize(arg)))
				end
				print(string.format("\n[REMOTE SPY] %s:%s(\n   %s\n)", self:GetFullName(), method, table.concat(argStrings, ",\n   ")))
			end
		end
		return oldNamecall(self, ...)
	end)
	print("[Remote Spy] Đã gắn hook thành công!")
else
	warn("[Remote Spy] Executor không hỗ trợ hookmetamethod, vui lòng kiểm tra danh sách Remote ở trên.")
end

print("=================================================================")
