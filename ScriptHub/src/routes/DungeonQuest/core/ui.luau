-- Tiện ích UI dùng chung cho các tab DungeonQuest (Maclib).

--// Table
local ui = {}

-- Fix: Maclib Slider Load chỉ cập nhật UI (SetValue ignorecallback=true),
-- nên patch UpdateValue để sau khi load vẫn gọi lại Callback => backend đồng bộ.
function ui.PatchSliderLoadCallback(sliderElement)
	if not sliderElement or type(sliderElement.UpdateValue) ~= "function" then return sliderElement end
	local originalUpdateValue = sliderElement.UpdateValue
	sliderElement.UpdateValue = function(self, Value)
		originalUpdateValue(self, Value)
		local settings = self.Settings
		if settings and settings.Callback then
			task.spawn(function()
				pcall(settings.Callback, tonumber(Value))
			end)
		end
	end
	return sliderElement
end

return ui
