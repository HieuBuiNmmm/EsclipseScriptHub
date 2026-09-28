-- Script khảo sát dấu hiệu KẾT THÚC TRẬN (Game Over / Defeat / Victory / Rewards)
-- Chạy script này và để nguyên cho đến khi kết thúc trận (Thắng hoặc Thua)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

print("================ [ BẮT ĐẦU THEO DÕI DẤU HIỆU KẾT THÚC TRẬN ] ================")
print("-> Đang theo dõi PlayerGui và Workspace khi trận đấu kết thúc (Win / Defeat)...")

local playerGui = player:WaitForChild("PlayerGui", 5)

-- 1. Lắng nghe xem có ScreenGui hoặc Frame mới nào xuất hiện trong PlayerGui không
if playerGui then
	playerGui.DescendantAdded:Connect(function(desc)
		local nameLower = desc.Name:lower()
		if nameLower:find("win") or nameLower:find("lose") or nameLower:find("defeat") 
			or nameLower:find("victory") or nameLower:find("end") or nameLower:find("over") 
			or nameLower:find("reward") or nameLower:find("result") then
			
			print(string.format("\n[TÌM THẤY UI MỚI KHI KẾT THÚC]: %s (%s)", desc:GetFullName(), desc.ClassName))
			if desc:IsA("TextLabel") or desc:IsA("TextButton") then
				print("   • Text:", (desc :: any).Text)
			end
		end
	end)
end

-- 2. Kiểm tra xem GameGui có Frame nào chuyển Visible = true không
local gameGui = playerGui and playerGui:FindFirstChild("GameGui")
if gameGui then
	for _, child in ipairs(gameGui:GetDescendants()) do
		if child:IsA("GuiObject") then
			local nameLower = child.Name:lower()
			if nameLower:find("win") or nameLower:find("lose") or nameLower:find("defeat") 
				or nameLower:find("victory") or nameLower:find("end") or nameLower:find("over") 
				or nameLower:find("reward") or nameLower:find("result") then
				
				child:GetPropertyChangedSignal("Visible"):Connect(function()
					print(string.format("\n[FRAME THAY ĐỔI VISIBLE]: %s | Visible = %s", child:GetFullName(), tostring(child.Visible)))
				end)
			end
		end
	end
end

-- 3. Theo dõi Remote liên quan GameEnd
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local events = ReplicatedStorage:FindFirstChild("Events")
if events then
	for _, remote in ipairs(events:GetChildren()) do
		if remote:IsA("RemoteEvent") then
			local nameLower = remote.Name:lower()
			if nameLower:find("end") or nameLower:find("over") or nameLower:find("win") or nameLower:find("defeat") or nameLower:find("reward") then
				remote.OnClientEvent:Connect(function(...)
					print(string.format("\n[SERVER GỬI REMOTE KẾT THÚC]: Events.%s fired! Args: %s", remote.Name, tostring(...)))
				end)
			end
		end
	end
end

print("=============================================================================")
