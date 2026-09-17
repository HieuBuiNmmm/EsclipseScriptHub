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
end local n={'secondbosscriclehitbox','secondbosscirclehitbox'}local o=function(
o)if not o or type(o)~='string'then return false end local p=o:lower():gsub(
'%s+','')if#p==0 then return false end for q,r in ipairs(n)do if string.find(p,r
,1,true)then return true end end return false end function b.
IsSecondBossCircleChain(p)return o(p)end local p={'movingbeam'}local q=function(
q)if not q or type(q)~='string'then return false end local r=q:lower():gsub(
'%s+','')if#r==0 then return false end for s,t in ipairs(p)do if string.find(r,t
,1,true)then return true end end return false end function b.IsMovingBeam(r)
return q(r)end local r,s={'firstbossbigspike','firstbossbeampart','bigspike'},
function(r)if not r or type(r)~='string'then return false end local s=r:lower():
gsub('%s+','')return string.find(s,'firstbossbeampart',1,true)~=nil end function
b.IsBeamTelegraph(t)return s(t)end local t=function(t)if not t or type(t)~=
'string'then return false end local u=t:lower():gsub('%s+','')if#u==0 or string.
find(u,'seekingspike',1,true)then return false end for v,w in ipairs(r)do if
string.find(u,w,1,true)then return true end end return false end function b.
IsBigSpike(u)return t(u)end local u=function()if l and l>0 then return l end
local u,v=45,i:FindFirstChild'enemyProjectiles'if not v then return u end local
w=v:FindFirstChild'largeIceSpikes'if not w then for x,y in ipairs(v:GetChildren(
))do local z=(y.Name or''):lower():gsub('%s+','')if z=='largeicespikes'then w=y
break end end end if not w then return u end local x,y=0,Vector3.zero if w:IsA
'Model'and w.PrimaryPart then y=w.PrimaryPart.Position elseif w:IsA'BasePart'
then y=w.Position end local z={}if w:IsA'BasePart'then table.insert(z,w)else for
A,B in ipairs(w:GetDescendants())do if B:IsA'BasePart'then table.insert(z,B)end
end end if#z==0 then return u end for A,B in ipairs(z)do local C=B.Size local D,
E=math.max(C.X,C.Z)/2,(Vector3.new(B.Position.X,0,B.Position.Z)-Vector3.new(y.X,
0,y.Z)).Magnitude local F=E+D if F>x then x=F end end if x>=5 then l=x return l
end return u end function b.GetLargeIceSpikesMaxRadius()return u()end local v=
function(v)if not v or type(v)~='string'then return false end local w=v:lower():
gsub('%s+','')if#w==0 then return false end for x,y in ipairs(j)do local z=y:
lower():gsub('%s+','')if#z>0 and string.find(w,z,1,true)then return true end end
return false end function b.IsForceCircle(w)return v(w)end function b.
AddForceCircleName(w)if type(w)=='string'and#w>0 then table.insert(j,w)b.
InvalidateCache()end end function b.GetForceCircleNames()return j end local w,x,
y,z=function(w)return w and w.Parent and w.Transparency<=c end,function(w,x,y)
local z,A,B,C=w.Size,y and e or d,(w and w.Name)or'',(w and w.Parent and w.
Parent.Name)or''if q(B)or q(C)then local D,E=math.max(z.X,z.Z)/2+A,math.max(2,
math.min(z.X,z.Z)/2+A)return{half=Vector3.new(D,0,E),cframe=w.CFrame,
isMovingBeam=true}end if t(B)or t(C)then local D,E=z,w:FindFirstChildWhichIsA(
'SpecialMesh',true)if E then D=Vector3.new(D.X*math.abs(E.Scale.X),D.Y*math.abs(
E.Scale.Y),D.Z*math.abs(E.Scale.Z))end local F={D.X,D.Y,D.Z}table.sort(F)local G
,H=math.clamp(F[2],6,60),math.clamp(F[3],8,80)local I,J=G/2+A,H/2+A return{half=
Vector3.new(I,0,J),cframe=w.CFrame,isBigSpike=true}end if x or(w:IsA'Part'and(w.
Shape==Enum.PartType.Ball or w.Shape==Enum.PartType.Cylinder))then return{radius
=math.max(z.X,z.Y,z.Z)/2}end local D=Vector3.new(math.max(z.X,0)/2+A,0,math.max(
z.Z,0)/2+A)return{half=D,cframe=w.CFrame}end,function(w,x,y,z)if not x then
return false end if x.expireTime and os.clock()>x.expireTime then return false
end local A,B=w.X,w.Z y=y or 0 local C=(z or x.isTrajectory)and e or d if x.
radius then local D,E=(x.part and x.part.Parent)and x.part.Position,x.
isSecondBossChain==true local F,G=(E and x.cx)or(D and D.X)or x.cx or 0,(E and x
.cz)or(D and D.Z)or x.cz or 0 local H,I,J=A-F,B-G,x.radius+C+y return(H*H+I*I)<=
(J*J)end local D=(x.part and x.part.Parent)and x.part.CFrame or x.cframe if D
then local E,F,G=D:PointToObjectSpace(w),x.half.X,x.half.Z if y<=0 then return
math.abs(E.X)<=F and math.abs(E.Z)<=G else local H,I=math.max(0,math.abs(E.X)-F)
,math.max(0,math.abs(E.Z)-G)return(H*H+I*I)<=(y*y)end end return false end,
function(w,x)local y=(x and x.CFrame)or(w:IsA'Model'and w:GetPivot())if y then
local z=y.LookVector local A=Vector3.new(-z.X,0,-z.Z)if A.Magnitude>0.05 then
return A.Unit end end local z=services.player or game:GetService'Players'.
LocalPlayer local A=z and z.Character local B=A and(A:FindFirstChild
'HumanoidRootPart'or A.PrimaryPart)if B and x then local C=Vector3.new(B.
Position.X-x.Position.X,0,B.Position.Z-x.Position.Z)if C.Magnitude>0.1 then
return C.Unit end end return Vector3.new(0,0,-1)end local A=function(A)if not A
or not A.Instance or not A.Instance.Parent then return nil end local B=A.
Instance local C=A.Name or(B and B.Name)or''local D,E=v(C),A.IsTrajectory==true
local F,G=E and e or d if m(C)then local H,I=(u())if B:IsA'BasePart'then I=w(B)
and B or nil elseif B:IsA'Model'then if B.PrimaryPart and w(B.PrimaryPart)then I
=B.PrimaryPart else for J,K in ipairs(B:GetDescendants())do if K:IsA'BasePart'
and w(K)and K.Parent then I=K break end end end end if not I then return nil end
local J=I.Position local K={radius=H,cx=J.X,cz=J.Z,part=I,isTrajectory=false,
isIceSpikes=true}return{zones={K},center=Vector3.new(J.X,0,J.Z),boundingRadius=H
+F}end if o(C)then local H if B:IsA'BasePart'then H=w(B)and B or nil elseif B:
IsA'Model'then if B.PrimaryPart and w(B.PrimaryPart)then H=B.PrimaryPart else
for I,J in ipairs(B:GetDescendants())do if J:IsA'BasePart'and w(J)and J.Parent
then H=J break end end end end if not H then return nil end local I,J,K,L,M,N,O,
P,Q,R=H.Position,z(B,H),A.SpawnClock or os.clock(),{},10,11,3,22,2.2,0.4 local S
=(M-1)*P for T=1,M do local U=(T-1)*P local V,W,X=Vector3.new(I.X,0,I.Z)+J*U,N+(
T-1)*O,K+Q+(T-1)*R table.insert(L,{radius=W,cx=V.X,cz=V.Z,part=H,expireTime=X,
isTrajectory=false,isSecondBossChain=true,circleIndex=T})end local T,U=Vector3.
new(I.X,0,I.Z)+J*(S/2),N+(M-1)*O local V,W=(S/2)+U+F,K+Q+(M-1)*R if A then A.
MaxExpireTime=W A.IsSyntheticChain=true end return{zones=L,center=T,
boundingRadius=V,maxExpireTime=W}end if q(C)then local H if B:IsA'BasePart'then
H=w(B)and B or nil elseif B:IsA'Model'then H=B.PrimaryPart or B:
FindFirstChildWhichIsA'BasePart'if not H or not w(H)then for I,J in ipairs(B:
GetDescendants())do if J:IsA'BasePart'and w(J)and J.Parent then H=J break end
end end end if not H then return nil end local I,J=H.Position,H.Size local K,L=
math.max(J.X,J.Z),math.max(3.5,math.min(J.X,J.Z))local M,N=K/2+F,L/2+F local O={
half=Vector3.new(M,0,N),cframe=H.CFrame,part=H,cx=I.X,cz=I.Z,isTrajectory=E,
isMovingBeam=true}return{zones={O},center=Vector3.new(I.X,0,I.Z),boundingRadius=
math.sqrt(M*M+N*N)}end if s(C)then return nil end if t(C)then local H if B:IsA
'BasePart'then H=w(B)and B or nil elseif B:IsA'Model'then H=B.PrimaryPart or B:
FindFirstChildWhichIsA'BasePart'if not H or not w(H)then for I,J in ipairs(B:
GetDescendants())do if J:IsA'BasePart'and w(J)and J.Parent then H=J break end
end end end if not H then return nil end local I,J,K=H.Position,H.Size,H:
FindFirstChildWhichIsA('SpecialMesh',true)if K then J=Vector3.new(J.X*math.abs(K
.Scale.X),J.Y*math.abs(K.Scale.Y),J.Z*math.abs(K.Scale.Z))end local L={J.X,J.Y,J
.Z}table.sort(L)local M,N=math.clamp(L[2],6,60),math.clamp(L[3],8,80)local O,P=M
/2+F,N/2+F local Q={half=Vector3.new(O,0,P),cframe=H.CFrame,part=H,cx=I.X,cz=I.Z
,isTrajectory=E,isBigSpike=true}return{zones={Q},center=Vector3.new(I.X,0,I.Z),
boundingRadius=math.sqrt(O*O+P*P)}end if B:IsA'BasePart'then if not w(B)then
return nil end G={B}else G={}for H,I in ipairs(B:GetDescendants())do if#G>=g
then break end if I:IsA'BasePart'and w(I)and I.Parent then G[#G+1]=I end end if#
G==0 then return nil end end local H,I,J,K,L={},math.huge,-math.huge,math.huge,-
math.huge for M,N in ipairs(G)do local O,P=N.Position,N.Size local Q=math.max(P.
X,P.Y,P.Z)/2+F I=math.min(I,O.X-Q)J=math.max(J,O.X+Q)K=math.min(K,O.Z-Q)L=math.
max(L,O.Z+Q)local R=x(N,D,E)if R then R.part=N R.isTrajectory=E H[#H+1]=R end
end if#H==0 then return nil end local M,N,O,P=(I+J)/2,(K+L)/2,(J-I)/2,(L-K)/2
return{zones=H,center=Vector3.new(M,0,N),boundingRadius=math.sqrt(O*O+P*P)}end
local B=function(B)local C=B and B.HazardZones if not C then C=A(B)if C and B
then B.HazardZones=C end end return C end function b.GetHazardZones(C)return B(C
)end function b.GetNearbyHazards(C,D)local E=h if not E then return{}end D=D or
65 local F,G,H={},C.X,C.Z for I,J in pairs(E.GetActiveHazardsMap())do local K,L=
J.Instance,B(J)if L then local M,N=L.center.X,L.center.Z if K and K.Parent then
local O=K:IsA'BasePart'and K or K.PrimaryPart or K:FindFirstChildWhichIsA
'BasePart'if O then M=O.Position.X N=O.Position.Z end end local O,P=G-M,H-N
local Q,R=O*O+P*P,D+L.boundingRadius if Q<=R*R then table.insert(F,J)end end end
return F end function b.IsPointInAnyHazard(C,D,E,F)local G=h if not G then
return false,nil,nil end E=E or 0 local H,I,J,K=math.huge,F or G.
GetActiveHazardsMap()for L,M in pairs(I)do local N=M.Instance or(typeof(L)==
'Instance'and L)if D and(D==N or(N and D.Name==N.Name))then continue end local O
=M.Name or(N and N.Name)or''if q(O)or t(O)then continue end local P=B(M)if not P
then continue end local Q,R=P.center.X,P.center.Z if N and N.Parent then local S
=N:IsA'BasePart'and N or N.PrimaryPart or N:FindFirstChildWhichIsA'BasePart'if S
then Q=S.Position.X R=S.Position.Z end end local S,T=C.X-Q,C.Z-R local U,V=S*S+T
*T,P.boundingRadius+E if U>V*V then continue end local W=M.IsTrajectory==true
for X=1,#P.zones do local Y=P.zones[X]if w(Y.part)and y(C,Y,E,W or Y.
isTrajectory)then local Z=(C-Y.part.Position).Magnitude if Z<H then H=Z J=M K=Y.
part end break end end end return K~=nil,J,K end return b end end local b,c,d=a.
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