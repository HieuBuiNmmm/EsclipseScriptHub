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
,ac,ad,ae,af,ag={},0.85,0,2,{},64 function aa.BindDetection(ah)ag=ah or nil end
function aa.GetHazardPadding()return ac end aa.GetHitboxPadding=aa.
GetHazardPadding function aa.GetTrajectoryMargin()return ad end function aa.
SetTrajectoryMargin(ah)if type(ah)=='number'and ah>=0 and ah~=ad then ad=ah aa.
InvalidateCache()for ai,aj in ipairs(ae)do pcall(aj,ad)end end end function aa.
InvalidateCache()if ag and ag.GetActiveHazardsMap then for ah,ai in pairs(ag.
GetActiveHazardsMap())do ai.HazardZones=nil end end end function aa.
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
aq=ap:lower():gsub('%s+','')if#aq==0 then return false end for ar,as in ipairs(
ao)do if string.find(aq,as,1,true)then return true end end return false end
function aa.IsMovingBeam(aq)return ap(aq)end local aq,ar={'firstbossbigspike',
'firstbossbeampart','bigspike'},function(aq)if not aq or type(aq)~='string'then
return false end local ar=aq:lower():gsub('%s+','')return string.find(ar,
'firstbossbeampart',1,true)~=nil end function aa.IsBeamTelegraph(as)return ar(as
)end local as=function(as)if not as or type(as)~='string'then return false end
local b=as:lower():gsub('%s+','')if#b==0 or string.find(b,'seekingspike',1,true)
then return false end for c,d in ipairs(aq)do if string.find(b,d,1,true)then
return true end end return false end function aa.IsBigSpike(b)return as(b)end
local b=function()if ak and ak>0 then return ak end local b,c=45,ah:
FindFirstChild'enemyProjectiles'if not c then return b end local d=c:
FindFirstChild'largeIceSpikes'if not d then for e,f in ipairs(c:GetChildren())do
local g=(f.Name or''):lower():gsub('%s+','')if g=='largeicespikes'then d=f break
end end end if not d then return b end local e,f=0,Vector3.zero if d:IsA'Model'
and d.PrimaryPart then f=d.PrimaryPart.Position elseif d:IsA'BasePart'then f=d.
Position end local g={}if d:IsA'BasePart'then table.insert(g,d)else for h,i in
ipairs(d:GetDescendants())do if i:IsA'BasePart'then table.insert(g,i)end end end
if#g==0 then return b end for h,i in ipairs(g)do local j=i.Size local k,l=math.
max(j.X,j.Z)/2,(Vector3.new(i.Position.X,0,i.Position.Z)-Vector3.new(f.X,0,f.Z))
.Magnitude local m=l+k if m>e then e=m end end if e>=5 then ak=e return ak end
return b end function aa.GetLargeIceSpikesMaxRadius()return b()end local c=
function(c)if not c or type(c)~='string'then return false end local d=c:lower():
gsub('%s+','')if#d==0 then return false end for e,f in ipairs(ai)do local g=f:
lower():gsub('%s+','')if#g>0 and string.find(d,g,1,true)then return true end end
return false end function aa.IsForceCircle(d)return c(d)end function aa.
AddForceCircleName(d)if type(d)=='string'and#d>0 then table.insert(ai,d)aa.
InvalidateCache()end end function aa.GetForceCircleNames()return ai end local d,
e,f,g=function(d)return d and d.Parent and d.Transparency<=ab end,function(d,e,f
)local g,h,i,j=d.Size,f and ad or ac,(d and d.Name)or'',(d and d.Parent and d.
Parent.Name)or''if ap(i)or ap(j)then local k,l=math.max(g.X,g.Z)/2+h,math.max(2,
math.min(g.X,g.Z)/2+h)return{half=Vector3.new(k,0,l),cframe=d.CFrame,
isMovingBeam=true}end if as(i)or as(j)then local k,l=g,d:FindFirstChildWhichIsA(
'SpecialMesh',true)if l then k=Vector3.new(k.X*math.abs(l.Scale.X),k.Y*math.abs(
l.Scale.Y),k.Z*math.abs(l.Scale.Z))end local m={k.X,k.Y,k.Z}table.sort(m)local n
,o=math.clamp(m[2],6,60),math.clamp(m[3],8,80)local p,q=n/2+h,o/2+h return{half=
Vector3.new(p,0,q),cframe=d.CFrame,isBigSpike=true}end if e or(d:IsA'Part'and(d.
Shape==Enum.PartType.Ball or d.Shape==Enum.PartType.Cylinder))then return{radius
=math.max(g.X,g.Y,g.Z)/2}end local k=Vector3.new(math.max(g.X,0)/2+h,0,math.max(
g.Z,0)/2+h)return{half=k,cframe=d.CFrame}end,function(d,e,f,g)if not e then
return false end if e.expireTime and os.clock()>e.expireTime then return false
end local h,i=d.X,d.Z f=f or 0 local j=(g or e.isTrajectory)and ad or ac if e.
radius then local k,l=(e.part and e.part.Parent)and e.part.Position,e.
isSecondBossChain==true local m,n=(l and e.cx)or(k and k.X)or e.cx or 0,(l and e
.cz)or(k and k.Z)or e.cz or 0 local o,p,q=h-m,i-n,e.radius+j+f return(o*o+p*p)<=
(q*q)end local k=(e.part and e.part.Parent)and e.part.CFrame or e.cframe if k
then local l,m,n=k:PointToObjectSpace(d),e.half.X,e.half.Z if f<=0 then return
math.abs(l.X)<=m and math.abs(l.Z)<=n else local o,p=math.max(0,math.abs(l.X)-m)
,math.max(0,math.abs(l.Z)-n)return(o*o+p*p)<=(f*f)end end return false end,
function(d,e)local f=(e and e.CFrame)or(d:IsA'Model'and d:GetPivot())if f then
local g=f.LookVector local h=Vector3.new(-g.X,0,-g.Z)if h.Magnitude>0.05 then
return h.Unit end end local g=services.player or game:GetService'Players'.
LocalPlayer local h=g and g.Character local i=h and(h:FindFirstChild
'HumanoidRootPart'or h.PrimaryPart)if i and e then local j=Vector3.new(i.
Position.X-e.Position.X,0,i.Position.Z-e.Position.Z)if j.Magnitude>0.1 then
return j.Unit end end return Vector3.new(0,0,-1)end local h=function(h)if not h
or not h.Instance or not h.Instance.Parent then return nil end local i=h.
Instance local j=h.Name or(i and i.Name)or''local k,l=c(j),h.IsTrajectory==true
local m,n=l and ad or ac if al(j)then local o,p=(b())if i:IsA'BasePart'then p=d(
i)and i or nil elseif i:IsA'Model'then if i.PrimaryPart and d(i.PrimaryPart)then
p=i.PrimaryPart else for q,r in ipairs(i:GetDescendants())do if r:IsA'BasePart'
and d(r)and r.Parent then p=r break end end end end if not p then return nil end
local q=p.Position local r={radius=o,cx=q.X,cz=q.Z,part=p,isTrajectory=false,
isIceSpikes=true}return{zones={r},center=Vector3.new(q.X,0,q.Z),boundingRadius=o
+m}end if an(j)then local o if i:IsA'BasePart'then o=d(i)and i or nil elseif i:
IsA'Model'then if i.PrimaryPart and d(i.PrimaryPart)then o=i.PrimaryPart else
for p,q in ipairs(i:GetDescendants())do if q:IsA'BasePart'and d(q)and q.Parent
then o=q break end end end end if not o then return nil end local p,q,r,s,t,u,v,
w,x,y=o.Position,g(i,o),h.SpawnClock or os.clock(),{},10,11,3,22,2.2,0.4 local z
=(t-1)*w for A=1,t do local B=(A-1)*w local C,D,E=Vector3.new(p.X,0,p.Z)+q*B,u+(
A-1)*v,r+x+(A-1)*y table.insert(s,{radius=D,cx=C.X,cz=C.Z,part=o,expireTime=E,
isTrajectory=false,isSecondBossChain=true,circleIndex=A})end local A,B=Vector3.
new(p.X,0,p.Z)+q*(z/2),u+(t-1)*v local C,D=(z/2)+B+m,r+x+(t-1)*y if h then h.
MaxExpireTime=D h.IsSyntheticChain=true end return{zones=s,center=A,
boundingRadius=C,maxExpireTime=D}end if ap(j)then local o if i:IsA'BasePart'then
o=d(i)and i or nil elseif i:IsA'Model'then o=i.PrimaryPart or i:
FindFirstChildWhichIsA'BasePart'if not o or not d(o)then for p,q in ipairs(i:
GetDescendants())do if q:IsA'BasePart'and d(q)and q.Parent then o=q break end
end end end if not o then return nil end local p,q=o.Position,o.Size local r,s=
math.max(q.X,q.Z),math.max(3.5,math.min(q.X,q.Z))local t,u=r/2+m,s/2+m local v={
half=Vector3.new(t,0,u),cframe=o.CFrame,part=o,cx=p.X,cz=p.Z,isTrajectory=l,
isMovingBeam=true}return{zones={v},center=Vector3.new(p.X,0,p.Z),boundingRadius=
math.sqrt(t*t+u*u)}end if ar(j)then return nil end if as(j)then local o if i:IsA
'BasePart'then o=d(i)and i or nil elseif i:IsA'Model'then o=i.PrimaryPart or i:
FindFirstChildWhichIsA'BasePart'if not o or not d(o)then for p,q in ipairs(i:
GetDescendants())do if q:IsA'BasePart'and d(q)and q.Parent then o=q break end
end end end if not o then return nil end local p,q,r=o.Position,o.Size,o:
FindFirstChildWhichIsA('SpecialMesh',true)if r then q=Vector3.new(q.X*math.abs(r
.Scale.X),q.Y*math.abs(r.Scale.Y),q.Z*math.abs(r.Scale.Z))end local s={q.X,q.Y,q
.Z}table.sort(s)local t,u=math.clamp(s[2],6,60),math.clamp(s[3],8,80)local v,w=t
/2+m,u/2+m local x={half=Vector3.new(v,0,w),cframe=o.CFrame,part=o,cx=p.X,cz=p.Z
,isTrajectory=l,isBigSpike=true}return{zones={x},center=Vector3.new(p.X,0,p.Z),
boundingRadius=math.sqrt(v*v+w*w)}end if i:IsA'BasePart'then if not d(i)then
return nil end n={i}else n={}for o,p in ipairs(i:GetDescendants())do if#n>=af
then break end if p:IsA'BasePart'and d(p)and p.Parent then n[#n+1]=p end end if#
n==0 then return nil end end local o,p,q,r,s={},math.huge,-math.huge,math.huge,-
math.huge for t,u in ipairs(n)do local v,w=u.Position,u.Size local x=math.max(w.
X,w.Y,w.Z)/2+m p=math.min(p,v.X-x)q=math.max(q,v.X+x)r=math.min(r,v.Z-x)s=math.
max(s,v.Z+x)local y=e(u,k,l)if y then y.part=u y.isTrajectory=l o[#o+1]=y end
end if#o==0 then return nil end local t,u,v,w=(p+q)/2,(r+s)/2,(q-p)/2,(s-r)/2
return{zones=o,center=Vector3.new(t,0,u),boundingRadius=math.sqrt(v*v+w*w)}end
local i=function(i)local j=i and i.HazardZones if not j then j=h(i)if j and i
then i.HazardZones=j end end return j end function aa.GetHazardZones(j)return i(
j)end function aa.GetNearbyHazards(j,k)local l=ag if not l then return{}end k=k
or 65 local m,n,o={},j.X,j.Z for p,q in pairs(l.GetActiveHazardsMap())do local r
,s=q.Instance,i(q)if s then local t,u=s.center.X,s.center.Z if r and r.Parent
then local v=r:IsA'BasePart'and r or r.PrimaryPart or r:FindFirstChildWhichIsA
'BasePart'if v then t=v.Position.X u=v.Position.Z end end local v,w=n-t,o-u
local x,y=v*v+w*w,k+s.boundingRadius if x<=y*y then table.insert(m,q)end end end
return m end function aa.IsPointInAnyHazard(j,k,l,m)local n=ag if not n then
return false,nil,nil end l=l or 0 local o,p,q,r=math.huge,m or n.
GetActiveHazardsMap()for s,t in pairs(p)do local u=t.Instance or(typeof(s)==
'Instance'and s)if k and(k==u or(u and k.Name==u.Name))then continue end local v
=t.Name or(u and u.Name)or''if ap(v)or as(v)then continue end local w=i(t)if not
w then continue end local x,y=w.center.X,w.center.Z if u and u.Parent then local
z=u:IsA'BasePart'and u or u.PrimaryPart or u:FindFirstChildWhichIsA'BasePart'if
z then x=z.Position.X y=z.Position.Z end end local z,A=j.X-x,j.Z-y local B,C=z*z
+A*A,w.boundingRadius+l if B>C*C then continue end local D=t.IsTrajectory==true
for E=1,#w.zones do local F=w.zones[E]if d(F.part)and f(j,F,l,D or F.
isTrajectory)then local G=(j-F.part.Position).Magnitude if G<o then o=G q=t r=F.
part end break end end end return r~=nil,q,r end return aa end function a.e()
local aa,ab,ac=a.load'a',a.load'b',a.load'd'local ad,ae,af,ag,ah,ai,aj,ak,al,am,
an,ao,ap,aq,ar,as,b,c=aa.RunService or game:GetService'RunService',game:
GetService'ReplicatedStorage',aa.player,{},true,{},0.85,Color3.fromRGB(255,60,60
),Color3.fromRGB(0,180,255),Color3.fromRGB(255,140,0),Color3.fromRGB(220,90,255)
,'enemyProjectiles',false,{},{},{secondbossgreenorb=true,secondbossredorb=true,
secondbossyelloworb=true}local d=function()if ap then return end ap=true local d
=ae:FindFirstChild(ao)if d then for e,f in ipairs(d:GetChildren())do local g=(f.
Name or''):lower():gsub('%s+','')if#g>0 then aq[g]=true end end d.ChildAdded:
Connect(function(e)local f=(e.Name or''):lower():gsub('%s+','')if#f>0 then aq[f]
=true end end)end end function ag.IsChasingProjectile(e)if not e or type(e)~=
'string'then return false end local f=e:lower():gsub('%s+','')if#f==0 then
return false end if as[f]==true then return true end for g in pairs(as)do if
string.find(f,g,1,true)then return true end end return false end function ag.
IsEnemyProjectile(e)d()if not e or type(e)~='string'then return false end local
f=e:lower():gsub('%s+','')if#f==0 then return false end if ar[f]==true then
return false end return aq[f]==true end function ag.BindDetection(e)b=e or nil
end function ag.IsEnabled()return ah end local e=function()local e=af and af.
Character if not e then return nil end local f=e:FindFirstChild
'HumanoidRootPart'or e.PrimaryPart if not f then return nil end return f.
Position.Y-2.5 end local f,g=function(f)if not f or not f.Parent then return 2.5
end local g=e()if g then local h=g+2.5 local i,j=h-f.Position.Y,f.Size.Y/2+1.2
return math.clamp(math.max(i,j),1.5,30)end return math.clamp(f.Size.Y/2+1.8,2,10
)end,function(f)return f and f.Parent and f.Transparency<=aj end local h,i=
function(h)if not h or not h.Parent then return nil end if h:IsA'BasePart'then
if g(h)then return h end elseif h:IsA'Model'then if h.PrimaryPart and g(h.
PrimaryPart)then return h.PrimaryPart end local i=h:FindFirstChild
'HumanoidRootPart'if i and g(i)then return i end for j,k in ipairs(h:
GetDescendants())do if k:IsA'BasePart'and g(k)then return k end end else for i,j
in ipairs(h:GetDescendants())do if j:IsA'BasePart'and g(j)then return j end end
end return nil end,function(h)local i,j=h and h.IsTrajectory==true,h and h.Name
or'Hazard'local k,l=ag.IsChasingProjectile(j),ag.IsEnemyProjectile(j)local m=not
i or k if k then local n,o=an,'220,100,255'return'C',n,o,true elseif l then
local n,o=i and am or al,i and'255,160,50'or'0,210,255'return'P',n,o,m else
local n,o=i and am or ak,i and'255,160,50'or'255,80,80'return'N',n,o,m end end
local j=function(j,k)if not j or not j.items or not k then return end local l,m,
n,o=i(k)local p,q=k.Name or'Hazard',''if o then local r=k.SpawnClock or os.
clock()local s=math.max(0,os.clock()-r)q=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(255,220,220)'>%s</font> <font color='rgb(255,255,255)'><b>%.1fs</b></font>]]
):format(n,l,p,s)else q=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(220,235,255)'>%s</font>]]
):format(n,l,p)end for r,s in ipairs(j.items)do if s.label and s.label.Parent
then s.label.Text=q end if s.stroke and s.stroke.Parent and s.stroke.Color~=m
then s.stroke.Color=m end end end local k=function()if not ah then return end
local k=false for l,m in pairs(ai)do local n=l.Instance if not n or not n.Parent
then ag.DetachTimerVisual(l)else if m.items then for o=#m.items,1,-1 do local p=
m.items[o]local q=p.part if not g(q)then if p.billboard and p.billboard.Parent
then pcall(function()p.billboard:Destroy()end)end table.remove(m.items,o)else if
p.billboard and p.billboard.Parent then p.billboard.StudsOffset=Vector3.new(0,f(
q),0)end end end if#m.items==0 then ag.DetachTimerVisual(l)else k=true j(m,l)end
else ag.DetachTimerVisual(l)end end end if not k and c then c:Disconnect()c=nil
end end local l,m=function()if not c and ah then c=ad.Heartbeat:Connect(k)end
end,function(l,m)local n,o=f(l),Instance.new'BillboardGui'o.Name=
'HazardLifespanTimer'o.Adornee=l o.AlwaysOnTop=true o.MaxDistance=500 o.
LightInfluence=0 o.ResetOnSpawn=false o.Active=false o.Size=UDim2.new(0,150,0,24
)o.StudsOffset=Vector3.new(0,n,0)o.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
local p=Instance.new'Frame'p.Name='TimerFrame'p.Size=UDim2.new(1,0,1,0)p.
BackgroundColor3=Color3.fromRGB(15,15,20)p.BackgroundTransparency=0.25 p.
BorderSizePixel=0 p.Parent=o local q=Instance.new'UICorner'q.CornerRadius=UDim.
new(0,6)q.Parent=p local r=Instance.new'UIStroke'r.Name='Stroke'r.Thickness=1.3
r.Color=m or ak r.Transparency=0.15 r.Parent=p local s=Instance.new'TextLabel's.
Name='TimerLabel's.Size=UDim2.new(1,-6,1,0)s.Position=UDim2.new(0,3,0,0)s.
BackgroundTransparency=1 s.Font=Enum.Font.GothamBold s.TextSize=11 s.TextColor3=
Color3.fromRGB(255,255,255)s.TextStrokeTransparency=0 s.TextStrokeColor3=Color3.
fromRGB(0,0,0)s.RichText=true s.TextXAlignment=Enum.TextXAlignment.Center s.
TextYAlignment=Enum.TextYAlignment.Center s.Text=''s.Parent=p o.Parent=l return
o,s,r end function ag.AttachTimerVisual(n)if not ah or not n then return end
local o=n.Name or(n.Instance and n.Instance.Name)or''if(ac.IsIceSpikesChain and
ac.IsIceSpikesChain(o))or(ac.IsSecondBossCircleChain and ac.
IsSecondBossCircleChain(o))then return end if ai[n]then ag.DetachTimerVisual(n)
end local p=n.Instance if not p or not p.Parent then return end local q,r=i(n)
local s=ac.GetHazardZones(n)local t,u,v=s and s.zones,{},{}local w,x=function(w,
x,y,z,A)local B={billboard=x,label=y,stroke=z,part=w,zone=A}table.insert(u,B)
local C=w:GetPropertyChangedSignal'Transparency':Connect(function()if not g(w)
then pcall(function()x:Destroy()end)end end)table.insert(v,C)local D=w.
AncestryChanged:Connect(function(D,E)if not E then pcall(function()x:Destroy()
end)end end)table.insert(v,D)end if t and#t>0 then if p:IsA'Model'then if p.
PrimaryPart and g(p.PrimaryPart)then x=p.PrimaryPart elseif p:FindFirstChild
'HumanoidRootPart'and g(p:FindFirstChild'HumanoidRootPart')then x=p:
FindFirstChild'HumanoidRootPart'end end if not x then local y,z=s.center,math.
huge for A,B in ipairs(t)do local C=B.part if g(C)then if y then local D,E=C.
Position.X-y.X,C.Position.Z-y.Z local F=D*D+E*E if F<z then z=F x=C end else x=C
break end end end end end if not x then x=h(p)end if x and g(x)then local y,z,A=
m(x,r)w(x,y,z,A,nil)end if#u>0 then local y={items=u,connections=v}ai[n]=y j(y,n
)l()end end function ag.DetachTimerVisual(n)if not n then return end local o=ai[
n]if not o then return end if o.connections then for p,q in ipairs(o.connections
)do pcall(function()q:Disconnect()end)end table.clear(o.connections)end if o.
items then for p,q in ipairs(o.items)do if q.billboard and q.billboard.Parent
then pcall(function()q.billboard:Destroy()end)end end table.clear(o.items)end ai
[n]=nil end function ag.UpdateHazardVisualColor(n,o)if not n then return end
local p=ai[n]if p then j(p,n)else ag.AttachTimerVisual(n)end end function ag.
ClearAll()if c then c:Disconnect()c=nil end for n in pairs(ai)do ag.
DetachTimerVisual(n)end table.clear(ai)end function ag.RefreshAll()ag.ClearAll()
if not ah or not b then return end for n,o in pairs(b.GetActiveHazardsMap())do
if o then ag.AttachTimerVisual(o)end end end function ag.SetEnabled(n)ah=n and
true or false if ah then ag.RefreshAll()else ag.ClearAll()end end ab.Register(
function()ag.ClearAll()end)return ag end function a.f()local aa,ab,ac=a.load'a',
a.load'b',a.load'd'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao=aa.RunService or
game:GetService'RunService',aa.player,{},false,{},0.85,Color3.fromRGB(255,45,45)
,Color3.fromRGB(0,160,255),0.55,0.25 local ap=function()local ap=ae and ae.
Character if not ap then return nil end local aq=ap:FindFirstChild
'HumanoidRootPart'or ap.PrimaryPart if not aq then return nil end return aq.
Position.Y-2.5 end function af.BindDetection(aq)an=aq or nil end local aq
function af.BindTrajectory(ar)aq=ar or nil end function af.IsEnabled()return ag
end local ar=function(ar,as)local b,c,d=ar.ad,ar.zone,ar.part local e=ar.
anchorPart or d if not b or not b.Parent or not e or not e.Parent then return
end local f=c and(c.isSecondBossChain or(ar.hazardInfo and ar.hazardInfo.
IsSyntheticChain))local g=(f and c.cx and c.cz and Vector3.new(c.cx,0,c.cz))or(d
and d.Parent and d.Position)or((c and c.cx and c.cz)and Vector3.new(c.cx,0,c.cz)
)if not g then return end local h=Vector3.new(g.X,as or g.Y,g.Z)if ar.isCircle
then local i=CFrame.new(h)*CFrame.Angles(math.rad(90),0,0)b.CFrame=(e==workspace
.Terrain)and i or e.CFrame:ToObjectSpace(i)else local i if c and(c.isMovingBeam
or c.isBigSpike)then local j=aq and aq.GetHazardDirection and aq.
GetHazardDirection(ar.hazardInfo)if j and j.Magnitude>0.01 then i=CFrame.lookAt(
h,h+j)else local k=(d and d.Parent)and d.CFrame or CFrame.identity local l,m,n=k
:ToOrientation()i=CFrame.new(h)*CFrame.Angles(0,m,0)end else local j=(d and d.
Parent)and d.CFrame or CFrame.identity local k,m,n=j:ToOrientation()i=CFrame.
new(h)*CFrame.Angles(0,m,0)end b.CFrame=(e==workspace.Terrain)and i or e.CFrame:
ToObjectSpace(i)end end local as=function()if not ag then return end local as,b,
c=false,ap(),os.clock()for d,e in pairs(ah)do local f,g=d.IsSyntheticChain or(d.
MaxExpireTime and c<d.MaxExpireTime),d.Instance and d.Instance.Parent if not g
and not f then af.DetachZoneVisuals(d)else if e.items then local h={}for i,j in
ipairs(e.items)do local m=j.zone if m and m.expireTime and c>m.expireTime then
if j.ad and j.ad.Parent then pcall(function()j.ad:Destroy()end)end elseif j.ad
and j.ad.Parent then table.insert(h,j)ar(j,b)end end e.items=h if#h>0 then as=
true else af.DetachZoneVisuals(d)end end end end if not as and ao then ao:
Disconnect()ao=nil end end local b=function()if not ao and ag then ao=ad.
Heartbeat:Connect(as)end end function af.DetachZoneVisuals(c)if not c then
return end local d=ah[c]if not d then return end if d.adornments then for e,f in
ipairs(d.adornments)do pcall(function()f:Destroy()end)end table.clear(d.
adornments)end if d.connections then for e,f in ipairs(d.connections)do pcall(
function()f:Disconnect()end)end table.clear(d.connections)end if d.items then
table.clear(d.items)end ah[c]=nil end function af.UpdateHazardVisualColor(c,d)if
not c then return end local e=ah[c]if not e or not e.items then return end local
f=d==true or c.IsTrajectory==true local g,h=f and ak or aj,f and ac.
GetTrajectoryMargin()or 0 for i,j in ipairs(e.items)do local m,n,o=j.ad,j.zone,j
.part if m and m.Parent and n and o and o.Parent then m.Color3=g if j.isCircle
and n.radius then m.Radius=n.radius+h elseif n.half then local p,q=n.half.X,n.
half.Z m.Size=Vector3.new(p*2,am,q*2)end end end end function af.
AttachZoneVisuals(c)if not ag or not c then return end if ah[c]then af.
DetachZoneVisuals(c)end local d=ac.GetHazardZones(c)if not d or not d.zones then
return end local e=c.IsTrajectory==true local f,g,h,i,j,m,n=e and ak or aj,e and
ac.GetTrajectoryMargin()or 0,ap(),{},{},{},workspace.Terrain for o,p in ipairs(d
.zones)do local q,r,s,t=p.part,p.isSecondBossChain==true,p.isMovingBeam==true,p.
isBigSpike==true local u=(r or s or t)and n or q if r or s or t or(q and q.
Parent and q.Transparency<=ai)then local v,w=false if p.radius then v=true local
x=Instance.new'CylinderHandleAdornment'x.Name='HazardGroundCircle'x.Adornee=u x.
Radius=p.radius+g x.Height=am x.Color3=f x.Transparency=al x.ZIndex=2 x.
AlwaysOnTop=true x.Parent=u w=x elseif p.half and p.cframe then local x=Instance
.new'BoxHandleAdornment'x.Name='HazardGroundBox'x.Adornee=u x.Size=Vector3.new(p
.half.X*2,am,p.half.Z*2)x.Color3=f x.Transparency=al x.ZIndex=2 x.AlwaysOnTop=
true x.Parent=u w=x end if w then local x={ad=w,part=q,anchorPart=u,isCircle=v,
zone=p,hazardInfo=c}ar(x,h)table.insert(i,x)table.insert(j,w)if(not r and not s)
and q then local y=q:GetPropertyChangedSignal'Transparency':Connect(function()if
q.Parent and q.Transparency>ai then pcall(function()w:Destroy()end)end end)table
.insert(m,y)end end end end if#j>0 then ah[c]={items=i,adornments=j,connections=
m}b()end end function af.ClearAll()if ao then ao:Disconnect()ao=nil end for c in
pairs(ah)do af.DetachZoneVisuals(c)end table.clear(ah)end function af.RefreshAll
()af.ClearAll()if not ag or not an then return end for c,d in pairs(an.
GetActiveHazardsMap())do af.AttachZoneVisuals(d)end end function af.SetEnabled(c
)ag=c and true or false if ag then af.RefreshAll()else af.ClearAll()end end ac.
OnPaddingChanged(function()if ag then af.RefreshAll()end end)ab.Register(
function()af.ClearAll()end)return af end function a.g()local aa,ab,ac,ad=a.load
'a',a.load'b',a.load'd',a.load'e'local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar
,as,b,c,d=aa.RunService or game:GetService'RunService',aa.player,{},false,45,{
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
'seeking_spike'end end end end end return'seeking_spike'end local e,f=function(e
,f)if not e or type(e)~='string'then return false end local g=e:lower():gsub(
'%s+','')if#g==0 or string.find(g,'seekingspike',1,true)then return false end if
string.find(g,'firstbossbeampart',1,true)then return b(f)=='big_spike'end return
string.find(g,'firstbossbigspike',1,true)~=nil or string.find(g,'bigspike',1,
true)~=nil end,function(e,f)if not e or type(e)~='string'then return false end
local g=e:lower():gsub('%s+','')if#g==0 or string.find(g,'firstbossbigspike',1,
true)then return false end if string.find(g,'firstbossbeampart',1,true)then
return b(f)=='seeking_spike'end return string.find(g,'firstbossseekingspikes',1,
true)~=nil or string.find(g,'seekingspike',1,true)~=nil end local g,h=function(g
,h)return e(g,h)or f(g,h)end,function(g)if not g or not g.Parent then return nil
,nil,nil,nil end local h,i=((g.Name or''):lower())if as(h)then i=g:IsA'BasePart'
and g or g:FindFirstChildWhichIsA'BasePart'end if not i then local j=g:IsA
'BasePart'and g.Position or(g:IsA'Model'and g:GetPivot().Position)if j then
local m,n=35,e(g.Name,g)and'big_spike'or'seeking_spike'for o,p in ipairs(
workspace:GetChildren())do local q=p.Name:lower()if as(q)or string.find(q,
'beampart',1,true)then if b(p)==n then local r=p:IsA'BasePart'and p.Position or(
p:IsA'Model'and p:GetPivot().Position)if r then local s=(r-j).Magnitude if s<m
then m=s i=p end end end end end end end if not i then return nil,nil,nil,nil
end local j=i:FindFirstChild('Attachment2',true)if not j or not j:IsA
'Attachment'then for m,n in ipairs(i:GetDescendants())do if n:IsA'Attachment'and
n.Name~='Attachment0'and n.Name~='Attachment1'then j=n break end end end local m
,n=i.Position,j and j.WorldPosition if n and m then local o=n-m local p=Vector3.
new(o.X,0,o.Z)local q=p.Magnitude if q>5 then local r=p.Unit return q,r,m,n end
end return nil,nil,nil,nil end local i=function(i)if not i then return nil end
local j,m,n,o=0,0,0,{}if i:IsA'BasePart'then table.insert(o,i)else for p,q in
ipairs(i:GetDescendants())do if q:IsA'BasePart'then table.insert(o,q)end end end
for p,q in ipairs(o)do local r,s=q.Size,q:FindFirstChildWhichIsA('SpecialMesh',
true)if s then r=Vector3.new(r.X*math.abs(s.Scale.X),r.Y*math.abs(s.Scale.Y),r.Z
*math.abs(s.Scale.Z))end j=math.max(j,r.X)m=math.max(m,r.Y)n=math.max(n,r.Z)end
if j<=0 and m<=0 and n<=0 then return nil end local p={j,m,n}table.sort(p)local
q=p[2]if q<2 then q=math.max(p[1],p[2])end return q end local j,m=function(j)if
ak.firstbossbigspike then return ak.firstbossbigspike end if cachedBigSpikeWidth
then return cachedBigSpikeWidth end if j and not as(j.Name)then local m=i(j)if m
and m>=4 then cachedBigSpikeWidth=math.clamp(m,8,60)return cachedBigSpikeWidth
end end for m,n in ipairs(workspace:GetChildren())do local o=n.Name:lower()if
string.find(o,'firstbossbigspike',1,true)or(string.find(o,'bigspike',1,true)and
not string.find(o,'seekingspike',1,true)and not as(o))then local p=i(n)if p and
p>=4 then cachedBigSpikeWidth=math.clamp(p,8,60)return cachedBigSpikeWidth end
end end local m=game:GetService'ReplicatedStorage'local n=m:FindFirstChild
'enemyProjectiles'local o=n and n:FindFirstChild'firstBossBigSpike'if o then
local p=i(o)if p and p>=4 then cachedBigSpikeWidth=math.clamp(p,8,60)return
cachedBigSpikeWidth end end return 28 end local n=function(n)if ak.
firstbossseekingspikes then return ak.firstbossseekingspikes end if m then
return m end if n and not as(n.Name)then local o=i(n)if o and o>=2 then m=math.
clamp(o,4,40)return m end end for o,p in ipairs(workspace:GetChildren())do local
q=p.Name:lower():gsub('%s+','')if string.find(q,'seekingspike',1,true)and not
as(q)then local r=i(p)if r and r>=2 then m=math.clamp(r,4,40)return m end end
end local o=game:GetService'ReplicatedStorage'local p=o:FindFirstChild
'enemyProjectiles'local q=p and p:FindFirstChild'firstBossSeekingSpikes'if q
then local r=i(q)if r and r>=2 then m=math.clamp(r,4,40)return m end end return
10 end local o,p,q=function(o,p)if e(o,p)then return j(p)else return n(p)end end
,function(o)if not o then return ai end local p,q=''if type(o)=='string'then p=o
elseif type(o)=='table'then p=o.Name or(o.Instance and o.Instance.Name)or''q=al[
o]end local r=(q and q.mainPart)or(type(o)=='table'and o.Instance)if g(p,r)then
if q and q.beamLength then return q.beamLength end if e(p,r)then return aj.
firstbossbigspike or 140 else return aj.firstbossseekingspikes or 80 end end if
q and q.beamLength then return q.beamLength end local s=p:lower():gsub('%s+','')
if aj[s]then return aj[s]end for t,u in pairs(aj)do if string.find(s,t,1,true)
then return u end end return ai end,function()local o=af and af.Character if not
o then return nil end local p=o:FindFirstChild'HumanoidRootPart'or o.PrimaryPart
if not p then return nil end return p.Position end local r,s=function(r,s)if not
r or not s then return nil,nil end local t=r:lower():gsub('%s+','')local u=ar[t]
if not u then for v,w in pairs(ar)do if string.find(t,v,1,true)then u=w break
end end end if not u then return nil,nil end if u=='look_vector'then local v=s.
CFrame.LookVector local w=Vector3.new(v.X,0,v.Z)if w.Magnitude>0.01 then return
w.Unit,u end else local v=q()if v then local w=v-s.Position local x=Vector3.new(
w.X,0,w.Z)if x.Magnitude>0.1 then return x.Unit,u end end local w=s.CFrame.
LookVector local x=Vector3.new(w.X,0,w.Z)if x.Magnitude>0.01 then return x.Unit,
u end end return nil,nil end,function()local r=af and af.Character if not r then
return nil end local s=r:FindFirstChild'HumanoidRootPart'or r.PrimaryPart if not
s then return nil end return s.Position.Y-2.5 end function ag.BindDetection(t)c=
t or nil end function ag.IsEnabled()return ah end function ag.
GetPredictionLength()return ai end function ag.SetPredictionLength(t)if type(t)
=='number'and t>0 then ai=math.clamp(t,10,200)ag.RefreshAll()end end function ag
.GetHazardPredictionLength(t)return p(t)end function ag.GetCustomLength(t)if not
t then return nil end local u=t:lower():gsub('%s+','')return aj[u]end function
ag.SetCustomLength(t,u)if not t then return end local v=t:lower():gsub('%s+','')
if type(u)=='number'and u>0 then aj[v]=math.clamp(u,10,300)else aj[v]=nil end ag
.RefreshAll()end function ag.GetSecondBossBeamLength()return aj.
secondbossmovingbeam or 80 end function ag.SetSecondBossBeamLength(t)ag.
SetCustomLength('secondbossmovingbeam',t)end function ag.
GetFirstBossBigSpikeWidth()return ak.firstbossbigspike or 28 end function ag.
SetFirstBossBigSpikeWidth(t)if type(t)=='number'and t>0 then ak.
firstbossbigspike=math.clamp(t,6,60)else ak.firstbossbigspike=nil end
cachedBigSpikeWidth=nil ag.RefreshAll()end function ag.
GetFirstBossSeekingSpikeWidth()return ak.firstbossseekingspikes or(m or 10)end
function ag.SetFirstBossSeekingSpikeWidth(t)if type(t)=='number'and t>0 then ak.
firstbossseekingspikes=math.clamp(t,4,40)else ak.firstbossseekingspikes=nil end
m=nil ag.RefreshAll()end function ag.GetCustomWidth(t)if not t then return nil
end local u=t:lower():gsub('%s+','')return ak[u]end function ag.SetCustomWidth(t
,u)if not t then return end local v=t:lower():gsub('%s+','')if type(u)=='number'
and u>0 then ak[v]=math.clamp(u,4,100)else ak[v]=nil end ag.RefreshAll()end
function ag.IsHazardMoving(t)if not t then return false end local u=al[t]return
u and u.isMoving==true end function ag.GetHazardDirection(t)if not t then return
nil end local u=al[t]return u and u.dir or nil end local t,u=function(t,u)local
v=t.Instance if not v or not v.Parent then return nil,4 end local w,x=ac.
GetTrajectoryMargin and ac.GetTrajectoryMargin()or 2,t.Name or(v and v.Name)or''
if g(x,v)then local y=al[t]local z=(y and y.mainPart)or(v:IsA'BasePart'and v or
v.PrimaryPart or v:FindFirstChildWhichIsA'BasePart')local A,B=(y and y.
beamStartPos)or(z and z.Position)or v.Position,o(x,z)local C=math.max(1,B+w*2)
return Vector3.new(A.X,0,A.Z),C end local y,z={},ac.IsForceCircle and ac.
IsForceCircle(x)if v:IsA'BasePart'then if v.Transparency<=am then table.insert(y
,v)end else for A,B in ipairs(v:GetDescendants())do if B:IsA'BasePart'and B.
Parent and B.Transparency<=am then table.insert(y,B)end end end if#y==0 then
return nil,4 end local A,B,C,D=Vector3.new(-u.Z,0,u.X),math.huge,-math.huge,0
for E,F in ipairs(y)do local G,H,I=F.Position,F.Size,0 if z or(F:IsA'Part'and(F.
Shape==Enum.PartType.Ball or F.Shape==Enum.PartType.Cylinder))then I=math.max(H.
X,H.Y,H.Z)/2 else local J=F.CFrame local K,L,M,N,O,P=J.RightVector,J.UpVector,J.
LookVector,H.X/2,H.Y/2,H.Z/2 I=N*math.abs(K.X*A.X+K.Z*A.Z)+O*math.abs(L.X*A.X+L.
Z*A.Z)+P*math.abs(M.X*A.X+M.Z*A.Z)end local J=G.X*A.X+G.Z*A.Z B=math.min(B,J-I)C
=math.max(C,J+I)local K=G.X*u.X+G.Z*u.Z D+=K end local E,F,G=math.max(1,(C-B)+w*
2),(B+C)/2,D/#y local H=u*G+A*F return H,E end,function(t,u,v,w,x,y,z)if not u
or not u.Parent or not t or not t.Parent then return end local A=y/2 local B=
Vector3.new(v.X+w.X*A,x or v.Y,v.Z+w.Z*A)local C=B+Vector3.new(w.X,0,w.Z)local D
=CFrame.lookAt(B,C)t.CFrame=(t.Adornee==workspace.Terrain)and D or u.CFrame:
ToObjectSpace(D)t.Size=Vector3.new(z,ap,y)if not t.Visible then t.Visible=true
end end local v=function()if not ah then return end local v,w,x=false,os.clock()
,s()for y,z in pairs(al)do local A=y.Instance if not A or not A.Parent then ag.
DetachTrajectoryVisuals(y)else v=true local B,C=z.mainPart,y.Name or(A and A.
Name)local D=ad and ad.IsChasingProjectile and ad.IsChasingProjectile(C)if D
then if z.ad and z.ad.Visible then z.ad.Visible=false end z.isMoving=false y.
IsTrajectory=false elseif B and B.Parent then local E,F=B.Position,w-(z.
lastClock or w)if z.isBossSpike then if not z.beamFound then local G,H,I,J=h(B)
if G and H then z.beamFound=true z.beamLength=G z.beamDir=H z.beamStartPos=I z.
beamTargetPos=J z.dir=H end end if z.beamDir then z.dir=z.beamDir end z.isMoving
=true end if F>=0.035 then local G=E-(z.lastPos or E)local H,I=G.Magnitude/F,
Vector3.new(G.X,0,G.Z)local J,K=I.Magnitude/F,z.isMoving==true if J>=aq then z.
isMoving=true if not z.isBossSpike then z.dir=I.Unit end else if not z.isInstant
and not z.isBossSpike and F>=0.25 and H<aq then z.isMoving=false end end if z.
isMoving~=K then y.IsTrajectory=z.isMoving y.HazardZones=nil if c and c.
UpdateHazardVisualColor then pcall(c.UpdateHazardVisualColor,y,z.isMoving)end
local L=a.load'f'if L and L.UpdateHazardVisualColor then pcall(L.
UpdateHazardVisualColor,y,z.isMoving)end end z.lastPos=E z.lastClock=w end if z.
isMoving and z.dir and z.ad then local G,H=t(y,z.dir)if G then local I=p(y)u(z.
ad,B,G,z.dir,x,I,H)end else if z.ad and z.ad.Visible then z.ad.Visible=false end
end end end end if not v and d then d:Disconnect()d=nil end end local w=function
()if not d and ah then d=ae.Heartbeat:Connect(v)end end function ag.
DetachTrajectoryVisuals(x)if not x then return end local y=al[x]if not y then
return end if y.ad then pcall(function()y.ad:Destroy()end)y.ad=nil end if y.
connections then for z,A in ipairs(y.connections)do pcall(function()A:
Disconnect()end)end table.clear(y.connections)end al[x]=nil end function ag.
AttachTrajectoryVisuals(x)if not ah or not x then return end if al[x]then ag.
DetachTrajectoryVisuals(x)end local y=x.Instance if not y or not y.Parent then
return end local z=x.Name or(y and y.Name)if ad and ad.IsChasingProjectile and
ad.IsChasingProjectile(z)then x.IsTrajectory=false return end local A if y:IsA
'BasePart'then A=y else A=y.PrimaryPart or y:FindFirstChildWhichIsA'BasePart'if
not A then for B,C in ipairs(y:GetDescendants())do if C:IsA'BasePart'and C.
Parent then A=C break end end end end if not A or not A.Parent then return end
local B,C=p(x),Instance.new'BoxHandleAdornment'C.Name='HazardTrajectoryCorridor'
C.Adornee=workspace.Terrain C.Size=Vector3.new(4,ap,B)C.Color3=an C.Transparency
=ao C.ZIndex=1 C.AlwaysOnTop=true C.Visible=false C.Parent=workspace.Terrain
local D=x.Name or(y and y.Name)local E,F=as(D),g(D,y)local G=F and(e(D,y)and
'big_spike'or'seeking_spike')or nil if F then if not E then for H,I in pairs(al)
do if I and I.isBeam and I.spikeType==G then I.linkedSpike=A x.IsTrajectory=
false return end end else for H,I in pairs(al)do if I and not I.isBeam and I.
spikeType==G then x.IsTrajectory=false return end end end end local H={}if not E
then local I=A:GetPropertyChangedSignal'Transparency':Connect(function()if A.
Parent and A.Transparency>am then pcall(function()C:Destroy()end)end end)table.
insert(H,I)end local I local J=A.AncestryChanged:Connect(function(J,K)if not K
then if I and I.linkedSpike and I.linkedSpike.Parent and I.linkedSpike.
Transparency<=am then local L=I.linkedSpike.AncestryChanged:Connect(function(L,M
)if not M then pcall(function()C:Destroy()end)end end)table.insert(H,L)return
end pcall(function()C:Destroy()end)end end)table.insert(H,J)local K,L=r(D,A)
local M,N,O,P,Q=(K~=nil)if F then N,O,P,Q=h(y)if O then K=O M=true end end I={ad
=C,connections=H,mainPart=A,lastPos=A.Position,lastClock=os.clock(),velocity=
Vector3.zero,dir=K,isMoving=M,isInstant=M,instantMode=L,isBossSpike=F,isBigSpike
=e(D,y),isSeekingSpike=f(D,y),spikeType=G,isBeam=E,beamFound=N~=nil,beamLength=N
,beamDir=O,beamStartPos=P or A.Position,beamTargetPos=Q,linkedSpike=nil}if E and
G then local R=G=='big_spike'and'firstbossbigspike'or'seekingspike'for S,T in
ipairs(workspace:GetChildren())do local U=T.Name:lower():gsub('%s+','')if string
.find(U,R,1,true)and not as(U)then local V=T:IsA'BasePart'and T or(T:
FindFirstChildWhichIsA'BasePart'or(T:IsA'Model'and T.PrimaryPart))if V then
local W=(V.Position-A.Position).Magnitude if W<25 then I.linkedSpike=V break end
end end end end al[x]=I if M and K then x.IsTrajectory=true x.HazardZones=nil
local R,S,T=s(),t(x,K)local U=p(x)if S then u(C,A,S,K,R,U,T)end if c and c.
UpdateHazardVisualColor then pcall(c.UpdateHazardVisualColor,x,true)end local V=
a.load'f'if V and V.UpdateHazardVisualColor then pcall(V.UpdateHazardVisualColor
,x,true)end local W=a.load'e'if W and W.UpdateHazardVisualColor then pcall(W.
UpdateHazardVisualColor,x,true)end end w()end function ag.ClearAll()if d then d:
Disconnect()d=nil end for x in pairs(al)do ag.DetachTrajectoryVisuals(x)end
table.clear(al)end function ag.RefreshAll()ag.ClearAll()if not ah or not c then
return end for x,y in pairs(c.GetActiveHazardsMap())do ag.
AttachTrajectoryVisuals(y)end end function ag.GetNearbyTrajectories(x,y)y=y or
65 local A,B,C={},x.X,x.Z for D,E in pairs(al)do if E.isMoving and E.dir and E.
mainPart and E.mainPart.Parent then local F,G=t(D,E.dir)if F and G then local H,
I,J=p(D),F.X,F.Z local K,L=B-I,C-J local M,N=K*K+L*L,y+H+(G/2)if M<=N*N then
table.insert(A,{info=D,record=E})end end end end return A end function ag.
IsPointInAnyTrajectory(x,y,A)local B,C=x.X,x.Z y=y or 0 local D=3 if A then for
E,F in ipairs(A)do local G,H=F.info,F.record if H and H.isMoving and H.dir and H
.mainPart and H.mainPart.Parent then local I,J=t(G,H.dir)if I and J then local K
,L=p(G),H.dir local M,N,O=Vector3.new(-L.Z,0,L.X),B-I.X,C-I.Z local P,Q,R,S,T=N*
L.X+O*L.Z,N*M.X+O*M.Z,J/2,-D,K if y<=0 then if P>=S and P<=T and math.abs(Q)<=R
then return true,G,L,I,J end else local U=0 if P<S then U=S-P elseif P>T then U=
P-T end local V=math.max(0,math.abs(Q)-R)if(U*U+V*V)<=(y*y)then return true,G,L,
I,J end end end end end return false,nil,nil,nil,nil end for E,F in pairs(al)do
if F.isMoving and F.dir and F.mainPart and F.mainPart.Parent then local G,H=t(E,
F.dir)if G and H then local I,J=p(E),F.dir local K,L,M=Vector3.new(-J.Z,0,J.X),B
-G.X,C-G.Z local N,O,P,Q,R=L*J.X+M*J.Z,L*K.X+M*K.Z,H/2,-D,I if y<=0 then if N>=Q
and N<=R and math.abs(O)<=P then return true,E,J,G,H end else local S=0 if N<Q
then S=Q-N elseif N>R then S=N-R end local T=math.max(0,math.abs(O)-P)if(S*S+T*T
)<=(y*y)then return true,E,J,G,H end end end end end return false,nil,nil,nil,
nil end function ag.SetEnabled(x)ah=x and true or false if ah then ag.
RefreshAll()else ag.ClearAll()end end ac.OnPaddingChanged(function()if ah then
ag.RefreshAll()end end)ab.Register(function()ag.ClearAll()end)return ag end
function a.h()local aa={Options={},Folder='Maclib',contextData={},GetService=
function(aa)return cloneref and cloneref(game:GetService(aa))or game:GetService(
aa)end}local ab,ac,ad,ae,af,ag,ah=aa.GetService'TweenService',aa.GetService
'RunService',aa.GetService'HttpService',aa.GetService'ContentProvider',aa.
GetService'UserInputService',aa.GetService'Lighting',aa.GetService'Players'local
ai,aj,ak,al,am,an,ao,ap,aq,ar,as=ac:IsStudio(),ah.LocalPlayer,{},0,false,{
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
local b,c=function()ao()local b=Instance.new'ScreenGui'b.ScreenInsets=Enum.
ScreenInsets.None b.ResetOnSpawn=false b.ZIndexBehavior=Enum.ZIndexBehavior.
Sibling b.DisplayOrder=2147483647 local c=ac:IsStudio()and aj:FindFirstChild
'PlayerGui'or(gethui and gethui())or(cloneref and cloneref(aa.GetService
'CoreGui')or aa.GetService'CoreGui')b.Parent=c return b end,function(b,c,d)ao()
local e,f=pcall(ab.Create,ab,b,c,d)if e and f then return f end if d and typeof(
b)=='Instance'then for g,h in pairs(d)do pcall(function()b[g]=h end)end end
return{Play=function()end,Cancel=function()end,Pause=function()end,Completed={
Wait=function()end}}end function aa:Window(d)local e={Settings=d}if d.
AcrylicBlur~=nil then aq=d.AcrylicBlur else aq=true end local f,g=b(),Instance.
new'Frame'g.Name='Notifications'g.BackgroundColor3=Color3.fromRGB(255,255,255)g.
BackgroundTransparency=1 g.BorderColor3=Color3.fromRGB(0,0,0)g.BorderSizePixel=0
g.Size=UDim2.fromScale(1,1)g.Parent=f g.ZIndex=2 local h=Instance.new
'UIListLayout'h.Name='NotificationsUIListLayout'h.Padding=UDim.new(0,10)h.
HorizontalAlignment=Enum.HorizontalAlignment.Right h.SortOrder=Enum.SortOrder.
LayoutOrder h.VerticalAlignment=Enum.VerticalAlignment.Bottom h.Parent=g local i
=Instance.new'UIPadding'i.Name='NotificationsUIPadding'i.PaddingBottom=UDim.new(
0,10)i.PaddingLeft=UDim.new(0,10)i.PaddingRight=UDim.new(0,10)i.PaddingTop=UDim.
new(0,10)i.Parent=g local j=Instance.new'Frame'j.Name='Base'j.AnchorPoint=
Vector2.new(0.5,0.5)j.BackgroundColor3=Color3.fromRGB(15,15,15)j.
BackgroundTransparency=d.AcrylicBlur and 0.05 or 0 j.BorderColor3=Color3.
fromRGB(0,0,0)j.BorderSizePixel=0 j.Position=UDim2.fromScale(0.5,0.5)j.Size=d.
Size or UDim2.fromOffset(868,650)local m=Instance.new'UIScale'm.Name=
'BaseUIScale'm.Parent=j local n=Instance.new'UICorner'n.Name='BaseUICorner'n.
CornerRadius=UDim.new(0,10)n.Parent=j local o=Instance.new'UIStroke'o.Name=
'BaseUIStroke'o.ApplyStrokeMode=Enum.ApplyStrokeMode.Border o.Color=Color3.
fromRGB(255,255,255)o.Transparency=0.9 o.Parent=j local p=Instance.new'Frame'p.
Name='Sidebar'p.BackgroundColor3=Color3.fromRGB(255,255,255)p.
BackgroundTransparency=1 p.BorderColor3=Color3.fromRGB(0,0,0)p.BorderSizePixel=0
p.Position=UDim2.fromScale(-3.5199999999999996E-8,4.69e-8)p.Size=d.SidebarWidth
and UDim2.new(0,d.SidebarWidth,1,0)or UDim2.fromScale(0.325,1)local q=Instance.
new'Frame'q.Name='Divider'q.AnchorPoint=Vector2.new(1,0)q.BackgroundColor3=
Color3.fromRGB(255,255,255)q.BackgroundTransparency=0.9 q.BorderColor3=Color3.
fromRGB(0,0,0)q.BorderSizePixel=0 q.Position=UDim2.fromScale(1,0)q.Size=UDim2.
new(0,1,1,0)q.Parent=p local r=Instance.new'TextButton'r.Name='DividerInteract'r
.AnchorPoint=Vector2.new(0.5,0)r.BackgroundColor3=Color3.fromRGB(255,255,255)r.
BackgroundTransparency=1 r.BorderColor3=Color3.fromRGB(0,0,0)r.BorderSizePixel=0
r.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'r.Position=
UDim2.fromScale(0.5,0)r.Size=UDim2.new(1,6,1,0)r.Text=''r.TextColor3=Color3.
fromRGB(0,0,0)r.TextSize=14 r.Parent=q local s=Instance.new'Frame's.Name=
'WindowControls's.BackgroundColor3=Color3.fromRGB(255,255,255)s.
BackgroundTransparency=1 s.BorderColor3=Color3.fromRGB(0,0,0)s.BorderSizePixel=0
s.Size=UDim2.new(1,0,0,31)local t=Instance.new'Frame't.Name='Controls't.
BackgroundColor3=Color3.fromRGB(119,174,94)t.BackgroundTransparency=1 t.
BorderColor3=Color3.fromRGB(0,0,0)t.BorderSizePixel=0 t.Size=UDim2.fromScale(1,1
)local u=Instance.new'UIListLayout'u.Name='UIListLayout'u.Padding=UDim.new(0,5)u
.FillDirection=Enum.FillDirection.Horizontal u.SortOrder=Enum.SortOrder.
LayoutOrder u.VerticalAlignment=Enum.VerticalAlignment.Center u.Parent=t local v
=Instance.new'UIPadding'v.Name='UIPadding'v.PaddingLeft=UDim.new(0,11)v.Parent=t
local w,x={sizes={enabled=UDim2.fromOffset(8,8),disabled=UDim2.fromOffset(7,7)},
transparencies={enabled=0,disabled=1},strokeTransparency=0.9},Instance.new
'UIStroke'x.Name='BaseUIStroke'x.ApplyStrokeMode=Enum.ApplyStrokeMode.Border x.
Color=Color3.fromRGB(255,255,255)x.Transparency=w.strokeTransparency local y=
Instance.new'TextButton'y.Name='Exit'y.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'y.Text=''y.TextColor3=Color3.
fromRGB(0,0,0)y.TextSize=14 y.AutoButtonColor=false y.BackgroundColor3=Color3.
fromRGB(250,93,86)y.BorderColor3=Color3.fromRGB(0,0,0)y.BorderSizePixel=0 local
A=Instance.new'UICorner'A.Name='UICorner'A.CornerRadius=UDim.new(1,0)A.Parent=y
y.Parent=t local B=Instance.new'TextButton'B.Name='Minimize'B.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'B.Text=''B.TextColor3=Color3.
fromRGB(0,0,0)B.TextSize=14 B.AutoButtonColor=false B.BackgroundColor3=Color3.
fromRGB(252,190,57)B.BorderColor3=Color3.fromRGB(0,0,0)B.BorderSizePixel=0 B.
LayoutOrder=1 local C=Instance.new'UICorner'C.Name='UICorner'C.CornerRadius=UDim
.new(1,0)C.Parent=B B.Parent=t local D=Instance.new'TextButton'D.Name='Maximize'
D.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'D.Text=''D.
TextColor3=Color3.fromRGB(0,0,0)D.TextSize=14 D.AutoButtonColor=false D.
BackgroundColor3=Color3.fromRGB(119,174,94)D.BorderColor3=Color3.fromRGB(0,0,0)D
.BorderSizePixel=0 D.LayoutOrder=1 local E=Instance.new'UICorner'E.Name=
'UICorner'E.CornerRadius=UDim.new(1,0)E.Parent=D D.Parent=t local F=function(F,G
)local H,I=G and w.sizes.enabled or w.sizes.disabled,G and w.transparencies.
enabled or w.transparencies.disabled F.Size=H F.BackgroundTransparency=I F.
Active=G F.Interactable=G for J,K in ipairs(F:GetChildren())do if K:IsA
'UIStroke'then K.Transparency=I end end if not G then x:Clone().Parent=F end end
F(D,false)local G={y,B}for H,I in pairs(G)do local J,K=I.Name,true if d.
DisabledWindowControls and table.find(d.DisabledWindowControls,J)then K=false
end F(I,K)end t.Parent=s local H=Instance.new'Frame'H.Name='Divider'H.
AnchorPoint=Vector2.new(0,1)H.BackgroundColor3=Color3.fromRGB(255,255,255)H.
BackgroundTransparency=0.9 H.BorderColor3=Color3.fromRGB(0,0,0)H.BorderSizePixel
=0 H.Position=UDim2.fromScale(0,1)H.Size=UDim2.new(1,0,0,1)H.Parent=s s.Parent=p
local I=Instance.new'Frame'I.Name='Information'I.BackgroundColor3=Color3.
fromRGB(255,255,255)I.BackgroundTransparency=1 I.BorderColor3=Color3.fromRGB(0,0
,0)I.BorderSizePixel=0 I.Position=UDim2.fromOffset(0,31)I.Size=UDim2.new(1,0,0,
60)local J=Instance.new'Frame'J.Name='Divider'J.AnchorPoint=Vector2.new(0,1)J.
BackgroundColor3=Color3.fromRGB(255,255,255)J.BackgroundTransparency=0.9 J.
BorderColor3=Color3.fromRGB(0,0,0)J.BorderSizePixel=0 J.Position=UDim2.
fromScale(0,1)J.Size=UDim2.new(1,0,0,1)J.Parent=I local K=Instance.new'Frame'K.
Name='InformationHolder'K.BackgroundColor3=Color3.fromRGB(255,255,255)K.
BackgroundTransparency=1 K.BorderColor3=Color3.fromRGB(0,0,0)K.BorderSizePixel=0
K.Size=UDim2.fromScale(1,1)local L=Instance.new'UIPadding'L.Name=
'InformationHolderUIPadding'L.PaddingBottom=UDim.new(0,10)L.PaddingLeft=UDim.
new(0,23)L.PaddingRight=UDim.new(0,22)L.PaddingTop=UDim.new(0,10)L.Parent=K
local M=Instance.new'ImageButton'M.Name='GlobalSettingsButton'M.Image=an.globe M
.ImageTransparency=0.5 M.AnchorPoint=Vector2.new(1,0.5)M.BackgroundColor3=Color3
.fromRGB(255,255,255)M.BackgroundTransparency=1 M.BorderColor3=Color3.fromRGB(0,
0,0)M.BorderSizePixel=0 M.Position=UDim2.fromScale(1,0.5)M.Size=UDim2.
fromOffset(16,16)M.Parent=K local N=function(N)if N=='Default'then c(M,TweenInfo
.new(0.2,Enum.EasingStyle.Sine),{ImageTransparency=0.5}):Play()elseif N=='Hover'
then c(M,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{ImageTransparency=0.3}):Play(
)end end M.MouseEnter:Connect(function()N'Hover'end)M.MouseLeave:Connect(
function()N'Default'end)local O=Instance.new'Frame'O.Name='TitleFrame'O.
BackgroundColor3=Color3.fromRGB(255,255,255)O.BackgroundTransparency=1 O.
BorderColor3=Color3.fromRGB(0,0,0)O.BorderSizePixel=0 O.Size=UDim2.fromScale(1,1
)local P=Instance.new'TextLabel'P.Name='Title'P.FontFace=Font.new(an.interFont,
Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)P.Text=d.Title P.TextColor3=
Color3.fromRGB(255,255,255)P.RichText=true P.TextSize=18 P.TextTransparency=0.1
P.TextTruncate=Enum.TextTruncate.SplitWord P.TextXAlignment=Enum.TextXAlignment.
Left P.TextYAlignment=Enum.TextYAlignment.Top P.AutomaticSize=Enum.AutomaticSize
.Y P.BackgroundColor3=Color3.fromRGB(255,255,255)P.BackgroundTransparency=1 P.
BorderColor3=Color3.fromRGB(0,0,0)P.BorderSizePixel=0 P.Size=UDim2.new(1,-20,0,0
)P.Parent=O local Q=Instance.new'TextLabel'Q.Name='Subtitle'Q.FontFace=Font.new(
an.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)Q.RichText=true Q.Text
=d.Subtitle Q.RichText=true Q.TextColor3=Color3.fromRGB(255,255,255)Q.TextSize=
12 Q.TextTransparency=0.7 Q.TextTruncate=Enum.TextTruncate.SplitWord Q.
TextXAlignment=Enum.TextXAlignment.Left Q.TextYAlignment=Enum.TextYAlignment.Top
Q.AutomaticSize=Enum.AutomaticSize.Y Q.BackgroundColor3=Color3.fromRGB(255,255,
255)Q.BackgroundTransparency=1 Q.BorderColor3=Color3.fromRGB(0,0,0)Q.
BorderSizePixel=0 Q.LayoutOrder=1 Q.Size=UDim2.new(1,-20,0,0)Q.Parent=O local R=
Instance.new'UIListLayout'R.Name='TitleFrameUIListLayout'R.Padding=UDim.new(0,3)
R.SortOrder=Enum.SortOrder.LayoutOrder R.VerticalAlignment=Enum.
VerticalAlignment.Center R.Parent=O O.Parent=K K.Parent=I I.Parent=p local S=
Instance.new'Frame'S.Name='SidebarGroup'S.BackgroundColor3=Color3.fromRGB(255,
255,255)S.BackgroundTransparency=1 S.BorderColor3=Color3.fromRGB(0,0,0)S.
BorderSizePixel=0 S.Position=UDim2.fromOffset(0,91)S.Size=UDim2.new(1,0,1,-91)
local T=Instance.new'Frame'T.Name='UserInfo'T.AnchorPoint=Vector2.new(0,1)T.
BackgroundColor3=Color3.fromRGB(255,255,255)T.BackgroundTransparency=1 T.
BorderColor3=Color3.fromRGB(0,0,0)T.BorderSizePixel=0 T.Position=UDim2.
fromScale(0,1)T.Size=UDim2.new(1,0,0,107)local U=Instance.new'Frame'U.Name=
'InformationGroup'U.BackgroundColor3=Color3.fromRGB(255,255,255)U.
BackgroundTransparency=1 U.BorderColor3=Color3.fromRGB(0,0,0)U.BorderSizePixel=0
U.Size=UDim2.fromScale(1,1)local V=Instance.new'UIPadding'V.Name=
'InformationGroupUIPadding'V.PaddingBottom=UDim.new(0,17)V.PaddingLeft=UDim.new(
0,25)V.Parent=U local W=Instance.new'UIListLayout'W.Name=
'InformationGroupUIListLayout'W.FillDirection=Enum.FillDirection.Horizontal W.
SortOrder=Enum.SortOrder.LayoutOrder W.VerticalAlignment=Enum.VerticalAlignment.
Center W.Parent=U local X,Y,Z=aj.UserId,Enum.ThumbnailType.AvatarBust,Enum.
ThumbnailSize.Size48x48 local _,at=ah:GetUserThumbnailAsync(X,Y,Z)local au=
Instance.new'ImageLabel'au.Name='Headshot'au.BackgroundColor3=Color3.fromRGB(255
,255,255)au.BackgroundTransparency=1 au.BorderColor3=Color3.fromRGB(0,0,0)au.
BorderSizePixel=0 au.Size=UDim2.fromOffset(32,32)au.Image=(at and _)or
'rbxassetid://0'local av=Instance.new'UICorner'av.Name='UICorner'av.CornerRadius
=UDim.new(1,0)av.Parent=au local aw=Instance.new'UIStroke'aw.Name='BaseUIStroke'
aw.ApplyStrokeMode=Enum.ApplyStrokeMode.Border aw.Color=Color3.fromRGB(255,255,
255)aw.Transparency=0.9 aw.Parent=au au.Parent=U local ax=Instance.new'Frame'ax.
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
fromScale(1,0)ax.Parent=U U.Parent=T local aC=Instance.new'UIPadding'aC.Name=
'UserInfoUIPadding'aC.PaddingLeft=UDim.new(0,10)aC.PaddingRight=UDim.new(0,10)aC
.Parent=T T.Parent=S local aD=Instance.new'UIPadding'aD.Name=
'SidebarGroupUIPadding'aD.PaddingLeft=UDim.new(0,10)aD.PaddingRight=UDim.new(0,
10)aD.PaddingTop=UDim.new(0,31)aD.Parent=S local aE=Instance.new'Frame'aE.Name=
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
new(0,2)aH.Parent=aF aF.Parent=aE aE.Parent=S S.Parent=p p.Parent=j local aI=
Instance.new'Frame'aI.Name='Content'aI.AnchorPoint=Vector2.new(1,0)aI.
BackgroundColor3=Color3.fromRGB(255,255,255)aI.BackgroundTransparency=1 aI.
BorderColor3=Color3.fromRGB(0,0,0)aI.BorderSizePixel=0 aI.Position=UDim2.
fromScale(1,4.69e-8)aI.Size=UDim2.new(0,(j.AbsoluteSize.X-p.AbsoluteSize.X),1,0)
local aJ,aK,aL,aM,aN,aO=false,p.AbsoluteSize.X,20,107 local aP,aQ=j.AbsoluteSize
.X-aM,{DefaultTransparency=0.9,HoverTransparency=0.85,EasingStyle=Enum.
EasingStyle.Sine}local aR=function(aR)c(q,TweenInfo.new(0.2,aQ.EasingStyle),{
BackgroundTransparency=aR=='Idle'and aQ.DefaultTransparency or aQ.
HoverTransparency}):Play()end r.MouseEnter:Connect(function()aR'Hover'end)r.
MouseLeave:Connect(function()aR'Idle'end)r.MouseButton1Down:Connect(function()aJ
=true aN=af:GetMouseLocation().X aO=p.AbsoluteSize.X end)af.InputEnded:Connect(
function(aS)if aS.UserInputType==Enum.UserInputType.MouseButton1 then aJ=false
end end)af.InputChanged:Connect(function(aS)if aJ and aS.UserInputType==Enum.
UserInputType.MouseMovement then local aT=af:GetMouseLocation().X-aN local aU=aO
+aT if math.abs(aU-aK)<aL then aU=aK else aU=math.clamp(aU,aM,aP)end p.Size=
UDim2.new(0,aU,1,0)aI.Size=UDim2.new(0,j.AbsoluteSize.X-aU,1,0)end end)local aS=
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
fromScale(1,0.5)aW.Size=UDim2.fromOffset(15,15)aW.Parent=aU aW.Visible=not d.
DragStyle or d.DragStyle==1 local aX=Instance.new'TextButton'aX.Name='Interact'
aX.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'aX.Text=''aX.
TextColor3=Color3.fromRGB(0,0,0)aX.TextSize=14 aX.AnchorPoint=Vector2.new(0.5,
0.5)aX.BackgroundColor3=Color3.fromRGB(255,255,255)aX.BackgroundTransparency=1
aX.BorderColor3=Color3.fromRGB(0,0,0)aX.BorderSizePixel=0 aX.Position=UDim2.
fromScale(0.5,0.5)aX.Size=UDim2.fromOffset(40,40)aX.Parent=aW local aY=function(
aY)if aY=='Default'then c(aW,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
ImageTransparency=0.7}):Play()elseif aY=='Hover'then c(aW,TweenInfo.new(0.2,Enum
.EasingStyle.Sine),{ImageTransparency=0.4}):Play()end end aX.MouseEnter:Connect(
function()aY'Hover'end)aX.MouseLeave:Connect(function()aY'Default'end)local aZ,
a_,a0,a1=false local a2,a3,a4=function(a2)local a3=a2.Position-a0 j.Position=
UDim2.new(a1.X.Scale,a1.X.Offset+a3.X,a1.Y.Scale,a1.Y.Offset+a3.Y)end,function(
a2)if a2.UserInputType==Enum.UserInputType.MouseButton1 or a2.UserInputType==
Enum.UserInputType.Touch then aZ=true a0=a2.Position a1=j.Position a2.Changed:
Connect(function()if a2.UserInputState==Enum.UserInputState.End then aZ=false
end end)end end,function(a2)if aZ and(a2.UserInputType==Enum.UserInputType.
MouseMovement or a2.UserInputType==Enum.UserInputType.Touch)then a_=a2 end end
if not d.DragStyle or d.DragStyle==1 then aX.InputBegan:Connect(function(a5)if
a5.UserInputType==Enum.UserInputType.MouseButton1 or a5.UserInputType==Enum.
UserInputType.Touch then a3(a5)end end)aX.InputChanged:Connect(a4)af.
InputChanged:Connect(function(a5)if a5==a_ and aZ then a2(a5)end end)aX.
InputEnded:Connect(function(a5)if a5.UserInputType==Enum.UserInputType.
MouseButton1 or a5.UserInputType==Enum.UserInputType.Touch then aZ=false end end
)elseif d.DragStyle==2 then j.InputBegan:Connect(function(a5)if a5.UserInputType
==Enum.UserInputType.MouseButton1 or a5.UserInputType==Enum.UserInputType.Touch
then a3(a5)end end)j.InputChanged:Connect(a4)af.InputChanged:Connect(function(a5
)if a5==a_ and aZ then a2(a5)end end)j.InputEnded:Connect(function(a5)if a5.
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
Parent=aI aI.Parent=j local a6=Instance.new'Frame'a6.Name='GlobalSettings'a6.
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
j j.Parent=f function e:UpdateTitle(bc)P.Text=bc end function e:UpdateSubtitle(
bc)Q.Text=bc end local bc,bd=bb.Scale==1 and true or false local be=function()if
not bc then local be=c(bb,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=1})be:Play()be.Completed:Wait()bc=true elseif bc
then local be=c(bb,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=0})be:Play()be.Completed:Wait()bc=false end end M.
MouseButton1Click:Connect(function()if not ar then return end be()end)a6.
MouseEnter:Connect(function()bd=true end)a6.MouseLeave:Connect(function()bd=
false end)af.InputEnded:Connect(function(bf)if bf.UserInputType==Enum.
UserInputType.MouseButton1 and bc and not bd then be()end end)local bf,bg,bh,bi,
bj=j,ad,workspace.CurrentCamera,'Glass',{}local bk,bl=(bg:GenerateGUID(true))for
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
RenderStepped:Connect(br)function e:GlobalSetting(bs)ar=true local bt,bu={},
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
bx.Padding.Offset,waitTime=1}local bA={checkIn=c(by,TweenInfo.new(bz.duration,bz
.easingStyle),{Size=UDim2.new(by.Size.X.Scale,bz.checkSizeIncrease,by.Size.Y.
Scale,by.Size.Y.Offset)}),checkOut=c(by,TweenInfo.new(bz.duration,bz.easingStyle
),{Size=UDim2.new(by.Size.X.Scale,bz.checkSizeDecrease,by.Size.Y.Scale,by.Size.Y
.Offset)}),nameIn=c(bw,TweenInfo.new(bz.duration,bz.easingStyle),{
TextTransparency=bz.transparencyIn}),nameOut=c(bw,TweenInfo.new(bz.duration,bz.
easingStyle),{TextTransparency=bz.transparencyOut})}local bB,bC=function(bB)if
not bB then bA.checkOut:Play()bA.nameOut:Play()by:GetPropertyChangedSignal
'AbsoluteSize':Connect(function()if by.AbsoluteSize.X<=0 then by.
TextTransparency=1 end end)else bA.checkIn:Play()bA.nameIn:Play()by:
GetPropertyChangedSignal'AbsoluteSize':Connect(function()if by.AbsoluteSize.X>0
then by.TextTransparency=0 end end)end end,bs.Default bB(bC)bu.MouseButton1Click
:Connect(function()bC=not bC bB(bC)task.spawn(function()if bs.Callback then bs.
Callback(bC)end end)end)function bt:UpdateName(bD)bw.Text=bD end function bt:
UpdateState(bD)bB(bD)bC=bD end return bt end function e:TabGroup()local bs,bt={}
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
EasingStyle.Sine}local b3,b4=function(b3)if b3=='Idle'then c(b0,TweenInfo.new(
0.2,b2.EasingStyle),{TextTransparency=b2.DefaultTransparency}):Play()c(b1,
TweenInfo.new(0.2,b2.EasingStyle),{ImageTransparency=b2.DefaultTransparency}):
Play()elseif b3=='Hover'then c(b0,TweenInfo.new(0.2,b2.EasingStyle),{
TextTransparency=b2.HoverTransparency}):Play()c(b1,TweenInfo.new(0.2,b2.
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
DisabledPosition pcall(function()c(b1,b6.Info,{ImageTransparency=ca[1]}):Play()
end)pcall(function()c(b3,b6.Info,{ImageTransparency=ca[2]}):Play()end)pcall(
function()c(b3,b6.Info,{Position=cb}):Play()end)bZ.State=b8 if b9 then pcall(b9,
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
AbsoluteSize.X,b0.AbsoluteSize.X,b1.AbsoluteSize.X local cj=(ci-(cf+cg+ch+20))/m
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
.X local cf=(ce-cd-20)/m.Scale b9.MaxSize=Vector2.new(cf,9e9)end cd()b8:
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
~=ck then c(cq.Checkmark,TweenInfo.new(cj.duration,cj.easingStyle),{Size=UDim2.
new(cq.Checkmark.Size.X.Scale,cj.checkSizeDecrease,cq.Checkmark.Size.Y.Scale,cq.
Checkmark.Size.Y.Offset)}):Play()c(cq.NameLabel,TweenInfo.new(cj.duration,cj.
easingStyle),{TextTransparency=cj.transparencyOut}):Play()cq.Checkmark.
TextTransparency=1 end end b_={ck}bZ.Value=b_[1]end c(cn,TweenInfo.new(cj.
duration,cj.easingStyle),{Size=UDim2.new(cn.Size.X.Scale,cj.checkSizeIncrease,cn
.Size.Y.Scale,cn.Size.Y.Offset)}):Play()c(co,TweenInfo.new(cj.duration,cj.
easingStyle),{TextTransparency=cj.transparencyIn}):Play()cn.TextTransparency=0
else if bZ.Settings.Multi then local cp=table.find(b_,ck)if cp then table.
remove(b_,cp)end else b_={}end c(cn,TweenInfo.new(cj.duration,cj.easingStyle),{
Size=UDim2.new(cn.Size.X.Scale,cj.checkSizeDecrease,cn.Size.Y.Scale,cn.Size.Y.
Offset)}):Play()c(co,TweenInfo.new(cj.duration,cj.easingStyle),{TextTransparency
=cj.transparencyOut}):Play()cn.TextTransparency=1 end if bX.Required and#b_==0
and not cl then return end if#b_>0 then b4.Text=bZ.Settings.Name..' \u{2022} '..
table.concat(b_,', ')else b4.Text=bZ.Settings.Name..'...'end end,false,false
local cn=function()if cm then return end cm=true local cn,co=38,not cl local cp=
co and UDim2.new(1,0,0,cg())or UDim2.new(1,0,0,cn)local cq,cr=c(b1,TweenInfo.
new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=cp}),c(b7,
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
waitTime=1}local cw,cx={checkIn=c(cu,TweenInfo.new(cv.duration,cv.easingStyle),{
Size=UDim2.new(cu.Size.X.Scale,cv.checkSizeIncrease,cu.Size.Y.Scale,cu.Size.Y.
Offset)}),checkOut=c(cu,TweenInfo.new(cv.duration,cv.easingStyle),{Size=UDim2.
new(cu.Size.X.Scale,cv.checkSizeDecrease,cu.Size.Y.Scale,cu.Size.Y.Offset)}),
nameIn=c(cs,TweenInfo.new(cv.duration,cv.easingStyle),{TextTransparency=cv.
transparencyIn}),nameOut=c(cs,TweenInfo.new(cv.duration,cv.easingStyle),{
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
.Parent=dt dt.Parent=b9 b9.Parent=b7 b7.Parent=j local dy,dz,dA,dB,dC,dD,dE,dF,
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
d0.Parent=j d0.Visible=false return d0 end local d1=function(d1)local d2,d3,d4,
d5,d6=d0(),d1 and 0 or 1,d1 and 1 or 0.95,d1 and 1 or 0,TweenInfo.new(0.1,Enum.
EasingStyle.Sine)local d7,d8=c(d2,d6,{GroupTransparency=d3}),c(ca,d6,{Scale=d4})
b7.Visible=true b7.Parent=d2 d2.Visible=true d2.GroupTransparency=d5 d7:Play()d8
:Play()d7.Completed:Wait()if not d1 then b7.Visible=false d2.Visible=false end
b7.Parent=j d2:Destroy()end local d2,d3=function()d1(true)end,function()d1(false
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
local bQ=function()local bQ=0.15 if as then as.Parent=nil end for bR,bS in
pairs(ak)do c(bR,TweenInfo.new(bQ,Enum.EasingStyle.Sine),{BackgroundTransparency
=(bR==bA and 0.98 or 1)}):Play()if bS.tabStroke then c(bS.tabStroke,TweenInfo.
new(bQ,Enum.EasingStyle.Sine),{Transparency=(bR==bA and 0.95 or 1)}):Play()end
if bS.switcherImage then c(bS.switcherImage,TweenInfo.new(bQ,Enum.EasingStyle.
Sine),{ImageTransparency=(bR==bA and 0.1 or 0.5)}):Play()end if bS.switcherName
then c(bS.switcherName,TweenInfo.new(bQ,Enum.EasingStyle.Sine),{TextTransparency
=(bR==bA and 0.1 or 0.5)}):Play()end end ak[bA].tabContent.Parent=aI as=ak[bA].
tabContent a5.Text=by.Name end bA.MouseButton1Click:Connect(function()bQ()end)
function bz:Select()bQ()end function bz:InsertConfigSection(bR)local bS=bz:
Section{Side='Left'}if ai then bS:Label{Text=
'Config system unavailable. (Environment isStudio)'}return
'Config system unavailable.'end local bT,bU bS:Input{Name='Config Name',
Placeholder='Name',AcceptedCharacters='All',Callback=function(bV)bT=bV end}local
bV=bS:Dropdown{Name='Select Config',Multi=false,Required=false,Options=aa:
RefreshConfigList(),Callback=function(bV)bU=bV end}bS:Button{Name=
'Create Config',Callback=function()if not bT or string.gsub(bT,' ','')==''then e
:Notify{Title='Interface',Description='Config name cannot be empty.'}return end
local bW,bX=aa:SaveConfig(bT)if not bW then e:Notify{Title='Interface',
Description='Unable to save config, return error: '..bX}end e:Notify{Title=
'Interface',Description=string.format('Created config %q',bT)}bV:ClearOptions()
bV:InsertOptions(aa:RefreshConfigList())end}bS:Button{Name='Load Config',
Callback=function()local bW,bX=aa:LoadConfig(bV.Value)if not bW then e:Notify{
Title='Interface',Description='Unable to load config, return error: '..bX}return
end e:Notify{Title='Interface',Description=string.format('Loaded config %q',bV.
Value)}end}bS:Button{Name='Overwrite Config',Callback=function()local bW,bX=aa:
SaveConfig(bV.Value)if not bW then e:Notify{Title='Interface',Description=
'Unable to overwrite config, return error: '..bX}return end e:Notify{Title=
'Interface',Description=string.format('Overwrote config %q',bV.Value)}end}bS:
Button{Name='Refresh Config List',Callback=function()bV:ClearOptions()bV:
InsertOptions(aa:RefreshConfigList())end}local bW bS:Button{Name=
'Set as autoload',Callback=function()local bX=bV.Value writefile(aa.Folder..
'/settings/autoload.txt',bX)bW:UpdateName('Autoload config: '..bX)e:Notify{Title
='Interface',Description=string.format('Set %q as autoload',bX)}end}bW=bS:Label{
Text='Autoload config: None'}if isfile(aa.Folder..'/settings/autoload.txt')then
local bX=readfile(aa.Folder..'/settings/autoload.txt')bW:UpdateName(
'Autoload config: '..bX)end end ak[bA]={tabContent=bH,tabStroke=bC,switcherImage
=bE,switcherName=bF}return bz end return bs end local bs=function()if
setthreadidentity then pcall(setthreadidentity,7)elseif set_thread_identity then
pcall(set_thread_identity,7)elseif setidentity then pcall(setidentity,7)elseif
syn and syn.set_thread_identity then pcall(syn.set_thread_identity,7)end end
function e:Notify(bt)bs()local bu={}local bv,bw=pcall(function()local bv=
Instance.new'Frame'bv.Name='Notification'bv.AnchorPoint=Vector2.new(0.5,0.5)bv.
AutomaticSize=Enum.AutomaticSize.Y bv.BackgroundColor3=Color3.fromRGB(15,15,15)
bv.BorderColor3=Color3.fromRGB(0,0,0)bv.BorderSizePixel=0 bv.Position=UDim2.
fromScale(0.5,0.5)bv.Size=UDim2.fromOffset(bt.SizeX or 250,0)bv.Parent=g local
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
PaddingTop=UDim.new(0,6)bH.Parent=bF bF.Parent=bv local bI,bJ={In=c(by,TweenInfo
.new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Scale=bt.Scale
or 1}),Out=c(by,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
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
return bu end function e:Dialog(bt)local bu,bv={},Instance.new'CanvasGroup'bv.
Name='DialogCanvas'bv.BackgroundColor3=Color3.fromRGB(255,255,255)bv.
BackgroundTransparency=1 bv.BorderColor3=Color3.fromRGB(0,0,0)bv.BorderSizePixel
=0 bv.Size=UDim2.fromScale(1,1)bv.GroupTransparency=1 bv.Parent=j local bw=
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
local bL,bM,bN,bO=c(bv,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{
GroupTransparency=0}),c(bv,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{
GroupTransparency=1}),c(bz,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Scale=1}),
c(bz,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Scale=0.95})local bP,bQ=function(
)bL:Play()bN:Play()bL.Completed:Wait()bw.Parent=j end,function()if not bw.Parent
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
EasingStyle=Enum.EasingStyle.Sine}local bX=function(bX)if bX=='Idle'then c(bT,
TweenInfo.new(0.2,bW.EasingStyle),{BackgroundTransparency=bW.DefaultTransparency
,TextTransparency=bW.DefaultTransparency2}):Play()elseif bX=='Hover'then c(bT,
TweenInfo.new(0.2,bW.EasingStyle),{BackgroundTransparency=bW.HoverTransparency,
TextTransparency=bW.HoverTransparency2}):Play()end end bT.MouseButton1Click:
Connect(function()if bv.GroupTransparency~=0 then return end local bY,bZ=pcall(
function()if bS.Callback then bS.Callback()end end)bQ()if not bY then warn(
'[Dialog] Button callback error: '..tostring(bZ))end end)bT.MouseEnter:Connect(
function()bX'Hover'end)bT.MouseLeave:Connect(function()bX'Idle'end)end bP()
function bu:UpdateTitle(bR)bE.Text=bR end function bu:UpdateDescription(bR)bG.
Text=bR end function bu:Cancel()bQ()end return bu end function e:
SetNotificationsState(bt)g.Visible=bt end function e:GetNotificationsState(bt)
return g.Visible end function e:SetState(bt)ap=bt j.Visible=bt end function e:
GetState()return ap end local bt function e:Unload()if bt then bt()end f:
Destroy()am=true end function e.onUnloaded(bu)bt=bu end local bu=d.Keybind or
Enum.KeyCode.RightControl local bv=function()local bv=not e:GetState()e:
SetState(bv)e:Notify{Title=d.Title,Description=(bv and'Maximized 'or'Minimized '
)..'the menu. Use '..tostring(bu.Name)..' to toggle it.',Lifetime=5}end af.
InputEnded:Connect(function(bw,bx)if bx then return end if bw.KeyCode==bu then
bv()end end)B.MouseButton1Click:Connect(bv)y.MouseButton1Click:Connect(function(
)e:Dialog{Title=d.Title,Description=
[[Are you sure you want to exit the menu? You will lose any unsaved configurations.]]
,Buttons={{Name='Confirm',Callback=function()e:Unload()end},{Name='Cancel'}}}end
)function e:SetKeybind(bw)bu=bw end function e:SetAcrylicBlurState(bw)aq=bw j.
BackgroundTransparency=bw and 0.05 or 0 end function e:GetAcrylicBlurState()
return aq end local bw,bx=function(bw)if bw then au.Image=(at and _)or
'rbxassetid://0'aB.Text='@'..aj.Name ay.Text=aj.DisplayName else au.Image=an.
userInfoBlurred local bx,by=#aj.Name,#aj.DisplayName aB.Text='@'..string.rep('.'
,bx)ay.Text=string.rep('.',by)end end if d.ShowUserInfo~=nil then bx=d.
ShowUserInfo else bx=true end bw(bx)function e:SetUserInfoState(by)bw(by)end
function e:GetUserInfoState(by)return bx end function e:SetSize(by)j.Size=by end
function e:GetSize(by)return j.Size end function e:SetScale(by)m.Scale=by end
function e:GetScale()return m.Scale end local by,bz={Toggle={Save=function(by,bz
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
local bC,bD=aa:LoadConfig(bB)if not bC then pcall(function()e:Notify{Title=
'Interface',Description='Error loading autoload config: '..tostring(bD)}end)
warn(string.format('[MacLib] L\u{1ed7}i khi n\u{1ea1}p autoload config %q: %s',
bB,tostring(bD)))return end print(string.format(
'[MacLib] N\u{1ea1}p autoload config th\u{e0}nh c\u{f4}ng: %q',bB))pcall(
function()e:Notify{Title='Interface',Description=string.format(
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
table.insert(bB,bH)end end end end return bB end f.Enabled=false local bA={}for
bB,bC in pairs(an)do table.insert(bA,bC)end ae:PreloadAsync(bA)f.Enabled=true ap
=true return e end function aa:Demo()local at=aa:Window{Title='Maclib Demo',
Subtitle='This is a subtitle.',Size=UDim2.fromOffset(868,650),DragStyle=1,
DisabledWindowControls={},ShowUserInfo=true,Keybind=Enum.KeyCode.RightControl,
AcrylicBlur=true}local au,av={UIBlurToggle=at:GlobalSetting{Name='UI Blur',
Default=at:GetAcrylicBlurState(),Callback=function(au)at:SetAcrylicBlurState(au)
at:Notify{Title=at.Settings.Title,Description=(au and'Enabled'or'Disabled')..
' UI Blur',Lifetime=5}end},NotificationToggler=at:GlobalSetting{Name=
'Notifications',Default=at:GetNotificationsState(),Callback=function(au)at:
SetNotificationsState(au)at:Notify{Title=at.Settings.Title,Description=(au and
'Enabled'or'Disabled')..' Notifications',Lifetime=5}end},ShowUserInfo=at:
GlobalSetting{Name='Show User Info',Default=at:GetUserInfoState(),Callback=
function(au)at:SetUserInfoState(au)at:Notify{Title=at.Settings.Title,Description
=(au and'Showing'or'Redacted')..' User Info',Lifetime=5}end}},{TabGroup1=at:
TabGroup()}local aw={Main=av.TabGroup1:Tab{Name='Demo',Image=
'rbxassetid://18821914323'},Settings=av.TabGroup1:Tab{Name='Settings',Image=
'rbxassetid://10734950309'}}local ax={MainSection1=aw.Main:Section{Side='Left'}}
ax.MainSection1:Header{Name='Header #1'}ax.MainSection1:Button{Name='Button',
Callback=function()at:Dialog{Title=at.Settings.Title,Description=
[[Lorem ipsum odor amet, consectetuer adipiscing elit. Eros vestibulum aliquet mattis, ex platea nunc.]]
,Buttons={{Name='Confirm',Callback=function()print'Confirmed!'end},{Name=
'Cancel'}}}end}ax.MainSection1:Input({Name='Input',Placeholder='Input',
AcceptedCharacters='All',Callback=function(ay)at:Notify{Title=at.Settings.Title,
Description='Successfully set input to '..ay}end,onChanged=function(ay)print(
'Input is now '..ay)end},'Input')ax.MainSection1:Slider({Name='Slider',Default=
50,Minimum=0,Maximum=100,DisplayMethod='Percent',Precision=0,Callback=function(
ay)print('Changed to '..ay)end},'Slider')ax.MainSection1:Toggle({Name='Toggle',
Default=false,Callback=function(ay)at:Notify{Title=at.Settings.Title,Description
=(ay and'Enabled 'or'Disabled ')..'Toggle'}end},'Toggle')ax.MainSection1:
Keybind({Name='Keybind',Blacklist=false,Callback=function(ay)at:Notify{Title=
'Demo Window',Description='Pressed keybind - '..tostring(ay.Name),Lifetime=3}end
,onBinded=function(ay)at:Notify{Title='Demo Window',Description=
'Successfully Binded Keybind to - '..tostring(ay.Name),Lifetime=3}end},'Keybind'
)ax.MainSection1:Colorpicker({Name='Colorpicker',Default=Color3.fromRGB(0,255,
255),Callback=function(ay)print('Color: ',ay)end},'Colorpicker')local ay,az,aA,
aB=ax.MainSection1:Colorpicker({Name='Transparency Colorpicker',Default=Color3.
fromRGB(255,0,0),Alpha=0,Callback=function(ay,az)print('Color: ',ay,' Alpha: ',
az)end},'TransparencyColorpicker'),0 ax.MainSection1:Toggle({Name='Rainbow',
Default=false,Callback=function(aC)aA=aC if aA then aB=game:GetService
'RunService'.RenderStepped:Connect(function(aD)az=(az+aD*0.1)%1 ay:SetColor(
Color3.fromHSV(az,1,1))end)elseif aB then aB:Disconnect()aB=nil end end},
'RainbowToggle')local aC={'Apple','Banana','Orange','Grapes','Pineapple','Mango'
,'Strawberry','Blueberry','Watermelon','Peach'}local aD,aE=ax.MainSection1:
Dropdown({Name='Dropdown',Multi=false,Required=true,Options=aC,Default=1,
Callback=function(aD)print('Dropdown changed: '..aD)end},'Dropdown'),ax.
MainSection1:Dropdown({Name='Multi Dropdown',Search=true,Multi=true,Required=
false,Options=aC,Default={'Apple','Orange'},Callback=function(aD)local aE={}for
aF,aG in next,aD do table.insert(aE,aF)end print('Mutlidropdown changed:',table.
concat(aE,', '))end},'MultiDropdown')ax.MainSection1:Button{Name=
'Update Selection',Callback=function()aD:UpdateSelection'Grapes'aE:
UpdateSelection{'Banana','Pineapple'}end}ax.MainSection1:Divider()ax.
MainSection1:Header{Text='Header #2'}ax.MainSection1:Paragraph{Header=
'Paragraph',Body=
[[Paragraph body. Lorem ipsum odor amet, consectetuer adipiscing elit. Morbi tempus netus aliquet per velit est gravida.]]
}ax.MainSection1:Label{Text=
'Label. Lorem ipsum odor amet, consectetuer adipiscing elit.'}ax.MainSection1:
SubLabel{Text=
[[Sub-Label. Lorem ipsum odor amet, consectetuer adipiscing elit.]]}aa:SetFolder
'Maclib'aw.Settings:InsertConfigSection'Left'at.onUnloaded(function()print
'Unloaded!'end)aw.Main:Select()aa:LoadAutoLoadConfig()end return aa end function
a.i()local aa,ab={}function aa:SetWindow(ac)ab=ac end function aa.Notify(ac,ad,
ae)ae=ae or 3 if ab then local af=pcall(function()ab:Notify{Title=ac,Description
=ad,Lifetime=ae}end)if af then return end end pcall(function()game:GetService
'StarterGui':SetCore('SendNotification',{Title=ac,Text=ad,Duration=ae})end)end
return aa end function a.j()local aa,ab,ac,ad,ae,af,ag=a.load'h',a.load'i',{},
false,false,false function ac.Suspend()ae=true ad=false end function ac.Resume()
ae=false end function ac.SetRecording(ah)af=ah and true or false end function ac
.IsRecording()return af end function ac.IsSuspended()if ae or(aa.LoadingConfig==
true)or af then return true end local ah,ai=pcall(require,
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
a.k()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'h',a.load'j',a.load'c',{},{Mob={Min
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
end end return ad end function a.l()local aa,ab,ac,ad,ae=a.load'a',a.load'b',a.
load'd',a.load'g',a.load'k'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au
,av,aw=aa.RunService or game:GetService'RunService',aa.player,{},true,false,{},
1.8,Color3.fromRGB(0,255,170),Color3.fromRGB(255,35,35),0.45,0.2,0.2,(game:
GetService'Players')local ax,ay,az,aA=function()local ax=ag or ar.LocalPlayer if
not ax then return nil end local ay=ax.Character if not ay or not ay.Parent then
return nil end local az=ay:FindFirstChildOfClass'Humanoid'if az and az.Health<=0
then return nil end return ay:FindFirstChild'HumanoidRootPart'or ay.PrimaryPart
end,function(ax)if not ax then return 0 end return ax.Position.Y-2.5 end,
function(ax)if av then if av.Parent~=ax or not av:IsDescendantOf(workspace)then
pcall(function()av:Destroy()end)av=nil else if av.Adornee~=ax then av.Adornee=ax
end return av end end if not ax or not ax.Parent then return nil end local ay=
Instance.new'CylinderHandleAdornment'ay.Name='Player_2D_HitboxVisual'ay.Adornee=
ax ay.Radius=al ay.Height=aq ay.Color3=aj and an or am ay.Transparency=aj and ap
or ao ay.ZIndex=5 ay.AlwaysOnTop=false ay.Visible=ai ay.Parent=ax av=ay return
ay end,function(ax)if not av or not av.Parent then return end av.Color3=ax and
an or am av.Transparency=ax and ap or ao end local aB=function()local aB=ax()if
not aB or not aB.Parent then if av and av.Parent then av.Visible=false end if aj
then aj=false as=nil at=nil for aC,aD in ipairs(ak)do pcall(aD,false,nil,nil)end
end return end local aC=az(aB)if aC and aC.Parent then aC.Visible=ai aC.Radius=
al local aD=ay(aB)local aE=CFrame.new(Vector3.new(aB.Position.X,aD,aB.Position.Z
))*CFrame.Angles(math.rad(90),0,0)aC.CFrame=aB.CFrame:ToObjectSpace(aE)end if ae
.IsActiveHazardScannerEnabled and not ae.IsActiveHazardScannerEnabled()then if
aj then aj=false as=nil at=nil aA(false)for aD,aE in ipairs(ak)do pcall(aE,false
,nil,nil)end end return end local aD=Vector3.new(aB.Position.X,0,aB.Position.Z)
local aE,aF,aG=ac.IsPointInAnyHazard(aD,nil,al)local aH,aI=false if not aE and
ad.IsPointInAnyTrajectory then aH,aI=ad.IsPointInAnyTrajectory(aD,al)end local
aJ,aK,aL=(aE or aH),aF or aI,aE and'Ground Zone'or(aH and'Trajectory Corridor'or
nil)if aJ~=aj or aK~=as then aj=aJ as=aK at=aL aA(aJ)for aM,aN in ipairs(ak)do
pcall(aN,aJ,aK,aL)end end end local aC=function()if not au then au=af.Heartbeat:
Connect(aB)end end function ah.Cleanup()if au then au:Disconnect()au=nil end if
av then pcall(function()av:Destroy()end)av=nil end aj=false as=nil at=nil end
function ah.IsPlayerInDanger()return aj,as,at end function ah.GetCurrentThreat()
return as,at end function ah.OnDangerStatusChanged(aD)if type(aD)=='function'
then table.insert(ak,aD)end end function ah.SetVisualEnabled(aD)ai=aD and true
or false if av then av.Visible=ai end end function ah.IsVisualEnabled()return ai
end function ah.SetRadius(aD)if type(aD)=='number'and aD>=0.1 then al=aD if av
and av.Parent then av.Radius=al end end end function ah.GetRadius()return al end
local aD=function()local aD=ag or ar.LocalPlayer if not aD then return end local
aE=function(aE)if av then pcall(function()av:Destroy()end)av=nil end task.spawn(
function()local aF=aE:WaitForChild('Humanoid',3)if aF then aF.Died:Connect(
function()if av then av.Visible=false end end)end end)end aw=aD.CharacterAdded:
Connect(aE)if aD.Character then aE(aD.Character)end end aD()aC()ab.Register(
function()if aw then aw:Disconnect()aw=nil end ah.Cleanup()end)return ah end
function a.m()local aa,ab,ac={},{},8 for ad=1,ac do local ae=(ad-1)*(2*math.pi/
ac)ab[ad]=Vector3.new(math.cos(ae),0,math.sin(ae))end local ad,ae={},16 for af=1
,ae do local ag=(af-1)*(2*math.pi/ae)ad[af]=Vector3.new(math.cos(ag),0,math.sin(
ag))end local af,ag,ah={1.5,3,5,8,12,18,25},{1.5,3,4.5,6,8,10.5,13.5,17,21,26,32
,38,45},{1.5,3,4.5,6,8,10.5,13.5,17,21,26,32,38,45,50,55}aa.COARSE_DIRECTIONS=ab
aa.FINE_DIRECTIONS=ad aa.COARSE_RADII=af aa.FINE_RADII=ag aa.FALLBACK_RADII=ah
function aa.SamplePass(ai,aj,ak,al,am,an,ao,ap)local aq,ar,as,at,au=math.huge,
Vector3.zero,false,aj if ap and ap.Magnitude>0.1 then local av=Vector3.new(ap.X,
0,ap.Z).Unit at=table.clone(aj)table.sort(at,function(aw,ax)local ay,az=aw.X*av.
X+aw.Z*av.Z,ax.X*av.X+ax.Z*av.Z return ay>az end)end for av,aw in ipairs(ak)do
local ax=false for ay,az in ipairs(at)do local aA=ai+az*aw local aB=an(aA)if ao
then table.insert(ao,{pos=aA,isSafe=aB,isChosen=false})end if aB then local aC=
aA if am and al>0 then local aD=aA+az*al if an(aD)then aC=aD end end local aD=(
aC-ai).Magnitude if aD<aq then aq=aD au=aC ar=az ax=true end end end if ax and
au then as=true break end end return au,as,aq,ar end return aa end function a.n(
)local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am=Color3.fromRGB(0,255,120),Color3.
fromRGB(0,255,150),Color3.fromRGB(255,255,255),Color3.fromRGB(0,235,140),Color3.
fromRGB(255,60,60),0.2,1.4,0.45,{},{}local an,ao=function(an)if not an then
return end if not ak or not ak.Parent then if ak then pcall(function()ak:
Destroy()end)end local ao=Instance.new'CylinderHandleAdornment'ao.Name=
'SafeSpot_OuterMarker'ao.Adornee=an ao.Radius=ag ao.Height=af ao.Color3=aa ao.
Transparency=0.35 ao.ZIndex=6 ao.AlwaysOnTop=false ao.Visible=false ao.Parent=an
ak=ao end if not al or not al.Parent then if al then pcall(function()al:Destroy(
)end)end local ao=Instance.new'CylinderHandleAdornment'ao.Name=
'SafeSpot_CenterDot'ao.Adornee=an ao.Radius=ah ao.Height=af+0.05 ao.Color3=ac ao
.Transparency=0.15 ao.ZIndex=7 ao.AlwaysOnTop=false ao.Visible=false ao.Parent=
an al=ao end if not am or not am.Parent then if am then pcall(function()am:
Destroy()end)end local ao=Instance.new'LineHandleAdornment'ao.Name=
'SafeSpot_EscapeLine'ao.Adornee=an ao.Color3=ab ao.Thickness=3.5 ao.Transparency
=0.2 ao.ZIndex=6 ao.AlwaysOnTop=false ao.Visible=false ao.Parent=an am=ao end
end,function(an,ao)local ap=aj[an]if not ap then local aq=Instance.new
'CylinderHandleAdornment'aq.Name='SafeSpot_CandidateDot_'..an aq.Adornee=ao aq.
Radius=0.25 aq.Height=af aq.ZIndex=4 aq.AlwaysOnTop=false aq.Visible=false aq.
Parent=ao local ar=Instance.new'LineHandleAdornment'ar.Name=
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
function()ar.line:Destroy()end)end end table.clear(aj)end return ai end end
local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'a',a.load'c',a.load'b',a.load'd',a.load
'g',a.load'l',a.load'm',a.load'n',a.load'k'local aj,ak,al,am,an,ao,ap,aq,ar,as,
at,au,av,aw,ax,ay,az,aA,aB,aC=aa.RunService or game:GetService'RunService',game:
GetService'Players',aa.player,{},true,true,true,true,false,2,0,false,{},{},0
local aD,aE,aF=function()local aD=al or ak.LocalPlayer if not aD then return nil
end local aE=aD.Character if not aE or not aE.Parent then return nil end local
aF=aE:FindFirstChildOfClass'Humanoid'if aF and aF.Health<=0 then return nil end
return aE:FindFirstChild'HumanoidRootPart'or aE.PrimaryPart end,function(aD)
local aE=al or ak.LocalPlayer if not aE then return nil end local aF=aE.
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
am.Clear()end)end aH()ac.Register(function()am.Cleanup()end)return am