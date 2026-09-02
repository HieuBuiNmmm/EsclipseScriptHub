-- Tab Visual (DungeonQuest): các tính năng hiển thị trực quan (visual).

--// Imports
	local autoSave = require("@routes/DungeonQuest/core/autoSave")
	local esp = require("@routes/DungeonQuest/core/esp")
	local enemyEsp = require("@routes/DungeonQuest/core/enemyEsp")
	local mapOptimizer = require("@routes/DungeonQuest/core/mapOptimizer")
	local ui = require("@routes/DungeonQuest/core/ui")

--// Hitbox mode options
local HITBOX_OPTIONS = { "Custom Hitbox", "Real Hitbox" }
local function hitboxModeToIndex(mode)
	return (mode == "Custom" and 1) or 2
end
local function hitboxLabelToMode(label)
	return (label == HITBOX_OPTIONS[1] and "Custom") or "Real"
end

return function(window, tab)
	local applyHitboxVisibility

	local playerSection = tab:Section({ Side = "Left" })
	playerSection:Header({ Name = "Player" })

	playerSection:Toggle({
		Name = "Hitbox",
		Default = esp.IsPlayerHitboxEnabled(),
		Callback = autoSave.Wrap(function(state)
			esp.TogglePlayerHitbox(state)
		end),
	}, "Toggle_PlayerHitbox")

	playerSection:Dropdown({
		Name = "Hitbox Mode",
		Options = HITBOX_OPTIONS,
		Default = hitboxModeToIndex(esp.GetPlayerHitboxMode()),
		Required = true,
		Callback = autoSave.Wrap(function(option)
			esp.SetPlayerHitboxMode(hitboxLabelToMode(option))
			applyHitboxVisibility()
		end),
	}, "Dropdown_PlayerHitboxMode")

	local playerSizeSlider = ui.PatchSliderLoadCallback(playerSection:Slider({
		Name = "Hitbox Size",
		Default = esp.GetPlayerHitboxScale(),
		Minimum = 1,
		Maximum = 5,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(Value)
			esp.SetPlayerHitboxScale(Value)
		end),
	}, "Slider_PlayerHitboxSize"))

	local enemySection = tab:Section({ Side = "Left" })
	enemySection:Header({ Name = "Enemy" })

	enemySection:Toggle({
		Name = "Attack Hitbox",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			esp.Toggle(state)
		end),
	}, "Toggle_HighlightHitboxes")

	enemySection:Dropdown({
		Name = "Hitbox Filter",
		Options = { "precast", "Projectile", "All" },
		Default = (esp.GetHitboxMode() == "precast" and 1) or (esp.GetHitboxMode() == "Projectile" and 2) or 3,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			esp.SetHitboxMode(option)
		end),
	}, "Dropdown_HitboxFilter")

	enemySection:Toggle({
		Name = "Model Highlight",
		Default = enemyEsp.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			enemyEsp.Toggle(state)
		end),
	}, "Toggle_EnemyESP")

	local highlightColors = enemyEsp.GetColorNames()
	local currentColor = enemyEsp.GetSelectedColor()
	local colorDefaultIndex = 1
	for i, name in ipairs(highlightColors) do
		if name == currentColor then
			colorDefaultIndex = i
			break
		end
	end

	enemySection:Dropdown({
		Name = "Highlight Color",
		Options = highlightColors,
		Default = colorDefaultIndex,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			enemyEsp.SetSelectedColor(option)
		end),
	}, "Dropdown_HighlightColor")

	enemySection:Toggle({
		Name = "Hitbox",
		Default = esp.IsEnemyHitboxEnabled(),
		Callback = autoSave.Wrap(function(state)
			esp.ToggleEnemyHitbox(state)
		end),
	}, "Toggle_EnemyHitbox")

	enemySection:Dropdown({
		Name = "Hitbox Mode",
		Options = HITBOX_OPTIONS,
		Default = hitboxModeToIndex(esp.GetEnemyHitboxMode()),
		Required = true,
		Callback = autoSave.Wrap(function(option)
			esp.SetEnemyHitboxMode(hitboxLabelToMode(option))
			applyHitboxVisibility()
		end),
	}, "Dropdown_EnemyHitboxMode")

	local enemySizeSlider = ui.PatchSliderLoadCallback(enemySection:Slider({
		Name = "Hitbox Size",
		Default = esp.GetEnemyHitboxScale(),
		Minimum = 1,
		Maximum = 5,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(Value)
			esp.SetEnemyHitboxScale(Value)
		end),
	}, "Slider_EnemyHitboxSize"))

	applyHitboxVisibility = function()
		pcall(function() playerSizeSlider:SetVisibility(esp.GetPlayerHitboxMode() == "Custom") end)
		pcall(function() enemySizeSlider:SetVisibility(esp.GetEnemyHitboxMode() == "Custom") end)
	end
	applyHitboxVisibility()

	local mapSection = tab:Section({ Side = "Right" })
	mapSection:Header({ Name = "Map" })

	mapSection:Toggle({
		Name = "Map Optimizer",
		Default = mapOptimizer.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			mapOptimizer.Toggle(state)
		end),
	}, "Toggle_MapOptimizer")

end
