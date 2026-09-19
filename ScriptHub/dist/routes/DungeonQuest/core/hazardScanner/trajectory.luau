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
end table.clear(b.callbacks)end function b.IsActive()return not b.cleaned end b.
OnCleanup=b.Register return b end function a.c()local b,c,d,e,f,g,h={},0.85,0,2,
{},64 function b.BindDetection(i)h=i or nil end function b.GetHazardPadding()
return d end b.GetHitboxPadding=b.GetHazardPadding function b.
GetTrajectoryMargin()return e end function b.SetTrajectoryMargin(i)if type(i)==
'number'and i>=0 and i~=e then e=i b.InvalidateCache()for j,k in ipairs(f)do
pcall(k,e)end end end function b.InvalidateCache()if h and h.GetActiveHazardsMap
then for i,j in pairs(h.GetActiveHazardsMap())do j.HazardZones=nil end end end
function b.OnPaddingChanged(i)if type(i)=='function'then table.insert(f,i)end
end function b.SetHazardPadding(i)if type(i)=='number'and i>=0 and i~=d then d=i
b.InvalidateCache()for j,k in ipairs(f)do pcall(k,d)end end end b.
SetHitboxPadding=b.SetHazardPadding local i,j,k,l=game:GetService
'ReplicatedStorage',{'firstBossCrissCross','firstBossSeekingSpikes'},{
'smallicespikes','mediumicespikes','largeicespikes'}local m=function(m)if not m
or type(m)~='string'then return false end local n=m:lower():gsub('%s+','')if#n==
0 then return false end for o,p in ipairs(k)do if string.find(n,p,1,true)then
return true end end return false end function b.IsIceSpikesChain(n)return m(n)
end local n,o={'secondbosscriclehitbox','secondbosscirclehitbox'},1.2 local p=
function(p)if not p or type(p)~='string'then return false end local q=p:lower():
gsub('%s+','')if#q==0 then return false end for r,s in ipairs(n)do if string.
find(q,s,1,true)then return true end end return false end function b.
IsSecondBossCircleChain(q)return p(q)end function b.GetSecondBossCircleDuration(
)return o end function b.SetSecondBossCircleDuration(q)if type(q)=='number'and q
>=0.1 then o=math.clamp(q,0.1,10)b.InvalidateCache()end end local q={
'movingbeam'}local r=function(r)if not r or type(r)~='string'then return false
end local s=r:lower():gsub('%s+','')if#s==0 then return false end for t,u in
ipairs(q)do if string.find(s,u,1,true)then return true end end return false end
function b.IsMovingBeam(s)return r(s)end local s,t={'firstbossbigspike',
'firstbossbeampart','bigspike'},function(s)if not s or type(s)~='string'then
return false end local t=s:lower():gsub('%s+','')return string.find(t,
'firstbossbeampart',1,true)~=nil end function b.IsBeamTelegraph(u)return t(u)end
local u=function(u)if not u or type(u)~='string'then return false end local v=u:
lower():gsub('%s+','')if#v==0 or string.find(v,'seekingspike',1,true)then return
false end for w,x in ipairs(s)do if string.find(v,x,1,true)then return true end
end return false end function b.IsBigSpike(v)return u(v)end local v=function()if
l and l>0 then return l end local v,w=45,i:FindFirstChild'enemyProjectiles'if
not w then return v end local x=w:FindFirstChild'largeIceSpikes'if not x then
for y,z in ipairs(w:GetChildren())do local A=(z.Name or''):lower():gsub('%s+',''
)if A=='largeicespikes'then x=z break end end end if not x then return v end
local y,z=0,Vector3.zero if x:IsA'Model'and x.PrimaryPart then z=x.PrimaryPart.
Position elseif x:IsA'BasePart'then z=x.Position end local A={}if x:IsA
'BasePart'then table.insert(A,x)else for B,C in ipairs(x:GetDescendants())do if
C:IsA'BasePart'then table.insert(A,C)end end end if#A==0 then return v end for B
,C in ipairs(A)do local D=C.Size local E,F=math.max(D.X,D.Z)/2,(Vector3.new(C.
Position.X,0,C.Position.Z)-Vector3.new(z.X,0,z.Z)).Magnitude local G=F+E if G>y
then y=G end end if y>=5 then l=y return l end return v end function b.
GetLargeIceSpikesMaxRadius()return v()end local w=function(w)if not w or type(w)
~='string'then return false end local x=w:lower():gsub('%s+','')if#x==0 then
return false end for y,z in ipairs(j)do local A=z:lower():gsub('%s+','')if#A>0
and string.find(x,A,1,true)then return true end end return false end function b.
IsForceCircle(x)return w(x)end function b.AddForceCircleName(x)if type(x)==
'string'and#x>0 then table.insert(j,x)b.InvalidateCache()end end function b.
GetForceCircleNames()return j end local x,y,z,A=function(x)return x and x.Parent
and x.Transparency<=c end,function(x,y,z)local A,B,C,D=x.Size,z and e or d,(x
and x.Name)or'',(x and x.Parent and x.Parent.Name)or''if u(C)or u(D)then local E
,F=A,x:FindFirstChildWhichIsA('SpecialMesh',true)if F then E=Vector3.new(E.X*
math.abs(F.Scale.X),E.Y*math.abs(F.Scale.Y),E.Z*math.abs(F.Scale.Z))end local G=
{E.X,E.Y,E.Z}table.sort(G)local H,I=math.clamp(G[2],6,60),math.clamp(G[3],8,80)
local J,K=H/2+B,I/2+B return{half=Vector3.new(J,0,K),cframe=x.CFrame,isBigSpike=
true}end if y or(x:IsA'Part'and(x.Shape==Enum.PartType.Ball or x.Shape==Enum.
PartType.Cylinder))then return{radius=math.max(A.X,A.Y,A.Z)/2}end local E=
Vector3.new(math.max(A.X,0)/2+B,0,math.max(A.Z,0)/2+B)return{half=E,cframe=x.
CFrame}end,function(x,y,z,A)if not y then return false end if y.expireTime and
os.clock()>y.expireTime then return false end local B,C=x.X,x.Z z=z or 0 local D
=(A or y.isTrajectory)and e or d if y.radius then local E,F=(y.part and y.part.
Parent)and y.part.Position,y.isSecondBossChain==true local G,H=(F and y.cx)or(E
and E.X)or y.cx or 0,(F and y.cz)or(E and E.Z)or y.cz or 0 local I,J,K=B-G,C-H,y
.radius+D+z return(I*I+J*J)<=(K*K)end local E=(y.part and y.part.Parent)and y.
part.CFrame or y.cframe if E then local F,G,H=E:PointToObjectSpace(x),y.half.X,y
.half.Z if z<=0 then return math.abs(F.X)<=G and math.abs(F.Z)<=H else local I,J
=math.max(0,math.abs(F.X)-G),math.max(0,math.abs(F.Z)-H)return(I*I+J*J)<=(z*z)
end end return false end,function(x,y)local z=(y and y.CFrame)or(x:IsA'Model'and
x:GetPivot())if z then local A=z.LookVector local B=Vector3.new(-A.X,0,-A.Z)if B
.Magnitude>0.05 then return B.Unit end end local A=services.player or game:
GetService'Players'.LocalPlayer local B=A and A.Character local C=B and(B:
FindFirstChild'HumanoidRootPart'or B.PrimaryPart)if C and y then local D=Vector3
.new(C.Position.X-y.Position.X,0,C.Position.Z-y.Position.Z)if D.Magnitude>0.1
then return D.Unit end end return Vector3.new(0,0,-1)end local B=function(B)if
not B or not B.Instance or not B.Instance.Parent then return nil end local C=B.
Instance local D=B.Name or(C and C.Name)or''local E,F=w(D),B.IsTrajectory==true
local G,H=F and e or d if m(D)then local I,J=(v())if C:IsA'BasePart'then J=x(C)
and C or nil elseif C:IsA'Model'then if C.PrimaryPart and x(C.PrimaryPart)then J
=C.PrimaryPart else for K,L in ipairs(C:GetDescendants())do if L:IsA'BasePart'
and x(L)and L.Parent then J=L break end end end end if not J then return nil end
local K=J.Position local L={radius=I,cx=K.X,cz=K.Z,part=J,isTrajectory=false,
isIceSpikes=true}return{zones={L},center=Vector3.new(K.X,0,K.Z),boundingRadius=I
+G}end if p(D)then local I if C:IsA'BasePart'then I=x(C)and C or nil elseif C:
IsA'Model'then if C.PrimaryPart and x(C.PrimaryPart)then I=C.PrimaryPart else
for J,K in ipairs(C:GetDescendants())do if K:IsA'BasePart'and x(K)and K.Parent
then I=K break end end end end if not I then return nil end local J,K,L,M,N,O,P,
Q,R,S=I.Position,A(C,I),B.SpawnClock or os.clock(),{},10,11,3,22,o,0.4 local T=(
N-1)*Q for U=1,N do local V=(U-1)*Q local W,X,Y=Vector3.new(J.X,0,J.Z)+K*V,O+(U-
1)*P,L+R+(U-1)*S table.insert(M,{radius=X,cx=W.X,cz=W.Z,part=I,expireTime=Y,
isTrajectory=false,isSecondBossChain=true,circleIndex=U})end local U,V=Vector3.
new(J.X,0,J.Z)+K*(T/2),O+(N-1)*P local W,X=(T/2)+V+G,L+R+(N-1)*S if B then B.
MaxExpireTime=X B.IsSyntheticChain=true end return{zones=M,center=U,
boundingRadius=W,maxExpireTime=X}end if t(D)then return nil end if u(D)then
local I if C:IsA'BasePart'then I=x(C)and C or nil elseif C:IsA'Model'then I=C.
PrimaryPart or C:FindFirstChildWhichIsA'BasePart'if not I or not x(I)then for J,
K in ipairs(C:GetDescendants())do if K:IsA'BasePart'and x(K)and K.Parent then I=
K break end end end end if not I then return nil end local J,K,L=I.Position,I.
Size,I:FindFirstChildWhichIsA('SpecialMesh',true)if L then K=Vector3.new(K.X*
math.abs(L.Scale.X),K.Y*math.abs(L.Scale.Y),K.Z*math.abs(L.Scale.Z))end local M=
{K.X,K.Y,K.Z}table.sort(M)local N,O=math.clamp(M[2],6,60),math.clamp(M[3],8,80)
local P,Q=N/2+G,O/2+G local R={half=Vector3.new(P,0,Q),cframe=I.CFrame,part=I,cx
=J.X,cz=J.Z,isTrajectory=F,isBigSpike=true}return{zones={R},center=Vector3.new(J
.X,0,J.Z),boundingRadius=math.sqrt(P*P+Q*Q)}end if C:IsA'BasePart'then if not x(
C)then return nil end H={C}else H={}for I,J in ipairs(C:GetDescendants())do if#H
>=g then break end if J:IsA'BasePart'and x(J)and J.Parent then H[#H+1]=J end end
if#H==0 then return nil end end local I,J,K,L,M={},math.huge,-math.huge,math.
huge,-math.huge for N,O in ipairs(H)do local P,Q=O.Position,O.Size local R=math.
max(Q.X,Q.Y,Q.Z)/2+G J=math.min(J,P.X-R)K=math.max(K,P.X+R)L=math.min(L,P.Z-R)M=
math.max(M,P.Z+R)local S=y(O,E,F)if S then S.part=O S.isTrajectory=F I[#I+1]=S
end end if#I==0 then return nil end local N,O,P,Q=(J+K)/2,(L+M)/2,(K-J)/2,(M-L)/
2 return{zones=I,center=Vector3.new(N,0,O),boundingRadius=math.sqrt(P*P+Q*Q)}end
local C=function(C)local D=C and C.HazardZones if not D then D=B(C)if D and C
then C.HazardZones=D end end return D end function b.GetHazardZones(D)return C(D
)end function b.GetNearbyHazards(D,E)local F=h if not F then return{}end E=E or
65 local G,H,I={},D.X,D.Z for J,K in pairs(F.GetActiveHazardsMap())do local L,M=
K.Instance,C(K)if M then local N,O=M.center.X,M.center.Z if L and L.Parent then
local P=L:IsA'BasePart'and L or L.PrimaryPart or L:FindFirstChildWhichIsA
'BasePart'if P then N=P.Position.X O=P.Position.Z end end local P,Q=H-N,I-O
local R,S=P*P+Q*Q,E+M.boundingRadius if R<=S*S then table.insert(G,K)end end end
return G end function b.IsPointInAnyHazard(D,E,F,G)local H=h if not H then
return false,nil,nil end F=F or 0 local I,J,K,L=math.huge,G or H.
GetActiveHazardsMap()for M,N in pairs(J)do local O=N.Instance or(typeof(M)==
'Instance'and M)if E and(E==O or(O and E.Name==O.Name))then continue end local P
=N.Name or(O and O.Name)or''if r(P)or u(P)then continue end local Q=C(N)if not Q
then continue end local R,S=Q.center.X,Q.center.Z if O and O.Parent then local T
=O:IsA'BasePart'and O or O.PrimaryPart or O:FindFirstChildWhichIsA'BasePart'if T
then R=T.Position.X S=T.Position.Z end end local T,U=D.X-R,D.Z-S local V,W=T*T+U
*U,Q.boundingRadius+F if V>W*W then continue end local X=N.IsTrajectory==true
for Y=1,#Q.zones do local Z=Q.zones[Y]if x(Z.part)and z(D,Z,F,X or Z.
isTrajectory)then local _=(D-Z.part.Position).Magnitude if _<I then I=_ K=N L=Z.
part end break end end end return L~=nil,K,L end return b end function a.d()
local b,c,d=a.load'a',a.load'b',a.load'c'local e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u
,v=b.RunService or game:GetService'RunService',game:GetService
'ReplicatedStorage',b.player,{},true,{},0.85,Color3.fromRGB(255,60,60),Color3.
fromRGB(0,180,255),Color3.fromRGB(255,140,0),Color3.fromRGB(220,90,255),
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
H=G.Name or(G.Instance and G.Instance.Name)or''if(d.IsIceSpikesChain and d.
IsIceSpikesChain(H))or(d.IsSecondBossCircleChain and d.IsSecondBossCircleChain(H
))then return end if j[G]then h.DetachTimerVisual(G)end local I=G.Instance if
not I or not I.Parent then return end local J,K=B(G)local L=d.GetHazardZones(G)
local M,N,O=L and L.zones,{},{}local P,Q=function(P,Q,R,S,T)local U={billboard=Q
,label=R,stroke=S,part=P,zone=T}table.insert(N,U)local V=P:
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
()local b,c,d=a.load'a',a.load'b',a.load'c'local e,f,g,h,i,j,k,l,m,n,o,p,q=b.
RunService or game:GetService'RunService',b.player,{},false,{},0.85,Color3.
fromRGB(255,45,45),Color3.fromRGB(0,160,255),Color3.fromRGB(0,230,90),0.55,0.25
local r=function()local r=f and f.Character if not r then return nil end local s
=r:FindFirstChild'HumanoidRootPart'or r.PrimaryPart if not s then return nil end
return s.Position.Y-2.5 end function g.BindDetection(s)p=s or nil end local s
function g.BindTrajectory(t)s=t or nil end function g.IsEnabled()return h end
local t=function(t,u)local v,w,x=t.ad,t.zone,t.part local y=t.anchorPart or x if
not v or not v.Parent or not y or not y.Parent then return end local z=w and(w.
isSecondBossChain or(t.hazardInfo and t.hazardInfo.IsSyntheticChain))local A=(z
and w.cx and w.cz and Vector3.new(w.cx,0,w.cz))or(x and x.Parent and x.Position)
or((w and w.cx and w.cz)and Vector3.new(w.cx,0,w.cz))if not A then return end
local B=Vector3.new(A.X,u or A.Y,A.Z)if t.isCircle then local C=CFrame.new(B)*
CFrame.Angles(math.rad(90),0,0)v.CFrame=(y==workspace.Terrain)and C or y.CFrame:
ToObjectSpace(C)else local C if w and w.isBigSpike then local D=s and s.
GetHazardDirection and s.GetHazardDirection(t.hazardInfo)if D and D.Magnitude>
0.01 then C=CFrame.lookAt(B,B+D)else local E=(x and x.Parent)and x.CFrame or
CFrame.identity local F,G,H=E:ToOrientation()C=CFrame.new(B)*CFrame.Angles(0,G,0
)end else local D=(x and x.Parent)and x.CFrame or CFrame.identity local E,G,H=D:
ToOrientation()C=CFrame.new(B)*CFrame.Angles(0,G,0)end v.CFrame=(y==workspace.
Terrain)and C or y.CFrame:ToObjectSpace(C)end end local u=function()if not h
then return end local u,v,w=false,r(),os.clock()for x,y in pairs(i)do local z,A=
x.IsSyntheticChain or(x.MaxExpireTime and w<x.MaxExpireTime),x.Instance and x.
Instance.Parent if not A and not z then g.DetachZoneVisuals(x)else if y.items
then local B={}for C,D in ipairs(y.items)do local G=D.zone if G and G.expireTime
and w>G.expireTime then if D.ad and D.ad.Parent then pcall(function()D.ad:
Destroy()end)end elseif D.ad and D.ad.Parent then table.insert(B,D)t(D,v)end end
y.items=B if#B>0 then u=true else g.DetachZoneVisuals(x)end end end end if not u
and q then q:Disconnect()q=nil end end local v=function()if not q and h then q=e
.Heartbeat:Connect(u)end end function g.DetachZoneVisuals(w)if not w then return
end local x=i[w]if not x then return end if x.adornments then for y,z in ipairs(
x.adornments)do pcall(function()z:Destroy()end)end table.clear(x.adornments)end
if x.connections then for y,z in ipairs(x.connections)do pcall(function()z:
Disconnect()end)end table.clear(x.connections)end if x.items then table.clear(x.
items)end i[w]=nil end function g.UpdateHazardVisualColor(w,x)if not w then
return end local y=i[w]if not y or not y.items then return end local z=w.Name or
(w.Instance and w.Instance.Name)or''local A,B=(d.IsSecondBossCircleChain and d.
IsSecondBossCircleChain(z))or(w and w.IsSyntheticChain==true),x==true or w.
IsTrajectory==true local C,D=A and m or(B and l or k),B and d.
GetTrajectoryMargin()or 0 for G,H in ipairs(y.items)do local I,J,K=H.ad,H.zone,H
.part if I and I.Parent and J and K and K.Parent then I.Color3=C if H.isCircle
and J.radius then I.Radius=J.radius+D elseif J.half then local L,M=J.half.X,J.
half.Z I.Size=Vector3.new(L*2,o,M*2)end end end end function g.AttachZoneVisuals
(w)if not h or not w then return end if i[w]then g.DetachZoneVisuals(w)end local
x=d.GetHazardZones(w)if not x or not x.zones then return end local y=w.Name or(w
.Instance and w.Instance.Name)or''local z,A=(d.IsSecondBossCircleChain and d.
IsSecondBossCircleChain(y))or(w and w.IsSyntheticChain==true),w.IsTrajectory==
true local B,C,D,G,H,I,J=z and m or(A and l or k),A and d.GetTrajectoryMargin()
or 0,r(),{},{},{},workspace.Terrain for K,L in ipairs(x.zones)do local M,N,O=L.
part,L.isSecondBossChain==true,L.isBigSpike==true local P=(N or O)and J or M if
N or O or(M and M.Parent and M.Transparency<=j)then local Q,R=false if L.radius
then Q=true local S=Instance.new'CylinderHandleAdornment'S.Name=
'HazardGroundCircle'S.Adornee=P S.Radius=L.radius+C S.Height=o S.Color3=B S.
Transparency=n S.ZIndex=2 S.AlwaysOnTop=true S.Parent=P R=S elseif L.half and L.
cframe then local S=Instance.new'BoxHandleAdornment'S.Name='HazardGroundBox'S.
Adornee=P S.Size=Vector3.new(L.half.X*2,o,L.half.Z*2)S.Color3=B S.Transparency=n
S.ZIndex=2 S.AlwaysOnTop=true S.Parent=P R=S end if R then local S={ad=R,part=M,
anchorPart=P,isCircle=Q,zone=L,hazardInfo=w}t(S,D)table.insert(G,S)table.insert(
H,R)if not N and M then local T=M:GetPropertyChangedSignal'Transparency':
Connect(function()if M.Parent and M.Transparency>j then pcall(function()R:
Destroy()end)end end)table.insert(I,T)end end end end if#H>0 then i[w]={items=G,
adornments=H,connections=I}v()end end function g.ClearAll()if q then q:
Disconnect()q=nil end for w in pairs(i)do g.DetachZoneVisuals(w)end table.clear(
i)end function g.RefreshAll()g.ClearAll()if not h or not p then return end for w
,x in pairs(p.GetActiveHazardsMap())do g.AttachZoneVisuals(x)end end function g.
SetEnabled(w)h=w and true or false if h then g.RefreshAll()else g.ClearAll()end
end d.OnPaddingChanged(function()if h then g.RefreshAll()end end)c.Register(
function()g.ClearAll()end)return g end end local b,c,d,e=a.load'a',a.load'b',a.
load'c',a.load'd'local f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w=b.RunService or game:
GetService'RunService',b.player,{},false,45,{secondbossmovingbeam=80},{
firstbossbigspike=28,firstbossseekingspikes=10},{},0.85,Color3.fromRGB(255,140,0
),0.65,0.2,3.5,{firstbossseekingspikes='look_vector',firstbossbigspike=
'look_vector',firstbossbeampart='look_vector',secondbossmovingbeam='look_vector'
},function(f)if not f or type(f)~='string'then return false end local g=f:lower(
):gsub('%s+','')return string.find(g,'firstbossbeampart',1,true)~=nil end,
function(f)if not f then return'seeking_spike'end local g=typeof(f)=='string'and
f or(f.Name or'')local h=g:lower():gsub('%s+','')if not string.find(h,
'firstbossbeampart',1,true)then if string.find(h,'bigspike',1,true)and not
string.find(h,'seekingspike',1,true)then return'big_spike'end if string.find(h,
'seekingspike',1,true)then return'seeking_spike'end return nil end if typeof(f)
=='Instance'then local i=f:FindFirstChildWhichIsA('Beam',true)if i then if i.
Width0>=25 or i.Width1>=25 then return'big_spike'else return'seeking_spike'end
end local j=f:IsA'BasePart'and f.Position or(f:IsA'Model'and f:GetPivot().
Position)if j then for k,l in ipairs(workspace:GetChildren())do local m=l.Name:
lower():gsub('%s+','')if string.find(m,'firstbossbigspike',1,true)then local n=l
:IsA'BasePart'and l.Position or(l:IsA'Model'and l:GetPivot().Position)if n and(n
-j).Magnitude<15 then return'big_spike'end elseif string.find(m,'seekingspike',1
,true)then local n=l:IsA'BasePart'and l.Position or(l:IsA'Model'and l:GetPivot()
.Position)if n and(n-j).Magnitude<15 then return'seeking_spike'end end end end
end return'seeking_spike'end local x,y=function(x,y)if not x or type(x)~=
'string'then return false end local z=x:lower():gsub('%s+','')if#z==0 or string.
find(z,'seekingspike',1,true)then return false end if string.find(z,
'firstbossbeampart',1,true)then return u(y)=='big_spike'end return string.find(z
,'firstbossbigspike',1,true)~=nil or string.find(z,'bigspike',1,true)~=nil end,
function(x,y)if not x or type(x)~='string'then return false end local z=x:lower(
):gsub('%s+','')if#z==0 or string.find(z,'firstbossbigspike',1,true)then return
false end if string.find(z,'firstbossbeampart',1,true)then return u(y)==
'seeking_spike'end return string.find(z,'firstbossseekingspikes',1,true)~=nil or
string.find(z,'seekingspike',1,true)~=nil end local z,A=function(z,A)return x(z,
A)or y(z,A)end,function(z)if not z or not z.Parent then return nil,nil,nil,nil
end local A,B=((z.Name or''):lower())if t(A)then B=z:IsA'BasePart'and z or z:
FindFirstChildWhichIsA'BasePart'end if not B then local C=z:IsA'BasePart'and z.
Position or(z:IsA'Model'and z:GetPivot().Position)if C then local D,G=35,x(z.
Name,z)and'big_spike'or'seeking_spike'for H,I in ipairs(workspace:GetChildren())
do local J=I.Name:lower()if t(J)or string.find(J,'beampart',1,true)then if u(I)
==G then local K=I:IsA'BasePart'and I.Position or(I:IsA'Model'and I:GetPivot().
Position)if K then local L=(K-C).Magnitude if L<D then D=L B=I end end end end
end end end if not B then return nil,nil,nil,nil end local C=B:FindFirstChild(
'Attachment2',true)if not C or not C:IsA'Attachment'then for D,G in ipairs(B:
GetDescendants())do if G:IsA'Attachment'and G.Name~='Attachment0'and G.Name~=
'Attachment1'then C=G break end end end local D,G=B.Position,C and C.
WorldPosition if G and D then local H=G-D local I=Vector3.new(H.X,0,H.Z)local J=
I.Magnitude if J>5 then local K=I.Unit return J,K,D,G end end return nil,nil,nil
,nil end local B=function(B)if not B then return nil end local C,D,G,H=0,0,0,{}
if B:IsA'BasePart'then table.insert(H,B)else for I,J in ipairs(B:GetDescendants(
))do if J:IsA'BasePart'then table.insert(H,J)end end end for I,J in ipairs(H)do
local K,L=J.Size,J:FindFirstChildWhichIsA('SpecialMesh',true)if L then K=Vector3
.new(K.X*math.abs(L.Scale.X),K.Y*math.abs(L.Scale.Y),K.Z*math.abs(L.Scale.Z))end
C=math.max(C,K.X)D=math.max(D,K.Y)G=math.max(G,K.Z)end if C<=0 and D<=0 and G<=0
then return nil end local I={C,D,G}table.sort(I)local J=I[2]if J<2 then J=math.
max(I[1],I[2])end return J end local C,D=function(C)if l.firstbossbigspike then
return l.firstbossbigspike end if cachedBigSpikeWidth then return
cachedBigSpikeWidth end if C and not t(C.Name)then local D=B(C)if D and D>=4
then cachedBigSpikeWidth=math.clamp(D,8,60)return cachedBigSpikeWidth end end
for D,G in ipairs(workspace:GetChildren())do local H=G.Name:lower()if string.
find(H,'firstbossbigspike',1,true)or(string.find(H,'bigspike',1,true)and not
string.find(H,'seekingspike',1,true)and not t(H))then local I=B(G)if I and I>=4
then cachedBigSpikeWidth=math.clamp(I,8,60)return cachedBigSpikeWidth end end
end local D=game:GetService'ReplicatedStorage'local G=D:FindFirstChild
'enemyProjectiles'local H=G and G:FindFirstChild'firstBossBigSpike'if H then
local I=B(H)if I and I>=4 then cachedBigSpikeWidth=math.clamp(I,8,60)return
cachedBigSpikeWidth end end return 28 end local G=function(G)if l.
firstbossseekingspikes then return l.firstbossseekingspikes end if D then return
D end if G and not t(G.Name)then local H=B(G)if H and H>=2 then D=math.clamp(H,4
,40)return D end end for H,I in ipairs(workspace:GetChildren())do local J=I.Name
:lower():gsub('%s+','')if string.find(J,'seekingspike',1,true)and not t(J)then
local K=B(I)if K and K>=2 then D=math.clamp(K,4,40)return D end end end local H=
game:GetService'ReplicatedStorage'local I=H:FindFirstChild'enemyProjectiles'
local J=I and I:FindFirstChild'firstBossSeekingSpikes'if J then local K=B(J)if K
and K>=2 then D=math.clamp(K,4,40)return D end end return 10 end local H,I,J=
function(H,I)if x(H,I)then return C(I)else return G(I)end end,function(H)if not
H then return j end local I,J=''if type(H)=='string'then I=H elseif type(H)==
'table'then I=H.Name or(H.Instance and H.Instance.Name)or''J=m[H]end local K=(J
and J.mainPart)or(type(H)=='table'and H.Instance)if z(I,K)then if J and J.
beamLength then return J.beamLength end if x(I,K)then return k.firstbossbigspike
or 140 else return k.firstbossseekingspikes or 80 end end if J and J.beamLength
then return J.beamLength end local L=I:lower():gsub('%s+','')if k[L]then return
k[L]end for M,N in pairs(k)do if string.find(L,M,1,true)then return N end end
return j end,function()local H=g and g.Character if not H then return nil end
local I=H:FindFirstChild'HumanoidRootPart'or H.PrimaryPart if not I then return
nil end return I.Position end local K,L=function(K,L)if not K or not L then
return nil,nil end local M=K:lower():gsub('%s+','')local N=s[M]if not N then for
O,P in pairs(s)do if string.find(M,O,1,true)then N=P break end end end if not N
then return nil,nil end if N=='look_vector'then local O=L.CFrame.LookVector
local P=Vector3.new(O.X,0,O.Z)if P.Magnitude>0.01 then return P.Unit,N end else
local O=J()if O then local P=O-L.Position local Q=Vector3.new(P.X,0,P.Z)if Q.
Magnitude>0.1 then return Q.Unit,N end end local P=L.CFrame.LookVector local Q=
Vector3.new(P.X,0,P.Z)if Q.Magnitude>0.01 then return Q.Unit,N end end return
nil,nil end,function()local K=g and g.Character if not K then return nil end
local L=K:FindFirstChild'HumanoidRootPart'or K.PrimaryPart if not L then return
nil end return L.Position.Y-2.5 end function h.BindDetection(M)v=M or nil end
function h.IsEnabled()return i end function h.GetPredictionLength()return j end
function h.SetPredictionLength(M)if type(M)=='number'and M>0 then j=math.clamp(M
,10,200)h.RefreshAll()end end function h.GetHazardPredictionLength(M)return I(M)
end function h.GetCustomLength(M)if not M then return nil end local N=M:lower():
gsub('%s+','')return k[N]end function h.SetCustomLength(M,N)if not M then return
end local O=M:lower():gsub('%s+','')if type(N)=='number'and N>0 then k[O]=math.
clamp(N,10,300)else k[O]=nil end h.RefreshAll()end function h.
GetSecondBossBeamLength()return k.secondbossmovingbeam or 80 end function h.
SetSecondBossBeamLength(M)h.SetCustomLength('secondbossmovingbeam',M)end
function h.GetFirstBossBigSpikeWidth()return l.firstbossbigspike or 28 end
function h.SetFirstBossBigSpikeWidth(M)if type(M)=='number'and M>0 then l.
firstbossbigspike=math.clamp(M,6,60)else l.firstbossbigspike=nil end
cachedBigSpikeWidth=nil h.RefreshAll()end function h.
GetFirstBossSeekingSpikeWidth()return l.firstbossseekingspikes or(D or 10)end
function h.SetFirstBossSeekingSpikeWidth(M)if type(M)=='number'and M>0 then l.
firstbossseekingspikes=math.clamp(M,4,40)else l.firstbossseekingspikes=nil end D
=nil h.RefreshAll()end function h.GetCustomWidth(M)if not M then return nil end
local N=M:lower():gsub('%s+','')return l[N]end function h.SetCustomWidth(M,N)if
not M then return end local O=M:lower():gsub('%s+','')if type(N)=='number'and N>
0 then l[O]=math.clamp(N,4,100)else l[O]=nil end h.RefreshAll()end function h.
IsHazardMoving(M)if not M then return false end local N=m[M]return N and N.
isMoving==true end function h.GetHazardDirection(M)if not M then return nil end
local N=m[M]return N and N.dir or nil end local aa,ab=function(M,N)local O=M.
Instance if not O or not O.Parent then return nil,4 end local P,Q=d.
GetTrajectoryMargin and d.GetTrajectoryMargin()or 2,M.Name or(O and O.Name)or''
if z(Q,O)then local R=m[M]local S=(R and R.mainPart)or(O:IsA'BasePart'and O or O
.PrimaryPart or O:FindFirstChildWhichIsA'BasePart')local T,U=(R and R.
beamStartPos)or(S and S.Position)or O.Position,H(Q,S)local V=math.max(1,U+P*2)
return Vector3.new(T.X,0,T.Z),V end local R,S={},d.IsForceCircle and d.
IsForceCircle(Q)if O:IsA'BasePart'then if O.Transparency<=n then table.insert(R,
O)end else for T,U in ipairs(O:GetDescendants())do if U:IsA'BasePart'and U.
Parent and U.Transparency<=n then table.insert(R,U)end end end if#R==0 then
return nil,4 end local T,U,V,W=Vector3.new(-N.Z,0,N.X),math.huge,-math.huge,0
for X,Y in ipairs(R)do local Z,_,aa=Y.Position,Y.Size,0 if S or(Y:IsA'Part'and(Y
.Shape==Enum.PartType.Ball or Y.Shape==Enum.PartType.Cylinder))then aa=math.max(
_.X,_.Y,_.Z)/2 else local ab=Y.CFrame local ac,ad,ae,af,ag,ah=ab.RightVector,ab.
UpVector,ab.LookVector,_.X/2,_.Y/2,_.Z/2 aa=af*math.abs(ac.X*T.X+ac.Z*T.Z)+ag*
math.abs(ad.X*T.X+ad.Z*T.Z)+ah*math.abs(ae.X*T.X+ae.Z*T.Z)end local ab=Z.X*T.X+Z
.Z*T.Z U=math.min(U,ab-aa)V=math.max(V,ab+aa)local ac=Z.X*N.X+Z.Z*N.Z W+=ac end
local aa,ab,ac=math.max(1,(V-U)+P*2),(U+V)/2,W/#R local ad=N*ac+T*ab return ad,
aa end,function(aa,ab,ac,ad,ae,af,ag)if not ab or not ab.Parent or not aa or not
aa.Parent then return end local ah=af/2 local M=Vector3.new(ac.X+ad.X*ah,ae or
ac.Y,ac.Z+ad.Z*ah)local N=M+Vector3.new(ad.X,0,ad.Z)local O=CFrame.lookAt(M,N)aa
.CFrame=(aa.Adornee==workspace.Terrain)and O or ab.CFrame:ToObjectSpace(O)aa.
Size=Vector3.new(ag,q,af)if not aa.Visible then aa.Visible=true end end local ac
=function()if not i then return end local ac,ad,ae=false,os.clock(),L()for af,ag
in pairs(m)do local ah=af.Instance if not ah or not ah.Parent then h.
DetachTrajectoryVisuals(af)else ac=true local M,N=ag.mainPart,af.Name or(ah and
ah.Name)local O=e and e.IsChasingProjectile and e.IsChasingProjectile(N)if O
then if ag.ad and ag.ad.Visible then ag.ad.Visible=false end ag.isMoving=false
af.IsTrajectory=false elseif M and M.Parent then local P,Q=M.Position,ad-(ag.
lastClock or ad)if ag.isBossSpike then if not ag.beamFound then local R,S,T,U=A(
M)if R and S then ag.beamFound=true ag.beamLength=R ag.beamDir=S ag.beamStartPos
=T ag.beamTargetPos=U ag.dir=S end end if ag.beamDir then ag.dir=ag.beamDir end
ag.isMoving=true end if Q>=0.035 then local R=P-(ag.lastPos or P)local S,T=R.
Magnitude/Q,Vector3.new(R.X,0,R.Z)local U,V=T.Magnitude/Q,ag.isMoving==true if U
>=r then ag.isMoving=true if not ag.isBossSpike then ag.dir=T.Unit end else if
not ag.isInstant and not ag.isBossSpike and Q>=0.25 and S<r then ag.isMoving=
false end end if ag.isMoving~=V then af.IsTrajectory=ag.isMoving af.HazardZones=
nil if v and v.UpdateHazardVisualColor then pcall(v.UpdateHazardVisualColor,af,
ag.isMoving)end local W=a.load'e'if W and W.UpdateHazardVisualColor then pcall(W
.UpdateHazardVisualColor,af,ag.isMoving)end end ag.lastPos=P ag.lastClock=ad end
if ag.isMoving and ag.dir and ag.ad then local R,S=aa(af,ag.dir)if R then local
T=I(af)ab(ag.ad,M,R,ag.dir,ae,T,S)end else if ag.ad and ag.ad.Visible then ag.ad
.Visible=false end end end end end if not ac and w then w:Disconnect()w=nil end
end local ad=function()if not w and i then w=f.Heartbeat:Connect(ac)end end
function h.DetachTrajectoryVisuals(ae)if not ae then return end local af=m[ae]if
not af then return end if af.ad then pcall(function()af.ad:Destroy()end)af.ad=
nil end if af.connections then for ag,ah in ipairs(af.connections)do pcall(
function()ah:Disconnect()end)end table.clear(af.connections)end m[ae]=nil end
function h.AttachTrajectoryVisuals(ae)if not i or not ae then return end if m[ae
]then h.DetachTrajectoryVisuals(ae)end local af=ae.Instance if not af or not af.
Parent then return end local ag=ae.Name or(af and af.Name)if e and e.
IsChasingProjectile and e.IsChasingProjectile(ag)then ae.IsTrajectory=false
return end local ah if af:IsA'BasePart'then ah=af else ah=af.PrimaryPart or af:
FindFirstChildWhichIsA'BasePart'if not ah then for M,N in ipairs(af:
GetDescendants())do if N:IsA'BasePart'and N.Parent then ah=N break end end end
end if not ah or not ah.Parent then return end local M,N=I(ae),Instance.new
'BoxHandleAdornment'N.Name='HazardTrajectoryCorridor'N.Adornee=workspace.Terrain
N.Size=Vector3.new(4,q,M)N.Color3=o N.Transparency=p N.ZIndex=1 N.AlwaysOnTop=
true N.Visible=false N.Parent=workspace.Terrain local O=ae.Name or(af and af.
Name)local P,Q=t(O),z(O,af)local R=Q and(x(O,af)and'big_spike'or'seeking_spike')
or nil if Q then if not P then for S,T in pairs(m)do if T and T.isBeam and T.
spikeType==R then T.linkedSpike=ah ae.IsTrajectory=false return end end else for
S,T in pairs(m)do if T and not T.isBeam and T.spikeType==R then ae.IsTrajectory=
false return end end end end local S={}if not P then local T=ah:
GetPropertyChangedSignal'Transparency':Connect(function()if ah.Parent and ah.
Transparency>n then pcall(function()N:Destroy()end)end end)table.insert(S,T)end
local T local U=ah.AncestryChanged:Connect(function(U,V)if not V then if T and T
.linkedSpike and T.linkedSpike.Parent and T.linkedSpike.Transparency<=n then
local W=T.linkedSpike.AncestryChanged:Connect(function(W,X)if not X then pcall(
function()N:Destroy()end)end end)table.insert(S,W)return end pcall(function()N:
Destroy()end)end end)table.insert(S,U)local V,W=K(O,ah)local X,Y,Z,_,ai=(V~=nil)
if Q then Y,Z,_,ai=A(af)if Z then V=Z X=true end end T={ad=N,connections=S,
mainPart=ah,lastPos=ah.Position,lastClock=os.clock(),velocity=Vector3.zero,dir=V
,isMoving=X,isInstant=X,instantMode=W,isBossSpike=Q,isBigSpike=x(O,af),
isSeekingSpike=y(O,af),spikeType=R,isBeam=P,beamFound=Y~=nil,beamLength=Y,
beamDir=Z,beamStartPos=_ or ah.Position,beamTargetPos=ai,linkedSpike=nil}if P
and R then local aj=R=='big_spike'and'firstbossbigspike'or'seekingspike'for ak,
al in ipairs(workspace:GetChildren())do local am=al.Name:lower():gsub('%s+','')
if string.find(am,aj,1,true)and not t(am)then local an=al:IsA'BasePart'and al or
(al:FindFirstChildWhichIsA'BasePart'or(al:IsA'Model'and al.PrimaryPart))if an
then local ao=(an.Position-ah.Position).Magnitude if ao<25 then T.linkedSpike=an
break end end end end end m[ae]=T if X and V then ae.IsTrajectory=true ae.
HazardZones=nil local aj,ak,al=L(),aa(ae,V)local am=I(ae)if ak then ab(N,ah,ak,V
,aj,am,al)end if v and v.UpdateHazardVisualColor then pcall(v.
UpdateHazardVisualColor,ae,true)end local an=a.load'e'if an and an.
UpdateHazardVisualColor then pcall(an.UpdateHazardVisualColor,ae,true)end local
ao=a.load'd'if ao and ao.UpdateHazardVisualColor then pcall(ao.
UpdateHazardVisualColor,ae,true)end end ad()end function h.ClearAll()if w then w
:Disconnect()w=nil end for ae in pairs(m)do h.DetachTrajectoryVisuals(ae)end
table.clear(m)end function h.RefreshAll()h.ClearAll()if not i or not v then
return end for ae,af in pairs(v.GetActiveHazardsMap())do h.
AttachTrajectoryVisuals(af)end end function h.GetNearbyTrajectories(ae,af)af=af
or 65 local ah,ai,aj={},ae.X,ae.Z for ak,al in pairs(m)do if al.isMoving and al.
dir and al.mainPart and al.mainPart.Parent then local am,an=aa(ak,al.dir)if am
and an then local ao,M,N=I(ak),am.X,am.Z local O,P=ai-M,aj-N local Q,R=O*O+P*P,
af+ao+(an/2)if Q<=R*R then table.insert(ah,{info=ak,record=al})end end end end
return ah end function h.IsPointInAnyTrajectory(ae,af,ah)local ai,aj=ae.X,ae.Z
af=af or 0 local ak=3 if ah then for al,am in ipairs(ah)do local an,ao=am.info,
am.record if ao and ao.isMoving and ao.dir and ao.mainPart and ao.mainPart.
Parent then local M,N=aa(an,ao.dir)if M and N then local O,P=I(an),ao.dir local
Q,R,S=Vector3.new(-P.Z,0,P.X),ai-M.X,aj-M.Z local T,U,V,W,X=R*P.X+S*P.Z,R*Q.X+S*
Q.Z,N/2,-ak,O if af<=0 then if T>=W and T<=X and math.abs(U)<=V then return true
,an,P,M,N end else local Y=0 if T<W then Y=W-T elseif T>X then Y=T-X end local Z
=math.max(0,math.abs(U)-V)if(Y*Y+Z*Z)<=(af*af)then return true,an,P,M,N end end
end end end return false,nil,nil,nil,nil end for al,am in pairs(m)do if am.
isMoving and am.dir and am.mainPart and am.mainPart.Parent then local an,ao=aa(
al,am.dir)if an and ao then local M,N=I(al),am.dir local O,P,Q=Vector3.new(-N.Z,
0,N.X),ai-an.X,aj-an.Z local R,S,T,U,V=P*N.X+Q*N.Z,P*O.X+Q*O.Z,ao/2,-ak,M if af
<=0 then if R>=U and R<=V and math.abs(S)<=T then return true,al,N,an,ao end
else local W=0 if R<U then W=U-R elseif R>V then W=R-V end local X=math.max(0,
math.abs(S)-T)if(W*W+X*X)<=(af*af)then return true,al,N,an,ao end end end end
end return false,nil,nil,nil,nil end function h.SetEnabled(ae)i=ae and true or
false if i then h.RefreshAll()else h.ClearAll()end end d.OnPaddingChanged(
function()if i then h.RefreshAll()end end)c.Register(function()h.ClearAll()end)
return h