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
load'a',a.load'b',a.load'c'local e,f,g,h,i,j,k,l,m,n,o,p,q=b.RunService or game:
GetService'RunService',b.player,{},false,{},0.85,Color3.fromRGB(255,45,45),
Color3.fromRGB(0,160,255),Color3.fromRGB(0,230,90),0.55,0.25 local r=function()
local r=f and f.Character if not r then return nil end local s=r:FindFirstChild
'HumanoidRootPart'or r.PrimaryPart if not s then return nil end return s.
Position.Y-2.5 end function g.BindDetection(s)p=s or nil end local s function g.
BindTrajectory(t)s=t or nil end function g.IsEnabled()return h end local t=
function(t,u)local v,w,x=t.ad,t.zone,t.part local y=t.anchorPart or x if not v
or not v.Parent or not y or not y.Parent then return end local z=w and(w.
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
function()g.ClearAll()end)return g