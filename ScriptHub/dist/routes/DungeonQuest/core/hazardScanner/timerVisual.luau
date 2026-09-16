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
k,l,m,n,o,p,q,r,s,t,u,v=b.RunService or game:GetService'RunService',game:
GetService'ReplicatedStorage',b.player,{},true,{},0.85,Color3.fromRGB(255,60,60)
,Color3.fromRGB(0,180,255),Color3.fromRGB(255,140,0),Color3.fromRGB(220,90,255),
'enemyProjectiles',false,{},{},{secondbossgreenorb=true,secondbossredorb=true,
secondbossyelloworb=true}local w=function()if q then return end q=true local w=f
:FindFirstChild(p)if w then for x,y in ipairs(w:GetChildren())do local z=(y.Name
or''):lower():gsub('%s+','')if#z>0 then r[z]=true end end w.ChildAdded:Connect(
function(x)local y=(x.Name or''):lower():gsub('%s+','')if#y>0 then r[y]=true end
end)end end function h.IsChasingProjectile(x)if not x or type(x)~='string'then
return false end local y=x:lower():gsub('%s+','')if#y==0 then return false end
if t[y]==true then return true end for z in pairs(t)do if string.find(y,z,1,true
)then return true end end return false end function h.IsEnemyProjectile(x)w()if
not x or type(x)~='string'then return false end local y=x:lower():gsub('%s+','')
if#y==0 then return false end if s[y]==true then return false end return r[y]==
true end function h.BindDetection(x)u=x or nil end function h.IsEnabled()return
i end local x=function()local x=g and g.Character if not x then return nil end
local y=x:FindFirstChild'HumanoidRootPart'or x.PrimaryPart if not y then return
nil end return y.Position.Y-2.5 end local y,z=function(y)if not y or not y.
Parent then return 2.5 end local z=x()if z then local A=z+2.5 local B,C=A-y.
Position.Y,y.Size.Y/2+1.2 return math.clamp(math.max(B,C),1.5,30)end return math
.clamp(y.Size.Y/2+1.8,2,10)end,function(y)return y and y.Parent and y.
Transparency<=k end local A,B=function(A)if not A or not A.Parent then return
nil end if A:IsA'BasePart'then if z(A)then return A end elseif A:IsA'Model'then
if A.PrimaryPart and z(A.PrimaryPart)then return A.PrimaryPart end local B=A:
FindFirstChild'HumanoidRootPart'if B and z(B)then return B end for C,D in
ipairs(A:GetDescendants())do if D:IsA'BasePart'and z(D)then return D end end
else for B,C in ipairs(A:GetDescendants())do if C:IsA'BasePart'and z(C)then
return C end end end return nil end,function(A)local B,C=A and A.IsTrajectory==
true,A and A.Name or'Hazard'local D,E=h.IsChasingProjectile(C),h.
IsEnemyProjectile(C)local F=not B or D if D then local G,H=o,'220,100,255'return
'C',G,H,true elseif E then local G,H=B and n or m,B and'255,160,50'or'0,210,255'
return'P',G,H,F else local G,H=B and n or l,B and'255,160,50'or'255,80,80'return
'N',G,H,F end end local C=function(C,D)if not C or not C.items or not D then
return end local E,F,G,H=B(D)local I,J=D.Name or'Hazard',''if H then local K=D.
SpawnClock or os.clock()local L=math.max(0,os.clock()-K)J=(
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
ClearAll()end end c.Register(function()h.ClearAll()end)return h