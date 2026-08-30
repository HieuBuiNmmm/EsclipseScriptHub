-- Phím tắt R: teleport tới kẻ địch gần nhất. C: teleport về sau kẻ địch xa nhất.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")

--// References
local UserInputService = services.UserInputService

--// Table
local shortcuts = {}

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
		end
	end)
end

return shortcuts
