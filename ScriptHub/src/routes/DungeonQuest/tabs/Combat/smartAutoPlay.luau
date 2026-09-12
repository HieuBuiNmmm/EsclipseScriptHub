-- Tab Combat - Submodule Smart Auto Play (DungeonQuest)
-- Unified Master System: Tích hợp hoàn chỉnh Auto Farm (tiếp cận) + Auto Skill (xả chiêu) + Smart Dodge (né chiêu)

local ui = require("@routes/DungeonQuest/core/ui")
local autoSave = require("@routes/DungeonQuest/core/autoSave")
local smartAutoPlay = require("@routes/DungeonQuest/core/smartAutoPlay")

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Smart Auto Play - Master System" })

	-- 1. Master Toggle duy nhất
	local masterToggle = leftSection:Toggle({
		Name = "Enable Smart Auto Play",
		Default = smartAutoPlay.IsMasterEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartAutoPlay.SetMasterEnabled(state)
		end),
	}, "Toggle_SAP_Master")

	local masterStatusLabel = leftSection:Label({
		Text = "Status: <font color='rgb(160, 160, 160)'>Disabled</font>",
	})

	-- 2. Combat Radii & Visuals
	leftSection:Header({ Name = "Combat Radii & Visuals" })

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Mobs Kiting Radius (Cyan)",
		Suffix = " std",
		Default = smartAutoPlay.GetMobsRadius(),
		Minimum = 4,
		Maximum = 70,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			smartAutoPlay.SetMobsRadius(val)
		end),
	}, "Slider_SAP_Radius_Mobs"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Boss 1 Kiting Radius (Cyan)",
		Suffix = " std",
		Default = smartAutoPlay.GetBoss1Radius(),
		Minimum = 4,
		Maximum = 70,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			smartAutoPlay.SetBoss1Radius(val)
		end),
	}, "Slider_SAP_Radius_Boss1"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Boss 2 Kiting Radius (Cyan)",
		Suffix = " std",
		Default = smartAutoPlay.GetBoss2Radius(),
		Minimum = 4,
		Maximum = 70,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			smartAutoPlay.SetBoss2Radius(val)
		end),
	}, "Slider_SAP_Radius_Boss2"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Boss 3 Kiting Radius (Cyan)",
		Suffix = " std",
		Default = smartAutoPlay.GetBoss3Radius(),
		Minimum = 4,
		Maximum = 70,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			smartAutoPlay.SetBoss3Radius(val)
		end),
	}, "Slider_SAP_Radius_Boss3"))

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Skill Cast Range",
		Suffix = " std",
		Default = smartAutoPlay.GetSkillRange(),
		Minimum = 8,
		Maximum = 100,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = autoSave.Wrap(function(val)
			smartAutoPlay.SetSkillRange(val)
		end),
	}, "Slider_SAP_SkillRange"))

	leftSection:Toggle({
		Name = "Show Kiting Circle (Cyan)",
		Default = smartAutoPlay.IsShowRadiusCircleEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartAutoPlay.SetShowRadiusCircle(state)
		end),
	}, "Toggle_SAP_RadiusCircle")

	leftSection:Toggle({
		Name = "Show Skill Circle (Magenta)",
		Default = smartAutoPlay.IsShowSkillCircleEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartAutoPlay.SetShowSkillCircle(state)
		end),
	}, "Toggle_SAP_SkillCircle")

	ui.PatchSliderLoadCallback(leftSection:Slider({
		Name = "Sphere Size",
		Suffix = " std",
		Default = smartAutoPlay.GetSphereSize(),
		Minimum = 0.1,
		Maximum = 2.0,
		DisplayMethod = "Round",
		Precision = 2,
		Callback = autoSave.Wrap(function(val)
			smartAutoPlay.SetSphereSize(val)
		end),
	}, "Slider_SAP_SphereSize"))

	-- Right Section: Combat Settings & Monitor
	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Combat & Skill Options" })

	local autoSkill = smartAutoPlay.autoSkill

	rightSection:Toggle({
		Name = "Enable Smart Auto Skill",
		Default = smartAutoPlay.IsAutoSkillEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartAutoPlay.SetAutoSkillEnabled(state)
		end),
	}, "Toggle_SAP_AutoSkill")

	local PLAYSTYLE_OPTIONS = { "Auto (Detect)", "Buff + Damage", "Full Damage" }
	local defaultPlaystyleIdx = 1
	local curMode = autoSkill.GetPlaystyleMode()
	if curMode == "BuffAndDamage" then
		defaultPlaystyleIdx = 2
	elseif curMode == "FullDamage" then
		defaultPlaystyleIdx = 3
	end

	rightSection:Dropdown({
		Name = "Playstyle Mode",
		Options = PLAYSTYLE_OPTIONS,
		Default = defaultPlaystyleIdx,
		Required = true,
		Callback = autoSave.Wrap(function(selected)
			if selected == "Buff + Damage" then
				autoSkill.SetPlaystyleMode("BuffAndDamage")
			elseif selected == "Full Damage" then
				autoSkill.SetPlaystyleMode("FullDamage")
			else
				autoSkill.SetPlaystyleMode("Auto")
			end
		end),
	}, "Dropdown_SAP_PlaystyleMode")

	rightSection:Toggle({
		Name = "Cast Damage While Waiting Buff",
		Default = autoSkill.IsCastDamageWhileWaitingBuffEnabled(),
		Callback = autoSave.Wrap(function(state)
			autoSkill.SetCastDamageWhileWaitingBuff(state)
		end),
	}, "Toggle_SAP_CastDamageWhileWaitingBuff")

	rightSection:Toggle({
		Name = "Auto Jump When Stuck",
		Default = smartAutoPlay.autoFarm.IsAutoJumpOnStuckEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartAutoPlay.autoFarm.SetAutoJumpOnStuck(state)
		end),
	}, "Toggle_SAP_AutoJumpOnStuck")

	rightSection:Toggle({
		Name = "Enable Post-Dodge Reposition (Open Space)",
		Default = smartAutoPlay.IsOpenSpaceEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartAutoPlay.SetOpenSpaceEnabled(state)
		end),
	}, "Toggle_SAP_OpenSpace")

	rightSection:Toggle({
		Name = "Enable Combat Micro-Strafing",
		Default = smartAutoPlay.IsMicroStrafingEnabled(),
		Callback = autoSave.Wrap(function(state)
			smartAutoPlay.SetMicroStrafing(state)
		end),
	}, "Toggle_SAP_MicroStrafing")

	ui.PatchSliderLoadCallback(rightSection:Slider({
		Name = "Reposition Radius Mult",
		Suffix = "x",
		Default = smartAutoPlay.GetRepositionRadiusMultiplier(),
		Minimum = 1.0,
		Maximum = 2.5,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			smartAutoPlay.SetRepositionRadiusMultiplier(val)
		end),
	}, "Slider_SAP_RepositionRadiusMult"))


	ui.PatchSliderLoadCallback(rightSection:Slider({
		Name = "Cast Interval",
		Suffix = " s",
		Default = autoSkill.GetInterval(),
		Minimum = 0.05,
		Maximum = 1.0,
		DisplayMethod = "Round",
		Precision = 2,
		Callback = autoSave.Wrap(function(val)
			autoSkill.SetInterval(val)
		end),
	}, "Slider_SAP_CastInterval"))

	ui.PatchSliderLoadCallback(rightSection:Slider({
		Name = "Buff Cast Delay",
		Suffix = " s",
		Default = autoSkill.GetBuffDelay(),
		Minimum = 0.05,
		Maximum = 1.0,
		DisplayMethod = "Round",
		Precision = 2,
		Callback = autoSave.Wrap(function(val)
			autoSkill.SetBuffDelay(val)
		end),
	}, "Slider_SAP_BuffDelay"))

	ui.PatchSliderLoadCallback(rightSection:Slider({
		Name = "Combo CD Override (0 = Auto)",
		Suffix = " s",
		Default = autoSkill.GetComboCooldownOverride(),
		Minimum = 0,
		Maximum = 60,
		DisplayMethod = "Round",
		Precision = 1,
		Callback = autoSave.Wrap(function(val)
			autoSkill.SetComboCooldownOverride(val)
		end),
	}, "Slider_SAP_ComboCDOverride"))

	rightSection:Button({
		Name = "Scan / Refresh Equipped Skills",
		Callback = function()
			autoSkill.ScanEquippedSkills()
		end,
	})

	-- System Monitor
	rightSection:Header({ Name = "Real-time System Monitor" })

	local stateMonitorLabel = rightSection:Label({
		Text = "State: <font color='rgb(160, 160, 160)'>Disabled</font>",
	})

	local targetMonitorLabel = rightSection:Label({
		Text = "Target: <font color='rgb(160, 160, 160)'>None</font>",
	})

	local dodgeMonitorLabel = rightSection:Label({
		Text = "Smart Dodge: <font color='rgb(160, 160, 160)'>Offline</font>",
	})

	local playstyleMonitorLabel = rightSection:Label({
		Text = "Playstyle: <font color='rgb(160, 160, 160)'>Scanning...</font>",
	})

	local skillsMonitorLabel = rightSection:Label({
		Text = "Skills: <font color='rgb(160, 160, 160)'>Scanning...</font>",
	})

	local comboCdMonitorLabel = rightSection:Label({
		Text = "Combo CD: <font color='rgb(0, 255, 120)'>Ready</font>",
	})

	-- Cập nhật real-time toàn bộ trạng thái Master
	local function updateAllStatus(info)
		pcall(function()
			if not info.enabled then
				masterStatusLabel:UpdateName("Status: <font color='rgb(160, 160, 160)'>Disabled</font>")
				stateMonitorLabel:UpdateName("State: <font color='rgb(160, 160, 160)'>Disabled</font>")
				targetMonitorLabel:UpdateName("Target: <font color='rgb(160, 160, 160)'>None</font>")
				dodgeMonitorLabel:UpdateName("Smart Dodge: <font color='rgb(160, 160, 160)'>Offline</font>")
			elseif info.state == "Dodging" then
				local text = string.format("Status: <font color='rgb(255, 65, 65)'>🛡️ DODGING! Hazard: %s (%.1f std)</font>",
					info.hazardName or "Hazard", info.escapeDist or 0)
				masterStatusLabel:UpdateName(text)
				stateMonitorLabel:UpdateName("State: <font color='rgb(255, 65, 65)'>🛡️ DODGING (Safe Spot Escape)</font>")
				targetMonitorLabel:UpdateName(info.targetName and string.format("Target: %s (%.1f std)", info.targetName, info.targetDist or 0) or "Target: In Range")
			elseif info.state == "Repositioning" then
				local targetText = info.targetName and string.format("%s (%.1f std)", info.targetName, info.targetDist or 0) or "In Range"
				masterStatusLabel:UpdateName(string.format("Status: <font color='rgb(0, 150, 255)'>🔵 REPOSITIONING: Moving to Open Space (%.1fm)</font>", info.escapeDist or 0))
				stateMonitorLabel:UpdateName(string.format("State: <font color='rgb(0, 150, 255)'>🔵 Repositioning to Open Space (%.1fm)</font>", info.escapeDist or 0))
				targetMonitorLabel:UpdateName("Target: " .. targetText)
				dodgeMonitorLabel:UpdateName("Smart Dodge: <font color='rgb(0, 255, 120)'>Standby (Ready Frame-0)</font>")
			elseif info.state == "HoldingRadius" then
				local targetText = info.targetName and string.format("%s (%.1f std)", info.targetName, info.targetDist or 0) or "In Range"
				masterStatusLabel:UpdateName(string.format("Status: <font color='rgb(0, 225, 255)'>🎯 HOLDING RADIUS: Maintaining %.1f std on %s</font>", info.radius or 15.0, targetText))
				stateMonitorLabel:UpdateName("State: <font color='rgb(0, 225, 255)'>🎯 HOLDING RADIUS (Kiting & Casting)</font>")
				targetMonitorLabel:UpdateName("Target: " .. targetText)
				dodgeMonitorLabel:UpdateName("Smart Dodge: <font color='rgb(0, 255, 120)'>Standby (Ready Frame-0)</font>")
			elseif info.state == "Orbiting" then
				local targetText = info.targetName and string.format("%s (%.1f std)", info.targetName, info.targetDist or 0) or "Mobs"
				masterStatusLabel:UpdateName(string.format("Status: <font color='rgb(0, 225, 255)'>🌀 ORBITING: Grouping %s (%.1f std)</font>", targetText, info.radius or 15.0))
				stateMonitorLabel:UpdateName("State: <font color='rgb(0, 225, 255)'>🌀 ORBITING (Mob Grouping & Casting)</font>")
				targetMonitorLabel:UpdateName("Target: " .. targetText)
				dodgeMonitorLabel:UpdateName("Smart Dodge: <font color='rgb(0, 255, 120)'>Standby (Ready Frame-0)</font>")
			elseif info.state == "Strafing" then
				local targetText = info.targetName and string.format("%s (%.1f std)", info.targetName, info.targetDist or 0) or "In Range"
				masterStatusLabel:UpdateName(string.format("Status: <font color='rgb(0, 255, 180)'>⚡ STRAFING: Micro-stepping & Casting on %s</font>", targetText))
				stateMonitorLabel:UpdateName("State: <font color='rgb(0, 255, 180)'>⚡ STRAFING (Preemptive Micro-Step)</font>")
				targetMonitorLabel:UpdateName("Target: " .. targetText)
				dodgeMonitorLabel:UpdateName("Smart Dodge: <font color='rgb(0, 255, 120)'>Standby (Ready Frame-0)</font>")
			elseif info.state == "InCombat" then
				local targetText = info.targetName and string.format("%s (%.1f std)", info.targetName, info.targetDist or 0) or "In Range"
				masterStatusLabel:UpdateName(string.format("Status: <font color='rgb(0, 255, 120)'>⚔️ IN COMBAT: Casting on %s</font>", targetText))
				stateMonitorLabel:UpdateName("State: <font color='rgb(0, 255, 120)'>⚔️ IN COMBAT (Casting & Holding)</font>")
				targetMonitorLabel:UpdateName("Target: " .. targetText)
				dodgeMonitorLabel:UpdateName("Smart Dodge: <font color='rgb(0, 255, 120)'>Standby (Ready Frame-0)</font>")
			elseif info.state == "WaitingHazard" then
				local targetText = info.targetName and string.format("%s (%.1f std)", info.targetName, info.targetDist or 0) or "Target"
				local text = string.format("Status: <font color='rgb(255, 170, 0)'>⏳ WAITING: %s blocking path (Holding Safe Spot)</font>",
					info.hazardName or "Skill")
				masterStatusLabel:UpdateName(text)
				stateMonitorLabel:UpdateName(string.format("State: <font color='rgb(255, 170, 0)'>⏳ Waiting Hazard (%s)</font>", info.hazardName or "Skill"))
				targetMonitorLabel:UpdateName("Target: " .. targetText)
				dodgeMonitorLabel:UpdateName("Smart Dodge: <font color='rgb(0, 255, 120)'>Holding Safe Spot</font>")
			elseif info.state == "EnteringArena" then
				local targetText = info.targetName and string.format("%s (%.1f std)", info.targetName, info.targetDist or 0) or "Boss 1"
				local text = string.format("Status: <font color='rgb(0, 210, 255)'>🏟️ ENTERING ARENA: Dropping inside Boss 1 Arena (%s)</font>", targetText)
				masterStatusLabel:UpdateName(text)
				stateMonitorLabel:UpdateName("State: <font color='rgb(0, 210, 255)'>🏟️ Entering Boss 1 Arena</font>")
				targetMonitorLabel:UpdateName("Target: " .. targetText)
				dodgeMonitorLabel:UpdateName("Smart Dodge: <font color='rgb(0, 255, 120)'>Standby (Ready Frame-0)</font>")
			elseif info.state == "Approaching" then
				local targetText = info.targetName and string.format("%s (%.1f std)", info.targetName, info.targetDist or 0) or "Searching"
				masterStatusLabel:UpdateName(string.format("Status: <font color='rgb(0, 210, 255)'>🏃 APPROACHING: Moving to %s</font>", targetText))
				stateMonitorLabel:UpdateName("State: <font color='rgb(0, 210, 255)'>🏃 APPROACHING (AutoFarm Pathfind)</font>")
				targetMonitorLabel:UpdateName("Target: " .. targetText)
				dodgeMonitorLabel:UpdateName("Smart Dodge: <font color='rgb(0, 255, 120)'>Standby (Ready Frame-0)</font>")
			elseif info.state == "RoomCleared" then
				masterStatusLabel:UpdateName("Status: <font color='rgb(255, 200, 0)'>🏆 ROOM CLEARED: Waiting for enemies</font>")
				stateMonitorLabel:UpdateName("State: <font color='rgb(255, 200, 0)'>🏆 Room Cleared</font>")
				targetMonitorLabel:UpdateName("Target: None (All Dead)")
				dodgeMonitorLabel:UpdateName("Smart Dodge: <font color='rgb(0, 255, 120)'>Standby</font>")
			elseif info.state == "Dead" then
				masterStatusLabel:UpdateName("Status: <font color='rgb(220, 60, 60)'>💀 DEAD: Waiting for respawn</font>")
				stateMonitorLabel:UpdateName("State: <font color='rgb(220, 60, 60)'>💀 Dead</font>")
				targetMonitorLabel:UpdateName("Target: None")
				dodgeMonitorLabel:UpdateName("Smart Dodge: <font color='rgb(160, 160, 160)'>Paused</font>")
			else
				masterStatusLabel:UpdateName("Status: <font color='rgb(160, 160, 160)'>Idle</font>")
				stateMonitorLabel:UpdateName("State: <font color='rgb(160, 160, 160)'>Idle</font>")
				targetMonitorLabel:UpdateName("Target: None")
				dodgeMonitorLabel:UpdateName("Smart Dodge: <font color='rgb(0, 255, 120)'>Standby</font>")
			end
		end)
	end

	-- Cập nhật real-time thông tin Skill & Playstyle
	local function updateSkillStatus(info)
		pcall(function()
			local style = info.playstyle
			local isSkillOn = smartAutoPlay.IsAutoSkillEnabled()
			local styleText
			if not isSkillOn then
				styleText = "<font color='rgb(160, 160, 160)'>Disabled (Auto Skill Off)</font>"
			elseif style == "BuffAndDamage" then
				styleText = "<font color='rgb(0, 210, 255)'>🛡️ Buff + Damage (Inner Buff Combo)</font>"
			else
				styleText = "<font color='rgb(255, 180, 50)'>⚔️ Full Damage (Q & E Spam)</font>"
			end
			playstyleMonitorLabel:UpdateName("Playstyle: " .. styleText)

			local q = info.skillQ or {}
			local e = info.skillE or {}
			local qBadge = q.isBuff and "<font color='rgb(0, 210, 255)'>[Buff]</font>" or "<font color='rgb(255, 100, 100)'>[Dame]</font>"
			local eBadge = e.isBuff and "<font color='rgb(0, 210, 255)'>[Buff]</font>" or "<font color='rgb(255, 100, 100)'>[Dame]</font>"
			local qCdText = string.format("%.1fs", q.cooldown or 15)
			local eCdText = string.format("%.1fs", e.cooldown or 15)

			skillsMonitorLabel:UpdateName(string.format("Skills: Q: %s %s (%s) | E: %s %s (%s)",
				q.name or "None", qBadge, qCdText,
				e.name or "None", eBadge, eCdText
			))

			if not isSkillOn then
				comboCdMonitorLabel:UpdateName("Combo CD: <font color='rgb(160, 160, 160)'>Disabled</font>")
			elseif style == "BuffAndDamage" then
				local rem = info.cooldownRemaining or 0
				if rem > 0 then
					comboCdMonitorLabel:UpdateName(string.format("Combo CD: <font color='rgb(255, 160, 50)'>⏳ %.1fs remaining</font>", rem))
				else
					comboCdMonitorLabel:UpdateName("Combo CD: <font color='rgb(0, 255, 120)'>⚡ Ready to Cast</font>")
				end
			else
				comboCdMonitorLabel:UpdateName("Combo CD: <font color='rgb(160, 160, 160)'>N/A (Full Damage Mode)</font>")
			end
		end)
	end

	smartAutoPlay.OnMasterStatusChanged(function(info)
		updateAllStatus(info)
		pcall(function()
			if masterToggle and masterToggle.GetState and masterToggle:GetState() ~= info.enabled then
				masterToggle:UpdateState(info.enabled)
			end
		end)
		updateSkillStatus(autoSkill.GetStatus())
	end)
	updateAllStatus(smartAutoPlay.GetMasterStatus())

	autoSkill.OnStatusChanged(updateSkillStatus)
	updateSkillStatus(autoSkill.GetStatus())
end
