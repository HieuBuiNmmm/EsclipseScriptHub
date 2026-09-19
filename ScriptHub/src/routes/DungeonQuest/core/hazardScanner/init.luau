-- HazardScanner (DungeonQuest) – Facade: quét hiểm họa + vẽ SelectionBox đơn giản.
-- Đơn giản hóa hoàn toàn: chỉ phát hiện đối tượng xuất hiện trong Workspace qua
-- ChildAdded/ChildRemoved sau sự kiện start dungeon, vẽ SelectionBox quanh từng đối tượng.
-- Không còn trajectory / whitelist / boss orb / ngoại lệ / hitbox padding / tên 3D.
-- Đường dẫn require "@routes/DungeonQuest/core/hazardScanner" vẫn giữ nguyên (init.luau).

--// Imports
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local detection = require("@routes/DungeonQuest/core/hazardScanner/detection")
local geometry = require("@routes/DungeonQuest/core/hazardScanner/geometry")
local visualizer = require("@routes/DungeonQuest/core/hazardScanner/visualizer")
local trajectory = require("@routes/DungeonQuest/core/hazardScanner/trajectory")
local playerVisual = require("@routes/DungeonQuest/core/hazardScanner/playerVisual")
local safeSpot = require("@routes/DungeonQuest/core/hazardScanner/safeSpot")
local dodgeController = require("@routes/DungeonQuest/core/hazardScanner/dodgeController")
local timerVisual = require("@routes/DungeonQuest/core/hazardScanner/timerVisual")

--// Table
local hazardScanner = {}

--// Bind data sources (tranh vong phu thuoc)
geometry.BindDetection(detection)
visualizer.BindDetection(detection)
visualizer.BindTrajectory(trajectory)
trajectory.BindDetection(detection)
timerVisual.BindDetection(detection)

--// Geometry (Danger Zones)
hazardScanner.IsPointInAnyHazard = geometry.IsPointInAnyHazard
hazardScanner.GetHazardPadding = geometry.GetHazardPadding
hazardScanner.SetHazardPadding = geometry.SetHazardPadding
hazardScanner.GetHitboxPadding = geometry.GetHazardPadding
hazardScanner.SetHitboxPadding = geometry.SetHazardPadding
hazardScanner.GetTrajectoryMargin = geometry.GetTrajectoryMargin
hazardScanner.SetTrajectoryMargin = geometry.SetTrajectoryMargin
hazardScanner.GetHazardZones = geometry.GetHazardZones
hazardScanner.GetNearbyHazards = geometry.GetNearbyHazards
hazardScanner.AddForceCircleName = geometry.AddForceCircleName
hazardScanner.GetForceCircleNames = geometry.GetForceCircleNames
hazardScanner.IsForceCircle = geometry.IsForceCircle
hazardScanner.IsSecondBossCircleChain = geometry.IsSecondBossCircleChain
hazardScanner.GetSecondBossCircleDuration = geometry.GetSecondBossCircleDuration
hazardScanner.SetSecondBossCircleDuration = geometry.SetSecondBossCircleDuration

--// Player 2D Visualizer & Danger Detection
hazardScanner.IsPlayerInDanger = playerVisual.IsPlayerInDanger
hazardScanner.GetPlayerThreat = playerVisual.GetCurrentThreat
hazardScanner.OnPlayerDangerChanged = playerVisual.OnDangerStatusChanged
hazardScanner.SetPlayerVisualEnabled = playerVisual.SetVisualEnabled
hazardScanner.IsPlayerVisualEnabled = playerVisual.IsVisualEnabled
hazardScanner.SetPlayerHitboxRadius = playerVisual.SetRadius
hazardScanner.GetPlayerHitboxRadius = playerVisual.GetRadius

--// Safe Spot Engine (Radial Escape)
hazardScanner.FindNearestSafeSpot = safeSpot.FindNearestSafeSpot
hazardScanner.IsPointSafe = safeSpot.IsPointSafe
hazardScanner.GetLastSafeSpot = safeSpot.GetLastSafeSpot
hazardScanner.OnSafeSpotChanged = safeSpot.OnSafeSpotChanged
hazardScanner.SetSafeSpotVisualEnabled = safeSpot.SetVisualEnabled
hazardScanner.IsSafeSpotVisualEnabled = safeSpot.IsVisualEnabled
hazardScanner.SetSafeSpotEnabled = safeSpot.SetEnabled
hazardScanner.IsSafeSpotEnabled = safeSpot.IsEnabled
hazardScanner.SetSafeSpotBuffer = safeSpot.SetSafetyBuffer
hazardScanner.GetSafeSpotBuffer = safeSpot.GetSafetyBuffer
hazardScanner.SetShowCandidates = safeSpot.SetShowCandidates
hazardScanner.IsShowCandidates = safeSpot.IsShowCandidates
hazardScanner.SetFinePassEnabled = safeSpot.SetFinePassEnabled
hazardScanner.IsFinePassEnabled = safeSpot.IsFinePassEnabled
hazardScanner.SetFallbackPassEnabled = safeSpot.SetFallbackPassEnabled
hazardScanner.IsFallbackPassEnabled = safeSpot.IsFallbackPassEnabled
hazardScanner.ClearSafeSpot = safeSpot.Clear

--// Auto Dodge Controller (MoveTo + Final Snap)
hazardScanner.SetAutoDodgeEnabled = dodgeController.SetEnabled
hazardScanner.IsAutoDodgeEnabled = dodgeController.IsEnabled
hazardScanner.SetDodgeSnapDistance = dodgeController.SetSnapDistance
hazardScanner.GetDodgeSnapDistance = dodgeController.GetSnapDistance
hazardScanner.IsCurrentlyDodging = dodgeController.IsDodging
hazardScanner.OnDodgeStateChanged = dodgeController.OnDodgeStateChanged
hazardScanner.ClearDodge = dodgeController.Clear

--// Ground Visualizer (Debug Danger Zones)
hazardScanner.SetVisualizerEnabled = visualizer.SetEnabled
hazardScanner.IsVisualizerEnabled = visualizer.IsEnabled
hazardScanner.RefreshVisuals = visualizer.RefreshAll

--// Trajectory Visualizer (Orange Corridor)
hazardScanner.SetTrajectoryEnabled = trajectory.SetEnabled
hazardScanner.IsTrajectoryEnabled = trajectory.IsEnabled
hazardScanner.SetTrajectoryLength = trajectory.SetPredictionLength
hazardScanner.GetTrajectoryLength = trajectory.GetPredictionLength
hazardScanner.GetHazardTrajectoryLength = trajectory.GetHazardPredictionLength
hazardScanner.GetCustomTrajectoryLength = trajectory.GetCustomLength
hazardScanner.SetCustomTrajectoryLength = trajectory.SetCustomLength
hazardScanner.GetSecondBossBeamLength = trajectory.GetSecondBossBeamLength
hazardScanner.SetSecondBossBeamLength = trajectory.SetSecondBossBeamLength
hazardScanner.GetFirstBossBigSpikeWidth = trajectory.GetFirstBossBigSpikeWidth
hazardScanner.SetFirstBossBigSpikeWidth = trajectory.SetFirstBossBigSpikeWidth
hazardScanner.GetFirstBossSeekingSpikeWidth = trajectory.GetFirstBossSeekingSpikeWidth
hazardScanner.SetFirstBossSeekingSpikeWidth = trajectory.SetFirstBossSeekingSpikeWidth
hazardScanner.GetCustomTrajectoryWidth = trajectory.GetCustomWidth
hazardScanner.SetCustomTrajectoryWidth = trajectory.SetCustomWidth
hazardScanner.RefreshTrajectory = trajectory.RefreshAll
hazardScanner.IsPointInAnyTrajectory = trajectory.IsPointInAnyTrajectory
hazardScanner.GetNearbyTrajectories = trajectory.GetNearbyTrajectories

--// 3D Selection Box (Parts)
hazardScanner.SetSelectionBoxesEnabled = detection.SetSelectionBoxesEnabled
hazardScanner.IsSelectionBoxesEnabled = detection.IsSelectionBoxesEnabled

--// 3D Lifespan Timer Visualizer (Real-time Danger Zone Duration)
hazardScanner.SetTimerVisualEnabled = timerVisual.SetEnabled
hazardScanner.IsTimerVisualEnabled = timerVisual.IsEnabled
hazardScanner.RefreshTimerVisuals = timerVisual.RefreshAll

--// Detection (Scan + SelectionBox)
hazardScanner.StartDetection = detection.StartScan
hazardScanner.StopDetection = detection.StopScan
hazardScanner.IsDetectionEnabled = detection.IsEnabled
hazardScanner.SetDetectionEnabled = detection.SetEnabled

hazardScanner.SetLogHazards = detection.SetLogHazards
hazardScanner.IsLogHazardsEnabled = detection.IsLogHazardsEnabled
-- Backward compatibility aliases
hazardScanner.SetLogThreats = hazardScanner.SetLogHazards
hazardScanner.IsLogThreatsEnabled = hazardScanner.IsLogHazardsEnabled

hazardScanner.SetLogFailed = detection.SetLogFailed
hazardScanner.IsLogFailedEnabled = detection.IsLogFailedEnabled

--// Skill Deep Inspector (Debug By Name)
hazardScanner.SetInspectTarget = detection.SetInspectTarget
hazardScanner.GetInspectTarget = detection.GetInspectTarget
hazardScanner.SetInspectEnabled = detection.SetInspectEnabled
hazardScanner.IsInspectEnabled = detection.IsInspectEnabled

hazardScanner.GetHazardCount = detection.GetHazardCount
hazardScanner.GetActiveHazards = detection.GetActiveHazards
hazardScanner.GetLastHazardInfo = detection.GetLastHazardInfo
hazardScanner.OnHazardChanged = detection.OnHazardChanged
hazardScanner.ClearAllHazards = detection.ClearAllHazards
hazardScanner.TriggerRoomTransition = detection.TriggerRoomTransition
hazardScanner.IsRoomTransitioning = detection.IsRoomTransitioning

--// Bật scanner: bắt đầu quét Workspace
function hazardScanner.StartScan()
	detection.StartScan()
end

--// Tắt scanner: dừng quét + dọn visual
function hazardScanner.StopScan()
	detection.StopScan()
end

--// Toggle độc lập (UI)
function hazardScanner.Toggle(state)
	if state then
		hazardScanner.StartScan()
	else
		hazardScanner.StopScan()
	end
end

function hazardScanner.IsEnabled()
	return detection.IsEnabled()
end

--// Dọn dẹp toàn diện khi shutdown
lifecycle.Register(function()
	detection.StopScan()
end)

return hazardScanner