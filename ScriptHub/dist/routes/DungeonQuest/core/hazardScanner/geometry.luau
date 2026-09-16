local a,b,c,d,e,f,g={},0.85,0,2,{},64 function a.BindDetection(h)g=h or nil end
function a.GetHazardPadding()return c end a.GetHitboxPadding=a.GetHazardPadding
function a.GetTrajectoryMargin()return d end function a.SetTrajectoryMargin(h)if
type(h)=='number'and h>=0 and h~=d then d=h a.InvalidateCache()for i,j in
ipairs(e)do pcall(j,d)end end end function a.InvalidateCache()if g and g.
GetActiveHazardsMap then for h,i in pairs(g.GetActiveHazardsMap())do i.
HazardZones=nil end end end function a.OnPaddingChanged(h)if type(h)=='function'
then table.insert(e,h)end end function a.SetHazardPadding(h)if type(h)=='number'
and h>=0 and h~=c then c=h a.InvalidateCache()for i,j in ipairs(e)do pcall(j,c)
end end end a.SetHitboxPadding=a.SetHazardPadding local h,i,j,k=game:GetService
'ReplicatedStorage',{'firstBossCrissCross','firstBossBigSpike',
'firstBossSeekingSpikes'},{'smallicespikes','mediumicespikes','largeicespikes'}
local l=function(l)if not l or type(l)~='string'then return false end local m=l:
lower():gsub('%s+','')if#m==0 then return false end for n,o in ipairs(j)do if
string.find(m,o,1,true)then return true end end return false end function a.
IsIceSpikesChain(m)return l(m)end local m=function()if k and k>0 then return k
end local m,n=45,h:FindFirstChild'enemyProjectiles'if not n then return m end
local o=n:FindFirstChild'largeIceSpikes'if not o then for p,q in ipairs(n:
GetChildren())do local r=(q.Name or''):lower():gsub('%s+','')if r==
'largeicespikes'then o=q break end end end if not o then return m end local p,q=
0,Vector3.zero if o:IsA'Model'and o.PrimaryPart then q=o.PrimaryPart.Position
elseif o:IsA'BasePart'then q=o.Position end local r={}if o:IsA'BasePart'then
table.insert(r,o)else for s,t in ipairs(o:GetDescendants())do if t:IsA'BasePart'
then table.insert(r,t)end end end if#r==0 then return m end for s,t in ipairs(r)
do local u=t.Size local v,w=math.max(u.X,u.Z)/2,(Vector3.new(t.Position.X,0,t.
Position.Z)-Vector3.new(q.X,0,q.Z)).Magnitude local x=w+v if x>p then p=x end
end if p>=5 then k=p return k end return m end function a.
GetLargeIceSpikesMaxRadius()return m()end local n=function(n)if not n or type(n)
~='string'then return false end local o=n:lower():gsub('%s+','')if#o==0 then
return false end for p,q in ipairs(i)do local r=q:lower():gsub('%s+','')if#r>0
and string.find(o,r,1,true)then return true end end return false end function a.
IsForceCircle(o)return n(o)end function a.AddForceCircleName(o)if type(o)==
'string'and#o>0 then table.insert(i,o)a.InvalidateCache()end end function a.
GetForceCircleNames()return i end local o,p,q=function(o)return o and o.Parent
and o.Transparency<=b end,function(o,p,q)local r,s=o.Size,q and d or c if p or(o
:IsA'Part'and(o.Shape==Enum.PartType.Ball or o.Shape==Enum.PartType.Cylinder))
then return{radius=math.max(r.X,r.Y,r.Z)/2}end local t=Vector3.new(math.max(r.X,
0)/2+s,0,math.max(r.Z,0)/2+s)return{half=t,cframe=o.CFrame}end,function(o,p,q,r)
if not p then return false end local s,t=o.X,o.Z q=q or 0 local u=(r or p.
isTrajectory)and d or c if p.radius then local v=(p.part and p.part.Parent)and p
.part.Position local w,x=v and v.X or p.cx or 0,v and v.Z or p.cz or 0 local y,z
,A=s-w,t-x,p.radius+u+q return(y*y+z*z)<=(A*A)end local v=(p.part and p.part.
Parent)and p.part.CFrame or p.cframe if v then local w,x,y=v:PointToObjectSpace(
o),p.half.X,p.half.Z if q<=0 then return math.abs(w.X)<=x and math.abs(w.Z)<=y
else local z,A=math.max(0,math.abs(w.X)-x),math.max(0,math.abs(w.Z)-y)return(z*z
+A*A)<=(q*q)end end return false end local r=function(r)if not r or not r.
Instance or not r.Instance.Parent then return nil end local s=r.Instance local t
=r.Name or(s and s.Name)or''local u,v=n(t),r.IsTrajectory==true local w,x=v and
d or c if l(t)then local y,z=(m())if s:IsA'BasePart'then z=o(s)and s or nil
elseif s:IsA'Model'then if s.PrimaryPart and o(s.PrimaryPart)then z=s.
PrimaryPart else for A,B in ipairs(s:GetDescendants())do if B:IsA'BasePart'and
o(B)and B.Parent then z=B break end end end end if not z then return nil end
local A=z.Position local B={radius=y,cx=A.X,cz=A.Z,part=z,isTrajectory=false,
isIceSpikes=true}return{zones={B},center=Vector3.new(A.X,0,A.Z),boundingRadius=y
+w}end if s:IsA'BasePart'then if not o(s)then return nil end x={s}else x={}for y
,z in ipairs(s:GetDescendants())do if#x>=f then break end if z:IsA'BasePart'and
o(z)and z.Parent then x[#x+1]=z end end if#x==0 then return nil end end local y,
z,A,B,C={},math.huge,-math.huge,math.huge,-math.huge for D,E in ipairs(x)do
local F,G=E.Position,E.Size local H=math.max(G.X,G.Y,G.Z)/2+w z=math.min(z,F.X-H
)A=math.max(A,F.X+H)B=math.min(B,F.Z-H)C=math.max(C,F.Z+H)local I=p(E,u,v)if I
then if I.radius then I.cx,I.cz=F.X,F.Z end I.part=E I.isTrajectory=v y[#y+1]=I
end end if#y==0 then return nil end local D,E,F,G=(z+A)/2,(B+C)/2,(A-z)/2,(C-B)/
2 return{zones=y,center=Vector3.new(D,0,E),boundingRadius=math.sqrt(F*F+G*G)}end
local s=function(s)local t=s and s.HazardZones if not t then t=r(s)if t and s
then s.HazardZones=t end end return t end function a.GetHazardZones(t)return s(t
)end function a.GetNearbyHazards(t,u)local v=g if not v then return{}end u=u or
65 local w,x,y={},t.X,t.Z for z,A in pairs(v.GetActiveHazardsMap())do local B,C=
A.Instance,s(A)if C then local D,E=C.center.X,C.center.Z if B and B.Parent then
local F=B:IsA'BasePart'and B or B.PrimaryPart or B:FindFirstChildWhichIsA
'BasePart'if F then D=F.Position.X E=F.Position.Z end end local F,G=x-D,y-E
local H,I=F*F+G*G,u+C.boundingRadius if H<=I*I then table.insert(w,A)end end end
return w end function a.IsPointInAnyHazard(t,u,v,w)local x=g if not x then
return false,nil,nil end v=v or 0 local y,z,A,B=math.huge,w or x.
GetActiveHazardsMap()for C,D in pairs(z)do local E=D.Instance or(typeof(C)==
'Instance'and C)if u and(u==E or(E and u.Name==E.Name))then continue end local F
=s(D)if not F then continue end local G,H=F.center.X,F.center.Z if E and E.
Parent then local I=E:IsA'BasePart'and E or E.PrimaryPart or E:
FindFirstChildWhichIsA'BasePart'if I then G=I.Position.X H=I.Position.Z end end
local I,J=t.X-G,t.Z-H local K,L=I*I+J*J,F.boundingRadius+v if K>L*L then
continue end local M=D.IsTrajectory==true for N=1,#F.zones do local O=F.zones[N]
if o(O.part)and q(t,O,v,M or O.isTrajectory)then local P=(t-O.part.Position).
Magnitude if P<y then y=P A=D B=O.part end break end end end return B~=nil,A,B
end return a