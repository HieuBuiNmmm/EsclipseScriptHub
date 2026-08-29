-- Auto Hide UI cho DungeonQuest: tự ẩn cửa sổ script hub ngay sau khi execute.
-- Hiện lại bằng keybind mặc định (RightControl) mà Maclib đã cấu hình sẵn.

--// Imports
local macLib = require("@packages/Maclib")
local notifier = require("@routes/DungeonQuest/core/notifier")

--// Services
local HttpService = game:GetService("HttpService")

--// Constants
local SETTINGS_FILE = macLib.Folder .. "/settings/autohide.json"

--// Table
local autoHide = {}

--// State
local enabled = false
local window = nil

--// Persistence
local function loadSettings()
	if not (isfile and isfile(SETTINGS_FILE)) then return end
	local ok, decoded = pcall(function()
		return HttpService:JSONDecode(readfile(SETTINGS_FILE))
	end)
	if ok and type(decoded) == "table" then
		enabled = decoded.enabled == true
	end
end

local function saveSettings()
	if not (isfile and writefile) then return end
	pcall(function()
		writefile(SETTINGS_FILE, HttpService:JSONEncode({ enabled = enabled }))
	end)
end

--// Methods
function autoHide.SetWindow(newWindow)
	window = newWindow
end

function autoHide.SetEnabled(state)
	enabled = state == true
	saveSettings()
end

function autoHide.IsEnabled()
	return enabled
end

--// Ẩn cửa sổ ngay lập tức (dùng SetState(false) như Maclib minimize, hiện lại bằng keybind)
function autoHide.Hide()
	if not enabled or not window then return end
	local ok = pcall(function()
		window:SetState(false)
	end)
	if not ok then warn("[AutoHide] Không ẩn được window") end
end

--// Chạy sau khi init xong: ẩn ngay nếu được bật
function autoHide.Execute()
	if not enabled then return end
	task.spawn(function()
		task.wait(0.5)
		autoHide.Hide()
	end)
end

--// Load settings lúc require
loadSettings()

return autoHide
