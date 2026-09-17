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
'[EnemyTracker] Initialization error:',ah)end end)local ag,ah=0,2 task.spawn(
function()while c.IsActive()do task.wait(ah)local ai=os.clock()if ai-ag<ah then
continue end ag=ai if not dungeon then continue end local aj=pcall(function()for
_,aj in ipairs(dungeon:GetChildren())do if aj:IsA'Folder'or aj:IsA'Model'then
for ak,al in ipairs(aj:GetDescendants())do if al:IsA'Model'then Z(al)end end end
end L()end)if not aj then warn'[EnemyTracker] rescan error'end end end)function
h.IsBossActive()return n end function h.OnBossActiveChanged(ai)if type(ai)~=
'function'then return function()end end table.insert(o,ai)return function()for
aj,ak in ipairs(o)do if ak==ai then table.remove(o,aj)break end end end end
function h.GetCurrentBossIndex()return p end function h.GetCombatTargetKey()if
not n then return'Mob'end local ai=math.clamp(p,1,3)return'Boss'..tostring(ai)
end function h.ResetBossIndex()p=0 Q=nil for ai=#q,1,-1 do pcall(q[ai],p)end end
function h.OnBossIndexChanged(ai)if type(ai)~='function'then return function()
end end table.insert(q,ai)return function()for aj,ak in ipairs(q)do if ak==ai
then table.remove(q,aj)break end end end end local ai=function(ai)if type(ai)~=
'string'then return 0 end local aj=string.lower(ai)local ak=string.match(aj,
'boss.*(%d+)')if ak then return 100+(tonumber(ak)or 1)end if string.find(aj,
'boss')then return 100+math.max(1,p)end local al=string.match(ai,'^room(%d+)$')
if not al then return 0 end return tonumber(al)or 0 end local aj=function()if
not dungeon then return 0 end for aj,ak in pairs(u)do if ak and ak.Room then
local al=ai(ak.Room.Name)if al>0 then return al end end end if n then return 100
+math.max(1,p)end return 0 end O=function()local ak=aj()if ak==r then return end
r=ak for al=#s,1,-1 do pcall(s[al],r)end end function h.GetCurrentRoomIndex()
return r end function h.OnRoomIndexChanged(ak)if type(ak)~='function'then return
function()end end table.insert(s,ak)return function()for al,_ in ipairs(s)do if
_==ak then table.remove(s,al)break end end end end function h.
GetCurrentDungeonName()return K end function h.OnDungeonNameChanged(ak)if type(
ak)~='function'then return function()end end table.insert(B,ak)return function()
for al,_ in ipairs(B)do if _==ak then table.remove(B,al)break end end end end
function h.IsInLobby()return D end function h.OnLobbyChanged(ak)if type(ak)~=
'function'then return function()end end table.insert(E,ak)return function()for
al,_ in ipairs(E)do if _==ak then table.remove(E,al)break end end end end local
ak P=function()if not n or Q~=nil then return end for al,_ in pairs(u)do if _
and _.Root and _.Root.Parent then local am=false if _.Room and type(_.Room.Name)
=='string'and string.find(string.lower(_.Room.Name),'boss')then am=true elseif
string.find(string.lower(al.Name),'boss')then am=true elseif al.Parent and
string.find(string.lower(al.Parent.Name),'boss')then am=true end if am then Q=_.
Root.Position return end end end for al,am in pairs(u)do if am and am.Root and
am.Root.Parent then Q=am.Root.Position return end end end local al=function(al)
if n==al then return end n=al if al then p+=1 Q=nil P()for am=#q,1,-1 do pcall(q
[am],p)end else Q=nil end for am=#o,1,-1 do pcall(o[am],n)end O()end function h.
GetBossSpawnPosition()if Q then return Q end P()return Q end function h.
SetBossSpawnPosition(am)Q=am end local function am()if not d then return end
local _=d:FindFirstChild'PlayerGui'if not _ then ak=nil al(false)return end
local an=_:FindFirstChild('bossHealth',true)if an then if an~=ak then ak=an if
ak:IsA'ScreenGui'then T(ak:GetPropertyChangedSignal'Enabled':Connect(am))elseif
ak:IsA'GuiObject'then T(ak:GetPropertyChangedSignal'Visible':Connect(am))end end
local ao=if an:IsA'ScreenGui'then an.Enabled elseif an:IsA'GuiObject'then an.
Visible else true al(ao)else ak=nil al(false)end end task.spawn(function()if not
d then return end local an=d:WaitForChild('PlayerGui',30)if not an then return
end T(an.DescendantAdded:Connect(am))T(an.DescendantRemoving:Connect(am))am()
while c.IsActive()and task.wait(0.5)do am()end end)local an,ao={}local ap=
function()if ao then return ao end pcall(function()local _=d or game:GetService
'Players'.LocalPlayer local ap=_ and _:FindFirstChild'PlayerScripts'local aq=ap
and ap:FindFirstChild'PlayerModule'if aq then ao=require(aq):GetControls()end
end)return ao end function h.DisableControls(aq)aq=aq or'default'an[aq]=true
local _=ap()if _ and type(_.Disable)=='function'then pcall(function()_:Disable()
end)end end function h.EnableControls(aq)aq=aq or'default'an[aq]=nil if next(an)
~=nil then return end local _=ap()if _ and type(_.Enable)=='function'then pcall(
function()_:Enable()end)end end c.Register(function()if R then R:Disconnect()R=
nil end for aq,_ in ipairs(G)do pcall(function()_:Disconnect()end)end table.
clear(G)table.clear(an)local aq=ap()if aq and type(aq.Enable)=='function'then
pcall(function()aq:Enable()end)end N()end)return h end function a.d()local aa={}
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
for ag,ah in ipairs(af)do if ad.Validate(ah)then table.insert(ae,ah)end end
return ae end return ad end function a.f()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.
load'd',a.load'e',{},{},1,6 function ac.GetTarget()return ag end function ac.
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
ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,b,c,d=aa.RunService or game:GetService
'RunService',aa.VirtualInputManager or game:GetService'VirtualInputManager',aa.
player,{},false,35,0.15,4,0,0,false,false,-math.huge,0 function ah.IsEnabled()
return ai end local e,f function ah.SetEnabled(g)local h=g==true if h==ai then
return end ai=h if ai then e()else f()end end ah.IsSkillQEnabled=ah.IsEnabled ah
.SetSkillQEnabled=ah.SetEnabled ah.IsSkillEEnabled=ah.IsEnabled ah.
SetSkillEEnabled=ah.SetEnabled function ah.GetSkillERange()return aj end
function ah.SetSkillERange(g)if type(g)=='number'and g>=2 then aj=g end end
function ah.GetSpamInterval()return ak end function ah.SetSpamInterval(g)if
type(g)=='number'and g>=0.05 then ak=g end end function ah.GetBuffDuration()
return al end function ah.SetBuffDuration(g)if type(g)=='number'and g>=0.5 then
al=g end end function ah.IsBuffActive()return(os.clock()-aq)<al end function ah.
TriggerBuff()aq=os.clock()end function ah.GetLastBuffTime()return aq end
function ah.GetRemainingBuffTime()local g=al-(os.clock()-aq)return g>0 and g or
0 end local g=function()local g=ag or game:GetService'Players'.LocalPlayer if
not g then return nil end local h=g:FindFirstChild'Backpack'if h then for i,j in
ipairs(h:GetChildren())do local k=j:FindFirstChild'abilitySlot'if k and string.
lower(tostring(k.Value))=='q'then return j end end end local i=g.Character if i
then for j,k in ipairs(i:GetChildren())do if k:IsA'Tool'then local l=k:
FindFirstChild'abilitySlot'if l and string.lower(tostring(l.Value))=='q'then
return k end end end end return nil end local h=function()local h=g()if h then
local i=h:FindFirstChild'cooldown'if i and typeof(i.Value)=='number'then return
i.Value end end return nil end local i,j,k,l=function(i)local j=h()if j~=nil
then if j>(b+0.5)or(b<=0.2 and j>0.5)then aq=i end b=j end end,function()if d
then return end pcall(function()local i=aa.ReplicatedStorage or game:GetService
'ReplicatedStorage'local j=i and i:FindFirstChild'remotes'local k=j and j:
FindFirstChild'abilityCast'if k and k:IsA'RemoteEvent'then d=k.OnClientEvent:
Connect(function(l,m)local n=ag or game:GetService'Players'.LocalPlayer if l==n
then local o=g()if(o and o.Name==m)or(not o)then aq=os.clock()end end end)end
end)end,function()if d then pcall(function()d:Disconnect()end)d=nil end end,
function()local i=ag or game:GetService'Players'.LocalPlayer local j=i and i.
Character local k=j and(j:FindFirstChild'HumanoidRootPart'or j.PrimaryPart)if k
and k.Parent then return k end return nil end local m=function()local m=l()if
not m then return nil,math.huge,false end local n,o=m.Position,ad.GetTarget and
ad.GetTarget()if o and o.Root and o.Root.Parent then local p=o.Humanoid or(o.
Model and o.Model:FindFirstChildOfClass'Humanoid')if p and p.Health>0 then local
q=o.Root.Position local r=Vector3.new(q.X-n.X,0,q.Z-n.Z).Magnitude return o,r,
true end end local p,q,r,s=ab.GetTrackedEnemyData and ab.GetTrackedEnemyData(),
math.huge,false if p and#p>0 then for t,u in ipairs(p)do if u and u.Root and u.
Root.Parent then local v=u.Humanoid or(u.Model and u.Model:FindFirstChildOfClass
'Humanoid')if v and v.Health>0 then r=true local w=u.Root.Position local x,y=w.X
-n.X,w.Z-n.Z local z=x*x+y*y if z<q then q=z s=u end end end end end local t=q<
math.huge and math.sqrt(q)or math.huge return s,t,r end function ah.CastSkillQ()
if ao then return end ao=true task.spawn(function()local n=(ab.GetKeyHoldTime
and ab.GetKeyHoldTime())or 0.05 pcall(function()af:SendKeyEvent(true,Enum.
KeyCode.Q,false,game)end)task.wait(n)pcall(function()af:SendKeyEvent(false,Enum.
KeyCode.Q,false,game)end)ao=false end)end function ah.CastSkillE()if ap then
return end ap=true task.spawn(function()local n=(ab.GetKeyHoldTime and ab.
GetKeyHoldTime())or 0.05 pcall(function()af:SendKeyEvent(true,Enum.KeyCode.E,
false,game)end)task.wait(n)pcall(function()af:SendKeyEvent(false,Enum.KeyCode.E,
false,game)end)ap=false end)end local n=function()if not ai or ab.IsInLobby()
then return end local n=l()if not n then return end local o=n.Parent local p=o
and o:FindFirstChildOfClass'Humanoid'if p and p.Health<=0 then return end local
q,r,s=m()local t=os.clock()i(t)if(t-am>=ak)and not ao then if s then local u=h()
local v=(u==nil)or(u<=0.2)if v then am=t ah.CastSkillQ()if u==nil and not ah.
IsBuffActive()then aq=t end end end end if(t-an>=ak)and not ap then if q and r<=
aj then local u=ah.IsBuffActive()if u then an=t ah.CastSkillE()end end end end e
=function()if not c then c=ae.Heartbeat:Connect(n)end j()end f=function()if c
then c:Disconnect()c=nil end k()ao=false ap=false b=0 aq=-math.huge end function
ah.Step(o,p,q)end ac.Register(function()ah.SetEnabled(false)end)return ah