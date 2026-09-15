












local a=require"@routes/DungeonQuest/core/services"
local b=require"@routes/DungeonQuest/core/shared"
local c=require"@routes/DungeonQuest/core/pathRecord/storage"
local d=require"@routes/DungeonQuest/core/notifier"
local e=require"@routes/DungeonQuest/core/autoFarm/selector"
local f=require"@routes/DungeonQuest/core/autoFarm/movement"

local g=a.player
local h=a.VirtualInputManager
local i=a.UserInputService


local j=0.4
local k=0.5
local l=8.0
local m=2.0
local n=4.5
local o=1.5
local p=8.0
local q=14.0
local r=8.0
local s=2.0
local t=0.5
local u=2.0
local v=0.001
local w=0.1


local x={}


local y=true
local z=true
local A=true
local B=0.6
local C=0.005

function x.SetSkillFaceHold(D)
if type(D)=="number"then
B=math.clamp(D,t,u)
end
end

function x.GetSkillFaceHold()
return B
end

function x.SetDoubleClickDelay(D)
if type(D)=="number"then
C=math.clamp(D,v,w)
end
end

function x.GetDoubleClickDelay()
return C
end

function x.SetReplayTimeline(D)
D=D and true or false
y=D
z=D
A=D
end

function x.IsReplayTimelineEnabled()
return y
end




local D=true
local E=false
local F
local G

function x.SetSpeedMatch(H)
D=H and true or false
end

function x.IsSpeedMatchEnabled()
return D
end

function x.SetUseFastSpeed(H)
E=H and true or false
end

function x.IsUseFastSpeedEnabled()
return E
end


local function applyPlaybackSpeed(H)
local I
if E then
local J=b.GetFastSpeed()
if type(J)=="number"and J>0 then
I=J
end
elseif D then
if type(H)=="number"and H>0 then
I=H
end
end

if not I or I<=0 then return end
local J=b.GetHumanoid()
if not J then return end
if F==nil then G=J.WalkSpeed end
F=I
if J.WalkSpeed~=I then J.WalkSpeed=I end
end

local function restorePlaybackSpeed()
if F==nil then return end
local H=b.GetHumanoid()
if G and H and H.WalkSpeed~=G then
H.WalkSpeed=G
end
F=nil
G=nil
end


local H=false
local I=false
local J
local K=false
local L
local M=1
local N={}

local function fireStatus(O)
local P={
playing=H,
map=J,
room=b.GetCurrentRoomIndex(),
boss=b.IsBossActive(),
phase=M,
resume=I,
reason=O,
}
for Q,R in ipairs(N)do
pcall(R,P)
end
end

function x.GetCurrentPhaseIndex()
return M
end

local function getPlayerRoot()
local O=g and g.Character
local P=O and O:FindFirstChild"HumanoidRootPart"
if P and P.Parent then return P end
return nil
end

local function getSafePosition(O)
if not O or not O.Parent then return nil end
local P,Q=pcall(function()
return O.Position
end)
if not P or not Q then return nil end
return Q
end

local function flatDistance(O,P)
local Q=O.X-P.X
local R=O.Z-P.Z
return math.sqrt(Q*Q+R*R)
end


local function cancelMove(O)
local P=getPlayerRoot()
if P and O then
local Q=getSafePosition(P)
if Q then pcall(function()O:MoveTo(Q)end)end
end
end





local function fireSkill(O)
local P=b.GetKeyHoldTime()or 0.05
local Q=C
local R=i:GetMouseLocation()
task.spawn(function()
pcall(function()
local function send(S)
if O=="Q"or O=="E"then
local T=O=="Q"and Enum.KeyCode.Q or Enum.KeyCode.E
h:SendKeyEvent(S,T,false,game)
else
h:SendMouseButtonEvent(R.X,R.Y,1,S,game,false)
end
end


send(true)
task.wait(P)
send(false)


if Q>0 then
task.wait(Q)
end


send(true)
task.wait(P)
send(false)
end)
end)
end


local function setFacing(O,P)
if not O or not O.Parent then return end
local Q=b.GetHumanoid()
if Q then Q.AutoRotate=false end
local R=P or Vector3.new(1,0,0)
if R.Magnitude<0.1 then R=Vector3.new(1,0,0)end
R=Vector3.new(R.X,0,R.Z).Unit
pcall(function()
local S=O.Position
O.CFrame=CFrame.lookAt(S,S+R)
end)
end

local function restoreAutoRotate()
local O=b.GetHumanoid()
if O then O.AutoRotate=true end
end









local function chaseToStart(O,P,Q,R,S,T)
local U={g.Character}
local V
local W={}
local X=1
local Y=0
local Z=0

while H do
if not P or not P.Parent then restoreAutoRotate();return false,"no_root"end
if b.IsDead()then restoreAutoRotate();return false,"dead"end
if b.GetCurrentRoomIndex()~=Q then restoreAutoRotate();return false,"room_changed"end
if b.IsBossActive()and not R then restoreAutoRotate();return false,"boss"end

local _=getSafePosition(P)
if not _ then
task.wait(0.08)
continue
end


if flatDistance(_,S)<=k then break end
if os.clock()>=T then break end


if not V or#W==0 then
if V then pcall(function()V:Destroy()end)end
V,W=nil,{}
local aa,ab=e.ComputePathWithCost(_,S)
if aa and ab and#ab>0 then
V=aa
W=ab
X=1
Y=0
else


pcall(function()O:MoveTo(S)end)
task.wait(0.1)
continue
end
end


local aa=W[X]
if aa and flatDistance(_,aa.Position)<=3.5 then
X=math.min(#W+1,X+1)
end



local ab,ac=f.ResolveDestination(_,S,W,X,U)
if ac=="Blocked"or not ab then
if V then pcall(function()V:Destroy()end)end
V,W=nil,{}
pcall(function()O:MoveTo(_)end)
task.wait(0.1)
continue
end


f.ExecuteMove(O,_,ab,W,X)



local ad=(ab-_).Magnitude
if ad>=1.5 then
local ae=P.AssemblyLinearVelocity or P.Velocity
local af=ae and Vector3.new(ae.X,0,ae.Z).Magnitude or 0
local ag=os.clock()
if af<10 then
Y+=0.1
if(ag-Z)>=0.4 then
pcall(function()O.Jump=true end)
Z=ag
end
if Y>=1.5 then
if V then pcall(function()V:Destroy()end)end
V,W=nil,{}
Y=0
end
else
Y=0
end
else
Y=0
end

task.wait(0.1)
end

if V then pcall(function()V:Destroy()end)end
V=nil
if not H then return false,"stopped"end
return true
end











local function walkThrough(aa,ab,ac)
local ad=b.GetHumanoid()
local ae=getPlayerRoot()
if not ad or not ae then return end


applyPlaybackSpeed(aa.speed)

local af=c.SimplifyPath(aa.points,j)
local ag=#af
if ag<2 then return end

local O=0
local P={}
P[1]=0
for Q=2,ag do
local R=flatDistance(af[Q-1],af[Q])
O+=R
P[Q]=O
end






local function projectPoint(Q,R,S)
R=R or 0
S=S or O
local T=0
local U=math.huge
for V=2,ag do
if P[V]<R then continue end
if P[V-1]>S then continue end
local W,X=af[V-1],af[V]
local Y,Z=W.X,W.Z
local _=X.X-Y
local ah=X.Z-Z
local ai=_*_+ah*ah
local aj=0
if ai>0 then
aj=((Q.X-Y)*_+(Q.Z-Z)*ah)/ai
aj=math.clamp(aj,0,1)
end
local ak=Q.X-(Y+_*aj)
local al=Q.Z-(Z+ah*aj)
local am=ak*ak+al*al
if am<U then
U=am
T=P[V-1]+math.sqrt(ai)*aj
end
end
return T
end



local function pointAt(ah)
local ai=2
while ai<=ag and P[ai]<ah do ai+=1 end
ai=math.min(ai,ag)
local aj=P[ai]-P[ai-1]
if aj<=0 then return af[ai]end
local ak=math.clamp((ah-P[ai-1])/aj,0,1)
local al,am=af[ai-1],af[ai]
return Vector3.new(
al.X+(am.X-al.X)*ak,
al.Y+(am.Y-al.Y)*ak,
al.Z+(am.Z-al.Z)*ak
)
end




local function getAdaptiveLookahead(ah)
local ai=math.min(ah+2.5,O)
local aj=math.min(ah+5.5,O)
if aj-ah<1.0 then return m end

local ak=pointAt(ah)
local al=pointAt(ai)
local am=pointAt(aj)

local Q,R=al.X-ak.X,al.Z-ak.Z
local S,T=am.X-al.X,am.Z-al.Z
local U=math.sqrt(Q*Q+R*R)
local V=math.sqrt(S*S+T*T)

if U>0.1 and V>0.1 then
local W=math.clamp((Q*S+R*T)/(U*V),-1,1)


local X=math.clamp((W+0.2)/1.2,0,1)
return m+(n-m)*X
end
return n
end






local ah={}
local ai={}
if aa.events and(y or z or A)then
local aj=aa.events.dwells or{}
local ak=aa.events.skills or{}
for al,am in ipairs(aj)do
ah[al]={
arc=projectPoint(am.pos),
dur=am.dur or 0,
facing=am.facing,
skills={},
}
end
for al,am in ipairs(ak)do
local Q=(y and am.dw>0 and ah[am.dw])and ah[am.dw]or nil
if Q then
table.insert(Q.skills,{tOff=am.dwT or 0,facing=am.facing,key=am.key})
else
table.insert(ai,{
arc=projectPoint(am.pos),
facing=am.facing,
key=am.key,
})
end
end
table.sort(ai,function(al,am)return al.arc<am.arc end)
end


local function runDwell(aj)
if not H or aj.dur<=0 then return true end
if y then
if A then setFacing(ae,aj.facing)end
local ak=getSafePosition(ae)
local al=os.clock()
local am=1
while H and os.clock()-al<aj.dur do
if not ae or not ae.Parent then return false,"no_root"end
if b.IsDead()then return false,"dead"end
if b.GetCurrentRoomIndex()~=ab then return false,"room_changed"end
if b.IsBossActive()and not ac then return false,"boss"end

local Q=ak or getSafePosition(ae)
if Q then pcall(function()ad:MoveTo(Q)end)end
local R=aj.skills[am]
if R and os.clock()-al>=R.tOff then
if z then
if A then setFacing(ae,R.facing)end
fireSkill(R.key or"M2")
elseif A then
setFacing(ae,R.facing)
end
am+=1
end
task.wait(0.05)
end
if A then restoreAutoRotate()end
end
return true
end




local aj=af[1]
local ak=os.clock()+l
local al,am=chaseToStart(ad,ae,ab,ac,aj,ak)
if(not al)and am and am~="stopped"then
return false,am
end

local Q=0
local R=getSafePosition(ae)
local S=os.clock()
local T=1
local U=1
local V=0
local W



local X
local Y=0
local function sendMove(Z)
local _=os.clock()
local an=X and flatDistance(X,Z)or math.huge
if an>0.5 or _-Y>=0.25 then
X=Z
Y=_
pcall(function()ad:MoveTo(Z)end)
end
end

while H do
if not ae or not ae.Parent then restoreAutoRotate();return false,"no_root"end
if b.IsDead()then restoreAutoRotate();return false,"dead"end
if b.GetCurrentRoomIndex()~=ab then restoreAutoRotate();return false,"room_changed"end
if b.IsBossActive()and not ac then restoreAutoRotate();return false,"boss"end

local an=getSafePosition(ae)
if not an then
task.wait(0.08)
continue
end


local Z=projectPoint(
an,
math.max(0,Q-p),
math.min(O,Q+q)
)
if Z>Q then Q=Z end


if R then
if flatDistance(an,R)>0.02 then S=os.clock()end
end
R=an
if os.clock()-S>r then
Q=math.min(Q+s,O-k)
S=os.clock()
R=an
end



local _=ai[U]
local ao=false
if _ and A and _.facing then
if Q>=_.arc-o and Q<_.arc then
setFacing(ae,_.facing)
ao=true
end
end




while U<=#ai and ai[U].arc<=Q do
local ap=ai[U]
if A then
setFacing(ae,ap.facing)
W=ap.facing
V=os.clock()+B
end
if z then
fireSkill(ap.key or"M2")
end
U+=1
end


local ap=ah[T]
if ap and Q>=ap.arc then
local aq,ar=runDwell(ap)
if not aq then restoreAutoRotate();return false,ar end
T+=1
R=getSafePosition(ae)
S=os.clock()
continue
end


if Q>=O-k then
restoreAutoRotate()
pcall(function()ad:MoveTo(af[ag])end)
local aq=os.clock()+5
while H do
local ar=getSafePosition(ae)
if ar and flatDistance(ar,af[ag])<=k then break end
if b.GetCurrentRoomIndex()~=ab then restoreAutoRotate();return false,"room_changed"end
if(b.IsBossActive()and not ac)or b.IsDead()then restoreAutoRotate();return false,"dead"end
if os.clock()>=aq then break end
if os.clock()>=V and ad.AutoRotate~=true then
ad.AutoRotate=true
end
task.wait(0.08)
end
restoreAutoRotate()
return true,"completed"
end


if os.clock()<V or ao then

if ad.AutoRotate~=false then ad.AutoRotate=false end
elseif ad.AutoRotate~=true then
ad.AutoRotate=true
end
local aq=getAdaptiveLookahead(Q)
local ar=pointAt(math.min(Q+aq,O-0.01))
sendMove(ar)
task.wait(0.1)
end
restoreAutoRotate()
return false,"stopped"
end

local function playbackLoop()


local aa=0
local ab=false
local ac=false
M=1

while H do
if I then break end

if b.IsDead()then
ac=true
task.wait(0.25)
continue
end
if ac then
ac=false
end
if b.IsInLobby()then

I=false
H=false
break
end
if b.IsBossActive()and not K then

task.wait(0.25)
continue
end

local ad=b.GetCurrentRoomIndex()
if ad<=0 then
task.wait(0.1)
continue
end


if ad~=aa then
aa=ad
ab=false
M=1
end

local ae=c.GetRoomSegment(J,ad)
if not ae then

task.wait(0.1)
continue
end

local af=ae.phases or{ae}
local ag=#af

if ab then

task.wait(0.1)
continue
end

local ah=af[math.min(M,ag)]or ae

local ai,aj=walkThrough(ah,ad,K)
restoreAutoRotate()
if ai then
ab=true
else

if aj=="dead"then
M+=1
local ak=math.min(M,ag)
if ag>1 then
d.Notify(
"Path Record",
("Tử trận (Phase %d/%d): Chờ hồi sinh để chạy Phase %d..."):format(
M-1,
ag,
ak
),
3
)
else
d.Notify("Path Record","Tử trận: Đang chờ hồi sinh để đi lại...",2)
end

while H and b.IsDead()do
task.wait(0.2)
end
task.wait(0.6)
end
end
end
restorePlaybackSpeed()
restoreAutoRotate()
L=nil
fireStatus()
end

function x.IsPlaying()
return H
end

function x.ResumeWanted()
return I
end

function x.GetActiveMap()
return J
end


function x.IsBossPlayActive()
return K
end

function x.GetStatus()
return{
playing=H,
map=J,
room=b.GetCurrentRoomIndex(),
boss=b.IsBossActive(),
phase=M,
resume=I,
}
end

function x.OnStatusChanged(aa)
if type(aa)=="function"then
table.insert(N,aa)
end
end


function x.Start()
if H then return false,"đang phát rồi"end
if b.IsInLobby()then return false,"đang ở lobby"end

local aa=b.GetCurrentRoomIndex()
if aa<=0 then return false,"chưa có room"end

local ab=b.GetCurrentDungeonName()
if not ab or#ab==0 then return false,"không xác định được map"end
if not c.HasSegmentOrMacro(ab,aa)then
return false,("map [%s] chưa có segment room %d"):format(ab,aa)
end


local ac=c.GetMapMode(ab)=="full"
if b.IsBossActive()and(not ac or not c.HasSegmentOrMacro(ab,aa))then
return false,"boss room (hãy dùng Hazard Scanner)"
end

J=ab
K=ac
I=false
M=1
H=true
L=task.spawn(playbackLoop)
fireStatus"started"
return true
end


function x.Stop()
H=false
I=false
J=nil
K=false
M=1
if L then
task.cancel(L)
L=nil
end
cancelMove(b.GetHumanoid())
restorePlaybackSpeed()
restoreAutoRotate()
fireStatus"stopped"
end



function x.PauseForExclusive()
if not H then return end

I=true
H=false
K=false
if L then
task.cancel(L)
L=nil
end
cancelMove(b.GetHumanoid())
restorePlaybackSpeed()
restoreAutoRotate()
d.Notify("Path Record","Nhường điều khiển: sẽ tự phát tiếp khi vào room có bản ghi",3)
fireStatus"paused"
end

return x