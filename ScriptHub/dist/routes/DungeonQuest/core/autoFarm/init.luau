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
,N,O,P,Q=function()for A=#z,1,-1 do pcall(z[A])end end,{},'unknown',true,{},{},{
},0,4,false local R=function(R)if R then table.insert(G,R)end return R end
function h.OnRespawn(S)table.insert(F,S)end function h.GetLastRespawnTime()
return H end function h.GetRespawnProtectionDuration()return I end function h.
SetRespawnProtectionDuration(S)if type(S)=='number'and S>=0 then I=S end end
function h.GetRespawnProtectionRemaining()if H==0 then return 0 end local S=os.
clock()-H local T=I-S return math.max(0,T)end function h.IsJustRespawned(S)local
T=S or I if H==0 then return false end return(os.clock()-H)<=T end function h.
WasDead()return J end function h.IsDead()local S=d and d.Character if not S or
not S.Parent then return true end local T=S:FindFirstChildOfClass'Humanoid'if
not T or T.Health<=0 then return true end return false end function h.
IsInvulnerable()local S=d and d.Character if not S or not S.Parent then return
false,nil end local T=S:FindFirstChildOfClass'Humanoid'if T and T.Health<=0 then
return false,nil end local U=S:FindFirstChildOfClass'ForceField'if U and U.
Visible~=false then return true,'ForceField'end local V,W,X=S:GetAttribute
'Invulnerable',S:GetAttribute'Immune',S:GetAttribute'Respawning'if V==true or W
==true or X==true then return true,'Attribute'end local Y,Z,_=S:FindFirstChild
'Invulnerable',S:FindFirstChild'Immune',S:FindFirstChild'Respawning'if(Y and Y:
IsA'BoolValue'and Y.Value==true)or(Z and Z:IsA'BoolValue'and Z.Value==true)or(_
and _:IsA'BoolValue'and _.Value==true)then return true,'Value'end local aa=h.
GetRespawnProtectionRemaining()if aa>0 then return true,(
'Respawn Shield (%.1fs)'):format(aa)end return false,nil end local aa=function(
aa)if not aa or not aa:IsA'Model'then return nil end local S=aa:FindFirstChild
'HumanoidRootPart'if S and S:IsA'BasePart'then return S end if aa.PrimaryPart
and aa.PrimaryPart:IsA'BasePart'then return aa.PrimaryPart end for T,U in
ipairs(aa:GetDescendants())do if U:IsA'BasePart'then return U end end return nil
end local S,T=function(S)if not S or not S:IsA'Model'or not S.Parent or S==d.
Character then return false end local T=S:FindFirstChildOfClass'Humanoid'if not
T or T.Health<=0 then return false end return aa(S)~=nil end,function(S)local T=
w[S]if not T then return end if T.Died then T.Died:Disconnect()T.Died=nil end w[
S]=nil end local U,V=function(U)if not U or not u[U]then return end x[U]=nil u[U
]=nil y-=1 T(U)A()O()end,function(U)if not dungeon or not U then return nil end
local V=U.Parent while V do if V==dungeon then return nil end if V.Parent==
dungeon and(V:IsA'Folder'or V:IsA'Model')then return V end V=V.Parent end return
nil end local W=function(W)if not S(W)or u[W]then return end local X,Y=aa(W),W:
FindFirstChildOfClass'Humanoid'if not X or not Y then return end u[W]={Model=W,
Root=X,Humanoid=Y,Room=V(W)}y+=1 w[W]={Died=Y.Died:Connect(function()U(W)end)}A(
)O()end local X=function(X)if not X then return end if S(X)then W(X)return end
if x[X]then return end x[X]=true task.spawn(function()local Y=os.clock()+2 while
X.Parent and os.clock()<Y do if S(X)then x[X]=nil W(X)return end task.wait(0.03)
end x[X]=nil if X.Parent and S(X)then W(X)end end)end local Y=function(Y)if not
Y or t[Y]then return end t[Y]=true for Z,_ in ipairs(Y:GetDescendants())do if _:
IsA'Model'and S(_)then W(_)end end v[Y]={Added=Y.DescendantAdded:Connect(
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
pairs(u)do T(Z)end u={}y=0 x={}dungeon=nil end L=function()for Z,_ in pairs(u)do
if not Z or not Z.Parent then U(Z)else local ab=_.Humanoid or Z:
FindFirstChildOfClass'Humanoid'_.Humanoid=ab if not ab or ab.Health<=0 then U(Z)
else local ac=_.Root if not ac or not ac.Parent then ac=aa(Z)if ac then _.Root=
ac else U(Z)end end end end end end function h.SetFastSpeed(ab)j=ab if i and
humanoid and humanoid.Parent then if humanoid.WalkSpeed<j then m=true humanoid.
WalkSpeed=j m=false end end end function h.SetSpeedEnabled(ab)i=ab if humanoid
and humanoid.Parent then m=true if i then if humanoid.WalkSpeed<j then humanoid.
WalkSpeed=j end else humanoid.WalkSpeed=k end m=false end end function h.
IsSpeedEnabled()return i end function h.GetFastSpeed()return j end function h.
SetInstantAccelEnabled(ab)l=ab and true or false end function h.
IsInstantAccelEnabled()return l end local ab=function()if P then P:Disconnect()P
=nil end if not humanoid or not humanoid.Parent then return end P=humanoid:
GetPropertyChangedSignal'WalkSpeed':Connect(function()if m then return end if
not humanoid or not humanoid.Parent then return end local ab=humanoid.WalkSpeed
if i then if ab<j then m=true humanoid.WalkSpeed=j m=false end else k=ab end end
)end function h.SetHumanoid(ac)if not ac then return end local Z=ac:
WaitForChild('Humanoid',10)if not Z then return end humanoid=Z rootPart=ac:
WaitForChild('HumanoidRootPart',10)or ac.PrimaryPart k=humanoid.WalkSpeed if i
and humanoid.WalkSpeed<j then m=true humanoid.WalkSpeed=j m=false end if Q then
Q:Disconnect()Q=nil end Q=humanoid.Died:Connect(function()J=true end)R(humanoid.
HealthChanged:Connect(function(_)if _<=0 then J=true elseif J and _>0 then J=
false end end))end local ac=function()if not c.IsActive()then return end if not
l then return end if not humanoid or not humanoid.Parent or humanoid.Health<=0
or humanoid.Sit then return end if not rootPart or not rootPart.Parent then
local ac=d and d.Character rootPart=ac and ac:FindFirstChild'HumanoidRootPart'if
not rootPart then return end end if rootPart.Anchored then return end local ac,Z
=humanoid.MoveDirection,rootPart.AssemblyLinearVelocity if ac.Magnitude>0.05
then local _=i and math.max(j,humanoid.WalkSpeed)or humanoid.WalkSpeed rootPart.
AssemblyLinearVelocity=Vector3.new(ac.X*_,Z.Y,ac.Z*_)end end if b.RunService
then local Z=b.RunService.PreSimulation or b.RunService.Heartbeat if Z then R(Z:
Connect(ac))end end function h.GetDungeonStartTime()return dungeonStartTime end
function h.SetDungeonStartTime(Z)dungeonStartTime=Z end function h.
GetDungeonElapsed()if not dungeonStartTime then return nil end return os.clock()
-dungeonStartTime end function h.ReadyDungeon()if not dungeon and not M()then
return false end return true end function h.GetHumanoid()return humanoid end
function h.GetEnemyNames()local Z={}local _=function(_)if _ and _~=''and _~=d.
Name then Z[_]=true end end if dungeon then for ad,ae in ipairs(dungeon:
GetChildren())do if ae:IsA'Folder'or ae:IsA'Model'then for af,ag in ipairs(ae:
GetDescendants())do if ag:IsA'Model'and ag:FindFirstChildOfClass'Humanoid'then
_(ag.Name)end end end end end for ad in pairs(u)do _(ad.Name)end local ad={}for
ae in pairs(Z)do table.insert(ad,ae)end table.sort(ad)return ad end function h.
GetEnemyCount()return y end function h.GetTrackedEnemyData()local ad={}for ae,af
in pairs(u)do if af and af.Root and af.Root.Parent then ad[#ad+1]=af end end
return ad end function h.OnEnemyChanged(ad)if type(ad)~='function'then return
function()end end table.insert(z,ad)return function()for ae,af in ipairs(z)do if
af==ad then table.remove(z,ae)break end end end end function h.
GetEnemyProjectileNames()local ad,ae={},game:GetService'ReplicatedStorage'local
af=ae:FindFirstChild(f)if not af then return ad end for ag,Z in ipairs(af:
GetChildren())do local _=Z.ClassName if _=='Model'or _=='MeshPart'or _=='Part'
then ad[Z.Name]=true end end return ad end function h.GetKeyHoldTime()return e
end if d and d.Character and d.Character.Parent then h.SetHumanoid(d.Character)
ab()else local ad=d and d.CharacterAdded and task.spawn(function()local ad=d.
CharacterAdded:Wait()if ad and c.IsActive()then h.SetHumanoid(ad)ab()end end)end
if d then R(d.CharacterAdded:Connect(function(ad)local ae,af=pcall(function()if
not ad then return end H=os.clock()h.SetHumanoid(ad)ab()for ae,af in ipairs(F)do
pcall(af)end end)if not ae then warn('[Shared] respawn handler error:',tostring(
af))end end))end task.spawn(function()while c.IsActive()do task.wait(g)local ad=
workspace:FindFirstChild'dungeon'if dungeon and ad~=dungeon then N()elseif not
dungeon and ad then M()end O()end end)local ad=function()local ad=game:
GetService'Workspace'for ae,af in ipairs(ad:GetDescendants())do if af.Name==
'dungeonName'and af:IsA'ValueBase'then local ag=af.Value if type(ag)=='string'
then local Z=string.gsub(ag,'%s+','')if Z~=''and string.lower(Z)~=C then return
ag end end end end return nil end task.spawn(function()while c.IsActive()do task
.wait(g)local ae=ad()if ae~=K then K=ae if ae then h.ResetBossIndex()end for af=
#B,1,-1 do pcall(B[af],ae)end end end end)local ae=function()return not(K and#K>
0)end task.spawn(function()while c.IsActive()do task.wait(g)local af=ae()if af~=
D then D=af for ag=#E,1,-1 do pcall(E[ag],D)end end end end)task.spawn(function(
)local af,ag=pcall(function()return M()end)if not af then warn(
'[EnemyTracker] Initialization error:',ag)end end)local af,ag=0,2 task.spawn(
function()while c.IsActive()do task.wait(ag)local Z=os.clock()if Z-af<ag then
continue end af=Z if not dungeon then continue end local ah=pcall(function()for
_,ah in ipairs(dungeon:GetChildren())do if ah:IsA'Folder'or ah:IsA'Model'then
for ai,aj in ipairs(ah:GetDescendants())do if aj:IsA'Model'then X(aj)end end end
end L()end)if not ah then warn'[EnemyTracker] rescan error'end end end)function
h.IsBossActive()return n end function h.OnBossActiveChanged(ah)if type(ah)~=
'function'then return function()end end table.insert(o,ah)return function()for
ai,aj in ipairs(o)do if aj==ah then table.remove(o,ai)break end end end end
function h.GetCurrentBossIndex()return p end function h.GetCombatTargetKey()if
not n then return'Mob'end local ah=math.clamp(p,1,3)return'Boss'..tostring(ah)
end function h.ResetBossIndex()p=0 for ah=#q,1,-1 do pcall(q[ah],p)end end
function h.OnBossIndexChanged(ah)if type(ah)~='function'then return function()
end end table.insert(q,ah)return function()for ai,aj in ipairs(q)do if aj==ah
then table.remove(q,ai)break end end end end local ah=function(ah)if type(ah)~=
'string'then return 0 end local ai=string.lower(ah)local aj=string.match(ai,
'boss.*(%d+)')if aj then return 100+(tonumber(aj)or 1)end if string.find(ai,
'boss')then return 100+math.max(1,p)end local Z=string.match(ah,'^room(%d+)$')if
not Z then return 0 end return tonumber(Z)or 0 end local ai=function()if not
dungeon then return 0 end for ai,aj in pairs(u)do if aj and aj.Room then local Z
=ah(aj.Room.Name)if Z>0 then return Z end end end if n then return 100+math.max(
1,p)end return 0 end O=function()local aj=ai()if aj==r then return end r=aj for
Z=#s,1,-1 do pcall(s[Z],r)end end function h.GetCurrentRoomIndex()return r end
function h.OnRoomIndexChanged(aj)if type(aj)~='function'then return function()
end end table.insert(s,aj)return function()for Z,_ in ipairs(s)do if _==aj then
table.remove(s,Z)break end end end end function h.GetCurrentDungeonName()return
K end function h.OnDungeonNameChanged(aj)if type(aj)~='function'then return
function()end end table.insert(B,aj)return function()for Z,_ in ipairs(B)do if _
==aj then table.remove(B,Z)break end end end end function h.IsInLobby()return D
end function h.OnLobbyChanged(aj)if type(aj)~='function'then return function()
end end table.insert(E,aj)return function()for Z,_ in ipairs(E)do if _==aj then
table.remove(E,Z)break end end end end local aj,Z=function(aj)if n==aj then
return end n=aj if aj then p+=1 for Z=#q,1,-1 do pcall(q[Z],p)end end for Z=#o,1
,-1 do pcall(o[Z],n)end O()end local function _()if not d then return end local
ak=d:FindFirstChild'PlayerGui'if not ak then Z=nil aj(false)return end local al=
ak:FindFirstChild('bossHealth',true)if al then if al~=Z then Z=al if Z:IsA
'ScreenGui'then R(Z:GetPropertyChangedSignal'Enabled':Connect(_))elseif Z:IsA
'GuiObject'then R(Z:GetPropertyChangedSignal'Visible':Connect(_))end end local
am=if al:IsA'ScreenGui'then al.Enabled elseif al:IsA'GuiObject'then al.Visible
else true aj(am)else Z=nil aj(false)end end task.spawn(function()if not d then
return end local ak=d:WaitForChild('PlayerGui',30)if not ak then return end R(ak
.DescendantAdded:Connect(_))R(ak.DescendantRemoving:Connect(_))_()while c.
IsActive()and task.wait(0.5)do _()end end)c.Register(function()if P then P:
Disconnect()P=nil end for ak,al in ipairs(G)do pcall(function()al:Disconnect()
end)end table.clear(G)N()end)return h end function a.d()local aa,ab,ac={},{},
false function aa.SetLocked(ad)ac=ad and true or false end function aa.IsLocked(
)return ac end function aa.Register(ad,ae,af)if type(ad)~='string'or type(ae)~=
'function'or type(af)~='function'then return end ab[ad]={setEnabled=ae,isEnabled
=af}end function aa.EnableExclusive(ad)if ac then return end for ae,af in pairs(
ab)do if ae~=ad and af.isEnabled()then pcall(af.setEnabled,false)end end end
function aa.IsEnabled(ad)local ae=ab[ad]return ae~=nil and ae.isEnabled()end
return aa end function a.e()local aa,ab=a.load'a',a.load'c'local ac,ad=aa.player
,{}function ad.Validate(ae)if not ae then return false end local af=ae.Model if
not af or not af.Parent or af==ac.Character then return false end local ag=ae.
Humanoid if not ag or not ag.Parent then ag=af:FindFirstChildOfClass'Humanoid'ae
.Humanoid=ag end if not ag or ag.Health<=0 then return false end local ah=ae.
Root if not ah or not ah.Parent then ah=af:FindFirstChild'HumanoidRootPart'or af
.PrimaryPart if not ah then for ai,aj in ipairs(af:GetDescendants())do if aj:IsA
'BasePart'then ah=aj break end end end if not ah then return false end ae.Root=
ah end return true end function ad.Scan()local ae,af={},ab.GetTrackedEnemyData()
for ag,ah in ipairs(af)do if ad.Validate(ah)then table.insert(ae,ah)end end
return ae end return ad end function a.f()local aa={}function aa.
SelectBestTarget(ab,ac,ad)local ae,af,ag=(math.huge)for ah,ai in ipairs(ac)do if
ad and ad()then return nil,nil,nil,nil,math.huge end local aj=ai.Root if aj and
aj.Parent then local ak=aj.Position local al,am=ak.X-ab.X,ak.Z-ab.Z local b=al*
al+am*am if b<ae then ae=b af=ai ag=ak end end end local ah=ae<math.huge and
math.sqrt(ae)or math.huge return af,nil,nil,ag,ah end return aa end function a.g
()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'f',a.load'e',{},{},1,6 function ac.
GetTarget()return ag end function ac.GetPathInstance()return ah end function ac.
GetWaypoints()return ad end function ac.GetWaypointIndex()return ae end function
ac.SetWaypointIndex(aj)ae=math.clamp(aj,1,math.max(1,#ad))end function ac.
AdvanceWaypointIndex(aj)if not ad or#ad==0 then return end local ak=ad[ae]if ak
then local al=Vector3.new(ak.Position.X-aj.X,0,ak.Position.Z-aj.Z).Magnitude if
al<=3.5 then ae=math.min(#ad+1,ae+1)end end end function ac.GetLastPathDestPos()
return ai end function ac.SetRepathThreshold(aj)if type(aj)=='number'and aj>0
then af=aj end end function ac.GetRepathThreshold()return af end function ac.
SetTarget(aj,ak,al,am)if ah and ah~=ak then pcall(function()ah:Destroy()end)end
ag=aj ah=ak ad=al or{}ae=1 ai=am end function ac.UpdatePath(aj,ak,al)if ah and
ah~=aj then pcall(function()ah:Destroy()end)end ah=aj ad=ak or{}ae=1 ai=al end
function ac.ClearTarget()if ah then pcall(function()ah:Destroy()end)end ag=nil
ah=nil ad={}ae=1 ai=nil end function ac.IsTargetValid()if not ag then return
false end return ab.Validate(ag)end function ac.NeedsRepath(aj)if not ah or not
ad or#ad==0 then return true end if not ai or not aj then return true end return
(aj-ai).Magnitude>af end function ac.Repath(aj,ak)if not ak then return false
end local al,am,b=aa.ComputePathWithCost(aj,ak)if al and#am>0 then if ah then
pcall(function()ah:Destroy()end)end ah=al ad=am ae=1 ai=ak return true end
return false end return ac end function a.h()local aa=a.load'a'local ab,ac=aa.
player,{}local ad=function(ad)local ae={}if ad then for af,ag in ipairs(ad)do if
ag and ag.Parent then table.insert(ae,ag)end end end if ab and ab.Character and
ab.Character.Parent then table.insert(ae,ab.Character)end local af=workspace:
FindFirstChild'RaycastIgnore'if af then table.insert(ae,af)end return ae end
function ac.CastRay(ae,af,ag)local ah=af-ae local ai=ah.Magnitude if ai<0.3 then
return false,nil,af end local aj=RaycastParams.new()aj.FilterType=Enum.
RaycastFilterType.Exclude aj.FilterDescendantsInstances=ad(ag)aj.IgnoreWater=
true local ak,al,am=ae,ah,8 for b=1,am do local c=workspace:Raycast(ak,al,aj)if
not c then return false,nil,af end local d=c.Instance if d and d.CanCollide and
d.CanQuery~=false then if c.Normal.Y>0.65 then local e=(c.Position-ak).Magnitude
+0.15 if e>=al.Magnitude then return false,nil,af end ak=c.Position+al.Unit*0.15
al=af-ak else return true,d,c.Position end else local e=(c.Position-ak).
Magnitude+0.15 if e>=al.Magnitude then return false,nil,af end ak=c.Position+al.
Unit*0.15 al=af-ak end end return false,nil,af end function ac.CheckClearance(ae
,af,ag)local ah,ai,aj=ac.CastRay(ae,af,ag)if ah then return true,ai,aj end local
ak=Vector3.new(af.X-ae.X,0,af.Z-ae.Z)if ak.Magnitude>0.8 then local al=ak.Unit
local am=Vector3.new(-al.Z,0,al.X)*0.6 local b,c=ae+am,af+am local d=ac.CastRay(
ae,b,ag)if not d then local e,f,g=ac.CastRay(b,c,ag)if e and(g-b).Magnitude>1
then return true,f,g end end local e,f=ae-am,af-am local g=ac.CastRay(ae,e,ag)if
not g then local h,i,j=ac.CastRay(e,f,ag)if h and(j-e).Magnitude>1 then return
true,i,j end end end return false,nil,af end function ac.ResolveDestination(ae,
af,ag,ah,ai)local aj,ak=ae,af local al,am,b,c={origin=aj,targetPos=ak,
directBlocked=false,directHitPart=nil,directHitPos=nil,chosenDest=nil,mode=
'None',nodeIdx=nil},ac.CheckClearance(aj,ak,ai)al.directBlocked=am al.
directHitPart=b al.directHitPos=c if not am then al.chosenDest=af al.mode=
'Direct'return af,'Direct',nil,al end local d=math.clamp(ah or 1,1,ag and#ag or
1)if ag and#ag>0 then for e=#ag,d,-1 do local f=ag[e]local g=f.Position local h=
g+Vector3.new(0,2,0)local i,j,k=ac.CheckClearance(aj,h,ai)if not i then al.
chosenDest=g al.mode='Waypoint'al.nodeIdx=e return g,'Waypoint',e,al end end end
al.mode='Blocked'return nil,'Blocked',nil,al end function ac.ExecuteMove(ae,af,
ag,ah,ai)if not ae or not ag then return end ae:MoveTo(ag)local aj,ak=ag.Y-af.Y,
Vector3.new(ag.X-af.X,0,ag.Z-af.Z).Magnitude if aj>1.8 and ak<=7 then ae.Jump=
true return end if ah and#ah>0 then local al=math.clamp(ai or 1,1,#ah)for am=al,
math.min(al+2,#ah)do local b=ah[am]if b then local c=Vector3.new(b.Position.X-af
.X,0,b.Position.Z-af.Z).Magnitude if c<=5 then if b.Action==Enum.
PathWaypointAction.Jump or(b.Position.Y-af.Y)>1.8 then ae.Jump=true break end
end end end end end return ac end function a.i()local aa,ab,ac,ad,ae,af,ag={},
0.85,0,2,{},64 function aa.BindDetection(ah)ag=ah or nil end function aa.
GetHazardPadding()return ac end aa.GetHitboxPadding=aa.GetHazardPadding function
aa.GetTrajectoryMargin()return ad end function aa.SetTrajectoryMargin(ah)if
type(ah)=='number'and ah>=0 and ah~=ad then ad=ah aa.InvalidateCache()for ai,aj
in ipairs(ae)do pcall(aj,ad)end end end function aa.InvalidateCache()if ag and
ag.GetActiveHazardsMap then for ah,ai in pairs(ag.GetActiveHazardsMap())do ai.
HazardZones=nil end end end function aa.OnPaddingChanged(ah)if type(ah)==
'function'then table.insert(ae,ah)end end function aa.SetHazardPadding(ah)if
type(ah)=='number'and ah>=0 and ah~=ac then ac=ah aa.InvalidateCache()for ai,aj
in ipairs(ae)do pcall(aj,ac)end end end aa.SetHitboxPadding=aa.SetHazardPadding
local ah={'firstBossCrissCross','firstBossBigSpike','firstBossSeekingSpikes'}
local ai=function(ai)if not ai or type(ai)~='string'then return false end local
aj=ai:lower():gsub('%s+','')if#aj==0 then return false end for ak,al in ipairs(
ah)do local am=al:lower():gsub('%s+','')if#am>0 and string.find(aj,am,1,true)
then return true end end return false end function aa.IsForceCircle(aj)return
ai(aj)end function aa.AddForceCircleName(aj)if type(aj)=='string'and#aj>0 then
table.insert(ah,aj)aa.InvalidateCache()end end function aa.GetForceCircleNames()
return ah end local aj,ak,al=function(aj)return aj and aj.Parent and aj.
Transparency<=ab end,function(aj,ak,al)local am,b=aj.Size,al and ad or ac if ak
or(aj:IsA'Part'and(aj.Shape==Enum.PartType.Ball or aj.Shape==Enum.PartType.
Cylinder))then return{radius=math.max(am.X,am.Y,am.Z)/2}end local c=Vector3.new(
math.max(am.X,0)/2+b,0,math.max(am.Z,0)/2+b)return{half=c,cframe=aj.CFrame}end,
function(aj,ak,al,am)if not ak then return false end local b,c=aj.X,aj.Z al=al
or 0 local d=(am or ak.isTrajectory)and ad or ac if ak.radius then local e=(ak.
part and ak.part.Parent)and ak.part.Position local f,g=e and e.X or ak.cx or 0,e
and e.Z or ak.cz or 0 local h,i,j=b-f,c-g,ak.radius+d+al return(h*h+i*i)<=(j*j)
end local e=(ak.part and ak.part.Parent)and ak.part.CFrame or ak.cframe if e
then local f,g,h=e:PointToObjectSpace(aj),ak.half.X,ak.half.Z if al<=0 then
return math.abs(f.X)<=g and math.abs(f.Z)<=h else local i,j=math.max(0,math.abs(
f.X)-g),math.max(0,math.abs(f.Z)-h)return(i*i+j*j)<=(al*al)end end return false
end local am=function(am)if not am or not am.Instance or not am.Instance.Parent
then return nil end local b=am.Instance local c=am.Name or(b and b.Name)or''
local d,e=ai(c),am.IsTrajectory==true local f,g=e and ad or ac if b:IsA
'BasePart'then if not aj(b)then return nil end g={b}else g={}for h,i in ipairs(b
:GetDescendants())do if#g>=af then break end if i:IsA'BasePart'and aj(i)and i.
Parent then g[#g+1]=i end end if#g==0 then return nil end end local h,i,j,k,l={}
,math.huge,-math.huge,math.huge,-math.huge for m,n in ipairs(g)do local o,p=n.
Position,n.Size local q=math.max(p.X,p.Y,p.Z)/2+f i=math.min(i,o.X-q)j=math.max(
j,o.X+q)k=math.min(k,o.Z-q)l=math.max(l,o.Z+q)local r=ak(n,d,e)if r then if r.
radius then r.cx,r.cz=o.X,o.Z end r.part=n r.isTrajectory=e h[#h+1]=r end end if
#h==0 then return nil end local m,n,o,p=(i+j)/2,(k+l)/2,(j-i)/2,(l-k)/2 return{
zones=h,center=Vector3.new(m,0,n),boundingRadius=math.sqrt(o*o+p*p)}end local b=
function(b)local c=b and b.HazardZones if not c then c=am(b)if c and b then b.
HazardZones=c end end return c end function aa.GetHazardZones(c)return b(c)end
function aa.GetNearbyHazards(c,d)local e=ag if not e then return{}end d=d or 65
local f,g,h={},c.X,c.Z for i,j in pairs(e.GetActiveHazardsMap())do local k,l=j.
Instance,b(j)if l then local m,n=l.center.X,l.center.Z if k and k.Parent then
local o=k:IsA'BasePart'and k or k.PrimaryPart or k:FindFirstChildWhichIsA
'BasePart'if o then m=o.Position.X n=o.Position.Z end end local o,p=g-m,h-n
local q,r=o*o+p*p,d+l.boundingRadius if q<=r*r then table.insert(f,j)end end end
return f end function aa.IsPointInAnyHazard(c,d,e,f)local g=ag if not g then
return false,nil,nil end e=e or 0 local h,i,j,k=math.huge,f or g.
GetActiveHazardsMap()for l,m in pairs(i)do local n=m.Instance or(typeof(l)==
'Instance'and l)if d and(d==n or(n and d.Name==n.Name))then continue end local o
=b(m)if not o then continue end local p,q=o.center.X,o.center.Z if n and n.
Parent then local r=n:IsA'BasePart'and n or n.PrimaryPart or n:
FindFirstChildWhichIsA'BasePart'if r then p=r.Position.X q=r.Position.Z end end
local r,s=c.X-p,c.Z-q local t,u=r*r+s*s,o.boundingRadius+e if t>u*u then
continue end local v=m.IsTrajectory==true for w=1,#o.zones do local x=o.zones[w]
if aj(x.part)and al(c,x,e,v or x.isTrajectory)then local y=(c-x.part.Position).
Magnitude if y<h then h=y j=m k=x.part end break end end end return k~=nil,j,k
end return aa end function a.j()local aa,ab,ac=a.load'a',a.load'b',a.load'i'
local ad,ae,af,ag,ah,ai,aj,ak,al,am,b,c=aa.RunService or game:GetService
'RunService',aa.player,{},false,{},0.85,Color3.fromRGB(255,45,45),Color3.
fromRGB(0,160,255),0.55,0.25 local d=function()local d=ae and ae.Character if
not d then return nil end local e=d:FindFirstChild'HumanoidRootPart'or d.
PrimaryPart if not e then return nil end return e.Position.Y-2.5 end function af
.BindDetection(e)b=e or nil end function af.IsEnabled()return ag end local e=
function(e,f)local g,h=e.part,e.ad if not g or not g.Parent or not h or not h.
Parent then return end local i=g.Position local j=Vector3.new(i.X,f or i.Y,i.Z)
if e.isCircle then local k=CFrame.new(j)*CFrame.Angles(math.rad(90),0,0)h.CFrame
=g.CFrame:ToObjectSpace(k)else local k,l,m=g.CFrame:ToOrientation()local n=
CFrame.new(j)*CFrame.Angles(0,l,0)h.CFrame=g.CFrame:ToObjectSpace(n)end end
local f=function()if not ag then return end local f,g=false,d()for h,i in pairs(
ah)do if not h.Instance or not h.Instance.Parent then af.DetachZoneVisuals(h)
else f=true if i.items then for j,l in ipairs(i.items)do e(l,g)end end end end
if not f and c then c:Disconnect()c=nil end end local g=function()if not c and
ag then c=ad.Heartbeat:Connect(f)end end function af.DetachZoneVisuals(h)if not
h then return end local i=ah[h]if not i then return end if i.adornments then for
j,l in ipairs(i.adornments)do pcall(function()l:Destroy()end)end table.clear(i.
adornments)end if i.connections then for j,l in ipairs(i.connections)do pcall(
function()l:Disconnect()end)end table.clear(i.connections)end if i.items then
table.clear(i.items)end ah[h]=nil end function af.UpdateHazardVisualColor(h,i)if
not h then return end local j=ah[h]if not j or not j.items then return end local
l=i==true or h.IsTrajectory==true local m,n=l and ak or aj,l and ac.
GetTrajectoryMargin()or 0 for o,p in ipairs(j.items)do local q,r,s=p.ad,p.zone,p
.part if q and q.Parent and r and s and s.Parent then q.Color3=m if p.isCircle
and r.radius then q.Radius=r.radius+n elseif r.half then local t,u=math.max(s.
Size.X,0)/2+n,math.max(s.Size.Z,0)/2+n q.Size=Vector3.new(t*2,am,u*2)end end end
end function af.AttachZoneVisuals(h)if not ag or not h then return end if ah[h]
then af.DetachZoneVisuals(h)end local i=ac.GetHazardZones(h)if not i or not i.
zones then return end local j=h.IsTrajectory==true local l,m,n,o,p,q=j and ak or
aj,j and ac.GetTrajectoryMargin()or 0,d(),{},{},{}for r,s in ipairs(i.zones)do
local t=s.part if t and t.Parent and t.Transparency<=ai then local u,v=false if
s.radius then u=true local w=Instance.new'CylinderHandleAdornment'w.Name=
'HazardGroundCircle'w.Adornee=t w.Radius=s.radius+m w.Height=am w.Color3=l w.
Transparency=al w.ZIndex=2 w.AlwaysOnTop=true w.Parent=t v=w elseif s.half and s
.cframe then local w=Instance.new'BoxHandleAdornment'w.Name='HazardGroundBox'w.
Adornee=t w.Size=Vector3.new(s.half.X*2,am,s.half.Z*2)w.Color3=l w.Transparency=
al w.ZIndex=2 w.AlwaysOnTop=true w.Parent=t v=w end if v then local w={ad=v,part
=t,isCircle=u,zone=s}e(w,n)table.insert(o,w)table.insert(p,v)local x=t:
GetPropertyChangedSignal'Transparency':Connect(function()if t.Parent and t.
Transparency>ai then pcall(function()v:Destroy()end)end end)table.insert(q,x)end
end end if#p>0 then ah[h]={items=o,adornments=p,connections=q}g()end end
function af.ClearAll()if c then c:Disconnect()c=nil end for h in pairs(ah)do af.
DetachZoneVisuals(h)end table.clear(ah)end function af.RefreshAll()af.ClearAll()
if not ag or not b then return end for h,i in pairs(b.GetActiveHazardsMap())do
af.AttachZoneVisuals(i)end end function af.SetEnabled(h)ag=h and true or false
if ag then af.RefreshAll()else af.ClearAll()end end ac.OnPaddingChanged(function
()if ag then af.RefreshAll()end end)ab.Register(function()af.ClearAll()end)
return af end function a.k()local aa,ab,ac=a.load'a',a.load'b',a.load'i'local ad
,ae,af,ag,ah,ai,aj,ak,al,am,b,c,d=aa.RunService or game:GetService'RunService',
aa.player,{},false,45,{},0.85,Color3.fromRGB(255,140,0),0.65,0.2,3.5 local e=
function()local e=ae and ae.Character if not e then return nil end local f=e:
FindFirstChild'HumanoidRootPart'or e.PrimaryPart if not f then return nil end
return f.Position.Y-2.5 end function af.BindDetection(f)c=f or nil end function
af.IsEnabled()return ag end function af.GetPredictionLength()return ah end
function af.SetPredictionLength(f)if type(f)=='number'and f>0 then ah=math.
clamp(f,10,200)af.RefreshAll()end end function af.IsHazardMoving(f)if not f then
return false end local g=ai[f]return g and g.isMoving==true end local f,g=
function(f,g)local h=f.Instance if not h or not h.Parent then return nil,4 end
local i,j,l=ac.GetTrajectoryMargin and ac.GetTrajectoryMargin()or 2,{},f.Name or
(h and h.Name)or''local m=ac.IsForceCircle and ac.IsForceCircle(l)if h:IsA
'BasePart'then if h.Transparency<=aj then table.insert(j,h)end else for n,o in
ipairs(h:GetDescendants())do if o:IsA'BasePart'and o.Parent and o.Transparency<=
aj then table.insert(j,o)end end end if#j==0 then return nil,4 end local n,o,p,q
=Vector3.new(-g.Z,0,g.X),math.huge,-math.huge,0 for r,s in ipairs(j)do local t,u
,v=s.Position,s.Size,0 if m or(s:IsA'Part'and(s.Shape==Enum.PartType.Ball or s.
Shape==Enum.PartType.Cylinder))then v=math.max(u.X,u.Y,u.Z)/2 else local w=s.
CFrame local x,y,z,A,B,C=w.RightVector,w.UpVector,w.LookVector,u.X/2,u.Y/2,u.Z/2
v=A*math.abs(x.X*n.X+x.Z*n.Z)+B*math.abs(y.X*n.X+y.Z*n.Z)+C*math.abs(z.X*n.X+z.Z
*n.Z)end local w=t.X*n.X+t.Z*n.Z o=math.min(o,w-v)p=math.max(p,w+v)local x=t.X*g
.X+t.Z*g.Z q+=x end local r,s,t=math.max(1,(p-o)+i*2),(o+p)/2,q/#j local u=g*t+n
*s return u,r end,function(f,g,h,i,j,l,m)if not g or not g.Parent or not f or
not f.Parent then return end local n=l/2 local o=Vector3.new(h.X+i.X*n,j or h.Y,
h.Z+i.Z*n)local p=o+Vector3.new(i.X,0,i.Z)local q=CFrame.lookAt(o,p)local r=g.
CFrame:ToObjectSpace(q)f.CFrame=r f.Size=Vector3.new(m,am,l)if not f.Visible
then f.Visible=true end end local h=function()if not ag then return end local h,
i,j=false,os.clock(),e()for l,m in pairs(ai)do local n=l.Instance if not n or
not n.Parent then af.DetachTrajectoryVisuals(l)else h=true local o=m.mainPart if
o and o.Parent then local p,q=o.Position,i-(m.lastClock or i)if q>=0.035 then
local r=p-(m.lastPos or p)local s,t=r.Magnitude/q,Vector3.new(r.X,0,r.Z)local u,
v=t.Magnitude/q,m.isMoving==true if u>=b then m.isMoving=true m.dir=t.Unit else
if q>=0.25 and s<b then m.isMoving=false end end if m.isMoving~=v then l.
IsTrajectory=m.isMoving l.HazardZones=nil if c and c.UpdateHazardVisualColor
then pcall(c.UpdateHazardVisualColor,l,m.isMoving)end local w=a.load'j'if w and
w.UpdateHazardVisualColor then pcall(w.UpdateHazardVisualColor,l,m.isMoving)end
end m.lastPos=p m.lastClock=i end if m.isMoving and m.dir and m.ad then local r,
s=f(l,m.dir)if r then g(m.ad,o,r,m.dir,j,ah,s)end else if m.ad and m.ad.Visible
then m.ad.Visible=false end end end end end if not h and d then d:Disconnect()d=
nil end end local i=function()if not d and ag then d=ad.Heartbeat:Connect(h)end
end function af.DetachTrajectoryVisuals(j)if not j then return end local l=ai[j]
if not l then return end if l.ad then pcall(function()l.ad:Destroy()end)l.ad=nil
end if l.connections then for m,n in ipairs(l.connections)do pcall(function()n:
Disconnect()end)end table.clear(l.connections)end ai[j]=nil end function af.
AttachTrajectoryVisuals(j)if not ag or not j then return end if ai[j]then af.
DetachTrajectoryVisuals(j)end local l=j.Instance if not l or not l.Parent then
return end local m if l:IsA'BasePart'then m=l else m=l.PrimaryPart or l:
FindFirstChildWhichIsA'BasePart'if not m then for n,o in ipairs(l:
GetDescendants())do if o:IsA'BasePart'and o.Parent then m=o break end end end
end if not m or not m.Parent then return end local n=Instance.new
'BoxHandleAdornment'n.Name='HazardTrajectoryCorridor'n.Adornee=m n.Size=Vector3.
new(4,am,ah)n.Color3=ak n.Transparency=al n.ZIndex=1 n.AlwaysOnTop=true n.
Visible=false n.Parent=m local o,p={},m:GetPropertyChangedSignal'Transparency':
Connect(function()if m.Parent and m.Transparency>aj then pcall(function()n:
Destroy()end)end end)table.insert(o,p)ai[j]={ad=n,connections=o,mainPart=m,
lastPos=m.Position,lastClock=os.clock(),velocity=Vector3.zero,dir=nil,isMoving=
false}i()end function af.ClearAll()if d then d:Disconnect()d=nil end for j in
pairs(ai)do af.DetachTrajectoryVisuals(j)end table.clear(ai)end function af.
RefreshAll()af.ClearAll()if not ag or not c then return end for j,l in pairs(c.
GetActiveHazardsMap())do af.AttachTrajectoryVisuals(l)end end function af.
GetNearbyTrajectories(j,l)l=l or 65 local m,n,o={},j.X,j.Z for p,q in pairs(ai)
do if q.isMoving and q.dir and q.mainPart and q.mainPart.Parent then local r,s=
f(p,q.dir)if r and s then local t,u=r.X,r.Z local v,w=n-t,o-u local x,y=v*v+w*w,
l+ah+(s/2)if x<=y*y then table.insert(m,{info=p,record=q})end end end end return
m end function af.IsPointInAnyTrajectory(j,l,m)local n,o=j.X,j.Z l=l or 0 if m
then for p,q in ipairs(m)do local r,s=q.info,q.record if s and s.isMoving and s.
dir and s.mainPart and s.mainPart.Parent then local t,u=f(r,s.dir)if t and u
then local v=s.dir local w,x,y=Vector3.new(-v.Z,0,v.X),n-t.X,o-t.Z local z,A,B=x
*v.X+y*v.Z,x*w.X+y*w.Z,u/2 if l<=0 then if z>=0 and z<=ah and math.abs(A)<=B
then return true,r end else local C=0 if z<0 then C=-z elseif z>ah then C=z-ah
end local D=math.max(0,math.abs(A)-B)if(C*C+D*D)<=(l*l)then return true,r end
end end end end return false,nil end for p,q in pairs(ai)do if q.isMoving and q.
dir and q.mainPart and q.mainPart.Parent then local r,s=f(p,q.dir)if r and s
then local t=q.dir local u,v,w=Vector3.new(-t.Z,0,t.X),n-r.X,o-r.Z local x,y,z=v
*t.X+w*t.Z,v*u.X+w*u.Z,s/2 if l<=0 then if x>=0 and x<=ah and math.abs(y)<=z
then return true,p end else local A=0 if x<0 then A=-x elseif x>ah then A=x-ah
end local B=math.max(0,math.abs(y)-z)if(A*A+B*B)<=(l*l)then return true,p end
end end end end return false,nil end function af.SetEnabled(j)ag=j and true or
false if ag then af.RefreshAll()else af.ClearAll()end end ac.OnPaddingChanged(
function()if ag then af.RefreshAll()end end)ab.Register(function()af.ClearAll()
end)return af end function a.l()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'a',a.
load'c',a.load'b',a.load'i',a.load'j',a.load'k',game:GetService'Players',game:
GetService'Workspace',game:GetService'ReplicatedStorage'local aj,ak,al,am,b,c,d,
e,f,g,h,i,j,l,m,n,o,p=aa.player,{},false,false,true,false,false,'',false,{},0,{}
,{},{'abilities','projectiles'},false,{}local q,r,s,t,u,v,w,x=function()if m
then return end m=true for q,r in ipairs(l)do local s=ai:FindFirstChild(r)if s
then for t,u in ipairs(s:GetChildren())do local v=(u.Name or''):lower():gsub(
'%s+','')if#v>0 then n[v]=true end end end end end,function(q)if not q then
return true end local r=q.Name if typeof(r)=='string'then local s=r:lower()if s:
sub(1,3)=='tm_'or s:sub(1,3)=='pr_'or s:sub(1,3)=='dq_'or s:find'pathrecord'or s
:find'safespot'or s:find'hazard'or s:find'adornment'or s:find'debug'or s:find
'targetpart'or s:find'actualmarker'then return true end local t=q.Parent while t
and t~=workspace and t~=game do local u=t.Name if typeof(u)=='string'then local
v=u:lower()if v:find'pathrecord'or v:sub(1,3)=='tm_'or v:sub(1,3)=='pr_'then
return true end end t=t.Parent end local u=s:gsub('%s+','')if#u>0 and n[u]==true
then return true end end return false end,function(q)if not q then return false
end if ag:GetPlayerFromCharacter(q)then return true end if ag:FindFirstChild(q.
Name)then return true end for r,s in ipairs(ag:GetPlayers())do if q.Name==s.Name
then return true end local t=s.Character if t and(q==t or q:IsDescendantOf(t))
then return true end end local r=aj and aj.Character if r and(q==r or q:
IsDescendantOf(r))then return true end return false end,function()local q=0 for
r in pairs(g)do q+=1 end h=q for r=#i,1,-1 do pcall(i[r],q,o)end end,0.85,50,
0.05,{}local y,z,A,B,C,D,E,F=function(y)local z=x[y]if z then z.active=false x[y
]=nil end end,function()for y,z in pairs(x)do if z then z.active=false end end
table.clear(x)end,function(y)if not y then return{}end local z={}local A=
function(A)if A and A.Parent and A.Transparency<=u then z[#z+1]=A end end if y:
IsA'BasePart'then A(y)else for B,C in ipairs(y:GetDescendants())do if C:IsA
'BasePart'and C.Parent then A(C)end end end return z end,function(y)local z=aj
and aj.Character if not z then return 0 end local A=z:FindFirstChild
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
end return J end function ak.UpdateHazardVisualColor(H,I)if not H or not H.Boxes
then return end local J=I==true or H.IsTrajectory==true local K,L=J and E or C,J
and F or D for M,N in ipairs(H.Boxes)do if N and N.Parent then N.Color3=K N.
SurfaceColor3=L end end end local H,I=function(H)if not f or e==''then return
false end if not H or type(H)~='string'then return false end local I=e:lower():
gsub('%s+','')if#I==0 then return false end local J=H:lower():gsub('%s+','')
return string.find(J,I,1,true)~=nil end,function(H)if not H then return'nil'end
return('(%.2f, %.2f, %.2f)'):format(H.X,H.Y,H.Z)end local an=function(J,K,L,M)if
not J then return end local N=J.Name if not H(N)then return end local O,P,Q=J.
ClassName,J.Parent and J.Parent:GetFullName()or'nil',B(J)print
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
end local Z=X*V:Inverse()local _,an=Z:ToAxisAngle()local ao,ap=math.deg(an)/Y,V:
Inverse()*X local aq,ar=ap:ToAxisAngle()if math.abs(math.deg(an))>=1.5 then
local as='Tr\u{1ee5}c t\u{1ef1} do / H\u{1ed7}n h\u{1ee3}p'if math.abs(_.Y)>=0.8
then as='Tr\u{1ee5}c Y (Yaw - Qu\u{e9}t ngang m\u{1eb7}t s\u{e0}n)'elseif math.
abs(_.X)>=0.8 then as='Tr\u{1ee5}c X (Pitch - L\u{103}n nh\u{e0}o l\u{1ed9}n)'
elseif math.abs(_.Z)>=0.8 then as=
'Tr\u{1ee5}c Z (Roll - Nghi\u{ea}ng l\u{1ead}t b\u{ea}n)'end local at=
'Tr\u{1ee5}c t\u{1ef1} do'if math.abs(aq.Y)>=0.8 then at='Tr\u{1ee5}c Local Y'
elseif math.abs(aq.X)>=0.8 then at='Tr\u{1ee5}c Local X'elseif math.abs(aq.Z)>=
0.8 then at='Tr\u{1ee5}c Local Z'end print
'================== \u{1f504} [INSPECT: SPINNING DETECTED] \u{1f504} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(J.Name,T.Name))print((
'  \u{26a1} T\u{1ed1}c \u{111}\u{1ed9} xoay    : %.2f \u{b0}/s (%.2f rad/s)'):
format(ao,an/Y))print(('  \u{1f310} World Spin Axis: %s -> %s'):format(I(_),as))
print(('  \u{1f9e9} Local Spin Axis: %s -> %s'):format(I(aq),at))print
[[========================================================================]]end
end)elseif K=='DESPAWN'then if M and M.SpawnClock then local an=os.clock()-M.
SpawnClock print(('  \u{23f1}\u{fe0f} Lifetime Active: %.2f seconds'):format(an)
)end elseif K=='REJECTED'then print(('  \u{26a0}\u{fe0f} Rejection Reason: %s'):
format(tostring(L)))end print
[[================================================================]]end local ao
,ap=function(ao,ap)an(ao,'REJECTED',ap,nil)if not d then return end local aq,ar=
ao and ao.Name or'?',ao and ao.ClassName or'?'print((
'[HazardScanner][Reject] \u{26aa} %s (%s) \u{2014} %s'):format(aq,ar,ap))end
local aq=function(aq)if not aq or not aq.Parent then return end if s(aq)then
return end if g[aq]then return end if x[aq]then return end local ar={active=true
,count=0}x[aq]=ar task.spawn(function()while ar.active and aq.Parent and al and
am do if s(aq)then y(aq)return end ar.count+=1 local as,at,J=aq:GetDescendants()
,A(aq),H(aq.Name)if d or J then print((
'[HazardScanner][Retry] \u{1f504} L\u{1ea7}n %d/%d: %q (%s) | Descendants: %d | Valid Parts (Trans<=%.2f): %d'
):format(ar.count,v,aq.Name,aq.ClassName,#as,u,#at))end if#at>0 then if d or J
then print((
'[HazardScanner][Retry] \u{2705} L\u{1ea7}n %d/%d: %q \u{110}\u{e3} t\u{ec}m th\u{1ea5}y %d part(s)! Ti\u{1ebf}n h\u{e0}nh v\u{1ebd}...'
):format(ar.count,v,aq.Name,#at))end y(aq)ap(aq)return end if ar.count>=v then
ao(aq,(
'H\u{1ebf}t %d l\u{1b0}\u{1ee3}t retry m\u{e0} kh\u{f4}ng t\u{ec}m th\u{1ea5}y BasePart h\u{1ee3}p l\u{1ec7} (Descendants: %d)'
):format(v,#as))y(aq)return end task.wait(w)end y(aq)end)end ap=function(ar)if
not al or not am then ao(ar,'Ch\u{1b0}a trong dungeon')return false end if not
ar or not ar.Parent then ao(ar,'Kh\u{f4}ng c\u{f2}n Parent')return false end if
s(ar)then ao(ar,
'Nh\u{e2}n v\u{1ead}t ng\u{1b0}\u{1edd}i ch\u{1a1}i (Player/Teammate)')return
false end if g[ar]then return true end q()if r(ar)then ao(ar,
'Tr\u{f9}ng t\u{ea}n trong ReplicatedStorage (abilities/projectiles)')return
false end local as=A(ar)if#as==0 then ao(ar,
'Ch\u{1b0}a c\u{f3} part \u{111}\u{1ec3} v\u{1ebd} (s\u{1ebd} retry)')aq(ar)
return false end local at,J={},{}if b then J=G(as,at)end local K=B(ar)local L={
Instance=ar,Name=ar.Name,Class=ar.ClassName,Distance=K,Boxes=J,Connections=at,
SpawnClock=os.clock()}g[ar]=L o={Name=ar.Name,Class=ar.ClassName,Distance=K}if
ae.IsEnabled()then ae.AttachZoneVisuals(L)end if af.IsEnabled()then af.
AttachTrajectoryVisuals(L)end y(ar)an(ar,'SPAWN','Passed all gates',L)if c then
print(('[HazardScanner][Hazard] \u{1f534} Hazard Detected: %s (%s, %d studs)'):
format(ar.Name,ar.ClassName,K))end t()return true end local ar=function(ar,as)
local at=g[ar]if not at then y(ar)return end an(ar,'DESPAWN',as,at)ae.
DetachZoneVisuals(at)af.DetachTrajectoryVisuals(at)if at.Boxes then for J,K in
ipairs(at.Boxes)do pcall(function()K:Destroy()end)end table.clear(at.Boxes)end
if at.Connections then for J,K in ipairs(at.Connections)do pcall(function()K:
Disconnect()end)end table.clear(at.Connections)end g[ar]=nil if c then local J=
as and(' ('..as..')')or''print((
'[HazardScanner][Hazard] \u{1f7e2} Hazard Expired: %s%s'):format(tostring(at.
Name),J))end t()end function ak.ClearAllHazards(as)ae.ClearAll()af.ClearAll()z()
local at={}for J in pairs(g)do table.insert(at,J)end for J,K in ipairs(at)do ar(
K,as)end if c and as then print((
'[HazardScanner][Hazard] \u{1f9f9} All hazards cleared: %s'):format(as))end end
function ak.StartScan()if al then return end al=true ae.BindDetection(ak)af.
BindDetection(ak)ak.ClearAllHazards'StartScan Reset'for as,at in ipairs(j)do at:
Disconnect()end table.clear(j)table.insert(j,ah.ChildAdded:Connect(function(as)
if s(as)then return end ap(as)end))table.insert(j,ah.ChildRemoved:Connect(
function(as)ar(as,'Destroyed')end))am=ab.GetCurrentRoomIndex()>0 if p then
pcall(p)p=nil end p=ab.OnRoomIndexChanged(function(as)if as>0 then am=true
elseif as<=0 and am then am=false ak.ClearAllHazards'Dungeon Ended'end end)if c
then print'[HazardScanner] \u{1f4e1} Threat Detector started!'end end function
ak.StopScan()al=false am=false for as,at in ipairs(j)do at:Disconnect()end table
.clear(j)if p then pcall(p)p=nil end ak.ClearAllHazards'StopScan'if c then print
'[HazardScanner] \u{1f6d1} Threat Detector stopped.'end end function ak.
IsEnabled()return al end function ak.SetEnabled(as)if as then ak.StartScan()else
ak.StopScan()end end function ak.SetSelectionBoxesEnabled(as)b=as and true or
false if b then for at,J in pairs(g)do if at and at.Parent and(not J.Boxes or#J.
Boxes==0)then local K=A(at)J.Connections=J.Connections or{}J.Boxes=G(K,J.
Connections)end end else for at,J in pairs(g)do if J.Boxes then for K,L in
ipairs(J.Boxes)do pcall(function()L:Destroy()end)end table.clear(J.Boxes)end end
end end function ak.IsSelectionBoxesEnabled()return b end function ak.
SetLogHazards(as)c=as and true or false end function ak.IsLogHazardsEnabled()
return c end function ak.SetLogFailed(as)d=as and true or false end function ak.
IsLogFailedEnabled()return d end function ak.SetInspectTarget(as)e=type(as)==
'string'and as or''end function ak.GetInspectTarget()return e end function ak.
SetInspectEnabled(as)f=as and true or false end function ak.IsInspectEnabled()
return f end function ak.GetHazardCount()return h end function ak.
GetActiveHazards()local as={}for at,J in pairs(g)do if at and at.Parent==ah then
as[#as+1]=J end end return as end function ak.GetActiveHazardsMap()return g end
function ak.GetLastHazardInfo()return o end function ak.OnHazardChanged(as)if
type(as)~='function'then return end table.insert(i,as)end ac.Register(function()
ak.StopScan()ak.ClearAllHazards'Shutdown'end)return ak end function a.m()local
aa,ab,ac,ad=a.load'a',a.load'b',a.load'i',a.load'k'local ae,af,ag,ah,ai,aj,ak,al
,am,an,ao,ap,aq,ar,as,at,b,c=aa.RunService or game:GetService'RunService',aa.
player,{},true,false,{},1.8,Color3.fromRGB(0,255,170),Color3.fromRGB(255,35,35),
0.45,0.2,0.2,(game:GetService'Players')local d,e,f,g=function()local d=af or aq.
LocalPlayer if not d then return nil end local e=d.Character if not e or not e.
Parent then return nil end local f=e:FindFirstChildOfClass'Humanoid'if f and f.
Health<=0 then return nil end return e:FindFirstChild'HumanoidRootPart'or e.
PrimaryPart end,function(d)if not d then return 0 end return d.Position.Y-2.5
end,function(d)if b then if b.Parent~=d or not b:IsDescendantOf(workspace)then
pcall(function()b:Destroy()end)b=nil else if b.Adornee~=d then b.Adornee=d end
return b end end if not d or not d.Parent then return nil end local e=Instance.
new'CylinderHandleAdornment'e.Name='Player_2D_HitboxVisual'e.Adornee=d e.Radius=
ak e.Height=ap e.Color3=ai and am or al e.Transparency=ai and ao or an e.ZIndex=
5 e.AlwaysOnTop=false e.Visible=ah e.Parent=d b=e return e end,function(d)if not
b or not b.Parent then return end b.Color3=d and am or al b.Transparency=d and
ao or an end local h=function()local h=d()if not h or not h.Parent then if b and
b.Parent then b.Visible=false end if ai then ai=false ar=nil as=nil for i,j in
ipairs(aj)do pcall(j,false,nil,nil)end end return end local i=f(h)if i and i.
Parent then i.Visible=ah i.Radius=ak local j=e(h)local l=CFrame.new(Vector3.new(
h.Position.X,j,h.Position.Z))*CFrame.Angles(math.rad(90),0,0)i.CFrame=h.CFrame:
ToObjectSpace(l)end local j=Vector3.new(h.Position.X,0,h.Position.Z)local l,m,n=
ac.IsPointInAnyHazard(j,nil,ak)local o,p=false if not l and ad.
IsPointInAnyTrajectory then o,p=ad.IsPointInAnyTrajectory(j,ak)end local q,r,s=(
l or o),m or p,l and'Ground Zone'or(o and'Trajectory Corridor'or nil)if q~=ai or
r~=ar then ai=q ar=r as=s g(q)for t,u in ipairs(aj)do pcall(u,q,r,s)end end end
local i=function()if not at then at=ae.Heartbeat:Connect(h)end end function ag.
Cleanup()if at then at:Disconnect()at=nil end if b then pcall(function()b:
Destroy()end)b=nil end ai=false ar=nil as=nil end function ag.IsPlayerInDanger()
return ai,ar,as end function ag.GetCurrentThreat()return ar,as end function ag.
OnDangerStatusChanged(j)if type(j)=='function'then table.insert(aj,j)end end
function ag.SetVisualEnabled(j)ah=j and true or false if b then b.Visible=ah end
end function ag.IsVisualEnabled()return ah end function ag.SetRadius(j)if type(j
)=='number'and j>=0.1 then ak=j if b and b.Parent then b.Radius=ak end end end
function ag.GetRadius()return ak end local j=function()local j=af or aq.
LocalPlayer if not j then return end local l=function(l)if b then pcall(function
()b:Destroy()end)b=nil end task.spawn(function()local m=l:WaitForChild(
'Humanoid',3)if m then m.Died:Connect(function()if b then b.Visible=false end
end)end end)end c=j.CharacterAdded:Connect(l)if j.Character then l(j.Character)
end end j()i()ab.Register(function()if c then c:Disconnect()c=nil end ag.
Cleanup()end)return ag end function a.n()local aa,ab,ac={},{},8 for ad=1,ac do
local ae=(ad-1)*(2*math.pi/ac)ab[ad]=Vector3.new(math.cos(ae),0,math.sin(ae))end
local ad,ae={},16 for af=1,ae do local ag=(af-1)*(2*math.pi/ae)ad[af]=Vector3.
new(math.cos(ag),0,math.sin(ag))end local af,ag={1.5,3,5,8,12,18,25},{1.5,3,4.5,
6,8,10.5,13.5,17,21,26,32,40}aa.COARSE_DIRECTIONS=ab aa.FINE_DIRECTIONS=ad aa.
COARSE_RADII=af aa.FINE_RADII=ag function aa.SamplePass(ah,ai,aj,ak,al,am,an,ao)
local ap,aq,ar,as,at=math.huge,Vector3.zero,false,ai if ao and ao.Magnitude>0.1
then local b=Vector3.new(ao.X,0,ao.Z).Unit as=table.clone(ai)table.sort(as,
function(c,d)local e,f=c.X*b.X+c.Z*b.Z,d.X*b.X+d.Z*b.Z return e>f end)end for b,
c in ipairs(aj)do local d=false for e,f in ipairs(as)do local g=ah+f*c local h=
am(g)if an then table.insert(an,{pos=g,isSafe=h,isChosen=false})end if h then
local i=g if al and ak>0 then local j=g+f*ak if am(j)then i=j end end local j=(i
-ah).Magnitude if j<ap then ap=j at=i aq=f d=true end end end if d and at then
ar=true break end end return at,ar,ap,aq end return aa end function a.o()local
aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am=Color3.fromRGB(0,255,120),Color3.fromRGB(
0,255,150),Color3.fromRGB(255,255,255),Color3.fromRGB(0,235,140),Color3.fromRGB(
255,60,60),0.2,1.4,0.45,{},{}local an,ao=function(an)if not an then return end
if not ak or not ak.Parent then if ak then pcall(function()ak:Destroy()end)end
local ao=Instance.new'CylinderHandleAdornment'ao.Name='SafeSpot_OuterMarker'ao.
Adornee=an ao.Radius=ag ao.Height=af ao.Color3=aa ao.Transparency=0.35 ao.ZIndex
=6 ao.AlwaysOnTop=false ao.Visible=false ao.Parent=an ak=ao end if not al or not
al.Parent then if al then pcall(function()al:Destroy()end)end local ao=Instance.
new'CylinderHandleAdornment'ao.Name='SafeSpot_CenterDot'ao.Adornee=an ao.Radius=
ah ao.Height=af+0.05 ao.Color3=ac ao.Transparency=0.15 ao.ZIndex=7 ao.
AlwaysOnTop=false ao.Visible=false ao.Parent=an al=ao end if not am or not am.
Parent then if am then pcall(function()am:Destroy()end)end local ao=Instance.new
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
end local at=Vector3.new(ap.Position.X,aq+0.05,ap.Position.Z)local b=ap.CFrame:
PointToObjectSpace(at)for c,d in ipairs(ar)do local e,f=ao(c,ap),Vector3.new(d.
pos.X,aq+0.05,d.pos.Z)local g,h,i=ap.CFrame:PointToObjectSpace(f),d.isSafe and
ad or ae,d.isSafe and 0.35 or 0.55 if e.dot and e.dot.Parent then local j=CFrame
.new(f)*CFrame.Angles(math.rad(90),0,0)e.dot.CFrame=ap.CFrame:ToObjectSpace(j)e.
dot.Color3=h e.dot.Transparency=i e.dot.Radius=d.isSafe and 0.3 or 0.2 e.dot.
Visible=true end if e.line and e.line.Parent then local j=g-b local l=j.
Magnitude if l>0.2 then e.line.CFrame=CFrame.lookAt(b,g)e.line.Length=l e.line.
Color3=h e.line.Transparency=i+0.15 e.line.Thickness=d.isSafe and 1.4 or 0.9 e.
line.Visible=true else e.line.Visible=false end end end for c=#ar+1,#aj do local
d=aj[c]if d.dot and d.dot.Parent then d.dot.Visible=false end if d.line and d.
line.Parent then d.line.Visible=false end end end function ai.Update(aq,ar,as,at
,b,c)if not aq or not aq.Parent or not b or not ar then ai.Hide()return end an(
aq)local d=Vector3.new(ar.X,as,ar.Z)if ak and ak.Parent then local e=CFrame.new(
d)*CFrame.Angles(math.rad(90),0,0)ak.CFrame=aq.CFrame:ToObjectSpace(e)ak.Visible
=true end if al and al.Parent then local e=CFrame.new(d)*CFrame.Angles(math.rad(
90),0,0)al.CFrame=aq.CFrame:ToObjectSpace(e)al.Visible=true end if am and am.
Parent then local e,f=Vector3.new(aq.Position.X,as+0.1,aq.Position.Z),Vector3.
new(ar.X,as+0.1,ar.Z)local g,h=aq.CFrame:PointToObjectSpace(e),aq.CFrame:
PointToObjectSpace(f)local i=h-g local j=i.Magnitude if j>0.3 then am.CFrame=
CFrame.new(g)am.Length=j am.CFrame=CFrame.lookAt(g,h)am.Visible=true else am.
Visible=false end end ap(aq,as,at,c)end function ai.Cleanup()if ak then pcall(
function()ak:Destroy()end)ak=nil end if al then pcall(function()al:Destroy()end)
al=nil end if am then pcall(function()am:Destroy()end)am=nil end for aq,ar in
ipairs(aj)do if ar.dot then pcall(function()ar.dot:Destroy()end)end if ar.line
then pcall(function()ar.line:Destroy()end)end end table.clear(aj)end return ai
end function a.p()local aa,ab,ac,ad,ae,af,ag,ah=a.load'a',a.load'c',a.load'b',a.
load'i',a.load'k',a.load'm',a.load'n',a.load'o'local ai,aj,ak,al,am,an,ao,ap,aq,
ar,as,at,b,c,d,e,f,g=aa.RunService or game:GetService'RunService',game:
GetService'Players',aa.player,{},true,true,true,2,0,false,{},{},0 local h,i,j=
function()local h=ak or aj.LocalPlayer if not h then return nil end local i=h.
Character if not i or not i.Parent then return nil end local j=i:
FindFirstChildOfClass'Humanoid'if j and j.Health<=0 then return nil end return i
:FindFirstChild'HumanoidRootPart'or i.PrimaryPart end,function(h)local i=ak or
aj.LocalPlayer if not i then return nil end local j=i.Character if not j or not
j.Parent then return nil end local l=j:FindFirstChildOfClass'Humanoid'if l and l
.Health>0 then local m=l.MoveDirection if m and m.Magnitude>0.1 then return
Vector3.new(m.X,0,m.Z).Unit end end if h and h.Parent then local m=Vector3.zero
pcall(function()m=h.AssemblyLinearVelocity or h.Velocity or Vector3.zero end)
local n=Vector3.new(m.X,0,m.Z)if n.Magnitude>=2 then return n.Unit end end
return nil end,function(h)if not h then return 0 end return h.Position.Y-2.5 end
function al.IsPointSafe(l,m)if not l then return false end local n,o=Vector3.
new(l.X,0,l.Z),(af.GetRadius and af.GetRadius()or 1.8)+(m or 0)if ad.
IsPointInAnyHazard and ad.IsPointInAnyHazard(n,nil,o)then return false end if ae
.IsPointInAnyTrajectory and ae.IsPointInAnyTrajectory(n,o)then return false end
return true end function al.FindNearestSafeSpot(l)local m=h()if not l then if
not m then return nil,false,0,Vector3.zero end l=m.Position end local n,o=
Vector3.new(l.X,0,l.Z),i(m)table.clear(at)local p,q=ad.GetNearbyHazards and ad.
GetNearbyHazards(n,65)or nil,ae.GetNearbyTrajectories and ae.
GetNearbyTrajectories(n,65)or nil local r=function(r,s)if not r then return
false end local t,u=Vector3.new(r.X,0,r.Z),(af.GetRadius and af.GetRadius()or
1.8)+(s or 0)if ad.IsPointInAnyHazard and ad.IsPointInAnyHazard(t,nil,u,p)then
return false end if ae.IsPointInAnyTrajectory and ae.IsPointInAnyTrajectory(t,u,
q)then return false end return true end if(p and#p==0 and q and#q==0)or r(n,0)
then table.insert(at,{pos=n,isSafe=true,isChosen=true})return n,true,0,Vector3.
zero end local s,t,u,v=ag.SamplePass(n,ag.COARSE_DIRECTIONS,ag.COARSE_RADII,ap,
true,r,at,o)if not t then s,t,u,v=ag.SamplePass(n,ag.FINE_DIRECTIONS,ag.
FINE_RADII,ap,true,r,at,o)end if not t then s,t,u,v=ag.SamplePass(n,ag.
FINE_DIRECTIONS,ag.FINE_RADII,0,false,r,at,o)end if t and s then for w,x in
ipairs(at)do if(x.pos-s).Magnitude<0.25 then x.isChosen=true break end end
return s,true,u,v end return n,false,math.huge,Vector3.zero end local l=function
()if not am then ah.Hide()return end local l=h()if not l or not l.Parent then ah
.Hide()return end local m,n,o=false if af.IsPlayerInDanger then m,n,o=af.
IsPlayerInDanger()end local p=m or(c~=nil)or ar if not p then local q=os.clock()
if q-b<0.05 then return end b=q end local q,r=j(l),Vector3.new(l.Position.X,0,l.
Position.Z)if m then local s,t,u=c and(c-r).Magnitude or 0,c and al.IsPointSafe(
c),(n==d and o==e)if not t or not u or not c then local v,w,x,y=al.
FindNearestSafeSpot(l.Position)if w and v then c=v d=n e=o aq=x ar=true ah.
Update(l,v,q,at,an,ao)for z,A in ipairs(as)do pcall(A,true,v,x)end else ah.Hide(
)end else aq=s ah.Update(l,c,q,at,an,ao)for v,w in ipairs(as)do pcall(w,true,c,s
)end end else local s,t=c and(c-r).Magnitude or 0,c and al.IsPointSafe(c)if t
and s>0.8 then aq=s ah.Update(l,c,q,at,an,ao)for u,v in ipairs(as)do pcall(v,
true,c,s)end else if ar or c then ar=false c=nil d=nil e=nil aq=0 ah.Hide()for u
,v in ipairs(as)do pcall(v,false,nil,0)end end end end end local m=function()if
not f then f=ai.Heartbeat:Connect(l)end if not g and af.OnDangerStatusChanged
then g=af.OnDangerStatusChanged(function(m)if m and am then l()end end)end end
function al.Clear()if ar or c then ar=false c=nil d=nil e=nil aq=0 table.clear(
at)ah.Hide()for n,o in ipairs(as)do pcall(o,false,nil,0)end end end function al.
Cleanup()if f then f:Disconnect()f=nil end ah.Cleanup()table.clear(at)c=nil d=
nil e=nil aq=0 ar=false b=0 end function al.GetLastSafeSpot()return c,aq,ar end
function al.OnSafeSpotChanged(n)if type(n)=='function'then table.insert(as,n)end
end function al.SetVisualEnabled(n)an=n and true or false if not an then ah.
Hide()end end function al.IsVisualEnabled()return an end function al.
SetShowCandidates(n)ao=n and true or false if not ao then ah.HideCandidates()end
end function al.IsShowCandidates()return ao end function al.SetEnabled(n)am=n
and true or false if not am then ah.Hide()end end function al.IsEnabled()return
am end function al.SetSafetyBuffer(n)if type(n)=='number'and n>=0 then ap=n end
end function al.GetSafetyBuffer()return ap end local n=function()local n=ak or
aj.LocalPlayer if not n then return end n.CharacterAdded:Connect(function()al.
Clear()end)end n()if ab.OnRoomIndexChanged then ab.OnRoomIndexChanged(function()
al.Clear()end)end if ab.OnEnemyChanged then ab.OnEnemyChanged(function()if ab.
GetEnemyCount and ab.GetEnemyCount()==0 then al.Clear()end end)end if ab.
OnLobbyChanged then ab.OnLobbyChanged(function()al.Clear()end)end if ab.
OnBossActiveChanged then ab.OnBossActiveChanged(function()al.Clear()end)end m()
ac.Register(function()al.Cleanup()end)return al end function a.q()local aa,ab,ac
,ad,ae=a.load'a',a.load'c',a.load'b',a.load'm',a.load'p'local af,ag,ah,ai,aj,ak,
al,am,an,ao=aa.RunService or game:GetService'RunService',game:GetService
'Players',aa.player,{},false,2,false,{}local ap,aq=function()local ap=ah or ag.
LocalPlayer if not ap then return nil,nil,nil end local aq=ap.Character if not
aq or not aq.Parent then return nil,nil,nil end local ar=aq:
FindFirstChildOfClass'Humanoid'if ar and ar.Health<=0 then return nil,nil,nil
end local as=aq:FindFirstChild'HumanoidRootPart'or aq.PrimaryPart if not as then
return nil,nil,nil end return aq,ar,as end,function(ap,aq)if ap and aq and aq.
Parent then pcall(function()ap:MoveTo(aq.Position)end)end end local ar=function(
)if not aj then if al or an then an=nil al=false local ar,as,at=ap()aq(as,at)for
b,c in ipairs(am)do pcall(c,false,nil,0)end end return end local ar,as,at=ap()if
not ar or not as or not at then if al or an then an=nil al=false for b,c in
ipairs(am)do pcall(c,false,nil,0)end end return end if ab.IsInvulnerable and ab.
IsInvulnerable()then if al or an then an=nil al=false local b,c,d=ap()aq(c,d)for
e,f in ipairs(am)do pcall(f,false,nil,0)end end return end local b,c,d,e=ad.
IsPlayerInDanger and ad.IsPlayerInDanger(),ae.GetLastSafeSpot()if c then an=c
end local f=an and ae.IsPointSafe and ae.IsPointSafe(an)if an and f then local g
=at.Position local h=Vector3.new(an.X-g.X,0,an.Z-g.Z)local i=h.Magnitude if i<=
ak then local j,l=at.CFrame,Vector3.new(an.X,g.Y,an.Z)local m=CFrame.new(l)*(j-j
.Position)ar:PivotTo(m)aq(as,at)local n=an an=nil if al then al=false for o,p in
ipairs(am)do pcall(p,false,n,i)end end else local j=Vector3.new(an.X,g.Y,an.Z)as
:MoveTo(j)if not al then al=true for l,m in ipairs(am)do pcall(m,true,an,i)end
end end else if al or an then an=nil al=false aq(as,at)for g,h in ipairs(am)do
pcall(h,false,nil,0)end end end end local as=function()if not ao then ao=af.
Heartbeat:Connect(ar)end end function ai.Clear()if al or an then an=nil al=false
local at,b,c=ap()aq(b,c)for d,e in ipairs(am)do pcall(e,false,nil,0)end end end
function ai.Cleanup()if ao then ao:Disconnect()ao=nil end ai.Clear()end function
ai.SetEnabled(at)aj=at and true or false if not aj then local b,c,d=ap()aq(c,d)
an=nil al=false end end function ai.IsEnabled()return aj end function ai.
SetSnapDistance(at)if type(at)=='number'and at>=0.5 then ak=at end end function
ai.GetSnapDistance()return ak end function ai.IsDodging()return al end function
ai.OnDodgeStateChanged(at)if type(at)=='function'then table.insert(am,at)end end
if ab.OnRoomIndexChanged then ab.OnRoomIndexChanged(function()ai.Clear()end)end
if ab.OnEnemyChanged then ab.OnEnemyChanged(function()if ab.GetEnemyCount and ab
.GetEnemyCount()==0 then ai.Clear()end end)end if ab.OnLobbyChanged then ab.
OnLobbyChanged(function()ai.Clear()end)end if ab.OnBossActiveChanged then ab.
OnBossActiveChanged(function()ai.Clear()end)end as()ac.Register(function()ai.
Cleanup()end)return ai end function a.r()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load
'b',a.load'l',a.load'i',a.load'j',a.load'k',a.load'm',a.load'p',a.load'q',{}ac.
BindDetection(ab)ad.BindDetection(ab)ae.BindDetection(ab)ai.IsPointInAnyHazard=
ac.IsPointInAnyHazard ai.GetHazardPadding=ac.GetHazardPadding ai.
SetHazardPadding=ac.SetHazardPadding ai.GetHitboxPadding=ac.GetHazardPadding ai.
SetHitboxPadding=ac.SetHazardPadding ai.GetTrajectoryMargin=ac.
GetTrajectoryMargin ai.SetTrajectoryMargin=ac.SetTrajectoryMargin ai.
GetHazardZones=ac.GetHazardZones ai.GetNearbyHazards=ac.GetNearbyHazards ai.
AddForceCircleName=ac.AddForceCircleName ai.GetForceCircleNames=ac.
GetForceCircleNames ai.IsForceCircle=ac.IsForceCircle ai.IsPlayerInDanger=af.
IsPlayerInDanger ai.GetPlayerThreat=af.GetCurrentThreat ai.OnPlayerDangerChanged
=af.OnDangerStatusChanged ai.SetPlayerVisualEnabled=af.SetVisualEnabled ai.
IsPlayerVisualEnabled=af.IsVisualEnabled ai.SetPlayerHitboxRadius=af.SetRadius
ai.GetPlayerHitboxRadius=af.GetRadius ai.FindNearestSafeSpot=ag.
FindNearestSafeSpot ai.IsPointSafe=ag.IsPointSafe ai.GetLastSafeSpot=ag.
GetLastSafeSpot ai.OnSafeSpotChanged=ag.OnSafeSpotChanged ai.
SetSafeSpotVisualEnabled=ag.SetVisualEnabled ai.IsSafeSpotVisualEnabled=ag.
IsVisualEnabled ai.SetSafeSpotEnabled=ag.SetEnabled ai.IsSafeSpotEnabled=ag.
IsEnabled ai.SetSafeSpotBuffer=ag.SetSafetyBuffer ai.GetSafeSpotBuffer=ag.
GetSafetyBuffer ai.SetShowCandidates=ag.SetShowCandidates ai.IsShowCandidates=ag
.IsShowCandidates ai.ClearSafeSpot=ag.Clear ai.SetAutoDodgeEnabled=ah.SetEnabled
ai.IsAutoDodgeEnabled=ah.IsEnabled ai.SetDodgeSnapDistance=ah.SetSnapDistance ai
.GetDodgeSnapDistance=ah.GetSnapDistance ai.IsCurrentlyDodging=ah.IsDodging ai.
OnDodgeStateChanged=ah.OnDodgeStateChanged ai.ClearDodge=ah.Clear ai.
SetVisualizerEnabled=ad.SetEnabled ai.IsVisualizerEnabled=ad.IsEnabled ai.
RefreshVisuals=ad.RefreshAll ai.SetTrajectoryEnabled=ae.SetEnabled ai.
IsTrajectoryEnabled=ae.IsEnabled ai.SetTrajectoryLength=ae.SetPredictionLength
ai.GetTrajectoryLength=ae.GetPredictionLength ai.RefreshTrajectory=ae.RefreshAll
ai.IsPointInAnyTrajectory=ae.IsPointInAnyTrajectory ai.GetNearbyTrajectories=ae.
GetNearbyTrajectories ai.SetSelectionBoxesEnabled=ab.SetSelectionBoxesEnabled ai
.IsSelectionBoxesEnabled=ab.IsSelectionBoxesEnabled ai.StartDetection=ab.
StartScan ai.StopDetection=ab.StopScan ai.IsDetectionEnabled=ab.IsEnabled ai.
SetDetectionEnabled=ab.SetEnabled ai.SetLogHazards=ab.SetLogHazards ai.
IsLogHazardsEnabled=ab.IsLogHazardsEnabled ai.SetLogThreats=ai.SetLogHazards ai.
IsLogThreatsEnabled=ai.IsLogHazardsEnabled ai.SetLogFailed=ab.SetLogFailed ai.
IsLogFailedEnabled=ab.IsLogFailedEnabled ai.SetInspectTarget=ab.SetInspectTarget
ai.GetInspectTarget=ab.GetInspectTarget ai.SetInspectEnabled=ab.
SetInspectEnabled ai.IsInspectEnabled=ab.IsInspectEnabled ai.GetHazardCount=ab.
GetHazardCount ai.GetActiveHazards=ab.GetActiveHazards ai.GetLastHazardInfo=ab.
GetLastHazardInfo ai.OnHazardChanged=ab.OnHazardChanged function ai.StartScan()
ab.StartScan()end function ai.StopScan()ab.StopScan()end function ai.Toggle(aj)
if aj then ai.StartScan()else ai.StopScan()end end function ai.IsEnabled()return
ab.IsEnabled()end aa.Register(function()ab.StopScan()end)return ai end function
a.s()local aa,ab,ac,ad=a.load'a',a.load'c',a.load'b',a.load'g'local ae,af,ag,ah,
ai,aj,ak,al,am,an,ao,ap=aa.RunService or game:GetService'RunService',aa.
VirtualInputManager or game:GetService'VirtualInputManager',aa.player,{},false,
35,0.15,0,0,false,false function ah.IsEnabled()return ai end local aq,ar
function ah.SetEnabled(as)local at=as==true if at==ai then return end ai=at if
ai then aq()else ar()end end ah.IsSkillQEnabled=ah.IsEnabled ah.SetSkillQEnabled
=ah.SetEnabled ah.IsSkillEEnabled=ah.IsEnabled ah.SetSkillEEnabled=ah.SetEnabled
function ah.GetSkillERange()return aj end function ah.SetSkillERange(as)if type(
as)=='number'and as>=2 then aj=as end end function ah.GetSpamInterval()return ak
end function ah.SetSpamInterval(as)if type(as)=='number'and as>=0.05 then ak=as
end end function ah.IsBuffActive()local as,at=pcall(function()return workspace:
FindFirstChild'groundAura'end)return as and at~=nil end local as=function()local
as=ag or game:GetService'Players'.LocalPlayer local at=as and as.Character local
b=at and(at:FindFirstChild'HumanoidRootPart'or at.PrimaryPart)if b and b.Parent
then return b end return nil end local at=function()local at=as()if not at then
return nil,math.huge,false end local b,c=at.Position,ad.GetTarget and ad.
GetTarget()if c and c.Root and c.Root.Parent then local d=c.Humanoid or(c.Model
and c.Model:FindFirstChildOfClass'Humanoid')if d and d.Health>0 then local e=c.
Root.Position local f=Vector3.new(e.X-b.X,0,e.Z-b.Z).Magnitude return c,f,true
end end local d,e,f,g=ab.GetTrackedEnemyData and ab.GetTrackedEnemyData(),math.
huge,false if d and#d>0 then for h,i in ipairs(d)do if i and i.Root and i.Root.
Parent then local j=i.Humanoid or(i.Model and i.Model:FindFirstChildOfClass
'Humanoid')if j and j.Health>0 then f=true local l=i.Root.Position local m,n=l.X
-b.X,l.Z-b.Z local o=m*m+n*n if o<e then e=o g=i end end end end end local h=e<
math.huge and math.sqrt(e)or math.huge return g,h,f end function ah.CastSkillQ()
if an then return end an=true task.spawn(function()local b=(ab.GetKeyHoldTime
and ab.GetKeyHoldTime())or 0.05 pcall(function()af:SendKeyEvent(true,Enum.
KeyCode.Q,false,game)end)task.wait(b)pcall(function()af:SendKeyEvent(false,Enum.
KeyCode.Q,false,game)end)an=false end)end function ah.CastSkillE()if ao then
return end ao=true task.spawn(function()local b=(ab.GetKeyHoldTime and ab.
GetKeyHoldTime())or 0.05 pcall(function()af:SendKeyEvent(true,Enum.KeyCode.E,
false,game)end)task.wait(b)pcall(function()af:SendKeyEvent(false,Enum.KeyCode.E,
false,game)end)ao=false end)end local b=function()if not ai or ab.IsInLobby()
then return end local b=as()if not b then return end local c=b.Parent local d=c
and c:FindFirstChildOfClass'Humanoid'if d and d.Health<=0 then return end local
e,f,g=at()local h=os.clock()if(h-al>=ak)and not an then if g then al=h ah.
CastSkillQ()end end if(h-am>=ak)and not ao then if e and f<=aj then local i=ah.
IsBuffActive()if i then am=h ah.CastSkillE()end end end end aq=function()if not
ap then ap=ae.Heartbeat:Connect(b)end end ar=function()if ap then ap:Disconnect(
)ap=nil end an=false ao=false end function ah.Step(c,d,e)end ac.Register(
function()ah.SetEnabled(false)end)return ah end end local aa,ab,ac,ad,ae,af,ag,
ah,ai,aj=a.load'a',a.load'c',a.load'b',a.load'd',a.load'e',a.load'f',a.load'g',a
.load'h',a.load'r',a.load's'local ak,al,am,an,ao,ap,aq,ar,as,at,b,c,d,e,f,g,h,i=
aa.RunService,aa.player,{NO_TARGET='NO_TARGET',ACQUIRING_TARGET=
'ACQUIRING_TARGET',TRACKING_TARGET='TRACKING_TARGET',CHASE='CHASE',HOLD='HOLD',
KITE='KITE',BLOCKED='BLOCKED',REPATHING='REPATHING'},{},false,false,1.5,15,35,25
,50,true,6,true,true,true,true,true local j,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,
D,E,F,G,H,I,J,K,L,M,N,O,P=am.NO_TARGET,'None',0,0,false,false,0,0,false,10,false
,{},function()local j=al and al.Character local l=j and j:FindFirstChild
'HumanoidRootPart'if l and l.Parent then return l end return nil end,function(j)
if not j or not j.Parent then return nil end local l,m=pcall(function()return j.
Position end)if not l or not m then return nil end return m end,function(j)if ab
.IsBossActive and ab.IsBossActive()then return true end if j then if j.Room and
type(j.Room.Name)=='string'and string.find(string.lower(j.Room.Name),'boss')then
return true end if j.Model then local l=string.lower(j.Model.Name)if string.
find(l,'boss')then return true end local m=j.Model.Parent if m and string.find(
string.lower(m.Name),'boss')then return true end end end return false end local
Q,R=function(Q)if y(Q)then return at,b else return ar,as end end,function(Q,R)if
Q==R then return true end if Q and R and Q.Model and R.Model and Q.Model==R.
Model then return true end return false end local S=function(S,T)local U=ag.
GetTarget()if R(U,S)then return end ag.SetTarget(S,nil,nil,T)z=nil l='None'A=nil
B=nil q=0 if S then j=am.CHASE else j=am.NO_TARGET end end P=function()if o or
not ao or not ap then return end n+=1 local T=n o=true local U=w()local V=U and
x(U)if not V then o=false return end local W=ae.Scan()if#W==0 then if T==n and
ao and ap then S(nil,nil)end o=false return end local X,Y,Z,_=af.
SelectBestTarget(V,W,function()return T~=n or not ao or not ap end)if T==n and
ao and ap then S(X,_)end o=false end local au,av,aw,ax=function(T)if ab.
IsInLobby()or not p then return end local U,V=w(),ab.GetHumanoid()if not U or
not V or V.Health<=0 then return end local W=x(U)if not W then return end if ai.
IsCurrentlyDodging and ai.IsCurrentlyDodging()then return end if u then return
end local X=os.clock()if X-m>=aq then m=X if j~=am.HOLD and j~=am.KITE then P()
end end local Z=ag.GetTarget()if Z then if not ag.IsTargetValid()then ag.
ClearTarget()j=am.NO_TARGET z=nil l='None'B=nil pcall(function()V:MoveTo(W)V.
AutoRotate=true end)P()return end end if not Z or j==am.NO_TARGET then z=nil l=
'None'B=nil pcall(function()V:MoveTo(W)V.AutoRotate=true end)if not o and X-m>=
0.5 then m=X P()end return end local _=Z.Root and x(Z.Root)if not _ then ag.
ClearTarget()j=am.NO_TARGET B=nil pcall(function()V:MoveTo(W)V.AutoRotate=true
end)return end local au,av=Q(Z)local aw=Vector3.new(_.X-W.X,0,_.Z-W.Z)local ax=
aw.Magnitude if c and ax<=(av+25)then pcall(function()V.AutoRotate=false local
ay=Vector3.new(_.X,U.Position.Y,_.Z)if(ay-U.Position).Magnitude>0.5 then U.
CFrame=CFrame.lookAt(U.Position,ay)end end)else pcall(function()V.AutoRotate=
true end)end aj.Step(T,Z,ax)if ax<au then local ay=Vector3.new(W.X-_.X,0,W.Z-_.Z
)local az,aA=ay.Magnitude>0.1 and ay.Unit or Vector3.new(0,0,1),math.clamp(au-ax
+6,4,15)local aB,aC,aD=W+az*aA,true,ab.IsInvulnerable and ab.IsInvulnerable()if
not aD and ai and ai.IsPointSafe then aC=ai.IsPointSafe(aB,0.5)end if not aC
then j=am.HOLD l='Hold (Danger Behind)'z=nil q=0 pcall(function()V:MoveTo(W)end)
else j=am.KITE l='Kite'q=0 z=aB V:MoveTo(aB)end elseif ax<=av then j=am.HOLD z=
nil l='Hold'q=0 pcall(function()V:MoveTo(W)end)else local ay,az,aA=aw.Magnitude>
0.1 and aw.Unit or Vector3.new(0,0,1),false,ab.IsInvulnerable and ab.
IsInvulnerable()if not aA and ai and ai.IsPointSafe then for aB,aC in ipairs{3,6
,10}do if aC<ax then local aD=W+ay*aC if not ai.IsPointSafe(aD,0.5)then az=true
break end end end end if az then j=am.HOLD l='Hold (Danger Ahead)'z=nil q=0
pcall(function()V:MoveTo(W)end)else j=am.CHASE l='Chase'local aB=Vector3.new(_.X
,W.Y,_.Z)z=aB V:MoveTo(aB)local aC=_.Y-W.Y if aC>1.8 and ax<=8 then V.Jump=true
end local aD=U.AssemblyLinearVelocity or U.Velocity local aE,aF=aD and Vector3.
new(aD.X,0,aD.Z).Magnitude or 0,(type(T)=='number'and T>0)and T or 0.016 if aE<t
then q+=aF if s and(X-r)>=0.4 then V.Jump=true pcall(function()V:ChangeState(
Enum.HumanoidStateType.Jumping)end)r=X end else q=0 end end end end,function()if
F and F.Parent then return F end if F then pcall(function()F:Destroy()end)F=nil
end F=Instance.new'Highlight'F.Name='TM_EnemyHighlight_Debug'F.FillColor=Color3.
fromRGB(255,200,0)F.FillTransparency=0.5 F.OutlineColor=Color3.fromRGB(255,0,0)F
.OutlineTransparency=0 F.Parent=aa.CoreGui or game:GetService'CoreGui'return F
end,function()return workspace.Terrain end,function()for au,av in ipairs(v)do
pcall(function()av:Destroy()end)end table.clear(v)O=nil end local ay,az=function
()if ab.IsInLobby()then return end local ay,az=ag.GetTarget(),w()local aA,aB=az
and x(az),aw()if not g or not ay or not ay.Root then if F and F.Parent then F.
Enabled=false end else local aC=av()if ay.Model and ay.Model.Parent then aC.
Adornee=ay.Model aC.Enabled=true else aC.Enabled=false end end local aC,aD=ag.
GetWaypoints(),ag.GetPathInstance()if not e or not aC or#aC==0 or not aB then
ax()else local aE=tostring(aD)..'_'..tostring(#aC)if O~=aE then ax()for aF=2,#aC
do local T,U=aC[aF-1].Position,aC[aF].Position local V=(U-T).Magnitude if V>0.01
then local W=Instance.new'LineHandleAdornment'W.Name='TM_PathLine_Debug'W.
Adornee=aB W.AlwaysOnTop=true W.Length=V W.Thickness=2 W.Transparency=0.3 W.
Color3=Color3.fromRGB(0,255,120)W.ZIndex=0 W.CFrame=CFrame.lookAt(T,U)W.Parent=
aa.CoreGui or game:GetService'CoreGui'v[#v+1]=W end end O=aE end end if not f or
not z or not aA or not aB then if G then G.Visible=false end if H then H.Visible
=false end else local aE,aF=aA+Vector3.new(0,0.5,0),z+Vector3.new(0,0.5,0)local
T=(aF-aE).Magnitude if T>=0.3 then if not G or not G.Parent then G=Instance.new
'LineHandleAdornment'G.Name='TM_ActualPath_Debug'G.Adornee=aB G.AlwaysOnTop=true
G.Thickness=3.5 G.Transparency=0.15 G.Color3=Color3.fromRGB(0,230,255)G.ZIndex=2
G.Parent=aa.CoreGui or game:GetService'CoreGui'end G.Length=T G.CFrame=CFrame.
lookAt(aE,aF)G.Visible=true if not H or not H.Parent then H=Instance.new
'SphereHandleAdornment'H.Name='TM_ActualMarker_Debug'H.Adornee=aB H.AlwaysOnTop=
true H.Radius=0.65 H.Transparency=0.2 H.Color3=Color3.fromRGB(0,230,255)H.ZIndex
=3 H.Parent=aa.CoreGui or game:GetService'CoreGui'end H.CFrame=CFrame.new(aF)H.
Visible=true else if G then G.Visible=false end if H then H.Visible=false end
end end if not h or not B or not aA or not ay or not aB then if I then I.Visible
=false end if J then J.Visible=false end else local aE,aF,T=B.origin or(aA+
Vector3.new(0,1.5,0)),B.directHitPos or B.targetPos,B.directBlocked if aF then
local U=(aF-aE).Magnitude if U>=0.2 then if not I or not I.Parent then I=
Instance.new'LineHandleAdornment'I.Name='TM_BlockerRay_Debug'I.Adornee=aB I.
AlwaysOnTop=true I.Thickness=3 I.Transparency=0.2 I.ZIndex=3 I.Parent=aa.CoreGui
or game:GetService'CoreGui'end I.Length=U I.Color3=T and Color3.fromRGB(255,30,
30)or Color3.fromRGB(50,255,50)I.CFrame=CFrame.lookAt(aE,aF)I.Visible=true if T
and B.directHitPos then if not J or not J.Parent then J=Instance.new
'SphereHandleAdornment'J.Name='TM_BlockerHitMarker_Debug'J.Adornee=aB J.
AlwaysOnTop=true J.Radius=0.5 J.Transparency=0.2 J.Color3=Color3.fromRGB(255,30,
30)J.ZIndex=4 J.Parent=aa.CoreGui or game:GetService'CoreGui'end J.CFrame=CFrame
.new(B.directHitPos)J.Visible=true else if J then J.Visible=false end end else
if I then I.Visible=false end if J then J.Visible=false end end end end local aE
=ay and ay.Root if not i or not aE or not aE.Parent then if K then K.Visible=
false end if L then L.Visible=false end if M then M.Visible=false end if N then
N.Visible=false end else local aF=x(aE)or aE.Position local T=aA and(aA.Y-2.5)or
(aF.Y-2.5)local U=Vector3.new(aF.X,T,aF.Z)local V=CFrame.new(U)*CFrame.Angles(
math.rad(90),0,0)local W,X,Z=aE.CFrame:ToObjectSpace(V),Q(ay)local _=math.max(1,
X)local aG,aH=math.max(_+0.5,Z),0.35 if not K or not K.Parent then K=Instance.
new'CylinderHandleAdornment'K.Name='TM_MinDistanceFill_Debug'K.AlwaysOnTop=true
K.ZIndex=4 K.Parent=aa.CoreGui or game:GetService'CoreGui'end K.Adornee=aE K.
Height=0.02 K.InnerRadius=0 K.Radius=_ K.Color3=Color3.fromRGB(255,200,0)K.
Transparency=0.82 K.CFrame=W K.Visible=true if not L or not L.Parent then L=
Instance.new'CylinderHandleAdornment'L.Name='TM_MinDistanceRing_Debug'L.
AlwaysOnTop=true L.ZIndex=5 L.Parent=aa.CoreGui or game:GetService'CoreGui'end L
.Adornee=aE L.Height=0.05 L.InnerRadius=math.max(0.1,_-aH)L.Radius=_ L.Color3=
Color3.fromRGB(255,215,20)L.Transparency=0.25 L.CFrame=W L.Visible=true if not M
or not M.Parent then M=Instance.new'CylinderHandleAdornment'M.Name=
'TM_MaxDistanceFill_Debug'M.AlwaysOnTop=true M.ZIndex=4 M.Parent=aa.CoreGui or
game:GetService'CoreGui'end M.Adornee=aE M.Height=0.02 M.InnerRadius=_ M.Radius=
aG M.Color3=Color3.fromRGB(0,255,120)M.Transparency=0.82 M.CFrame=W M.Visible=
true if not N or not N.Parent then N=Instance.new'CylinderHandleAdornment'N.Name
='TM_MaxDistanceRing_Debug'N.AlwaysOnTop=true N.ZIndex=5 N.Parent=aa.CoreGui or
game:GetService'CoreGui'end N.Adornee=aE N.Height=0.05 N.InnerRadius=math.max(
0.1,aG-aH)N.Radius=aG N.Color3=Color3.fromRGB(0,255,120)N.Transparency=0.25 N.
CFrame=W N.Visible=true end end,function()if F then pcall(function()F:Destroy()
end)F=nil end if G then pcall(function()G:Destroy()end)G=nil end if H then
pcall(function()H:Destroy()end)H=nil end if I then pcall(function()I:Destroy()
end)I=nil end if J then pcall(function()J:Destroy()end)J=nil end if K then
pcall(function()K:Destroy()end)K=nil end if L then pcall(function()L:Destroy()
end)L=nil end if M then pcall(function()M:Destroy()end)M=nil end if N then
pcall(function()N:Destroy()end)N=nil end ax()end function an.IsEnabled()return
ao end function an.IsRunning()return ap end function an.GetState()return j end
function an.GetScanInterval()return aq end function an.SetScanInterval(aA)if
type(aA)=='number'and aA>0.1 then aq=aA end end function an.
GetMobMinCombatDistance()return ar end function an.SetMobMinCombatDistance(aA)if
type(aA)=='number'and aA>=1 then ar=aA if ar>as then as=ar+5 end end end
function an.GetMobMaxCombatDistance()return as end function an.
SetMobMaxCombatDistance(aA)if type(aA)=='number'and aA>=2 then as=aA if ar>as
then ar=math.max(1,as-5)end end end function an.GetBossMinCombatDistance()return
at end function an.SetBossMinCombatDistance(aA)if type(aA)=='number'and aA>=1
then at=aA if at>b then b=at+5 end end end function an.GetBossMaxCombatDistance(
)return b end function an.SetBossMaxCombatDistance(aA)if type(aA)=='number'and
aA>=2 then b=aA if at>b then at=math.max(1,b-5)end end end function an.
GetMinCombatDistance()return ar end function an.SetMinCombatDistance(aA)an.
SetMobMinCombatDistance(aA)end function an.GetMaxCombatDistance()return as end
function an.SetMaxCombatDistance(aA)an.SetMobMaxCombatDistance(aA)end an.
IsTargetBoss=y function an.IsAutoFaceTargetEnabled()return c end function an.
SetAutoFaceTarget(aA)c=aA and true or false if not c then local aB=ab.
GetHumanoid()if aB and aB.Parent then pcall(function()aB.AutoRotate=true end)end
end end function an.GetReachDistance()return maxCombatDistance end function an.
SetReachDistance(aA)if type(aA)=='number'and aA>=2 then an.SetMaxCombatDistance(
aA)end end function an.GetRepathDistance()return d end function an.
SetRepathDistance(aA)if type(aA)=='number'and aA>=1 then d=aA ag.
SetRepathThreshold(aA)end end function an.SetAutoJumpOnStuck(aA)s=aA==true end
function an.IsAutoJumpOnStuckEnabled()return s end function an.
SetStuckVelocityThreshold(aA)if type(aA)=='number'and aA>0 then t=aA end end
function an.GetStuckVelocityThreshold()return t end function an.SetPaused(aA)
local aB=aA and true or false if aB==u then return end u=aB if u then local aC,
aD=ab.GetHumanoid(),w()if aC and aC.Parent and aD then pcall(function()aC:
MoveTo(aD.Position)aC.AutoRotate=true end)end end end function an.IsPaused()
return u end function an.IsAutoSkillEnabled()return aj.IsEnabled()end function
an.SetAutoSkillEnabled(aA)aj.SetEnabled(aA)end an.IsAutoSkillQEnabled=aj.
IsSkillQEnabled an.SetAutoSkillQEnabled=aj.SetSkillQEnabled an.
IsAutoSkillEEnabled=aj.IsSkillEEnabled an.SetAutoSkillEEnabled=aj.
SetSkillEEnabled an.GetSkillERange=aj.GetSkillERange an.SetSkillERange=aj.
SetSkillERange an.GetSkillSpamInterval=aj.GetSpamInterval an.
SetSkillSpamInterval=aj.SetSkillSpamInterval an.IsBuffActive=aj.IsBuffActive an.
CastSkillQ=aj.CastSkillQ an.CastSkillE=aj.CastSkillE function an.
IsPlannedPathVisualEnabled()return e end function an.SetPlannedPathVisual(aA)e=
aA==true if not e then ax()end end function an.IsActualPathVisualEnabled()return
f end function an.SetActualPathVisual(aA)f=aA==true if not f then if G then G.
Visible=false end if H then H.Visible=false end end end function an.
IsBlockerRayVisualEnabled()return h end function an.SetBlockerRayVisual(aA)h=aA
==true if not h then if I then I.Visible=false end if J then J.Visible=false end
end end function an.IsTargetVisualEnabled()return g end function an.
SetTargetVisual(aA)g=aA==true if not g then if F and F.Parent then F.Enabled=
false end end end function an.IsCombatRangeVisualEnabled()return i end function
an.SetCombatRangeVisual(aA)i=aA==true if not i then if K then K.Visible=false
end if L then L.Visible=false end if M then M.Visible=false end if N then N.
Visible=false end end end function an.GetDebugInfo()local aA=w()local aB,aC,aD,
aE,aF,aG=aA and x(aA),ag.GetTarget(),'-',0,0,ag.GetWaypoints()if aC and aC.Model
then aD=aC.Model.Name or'-'local aH=x(aC.Root)if aH and aB then aE=(aH-aB).
Magnitude aF=Vector3.new(aH.X-aB.X,0,aH.Z-aB.Z).Magnitude end end local aH={
directBlocked=false,blockerName='None',blockerDist=0}if B then aH.directBlocked=
B.directBlocked==true if B.directHitPart then aH.blockerName=B.directHitPart.
Name or'Part'end if B.directHitPos and aB then aH.blockerDist=(B.directHitPos-aB
).Magnitude end end local T,U=0,0 if aA then local V=aA.AssemblyLinearVelocity
or aA.Velocity if V then T=Vector3.new(V.X,0,V.Z).Magnitude U=V.Y end end return
{state=j,enemyName=aD,enemyDist=aE,enemyFlat=aF,hasTarget=aC~=nil,destMode=l,
nodeIndex=A,waypointCount=aG and#aG or 0,hasDestination=z~=nil,blocker=aH,
velocity=T,verticalVelocity=U,stuckTimer=q}end function an.Toggle(aA,aB)if aA==
ao then return end ao=aA if ao then if not aB then ad.EnableExclusive'AutoFarm'
end if C then C:Disconnect()C=nil end ap=true n=0 o=false m=0 ag.
SetRepathThreshold(d)if not D then D=ab.OnEnemyChanged(function()if ao and ap
and j~=am.HOLD then P()end end)end if not E then E=ab.OnRespawn(function()ag.
ClearTarget()j=am.NO_TARGET B=nil P()end)end if not p then task.spawn(function()
if ab.ReadyDungeon()then p=true end end)end task.defer(P)C=ak.Heartbeat:Connect(
function(aC)local aD,aE=pcall(au,aC)if not aD then warn((
'[AutoFarm] Error in stepMovementLoop: %s'):format(tostring(aE)))end ay()end)
else if C then C:Disconnect()C=nil end ap=false if D then D()D=nil end if E then
E()E=nil end local aC,aD=ab.GetHumanoid(),w()if aC and aC.Parent and aD then
pcall(function()aC:MoveTo(aD.Position)aC.AutoRotate=true end)end ag.ClearTarget(
)j=am.NO_TARGET z=nil l='None'B=nil q=0 n+=1 o=false az()end end ad.Register(
'AutoFarm',an.Toggle,an.IsEnabled)ac.Register(function()an.Toggle(false)az()end)
return an