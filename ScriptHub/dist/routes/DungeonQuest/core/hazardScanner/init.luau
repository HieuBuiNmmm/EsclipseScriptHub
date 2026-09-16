local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b={cleaned=false,callbacks={}
}function b.Register(c)if type(c)~='function'then return function()end end if b.
cleaned then pcall(c)return function()end end table.insert(b.callbacks,c)return
function()for d,e in ipairs(b.callbacks)do if e==c then table.remove(b.callbacks
,d)break end end end end function b.Cleanup()if b.cleaned then return end b.
cleaned=true for c=#b.callbacks,1,-1 do pcall(b.callbacks[c])end table.clear(b.
callbacks)end function b.IsActive()return not b.cleaned end return b end
function a.b()local b,c,d,e=game:GetService'Players',game:GetService
'UserInputService',game:GetService'RunService',game:GetService
'VirtualInputManager'local f=b.LocalPlayer if not f then local g=os.clock()+5
repeat f=b.LocalPlayer if f then break end task.wait(0.1)until os.clock()>g end
return{Players=b,UserInputService=c,RunService=d,VirtualInputManager=e,player=f}
end function a.c()local b,c=a.load'b',a.load'a'local d,e,f,g,h,i,j,k,l,m,n,o,p,q
,r,s,t,u,v,w,x,y,z=b.player,0.05,'enemyProjectiles',0.5,{},false,16,16,true,
false,false,{},0,{},0,{},{},{},{},{},{},0,{}local A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,
P,Q,R,S=function()for A=#z,1,-1 do pcall(z[A])end end,{},'unknown',true,{},{},{}
,0,4,false local T=function(T)if T then table.insert(G,T)end return T end
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
~=nil,m,n end return aa end function a.e()local aa,ab,ac=a.load'b',a.load'a',a.
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
function()af.ClearAll()end)return af end function a.f()local aa,ab,ac=a.load'b',
a.load'a',a.load'd'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,b,c,d,e,f,g=aa.
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
return ag end function a.g()local aa,ab,ac,ad=a.load'b',a.load'a',a.load'd',a.
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
ag.RefreshAll()end end)ab.Register(function()ag.ClearAll()end)return ag end
function a.h()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.load'b',a.load'c',a.load'a',
a.load'd',a.load'e',a.load'g',a.load'f',game:GetService'Players',game:GetService
'Workspace',game:GetService'ReplicatedStorage'local ak,al,am,an,ao,b,c,d,e,f,g,h
,j,k,l,m,n,o,p=aa.player,{},false,false,true,false,false,'',false,{},0,{},{},{
'abilities','projectiles'},false,{},{}local q,r,s,t,u,v,w,x=function()if l then
return end l=true for q,r in ipairs(k)do local s=aj:FindFirstChild(r)if s then
for t,u in ipairs(s:GetChildren())do local v=(u.Name or''):lower():gsub('%s+',''
)if#v>0 then m[v]=true end end end end end,function(q)if not q then return true
end local r=q.Name if typeof(r)=='string'then local s=r:lower()if s:sub(1,3)==
'tm_'or s:sub(1,3)=='pr_'or s:sub(1,3)=='dq_'or s:find'pathrecord'or s:find
'safespot'or s:find'hazard'or s:find'adornment'or s:find'debug'or s:find
'targetpart'or s:find'actualmarker'then return true end local t=q.Parent while t
and t~=workspace and t~=game do local u=t.Name if typeof(u)=='string'then local
v=u:lower()if v:find'pathrecord'or v:sub(1,3)=='tm_'or v:sub(1,3)=='pr_'then
return true end end t=t.Parent end local u=s:gsub('%s+','')if#u>0 and m[u]==true
then return true end if n[u]==true or n[r]==true then return true end for v,w in
pairs(n)do if string.find(u,v,1,true)then return true end end end return false
end,function(q)if not q then return false end if ah:GetPlayerFromCharacter(q)
then return true end if ah:FindFirstChild(q.Name)then return true end for r,s in
ipairs(ah:GetPlayers())do if q.Name==s.Name then return true end local t=s.
Character if t and(q==t or q:IsDescendantOf(t))then return true end end local r=
ak and ak.Character if r and(q==r or q:IsDescendantOf(r))then return true end
return false end,function()local q=0 for r in pairs(f)do q+=1 end g=q for r=#h,1
,-1 do pcall(h[r],q,o)end end,0.85,50,0.05,{}local y,z,A,B,C,D,E,F=function(y)
local z=x[y]if z then z.active=false x[y]=nil end end,function()for y,z in
pairs(x)do if z then z.active=false end end table.clear(x)end,function(y)if not
y then return{}end local z={}local A=function(A)if A and A.Parent and A.
Transparency<=u then z[#z+1]=A end end if y:IsA'BasePart'then A(y)else for B,C
in ipairs(y:GetDescendants())do if C:IsA'BasePart'and C.Parent then A(C)end end
end return z end,function(y)local z=ak and ak.Character if not z then return 0
end local A=z:FindFirstChild'HumanoidRootPart'or z.PrimaryPart if not A then
return 0 end local B,C=(A.Position)if y:IsA'BasePart'then C=y.Position elseif y:
IsA'Model'then local D,E=pcall(function()return y:GetPivot().Position end)if D
then C=E else local F=y:FindFirstChildWhichIsA'BasePart'C=F and F.Position end
end if not C then return 0 end return math.floor((B-C).Magnitude+0.5)end,Color3.
fromRGB(255,45,45),Color3.fromRGB(255,30,30),Color3.fromRGB(0,170,255),Color3.
fromRGB(0,140,255)local G=function(G,H,I)local J,K,L={},I and E or C,I and F or
D for M,N in ipairs(G)do if N and N.Parent then local O=Instance.new
'SelectionBox'O.Name='HazardSelectionBox'O.Color3=K O.SurfaceColor3=L O.
SurfaceTransparency=0.6 O.LineThickness=0.05 O.Adornee=N O.Parent=N local P=N:
GetPropertyChangedSignal'Transparency':Connect(function()if N.Parent and N.
Transparency>u then pcall(function()O:Destroy()end)end end)if H then table.
insert(H,P)end J[#J+1]=O end end return J end function al.
UpdateHazardVisualColor(H,I)if not H or not H.Boxes then return end local J=I==
true or H.IsTrajectory==true local K,L=J and E or C,J and F or D for M,N in
ipairs(H.Boxes)do if N and N.Parent then N.Color3=K N.SurfaceColor3=L end end ag
.UpdateHazardVisualColor(H,J)end local H,I=function(H)if not e or d==''then
return false end if not H or type(H)~='string'then return false end local I=d:
lower():gsub('%s+','')if#I==0 then return false end local J=H:lower():gsub('%s+'
,'')return string.find(J,I,1,true)~=nil end,function(H)if not H then return'nil'
end return('(%.2f, %.2f, %.2f)'):format(H.X,H.Y,H.Z)end local ap=function(J,K,L,
M)if not J then return end local N=J.Name if not H(N)then return end local O,P,Q
=J.ClassName,J.Parent and J.Parent:GetFullName()or'nil',B(J)print
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
al.StopScan()al.ClearAllHazards'Shutdown'end)return al end function a.i()local
aa,ab,ac,ad=a.load'b',a.load'a',a.load'd',a.load'g'local ae,af,ag,ah,ai,aj,ak,al
,am,an,ao,ap,aq,ar,as,at,au,av=aa.RunService or game:GetService'RunService',aa.
player,{},true,false,{},1.8,Color3.fromRGB(0,255,170),Color3.fromRGB(255,35,35),
0.45,0.2,0.2,(game:GetService'Players')local b,c,d,e=function()local b=af or aq.
LocalPlayer if not b then return nil end local c=b.Character if not c or not c.
Parent then return nil end local d=c:FindFirstChildOfClass'Humanoid'if d and d.
Health<=0 then return nil end return c:FindFirstChild'HumanoidRootPart'or c.
PrimaryPart end,function(b)if not b then return 0 end return b.Position.Y-2.5
end,function(b)if au then if au.Parent~=b or not au:IsDescendantOf(workspace)
then pcall(function()au:Destroy()end)au=nil else if au.Adornee~=b then au.
Adornee=b end return au end end if not b or not b.Parent then return nil end
local c=Instance.new'CylinderHandleAdornment'c.Name='Player_2D_HitboxVisual'c.
Adornee=b c.Radius=ak c.Height=ap c.Color3=ai and am or al c.Transparency=ai and
ao or an c.ZIndex=5 c.AlwaysOnTop=false c.Visible=ah c.Parent=b au=c return c
end,function(b)if not au or not au.Parent then return end au.Color3=b and am or
al au.Transparency=b and ao or an end local f=function()local f=b()if not f or
not f.Parent then if au and au.Parent then au.Visible=false end if ai then ai=
false ar=nil as=nil for g,h in ipairs(aj)do pcall(h,false,nil,nil)end end return
end local g=d(f)if g and g.Parent then g.Visible=ah g.Radius=ak local h=c(f)
local j=CFrame.new(Vector3.new(f.Position.X,h,f.Position.Z))*CFrame.Angles(math.
rad(90),0,0)g.CFrame=f.CFrame:ToObjectSpace(j)end local h=Vector3.new(f.Position
.X,0,f.Position.Z)local j,k,l=ac.IsPointInAnyHazard(h,nil,ak)local m,n=false if
not j and ad.IsPointInAnyTrajectory then m,n=ad.IsPointInAnyTrajectory(h,ak)end
local o,p,q=(j or m),k or n,j and'Ground Zone'or(m and'Trajectory Corridor'or
nil)if o~=ai or p~=ar then ai=o ar=p as=q e(o)for r,s in ipairs(aj)do pcall(s,o,
p,q)end end end local g=function()if not at then at=ae.Heartbeat:Connect(f)end
end function ag.Cleanup()if at then at:Disconnect()at=nil end if au then pcall(
function()au:Destroy()end)au=nil end ai=false ar=nil as=nil end function ag.
IsPlayerInDanger()return ai,ar,as end function ag.GetCurrentThreat()return ar,as
end function ag.OnDangerStatusChanged(h)if type(h)=='function'then table.insert(
aj,h)end end function ag.SetVisualEnabled(h)ah=h and true or false if au then au
.Visible=ah end end function ag.IsVisualEnabled()return ah end function ag.
SetRadius(h)if type(h)=='number'and h>=0.1 then ak=h if au and au.Parent then au
.Radius=ak end end end function ag.GetRadius()return ak end local h=function()
local h=af or aq.LocalPlayer if not h then return end local j=function(j)if au
then pcall(function()au:Destroy()end)au=nil end task.spawn(function()local k=j:
WaitForChild('Humanoid',3)if k then k.Died:Connect(function()if au then au.
Visible=false end end)end end)end av=h.CharacterAdded:Connect(j)if h.Character
then j(h.Character)end end h()g()ab.Register(function()if av then av:Disconnect(
)av=nil end ag.Cleanup()end)return ag end function a.j()local aa,ab,ac={},{},8
for ad=1,ac do local ae=(ad-1)*(2*math.pi/ac)ab[ad]=Vector3.new(math.cos(ae),0,
math.sin(ae))end local ad,ae={},16 for af=1,ae do local ag=(af-1)*(2*math.pi/ae)
ad[af]=Vector3.new(math.cos(ag),0,math.sin(ag))end local af,ag={1.5,3,5,8,12,18,
25},{1.5,3,4.5,6,8,10.5,13.5,17,21,26,32,40}aa.COARSE_DIRECTIONS=ab aa.
FINE_DIRECTIONS=ad aa.COARSE_RADII=af aa.FINE_RADII=ag function aa.SamplePass(ah
,ai,aj,ak,al,am,an,ao)local ap,aq,ar,as,at=math.huge,Vector3.zero,false,ai if ao
and ao.Magnitude>0.1 then local au=Vector3.new(ao.X,0,ao.Z).Unit as=table.clone(
ai)table.sort(as,function(av,b)local c,d=av.X*au.X+av.Z*au.Z,b.X*au.X+b.Z*au.Z
return c>d end)end for au,av in ipairs(aj)do local b=false for c,d in ipairs(as)
do local e=ah+d*av local f=am(e)if an then table.insert(an,{pos=e,isSafe=f,
isChosen=false})end if f then local g=e if al and ak>0 then local h=e+d*ak if
am(h)then g=h end end local h=(g-ah).Magnitude if h<ap then ap=h at=g aq=d b=
true end end end if b and at then ar=true break end end return at,ar,ap,aq end
return aa end function a.k()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am=Color3.
fromRGB(0,255,120),Color3.fromRGB(0,255,150),Color3.fromRGB(255,255,255),Color3.
fromRGB(0,235,140),Color3.fromRGB(255,60,60),0.2,1.4,0.45,{},{}local an,ao=
function(an)if not an then return end if not ak or not ak.Parent then if ak then
pcall(function()ak:Destroy()end)end local ao=Instance.new
'CylinderHandleAdornment'ao.Name='SafeSpot_OuterMarker'ao.Adornee=an ao.Radius=
ag ao.Height=af ao.Color3=aa ao.Transparency=0.35 ao.ZIndex=6 ao.AlwaysOnTop=
false ao.Visible=false ao.Parent=an ak=ao end if not al or not al.Parent then if
al then pcall(function()al:Destroy()end)end local ao=Instance.new
'CylinderHandleAdornment'ao.Name='SafeSpot_CenterDot'ao.Adornee=an ao.Radius=ah
ao.Height=af+0.05 ao.Color3=ac ao.Transparency=0.15 ao.ZIndex=7 ao.AlwaysOnTop=
false ao.Visible=false ao.Parent=an al=ao end if not am or not am.Parent then if
am then pcall(function()am:Destroy()end)end local ao=Instance.new
'LineHandleAdornment'ao.Name='SafeSpot_EscapeLine'ao.Adornee=an ao.Color3=ab ao.
Thickness=3.5 ao.Transparency=0.2 ao.ZIndex=6 ao.AlwaysOnTop=false ao.Visible=
false ao.Parent=an am=ao end end,function(an,ao)local ap=aj[an]if not ap then
local aq=Instance.new'CylinderHandleAdornment'aq.Name='SafeSpot_CandidateDot_'..
an aq.Adornee=ao aq.Radius=0.25 aq.Height=af aq.ZIndex=4 aq.AlwaysOnTop=false aq
.Visible=false aq.Parent=ao local ar=Instance.new'LineHandleAdornment'ar.Name=
'SafeSpot_CandidateLine_'..an ar.Adornee=ao ar.Thickness=1.2 ar.ZIndex=4 ar.
AlwaysOnTop=false ar.Visible=false ar.Parent=ao ap={dot=aq,line=ar}aj[an]=ap
else if ap.dot and ap.dot.Adornee~=ao then ap.dot.Adornee=ao ap.dot.Parent=ao
end if ap.line and ap.line.Adornee~=ao then ap.line.Adornee=ao ap.line.Parent=ao
end end return ap end function ai.HideCandidates()for ap,aq in ipairs(aj)do if
aq.dot and aq.dot.Parent then aq.dot.Visible=false end if aq.line and aq.line.
Parent then aq.line.Visible=false end end end function ai.Hide()if ak and ak.
Parent then ak.Visible=false end if al and al.Parent then al.Visible=false end
if am and am.Parent then am.Visible=false end ai.HideCandidates()end local ap=
function(ap,aq,ar,as)if not as or not ar or#ar==0 then ai.HideCandidates()return
end local at=Vector3.new(ap.Position.X,aq+0.05,ap.Position.Z)local au=ap.CFrame:
PointToObjectSpace(at)for av,b in ipairs(ar)do local c,d=ao(av,ap),Vector3.new(b
.pos.X,aq+0.05,b.pos.Z)local e,f,g=ap.CFrame:PointToObjectSpace(d),b.isSafe and
ad or ae,b.isSafe and 0.35 or 0.55 if c.dot and c.dot.Parent then local h=CFrame
.new(d)*CFrame.Angles(math.rad(90),0,0)c.dot.CFrame=ap.CFrame:ToObjectSpace(h)c.
dot.Color3=f c.dot.Transparency=g c.dot.Radius=b.isSafe and 0.3 or 0.2 c.dot.
Visible=true end if c.line and c.line.Parent then local h=e-au local j=h.
Magnitude if j>0.2 then c.line.CFrame=CFrame.lookAt(au,e)c.line.Length=j c.line.
Color3=f c.line.Transparency=g+0.15 c.line.Thickness=b.isSafe and 1.4 or 0.9 c.
line.Visible=true else c.line.Visible=false end end end for av=#ar+1,#aj do
local b=aj[av]if b.dot and b.dot.Parent then b.dot.Visible=false end if b.line
and b.line.Parent then b.line.Visible=false end end end function ai.Update(aq,ar
,as,at,au,av)if not aq or not aq.Parent or not au or not ar then ai.Hide()return
end an(aq)local b=Vector3.new(ar.X,as,ar.Z)if ak and ak.Parent then local c=
CFrame.new(b)*CFrame.Angles(math.rad(90),0,0)ak.CFrame=aq.CFrame:ToObjectSpace(c
)ak.Visible=true end if al and al.Parent then local c=CFrame.new(b)*CFrame.
Angles(math.rad(90),0,0)al.CFrame=aq.CFrame:ToObjectSpace(c)al.Visible=true end
if am and am.Parent then local c,d=Vector3.new(aq.Position.X,as+0.1,aq.Position.
Z),Vector3.new(ar.X,as+0.1,ar.Z)local e,f=aq.CFrame:PointToObjectSpace(c),aq.
CFrame:PointToObjectSpace(d)local g=f-e local h=g.Magnitude if h>0.3 then am.
CFrame=CFrame.new(e)am.Length=h am.CFrame=CFrame.lookAt(e,f)am.Visible=true else
am.Visible=false end end ap(aq,as,at,av)end function ai.Cleanup()if ak then
pcall(function()ak:Destroy()end)ak=nil end if al then pcall(function()al:
Destroy()end)al=nil end if am then pcall(function()am:Destroy()end)am=nil end
for aq,ar in ipairs(aj)do if ar.dot then pcall(function()ar.dot:Destroy()end)end
if ar.line then pcall(function()ar.line:Destroy()end)end end table.clear(aj)end
return ai end function a.l()local aa={Options={},Folder='Maclib',contextData={},
GetService=function(aa)return cloneref and cloneref(game:GetService(aa))or game:
GetService(aa)end}local ab,ac,ad,ae,af,ag,ah=aa.GetService'TweenService',aa.
GetService'RunService',aa.GetService'HttpService',aa.GetService'ContentProvider'
,aa.GetService'UserInputService',aa.GetService'Lighting',aa.GetService'Players'
local ai,aj,ak,al,am,an,ao,ap,aq,ar=ac:IsStudio(),ah.LocalPlayer,{},0,false,{
interFont='rbxassetid://12187365364',userInfoBlurred='rbxassetid://18824089198',
toggleBackground='rbxassetid://18772190202',togglerHead=
'rbxassetid://18772309008',buttonImage='rbxassetid://10709791437',searchIcon=
'rbxassetid://86737463322606',colorWheel='rbxassetid://2849458409',colorTarget=
'rbxassetid://73265255323268',grid='rbxassetid://121484455191370',globe=
'rbxassetid://108952102602834',transform='rbxassetid://90336395745819',dropdown=
'rbxassetid://18865373378',sliderbar='rbxassetid://18772615246',sliderhead=
'rbxassetid://18772834246'}local as,at=function()local as=Instance.new
'ScreenGui'as.ScreenInsets=Enum.ScreenInsets.None as.ResetOnSpawn=false as.
ZIndexBehavior=Enum.ZIndexBehavior.Sibling as.DisplayOrder=2147483647 local at=
ac:IsStudio()and aj:FindFirstChild'PlayerGui'or(gethui and gethui())or(cloneref
and cloneref(aa.GetService'CoreGui')or aa.GetService'CoreGui')as.Parent=at
return as end,function(as,at,au)return ab:Create(as,at,au)end function aa:Window
(au)local av={Settings=au}if au.AcrylicBlur~=nil then ap=au.AcrylicBlur else ap=
true end local b,c=as(),Instance.new'Frame'c.Name='Notifications'c.
BackgroundColor3=Color3.fromRGB(255,255,255)c.BackgroundTransparency=1 c.
BorderColor3=Color3.fromRGB(0,0,0)c.BorderSizePixel=0 c.Size=UDim2.fromScale(1,1
)c.Parent=b c.ZIndex=2 local d=Instance.new'UIListLayout'd.Name=
'NotificationsUIListLayout'd.Padding=UDim.new(0,10)d.HorizontalAlignment=Enum.
HorizontalAlignment.Right d.SortOrder=Enum.SortOrder.LayoutOrder d.
VerticalAlignment=Enum.VerticalAlignment.Bottom d.Parent=c local e=Instance.new
'UIPadding'e.Name='NotificationsUIPadding'e.PaddingBottom=UDim.new(0,10)e.
PaddingLeft=UDim.new(0,10)e.PaddingRight=UDim.new(0,10)e.PaddingTop=UDim.new(0,
10)e.Parent=c local f=Instance.new'Frame'f.Name='Base'f.AnchorPoint=Vector2.new(
0.5,0.5)f.BackgroundColor3=Color3.fromRGB(15,15,15)f.BackgroundTransparency=au.
AcrylicBlur and 0.05 or 0 f.BorderColor3=Color3.fromRGB(0,0,0)f.BorderSizePixel=
0 f.Position=UDim2.fromScale(0.5,0.5)f.Size=au.Size or UDim2.fromOffset(868,650)
local g=Instance.new'UIScale'g.Name='BaseUIScale'g.Parent=f local h=Instance.new
'UICorner'h.Name='BaseUICorner'h.CornerRadius=UDim.new(0,10)h.Parent=f local j=
Instance.new'UIStroke'j.Name='BaseUIStroke'j.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border j.Color=Color3.fromRGB(255,255,255)j.Transparency=0.9 j.
Parent=f local k=Instance.new'Frame'k.Name='Sidebar'k.BackgroundColor3=Color3.
fromRGB(255,255,255)k.BackgroundTransparency=1 k.BorderColor3=Color3.fromRGB(0,0
,0)k.BorderSizePixel=0 k.Position=UDim2.fromScale(-3.5199999999999996E-8,4.69e-8
)k.Size=au.SidebarWidth and UDim2.new(0,au.SidebarWidth,1,0)or UDim2.fromScale(
0.325,1)local l=Instance.new'Frame'l.Name='Divider'l.AnchorPoint=Vector2.new(1,0
)l.BackgroundColor3=Color3.fromRGB(255,255,255)l.BackgroundTransparency=0.9 l.
BorderColor3=Color3.fromRGB(0,0,0)l.BorderSizePixel=0 l.Position=UDim2.
fromScale(1,0)l.Size=UDim2.new(0,1,1,0)l.Parent=k local m=Instance.new
'TextButton'm.Name='DividerInteract'm.AnchorPoint=Vector2.new(0.5,0)m.
BackgroundColor3=Color3.fromRGB(255,255,255)m.BackgroundTransparency=1 m.
BorderColor3=Color3.fromRGB(0,0,0)m.BorderSizePixel=0 m.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'm.Position=UDim2.fromScale(0.5,0)m
.Size=UDim2.new(1,6,1,0)m.Text=''m.TextColor3=Color3.fromRGB(0,0,0)m.TextSize=14
m.Parent=l local n=Instance.new'Frame'n.Name='WindowControls'n.BackgroundColor3=
Color3.fromRGB(255,255,255)n.BackgroundTransparency=1 n.BorderColor3=Color3.
fromRGB(0,0,0)n.BorderSizePixel=0 n.Size=UDim2.new(1,0,0,31)local o=Instance.new
'Frame'o.Name='Controls'o.BackgroundColor3=Color3.fromRGB(119,174,94)o.
BackgroundTransparency=1 o.BorderColor3=Color3.fromRGB(0,0,0)o.BorderSizePixel=0
o.Size=UDim2.fromScale(1,1)local p=Instance.new'UIListLayout'p.Name=
'UIListLayout'p.Padding=UDim.new(0,5)p.FillDirection=Enum.FillDirection.
Horizontal p.SortOrder=Enum.SortOrder.LayoutOrder p.VerticalAlignment=Enum.
VerticalAlignment.Center p.Parent=o local q=Instance.new'UIPadding'q.Name=
'UIPadding'q.PaddingLeft=UDim.new(0,11)q.Parent=o local r,s={sizes={enabled=
UDim2.fromOffset(8,8),disabled=UDim2.fromOffset(7,7)},transparencies={enabled=0,
disabled=1},strokeTransparency=0.9},Instance.new'UIStroke's.Name='BaseUIStroke's
.ApplyStrokeMode=Enum.ApplyStrokeMode.Border s.Color=Color3.fromRGB(255,255,255)
s.Transparency=r.strokeTransparency local t=Instance.new'TextButton't.Name=
'Exit't.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json't.Text=''
t.TextColor3=Color3.fromRGB(0,0,0)t.TextSize=14 t.AutoButtonColor=false t.
BackgroundColor3=Color3.fromRGB(250,93,86)t.BorderColor3=Color3.fromRGB(0,0,0)t.
BorderSizePixel=0 local u=Instance.new'UICorner'u.Name='UICorner'u.CornerRadius=
UDim.new(1,0)u.Parent=t t.Parent=o local v=Instance.new'TextButton'v.Name=
'Minimize'v.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'v.
Text=''v.TextColor3=Color3.fromRGB(0,0,0)v.TextSize=14 v.AutoButtonColor=false v
.BackgroundColor3=Color3.fromRGB(252,190,57)v.BorderColor3=Color3.fromRGB(0,0,0)
v.BorderSizePixel=0 v.LayoutOrder=1 local w=Instance.new'UICorner'w.Name=
'UICorner'w.CornerRadius=UDim.new(1,0)w.Parent=v v.Parent=o local x=Instance.new
'TextButton'x.Name='Maximize'x.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'x.Text=''x.TextColor3=Color3.
fromRGB(0,0,0)x.TextSize=14 x.AutoButtonColor=false x.BackgroundColor3=Color3.
fromRGB(119,174,94)x.BorderColor3=Color3.fromRGB(0,0,0)x.BorderSizePixel=0 x.
LayoutOrder=1 local y=Instance.new'UICorner'y.Name='UICorner'y.CornerRadius=UDim
.new(1,0)y.Parent=x x.Parent=o local z=function(z,A)local B,C=A and r.sizes.
enabled or r.sizes.disabled,A and r.transparencies.enabled or r.transparencies.
disabled z.Size=B z.BackgroundTransparency=C z.Active=A z.Interactable=A for D,E
in ipairs(z:GetChildren())do if E:IsA'UIStroke'then E.Transparency=C end end if
not A then s:Clone().Parent=z end end z(x,false)local A={t,v}for B,C in pairs(A)
do local D,E=C.Name,true if au.DisabledWindowControls and table.find(au.
DisabledWindowControls,D)then E=false end z(C,E)end o.Parent=n local B=Instance.
new'Frame'B.Name='Divider'B.AnchorPoint=Vector2.new(0,1)B.BackgroundColor3=
Color3.fromRGB(255,255,255)B.BackgroundTransparency=0.9 B.BorderColor3=Color3.
fromRGB(0,0,0)B.BorderSizePixel=0 B.Position=UDim2.fromScale(0,1)B.Size=UDim2.
new(1,0,0,1)B.Parent=n n.Parent=k local C=Instance.new'Frame'C.Name=
'Information'C.BackgroundColor3=Color3.fromRGB(255,255,255)C.
BackgroundTransparency=1 C.BorderColor3=Color3.fromRGB(0,0,0)C.BorderSizePixel=0
C.Position=UDim2.fromOffset(0,31)C.Size=UDim2.new(1,0,0,60)local D=Instance.new
'Frame'D.Name='Divider'D.AnchorPoint=Vector2.new(0,1)D.BackgroundColor3=Color3.
fromRGB(255,255,255)D.BackgroundTransparency=0.9 D.BorderColor3=Color3.fromRGB(0
,0,0)D.BorderSizePixel=0 D.Position=UDim2.fromScale(0,1)D.Size=UDim2.new(1,0,0,1
)D.Parent=C local E=Instance.new'Frame'E.Name='InformationHolder'E.
BackgroundColor3=Color3.fromRGB(255,255,255)E.BackgroundTransparency=1 E.
BorderColor3=Color3.fromRGB(0,0,0)E.BorderSizePixel=0 E.Size=UDim2.fromScale(1,1
)local F=Instance.new'UIPadding'F.Name='InformationHolderUIPadding'F.
PaddingBottom=UDim.new(0,10)F.PaddingLeft=UDim.new(0,23)F.PaddingRight=UDim.new(
0,22)F.PaddingTop=UDim.new(0,10)F.Parent=E local G=Instance.new'ImageButton'G.
Name='GlobalSettingsButton'G.Image=an.globe G.ImageTransparency=0.5 G.
AnchorPoint=Vector2.new(1,0.5)G.BackgroundColor3=Color3.fromRGB(255,255,255)G.
BackgroundTransparency=1 G.BorderColor3=Color3.fromRGB(0,0,0)G.BorderSizePixel=0
G.Position=UDim2.fromScale(1,0.5)G.Size=UDim2.fromOffset(16,16)G.Parent=E local
H=function(H)if H=='Default'then at(G,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
ImageTransparency=0.5}):Play()elseif H=='Hover'then at(G,TweenInfo.new(0.2,Enum.
EasingStyle.Sine),{ImageTransparency=0.3}):Play()end end G.MouseEnter:Connect(
function()H'Hover'end)G.MouseLeave:Connect(function()H'Default'end)local I=
Instance.new'Frame'I.Name='TitleFrame'I.BackgroundColor3=Color3.fromRGB(255,255,
255)I.BackgroundTransparency=1 I.BorderColor3=Color3.fromRGB(0,0,0)I.
BorderSizePixel=0 I.Size=UDim2.fromScale(1,1)local J=Instance.new'TextLabel'J.
Name='Title'J.FontFace=Font.new(an.interFont,Enum.FontWeight.SemiBold,Enum.
FontStyle.Normal)J.Text=au.Title J.TextColor3=Color3.fromRGB(255,255,255)J.
RichText=true J.TextSize=18 J.TextTransparency=0.1 J.TextTruncate=Enum.
TextTruncate.SplitWord J.TextXAlignment=Enum.TextXAlignment.Left J.
TextYAlignment=Enum.TextYAlignment.Top J.AutomaticSize=Enum.AutomaticSize.Y J.
BackgroundColor3=Color3.fromRGB(255,255,255)J.BackgroundTransparency=1 J.
BorderColor3=Color3.fromRGB(0,0,0)J.BorderSizePixel=0 J.Size=UDim2.new(1,-20,0,0
)J.Parent=I local K=Instance.new'TextLabel'K.Name='Subtitle'K.FontFace=Font.new(
an.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)K.RichText=true K.Text
=au.Subtitle K.RichText=true K.TextColor3=Color3.fromRGB(255,255,255)K.TextSize=
12 K.TextTransparency=0.7 K.TextTruncate=Enum.TextTruncate.SplitWord K.
TextXAlignment=Enum.TextXAlignment.Left K.TextYAlignment=Enum.TextYAlignment.Top
K.AutomaticSize=Enum.AutomaticSize.Y K.BackgroundColor3=Color3.fromRGB(255,255,
255)K.BackgroundTransparency=1 K.BorderColor3=Color3.fromRGB(0,0,0)K.
BorderSizePixel=0 K.LayoutOrder=1 K.Size=UDim2.new(1,-20,0,0)K.Parent=I local L=
Instance.new'UIListLayout'L.Name='TitleFrameUIListLayout'L.Padding=UDim.new(0,3)
L.SortOrder=Enum.SortOrder.LayoutOrder L.VerticalAlignment=Enum.
VerticalAlignment.Center L.Parent=I I.Parent=E E.Parent=C C.Parent=k local M=
Instance.new'Frame'M.Name='SidebarGroup'M.BackgroundColor3=Color3.fromRGB(255,
255,255)M.BackgroundTransparency=1 M.BorderColor3=Color3.fromRGB(0,0,0)M.
BorderSizePixel=0 M.Position=UDim2.fromOffset(0,91)M.Size=UDim2.new(1,0,1,-91)
local N=Instance.new'Frame'N.Name='UserInfo'N.AnchorPoint=Vector2.new(0,1)N.
BackgroundColor3=Color3.fromRGB(255,255,255)N.BackgroundTransparency=1 N.
BorderColor3=Color3.fromRGB(0,0,0)N.BorderSizePixel=0 N.Position=UDim2.
fromScale(0,1)N.Size=UDim2.new(1,0,0,107)local O=Instance.new'Frame'O.Name=
'InformationGroup'O.BackgroundColor3=Color3.fromRGB(255,255,255)O.
BackgroundTransparency=1 O.BorderColor3=Color3.fromRGB(0,0,0)O.BorderSizePixel=0
O.Size=UDim2.fromScale(1,1)local P=Instance.new'UIPadding'P.Name=
'InformationGroupUIPadding'P.PaddingBottom=UDim.new(0,17)P.PaddingLeft=UDim.new(
0,25)P.Parent=O local Q=Instance.new'UIListLayout'Q.Name=
'InformationGroupUIListLayout'Q.FillDirection=Enum.FillDirection.Horizontal Q.
SortOrder=Enum.SortOrder.LayoutOrder Q.VerticalAlignment=Enum.VerticalAlignment.
Center Q.Parent=O local R,S,T=aj.UserId,Enum.ThumbnailType.AvatarBust,Enum.
ThumbnailSize.Size48x48 local U,V=ah:GetUserThumbnailAsync(R,S,T)local W=
Instance.new'ImageLabel'W.Name='Headshot'W.BackgroundColor3=Color3.fromRGB(255,
255,255)W.BackgroundTransparency=1 W.BorderColor3=Color3.fromRGB(0,0,0)W.
BorderSizePixel=0 W.Size=UDim2.fromOffset(32,32)W.Image=(V and U)or
'rbxassetid://0'local X=Instance.new'UICorner'X.Name='UICorner'X.CornerRadius=
UDim.new(1,0)X.Parent=W local Y=Instance.new'UIStroke'Y.Name='BaseUIStroke'Y.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border Y.Color=Color3.fromRGB(255,255,255)Y
.Transparency=0.9 Y.Parent=W W.Parent=O local Z=Instance.new'Frame'Z.Name=
'UserAndDisplayFrame'Z.BackgroundColor3=Color3.fromRGB(255,255,255)Z.
BackgroundTransparency=1 Z.BorderColor3=Color3.fromRGB(0,0,0)Z.BorderSizePixel=0
Z.LayoutOrder=1 Z.Size=UDim2.new(1,-42,0,32)local _=Instance.new'TextLabel'_.
Name='DisplayName'_.FontFace=Font.new(an.interFont,Enum.FontWeight.SemiBold,Enum
.FontStyle.Normal)_.Text=aj.DisplayName _.TextColor3=Color3.fromRGB(255,255,255)
_.TextSize=13 _.TextTransparency=0.1 _.TextTruncate=Enum.TextTruncate.SplitWord
_.TextXAlignment=Enum.TextXAlignment.Left _.TextYAlignment=Enum.TextYAlignment.
Top _.AutomaticSize=Enum.AutomaticSize.XY _.BackgroundColor3=Color3.fromRGB(255,
255,255)_.BackgroundTransparency=1 _.BorderColor3=Color3.fromRGB(0,0,0)_.
BorderSizePixel=0 _.Parent=Z _.Size=UDim2.fromScale(1,0)local aw=Instance.new
'UIPadding'aw.Name='UserAndDisplayFrameUIPadding'aw.PaddingLeft=UDim.new(0,8)aw.
PaddingTop=UDim.new(0,3)aw.Parent=Z local ax=Instance.new'UIListLayout'ax.Name=
'UserAndDisplayFrameUIListLayout'ax.Padding=UDim.new(0,1)ax.SortOrder=Enum.
SortOrder.LayoutOrder ax.Parent=Z local ay=Instance.new'TextLabel'ay.Name=
'Username'ay.FontFace=Font.new(an.interFont,Enum.FontWeight.SemiBold,Enum.
FontStyle.Normal)ay.Text='@'..aj.Name ay.TextColor3=Color3.fromRGB(255,255,255)
ay.TextSize=12 ay.TextTransparency=0.7 ay.TextTruncate=Enum.TextTruncate.
SplitWord ay.TextXAlignment=Enum.TextXAlignment.Left ay.TextYAlignment=Enum.
TextYAlignment.Top ay.AutomaticSize=Enum.AutomaticSize.XY ay.BackgroundColor3=
Color3.fromRGB(255,255,255)ay.BackgroundTransparency=1 ay.BorderColor3=Color3.
fromRGB(0,0,0)ay.BorderSizePixel=0 ay.LayoutOrder=1 ay.Parent=Z ay.Size=UDim2.
fromScale(1,0)Z.Parent=O O.Parent=N local az=Instance.new'UIPadding'az.Name=
'UserInfoUIPadding'az.PaddingLeft=UDim.new(0,10)az.PaddingRight=UDim.new(0,10)az
.Parent=N N.Parent=M local aA=Instance.new'UIPadding'aA.Name=
'SidebarGroupUIPadding'aA.PaddingLeft=UDim.new(0,10)aA.PaddingRight=UDim.new(0,
10)aA.PaddingTop=UDim.new(0,31)aA.Parent=M local aB=Instance.new'Frame'aB.Name=
'TabSwitchers'aB.BackgroundColor3=Color3.fromRGB(255,255,255)aB.
BackgroundTransparency=1 aB.BorderColor3=Color3.fromRGB(0,0,0)aB.BorderSizePixel
=0 aB.Size=UDim2.new(1,0,1,-107)local aC=Instance.new'ScrollingFrame'aC.Name=
'TabSwitchersScrollingFrame'aC.AutomaticCanvasSize=Enum.AutomaticSize.Y aC.
BottomImage=''aC.CanvasSize=UDim2.new()aC.ScrollBarImageTransparency=0.8 aC.
ScrollBarThickness=1 aC.TopImage=''aC.BackgroundColor3=Color3.fromRGB(255,255,
255)aC.BackgroundTransparency=1 aC.BorderColor3=Color3.fromRGB(0,0,0)aC.
BorderSizePixel=0 aC.Size=UDim2.fromScale(1,1)local aD=Instance.new
'UIListLayout'aD.Name='TabSwitchersScrollingFrameUIListLayout'aD.Padding=UDim.
new(0,17)aD.SortOrder=Enum.SortOrder.LayoutOrder aD.Parent=aC local aE=Instance.
new'UIPadding'aE.Name='TabSwitchersScrollingFrameUIPadding'aE.PaddingTop=UDim.
new(0,2)aE.Parent=aC aC.Parent=aB aB.Parent=M M.Parent=k k.Parent=f local aF=
Instance.new'Frame'aF.Name='Content'aF.AnchorPoint=Vector2.new(1,0)aF.
BackgroundColor3=Color3.fromRGB(255,255,255)aF.BackgroundTransparency=1 aF.
BorderColor3=Color3.fromRGB(0,0,0)aF.BorderSizePixel=0 aF.Position=UDim2.
fromScale(1,4.69e-8)aF.Size=UDim2.new(0,(f.AbsoluteSize.X-k.AbsoluteSize.X),1,0)
local aG,aH,aI,aJ,aK,aL=false,k.AbsoluteSize.X,20,107 local aM,aN=f.AbsoluteSize
.X-aJ,{DefaultTransparency=0.9,HoverTransparency=0.85,EasingStyle=Enum.
EasingStyle.Sine}local aO=function(aO)at(l,TweenInfo.new(0.2,aN.EasingStyle),{
BackgroundTransparency=aO=='Idle'and aN.DefaultTransparency or aN.
HoverTransparency}):Play()end m.MouseEnter:Connect(function()aO'Hover'end)m.
MouseLeave:Connect(function()aO'Idle'end)m.MouseButton1Down:Connect(function()aG
=true aK=af:GetMouseLocation().X aL=k.AbsoluteSize.X end)af.InputEnded:Connect(
function(aP)if aP.UserInputType==Enum.UserInputType.MouseButton1 then aG=false
end end)af.InputChanged:Connect(function(aP)if aG and aP.UserInputType==Enum.
UserInputType.MouseMovement then local aQ=af:GetMouseLocation().X-aK local aR=aL
+aQ if math.abs(aR-aH)<aI then aR=aH else aR=math.clamp(aR,aJ,aM)end k.Size=
UDim2.new(0,aR,1,0)aF.Size=UDim2.new(0,f.AbsoluteSize.X-aR,1,0)end end)local aP=
Instance.new'Frame'aP.Name='Topbar'aP.BackgroundColor3=Color3.fromRGB(255,255,
255)aP.BackgroundTransparency=1 aP.BorderColor3=Color3.fromRGB(0,0,0)aP.
BorderSizePixel=0 aP.Size=UDim2.new(1,0,0,63)local aQ=Instance.new'Frame'aQ.Name
='Divider'aQ.AnchorPoint=Vector2.new(0,1)aQ.BackgroundColor3=Color3.fromRGB(255,
255,255)aQ.BackgroundTransparency=0.9 aQ.BorderColor3=Color3.fromRGB(0,0,0)aQ.
BorderSizePixel=0 aQ.Position=UDim2.fromScale(0,1)aQ.Size=UDim2.new(1,0,0,1)aQ.
Parent=aP local aR=Instance.new'Frame'aR.Name='Elements'aR.BackgroundColor3=
Color3.fromRGB(255,255,255)aR.BackgroundTransparency=1 aR.BorderColor3=Color3.
fromRGB(0,0,0)aR.BorderSizePixel=0 aR.Size=UDim2.fromScale(1,1)local aS=Instance
.new'UIPadding'aS.Name='UIPadding'aS.PaddingLeft=UDim.new(0,20)aS.PaddingRight=
UDim.new(0,20)aS.Parent=aR local aT=Instance.new'ImageButton'aT.Name='MoveIcon'
aT.Image=an.transform aT.ImageTransparency=0.7 aT.AnchorPoint=Vector2.new(1,0.5)
aT.BackgroundColor3=Color3.fromRGB(255,255,255)aT.BackgroundTransparency=1 aT.
BorderColor3=Color3.fromRGB(0,0,0)aT.BorderSizePixel=0 aT.Position=UDim2.
fromScale(1,0.5)aT.Size=UDim2.fromOffset(15,15)aT.Parent=aR aT.Visible=not au.
DragStyle or au.DragStyle==1 local aU=Instance.new'TextButton'aU.Name='Interact'
aU.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'aU.Text=''aU.
TextColor3=Color3.fromRGB(0,0,0)aU.TextSize=14 aU.AnchorPoint=Vector2.new(0.5,
0.5)aU.BackgroundColor3=Color3.fromRGB(255,255,255)aU.BackgroundTransparency=1
aU.BorderColor3=Color3.fromRGB(0,0,0)aU.BorderSizePixel=0 aU.Position=UDim2.
fromScale(0.5,0.5)aU.Size=UDim2.fromOffset(40,40)aU.Parent=aT local aV=function(
aV)if aV=='Default'then at(aT,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
ImageTransparency=0.7}):Play()elseif aV=='Hover'then at(aT,TweenInfo.new(0.2,
Enum.EasingStyle.Sine),{ImageTransparency=0.4}):Play()end end aU.MouseEnter:
Connect(function()aV'Hover'end)aU.MouseLeave:Connect(function()aV'Default'end)
local aW,aX,aY,aZ=false local a_,a0,a1=function(a_)local a0=a_.Position-aY f.
Position=UDim2.new(aZ.X.Scale,aZ.X.Offset+a0.X,aZ.Y.Scale,aZ.Y.Offset+a0.Y)end,
function(a_)if a_.UserInputType==Enum.UserInputType.MouseButton1 or a_.
UserInputType==Enum.UserInputType.Touch then aW=true aY=a_.Position aZ=f.
Position a_.Changed:Connect(function()if a_.UserInputState==Enum.UserInputState.
End then aW=false end end)end end,function(a_)if aW and(a_.UserInputType==Enum.
UserInputType.MouseMovement or a_.UserInputType==Enum.UserInputType.Touch)then
aX=a_ end end if not au.DragStyle or au.DragStyle==1 then aU.InputBegan:Connect(
function(a2)if a2.UserInputType==Enum.UserInputType.MouseButton1 or a2.
UserInputType==Enum.UserInputType.Touch then a0(a2)end end)aU.InputChanged:
Connect(a1)af.InputChanged:Connect(function(a2)if a2==aX and aW then a_(a2)end
end)aU.InputEnded:Connect(function(a2)if a2.UserInputType==Enum.UserInputType.
MouseButton1 or a2.UserInputType==Enum.UserInputType.Touch then aW=false end end
)elseif au.DragStyle==2 then f.InputBegan:Connect(function(a2)if a2.
UserInputType==Enum.UserInputType.MouseButton1 or a2.UserInputType==Enum.
UserInputType.Touch then a0(a2)end end)f.InputChanged:Connect(a1)af.InputChanged
:Connect(function(a2)if a2==aX and aW then a_(a2)end end)f.InputEnded:Connect(
function(a2)if a2.UserInputType==Enum.UserInputType.MouseButton1 or a2.
UserInputType==Enum.UserInputType.Touch then aW=false end end)end local a2=
Instance.new'TextLabel'a2.Name='CurrentTab'a2.FontFace=Font.new(an.interFont)a2.
RichText=true a2.Text=''a2.RichText=true a2.TextColor3=Color3.fromRGB(255,255,
255)a2.TextSize=15 a2.TextTransparency=0.5 a2.TextTruncate=Enum.TextTruncate.
SplitWord a2.TextXAlignment=Enum.TextXAlignment.Left a2.TextYAlignment=Enum.
TextYAlignment.Top a2.AnchorPoint=Vector2.new(0,0.5)a2.AutomaticSize=Enum.
AutomaticSize.Y a2.BackgroundColor3=Color3.fromRGB(255,255,255)a2.
BackgroundTransparency=1 a2.BorderColor3=Color3.fromRGB(0,0,0)a2.BorderSizePixel
=0 a2.Position=UDim2.fromScale(0,0.5)a2.Size=UDim2.fromScale(0.9,0)a2.Parent=aR
aR.Parent=aP aP.Parent=aF aF.Parent=f local a3=Instance.new'Frame'a3.Name=
'GlobalSettings'a3.AutomaticSize=Enum.AutomaticSize.XY a3.BackgroundColor3=
Color3.fromRGB(15,15,15)a3.BorderColor3=Color3.fromRGB(0,0,0)a3.BorderSizePixel=
0 a3.Position=UDim2.fromScale(0.298,0.104)local a4=Instance.new'UIStroke'a4.Name
='GlobalSettingsUIStroke'a4.ApplyStrokeMode=Enum.ApplyStrokeMode.Border a4.Color
=Color3.fromRGB(255,255,255)a4.Transparency=0.9 a4.Parent=a3 local a5=Instance.
new'UICorner'a5.Name='GlobalSettingsUICorner'a5.CornerRadius=UDim.new(0,10)a5.
Parent=a3 local a6=Instance.new'UIPadding'a6.Name='GlobalSettingsUIPadding'a6.
PaddingBottom=UDim.new(0,10)a6.PaddingTop=UDim.new(0,10)a6.Parent=a3 local a7=
Instance.new'UIListLayout'a7.Name='GlobalSettingsUIListLayout'a7.Padding=UDim.
new(0,5)a7.SortOrder=Enum.SortOrder.LayoutOrder a7.Parent=a3 local a8=Instance.
new'UIScale'a8.Name='GlobalSettingsUIScale'a8.Scale=1e-7 a8.Parent=a3 a3.Parent=
f f.Parent=b function av:UpdateTitle(a9)J.Text=a9 end function av:UpdateSubtitle
(a9)K.Text=a9 end local a9,ba=a8.Scale==1 and true or false local bb=function()
if not a9 then local bb=at(a8,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),{Scale=1})bb:Play()bb.Completed:Wait()a9=true elseif
a9 then local bb=at(a8,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=0})bb:Play()bb.Completed:Wait()a9=false end end G.
MouseButton1Click:Connect(function()if not aq then return end bb()end)a3.
MouseEnter:Connect(function()ba=true end)a3.MouseLeave:Connect(function()ba=
false end)af.InputEnded:Connect(function(bc)if bc.UserInputType==Enum.
UserInputType.MouseButton1 and a9 and not ba then bb()end end)local bc,bd,be,bf,
bg=f,ad,workspace.CurrentCamera,'Glass',{}local bh,bi=(bd:GenerateGUID(true))for
bj,bk in pairs(ag:GetChildren())do if not bk:IsA'DepthOfFieldEffect'and bk:
HasTag'.'then bi=Instance.new'DepthOfFieldEffect'bi.FarIntensity=0 bi.
FocusDistance=51.6 bi.InFocusRadius=50 bi.NearIntensity=1 bi.Name=bd:
GenerateGUID(true)bi:AddTag'.'elseif bk:IsA'DepthOfFieldEffect'and bk:HasTag'.'
then bi=bk end end if not bi then bi=Instance.new'DepthOfFieldEffect'bi.
FarIntensity=0 bi.FocusDistance=51.6 bi.InFocusRadius=50 bi.NearIntensity=1 bi.
Name=bd:GenerateGUID(true)bi:AddTag'.'end local bj=Instance.new'Frame'bj.Parent=
bc bj.Size=UDim2.new(0.97,0,0.97,0)bj.Position=UDim2.new(0.5,0,0.5,0)bj.
AnchorPoint=Vector2.new(0.5,0.5)bj.BackgroundTransparency=1 bj.Name=bd:
GenerateGUID(true)do local bk=function(bk)return bk==bk end local bl=bk(be:
ScreenPointToRay(0,0).Origin.x)while not bl do ac.RenderStepped:Wait()bl=bk(be:
ScreenPointToRay(0,0).Origin.x)end end local bk do local bl,bm,bn,bo,bp=math.
acos,math.max,math.pi,math.sqrt,0.2 local bq=function(bq,br,bs,bt,bu)local bv,bw
,bx=(bq-br).magnitude,(br-bs).magnitude,(bs-bq).magnitude local by,bz,bA,bB=(bm(
bv,bw,bx))if bv==by then bz,bA,bB=bq,br,bs elseif bw==by then bz,bA,bB=br,bs,bq
elseif bx==by then bz,bA,bB=bs,bq,br end local bC=((bA-bz).x*(bB-bz).x+(bA-bz).y
*(bB-bz).y+(bA-bz).z*(bB-bz).z)/(bz-bA).magnitude local bD,bE,bF,bG=bo((bB-bz).
magnitude^2-bC*bC),(bz-bA).magnitude-bC,CFrame.new(bA,bz),CFrame.Angles(bn/2,0,0
)local bH=bF local bI,bJ=(bH*bG).lookVector,bz+CFrame.new(bz,bA).lookVector*bC
local bK=CFrame.new(bJ,bB).lookVector local bL=bI.x*bK.x+bI.y*bK.y+bI.z*bK.z
local bM=CFrame.Angles(0,0,bl(bL))bH=bH*bM if((bH*bG).lookVector-bK).magnitude>
0.01 then bH=bH*CFrame.Angles(0,0,-2*bl(bL))end bH=bH*CFrame.new(0,bD/2,-(bE+bC/
2))local bN=bF*bM*CFrame.Angles(0,bn,0)if((bN*bG).lookVector-bK).magnitude>0.01
then bN=bN*CFrame.Angles(0,0,2*bl(bL))end bN=bN*CFrame.new(0,bD/2,bE/2)if not bt
then bt=Instance.new'Part'bt.FormFactor='Custom'bt.TopSurface=0 bt.BottomSurface
=0 bt.Anchored=true bt.CanCollide=false bt.CastShadow=false bt.Material=bf bt.
Size=Vector3.new(bp,bp,bp)bt.Name=bd:GenerateGUID(true)local bO=Instance.new(
'SpecialMesh',bt)bO.MeshType=2 bO.Name=bh end bt[bh].Scale=Vector3.new(0,bD/bp,
bC/bp)bt.CFrame=bH if not bu then bu=bt:clone()end bu[bh].Scale=Vector3.new(0,bD
/bp,bE/bp)bu.CFrame=bN return bt,bu end function bk(br,bs,bt,bu,bv)bv[1],bv[2]=
bq(br,bs,bt,bv[1],bv[2])bv[3],bv[4]=bq(bt,bs,bu,bv[3],bv[4])end end if bg[bj]
then return bg[bj].parts end local bl,bm={},{}do local function bn(bo)if bo:IsA
'GuiObject'then bm[#bm+1]=bo bn(bo.Parent)end end bn(bj)end local bn=function(bn
)while bn do if bn:IsA'GuiObject'then if not bn.Visible then return false end
elseif bn:IsA'ScreenGui'then if not bn.Enabled then return false end break end
bn=bn.Parent end return true end local bo=function(bo)if not bn(bj)or not ap or
am then for bp,bq in pairs(bl)do bq.Parent=nil bi.Enabled=false bi.Parent=nil
end return end if not bi.Parent then bi.Parent=ag end bi.Enabled=true local bp,
bq,br,bs={Transparency=0.98,BrickColor=BrickColor.new'Institutional white'},1-
0.05*bj.ZIndex,bj.AbsolutePosition,bj.AbsolutePosition+bj.AbsoluteSize local bt,
bu=Vector2.new(bs.x,br.y),Vector2.new(br.x,bs.y)do local bv=0 for bw,bx in
ipairs(bm)do bv=bv+bx.Rotation end if bv~=0 and bv%180~=0 then local bw,bx,by=br
:lerp(bs,0.5),math.sin(math.rad(bv)),math.cos(math.rad(bv))br=Vector2.new(by*(br
.x-bw.x)-bx*(br.y-bw.y),bx*(br.x-bw.x)+by*(br.y-bw.y))+bw bt=Vector2.new(by*(bt.
x-bw.x)-bx*(bt.y-bw.y),bx*(bt.x-bw.x)+by*(bt.y-bw.y))+bw bu=Vector2.new(by*(bu.x
-bw.x)-bx*(bu.y-bw.y),bx*(bu.x-bw.x)+by*(bu.y-bw.y))+bw bs=Vector2.new(by*(bs.x-
bw.x)-bx*(bs.y-bw.y),bx*(bs.x-bw.x)+by*(bs.y-bw.y))+bw end end bk(be:
ScreenPointToRay(br.x,br.y,bq).Origin,be:ScreenPointToRay(bt.x,bt.y,bq).Origin,
be:ScreenPointToRay(bu.x,bu.y,bq).Origin,be:ScreenPointToRay(bs.x,bs.y,bq).
Origin,bl)if bo then for bv,bw in pairs(bl)do bw.Parent=be end for bv,bw in
pairs(bp)do for bx,by in pairs(bl)do by[bv]=bw end end end end bo(true)ac.
RenderStepped:Connect(bo)function av:GlobalSetting(bp)aq=true local bq,br={},
Instance.new'TextButton'br.Name='GlobalSetting'br.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'br.Text=''br.TextColor3=Color3.
fromRGB(0,0,0)br.TextSize=14 br.BackgroundColor3=Color3.fromRGB(255,255,255)br.
BackgroundTransparency=1 br.BorderColor3=Color3.fromRGB(0,0,0)br.BorderSizePixel
=0 br.Size=UDim2.fromOffset(200,30)local bs=Instance.new'UIPadding'bs.Name=
'GlobalSettingToggleUIPadding'bs.PaddingLeft=UDim.new(0,15)bs.Parent=br local bt
=Instance.new'TextLabel'bt.Name='SettingName'bt.FontFace=Font.new(an.interFont)
bt.Text=bp.Name bt.RichText=true bt.TextColor3=Color3.fromRGB(255,255,255)bt.
TextSize=13 bt.TextTransparency=0.5 bt.TextTruncate=Enum.TextTruncate.SplitWord
bt.TextXAlignment=Enum.TextXAlignment.Left bt.TextYAlignment=Enum.TextYAlignment
.Top bt.AnchorPoint=Vector2.new(0,0.5)bt.AutomaticSize=Enum.AutomaticSize.Y bt.
BackgroundColor3=Color3.fromRGB(255,255,255)bt.BackgroundTransparency=1 bt.
BorderColor3=Color3.fromRGB(0,0,0)bt.BorderSizePixel=0 bt.Position=UDim2.
fromScale(1.3e-7,0.5)bt.Size=UDim2.new(1,-40,0,0)bt.Parent=br local bu=Instance.
new'UIListLayout'bu.Name='GlobalSettingToggleUIListLayout'bu.Padding=UDim.new(0,
10)bu.FillDirection=Enum.FillDirection.Horizontal bu.SortOrder=Enum.SortOrder.
LayoutOrder bu.VerticalAlignment=Enum.VerticalAlignment.Center bu.Parent=br
local bv=Instance.new'TextLabel'bv.Name='Checkmark'bv.FontFace=Font.new(an.
interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)bv.Text='\u{2713}'bv.
TextColor3=Color3.fromRGB(255,255,255)bv.TextSize=13 bv.TextTransparency=1 bv.
TextXAlignment=Enum.TextXAlignment.Left bv.TextYAlignment=Enum.TextYAlignment.
Top bv.AnchorPoint=Vector2.new(0,0.5)bv.AutomaticSize=Enum.AutomaticSize.Y bv.
BackgroundColor3=Color3.fromRGB(255,255,255)bv.BackgroundTransparency=1 bv.
BorderColor3=Color3.fromRGB(0,0,0)bv.BorderSizePixel=0 bv.LayoutOrder=-1 bv.
Position=UDim2.fromScale(1.3e-7,0.5)bv.Size=UDim2.fromOffset(-10,0)bv.Parent=br
br.Parent=a3 local bw={duration=0.2,easingStyle=Enum.EasingStyle.Quint,
transparencyIn=0.2,transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-
bu.Padding.Offset,waitTime=1}local bx={checkIn=at(bv,TweenInfo.new(bw.duration,
bw.easingStyle),{Size=UDim2.new(bv.Size.X.Scale,bw.checkSizeIncrease,bv.Size.Y.
Scale,bv.Size.Y.Offset)}),checkOut=at(bv,TweenInfo.new(bw.duration,bw.
easingStyle),{Size=UDim2.new(bv.Size.X.Scale,bw.checkSizeDecrease,bv.Size.Y.
Scale,bv.Size.Y.Offset)}),nameIn=at(bt,TweenInfo.new(bw.duration,bw.easingStyle)
,{TextTransparency=bw.transparencyIn}),nameOut=at(bt,TweenInfo.new(bw.duration,
bw.easingStyle),{TextTransparency=bw.transparencyOut})}local by,bz=function(by)
if not by then bx.checkOut:Play()bx.nameOut:Play()bv:GetPropertyChangedSignal
'AbsoluteSize':Connect(function()if bv.AbsoluteSize.X<=0 then bv.
TextTransparency=1 end end)else bx.checkIn:Play()bx.nameIn:Play()bv:
GetPropertyChangedSignal'AbsoluteSize':Connect(function()if bv.AbsoluteSize.X>0
then bv.TextTransparency=0 end end)end end,bp.Default by(bz)br.MouseButton1Click
:Connect(function()bz=not bz by(bz)task.spawn(function()if bp.Callback then bp.
Callback(bz)end end)end)function bq:UpdateName(bA)bt.Text=bA end function bq:
UpdateState(bA)by(bA)bz=bA end return bq end function av:TabGroup()local bp,bq={
},Instance.new'Frame'bq.Name='Section'bq.AutomaticSize=Enum.AutomaticSize.Y bq.
BackgroundColor3=Color3.fromRGB(255,255,255)bq.BackgroundTransparency=1 bq.
BorderColor3=Color3.fromRGB(0,0,0)bq.BorderSizePixel=0 bq.Size=UDim2.fromScale(1
,0)local br=Instance.new'Frame'br.Name='Divider'br.AnchorPoint=Vector2.new(0.5,1
)br.BackgroundColor3=Color3.fromRGB(255,255,255)br.BackgroundTransparency=0.9 br
.BorderColor3=Color3.fromRGB(0,0,0)br.BorderSizePixel=0 br.Position=UDim2.
fromScale(0.5,1)br.Size=UDim2.new(1,-21,0,1)br.Parent=bq local bs=Instance.new
'Frame'bs.Name='SectionTabSwitchers'bs.BackgroundColor3=Color3.fromRGB(255,255,
255)bs.BackgroundTransparency=1 bs.BorderColor3=Color3.fromRGB(0,0,0)bs.
BorderSizePixel=0 bs.Size=UDim2.fromScale(1,1)local bt=Instance.new
'UIListLayout'bt.Name='UIListLayout'bt.Padding=UDim.new(0,15)bt.
HorizontalAlignment=Enum.HorizontalAlignment.Center bt.SortOrder=Enum.SortOrder.
LayoutOrder bt.Parent=bs local bu=Instance.new'UIPadding'bu.Name='UIPadding'bu.
PaddingBottom=UDim.new(0,15)bu.Parent=bs bs.Parent=bq bq.Parent=aC function bp:
Tab(bv)local bw,bx={Settings=bv},Instance.new'TextButton'bx.Name='TabSwitcher'bx
.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'bx.Text=''bx.
TextColor3=Color3.fromRGB(0,0,0)bx.TextSize=14 bx.AutoButtonColor=false bx.
AnchorPoint=Vector2.new(0.5,0)bx.BackgroundColor3=Color3.fromRGB(255,255,255)bx.
BackgroundTransparency=1 bx.BorderColor3=Color3.fromRGB(0,0,0)bx.BorderSizePixel
=0 bx.Position=UDim2.fromScale(0.5,0)bx.Size=UDim2.new(1,-21,0,40)al+=1 bx.
LayoutOrder=al local by=Instance.new'UICorner'by.Name='TabSwitcherUICorner'by.
Parent=bx local bz=Instance.new'UIStroke'bz.Name='TabSwitcherUIStroke'bz.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border bz.Color=Color3.fromRGB(255,255,255)
bz.Transparency=1 bz.Parent=bx local bA=Instance.new'UIListLayout'bA.Name=
'TabSwitcherUIListLayout'bA.Padding=UDim.new(0,9)bA.FillDirection=Enum.
FillDirection.Horizontal bA.SortOrder=Enum.SortOrder.LayoutOrder bA.
VerticalAlignment=Enum.VerticalAlignment.Center bA.Parent=bx local bB if bv.
Image then bB=Instance.new'ImageLabel'bB.Name='TabImage'bB.Image=bv.Image bB.
ImageTransparency=0.5 bB.BackgroundColor3=Color3.fromRGB(255,255,255)bB.
BackgroundTransparency=1 bB.BorderColor3=Color3.fromRGB(0,0,0)bB.BorderSizePixel
=0 bB.Size=UDim2.fromOffset(18,18)bB.Parent=bx end local bC=Instance.new
'TextLabel'bC.Name='TabSwitcherName'bC.FontFace=Font.new(an.interFont,Enum.
FontWeight.Medium,Enum.FontStyle.Normal)bC.Text=bv.Name bC.RichText=true bC.
TextColor3=Color3.fromRGB(255,255,255)bC.TextSize=16 bC.TextTransparency=0.5 bC.
TextTruncate=Enum.TextTruncate.SplitWord bC.TextXAlignment=Enum.TextXAlignment.
Left bC.TextYAlignment=Enum.TextYAlignment.Top bC.AutomaticSize=Enum.
AutomaticSize.Y bC.BackgroundColor3=Color3.fromRGB(255,255,255)bC.
BackgroundTransparency=1 bC.BorderColor3=Color3.fromRGB(0,0,0)bC.BorderSizePixel
=0 bC.Size=UDim2.fromScale(1,0)bC.Parent=bx bC.LayoutOrder=1 local bD=Instance.
new'UIPadding'bD.Name='TabSwitcherUIPadding'bD.PaddingLeft=UDim.new(0,24)bD.
PaddingRight=UDim.new(0,35)bD.PaddingTop=UDim.new(0,1)bD.Parent=bx bx.Parent=bs
local bE=Instance.new'Frame'bE.Name='Elements'bE.BackgroundColor3=Color3.
fromRGB(255,255,255)bE.BackgroundTransparency=1 bE.BorderColor3=Color3.fromRGB(0
,0,0)bE.BorderSizePixel=0 bE.Position=UDim2.fromOffset(0,63)bE.Size=UDim2.new(1,
0,1,-63)bE.ClipsDescendants=true local bF=Instance.new'UIPadding'bF.Name=
'ElementsUIPadding'bF.PaddingRight=UDim.new(0,5)bF.PaddingTop=UDim.new(0,10)bF.
PaddingBottom=UDim.new(0,10)bF.Parent=bE local bG=Instance.new'ScrollingFrame'bG
.Name='ElementsScrolling'bG.AutomaticCanvasSize=Enum.AutomaticSize.Y bG.
BottomImage=''bG.CanvasSize=UDim2.new()bG.ScrollBarImageTransparency=0.5 bG.
ScrollBarThickness=1 bG.TopImage=''bG.BackgroundColor3=Color3.fromRGB(255,255,
255)bG.BackgroundTransparency=1 bG.BorderColor3=Color3.fromRGB(0,0,0)bG.
BorderSizePixel=0 bG.Size=UDim2.fromScale(1,1)bG.ClipsDescendants=false local bH
=Instance.new'UIPadding'bH.Name='ElementsScrollingUIPadding'bH.PaddingBottom=
UDim.new(0,5)bH.PaddingLeft=UDim.new(0,11)bH.PaddingRight=UDim.new(0,3)bH.
PaddingTop=UDim.new(0,5)bH.Parent=bG local bI=Instance.new'UIListLayout'bI.Name=
'ElementsScrollingUIListLayout'bI.Padding=UDim.new(0,15)bI.FillDirection=Enum.
FillDirection.Horizontal bI.SortOrder=Enum.SortOrder.LayoutOrder bI.Parent=bG
local bJ=Instance.new'Frame'bJ.Name='Left'bJ.AutomaticSize=Enum.AutomaticSize.Y
bJ.BackgroundColor3=Color3.fromRGB(0,0,0)bJ.BackgroundTransparency=1 bJ.
BorderColor3=Color3.fromRGB(0,0,0)bJ.BorderSizePixel=0 bJ.Position=UDim2.
fromScale(0.512,0)bJ.Size=UDim2.new(0.5,-10,0,0)local bK=Instance.new
'UIListLayout'bK.Name='LeftUIListLayout'bK.Padding=UDim.new(0,15)bK.SortOrder=
Enum.SortOrder.LayoutOrder bK.Parent=bJ bJ.Parent=bG local bL=Instance.new
'Frame'bL.Name='Right'bL.AutomaticSize=Enum.AutomaticSize.Y bL.BackgroundColor3=
Color3.fromRGB(0,0,0)bL.BackgroundTransparency=1 bL.BorderColor3=Color3.fromRGB(
0,0,0)bL.BorderSizePixel=0 bL.LayoutOrder=1 bL.Position=UDim2.fromScale(0.512,0)
bL.Size=UDim2.new(0.5,-10,0,0)local bM=Instance.new'UIListLayout'bM.Name=
'RightUIListLayout'bM.Padding=UDim.new(0,15)bM.SortOrder=Enum.SortOrder.
LayoutOrder bM.Parent=bL bL.Parent=bG bG.Parent=bE function bw:Section(bN)local
bO,bP={},Instance.new'Frame'bP.Name='Section'bP.AutomaticSize=Enum.AutomaticSize
.Y bP.BackgroundColor3=Color3.fromRGB(255,255,255)bP.BackgroundTransparency=0.98
bP.BorderColor3=Color3.fromRGB(0,0,0)bP.BorderSizePixel=0 bP.Position=UDim2.
fromScale(0,6.78e-8)bP.Size=UDim2.fromScale(1,0)bP.ClipsDescendants=true bP.
Parent=bN.Side=='Left'and bJ or bL local bQ=Instance.new'UICorner'bQ.Name=
'SectionUICorner'bQ.Parent=bP local bR=Instance.new'UIStroke'bR.Name=
'SectionUIStroke'bR.ApplyStrokeMode=Enum.ApplyStrokeMode.Border bR.Color=Color3.
fromRGB(255,255,255)bR.Transparency=0.95 bR.Parent=bP local bS=Instance.new
'UIListLayout'bS.Name='SectionUIListLayout'bS.Padding=UDim.new(0,10)bS.SortOrder
=Enum.SortOrder.LayoutOrder bS.Parent=bP local bT=Instance.new'UIPadding'bT.Name
='SectionUIPadding'bT.PaddingBottom=UDim.new(0,20)bT.PaddingLeft=UDim.new(0,20)
bT.PaddingRight=UDim.new(0,18)bT.PaddingTop=UDim.new(0,22)bT.Parent=bP function
bO:Button(bU,bV)local bW,bX={Settings=bU},Instance.new'Frame'bX.Name='Button'bX.
AutomaticSize=Enum.AutomaticSize.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.
BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel
=0 bX.Size=UDim2.new(1,0,0,38)bX.Parent=bP local bY=Instance.new'TextButton'bY.
Name='ButtonInteract'bY.FontFace=Font.new(an.interFont)bY.RichText=true bY.
TextColor3=Color3.fromRGB(255,255,255)bY.TextSize=13 bY.TextTransparency=0.5 bY.
TextTruncate=Enum.TextTruncate.AtEnd bY.TextXAlignment=Enum.TextXAlignment.Left
bY.BackgroundColor3=Color3.fromRGB(255,255,255)bY.BackgroundTransparency=1 bY.
BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Size=UDim2.fromScale(1
,1)bY.Parent=bX bY.Text=bW.Settings.Name local bZ=Instance.new'ImageLabel'bZ.
Name='ButtonImage'bZ.Image=an.buttonImage bZ.ImageTransparency=0.5 bZ.
AnchorPoint=Vector2.new(1,0.5)bZ.BackgroundColor3=Color3.fromRGB(255,255,255)bZ.
BackgroundTransparency=1 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel
=0 bZ.Position=UDim2.fromScale(1,0.5)bZ.Size=UDim2.fromOffset(15,15)bZ.Parent=bX
local b_={DefaultTransparency=0.5,HoverTransparency=0.3,EasingStyle=Enum.
EasingStyle.Sine}local b0,b1=function(b0)if b0=='Idle'then at(bY,TweenInfo.new(
0.2,b_.EasingStyle),{TextTransparency=b_.DefaultTransparency}):Play()at(bZ,
TweenInfo.new(0.2,b_.EasingStyle),{ImageTransparency=b_.DefaultTransparency}):
Play()elseif b0=='Hover'then at(bY,TweenInfo.new(0.2,b_.EasingStyle),{
TextTransparency=b_.HoverTransparency}):Play()at(bZ,TweenInfo.new(0.2,b_.
EasingStyle),{ImageTransparency=b_.HoverTransparency}):Play()end end,function()
if bW.Settings.Callback then bW.Settings.Callback()end end bY.MouseEnter:
Connect(function()b0'Hover'end)bY.MouseLeave:Connect(function()b0'Idle'end)bY.
MouseButton1Click:Connect(b1)function bW:UpdateName(b2)bY.Text=b2 end function
bW:SetVisibility(b2)bX.Visible=b2 end if bV then aa.Options[bV]=bW end return bW
end function bO:Toggle(bU,bV)local bW,bX={Settings=bU,IgnoreConfig=false,Class=
'Toggle'},Instance.new'Frame'bX.Name='Toggle'bX.AutomaticSize=Enum.AutomaticSize
.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.BackgroundTransparency=1 bX.
BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel=0 bX.Size=UDim2.new(1,0,0,
38)bX.Parent=bP local bY=Instance.new'TextLabel'bY.Name='ToggleName'bY.FontFace=
Font.new(an.interFont)bY.Text=bW.Settings.Name bY.RichText=true bY.TextColor3=
Color3.fromRGB(255,255,255)bY.TextSize=13 bY.TextTransparency=0.5 bY.
TextTruncate=Enum.TextTruncate.AtEnd bY.TextXAlignment=Enum.TextXAlignment.Left
bY.TextYAlignment=Enum.TextYAlignment.Top bY.AnchorPoint=Vector2.new(0,0.5)bY.
AutomaticSize=Enum.AutomaticSize.Y bY.BackgroundColor3=Color3.fromRGB(255,255,
255)bY.BackgroundTransparency=1 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.
BorderSizePixel=0 bY.Position=UDim2.fromScale(0,0.5)bY.Size=UDim2.new(1,-50,0,0)
bY.Parent=bX local bZ=Instance.new'ImageButton'bZ.Name='Toggle'bZ.Image=an.
toggleBackground bZ.ImageColor3=Color3.fromRGB(87,86,86)bZ.AutoButtonColor=false
bZ.AnchorPoint=Vector2.new(1,0.5)bZ.BackgroundColor3=Color3.fromRGB(255,255,255)
bZ.BackgroundTransparency=1 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.
BorderSizePixel=0 bZ.Position=UDim2.fromScale(1,0.5)bZ.Size=UDim2.fromOffset(41,
21)bZ.ImageTransparency=0.5 local b_=Instance.new'UIPadding'b_.Name=
'ToggleUIPadding'b_.PaddingBottom=UDim.new(0,1)b_.PaddingLeft=UDim.new(0,-2)b_.
PaddingRight=UDim.new(0,3)b_.PaddingTop=UDim.new(0,1)b_.Parent=bZ local b0=
Instance.new'ImageLabel'b0.Name='TogglerHead'b0.Image=an.togglerHead b0.
ImageColor3=Color3.fromRGB(255,255,255)b0.AnchorPoint=Vector2.new(1,0.5)b0.
BackgroundColor3=Color3.fromRGB(255,255,255)b0.BackgroundTransparency=1 b0.
BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel=0 b0.Position=UDim2.
fromScale(0.5,0.5)b0.Size=UDim2.fromOffset(15,15)b0.ZIndex=2 b0.Parent=bZ b0.
ImageTransparency=0.8 bZ.Parent=bX local b1,b2,b3,b4={Enabled=0,Disabled=0.5},{
Enabled=0,Disabled=0.85},{Info=TweenInfo.new(0.15,Enum.EasingStyle.Quad),
EnabledPosition=UDim2.new(1,0,0.5,0),DisabledPosition=UDim2.new(0.5,0,0.5,0)},bW
.Settings.Default local b5=function(b5,b6)local b7,b8=b5 and{b1.Enabled,b2.
Enabled}or{b1.Disabled,b2.Disabled},b5 and b3.EnabledPosition or b3.
DisabledPosition at(bZ,b3.Info,{ImageTransparency=b7[1]}):Play()at(b0,b3.Info,{
ImageTransparency=b7[2]}):Play()at(b0,b3.Info,{Position=b8}):Play()bW.State=b5
if b6 then b6(b4)end end b5(b4)local b6=function()b4=not b4 b5(b4,bW.Settings.
Callback)end bZ.MouseButton1Click:Connect(b6)function bW:Toggle()b6()end
function bW:UpdateState(b7)b4=b7 b5(b4,bW.Settings.Callback)end function bW:
GetState()return b4 end function bW:UpdateName(b7)bY.Text=b7 end function bW:
SetVisibility(b7)bX.Visible=b7 end if bV then aa.Options[bV]=bW end return bW
end function bO:Slider(bU,bV)local bW,bX={Settings=bU,IgnoreConfig=false,Class=
'Slider'},Instance.new'Frame'bX.Name='Slider'bX.AutomaticSize=Enum.AutomaticSize
.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.BackgroundTransparency=1 bX.
BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel=0 bX.Size=UDim2.new(1,0,0,
38)bX.Parent=bP local bY=Instance.new'TextLabel'bY.Name='SliderName'bY.FontFace=
Font.new(an.interFont)bY.Text=bW.Settings.Name bY.RichText=true bY.TextColor3=
Color3.fromRGB(255,255,255)bY.TextSize=13 bY.TextTransparency=0.5 bY.
TextTruncate=Enum.TextTruncate.AtEnd bY.TextXAlignment=Enum.TextXAlignment.Left
bY.TextYAlignment=Enum.TextYAlignment.Top bY.AnchorPoint=Vector2.new(0,0.5)bY.
AutomaticSize=Enum.AutomaticSize.XY bY.BackgroundColor3=Color3.fromRGB(255,255,
255)bY.BackgroundTransparency=1 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.
BorderSizePixel=0 bY.Position=UDim2.fromScale(1.3e-7,0.5)bY.Parent=bX local bZ=
Instance.new'Frame'bZ.Name='SliderElements'bZ.AnchorPoint=Vector2.new(1,0)bZ.
BackgroundColor3=Color3.fromRGB(255,255,255)bZ.BackgroundTransparency=1 bZ.
BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel=0 bZ.Position=UDim2.
fromScale(1,0)bZ.Size=UDim2.fromScale(1,1)local b_=Instance.new'TextBox'b_.Name=
'SliderValue'b_.FontFace=Font.new(an.interFont)b_.TextColor3=Color3.fromRGB(255,
255,255)b_.TextSize=12 b_.TextTransparency=0.1 b_.BackgroundColor3=Color3.
fromRGB(255,255,255)b_.BackgroundTransparency=0.95 b_.BorderColor3=Color3.
fromRGB(0,0,0)b_.BorderSizePixel=0 b_.LayoutOrder=1 b_.Position=UDim2.fromScale(
-7.89E-2,0.171)b_.Size=UDim2.fromOffset(41,21)b_.ClipsDescendants=true local b0=
Instance.new'UICorner'b0.Name='SliderValueUICorner'b0.CornerRadius=UDim.new(0,4)
b0.Parent=b_ local b1=Instance.new'UIStroke'b1.Name='SliderValueUIStroke'b1.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border b1.Color=Color3.fromRGB(255,255,255)
b1.Transparency=0.9 b1.Parent=b_ local b2=Instance.new'UIPadding'b2.Name=
'SliderValueUIPadding'b2.PaddingLeft=UDim.new(0,2)b2.PaddingRight=UDim.new(0,2)
b2.Parent=b_ b_.Parent=bZ local b3=Instance.new'UIListLayout'b3.Name=
'SliderElementsUIListLayout'b3.Padding=UDim.new(0,20)b3.FillDirection=Enum.
FillDirection.Horizontal b3.HorizontalAlignment=Enum.HorizontalAlignment.Right
b3.SortOrder=Enum.SortOrder.LayoutOrder b3.VerticalAlignment=Enum.
VerticalAlignment.Center b3.Parent=bZ local b4=Instance.new'ImageLabel'b4.Name=
'SliderBar'b4.Image=an.sliderbar b4.ImageColor3=Color3.fromRGB(87,86,86)b4.
BackgroundColor3=Color3.fromRGB(255,255,255)b4.BackgroundTransparency=1 b4.
BorderColor3=Color3.fromRGB(0,0,0)b4.BorderSizePixel=0 b4.Position=UDim2.
fromScale(0.219,0.457)b4.Size=UDim2.fromOffset(123,3)local b5=Instance.new
'ImageButton'b5.Name='SliderHead'b5.Image=an.sliderhead b5.AnchorPoint=Vector2.
new(0.5,0.5)b5.BackgroundColor3=Color3.fromRGB(255,255,255)b5.
BackgroundTransparency=1 b5.BorderColor3=Color3.fromRGB(0,0,0)b5.BorderSizePixel
=0 b5.Position=UDim2.fromScale(1,0.5)b5.Size=UDim2.fromOffset(12,12)b5.Parent=b4
b4.Parent=bZ local b6=Instance.new'UIPadding'b6.Name='SliderElementsUIPadding'b6
.PaddingTop=UDim.new(0,3)b6.Parent=bZ bZ.Parent=bX local b7,b8=false,{Hundredths
=function(b7)return string.format('%.2f',b7)end,Tenths=function(b7)return string
.format('%.1f',b7)end,Round=function(b7,b8)if b8 then return string.format('%.'
..b8..'f',b7)else return tostring(math.round(b7))end end,Degrees=function(b7,b8)
local b9=b8 and string.format('%.'..b8..'f',b7)or tostring(b7)return b9..
'\u{b0}'end,Percent=function(b7,b8)local b9=(b7-bW.Settings.Minimum)/(bW.
Settings.Maximum-bW.Settings.Minimum)*100 return b8 and string.format('%.'..b8..
'f',b9)..'%'or tostring(math.round(b9))..'%'end,Value=function(b7,b8)return b8
and string.format('%.'..b8..'f',b7)or tostring(b7)end}local b9,ca=b8[bW.Settings
.DisplayMethod]or b8.Value local cb=function(cb,cc)local cd if typeof(cb)==
'Instance'then local ce=cb cd=math.clamp((ce.Position.X-b4.AbsolutePosition.X)/
b4.AbsoluteSize.X,0,1)else local ce=cb cd=(ce-bW.Settings.Minimum)/(bW.Settings.
Maximum-bU.Minimum)end local ce=UDim2.new(cd,0,0.5,0)b5.Position=ce ca=cd*(bW.
Settings.Maximum-bW.Settings.Minimum)+bU.Minimum b_.Text=(bU.Prefix or'')..b9(ca
,bW.Settings.Precision)..(bU.Suffix or'')if not cc then task.spawn(function()if
bW.Settings.Callback then bW.Settings.Callback(ca)end end)end bW.Value=ca end
cb(bW.Settings.Default,true)b5.InputBegan:Connect(function(cc)if cc.
UserInputType==Enum.UserInputType.MouseButton1 or cc.UserInputType==Enum.
UserInputType.Touch then b7=true cb(cc)end end)b5.InputEnded:Connect(function(cc
)if cc.UserInputType==Enum.UserInputType.MouseButton1 or cc.UserInputType==Enum.
UserInputType.Touch then b7=false if bW.Settings.onInputComplete then bW.
Settings.onInputComplete(ca)end end end)b_.FocusLost:Connect(function(cc)local
cd=b_.Text local ce,cf=cd:match'^(%-?%d+%.?%d*)(%%?)$'if ce then ce=tonumber(ce)
cf=cf=='%'if cf then ce=bW.Settings.Minimum+(ce/100)*(bW.Settings.Maximum-bW.
Settings.Minimum)end local cg=math.clamp(ce,bW.Settings.Minimum,bW.Settings.
Maximum)cb(cg)else b_.Text=b9(ca)end if bW.Settings.onInputComplete then bW.
Settings.onInputComplete(ca)end end)af.InputChanged:Connect(function(cc)if b7
and(cc.UserInputType==Enum.UserInputType.MouseMovement or cc.UserInputType==Enum
.UserInputType.Touch)then cb(cc)end end)local cc=function()local cc,cd,ce,cf=b3.
Padding.Offset,b_.AbsoluteSize.X,bY.AbsoluteSize.X,bZ.AbsoluteSize.X local cg=(
cf-(cc+cd+ce+20))/g.Scale b4.Size=UDim2.new(b4.Size.X.Scale,cg,b4.Size.Y.Scale,
b4.Size.Y.Offset)end cc()bY:GetPropertyChangedSignal'AbsoluteSize':Connect(cc)bP
:GetPropertyChangedSignal'AbsoluteSize':Connect(cc)function bW:UpdateName(cd)bY=
cd end function bW:SetVisibility(cd)bX.Visible=cd end function bW:UpdateValue(cd
)cb(tonumber(cd),true)end function bW:GetValue()return ca end if bV then aa.
Options[bV]=bW end return bW end function bO:Input(bU,bV)local bW,bX={Settings=
bU,IgnoreConfig=false,Class='Input'},Instance.new'Frame'bX.Name='Input'bX.
AutomaticSize=Enum.AutomaticSize.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.
BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel
=0 bX.Size=UDim2.new(1,0,0,38)bX.Parent=bP local bY=Instance.new'TextLabel'bY.
Name='InputName'bY.FontFace=Font.new(an.interFont)bY.Text=bW.Settings.Name bY.
RichText=true bY.TextColor3=Color3.fromRGB(255,255,255)bY.TextSize=13 bY.
TextTransparency=0.5 bY.TextTruncate=Enum.TextTruncate.AtEnd bY.TextXAlignment=
Enum.TextXAlignment.Left bY.TextYAlignment=Enum.TextYAlignment.Top bY.
AnchorPoint=Vector2.new(0,0.5)bY.AutomaticSize=Enum.AutomaticSize.XY bY.
BackgroundColor3=Color3.fromRGB(255,255,255)bY.BackgroundTransparency=1 bY.
BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Position=UDim2.
fromScale(0,0.5)bY.Parent=bX local bZ=Instance.new'TextBox'bZ.Name='InputBox'bZ.
FontFace=Font.new(an.interFont)bZ.Text='Hello world!'bZ.TextColor3=Color3.
fromRGB(255,255,255)bZ.TextSize=12 bZ.TextTransparency=0.1 bZ.AnchorPoint=
Vector2.new(1,0.5)bZ.AutomaticSize=Enum.AutomaticSize.X bZ.BackgroundColor3=
Color3.fromRGB(255,255,255)bZ.BackgroundTransparency=0.95 bZ.BorderColor3=Color3
.fromRGB(0,0,0)bZ.BorderSizePixel=0 bZ.ClipsDescendants=true bZ.LayoutOrder=1 bZ
.Position=UDim2.fromScale(1,0.5)bZ.Size=UDim2.fromOffset(21,21)bZ.TextXAlignment
=Enum.TextXAlignment.Right local b_=Instance.new'UICorner'b_.Name=
'InputBoxUICorner'b_.CornerRadius=UDim.new(0,4)b_.Parent=bZ local b0=Instance.
new'UIStroke'b0.Name='InputBoxUIStroke'b0.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border b0.Color=Color3.fromRGB(255,255,255)b0.Transparency=0.9 b0.Parent=bZ
local b1=Instance.new'UIPadding'b1.Name='InputBoxUIPadding'b1.PaddingLeft=UDim.
new(0,5)b1.PaddingRight=UDim.new(0,5)b1.Parent=bZ local b2=Instance.new
'UISizeConstraint'b2.Name='InputBoxUISizeConstraint'b2.Parent=bZ bZ.Parent=bX
local b3,b4,b5,b6,b7=bX,bZ,bY,b2,function(b3)if bW.Settings.CharacterLimit then
return b3:sub(1,bW.Settings.CharacterLimit)end return b3 end local b8,b9={All=
function(b8)return b7(b8)end,Numeric=function(b8)local b9=b8:match'^%-?%d*$'and
b8 or b8:gsub('[^%d-]',''):gsub('(%-)',function(b9,ca)return ca==1 and b9 or''
end)return b7(b9)end,Alphabetic=function(b8)return b7(b8:gsub('[^a-zA-Z ]',''))
end,AlphaNumeric=function(b8)return b7(b8:gsub('[^a-zA-Z0-9]',''))end}if type(bW
.Settings.AcceptedCharacters)=='function'then b9=bW.Settings.AcceptedCharacters
else b9=b8[bW.Settings.AcceptedCharacters]or b8.All end b4.AutomaticSize=Enum.
AutomaticSize.X local ca=function()local ca,cb=b5.AbsoluteSize.X,b3.AbsoluteSize
.X local cc=(cb-ca-20)/g.Scale b6.MaxSize=Vector2.new(cc,9e9)end ca()b5:
GetPropertyChangedSignal'AbsoluteSize':Connect(ca)b4.FocusLost:Connect(function(
)local cb=b4.Text local cc=b9(cb)b4.Text=cc task.spawn(function()if bW.Settings.
Callback then bW.Settings.Callback(cc)end end)end)b4.Text=bW.Settings.Default or
''b4.PlaceholderText=bW.Settings.Placeholder or''b4:GetPropertyChangedSignal
'Text':Connect(function()b4.Text=b9(b4.Text)if bW.Settings.onChanged then bW.
Settings.onChanged(b4.Text)end bW.Text=b4.Text end)function bW:UpdateName(cb)bY.
Text=cb end function bW:SetVisibility(cb)bX.Visible=cb end function bW:GetInput(
)return b4.Text end function bW:UpdatePlaceholder(cb)bZ.PlaceholderText=cb end
function bW:UpdateText(cb)local cc=b9(cb)b4.Text=cc bW.Text=cc task.spawn(
function()if bW.Settings.Callback then bW.Settings.Callback(cc)end end)end if bV
then aa.Options[bV]=bW end return bW end function bO:Keybind(bU,bV)local bW,bX={
Settings=bU,IgnoreConfig=false,Class='Keybind'},Instance.new'Frame'bX.Name=
'Keybind'bX.AutomaticSize=Enum.AutomaticSize.Y bX.BackgroundColor3=Color3.
fromRGB(0,0,0)bX.BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)
bX.BorderSizePixel=0 bX.Size=UDim2.new(1,0,0,38)bX.Parent=bP local bY=Instance.
new'TextLabel'bY.Name='KeybindName'bY.FontFace=Font.new(an.interFont)bY.Text=bW.
Settings.Name bY.RichText=true bY.TextColor3=Color3.fromRGB(255,255,255)bY.
TextSize=13 bY.TextTransparency=0.5 bY.TextTruncate=Enum.TextTruncate.AtEnd bY.
TextXAlignment=Enum.TextXAlignment.Left bY.TextYAlignment=Enum.TextYAlignment.
Top bY.AnchorPoint=Vector2.new(0,0.5)bY.AutomaticSize=Enum.AutomaticSize.XY bY.
BackgroundColor3=Color3.fromRGB(255,255,255)bY.BackgroundTransparency=1 bY.
BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Position=UDim2.
fromScale(0,0.5)bY.Parent=bX local bZ=Instance.new'TextBox'bZ.Name='BinderBox'bZ
.CursorPosition=-1 bZ.FontFace=Font.new(an.interFont)bZ.PlaceholderText='...'bZ.
Text=''bZ.TextColor3=Color3.fromRGB(255,255,255)bZ.TextSize=12 bZ.
TextTransparency=0.1 bZ.AnchorPoint=Vector2.new(1,0.5)bZ.AutomaticSize=Enum.
AutomaticSize.X bZ.BackgroundColor3=Color3.fromRGB(255,255,255)bZ.
BackgroundTransparency=0.95 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.
BorderSizePixel=0 bZ.ClipsDescendants=true bZ.LayoutOrder=1 bZ.Position=UDim2.
fromScale(1,0.5)bZ.Size=UDim2.fromOffset(21,21)local b_=Instance.new'UICorner'b_
.Name='BinderBoxUICorner'b_.CornerRadius=UDim.new(0,4)b_.Parent=bZ local b0=
Instance.new'UIStroke'b0.Name='BinderBoxUIStroke'b0.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border b0.Color=Color3.fromRGB(255,255,255)b0.Transparency=0.9
b0.Parent=bZ local b1=Instance.new'UIPadding'b1.Name='BinderBoxUIPadding'b1.
PaddingLeft=UDim.new(0,5)b1.PaddingRight=UDim.new(0,5)b1.Parent=bZ local b2=
Instance.new'UISizeConstraint'b2.Name='BinderBoxUISizeConstraint'b2.Parent=bZ bZ
.Parent=bX local b3,b4,b5,b6=false,false,(bW.Settings.Default)local b7=function(
)b6=false b3=false bZ:ReleaseFocus()end if b5 then bZ.Text=b5.Name end bZ.
Focused:Connect(function()b6=true end)bZ.FocusLost:Connect(function()b6=false
end)af.InputBegan:Connect(function(b8)if b6 and not b3 then b3=true local b9 b9=
af.InputBegan:Connect(function(ca)if bW.Settings.Blacklist and(table.find(bW.
KeybindFunctions.Settings.Blacklist,ca.KeyCode)or table.find(bW.Settings.
Blacklist,ca.UserInputType))then bZ:ReleaseFocus()b7()b9:Disconnect()return end
if ca.UserInputType==Enum.UserInputType.Keyboard then b5=ca.KeyCode bZ.Text=ca.
KeyCode.Name elseif ca.UserInputType==Enum.UserInputType.MouseButton1 or ca.
UserInputType==Enum.UserInputType.MouseButton2 then b5=ca.UserInputType bZ.Text=
ca.UserInputType.Name end if bW.Settings.onBinded then bW.Settings.onBinded(b5)
end b4=true b7()b9:Disconnect()end)else if not b4 and(b8.KeyCode==b5 or b8.
UserInputType==b5)then if bW.Settings.Callback then bW.Settings.Callback(b5)end
if bW.Settings.onBindHeld then bW.Settings.onBindHeld(true,b5)end else b4=false
end end end)af.InputEnded:Connect(function(b8)if not b6 and not b3 then if b8.
KeyCode==b5 or b8.UserInputType==b5 then if bU.onBindHeld then bU.onBindHeld(
false,b5)end end end end)function bW:Bind(b8)b5=b8 bZ.Text=b8.Name end function
bW:Unbind()b5=nil bZ.Text=''end function bW:GetBind()return b5 end function bW:
UpdateName(b8)bY=b8 end function bW:SetVisibility(b8)bX.Visible=b8 end if bV
then aa.Options[bV]=bW end return bW end function bO:Dropdown(bU,bV)local bW,bX,
bY,bZ={Settings=bU,IgnoreConfig=false,Class='Dropdown'},{},{},Instance.new
'Frame'bZ.Name='Dropdown'bZ.BackgroundColor3=Color3.fromRGB(255,255,255)bZ.
BackgroundTransparency=0.985 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.
BorderSizePixel=0 bZ.Size=UDim2.new(1,0,0,38)bZ.Parent=bP bZ.ClipsDescendants=
true local b_=Instance.new'UIPadding'b_.Name='DropdownUIPadding'b_.PaddingLeft=
UDim.new(0,15)b_.PaddingRight=UDim.new(0,15)b_.Parent=bZ local b0=Instance.new
'TextButton'b0.Name='Interact'b0.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'b0.Text=''b0.TextColor3=Color3.
fromRGB(0,0,0)b0.TextSize=14 b0.BackgroundColor3=Color3.fromRGB(255,255,255)b0.
BackgroundTransparency=1 b0.BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel
=0 b0.Size=UDim2.new(1,0,0,38)b0.Parent=bZ local b1=Instance.new'TextLabel'b1.
Name='DropdownName'b1.FontFace=Font.new(an.interFont)b1.Text=bU.Default and(bW.
Settings.Name..' \u{2022} '..table.concat(bX,', '))or(bW.Settings.Name..'...')b1
.RichText=true b1.TextColor3=Color3.fromRGB(255,255,255)b1.TextSize=13 b1.
TextTransparency=0.5 b1.TextTruncate=Enum.TextTruncate.SplitWord b1.
TextXAlignment=Enum.TextXAlignment.Left b1.AutomaticSize=Enum.AutomaticSize.Y b1
.BackgroundColor3=Color3.fromRGB(255,255,255)b1.BackgroundTransparency=1 b1.
BorderColor3=Color3.fromRGB(0,0,0)b1.BorderSizePixel=0 b1.Size=UDim2.new(1,-20,0
,38)b1.Parent=bZ local b2=Instance.new'UIStroke'b2.Name='DropdownUIStroke'b2.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border b2.Color=Color3.fromRGB(255,255,255)
b2.Transparency=0.95 b2.Parent=bZ local b3=Instance.new'UICorner'b3.Name=
'DropdownUICorner'b3.CornerRadius=UDim.new(0,6)b3.Parent=bZ local b4=Instance.
new'ImageLabel'b4.Name='DropdownImage'b4.Image=an.dropdown b4.ImageTransparency=
0.5 b4.AnchorPoint=Vector2.new(1,0)b4.BackgroundColor3=Color3.fromRGB(255,255,
255)b4.BackgroundTransparency=1 b4.BorderColor3=Color3.fromRGB(0,0,0)b4.
BorderSizePixel=0 b4.Position=UDim2.new(1,0,0,12)b4.Size=UDim2.fromOffset(14,14)
b4.Parent=bZ local b5=Instance.new'Frame'b5.Name='DropdownFrame'b5.
BackgroundColor3=Color3.fromRGB(255,255,255)b5.BackgroundTransparency=1 b5.
BorderColor3=Color3.fromRGB(0,0,0)b5.BorderSizePixel=0 b5.ClipsDescendants=true
b5.Size=UDim2.fromScale(1,1)b5.Visible=false b5.AutomaticSize=Enum.AutomaticSize
.Y local b6=Instance.new'UIPadding'b6.Name='DropdownFrameUIPadding'b6.PaddingTop
=UDim.new(0,38)b6.PaddingBottom=UDim.new(0,10)b6.Parent=b5 local b7=Instance.new
'UIListLayout'b7.Name='DropdownFrameUIListLayout'b7.Padding=UDim.new(0,5)b7.
SortOrder=Enum.SortOrder.LayoutOrder b7.Parent=b5 local b8=Instance.new'Frame'b8
.Name='Search'b8.BackgroundColor3=Color3.fromRGB(255,255,255)b8.
BackgroundTransparency=0.95 b8.BorderColor3=Color3.fromRGB(0,0,0)b8.
BorderSizePixel=0 b8.LayoutOrder=-1 b8.Size=UDim2.new(1,0,0,30)b8.Parent=b5 b8.
Visible=bW.Settings.Search local b9=Instance.new'UICorner'b9.Name=
'SectionUICorner'b9.Parent=b8 local ca=Instance.new'ImageLabel'ca.Name=
'SearchIcon'ca.Image=an.searchIcon ca.ImageColor3=Color3.fromRGB(180,180,180)ca.
AnchorPoint=Vector2.new(0,0.5)ca.BackgroundColor3=Color3.fromRGB(255,255,255)ca.
BackgroundTransparency=1 ca.BorderColor3=Color3.fromRGB(0,0,0)ca.BorderSizePixel
=0 ca.Position=UDim2.fromScale(0,0.5)ca.Size=UDim2.fromOffset(12,12)ca.Parent=b8
local cb=Instance.new'UIPadding'cb.Name='UIPadding'cb.PaddingLeft=UDim.new(0,15)
cb.Parent=b8 local cc=Instance.new'TextBox'cc.Name='SearchBox'cc.CursorPosition=
-1 cc.FontFace=Font.new(an.interFont,Enum.FontWeight.Medium,Enum.FontStyle.
Normal)cc.PlaceholderColor3=Color3.fromRGB(150,150,150)cc.PlaceholderText=
'Search...'cc.Text=''cc.TextColor3=Color3.fromRGB(200,200,200)cc.TextSize=14 cc.
TextXAlignment=Enum.TextXAlignment.Left cc.BackgroundColor3=Color3.fromRGB(255,
255,255)cc.BackgroundTransparency=1 cc.BorderColor3=Color3.fromRGB(0,0,0)cc.
BorderSizePixel=0 cc.Size=UDim2.fromScale(1,1)local cd=function()local cd,ce,cf=
0,0,b6.PaddingTop.Offset+b6.PaddingBottom.Offset for cg,ch in pairs(b5:
GetChildren())do if not ch:IsA'UIComponent'and ch.Visible then cd+=ch.
AbsoluteSize.Y ce+=1 end end local cg=b7.Padding.Offset*(ce-1)return cd+cg+cf
end local ce=function()local ce=cc.Text:lower()for cf,cg in pairs(bY)do local ch
=cg.NameLabel.Text:lower()local ci=string.find(ch,ce)~=nil if cg.Button.Visible
~=ci then cg.Button.Visible=ci end end bZ.Size=UDim2.new(1,0,0,cd())end cc:
GetPropertyChangedSignal'Text':Connect(ce)local cf=Instance.new'UIPadding'cf.
Name='UIPadding'cf.PaddingLeft=UDim.new(0,23)cf.Parent=cc cc.Parent=b8 local cg=
{duration=0.2,easingStyle=Enum.EasingStyle.Quint,transparencyIn=0.2,
transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-13,waitTime=1}local
ch,ci,cj=function(ch,ci)local cj=bY[ch]if not cj then return end local ck,cl=cj.
Checkmark,cj.NameLabel if ci then if bW.Settings.Multi then if not table.find(bX
,ch)then table.insert(bX,ch)bW.Value=bX end else for cm,cn in pairs(bY)do if cm
~=ch then at(cn.Checkmark,TweenInfo.new(cg.duration,cg.easingStyle),{Size=UDim2.
new(cn.Checkmark.Size.X.Scale,cg.checkSizeDecrease,cn.Checkmark.Size.Y.Scale,cn.
Checkmark.Size.Y.Offset)}):Play()at(cn.NameLabel,TweenInfo.new(cg.duration,cg.
easingStyle),{TextTransparency=cg.transparencyOut}):Play()cn.Checkmark.
TextTransparency=1 end end bX={ch}bW.Value=bX[1]end at(ck,TweenInfo.new(cg.
duration,cg.easingStyle),{Size=UDim2.new(ck.Size.X.Scale,cg.checkSizeIncrease,ck
.Size.Y.Scale,ck.Size.Y.Offset)}):Play()at(cl,TweenInfo.new(cg.duration,cg.
easingStyle),{TextTransparency=cg.transparencyIn}):Play()ck.TextTransparency=0
else if bW.Settings.Multi then local cm=table.find(bX,ch)if cm then table.
remove(bX,cm)end else bX={}end at(ck,TweenInfo.new(cg.duration,cg.easingStyle),{
Size=UDim2.new(ck.Size.X.Scale,cg.checkSizeDecrease,ck.Size.Y.Scale,ck.Size.Y.
Offset)}):Play()at(cl,TweenInfo.new(cg.duration,cg.easingStyle),{
TextTransparency=cg.transparencyOut}):Play()ck.TextTransparency=1 end if bU.
Required and#bX==0 and not ci then return end if#bX>0 then b1.Text=bW.Settings.
Name..' \u{2022} '..table.concat(bX,', ')else b1.Text=bW.Settings.Name..'...'end
end,false,false local ck=function()if cj then return end cj=true local ck,cl=38,
not ci local cm=cl and UDim2.new(1,0,0,cd())or UDim2.new(1,0,0,ck)local cn,co=
at(bZ,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
Size=cm}),at(b4,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out
),{Rotation=cl and-90 or 0})cn:Play()co:Play()if cl then b5.Visible=true cn.
Completed:Connect(function()cj=false end)else cn.Completed:Connect(function()b5.
Visible=false cj=false end)end ci=cl end b0.MouseButton1Click:Connect(ck)local
cl=function(cl,cm)local cn=Instance.new'TextButton'cn.Name='Option'cn.FontFace=
Font.new'rbxasset://fonts/families/SourceSansPro.json'cn.Text=''cn.TextColor3=
Color3.fromRGB(0,0,0)cn.TextSize=14 cn.BackgroundColor3=Color3.fromRGB(255,255,
255)cn.BackgroundTransparency=1 cn.BorderColor3=Color3.fromRGB(0,0,0)cn.
BorderSizePixel=0 cn.Size=UDim2.new(1,0,0,30)local co=Instance.new'UIPadding'co.
Name='OptionUIPadding'co.PaddingLeft=UDim.new(0,15)co.Parent=cn local cp=
Instance.new'TextLabel'cp.Name='OptionName'cp.FontFace=Font.new(an.interFont)cp.
Text=cm cp.RichText=true cp.TextColor3=Color3.fromRGB(255,255,255)cp.TextSize=13
cp.TextTransparency=0.5 cp.TextTruncate=Enum.TextTruncate.AtEnd cp.
TextXAlignment=Enum.TextXAlignment.Left cp.TextYAlignment=Enum.TextYAlignment.
Top cp.AnchorPoint=Vector2.new(0,0.5)cp.AutomaticSize=Enum.AutomaticSize.XY cp.
BackgroundColor3=Color3.fromRGB(255,255,255)cp.BackgroundTransparency=1 cp.
BorderColor3=Color3.fromRGB(0,0,0)cp.BorderSizePixel=0 cp.Position=UDim2.
fromScale(1.3e-7,0.5)cp.Parent=cn local cq=Instance.new'UIListLayout'cq.Name=
'OptionUIListLayout'cq.Padding=UDim.new(0,10)cq.FillDirection=Enum.FillDirection
.Horizontal cq.SortOrder=Enum.SortOrder.LayoutOrder cq.VerticalAlignment=Enum.
VerticalAlignment.Center cq.Parent=cn local cr=Instance.new'TextLabel'cr.Name=
'Checkmark'cr.FontFace=Font.new(an.interFont)cr.Text='\u{2713}'cr.TextColor3=
Color3.fromRGB(255,255,255)cr.TextSize=13 cr.TextTransparency=1 cr.
TextXAlignment=Enum.TextXAlignment.Left cr.TextYAlignment=Enum.TextYAlignment.
Top cr.AnchorPoint=Vector2.new(0,0.5)cr.AutomaticSize=Enum.AutomaticSize.Y cr.
BackgroundColor3=Color3.fromRGB(255,255,255)cr.BackgroundTransparency=1 cr.
BorderColor3=Color3.fromRGB(0,0,0)cr.BorderSizePixel=0 cr.LayoutOrder=-1 cr.
Position=UDim2.fromScale(1.3e-7,0.5)cr.Size=UDim2.fromOffset(-10,0)cr.Parent=cn
cn.Parent=b5 b5.Parent=bZ bY[cm]={Index=cl,Button=cn,NameLabel=cp,Checkmark=cr}
local cs={duration=0.2,easingStyle=Enum.EasingStyle.Quint,transparencyIn=0.2,
transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-cq.Padding.Offset,
waitTime=1}local ct,cu={checkIn=at(cr,TweenInfo.new(cs.duration,cs.easingStyle),
{Size=UDim2.new(cr.Size.X.Scale,cs.checkSizeIncrease,cr.Size.Y.Scale,cr.Size.Y.
Offset)}),checkOut=at(cr,TweenInfo.new(cs.duration,cs.easingStyle),{Size=UDim2.
new(cr.Size.X.Scale,cs.checkSizeDecrease,cr.Size.Y.Scale,cr.Size.Y.Offset)}),
nameIn=at(cp,TweenInfo.new(cs.duration,cs.easingStyle),{TextTransparency=cs.
transparencyIn}),nameOut=at(cp,TweenInfo.new(cs.duration,cs.easingStyle),{
TextTransparency=cs.transparencyOut})},false if bW.Settings.Default then if bW.
Settings.Multi then cu=table.find(bW.Settings.Default,cm)and true or false else
cu=(bW.Settings.Default==cl)and true or false end end ch(cm,cu)local cv=bY[cm].
Button cv.MouseButton1Click:Connect(function()local cw=table.find(bX,cm)and true
or false local cx=not cw if bW.Settings.Required and not cx and#bX<=1 then
return end ch(cm,cx)task.spawn(function()if bW.Settings.Multi then local cy={}
for cz,cA in ipairs(bX)do cy[cA]=true end if bW.Settings.Callback then bW.
Settings.Callback(cy)end else if cx and bW.Settings.Callback then bW.Settings.
Callback(bX[1]or nil)end end end)end)if ci then bZ.Size=UDim2.new(1,0,0,cd())end
end if bW.Settings.Options then for cm,co in pairs(bW.Settings.Options)do cl(cm,
co)end end function bW:UpdateName(cm)b1.Text=cm end function bW:SetVisibility(cm
)bZ.Visible=cm end function bW:UpdateSelection(cm)if not cm then return end for
co,cp in pairs(bY)do ch(co,false)end local co={}if type(cm)=='number'then for cp
,cq in pairs(bY)do local cr=cq.Index==cm ch(cp,cr)if cr then table.insert(co,cp)
end end elseif type(cm)=='string'then for cp,cq in pairs(bY)do local cr=cp==cm
ch(cp,cr)if cr then table.insert(co,cp)end end elseif type(cm)=='table'then for
cp,cq in pairs(bY)do local cr=table.find(cm,cp)~=nil ch(cp,cr)if cr then table.
insert(co,cp)end end end if bW.Settings.Callback then if bW.Settings.Multi then
local cp={}for cq,cr in ipairs(co)do cp[cr]=true end bW.Settings.Callback(cp)
else bW.Settings.Callback(co[1]or nil)end end end function bW:InsertOptions(cm)
if not cm then return end bW.Settings.Options=cm for co,cp in pairs(cm)do cl(co,
cp)end end function bW:ClearOptions()for cm,co in pairs(bY)do co.Button:Destroy(
)end bY={}bX={}if ci then bZ.Size=UDim2.new(1,0,0,cd())end end function bW:
GetOptions()local cm={}for co,cp in pairs(bY)do local cq=table.find(bX,co)and
true or false cm[co]=cq end return cm end function bW:RemoveOptions(cm)if not cm
then return end for co,cp in ipairs(cm)do local cq=bY[cp]if cq then for cr=#bX,1
,-1 do if bX[cr]==cp then table.remove(bX,cr)end end cq.Button:Destroy()bY[cp]=
nil end end if ci then bZ.Size=UDim2.new(1,0,0,cd())end end function bW:IsOption
(cm)if not cm then return end return bY[cm]~=nil end if bV then aa.Options[bV]=
bW end return bW end function bO:Colorpicker(bU,bV)local bW={Settings=bU,
IgnoreConfig=false,Class='Colorpicker'}local bX=bW.Settings.Alpha and true or
false bW.Color=bW.Settings.Default bW.Alpha=bX and bW.Settings.Alpha local bY=
Instance.new'Frame'bY.Name='Colorpicker'bY.AutomaticSize=Enum.AutomaticSize.Y bY
.BackgroundColor3=Color3.fromRGB(0,0,0)bY.BackgroundTransparency=1 bY.
BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Size=UDim2.new(1,0,0,
38)bY.Parent=bP local bZ=Instance.new'TextLabel'bZ.Name='KeybindName'bZ.FontFace
=Font.new(an.interFont)bZ.Text=bU.Name bZ.TextColor3=Color3.fromRGB(255,255,255)
bZ.TextSize=13 bZ.TextTransparency=0.5 bZ.RichText=true bZ.TextTruncate=Enum.
TextTruncate.AtEnd bZ.TextXAlignment=Enum.TextXAlignment.Left bZ.TextYAlignment=
Enum.TextYAlignment.Top bZ.AnchorPoint=Vector2.new(0,0.5)bZ.AutomaticSize=Enum.
AutomaticSize.XY bZ.BackgroundColor3=Color3.fromRGB(255,255,255)bZ.
BackgroundTransparency=1 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel
=0 bZ.Position=UDim2.fromScale(0,0.5)bZ.Parent=bY local b_=Instance.new
'ImageLabel'b_.Name='NewColor'b_.Image=an.grid b_.ScaleType=Enum.ScaleType.Tile
b_.TileSize=UDim2.fromOffset(500,500)b_.AnchorPoint=Vector2.new(1,0.5)b_.
BackgroundColor3=Color3.fromRGB(255,255,255)b_.BackgroundTransparency=1 b_.
BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel=0 b_.Position=UDim2.
fromScale(1,0.5)b_.Size=UDim2.fromOffset(21,21)local b0=Instance.new'Frame'b0.
Name='Color'b0.AnchorPoint=Vector2.new(0.5,0.5)b0.BackgroundColor3=bW.Color b0.
BorderSizePixel=0 b0.Position=UDim2.fromScale(0.5,0.5)b0.Size=UDim2.fromScale(1,
1)b0.BackgroundTransparency=bW.Alpha or 0 local b1=Instance.new'UICorner'b1.Name
='UICorner'b1.CornerRadius=UDim.new(0,6)b1.Parent=b0 local b2=Instance.new
'TextButton'b2.Name='Interact'b2.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'b2.Text=''b2.TextColor3=Color3.
fromRGB(0,0,0)b2.TextSize=14 b2.BackgroundColor3=Color3.fromRGB(255,255,255)b2.
BackgroundTransparency=1 b2.BorderColor3=Color3.fromRGB(0,0,0)b2.BorderSizePixel
=0 b2.Size=UDim2.fromScale(1,1)b2.Parent=b0 b0.Parent=b_ local b3=Instance.new
'UICorner'b3.Name='UICorner'b3.CornerRadius=UDim.new(0,8)b3.Parent=b_ b_.Parent=
bY local b4=Instance.new'Frame'b4.Name='ColorPicker'b4.BackgroundColor3=Color3.
fromRGB(0,0,0)b4.BackgroundTransparency=0.5 b4.BorderColor3=Color3.fromRGB(0,0,0
)b4.BorderSizePixel=0 b4.Size=UDim2.fromScale(1,1)b4.Visible=false local b5=
Instance.new'UICorner'b5.Name='BaseUICorner'b5.CornerRadius=UDim.new(0,10)b5.
Parent=b4 local b6=Instance.new'Frame'b6.Name='Prompt'b6.AnchorPoint=Vector2.
new(0.5,0.5)b6.AutomaticSize=Enum.AutomaticSize.Y b6.BackgroundColor3=Color3.
fromRGB(15,15,15)b6.BorderColor3=Color3.fromRGB(0,0,0)b6.BorderSizePixel=0 b6.
Position=UDim2.fromScale(0.5,0.5)b6.Size=UDim2.fromOffset(420,0)local b7=
Instance.new'UIScale'b7.Name='BaseUIScale'b7.Parent=b6 b7.Scale=0.95 local b8=
Instance.new'UIStroke'b8.Name='GlobalSettingsUIStroke'b8.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border b8.Color=Color3.fromRGB(255,255,255)b8.Transparency=0.9
b8.Parent=b6 local b9=Instance.new'UICorner'b9.Name='GlobalSettingsUICorner'b9.
CornerRadius=UDim.new(0,10)b9.Parent=b6 local ca=Instance.new'UIListLayout'ca.
Name='UIListLayout'ca.Padding=UDim.new(0,10)ca.HorizontalAlignment=Enum.
HorizontalAlignment.Center ca.SortOrder=Enum.SortOrder.LayoutOrder ca.Parent=b6
local cb=Instance.new'Frame'cb.Name='ColorOptions'cb.AutomaticSize=Enum.
AutomaticSize.XY cb.BackgroundColor3=Color3.fromRGB(255,255,255)cb.
BackgroundTransparency=1 cb.BorderColor3=Color3.fromRGB(0,0,0)cb.BorderSizePixel
=0 cb.LayoutOrder=1 cb.Size=UDim2.fromScale(1,0)local cc=Instance.new
'TextButton'cc.Name='Value'cc.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'cc.Text=''cc.TextColor3=Color3.
fromRGB(0,0,0)cc.TextSize=14 cc.AutoButtonColor=false cc.BackgroundColor3=Color3
.fromRGB(255,255,255)cc.BorderColor3=Color3.fromRGB(0,0,0)cc.BorderSizePixel=0
cc.LayoutOrder=1 cc.Position=UDim2.fromScale(0.092,0.886)cc.Size=UDim2.new(1,0,0
,15)local cd=Instance.new'UIGradient'cd.Name='UIGradient'cd.Color=ColorSequence.
new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))}cd.Parent=cc local ce=
Instance.new'Frame'ce.Name='Slide'ce.AnchorPoint=Vector2.new(0,0.5)ce.
BackgroundColor3=Color3.fromRGB(255,255,255)ce.BorderColor3=Color3.fromRGB(27,42
,53)ce.BorderSizePixel=0 ce.Position=UDim2.fromScale(0,0.5)ce.Size=UDim2.new(0,
13,1,8)local cf=Instance.new'UICorner'cf.Name='UICorner'cf.CornerRadius=UDim.
new(1,0)cf.Parent=ce local cg=Instance.new'UIStroke'cg.Name='UIStroke'cg.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border cg.Transparency=0.5 cg.Parent=ce ce.
Parent=cc local ch=Instance.new'UICorner'ch.Name='UICorner'ch.CornerRadius=UDim.
new(0,6)ch.Parent=cc local ci=Instance.new'UIStroke'ci.Name='UIStroke'ci.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border ci.Color=Color3.fromRGB(255,255,255)
ci.Transparency=0.9 local cj=Instance.new'UIGradient'cj.Name='UIGradient'cj.
Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255))
,ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))}cj.Rotation=180 cj.Parent=ci
ci.Parent=cc cc.Parent=cb local ck=Instance.new'UIListLayout'ck.Name=
'UIListLayout'ck.Padding=UDim.new(0,25)ck.SortOrder=Enum.SortOrder.LayoutOrder
ck.Parent=cb local cl=Instance.new'Frame'cl.Name='Wheel'cl.AutomaticSize=Enum.
AutomaticSize.Y cl.BackgroundColor3=Color3.fromRGB(255,255,255)cl.
BackgroundTransparency=1 cl.BorderColor3=Color3.fromRGB(0,0,0)cl.BorderSizePixel
=0 cl.Size=UDim2.new(1,0,0,100)local cm=Instance.new'ImageButton'cm.Name='Wheel'
cm.Image=an.colorWheel cm.AutoButtonColor=false cm.Active=false cm.
BackgroundColor3=Color3.fromRGB(248,248,248)cm.BackgroundTransparency=1 cm.
BorderColor3=Color3.fromRGB(27,42,53)cm.Selectable=false cm.Size=UDim2.
fromOffset(220,220)cm.SizeConstraint=Enum.SizeConstraint.RelativeYY local co=
Instance.new'ImageLabel'co.Name='Target'co.Image=an.colorTarget co.ImageColor3=
Color3.fromRGB(0,0,0)co.AnchorPoint=Vector2.new(0.5,0.5)co.BackgroundColor3=
Color3.fromRGB(255,255,255)co.BackgroundTransparency=1 co.BorderColor3=Color3.
fromRGB(27,42,53)co.Position=UDim2.fromScale(0.5,0.5)co.Size=UDim2.fromOffset(22
,22)co.SizeConstraint=Enum.SizeConstraint.RelativeYY co.Parent=cm cm.Parent=cl
local cp=Instance.new'Frame'cp.Name='Inputs'cp.AnchorPoint=Vector2.new(1,0.5)cp.
AutomaticSize=Enum.AutomaticSize.XY cp.BackgroundColor3=Color3.fromRGB(255,255,
255)cp.BackgroundTransparency=1 cp.BorderColor3=Color3.fromRGB(0,0,0)cp.
BorderSizePixel=0 cp.LayoutOrder=1 cp.Position=UDim2.fromScale(1,0.5)local cq=
Instance.new'UIListLayout'cq.Name='UIListLayout'cq.Padding=UDim.new(0,5)cq.
SortOrder=Enum.SortOrder.LayoutOrder cq.Parent=cp local cr=Instance.new'Frame'cr
.Name='Red'cr.AutomaticSize=Enum.AutomaticSize.XY cr.BackgroundColor3=Color3.
fromRGB(0,0,0)cr.BackgroundTransparency=1 cr.BorderColor3=Color3.fromRGB(0,0,0)
cr.BorderSizePixel=0 cr.LayoutOrder=1 cr.Size=UDim2.fromOffset(0,38)local cs=
Instance.new'TextLabel'cs.Name='InputName'cs.FontFace=Font.new(an.interFont)cs.
Text='Red'cs.TextColor3=Color3.fromRGB(255,255,255)cs.TextSize=13 cs.
TextTransparency=0.5 cs.TextTruncate=Enum.TextTruncate.AtEnd cs.TextXAlignment=
Enum.TextXAlignment.Left cs.TextYAlignment=Enum.TextYAlignment.Top cs.
AnchorPoint=Vector2.new(0,0.5)cs.AutomaticSize=Enum.AutomaticSize.XY cs.
BackgroundColor3=Color3.fromRGB(255,255,255)cs.BackgroundTransparency=1 cs.
BorderColor3=Color3.fromRGB(0,0,0)cs.BorderSizePixel=0 cs.LayoutOrder=2 cs.
Position=UDim2.fromScale(0,0.5)cs.Parent=cr local ct=Instance.new'UIListLayout'
ct.Name='UIListLayout'ct.Padding=UDim.new(0,15)ct.FillDirection=Enum.
FillDirection.Horizontal ct.SortOrder=Enum.SortOrder.LayoutOrder ct.
VerticalAlignment=Enum.VerticalAlignment.Center ct.Parent=cr local cu=Instance.
new'TextBox'cu.Name='InputBox'cu.ClearTextOnFocus=false cu.CursorPosition=-1 cu.
FontFace=Font.new(an.interFont)cu.Text='255'cu.TextColor3=Color3.fromRGB(255,255
,255)cu.TextSize=12 cu.TextTransparency=0.1 cu.TextXAlignment=Enum.
TextXAlignment.Left cu.AnchorPoint=Vector2.new(1,0.5)cu.BackgroundColor3=Color3.
fromRGB(255,255,255)cu.BackgroundTransparency=0.95 cu.BorderColor3=Color3.
fromRGB(0,0,0)cu.BorderSizePixel=0 cu.ClipsDescendants=true cu.LayoutOrder=1 cu.
Position=UDim2.fromScale(1,0.5)cu.Size=UDim2.fromOffset(75,25)local cv=Instance.
new'UICorner'cv.Name='InputBoxUICorner'cv.CornerRadius=UDim.new(0,4)cv.Parent=cu
local cw=Instance.new'UIStroke'cw.Name='InputBoxUIStroke'cw.ApplyStrokeMode=Enum
.ApplyStrokeMode.Border cw.Color=Color3.fromRGB(255,255,255)cw.Transparency=0.9
cw.Parent=cu local cx=Instance.new'UISizeConstraint'cx.Name=
'InputBoxUISizeConstraint'cx.Parent=cu local cy=Instance.new'UIPadding'cy.Name=
'InputBoxUIPadding'cy.PaddingLeft=UDim.new(0,8)cy.PaddingRight=UDim.new(0,10)cy.
Parent=cu cu.Parent=cr cr.Parent=cp local cz=Instance.new'Frame'cz.Name='Green'
cz.AutomaticSize=Enum.AutomaticSize.XY cz.BackgroundColor3=Color3.fromRGB(0,0,0)
cz.BackgroundTransparency=1 cz.BorderColor3=Color3.fromRGB(0,0,0)cz.
BorderSizePixel=0 cz.LayoutOrder=2 cz.Size=UDim2.fromOffset(0,38)local cA=
Instance.new'TextLabel'cA.Name='InputName'cA.FontFace=Font.new(an.interFont)cA.
Text='Green'cA.TextColor3=Color3.fromRGB(255,255,255)cA.TextSize=13 cA.
TextTransparency=0.5 cA.TextTruncate=Enum.TextTruncate.AtEnd cA.TextXAlignment=
Enum.TextXAlignment.Left cA.TextYAlignment=Enum.TextYAlignment.Top cA.
AnchorPoint=Vector2.new(0,0.5)cA.AutomaticSize=Enum.AutomaticSize.XY cA.
BackgroundColor3=Color3.fromRGB(255,255,255)cA.BackgroundTransparency=1 cA.
BorderColor3=Color3.fromRGB(0,0,0)cA.BorderSizePixel=0 cA.LayoutOrder=2 cA.
Position=UDim2.fromScale(0,0.5)cA.Parent=cz local cB=Instance.new'UIListLayout'
cB.Name='UIListLayout'cB.Padding=UDim.new(0,15)cB.FillDirection=Enum.
FillDirection.Horizontal cB.SortOrder=Enum.SortOrder.LayoutOrder cB.
VerticalAlignment=Enum.VerticalAlignment.Center cB.Parent=cz local cC=Instance.
new'TextBox'cC.Name='InputBox'cC.ClearTextOnFocus=false cC.FontFace=Font.new(an.
interFont)cC.Text='255'cC.TextColor3=Color3.fromRGB(255,255,255)cC.TextSize=12
cC.TextTransparency=0.1 cC.TextXAlignment=Enum.TextXAlignment.Left cC.
AnchorPoint=Vector2.new(1,0.5)cC.BackgroundColor3=Color3.fromRGB(255,255,255)cC.
BackgroundTransparency=0.95 cC.BorderColor3=Color3.fromRGB(0,0,0)cC.
BorderSizePixel=0 cC.ClipsDescendants=true cC.LayoutOrder=1 cC.Position=UDim2.
fromScale(1,0.5)cC.Size=UDim2.fromOffset(75,25)local cD=Instance.new'UICorner'cD
.Name='InputBoxUICorner'cD.CornerRadius=UDim.new(0,4)cD.Parent=cC local cE=
Instance.new'UIStroke'cE.Name='InputBoxUIStroke'cE.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cE.Color=Color3.fromRGB(255,255,255)cE.Transparency=0.9
cE.Parent=cC local cF=Instance.new'UISizeConstraint'cF.Name=
'InputBoxUISizeConstraint'cF.Parent=cC local cG=Instance.new'UIPadding'cG.Name=
'InputBoxUIPadding'cG.PaddingLeft=UDim.new(0,8)cG.PaddingRight=UDim.new(0,10)cG.
Parent=cC cC.Parent=cz cz.Parent=cp local cH=Instance.new'Frame'cH.Name='Blue'cH
.AutomaticSize=Enum.AutomaticSize.XY cH.BackgroundColor3=Color3.fromRGB(0,0,0)cH
.BackgroundTransparency=1 cH.BorderColor3=Color3.fromRGB(0,0,0)cH.
BorderSizePixel=0 cH.LayoutOrder=3 cH.Size=UDim2.fromOffset(0,38)local cI=
Instance.new'TextLabel'cI.Name='InputName'cI.FontFace=Font.new(an.interFont)cI.
Text='Blue'cI.TextColor3=Color3.fromRGB(255,255,255)cI.TextSize=13 cI.
TextTransparency=0.5 cI.TextTruncate=Enum.TextTruncate.AtEnd cI.TextXAlignment=
Enum.TextXAlignment.Left cI.TextYAlignment=Enum.TextYAlignment.Top cI.
AnchorPoint=Vector2.new(0,0.5)cI.AutomaticSize=Enum.AutomaticSize.XY cI.
BackgroundColor3=Color3.fromRGB(255,255,255)cI.BackgroundTransparency=1 cI.
BorderColor3=Color3.fromRGB(0,0,0)cI.BorderSizePixel=0 cI.LayoutOrder=2 cI.
Position=UDim2.fromScale(0,0.5)cI.Parent=cH local cJ=Instance.new'UIListLayout'
cJ.Name='UIListLayout'cJ.Padding=UDim.new(0,15)cJ.FillDirection=Enum.
FillDirection.Horizontal cJ.SortOrder=Enum.SortOrder.LayoutOrder cJ.
VerticalAlignment=Enum.VerticalAlignment.Center cJ.Parent=cH local cK=Instance.
new'TextBox'cK.Name='InputBox'cK.ClearTextOnFocus=false cK.FontFace=Font.new(an.
interFont)cK.Text='255'cK.TextColor3=Color3.fromRGB(255,255,255)cK.TextSize=12
cK.TextTransparency=0.1 cK.TextXAlignment=Enum.TextXAlignment.Left cK.
AnchorPoint=Vector2.new(1,0.5)cK.BackgroundColor3=Color3.fromRGB(255,255,255)cK.
BackgroundTransparency=0.95 cK.BorderColor3=Color3.fromRGB(0,0,0)cK.
BorderSizePixel=0 cK.ClipsDescendants=true cK.LayoutOrder=1 cK.Position=UDim2.
fromScale(1,0.5)cK.Size=UDim2.fromOffset(75,25)local cL=Instance.new'UICorner'cL
.Name='InputBoxUICorner'cL.CornerRadius=UDim.new(0,4)cL.Parent=cK local cM=
Instance.new'UIStroke'cM.Name='InputBoxUIStroke'cM.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cM.Color=Color3.fromRGB(255,255,255)cM.Transparency=0.9
cM.Parent=cK local cN=Instance.new'UISizeConstraint'cN.Name=
'InputBoxUISizeConstraint'cN.Parent=cK local cO=Instance.new'UIPadding'cO.Name=
'InputBoxUIPadding'cO.PaddingLeft=UDim.new(0,8)cO.PaddingRight=UDim.new(0,10)cO.
Parent=cK cK.Parent=cH cH.Parent=cp local cP=Instance.new'Frame'cP.Name='Alpha'
cP.AutomaticSize=Enum.AutomaticSize.XY cP.BackgroundColor3=Color3.fromRGB(0,0,0)
cP.BackgroundTransparency=1 cP.BorderColor3=Color3.fromRGB(0,0,0)cP.
BorderSizePixel=0 cP.LayoutOrder=4 cP.Size=UDim2.fromOffset(0,38)cP.Visible=bX
local cQ=Instance.new'TextLabel'cQ.Name='InputName'cQ.FontFace=Font.new(an.
interFont)cQ.Text='Alpha'cQ.TextColor3=Color3.fromRGB(255,255,255)cQ.TextSize=13
cQ.TextTransparency=0.5 cQ.TextTruncate=Enum.TextTruncate.AtEnd cQ.
TextXAlignment=Enum.TextXAlignment.Left cQ.TextYAlignment=Enum.TextYAlignment.
Top cQ.AnchorPoint=Vector2.new(0,0.5)cQ.AutomaticSize=Enum.AutomaticSize.XY cQ.
BackgroundColor3=Color3.fromRGB(255,255,255)cQ.BackgroundTransparency=1 cQ.
BorderColor3=Color3.fromRGB(0,0,0)cQ.BorderSizePixel=0 cQ.LayoutOrder=2 cQ.
Position=UDim2.fromScale(0,0.5)cQ.Parent=cP local cR=Instance.new'UIListLayout'
cR.Name='UIListLayout'cR.Padding=UDim.new(0,15)cR.FillDirection=Enum.
FillDirection.Horizontal cR.SortOrder=Enum.SortOrder.LayoutOrder cR.
VerticalAlignment=Enum.VerticalAlignment.Center cR.Parent=cP local cS=Instance.
new'TextBox'cS.Name='InputBox'cS.ClearTextOnFocus=false cS.FontFace=Font.new(an.
interFont)cS.Text='0'cS.TextColor3=Color3.fromRGB(255,255,255)cS.TextSize=12 cS.
TextTransparency=0.1 cS.TextXAlignment=Enum.TextXAlignment.Left cS.AnchorPoint=
Vector2.new(1,0.5)cS.BackgroundColor3=Color3.fromRGB(255,255,255)cS.
BackgroundTransparency=0.95 cS.BorderColor3=Color3.fromRGB(0,0,0)cS.
BorderSizePixel=0 cS.ClipsDescendants=true cS.LayoutOrder=1 cS.Position=UDim2.
fromScale(1,0.5)cS.Size=UDim2.fromOffset(75,25)local cT=Instance.new'UICorner'cT
.Name='InputBoxUICorner'cT.CornerRadius=UDim.new(0,4)cT.Parent=cS local cU=
Instance.new'UIStroke'cU.Name='InputBoxUIStroke'cU.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cU.Color=Color3.fromRGB(255,255,255)cU.Transparency=0.9
cU.Parent=cS local cV=Instance.new'UISizeConstraint'cV.Name=
'InputBoxUISizeConstraint'cV.Parent=cS local cW=Instance.new'UIPadding'cW.Name=
'InputBoxUIPadding'cW.PaddingLeft=UDim.new(0,8)cW.PaddingRight=UDim.new(0,10)cW.
Parent=cS cS.Parent=cP cP.Parent=cp local cX=Instance.new'Frame'cX.Name='Hex'cX.
AutomaticSize=Enum.AutomaticSize.XY cX.BackgroundColor3=Color3.fromRGB(0,0,0)cX.
BackgroundTransparency=1 cX.BorderColor3=Color3.fromRGB(0,0,0)cX.BorderSizePixel
=0 cX.Size=UDim2.fromOffset(0,38)local cY=Instance.new'TextLabel'cY.Name=
'InputName'cY.FontFace=Font.new(an.interFont)cY.Text='Hex'cY.TextColor3=Color3.
fromRGB(255,255,255)cY.TextSize=13 cY.TextTransparency=0.5 cY.TextTruncate=Enum.
TextTruncate.AtEnd cY.TextXAlignment=Enum.TextXAlignment.Left cY.TextYAlignment=
Enum.TextYAlignment.Top cY.AnchorPoint=Vector2.new(0,0.5)cY.AutomaticSize=Enum.
AutomaticSize.XY cY.BackgroundColor3=Color3.fromRGB(255,255,255)cY.
BackgroundTransparency=1 cY.BorderColor3=Color3.fromRGB(0,0,0)cY.BorderSizePixel
=0 cY.LayoutOrder=2 cY.Position=UDim2.fromScale(0,0.5)cY.Parent=cX local cZ=
Instance.new'UIListLayout'cZ.Name='UIListLayout'cZ.Padding=UDim.new(0,15)cZ.
FillDirection=Enum.FillDirection.Horizontal cZ.SortOrder=Enum.SortOrder.
LayoutOrder cZ.VerticalAlignment=Enum.VerticalAlignment.Center cZ.Parent=cX
local c_=Instance.new'TextBox'c_.Name='InputBox'c_.ClearTextOnFocus=false c_.
CursorPosition=-1 c_.FontFace=Font.new(an.interFont)c_.Text='255'c_.TextColor3=
Color3.fromRGB(255,255,255)c_.TextSize=12 c_.TextTransparency=0.1 c_.
TextXAlignment=Enum.TextXAlignment.Left c_.AnchorPoint=Vector2.new(1,0.5)c_.
BackgroundColor3=Color3.fromRGB(255,255,255)c_.BackgroundTransparency=0.95 c_.
BorderColor3=Color3.fromRGB(0,0,0)c_.BorderSizePixel=0 c_.ClipsDescendants=true
c_.LayoutOrder=1 c_.Position=UDim2.fromScale(1,0.5)c_.Size=UDim2.fromOffset(75,
25)local c0=Instance.new'UICorner'c0.Name='InputBoxUICorner'c0.CornerRadius=UDim
.new(0,4)c0.Parent=c_ local c1=Instance.new'UIStroke'c1.Name='InputBoxUIStroke'
c1.ApplyStrokeMode=Enum.ApplyStrokeMode.Border c1.Color=Color3.fromRGB(255,255,
255)c1.Transparency=0.9 c1.Parent=c_ local c2=Instance.new'UISizeConstraint'c2.
Name='InputBoxUISizeConstraint'c2.Parent=c_ local c3=Instance.new'UIPadding'c3.
Name='InputBoxUIPadding'c3.PaddingLeft=UDim.new(0,8)c3.PaddingRight=UDim.new(0,
10)c3.Parent=c_ c_.Parent=cX cX.Parent=cp cp.Parent=cl local c4=Instance.new
'UIPadding'c4.Name='UIPadding'c4.PaddingRight=UDim.new(0,5)c4.Parent=cl cl.
Parent=cb local c5=Instance.new'Frame'c5.Name='ColorWells'c5.AutomaticSize=Enum.
AutomaticSize.Y c5.BackgroundColor3=Color3.fromRGB(255,255,255)c5.
BackgroundTransparency=1 c5.BorderColor3=Color3.fromRGB(0,0,0)c5.BorderSizePixel
=0 c5.LayoutOrder=2 c5.Size=UDim2.fromScale(1,0)local c6=Instance.new
'UIGridLayout'c6.Name='UIGridLayout'c6.CellPadding=UDim2.fromOffset(10,0)c6.
CellSize=UDim2.new(0.5,-5,0,30)c6.SortOrder=Enum.SortOrder.LayoutOrder c6.Parent
=c5 local c7=Instance.new'ImageLabel'c7.Name='NewColor'c7.Image=an.grid c7.
ScaleType=Enum.ScaleType.Tile c7.TileSize=UDim2.fromOffset(500,500)c7.
BackgroundColor3=Color3.fromRGB(255,255,255)c7.BackgroundTransparency=1 c7.
BorderColor3=Color3.fromRGB(0,0,0)c7.BorderSizePixel=0 c7.Size=UDim2.fromOffset(
100,100)local c8=Instance.new'UICorner'c8.Name='UICorner'c8.Parent=c7 local c9=
Instance.new'Frame'c9.Name='Color'c9.AnchorPoint=Vector2.new(0.5,0.5)c9.
BorderColor3=Color3.fromRGB(27,42,53)c9.BorderSizePixel=0 c9.Position=UDim2.
fromScale(0.5,0.5)c9.Size=UDim2.new(1,1,1,1)local da=Instance.new'UICorner'da.
Name='UICorner'da.Parent=c9 c9.Parent=c7 c7.Parent=c5 local db=Instance.new
'ImageLabel'db.Name='OldColor'db.Image=an.grid db.ScaleType=Enum.ScaleType.Tile
db.TileSize=UDim2.fromOffset(500,500)db.BackgroundColor3=Color3.fromRGB(255,255,
255)db.BackgroundTransparency=1 db.BorderColor3=Color3.fromRGB(0,0,0)db.
BorderSizePixel=0 db.LayoutOrder=1 db.Size=UDim2.fromOffset(100,100)local dc=
Instance.new'UICorner'dc.Name='UICorner'dc.Parent=db local dd=Instance.new
'Frame'dd.Name='Color'dd.AnchorPoint=Vector2.new(0.5,0.5)dd.BorderColor3=Color3.
fromRGB(27,42,53)dd.BorderSizePixel=0 dd.Position=UDim2.fromScale(0.5,0.5)dd.
Size=UDim2.new(1,1,1,1)local de=Instance.new'UICorner'de.Name='UICorner'de.
Parent=dd dd.Parent=db db.Parent=c5 c5.Parent=cb cb.Parent=b6 local df=Instance.
new'Frame'df.Name='Interactions'df.AutomaticSize=Enum.AutomaticSize.Y df.
BackgroundColor3=Color3.fromRGB(0,0,0)df.BackgroundTransparency=1 df.
BorderColor3=Color3.fromRGB(0,0,0)df.BorderSizePixel=0 df.LayoutOrder=2 df.Size=
UDim2.fromScale(1,0)local dg=Instance.new'UIListLayout'dg.Name='UIListLayout'dg.
Padding=UDim.new(0,10)dg.SortOrder=Enum.SortOrder.LayoutOrder dg.Parent=df local
dh=Instance.new'TextButton'dh.Name='Confirm'dh.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.Medium,Enum.FontStyle.Normal)dh.Text=
'Confirm'dh.TextColor3=Color3.fromRGB(255,255,255)dh.TextSize=15 dh.
TextTransparency=0.5 dh.TextTruncate=Enum.TextTruncate.AtEnd dh.AutoButtonColor=
false dh.AutomaticSize=Enum.AutomaticSize.Y dh.BackgroundColor3=Color3.fromRGB(
25,25,25)dh.BorderColor3=Color3.fromRGB(0,0,0)dh.BorderSizePixel=0 dh.Size=UDim2
.fromScale(1,0)local di=Instance.new'UIPadding'di.Name='UIPadding'di.
PaddingBottom=UDim.new(0,9)di.PaddingLeft=UDim.new(0,10)di.PaddingRight=UDim.
new(0,10)di.PaddingTop=UDim.new(0,9)di.Parent=dh local dj=Instance.new'UICorner'
dj.Name='BaseUICorner'dj.CornerRadius=UDim.new(0,10)dj.Parent=dh dh.Parent=df
local dk=Instance.new'TextButton'dk.Name='Cancel'dk.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.Medium,Enum.FontStyle.Normal)dk.Text=
'Cancel'dk.TextColor3=Color3.fromRGB(255,255,255)dk.TextSize=15 dk.
TextTransparency=0.5 dk.TextTruncate=Enum.TextTruncate.AtEnd dk.AutoButtonColor=
false dk.AutomaticSize=Enum.AutomaticSize.Y dk.BackgroundColor3=Color3.fromRGB(
25,25,25)dk.BorderColor3=Color3.fromRGB(0,0,0)dk.BorderSizePixel=0 dk.Size=UDim2
.fromScale(1,0)local dl=Instance.new'UICorner'dl.Name='BaseUICorner'dl.
CornerRadius=UDim.new(0,10)dl.Parent=dk local dm=Instance.new'UIPadding'dm.Name=
'UIPadding'dm.PaddingBottom=UDim.new(0,9)dm.PaddingLeft=UDim.new(0,10)dm.
PaddingRight=UDim.new(0,10)dm.PaddingTop=UDim.new(0,9)dm.Parent=dk dk.Parent=df
local dn=Instance.new'UIPadding'dn.Name='UIPadding'dn.PaddingTop=UDim.new(0,10)
dn.Parent=df df.Parent=b6 local dp=Instance.new'UIPadding'dp.Name=
'GlobalSettingsUIPadding'dp.PaddingBottom=UDim.new(0,20)dp.PaddingLeft=UDim.new(
0,20)dp.PaddingRight=UDim.new(0,20)dp.PaddingTop=UDim.new(0,20)dp.Parent=b6
local dq=Instance.new'Frame'dq.Name='Paragraph'dq.AutomaticSize=Enum.
AutomaticSize.Y dq.BackgroundColor3=Color3.fromRGB(0,0,0)dq.
BackgroundTransparency=1 dq.BorderColor3=Color3.fromRGB(0,0,0)dq.BorderSizePixel
=0 dq.Size=UDim2.fromScale(1,0)local dr=Instance.new'TextLabel'dr.Name=
'ParagraphHeader'dr.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight
.SemiBold,Enum.FontStyle.Normal)dr.RichText=true dr.Text=bW.Settings.Name dr.
TextColor3=Color3.fromRGB(255,255,255)dr.TextSize=18 dr.TextTransparency=0.4 dr.
TextWrapped=true dr.TextYAlignment=Enum.TextYAlignment.Top dr.AutomaticSize=Enum
.AutomaticSize.XY dr.BackgroundColor3=Color3.fromRGB(255,255,255)dr.
BackgroundTransparency=1 dr.BorderColor3=Color3.fromRGB(0,0,0)dr.BorderSizePixel
=0 dr.Size=UDim2.fromScale(1,0)dr.Parent=dq local ds=Instance.new'UIListLayout'
ds.Name='UIListLayout'ds.Padding=UDim.new(0,15)ds.HorizontalAlignment=Enum.
HorizontalAlignment.Center ds.SortOrder=Enum.SortOrder.LayoutOrder ds.Parent=dq
local dt=Instance.new'UIPadding'dt.Name='UIPadding'dt.PaddingBottom=UDim.new(0,
15)dt.Parent=dq local du=Instance.new'Frame'du.Name='Line'du.BackgroundColor3=
Color3.fromRGB(255,255,255)du.BackgroundTransparency=0.9 du.BorderColor3=Color3.
fromRGB(0,0,0)du.BorderSizePixel=0 du.LayoutOrder=1 du.Size=UDim2.new(1,0,0,1)du
.Parent=dq dq.Parent=b6 b6.Parent=b4 b4.Parent=f local dv,dw,dx,dy,dz,dA,dB,dC,
dD,dE,dF,dG,dH,dI,dJ,dK,dL,dM,dN=Color3.fromHSV,Color3.fromRGB,Vector2.new,UDim2
.new,cm,co,cc,c9,{Hex=cX.InputBox,Red=cr.InputBox,Green=cz.InputBox,Blue=cH.
InputBox,Alpha=cP.InputBox},aj:GetMouse(),false,false,0,0,1,function(dv)return
math.atan2(dv.y,dv.x),dv.magnitude end,function(dv)return((dv+math.pi)/(2*math.
pi))*360 end,function(dv)return dv*(math.pi/180)end,function(dv)dv=dv:gsub('#',
'')if#dv~=6 then return 0,0,0 end local dw,dx,dy=tonumber(dv:sub(1,2),16)or 0,
tonumber(dv:sub(3,4),16)or 0,tonumber(dv:sub(5,6),16)or 0 return dw,dx,dy end
local dO=function(dO,dP,dQ)local dR=tonumber(dO)if dR then return math.clamp(dR,
dP,dQ)end return dP end local dP=function()local dP=dv(dH,dI,dJ)dC.
BackgroundColor3=dP dC.BackgroundTransparency=dO(dD.Alpha.Text,0,1)dD.Red.Text=
tostring(math.floor(dP.r*255+0.5))dD.Green.Text=tostring(math.floor(dP.g*255+0.5
))dD.Blue.Text=tostring(math.floor(dP.b*255+0.5))dD.Alpha.Text=dO(dD.Alpha.Text,
0,1)local dQ=string.format('#%02X%02X%02X',math.floor(dP.r*255+0.5),math.floor(
dP.g*255+0.5),math.floor(dP.b*255+0.5))dD.Hex.Text=dQ end local dQ,dR,dS,dT=
function(dQ)local dR=dQ-dB.AbsolutePosition.X local dS=math.clamp(dR,0,dB.
AbsoluteSize.X-ce.AbsoluteSize.X)ce.Position=dy(0,dS,0.5,0)dJ=1-(dS/(dB.
AbsoluteSize.X-ce.AbsoluteSize.X))dP()end,function(dQ,dR)local dS,dT=dz.
AbsoluteSize.x/2,dx(dQ,dR)-dz.AbsolutePosition-dz.AbsoluteSize/2 if dT:Dot(dT)>
dS*dS then dT=dT.unit*dS end dA.Position=dy(0.5,dT.x,0.5,dT.y)local dU,dV=dK(dT*
dx(1,-1))dH,dI=dL(dU)/360,math.clamp(dV/dS,0,1)dB.BackgroundColor3=dv(dH,dI,1)
dP()end,function(dQ)local dR=(1-dQ)*(dB.AbsoluteSize.X-ce.AbsoluteSize.X)ce.
Position=UDim2.new(0,dR,0.5,0)end,function(dQ,dR)local dS,dT=dz.AbsoluteSize.X/2
,dM(dQ*360)local dU=dR*dS local dV,dW=dU*math.cos(dT),dU*math.sin(dT)dA.Position
=UDim2.new(0.5,-dV,0.5,dW)dB.BackgroundColor3=dv(dQ,dR,1)end local dU,dV,dW=
function()local dU,dV,dW=dO(dD.Red.Text,0,255),dO(dD.Green.Text,0,255),dO(dD.
Blue.Text,0,255)dD.Red.Text=dU dD.Green.Text=dV dD.Blue.Text=dW dH,dI,dJ=Color3.
fromRGB(dU,dV,dW):ToHSV()dS(dJ)dT(dH,dI)dP()end,function()local dU=dD.Hex.Text
local dV,dW,dX=dN(dU)dV=dO(dV,0,255)dW=dO(dW,0,255)dX=dO(dX,0,255)dD.Red.Text=dV
dD.Green.Text=dW dD.Blue.Text=dX dH,dI,dJ=Color3.fromRGB(dV,dW,dX):ToHSV()dS(dJ)
dT(dH,dI)dP()end,function()local dU,dV,dW=math.floor(bW.Color.R*255+0.5),math.
floor(bW.Color.G*255+0.5),math.floor(bW.Color.B*255+0.5)dD.Red.Text=dU dD.Green.
Text=dV dD.Blue.Text=dW dD.Alpha.Text=bX and bW.Alpha or 0 local dX=string.
format('#%02X%02X%02X',dU,dV,dW)dD.Hex.Text=dX dH,dI,dJ=Color3.fromRGB(dU,dV,dW)
:ToHSV()dd.BackgroundColor3=bW.Color dd.BackgroundTransparency=bX and bW.Alpha
or 0 dC.BackgroundColor3=Color3.fromRGB(dU,dV,dW)dC.BackgroundTransparency=bX
and bW.Alpha or 0 dS(dJ)dT(dH,dI)end dz.InputBegan:Connect(function(dX)if dX.
UserInputType==Enum.UserInputType.MouseButton1 or dX.UserInputType==Enum.
UserInputType.Touch then dF=true dR(dE.X,dE.Y)end end)dB.InputBegan:Connect(
function(dX)if dX.UserInputType==Enum.UserInputType.MouseButton1 or dX.
UserInputType==Enum.UserInputType.Touch then dG=true dQ(dE.X)end end)dB.
InputEnded:Connect(function(dX)if dX.UserInputType==Enum.UserInputType.
MouseButton1 or dX.UserInputType==Enum.UserInputType.Touch then dG=false end end
)dz.InputEnded:Connect(function(dX)if dX.UserInputType==Enum.UserInputType.
MouseButton1 or dX.UserInputType==Enum.UserInputType.Touch then dF=false end end
)af.InputChanged:Connect(function(dX)if dX.UserInputType==Enum.UserInputType.
MouseMovement or dX.UserInputType==Enum.UserInputType.Touch then if dG then dQ(
dE.X)elseif dF then dR(dE.X,dE.Y)end end end)local dX=function(dX)local dY=dX.
Text dX.Text=''dX.PlaceholderText=dY end dD.Hex.FocusLost:Connect(dV)dD.Red.
FocusLost:Connect(dU)dD.Green.FocusLost:Connect(dU)dD.Blue.FocusLost:Connect(dU)
dD.Alpha.FocusLost:Connect(dP)dD.Hex.Focused:Connect(function()dX(dD.Hex)end)dD.
Red.Focused:Connect(function()dX(dD.Red)end)dD.Green.Focused:Connect(function()
dX(dD.Green)end)dD.Blue.Focused:Connect(function()dX(dD.Blue)end)dD.Alpha.
Focused:Connect(function()dX(dD.Alpha)end)local dY=function()local dY=Instance.
new'CanvasGroup'dY.Name='ColorPickerCanvas'dY.BackgroundTransparency=1 dY.
BorderSizePixel=0 dY.Size=UDim2.fromScale(1,1)dY.ZIndex=5 dY.GroupTransparency=1
dY.Parent=f dY.Visible=false return dY end local dZ=function(dZ)local d_,d0,d1,
d2,d3=dY(),dZ and 0 or 1,dZ and 1 or 0.95,dZ and 1 or 0,TweenInfo.new(0.1,Enum.
EasingStyle.Sine)local d4,d5=at(d_,d3,{GroupTransparency=d0}),at(b7,d3,{Scale=d1
})b4.Visible=true b4.Parent=d_ d_.Visible=true d_.GroupTransparency=d2 d4:Play()
d5:Play()d4.Completed:Wait()if not dZ then b4.Visible=false d_.Visible=false end
b4.Parent=f d_:Destroy()end local d_,d0=function()dZ(true)end,function()dZ(false
)end b2.MouseButton1Click:Connect(d_)dk.MouseButton1Click:Connect(d0)dh.
MouseButton1Click:Connect(function()d0()local d1=dv(dH,dI,dJ)bW.Color=Color3.
fromRGB(d1.r*255,d1.g*255,d1.b*255)bW.Alpha=bX and dO(dD.Alpha.Text,0,1)dd.
BackgroundColor3=bW.Color dd.BackgroundTransparency=bX and bW.Alpha or 0 b0.
BackgroundColor3=bW.Color b0.BackgroundTransparency=bX and bW.Alpha or 0 if bW.
Settings.Callback then task.spawn(function()bW.Settings.Callback(bW.Color,bX and
bW.Alpha)end)end end)dW()function bW:UpdateName(d1)bZ.Text=d1 end function bW:
SetVisibility(d1)bY.Visible=d1 end function bW:SetColor(d1)bW.Color=d1 b0.
BackgroundColor3=d1 local d2,d3,d4=math.floor(bW.Color.R*255+0.5),math.floor(bW.
Color.G*255+0.5),math.floor(bW.Color.B*255+0.5)dD.Red.Text=d2 dD.Green.Text=d3
dD.Blue.Text=d4 local d5=string.format('#%02X%02X%02X',d2,d3,d4)dD.Hex.Text=d5
dH,dI,dJ=Color3.fromRGB(d2,d3,d4):ToHSV()dd.BackgroundColor3=bW.Color dC.
BackgroundColor3=Color3.fromRGB(d2,d3,d4)dS(dJ)dT(dH,dI)if bW.Settings.Callback
then task.spawn(function()bW.Settings.Callback(bW.Color,bX and bW.Alpha)end)end
end function bW:SetAlpha(d1)bW.Alpha=d1 b0.Transparency=d1 dW()end if bV then aa
.Options[bV]=bW end return bW end function bO:Header(bU,bV)local bW,bX={Settings
=bU},Instance.new'Frame'bX.Name='Header'bX.AutomaticSize=Enum.AutomaticSize.Y bX
.BackgroundColor3=Color3.fromRGB(0,0,0)bX.BackgroundTransparency=1 bX.
BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel=0 bX.LayoutOrder=0 bX.Size=
UDim2.fromScale(1,0)bX.Parent=bP local bY=Instance.new'UIPadding'bY.Name=
'UIPadding'bY.PaddingBottom=UDim.new(0,5)bY.Parent=bX local bZ=Instance.new
'TextLabel'bZ.Name='HeaderText'bZ.FontFace=Font.new(an.interFont,Enum.FontWeight
.Medium,Enum.FontStyle.Normal)bZ.RichText=true bZ.Text=bW.Settings.Text or bW.
Settings.Name bZ.TextColor3=Color3.fromRGB(255,255,255)bZ.TextSize=16 bZ.
TextTransparency=0.3 bZ.TextWrapped=true bZ.TextXAlignment=Enum.TextXAlignment.
Left bZ.AutomaticSize=Enum.AutomaticSize.Y bZ.BackgroundColor3=Color3.fromRGB(
255,255,255)bZ.BackgroundTransparency=1 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.
BorderSizePixel=0 bZ.Size=UDim2.fromScale(1,0)bZ.Parent=bX function bW:
UpdateName(b_)bZ.Text=b_ end function bW:SetVisibility(b_)bX.Visible=b_ end if
bV then aa.Options[bV]=bW end return bW end function bO:Label(bU,bV)local bW,bX=
{Settings=bU},Instance.new'Frame'bX.Name='Label'bX.AutomaticSize=Enum.
AutomaticSize.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.
BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel
=0 bX.Size=UDim2.new(1,0,0,38)bX.Parent=bP local bY=Instance.new'TextLabel'bY.
Name='LabelText'bY.FontFace=Font.new(an.interFont)bY.RichText=true bY.Text=bW.
Settings.Text or bW.Settings.Name bY.TextColor3=Color3.fromRGB(255,255,255)bY.
TextSize=13 bY.TextTransparency=0.5 bY.TextWrapped=true bY.TextXAlignment=Enum.
TextXAlignment.Left bY.AutomaticSize=Enum.AutomaticSize.Y bY.BackgroundColor3=
Color3.fromRGB(255,255,255)bY.BackgroundTransparency=1 bY.BorderColor3=Color3.
fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Size=UDim2.fromScale(1,1)bY.Parent=bX
function bW:UpdateName(bZ)bY.Text=bZ end function bW:SetVisibility(bZ)bX.Visible
=bZ end if bV then aa.Options[bV]=bW end return bW end function bO:SubLabel(bU,
bV)local bW,bX={Settings=bU},Instance.new'Frame'bX.Name='SubLabel'bX.
AutomaticSize=Enum.AutomaticSize.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.
BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel
=0 bX.Size=UDim2.new(1,0,0,0)bX.Parent=bP local bY=Instance.new'TextLabel'bY.
Name='SubLabelText'bY.FontFace=Font.new(an.interFont)bY.RichText=true bY.Text=bW
.Settings.Text or bW.Settings.Name bY.TextColor3=Color3.fromRGB(255,255,255)bY.
TextSize=12 bY.TextTransparency=0.7 bY.TextWrapped=true bY.TextXAlignment=Enum.
TextXAlignment.Left bY.AutomaticSize=Enum.AutomaticSize.Y bY.BackgroundColor3=
Color3.fromRGB(255,255,255)bY.BackgroundTransparency=1 bY.BorderColor3=Color3.
fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Size=UDim2.fromScale(1,1)bY.Parent=bX
function bW:UpdateName(bZ)bY.Text=bZ end function bW:SetVisibility(bZ)bX.Visible
=bZ end if bV then aa.Options[bV]=bW end return bW end function bO:Paragraph(bU,
bV)local bW,bX={Settings=bU},Instance.new'Frame'bX.Name='Paragraph'bX.
AutomaticSize=Enum.AutomaticSize.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.
BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel
=0 bX.Size=UDim2.new(1,0,0,38)bX.Parent=bP local bY=Instance.new'TextLabel'bY.
Name='ParagraphHeader'bY.FontFace=Font.new(an.interFont,Enum.FontWeight.Medium,
Enum.FontStyle.Normal)bY.RichText=true bY.Text=bW.Settings.Header bY.TextColor3=
Color3.fromRGB(255,255,255)bY.TextSize=15 bY.TextTransparency=0.4 bY.TextWrapped
=true bY.TextXAlignment=Enum.TextXAlignment.Left bY.AutomaticSize=Enum.
AutomaticSize.Y bY.BackgroundColor3=Color3.fromRGB(255,255,255)bY.
BackgroundTransparency=1 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel
=0 bY.Size=UDim2.fromScale(1,0)bY.Parent=bX local bZ=Instance.new'UIListLayout'
bZ.Name='UIListLayout'bZ.Padding=UDim.new(0,5)bZ.SortOrder=Enum.SortOrder.
LayoutOrder bZ.Parent=bX local b_=Instance.new'TextLabel'b_.Name='ParagraphBody'
b_.FontFace=Font.new(an.interFont)b_.RichText=true b_.Text=bW.Settings.Body b_.
TextColor3=Color3.fromRGB(255,255,255)b_.TextSize=13 b_.TextTransparency=0.5 b_.
TextWrapped=true b_.TextXAlignment=Enum.TextXAlignment.Left b_.AutomaticSize=
Enum.AutomaticSize.Y b_.BackgroundColor3=Color3.fromRGB(255,255,255)b_.
BackgroundTransparency=1 b_.BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel
=0 b_.LayoutOrder=1 b_.Size=UDim2.fromScale(1,0)b_.Parent=bX function bW:
UpdateHeader(b0)bY.Text=b0 end function bW:UpdateBody(b0)b_.Text=b0 end function
bW:SetVisibility(b0)bX.Visible=b0 end if bV then aa.Options[bV]=bW end return bW
end function bO:Divider()local bU,bV={},Instance.new'Frame'bV.Name='Divider'bV.
AnchorPoint=Vector2.new(0,1)bV.AutomaticSize=Enum.AutomaticSize.Y bV.
BackgroundColor3=Color3.fromRGB(255,255,255)bV.BackgroundTransparency=1 bV.
BorderColor3=Color3.fromRGB(0,0,0)bV.BorderSizePixel=0 bV.Position=UDim2.
fromScale(0,1)bV.Size=UDim2.new(1,0,0,1)bV.Parent=bP local bW=Instance.new
'UIPadding'bW.Name='UIPadding'bW.PaddingBottom=UDim.new(0,8)bW.PaddingTop=UDim.
new(0,8)bW.Parent=bV local bX=Instance.new'UIListLayout'bX.Name='UIListLayout'bX
.SortOrder=Enum.SortOrder.LayoutOrder bX.Parent=bV local bY=Instance.new'Frame'
bY.Name='Line'bY.BackgroundColor3=Color3.fromRGB(255,255,255)bY.
BackgroundTransparency=0.9 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.
BorderSizePixel=0 bY.Size=UDim2.new(1,0,0,1)bY.Parent=bV function bU:Remove()bV:
Destroy()end function bU:SetVisibility(bZ)bV.Visible=bZ end return bU end
function bO:Spacer()local bU,bV={},Instance.new'Frame'bV.Name='Spacer'bV.
AnchorPoint=Vector2.new(0,1)bV.BackgroundColor3=Color3.fromRGB(255,255,255)bV.
BackgroundTransparency=1 bV.BorderColor3=Color3.fromRGB(0,0,0)bV.BorderSizePixel
=0 bV.Position=UDim2.fromScale(0,1)bV.Parent=bP function bU:Remove()bV:Destroy()
end function bU:SetVisibility(bW)bV.Visible=bW end return bU end return bO end
local bN=function()local bN=0.15 if ar then ar.Parent=nil end for bO,bP in
pairs(ak)do at(bO,TweenInfo.new(bN,Enum.EasingStyle.Sine),{
BackgroundTransparency=(bO==bx and 0.98 or 1)}):Play()if bP.tabStroke then at(bP
.tabStroke,TweenInfo.new(bN,Enum.EasingStyle.Sine),{Transparency=(bO==bx and
0.95 or 1)}):Play()end if bP.switcherImage then at(bP.switcherImage,TweenInfo.
new(bN,Enum.EasingStyle.Sine),{ImageTransparency=(bO==bx and 0.1 or 0.5)}):Play(
)end if bP.switcherName then at(bP.switcherName,TweenInfo.new(bN,Enum.
EasingStyle.Sine),{TextTransparency=(bO==bx and 0.1 or 0.5)}):Play()end end ak[
bx].tabContent.Parent=aF ar=ak[bx].tabContent a2.Text=bv.Name end bx.
MouseButton1Click:Connect(function()bN()end)function bw:Select()bN()end function
bw:InsertConfigSection(bO)local bP=bw:Section{Side='Left'}if ai then bP:Label{
Text='Config system unavailable. (Environment isStudio)'}return
'Config system unavailable.'end local bQ,bR bP:Input{Name='Config Name',
Placeholder='Name',AcceptedCharacters='All',Callback=function(bS)bQ=bS end}local
bS=bP:Dropdown{Name='Select Config',Multi=false,Required=false,Options=aa:
RefreshConfigList(),Callback=function(bS)bR=bS end}bP:Button{Name=
'Create Config',Callback=function()if not bQ or string.gsub(bQ,' ','')==''then
av:Notify{Title='Interface',Description='Config name cannot be empty.'}return
end local bT,bU=aa:SaveConfig(bQ)if not bT then av:Notify{Title='Interface',
Description='Unable to save config, return error: '..bU}end av:Notify{Title=
'Interface',Description=string.format('Created config %q',bQ)}bS:ClearOptions()
bS:InsertOptions(aa:RefreshConfigList())end}bP:Button{Name='Load Config',
Callback=function()local bT,bU=aa:LoadConfig(bS.Value)if not bT then av:Notify{
Title='Interface',Description='Unable to load config, return error: '..bU}return
end av:Notify{Title='Interface',Description=string.format('Loaded config %q',bS.
Value)}end}bP:Button{Name='Overwrite Config',Callback=function()local bT,bU=aa:
SaveConfig(bS.Value)if not bT then av:Notify{Title='Interface',Description=
'Unable to overwrite config, return error: '..bU}return end av:Notify{Title=
'Interface',Description=string.format('Overwrote config %q',bS.Value)}end}bP:
Button{Name='Refresh Config List',Callback=function()bS:ClearOptions()bS:
InsertOptions(aa:RefreshConfigList())end}local bT bP:Button{Name=
'Set as autoload',Callback=function()local bU=bS.Value writefile(aa.Folder..
'/settings/autoload.txt',bU)bT:UpdateName('Autoload config: '..bU)av:Notify{
Title='Interface',Description=string.format('Set %q as autoload',bU)}end}bT=bP:
Label{Text='Autoload config: None'}if isfile(aa.Folder..'/settings/autoload.txt'
)then local bU=readfile(aa.Folder..'/settings/autoload.txt')bT:UpdateName(
'Autoload config: '..bU)end end ak[bx]={tabContent=bE,tabStroke=bz,switcherImage
=bB,switcherName=bC}return bw end return bp end function av:Notify(bp)local bq,
br={},Instance.new'Frame'br.Name='Notification'br.AnchorPoint=Vector2.new(0.5,
0.5)br.AutomaticSize=Enum.AutomaticSize.Y br.BackgroundColor3=Color3.fromRGB(15,
15,15)br.BorderColor3=Color3.fromRGB(0,0,0)br.BorderSizePixel=0 br.Position=
UDim2.fromScale(0.5,0.5)br.Size=UDim2.fromOffset(bp.SizeX or 250,0)br.Parent=c
local bs=Instance.new'UIStroke'bs.Name='NotificationUIStroke'bs.ApplyStrokeMode=
Enum.ApplyStrokeMode.Border bs.Color=Color3.fromRGB(255,255,255)bs.Transparency=
0.9 bs.Parent=br local bt=Instance.new'UICorner'bt.Name='NotificationUICorner'bt
.CornerRadius=UDim.new(0,10)bt.Parent=br local bu=Instance.new'UIScale'bu.Name=
'NotificationUIScale'bu.Parent=br bu.Scale=0 local bv=Instance.new'Frame'bv.Name
='NotificationInformation'bv.AutomaticSize=Enum.AutomaticSize.Y bv.
BackgroundColor3=Color3.fromRGB(255,255,255)bv.BackgroundTransparency=1 bv.
BorderColor3=Color3.fromRGB(0,0,0)bv.BorderSizePixel=0 bv.Size=UDim2.fromScale(1
,1)local bw=Instance.new'TextLabel'bw.Name='NotificationTitle'bw.FontFace=Font.
new(an.interFont,Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)bw.RichText=true
bw.Text=bp.Title bw.TextColor3=Color3.fromRGB(255,255,255)bw.TextSize=13 bw.
TextTransparency=0.2 bw.TextTruncate=Enum.TextTruncate.SplitWord bw.
TextXAlignment=Enum.TextXAlignment.Left bw.TextYAlignment=Enum.TextYAlignment.
Top bw.AutomaticSize=Enum.AutomaticSize.XY bw.BackgroundColor3=Color3.fromRGB(
255,255,255)bw.BackgroundTransparency=1 bw.BorderColor3=Color3.fromRGB(0,0,0)bw.
BorderSizePixel=0 bw.Size=UDim2.new(1,-12,0,0)local bx=Instance.new'UIPadding'bx
.Name='NotificationTitleUIPadding'bx.PaddingRight=UDim.new(0,25)bx.Parent=bw bw.
Parent=bv local by=Instance.new'TextLabel'by.Name='NotificationDescription'by.
FontFace=Font.new(an.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)by.
Text=bp.Description by.TextColor3=Color3.fromRGB(255,255,255)by.TextSize=11 by.
TextTransparency=0.5 by.TextWrapped=true by.RichText=true by.TextXAlignment=Enum
.TextXAlignment.Left by.TextYAlignment=Enum.TextYAlignment.Top by.AutomaticSize=
Enum.AutomaticSize.XY by.BackgroundColor3=Color3.fromRGB(255,255,255)by.
BackgroundTransparency=1 by.BorderColor3=Color3.fromRGB(0,0,0)by.BorderSizePixel
=0 by.Size=UDim2.new(1,-12,0,0)local bz=Instance.new'UIPadding'bz.Name=
'NotificationDescriptionUIPadding'bz.PaddingRight=UDim.new(0,25)bz.PaddingTop=
UDim.new(0,17)bz.Parent=by by.Parent=bv local bA=Instance.new'UIPadding'bA.Name=
'NotificationUIPadding'bA.PaddingBottom=UDim.new(0,12)bA.PaddingLeft=UDim.new(0,
10)bA.PaddingRight=UDim.new(0,10)bA.PaddingTop=UDim.new(0,10)bA.Parent=bv bv.
Parent=br local bB=Instance.new'Frame'bB.Name='NotificationControls'bB.
AutomaticSize=Enum.AutomaticSize.Y bB.BackgroundColor3=Color3.fromRGB(255,255,
255)bB.BackgroundTransparency=1 bB.BorderColor3=Color3.fromRGB(0,0,0)bB.
BorderSizePixel=0 bB.Size=UDim2.fromScale(1,1)local bC=Instance.new'TextButton'
bC.Name='Interactable'bC.FontFace=Font.new(an.interFont)bC.Text='\u{2713}'bC.
TextColor3=Color3.fromRGB(255,255,255)bC.TextSize=17 bC.TextTransparency=0.2 bC.
AnchorPoint=Vector2.new(1,0.5)bC.AutomaticSize=Enum.AutomaticSize.XY bC.
BackgroundColor3=Color3.fromRGB(255,255,255)bC.BackgroundTransparency=1 bC.
BorderColor3=Color3.fromRGB(0,0,0)bC.BorderSizePixel=0 bC.LayoutOrder=1 bC.
Position=UDim2.fromScale(1,0.5)bC.Parent=bB local bD=Instance.new'UIPadding'bD.
Name='UIPadding'bD.PaddingBottom=UDim.new(0,6)bD.PaddingRight=UDim.new(0,13)bD.
PaddingTop=UDim.new(0,6)bD.Parent=bB bB.Parent=br local bE,bF={In=at(bu,
TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Scale=
bp.Scale or 1}),Out=at(bu,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=0})},{None=function()bC:Destroy()end,Confirm=
function()bC.Text='\u{2713}'end,Cancel=function()bC.Text='\u{2717}'end}local bG=
bF[bp.Style]or function()bC:Destroy()end bG()if bC then bC.MouseButton1Click:
Connect(function()bq:Cancel()if bp.Callback then task.spawn(bp.Callback)end end)
end local bH=task.spawn(function()bE.In:Play()bp.Lifetime=bp.Lifetime or 3 if bp
.Lifetime~=0 then task.wait(bp.Lifetime)local bH=bE.Out bH:Play()bH.Completed:
Wait()br:Destroy()end end)function bq:UpdateTitle(bI)bw.Text=bI end function bq:
UpdateDescription(bI)by.Text=bI end function bq:Resize(bI)local bJ=bI or 250 br.
Size=UDim2.fromOffset(bJ,0)end function bq:Cancel()task.cancel(bH)local bI=bE.
Out bI:Play()bI.Completed:Wait()br:Destroy()end return bq end function av:Dialog
(bp)local bq,br={},Instance.new'CanvasGroup'br.Name='DialogCanvas'br.
BackgroundColor3=Color3.fromRGB(255,255,255)br.BackgroundTransparency=1 br.
BorderColor3=Color3.fromRGB(0,0,0)br.BorderSizePixel=0 br.Size=UDim2.fromScale(1
,1)br.GroupTransparency=1 br.Parent=f local bs=Instance.new'Frame'bs.Name=
'Dialog'bs.BackgroundColor3=Color3.fromRGB(0,0,0)bs.BackgroundTransparency=0.5
bs.BorderColor3=Color3.fromRGB(0,0,0)bs.BorderSizePixel=0 bs.Size=UDim2.
fromScale(1,1)local bt=Instance.new'UICorner'bt.Name='BaseUICorner'bt.
CornerRadius=UDim.new(0,10)bt.Parent=bs local bu=Instance.new'Frame'bu.Name=
'Prompt'bu.AnchorPoint=Vector2.new(0.5,0.5)bu.AutomaticSize=Enum.AutomaticSize.Y
bu.BackgroundColor3=Color3.fromRGB(15,15,15)bu.BorderColor3=Color3.fromRGB(0,0,0
)bu.BorderSizePixel=0 bu.Position=UDim2.fromScale(0.5,0.5)bu.Size=UDim2.
fromOffset(280,0)local bv=Instance.new'UIScale'bv.Name='BaseUIScale'bv.Parent=bu
bv.Scale=0.95 local bw=Instance.new'UIStroke'bw.Name='GlobalSettingsUIStroke'bw.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border bw.Color=Color3.fromRGB(255,255,255)
bw.Transparency=0.9 bw.Parent=bu local bx=Instance.new'UICorner'bx.Name=
'GlobalSettingsUICorner'bx.CornerRadius=UDim.new(0,10)bx.Parent=bu local by=
Instance.new'UIPadding'by.Name='GlobalSettingsUIPadding'by.PaddingBottom=UDim.
new(0,20)by.PaddingLeft=UDim.new(0,20)by.PaddingRight=UDim.new(0,20)by.
PaddingTop=UDim.new(0,20)by.Parent=bu local bz=Instance.new'Frame'bz.Name=
'Paragraph'bz.AutomaticSize=Enum.AutomaticSize.Y bz.BackgroundColor3=Color3.
fromRGB(0,0,0)bz.BackgroundTransparency=1 bz.BorderColor3=Color3.fromRGB(0,0,0)
bz.BorderSizePixel=0 bz.Size=UDim2.new(1,0,0,38)local bA=Instance.new'TextLabel'
bA.Name='ParagraphHeader'bA.FontFace=Font.new(an.interFont,Enum.FontWeight.
Medium,Enum.FontStyle.Normal)bA.RichText=true bA.Text=bp.Title bA.TextColor3=
Color3.fromRGB(255,255,255)bA.TextSize=18 bA.TextTransparency=0.4 bA.TextWrapped
=true bA.AutomaticSize=Enum.AutomaticSize.Y bA.BackgroundColor3=Color3.fromRGB(
255,255,255)bA.BackgroundTransparency=1 bA.BorderColor3=Color3.fromRGB(0,0,0)bA.
BorderSizePixel=0 bA.Size=UDim2.fromScale(1,0)bA.Parent=bz local bB=Instance.new
'UIListLayout'bB.Name='UIListLayout'bB.Padding=UDim.new(0,15)bB.SortOrder=Enum.
SortOrder.LayoutOrder bB.Parent=bz local bC=Instance.new'TextLabel'bC.Name=
'ParagraphBody'bC.FontFace=Font.new(an.interFont)bC.RichText=true bC.Text=bp.
Description bC.TextColor3=Color3.fromRGB(255,255,255)bC.TextSize=14 bC.
TextTransparency=0.5 bC.TextWrapped=true bC.AutomaticSize=Enum.AutomaticSize.Y
bC.BackgroundColor3=Color3.fromRGB(255,255,255)bC.BackgroundTransparency=1 bC.
BorderColor3=Color3.fromRGB(0,0,0)bC.BorderSizePixel=0 bC.LayoutOrder=1 bC.Size=
UDim2.fromScale(1,0)bC.Parent=bz bz.Parent=bu local bD=Instance.new'Frame'bD.
Name='Interactions'bD.AutomaticSize=Enum.AutomaticSize.Y bD.BackgroundColor3=
Color3.fromRGB(0,0,0)bD.BackgroundTransparency=1 bD.BorderColor3=Color3.fromRGB(
0,0,0)bD.BorderSizePixel=0 bD.LayoutOrder=1 bD.Size=UDim2.fromScale(1,0)local bE
=Instance.new'UIListLayout'bE.Name='UIListLayout'bE.Padding=UDim.new(0,10)bE.
SortOrder=Enum.SortOrder.LayoutOrder bE.Parent=bD local bF=Instance.new
'UIPadding'bF.Name='UIPadding'bF.PaddingTop=UDim.new(0,20)bF.Parent=bD bD.Parent
=bu local bG=Instance.new'UIListLayout'bG.Name='UIListLayout'bG.SortOrder=Enum.
SortOrder.LayoutOrder bG.Parent=bu bu.Parent=bs bs.Parent=br local bH,bI,bJ,bK=
at(br,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{GroupTransparency=0}),at(br,
TweenInfo.new(0.1,Enum.EasingStyle.Sine),{GroupTransparency=1}),at(bv,TweenInfo.
new(0.1,Enum.EasingStyle.Sine),{Scale=1}),at(bv,TweenInfo.new(0.1,Enum.
EasingStyle.Sine),{Scale=0.95})local bL,bM=function()bH:Play()bJ:Play()bH.
Completed:Wait()bs.Parent=f end,function()if not bs.Parent then return end bs.
Parent=br bI:Play()bK:Play()bI.Completed:Wait()br:Destroy()end for bN,bO in
pairs(bp.Buttons)do local bP=Instance.new'TextButton'bP.Name='Button'bP.FontFace
=Font.new(an.interFont)bP.Text=bO.Name bP.TextColor3=Color3.fromRGB(255,255,255)
bP.TextSize=15 bP.TextTransparency=0.5 bP.TextTruncate=Enum.TextTruncate.AtEnd
bP.AutoButtonColor=false bP.AutomaticSize=Enum.AutomaticSize.Y bP.
BackgroundColor3=Color3.fromRGB(25,25,25)bP.BorderColor3=Color3.fromRGB(0,0,0)bP
.BorderSizePixel=0 bP.Size=UDim2.fromScale(1,0)local bQ=Instance.new'UIPadding'
bQ.Name='UIPadding'bQ.PaddingBottom=UDim.new(0,9)bQ.PaddingLeft=UDim.new(0,10)bQ
.PaddingRight=UDim.new(0,10)bQ.PaddingTop=UDim.new(0,9)bQ.Parent=bP local bR=
Instance.new'UICorner'bR.Name='BaseUICorner'bR.CornerRadius=UDim.new(0,10)bR.
Parent=bP bP.Parent=bD local bS={DefaultTransparency=0,DefaultTransparency2=0.5,
HoverTransparency=0.3,HoverTransparency2=0.6,EasingStyle=Enum.EasingStyle.Sine}
local bT=function(bT)if bT=='Idle'then at(bP,TweenInfo.new(0.2,bS.EasingStyle),{
BackgroundTransparency=bS.DefaultTransparency,TextTransparency=bS.
DefaultTransparency2}):Play()elseif bT=='Hover'then at(bP,TweenInfo.new(0.2,bS.
EasingStyle),{BackgroundTransparency=bS.HoverTransparency,TextTransparency=bS.
HoverTransparency2}):Play()end end bP.MouseButton1Click:Connect(function()if br.
GroupTransparency~=0 then return end local bU,bV=pcall(function()if bO.Callback
then bO.Callback()end end)bM()if not bU then warn(
'[Dialog] Button callback error: '..tostring(bV))end end)bP.MouseEnter:Connect(
function()bT'Hover'end)bP.MouseLeave:Connect(function()bT'Idle'end)end bL()
function bq:UpdateTitle(bN)bA.Text=bN end function bq:UpdateDescription(bN)bC.
Text=bN end function bq:Cancel()bM()end return bq end function av:
SetNotificationsState(bp)c.Visible=bp end function av:GetNotificationsState(bp)
return c.Visible end function av:SetState(bp)ao=bp f.Visible=bp end function av:
GetState()return ao end local bp function av:Unload()if bp then bp()end b:
Destroy()am=true end function av.onUnloaded(bq)bp=bq end local bq=au.Keybind or
Enum.KeyCode.RightControl local br=function()local br=not av:GetState()av:
SetState(br)av:Notify{Title=au.Title,Description=(br and'Maximized 'or
'Minimized ')..'the menu. Use '..tostring(bq.Name)..' to toggle it.',Lifetime=5}
end af.InputEnded:Connect(function(bs,bt)if bt then return end if bs.KeyCode==bq
then br()end end)v.MouseButton1Click:Connect(br)t.MouseButton1Click:Connect(
function()av:Dialog{Title=au.Title,Description=
[[Are you sure you want to exit the menu? You will lose any unsaved configurations.]]
,Buttons={{Name='Confirm',Callback=function()av:Unload()end},{Name='Cancel'}}}
end)function av:SetKeybind(bs)bq=bs end function av:SetAcrylicBlurState(bs)ap=bs
f.BackgroundTransparency=bs and 0.05 or 0 end function av:GetAcrylicBlurState()
return ap end local bs,bt=function(bs)if bs then W.Image=(V and U)or
'rbxassetid://0'ay.Text='@'..aj.Name _.Text=aj.DisplayName else W.Image=an.
userInfoBlurred local bt,bu=#aj.Name,#aj.DisplayName ay.Text='@'..string.rep('.'
,bt)_.Text=string.rep('.',bu)end end if au.ShowUserInfo~=nil then bt=au.
ShowUserInfo else bt=true end bs(bt)function av:SetUserInfoState(bu)bs(bu)end
function av:GetUserInfoState(bu)return bt end function av:SetSize(bu)f.Size=bu
end function av:GetSize(bu)return f.Size end function av:SetScale(bu)g.Scale=bu
end function av:GetScale()return g.Scale end local bu,bv={Toggle={Save=function(
bu,bv)return{type='Toggle',flag=bu,state=bv.State or false}end,Load=function(bu,
bv)if aa.Options[bu]and bv.state~=nil then aa.Options[bu]:UpdateState(bv.state)
end end},Slider={Save=function(bu,bv)return{type='Slider',flag=bu,value=(bv.
Value and tostring(bv.Value))or false}end,Load=function(bu,bv)if aa.Options[bu]
and bv.value then aa.Options[bu]:UpdateValue(bv.value)end end},Input={Save=
function(bu,bv)return{type='Input',flag=bu,text=bv.Text}end,Load=function(bu,bv)
if aa.Options[bu]and bv.text and type(bv.text)=='string'then aa.Options[bu]:
UpdateText(bv.text)end end},Keybind={Save=function(bu,bv)return{type='Keybind',
flag=bu,bind=(typeof(bv.Bind)=='EnumItem'and bv.Bind.Name)or nil}end,Load=
function(bu,bv)if aa.Options[bu]and bv.bind then aa.Options[bu]:Bind(Enum.
KeyCode[bv.bind])end end},Dropdown={Save=function(bu,bv)return{type='Dropdown',
flag=bu,value=bv.Value}end,Load=function(bu,bv)if aa.Options[bu]and bv.value
then aa.Options[bu]:UpdateSelection(bv.value)end end},Colorpicker={Save=function
(bu,bv)local bw=function(bw)return string.format('#%02X%02X%02X',math.floor(bw.R
*255),math.floor(bw.G*255),math.floor(bw.B*255))end return{type='Colorpicker',
flag=bu,color=bw(bv.Color)or nil,alpha=bv.Alpha}end,Load=function(bu,bv)local bw
=function(bw)local bx,by,bz=tonumber(bw:sub(2,3),16)/255,tonumber(bw:sub(4,5),16
)/255,tonumber(bw:sub(6,7),16)/255 return Color3.new(bx,by,bz)end if aa.Options[
bu]and bv.color then aa.Options[bu]:SetColor(bw(bv.color))if bv.alpha then aa.
Options[bu]:SetAlpha(bv.alpha)end end end}},function()if ai or not(isfolder and
makefolder)then return'Config system unavailable.'end local bu={aa.Folder,aa.
Folder..'/settings'}for bv=1,#bu do local bw=bu[bv]if not isfolder(bw)then
makefolder(bw)end end end function aa:LoadAutoLoadConfig()if ai or not(isfile
and readfile)then return'Config system unavailable.'end if isfile(aa.Folder..
'/settings/autoload.txt')then local bw=readfile(aa.Folder..
'/settings/autoload.txt')local bx,by=aa:LoadConfig(bw)if not bx then av:Notify{
Title='Interface',Description='Error loading autoload config: '..by}end av:
Notify{Title='Interface',Description=string.format('Autoloaded config: %q',bw)}
end end function aa:SetFolder(bw)if ai then return'Config system unavailable.'
end aa.Folder=bw bv()end function aa:SaveConfig(bw)if ai or not writefile then
return'Config system unavailable.'end if(not bw)then return false,
'Please select a config file.'end local bx,by=aa.Folder..'/settings/'..bw..
'.json',{objects={},contextData=aa.contextData or{}}for bz,bA in next,aa.Options
do if not bu[bA.Class]then continue end if bA.IgnoreConfig then continue end
table.insert(by.objects,bu[bA.Class].Save(bz,bA))end local bz,bA=pcall(ad.
JSONEncode,ad,by)if not bz then return false,'Unable to encode into JSON data'
end writefile(bx,bA)return true end function aa:LoadConfig(bw)if ai or not(
isfile and readfile)then return'Config system unavailable.'end if(not bw)then
return false,'Please select a config file.'end local bx=aa.Folder..'/settings/'
..bw..'.json'if not isfile(bx)then return false,'Invalid file'end local by,bz=
pcall(ad.JSONDecode,ad,readfile(bx))if not by then return false,
'Unable to decode JSON data.'end aa.LoadingConfig=true aa.contextData=bz.
contextData or{}for bA,bB in next,bz.objects do if bu[bB.type]then pcall(
function()bu[bB.type].Load(bB.flag,bB)end)end end task.delay(1,function()aa.
LoadingConfig=false end)return true end function aa:RefreshConfigList()if ai or
not(isfolder and listfiles)then return'Config system unavailable.'end local bw,
bx=(isfolder(aa.Folder)and isfolder(aa.Folder..'/settings'))and listfiles(aa.
Folder..'/settings')or{},{}for by=1,#bw do local bz=bw[by]if bz:sub(-5)=='.json'
then local bA=bz:find('.json',1,true)local bB,bC=bA,bz:sub(bA,bA)while bC~='/'
and bC~='\\'and bC~=''do bA=bA-1 bC=bz:sub(bA,bA)end if bC=='/'or bC=='\\'then
local bD=bz:sub(bA+1,bB-1)if bD~='options'then table.insert(bx,bD)end end end
end return bx end b.Enabled=false local bw={}for bx,by in pairs(an)do table.
insert(bw,by)end ae:PreloadAsync(bw)b.Enabled=true ao=true return av end
function aa:Demo()local au=aa:Window{Title='Maclib Demo',Subtitle=
'This is a subtitle.',Size=UDim2.fromOffset(868,650),DragStyle=1,
DisabledWindowControls={},ShowUserInfo=true,Keybind=Enum.KeyCode.RightControl,
AcrylicBlur=true}local av,aw={UIBlurToggle=au:GlobalSetting{Name='UI Blur',
Default=au:GetAcrylicBlurState(),Callback=function(av)au:SetAcrylicBlurState(av)
au:Notify{Title=au.Settings.Title,Description=(av and'Enabled'or'Disabled')..
' UI Blur',Lifetime=5}end},NotificationToggler=au:GlobalSetting{Name=
'Notifications',Default=au:GetNotificationsState(),Callback=function(av)au:
SetNotificationsState(av)au:Notify{Title=au.Settings.Title,Description=(av and
'Enabled'or'Disabled')..' Notifications',Lifetime=5}end},ShowUserInfo=au:
GlobalSetting{Name='Show User Info',Default=au:GetUserInfoState(),Callback=
function(av)au:SetUserInfoState(av)au:Notify{Title=au.Settings.Title,Description
=(av and'Showing'or'Redacted')..' User Info',Lifetime=5}end}},{TabGroup1=au:
TabGroup()}local ax={Main=aw.TabGroup1:Tab{Name='Demo',Image=
'rbxassetid://18821914323'},Settings=aw.TabGroup1:Tab{Name='Settings',Image=
'rbxassetid://10734950309'}}local ay={MainSection1=ax.Main:Section{Side='Left'}}
ay.MainSection1:Header{Name='Header #1'}ay.MainSection1:Button{Name='Button',
Callback=function()au:Dialog{Title=au.Settings.Title,Description=
[[Lorem ipsum odor amet, consectetuer adipiscing elit. Eros vestibulum aliquet mattis, ex platea nunc.]]
,Buttons={{Name='Confirm',Callback=function()print'Confirmed!'end},{Name=
'Cancel'}}}end}ay.MainSection1:Input({Name='Input',Placeholder='Input',
AcceptedCharacters='All',Callback=function(az)au:Notify{Title=au.Settings.Title,
Description='Successfully set input to '..az}end,onChanged=function(az)print(
'Input is now '..az)end},'Input')ay.MainSection1:Slider({Name='Slider',Default=
50,Minimum=0,Maximum=100,DisplayMethod='Percent',Precision=0,Callback=function(
az)print('Changed to '..az)end},'Slider')ay.MainSection1:Toggle({Name='Toggle',
Default=false,Callback=function(az)au:Notify{Title=au.Settings.Title,Description
=(az and'Enabled 'or'Disabled ')..'Toggle'}end},'Toggle')ay.MainSection1:
Keybind({Name='Keybind',Blacklist=false,Callback=function(az)au:Notify{Title=
'Demo Window',Description='Pressed keybind - '..tostring(az.Name),Lifetime=3}end
,onBinded=function(az)au:Notify{Title='Demo Window',Description=
'Successfully Binded Keybind to - '..tostring(az.Name),Lifetime=3}end},'Keybind'
)ay.MainSection1:Colorpicker({Name='Colorpicker',Default=Color3.fromRGB(0,255,
255),Callback=function(az)print('Color: ',az)end},'Colorpicker')local az,aA,aB,
aC=ay.MainSection1:Colorpicker({Name='Transparency Colorpicker',Default=Color3.
fromRGB(255,0,0),Alpha=0,Callback=function(az,aA)print('Color: ',az,' Alpha: ',
aA)end},'TransparencyColorpicker'),0 ay.MainSection1:Toggle({Name='Rainbow',
Default=false,Callback=function(aD)aB=aD if aB then aC=game:GetService
'RunService'.RenderStepped:Connect(function(aE)aA=(aA+aE*0.1)%1 az:SetColor(
Color3.fromHSV(aA,1,1))end)elseif aC then aC:Disconnect()aC=nil end end},
'RainbowToggle')local aD={'Apple','Banana','Orange','Grapes','Pineapple','Mango'
,'Strawberry','Blueberry','Watermelon','Peach'}local aE,aF=ay.MainSection1:
Dropdown({Name='Dropdown',Multi=false,Required=true,Options=aD,Default=1,
Callback=function(aE)print('Dropdown changed: '..aE)end},'Dropdown'),ay.
MainSection1:Dropdown({Name='Multi Dropdown',Search=true,Multi=true,Required=
false,Options=aD,Default={'Apple','Orange'},Callback=function(aE)local aF={}for
aG,aH in next,aE do table.insert(aF,aG)end print('Mutlidropdown changed:',table.
concat(aF,', '))end},'MultiDropdown')ay.MainSection1:Button{Name=
'Update Selection',Callback=function()aE:UpdateSelection'Grapes'aF:
UpdateSelection{'Banana','Pineapple'}end}ay.MainSection1:Divider()ay.
MainSection1:Header{Text='Header #2'}ay.MainSection1:Paragraph{Header=
'Paragraph',Body=
[[Paragraph body. Lorem ipsum odor amet, consectetuer adipiscing elit. Morbi tempus netus aliquet per velit est gravida.]]
}ay.MainSection1:Label{Text=
'Label. Lorem ipsum odor amet, consectetuer adipiscing elit.'}ay.MainSection1:
SubLabel{Text=
[[Sub-Label. Lorem ipsum odor amet, consectetuer adipiscing elit.]]}aa:SetFolder
'Maclib'ax.Settings:InsertConfigSection'Left'au.onUnloaded(function()print
'Unloaded!'end)ax.Main:Select()aa:LoadAutoLoadConfig()end return aa end function
a.m()local aa,ab={}function aa:SetWindow(ac)ab=ac end function aa.Notify(ac,ad,
ae)ae=ae or 3 if ab then local af=pcall(function()ab:Notify{Title=ac,Description
=ad,Lifetime=ae}end)if af then return end end pcall(function()game:GetService
'StarterGui':SetCore('SendNotification',{Title=ac,Text=ad,Duration=ae})end)end
return aa end function a.n()local aa,ab,ac,ad,ae,af=a.load'l',a.load'm',{},false
,false function ac.Suspend()ae=true ad=false end function ac.Resume()ae=false
end function ac.IsSuspended()return ae or(aa.LoadingConfig==true)end function ac
.SetActive(ag)af=(typeof(ag)=='string'and#ag>0)and ag or nil end function ac.
GetActive()return af end local ag=function()if af then return af end local ag=aa
.Folder local ah=ag..'/settings/autoload.txt'if isfile and isfile(ah)then local
ai,aj=pcall(readfile,ah)if ai and typeof(aj)=='string'and#aj>0 then af=aj return
af end end af='Default'pcall(function()if writefile and makefolder and isfolder
then if not isfolder(ag)then makefolder(ag)end if not isfolder(ag..'/settings')
then makefolder(ag..'/settings')end if not isfile(ah)then writefile(ah,'Default'
)end end end)return af end function ac.SaveNow()if ac.IsSuspended()then return
end local ah=ag()if not ah then return end local ai,aj=aa:SaveConfig(ah)if not
ai and aj and aj~='Please select a config file.'then ab.Notify('AutoSave',
'Kh\u{f4}ng l\u{1b0}u \u{111}\u{1b0}\u{1ee3}c config: '..tostring(aj),3)end end
function ac.Save()if ac.IsSuspended()then return end if not ag()then return end
if ad then return end ad=true task.delay(0.5,function()ad=false if not ac.
IsSuspended()and ac.GetActive()then ac.SaveNow()end end)end function ac.Wrap(ah)
if type(ah)~='function'then return ah end return function(...)ah(...)ac.Save()
end end return ac end function a.o()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'l',a
.load'n',a.load'c',{},{Mob={Min=15,Max=35,BossArea=false,BossAreaRadius=80},
Boss1={Min=25,Max=50,BossArea=false,BossAreaRadius=80},Boss2={Min=25,Max=50,
BossArea=false,BossAreaRadius=80},Boss3={Min=25,Max=50,BossArea=false,
BossAreaRadius=80}},{Normal='Mob',['Boss 1']='Boss1',['Boss 2']='Boss2',[
'Boss 3']='Boss3'},{Mob='Normal',Boss1='Boss 1',Boss2='Boss 2',Boss3='Boss 3'},{
},{}function ad.GetTargetDisplay(aj)return ag[aj]or'Normal'end function ad.
GetTargetKey(aj)return af[aj]or'Mob'end function ad.GetTargetOptions()return{
'Normal','Boss 1','Boss 2','Boss 3'}end function ad.GetSaveData()return ah end
function ad.LoadData(aj)if type(aj)=='table'then ah=aj else ah={}end aa.
contextData=ah for ak,al in ipairs(ai)do pcall(al)end end function ad.
OnDataChanged(aj)if type(aj)~='function'then return function()end end table.
insert(ai,aj)return function()for ak,al in ipairs(ai)do if al==aj then table.
remove(ai,ak)break end end end end local aj=function()aa.contextData=ah ab.Save(
)end function ad.GetCombatDistances(ak,al)local am=al or'Mob'local an=ae[am]or
ae.Mob if type(ak)=='string'and#ak>0 and ah[ak]and ah[ak][am]then local ao=ah[ak
][am]local ap,aq=(type(ao.Min)=='number'and ao.Min>0)and ao.Min or an.Min,(type(
ao.Max)=='number'and ao.Max>0)and ao.Max or an.Max return ap,aq end return an.
Min,an.Max end function ad.GetActiveCombatDistances(ak)local al,am,an=ac.
GetCurrentDungeonName(),'Mob',false if ac.IsBossActive and ac.IsBossActive()then
an=true am=ac.GetCombatTargetKey()elseif ak then if ak.Room and type(ak.Room.
Name)=='string'and string.find(string.lower(ak.Room.Name),'boss')then an=true
elseif ak.Model then local ao=string.lower(ak.Model.Name)if string.find(ao,
'boss')then an=true else local ap=ak.Model.Parent if ap and string.find(string.
lower(ap.Name),'boss')then an=true end end end if an then local ao=ac.
GetCurrentBossIndex and ac.GetCurrentBossIndex()or 1 am='Boss'..tostring(math.
clamp(ao,1,3))end end return ad.GetCombatDistances(al,am)end function ad.
GetBossArea(ak,al)local am=al or'Mob'if am=='Mob'then return false,80 end local
an=ae[am]or ae.Boss1 if type(ak)=='string'and#ak>0 and ah[ak]and ah[ak][am]then
local ao=ah[ak][am]local ap,aq=ao.BossArea==true,(type(ao.BossAreaRadius)==
'number'and ao.BossAreaRadius>0)and ao.BossAreaRadius or(an.BossAreaRadius or 80
)return ap,aq end return an.BossArea or false,an.BossAreaRadius or 80 end
function ad.SetBossAreaEnabled(ak,al,am)if not(type(ak)=='string'and#ak>0)then
return end local an=al or'Mob'if an=='Mob'then return end ah[ak]=ah[ak]or{}ah[ak
][an]=ah[ak][an]or{}ah[ak][an].BossArea=am and true or false aj()end function ad
.SetBossAreaRadius(ak,al,am)if not(type(ak)=='string'and#ak>0)then return end
local an=al or'Mob'if an=='Mob'then return end if type(am)~='number'or am<=0
then return end ah[ak]=ah[ak]or{}ah[ak][an]=ah[ak][an]or{}ah[ak][an].
BossAreaRadius=am aj()end function ad.GetActiveBossArea(ak)local al,am,an=ac.
GetCurrentDungeonName(),'Mob',false if ac.IsBossActive and ac.IsBossActive()then
an=true am=ac.GetCombatTargetKey()elseif ak then if ak.Room and type(ak.Room.
Name)=='string'and string.find(string.lower(ak.Room.Name),'boss')then an=true
elseif ak.Model then local ao=string.lower(ak.Model.Name)if string.find(ao,
'boss')then an=true else local ap=ak.Model.Parent if ap and string.find(string.
lower(ap.Name),'boss')then an=true end end end if an then local ao=ac.
GetCurrentBossIndex and ac.GetCurrentBossIndex()or 1 am='Boss'..tostring(math.
clamp(ao,1,3))end end if not an or am=='Mob'then return false,0,nil end local ao
,ap=ad.GetBossArea(al,am)if not ao then return false,ap,nil end local aq=ac.
GetBossSpawnPosition and ac.GetBossSpawnPosition()if not aq and ak and ak.Root
then aq=ak.Root.Position if ac.SetBossSpawnPosition then ac.
SetBossSpawnPosition(aq)end end return ao,ap,aq end function ad.
SetMinCombatDistance(ak,al,am)if not(type(ak)=='string'and#ak>0)then return end
local an=al or'Mob'if type(am)~='number'or am<=0 then return end ah[ak]=ah[ak]or
{}ah[ak][an]=ah[ak][an]or{}local ao=ah[ak][an].Max or(ae[an]or ae.Mob).Max ah[ak
][an].Min=am if am>ao then ah[ak][an].Max=am+5 end aj()end function ad.
SetMaxCombatDistance(ak,al,am)if not(type(ak)=='string'and#ak>0)then return end
local an=al or'Mob'if type(am)~='number'or am<=0 then return end ah[ak]=ah[ak]or
{}ah[ak][an]=ah[ak][an]or{}local ao=ah[ak][an].Min or(ae[an]or ae.Mob).Min ah[ak
][an].Max=am if am<ao then ah[ak][an].Min=math.max(1,am-5)end aj()end function
ad.ResetTarget(ak,al)if not(type(ak)=='string'and#ak>0)then return end local am=
al or'Mob'if ah[ak]then ah[ak][am]=nil if next(ah[ak])==nil then ah[ak]=nil end
aj()end end function ad.ResetDungeon(ak)if not(type(ak)=='string'and#ak>0)then
return end if ah[ak]then ah[ak]=nil aj()end end return ad end function a.p()
local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'b',a.load'c',a.load'a',a.load'd',a.load
'g',a.load'i',a.load'j',a.load'k',a.load'o'local aj,ak,al,am,an,ao,ap,aq,ar,as,
at,au,av,aw,ax,ay,az,aA=aa.RunService or game:GetService'RunService',game:
GetService'Players',aa.player,{},true,true,true,2,0,false,{},{},0 local aB,aC,aD
=function()local aB=al or ak.LocalPlayer if not aB then return nil end local aC=
aB.Character if not aC or not aC.Parent then return nil end local aD=aC:
FindFirstChildOfClass'Humanoid'if aD and aD.Health<=0 then return nil end return
aC:FindFirstChild'HumanoidRootPart'or aC.PrimaryPart end,function(aB)local aC=al
or ak.LocalPlayer if not aC then return nil end local aD=aC.Character if not aD
or not aD.Parent then return nil end local aE=aD:FindFirstChildOfClass'Humanoid'
if aE and aE.Health>0 then local aF=aE.MoveDirection if aF and aF.Magnitude>0.1
then return Vector3.new(aF.X,0,aF.Z).Unit end end if aB and aB.Parent then local
aF=Vector3.zero pcall(function()aF=aB.AssemblyLinearVelocity or aB.Velocity or
Vector3.zero end)local aG=Vector3.new(aF.X,0,aF.Z)if aG.Magnitude>=2 then return
aG.Unit end end return nil end,function(aB)if not aB then return 0 end return aB
.Position.Y-2.5 end function am.IsPointSafe(aE,aF)if not aE then return false
end local aG,aH,aI,aJ=Vector3.new(aE.X,0,aE.Z),ai.GetActiveBossArea()if aH and
aJ and aI and aI>0 then local aK=Vector3.new(aJ.X,0,aJ.Z)if(aG-aK).Magnitude>aI
then return false end end local aK=(af.GetRadius and af.GetRadius()or 1.8)+(aF
or 0)if ad.IsPointInAnyHazard and ad.IsPointInAnyHazard(aG,nil,aK)then return
false end if ae.IsPointInAnyTrajectory and ae.IsPointInAnyTrajectory(aG,aK)then
return false end return true end function am.FindNearestSafeSpot(aE)local aF=aB(
)if not aE then if not aF then return nil,false,0,Vector3.zero end aE=aF.
Position end local aG,aH=Vector3.new(aE.X,0,aE.Z),aC(aF)table.clear(au)local aI,
aJ,aK=ai.GetActiveBossArea()local aL,aM,aN=(aI and aK and aJ and aJ>0)and
Vector3.new(aK.X,0,aK.Z)or nil,ad.GetNearbyHazards and ad.GetNearbyHazards(aG,65
)or nil,ae.GetNearbyTrajectories and ae.GetNearbyTrajectories(aG,65)or nil local
aO=function(aO,aP)if not aO then return false end local aQ=Vector3.new(aO.X,0,aO
.Z)if aL and aJ then local aR=(aQ-aL).Magnitude if aR>aJ then return false end
end local aR=(af.GetRadius and af.GetRadius()or 1.8)+(aP or 0)if ad.
IsPointInAnyHazard and ad.IsPointInAnyHazard(aQ,nil,aR,aM)then return false end
if ae.IsPointInAnyTrajectory and ae.IsPointInAnyTrajectory(aQ,aR,aN)then return
false end return true end if(aM and#aM==0 and aN and#aN==0 and not aL)or aO(aG,0
)then table.insert(au,{pos=aG,isSafe=true,isChosen=true})return aG,true,0,
Vector3.zero end local aP,aQ=aH,af.GetRadius and af.GetRadius()or 1.8 local aR,
aS,aT,aU=ae.IsPointInAnyTrajectory(aG,aQ,aN)if aR and aT and aU then local aV,aW
,aX=Vector3.new(-aT.Z,0,aT.X),Vector3.new(aT.Z,0,-aT.X),aG-aU local aY=aX.X*aV.X
+aX.Z*aV.Z local aZ=aY>=0 and aV or aW if aH and aH.Magnitude>0.1 then local a_,
a0=aH.X*aV.X+aH.Z*aV.Z,aH.X*aW.X+aH.Z*aW.Z if a_>a0+0.3 then aZ=aV elseif a0>a_+
0.3 then aZ=aW end end local a_=0.45 if aH and aH.Magnitude>0.1 then local a0,a1
=-(aH.X*aT.X+aH.Z*aT.Z),math.abs(aH.X*aZ.X+aH.Z*aZ.Z)if a1>0.05 then local a2=a0
/a1 a_=math.clamp(a2,0.18,1)elseif a0>0 then a_=1 else a_=0.18 end end local a0=
(aZ-a_*aT).Unit aP=a0 elseif aL and(aG-aL).Magnitude>aJ then aP=(aL-aG).Unit end
local aV,aW,aX,aY=ag.SamplePass(aG,ag.COARSE_DIRECTIONS,ag.COARSE_RADII,aq,true,
aO,au,aP)if not aW then aV,aW,aX,aY=ag.SamplePass(aG,ag.FINE_DIRECTIONS,ag.
FINE_RADII,aq,true,aO,au,aP)end if not aW then aV,aW,aX,aY=ag.SamplePass(aG,ag.
FINE_DIRECTIONS,ag.FINE_RADII,0,false,aO,au,aP)end if aW and aV then for aZ,a_
in ipairs(au)do if(a_.pos-aV).Magnitude<0.25 then a_.isChosen=true break end end
return aV,true,aX,aY end return aG,false,math.huge,Vector3.zero end local aE=
function()if not an then ah.Hide()return end local aE=aB()if not aE or not aE.
Parent then ah.Hide()return end local aF,aG,aH=false if af.IsPlayerInDanger then
aF,aG,aH=af.IsPlayerInDanger()end local aI=aF or(aw~=nil)or as if not aI then
local aJ=os.clock()if aJ-av<0.05 then return end av=aJ end local aJ,aK=aD(aE),
Vector3.new(aE.Position.X,0,aE.Position.Z)if aF then local aL,aM,aN=aw and(aw-aK
).Magnitude or 0,aw and am.IsPointSafe(aw),(aG==ax and aH==ay)if not aM or not
aN or not aw then local aO,aP,aQ,aR=am.FindNearestSafeSpot(aE.Position)if aP and
aO then aw=aO ax=aG ay=aH ar=aQ as=true ah.Update(aE,aO,aJ,au,ao,ap)for aS,aT in
ipairs(at)do pcall(aT,true,aO,aQ)end else ah.Hide()end else ar=aL ah.Update(aE,
aw,aJ,au,ao,ap)for aO,aP in ipairs(at)do pcall(aP,true,aw,aL)end end else local
aL,aM=aw and(aw-aK).Magnitude or 0,aw and am.IsPointSafe(aw)if aM and aL>0.8
then ar=aL ah.Update(aE,aw,aJ,au,ao,ap)for aN,aO in ipairs(at)do pcall(aO,true,
aw,aL)end else if as or aw then as=false aw=nil ax=nil ay=nil ar=0 ah.Hide()for
aN,aO in ipairs(at)do pcall(aO,false,nil,0)end end end end end local aF=function
()if not az then az=aj.Heartbeat:Connect(aE)end if not aA and af.
OnDangerStatusChanged then aA=af.OnDangerStatusChanged(function(aF)if aF and an
then aE()end end)end end function am.Clear()if as or aw then as=false aw=nil ax=
nil ay=nil ar=0 table.clear(au)ah.Hide()for aG,aH in ipairs(at)do pcall(aH,false
,nil,0)end end end function am.Cleanup()if az then az:Disconnect()az=nil end ah.
Cleanup()table.clear(au)aw=nil ax=nil ay=nil ar=0 as=false av=0 end function am.
GetLastSafeSpot()return aw,ar,as end function am.OnSafeSpotChanged(aG)if type(aG
)=='function'then table.insert(at,aG)end end function am.SetVisualEnabled(aG)ao=
aG and true or false if not ao then ah.Hide()end end function am.IsVisualEnabled
()return ao end function am.SetShowCandidates(aG)ap=aG and true or false if not
ap then ah.HideCandidates()end end function am.IsShowCandidates()return ap end
function am.SetEnabled(aG)an=aG and true or false if not an then ah.Hide()end
end function am.IsEnabled()return an end function am.SetSafetyBuffer(aG)if type(
aG)=='number'and aG>=0 then aq=aG end end function am.GetSafetyBuffer()return aq
end local aG=function()local aG=al or ak.LocalPlayer if not aG then return end
aG.CharacterAdded:Connect(function()am.Clear()end)end aG()if ab.
OnRoomIndexChanged then ab.OnRoomIndexChanged(function()am.Clear()end)end if ab.
OnEnemyChanged then ab.OnEnemyChanged(function()if ab.GetEnemyCount and ab.
GetEnemyCount()==0 then am.Clear()end end)end if ab.OnLobbyChanged then ab.
OnLobbyChanged(function()am.Clear()end)end if ab.OnBossActiveChanged then ab.
OnBossActiveChanged(function()am.Clear()end)end aF()ac.Register(function()am.
Cleanup()end)return am end function a.q()local aa,ab,ac,ad,ae=a.load'b',a.load
'c',a.load'a',a.load'i',a.load'p'local af,ag,ah,ai,aj,ak,al,am,an,ao=aa.
RunService or game:GetService'RunService',game:GetService'Players',aa.player,{},
false,2,false,{}local ap,aq=function()local ap=ah or ag.LocalPlayer if not ap
then return nil,nil,nil end local aq=ap.Character if not aq or not aq.Parent
then return nil,nil,nil end local ar=aq:FindFirstChildOfClass'Humanoid'if ar and
ar.Health<=0 then return nil,nil,nil end local as=aq:FindFirstChild
'HumanoidRootPart'or aq.PrimaryPart if not as then return nil,nil,nil end return
aq,ar,as end,function(ap,aq)if ap and aq and aq.Parent then pcall(function()ap:
MoveTo(aq.Position)end)end end local ar=function()if not aj then if al or an
then an=nil al=false local ar,as,at=ap()aq(as,at)for au,av in ipairs(am)do
pcall(av,false,nil,0)end end return end local ar,as,at=ap()if not ar or not as
or not at then if al or an then an=nil al=false for au,av in ipairs(am)do pcall(
av,false,nil,0)end end return end if ab.IsInvulnerable and ab.IsInvulnerable()
then if al or an then an=nil al=false local au,av,aw=ap()aq(av,aw)for ax,ay in
ipairs(am)do pcall(ay,false,nil,0)end end return end local au,av,aw,ax=ad.
IsPlayerInDanger and ad.IsPlayerInDanger(),ae.GetLastSafeSpot()if av then an=av
end local ay=an and ae.IsPointSafe and ae.IsPointSafe(an)if an and ay then local
az=at.Position local aA=Vector3.new(an.X-az.X,0,an.Z-az.Z)local aB=aA.Magnitude
if aB<=ak then local aC,aD=at.CFrame,Vector3.new(an.X,az.Y,an.Z)local aE=CFrame.
new(aD)*(aC-aC.Position)ar:PivotTo(aE)aq(as,at)local aF=an an=nil if al then al=
false for aG,aH in ipairs(am)do pcall(aH,false,aF,aB)end end else local aC=
Vector3.new(an.X,az.Y,an.Z)as:MoveTo(aC)if not al then al=true for aD,aE in
ipairs(am)do pcall(aE,true,an,aB)end end end else if al or an then an=nil al=
false aq(as,at)for az,aA in ipairs(am)do pcall(aA,false,nil,0)end end end end
local as=function()if not ao then ao=af.Heartbeat:Connect(ar)end end function ai
.Clear()if al or an then an=nil al=false local at,au,av=ap()aq(au,av)for aw,ax
in ipairs(am)do pcall(ax,false,nil,0)end end end function ai.Cleanup()if ao then
ao:Disconnect()ao=nil end ai.Clear()end function ai.SetEnabled(at)aj=at and true
or false if not aj then local au,av,aw=ap()aq(av,aw)an=nil al=false end end
function ai.IsEnabled()return aj end function ai.SetSnapDistance(at)if type(at)
=='number'and at>=0.5 then ak=at end end function ai.GetSnapDistance()return ak
end function ai.IsDodging()return al end function ai.OnDodgeStateChanged(at)if
type(at)=='function'then table.insert(am,at)end end if ab.OnRoomIndexChanged
then ab.OnRoomIndexChanged(function()ai.Clear()end)end if ab.OnEnemyChanged then
ab.OnEnemyChanged(function()if ab.GetEnemyCount and ab.GetEnemyCount()==0 then
ai.Clear()end end)end if ab.OnLobbyChanged then ab.OnLobbyChanged(function()ai.
Clear()end)end if ab.OnBossActiveChanged then ab.OnBossActiveChanged(function()
ai.Clear()end)end as()ac.Register(function()ai.Cleanup()end)return ai end end
local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.load'a',a.load'h',a.load'd',a.load'e',a.
load'g',a.load'i',a.load'p',a.load'q',a.load'f',{}ac.BindDetection(ab)ad.
BindDetection(ab)ae.BindDetection(ab)ai.BindDetection(ab)aj.IsPointInAnyHazard=
ac.IsPointInAnyHazard aj.GetHazardPadding=ac.GetHazardPadding aj.
SetHazardPadding=ac.SetHazardPadding aj.GetHitboxPadding=ac.GetHazardPadding aj.
SetHitboxPadding=ac.SetHazardPadding aj.GetTrajectoryMargin=ac.
GetTrajectoryMargin aj.SetTrajectoryMargin=ac.SetTrajectoryMargin aj.
GetHazardZones=ac.GetHazardZones aj.GetNearbyHazards=ac.GetNearbyHazards aj.
AddForceCircleName=ac.AddForceCircleName aj.GetForceCircleNames=ac.
GetForceCircleNames aj.IsForceCircle=ac.IsForceCircle aj.IsPlayerInDanger=af.
IsPlayerInDanger aj.GetPlayerThreat=af.GetCurrentThreat aj.OnPlayerDangerChanged
=af.OnDangerStatusChanged aj.SetPlayerVisualEnabled=af.SetVisualEnabled aj.
IsPlayerVisualEnabled=af.IsVisualEnabled aj.SetPlayerHitboxRadius=af.SetRadius
aj.GetPlayerHitboxRadius=af.GetRadius aj.FindNearestSafeSpot=ag.
FindNearestSafeSpot aj.IsPointSafe=ag.IsPointSafe aj.GetLastSafeSpot=ag.
GetLastSafeSpot aj.OnSafeSpotChanged=ag.OnSafeSpotChanged aj.
SetSafeSpotVisualEnabled=ag.SetVisualEnabled aj.IsSafeSpotVisualEnabled=ag.
IsVisualEnabled aj.SetSafeSpotEnabled=ag.SetEnabled aj.IsSafeSpotEnabled=ag.
IsEnabled aj.SetSafeSpotBuffer=ag.SetSafetyBuffer aj.GetSafeSpotBuffer=ag.
GetSafetyBuffer aj.SetShowCandidates=ag.SetShowCandidates aj.IsShowCandidates=ag
.IsShowCandidates aj.ClearSafeSpot=ag.Clear aj.SetAutoDodgeEnabled=ah.SetEnabled
aj.IsAutoDodgeEnabled=ah.IsEnabled aj.SetDodgeSnapDistance=ah.SetSnapDistance aj
.GetDodgeSnapDistance=ah.GetSnapDistance aj.IsCurrentlyDodging=ah.IsDodging aj.
OnDodgeStateChanged=ah.OnDodgeStateChanged aj.ClearDodge=ah.Clear aj.
SetVisualizerEnabled=ad.SetEnabled aj.IsVisualizerEnabled=ad.IsEnabled aj.
RefreshVisuals=ad.RefreshAll aj.SetTrajectoryEnabled=ae.SetEnabled aj.
IsTrajectoryEnabled=ae.IsEnabled aj.SetTrajectoryLength=ae.SetPredictionLength
aj.GetTrajectoryLength=ae.GetPredictionLength aj.RefreshTrajectory=ae.RefreshAll
aj.IsPointInAnyTrajectory=ae.IsPointInAnyTrajectory aj.GetNearbyTrajectories=ae.
GetNearbyTrajectories aj.SetSelectionBoxesEnabled=ab.SetSelectionBoxesEnabled aj
.IsSelectionBoxesEnabled=ab.IsSelectionBoxesEnabled aj.SetTimerVisualEnabled=ai.
SetEnabled aj.IsTimerVisualEnabled=ai.IsEnabled aj.RefreshTimerVisuals=ai.
RefreshAll aj.StartDetection=ab.StartScan aj.StopDetection=ab.StopScan aj.
IsDetectionEnabled=ab.IsEnabled aj.SetDetectionEnabled=ab.SetEnabled aj.
SetLogHazards=ab.SetLogHazards aj.IsLogHazardsEnabled=ab.IsLogHazardsEnabled aj.
SetLogThreats=aj.SetLogHazards aj.IsLogThreatsEnabled=aj.IsLogHazardsEnabled aj.
SetLogFailed=ab.SetLogFailed aj.IsLogFailedEnabled=ab.IsLogFailedEnabled aj.
SetInspectTarget=ab.SetInspectTarget aj.GetInspectTarget=ab.GetInspectTarget aj.
SetInspectEnabled=ab.SetInspectEnabled aj.IsInspectEnabled=ab.IsInspectEnabled
aj.GetHazardCount=ab.GetHazardCount aj.GetActiveHazards=ab.GetActiveHazards aj.
GetLastHazardInfo=ab.GetLastHazardInfo aj.OnHazardChanged=ab.OnHazardChanged
function aj.StartScan()ab.StartScan()end function aj.StopScan()ab.StopScan()end
function aj.Toggle(ak)if ak then aj.StartScan()else aj.StopScan()end end
function aj.IsEnabled()return ab.IsEnabled()end aa.Register(function()ab.
StopScan()end)return aj