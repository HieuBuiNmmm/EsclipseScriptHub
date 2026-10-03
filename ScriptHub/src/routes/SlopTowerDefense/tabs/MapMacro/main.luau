-- Tab Map Macro: Cấu hình gán Macro cụ thể cho từng Universe và từng Map.
-- Mỗi Universe được chia thành một Section riêng biệt, trực quan và dễ quản lý.

local storage = require("@routes/SlopTowerDefense/core/macro/storage")
local mapMacroManager = require("@routes/SlopTowerDefense/core/macro/mapMacroManager")
local autoSave = require("@routes/SlopTowerDefense/core/system/autoSave")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")

return function(window, tab)
	local isUpdatingInternally = false
	local dropdownMap: { [string]: any } = {}

	-- Helper: Tạo danh sách Options bao gồm "None" và toàn bộ Macro đã lưu
	local function getDropdownOptions(): { string }
		local opts = { "None" }
		local ok, macros = pcall(storage.ListMacros)
		if ok and type(macros) == "table" then
			for _, name in ipairs(macros) do
				if type(name) == "string" and name ~= "None" then
					table.insert(opts, name)
				end
			end
		end
		return opts
	end

	-- Helper: Làm mới danh sách Options trên toàn bộ các Dropdown
	local function refreshAllDropdowns()
		if isUpdatingInternally then return end
		isUpdatingInternally = true

		local latestOptions = getDropdownOptions()
		for mapName, dd in pairs(dropdownMap) do
			pcall(function()
				local currentAssigned = mapMacroManager.GetMapMacro(mapName) or "None"
				if not table.find(latestOptions, currentAssigned) then
					currentAssigned = "None"
					mapMacroManager.SetMapMacro(mapName, nil)
				end

				dd:ClearOptions()
				dd:InsertOptions(latestOptions)
				dd:UpdateSelection(currentAssigned)
			end)
		end

		isUpdatingInternally = false
	end

	--// ====================================================================
	--// CỘT TRÁI - SECTION 1: Quick Actions
	--// ====================================================================
	local actionSection = tab:Section({ Side = "Left" })
	actionSection:Header({ Name = "Quick Actions" })

	actionSection:Button({
		Name = "Reload Macro List",
		Callback = function()
			refreshAllDropdowns()
			notifier.Notify("Map Macro", "Refreshed macro list for all maps!", 1.5)
		end,
	})

	actionSection:Button({
		Name = "Reset All Mappings to None",
		Callback = function()
			isUpdatingInternally = true
			mapMacroManager.ClearAll()
			for _, dd in pairs(dropdownMap) do
				pcall(function()
					dd:UpdateSelection("None")
				end)
			end
			isUpdatingInternally = false
			notifier.Notify("Map Macro", "Reset all map macro mappings to 'None'!", 2)
		end,
	})

	--// ====================================================================
	--// CỘT PHẢI - SECTION 1: Priority Rule
	--// ====================================================================
	local ruleSection = tab:Section({ Side = "Right" })
	ruleSection:Header({ Name = "Priority Rule" })

	ruleSection:Label({
		Text = "💡 <b>Setup Rule:</b> Assign a macro to any map below. When entering that map with <b>Play Macro</b> enabled, the bot will automatically run that assigned macro instead of the default selected one.",
	})

	--// ====================================================================
	--// TẠO SECTION RIÊNG BIỆT CHO TỪNG UNIVERSE
	--// ====================================================================
	local initialOptions = getDropdownOptions()

	for _, uni in ipairs(mapMacroManager.Universes) do
		-- Tạo Section riêng biệt cho từng Universe (Left hoặc Right)
		local uniSection = tab:Section({ Side = uni.Side })
		uniSection:Header({ Name = uni.Name })

		-- Hiển thị mô tả đặc thù nếu có (ví dụ cho chế độ Raid Stages)
		if uni.Description then
			uniSection:Label({
				Text = uni.Description,
			})
		end

		for _, mapItem in ipairs(uni.Maps) do
			local mapKey = if type(mapItem) == "table" then mapItem.Key else mapItem
			local displayName = if type(mapItem) == "table" then mapItem.DisplayName else mapItem

			local cleanKey = mapKey:gsub("%s+", ""):gsub("[^%w]", "")
			local flagName = "Dropdown_MapMacro_" .. cleanKey
			local currentSelected = mapMacroManager.GetMapMacro(mapKey) or "None"

			if not table.find(initialOptions, currentSelected) then
				currentSelected = "None"
			end

			local dd = uniSection:Dropdown({
				Name = displayName,
				Options = initialOptions,
				Default = currentSelected,
				Required = true,
				Callback = autoSave.Wrap(function(selected)
					if isUpdatingInternally then return end
					local val = (selected and selected ~= "" and selected ~= "None") and selected or nil
					mapMacroManager.SetMapMacro(mapKey, val)
				end),
			}, flagName)

			dropdownMap[mapKey] = dd
		end
	end

	-- Lắng nghe sự kiện thêm/xóa macro từ hệ thống để tự động cập nhật
	local unsubList = mapMacroManager.OnMacroListChanged(function()
		refreshAllDropdowns()
	end)
	lifecycle.Register(unsubList)
end
