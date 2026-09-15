


local a=require"@routes/DungeonQuest/core/autoFarm/selector"
local b=require"@routes/DungeonQuest/core/autoFarm/scanner"

local c={}

local d
local e
local f={}
local g=1
local h
local i=6

function c.GetTarget()
return d
end

function c.GetPathInstance()
return e
end

function c.GetWaypoints()
return f
end

function c.GetWaypointIndex()
return g
end

function c.SetWaypointIndex(j)
g=math.clamp(j,1,math.max(1,#f))
end

function c.AdvanceWaypointIndex(j)
if not f or#f==0 then return end
local k=f[g]
if k then
local l=Vector3.new(k.Position.X-j.X,0,k.Position.Z-j.Z).Magnitude
if l<=3.5 then
g=math.min(#f+1,g+1)
end
end
end

function c.GetLastPathDestPos()
return h
end

function c.SetRepathThreshold(j)
if type(j)=="number"and j>0 then
i=j
end
end

function c.GetRepathThreshold()
return i
end

function c.SetTarget(j,k,l,m)
if e and e~=k then
pcall(function()e:Destroy()end)
end

d=j
e=k
f=l or{}
g=1
h=m
end

function c.UpdatePath(j,k,l)
if e and e~=j then
pcall(function()e:Destroy()end)
end

e=j
f=k or{}
g=1
h=l
end


function c.ClearTarget()
if e then
pcall(function()e:Destroy()end)
end
d=nil
e=nil
f={}
g=1
h=nil
end


function c.IsTargetValid()
if not d then return false end
return b.Validate(d)
end


function c.NeedsRepath(j)
if not e or not f or#f==0 then
return true
end
if not h or not j then
return true
end
return(j-h).Magnitude>i
end


function c.Repath(j,k)
if not k then return false end local

l, m, n=a.ComputePathWithCost(j,k)
if l and#m>0 then
if e then pcall(function()e:Destroy()end)end
e=l
f=m
g=1
h=k
return true
end

return false
end

return c