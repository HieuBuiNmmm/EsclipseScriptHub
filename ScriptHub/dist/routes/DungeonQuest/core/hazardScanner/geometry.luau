








local a={}


local b=0.85
local c=0.0
local d
local e={}


local f=64


function a.BindDetection(g)
d=g or nil
end

function a.GetHazardPadding()
return c
end
a.GetHitboxPadding=a.GetHazardPadding


function a.InvalidateCache()
if d and d.GetActiveHazardsMap then
for g,h in pairs(d.GetActiveHazardsMap())do
h.HazardZones=nil
end
end
end

function a.OnPaddingChanged(g)
if type(g)=="function"then
table.insert(e,g)
end
end

function a.SetHazardPadding(g)
if type(g)=="number"and g>=0 and g~=c then
c=g
a.InvalidateCache()
for h,i in ipairs(e)do
pcall(i,c)
end
end
end
a.SetHitboxPadding=a.SetHazardPadding



local g={
"firstBossCrissCross",
"firstBossBigSpike",
"firstBossSeekingSpikes",
}

local function isForceCircle(h)
if not h or type(h)~="string"then return false end
local i=h:lower():gsub("%s+","")
if#i==0 then return false end
for j,k in ipairs(g)do
local l=k:lower():gsub("%s+","")
if#l>0 and string.find(i,l,1,true)then
return true
end
end
return false
end

function a.IsForceCircle(h)
return isForceCircle(h)
end

function a.AddForceCircleName(h)
if type(h)=="string"and#h>0 then
table.insert(g,h)
a.InvalidateCache()
end
end

function a.GetForceCircleNames()
return g
end


local function isPartAlive(h)
return h and h.Parent and h.Transparency<=b
end




local function computePartZone(h,i)
local j=h.Size
if i or(h:IsA"Part"and(h.Shape==Enum.PartType.Ball or h.Shape==Enum.PartType.Cylinder))then
return{radius=math.max(j.X,j.Y,j.Z)/2}
end

local k=Vector3.new(math.max(j.X,0)/2+c,0,math.max(j.Z,0)/2+c)
return{half=k,cframe=h.CFrame}
end


local function isPointInZone(h,i,j)
if not i then return false end
local k,l=h.X,h.Z
j=j or 0

if i.radius then
local m=(i.part and i.part.Parent)and i.part.Position
local n=m and m.X or i.cx or 0
local o=m and m.Z or i.cz or 0
local p=k-n
local q=l-o
local r=i.radius+c+j
return(p*p+q*q)<=(r*r)
end

local m=(i.part and i.part.Parent)and i.part.CFrame or i.cframe
if m then
local n=m:PointToObjectSpace(h)
local o=i.half.X
local p=i.half.Z

if j<=0 then
return math.abs(n.X)<=o and math.abs(n.Z)<=p
else

local q=math.max(0,math.abs(n.X)-o)
local r=math.max(0,math.abs(n.Z)-p)
return(q*q+r*r)<=(j*j)
end
end

return false
end


local function buildHazardZones(h)
if not h or not h.Instance or not h.Instance.Parent then return nil end

local i=h.Instance
local j=h.Name or(i and i.Name)or""
local k=isForceCircle(j)
local l

if i:IsA"BasePart"then
if not isPartAlive(i)then return nil end
l={i}
else
l={}
for m,n in ipairs(i:GetDescendants())do
if#l>=f then break end
if n:IsA"BasePart"and isPartAlive(n)and n.Parent then
l[#l+1]=n
end
end
if#l==0 then return nil end
end

local m={}
local n,o,p,q=math.huge,-math.huge,math.huge,-math.huge

for r,s in ipairs(l)do
local t=s.Position
local u=s.Size
local v=math.max(u.X,u.Y,u.Z)/2+c

n=math.min(n,t.X-v)
o=math.max(o,t.X+v)
p=math.min(p,t.Z-v)
q=math.max(q,t.Z+v)

local w=computePartZone(s,k)
if w then
if w.radius then
w.cx,w.cz=t.X,t.Z
end
w.part=s
m[#m+1]=w
end
end

if#m==0 then return nil end

local r=(n+o)/2
local s=(p+q)/2
local t=(o-n)/2
local u=(q-p)/2

return{
zones=m,
center=Vector3.new(r,0,s),
boundingRadius=math.sqrt(t*t+u*u),
}
end


local function getHazardZones(h)
local i=h and h.HazardZones
if not i then
i=buildHazardZones(h)
if i and h then h.HazardZones=i end
end
return i
end

function a.GetHazardZones(h)
return getHazardZones(h)
end


function a.GetNearbyHazards(h,i)
local j=d
if not j then return{}end
i=i or 65

local k={}
local l,m=h.X,h.Z

for n,o in pairs(j.GetActiveHazardsMap())do
local p=o.Instance
local q=getHazardZones(o)
if q then
local r=q.center.X
local s=q.center.Z
if p and p.Parent then
local t=p:IsA"BasePart"and p or p.PrimaryPart or p:FindFirstChildWhichIsA"BasePart"
if t then
r=t.Position.X
s=t.Position.Z
end
end

local t=l-r
local u=m-s
local v=t*t+u*u
local w=i+q.boundingRadius
if v<=w*w then
table.insert(k,o)
end
end
end

return k
end



function a.IsPointInAnyHazard(h,i,j,k)
local l=d
if not l then return false,nil,nil end
j=j or 0

local m=math.huge
local n,o
local p=k or l.GetActiveHazardsMap()

for q,r in pairs(p)do
local s=r.Instance or(typeof(q)=="Instance"and q)
if i and(i==s or(s and i.Name==s.Name))then
continue
end

local t=getHazardZones(r)
if not t then continue end


local u=t.center.X
local v=t.center.Z
if s and s.Parent then
local w=s:IsA"BasePart"and s or s.PrimaryPart or s:FindFirstChildWhichIsA"BasePart"
if w then
u=w.Position.X
v=w.Position.Z
end
end

local w=h.X-u
local x=h.Z-v
local y=w*w+x*x
local z=t.boundingRadius+j
if y>z*z then
continue
end


for A=1,#t.zones do
local B=t.zones[A]
if isPartAlive(B.part)and isPointInZone(h,B,j)then
local C=(h-B.part.Position).Magnitude
if C<m then
m=C
n=r
o=B.part
end
break
end
end
end

return o~=nil,n,o
end

return a