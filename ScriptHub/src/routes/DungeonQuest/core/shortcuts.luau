-- Phím tắt: chuột phải kích hoạt combo Q+E (toggle enabled qua tab Auto Farm).

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")

--// References
local UserInputService = services.UserInputService
local VirtualInputManager = services.VirtualInputManager

--// Table
local shortcuts = {}

--// Bật/tắt tính năng ẩn: chuột phải kích hoạt combo Q+E.
local comboEnabled = false
local inputConnection = nil

function shortcuts.IsMouseComboEnabled()
	return comboEnabled
end

function shortcuts.SetMouseComboEnabled(value)
	comboEnabled = value == true
end

--// Kích hoạt combo E+Q (giống Auto Skill): gửi Q+E giữ theo chu kỳ hold.
--// Khi kích hoạt từ E vật lý / chuột phải, game tự nhận phím chính, nên chỉ cần
--// bấm thêm phím còn lại giữ đúng chu kỳ hold để 2 phím bắt đúng thời điểm.
local function fireCombo()
	task.spawn(function()
		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
		task.wait(shared.GetKeyHoldTime())
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
	end)
end

--// Initialize
function shortcuts.Init()
	if shortcuts.inited then return end
	shortcuts.inited = true

	inputConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then return end
		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			--// Ẩn: chuột phải kích hoạt E + Q (chỉ khi toggle bật).
			if comboEnabled then
				fireCombo()
			end
		end
	end)
end

lifecycle.Register(function()
	if inputConnection then inputConnection:Disconnect(); inputConnection = nil end
	shortcuts.inited = false
end)

return shortcuts
