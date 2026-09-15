








local a=require"@routes/DungeonQuest/core/services"
local b=require"@routes/DungeonQuest/core/shared"
local c=require"@routes/DungeonQuest/core/pathRecord/storage"
local d=require"@routes/DungeonQuest/core/notifier"

local e=a.RunService
local f=a.player
local g=a.UserInputService


local h=0.1
local i=8000
local j=0.4
local k=0.25
local l=0.15
local m=1.0
local n=6.0


local o={}


local p=true
local q=true

function o.SetCapture(r)
r=r and true or false
p=r
q=r
end

function o.IsCaptureEnabled()
return p or q
end


local r=false
local s
local t=0
local u
local v={}
local w
local x
local y
local z
local A
local B


local C=0
local D={}
local E={}
local F
local G=0
local H
local I
local J
local K
local L=false

local M=0
local N=0
local O


local P=false

local Q=false


local R=false

local S={}

local T=0
local U=0
local V=0


local W={}

local function fireStatus()
local X={
recording=r,
map=s,
room=t,
pointCount=#v,
phaseCount=#S+1,
dwellCount=#D,
skillCount=#E,
savedRooms=T,
}
for Y,Z in ipairs(W)do
pcall(Z,X)
end
end

local function getPlayerRoot()
local X=f and f.Character
local Y=X and X:FindFirstChild"HumanoidRootPart"
if Y and Y.Parent then return Y end
return nil
end


local function getFacing()
local X=getPlayerRoot()
if not X then return nil end
local Y=X.CFrame.LookVector
if Y.Magnitude<0.001 then return nil end
return{X=Y.X/Y.Magnitude,Z=Y.Z/Y.Magnitude}
end

local function stopSubscriptions()
if w then w:Disconnect();w=nil end
if x then x:Disconnect();x=nil end
if y then y();y=nil end
if z then z();z=nil end
if A then A();A=nil end
if B then B();B=nil end
end



local function beginSlice(X,Y)
t=X
u=Y
R=true
v={Y}
D={}
E={}
F=nil
G=0
H=nil
I=nil
J=nil
K=Y
M=0
N=0
C=os.clock()
O=os.clock()
L=false
Q=b.IsBossActive()
S={}
end


local function sealCurrentPhaseAndStartNext(X)
if not R then return false end
local Y=c.SimplifyPath(v,j)
if#Y>=2 then
local Z
if#D>0 or#E>0 then
Z={dwells=D,skills=E}
end
local _=0
if N>0.5 and M>5 then
_=math.clamp(M/N,5,100)
end
table.insert(S,{
startPos=u,
points=Y,
events=Z,
speed=_,
})
V+=#v
end


u=X
v={X}
D={}
E={}
F=nil
G=0
H=nil
I=nil
J=nil
K=X
M=0
N=0
C=os.clock()
O=os.clock()
L=false
fireStatus()
return true
end



local function finalizeSlice(X,Y)
if not R then return nil end
local Z=c.SimplifyPath(v,j)
if#Z>=2 then
local _
if#D>0 or#E>0 then
_={dwells=D,skills=E}
end
local aa=0
if N>0.5 and M>5 then
aa=math.clamp(M/N,5,100)
end
table.insert(S,{
startPos=u,
points=Z,
events=_,
speed=aa,
})
V+=#v
end

if#S==0 then return nil end

local aa=S[1]
local _=c.SaveSegment(
s,
t,
aa.startPos,
aa.points,
aa.events,
aa.speed,
Q,
S
)
if not _ then return nil end

T+=1
if Q then U+=1 end

if not Y then
local ab=""
if#S>1 then
ab=(" (%d phases/mạng hồi sinh, %d điểm phase 1)"):format(#S,#aa.points)
elseif aa.events then
ab=(" (%d điểm mịn, %d skill, %d nhịp dừng, %.1fspd)"):format(#aa.points,#(aa.events.skills or{}),#(aa.events.dwells or{}),aa.speed or 0)
else
ab=(" (%d điểm mịn, %.1fspd)"):format(#aa.points,aa.speed or 0)
end
d.Notify("Path Record",("Đã lưu room %d%s vào map [%s] %s"):format(t,ab,s,X and("- "..X)or""),3)
end

return{phaseCount=#S,phase1=aa}
end

function o.IsRecording()
return r
end

function o.GetStartRoom()
return t
end

function o.GetCurrentPhaseIndex()
return#S+1
end


function o.GetCurrentPoints()
return v
end

function o.GetStatus()
return{
recording=r,
map=s,
room=t,
pointCount=#v,
phaseCount=#S+1,
savedRooms=T,
}
end

function o.OnStatusChanged(aa)
if type(aa)=="function"then
table.insert(W,aa)
end
end


function o.Start()
if r then return false,"đang record rồi"end

local aa=getPlayerRoot()
if not aa then return false,"chưa có nhân vật"end
if b.IsDead()then return false,"nhân vật đang chết"end

local ab=b.GetCurrentRoomIndex()
if ab<=0 then return false,"không nằm trong dungeon"end

local X=b.GetCurrentDungeonName()
if not X or#X==0 then return false,"không xác định được map"end

P=c.GetMapMode(X)=="full"
if b.IsBossActive()and not P then return false,"boss room (dùng Hazard Scanner)"end

s=X
beginSlice(ab,aa.Position)
r=true
T=0
U=0
V=0



w=e.Heartbeat:Connect(function()
if not r then return end
if b.IsDead()then
H=nil
F=nil
K=nil
return
end

local Y=getPlayerRoot()
if not Y then return end
local Z=Y.Position




local _=v[#v]
if _ and(Z-_).Magnitude>35 then
finalizeSlice("dịch chuyển lớn",true)
local ac=b.GetCurrentRoomIndex()
if ac==t then ac=0 end
beginSlice(ac,Z)
fireStatus()

task.spawn(function()
task.wait(n)
if r and t<=0 then
o.Stop"hết map"
end
end)
return
end


local ac=os.clock()
local ad=K and(Z-K).Magnitude or 0
K=Z
local ae=O and math.max(0,ac-O)or 0
O=ac
if ad>=l then
M+=ad
N+=ae
end


if p then
if ad<l then
if not H then
H=ac
I=Z
J=getFacing()
end
if F then
F.dur=ac-H
F.facing=getFacing()or J
elseif ac-H>=k then
G=H-C
F={
pos=I,
dur=ac-H,
facing=J,
index=#D+1,
}
table.insert(D,F)
end
else
H=nil
F=nil
end
end

local af=v[#v]
if af and(Z-af).Magnitude<h then return end
if#v>=i then
o.Stop"đạt giới hạn điểm"
return
end
table.insert(v,Z)
end)




if q then
x=g.InputBegan:Connect(function(ac,ad)
if not r or not q then return end
if g:GetFocusedTextBox()then return end
if b.IsDead()then return end

local ae
if ac.UserInputType==Enum.UserInputType.MouseButton2 then
if ad then return end
ae="M2"
elseif ac.UserInputType==Enum.UserInputType.Keyboard
and(ac.KeyCode==Enum.KeyCode.Q or ac.KeyCode==Enum.KeyCode.E)then
ae=ac.KeyCode==Enum.KeyCode.Q and"Q"or"E"
else
return
end

local af=getPlayerRoot()
if not af then return end

local Y={
pos=af.Position,
facing=getFacing(),
key=ae,
dw=0,
dwT=0,
}
if F then
Y.dw=F.index
Y.dwT=math.max(0,(os.clock()-C)-G)
end
table.insert(E,Y)
end)
end







y=b.OnRoomIndexChanged(function()
if r then
local ac=b.GetCurrentRoomIndex()
if R and t<=0 and ac>0 then
t=ac
return
end
if ac~=t and not L then
L=true
task.delay(m,function()
L=false
if r then
o.Rollover()
end
end)
end
end
end)







A=b.OnBossActiveChanged(function(ac)
if not r then return end
if ac then
if P then
Q=true
else
o.Stop"vào boss room"
end
return
end

if P and Q then
finalizeSlice("xong boss",true)
Q=false
R=false
task.spawn(function()
task.wait(n)
if r and not R then
o.Stop"hết map"
end
end)
end
end)


z=b.OnLobbyChanged(function(ac)
if r and ac then
o.Stop"về lobby"
end
end)



B=b.OnRespawn(function()
if not r then return end
task.delay(0.2,function()
if not r or b.IsDead()then return end
local ac=getPlayerRoot()
if not ac then return end
if sealCurrentPhaseAndStartNext(ac.Position)then
local ad=#S+1
d.Notify(
"Path Record",
("Hồi sinh: Đã lưu Phase %d, đang ghi tiếp Phase %d cho room %d"):format(ad-1,ad,t),
3
)
end
end)
end)

d.Notify("Path Record",("Bắt đầu record room %d (%s)"):format(ab,X),2)
fireStatus()
return true
end



function o.Rollover()
if not r then return false end
finalizeSlice("chuyển room",true)
local aa=getPlayerRoot()
local ab=aa and aa.Position or u
beginSlice(b.GetCurrentRoomIndex(),ab)
fireStatus()
return true
end


function o.Stop(aa)
if not r then return false end

r=false
stopSubscriptions()

local ab=finalizeSlice(aa,true)
if ab then
if T>1 then

local ac=U>0 and(" | %d boss"):format(U)or""
d.Notify("Path Record",("Đã lưu map [%s] %s: %d room%s (%d điểm gốc)"):format(s,aa or"xong",T,ac,V),4)
else
local ac=""
if ab.events then
ac=(" (%d skill, %d nhịp dừng, %.1fspd)"):format(ab.skills,ab.dwells,ab.avgSpeed)
else
ac=(" (%.1fspd)"):format(ab.avgSpeed)
end
local ad=t>0 and(Q and" (boss)"or"")or""
d.Notify("Path Record",("Đã lưu room %d%s%s vào map [%s] %s"):format(t,ac,ad,s,aa and("- "..aa)or""),3)
end
elseif T>0 then


local ac=U>0 and(" | %d boss"):format(U)or""
d.Notify("Path Record",("Đã lưu map [%s] %s: %d room%s (%d điểm gốc)"):format(s,aa or"xong",T,ac,V),4)
end

s=nil
t=0
u=nil
v={}
D={}
E={}
F=nil
G=0
H=nil
I=nil
J=nil
K=nil
L=false
M=0
N=0
O=nil
Q=false
R=false
P=false
T=0
U=0
V=0
fireStatus()
return ab~=nil
end


function o.Cancel()
if not r then return end

stopSubscriptions()
s=nil
t=0
u=nil
v={}
D={}
E={}
F=nil
G=0
H=nil
I=nil
J=nil
K=nil
L=false
M=0
N=0
O=nil
Q=false
R=false
P=false
T=0
U=0
V=0
r=false
fireStatus()
end

return o