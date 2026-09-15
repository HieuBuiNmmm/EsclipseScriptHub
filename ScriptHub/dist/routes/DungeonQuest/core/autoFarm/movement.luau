local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b,c,d,e=game:GetService
'Players',game:GetService'UserInputService',game:GetService'RunService',game:
GetService'VirtualInputManager'local f=b.LocalPlayer if not f then local g=os.
clock()+5 repeat f=b.LocalPlayer if f then break end task.wait(0.1)until os.
clock()>g end return{Players=b,UserInputService=c,RunService=d,
VirtualInputManager=e,player=f}end end local b=a.load'a'local c,d=b.player,{}
local e=function(e)local f={}if e then for g,h in ipairs(e)do if h and h.Parent
then table.insert(f,h)end end end if c and c.Character and c.Character.Parent
then table.insert(f,c.Character)end local g=workspace:FindFirstChild
'RaycastIgnore'if g then table.insert(f,g)end return f end function d.CastRay(f,
g,h)local i=g-f local j=i.Magnitude if j<0.3 then return false,nil,g end local k
=RaycastParams.new()k.FilterType=Enum.RaycastFilterType.Exclude k.
FilterDescendantsInstances=e(h)k.IgnoreWater=true local l,m,n=f,i,8 for o=1,n do
local p=workspace:Raycast(l,m,k)if not p then return false,nil,g end local q=p.
Instance if q and q.CanCollide and q.CanQuery~=false then if p.Normal.Y>0.65
then local r=(p.Position-l).Magnitude+0.15 if r>=m.Magnitude then return false,
nil,g end l=p.Position+m.Unit*0.15 m=g-l else return true,q,p.Position end else
local r=(p.Position-l).Magnitude+0.15 if r>=m.Magnitude then return false,nil,g
end l=p.Position+m.Unit*0.15 m=g-l end end return false,nil,g end function d.
CheckClearance(f,g,h)local i,j,k=d.CastRay(f,g,h)if i then return true,j,k end
local l=Vector3.new(g.X-f.X,0,g.Z-f.Z)if l.Magnitude>0.8 then local m=l.Unit
local n=Vector3.new(-m.Z,0,m.X)*0.6 local o,p=f+n,g+n local q=d.CastRay(f,o,h)if
not q then local r,s,t=d.CastRay(o,p,h)if r and(t-o).Magnitude>1 then return
true,s,t end end local r,s=f-n,g-n local t=d.CastRay(f,r,h)if not t then local u
,v,w=d.CastRay(r,s,h)if u and(w-r).Magnitude>1 then return true,v,w end end end
return false,nil,g end function d.ResolveDestination(f,g,h,i,j)local k,l=f,g
local m,n,o,p={origin=k,targetPos=l,directBlocked=false,directHitPart=nil,
directHitPos=nil,chosenDest=nil,mode='None',nodeIdx=nil},d.CheckClearance(k,l,j)
m.directBlocked=n m.directHitPart=o m.directHitPos=p if not n then m.chosenDest=
g m.mode='Direct'return g,'Direct',nil,m end local q=math.clamp(i or 1,1,h and#h
or 1)if h and#h>0 then for r=#h,q,-1 do local s=h[r]local t=s.Position local u=t
+Vector3.new(0,2,0)local v,w,x=d.CheckClearance(k,u,j)if not v then m.chosenDest
=t m.mode='Waypoint'm.nodeIdx=r return t,'Waypoint',r,m end end end m.mode=
'Blocked'return nil,'Blocked',nil,m end function d.ExecuteMove(f,g,h,i,j)if not
f or not h then return end f:MoveTo(h)local k,l=h.Y-g.Y,Vector3.new(h.X-g.X,0,h.
Z-g.Z).Magnitude if k>1.8 and l<=7 then f.Jump=true return end if i and#i>0 then
local m=math.clamp(j or 1,1,#i)for n=m,math.min(m+2,#i)do local o=i[n]if o then
local p=Vector3.new(o.Position.X-g.X,0,o.Position.Z-g.Z).Magnitude if p<=5 then
if o.Action==Enum.PathWaypointAction.Jump or(o.Position.Y-g.Y)>1.8 then f.Jump=
true break end end end end end end return d