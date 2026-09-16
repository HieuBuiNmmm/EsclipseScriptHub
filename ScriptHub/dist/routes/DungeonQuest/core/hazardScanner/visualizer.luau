local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b,c,d,e=game:GetService
'Players',game:GetService'UserInputService',game:GetService'RunService',game:
GetService'VirtualInputManager'local f=b.LocalPlayer if not f then local g=os.
clock()+5 repeat f=b.LocalPlayer if f then break end task.wait(0.1)until os.
clock()>g end return{Players=b,UserInputService=c,RunService=d,
VirtualInputManager=e,player=f}end function a.b()local b={cleaned=false,
callbacks={}}function b.Register(c)if type(c)~='function'then return function()
end end if b.cleaned then pcall(c)return function()end end table.insert(b.
callbacks,c)return function()for d,e in ipairs(b.callbacks)do if e==c then table
.remove(b.callbacks,d)break end end end end function b.Cleanup()if b.cleaned
then return end b.cleaned=true for c=#b.callbacks,1,-1 do pcall(b.callbacks[c])
end table.clear(b.callbacks)end function b.IsActive()return not b.cleaned end
return b end function a.c()local b,c,d,e,f,g,h={},0.85,0,2,{},64 function b.
BindDetection(i)h=i or nil end function b.GetHazardPadding()return d end b.
GetHitboxPadding=b.GetHazardPadding function b.GetTrajectoryMargin()return e end
function b.SetTrajectoryMargin(i)if type(i)=='number'and i>=0 and i~=e then e=i
b.InvalidateCache()for j,k in ipairs(f)do pcall(k,e)end end end function b.
InvalidateCache()if h and h.GetActiveHazardsMap then for i,j in pairs(h.
GetActiveHazardsMap())do j.HazardZones=nil end end end function b.
OnPaddingChanged(i)if type(i)=='function'then table.insert(f,i)end end function
b.SetHazardPadding(i)if type(i)=='number'and i>=0 and i~=d then d=i b.
InvalidateCache()for j,k in ipairs(f)do pcall(k,d)end end end b.SetHitboxPadding
=b.SetHazardPadding local i,j,k,l=game:GetService'ReplicatedStorage',{
'firstBossCrissCross','firstBossBigSpike','firstBossSeekingSpikes'},{
'smallicespikes','mediumicespikes','largeicespikes'}local m=function(m)if not m
or type(m)~='string'then return false end local n=m:lower():gsub('%s+','')if#n==
0 then return false end for o,p in ipairs(k)do if string.find(n,p,1,true)then
return true end end return false end function b.IsIceSpikesChain(n)return m(n)
end local n=function()if l and l>0 then return l end local n,o=45,i:
FindFirstChild'enemyProjectiles'if not o then return n end local p=o:
FindFirstChild'largeIceSpikes'if not p then for q,r in ipairs(o:GetChildren())do
local s=(r.Name or''):lower():gsub('%s+','')if s=='largeicespikes'then p=r break
end end end if not p then return n end local q,r=0,Vector3.zero if p:IsA'Model'
and p.PrimaryPart then r=p.PrimaryPart.Position elseif p:IsA'BasePart'then r=p.
Position end local s={}if p:IsA'BasePart'then table.insert(s,p)else for t,u in
ipairs(p:GetDescendants())do if u:IsA'BasePart'then table.insert(s,u)end end end
if#s==0 then return n end for t,u in ipairs(s)do local v=u.Size local w,x=math.
max(v.X,v.Z)/2,(Vector3.new(u.Position.X,0,u.Position.Z)-Vector3.new(r.X,0,r.Z))
.Magnitude local y=x+w if y>q then q=y end end if q>=5 then l=q return l end
return n end function b.GetLargeIceSpikesMaxRadius()return n()end local o=
function(o)if not o or type(o)~='string'then return false end local p=o:lower():
gsub('%s+','')if#p==0 then return false end for q,r in ipairs(j)do local s=r:
lower():gsub('%s+','')if#s>0 and string.find(p,s,1,true)then return true end end
return false end function b.IsForceCircle(p)return o(p)end function b.
AddForceCircleName(p)if type(p)=='string'and#p>0 then table.insert(j,p)b.
InvalidateCache()end end function b.GetForceCircleNames()return j end local p,q,
r=function(p)return p and p.Parent and p.Transparency<=c end,function(p,q,r)
local s,t=p.Size,r and e or d if q or(p:IsA'Part'and(p.Shape==Enum.PartType.Ball
or p.Shape==Enum.PartType.Cylinder))then return{radius=math.max(s.X,s.Y,s.Z)/2}
end local u=Vector3.new(math.max(s.X,0)/2+t,0,math.max(s.Z,0)/2+t)return{half=u,
cframe=p.CFrame}end,function(p,q,r,s)if not q then return false end local t,u=p.
X,p.Z r=r or 0 local v=(s or q.isTrajectory)and e or d if q.radius then local w=
(q.part and q.part.Parent)and q.part.Position local x,y=w and w.X or q.cx or 0,w
and w.Z or q.cz or 0 local z,A,B=t-x,u-y,q.radius+v+r return(z*z+A*A)<=(B*B)end
local w=(q.part and q.part.Parent)and q.part.CFrame or q.cframe if w then local
x,y,z=w:PointToObjectSpace(p),q.half.X,q.half.Z if r<=0 then return math.abs(x.X
)<=y and math.abs(x.Z)<=z else local A,B=math.max(0,math.abs(x.X)-y),math.max(0,
math.abs(x.Z)-z)return(A*A+B*B)<=(r*r)end end return false end local s=function(
s)if not s or not s.Instance or not s.Instance.Parent then return nil end local
t=s.Instance local u=s.Name or(t and t.Name)or''local v,w=o(u),s.IsTrajectory==
true local x,y=w and e or d if m(u)then local z,A=(n())if t:IsA'BasePart'then A=
p(t)and t or nil elseif t:IsA'Model'then if t.PrimaryPart and p(t.PrimaryPart)
then A=t.PrimaryPart else for B,C in ipairs(t:GetDescendants())do if C:IsA
'BasePart'and p(C)and C.Parent then A=C break end end end end if not A then
return nil end local B=A.Position local C={radius=z,cx=B.X,cz=B.Z,part=A,
isTrajectory=false,isIceSpikes=true}return{zones={C},center=Vector3.new(B.X,0,B.
Z),boundingRadius=z+x}end if t:IsA'BasePart'then if not p(t)then return nil end
y={t}else y={}for z,A in ipairs(t:GetDescendants())do if#y>=g then break end if
A:IsA'BasePart'and p(A)and A.Parent then y[#y+1]=A end end if#y==0 then return
nil end end local z,A,B,C,D={},math.huge,-math.huge,math.huge,-math.huge for E,F
in ipairs(y)do local G,H=F.Position,F.Size local I=math.max(H.X,H.Y,H.Z)/2+x A=
math.min(A,G.X-I)B=math.max(B,G.X+I)C=math.min(C,G.Z-I)D=math.max(D,G.Z+I)local
J=q(F,v,w)if J then if J.radius then J.cx,J.cz=G.X,G.Z end J.part=F J.
isTrajectory=w z[#z+1]=J end end if#z==0 then return nil end local E,F,G,H=(A+B)
/2,(C+D)/2,(B-A)/2,(D-C)/2 return{zones=z,center=Vector3.new(E,0,F),
boundingRadius=math.sqrt(G*G+H*H)}end local t=function(t)local u=t and t.
HazardZones if not u then u=s(t)if u and t then t.HazardZones=u end end return u
end function b.GetHazardZones(u)return t(u)end function b.GetNearbyHazards(u,v)
local w=h if not w then return{}end v=v or 65 local x,y,z={},u.X,u.Z for A,B in
pairs(w.GetActiveHazardsMap())do local C,D=B.Instance,t(B)if D then local E,F=D.
center.X,D.center.Z if C and C.Parent then local G=C:IsA'BasePart'and C or C.
PrimaryPart or C:FindFirstChildWhichIsA'BasePart'if G then E=G.Position.X F=G.
Position.Z end end local G,H=y-E,z-F local I,J=G*G+H*H,v+D.boundingRadius if I<=
J*J then table.insert(x,B)end end end return x end function b.IsPointInAnyHazard
(u,v,w,x)local y=h if not y then return false,nil,nil end w=w or 0 local z,A,B,C
=math.huge,x or y.GetActiveHazardsMap()for D,E in pairs(A)do local F=E.Instance
or(typeof(D)=='Instance'and D)if v and(v==F or(F and v.Name==F.Name))then
continue end local G=t(E)if not G then continue end local H,I=G.center.X,G.
center.Z if F and F.Parent then local J=F:IsA'BasePart'and F or F.PrimaryPart or
F:FindFirstChildWhichIsA'BasePart'if J then H=J.Position.X I=J.Position.Z end
end local J,K=u.X-H,u.Z-I local L,M=J*J+K*K,G.boundingRadius+w if L>M*M then
continue end local N=E.IsTrajectory==true for O=1,#G.zones do local P=G.zones[O]
if p(P.part)and r(u,P,w,N or P.isTrajectory)then local Q=(u-P.part.Position).
Magnitude if Q<z then z=Q B=E C=P.part end break end end end return C~=nil,B,C
end return b end end local b,c,d=a.load'a',a.load'b',a.load'c'local e,f,g,h,i,j,
k,l,m,n,o,p=b.RunService or game:GetService'RunService',b.player,{},false,{},
0.85,Color3.fromRGB(255,45,45),Color3.fromRGB(0,160,255),0.55,0.25 local q=
function()local q=f and f.Character if not q then return nil end local r=q:
FindFirstChild'HumanoidRootPart'or q.PrimaryPart if not r then return nil end
return r.Position.Y-2.5 end function g.BindDetection(r)o=r or nil end function g
.IsEnabled()return h end local r=function(r,s)local t,u=r.part,r.ad if not t or
not t.Parent or not u or not u.Parent then return end local v=t.Position local w
=Vector3.new(v.X,s or v.Y,v.Z)if r.isCircle then local x=CFrame.new(w)*CFrame.
Angles(math.rad(90),0,0)u.CFrame=t.CFrame:ToObjectSpace(x)else local x,y,z=t.
CFrame:ToOrientation()local A=CFrame.new(w)*CFrame.Angles(0,y,0)u.CFrame=t.
CFrame:ToObjectSpace(A)end end local s=function()if not h then return end local
s,t=false,q()for u,v in pairs(i)do if not u.Instance or not u.Instance.Parent
then g.DetachZoneVisuals(u)else s=true if v.items then for w,y in ipairs(v.items
)do r(y,t)end end end end if not s and p then p:Disconnect()p=nil end end local
t=function()if not p and h then p=e.Heartbeat:Connect(s)end end function g.
DetachZoneVisuals(u)if not u then return end local v=i[u]if not v then return
end if v.adornments then for w,y in ipairs(v.adornments)do pcall(function()y:
Destroy()end)end table.clear(v.adornments)end if v.connections then for w,y in
ipairs(v.connections)do pcall(function()y:Disconnect()end)end table.clear(v.
connections)end if v.items then table.clear(v.items)end i[u]=nil end function g.
UpdateHazardVisualColor(u,v)if not u then return end local w=i[u]if not w or not
w.items then return end local y=v==true or u.IsTrajectory==true local z,A=y and
l or k,y and d.GetTrajectoryMargin()or 0 for B,C in ipairs(w.items)do local D,E,
F=C.ad,C.zone,C.part if D and D.Parent and E and F and F.Parent then D.Color3=z
if C.isCircle and E.radius then D.Radius=E.radius+A elseif E.half then local G,H
=math.max(F.Size.X,0)/2+A,math.max(F.Size.Z,0)/2+A D.Size=Vector3.new(G*2,n,H*2)
end end end end function g.AttachZoneVisuals(u)if not h or not u then return end
if i[u]then g.DetachZoneVisuals(u)end local v=d.GetHazardZones(u)if not v or not
v.zones then return end local w=u.IsTrajectory==true local y,z,A,B,C,D=w and l
or k,w and d.GetTrajectoryMargin()or 0,q(),{},{},{}for E,F in ipairs(v.zones)do
local G=F.part if G and G.Parent and G.Transparency<=j then local H,I=false if F
.radius then H=true local J=Instance.new'CylinderHandleAdornment'J.Name=
'HazardGroundCircle'J.Adornee=G J.Radius=F.radius+z J.Height=n J.Color3=y J.
Transparency=m J.ZIndex=2 J.AlwaysOnTop=true J.Parent=G I=J elseif F.half and F.
cframe then local J=Instance.new'BoxHandleAdornment'J.Name='HazardGroundBox'J.
Adornee=G J.Size=Vector3.new(F.half.X*2,n,F.half.Z*2)J.Color3=y J.Transparency=m
J.ZIndex=2 J.AlwaysOnTop=true J.Parent=G I=J end if I then local J={ad=I,part=G,
isCircle=H,zone=F}r(J,A)table.insert(B,J)table.insert(C,I)local K=G:
GetPropertyChangedSignal'Transparency':Connect(function()if G.Parent and G.
Transparency>j then pcall(function()I:Destroy()end)end end)table.insert(D,K)end
end end if#C>0 then i[u]={items=B,adornments=C,connections=D}t()end end function
g.ClearAll()if p then p:Disconnect()p=nil end for u in pairs(i)do g.
DetachZoneVisuals(u)end table.clear(i)end function g.RefreshAll()g.ClearAll()if
not h or not o then return end for u,v in pairs(o.GetActiveHazardsMap())do g.
AttachZoneVisuals(v)end end function g.SetEnabled(u)h=u and true or false if h
then g.RefreshAll()else g.ClearAll()end end d.OnPaddingChanged(function()if h
then g.RefreshAll()end end)c.Register(function()g.ClearAll()end)return g