-- Coordinator (DungeonQuest): Điều phối loại trừ lẫn nhau giữa các hệ thống
-- cùng điều khiển nhân vật (SmartDodge vs AutoFarm). Module lá — không require ai
-- để tránh cycle import bị darklua (bundler) phát hiện.

local coordinator = {}
local features = {}

--// Đăng ký 1 hệ thống có thể bị tắt độc quyền. setEnabled(false) được gọi khi
--// một hệ thống khác bật lên. isEnabled() trả về trạng thái đang chạy.
function coordinator.Register(name, setEnabled, isEnabled)
	if type(name) ~= "string" or type(setEnabled) ~= "function" or type(isEnabled) ~= "function" then return end
	features[name] = {
		setEnabled = setEnabled,
		isEnabled = isEnabled,
	}
end

--// Bật độc quyền 1 hệ thống: tự động TẮT toàn bộ hệ thống khác đang chạy trước đó.
function coordinator.EnableExclusive(name)
	for otherName, feat in pairs(features) do
		if otherName ~= name and feat.isEnabled() then
			pcall(feat.setEnabled, false)
		end
	end
end

function coordinator.IsEnabled(name)
	local feat = features[name]
	return feat ~= nil and feat.isEnabled()
end

return coordinator