








local a=require"@routes/DungeonQuest/core/services"
local b=require"@routes/DungeonQuest/core/shared"
local c=require"@routes/DungeonQuest/core/lifecycle"
local d=require"@routes/DungeonQuest/core/coordinator"
local e=require"@routes/DungeonQuest/core/notifier"

local f=require"@routes/DungeonQuest/core/pathRecord/storage"
local g=require"@routes/DungeonQuest/core/pathRecord/recorder"
local h=require"@routes/DungeonQuest/core/pathRecord/player"
local i=require"@routes/DungeonQuest/core/pathRecord/visual"
local j=require"@routes/DungeonQuest/core/pathRecord/rangeVisual"

local k=a.RunService


local l={}


local m=true


local n="Default (Red/Cyan/Teal)"
local o={
[n]={
rec=Color3.fromRGB(255,60,60),
play=Color3.fromRGB(0,230,255),
idle=Color3.fromRGB(90,190,200),
},Oceana=
{
rec=Color3.fromRGB(0,190,255),
play=Color3.fromRGB(80,255,220),
idle=Color3.fromRGB(120,210,255),
},Sunset=
{
rec=Color3.fromRGB(255,120,60),
play=Color3.fromRGB(255,220,80),
idle=Color3.fromRGB(255,150,160),
},Emerald=
{
rec=Color3.fromRGB(80,255,140),
play=Color3.fromRGB(0,220,120),
idle=Color3.fromRGB(140,255,180),
},Violet=
{
rec=Color3.fromRGB(200,90,255),
play=Color3.fromRGB(170,120,255),
idle=Color3.fromRGB(150,150,255),
},
}

local p={
thickness=3,
transparency=0.25,
theme=n,
}

function l.GetStyle()
return{
thickness=p.thickness,
transparency=p.transparency,
theme=p.theme,
}
end

function l.GetThemeNames()
local q={}
for r in pairs(o)do
q[#q+1]=r
end
table.sort(q)
return q
end


function l.SetStyle(q)
if type(q)~="table"then return end
if q.thickness~=nil then p.thickness=math.clamp(q.thickness,1,10)end
if q.transparency~=nil then p.transparency=math.clamp(q.transparency,0,0.9)end
if q.theme and o[q.theme]then p.theme=q.theme end
i.SetStyle{thickness=p.thickness,transparency=p.transparency}
lastBuildKey=nil
fireStatus"style"
end


local q=true
local r=true

function l.IsTimelineCaptureEnabled()
return q
end

function l.SetTimelineCapture(s)
q=s and true or false
g.SetCapture(q)
fireStatus"timeline"
end

function l.IsTimelineReplayEnabled()
return r
end

function l.SetTimelineReplay(s)
r=s and true or false
h.SetReplayTimeline(r)
fireStatus"timeline"
end


function l.IsSpeedMatchEnabled()
return h.IsSpeedMatchEnabled()
end

function l.SetSpeedMatch(s)
h.SetSpeedMatch(s and true or false)
fireStatus"speedmatch"
end


function l.IsUseFastSpeedEnabled()
return h.IsUseFastSpeedEnabled()
end

function l.SetUseFastSpeed(s)
h.SetUseFastSpeed(s and true or false)
fireStatus"usefastspeed"
end


function l.GetSkillFaceHold()
return h.GetSkillFaceHold()
end

function l.SetSkillFaceHold(s)
h.SetSkillFaceHold(s)
fireStatus"facehold"
end


function l.GetDoubleClickDelay()
return h.GetDoubleClickDelay()
end

function l.SetDoubleClickDelay(s)
h.SetDoubleClickDelay(s)
fireStatus"doubleclick"
end


local s={}
local t
local u
local v
local w
local x

local function fireStatus(y)
local z=g.GetStatus()
local A={
recording=g.IsRecording(),
playing=h.IsPlaying(),
resume=h.ResumeWanted(),
autoPlayWanted=autoPlayWanted,
inLobby=b.IsInLobby(),
map=b.GetCurrentDungeonName(),
room=b.GetCurrentRoomIndex(),
boss=b.IsBossActive(),
recordedMaps=f.Count(),
pointCount=g.IsRecording()and z.pointCount or 0,
phase=h.IsPlaying()and h.GetCurrentPhaseIndex()or(g.IsRecording()and z.phaseCount or 1),
reason=y,
}
for B,C in ipairs(s)do
pcall(C,A)
end
end



function l.ToggleRecord(y)
if y then
if g.IsRecording()then return true end
if h.IsPlaying()then h.Stop()end

local z,A=g.Start()
if not z then
e.Notify("Path Record","Không bắt đầu record: "..tostring(A),3)
end
fireStatus()
return z
else
local z=g.IsRecording()
g.Stop()
fireStatus()
return z
end
end

function l.IsRecording()
return g.IsRecording()
end


function l.CurrentRoomHasRecord()
return f.HasSegmentOrMacro(b.GetCurrentDungeonName(),b.GetCurrentRoomIndex())
end




function l.GetMapMode(y)
return f.GetMapMode(y)
end

function l.SetMapMode(y,z)
if f.SetMapMode(y,z)then
fireStatus"mode"
end
end






local y=false

function l.IsAutoPlayWanted()
return y
end

function l.TogglePlay(z)
y=z and true or false

if y then
if h.IsPlaying()then
fireStatus"already_playing"
return true
end
if g.IsRecording()then
g.Stop()
end

if b.IsInLobby()then
fireStatus"armed_lobby"
return true
end

local A=b.GetCurrentDungeonName()
local B=b.GetCurrentRoomIndex()

if not A or#A==0 or B<=0 then
fireStatus"armed_waiting"
return true
end

if b.IsBossActive()and f.GetMapMode(A)~="full"then
fireStatus"armed_boss"
return true
end

if f.HasSegmentOrMacro(A,B)then
d.EnableExclusive"PathRecord"
h.Start()
end

fireStatus"play_started"
return true
else
local A=h.IsPlaying()
h.Stop()
fireStatus"play_stopped"
return A
end
end

function l.IsPlaying()
return h.IsPlaying()
end


function l.IsEnabled()
return h.IsPlaying()
end



function l.SetShowVisual(z)
m=z and true or false
if not m then i.Clear()end
fireStatus()
end

function l.IsShowVisualEnabled()
return m
end



function l.SetRangeVisual(z)
j.SetEnabled(z)
fireStatus"rangevisual"
end

function l.IsRangeVisualEnabled()
return j.IsEnabled()
end

function l.SetRangeVisualRadius(z)
j.SetRadius(z)
fireStatus"rangeradius"
end

function l.GetRangeVisualRadius()
return j.GetRadius()
end

function l.SetRangeVisualFill(z)
j.SetFillEnabled(z)
fireStatus"rangefill"
end

function l.IsRangeVisualFillEnabled()
return j.IsFillEnabled()
end

function l.SetHighlightInRange(z)
j.SetHighlightInRange(z)
fireStatus"rangehighlight"
end

function l.IsHighlightInRangeEnabled()
return j.IsHighlightInRangeEnabled()
end

function l.GetRangeColorNames()
return j.GetColorNames()
end

function l.GetSelectedCircleColor()
return j.GetSelectedCircleColor()
end

function l.SetCircleColor(z)
j.SetCircleColor(z)
fireStatus"circlecolor"
end

function l.GetSelectedHighlightColor()
return j.GetSelectedHighlightColor()
end

function l.SetHighlightColor(z)
j.SetHighlightColor(z)
fireStatus"highlightcolor"
end



function l.GetMaps()
return f.GetMaps()
end

function l.GetMacro(z)
return f.GetMap(z)
end

function l.RemoveMap(z)
f.RemoveMap(z)
fireStatus"removed"
end

function l.ClearAll()
f.ClearAll()
fireStatus"cleared"
end

function l.ReloadFromDisk()
f.ReloadFromDisk()
fireStatus"reloaded"
end



function l.GetStatus()
local z=g.GetStatus()
return{
recording=g.IsRecording(),
playing=h.IsPlaying(),
resume=h.ResumeWanted(),
autoPlayWanted=y,
inLobby=b.IsInLobby(),
map=b.GetCurrentDungeonName(),
room=b.GetCurrentRoomIndex(),
boss=b.IsBossActive(),
recordedMaps=f.Count(),
pointCount=z.pointCount,
phase=h.IsPlaying()and h.GetCurrentPhaseIndex()or(g.IsRecording()and z.phaseCount or 1),
}
end

function l.OnStatusChanged(z)
if type(z)=="function"then
table.insert(s,z)
end
end








t=b.OnBossActiveChanged(function(z)
if not z then return end

if h.ResumeWanted()or y then
local A=h.GetActiveMap()or b.GetCurrentDungeonName()
if A and f.GetMapMode(A)=="full"then
local B=b.GetCurrentRoomIndex()
if B>0 and f.HasSegmentOrMacro(A,B)then
d.EnableExclusive"PathRecord"
h.Start()
fireStatus"boss"
end
end
return
end

if h.IsPlaying()then
local A=h.GetActiveMap()or b.GetCurrentDungeonName()
if A and f.GetMapMode(A)=="full"then
d.EnableExclusive"PathRecord"
else
e.Notify("Path Record","Boss room: tạm dừng, dùng Hazard Scanner",3)
fireStatus"boss"
end
end
end)


v=f.OnChanged(function()
fireStatus"storage"
end)



w=b.OnRoomIndexChanged(function()
if not y and not h.ResumeWanted()then return end

local z=b.GetCurrentRoomIndex()
if z<=0 or b.IsInLobby()or b.IsDead()then return end

local A=b.GetCurrentDungeonName()
if not A or#A==0 then return end
if h.GetActiveMap()and h.GetActiveMap()~=A then return end
if b.IsBossActive()and f.GetMapMode(A)~="full"then return end
if not f.HasSegmentOrMacro(A,z)then return end

if not h.IsPlaying()then
d.EnableExclusive"PathRecord"
h.Start()
fireStatus"resumed"
end
end)



x=b.OnDungeonNameChanged(function(z)
if g.IsRecording()then
g.Stop"đổi map"
end
if h.IsPlaying()or h.ResumeWanted()then
local A=h.GetActiveMap()
if A and A~=z then
h.Stop()
end
end
if y and z and#z>0 then
task.delay(0.3,function()
if not y or h.IsPlaying()or g.IsRecording()then return end
local A=b.GetCurrentRoomIndex()
if A>0 and f.HasSegmentOrMacro(z,A)then
if not(b.IsBossActive()and f.GetMapMode(z)~="full")then
d.EnableExclusive"PathRecord"
h.Start()
fireStatus"map_autoplay"
end
end
end)
end
fireStatus"map"
end)





local function macroStamp(z)
if not z or#z==0 then return"-"end
for A,B in ipairs(f.GetMaps())do
if B.map==z then
return tostring(B.updated or"-")..":"..tostring(B.roomCount)
end
end
return"-"
end

local z
local A
i.SetStyle{thickness=p.thickness,transparency=p.transparency}
g.SetCapture(q)
h.SetReplayTimeline(r)
u=k.Heartbeat:Connect(function()
if not m then
if z then i.Clear();z=nil end
return
end

local B=b.GetCurrentDungeonName()
local C=b.GetCurrentRoomIndex()

local D
if g.IsRecording()then
D="rec:"..g.GetCurrentPhaseIndex()..":"..#g.GetCurrentPoints()
elseif h.IsPlaying()then
D="play:"..tostring(C)..":"..h.GetCurrentPhaseIndex()..":"..macroStamp(B)
else
D="idle:"..macroStamp(B)
end
if D==A then return end
A=D

local E=o[p.theme]or o[n]
local F={}

if g.IsRecording()then

local G=g.GetCurrentPoints()
if#G>=2 then
F[1]={points=G,color=E.rec,tag="rec"}
end
elseif h.IsPlaying()then

if B and C>0 then
local G=f.GetRoomSegment(B,C)
if G then
local H=G.phases or{G}
local I=h.GetCurrentPhaseIndex()or 1
local J=H[math.min(I,#H)]or G
if J and J.points and#J.points>=2 then
F[1]={
points=f.SimplifyPath(J.points,0.4),
color=E.play,
tag=("play_%s_p%d"):format(tostring(C),I),
}
end
end
end
else

if B then
local G=f.GetMap(B)
if G then
local H={}
for I in pairs(G.rooms)do
H[#H+1]=I
end
table.sort(H)
for I,J in ipairs(H)do
local K=G.rooms[J]
if K then
local L=K.phases or{K}
for M,N in ipairs(L)do
if N and N.points and#N.points>=2 then
F[#F+1]={
points=f.SimplifyPath(N.points,0.4),
color=K.boss and Color3.fromRGB(255,140,255)or E.idle,
tag=("macro_%s_p%d"):format(tostring(J),M),
}
end
end
end
end
end
end
end

if#F>0 then

local G={}
for H,I in ipairs(F)do
G[#G+1]=(I.tag or"x")..":"..#I.points
end
i.DrawPolylines(F,table.concat(G,"|"))
z="drawn"
elseif z then
i.Clear()
z=nil
end
end)




d.Register("PathRecord",function(B)
if not B then
h.PauseForExclusive()
end
fireStatus"disabled"
end,l.IsEnabled)


task.delay(1.0,function()
if y and not h.IsPlaying()and not g.IsRecording()then
local B=b.GetCurrentDungeonName()
if B and#B>0 and not b.IsInLobby()then
if f.HasSegmentOrMacro(B,b.GetCurrentRoomIndex())then
l.TogglePlay(true)
end
end
end
end)

c.Register(function()
h.Stop()
g.Cancel()
i.Clear()
if t then t();t=nil end
if u then u:Disconnect();u=nil end
if w then w();w=nil end
if x then x();x=nil end
if v then v();v=nil end
end)

return l