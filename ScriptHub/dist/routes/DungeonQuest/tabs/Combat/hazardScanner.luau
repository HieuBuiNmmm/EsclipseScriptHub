




local a=require"@routes/DungeonQuest/core/autoSave"
local b=require"@routes/DungeonQuest/core/hazardScanner"
local c=require"@routes/DungeonQuest/core/ui"

return function(d,e)
local f=e:Section{Side="Left"}
f:Header{Name="Hazard Scanner Controls"}

local g=e:Section{Side="Right"}
g:Header{Name="Real-time Hazard Monitor"}


local h=g:Label{Text="Detector: <font color='rgb(255,80,80)'>Disabled</font>"}
local i=g:Label{Text="Player: <font color='rgb(0,255,170)'>SAFE</font>"}
local j=g:Label{Text="Safe Spot: <font color='rgb(160,160,160)'>None Needed</font>"}
local k=g:Label{Text="Auto Dodge: <font color='rgb(160,160,160)'>Idle</font>"}
local l=g:Label{Text="Active Hazards: <font color='rgb(160,160,160)'>0</font>"}
local m=g:Label{Text="Last Detected: <font color='rgb(160,160,160)'>None</font>"}

local function updatePlayerDanger(n,o,p)
if n then
local q=o and o.Name or"Unknown Threat"
local r=p and(" ["..p.."]")or""
pcall(function()
i:UpdateName(("Player: <font color='rgb(255,50,50)'><b>DANGER</b></font> (%s%s)"):format(
q,r
))
end)
else
pcall(function()
i:UpdateName"Player: <font color='rgb(0,255,170)'><b>SAFE</b></font>"
end)
end
end

b.OnPlayerDangerChanged(function(n,o,p)
updatePlayerDanger(n,o,p)
end)

b.OnSafeSpotChanged(function(n,o,p)
if n and o then
pcall(function()
j:UpdateName(("Safe Spot: <font color='rgb(0,255,120)'><b>Found (%.1f studs)</b></font>"):format(p))
end)
else
pcall(function()
j:UpdateName"Safe Spot: <font color='rgb(160,160,160)'>None Needed</font>"
end)
end
end)

b.OnDodgeStateChanged(function(n,o,p)
if n and o then
pcall(function()
k:UpdateName(("Auto Dodge: <font color='rgb(0,255,200)'><b>Dodging (%.1f studs)</b></font>"):format(p))
end)
else
pcall(function()
k:UpdateName"Auto Dodge: <font color='rgb(160,160,160)'>Idle</font>"
end)
end
end)

local function updateMonitor(n,o)
n=n or b.GetHazardCount()
o=o or b.GetLastHazardInfo()

local p=b.IsEnabled()
local q=p and"0, 255, 0"or"255, 80, 80"
local r=p and"Active (Scanning & SelectionBox)"or"Disabled"

pcall(function()
h:UpdateName("Detector: <font color='rgb("..q..")'>"..r.."</font>")
end)

local s=n>0 and"255, 60, 60"or"0, 255, 0"
pcall(function()
l:UpdateName("Active Hazards: <font color='rgb("..s..")'>"..tostring(n).."</font>")
end)

if o then
pcall(function()
m:UpdateName(("Last Detected: <font color='rgb(255,220,120)'>%s</font> (%s, %d studs)"):format(
o.Name,o.Class,o.Distance
))
end)
else
pcall(function()
m:UpdateName"Last Detected: <font color='rgb(160,160,160)'>None</font>"
end)
end
end


g:Header{Name="Specific Skill Inspector"}

g:Toggle({
Name="Enable Deep Inspector",
Default=b.IsInspectEnabled(),
Callback=a.Wrap(function(n)
b.SetInspectEnabled(n)
end),
},"Toggle_HazardDeepInspector")

g:Input{
Name="Target Skill Name",
Placeholder="e.g. Meteor, Spike, Flame...",
AcceptedCharacters="All",
Default=b.GetInspectTarget(),
Callback=a.Wrap(function(n)
b.SetInspectTarget(n)
end),
}

b.OnHazardChanged(function(n,o)
updateMonitor(n,o)
end)


f:Toggle({
Name="Enable Hazard Scanner",
Default=b.IsEnabled(),
Callback=a.Wrap(function(n)
b.Toggle(n)
updateMonitor()
end),
},"Toggle_SmartDodgeThreatDetection")

f:Toggle({
Name="Show Player 2D Hitbox (Ground Visual)",
Default=b.IsPlayerVisualEnabled(),
Callback=a.Wrap(function(n)
b.SetPlayerVisualEnabled(n)
end),
},"Toggle_HazardPlayer2DVisual")

c.PatchSliderLoadCallback(f:Slider({
Name="Player 2D Hitbox Radius",
Suffix=" studs",
Default=b.GetPlayerHitboxRadius(),
Minimum=0.5,
Maximum=8,
DisplayMethod="Value",
Precision=1,
Callback=a.Wrap(function(n)
b.SetPlayerHitboxRadius(n)
end),
},"Slider_HazardPlayer2DHitboxRadius"))

f:Toggle({
Name="Show 3D Selection Boxes (Parts)",
Default=b.IsSelectionBoxesEnabled(),
Callback=a.Wrap(function(n)
b.SetSelectionBoxesEnabled(n)
end),
},"Toggle_HazardSelectionBoxes")

f:Toggle({
Name="Show Danger Zones (Ground Visualizer)",
Default=b.IsVisualizerEnabled(),
Callback=a.Wrap(function(n)
b.SetVisualizerEnabled(n)
end),
},"Toggle_HazardGroundVisualizer")

f:Toggle({
Name="Show Trajectory Paths (Orange)",
Default=b.IsTrajectoryEnabled(),
Callback=a.Wrap(function(n)
b.SetTrajectoryEnabled(n)
end),
},"Toggle_HazardTrajectoryVisualizer")

f:Toggle({
Name="Show Safe Spot Marker (Green Visual)",
Default=b.IsSafeSpotVisualEnabled(),
Callback=a.Wrap(function(n)
b.SetSafeSpotVisualEnabled(n)
end),
},"Toggle_HazardSafeSpotVisual")

f:Toggle({
Name="Show Candidate Points & Rays (Scan Grid)",
Default=b.IsShowCandidates(),
Callback=a.Wrap(function(n)
b.SetShowCandidates(n)
end),
},"Toggle_HazardShowCandidates")

c.PatchSliderLoadCallback(f:Slider({
Name="Safe Spot Safety Margin",
Suffix=" studs",
Default=b.GetSafeSpotBuffer(),
Minimum=0.0,
Maximum=6.0,
DisplayMethod="Value",
Precision=1,
Callback=a.Wrap(function(n)
b.SetSafeSpotBuffer(n)
end),
},"Slider_HazardSafeSpotBuffer"))

f:Toggle({
Name="Enable Auto Dodge (Move + Snap)",
Default=b.IsAutoDodgeEnabled(),
Callback=a.Wrap(function(n)
b.SetAutoDodgeEnabled(n)
end),
},"Toggle_HazardAutoDodgeEnabled")

c.PatchSliderLoadCallback(f:Slider({
Name="Dodge Snap Distance",
Suffix=" studs",
Default=b.GetDodgeSnapDistance(),
Minimum=0.5,
Maximum=5.0,
DisplayMethod="Value",
Precision=1,
Callback=a.Wrap(function(n)
b.SetDodgeSnapDistance(n)
end),
},"Slider_HazardDodgeSnapDistance"))

c.PatchSliderLoadCallback(f:Slider({
Name="Trajectory Length",
Suffix=" studs",
Default=b.GetTrajectoryLength(),
Minimum=10,
Maximum=150,
DisplayMethod="Value",
Precision=0,
Callback=a.Wrap(function(n)
b.SetTrajectoryLength(n)
end),
},"Slider_HazardTrajectoryLength"))

f:Toggle({
Name="Log Hazards (Spawns / Despawns)",
Default=b.IsLogHazardsEnabled(),
Callback=a.Wrap(function(n)
b.SetLogHazards(n)
end),
},"Toggle_SmartDodgeLogHazards")

f:Toggle({
Name="Log Rejected (Không vẽ được)",
Default=b.IsLogFailedEnabled(),
Callback=a.Wrap(function(n)
b.SetLogFailed(n)
end),
},"Toggle_SmartDodgeLogRejected")

c.PatchSliderLoadCallback(f:Slider({
Name="Danger Zone Padding",
Suffix=" studs",
Default=b.GetHazardPadding(),
Minimum=0,
Maximum=10,
DisplayMethod="Value",
Precision=1,
Callback=a.Wrap(function(n)
b.SetHazardPadding(n)
end),
},"Slider_HazardZonePadding"))

f:Button{
Name="Clear Console",
Callback=function()
pcall(function()
if rconsoleclear then rconsoleclear()end
end)
end,
}


updateMonitor()
end