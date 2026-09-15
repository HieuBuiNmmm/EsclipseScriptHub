





local a=require"@routes/DungeonQuest/core/services"
local b=require"@routes/DungeonQuest/core/lifecycle"
local c=require"@routes/DungeonQuest/core/hazardScanner/playerVisual"
local d=require"@routes/DungeonQuest/core/hazardScanner/safeSpot"

local e=a.RunService or game:GetService"RunService"
local f=game:GetService"Players"
local g=a.player


local h={}


local i=false
local j=2.0
local k=false
local l
local m
local n={}


local function getPlayerComponents()
local o=g or f.LocalPlayer
if not o then return nil,nil,nil end
local p=o.Character
if not p or not p.Parent then return nil,nil,nil end
local q=p:FindFirstChildOfClass"Humanoid"
if q and q.Health<=0 then return nil,nil,nil end
local r=p:FindFirstChild"HumanoidRootPart"or p.PrimaryPart
if not r then return nil,nil,nil end
return p,q,r
end


local function stopMove(o,p)
if o and p and p.Parent then
pcall(function()o:MoveTo(p.Position)end)
end
end


local function onHeartbeat()
if not i then
if k or l then
l=nil
k=false local
o, p, q=getPlayerComponents()
stopMove(p,q)
for r,s in ipairs(n)do
pcall(s,false,nil,0)
end
end
return
end

local o,p,q=getPlayerComponents()
if not o or not p or not q then
if k or l then
l=nil
k=false
for r,s in ipairs(n)do
pcall(s,false,nil,0)
end
end
return
end local r=


c.IsPlayerInDanger and c.IsPlayerInDanger()local
s, t, u=d.GetLastSafeSpot()


if s then
l=s
end


local v=l and d.IsPointSafe and d.IsPointSafe(l)

if l and v then
local w=q.Position
local x=Vector3.new(l.X-w.X,0,l.Z-w.Z)
local y=x.Magnitude


if y<=j then

local z=q.CFrame
local A=Vector3.new(l.X,w.Y,l.Z)
local B=CFrame.new(A)*(z-z.Position)

o:PivotTo(B)
stopMove(p,q)

local C=l
l=nil

if k then
k=false
for D,E in ipairs(n)do
pcall(E,false,C,y)
end
end
else

local z=Vector3.new(l.X,w.Y,l.Z)
p:MoveTo(z)

if not k then
k=true
for A,B in ipairs(n)do
pcall(B,true,l,y)
end
end
end
else

if k or l then
l=nil
k=false
stopMove(p,q)
for w,x in ipairs(n)do
pcall(x,false,nil,0)
end
end
end
end


local function startTracking()
if not m then
m=e.Heartbeat:Connect(onHeartbeat)
end
end


function h.Cleanup()
if m then
m:Disconnect()
m=nil
end
if k or l then local
o, p, q=getPlayerComponents()
stopMove(p,q)
end
l=nil
k=false
end


function h.SetEnabled(o)
i=o and true or false
if not i then local
p, q, r=getPlayerComponents()
stopMove(q,r)
l=nil
k=false
end
end

function h.IsEnabled()
return i
end

function h.SetSnapDistance(o)
if type(o)=="number"and o>=0.5 then
j=o
end
end

function h.GetSnapDistance()
return j
end

function h.IsDodging()
return k
end

function h.OnDodgeStateChanged(o)
if type(o)=="function"then
table.insert(n,o)
end
end


startTracking()


b.Register(function()
h.Cleanup()
end)

return h