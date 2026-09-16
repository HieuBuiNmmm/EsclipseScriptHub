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
end return b end function a.d()local b,c,d=a.load'a',a.load'b',a.load'c'local e,
f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v=b.RunService or game:GetService'RunService',
game:GetService'ReplicatedStorage',b.player,{},true,{},0.85,Color3.fromRGB(255,
60,60),Color3.fromRGB(0,180,255),Color3.fromRGB(255,140,0),Color3.fromRGB(220,90
,255),'enemyProjectiles',false,{},{},{secondbossgreenorb=true,secondbossredorb=
true,secondbossyelloworb=true}local w=function()if q then return end q=true
local w=f:FindFirstChild(p)if w then for x,y in ipairs(w:GetChildren())do local
z=(y.Name or''):lower():gsub('%s+','')if#z>0 then r[z]=true end end w.ChildAdded
:Connect(function(x)local y=(x.Name or''):lower():gsub('%s+','')if#y>0 then r[y]
=true end end)end end function h.IsChasingProjectile(x)if not x or type(x)~=
'string'then return false end local y=x:lower():gsub('%s+','')if#y==0 then
return false end if t[y]==true then return true end for z in pairs(t)do if
string.find(y,z,1,true)then return true end end return false end function h.
IsEnemyProjectile(x)w()if not x or type(x)~='string'then return false end local
y=x:lower():gsub('%s+','')if#y==0 then return false end if s[y]==true then
return false end return r[y]==true end function h.BindDetection(x)u=x or nil end
function h.IsEnabled()return i end local x=function()local x=g and g.Character
if not x then return nil end local y=x:FindFirstChild'HumanoidRootPart'or x.
PrimaryPart if not y then return nil end return y.Position.Y-2.5 end local y,z=
function(y)if not y or not y.Parent then return 2.5 end local z=x()if z then
local A=z+2.5 local B,C=A-y.Position.Y,y.Size.Y/2+1.2 return math.clamp(math.
max(B,C),1.5,30)end return math.clamp(y.Size.Y/2+1.8,2,10)end,function(y)return
y and y.Parent and y.Transparency<=k end local A,B=function(A)if not A or not A.
Parent then return nil end if A:IsA'BasePart'then if z(A)then return A end
elseif A:IsA'Model'then if A.PrimaryPart and z(A.PrimaryPart)then return A.
PrimaryPart end local B=A:FindFirstChild'HumanoidRootPart'if B and z(B)then
return B end for C,D in ipairs(A:GetDescendants())do if D:IsA'BasePart'and z(D)
then return D end end else for B,C in ipairs(A:GetDescendants())do if C:IsA
'BasePart'and z(C)then return C end end end return nil end,function(A)local B,C=
A and A.IsTrajectory==true,A and A.Name or'Hazard'local D,E=h.
IsChasingProjectile(C),h.IsEnemyProjectile(C)local F=not B or D if D then local
G,H=o,'220,100,255'return'C',G,H,true elseif E then local G,H=B and n or m,B and
'255,160,50'or'0,210,255'return'P',G,H,F else local G,H=B and n or l,B and
'255,160,50'or'255,80,80'return'N',G,H,F end end local C=function(C,D)if not C
or not C.items or not D then return end local E,F,G,H=B(D)local I,J=D.Name or
'Hazard',''if H then local K=D.SpawnClock or os.clock()local L=math.max(0,os.
clock()-K)J=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(255,220,220)'>%s</font> <font color='rgb(255,255,255)'><b>%.1fs</b></font>]]
):format(G,E,I,L)else J=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(220,235,255)'>%s</font>]]
):format(G,E,I)end for K,L in ipairs(C.items)do if L.label and L.label.Parent
then L.label.Text=J end if L.stroke and L.stroke.Parent and L.stroke.Color~=F
then L.stroke.Color=F end end end local D=function()if not i then return end
local D=false for E,F in pairs(j)do local G=E.Instance if not G or not G.Parent
then h.DetachTimerVisual(E)else if F.items then for H=#F.items,1,-1 do local I=F
.items[H]local J=I.part if not z(J)then if I.billboard and I.billboard.Parent
then pcall(function()I.billboard:Destroy()end)end table.remove(F.items,H)else if
I.billboard and I.billboard.Parent then I.billboard.StudsOffset=Vector3.new(0,y(
J),0)end end end if#F.items==0 then h.DetachTimerVisual(E)else D=true C(F,E)end
else h.DetachTimerVisual(E)end end end if not D and v then v:Disconnect()v=nil
end end local E,F=function()if not v and i then v=e.Heartbeat:Connect(D)end end,
function(E,F)local G,H=y(E),Instance.new'BillboardGui'H.Name=
'HazardLifespanTimer'H.Adornee=E H.AlwaysOnTop=true H.MaxDistance=500 H.
LightInfluence=0 H.ResetOnSpawn=false H.Active=false H.Size=UDim2.new(0,150,0,24
)H.StudsOffset=Vector3.new(0,G,0)H.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
local I=Instance.new'Frame'I.Name='TimerFrame'I.Size=UDim2.new(1,0,1,0)I.
BackgroundColor3=Color3.fromRGB(15,15,20)I.BackgroundTransparency=0.25 I.
BorderSizePixel=0 I.Parent=H local J=Instance.new'UICorner'J.CornerRadius=UDim.
new(0,6)J.Parent=I local K=Instance.new'UIStroke'K.Name='Stroke'K.Thickness=1.3
K.Color=F or l K.Transparency=0.15 K.Parent=I local L=Instance.new'TextLabel'L.
Name='TimerLabel'L.Size=UDim2.new(1,-6,1,0)L.Position=UDim2.new(0,3,0,0)L.
BackgroundTransparency=1 L.Font=Enum.Font.GothamBold L.TextSize=11 L.TextColor3=
Color3.fromRGB(255,255,255)L.TextStrokeTransparency=0 L.TextStrokeColor3=Color3.
fromRGB(0,0,0)L.RichText=true L.TextXAlignment=Enum.TextXAlignment.Center L.
TextYAlignment=Enum.TextYAlignment.Center L.Text=''L.Parent=I H.Parent=E return
H,L,K end function h.AttachTimerVisual(G)if not i or not G then return end local
H=G.Name or(G.Instance and G.Instance.Name)or''if d.IsIceSpikesChain and d.
IsIceSpikesChain(H)then return end if j[G]then h.DetachTimerVisual(G)end local I
=G.Instance if not I or not I.Parent then return end local J,K=B(G)local L=d.
GetHazardZones(G)local M,N,O=L and L.zones,{},{}local P,Q=function(P,Q,R,S,T)
local U={billboard=Q,label=R,stroke=S,part=P,zone=T}table.insert(N,U)local V=P:
GetPropertyChangedSignal'Transparency':Connect(function()if not z(P)then pcall(
function()Q:Destroy()end)end end)table.insert(O,V)local W=P.AncestryChanged:
Connect(function(W,X)if not X then pcall(function()Q:Destroy()end)end end)table.
insert(O,W)end if M and#M>0 then if I:IsA'Model'then if I.PrimaryPart and z(I.
PrimaryPart)then Q=I.PrimaryPart elseif I:FindFirstChild'HumanoidRootPart'and z(
I:FindFirstChild'HumanoidRootPart')then Q=I:FindFirstChild'HumanoidRootPart'end
end if not Q then local R,S=L.center,math.huge for T,U in ipairs(M)do local V=U.
part if z(V)then if R then local W,X=V.Position.X-R.X,V.Position.Z-R.Z local Y=W
*W+X*X if Y<S then S=Y Q=V end else Q=V break end end end end end if not Q then
Q=A(I)end if Q and z(Q)then local R,S,T=F(Q,K)P(Q,R,S,T,nil)end if#N>0 then
local R={items=N,connections=O}j[G]=R C(R,G)E()end end function h.
DetachTimerVisual(G)if not G then return end local H=j[G]if not H then return
end if H.connections then for I,J in ipairs(H.connections)do pcall(function()J:
Disconnect()end)end table.clear(H.connections)end if H.items then for I,J in
ipairs(H.items)do if J.billboard and J.billboard.Parent then pcall(function()J.
billboard:Destroy()end)end end table.clear(H.items)end j[G]=nil end function h.
UpdateHazardVisualColor(G,H)if not G then return end local I=j[G]if I then C(I,G
)else h.AttachTimerVisual(G)end end function h.ClearAll()if v then v:Disconnect(
)v=nil end for G in pairs(j)do h.DetachTimerVisual(G)end table.clear(j)end
function h.RefreshAll()h.ClearAll()if not i or not u then return end for G,H in
pairs(u.GetActiveHazardsMap())do if H then h.AttachTimerVisual(H)end end end
function h.SetEnabled(G)i=G and true or false if i then h.RefreshAll()else h.
ClearAll()end end c.Register(function()h.ClearAll()end)return h end function a.e
()local b,c,d=a.load'a',a.load'b',a.load'c'local e,f,g,h,i,j,k,l,m,n,o,p=b.
RunService or game:GetService'RunService',b.player,{},false,{},0.85,Color3.
fromRGB(255,45,45),Color3.fromRGB(0,160,255),0.55,0.25 local q=function()local q
=f and f.Character if not q then return nil end local r=q:FindFirstChild
'HumanoidRootPart'or q.PrimaryPart if not r then return nil end return r.
Position.Y-2.5 end function g.BindDetection(r)o=r or nil end function g.
IsEnabled()return h end local r=function(r,s)local t,u=r.part,r.ad if not t or
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
local b,c,d,e=a.load'a',a.load'b',a.load'c',a.load'd'local f,g,h,i,j,k,l,m,n,o,p
,q,r,s=b.RunService or game:GetService'RunService',b.player,{},false,45,{},0.85,
Color3.fromRGB(255,140,0),0.65,0.2,3.5,{firstbossseekingspikes='target_player',
firstbossbigspike='target_player'}local t=function()local t=g and g.Character if
not t then return nil end local u=t:FindFirstChild'HumanoidRootPart'or t.
PrimaryPart if not u then return nil end return u.Position end local u,v=
function(u,v)if not u or not v then return nil,nil end local w=u:lower():gsub(
'%s+','')local y=q[w]if not y then for z,A in pairs(q)do if string.find(w,z,1,
true)then y=A break end end end if not y then return nil,nil end if y==
'look_vector'then local z=v.CFrame.LookVector local A=Vector3.new(z.X,0,z.Z)if A
.Magnitude>0.01 then return A.Unit,y end else local z=t()if z then local A=z-v.
Position local B=Vector3.new(A.X,0,A.Z)if B.Magnitude>0.1 then return B.Unit,y
end end local A=v.CFrame.LookVector local B=Vector3.new(A.X,0,A.Z)if B.Magnitude
>0.01 then return B.Unit,y end end return nil,nil end,function()local u=g and g.
Character if not u then return nil end local v=u:FindFirstChild
'HumanoidRootPart'or u.PrimaryPart if not v then return nil end return v.
Position.Y-2.5 end function h.BindDetection(w)r=w or nil end function h.
IsEnabled()return i end function h.GetPredictionLength()return j end function h.
SetPredictionLength(w)if type(w)=='number'and w>0 then j=math.clamp(w,10,200)h.
RefreshAll()end end function h.IsHazardMoving(w)if not w then return false end
local y=k[w]return y and y.isMoving==true end local w,y=function(w,y)local z=w.
Instance if not z or not z.Parent then return nil,4 end local A,B,C=d.
GetTrajectoryMargin and d.GetTrajectoryMargin()or 2,{},w.Name or(z and z.Name)or
''local D=d.IsForceCircle and d.IsForceCircle(C)if z:IsA'BasePart'then if z.
Transparency<=l then table.insert(B,z)end else for E,F in ipairs(z:
GetDescendants())do if F:IsA'BasePart'and F.Parent and F.Transparency<=l then
table.insert(B,F)end end end if#B==0 then return nil,4 end local E,F,G,H=Vector3
.new(-y.Z,0,y.X),math.huge,-math.huge,0 for I,J in ipairs(B)do local K,L,M=J.
Position,J.Size,0 if D or(J:IsA'Part'and(J.Shape==Enum.PartType.Ball or J.Shape
==Enum.PartType.Cylinder))then M=math.max(L.X,L.Y,L.Z)/2 else local N=J.CFrame
local O,P,Q,R,S,T=N.RightVector,N.UpVector,N.LookVector,L.X/2,L.Y/2,L.Z/2 M=R*
math.abs(O.X*E.X+O.Z*E.Z)+S*math.abs(P.X*E.X+P.Z*E.Z)+T*math.abs(Q.X*E.X+Q.Z*E.Z
)end local N=K.X*E.X+K.Z*E.Z F=math.min(F,N-M)G=math.max(G,N+M)local O=K.X*y.X+K
.Z*y.Z H+=O end local I,J,K=math.max(1,(G-F)+A*2),(F+G)/2,H/#B local L=y*K+E*J
return L,I end,function(w,y,z,A,B,C,D)if not y or not y.Parent or not w or not w
.Parent then return end local E=C/2 local F=Vector3.new(z.X+A.X*E,B or z.Y,z.Z+A
.Z*E)local G=F+Vector3.new(A.X,0,A.Z)local H=CFrame.lookAt(F,G)local I=y.CFrame:
ToObjectSpace(H)w.CFrame=I w.Size=Vector3.new(D,o,C)if not w.Visible then w.
Visible=true end end local z=function()if not i then return end local z,A,B=
false,os.clock(),v()for C,D in pairs(k)do local E=C.Instance if not E or not E.
Parent then h.DetachTrajectoryVisuals(C)else z=true local F,G=D.mainPart,C.Name
or(E and E.Name)local H=e and e.IsChasingProjectile and e.IsChasingProjectile(G)
if H then if D.ad and D.ad.Visible then D.ad.Visible=false end D.isMoving=false
C.IsTrajectory=false elseif F and F.Parent then local I,J=F.Position,A-(D.
lastClock or A)if J>=0.035 then local K=I-(D.lastPos or I)local L,M=K.Magnitude/
J,Vector3.new(K.X,0,K.Z)local N,O=M.Magnitude/J,D.isMoving==true if N>=p then D.
isMoving=true D.dir=M.Unit else if not D.isInstant and J>=0.25 and L<p then D.
isMoving=false end end if D.isMoving~=O then C.IsTrajectory=D.isMoving C.
HazardZones=nil if r and r.UpdateHazardVisualColor then pcall(r.
UpdateHazardVisualColor,C,D.isMoving)end local P=a.load'e'if P and P.
UpdateHazardVisualColor then pcall(P.UpdateHazardVisualColor,C,D.isMoving)end
end D.lastPos=I D.lastClock=A end if D.isMoving and D.dir and D.ad then local K,
L=w(C,D.dir)if K then y(D.ad,F,K,D.dir,B,j,L)end else if D.ad and D.ad.Visible
then D.ad.Visible=false end end end end end if not z and s then s:Disconnect()s=
nil end end local A=function()if not s and i then s=f.Heartbeat:Connect(z)end
end function h.DetachTrajectoryVisuals(B)if not B then return end local C=k[B]if
not C then return end if C.ad then pcall(function()C.ad:Destroy()end)C.ad=nil
end if C.connections then for D,E in ipairs(C.connections)do pcall(function()E:
Disconnect()end)end table.clear(C.connections)end k[B]=nil end function h.
AttachTrajectoryVisuals(B)if not i or not B then return end if k[B]then h.
DetachTrajectoryVisuals(B)end local C=B.Instance if not C or not C.Parent then
return end local D=B.Name or(C and C.Name)if e and e.IsChasingProjectile and e.
IsChasingProjectile(D)then B.IsTrajectory=false return end local E if C:IsA
'BasePart'then E=C else E=C.PrimaryPart or C:FindFirstChildWhichIsA'BasePart'if
not E then for F,G in ipairs(C:GetDescendants())do if G:IsA'BasePart'and G.
Parent then E=G break end end end end if not E or not E.Parent then return end
local F=Instance.new'BoxHandleAdornment'F.Name='HazardTrajectoryCorridor'F.
Adornee=E F.Size=Vector3.new(4,o,j)F.Color3=m F.Transparency=n F.ZIndex=1 F.
AlwaysOnTop=true F.Visible=false F.Parent=E local G,H={},E:
GetPropertyChangedSignal'Transparency':Connect(function()if E.Parent and E.
Transparency>l then pcall(function()F:Destroy()end)end end)table.insert(G,H)
local I,J=u(B.Name or(C and C.Name),E)local K=I~=nil k[B]={ad=F,connections=G,
mainPart=E,lastPos=E.Position,lastClock=os.clock(),velocity=Vector3.zero,dir=I,
isMoving=K,isInstant=K,instantMode=J}if K and I then B.IsTrajectory=true B.
HazardZones=nil local L,M,N=v(),w(B,I)if M then y(F,E,M,I,L,j,N)end if r and r.
UpdateHazardVisualColor then pcall(r.UpdateHazardVisualColor,B,true)end local O=
a.load'e'if O and O.UpdateHazardVisualColor then pcall(O.UpdateHazardVisualColor
,B,true)end local P=a.load'd'if P and P.UpdateHazardVisualColor then pcall(P.
UpdateHazardVisualColor,B,true)end end A()end function h.ClearAll()if s then s:
Disconnect()s=nil end for B in pairs(k)do h.DetachTrajectoryVisuals(B)end table.
clear(k)end function h.RefreshAll()h.ClearAll()if not i or not r then return end
for B,C in pairs(r.GetActiveHazardsMap())do h.AttachTrajectoryVisuals(C)end end
function h.GetNearbyTrajectories(B,C)C=C or 65 local D,E,F={},B.X,B.Z for G,H in
pairs(k)do if H.isMoving and H.dir and H.mainPart and H.mainPart.Parent then
local I,J=w(G,H.dir)if I and J then local K,L=I.X,I.Z local M,N=E-K,F-L local O,
P=M*M+N*N,C+j+(J/2)if O<=P*P then table.insert(D,{info=G,record=H})end end end
end return D end function h.IsPointInAnyTrajectory(B,C,D)local E,F=B.X,B.Z C=C
or 0 if D then for G,H in ipairs(D)do local I,J=H.info,H.record if J and J.
isMoving and J.dir and J.mainPart and J.mainPart.Parent then local K,L=w(I,J.dir
)if K and L then local M=J.dir local N,O,P=Vector3.new(-M.Z,0,M.X),E-K.X,F-K.Z
local Q,R,S=O*M.X+P*M.Z,O*N.X+P*N.Z,L/2 if C<=0 then if Q>=0 and Q<=j and math.
abs(R)<=S then return true,I,M,K,L end else local T=0 if Q<0 then T=-Q elseif Q>
j then T=Q-j end local U=math.max(0,math.abs(R)-S)if(T*T+U*U)<=(C*C)then return
true,I,M,K,L end end end end end return false,nil,nil,nil,nil end for G,H in
pairs(k)do if H.isMoving and H.dir and H.mainPart and H.mainPart.Parent then
local I,J=w(G,H.dir)if I and J then local K=H.dir local L,M,N=Vector3.new(-K.Z,0
,K.X),E-I.X,F-I.Z local O,P,Q=M*K.X+N*K.Z,M*L.X+N*L.Z,J/2 if C<=0 then if O>=0
and O<=j and math.abs(P)<=Q then return true,G,K,I,J end else local R=0 if O<0
then R=-O elseif O>j then R=O-j end local S=math.max(0,math.abs(P)-Q)if(R*R+S*S)
<=(C*C)then return true,G,K,I,J end end end end end return false,nil,nil,nil,nil
end function h.SetEnabled(B)i=B and true or false if i then h.RefreshAll()else h
.ClearAll()end end d.OnPaddingChanged(function()if i then h.RefreshAll()end end)
c.Register(function()h.ClearAll()end)return h