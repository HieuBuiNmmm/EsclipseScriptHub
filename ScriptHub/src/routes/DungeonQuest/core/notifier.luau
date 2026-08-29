-- Hàm thông báo an toàn dùng chung cho DungeonQuest.
-- Nhận Window tham chiếu qua SetWindow (vì Window được tạo sau khi require module).

--// Variables
local window

--// Table
local notifier = {}

--// Methods
function notifier:SetWindow(newWindow)
	window = newWindow
end

function notifier.Notify(title, desc, lifetime)
	lifetime = lifetime or 3

	if window then
		local ok = pcall(function()
			window:Notify({ Title = title, Description = desc, Lifetime = lifetime })
		end)
		if ok then return end
	end

	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = title,
			Text = desc,
			Duration = lifetime,
		})
	end)
end

return notifier
