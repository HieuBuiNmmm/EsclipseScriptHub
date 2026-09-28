-- AutoSave: Tự động lưu cấu hình mỗi khi bất kỳ control (Toggle, Slider, Dropdown) thay đổi.
-- Áp dụng cơ chế debounce 0.5s để tối ưu ghi file và fallback tự động sang "Default" nếu chưa chọn profile.

local macLib = require("@packages/Maclib")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")

local autoSave = {}

local activeConfig: string? = nil
local saveQueued = false
local suspended = false

function autoSave.Suspend()
	suspended = true
	saveQueued = false
end

function autoSave.Resume()
	suspended = false
end

function autoSave.IsSuspended(): boolean
	return suspended or (macLib.LoadingConfig == true)
end

function autoSave.SetActive(name: string?)
	activeConfig = (typeof(name) == "string" and #name > 0) and string.gsub(name, "[\r\n%s]+", "") or nil
	if activeConfig and writefile then
		pcall(function()
			local folder = macLib.Folder
			if isfolder and not isfolder(folder) then makefolder(folder) end
			if isfolder and not isfolder(folder .. "/settings") then makefolder(folder .. "/settings") end
			writefile(folder .. "/settings/autoload.txt", activeConfig)
		end)
	end
end

function autoSave.GetActive(): string?
	return activeConfig
end

-- Tìm profile đang active, nếu chưa chọn thì lấy từ autoload.txt, nếu chưa có thì dùng "Default"
local function resolveActiveConfig(): string?
	if activeConfig then return activeConfig end

	local folder = macLib.Folder
	local path = folder .. "/settings/autoload.txt"
	if isfile and isfile(path) then
		local ok, name = pcall(readfile, path)
		if ok and typeof(name) == "string" then
			name = string.gsub(name, "[\r\n%s]+", "")
			if #name > 0 then
				activeConfig = name
				return activeConfig
			end
		end
	end

	-- Fallback mặc định là "Default" để đảm bảo mọi thay đổi luôn được lưu lại
	activeConfig = "Default"
	pcall(function()
		if writefile and makefolder and isfolder then
			if not isfolder(folder) then makefolder(folder) end
			if not isfolder(folder .. "/settings") then makefolder(folder .. "/settings") end
			if not isfile(path) then
				writefile(path, "Default")
			end
		end
	end)
	return activeConfig
end

-- Lưu ngay lập tức
function autoSave.SaveNow()
	if autoSave.IsSuspended() then return end
	local name = resolveActiveConfig()
	if not name then return end

	local success, err = macLib:SaveConfig(name)
	if not success and err and err ~= "Please select a config file." then
		warn("[SlopTD - AutoSave] Failed to save config:", err)
	end
end

-- Lưu có debounce (0.5 giây): dồn nhiều thay đổi liên tiếp thành 1 lần ghi đĩa
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

-- Bọc callback của bất kỳ control nào để tự động lưu sau khi người dùng thay đổi giá trị
function autoSave.Wrap(callback)
	if type(callback) ~= "function" then return callback end
	return function(...)
		local result = { callback(...) }
		autoSave.Save()
		return table.unpack(result)
	end
end

return autoSave
