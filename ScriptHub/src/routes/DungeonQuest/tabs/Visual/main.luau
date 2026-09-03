-- Tab Visual (DungeonQuest): các tính năng hiển thị trực quan (visual).

--// Imports
	local autoSave = require("@routes/DungeonQuest/core/autoSave")
	local esp = require("@routes/DungeonQuest/core/esp")
	local enemyEsp = require("@routes/DungeonQuest/core/enemyEsp")
	local mapOptimizer = require("@routes/DungeonQuest/core/mapOptimizer")
	local dodgeNode = require("@routes/DungeonQuest/core/dodgeNode")
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

	enemySection:Toggle({
		Name = "Show Skill Hitbox",
		Default = esp.IsSkillHitboxEnabled(),
		Callback = autoSave.Wrap(function(state)
			esp.ToggleSkillHitbox(state)
		end),
	}, "Toggle_SkillHitbox")

	local skillDodgeSlider = ui.PatchSliderLoadCallback(enemySection:Slider({
		Name = "Dodge Distance",
		Default = esp.GetSkillDodgeDistance(),
		Minimum = 1,
		Maximum = 4,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(Value)
			esp.SetSkillDodgeDistance(Value)
		end),
	}, "Slider_SkillDodgeDistance"))

	local dodgeCooldownSlider = ui.PatchSliderLoadCallback(enemySection:Slider({
		Name = "Dodge Cooldown",
		Default = esp.GetSmartDodgeCooldown(),
		Minimum = 0,
		Maximum = 5,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(Value)
			esp.SetSmartDodgeCooldown(Value)
		end),
	}, "Slider_SmartDodgeCooldown"))

	enemySection:Toggle({
		Name = "SmartDodge",
		Default = esp.IsSmartDodgeEnabled(),
		Callback = autoSave.Wrap(function(state)
			esp.ToggleSmartDodge(state)
		end),
	}, "Toggle_SmartDodge")

	enemySection:Toggle({
		Name = "Show Dodge Zone",
		Default = esp.IsDodgeZoneEnabled(),
		Callback = autoSave.Wrap(function(state)
			esp.ToggleDodgeZone(state)
			applyHitboxVisibility()
		end),
	}, "Toggle_DodgeZone")

	enemySection:Toggle({
		Name = "Show Dodge Safety",
		Default = esp.IsDodgeSafetyEnabled(),
		Callback = autoSave.Wrap(function(state)
			esp.ToggleDodgeSafety(state)
		end),
	}, "Toggle_DodgeSafety")

	enemySection:Toggle({
		Name = "Show Dodge Nodes",
		Default = dodgeNode.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			dodgeNode.Toggle(state)
		end),
	}, "Toggle_DodgeNodes")

	local dodgeZoneSlider = ui.PatchSliderLoadCallback(enemySection:Slider({
		Name = "Dodge Zone Radius",
		Default = esp.GetDodgeZoneRadius(),
		Minimum = 1,
		Maximum = 10,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(Value)
			esp.SetDodgeZoneRadius(Value)
		end),
	}, "Slider_DodgeZoneRadius"))

	local dodgeZoneSafetySlider = ui.PatchSliderLoadCallback(enemySection:Slider({
		Name = "Dodge Zone Safety",
		Default = esp.GetDodgeZoneSafetyRadius(),
		Minimum = 2,
		Maximum = 15,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(Value)
			esp.SetDodgeZoneSafetyRadius(Value)
		end),
	}, "Slider_DodgeZoneSafetyRadius"))

	applyHitboxVisibility = function()
		pcall(function() playerSizeSlider:SetVisibility(esp.GetPlayerHitboxMode() == "Custom") end)
		pcall(function() enemySizeSlider:SetVisibility(esp.GetEnemyHitboxMode() == "Custom") end)
		pcall(function() dodgeZoneSlider:SetVisibility(esp.IsDodgeZoneEnabled()) end)
		pcall(function() dodgeZoneSafetySlider:SetVisibility(esp.IsDodgeZoneEnabled()) end)
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
