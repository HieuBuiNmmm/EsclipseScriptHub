-- Script kiểm tra trực tiếp 2 Remote SpawnTower và SellTower
-- Chạy script này khi đang ở In-Game và đứng ở vị trí trống để đặt thử tháp.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local character = player.Character
local hrp = character and character:FindFirstChild("HumanoidRootPart") :: BasePart?

if not hrp then
	return warn("[Test] Không tìm thấy HumanoidRootPart của nhân vật!")
end

local functions = ReplicatedStorage:FindFirstChild("Functions")
if not functions then
	return warn("[Test] Không tìm thấy ReplicatedStorage.Functions!")
end

local spawnRemote = functions:FindFirstChild("SpawnTower") :: RemoteFunction?
local sellRemote = functions:FindFirstChild("SellTower") :: RemoteFunction?

if not spawnRemote or not sellRemote then
	return warn("[Test] Không tìm thấy SpawnTower hoặc SellTower trong Functions!")
end

print("==================== [ BẮT ĐẦU TEST SPAWN & SELL ] ====================")

-- 1. ĐẶT THỬ THÁP (Cách nhân vật 5 studs phía trước)
local spawnCFrame = hrp.CFrame * CFrame.new(0, -2.5, -5)
local towerName = "Freddy Trashcan"

print(string.format("1. Đang gọi SpawnTower cho: %q tại vị trí: (%.1f, %.1f, %.1f)...", 
	towerName, spawnCFrame.Position.X, spawnCFrame.Position.Y, spawnCFrame.Position.Z
))

local spawnResult = nil
local ok, err = pcall(function()
	spawnResult = spawnRemote:InvokeServer(
		towerName,
		spawnCFrame,
		false,
		"Freddy Trashcan Gold",
		{ "Gold" }
	)
end)

if not ok then
	return warn("[Test] SpawnTower thất bại:", tostring(err))
end

print("  -> Kết quả InvokeServer trả về:", tostring(spawnResult), typeof(spawnResult))

-- 2. TÌM MODEL THÁP VỪA XUẤT HIỆN
task.wait(0.5)

local spawnedTower: Model? = nil
if typeof(spawnResult) == "Instance" and spawnResult:IsA("Model") then
	spawnedTower = spawnResult
else
	-- Quét tìm model gần tọa độ vừa đặt
	local bestDist = 5.0
	local searchContainers = {
		workspace:FindFirstChild("Towers"),
		workspace:FindFirstChild("PlacedTowers"),
		workspace:FindFirstChild("Units"),
		workspace,
	}

	for _, container in ipairs(searchContainers) do
		if container then
			for _, child in ipairs(container:GetChildren()) do
				if child:IsA("Model") then
					local pos = child.PrimaryPart and child.PrimaryPart.Position or child:GetPivot().Position
					local dist = (pos - spawnCFrame.Position).Magnitude
					if dist < bestDist then
						bestDist = dist
						spawnedTower = child
					end
				end
			end
		end
		if spawnedTower then break end
	end
end

if not spawnedTower then
	print("  [Cảnh báo] Không tìm thấy Model tháp trong Workspace, nhưng Remote đã gọi thành công.")
else
	print(string.format("  -> Đã tìm thấy Model tháp: %s (Parent: %s)", spawnedTower:GetFullName(), spawnedTower.Parent.Name))
end

-- 3. CHỜ 3 GIÂY RỒI BÁN THÁP
print("\n2. Đang chờ 3 giây trước khi gọi SellTower...")
task.wait(3)

if spawnedTower then
	print(string.format("3. Đang gọi SellTower cho: %s...", spawnedTower.Name))
	local sellOk, sellErr = pcall(function()
		sellRemote:InvokeServer(spawnedTower)
	end)

	if sellOk then
		print("  -> SellTower THÀNH CÔNG! Tháp đã được bán.")
	else
		warn("  -> SellTower thất bại:", tostring(sellErr))
	end
else
	warn("  -> Không có đối tượng Model để bán!")
end

print("==================== [ HOÀN TẤT TEST SPAWN & SELL ] ====================")
