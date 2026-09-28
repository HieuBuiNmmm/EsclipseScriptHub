-- Wrapper gửi thông báo an toàn (qua Maclib Window hoặc StarterGui fallback).

local window = nil
local notifier = {}

function notifier:SetWindow(newWindow)
	window = newWindow
end

function notifier.Notify(title: string, desc: string, lifetime: number?)
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
