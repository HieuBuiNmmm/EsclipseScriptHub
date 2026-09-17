-- Module Config trong tab Configs (DungeonQuest): tự build config section dùng API Maclib
-- (SaveConfig/LoadConfig/RefreshConfigList) và Dropdown (UpdateSelection/IsOption/Value...).
-- Hỗ trợ auto-select config autoload + auto-save (xem core/autoSave).

--// Imports
local macLib = require("@packages/Maclib")
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local autoHide = require("@routes/DungeonQuest/core/autoHide")
local coordinator = require("@routes/DungeonQuest/core/coordinator")

return function(window, tab)
	local folder = macLib.Folder
	local autoloadPath = folder .. "/settings/autoload.txt"

	local function getAutoloadName()
		if isfile and isfile(autoloadPath) then
			local ok, name = pcall(readfile, autoloadPath)
			if ok and type(name) == "string" then
				name = string.gsub(name, "[\r\n%s]+", "")
				if #name > 0 then
					return name
				end
			end
		end
		return nil
	end

	local function activate(name)
		autoSave.SetActive(name)
		local contextual = require("@routes/DungeonQuest/core/contextual")
		contextual.LoadData(macLib.contextData)
		if autoloadLabel then
			pcall(function()
				autoloadLabel:UpdateName("Autoload config: " .. name)
			end)
		end
	end

	local section = tab:Section({ Side = "Left" })
	section:Header({ Name = "Configs" })

	local inputPath = nil
	local configSelection
	local autoloadLabel

	local function refreshOptions(keep)
		local options = macLib:RefreshConfigList()
		configSelection:ClearOptions()
		configSelection:InsertOptions(options)
		if keep then
			if not configSelection:IsOption(keep) then
				configSelection:InsertOptions({ keep })
			end
			configSelection:UpdateSelection(keep)
		end
	end

	section:Input({
		Name = "Config Name",
		Placeholder = "Name",
		AcceptedCharacters = "All",
		Callback = function(input)
			inputPath = input
		end,
	})

	configSelection = section:Dropdown({
		Name = "Select Config",
		Multi = false,
		Required = false,
		Options = macLib:RefreshConfigList(),
		Callback = function(value)
			-- Không gọi activate(value) ở đây.
			-- Chỉ chọn tên config để thực hiện Load / Overwrite / Set as autoload.
			-- Tránh autoSave lưu đè UI hiện tại vào config mới chọn trước khi người dùng kịp Load!
		end,
	})

	--// Auto-select config autoload (nếu đã set) để dropdown luôn chỉ đúng config đang dùng
	local autoloadName = getAutoloadName()
	if autoloadName and autoloadName ~= "" then
		if not configSelection:IsOption(autoloadName) then
			configSelection:InsertOptions({ autoloadName })
		end
		configSelection:UpdateSelection(autoloadName)
		activate(autoloadName)
	end

	section:Button({
		Name = "Create Config",
		Callback = function()
			if not inputPath or string.gsub(inputPath, " ", "") == "" then
				window:Notify({ Title = "Interface", Description = "Config name cannot be empty." })
				return
			end

			local success, err = macLib:SaveConfig(inputPath)
			if not success then
				window:Notify({ Title = "Interface", Description = "Unable to save config: " .. tostring(err) })
				return
			end

			window:Notify({ Title = "Interface", Description = string.format("Created config %q", inputPath) })
			refreshOptions(inputPath)
			activate(inputPath)
		end,
	})

	section:Button({
		Name = "Load Config",
		Callback = function()
			local name = configSelection.Value
			if not name or name == "" then
				window:Notify({ Title = "Interface", Description = "Please select a config first." })
				return
			end

			-- Suspend autoSave & Lock coordinator trong suốt quá trình LoadConfig
			autoSave.Suspend()
			coordinator.SetLocked(true)

			local success, err = macLib:LoadConfig(name)
			if not success then
				coordinator.SetLocked(false)
				autoSave.Resume()
				window:Notify({ Title = "Interface", Description = "Unable to load config: " .. tostring(err) })
				return
			end

			activate(name)

			-- Mở lại coordinator và autoSave sau khi các toggle/slider đã đồng bộ xong
			task.delay(0.5, function()
				coordinator.SetLocked(false)
			end)
			task.delay(1.5, function()
				autoSave.Resume()
			end)

			window:Notify({ Title = "Interface", Description = string.format("Loaded config %q", name) })
		end,
	})

	section:Button({
		Name = "Overwrite Config",
		Callback = function()
			local name = configSelection.Value
			if not name or name == "" then
				window:Notify({ Title = "Interface", Description = "Please select a config first." })
				return
			end

			local success, err = macLib:SaveConfig(name)
			if not success then
				window:Notify({ Title = "Interface", Description = "Unable to overwrite config: " .. tostring(err) })
				return
			end

			activate(name)
			window:Notify({ Title = "Interface", Description = string.format("Overwrote config %q", name) })
		end,
	})

	section:Button({
		Name = "Set as autoload",
		Callback = function()
			local name = configSelection.Value
			if not name then
				window:Notify({ Title = "Interface", Description = "Please select a config first." })
				return
			end

			writefile(autoloadPath, name)
			autoloadLabel:UpdateName("Autoload config: " .. name)
			window:Notify({ Title = "Interface", Description = string.format("Set %q as autoload", name) })
			activate(name)
		end,
	})

	section:Button({
		Name = "Refresh Config List",
		Callback = function()
			refreshOptions(configSelection.Value)
		end,
	})

	autoloadLabel = section:Label({ Text = "Autoload config: None" })
	local currentAuto = getAutoloadName()
	if currentAuto and currentAuto ~= "" then
		autoloadLabel:UpdateName("Autoload config: " .. currentAuto)
	end

	section:Header({ Name = "Auto Hide UI" })
	section:Toggle({
		Name = "Hide window after execute",
		Default = autoHide.IsEnabled(),
		Callback = function(state)
			autoHide.SetEnabled(state)
		end,
	}, "Toggle_AutoHide")

	section:Label({
		Text = "Press RightControl to show the window again.",
	})
end
