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
return b end function a.c()local b,c=a.load'a',a.load'b'local d,e,f,g,h,i,j,k,l,
m,n,o,p,q,r,s,t,u,v,w,x,y,z=b.player,0.05,'enemyProjectiles',0.5,{},false,16,16,
true,false,false,{},0,{},0,{},{},{},{},{},{},0,{}local A,B,C,D,E,F,G,H,I,J,K,L,M
,N,O,P,Q,R,S=function()for A=#z,1,-1 do pcall(z[A])end end,{},'unknown',true,{},
{},{},0,4,false local T=function(T)if T then table.insert(G,T)end return T end
function h.OnRespawn(U)table.insert(F,U)end function h.GetLastRespawnTime()
return H end function h.GetRespawnProtectionDuration()return I end function h.
SetRespawnProtectionDuration(U)if type(U)=='number'and U>=0 then I=U end end
function h.GetRespawnProtectionRemaining()if H==0 then return 0 end local U=os.
clock()-H local V=I-U return math.max(0,V)end function h.IsJustRespawned(U)local
V=U or I if H==0 then return false end return(os.clock()-H)<=V end function h.
WasDead()return J end function h.IsDead()local U=d and d.Character if not U or
not U.Parent then return true end local V=U:FindFirstChildOfClass'Humanoid'if
not V or V.Health<=0 then return true end return false end function h.
IsInvulnerable()local U=d and d.Character if not U or not U.Parent then return
false,nil end local V=U:FindFirstChildOfClass'Humanoid'if V and V.Health<=0 then
return false,nil end local W=U:FindFirstChildOfClass'ForceField'if W and W.
Visible~=false then return true,'ForceField'end local X,Y,Z=U:GetAttribute
'Invulnerable',U:GetAttribute'Immune',U:GetAttribute'Respawning'if X==true or Y
==true or Z==true then return true,'Attribute'end local _,aa,ab=U:FindFirstChild
'Invulnerable',U:FindFirstChild'Immune',U:FindFirstChild'Respawning'if(_ and _:
IsA'BoolValue'and _.Value==true)or(aa and aa:IsA'BoolValue'and aa.Value==true)or
(ab and ab:IsA'BoolValue'and ab.Value==true)then return true,'Value'end local ac
=h.GetRespawnProtectionRemaining()if ac>0 then return true,(
'Respawn Shield (%.1fs)'):format(ac)end return false,nil end local aa=function(
aa)if not aa or not aa:IsA'Model'then return nil end local ab=aa:FindFirstChild
'HumanoidRootPart'if ab and ab:IsA'BasePart'then return ab end if aa.PrimaryPart
and aa.PrimaryPart:IsA'BasePart'then return aa.PrimaryPart end for ac,U in
ipairs(aa:GetDescendants())do if U:IsA'BasePart'then return U end end return nil
end local ab,ac=function(ab)if not ab or not ab:IsA'Model'or not ab.Parent or ab
==d.Character then return false end local ac=ab:FindFirstChildOfClass'Humanoid'
if not ac or ac.Health<=0 then return false end return aa(ab)~=nil end,function(
ab)local ac=w[ab]if not ac then return end if ac.Died then ac.Died:Disconnect()
ac.Died=nil end w[ab]=nil end local U,V=function(U)if not U or not u[U]then
return end x[U]=nil u[U]=nil y-=1 ac(U)A()O()end,function(U)if not dungeon or
not U then return nil end local V=U.Parent while V do if V==dungeon then return
nil end if V.Parent==dungeon and(V:IsA'Folder'or V:IsA'Model')then return V end
V=V.Parent end return nil end local W=function(W)if not ab(W)or u[W]then return
end local X,Y=aa(W),W:FindFirstChildOfClass'Humanoid'if not X or not Y then
return end u[W]={Model=W,Root=X,Humanoid=Y,Room=V(W)}y+=1 w[W]={Died=Y.Died:
Connect(function()U(W)end)}if n and not Q then if P then P()end end A()O()end
local X=function(X)if not X then return end if ab(X)then W(X)return end if x[X]
then return end x[X]=true task.spawn(function()local Y=os.clock()+2 while X.
Parent and os.clock()<Y do if ab(X)then x[X]=nil W(X)return end task.wait(0.03)
end x[X]=nil if X.Parent and ab(X)then W(X)end end)end local Y=function(Y)if not
Y or t[Y]then return end t[Y]=true for Z,_ in ipairs(Y:GetDescendants())do if _:
IsA'Model'and ab(_)then W(_)end end v[Y]={Added=Y.DescendantAdded:Connect(
function(Z)if Z:IsA'Model'then X(Z)elseif Z:IsA'Humanoid'then local _=Z:
FindFirstAncestorOfClass'Model'if _ then X(_)end end end),Removed=Y.
DescendantRemoving:Connect(function(Z)if Z:IsA'Model'then U(Z)end end)}end M=
function()if not dungeon then dungeon=workspace:WaitForChild('dungeon',30)end if
not dungeon then return false end p=0 for Z=#q,1,-1 do pcall(q[Z],p)end r=0 for
Z=#s,1,-1 do pcall(s[Z],r)end for Z,_ in ipairs(dungeon:GetChildren())do if _:
IsA'Folder'or _:IsA'Model'then Y(_)end end v[dungeon]={Added=dungeon.
DescendantAdded:Connect(function(Z)if Z:IsA'Model'then X(Z)elseif Z:IsA
'Humanoid'then local _=Z:FindFirstAncestorOfClass'Model'if _ then X(_)end end
end),Removed=dungeon.DescendantRemoving:Connect(function(Z)if Z:IsA'Model'then
U(Z)end end)}return true end N=function()if not dungeon then return end for Z,_
in pairs(v)do if _.Added then pcall(function()_.Added:Disconnect()end)end if _.
Removed then pcall(function()_.Removed:Disconnect()end)end end v={}t={}for Z in
pairs(u)do ac(Z)end u={}y=0 x={}Q=nil dungeon=nil end L=function()for Z,_ in
pairs(u)do if not Z or not Z.Parent then U(Z)else local ad=_.Humanoid or Z:
FindFirstChildOfClass'Humanoid'_.Humanoid=ad if not ad or ad.Health<=0 then U(Z)
else local ae=_.Root if not ae or not ae.Parent then ae=aa(Z)if ae then _.Root=
ae else U(Z)end end end end end end function h.SetFastSpeed(ad)j=ad if i and
humanoid and humanoid.Parent then if humanoid.WalkSpeed<j then m=true humanoid.
WalkSpeed=j m=false end end end function h.SetSpeedEnabled(ad)i=ad if humanoid
and humanoid.Parent then m=true if i then if humanoid.WalkSpeed<j then humanoid.
WalkSpeed=j end else humanoid.WalkSpeed=k end m=false end end function h.
IsSpeedEnabled()return i end function h.GetFastSpeed()return j end function h.
SetInstantAccelEnabled(ad)l=ad and true or false end function h.
IsInstantAccelEnabled()return l end local ad=function()if R then R:Disconnect()R
=nil end if not humanoid or not humanoid.Parent then return end R=humanoid:
GetPropertyChangedSignal'WalkSpeed':Connect(function()if m then return end if
not humanoid or not humanoid.Parent then return end local ad=humanoid.WalkSpeed
if i then if ad<j then m=true humanoid.WalkSpeed=j m=false end else k=ad end end
)end function h.SetHumanoid(ae)if not ae then return end local Z=ae:
WaitForChild('Humanoid',10)if not Z then return end humanoid=Z rootPart=ae:
WaitForChild('HumanoidRootPart',10)or ae.PrimaryPart k=humanoid.WalkSpeed if i
and humanoid.WalkSpeed<j then m=true humanoid.WalkSpeed=j m=false end if S then
S:Disconnect()S=nil end S=humanoid.Died:Connect(function()J=true end)T(humanoid.
HealthChanged:Connect(function(_)if _<=0 then J=true elseif J and _>0 then J=
false end end))end local ae=function()if not c.IsActive()then return end if not
l then return end if not humanoid or not humanoid.Parent or humanoid.Health<=0
or humanoid.Sit then return end if not rootPart or not rootPart.Parent then
local ae=d and d.Character rootPart=ae and ae:FindFirstChild'HumanoidRootPart'if
not rootPart then return end end if rootPart.Anchored then return end local ae,Z
=humanoid.MoveDirection,rootPart.AssemblyLinearVelocity if ae.Magnitude>0.05
then local _=i and math.max(j,humanoid.WalkSpeed)or humanoid.WalkSpeed rootPart.
AssemblyLinearVelocity=Vector3.new(ae.X*_,Z.Y,ae.Z*_)end end if b.RunService
then local Z=b.RunService.PreSimulation or b.RunService.Heartbeat if Z then T(Z:
Connect(ae))end end function h.GetDungeonStartTime()return dungeonStartTime end
function h.SetDungeonStartTime(Z)dungeonStartTime=Z end function h.
GetDungeonElapsed()if not dungeonStartTime then return nil end return os.clock()
-dungeonStartTime end function h.ReadyDungeon()if not dungeon and not M()then
return false end return true end function h.GetHumanoid()return humanoid end
function h.GetEnemyNames()local Z={}local _=function(_)if _ and _~=''and _~=d.
Name then Z[_]=true end end if dungeon then for af,ag in ipairs(dungeon:
GetChildren())do if ag:IsA'Folder'or ag:IsA'Model'then for ah,ai in ipairs(ag:
GetDescendants())do if ai:IsA'Model'and ai:FindFirstChildOfClass'Humanoid'then
_(ai.Name)end end end end end for af in pairs(u)do _(af.Name)end local af={}for
ag in pairs(Z)do table.insert(af,ag)end table.sort(af)return af end function h.
GetEnemyCount()return y end function h.GetTrackedEnemyData()local af={}for ag,ah
in pairs(u)do if ah and ah.Root and ah.Root.Parent then af[#af+1]=ah end end
return af end function h.OnEnemyChanged(af)if type(af)~='function'then return
function()end end table.insert(z,af)return function()for ag,ah in ipairs(z)do if
ah==af then table.remove(z,ag)break end end end end function h.
GetEnemyProjectileNames()local af,ag={},game:GetService'ReplicatedStorage'local
ah=ag:FindFirstChild(f)if not ah then return af end for ai,Z in ipairs(ah:
GetChildren())do local _=Z.ClassName if _=='Model'or _=='MeshPart'or _=='Part'
then af[Z.Name]=true end end return af end function h.GetKeyHoldTime()return e
end if d and d.Character and d.Character.Parent then h.SetHumanoid(d.Character)
ad()else local af=d and d.CharacterAdded and task.spawn(function()local af=d.
CharacterAdded:Wait()if af and c.IsActive()then h.SetHumanoid(af)ad()end end)end
if d then T(d.CharacterAdded:Connect(function(af)local ag,ah=pcall(function()if
not af then return end H=os.clock()h.SetHumanoid(af)ad()for ag,ah in ipairs(F)do
pcall(ah)end end)if not ag then warn('[Shared] respawn handler error:',tostring(
ah))end end))end task.spawn(function()while c.IsActive()do task.wait(g)local af=
workspace:FindFirstChild'dungeon'if dungeon and af~=dungeon then N()elseif not
dungeon and af then M()end O()end end)local af=function()local af=game:
GetService'Workspace'for ag,ah in ipairs(af:GetDescendants())do if ah.Name==
'dungeonName'and ah:IsA'ValueBase'then local ai=ah.Value if type(ai)=='string'
then local Z=string.gsub(ai,'%s+','')if Z~=''and string.lower(Z)~=C then return
ai end end end end return nil end task.spawn(function()while c.IsActive()do task
.wait(g)local ag=af()if ag~=K then K=ag if ag then h.ResetBossIndex()end for ah=
#B,1,-1 do pcall(B[ah],ag)end end end end)local ag=function()return not(K and#K>
0)end task.spawn(function()while c.IsActive()do task.wait(g)local ah=ag()if ah~=
D then D=ah for ai=#E,1,-1 do pcall(E[ai],D)end end end end)task.spawn(function(
)local ah,ai=pcall(function()return M()end)if not ah then warn(
'[EnemyTracker] Initialization error:',ai)end end)local ah,ai=0,2 task.spawn(
function()while c.IsActive()do task.wait(ai)local Z=os.clock()if Z-ah<ai then
continue end ah=Z if not dungeon then continue end local aj=pcall(function()for
_,aj in ipairs(dungeon:GetChildren())do if aj:IsA'Folder'or aj:IsA'Model'then
for ak,al in ipairs(aj:GetDescendants())do if al:IsA'Model'then X(al)end end end
end L()end)if not aj then warn'[EnemyTracker] rescan error'end end end)function
h.IsBossActive()return n end function h.OnBossActiveChanged(aj)if type(aj)~=
'function'then return function()end end table.insert(o,aj)return function()for
ak,al in ipairs(o)do if al==aj then table.remove(o,ak)break end end end end
function h.GetCurrentBossIndex()return p end function h.GetCombatTargetKey()if
not n then return'Mob'end local aj=math.clamp(p,1,3)return'Boss'..tostring(aj)
end function h.ResetBossIndex()p=0 Q=nil for aj=#q,1,-1 do pcall(q[aj],p)end end
function h.OnBossIndexChanged(aj)if type(aj)~='function'then return function()
end end table.insert(q,aj)return function()for ak,al in ipairs(q)do if al==aj
then table.remove(q,ak)break end end end end local aj=function(aj)if type(aj)~=
'string'then return 0 end local ak=string.lower(aj)local al=string.match(ak,
'boss.*(%d+)')if al then return 100+(tonumber(al)or 1)end if string.find(ak,
'boss')then return 100+math.max(1,p)end local Z=string.match(aj,'^room(%d+)$')if
not Z then return 0 end return tonumber(Z)or 0 end local ak=function()if not
dungeon then return 0 end for ak,al in pairs(u)do if al and al.Room then local Z
=aj(al.Room.Name)if Z>0 then return Z end end end if n then return 100+math.max(
1,p)end return 0 end O=function()local al=ak()if al==r then return end r=al for
Z=#s,1,-1 do pcall(s[Z],r)end end function h.GetCurrentRoomIndex()return r end
function h.OnRoomIndexChanged(al)if type(al)~='function'then return function()
end end table.insert(s,al)return function()for Z,_ in ipairs(s)do if _==al then
table.remove(s,Z)break end end end end function h.GetCurrentDungeonName()return
K end function h.OnDungeonNameChanged(al)if type(al)~='function'then return
function()end end table.insert(B,al)return function()for Z,_ in ipairs(B)do if _
==al then table.remove(B,Z)break end end end end function h.IsInLobby()return D
end function h.OnLobbyChanged(al)if type(al)~='function'then return function()
end end table.insert(E,al)return function()for Z,_ in ipairs(E)do if _==al then
table.remove(E,Z)break end end end end local al P=function()if not n or Q~=nil
then return end for Z,_ in pairs(u)do if _ and _.Root and _.Root.Parent then
local am=false if _.Room and type(_.Room.Name)=='string'and string.find(string.
lower(_.Room.Name),'boss')then am=true elseif string.find(string.lower(Z.Name),
'boss')then am=true elseif Z.Parent and string.find(string.lower(Z.Parent.Name),
'boss')then am=true end if am then Q=_.Root.Position return end end end for am,Z
in pairs(u)do if Z and Z.Root and Z.Root.Parent then Q=Z.Root.Position return
end end end local am=function(am)if n==am then return end n=am if am then p+=1 Q
=nil P()for Z=#q,1,-1 do pcall(q[Z],p)end else Q=nil end for Z=#o,1,-1 do pcall(
o[Z],n)end O()end function h.GetBossSpawnPosition()if Q then return Q end P()
return Q end function h.SetBossSpawnPosition(Z)Q=Z end local function Z()if not
d then return end local _=d:FindFirstChild'PlayerGui'if not _ then al=nil am(
false)return end local an=_:FindFirstChild('bossHealth',true)if an then if an~=
al then al=an if al:IsA'ScreenGui'then T(al:GetPropertyChangedSignal'Enabled':
Connect(Z))elseif al:IsA'GuiObject'then T(al:GetPropertyChangedSignal'Visible':
Connect(Z))end end local ao=if an:IsA'ScreenGui'then an.Enabled elseif an:IsA
'GuiObject'then an.Visible else true am(ao)else al=nil am(false)end end task.
spawn(function()if not d then return end local an=d:WaitForChild('PlayerGui',30)
if not an then return end T(an.DescendantAdded:Connect(Z))T(an.
DescendantRemoving:Connect(Z))Z()while c.IsActive()and task.wait(0.5)do Z()end
end)c.Register(function()if R then R:Disconnect()R=nil end for an,ao in ipairs(G
)do pcall(function()ao:Disconnect()end)end table.clear(G)N()end)return h end
function a.d()local aa,ab,ac,ad,ae,af,ag={},0.85,0,2,{},64 function aa.
BindDetection(ah)ag=ah or nil end function aa.GetHazardPadding()return ac end aa
.GetHitboxPadding=aa.GetHazardPadding function aa.GetTrajectoryMargin()return ad
end function aa.SetTrajectoryMargin(ah)if type(ah)=='number'and ah>=0 and ah~=ad
then ad=ah aa.InvalidateCache()for ai,aj in ipairs(ae)do pcall(aj,ad)end end end
function aa.InvalidateCache()if ag and ag.GetActiveHazardsMap then for ah,ai in
pairs(ag.GetActiveHazardsMap())do ai.HazardZones=nil end end end function aa.
OnPaddingChanged(ah)if type(ah)=='function'then table.insert(ae,ah)end end
function aa.SetHazardPadding(ah)if type(ah)=='number'and ah>=0 and ah~=ac then
ac=ah aa.InvalidateCache()for ai,aj in ipairs(ae)do pcall(aj,ac)end end end aa.
SetHitboxPadding=aa.SetHazardPadding local ah,ai,aj,ak=game:GetService
'ReplicatedStorage',{'firstBossCrissCross','firstBossBigSpike',
'firstBossSeekingSpikes'},{'smallicespikes','mediumicespikes','largeicespikes'}
local al=function(al)if not al or type(al)~='string'then return false end local
am=al:lower():gsub('%s+','')if#am==0 then return false end for an,ao in ipairs(
aj)do if string.find(am,ao,1,true)then return true end end return false end
function aa.IsIceSpikesChain(am)return al(am)end local am=function()if ak and ak
>0 then return ak end local am,an=45,ah:FindFirstChild'enemyProjectiles'if not
an then return am end local ao=an:FindFirstChild'largeIceSpikes'if not ao then
for b,c in ipairs(an:GetChildren())do local d=(c.Name or''):lower():gsub('%s+',
'')if d=='largeicespikes'then ao=c break end end end if not ao then return am
end local b,c=0,Vector3.zero if ao:IsA'Model'and ao.PrimaryPart then c=ao.
PrimaryPart.Position elseif ao:IsA'BasePart'then c=ao.Position end local d={}if
ao:IsA'BasePart'then table.insert(d,ao)else for e,f in ipairs(ao:GetDescendants(
))do if f:IsA'BasePart'then table.insert(d,f)end end end if#d==0 then return am
end for e,f in ipairs(d)do local g=f.Size local h,i=math.max(g.X,g.Z)/2,(Vector3
.new(f.Position.X,0,f.Position.Z)-Vector3.new(c.X,0,c.Z)).Magnitude local j=i+h
if j>b then b=j end end if b>=5 then ak=b return ak end return am end function
aa.GetLargeIceSpikesMaxRadius()return am()end local an=function(an)if not an or
type(an)~='string'then return false end local ao=an:lower():gsub('%s+','')if#ao
==0 then return false end for b,c in ipairs(ai)do local d=c:lower():gsub('%s+',
'')if#d>0 and string.find(ao,d,1,true)then return true end end return false end
function aa.IsForceCircle(ao)return an(ao)end function aa.AddForceCircleName(ao)
if type(ao)=='string'and#ao>0 then table.insert(ai,ao)aa.InvalidateCache()end
end function aa.GetForceCircleNames()return ai end local ao,b,c=function(ao)
return ao and ao.Parent and ao.Transparency<=ab end,function(ao,b,c)local d,e=ao
.Size,c and ad or ac if b or(ao:IsA'Part'and(ao.Shape==Enum.PartType.Ball or ao.
Shape==Enum.PartType.Cylinder))then return{radius=math.max(d.X,d.Y,d.Z)/2}end
local f=Vector3.new(math.max(d.X,0)/2+e,0,math.max(d.Z,0)/2+e)return{half=f,
cframe=ao.CFrame}end,function(ao,b,c,d)if not b then return false end local e,f=
ao.X,ao.Z c=c or 0 local g=(d or b.isTrajectory)and ad or ac if b.radius then
local h=(b.part and b.part.Parent)and b.part.Position local i,j=h and h.X or b.
cx or 0,h and h.Z or b.cz or 0 local k,l,m=e-i,f-j,b.radius+g+c return(k*k+l*l)
<=(m*m)end local h=(b.part and b.part.Parent)and b.part.CFrame or b.cframe if h
then local i,j,k=h:PointToObjectSpace(ao),b.half.X,b.half.Z if c<=0 then return
math.abs(i.X)<=j and math.abs(i.Z)<=k else local l,m=math.max(0,math.abs(i.X)-j)
,math.max(0,math.abs(i.Z)-k)return(l*l+m*m)<=(c*c)end end return false end local
d=function(d)if not d or not d.Instance or not d.Instance.Parent then return nil
end local e=d.Instance local f=d.Name or(e and e.Name)or''local g,h=an(f),d.
IsTrajectory==true local i,j=h and ad or ac if al(f)then local k,l=(am())if e:
IsA'BasePart'then l=ao(e)and e or nil elseif e:IsA'Model'then if e.PrimaryPart
and ao(e.PrimaryPart)then l=e.PrimaryPart else for m,n in ipairs(e:
GetDescendants())do if n:IsA'BasePart'and ao(n)and n.Parent then l=n break end
end end end if not l then return nil end local m=l.Position local n={radius=k,cx
=m.X,cz=m.Z,part=l,isTrajectory=false,isIceSpikes=true}return{zones={n},center=
Vector3.new(m.X,0,m.Z),boundingRadius=k+i}end if e:IsA'BasePart'then if not ao(e
)then return nil end j={e}else j={}for k,l in ipairs(e:GetDescendants())do if#j
>=af then break end if l:IsA'BasePart'and ao(l)and l.Parent then j[#j+1]=l end
end if#j==0 then return nil end end local k,l,m,n,o={},math.huge,-math.huge,math
.huge,-math.huge for p,q in ipairs(j)do local r,s=q.Position,q.Size local t=math
.max(s.X,s.Y,s.Z)/2+i l=math.min(l,r.X-t)m=math.max(m,r.X+t)n=math.min(n,r.Z-t)o
=math.max(o,r.Z+t)local u=b(q,g,h)if u then if u.radius then u.cx,u.cz=r.X,r.Z
end u.part=q u.isTrajectory=h k[#k+1]=u end end if#k==0 then return nil end
local p,q,r,s=(l+m)/2,(n+o)/2,(m-l)/2,(o-n)/2 return{zones=k,center=Vector3.new(
p,0,q),boundingRadius=math.sqrt(r*r+s*s)}end local e=function(e)local f=e and e.
HazardZones if not f then f=d(e)if f and e then e.HazardZones=f end end return f
end function aa.GetHazardZones(f)return e(f)end function aa.GetNearbyHazards(f,g
)local h=ag if not h then return{}end g=g or 65 local i,j,k={},f.X,f.Z for l,m
in pairs(h.GetActiveHazardsMap())do local n,o=m.Instance,e(m)if o then local p,q
=o.center.X,o.center.Z if n and n.Parent then local r=n:IsA'BasePart'and n or n.
PrimaryPart or n:FindFirstChildWhichIsA'BasePart'if r then p=r.Position.X q=r.
Position.Z end end local r,s=j-p,k-q local t,u=r*r+s*s,g+o.boundingRadius if t<=
u*u then table.insert(i,m)end end end return i end function aa.
IsPointInAnyHazard(f,g,h,i)local j=ag if not j then return false,nil,nil end h=h
or 0 local k,l,m,n=math.huge,i or j.GetActiveHazardsMap()for o,p in pairs(l)do
local q=p.Instance or(typeof(o)=='Instance'and o)if g and(g==q or(q and g.Name==
q.Name))then continue end local r=e(p)if not r then continue end local s,t=r.
center.X,r.center.Z if q and q.Parent then local u=q:IsA'BasePart'and q or q.
PrimaryPart or q:FindFirstChildWhichIsA'BasePart'if u then s=u.Position.X t=u.
Position.Z end end local u,v=f.X-s,f.Z-t local w,x=u*u+v*v,r.boundingRadius+h if
w>x*x then continue end local y=p.IsTrajectory==true for z=1,#r.zones do local A
=r.zones[z]if ao(A.part)and c(f,A,h,y or A.isTrajectory)then local B=(f-A.part.
Position).Magnitude if B<k then k=B m=p n=A.part end break end end end return n
~=nil,m,n end return aa end function a.e()local aa,ab,ac=a.load'a',a.load'b',a.
load'd'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao=aa.RunService or game:
GetService'RunService',aa.player,{},false,{},0.85,Color3.fromRGB(255,45,45),
Color3.fromRGB(0,160,255),0.55,0.25 local b=function()local b=ae and ae.
Character if not b then return nil end local c=b:FindFirstChild
'HumanoidRootPart'or b.PrimaryPart if not c then return nil end return c.
Position.Y-2.5 end function af.BindDetection(c)an=c or nil end function af.
IsEnabled()return ag end local c=function(c,d)local e,f=c.part,c.ad if not e or
not e.Parent or not f or not f.Parent then return end local g=e.Position local h
=Vector3.new(g.X,d or g.Y,g.Z)if c.isCircle then local i=CFrame.new(h)*CFrame.
Angles(math.rad(90),0,0)f.CFrame=e.CFrame:ToObjectSpace(i)else local i,j,k=e.
CFrame:ToOrientation()local l=CFrame.new(h)*CFrame.Angles(0,j,0)f.CFrame=e.
CFrame:ToObjectSpace(l)end end local d=function()if not ag then return end local
d,e=false,b()for f,g in pairs(ah)do if not f.Instance or not f.Instance.Parent
then af.DetachZoneVisuals(f)else d=true if g.items then for h,j in ipairs(g.
items)do c(j,e)end end end end if not d and ao then ao:Disconnect()ao=nil end
end local e=function()if not ao and ag then ao=ad.Heartbeat:Connect(d)end end
function af.DetachZoneVisuals(f)if not f then return end local g=ah[f]if not g
then return end if g.adornments then for h,j in ipairs(g.adornments)do pcall(
function()j:Destroy()end)end table.clear(g.adornments)end if g.connections then
for h,j in ipairs(g.connections)do pcall(function()j:Disconnect()end)end table.
clear(g.connections)end if g.items then table.clear(g.items)end ah[f]=nil end
function af.UpdateHazardVisualColor(f,g)if not f then return end local h=ah[f]if
not h or not h.items then return end local j=g==true or f.IsTrajectory==true
local k,l=j and ak or aj,j and ac.GetTrajectoryMargin()or 0 for m,n in ipairs(h.
items)do local o,p,q=n.ad,n.zone,n.part if o and o.Parent and p and q and q.
Parent then o.Color3=k if n.isCircle and p.radius then o.Radius=p.radius+l
elseif p.half then local r,s=math.max(q.Size.X,0)/2+l,math.max(q.Size.Z,0)/2+l o
.Size=Vector3.new(r*2,am,s*2)end end end end function af.AttachZoneVisuals(f)if
not ag or not f then return end if ah[f]then af.DetachZoneVisuals(f)end local g=
ac.GetHazardZones(f)if not g or not g.zones then return end local h=f.
IsTrajectory==true local j,k,l,m,n,o=h and ak or aj,h and ac.
GetTrajectoryMargin()or 0,b(),{},{},{}for p,q in ipairs(g.zones)do local r=q.
part if r and r.Parent and r.Transparency<=ai then local s,t=false if q.radius
then s=true local u=Instance.new'CylinderHandleAdornment'u.Name=
'HazardGroundCircle'u.Adornee=r u.Radius=q.radius+k u.Height=am u.Color3=j u.
Transparency=al u.ZIndex=2 u.AlwaysOnTop=true u.Parent=r t=u elseif q.half and q
.cframe then local u=Instance.new'BoxHandleAdornment'u.Name='HazardGroundBox'u.
Adornee=r u.Size=Vector3.new(q.half.X*2,am,q.half.Z*2)u.Color3=j u.Transparency=
al u.ZIndex=2 u.AlwaysOnTop=true u.Parent=r t=u end if t then local u={ad=t,part
=r,isCircle=s,zone=q}c(u,l)table.insert(m,u)table.insert(n,t)local v=r:
GetPropertyChangedSignal'Transparency':Connect(function()if r.Parent and r.
Transparency>ai then pcall(function()t:Destroy()end)end end)table.insert(o,v)end
end end if#n>0 then ah[f]={items=m,adornments=n,connections=o}e()end end
function af.ClearAll()if ao then ao:Disconnect()ao=nil end for f in pairs(ah)do
af.DetachZoneVisuals(f)end table.clear(ah)end function af.RefreshAll()af.
ClearAll()if not ag or not an then return end for f,g in pairs(an.
GetActiveHazardsMap())do af.AttachZoneVisuals(g)end end function af.SetEnabled(f
)ag=f and true or false if ag then af.RefreshAll()else af.ClearAll()end end ac.
OnPaddingChanged(function()if ag then af.RefreshAll()end end)ab.Register(
function()af.ClearAll()end)return af end function a.f()local aa,ab,ac=a.load'a',
a.load'b',a.load'd'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,b,c,d,e,f,g=aa.
RunService or game:GetService'RunService',game:GetService'ReplicatedStorage',aa.
player,{},true,{},0.85,Color3.fromRGB(255,60,60),Color3.fromRGB(0,180,255),
Color3.fromRGB(255,140,0),Color3.fromRGB(220,90,255),'enemyProjectiles',false,{}
,{},{secondbossgreenorb=true,secondbossredorb=true,secondbossyelloworb=true}
local h=function()if b then return end b=true local h=ae:FindFirstChild(ao)if h
then for j,k in ipairs(h:GetChildren())do local l=(k.Name or''):lower():gsub(
'%s+','')if#l>0 then c[l]=true end end h.ChildAdded:Connect(function(j)local k=(
j.Name or''):lower():gsub('%s+','')if#k>0 then c[k]=true end end)end end
function ag.IsChasingProjectile(j)if not j or type(j)~='string'then return false
end local k=j:lower():gsub('%s+','')if#k==0 then return false end if e[k]==true
then return true end for l in pairs(e)do if string.find(k,l,1,true)then return
true end end return false end function ag.IsEnemyProjectile(j)h()if not j or
type(j)~='string'then return false end local k=j:lower():gsub('%s+','')if#k==0
then return false end if d[k]==true then return false end return c[k]==true end
function ag.BindDetection(j)f=j or nil end function ag.IsEnabled()return ah end
local j=function()local j=af and af.Character if not j then return nil end local
k=j:FindFirstChild'HumanoidRootPart'or j.PrimaryPart if not k then return nil
end return k.Position.Y-2.5 end local k,l=function(k)if not k or not k.Parent
then return 2.5 end local l=j()if l then local m=l+2.5 local n,o=m-k.Position.Y,
k.Size.Y/2+1.2 return math.clamp(math.max(n,o),1.5,30)end return math.clamp(k.
Size.Y/2+1.8,2,10)end,function(k)return k and k.Parent and k.Transparency<=aj
end local m,n=function(m)if not m or not m.Parent then return nil end if m:IsA
'BasePart'then if l(m)then return m end elseif m:IsA'Model'then if m.PrimaryPart
and l(m.PrimaryPart)then return m.PrimaryPart end local n=m:FindFirstChild
'HumanoidRootPart'if n and l(n)then return n end for o,p in ipairs(m:
GetDescendants())do if p:IsA'BasePart'and l(p)then return p end end else for n,o
in ipairs(m:GetDescendants())do if o:IsA'BasePart'and l(o)then return o end end
end return nil end,function(m)local n,o=m and m.IsTrajectory==true,m and m.Name
or'Hazard'local p,q=ag.IsChasingProjectile(o),ag.IsEnemyProjectile(o)local r=not
n or p if p then local s,t=an,'220,100,255'return'C',s,t,true elseif q then
local s,t=n and am or al,n and'255,160,50'or'0,210,255'return'P',s,t,r else
local s,t=n and am or ak,n and'255,160,50'or'255,80,80'return'N',s,t,r end end
local o=function(o,p)if not o or not o.items or not p then return end local q,r,
s,t=n(p)local u,v=p.Name or'Hazard',''if t then local w=p.SpawnClock or os.
clock()local x=math.max(0,os.clock()-w)v=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(255,220,220)'>%s</font> <font color='rgb(255,255,255)'><b>%.1fs</b></font>]]
):format(s,q,u,x)else v=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(220,235,255)'>%s</font>]]
):format(s,q,u)end for w,x in ipairs(o.items)do if x.label and x.label.Parent
then x.label.Text=v end if x.stroke and x.stroke.Parent and x.stroke.Color~=r
then x.stroke.Color=r end end end local p=function()if not ah then return end
local p=false for q,r in pairs(ai)do local s=q.Instance if not s or not s.Parent
then ag.DetachTimerVisual(q)else if r.items then for t=#r.items,1,-1 do local u=
r.items[t]local v=u.part if not l(v)then if u.billboard and u.billboard.Parent
then pcall(function()u.billboard:Destroy()end)end table.remove(r.items,t)else if
u.billboard and u.billboard.Parent then u.billboard.StudsOffset=Vector3.new(0,k(
v),0)end end end if#r.items==0 then ag.DetachTimerVisual(q)else p=true o(r,q)end
else ag.DetachTimerVisual(q)end end end if not p and g then g:Disconnect()g=nil
end end local q,r=function()if not g and ah then g=ad.Heartbeat:Connect(p)end
end,function(q,r)local s,t=k(q),Instance.new'BillboardGui't.Name=
'HazardLifespanTimer't.Adornee=q t.AlwaysOnTop=true t.MaxDistance=500 t.
LightInfluence=0 t.ResetOnSpawn=false t.Active=false t.Size=UDim2.new(0,150,0,24
)t.StudsOffset=Vector3.new(0,s,0)t.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
local u=Instance.new'Frame'u.Name='TimerFrame'u.Size=UDim2.new(1,0,1,0)u.
BackgroundColor3=Color3.fromRGB(15,15,20)u.BackgroundTransparency=0.25 u.
BorderSizePixel=0 u.Parent=t local v=Instance.new'UICorner'v.CornerRadius=UDim.
new(0,6)v.Parent=u local w=Instance.new'UIStroke'w.Name='Stroke'w.Thickness=1.3
w.Color=r or ak w.Transparency=0.15 w.Parent=u local x=Instance.new'TextLabel'x.
Name='TimerLabel'x.Size=UDim2.new(1,-6,1,0)x.Position=UDim2.new(0,3,0,0)x.
BackgroundTransparency=1 x.Font=Enum.Font.GothamBold x.TextSize=11 x.TextColor3=
Color3.fromRGB(255,255,255)x.TextStrokeTransparency=0 x.TextStrokeColor3=Color3.
fromRGB(0,0,0)x.RichText=true x.TextXAlignment=Enum.TextXAlignment.Center x.
TextYAlignment=Enum.TextYAlignment.Center x.Text=''x.Parent=u t.Parent=q return
t,x,w end function ag.AttachTimerVisual(s)if not ah or not s then return end
local t=s.Name or(s.Instance and s.Instance.Name)or''if ac.IsIceSpikesChain and
ac.IsIceSpikesChain(t)then return end if ai[s]then ag.DetachTimerVisual(s)end
local u=s.Instance if not u or not u.Parent then return end local v,w=n(s)local
x=ac.GetHazardZones(s)local y,z,A=x and x.zones,{},{}local B,C=function(B,C,D,E,
F)local G={billboard=C,label=D,stroke=E,part=B,zone=F}table.insert(z,G)local H=B
:GetPropertyChangedSignal'Transparency':Connect(function()if not l(B)then pcall(
function()C:Destroy()end)end end)table.insert(A,H)local I=B.AncestryChanged:
Connect(function(I,J)if not J then pcall(function()C:Destroy()end)end end)table.
insert(A,I)end if y and#y>0 then if u:IsA'Model'then if u.PrimaryPart and l(u.
PrimaryPart)then C=u.PrimaryPart elseif u:FindFirstChild'HumanoidRootPart'and l(
u:FindFirstChild'HumanoidRootPart')then C=u:FindFirstChild'HumanoidRootPart'end
end if not C then local D,E=x.center,math.huge for F,G in ipairs(y)do local H=G.
part if l(H)then if D then local I,J=H.Position.X-D.X,H.Position.Z-D.Z local K=I
*I+J*J if K<E then E=K C=H end else C=H break end end end end end if not C then
C=m(u)end if C and l(C)then local D,E,F=r(C,w)B(C,D,E,F,nil)end if#z>0 then
local D={items=z,connections=A}ai[s]=D o(D,s)q()end end function ag.
DetachTimerVisual(s)if not s then return end local t=ai[s]if not t then return
end if t.connections then for u,v in ipairs(t.connections)do pcall(function()v:
Disconnect()end)end table.clear(t.connections)end if t.items then for u,v in
ipairs(t.items)do if v.billboard and v.billboard.Parent then pcall(function()v.
billboard:Destroy()end)end end table.clear(t.items)end ai[s]=nil end function ag
.UpdateHazardVisualColor(s,t)if not s then return end local u=ai[s]if u then o(u
,s)else ag.AttachTimerVisual(s)end end function ag.ClearAll()if g then g:
Disconnect()g=nil end for s in pairs(ai)do ag.DetachTimerVisual(s)end table.
clear(ai)end function ag.RefreshAll()ag.ClearAll()if not ah or not f then return
end for s,t in pairs(f.GetActiveHazardsMap())do if t then ag.AttachTimerVisual(t
)end end end function ag.SetEnabled(s)ah=s and true or false if ah then ag.
RefreshAll()else ag.ClearAll()end end ab.Register(function()ag.ClearAll()end)
return ag end function a.g()local aa,ab,ac,ad=a.load'a',a.load'b',a.load'd',a.
load'f'local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,b,c,d=aa.RunService or game:
GetService'RunService',aa.player,{},false,45,{},0.85,Color3.fromRGB(255,140,0),
0.65,0.2,3.5,{firstbossseekingspikes='target_player',firstbossbigspike=
'target_player'}local e=function()local e=af and af.Character if not e then
return nil end local f=e:FindFirstChild'HumanoidRootPart'or e.PrimaryPart if not
f then return nil end return f.Position end local f,g=function(f,g)if not f or
not g then return nil,nil end local h=f:lower():gsub('%s+','')local j=b[h]if not
j then for k,l in pairs(b)do if string.find(h,k,1,true)then j=l break end end
end if not j then return nil,nil end if j=='look_vector'then local k=g.CFrame.
LookVector local l=Vector3.new(k.X,0,k.Z)if l.Magnitude>0.01 then return l.Unit,
j end else local k=e()if k then local l=k-g.Position local m=Vector3.new(l.X,0,l
.Z)if m.Magnitude>0.1 then return m.Unit,j end end local l=g.CFrame.LookVector
local m=Vector3.new(l.X,0,l.Z)if m.Magnitude>0.01 then return m.Unit,j end end
return nil,nil end,function()local f=af and af.Character if not f then return
nil end local g=f:FindFirstChild'HumanoidRootPart'or f.PrimaryPart if not g then
return nil end return g.Position.Y-2.5 end function ag.BindDetection(h)c=h or
nil end function ag.IsEnabled()return ah end function ag.GetPredictionLength()
return ai end function ag.SetPredictionLength(h)if type(h)=='number'and h>0 then
ai=math.clamp(h,10,200)ag.RefreshAll()end end function ag.IsHazardMoving(h)if
not h then return false end local j=aj[h]return j and j.isMoving==true end local
h,j=function(h,j)local k=h.Instance if not k or not k.Parent then return nil,4
end local l,m,n=ac.GetTrajectoryMargin and ac.GetTrajectoryMargin()or 2,{},h.
Name or(k and k.Name)or''local o=ac.IsForceCircle and ac.IsForceCircle(n)if k:
IsA'BasePart'then if k.Transparency<=ak then table.insert(m,k)end else for p,q
in ipairs(k:GetDescendants())do if q:IsA'BasePart'and q.Parent and q.
Transparency<=ak then table.insert(m,q)end end end if#m==0 then return nil,4 end
local p,q,r,s=Vector3.new(-j.Z,0,j.X),math.huge,-math.huge,0 for t,u in ipairs(m
)do local v,w,x=u.Position,u.Size,0 if o or(u:IsA'Part'and(u.Shape==Enum.
PartType.Ball or u.Shape==Enum.PartType.Cylinder))then x=math.max(w.X,w.Y,w.Z)/2
else local y=u.CFrame local z,A,B,C,D,E=y.RightVector,y.UpVector,y.LookVector,w.
X/2,w.Y/2,w.Z/2 x=C*math.abs(z.X*p.X+z.Z*p.Z)+D*math.abs(A.X*p.X+A.Z*p.Z)+E*math
.abs(B.X*p.X+B.Z*p.Z)end local y=v.X*p.X+v.Z*p.Z q=math.min(q,y-x)r=math.max(r,y
+x)local z=v.X*j.X+v.Z*j.Z s+=z end local t,u,v=math.max(1,(r-q)+l*2),(q+r)/2,s/
#m local w=j*v+p*u return w,t end,function(h,j,k,l,m,n,o)if not j or not j.
Parent or not h or not h.Parent then return end local p=n/2 local q=Vector3.new(
k.X+l.X*p,m or k.Y,k.Z+l.Z*p)local r=q+Vector3.new(l.X,0,l.Z)local s=CFrame.
lookAt(q,r)local t=j.CFrame:ToObjectSpace(s)h.CFrame=t h.Size=Vector3.new(o,an,n
)if not h.Visible then h.Visible=true end end local k=function()if not ah then
return end local k,l,m=false,os.clock(),g()for n,o in pairs(aj)do local p=n.
Instance if not p or not p.Parent then ag.DetachTrajectoryVisuals(n)else k=true
local q,r=o.mainPart,n.Name or(p and p.Name)local s=ad and ad.
IsChasingProjectile and ad.IsChasingProjectile(r)if s then if o.ad and o.ad.
Visible then o.ad.Visible=false end o.isMoving=false n.IsTrajectory=false elseif
q and q.Parent then local t,u=q.Position,l-(o.lastClock or l)if u>=0.035 then
local v=t-(o.lastPos or t)local w,x=v.Magnitude/u,Vector3.new(v.X,0,v.Z)local y,
z=x.Magnitude/u,o.isMoving==true if y>=ao then o.isMoving=true o.dir=x.Unit else
if not o.isInstant and u>=0.25 and w<ao then o.isMoving=false end end if o.
isMoving~=z then n.IsTrajectory=o.isMoving n.HazardZones=nil if c and c.
UpdateHazardVisualColor then pcall(c.UpdateHazardVisualColor,n,o.isMoving)end
local A=a.load'e'if A and A.UpdateHazardVisualColor then pcall(A.
UpdateHazardVisualColor,n,o.isMoving)end end o.lastPos=t o.lastClock=l end if o.
isMoving and o.dir and o.ad then local v,w=h(n,o.dir)if v then j(o.ad,q,v,o.dir,
m,ai,w)end else if o.ad and o.ad.Visible then o.ad.Visible=false end end end end
end if not k and d then d:Disconnect()d=nil end end local l=function()if not d
and ah then d=ae.Heartbeat:Connect(k)end end function ag.DetachTrajectoryVisuals
(m)if not m then return end local n=aj[m]if not n then return end if n.ad then
pcall(function()n.ad:Destroy()end)n.ad=nil end if n.connections then for o,p in
ipairs(n.connections)do pcall(function()p:Disconnect()end)end table.clear(n.
connections)end aj[m]=nil end function ag.AttachTrajectoryVisuals(m)if not ah or
not m then return end if aj[m]then ag.DetachTrajectoryVisuals(m)end local n=m.
Instance if not n or not n.Parent then return end local o=m.Name or(n and n.Name
)if ad and ad.IsChasingProjectile and ad.IsChasingProjectile(o)then m.
IsTrajectory=false return end local p if n:IsA'BasePart'then p=n else p=n.
PrimaryPart or n:FindFirstChildWhichIsA'BasePart'if not p then for q,r in
ipairs(n:GetDescendants())do if r:IsA'BasePart'and r.Parent then p=r break end
end end end if not p or not p.Parent then return end local q=Instance.new
'BoxHandleAdornment'q.Name='HazardTrajectoryCorridor'q.Adornee=p q.Size=Vector3.
new(4,an,ai)q.Color3=al q.Transparency=am q.ZIndex=1 q.AlwaysOnTop=true q.
Visible=false q.Parent=p local r,s={},p:GetPropertyChangedSignal'Transparency':
Connect(function()if p.Parent and p.Transparency>ak then pcall(function()q:
Destroy()end)end end)table.insert(r,s)local t,u=f(m.Name or(n and n.Name),p)
local v=t~=nil aj[m]={ad=q,connections=r,mainPart=p,lastPos=p.Position,lastClock
=os.clock(),velocity=Vector3.zero,dir=t,isMoving=v,isInstant=v,instantMode=u}if
v and t then m.IsTrajectory=true m.HazardZones=nil local w,x,y=g(),h(m,t)if x
then j(q,p,x,t,w,ai,y)end if c and c.UpdateHazardVisualColor then pcall(c.
UpdateHazardVisualColor,m,true)end local z=a.load'e'if z and z.
UpdateHazardVisualColor then pcall(z.UpdateHazardVisualColor,m,true)end local A=
a.load'f'if A and A.UpdateHazardVisualColor then pcall(A.UpdateHazardVisualColor
,m,true)end end l()end function ag.ClearAll()if d then d:Disconnect()d=nil end
for m in pairs(aj)do ag.DetachTrajectoryVisuals(m)end table.clear(aj)end
function ag.RefreshAll()ag.ClearAll()if not ah or not c then return end for m,n
in pairs(c.GetActiveHazardsMap())do ag.AttachTrajectoryVisuals(n)end end
function ag.GetNearbyTrajectories(m,n)n=n or 65 local o,p,q={},m.X,m.Z for r,s
in pairs(aj)do if s.isMoving and s.dir and s.mainPart and s.mainPart.Parent then
local t,u=h(r,s.dir)if t and u then local v,w=t.X,t.Z local x,y=p-v,q-w local z,
A=x*x+y*y,n+ai+(u/2)if z<=A*A then table.insert(o,{info=r,record=s})end end end
end return o end function ag.IsPointInAnyTrajectory(m,n,o)local p,q=m.X,m.Z n=n
or 0 if o then for r,s in ipairs(o)do local t,u=s.info,s.record if u and u.
isMoving and u.dir and u.mainPart and u.mainPart.Parent then local v,w=h(t,u.dir
)if v and w then local x=u.dir local y,z,A=Vector3.new(-x.Z,0,x.X),p-v.X,q-v.Z
local B,C,D=z*x.X+A*x.Z,z*y.X+A*y.Z,w/2 if n<=0 then if B>=0 and B<=ai and math.
abs(C)<=D then return true,t,x,v,w end else local E=0 if B<0 then E=-B elseif B>
ai then E=B-ai end local F=math.max(0,math.abs(C)-D)if(E*E+F*F)<=(n*n)then
return true,t,x,v,w end end end end end return false,nil,nil,nil,nil end for r,s
in pairs(aj)do if s.isMoving and s.dir and s.mainPart and s.mainPart.Parent then
local t,u=h(r,s.dir)if t and u then local v=s.dir local w,x,y=Vector3.new(-v.Z,0
,v.X),p-t.X,q-t.Z local z,A,B=x*v.X+y*v.Z,x*w.X+y*w.Z,u/2 if n<=0 then if z>=0
and z<=ai and math.abs(A)<=B then return true,r,v,t,u end else local C=0 if z<0
then C=-z elseif z>ai then C=z-ai end local D=math.max(0,math.abs(A)-B)if(C*C+D*
D)<=(n*n)then return true,r,v,t,u end end end end end return false,nil,nil,nil,
nil end function ag.SetEnabled(m)ah=m and true or false if ah then ag.
RefreshAll()else ag.ClearAll()end end ac.OnPaddingChanged(function()if ah then
ag.RefreshAll()end end)ab.Register(function()ag.ClearAll()end)return ag end end
local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.load'a',a.load'c',a.load'b',a.load'd',a.
load'e',a.load'g',a.load'f',game:GetService'Players',game:GetService'Workspace',
game:GetService'ReplicatedStorage'local ak,al,am,an,ao,b,c,d,e,f,g,h,j,k,l,m,n,o
,p=aa.player,{},false,false,true,false,false,'',false,{},0,{},{},{'abilities',
'projectiles'},false,{},{}local q,r,s,t,u,v,w,x=function()if l then return end l
=true for q,r in ipairs(k)do local s=aj:FindFirstChild(r)if s then for t,u in
ipairs(s:GetChildren())do local v=(u.Name or''):lower():gsub('%s+','')if#v>0
then m[v]=true end end end end end,function(q)if not q then return true end
local r=q.Name if typeof(r)=='string'then local s=r:lower()if s:sub(1,3)=='tm_'
or s:sub(1,3)=='pr_'or s:sub(1,3)=='dq_'or s:find'pathrecord'or s:find'safespot'
or s:find'hazard'or s:find'adornment'or s:find'debug'or s:find'targetpart'or s:
find'actualmarker'then return true end local t=q.Parent while t and t~=workspace
and t~=game do local u=t.Name if typeof(u)=='string'then local v=u:lower()if v:
find'pathrecord'or v:sub(1,3)=='tm_'or v:sub(1,3)=='pr_'then return true end end
t=t.Parent end local u=s:gsub('%s+','')if#u>0 and m[u]==true then return true
end if n[u]==true or n[r]==true then return true end for v,w in pairs(n)do if
string.find(u,v,1,true)then return true end end end return false end,function(q)
if not q then return false end if ah:GetPlayerFromCharacter(q)then return true
end if ah:FindFirstChild(q.Name)then return true end for r,s in ipairs(ah:
GetPlayers())do if q.Name==s.Name then return true end local t=s.Character if t
and(q==t or q:IsDescendantOf(t))then return true end end local r=ak and ak.
Character if r and(q==r or q:IsDescendantOf(r))then return true end return false
end,function()local q=0 for r in pairs(f)do q+=1 end g=q for r=#h,1,-1 do pcall(
h[r],q,o)end end,0.85,50,0.05,{}local y,z,A,B,C,D,E,F=function(y)local z=x[y]if
z then z.active=false x[y]=nil end end,function()for y,z in pairs(x)do if z then
z.active=false end end table.clear(x)end,function(y)if not y then return{}end
local z={}local A=function(A)if A and A.Parent and A.Transparency<=u then z[#z+1
]=A end end if y:IsA'BasePart'then A(y)else for B,C in ipairs(y:GetDescendants()
)do if C:IsA'BasePart'and C.Parent then A(C)end end end return z end,function(y)
local z=ak and ak.Character if not z then return 0 end local A=z:FindFirstChild
'HumanoidRootPart'or z.PrimaryPart if not A then return 0 end local B,C=(A.
Position)if y:IsA'BasePart'then C=y.Position elseif y:IsA'Model'then local D,E=
pcall(function()return y:GetPivot().Position end)if D then C=E else local F=y:
FindFirstChildWhichIsA'BasePart'C=F and F.Position end end if not C then return
0 end return math.floor((B-C).Magnitude+0.5)end,Color3.fromRGB(255,45,45),Color3
.fromRGB(255,30,30),Color3.fromRGB(0,170,255),Color3.fromRGB(0,140,255)local G=
function(G,H,I)local J,K,L={},I and E or C,I and F or D for M,N in ipairs(G)do
if N and N.Parent then local O=Instance.new'SelectionBox'O.Name=
'HazardSelectionBox'O.Color3=K O.SurfaceColor3=L O.SurfaceTransparency=0.6 O.
LineThickness=0.05 O.Adornee=N O.Parent=N local P=N:GetPropertyChangedSignal
'Transparency':Connect(function()if N.Parent and N.Transparency>u then pcall(
function()O:Destroy()end)end end)if H then table.insert(H,P)end J[#J+1]=O end
end return J end function al.UpdateHazardVisualColor(H,I)if not H or not H.Boxes
then return end local J=I==true or H.IsTrajectory==true local K,L=J and E or C,J
and F or D for M,N in ipairs(H.Boxes)do if N and N.Parent then N.Color3=K N.
SurfaceColor3=L end end ag.UpdateHazardVisualColor(H,J)end local H,I=function(H)
if not e or d==''then return false end if not H or type(H)~='string'then return
false end local I=d:lower():gsub('%s+','')if#I==0 then return false end local J=
H:lower():gsub('%s+','')return string.find(J,I,1,true)~=nil end,function(H)if
not H then return'nil'end return('(%.2f, %.2f, %.2f)'):format(H.X,H.Y,H.Z)end
local ap=function(J,K,L,M)if not J then return end local N=J.Name if not H(N)
then return end local O,P,Q=J.ClassName,J.Parent and J.Parent:GetFullName()or
'nil',B(J)print
'================== \u{1f50d} [HAZARD DEEP INSPECT] \u{1f50d} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(N,O))print((
'  \u{1f4cc} Event Type     : %s%s'):format(K,L and(' -> '..tostring(L))or''))
print(('  \u{1f4cd} Full Path      : %s'):format(P))print((
'  \u{1f4cf} Dist to Player : %d studs'):format(Q))if K=='SPAWN'then local R={}
if J:IsA'BasePart'then table.insert(R,J)else for S,T in ipairs(J:GetDescendants(
))do if T:IsA'BasePart'then table.insert(R,T)end end end print((
'  \u{1f9e9} Total Parts (%d) :'):format(#R))for S,T in ipairs(R)do local U=T:
IsA'Part'and tostring(T.Shape.Name)or(T.ClassName=='MeshPart'and'MeshPart'or T.
ClassName)print(('     [%d] %q (%s)'):format(S,T.Name,T.ClassName))print((
'         \u{2022} Size: %s | Shape: %s | Trans: %.2f | CanCollide: %s'):format(
I(T.Size),U,T.Transparency,tostring(T.CanCollide)))print((
'         \u{2022} Pos : %s'):format(I(T.Position)))end local S=ad.
GetHazardZones(M)if S and S.zones then local T=ad.GetHitboxPadding()print((
'  \u{1f4d0} Math Geometry (Zones: %d, BoundingRadius: %.1f studs):'):format(#S.
zones,S.boundingRadius or 0))for U,V in ipairs(S.zones)do if V.radius then
print((
[[     - Zone [%d]: Circle/Ball (Base Radius: %.2f + Pad: %.2f = %.2f studs)]]):
format(U,V.radius,T,V.radius+T))elseif V.half then print((
'     - Zone [%d]: Box/OBB (HalfSize: %s)'):format(U,I(V.half)))end end end task
.spawn(function()local T if J:IsA'BasePart'then T=J elseif J:IsA'Model'then T=J.
PrimaryPart or J:FindFirstChildWhichIsA'BasePart'end if not T then return end
local U,V=os.clock(),T.CFrame task.wait(0.12)if not J.Parent or not T.Parent
then return end local W,X=os.clock(),T.CFrame local Y=W-U if Y<=0 then return
end local Z=X*V:Inverse()local _,ap=Z:ToAxisAngle()local aq,ar=math.deg(ap)/Y,V:
Inverse()*X local as,at=ar:ToAxisAngle()if math.abs(math.deg(ap))>=1.5 then
local au='Tr\u{1ee5}c t\u{1ef1} do / H\u{1ed7}n h\u{1ee3}p'if math.abs(_.Y)>=0.8
then au='Tr\u{1ee5}c Y (Yaw - Qu\u{e9}t ngang m\u{1eb7}t s\u{e0}n)'elseif math.
abs(_.X)>=0.8 then au='Tr\u{1ee5}c X (Pitch - L\u{103}n nh\u{e0}o l\u{1ed9}n)'
elseif math.abs(_.Z)>=0.8 then au=
'Tr\u{1ee5}c Z (Roll - Nghi\u{ea}ng l\u{1ead}t b\u{ea}n)'end local av=
'Tr\u{1ee5}c t\u{1ef1} do'if math.abs(as.Y)>=0.8 then av='Tr\u{1ee5}c Local Y'
elseif math.abs(as.X)>=0.8 then av='Tr\u{1ee5}c Local X'elseif math.abs(as.Z)>=
0.8 then av='Tr\u{1ee5}c Local Z'end print
'================== \u{1f504} [INSPECT: SPINNING DETECTED] \u{1f504} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(J.Name,T.Name))print((
'  \u{26a1} T\u{1ed1}c \u{111}\u{1ed9} xoay    : %.2f \u{b0}/s (%.2f rad/s)'):
format(aq,ap/Y))print(('  \u{1f310} World Spin Axis: %s -> %s'):format(I(_),au))
print(('  \u{1f9e9} Local Spin Axis: %s -> %s'):format(I(as),av))print
[[========================================================================]]end
end)elseif K=='DESPAWN'then if M and M.SpawnClock then local ap=os.clock()-M.
SpawnClock print(('  \u{23f1}\u{fe0f} Lifetime Active: %.2f seconds'):format(ap)
)end elseif K=='REJECTED'then print(('  \u{26a0}\u{fe0f} Rejection Reason: %s'):
format(tostring(L)))end print
[[================================================================]]end local aq
,ar=function(aq,ar)ap(aq,'REJECTED',ar,nil)if not c then return end local as,at=
aq and aq.Name or'?',aq and aq.ClassName or'?'print((
'[HazardScanner][Reject] \u{26aa} %s (%s) \u{2014} %s'):format(as,at,ar))end
local as=function(as)if not as or not as.Parent then return end if s(as)then
return end if f[as]then return end if x[as]then return end local at={active=true
,count=0}x[as]=at task.spawn(function()while at.active and as.Parent and am and
an do if s(as)then y(as)return end at.count+=1 local au,av,J=as:GetDescendants()
,A(as),H(as.Name)if c or J then print((
'[HazardScanner][Retry] \u{1f504} L\u{1ea7}n %d/%d: %q (%s) | Descendants: %d | Valid Parts (Trans<=%.2f): %d'
):format(at.count,v,as.Name,as.ClassName,#au,u,#av))end if#av>0 then if c or J
then print((
'[HazardScanner][Retry] \u{2705} L\u{1ea7}n %d/%d: %q \u{110}\u{e3} t\u{ec}m th\u{1ea5}y %d part(s)! Ti\u{1ebf}n h\u{e0}nh v\u{1ebd}...'
):format(at.count,v,as.Name,#av))end y(as)ar(as)return end if at.count>=v then
aq(as,(
'H\u{1ebf}t %d l\u{1b0}\u{1ee3}t retry m\u{e0} kh\u{f4}ng t\u{ec}m th\u{1ea5}y BasePart h\u{1ee3}p l\u{1ec7} (Descendants: %d)'
):format(v,#au))y(as)return end task.wait(w)end y(as)end)end ar=function(at)if
not am or not an then aq(at,'Ch\u{1b0}a trong dungeon')return false end if not
at or not at.Parent then aq(at,'Kh\u{f4}ng c\u{f2}n Parent')return false end if
s(at)then aq(at,
'Nh\u{e2}n v\u{1ead}t ng\u{1b0}\u{1edd}i ch\u{1a1}i (Player/Teammate)')return
false end if f[at]then return true end q()if r(at)then aq(at,
'Tr\u{f9}ng t\u{ea}n trong ReplicatedStorage (abilities/projectiles)')return
false end local au=A(at)if#au==0 then aq(at,
'Ch\u{1b0}a c\u{f3} part \u{111}\u{1ec3} v\u{1ebd} (s\u{1ebd} retry)')as(at)
return false end local av,J=ad.IsIceSpikesChain and ad.IsIceSpikesChain(at.Name)
,B(at)local K,L,M={Instance=at,Name=at.Name,Class=at.ClassName,Distance=J,Boxes=
{},Connections={},SpawnClock=os.clock()},{},{}if ao and not av then M=G(au,L)end
K.Boxes=M K.Connections=L f[at]=K o={Name=at.Name,Class=at.ClassName,Distance=J}
if ae.IsEnabled()then ae.AttachZoneVisuals(K)end if af.IsEnabled()then af.
AttachTrajectoryVisuals(K)end if ag.IsEnabled()then ag.AttachTimerVisual(K)end
y(at)ap(at,'SPAWN','Passed all gates',K)if b then print((
'[HazardScanner][Hazard] \u{1f534} Hazard Detected: %s (%s, %d studs)'):format(
at.Name,at.ClassName,J))end t()return true end local at=function(at,au)local av=
f[at]if not av then y(at)return end ap(at,'DESPAWN',au,av)ae.DetachZoneVisuals(
av)af.DetachTrajectoryVisuals(av)ag.DetachTimerVisual(av)if av.Boxes then for J,
K in ipairs(av.Boxes)do pcall(function()K:Destroy()end)end table.clear(av.Boxes)
end if av.Connections then for J,K in ipairs(av.Connections)do pcall(function()K
:Disconnect()end)end table.clear(av.Connections)end f[at]=nil if b then local J=
au and(' ('..au..')')or''print((
'[HazardScanner][Hazard] \u{1f7e2} Hazard Expired: %s%s'):format(tostring(av.
Name),J))end t()end function al.ClearAllHazards(au)ae.ClearAll()af.ClearAll()ag.
ClearAll()z()local av={}for J in pairs(f)do table.insert(av,J)end for J,K in
ipairs(av)do at(K,au)end if b and au then print((
'[HazardScanner][Hazard] \u{1f9f9} All hazards cleared: %s'):format(au))end end
function al.StartScan()if am then return end am=true ae.BindDetection(al)af.
BindDetection(al)ag.BindDetection(al)al.ClearAllHazards'StartScan Reset'for au,
av in ipairs(j)do av:Disconnect()end table.clear(j)table.insert(j,ai.ChildAdded:
Connect(function(au)if s(au)then return end ar(au)end))table.insert(j,ai.
ChildRemoved:Connect(function(au)at(au,'Destroyed')end))an=ab.
GetCurrentRoomIndex()>0 if p then pcall(p)p=nil end p=ab.OnRoomIndexChanged(
function(au)if au>0 then an=true elseif au<=0 and an then an=false al.
ClearAllHazards'Dungeon Ended'end end)if b then print
'[HazardScanner] \u{1f4e1} Threat Detector started!'end end function al.StopScan
()am=false an=false for au,av in ipairs(j)do av:Disconnect()end table.clear(j)if
p then pcall(p)p=nil end al.ClearAllHazards'StopScan'if b then print
'[HazardScanner] \u{1f6d1} Threat Detector stopped.'end end function al.
IsEnabled()return am end function al.SetEnabled(au)if au then al.StartScan()else
al.StopScan()end end function al.SetSelectionBoxesEnabled(au)ao=au and true or
false if ao then for av,J in pairs(f)do if av and av.Parent and(not J.Boxes or#J
.Boxes==0)then local K=A(av)J.Connections=J.Connections or{}J.Boxes=G(K,J.
Connections)end end else for av,J in pairs(f)do if J.Boxes then for K,L in
ipairs(J.Boxes)do pcall(function()L:Destroy()end)end table.clear(J.Boxes)end end
end end function al.IsSelectionBoxesEnabled()return ao end function al.
SetLogHazards(au)b=au and true or false end function al.IsLogHazardsEnabled()
return b end function al.SetLogFailed(au)c=au and true or false end function al.
IsLogFailedEnabled()return c end function al.SetInspectTarget(au)d=type(au)==
'string'and au or''end function al.GetInspectTarget()return d end function al.
SetInspectEnabled(au)e=au and true or false end function al.IsInspectEnabled()
return e end function al.GetHazardCount()return g end function al.
GetActiveHazards()local au={}for av,J in pairs(f)do if av and av.Parent==ai then
au[#au+1]=J end end return au end function al.GetActiveHazardsMap()return f end
function al.GetLastHazardInfo()return o end function al.OnHazardChanged(au)if
type(au)~='function'then return end table.insert(h,au)end ac.Register(function()
al.StopScan()al.ClearAllHazards'Shutdown'end)return al