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
end local m={'secondbosscriclehitbox','secondbosscirclehitbox'}local n=function(
n)if not n or type(n)~='string'then return false end local o=n:lower():gsub(
'%s+','')if#o==0 then return false end for p,q in ipairs(m)do if string.find(o,q
,1,true)then return true end end return false end function a.
IsSecondBossCircleChain(o)return n(o)end local o={'movingbeam'}local p=function(
p)if not p or type(p)~='string'then return false end local q=p:lower():gsub(
'%s+','')if#q==0 then return false end for r,s in ipairs(o)do if string.find(q,s
,1,true)then return true end end return false end function a.IsMovingBeam(q)
return p(q)end local q,r={'firstbossbigspike','firstbossbeampart','bigspike'},
function(q)if not q or type(q)~='string'then return false end local r=q:lower():
gsub('%s+','')return string.find(r,'firstbossbeampart',1,true)~=nil end function
a.IsBeamTelegraph(s)return r(s)end local s=function(s)if not s or type(s)~=
'string'then return false end local t=s:lower():gsub('%s+','')if#t==0 or string.
find(t,'seekingspike',1,true)then return false end for u,v in ipairs(q)do if
string.find(t,v,1,true)then return true end end return false end function a.
IsBigSpike(t)return s(t)end local t=function()if k and k>0 then return k end
local t,u=45,h:FindFirstChild'enemyProjectiles'if not u then return t end local
v=u:FindFirstChild'largeIceSpikes'if not v then for w,x in ipairs(u:GetChildren(
))do local y=(x.Name or''):lower():gsub('%s+','')if y=='largeicespikes'then v=x
break end end end if not v then return t end local w,x=0,Vector3.zero if v:IsA
'Model'and v.PrimaryPart then x=v.PrimaryPart.Position elseif v:IsA'BasePart'
then x=v.Position end local y={}if v:IsA'BasePart'then table.insert(y,v)else for
z,A in ipairs(v:GetDescendants())do if A:IsA'BasePart'then table.insert(y,A)end
end end if#y==0 then return t end for z,A in ipairs(y)do local B=A.Size local C,
D=math.max(B.X,B.Z)/2,(Vector3.new(A.Position.X,0,A.Position.Z)-Vector3.new(x.X,
0,x.Z)).Magnitude local E=D+C if E>w then w=E end end if w>=5 then k=w return k
end return t end function a.GetLargeIceSpikesMaxRadius()return t()end local u=
function(u)if not u or type(u)~='string'then return false end local v=u:lower():
gsub('%s+','')if#v==0 then return false end for w,x in ipairs(i)do local y=x:
lower():gsub('%s+','')if#y>0 and string.find(v,y,1,true)then return true end end
return false end function a.IsForceCircle(v)return u(v)end function a.
AddForceCircleName(v)if type(v)=='string'and#v>0 then table.insert(i,v)a.
InvalidateCache()end end function a.GetForceCircleNames()return i end local v,w,
x,y=function(v)return v and v.Parent and v.Transparency<=b end,function(v,w,x)
local y,z,A,B=v.Size,x and d or c,(v and v.Name)or'',(v and v.Parent and v.
Parent.Name)or''if p(A)or p(B)then local C,D=math.max(y.X,y.Z)/2+z,math.max(2,
math.min(y.X,y.Z)/2+z)return{half=Vector3.new(C,0,D),cframe=v.CFrame,
isMovingBeam=true}end if s(A)or s(B)then local C,D=y,v:FindFirstChildWhichIsA(
'SpecialMesh',true)if D then C=Vector3.new(C.X*math.abs(D.Scale.X),C.Y*math.abs(
D.Scale.Y),C.Z*math.abs(D.Scale.Z))end local E={C.X,C.Y,C.Z}table.sort(E)local F
,G=math.clamp(E[2],6,60),math.clamp(E[3],8,80)local H,I=F/2+z,G/2+z return{half=
Vector3.new(H,0,I),cframe=v.CFrame,isBigSpike=true}end if w or(v:IsA'Part'and(v.
Shape==Enum.PartType.Ball or v.Shape==Enum.PartType.Cylinder))then return{radius
=math.max(y.X,y.Y,y.Z)/2}end local C=Vector3.new(math.max(y.X,0)/2+z,0,math.max(
y.Z,0)/2+z)return{half=C,cframe=v.CFrame}end,function(v,w,x,y)if not w then
return false end if w.expireTime and os.clock()>w.expireTime then return false
end local z,A=v.X,v.Z x=x or 0 local B=(y or w.isTrajectory)and d or c if w.
radius then local C,D=(w.part and w.part.Parent)and w.part.Position,w.
isSecondBossChain==true local E,F=(D and w.cx)or(C and C.X)or w.cx or 0,(D and w
.cz)or(C and C.Z)or w.cz or 0 local G,H,I=z-E,A-F,w.radius+B+x return(G*G+H*H)<=
(I*I)end local C=(w.part and w.part.Parent)and w.part.CFrame or w.cframe if C
then local D,E,F=C:PointToObjectSpace(v),w.half.X,w.half.Z if x<=0 then return
math.abs(D.X)<=E and math.abs(D.Z)<=F else local G,H=math.max(0,math.abs(D.X)-E)
,math.max(0,math.abs(D.Z)-F)return(G*G+H*H)<=(x*x)end end return false end,
function(v,w)local x=(w and w.CFrame)or(v:IsA'Model'and v:GetPivot())if x then
local y=x.LookVector local z=Vector3.new(-y.X,0,-y.Z)if z.Magnitude>0.05 then
return z.Unit end end local y=services.player or game:GetService'Players'.
LocalPlayer local z=y and y.Character local A=z and(z:FindFirstChild
'HumanoidRootPart'or z.PrimaryPart)if A and w then local B=Vector3.new(A.
Position.X-w.Position.X,0,A.Position.Z-w.Position.Z)if B.Magnitude>0.1 then
return B.Unit end end return Vector3.new(0,0,-1)end local z=function(z)if not z
or not z.Instance or not z.Instance.Parent then return nil end local A=z.
Instance local B=z.Name or(A and A.Name)or''local C,D=u(B),z.IsTrajectory==true
local E,F=D and d or c if l(B)then local G,H=(t())if A:IsA'BasePart'then H=v(A)
and A or nil elseif A:IsA'Model'then if A.PrimaryPart and v(A.PrimaryPart)then H
=A.PrimaryPart else for I,J in ipairs(A:GetDescendants())do if J:IsA'BasePart'
and v(J)and J.Parent then H=J break end end end end if not H then return nil end
local I=H.Position local J={radius=G,cx=I.X,cz=I.Z,part=H,isTrajectory=false,
isIceSpikes=true}return{zones={J},center=Vector3.new(I.X,0,I.Z),boundingRadius=G
+E}end if n(B)then local G if A:IsA'BasePart'then G=v(A)and A or nil elseif A:
IsA'Model'then if A.PrimaryPart and v(A.PrimaryPart)then G=A.PrimaryPart else
for H,I in ipairs(A:GetDescendants())do if I:IsA'BasePart'and v(I)and I.Parent
then G=I break end end end end if not G then return nil end local H,I,J,K,L,M,N,
O,P,Q=G.Position,y(A,G),z.SpawnClock or os.clock(),{},10,11,3,22,2.2,0.4 local R
=(L-1)*O for S=1,L do local T=(S-1)*O local U,V,W=Vector3.new(H.X,0,H.Z)+I*T,M+(
S-1)*N,J+P+(S-1)*Q table.insert(K,{radius=V,cx=U.X,cz=U.Z,part=G,expireTime=W,
isTrajectory=false,isSecondBossChain=true,circleIndex=S})end local S,T=Vector3.
new(H.X,0,H.Z)+I*(R/2),M+(L-1)*N local U,V=(R/2)+T+E,J+P+(L-1)*Q if z then z.
MaxExpireTime=V z.IsSyntheticChain=true end return{zones=K,center=S,
boundingRadius=U,maxExpireTime=V}end if p(B)then local G if A:IsA'BasePart'then
G=v(A)and A or nil elseif A:IsA'Model'then G=A.PrimaryPart or A:
FindFirstChildWhichIsA'BasePart'if not G or not v(G)then for H,I in ipairs(A:
GetDescendants())do if I:IsA'BasePart'and v(I)and I.Parent then G=I break end
end end end if not G then return nil end local H,I=G.Position,G.Size local J,K=
math.max(I.X,I.Z),math.max(3.5,math.min(I.X,I.Z))local L,M=J/2+E,K/2+E local N={
half=Vector3.new(L,0,M),cframe=G.CFrame,part=G,cx=H.X,cz=H.Z,isTrajectory=D,
isMovingBeam=true}return{zones={N},center=Vector3.new(H.X,0,H.Z),boundingRadius=
math.sqrt(L*L+M*M)}end if r(B)then return nil end if s(B)then local G if A:IsA
'BasePart'then G=v(A)and A or nil elseif A:IsA'Model'then G=A.PrimaryPart or A:
FindFirstChildWhichIsA'BasePart'if not G or not v(G)then for H,I in ipairs(A:
GetDescendants())do if I:IsA'BasePart'and v(I)and I.Parent then G=I break end
end end end if not G then return nil end local H,I,J=G.Position,G.Size,G:
FindFirstChildWhichIsA('SpecialMesh',true)if J then I=Vector3.new(I.X*math.abs(J
.Scale.X),I.Y*math.abs(J.Scale.Y),I.Z*math.abs(J.Scale.Z))end local K={I.X,I.Y,I
.Z}table.sort(K)local L,M=math.clamp(K[2],6,60),math.clamp(K[3],8,80)local N,O=L
/2+E,M/2+E local P={half=Vector3.new(N,0,O),cframe=G.CFrame,part=G,cx=H.X,cz=H.Z
,isTrajectory=D,isBigSpike=true}return{zones={P},center=Vector3.new(H.X,0,H.Z),
boundingRadius=math.sqrt(N*N+O*O)}end if A:IsA'BasePart'then if not v(A)then
return nil end F={A}else F={}for G,H in ipairs(A:GetDescendants())do if#F>=f
then break end if H:IsA'BasePart'and v(H)and H.Parent then F[#F+1]=H end end if#
F==0 then return nil end end local G,H,I,J,K={},math.huge,-math.huge,math.huge,-
math.huge for L,M in ipairs(F)do local N,O=M.Position,M.Size local P=math.max(O.
X,O.Y,O.Z)/2+E H=math.min(H,N.X-P)I=math.max(I,N.X+P)J=math.min(J,N.Z-P)K=math.
max(K,N.Z+P)local Q=w(M,C,D)if Q then Q.part=M Q.isTrajectory=D G[#G+1]=Q end
end if#G==0 then return nil end local L,M,N,O=(H+I)/2,(J+K)/2,(I-H)/2,(K-J)/2
return{zones=G,center=Vector3.new(L,0,M),boundingRadius=math.sqrt(N*N+O*O)}end
local A=function(A)local B=A and A.HazardZones if not B then B=z(A)if B and A
then A.HazardZones=B end end return B end function a.GetHazardZones(B)return A(B
)end function a.GetNearbyHazards(B,C)local D=g if not D then return{}end C=C or
65 local E,F,G={},B.X,B.Z for H,I in pairs(D.GetActiveHazardsMap())do local J,K=
I.Instance,A(I)if K then local L,M=K.center.X,K.center.Z if J and J.Parent then
local N=J:IsA'BasePart'and J or J.PrimaryPart or J:FindFirstChildWhichIsA
'BasePart'if N then L=N.Position.X M=N.Position.Z end end local N,O=F-L,G-M
local P,Q=N*N+O*O,C+K.boundingRadius if P<=Q*Q then table.insert(E,I)end end end
return E end function a.IsPointInAnyHazard(B,C,D,E)local F=g if not F then
return false,nil,nil end D=D or 0 local G,H,I,J=math.huge,E or F.
GetActiveHazardsMap()for K,L in pairs(H)do local M=L.Instance or(typeof(K)==
'Instance'and K)if C and(C==M or(M and C.Name==M.Name))then continue end local N
=L.Name or(M and M.Name)or''if p(N)or s(N)then continue end local O=A(L)if not O
then continue end local P,Q=O.center.X,O.center.Z if M and M.Parent then local R
=M:IsA'BasePart'and M or M.PrimaryPart or M:FindFirstChildWhichIsA'BasePart'if R
then P=R.Position.X Q=R.Position.Z end end local R,S=B.X-P,B.Z-Q local T,U=R*R+S
*S,O.boundingRadius+D if T>U*U then continue end local V=L.IsTrajectory==true
for W=1,#O.zones do local X=O.zones[W]if v(X.part)and x(B,X,D,V or X.
isTrajectory)then local Y=(B-X.part.Position).Magnitude if Y<G then G=Y I=L J=X.
part end break end end end return J~=nil,I,J end return a