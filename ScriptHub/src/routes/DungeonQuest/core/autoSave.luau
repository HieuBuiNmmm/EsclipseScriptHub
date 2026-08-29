-- Auto-save config cho DungeonQuest: tự động lưu mỗi khi control thay đổi,
-- không cần bấm "Overwrite" thủ công. Chỉ lưu khi có config active đang chọn.

--// Imports
local macLib = require("@packages/Maclib")
local notifier = require("@routes/DungeonQuest/core/notifier")

--// Table
local autoSave = {}

--// Variables
local activeConfig = nil
local saveQueued = false

-- Cập nhật tên config đang active (gọi từ Config tab khi chọn/tạo/tải config)
function autoSave.SetActive(name)
	activeConfig = (typeof(name) == "string" and #name > 0) and name or nil
end

function autoSave.GetActive()
	return activeConfig
end

-- Lưu ngay lập tức (gọi trực tiếp)
function autoSave.SaveNow()
	if not activeConfig then return end

	local success, err = macLib:SaveConfig(activeConfig)
	if not success and err and err ~= "Please select a config file." then
		notifier.Notify("AutoSave", "Không lưu được config: " .. tostring(err), 3)
	end
end

-- Lưu có debounce: dồn nhiều thay đổi (vd kéo slider) thành 1 lần lưu
function autoSave.Save()
	if not activeConfig then return end
	if saveQueued then return end
	saveQueued = true

	task.delay(0.5, function()
		saveQueued = false
		if autoSave.GetActive() then
			autoSave.SaveNow()
		end
	end)
end

-- Bọc một callback control để tự lưu sau khi callback chạy
function autoSave.Wrap(callback)
	if type(callback) ~= "function" then return callback end
	return function(...)
		callback(...)
		autoSave.Save()
	end
end

return autoSave
