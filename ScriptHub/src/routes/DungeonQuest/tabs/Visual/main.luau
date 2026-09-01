-- Tab Visual (DungeonQuest): các tính năng hiển thị trực quan (visual).

--// Imports
	local autoSave = require("@routes/DungeonQuest/core/autoSave")
	local esp = require("@routes/DungeonQuest/core/esp")
	local enemyEsp = require("@routes/DungeonQuest/core/enemyEsp")
	local basicOrbitDodge = require("@routes/DungeonQuest/core/basicOrbitDodge")
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
		Name = "Projectile Hitboxes",
		Default = false,
		Callback = autoSave.Wrap(function(state)
			esp.Toggle(state)
		end),
	}, "Toggle_HighlightHitboxes")

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

	local dodgeSection = tab:Section({ Side = "Left" })
	dodgeSection:Header({ Name = "Dodge Visuals" })

	dodgeSection:Toggle({
		Name = "Dead Zone Visuals",
		Default = basicOrbitDodge.IsDebugVisuals(),
		Callback = autoSave.Wrap(function(state)
			basicOrbitDodge.SetDebugVisuals(state)
		end),
	}, "Toggle_DeadZoneVisuals")

	dodgeSection:Toggle({
		Name = "Detector Visuals",
		Default = basicOrbitDodge.IsDetectorVisuals(),
		Callback = autoSave.Wrap(function(state)
			basicOrbitDodge.SetDetectorVisuals(state)
		end),
	}, "Toggle_DetectorVisuals")

	dodgeSection:Dropdown({
		Name = "Detector Shape",
		Options = { "Circle", "Cone" },
		Default = (basicOrbitDodge.GetDetectorMode() == "Cone" and 2) or 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			if option == "Cone" then
				basicOrbitDodge.SetDetectorMode("Cone")
			else
				basicOrbitDodge.SetDetectorMode("Circle")
			end
		end),
	}, "Dropdown_DetectorShape")
end
