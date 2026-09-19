local a,b,c,d,e,f,g={},0.85,0,2,{},64 function a.BindDetection(h)g=h or nil end
function a.GetHazardPadding()return c end a.GetHitboxPadding=a.GetHazardPadding
function a.GetTrajectoryMargin()return d end function a.SetTrajectoryMargin(h)if
type(h)=='number'and h>=0 and h~=d then d=h a.InvalidateCache()for i,j in
ipairs(e)do pcall(j,d)end end end function a.InvalidateCache()if g and g.
GetActiveHazardsMap then for h,i in pairs(g.GetActiveHazardsMap())do i.
HazardZones=nil end end end function a.OnPaddingChanged(h)if type(h)=='function'
then table.insert(e,h)end end function a.SetHazardPadding(h)if type(h)=='number'
and h>=0 and h~=c then c=h a.InvalidateCache()for i,j in ipairs(e)do pcall(j,c)
end end end a.SetHitboxPadding=a.SetHazardPadding local h,i,j,k=game:GetService
'ReplicatedStorage',{'firstBossCrissCross','firstBossSeekingSpikes'},{
'smallicespikes','mediumicespikes','largeicespikes'}local l=function(l)if not l
or type(l)~='string'then return false end local m=l:lower():gsub('%s+','')if#m==
0 then return false end for n,o in ipairs(j)do if string.find(m,o,1,true)then
return true end end return false end function a.IsIceSpikesChain(m)return l(m)
end local m,n={'secondbosscriclehitbox','secondbosscirclehitbox'},1.2 local o=
function(o)if not o or type(o)~='string'then return false end local p=o:lower():
gsub('%s+','')if#p==0 then return false end for q,r in ipairs(m)do if string.
find(p,r,1,true)then return true end end return false end function a.
IsSecondBossCircleChain(p)return o(p)end function a.GetSecondBossCircleDuration(
)return n end function a.SetSecondBossCircleDuration(p)if type(p)=='number'and p
>=0.1 then n=math.clamp(p,0.1,10)a.InvalidateCache()end end local p={
'movingbeam'}local q=function(q)if not q or type(q)~='string'then return false
end local r=q:lower():gsub('%s+','')if#r==0 then return false end for s,t in
ipairs(p)do if string.find(r,t,1,true)then return true end end return false end
function a.IsMovingBeam(r)return q(r)end local r,s={'firstbossbigspike',
'firstbossbeampart','bigspike'},function(r)if not r or type(r)~='string'then
return false end local s=r:lower():gsub('%s+','')return string.find(s,
'firstbossbeampart',1,true)~=nil end function a.IsBeamTelegraph(t)return s(t)end
local t=function(t)if not t or type(t)~='string'then return false end local u=t:
lower():gsub('%s+','')if#u==0 or string.find(u,'seekingspike',1,true)then return
false end for v,w in ipairs(r)do if string.find(u,w,1,true)then return true end
end return false end function a.IsBigSpike(u)return t(u)end local u=function()if
k and k>0 then return k end local u,v=45,h:FindFirstChild'enemyProjectiles'if
not v then return u end local w=v:FindFirstChild'largeIceSpikes'if not w then
for x,y in ipairs(v:GetChildren())do local z=(y.Name or''):lower():gsub('%s+',''
)if z=='largeicespikes'then w=y break end end end if not w then return u end
local x,y=0,Vector3.zero if w:IsA'Model'and w.PrimaryPart then y=w.PrimaryPart.
Position elseif w:IsA'BasePart'then y=w.Position end local z={}if w:IsA
'BasePart'then table.insert(z,w)else for A,B in ipairs(w:GetDescendants())do if
B:IsA'BasePart'then table.insert(z,B)end end end if#z==0 then return u end for A
,B in ipairs(z)do local C=B.Size local D,E=math.max(C.X,C.Z)/2,(Vector3.new(B.
Position.X,0,B.Position.Z)-Vector3.new(y.X,0,y.Z)).Magnitude local F=E+D if F>x
then x=F end end if x>=5 then k=x return k end return u end function a.
GetLargeIceSpikesMaxRadius()return u()end local v=function(v)if not v or type(v)
~='string'then return false end local w=v:lower():gsub('%s+','')if#w==0 then
return false end for x,y in ipairs(i)do local z=y:lower():gsub('%s+','')if#z>0
and string.find(w,z,1,true)then return true end end return false end function a.
IsForceCircle(w)return v(w)end function a.AddForceCircleName(w)if type(w)==
'string'and#w>0 then table.insert(i,w)a.InvalidateCache()end end function a.
GetForceCircleNames()return i end local w,x,y,z=function(w)return w and w.Parent
and w.Transparency<=b end,function(w,x,y)local z,A,B,C=w.Size,y and d or c,(w
and w.Name)or'',(w and w.Parent and w.Parent.Name)or''if t(B)or t(C)then local D
,E=z,w:FindFirstChildWhichIsA('SpecialMesh',true)if E then D=Vector3.new(D.X*
math.abs(E.Scale.X),D.Y*math.abs(E.Scale.Y),D.Z*math.abs(E.Scale.Z))end local F=
{D.X,D.Y,D.Z}table.sort(F)local G,H=math.clamp(F[2],6,60),math.clamp(F[3],8,80)
local I,J=G/2+A,H/2+A return{half=Vector3.new(I,0,J),cframe=w.CFrame,isBigSpike=
true}end if x or(w:IsA'Part'and(w.Shape==Enum.PartType.Ball or w.Shape==Enum.
PartType.Cylinder))then return{radius=math.max(z.X,z.Y,z.Z)/2}end local D=
Vector3.new(math.max(z.X,0)/2+A,0,math.max(z.Z,0)/2+A)return{half=D,cframe=w.
CFrame}end,function(w,x,y,z)if not x then return false end if x.expireTime and
os.clock()>x.expireTime then return false end local A,B=w.X,w.Z y=y or 0 local C
=(z or x.isTrajectory)and d or c if x.radius then local D,E=(x.part and x.part.
Parent)and x.part.Position,x.isSecondBossChain==true local F,G=(E and x.cx)or(D
and D.X)or x.cx or 0,(E and x.cz)or(D and D.Z)or x.cz or 0 local H,I,J=A-F,B-G,x
.radius+C+y return(H*H+I*I)<=(J*J)end local D=(x.part and x.part.Parent)and x.
part.CFrame or x.cframe if D then local E,F,G=D:PointToObjectSpace(w),x.half.X,x
.half.Z if y<=0 then return math.abs(E.X)<=F and math.abs(E.Z)<=G else local H,I
=math.max(0,math.abs(E.X)-F),math.max(0,math.abs(E.Z)-G)return(H*H+I*I)<=(y*y)
end end return false end,function(w,x)local y=(x and x.CFrame)or(w:IsA'Model'and
w:GetPivot())if y then local z=y.LookVector local A=Vector3.new(-z.X,0,-z.Z)if A
.Magnitude>0.05 then return A.Unit end end local z=services.player or game:
GetService'Players'.LocalPlayer local A=z and z.Character local B=A and(A:
FindFirstChild'HumanoidRootPart'or A.PrimaryPart)if B and x then local C=Vector3
.new(B.Position.X-x.Position.X,0,B.Position.Z-x.Position.Z)if C.Magnitude>0.1
then return C.Unit end end return Vector3.new(0,0,-1)end local A=function(A)if
not A or not A.Instance or not A.Instance.Parent then return nil end local B=A.
Instance local C=A.Name or(B and B.Name)or''local D,E=v(C),A.IsTrajectory==true
local F,G=E and d or c if l(C)then local H,I=(u())if B:IsA'BasePart'then I=w(B)
and B or nil elseif B:IsA'Model'then if B.PrimaryPart and w(B.PrimaryPart)then I
=B.PrimaryPart else for J,K in ipairs(B:GetDescendants())do if K:IsA'BasePart'
and w(K)and K.Parent then I=K break end end end end if not I then return nil end
local J=I.Position local K={radius=H,cx=J.X,cz=J.Z,part=I,isTrajectory=false,
isIceSpikes=true}return{zones={K},center=Vector3.new(J.X,0,J.Z),boundingRadius=H
+F}end if o(C)then local H if B:IsA'BasePart'then H=w(B)and B or nil elseif B:
IsA'Model'then if B.PrimaryPart and w(B.PrimaryPart)then H=B.PrimaryPart else
for I,J in ipairs(B:GetDescendants())do if J:IsA'BasePart'and w(J)and J.Parent
then H=J break end end end end if not H then return nil end local I,J,K,L,M,N,O,
P,Q,R=H.Position,z(B,H),A.SpawnClock or os.clock(),{},10,11,3,22,n,0.4 local S=(
M-1)*P for T=1,M do local U=(T-1)*P local V,W,X=Vector3.new(I.X,0,I.Z)+J*U,N+(T-
1)*O,K+Q+(T-1)*R table.insert(L,{radius=W,cx=V.X,cz=V.Z,part=H,expireTime=X,
isTrajectory=false,isSecondBossChain=true,circleIndex=T})end local T,U=Vector3.
new(I.X,0,I.Z)+J*(S/2),N+(M-1)*O local V,W=(S/2)+U+F,K+Q+(M-1)*R if A then A.
MaxExpireTime=W A.IsSyntheticChain=true end return{zones=L,center=T,
boundingRadius=V,maxExpireTime=W}end if s(C)then return nil end if t(C)then
local H if B:IsA'BasePart'then H=w(B)and B or nil elseif B:IsA'Model'then H=B.
PrimaryPart or B:FindFirstChildWhichIsA'BasePart'if not H or not w(H)then for I,
J in ipairs(B:GetDescendants())do if J:IsA'BasePart'and w(J)and J.Parent then H=
J break end end end end if not H then return nil end local I,J,K=H.Position,H.
Size,H:FindFirstChildWhichIsA('SpecialMesh',true)if K then J=Vector3.new(J.X*
math.abs(K.Scale.X),J.Y*math.abs(K.Scale.Y),J.Z*math.abs(K.Scale.Z))end local L=
{J.X,J.Y,J.Z}table.sort(L)local M,N=math.clamp(L[2],6,60),math.clamp(L[3],8,80)
local O,P=M/2+F,N/2+F local Q={half=Vector3.new(O,0,P),cframe=H.CFrame,part=H,cx
=I.X,cz=I.Z,isTrajectory=E,isBigSpike=true}return{zones={Q},center=Vector3.new(I
.X,0,I.Z),boundingRadius=math.sqrt(O*O+P*P)}end if B:IsA'BasePart'then if not w(
B)then return nil end G={B}else G={}for H,I in ipairs(B:GetDescendants())do if#G
>=f then break end if I:IsA'BasePart'and w(I)and I.Parent then G[#G+1]=I end end
if#G==0 then return nil end end local H,I,J,K,L={},math.huge,-math.huge,math.
huge,-math.huge for M,N in ipairs(G)do local O,P=N.Position,N.Size local Q=math.
max(P.X,P.Y,P.Z)/2+F I=math.min(I,O.X-Q)J=math.max(J,O.X+Q)K=math.min(K,O.Z-Q)L=
math.max(L,O.Z+Q)local R=x(N,D,E)if R then R.part=N R.isTrajectory=E H[#H+1]=R
end end if#H==0 then return nil end local M,N,O,P=(I+J)/2,(K+L)/2,(J-I)/2,(L-K)/
2 return{zones=H,center=Vector3.new(M,0,N),boundingRadius=math.sqrt(O*O+P*P)}end
local B=function(B)local C=B and B.HazardZones if not C then C=A(B)if C and B
then B.HazardZones=C end end return C end function a.GetHazardZones(C)return B(C
)end function a.GetNearbyHazards(C,D)local E=g if not E then return{}end D=D or
65 local F,G,H={},C.X,C.Z for I,J in pairs(E.GetActiveHazardsMap())do local K,L=
J.Instance,B(J)if L then local M,N=L.center.X,L.center.Z if K and K.Parent then
local O=K:IsA'BasePart'and K or K.PrimaryPart or K:FindFirstChildWhichIsA
'BasePart'if O then M=O.Position.X N=O.Position.Z end end local O,P=G-M,H-N
local Q,R=O*O+P*P,D+L.boundingRadius if Q<=R*R then table.insert(F,J)end end end
return F end function a.IsPointInAnyHazard(C,D,E,F)local G=g if not G then
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
part end break end end end return K~=nil,J,K end return a