



local a=require"@routes/DungeonQuest/core/services"
local b=require"@routes/DungeonQuest/core/shared"
local c=require"@routes/DungeonQuest/core/lifecycle"
local d=require"@routes/DungeonQuest/core/coordinator"

local e=require"@routes/DungeonQuest/core/autoFarm/scanner"
local f=require"@routes/DungeonQuest/core/autoFarm/selector"
local g=require"@routes/DungeonQuest/core/autoFarm/tracker"
require"@routes/DungeonQuest/core/autoFarm/movement"
local h=require"@routes/DungeonQuest/core/hazardScanner"
local i=require"@routes/DungeonQuest/core/autoFarm/autoSkill"


local j=a.RunService
local k=a.player


local l={
NO_TARGET="NO_TARGET",
ACQUIRING_TARGET="ACQUIRING_TARGET",
TRACKING_TARGET="TRACKING_TARGET",
CHASE="CHASE",
HOLD="HOLD",
KITE="KITE",
BLOCKED="BLOCKED",
REPATHING="REPATHING",
}

local m={}


local n=false
local o=false
local p=1.5
local q=25.0
local r=50.0
local s=true
local t=6.0


local u=true
local v=true
local w=true
local x=true


local y=l.NO_TARGET
local z
local A="None"
local B
local C
local D=0
local E=0
local F=false
local G
local H
local I
local J=false


local K=0
local L=0
local M=false
local N=10.0
local O=false






local P
local Q
local R={}
local S
local T
local U
local V
local W
local X


local Y





local function getPlayerRoot()
local Z=k and k.Character
local _=Z and Z:FindFirstChild"HumanoidRootPart"
if _ and _.Parent then return _ end
return nil
end

local function getSafePosition(Z)
if not Z or not Z.Parent then return nil end
local _,aa=pcall(function()return Z.Position end)
if not _ or not aa then return nil end
return aa
end





local function isSameTarget(aa,Z)
if aa==Z then return true end
if aa and Z and aa.Model and Z.Model and aa.Model==Z.Model then
return true
end
return false
end

local function applyTargetSwitch(aa,Z)
local _=g.GetTarget()
if isSameTarget(_,aa)then
return
end


g.SetTarget(aa,nil,nil,Z)
z=nil
A="None"
B=nil
C=nil
K=0

if aa then
y=l.CHASE
else
y=l.NO_TARGET
end
end


Y=function()
if F or not n or not o then return end
E+=1
local aa=E
F=true

local Z=getPlayerRoot()
local _=Z and getSafePosition(Z)
if not _ then
F=false
return
end

local ab=e.Scan()
if#ab==0 then
if aa==E and n and o then
applyTargetSwitch(nil,nil)
end
F=false
return
end local

ac, ad, ae, af=f.SelectBestTarget(
_,
ab,
function()
return aa~=E or not n or not o
end
)

if aa==E and n and o then
applyTargetSwitch(ac,af)
end

F=false
end





local function stepMovementLoop(aa)
if b.IsInLobby()or not J then return end

local ab=getPlayerRoot()
local ac=b.GetHumanoid()
if not ab or not ac or ac.Health<=0 then
return
end

local ae=getSafePosition(ab)
if not ae then return end


if h.IsCurrentlyDodging and h.IsCurrentlyDodging()then
return
end


if O then
return
end


local af=os.clock()
if af-D>=p then
D=af
if y~=l.HOLD and y~=l.KITE then
Y()
end
end


local Z=g.GetTarget()
if Z then
if not g.IsTargetValid()then
g.ClearTarget()
y=l.NO_TARGET
z=nil
A="None"
C=nil
pcall(function()
ac:MoveTo(ae)
ac.AutoRotate=true
end)
Y()
return
end
end


if not Z or y==l.NO_TARGET then
z=nil
A="None"
C=nil
pcall(function()
ac:MoveTo(ae)
ac.AutoRotate=true
end)
if not F and af-D>=0.5 then
D=af
Y()
end
return
end

local _=Z.Root and getSafePosition(Z.Root)
if not _ then
g.ClearTarget()
y=l.NO_TARGET
C=nil
pcall(function()
ac:MoveTo(ae)
ac.AutoRotate=true
end)
return
end


local ag=Vector3.new(_.X-ae.X,0,_.Z-ae.Z)
local ah=ag.Magnitude


if s and ah<=(r+25)then
pcall(function()
ac.AutoRotate=false
local ai=Vector3.new(_.X,ab.Position.Y,_.Z)
if(ai-ab.Position).Magnitude>0.5 then
ab.CFrame=CFrame.lookAt(ab.Position,ai)
end
end)
else
pcall(function()ac.AutoRotate=true end)
end


i.Step(aa,Z,ah)

if ah<q then

local ai=Vector3.new(ae.X-_.X,0,ae.Z-_.Z)
local aj=ai.Magnitude>0.1 and ai.Unit or Vector3.new(0,0,1)
local ak=math.clamp(q-ah+6,4,15)
local al=ae+aj*ak


local am=true
if h and h.IsPointSafe then
am=h.IsPointSafe(al,0.5)
end

if not am then
y=l.HOLD
A="Hold (Danger Behind)"
z=nil
K=0
pcall(function()ac:MoveTo(ae)end)
else
y=l.KITE
A="Kite"
K=0
z=al
ac:MoveTo(al)
end
elseif ah<=r then

y=l.HOLD
z=nil
A="Hold"
K=0
pcall(function()ac:MoveTo(ae)end)
else

local ai=ag.Magnitude>0.1 and ag.Unit or Vector3.new(0,0,1)


local aj=false
if h and h.IsPointSafe then

for ak,al in ipairs{3,6,10}do
if al<ah then
local am=ae+ai*al
if not h.IsPointSafe(am,0.5)then
aj=true
break
end
end
end
end

if aj then

y=l.HOLD
A="Hold (Danger Ahead)"
z=nil
K=0
pcall(function()ac:MoveTo(ae)end)
else
y=l.CHASE
A="Chase"
local ak=Vector3.new(_.X,ae.Y,_.Z)
z=ak

ac:MoveTo(ak)


local al=_.Y-ae.Y
if al>1.8 and ah<=8.0 then
ac.Jump=true
end


local am=ab.AssemblyLinearVelocity or ab.Velocity
local an=am and Vector3.new(am.X,0,am.Z).Magnitude or 0
local ao=(type(aa)=="number"and aa>0)and aa or 0.016

if an<N then
K+=ao
if M and(af-L)>=0.4 then
ac.Jump=true
pcall(function()ac:ChangeState(Enum.HumanoidStateType.Jumping)end)
L=af
end
else
K=0
end
end
end
end










local function ensureDebugTargetPart()
if P and P.Parent then return P end
P=Instance.new"Part"
P.Name="TM_TargetPart_Debug"
P.Anchored=true
P.CanCollide=false
P.CanQuery=false
P.CanTouch=false
P.Size=Vector3.new(2,2,2)
P.Transparency=0.4
P.Color=Color3.fromRGB(255,50,50)
P.Material=Enum.Material.Neon
P.Parent=workspace
return P
end

local function ensureDebugHighlight()
if Q and Q.Parent then return Q end
if Q then
pcall(function()Q:Destroy()end)
Q=nil
end
Q=Instance.new"Highlight"
Q.Name="TM_EnemyHighlight_Debug"
Q.FillColor=Color3.fromRGB(255,200,0)
Q.FillTransparency=0.5
Q.OutlineColor=Color3.fromRGB(255,0,0)
Q.OutlineTransparency=0
Q.Parent=workspace
return Q
end

local function ensureDebugPathAdornee()
if S and S.Parent then return S end
S=Instance.new"Part"
S.Name="TM_PathAdornee_Debug"
S.Anchored=true
S.CanCollide=false
S.CanQuery=false
S.CanTouch=false
S.Transparency=1
S.Size=Vector3.new(1,1,1)
S.CFrame=CFrame.new(0,0,0)
S.Parent=workspace
return S
end

local function destroyPathVisuals()
for aa,ab in ipairs(R)do
pcall(function()ab:Destroy()end)
end
table.clear(R)
X=nil
end

local function updateVisualDebugs()
if b.IsInLobby()then return end

local aa=g.GetTarget()
local ab=getPlayerRoot()
local ac=ab and getSafePosition(ab)


if not w or not aa or not aa.Root then
if P and P.Parent then
P.CFrame=CFrame.new(0,-1E3,0)
end
if Q and Q.Parent then
Q.Enabled=false
end
else
local ae=getSafePosition(aa.Root)
if ae then
local af=ensureDebugTargetPart()
af.CFrame=CFrame.new(ae)
end
local af=ensureDebugHighlight()
if aa.Model and aa.Model.Parent then
af.Adornee=aa.Model
af.Enabled=true
else
af.Enabled=false
end
end


local ae=g.GetWaypoints()
local af=g.GetPathInstance()
if not u or not ae or#ae==0 then
destroyPathVisuals()
else
local ag=tostring(af).."_"..tostring(#ae)
if X~=ag then
destroyPathVisuals()
local ah=ensureDebugPathAdornee()
for ai=2,#ae do
local aj=ae[ai-1].Position
local ak=ae[ai].Position
local al=(ak-aj).Magnitude
if al>0.01 then
local am=Instance.new"LineHandleAdornment"
am.Name="TM_PathLine_Debug"
am.Adornee=ah
am.Length=al
am.Thickness=2
am.Transparency=0.3
am.Color3=Color3.fromRGB(0,255,120)
am.ZIndex=0
am.CFrame=CFrame.lookAt(aj,ak)
am.Parent=workspace
R[#R+1]=am
end
end
X=ag
end
end


if not v or not z or not ac then
if T then T.Visible=false end
if U and U.Parent then
U.CFrame=CFrame.new(0,-1E3,0)
end
else
local ag=ac+Vector3.new(0,0.5,0)
local ah=z+Vector3.new(0,0.5,0)
local ai=(ah-ag).Magnitude

if ai>=0.3 then
if not T or not T.Parent then
local aj=ensureDebugPathAdornee()
T=Instance.new"LineHandleAdornment"
T.Name="TM_ActualPath_Debug"
T.Adornee=aj
T.Thickness=3.5
T.Transparency=0.15
T.Color3=Color3.fromRGB(0,230,255)
T.ZIndex=2
T.Parent=workspace
end
T.Length=ai
T.CFrame=CFrame.lookAt(ag,ah)
T.Visible=true

if not U or not U.Parent then
U=Instance.new"Part"
U.Name="TM_ActualMarker_Debug"
U.Anchored=true
U.CanCollide=false
U.CanQuery=false
U.CanTouch=false
U.Shape=Enum.PartType.Ball
U.Size=Vector3.new(1.3,1.3,1.3)
U.Transparency=0.2
U.Material=Enum.Material.Neon
U.Color=Color3.fromRGB(0,230,255)
U.Parent=workspace
end
U.CFrame=CFrame.new(ah)
else
if T then T.Visible=false end
if U and U.Parent then
U.CFrame=CFrame.new(0,-1E3,0)
end
end
end


if not x or not C or not ac or not aa then
if V then V.Visible=false end
if W and W.Parent then
W.CFrame=CFrame.new(0,-1E3,0)
end
else
local ag=C.origin or(ac+Vector3.new(0,1.5,0))
local ah=C.directHitPos or C.targetPos
local ai=C.directBlocked

if ah then
local aj=(ah-ag).Magnitude
if aj>=0.2 then
if not V or not V.Parent then
local ak=ensureDebugPathAdornee()
V=Instance.new"LineHandleAdornment"
V.Name="TM_BlockerRay_Debug"
V.Adornee=ak
V.Thickness=3
V.Transparency=0.2
V.ZIndex=3
V.Parent=workspace
end

V.Length=aj
V.Color3=ai and Color3.fromRGB(255,30,30)or Color3.fromRGB(50,255,50)
V.CFrame=CFrame.lookAt(ag,ah)
V.Visible=true


if ai and C.directHitPos then
if not W or not W.Parent then
W=Instance.new"Part"
W.Name="TM_BlockerHitMarker_Debug"
W.Anchored=true
W.CanCollide=false
W.CanQuery=false
W.CanTouch=false
W.Shape=Enum.PartType.Ball
W.Size=Vector3.new(1.0,1.0,1.0)
W.Material=Enum.Material.Neon
W.Color=Color3.fromRGB(255,30,30)
W.Parent=workspace
end
W.CFrame=CFrame.new(C.directHitPos)
else
if W and W.Parent then
W.CFrame=CFrame.new(0,-1E3,0)
end
end
else
if V then V.Visible=false end
if W and W.Parent then
W.CFrame=CFrame.new(0,-1E3,0)
end
end
end
end
end

local function cleanupDebugVisuals()
if P then pcall(function()P:Destroy()end);P=nil end
if Q then pcall(function()Q:Destroy()end);Q=nil end
if T then pcall(function()T:Destroy()end);T=nil end
if U then pcall(function()U:Destroy()end);U=nil end
if V then pcall(function()V:Destroy()end);V=nil end
if W then pcall(function()W:Destroy()end);W=nil end
destroyPathVisuals()
if S then pcall(function()S:Destroy()end);S=nil end
end





function m.IsEnabled()
return n
end

function m.IsRunning()
return o
end

function m.GetState()
return y
end

function m.GetScanInterval()
return p
end

function m.SetScanInterval(aa)
if type(aa)=="number"and aa>0.1 then
p=aa
end
end

function m.GetMinCombatDistance()
return q
end

function m.SetMinCombatDistance(aa)
if type(aa)=="number"and aa>=1 then
q=aa
if q>r then
r=q+5
end
end
end

function m.GetMaxCombatDistance()
return r
end

function m.SetMaxCombatDistance(aa)
if type(aa)=="number"and aa>=2 then
r=aa
if q>r then
q=math.max(1,r-5)
end
end
end

function m.IsAutoFaceTargetEnabled()
return s
end

function m.SetAutoFaceTarget(aa)
s=aa and true or false
if not s then
local ab=b.GetHumanoid()
if ab and ab.Parent then
pcall(function()ab.AutoRotate=true end)
end
end
end


function m.GetReachDistance()
return r
end

function m.SetReachDistance(aa)
if type(aa)=="number"and aa>=2 then
r=aa
q=math.clamp(aa*0.6,2,aa-2)
end
end

function m.GetRepathDistance()
return t
end

function m.SetRepathDistance(aa)
if type(aa)=="number"and aa>=1 then
t=aa
g.SetRepathThreshold(aa)
end
end

function m.SetAutoJumpOnStuck(aa)
M=aa and true or false
end

function m.IsAutoJumpOnStuckEnabled()
return M
end

function m.SetStuckVelocityThreshold(aa)
if type(aa)=="number"and aa>=1 then
N=aa
end
end

function m.GetStuckVelocityThreshold()
return N
end

function m.SetPaused(aa)
local ab=aa and true or false
if ab==O then return end
O=ab
if O then
local ac=b.GetHumanoid()
local ae=getPlayerRoot()
if ac and ac.Parent and ae then
pcall(function()
ac:MoveTo(ae.Position)
ac.AutoRotate=true
end)
end
end
end

function m.IsPaused()
return O
end


m.IsAutoSkillEnabled=i.IsEnabled
m.SetAutoSkillEnabled=i.SetEnabled
m.IsAutoSkillQEnabled=i.IsSkillQEnabled
m.SetAutoSkillQEnabled=i.SetSkillQEnabled
m.IsAutoSkillEEnabled=i.IsSkillEEnabled
m.SetAutoSkillEEnabled=i.SetSkillEEnabled
m.GetSkillERange=i.GetSkillERange
m.SetSkillERange=i.SetSkillERange
m.GetSkillSpamInterval=i.GetSpamInterval
m.SetSkillSpamInterval=i.SetSpamInterval
m.IsBuffActive=i.IsBuffActive
m.CastSkillQ=i.CastSkillQ
m.CastSkillE=i.CastSkillE

function m.IsPlannedPathVisualEnabled()
return u
end

function m.SetPlannedPathVisual(aa)
u=aa==true
if not u then destroyPathVisuals()end
end

function m.IsActualPathVisualEnabled()
return v
end

function m.SetActualPathVisual(aa)
v=aa==true
if not v then
if T then T.Visible=false end
if U and U.Parent then
U.CFrame=CFrame.new(0,-1E3,0)
end
end
end

function m.IsBlockerRayVisualEnabled()
return x
end

function m.SetBlockerRayVisual(aa)
x=aa==true
if not x then
if V then V.Visible=false end
if W and W.Parent then
W.CFrame=CFrame.new(0,-1E3,0)
end
end
end

function m.IsTargetVisualEnabled()
return w
end

function m.SetTargetVisual(aa)
w=aa==true
if not w then
if P and P.Parent then
P.CFrame=CFrame.new(0,-1E3,0)
end
if Q and Q.Parent then
Q.Enabled=false
end
end
end

function m.GetDebugInfo()
local aa=getPlayerRoot()
local ab=aa and getSafePosition(aa)
local ac=g.GetTarget()
local ae="-"
local af=0
local ag=0
local ah=g.GetWaypoints()

if ac and ac.Model then
ae=ac.Model.Name or"-"
local ai=getSafePosition(ac.Root)
if ai and ab then
af=(ai-ab).Magnitude
ag=Vector3.new(ai.X-ab.X,0,ai.Z-ab.Z).Magnitude
end
end

local ai={
directBlocked=false,
blockerName="None",
blockerDist=0,
}

if C then
ai.directBlocked=C.directBlocked==true
if C.directHitPart then
ai.blockerName=C.directHitPart.Name or"Part"
end
if C.directHitPos and ab then
ai.blockerDist=(C.directHitPos-ab).Magnitude
end
end

local aj=0
local ak=0
if aa then
local al=aa.AssemblyLinearVelocity or aa.Velocity
if al then
aj=Vector3.new(al.X,0,al.Z).Magnitude
ak=al.Y
end
end

return{
state=y,
enemyName=ae,
enemyDist=af,
enemyFlat=ag,
hasTarget=ac~=nil,
destMode=A,
nodeIndex=B,
waypointCount=ah and#ah or 0,
hasDestination=z~=nil,
blocker=ai,
velocity=aj,
verticalVelocity=ak,
stuckTimer=K,
}
end


function m.Toggle(aa,ab)
if aa==n then return end
n=aa

if n then
if not ab then
d.EnableExclusive"AutoFarm"
end
if G then G:Disconnect();G=nil end

o=true
E=0
F=false
D=0
g.SetRepathThreshold(t)

if not H then
H=b.OnEnemyChanged(function()
if n and o and y~=l.HOLD then
Y()
end
end)
end

if not I then
I=b.OnRespawn(function()
g.ClearTarget()
y=l.NO_TARGET
C=nil
Y()
end)
end

if not J then
task.spawn(function()
if b.ReadyDungeon()then J=true end
end)
end

task.defer(Y)

G=j.Heartbeat:Connect(function(ac)
local ae,af=pcall(stepMovementLoop,ac)
if not ae then
warn(("[AutoFarm] Error in stepMovementLoop: %s"):format(tostring(af)))
end
updateVisualDebugs()
end)
else
if G then G:Disconnect();G=nil end
o=false
if H then H();H=nil end
if I then I();I=nil end

local ac=b.GetHumanoid()
local ae=getPlayerRoot()
if ac and ac.Parent and ae then
pcall(function()
ac:MoveTo(ae.Position)
ac.AutoRotate=true
end)
end

g.ClearTarget()
y=l.NO_TARGET
z=nil
A="None"
C=nil
K=0
E+=1
F=false
cleanupDebugVisuals()




end
end


d.Register("AutoFarm",m.Toggle,m.IsEnabled)

c.Register(function()
m.Toggle(false)
cleanupDebugVisuals()
end)

return m