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
load'a',a.load'b',a.load'c'local e,f,g,h,i,j,k,l,m,n,o,p=b.RunService or game:
GetService'RunService',b.player,{},false,{},0.85,Color3.fromRGB(255,45,45),
Color3.fromRGB(0,160,255),0.55,0.25 local q=function()local q=f and f.Character
if not q then return nil end local r=q:FindFirstChild'HumanoidRootPart'or q.
PrimaryPart if not r then return nil end return r.Position.Y-2.5 end function g.
BindDetection(r)o=r or nil end local r function g.BindTrajectory(s)r=s or nil
end function g.IsEnabled()return h end local s=function(s,t)local u,v,w=s.ad,s.
zone,s.part local x=s.anchorPart or w if not u or not u.Parent or not x or not x
.Parent then return end local y=v and(v.isSecondBossChain or(s.hazardInfo and s.
hazardInfo.IsSyntheticChain))local z=(y and v.cx and v.cz and Vector3.new(v.cx,0
,v.cz))or(w and w.Parent and w.Position)or((v and v.cx and v.cz)and Vector3.new(
v.cx,0,v.cz))if not z then return end local A=Vector3.new(z.X,t or z.Y,z.Z)if s.
isCircle then local B=CFrame.new(A)*CFrame.Angles(math.rad(90),0,0)u.CFrame=(x==
workspace.Terrain)and B or x.CFrame:ToObjectSpace(B)else local B if v and(v.
isMovingBeam or v.isBigSpike)then local C=r and r.GetHazardDirection and r.
GetHazardDirection(s.hazardInfo)if C and C.Magnitude>0.01 then B=CFrame.lookAt(A
,A+C)else local D=(w and w.Parent)and w.CFrame or CFrame.identity local E,F,G=D:
ToOrientation()B=CFrame.new(A)*CFrame.Angles(0,F,0)end else local C=(w and w.
Parent)and w.CFrame or CFrame.identity local D,F,G=C:ToOrientation()B=CFrame.
new(A)*CFrame.Angles(0,F,0)end u.CFrame=(x==workspace.Terrain)and B or x.CFrame:
ToObjectSpace(B)end end local t=function()if not h then return end local t,u,v=
false,q(),os.clock()for w,x in pairs(i)do local y,z=w.IsSyntheticChain or(w.
MaxExpireTime and v<w.MaxExpireTime),w.Instance and w.Instance.Parent if not z
and not y then g.DetachZoneVisuals(w)else if x.items then local A={}for B,C in
ipairs(x.items)do local F=C.zone if F and F.expireTime and v>F.expireTime then
if C.ad and C.ad.Parent then pcall(function()C.ad:Destroy()end)end elseif C.ad
and C.ad.Parent then table.insert(A,C)s(C,u)end end x.items=A if#A>0 then t=true
else g.DetachZoneVisuals(w)end end end end if not t and p then p:Disconnect()p=
nil end end local u=function()if not p and h then p=e.Heartbeat:Connect(t)end
end function g.DetachZoneVisuals(v)if not v then return end local w=i[v]if not w
then return end if w.adornments then for x,y in ipairs(w.adornments)do pcall(
function()y:Destroy()end)end table.clear(w.adornments)end if w.connections then
for x,y in ipairs(w.connections)do pcall(function()y:Disconnect()end)end table.
clear(w.connections)end if w.items then table.clear(w.items)end i[v]=nil end
function g.UpdateHazardVisualColor(v,w)if not v then return end local x=i[v]if
not x or not x.items then return end local y=w==true or v.IsTrajectory==true
local z,A=y and l or k,y and d.GetTrajectoryMargin()or 0 for B,C in ipairs(x.
items)do local F,G,H=C.ad,C.zone,C.part if F and F.Parent and G and H and H.
Parent then F.Color3=z if C.isCircle and G.radius then F.Radius=G.radius+A
elseif G.half then local I,J=G.half.X,G.half.Z F.Size=Vector3.new(I*2,n,J*2)end
end end end function g.AttachZoneVisuals(v)if not h or not v then return end if
i[v]then g.DetachZoneVisuals(v)end local w=d.GetHazardZones(v)if not w or not w.
zones then return end local x=v.IsTrajectory==true local y,z,A,B,C,F,G=x and l
or k,x and d.GetTrajectoryMargin()or 0,q(),{},{},{},workspace.Terrain for H,I in
ipairs(w.zones)do local J,K,L,M=I.part,I.isSecondBossChain==true,I.isMovingBeam
==true,I.isBigSpike==true local N=(K or L or M)and G or J if K or L or M or(J
and J.Parent and J.Transparency<=j)then local O,P=false if I.radius then O=true
local Q=Instance.new'CylinderHandleAdornment'Q.Name='HazardGroundCircle'Q.
Adornee=N Q.Radius=I.radius+z Q.Height=n Q.Color3=y Q.Transparency=m Q.ZIndex=2
Q.AlwaysOnTop=true Q.Parent=N P=Q elseif I.half and I.cframe then local Q=
Instance.new'BoxHandleAdornment'Q.Name='HazardGroundBox'Q.Adornee=N Q.Size=
Vector3.new(I.half.X*2,n,I.half.Z*2)Q.Color3=y Q.Transparency=m Q.ZIndex=2 Q.
AlwaysOnTop=true Q.Parent=N P=Q end if P then local Q={ad=P,part=J,anchorPart=N,
isCircle=O,zone=I,hazardInfo=v}s(Q,A)table.insert(B,Q)table.insert(C,P)if(not K
and not L)and J then local R=J:GetPropertyChangedSignal'Transparency':Connect(
function()if J.Parent and J.Transparency>j then pcall(function()P:Destroy()end)
end end)table.insert(F,R)end end end end if#C>0 then i[v]={items=B,adornments=C,
connections=F}u()end end function g.ClearAll()if p then p:Disconnect()p=nil end
for v in pairs(i)do g.DetachZoneVisuals(v)end table.clear(i)end function g.
RefreshAll()g.ClearAll()if not h or not o then return end for v,w in pairs(o.
GetActiveHazardsMap())do g.AttachZoneVisuals(w)end end function g.SetEnabled(v)h
=v and true or false if h then g.RefreshAll()else g.ClearAll()end end d.
OnPaddingChanged(function()if h then g.RefreshAll()end end)c.Register(function()
g.ClearAll()end)return g