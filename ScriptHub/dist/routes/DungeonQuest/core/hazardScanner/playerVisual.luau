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
return h end end local aa,ab,ac,ad=a.load'a',a.load'b',a.load'c',a.load'f'local
ae,af,ah,ai,aj,ak,al,am,an,ao,b,c,d,e,f,g,h,i=aa.RunService or game:GetService
'RunService',aa.player,{},true,false,{},1.8,Color3.fromRGB(0,255,170),Color3.
fromRGB(255,35,35),0.45,0.2,0.2,(game:GetService'Players')local j,k,l,m=function
()local j=af or d.LocalPlayer if not j then return nil end local k=j.Character
if not k or not k.Parent then return nil end local l=k:FindFirstChildOfClass
'Humanoid'if l and l.Health<=0 then return nil end return k:FindFirstChild
'HumanoidRootPart'or k.PrimaryPart end,function(j)if not j then return 0 end
return j.Position.Y-2.5 end,function(j)if h then if h.Parent~=j or not h:
IsDescendantOf(workspace)then pcall(function()h:Destroy()end)h=nil else if h.
Adornee~=j then h.Adornee=j end return h end end if not j or not j.Parent then
return nil end local k=Instance.new'CylinderHandleAdornment'k.Name=
'Player_2D_HitboxVisual'k.Adornee=j k.Radius=al k.Height=c k.Color3=aj and an or
am k.Transparency=aj and b or ao k.ZIndex=5 k.AlwaysOnTop=false k.Visible=ai k.
Parent=j h=k return k end,function(j)if not h or not h.Parent then return end h.
Color3=j and an or am h.Transparency=j and b or ao end local n=function()local n
=j()if not n or not n.Parent then if h and h.Parent then h.Visible=false end if
aj then aj=false e=nil f=nil for o,p in ipairs(ak)do pcall(p,false,nil,nil)end
end return end local o=l(n)if o and o.Parent then o.Visible=ai o.Radius=al local
p=k(n)local q=CFrame.new(Vector3.new(n.Position.X,p,n.Position.Z))*CFrame.
Angles(math.rad(90),0,0)o.CFrame=n.CFrame:ToObjectSpace(q)end local p=Vector3.
new(n.Position.X,0,n.Position.Z)local q,r,s=ac.IsPointInAnyHazard(p,nil,al)local
t,u=false if not q and ad.IsPointInAnyTrajectory then t,u=ad.
IsPointInAnyTrajectory(p,al)end local v,w,x=(q or t),r or u,q and'Ground Zone'or
(t and'Trajectory Corridor'or nil)if v~=aj or w~=e then aj=v e=w f=x m(v)for y,z
in ipairs(ak)do pcall(z,v,w,x)end end end local o=function()if not g then g=ae.
Heartbeat:Connect(n)end end function ah.Cleanup()if g then g:Disconnect()g=nil
end if h then pcall(function()h:Destroy()end)h=nil end aj=false e=nil f=nil end
function ah.IsPlayerInDanger()return aj,e,f end function ah.GetCurrentThreat()
return e,f end function ah.OnDangerStatusChanged(p)if type(p)=='function'then
table.insert(ak,p)end end function ah.SetVisualEnabled(p)ai=p and true or false
if h then h.Visible=ai end end function ah.IsVisualEnabled()return ai end
function ah.SetRadius(p)if type(p)=='number'and p>=0.1 then al=p if h and h.
Parent then h.Radius=al end end end function ah.GetRadius()return al end local p
=function()local p=af or d.LocalPlayer if not p then return end local q=function
(q)if h then pcall(function()h:Destroy()end)h=nil end task.spawn(function()local
r=q:WaitForChild('Humanoid',3)if r then r.Died:Connect(function()if h then h.
Visible=false end end)end end)end i=p.CharacterAdded:Connect(q)if p.Character
then q(p.Character)end end p()o()ab.Register(function()if i then i:Disconnect()i
=nil end ah.Cleanup()end)return ah