




local a=require"@routes/DungeonQuest/core/autoSave"
local b=require"@routes/DungeonQuest/core/autoFarm"
local c=require"@routes/DungeonQuest/core/contextual"
local d=require"@routes/DungeonQuest/core/shared"
local e=require"@routes/DungeonQuest/core/services"
local f=require"@routes/DungeonQuest/core/ui"
local g=require"@routes/DungeonQuest/core/lifecycle"
local h=e.RunService

return function(i,j)



local k=j:Section{Side="Left"}
k:Header{Name="Auto Farm"}

k:Toggle({
Name="Enable Auto Farm",
Default=b.IsEnabled(),
Callback=a.Wrap(function(l)
b.Toggle(l)
end),
},"Toggle_AutoFarm")

k:Slider({
Name="Rescan Interval",
Suffix="s",
Default=b.GetScanInterval(),
Minimum=0.5,
Maximum=5.0,
Precision=1,
Callback=a.Wrap(function(l)
b.SetScanInterval(l)
end),
},"Slider_AF_ScanInterval")

k:Slider({
Name="Min Combat Distance",
Suffix=" studs",
Default=b.GetMinCombatDistance(),
Minimum=2,
Maximum=150,
DisplayMethod="Value",
Precision=1,
Callback=a.Wrap(function(l)
b.SetMinCombatDistance(l)
end),
},"Slider_AF_MinCombatDistance")

k:Slider({
Name="Max Combat Distance",
Suffix=" studs",
Default=b.GetMaxCombatDistance(),
Minimum=5,
Maximum=200,
DisplayMethod="Value",
Precision=1,
Callback=a.Wrap(function(l)
b.SetMaxCombatDistance(l)
end),
},"Slider_AF_MaxCombatDistance")

k:Toggle({
Name="Auto Face Target (Look At Enemy)",
Default=b.IsAutoFaceTargetEnabled(),
Callback=a.Wrap(function(l)
b.SetAutoFaceTarget(l)
end),
},"Toggle_AF_AutoFaceTarget")

k:Slider({
Name="Repath Distance",
Suffix=" std",
Default=b.GetRepathDistance(),
Minimum=2,
Maximum=20,
DisplayMethod="Value",
Precision=1,
Callback=a.Wrap(function(l)
b.SetRepathDistance(l)
end),
},"Slider_AF_RepathDistance")

k:Toggle({
Name="Auto Jump When Stuck (Low Velocity)",
Default=b.IsAutoJumpOnStuckEnabled(),
Callback=a.Wrap(function(l)
b.SetAutoJumpOnStuck(l)
end),
},"Toggle_AF_AutoJumpOnStuck")

f.PatchSliderLoadCallback(k:Slider({
Name="Stuck Velocity Threshold",
Suffix=" studs/s",
Default=b.GetStuckVelocityThreshold(),
Minimum=2,
Maximum=20,
DisplayMethod="Value",
Precision=1,
Callback=a.Wrap(function(l)
b.SetStuckVelocityThreshold(l)
end),
},"Slider_AF_StuckVelocity"))

k:Header{Name="Auto Skill (Smart Buff & Damage)"}

k:Toggle({
Name="Enable Auto Skill (Smart Q + E)",
Default=b.IsAutoSkillEnabled(),
Callback=a.Wrap(function(l)
b.SetAutoSkillEnabled(l)
end),
},"Toggle_AF_AutoSkill")

f.PatchSliderLoadCallback(k:Slider({
Name="Skill E Cast Range",
Suffix=" studs",
Default=b.GetSkillERange(),
Minimum=5,
Maximum=150,
DisplayMethod="Value",
Precision=1,
Callback=a.Wrap(function(l)
b.SetSkillERange(l)
end),
},"Slider_AF_SkillERange"))

f.PatchSliderLoadCallback(k:Slider({
Name="Skill Spam Interval",
Suffix="s",
Default=b.GetSkillSpamInterval(),
Minimum=0.05,
Maximum=1.0,
DisplayMethod="Value",
Precision=2,
Callback=a.Wrap(function(l)
b.SetSkillSpamInterval(l)
end),
},"Slider_AF_SkillSpamInterval"))

k:Header{Name="Visual Debug"}

k:Toggle({
Name="Show Blocker Ray (Red/Green)",
Default=b.IsBlockerRayVisualEnabled(),
Callback=a.Wrap(function(l)
b.SetBlockerRayVisual(l)
end),
},"Toggle_AF_BlockerRay")

k:Toggle({
Name="Show Planned Path (Green)",
Default=b.IsPlannedPathVisualEnabled(),
Callback=a.Wrap(function(l)
b.SetPlannedPathVisual(l)
end),
},"Toggle_AF_PlannedPath")

k:Toggle({
Name="Show Actual Destination (Cyan)",
Default=b.IsActualPathVisualEnabled(),
Callback=a.Wrap(function(l)
b.SetActualPathVisual(l)
end),
},"Toggle_AF_ActualPath")

k:Toggle({
Name="Show Target Indicator (Red/Glow)",
Default=b.IsTargetVisualEnabled(),
Callback=a.Wrap(function(l)
b.SetTargetVisual(l)
end),
},"Toggle_AF_TargetVisual")




local l=j:Section{Side="Right"}
l:Header{Name="Auto Farm Monitor"}

local m=l:Label{Text="State: <font color='rgb(160,160,160)'>NO_TARGET</font>"}
local n=l:Label{Text="Target: <font color='rgb(160,160,160)'>None</font>"}
local o=l:Label{Text="Distance: <font color='rgb(160,160,160)'>-</font>"}
local p=l:Label{Text="Velocity: <font color='rgb(160,160,160)'>0.0 studs/s</font>"}
local q=l:Label{Text="Blocker Detection: <font color='rgb(160,160,160)'>-</font>"}
local r=l:Label{Text="Destination Mode: <font color='rgb(160,160,160)'>None</font>"}
local s=l:Label{Text="Path Nodes: <font color='rgb(160,160,160)'>0</font>"}

local t

local function updateMonitor()
local u=b.GetDebugInfo()
local v="160,160,160"

if u.state=="CHASE"then
v="0,255,120"
elseif u.state=="HOLD"then
v="255,200,0"
elseif u.state=="BLOCKED"then
v="255,60,60"
elseif u.state=="REPATHING"or u.state=="ACQUIRING_TARGET"or u.state=="TRACKING_TARGET"then
v="0,200,255"
end

pcall(function()
m:UpdateName(("State: <font color='rgb(%s)'>%s</font>"):format(v,u.state))
end)

pcall(function()
if u.hasTarget then
n:UpdateName(("Target: <font color='rgb(255,220,120)'>%s</font>"):format(u.enemyName))
o:UpdateName(("Distance: <font color='rgb(0,255,255)'>%.1f studs (flat %.1f)</font>"):format(u.enemyDist,u.enemyFlat))
else
n:UpdateName"Target: <font color='rgb(160,160,160)'>None</font>"
o:UpdateName"Distance: <font color='rgb(160,160,160)'>-</font>"
end
end)

pcall(function()
local w=u.velocity or 0
local x=w>=12.0 and"0,255,120"or(w>=10.0 and"255,200,0"or"255,80,80")
p:UpdateName(("Velocity: <font color='rgb(%s)'>%.1f studs/s</font>"):format(x,w))
end)



pcall(function()
if u.hasTarget and u.blocker then
if u.blocker.directBlocked then
q:UpdateName(("Blocker: <font color='rgb(255,60,60)'>BLOCKED by '%s' (%.1fm)</font>"):format(
u.blocker.blockerName,u.blocker.blockerDist
))
else
q:UpdateName"Blocker: <font color='rgb(0,255,120)'>CLEAR (Direct Line to Target)</font>"
end
else
q:UpdateName"Blocker: <font color='rgb(160,160,160)'>None</font>"
end
end)

pcall(function()
local w=u.destMode
if u.nodeIndex then
w=("%s (Node #%d)"):format(u.destMode,u.nodeIndex)
end
local x=u.destMode=="Direct"and"0,255,255"or(u.destMode=="Waypoint"and"255,200,0"or(u.destMode=="Hold"and"255,200,0"or"255,80,80"))
r:UpdateName(("Destination Mode: <font color='rgb(%s)'>%s</font>"):format(x,w))
end)

pcall(function()
s:UpdateName(("Path Nodes: <font color='rgb(160,255,160)'>%d waypoints</font>"):format(u.waypointCount))
end)
end

local u=0
t=h.Heartbeat:Connect(function()
local v=os.clock()
if v-u>=0.25 then
u=v
updateMonitor()
end
end)

g.Register(function()
if t then
t:Disconnect()
t=nil
end
end)




local v=j:Section{Side="Right"}
v:Header{Name="Auto Farm Context"}

local w=v:Label{Text=""}
local function updateActiveCtxLabel()
local x=d.GetCurrentDungeonName()
local y=d.GetCombatTargetKey()
w:UpdateName("Active: <font color='rgb(120,200,255)'>"..(x or"Not in dungeon").."</font> / "..c.GetDisplayForTarget(y))
end

local x=d.GetCurrentDungeonName()
local y="Mob"

local z=false
local A
local B
local C
local D

local E

local function isActiveContext()
return x==d.GetCurrentDungeonName()and y==d.GetCombatTargetKey()
end

D=v:Dropdown({
Name="Edit Target",
Options={"Normal","Boss 1","Boss 2","Boss 3"},
Default=1,
Required=true,
Callback=a.Wrap(function(F)
local G={Normal="Mob",["Boss 1"]="Boss1",["Boss 2"]="Boss2",["Boss 3"]="Boss3"}
y=G[F]or"Mob"
A()
end),
},"Dropdown_AutoFarmTarget")


local F=false
local G
local H="Reset Context to Global"
local I="<font color='rgb(255,80,80)'>Confirm Reset?</font>"
local J=3
local function disarmReset()
if not F then return end
F=false
if G then task.cancel(G);G=nil end
pcall(function()E:UpdateName(H)end)
end

E=v:Button{
Name=H,
Callback=a.Wrap(function()
if not F then
F=true
if G then task.cancel(G)end
G=task.delay(J,disarmReset)
pcall(function()E:UpdateName(I)end)
return
end
disarmReset()
c.ClearContext(x,y)
A()
if isActiveContext()then c.ApplyContext(x,y)end
end),
}

local K
local L

K=f.PatchSliderLoadCallback(v:Slider({
Name="Min Combat Distance",
Suffix=" studs",
Default=c.GetField(x,y,"MinCombatDistance")or 25,
Minimum=2,
Maximum=150,
DisplayMethod="Value",
Precision=1,
Callback=a.Wrap(function(M)
if z then return end
c.SetField(x,y,"MinCombatDistance",M)
if isActiveContext()then c.ApplyContext(x,y)end
end),
},"Slider_AF_CtxMinCombatDistance"))

L=f.PatchSliderLoadCallback(v:Slider({
Name="Max Combat Distance",
Suffix=" studs",
Default=c.GetField(x,y,"MaxCombatDistance")or 50,
Minimum=5,
Maximum=200,
DisplayMethod="Value",
Precision=1,
Callback=a.Wrap(function(M)
if z then return end
c.SetField(x,y,"MaxCombatDistance",M)
if isActiveContext()then c.ApplyContext(x,y)end
end),
},"Slider_AF_CtxMaxCombatDistance"))

A=function()
z=true
disarmReset()
pcall(function()K:UpdateValue(c.GetField(x,y,"MinCombatDistance")or 25)end)
pcall(function()L:UpdateValue(c.GetField(x,y,"MaxCombatDistance")or 50)end)
z=false
pcall(function()C:UpdateName("Editing: <font color='rgb(150,255,150)'>"..(x or"Not in dungeon").."</font> / "..c.GetDisplayForTarget(y))end)
end

B=function(M)
pcall(function()K:SetVisibility(M)end)
pcall(function()L:SetVisibility(M)end)
pcall(function()E:SetVisibility(M)end)
end

local function resetToMob()
y="Mob"
pcall(function()D:UpdateSelection"Normal"end)
A()
end

local M=x~=nil
local function onDungeonChanged()
local N=d.GetCurrentDungeonName()
local O=N~=nil
x=N
if O and not M then
resetToMob()
end
M=O
updateActiveCtxLabel()
A()
B(O)
end

d.OnDungeonNameChanged(onDungeonChanged)
d.OnBossIndexChanged(updateActiveCtxLabel)
d.OnBossActiveChanged(updateActiveCtxLabel)
c.OnConfigChanged(function()
x=d.GetCurrentDungeonName()
updateActiveCtxLabel()
A()
B(x~=nil)
end)

updateActiveCtxLabel()
A()
B(x~=nil)
end