local a,b,c,d,e,f,g={},0.85,0,2,{},64 function a.BindDetection(h)g=h or nil end
function a.GetHazardPadding()return c end a.GetHitboxPadding=a.GetHazardPadding
function a.GetTrajectoryMargin()return d end function a.SetTrajectoryMargin(h)if
type(h)=='number'and h>=0 and h~=d then d=h a.InvalidateCache()for i,j in
ipairs(e)do pcall(j,d)end end end function a.InvalidateCache()if g and g.
GetActiveHazardsMap then for h,i in pairs(g.GetActiveHazardsMap())do i.
HazardZones=nil end end end function a.OnPaddingChanged(h)if type(h)=='function'
then table.insert(e,h)end end function a.SetHazardPadding(h)if type(h)=='number'
and h>=0 and h~=c then c=h a.InvalidateCache()for i,j in ipairs(e)do pcall(j,c)
end end end a.SetHitboxPadding=a.SetHazardPadding local h={'firstBossCrissCross'
,'firstBossBigSpike','firstBossSeekingSpikes'}local i=function(i)if not i or
type(i)~='string'then return false end local j=i:lower():gsub('%s+','')if#j==0
then return false end for k,l in ipairs(h)do local m=l:lower():gsub('%s+','')if#
m>0 and string.find(j,m,1,true)then return true end end return false end
function a.IsForceCircle(j)return i(j)end function a.AddForceCircleName(j)if
type(j)=='string'and#j>0 then table.insert(h,j)a.InvalidateCache()end end
function a.GetForceCircleNames()return h end local j,k,l=function(j)return j and
j.Parent and j.Transparency<=b end,function(j,k,l)local m,n=j.Size,l and d or c
if k or(j:IsA'Part'and(j.Shape==Enum.PartType.Ball or j.Shape==Enum.PartType.
Cylinder))then return{radius=math.max(m.X,m.Y,m.Z)/2}end local o=Vector3.new(
math.max(m.X,0)/2+n,0,math.max(m.Z,0)/2+n)return{half=o,cframe=j.CFrame}end,
function(j,k,l,m)if not k then return false end local n,o=j.X,j.Z l=l or 0 local
p=(m or k.isTrajectory)and d or c if k.radius then local q=(k.part and k.part.
Parent)and k.part.Position local r,s=q and q.X or k.cx or 0,q and q.Z or k.cz or
0 local t,u,v=n-r,o-s,k.radius+p+l return(t*t+u*u)<=(v*v)end local q=(k.part and
k.part.Parent)and k.part.CFrame or k.cframe if q then local r,s,t=q:
PointToObjectSpace(j),k.half.X,k.half.Z if l<=0 then return math.abs(r.X)<=s and
math.abs(r.Z)<=t else local u,v=math.max(0,math.abs(r.X)-s),math.max(0,math.abs(
r.Z)-t)return(u*u+v*v)<=(l*l)end end return false end local m=function(m)if not
m or not m.Instance or not m.Instance.Parent then return nil end local n=m.
Instance local o=m.Name or(n and n.Name)or''local p,q=i(o),m.IsTrajectory==true
local r,s=q and d or c if n:IsA'BasePart'then if not j(n)then return nil end s={
n}else s={}for t,u in ipairs(n:GetDescendants())do if#s>=f then break end if u:
IsA'BasePart'and j(u)and u.Parent then s[#s+1]=u end end if#s==0 then return nil
end end local t,u,v,w,x={},math.huge,-math.huge,math.huge,-math.huge for y,z in
ipairs(s)do local A,B=z.Position,z.Size local C=math.max(B.X,B.Y,B.Z)/2+r u=math
.min(u,A.X-C)v=math.max(v,A.X+C)w=math.min(w,A.Z-C)x=math.max(x,A.Z+C)local D=k(
z,p,q)if D then if D.radius then D.cx,D.cz=A.X,A.Z end D.part=z D.isTrajectory=q
t[#t+1]=D end end if#t==0 then return nil end local y,z,A,B=(u+v)/2,(w+x)/2,(v-u
)/2,(x-w)/2 return{zones=t,center=Vector3.new(y,0,z),boundingRadius=math.sqrt(A*
A+B*B)}end local n=function(n)local o=n and n.HazardZones if not o then o=m(n)if
o and n then n.HazardZones=o end end return o end function a.GetHazardZones(o)
return n(o)end function a.GetNearbyHazards(o,p)local q=g if not q then return{}
end p=p or 65 local r,s,t={},o.X,o.Z for u,v in pairs(q.GetActiveHazardsMap())do
local w,x=v.Instance,n(v)if x then local y,z=x.center.X,x.center.Z if w and w.
Parent then local A=w:IsA'BasePart'and w or w.PrimaryPart or w:
FindFirstChildWhichIsA'BasePart'if A then y=A.Position.X z=A.Position.Z end end
local A,B=s-y,t-z local C,D=A*A+B*B,p+x.boundingRadius if C<=D*D then table.
insert(r,v)end end end return r end function a.IsPointInAnyHazard(o,p,q,r,s)
local t=g if not t then return false,nil,nil end q=q or 0 local u,v,w,x=math.
huge,r or t.GetActiveHazardsMap()for y,z in pairs(v)do if s and z.IsTrajectory==
true then continue end local A=z.Instance or(typeof(y)=='Instance'and y)if p and
(p==A or(A and p.Name==A.Name))then continue end local B=n(z)if not B then
continue end local C,D=B.center.X,B.center.Z if A and A.Parent then local E=A:
IsA'BasePart'and A or A.PrimaryPart or A:FindFirstChildWhichIsA'BasePart'if E
then C=E.Position.X D=E.Position.Z end end local E,F=o.X-C,o.Z-D local G,H=E*E+F
*F,B.boundingRadius+q if G>H*H then continue end local I=z.IsTrajectory==true
for J=1,#B.zones do local K=B.zones[J]if j(K.part)and l(o,K,q,I or K.
isTrajectory)then local L=(o-K.part.Position).Magnitude if L<u then u=L w=z x=K.
part end break end end end return x~=nil,w,x end function a.
IsPointInAnyRedHazard(o,p,q,r)return a.IsPointInAnyHazard(o,p,q,r,true)end
function a.GetHazardsAtPoint(o,p,q,r)local s=g if not s then return{}end p=p or
0 local t,u={},q or s.GetActiveHazardsMap()for v,w in pairs(u)do if r and w.
IsTrajectory==true then continue end local x,y=w.Instance or(typeof(v)==
'Instance'and v),n(w)if not y then continue end local z,A=y.center.X,y.center.Z
if x and x.Parent then local B=x:IsA'BasePart'and x or x.PrimaryPart or x:
FindFirstChildWhichIsA'BasePart'if B then z=B.Position.X A=B.Position.Z end end
local B,C=o.X-z,o.Z-A local D,E=B*B+C*C,y.boundingRadius+p if D>E*E then
continue end local F=w.IsTrajectory==true for G=1,#y.zones do local H=y.zones[G]
if j(H.part)and l(o,H,p,F or H.isTrajectory)then t[w]=true break end end end
return t end function a.GetRedHazardsAtPoint(o,p,q)return a.GetHazardsAtPoint(o,
p,q,true)end return a