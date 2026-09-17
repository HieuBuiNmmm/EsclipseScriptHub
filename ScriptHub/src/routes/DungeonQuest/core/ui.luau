-- Tiện ích UI dùng chung cho các tab DungeonQuest (Maclib).

--// Table
local ui = {}

-- Fix: Maclib Slider Load chỉ cập nhật UI (SetValue ignorecallback=true),
-- nên patch UpdateValue để sau khi load vẫn gọi lại Callback => backend đồng bộ.
function ui.PatchSliderLoadCallback(sliderElement)
	if not sliderElement or type(sliderElement.UpdateValue) ~= "function" then return sliderElement end
	local originalUpdateValue = sliderElement.UpdateValue
	sliderElement.UpdateValue = function(self, Value)
		local targetSelf = self
		local targetVal = Value
		if targetVal == nil and (type(targetSelf) == "number" or type(targetSelf) == "string") then
			targetVal = targetSelf
			targetSelf = sliderElement
		end

		pcall(originalUpdateValue, targetSelf, targetVal)
		local settings = targetSelf and targetSelf.Settings or sliderElement.Settings
		if settings and settings.Callback then
			pcall(settings.Callback, tonumber(targetVal))
		end
	end
	return sliderElement
end

-- Fix: Maclib Dropdown Load gọi UpdateSelection(đã lưu) và IM LẶNG BỎ QUA nếu tên
-- option không còn trong danh sách hiện tại -> config bị mất khi load lại (đặc biệt
-- với danh sách dungeon động). Patch UpdateSelection: tự chèn option còn thiếu
-- (insertMissing=true) hoặc fallback chuyển sang option hợp lệ đầu tiên để không bao
-- giờ rơi vào trạng thái selection rỗng.
function ui.PatchDropdownRestore(dropdownElement, insertMissing)
	if not dropdownElement or type(dropdownElement.UpdateSelection) ~= "function" then return dropdownElement end
	local originalUpdateSelection = dropdownElement.UpdateSelection
	dropdownElement.UpdateSelection = function(self, newSelection)
		if type(newSelection) == "string" and newSelection ~= "" and not self:IsOption(newSelection) then
			if insertMissing then
				pcall(function()
					self:InsertOptions({ newSelection })
				end)
			else
				local opts = self.Settings and self.Settings.Options
				if type(opts) == "table" and #opts > 0 then
					newSelection = opts[1]
				else
					local firstOption = next(self:GetOptions())
					if firstOption then newSelection = firstOption end
				end
			end
		end
		originalUpdateSelection(self, newSelection)
	end
	return dropdownElement
end

return ui
