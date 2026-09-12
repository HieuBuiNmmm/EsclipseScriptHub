-- Tab Smart Dodge V2: Section Detection
-- Điều khiển Threat Detection Engine V2, Visuals ESP, và Live Threat Monitor

local ui = require("@routes/DungeonQuest/core/ui")
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local smartDodgeV2 = require("@routes/DungeonQuest/core/smartDodgeV2")
local detection = smartDodgeV2.detection
local visuals = smartDodgeV2.visuals
local danger = smartDodgeV2.danger

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Threat Detection V2" })

	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Live Threat Inspector" })

	--// Right Section: Real-time Monitor Labels
	local statusLabel = rightSection:Label({ Text = "Detector V2: <font color='rgb(255,80,80)'>Disabled</font>" })
	local dangerLabel = rightSection:Label({ Text = "Danger State: <font color='rgb(50,255,50)'>SAFE</font>" })
	local countLabel = rightSection:Label({ Text = "Active Hazards: <font color='rgb(160,160,160)'>0</font>" })
	local lastHazardLabel = rightSection:Label({ Text = "Last Threat: <font color='rgb(160,160,160)'>None</font>" })
	local trackedListLabel = rightSection:Label({ Text = "Tracked Hazards: <font color='rgb(160,160,160)'>None</font>" })

	local function updateMonitor(count, lastHazard)
		count = count or detection.GetHazardCount()
		local isEnabled = detection.IsEnabled()
		local statusColor = isEnabled and "0, 255, 0" or "255, 80, 80"
		local statusText = isEnabled and "Active (Real-time V2)" or "Disabled"

		pcall(function()
			statusLabel:UpdateName("Detector V2: <font color='rgb(" .. statusColor .. ")'>" .. statusText .. "</font>")
		end)

		local countColor = count > 0 and "255, 60, 60" or "0, 255, 0"
		pcall(function()
			countLabel:UpdateName("Active Hazards: <font color='rgb(" .. countColor .. ")'>" .. tostring(count) .. "</font>")
		end)

		if lastHazard then
			pcall(function()
				lastHazardLabel:UpdateName(("Last Threat: <font color='rgb(255,200,60)'>%s</font> (%d parts, %.1fm)"):format(
					lastHazard.name, lastHazard.neonCount, lastHazard.distanceToPlayer
				))
			end)
		end

		-- Danh sách tóm tắt các hazard đang hoạt động
		local activeMap = detection.GetActiveHazards()
		local names = {}
		for _, h in pairs(activeMap) do
			table.insert(names, ("%s (%d parts)"):format(h.name, h.neonCount))
		end
		pcall(function()
			if #names > 0 then
				trackedListLabel:UpdateName("Tracked Hazards: <font color='rgb(255,150,50)'>" .. table.concat(names, ", ") .. "</font>")
			else
				trackedListLabel:UpdateName("Tracked Hazards: <font color='rgb(160,160,160)'>None</font>")
			end
		end)
	end

	-- Lắng nghe sự kiện từ Detection V2
	detection.OnHazardsChanged(function(count, lastHazard)
		updateMonitor(count, lastHazard)
	end)

	-- Lắng nghe sự kiện IN DANGER từ Danger Engine V2
	danger.OnDangerStateChanged(function(inDanger, currentHazard)
		pcall(function()
			if inDanger and currentHazard then
				dangerLabel:UpdateName(("Danger State: <font color='rgb(255,40,40)'><b>IN DANGER</b></font> (<font color='rgb(255,200,50)'>%s</font>)"):format(currentHazard.name))
			else
				dangerLabel:UpdateName("Danger State: <font color='rgb(50,255,50)'>SAFE</font>")
			end
		end)
	end)

	--// Left Section: Controls
	leftSection:Toggle({
		Name = "Enable Threat Detection V2",
		Default = false,
		Callback = function(state)
			detection.SetEnabled(state)
			updateMonitor()
		end,
	}, "Toggle_SDV2_Enabled")

	leftSection:Toggle({
		Name = "3D ESP Highlighting",
		Default = true,
		Callback = function(state)
			visuals.SetEspEnabled(state)
		end,
	}, "Toggle_SDV2_VisualESP")

	leftSection:Toggle({
		Name = "Unified Model Box (Gộp khung Model >= 2 Parts)",
		Default = true,
		Callback = function(state)
			visuals.SetUnifiedModelBoxes(state)
		end,
	}, "Toggle_SDV2_UnifiedModel")

	leftSection:Toggle({
		Name = "Show Part Name Tags [Parent(ClassName)]",
		Default = true,
		Callback = function(state)
			visuals.SetNameTagsEnabled(state)
		end,
	}, "Toggle_SDV2_NameTags")

	leftSection:Toggle({
		Name = "Show Player Hitbox Radius (Vòng chân)",
		Default = true,
		Callback = function(state)
			visuals.SetHitboxVisualEnabled(state)
		end,
	}, "Toggle_SDV2_HitboxCircle")


	leftSection:Toggle({
		Name = "Console Threat Logging",
		Default = false,
		Callback = function(state)
			detection.SetLogHazards(state)
		end,
	}, "Toggle_SDV2_LogHazards")

	leftSection:Slider({
		Name = "Box Outline Thickness",
		Default = 8,
		Minimum = 2,
		Maximum = 25,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = function(val)
			visuals.SetLineThickness(val / 100)
		end,
	}, "Slider_SDV2_Thickness")

	leftSection:Slider({
		Name = "Box Surface Opacity",
		Default = 35,
		Minimum = 0,
		Maximum = 100,
		DisplayMethod = "Percent",
		Precision = 0,
		Callback = function(val)
			visuals.SetSurfaceTransparency(1 - (val / 100))
		end,
	}, "Slider_SDV2_Opacity")

	leftSection:Slider({
		Name = "Player Hitbox Padding (studs x10)",
		Default = 18,
		Minimum = 5,
		Maximum = 40,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = function(val)
			danger.SetHitboxPadding(val / 10)
		end,
	}, "Slider_SDV2_Padding")

	leftSection:Slider({
		Name = "Hitbox Height Offset (Hạ thấp x10)",
		Default = 28,
		Minimum = 10,
		Maximum = 50,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = function(val)
			danger.SetHitboxDownwardOffset(val / 10)
		end,
	}, "Slider_SDV2_HeightOffset")

	updateMonitor()
end
