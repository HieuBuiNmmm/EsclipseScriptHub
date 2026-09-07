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

smartDodge.SetLogHazards = detection.SetLogHazards
smartDodge.IsLogHazardsEnabled = detection.IsLogHazardsEnabled
-- Backward compatibility aliases
smartDodge.SetLogThreats = smartDodge.SetLogHazards
smartDodge.IsLogThreatsEnabled = smartDodge.IsLogHazardsEnabled

smartDodge.SetVisualEsp = detection.SetVisualEsp
smartDodge.IsVisualEspEnabled = detection.IsVisualEspEnabled

smartDodge.GetHazardCount = detection.GetHazardCount
smartDodge.GetActiveHazards = detection.GetActiveHazards
smartDodge.GetLastHazardInfo = detection.GetLastHazardInfo
smartDodge.OnHazardChanged = detection.OnHazardChanged

--// Safe Spot (Module 3+4)
smartDodge.CalculateSafeSpot = safeSpot.CalculateSafeSpot
smartDodge.SetShowSafeMarker = safeSpot.SetShowSafeMarker
smartDodge.IsShowSafeMarkerEnabled = safeSpot.IsShowSafeMarkerEnabled
smartDodge.SetShowHitboxVisual = safeSpot.SetShowHitboxVisual
smartDodge.IsShowHitboxVisualEnabled = safeSpot.IsShowHitboxVisualEnabled
smartDodge.SetHitboxPadding = safeSpot.SetHitboxPadding
smartDodge.GetHitboxPadding = geometry.GetHitboxPadding

--// Dodge (Module 5)
smartDodge.SetAutoDodge = dodge.SetAutoDodge
smartDodge.IsAutoDodgeEnabled = dodge.IsAutoDodgeEnabled
smartDodge.SetDodgeMode = dodge.SetDodgeMode
smartDodge.GetDodgeMode = dodge.GetDodgeMode
smartDodge.SetMaxDodgeTime = dodge.SetMaxDodgeTime
smartDodge.GetMaxDodgeTime = dodge.GetMaxDodgeTime
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

--// Target Facing
smartDodge.SetAutoFaceTarget = targetFacing.SetEnabled
smartDodge.IsAutoFaceTargetEnabled = targetFacing.IsEnabled
smartDodge.GetTargetPosition = targetFacing.GetTargetPosition
-- Backward compatibility aliases
smartDodge.SetAutoFaceBoss = smartDodge.SetAutoFaceTarget
smartDodge.IsAutoFaceBossEnabled = smartDodge.IsAutoFaceTargetEnabled
smartDodge.GetBossPosition = smartDodge.GetTargetPosition
smartDodge.IsBossActive = targetFacing.IsEnabled

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

--// Đăng ký với coordinator: khi hệ thống khác (Auto Farm) chiếm độc quyền thì engine Smart Dodge
--// bị tắt qua StopEngine; IsEnabled dùng để coordinator biết engine đang chạy.
coordinator.Register("SmartDodge", smartDodge.StopEngine, smartDodge.IsEnabled)

--// Dọn dẹp toàn diện khi shutdown
lifecycle.Register(function()
	engine.Shutdown()
end)

return smartDodge