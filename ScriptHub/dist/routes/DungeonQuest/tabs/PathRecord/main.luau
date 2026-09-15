





local a=require"@routes/DungeonQuest/core/services"
local b=require"@routes/DungeonQuest/core/lifecycle"
local c=require"@routes/DungeonQuest/core/pathRecord"
local d=require"@routes/DungeonQuest/core/autoSave"
local e=require"@routes/DungeonQuest/core/ui"
local f=require"@routes/DungeonQuest/core/notifier"

local g=a.RunService

return function(h,i)



local j=i:Section{Side="Left"}
j:Header{Name="Path Record"}
j:Label{
Text="Macro = 1 bản ghi cho cả map, <font color='rgb(0,255,120)'>bấm Record 1 lần là ghi liên tục</font> qua từng room (tự lưu khi về lobby). Mode FULL -> record & phát luôn cả boss room.",
}

local k=false
local l=false
local m=false
local n=false
local o
local p
local q

local function getSelectedMapFromDropdown()
if not o then return nil end
local r=o:GetOptions()
for s,t in pairs(r)do
if t and s~="None"then
local u=string.match(s,"^Map %[(.+)%] %(%d+ rooms%)$")
if u and#u>0 then
return u
end
end
end
return nil
end

local r=j:Toggle{
Name="Record Path (Macro)",
Default=c.IsRecording(),
Callback=function(r)
if k then return end

if r then

if c.IsRecording()then return end


if c.CurrentRoomHasRecord()then
if n then return end
n=true

h:Dialog{
Title="Confirm Record",
Description="Room n\u{e0}y <font color='rgb(255,200,0)'>\u{111}\u{e3} c\u{f3} macro \u{111}\u{1b0}\u{1ee3}c l\u{1b0}u</font>.\n\nRecord b\u{e2}y gi\u{1edd} s\u{1ebd} <b>GHI \u{110}\u{c8} segment c\u{169}</b> c\u{1ee7}a room \u{111}\u{f3}.\nB\u{1ea1}n v\u{1eab}n mu\u{1ed1}n record l\u{1ea1}i ch\u{1ee9}?"
,
Buttons={
{
Name="Record (Overwrite)",
Callback=function()
n=false
local s=c.ToggleRecord(true)
if not s then
pcall(function()
k=true
recordToggle:UpdateState(false)
k=false
end)
end
end,
},
{
Name="Cancel",
Callback=function()
n=false
local s,t=pcall(function()
k=true
recordToggle:UpdateState(false)
k=false
end)
if not s then
k=false
warn("Path Record: Cancel failed to reset toggle - "..tostring(t))
end
end,
},
},
}
return
end
c.ToggleRecord(true)
else
n=false
if c.IsRecording()then
c.ToggleRecord(false)
end
end
end,
}
j:Label{
Text="Record sẽ bắt cả <font color='rgb(255,150,80)'>khoảng đứng chờ</font> + <font color='rgb(255,80,80)'>skill (chuột phải / Q / E)</font> + hướng mặt, Play sẽ tái hiện lại đúng vị trí, giây & nút đã record.",
}


local s=j:Label{
Text="Record Mode (theo map): <font color='rgb(120,200,255)'>NORMAL</font>",
}

local t=j:Toggle{
Name="Full Mode (Record & Play Boss Rooms)",
Default=false,
Callback=function(t)
if m then return end

local u=c.GetStatus().map
local v=(u and#u>0)and u or getSelectedMapFromDropdown()

if not v or#v==0 then
f.Notify("Path Record","Chưa có map nào được chọn. Hãy chọn map trong dropdown hoặc vào dungeon.",3)
pcall(function()
m=true
recordBossToggle:UpdateState(false)
m=false
end)
return
end
c.SetMapMode(v,t and"full"or"normal")
f.Notify("Path Record",("Map [%s]: Chế độ %s"):format(v,t and"FULL (record & phát cả boss room)"or"NORMAL (bỏ qua boss, dùng Hazard Scanner)"),3)
if p then
p(c.GetStatus())
end
end,
}
j:Label{
Text="Mode lưu theo <font color='rgb(150,255,150)'>từng map</font>. <font color='rgb(255,140,255)'>FULL</font>: ghi liên tục qua cả boss room & phát theo path đã record. <font color='rgb(120,200,255)'>NORMAL</font> (mặc định): chỉ room quái thường, boss dùng Hazard Scanner.",
}

local u=j:Toggle({
Name="Play Path (Macro)",
Default=c.IsAutoPlayWanted(),
Callback=d.Wrap(function(u)
if l then return end
c.TogglePlay(u)
end),
},"Toggle_PR_Play")


j:Toggle({
Name="Record Pauses & Skills",
Default=c.IsTimelineCaptureEnabled(),
Callback=d.Wrap(function(v)
c.SetTimelineCapture(v)
end),
},"Toggle_PR_TimelineCapture")

j:Toggle({
Name="Replay Pauses & Skills",
Default=c.IsTimelineReplayEnabled(),
Callback=d.Wrap(function(v)
c.SetTimelineReplay(v)
end),
},"Toggle_PR_TimelineReplay")

j:Toggle({
Name="Match Record Speed (Precise)",
Default=c.IsSpeedMatchEnabled(),
Callback=d.Wrap(function(v)
c.SetSpeedMatch(v)
end),
},"Toggle_PR_SpeedMatch")

j:Toggle({
Name="Use Player Fast Speed",
Default=c.IsUseFastSpeedEnabled(),
Callback=d.Wrap(function(v)
c.SetUseFastSpeed(v)
end),
},"Toggle_PR_UseFastSpeed")


e.PatchSliderLoadCallback(j:Slider({
Name="Skill Face Hold (s)",
Default=c.GetSkillFaceHold(),
Minimum=0.5,
Maximum=2,
DisplayMethod="Value",
Precision=2,
Callback=d.Wrap(function(v)
c.SetSkillFaceHold(v)
end),
onInputComplete=function(v)
d.SaveNow()
f.Notify("Path Record",("Saved Skill Face Hold = %ss"):format(tostring(v)),2)
end,
},"Slider_PR_SkillFaceHold"))


e.PatchSliderLoadCallback(j:Slider({
Name="Skill Double Click Delay (s)",
Default=c.GetDoubleClickDelay(),
Minimum=0.005,
Maximum=0.1,
DisplayMethod="Value",
Precision=3,
Callback=d.Wrap(function(v)
c.SetDoubleClickDelay(v)
end),
onInputComplete=function(v)
d.SaveNow()
f.Notify("Path Record",("Saved Double Click Delay = %ss"):format(tostring(v)),2)
end,
},"Slider_PR_DoubleClickDelay"))

local v=j:Toggle({
Name="Show Path Visual",
Default=c.IsShowVisualEnabled(),
Callback=d.Wrap(function(v)
c.SetShowVisual(v)
end),
},"Toggle_PR_Visual")


local w=c.GetStyle()

e.PatchSliderLoadCallback(j:Slider({
Name="Line Thickness",
Default=w.thickness,
Minimum=1,
Maximum=10,
DisplayMethod="Value",
Precision=1,
Callback=d.Wrap(function(x)
c.SetStyle{thickness=x}
end),
onInputComplete=function(x)
d.SaveNow()
end,
},"Slider_PR_LineThickness"))

e.PatchSliderLoadCallback(j:Slider({
Name="Line Opacity",
Default=math.round((1-w.transparency)*100),
Minimum=10,
Maximum=100,
DisplayMethod="Value",
Precision=1,
Callback=d.Wrap(function(x)
c.SetStyle{transparency=1-x/100}
end),
onInputComplete=function(x)
d.SaveNow()
end,
},"Slider_PR_LineOpacity"))

local x=c.GetThemeNames()
local y=1
for z,A in ipairs(x)do
if A==w.theme then
y=z
break
end
end
e.PatchDropdownRestore(j:Dropdown({
Name="Path Color Theme",
Options=x,
Default=y,
Required=true,
Callback=d.Wrap(function(z)
c.SetStyle{theme=z}
end),
},"Dropdown_PR_Theme"),false)




j:Header{Name="Macros"}

o=e.PatchDropdownRestore(j:Dropdown{
Name="Map Recording",
Options={"None"},
Default=1,
Required=true,
Callback=function(z)
local A=c.GetStatus()
if p then p(A)end
if q then q(A)end
end,
},false)

j:Button{
Name="Delete Selected Map",
Callback=d.Wrap(function()
local z=getSelectedMapFromDropdown()
if z and#z>0 then
c.RemoveMap(z)
end
end),
}

j:Button{
Name="Reload Macros (EsclipseHub/DQMacro)",
Callback=function()
c.ReloadFromDisk()
f.Notify("Path Record","Đã quét và tải lại các file macro từ EsclipseHub/DQMacro/",2)
end,
}


local z=false
local A
local B="Clear All Recordings"
local C="<font color='rgb(255,80,80)'>Confirm Clear All?</font>"
local D=3

local function disarmClear()
if not z then return end
z=false
if A then task.cancel(A);A=nil end
pcall(function()clearBtn:UpdateName(B)end)
end

j:Button{
Name=B,
Callback=function()
if not z then
z=true
if A then task.cancel(A)end
A=task.delay(D,disarmClear)
pcall(function()clearBtn:UpdateName(C)end)
return
end
disarmClear()
c.ClearAll()
end,
}




local E=i:Section{Side="Right"}
E:Header{Name="Status Monitor"}

local F=E:Label{Text="State: <font color='rgb(160,160,160)'>Idle</font>"}
local G=E:Label{Text="Room: <font color='rgb(160,160,160)'>-</font> | Boss: <font color='rgb(160,160,160)'>-</font>"}
local H=E:Label{Text="Points: <font color='rgb(160,160,160)'>-</font>"}
local I=E:Label{Text="Macros: <font color='rgb(160,160,160)'>None</font>"}




local J=i:Section{Side="Right"}
J:Header{Name="Skill Range Visual"}
J:Label{
Text="Vòng tròn quanh nhân vật giúp ước lượng <font color='rgb(0,255,200)'>tầm đánh / phạm vi AOE</font> của skill để căn góc và vị trí xả chiêu khi record.",
}

local K=J:Toggle({
Name="Show Range Circle",
Default=c.IsRangeVisualEnabled(),
Callback=d.Wrap(function(K)
c.SetRangeVisual(K)
end),
},"Toggle_PR_RangeVisual")

e.PatchSliderLoadCallback(J:Slider({
Name="Skill Range (Studs)",
Default=c.GetRangeVisualRadius(),
Minimum=5,
Maximum=120,
DisplayMethod="Value",
Precision=1,
Callback=d.Wrap(function(L)
c.SetRangeVisualRadius(L)
end),
onInputComplete=function(L)
d.SaveNow()
end,
},"Slider_PR_RangeRadius"))

J:Toggle({
Name="Fill Circle Area",
Default=c.IsRangeVisualFillEnabled(),
Callback=d.Wrap(function(L)
c.SetRangeVisualFill(L)
end),
},"Toggle_PR_RangeFill")

local L=c.GetRangeColorNames()

local M=c.GetSelectedCircleColor()
local N=1
for O,P in ipairs(L)do
if P==M then
N=O
break
end
end

e.PatchDropdownRestore(J:Dropdown({
Name="Circle Color",
Options=L,
Default=N,
Required=true,
Callback=d.Wrap(function(O)
c.SetCircleColor(O)
end),
},"Dropdown_PR_CircleColor"),false)

local O=J:Toggle({
Name="Highlight In-Range Enemies (Glow)",
Default=c.IsHighlightInRangeEnabled(),
Callback=d.Wrap(function(O)
c.SetHighlightInRange(O)
end),
},"Toggle_PR_HighlightInRange")

local P=c.GetSelectedHighlightColor()
local Q=2
for R,S in ipairs(L)do
if S==P then
Q=R
break
end
end

e.PatchDropdownRestore(J:Dropdown({
Name="Enemy Highlight Color",
Options=L,
Default=Q,
Required=true,
Callback=d.Wrap(function(R)
c.SetHighlightColor(R)
end),
},"Dropdown_PR_HighlightColor"),false)


q=function(R)
if not n then
pcall(function()
if r and r.GetState and r:GetState()~=R.recording then
k=true
r:UpdateState(R.recording)
k=false
end
end)
end
pcall(function()
local S=c.IsAutoPlayWanted()
if u and u.GetState and u:GetState()~=S then
l=true
u:UpdateState(S)
l=false
end
end)
pcall(function()
local S=R.map
local T=(S and#S>0)and S or getSelectedMapFromDropdown()
local U=T and c.GetMapMode(T)=="full"or false
if t and t.GetState and t:GetState()~=U then
m=true
t:UpdateState(U)
m=false
end
end)
pcall(function()
if v and v.GetState and v:GetState()~=c.IsShowVisualEnabled()then
v:UpdateState(c.IsShowVisualEnabled())
end
end)
pcall(function()
if K and K.GetState and K:GetState()~=c.IsRangeVisualEnabled()then
K:UpdateState(c.IsRangeVisualEnabled())
end
end)
pcall(function()
if O and O.GetState and O:GetState()~=c.IsHighlightInRangeEnabled()then
O:UpdateState(c.IsHighlightInRangeEnabled())
end
end)
end

local function mapOptionList(R)
local S={}
for T,U in ipairs(R)do
S[#S+1]=("Map [%s] (%d rooms)"):format(U.map,U.roomCount)
end
if#S==0 then
S[1]="None"
end
return S
end


local R

local function refreshDropdown(S)
local T=mapOptionList(S)
local U=table.concat(T,"|")

if U==R then return end
R=U

local V
for W,X in pairs(o:GetOptions())do
if X then V=W;break end
end

pcall(function()o:ClearOptions()end)
pcall(function()o:InsertOptions(T)end)


local W=V
if not W or not o:IsOption(W)then
W=T[1]
end
pcall(function()o:UpdateSelection(W)end)
end

p=function(S)
local T=false
local U=S.map
local V=(U and#U>0)and U or getSelectedMapFromDropdown()
if V then
T=c.GetMapMode(V)=="full"
end

local W
if S.recording then
W="<font color='rgb(255,90,90)'>Recording...</font>"
elseif S.playing then
W="<font color='rgb(0,230,255)'>Playing</font>"
elseif S.resume then
W="<font color='rgb(255,200,0)'>Waiting (auto-resume)</font>"
elseif S.autoPlayWanted then
if S.inLobby then
W="<font color='rgb(100,220,100)'>Armed (Lobby)</font>"
elseif not S.map or#S.map==0 then
W="<font color='rgb(100,220,100)'>Armed (Loading...)</font>"
elseif S.boss and not T then
W="<font color='rgb(255,160,50)'>Waiting (Boss Room)</font>"
else
W="<font color='rgb(100,220,100)'>Armed (Waiting for Room)</font>"
end
else
W="<font color='rgb(160,160,160)'>Idle</font>"
end
pcall(function()F:UpdateName("State: "..W)end)

local X=T
and"<font color='rgb(255,140,255)'>FULL</font>"
or"<font color='rgb(120,200,255)'>NORMAL</font>"
local Y=V and(" (map ["..V.."])")or" (theo map)"
pcall(function()s:UpdateName("Record Mode"..Y..": "..X)end)

local Z
if S.boss then
if T then
Z="<font color='rgb(255,140,255)'>YES (FULL path)</font>"
else
Z="<font color='rgb(255,80,80)'>YES (dùng Hazard Scanner)</font>"
end
else
Z="<font color='rgb(0,255,120)'>No</font>"
end
local _=S.room and S.room>0
and("<font color='rgb(0,255,255)'>room %d</font>"):format(S.room)
or"<font color='rgb(160,160,160)'>-</font>"
local aa=S.map and#S.map>0
and("<font color='rgb(150,255,150)'>%s</font>"):format(S.map)
or"<font color='rgb(160,160,160)'>-</font>"
pcall(function()G:UpdateName("Map: "..aa.." | Room: ".._.." | Boss: "..Z)end)

if S.recording then
local ab=S.phase or 1
pcall(function()H:UpdateName(("Points: <font color='rgb(255,170,60)'>%d</font> (room %s | Phase %d)"):format(S.pointCount,tostring(S.room),ab))end)
elseif S.playing then
local ab=S.phase or 1
pcall(function()H:UpdateName(("Playing: <font color='rgb(0,230,255)'>Phase %d</font>"):format(ab))end)
else
pcall(function()H:UpdateName"Points: <font color='rgb(160,160,160)'>-</font>"end)
end

local ab=c.GetMaps()
if#ab==0 then
pcall(function()I:UpdateName"Macros: <font color='rgb(160,160,160)'>None</font>"end)
else
local ac={}
for ad,ae in ipairs(ab)do
local af=ae.bossCount and ae.bossCount>0 and("+%db"):format(ae.bossCount)or""
local ag=ae.phaseCount and ae.phaseCount>ae.roomCount and("/%dph"):format(ae.phaseCount)or""
ac[#ac+1]=("%s(%dr%s/%dp%s)"):format(ae.map,ae.roomCount,ag,ae.pointCount,af)
end
pcall(function()I:UpdateName("Macros: <font color='rgb(150,255,150)'>"..table.concat(ac,", ").."</font>")end)
end

refreshDropdown(ab)
end

c.OnStatusChanged(function(aa)
p(aa)
q(aa)
end)


local aa=0
local ab=g.Heartbeat:Connect(function()
local ab=os.clock()
if ab-aa<0.4 then return end
aa=ab
local ac=c.GetStatus()
p(ac)
q(ac)
end)

b.Register(function()
if ab then ab:Disconnect();ab=nil end
end)

p(c.GetStatus())
q(c.GetStatus())
end