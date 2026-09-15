






local a=require"@routes/DungeonQuest/core/services"
local b=require"@routes/DungeonQuest/core/lifecycle"
local c=require"@routes/DungeonQuest/core/hazardScanner/geometry"

local d=a.RunService or game:GetService"RunService"
local e=a.player


local f={}


local g=false
local h
local i={}
local j


local k=0.85
local l=Color3.fromRGB(255,45,45)
local m=0.55
local n=0.25


local function getPlayerGroundY()
local o=e and e.Character
if not o then return nil end
local p=o:FindFirstChild"HumanoidRootPart"or o.PrimaryPart
if not p then return nil end
return p.Position.Y-2.5
end


function f.BindDetection(o)
h=o or nil
end

function f.IsEnabled()
return g
end


local function updateVisualCFrame(o,p)
local q=o.part
local r=o.ad
if not q or not q.Parent or not r or not r.Parent then return end

local s=q.Position
local t=Vector3.new(s.X,p or s.Y,s.Z)

if o.isCircle then

local u=CFrame.new(t)*CFrame.Angles(math.rad(90),0,0)
r.CFrame=q.CFrame:ToObjectSpace(u)
else local

u, v, w=q.CFrame:ToOrientation()
local x=CFrame.new(t)*CFrame.Angles(0,v,0)
r.CFrame=q.CFrame:ToObjectSpace(x)
end
end


local function onHeartbeat()
if not g then return end
local o=false
local p=getPlayerGroundY()

for q,r in pairs(i)do
if not q.Instance or not q.Instance.Parent then
f.DetachZoneVisuals(q)
else
o=true
if r.items then
for s,t in ipairs(r.items)do
updateVisualCFrame(t,p)
end
end
end
end

if not o and j then
j:Disconnect()
j=nil
end
end

local function ensureHeartbeat()
if not j and g then
j=d.Heartbeat:Connect(onHeartbeat)
end
end


function f.DetachZoneVisuals(o)
if not o then return end
local p=i[o]
if not p then return end

if p.adornments then
for q,r in ipairs(p.adornments)do
pcall(function()r:Destroy()end)
end
table.clear(p.adornments)
end

if p.connections then
for q,r in ipairs(p.connections)do
pcall(function()r:Disconnect()end)
end
table.clear(p.connections)
end

if p.items then
table.clear(p.items)
end

i[o]=nil
end


function f.AttachZoneVisuals(o)
if not g or not o then return end
if i[o]then
f.DetachZoneVisuals(o)
end

local p=c.GetHazardZones(o)
if not p or not p.zones then return end

local q=c.GetHitboxPadding()
local r=getPlayerGroundY()
local s={}
local t={}
local v={}

for w,x in ipairs(p.zones)do
local y=x.part
if y and y.Parent and y.Transparency<=k then
local z
local A=false

if x.radius then
A=true
local B=Instance.new"CylinderHandleAdornment"
B.Name="HazardGroundCircle"
B.Adornee=y
B.Radius=x.radius+q
B.Height=n
B.Color3=l
B.Transparency=m
B.ZIndex=2
B.AlwaysOnTop=true
B.Parent=y
z=B
elseif x.half and x.cframe then
local B=Instance.new"BoxHandleAdornment"
B.Name="HazardGroundBox"
B.Adornee=y
B.Size=Vector3.new(x.half.X*2,n,x.half.Z*2)
B.Color3=l
B.Transparency=m
B.ZIndex=2
B.AlwaysOnTop=true
B.Parent=y
z=B
end

if z then
local B={
ad=z,
part=y,
isCircle=A,
zone=x,
}
updateVisualCFrame(B,r)
table.insert(s,B)
table.insert(t,z)


local C=y:GetPropertyChangedSignal"Transparency":Connect(function()
if y.Parent and y.Transparency>k then
pcall(function()z:Destroy()end)
end
end)
table.insert(v,C)
end
end
end

if#t>0 then
i[o]={
items=s,
adornments=t,
connections=v,
}
ensureHeartbeat()
end
end


function f.ClearAll()
if j then
j:Disconnect()
j=nil
end
for o in pairs(i)do
f.DetachZoneVisuals(o)
end
table.clear(i)
end


function f.RefreshAll()
f.ClearAll()
if not g or not h then return end

for o,p in pairs(h.GetActiveHazardsMap())do
f.AttachZoneVisuals(p)
end
end


function f.SetEnabled(o)
g=o and true or false
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