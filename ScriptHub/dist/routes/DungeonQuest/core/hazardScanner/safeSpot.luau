




local a=require"@routes/DungeonQuest/core/services"
local b=require"@routes/DungeonQuest/core/lifecycle"
local c=require"@routes/DungeonQuest/core/hazardScanner/geometry"
local d=require"@routes/DungeonQuest/core/hazardScanner/trajectory"
local e=require"@routes/DungeonQuest/core/hazardScanner/playerVisual"
local f=require"@routes/DungeonQuest/core/hazardScanner/candidateGenerator"
local g=require"@routes/DungeonQuest/core/hazardScanner/safeSpotVisual"

local h=a.RunService or game:GetService"RunService"
local i=game:GetService"Players"
local j=a.player


local k={}


local l=true
local m=true
local n=true
local o=2.0
local p
local q
local r
local s=0
local t=false
local u
local v
local w={}
local x={}
local y=0


local function getPlayerRoot()
local z=j or i.LocalPlayer
if not z then return nil end
local A=z.Character
if not A or not A.Parent then return nil end
local B=A:FindFirstChildOfClass"Humanoid"
if B and B.Health<=0 then return nil end
return A:FindFirstChild"HumanoidRootPart"or A.PrimaryPart
end


local function getPlayerRunningDirection(z)
local A=j or i.LocalPlayer
if not A then return nil end
local B=A.Character
if not B or not B.Parent then return nil end


local C=B:FindFirstChildOfClass"Humanoid"
if C and C.Health>0 then
local D=C.MoveDirection
if D and D.Magnitude>0.1 then
return Vector3.new(D.X,0,D.Z).Unit
end
end


if z and z.Parent then
local D=Vector3.zero
pcall(function()
D=z.AssemblyLinearVelocity or z.Velocity or Vector3.zero
end)
local E=Vector3.new(D.X,0,D.Z)
if E.Magnitude>=2.0 then
return E.Unit
end
end

return nil
end


local function getPlayerGroundY(z)
if not z then return 0 end
return z.Position.Y-2.5
end


function k.IsPointSafe(z,A)
if not z then return false end
local B=Vector3.new(z.X,0,z.Z)
local C=(e.GetRadius and e.GetRadius()or 1.8)+(A or 0)


if c.IsPointInAnyHazard and c.IsPointInAnyHazard(B,nil,C)then
return false
end


if d.IsPointInAnyTrajectory and d.IsPointInAnyTrajectory(B,C)then
return false
end

return true
end



function k.FindNearestSafeSpot(z)
local A=getPlayerRoot()
if not z then
if not A then return nil,false,0,Vector3.zero end
z=A.Position
end

local B=Vector3.new(z.X,0,z.Z)
local C=getPlayerRunningDirection(A)
table.clear(x)


local D=c.GetNearbyHazards and c.GetNearbyHazards(B,65)or nil
local E=d.GetNearbyTrajectories and d.GetNearbyTrajectories(B,65)or nil


local function isPointSafeScoped(F,G)
if not F then return false end
local H=Vector3.new(F.X,0,F.Z)
local I=(e.GetRadius and e.GetRadius()or 1.8)+(G or 0)

if c.IsPointInAnyHazard and c.IsPointInAnyHazard(H,nil,I,D)then
return false
end

if d.IsPointInAnyTrajectory and d.IsPointInAnyTrajectory(H,I,E)then
return false
end

return true
end


if(D and#D==0 and E and#E==0)or isPointSafeScoped(B,0)then
table.insert(x,{pos=B,isSafe=true,isChosen=true})
return B,true,0,Vector3.zero
end


local F,G,H,I=f.SamplePass(
B,
f.COARSE_DIRECTIONS,
f.COARSE_RADII,
o,
true,
isPointSafeScoped,
x,
C
)


if not G then
F,G,H,I=f.SamplePass(
B,
f.FINE_DIRECTIONS,
f.FINE_RADII,
o,
true,
isPointSafeScoped,
x,
C
)
end


if not G then
F,G,H,I=f.SamplePass(
B,
f.FINE_DIRECTIONS,
f.FINE_RADII,
0,
false,
isPointSafeScoped,
x,
C
)
end

if G and F then

for J,K in ipairs(x)do
if(K.pos-F).Magnitude<0.25 then
K.isChosen=true
break
end
end
return F,true,H,I
end


return B,false,math.huge,Vector3.zero
end


local function onHeartbeat()
if not l then
g.Hide()
return
end

local z=getPlayerRoot()
if not z or not z.Parent then
g.Hide()
return
end


local A,B,C=false
if e.IsPlayerInDanger then
A,B,C=e.IsPlayerInDanger()
end


local D=A or(p~=nil)or t
if not D then
local E=os.clock()
if E-y<0.05 then
return
end
y=E
end

local E=getPlayerGroundY(z)
local F=Vector3.new(z.Position.X,0,z.Position.Z)

if A then



local G=p and(p-F).Magnitude or 0
local H=p and k.IsPointSafe(p)
local I=(B==q and C==r)


if not H or not I or not p then local
J, K, L, M=k.FindNearestSafeSpot(z.Position)

if K and J then
p=J
q=B
r=C
s=L
t=true

g.Update(z,J,E,x,m,n)

for N,O in ipairs(w)do
pcall(O,true,J,L)
end
else
g.Hide()
end
else

s=G
g.Update(z,p,E,x,m,n)

for J,K in ipairs(w)do
pcall(K,true,p,G)
end
end
else


local G=p and(p-F).Magnitude or 0
local H=p and k.IsPointSafe(p)

if H and G>0.8 then
s=G
g.Update(z,p,E,x,m,n)
for I,J in ipairs(w)do
pcall(J,true,p,G)
end
else

if t or p then
t=false
p=nil
q=nil
r=nil
s=0
g.Hide()

for I,J in ipairs(w)do
pcall(J,false,nil,0)
end
end
end
end
end


local function startTracking()
if not u then
u=h.Heartbeat:Connect(onHeartbeat)
end
if not v and e.OnDangerStatusChanged then

v=e.OnDangerStatusChanged(function(z)
if z and l then
onHeartbeat()
end
end)
end
end


function k.Cleanup()
if u then
u:Disconnect()
u=nil
end
g.Cleanup()
table.clear(x)
p=nil
q=nil
r=nil
s=0
t=false
y=0
end


function k.GetLastSafeSpot()
return p,s,t
end

function k.OnSafeSpotChanged(z)
if type(z)=="function"then
table.insert(w,z)
end
end

function k.SetVisualEnabled(z)
m=z and true or false
if not m then
g.Hide()
end
end

function k.IsVisualEnabled()
return m
end

function k.SetShowCandidates(z)
n=z and true or false
if not n then
g.HideCandidates()
end
end

function k.IsShowCandidates()
return n
end

function k.SetEnabled(z)
l=z and true or false
if not l then
g.Hide()
end
end

function k.IsEnabled()
return l
end

function k.SetSafetyBuffer(z)
if type(z)=="number"and z>=0 then
o=z
end
end

function k.GetSafetyBuffer()
return o
end


local function hookRespawn()
local z=j or i.LocalPlayer
if not z then return end
z.CharacterAdded:Connect(function()
g.Cleanup()
end)
end
hookRespawn()


startTracking()


b.Register(function()
k.Cleanup()
end)

return k