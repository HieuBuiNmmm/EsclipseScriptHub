-- Tab AutoFarm Pathfinder (v2): hai luồng song song — Pathfinding Move giữ
-- khoảng cách an toàn với kẻ địch gần nhất, Auto Skill spam Q+E trong tầm Skill Range.
-- Gồm Visual Debug (ô đỏ điểm tới + highlight kẻ gần nhất).

--// Imports
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local autoFarmPathfinder = require("@routes/DungeonQuest/core/autoFarmPathfinder")
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

	section:Header({ Name = "Position Logic" })

	ui.PatchSliderLoadCallback(section:Slider({
		Name = "Stand Distance (x)",
		Default = autoFarmPathfinder.GetStandDistance(),
		Minimum = 1,
		Maximum = 200,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(Value)
			autoFarmPathfinder.SetStandDistance(Value)
		end),
	}, "Slider_PathfinderStandDistance"))

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
		Name = "Repath Interval",
		Default = autoFarmPathfinder.GetRepathInterval(),
		Minimum = 0.2,
		Maximum = 2,
		DisplayMethod = "Value",
		Precision = 1,
		Callback = autoSave.Wrap(function(Value)
			autoFarmPathfinder.SetRepathInterval(Value)
		end),
	}, "Slider_PathfinderRepath"))

	section:Header({ Name = "Skills" })

	section:Toggle({
		Name = "Auto Skill (Q+E)",
		Default = autoFarmPathfinder.IsSkillEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoFarmPathfinder.SetSkillEnabled(state)
		end),
	}, "Toggle_PathfinderSkill")

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
end
