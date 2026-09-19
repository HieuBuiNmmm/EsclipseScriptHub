-- Evasion Engine (DungeonQuest) – Facade Architecture:
-- Entry-point chính kết nối các tầng: Detection, Spatial, Solver, Controller, Visuals.
-- Hệ thống né đòn & thoát hiểm thông minh (Threat Detection, Trajectory Prediction, Safe Spot Engine & Auto-Dodge).

--// Imports
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local zoneGuard = require("@routes/DungeonQuest/core/zoneGuard")

-- Layer 1: Input & Entity Lifecycle
local detection = require("@routes/DungeonQuest/core/evasion/detection/detection")

-- Layer 2: Spatial Math & Motion Tracking
local geometry = require("@routes/DungeonQuest/core/evasion/spatial/geometry")
local trajectory = require("@routes/DungeonQuest/core/evasion/spatial/trajectory")

-- Layer 3: Threat Evaluation & Safe Spot Engine
local playerHitbox = require("@routes/DungeonQuest/core/evasion/solver/playerHitbox")
local safeSpot = require("@routes/DungeonQuest/core/evasion/solver/safeSpot")

-- Layer 4: Action Execution
local dodgeController = require("@routes/DungeonQuest/core/evasion/controller/dodgeController")

-- Layer 5: Passive Visuals & Debug Renderers
local groundVisual = require("@routes/DungeonQuest/core/evasion/visuals/groundVisual")
local playerVisual = require("@routes/DungeonQuest/core/evasion/visuals/playerVisual")
local timerVisual = require("@routes/DungeonQuest/core/evasion/visuals/timerVisual")

--// Table
local evasion = {}

--// Bind data sources (tránh circular dependency)
geometry.BindDetection(detection)
groundVisual.BindDetection(detection)
groundVisual.BindTrajectory(trajectory)
trajectory.BindDetection(detection)
timerVisual.BindDetection(detection)

--// Geometry (Danger Zones)
evasion.IsPointInAnyHazard = geometry.IsPointInAnyHazard
evasion.GetHazardPadding = geometry.GetHazardPadding
evasion.SetHazardPadding = geometry.SetHazardPadding
evasion.GetHitboxPadding = geometry.GetHazardPadding
evasion.SetHitboxPadding = geometry.SetHazardPadding
evasion.GetTrajectoryMargin = geometry.GetTrajectoryMargin
evasion.SetTrajectoryMargin = geometry.SetTrajectoryMargin
evasion.GetHazardZones = geometry.GetHazardZones
evasion.GetNearbyHazards = geometry.GetNearbyHazards
evasion.AddForceCircleName = geometry.AddForceCircleName
evasion.GetForceCircleNames = geometry.GetForceCircleNames
evasion.IsForceCircle = geometry.IsForceCircle
evasion.IsSecondBossCircleChain = geometry.IsSecondBossCircleChain
evasion.GetSecondBossCircleDuration = geometry.GetSecondBossCircleDuration
evasion.SetSecondBossCircleDuration = geometry.SetSecondBossCircleDuration

--// Player Hitbox & Danger Detection
evasion.IsPlayerInDanger = playerHitbox.IsPlayerInDanger
evasion.GetPlayerThreat = playerHitbox.GetCurrentThreat
evasion.OnPlayerDangerChanged = playerHitbox.OnDangerStatusChanged
evasion.SetPlayerHitboxRadius = playerHitbox.SetRadius
evasion.GetPlayerHitboxRadius = playerHitbox.GetRadius

--// Player 2D Visualizer
evasion.SetPlayerVisualEnabled = playerVisual.SetVisualEnabled
evasion.IsPlayerVisualEnabled = playerVisual.IsVisualEnabled

--// Safe Spot Engine (Radial Escape)
evasion.FindNearestSafeSpot = safeSpot.FindNearestSafeSpot
evasion.IsPointSafe = safeSpot.IsPointSafe
evasion.GetLastSafeSpot = safeSpot.GetLastSafeSpot
evasion.OnSafeSpotChanged = safeSpot.OnSafeSpotChanged
evasion.SetSafeSpotVisualEnabled = safeSpot.SetVisualEnabled
evasion.IsSafeSpotVisualEnabled = safeSpot.IsVisualEnabled
evasion.SetSafeSpotEnabled = safeSpot.SetEnabled
evasion.IsSafeSpotEnabled = safeSpot.IsEnabled
evasion.SetSafeSpotBuffer = safeSpot.SetSafetyBuffer
evasion.GetSafeSpotBuffer = safeSpot.GetSafetyBuffer
evasion.SetShowCandidates = safeSpot.SetShowCandidates
evasion.IsShowCandidates = safeSpot.IsShowCandidates
evasion.SetFinePassEnabled = safeSpot.SetFinePassEnabled
evasion.IsFinePassEnabled = safeSpot.IsFinePassEnabled
evasion.SetFallbackPassEnabled = safeSpot.SetFallbackPassEnabled
evasion.IsFallbackPassEnabled = safeSpot.IsFallbackPassEnabled
evasion.ClearSafeSpot = safeSpot.Clear

--// Auto Dodge Controller (MoveTo + Final Snap)
evasion.SetAutoDodgeEnabled = dodgeController.SetEnabled
evasion.IsAutoDodgeEnabled = dodgeController.IsEnabled
evasion.SetDodgeSnapDistance = dodgeController.SetSnapDistance
evasion.GetDodgeSnapDistance = dodgeController.GetSnapDistance
evasion.IsCurrentlyDodging = dodgeController.IsDodging
evasion.OnDodgeStateChanged = dodgeController.OnDodgeStateChanged
evasion.ClearDodge = dodgeController.Clear

--// Ground Visualizer (Debug Danger Zones)
evasion.SetVisualizerEnabled = groundVisual.SetEnabled
evasion.IsVisualizerEnabled = groundVisual.IsEnabled
evasion.RefreshVisuals = groundVisual.RefreshAll

--// Trajectory Visualizer (Orange Corridor)
evasion.SetTrajectoryEnabled = trajectory.SetEnabled
evasion.IsTrajectoryEnabled = trajectory.IsEnabled
evasion.SetTrajectoryLength = trajectory.SetPredictionLength
evasion.GetTrajectoryLength = trajectory.GetPredictionLength
evasion.GetHazardTrajectoryLength = trajectory.GetHazardPredictionLength
evasion.GetCustomTrajectoryLength = trajectory.GetCustomLength
evasion.SetCustomTrajectoryLength = trajectory.SetCustomLength
evasion.GetSecondBossBeamLength = trajectory.GetSecondBossBeamLength
evasion.SetSecondBossBeamLength = trajectory.SetSecondBossBeamLength
evasion.GetFirstBossBigSpikeWidth = trajectory.GetFirstBossBigSpikeWidth
evasion.SetFirstBossBigSpikeWidth = trajectory.SetFirstBossBigSpikeWidth
evasion.GetFirstBossSeekingSpikeWidth = trajectory.GetFirstBossSeekingSpikeWidth
evasion.SetFirstBossSeekingSpikeWidth = trajectory.SetFirstBossSeekingSpikeWidth
evasion.GetCustomTrajectoryWidth = trajectory.GetCustomWidth
evasion.SetCustomTrajectoryWidth = trajectory.SetCustomWidth
evasion.RefreshTrajectory = trajectory.RefreshAll
evasion.IsPointInAnyTrajectory = trajectory.IsPointInAnyTrajectory
evasion.GetNearbyTrajectories = trajectory.GetNearbyTrajectories

--// 3D Selection Box (Parts)
evasion.SetSelectionBoxesEnabled = detection.SetSelectionBoxesEnabled
evasion.IsSelectionBoxesEnabled = detection.IsSelectionBoxesEnabled

--// 3D Lifespan Timer Visualizer (Real-time Danger Zone Duration)
evasion.SetTimerVisualEnabled = timerVisual.SetEnabled
evasion.IsTimerVisualEnabled = timerVisual.IsEnabled
evasion.RefreshTimerVisuals = timerVisual.RefreshAll

--// Detection (Scan + SelectionBox)
evasion.StartDetection = detection.StartScan
evasion.StopDetection = detection.StopScan
evasion.IsDetectionEnabled = detection.IsEnabled
evasion.SetDetectionEnabled = detection.SetEnabled

evasion.SetLogHazards = detection.SetLogHazards
evasion.IsLogHazardsEnabled = detection.IsLogHazardsEnabled
-- Backward compatibility aliases
evasion.SetLogThreats = evasion.SetLogHazards
evasion.IsLogThreatsEnabled = evasion.IsLogHazardsEnabled

evasion.SetLogFailed = detection.SetLogFailed
evasion.IsLogFailedEnabled = detection.IsLogFailedEnabled

--// Skill Deep Inspector (Debug By Name)
evasion.SetInspectTarget = detection.SetInspectTarget
evasion.GetInspectTarget = detection.GetInspectTarget
evasion.SetInspectEnabled = detection.SetInspectEnabled
evasion.IsInspectEnabled = detection.IsInspectEnabled

evasion.GetHazardCount = detection.GetHazardCount
evasion.GetActiveHazards = detection.GetActiveHazards
evasion.GetLastHazardInfo = detection.GetLastHazardInfo
evasion.OnHazardChanged = detection.OnHazardChanged
evasion.ClearAllHazards = detection.ClearAllHazards
evasion.TriggerRoomTransition = detection.TriggerRoomTransition
evasion.IsRoomTransitioning = detection.IsRoomTransitioning

--// Bật scanner / evasion: bắt đầu quét Workspace
function evasion.StartScan()
	if not zoneGuard.IsDungeon() then return end
	detection.StartScan()
end

--// Tắt scanner / evasion: dừng quét + dọn visual
function evasion.StopScan()
	detection.StopScan()
end

--// Toggle độc lập (UI)
function evasion.Toggle(state)
	if state then
		evasion.StartScan()
	else
		evasion.StopScan()
	end
end

function evasion.IsEnabled()
	return detection.IsEnabled()
end

--// Register with ZoneGuard
zoneGuard.Register({
	Name = "Evasion",
	Zone = "Dungeon",
	OnLeave = function()
		detection.StopScan()
	end,
	OnEnter = function()
		if detection.IsEnabled() then
			detection.StartScan()
		end
	end,
})

--// Dọn dẹp toàn diện khi shutdown
lifecycle.Register(function()
	detection.StopScan()
end)

return evasion