-- Tab AutoFarm Pathfinder (v2): cơ chế 2 pha.
-- CHASE: pathfinding chạy thẳng tới kẻ địch gần nhất khi ngoài tầm.
-- HOLD: khi trong tầm skill range, giữ khoảng cách bằng orbit tốc độ 0 (đứng yên + quay mặt
-- enemy) và tự spam Q+E. Kèm Visual Debug (ô đỏ điểm đuổi + highlight kẻ gần nhất).

--// Imports
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local autoFarmPathfinder = require("@routes/DungeonQuest/core/autoFarmPathfinder")
local shortcuts = require("@routes/DungeonQuest/core/shortcuts")
local ui = require("@routes/DungeonQuest/core/ui")

return function(window, tab)
	local section = tab:Section({ Side = "Left" })
	section:Header({ Name = "AutoFarm Pathfinder" })

	section:Toggle({
		Name = "Enable Pathfinder Farm",
		Default = autoFarmPathfinder.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoFarmPathfinder.Toggle(state)
		end),
	}, "Toggle_PathfinderFarm")

	section:Header({ Name = "Movement" })

	ui.PatchSliderLoadCallback(section:Slider({
		Name = "Move Speed",
		Default = autoFarmPathfinder.GetMoveSpeed(),
		Minimum = 10,
		Maximum = 200,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			autoFarmPathfinder.SetMoveSpeed(Value)
		end),
	}, "Slider_PathfinderMoveSpeed"))

	ui.PatchSliderLoadCallback(section:Slider({
		Name = "Retarget Interval",
		Default = autoFarmPathfinder.GetRetargetInterval(),
		Minimum = 0.2,
		Maximum = 5,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(Value)
			autoFarmPathfinder.SetRetargetInterval(Value)
		end),
	}, "Slider_PathfinderRetarget"))

	section:Header({ Name = "Skills" })

	section:Toggle({
		Name = "Auto Skill (Q+E)",
		Default = autoFarmPathfinder.IsSkillEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoFarmPathfinder.SetSkillEnabled(state)
		end),
	}, "Toggle_PathfinderSkill")

	section:Dropdown({
		Name = "Skill Mode",
		Options = { "Both (Q+E cùng lúc)", "Alternate (Q -> E -> Q -> E)" },
		Default = (autoFarmPathfinder.GetSkillMode() == "Alternate" and 2) or 1,
		Required = true,
		Callback = autoSave.Wrap(function(option)
			if not option then return end
			if option:find("Alternate") then
				autoFarmPathfinder.SetSkillMode("Alternate")
			else
				autoFarmPathfinder.SetSkillMode("Both")
			end
		end),
	}, "Dropdown_PathfinderSkillMode")

	section:Toggle({
		Name = "Right Click Combo (Q+E)",
		Default = shortcuts.IsMouseComboEnabled(),
		Callback = autoSave.Wrap(function(state)
			shortcuts.SetMouseComboEnabled(state)
		end),
	}, "Toggle_PathfinderMouseCombo")

	ui.PatchSliderLoadCallback(section:Slider({
		Name = "Skill Range",
		Default = autoFarmPathfinder.GetSkillRange(),
		Minimum = 1,
		Maximum = 200,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			autoFarmPathfinder.SetSkillRange(Value)
		end),
	}, "Slider_PathfinderSkillRange"))

	ui.PatchSliderLoadCallback(section:Slider({
		Name = "Skill Interval",
		Default = autoFarmPathfinder.GetSkillInterval(),
		Minimum = 0.2,
		Maximum = 10,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(Value)
			autoFarmPathfinder.SetSkillInterval(Value)
		end),
	}, "Slider_PathfinderSkillInterval"))

	section:Header({ Name = "Visual Debug" })

	section:Toggle({
		Name = "Show Debug Overlays",
		Default = autoFarmPathfinder.IsVisualDebugEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoFarmPathfinder.SetVisualDebug(state)
		end),
	}, "Toggle_PathfinderDebug")

	section:Header({ Name = "State Monitor" })

	local stateLabel = section:Label({ Text = "Initializing..." })

	local PHASE_COLORS = {
		CHASE = "0, 255, 255",
		HOLD = "255, 200, 0",
		IDLE = "160, 160, 160",
	}

	local function formatBool(v)
		return v and "<font color='rgb(0,255,0)'>Yes</font>" or "<font color='rgb(255,80,80)'>No</font>"
	end

	local function updateStateLabel()
		local ok, info = pcall(autoFarmPathfinder.GetDebugInfo)
		if not ok or not info then return end
		local phaseColor = PHASE_COLORS[info.phase] or "160, 160, 160"
		local angle = info.holdAngle
		local angleStr = angle and string.format("%.1fdeg", math.deg(angle)) or "-"
		local radiusStr = info.holdRadius and string.format("%.1f", info.holdRadius) or "-"
		local text = table.concat({
			"State: <font color='rgb(" .. phaseColor .. ")'>" .. info.phase .. "</font>\n",
			"Locked: " .. (info.locked and ("<font color='rgb(255,200,0)'>" .. info.lockedName .. "</font>") or "No") .. "\n",
			"Current: " .. info.enemyName .. "\n",
			"Dist 3D: " .. string.format("%.1f", info.enemyDist) .. "\n",
			"Dist XZ: " .. string.format("%.1f", info.enemyFlat) .. " / SkillRange " .. info.skillRange .. "\n",
			"Orbit: angle " .. angleStr .. " / radius " .. radiusStr .. "\n",
			"Path: " .. (info.pathComputed and "active" or "none") .. "\n",
			"Path Banned: " .. (info.pathBanned or 0) .. " / Fallback " .. (info.noPathSince and "on" or "off") .. "\n",
			"Tracking: " .. formatBool(info.dunReady) .. " / Enabled " .. formatBool(info.enabled),
		})
		pcall(function()
			stateLabel:UpdateName(text)
		end)
	end

	updateStateLabel()

	task.spawn(function()
		while task.wait(0.25) do
			updateStateLabel()
		end
	end)
end