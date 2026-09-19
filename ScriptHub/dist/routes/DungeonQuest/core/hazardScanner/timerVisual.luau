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
part end break end end end return L~=nil,K,L end return b end end local b,c,d=a.
load'a',a.load'b',a.load'c'local e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v=b.
RunService or game:GetService'RunService',game:GetService'ReplicatedStorage',b.
player,{},true,{},0.85,Color3.fromRGB(255,60,60),Color3.fromRGB(0,180,255),
Color3.fromRGB(255,140,0),Color3.fromRGB(220,90,255),'enemyProjectiles',false,{}
,{},{secondbossgreenorb=true,secondbossredorb=true,secondbossyelloworb=true}
local w=function()if q then return end q=true local w=f:FindFirstChild(p)if w
then for x,y in ipairs(w:GetChildren())do local z=(y.Name or''):lower():gsub(
'%s+','')if#z>0 then r[z]=true end end w.ChildAdded:Connect(function(x)local y=(
x.Name or''):lower():gsub('%s+','')if#y>0 then r[y]=true end end)end end
function h.IsChasingProjectile(x)if not x or type(x)~='string'then return false
end local y=x:lower():gsub('%s+','')if#y==0 then return false end if t[y]==true
then return true end for z in pairs(t)do if string.find(y,z,1,true)then return
true end end return false end function h.IsEnemyProjectile(x)w()if not x or
type(x)~='string'then return false end local y=x:lower():gsub('%s+','')if#y==0
then return false end if s[y]==true then return false end return r[y]==true end
function h.BindDetection(x)u=x or nil end function h.IsEnabled()return i end
local x=function()local x=g and g.Character if not x then return nil end local y
=x:FindFirstChild'HumanoidRootPart'or x.PrimaryPart if not y then return nil end
return y.Position.Y-2.5 end local y,z=function(y)if not y or not y.Parent then
return 2.5 end local z=x()if z then local A=z+2.5 local B,C=A-y.Position.Y,y.
Size.Y/2+1.2 return math.clamp(math.max(B,C),1.5,30)end return math.clamp(y.Size
.Y/2+1.8,2,10)end,function(y)return y and y.Parent and y.Transparency<=k end
local A,B=function(A)if not A or not A.Parent then return nil end if A:IsA
'BasePart'then if z(A)then return A end elseif A:IsA'Model'then if A.PrimaryPart
and z(A.PrimaryPart)then return A.PrimaryPart end local B=A:FindFirstChild
'HumanoidRootPart'if B and z(B)then return B end for C,D in ipairs(A:
GetDescendants())do if D:IsA'BasePart'and z(D)then return D end end else for B,C
in ipairs(A:GetDescendants())do if C:IsA'BasePart'and z(C)then return C end end
end return nil end,function(A)local B,C=A and A.IsTrajectory==true,A and A.Name
or'Hazard'local D,E=h.IsChasingProjectile(C),h.IsEnemyProjectile(C)local F=not B
or D if D then local G,H=o,'220,100,255'return'C',G,H,true elseif E then local G
,H=B and n or m,B and'255,160,50'or'0,210,255'return'P',G,H,F else local G,H=B
and n or l,B and'255,160,50'or'255,80,80'return'N',G,H,F end end local C=
function(C,D)if not C or not C.items or not D then return end local E,F,G,H=B(D)
local I,J=D.Name or'Hazard',''if H then local K=D.SpawnClock or os.clock()local
L=math.max(0,os.clock()-K)J=(
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
ClearAll()end end c.Register(function()h.ClearAll()end)return h