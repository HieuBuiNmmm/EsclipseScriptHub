-- Tab DevTools (DungeonQuest): Quản lý công cụ dành cho Admin / Developer.
-- 1. Map Recorder: Ghi nhận các Part bị xóa và xuất profile JSON.
-- 2. Profile Manager: Nạp & áp dụng profile tối ưu map riêng cho từng Dungeon.

--// Imports
local mapRecorder = require("@routes/DungeonQuest/core/mapRecorder")
local shared = require("@routes/DungeonQuest/core/shared")
local dungeonCatalog = require("@routes/DungeonQuest/core/dungeonCatalog")

return function(window, tab)
	--// Cột Trái: Chế độ Ghi nhận Xóa Map (Recorder)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Map Recorder (Admin)" })

	local currentDungeon = shared.GetCurrentDungeonName() or "Unknown"
	local statusHeader = leftSection:Header({ Name = string.format("Current Map: %s | Recorded: 0", currentDungeon) })

	mapRecorder.OnCountChanged(function(count, isRecording)
		local dName = shared.GetCurrentDungeonName() or "Unknown"
		local stateStr = isRecording and "🔴 RECORDING" or "⏹️ IDLE"
		pcall(function()
			statusHeader:SetText(string.format("[%s] Map: %s | Deleted: %d", stateStr, dName, count))
		end)
	end)

	leftSection:Toggle({
		Name = "Record Map Deletions",
		Default = mapRecorder.IsRecording(),
		Callback = function(state)
			if state then
				mapRecorder.StartRecording()
			else
				mapRecorder.StopRecording(false)
			end
		end,
	}, "Toggle_MapRecorder_Record")

	leftSection:Toggle({
		Name = "Click-To-Delete Tool (Raycast / X)",
		Default = mapRecorder.IsClickToDeleteEnabled(),
		Callback = function(state)
			mapRecorder.SetClickToDelete(state)
		end,
	}, "Toggle_MapRecorder_ClickToDelete")

	leftSection:Button({
		Name = "Clear Recorded Buffer",
		Callback = function()
			mapRecorder.ClearBuffer()
			window:Notify({ Title = "Map Recorder", Description = "Đã xóa sạch bộ nhớ tạm!" })
		end,
	})

	leftSection:Button({
		Name = "Copy JSON to Clipboard",
		Callback = function()
			local success = mapRecorder.ExportToClipboard()
			if success then
				window:Notify({ Title = "Map Recorder", Description = "Đã copy JSON vào Clipboard!" })
			else
				window:Notify({ Title = "Map Recorder", Description = "Không có dữ liệu để copy!" })
			end
		end,
	})

	--// Cột Phải: Quản lý File Profile & Áp dụng
	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Map Profiles (JSON)" })

	local profileNameInput = ""
	local applyMode = "Destroy"

	rightSection:Input({
		Name = "Profile Name (Leave empty for current map)",
		Placeholder = "e.g. Desert Temple",
		AcceptedCharacters = "All",
		Callback = function(input)
			profileNameInput = input
		end,
	})

	rightSection:Dropdown({
		Name = "Apply Mode",
		Multi = false,
		Required = true,
		Options = { "Destroy (Delete Permanent)", "Ghost (Transparency=1, No-Clip)" },
		Default = "Destroy (Delete Permanent)",
		Callback = function(value)
			if value:find("Ghost") then
				applyMode = "Ghost"
			else
				applyMode = "Destroy"
			end
		end,
	})

	rightSection:Button({
		Name = "💾 Save Current Profile to File",
		Callback = function()
			local targetName = (#profileNameInput > 0) and profileNameInput or shared.GetCurrentDungeonName()
			if not targetName or #targetName == 0 then
				targetName = "Default_Dungeon"
			end

			local success = mapRecorder.SaveProfile(targetName)
			if success then
				window:Notify({ Title = "Map Recorder", Description = string.format("Đã lưu profile '%s.json' thành công!", targetName) })
			else
				window:Notify({ Title = "Map Recorder", Description = "Lưu file thất bại (hoặc buffer trống)!" })
			end
		end,
	})

	rightSection:Button({
		Name = "⚡ Apply Profile to Current Map",
		Callback = function()
			local targetName = (#profileNameInput > 0) and profileNameInput or shared.GetCurrentDungeonName()
			if not targetName or #targetName == 0 then
				targetName = "Default_Dungeon"
			end

			local count = mapRecorder.ApplyProfile(targetName, applyMode)
			if count > 0 then
				window:Notify({ Title = "Map Recorder", Description = string.format("Đã tối ưu %d parts theo '%s.json'!", count, targetName) })
			else
				window:Notify({ Title = "Map Recorder", Description = string.format("Không tìm thấy profile hoặc không có part khớp: %s", targetName) })
			end
		end,
	})
end
