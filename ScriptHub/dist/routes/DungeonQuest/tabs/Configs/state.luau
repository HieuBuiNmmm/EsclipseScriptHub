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
local al function h.SetRealPlayerLevel(am)local _=tonumber(tostring(am or''):
match'%d+')if _ and _>0 then al=tostring(_)_G.RealPlayerLevel=al end end
function h.GetRealPlayerLevel()return al or _G.RealPlayerLevel end local am P=
function()if not n or Q~=nil then return end for _,an in pairs(u)do if an and an
.Root and an.Root.Parent then local ao=false if an.Room and type(an.Room.Name)==
'string'and string.find(string.lower(an.Room.Name),'boss')then ao=true elseif
string.find(string.lower(_.Name),'boss')then ao=true elseif _.Parent and string.
find(string.lower(_.Parent.Name),'boss')then ao=true end if ao then Q=an.Root.
Position return end end end for an,ao in pairs(u)do if ao and ao.Root and ao.
Root.Parent then Q=ao.Root.Position return end end end local an=function(an)if n
==an then return end n=an if an then p+=1 Q=nil ag()P()for ao=#q,1,-1 do pcall(q
[ao],p)end else Q=nil end for ao=#o,1,-1 do pcall(o[ao],n)end O()end function h.
GetBossSpawnPosition()if Q then return Q end P()return Q end function h.
SetBossSpawnPosition(ao)Q=ao end local function ao()if not d then return end
local _=d:FindFirstChild'PlayerGui'if not _ then am=nil an(false)return end
local ap=_:FindFirstChild('bossHealth',true)if ap then if ap~=am then am=ap if
am:IsA'ScreenGui'then T(am:GetPropertyChangedSignal'Enabled':Connect(ao))elseif
am:IsA'GuiObject'then T(am:GetPropertyChangedSignal'Visible':Connect(ao))end end
local aq=if ap:IsA'ScreenGui'then ap.Enabled elseif ap:IsA'GuiObject'then ap.
Visible else true an(aq)else am=nil an(false)end end task.spawn(function()if not
d then return end local ap=d:WaitForChild('PlayerGui',30)if not ap then return
end T(ap.DescendantAdded:Connect(ao))T(ap.DescendantRemoving:Connect(ao))ao()
while c.IsActive()and task.wait(0.5)do ao()end end)local ap,aq={}local ar=
function()if aq then return aq end pcall(function()local _=d or game:GetService
'Players'.LocalPlayer local ar=_ and _:FindFirstChild'PlayerScripts'local as=ar
and ar:FindFirstChild'PlayerModule'if as then aq=require(as):GetControls()end
end)return aq end function h.DisableControls(as)as=as or'default'ap[as]=true
local _=ar()if _ and type(_.Disable)=='function'then pcall(function()_:Disable()
end)end end function h.EnableControls(as)as=as or'default'ap[as]=nil if next(ap)
~=nil then return end local _=ar()if _ and type(_.Enable)=='function'then pcall(
function()_:Enable()end)end end c.Register(function()if R then R:Disconnect()R=
nil end for as,_ in ipairs(G)do pcall(function()_:Disconnect()end)end table.
clear(G)table.clear(ap)local as=ar()if as and type(as.Enable)=='function'then
pcall(function()as:Enable()end)end N()end)return h end function a.d()local aa,ab
={}function aa:SetWindow(ac)ab=ac end function aa.Notify(ac,ad,ae)ae=ae or 3 if
ab then local af=pcall(function()ab:Notify{Title=ac,Description=ad,Lifetime=ae}
end)if af then return end end pcall(function()game:GetService'StarterGui':
SetCore('SendNotification',{Title=ac,Text=ad,Duration=ae})end)end return aa end
function a.e()local aa,ab,ac,ad,ae,af=a.load'b',a.load'c',{},{},{},'Lobby'
function ac.GetCurrentZone()return ab.IsInLobby()and'Lobby'or'Dungeon'end
function ac.IsInZone(ag)if ag=='Global'then return true end return ac.
GetCurrentZone()==ag end function ac.IsLobby()return ac.GetCurrentZone()==
'Lobby'end function ac.IsDungeon()return ac.GetCurrentZone()=='Dungeon'end
function ac.Register(ag)if not ag or type(ag.Name)~='string'or not ag.Zone then
return end ad[ag.Name]=ag if ac.IsInZone(ag.Zone)and ag.OnEnter then task.spawn(
function()pcall(ag.OnEnter)end)end end function ac.Unregister(ag)ad[ag]=nil end
function ac.Guard(ag,ah,ai)return function(...)if not ac.IsInZone(ag)then return
ai end return ah(...)end end function ac.OnZoneChanged(ag)if type(ag)==
'function'then table.insert(ae,ag)end end local ag=function(ag)local ah=ag and
'Lobby'or'Dungeon'if ah==af then return end local ai=af af=ah for aj,ak in
pairs(ad)do if ak.Zone~='Global'and ak.Zone==ai and ak.OnLeave then task.spawn(
function()pcall(ak.OnLeave)end)end end for aj,ak in pairs(ad)do if ak.Zone~=
'Global'and ak.Zone==ah and ak.OnEnter then task.spawn(function()pcall(ak.
OnEnter)end)end end for aj,ak in ipairs(ae)do task.spawn(function()pcall(ak,ah,
ai)end)end end af=ac.GetCurrentZone()ab.OnLobbyChanged(function(ah)ag(ah)end)aa.
Register(function()table.clear(ad)table.clear(ae)end)return ac end function a.f(
)local aa,ab,ac,ad=a.load'a',a.load'd',a.load'b',a.load'e'local ae,af,ag,ah,ai,
aj,ak,al,am,an,ao,ap,aq=aa.player,2,false,false,false,false,60,false,
'local ReplayDungeon = game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("replayDungeon")\n\nlocal payload = {}\nlocal function collectValue(name)\n\tlocal value = workspace:FindFirstChild(name)\n\tif value and value:IsA("ValueBase") then\n\t\tpayload[name] = value.Value\n\tend\nend\n\ncollectValue("dungeonName")\ncollectValue("dungeonProgress")\ncollectValue("dungeonStarted")\n\nlocal hardcore = workspace:FindFirstChild("hardcore")\nif hardcore and hardcore:IsA("BoolValue") then\n\tpayload.hardcore = hardcore.Value\n\tpayload.isHardcore = hardcore.Value\nend\n\nlocal dungeon = workspace:FindFirstChild("dungeon")\nif dungeon then\n\tfor _, value in ipairs(dungeon:GetChildren()) do\n\t\tif value:IsA("ValueBase") then payload[value.Name] = value.Value end\n\tend\n\tlocal bossRoom = dungeon:FindFirstChild("bossRoom")\n\tif bossRoom then\n\t\tfor _, value in ipairs(bossRoom:GetChildren()) do\n\t\t\tif value:IsA("ValueBase") then payload[value.Name] = value.Value end\n\t\tend\n\tend\nend\n\nif not payload.dungeonName then return end\nReplayDungeon:FireServer(payload)\n'
,[[game:GetService("Players").LocalPlayer.PlayerGui.rewardGuiHolder.holder]],
function(ae)local af,ag=pcall(loadstring,'return '..ae)if af and type(ag)==
'function'then return ag end return nil end local ar,as=pcall(loadstring,am)if
ar and type(as)=='function'then ap=as end aq=ao(an)if not aq then aq=function()
return ae:FindFirstChild'PlayerGui'and ae.PlayerGui:FindFirstChild
'rewardGuiHolder'and ae.PlayerGui.rewardGuiHolder:FindFirstChild'holder'end end
local b,c,d=function()local b,c=pcall(function()local b=ae:FindFirstChild
'PlayerGui'local c=b and b:FindFirstChild'timeLeftGui'local d=c and c:
FindFirstChild'Frame'return d and d:FindFirstChild'time'end)if not b or typeof(c
)~='Instance'then return nil end local d if c:IsA'ValueBase'then d=c.Value else
d=c.Text end if type(d)=='number'then return d end if type(d)=='string'then
local e=d:gsub('%s+',''):gsub('^%[',''):gsub('%]$','')local f,g=e:match
'^(%d+):(%d+)$'if f and g then return tonumber(f)*60+tonumber(g)end local h=
tonumber(e)if h then return h end end return nil end,{},function()if not ad.
IsDungeon()then return false end if not ap then ab.Notify('Auto Retry',
'Remote command invalid',3)return false end local b,c=pcall(ap)if b then ab.
Notify('Auto Retry','Retrying dungeon!',3)return true end ab.Notify('Auto Retry'
,'Trigger failed: '..tostring(c),3)return false end function c.Start()if ah then
return end ah=true ai=false al=false task.spawn(function()while(ag or aj)and ac.
IsActive()do if not ad.IsDungeon()then task.wait(1)continue end if ag then local
e=0 if aq then local f,g=pcall(aq)if f and typeof(g)=='Instance'and g.Parent
then e=#g:GetChildren()end end if e>=af and not ai then ai=true d()elseif e<af
then ai=false end end if aj then local e=b()if e and e<ak and not al then al=
true d()elseif e and e>=ak then al=false end end if not ag and not aj then break
end task.wait(0.75)end ah=false end)end function c.Stop()ag=false end function c
.Toggle(e)ag=e if e then al=false c.Start()ab.Notify('Auto Retry',
'Watching reward holder...',2)else c.Stop()ab.Notify('Auto Retry','Stopped',2)
end end function c.SetTimeRetryEnabled(e)aj=e==true if aj then al=false c.Start(
)ab.Notify('Auto Retry','Watching time left...',2)else ab.Notify('Auto Retry',
'Time retry stopped',2)end end function c.GetTimeRetryEnabled()return aj end
function c.SetTimeRetryThreshold(e)ak=e end function c.GetTimeRetryThreshold()
return ak end function c.GetTimeLeft()return b()end function c.RetryNow()if not
ad.IsDungeon()then ab.Notify('Auto Retry','Only available in Dungeon!',3)return
end task.spawn(function()d()end)end ad.Register{Name='AutoRetry',Zone='Dungeon',
OnLeave=function()ai=false al=false end}ac.Register(function()c.Stop()aj=false
end)return c end end local aa,ab,ac,ad,ae,af=a.load'c',a.load'f','Boss Active',
'Boss','Dungeon','Time Left'return function(ag,ah)local ai=ah:Section{Side=
'Right'}ai:Header{Name='Status'}local aj=ai:Label{Text=ac..': '..(aa.
IsBossActive()and'Yes'or'No')}local ak=function(ak)local al=ak and'0, 255, 0'or
'255, 80, 80'aj:UpdateName(ac..": <font color='rgb("..al..")'>"..(ak and'Yes'or
'No')..'</font>')end ak(aa.IsBossActive())aa.OnBossActiveChanged(function(al)ak(
al)end)local al=ai:Label{Text=ad..': 0'}local am=function()al:UpdateName(ad..
': '..aa.GetCurrentBossIndex())end am()aa.OnBossIndexChanged(function()am()end)
local an=ai:Label{Text='Room: --'}local ao=function()local ao=aa.
GetCurrentRoomIndex()if ao<=0 then an:UpdateName
"Room: <font color='rgb(160, 160, 160)'>--</font>"return end local ap=ao>=100
local aq=ap and'255, 200, 80'or'0, 255, 0'an:UpdateName(
"Room: <font color='rgb("..aq..")'>"..tostring(ao)..'</font>')end ao()aa.
OnRoomIndexChanged(function()ao()end)local ap=ai:Label{Text='Enemies: 0'}local
aq=function()if not aa.IsInLobby()and not aa.GetCurrentDungeonName()then ap:
UpdateName"Enemies: <font color='rgb(160, 160, 160)'>--</font>"return end local
aq=aa.GetEnemyCount()local ar=aq>0 and'0, 255, 0'or'255, 80, 80'ap:UpdateName(
"Enemies: <font color='rgb("..ar..")'>"..aq..'</font>')end ai:Header{Name=
'Timer'}local ar=ai:Label{Text=af..': --'}local as=function()local as=ab.
GetTimeLeft()if not as then ar:UpdateName(af..
": <font color='rgb(160, 160, 160)'>--</font>")return end local b=math.floor(as)
local c,d=string.format('%d:%02d',math.floor(b/60),b%60),ab.GetTimeRetryEnabled(
)and as<ab.GetTimeRetryThreshold()local e=d and'255, 80, 80'or'0, 255, 0'ar:
UpdateName(af..": <font color='rgb("..e..")'>"..c..'</font>')end aq()as()local b
task.spawn(function()while task.wait(0.5)do ak(aa.IsBossActive())am()ao()aq()b()
as()end end)ai:Header{Name='Level Info'}local c=ai:Label{Text=ae..': Unknown'}
local d=function()local d=aa.GetCurrentDungeonName()if d then c:UpdateName(ae..
': '..d)else c:UpdateName(ae..": <font color='rgb(255, 80, 80)'>Unknown</font>")
end end d()aa.OnDungeonNameChanged(function()d()end)ai:Header{Name=
'Lobby / Dungeon'}local e=ai:Label{Text='Lobby: Unknown'}b=function()local f=aa.
IsInLobby()local g=f and'0, 255, 0'or'255, 80, 80'e:UpdateName(
"Lobby: <font color='rgb("..g..")'>"..(f and'Yes'or'No')..'</font>')end b()aa.
OnLobbyChanged(function()b()end)ai:Button{Name='Log Enemy Types to Console',
Callback=function()local f=aa.GetEnemyNames()print(
'[DungeonQuest] Enemy types in map ('..#f..'):')if#f==0 then print
'  (no enemies found)'else for g,h in ipairs(f)do print('  - '..h)end end end}
end