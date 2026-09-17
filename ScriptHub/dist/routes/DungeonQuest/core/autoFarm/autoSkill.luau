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
end u={}y=0 x={}h.ResetBossIndex()dungeon=nil end L=function()for ac,_ in pairs(
u)do if not ac or not ac.Parent then X(ac)else local ad=_.Humanoid or ac:
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
return'Boss'..tostring(aj)end function h.ResetBossIndex()local aj=n p=0 n=false
Q=nil for ak=#q,1,-1 do pcall(q[ak],p)end if aj then for ak=#o,1,-1 do pcall(o[
ak],false)end end O()end function h.OnBossIndexChanged(aj)if type(aj)~=
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
pcall(function()ar:Enable()end)end N()end)return h end function a.d()local aa={}
function aa.SelectBestTarget(ab,ac,ad)local ae,af,ag=(math.huge)for ah,ai in
ipairs(ac)do if ad and ad()then return nil,nil,nil,nil,math.huge end local aj=ai
.Root if aj and aj.Parent then local ak=aj.Position local al,am=ak.X-ab.X,ak.Z-
ab.Z local an=al*al+am*am if an<ae then ae=an af=ai ag=ak end end end local ah=
ae<math.huge and math.sqrt(ae)or math.huge return af,nil,nil,ag,ah end return aa
end function a.e()local aa,ab=a.load'a',a.load'c'local ac,ad=aa.player,{}
function ad.Validate(ae)if not ae then return false end local af=ae.Model if not
af or not af.Parent or af==ac.Character then return false end local ag=ae.
Humanoid if not ag or not ag.Parent then ag=af:FindFirstChildOfClass'Humanoid'ae
.Humanoid=ag end if not ag or ag.Health<=0 then return false end local ah=ae.
Root if not ah or not ah.Parent then ah=af:FindFirstChild'HumanoidRootPart'or af
.PrimaryPart if not ah then for ai,aj in ipairs(af:GetDescendants())do if aj:IsA
'BasePart'then ah=aj break end end end if not ah then return false end ae.Root=
ah end return true end function ad.Scan()local ae,af={},ab.GetTrackedEnemyData()
for ag,ah in ipairs(af)do if ad.Validate(ah)then table.insert(ae,ah)end end if#
ae==0 and ab.ForceRescan then ab.ForceRescan()af=ab.GetTrackedEnemyData()for ag,
ah in ipairs(af)do if ad.Validate(ah)then table.insert(ae,ah)end end end return
ae end return ad end function a.f()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'd',a.
load'e',{},{},1,6 function ac.GetTarget()return ag end function ac.
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
ac end end local aa,ab,ac,ad=a.load'a',a.load'c',a.load'b',a.load'f'local ae,af,
ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,b,c=aa.RunService or game:GetService
'RunService',aa.VirtualInputManager or game:GetService'VirtualInputManager',aa.
player,{},false,35,0.15,4,0,0,false,false,-math.huge,0 function ah.IsEnabled()
return ai end local d,e function ah.SetEnabled(f)local g=f==true if g==ai then
return end ai=g if ai then d()else e()end end ah.IsSkillQEnabled=ah.IsEnabled ah
.SetSkillQEnabled=ah.SetEnabled ah.IsSkillEEnabled=ah.IsEnabled ah.
SetSkillEEnabled=ah.SetEnabled function ah.GetSkillERange()return aj end
function ah.SetSkillERange(f)if type(f)=='number'and f>=2 then aj=f end end
function ah.GetSpamInterval()return ak end function ah.SetSpamInterval(f)if
type(f)=='number'and f>=0.05 then ak=f end end function ah.GetBuffDuration()
return al end function ah.SetBuffDuration(f)if type(f)=='number'and f>=0.5 then
al=f end end function ah.IsBuffActive()return(os.clock()-aq)<al end function ah.
TriggerBuff()aq=os.clock()end function ah.GetLastBuffTime()return aq end
function ah.GetRemainingBuffTime()local f=al-(os.clock()-aq)return f>0 and f or
0 end local f=function()local f=ag or game:GetService'Players'.LocalPlayer if
not f then return nil end local g=f:FindFirstChild'Backpack'if g then for h,i in
ipairs(g:GetChildren())do local j=i:FindFirstChild'abilitySlot'if j and string.
lower(tostring(j.Value))=='q'then return i end end end local h=f.Character if h
then for i,j in ipairs(h:GetChildren())do if j:IsA'Tool'then local k=j:
FindFirstChild'abilitySlot'if k and string.lower(tostring(k.Value))=='q'then
return j end end end end return nil end local g=function()local g=f()if g then
local h=g:FindFirstChild'cooldown'if h and typeof(h.Value)=='number'then return
h.Value end end return nil end local h,i,j,k=function(h)local i=g()if i~=nil
then if i>(ar+0.5)or(ar<=0.2 and i>0.5)then aq=h end ar=i end end,function()if c
then return end pcall(function()local h=aa.ReplicatedStorage or game:GetService
'ReplicatedStorage'local i=h and h:FindFirstChild'remotes'local j=i and i:
FindFirstChild'abilityCast'if j and j:IsA'RemoteEvent'then c=j.OnClientEvent:
Connect(function(k,l)local m=ag or game:GetService'Players'.LocalPlayer if k==m
then local n=f()if(n and n.Name==l)or(not n)then aq=os.clock()end end end)end
end)end,function()if c then pcall(function()c:Disconnect()end)c=nil end end,
function()local h=ag or game:GetService'Players'.LocalPlayer local i=h and h.
Character local j=i and(i:FindFirstChild'HumanoidRootPart'or i.PrimaryPart)if j
and j.Parent then return j end return nil end local l=function()local l=k()if
not l then return nil,math.huge,false end local m,n=l.Position,ad.GetTarget and
ad.GetTarget()if n and n.Root and n.Root.Parent then local o=n.Humanoid or(n.
Model and n.Model:FindFirstChildOfClass'Humanoid')if o and o.Health>0 then local
p=n.Root.Position local q=Vector3.new(p.X-m.X,0,p.Z-m.Z).Magnitude return n,q,
true end end local o,p,q,r=ab.GetTrackedEnemyData and ab.GetTrackedEnemyData(),
math.huge,false if o and#o>0 then for s,t in ipairs(o)do if t and t.Root and t.
Root.Parent then local u=t.Humanoid or(t.Model and t.Model:FindFirstChildOfClass
'Humanoid')if u and u.Health>0 then q=true local v=t.Root.Position local w,x=v.X
-m.X,v.Z-m.Z local y=w*w+x*x if y<p then p=y r=t end end end end end local s=p<
math.huge and math.sqrt(p)or math.huge return r,s,q end function ah.CastSkillQ()
if ao then return end ao=true task.spawn(function()local m=(ab.GetKeyHoldTime
and ab.GetKeyHoldTime())or 0.05 pcall(function()af:SendKeyEvent(true,Enum.
KeyCode.Q,false,game)end)task.wait(m)pcall(function()af:SendKeyEvent(false,Enum.
KeyCode.Q,false,game)end)ao=false end)end function ah.CastSkillE()if ap then
return end ap=true task.spawn(function()local m=(ab.GetKeyHoldTime and ab.
GetKeyHoldTime())or 0.05 pcall(function()af:SendKeyEvent(true,Enum.KeyCode.E,
false,game)end)task.wait(m)pcall(function()af:SendKeyEvent(false,Enum.KeyCode.E,
false,game)end)ap=false end)end local m=function()if not ai or ab.IsInLobby()
then return end local m=k()if not m then return end local n=m.Parent local o=n
and n:FindFirstChildOfClass'Humanoid'if o and o.Health<=0 then return end local
p,q,r=l()local s=os.clock()h(s)if(s-am>=ak)and not ao then if r then local t=g()
local u=(t==nil)or(t<=0.2)if u then am=s ah.CastSkillQ()if t==nil and not ah.
IsBuffActive()then aq=s end end end end if(s-an>=ak)and not ap then if p and q<=
aj then local t=ah.IsBuffActive()if t then an=s ah.CastSkillE()end end end end d
=function()if not b then b=ae.Heartbeat:Connect(m)end i()end e=function()if b
then b:Disconnect()b=nil end j()ao=false ap=false ar=0 aq=-math.huge end
function ah.Step(n,o,p)end ac.Register(function()ah.SetEnabled(false)end)return
ah