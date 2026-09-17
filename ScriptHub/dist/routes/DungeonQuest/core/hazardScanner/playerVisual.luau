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
part end break end end end return K~=nil,J,K end return b end function a.d()
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
()local b,c,d=a.load'a',a.load'b',a.load'c'local e,f,g,h,i,j,k,l,m,n,o,p=b.
RunService or game:GetService'RunService',b.player,{},false,{},0.85,Color3.
fromRGB(255,45,45),Color3.fromRGB(0,160,255),0.55,0.25 local q=function()local q
=f and f.Character if not q then return nil end local r=q:FindFirstChild
'HumanoidRootPart'or q.PrimaryPart if not r then return nil end return r.
Position.Y-2.5 end function g.BindDetection(r)o=r or nil end local r function g.
BindTrajectory(s)r=s or nil end function g.IsEnabled()return h end local s=
function(s,t)local u,v,w=s.ad,s.zone,s.part local x=s.anchorPart or w if not u
or not u.Parent or not x or not x.Parent then return end local y=v and(v.
isSecondBossChain or(s.hazardInfo and s.hazardInfo.IsSyntheticChain))local z=(y
and v.cx and v.cz and Vector3.new(v.cx,0,v.cz))or(w and w.Parent and w.Position)
or((v and v.cx and v.cz)and Vector3.new(v.cx,0,v.cz))if not z then return end
local A=Vector3.new(z.X,t or z.Y,z.Z)if s.isCircle then local B=CFrame.new(A)*
CFrame.Angles(math.rad(90),0,0)u.CFrame=(x==workspace.Terrain)and B or x.CFrame:
ToObjectSpace(B)else local B if v and(v.isMovingBeam or v.isBigSpike)then local
C=r and r.GetHazardDirection and r.GetHazardDirection(s.hazardInfo)if C and C.
Magnitude>0.01 then B=CFrame.lookAt(A,A+C)else local D=(w and w.Parent)and w.
CFrame or CFrame.identity local E,F,G=D:ToOrientation()B=CFrame.new(A)*CFrame.
Angles(0,F,0)end else local C=(w and w.Parent)and w.CFrame or CFrame.identity
local D,F,G=C:ToOrientation()B=CFrame.new(A)*CFrame.Angles(0,F,0)end u.CFrame=(x
==workspace.Terrain)and B or x.CFrame:ToObjectSpace(B)end end local t=function()
if not h then return end local t,u,v=false,q(),os.clock()for w,x in pairs(i)do
local y,z=w.IsSyntheticChain or(w.MaxExpireTime and v<w.MaxExpireTime),w.
Instance and w.Instance.Parent if not z and not y then g.DetachZoneVisuals(w)
else if x.items then local A={}for B,C in ipairs(x.items)do local F=C.zone if F
and F.expireTime and v>F.expireTime then if C.ad and C.ad.Parent then pcall(
function()C.ad:Destroy()end)end elseif C.ad and C.ad.Parent then table.insert(A,
C)s(C,u)end end x.items=A if#A>0 then t=true else g.DetachZoneVisuals(w)end end
end end if not t and p then p:Disconnect()p=nil end end local u=function()if not
p and h then p=e.Heartbeat:Connect(t)end end function g.DetachZoneVisuals(v)if
not v then return end local w=i[v]if not w then return end if w.adornments then
for x,y in ipairs(w.adornments)do pcall(function()y:Destroy()end)end table.
clear(w.adornments)end if w.connections then for x,y in ipairs(w.connections)do
pcall(function()y:Disconnect()end)end table.clear(w.connections)end if w.items
then table.clear(w.items)end i[v]=nil end function g.UpdateHazardVisualColor(v,w
)if not v then return end local x=i[v]if not x or not x.items then return end
local y=w==true or v.IsTrajectory==true local z,A=y and l or k,y and d.
GetTrajectoryMargin()or 0 for B,C in ipairs(x.items)do local F,G,H=C.ad,C.zone,C
.part if F and F.Parent and G and H and H.Parent then F.Color3=z if C.isCircle
and G.radius then F.Radius=G.radius+A elseif G.half then local I,J=G.half.X,G.
half.Z F.Size=Vector3.new(I*2,n,J*2)end end end end function g.AttachZoneVisuals
(v)if not h or not v then return end if i[v]then g.DetachZoneVisuals(v)end local
w=d.GetHazardZones(v)if not w or not w.zones then return end local x=v.
IsTrajectory==true local y,z,A,B,C,F,G=x and l or k,x and d.GetTrajectoryMargin(
)or 0,q(),{},{},{},workspace.Terrain for H,I in ipairs(w.zones)do local J,K,L,M=
I.part,I.isSecondBossChain==true,I.isMovingBeam==true,I.isBigSpike==true local N
=(K or L or M)and G or J if K or L or M or(J and J.Parent and J.Transparency<=j)
then local O,P=false if I.radius then O=true local Q=Instance.new
'CylinderHandleAdornment'Q.Name='HazardGroundCircle'Q.Adornee=N Q.Radius=I.
radius+z Q.Height=n Q.Color3=y Q.Transparency=m Q.ZIndex=2 Q.AlwaysOnTop=true Q.
Parent=N P=Q elseif I.half and I.cframe then local Q=Instance.new
'BoxHandleAdornment'Q.Name='HazardGroundBox'Q.Adornee=N Q.Size=Vector3.new(I.
half.X*2,n,I.half.Z*2)Q.Color3=y Q.Transparency=m Q.ZIndex=2 Q.AlwaysOnTop=true
Q.Parent=N P=Q end if P then local Q={ad=P,part=J,anchorPart=N,isCircle=O,zone=I
,hazardInfo=v}s(Q,A)table.insert(B,Q)table.insert(C,P)if(not K and not L)and J
then local R=J:GetPropertyChangedSignal'Transparency':Connect(function()if J.
Parent and J.Transparency>j then pcall(function()P:Destroy()end)end end)table.
insert(F,R)end end end end if#C>0 then i[v]={items=B,adornments=C,connections=F}
u()end end function g.ClearAll()if p then p:Disconnect()p=nil end for v in
pairs(i)do g.DetachZoneVisuals(v)end table.clear(i)end function g.RefreshAll()g.
ClearAll()if not h or not o then return end for v,w in pairs(o.
GetActiveHazardsMap())do g.AttachZoneVisuals(w)end end function g.SetEnabled(v)h
=v and true or false if h then g.RefreshAll()else g.ClearAll()end end d.
OnPaddingChanged(function()if h then g.RefreshAll()end end)c.Register(function()
g.ClearAll()end)return g end function a.f()local b,c,d,e=a.load'a',a.load'b',a.
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
Position or(z:IsA'Model'and z:GetPivot().Position)if C then local F,G=35,x(z.
Name,z)and'big_spike'or'seeking_spike'for H,I in ipairs(workspace:GetChildren())
do local J=I.Name:lower()if t(J)or string.find(J,'beampart',1,true)then if u(I)
==G then local K=I:IsA'BasePart'and I.Position or(I:IsA'Model'and I:GetPivot().
Position)if K then local L=(K-C).Magnitude if L<F then F=L B=I end end end end
end end end if not B then return nil,nil,nil,nil end local C=B:FindFirstChild(
'Attachment2',true)if not C or not C:IsA'Attachment'then for F,G in ipairs(B:
GetDescendants())do if G:IsA'Attachment'and G.Name~='Attachment0'and G.Name~=
'Attachment1'then C=G break end end end local F,G=B.Position,C and C.
WorldPosition if G and F then local H=G-F local I=Vector3.new(H.X,0,H.Z)local J=
I.Magnitude if J>5 then local K=I.Unit return J,K,F,G end end return nil,nil,nil
,nil end local B=function(B)if not B then return nil end local C,F,G,H=0,0,0,{}
if B:IsA'BasePart'then table.insert(H,B)else for I,J in ipairs(B:GetDescendants(
))do if J:IsA'BasePart'then table.insert(H,J)end end end for I,J in ipairs(H)do
local K,L=J.Size,J:FindFirstChildWhichIsA('SpecialMesh',true)if L then K=Vector3
.new(K.X*math.abs(L.Scale.X),K.Y*math.abs(L.Scale.Y),K.Z*math.abs(L.Scale.Z))end
C=math.max(C,K.X)F=math.max(F,K.Y)G=math.max(G,K.Z)end if C<=0 and F<=0 and G<=0
then return nil end local I={C,F,G}table.sort(I)local J=I[2]if J<2 then J=math.
max(I[1],I[2])end return J end local C,F=function(C)if l.firstbossbigspike then
return l.firstbossbigspike end if cachedBigSpikeWidth then return
cachedBigSpikeWidth end if C and not t(C.Name)then local F=B(C)if F and F>=4
then cachedBigSpikeWidth=math.clamp(F,8,60)return cachedBigSpikeWidth end end
for F,G in ipairs(workspace:GetChildren())do local H=G.Name:lower()if string.
find(H,'firstbossbigspike',1,true)or(string.find(H,'bigspike',1,true)and not
string.find(H,'seekingspike',1,true)and not t(H))then local I=B(G)if I and I>=4
then cachedBigSpikeWidth=math.clamp(I,8,60)return cachedBigSpikeWidth end end
end local F=game:GetService'ReplicatedStorage'local G=F:FindFirstChild
'enemyProjectiles'local H=G and G:FindFirstChild'firstBossBigSpike'if H then
local I=B(H)if I and I>=4 then cachedBigSpikeWidth=math.clamp(I,8,60)return
cachedBigSpikeWidth end end return 28 end local G=function(G)if l.
firstbossseekingspikes then return l.firstbossseekingspikes end if F then return
F end if G and not t(G.Name)then local H=B(G)if H and H>=2 then F=math.clamp(H,4
,40)return F end end for H,I in ipairs(workspace:GetChildren())do local J=I.Name
:lower():gsub('%s+','')if string.find(J,'seekingspike',1,true)and not t(J)then
local K=B(I)if K and K>=2 then F=math.clamp(K,4,40)return F end end end local H=
game:GetService'ReplicatedStorage'local I=H:FindFirstChild'enemyProjectiles'
local J=I and I:FindFirstChild'firstBossSeekingSpikes'if J then local K=B(J)if K
and K>=2 then F=math.clamp(K,4,40)return F end end return 10 end local H,I,J=
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
GetFirstBossSeekingSpikeWidth()return l.firstbossseekingspikes or(F or 10)end
function h.SetFirstBossSeekingSpikeWidth(M)if type(M)=='number'and M>0 then l.
firstbossseekingspikes=math.clamp(M,4,40)else l.firstbossseekingspikes=nil end F
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
return h end function a.g()local aa={Options={},Folder='Maclib',contextData={},
GetService=function(aa)return cloneref and cloneref(game:GetService(aa))or game:
GetService(aa)end}local ab,ac,ad,ae,af,ah,ai=aa.GetService'TweenService',aa.
GetService'RunService',aa.GetService'HttpService',aa.GetService'ContentProvider'
,aa.GetService'UserInputService',aa.GetService'Lighting',aa.GetService'Players'
local aj,ak,al,am,an,ao,b,c,d,e,f=ac:IsStudio(),ai.LocalPlayer,{},0,false,{
interFont='rbxassetid://12187365364',userInfoBlurred='rbxassetid://18824089198',
toggleBackground='rbxassetid://18772190202',togglerHead=
'rbxassetid://18772309008',buttonImage='rbxassetid://10709791437',searchIcon=
'rbxassetid://86737463322606',colorWheel='rbxassetid://2849458409',colorTarget=
'rbxassetid://73265255323268',grid='rbxassetid://121484455191370',globe=
'rbxassetid://108952102602834',transform='rbxassetid://90336395745819',dropdown=
'rbxassetid://18865373378',sliderbar='rbxassetid://18772615246',sliderhead=
'rbxassetid://18772834246'},function()pcall(function()local aj=setthreadidentity
or set_thread_identity or setidentity or(syn and syn.set_thread_identity)if aj
then local ak=pcall(aj,7)if not ak then pcall(aj,8)end end end)end aa.Elevate=b
local g,h=function()b()local g=Instance.new'ScreenGui'g.ScreenInsets=Enum.
ScreenInsets.None g.ResetOnSpawn=false g.ZIndexBehavior=Enum.ZIndexBehavior.
Sibling g.DisplayOrder=2147483647 local h=ac:IsStudio()and ak:FindFirstChild
'PlayerGui'or(gethui and gethui())or(cloneref and cloneref(aa.GetService
'CoreGui')or aa.GetService'CoreGui')g.Parent=h return g end,function(g,h,i)b()
local j,k=pcall(ab.Create,ab,g,h,i)if j and k then return k end if i and typeof(
g)=='Instance'then for l,m in pairs(i)do pcall(function()g[l]=m end)end end
return{Play=function()end,Cancel=function()end,Pause=function()end,Completed={
Wait=function()end}}end function aa:Window(i)local j={Settings=i}if i.
AcrylicBlur~=nil then d=i.AcrylicBlur else d=true end local k,l=g(),Instance.new
'Frame'l.Name='Notifications'l.BackgroundColor3=Color3.fromRGB(255,255,255)l.
BackgroundTransparency=1 l.BorderColor3=Color3.fromRGB(0,0,0)l.BorderSizePixel=0
l.Size=UDim2.fromScale(1,1)l.Parent=k l.ZIndex=2 local m=Instance.new
'UIListLayout'm.Name='NotificationsUIListLayout'm.Padding=UDim.new(0,10)m.
HorizontalAlignment=Enum.HorizontalAlignment.Right m.SortOrder=Enum.SortOrder.
LayoutOrder m.VerticalAlignment=Enum.VerticalAlignment.Bottom m.Parent=l local n
=Instance.new'UIPadding'n.Name='NotificationsUIPadding'n.PaddingBottom=UDim.new(
0,10)n.PaddingLeft=UDim.new(0,10)n.PaddingRight=UDim.new(0,10)n.PaddingTop=UDim.
new(0,10)n.Parent=l local o=Instance.new'Frame'o.Name='Base'o.AnchorPoint=
Vector2.new(0.5,0.5)o.BackgroundColor3=Color3.fromRGB(15,15,15)o.
BackgroundTransparency=i.AcrylicBlur and 0.05 or 0 o.BorderColor3=Color3.
fromRGB(0,0,0)o.BorderSizePixel=0 o.Position=UDim2.fromScale(0.5,0.5)o.Size=i.
Size or UDim2.fromOffset(868,650)local p=Instance.new'UIScale'p.Name=
'BaseUIScale'p.Parent=o local q=Instance.new'UICorner'q.Name='BaseUICorner'q.
CornerRadius=UDim.new(0,10)q.Parent=o local r=Instance.new'UIStroke'r.Name=
'BaseUIStroke'r.ApplyStrokeMode=Enum.ApplyStrokeMode.Border r.Color=Color3.
fromRGB(255,255,255)r.Transparency=0.9 r.Parent=o local s=Instance.new'Frame's.
Name='Sidebar's.BackgroundColor3=Color3.fromRGB(255,255,255)s.
BackgroundTransparency=1 s.BorderColor3=Color3.fromRGB(0,0,0)s.BorderSizePixel=0
s.Position=UDim2.fromScale(-3.5199999999999996E-8,4.69e-8)s.Size=i.SidebarWidth
and UDim2.new(0,i.SidebarWidth,1,0)or UDim2.fromScale(0.325,1)local t=Instance.
new'Frame't.Name='Divider't.AnchorPoint=Vector2.new(1,0)t.BackgroundColor3=
Color3.fromRGB(255,255,255)t.BackgroundTransparency=0.9 t.BorderColor3=Color3.
fromRGB(0,0,0)t.BorderSizePixel=0 t.Position=UDim2.fromScale(1,0)t.Size=UDim2.
new(0,1,1,0)t.Parent=s local u=Instance.new'TextButton'u.Name='DividerInteract'u
.AnchorPoint=Vector2.new(0.5,0)u.BackgroundColor3=Color3.fromRGB(255,255,255)u.
BackgroundTransparency=1 u.BorderColor3=Color3.fromRGB(0,0,0)u.BorderSizePixel=0
u.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'u.Position=
UDim2.fromScale(0.5,0)u.Size=UDim2.new(1,6,1,0)u.Text=''u.TextColor3=Color3.
fromRGB(0,0,0)u.TextSize=14 u.Parent=t local v=Instance.new'Frame'v.Name=
'WindowControls'v.BackgroundColor3=Color3.fromRGB(255,255,255)v.
BackgroundTransparency=1 v.BorderColor3=Color3.fromRGB(0,0,0)v.BorderSizePixel=0
v.Size=UDim2.new(1,0,0,31)local w=Instance.new'Frame'w.Name='Controls'w.
BackgroundColor3=Color3.fromRGB(119,174,94)w.BackgroundTransparency=1 w.
BorderColor3=Color3.fromRGB(0,0,0)w.BorderSizePixel=0 w.Size=UDim2.fromScale(1,1
)local x=Instance.new'UIListLayout'x.Name='UIListLayout'x.Padding=UDim.new(0,5)x
.FillDirection=Enum.FillDirection.Horizontal x.SortOrder=Enum.SortOrder.
LayoutOrder x.VerticalAlignment=Enum.VerticalAlignment.Center x.Parent=w local y
=Instance.new'UIPadding'y.Name='UIPadding'y.PaddingLeft=UDim.new(0,11)y.Parent=w
local z,A={sizes={enabled=UDim2.fromOffset(8,8),disabled=UDim2.fromOffset(7,7)},
transparencies={enabled=0,disabled=1},strokeTransparency=0.9},Instance.new
'UIStroke'A.Name='BaseUIStroke'A.ApplyStrokeMode=Enum.ApplyStrokeMode.Border A.
Color=Color3.fromRGB(255,255,255)A.Transparency=z.strokeTransparency local B=
Instance.new'TextButton'B.Name='Exit'B.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'B.Text=''B.TextColor3=Color3.
fromRGB(0,0,0)B.TextSize=14 B.AutoButtonColor=false B.BackgroundColor3=Color3.
fromRGB(250,93,86)B.BorderColor3=Color3.fromRGB(0,0,0)B.BorderSizePixel=0 local
C=Instance.new'UICorner'C.Name='UICorner'C.CornerRadius=UDim.new(1,0)C.Parent=B
B.Parent=w local F=Instance.new'TextButton'F.Name='Minimize'F.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'F.Text=''F.TextColor3=Color3.
fromRGB(0,0,0)F.TextSize=14 F.AutoButtonColor=false F.BackgroundColor3=Color3.
fromRGB(252,190,57)F.BorderColor3=Color3.fromRGB(0,0,0)F.BorderSizePixel=0 F.
LayoutOrder=1 local G=Instance.new'UICorner'G.Name='UICorner'G.CornerRadius=UDim
.new(1,0)G.Parent=F F.Parent=w local H=Instance.new'TextButton'H.Name='Maximize'
H.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'H.Text=''H.
TextColor3=Color3.fromRGB(0,0,0)H.TextSize=14 H.AutoButtonColor=false H.
BackgroundColor3=Color3.fromRGB(119,174,94)H.BorderColor3=Color3.fromRGB(0,0,0)H
.BorderSizePixel=0 H.LayoutOrder=1 local I=Instance.new'UICorner'I.Name=
'UICorner'I.CornerRadius=UDim.new(1,0)I.Parent=H H.Parent=w local J=function(J,K
)local L,M=K and z.sizes.enabled or z.sizes.disabled,K and z.transparencies.
enabled or z.transparencies.disabled J.Size=L J.BackgroundTransparency=M J.
Active=K J.Interactable=K for N,O in ipairs(J:GetChildren())do if O:IsA
'UIStroke'then O.Transparency=M end end if not K then A:Clone().Parent=J end end
J(H,false)local K={B,F}for L,M in pairs(K)do local N,O=M.Name,true if i.
DisabledWindowControls and table.find(i.DisabledWindowControls,N)then O=false
end J(M,O)end w.Parent=v local L=Instance.new'Frame'L.Name='Divider'L.
AnchorPoint=Vector2.new(0,1)L.BackgroundColor3=Color3.fromRGB(255,255,255)L.
BackgroundTransparency=0.9 L.BorderColor3=Color3.fromRGB(0,0,0)L.BorderSizePixel
=0 L.Position=UDim2.fromScale(0,1)L.Size=UDim2.new(1,0,0,1)L.Parent=v v.Parent=s
local M=Instance.new'Frame'M.Name='Information'M.BackgroundColor3=Color3.
fromRGB(255,255,255)M.BackgroundTransparency=1 M.BorderColor3=Color3.fromRGB(0,0
,0)M.BorderSizePixel=0 M.Position=UDim2.fromOffset(0,31)M.Size=UDim2.new(1,0,0,
60)local N=Instance.new'Frame'N.Name='Divider'N.AnchorPoint=Vector2.new(0,1)N.
BackgroundColor3=Color3.fromRGB(255,255,255)N.BackgroundTransparency=0.9 N.
BorderColor3=Color3.fromRGB(0,0,0)N.BorderSizePixel=0 N.Position=UDim2.
fromScale(0,1)N.Size=UDim2.new(1,0,0,1)N.Parent=M local O=Instance.new'Frame'O.
Name='InformationHolder'O.BackgroundColor3=Color3.fromRGB(255,255,255)O.
BackgroundTransparency=1 O.BorderColor3=Color3.fromRGB(0,0,0)O.BorderSizePixel=0
O.Size=UDim2.fromScale(1,1)local P=Instance.new'UIPadding'P.Name=
'InformationHolderUIPadding'P.PaddingBottom=UDim.new(0,10)P.PaddingLeft=UDim.
new(0,23)P.PaddingRight=UDim.new(0,22)P.PaddingTop=UDim.new(0,10)P.Parent=O
local Q=Instance.new'ImageButton'Q.Name='GlobalSettingsButton'Q.Image=ao.globe Q
.ImageTransparency=0.5 Q.AnchorPoint=Vector2.new(1,0.5)Q.BackgroundColor3=Color3
.fromRGB(255,255,255)Q.BackgroundTransparency=1 Q.BorderColor3=Color3.fromRGB(0,
0,0)Q.BorderSizePixel=0 Q.Position=UDim2.fromScale(1,0.5)Q.Size=UDim2.
fromOffset(16,16)Q.Parent=O local R=function(R)if R=='Default'then h(Q,TweenInfo
.new(0.2,Enum.EasingStyle.Sine),{ImageTransparency=0.5}):Play()elseif R=='Hover'
then h(Q,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{ImageTransparency=0.3}):Play(
)end end Q.MouseEnter:Connect(function()R'Hover'end)Q.MouseLeave:Connect(
function()R'Default'end)local S=Instance.new'Frame'S.Name='TitleFrame'S.
BackgroundColor3=Color3.fromRGB(255,255,255)S.BackgroundTransparency=1 S.
BorderColor3=Color3.fromRGB(0,0,0)S.BorderSizePixel=0 S.Size=UDim2.fromScale(1,1
)local T=Instance.new'TextLabel'T.Name='Title'T.FontFace=Font.new(ao.interFont,
Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)T.Text=i.Title T.TextColor3=
Color3.fromRGB(255,255,255)T.RichText=true T.TextSize=18 T.TextTransparency=0.1
T.TextTruncate=Enum.TextTruncate.SplitWord T.TextXAlignment=Enum.TextXAlignment.
Left T.TextYAlignment=Enum.TextYAlignment.Top T.AutomaticSize=Enum.AutomaticSize
.Y T.BackgroundColor3=Color3.fromRGB(255,255,255)T.BackgroundTransparency=1 T.
BorderColor3=Color3.fromRGB(0,0,0)T.BorderSizePixel=0 T.Size=UDim2.new(1,-20,0,0
)T.Parent=S local U=Instance.new'TextLabel'U.Name='Subtitle'U.FontFace=Font.new(
ao.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)U.RichText=true U.Text
=i.Subtitle U.RichText=true U.TextColor3=Color3.fromRGB(255,255,255)U.TextSize=
12 U.TextTransparency=0.7 U.TextTruncate=Enum.TextTruncate.SplitWord U.
TextXAlignment=Enum.TextXAlignment.Left U.TextYAlignment=Enum.TextYAlignment.Top
U.AutomaticSize=Enum.AutomaticSize.Y U.BackgroundColor3=Color3.fromRGB(255,255,
255)U.BackgroundTransparency=1 U.BorderColor3=Color3.fromRGB(0,0,0)U.
BorderSizePixel=0 U.LayoutOrder=1 U.Size=UDim2.new(1,-20,0,0)U.Parent=S local V=
Instance.new'UIListLayout'V.Name='TitleFrameUIListLayout'V.Padding=UDim.new(0,3)
V.SortOrder=Enum.SortOrder.LayoutOrder V.VerticalAlignment=Enum.
VerticalAlignment.Center V.Parent=S S.Parent=O O.Parent=M M.Parent=s local W=
Instance.new'Frame'W.Name='SidebarGroup'W.BackgroundColor3=Color3.fromRGB(255,
255,255)W.BackgroundTransparency=1 W.BorderColor3=Color3.fromRGB(0,0,0)W.
BorderSizePixel=0 W.Position=UDim2.fromOffset(0,91)W.Size=UDim2.new(1,0,1,-91)
local X=Instance.new'Frame'X.Name='UserInfo'X.AnchorPoint=Vector2.new(0,1)X.
BackgroundColor3=Color3.fromRGB(255,255,255)X.BackgroundTransparency=1 X.
BorderColor3=Color3.fromRGB(0,0,0)X.BorderSizePixel=0 X.Position=UDim2.
fromScale(0,1)X.Size=UDim2.new(1,0,0,107)local Y=Instance.new'Frame'Y.Name=
'InformationGroup'Y.BackgroundColor3=Color3.fromRGB(255,255,255)Y.
BackgroundTransparency=1 Y.BorderColor3=Color3.fromRGB(0,0,0)Y.BorderSizePixel=0
Y.Size=UDim2.fromScale(1,1)local Z=Instance.new'UIPadding'Z.Name=
'InformationGroupUIPadding'Z.PaddingBottom=UDim.new(0,17)Z.PaddingLeft=UDim.new(
0,25)Z.Parent=Y local _=Instance.new'UIListLayout'_.Name=
'InformationGroupUIListLayout'_.FillDirection=Enum.FillDirection.Horizontal _.
SortOrder=Enum.SortOrder.LayoutOrder _.VerticalAlignment=Enum.VerticalAlignment.
Center _.Parent=Y local ap,aq,ar=ak.UserId,Enum.ThumbnailType.AvatarBust,Enum.
ThumbnailSize.Size48x48 local as,at=ai:GetUserThumbnailAsync(ap,aq,ar)local au=
Instance.new'ImageLabel'au.Name='Headshot'au.BackgroundColor3=Color3.fromRGB(255
,255,255)au.BackgroundTransparency=1 au.BorderColor3=Color3.fromRGB(0,0,0)au.
BorderSizePixel=0 au.Size=UDim2.fromOffset(32,32)au.Image=(at and as)or
'rbxassetid://0'local av=Instance.new'UICorner'av.Name='UICorner'av.CornerRadius
=UDim.new(1,0)av.Parent=au local aw=Instance.new'UIStroke'aw.Name='BaseUIStroke'
aw.ApplyStrokeMode=Enum.ApplyStrokeMode.Border aw.Color=Color3.fromRGB(255,255,
255)aw.Transparency=0.9 aw.Parent=au au.Parent=Y local ax=Instance.new'Frame'ax.
Name='UserAndDisplayFrame'ax.BackgroundColor3=Color3.fromRGB(255,255,255)ax.
BackgroundTransparency=1 ax.BorderColor3=Color3.fromRGB(0,0,0)ax.BorderSizePixel
=0 ax.LayoutOrder=1 ax.Size=UDim2.new(1,-42,0,32)local ay=Instance.new
'TextLabel'ay.Name='DisplayName'ay.FontFace=Font.new(ao.interFont,Enum.
FontWeight.SemiBold,Enum.FontStyle.Normal)ay.Text=ak.DisplayName ay.TextColor3=
Color3.fromRGB(255,255,255)ay.TextSize=13 ay.TextTransparency=0.1 ay.
TextTruncate=Enum.TextTruncate.SplitWord ay.TextXAlignment=Enum.TextXAlignment.
Left ay.TextYAlignment=Enum.TextYAlignment.Top ay.AutomaticSize=Enum.
AutomaticSize.XY ay.BackgroundColor3=Color3.fromRGB(255,255,255)ay.
BackgroundTransparency=1 ay.BorderColor3=Color3.fromRGB(0,0,0)ay.BorderSizePixel
=0 ay.Parent=ax ay.Size=UDim2.fromScale(1,0)local az=Instance.new'UIPadding'az.
Name='UserAndDisplayFrameUIPadding'az.PaddingLeft=UDim.new(0,8)az.PaddingTop=
UDim.new(0,3)az.Parent=ax local aA=Instance.new'UIListLayout'aA.Name=
'UserAndDisplayFrameUIListLayout'aA.Padding=UDim.new(0,1)aA.SortOrder=Enum.
SortOrder.LayoutOrder aA.Parent=ax local aB=Instance.new'TextLabel'aB.Name=
'Username'aB.FontFace=Font.new(ao.interFont,Enum.FontWeight.SemiBold,Enum.
FontStyle.Normal)aB.Text='@'..ak.Name aB.TextColor3=Color3.fromRGB(255,255,255)
aB.TextSize=12 aB.TextTransparency=0.7 aB.TextTruncate=Enum.TextTruncate.
SplitWord aB.TextXAlignment=Enum.TextXAlignment.Left aB.TextYAlignment=Enum.
TextYAlignment.Top aB.AutomaticSize=Enum.AutomaticSize.XY aB.BackgroundColor3=
Color3.fromRGB(255,255,255)aB.BackgroundTransparency=1 aB.BorderColor3=Color3.
fromRGB(0,0,0)aB.BorderSizePixel=0 aB.LayoutOrder=1 aB.Parent=ax aB.Size=UDim2.
fromScale(1,0)ax.Parent=Y Y.Parent=X local aC=Instance.new'UIPadding'aC.Name=
'UserInfoUIPadding'aC.PaddingLeft=UDim.new(0,10)aC.PaddingRight=UDim.new(0,10)aC
.Parent=X X.Parent=W local aD=Instance.new'UIPadding'aD.Name=
'SidebarGroupUIPadding'aD.PaddingLeft=UDim.new(0,10)aD.PaddingRight=UDim.new(0,
10)aD.PaddingTop=UDim.new(0,31)aD.Parent=W local aE=Instance.new'Frame'aE.Name=
'TabSwitchers'aE.BackgroundColor3=Color3.fromRGB(255,255,255)aE.
BackgroundTransparency=1 aE.BorderColor3=Color3.fromRGB(0,0,0)aE.BorderSizePixel
=0 aE.Size=UDim2.new(1,0,1,-107)local aF=Instance.new'ScrollingFrame'aF.Name=
'TabSwitchersScrollingFrame'aF.AutomaticCanvasSize=Enum.AutomaticSize.Y aF.
BottomImage=''aF.CanvasSize=UDim2.new()aF.ScrollBarImageTransparency=0.8 aF.
ScrollBarThickness=1 aF.TopImage=''aF.BackgroundColor3=Color3.fromRGB(255,255,
255)aF.BackgroundTransparency=1 aF.BorderColor3=Color3.fromRGB(0,0,0)aF.
BorderSizePixel=0 aF.Size=UDim2.fromScale(1,1)local aG=Instance.new
'UIListLayout'aG.Name='TabSwitchersScrollingFrameUIListLayout'aG.Padding=UDim.
new(0,17)aG.SortOrder=Enum.SortOrder.LayoutOrder aG.Parent=aF local aH=Instance.
new'UIPadding'aH.Name='TabSwitchersScrollingFrameUIPadding'aH.PaddingTop=UDim.
new(0,2)aH.Parent=aF aF.Parent=aE aE.Parent=W W.Parent=s s.Parent=o local aI=
Instance.new'Frame'aI.Name='Content'aI.AnchorPoint=Vector2.new(1,0)aI.
BackgroundColor3=Color3.fromRGB(255,255,255)aI.BackgroundTransparency=1 aI.
BorderColor3=Color3.fromRGB(0,0,0)aI.BorderSizePixel=0 aI.Position=UDim2.
fromScale(1,4.69e-8)aI.Size=UDim2.new(0,(o.AbsoluteSize.X-s.AbsoluteSize.X),1,0)
local aJ,aK,aL,aM,aN,aO=false,s.AbsoluteSize.X,20,107 local aP,aQ=o.AbsoluteSize
.X-aM,{DefaultTransparency=0.9,HoverTransparency=0.85,EasingStyle=Enum.
EasingStyle.Sine}local aR=function(aR)h(t,TweenInfo.new(0.2,aQ.EasingStyle),{
BackgroundTransparency=aR=='Idle'and aQ.DefaultTransparency or aQ.
HoverTransparency}):Play()end u.MouseEnter:Connect(function()aR'Hover'end)u.
MouseLeave:Connect(function()aR'Idle'end)u.MouseButton1Down:Connect(function()aJ
=true aN=af:GetMouseLocation().X aO=s.AbsoluteSize.X end)af.InputEnded:Connect(
function(aS)if aS.UserInputType==Enum.UserInputType.MouseButton1 then aJ=false
end end)af.InputChanged:Connect(function(aS)if aJ and aS.UserInputType==Enum.
UserInputType.MouseMovement then local aT=af:GetMouseLocation().X-aN local aU=aO
+aT if math.abs(aU-aK)<aL then aU=aK else aU=math.clamp(aU,aM,aP)end s.Size=
UDim2.new(0,aU,1,0)aI.Size=UDim2.new(0,o.AbsoluteSize.X-aU,1,0)end end)local aS=
Instance.new'Frame'aS.Name='Topbar'aS.BackgroundColor3=Color3.fromRGB(255,255,
255)aS.BackgroundTransparency=1 aS.BorderColor3=Color3.fromRGB(0,0,0)aS.
BorderSizePixel=0 aS.Size=UDim2.new(1,0,0,63)local aT=Instance.new'Frame'aT.Name
='Divider'aT.AnchorPoint=Vector2.new(0,1)aT.BackgroundColor3=Color3.fromRGB(255,
255,255)aT.BackgroundTransparency=0.9 aT.BorderColor3=Color3.fromRGB(0,0,0)aT.
BorderSizePixel=0 aT.Position=UDim2.fromScale(0,1)aT.Size=UDim2.new(1,0,0,1)aT.
Parent=aS local aU=Instance.new'Frame'aU.Name='Elements'aU.BackgroundColor3=
Color3.fromRGB(255,255,255)aU.BackgroundTransparency=1 aU.BorderColor3=Color3.
fromRGB(0,0,0)aU.BorderSizePixel=0 aU.Size=UDim2.fromScale(1,1)local aV=Instance
.new'UIPadding'aV.Name='UIPadding'aV.PaddingLeft=UDim.new(0,20)aV.PaddingRight=
UDim.new(0,20)aV.Parent=aU local aW=Instance.new'ImageButton'aW.Name='MoveIcon'
aW.Image=ao.transform aW.ImageTransparency=0.7 aW.AnchorPoint=Vector2.new(1,0.5)
aW.BackgroundColor3=Color3.fromRGB(255,255,255)aW.BackgroundTransparency=1 aW.
BorderColor3=Color3.fromRGB(0,0,0)aW.BorderSizePixel=0 aW.Position=UDim2.
fromScale(1,0.5)aW.Size=UDim2.fromOffset(15,15)aW.Parent=aU aW.Visible=not i.
DragStyle or i.DragStyle==1 local aX=Instance.new'TextButton'aX.Name='Interact'
aX.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'aX.Text=''aX.
TextColor3=Color3.fromRGB(0,0,0)aX.TextSize=14 aX.AnchorPoint=Vector2.new(0.5,
0.5)aX.BackgroundColor3=Color3.fromRGB(255,255,255)aX.BackgroundTransparency=1
aX.BorderColor3=Color3.fromRGB(0,0,0)aX.BorderSizePixel=0 aX.Position=UDim2.
fromScale(0.5,0.5)aX.Size=UDim2.fromOffset(40,40)aX.Parent=aW local aY=function(
aY)if aY=='Default'then h(aW,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
ImageTransparency=0.7}):Play()elseif aY=='Hover'then h(aW,TweenInfo.new(0.2,Enum
.EasingStyle.Sine),{ImageTransparency=0.4}):Play()end end aX.MouseEnter:Connect(
function()aY'Hover'end)aX.MouseLeave:Connect(function()aY'Default'end)local aZ,
a_,a0,a1=false local a2,a3,a4=function(a2)local a3=a2.Position-a0 o.Position=
UDim2.new(a1.X.Scale,a1.X.Offset+a3.X,a1.Y.Scale,a1.Y.Offset+a3.Y)end,function(
a2)if a2.UserInputType==Enum.UserInputType.MouseButton1 or a2.UserInputType==
Enum.UserInputType.Touch then aZ=true a0=a2.Position a1=o.Position a2.Changed:
Connect(function()if a2.UserInputState==Enum.UserInputState.End then aZ=false
end end)end end,function(a2)if aZ and(a2.UserInputType==Enum.UserInputType.
MouseMovement or a2.UserInputType==Enum.UserInputType.Touch)then a_=a2 end end
if not i.DragStyle or i.DragStyle==1 then aX.InputBegan:Connect(function(a5)if
a5.UserInputType==Enum.UserInputType.MouseButton1 or a5.UserInputType==Enum.
UserInputType.Touch then a3(a5)end end)aX.InputChanged:Connect(a4)af.
InputChanged:Connect(function(a5)if a5==a_ and aZ then a2(a5)end end)aX.
InputEnded:Connect(function(a5)if a5.UserInputType==Enum.UserInputType.
MouseButton1 or a5.UserInputType==Enum.UserInputType.Touch then aZ=false end end
)elseif i.DragStyle==2 then o.InputBegan:Connect(function(a5)if a5.UserInputType
==Enum.UserInputType.MouseButton1 or a5.UserInputType==Enum.UserInputType.Touch
then a3(a5)end end)o.InputChanged:Connect(a4)af.InputChanged:Connect(function(a5
)if a5==a_ and aZ then a2(a5)end end)o.InputEnded:Connect(function(a5)if a5.
UserInputType==Enum.UserInputType.MouseButton1 or a5.UserInputType==Enum.
UserInputType.Touch then aZ=false end end)end local a5=Instance.new'TextLabel'a5
.Name='CurrentTab'a5.FontFace=Font.new(ao.interFont)a5.RichText=true a5.Text=''
a5.RichText=true a5.TextColor3=Color3.fromRGB(255,255,255)a5.TextSize=15 a5.
TextTransparency=0.5 a5.TextTruncate=Enum.TextTruncate.SplitWord a5.
TextXAlignment=Enum.TextXAlignment.Left a5.TextYAlignment=Enum.TextYAlignment.
Top a5.AnchorPoint=Vector2.new(0,0.5)a5.AutomaticSize=Enum.AutomaticSize.Y a5.
BackgroundColor3=Color3.fromRGB(255,255,255)a5.BackgroundTransparency=1 a5.
BorderColor3=Color3.fromRGB(0,0,0)a5.BorderSizePixel=0 a5.Position=UDim2.
fromScale(0,0.5)a5.Size=UDim2.fromScale(0.9,0)a5.Parent=aU aU.Parent=aS aS.
Parent=aI aI.Parent=o local a6=Instance.new'Frame'a6.Name='GlobalSettings'a6.
AutomaticSize=Enum.AutomaticSize.XY a6.BackgroundColor3=Color3.fromRGB(15,15,15)
a6.BorderColor3=Color3.fromRGB(0,0,0)a6.BorderSizePixel=0 a6.Position=UDim2.
fromScale(0.298,0.104)local a7=Instance.new'UIStroke'a7.Name=
'GlobalSettingsUIStroke'a7.ApplyStrokeMode=Enum.ApplyStrokeMode.Border a7.Color=
Color3.fromRGB(255,255,255)a7.Transparency=0.9 a7.Parent=a6 local a8=Instance.
new'UICorner'a8.Name='GlobalSettingsUICorner'a8.CornerRadius=UDim.new(0,10)a8.
Parent=a6 local a9=Instance.new'UIPadding'a9.Name='GlobalSettingsUIPadding'a9.
PaddingBottom=UDim.new(0,10)a9.PaddingTop=UDim.new(0,10)a9.Parent=a6 local ba=
Instance.new'UIListLayout'ba.Name='GlobalSettingsUIListLayout'ba.Padding=UDim.
new(0,5)ba.SortOrder=Enum.SortOrder.LayoutOrder ba.Parent=a6 local bb=Instance.
new'UIScale'bb.Name='GlobalSettingsUIScale'bb.Scale=1e-7 bb.Parent=a6 a6.Parent=
o o.Parent=k function j:UpdateTitle(bc)T.Text=bc end function j:UpdateSubtitle(
bc)U.Text=bc end local bc,bd=bb.Scale==1 and true or false local be=function()if
not bc then local be=h(bb,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=1})be:Play()be.Completed:Wait()bc=true elseif bc
then local be=h(bb,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=0})be:Play()be.Completed:Wait()bc=false end end Q.
MouseButton1Click:Connect(function()if not e then return end be()end)a6.
MouseEnter:Connect(function()bd=true end)a6.MouseLeave:Connect(function()bd=
false end)af.InputEnded:Connect(function(bf)if bf.UserInputType==Enum.
UserInputType.MouseButton1 and bc and not bd then be()end end)local bf,bg,bh,bi,
bj=o,ad,workspace.CurrentCamera,'Glass',{}local bk,bl=(bg:GenerateGUID(true))for
bm,bn in pairs(ah:GetChildren())do if not bn:IsA'DepthOfFieldEffect'and bn:
HasTag'.'then bl=Instance.new'DepthOfFieldEffect'bl.FarIntensity=0 bl.
FocusDistance=51.6 bl.InFocusRadius=50 bl.NearIntensity=1 bl.Name=bg:
GenerateGUID(true)bl:AddTag'.'elseif bn:IsA'DepthOfFieldEffect'and bn:HasTag'.'
then bl=bn end end if not bl then bl=Instance.new'DepthOfFieldEffect'bl.
FarIntensity=0 bl.FocusDistance=51.6 bl.InFocusRadius=50 bl.NearIntensity=1 bl.
Name=bg:GenerateGUID(true)bl:AddTag'.'end local bm=Instance.new'Frame'bm.Parent=
bf bm.Size=UDim2.new(0.97,0,0.97,0)bm.Position=UDim2.new(0.5,0,0.5,0)bm.
AnchorPoint=Vector2.new(0.5,0.5)bm.BackgroundTransparency=1 bm.Name=bg:
GenerateGUID(true)do local bn=function(bn)return bn==bn end local bo=bn(bh:
ScreenPointToRay(0,0).Origin.x)while not bo do ac.RenderStepped:Wait()bo=bn(bh:
ScreenPointToRay(0,0).Origin.x)end end local bn do local bo,bp,bq,br,bs=math.
acos,math.max,math.pi,math.sqrt,0.2 local bt=function(bt,bu,bv,bw,bx)local by,bz
,bA=(bt-bu).magnitude,(bu-bv).magnitude,(bv-bt).magnitude local bB,bC,bD,bE=(bp(
by,bz,bA))if by==bB then bC,bD,bE=bt,bu,bv elseif bz==bB then bC,bD,bE=bu,bv,bt
elseif bA==bB then bC,bD,bE=bv,bt,bu end local bF=((bD-bC).x*(bE-bC).x+(bD-bC).y
*(bE-bC).y+(bD-bC).z*(bE-bC).z)/(bC-bD).magnitude local bG,bH,bI,bJ=br((bE-bC).
magnitude^2-bF*bF),(bC-bD).magnitude-bF,CFrame.new(bD,bC),CFrame.Angles(bq/2,0,0
)local bK=bI local bL,bM=(bK*bJ).lookVector,bC+CFrame.new(bC,bD).lookVector*bF
local bN=CFrame.new(bM,bE).lookVector local bO=bL.x*bN.x+bL.y*bN.y+bL.z*bN.z
local bP=CFrame.Angles(0,0,bo(bO))bK=bK*bP if((bK*bJ).lookVector-bN).magnitude>
0.01 then bK=bK*CFrame.Angles(0,0,-2*bo(bO))end bK=bK*CFrame.new(0,bG/2,-(bH+bF/
2))local bQ=bI*bP*CFrame.Angles(0,bq,0)if((bQ*bJ).lookVector-bN).magnitude>0.01
then bQ=bQ*CFrame.Angles(0,0,2*bo(bO))end bQ=bQ*CFrame.new(0,bG/2,bH/2)if not bw
then bw=Instance.new'Part'bw.FormFactor='Custom'bw.TopSurface=0 bw.BottomSurface
=0 bw.Anchored=true bw.CanCollide=false bw.CastShadow=false bw.Material=bi bw.
Size=Vector3.new(bs,bs,bs)bw.Name=bg:GenerateGUID(true)local bR=Instance.new(
'SpecialMesh',bw)bR.MeshType=2 bR.Name=bk end bw[bk].Scale=Vector3.new(0,bG/bs,
bF/bs)bw.CFrame=bK if not bx then bx=bw:clone()end bx[bk].Scale=Vector3.new(0,bG
/bs,bH/bs)bx.CFrame=bQ return bw,bx end function bn(bu,bv,bw,bx,by)by[1],by[2]=
bt(bu,bv,bw,by[1],by[2])by[3],by[4]=bt(bw,bv,bx,by[3],by[4])end end if bj[bm]
then return bj[bm].parts end local bo,bp={},{}do local function bq(br)if br:IsA
'GuiObject'then bp[#bp+1]=br bq(br.Parent)end end bq(bm)end local bq=function(bq
)while bq do if bq:IsA'GuiObject'then if not bq.Visible then return false end
elseif bq:IsA'ScreenGui'then if not bq.Enabled then return false end break end
bq=bq.Parent end return true end local br=function(br)if not bq(bm)or not d or
an then for bs,bt in pairs(bo)do bt.Parent=nil bl.Enabled=false bl.Parent=nil
end return end if not bl.Parent then bl.Parent=ah end bl.Enabled=true local bs,
bt,bu,bv={Transparency=0.98,BrickColor=BrickColor.new'Institutional white'},1-
0.05*bm.ZIndex,bm.AbsolutePosition,bm.AbsolutePosition+bm.AbsoluteSize local bw,
bx=Vector2.new(bv.x,bu.y),Vector2.new(bu.x,bv.y)do local by=0 for bz,bA in
ipairs(bp)do by=by+bA.Rotation end if by~=0 and by%180~=0 then local bz,bA,bB=bu
:lerp(bv,0.5),math.sin(math.rad(by)),math.cos(math.rad(by))bu=Vector2.new(bB*(bu
.x-bz.x)-bA*(bu.y-bz.y),bA*(bu.x-bz.x)+bB*(bu.y-bz.y))+bz bw=Vector2.new(bB*(bw.
x-bz.x)-bA*(bw.y-bz.y),bA*(bw.x-bz.x)+bB*(bw.y-bz.y))+bz bx=Vector2.new(bB*(bx.x
-bz.x)-bA*(bx.y-bz.y),bA*(bx.x-bz.x)+bB*(bx.y-bz.y))+bz bv=Vector2.new(bB*(bv.x-
bz.x)-bA*(bv.y-bz.y),bA*(bv.x-bz.x)+bB*(bv.y-bz.y))+bz end end bn(bh:
ScreenPointToRay(bu.x,bu.y,bt).Origin,bh:ScreenPointToRay(bw.x,bw.y,bt).Origin,
bh:ScreenPointToRay(bx.x,bx.y,bt).Origin,bh:ScreenPointToRay(bv.x,bv.y,bt).
Origin,bo)if br then for by,bz in pairs(bo)do bz.Parent=bh end for by,bz in
pairs(bs)do for bA,bB in pairs(bo)do bB[by]=bz end end end end br(true)ac.
RenderStepped:Connect(br)function j:GlobalSetting(bs)e=true local bt,bu={},
Instance.new'TextButton'bu.Name='GlobalSetting'bu.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'bu.Text=''bu.TextColor3=Color3.
fromRGB(0,0,0)bu.TextSize=14 bu.BackgroundColor3=Color3.fromRGB(255,255,255)bu.
BackgroundTransparency=1 bu.BorderColor3=Color3.fromRGB(0,0,0)bu.BorderSizePixel
=0 bu.Size=UDim2.fromOffset(200,30)local bv=Instance.new'UIPadding'bv.Name=
'GlobalSettingToggleUIPadding'bv.PaddingLeft=UDim.new(0,15)bv.Parent=bu local bw
=Instance.new'TextLabel'bw.Name='SettingName'bw.FontFace=Font.new(ao.interFont)
bw.Text=bs.Name bw.RichText=true bw.TextColor3=Color3.fromRGB(255,255,255)bw.
TextSize=13 bw.TextTransparency=0.5 bw.TextTruncate=Enum.TextTruncate.SplitWord
bw.TextXAlignment=Enum.TextXAlignment.Left bw.TextYAlignment=Enum.TextYAlignment
.Top bw.AnchorPoint=Vector2.new(0,0.5)bw.AutomaticSize=Enum.AutomaticSize.Y bw.
BackgroundColor3=Color3.fromRGB(255,255,255)bw.BackgroundTransparency=1 bw.
BorderColor3=Color3.fromRGB(0,0,0)bw.BorderSizePixel=0 bw.Position=UDim2.
fromScale(1.3e-7,0.5)bw.Size=UDim2.new(1,-40,0,0)bw.Parent=bu local bx=Instance.
new'UIListLayout'bx.Name='GlobalSettingToggleUIListLayout'bx.Padding=UDim.new(0,
10)bx.FillDirection=Enum.FillDirection.Horizontal bx.SortOrder=Enum.SortOrder.
LayoutOrder bx.VerticalAlignment=Enum.VerticalAlignment.Center bx.Parent=bu
local by=Instance.new'TextLabel'by.Name='Checkmark'by.FontFace=Font.new(ao.
interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)by.Text='\u{2713}'by.
TextColor3=Color3.fromRGB(255,255,255)by.TextSize=13 by.TextTransparency=1 by.
TextXAlignment=Enum.TextXAlignment.Left by.TextYAlignment=Enum.TextYAlignment.
Top by.AnchorPoint=Vector2.new(0,0.5)by.AutomaticSize=Enum.AutomaticSize.Y by.
BackgroundColor3=Color3.fromRGB(255,255,255)by.BackgroundTransparency=1 by.
BorderColor3=Color3.fromRGB(0,0,0)by.BorderSizePixel=0 by.LayoutOrder=-1 by.
Position=UDim2.fromScale(1.3e-7,0.5)by.Size=UDim2.fromOffset(-10,0)by.Parent=bu
bu.Parent=a6 local bz={duration=0.2,easingStyle=Enum.EasingStyle.Quint,
transparencyIn=0.2,transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-
bx.Padding.Offset,waitTime=1}local bA={checkIn=h(by,TweenInfo.new(bz.duration,bz
.easingStyle),{Size=UDim2.new(by.Size.X.Scale,bz.checkSizeIncrease,by.Size.Y.
Scale,by.Size.Y.Offset)}),checkOut=h(by,TweenInfo.new(bz.duration,bz.easingStyle
),{Size=UDim2.new(by.Size.X.Scale,bz.checkSizeDecrease,by.Size.Y.Scale,by.Size.Y
.Offset)}),nameIn=h(bw,TweenInfo.new(bz.duration,bz.easingStyle),{
TextTransparency=bz.transparencyIn}),nameOut=h(bw,TweenInfo.new(bz.duration,bz.
easingStyle),{TextTransparency=bz.transparencyOut})}local bB,bC=function(bB)if
not bB then bA.checkOut:Play()bA.nameOut:Play()by:GetPropertyChangedSignal
'AbsoluteSize':Connect(function()if by.AbsoluteSize.X<=0 then by.
TextTransparency=1 end end)else bA.checkIn:Play()bA.nameIn:Play()by:
GetPropertyChangedSignal'AbsoluteSize':Connect(function()if by.AbsoluteSize.X>0
then by.TextTransparency=0 end end)end end,bs.Default bB(bC)bu.MouseButton1Click
:Connect(function()bC=not bC bB(bC)task.spawn(function()if bs.Callback then bs.
Callback(bC)end end)end)function bt:UpdateName(bD)bw.Text=bD end function bt:
UpdateState(bD)bB(bD)bC=bD end return bt end function j:TabGroup()local bs,bt={}
,Instance.new'Frame'bt.Name='Section'bt.AutomaticSize=Enum.AutomaticSize.Y bt.
BackgroundColor3=Color3.fromRGB(255,255,255)bt.BackgroundTransparency=1 bt.
BorderColor3=Color3.fromRGB(0,0,0)bt.BorderSizePixel=0 bt.Size=UDim2.fromScale(1
,0)local bu=Instance.new'Frame'bu.Name='Divider'bu.AnchorPoint=Vector2.new(0.5,1
)bu.BackgroundColor3=Color3.fromRGB(255,255,255)bu.BackgroundTransparency=0.9 bu
.BorderColor3=Color3.fromRGB(0,0,0)bu.BorderSizePixel=0 bu.Position=UDim2.
fromScale(0.5,1)bu.Size=UDim2.new(1,-21,0,1)bu.Parent=bt local bv=Instance.new
'Frame'bv.Name='SectionTabSwitchers'bv.BackgroundColor3=Color3.fromRGB(255,255,
255)bv.BackgroundTransparency=1 bv.BorderColor3=Color3.fromRGB(0,0,0)bv.
BorderSizePixel=0 bv.Size=UDim2.fromScale(1,1)local bw=Instance.new
'UIListLayout'bw.Name='UIListLayout'bw.Padding=UDim.new(0,15)bw.
HorizontalAlignment=Enum.HorizontalAlignment.Center bw.SortOrder=Enum.SortOrder.
LayoutOrder bw.Parent=bv local bx=Instance.new'UIPadding'bx.Name='UIPadding'bx.
PaddingBottom=UDim.new(0,15)bx.Parent=bv bv.Parent=bt bt.Parent=aF function bs:
Tab(by)local bz,bA={Settings=by},Instance.new'TextButton'bA.Name='TabSwitcher'bA
.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'bA.Text=''bA.
TextColor3=Color3.fromRGB(0,0,0)bA.TextSize=14 bA.AutoButtonColor=false bA.
AnchorPoint=Vector2.new(0.5,0)bA.BackgroundColor3=Color3.fromRGB(255,255,255)bA.
BackgroundTransparency=1 bA.BorderColor3=Color3.fromRGB(0,0,0)bA.BorderSizePixel
=0 bA.Position=UDim2.fromScale(0.5,0)bA.Size=UDim2.new(1,-21,0,40)am+=1 bA.
LayoutOrder=am local bB=Instance.new'UICorner'bB.Name='TabSwitcherUICorner'bB.
Parent=bA local bC=Instance.new'UIStroke'bC.Name='TabSwitcherUIStroke'bC.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border bC.Color=Color3.fromRGB(255,255,255)
bC.Transparency=1 bC.Parent=bA local bD=Instance.new'UIListLayout'bD.Name=
'TabSwitcherUIListLayout'bD.Padding=UDim.new(0,9)bD.FillDirection=Enum.
FillDirection.Horizontal bD.SortOrder=Enum.SortOrder.LayoutOrder bD.
VerticalAlignment=Enum.VerticalAlignment.Center bD.Parent=bA local bE if by.
Image then bE=Instance.new'ImageLabel'bE.Name='TabImage'bE.Image=by.Image bE.
ImageTransparency=0.5 bE.BackgroundColor3=Color3.fromRGB(255,255,255)bE.
BackgroundTransparency=1 bE.BorderColor3=Color3.fromRGB(0,0,0)bE.BorderSizePixel
=0 bE.Size=UDim2.fromOffset(18,18)bE.Parent=bA end local bF=Instance.new
'TextLabel'bF.Name='TabSwitcherName'bF.FontFace=Font.new(ao.interFont,Enum.
FontWeight.Medium,Enum.FontStyle.Normal)bF.Text=by.Name bF.RichText=true bF.
TextColor3=Color3.fromRGB(255,255,255)bF.TextSize=16 bF.TextTransparency=0.5 bF.
TextTruncate=Enum.TextTruncate.SplitWord bF.TextXAlignment=Enum.TextXAlignment.
Left bF.TextYAlignment=Enum.TextYAlignment.Top bF.AutomaticSize=Enum.
AutomaticSize.Y bF.BackgroundColor3=Color3.fromRGB(255,255,255)bF.
BackgroundTransparency=1 bF.BorderColor3=Color3.fromRGB(0,0,0)bF.BorderSizePixel
=0 bF.Size=UDim2.fromScale(1,0)bF.Parent=bA bF.LayoutOrder=1 local bG=Instance.
new'UIPadding'bG.Name='TabSwitcherUIPadding'bG.PaddingLeft=UDim.new(0,24)bG.
PaddingRight=UDim.new(0,35)bG.PaddingTop=UDim.new(0,1)bG.Parent=bA bA.Parent=bv
local bH=Instance.new'Frame'bH.Name='Elements'bH.BackgroundColor3=Color3.
fromRGB(255,255,255)bH.BackgroundTransparency=1 bH.BorderColor3=Color3.fromRGB(0
,0,0)bH.BorderSizePixel=0 bH.Position=UDim2.fromOffset(0,63)bH.Size=UDim2.new(1,
0,1,-63)bH.ClipsDescendants=true local bI=Instance.new'UIPadding'bI.Name=
'ElementsUIPadding'bI.PaddingRight=UDim.new(0,5)bI.PaddingTop=UDim.new(0,10)bI.
PaddingBottom=UDim.new(0,10)bI.Parent=bH local bJ=Instance.new'ScrollingFrame'bJ
.Name='ElementsScrolling'bJ.AutomaticCanvasSize=Enum.AutomaticSize.Y bJ.
BottomImage=''bJ.CanvasSize=UDim2.new()bJ.ScrollBarImageTransparency=0.5 bJ.
ScrollBarThickness=1 bJ.TopImage=''bJ.BackgroundColor3=Color3.fromRGB(255,255,
255)bJ.BackgroundTransparency=1 bJ.BorderColor3=Color3.fromRGB(0,0,0)bJ.
BorderSizePixel=0 bJ.Size=UDim2.fromScale(1,1)bJ.ClipsDescendants=false local bK
=Instance.new'UIPadding'bK.Name='ElementsScrollingUIPadding'bK.PaddingBottom=
UDim.new(0,5)bK.PaddingLeft=UDim.new(0,11)bK.PaddingRight=UDim.new(0,3)bK.
PaddingTop=UDim.new(0,5)bK.Parent=bJ local bL=Instance.new'UIListLayout'bL.Name=
'ElementsScrollingUIListLayout'bL.Padding=UDim.new(0,15)bL.FillDirection=Enum.
FillDirection.Horizontal bL.SortOrder=Enum.SortOrder.LayoutOrder bL.Parent=bJ
local bM=Instance.new'Frame'bM.Name='Left'bM.AutomaticSize=Enum.AutomaticSize.Y
bM.BackgroundColor3=Color3.fromRGB(0,0,0)bM.BackgroundTransparency=1 bM.
BorderColor3=Color3.fromRGB(0,0,0)bM.BorderSizePixel=0 bM.Position=UDim2.
fromScale(0.512,0)bM.Size=UDim2.new(0.5,-10,0,0)local bN=Instance.new
'UIListLayout'bN.Name='LeftUIListLayout'bN.Padding=UDim.new(0,15)bN.SortOrder=
Enum.SortOrder.LayoutOrder bN.Parent=bM bM.Parent=bJ local bO=Instance.new
'Frame'bO.Name='Right'bO.AutomaticSize=Enum.AutomaticSize.Y bO.BackgroundColor3=
Color3.fromRGB(0,0,0)bO.BackgroundTransparency=1 bO.BorderColor3=Color3.fromRGB(
0,0,0)bO.BorderSizePixel=0 bO.LayoutOrder=1 bO.Position=UDim2.fromScale(0.512,0)
bO.Size=UDim2.new(0.5,-10,0,0)local bP=Instance.new'UIListLayout'bP.Name=
'RightUIListLayout'bP.Padding=UDim.new(0,15)bP.SortOrder=Enum.SortOrder.
LayoutOrder bP.Parent=bO bO.Parent=bJ bJ.Parent=bH function bz:Section(bQ)local
bR,bS={},Instance.new'Frame'bS.Name='Section'bS.AutomaticSize=Enum.AutomaticSize
.Y bS.BackgroundColor3=Color3.fromRGB(255,255,255)bS.BackgroundTransparency=0.98
bS.BorderColor3=Color3.fromRGB(0,0,0)bS.BorderSizePixel=0 bS.Position=UDim2.
fromScale(0,6.78e-8)bS.Size=UDim2.fromScale(1,0)bS.ClipsDescendants=true bS.
Parent=bQ.Side=='Left'and bM or bO local bT=Instance.new'UICorner'bT.Name=
'SectionUICorner'bT.Parent=bS local bU=Instance.new'UIStroke'bU.Name=
'SectionUIStroke'bU.ApplyStrokeMode=Enum.ApplyStrokeMode.Border bU.Color=Color3.
fromRGB(255,255,255)bU.Transparency=0.95 bU.Parent=bS local bV=Instance.new
'UIListLayout'bV.Name='SectionUIListLayout'bV.Padding=UDim.new(0,10)bV.SortOrder
=Enum.SortOrder.LayoutOrder bV.Parent=bS local bW=Instance.new'UIPadding'bW.Name
='SectionUIPadding'bW.PaddingBottom=UDim.new(0,20)bW.PaddingLeft=UDim.new(0,20)
bW.PaddingRight=UDim.new(0,18)bW.PaddingTop=UDim.new(0,22)bW.Parent=bS function
bR:Button(bX,bY)local bZ,b_={Settings=bX},Instance.new'Frame'b_.Name='Button'b_.
AutomaticSize=Enum.AutomaticSize.Y b_.BackgroundColor3=Color3.fromRGB(0,0,0)b_.
BackgroundTransparency=1 b_.BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel
=0 b_.Size=UDim2.new(1,0,0,38)b_.Parent=bS local b0=Instance.new'TextButton'b0.
Name='ButtonInteract'b0.FontFace=Font.new(ao.interFont)b0.RichText=true b0.
TextColor3=Color3.fromRGB(255,255,255)b0.TextSize=13 b0.TextTransparency=0.5 b0.
TextTruncate=Enum.TextTruncate.AtEnd b0.TextXAlignment=Enum.TextXAlignment.Left
b0.BackgroundColor3=Color3.fromRGB(255,255,255)b0.BackgroundTransparency=1 b0.
BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel=0 b0.Size=UDim2.fromScale(1
,1)b0.Parent=b_ b0.Text=bZ.Settings.Name local b1=Instance.new'ImageLabel'b1.
Name='ButtonImage'b1.Image=ao.buttonImage b1.ImageTransparency=0.5 b1.
AnchorPoint=Vector2.new(1,0.5)b1.BackgroundColor3=Color3.fromRGB(255,255,255)b1.
BackgroundTransparency=1 b1.BorderColor3=Color3.fromRGB(0,0,0)b1.BorderSizePixel
=0 b1.Position=UDim2.fromScale(1,0.5)b1.Size=UDim2.fromOffset(15,15)b1.Parent=b_
local b2={DefaultTransparency=0.5,HoverTransparency=0.3,EasingStyle=Enum.
EasingStyle.Sine}local b3,b4=function(b3)if b3=='Idle'then h(b0,TweenInfo.new(
0.2,b2.EasingStyle),{TextTransparency=b2.DefaultTransparency}):Play()h(b1,
TweenInfo.new(0.2,b2.EasingStyle),{ImageTransparency=b2.DefaultTransparency}):
Play()elseif b3=='Hover'then h(b0,TweenInfo.new(0.2,b2.EasingStyle),{
TextTransparency=b2.HoverTransparency}):Play()h(b1,TweenInfo.new(0.2,b2.
EasingStyle),{ImageTransparency=b2.HoverTransparency}):Play()end end,function()
if bZ.Settings.Callback then bZ.Settings.Callback()end end b0.MouseEnter:
Connect(function()b3'Hover'end)b0.MouseLeave:Connect(function()b3'Idle'end)b0.
MouseButton1Click:Connect(b4)function bZ:UpdateName(b5)b0.Text=b5 end function
bZ:SetVisibility(b5)b_.Visible=b5 end if bY then aa.Options[bY]=bZ end return bZ
end function bR:Toggle(bX,bY)local bZ,b_={Settings=bX,IgnoreConfig=false,Class=
'Toggle'},Instance.new'Frame'b_.Name='Toggle'b_.AutomaticSize=Enum.AutomaticSize
.Y b_.BackgroundColor3=Color3.fromRGB(0,0,0)b_.BackgroundTransparency=1 b_.
BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel=0 b_.Size=UDim2.new(1,0,0,
38)b_.Parent=bS local b0=Instance.new'TextLabel'b0.Name='ToggleName'b0.FontFace=
Font.new(ao.interFont)b0.Text=bZ.Settings.Name b0.RichText=true b0.TextColor3=
Color3.fromRGB(255,255,255)b0.TextSize=13 b0.TextTransparency=0.5 b0.
TextTruncate=Enum.TextTruncate.AtEnd b0.TextXAlignment=Enum.TextXAlignment.Left
b0.TextYAlignment=Enum.TextYAlignment.Top b0.AnchorPoint=Vector2.new(0,0.5)b0.
AutomaticSize=Enum.AutomaticSize.Y b0.BackgroundColor3=Color3.fromRGB(255,255,
255)b0.BackgroundTransparency=1 b0.BorderColor3=Color3.fromRGB(0,0,0)b0.
BorderSizePixel=0 b0.Position=UDim2.fromScale(0,0.5)b0.Size=UDim2.new(1,-50,0,0)
b0.Parent=b_ local b1=Instance.new'ImageButton'b1.Name='Toggle'b1.Image=ao.
toggleBackground b1.ImageColor3=Color3.fromRGB(87,86,86)b1.AutoButtonColor=false
b1.AnchorPoint=Vector2.new(1,0.5)b1.BackgroundColor3=Color3.fromRGB(255,255,255)
b1.BackgroundTransparency=1 b1.BorderColor3=Color3.fromRGB(0,0,0)b1.
BorderSizePixel=0 b1.Position=UDim2.fromScale(1,0.5)b1.Size=UDim2.fromOffset(41,
21)b1.ImageTransparency=0.5 local b2=Instance.new'UIPadding'b2.Name=
'ToggleUIPadding'b2.PaddingBottom=UDim.new(0,1)b2.PaddingLeft=UDim.new(0,-2)b2.
PaddingRight=UDim.new(0,3)b2.PaddingTop=UDim.new(0,1)b2.Parent=b1 local b3=
Instance.new'ImageLabel'b3.Name='TogglerHead'b3.Image=ao.togglerHead b3.
ImageColor3=Color3.fromRGB(255,255,255)b3.AnchorPoint=Vector2.new(1,0.5)b3.
BackgroundColor3=Color3.fromRGB(255,255,255)b3.BackgroundTransparency=1 b3.
BorderColor3=Color3.fromRGB(0,0,0)b3.BorderSizePixel=0 b3.Position=UDim2.
fromScale(0.5,0.5)b3.Size=UDim2.fromOffset(15,15)b3.ZIndex=2 b3.Parent=b1 b3.
ImageTransparency=0.8 b1.Parent=b_ local b4,b5,b6,b7={Enabled=0,Disabled=0.5},{
Enabled=0,Disabled=0.85},{Info=TweenInfo.new(0.15,Enum.EasingStyle.Quad),
EnabledPosition=UDim2.new(1,0,0.5,0),DisabledPosition=UDim2.new(0.5,0,0.5,0)},bZ
.Settings.Default local b8=function(b8,b9)b()local ca,cb=b8 and{b4.Enabled,b5.
Enabled}or{b4.Disabled,b5.Disabled},b8 and b6.EnabledPosition or b6.
DisabledPosition pcall(function()h(b1,b6.Info,{ImageTransparency=ca[1]}):Play()
end)pcall(function()h(b3,b6.Info,{ImageTransparency=ca[2]}):Play()end)pcall(
function()h(b3,b6.Info,{Position=cb}):Play()end)bZ.State=b8 if b9 then pcall(b9,
b7)end end b8(b7)local b9=function()b7=not b7 b8(b7,bZ.Settings.Callback)end b1.
MouseButton1Click:Connect(b9)function bZ:Toggle()b9()end function bZ:UpdateState
(ca,cb)b7=ca b8(b7,not cb and bZ.Settings.Callback or nil)end function bZ:
GetState()return b7 end function bZ:UpdateName(ca)b0.Text=ca end function bZ:
SetVisibility(ca)b_.Visible=ca end if bY then aa.Options[bY]=bZ end return bZ
end function bR:Slider(bX,bY)local bZ,b_={Settings=bX,IgnoreConfig=false,Class=
'Slider'},Instance.new'Frame'b_.Name='Slider'b_.AutomaticSize=Enum.AutomaticSize
.Y b_.BackgroundColor3=Color3.fromRGB(0,0,0)b_.BackgroundTransparency=1 b_.
BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel=0 b_.Size=UDim2.new(1,0,0,
38)b_.Parent=bS local b0=Instance.new'TextLabel'b0.Name='SliderName'b0.FontFace=
Font.new(ao.interFont)b0.Text=bZ.Settings.Name b0.RichText=true b0.TextColor3=
Color3.fromRGB(255,255,255)b0.TextSize=13 b0.TextTransparency=0.5 b0.
TextTruncate=Enum.TextTruncate.AtEnd b0.TextXAlignment=Enum.TextXAlignment.Left
b0.TextYAlignment=Enum.TextYAlignment.Top b0.AnchorPoint=Vector2.new(0,0.5)b0.
AutomaticSize=Enum.AutomaticSize.XY b0.BackgroundColor3=Color3.fromRGB(255,255,
255)b0.BackgroundTransparency=1 b0.BorderColor3=Color3.fromRGB(0,0,0)b0.
BorderSizePixel=0 b0.Position=UDim2.fromScale(1.3e-7,0.5)b0.Parent=b_ local b1=
Instance.new'Frame'b1.Name='SliderElements'b1.AnchorPoint=Vector2.new(1,0)b1.
BackgroundColor3=Color3.fromRGB(255,255,255)b1.BackgroundTransparency=1 b1.
BorderColor3=Color3.fromRGB(0,0,0)b1.BorderSizePixel=0 b1.Position=UDim2.
fromScale(1,0)b1.Size=UDim2.fromScale(1,1)local b2=Instance.new'TextBox'b2.Name=
'SliderValue'b2.FontFace=Font.new(ao.interFont)b2.TextColor3=Color3.fromRGB(255,
255,255)b2.TextSize=12 b2.TextTransparency=0.1 b2.BackgroundColor3=Color3.
fromRGB(255,255,255)b2.BackgroundTransparency=0.95 b2.BorderColor3=Color3.
fromRGB(0,0,0)b2.BorderSizePixel=0 b2.LayoutOrder=1 b2.Position=UDim2.fromScale(
-7.89E-2,0.171)b2.Size=UDim2.fromOffset(41,21)b2.ClipsDescendants=true local b3=
Instance.new'UICorner'b3.Name='SliderValueUICorner'b3.CornerRadius=UDim.new(0,4)
b3.Parent=b2 local b4=Instance.new'UIStroke'b4.Name='SliderValueUIStroke'b4.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border b4.Color=Color3.fromRGB(255,255,255)
b4.Transparency=0.9 b4.Parent=b2 local b5=Instance.new'UIPadding'b5.Name=
'SliderValueUIPadding'b5.PaddingLeft=UDim.new(0,2)b5.PaddingRight=UDim.new(0,2)
b5.Parent=b2 b2.Parent=b1 local b6=Instance.new'UIListLayout'b6.Name=
'SliderElementsUIListLayout'b6.Padding=UDim.new(0,20)b6.FillDirection=Enum.
FillDirection.Horizontal b6.HorizontalAlignment=Enum.HorizontalAlignment.Right
b6.SortOrder=Enum.SortOrder.LayoutOrder b6.VerticalAlignment=Enum.
VerticalAlignment.Center b6.Parent=b1 local b7=Instance.new'ImageLabel'b7.Name=
'SliderBar'b7.Image=ao.sliderbar b7.ImageColor3=Color3.fromRGB(87,86,86)b7.
BackgroundColor3=Color3.fromRGB(255,255,255)b7.BackgroundTransparency=1 b7.
BorderColor3=Color3.fromRGB(0,0,0)b7.BorderSizePixel=0 b7.Position=UDim2.
fromScale(0.219,0.457)b7.Size=UDim2.fromOffset(123,3)local b8=Instance.new
'ImageButton'b8.Name='SliderHead'b8.Image=ao.sliderhead b8.AnchorPoint=Vector2.
new(0.5,0.5)b8.BackgroundColor3=Color3.fromRGB(255,255,255)b8.
BackgroundTransparency=1 b8.BorderColor3=Color3.fromRGB(0,0,0)b8.BorderSizePixel
=0 b8.Position=UDim2.fromScale(1,0.5)b8.Size=UDim2.fromOffset(12,12)b8.Parent=b7
b7.Parent=b1 local b9=Instance.new'UIPadding'b9.Name='SliderElementsUIPadding'b9
.PaddingTop=UDim.new(0,3)b9.Parent=b1 b1.Parent=b_ local ca,cb=false,{Hundredths
=function(ca)return string.format('%.2f',ca)end,Tenths=function(ca)return string
.format('%.1f',ca)end,Round=function(ca,cb)if cb then return string.format('%.'
..cb..'f',ca)else return tostring(math.round(ca))end end,Degrees=function(ca,cb)
local cc=cb and string.format('%.'..cb..'f',ca)or tostring(ca)return cc..
'\u{b0}'end,Percent=function(ca,cb)local cc=(ca-bZ.Settings.Minimum)/(bZ.
Settings.Maximum-bZ.Settings.Minimum)*100 return cb and string.format('%.'..cb..
'f',cc)..'%'or tostring(math.round(cc))..'%'end,Value=function(ca,cb)return cb
and string.format('%.'..cb..'f',ca)or tostring(ca)end}local cc,cd=cb[bZ.Settings
.DisplayMethod]or cb.Value local ce=function(ce,cf)b()local cg if typeof(ce)==
'Instance'then local ch=ce cg=math.clamp((ch.Position.X-b7.AbsolutePosition.X)/
b7.AbsoluteSize.X,0,1)else local ch=ce cg=(ch-bZ.Settings.Minimum)/(bZ.Settings.
Maximum-bX.Minimum)end local ch=UDim2.new(cg,0,0.5,0)pcall(function()b8.Position
=ch end)cd=cg*(bZ.Settings.Maximum-bZ.Settings.Minimum)+bX.Minimum pcall(
function()b2.Text=(bX.Prefix or'')..cc(cd,bZ.Settings.Precision)..(bX.Suffix or
'')end)if not cf then task.spawn(function()if bZ.Settings.Callback then bZ.
Settings.Callback(cd)end end)end bZ.Value=cd end ce(bZ.Settings.Default,true)b8.
InputBegan:Connect(function(cf)if cf.UserInputType==Enum.UserInputType.
MouseButton1 or cf.UserInputType==Enum.UserInputType.Touch then ca=true ce(cf)
end end)b8.InputEnded:Connect(function(cf)if cf.UserInputType==Enum.
UserInputType.MouseButton1 or cf.UserInputType==Enum.UserInputType.Touch then ca
=false if bZ.Settings.onInputComplete then bZ.Settings.onInputComplete(cd)end
end end)b2.FocusLost:Connect(function(cf)local cg=b2.Text local ch,ci=cg:match
'^(%-?%d+%.?%d*)(%%?)$'if ch then ch=tonumber(ch)ci=ci=='%'if ci then ch=bZ.
Settings.Minimum+(ch/100)*(bZ.Settings.Maximum-bZ.Settings.Minimum)end local cj=
math.clamp(ch,bZ.Settings.Minimum,bZ.Settings.Maximum)ce(cj)else b2.Text=cc(cd)
end if bZ.Settings.onInputComplete then bZ.Settings.onInputComplete(cd)end end)
af.InputChanged:Connect(function(cf)if ca and(cf.UserInputType==Enum.
UserInputType.MouseMovement or cf.UserInputType==Enum.UserInputType.Touch)then
ce(cf)end end)local cf=function()local cf,cg,ch,ci=b6.Padding.Offset,b2.
AbsoluteSize.X,b0.AbsoluteSize.X,b1.AbsoluteSize.X local cj=(ci-(cf+cg+ch+20))/p
.Scale b7.Size=UDim2.new(b7.Size.X.Scale,cj,b7.Size.Y.Scale,b7.Size.Y.Offset)end
cf()b0:GetPropertyChangedSignal'AbsoluteSize':Connect(cf)bS:
GetPropertyChangedSignal'AbsoluteSize':Connect(cf)function bZ:UpdateName(cg)b0=
cg end function bZ:SetVisibility(cg)b_.Visible=cg end function bZ:UpdateValue(cg
)ce(tonumber(cg),true)end function bZ:GetValue()return cd end if bY then aa.
Options[bY]=bZ end return bZ end function bR:Input(bX,bY)local bZ,b_={Settings=
bX,IgnoreConfig=false,Class='Input'},Instance.new'Frame'b_.Name='Input'b_.
AutomaticSize=Enum.AutomaticSize.Y b_.BackgroundColor3=Color3.fromRGB(0,0,0)b_.
BackgroundTransparency=1 b_.BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel
=0 b_.Size=UDim2.new(1,0,0,38)b_.Parent=bS local b0=Instance.new'TextLabel'b0.
Name='InputName'b0.FontFace=Font.new(ao.interFont)b0.Text=bZ.Settings.Name b0.
RichText=true b0.TextColor3=Color3.fromRGB(255,255,255)b0.TextSize=13 b0.
TextTransparency=0.5 b0.TextTruncate=Enum.TextTruncate.AtEnd b0.TextXAlignment=
Enum.TextXAlignment.Left b0.TextYAlignment=Enum.TextYAlignment.Top b0.
AnchorPoint=Vector2.new(0,0.5)b0.AutomaticSize=Enum.AutomaticSize.XY b0.
BackgroundColor3=Color3.fromRGB(255,255,255)b0.BackgroundTransparency=1 b0.
BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel=0 b0.Position=UDim2.
fromScale(0,0.5)b0.Parent=b_ local b1=Instance.new'TextBox'b1.Name='InputBox'b1.
FontFace=Font.new(ao.interFont)b1.Text='Hello world!'b1.TextColor3=Color3.
fromRGB(255,255,255)b1.TextSize=12 b1.TextTransparency=0.1 b1.AnchorPoint=
Vector2.new(1,0.5)b1.AutomaticSize=Enum.AutomaticSize.X b1.BackgroundColor3=
Color3.fromRGB(255,255,255)b1.BackgroundTransparency=0.95 b1.BorderColor3=Color3
.fromRGB(0,0,0)b1.BorderSizePixel=0 b1.ClipsDescendants=true b1.LayoutOrder=1 b1
.Position=UDim2.fromScale(1,0.5)b1.Size=UDim2.fromOffset(21,21)b1.TextXAlignment
=Enum.TextXAlignment.Right local b2=Instance.new'UICorner'b2.Name=
'InputBoxUICorner'b2.CornerRadius=UDim.new(0,4)b2.Parent=b1 local b3=Instance.
new'UIStroke'b3.Name='InputBoxUIStroke'b3.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border b3.Color=Color3.fromRGB(255,255,255)b3.Transparency=0.9 b3.Parent=b1
local b4=Instance.new'UIPadding'b4.Name='InputBoxUIPadding'b4.PaddingLeft=UDim.
new(0,5)b4.PaddingRight=UDim.new(0,5)b4.Parent=b1 local b5=Instance.new
'UISizeConstraint'b5.Name='InputBoxUISizeConstraint'b5.Parent=b1 b1.Parent=b_
local b6,b7,b8,b9,ca=b_,b1,b0,b5,function(b6)if bZ.Settings.CharacterLimit then
return b6:sub(1,bZ.Settings.CharacterLimit)end return b6 end local cb,cc={All=
function(cb)return ca(cb)end,Numeric=function(cb)local cc=cb:match'^%-?%d*$'and
cb or cb:gsub('[^%d-]',''):gsub('(%-)',function(cc,cd)return cd==1 and cc or''
end)return ca(cc)end,Alphabetic=function(cb)return ca(cb:gsub('[^a-zA-Z ]',''))
end,AlphaNumeric=function(cb)return ca(cb:gsub('[^a-zA-Z0-9]',''))end}if type(bZ
.Settings.AcceptedCharacters)=='function'then cc=bZ.Settings.AcceptedCharacters
else cc=cb[bZ.Settings.AcceptedCharacters]or cb.All end b7.AutomaticSize=Enum.
AutomaticSize.X local cd=function()local cd,ce=b8.AbsoluteSize.X,b6.AbsoluteSize
.X local cf=(ce-cd-20)/p.Scale b9.MaxSize=Vector2.new(cf,9e9)end cd()b8:
GetPropertyChangedSignal'AbsoluteSize':Connect(cd)b7.FocusLost:Connect(function(
)local ce=b7.Text local cf=cc(ce)b7.Text=cf task.spawn(function()if bZ.Settings.
Callback then bZ.Settings.Callback(cf)end end)end)b7.Text=bZ.Settings.Default or
''b7.PlaceholderText=bZ.Settings.Placeholder or''b7:GetPropertyChangedSignal
'Text':Connect(function()b7.Text=cc(b7.Text)if bZ.Settings.onChanged then bZ.
Settings.onChanged(b7.Text)end bZ.Text=b7.Text end)function bZ:UpdateName(ce)b0.
Text=ce end function bZ:SetVisibility(ce)b_.Visible=ce end function bZ:GetInput(
)return b7.Text end function bZ:UpdatePlaceholder(ce)b1.PlaceholderText=ce end
function bZ:UpdateText(ce)local cf=cc(ce)b7.Text=cf bZ.Text=cf task.spawn(
function()if bZ.Settings.Callback then bZ.Settings.Callback(cf)end end)end if bY
then aa.Options[bY]=bZ end return bZ end function bR:Keybind(bX,bY)local bZ,b_={
Settings=bX,IgnoreConfig=false,Class='Keybind'},Instance.new'Frame'b_.Name=
'Keybind'b_.AutomaticSize=Enum.AutomaticSize.Y b_.BackgroundColor3=Color3.
fromRGB(0,0,0)b_.BackgroundTransparency=1 b_.BorderColor3=Color3.fromRGB(0,0,0)
b_.BorderSizePixel=0 b_.Size=UDim2.new(1,0,0,38)b_.Parent=bS local b0=Instance.
new'TextLabel'b0.Name='KeybindName'b0.FontFace=Font.new(ao.interFont)b0.Text=bZ.
Settings.Name b0.RichText=true b0.TextColor3=Color3.fromRGB(255,255,255)b0.
TextSize=13 b0.TextTransparency=0.5 b0.TextTruncate=Enum.TextTruncate.AtEnd b0.
TextXAlignment=Enum.TextXAlignment.Left b0.TextYAlignment=Enum.TextYAlignment.
Top b0.AnchorPoint=Vector2.new(0,0.5)b0.AutomaticSize=Enum.AutomaticSize.XY b0.
BackgroundColor3=Color3.fromRGB(255,255,255)b0.BackgroundTransparency=1 b0.
BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel=0 b0.Position=UDim2.
fromScale(0,0.5)b0.Parent=b_ local b1=Instance.new'TextBox'b1.Name='BinderBox'b1
.CursorPosition=-1 b1.FontFace=Font.new(ao.interFont)b1.PlaceholderText='...'b1.
Text=''b1.TextColor3=Color3.fromRGB(255,255,255)b1.TextSize=12 b1.
TextTransparency=0.1 b1.AnchorPoint=Vector2.new(1,0.5)b1.AutomaticSize=Enum.
AutomaticSize.X b1.BackgroundColor3=Color3.fromRGB(255,255,255)b1.
BackgroundTransparency=0.95 b1.BorderColor3=Color3.fromRGB(0,0,0)b1.
BorderSizePixel=0 b1.ClipsDescendants=true b1.LayoutOrder=1 b1.Position=UDim2.
fromScale(1,0.5)b1.Size=UDim2.fromOffset(21,21)local b2=Instance.new'UICorner'b2
.Name='BinderBoxUICorner'b2.CornerRadius=UDim.new(0,4)b2.Parent=b1 local b3=
Instance.new'UIStroke'b3.Name='BinderBoxUIStroke'b3.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border b3.Color=Color3.fromRGB(255,255,255)b3.Transparency=0.9
b3.Parent=b1 local b4=Instance.new'UIPadding'b4.Name='BinderBoxUIPadding'b4.
PaddingLeft=UDim.new(0,5)b4.PaddingRight=UDim.new(0,5)b4.Parent=b1 local b5=
Instance.new'UISizeConstraint'b5.Name='BinderBoxUISizeConstraint'b5.Parent=b1 b1
.Parent=b_ local b6,b7,b8,b9=false,false,(bZ.Settings.Default)local ca=function(
)b9=false b6=false b1:ReleaseFocus()end if b8 then b1.Text=b8.Name end b1.
Focused:Connect(function()b9=true end)b1.FocusLost:Connect(function()b9=false
end)af.InputBegan:Connect(function(cb)if b9 and not b6 then b6=true local cc cc=
af.InputBegan:Connect(function(cd)if bZ.Settings.Blacklist and(table.find(bZ.
KeybindFunctions.Settings.Blacklist,cd.KeyCode)or table.find(bZ.Settings.
Blacklist,cd.UserInputType))then b1:ReleaseFocus()ca()cc:Disconnect()return end
if cd.UserInputType==Enum.UserInputType.Keyboard then b8=cd.KeyCode b1.Text=cd.
KeyCode.Name elseif cd.UserInputType==Enum.UserInputType.MouseButton1 or cd.
UserInputType==Enum.UserInputType.MouseButton2 then b8=cd.UserInputType b1.Text=
cd.UserInputType.Name end if bZ.Settings.onBinded then bZ.Settings.onBinded(b8)
end b7=true ca()cc:Disconnect()end)else if not b7 and(cb.KeyCode==b8 or cb.
UserInputType==b8)then if bZ.Settings.Callback then bZ.Settings.Callback(b8)end
if bZ.Settings.onBindHeld then bZ.Settings.onBindHeld(true,b8)end else b7=false
end end end)af.InputEnded:Connect(function(cb)if not b9 and not b6 then if cb.
KeyCode==b8 or cb.UserInputType==b8 then if bX.onBindHeld then bX.onBindHeld(
false,b8)end end end end)function bZ:Bind(cb)b8=cb b1.Text=cb.Name end function
bZ:Unbind()b8=nil b1.Text=''end function bZ:GetBind()return b8 end function bZ:
UpdateName(cb)b0=cb end function bZ:SetVisibility(cb)b_.Visible=cb end if bY
then aa.Options[bY]=bZ end return bZ end function bR:Dropdown(bX,bY)local bZ,b_,
b0,b1={Settings=bX,IgnoreConfig=false,Class='Dropdown'},{},{},Instance.new
'Frame'b1.Name='Dropdown'b1.BackgroundColor3=Color3.fromRGB(255,255,255)b1.
BackgroundTransparency=0.985 b1.BorderColor3=Color3.fromRGB(0,0,0)b1.
BorderSizePixel=0 b1.Size=UDim2.new(1,0,0,38)b1.Parent=bS b1.ClipsDescendants=
true local b2=Instance.new'UIPadding'b2.Name='DropdownUIPadding'b2.PaddingLeft=
UDim.new(0,15)b2.PaddingRight=UDim.new(0,15)b2.Parent=b1 local b3=Instance.new
'TextButton'b3.Name='Interact'b3.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'b3.Text=''b3.TextColor3=Color3.
fromRGB(0,0,0)b3.TextSize=14 b3.BackgroundColor3=Color3.fromRGB(255,255,255)b3.
BackgroundTransparency=1 b3.BorderColor3=Color3.fromRGB(0,0,0)b3.BorderSizePixel
=0 b3.Size=UDim2.new(1,0,0,38)b3.Parent=b1 local b4=Instance.new'TextLabel'b4.
Name='DropdownName'b4.FontFace=Font.new(ao.interFont)b4.Text=bX.Default and(bZ.
Settings.Name..' \u{2022} '..table.concat(b_,', '))or(bZ.Settings.Name..'...')b4
.RichText=true b4.TextColor3=Color3.fromRGB(255,255,255)b4.TextSize=13 b4.
TextTransparency=0.5 b4.TextTruncate=Enum.TextTruncate.SplitWord b4.
TextXAlignment=Enum.TextXAlignment.Left b4.AutomaticSize=Enum.AutomaticSize.Y b4
.BackgroundColor3=Color3.fromRGB(255,255,255)b4.BackgroundTransparency=1 b4.
BorderColor3=Color3.fromRGB(0,0,0)b4.BorderSizePixel=0 b4.Size=UDim2.new(1,-20,0
,38)b4.Parent=b1 local b5=Instance.new'UIStroke'b5.Name='DropdownUIStroke'b5.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border b5.Color=Color3.fromRGB(255,255,255)
b5.Transparency=0.95 b5.Parent=b1 local b6=Instance.new'UICorner'b6.Name=
'DropdownUICorner'b6.CornerRadius=UDim.new(0,6)b6.Parent=b1 local b7=Instance.
new'ImageLabel'b7.Name='DropdownImage'b7.Image=ao.dropdown b7.ImageTransparency=
0.5 b7.AnchorPoint=Vector2.new(1,0)b7.BackgroundColor3=Color3.fromRGB(255,255,
255)b7.BackgroundTransparency=1 b7.BorderColor3=Color3.fromRGB(0,0,0)b7.
BorderSizePixel=0 b7.Position=UDim2.new(1,0,0,12)b7.Size=UDim2.fromOffset(14,14)
b7.Parent=b1 local b8=Instance.new'Frame'b8.Name='DropdownFrame'b8.
BackgroundColor3=Color3.fromRGB(255,255,255)b8.BackgroundTransparency=1 b8.
BorderColor3=Color3.fromRGB(0,0,0)b8.BorderSizePixel=0 b8.ClipsDescendants=true
b8.Size=UDim2.fromScale(1,1)b8.Visible=false b8.AutomaticSize=Enum.AutomaticSize
.Y local b9=Instance.new'UIPadding'b9.Name='DropdownFrameUIPadding'b9.PaddingTop
=UDim.new(0,38)b9.PaddingBottom=UDim.new(0,10)b9.Parent=b8 local ca=Instance.new
'UIListLayout'ca.Name='DropdownFrameUIListLayout'ca.Padding=UDim.new(0,5)ca.
SortOrder=Enum.SortOrder.LayoutOrder ca.Parent=b8 local cb=Instance.new'Frame'cb
.Name='Search'cb.BackgroundColor3=Color3.fromRGB(255,255,255)cb.
BackgroundTransparency=0.95 cb.BorderColor3=Color3.fromRGB(0,0,0)cb.
BorderSizePixel=0 cb.LayoutOrder=-1 cb.Size=UDim2.new(1,0,0,30)cb.Parent=b8 cb.
Visible=bZ.Settings.Search local cc=Instance.new'UICorner'cc.Name=
'SectionUICorner'cc.Parent=cb local cd=Instance.new'ImageLabel'cd.Name=
'SearchIcon'cd.Image=ao.searchIcon cd.ImageColor3=Color3.fromRGB(180,180,180)cd.
AnchorPoint=Vector2.new(0,0.5)cd.BackgroundColor3=Color3.fromRGB(255,255,255)cd.
BackgroundTransparency=1 cd.BorderColor3=Color3.fromRGB(0,0,0)cd.BorderSizePixel
=0 cd.Position=UDim2.fromScale(0,0.5)cd.Size=UDim2.fromOffset(12,12)cd.Parent=cb
local ce=Instance.new'UIPadding'ce.Name='UIPadding'ce.PaddingLeft=UDim.new(0,15)
ce.Parent=cb local cf=Instance.new'TextBox'cf.Name='SearchBox'cf.CursorPosition=
-1 cf.FontFace=Font.new(ao.interFont,Enum.FontWeight.Medium,Enum.FontStyle.
Normal)cf.PlaceholderColor3=Color3.fromRGB(150,150,150)cf.PlaceholderText=
'Search...'cf.Text=''cf.TextColor3=Color3.fromRGB(200,200,200)cf.TextSize=14 cf.
TextXAlignment=Enum.TextXAlignment.Left cf.BackgroundColor3=Color3.fromRGB(255,
255,255)cf.BackgroundTransparency=1 cf.BorderColor3=Color3.fromRGB(0,0,0)cf.
BorderSizePixel=0 cf.Size=UDim2.fromScale(1,1)local cg=function()local cg,ch,ci=
0,0,b9.PaddingTop.Offset+b9.PaddingBottom.Offset for cj,ck in pairs(b8:
GetChildren())do if not ck:IsA'UIComponent'and ck.Visible then cg+=ck.
AbsoluteSize.Y ch+=1 end end local cj=ca.Padding.Offset*(ch-1)return cg+cj+ci
end local ch=function()local ch=cf.Text:lower()for ci,cj in pairs(b0)do local ck
=cj.NameLabel.Text:lower()local cl=string.find(ck,ch)~=nil if cj.Button.Visible
~=cl then cj.Button.Visible=cl end end b1.Size=UDim2.new(1,0,0,cg())end cf:
GetPropertyChangedSignal'Text':Connect(ch)local ci=Instance.new'UIPadding'ci.
Name='UIPadding'ci.PaddingLeft=UDim.new(0,23)ci.Parent=cf cf.Parent=cb local cj=
{duration=0.2,easingStyle=Enum.EasingStyle.Quint,transparencyIn=0.2,
transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-13,waitTime=1}local
ck,cl,cm=function(ck,cl)local cm=b0[ck]if not cm then return end local cn,co=cm.
Checkmark,cm.NameLabel if cl then if bZ.Settings.Multi then if not table.find(b_
,ck)then table.insert(b_,ck)bZ.Value=b_ end else for cp,cq in pairs(b0)do if cp
~=ck then h(cq.Checkmark,TweenInfo.new(cj.duration,cj.easingStyle),{Size=UDim2.
new(cq.Checkmark.Size.X.Scale,cj.checkSizeDecrease,cq.Checkmark.Size.Y.Scale,cq.
Checkmark.Size.Y.Offset)}):Play()h(cq.NameLabel,TweenInfo.new(cj.duration,cj.
easingStyle),{TextTransparency=cj.transparencyOut}):Play()cq.Checkmark.
TextTransparency=1 end end b_={ck}bZ.Value=b_[1]end h(cn,TweenInfo.new(cj.
duration,cj.easingStyle),{Size=UDim2.new(cn.Size.X.Scale,cj.checkSizeIncrease,cn
.Size.Y.Scale,cn.Size.Y.Offset)}):Play()h(co,TweenInfo.new(cj.duration,cj.
easingStyle),{TextTransparency=cj.transparencyIn}):Play()cn.TextTransparency=0
else if bZ.Settings.Multi then local cp=table.find(b_,ck)if cp then table.
remove(b_,cp)end else b_={}end h(cn,TweenInfo.new(cj.duration,cj.easingStyle),{
Size=UDim2.new(cn.Size.X.Scale,cj.checkSizeDecrease,cn.Size.Y.Scale,cn.Size.Y.
Offset)}):Play()h(co,TweenInfo.new(cj.duration,cj.easingStyle),{TextTransparency
=cj.transparencyOut}):Play()cn.TextTransparency=1 end if bX.Required and#b_==0
and not cl then return end if#b_>0 then b4.Text=bZ.Settings.Name..' \u{2022} '..
table.concat(b_,', ')else b4.Text=bZ.Settings.Name..'...'end end,false,false
local cn=function()if cm then return end cm=true local cn,co=38,not cl local cp=
co and UDim2.new(1,0,0,cg())or UDim2.new(1,0,0,cn)local cq,cr=h(b1,TweenInfo.
new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=cp}),h(b7,
TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Rotation=co
and-90 or 0})cq:Play()cr:Play()if co then b8.Visible=true cq.Completed:Connect(
function()cm=false end)else cq.Completed:Connect(function()b8.Visible=false cm=
false end)end cl=co end b3.MouseButton1Click:Connect(cn)local co=function(co,cp)
local cq=Instance.new'TextButton'cq.Name='Option'cq.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'cq.Text=''cq.TextColor3=Color3.
fromRGB(0,0,0)cq.TextSize=14 cq.BackgroundColor3=Color3.fromRGB(255,255,255)cq.
BackgroundTransparency=1 cq.BorderColor3=Color3.fromRGB(0,0,0)cq.BorderSizePixel
=0 cq.Size=UDim2.new(1,0,0,30)local cr=Instance.new'UIPadding'cr.Name=
'OptionUIPadding'cr.PaddingLeft=UDim.new(0,15)cr.Parent=cq local cs=Instance.new
'TextLabel'cs.Name='OptionName'cs.FontFace=Font.new(ao.interFont)cs.Text=cp cs.
RichText=true cs.TextColor3=Color3.fromRGB(255,255,255)cs.TextSize=13 cs.
TextTransparency=0.5 cs.TextTruncate=Enum.TextTruncate.AtEnd cs.TextXAlignment=
Enum.TextXAlignment.Left cs.TextYAlignment=Enum.TextYAlignment.Top cs.
AnchorPoint=Vector2.new(0,0.5)cs.AutomaticSize=Enum.AutomaticSize.XY cs.
BackgroundColor3=Color3.fromRGB(255,255,255)cs.BackgroundTransparency=1 cs.
BorderColor3=Color3.fromRGB(0,0,0)cs.BorderSizePixel=0 cs.Position=UDim2.
fromScale(1.3e-7,0.5)cs.Parent=cq local ct=Instance.new'UIListLayout'ct.Name=
'OptionUIListLayout'ct.Padding=UDim.new(0,10)ct.FillDirection=Enum.FillDirection
.Horizontal ct.SortOrder=Enum.SortOrder.LayoutOrder ct.VerticalAlignment=Enum.
VerticalAlignment.Center ct.Parent=cq local cu=Instance.new'TextLabel'cu.Name=
'Checkmark'cu.FontFace=Font.new(ao.interFont)cu.Text='\u{2713}'cu.TextColor3=
Color3.fromRGB(255,255,255)cu.TextSize=13 cu.TextTransparency=1 cu.
TextXAlignment=Enum.TextXAlignment.Left cu.TextYAlignment=Enum.TextYAlignment.
Top cu.AnchorPoint=Vector2.new(0,0.5)cu.AutomaticSize=Enum.AutomaticSize.Y cu.
BackgroundColor3=Color3.fromRGB(255,255,255)cu.BackgroundTransparency=1 cu.
BorderColor3=Color3.fromRGB(0,0,0)cu.BorderSizePixel=0 cu.LayoutOrder=-1 cu.
Position=UDim2.fromScale(1.3e-7,0.5)cu.Size=UDim2.fromOffset(-10,0)cu.Parent=cq
cq.Parent=b8 b8.Parent=b1 b0[cp]={Index=co,Button=cq,NameLabel=cs,Checkmark=cu}
local cv={duration=0.2,easingStyle=Enum.EasingStyle.Quint,transparencyIn=0.2,
transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-ct.Padding.Offset,
waitTime=1}local cw,cx={checkIn=h(cu,TweenInfo.new(cv.duration,cv.easingStyle),{
Size=UDim2.new(cu.Size.X.Scale,cv.checkSizeIncrease,cu.Size.Y.Scale,cu.Size.Y.
Offset)}),checkOut=h(cu,TweenInfo.new(cv.duration,cv.easingStyle),{Size=UDim2.
new(cu.Size.X.Scale,cv.checkSizeDecrease,cu.Size.Y.Scale,cu.Size.Y.Offset)}),
nameIn=h(cs,TweenInfo.new(cv.duration,cv.easingStyle),{TextTransparency=cv.
transparencyIn}),nameOut=h(cs,TweenInfo.new(cv.duration,cv.easingStyle),{
TextTransparency=cv.transparencyOut})},false if bZ.Settings.Default then if bZ.
Settings.Multi then cx=table.find(bZ.Settings.Default,cp)and true or false else
cx=(bZ.Settings.Default==co)and true or false end end ck(cp,cx)local cy=b0[cp].
Button cy.MouseButton1Click:Connect(function()local cz=table.find(b_,cp)and true
or false local cA=not cz if bZ.Settings.Required and not cA and#b_<=1 then
return end ck(cp,cA)task.spawn(function()if bZ.Settings.Multi then local cB={}
for cC,cD in ipairs(b_)do cB[cD]=true end if bZ.Settings.Callback then bZ.
Settings.Callback(cB)end else if cA and bZ.Settings.Callback then bZ.Settings.
Callback(b_[1]or nil)end end end)end)if cl then b1.Size=UDim2.new(1,0,0,cg())end
end if bZ.Settings.Options then for cp,cr in pairs(bZ.Settings.Options)do co(cp,
cr)end end function bZ:UpdateName(cp)b4.Text=cp end function bZ:SetVisibility(cp
)b1.Visible=cp end function bZ:UpdateSelection(cp)if not cp then return end for
cr,cs in pairs(b0)do ck(cr,false)end local cr={}if type(cp)=='number'then for cs
,ct in pairs(b0)do local cu=ct.Index==cp ck(cs,cu)if cu then table.insert(cr,cs)
end end elseif type(cp)=='string'then for cs,ct in pairs(b0)do local cu=cs==cp
ck(cs,cu)if cu then table.insert(cr,cs)end end elseif type(cp)=='table'then for
cs,ct in pairs(b0)do local cu=table.find(cp,cs)~=nil ck(cs,cu)if cu then table.
insert(cr,cs)end end end if bZ.Settings.Callback then if bZ.Settings.Multi then
local cs={}for ct,cu in ipairs(cr)do cs[cu]=true end bZ.Settings.Callback(cs)
else bZ.Settings.Callback(cr[1]or nil)end end end function bZ:InsertOptions(cp)
if not cp then return end bZ.Settings.Options=cp for cr,cs in pairs(cp)do co(cr,
cs)end end function bZ:ClearOptions()for cp,cr in pairs(b0)do cr.Button:Destroy(
)end b0={}b_={}if cl then b1.Size=UDim2.new(1,0,0,cg())end end function bZ:
GetOptions()local cp={}for cr,cs in pairs(b0)do local ct=table.find(b_,cr)and
true or false cp[cr]=ct end return cp end function bZ:RemoveOptions(cp)if not cp
then return end for cr,cs in ipairs(cp)do local ct=b0[cs]if ct then for cu=#b_,1
,-1 do if b_[cu]==cs then table.remove(b_,cu)end end ct.Button:Destroy()b0[cs]=
nil end end if cl then b1.Size=UDim2.new(1,0,0,cg())end end function bZ:IsOption
(cp)if not cp then return end return b0[cp]~=nil end if bY then aa.Options[bY]=
bZ end return bZ end function bR:Colorpicker(bX,bY)local bZ={Settings=bX,
IgnoreConfig=false,Class='Colorpicker'}local b_=bZ.Settings.Alpha and true or
false bZ.Color=bZ.Settings.Default bZ.Alpha=b_ and bZ.Settings.Alpha local b0=
Instance.new'Frame'b0.Name='Colorpicker'b0.AutomaticSize=Enum.AutomaticSize.Y b0
.BackgroundColor3=Color3.fromRGB(0,0,0)b0.BackgroundTransparency=1 b0.
BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel=0 b0.Size=UDim2.new(1,0,0,
38)b0.Parent=bS local b1=Instance.new'TextLabel'b1.Name='KeybindName'b1.FontFace
=Font.new(ao.interFont)b1.Text=bX.Name b1.TextColor3=Color3.fromRGB(255,255,255)
b1.TextSize=13 b1.TextTransparency=0.5 b1.RichText=true b1.TextTruncate=Enum.
TextTruncate.AtEnd b1.TextXAlignment=Enum.TextXAlignment.Left b1.TextYAlignment=
Enum.TextYAlignment.Top b1.AnchorPoint=Vector2.new(0,0.5)b1.AutomaticSize=Enum.
AutomaticSize.XY b1.BackgroundColor3=Color3.fromRGB(255,255,255)b1.
BackgroundTransparency=1 b1.BorderColor3=Color3.fromRGB(0,0,0)b1.BorderSizePixel
=0 b1.Position=UDim2.fromScale(0,0.5)b1.Parent=b0 local b2=Instance.new
'ImageLabel'b2.Name='NewColor'b2.Image=ao.grid b2.ScaleType=Enum.ScaleType.Tile
b2.TileSize=UDim2.fromOffset(500,500)b2.AnchorPoint=Vector2.new(1,0.5)b2.
BackgroundColor3=Color3.fromRGB(255,255,255)b2.BackgroundTransparency=1 b2.
BorderColor3=Color3.fromRGB(0,0,0)b2.BorderSizePixel=0 b2.Position=UDim2.
fromScale(1,0.5)b2.Size=UDim2.fromOffset(21,21)local b3=Instance.new'Frame'b3.
Name='Color'b3.AnchorPoint=Vector2.new(0.5,0.5)b3.BackgroundColor3=bZ.Color b3.
BorderSizePixel=0 b3.Position=UDim2.fromScale(0.5,0.5)b3.Size=UDim2.fromScale(1,
1)b3.BackgroundTransparency=bZ.Alpha or 0 local b4=Instance.new'UICorner'b4.Name
='UICorner'b4.CornerRadius=UDim.new(0,6)b4.Parent=b3 local b5=Instance.new
'TextButton'b5.Name='Interact'b5.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'b5.Text=''b5.TextColor3=Color3.
fromRGB(0,0,0)b5.TextSize=14 b5.BackgroundColor3=Color3.fromRGB(255,255,255)b5.
BackgroundTransparency=1 b5.BorderColor3=Color3.fromRGB(0,0,0)b5.BorderSizePixel
=0 b5.Size=UDim2.fromScale(1,1)b5.Parent=b3 b3.Parent=b2 local b6=Instance.new
'UICorner'b6.Name='UICorner'b6.CornerRadius=UDim.new(0,8)b6.Parent=b2 b2.Parent=
b0 local b7=Instance.new'Frame'b7.Name='ColorPicker'b7.BackgroundColor3=Color3.
fromRGB(0,0,0)b7.BackgroundTransparency=0.5 b7.BorderColor3=Color3.fromRGB(0,0,0
)b7.BorderSizePixel=0 b7.Size=UDim2.fromScale(1,1)b7.Visible=false local b8=
Instance.new'UICorner'b8.Name='BaseUICorner'b8.CornerRadius=UDim.new(0,10)b8.
Parent=b7 local b9=Instance.new'Frame'b9.Name='Prompt'b9.AnchorPoint=Vector2.
new(0.5,0.5)b9.AutomaticSize=Enum.AutomaticSize.Y b9.BackgroundColor3=Color3.
fromRGB(15,15,15)b9.BorderColor3=Color3.fromRGB(0,0,0)b9.BorderSizePixel=0 b9.
Position=UDim2.fromScale(0.5,0.5)b9.Size=UDim2.fromOffset(420,0)local ca=
Instance.new'UIScale'ca.Name='BaseUIScale'ca.Parent=b9 ca.Scale=0.95 local cb=
Instance.new'UIStroke'cb.Name='GlobalSettingsUIStroke'cb.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cb.Color=Color3.fromRGB(255,255,255)cb.Transparency=0.9
cb.Parent=b9 local cc=Instance.new'UICorner'cc.Name='GlobalSettingsUICorner'cc.
CornerRadius=UDim.new(0,10)cc.Parent=b9 local cd=Instance.new'UIListLayout'cd.
Name='UIListLayout'cd.Padding=UDim.new(0,10)cd.HorizontalAlignment=Enum.
HorizontalAlignment.Center cd.SortOrder=Enum.SortOrder.LayoutOrder cd.Parent=b9
local ce=Instance.new'Frame'ce.Name='ColorOptions'ce.AutomaticSize=Enum.
AutomaticSize.XY ce.BackgroundColor3=Color3.fromRGB(255,255,255)ce.
BackgroundTransparency=1 ce.BorderColor3=Color3.fromRGB(0,0,0)ce.BorderSizePixel
=0 ce.LayoutOrder=1 ce.Size=UDim2.fromScale(1,0)local cf=Instance.new
'TextButton'cf.Name='Value'cf.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'cf.Text=''cf.TextColor3=Color3.
fromRGB(0,0,0)cf.TextSize=14 cf.AutoButtonColor=false cf.BackgroundColor3=Color3
.fromRGB(255,255,255)cf.BorderColor3=Color3.fromRGB(0,0,0)cf.BorderSizePixel=0
cf.LayoutOrder=1 cf.Position=UDim2.fromScale(0.092,0.886)cf.Size=UDim2.new(1,0,0
,15)local cg=Instance.new'UIGradient'cg.Name='UIGradient'cg.Color=ColorSequence.
new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))}cg.Parent=cf local ch=
Instance.new'Frame'ch.Name='Slide'ch.AnchorPoint=Vector2.new(0,0.5)ch.
BackgroundColor3=Color3.fromRGB(255,255,255)ch.BorderColor3=Color3.fromRGB(27,42
,53)ch.BorderSizePixel=0 ch.Position=UDim2.fromScale(0,0.5)ch.Size=UDim2.new(0,
13,1,8)local ci=Instance.new'UICorner'ci.Name='UICorner'ci.CornerRadius=UDim.
new(1,0)ci.Parent=ch local cj=Instance.new'UIStroke'cj.Name='UIStroke'cj.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border cj.Transparency=0.5 cj.Parent=ch ch.
Parent=cf local ck=Instance.new'UICorner'ck.Name='UICorner'ck.CornerRadius=UDim.
new(0,6)ck.Parent=cf local cl=Instance.new'UIStroke'cl.Name='UIStroke'cl.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border cl.Color=Color3.fromRGB(255,255,255)
cl.Transparency=0.9 local cm=Instance.new'UIGradient'cm.Name='UIGradient'cm.
Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255))
,ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))}cm.Rotation=180 cm.Parent=cl
cl.Parent=cf cf.Parent=ce local cn=Instance.new'UIListLayout'cn.Name=
'UIListLayout'cn.Padding=UDim.new(0,25)cn.SortOrder=Enum.SortOrder.LayoutOrder
cn.Parent=ce local co=Instance.new'Frame'co.Name='Wheel'co.AutomaticSize=Enum.
AutomaticSize.Y co.BackgroundColor3=Color3.fromRGB(255,255,255)co.
BackgroundTransparency=1 co.BorderColor3=Color3.fromRGB(0,0,0)co.BorderSizePixel
=0 co.Size=UDim2.new(1,0,0,100)local cp=Instance.new'ImageButton'cp.Name='Wheel'
cp.Image=ao.colorWheel cp.AutoButtonColor=false cp.Active=false cp.
BackgroundColor3=Color3.fromRGB(248,248,248)cp.BackgroundTransparency=1 cp.
BorderColor3=Color3.fromRGB(27,42,53)cp.Selectable=false cp.Size=UDim2.
fromOffset(220,220)cp.SizeConstraint=Enum.SizeConstraint.RelativeYY local cr=
Instance.new'ImageLabel'cr.Name='Target'cr.Image=ao.colorTarget cr.ImageColor3=
Color3.fromRGB(0,0,0)cr.AnchorPoint=Vector2.new(0.5,0.5)cr.BackgroundColor3=
Color3.fromRGB(255,255,255)cr.BackgroundTransparency=1 cr.BorderColor3=Color3.
fromRGB(27,42,53)cr.Position=UDim2.fromScale(0.5,0.5)cr.Size=UDim2.fromOffset(22
,22)cr.SizeConstraint=Enum.SizeConstraint.RelativeYY cr.Parent=cp cp.Parent=co
local cs=Instance.new'Frame'cs.Name='Inputs'cs.AnchorPoint=Vector2.new(1,0.5)cs.
AutomaticSize=Enum.AutomaticSize.XY cs.BackgroundColor3=Color3.fromRGB(255,255,
255)cs.BackgroundTransparency=1 cs.BorderColor3=Color3.fromRGB(0,0,0)cs.
BorderSizePixel=0 cs.LayoutOrder=1 cs.Position=UDim2.fromScale(1,0.5)local ct=
Instance.new'UIListLayout'ct.Name='UIListLayout'ct.Padding=UDim.new(0,5)ct.
SortOrder=Enum.SortOrder.LayoutOrder ct.Parent=cs local cu=Instance.new'Frame'cu
.Name='Red'cu.AutomaticSize=Enum.AutomaticSize.XY cu.BackgroundColor3=Color3.
fromRGB(0,0,0)cu.BackgroundTransparency=1 cu.BorderColor3=Color3.fromRGB(0,0,0)
cu.BorderSizePixel=0 cu.LayoutOrder=1 cu.Size=UDim2.fromOffset(0,38)local cv=
Instance.new'TextLabel'cv.Name='InputName'cv.FontFace=Font.new(ao.interFont)cv.
Text='Red'cv.TextColor3=Color3.fromRGB(255,255,255)cv.TextSize=13 cv.
TextTransparency=0.5 cv.TextTruncate=Enum.TextTruncate.AtEnd cv.TextXAlignment=
Enum.TextXAlignment.Left cv.TextYAlignment=Enum.TextYAlignment.Top cv.
AnchorPoint=Vector2.new(0,0.5)cv.AutomaticSize=Enum.AutomaticSize.XY cv.
BackgroundColor3=Color3.fromRGB(255,255,255)cv.BackgroundTransparency=1 cv.
BorderColor3=Color3.fromRGB(0,0,0)cv.BorderSizePixel=0 cv.LayoutOrder=2 cv.
Position=UDim2.fromScale(0,0.5)cv.Parent=cu local cw=Instance.new'UIListLayout'
cw.Name='UIListLayout'cw.Padding=UDim.new(0,15)cw.FillDirection=Enum.
FillDirection.Horizontal cw.SortOrder=Enum.SortOrder.LayoutOrder cw.
VerticalAlignment=Enum.VerticalAlignment.Center cw.Parent=cu local cx=Instance.
new'TextBox'cx.Name='InputBox'cx.ClearTextOnFocus=false cx.CursorPosition=-1 cx.
FontFace=Font.new(ao.interFont)cx.Text='255'cx.TextColor3=Color3.fromRGB(255,255
,255)cx.TextSize=12 cx.TextTransparency=0.1 cx.TextXAlignment=Enum.
TextXAlignment.Left cx.AnchorPoint=Vector2.new(1,0.5)cx.BackgroundColor3=Color3.
fromRGB(255,255,255)cx.BackgroundTransparency=0.95 cx.BorderColor3=Color3.
fromRGB(0,0,0)cx.BorderSizePixel=0 cx.ClipsDescendants=true cx.LayoutOrder=1 cx.
Position=UDim2.fromScale(1,0.5)cx.Size=UDim2.fromOffset(75,25)local cy=Instance.
new'UICorner'cy.Name='InputBoxUICorner'cy.CornerRadius=UDim.new(0,4)cy.Parent=cx
local cz=Instance.new'UIStroke'cz.Name='InputBoxUIStroke'cz.ApplyStrokeMode=Enum
.ApplyStrokeMode.Border cz.Color=Color3.fromRGB(255,255,255)cz.Transparency=0.9
cz.Parent=cx local cA=Instance.new'UISizeConstraint'cA.Name=
'InputBoxUISizeConstraint'cA.Parent=cx local cB=Instance.new'UIPadding'cB.Name=
'InputBoxUIPadding'cB.PaddingLeft=UDim.new(0,8)cB.PaddingRight=UDim.new(0,10)cB.
Parent=cx cx.Parent=cu cu.Parent=cs local cC=Instance.new'Frame'cC.Name='Green'
cC.AutomaticSize=Enum.AutomaticSize.XY cC.BackgroundColor3=Color3.fromRGB(0,0,0)
cC.BackgroundTransparency=1 cC.BorderColor3=Color3.fromRGB(0,0,0)cC.
BorderSizePixel=0 cC.LayoutOrder=2 cC.Size=UDim2.fromOffset(0,38)local cD=
Instance.new'TextLabel'cD.Name='InputName'cD.FontFace=Font.new(ao.interFont)cD.
Text='Green'cD.TextColor3=Color3.fromRGB(255,255,255)cD.TextSize=13 cD.
TextTransparency=0.5 cD.TextTruncate=Enum.TextTruncate.AtEnd cD.TextXAlignment=
Enum.TextXAlignment.Left cD.TextYAlignment=Enum.TextYAlignment.Top cD.
AnchorPoint=Vector2.new(0,0.5)cD.AutomaticSize=Enum.AutomaticSize.XY cD.
BackgroundColor3=Color3.fromRGB(255,255,255)cD.BackgroundTransparency=1 cD.
BorderColor3=Color3.fromRGB(0,0,0)cD.BorderSizePixel=0 cD.LayoutOrder=2 cD.
Position=UDim2.fromScale(0,0.5)cD.Parent=cC local cE=Instance.new'UIListLayout'
cE.Name='UIListLayout'cE.Padding=UDim.new(0,15)cE.FillDirection=Enum.
FillDirection.Horizontal cE.SortOrder=Enum.SortOrder.LayoutOrder cE.
VerticalAlignment=Enum.VerticalAlignment.Center cE.Parent=cC local cF=Instance.
new'TextBox'cF.Name='InputBox'cF.ClearTextOnFocus=false cF.FontFace=Font.new(ao.
interFont)cF.Text='255'cF.TextColor3=Color3.fromRGB(255,255,255)cF.TextSize=12
cF.TextTransparency=0.1 cF.TextXAlignment=Enum.TextXAlignment.Left cF.
AnchorPoint=Vector2.new(1,0.5)cF.BackgroundColor3=Color3.fromRGB(255,255,255)cF.
BackgroundTransparency=0.95 cF.BorderColor3=Color3.fromRGB(0,0,0)cF.
BorderSizePixel=0 cF.ClipsDescendants=true cF.LayoutOrder=1 cF.Position=UDim2.
fromScale(1,0.5)cF.Size=UDim2.fromOffset(75,25)local cG=Instance.new'UICorner'cG
.Name='InputBoxUICorner'cG.CornerRadius=UDim.new(0,4)cG.Parent=cF local cH=
Instance.new'UIStroke'cH.Name='InputBoxUIStroke'cH.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cH.Color=Color3.fromRGB(255,255,255)cH.Transparency=0.9
cH.Parent=cF local cI=Instance.new'UISizeConstraint'cI.Name=
'InputBoxUISizeConstraint'cI.Parent=cF local cJ=Instance.new'UIPadding'cJ.Name=
'InputBoxUIPadding'cJ.PaddingLeft=UDim.new(0,8)cJ.PaddingRight=UDim.new(0,10)cJ.
Parent=cF cF.Parent=cC cC.Parent=cs local cK=Instance.new'Frame'cK.Name='Blue'cK
.AutomaticSize=Enum.AutomaticSize.XY cK.BackgroundColor3=Color3.fromRGB(0,0,0)cK
.BackgroundTransparency=1 cK.BorderColor3=Color3.fromRGB(0,0,0)cK.
BorderSizePixel=0 cK.LayoutOrder=3 cK.Size=UDim2.fromOffset(0,38)local cL=
Instance.new'TextLabel'cL.Name='InputName'cL.FontFace=Font.new(ao.interFont)cL.
Text='Blue'cL.TextColor3=Color3.fromRGB(255,255,255)cL.TextSize=13 cL.
TextTransparency=0.5 cL.TextTruncate=Enum.TextTruncate.AtEnd cL.TextXAlignment=
Enum.TextXAlignment.Left cL.TextYAlignment=Enum.TextYAlignment.Top cL.
AnchorPoint=Vector2.new(0,0.5)cL.AutomaticSize=Enum.AutomaticSize.XY cL.
BackgroundColor3=Color3.fromRGB(255,255,255)cL.BackgroundTransparency=1 cL.
BorderColor3=Color3.fromRGB(0,0,0)cL.BorderSizePixel=0 cL.LayoutOrder=2 cL.
Position=UDim2.fromScale(0,0.5)cL.Parent=cK local cM=Instance.new'UIListLayout'
cM.Name='UIListLayout'cM.Padding=UDim.new(0,15)cM.FillDirection=Enum.
FillDirection.Horizontal cM.SortOrder=Enum.SortOrder.LayoutOrder cM.
VerticalAlignment=Enum.VerticalAlignment.Center cM.Parent=cK local cN=Instance.
new'TextBox'cN.Name='InputBox'cN.ClearTextOnFocus=false cN.FontFace=Font.new(ao.
interFont)cN.Text='255'cN.TextColor3=Color3.fromRGB(255,255,255)cN.TextSize=12
cN.TextTransparency=0.1 cN.TextXAlignment=Enum.TextXAlignment.Left cN.
AnchorPoint=Vector2.new(1,0.5)cN.BackgroundColor3=Color3.fromRGB(255,255,255)cN.
BackgroundTransparency=0.95 cN.BorderColor3=Color3.fromRGB(0,0,0)cN.
BorderSizePixel=0 cN.ClipsDescendants=true cN.LayoutOrder=1 cN.Position=UDim2.
fromScale(1,0.5)cN.Size=UDim2.fromOffset(75,25)local cO=Instance.new'UICorner'cO
.Name='InputBoxUICorner'cO.CornerRadius=UDim.new(0,4)cO.Parent=cN local cP=
Instance.new'UIStroke'cP.Name='InputBoxUIStroke'cP.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cP.Color=Color3.fromRGB(255,255,255)cP.Transparency=0.9
cP.Parent=cN local cQ=Instance.new'UISizeConstraint'cQ.Name=
'InputBoxUISizeConstraint'cQ.Parent=cN local cR=Instance.new'UIPadding'cR.Name=
'InputBoxUIPadding'cR.PaddingLeft=UDim.new(0,8)cR.PaddingRight=UDim.new(0,10)cR.
Parent=cN cN.Parent=cK cK.Parent=cs local cS=Instance.new'Frame'cS.Name='Alpha'
cS.AutomaticSize=Enum.AutomaticSize.XY cS.BackgroundColor3=Color3.fromRGB(0,0,0)
cS.BackgroundTransparency=1 cS.BorderColor3=Color3.fromRGB(0,0,0)cS.
BorderSizePixel=0 cS.LayoutOrder=4 cS.Size=UDim2.fromOffset(0,38)cS.Visible=b_
local cT=Instance.new'TextLabel'cT.Name='InputName'cT.FontFace=Font.new(ao.
interFont)cT.Text='Alpha'cT.TextColor3=Color3.fromRGB(255,255,255)cT.TextSize=13
cT.TextTransparency=0.5 cT.TextTruncate=Enum.TextTruncate.AtEnd cT.
TextXAlignment=Enum.TextXAlignment.Left cT.TextYAlignment=Enum.TextYAlignment.
Top cT.AnchorPoint=Vector2.new(0,0.5)cT.AutomaticSize=Enum.AutomaticSize.XY cT.
BackgroundColor3=Color3.fromRGB(255,255,255)cT.BackgroundTransparency=1 cT.
BorderColor3=Color3.fromRGB(0,0,0)cT.BorderSizePixel=0 cT.LayoutOrder=2 cT.
Position=UDim2.fromScale(0,0.5)cT.Parent=cS local cU=Instance.new'UIListLayout'
cU.Name='UIListLayout'cU.Padding=UDim.new(0,15)cU.FillDirection=Enum.
FillDirection.Horizontal cU.SortOrder=Enum.SortOrder.LayoutOrder cU.
VerticalAlignment=Enum.VerticalAlignment.Center cU.Parent=cS local cV=Instance.
new'TextBox'cV.Name='InputBox'cV.ClearTextOnFocus=false cV.FontFace=Font.new(ao.
interFont)cV.Text='0'cV.TextColor3=Color3.fromRGB(255,255,255)cV.TextSize=12 cV.
TextTransparency=0.1 cV.TextXAlignment=Enum.TextXAlignment.Left cV.AnchorPoint=
Vector2.new(1,0.5)cV.BackgroundColor3=Color3.fromRGB(255,255,255)cV.
BackgroundTransparency=0.95 cV.BorderColor3=Color3.fromRGB(0,0,0)cV.
BorderSizePixel=0 cV.ClipsDescendants=true cV.LayoutOrder=1 cV.Position=UDim2.
fromScale(1,0.5)cV.Size=UDim2.fromOffset(75,25)local cW=Instance.new'UICorner'cW
.Name='InputBoxUICorner'cW.CornerRadius=UDim.new(0,4)cW.Parent=cV local cX=
Instance.new'UIStroke'cX.Name='InputBoxUIStroke'cX.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cX.Color=Color3.fromRGB(255,255,255)cX.Transparency=0.9
cX.Parent=cV local cY=Instance.new'UISizeConstraint'cY.Name=
'InputBoxUISizeConstraint'cY.Parent=cV local cZ=Instance.new'UIPadding'cZ.Name=
'InputBoxUIPadding'cZ.PaddingLeft=UDim.new(0,8)cZ.PaddingRight=UDim.new(0,10)cZ.
Parent=cV cV.Parent=cS cS.Parent=cs local c_=Instance.new'Frame'c_.Name='Hex'c_.
AutomaticSize=Enum.AutomaticSize.XY c_.BackgroundColor3=Color3.fromRGB(0,0,0)c_.
BackgroundTransparency=1 c_.BorderColor3=Color3.fromRGB(0,0,0)c_.BorderSizePixel
=0 c_.Size=UDim2.fromOffset(0,38)local c0=Instance.new'TextLabel'c0.Name=
'InputName'c0.FontFace=Font.new(ao.interFont)c0.Text='Hex'c0.TextColor3=Color3.
fromRGB(255,255,255)c0.TextSize=13 c0.TextTransparency=0.5 c0.TextTruncate=Enum.
TextTruncate.AtEnd c0.TextXAlignment=Enum.TextXAlignment.Left c0.TextYAlignment=
Enum.TextYAlignment.Top c0.AnchorPoint=Vector2.new(0,0.5)c0.AutomaticSize=Enum.
AutomaticSize.XY c0.BackgroundColor3=Color3.fromRGB(255,255,255)c0.
BackgroundTransparency=1 c0.BorderColor3=Color3.fromRGB(0,0,0)c0.BorderSizePixel
=0 c0.LayoutOrder=2 c0.Position=UDim2.fromScale(0,0.5)c0.Parent=c_ local c1=
Instance.new'UIListLayout'c1.Name='UIListLayout'c1.Padding=UDim.new(0,15)c1.
FillDirection=Enum.FillDirection.Horizontal c1.SortOrder=Enum.SortOrder.
LayoutOrder c1.VerticalAlignment=Enum.VerticalAlignment.Center c1.Parent=c_
local c2=Instance.new'TextBox'c2.Name='InputBox'c2.ClearTextOnFocus=false c2.
CursorPosition=-1 c2.FontFace=Font.new(ao.interFont)c2.Text='255'c2.TextColor3=
Color3.fromRGB(255,255,255)c2.TextSize=12 c2.TextTransparency=0.1 c2.
TextXAlignment=Enum.TextXAlignment.Left c2.AnchorPoint=Vector2.new(1,0.5)c2.
BackgroundColor3=Color3.fromRGB(255,255,255)c2.BackgroundTransparency=0.95 c2.
BorderColor3=Color3.fromRGB(0,0,0)c2.BorderSizePixel=0 c2.ClipsDescendants=true
c2.LayoutOrder=1 c2.Position=UDim2.fromScale(1,0.5)c2.Size=UDim2.fromOffset(75,
25)local c3=Instance.new'UICorner'c3.Name='InputBoxUICorner'c3.CornerRadius=UDim
.new(0,4)c3.Parent=c2 local c4=Instance.new'UIStroke'c4.Name='InputBoxUIStroke'
c4.ApplyStrokeMode=Enum.ApplyStrokeMode.Border c4.Color=Color3.fromRGB(255,255,
255)c4.Transparency=0.9 c4.Parent=c2 local c5=Instance.new'UISizeConstraint'c5.
Name='InputBoxUISizeConstraint'c5.Parent=c2 local c6=Instance.new'UIPadding'c6.
Name='InputBoxUIPadding'c6.PaddingLeft=UDim.new(0,8)c6.PaddingRight=UDim.new(0,
10)c6.Parent=c2 c2.Parent=c_ c_.Parent=cs cs.Parent=co local c7=Instance.new
'UIPadding'c7.Name='UIPadding'c7.PaddingRight=UDim.new(0,5)c7.Parent=co co.
Parent=ce local c8=Instance.new'Frame'c8.Name='ColorWells'c8.AutomaticSize=Enum.
AutomaticSize.Y c8.BackgroundColor3=Color3.fromRGB(255,255,255)c8.
BackgroundTransparency=1 c8.BorderColor3=Color3.fromRGB(0,0,0)c8.BorderSizePixel
=0 c8.LayoutOrder=2 c8.Size=UDim2.fromScale(1,0)local c9=Instance.new
'UIGridLayout'c9.Name='UIGridLayout'c9.CellPadding=UDim2.fromOffset(10,0)c9.
CellSize=UDim2.new(0.5,-5,0,30)c9.SortOrder=Enum.SortOrder.LayoutOrder c9.Parent
=c8 local da=Instance.new'ImageLabel'da.Name='NewColor'da.Image=ao.grid da.
ScaleType=Enum.ScaleType.Tile da.TileSize=UDim2.fromOffset(500,500)da.
BackgroundColor3=Color3.fromRGB(255,255,255)da.BackgroundTransparency=1 da.
BorderColor3=Color3.fromRGB(0,0,0)da.BorderSizePixel=0 da.Size=UDim2.fromOffset(
100,100)local db=Instance.new'UICorner'db.Name='UICorner'db.Parent=da local dc=
Instance.new'Frame'dc.Name='Color'dc.AnchorPoint=Vector2.new(0.5,0.5)dc.
BorderColor3=Color3.fromRGB(27,42,53)dc.BorderSizePixel=0 dc.Position=UDim2.
fromScale(0.5,0.5)dc.Size=UDim2.new(1,1,1,1)local dd=Instance.new'UICorner'dd.
Name='UICorner'dd.Parent=dc dc.Parent=da da.Parent=c8 local de=Instance.new
'ImageLabel'de.Name='OldColor'de.Image=ao.grid de.ScaleType=Enum.ScaleType.Tile
de.TileSize=UDim2.fromOffset(500,500)de.BackgroundColor3=Color3.fromRGB(255,255,
255)de.BackgroundTransparency=1 de.BorderColor3=Color3.fromRGB(0,0,0)de.
BorderSizePixel=0 de.LayoutOrder=1 de.Size=UDim2.fromOffset(100,100)local df=
Instance.new'UICorner'df.Name='UICorner'df.Parent=de local dg=Instance.new
'Frame'dg.Name='Color'dg.AnchorPoint=Vector2.new(0.5,0.5)dg.BorderColor3=Color3.
fromRGB(27,42,53)dg.BorderSizePixel=0 dg.Position=UDim2.fromScale(0.5,0.5)dg.
Size=UDim2.new(1,1,1,1)local dh=Instance.new'UICorner'dh.Name='UICorner'dh.
Parent=dg dg.Parent=de de.Parent=c8 c8.Parent=ce ce.Parent=b9 local di=Instance.
new'Frame'di.Name='Interactions'di.AutomaticSize=Enum.AutomaticSize.Y di.
BackgroundColor3=Color3.fromRGB(0,0,0)di.BackgroundTransparency=1 di.
BorderColor3=Color3.fromRGB(0,0,0)di.BorderSizePixel=0 di.LayoutOrder=2 di.Size=
UDim2.fromScale(1,0)local dj=Instance.new'UIListLayout'dj.Name='UIListLayout'dj.
Padding=UDim.new(0,10)dj.SortOrder=Enum.SortOrder.LayoutOrder dj.Parent=di local
dk=Instance.new'TextButton'dk.Name='Confirm'dk.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.Medium,Enum.FontStyle.Normal)dk.Text=
'Confirm'dk.TextColor3=Color3.fromRGB(255,255,255)dk.TextSize=15 dk.
TextTransparency=0.5 dk.TextTruncate=Enum.TextTruncate.AtEnd dk.AutoButtonColor=
false dk.AutomaticSize=Enum.AutomaticSize.Y dk.BackgroundColor3=Color3.fromRGB(
25,25,25)dk.BorderColor3=Color3.fromRGB(0,0,0)dk.BorderSizePixel=0 dk.Size=UDim2
.fromScale(1,0)local dl=Instance.new'UIPadding'dl.Name='UIPadding'dl.
PaddingBottom=UDim.new(0,9)dl.PaddingLeft=UDim.new(0,10)dl.PaddingRight=UDim.
new(0,10)dl.PaddingTop=UDim.new(0,9)dl.Parent=dk local dm=Instance.new'UICorner'
dm.Name='BaseUICorner'dm.CornerRadius=UDim.new(0,10)dm.Parent=dk dk.Parent=di
local dn=Instance.new'TextButton'dn.Name='Cancel'dn.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.Medium,Enum.FontStyle.Normal)dn.Text=
'Cancel'dn.TextColor3=Color3.fromRGB(255,255,255)dn.TextSize=15 dn.
TextTransparency=0.5 dn.TextTruncate=Enum.TextTruncate.AtEnd dn.AutoButtonColor=
false dn.AutomaticSize=Enum.AutomaticSize.Y dn.BackgroundColor3=Color3.fromRGB(
25,25,25)dn.BorderColor3=Color3.fromRGB(0,0,0)dn.BorderSizePixel=0 dn.Size=UDim2
.fromScale(1,0)local dp=Instance.new'UICorner'dp.Name='BaseUICorner'dp.
CornerRadius=UDim.new(0,10)dp.Parent=dn local dq=Instance.new'UIPadding'dq.Name=
'UIPadding'dq.PaddingBottom=UDim.new(0,9)dq.PaddingLeft=UDim.new(0,10)dq.
PaddingRight=UDim.new(0,10)dq.PaddingTop=UDim.new(0,9)dq.Parent=dn dn.Parent=di
local dr=Instance.new'UIPadding'dr.Name='UIPadding'dr.PaddingTop=UDim.new(0,10)
dr.Parent=di di.Parent=b9 local ds=Instance.new'UIPadding'ds.Name=
'GlobalSettingsUIPadding'ds.PaddingBottom=UDim.new(0,20)ds.PaddingLeft=UDim.new(
0,20)ds.PaddingRight=UDim.new(0,20)ds.PaddingTop=UDim.new(0,20)ds.Parent=b9
local dt=Instance.new'Frame'dt.Name='Paragraph'dt.AutomaticSize=Enum.
AutomaticSize.Y dt.BackgroundColor3=Color3.fromRGB(0,0,0)dt.
BackgroundTransparency=1 dt.BorderColor3=Color3.fromRGB(0,0,0)dt.BorderSizePixel
=0 dt.Size=UDim2.fromScale(1,0)local du=Instance.new'TextLabel'du.Name=
'ParagraphHeader'du.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight
.SemiBold,Enum.FontStyle.Normal)du.RichText=true du.Text=bZ.Settings.Name du.
TextColor3=Color3.fromRGB(255,255,255)du.TextSize=18 du.TextTransparency=0.4 du.
TextWrapped=true du.TextYAlignment=Enum.TextYAlignment.Top du.AutomaticSize=Enum
.AutomaticSize.XY du.BackgroundColor3=Color3.fromRGB(255,255,255)du.
BackgroundTransparency=1 du.BorderColor3=Color3.fromRGB(0,0,0)du.BorderSizePixel
=0 du.Size=UDim2.fromScale(1,0)du.Parent=dt local dv=Instance.new'UIListLayout'
dv.Name='UIListLayout'dv.Padding=UDim.new(0,15)dv.HorizontalAlignment=Enum.
HorizontalAlignment.Center dv.SortOrder=Enum.SortOrder.LayoutOrder dv.Parent=dt
local dw=Instance.new'UIPadding'dw.Name='UIPadding'dw.PaddingBottom=UDim.new(0,
15)dw.Parent=dt local dx=Instance.new'Frame'dx.Name='Line'dx.BackgroundColor3=
Color3.fromRGB(255,255,255)dx.BackgroundTransparency=0.9 dx.BorderColor3=Color3.
fromRGB(0,0,0)dx.BorderSizePixel=0 dx.LayoutOrder=1 dx.Size=UDim2.new(1,0,0,1)dx
.Parent=dt dt.Parent=b9 b9.Parent=b7 b7.Parent=o local dy,dz,dA,dB,dC,dD,dE,dF,
dG,dH,dI,dJ,dK,dL,dM,dN,dO,dP,dQ=Color3.fromHSV,Color3.fromRGB,Vector2.new,UDim2
.new,cp,cr,cf,dc,{Hex=c_.InputBox,Red=cu.InputBox,Green=cC.InputBox,Blue=cK.
InputBox,Alpha=cS.InputBox},ak:GetMouse(),false,false,0,0,1,function(dy)return
math.atan2(dy.y,dy.x),dy.magnitude end,function(dy)return((dy+math.pi)/(2*math.
pi))*360 end,function(dy)return dy*(math.pi/180)end,function(dy)dy=dy:gsub('#',
'')if#dy~=6 then return 0,0,0 end local dz,dA,dB=tonumber(dy:sub(1,2),16)or 0,
tonumber(dy:sub(3,4),16)or 0,tonumber(dy:sub(5,6),16)or 0 return dz,dA,dB end
local dR=function(dR,dS,dT)local dU=tonumber(dR)if dU then return math.clamp(dU,
dS,dT)end return dS end local dS=function()local dS=dy(dK,dL,dM)dF.
BackgroundColor3=dS dF.BackgroundTransparency=dR(dG.Alpha.Text,0,1)dG.Red.Text=
tostring(math.floor(dS.r*255+0.5))dG.Green.Text=tostring(math.floor(dS.g*255+0.5
))dG.Blue.Text=tostring(math.floor(dS.b*255+0.5))dG.Alpha.Text=dR(dG.Alpha.Text,
0,1)local dT=string.format('#%02X%02X%02X',math.floor(dS.r*255+0.5),math.floor(
dS.g*255+0.5),math.floor(dS.b*255+0.5))dG.Hex.Text=dT end local dT,dU,dV,dW=
function(dT)local dU=dT-dE.AbsolutePosition.X local dV=math.clamp(dU,0,dE.
AbsoluteSize.X-ch.AbsoluteSize.X)ch.Position=dB(0,dV,0.5,0)dM=1-(dV/(dE.
AbsoluteSize.X-ch.AbsoluteSize.X))dS()end,function(dT,dU)local dV,dW=dC.
AbsoluteSize.x/2,dA(dT,dU)-dC.AbsolutePosition-dC.AbsoluteSize/2 if dW:Dot(dW)>
dV*dV then dW=dW.unit*dV end dD.Position=dB(0.5,dW.x,0.5,dW.y)local dX,dY=dN(dW*
dA(1,-1))dK,dL=dO(dX)/360,math.clamp(dY/dV,0,1)dE.BackgroundColor3=dy(dK,dL,1)
dS()end,function(dT)local dU=(1-dT)*(dE.AbsoluteSize.X-ch.AbsoluteSize.X)ch.
Position=UDim2.new(0,dU,0.5,0)end,function(dT,dU)local dV,dW=dC.AbsoluteSize.X/2
,dP(dT*360)local dX=dU*dV local dY,dZ=dX*math.cos(dW),dX*math.sin(dW)dD.Position
=UDim2.new(0.5,-dY,0.5,dZ)dE.BackgroundColor3=dy(dT,dU,1)end local dX,dY,dZ=
function()local dX,dY,dZ=dR(dG.Red.Text,0,255),dR(dG.Green.Text,0,255),dR(dG.
Blue.Text,0,255)dG.Red.Text=dX dG.Green.Text=dY dG.Blue.Text=dZ dK,dL,dM=Color3.
fromRGB(dX,dY,dZ):ToHSV()dV(dM)dW(dK,dL)dS()end,function()local dX=dG.Hex.Text
local dY,dZ,d_=dQ(dX)dY=dR(dY,0,255)dZ=dR(dZ,0,255)d_=dR(d_,0,255)dG.Red.Text=dY
dG.Green.Text=dZ dG.Blue.Text=d_ dK,dL,dM=Color3.fromRGB(dY,dZ,d_):ToHSV()dV(dM)
dW(dK,dL)dS()end,function()local dX,dY,dZ=math.floor(bZ.Color.R*255+0.5),math.
floor(bZ.Color.G*255+0.5),math.floor(bZ.Color.B*255+0.5)dG.Red.Text=dX dG.Green.
Text=dY dG.Blue.Text=dZ dG.Alpha.Text=b_ and bZ.Alpha or 0 local d_=string.
format('#%02X%02X%02X',dX,dY,dZ)dG.Hex.Text=d_ dK,dL,dM=Color3.fromRGB(dX,dY,dZ)
:ToHSV()dg.BackgroundColor3=bZ.Color dg.BackgroundTransparency=b_ and bZ.Alpha
or 0 dF.BackgroundColor3=Color3.fromRGB(dX,dY,dZ)dF.BackgroundTransparency=b_
and bZ.Alpha or 0 dV(dM)dW(dK,dL)end dC.InputBegan:Connect(function(d_)if d_.
UserInputType==Enum.UserInputType.MouseButton1 or d_.UserInputType==Enum.
UserInputType.Touch then dI=true dU(dH.X,dH.Y)end end)dE.InputBegan:Connect(
function(d_)if d_.UserInputType==Enum.UserInputType.MouseButton1 or d_.
UserInputType==Enum.UserInputType.Touch then dJ=true dT(dH.X)end end)dE.
InputEnded:Connect(function(d_)if d_.UserInputType==Enum.UserInputType.
MouseButton1 or d_.UserInputType==Enum.UserInputType.Touch then dJ=false end end
)dC.InputEnded:Connect(function(d_)if d_.UserInputType==Enum.UserInputType.
MouseButton1 or d_.UserInputType==Enum.UserInputType.Touch then dI=false end end
)af.InputChanged:Connect(function(d_)if d_.UserInputType==Enum.UserInputType.
MouseMovement or d_.UserInputType==Enum.UserInputType.Touch then if dJ then dT(
dH.X)elseif dI then dU(dH.X,dH.Y)end end end)local d_=function(d_)local d0=d_.
Text d_.Text=''d_.PlaceholderText=d0 end dG.Hex.FocusLost:Connect(dY)dG.Red.
FocusLost:Connect(dX)dG.Green.FocusLost:Connect(dX)dG.Blue.FocusLost:Connect(dX)
dG.Alpha.FocusLost:Connect(dS)dG.Hex.Focused:Connect(function()d_(dG.Hex)end)dG.
Red.Focused:Connect(function()d_(dG.Red)end)dG.Green.Focused:Connect(function()
d_(dG.Green)end)dG.Blue.Focused:Connect(function()d_(dG.Blue)end)dG.Alpha.
Focused:Connect(function()d_(dG.Alpha)end)local d0=function()local d0=Instance.
new'CanvasGroup'd0.Name='ColorPickerCanvas'd0.BackgroundTransparency=1 d0.
BorderSizePixel=0 d0.Size=UDim2.fromScale(1,1)d0.ZIndex=5 d0.GroupTransparency=1
d0.Parent=o d0.Visible=false return d0 end local d1=function(d1)local d2,d3,d4,
d5,d6=d0(),d1 and 0 or 1,d1 and 1 or 0.95,d1 and 1 or 0,TweenInfo.new(0.1,Enum.
EasingStyle.Sine)local d7,d8=h(d2,d6,{GroupTransparency=d3}),h(ca,d6,{Scale=d4})
b7.Visible=true b7.Parent=d2 d2.Visible=true d2.GroupTransparency=d5 d7:Play()d8
:Play()d7.Completed:Wait()if not d1 then b7.Visible=false d2.Visible=false end
b7.Parent=o d2:Destroy()end local d2,d3=function()d1(true)end,function()d1(false
)end b5.MouseButton1Click:Connect(d2)dn.MouseButton1Click:Connect(d3)dk.
MouseButton1Click:Connect(function()d3()local d4=dy(dK,dL,dM)bZ.Color=Color3.
fromRGB(d4.r*255,d4.g*255,d4.b*255)bZ.Alpha=b_ and dR(dG.Alpha.Text,0,1)dg.
BackgroundColor3=bZ.Color dg.BackgroundTransparency=b_ and bZ.Alpha or 0 b3.
BackgroundColor3=bZ.Color b3.BackgroundTransparency=b_ and bZ.Alpha or 0 if bZ.
Settings.Callback then task.spawn(function()bZ.Settings.Callback(bZ.Color,b_ and
bZ.Alpha)end)end end)dZ()function bZ:UpdateName(d4)b1.Text=d4 end function bZ:
SetVisibility(d4)b0.Visible=d4 end function bZ:SetColor(d4)bZ.Color=d4 b3.
BackgroundColor3=d4 local d5,d6,d7=math.floor(bZ.Color.R*255+0.5),math.floor(bZ.
Color.G*255+0.5),math.floor(bZ.Color.B*255+0.5)dG.Red.Text=d5 dG.Green.Text=d6
dG.Blue.Text=d7 local d8=string.format('#%02X%02X%02X',d5,d6,d7)dG.Hex.Text=d8
dK,dL,dM=Color3.fromRGB(d5,d6,d7):ToHSV()dg.BackgroundColor3=bZ.Color dF.
BackgroundColor3=Color3.fromRGB(d5,d6,d7)dV(dM)dW(dK,dL)if bZ.Settings.Callback
then task.spawn(function()bZ.Settings.Callback(bZ.Color,b_ and bZ.Alpha)end)end
end function bZ:SetAlpha(d4)bZ.Alpha=d4 b3.Transparency=d4 dZ()end if bY then aa
.Options[bY]=bZ end return bZ end function bR:Header(bX,bY)local bZ,b_={Settings
=bX},Instance.new'Frame'b_.Name='Header'b_.AutomaticSize=Enum.AutomaticSize.Y b_
.BackgroundColor3=Color3.fromRGB(0,0,0)b_.BackgroundTransparency=1 b_.
BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel=0 b_.LayoutOrder=0 b_.Size=
UDim2.fromScale(1,0)b_.Parent=bS local b0=Instance.new'UIPadding'b0.Name=
'UIPadding'b0.PaddingBottom=UDim.new(0,5)b0.Parent=b_ local b1=Instance.new
'TextLabel'b1.Name='HeaderText'b1.FontFace=Font.new(ao.interFont,Enum.FontWeight
.Medium,Enum.FontStyle.Normal)b1.RichText=true b1.Text=bZ.Settings.Text or bZ.
Settings.Name b1.TextColor3=Color3.fromRGB(255,255,255)b1.TextSize=16 b1.
TextTransparency=0.3 b1.TextWrapped=true b1.TextXAlignment=Enum.TextXAlignment.
Left b1.AutomaticSize=Enum.AutomaticSize.Y b1.BackgroundColor3=Color3.fromRGB(
255,255,255)b1.BackgroundTransparency=1 b1.BorderColor3=Color3.fromRGB(0,0,0)b1.
BorderSizePixel=0 b1.Size=UDim2.fromScale(1,0)b1.Parent=b_ function bZ:
UpdateName(b2)b1.Text=b2 end function bZ:SetVisibility(b2)b_.Visible=b2 end if
bY then aa.Options[bY]=bZ end return bZ end function bR:Label(bX,bY)local bZ,b_=
{Settings=bX},Instance.new'Frame'b_.Name='Label'b_.AutomaticSize=Enum.
AutomaticSize.Y b_.BackgroundColor3=Color3.fromRGB(0,0,0)b_.
BackgroundTransparency=1 b_.BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel
=0 b_.Size=UDim2.new(1,0,0,38)b_.Parent=bS local b0=Instance.new'TextLabel'b0.
Name='LabelText'b0.FontFace=Font.new(ao.interFont)b0.RichText=true b0.Text=bZ.
Settings.Text or bZ.Settings.Name b0.TextColor3=Color3.fromRGB(255,255,255)b0.
TextSize=13 b0.TextTransparency=0.5 b0.TextWrapped=true b0.TextXAlignment=Enum.
TextXAlignment.Left b0.AutomaticSize=Enum.AutomaticSize.Y b0.BackgroundColor3=
Color3.fromRGB(255,255,255)b0.BackgroundTransparency=1 b0.BorderColor3=Color3.
fromRGB(0,0,0)b0.BorderSizePixel=0 b0.Size=UDim2.fromScale(1,1)b0.Parent=b_
function bZ:UpdateName(b1)b0.Text=b1 end function bZ:SetVisibility(b1)b_.Visible
=b1 end if bY then aa.Options[bY]=bZ end return bZ end function bR:SubLabel(bX,
bY)local bZ,b_={Settings=bX},Instance.new'Frame'b_.Name='SubLabel'b_.
AutomaticSize=Enum.AutomaticSize.Y b_.BackgroundColor3=Color3.fromRGB(0,0,0)b_.
BackgroundTransparency=1 b_.BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel
=0 b_.Size=UDim2.new(1,0,0,0)b_.Parent=bS local b0=Instance.new'TextLabel'b0.
Name='SubLabelText'b0.FontFace=Font.new(ao.interFont)b0.RichText=true b0.Text=bZ
.Settings.Text or bZ.Settings.Name b0.TextColor3=Color3.fromRGB(255,255,255)b0.
TextSize=12 b0.TextTransparency=0.7 b0.TextWrapped=true b0.TextXAlignment=Enum.
TextXAlignment.Left b0.AutomaticSize=Enum.AutomaticSize.Y b0.BackgroundColor3=
Color3.fromRGB(255,255,255)b0.BackgroundTransparency=1 b0.BorderColor3=Color3.
fromRGB(0,0,0)b0.BorderSizePixel=0 b0.Size=UDim2.fromScale(1,1)b0.Parent=b_
function bZ:UpdateName(b1)b0.Text=b1 end function bZ:SetVisibility(b1)b_.Visible
=b1 end if bY then aa.Options[bY]=bZ end return bZ end function bR:Paragraph(bX,
bY)local bZ,b_={Settings=bX},Instance.new'Frame'b_.Name='Paragraph'b_.
AutomaticSize=Enum.AutomaticSize.Y b_.BackgroundColor3=Color3.fromRGB(0,0,0)b_.
BackgroundTransparency=1 b_.BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel
=0 b_.Size=UDim2.new(1,0,0,38)b_.Parent=bS local b0=Instance.new'TextLabel'b0.
Name='ParagraphHeader'b0.FontFace=Font.new(ao.interFont,Enum.FontWeight.Medium,
Enum.FontStyle.Normal)b0.RichText=true b0.Text=bZ.Settings.Header b0.TextColor3=
Color3.fromRGB(255,255,255)b0.TextSize=15 b0.TextTransparency=0.4 b0.TextWrapped
=true b0.TextXAlignment=Enum.TextXAlignment.Left b0.AutomaticSize=Enum.
AutomaticSize.Y b0.BackgroundColor3=Color3.fromRGB(255,255,255)b0.
BackgroundTransparency=1 b0.BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel
=0 b0.Size=UDim2.fromScale(1,0)b0.Parent=b_ local b1=Instance.new'UIListLayout'
b1.Name='UIListLayout'b1.Padding=UDim.new(0,5)b1.SortOrder=Enum.SortOrder.
LayoutOrder b1.Parent=b_ local b2=Instance.new'TextLabel'b2.Name='ParagraphBody'
b2.FontFace=Font.new(ao.interFont)b2.RichText=true b2.Text=bZ.Settings.Body b2.
TextColor3=Color3.fromRGB(255,255,255)b2.TextSize=13 b2.TextTransparency=0.5 b2.
TextWrapped=true b2.TextXAlignment=Enum.TextXAlignment.Left b2.AutomaticSize=
Enum.AutomaticSize.Y b2.BackgroundColor3=Color3.fromRGB(255,255,255)b2.
BackgroundTransparency=1 b2.BorderColor3=Color3.fromRGB(0,0,0)b2.BorderSizePixel
=0 b2.LayoutOrder=1 b2.Size=UDim2.fromScale(1,0)b2.Parent=b_ function bZ:
UpdateHeader(b3)b0.Text=b3 end function bZ:UpdateBody(b3)b2.Text=b3 end function
bZ:SetVisibility(b3)b_.Visible=b3 end if bY then aa.Options[bY]=bZ end return bZ
end function bR:Divider()local bX,bY={},Instance.new'Frame'bY.Name='Divider'bY.
AnchorPoint=Vector2.new(0,1)bY.AutomaticSize=Enum.AutomaticSize.Y bY.
BackgroundColor3=Color3.fromRGB(255,255,255)bY.BackgroundTransparency=1 bY.
BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Position=UDim2.
fromScale(0,1)bY.Size=UDim2.new(1,0,0,1)bY.Parent=bS local bZ=Instance.new
'UIPadding'bZ.Name='UIPadding'bZ.PaddingBottom=UDim.new(0,8)bZ.PaddingTop=UDim.
new(0,8)bZ.Parent=bY local b_=Instance.new'UIListLayout'b_.Name='UIListLayout'b_
.SortOrder=Enum.SortOrder.LayoutOrder b_.Parent=bY local b0=Instance.new'Frame'
b0.Name='Line'b0.BackgroundColor3=Color3.fromRGB(255,255,255)b0.
BackgroundTransparency=0.9 b0.BorderColor3=Color3.fromRGB(0,0,0)b0.
BorderSizePixel=0 b0.Size=UDim2.new(1,0,0,1)b0.Parent=bY function bX:Remove()bY:
Destroy()end function bX:SetVisibility(b1)bY.Visible=b1 end return bX end
function bR:Spacer()local bX,bY={},Instance.new'Frame'bY.Name='Spacer'bY.
AnchorPoint=Vector2.new(0,1)bY.BackgroundColor3=Color3.fromRGB(255,255,255)bY.
BackgroundTransparency=1 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel
=0 bY.Position=UDim2.fromScale(0,1)bY.Parent=bS function bX:Remove()bY:Destroy()
end function bX:SetVisibility(bZ)bY.Visible=bZ end return bX end return bR end
local bQ=function()local bQ=0.15 if f then f.Parent=nil end for bR,bS in pairs(
al)do h(bR,TweenInfo.new(bQ,Enum.EasingStyle.Sine),{BackgroundTransparency=(bR==
bA and 0.98 or 1)}):Play()if bS.tabStroke then h(bS.tabStroke,TweenInfo.new(bQ,
Enum.EasingStyle.Sine),{Transparency=(bR==bA and 0.95 or 1)}):Play()end if bS.
switcherImage then h(bS.switcherImage,TweenInfo.new(bQ,Enum.EasingStyle.Sine),{
ImageTransparency=(bR==bA and 0.1 or 0.5)}):Play()end if bS.switcherName then h(
bS.switcherName,TweenInfo.new(bQ,Enum.EasingStyle.Sine),{TextTransparency=(bR==
bA and 0.1 or 0.5)}):Play()end end al[bA].tabContent.Parent=aI f=al[bA].
tabContent a5.Text=by.Name end bA.MouseButton1Click:Connect(function()bQ()end)
function bz:Select()bQ()end function bz:InsertConfigSection(bR)local bS=bz:
Section{Side='Left'}if aj then bS:Label{Text=
'Config system unavailable. (Environment isStudio)'}return
'Config system unavailable.'end local bT,bU bS:Input{Name='Config Name',
Placeholder='Name',AcceptedCharacters='All',Callback=function(bV)bT=bV end}local
bV=bS:Dropdown{Name='Select Config',Multi=false,Required=false,Options=aa:
RefreshConfigList(),Callback=function(bV)bU=bV end}bS:Button{Name=
'Create Config',Callback=function()if not bT or string.gsub(bT,' ','')==''then j
:Notify{Title='Interface',Description='Config name cannot be empty.'}return end
local bW,bX=aa:SaveConfig(bT)if not bW then j:Notify{Title='Interface',
Description='Unable to save config, return error: '..bX}end j:Notify{Title=
'Interface',Description=string.format('Created config %q',bT)}bV:ClearOptions()
bV:InsertOptions(aa:RefreshConfigList())end}bS:Button{Name='Load Config',
Callback=function()local bW,bX=aa:LoadConfig(bV.Value)if not bW then j:Notify{
Title='Interface',Description='Unable to load config, return error: '..bX}return
end j:Notify{Title='Interface',Description=string.format('Loaded config %q',bV.
Value)}end}bS:Button{Name='Overwrite Config',Callback=function()local bW,bX=aa:
SaveConfig(bV.Value)if not bW then j:Notify{Title='Interface',Description=
'Unable to overwrite config, return error: '..bX}return end j:Notify{Title=
'Interface',Description=string.format('Overwrote config %q',bV.Value)}end}bS:
Button{Name='Refresh Config List',Callback=function()bV:ClearOptions()bV:
InsertOptions(aa:RefreshConfigList())end}local bW bS:Button{Name=
'Set as autoload',Callback=function()local bX=bV.Value writefile(aa.Folder..
'/settings/autoload.txt',bX)bW:UpdateName('Autoload config: '..bX)j:Notify{Title
='Interface',Description=string.format('Set %q as autoload',bX)}end}bW=bS:Label{
Text='Autoload config: None'}if isfile(aa.Folder..'/settings/autoload.txt')then
local bX=readfile(aa.Folder..'/settings/autoload.txt')bW:UpdateName(
'Autoload config: '..bX)end end al[bA]={tabContent=bH,tabStroke=bC,switcherImage
=bE,switcherName=bF}return bz end return bs end local bs=function()if
setthreadidentity then pcall(setthreadidentity,7)elseif set_thread_identity then
pcall(set_thread_identity,7)elseif setidentity then pcall(setidentity,7)elseif
syn and syn.set_thread_identity then pcall(syn.set_thread_identity,7)end end
function j:Notify(bt)bs()local bu={}local bv,bw=pcall(function()local bv=
Instance.new'Frame'bv.Name='Notification'bv.AnchorPoint=Vector2.new(0.5,0.5)bv.
AutomaticSize=Enum.AutomaticSize.Y bv.BackgroundColor3=Color3.fromRGB(15,15,15)
bv.BorderColor3=Color3.fromRGB(0,0,0)bv.BorderSizePixel=0 bv.Position=UDim2.
fromScale(0.5,0.5)bv.Size=UDim2.fromOffset(bt.SizeX or 250,0)bv.Parent=l local
bw=Instance.new'UIStroke'bw.Name='NotificationUIStroke'bw.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border bw.Color=Color3.fromRGB(255,255,255)bw.Transparency=0.9
bw.Parent=bv local bx=Instance.new'UICorner'bx.Name='NotificationUICorner'bx.
CornerRadius=UDim.new(0,10)bx.Parent=bv local by=Instance.new'UIScale'by.Name=
'NotificationUIScale'by.Parent=bv by.Scale=0 local bz=Instance.new'Frame'bz.Name
='NotificationInformation'bz.AutomaticSize=Enum.AutomaticSize.Y bz.
BackgroundColor3=Color3.fromRGB(255,255,255)bz.BackgroundTransparency=1 bz.
BorderColor3=Color3.fromRGB(0,0,0)bz.BorderSizePixel=0 bz.Size=UDim2.fromScale(1
,1)local bA=Instance.new'TextLabel'bA.Name='NotificationTitle'bA.FontFace=Font.
new(ao.interFont,Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)bA.RichText=true
bA.Text=bt.Title bA.TextColor3=Color3.fromRGB(255,255,255)bA.TextSize=13 bA.
TextTransparency=0.2 bA.TextTruncate=Enum.TextTruncate.SplitWord bA.
TextXAlignment=Enum.TextXAlignment.Left bA.TextYAlignment=Enum.TextYAlignment.
Top bA.AutomaticSize=Enum.AutomaticSize.XY bA.BackgroundColor3=Color3.fromRGB(
255,255,255)bA.BackgroundTransparency=1 bA.BorderColor3=Color3.fromRGB(0,0,0)bA.
BorderSizePixel=0 bA.Size=UDim2.new(1,-12,0,0)local bB=Instance.new'UIPadding'bB
.Name='NotificationTitleUIPadding'bB.PaddingRight=UDim.new(0,25)bB.Parent=bA bA.
Parent=bz local bC=Instance.new'TextLabel'bC.Name='NotificationDescription'bC.
FontFace=Font.new(ao.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)bC.
Text=bt.Description bC.TextColor3=Color3.fromRGB(255,255,255)bC.TextSize=11 bC.
TextTransparency=0.5 bC.TextWrapped=true bC.RichText=true bC.TextXAlignment=Enum
.TextXAlignment.Left bC.TextYAlignment=Enum.TextYAlignment.Top bC.AutomaticSize=
Enum.AutomaticSize.XY bC.BackgroundColor3=Color3.fromRGB(255,255,255)bC.
BackgroundTransparency=1 bC.BorderColor3=Color3.fromRGB(0,0,0)bC.BorderSizePixel
=0 bC.Size=UDim2.new(1,-12,0,0)local bD=Instance.new'UIPadding'bD.Name=
'NotificationDescriptionUIPadding'bD.PaddingRight=UDim.new(0,25)bD.PaddingTop=
UDim.new(0,17)bD.Parent=bC bC.Parent=bz local bE=Instance.new'UIPadding'bE.Name=
'NotificationUIPadding'bE.PaddingBottom=UDim.new(0,12)bE.PaddingLeft=UDim.new(0,
10)bE.PaddingRight=UDim.new(0,10)bE.PaddingTop=UDim.new(0,10)bE.Parent=bz bz.
Parent=bv local bF=Instance.new'Frame'bF.Name='NotificationControls'bF.
AutomaticSize=Enum.AutomaticSize.Y bF.BackgroundColor3=Color3.fromRGB(255,255,
255)bF.BackgroundTransparency=1 bF.BorderColor3=Color3.fromRGB(0,0,0)bF.
BorderSizePixel=0 bF.Size=UDim2.fromScale(1,1)local bG=Instance.new'TextButton'
bG.Name='Interactable'bG.FontFace=Font.new(ao.interFont)bG.Text='\u{2713}'bG.
TextColor3=Color3.fromRGB(255,255,255)bG.TextSize=17 bG.TextTransparency=0.2 bG.
AnchorPoint=Vector2.new(1,0.5)bG.AutomaticSize=Enum.AutomaticSize.XY bG.
BackgroundColor3=Color3.fromRGB(255,255,255)bG.BackgroundTransparency=1 bG.
BorderColor3=Color3.fromRGB(0,0,0)bG.BorderSizePixel=0 bG.LayoutOrder=1 bG.
Position=UDim2.fromScale(1,0.5)bG.Parent=bF local bH=Instance.new'UIPadding'bH.
Name='UIPadding'bH.PaddingBottom=UDim.new(0,6)bH.PaddingRight=UDim.new(0,13)bH.
PaddingTop=UDim.new(0,6)bH.Parent=bF bF.Parent=bv local bI,bJ={In=h(by,TweenInfo
.new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Scale=bt.Scale
or 1}),Out=h(by,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=0})},{None=function()bG:Destroy()end,Confirm=
function()bG.Text='\u{2713}'end,Cancel=function()bG.Text='\u{2717}'end}local bK=
bJ[bt.Style]or function()bG:Destroy()end bK()if bG then bG.MouseButton1Click:
Connect(function()bu:Cancel()if bt.Callback then task.spawn(bt.Callback)end end)
end local bL=task.spawn(function()bs()bI.In:Play()bt.Lifetime=bt.Lifetime or 3
if bt.Lifetime~=0 then task.wait(bt.Lifetime)local bL=bI.Out bL:Play()bL.
Completed:Wait()bs()pcall(function()bv:Destroy()end)end end)function bu:
UpdateTitle(bM)bA.Text=bM end function bu:UpdateDescription(bM)bC.Text=bM end
function bu:Resize(bM)local bN=bM or 250 bv.Size=UDim2.fromOffset(bN,0)end
function bu:Cancel()bs()task.cancel(bL)local bM=bI.Out bM:Play()bM.Completed:
Wait()pcall(function()bv:Destroy()end)end end)if not bv then pcall(function()
local bx=aa.GetService'StarterGui'or game:GetService'StarterGui'bx:SetCore(
'SendNotification',{Title=bt.Title or'Interface',Text=bt.Description or'',
Duration=bt.Lifetime or 3})end)return{UpdateTitle=function()end,
UpdateDescription=function()end,Resize=function()end,Cancel=function()end}end
return bu end function j:Dialog(bt)local bu,bv={},Instance.new'CanvasGroup'bv.
Name='DialogCanvas'bv.BackgroundColor3=Color3.fromRGB(255,255,255)bv.
BackgroundTransparency=1 bv.BorderColor3=Color3.fromRGB(0,0,0)bv.BorderSizePixel
=0 bv.Size=UDim2.fromScale(1,1)bv.GroupTransparency=1 bv.Parent=o local bw=
Instance.new'Frame'bw.Name='Dialog'bw.BackgroundColor3=Color3.fromRGB(0,0,0)bw.
BackgroundTransparency=0.5 bw.BorderColor3=Color3.fromRGB(0,0,0)bw.
BorderSizePixel=0 bw.Size=UDim2.fromScale(1,1)local bx=Instance.new'UICorner'bx.
Name='BaseUICorner'bx.CornerRadius=UDim.new(0,10)bx.Parent=bw local by=Instance.
new'Frame'by.Name='Prompt'by.AnchorPoint=Vector2.new(0.5,0.5)by.AutomaticSize=
Enum.AutomaticSize.Y by.BackgroundColor3=Color3.fromRGB(15,15,15)by.BorderColor3
=Color3.fromRGB(0,0,0)by.BorderSizePixel=0 by.Position=UDim2.fromScale(0.5,0.5)
by.Size=UDim2.fromOffset(280,0)local bz=Instance.new'UIScale'bz.Name=
'BaseUIScale'bz.Parent=by bz.Scale=0.95 local bA=Instance.new'UIStroke'bA.Name=
'GlobalSettingsUIStroke'bA.ApplyStrokeMode=Enum.ApplyStrokeMode.Border bA.Color=
Color3.fromRGB(255,255,255)bA.Transparency=0.9 bA.Parent=by local bB=Instance.
new'UICorner'bB.Name='GlobalSettingsUICorner'bB.CornerRadius=UDim.new(0,10)bB.
Parent=by local bC=Instance.new'UIPadding'bC.Name='GlobalSettingsUIPadding'bC.
PaddingBottom=UDim.new(0,20)bC.PaddingLeft=UDim.new(0,20)bC.PaddingRight=UDim.
new(0,20)bC.PaddingTop=UDim.new(0,20)bC.Parent=by local bD=Instance.new'Frame'bD
.Name='Paragraph'bD.AutomaticSize=Enum.AutomaticSize.Y bD.BackgroundColor3=
Color3.fromRGB(0,0,0)bD.BackgroundTransparency=1 bD.BorderColor3=Color3.fromRGB(
0,0,0)bD.BorderSizePixel=0 bD.Size=UDim2.new(1,0,0,38)local bE=Instance.new
'TextLabel'bE.Name='ParagraphHeader'bE.FontFace=Font.new(ao.interFont,Enum.
FontWeight.Medium,Enum.FontStyle.Normal)bE.RichText=true bE.Text=bt.Title bE.
TextColor3=Color3.fromRGB(255,255,255)bE.TextSize=18 bE.TextTransparency=0.4 bE.
TextWrapped=true bE.AutomaticSize=Enum.AutomaticSize.Y bE.BackgroundColor3=
Color3.fromRGB(255,255,255)bE.BackgroundTransparency=1 bE.BorderColor3=Color3.
fromRGB(0,0,0)bE.BorderSizePixel=0 bE.Size=UDim2.fromScale(1,0)bE.Parent=bD
local bF=Instance.new'UIListLayout'bF.Name='UIListLayout'bF.Padding=UDim.new(0,
15)bF.SortOrder=Enum.SortOrder.LayoutOrder bF.Parent=bD local bG=Instance.new
'TextLabel'bG.Name='ParagraphBody'bG.FontFace=Font.new(ao.interFont)bG.RichText=
true bG.Text=bt.Description bG.TextColor3=Color3.fromRGB(255,255,255)bG.TextSize
=14 bG.TextTransparency=0.5 bG.TextWrapped=true bG.AutomaticSize=Enum.
AutomaticSize.Y bG.BackgroundColor3=Color3.fromRGB(255,255,255)bG.
BackgroundTransparency=1 bG.BorderColor3=Color3.fromRGB(0,0,0)bG.BorderSizePixel
=0 bG.LayoutOrder=1 bG.Size=UDim2.fromScale(1,0)bG.Parent=bD bD.Parent=by local
bH=Instance.new'Frame'bH.Name='Interactions'bH.AutomaticSize=Enum.AutomaticSize.
Y bH.BackgroundColor3=Color3.fromRGB(0,0,0)bH.BackgroundTransparency=1 bH.
BorderColor3=Color3.fromRGB(0,0,0)bH.BorderSizePixel=0 bH.LayoutOrder=1 bH.Size=
UDim2.fromScale(1,0)local bI=Instance.new'UIListLayout'bI.Name='UIListLayout'bI.
Padding=UDim.new(0,10)bI.SortOrder=Enum.SortOrder.LayoutOrder bI.Parent=bH local
bJ=Instance.new'UIPadding'bJ.Name='UIPadding'bJ.PaddingTop=UDim.new(0,20)bJ.
Parent=bH bH.Parent=by local bK=Instance.new'UIListLayout'bK.Name='UIListLayout'
bK.SortOrder=Enum.SortOrder.LayoutOrder bK.Parent=by by.Parent=bw bw.Parent=bv
local bL,bM,bN,bO=h(bv,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{
GroupTransparency=0}),h(bv,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{
GroupTransparency=1}),h(bz,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Scale=1}),
h(bz,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Scale=0.95})local bP,bQ=function(
)bL:Play()bN:Play()bL.Completed:Wait()bw.Parent=o end,function()if not bw.Parent
then return end bw.Parent=bv bM:Play()bO:Play()bM.Completed:Wait()bv:Destroy()
end for bR,bS in pairs(bt.Buttons)do local bT=Instance.new'TextButton'bT.Name=
'Button'bT.FontFace=Font.new(ao.interFont)bT.Text=bS.Name bT.TextColor3=Color3.
fromRGB(255,255,255)bT.TextSize=15 bT.TextTransparency=0.5 bT.TextTruncate=Enum.
TextTruncate.AtEnd bT.AutoButtonColor=false bT.AutomaticSize=Enum.AutomaticSize.
Y bT.BackgroundColor3=Color3.fromRGB(25,25,25)bT.BorderColor3=Color3.fromRGB(0,0
,0)bT.BorderSizePixel=0 bT.Size=UDim2.fromScale(1,0)local bU=Instance.new
'UIPadding'bU.Name='UIPadding'bU.PaddingBottom=UDim.new(0,9)bU.PaddingLeft=UDim.
new(0,10)bU.PaddingRight=UDim.new(0,10)bU.PaddingTop=UDim.new(0,9)bU.Parent=bT
local bV=Instance.new'UICorner'bV.Name='BaseUICorner'bV.CornerRadius=UDim.new(0,
10)bV.Parent=bT bT.Parent=bH local bW={DefaultTransparency=0,
DefaultTransparency2=0.5,HoverTransparency=0.3,HoverTransparency2=0.6,
EasingStyle=Enum.EasingStyle.Sine}local bX=function(bX)if bX=='Idle'then h(bT,
TweenInfo.new(0.2,bW.EasingStyle),{BackgroundTransparency=bW.DefaultTransparency
,TextTransparency=bW.DefaultTransparency2}):Play()elseif bX=='Hover'then h(bT,
TweenInfo.new(0.2,bW.EasingStyle),{BackgroundTransparency=bW.HoverTransparency,
TextTransparency=bW.HoverTransparency2}):Play()end end bT.MouseButton1Click:
Connect(function()if bv.GroupTransparency~=0 then return end local bY,bZ=pcall(
function()if bS.Callback then bS.Callback()end end)bQ()if not bY then warn(
'[Dialog] Button callback error: '..tostring(bZ))end end)bT.MouseEnter:Connect(
function()bX'Hover'end)bT.MouseLeave:Connect(function()bX'Idle'end)end bP()
function bu:UpdateTitle(bR)bE.Text=bR end function bu:UpdateDescription(bR)bG.
Text=bR end function bu:Cancel()bQ()end return bu end function j:
SetNotificationsState(bt)l.Visible=bt end function j:GetNotificationsState(bt)
return l.Visible end function j:SetState(bt)c=bt o.Visible=bt end function j:
GetState()return c end local bt function j:Unload()if bt then bt()end k:Destroy(
)an=true end function j.onUnloaded(bu)bt=bu end local bu=i.Keybind or Enum.
KeyCode.RightControl local bv=function()local bv=not j:GetState()j:SetState(bv)j
:Notify{Title=i.Title,Description=(bv and'Maximized 'or'Minimized ')..
'the menu. Use '..tostring(bu.Name)..' to toggle it.',Lifetime=5}end af.
InputEnded:Connect(function(bw,bx)if bx then return end if bw.KeyCode==bu then
bv()end end)F.MouseButton1Click:Connect(bv)B.MouseButton1Click:Connect(function(
)j:Dialog{Title=i.Title,Description=
[[Are you sure you want to exit the menu? You will lose any unsaved configurations.]]
,Buttons={{Name='Confirm',Callback=function()j:Unload()end},{Name='Cancel'}}}end
)function j:SetKeybind(bw)bu=bw end function j:SetAcrylicBlurState(bw)d=bw o.
BackgroundTransparency=bw and 0.05 or 0 end function j:GetAcrylicBlurState()
return d end local bw,bx=function(bw)if bw then au.Image=(at and as)or
'rbxassetid://0'aB.Text='@'..ak.Name ay.Text=ak.DisplayName else au.Image=ao.
userInfoBlurred local bx,by=#ak.Name,#ak.DisplayName aB.Text='@'..string.rep('.'
,bx)ay.Text=string.rep('.',by)end end if i.ShowUserInfo~=nil then bx=i.
ShowUserInfo else bx=true end bw(bx)function j:SetUserInfoState(by)bw(by)end
function j:GetUserInfoState(by)return bx end function j:SetSize(by)o.Size=by end
function j:GetSize(by)return o.Size end function j:SetScale(by)p.Scale=by end
function j:GetScale()return p.Scale end local by,bz={Toggle={Save=function(by,bz
)return{type='Toggle',flag=by,state=bz.State or false}end,Load=function(by,bz)
bs()if aa.Options[by]and bz.state~=nil then aa.Options[by]:UpdateState(bz.state)
end end},Slider={Save=function(by,bz)return{type='Slider',flag=by,value=(bz.
Value and tostring(bz.Value))or false}end,Load=function(by,bz)bs()if aa.Options[
by]and bz.value~=nil and bz.value~=false then aa.Options[by]:UpdateValue(bz.
value)end end},Input={Save=function(by,bz)return{type='Input',flag=by,text=bz.
Text}end,Load=function(by,bz)bs()if aa.Options[by]and bz.text and type(bz.text)
=='string'then aa.Options[by]:UpdateText(bz.text)end end},Keybind={Save=function
(by,bz)return{type='Keybind',flag=by,bind=(typeof(bz.Bind)=='EnumItem'and bz.
Bind.Name)or nil}end,Load=function(by,bz)bs()if aa.Options[by]and bz.bind then
aa.Options[by]:Bind(Enum.KeyCode[bz.bind])end end},Dropdown={Save=function(by,bz
)return{type='Dropdown',flag=by,value=bz.Value}end,Load=function(by,bz)bs()if aa
.Options[by]and bz.value then aa.Options[by]:UpdateSelection(bz.value)end end},
Colorpicker={Save=function(by,bz)local bA=function(bA)return string.format(
'#%02X%02X%02X',math.floor(bA.R*255),math.floor(bA.G*255),math.floor(bA.B*255))
end return{type='Colorpicker',flag=by,color=bA(bz.Color)or nil,alpha=bz.Alpha}
end,Load=function(by,bz)bs()local bA=function(bA)local bB,bC,bD=tonumber(bA:sub(
2,3),16)/255,tonumber(bA:sub(4,5),16)/255,tonumber(bA:sub(6,7),16)/255 return
Color3.new(bB,bC,bD)end if aa.Options[by]and bz.color then aa.Options[by]:
SetColor(bA(bz.color))if bz.alpha then aa.Options[by]:SetAlpha(bz.alpha)end end
end}},function()if aj or not(isfolder and makefolder)then return
'Config system unavailable.'end local by={aa.Folder,aa.Folder..'/settings'}for
bz=1,#by do local bA=by[bz]if not isfolder(bA)then makefolder(bA)end end end
function aa:LoadAutoLoadConfig()bs()if aj or not(isfile and readfile)then return
'Config system unavailable.'end local bA,bB=(aa.Folder..'/settings/autoload.txt'
)if isfile(bA)then local bC,bD=pcall(readfile,bA)if bC and type(bD)=='string'
then bD=string.gsub(bD,'[\r\n%s]+','')if#bD>0 then bB=bD end end end if not bB
then local bC=aa.Folder..'/settings/Default.json'if isfile(bC)then bB='Default'
if writefile then pcall(writefile,bA,'Default')end end end if not bB then print(
'[MacLib] Kh\u{f4}ng t\u{ec}m th\u{1ea5}y autoload config n\u{e0}o trong '..bA)
return end print(string.format(
'[MacLib] Kh\u{1edf}i \u{111}\u{1ed9}ng n\u{1ea1}p autoload config: %q',bB))
local bC,bD=aa:LoadConfig(bB)if not bC then pcall(function()j:Notify{Title=
'Interface',Description='Error loading autoload config: '..tostring(bD)}end)
warn(string.format('[MacLib] L\u{1ed7}i khi n\u{1ea1}p autoload config %q: %s',
bB,tostring(bD)))return end print(string.format(
'[MacLib] N\u{1ea1}p autoload config th\u{e0}nh c\u{f4}ng: %q',bB))pcall(
function()j:Notify{Title='Interface',Description=string.format(
'Autoloaded config: %q',bB)}end)end function aa:SetFolder(bA)if aj then return
'Config system unavailable.'end aa.Folder=bA bz()end function aa:SaveConfig(bA)
if aj or not writefile then return'Config system unavailable.'end if(not bA)then
return false,'Please select a config file.'end local bB,bC=aa.Folder..
'/settings/'..bA..'.json',{objects={},contextData=aa.contextData or{}}for bD,bE
in next,aa.Options do if not by[bE.Class]then continue end if bE.IgnoreConfig
then continue end table.insert(bC.objects,by[bE.Class].Save(bD,bE))end local bD,
bE=pcall(ad.JSONEncode,ad,bC)if not bD then return false,
'Unable to encode into JSON data'end writefile(bB,bE)return true end function aa
:LoadConfig(bA)bs()if aj or not(isfile and readfile)then return
'Config system unavailable.'end if(not bA)then return false,
'Please select a config file.'end bA=string.gsub(tostring(bA),'[\r\n%s]+','')if#
bA==0 then return false,'Please select a config file.'end local bB=aa.Folder..
'/settings/'..bA..'.json'if not isfile(bB)then return false,'Invalid file: '..
tostring(bB)end local bC,bD=pcall(ad.JSONDecode,ad,readfile(bB))if not bC or
type(bD)~='table'then return false,'Unable to decode JSON data.'end aa.
LoadingConfig=true aa.contextData=bD.contextData or{}local bE,bF=bD.objects or{}
,0 for bG,bH in next,bE do if bH and bH.type and by[bH.type]then local bI,bJ=
pcall(function()by[bH.type].Load(bH.flag,bH)end)if bI then bF=bF+1 else warn(
string.format('[MacLib:LoadConfig] L\u{1ed7}i khi n\u{1ea1}p option %s (%s): %s'
,tostring(bH.flag),tostring(bH.type),tostring(bJ)))end end end print(string.
format(
'[MacLib:LoadConfig] \u{110}\u{e3} n\u{1ea1}p config %q (%d/%d options th\u{e0}nh c\u{f4}ng)'
,bA,bF,#bE))task.delay(1,function()aa.LoadingConfig=false end)return true end
function aa:RefreshConfigList()if aj or not(isfolder and listfiles)then return
'Config system unavailable.'end local bA,bB=(isfolder(aa.Folder)and isfolder(aa.
Folder..'/settings'))and listfiles(aa.Folder..'/settings')or{},{}for bC=1,#bA do
local bD=bA[bC]if bD:sub(-5)=='.json'then local bE=bD:find('.json',1,true)local
bF,bG=bE,bD:sub(bE,bE)while bG~='/'and bG~='\\'and bG~=''do bE=bE-1 bG=bD:sub(bE
,bE)end if bG=='/'or bG=='\\'then local bH=bD:sub(bE+1,bF-1)if bH~='options'then
table.insert(bB,bH)end end end end return bB end k.Enabled=false local bA={}for
bB,bC in pairs(ao)do table.insert(bA,bC)end ae:PreloadAsync(bA)k.Enabled=true c=
true return j end function aa:Demo()local ap=aa:Window{Title='Maclib Demo',
Subtitle='This is a subtitle.',Size=UDim2.fromOffset(868,650),DragStyle=1,
DisabledWindowControls={},ShowUserInfo=true,Keybind=Enum.KeyCode.RightControl,
AcrylicBlur=true}local aq,ar={UIBlurToggle=ap:GlobalSetting{Name='UI Blur',
Default=ap:GetAcrylicBlurState(),Callback=function(aq)ap:SetAcrylicBlurState(aq)
ap:Notify{Title=ap.Settings.Title,Description=(aq and'Enabled'or'Disabled')..
' UI Blur',Lifetime=5}end},NotificationToggler=ap:GlobalSetting{Name=
'Notifications',Default=ap:GetNotificationsState(),Callback=function(aq)ap:
SetNotificationsState(aq)ap:Notify{Title=ap.Settings.Title,Description=(aq and
'Enabled'or'Disabled')..' Notifications',Lifetime=5}end},ShowUserInfo=ap:
GlobalSetting{Name='Show User Info',Default=ap:GetUserInfoState(),Callback=
function(aq)ap:SetUserInfoState(aq)ap:Notify{Title=ap.Settings.Title,Description
=(aq and'Showing'or'Redacted')..' User Info',Lifetime=5}end}},{TabGroup1=ap:
TabGroup()}local as={Main=ar.TabGroup1:Tab{Name='Demo',Image=
'rbxassetid://18821914323'},Settings=ar.TabGroup1:Tab{Name='Settings',Image=
'rbxassetid://10734950309'}}local at={MainSection1=as.Main:Section{Side='Left'}}
at.MainSection1:Header{Name='Header #1'}at.MainSection1:Button{Name='Button',
Callback=function()ap:Dialog{Title=ap.Settings.Title,Description=
[[Lorem ipsum odor amet, consectetuer adipiscing elit. Eros vestibulum aliquet mattis, ex platea nunc.]]
,Buttons={{Name='Confirm',Callback=function()print'Confirmed!'end},{Name=
'Cancel'}}}end}at.MainSection1:Input({Name='Input',Placeholder='Input',
AcceptedCharacters='All',Callback=function(au)ap:Notify{Title=ap.Settings.Title,
Description='Successfully set input to '..au}end,onChanged=function(au)print(
'Input is now '..au)end},'Input')at.MainSection1:Slider({Name='Slider',Default=
50,Minimum=0,Maximum=100,DisplayMethod='Percent',Precision=0,Callback=function(
au)print('Changed to '..au)end},'Slider')at.MainSection1:Toggle({Name='Toggle',
Default=false,Callback=function(au)ap:Notify{Title=ap.Settings.Title,Description
=(au and'Enabled 'or'Disabled ')..'Toggle'}end},'Toggle')at.MainSection1:
Keybind({Name='Keybind',Blacklist=false,Callback=function(au)ap:Notify{Title=
'Demo Window',Description='Pressed keybind - '..tostring(au.Name),Lifetime=3}end
,onBinded=function(au)ap:Notify{Title='Demo Window',Description=
'Successfully Binded Keybind to - '..tostring(au.Name),Lifetime=3}end},'Keybind'
)at.MainSection1:Colorpicker({Name='Colorpicker',Default=Color3.fromRGB(0,255,
255),Callback=function(au)print('Color: ',au)end},'Colorpicker')local au,av,aw,
ax=at.MainSection1:Colorpicker({Name='Transparency Colorpicker',Default=Color3.
fromRGB(255,0,0),Alpha=0,Callback=function(au,av)print('Color: ',au,' Alpha: ',
av)end},'TransparencyColorpicker'),0 at.MainSection1:Toggle({Name='Rainbow',
Default=false,Callback=function(ay)aw=ay if aw then ax=game:GetService
'RunService'.RenderStepped:Connect(function(az)av=(av+az*0.1)%1 au:SetColor(
Color3.fromHSV(av,1,1))end)elseif ax then ax:Disconnect()ax=nil end end},
'RainbowToggle')local ay={'Apple','Banana','Orange','Grapes','Pineapple','Mango'
,'Strawberry','Blueberry','Watermelon','Peach'}local az,aA=at.MainSection1:
Dropdown({Name='Dropdown',Multi=false,Required=true,Options=ay,Default=1,
Callback=function(az)print('Dropdown changed: '..az)end},'Dropdown'),at.
MainSection1:Dropdown({Name='Multi Dropdown',Search=true,Multi=true,Required=
false,Options=ay,Default={'Apple','Orange'},Callback=function(az)local aA={}for
aB,aC in next,az do table.insert(aA,aB)end print('Mutlidropdown changed:',table.
concat(aA,', '))end},'MultiDropdown')at.MainSection1:Button{Name=
'Update Selection',Callback=function()az:UpdateSelection'Grapes'aA:
UpdateSelection{'Banana','Pineapple'}end}at.MainSection1:Divider()at.
MainSection1:Header{Text='Header #2'}at.MainSection1:Paragraph{Header=
'Paragraph',Body=
[[Paragraph body. Lorem ipsum odor amet, consectetuer adipiscing elit. Morbi tempus netus aliquet per velit est gravida.]]
}at.MainSection1:Label{Text=
'Label. Lorem ipsum odor amet, consectetuer adipiscing elit.'}at.MainSection1:
SubLabel{Text=
[[Sub-Label. Lorem ipsum odor amet, consectetuer adipiscing elit.]]}aa:SetFolder
'Maclib'as.Settings:InsertConfigSection'Left'ap.onUnloaded(function()print
'Unloaded!'end)as.Main:Select()aa:LoadAutoLoadConfig()end return aa end function
a.h()local aa,ab={}function aa:SetWindow(ac)ab=ac end function aa.Notify(ac,ad,
ae)ae=ae or 3 if ab then local af=pcall(function()ab:Notify{Title=ac,Description
=ad,Lifetime=ae}end)if af then return end end pcall(function()game:GetService
'StarterGui':SetCore('SendNotification',{Title=ac,Text=ad,Duration=ae})end)end
return aa end function a.i()local aa,ab,ac,ad,ae,af,ah=a.load'g',a.load'h',{},
false,false,false function ac.Suspend()ae=true ad=false end function ac.Resume()
ae=false end function ac.SetRecording(ai)af=ai and true or false end function ac
.IsRecording()return af end function ac.IsSuspended()if ae or(aa.LoadingConfig==
true)or af then return true end local ai,aj=pcall(require,
'@routes/DungeonQuest/core/coordinator')if ai and aj and aj.IsLocked and aj.
IsLocked()then return true end return false end function ac.SetActive(ai)ah=(
typeof(ai)=='string'and#ai>0)and string.gsub(ai,'[\r\n%s]+','')or nil if ah and
writefile then pcall(function()local aj=aa.Folder if isfolder and not isfolder(
aj)then makefolder(aj)end if isfolder and not isfolder(aj..'/settings')then
makefolder(aj..'/settings')end writefile(aj..'/settings/autoload.txt',ah)end)end
end function ac.GetActive()return ah end local ai=function()if ah then return ah
end local ai=aa.Folder local aj=ai..'/settings/autoload.txt'if isfile and
isfile(aj)then local ak,al=pcall(readfile,aj)if ak and typeof(al)=='string'then
al=string.gsub(al,'[\r\n%s]+','')if#al>0 then ah=al return ah end end end ah=
'Default'pcall(function()if writefile and makefolder and isfolder then if not
isfolder(ai)then makefolder(ai)end if not isfolder(ai..'/settings')then
makefolder(ai..'/settings')end if not isfile(aj)then writefile(aj,'Default')end
end end)return ah end function ac.SaveNow()if ac.IsSuspended()then return end
local aj=ai()if not aj then return end local ak,al=aa:SaveConfig(aj)if not ak
and al and al~='Please select a config file.'then ab.Notify('AutoSave',
'Failed to save config: '..tostring(al),3)end end function ac.Save()if ac.
IsSuspended()then return end if not ai()then return end if ad then return end ad
=true task.delay(0.5,function()ad=false if not ac.IsSuspended()and ac.GetActive(
)then ac.SaveNow()end end)end function ac.Wrap(aj)if type(aj)~='function'then
return aj end return function(...)aj(...)ac.Save()end end return ac end function
a.j()local aa,ab=a.load'a',a.load'b'local ac,ad,ae,af,ah,ai,aj,ak,al,am,an,ao,ap
,aq,ar,as,at,au,av,aw,ax,ay,az=aa.player,0.05,'enemyProjectiles',0.5,{},false,16
,16,true,false,false,{},0,{},0,{},{},{},{},{},{},0,{}local aA,aB,aC,aD,aE,aF,aG,
aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ,aR,aS=function()for aA=#az,1,-1 do pcall(az[aA])
end end,{},'unknown',true,{},{},{},0,4,false local aT=function(aT)if aT then
table.insert(aG,aT)end return aT end function ah.OnRespawn(aU)table.insert(aF,aU
)end function ah.GetLastRespawnTime()return aH end function ah.
GetRespawnProtectionDuration()return aI end function ah.
SetRespawnProtectionDuration(aU)if type(aU)=='number'and aU>=0 then aI=aU end
end function ah.GetRespawnProtectionRemaining()if aH==0 then return 0 end local
aU=os.clock()-aH local aV=aI-aU return math.max(0,aV)end function ah.
IsJustRespawned(aU)local aV=aU or aI if aH==0 then return false end return(os.
clock()-aH)<=aV end function ah.WasDead()return aJ end function ah.IsDead()local
aU=ac and ac.Character if not aU or not aU.Parent then return true end local aV=
aU:FindFirstChildOfClass'Humanoid'if not aV or aV.Health<=0 then return true end
return false end function ah.IsInvulnerable()local aU=ac and ac.Character if not
aU or not aU.Parent then return false,nil end local aV=aU:FindFirstChildOfClass
'Humanoid'if aV and aV.Health<=0 then return false,nil end local aW=ah.
GetRespawnProtectionRemaining()if aW>0 then return true,(
'Respawn Shield (%.1fs)'):format(aW)end return false,nil end local aU=function(
aU)if not aU or not aU:IsA'Model'then return nil end local aV=aU:FindFirstChild
'HumanoidRootPart'if aV and aV:IsA'BasePart'then return aV end if aU.PrimaryPart
and aU.PrimaryPart:IsA'BasePart'then return aU.PrimaryPart end for aW,aX in
ipairs(aU:GetDescendants())do if aX:IsA'BasePart'then return aX end end return
nil end local aV,aW=function(aV)if not aV or not aV:IsA'Model'or not aV.Parent
or aV==ac.Character then return false end local aW=aV:FindFirstChildOfClass
'Humanoid'if not aW or aW.Health<=0 then return false end return aU(aV)~=nil end
,function(aV)local aW=aw[aV]if not aW then return end if aW.Died then aW.Died:
Disconnect()aW.Died=nil end aw[aV]=nil end local aX,aY=function(aX)if not aX or
not au[aX]then return end ax[aX]=nil au[aX]=nil ay-=1 aW(aX)aA()aO()end,function
(aX)if not dungeon or not aX then return nil end local aY=aX.Parent while aY do
if aY==dungeon then return nil end if aY.Parent==dungeon and(aY:IsA'Folder'or aY
:IsA'Model')then return aY end aY=aY.Parent end return nil end local aZ=function
(aZ)if not aV(aZ)or au[aZ]then return end local a_,a0=aU(aZ),aZ:
FindFirstChildOfClass'Humanoid'if not a_ or not a0 then return end au[aZ]={Model
=aZ,Root=a_,Humanoid=a0,Room=aY(aZ)}ay+=1 aw[aZ]={Died=a0.Died:Connect(function(
)aX(aZ)end)}if an and not aQ then if aP then aP()end end aA()aO()end local a_=
function(a_)if not a_ then return end if aV(a_)then aZ(a_)return end if ax[a_]
then return end ax[a_]=true task.spawn(function()local a0=os.clock()+2 while a_.
Parent and os.clock()<a0 do if aV(a_)then ax[a_]=nil aZ(a_)return end task.wait(
0.03)end ax[a_]=nil if a_.Parent and aV(a_)then aZ(a_)end end)end local a0=
function(a0)if not a0 or at[a0]then return end at[a0]=true for a1,a2 in ipairs(
a0:GetDescendants())do if a2:IsA'Model'and aV(a2)then aZ(a2)end end av[a0]={
Added=a0.DescendantAdded:Connect(function(a1)if a1:IsA'Model'then a_(a1)elseif
a1:IsA'Humanoid'then local a2=a1:FindFirstAncestorOfClass'Model'if a2 then a_(a2
)end end end),Removed=a0.DescendantRemoving:Connect(function(a1)if a1:IsA'Model'
then aX(a1)end end)}end aM=function()if not dungeon then dungeon=workspace:
WaitForChild('dungeon',30)end if not dungeon then return false end ap=0 for a1=#
aq,1,-1 do pcall(aq[a1],ap)end ar=0 for a1=#as,1,-1 do pcall(as[a1],ar)end for
a1,a2 in ipairs(dungeon:GetChildren())do if a2:IsA'Folder'or a2:IsA'Model'then
a0(a2)end end av[dungeon]={Added=dungeon.DescendantAdded:Connect(function(a1)if
a1:IsA'Model'then a_(a1)elseif a1:IsA'Humanoid'then local a2=a1:
FindFirstAncestorOfClass'Model'if a2 then a_(a2)end end end),Removed=dungeon.
DescendantRemoving:Connect(function(a1)if a1:IsA'Model'then aX(a1)end end)}
return true end aN=function()if not dungeon then return end for a1,a2 in pairs(
av)do if a2.Added then pcall(function()a2.Added:Disconnect()end)end if a2.
Removed then pcall(function()a2.Removed:Disconnect()end)end end av={}at={}for a1
in pairs(au)do aW(a1)end au={}ay=0 ax={}aQ=nil dungeon=nil end aL=function()for
a1,a2 in pairs(au)do if not a1 or not a1.Parent then aX(a1)else local a3=a2.
Humanoid or a1:FindFirstChildOfClass'Humanoid'a2.Humanoid=a3 if not a3 or a3.
Health<=0 then aX(a1)else local a4=a2.Root if not a4 or not a4.Parent then a4=
aU(a1)if a4 then a2.Root=a4 else aX(a1)end end end end end end function ah.
SetFastSpeed(a1)aj=a1 if ai and humanoid and humanoid.Parent then if humanoid.
WalkSpeed<aj then am=true humanoid.WalkSpeed=aj am=false end end end function ah
.SetSpeedEnabled(a1)ai=a1 if humanoid and humanoid.Parent then am=true if ai
then if humanoid.WalkSpeed<aj then humanoid.WalkSpeed=aj end else humanoid.
WalkSpeed=ak end am=false end end function ah.IsSpeedEnabled()return ai end
function ah.GetFastSpeed()return aj end function ah.SetInstantAccelEnabled(a1)al
=a1 and true or false end function ah.IsInstantAccelEnabled()return al end local
a1=function()if aR then aR:Disconnect()aR=nil end if not humanoid or not
humanoid.Parent then return end aR=humanoid:GetPropertyChangedSignal'WalkSpeed':
Connect(function()if am then return end if not humanoid or not humanoid.Parent
then return end local a1=humanoid.WalkSpeed if ai then if a1<aj then am=true
humanoid.WalkSpeed=aj am=false end else ak=a1 end end)end function ah.
SetHumanoid(a2)if not a2 then return end local a3=a2:WaitForChild('Humanoid',10)
if not a3 then return end humanoid=a3 rootPart=a2:WaitForChild(
'HumanoidRootPart',10)or a2.PrimaryPart ak=humanoid.WalkSpeed if ai and humanoid
.WalkSpeed<aj then am=true humanoid.WalkSpeed=aj am=false end if aS then aS:
Disconnect()aS=nil end aS=humanoid.Died:Connect(function()aJ=true end)aT(
humanoid.HealthChanged:Connect(function(a4)if a4<=0 then aJ=true elseif aJ and
a4>0 then aJ=false end end))end local a2=function()if not ab.IsActive()then
return end if not al then return end if not humanoid or not humanoid.Parent or
humanoid.Health<=0 or humanoid.Sit then return end if not rootPart or not
rootPart.Parent then local a2=ac and ac.Character rootPart=a2 and a2:
FindFirstChild'HumanoidRootPart'if not rootPart then return end end if rootPart.
Anchored then return end local a2,a3=humanoid.MoveDirection,rootPart.
AssemblyLinearVelocity if a2.Magnitude>0.05 then local a4=ai and math.max(aj,
humanoid.WalkSpeed)or humanoid.WalkSpeed rootPart.AssemblyLinearVelocity=Vector3
.new(a2.X*a4,a3.Y,a2.Z*a4)end end if aa.RunService then local a3=aa.RunService.
PreSimulation or aa.RunService.Heartbeat if a3 then aT(a3:Connect(a2))end end
function ah.GetDungeonStartTime()return dungeonStartTime end function ah.
SetDungeonStartTime(a3)dungeonStartTime=a3 end function ah.GetDungeonElapsed()if
not dungeonStartTime then return nil end return os.clock()-dungeonStartTime end
function ah.ReadyDungeon()if not dungeon and not aM()then return false end
return true end function ah.GetHumanoid()return humanoid end function ah.
GetEnemyNames()local a3={}local a4=function(a4)if a4 and a4~=''and a4~=ac.Name
then a3[a4]=true end end if dungeon then for a5,a6 in ipairs(dungeon:
GetChildren())do if a6:IsA'Folder'or a6:IsA'Model'then for a7,a8 in ipairs(a6:
GetDescendants())do if a8:IsA'Model'and a8:FindFirstChildOfClass'Humanoid'then
a4(a8.Name)end end end end end for a5 in pairs(au)do a4(a5.Name)end local a5={}
for a6 in pairs(a3)do table.insert(a5,a6)end table.sort(a5)return a5 end
function ah.GetEnemyCount()return ay end function ah.GetTrackedEnemyData()local
a3={}for a4,a5 in pairs(au)do if a5 and a5.Root and a5.Root.Parent then a3[#a3+1
]=a5 end end return a3 end function ah.OnEnemyChanged(a3)if type(a3)~='function'
then return function()end end table.insert(az,a3)return function()for a4,a5 in
ipairs(az)do if a5==a3 then table.remove(az,a4)break end end end end function ah
.GetEnemyProjectileNames()local a3,a4={},game:GetService'ReplicatedStorage'local
a5=a4:FindFirstChild(ae)if not a5 then return a3 end for a6,a7 in ipairs(a5:
GetChildren())do local a8=a7.ClassName if a8=='Model'or a8=='MeshPart'or a8==
'Part'then a3[a7.Name]=true end end return a3 end function ah.GetKeyHoldTime()
return ad end if ac and ac.Character and ac.Character.Parent then ah.
SetHumanoid(ac.Character)a1()else local a3=ac and ac.CharacterAdded and task.
spawn(function()local a3=ac.CharacterAdded:Wait()if a3 and ab.IsActive()then ah.
SetHumanoid(a3)a1()end end)end if ac then aT(ac.CharacterAdded:Connect(function(
a3)local a4,a5=pcall(function()if not a3 then return end aH=os.clock()ah.
SetHumanoid(a3)a1()for a4,a5 in ipairs(aF)do pcall(a5)end end)if not a4 then
warn('[Shared] respawn handler error:',tostring(a5))end end))end task.spawn(
function()while ab.IsActive()do task.wait(af)local a3=workspace:FindFirstChild
'dungeon'if dungeon and a3~=dungeon then aN()elseif not dungeon and a3 then aM()
end aO()end end)local a3=function()local a3=game:GetService'Workspace'for a4,a5
in ipairs(a3:GetDescendants())do if a5.Name=='dungeonName'and a5:IsA'ValueBase'
then local a6=a5.Value if type(a6)=='string'then local a7=string.gsub(a6,'%s+',
'')if a7~=''and string.lower(a7)~=aC then return a6 end end end end return nil
end task.spawn(function()while ab.IsActive()do task.wait(af)local a4=a3()if a4~=
aK then aK=a4 if a4 then ah.ResetBossIndex()end for a5=#aB,1,-1 do pcall(aB[a5],
a4)end end end end)local a4=function()return not(aK and#aK>0)end task.spawn(
function()while ab.IsActive()do task.wait(af)local a5=a4()if a5~=aD then aD=a5
for a6=#aE,1,-1 do pcall(aE[a6],aD)end end end end)task.spawn(function()local a5
,a6=pcall(function()return aM()end)if not a5 then warn(
'[EnemyTracker] Initialization error:',a6)end end)local a5=function()if not
dungeon then dungeon=workspace:FindFirstChild'dungeon'end if not dungeon then
return end local a5=pcall(function()for a5,a6 in ipairs(dungeon:GetChildren())do
if a6:IsA'Folder'or a6:IsA'Model'then if a6:IsA'Model'and aV(a6)then a_(a6)end
for a7,a8 in ipairs(a6:GetDescendants())do if a8:IsA'Model'then a_(a8)end end
end end aL()end)if not a5 then warn'[EnemyTracker] scanDungeonEnemies error'end
end function ah.ForceRescan()a5()end local a6,a7=0,2 task.spawn(function()while
ab.IsActive()do task.wait(a7)local a8=os.clock()if a8-a6<a7 then continue end a6
=a8 a5()end end)function ah.IsBossActive()return an end function ah.
OnBossActiveChanged(a8)if type(a8)~='function'then return function()end end
table.insert(ao,a8)return function()for a9,b in ipairs(ao)do if b==a8 then table
.remove(ao,a9)break end end end end function ah.GetCurrentBossIndex()return ap
end function ah.GetCombatTargetKey()if not an then return'Mob'end local a8=math.
clamp(ap,1,3)return'Boss'..tostring(a8)end function ah.ResetBossIndex()ap=0 aQ=
nil for a8=#aq,1,-1 do pcall(aq[a8],ap)end end function ah.OnBossIndexChanged(a8
)if type(a8)~='function'then return function()end end table.insert(aq,a8)return
function()for a9,b in ipairs(aq)do if b==a8 then table.remove(aq,a9)break end
end end end local a8=function(a8)if type(a8)~='string'then return 0 end local a9
=string.lower(a8)local b=string.match(a9,'boss.*(%d+)')if b then return 100+(
tonumber(b)or 1)end if string.find(a9,'boss')then return 100+math.max(1,ap)end
local ba=string.match(a8,'^room(%d+)$')if not ba then return 0 end return
tonumber(ba)or 0 end local a9=function()if not dungeon then return 0 end for a9,
b in pairs(au)do if b and b.Room then local ba=a8(b.Room.Name)if ba>0 then
return ba end end end if an then return 100+math.max(1,ap)end return 0 end aO=
function()local b=a9()if b==ar then return end ar=b for ba=#as,1,-1 do pcall(as[
ba],ar)end end function ah.GetCurrentRoomIndex()return ar end function ah.
OnRoomIndexChanged(b)if type(b)~='function'then return function()end end table.
insert(as,b)return function()for ba,bb in ipairs(as)do if bb==b then table.
remove(as,ba)break end end end end function ah.GetCurrentDungeonName()return aK
end function ah.OnDungeonNameChanged(b)if type(b)~='function'then return
function()end end table.insert(aB,b)return function()for ba,bb in ipairs(aB)do
if bb==b then table.remove(aB,ba)break end end end end function ah.IsInLobby()
return aD end function ah.OnLobbyChanged(b)if type(b)~='function'then return
function()end end table.insert(aE,b)return function()for ba,bb in ipairs(aE)do
if bb==b then table.remove(aE,ba)break end end end end local b aP=function()if
not an or aQ~=nil then return end for ba,bb in pairs(au)do if bb and bb.Root and
bb.Root.Parent then local bc=false if bb.Room and type(bb.Room.Name)=='string'
and string.find(string.lower(bb.Room.Name),'boss')then bc=true elseif string.
find(string.lower(ba.Name),'boss')then bc=true elseif ba.Parent and string.find(
string.lower(ba.Parent.Name),'boss')then bc=true end if bc then aQ=bb.Root.
Position return end end end for ba,bb in pairs(au)do if bb and bb.Root and bb.
Root.Parent then aQ=bb.Root.Position return end end end local ba=function(ba)if
an==ba then return end an=ba if ba then ap+=1 aQ=nil a5()aP()for bb=#aq,1,-1 do
pcall(aq[bb],ap)end else aQ=nil end for bb=#ao,1,-1 do pcall(ao[bb],an)end aO()
end function ah.GetBossSpawnPosition()if aQ then return aQ end aP()return aQ end
function ah.SetBossSpawnPosition(bb)aQ=bb end local function bb()if not ac then
return end local bc=ac:FindFirstChild'PlayerGui'if not bc then b=nil ba(false)
return end local bd=bc:FindFirstChild('bossHealth',true)if bd then if bd~=b then
b=bd if b:IsA'ScreenGui'then aT(b:GetPropertyChangedSignal'Enabled':Connect(bb))
elseif b:IsA'GuiObject'then aT(b:GetPropertyChangedSignal'Visible':Connect(bb))
end end local be=if bd:IsA'ScreenGui'then bd.Enabled elseif bd:IsA'GuiObject'
then bd.Visible else true ba(be)else b=nil ba(false)end end task.spawn(function(
)if not ac then return end local bc=ac:WaitForChild('PlayerGui',30)if not bc
then return end aT(bc.DescendantAdded:Connect(bb))aT(bc.DescendantRemoving:
Connect(bb))bb()while ab.IsActive()and task.wait(0.5)do bb()end end)local bc,bd=
{}local be=function()if bd then return bd end pcall(function()local be=ac or
game:GetService'Players'.LocalPlayer local bf=be and be:FindFirstChild
'PlayerScripts'local bg=bf and bf:FindFirstChild'PlayerModule'if bg then bd=
require(bg):GetControls()end end)return bd end function ah.DisableControls(bf)bf
=bf or'default'bc[bf]=true local bg=be()if bg and type(bg.Disable)=='function'
then pcall(function()bg:Disable()end)end end function ah.EnableControls(bf)bf=bf
or'default'bc[bf]=nil if next(bc)~=nil then return end local bg=be()if bg and
type(bg.Enable)=='function'then pcall(function()bg:Enable()end)end end ab.
Register(function()if aR then aR:Disconnect()aR=nil end for bf,bg in ipairs(aG)
do pcall(function()bg:Disconnect()end)end table.clear(aG)table.clear(bc)local bf
=be()if bf and type(bf.Enable)=='function'then pcall(function()bf:Enable()end)
end aN()end)return ah end function a.k()local aa,ab,ac,ad,ae,af,ah,ai,aj=a.load
'g',a.load'i',a.load'j',{},{Mob={Min=15,Max=35,BossArea=false,BossAreaRadius=80,
DisableDodge=false,EnableHazardScanner=true},Boss1={Min=25,Max=50,BossArea=false
,BossAreaRadius=80,DisableDodge=false,EnableHazardScanner=true},Boss2={Min=25,
Max=50,BossArea=false,BossAreaRadius=80,DisableDodge=false,EnableHazardScanner=
true},Boss3={Min=25,Max=50,BossArea=false,BossAreaRadius=80,DisableDodge=false,
EnableHazardScanner=true}},{Normal='Mob',['Boss 1']='Boss1',['Boss 2']='Boss2',[
'Boss 3']='Boss3'},{Mob='Normal',Boss1='Boss 1',Boss2='Boss 2',Boss3='Boss 3'},{
},{}function ad.GetTargetDisplay(ak)return ah[ak]or'Normal'end function ad.
GetTargetKey(ak)return af[ak]or'Mob'end function ad.GetTargetOptions()return{
'Normal','Boss 1','Boss 2','Boss 3'}end function ad.GetSaveData()return ai end
function ad.LoadData(ak)if type(ak)=='table'then ai=ak else ai={}end aa.
contextData=ai for al,am in ipairs(aj)do pcall(am)end end function ad.
OnDataChanged(ak)if type(ak)~='function'then return function()end end table.
insert(aj,ak)return function()for al,am in ipairs(aj)do if am==ak then table.
remove(aj,al)break end end end end local ak=function()aa.contextData=ai ab.Save(
)end function ad.GetCombatDistances(al,am)local an=am or'Mob'local ao=ae[an]or
ae.Mob if type(al)=='string'and#al>0 and ai[al]and ai[al][an]then local ap=ai[al
][an]local aq,ar=(type(ap.Min)=='number'and ap.Min>0)and ap.Min or ao.Min,(type(
ap.Max)=='number'and ap.Max>0)and ap.Max or ao.Max return aq,ar end return ao.
Min,ao.Max end function ad.GetActiveCombatDistances(al)local am,an,ao=ac.
GetCurrentDungeonName(),'Mob',false if ac.IsBossActive and ac.IsBossActive()then
ao=true an=ac.GetCombatTargetKey()elseif al then if al.Room and type(al.Room.
Name)=='string'and string.find(string.lower(al.Room.Name),'boss')then ao=true
elseif al.Model then local ap=string.lower(al.Model.Name)if string.find(ap,
'boss')then ao=true else local aq=al.Model.Parent if aq and string.find(string.
lower(aq.Name),'boss')then ao=true end end end if ao then local ap=ac.
GetCurrentBossIndex and ac.GetCurrentBossIndex()or 1 an='Boss'..tostring(math.
clamp(ap,1,3))end end return ad.GetCombatDistances(am,an)end function ad.
GetBossArea(al,am)local an=am or'Mob'if an=='Mob'then return false,80 end local
ao=ae[an]or ae.Boss1 if type(al)=='string'and#al>0 and ai[al]and ai[al][an]then
local ap=ai[al][an]local aq,ar=ap.BossArea==true,(type(ap.BossAreaRadius)==
'number'and ap.BossAreaRadius>0)and ap.BossAreaRadius or(ao.BossAreaRadius or 80
)return aq,ar end return ao.BossArea or false,ao.BossAreaRadius or 80 end
function ad.SetBossAreaEnabled(al,am,an)if not(type(al)=='string'and#al>0)then
return end local ao=am or'Mob'if ao=='Mob'then return end ai[al]=ai[al]or{}ai[al
][ao]=ai[al][ao]or{}ai[al][ao].BossArea=an and true or false ak()end function ad
.SetBossAreaRadius(al,am,an)if not(type(al)=='string'and#al>0)then return end
local ao=am or'Mob'if ao=='Mob'then return end if type(an)~='number'or an<=0
then return end ai[al]=ai[al]or{}ai[al][ao]=ai[al][ao]or{}ai[al][ao].
BossAreaRadius=an ak()end function ad.GetActiveBossArea(al)local am,an,ao=ac.
GetCurrentDungeonName(),'Mob',false if ac.IsBossActive and ac.IsBossActive()then
ao=true an=ac.GetCombatTargetKey()elseif al then if al.Room and type(al.Room.
Name)=='string'and string.find(string.lower(al.Room.Name),'boss')then ao=true
elseif al.Model then local ap=string.lower(al.Model.Name)if string.find(ap,
'boss')then ao=true else local aq=al.Model.Parent if aq and string.find(string.
lower(aq.Name),'boss')then ao=true end end end if ao then local ap=ac.
GetCurrentBossIndex and ac.GetCurrentBossIndex()or 1 an='Boss'..tostring(math.
clamp(ap,1,3))end end if not ao or an=='Mob'then return false,0,nil end local ap
,aq=ad.GetBossArea(am,an)if not ap then return false,aq,nil end local ar=ac.
GetBossSpawnPosition and ac.GetBossSpawnPosition()if not ar and al and al.Root
then ar=al.Root.Position if ac.SetBossSpawnPosition then ac.
SetBossSpawnPosition(ar)end end return ap,aq,ar end function ad.GetDisableDodge(
al,am)local an=am or'Mob'local ao=ae[an]or ae.Mob if type(al)=='string'and#al>0
and ai[al]and ai[al][an]then local ap=ai[al][an]if ap.DisableDodge~=nil then
return ap.DisableDodge==true end end return ao.DisableDodge or false end
function ad.SetDisableDodge(al,am,an)if not(type(al)=='string'and#al>0)then
return end local ao=am or'Mob'ai[al]=ai[al]or{}ai[al][ao]=ai[al][ao]or{}ai[al][
ao].DisableDodge=an and true or false ak()end function ad.GetEnableHazardScanner
(al,am)local an=am or'Mob'local ao=ae[an]or ae.Mob if type(al)=='string'and#al>0
and ai[al]and ai[al][an]then local ap=ai[al][an]if ap.EnableHazardScanner~=nil
then return ap.EnableHazardScanner==true end end return ao.EnableHazardScanner~=
false end function ad.SetEnableHazardScanner(al,am,an)if not(type(al)=='string'
and#al>0)then return end local ao=am or'Mob'ai[al]=ai[al]or{}ai[al][ao]=ai[al][
ao]or{}ai[al][ao].EnableHazardScanner=an and true or false ak()end function ad.
IsActiveDodgeDisabled(al)local am,an,ao=ac.GetCurrentDungeonName(),'Mob',false
if ac.IsBossActive and ac.IsBossActive()then ao=true an=ac.GetCombatTargetKey()
elseif al then if al.Room and type(al.Room.Name)=='string'and string.find(string
.lower(al.Room.Name),'boss')then ao=true elseif al.Model then local ap=string.
lower(al.Model.Name)if string.find(ap,'boss')then ao=true else local aq=al.Model
.Parent if aq and string.find(string.lower(aq.Name),'boss')then ao=true end end
end if ao then local ap=ac.GetCurrentBossIndex and ac.GetCurrentBossIndex()or 1
an='Boss'..tostring(math.clamp(ap,1,3))end end return ad.GetDisableDodge(am,an)
end function ad.IsActiveHazardScannerEnabled(al)local am,an,ao=ac.
GetCurrentDungeonName(),'Mob',false if ac.IsBossActive and ac.IsBossActive()then
ao=true an=ac.GetCombatTargetKey()elseif al then if al.Room and type(al.Room.
Name)=='string'and string.find(string.lower(al.Room.Name),'boss')then ao=true
elseif al.Model then local ap=string.lower(al.Model.Name)if string.find(ap,
'boss')then ao=true else local aq=al.Model.Parent if aq and string.find(string.
lower(aq.Name),'boss')then ao=true end end end if ao then local ap=ac.
GetCurrentBossIndex and ac.GetCurrentBossIndex()or 1 an='Boss'..tostring(math.
clamp(ap,1,3))end end if ad.GetDisableDodge(am,an)then return false end return
ad.GetEnableHazardScanner(am,an)end function ad.SetMinCombatDistance(al,am,an)if
not(type(al)=='string'and#al>0)then return end local ao=am or'Mob'if type(an)~=
'number'or an<=0 then return end ai[al]=ai[al]or{}ai[al][ao]=ai[al][ao]or{}local
ap=ai[al][ao].Max or(ae[ao]or ae.Mob).Max ai[al][ao].Min=an if an>ap then ai[al]
[ao].Max=an+5 end ak()end function ad.SetMaxCombatDistance(al,am,an)if not(type(
al)=='string'and#al>0)then return end local ao=am or'Mob'if type(an)~='number'or
an<=0 then return end ai[al]=ai[al]or{}ai[al][ao]=ai[al][ao]or{}local ap=ai[al][
ao].Min or(ae[ao]or ae.Mob).Min ai[al][ao].Max=an if an<ap then ai[al][ao].Min=
math.max(1,an-5)end ak()end function ad.ResetTarget(al,am)if not(type(al)==
'string'and#al>0)then return end local an=am or'Mob'if ai[al]then ai[al][an]=nil
if next(ai[al])==nil then ai[al]=nil end ak()end end function ad.ResetDungeon(al
)if not(type(al)=='string'and#al>0)then return end if ai[al]then ai[al]=nil ak()
end end return ad end end local aa,ab,ac,ad,ae=a.load'a',a.load'b',a.load'c',a.
load'f',a.load'k'local af,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax=aa.
RunService or game:GetService'RunService',aa.player,{},true,false,{},1.8,Color3.
fromRGB(0,255,170),Color3.fromRGB(255,35,35),0.45,0.2,0.2,(game:GetService
'Players')local ay,az,aA,aB=function()local ay=ah or as.LocalPlayer if not ay
then return nil end local az=ay.Character if not az or not az.Parent then return
nil end local aA=az:FindFirstChildOfClass'Humanoid'if aA and aA.Health<=0 then
return nil end return az:FindFirstChild'HumanoidRootPart'or az.PrimaryPart end,
function(ay)if not ay then return 0 end return ay.Position.Y-2.5 end,function(ay
)if aw then if aw.Parent~=ay or not aw:IsDescendantOf(workspace)then pcall(
function()aw:Destroy()end)aw=nil else if aw.Adornee~=ay then aw.Adornee=ay end
return aw end end if not ay or not ay.Parent then return nil end local az=
Instance.new'CylinderHandleAdornment'az.Name='Player_2D_HitboxVisual'az.Adornee=
ay az.Radius=am az.Height=ar az.Color3=ak and ao or an az.Transparency=ak and aq
or ap az.ZIndex=5 az.AlwaysOnTop=false az.Visible=aj az.Parent=ay aw=az return
az end,function(ay)if not aw or not aw.Parent then return end aw.Color3=ay and
ao or an aw.Transparency=ay and aq or ap end local aC=function()local aC=ay()if
not aC or not aC.Parent then if aw and aw.Parent then aw.Visible=false end if ak
then ak=false at=nil au=nil for aD,aE in ipairs(al)do pcall(aE,false,nil,nil)end
end return end local aD=aA(aC)if aD and aD.Parent then aD.Visible=aj aD.Radius=
am local aE=az(aC)local aF=CFrame.new(Vector3.new(aC.Position.X,aE,aC.Position.Z
))*CFrame.Angles(math.rad(90),0,0)aD.CFrame=aC.CFrame:ToObjectSpace(aF)end if ae
.IsActiveHazardScannerEnabled and not ae.IsActiveHazardScannerEnabled()then if
ak then ak=false at=nil au=nil aB(false)for aE,aF in ipairs(al)do pcall(aF,false
,nil,nil)end end return end local aE=Vector3.new(aC.Position.X,0,aC.Position.Z)
local aF,aG,aH=ac.IsPointInAnyHazard(aE,nil,am)local aI,aJ=false if not aF and
ad.IsPointInAnyTrajectory then aI,aJ=ad.IsPointInAnyTrajectory(aE,am)end local
aK,aL,aM=(aF or aI),aG or aJ,aF and'Ground Zone'or(aI and'Trajectory Corridor'or
nil)if aK~=ak or aL~=at then ak=aK at=aL au=aM aB(aK)for aN,aO in ipairs(al)do
pcall(aO,aK,aL,aM)end end end local aD=function()if not av then av=af.Heartbeat:
Connect(aC)end end function ai.Cleanup()if av then av:Disconnect()av=nil end if
aw then pcall(function()aw:Destroy()end)aw=nil end ak=false at=nil au=nil end
function ai.IsPlayerInDanger()return ak,at,au end function ai.GetCurrentThreat()
return at,au end function ai.OnDangerStatusChanged(aE)if type(aE)=='function'
then table.insert(al,aE)end end function ai.SetVisualEnabled(aE)aj=aE and true
or false if aw then aw.Visible=aj end end function ai.IsVisualEnabled()return aj
end function ai.SetRadius(aE)if type(aE)=='number'and aE>=0.1 then am=aE if aw
and aw.Parent then aw.Radius=am end end end function ai.GetRadius()return am end
local aE=function()local aE=ah or as.LocalPlayer if not aE then return end local
aF=function(aF)if aw then pcall(function()aw:Destroy()end)aw=nil end task.spawn(
function()local aG=aF:WaitForChild('Humanoid',3)if aG then aG.Died:Connect(
function()if aw then aw.Visible=false end end)end end)end ax=aE.CharacterAdded:
Connect(aF)if aE.Character then aF(aE.Character)end end aE()aD()ab.Register(
function()if ax then ax:Disconnect()ax=nil end ai.Cleanup()end)return ai