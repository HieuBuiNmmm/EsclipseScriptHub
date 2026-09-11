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
local suspended = false

function autoSave.Suspend()
	suspended = true
	saveQueued = false
end

function autoSave.Resume()
	suspended = false
end

function autoSave.IsSuspended()
	return suspended or (macLib.LoadingConfig == true)
end

-- Cập nhật tên config đang active (gọi từ Config tab khi chọn/tạo/tải config)
function autoSave.SetActive(name)
	activeConfig = (typeof(name) == "string" and #name > 0) and name or nil
end

function autoSave.GetActive()
	return activeConfig
end

-- Fallback: nếu chưa có config active (không bấm chọn trong tab Configs) nhưng có
-- config autoload trong autoload.txt thì dùng luôn tên đó -> đảm bảo mọi slider/
-- toggle đều được lưu mà không phụ thuộc thứ tự khởi tạo tab.
local function resolveActiveConfig()
	if activeConfig then return activeConfig end

	local folder = macLib.Folder
	local path = folder .. "/settings/autoload.txt"
	if not (isfile and readfile) then return nil end
	if isfile(path) then
		local ok, name = pcall(readfile, path)
		if ok and typeof(name) == "string" and #name > 0 then
			activeConfig = name
			return activeConfig
		end
	end
	return nil
end

-- Lưu ngay lập tức (gọi trực tiếp)
function autoSave.SaveNow()
	if autoSave.IsSuspended() then return end
	local name = resolveActiveConfig()
	if not name then return end

	local success, err = macLib:SaveConfig(name)
	if not success and err and err ~= "Please select a config file." then
		notifier.Notify("AutoSave", "Không lưu được config: " .. tostring(err), 3)
	end
end

-- Lưu có debounce: dồn nhiều thay đổi (vd kéo slider) thành 1 lần lưu
function autoSave.Save()
	if autoSave.IsSuspended() then return end
	if not resolveActiveConfig() then return end
	if saveQueued then return end
	saveQueued = true

	task.delay(0.5, function()
		saveQueued = false
		if not autoSave.IsSuspended() and autoSave.GetActive() then
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
