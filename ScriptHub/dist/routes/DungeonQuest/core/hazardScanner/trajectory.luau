






local a=require"@routes/DungeonQuest/core/services"
local b=require"@routes/DungeonQuest/core/lifecycle"
local c=require"@routes/DungeonQuest/core/hazardScanner/geometry"

local d=a.RunService or game:GetService"RunService"
local e=a.player


local f={}


local g=false
local h
local i=45
local j={}
local k


local l=0.85
local m=Color3.fromRGB(255,140,0)
local n=0.65
local o=0.20
local p=3.5


local function getPlayerGroundY()
local q=e and e.Character
if not q then return nil end
local r=q:FindFirstChild"HumanoidRootPart"or q.PrimaryPart
if not r then return nil end
return r.Position.Y-2.5
end


function f.BindDetection(q)
h=q or nil
end

function f.IsEnabled()
return g
end

function f.GetPredictionLength()
return i
end

function f.SetPredictionLength(q)
if type(q)=="number"and q>0 then
i=math.clamp(q,10,200)
f.RefreshAll()
end
end



local function getHazardCentroidAndSpan(q,r)
local s=q.Instance
if not s or not s.Parent then return nil,4 end

local t=c.GetHitboxPadding()
local u={}
local v=q.Name or(s and s.Name)or""
local w=c.IsForceCircle and c.IsForceCircle(v)

if s:IsA"BasePart"then
if s.Transparency<=l then
table.insert(u,s)
end
else
for x,y in ipairs(s:GetDescendants())do
if y:IsA"BasePart"and y.Parent and y.Transparency<=l then
table.insert(u,y)
end
end
end

if#u==0 then return nil,4 end


local x=Vector3.new(-r.Z,0,r.X)
local y,z=math.huge,-math.huge
local A=0

for B,C in ipairs(u)do
local D=C.Position
local E=C.Size


local F=0
if w or(C:IsA"Part"and(C.Shape==Enum.PartType.Ball or C.Shape==Enum.PartType.Cylinder))then
F=math.max(E.X,E.Y,E.Z)/2
else

local G=C.CFrame
local H=G.RightVector
local I=G.UpVector
local J=G.LookVector
local K=E.X/2
local L=E.Y/2
local M=E.Z/2
F=K*math.abs(H.X*x.X+H.Z*x.Z)
+L*math.abs(I.X*x.X+I.Z*x.Z)
+M*math.abs(J.X*x.X+J.Z*x.Z)
end

local G=D.X*x.X+D.Z*x.Z
y=math.min(y,G-F)
z=math.max(z,G+F)

local H=D.X*r.X+D.Z*r.Z
A+=H
end


local B=math.max(1,(z-y)+t*2)


local C=(y+z)/2
local D=A/#u


local E=r*D+x*C

return E,B
end


local function updateTrajectoryCFrame(q,r,s,t,u,v,w)
if not r or not r.Parent or not q or not q.Parent then return end


local x=v/2
local y=Vector3.new(
s.X+t.X*x,
u or s.Y,
s.Z+t.Z*x
)


local z=y+Vector3.new(t.X,0,t.Z)
local A=CFrame.lookAt(y,z)
local B=r.CFrame:ToObjectSpace(A)

q.CFrame=B
q.Size=Vector3.new(w,o,v)
if not q.Visible then q.Visible=true end
end


local function onHeartbeat()
if not g then return end
local q=false
local r=os.clock()
local s=getPlayerGroundY()

for t,u in pairs(j)do
local v=t.Instance
if not v or not v.Parent then
f.DetachTrajectoryVisuals(t)
else
q=true
local w=u.mainPart
if w and w.Parent then
local x=w.Position
local y=r-(u.lastClock or r)


if y>=0.035 then
local z=x-(u.lastPos or x)
local A=z.Magnitude/y
local B=Vector3.new(z.X,0,z.Z)
local C=B.Magnitude/y

if C>=p then
u.isMoving=true
u.dir=B.Unit
else
if y>=0.25 and A<p then
u.isMoving=false
end
end

u.lastPos=x
u.lastClock=r
end


if u.isMoving and u.dir and u.ad then
local z,A=getHazardCentroidAndSpan(t,u.dir)
if z then
updateTrajectoryCFrame(u.ad,w,z,u.dir,s,i,A)
end
else
if u.ad and u.ad.Visible then
u.ad.Visible=false
end
end
end
end
end

if not q and k then
k:Disconnect()
k=nil
end
end

local function ensureHeartbeat()
if not k and g then
k=d.Heartbeat:Connect(onHeartbeat)
end
end


function f.DetachTrajectoryVisuals(q)
if not q then return end
local r=j[q]
if not r then return end

if r.ad then
pcall(function()r.ad:Destroy()end)
r.ad=nil
end

if r.connections then
for s,t in ipairs(r.connections)do
pcall(function()t:Disconnect()end)
end
table.clear(r.connections)
end

j[q]=nil
end


function f.AttachTrajectoryVisuals(q)
if not g or not q then return end
if j[q]then
f.DetachTrajectoryVisuals(q)
end

local r=q.Instance
if not r or not r.Parent then return end

local s
if r:IsA"BasePart"then
s=r
else
s=r.PrimaryPart or r:FindFirstChildWhichIsA"BasePart"
if not s then
for t,u in ipairs(r:GetDescendants())do
if u:IsA"BasePart"and u.Parent then
s=u
break
end
end
end
end

if not s or not s.Parent then return end

local t=Instance.new"BoxHandleAdornment"
t.Name="HazardTrajectoryCorridor"
t.Adornee=s
t.Size=Vector3.new(4,o,i)
t.Color3=m
t.Transparency=n
t.ZIndex=1
t.AlwaysOnTop=true
t.Visible=false
t.Parent=s

local u={}
local v=s:GetPropertyChangedSignal"Transparency":Connect(function()
if s.Parent and s.Transparency>l then
pcall(function()t:Destroy()end)
end
end)
table.insert(u,v)

j[q]={
ad=t,
connections=u,
mainPart=s,
lastPos=s.Position,
lastClock=os.clock(),
velocity=Vector3.zero,
dir=nil,
isMoving=false,
}

ensureHeartbeat()
end


function f.ClearAll()
if k then
k:Disconnect()
k=nil
end
for q in pairs(j)do
f.DetachTrajectoryVisuals(q)
end
table.clear(j)
end


function f.RefreshAll()
f.ClearAll()
if not g or not h then return end

for q,r in pairs(h.GetActiveHazardsMap())do
f.AttachTrajectoryVisuals(r)
end
end



function f.GetNearbyTrajectories(q,r)
r=r or 65
local s={}
local t,u=q.X,q.Z

for v,w in pairs(j)do
if w.isMoving and w.dir and w.mainPart and w.mainPart.Parent then
local x,y=getHazardCentroidAndSpan(v,w.dir)
if x and y then
local z=x.X
local A=x.Z
local B=t-z
local C=u-A
local D=B*B+C*C
local E=r+i+(y/2)
if D<=E*E then
table.insert(s,{info=v,record=w})
end
end
end
end

return s
end



function f.IsPointInAnyTrajectory(q,r,s)
local t,u=q.X,q.Z
r=r or 0

if s then
for v,w in ipairs(s)do
local x=w.info
local y=w.record
if y and y.isMoving and y.dir and y.mainPart and y.mainPart.Parent then
local z,A=getHazardCentroidAndSpan(x,y.dir)
if z and A then
local B=y.dir
local C=Vector3.new(-B.Z,0,B.X)
local D=t-z.X
local E=u-z.Z

local F=D*B.X+E*B.Z
local G=D*C.X+E*C.Z
local H=A/2

if r<=0 then
if F>=0 and F<=i and math.abs(G)<=H then
return true,x
end
else
local I=0
if F<0 then
I=-F
elseif F>i then
I=F-i
end
local J=math.max(0,math.abs(G)-H)
if(I*I+J*J)<=(r*r)then
return true,x
end
end
end
end
end
return false,nil
end

for v,w in pairs(j)do
if w.isMoving and w.dir and w.mainPart and w.mainPart.Parent then
local x,y=getHazardCentroidAndSpan(v,w.dir)
if x and y then
local z=w.dir
local A=Vector3.new(-z.Z,0,z.X)
local B=t-x.X
local C=u-x.Z


local D=B*z.X+C*z.Z
local E=B*A.X+C*A.Z
local F=y/2


if r<=0 then
if D>=0 and D<=i and math.abs(E)<=F then
return true,v
end
else
local G=0
if D<0 then
G=-D
elseif D>i then
G=D-i
end
local H=math.max(0,math.abs(E)-F)
if(G*G+H*H)<=(r*r)then
return true,v
end
end
end
end
end

return false,nil
end


function f.SetEnabled(q)
g=q and true or false
if g then
f.RefreshAll()
else
f.ClearAll()
end
end


c.OnPaddingChanged(function()
if g then
f.RefreshAll()
end
end)


b.Register(function()
f.ClearAll()
end)

return f