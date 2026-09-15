


local a=require"@routes/DungeonQuest/core/services"
local b=a.player

local c={}


local function buildBaseIgnoreList(d)
local e={}
if d then
for f,g in ipairs(d)do
if g and g.Parent then table.insert(e,g)end
end
end

if b and b.Character and b.Character.Parent then
table.insert(e,b.Character)
end

local f=workspace:FindFirstChild"RaycastIgnore"
if f then
table.insert(e,f)
end

return e
end




function c.CastRay(d,e,f)
local g=e-d
local h=g.Magnitude
if h<0.3 then return false,nil,e end

local i=RaycastParams.new()
i.FilterType=Enum.RaycastFilterType.Exclude
i.FilterDescendantsInstances=buildBaseIgnoreList(f)
i.IgnoreWater=true

local j=d
local k=g
local l=8

for m=1,l do
local n=workspace:Raycast(j,k,i)
if not n then
return false,nil,e
end

local o=n.Instance
if o and o.CanCollide and o.CanQuery~=false then


if n.Normal.Y>0.65 then

local p=(n.Position-j).Magnitude+0.15
if p>=k.Magnitude then
return false,nil,e
end
j=n.Position+k.Unit*0.15
k=e-j
else

return true,o,n.Position
end
else

local p=(n.Position-j).Magnitude+0.15
if p>=k.Magnitude then
return false,nil,e
end
j=n.Position+k.Unit*0.15
k=e-j
end
end

return false,nil,e
end



function c.CheckClearance(d,e,f)

local g,h,i=c.CastRay(d,e,f)
if g then
return true,h,i
end


local j=Vector3.new(e.X-d.X,0,e.Z-d.Z)
if j.Magnitude>0.8 then
local k=j.Unit
local l=Vector3.new(-k.Z,0,k.X)*0.6


local m=d+l
local n=e+l
local o=c.CastRay(d,m,f)
if not o then
local p,q,r=c.CastRay(m,n,f)
if p and(r-m).Magnitude>1.0 then
return true,q,r
end
end


local p=d-l
local q=e-l
local r=c.CastRay(d,p,f)
if not r then
local s,t,u=c.CastRay(p,q,f)
if s and(u-p).Magnitude>1.0 then
return true,t,u
end
end
end

return false,nil,e
end



function c.ResolveDestination(d,e,f,g,h)
local i=d
local j=e

local k={
origin=i,
targetPos=j,
directBlocked=false,
directHitPart=nil,
directHitPos=nil,
chosenDest=nil,
mode="None",
nodeIdx=nil,
}


local l,m,n=c.CheckClearance(i,j,h)
k.directBlocked=l
k.directHitPart=m
k.directHitPos=n

if not l then
k.chosenDest=e
k.mode="Direct"
return e,"Direct",nil,k
end


local o=math.clamp(g or 1,1,f and#f or 1)
if f and#f>0 then
for p=#f,o,-1 do
local q=f[p]
local r=q.Position
local s=r+Vector3.new(0,2.0,0)local
t, u, v=c.CheckClearance(i,s,h)
if not t then
k.chosenDest=r
k.mode="Waypoint"
k.nodeIdx=p
return r,"Waypoint",p,k
end
end
end


k.mode="Blocked"
return nil,"Blocked",nil,k
end



function c.ExecuteMove(d,e,f,g,h)
if not d or not f then return end

d:MoveTo(f)


local i=f.Y-e.Y
local j=Vector3.new(f.X-e.X,0,f.Z-e.Z).Magnitude
if i>1.8 and j<=7.0 then
d.Jump=true
return
end


if g and#g>0 then
local k=math.clamp(h or 1,1,#g)
for l=k,math.min(k+2,#g)do
local m=g[l]
if m then
local n=Vector3.new(m.Position.X-e.X,0,m.Position.Z-e.Z).Magnitude
if n<=5.0 then
if m.Action==Enum.PathWaypointAction.Jump or(m.Position.Y-e.Y)>1.8 then
d.Jump=true
break
end
end
end
end
end
end

return c