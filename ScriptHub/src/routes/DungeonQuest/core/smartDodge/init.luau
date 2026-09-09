-- Smart Dodge (DungeonQuest) – Facade: tổng hợp 6 module nhỏ thành API pública đầy đủ.
-- Các module thành phần: detection (quét hiểm họa) / geometry (hit-test) / safeSpot
-- (tính điểm an toàn + visual) / dodge (Walk+Snap) / engine (orchestrator).
-- Đường dẫn require "@routes/DungeonQuest/core/smartDodge" vẫn giữ nguyên (init.luau).

--// Imports
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local coordinator = require("@routes/DungeonQuest/core/coordinator")
local detection = require("@routes/DungeonQuest/core/smartDodge/detection")
local geometry = require("@routes/DungeonQuest/core/smartDodge/geometry")
local safeSpot = require("@routes/DungeonQuest/core/smartDodge/safeSpot")
local dodge = require("@routes/DungeonQuest/core/smartDodge/dodge")
local engine = require("@routes/DungeonQuest/core/smartDodge/engine")
local targetFacing = require("@routes/DungeonQuest/core/smartDodge/targetFacing")
local speedDebugHud = require("@routes/DungeonQuest/core/smartDodge/speedDebugHud")
local shared = require("@routes/DungeonQuest/core/shared")

--// Table
local smartDodge = {}

--// Threat Detection (Module 1)
smartDodge.AddCustomHazard = detection.AddCustomHazard
smartDodge.AddTrajectoryProjectile = detection.AddTrajectoryProjectile
smartDodge.SetTrajectoryLookahead = detection.SetTrajectoryLookahead
smartDodge.GetTrajectoryLookahead = detection.GetTrajectoryLookahead
smartDodge.SetTrajectoryWidthPadding = detection.SetTrajectoryWidthPadding
smartDodge.GetTrajectoryWidthPadding = detection.GetTrajectoryWidthPadding
smartDodge.RegisterPlayerSkill = detection.RegisterPlayerSkill
smartDodge.GetActiveBossOrb = detection.GetActiveBossOrb

smartDodge.SetLogHazards = detection.SetLogHazards
smartDodge.IsLogHazardsEnabled = detection.IsLogHazardsEnabled
-- Backward compatibility aliases
smartDodge.SetLogThreats = smartDodge.SetLogHazards
smartDodge.IsLogThreatsEnabled = smartDodge.IsLogHazardsEnabled

smartDodge.SetVisualEsp = detection.SetVisualEsp
smartDodge.IsVisualEspEnabled = detection.IsVisualEspEnabled
smartDodge.SetShowSkillTimers = detection.SetShowSkillTimers
smartDodge.IsShowSkillTimersEnabled = detection.IsShowSkillTimersEnabled
smartDodge.SetAutoLearnSkillLifetimes = detection.SetAutoLearnSkillLifetimes
smartDodge.IsAutoLearnSkillLifetimesEnabled = detection.IsAutoLearnSkillLifetimesEnabled
smartDodge.GetHazardTimeRemaining = detection.GetHazardTimeRemaining
smartDodge.GetSkillProfile = detection.GetSkillProfile
smartDodge.GetAllSkillProfiles = detection.GetAllSkillProfiles
smartDodge.SaveSkillProfiles = detection.SaveSkillProfiles
smartDodge.LoadSkillProfiles = detection.LoadSkillProfiles

smartDodge.GetHazardCount = detection.GetHazardCount
smartDodge.GetActiveHazards = detection.GetActiveHazards
smartDodge.GetLastHazardInfo = detection.GetLastHazardInfo
smartDodge.OnHazardChanged = detection.OnHazardChanged

--// Safe Spot (Module 3+4)
smartDodge.CalculateSafeSpot = safeSpot.CalculateSafeSpot
smartDodge.SetShowSafeMarker = safeSpot.SetShowSafeMarker
smartDodge.IsShowSafeMarkerEnabled = safeSpot.IsShowSafeMarkerEnabled
smartDodge.SetShowPlayerRadar = safeSpot.SetShowPlayerRadar
smartDodge.IsShowPlayerRadarEnabled = safeSpot.IsShowPlayerRadarEnabled
smartDodge.UpdatePlayerRadar = safeSpot.UpdatePlayerRadar
smartDodge.ClearPlayerRadar = safeSpot.ClearPlayerRadar
smartDodge.SetShowHitboxVisual = safeSpot.SetShowHitboxVisual
smartDodge.IsShowHitboxVisualEnabled = safeSpot.IsShowHitboxVisualEnabled
smartDodge.SetHitboxPadding = safeSpot.SetHitboxPadding
smartDodge.GetHitboxPadding = geometry.GetHitboxPadding
smartDodge.GetBoss1ArenaCenter = safeSpot.GetBoss1ArenaCenter
smartDodge.GetBoss1ArenaRadius = safeSpot.GetBoss1ArenaRadius

--// Dodge (Module 5)
smartDodge.SetAutoDodge = dodge.SetAutoDodge
smartDodge.IsAutoDodgeEnabled = dodge.IsAutoDodgeEnabled
smartDodge.SetDodgeMode = dodge.SetDodgeMode
smartDodge.GetDodgeMode = dodge.GetDodgeMode
smartDodge.SetBlinkStep = dodge.SetBlinkStep
smartDodge.GetBlinkStep = dodge.GetBlinkStep
smartDodge.SetMaxSnapDistance = dodge.SetMaxSnapDistance
smartDodge.GetMaxSnapDistance = dodge.GetMaxSnapDistance
smartDodge.SetMaxTeleportStep = dodge.SetMaxTeleportStep
smartDodge.GetMaxTeleportStep = dodge.GetMaxTeleportStep
smartDodge.SetMaintainSnapHeight = dodge.SetMaintainSnapHeight
smartDodge.IsMaintainSnapHeightEnabled = dodge.IsMaintainSnapHeightEnabled
smartDodge.IsDodging = dodge.IsDodging
smartDodge.SetFaceTargetProvider = dodge.SetFaceTargetProvider
smartDodge.GetDodgeStatus = dodge.GetStatus
smartDodge.OnDodgeStatusChanged = dodge.OnDodgeStatusChanged
smartDodge.Cancel = dodge.Cancel

--// Panic Sprint (Kích tốc né nguy cấp)
smartDodge.SetPanicSprintEnabled = dodge.SetPanicSprintEnabled
smartDodge.IsPanicSprintEnabled = dodge.IsPanicSprintEnabled
smartDodge.SetPanicSpeed = dodge.SetPanicSpeed
smartDodge.GetPanicSpeed = dodge.GetPanicSpeed
smartDodge.SetPanicDuration = dodge.SetPanicDuration
smartDodge.GetPanicDuration = dodge.GetPanicDuration
smartDodge.SetPanicCooldown = dodge.SetPanicCooldown
smartDodge.GetPanicCooldown = dodge.GetPanicCooldown
smartDodge.IsPanicActive = dodge.IsPanicActive

--// Speed Debug HUD (Màn hình chơi)
smartDodge.SetSpeedDebugHudEnabled = speedDebugHud.SetEnabled
smartDodge.IsSpeedDebugHudEnabled = speedDebugHud.IsEnabled

--// Target Facing
smartDodge.SetAutoFaceTarget = targetFacing.SetEnabled
smartDodge.IsAutoFaceTargetEnabled = targetFacing.IsEnabled
smartDodge.GetTargetPosition = targetFacing.GetTargetPosition
-- Backward compatibility aliases
smartDodge.SetAutoFaceBoss = smartDodge.SetAutoFaceTarget
smartDodge.IsAutoFaceBossEnabled = smartDodge.IsAutoFaceTargetEnabled
smartDodge.GetBossPosition = smartDodge.GetTargetPosition
smartDodge.IsTargetActive = targetFacing.IsTargetActive
smartDodge.IsBossActive = targetFacing.IsTargetActive

--// Engine (Module 6)
smartDodge.StartEngine = engine.StartEngine
smartDodge.StopEngine = engine.StopEngine
smartDodge.Toggle = engine.Toggle
smartDodge.IsEnabled = engine.IsEnabled
smartDodge.SetLogInDanger = engine.SetLogInDanger
smartDodge.IsLogInDangerEnabled = engine.IsLogInDangerEnabled
smartDodge.IsInDanger = engine.IsInDanger
smartDodge.GetCurrentSafeSpot = engine.GetCurrentSafeSpot
smartDodge.OnSafeSpotChanged = engine.OnSafeSpotChanged

--// Invulnerability & Respawn Protection
smartDodge.SetIgnoreDodgeWhenInvulnerable = engine.SetIgnoreDodgeWhenInvulnerable
smartDodge.IsIgnoreDodgeWhenInvulnerableEnabled = engine.IsIgnoreDodgeWhenInvulnerableEnabled
smartDodge.SetRespawnProtectionDuration = shared.SetRespawnProtectionDuration
smartDodge.GetRespawnProtectionDuration = shared.GetRespawnProtectionDuration
smartDodge.GetRespawnProtectionRemaining = shared.GetRespawnProtectionRemaining
smartDodge.IsInvulnerable = shared.IsInvulnerable
smartDodge.IsDead = shared.IsDead

--// Đăng ký với coordinator: khi hệ thống khác (Auto Farm) chiếm độc quyền thì engine Smart Dodge
--// bị tắt qua StopEngine; IsEnabled dùng để coordinator biết engine đang chạy.
coordinator.Register("SmartDodge", smartDodge.StopEngine, smartDodge.IsEnabled)

--// Dọn dẹp toàn diện khi shutdown
lifecycle.Register(function()
	engine.Shutdown()
end)

return smartDodge