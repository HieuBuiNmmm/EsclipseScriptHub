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
OnCleanup=b.Register return b end function a.c()local b,c=a.load'a',a.load'b'
local d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z=b.player,0.05,
'enemyProjectiles',0.5,{},false,16,16,true,false,false,{},0,{},0,{},{},{},{},{},
{},0,{}local A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S=function()for A=#z,1,-1 do
pcall(z[A])end end,{},'unknown',true,{},{},{},0,4,false local T=function(T)if T
then table.insert(G,T)end return T end function h.OnRespawn(U)table.insert(F,U)
end function h.GetLastRespawnTime()return H end function h.
GetRespawnProtectionDuration()return I end function h.
SetRespawnProtectionDuration(U)if type(U)=='number'and U>=0 then I=U end end
function h.GetRespawnProtectionRemaining()if H==0 then return 0 end local U=os.
clock()-H local V=I-U return math.max(0,V)end function h.IsJustRespawned(U)local
V=U or I if H==0 then return false end return(os.clock()-H)<=V end function h.
WasDead()return J end function h.IsDead()local U=d and d.Character if not U or
not U.Parent then return true end local V=U:FindFirstChildOfClass'Humanoid'if
not V or V.Health<=0 then return true end return false end function h.
IsInvulnerable()local U=d and d.Character if not U or not U.Parent then return
false,nil end local V=U:FindFirstChildOfClass'Humanoid'if V and V.Health<=0 then
return false,nil end local W=h.GetRespawnProtectionRemaining()if W>0 then return
true,('Respawn Shield (%.1fs)'):format(W)end return false,nil end local U=
function(U)if not U or not U:IsA'Model'then return nil end local V=U:
FindFirstChild'HumanoidRootPart'if V and V:IsA'BasePart'then return V end if U.
PrimaryPart and U.PrimaryPart:IsA'BasePart'then return U.PrimaryPart end for W,X
in ipairs(U:GetDescendants())do if X:IsA'BasePart'then return X end end return
nil end local V,W=function(V)if not V or not V:IsA'Model'or not V.Parent or V==d
.Character then return false end local W=V:FindFirstChildOfClass'Humanoid'if not
W or W.Health<=0 then return false end return U(V)~=nil end,function(V)local W=w
[V]if not W then return end if W.Died then W.Died:Disconnect()W.Died=nil end w[V
]=nil end local X,Y=function(X)if not X or not u[X]then return end x[X]=nil u[X]
=nil y-=1 W(X)A()O()end,function(X)if not dungeon or not X then return nil end
local Y=X.Parent while Y do if Y==dungeon then return nil end if Y.Parent==
dungeon and(Y:IsA'Folder'or Y:IsA'Model')then return Y end Y=Y.Parent end return
nil end local aa=function(Z)if not V(Z)or u[Z]then return end local _,aa=U(Z),Z:
FindFirstChildOfClass'Humanoid'if not _ or not aa then return end u[Z]={Model=Z,
Root=_,Humanoid=aa,Room=Y(Z)}y+=1 w[Z]={Died=aa.Died:Connect(function()X(Z)end)}
if n and not Q then if P then P()end end A()O()end local Z=function(Z)if not Z
then return end if V(Z)then aa(Z)return end if x[Z]then return end x[Z]=true
task.spawn(function()local _=os.clock()+2 while Z.Parent and os.clock()<_ do if
V(Z)then x[Z]=nil aa(Z)return end task.wait(0.03)end x[Z]=nil if Z.Parent and V(
Z)then aa(Z)end end)end local ab=function(_)if not _ or t[_]then return end t[_]
=true for ab,ac in ipairs(_:GetDescendants())do if ac:IsA'Model'and V(ac)then
aa(ac)end end v[_]={Added=_.DescendantAdded:Connect(function(ab)if ab:IsA'Model'
then Z(ab)elseif ab:IsA'Humanoid'then local ac=ab:FindFirstAncestorOfClass
'Model'if ac then Z(ac)end end end),Removed=_.DescendantRemoving:Connect(
function(ab)if ab:IsA'Model'then X(ab)end end)}end M=function()if not dungeon
then dungeon=workspace:WaitForChild('dungeon',30)end if not dungeon then return
false end p=0 for ac=#q,1,-1 do pcall(q[ac],p)end r=0 for ac=#s,1,-1 do pcall(s[
ac],r)end for ac,_ in ipairs(dungeon:GetChildren())do if _:IsA'Folder'or _:IsA
'Model'then ab(_)end end v[dungeon]={Added=dungeon.DescendantAdded:Connect(
function(ac)if ac:IsA'Model'then Z(ac)elseif ac:IsA'Humanoid'then local _=ac:
FindFirstAncestorOfClass'Model'if _ then Z(_)end end end),Removed=dungeon.
DescendantRemoving:Connect(function(ac)if ac:IsA'Model'then X(ac)end end)}return
true end N=function()if not dungeon then return end for ac,_ in pairs(v)do if _.
Added then pcall(function()_.Added:Disconnect()end)end if _.Removed then pcall(
function()_.Removed:Disconnect()end)end end v={}t={}for ac in pairs(u)do W(ac)
end u={}y=0 x={}Q=nil dungeon=nil end L=function()for ac,_ in pairs(u)do if not
ac or not ac.Parent then X(ac)else local ad=_.Humanoid or ac:
FindFirstChildOfClass'Humanoid'_.Humanoid=ad if not ad or ad.Health<=0 then X(ac
)else local ae=_.Root if not ae or not ae.Parent then ae=U(ac)if ae then _.Root=
ae else X(ac)end end end end end end function h.SetFastSpeed(ac)j=ac if i and
humanoid and humanoid.Parent then if humanoid.WalkSpeed<j then m=true humanoid.
WalkSpeed=j m=false end end end function h.SetSpeedEnabled(ac)i=ac if humanoid
and humanoid.Parent then m=true if i then if humanoid.WalkSpeed<j then humanoid.
WalkSpeed=j end else humanoid.WalkSpeed=k end m=false end end function h.
IsSpeedEnabled()return i end function h.GetFastSpeed()return j end function h.
SetInstantAccelEnabled(ac)l=ac and true or false end function h.
IsInstantAccelEnabled()return l end local ac=function()if R then R:Disconnect()R
=nil end if not humanoid or not humanoid.Parent then return end R=humanoid:
GetPropertyChangedSignal'WalkSpeed':Connect(function()if m then return end if
not humanoid or not humanoid.Parent then return end local ac=humanoid.WalkSpeed
if i then if ac<j then m=true humanoid.WalkSpeed=j m=false end else k=ac end end
)end function h.SetHumanoid(ad)if not ad then return end local ae=ad:
WaitForChild('Humanoid',10)if not ae then return end humanoid=ae rootPart=ad:
WaitForChild('HumanoidRootPart',10)or ad.PrimaryPart k=humanoid.WalkSpeed if i
and humanoid.WalkSpeed<j then m=true humanoid.WalkSpeed=j m=false end if S then
S:Disconnect()S=nil end S=humanoid.Died:Connect(function()J=true end)T(humanoid.
HealthChanged:Connect(function(_)if _<=0 then J=true elseif J and _>0 then J=
false end end))end local ad=function()if not c.IsActive()then return end if not
l then return end if not humanoid or not humanoid.Parent or humanoid.Health<=0
or humanoid.Sit then return end if not rootPart or not rootPart.Parent then
local ad=d and d.Character rootPart=ad and ad:FindFirstChild'HumanoidRootPart'if
not rootPart then return end end if rootPart.Anchored then return end local ad,
ae=humanoid.MoveDirection,rootPart.AssemblyLinearVelocity if ad.Magnitude>0.05
then local _=i and math.max(j,humanoid.WalkSpeed)or humanoid.WalkSpeed rootPart.
AssemblyLinearVelocity=Vector3.new(ad.X*_,ae.Y,ad.Z*_)end end if b.RunService
then local ae=b.RunService.PreSimulation or b.RunService.Heartbeat if ae then T(
ae:Connect(ad))end end function h.GetDungeonStartTime()return dungeonStartTime
end function h.SetDungeonStartTime(ae)dungeonStartTime=ae end function h.
GetDungeonElapsed()if not dungeonStartTime then return nil end return os.clock()
-dungeonStartTime end function h.ReadyDungeon()if not dungeon and not M()then
return false end return true end function h.GetHumanoid()return humanoid end
function h.GetEnemyNames()local ae={}local _=function(_)if _ and _~=''and _~=d.
Name then ae[_]=true end end if dungeon then for af,ag in ipairs(dungeon:
GetChildren())do if ag:IsA'Folder'or ag:IsA'Model'then for ah,ai in ipairs(ag:
GetDescendants())do if ai:IsA'Model'and ai:FindFirstChildOfClass'Humanoid'then
_(ai.Name)end end end end end for af in pairs(u)do _(af.Name)end local af={}for
ag in pairs(ae)do table.insert(af,ag)end table.sort(af)return af end function h.
GetEnemyCount()return y end function h.GetTrackedEnemyData()local ae={}for af,ag
in pairs(u)do if ag and ag.Root and ag.Root.Parent then ae[#ae+1]=ag end end
return ae end function h.OnEnemyChanged(ae)if type(ae)~='function'then return
function()end end table.insert(z,ae)return function()for af,ag in ipairs(z)do if
ag==ae then table.remove(z,af)break end end end end function h.
GetEnemyProjectileNames()local ae,af={},game:GetService'ReplicatedStorage'local
ag=af:FindFirstChild(f)if not ag then return ae end for ah,ai in ipairs(ag:
GetChildren())do local _=ai.ClassName if _=='Model'or _=='MeshPart'or _=='Part'
then ae[ai.Name]=true end end return ae end function h.GetKeyHoldTime()return e
end if d and d.Character and d.Character.Parent then h.SetHumanoid(d.Character)
ac()else local ae=d and d.CharacterAdded and task.spawn(function()local ae=d.
CharacterAdded:Wait()if ae and c.IsActive()then h.SetHumanoid(ae)ac()end end)end
if d then T(d.CharacterAdded:Connect(function(ae)local af,ag=pcall(function()if
not ae then return end H=os.clock()h.SetHumanoid(ae)ac()for af,ag in ipairs(F)do
pcall(ag)end end)if not af then warn('[Shared] respawn handler error:',tostring(
ag))end end))end task.spawn(function()while c.IsActive()do task.wait(g)local ae=
workspace:FindFirstChild'dungeon'if dungeon and ae~=dungeon then N()elseif not
dungeon and ae then M()end O()end end)local ae=function()local ae=game:
GetService'Workspace'for af,ag in ipairs(ae:GetDescendants())do if ag.Name==
'dungeonName'and ag:IsA'ValueBase'then local ah=ag.Value if type(ah)=='string'
then local ai=string.gsub(ah,'%s+','')if ai~=''and string.lower(ai)~=C then
return ah end end end end return nil end task.spawn(function()while c.IsActive()
do task.wait(g)local af=ae()if af~=K then K=af if af then h.ResetBossIndex()end
for ag=#B,1,-1 do pcall(B[ag],af)end end end end)local af=function()return not(K
and#K>0)end task.spawn(function()while c.IsActive()do task.wait(g)local ag=af()
if ag~=D then D=ag for ah=#E,1,-1 do pcall(E[ah],D)end end end end)task.spawn(
function()local ag,ah=pcall(function()return M()end)if not ag then warn(
'[EnemyTracker] Initialization error:',ah)end end)local ag=function()if not
dungeon then dungeon=workspace:FindFirstChild'dungeon'end if not dungeon then
return end local ag=pcall(function()for ag,ah in ipairs(dungeon:GetChildren())do
if ah:IsA'Folder'or ah:IsA'Model'then if ah:IsA'Model'and V(ah)then Z(ah)end for
ai,_ in ipairs(ah:GetDescendants())do if _:IsA'Model'then Z(_)end end end end L(
)end)if not ag then warn'[EnemyTracker] scanDungeonEnemies error'end end
function h.ForceRescan()ag()end local ah,ai=0,2 task.spawn(function()while c.
IsActive()do task.wait(ai)local _=os.clock()if _-ah<ai then continue end ah=_
ag()end end)function h.IsBossActive()return n end function h.OnBossActiveChanged
(_)if type(_)~='function'then return function()end end table.insert(o,_)return
function()for aj,ak in ipairs(o)do if ak==_ then table.remove(o,aj)break end end
end end function h.GetCurrentBossIndex()return p end function h.
GetCombatTargetKey()if not n then return'Mob'end local aj=math.clamp(p,1,3)
return'Boss'..tostring(aj)end function h.ResetBossIndex()p=0 Q=nil for aj=#q,1,-
1 do pcall(q[aj],p)end end function h.OnBossIndexChanged(aj)if type(aj)~=
'function'then return function()end end table.insert(q,aj)return function()for
ak,_ in ipairs(q)do if _==aj then table.remove(q,ak)break end end end end local
aj=function(aj)if type(aj)~='string'then return 0 end local ak=string.lower(aj)
local _=string.match(ak,'boss.*(%d+)')if _ then return 100+(tonumber(_)or 1)end
if string.find(ak,'boss')then return 100+math.max(1,p)end local al=string.match(
aj,'^room(%d+)$')if not al then return 0 end return tonumber(al)or 0 end local
ak=function()if not dungeon then return 0 end for ak,al in pairs(u)do if al and
al.Room then local _=aj(al.Room.Name)if _>0 then return _ end end end if n then
return 100+math.max(1,p)end return 0 end O=function()local al=ak()if al==r then
return end r=al for _=#s,1,-1 do pcall(s[_],r)end end function h.
GetCurrentRoomIndex()return r end function h.OnRoomIndexChanged(al)if type(al)~=
'function'then return function()end end table.insert(s,al)return function()for _
,am in ipairs(s)do if am==al then table.remove(s,_)break end end end end
function h.GetCurrentDungeonName()return K end function h.OnDungeonNameChanged(
al)if type(al)~='function'then return function()end end table.insert(B,al)return
function()for am,_ in ipairs(B)do if _==al then table.remove(B,am)break end end
end end function h.IsInLobby()return D end function h.OnLobbyChanged(al)if type(
al)~='function'then return function()end end table.insert(E,al)return function()
for am,_ in ipairs(E)do if _==al then table.remove(E,am)break end end end end
local al P=function()if not n or Q~=nil then return end for am,_ in pairs(u)do
if _ and _.Root and _.Root.Parent then local an=false if _.Room and type(_.Room.
Name)=='string'and string.find(string.lower(_.Room.Name),'boss')then an=true
elseif string.find(string.lower(am.Name),'boss')then an=true elseif am.Parent
and string.find(string.lower(am.Parent.Name),'boss')then an=true end if an then
Q=_.Root.Position return end end end for am,an in pairs(u)do if an and an.Root
and an.Root.Parent then Q=an.Root.Position return end end end local am=function(
am)if n==am then return end n=am if am then p+=1 Q=nil ag()P()for an=#q,1,-1 do
pcall(q[an],p)end else Q=nil end for an=#o,1,-1 do pcall(o[an],n)end O()end
function h.GetBossSpawnPosition()if Q then return Q end P()return Q end function
h.SetBossSpawnPosition(an)Q=an end local function an()if not d then return end
local _=d:FindFirstChild'PlayerGui'if not _ then al=nil am(false)return end
local ao=_:FindFirstChild('bossHealth',true)if ao then if ao~=al then al=ao if
al:IsA'ScreenGui'then T(al:GetPropertyChangedSignal'Enabled':Connect(an))elseif
al:IsA'GuiObject'then T(al:GetPropertyChangedSignal'Visible':Connect(an))end end
local ap=if ao:IsA'ScreenGui'then ao.Enabled elseif ao:IsA'GuiObject'then ao.
Visible else true am(ap)else al=nil am(false)end end task.spawn(function()if not
d then return end local ao=d:WaitForChild('PlayerGui',30)if not ao then return
end T(ao.DescendantAdded:Connect(an))T(ao.DescendantRemoving:Connect(an))an()
while c.IsActive()and task.wait(0.5)do an()end end)local ao,ap={}local aq=
function()if ap then return ap end pcall(function()local _=d or game:GetService
'Players'.LocalPlayer local aq=_ and _:FindFirstChild'PlayerScripts'local ar=aq
and aq:FindFirstChild'PlayerModule'if ar then ap=require(ar):GetControls()end
end)return ap end function h.DisableControls(ar)ar=ar or'default'ao[ar]=true
local _=aq()if _ and type(_.Disable)=='function'then pcall(function()_:Disable()
end)end end function h.EnableControls(ar)ar=ar or'default'ao[ar]=nil if next(ao)
~=nil then return end local _=aq()if _ and type(_.Enable)=='function'then pcall(
function()_:Enable()end)end end c.Register(function()if R then R:Disconnect()R=
nil end for ar,_ in ipairs(G)do pcall(function()_:Disconnect()end)end table.
clear(G)table.clear(ao)local ar=aq()if ar and type(ar.Enable)=='function'then
pcall(function()ar:Enable()end)end N()end)return h end function a.d()local aa,ab
,ac={},{},false function aa.SetLocked(ad)ac=ad and true or false end function aa
.IsLocked()return ac end function aa.Register(ad,ae,af)if type(ad)~='string'or
type(ae)~='function'or type(af)~='function'then return end ab[ad]={setEnabled=ae
,isEnabled=af}end function aa.EnableExclusive(ad)if ac then return end for ae,af
in pairs(ab)do if ae~=ad and af.isEnabled()then pcall(af.setEnabled,false)end
end end function aa.IsEnabled(ad)local ae=ab[ad]return ae~=nil and ae.isEnabled(
)end return aa end function a.e()local aa,ab={}function aa:SetWindow(ac)ab=ac
end function aa.Notify(ac,ad,ae)ae=ae or 3 if ab then local af=pcall(function()
ab:Notify{Title=ac,Description=ad,Lifetime=ae}end)if af then return end end
pcall(function()game:GetService'StarterGui':SetCore('SendNotification',{Title=ac
,Text=ad,Duration=ae})end)end return aa end function a.f()local aa,ab=a.load'a',
a.load'c'local ac,ad=aa.player,{}function ad.Validate(ae)if not ae then return
false end local af=ae.Model if not af or not af.Parent or af==ac.Character then
return false end local ag=ae.Humanoid if not ag or not ag.Parent then ag=af:
FindFirstChildOfClass'Humanoid'ae.Humanoid=ag end if not ag or ag.Health<=0 then
return false end local ah=ae.Root if not ah or not ah.Parent then ah=af:
FindFirstChild'HumanoidRootPart'or af.PrimaryPart if not ah then for ai,aj in
ipairs(af:GetDescendants())do if aj:IsA'BasePart'then ah=aj break end end end if
not ah then return false end ae.Root=ah end return true end function ad.Scan()
local ae,af={},ab.GetTrackedEnemyData()for ag,ah in ipairs(af)do if ad.Validate(
ah)then table.insert(ae,ah)end end if#ae==0 and ab.ForceRescan then ab.
ForceRescan()af=ab.GetTrackedEnemyData()for ag,ah in ipairs(af)do if ad.
Validate(ah)then table.insert(ae,ah)end end end return ae end return ad end
function a.g()local aa={}function aa.SelectBestTarget(ab,ac,ad)local ae,af,ag=(
math.huge)for ah,ai in ipairs(ac)do if ad and ad()then return nil,nil,nil,nil,
math.huge end local aj=ai.Root if aj and aj.Parent then local ak=aj.Position
local al,am=ak.X-ab.X,ak.Z-ab.Z local an=al*al+am*am if an<ae then ae=an af=ai
ag=ak end end end local ah=ae<math.huge and math.sqrt(ae)or math.huge return af,
nil,nil,ag,ah end return aa end function a.h()local aa,ab,ac,ad,ae,af,ag,ah,ai=a
.load'g',a.load'f',{},{},1,6 function ac.GetTarget()return ag end function ac.
GetPathInstance()return ah end function ac.GetWaypoints()return ad end function
ac.GetWaypointIndex()return ae end function ac.SetWaypointIndex(aj)ae=math.
clamp(aj,1,math.max(1,#ad))end function ac.AdvanceWaypointIndex(aj)if not ad or#
ad==0 then return end local ak=ad[ae]if ak then local al=Vector3.new(ak.Position
.X-aj.X,0,ak.Position.Z-aj.Z).Magnitude if al<=3.5 then ae=math.min(#ad+1,ae+1)
end end end function ac.GetLastPathDestPos()return ai end function ac.
SetRepathThreshold(aj)if type(aj)=='number'and aj>0 then af=aj end end function
ac.GetRepathThreshold()return af end function ac.SetTarget(aj,ak,al,am)if ah and
ah~=ak then pcall(function()ah:Destroy()end)end ag=aj ah=ak ad=al or{}ae=1 ai=am
end function ac.UpdatePath(aj,ak,al)if ah and ah~=aj then pcall(function()ah:
Destroy()end)end ah=aj ad=ak or{}ae=1 ai=al end function ac.ClearTarget()if ah
then pcall(function()ah:Destroy()end)end ag=nil ah=nil ad={}ae=1 ai=nil end
function ac.IsTargetValid()if not ag then return false end return ab.Validate(ag
)end function ac.NeedsRepath(aj)if not ah or not ad or#ad==0 then return true
end if not ai or not aj then return true end return(aj-ai).Magnitude>af end
function ac.Repath(aj,ak)if not ak then return false end local al,am,an=aa.
ComputePathWithCost(aj,ak)if al and#am>0 then if ah then pcall(function()ah:
Destroy()end)end ah=al ad=am ae=1 ai=ak return true end return false end return
ac end function a.i()local aa=a.load'a'local ab,ac=aa.player,{}local ad=function
(ad)local ae={}if ad then for af,ag in ipairs(ad)do if ag and ag.Parent then
table.insert(ae,ag)end end end if ab and ab.Character and ab.Character.Parent
then table.insert(ae,ab.Character)end local af=workspace:FindFirstChild
'RaycastIgnore'if af then table.insert(ae,af)end return ae end function ac.
CastRay(ae,af,ag)local ah=af-ae local ai=ah.Magnitude if ai<0.3 then return
false,nil,af end local aj=RaycastParams.new()aj.FilterType=Enum.
RaycastFilterType.Exclude aj.FilterDescendantsInstances=ad(ag)aj.IgnoreWater=
true local ak,al,am=ae,ah,8 for an=1,am do local ao=workspace:Raycast(ak,al,aj)
if not ao then return false,nil,af end local ap=ao.Instance if ap and ap.
CanCollide and ap.CanQuery~=false then if ao.Normal.Y>0.65 then local aq=(ao.
Position-ak).Magnitude+0.15 if aq>=al.Magnitude then return false,nil,af end ak=
ao.Position+al.Unit*0.15 al=af-ak else return true,ap,ao.Position end else local
aq=(ao.Position-ak).Magnitude+0.15 if aq>=al.Magnitude then return false,nil,af
end ak=ao.Position+al.Unit*0.15 al=af-ak end end return false,nil,af end
function ac.CheckClearance(ae,af,ag)local ah,ai,aj=ac.CastRay(ae,af,ag)if ah
then return true,ai,aj end local ak=Vector3.new(af.X-ae.X,0,af.Z-ae.Z)if ak.
Magnitude>0.8 then local al=ak.Unit local am=Vector3.new(-al.Z,0,al.X)*0.6 local
an,ao=ae+am,af+am local ap=ac.CastRay(ae,an,ag)if not ap then local aq,ar,b=ac.
CastRay(an,ao,ag)if aq and(b-an).Magnitude>1 then return true,ar,b end end local
aq,ar=ae-am,af-am local b=ac.CastRay(ae,aq,ag)if not b then local c,d,e=ac.
CastRay(aq,ar,ag)if c and(e-aq).Magnitude>1 then return true,d,e end end end
return false,nil,af end function ac.ResolveDestination(ae,af,ag,ah,ai)local aj,
ak=ae,af local al,am,an,ao={origin=aj,targetPos=ak,directBlocked=false,
directHitPart=nil,directHitPos=nil,chosenDest=nil,mode='None',nodeIdx=nil},ac.
CheckClearance(aj,ak,ai)al.directBlocked=am al.directHitPart=an al.directHitPos=
ao if not am then al.chosenDest=af al.mode='Direct'return af,'Direct',nil,al end
local ap=math.clamp(ah or 1,1,ag and#ag or 1)if ag and#ag>0 then for aq=#ag,ap,-
1 do local ar=ag[aq]local b=ar.Position local c=b+Vector3.new(0,2,0)local d,e,f=
ac.CheckClearance(aj,c,ai)if not d then al.chosenDest=b al.mode='Waypoint'al.
nodeIdx=aq return b,'Waypoint',aq,al end end end al.mode='Blocked'return nil,
'Blocked',nil,al end function ac.ExecuteMove(ae,af,ag,ah,ai)if not ae or not ag
then return end ae:MoveTo(ag)local aj,ak=ag.Y-af.Y,Vector3.new(ag.X-af.X,0,ag.Z-
af.Z).Magnitude if aj>1.8 and ak<=7 then ae.Jump=true return end if ah and#ah>0
then local al=math.clamp(ai or 1,1,#ah)for am=al,math.min(al+2,#ah)do local an=
ah[am]if an then local ao=Vector3.new(an.Position.X-af.X,0,an.Position.Z-af.Z).
Magnitude if ao<=5 then if an.Action==Enum.PathWaypointAction.Jump or(an.
Position.Y-af.Y)>1.8 then ae.Jump=true break end end end end end end return ac
end function a.j()local aa,ab,ac,ad,ae,af,ag={},0.85,0,2,{},64 function aa.
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
'ReplicatedStorage',{'firstBossCrissCross','firstBossSeekingSpikes'},{
'smallicespikes','mediumicespikes','largeicespikes'}local al=function(al)if not
al or type(al)~='string'then return false end local am=al:lower():gsub('%s+','')
if#am==0 then return false end for an,ao in ipairs(aj)do if string.find(am,ao,1,
true)then return true end end return false end function aa.IsIceSpikesChain(am)
return al(am)end local am={'secondbosscriclehitbox','secondbosscirclehitbox'}
local an=function(an)if not an or type(an)~='string'then return false end local
ao=an:lower():gsub('%s+','')if#ao==0 then return false end for ap,aq in ipairs(
am)do if string.find(ao,aq,1,true)then return true end end return false end
function aa.IsSecondBossCircleChain(ao)return an(ao)end local ao={'movingbeam'}
local ap=function(ap)if not ap or type(ap)~='string'then return false end local
aq=ap:lower():gsub('%s+','')if#aq==0 then return false end for ar,b in ipairs(ao
)do if string.find(aq,b,1,true)then return true end end return false end
function aa.IsMovingBeam(aq)return ap(aq)end local aq,ar={'firstbossbigspike',
'firstbossbeampart','bigspike'},function(aq)if not aq or type(aq)~='string'then
return false end local ar=aq:lower():gsub('%s+','')return string.find(ar,
'firstbossbeampart',1,true)~=nil end function aa.IsBeamTelegraph(b)return ar(b)
end local b=function(b)if not b or type(b)~='string'then return false end local
c=b:lower():gsub('%s+','')if#c==0 or string.find(c,'seekingspike',1,true)then
return false end for d,e in ipairs(aq)do if string.find(c,e,1,true)then return
true end end return false end function aa.IsBigSpike(c)return b(c)end local c=
function()if ak and ak>0 then return ak end local c,d=45,ah:FindFirstChild
'enemyProjectiles'if not d then return c end local e=d:FindFirstChild
'largeIceSpikes'if not e then for f,g in ipairs(d:GetChildren())do local h=(g.
Name or''):lower():gsub('%s+','')if h=='largeicespikes'then e=g break end end
end if not e then return c end local f,g=0,Vector3.zero if e:IsA'Model'and e.
PrimaryPart then g=e.PrimaryPart.Position elseif e:IsA'BasePart'then g=e.
Position end local h={}if e:IsA'BasePart'then table.insert(h,e)else for i,j in
ipairs(e:GetDescendants())do if j:IsA'BasePart'then table.insert(h,j)end end end
if#h==0 then return c end for i,j in ipairs(h)do local k=j.Size local l,m=math.
max(k.X,k.Z)/2,(Vector3.new(j.Position.X,0,j.Position.Z)-Vector3.new(g.X,0,g.Z))
.Magnitude local n=m+l if n>f then f=n end end if f>=5 then ak=f return ak end
return c end function aa.GetLargeIceSpikesMaxRadius()return c()end local d=
function(d)if not d or type(d)~='string'then return false end local e=d:lower():
gsub('%s+','')if#e==0 then return false end for f,g in ipairs(ai)do local h=g:
lower():gsub('%s+','')if#h>0 and string.find(e,h,1,true)then return true end end
return false end function aa.IsForceCircle(e)return d(e)end function aa.
AddForceCircleName(e)if type(e)=='string'and#e>0 then table.insert(ai,e)aa.
InvalidateCache()end end function aa.GetForceCircleNames()return ai end local e,
f,g,h=function(e)return e and e.Parent and e.Transparency<=ab end,function(e,f,g
)local h,i,j,k=e.Size,g and ad or ac,(e and e.Name)or'',(e and e.Parent and e.
Parent.Name)or''if ap(j)or ap(k)then local l,m=math.max(h.X,h.Z)/2+i,math.max(2,
math.min(h.X,h.Z)/2+i)return{half=Vector3.new(l,0,m),cframe=e.CFrame,
isMovingBeam=true}end if b(j)or b(k)then local l,m=h,e:FindFirstChildWhichIsA(
'SpecialMesh',true)if m then l=Vector3.new(l.X*math.abs(m.Scale.X),l.Y*math.abs(
m.Scale.Y),l.Z*math.abs(m.Scale.Z))end local n={l.X,l.Y,l.Z}table.sort(n)local o
,p=math.clamp(n[2],6,60),math.clamp(n[3],8,80)local q,r=o/2+i,p/2+i return{half=
Vector3.new(q,0,r),cframe=e.CFrame,isBigSpike=true}end if f or(e:IsA'Part'and(e.
Shape==Enum.PartType.Ball or e.Shape==Enum.PartType.Cylinder))then return{radius
=math.max(h.X,h.Y,h.Z)/2}end local l=Vector3.new(math.max(h.X,0)/2+i,0,math.max(
h.Z,0)/2+i)return{half=l,cframe=e.CFrame}end,function(e,f,g,h)if not f then
return false end if f.expireTime and os.clock()>f.expireTime then return false
end local i,j=e.X,e.Z g=g or 0 local k=(h or f.isTrajectory)and ad or ac if f.
radius then local l,m=(f.part and f.part.Parent)and f.part.Position,f.
isSecondBossChain==true local n,o=(m and f.cx)or(l and l.X)or f.cx or 0,(m and f
.cz)or(l and l.Z)or f.cz or 0 local p,q,r=i-n,j-o,f.radius+k+g return(p*p+q*q)<=
(r*r)end local l=(f.part and f.part.Parent)and f.part.CFrame or f.cframe if l
then local m,n,o=l:PointToObjectSpace(e),f.half.X,f.half.Z if g<=0 then return
math.abs(m.X)<=n and math.abs(m.Z)<=o else local p,q=math.max(0,math.abs(m.X)-n)
,math.max(0,math.abs(m.Z)-o)return(p*p+q*q)<=(g*g)end end return false end,
function(e,f)local g=(f and f.CFrame)or(e:IsA'Model'and e:GetPivot())if g then
local h=g.LookVector local i=Vector3.new(-h.X,0,-h.Z)if i.Magnitude>0.05 then
return i.Unit end end local h=services.player or game:GetService'Players'.
LocalPlayer local i=h and h.Character local j=i and(i:FindFirstChild
'HumanoidRootPart'or i.PrimaryPart)if j and f then local k=Vector3.new(j.
Position.X-f.Position.X,0,j.Position.Z-f.Position.Z)if k.Magnitude>0.1 then
return k.Unit end end return Vector3.new(0,0,-1)end local i=function(i)if not i
or not i.Instance or not i.Instance.Parent then return nil end local j=i.
Instance local k=i.Name or(j and j.Name)or''local l,m=d(k),i.IsTrajectory==true
local n,o=m and ad or ac if al(k)then local p,q=(c())if j:IsA'BasePart'then q=e(
j)and j or nil elseif j:IsA'Model'then if j.PrimaryPart and e(j.PrimaryPart)then
q=j.PrimaryPart else for r,s in ipairs(j:GetDescendants())do if s:IsA'BasePart'
and e(s)and s.Parent then q=s break end end end end if not q then return nil end
local r=q.Position local s={radius=p,cx=r.X,cz=r.Z,part=q,isTrajectory=false,
isIceSpikes=true}return{zones={s},center=Vector3.new(r.X,0,r.Z),boundingRadius=p
+n}end if an(k)then local p if j:IsA'BasePart'then p=e(j)and j or nil elseif j:
IsA'Model'then if j.PrimaryPart and e(j.PrimaryPart)then p=j.PrimaryPart else
for q,r in ipairs(j:GetDescendants())do if r:IsA'BasePart'and e(r)and r.Parent
then p=r break end end end end if not p then return nil end local q,r,s,t,u,v,w,
x,y,z=p.Position,h(j,p),i.SpawnClock or os.clock(),{},10,11,3,22,2.2,0.4 local A
=(u-1)*x for B=1,u do local C=(B-1)*x local D,E,F=Vector3.new(q.X,0,q.Z)+r*C,v+(
B-1)*w,s+y+(B-1)*z table.insert(t,{radius=E,cx=D.X,cz=D.Z,part=p,expireTime=F,
isTrajectory=false,isSecondBossChain=true,circleIndex=B})end local B,C=Vector3.
new(q.X,0,q.Z)+r*(A/2),v+(u-1)*w local D,E=(A/2)+C+n,s+y+(u-1)*z if i then i.
MaxExpireTime=E i.IsSyntheticChain=true end return{zones=t,center=B,
boundingRadius=D,maxExpireTime=E}end if ap(k)then local p if j:IsA'BasePart'then
p=e(j)and j or nil elseif j:IsA'Model'then p=j.PrimaryPart or j:
FindFirstChildWhichIsA'BasePart'if not p or not e(p)then for q,r in ipairs(j:
GetDescendants())do if r:IsA'BasePart'and e(r)and r.Parent then p=r break end
end end end if not p then return nil end local q,r=p.Position,p.Size local s,t=
math.max(r.X,r.Z),math.max(3.5,math.min(r.X,r.Z))local u,v=s/2+n,t/2+n local w={
half=Vector3.new(u,0,v),cframe=p.CFrame,part=p,cx=q.X,cz=q.Z,isTrajectory=m,
isMovingBeam=true}return{zones={w},center=Vector3.new(q.X,0,q.Z),boundingRadius=
math.sqrt(u*u+v*v)}end if ar(k)then return nil end if b(k)then local p if j:IsA
'BasePart'then p=e(j)and j or nil elseif j:IsA'Model'then p=j.PrimaryPart or j:
FindFirstChildWhichIsA'BasePart'if not p or not e(p)then for q,r in ipairs(j:
GetDescendants())do if r:IsA'BasePart'and e(r)and r.Parent then p=r break end
end end end if not p then return nil end local q,r,s=p.Position,p.Size,p:
FindFirstChildWhichIsA('SpecialMesh',true)if s then r=Vector3.new(r.X*math.abs(s
.Scale.X),r.Y*math.abs(s.Scale.Y),r.Z*math.abs(s.Scale.Z))end local t={r.X,r.Y,r
.Z}table.sort(t)local u,v=math.clamp(t[2],6,60),math.clamp(t[3],8,80)local w,x=u
/2+n,v/2+n local y={half=Vector3.new(w,0,x),cframe=p.CFrame,part=p,cx=q.X,cz=q.Z
,isTrajectory=m,isBigSpike=true}return{zones={y},center=Vector3.new(q.X,0,q.Z),
boundingRadius=math.sqrt(w*w+x*x)}end if j:IsA'BasePart'then if not e(j)then
return nil end o={j}else o={}for p,q in ipairs(j:GetDescendants())do if#o>=af
then break end if q:IsA'BasePart'and e(q)and q.Parent then o[#o+1]=q end end if#
o==0 then return nil end end local p,q,r,s,t={},math.huge,-math.huge,math.huge,-
math.huge for u,v in ipairs(o)do local w,x=v.Position,v.Size local y=math.max(x.
X,x.Y,x.Z)/2+n q=math.min(q,w.X-y)r=math.max(r,w.X+y)s=math.min(s,w.Z-y)t=math.
max(t,w.Z+y)local z=f(v,l,m)if z then z.part=v z.isTrajectory=m p[#p+1]=z end
end if#p==0 then return nil end local u,v,w,x=(q+r)/2,(s+t)/2,(r-q)/2,(t-s)/2
return{zones=p,center=Vector3.new(u,0,v),boundingRadius=math.sqrt(w*w+x*x)}end
local j=function(j)local k=j and j.HazardZones if not k then k=i(j)if k and j
then j.HazardZones=k end end return k end function aa.GetHazardZones(k)return j(
k)end function aa.GetNearbyHazards(k,l)local m=ag if not m then return{}end l=l
or 65 local n,o,p={},k.X,k.Z for q,r in pairs(m.GetActiveHazardsMap())do local s
,t=r.Instance,j(r)if t then local u,v=t.center.X,t.center.Z if s and s.Parent
then local w=s:IsA'BasePart'and s or s.PrimaryPart or s:FindFirstChildWhichIsA
'BasePart'if w then u=w.Position.X v=w.Position.Z end end local w,x=o-u,p-v
local y,z=w*w+x*x,l+t.boundingRadius if y<=z*z then table.insert(n,r)end end end
return n end function aa.IsPointInAnyHazard(k,l,m,n)local o=ag if not o then
return false,nil,nil end m=m or 0 local p,q,r,s=math.huge,n or o.
GetActiveHazardsMap()for t,u in pairs(q)do local v=u.Instance or(typeof(t)==
'Instance'and t)if l and(l==v or(v and l.Name==v.Name))then continue end local w
=u.Name or(v and v.Name)or''if ap(w)or b(w)then continue end local x=j(u)if not
x then continue end local y,z=x.center.X,x.center.Z if v and v.Parent then local
A=v:IsA'BasePart'and v or v.PrimaryPart or v:FindFirstChildWhichIsA'BasePart'if
A then y=A.Position.X z=A.Position.Z end end local A,B=k.X-y,k.Z-z local C,D=A*A
+B*B,x.boundingRadius+m if C>D*D then continue end local E=u.IsTrajectory==true
for F=1,#x.zones do local G=x.zones[F]if e(G.part)and g(k,G,m,E or G.
isTrajectory)then local H=(k-G.part.Position).Magnitude if H<p then p=H r=u s=G.
part end break end end end return s~=nil,r,s end return aa end function a.k()
local aa,ab,ac=a.load'a',a.load'b',a.load'j'local ad,ae,af,ag,ah,ai,aj,ak,al,am,
an,ao=aa.RunService or game:GetService'RunService',aa.player,{},false,{},0.85,
Color3.fromRGB(255,45,45),Color3.fromRGB(0,160,255),0.55,0.25 local ap=function(
)local ap=ae and ae.Character if not ap then return nil end local aq=ap:
FindFirstChild'HumanoidRootPart'or ap.PrimaryPart if not aq then return nil end
return aq.Position.Y-2.5 end function af.BindDetection(aq)an=aq or nil end local
aq function af.BindTrajectory(ar)aq=ar or nil end function af.IsEnabled()return
ag end local ar=function(ar,b)local c,d,e=ar.ad,ar.zone,ar.part local f=ar.
anchorPart or e if not c or not c.Parent or not f or not f.Parent then return
end local g=d and(d.isSecondBossChain or(ar.hazardInfo and ar.hazardInfo.
IsSyntheticChain))local h=(g and d.cx and d.cz and Vector3.new(d.cx,0,d.cz))or(e
and e.Parent and e.Position)or((d and d.cx and d.cz)and Vector3.new(d.cx,0,d.cz)
)if not h then return end local i=Vector3.new(h.X,b or h.Y,h.Z)if ar.isCircle
then local j=CFrame.new(i)*CFrame.Angles(math.rad(90),0,0)c.CFrame=(f==workspace
.Terrain)and j or f.CFrame:ToObjectSpace(j)else local j if d and(d.isMovingBeam
or d.isBigSpike)then local k=aq and aq.GetHazardDirection and aq.
GetHazardDirection(ar.hazardInfo)if k and k.Magnitude>0.01 then j=CFrame.lookAt(
i,i+k)else local l=(e and e.Parent)and e.CFrame or CFrame.identity local m,n,o=l
:ToOrientation()j=CFrame.new(i)*CFrame.Angles(0,n,0)end else local k=(e and e.
Parent)and e.CFrame or CFrame.identity local l,n,o=k:ToOrientation()j=CFrame.
new(i)*CFrame.Angles(0,n,0)end c.CFrame=(f==workspace.Terrain)and j or f.CFrame:
ToObjectSpace(j)end end local b=function()if not ag then return end local b,c,d=
false,ap(),os.clock()for e,f in pairs(ah)do local g,h=e.IsSyntheticChain or(e.
MaxExpireTime and d<e.MaxExpireTime),e.Instance and e.Instance.Parent if not h
and not g then af.DetachZoneVisuals(e)else if f.items then local i={}for j,k in
ipairs(f.items)do local n=k.zone if n and n.expireTime and d>n.expireTime then
if k.ad and k.ad.Parent then pcall(function()k.ad:Destroy()end)end elseif k.ad
and k.ad.Parent then table.insert(i,k)ar(k,c)end end f.items=i if#i>0 then b=
true else af.DetachZoneVisuals(e)end end end end if not b and ao then ao:
Disconnect()ao=nil end end local c=function()if not ao and ag then ao=ad.
Heartbeat:Connect(b)end end function af.DetachZoneVisuals(d)if not d then return
end local e=ah[d]if not e then return end if e.adornments then for f,g in
ipairs(e.adornments)do pcall(function()g:Destroy()end)end table.clear(e.
adornments)end if e.connections then for f,g in ipairs(e.connections)do pcall(
function()g:Disconnect()end)end table.clear(e.connections)end if e.items then
table.clear(e.items)end ah[d]=nil end function af.UpdateHazardVisualColor(d,e)if
not d then return end local f=ah[d]if not f or not f.items then return end local
g=e==true or d.IsTrajectory==true local h,i=g and ak or aj,g and ac.
GetTrajectoryMargin()or 0 for j,k in ipairs(f.items)do local n,o,p=k.ad,k.zone,k
.part if n and n.Parent and o and p and p.Parent then n.Color3=h if k.isCircle
and o.radius then n.Radius=o.radius+i elseif o.half then local q,r=o.half.X,o.
half.Z n.Size=Vector3.new(q*2,am,r*2)end end end end function af.
AttachZoneVisuals(d)if not ag or not d then return end if ah[d]then af.
DetachZoneVisuals(d)end local e=ac.GetHazardZones(d)if not e or not e.zones then
return end local f=d.IsTrajectory==true local g,h,i,j,k,n,o=f and ak or aj,f and
ac.GetTrajectoryMargin()or 0,ap(),{},{},{},workspace.Terrain for p,q in ipairs(e
.zones)do local r,s,t,u=q.part,q.isSecondBossChain==true,q.isMovingBeam==true,q.
isBigSpike==true local v=(s or t or u)and o or r if s or t or u or(r and r.
Parent and r.Transparency<=ai)then local w,x=false if q.radius then w=true local
y=Instance.new'CylinderHandleAdornment'y.Name='HazardGroundCircle'y.Adornee=v y.
Radius=q.radius+h y.Height=am y.Color3=g y.Transparency=al y.ZIndex=2 y.
AlwaysOnTop=true y.Parent=v x=y elseif q.half and q.cframe then local y=Instance
.new'BoxHandleAdornment'y.Name='HazardGroundBox'y.Adornee=v y.Size=Vector3.new(q
.half.X*2,am,q.half.Z*2)y.Color3=g y.Transparency=al y.ZIndex=2 y.AlwaysOnTop=
true y.Parent=v x=y end if x then local y={ad=x,part=r,anchorPart=v,isCircle=w,
zone=q,hazardInfo=d}ar(y,i)table.insert(j,y)table.insert(k,x)if(not s and not t)
and r then local z=r:GetPropertyChangedSignal'Transparency':Connect(function()if
r.Parent and r.Transparency>ai then pcall(function()x:Destroy()end)end end)table
.insert(n,z)end end end end if#k>0 then ah[d]={items=j,adornments=k,connections=
n}c()end end function af.ClearAll()if ao then ao:Disconnect()ao=nil end for d in
pairs(ah)do af.DetachZoneVisuals(d)end table.clear(ah)end function af.RefreshAll
()af.ClearAll()if not ag or not an then return end for d,e in pairs(an.
GetActiveHazardsMap())do af.AttachZoneVisuals(e)end end function af.SetEnabled(d
)ag=d and true or false if ag then af.RefreshAll()else af.ClearAll()end end ac.
OnPaddingChanged(function()if ag then af.RefreshAll()end end)ab.Register(
function()af.ClearAll()end)return af end function a.l()local aa,ab,ac=a.load'a',
a.load'b',a.load'j'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,b,c,d=aa.
RunService or game:GetService'RunService',game:GetService'ReplicatedStorage',aa.
player,{},true,{},0.85,Color3.fromRGB(255,60,60),Color3.fromRGB(0,180,255),
Color3.fromRGB(255,140,0),Color3.fromRGB(220,90,255),'enemyProjectiles',false,{}
,{},{secondbossgreenorb=true,secondbossredorb=true,secondbossyelloworb=true}
local e=function()if ap then return end ap=true local e=ae:FindFirstChild(ao)if
e then for f,g in ipairs(e:GetChildren())do local h=(g.Name or''):lower():gsub(
'%s+','')if#h>0 then aq[h]=true end end e.ChildAdded:Connect(function(f)local g=
(f.Name or''):lower():gsub('%s+','')if#g>0 then aq[g]=true end end)end end
function ag.IsChasingProjectile(f)if not f or type(f)~='string'then return false
end local g=f:lower():gsub('%s+','')if#g==0 then return false end if b[g]==true
then return true end for h in pairs(b)do if string.find(g,h,1,true)then return
true end end return false end function ag.IsEnemyProjectile(f)e()if not f or
type(f)~='string'then return false end local g=f:lower():gsub('%s+','')if#g==0
then return false end if ar[g]==true then return false end return aq[g]==true
end function ag.BindDetection(f)c=f or nil end function ag.IsEnabled()return ah
end local f=function()local f=af and af.Character if not f then return nil end
local g=f:FindFirstChild'HumanoidRootPart'or f.PrimaryPart if not g then return
nil end return g.Position.Y-2.5 end local g,h=function(g)if not g or not g.
Parent then return 2.5 end local h=f()if h then local i=h+2.5 local j,k=i-g.
Position.Y,g.Size.Y/2+1.2 return math.clamp(math.max(j,k),1.5,30)end return math
.clamp(g.Size.Y/2+1.8,2,10)end,function(g)return g and g.Parent and g.
Transparency<=aj end local i,j=function(i)if not i or not i.Parent then return
nil end if i:IsA'BasePart'then if h(i)then return i end elseif i:IsA'Model'then
if i.PrimaryPart and h(i.PrimaryPart)then return i.PrimaryPart end local j=i:
FindFirstChild'HumanoidRootPart'if j and h(j)then return j end for k,n in
ipairs(i:GetDescendants())do if n:IsA'BasePart'and h(n)then return n end end
else for j,k in ipairs(i:GetDescendants())do if k:IsA'BasePart'and h(k)then
return k end end end return nil end,function(i)local j,k=i and i.IsTrajectory==
true,i and i.Name or'Hazard'local n,o=ag.IsChasingProjectile(k),ag.
IsEnemyProjectile(k)local p=not j or n if n then local q,r=an,'220,100,255'
return'C',q,r,true elseif o then local q,r=j and am or al,j and'255,160,50'or
'0,210,255'return'P',q,r,p else local q,r=j and am or ak,j and'255,160,50'or
'255,80,80'return'N',q,r,p end end local k=function(k,n)if not k or not k.items
or not n then return end local o,p,q,r=j(n)local s,t=n.Name or'Hazard',''if r
then local u=n.SpawnClock or os.clock()local v=math.max(0,os.clock()-u)t=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(255,220,220)'>%s</font> <font color='rgb(255,255,255)'><b>%.1fs</b></font>]]
):format(q,o,s,v)else t=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(220,235,255)'>%s</font>]]
):format(q,o,s)end for u,v in ipairs(k.items)do if v.label and v.label.Parent
then v.label.Text=t end if v.stroke and v.stroke.Parent and v.stroke.Color~=p
then v.stroke.Color=p end end end local n=function()if not ah then return end
local n=false for o,p in pairs(ai)do local q=o.Instance if not q or not q.Parent
then ag.DetachTimerVisual(o)else if p.items then for r=#p.items,1,-1 do local s=
p.items[r]local t=s.part if not h(t)then if s.billboard and s.billboard.Parent
then pcall(function()s.billboard:Destroy()end)end table.remove(p.items,r)else if
s.billboard and s.billboard.Parent then s.billboard.StudsOffset=Vector3.new(0,g(
t),0)end end end if#p.items==0 then ag.DetachTimerVisual(o)else n=true k(p,o)end
else ag.DetachTimerVisual(o)end end end if not n and d then d:Disconnect()d=nil
end end local o,p=function()if not d and ah then d=ad.Heartbeat:Connect(n)end
end,function(o,p)local q,r=g(o),Instance.new'BillboardGui'r.Name=
'HazardLifespanTimer'r.Adornee=o r.AlwaysOnTop=true r.MaxDistance=500 r.
LightInfluence=0 r.ResetOnSpawn=false r.Active=false r.Size=UDim2.new(0,150,0,24
)r.StudsOffset=Vector3.new(0,q,0)r.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
local s=Instance.new'Frame's.Name='TimerFrame's.Size=UDim2.new(1,0,1,0)s.
BackgroundColor3=Color3.fromRGB(15,15,20)s.BackgroundTransparency=0.25 s.
BorderSizePixel=0 s.Parent=r local t=Instance.new'UICorner't.CornerRadius=UDim.
new(0,6)t.Parent=s local u=Instance.new'UIStroke'u.Name='Stroke'u.Thickness=1.3
u.Color=p or ak u.Transparency=0.15 u.Parent=s local v=Instance.new'TextLabel'v.
Name='TimerLabel'v.Size=UDim2.new(1,-6,1,0)v.Position=UDim2.new(0,3,0,0)v.
BackgroundTransparency=1 v.Font=Enum.Font.GothamBold v.TextSize=11 v.TextColor3=
Color3.fromRGB(255,255,255)v.TextStrokeTransparency=0 v.TextStrokeColor3=Color3.
fromRGB(0,0,0)v.RichText=true v.TextXAlignment=Enum.TextXAlignment.Center v.
TextYAlignment=Enum.TextYAlignment.Center v.Text=''v.Parent=s r.Parent=o return
r,v,u end function ag.AttachTimerVisual(q)if not ah or not q then return end
local r=q.Name or(q.Instance and q.Instance.Name)or''if(ac.IsIceSpikesChain and
ac.IsIceSpikesChain(r))or(ac.IsSecondBossCircleChain and ac.
IsSecondBossCircleChain(r))then return end if ai[q]then ag.DetachTimerVisual(q)
end local s=q.Instance if not s or not s.Parent then return end local t,u=j(q)
local v=ac.GetHazardZones(q)local w,x,y=v and v.zones,{},{}local z,A=function(z,
A,B,C,D)local E={billboard=A,label=B,stroke=C,part=z,zone=D}table.insert(x,E)
local F=z:GetPropertyChangedSignal'Transparency':Connect(function()if not h(z)
then pcall(function()A:Destroy()end)end end)table.insert(y,F)local G=z.
AncestryChanged:Connect(function(G,H)if not H then pcall(function()A:Destroy()
end)end end)table.insert(y,G)end if w and#w>0 then if s:IsA'Model'then if s.
PrimaryPart and h(s.PrimaryPart)then A=s.PrimaryPart elseif s:FindFirstChild
'HumanoidRootPart'and h(s:FindFirstChild'HumanoidRootPart')then A=s:
FindFirstChild'HumanoidRootPart'end end if not A then local B,C=v.center,math.
huge for D,E in ipairs(w)do local F=E.part if h(F)then if B then local G,H=F.
Position.X-B.X,F.Position.Z-B.Z local I=G*G+H*H if I<C then C=I A=F end else A=F
break end end end end end if not A then A=i(s)end if A and h(A)then local B,C,D=
p(A,u)z(A,B,C,D,nil)end if#x>0 then local B={items=x,connections=y}ai[q]=B k(B,q
)o()end end function ag.DetachTimerVisual(q)if not q then return end local r=ai[
q]if not r then return end if r.connections then for s,t in ipairs(r.connections
)do pcall(function()t:Disconnect()end)end table.clear(r.connections)end if r.
items then for s,t in ipairs(r.items)do if t.billboard and t.billboard.Parent
then pcall(function()t.billboard:Destroy()end)end end table.clear(r.items)end ai
[q]=nil end function ag.UpdateHazardVisualColor(q,r)if not q then return end
local s=ai[q]if s then k(s,q)else ag.AttachTimerVisual(q)end end function ag.
ClearAll()if d then d:Disconnect()d=nil end for q in pairs(ai)do ag.
DetachTimerVisual(q)end table.clear(ai)end function ag.RefreshAll()ag.ClearAll()
if not ah or not c then return end for q,r in pairs(c.GetActiveHazardsMap())do
if r then ag.AttachTimerVisual(r)end end end function ag.SetEnabled(q)ah=q and
true or false if ah then ag.RefreshAll()else ag.ClearAll()end end ab.Register(
function()ag.ClearAll()end)return ag end function a.m()local aa,ab,ac,ad=a.load
'a',a.load'b',a.load'j',a.load'l'local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar
,b,c,d,e=aa.RunService or game:GetService'RunService',aa.player,{},false,45,{
secondbossmovingbeam=80},{firstbossbigspike=28,firstbossseekingspikes=10},{},
0.85,Color3.fromRGB(255,140,0),0.65,0.2,3.5,{firstbossseekingspikes=
'look_vector',firstbossbigspike='look_vector',firstbossbeampart='look_vector',
secondbossmovingbeam='look_vector'},function(ae)if not ae or type(ae)~='string'
then return false end local af=ae:lower():gsub('%s+','')return string.find(af,
'firstbossbeampart',1,true)~=nil end,function(ae)if not ae then return
'seeking_spike'end local af=typeof(ae)=='string'and ae or(ae.Name or'')local ag=
af:lower():gsub('%s+','')if not string.find(ag,'firstbossbeampart',1,true)then
if string.find(ag,'bigspike',1,true)and not string.find(ag,'seekingspike',1,true
)then return'big_spike'end if string.find(ag,'seekingspike',1,true)then return
'seeking_spike'end return nil end if typeof(ae)=='Instance'then local ah=ae:
FindFirstChildWhichIsA('Beam',true)if ah then if ah.Width0>=25 or ah.Width1>=25
then return'big_spike'else return'seeking_spike'end end local ai=ae:IsA
'BasePart'and ae.Position or(ae:IsA'Model'and ae:GetPivot().Position)if ai then
for aj,ak in ipairs(workspace:GetChildren())do local al=ak.Name:lower():gsub(
'%s+','')if string.find(al,'firstbossbigspike',1,true)then local am=ak:IsA
'BasePart'and ak.Position or(ak:IsA'Model'and ak:GetPivot().Position)if am and(
am-ai).Magnitude<15 then return'big_spike'end elseif string.find(al,
'seekingspike',1,true)then local am=ak:IsA'BasePart'and ak.Position or(ak:IsA
'Model'and ak:GetPivot().Position)if am and(am-ai).Magnitude<15 then return
'seeking_spike'end end end end end return'seeking_spike'end local f,g=function(f
,g)if not f or type(f)~='string'then return false end local h=f:lower():gsub(
'%s+','')if#h==0 or string.find(h,'seekingspike',1,true)then return false end if
string.find(h,'firstbossbeampart',1,true)then return c(g)=='big_spike'end return
string.find(h,'firstbossbigspike',1,true)~=nil or string.find(h,'bigspike',1,
true)~=nil end,function(f,g)if not f or type(f)~='string'then return false end
local h=f:lower():gsub('%s+','')if#h==0 or string.find(h,'firstbossbigspike',1,
true)then return false end if string.find(h,'firstbossbeampart',1,true)then
return c(g)=='seeking_spike'end return string.find(h,'firstbossseekingspikes',1,
true)~=nil or string.find(h,'seekingspike',1,true)~=nil end local h,i=function(h
,i)return f(h,i)or g(h,i)end,function(h)if not h or not h.Parent then return nil
,nil,nil,nil end local i,j=((h.Name or''):lower())if b(i)then j=h:IsA'BasePart'
and h or h:FindFirstChildWhichIsA'BasePart'end if not j then local k=h:IsA
'BasePart'and h.Position or(h:IsA'Model'and h:GetPivot().Position)if k then
local n,o=35,f(h.Name,h)and'big_spike'or'seeking_spike'for p,q in ipairs(
workspace:GetChildren())do local r=q.Name:lower()if b(r)or string.find(r,
'beampart',1,true)then if c(q)==o then local s=q:IsA'BasePart'and q.Position or(
q:IsA'Model'and q:GetPivot().Position)if s then local t=(s-k).Magnitude if t<n
then n=t j=q end end end end end end end if not j then return nil,nil,nil,nil
end local k=j:FindFirstChild('Attachment2',true)if not k or not k:IsA
'Attachment'then for n,o in ipairs(j:GetDescendants())do if o:IsA'Attachment'and
o.Name~='Attachment0'and o.Name~='Attachment1'then k=o break end end end local n
,o=j.Position,k and k.WorldPosition if o and n then local p=o-n local q=Vector3.
new(p.X,0,p.Z)local r=q.Magnitude if r>5 then local s=q.Unit return r,s,n,o end
end return nil,nil,nil,nil end local j=function(j)if not j then return nil end
local k,n,o,p=0,0,0,{}if j:IsA'BasePart'then table.insert(p,j)else for q,r in
ipairs(j:GetDescendants())do if r:IsA'BasePart'then table.insert(p,r)end end end
for q,r in ipairs(p)do local s,t=r.Size,r:FindFirstChildWhichIsA('SpecialMesh',
true)if t then s=Vector3.new(s.X*math.abs(t.Scale.X),s.Y*math.abs(t.Scale.Y),s.Z
*math.abs(t.Scale.Z))end k=math.max(k,s.X)n=math.max(n,s.Y)o=math.max(o,s.Z)end
if k<=0 and n<=0 and o<=0 then return nil end local q={k,n,o}table.sort(q)local
r=q[2]if r<2 then r=math.max(q[1],q[2])end return r end local k,n=function(k)if
ak.firstbossbigspike then return ak.firstbossbigspike end if cachedBigSpikeWidth
then return cachedBigSpikeWidth end if k and not b(k.Name)then local n=j(k)if n
and n>=4 then cachedBigSpikeWidth=math.clamp(n,8,60)return cachedBigSpikeWidth
end end for n,o in ipairs(workspace:GetChildren())do local p=o.Name:lower()if
string.find(p,'firstbossbigspike',1,true)or(string.find(p,'bigspike',1,true)and
not string.find(p,'seekingspike',1,true)and not b(p))then local q=j(o)if q and q
>=4 then cachedBigSpikeWidth=math.clamp(q,8,60)return cachedBigSpikeWidth end
end end local n=game:GetService'ReplicatedStorage'local o=n:FindFirstChild
'enemyProjectiles'local p=o and o:FindFirstChild'firstBossBigSpike'if p then
local q=j(p)if q and q>=4 then cachedBigSpikeWidth=math.clamp(q,8,60)return
cachedBigSpikeWidth end end return 28 end local o=function(o)if ak.
firstbossseekingspikes then return ak.firstbossseekingspikes end if n then
return n end if o and not b(o.Name)then local p=j(o)if p and p>=2 then n=math.
clamp(p,4,40)return n end end for p,q in ipairs(workspace:GetChildren())do local
r=q.Name:lower():gsub('%s+','')if string.find(r,'seekingspike',1,true)and not b(
r)then local s=j(q)if s and s>=2 then n=math.clamp(s,4,40)return n end end end
local p=game:GetService'ReplicatedStorage'local q=p:FindFirstChild
'enemyProjectiles'local r=q and q:FindFirstChild'firstBossSeekingSpikes'if r
then local s=j(r)if s and s>=2 then n=math.clamp(s,4,40)return n end end return
10 end local p,q,r=function(p,q)if f(p,q)then return k(q)else return o(q)end end
,function(p)if not p then return ai end local q,r=''if type(p)=='string'then q=p
elseif type(p)=='table'then q=p.Name or(p.Instance and p.Instance.Name)or''r=al[
p]end local s=(r and r.mainPart)or(type(p)=='table'and p.Instance)if h(q,s)then
if r and r.beamLength then return r.beamLength end if f(q,s)then return aj.
firstbossbigspike or 140 else return aj.firstbossseekingspikes or 80 end end if
r and r.beamLength then return r.beamLength end local t=q:lower():gsub('%s+','')
if aj[t]then return aj[t]end for u,v in pairs(aj)do if string.find(t,u,1,true)
then return v end end return ai end,function()local p=af and af.Character if not
p then return nil end local q=p:FindFirstChild'HumanoidRootPart'or p.PrimaryPart
if not q then return nil end return q.Position end local s,t=function(s,t)if not
s or not t then return nil,nil end local u=s:lower():gsub('%s+','')local v=ar[u]
if not v then for w,x in pairs(ar)do if string.find(u,w,1,true)then v=x break
end end end if not v then return nil,nil end if v=='look_vector'then local w=t.
CFrame.LookVector local x=Vector3.new(w.X,0,w.Z)if x.Magnitude>0.01 then return
x.Unit,v end else local w=r()if w then local x=w-t.Position local y=Vector3.new(
x.X,0,x.Z)if y.Magnitude>0.1 then return y.Unit,v end end local x=t.CFrame.
LookVector local y=Vector3.new(x.X,0,x.Z)if y.Magnitude>0.01 then return y.Unit,
v end end return nil,nil end,function()local s=af and af.Character if not s then
return nil end local t=s:FindFirstChild'HumanoidRootPart'or s.PrimaryPart if not
t then return nil end return t.Position.Y-2.5 end function ag.BindDetection(u)d=
u or nil end function ag.IsEnabled()return ah end function ag.
GetPredictionLength()return ai end function ag.SetPredictionLength(u)if type(u)
=='number'and u>0 then ai=math.clamp(u,10,200)ag.RefreshAll()end end function ag
.GetHazardPredictionLength(u)return q(u)end function ag.GetCustomLength(u)if not
u then return nil end local v=u:lower():gsub('%s+','')return aj[v]end function
ag.SetCustomLength(u,v)if not u then return end local w=u:lower():gsub('%s+','')
if type(v)=='number'and v>0 then aj[w]=math.clamp(v,10,300)else aj[w]=nil end ag
.RefreshAll()end function ag.GetSecondBossBeamLength()return aj.
secondbossmovingbeam or 80 end function ag.SetSecondBossBeamLength(u)ag.
SetCustomLength('secondbossmovingbeam',u)end function ag.
GetFirstBossBigSpikeWidth()return ak.firstbossbigspike or 28 end function ag.
SetFirstBossBigSpikeWidth(u)if type(u)=='number'and u>0 then ak.
firstbossbigspike=math.clamp(u,6,60)else ak.firstbossbigspike=nil end
cachedBigSpikeWidth=nil ag.RefreshAll()end function ag.
GetFirstBossSeekingSpikeWidth()return ak.firstbossseekingspikes or(n or 10)end
function ag.SetFirstBossSeekingSpikeWidth(u)if type(u)=='number'and u>0 then ak.
firstbossseekingspikes=math.clamp(u,4,40)else ak.firstbossseekingspikes=nil end
n=nil ag.RefreshAll()end function ag.GetCustomWidth(u)if not u then return nil
end local v=u:lower():gsub('%s+','')return ak[v]end function ag.SetCustomWidth(u
,v)if not u then return end local w=u:lower():gsub('%s+','')if type(v)=='number'
and v>0 then ak[w]=math.clamp(v,4,100)else ak[w]=nil end ag.RefreshAll()end
function ag.IsHazardMoving(u)if not u then return false end local v=al[u]return
v and v.isMoving==true end function ag.GetHazardDirection(u)if not u then return
nil end local v=al[u]return v and v.dir or nil end local u,v=function(u,v)local
w=u.Instance if not w or not w.Parent then return nil,4 end local x,y=ac.
GetTrajectoryMargin and ac.GetTrajectoryMargin()or 2,u.Name or(w and w.Name)or''
if h(y,w)then local z=al[u]local A=(z and z.mainPart)or(w:IsA'BasePart'and w or
w.PrimaryPart or w:FindFirstChildWhichIsA'BasePart')local B,C=(z and z.
beamStartPos)or(A and A.Position)or w.Position,p(y,A)local D=math.max(1,C+x*2)
return Vector3.new(B.X,0,B.Z),D end local z,A={},ac.IsForceCircle and ac.
IsForceCircle(y)if w:IsA'BasePart'then if w.Transparency<=am then table.insert(z
,w)end else for B,C in ipairs(w:GetDescendants())do if C:IsA'BasePart'and C.
Parent and C.Transparency<=am then table.insert(z,C)end end end if#z==0 then
return nil,4 end local B,C,D,E=Vector3.new(-v.Z,0,v.X),math.huge,-math.huge,0
for F,G in ipairs(z)do local H,I,J=G.Position,G.Size,0 if A or(G:IsA'Part'and(G.
Shape==Enum.PartType.Ball or G.Shape==Enum.PartType.Cylinder))then J=math.max(I.
X,I.Y,I.Z)/2 else local K=G.CFrame local L,M,N,O,P,Q=K.RightVector,K.UpVector,K.
LookVector,I.X/2,I.Y/2,I.Z/2 J=O*math.abs(L.X*B.X+L.Z*B.Z)+P*math.abs(M.X*B.X+M.
Z*B.Z)+Q*math.abs(N.X*B.X+N.Z*B.Z)end local K=H.X*B.X+H.Z*B.Z C=math.min(C,K-J)D
=math.max(D,K+J)local L=H.X*v.X+H.Z*v.Z E+=L end local F,G,H=math.max(1,(D-C)+x*
2),(C+D)/2,E/#z local I=v*H+B*G return I,F end,function(u,v,w,x,y,z,A)if not v
or not v.Parent or not u or not u.Parent then return end local B=z/2 local C=
Vector3.new(w.X+x.X*B,y or w.Y,w.Z+x.Z*B)local D=C+Vector3.new(x.X,0,x.Z)local E
=CFrame.lookAt(C,D)u.CFrame=(u.Adornee==workspace.Terrain)and E or v.CFrame:
ToObjectSpace(E)u.Size=Vector3.new(A,ap,z)if not u.Visible then u.Visible=true
end end local w=function()if not ah then return end local w,x,y=false,os.clock()
,t()for z,A in pairs(al)do local B=z.Instance if not B or not B.Parent then ag.
DetachTrajectoryVisuals(z)else w=true local C,D=A.mainPart,z.Name or(B and B.
Name)local E=ad and ad.IsChasingProjectile and ad.IsChasingProjectile(D)if E
then if A.ad and A.ad.Visible then A.ad.Visible=false end A.isMoving=false z.
IsTrajectory=false elseif C and C.Parent then local F,G=C.Position,x-(A.
lastClock or x)if A.isBossSpike then if not A.beamFound then local H,I,J,K=i(C)
if H and I then A.beamFound=true A.beamLength=H A.beamDir=I A.beamStartPos=J A.
beamTargetPos=K A.dir=I end end if A.beamDir then A.dir=A.beamDir end A.isMoving
=true end if G>=0.035 then local H=F-(A.lastPos or F)local I,J=H.Magnitude/G,
Vector3.new(H.X,0,H.Z)local K,L=J.Magnitude/G,A.isMoving==true if K>=aq then A.
isMoving=true if not A.isBossSpike then A.dir=J.Unit end else if not A.isInstant
and not A.isBossSpike and G>=0.25 and I<aq then A.isMoving=false end end if A.
isMoving~=L then z.IsTrajectory=A.isMoving z.HazardZones=nil if d and d.
UpdateHazardVisualColor then pcall(d.UpdateHazardVisualColor,z,A.isMoving)end
local M=a.load'k'if M and M.UpdateHazardVisualColor then pcall(M.
UpdateHazardVisualColor,z,A.isMoving)end end A.lastPos=F A.lastClock=x end if A.
isMoving and A.dir and A.ad then local H,I=u(z,A.dir)if H then local J=q(z)v(A.
ad,C,H,A.dir,y,J,I)end else if A.ad and A.ad.Visible then A.ad.Visible=false end
end end end end if not w and e then e:Disconnect()e=nil end end local x=function
()if not e and ah then e=ae.Heartbeat:Connect(w)end end function ag.
DetachTrajectoryVisuals(y)if not y then return end local z=al[y]if not z then
return end if z.ad then pcall(function()z.ad:Destroy()end)z.ad=nil end if z.
connections then for A,B in ipairs(z.connections)do pcall(function()B:
Disconnect()end)end table.clear(z.connections)end al[y]=nil end function ag.
AttachTrajectoryVisuals(y)if not ah or not y then return end if al[y]then ag.
DetachTrajectoryVisuals(y)end local z=y.Instance if not z or not z.Parent then
return end local A=y.Name or(z and z.Name)if ad and ad.IsChasingProjectile and
ad.IsChasingProjectile(A)then y.IsTrajectory=false return end local B if z:IsA
'BasePart'then B=z else B=z.PrimaryPart or z:FindFirstChildWhichIsA'BasePart'if
not B then for C,D in ipairs(z:GetDescendants())do if D:IsA'BasePart'and D.
Parent then B=D break end end end end if not B or not B.Parent then return end
local C,D=q(y),Instance.new'BoxHandleAdornment'D.Name='HazardTrajectoryCorridor'
D.Adornee=workspace.Terrain D.Size=Vector3.new(4,ap,C)D.Color3=an D.Transparency
=ao D.ZIndex=1 D.AlwaysOnTop=true D.Visible=false D.Parent=workspace.Terrain
local E=y.Name or(z and z.Name)local F,G=b(E),h(E,z)local H=G and(f(E,z)and
'big_spike'or'seeking_spike')or nil if G then if not F then for I,J in pairs(al)
do if J and J.isBeam and J.spikeType==H then J.linkedSpike=B y.IsTrajectory=
false return end end else for I,J in pairs(al)do if J and not J.isBeam and J.
spikeType==H then y.IsTrajectory=false return end end end end local I={}if not F
then local J=B:GetPropertyChangedSignal'Transparency':Connect(function()if B.
Parent and B.Transparency>am then pcall(function()D:Destroy()end)end end)table.
insert(I,J)end local J local K=B.AncestryChanged:Connect(function(K,L)if not L
then if J and J.linkedSpike and J.linkedSpike.Parent and J.linkedSpike.
Transparency<=am then local M=J.linkedSpike.AncestryChanged:Connect(function(M,N
)if not N then pcall(function()D:Destroy()end)end end)table.insert(I,M)return
end pcall(function()D:Destroy()end)end end)table.insert(I,K)local L,M=s(E,B)
local N,O,P,Q,R=(L~=nil)if G then O,P,Q,R=i(z)if P then L=P N=true end end J={ad
=D,connections=I,mainPart=B,lastPos=B.Position,lastClock=os.clock(),velocity=
Vector3.zero,dir=L,isMoving=N,isInstant=N,instantMode=M,isBossSpike=G,isBigSpike
=f(E,z),isSeekingSpike=g(E,z),spikeType=H,isBeam=F,beamFound=O~=nil,beamLength=O
,beamDir=P,beamStartPos=Q or B.Position,beamTargetPos=R,linkedSpike=nil}if F and
H then local S=H=='big_spike'and'firstbossbigspike'or'seekingspike'for T,U in
ipairs(workspace:GetChildren())do local V=U.Name:lower():gsub('%s+','')if string
.find(V,S,1,true)and not b(V)then local W=U:IsA'BasePart'and U or(U:
FindFirstChildWhichIsA'BasePart'or(U:IsA'Model'and U.PrimaryPart))if W then
local X=(W.Position-B.Position).Magnitude if X<25 then J.linkedSpike=W break end
end end end end al[y]=J if N and L then y.IsTrajectory=true y.HazardZones=nil
local S,T,U=t(),u(y,L)local V=q(y)if T then v(D,B,T,L,S,V,U)end if d and d.
UpdateHazardVisualColor then pcall(d.UpdateHazardVisualColor,y,true)end local W=
a.load'k'if W and W.UpdateHazardVisualColor then pcall(W.UpdateHazardVisualColor
,y,true)end local X=a.load'l'if X and X.UpdateHazardVisualColor then pcall(X.
UpdateHazardVisualColor,y,true)end end x()end function ag.ClearAll()if e then e:
Disconnect()e=nil end for y in pairs(al)do ag.DetachTrajectoryVisuals(y)end
table.clear(al)end function ag.RefreshAll()ag.ClearAll()if not ah or not d then
return end for y,z in pairs(d.GetActiveHazardsMap())do ag.
AttachTrajectoryVisuals(z)end end function ag.GetNearbyTrajectories(y,z)z=z or
65 local B,C,D={},y.X,y.Z for E,F in pairs(al)do if F.isMoving and F.dir and F.
mainPart and F.mainPart.Parent then local G,H=u(E,F.dir)if G and H then local I,
J,K=q(E),G.X,G.Z local L,M=C-J,D-K local N,O=L*L+M*M,z+I+(H/2)if N<=O*O then
table.insert(B,{info=E,record=F})end end end end return B end function ag.
IsPointInAnyTrajectory(y,z,B)local C,D=y.X,y.Z z=z or 0 local E=3 if B then for
F,G in ipairs(B)do local H,I=G.info,G.record if I and I.isMoving and I.dir and I
.mainPart and I.mainPart.Parent then local J,K=u(H,I.dir)if J and K then local L
,M=q(H),I.dir local N,O,P=Vector3.new(-M.Z,0,M.X),C-J.X,D-J.Z local Q,R,S,T,U=O*
M.X+P*M.Z,O*N.X+P*N.Z,K/2,-E,L if z<=0 then if Q>=T and Q<=U and math.abs(R)<=S
then return true,H,M,J,K end else local V=0 if Q<T then V=T-Q elseif Q>U then V=
Q-U end local W=math.max(0,math.abs(R)-S)if(V*V+W*W)<=(z*z)then return true,H,M,
J,K end end end end end return false,nil,nil,nil,nil end for F,G in pairs(al)do
if G.isMoving and G.dir and G.mainPart and G.mainPart.Parent then local H,I=u(F,
G.dir)if H and I then local J,K=q(F),G.dir local L,M,N=Vector3.new(-K.Z,0,K.X),C
-H.X,D-H.Z local O,P,Q,R,S=M*K.X+N*K.Z,M*L.X+N*L.Z,I/2,-E,J if z<=0 then if O>=R
and O<=S and math.abs(P)<=Q then return true,F,K,H,I end else local T=0 if O<R
then T=R-O elseif O>S then T=O-S end local U=math.max(0,math.abs(P)-Q)if(T*T+U*U
)<=(z*z)then return true,F,K,H,I end end end end end return false,nil,nil,nil,
nil end function ag.SetEnabled(y)ah=y and true or false if ah then ag.
RefreshAll()else ag.ClearAll()end end ac.OnPaddingChanged(function()if ah then
ag.RefreshAll()end end)ab.Register(function()ag.ClearAll()end)return ag end
function a.n()local aa={Options={},Folder='Maclib',contextData={},GetService=
function(aa)return cloneref and cloneref(game:GetService(aa))or game:GetService(
aa)end}local ab,ac,ad,ae,af,ag,ah=aa.GetService'TweenService',aa.GetService
'RunService',aa.GetService'HttpService',aa.GetService'ContentProvider',aa.
GetService'UserInputService',aa.GetService'Lighting',aa.GetService'Players'local
ai,aj,ak,al,am,an,ao,ap,aq,ar,b=ac:IsStudio(),ah.LocalPlayer,{},0,false,{
interFont='rbxassetid://12187365364',userInfoBlurred='rbxassetid://18824089198',
toggleBackground='rbxassetid://18772190202',togglerHead=
'rbxassetid://18772309008',buttonImage='rbxassetid://10709791437',searchIcon=
'rbxassetid://86737463322606',colorWheel='rbxassetid://2849458409',colorTarget=
'rbxassetid://73265255323268',grid='rbxassetid://121484455191370',globe=
'rbxassetid://108952102602834',transform='rbxassetid://90336395745819',dropdown=
'rbxassetid://18865373378',sliderbar='rbxassetid://18772615246',sliderhead=
'rbxassetid://18772834246'},function()pcall(function()local ai=setthreadidentity
or set_thread_identity or setidentity or(syn and syn.set_thread_identity)if ai
then local aj=pcall(ai,7)if not aj then pcall(ai,8)end end end)end aa.Elevate=ao
local c,d=function()ao()local c=Instance.new'ScreenGui'c.ScreenInsets=Enum.
ScreenInsets.None c.ResetOnSpawn=false c.ZIndexBehavior=Enum.ZIndexBehavior.
Sibling c.DisplayOrder=2147483647 local d=ac:IsStudio()and aj:FindFirstChild
'PlayerGui'or(gethui and gethui())or(cloneref and cloneref(aa.GetService
'CoreGui')or aa.GetService'CoreGui')c.Parent=d return c end,function(c,d,e)ao()
local f,g=pcall(ab.Create,ab,c,d,e)if f and g then return g end if e and typeof(
c)=='Instance'then for h,i in pairs(e)do pcall(function()c[h]=i end)end end
return{Play=function()end,Cancel=function()end,Pause=function()end,Completed={
Wait=function()end}}end function aa:Window(e)local f={Settings=e}if e.
AcrylicBlur~=nil then aq=e.AcrylicBlur else aq=true end local g,h=c(),Instance.
new'Frame'h.Name='Notifications'h.BackgroundColor3=Color3.fromRGB(255,255,255)h.
BackgroundTransparency=1 h.BorderColor3=Color3.fromRGB(0,0,0)h.BorderSizePixel=0
h.Size=UDim2.fromScale(1,1)h.Parent=g h.ZIndex=2 local i=Instance.new
'UIListLayout'i.Name='NotificationsUIListLayout'i.Padding=UDim.new(0,10)i.
HorizontalAlignment=Enum.HorizontalAlignment.Right i.SortOrder=Enum.SortOrder.
LayoutOrder i.VerticalAlignment=Enum.VerticalAlignment.Bottom i.Parent=h local j
=Instance.new'UIPadding'j.Name='NotificationsUIPadding'j.PaddingBottom=UDim.new(
0,10)j.PaddingLeft=UDim.new(0,10)j.PaddingRight=UDim.new(0,10)j.PaddingTop=UDim.
new(0,10)j.Parent=h local k=Instance.new'Frame'k.Name='Base'k.AnchorPoint=
Vector2.new(0.5,0.5)k.BackgroundColor3=Color3.fromRGB(15,15,15)k.
BackgroundTransparency=e.AcrylicBlur and 0.05 or 0 k.BorderColor3=Color3.
fromRGB(0,0,0)k.BorderSizePixel=0 k.Position=UDim2.fromScale(0.5,0.5)k.Size=e.
Size or UDim2.fromOffset(868,650)local n=Instance.new'UIScale'n.Name=
'BaseUIScale'n.Parent=k local o=Instance.new'UICorner'o.Name='BaseUICorner'o.
CornerRadius=UDim.new(0,10)o.Parent=k local p=Instance.new'UIStroke'p.Name=
'BaseUIStroke'p.ApplyStrokeMode=Enum.ApplyStrokeMode.Border p.Color=Color3.
fromRGB(255,255,255)p.Transparency=0.9 p.Parent=k local q=Instance.new'Frame'q.
Name='Sidebar'q.BackgroundColor3=Color3.fromRGB(255,255,255)q.
BackgroundTransparency=1 q.BorderColor3=Color3.fromRGB(0,0,0)q.BorderSizePixel=0
q.Position=UDim2.fromScale(-3.5199999999999996E-8,4.69e-8)q.Size=e.SidebarWidth
and UDim2.new(0,e.SidebarWidth,1,0)or UDim2.fromScale(0.325,1)local r=Instance.
new'Frame'r.Name='Divider'r.AnchorPoint=Vector2.new(1,0)r.BackgroundColor3=
Color3.fromRGB(255,255,255)r.BackgroundTransparency=0.9 r.BorderColor3=Color3.
fromRGB(0,0,0)r.BorderSizePixel=0 r.Position=UDim2.fromScale(1,0)r.Size=UDim2.
new(0,1,1,0)r.Parent=q local s=Instance.new'TextButton's.Name='DividerInteract's
.AnchorPoint=Vector2.new(0.5,0)s.BackgroundColor3=Color3.fromRGB(255,255,255)s.
BackgroundTransparency=1 s.BorderColor3=Color3.fromRGB(0,0,0)s.BorderSizePixel=0
s.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json's.Position=
UDim2.fromScale(0.5,0)s.Size=UDim2.new(1,6,1,0)s.Text=''s.TextColor3=Color3.
fromRGB(0,0,0)s.TextSize=14 s.Parent=r local t=Instance.new'Frame't.Name=
'WindowControls't.BackgroundColor3=Color3.fromRGB(255,255,255)t.
BackgroundTransparency=1 t.BorderColor3=Color3.fromRGB(0,0,0)t.BorderSizePixel=0
t.Size=UDim2.new(1,0,0,31)local u=Instance.new'Frame'u.Name='Controls'u.
BackgroundColor3=Color3.fromRGB(119,174,94)u.BackgroundTransparency=1 u.
BorderColor3=Color3.fromRGB(0,0,0)u.BorderSizePixel=0 u.Size=UDim2.fromScale(1,1
)local v=Instance.new'UIListLayout'v.Name='UIListLayout'v.Padding=UDim.new(0,5)v
.FillDirection=Enum.FillDirection.Horizontal v.SortOrder=Enum.SortOrder.
LayoutOrder v.VerticalAlignment=Enum.VerticalAlignment.Center v.Parent=u local w
=Instance.new'UIPadding'w.Name='UIPadding'w.PaddingLeft=UDim.new(0,11)w.Parent=u
local x,y={sizes={enabled=UDim2.fromOffset(8,8),disabled=UDim2.fromOffset(7,7)},
transparencies={enabled=0,disabled=1},strokeTransparency=0.9},Instance.new
'UIStroke'y.Name='BaseUIStroke'y.ApplyStrokeMode=Enum.ApplyStrokeMode.Border y.
Color=Color3.fromRGB(255,255,255)y.Transparency=x.strokeTransparency local z=
Instance.new'TextButton'z.Name='Exit'z.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'z.Text=''z.TextColor3=Color3.
fromRGB(0,0,0)z.TextSize=14 z.AutoButtonColor=false z.BackgroundColor3=Color3.
fromRGB(250,93,86)z.BorderColor3=Color3.fromRGB(0,0,0)z.BorderSizePixel=0 local
B=Instance.new'UICorner'B.Name='UICorner'B.CornerRadius=UDim.new(1,0)B.Parent=z
z.Parent=u local C=Instance.new'TextButton'C.Name='Minimize'C.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'C.Text=''C.TextColor3=Color3.
fromRGB(0,0,0)C.TextSize=14 C.AutoButtonColor=false C.BackgroundColor3=Color3.
fromRGB(252,190,57)C.BorderColor3=Color3.fromRGB(0,0,0)C.BorderSizePixel=0 C.
LayoutOrder=1 local D=Instance.new'UICorner'D.Name='UICorner'D.CornerRadius=UDim
.new(1,0)D.Parent=C C.Parent=u local E=Instance.new'TextButton'E.Name='Maximize'
E.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'E.Text=''E.
TextColor3=Color3.fromRGB(0,0,0)E.TextSize=14 E.AutoButtonColor=false E.
BackgroundColor3=Color3.fromRGB(119,174,94)E.BorderColor3=Color3.fromRGB(0,0,0)E
.BorderSizePixel=0 E.LayoutOrder=1 local F=Instance.new'UICorner'F.Name=
'UICorner'F.CornerRadius=UDim.new(1,0)F.Parent=E E.Parent=u local G=function(G,H
)local I,J=H and x.sizes.enabled or x.sizes.disabled,H and x.transparencies.
enabled or x.transparencies.disabled G.Size=I G.BackgroundTransparency=J G.
Active=H G.Interactable=H for K,L in ipairs(G:GetChildren())do if L:IsA
'UIStroke'then L.Transparency=J end end if not H then y:Clone().Parent=G end end
G(E,false)local H={z,C}for I,J in pairs(H)do local K,L=J.Name,true if e.
DisabledWindowControls and table.find(e.DisabledWindowControls,K)then L=false
end G(J,L)end u.Parent=t local I=Instance.new'Frame'I.Name='Divider'I.
AnchorPoint=Vector2.new(0,1)I.BackgroundColor3=Color3.fromRGB(255,255,255)I.
BackgroundTransparency=0.9 I.BorderColor3=Color3.fromRGB(0,0,0)I.BorderSizePixel
=0 I.Position=UDim2.fromScale(0,1)I.Size=UDim2.new(1,0,0,1)I.Parent=t t.Parent=q
local J=Instance.new'Frame'J.Name='Information'J.BackgroundColor3=Color3.
fromRGB(255,255,255)J.BackgroundTransparency=1 J.BorderColor3=Color3.fromRGB(0,0
,0)J.BorderSizePixel=0 J.Position=UDim2.fromOffset(0,31)J.Size=UDim2.new(1,0,0,
60)local K=Instance.new'Frame'K.Name='Divider'K.AnchorPoint=Vector2.new(0,1)K.
BackgroundColor3=Color3.fromRGB(255,255,255)K.BackgroundTransparency=0.9 K.
BorderColor3=Color3.fromRGB(0,0,0)K.BorderSizePixel=0 K.Position=UDim2.
fromScale(0,1)K.Size=UDim2.new(1,0,0,1)K.Parent=J local L=Instance.new'Frame'L.
Name='InformationHolder'L.BackgroundColor3=Color3.fromRGB(255,255,255)L.
BackgroundTransparency=1 L.BorderColor3=Color3.fromRGB(0,0,0)L.BorderSizePixel=0
L.Size=UDim2.fromScale(1,1)local M=Instance.new'UIPadding'M.Name=
'InformationHolderUIPadding'M.PaddingBottom=UDim.new(0,10)M.PaddingLeft=UDim.
new(0,23)M.PaddingRight=UDim.new(0,22)M.PaddingTop=UDim.new(0,10)M.Parent=L
local N=Instance.new'ImageButton'N.Name='GlobalSettingsButton'N.Image=an.globe N
.ImageTransparency=0.5 N.AnchorPoint=Vector2.new(1,0.5)N.BackgroundColor3=Color3
.fromRGB(255,255,255)N.BackgroundTransparency=1 N.BorderColor3=Color3.fromRGB(0,
0,0)N.BorderSizePixel=0 N.Position=UDim2.fromScale(1,0.5)N.Size=UDim2.
fromOffset(16,16)N.Parent=L local O=function(O)if O=='Default'then d(N,TweenInfo
.new(0.2,Enum.EasingStyle.Sine),{ImageTransparency=0.5}):Play()elseif O=='Hover'
then d(N,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{ImageTransparency=0.3}):Play(
)end end N.MouseEnter:Connect(function()O'Hover'end)N.MouseLeave:Connect(
function()O'Default'end)local P=Instance.new'Frame'P.Name='TitleFrame'P.
BackgroundColor3=Color3.fromRGB(255,255,255)P.BackgroundTransparency=1 P.
BorderColor3=Color3.fromRGB(0,0,0)P.BorderSizePixel=0 P.Size=UDim2.fromScale(1,1
)local Q=Instance.new'TextLabel'Q.Name='Title'Q.FontFace=Font.new(an.interFont,
Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)Q.Text=e.Title Q.TextColor3=
Color3.fromRGB(255,255,255)Q.RichText=true Q.TextSize=18 Q.TextTransparency=0.1
Q.TextTruncate=Enum.TextTruncate.SplitWord Q.TextXAlignment=Enum.TextXAlignment.
Left Q.TextYAlignment=Enum.TextYAlignment.Top Q.AutomaticSize=Enum.AutomaticSize
.Y Q.BackgroundColor3=Color3.fromRGB(255,255,255)Q.BackgroundTransparency=1 Q.
BorderColor3=Color3.fromRGB(0,0,0)Q.BorderSizePixel=0 Q.Size=UDim2.new(1,-20,0,0
)Q.Parent=P local R=Instance.new'TextLabel'R.Name='Subtitle'R.FontFace=Font.new(
an.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)R.RichText=true R.Text
=e.Subtitle R.RichText=true R.TextColor3=Color3.fromRGB(255,255,255)R.TextSize=
12 R.TextTransparency=0.7 R.TextTruncate=Enum.TextTruncate.SplitWord R.
TextXAlignment=Enum.TextXAlignment.Left R.TextYAlignment=Enum.TextYAlignment.Top
R.AutomaticSize=Enum.AutomaticSize.Y R.BackgroundColor3=Color3.fromRGB(255,255,
255)R.BackgroundTransparency=1 R.BorderColor3=Color3.fromRGB(0,0,0)R.
BorderSizePixel=0 R.LayoutOrder=1 R.Size=UDim2.new(1,-20,0,0)R.Parent=P local S=
Instance.new'UIListLayout'S.Name='TitleFrameUIListLayout'S.Padding=UDim.new(0,3)
S.SortOrder=Enum.SortOrder.LayoutOrder S.VerticalAlignment=Enum.
VerticalAlignment.Center S.Parent=P P.Parent=L L.Parent=J J.Parent=q local T=
Instance.new'Frame'T.Name='SidebarGroup'T.BackgroundColor3=Color3.fromRGB(255,
255,255)T.BackgroundTransparency=1 T.BorderColor3=Color3.fromRGB(0,0,0)T.
BorderSizePixel=0 T.Position=UDim2.fromOffset(0,91)T.Size=UDim2.new(1,0,1,-91)
local U=Instance.new'Frame'U.Name='UserInfo'U.AnchorPoint=Vector2.new(0,1)U.
BackgroundColor3=Color3.fromRGB(255,255,255)U.BackgroundTransparency=1 U.
BorderColor3=Color3.fromRGB(0,0,0)U.BorderSizePixel=0 U.Position=UDim2.
fromScale(0,1)U.Size=UDim2.new(1,0,0,107)local V=Instance.new'Frame'V.Name=
'InformationGroup'V.BackgroundColor3=Color3.fromRGB(255,255,255)V.
BackgroundTransparency=1 V.BorderColor3=Color3.fromRGB(0,0,0)V.BorderSizePixel=0
V.Size=UDim2.fromScale(1,1)local W=Instance.new'UIPadding'W.Name=
'InformationGroupUIPadding'W.PaddingBottom=UDim.new(0,17)W.PaddingLeft=UDim.new(
0,25)W.Parent=V local X=Instance.new'UIListLayout'X.Name=
'InformationGroupUIListLayout'X.FillDirection=Enum.FillDirection.Horizontal X.
SortOrder=Enum.SortOrder.LayoutOrder X.VerticalAlignment=Enum.VerticalAlignment.
Center X.Parent=V local Y,Z,_=aj.UserId,Enum.ThumbnailType.AvatarBust,Enum.
ThumbnailSize.Size48x48 local as,at=ah:GetUserThumbnailAsync(Y,Z,_)local au=
Instance.new'ImageLabel'au.Name='Headshot'au.BackgroundColor3=Color3.fromRGB(255
,255,255)au.BackgroundTransparency=1 au.BorderColor3=Color3.fromRGB(0,0,0)au.
BorderSizePixel=0 au.Size=UDim2.fromOffset(32,32)au.Image=(at and as)or
'rbxassetid://0'local av=Instance.new'UICorner'av.Name='UICorner'av.CornerRadius
=UDim.new(1,0)av.Parent=au local aw=Instance.new'UIStroke'aw.Name='BaseUIStroke'
aw.ApplyStrokeMode=Enum.ApplyStrokeMode.Border aw.Color=Color3.fromRGB(255,255,
255)aw.Transparency=0.9 aw.Parent=au au.Parent=V local ax=Instance.new'Frame'ax.
Name='UserAndDisplayFrame'ax.BackgroundColor3=Color3.fromRGB(255,255,255)ax.
BackgroundTransparency=1 ax.BorderColor3=Color3.fromRGB(0,0,0)ax.BorderSizePixel
=0 ax.LayoutOrder=1 ax.Size=UDim2.new(1,-42,0,32)local ay=Instance.new
'TextLabel'ay.Name='DisplayName'ay.FontFace=Font.new(an.interFont,Enum.
FontWeight.SemiBold,Enum.FontStyle.Normal)ay.Text=aj.DisplayName ay.TextColor3=
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
'Username'aB.FontFace=Font.new(an.interFont,Enum.FontWeight.SemiBold,Enum.
FontStyle.Normal)aB.Text='@'..aj.Name aB.TextColor3=Color3.fromRGB(255,255,255)
aB.TextSize=12 aB.TextTransparency=0.7 aB.TextTruncate=Enum.TextTruncate.
SplitWord aB.TextXAlignment=Enum.TextXAlignment.Left aB.TextYAlignment=Enum.
TextYAlignment.Top aB.AutomaticSize=Enum.AutomaticSize.XY aB.BackgroundColor3=
Color3.fromRGB(255,255,255)aB.BackgroundTransparency=1 aB.BorderColor3=Color3.
fromRGB(0,0,0)aB.BorderSizePixel=0 aB.LayoutOrder=1 aB.Parent=ax aB.Size=UDim2.
fromScale(1,0)ax.Parent=V V.Parent=U local aC=Instance.new'UIPadding'aC.Name=
'UserInfoUIPadding'aC.PaddingLeft=UDim.new(0,10)aC.PaddingRight=UDim.new(0,10)aC
.Parent=U U.Parent=T local aD=Instance.new'UIPadding'aD.Name=
'SidebarGroupUIPadding'aD.PaddingLeft=UDim.new(0,10)aD.PaddingRight=UDim.new(0,
10)aD.PaddingTop=UDim.new(0,31)aD.Parent=T local aE=Instance.new'Frame'aE.Name=
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
new(0,2)aH.Parent=aF aF.Parent=aE aE.Parent=T T.Parent=q q.Parent=k local aI=
Instance.new'Frame'aI.Name='Content'aI.AnchorPoint=Vector2.new(1,0)aI.
BackgroundColor3=Color3.fromRGB(255,255,255)aI.BackgroundTransparency=1 aI.
BorderColor3=Color3.fromRGB(0,0,0)aI.BorderSizePixel=0 aI.Position=UDim2.
fromScale(1,4.69e-8)aI.Size=UDim2.new(0,(k.AbsoluteSize.X-q.AbsoluteSize.X),1,0)
local aJ,aK,aL,aM,aN,aO=false,q.AbsoluteSize.X,20,107 local aP,aQ=k.AbsoluteSize
.X-aM,{DefaultTransparency=0.9,HoverTransparency=0.85,EasingStyle=Enum.
EasingStyle.Sine}local aR=function(aR)d(r,TweenInfo.new(0.2,aQ.EasingStyle),{
BackgroundTransparency=aR=='Idle'and aQ.DefaultTransparency or aQ.
HoverTransparency}):Play()end s.MouseEnter:Connect(function()aR'Hover'end)s.
MouseLeave:Connect(function()aR'Idle'end)s.MouseButton1Down:Connect(function()aJ
=true aN=af:GetMouseLocation().X aO=q.AbsoluteSize.X end)af.InputEnded:Connect(
function(aS)if aS.UserInputType==Enum.UserInputType.MouseButton1 then aJ=false
end end)af.InputChanged:Connect(function(aS)if aJ and aS.UserInputType==Enum.
UserInputType.MouseMovement then local aT=af:GetMouseLocation().X-aN local aU=aO
+aT if math.abs(aU-aK)<aL then aU=aK else aU=math.clamp(aU,aM,aP)end q.Size=
UDim2.new(0,aU,1,0)aI.Size=UDim2.new(0,k.AbsoluteSize.X-aU,1,0)end end)local aS=
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
aW.Image=an.transform aW.ImageTransparency=0.7 aW.AnchorPoint=Vector2.new(1,0.5)
aW.BackgroundColor3=Color3.fromRGB(255,255,255)aW.BackgroundTransparency=1 aW.
BorderColor3=Color3.fromRGB(0,0,0)aW.BorderSizePixel=0 aW.Position=UDim2.
fromScale(1,0.5)aW.Size=UDim2.fromOffset(15,15)aW.Parent=aU aW.Visible=not e.
DragStyle or e.DragStyle==1 local aX=Instance.new'TextButton'aX.Name='Interact'
aX.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'aX.Text=''aX.
TextColor3=Color3.fromRGB(0,0,0)aX.TextSize=14 aX.AnchorPoint=Vector2.new(0.5,
0.5)aX.BackgroundColor3=Color3.fromRGB(255,255,255)aX.BackgroundTransparency=1
aX.BorderColor3=Color3.fromRGB(0,0,0)aX.BorderSizePixel=0 aX.Position=UDim2.
fromScale(0.5,0.5)aX.Size=UDim2.fromOffset(40,40)aX.Parent=aW local aY=function(
aY)if aY=='Default'then d(aW,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
ImageTransparency=0.7}):Play()elseif aY=='Hover'then d(aW,TweenInfo.new(0.2,Enum
.EasingStyle.Sine),{ImageTransparency=0.4}):Play()end end aX.MouseEnter:Connect(
function()aY'Hover'end)aX.MouseLeave:Connect(function()aY'Default'end)local aZ,
a_,a0,a1=false local a2,a3,a4=function(a2)local a3=a2.Position-a0 k.Position=
UDim2.new(a1.X.Scale,a1.X.Offset+a3.X,a1.Y.Scale,a1.Y.Offset+a3.Y)end,function(
a2)if a2.UserInputType==Enum.UserInputType.MouseButton1 or a2.UserInputType==
Enum.UserInputType.Touch then aZ=true a0=a2.Position a1=k.Position a2.Changed:
Connect(function()if a2.UserInputState==Enum.UserInputState.End then aZ=false
end end)end end,function(a2)if aZ and(a2.UserInputType==Enum.UserInputType.
MouseMovement or a2.UserInputType==Enum.UserInputType.Touch)then a_=a2 end end
if not e.DragStyle or e.DragStyle==1 then aX.InputBegan:Connect(function(a5)if
a5.UserInputType==Enum.UserInputType.MouseButton1 or a5.UserInputType==Enum.
UserInputType.Touch then a3(a5)end end)aX.InputChanged:Connect(a4)af.
InputChanged:Connect(function(a5)if a5==a_ and aZ then a2(a5)end end)aX.
InputEnded:Connect(function(a5)if a5.UserInputType==Enum.UserInputType.
MouseButton1 or a5.UserInputType==Enum.UserInputType.Touch then aZ=false end end
)elseif e.DragStyle==2 then k.InputBegan:Connect(function(a5)if a5.UserInputType
==Enum.UserInputType.MouseButton1 or a5.UserInputType==Enum.UserInputType.Touch
then a3(a5)end end)k.InputChanged:Connect(a4)af.InputChanged:Connect(function(a5
)if a5==a_ and aZ then a2(a5)end end)k.InputEnded:Connect(function(a5)if a5.
UserInputType==Enum.UserInputType.MouseButton1 or a5.UserInputType==Enum.
UserInputType.Touch then aZ=false end end)end local a5=Instance.new'TextLabel'a5
.Name='CurrentTab'a5.FontFace=Font.new(an.interFont)a5.RichText=true a5.Text=''
a5.RichText=true a5.TextColor3=Color3.fromRGB(255,255,255)a5.TextSize=15 a5.
TextTransparency=0.5 a5.TextTruncate=Enum.TextTruncate.SplitWord a5.
TextXAlignment=Enum.TextXAlignment.Left a5.TextYAlignment=Enum.TextYAlignment.
Top a5.AnchorPoint=Vector2.new(0,0.5)a5.AutomaticSize=Enum.AutomaticSize.Y a5.
BackgroundColor3=Color3.fromRGB(255,255,255)a5.BackgroundTransparency=1 a5.
BorderColor3=Color3.fromRGB(0,0,0)a5.BorderSizePixel=0 a5.Position=UDim2.
fromScale(0,0.5)a5.Size=UDim2.fromScale(0.9,0)a5.Parent=aU aU.Parent=aS aS.
Parent=aI aI.Parent=k local a6=Instance.new'Frame'a6.Name='GlobalSettings'a6.
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
k k.Parent=g function f:UpdateTitle(bc)Q.Text=bc end function f:UpdateSubtitle(
bc)R.Text=bc end local bc,bd=bb.Scale==1 and true or false local be=function()if
not bc then local be=d(bb,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=1})be:Play()be.Completed:Wait()bc=true elseif bc
then local be=d(bb,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=0})be:Play()be.Completed:Wait()bc=false end end N.
MouseButton1Click:Connect(function()if not ar then return end be()end)a6.
MouseEnter:Connect(function()bd=true end)a6.MouseLeave:Connect(function()bd=
false end)af.InputEnded:Connect(function(bf)if bf.UserInputType==Enum.
UserInputType.MouseButton1 and bc and not bd then be()end end)local bf,bg,bh,bi,
bj=k,ad,workspace.CurrentCamera,'Glass',{}local bk,bl=(bg:GenerateGUID(true))for
bm,bn in pairs(ag:GetChildren())do if not bn:IsA'DepthOfFieldEffect'and bn:
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
bq=bq.Parent end return true end local br=function(br)if not bq(bm)or not aq or
am then for bs,bt in pairs(bo)do bt.Parent=nil bl.Enabled=false bl.Parent=nil
end return end if not bl.Parent then bl.Parent=ag end bl.Enabled=true local bs,
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
RenderStepped:Connect(br)function f:GlobalSetting(bs)ar=true local bt,bu={},
Instance.new'TextButton'bu.Name='GlobalSetting'bu.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'bu.Text=''bu.TextColor3=Color3.
fromRGB(0,0,0)bu.TextSize=14 bu.BackgroundColor3=Color3.fromRGB(255,255,255)bu.
BackgroundTransparency=1 bu.BorderColor3=Color3.fromRGB(0,0,0)bu.BorderSizePixel
=0 bu.Size=UDim2.fromOffset(200,30)local bv=Instance.new'UIPadding'bv.Name=
'GlobalSettingToggleUIPadding'bv.PaddingLeft=UDim.new(0,15)bv.Parent=bu local bw
=Instance.new'TextLabel'bw.Name='SettingName'bw.FontFace=Font.new(an.interFont)
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
local by=Instance.new'TextLabel'by.Name='Checkmark'by.FontFace=Font.new(an.
interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)by.Text='\u{2713}'by.
TextColor3=Color3.fromRGB(255,255,255)by.TextSize=13 by.TextTransparency=1 by.
TextXAlignment=Enum.TextXAlignment.Left by.TextYAlignment=Enum.TextYAlignment.
Top by.AnchorPoint=Vector2.new(0,0.5)by.AutomaticSize=Enum.AutomaticSize.Y by.
BackgroundColor3=Color3.fromRGB(255,255,255)by.BackgroundTransparency=1 by.
BorderColor3=Color3.fromRGB(0,0,0)by.BorderSizePixel=0 by.LayoutOrder=-1 by.
Position=UDim2.fromScale(1.3e-7,0.5)by.Size=UDim2.fromOffset(-10,0)by.Parent=bu
bu.Parent=a6 local bz={duration=0.2,easingStyle=Enum.EasingStyle.Quint,
transparencyIn=0.2,transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-
bx.Padding.Offset,waitTime=1}local bA={checkIn=d(by,TweenInfo.new(bz.duration,bz
.easingStyle),{Size=UDim2.new(by.Size.X.Scale,bz.checkSizeIncrease,by.Size.Y.
Scale,by.Size.Y.Offset)}),checkOut=d(by,TweenInfo.new(bz.duration,bz.easingStyle
),{Size=UDim2.new(by.Size.X.Scale,bz.checkSizeDecrease,by.Size.Y.Scale,by.Size.Y
.Offset)}),nameIn=d(bw,TweenInfo.new(bz.duration,bz.easingStyle),{
TextTransparency=bz.transparencyIn}),nameOut=d(bw,TweenInfo.new(bz.duration,bz.
easingStyle),{TextTransparency=bz.transparencyOut})}local bB,bC=function(bB)if
not bB then bA.checkOut:Play()bA.nameOut:Play()by:GetPropertyChangedSignal
'AbsoluteSize':Connect(function()if by.AbsoluteSize.X<=0 then by.
TextTransparency=1 end end)else bA.checkIn:Play()bA.nameIn:Play()by:
GetPropertyChangedSignal'AbsoluteSize':Connect(function()if by.AbsoluteSize.X>0
then by.TextTransparency=0 end end)end end,bs.Default bB(bC)bu.MouseButton1Click
:Connect(function()bC=not bC bB(bC)task.spawn(function()if bs.Callback then bs.
Callback(bC)end end)end)function bt:UpdateName(bD)bw.Text=bD end function bt:
UpdateState(bD)bB(bD)bC=bD end return bt end function f:TabGroup()local bs,bt={}
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
=0 bA.Position=UDim2.fromScale(0.5,0)bA.Size=UDim2.new(1,-21,0,40)al+=1 bA.
LayoutOrder=al local bB=Instance.new'UICorner'bB.Name='TabSwitcherUICorner'bB.
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
'TextLabel'bF.Name='TabSwitcherName'bF.FontFace=Font.new(an.interFont,Enum.
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
Name='ButtonInteract'b0.FontFace=Font.new(an.interFont)b0.RichText=true b0.
TextColor3=Color3.fromRGB(255,255,255)b0.TextSize=13 b0.TextTransparency=0.5 b0.
TextTruncate=Enum.TextTruncate.AtEnd b0.TextXAlignment=Enum.TextXAlignment.Left
b0.BackgroundColor3=Color3.fromRGB(255,255,255)b0.BackgroundTransparency=1 b0.
BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel=0 b0.Size=UDim2.fromScale(1
,1)b0.Parent=b_ b0.Text=bZ.Settings.Name local b1=Instance.new'ImageLabel'b1.
Name='ButtonImage'b1.Image=an.buttonImage b1.ImageTransparency=0.5 b1.
AnchorPoint=Vector2.new(1,0.5)b1.BackgroundColor3=Color3.fromRGB(255,255,255)b1.
BackgroundTransparency=1 b1.BorderColor3=Color3.fromRGB(0,0,0)b1.BorderSizePixel
=0 b1.Position=UDim2.fromScale(1,0.5)b1.Size=UDim2.fromOffset(15,15)b1.Parent=b_
local b2={DefaultTransparency=0.5,HoverTransparency=0.3,EasingStyle=Enum.
EasingStyle.Sine}local b3,b4=function(b3)if b3=='Idle'then d(b0,TweenInfo.new(
0.2,b2.EasingStyle),{TextTransparency=b2.DefaultTransparency}):Play()d(b1,
TweenInfo.new(0.2,b2.EasingStyle),{ImageTransparency=b2.DefaultTransparency}):
Play()elseif b3=='Hover'then d(b0,TweenInfo.new(0.2,b2.EasingStyle),{
TextTransparency=b2.HoverTransparency}):Play()d(b1,TweenInfo.new(0.2,b2.
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
Font.new(an.interFont)b0.Text=bZ.Settings.Name b0.RichText=true b0.TextColor3=
Color3.fromRGB(255,255,255)b0.TextSize=13 b0.TextTransparency=0.5 b0.
TextTruncate=Enum.TextTruncate.AtEnd b0.TextXAlignment=Enum.TextXAlignment.Left
b0.TextYAlignment=Enum.TextYAlignment.Top b0.AnchorPoint=Vector2.new(0,0.5)b0.
AutomaticSize=Enum.AutomaticSize.Y b0.BackgroundColor3=Color3.fromRGB(255,255,
255)b0.BackgroundTransparency=1 b0.BorderColor3=Color3.fromRGB(0,0,0)b0.
BorderSizePixel=0 b0.Position=UDim2.fromScale(0,0.5)b0.Size=UDim2.new(1,-50,0,0)
b0.Parent=b_ local b1=Instance.new'ImageButton'b1.Name='Toggle'b1.Image=an.
toggleBackground b1.ImageColor3=Color3.fromRGB(87,86,86)b1.AutoButtonColor=false
b1.AnchorPoint=Vector2.new(1,0.5)b1.BackgroundColor3=Color3.fromRGB(255,255,255)
b1.BackgroundTransparency=1 b1.BorderColor3=Color3.fromRGB(0,0,0)b1.
BorderSizePixel=0 b1.Position=UDim2.fromScale(1,0.5)b1.Size=UDim2.fromOffset(41,
21)b1.ImageTransparency=0.5 local b2=Instance.new'UIPadding'b2.Name=
'ToggleUIPadding'b2.PaddingBottom=UDim.new(0,1)b2.PaddingLeft=UDim.new(0,-2)b2.
PaddingRight=UDim.new(0,3)b2.PaddingTop=UDim.new(0,1)b2.Parent=b1 local b3=
Instance.new'ImageLabel'b3.Name='TogglerHead'b3.Image=an.togglerHead b3.
ImageColor3=Color3.fromRGB(255,255,255)b3.AnchorPoint=Vector2.new(1,0.5)b3.
BackgroundColor3=Color3.fromRGB(255,255,255)b3.BackgroundTransparency=1 b3.
BorderColor3=Color3.fromRGB(0,0,0)b3.BorderSizePixel=0 b3.Position=UDim2.
fromScale(0.5,0.5)b3.Size=UDim2.fromOffset(15,15)b3.ZIndex=2 b3.Parent=b1 b3.
ImageTransparency=0.8 b1.Parent=b_ local b4,b5,b6,b7={Enabled=0,Disabled=0.5},{
Enabled=0,Disabled=0.85},{Info=TweenInfo.new(0.15,Enum.EasingStyle.Quad),
EnabledPosition=UDim2.new(1,0,0.5,0),DisabledPosition=UDim2.new(0.5,0,0.5,0)},bZ
.Settings.Default local b8=function(b8,b9)ao()local ca,cb=b8 and{b4.Enabled,b5.
Enabled}or{b4.Disabled,b5.Disabled},b8 and b6.EnabledPosition or b6.
DisabledPosition pcall(function()d(b1,b6.Info,{ImageTransparency=ca[1]}):Play()
end)pcall(function()d(b3,b6.Info,{ImageTransparency=ca[2]}):Play()end)pcall(
function()d(b3,b6.Info,{Position=cb}):Play()end)bZ.State=b8 if b9 then pcall(b9,
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
Font.new(an.interFont)b0.Text=bZ.Settings.Name b0.RichText=true b0.TextColor3=
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
'SliderValue'b2.FontFace=Font.new(an.interFont)b2.TextColor3=Color3.fromRGB(255,
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
'SliderBar'b7.Image=an.sliderbar b7.ImageColor3=Color3.fromRGB(87,86,86)b7.
BackgroundColor3=Color3.fromRGB(255,255,255)b7.BackgroundTransparency=1 b7.
BorderColor3=Color3.fromRGB(0,0,0)b7.BorderSizePixel=0 b7.Position=UDim2.
fromScale(0.219,0.457)b7.Size=UDim2.fromOffset(123,3)local b8=Instance.new
'ImageButton'b8.Name='SliderHead'b8.Image=an.sliderhead b8.AnchorPoint=Vector2.
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
.DisplayMethod]or cb.Value local ce=function(ce,cf)ao()local cg if typeof(ce)==
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
AbsoluteSize.X,b0.AbsoluteSize.X,b1.AbsoluteSize.X local cj=(ci-(cf+cg+ch+20))/n
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
Name='InputName'b0.FontFace=Font.new(an.interFont)b0.Text=bZ.Settings.Name b0.
RichText=true b0.TextColor3=Color3.fromRGB(255,255,255)b0.TextSize=13 b0.
TextTransparency=0.5 b0.TextTruncate=Enum.TextTruncate.AtEnd b0.TextXAlignment=
Enum.TextXAlignment.Left b0.TextYAlignment=Enum.TextYAlignment.Top b0.
AnchorPoint=Vector2.new(0,0.5)b0.AutomaticSize=Enum.AutomaticSize.XY b0.
BackgroundColor3=Color3.fromRGB(255,255,255)b0.BackgroundTransparency=1 b0.
BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel=0 b0.Position=UDim2.
fromScale(0,0.5)b0.Parent=b_ local b1=Instance.new'TextBox'b1.Name='InputBox'b1.
FontFace=Font.new(an.interFont)b1.Text='Hello world!'b1.TextColor3=Color3.
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
.X local cf=(ce-cd-20)/n.Scale b9.MaxSize=Vector2.new(cf,9e9)end cd()b8:
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
new'TextLabel'b0.Name='KeybindName'b0.FontFace=Font.new(an.interFont)b0.Text=bZ.
Settings.Name b0.RichText=true b0.TextColor3=Color3.fromRGB(255,255,255)b0.
TextSize=13 b0.TextTransparency=0.5 b0.TextTruncate=Enum.TextTruncate.AtEnd b0.
TextXAlignment=Enum.TextXAlignment.Left b0.TextYAlignment=Enum.TextYAlignment.
Top b0.AnchorPoint=Vector2.new(0,0.5)b0.AutomaticSize=Enum.AutomaticSize.XY b0.
BackgroundColor3=Color3.fromRGB(255,255,255)b0.BackgroundTransparency=1 b0.
BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel=0 b0.Position=UDim2.
fromScale(0,0.5)b0.Parent=b_ local b1=Instance.new'TextBox'b1.Name='BinderBox'b1
.CursorPosition=-1 b1.FontFace=Font.new(an.interFont)b1.PlaceholderText='...'b1.
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
Name='DropdownName'b4.FontFace=Font.new(an.interFont)b4.Text=bX.Default and(bZ.
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
new'ImageLabel'b7.Name='DropdownImage'b7.Image=an.dropdown b7.ImageTransparency=
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
'SearchIcon'cd.Image=an.searchIcon cd.ImageColor3=Color3.fromRGB(180,180,180)cd.
AnchorPoint=Vector2.new(0,0.5)cd.BackgroundColor3=Color3.fromRGB(255,255,255)cd.
BackgroundTransparency=1 cd.BorderColor3=Color3.fromRGB(0,0,0)cd.BorderSizePixel
=0 cd.Position=UDim2.fromScale(0,0.5)cd.Size=UDim2.fromOffset(12,12)cd.Parent=cb
local ce=Instance.new'UIPadding'ce.Name='UIPadding'ce.PaddingLeft=UDim.new(0,15)
ce.Parent=cb local cf=Instance.new'TextBox'cf.Name='SearchBox'cf.CursorPosition=
-1 cf.FontFace=Font.new(an.interFont,Enum.FontWeight.Medium,Enum.FontStyle.
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
~=ck then d(cq.Checkmark,TweenInfo.new(cj.duration,cj.easingStyle),{Size=UDim2.
new(cq.Checkmark.Size.X.Scale,cj.checkSizeDecrease,cq.Checkmark.Size.Y.Scale,cq.
Checkmark.Size.Y.Offset)}):Play()d(cq.NameLabel,TweenInfo.new(cj.duration,cj.
easingStyle),{TextTransparency=cj.transparencyOut}):Play()cq.Checkmark.
TextTransparency=1 end end b_={ck}bZ.Value=b_[1]end d(cn,TweenInfo.new(cj.
duration,cj.easingStyle),{Size=UDim2.new(cn.Size.X.Scale,cj.checkSizeIncrease,cn
.Size.Y.Scale,cn.Size.Y.Offset)}):Play()d(co,TweenInfo.new(cj.duration,cj.
easingStyle),{TextTransparency=cj.transparencyIn}):Play()cn.TextTransparency=0
else if bZ.Settings.Multi then local cp=table.find(b_,ck)if cp then table.
remove(b_,cp)end else b_={}end d(cn,TweenInfo.new(cj.duration,cj.easingStyle),{
Size=UDim2.new(cn.Size.X.Scale,cj.checkSizeDecrease,cn.Size.Y.Scale,cn.Size.Y.
Offset)}):Play()d(co,TweenInfo.new(cj.duration,cj.easingStyle),{TextTransparency
=cj.transparencyOut}):Play()cn.TextTransparency=1 end if bX.Required and#b_==0
and not cl then return end if#b_>0 then b4.Text=bZ.Settings.Name..' \u{2022} '..
table.concat(b_,', ')else b4.Text=bZ.Settings.Name..'...'end end,false,false
local cn=function()if cm then return end cm=true local cn,co=38,not cl local cp=
co and UDim2.new(1,0,0,cg())or UDim2.new(1,0,0,cn)local cq,cr=d(b1,TweenInfo.
new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=cp}),d(b7,
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
'TextLabel'cs.Name='OptionName'cs.FontFace=Font.new(an.interFont)cs.Text=cp cs.
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
'Checkmark'cu.FontFace=Font.new(an.interFont)cu.Text='\u{2713}'cu.TextColor3=
Color3.fromRGB(255,255,255)cu.TextSize=13 cu.TextTransparency=1 cu.
TextXAlignment=Enum.TextXAlignment.Left cu.TextYAlignment=Enum.TextYAlignment.
Top cu.AnchorPoint=Vector2.new(0,0.5)cu.AutomaticSize=Enum.AutomaticSize.Y cu.
BackgroundColor3=Color3.fromRGB(255,255,255)cu.BackgroundTransparency=1 cu.
BorderColor3=Color3.fromRGB(0,0,0)cu.BorderSizePixel=0 cu.LayoutOrder=-1 cu.
Position=UDim2.fromScale(1.3e-7,0.5)cu.Size=UDim2.fromOffset(-10,0)cu.Parent=cq
cq.Parent=b8 b8.Parent=b1 b0[cp]={Index=co,Button=cq,NameLabel=cs,Checkmark=cu}
local cv={duration=0.2,easingStyle=Enum.EasingStyle.Quint,transparencyIn=0.2,
transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-ct.Padding.Offset,
waitTime=1}local cw,cx={checkIn=d(cu,TweenInfo.new(cv.duration,cv.easingStyle),{
Size=UDim2.new(cu.Size.X.Scale,cv.checkSizeIncrease,cu.Size.Y.Scale,cu.Size.Y.
Offset)}),checkOut=d(cu,TweenInfo.new(cv.duration,cv.easingStyle),{Size=UDim2.
new(cu.Size.X.Scale,cv.checkSizeDecrease,cu.Size.Y.Scale,cu.Size.Y.Offset)}),
nameIn=d(cs,TweenInfo.new(cv.duration,cv.easingStyle),{TextTransparency=cv.
transparencyIn}),nameOut=d(cs,TweenInfo.new(cv.duration,cv.easingStyle),{
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
=Font.new(an.interFont)b1.Text=bX.Name b1.TextColor3=Color3.fromRGB(255,255,255)
b1.TextSize=13 b1.TextTransparency=0.5 b1.RichText=true b1.TextTruncate=Enum.
TextTruncate.AtEnd b1.TextXAlignment=Enum.TextXAlignment.Left b1.TextYAlignment=
Enum.TextYAlignment.Top b1.AnchorPoint=Vector2.new(0,0.5)b1.AutomaticSize=Enum.
AutomaticSize.XY b1.BackgroundColor3=Color3.fromRGB(255,255,255)b1.
BackgroundTransparency=1 b1.BorderColor3=Color3.fromRGB(0,0,0)b1.BorderSizePixel
=0 b1.Position=UDim2.fromScale(0,0.5)b1.Parent=b0 local b2=Instance.new
'ImageLabel'b2.Name='NewColor'b2.Image=an.grid b2.ScaleType=Enum.ScaleType.Tile
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
cp.Image=an.colorWheel cp.AutoButtonColor=false cp.Active=false cp.
BackgroundColor3=Color3.fromRGB(248,248,248)cp.BackgroundTransparency=1 cp.
BorderColor3=Color3.fromRGB(27,42,53)cp.Selectable=false cp.Size=UDim2.
fromOffset(220,220)cp.SizeConstraint=Enum.SizeConstraint.RelativeYY local cr=
Instance.new'ImageLabel'cr.Name='Target'cr.Image=an.colorTarget cr.ImageColor3=
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
Instance.new'TextLabel'cv.Name='InputName'cv.FontFace=Font.new(an.interFont)cv.
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
FontFace=Font.new(an.interFont)cx.Text='255'cx.TextColor3=Color3.fromRGB(255,255
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
Instance.new'TextLabel'cD.Name='InputName'cD.FontFace=Font.new(an.interFont)cD.
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
new'TextBox'cF.Name='InputBox'cF.ClearTextOnFocus=false cF.FontFace=Font.new(an.
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
Instance.new'TextLabel'cL.Name='InputName'cL.FontFace=Font.new(an.interFont)cL.
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
new'TextBox'cN.Name='InputBox'cN.ClearTextOnFocus=false cN.FontFace=Font.new(an.
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
local cT=Instance.new'TextLabel'cT.Name='InputName'cT.FontFace=Font.new(an.
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
new'TextBox'cV.Name='InputBox'cV.ClearTextOnFocus=false cV.FontFace=Font.new(an.
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
'InputName'c0.FontFace=Font.new(an.interFont)c0.Text='Hex'c0.TextColor3=Color3.
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
CursorPosition=-1 c2.FontFace=Font.new(an.interFont)c2.Text='255'c2.TextColor3=
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
=c8 local da=Instance.new'ImageLabel'da.Name='NewColor'da.Image=an.grid da.
ScaleType=Enum.ScaleType.Tile da.TileSize=UDim2.fromOffset(500,500)da.
BackgroundColor3=Color3.fromRGB(255,255,255)da.BackgroundTransparency=1 da.
BorderColor3=Color3.fromRGB(0,0,0)da.BorderSizePixel=0 da.Size=UDim2.fromOffset(
100,100)local db=Instance.new'UICorner'db.Name='UICorner'db.Parent=da local dc=
Instance.new'Frame'dc.Name='Color'dc.AnchorPoint=Vector2.new(0.5,0.5)dc.
BorderColor3=Color3.fromRGB(27,42,53)dc.BorderSizePixel=0 dc.Position=UDim2.
fromScale(0.5,0.5)dc.Size=UDim2.new(1,1,1,1)local dd=Instance.new'UICorner'dd.
Name='UICorner'dd.Parent=dc dc.Parent=da da.Parent=c8 local de=Instance.new
'ImageLabel'de.Name='OldColor'de.Image=an.grid de.ScaleType=Enum.ScaleType.Tile
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
.Parent=dt dt.Parent=b9 b9.Parent=b7 b7.Parent=k local dy,dz,dA,dB,dC,dD,dE,dF,
dG,dH,dI,dJ,dK,dL,dM,dN,dO,dP,dQ=Color3.fromHSV,Color3.fromRGB,Vector2.new,UDim2
.new,cp,cr,cf,dc,{Hex=c_.InputBox,Red=cu.InputBox,Green=cC.InputBox,Blue=cK.
InputBox,Alpha=cS.InputBox},aj:GetMouse(),false,false,0,0,1,function(dy)return
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
d0.Parent=k d0.Visible=false return d0 end local d1=function(d1)local d2,d3,d4,
d5,d6=d0(),d1 and 0 or 1,d1 and 1 or 0.95,d1 and 1 or 0,TweenInfo.new(0.1,Enum.
EasingStyle.Sine)local d7,d8=d(d2,d6,{GroupTransparency=d3}),d(ca,d6,{Scale=d4})
b7.Visible=true b7.Parent=d2 d2.Visible=true d2.GroupTransparency=d5 d7:Play()d8
:Play()d7.Completed:Wait()if not d1 then b7.Visible=false d2.Visible=false end
b7.Parent=k d2:Destroy()end local d2,d3=function()d1(true)end,function()d1(false
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
'TextLabel'b1.Name='HeaderText'b1.FontFace=Font.new(an.interFont,Enum.FontWeight
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
Name='LabelText'b0.FontFace=Font.new(an.interFont)b0.RichText=true b0.Text=bZ.
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
Name='SubLabelText'b0.FontFace=Font.new(an.interFont)b0.RichText=true b0.Text=bZ
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
Name='ParagraphHeader'b0.FontFace=Font.new(an.interFont,Enum.FontWeight.Medium,
Enum.FontStyle.Normal)b0.RichText=true b0.Text=bZ.Settings.Header b0.TextColor3=
Color3.fromRGB(255,255,255)b0.TextSize=15 b0.TextTransparency=0.4 b0.TextWrapped
=true b0.TextXAlignment=Enum.TextXAlignment.Left b0.AutomaticSize=Enum.
AutomaticSize.Y b0.BackgroundColor3=Color3.fromRGB(255,255,255)b0.
BackgroundTransparency=1 b0.BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel
=0 b0.Size=UDim2.fromScale(1,0)b0.Parent=b_ local b1=Instance.new'UIListLayout'
b1.Name='UIListLayout'b1.Padding=UDim.new(0,5)b1.SortOrder=Enum.SortOrder.
LayoutOrder b1.Parent=b_ local b2=Instance.new'TextLabel'b2.Name='ParagraphBody'
b2.FontFace=Font.new(an.interFont)b2.RichText=true b2.Text=bZ.Settings.Body b2.
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
local bQ=function()local bQ=0.15 if b then b.Parent=nil end for bR,bS in pairs(
ak)do d(bR,TweenInfo.new(bQ,Enum.EasingStyle.Sine),{BackgroundTransparency=(bR==
bA and 0.98 or 1)}):Play()if bS.tabStroke then d(bS.tabStroke,TweenInfo.new(bQ,
Enum.EasingStyle.Sine),{Transparency=(bR==bA and 0.95 or 1)}):Play()end if bS.
switcherImage then d(bS.switcherImage,TweenInfo.new(bQ,Enum.EasingStyle.Sine),{
ImageTransparency=(bR==bA and 0.1 or 0.5)}):Play()end if bS.switcherName then d(
bS.switcherName,TweenInfo.new(bQ,Enum.EasingStyle.Sine),{TextTransparency=(bR==
bA and 0.1 or 0.5)}):Play()end end ak[bA].tabContent.Parent=aI b=ak[bA].
tabContent a5.Text=by.Name end bA.MouseButton1Click:Connect(function()bQ()end)
function bz:Select()bQ()end function bz:InsertConfigSection(bR)local bS=bz:
Section{Side='Left'}if ai then bS:Label{Text=
'Config system unavailable. (Environment isStudio)'}return
'Config system unavailable.'end local bT,bU bS:Input{Name='Config Name',
Placeholder='Name',AcceptedCharacters='All',Callback=function(bV)bT=bV end}local
bV=bS:Dropdown{Name='Select Config',Multi=false,Required=false,Options=aa:
RefreshConfigList(),Callback=function(bV)bU=bV end}bS:Button{Name=
'Create Config',Callback=function()if not bT or string.gsub(bT,' ','')==''then f
:Notify{Title='Interface',Description='Config name cannot be empty.'}return end
local bW,bX=aa:SaveConfig(bT)if not bW then f:Notify{Title='Interface',
Description='Unable to save config, return error: '..bX}end f:Notify{Title=
'Interface',Description=string.format('Created config %q',bT)}bV:ClearOptions()
bV:InsertOptions(aa:RefreshConfigList())end}bS:Button{Name='Load Config',
Callback=function()local bW,bX=aa:LoadConfig(bV.Value)if not bW then f:Notify{
Title='Interface',Description='Unable to load config, return error: '..bX}return
end f:Notify{Title='Interface',Description=string.format('Loaded config %q',bV.
Value)}end}bS:Button{Name='Overwrite Config',Callback=function()local bW,bX=aa:
SaveConfig(bV.Value)if not bW then f:Notify{Title='Interface',Description=
'Unable to overwrite config, return error: '..bX}return end f:Notify{Title=
'Interface',Description=string.format('Overwrote config %q',bV.Value)}end}bS:
Button{Name='Refresh Config List',Callback=function()bV:ClearOptions()bV:
InsertOptions(aa:RefreshConfigList())end}local bW bS:Button{Name=
'Set as autoload',Callback=function()local bX=bV.Value writefile(aa.Folder..
'/settings/autoload.txt',bX)bW:UpdateName('Autoload config: '..bX)f:Notify{Title
='Interface',Description=string.format('Set %q as autoload',bX)}end}bW=bS:Label{
Text='Autoload config: None'}if isfile(aa.Folder..'/settings/autoload.txt')then
local bX=readfile(aa.Folder..'/settings/autoload.txt')bW:UpdateName(
'Autoload config: '..bX)end end ak[bA]={tabContent=bH,tabStroke=bC,switcherImage
=bE,switcherName=bF}return bz end return bs end local bs=function()if
setthreadidentity then pcall(setthreadidentity,7)elseif set_thread_identity then
pcall(set_thread_identity,7)elseif setidentity then pcall(setidentity,7)elseif
syn and syn.set_thread_identity then pcall(syn.set_thread_identity,7)end end
function f:Notify(bt)bs()local bu={}local bv,bw=pcall(function()local bv=
Instance.new'Frame'bv.Name='Notification'bv.AnchorPoint=Vector2.new(0.5,0.5)bv.
AutomaticSize=Enum.AutomaticSize.Y bv.BackgroundColor3=Color3.fromRGB(15,15,15)
bv.BorderColor3=Color3.fromRGB(0,0,0)bv.BorderSizePixel=0 bv.Position=UDim2.
fromScale(0.5,0.5)bv.Size=UDim2.fromOffset(bt.SizeX or 250,0)bv.Parent=h local
bw=Instance.new'UIStroke'bw.Name='NotificationUIStroke'bw.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border bw.Color=Color3.fromRGB(255,255,255)bw.Transparency=0.9
bw.Parent=bv local bx=Instance.new'UICorner'bx.Name='NotificationUICorner'bx.
CornerRadius=UDim.new(0,10)bx.Parent=bv local by=Instance.new'UIScale'by.Name=
'NotificationUIScale'by.Parent=bv by.Scale=0 local bz=Instance.new'Frame'bz.Name
='NotificationInformation'bz.AutomaticSize=Enum.AutomaticSize.Y bz.
BackgroundColor3=Color3.fromRGB(255,255,255)bz.BackgroundTransparency=1 bz.
BorderColor3=Color3.fromRGB(0,0,0)bz.BorderSizePixel=0 bz.Size=UDim2.fromScale(1
,1)local bA=Instance.new'TextLabel'bA.Name='NotificationTitle'bA.FontFace=Font.
new(an.interFont,Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)bA.RichText=true
bA.Text=bt.Title bA.TextColor3=Color3.fromRGB(255,255,255)bA.TextSize=13 bA.
TextTransparency=0.2 bA.TextTruncate=Enum.TextTruncate.SplitWord bA.
TextXAlignment=Enum.TextXAlignment.Left bA.TextYAlignment=Enum.TextYAlignment.
Top bA.AutomaticSize=Enum.AutomaticSize.XY bA.BackgroundColor3=Color3.fromRGB(
255,255,255)bA.BackgroundTransparency=1 bA.BorderColor3=Color3.fromRGB(0,0,0)bA.
BorderSizePixel=0 bA.Size=UDim2.new(1,-12,0,0)local bB=Instance.new'UIPadding'bB
.Name='NotificationTitleUIPadding'bB.PaddingRight=UDim.new(0,25)bB.Parent=bA bA.
Parent=bz local bC=Instance.new'TextLabel'bC.Name='NotificationDescription'bC.
FontFace=Font.new(an.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)bC.
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
bG.Name='Interactable'bG.FontFace=Font.new(an.interFont)bG.Text='\u{2713}'bG.
TextColor3=Color3.fromRGB(255,255,255)bG.TextSize=17 bG.TextTransparency=0.2 bG.
AnchorPoint=Vector2.new(1,0.5)bG.AutomaticSize=Enum.AutomaticSize.XY bG.
BackgroundColor3=Color3.fromRGB(255,255,255)bG.BackgroundTransparency=1 bG.
BorderColor3=Color3.fromRGB(0,0,0)bG.BorderSizePixel=0 bG.LayoutOrder=1 bG.
Position=UDim2.fromScale(1,0.5)bG.Parent=bF local bH=Instance.new'UIPadding'bH.
Name='UIPadding'bH.PaddingBottom=UDim.new(0,6)bH.PaddingRight=UDim.new(0,13)bH.
PaddingTop=UDim.new(0,6)bH.Parent=bF bF.Parent=bv local bI,bJ={In=d(by,TweenInfo
.new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Scale=bt.Scale
or 1}),Out=d(by,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
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
return bu end function f:Dialog(bt)local bu,bv={},Instance.new'CanvasGroup'bv.
Name='DialogCanvas'bv.BackgroundColor3=Color3.fromRGB(255,255,255)bv.
BackgroundTransparency=1 bv.BorderColor3=Color3.fromRGB(0,0,0)bv.BorderSizePixel
=0 bv.Size=UDim2.fromScale(1,1)bv.GroupTransparency=1 bv.Parent=k local bw=
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
'TextLabel'bE.Name='ParagraphHeader'bE.FontFace=Font.new(an.interFont,Enum.
FontWeight.Medium,Enum.FontStyle.Normal)bE.RichText=true bE.Text=bt.Title bE.
TextColor3=Color3.fromRGB(255,255,255)bE.TextSize=18 bE.TextTransparency=0.4 bE.
TextWrapped=true bE.AutomaticSize=Enum.AutomaticSize.Y bE.BackgroundColor3=
Color3.fromRGB(255,255,255)bE.BackgroundTransparency=1 bE.BorderColor3=Color3.
fromRGB(0,0,0)bE.BorderSizePixel=0 bE.Size=UDim2.fromScale(1,0)bE.Parent=bD
local bF=Instance.new'UIListLayout'bF.Name='UIListLayout'bF.Padding=UDim.new(0,
15)bF.SortOrder=Enum.SortOrder.LayoutOrder bF.Parent=bD local bG=Instance.new
'TextLabel'bG.Name='ParagraphBody'bG.FontFace=Font.new(an.interFont)bG.RichText=
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
local bL,bM,bN,bO=d(bv,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{
GroupTransparency=0}),d(bv,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{
GroupTransparency=1}),d(bz,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Scale=1}),
d(bz,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Scale=0.95})local bP,bQ=function(
)bL:Play()bN:Play()bL.Completed:Wait()bw.Parent=k end,function()if not bw.Parent
then return end bw.Parent=bv bM:Play()bO:Play()bM.Completed:Wait()bv:Destroy()
end for bR,bS in pairs(bt.Buttons)do local bT=Instance.new'TextButton'bT.Name=
'Button'bT.FontFace=Font.new(an.interFont)bT.Text=bS.Name bT.TextColor3=Color3.
fromRGB(255,255,255)bT.TextSize=15 bT.TextTransparency=0.5 bT.TextTruncate=Enum.
TextTruncate.AtEnd bT.AutoButtonColor=false bT.AutomaticSize=Enum.AutomaticSize.
Y bT.BackgroundColor3=Color3.fromRGB(25,25,25)bT.BorderColor3=Color3.fromRGB(0,0
,0)bT.BorderSizePixel=0 bT.Size=UDim2.fromScale(1,0)local bU=Instance.new
'UIPadding'bU.Name='UIPadding'bU.PaddingBottom=UDim.new(0,9)bU.PaddingLeft=UDim.
new(0,10)bU.PaddingRight=UDim.new(0,10)bU.PaddingTop=UDim.new(0,9)bU.Parent=bT
local bV=Instance.new'UICorner'bV.Name='BaseUICorner'bV.CornerRadius=UDim.new(0,
10)bV.Parent=bT bT.Parent=bH local bW={DefaultTransparency=0,
DefaultTransparency2=0.5,HoverTransparency=0.3,HoverTransparency2=0.6,
EasingStyle=Enum.EasingStyle.Sine}local bX=function(bX)if bX=='Idle'then d(bT,
TweenInfo.new(0.2,bW.EasingStyle),{BackgroundTransparency=bW.DefaultTransparency
,TextTransparency=bW.DefaultTransparency2}):Play()elseif bX=='Hover'then d(bT,
TweenInfo.new(0.2,bW.EasingStyle),{BackgroundTransparency=bW.HoverTransparency,
TextTransparency=bW.HoverTransparency2}):Play()end end bT.MouseButton1Click:
Connect(function()if bv.GroupTransparency~=0 then return end local bY,bZ=pcall(
function()if bS.Callback then bS.Callback()end end)bQ()if not bY then warn(
'[Dialog] Button callback error: '..tostring(bZ))end end)bT.MouseEnter:Connect(
function()bX'Hover'end)bT.MouseLeave:Connect(function()bX'Idle'end)end bP()
function bu:UpdateTitle(bR)bE.Text=bR end function bu:UpdateDescription(bR)bG.
Text=bR end function bu:Cancel()bQ()end return bu end function f:
SetNotificationsState(bt)h.Visible=bt end function f:GetNotificationsState(bt)
return h.Visible end function f:SetState(bt)ap=bt k.Visible=bt end function f:
GetState()return ap end local bt function f:Unload()if bt then bt()end g:
Destroy()am=true end function f.onUnloaded(bu)bt=bu end local bu=e.Keybind or
Enum.KeyCode.RightControl local bv=function()local bv=not f:GetState()f:
SetState(bv)f:Notify{Title=e.Title,Description=(bv and'Maximized 'or'Minimized '
)..'the menu. Use '..tostring(bu.Name)..' to toggle it.',Lifetime=5}end af.
InputEnded:Connect(function(bw,bx)if bx then return end if bw.KeyCode==bu then
bv()end end)C.MouseButton1Click:Connect(bv)z.MouseButton1Click:Connect(function(
)f:Dialog{Title=e.Title,Description=
[[Are you sure you want to exit the menu? You will lose any unsaved configurations.]]
,Buttons={{Name='Confirm',Callback=function()f:Unload()end},{Name='Cancel'}}}end
)function f:SetKeybind(bw)bu=bw end function f:SetAcrylicBlurState(bw)aq=bw k.
BackgroundTransparency=bw and 0.05 or 0 end function f:GetAcrylicBlurState()
return aq end local bw,bx=function(bw)if bw then au.Image=(at and as)or
'rbxassetid://0'aB.Text='@'..aj.Name ay.Text=aj.DisplayName else au.Image=an.
userInfoBlurred local bx,by=#aj.Name,#aj.DisplayName aB.Text='@'..string.rep('.'
,bx)ay.Text=string.rep('.',by)end end if e.ShowUserInfo~=nil then bx=e.
ShowUserInfo else bx=true end bw(bx)function f:SetUserInfoState(by)bw(by)end
function f:GetUserInfoState(by)return bx end function f:SetSize(by)k.Size=by end
function f:GetSize(by)return k.Size end function f:SetScale(by)n.Scale=by end
function f:GetScale()return n.Scale end local by,bz={Toggle={Save=function(by,bz
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
end}},function()if ai or not(isfolder and makefolder)then return
'Config system unavailable.'end local by={aa.Folder,aa.Folder..'/settings'}for
bz=1,#by do local bA=by[bz]if not isfolder(bA)then makefolder(bA)end end end
function aa:LoadAutoLoadConfig()bs()if ai or not(isfile and readfile)then return
'Config system unavailable.'end local bA,bB=(aa.Folder..'/settings/autoload.txt'
)if isfile(bA)then local bC,bD=pcall(readfile,bA)if bC and type(bD)=='string'
then bD=string.gsub(bD,'[\r\n%s]+','')if#bD>0 then bB=bD end end end if not bB
then local bC=aa.Folder..'/settings/Default.json'if isfile(bC)then bB='Default'
if writefile then pcall(writefile,bA,'Default')end end end if not bB then print(
'[MacLib] Kh\u{f4}ng t\u{ec}m th\u{1ea5}y autoload config n\u{e0}o trong '..bA)
return end print(string.format(
'[MacLib] Kh\u{1edf}i \u{111}\u{1ed9}ng n\u{1ea1}p autoload config: %q',bB))
local bC,bD=aa:LoadConfig(bB)if not bC then pcall(function()f:Notify{Title=
'Interface',Description='Error loading autoload config: '..tostring(bD)}end)
warn(string.format('[MacLib] L\u{1ed7}i khi n\u{1ea1}p autoload config %q: %s',
bB,tostring(bD)))return end print(string.format(
'[MacLib] N\u{1ea1}p autoload config th\u{e0}nh c\u{f4}ng: %q',bB))pcall(
function()f:Notify{Title='Interface',Description=string.format(
'Autoloaded config: %q',bB)}end)end function aa:SetFolder(bA)if ai then return
'Config system unavailable.'end aa.Folder=bA bz()end function aa:SaveConfig(bA)
if ai or not writefile then return'Config system unavailable.'end if(not bA)then
return false,'Please select a config file.'end local bB,bC=aa.Folder..
'/settings/'..bA..'.json',{objects={},contextData=aa.contextData or{}}for bD,bE
in next,aa.Options do if not by[bE.Class]then continue end if bE.IgnoreConfig
then continue end table.insert(bC.objects,by[bE.Class].Save(bD,bE))end local bD,
bE=pcall(ad.JSONEncode,ad,bC)if not bD then return false,
'Unable to encode into JSON data'end writefile(bB,bE)return true end function aa
:LoadConfig(bA)bs()if ai or not(isfile and readfile)then return
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
function aa:RefreshConfigList()if ai or not(isfolder and listfiles)then return
'Config system unavailable.'end local bA,bB=(isfolder(aa.Folder)and isfolder(aa.
Folder..'/settings'))and listfiles(aa.Folder..'/settings')or{},{}for bC=1,#bA do
local bD=bA[bC]if bD:sub(-5)=='.json'then local bE=bD:find('.json',1,true)local
bF,bG=bE,bD:sub(bE,bE)while bG~='/'and bG~='\\'and bG~=''do bE=bE-1 bG=bD:sub(bE
,bE)end if bG=='/'or bG=='\\'then local bH=bD:sub(bE+1,bF-1)if bH~='options'then
table.insert(bB,bH)end end end end return bB end g.Enabled=false local bA={}for
bB,bC in pairs(an)do table.insert(bA,bC)end ae:PreloadAsync(bA)g.Enabled=true ap
=true return f end function aa:Demo()local as=aa:Window{Title='Maclib Demo',
Subtitle='This is a subtitle.',Size=UDim2.fromOffset(868,650),DragStyle=1,
DisabledWindowControls={},ShowUserInfo=true,Keybind=Enum.KeyCode.RightControl,
AcrylicBlur=true}local at,au={UIBlurToggle=as:GlobalSetting{Name='UI Blur',
Default=as:GetAcrylicBlurState(),Callback=function(at)as:SetAcrylicBlurState(at)
as:Notify{Title=as.Settings.Title,Description=(at and'Enabled'or'Disabled')..
' UI Blur',Lifetime=5}end},NotificationToggler=as:GlobalSetting{Name=
'Notifications',Default=as:GetNotificationsState(),Callback=function(at)as:
SetNotificationsState(at)as:Notify{Title=as.Settings.Title,Description=(at and
'Enabled'or'Disabled')..' Notifications',Lifetime=5}end},ShowUserInfo=as:
GlobalSetting{Name='Show User Info',Default=as:GetUserInfoState(),Callback=
function(at)as:SetUserInfoState(at)as:Notify{Title=as.Settings.Title,Description
=(at and'Showing'or'Redacted')..' User Info',Lifetime=5}end}},{TabGroup1=as:
TabGroup()}local av={Main=au.TabGroup1:Tab{Name='Demo',Image=
'rbxassetid://18821914323'},Settings=au.TabGroup1:Tab{Name='Settings',Image=
'rbxassetid://10734950309'}}local aw={MainSection1=av.Main:Section{Side='Left'}}
aw.MainSection1:Header{Name='Header #1'}aw.MainSection1:Button{Name='Button',
Callback=function()as:Dialog{Title=as.Settings.Title,Description=
[[Lorem ipsum odor amet, consectetuer adipiscing elit. Eros vestibulum aliquet mattis, ex platea nunc.]]
,Buttons={{Name='Confirm',Callback=function()print'Confirmed!'end},{Name=
'Cancel'}}}end}aw.MainSection1:Input({Name='Input',Placeholder='Input',
AcceptedCharacters='All',Callback=function(ax)as:Notify{Title=as.Settings.Title,
Description='Successfully set input to '..ax}end,onChanged=function(ax)print(
'Input is now '..ax)end},'Input')aw.MainSection1:Slider({Name='Slider',Default=
50,Minimum=0,Maximum=100,DisplayMethod='Percent',Precision=0,Callback=function(
ax)print('Changed to '..ax)end},'Slider')aw.MainSection1:Toggle({Name='Toggle',
Default=false,Callback=function(ax)as:Notify{Title=as.Settings.Title,Description
=(ax and'Enabled 'or'Disabled ')..'Toggle'}end},'Toggle')aw.MainSection1:
Keybind({Name='Keybind',Blacklist=false,Callback=function(ax)as:Notify{Title=
'Demo Window',Description='Pressed keybind - '..tostring(ax.Name),Lifetime=3}end
,onBinded=function(ax)as:Notify{Title='Demo Window',Description=
'Successfully Binded Keybind to - '..tostring(ax.Name),Lifetime=3}end},'Keybind'
)aw.MainSection1:Colorpicker({Name='Colorpicker',Default=Color3.fromRGB(0,255,
255),Callback=function(ax)print('Color: ',ax)end},'Colorpicker')local ax,ay,az,
aA=aw.MainSection1:Colorpicker({Name='Transparency Colorpicker',Default=Color3.
fromRGB(255,0,0),Alpha=0,Callback=function(ax,ay)print('Color: ',ax,' Alpha: ',
ay)end},'TransparencyColorpicker'),0 aw.MainSection1:Toggle({Name='Rainbow',
Default=false,Callback=function(aB)az=aB if az then aA=game:GetService
'RunService'.RenderStepped:Connect(function(aC)ay=(ay+aC*0.1)%1 ax:SetColor(
Color3.fromHSV(ay,1,1))end)elseif aA then aA:Disconnect()aA=nil end end},
'RainbowToggle')local aB={'Apple','Banana','Orange','Grapes','Pineapple','Mango'
,'Strawberry','Blueberry','Watermelon','Peach'}local aC,aD=aw.MainSection1:
Dropdown({Name='Dropdown',Multi=false,Required=true,Options=aB,Default=1,
Callback=function(aC)print('Dropdown changed: '..aC)end},'Dropdown'),aw.
MainSection1:Dropdown({Name='Multi Dropdown',Search=true,Multi=true,Required=
false,Options=aB,Default={'Apple','Orange'},Callback=function(aC)local aD={}for
aE,aF in next,aC do table.insert(aD,aE)end print('Mutlidropdown changed:',table.
concat(aD,', '))end},'MultiDropdown')aw.MainSection1:Button{Name=
'Update Selection',Callback=function()aC:UpdateSelection'Grapes'aD:
UpdateSelection{'Banana','Pineapple'}end}aw.MainSection1:Divider()aw.
MainSection1:Header{Text='Header #2'}aw.MainSection1:Paragraph{Header=
'Paragraph',Body=
[[Paragraph body. Lorem ipsum odor amet, consectetuer adipiscing elit. Morbi tempus netus aliquet per velit est gravida.]]
}aw.MainSection1:Label{Text=
'Label. Lorem ipsum odor amet, consectetuer adipiscing elit.'}aw.MainSection1:
SubLabel{Text=
[[Sub-Label. Lorem ipsum odor amet, consectetuer adipiscing elit.]]}aa:SetFolder
'Maclib'av.Settings:InsertConfigSection'Left'as.onUnloaded(function()print
'Unloaded!'end)av.Main:Select()aa:LoadAutoLoadConfig()end return aa end function
a.o()local aa,ab,ac,ad,ae,af,ag=a.load'n',a.load'e',{},false,false,false
function ac.Suspend()ae=true ad=false end function ac.Resume()ae=false end
function ac.SetRecording(ah)af=ah and true or false end function ac.IsRecording(
)return af end function ac.IsSuspended()if ae or(aa.LoadingConfig==true)or af
then return true end local ah,ai=pcall(require,
'@routes/DungeonQuest/core/coordinator')if ah and ai and ai.IsLocked and ai.
IsLocked()then return true end return false end function ac.SetActive(ah)ag=(
typeof(ah)=='string'and#ah>0)and string.gsub(ah,'[\r\n%s]+','')or nil if ag and
writefile then pcall(function()local ai=aa.Folder if isfolder and not isfolder(
ai)then makefolder(ai)end if isfolder and not isfolder(ai..'/settings')then
makefolder(ai..'/settings')end writefile(ai..'/settings/autoload.txt',ag)end)end
end function ac.GetActive()return ag end local ah=function()if ag then return ag
end local ah=aa.Folder local ai=ah..'/settings/autoload.txt'if isfile and
isfile(ai)then local aj,ak=pcall(readfile,ai)if aj and typeof(ak)=='string'then
ak=string.gsub(ak,'[\r\n%s]+','')if#ak>0 then ag=ak return ag end end end ag=
'Default'pcall(function()if writefile and makefolder and isfolder then if not
isfolder(ah)then makefolder(ah)end if not isfolder(ah..'/settings')then
makefolder(ah..'/settings')end if not isfile(ai)then writefile(ai,'Default')end
end end)return ag end function ac.SaveNow()if ac.IsSuspended()then return end
local ai=ah()if not ai then return end local aj,ak=aa:SaveConfig(ai)if not aj
and ak and ak~='Please select a config file.'then ab.Notify('AutoSave',
'Failed to save config: '..tostring(ak),3)end end function ac.Save()if ac.
IsSuspended()then return end if not ah()then return end if ad then return end ad
=true task.delay(0.5,function()ad=false if not ac.IsSuspended()and ac.GetActive(
)then ac.SaveNow()end end)end function ac.Wrap(ai)if type(ai)~='function'then
return ai end return function(...)ai(...)ac.Save()end end return ac end function
a.p()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'n',a.load'o',a.load'c',{},{Mob={Min
=15,Max=35,BossArea=false,BossAreaRadius=80,DisableDodge=false,
EnableHazardScanner=true},Boss1={Min=25,Max=50,BossArea=false,BossAreaRadius=80,
DisableDodge=false,EnableHazardScanner=true},Boss2={Min=25,Max=50,BossArea=false
,BossAreaRadius=80,DisableDodge=false,EnableHazardScanner=true},Boss3={Min=25,
Max=50,BossArea=false,BossAreaRadius=80,DisableDodge=false,EnableHazardScanner=
true}},{Normal='Mob',['Boss 1']='Boss1',['Boss 2']='Boss2',['Boss 3']='Boss3'},{
Mob='Normal',Boss1='Boss 1',Boss2='Boss 2',Boss3='Boss 3'},{},{}function ad.
GetTargetDisplay(aj)return ag[aj]or'Normal'end function ad.GetTargetKey(aj)
return af[aj]or'Mob'end function ad.GetTargetOptions()return{'Normal','Boss 1',
'Boss 2','Boss 3'}end function ad.GetSaveData()return ah end function ad.
LoadData(aj)if type(aj)=='table'then ah=aj else ah={}end aa.contextData=ah for
ak,al in ipairs(ai)do pcall(al)end end function ad.OnDataChanged(aj)if type(aj)
~='function'then return function()end end table.insert(ai,aj)return function()
for ak,al in ipairs(ai)do if al==aj then table.remove(ai,ak)break end end end
end local aj=function()aa.contextData=ah ab.Save()end function ad.
GetCombatDistances(ak,al)local am=al or'Mob'local an=ae[am]or ae.Mob if type(ak)
=='string'and#ak>0 and ah[ak]and ah[ak][am]then local ao=ah[ak][am]local ap,aq=(
type(ao.Min)=='number'and ao.Min>0)and ao.Min or an.Min,(type(ao.Max)=='number'
and ao.Max>0)and ao.Max or an.Max return ap,aq end return an.Min,an.Max end
function ad.GetActiveCombatDistances(ak)local al,am,an=ac.GetCurrentDungeonName(
),'Mob',false if ac.IsBossActive and ac.IsBossActive()then an=true am=ac.
GetCombatTargetKey()elseif ak then if ak.Room and type(ak.Room.Name)=='string'
and string.find(string.lower(ak.Room.Name),'boss')then an=true elseif ak.Model
then local ao=string.lower(ak.Model.Name)if string.find(ao,'boss')then an=true
else local ap=ak.Model.Parent if ap and string.find(string.lower(ap.Name),'boss'
)then an=true end end end if an then local ao=ac.GetCurrentBossIndex and ac.
GetCurrentBossIndex()or 1 am='Boss'..tostring(math.clamp(ao,1,3))end end return
ad.GetCombatDistances(al,am)end function ad.GetBossArea(ak,al)local am=al or
'Mob'if am=='Mob'then return false,80 end local an=ae[am]or ae.Boss1 if type(ak)
=='string'and#ak>0 and ah[ak]and ah[ak][am]then local ao=ah[ak][am]local ap,aq=
ao.BossArea==true,(type(ao.BossAreaRadius)=='number'and ao.BossAreaRadius>0)and
ao.BossAreaRadius or(an.BossAreaRadius or 80)return ap,aq end return an.BossArea
or false,an.BossAreaRadius or 80 end function ad.SetBossAreaEnabled(ak,al,am)if
not(type(ak)=='string'and#ak>0)then return end local an=al or'Mob'if an=='Mob'
then return end ah[ak]=ah[ak]or{}ah[ak][an]=ah[ak][an]or{}ah[ak][an].BossArea=am
and true or false aj()end function ad.SetBossAreaRadius(ak,al,am)if not(type(ak)
=='string'and#ak>0)then return end local an=al or'Mob'if an=='Mob'then return
end if type(am)~='number'or am<=0 then return end ah[ak]=ah[ak]or{}ah[ak][an]=ah
[ak][an]or{}ah[ak][an].BossAreaRadius=am aj()end function ad.GetActiveBossArea(
ak)local al,am,an=ac.GetCurrentDungeonName(),'Mob',false if ac.IsBossActive and
ac.IsBossActive()then an=true am=ac.GetCombatTargetKey()elseif ak then if ak.
Room and type(ak.Room.Name)=='string'and string.find(string.lower(ak.Room.Name),
'boss')then an=true elseif ak.Model then local ao=string.lower(ak.Model.Name)if
string.find(ao,'boss')then an=true else local ap=ak.Model.Parent if ap and
string.find(string.lower(ap.Name),'boss')then an=true end end end if an then
local ao=ac.GetCurrentBossIndex and ac.GetCurrentBossIndex()or 1 am='Boss'..
tostring(math.clamp(ao,1,3))end end if not an or am=='Mob'then return false,0,
nil end local ao,ap=ad.GetBossArea(al,am)if not ao then return false,ap,nil end
local aq=ac.GetBossSpawnPosition and ac.GetBossSpawnPosition()if not aq and ak
and ak.Root then aq=ak.Root.Position if ac.SetBossSpawnPosition then ac.
SetBossSpawnPosition(aq)end end return ao,ap,aq end function ad.GetDisableDodge(
ak,al)local am=al or'Mob'local an=ae[am]or ae.Mob if type(ak)=='string'and#ak>0
and ah[ak]and ah[ak][am]then local ao=ah[ak][am]if ao.DisableDodge~=nil then
return ao.DisableDodge==true end end return an.DisableDodge or false end
function ad.SetDisableDodge(ak,al,am)if not(type(ak)=='string'and#ak>0)then
return end local an=al or'Mob'ah[ak]=ah[ak]or{}ah[ak][an]=ah[ak][an]or{}ah[ak][
an].DisableDodge=am and true or false aj()end function ad.GetEnableHazardScanner
(ak,al)local am=al or'Mob'local an=ae[am]or ae.Mob if type(ak)=='string'and#ak>0
and ah[ak]and ah[ak][am]then local ao=ah[ak][am]if ao.EnableHazardScanner~=nil
then return ao.EnableHazardScanner==true end end return an.EnableHazardScanner~=
false end function ad.SetEnableHazardScanner(ak,al,am)if not(type(ak)=='string'
and#ak>0)then return end local an=al or'Mob'ah[ak]=ah[ak]or{}ah[ak][an]=ah[ak][
an]or{}ah[ak][an].EnableHazardScanner=am and true or false aj()end function ad.
IsActiveDodgeDisabled(ak)local al,am,an=ac.GetCurrentDungeonName(),'Mob',false
if ac.IsBossActive and ac.IsBossActive()then an=true am=ac.GetCombatTargetKey()
elseif ak then if ak.Room and type(ak.Room.Name)=='string'and string.find(string
.lower(ak.Room.Name),'boss')then an=true elseif ak.Model then local ao=string.
lower(ak.Model.Name)if string.find(ao,'boss')then an=true else local ap=ak.Model
.Parent if ap and string.find(string.lower(ap.Name),'boss')then an=true end end
end if an then local ao=ac.GetCurrentBossIndex and ac.GetCurrentBossIndex()or 1
am='Boss'..tostring(math.clamp(ao,1,3))end end return ad.GetDisableDodge(al,am)
end function ad.IsActiveHazardScannerEnabled(ak)local al,am,an=ac.
GetCurrentDungeonName(),'Mob',false if ac.IsBossActive and ac.IsBossActive()then
an=true am=ac.GetCombatTargetKey()elseif ak then if ak.Room and type(ak.Room.
Name)=='string'and string.find(string.lower(ak.Room.Name),'boss')then an=true
elseif ak.Model then local ao=string.lower(ak.Model.Name)if string.find(ao,
'boss')then an=true else local ap=ak.Model.Parent if ap and string.find(string.
lower(ap.Name),'boss')then an=true end end end if an then local ao=ac.
GetCurrentBossIndex and ac.GetCurrentBossIndex()or 1 am='Boss'..tostring(math.
clamp(ao,1,3))end end if ad.GetDisableDodge(al,am)then return false end return
ad.GetEnableHazardScanner(al,am)end function ad.SetMinCombatDistance(ak,al,am)if
not(type(ak)=='string'and#ak>0)then return end local an=al or'Mob'if type(am)~=
'number'or am<=0 then return end ah[ak]=ah[ak]or{}ah[ak][an]=ah[ak][an]or{}local
ao=ah[ak][an].Max or(ae[an]or ae.Mob).Max ah[ak][an].Min=am if am>ao then ah[ak]
[an].Max=am+5 end aj()end function ad.SetMaxCombatDistance(ak,al,am)if not(type(
ak)=='string'and#ak>0)then return end local an=al or'Mob'if type(am)~='number'or
am<=0 then return end ah[ak]=ah[ak]or{}ah[ak][an]=ah[ak][an]or{}local ao=ah[ak][
an].Min or(ae[an]or ae.Mob).Min ah[ak][an].Max=am if am<ao then ah[ak][an].Min=
math.max(1,am-5)end aj()end function ad.ResetTarget(ak,al)if not(type(ak)==
'string'and#ak>0)then return end local am=al or'Mob'if ah[ak]then ah[ak][am]=nil
if next(ah[ak])==nil then ah[ak]=nil end aj()end end function ad.ResetDungeon(ak
)if not(type(ak)=='string'and#ak>0)then return end if ah[ak]then ah[ak]=nil aj()
end end return ad end function a.q()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak=a.
load'a',a.load'c',a.load'b',a.load'j',a.load'k',a.load'm',a.load'l',a.load'p',
game:GetService'Players',game:GetService'Workspace',game:GetService
'ReplicatedStorage'local al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax,ay,az,aA,aB,aC,
aD,aE,aF,aG=aa.player,{},false,false,true,false,false,'',false,{},0,{},{},0,0,2,
{'abilities','projectiles'},false,{},{firstbossbeamparticles=true}local aH,aI,aJ
,aK,aL,aM,aN,aO=function()if aC then return end aC=true for aH,aI in ipairs(aB)
do local aJ=ak:FindFirstChild(aI)if aJ then for aK,aL in ipairs(aJ:GetChildren()
)do local aM=(aL.Name or''):lower():gsub('%s+','')if#aM>0 then aD[aM]=true end
end end end end,function(aH)if not aH then return true end local aI=aH.Name if
typeof(aI)=='string'then local aJ=aI:lower()if aJ:sub(1,3)=='tm_'or aJ:sub(1,3)
=='pr_'or aJ:sub(1,3)=='dq_'or aJ:find'pathrecord'or aJ:find'safespot'or aJ:find
'hazard'or aJ:find'adornment'or aJ:find'debug'or aJ:find'targetpart'or aJ:find
'actualmarker'then return true end local aK=aH.Parent while aK and aK~=workspace
and aK~=game do local aL=aK.Name if typeof(aL)=='string'then local aM=aL:lower()
if aM:find'pathrecord'or aM:sub(1,3)=='tm_'or aM:sub(1,3)=='pr_'then return true
end end aK=aK.Parent end local aL=aJ:gsub('%s+','')if#aL>0 and aD[aL]==true then
return true end if aE[aL]==true or aE[aI]==true then return true end for aM,aN
in pairs(aE)do if string.find(aL,aM,1,true)then return true end end end return
false end,function(aH)if not aH then return false end if ai:
GetPlayerFromCharacter(aH)then return true end if ai:FindFirstChild(aH.Name)then
return true end for aI,aJ in ipairs(ai:GetPlayers())do if aH.Name==aJ.Name then
return true end local aK=aJ.Character if aK and(aH==aK or aH:IsDescendantOf(aK))
then return true end end local aI=al and al.Character if aI and(aH==aI or aH:
IsDescendantOf(aI))then return true end return false end,function()local aH=0
for aI in pairs(au)do aH+=1 end av=aH for aI=#aw,1,-1 do pcall(aw[aI],aH,aF)end
end,0.85,50,0.05,{}local aP,aQ,aR=function(aP)local aQ=aO[aP]if aQ then aQ.
active=false aO[aP]=nil end end,function()for aP,aQ in pairs(aO)do if aQ then aQ
.active=false end end table.clear(aO)end,function(aP)if not aP or type(aP)~=
'string'then return false end local aQ=aP:lower():gsub('%s+','')return string.
find(aQ,'firstbossbeampart',1,true)~=nil end local aS,aT,aU,aV,aW,aX=function(aS
)if not aS then return{}end local aT,aU={},aR(aS.Name)local aV=function(aV)if aV
and aV.Parent and(aV.Transparency<=aL or aU)then aT[#aT+1]=aV end end if aS:IsA
'BasePart'then aV(aS)else for aW,aX in ipairs(aS:GetDescendants())do if aX:IsA
'BasePart'and aX.Parent then aV(aX)end end end return aT end,function(aS)local
aT=al and al.Character if not aT then return 0 end local aU=aT:FindFirstChild
'HumanoidRootPart'or aT.PrimaryPart if not aU then return 0 end local aV,aW=(aU.
Position)if aS:IsA'BasePart'then aW=aS.Position elseif aS:IsA'Model'then local
aX,aY=pcall(function()return aS:GetPivot().Position end)if aX then aW=aY else
local aZ=aS:FindFirstChildWhichIsA'BasePart'aW=aZ and aZ.Position end end if not
aW then return 0 end return math.floor((aV-aW).Magnitude+0.5)end,Color3.fromRGB(
255,45,45),Color3.fromRGB(255,30,30),Color3.fromRGB(0,170,255),Color3.fromRGB(0,
140,255)local aY=function(aY,aZ,a_)local a0,a1,a2={},a_ and aW or aU,a_ and aX
or aV for a3,a4 in ipairs(aY)do if a4 and a4.Parent and not aR(a4.Name)and not
aR(a4.Parent and a4.Parent.Name)then local a5=Instance.new'SelectionBox'a5.Name=
'HazardSelectionBox'a5.Color3=a1 a5.SurfaceColor3=a2 a5.SurfaceTransparency=0.6
a5.LineThickness=0.05 a5.Adornee=a4 a5.Parent=a4 local a6=a4:
GetPropertyChangedSignal'Transparency':Connect(function()if a4.Parent and a4.
Transparency>aL then pcall(function()a5:Destroy()end)end end)if aZ then table.
insert(aZ,a6)end a0[#a0+1]=a5 end end return a0 end function am.
UpdateHazardVisualColor(aZ,a_)if not aZ or not aZ.Boxes then return end local a0
=a_==true or aZ.IsTrajectory==true local a1,a2=a0 and aW or aU,a0 and aX or aV
for a3,a4 in ipairs(aZ.Boxes)do if a4 and a4.Parent then a4.Color3=a1 a4.
SurfaceColor3=a2 end end ag.UpdateHazardVisualColor(aZ,a0)end local aZ,a_=
function(aZ)if not at or as==''then return false end if not aZ or type(aZ)~=
'string'then return false end local a_=as:lower():gsub('%s+','')if#a_==0 then
return false end local a0=aZ:lower():gsub('%s+','')return string.find(a0,a_,1,
true)~=nil end,function(aZ)if not aZ then return'nil'end return(
'(%.2f, %.2f, %.2f)'):format(aZ.X,aZ.Y,aZ.Z)end local a0=function(a0,a1,a2,a3)if
not a0 then return end local a4=a0.Name if not aZ(a4)then return end local a5,a6
,a7=a0.ClassName,a0.Parent and a0.Parent:GetFullName()or'nil',aT(a0)print
'================== \u{1f50d} [HAZARD DEEP INSPECT] \u{1f50d} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(a4,a5))print((
'  \u{1f4cc} Event Type     : %s%s'):format(a1,a2 and(' -> '..tostring(a2))or'')
)print(('  \u{1f4cd} Full Path      : %s'):format(a6))print((
'  \u{1f4cf} Dist to Player : %d studs'):format(a7))if a1=='SPAWN'then local a8=
{}if a0:IsA'BasePart'then table.insert(a8,a0)else for a9,b in ipairs(a0:
GetDescendants())do if b:IsA'BasePart'then table.insert(a8,b)end end end print((
'  \u{1f9e9} Total Parts (%d) :'):format(#a8))for a9,b in ipairs(a8)do local ba=
b:IsA'Part'and tostring(b.Shape.Name)or(b.ClassName=='MeshPart'and'MeshPart'or b
.ClassName)print(('     [%d] %q (%s)'):format(a9,b.Name,b.ClassName))print((
'         \u{2022} Size: %s | Shape: %s | Trans: %.2f | CanCollide: %s'):format(
a_(b.Size),ba,b.Transparency,tostring(b.CanCollide)))print((
'         \u{2022} Pos : %s'):format(a_(b.Position)))end local a9=ad.
GetHazardZones(a3)if a9 and a9.zones then local b=ad.GetHitboxPadding()print((
'  \u{1f4d0} Math Geometry (Zones: %d, BoundingRadius: %.1f studs):'):format(#a9
.zones,a9.boundingRadius or 0))for ba,bb in ipairs(a9.zones)do if bb.radius then
print((
[[     - Zone [%d]: Circle/Ball (Base Radius: %.2f + Pad: %.2f = %.2f studs)]]):
format(ba,bb.radius,b,bb.radius+b))elseif bb.half then print((
'     - Zone [%d]: Box/OBB (HalfSize: %s)'):format(ba,a_(bb.half)))end end end
task.spawn(function()local b if a0:IsA'BasePart'then b=a0 elseif a0:IsA'Model'
then b=a0.PrimaryPart or a0:FindFirstChildWhichIsA'BasePart'end if not b then
return end local ba,bb=os.clock(),b.CFrame task.wait(0.12)if not a0.Parent or
not b.Parent then return end local bc,bd=os.clock(),b.CFrame local be=bc-ba if
be<=0 then return end local bf=bd*bb:Inverse()local bg,bh=bf:ToAxisAngle()local
bi,bj=math.deg(bh)/be,bb:Inverse()*bd local bk,bl=bj:ToAxisAngle()if math.abs(
math.deg(bh))>=1.5 then local bm=
'Tr\u{1ee5}c t\u{1ef1} do / H\u{1ed7}n h\u{1ee3}p'if math.abs(bg.Y)>=0.8 then bm
='Tr\u{1ee5}c Y (Yaw - Qu\u{e9}t ngang m\u{1eb7}t s\u{e0}n)'elseif math.abs(bg.X
)>=0.8 then bm='Tr\u{1ee5}c X (Pitch - L\u{103}n nh\u{e0}o l\u{1ed9}n)'elseif
math.abs(bg.Z)>=0.8 then bm=
'Tr\u{1ee5}c Z (Roll - Nghi\u{ea}ng l\u{1ead}t b\u{ea}n)'end local bn=
'Tr\u{1ee5}c t\u{1ef1} do'if math.abs(bk.Y)>=0.8 then bn='Tr\u{1ee5}c Local Y'
elseif math.abs(bk.X)>=0.8 then bn='Tr\u{1ee5}c Local X'elseif math.abs(bk.Z)>=
0.8 then bn='Tr\u{1ee5}c Local Z'end print
'================== \u{1f504} [INSPECT: SPINNING DETECTED] \u{1f504} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(a0.Name,b.Name))print((
'  \u{26a1} T\u{1ed1}c \u{111}\u{1ed9} xoay    : %.2f \u{b0}/s (%.2f rad/s)'):
format(bi,bh/be))print(('  \u{1f310} World Spin Axis: %s -> %s'):format(a_(bg),
bm))print(('  \u{1f9e9} Local Spin Axis: %s -> %s'):format(a_(bk),bn))print
[[========================================================================]]end
end)elseif a1=='DESPAWN'then if a3 and a3.SpawnClock then local a8=os.clock()-a3
.SpawnClock print(('  \u{23f1}\u{fe0f} Lifetime Active: %.2f seconds'):format(a8
))end elseif a1=='REJECTED'then print(('  \u{26a0}\u{fe0f} Rejection Reason: %s'
):format(tostring(a2)))end print
[[================================================================]]end local a1
,a2=function(a1,a2)a0(a1,'REJECTED',a2,nil)if not ar then return end local a3,a4
=a1 and a1.Name or'?',a1 and a1.ClassName or'?'print((
'[HazardScanner][Reject] \u{26aa} %s (%s) \u{2014} %s'):format(a3,a4,a2))end
local a3=function(a3)if not a3 or not a3.Parent then return end if os.clock()<az
then return end if aJ(a3)then return end if au[a3]then return end if aO[a3]then
return end local a4={active=true,count=0}aO[a3]=a4 task.spawn(function()while a4
.active and a3.Parent and an and ao do if ah.IsActiveHazardScannerEnabled and
not ah.IsActiveHazardScannerEnabled()then aP(a3)return end if os.clock()<az then
aP(a3)return end if aJ(a3)then aP(a3)return end a4.count+=1 local a5,a6,a7=a3:
GetDescendants(),aS(a3),aZ(a3.Name)if ar or a7 then print((
'[HazardScanner][Retry] \u{1f504} L\u{1ea7}n %d/%d: %q (%s) | Descendants: %d | Valid Parts (Trans<=%.2f): %d'
):format(a4.count,aM,a3.Name,a3.ClassName,#a5,aL,#a6))end if#a6>0 then if ar or
a7 then print((
'[HazardScanner][Retry] \u{2705} L\u{1ea7}n %d/%d: %q \u{110}\u{e3} t\u{ec}m th\u{1ea5}y %d part(s)! Ti\u{1ebf}n h\u{e0}nh v\u{1ebd}...'
):format(a4.count,aM,a3.Name,#a6))end aP(a3)a2(a3)return end if a4.count>=aM
then a1(a3,(
'H\u{1ebf}t %d l\u{1b0}\u{1ee3}t retry m\u{e0} kh\u{f4}ng t\u{ec}m th\u{1ea5}y BasePart h\u{1ee3}p l\u{1ec7} (Descendants: %d)'
):format(aM,#a5))aP(a3)return end task.wait(aN)end aP(a3)end)end a2=function(a4)
if not an or not ao then a1(a4,'Ch\u{1b0}a trong dungeon')return false end if ah
.IsActiveHazardScannerEnabled and not ah.IsActiveHazardScannerEnabled()then a1(
a4,'T\u{1eaf}t Hazard Scanner cho m\u{1ee5}c ti\u{ea}u trong Contextual')return
false end if os.clock()<az then a1(a4,
'\u{110}ang trong 2s chuy\u{1ec3}n room (Ch\u{1eb7}n t\u{1ea1}o Danger Zone)')
return false end if not a4 or not a4.Parent then a1(a4,
'Kh\u{f4}ng c\u{f2}n Parent')return false end if aJ(a4)then a1(a4,
'Nh\u{e2}n v\u{1ead}t ng\u{1b0}\u{1edd}i ch\u{1a1}i (Player/Teammate)')return
false end if au[a4]then return true end aH()if aI(a4)then a1(a4,
'Tr\u{f9}ng t\u{ea}n trong ReplicatedStorage (abilities/projectiles)')return
false end local a5=aS(a4)if#a5==0 then a1(a4,
'Ch\u{1b0}a c\u{f3} part \u{111}\u{1ec3} v\u{1ebd} (s\u{1ebd} retry)')a3(a4)
return false end local a6,a7=ad.IsIceSpikesChain and ad.IsIceSpikesChain(a4.Name
),ad.IsSecondBossCircleChain and ad.IsSecondBossCircleChain(a4.Name)if a7 then
local a8=os.clock()if a8-ay<6 then a1(a4,
'V\u{f2}ng con c\u{1ee7}a chu\u{1ed7}i secondBossCricleHitbox (\u{111}\u{e3} d\u{1ef1}ng tr\u{1b0}\u{1edb}c 10 v\u{f2}ng)'
)return false end ay=a8 end local a8=aT(a4)local a9,b,ba={Instance=a4,Name=a4.
Name,Class=a4.ClassName,Distance=a8,Boxes={},Connections={},SpawnClock=os.clock(
)},{},{}if ap and not a6 and not a7 then ba=aY(a5,b)end a9.Boxes=ba a9.
Connections=b au[a4]=a9 aF={Name=a4.Name,Class=a4.ClassName,Distance=a8}if ae.
IsEnabled()then ae.AttachZoneVisuals(a9)end if af.IsEnabled()then af.
AttachTrajectoryVisuals(a9)end if ag.IsEnabled()then ag.AttachTimerVisual(a9)end
aP(a4)a0(a4,'SPAWN','Passed all gates',a9)if aq then print((
'[HazardScanner][Hazard] \u{1f534} Hazard Detected: %s (%s, %d studs)'):format(
a4.Name,a4.ClassName,a8))end aK()return true end local function a4(a5,a6)local
a7=au[a5]if not a7 then aP(a5)return end if a7.MaxExpireTime and os.clock()<a7.
MaxExpireTime and a6=='Destroyed'then task.delay(a7.MaxExpireTime-os.clock()+0.1
,function()if au[a5]==a7 and os.clock()>=a7.MaxExpireTime then a4(a5,
'Wave Completed')end end)return end a0(a5,'DESPAWN',a6,a7)ae.DetachZoneVisuals(
a7)af.DetachTrajectoryVisuals(a7)ag.DetachTimerVisual(a7)if a7.Boxes then for a8
,a9 in ipairs(a7.Boxes)do pcall(function()a9:Destroy()end)end table.clear(a7.
Boxes)end if a7.Connections then for a8,a9 in ipairs(a7.Connections)do pcall(
function()a9:Disconnect()end)end table.clear(a7.Connections)end au[a5]=nil if aq
then local a8=a6 and(' ('..a6..')')or''print((
'[HazardScanner][Hazard] \u{1f7e2} Hazard Expired: %s%s'):format(tostring(a7.
Name),a8))end aK()end function am.ClearAllHazards(a5)ay=0 ae.ClearAll()af.
ClearAll()ag.ClearAll()aQ()local a6={}for a7 in pairs(au)do table.insert(a6,a7)
end for a7,a8 in ipairs(a6)do a4(a8,a5)end if aq and a5 then print((
'[HazardScanner][Hazard] \u{1f9f9} All hazards cleared: %s'):format(a5))end end
function am.TriggerRoomTransition(a5)az=os.clock()+aA am.ClearAllHazards(a5 or
'Room Transition (2s cooldown)')task.delay(aA,function()if ao and an then am.
ClearAllHazards'Room Transition Sweep (End 2s)'end end)end function am.
IsRoomTransitioning()return os.clock()<az end function am.StartScan()if an then
return end an=true ae.BindDetection(am)af.BindDetection(am)ag.BindDetection(am)
am.ClearAllHazards'StartScan Reset'for a5,a6 in ipairs(ax)do a6:Disconnect()end
table.clear(ax)table.insert(ax,aj.ChildAdded:Connect(function(a5)if aJ(a5)then
return end a2(a5)end))table.insert(ax,aj.ChildRemoved:Connect(function(a5)a4(a5,
'Destroyed')end))ao=not(ab.IsInLobby and ab.IsInLobby())and(type(ab.
GetCurrentDungeonName())=='string'and#ab.GetCurrentDungeonName()>0)local a5=ab.
GetCurrentRoomIndex()if aG then pcall(aG)aG=nil end aG=ab.OnRoomIndexChanged(
function(a6)if a6~=a5 then a5=a6 if a6>0 then ao=true am.TriggerRoomTransition(
'Room Transition to room '..tostring(a6))elseif ab.IsInLobby and ab.IsInLobby()
and ao then ao=false am.ClearAllHazards'Dungeon Ended'end end end)if aq then
print'[HazardScanner] \u{1f4e1} Threat Detector started!'end end function am.
StopScan()an=false ao=false for a5,a6 in ipairs(ax)do a6:Disconnect()end table.
clear(ax)if aG then pcall(aG)aG=nil end am.ClearAllHazards'StopScan'if aq then
print'[HazardScanner] \u{1f6d1} Threat Detector stopped.'end end function am.
IsEnabled()return an end function am.SetEnabled(a5)if a5 then am.StartScan()else
am.StopScan()end end function am.SetSelectionBoxesEnabled(a5)ap=a5 and true or
false if ap then for a6,a7 in pairs(au)do if a6 and a6.Parent and(not a7.Boxes
or#a7.Boxes==0)then local a8=aS(a6)a7.Connections=a7.Connections or{}a7.Boxes=
aY(a8,a7.Connections)end end else for a6,a7 in pairs(au)do if a7.Boxes then for
a8,a9 in ipairs(a7.Boxes)do pcall(function()a9:Destroy()end)end table.clear(a7.
Boxes)end end end end function am.IsSelectionBoxesEnabled()return ap end
function am.SetLogHazards(a5)aq=a5 and true or false end function am.
IsLogHazardsEnabled()return aq end function am.SetLogFailed(a5)ar=a5 and true or
false end function am.IsLogFailedEnabled()return ar end function am.
SetInspectTarget(a5)as=type(a5)=='string'and a5 or''end function am.
GetInspectTarget()return as end function am.SetInspectEnabled(a5)at=a5 and true
or false end function am.IsInspectEnabled()return at end function am.
GetHazardCount()return av end function am.GetActiveHazards()local a5={}for a6,a7
in pairs(au)do if a6 and a6.Parent==aj then a5[#a5+1]=a7 end end return a5 end
function am.GetActiveHazardsMap()return au end function am.GetLastHazardInfo()
return aF end function am.OnHazardChanged(a5)if type(a5)~='function'then return
end table.insert(aw,a5)end ac.Register(function()am.StopScan()am.ClearAllHazards
'Shutdown'end)return am end function a.r()local aa,ab,ac,ad,ae=a.load'a',a.load
'b',a.load'j',a.load'm',a.load'p'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as
,at,au,av,aw=aa.RunService or game:GetService'RunService',aa.player,{},true,
false,{},1.8,Color3.fromRGB(0,255,170),Color3.fromRGB(255,35,35),0.45,0.2,0.2,(
game:GetService'Players')local ax,ay,az,aA=function()local ax=ag or ar.
LocalPlayer if not ax then return nil end local ay=ax.Character if not ay or not
ay.Parent then return nil end local az=ay:FindFirstChildOfClass'Humanoid'if az
and az.Health<=0 then return nil end return ay:FindFirstChild'HumanoidRootPart'
or ay.PrimaryPart end,function(ax)if not ax then return 0 end return ax.Position
.Y-2.5 end,function(ax)if av then if av.Parent~=ax or not av:IsDescendantOf(
workspace)then pcall(function()av:Destroy()end)av=nil else if av.Adornee~=ax
then av.Adornee=ax end return av end end if not ax or not ax.Parent then return
nil end local ay=Instance.new'CylinderHandleAdornment'ay.Name=
'Player_2D_HitboxVisual'ay.Adornee=ax ay.Radius=al ay.Height=aq ay.Color3=aj and
an or am ay.Transparency=aj and ap or ao ay.ZIndex=5 ay.AlwaysOnTop=false ay.
Visible=ai ay.Parent=ax av=ay return ay end,function(ax)if not av or not av.
Parent then return end av.Color3=ax and an or am av.Transparency=ax and ap or ao
end local aB=function()local aB=ax()if not aB or not aB.Parent then if av and av
.Parent then av.Visible=false end if aj then aj=false as=nil at=nil for aC,aD in
ipairs(ak)do pcall(aD,false,nil,nil)end end return end local aC=az(aB)if aC and
aC.Parent then aC.Visible=ai aC.Radius=al local aD=ay(aB)local aE=CFrame.new(
Vector3.new(aB.Position.X,aD,aB.Position.Z))*CFrame.Angles(math.rad(90),0,0)aC.
CFrame=aB.CFrame:ToObjectSpace(aE)end if ae.IsActiveHazardScannerEnabled and not
ae.IsActiveHazardScannerEnabled()then if aj then aj=false as=nil at=nil aA(false
)for aD,aE in ipairs(ak)do pcall(aE,false,nil,nil)end end return end local aD=
Vector3.new(aB.Position.X,0,aB.Position.Z)local aE,aF,aG=ac.IsPointInAnyHazard(
aD,nil,al)local aH,aI=false if not aE and ad.IsPointInAnyTrajectory then aH,aI=
ad.IsPointInAnyTrajectory(aD,al)end local aJ,aK,aL=(aE or aH),aF or aI,aE and
'Ground Zone'or(aH and'Trajectory Corridor'or nil)if aJ~=aj or aK~=as then aj=aJ
as=aK at=aL aA(aJ)for aM,aN in ipairs(ak)do pcall(aN,aJ,aK,aL)end end end local
aC=function()if not au then au=af.Heartbeat:Connect(aB)end end function ah.
Cleanup()if au then au:Disconnect()au=nil end if av then pcall(function()av:
Destroy()end)av=nil end aj=false as=nil at=nil end function ah.IsPlayerInDanger(
)return aj,as,at end function ah.GetCurrentThreat()return as,at end function ah.
OnDangerStatusChanged(aD)if type(aD)=='function'then table.insert(ak,aD)end end
function ah.SetVisualEnabled(aD)ai=aD and true or false if av then av.Visible=ai
end end function ah.IsVisualEnabled()return ai end function ah.SetRadius(aD)if
type(aD)=='number'and aD>=0.1 then al=aD if av and av.Parent then av.Radius=al
end end end function ah.GetRadius()return al end local aD=function()local aD=ag
or ar.LocalPlayer if not aD then return end local aE=function(aE)if av then
pcall(function()av:Destroy()end)av=nil end task.spawn(function()local aF=aE:
WaitForChild('Humanoid',3)if aF then aF.Died:Connect(function()if av then av.
Visible=false end end)end end)end aw=aD.CharacterAdded:Connect(aE)if aD.
Character then aE(aD.Character)end end aD()aC()ab.Register(function()if aw then
aw:Disconnect()aw=nil end ah.Cleanup()end)return ah end function a.s()local aa,
ab,ac={},{},8 for ad=1,ac do local ae=(ad-1)*(2*math.pi/ac)ab[ad]=Vector3.new(
math.cos(ae),0,math.sin(ae))end local ad,ae={},16 for af=1,ae do local ag=(af-1)
*(2*math.pi/ae)ad[af]=Vector3.new(math.cos(ag),0,math.sin(ag))end local af,ag,ah
={1.5,3,5,8,12,18,25},{1.5,3,4.5,6,8,10.5,13.5,17,21,26,32,38,45},{1.5,3,4.5,6,8
,10.5,13.5,17,21,26,32,38,45,50,55}aa.COARSE_DIRECTIONS=ab aa.FINE_DIRECTIONS=ad
aa.COARSE_RADII=af aa.FINE_RADII=ag aa.FALLBACK_RADII=ah function aa.SamplePass(
ai,aj,ak,al,am,an,ao,ap)local aq,ar,as,at,au=math.huge,Vector3.zero,false,aj if
ap and ap.Magnitude>0.1 then local av=Vector3.new(ap.X,0,ap.Z).Unit at=table.
clone(aj)table.sort(at,function(aw,ax)local ay,az=aw.X*av.X+aw.Z*av.Z,ax.X*av.X+
ax.Z*av.Z return ay>az end)end for av,aw in ipairs(ak)do local ax=false for ay,
az in ipairs(at)do local aA=ai+az*aw local aB=an(aA)if ao then table.insert(ao,{
pos=aA,isSafe=aB,isChosen=false})end if aB then local aC=aA if am and al>0 then
local aD=aA+az*al if an(aD)then aC=aD end end local aD=(aC-ai).Magnitude if aD<
aq then aq=aD au=aC ar=az ax=true end end end if ax and au then as=true break
end end return au,as,aq,ar end return aa end function a.t()local aa,ab,ac,ad,ae,
af,ag,ah,ai,aj,ak,al,am=Color3.fromRGB(0,255,120),Color3.fromRGB(0,255,150),
Color3.fromRGB(255,255,255),Color3.fromRGB(0,235,140),Color3.fromRGB(255,60,60),
0.2,1.4,0.45,{},{}local an,ao=function(an)if not an then return end if not ak or
not ak.Parent then if ak then pcall(function()ak:Destroy()end)end local ao=
Instance.new'CylinderHandleAdornment'ao.Name='SafeSpot_OuterMarker'ao.Adornee=an
ao.Radius=ag ao.Height=af ao.Color3=aa ao.Transparency=0.35 ao.ZIndex=6 ao.
AlwaysOnTop=false ao.Visible=false ao.Parent=an ak=ao end if not al or not al.
Parent then if al then pcall(function()al:Destroy()end)end local ao=Instance.new
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
PointToObjectSpace(at)for av,aw in ipairs(ar)do local ax,ay=ao(av,ap),Vector3.
new(aw.pos.X,aq+0.05,aw.pos.Z)local az,aA,aB=ap.CFrame:PointToObjectSpace(ay),aw
.isSafe and ad or ae,aw.isSafe and 0.35 or 0.55 if ax.dot and ax.dot.Parent then
local aC=CFrame.new(ay)*CFrame.Angles(math.rad(90),0,0)ax.dot.CFrame=ap.CFrame:
ToObjectSpace(aC)ax.dot.Color3=aA ax.dot.Transparency=aB ax.dot.Radius=aw.isSafe
and 0.3 or 0.2 ax.dot.Visible=true end if ax.line and ax.line.Parent then local
aC=az-au local aD=aC.Magnitude if aD>0.2 then ax.line.CFrame=CFrame.lookAt(au,az
)ax.line.Length=aD ax.line.Color3=aA ax.line.Transparency=aB+0.15 ax.line.
Thickness=aw.isSafe and 1.4 or 0.9 ax.line.Visible=true else ax.line.Visible=
false end end end for av=#ar+1,#aj do local aw=aj[av]if aw.dot and aw.dot.Parent
then aw.dot.Visible=false end if aw.line and aw.line.Parent then aw.line.Visible
=false end end end function ai.Update(aq,ar,as,at,au,av)if not aq or not aq.
Parent or not au or not ar then ai.Hide()return end an(aq)local aw=Vector3.new(
ar.X,as,ar.Z)if ak and ak.Parent then local ax=CFrame.new(aw)*CFrame.Angles(math
.rad(90),0,0)ak.CFrame=aq.CFrame:ToObjectSpace(ax)ak.Visible=true end if al and
al.Parent then local ax=CFrame.new(aw)*CFrame.Angles(math.rad(90),0,0)al.CFrame=
aq.CFrame:ToObjectSpace(ax)al.Visible=true end if am and am.Parent then local ax
,ay=Vector3.new(aq.Position.X,as+0.1,aq.Position.Z),Vector3.new(ar.X,as+0.1,ar.Z
)local az,aA=aq.CFrame:PointToObjectSpace(ax),aq.CFrame:PointToObjectSpace(ay)
local aB=aA-az local aC=aB.Magnitude if aC>0.3 then am.CFrame=CFrame.new(az)am.
Length=aC am.CFrame=CFrame.lookAt(az,aA)am.Visible=true else am.Visible=false
end end ap(aq,as,at,av)end function ai.Cleanup()if ak then pcall(function()ak:
Destroy()end)ak=nil end if al then pcall(function()al:Destroy()end)al=nil end if
am then pcall(function()am:Destroy()end)am=nil end for aq,ar in ipairs(aj)do if
ar.dot then pcall(function()ar.dot:Destroy()end)end if ar.line then pcall(
function()ar.line:Destroy()end)end end table.clear(aj)end return ai end function
a.u()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'a',a.load'c',a.load'b',a.load'j',a.
load'm',a.load'r',a.load's',a.load't',a.load'p'local aj,ak,al,am,an,ao,ap,aq,ar,
as,at,au,av,aw,ax,ay,az,aA,aB,aC=aa.RunService or game:GetService'RunService',
game:GetService'Players',aa.player,{},true,true,true,true,false,2,0,false,{},{},
0 local aD,aE,aF=function()local aD=al or ak.LocalPlayer if not aD then return
nil end local aE=aD.Character if not aE or not aE.Parent then return nil end
local aF=aE:FindFirstChildOfClass'Humanoid'if aF and aF.Health<=0 then return
nil end return aE:FindFirstChild'HumanoidRootPart'or aE.PrimaryPart end,function
(aD)local aE=al or ak.LocalPlayer if not aE then return nil end local aF=aE.
Character if not aF or not aF.Parent then return nil end local aG=aF:
FindFirstChildOfClass'Humanoid'if aG and aG.Health>0 then local aH=aG.
MoveDirection if aH and aH.Magnitude>0.1 then return Vector3.new(aH.X,0,aH.Z).
Unit end end if aD and aD.Parent then local aH=Vector3.zero pcall(function()aH=
aD.AssemblyLinearVelocity or aD.Velocity or Vector3.zero end)local aI=Vector3.
new(aH.X,0,aH.Z)if aI.Magnitude>=2 then return aI.Unit end end return nil end,
function(aD)if not aD then return 0 end return aD.Position.Y-2.5 end function am
.IsPointSafe(aG,aH)if not aG then return false end local aI,aJ,aK,aL=Vector3.
new(aG.X,0,aG.Z),ai.GetActiveBossArea()if aJ and aL and aK and aK>0 then local
aM=Vector3.new(aL.X,0,aL.Z)if(aI-aM).Magnitude>aK then return false end end
local aM=(af.GetRadius and af.GetRadius()or 1.8)+(aH or 0)if ad.
IsPointInAnyHazard and ad.IsPointInAnyHazard(aI,nil,aM)then return false end if
ae.IsPointInAnyTrajectory and ae.IsPointInAnyTrajectory(aI,aM)then return false
end return true end function am.FindNearestSafeSpot(aG)if ab.IsInvulnerable and
ab.IsInvulnerable()then return nil,false,0,Vector3.zero end local aH=aD()if not
aG then if not aH then return nil,false,0,Vector3.zero end aG=aH.Position end
local aI,aJ=Vector3.new(aG.X,0,aG.Z),aE(aH)table.clear(aw)local aK,aL,aM=ai.
GetActiveBossArea()local aN,aO,aP=(aK and aM and aL and aL>0)and Vector3.new(aM.
X,0,aM.Z)or nil,ad.GetNearbyHazards and ad.GetNearbyHazards(aI,75)or nil,ae.
GetNearbyTrajectories and ae.GetNearbyTrajectories(aI,75)or nil local aQ=
function(aQ,aR)if not aQ then return false end local aS=Vector3.new(aQ.X,0,aQ.Z)
if aN and aL then local aT=(aS-aN).Magnitude if aT>aL then return false end end
local aT=(af.GetRadius and af.GetRadius()or 1.8)+(aR or 0)if ad.
IsPointInAnyHazard and ad.IsPointInAnyHazard(aS,nil,aT,aO)then return false end
if ae.IsPointInAnyTrajectory and ae.IsPointInAnyTrajectory(aS,aT,aP)then return
false end return true end if(aO and#aO==0 and aP and#aP==0 and not aN)or aQ(aI,0
)then table.insert(aw,{pos=aI,isSafe=true,isChosen=true})return aI,true,0,
Vector3.zero end local aR,aS=aJ,af.GetRadius and af.GetRadius()or 1.8 local aT,
aU,aV,aW=ae.IsPointInAnyTrajectory(aI,aS,aP)if aT and aV and aW then local aX,aY
,aZ=Vector3.new(-aV.Z,0,aV.X),Vector3.new(aV.Z,0,-aV.X),aI-aW local a_=aZ.X*aX.X
+aZ.Z*aX.Z local a0=a_>=0 and aX or aY if aJ and aJ.Magnitude>0.1 then local a1,
a2=aJ.X*aX.X+aJ.Z*aX.Z,aJ.X*aY.X+aJ.Z*aY.Z if a1>a2+0.3 then a0=aX elseif a2>a1+
0.3 then a0=aY end end local a1=0.45 if aJ and aJ.Magnitude>0.1 then local a2,a3
=-(aJ.X*aV.X+aJ.Z*aV.Z),math.abs(aJ.X*a0.X+aJ.Z*a0.Z)if a3>0.05 then local a4=a2
/a3 a1=math.clamp(a4,0.18,1)elseif a2>0 then a1=1 else a1=0.18 end end local a2=
(a0-a1*aV).Unit aR=a2 elseif aN and(aI-aN).Magnitude>aL then aR=(aN-aI).Unit end
local aX,aY,aZ,a_=ag.SamplePass(aI,ag.COARSE_DIRECTIONS,ag.COARSE_RADII,as,true,
aQ,aw,aR)if not aY and aq then aX,aY,aZ,a_=ag.SamplePass(aI,ag.FINE_DIRECTIONS,
ag.FINE_RADII,as,true,aQ,aw,aR)end if not aY and ar then aX,aY,aZ,a_=ag.
SamplePass(aI,ag.FINE_DIRECTIONS,ag.FALLBACK_RADII or ag.FINE_RADII,0,false,aQ,
aw,aR)end if aY and aX then for a0,a1 in ipairs(aw)do if(a1.pos-aX).Magnitude<
0.25 then a1.isChosen=true break end end return aX,true,aZ,a_ end return aI,
false,math.huge,Vector3.zero end local aG=function()if not an then ah.Hide()
return end local aG=aD()if not aG or not aG.Parent then ah.Hide()return end if
ab.IsInvulnerable and ab.IsInvulnerable()then am.Clear()return end if(ai.
IsActiveDodgeDisabled and ai.IsActiveDodgeDisabled())or(ai.
IsActiveHazardScannerEnabled and not ai.IsActiveHazardScannerEnabled())then am.
Clear()return end local aH,aI,aJ=false if af.IsPlayerInDanger then aH,aI,aJ=af.
IsPlayerInDanger()end local aK=aH or(ay~=nil)or au if not aK then local aL=os.
clock()if aL-ax<0.05 then return end ax=aL end local aL,aM=aF(aG),Vector3.new(aG
.Position.X,0,aG.Position.Z)if aH then local aN,aO=ay and(ay-aM).Magnitude or 0,
ay and am.IsPointSafe(ay)if not ay or not aO then local aP,aQ,aR,aS=am.
FindNearestSafeSpot(aG.Position)if aQ and aP then ay=aP az=aI aA=aJ at=aR au=
true ah.Update(aG,aP,aL,aw,ao,ap)for aT,aU in ipairs(av)do pcall(aU,true,aP,aR)
end else ah.Hide()end else at=aN ah.Update(aG,ay,aL,aw,ao,ap)for aP,aQ in
ipairs(av)do pcall(aQ,true,ay,aN)end end else local aN,aO=ay and(ay-aM).
Magnitude or 0,ay and am.IsPointSafe(ay)if aO and aN>0.8 then at=aN ah.Update(aG
,ay,aL,aw,ao,ap)for aP,aQ in ipairs(av)do pcall(aQ,true,ay,aN)end else if au or
ay then au=false ay=nil az=nil aA=nil at=0 ah.Hide()for aP,aQ in ipairs(av)do
pcall(aQ,false,nil,0)end end end end end local aH=function()if not aB then aB=aj
.Heartbeat:Connect(aG)end if not aC and af.OnDangerStatusChanged then aC=af.
OnDangerStatusChanged(function(aH)if aH and an then aG()end end)end end function
am.Clear()if au or ay then au=false ay=nil az=nil aA=nil at=0 table.clear(aw)ah.
Hide()for aI,aJ in ipairs(av)do pcall(aJ,false,nil,0)end end end function am.
Cleanup()if aB then aB:Disconnect()aB=nil end ah.Cleanup()table.clear(aw)ay=nil
az=nil aA=nil at=0 au=false ax=0 end function am.GetLastSafeSpot()return ay,at,
au end function am.OnSafeSpotChanged(aI)if type(aI)=='function'then table.
insert(av,aI)end end function am.SetVisualEnabled(aI)ao=aI and true or false if
not ao then ah.Hide()end end function am.IsVisualEnabled()return ao end function
am.SetShowCandidates(aI)ap=aI and true or false if not ap then ah.
HideCandidates()end end function am.IsShowCandidates()return ap end function am.
SetEnabled(aI)an=aI and true or false if not an then ah.Hide()end end function
am.IsEnabled()return an end function am.SetSafetyBuffer(aI)if type(aI)=='number'
and aI>=0 then as=aI end end function am.GetSafetyBuffer()return as end function
am.SetFinePassEnabled(aI)aq=aI and true or false end function am.
IsFinePassEnabled()return aq end function am.SetFallbackPassEnabled(aI)ar=aI and
true or false end function am.IsFallbackPassEnabled()return ar end local aI=
function()local aI=al or ak.LocalPlayer if not aI then return end aI.
CharacterAdded:Connect(function()am.Clear()end)end aI()if ab.OnRoomIndexChanged
then ab.OnRoomIndexChanged(function()am.Clear()end)end if ab.OnEnemyChanged then
ab.OnEnemyChanged(function()if ab.GetEnemyCount and ab.GetEnemyCount()==0 then
am.Clear()end end)end if ab.OnLobbyChanged then ab.OnLobbyChanged(function()am.
Clear()end)end if ab.OnBossActiveChanged then ab.OnBossActiveChanged(function()
am.Clear()end)end aH()ac.Register(function()am.Cleanup()end)return am end
function a.v()local aa,ab,ac,ad,ae,af=a.load'a',a.load'c',a.load'b',a.load'r',a.
load'u',a.load'p'local ag,ah,ai,aj,ak,al,am,an,ao,ap=aa.RunService or game:
GetService'RunService',game:GetService'Players',aa.player,{},false,2,false,{}
local aq,ar,as,at,au=function()local aq=ai or ah.LocalPlayer if not aq then
return nil,nil,nil end local ar=aq.Character if not ar or not ar.Parent then
return nil,nil,nil end local as=ar:FindFirstChildOfClass'Humanoid'if as and as.
Health<=0 then return nil,nil,nil end local at=ar:FindFirstChild
'HumanoidRootPart'or ar.PrimaryPart if not at then return nil,nil,nil end return
ar,as,at end,function()if ab.DisableControls then ab.DisableControls'Dodge'end
end,function()if ab.EnableControls then ab.EnableControls'Dodge'end end,(Vector3
.zero)local av,ax,ay,az=function()if au then return end local av=ag.
PreSimulation or ag.RenderStepped or ag.Heartbeat au=av:Connect(function()if not
am then return end local aw,ax=aq()if ax then ax:Move(at,false)end end)end,
function()if au then au:Disconnect()au=nil end at=Vector3.zero end,function(av)
local aw,ax,ay=aq()if not ay or not av then at=Vector3.zero return end local az=
ay.Position local aA=Vector3.new(av.X-az.X,0,av.Z-az.Z)if aA.Magnitude>0.05 then
at=aA.Unit else at=Vector3.zero end end,function()at=Vector3.zero end local aA=
function(aA,aB)az()ax()if aA then pcall(function()aA:Move(Vector3.zero,false)end
)end as()end local aB=function()if not ak then if am or ao then ao=nil am=false
local aB,aC,aD=aq()aA(aC,aD)for aE,aF in ipairs(an)do pcall(aF,false,nil,0)end
end return end local aB,aC,aD=aq()if not aB or not aC or not aD then if am or ao
then ao=nil am=false for aE,aF in ipairs(an)do pcall(aF,false,nil,0)end end
return end if ab.IsInvulnerable and ab.IsInvulnerable()then if am or ao then ao=
nil am=false local aE,aF,aG=aq()aA(aF,aG)for aH,aI in ipairs(an)do pcall(aI,
false,nil,0)end end if ae and ae.Clear then ae.Clear()end return end if(af.
IsActiveDodgeDisabled and af.IsActiveDodgeDisabled())or(af.
IsActiveHazardScannerEnabled and not af.IsActiveHazardScannerEnabled())then if
am or ao then ao=nil am=false local aE,aF,aG=aq()aA(aF,aG)for aH,aI in ipairs(an
)do pcall(aI,false,nil,0)end end if ae and ae.Clear then ae.Clear()end return
end local aE,aF,aG,aH=ad.IsPlayerInDanger and ad.IsPlayerInDanger(),ae.
GetLastSafeSpot()if aF then ao=aF end local aI=ao and ae.IsPointSafe and ae.
IsPointSafe(ao)if ao and aI then local aJ=aD.Position local aK=Vector3.new(ao.X-
aJ.X,0,ao.Z-aJ.Z)local aL=aK.Magnitude if aL<=al then local aM,aN=aD.CFrame,
Vector3.new(ao.X,aJ.Y,ao.Z)local aO=CFrame.new(aN)*(aM-aM.Position)aB:PivotTo(aO
)aA(aC,aD)local aP=ao ao=nil if am then am=false for aQ,aR in ipairs(an)do
pcall(aR,false,aP,aL)end end else if not am then am=true ar()av()for aM,aN in
ipairs(an)do pcall(aN,true,ao,aL)end end ay(ao)end else if am or ao then ao=nil
am=false aA(aC,aD)for aJ,aK in ipairs(an)do pcall(aK,false,nil,0)end end end end
local aC=function()if not ap then ap=ag.Heartbeat:Connect(aB)end end function aj
.Clear()if am or ao then ao=nil am=false local aD,aE,aF=aq()aA(aE,aF)for aG,aH
in ipairs(an)do pcall(aH,false,nil,0)end end end function aj.Cleanup()if ap then
ap:Disconnect()ap=nil end aj.Clear()end function aj.SetEnabled(aD)ak=aD and true
or false if not ak then local aE,aF,aG=aq()aA(aF,aG)ao=nil am=false end end
function aj.IsEnabled()return ak end function aj.SetSnapDistance(aD)if type(aD)
=='number'and aD>=0.5 then al=aD end end function aj.GetSnapDistance()return al
end function aj.IsDodging()return am end function aj.OnDodgeStateChanged(aD)if
type(aD)=='function'then table.insert(an,aD)end end if ab.OnRoomIndexChanged
then ab.OnRoomIndexChanged(function()aj.Clear()end)end if ab.OnEnemyChanged then
ab.OnEnemyChanged(function()if ab.GetEnemyCount and ab.GetEnemyCount()==0 then
aj.Clear()end end)end if ab.OnLobbyChanged then ab.OnLobbyChanged(function()aj.
Clear()end)end if ab.OnBossActiveChanged then ab.OnBossActiveChanged(function()
aj.Clear()end)end aC()ac.Register(function()aj.Cleanup()end)return aj end
function a.w()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.load'b',a.load'q',a.load'j',
a.load'k',a.load'm',a.load'r',a.load'u',a.load'v',a.load'l',{}ac.BindDetection(
ab)ad.BindDetection(ab)ad.BindTrajectory(ae)ae.BindDetection(ab)ai.
BindDetection(ab)aj.IsPointInAnyHazard=ac.IsPointInAnyHazard aj.GetHazardPadding
=ac.GetHazardPadding aj.SetHazardPadding=ac.SetHazardPadding aj.GetHitboxPadding
=ac.GetHazardPadding aj.SetHitboxPadding=ac.SetHazardPadding aj.
GetTrajectoryMargin=ac.GetTrajectoryMargin aj.SetTrajectoryMargin=ac.
SetTrajectoryMargin aj.GetHazardZones=ac.GetHazardZones aj.GetNearbyHazards=ac.
GetNearbyHazards aj.AddForceCircleName=ac.AddForceCircleName aj.
GetForceCircleNames=ac.GetForceCircleNames aj.IsForceCircle=ac.IsForceCircle aj.
IsSecondBossCircleChain=ac.IsSecondBossCircleChain aj.IsPlayerInDanger=af.
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
.IsShowCandidates aj.SetFinePassEnabled=ag.SetFinePassEnabled aj.
IsFinePassEnabled=ag.IsFinePassEnabled aj.SetFallbackPassEnabled=ag.
SetFallbackPassEnabled aj.IsFallbackPassEnabled=ag.IsFallbackPassEnabled aj.
ClearSafeSpot=ag.Clear aj.SetAutoDodgeEnabled=ah.SetEnabled aj.
IsAutoDodgeEnabled=ah.IsEnabled aj.SetDodgeSnapDistance=ah.SetSnapDistance aj.
GetDodgeSnapDistance=ah.GetSnapDistance aj.IsCurrentlyDodging=ah.IsDodging aj.
OnDodgeStateChanged=ah.OnDodgeStateChanged aj.ClearDodge=ah.Clear aj.
SetVisualizerEnabled=ad.SetEnabled aj.IsVisualizerEnabled=ad.IsEnabled aj.
RefreshVisuals=ad.RefreshAll aj.SetTrajectoryEnabled=ae.SetEnabled aj.
IsTrajectoryEnabled=ae.IsEnabled aj.SetTrajectoryLength=ae.SetPredictionLength
aj.GetTrajectoryLength=ae.GetPredictionLength aj.GetHazardTrajectoryLength=ae.
GetHazardPredictionLength aj.GetCustomTrajectoryLength=ae.GetCustomLength aj.
SetCustomTrajectoryLength=ae.SetCustomLength aj.GetSecondBossBeamLength=ae.
GetSecondBossBeamLength aj.SetSecondBossBeamLength=ae.SetSecondBossBeamLength aj
.GetFirstBossBigSpikeWidth=ae.GetFirstBossBigSpikeWidth aj.
SetFirstBossBigSpikeWidth=ae.SetFirstBossBigSpikeWidth aj.
GetFirstBossSeekingSpikeWidth=ae.GetFirstBossSeekingSpikeWidth aj.
SetFirstBossSeekingSpikeWidth=ae.SetFirstBossSeekingSpikeWidth aj.
GetCustomTrajectoryWidth=ae.GetCustomWidth aj.SetCustomTrajectoryWidth=ae.
SetCustomWidth aj.RefreshTrajectory=ae.RefreshAll aj.IsPointInAnyTrajectory=ae.
IsPointInAnyTrajectory aj.GetNearbyTrajectories=ae.GetNearbyTrajectories aj.
SetSelectionBoxesEnabled=ab.SetSelectionBoxesEnabled aj.IsSelectionBoxesEnabled=
ab.IsSelectionBoxesEnabled aj.SetTimerVisualEnabled=ai.SetEnabled aj.
IsTimerVisualEnabled=ai.IsEnabled aj.RefreshTimerVisuals=ai.RefreshAll aj.
StartDetection=ab.StartScan aj.StopDetection=ab.StopScan aj.IsDetectionEnabled=
ab.IsEnabled aj.SetDetectionEnabled=ab.SetEnabled aj.SetLogHazards=ab.
SetLogHazards aj.IsLogHazardsEnabled=ab.IsLogHazardsEnabled aj.SetLogThreats=aj.
SetLogHazards aj.IsLogThreatsEnabled=aj.IsLogHazardsEnabled aj.SetLogFailed=ab.
SetLogFailed aj.IsLogFailedEnabled=ab.IsLogFailedEnabled aj.SetInspectTarget=ab.
SetInspectTarget aj.GetInspectTarget=ab.GetInspectTarget aj.SetInspectEnabled=ab
.SetInspectEnabled aj.IsInspectEnabled=ab.IsInspectEnabled aj.GetHazardCount=ab.
GetHazardCount aj.GetActiveHazards=ab.GetActiveHazards aj.GetLastHazardInfo=ab.
GetLastHazardInfo aj.OnHazardChanged=ab.OnHazardChanged aj.ClearAllHazards=ab.
ClearAllHazards aj.TriggerRoomTransition=ab.TriggerRoomTransition aj.
IsRoomTransitioning=ab.IsRoomTransitioning function aj.StartScan()ab.StartScan()
end function aj.StopScan()ab.StopScan()end function aj.Toggle(ak)if ak then aj.
StartScan()else aj.StopScan()end end function aj.IsEnabled()return ab.IsEnabled(
)end aa.Register(function()ab.StopScan()end)return aj end function a.x()local aa
,ab,ac,ad=a.load'a',a.load'c',a.load'b',a.load'h'local ae,af,ag,ah,ai,aj,ak,al,
am,an,ao,ap,aq,ar,as,at=aa.RunService or game:GetService'RunService',aa.
VirtualInputManager or game:GetService'VirtualInputManager',aa.player,{},false,
35,0.15,4,0,0,false,false,-math.huge,0 function ah.IsEnabled()return ai end
local au,av function ah.SetEnabled(ax)local ay=ax==true if ay==ai then return
end ai=ay if ai then au()else av()end end ah.IsSkillQEnabled=ah.IsEnabled ah.
SetSkillQEnabled=ah.SetEnabled ah.IsSkillEEnabled=ah.IsEnabled ah.
SetSkillEEnabled=ah.SetEnabled function ah.GetSkillERange()return aj end
function ah.SetSkillERange(ax)if type(ax)=='number'and ax>=2 then aj=ax end end
function ah.GetSpamInterval()return ak end function ah.SetSpamInterval(ax)if
type(ax)=='number'and ax>=0.05 then ak=ax end end function ah.GetBuffDuration()
return al end function ah.SetBuffDuration(ax)if type(ax)=='number'and ax>=0.5
then al=ax end end function ah.IsBuffActive()return(os.clock()-aq)<al end
function ah.TriggerBuff()aq=os.clock()end function ah.GetLastBuffTime()return aq
end function ah.GetRemainingBuffTime()local ax=al-(os.clock()-aq)return ax>0 and
ax or 0 end local ax=function()local ax=ag or game:GetService'Players'.
LocalPlayer if not ax then return nil end local ay=ax:FindFirstChild'Backpack'if
ay then for az,aA in ipairs(ay:GetChildren())do local aB=aA:FindFirstChild
'abilitySlot'if aB and string.lower(tostring(aB.Value))=='q'then return aA end
end end local az=ax.Character if az then for aA,aB in ipairs(az:GetChildren())do
if aB:IsA'Tool'then local aC=aB:FindFirstChild'abilitySlot'if aC and string.
lower(tostring(aC.Value))=='q'then return aB end end end end return nil end
local ay=function()local ay=ax()if ay then local az=ay:FindFirstChild'cooldown'
if az and typeof(az.Value)=='number'then return az.Value end end return nil end
local az,aA,aB,aC=function(az)local aA=ay()if aA~=nil then if aA>(ar+0.5)or(ar<=
0.2 and aA>0.5)then aq=az end ar=aA end end,function()if at then return end
pcall(function()local az=aa.ReplicatedStorage or game:GetService
'ReplicatedStorage'local aA=az and az:FindFirstChild'remotes'local aB=aA and aA:
FindFirstChild'abilityCast'if aB and aB:IsA'RemoteEvent'then at=aB.OnClientEvent
:Connect(function(aC,aD)local aE=ag or game:GetService'Players'.LocalPlayer if
aC==aE then local aF=ax()if(aF and aF.Name==aD)or(not aF)then aq=os.clock()end
end end)end end)end,function()if at then pcall(function()at:Disconnect()end)at=
nil end end,function()local az=ag or game:GetService'Players'.LocalPlayer local
aA=az and az.Character local aB=aA and(aA:FindFirstChild'HumanoidRootPart'or aA.
PrimaryPart)if aB and aB.Parent then return aB end return nil end local aD=
function()local aD=aC()if not aD then return nil,math.huge,false end local aE,aF
=aD.Position,ad.GetTarget and ad.GetTarget()if aF and aF.Root and aF.Root.Parent
then local aG=aF.Humanoid or(aF.Model and aF.Model:FindFirstChildOfClass
'Humanoid')if aG and aG.Health>0 then local aH=aF.Root.Position local aI=Vector3
.new(aH.X-aE.X,0,aH.Z-aE.Z).Magnitude return aF,aI,true end end local aG,aH,aI,
aJ=ab.GetTrackedEnemyData and ab.GetTrackedEnemyData(),math.huge,false if aG and
#aG>0 then for aK,aL in ipairs(aG)do if aL and aL.Root and aL.Root.Parent then
local aM=aL.Humanoid or(aL.Model and aL.Model:FindFirstChildOfClass'Humanoid')if
aM and aM.Health>0 then aI=true local aN=aL.Root.Position local aO,aP=aN.X-aE.X,
aN.Z-aE.Z local aQ=aO*aO+aP*aP if aQ<aH then aH=aQ aJ=aL end end end end end
local aK=aH<math.huge and math.sqrt(aH)or math.huge return aJ,aK,aI end function
ah.CastSkillQ()if ao then return end ao=true task.spawn(function()local aE=(ab.
GetKeyHoldTime and ab.GetKeyHoldTime())or 0.05 pcall(function()af:SendKeyEvent(
true,Enum.KeyCode.Q,false,game)end)task.wait(aE)pcall(function()af:SendKeyEvent(
false,Enum.KeyCode.Q,false,game)end)ao=false end)end function ah.CastSkillE()if
ap then return end ap=true task.spawn(function()local aE=(ab.GetKeyHoldTime and
ab.GetKeyHoldTime())or 0.05 pcall(function()af:SendKeyEvent(true,Enum.KeyCode.E,
false,game)end)task.wait(aE)pcall(function()af:SendKeyEvent(false,Enum.KeyCode.E
,false,game)end)ap=false end)end local aE=function()if not ai or ab.IsInLobby()
then return end local aE=aC()if not aE then return end local aF=aE.Parent local
aG=aF and aF:FindFirstChildOfClass'Humanoid'if aG and aG.Health<=0 then return
end local aH,aI,aJ=aD()local aK=os.clock()az(aK)if(aK-am>=ak)and not ao then if
aJ then local aL=ay()local aM=(aL==nil)or(aL<=0.2)if aM then am=aK ah.
CastSkillQ()if aL==nil and not ah.IsBuffActive()then aq=aK end end end end if(aK
-an>=ak)and not ap then if aH and aI<=aj then local aL=ah.IsBuffActive()if aL
then an=aK ah.CastSkillE()end end end end au=function()if not as then as=ae.
Heartbeat:Connect(aE)end aA()end av=function()if as then as:Disconnect()as=nil
end aB()ao=false ap=false ar=0 aq=-math.huge end function ah.Step(aF,aG,aH)end
ac.Register(function()ah.SetEnabled(false)end)return ah end function a.y()local
aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak=a.load'a',a.load'c',a.load'b',a.load'd',a.load
'f',a.load'g',a.load'h',a.load'i',a.load'w',a.load'x',a.load'p'local al,am,an,ao
,ap,aq,ar,as,at,au,av,ax,ay,az,aA,aB,aC,aD=aa.RunService,aa.player,{NO_TARGET=
'NO_TARGET',ACQUIRING_TARGET='ACQUIRING_TARGET',TRACKING_TARGET=
'TRACKING_TARGET',CHASE='CHASE',HOLD='HOLD',KITE='KITE',BLOCKED='BLOCKED',
REPATHING='REPATHING'},{},false,false,1.5,15,35,25,50,true,6,true,true,true,true
,true local aE,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ,aR,aS,aT,aU,aV,aW,aX,aY,aZ,a_
,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,b=an.NO_TARGET,'None',0,0,false,false,0,0,false,
10,false,{},function()if ab.DisableControls then ab.DisableControls'AutoFarm'end
end,function()if ab.EnableControls then ab.EnableControls'AutoFarm'end end,(
Vector3.zero)local ba,bb,bc,bd,be,bf,bg,bh,bi=function()if b then return end
local ba=al.PreSimulation or al.RenderStepped or al.Heartbeat b=ba:Connect(
function()if not aq or aO then return end if ai.IsCurrentlyDodging and ai.
IsCurrentlyDodging()then return end local bb=ab.GetHumanoid()if bb then bb:Move(
aS,false)end end)end,function()if b then b:Disconnect()b=nil end aS=Vector3.zero
end,function(ba)if ba and ba.Magnitude>0.05 then aS=Vector3.new(ba.X,0,ba.Z).
Unit else aS=Vector3.zero end end,function()aS=Vector3.zero end,function()local
ba=am and am.Character local bb=ba and ba:FindFirstChild'HumanoidRootPart'if bb
and bb.Parent then return bb end return nil end,function(ba)if not ba or not ba.
Parent then return nil end local bb,bc=pcall(function()return ba.Position end)if
not bb or not bc then return nil end return bc end,function(ba)if ab.
IsBossActive and ab.IsBossActive()then return true end if ba then if ba.Room and
type(ba.Room.Name)=='string'and string.find(string.lower(ba.Room.Name),'boss')
then return true end if ba.Model then local bb=string.lower(ba.Model.Name)if
string.find(bb,'boss')then return true end local bc=ba.Model.Parent if bc and
string.find(string.lower(bc.Name),'boss')then return true end end end return
false end,function(ba)return ak.GetActiveCombatDistances(ba)end,function(ba,bb)
if ba==bb then return true end if ba and bb and ba.Model and bb.Model and ba.
Model==bb.Model then return true end return false end local bj=function(bj,bk)
local bl=ag.GetTarget()if bi(bl,bj)then return end ag.SetTarget(bj,nil,nil,bk)aT
=nil aF='None'aU=nil aV=nil aK=0 if bj then aE=an.CHASE else aE=an.NO_TARGET end
end a9=function()if aI or not ap or not aq then return end aH+=1 local bk=aH aI=
true local bl=be()local bm=bl and bf(bl)if not bm then aI=false return end local
bn=ae.Scan()if#bn==0 then if bk==aH and ap and aq then bj(nil,nil)end aI=false
return end local bo,bp,bq,br=af.SelectBestTarget(bm,bn,function()return bk~=aH
or not ap or not aq end)if bk==aH and ap and aq then bj(bo,br)end aI=false end
local bk,bl,bm,bn=function(bk)if ab.IsInLobby()or not aJ then return end local
bl,bm=be(),ab.GetHumanoid()if not bl or not bm or bm.Health<=0 then return end
local bn=bf(bl)if not bn then return end if ai.IsCurrentlyDodging and ai.
IsCurrentlyDodging()then aS=Vector3.zero return end if aO then aS=Vector3.zero
return end local bo=os.clock()if bo-aG>=ar then aG=bo if aE~=an.HOLD and aE~=an.
KITE then a9()end end local bq=ag.GetTarget()if bq then if not ag.IsTargetValid(
)then ag.ClearTarget()aE=an.NO_TARGET aT=nil aF='None'aV=nil bd()pcall(function(
)bm.AutoRotate=true end)a9()return end end if not bq or aE==an.NO_TARGET then aT
=nil aF='None'aV=nil bd()pcall(function()bm.AutoRotate=true end)if not aI and bo
-aG>=0.5 then aG=bo a9()end return end local br=bq.Root and bf(bq.Root)if not br
then ag.ClearTarget()aE=an.NO_TARGET aV=nil bd()pcall(function()bm.AutoRotate=
true end)return end local bs,bt=bh(bq)local bu=Vector3.new(br.X-bn.X,0,br.Z-bn.Z
)local bv,bw,bx,by=bu.Magnitude,ak.GetActiveBossArea(bq)local bz,bA=false if bw
and by and bx and bx>0 then bA=Vector3.new(by.X,0,by.Z)local bB=(Vector3.new(bn.
X,0,bn.Z)-bA).Magnitude if bB>bx then bz=true end end if bz and bA and by then
local bB=Vector3.new(by.X-bn.X,0,by.Z-bn.Z)local bC,bD=bB.Magnitude>0.1 and bB.
Unit or Vector3.new(0,0,1),Vector3.new(by.X,bn.Y,by.Z)aE=an.CHASE aF=
'Enter Boss Area'aT=bD aK=0 bc(bC)return end if ax and bv<=(bt+25)then pcall(
function()bm.AutoRotate=false local bB=Vector3.new(br.X,bl.Position.Y,br.Z)if(bB
-bl.Position).Magnitude>0.5 then bl.CFrame=CFrame.lookAt(bl.Position,bB)end end)
else pcall(function()bm.AutoRotate=true end)end aj.Step(bk,bq,bv)local bB,bC,bD,
bE=ab.IsInvulnerable and ab.IsInvulnerable(),ak.IsActiveDodgeDisabled and ak.
IsActiveDodgeDisabled(bq),not(ak.IsActiveHazardScannerEnabled and not ak.
IsActiveHazardScannerEnabled(bq)),ai.IsAutoDodgeEnabled and ai.
IsAutoDodgeEnabled()local bF=not bB and not bC and bD and bE and ai and ai.
IsPointSafe if bv<bs then local bG=Vector3.new(bn.X-br.X,0,bn.Z-br.Z)local bH,bI
=bG.Magnitude>0.1 and bG.Unit or Vector3.new(0,0,1),math.clamp(bs-bv+6,4,15)
local bJ=bn+bH*bI if bA and bx then local bK=Vector3.new(bJ.X,0,bJ.Z)if(bK-bA).
Magnitude>bx then local bL=bA+(bK-bA).Unit*math.max(1,bx-2)bJ=Vector3.new(bL.X,
bn.Y,bL.Z)if(bJ-bn).Magnitude<2 then aE=an.HOLD aF='Hold (Boss Area Edge)'aT=nil
aK=0 bd()return end end end local bK=true if bF then bK=ai.IsPointSafe(bJ,0.5)
end if not bK then aE=an.HOLD aF='Hold (Danger Behind)'aT=nil aK=0 bd()else aE=
an.KITE aF='Kite'aK=0 aT=bJ bc(bH)end elseif bv<=bt then aE=an.HOLD aT=nil aF=
'Hold'aK=0 bd()else local bG,bH=bu.Magnitude>0.1 and bu.Unit or Vector3.new(0,0,
1),false if bF then local bI=Vector3.new(-bG.Z,0,bG.X)*1.2 for bJ,bK in ipairs{3
,6,10}do if bK<bv then local bL=bn+bG*bK local bM,bN=bL+bI,bL-bI if not ai.
IsPointSafe(bL,0.5)or not ai.IsPointSafe(bM,0.5)or not ai.IsPointSafe(bN,0.5)
then bH=true break end end end end if bH then aE=an.HOLD aF=
'Hold (Danger Ahead)'aT=nil aK=0 bd()else aE=an.CHASE aF='Chase'local bI=Vector3
.new(br.X,bn.Y,br.Z)aT=bI bc(bG)local bJ=br.Y-bn.Y if bJ>1.8 and bv<=8 then bm.
Jump=true end local bK=bl.AssemblyLinearVelocity or bl.Velocity local bL,bM=bK
and Vector3.new(bK.X,0,bK.Z).Magnitude or 0,(type(bk)=='number'and bk>0)and bk
or 0.016 if bL<aN then aK+=bM if aM and(bo-aL)>=0.4 then bm.Jump=true pcall(
function()bm:ChangeState(Enum.HumanoidStateType.Jumping)end)aL=bo end else aK=0
end end end end,function()if aZ and aZ.Parent then return aZ end if aZ then
pcall(function()aZ:Destroy()end)aZ=nil end aZ=Instance.new'Highlight'aZ.Name=
'TM_EnemyHighlight_Debug'aZ.FillColor=Color3.fromRGB(255,200,0)aZ.
FillTransparency=0.5 aZ.OutlineColor=Color3.fromRGB(255,0,0)aZ.
OutlineTransparency=0 aZ.Parent=aa.CoreGui or game:GetService'CoreGui'return aZ
end,function()return workspace.Terrain end,function()for bk,bl in ipairs(aP)do
pcall(function()bl:Destroy()end)end table.clear(aP)a8=nil end local bo,bq=
function()if ab.IsInLobby()then return end local bo,bq=ag.GetTarget(),be()local
br,bs=bq and bf(bq),bm()if not aB or not bo or not bo.Root then if aZ and aZ.
Parent then aZ.Enabled=false end else local bt=bl()if bo.Model and bo.Model.
Parent then bt.Adornee=bo.Model bt.Enabled=true else bt.Enabled=false end end
local bt,bu=ag.GetWaypoints(),ag.GetPathInstance()if not az or not bt or#bt==0
or not bs then bn()else local bv=tostring(bu)..'_'..tostring(#bt)if a8~=bv then
bn()for bw=2,#bt do local bx,by=bt[bw-1].Position,bt[bw].Position local bz=(by-
bx).Magnitude if bz>0.01 then local bA=Instance.new'LineHandleAdornment'bA.Name=
'TM_PathLine_Debug'bA.Adornee=bs bA.AlwaysOnTop=true bA.Length=bz bA.Thickness=2
bA.Transparency=0.3 bA.Color3=Color3.fromRGB(0,255,120)bA.ZIndex=0 bA.CFrame=
CFrame.lookAt(bx,by)bA.Parent=aa.CoreGui or game:GetService'CoreGui'aP[#aP+1]=bA
end end a8=bv end end if not aA or not aT or not br or not bs then if a_ then a_
.Visible=false end if a0 then a0.Visible=false end else local bv,bw=br+Vector3.
new(0,0.5,0),aT+Vector3.new(0,0.5,0)local bx=(bw-bv).Magnitude if bx>=0.3 then
if not a_ or not a_.Parent then a_=Instance.new'LineHandleAdornment'a_.Name=
'TM_ActualPath_Debug'a_.Adornee=bs a_.AlwaysOnTop=true a_.Thickness=3.5 a_.
Transparency=0.15 a_.Color3=Color3.fromRGB(0,230,255)a_.ZIndex=2 a_.Parent=aa.
CoreGui or game:GetService'CoreGui'end a_.Length=bx a_.CFrame=CFrame.lookAt(bv,
bw)a_.Visible=true if not a0 or not a0.Parent then a0=Instance.new
'SphereHandleAdornment'a0.Name='TM_ActualMarker_Debug'a0.Adornee=bs a0.
AlwaysOnTop=true a0.Radius=0.65 a0.Transparency=0.2 a0.Color3=Color3.fromRGB(0,
230,255)a0.ZIndex=3 a0.Parent=aa.CoreGui or game:GetService'CoreGui'end a0.
CFrame=CFrame.new(bw)a0.Visible=true else if a_ then a_.Visible=false end if a0
then a0.Visible=false end end end if not aC or not aV or not br or not bo or not
bs then if a1 then a1.Visible=false end if a2 then a2.Visible=false end else
local bv,bw,bx=aV.origin or(br+Vector3.new(0,1.5,0)),aV.directHitPos or aV.
targetPos,aV.directBlocked if bw then local by=(bw-bv).Magnitude if by>=0.2 then
if not a1 or not a1.Parent then a1=Instance.new'LineHandleAdornment'a1.Name=
'TM_BlockerRay_Debug'a1.Adornee=bs a1.AlwaysOnTop=true a1.Thickness=3 a1.
Transparency=0.2 a1.ZIndex=3 a1.Parent=aa.CoreGui or game:GetService'CoreGui'end
a1.Length=by a1.Color3=bx and Color3.fromRGB(255,30,30)or Color3.fromRGB(50,255,
50)a1.CFrame=CFrame.lookAt(bv,bw)a1.Visible=true if bx and aV.directHitPos then
if not a2 or not a2.Parent then a2=Instance.new'SphereHandleAdornment'a2.Name=
'TM_BlockerHitMarker_Debug'a2.Adornee=bs a2.AlwaysOnTop=true a2.Radius=0.5 a2.
Transparency=0.2 a2.Color3=Color3.fromRGB(255,30,30)a2.ZIndex=4 a2.Parent=aa.
CoreGui or game:GetService'CoreGui'end a2.CFrame=CFrame.new(aV.directHitPos)a2.
Visible=true else if a2 then a2.Visible=false end end else if a1 then a1.Visible
=false end if a2 then a2.Visible=false end end end end local bv=bo and bo.Root
if not aD or not bv or not bv.Parent then if a3 then a3.Visible=false end if a4
then a4.Visible=false end if a5 then a5.Visible=false end if a6 then a6.Visible=
false end else local bw=bf(bv)or bv.Position local bx=br and(br.Y-2.5)or(bw.Y-
2.5)local by=Vector3.new(bw.X,bx,bw.Z)local bz=CFrame.new(by)*CFrame.Angles(math
.rad(90),0,0)local bA,bB,bC=bv.CFrame:ToObjectSpace(bz),bh(bo)local bD=math.max(
1,bB)local bE,bF=math.max(bD+0.5,bC),0.35 if not a3 or not a3.Parent then a3=
Instance.new'CylinderHandleAdornment'a3.Name='TM_MinDistanceFill_Debug'a3.
AlwaysOnTop=true a3.ZIndex=4 a3.Parent=aa.CoreGui or game:GetService'CoreGui'end
a3.Adornee=bv a3.Height=0.02 a3.InnerRadius=0 a3.Radius=bD a3.Color3=Color3.
fromRGB(255,200,0)a3.Transparency=0.82 a3.CFrame=bA a3.Visible=true if not a4 or
not a4.Parent then a4=Instance.new'CylinderHandleAdornment'a4.Name=
'TM_MinDistanceRing_Debug'a4.AlwaysOnTop=true a4.ZIndex=5 a4.Parent=aa.CoreGui
or game:GetService'CoreGui'end a4.Adornee=bv a4.Height=0.05 a4.InnerRadius=math.
max(0.1,bD-bF)a4.Radius=bD a4.Color3=Color3.fromRGB(255,215,20)a4.Transparency=
0.25 a4.CFrame=bA a4.Visible=true if not a5 or not a5.Parent then a5=Instance.
new'CylinderHandleAdornment'a5.Name='TM_MaxDistanceFill_Debug'a5.AlwaysOnTop=
true a5.ZIndex=4 a5.Parent=aa.CoreGui or game:GetService'CoreGui'end a5.Adornee=
bv a5.Height=0.02 a5.InnerRadius=bD a5.Radius=bE a5.Color3=Color3.fromRGB(0,255,
120)a5.Transparency=0.82 a5.CFrame=bA a5.Visible=true if not a6 or not a6.Parent
then a6=Instance.new'CylinderHandleAdornment'a6.Name='TM_MaxDistanceRing_Debug'
a6.AlwaysOnTop=true a6.ZIndex=5 a6.Parent=aa.CoreGui or game:GetService'CoreGui'
end a6.Adornee=bv a6.Height=0.05 a6.InnerRadius=math.max(0.1,bE-bF)a6.Radius=bE
a6.Color3=Color3.fromRGB(0,255,120)a6.Transparency=0.25 a6.CFrame=bA a6.Visible=
true local bG,bH,bI=ak.GetActiveBossArea(bo)if bG and bI and bH and bH>0 then
local bJ=Vector3.new(bI.X,bx,bI.Z)local bK=CFrame.new(bJ)*CFrame.Angles(math.
rad(90),0,0)local bL=bv.CFrame:ToObjectSpace(bK)if not a7 or not a7.Parent then
a7=Instance.new'CylinderHandleAdornment'a7.Name='TM_BossAreaRing_Debug'a7.
AlwaysOnTop=true a7.ZIndex=5 a7.Parent=aa.CoreGui or game:GetService'CoreGui'end
a7.Adornee=bv a7.Height=0.05 a7.InnerRadius=math.max(0.1,bH-0.45)a7.Radius=bH a7
.Color3=Color3.fromRGB(0,200,255)a7.Transparency=0.3 a7.CFrame=bL a7.Visible=
true else if a7 then a7.Visible=false end end end end,function()if aZ then
pcall(function()aZ:Destroy()end)aZ=nil end if a_ then pcall(function()a_:
Destroy()end)a_=nil end if a0 then pcall(function()a0:Destroy()end)a0=nil end if
a1 then pcall(function()a1:Destroy()end)a1=nil end if a2 then pcall(function()a2
:Destroy()end)a2=nil end if a3 then pcall(function()a3:Destroy()end)a3=nil end
if a4 then pcall(function()a4:Destroy()end)a4=nil end if a5 then pcall(function(
)a5:Destroy()end)a5=nil end if a6 then pcall(function()a6:Destroy()end)a6=nil
end if a7 then pcall(function()a7:Destroy()end)a7=nil end bn()end function ao.
IsEnabled()return ap end function ao.IsRunning()return aq end function ao.
GetState()return aE end function ao.GetScanInterval()return ar end function ao.
SetScanInterval(br)if type(br)=='number'and br>0.1 then ar=br end end function
ao.GetMobMinCombatDistance()return as end function ao.SetMobMinCombatDistance(br
)if type(br)=='number'and br>=1 then as=br if as>at then at=as+5 end end end
function ao.GetMobMaxCombatDistance()return at end function ao.
SetMobMaxCombatDistance(br)if type(br)=='number'and br>=2 then at=br if as>at
then as=math.max(1,at-5)end end end function ao.GetBossMinCombatDistance()return
au end function ao.SetBossMinCombatDistance(br)if type(br)=='number'and br>=1
then au=br if au>av then av=au+5 end end end function ao.
GetBossMaxCombatDistance()return av end function ao.SetBossMaxCombatDistance(br)
if type(br)=='number'and br>=2 then av=br if au>av then au=math.max(1,av-5)end
end end function ao.GetMinCombatDistance()return as end function ao.
SetMinCombatDistance(br)ao.SetMobMinCombatDistance(br)end function ao.
GetMaxCombatDistance()return at end function ao.SetMaxCombatDistance(br)ao.
SetMobMaxCombatDistance(br)end ao.IsTargetBoss=bg function ao.
IsAutoFaceTargetEnabled()return ax end function ao.SetAutoFaceTarget(br)ax=br
and true or false if not ax then local bs=ab.GetHumanoid()if bs and bs.Parent
then pcall(function()bs.AutoRotate=true end)end end end function ao.
GetReachDistance()return maxCombatDistance end function ao.SetReachDistance(br)
if type(br)=='number'and br>=2 then ao.SetMaxCombatDistance(br)end end function
ao.GetRepathDistance()return ay end function ao.SetRepathDistance(br)if type(br)
=='number'and br>=1 then ay=br ag.SetRepathThreshold(br)end end function ao.
SetAutoJumpOnStuck(br)aM=br==true end function ao.IsAutoJumpOnStuckEnabled()
return aM end function ao.SetStuckVelocityThreshold(br)if type(br)=='number'and
br>0 then aN=br end end function ao.GetStuckVelocityThreshold()return aN end
function ao.SetPaused(br)local bs=br and true or false if bs==aO then return end
aO=bs if aO then bd()aR()local bt=ab.GetHumanoid()if bt and bt.Parent then
pcall(function()bt.AutoRotate=true if not(ai.IsCurrentlyDodging and ai.
IsCurrentlyDodging())then bt:Move(Vector3.zero,false)end end)end else if ap and
aq then aQ()end end end function ao.IsPaused()return aO end function ao.
IsAutoSkillEnabled()return aj.IsEnabled()end function ao.SetAutoSkillEnabled(br)
aj.SetEnabled(br)end ao.IsAutoSkillQEnabled=aj.IsSkillQEnabled ao.
SetAutoSkillQEnabled=aj.SetSkillQEnabled ao.IsAutoSkillEEnabled=aj.
IsSkillEEnabled ao.SetAutoSkillEEnabled=aj.SetSkillEEnabled ao.GetSkillERange=aj
.GetSkillERange ao.SetSkillERange=aj.SetSkillERange ao.GetSkillSpamInterval=aj.
GetSpamInterval ao.SetSkillSpamInterval=aj.SetSkillSpamInterval ao.
GetBuffDuration=aj.GetBuffDuration ao.SetBuffDuration=aj.SetBuffDuration ao.
IsBuffActive=aj.IsBuffActive ao.CastSkillQ=aj.CastSkillQ ao.CastSkillE=aj.
CastSkillE function ao.IsPlannedPathVisualEnabled()return az end function ao.
SetPlannedPathVisual(br)az=br==true if not az then bn()end end function ao.
IsActualPathVisualEnabled()return aA end function ao.SetActualPathVisual(br)aA=
br==true if not aA then if a_ then a_.Visible=false end if a0 then a0.Visible=
false end end end function ao.IsBlockerRayVisualEnabled()return aC end function
ao.SetBlockerRayVisual(br)aC=br==true if not aC then if a1 then a1.Visible=false
end if a2 then a2.Visible=false end end end function ao.IsTargetVisualEnabled()
return aB end function ao.SetTargetVisual(br)aB=br==true if not aB then if aZ
and aZ.Parent then aZ.Enabled=false end end end function ao.
IsCombatRangeVisualEnabled()return aD end function ao.SetCombatRangeVisual(br)aD
=br==true if not aD then if a3 then a3.Visible=false end if a4 then a4.Visible=
false end if a5 then a5.Visible=false end if a6 then a6.Visible=false end end
end function ao.GetDebugInfo()local br=be()local bs,bt,bu,bv,bw,bx=br and bf(br)
,ag.GetTarget(),'-',0,0,ag.GetWaypoints()if bt and bt.Model then bu=bt.Model.
Name or'-'local by=bf(bt.Root)if by and bs then bv=(by-bs).Magnitude bw=Vector3.
new(by.X-bs.X,0,by.Z-bs.Z).Magnitude end end local by={directBlocked=false,
blockerName='None',blockerDist=0}if aV then by.directBlocked=aV.directBlocked==
true if aV.directHitPart then by.blockerName=aV.directHitPart.Name or'Part'end
if aV.directHitPos and bs then by.blockerDist=(aV.directHitPos-bs).Magnitude end
end local bz,bA=0,0 if br then local bB=br.AssemblyLinearVelocity or br.Velocity
if bB then bz=Vector3.new(bB.X,0,bB.Z).Magnitude bA=bB.Y end end return{state=aE
,enemyName=bu,enemyDist=bv,enemyFlat=bw,hasTarget=bt~=nil,destMode=aF,nodeIndex=
aU,waypointCount=bx and#bx or 0,hasDestination=aT~=nil,blocker=by,velocity=bz,
verticalVelocity=bA,stuckTimer=aK}end function ao.Toggle(br,bs)if br==ap then
return end ap=br if ap then if not bs then ad.EnableExclusive'AutoFarm'end if aW
then aW:Disconnect()aW=nil end aQ()ba()aq=true aH=0 aI=false aG=0 ag.
SetRepathThreshold(ay)if not aX then aX=ab.OnEnemyChanged(function()if ap and aq
and aE~=an.HOLD then a9()end end)end if not aY then aY=ab.OnRespawn(function()ag
.ClearTarget()aE=an.NO_TARGET aV=nil a9()end)end if not aJ then task.spawn(
function()if ab.ReadyDungeon()then aJ=true end end)end task.defer(a9)aW=al.
Heartbeat:Connect(function(bt)local bu,bv=pcall(bk,bt)if not bu then warn((
'[AutoFarm] Error in stepMovementLoop: %s'):format(tostring(bv)))end bo()end)
else if aW then aW:Disconnect()aW=nil end bb()aR()aq=false if aX then aX()aX=nil
end if aY then aY()aY=nil end bd()local bt=ab.GetHumanoid()if bt and bt.Parent
then pcall(function()bt.AutoRotate=true if not(ai.IsCurrentlyDodging and ai.
IsCurrentlyDodging())then bt:Move(Vector3.zero,false)end end)end ag.ClearTarget(
)aE=an.NO_TARGET aT=nil aF='None'aV=nil aK=0 aH+=1 aI=false bq()end end ad.
Register('AutoFarm',ao.Toggle,ao.IsEnabled)ac.Register(function()ao.Toggle(false
)bq()end)return ao end function a.z()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.load
'b',a.load'y',a.load'w',a.load'd',a.load'e',{},false,true,false,{}local ak=
function()for ak,al in ipairs(aj)do pcall(al,ag)end end function af.IsEnabled()
return ag end function af.Toggle(al,am)local an=al==true if ag==an then if not
an then ai=false end return end ag=an if am then ai=an elseif not an then ai=
false end if an then ac.Toggle(true)ac.SetAutoDodgeEnabled(true)ad.
EnableExclusive'AutoFarm'ab.Toggle(true)ab.SetAutoSkillEnabled(true)else ab.
Toggle(false)ab.SetAutoSkillEnabled(false)ac.SetAutoDodgeEnabled(false)ac.
Toggle(false)end ak()end function af.IsAutoTriggeredByBoss()return ai end
function af.SetAutoBossCombat(al)ah=al==true end function af.
IsAutoBossCombatEnabled()return ah end function af.OnStateChanged(al)if type(al)
~='function'then return function()end end table.insert(aj,al)return function()
for am,an in ipairs(aj)do if an==al then table.remove(aj,am)break end end end
end aa.Register(function()af.Toggle(false)end)return af end function a.A()local
aa,ab,ac=a.load'a',a.load'n',a.load'o'local ad,ae,af,ag,ah,ai,aj=aa.HttpService
or game:GetService'HttpService',{},'DQMacro','pathRecord',3,'normal','full'local
ak,al,am,an,ao=function(ak)if ak==aj then return aj end return ai end,(isfile~=
nil and writefile~=nil and makefolder~=nil and isfolder~=nil),{},false,{}local
ap,aq=function()for ap=#ao,1,-1 do pcall(ao[ap])end end,function()local ap=ab.
Folder or'EsclipseHub'return ap..'/'..af end local ar,as=function()if not al
then return end pcall(function()local ar=ab.Folder or'EsclipseHub'if not
isfolder(ar)then makefolder(ar)end local as=aq()if not isfolder(as)then
makefolder(as)end end)end,function(ar)if type(ar)~='string'then return'Unknown'
end return(string.gsub(ar,'[/\\:*?"<>|]','_'))end local at,au,av,ax,ay=function(
at)return aq()..'/'..as(at)..'.json'end,function(at)if not at then return nil
end return{X=math.round(at.X*100)/100,Y=math.round(at.Y*100)/100,Z=math.round(at
.Z*100)/100}end,function(at)if not at or type(at)~='table'then return nil end
return Vector3.new(at.X or 0,at.Y or 0,at.Z or 0)end,function(at)return type(at)
=='table'and type(at.points)=='table'and#at.points>0 end,function(at)if type(at)
~='table'or type(at.X)~='number'then return nil end local au=Vector3.new(at.X,0,
at.Z)if au.Magnitude<0.001 then return nil end return au.Unit end local az,aA,aB
,aC,aD,aE=function(az)if type(az)~='table'then return nil end local aA={}for aB,
aC in ipairs(az.dwells or{})do local aD=av(aC.pos)if aD then aA[#aA+1]={pos=aD,
dur=tonumber(aC.dur)or 0,facing=ay(aC.facing)}end end local aB={}for aC,aD in
ipairs(az.skills or{})do local aE=av(aD.pos)if aE then aB[#aB+1]={pos=aE,facing=
ay(aD.facing),key=aD.key,dw=math.floor(tonumber(aD.dw)or 0),dwT=tonumber(aD.dwT)
or 0}end end if#aA==0 and#aB==0 then return nil end return{dwells=aA,skills=aB}
end,function()if an then return end an=true if al then ar()local az=aq()if
isfolder'DQMacro'and listfiles then pcall(function()local aA=listfiles'DQMacro'
if type(aA)=='table'then for aB,aC in ipairs(aA)do if type(aC)=='string'and
string.lower(string.sub(aC,-5))=='.json'and isfile(aC)then local aD=string.
match(aC,'([^/\\]+)$')or'unknown.json'local aE,aF=az..'/'..aD,readfile(aC)
writefile(aE,aF)delfile(aC)end end end end)end if listfiles and isfolder(az)then
local aA,aB=pcall(function()return listfiles(az)end)if aA and type(aB)=='table'
then for aC,aD in ipairs(aB)do if type(aD)=='string'and string.lower(string.sub(
aD,-5))=='.json'then pcall(function()if isfile(aD)then local aE=readfile(aD)
local aF=ad:JSONDecode(aE)if type(aF)=='table'and type(aF.map)=='string'and
type(aF.rooms)=='table'then am[aF.map]=aF end end end)end end end end local aA=
ab.contextData if type(aA)=='table'and type(aA[ag])=='table'then local aB,aC=aA[
ag],false for aD,aE in pairs(aB)do if type(aD)=='string'and type(aE)=='table'
then if not am[aD]then am[aD]=aE end pcall(function()writefile(at(aD),ad:
JSONEncode(aE))end)aC=true end end if aC then aA[ag]=nil ac.Save()end end else
local az=ab.contextData if type(az)=='table'and type(az[ag])=='table'then for aA
,aB in pairs(az[ag])do if type(aA)=='string'and type(aB)=='table'then am[aA]=aB
end end end end end,0.1,0.82,0.3,function(az,aA)local aB,aC=az.X-aA.X,az.Z-aA.Z
return math.sqrt(aB*aB+aC*aC)end function ae.SimplifyPath(aF,aG)local aH=#aF if
aH<=2 then return aF end local aI={}for aJ=1,aH do aI[aJ]=false end aI[1]=true
aI[aH]=true local aJ={1}for aK=2,aH-1 do local aL,aM,aN=aF[aK-1],aF[aK],aF[aK+1]
local aO,aP=aM.X-aL.X,aM.Z-aL.Z local aQ,aR,aS=math.sqrt(aO*aO+aP*aP),aN.X-aM.X,
aN.Z-aM.Z local aT=math.sqrt(aR*aR+aS*aS)if aQ>=aD and aT>=aD then local aU=(aO*
aR+aP*aS)/(aQ*aT)if aU<aC then aI[aK]=true table.insert(aJ,aK)end end end table.
insert(aJ,aH)local aK,aL=aG*aG,{}for aM=1,#aJ-1 do local aN,aO=aJ[aM],aJ[aM+1]if
aO-aN>1 then table.insert(aL,{aN,aO})end end while#aL>0 do local aM=table.
remove(aL)local aN,aO=aM[1],aM[2]local aP,aQ,aR,aS=aF[aN].X,aF[aN].Z,aF[aO].X,aF
[aO].Z local aT,aU=aR-aP,aS-aQ local aV,aW,aX=aT*aT+aU*aU,-1,0 for aY=aN+1,aO-1
do local aZ=0 if aV>0 then aZ=((aF[aY].X-aP)*aT+(aF[aY].Z-aQ)*aU)/aV aZ=math.
clamp(aZ,0,1)end local a_,a0=aF[aY].X-(aP+aT*aZ),aF[aY].Z-(aQ+aU*aZ)local a1=a_*
a_+a0*a0 if a1>aW then aW=a1 aX=aY end end if aX>0 and aW>aK then aI[aX]=true
table.insert(aL,{aN,aX})table.insert(aL,{aX,aO})end end local aM={}for aN=1,aH
do if aI[aN]and(#aM==0 or aE(aM[#aM],aF[aN])>=aB or aN==aH)then table.insert(aM,
aF[aN])end end if#aM==1 then table.insert(aM,aF[aH])end return aM end function
ae.OnChanged(aF)if type(aF)~='function'then return function()end end table.
insert(ao,aF)return function()for aG,aH in ipairs(ao)do if aH==aF then table.
remove(ao,aG)break end end end end function ae.HasMap(aF)if type(aF)~='string'or
#aF==0 then return false end aA()local aG=am[aF]if not aG or type(aG.rooms)~=
'table'then return false end for aH,aI in pairs(aG.rooms)do if ax(aI)and#aI.
points>0 then return true end end return false end function ae.GetRoomSegment(aF
,aG)if type(aF)~='string'or type(aG)~='number'then return nil end aA()local aH=
am[aF]if not aH or type(aH.rooms)~='table'then return nil end local aI=aH.rooms[
tostring(aG)]if not ax(aI)then return nil end local aJ={}for aK,aL in ipairs(aI.
points)do local aM=av(aL)if aM then aJ[#aJ+1]=aM end end if#aJ==0 then return
nil end return{startPos=av(aI.startPos)or aJ[1],points=aJ,events=aI.events and
az(aI.events)or nil,speed=tonumber(aI.speed)or 0,boss=aI.boss==true}end function
ae.HasSegmentOrMacro(aF,aG)return ae.GetRoomSegment(aF,aG)~=nil end function ae.
GetMap(aF)if not ae.HasMap(aF)then return nil end aA()local aG=am[aF]if not aG
then return nil end local aH={}for aI,aJ in pairs(aG.rooms or{})do local aK=
tonumber(aI)if aK and ax(aJ)then local aL=ae.GetRoomSegment(aF,aK)if aL then aH[
aK]=aL end end end return{map=aF,version=aG.version,rooms=aH,created=aG.created,
updated=aG.updated,mode=ak(aG.mode)}end function ae.GetMaps()aA()local aF={}for
aG,aH in pairs(am)do if type(aG)=='string'and type(aH)=='table'and aH.map==aG
and type(aH.rooms)=='table'then local aI,aJ,aK=0,0,0 for aL,aM in pairs(aH.rooms
)do if tonumber(aL)~=nil and ax(aM)then aI+=1 if aM.boss==true then aJ+=1 end aK
+=#aM.points end end if aI>0 then table.insert(aF,{map=aG,roomCount=aI,bossCount
=aJ,pointCount=aK,updated=aH.updated,mode=ak(aH.mode)})end end end table.sort(aF
,function(aG,aH)return aG.map<aH.map end)return aF end function ae.Count()return
#ae.GetMaps()end function ae.SaveSegment(aF,aG,aH,aI,aJ,aK,aL)if type(aF)~=
'string'or#aF==0 then return false end if type(aG)~='number'or aG<=0 then return
false end if not aH or not aI or#aI==0 then return false end aA()local aM=am[aF]
if not aM or type(aM)~='table'then aM={map=aF,version=ah,created=os.time(),
updated=os.time(),mode=ai,rooms={}}am[aF]=aM end if type(aM.rooms)~='table'then
aM.rooms={}end local aN={}for aO,aP in ipairs(aI)do aN[#aN+1]=au(aP)end local aO
={startPos=au(aH)or aN[1],points=aN}if aL then aO.boss=true end if type(aK)==
'number'and aK>0 then aO.speed=aK end local aP=function(aP)if not aP or type(aP)
~='table'then return nil end local aQ,aR=#(aP.dwells or{}),#(aP.skills or{})if
aQ==0 and aR==0 then return nil end local aS={dwells={},skills={}}for aT,aU in
ipairs(aP.dwells or{})do aS.dwells[#aS.dwells+1]={pos=au(aU.pos),dur=aU.dur or 0
,facing=aU.facing}end for aT,aU in ipairs(aP.skills or{})do aS.skills[#aS.skills
+1]={pos=au(aU.pos),facing=aU.facing,key=aU.key,dw=aU.dw or 0,dwT=aU.dwT or 0}
end return aS end if aJ and type(aJ)=='table'then local aQ=aP(aJ)if aQ then aO.
events=aQ end end aM.rooms[tostring(aG)]=aO aM.version=ah aM.map=aF aM.updated=
os.time()if al then ar()pcall(function()writefile(at(aF),ad:JSONEncode(aM))end)
else local aQ=ab.contextData if type(aQ)=='table'then if not aQ[ag]then aQ[ag]={
}end aQ[ag][aF]=aM ac.Save()end end ap()return true end function ae.GetMapMode(
aF)if type(aF)~='string'or#aF==0 then return ai end aA()local aG=am[aF]if type(
aG)~='table'then return ai end return ak(aG.mode)end function ae.SetMapMode(aF,
aG)if type(aF)~='string'or#aF==0 then return false end local aH=ak(aG)aA()local
aI=am[aF]if not aI or type(aI)~='table'then aI={map=aF,version=ah,created=os.
time(),updated=os.time(),mode=ai,rooms={}}am[aF]=aI end aI.mode=aH aI.map=aF aI.
updated=os.time()if al then ar()pcall(function()writefile(at(aF),ad:JSONEncode(
aI))end)else local aJ=ab.contextData if type(aJ)=='table'then if not aJ[ag]then
aJ[ag]={}end aJ[ag][aF]=aI ac.Save()end end ap()return true end function ae.
RemoveMap(aF)aA()if not am[aF]then return false end am[aF]=nil if al then local
aG=at(aF)pcall(function()if isfile(aG)then delfile(aG)end end)else local aG=ab.
contextData if type(aG)=='table'and aG[ag]then aG[ag][aF]=nil ac.Save()end end
ap()return true end function ae.ClearAll()aA()if next(am)==nil then return end
local aF=aq()if al and isfolder(aF)and listfiles then pcall(function()local aG=
listfiles(aF)if type(aG)=='table'then for aH,aI in ipairs(aG)do if type(aI)==
'string'and string.lower(string.sub(aI,-5))=='.json'and isfile(aI)then delfile(
aI)end end end end)end table.clear(am)local aG=ab.contextData if type(aG)==
'table'and aG[ag]then aG[ag]=nil ac.Save()end ap()end function ae.ReloadFromDisk
()table.clear(am)an=false aA()ap()end function ae.ReloadFromConfig()ae.
ReloadFromDisk()end return ae end function a.B()local aa,ab,ac,ad,ae=a.load'a',a
.load'c',a.load'A',a.load'o',a.load'e'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,
ar=aa.RunService,aa.player,aa.UserInputService,0.1,8000,0.4,0.1,1.5,1,6,{},true,
true function ap.SetCapture(as)as=as and true or false aq=as ar=as end function
ap.IsCaptureEnabled()return aq or ar end local as,at,au,av,ax,ay,az,aA,aB,aC,aD,
aE,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ,aR,aS,aT,aU,aV,aW=false,0,{},0,{},{},0,
false,0,0,false,false,false,0,0,0,{}local aX,aY=function()local aX={recording=as
,map=aK,room=at,pointCount=#au,dwellCount=#ax,skillCount=#ay,savedRooms=aG}for
aY,aZ in ipairs(aJ)do pcall(aZ,aX)end end,function()local aX=ag and ag.Character
local aY=aX and aX:FindFirstChild'HumanoidRootPart'if aY and aY.Parent then
return aY end return nil end local aZ,a_,a0,a1=function()local aZ=aY()if not aZ
then return nil end local a_=aZ.CFrame.LookVector if a_.Magnitude<0.001 then
return nil end return{X=a_.X/a_.Magnitude,Z=a_.Z/a_.Magnitude}end,function()if
aM then aM:Disconnect()aM=nil end if aN then aN:Disconnect()aN=nil end if aO
then aO()aO=nil end if aP then aP()aP=nil end if aQ then aQ()aQ=nil end if
respawnConnection then respawnConnection()respawnConnection=nil end end,function
(aZ)au={aZ}ax={}ay={}aR=nil az=0 aS=nil aT=nil aU=nil aV=aZ aB=0 aC=0 av=os.
clock()aW=os.clock()aA=false end,function()aK=nil at=0 aL=nil au={}ax={}ay={}aR=
nil az=0 aS=nil aT=nil aU=nil aV=nil aA=false aB=0 aC=0 aW=nil aE=false aF=false
aD=false aG=0 aH=0 aI=0 end local a2,a3=function(a2,a3)at=a2 aL=a3 aF=true a0(a3
)aE=ab.IsBossActive()end,function(a2,a3)if not aF then return nil end local a4=
ac.SimplifyPath(au,ak)if#a4<2 then return nil end local a5 if#ax>0 or#ay>0 then
a5={dwells=ax,skills=ay}end local a6=0 if aC>0.5 and aB>5 then a6=math.clamp(aB/
aC,5,100)end local a7=ac.SaveSegment(aK,at,aL,a4,a5,a6,aE)if not a7 then return
nil end aG+=1 aI+=#au if aE then aH+=1 end if not a3 then local a8=''if a5 then
a8=(
' (%d \u{111}i\u{1ec3}m m\u{1ecb}n, %d skill, %d nh\u{1ecb}p d\u{1eeb}ng, %.1fspd)'
):format(#a4,#(a5.skills or{}),#(a5.dwells or{}),a6)else a8=(
' (%d \u{111}i\u{1ec3}m m\u{1ecb}n, %.1fspd)'):format(#a4,a6)end ae.Notify(
'Path Record',('\u{110}\u{e3} l\u{1b0}u room %d%s v\u{e0}o map [%s] %s'):format(
at,a8,aK,a2 and('- '..a2)or''),3)end return{points=a4,events=a5,speed=a6}end
function ap.IsRecording()return as end function ap.GetStartRoom()return at end
function ap.GetCurrentPoints()return au end function ap.GetCurrentDwells()return
ax end function ap.GetCurrentSkills()return ay end function ap.GetStatus()return
{recording=as,map=aK,room=at,pointCount=#au,dwellCount=#ax,skillCount=#ay,
savedRooms=aG}end function ap.OnStatusChanged(a4)if type(a4)~='function'then
return function()end end table.insert(aJ,a4)return function()for a5,a6 in
ipairs(aJ)do if a6==a4 then table.remove(aJ,a5)break end end end end function ap
.Start()if as then return false,'already recording'end local a4=aY()if not a4
then return false,'no character found'end if ab.IsDead()then return false,
'character is dead'end local a5=ab.GetCurrentRoomIndex()if a5<=0 then return
false,'not inside a dungeon'end local a6=ab.GetCurrentDungeonName()if not a6 or#
a6==0 then return false,'unable to identify map'end aD=ac.GetMapMode(a6)=='full'
if ab.IsBossActive()and not aD then return false,
'boss room (use Hazard Scanner)'end aK=a6 a2(a5,a4.Position)as=true ad.
SetRecording(true)aG=0 aH=0 aI=0 aM=af.Heartbeat:Connect(function()if not as
then return end if ab.IsDead()then aS=nil aR=nil aV=nil ap.Stop
't\u{1eed} tr\u{1ead}n'return end local a7=aY()if not a7 then return end local
a8,a9=a7.Position,au[#au]if a9 and(a8-a9).Magnitude>35 then if not aD then ap.
Stop'large teleport'return end a3('large teleport',true)local b=ab.
GetCurrentRoomIndex()if b==at then b=0 end a2(b,a8)aX()task.spawn(function()task
.wait(ao)if as and at<=0 then ap.Stop'end of map'end end)return end local b,ba=
os.clock(),aV and(a8-aV).Magnitude or 0 aV=a8 local bb=aW and math.max(0.0001,b-
aW)or 0.016 aW=b local bc=bb>0 and(ba/bb)or 0 if bc>=am then aB+=ba aC+=bb aS=
nil aR=nil else if aq then if not aS then aS=b aT=a8 aU=aZ()end if aR then aR.
dur=b-aS aR.facing=aZ()or aU elseif b-aS>=al then az=aS-av aR={pos=aT,dur=b-aS,
facing=aU,index=#ax+1}table.insert(ax,aR)for bd,be in ipairs(ay)do if be.dw==0
and be._castAt and be._castAt>=aS then be.dw=aR.index be.dwT=math.max(0,(be.
_castAt-av)-az)be.pos=aR.pos aR.facing=be.facing or aR.facing end end end end
end local bd=au[#au]if bd and(a8-bd).Magnitude<ai then return end if#au>=aj then
ap.Stop'reached max points'return end table.insert(au,a8)end)if ar then aN=ah.
InputBegan:Connect(function(a7,a8)if not as or not ar then return end if ah:
GetFocusedTextBox()then return end if ab.IsDead()then return end local a9 if a7.
UserInputType==Enum.UserInputType.MouseButton2 then if a8 then return end a9=
'QE'elseif a7.UserInputType==Enum.UserInputType.Keyboard and(a7.KeyCode==Enum.
KeyCode.Q or a7.KeyCode==Enum.KeyCode.E)then a9=a7.KeyCode==Enum.KeyCode.Q and
'Q'or'E'else return end local b=aY()if not b then return end local ba=aq and(aR
~=nil)local bb={pos=ba and aR.pos or b.Position,facing=aZ(),key=a9,dw=0,dwT=0,
_castAt=os.clock()}if ba then bb.dw=aR.index bb.dwT=math.max(0,(os.clock()-av)-
az)aR.facing=bb.facing or aR.facing end table.insert(ay,bb)end)end aO=ab.
OnRoomIndexChanged(function()if as then local a7=ab.GetCurrentRoomIndex()if aF
and at<=0 and a7>0 then at=a7 return end if a7~=at and not aA then aA=true task.
delay(an,function()aA=false if as then if aD then ap.Rollover()else ap.Stop
'room completed'end end end)end end end)aQ=ab.OnBossActiveChanged(function(a7)if
not as then return end if a7 then if aD then aE=true else ap.Stop
'entered boss room'end return end if aD and aE then a3('boss defeated',true)aE=
false aF=false task.spawn(function()task.wait(ao)if as and not aF then ap.Stop
'end of map'end end)end end)aP=ab.OnLobbyChanged(function(a7)if as and a7 then
ap.Stop'returned to lobby'end end)respawnConnection=ab.OnRespawn(function()if as
then ap.Stop'player died'end end)ae.Notify('Path Record',(
'B\u{1eaf}t \u{111}\u{1ea7}u record room %d (%s)'):format(a5,a6),2)aX()return
true end function ap.Rollover()if not as then return false end a3(
'chuy\u{1ec3}n room',true)local a4=aY()local a5=a4 and a4.Position or aL a2(ab.
GetCurrentRoomIndex(),a5)aX()return true end function ap.Stop(a4)if not as then
return false end as=false ad.SetRecording(false)a_()local a5=a3(a4,true)if a5
then if aG>1 then local a6=aH>0 and(' | %d boss'):format(aH)or''ae.Notify(
'Path Record',(
'\u{110}\u{e3} l\u{1b0}u map [%s] %s: %d room%s (%d \u{111}i\u{1ec3}m g\u{1ed1}c)'
):format(aK,a4 or'xong',aG,a6,aI),4)else local a6=''if a5.events then a6=(
' (%d \u{111}i\u{1ec3}m m\u{1ecb}n, %d skill, %d nh\u{1ecb}p d\u{1eeb}ng, %.1fspd)'
):format(#a5.points,#(a5.events.skills or{}),#(a5.events.dwells or{}),a5.speed
or 0)else a6=(' (%d \u{111}i\u{1ec3}m m\u{1ecb}n, %.1fspd)'):format(#a5.points,
a5.speed or 0)end local a7=at>0 and(aE and' (boss)'or'')or''ae.Notify(
'Path Record',('\u{110}\u{e3} l\u{1b0}u room %d%s%s v\u{e0}o map [%s] %s'):
format(at,a6,a7,aK,a4 and('- '..a4)or''),3)end elseif aG>0 then local a6=aH>0
and(' | %d boss'):format(aH)or''ae.Notify('Path Record',(
'\u{110}\u{e3} l\u{1b0}u map [%s] %s: %d room%s (%d \u{111}i\u{1ec3}m g\u{1ed1}c)'
):format(aK,a4 or'xong',aG,a6,aI),4)end a1()aX()return a5~=nil end function ap.
Cancel()if not as then return end a_()a1()as=false ad.SetRecording(false)aX()end
return ap end function a.C()local aa,ab,ac,ad=a.load'a',a.load'c',a.load'A',a.
load'e'local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,ax,ay,az,aA,
aB,aC,aD,aE,aF=aa.player,aa.VirtualInputManager,aa.UserInputService,aa.
RunService or game:GetService'RunService',0.4,0.5,8,2,4.5,8,14,8,2,0.5,2,0.001,
0.1,{},true,true,true,0.6,0.005,0.45,0.2,false,true function av.SetAimSkillQ(aG)
aE=aG and true or false end function av.IsAimSkillQEnabled()return aE end
function av.SetAimSkillE(aG)aF=aG and true or false end function av.
IsAimSkillEEnabled()return aF end local aG=function(aG)if aG=='Q'then return aE
elseif aG=='E'then return aF end return aE or aF end function av.
SetStartPauseTime(aH)if type(aH)=='number'then aD=math.clamp(aH,0,5)end end
function av.GetStartPauseTime()return aD end function av.SetPreAimTime(aH)if
type(aH)=='number'then aC=math.clamp(aH,0.1,1.5)end end function av.
GetPreAimTime()return aC end function av.SetSkillFaceHold(aH)if type(aH)==
'number'then aA=math.clamp(aH,ar,as)end end function av.GetSkillFaceHold()return
aA end function av.SetDoubleClickDelay(aH)if type(aH)=='number'then aB=math.
clamp(aH,at,au)end end function av.GetDoubleClickDelay()return aB end function
av.SetReplayTimeline(aH)aH=aH and true or false ax=aH ay=aH az=aH end function
av.IsReplayTimelineEnabled()return ax end local aH,aI,aJ,aK=true,false function
av.SetSpeedMatch(aL)aH=aL and true or false end function av.IsSpeedMatchEnabled(
)return aH end function av.SetUseFastSpeed(aL)aI=aL and true or false end
function av.IsUseFastSpeedEnabled()return aI end local aL,aM,aN,aO,aP,aQ,aR,aS,
aT,aU,aV=function(aL)local aM if aI then local aN=ab.GetFastSpeed()if type(aN)==
'number'and aN>0 then aM=aN end elseif aH then if type(aL)=='number'and aL>0
then aM=aL end end if not aM or aM<=0 then return end local aN=ab.GetHumanoid()
if not aN then return end if aJ==nil then aK=aN.WalkSpeed end aJ=aM if aN.
WalkSpeed~=aM then aN.WalkSpeed=aM end end,function()if aJ==nil then return end
local aL=ab.GetHumanoid()if aK and aL and aL.WalkSpeed~=aK then aL.WalkSpeed=aK
end aJ=nil aK=nil end,false,false,false,0,0,0,{}local aW,aX,aY,aZ,a_=function(aW
)local aX={playing=aN,map=aU,room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(
),resume=aO,progressPercent=aS,progressStuds=aQ,totalStuds=aR,reason=aW}for aY,
aZ in ipairs(aT)do pcall(aZ,aX)end end,function()local aW=ae and ae.Character
local aX=aW and aW:FindFirstChild'HumanoidRootPart'if aX and aX.Parent then
return aX end return nil end,function(aW)if not aW or not aW.Parent then return
nil end local aX,aY=pcall(function()return aW.Position end)if not aX or not aY
then return nil end return aY end,function(aW,aX)local aY,aZ=aW.X-aX.X,aW.Z-aX.Z
return math.sqrt(aY*aY+aZ*aZ)end local a0=function()if a_ then return a_ end
pcall(function()local a0=ae:FindFirstChild'PlayerScripts'local a1=a0 and a0:
FindFirstChild'PlayerModule'if a1 then a_=require(a1):GetControls()end end)
return a_ end local a1,a2,a3,a4=function()if ab.DisableControls then ab.
DisableControls'PathRecord'else local a1=a0()if a1 and type(a1.Disable)==
'function'then pcall(function()a1:Disable()end)end end end,function()if ab.
EnableControls then ab.EnableControls'PathRecord'else local a1=a0()if a1 and
type(a1.Enable)=='function'then pcall(function()a1:Enable()end)end end end,(
Vector3.zero)local a5,a6,a7,a8=function()if a4 then return end local a5=ah.
PreSimulation or ah.Heartbeat or ah.RenderStepped a4=a5:Connect(function()if not
aN then return end local a6=ab.GetHumanoid()if a6 then a6:Move(a3,false)end end)
end,function()if a4 then a4:Disconnect()a4=nil end a3=Vector3.zero local a5=ab.
GetHumanoid()if a5 then pcall(function()a5:Move(Vector3.zero,false)end)end end,
function(a5)local a6=aX()if not a6 or not a5 then a3=Vector3.zero return end
local a7=a6.Position local a8=Vector3.new(a5.X-a7.X,0,a5.Z-a7.Z)if a8.Magnitude>
0.05 then a3=a8.Unit else a3=Vector3.zero end end,function()a3=Vector3.zero
local a5=ab.GetHumanoid()if a5 then pcall(function()a5:Move(Vector3.zero,false)
end)end end local a9,b,ba,bb,bc=function(a9)a8()a6()a2()end,function(a9)local b,
ba=ab.GetKeyHoldTime()or 0.05,aB task.spawn(function()pcall(function()local bb=
function(bb,bc)af:SendKeyEvent(bc,bb,false,game)end local bc=function(bc)if bc==
'Q'then bb(Enum.KeyCode.Q,true)task.wait(b)bb(Enum.KeyCode.Q,false)elseif bc==
'E'then bb(Enum.KeyCode.E,true)task.wait(b)bb(Enum.KeyCode.E,false)else bb(Enum.
KeyCode.Q,true)bb(Enum.KeyCode.E,true)task.wait(b)bb(Enum.KeyCode.Q,false)bb(
Enum.KeyCode.E,false)end end bc(a9)if ba>0 then task.wait(ba)end bc(a9)end)end)
end,function(a9,b)if not a9 or not a9.Parent then return end local ba=ab.
GetHumanoid()if ba then ba.AutoRotate=false end local bb=b or Vector3.new(1,0,0)
if bb.Magnitude<0.1 then bb=Vector3.new(1,0,0)end bb=Vector3.new(bb.X,0,bb.Z).
Unit pcall(function()local bc=a9.Position a9.CFrame=CFrame.lookAt(bc,bc+bb)end)
end,function(a9,b,ba)if not a9 or not a9.Parent then return end local bb=ab.
GetHumanoid()if bb and bb.AutoRotate~=false then bb.AutoRotate=false end local
bc=b or Vector3.new(1,0,0)if bc.Magnitude<0.1 then bc=Vector3.new(1,0,0)end bc=
Vector3.new(bc.X,0,bc.Z).Unit pcall(function()local bd=a9.Position local be=
CFrame.lookAt(bd,bd+bc)a9.CFrame=a9.CFrame:Lerp(be,math.clamp(ba or 0.35,0.05,1)
)end)end,function()local a9=ab.GetHumanoid()if a9 then a9.AutoRotate=true end
end local bd=function(bd,be,bf)local bg,bh=ab.GetHumanoid(),aX()if not bg or not
bh then return end aL(bd.speed)local bi=ac.SimplifyPath(bd.points,ai)local bj=#
bi if bj<2 then return end local bk,bl=0,{}bl[1]=0 for bm=2,bj do local bn=aZ(bi
[bm-1],bi[bm])bk+=bn bl[bm]=bk end aQ=0 aR=bk aS=0 aW'progress_init'local bm,bn=
function(bm,bn,bo)bn=bn or 0 bo=bo or bk local bq,br=0,math.huge for bs=2,bj do
if bl[bs]<bn then continue end if bl[bs-1]>bo then continue end local bt,bu=bi[
bs-1],bi[bs]local bv,bw=bt.X,bt.Z local bx,by=bu.X-bv,bu.Z-bw local bz,bA=bx*bx+
by*by,0 if bz>0 then bA=((bm.X-bv)*bx+(bm.Z-bw)*by)/bz bA=math.clamp(bA,0,1)end
local bB,bC=bm.X-(bv+bx*bA),bm.Z-(bw+by*bA)local bD=bB*bB+bC*bC if bD<br then br
=bD bq=bl[bs-1]+math.sqrt(bz)*bA end end return bq end,function(bm)local bn=2
while bn<=bj and bl[bn]<bm do bn+=1 end bn=math.min(bn,bj)local bo=bl[bn]-bl[bn-
1]if bo<=0 then return bi[bn]end local bq,br,bs=math.clamp((bm-bl[bn-1])/bo,0,1)
,bi[bn-1],bi[bn]return Vector3.new(br.X+(bs.X-br.X)*bq,br.Y+(bs.Y-br.Y)*bq,br.Z+
(bs.Z-br.Z)*bq)end local bo,bq,br=function(bo)local bq=bk-bo if bq<=1 then
return math.max(0.2,bq)end local br,bs=math.min(bo+2,bk),math.min(bo+4.5,bk)if
bs-bo<0.8 then return math.min(al,bq)end local bt,bu,bv=bn(bo),bn(br),bn(bs)
local bw,bx,by,bz=bu.X-bt.X,bu.Z-bt.Z,bv.X-bu.X,bv.Z-bu.Z local bA,bB=math.sqrt(
bw*bw+bx*bx),math.sqrt(by*by+bz*bz)if bA>0.1 and bB>0.1 then local bC=math.
clamp((bw*by+bx*bz)/(bA*bB),-1,1)local bD=math.clamp((bC+0.2)/1.2,0,1)local bE=
al+(am-al)*bD return math.min(bE,bq)end return math.min(am,bq)end,{},{}if bd.
events and(ax or ay or az)then local bs,bt=bd.events.dwells or{},bd.events.
skills or{}for bu,bv in ipairs(bs)do local bw,bx=bm(bv.pos),bv.dur or 0 if bw<=
0.8 or bw>=bk-0.8 then bx=aD end bq[bu]={arc=bw,dur=bx,facing=bv.facing,skills={
},pos=bv.pos}end if aD>0 and(#bq==0 or bq[1].arc>0.8)then table.insert(bq,1,{arc
=0,dur=aD,facing=bd.events and bd.events.startFacing or nil,skills={},pos=bd.
startPos or bi[1]})end for bu,bv in ipairs(bt)do local bw=(ax and bv.dw>0 and bq
[bv.dw])and bq[bv.dw]or nil if bw then table.insert(bw.skills,{tOff=bv.dwT or 0,
facing=bv.facing,key=bv.key})else table.insert(br,{arc=bm(bv.pos),facing=bv.
facing,key=bv.key})end end table.sort(br,function(bu,bv)return bu.arc<bv.arc end
)end local bs,bt,bu=function(bs)if not aN or(bs.dur or 0)<=0 then return true
end if ax then a8()if az and bs.facing then ba(bh,bs.facing)end local bt,bu,bv=
os.clock(),{},0 while aN and(os.clock()-bt<bs.dur)do if not bh or not bh.Parent
then return false,'no_root'end if ab.IsDead()then return false,'dead'end if ab.
GetCurrentRoomIndex()~=be then return false,'room_changed'end if ab.
IsBossActive()and not bf then return false,'boss'end a8()local bw=os.clock()-bt
for bx,by in ipairs(bs.skills or{})do if not bu[bx]and bw>=(by.tOff or 0)then bu
[bx]=true if az and by.facing and aG(by.key)then ba(bh,by.facing)bv=os.clock()+
aA end if ay then b(by.key or'QE')end end end task.wait(0.03)end for bw,bx in
ipairs(bs.skills or{})do if not bu[bw]then bu[bw]=true if az and bx.facing and
aG(bx.key)then ba(bh,bx.facing)bv=os.clock()+aA end if ay then b(bx.key or'QE')
end end end while aN and os.clock()<bv do a8()task.wait(0.03)end if az then bc()
end end return true end,bd.startPos or bi[1],aY(bh)if bu and bt then local bv=
aZ(bu,bt)if bv>1.8 then local bw=os.clock()+ak while aN and os.clock()<bw do
local bx=aY(bh)if not bx then break end local by=aZ(bx,bt)if by<=1.8 then break
end if ab.IsDead()or ab.GetCurrentRoomIndex()~=be then break end a7(bt)task.
wait(0.03)end a8()end local bw=aY(bh)if bw and aZ(bw,bt)<=3 then pcall(function(
)local bx=bh.CFrame.Rotation bh.CFrame=CFrame.new(bt.X,bh.Position.Y,bt.Z)*bx bh
.AssemblyLinearVelocity=Vector3.zero bh.AssemblyAngularVelocity=Vector3.zero end
)end end local bv,bw,bx,by,bz,bA,bB=0,bt or aY(bh),os.clock(),1,1,0 a5()while aN
do if not bh or not bh.Parent then bc()return false,'no_root'end if ab.IsDead()
then bc()return false,'dead'end if ab.GetCurrentRoomIndex()~=be then bc()return
false,'room_changed'end if ab.IsBossActive()and not bf then bc()return false,
'boss'end local bC=aY(bh)if not bC then task.wait(0.08)continue end local bD=bm(
bC,math.max(0,bv-an),math.min(bk,bv+ao))if bD>bv then bv=bD end aQ=bv aS=bk>0
and math.clamp(math.floor((bv/bk)*100),0,100)or 0 if bw then if aZ(bC,bw)>0.02
then bx=os.clock()end end bw=bC if os.clock()-bx>ap then bv=math.min(bv+aq,bk-aj
)bx=os.clock()bw=bC end while bz<=#br and br[bz].arc<=bv do local bE=br[bz]if az
and bE.facing and aG(bE.key)then ba(bh,bE.facing)bB=bE.facing bA=os.clock()+aA
end if ay then b(bE.key or'QE')end bz+=1 end while by<=#bq and bv>=bq[by].arc do
local bE=bq[by]local bF,bG=bs(bE)if not bF then a8()bc()return false,bG end by+=
1 bw=aY(bh)bx=os.clock()end local bE if az then local bF,bG=math.huge,by while
bG<=#bq do local bH,bI=(bq[bG])if bH.skills and#bH.skills>0 then for bJ,bK in
ipairs(bH.skills)do if bK.facing and aG(bK.key)then bI=bK.facing break end end
end bI=bI or bH.facing if bI then if bH.arc<bF then bF=bH.arc bE=bI end break
end bG+=1 end local bH=bz while bH<=#br do local bI=br[bH]if bI.facing and aG(bI
.key)then if bI.arc<bF then bF=bI.arc bE=bI.facing end break end bH+=1 end end
if az then if os.clock()<bA then if bB then bb(bh,bB,0.45)end if bg.AutoRotate~=
false then bg.AutoRotate=false end elseif bE then bb(bh,bE,0.35)if bg.AutoRotate
~=false then bg.AutoRotate=false end else if bg.AutoRotate~=true then bg.
AutoRotate=true end end else if bg.AutoRotate~=true then bg.AutoRotate=true end
end if bv>=bk-aj then while by<=#bq do local bF=bq[by]local bG,bH=bs(bF)if not
bG then a8()bc()return false,bH end by+=1 end while bz<=#br do local bF=br[bz]if
az and bF.facing and aG(bF.key)then ba(bh,bF.facing)bB=bF.facing bA=os.clock()+
aA end if ay then b(bF.key or'QE')end bz+=1 end local bF=os.clock()+5 while aN
do local bG=aY(bh)if not bG then break end local bH=aZ(bG,bi[bj])if bH<=aj then
break end if ab.GetCurrentRoomIndex()~=be then a8()bc()return false,
'room_changed'end if(ab.IsBossActive()and not bf)or ab.IsDead()then a8()bc()
return false,'dead'end if os.clock()>=bF then break end a7(bi[bj])if os.clock()<
bA then if bB then bb(bh,bB,0.45)end if bg.AutoRotate~=false then bg.AutoRotate=
false end elseif bg.AutoRotate~=true then bg.AutoRotate=true end task.wait(0.03)
end a8()bc()aQ=bk aS=100 return true,'completed'end local bF=bo(bv)local bG=bn(
math.min(bv+bF,bk-0.01))a7(bG)task.wait(0.03)end a8()bc()return false,'stopped'
end local be=function()local be,bf,bg=0,false,false while aN do if aO then break
end if ab.IsDead()then bg=true task.wait(0.25)continue end if bg then bg=false
end if ab.IsInLobby()then aO=false aN=false break end if ab.IsBossActive()and
not aP then task.wait(0.25)continue end local bh=ab.GetCurrentRoomIndex()if bh<=
0 then task.wait(0.1)continue end if bh~=be then be=bh bf=false aQ=0 aR=0 aS=0
end local bi=ac.GetRoomSegment(aU,bh)if not bi then task.wait(0.1)continue end
if bf then task.wait(0.1)continue end local bj,bk=bd(bi,bh,aP)bc()if bj then bf=
true aQ=aR aS=100 else if bk=='dead'then ad.Notify('Path Record',
'T\u{1eed} tr\u{1ead}n: \u{110}ang ch\u{1edd} h\u{1ed3}i sinh \u{111}\u{1ec3} \u{111}i l\u{1ea1}i...'
,2)while aN and ab.IsDead()do task.wait(0.2)end task.wait(0.6)end end end a6()
a2()aM()bc()aV=nil aW()end function av.IsPlaying()return aN end function av.
ResumeWanted()return aO end function av.GetActiveMap()return aU end function av.
IsBossPlayActive()return aP end function av.GetStatus()return{playing=aN,map=aU,
room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(),resume=aO,progressPercent=
aS,progressStuds=aQ,totalStuds=aR}end function av.OnStatusChanged(bf)if type(bf)
~='function'then return function()end end table.insert(aT,bf)return function()
for bg,bh in ipairs(aT)do if bh==bf then table.remove(aT,bg)break end end end
end function av.Start()if aN then return false,'\u{111}ang ph\u{e1}t r\u{1ed3}i'
end if ab.IsInLobby()then return false,'\u{111}ang \u{1edf} lobby'end local bf=
ab.GetCurrentRoomIndex()if bf<=0 then return false,'ch\u{1b0}a c\u{f3} room'end
local bg=ab.GetCurrentDungeonName()if not bg or#bg==0 then return false,
'kh\u{f4}ng x\u{e1}c \u{111}\u{1ecb}nh \u{111}\u{1b0}\u{1ee3}c map'end if not ac
.HasSegmentOrMacro(bg,bf)then return false,(
'map [%s] ch\u{1b0}a c\u{f3} segment room %d'):format(bg,bf)end local bh=ac.
GetMapMode(bg)=='full'if ab.IsBossActive()and(not bh or not ac.
HasSegmentOrMacro(bg,bf))then return false,
'boss room (h\u{e3}y d\u{f9}ng Hazard Scanner)'end aU=bg aP=bh aO=false aQ=0 aR=
0 aS=0 aN=true a1()a5()aV=task.spawn(be)aW'started'return true end function av.
Stop()aN=false aO=false aU=nil aP=false aQ=0 aR=0 aS=0 if aV then task.cancel(aV
)aV=nil end a9(ab.GetHumanoid())aM()bc()aW'stopped'end function av.
PauseForExclusive()if not aN then return end aO=true aN=false aP=false aQ=0 aR=0
aS=0 if aV then task.cancel(aV)aV=nil end a9(ab.GetHumanoid())aM()bc()ad.Notify(
'Path Record',
[[Yielded control: will auto-resume upon entering a recorded room]],3)aW'paused'
end return av end function a.D()local aa,ab,ac,ad,ae,af,ag=a.load'a',a.load'c',a
.load'A',a.load'B',a.load'C',a.load'b',game:GetService'Workspace'local ah,ai,aj,
ak,al,am,an,ao,ap,aq,ar,as,at,au,av,ax,ay,az,aA,aB,aC,aD,aE=aa.RunService,{},
'PR_PathVisual_Container','PR_PathVisual_Anchor',Color3.fromRGB(255,60,60),
Color3.fromRGB(255,90,90),Color3.fromRGB(0,255,120),Color3.fromRGB(0,220,110),
Color3.fromRGB(0,230,255),Color3.fromRGB(255,80,180),Color3.fromRGB(255,190,30),
Color3.fromRGB(200,70,255),Color3.fromRGB(220,100,255),Color3.fromRGB(255,210,60
),0.35,0.55,2.5,3,0.35,true,true,true,true local aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,
aP=av,true,0,{},{},{},{},{}local aQ,aR,aS,aT,aU,aV,aW,aX=function()if aN and aN.
Parent and aO and aO.Parent then return aO end ai.Clear()local aQ=Instance.new
'Folder'aQ.Name=aj aQ.Parent=ag local aR=Instance.new'Part'aR.Name=ak aR.
Anchored=true aR.CanCollide=false aR.CanQuery=false aR.CanTouch=false aR.
Transparency=1 aR.Size=Vector3.new(1,1,1)aR.CFrame=CFrame.new(0,0,0)aR.Parent=aQ
aN=aQ aO=aR table.clear(aI)table.clear(aJ)table.clear(aK)table.clear(aL)table.
clear(aM)return aO end,function(aQ,aR)local aS=aI[aQ]if not aS or not aS.Parent
then aS=Instance.new'SphereHandleAdornment'aS.Name='PR_NodeSphere_'..tostring(aQ
)aS.Adornee=aR aS.AlwaysOnTop=aG aS.ZIndex=5 aS.Transparency=0.2 aS.Parent=aR aI
[aQ]=aS end return aS end,function(aQ,aR)local aS=aJ[aQ]if not aS or not aS.
Parent then aS=Instance.new'LineHandleAdornment'aS.Name='PR_PathLine_'..
tostring(aQ)aS.Adornee=aR aS.AlwaysOnTop=aG aS.ZIndex=4 aS.Transparency=0.3 aS.
Thickness=ay aS.Parent=aR aJ[aQ]=aS end return aS end,function(aQ,aR)local aS=aK
[aQ]if not aS or not aS.Parent then aS=Instance.new'SphereHandleAdornment'aS.
Name='PR_EventSphere_'..tostring(aQ)aS.Adornee=aR aS.AlwaysOnTop=aG aS.ZIndex=8
aS.Transparency=0.15 aS.Radius=ax aS.Parent=aR aK[aQ]=aS end return aS end,
function(aQ,aR)local aS=aL[aQ]if not aS or not aS.Parent then aS=Instance.new
'LineHandleAdornment'aS.Name='PR_FacingRay_'..tostring(aQ)aS.Adornee=aR aS.
AlwaysOnTop=aG aS.ZIndex=9 aS.Transparency=0.1 aS.Thickness=az aS.Parent=aR aL[
aQ]=aS end return aS end,function(aQ,aR)local aS=aM[aQ]if not aS or not aS.
billboard or not aS.billboard.Parent then local aT=Instance.new'Attachment'aT.
Name='PR_BadgeAtt_'..tostring(aQ)aT.Parent=aR local aU=Instance.new
'BillboardGui'aU.Name='PR_BadgeGui_'..tostring(aQ)aU.Adornee=aT aU.Size=UDim2.
new(0,115,0,24)aU.StudsOffset=Vector3.new(0,1.6,0)aU.AlwaysOnTop=true aU.
MaxDistance=180 aU.LightInfluence=0 aU.Parent=aN local aV=Instance.new'Frame'aV.
Name='BadgeFrame'aV.Size=UDim2.new(1,0,1,0)aV.BackgroundColor3=Color3.fromRGB(15
,15,20)aV.BackgroundTransparency=0.25 aV.BorderSizePixel=0 aV.Parent=aU local aW
=Instance.new'UICorner'aW.CornerRadius=UDim.new(0,6)aW.Parent=aV local aX=
Instance.new'UIStroke'aX.Name='Stroke'aX.Color=as aX.Thickness=1.4 aX.
Transparency=0.15 aX.Parent=aV local aY=Instance.new'TextLabel'aY.Name='Text'aY.
Size=UDim2.new(1,-6,1,0)aY.Position=UDim2.new(0,3,0,0)aY.BackgroundTransparency=
1 aY.Font=Enum.Font.GothamBold aY.TextSize=11 aY.TextColor3=Color3.fromRGB(255,
255,255)aY.RichText=true aY.Text=''aY.TextXAlignment=Enum.TextXAlignment.Center
aY.TextYAlignment=Enum.TextYAlignment.Center aY.Parent=aV aS={attachment=aT,
billboard=aU,frame=aV,stroke=aX,label=aY}aM[aQ]=aS end return aS end,function(aQ
)if not aQ then return nil end if typeof(aQ)=='Vector3'then if aQ.Magnitude>
0.001 then return aQ.Unit end return nil end if type(aQ)=='table'and type(aQ.X)
=='number'and type(aQ.Z)=='number'then local aR=Vector3.new(aQ.X,0,aQ.Z)if aR.
Magnitude>0.001 then return aR.Unit end end return nil end,function()for aQ,aR
in ipairs(aI)do if aR and aR.Parent then aR.Visible=false end end for aQ,aR in
ipairs(aJ)do if aR and aR.Parent then aR.Visible=false end end for aQ,aR in
ipairs(aK)do if aR and aR.Parent then aR.Visible=false end end for aQ,aR in
ipairs(aL)do if aR and aR.Parent then aR.Visible=false end end for aQ,aR in
ipairs(aM)do if aR and aR.billboard and aR.billboard.Parent then aR.billboard.
Enabled=false end end end function ai.Update()if not aB then aX()return end if
ab.IsInLobby()then aX()return end local aY,aZ,a_,a0=ad.IsRecording(),{},{},{}if
aY then local a1=ad.GetCurrentPoints()if a1 and#a1>0 then table.insert(aZ,a1)end
local a2=ad.GetCurrentDwells and ad.GetCurrentDwells()if a2 then a_=a2 end local
a3=ad.GetCurrentSkills and ad.GetCurrentSkills()if a3 then a0=a3 end else local
a1,a2=ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex()if a1 and#a1>0 and a2>0
then local a3=ac.GetRoomSegment(a1,a2)if a3 then if a3.points and#a3.points>0
then table.insert(aZ,a3.points)end if a3.events then a_=a3.events.dwells or{}a0=
a3.events.skills or{}end end end end if#aZ==0 then aX()return end local a1=aQ()
if not a1 then return end local a2,a3,a4,a5,a6,a7,a8,a9,b=aY and al or an,aY and
am or ao,0,0,0,0,0 for ba,bb in ipairs(aZ)do local bc=#bb if bc>0 then if not a9
then a9=bb[1]end b=bb[bc]for bd=1,bc do local be=bb[bd]if be then a4+=1 local bf
=aR(a4,a1)bf.Radius=aF bf.Color3=a2 bf.AlwaysOnTop=aG bf.CFrame=CFrame.new(be+
Vector3.new(0,aA,0))bf.Visible=true end end if aC and bc>=2 then for bd=1,bc-1
do local be,bf=bb[bd],bb[bd+1]if be and bf then local bg,bh=be+Vector3.new(0,aA,
0),bf+Vector3.new(0,aA,0)local bi=(bh-bg).Magnitude if bi>0.05 then a5+=1 local
bj=aS(a5,a1)bj.Length=bi bj.Thickness=ay bj.Color3=a3 bj.AlwaysOnTop=aG bj.
CFrame=CFrame.lookAt(bg,bh)bj.Visible=true end end end end end end if aD then
local ba if a9 then for bb,bc in ipairs(a_)do if bc.pos and(bc.pos-a9).Magnitude
<1.5 then ba=bc break end end a6+=1 local bb=aT(a6,a1)bb.Radius=ax bb.Color3=ap
bb.AlwaysOnTop=aG bb.CFrame=CFrame.new(a9+Vector3.new(0,aA,0))bb.Visible=true a8
+=1 local bc=aV(a8,a1)bc.attachment.WorldPosition=a9+Vector3.new(0,aA,0)bc.
stroke.Color=ap local bd=ae and ae.GetStartPauseTime and ae.GetStartPauseTime()
or 0 if bd>0 then bc.label.Text=(
"<font color='rgb(0,240,255)'><b>\u{1f6a9} START (%.1fs)</b></font>"):format(bd)
else bc.label.Text="<font color='rgb(0,240,255)'><b>\u{1f6a9} START</b></font>"
end bc.billboard.Enabled=true if aE and ba and ba.facing then local be=aW(ba.
facing)if be then a7+=1 local bf,bg=aU(a7,a1),a9+Vector3.new(0,aA,0)local bh=bg+
be*3.5 bf.Length=3.5 bf.Color3=ap bf.AlwaysOnTop=aG bf.CFrame=CFrame.lookAt(bg,
bh)bf.Visible=true end end end for bb,bc in ipairs(a_)do local bd=bc.pos local
be,bf=a9 and(bd-a9).Magnitude<1.5,b and(bd-b).Magnitude<1.5 if bd and not be and
not bf then a6+=1 local bg=aT(a6,a1)bg.Radius=ax bg.Color3=ar bg.AlwaysOnTop=aG
bg.CFrame=CFrame.new(bd+Vector3.new(0,aA,0))bg.Visible=true local bh=math.round(
(bc.dur or 0)*10)/10 a8+=1 local bi=aV(a8,a1)bi.attachment.WorldPosition=bd+
Vector3.new(0,aA,0)bi.stroke.Color=ar bi.label.Text=(
"<font color='rgb(255,200,60)'><b>\u{23f3} Pause (%.1fs)</b></font>"):format(bh)
bi.billboard.Enabled=true if aE then local bj=aW(bc.facing)if bj then a7+=1
local bk,bl=aU(a7,a1),bd+Vector3.new(0,aA,0)local bm=bl+bj*3 bk.Length=3 bk.
Color3=au bk.AlwaysOnTop=aG bk.CFrame=CFrame.lookAt(bl,bm)bk.Visible=true end
end end end for bb,bc in ipairs(a0)do local bd=bc.pos if bd then a6+=1 local be=
aT(a6,a1)be.Radius=ax be.Color3=as be.AlwaysOnTop=aG be.CFrame=CFrame.new(bd+
Vector3.new(0,aA,0))be.Visible=true local bf=(bc.key and#bc.key>0)and bc.key or
'QE'a8+=1 local bg=aV(a8,a1)bg.attachment.WorldPosition=bd+Vector3.new(0,aA,0)bg
.stroke.Color=as bg.label.Text=(
"<font color='rgb(220,100,255)'><b>\u{26a1} Skill [%s]</b></font>"):format(bf)bg
.billboard.Enabled=true if aE then local bh=aW(bc.facing)if bh then a7+=1 local
bi,bj=aU(a7,a1),bd+Vector3.new(0,aA,0)local bk=bj+bh*3.8 bi.Length=3.8 bi.Color3
=at bi.AlwaysOnTop=aG bi.CFrame=CFrame.lookAt(bj,bk)bi.Visible=true end end end
end local bb if b and b~=a9 and not aY then for bc,bd in ipairs(a_)do if bd.pos
and(bd.pos-b).Magnitude<1.5 then bb=bd break end end a6+=1 local bc=aT(a6,a1)bc.
Radius=ax bc.Color3=aq bc.AlwaysOnTop=aG bc.CFrame=CFrame.new(b+Vector3.new(0,aA
,0))bc.Visible=true a8+=1 local bd=aV(a8,a1)bd.attachment.WorldPosition=b+
Vector3.new(0,aA,0)bd.stroke.Color=aq local be=ae and ae.GetStartPauseTime and
ae.GetStartPauseTime()or 0 if bb and be>0 then bd.label.Text=(
"<font color='rgb(255,100,200)'><b>\u{1f3c1} FINISH (%.1fs)</b></font>"):format(
be)else bd.label.Text=
"<font color='rgb(255,100,200)'><b>\u{1f3c1} FINISH</b></font>"end bd.billboard.
Enabled=true if aE and bb and bb.facing then local bf=aW(bb.facing)if bf then a7
+=1 local bg,bh=aU(a7,a1),b+Vector3.new(0,aA,0)local bi=bh+bf*3.5 bg.Length=3.5
bg.Color3=aq bg.AlwaysOnTop=aG bg.CFrame=CFrame.lookAt(bh,bi)bg.Visible=true end
end end end for ba=a4+1,#aI do local bb=aI[ba]if bb and bb.Parent then bb.
Visible=false end end for ba=a5+1,#aJ do local bb=aJ[ba]if bb and bb.Parent then
bb.Visible=false end end for ba=a6+1,#aK do local bb=aK[ba]if bb and bb.Parent
then bb.Visible=false end end for ba=a7+1,#aL do local bb=aL[ba]if bb and bb.
Parent then bb.Visible=false end end for ba=a8+1,#aM do local bb=aM[ba]if bb and
bb.billboard and bb.billboard.Parent then bb.billboard.Enabled=false end end end
local aY=function()if aP then return end aP=ah.Heartbeat:Connect(function()local
aY,aZ=os.clock(),ad.IsRecording()local a_=aZ and 0.03 or 0.1 if aY-aH<a_ then
return end aH=aY pcall(ai.Update)end)end function ai.SetEnabled(aZ)aB=aZ and
true or false if not aB then aX()else pcall(ai.Update)end end function ai.
IsEnabled()return aB end function ai.SetShowLines(aZ)aC=aZ and true or false if
not aC then for a_,a0 in ipairs(aJ)do if a0 and a0.Parent then a0.Visible=false
end end else pcall(ai.Update)end end function ai.IsShowLinesEnabled()return aC
end function ai.SetShowEvents(aZ)aD=aZ and true or false if not aD then for a_,
a0 in ipairs(aK)do if a0 and a0.Parent then a0.Visible=false end end for a_,a0
in ipairs(aM)do if a0 and a0.billboard and a0.billboard.Parent then a0.billboard
.Enabled=false end end else pcall(ai.Update)end end function ai.
IsShowEventsEnabled()return aD end function ai.SetShowFacingRays(aZ)aE=aZ and
true or false if not aE then for a_,a0 in ipairs(aL)do if a0 and a0.Parent then
a0.Visible=false end end else pcall(ai.Update)end end function ai.
IsShowFacingRaysEnabled()return aE end function ai.SetNodeRadius(aZ)if type(aZ)
=='number'then aF=math.clamp(aZ,0.1,1.5)pcall(ai.Update)end end function ai.
GetNodeRadius()return aF end function ai.SetAlwaysOnTop(aZ)aG=aZ and true or
false for a_,a0 in ipairs(aI)do if a0 and a0.Parent then a0.AlwaysOnTop=aG end
end for a_,a0 in ipairs(aJ)do if a0 and a0.Parent then a0.AlwaysOnTop=aG end end
for a_,a0 in ipairs(aK)do if a0 and a0.Parent then a0.AlwaysOnTop=aG end end for
a_,a0 in ipairs(aL)do if a0 and a0.Parent then a0.AlwaysOnTop=aG end end for a_,
a0 in ipairs(aM)do if a0 and a0.billboard and a0.billboard.Parent then a0.
billboard.AlwaysOnTop=aG end end end function ai.IsAlwaysOnTopEnabled()return aG
end function ai.Clear()aX()table.clear(aI)table.clear(aJ)table.clear(aK)table.
clear(aL)table.clear(aM)local aZ=ag:FindFirstChild(aj)if aZ then pcall(function(
)aZ:Destroy()end)end aN=nil aO=nil end function ai.Destroy()if aP then aP:
Disconnect()aP=nil end ai.Clear()end ai.Clear()aY()af.Register(function()ai.
Destroy()end)return ai end function a.E()local aa,ab,ac=a.load'a',a.load'c',a.
load'b'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,ax,ay,az,
aA=aa.player,aa.RunService,aa.CoreGui or game:GetService'CoreGui',game:
GetService'Workspace',{},{Cyan=Color3.fromRGB(0,230,255),Red=Color3.fromRGB(255,
60,60),Orange=Color3.fromRGB(255,140,0),Yellow=Color3.fromRGB(255,220,40),Green=
Color3.fromRGB(0,255,120),Emerald=Color3.fromRGB(40,220,160),Blue=Color3.
fromRGB(0,140,255),Purple=Color3.fromRGB(180,80,255),Magenta=Color3.fromRGB(255,
60,200),White=Color3.fromRGB(255,255,255)},false,25,0.4,true,true,'Cyan','Red',
0.8,0.15,'PR_InRange_Highlight',0.2,0,{}local aB,aC,aD,aE=function()return ai[ao
]or ai.Cyan end,function()return ai[ap]or ai.Red end,function()local aB=ad and
ad.Character if not aB or not aB.Parent then return nil end local aC=aB:
FindFirstChildOfClass'Humanoid'if aC and aC.Health<=0 then return nil end local
aD=aB:FindFirstChild'HumanoidRootPart'if aD and aD.Parent then return aD end
return nil end,function()for aB,aC in pairs(av)do pcall(function()aC:Destroy()
end)end table.clear(av)pcall(function()for aB,aC in ipairs(ag:GetDescendants())
do if aC.Name==as then pcall(function()aC:Destroy()end)end end end)end local aF,
aG=function()if ax then pcall(function()ax:Destroy()end)ax=nil end if ay then
pcall(function()ay:Destroy()end)ay=nil end aA=nil aE()end,function()if not ax or
not ax.Parent then pcall(function()if ax then ax:Destroy()end end)ax=Instance.
new'CylinderHandleAdornment'ax.Name='PR_SkillRangeRing'ax.AlwaysOnTop=true ax.
ZIndex=5 ax.Parent=af end if am then if not ay or not ay.Parent then pcall(
function()if ay then ay:Destroy()end end)ay=Instance.new
'CylinderHandleAdornment'ay.Name='PR_SkillRangeFill'ay.AlwaysOnTop=true ay.
ZIndex=4 ay.Parent=af end else if ay then pcall(function()ay:Destroy()end)ay=nil
end end end local aH,aI=function(aH)if not aj then aF()return end aG()local aI,
aJ=2.6,aB()local aK=Vector3.new(aH.Position.X,aH.Position.Y-aI,aH.Position.Z)
local aL=CFrame.new(aK)*CFrame.Angles(math.rad(90),0,0)local aM=aH.CFrame:
ToObjectSpace(aL)if ax then ax.Adornee=aH ax.Height=0.06 ax.Radius=ak ax.
InnerRadius=math.max(0.1,ak-al)ax.Color3=aJ ax.Transparency=1-aq ax.CFrame=aM ax
.Visible=(aH~=nil and aH.Parent~=nil)end if ay and am then ay.Adornee=aH ay.
Height=0.02 ay.Radius=ak ay.InnerRadius=0 ay.Color3=aJ ay.Transparency=1-ar ay.
CFrame=aM ay.Visible=(aH~=nil and aH.Parent~=nil)end end,function(aH)if not aj
or not an or not aH then if next(av)~=nil then aE()end return end local aI,aJ,aK
,aL,aM=ab.GetTrackedEnemyData(),aH.Position,ak*ak,{},aC()for aN,aO in ipairs(aI)
do local aP,aQ,aR=aO.Model,aO.Root,aO.Humanoid if aP and aP.Parent and aQ and aQ
.Parent and aR and aR.Health>0 then local aS,aT=aQ.Position.X-aJ.X,aQ.Position.Z
-aJ.Z if(aS*aS+aT*aT)<=aK then aL[aP]=true end end end for aN,aO in pairs(av)do
if not aL[aN]or not aN.Parent then pcall(function()aO:Destroy()end)av[aN]=nil
end end for aN in pairs(aL)do if not av[aN]or not av[aN].Parent then local aO=aN
:FindFirstChild(as)local aP=(aO and aO:IsA'Highlight')and aO or Instance.new
'Highlight'aP.Name=as aP.Adornee=aN aP.FillColor=aM aP.FillTransparency=0.35 aP.
OutlineColor=Color3.fromRGB(255,255,255)aP.OutlineTransparency=0.1 aP.DepthMode=
Enum.HighlightDepthMode.AlwaysOnTop aP.Parent=aN av[aN]=aP else local aO=av[aN]
if aO.FillColor~=aM then aO.FillColor=aM end if not aO.Enabled then aO.Enabled=
true end end end end local aJ=function()if not aj then return end local aJ=aD()
if not aJ then if ax then ax.Visible=false end if ay then ay.Visible=false end
if next(av)~=nil then aE()end aA=nil return end local aK=2.6 local aL=Vector3.
new(aJ.Position.X,aJ.Position.Y-aK,aJ.Position.Z)local aM=CFrame.new(aL)*CFrame.
Angles(math.rad(90),0,0)local aN=aJ.CFrame:ToObjectSpace(aM)if not ax or not ax.
Parent or aJ~=aA then aA=aJ aH(aJ)else if ax.Adornee~=aJ then ax.Adornee=aJ end
ax.CFrame=aN if not ax.Visible then ax.Visible=true end if am then if not ay or
not ay.Parent then aH(aJ)else if ay.Adornee~=aJ then ay.Adornee=aJ end ay.CFrame
=aN if not ay.Visible then ay.Visible=true end end elseif ay and ay.Visible then
ay.Visible=false end end local aO=os.clock()if aO-au>=at then au=aO aI(aJ)end
end function ah.SetEnabled(aK)aj=aK and true or false if aj then local aL=aD()if
aL then aH(aL)aA=aL aI(aL)end if not az then az=ae.Heartbeat:Connect(aJ)end else
aF()if az then az:Disconnect()az=nil end aA=nil end end function ah.IsEnabled()
return aj end function ah.SetRadius(aK)if type(aK)=='number'then ak=math.clamp(
aK,5,150)local aL=aD()if aj and aL then aH(aL)aI(aL)end end end function ah.
GetRadius()return ak end function ah.SetFillEnabled(aK)am=aK and true or false
local aL=aD()if aj and aL then aH(aL)end end function ah.IsFillEnabled()return
am end function ah.SetHighlightInRange(aK)an=aK and true or false if not an then
aE()else local aL=aD()if aj and aL then aI(aL)end end end function ah.
IsHighlightInRangeEnabled()return an end function ah.GetColorNames()local aK={
'Cyan','Red','Orange','Yellow','Green','Emerald','Blue','Purple','Magenta',
'White'}return aK end function ah.GetSelectedCircleColor()return ao end function
ah.SetCircleColor(aK)if type(aK)=='string'and ai[aK]then ao=aK local aL=aD()if
aj and aL then aH(aL)end end end function ah.GetSelectedHighlightColor()return
ap end function ah.SetHighlightColor(aK)if type(aK)=='string'and ai[aK]then ap=
aK local aL=aD()if aj and aL then aI(aL)end end end if ad then ad.CharacterAdded
:Connect(function(aK)if aj then task.spawn(function()local aL=aK:WaitForChild(
'HumanoidRootPart',10)if aL and aj then aH(aL)aA=aL aI(aL)end end)end end)end ab
.OnRespawn(function()if aj then task.delay(0.2,function()local aK=aD()if aK and
aj then aH(aK)aA=aK aI(aK)end end)end end)ac.Register(function()ah.SetEnabled(
false)aF()end)return ah end end local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an=
a.load'a',a.load'c',a.load'b',a.load'd',a.load'e',a.load'z',a.load'A',a.load'B',
a.load'C',a.load'D',a.load'E',{},false,{}local ao,ap,aq=function(ao)local ap=ah.
GetStatus()local aq={recording=ah.IsRecording(),playing=ai.IsPlaying(),resume=ai
.ResumeWanted(),autoPlayWanted=am,inLobby=ab.IsInLobby(),map=ab.
GetCurrentDungeonName(),room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(),
recordedMaps=ag.Count(),pointCount=ah.IsRecording()and ap.pointCount or 0,reason
=ao}for ar,as in ipairs(an)do pcall(as,aq)end end,true,true function al.
IsTimelineCaptureEnabled()return ap end function al.SetTimelineCapture(ar)ap=ar
and true or false ah.SetCapture(ap)ao'timeline'end function al.
IsTimelineReplayEnabled()return aq end function al.SetTimelineReplay(ar)aq=ar
and true or false ai.SetReplayTimeline(aq)ao'timeline'end function al.
IsSpeedMatchEnabled()return ai.IsSpeedMatchEnabled()end function al.
SetSpeedMatch(ar)ai.SetSpeedMatch(ar and true or false)ao'speedmatch'end
function al.IsUseFastSpeedEnabled()return ai.IsUseFastSpeedEnabled()end function
al.SetUseFastSpeed(ar)ai.SetUseFastSpeed(ar and true or false)ao'usefastspeed'
end function al.GetPreAimTime()return ai.GetPreAimTime()end function al.
SetPreAimTime(ar)ai.SetPreAimTime(ar)ao'preaim'end function al.GetSkillFaceHold(
)return ai.GetSkillFaceHold()end function al.SetSkillFaceHold(ar)ai.
SetSkillFaceHold(ar)ao'facehold'end function al.GetDoubleClickDelay()return ai.
GetDoubleClickDelay()end function al.SetDoubleClickDelay(ar)ai.
SetDoubleClickDelay(ar)ao'doubleclick'end function al.GetStartPauseTime()return
ai.GetStartPauseTime()end function al.SetStartPauseTime(ar)ai.SetStartPauseTime(
ar)ao'startpause'end function al.IsAimSkillQEnabled()return ai.
IsAimSkillQEnabled()end function al.SetAimSkillQ(ar)ai.SetAimSkillQ(ar and true
or false)ao'aimskillq'end function al.IsAimSkillEEnabled()return ai.
IsAimSkillEEnabled()end function al.SetAimSkillE(ar)ai.SetAimSkillE(ar and true
or false)ao'aimskille'end function al.ToggleRecord(ar)if ar then if ah.
IsRecording()then return true end if ai.IsPlaying()then ai.Stop()end local as,at
=ah.Start()if not as then ae.Notify('Path Record','Failed to start record: '..
tostring(at),3)end ao()return as else local as=ah.IsRecording()ah.Stop()ao()
return as end end function al.IsRecording()return ah.IsRecording()end function
al.CurrentRoomHasRecord()return ag.HasSegmentOrMacro(ab.GetCurrentDungeonName(),
ab.GetCurrentRoomIndex())end function al.GetMapMode(ar)return ag.GetMapMode(ar)
end function al.SetMapMode(ar,as)if ag.SetMapMode(ar,as)then ao'mode'end end
function al.IsAutoPlayWanted()return am end function al.TogglePlay(ar)am=ar and
true or false if am then if ai.IsPlaying()then ao'already_playing'return true
end if ah.IsRecording()then ah.Stop()end if ab.IsInLobby()then ao'armed_lobby'
return true end local as,at=ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex()
if not as or#as==0 or at<=0 then ao'armed_waiting'return true end if ab.
IsBossActive()and ag.GetMapMode(as)~='full'then ao'armed_boss'return true end if
ag.HasSegmentOrMacro(as,at)then ad.EnableExclusive'PathRecord'ai.Start()end ao
'play_started'return true else local as=ai.IsPlaying()ai.Stop()ao'play_stopped'
return as end end function al.IsPlaying()return ai.IsPlaying()end function al.
IsEnabled()return ai.IsPlaying()end function al.SetRangeVisual(ar)ak.SetEnabled(
ar)ao'rangevisual'end function al.IsRangeVisualEnabled()return ak.IsEnabled()end
function al.SetRangeVisualRadius(ar)ak.SetRadius(ar)ao'rangeradius'end function
al.GetRangeVisualRadius()return ak.GetRadius()end function al.SetRangeVisualFill
(ar)ak.SetFillEnabled(ar)ao'rangefill'end function al.IsRangeVisualFillEnabled()
return ak.IsFillEnabled()end function al.SetHighlightInRange(ar)ak.
SetHighlightInRange(ar)ao'rangehighlight'end function al.
IsHighlightInRangeEnabled()return ak.IsHighlightInRangeEnabled()end function al.
GetRangeColorNames()return ak.GetColorNames()end function al.
GetSelectedCircleColor()return ak.GetSelectedCircleColor()end function al.
SetCircleColor(ar)ak.SetCircleColor(ar)ao'circlecolor'end function al.
GetSelectedHighlightColor()return ak.GetSelectedHighlightColor()end function al.
SetHighlightColor(ar)ak.SetHighlightColor(ar)ao'highlightcolor'end function al.
SetVisualEnabled(ar)aj.SetEnabled(ar)ao'visual'end function al.IsVisualEnabled()
return aj.IsEnabled()end function al.SetVisualShowLines(ar)aj.SetShowLines(ar)ao
'visuallines'end function al.IsVisualShowLinesEnabled()return aj.
IsShowLinesEnabled()end function al.SetVisualNodeRadius(ar)aj.SetNodeRadius(ar)
ao'visualradius'end function al.GetVisualNodeRadius()return aj.GetNodeRadius()
end function al.SetVisualAlwaysOnTop(ar)aj.SetAlwaysOnTop(ar)ao'visualontop'end
function al.IsVisualAlwaysOnTopEnabled()return aj.IsAlwaysOnTopEnabled()end
function al.SetVisualShowEvents(ar)aj.SetShowEvents(ar)ao'visualevents'end
function al.IsVisualShowEventsEnabled()return aj.IsShowEventsEnabled()end
function al.SetVisualShowFacing(ar)aj.SetShowFacingRays(ar)ao'visualfacing'end
function al.IsVisualShowFacingEnabled()return aj.IsShowFacingRaysEnabled()end
function al.GetMaps()return ag.GetMaps()end function al.GetMacro(ar)return ag.
GetMap(ar)end function al.RemoveMap(ar)ag.RemoveMap(ar)ao'removed'end function
al.ClearAll()ag.ClearAll()ao'cleared'end function al.ReloadFromDisk()ag.
ReloadFromDisk()ao'reloaded'end function al.GetStatus()local ar,as=ah.GetStatus(
),ai.GetStatus()return{recording=ah.IsRecording(),playing=ai.IsPlaying(),resume=
ai.ResumeWanted(),autoPlayWanted=am,inLobby=ab.IsInLobby(),map=ab.
GetCurrentDungeonName(),room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(),
recordedMaps=ag.Count(),pointCount=ar.pointCount,dwellCount=ar.dwellCount or 0,
skillCount=ar.skillCount or 0,progressPercent=as.progressPercent or 0,
progressStuds=as.progressStuds or 0,totalStuds=as.totalStuds or 0}end function
al.OnStatusChanged(ar)if type(ar)~='function'then return function()end end table
.insert(an,ar)return function()for as,at in ipairs(an)do if at==ar then table.
remove(an,as)break end end end end bossConnection=ab.OnBossActiveChanged(
function(ar)local as=ai.GetActiveMap()or ab.GetCurrentDungeonName()local at=as
and ag.GetMapMode(as)=='full'if ar then if at then if ai.ResumeWanted()or am
then local au=ab.GetCurrentRoomIndex()if au>0 and ag.HasSegmentOrMacro(as,au)
then ad.EnableExclusive'PathRecord'ai.Start()ao'boss'end elseif ai.IsPlaying()
then ad.EnableExclusive'PathRecord'end return end if ai.IsPlaying()or ai.
ResumeWanted()or am then ai.PauseForExclusive()if af.IsAutoBossCombatEnabled()
then af.Toggle(true,true)ae.Notify('Path Record',
[[Boss Room: Combat Master enabled (Auto Farm + Dodge + Skill)]],3)else ae.
Notify('Path Record','Boss Room: Paused, using Hazard Scanner',3)end ao'boss'end
else if not at then if af.IsAutoTriggeredByBoss()then af.Toggle(false)ae.Notify(
'Path Record','Boss Defeated: Combat Master disabled',3)end if am or ai.
ResumeWanted()then task.delay(0.5,function()if not am and not ai.ResumeWanted()
then return end if ai.IsPlaying()or ah.IsRecording()then return end local au,av=
ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex()if au and av>0 and ag.
HasSegmentOrMacro(au,av)then ad.EnableExclusive'PathRecord'ai.Start()ao'resumed'
end end)end end end end)storageUnsub=ag.OnChanged(function()ao'storage'end)
roomUnsub=ab.OnRoomIndexChanged(function()if not am and not ai.ResumeWanted()
then return end local ar=ab.GetCurrentRoomIndex()if ar<=0 or ab.IsInLobby()or ab
.IsDead()then return end local as=ab.GetCurrentDungeonName()if not as or#as==0
then return end if ai.GetActiveMap()and ai.GetActiveMap()~=as then return end if
ab.IsBossActive()and ag.GetMapMode(as)~='full'then return end if af.
IsAutoTriggeredByBoss()and not ab.IsBossActive()then af.Toggle(false)end if not
ag.HasSegmentOrMacro(as,ar)then return end if not ai.IsPlaying()then ad.
EnableExclusive'PathRecord'ai.Start()ao'resumed'end end)mapUnsub=ab.
OnDungeonNameChanged(function(ar)if af.IsAutoTriggeredByBoss()then af.Toggle(
false)end if ah.IsRecording()then ah.Stop'map change'end if ai.IsPlaying()or ai.
ResumeWanted()then local as=ai.GetActiveMap()if as and as~=ar then ai.Stop()end
end if am and ar and#ar>0 then task.delay(0.3,function()if not am or ai.
IsPlaying()or ah.IsRecording()then return end local as=ab.GetCurrentRoomIndex()
if as>0 and ag.HasSegmentOrMacro(ar,as)then if not(ab.IsBossActive()and ag.
GetMapMode(ar)~='full')then ad.EnableExclusive'PathRecord'ai.Start()ao
'map_autoplay'end end end)end ao'map'end)ah.SetCapture(ap)ai.SetReplayTimeline(
aq)ad.Register('PathRecord',function(ar)if not ar then ai.PauseForExclusive()end
ao'disabled'end,al.IsEnabled)task.delay(1,function()if am and not ai.IsPlaying()
and not ah.IsRecording()then local ar=ab.GetCurrentDungeonName()if ar and#ar>0
and not ab.IsInLobby()then if ag.HasSegmentOrMacro(ar,ab.GetCurrentRoomIndex())
then al.TogglePlay(true)end end end end)ac.Register(function()ai.Stop()ah.
Cancel()aj.Clear()if bossConnection then bossConnection()bossConnection=nil end
if roomUnsub then roomUnsub()roomUnsub=nil end if mapUnsub then mapUnsub()
mapUnsub=nil end if storageUnsub then storageUnsub()storageUnsub=nil end end)
return al