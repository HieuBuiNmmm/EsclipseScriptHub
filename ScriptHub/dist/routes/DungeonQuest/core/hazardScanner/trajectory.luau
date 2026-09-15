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
=b.SetHazardPadding local i={'firstBossCrissCross','firstBossBigSpike',
'firstBossSeekingSpikes'}local j=function(j)if not j or type(j)~='string'then
return false end local k=j:lower():gsub('%s+','')if#k==0 then return false end
for l,m in ipairs(i)do local n=m:lower():gsub('%s+','')if#n>0 and string.find(k,
n,1,true)then return true end end return false end function b.IsForceCircle(k)
return j(k)end function b.AddForceCircleName(k)if type(k)=='string'and#k>0 then
table.insert(i,k)b.InvalidateCache()end end function b.GetForceCircleNames()
return i end local k,l,m=function(k)return k and k.Parent and k.Transparency<=c
end,function(k,l,m)local n,o=k.Size,m and e or d if l or(k:IsA'Part'and(k.Shape
==Enum.PartType.Ball or k.Shape==Enum.PartType.Cylinder))then return{radius=math
.max(n.X,n.Y,n.Z)/2}end local p=Vector3.new(math.max(n.X,0)/2+o,0,math.max(n.Z,0
)/2+o)return{half=p,cframe=k.CFrame}end,function(k,l,m,n)if not l then return
false end local o,p=k.X,k.Z m=m or 0 local q=(n or l.isTrajectory)and e or d if
l.radius then local r=(l.part and l.part.Parent)and l.part.Position local s,t=r
and r.X or l.cx or 0,r and r.Z or l.cz or 0 local u,v,w=o-s,p-t,l.radius+q+m
return(u*u+v*v)<=(w*w)end local r=(l.part and l.part.Parent)and l.part.CFrame or
l.cframe if r then local s,t,u=r:PointToObjectSpace(k),l.half.X,l.half.Z if m<=0
then return math.abs(s.X)<=t and math.abs(s.Z)<=u else local v,w=math.max(0,math
.abs(s.X)-t),math.max(0,math.abs(s.Z)-u)return(v*v+w*w)<=(m*m)end end return
false end local n=function(n)if not n or not n.Instance or not n.Instance.Parent
then return nil end local o=n.Instance local p=n.Name or(o and o.Name)or''local
q,r=j(p),n.IsTrajectory==true local s,t=r and e or d if o:IsA'BasePart'then if
not k(o)then return nil end t={o}else t={}for u,v in ipairs(o:GetDescendants())
do if#t>=g then break end if v:IsA'BasePart'and k(v)and v.Parent then t[#t+1]=v
end end if#t==0 then return nil end end local u,v,w,x,y={},math.huge,-math.huge,
math.huge,-math.huge for z,A in ipairs(t)do local B,C=A.Position,A.Size local D=
math.max(C.X,C.Y,C.Z)/2+s v=math.min(v,B.X-D)w=math.max(w,B.X+D)x=math.min(x,B.Z
-D)y=math.max(y,B.Z+D)local E=l(A,q,r)if E then if E.radius then E.cx,E.cz=B.X,B
.Z end E.part=A E.isTrajectory=r u[#u+1]=E end end if#u==0 then return nil end
local z,A,B,C=(v+w)/2,(x+y)/2,(w-v)/2,(y-x)/2 return{zones=u,center=Vector3.new(
z,0,A),boundingRadius=math.sqrt(B*B+C*C)}end local o=function(o)local p=o and o.
HazardZones if not p then p=n(o)if p and o then o.HazardZones=p end end return p
end function b.GetHazardZones(p)return o(p)end function b.GetNearbyHazards(p,q)
local r=h if not r then return{}end q=q or 65 local s,t,u={},p.X,p.Z for v,w in
pairs(r.GetActiveHazardsMap())do local x,y=w.Instance,o(w)if y then local z,A=y.
center.X,y.center.Z if x and x.Parent then local B=x:IsA'BasePart'and x or x.
PrimaryPart or x:FindFirstChildWhichIsA'BasePart'if B then z=B.Position.X A=B.
Position.Z end end local B,C=t-z,u-A local D,E=B*B+C*C,q+y.boundingRadius if D<=
E*E then table.insert(s,w)end end end return s end function b.IsPointInAnyHazard
(p,q,r,s)local t=h if not t then return false,nil,nil end r=r or 0 local u,v,w,x
=math.huge,s or t.GetActiveHazardsMap()for y,z in pairs(v)do local A=z.Instance
or(typeof(y)=='Instance'and y)if q and(q==A or(A and q.Name==A.Name))then
continue end local B=o(z)if not B then continue end local C,D=B.center.X,B.
center.Z if A and A.Parent then local E=A:IsA'BasePart'and A or A.PrimaryPart or
A:FindFirstChildWhichIsA'BasePart'if E then C=E.Position.X D=E.Position.Z end
end local E,F=p.X-C,p.Z-D local G,H=E*E+F*F,B.boundingRadius+r if G>H*H then
continue end local I=z.IsTrajectory==true for J=1,#B.zones do local K=B.zones[J]
if k(K.part)and m(p,K,r,I or K.isTrajectory)then local L=(p-K.part.Position).
Magnitude if L<u then u=L w=z x=K.part end break end end end return x~=nil,w,x
end return b end function a.d()local b,c,d=a.load'a',a.load'b',a.load'c'local e,
f,g,h,i,j,k,l,m,n,o,p=b.RunService or game:GetService'RunService',b.player,{},
false,{},0.85,Color3.fromRGB(255,45,45),Color3.fromRGB(0,160,255),0.55,0.25
local q=function()local q=f and f.Character if not q then return nil end local r
=q:FindFirstChild'HumanoidRootPart'or q.PrimaryPart if not r then return nil end
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
then g.RefreshAll()end end)c.Register(function()g.ClearAll()end)return g end end
local b,c,d=a.load'a',a.load'b',a.load'c'local e,f,g,h,i,j,k,l,m,n,o,p,q=b.
RunService or game:GetService'RunService',b.player,{},false,45,{},0.85,Color3.
fromRGB(255,140,0),0.65,0.2,3.5 local r=function()local r=f and f.Character if
not r then return nil end local s=r:FindFirstChild'HumanoidRootPart'or r.
PrimaryPart if not s then return nil end return s.Position.Y-2.5 end function g.
BindDetection(s)p=s or nil end function g.IsEnabled()return h end function g.
GetPredictionLength()return i end function g.SetPredictionLength(s)if type(s)==
'number'and s>0 then i=math.clamp(s,10,200)g.RefreshAll()end end function g.
IsHazardMoving(s)if not s then return false end local t=j[s]return t and t.
isMoving==true end local s,t=function(s,t)local u=s.Instance if not u or not u.
Parent then return nil,4 end local v,w,y=d.GetTrajectoryMargin and d.
GetTrajectoryMargin()or 2,{},s.Name or(u and u.Name)or''local z=d.IsForceCircle
and d.IsForceCircle(y)if u:IsA'BasePart'then if u.Transparency<=k then table.
insert(w,u)end else for A,B in ipairs(u:GetDescendants())do if B:IsA'BasePart'
and B.Parent and B.Transparency<=k then table.insert(w,B)end end end if#w==0
then return nil,4 end local A,B,C,D=Vector3.new(-t.Z,0,t.X),math.huge,-math.huge
,0 for E,F in ipairs(w)do local G,H,I=F.Position,F.Size,0 if z or(F:IsA'Part'and
(F.Shape==Enum.PartType.Ball or F.Shape==Enum.PartType.Cylinder))then I=math.
max(H.X,H.Y,H.Z)/2 else local J=F.CFrame local K,L,M,N,O,P=J.RightVector,J.
UpVector,J.LookVector,H.X/2,H.Y/2,H.Z/2 I=N*math.abs(K.X*A.X+K.Z*A.Z)+O*math.
abs(L.X*A.X+L.Z*A.Z)+P*math.abs(M.X*A.X+M.Z*A.Z)end local J=G.X*A.X+G.Z*A.Z B=
math.min(B,J-I)C=math.max(C,J+I)local K=G.X*t.X+G.Z*t.Z D+=K end local E,F,G=
math.max(1,(C-B)+v*2),(B+C)/2,D/#w local H=t*G+A*F return H,E end,function(s,t,u
,v,w,y,z)if not t or not t.Parent or not s or not s.Parent then return end local
A=y/2 local B=Vector3.new(u.X+v.X*A,w or u.Y,u.Z+v.Z*A)local C=B+Vector3.new(v.X
,0,v.Z)local D=CFrame.lookAt(B,C)local E=t.CFrame:ToObjectSpace(D)s.CFrame=E s.
Size=Vector3.new(z,n,y)if not s.Visible then s.Visible=true end end local u=
function()if not h then return end local u,v,w=false,os.clock(),r()for y,z in
pairs(j)do local A=y.Instance if not A or not A.Parent then g.
DetachTrajectoryVisuals(y)else u=true local B=z.mainPart if B and B.Parent then
local C,D=B.Position,v-(z.lastClock or v)if D>=0.035 then local E=C-(z.lastPos
or C)local F,G=E.Magnitude/D,Vector3.new(E.X,0,E.Z)local H,I=G.Magnitude/D,z.
isMoving==true if H>=o then z.isMoving=true z.dir=G.Unit else if D>=0.25 and F<o
then z.isMoving=false end end if z.isMoving~=I then y.IsTrajectory=z.isMoving y.
HazardZones=nil if p and p.UpdateHazardVisualColor then pcall(p.
UpdateHazardVisualColor,y,z.isMoving)end local J=a.load'd'if J and J.
UpdateHazardVisualColor then pcall(J.UpdateHazardVisualColor,y,z.isMoving)end
end z.lastPos=C z.lastClock=v end if z.isMoving and z.dir and z.ad then local E,
F=s(y,z.dir)if E then t(z.ad,B,E,z.dir,w,i,F)end else if z.ad and z.ad.Visible
then z.ad.Visible=false end end end end end if not u and q then q:Disconnect()q=
nil end end local v=function()if not q and h then q=e.Heartbeat:Connect(u)end
end function g.DetachTrajectoryVisuals(w)if not w then return end local y=j[w]if
not y then return end if y.ad then pcall(function()y.ad:Destroy()end)y.ad=nil
end if y.connections then for z,A in ipairs(y.connections)do pcall(function()A:
Disconnect()end)end table.clear(y.connections)end j[w]=nil end function g.
AttachTrajectoryVisuals(w)if not h or not w then return end if j[w]then g.
DetachTrajectoryVisuals(w)end local y=w.Instance if not y or not y.Parent then
return end local z if y:IsA'BasePart'then z=y else z=y.PrimaryPart or y:
FindFirstChildWhichIsA'BasePart'if not z then for A,B in ipairs(y:
GetDescendants())do if B:IsA'BasePart'and B.Parent then z=B break end end end
end if not z or not z.Parent then return end local A=Instance.new
'BoxHandleAdornment'A.Name='HazardTrajectoryCorridor'A.Adornee=z A.Size=Vector3.
new(4,n,i)A.Color3=l A.Transparency=m A.ZIndex=1 A.AlwaysOnTop=true A.Visible=
false A.Parent=z local B,C={},z:GetPropertyChangedSignal'Transparency':Connect(
function()if z.Parent and z.Transparency>k then pcall(function()A:Destroy()end)
end end)table.insert(B,C)j[w]={ad=A,connections=B,mainPart=z,lastPos=z.Position,
lastClock=os.clock(),velocity=Vector3.zero,dir=nil,isMoving=false}v()end
function g.ClearAll()if q then q:Disconnect()q=nil end for w in pairs(j)do g.
DetachTrajectoryVisuals(w)end table.clear(j)end function g.RefreshAll()g.
ClearAll()if not h or not p then return end for w,y in pairs(p.
GetActiveHazardsMap())do g.AttachTrajectoryVisuals(y)end end function g.
GetNearbyTrajectories(w,y)y=y or 65 local z,A,B={},w.X,w.Z for C,D in pairs(j)do
if D.isMoving and D.dir and D.mainPart and D.mainPart.Parent then local E,F=s(C,
D.dir)if E and F then local G,H=E.X,E.Z local I,J=A-G,B-H local K,L=I*I+J*J,y+i+
(F/2)if K<=L*L then table.insert(z,{info=C,record=D})end end end end return z
end function g.IsPointInAnyTrajectory(w,y,z)local A,B=w.X,w.Z y=y or 0 if z then
for C,D in ipairs(z)do local E,F=D.info,D.record if F and F.isMoving and F.dir
and F.mainPart and F.mainPart.Parent then local G,H=s(E,F.dir)if G and H then
local I=F.dir local J,K,L=Vector3.new(-I.Z,0,I.X),A-G.X,B-G.Z local M,N,O=K*I.X+
L*I.Z,K*J.X+L*J.Z,H/2 if y<=0 then if M>=0 and M<=i and math.abs(N)<=O then
return true,E end else local P=0 if M<0 then P=-M elseif M>i then P=M-i end
local Q=math.max(0,math.abs(N)-O)if(P*P+Q*Q)<=(y*y)then return true,E end end
end end end return false,nil end for C,D in pairs(j)do if D.isMoving and D.dir
and D.mainPart and D.mainPart.Parent then local E,F=s(C,D.dir)if E and F then
local G=D.dir local H,I,J=Vector3.new(-G.Z,0,G.X),A-E.X,B-E.Z local K,L,M=I*G.X+
J*G.Z,I*H.X+J*H.Z,F/2 if y<=0 then if K>=0 and K<=i and math.abs(L)<=M then
return true,C end else local N=0 if K<0 then N=-K elseif K>i then N=K-i end
local O=math.max(0,math.abs(L)-M)if(N*N+O*O)<=(y*y)then return true,C end end
end end end return false,nil end function g.SetEnabled(w)h=w and true or false
if h then g.RefreshAll()else g.ClearAll()end end d.OnPaddingChanged(function()if
h then g.RefreshAll()end end)c.Register(function()g.ClearAll()end)return g