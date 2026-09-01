-- Phím tắt R: teleport tới kẻ địch gần nhất. C: teleport về sau kẻ địch xa nhất.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")

--// References
local UserInputService = services.UserInputService
local VirtualInputManager = services.VirtualInputManager

--// Table
local shortcuts = {}

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

	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then return end
		if input.KeyCode == Enum.KeyCode.R then
			task.spawn(function()
				shared.TeleportToNearestEnemy()
			end)
		elseif input.KeyCode == Enum.KeyCode.C then
			task.spawn(function()
				shared.TeleportBehindFarthestEnemy()
			end)
		elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
			--// Ẩn: chuột phải cũng cùng kích hoạt E + Q.
			fireCombo()
		end
	end)
end

return shortcuts
