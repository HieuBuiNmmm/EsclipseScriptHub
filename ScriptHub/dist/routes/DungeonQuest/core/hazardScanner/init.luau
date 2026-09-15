






local a=require"@routes/DungeonQuest/core/lifecycle"
local b=require"@routes/DungeonQuest/core/hazardScanner/detection"
local c=require"@routes/DungeonQuest/core/hazardScanner/geometry"
local d=require"@routes/DungeonQuest/core/hazardScanner/visualizer"
local e=require"@routes/DungeonQuest/core/hazardScanner/trajectory"
local f=require"@routes/DungeonQuest/core/hazardScanner/playerVisual"
local g=require"@routes/DungeonQuest/core/hazardScanner/safeSpot"
local h=require"@routes/DungeonQuest/core/hazardScanner/dodgeController"


local i={}


c.BindDetection(b)
d.BindDetection(b)
e.BindDetection(b)


i.IsPointInAnyHazard=c.IsPointInAnyHazard
i.GetHazardPadding=c.GetHazardPadding
i.SetHazardPadding=c.SetHazardPadding
i.GetHitboxPadding=c.GetHazardPadding
i.SetHitboxPadding=c.SetHazardPadding
i.GetHazardZones=c.GetHazardZones
i.GetNearbyHazards=c.GetNearbyHazards
i.AddForceCircleName=c.AddForceCircleName
i.GetForceCircleNames=c.GetForceCircleNames
i.IsForceCircle=c.IsForceCircle


i.IsPlayerInDanger=f.IsPlayerInDanger
i.GetPlayerThreat=f.GetCurrentThreat
i.OnPlayerDangerChanged=f.OnDangerStatusChanged
i.SetPlayerVisualEnabled=f.SetVisualEnabled
i.IsPlayerVisualEnabled=f.IsVisualEnabled
i.SetPlayerHitboxRadius=f.SetRadius
i.GetPlayerHitboxRadius=f.GetRadius


i.FindNearestSafeSpot=g.FindNearestSafeSpot
i.IsPointSafe=g.IsPointSafe
i.GetLastSafeSpot=g.GetLastSafeSpot
i.OnSafeSpotChanged=g.OnSafeSpotChanged
i.SetSafeSpotVisualEnabled=g.SetVisualEnabled
i.IsSafeSpotVisualEnabled=g.IsVisualEnabled
i.SetSafeSpotEnabled=g.SetEnabled
i.IsSafeSpotEnabled=g.IsEnabled
i.SetSafeSpotBuffer=g.SetSafetyBuffer
i.GetSafeSpotBuffer=g.GetSafetyBuffer
i.SetShowCandidates=g.SetShowCandidates
i.IsShowCandidates=g.IsShowCandidates


i.SetAutoDodgeEnabled=h.SetEnabled
i.IsAutoDodgeEnabled=h.IsEnabled
i.SetDodgeSnapDistance=h.SetSnapDistance
i.GetDodgeSnapDistance=h.GetSnapDistance
i.IsCurrentlyDodging=h.IsDodging
i.OnDodgeStateChanged=h.OnDodgeStateChanged


i.SetVisualizerEnabled=d.SetEnabled
i.IsVisualizerEnabled=d.IsEnabled
i.RefreshVisuals=d.RefreshAll


i.SetTrajectoryEnabled=e.SetEnabled
i.IsTrajectoryEnabled=e.IsEnabled
i.SetTrajectoryLength=e.SetPredictionLength
i.GetTrajectoryLength=e.GetPredictionLength
i.RefreshTrajectory=e.RefreshAll
i.IsPointInAnyTrajectory=e.IsPointInAnyTrajectory
i.GetNearbyTrajectories=e.GetNearbyTrajectories


i.SetSelectionBoxesEnabled=b.SetSelectionBoxesEnabled
i.IsSelectionBoxesEnabled=b.IsSelectionBoxesEnabled


i.StartDetection=b.StartScan
i.StopDetection=b.StopScan
i.IsDetectionEnabled=b.IsEnabled
i.SetDetectionEnabled=b.SetEnabled

i.SetLogHazards=b.SetLogHazards
i.IsLogHazardsEnabled=b.IsLogHazardsEnabled

i.SetLogThreats=i.SetLogHazards
i.IsLogThreatsEnabled=i.IsLogHazardsEnabled

i.SetLogFailed=b.SetLogFailed
i.IsLogFailedEnabled=b.IsLogFailedEnabled


i.SetInspectTarget=b.SetInspectTarget
i.GetInspectTarget=b.GetInspectTarget
i.SetInspectEnabled=b.SetInspectEnabled
i.IsInspectEnabled=b.IsInspectEnabled

i.GetHazardCount=b.GetHazardCount
i.GetActiveHazards=b.GetActiveHazards
i.GetLastHazardInfo=b.GetLastHazardInfo
i.OnHazardChanged=b.OnHazardChanged


function i.StartScan()
b.StartScan()
end


function i.StopScan()
b.StopScan()
end


function i.Toggle(j)
if j then
i.StartScan()
else
i.StopScan()
end
end

function i.IsEnabled()
return b.IsEnabled()
end


a.Register(function()
b.StopScan()
end)

return i