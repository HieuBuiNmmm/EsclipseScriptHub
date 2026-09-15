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
function()ah.SetEnabled(false)end)return ah end function a.t()local aa={Options=
{},Folder='Maclib',contextData={},GetService=function(aa)return cloneref and
cloneref(game:GetService(aa))or game:GetService(aa)end}local ab,ac,ad,ae,af,ag,
ah=aa.GetService'TweenService',aa.GetService'RunService',aa.GetService
'HttpService',aa.GetService'ContentProvider',aa.GetService'UserInputService',aa.
GetService'Lighting',aa.GetService'Players'local ai,aj,ak,al,am,an,ao,ap,aq,ar=
ac:IsStudio(),ah.LocalPlayer,{},0,false,{interFont='rbxassetid://12187365364',
userInfoBlurred='rbxassetid://18824089198',toggleBackground=
'rbxassetid://18772190202',togglerHead='rbxassetid://18772309008',buttonImage=
'rbxassetid://10709791437',searchIcon='rbxassetid://86737463322606',colorWheel=
'rbxassetid://2849458409',colorTarget='rbxassetid://73265255323268',grid=
'rbxassetid://121484455191370',globe='rbxassetid://108952102602834',transform=
'rbxassetid://90336395745819',dropdown='rbxassetid://18865373378',sliderbar=
'rbxassetid://18772615246',sliderhead='rbxassetid://18772834246'}local as,at=
function()local as=Instance.new'ScreenGui'as.ScreenInsets=Enum.ScreenInsets.None
as.ResetOnSpawn=false as.ZIndexBehavior=Enum.ZIndexBehavior.Sibling as.
DisplayOrder=2147483647 local at=ac:IsStudio()and aj:FindFirstChild'PlayerGui'or
(gethui and gethui())or(cloneref and cloneref(aa.GetService'CoreGui')or aa.
GetService'CoreGui')as.Parent=at return as end,function(as,at,b)return ab:
Create(as,at,b)end function aa:Window(b)local c={Settings=b}if b.AcrylicBlur~=
nil then ap=b.AcrylicBlur else ap=true end local d,e=as(),Instance.new'Frame'e.
Name='Notifications'e.BackgroundColor3=Color3.fromRGB(255,255,255)e.
BackgroundTransparency=1 e.BorderColor3=Color3.fromRGB(0,0,0)e.BorderSizePixel=0
e.Size=UDim2.fromScale(1,1)e.Parent=d e.ZIndex=2 local f=Instance.new
'UIListLayout'f.Name='NotificationsUIListLayout'f.Padding=UDim.new(0,10)f.
HorizontalAlignment=Enum.HorizontalAlignment.Right f.SortOrder=Enum.SortOrder.
LayoutOrder f.VerticalAlignment=Enum.VerticalAlignment.Bottom f.Parent=e local g
=Instance.new'UIPadding'g.Name='NotificationsUIPadding'g.PaddingBottom=UDim.new(
0,10)g.PaddingLeft=UDim.new(0,10)g.PaddingRight=UDim.new(0,10)g.PaddingTop=UDim.
new(0,10)g.Parent=e local h=Instance.new'Frame'h.Name='Base'h.AnchorPoint=
Vector2.new(0.5,0.5)h.BackgroundColor3=Color3.fromRGB(15,15,15)h.
BackgroundTransparency=b.AcrylicBlur and 0.05 or 0 h.BorderColor3=Color3.
fromRGB(0,0,0)h.BorderSizePixel=0 h.Position=UDim2.fromScale(0.5,0.5)h.Size=b.
Size or UDim2.fromOffset(868,650)local i=Instance.new'UIScale'i.Name=
'BaseUIScale'i.Parent=h local j=Instance.new'UICorner'j.Name='BaseUICorner'j.
CornerRadius=UDim.new(0,10)j.Parent=h local l=Instance.new'UIStroke'l.Name=
'BaseUIStroke'l.ApplyStrokeMode=Enum.ApplyStrokeMode.Border l.Color=Color3.
fromRGB(255,255,255)l.Transparency=0.9 l.Parent=h local m=Instance.new'Frame'm.
Name='Sidebar'm.BackgroundColor3=Color3.fromRGB(255,255,255)m.
BackgroundTransparency=1 m.BorderColor3=Color3.fromRGB(0,0,0)m.BorderSizePixel=0
m.Position=UDim2.fromScale(-3.5199999999999996E-8,4.69e-8)m.Size=b.SidebarWidth
and UDim2.new(0,b.SidebarWidth,1,0)or UDim2.fromScale(0.325,1)local n=Instance.
new'Frame'n.Name='Divider'n.AnchorPoint=Vector2.new(1,0)n.BackgroundColor3=
Color3.fromRGB(255,255,255)n.BackgroundTransparency=0.9 n.BorderColor3=Color3.
fromRGB(0,0,0)n.BorderSizePixel=0 n.Position=UDim2.fromScale(1,0)n.Size=UDim2.
new(0,1,1,0)n.Parent=m local o=Instance.new'TextButton'o.Name='DividerInteract'o
.AnchorPoint=Vector2.new(0.5,0)o.BackgroundColor3=Color3.fromRGB(255,255,255)o.
BackgroundTransparency=1 o.BorderColor3=Color3.fromRGB(0,0,0)o.BorderSizePixel=0
o.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'o.Position=
UDim2.fromScale(0.5,0)o.Size=UDim2.new(1,6,1,0)o.Text=''o.TextColor3=Color3.
fromRGB(0,0,0)o.TextSize=14 o.Parent=n local p=Instance.new'Frame'p.Name=
'WindowControls'p.BackgroundColor3=Color3.fromRGB(255,255,255)p.
BackgroundTransparency=1 p.BorderColor3=Color3.fromRGB(0,0,0)p.BorderSizePixel=0
p.Size=UDim2.new(1,0,0,31)local q=Instance.new'Frame'q.Name='Controls'q.
BackgroundColor3=Color3.fromRGB(119,174,94)q.BackgroundTransparency=1 q.
BorderColor3=Color3.fromRGB(0,0,0)q.BorderSizePixel=0 q.Size=UDim2.fromScale(1,1
)local r=Instance.new'UIListLayout'r.Name='UIListLayout'r.Padding=UDim.new(0,5)r
.FillDirection=Enum.FillDirection.Horizontal r.SortOrder=Enum.SortOrder.
LayoutOrder r.VerticalAlignment=Enum.VerticalAlignment.Center r.Parent=q local s
=Instance.new'UIPadding's.Name='UIPadding's.PaddingLeft=UDim.new(0,11)s.Parent=q
local t,u={sizes={enabled=UDim2.fromOffset(8,8),disabled=UDim2.fromOffset(7,7)},
transparencies={enabled=0,disabled=1},strokeTransparency=0.9},Instance.new
'UIStroke'u.Name='BaseUIStroke'u.ApplyStrokeMode=Enum.ApplyStrokeMode.Border u.
Color=Color3.fromRGB(255,255,255)u.Transparency=t.strokeTransparency local v=
Instance.new'TextButton'v.Name='Exit'v.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'v.Text=''v.TextColor3=Color3.
fromRGB(0,0,0)v.TextSize=14 v.AutoButtonColor=false v.BackgroundColor3=Color3.
fromRGB(250,93,86)v.BorderColor3=Color3.fromRGB(0,0,0)v.BorderSizePixel=0 local
w=Instance.new'UICorner'w.Name='UICorner'w.CornerRadius=UDim.new(1,0)w.Parent=v
v.Parent=q local x=Instance.new'TextButton'x.Name='Minimize'x.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'x.Text=''x.TextColor3=Color3.
fromRGB(0,0,0)x.TextSize=14 x.AutoButtonColor=false x.BackgroundColor3=Color3.
fromRGB(252,190,57)x.BorderColor3=Color3.fromRGB(0,0,0)x.BorderSizePixel=0 x.
LayoutOrder=1 local y=Instance.new'UICorner'y.Name='UICorner'y.CornerRadius=UDim
.new(1,0)y.Parent=x x.Parent=q local z=Instance.new'TextButton'z.Name='Maximize'
z.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'z.Text=''z.
TextColor3=Color3.fromRGB(0,0,0)z.TextSize=14 z.AutoButtonColor=false z.
BackgroundColor3=Color3.fromRGB(119,174,94)z.BorderColor3=Color3.fromRGB(0,0,0)z
.BorderSizePixel=0 z.LayoutOrder=1 local A=Instance.new'UICorner'A.Name=
'UICorner'A.CornerRadius=UDim.new(1,0)A.Parent=z z.Parent=q local B=function(B,C
)local D,E=C and t.sizes.enabled or t.sizes.disabled,C and t.transparencies.
enabled or t.transparencies.disabled B.Size=D B.BackgroundTransparency=E B.
Active=C B.Interactable=C for F,G in ipairs(B:GetChildren())do if G:IsA
'UIStroke'then G.Transparency=E end end if not C then u:Clone().Parent=B end end
B(z,false)local C={v,x}for D,E in pairs(C)do local F,G=E.Name,true if b.
DisabledWindowControls and table.find(b.DisabledWindowControls,F)then G=false
end B(E,G)end q.Parent=p local D=Instance.new'Frame'D.Name='Divider'D.
AnchorPoint=Vector2.new(0,1)D.BackgroundColor3=Color3.fromRGB(255,255,255)D.
BackgroundTransparency=0.9 D.BorderColor3=Color3.fromRGB(0,0,0)D.BorderSizePixel
=0 D.Position=UDim2.fromScale(0,1)D.Size=UDim2.new(1,0,0,1)D.Parent=p p.Parent=m
local E=Instance.new'Frame'E.Name='Information'E.BackgroundColor3=Color3.
fromRGB(255,255,255)E.BackgroundTransparency=1 E.BorderColor3=Color3.fromRGB(0,0
,0)E.BorderSizePixel=0 E.Position=UDim2.fromOffset(0,31)E.Size=UDim2.new(1,0,0,
60)local F=Instance.new'Frame'F.Name='Divider'F.AnchorPoint=Vector2.new(0,1)F.
BackgroundColor3=Color3.fromRGB(255,255,255)F.BackgroundTransparency=0.9 F.
BorderColor3=Color3.fromRGB(0,0,0)F.BorderSizePixel=0 F.Position=UDim2.
fromScale(0,1)F.Size=UDim2.new(1,0,0,1)F.Parent=E local G=Instance.new'Frame'G.
Name='InformationHolder'G.BackgroundColor3=Color3.fromRGB(255,255,255)G.
BackgroundTransparency=1 G.BorderColor3=Color3.fromRGB(0,0,0)G.BorderSizePixel=0
G.Size=UDim2.fromScale(1,1)local H=Instance.new'UIPadding'H.Name=
'InformationHolderUIPadding'H.PaddingBottom=UDim.new(0,10)H.PaddingLeft=UDim.
new(0,23)H.PaddingRight=UDim.new(0,22)H.PaddingTop=UDim.new(0,10)H.Parent=G
local I=Instance.new'ImageButton'I.Name='GlobalSettingsButton'I.Image=an.globe I
.ImageTransparency=0.5 I.AnchorPoint=Vector2.new(1,0.5)I.BackgroundColor3=Color3
.fromRGB(255,255,255)I.BackgroundTransparency=1 I.BorderColor3=Color3.fromRGB(0,
0,0)I.BorderSizePixel=0 I.Position=UDim2.fromScale(1,0.5)I.Size=UDim2.
fromOffset(16,16)I.Parent=G local J=function(J)if J=='Default'then at(I,
TweenInfo.new(0.2,Enum.EasingStyle.Sine),{ImageTransparency=0.5}):Play()elseif J
=='Hover'then at(I,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{ImageTransparency=
0.3}):Play()end end I.MouseEnter:Connect(function()J'Hover'end)I.MouseLeave:
Connect(function()J'Default'end)local K=Instance.new'Frame'K.Name='TitleFrame'K.
BackgroundColor3=Color3.fromRGB(255,255,255)K.BackgroundTransparency=1 K.
BorderColor3=Color3.fromRGB(0,0,0)K.BorderSizePixel=0 K.Size=UDim2.fromScale(1,1
)local L=Instance.new'TextLabel'L.Name='Title'L.FontFace=Font.new(an.interFont,
Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)L.Text=b.Title L.TextColor3=
Color3.fromRGB(255,255,255)L.RichText=true L.TextSize=18 L.TextTransparency=0.1
L.TextTruncate=Enum.TextTruncate.SplitWord L.TextXAlignment=Enum.TextXAlignment.
Left L.TextYAlignment=Enum.TextYAlignment.Top L.AutomaticSize=Enum.AutomaticSize
.Y L.BackgroundColor3=Color3.fromRGB(255,255,255)L.BackgroundTransparency=1 L.
BorderColor3=Color3.fromRGB(0,0,0)L.BorderSizePixel=0 L.Size=UDim2.new(1,-20,0,0
)L.Parent=K local M=Instance.new'TextLabel'M.Name='Subtitle'M.FontFace=Font.new(
an.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)M.RichText=true M.Text
=b.Subtitle M.RichText=true M.TextColor3=Color3.fromRGB(255,255,255)M.TextSize=
12 M.TextTransparency=0.7 M.TextTruncate=Enum.TextTruncate.SplitWord M.
TextXAlignment=Enum.TextXAlignment.Left M.TextYAlignment=Enum.TextYAlignment.Top
M.AutomaticSize=Enum.AutomaticSize.Y M.BackgroundColor3=Color3.fromRGB(255,255,
255)M.BackgroundTransparency=1 M.BorderColor3=Color3.fromRGB(0,0,0)M.
BorderSizePixel=0 M.LayoutOrder=1 M.Size=UDim2.new(1,-20,0,0)M.Parent=K local N=
Instance.new'UIListLayout'N.Name='TitleFrameUIListLayout'N.Padding=UDim.new(0,3)
N.SortOrder=Enum.SortOrder.LayoutOrder N.VerticalAlignment=Enum.
VerticalAlignment.Center N.Parent=K K.Parent=G G.Parent=E E.Parent=m local O=
Instance.new'Frame'O.Name='SidebarGroup'O.BackgroundColor3=Color3.fromRGB(255,
255,255)O.BackgroundTransparency=1 O.BorderColor3=Color3.fromRGB(0,0,0)O.
BorderSizePixel=0 O.Position=UDim2.fromOffset(0,91)O.Size=UDim2.new(1,0,1,-91)
local P=Instance.new'Frame'P.Name='UserInfo'P.AnchorPoint=Vector2.new(0,1)P.
BackgroundColor3=Color3.fromRGB(255,255,255)P.BackgroundTransparency=1 P.
BorderColor3=Color3.fromRGB(0,0,0)P.BorderSizePixel=0 P.Position=UDim2.
fromScale(0,1)P.Size=UDim2.new(1,0,0,107)local Q=Instance.new'Frame'Q.Name=
'InformationGroup'Q.BackgroundColor3=Color3.fromRGB(255,255,255)Q.
BackgroundTransparency=1 Q.BorderColor3=Color3.fromRGB(0,0,0)Q.BorderSizePixel=0
Q.Size=UDim2.fromScale(1,1)local R=Instance.new'UIPadding'R.Name=
'InformationGroupUIPadding'R.PaddingBottom=UDim.new(0,17)R.PaddingLeft=UDim.new(
0,25)R.Parent=Q local S=Instance.new'UIListLayout'S.Name=
'InformationGroupUIListLayout'S.FillDirection=Enum.FillDirection.Horizontal S.
SortOrder=Enum.SortOrder.LayoutOrder S.VerticalAlignment=Enum.VerticalAlignment.
Center S.Parent=Q local T,U,V=aj.UserId,Enum.ThumbnailType.AvatarBust,Enum.
ThumbnailSize.Size48x48 local W,X=ah:GetUserThumbnailAsync(T,U,V)local Y=
Instance.new'ImageLabel'Y.Name='Headshot'Y.BackgroundColor3=Color3.fromRGB(255,
255,255)Y.BackgroundTransparency=1 Y.BorderColor3=Color3.fromRGB(0,0,0)Y.
BorderSizePixel=0 Y.Size=UDim2.fromOffset(32,32)Y.Image=(X and W)or
'rbxassetid://0'local Z=Instance.new'UICorner'Z.Name='UICorner'Z.CornerRadius=
UDim.new(1,0)Z.Parent=Y local _=Instance.new'UIStroke'_.Name='BaseUIStroke'_.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border _.Color=Color3.fromRGB(255,255,255)_
.Transparency=0.9 _.Parent=Y Y.Parent=Q local au=Instance.new'Frame'au.Name=
'UserAndDisplayFrame'au.BackgroundColor3=Color3.fromRGB(255,255,255)au.
BackgroundTransparency=1 au.BorderColor3=Color3.fromRGB(0,0,0)au.BorderSizePixel
=0 au.LayoutOrder=1 au.Size=UDim2.new(1,-42,0,32)local av=Instance.new
'TextLabel'av.Name='DisplayName'av.FontFace=Font.new(an.interFont,Enum.
FontWeight.SemiBold,Enum.FontStyle.Normal)av.Text=aj.DisplayName av.TextColor3=
Color3.fromRGB(255,255,255)av.TextSize=13 av.TextTransparency=0.1 av.
TextTruncate=Enum.TextTruncate.SplitWord av.TextXAlignment=Enum.TextXAlignment.
Left av.TextYAlignment=Enum.TextYAlignment.Top av.AutomaticSize=Enum.
AutomaticSize.XY av.BackgroundColor3=Color3.fromRGB(255,255,255)av.
BackgroundTransparency=1 av.BorderColor3=Color3.fromRGB(0,0,0)av.BorderSizePixel
=0 av.Parent=au av.Size=UDim2.fromScale(1,0)local aw=Instance.new'UIPadding'aw.
Name='UserAndDisplayFrameUIPadding'aw.PaddingLeft=UDim.new(0,8)aw.PaddingTop=
UDim.new(0,3)aw.Parent=au local ax=Instance.new'UIListLayout'ax.Name=
'UserAndDisplayFrameUIListLayout'ax.Padding=UDim.new(0,1)ax.SortOrder=Enum.
SortOrder.LayoutOrder ax.Parent=au local ay=Instance.new'TextLabel'ay.Name=
'Username'ay.FontFace=Font.new(an.interFont,Enum.FontWeight.SemiBold,Enum.
FontStyle.Normal)ay.Text='@'..aj.Name ay.TextColor3=Color3.fromRGB(255,255,255)
ay.TextSize=12 ay.TextTransparency=0.7 ay.TextTruncate=Enum.TextTruncate.
SplitWord ay.TextXAlignment=Enum.TextXAlignment.Left ay.TextYAlignment=Enum.
TextYAlignment.Top ay.AutomaticSize=Enum.AutomaticSize.XY ay.BackgroundColor3=
Color3.fromRGB(255,255,255)ay.BackgroundTransparency=1 ay.BorderColor3=Color3.
fromRGB(0,0,0)ay.BorderSizePixel=0 ay.LayoutOrder=1 ay.Parent=au ay.Size=UDim2.
fromScale(1,0)au.Parent=Q Q.Parent=P local az=Instance.new'UIPadding'az.Name=
'UserInfoUIPadding'az.PaddingLeft=UDim.new(0,10)az.PaddingRight=UDim.new(0,10)az
.Parent=P P.Parent=O local aA=Instance.new'UIPadding'aA.Name=
'SidebarGroupUIPadding'aA.PaddingLeft=UDim.new(0,10)aA.PaddingRight=UDim.new(0,
10)aA.PaddingTop=UDim.new(0,31)aA.Parent=O local aB=Instance.new'Frame'aB.Name=
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
new(0,2)aE.Parent=aC aC.Parent=aB aB.Parent=O O.Parent=m m.Parent=h local aF=
Instance.new'Frame'aF.Name='Content'aF.AnchorPoint=Vector2.new(1,0)aF.
BackgroundColor3=Color3.fromRGB(255,255,255)aF.BackgroundTransparency=1 aF.
BorderColor3=Color3.fromRGB(0,0,0)aF.BorderSizePixel=0 aF.Position=UDim2.
fromScale(1,4.69e-8)aF.Size=UDim2.new(0,(h.AbsoluteSize.X-m.AbsoluteSize.X),1,0)
local aG,aH,aI,aJ,aK,aL=false,m.AbsoluteSize.X,20,107 local aM,aN=h.AbsoluteSize
.X-aJ,{DefaultTransparency=0.9,HoverTransparency=0.85,EasingStyle=Enum.
EasingStyle.Sine}local aO=function(aO)at(n,TweenInfo.new(0.2,aN.EasingStyle),{
BackgroundTransparency=aO=='Idle'and aN.DefaultTransparency or aN.
HoverTransparency}):Play()end o.MouseEnter:Connect(function()aO'Hover'end)o.
MouseLeave:Connect(function()aO'Idle'end)o.MouseButton1Down:Connect(function()aG
=true aK=af:GetMouseLocation().X aL=m.AbsoluteSize.X end)af.InputEnded:Connect(
function(aP)if aP.UserInputType==Enum.UserInputType.MouseButton1 then aG=false
end end)af.InputChanged:Connect(function(aP)if aG and aP.UserInputType==Enum.
UserInputType.MouseMovement then local aQ=af:GetMouseLocation().X-aK local aR=aL
+aQ if math.abs(aR-aH)<aI then aR=aH else aR=math.clamp(aR,aJ,aM)end m.Size=
UDim2.new(0,aR,1,0)aF.Size=UDim2.new(0,h.AbsoluteSize.X-aR,1,0)end end)local aP=
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
fromScale(1,0.5)aT.Size=UDim2.fromOffset(15,15)aT.Parent=aR aT.Visible=not b.
DragStyle or b.DragStyle==1 local aU=Instance.new'TextButton'aU.Name='Interact'
aU.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'aU.Text=''aU.
TextColor3=Color3.fromRGB(0,0,0)aU.TextSize=14 aU.AnchorPoint=Vector2.new(0.5,
0.5)aU.BackgroundColor3=Color3.fromRGB(255,255,255)aU.BackgroundTransparency=1
aU.BorderColor3=Color3.fromRGB(0,0,0)aU.BorderSizePixel=0 aU.Position=UDim2.
fromScale(0.5,0.5)aU.Size=UDim2.fromOffset(40,40)aU.Parent=aT local aV=function(
aV)if aV=='Default'then at(aT,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
ImageTransparency=0.7}):Play()elseif aV=='Hover'then at(aT,TweenInfo.new(0.2,
Enum.EasingStyle.Sine),{ImageTransparency=0.4}):Play()end end aU.MouseEnter:
Connect(function()aV'Hover'end)aU.MouseLeave:Connect(function()aV'Default'end)
local aW,aX,aY,aZ=false local a_,a0,a1=function(a_)local a0=a_.Position-aY h.
Position=UDim2.new(aZ.X.Scale,aZ.X.Offset+a0.X,aZ.Y.Scale,aZ.Y.Offset+a0.Y)end,
function(a_)if a_.UserInputType==Enum.UserInputType.MouseButton1 or a_.
UserInputType==Enum.UserInputType.Touch then aW=true aY=a_.Position aZ=h.
Position a_.Changed:Connect(function()if a_.UserInputState==Enum.UserInputState.
End then aW=false end end)end end,function(a_)if aW and(a_.UserInputType==Enum.
UserInputType.MouseMovement or a_.UserInputType==Enum.UserInputType.Touch)then
aX=a_ end end if not b.DragStyle or b.DragStyle==1 then aU.InputBegan:Connect(
function(a2)if a2.UserInputType==Enum.UserInputType.MouseButton1 or a2.
UserInputType==Enum.UserInputType.Touch then a0(a2)end end)aU.InputChanged:
Connect(a1)af.InputChanged:Connect(function(a2)if a2==aX and aW then a_(a2)end
end)aU.InputEnded:Connect(function(a2)if a2.UserInputType==Enum.UserInputType.
MouseButton1 or a2.UserInputType==Enum.UserInputType.Touch then aW=false end end
)elseif b.DragStyle==2 then h.InputBegan:Connect(function(a2)if a2.UserInputType
==Enum.UserInputType.MouseButton1 or a2.UserInputType==Enum.UserInputType.Touch
then a0(a2)end end)h.InputChanged:Connect(a1)af.InputChanged:Connect(function(a2
)if a2==aX and aW then a_(a2)end end)h.InputEnded:Connect(function(a2)if a2.
UserInputType==Enum.UserInputType.MouseButton1 or a2.UserInputType==Enum.
UserInputType.Touch then aW=false end end)end local a2=Instance.new'TextLabel'a2
.Name='CurrentTab'a2.FontFace=Font.new(an.interFont)a2.RichText=true a2.Text=''
a2.RichText=true a2.TextColor3=Color3.fromRGB(255,255,255)a2.TextSize=15 a2.
TextTransparency=0.5 a2.TextTruncate=Enum.TextTruncate.SplitWord a2.
TextXAlignment=Enum.TextXAlignment.Left a2.TextYAlignment=Enum.TextYAlignment.
Top a2.AnchorPoint=Vector2.new(0,0.5)a2.AutomaticSize=Enum.AutomaticSize.Y a2.
BackgroundColor3=Color3.fromRGB(255,255,255)a2.BackgroundTransparency=1 a2.
BorderColor3=Color3.fromRGB(0,0,0)a2.BorderSizePixel=0 a2.Position=UDim2.
fromScale(0,0.5)a2.Size=UDim2.fromScale(0.9,0)a2.Parent=aR aR.Parent=aP aP.
Parent=aF aF.Parent=h local a3=Instance.new'Frame'a3.Name='GlobalSettings'a3.
AutomaticSize=Enum.AutomaticSize.XY a3.BackgroundColor3=Color3.fromRGB(15,15,15)
a3.BorderColor3=Color3.fromRGB(0,0,0)a3.BorderSizePixel=0 a3.Position=UDim2.
fromScale(0.298,0.104)local a4=Instance.new'UIStroke'a4.Name=
'GlobalSettingsUIStroke'a4.ApplyStrokeMode=Enum.ApplyStrokeMode.Border a4.Color=
Color3.fromRGB(255,255,255)a4.Transparency=0.9 a4.Parent=a3 local a5=Instance.
new'UICorner'a5.Name='GlobalSettingsUICorner'a5.CornerRadius=UDim.new(0,10)a5.
Parent=a3 local a6=Instance.new'UIPadding'a6.Name='GlobalSettingsUIPadding'a6.
PaddingBottom=UDim.new(0,10)a6.PaddingTop=UDim.new(0,10)a6.Parent=a3 local a7=
Instance.new'UIListLayout'a7.Name='GlobalSettingsUIListLayout'a7.Padding=UDim.
new(0,5)a7.SortOrder=Enum.SortOrder.LayoutOrder a7.Parent=a3 local a8=Instance.
new'UIScale'a8.Name='GlobalSettingsUIScale'a8.Scale=1e-7 a8.Parent=a3 a3.Parent=
h h.Parent=d function c:UpdateTitle(a9)L.Text=a9 end function c:UpdateSubtitle(
a9)M.Text=a9 end local a9,ba=a8.Scale==1 and true or false local bb=function()if
not a9 then local bb=at(a8,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=1})bb:Play()bb.Completed:Wait()a9=true elseif a9
then local bb=at(a8,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=0})bb:Play()bb.Completed:Wait()a9=false end end I.
MouseButton1Click:Connect(function()if not aq then return end bb()end)a3.
MouseEnter:Connect(function()ba=true end)a3.MouseLeave:Connect(function()ba=
false end)af.InputEnded:Connect(function(bc)if bc.UserInputType==Enum.
UserInputType.MouseButton1 and a9 and not ba then bb()end end)local bc,bd,be,bf,
bg=h,ad,workspace.CurrentCamera,'Glass',{}local bh,bi=(bd:GenerateGUID(true))for
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
RenderStepped:Connect(bo)function c:GlobalSetting(bp)aq=true local bq,br={},
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
UpdateState(bA)by(bA)bz=bA end return bq end function c:TabGroup()local bp,bq={}
,Instance.new'Frame'bq.Name='Section'bq.AutomaticSize=Enum.AutomaticSize.Y bq.
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
cf-(cc+cd+ce+20))/i.Scale b4.Size=UDim2.new(b4.Size.X.Scale,cg,b4.Size.Y.Scale,
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
.X local cc=(cb-ca-20)/i.Scale b6.MaxSize=Vector2.new(cc,9e9)end ca()b5:
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
.Parent=dq dq.Parent=b6 b6.Parent=b4 b4.Parent=h local dv,dw,dx,dy,dz,dA,dB,dC,
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
dY.Parent=h dY.Visible=false return dY end local dZ=function(dZ)local d_,d0,d1,
d2,d3=dY(),dZ and 0 or 1,dZ and 1 or 0.95,dZ and 1 or 0,TweenInfo.new(0.1,Enum.
EasingStyle.Sine)local d4,d5=at(d_,d3,{GroupTransparency=d0}),at(b7,d3,{Scale=d1
})b4.Visible=true b4.Parent=d_ d_.Visible=true d_.GroupTransparency=d2 d4:Play()
d5:Play()d4.Completed:Wait()if not dZ then b4.Visible=false d_.Visible=false end
b4.Parent=h d_:Destroy()end local d_,d0=function()dZ(true)end,function()dZ(false
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
'Create Config',Callback=function()if not bQ or string.gsub(bQ,' ','')==''then c
:Notify{Title='Interface',Description='Config name cannot be empty.'}return end
local bT,bU=aa:SaveConfig(bQ)if not bT then c:Notify{Title='Interface',
Description='Unable to save config, return error: '..bU}end c:Notify{Title=
'Interface',Description=string.format('Created config %q',bQ)}bS:ClearOptions()
bS:InsertOptions(aa:RefreshConfigList())end}bP:Button{Name='Load Config',
Callback=function()local bT,bU=aa:LoadConfig(bS.Value)if not bT then c:Notify{
Title='Interface',Description='Unable to load config, return error: '..bU}return
end c:Notify{Title='Interface',Description=string.format('Loaded config %q',bS.
Value)}end}bP:Button{Name='Overwrite Config',Callback=function()local bT,bU=aa:
SaveConfig(bS.Value)if not bT then c:Notify{Title='Interface',Description=
'Unable to overwrite config, return error: '..bU}return end c:Notify{Title=
'Interface',Description=string.format('Overwrote config %q',bS.Value)}end}bP:
Button{Name='Refresh Config List',Callback=function()bS:ClearOptions()bS:
InsertOptions(aa:RefreshConfigList())end}local bT bP:Button{Name=
'Set as autoload',Callback=function()local bU=bS.Value writefile(aa.Folder..
'/settings/autoload.txt',bU)bT:UpdateName('Autoload config: '..bU)c:Notify{Title
='Interface',Description=string.format('Set %q as autoload',bU)}end}bT=bP:Label{
Text='Autoload config: None'}if isfile(aa.Folder..'/settings/autoload.txt')then
local bU=readfile(aa.Folder..'/settings/autoload.txt')bT:UpdateName(
'Autoload config: '..bU)end end ak[bx]={tabContent=bE,tabStroke=bz,switcherImage
=bB,switcherName=bC}return bw end return bp end function c:Notify(bp)local bq,br
={},Instance.new'Frame'br.Name='Notification'br.AnchorPoint=Vector2.new(0.5,0.5)
br.AutomaticSize=Enum.AutomaticSize.Y br.BackgroundColor3=Color3.fromRGB(15,15,
15)br.BorderColor3=Color3.fromRGB(0,0,0)br.BorderSizePixel=0 br.Position=UDim2.
fromScale(0.5,0.5)br.Size=UDim2.fromOffset(bp.SizeX or 250,0)br.Parent=e local
bs=Instance.new'UIStroke'bs.Name='NotificationUIStroke'bs.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border bs.Color=Color3.fromRGB(255,255,255)bs.Transparency=0.9
bs.Parent=br local bt=Instance.new'UICorner'bt.Name='NotificationUICorner'bt.
CornerRadius=UDim.new(0,10)bt.Parent=br local bu=Instance.new'UIScale'bu.Name=
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
Out bI:Play()bI.Completed:Wait()br:Destroy()end return bq end function c:Dialog(
bp)local bq,br={},Instance.new'CanvasGroup'br.Name='DialogCanvas'br.
BackgroundColor3=Color3.fromRGB(255,255,255)br.BackgroundTransparency=1 br.
BorderColor3=Color3.fromRGB(0,0,0)br.BorderSizePixel=0 br.Size=UDim2.fromScale(1
,1)br.GroupTransparency=1 br.Parent=h local bs=Instance.new'Frame'bs.Name=
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
Completed:Wait()bs.Parent=h end,function()if not bs.Parent then return end bs.
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
Text=bN end function bq:Cancel()bM()end return bq end function c:
SetNotificationsState(bp)e.Visible=bp end function c:GetNotificationsState(bp)
return e.Visible end function c:SetState(bp)ao=bp h.Visible=bp end function c:
GetState()return ao end local bp function c:Unload()if bp then bp()end d:
Destroy()am=true end function c.onUnloaded(bq)bp=bq end local bq=b.Keybind or
Enum.KeyCode.RightControl local br=function()local br=not c:GetState()c:
SetState(br)c:Notify{Title=b.Title,Description=(br and'Maximized 'or'Minimized '
)..'the menu. Use '..tostring(bq.Name)..' to toggle it.',Lifetime=5}end af.
InputEnded:Connect(function(bs,bt)if bt then return end if bs.KeyCode==bq then
br()end end)x.MouseButton1Click:Connect(br)v.MouseButton1Click:Connect(function(
)c:Dialog{Title=b.Title,Description=
[[Are you sure you want to exit the menu? You will lose any unsaved configurations.]]
,Buttons={{Name='Confirm',Callback=function()c:Unload()end},{Name='Cancel'}}}end
)function c:SetKeybind(bs)bq=bs end function c:SetAcrylicBlurState(bs)ap=bs h.
BackgroundTransparency=bs and 0.05 or 0 end function c:GetAcrylicBlurState()
return ap end local bs,bt=function(bs)if bs then Y.Image=(X and W)or
'rbxassetid://0'ay.Text='@'..aj.Name av.Text=aj.DisplayName else Y.Image=an.
userInfoBlurred local bt,bu=#aj.Name,#aj.DisplayName ay.Text='@'..string.rep('.'
,bt)av.Text=string.rep('.',bu)end end if b.ShowUserInfo~=nil then bt=b.
ShowUserInfo else bt=true end bs(bt)function c:SetUserInfoState(bu)bs(bu)end
function c:GetUserInfoState(bu)return bt end function c:SetSize(bu)h.Size=bu end
function c:GetSize(bu)return h.Size end function c:SetScale(bu)i.Scale=bu end
function c:GetScale()return i.Scale end local bu,bv={Toggle={Save=function(bu,bv
)return{type='Toggle',flag=bu,state=bv.State or false}end,Load=function(bu,bv)if
aa.Options[bu]and bv.state~=nil then aa.Options[bu]:UpdateState(bv.state)end end
},Slider={Save=function(bu,bv)return{type='Slider',flag=bu,value=(bv.Value and
tostring(bv.Value))or false}end,Load=function(bu,bv)if aa.Options[bu]and bv.
value then aa.Options[bu]:UpdateValue(bv.value)end end},Input={Save=function(bu,
bv)return{type='Input',flag=bu,text=bv.Text}end,Load=function(bu,bv)if aa.
Options[bu]and bv.text and type(bv.text)=='string'then aa.Options[bu]:
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
'/settings/autoload.txt')local bx,by=aa:LoadConfig(bw)if not bx then c:Notify{
Title='Interface',Description='Error loading autoload config: '..by}end c:Notify
{Title='Interface',Description=string.format('Autoloaded config: %q',bw)}end end
function aa:SetFolder(bw)if ai then return'Config system unavailable.'end aa.
Folder=bw bv()end function aa:SaveConfig(bw)if ai or not writefile then return
'Config system unavailable.'end if(not bw)then return false,
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
end return bx end d.Enabled=false local bw={}for bx,by in pairs(an)do table.
insert(bw,by)end ae:PreloadAsync(bw)d.Enabled=true ao=true return c end function
aa:Demo()local au=aa:Window{Title='Maclib Demo',Subtitle='This is a subtitle.',
Size=UDim2.fromOffset(868,650),DragStyle=1,DisabledWindowControls={},
ShowUserInfo=true,Keybind=Enum.KeyCode.RightControl,AcrylicBlur=true}local av,aw
={UIBlurToggle=au:GlobalSetting{Name='UI Blur',Default=au:GetAcrylicBlurState(),
Callback=function(av)au:SetAcrylicBlurState(av)au:Notify{Title=au.Settings.Title
,Description=(av and'Enabled'or'Disabled')..' UI Blur',Lifetime=5}end},
NotificationToggler=au:GlobalSetting{Name='Notifications',Default=au:
GetNotificationsState(),Callback=function(av)au:SetNotificationsState(av)au:
Notify{Title=au.Settings.Title,Description=(av and'Enabled'or'Disabled')..
' Notifications',Lifetime=5}end},ShowUserInfo=au:GlobalSetting{Name=
'Show User Info',Default=au:GetUserInfoState(),Callback=function(av)au:
SetUserInfoState(av)au:Notify{Title=au.Settings.Title,Description=(av and
'Showing'or'Redacted')..' User Info',Lifetime=5}end}},{TabGroup1=au:TabGroup()}
local ax={Main=aw.TabGroup1:Tab{Name='Demo',Image='rbxassetid://18821914323'},
Settings=aw.TabGroup1:Tab{Name='Settings',Image='rbxassetid://10734950309'}}
local ay={MainSection1=ax.Main:Section{Side='Left'}}ay.MainSection1:Header{Name=
'Header #1'}ay.MainSection1:Button{Name='Button',Callback=function()au:Dialog{
Title=au.Settings.Title,Description=
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
a.u()local aa,ab={}function aa:SetWindow(ac)ab=ac end function aa.Notify(ac,ad,
ae)ae=ae or 3 if ab then local af=pcall(function()ab:Notify{Title=ac,Description
=ad,Lifetime=ae}end)if af then return end end pcall(function()game:GetService
'StarterGui':SetCore('SendNotification',{Title=ac,Text=ad,Duration=ae})end)end
return aa end function a.v()local aa,ab,ac,ad,ae,af=a.load't',a.load'u',{},false
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
end end return ac end function a.w()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load't',a
.load'v',a.load'c',{},{Mob={Min=15,Max=35},Boss1={Min=25,Max=50},Boss2={Min=25,
Max=50},Boss3={Min=25,Max=50}},{Normal='Mob',['Boss 1']='Boss1',['Boss 2']=
'Boss2',['Boss 3']='Boss3'},{Mob='Normal',Boss1='Boss 1',Boss2='Boss 2',Boss3=
'Boss 3'},{},{}function ad.GetTargetDisplay(aj)return ag[aj]or'Normal'end
function ad.GetTargetKey(aj)return af[aj]or'Mob'end function ad.GetTargetOptions
()return{'Normal','Boss 1','Boss 2','Boss 3'}end function ad.GetSaveData()return
ah end function ad.LoadData(aj)if type(aj)=='table'then ah=aj else ah={}end aa.
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
return end if ah[ak]then ah[ak]=nil aj()end end return ad end end local aa,ab,ac
,ad,ae,af,ag,ah,ai,aj,ak=a.load'a',a.load'c',a.load'b',a.load'd',a.load'e',a.
load'f',a.load'g',a.load'h',a.load'r',a.load's',a.load'w'local al,am,an,ao,ap,aq
,ar,as,at,au,av,aw,ax,ay,az,aA,aB,aC=aa.RunService,aa.player,{NO_TARGET=
'NO_TARGET',ACQUIRING_TARGET='ACQUIRING_TARGET',TRACKING_TARGET=
'TRACKING_TARGET',CHASE='CHASE',HOLD='HOLD',KITE='KITE',BLOCKED='BLOCKED',
REPATHING='REPATHING'},{},false,false,1.5,15,35,25,50,true,6,true,true,true,true
,true local aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ,aR,aS,aT,aU,aV,aW,aX,aY,aZ
,a_,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9=an.NO_TARGET,'None',0,0,false,false,0,0,false,
10,false,{},function()local aD=am and am.Character local aE=aD and aD:
FindFirstChild'HumanoidRootPart'if aE and aE.Parent then return aE end return
nil end,function(aD)if not aD or not aD.Parent then return nil end local aE,aF=
pcall(function()return aD.Position end)if not aE or not aF then return nil end
return aF end,function(aD)if ab.IsBossActive and ab.IsBossActive()then return
true end if aD then if aD.Room and type(aD.Room.Name)=='string'and string.find(
string.lower(aD.Room.Name),'boss')then return true end if aD.Model then local aE
=string.lower(aD.Model.Name)if string.find(aE,'boss')then return true end local
aF=aD.Model.Parent if aF and string.find(string.lower(aF.Name),'boss')then
return true end end end return false end,function(aD)return ak.
GetActiveCombatDistances(aD)end,function(aD,aE)if aD==aE then return true end if
aD and aE and aD.Model and aE.Model and aD.Model==aE.Model then return true end
return false end local b=function(b,ba)local bb=ag.GetTarget()if aT(bb,b)then
return end ag.SetTarget(b,nil,nil,ba)aU=nil aE='None'aV=nil aW=nil aJ=0 if b
then aD=an.CHASE else aD=an.NO_TARGET end end a9=function()if aH or not ap or
not aq then return end aG+=1 local ba=aG aH=true local bb=aP()local bc=bb and
aQ(bb)if not bc then aH=false return end local bd=ae.Scan()if#bd==0 then if ba==
aG and ap and aq then b(nil,nil)end aH=false return end local be,bf,bg,bh=af.
SelectBestTarget(bc,bd,function()return ba~=aG or not ap or not aq end)if ba==aG
and ap and aq then b(be,bh)end aH=false end local ba,bb,bc,bd=function(ba)if ab.
IsInLobby()or not aI then return end local bb,bc=aP(),ab.GetHumanoid()if not bb
or not bc or bc.Health<=0 then return end local bd=aQ(bb)if not bd then return
end if ai.IsCurrentlyDodging and ai.IsCurrentlyDodging()then return end if aN
then return end local be=os.clock()if be-aF>=ar then aF=be if aD~=an.HOLD and aD
~=an.KITE then a9()end end local bg=ag.GetTarget()if bg then if not ag.
IsTargetValid()then ag.ClearTarget()aD=an.NO_TARGET aU=nil aE='None'aW=nil
pcall(function()bc:MoveTo(bd)bc.AutoRotate=true end)a9()return end end if not bg
or aD==an.NO_TARGET then aU=nil aE='None'aW=nil pcall(function()bc:MoveTo(bd)bc.
AutoRotate=true end)if not aH and be-aF>=0.5 then aF=be a9()end return end local
bh=bg.Root and aQ(bg.Root)if not bh then ag.ClearTarget()aD=an.NO_TARGET aW=nil
pcall(function()bc:MoveTo(bd)bc.AutoRotate=true end)return end local bi,bj=aS(bg
)local bk=Vector3.new(bh.X-bd.X,0,bh.Z-bd.Z)local bl=bk.Magnitude if aw and bl<=
(bj+25)then pcall(function()bc.AutoRotate=false local bm=Vector3.new(bh.X,bb.
Position.Y,bh.Z)if(bm-bb.Position).Magnitude>0.5 then bb.CFrame=CFrame.lookAt(bb
.Position,bm)end end)else pcall(function()bc.AutoRotate=true end)end aj.Step(ba,
bg,bl)if bl<bi then local bm=Vector3.new(bd.X-bh.X,0,bd.Z-bh.Z)local bn,bo=bm.
Magnitude>0.1 and bm.Unit or Vector3.new(0,0,1),math.clamp(bi-bl+6,4,15)local bp
,bq,br=bd+bn*bo,true,ab.IsInvulnerable and ab.IsInvulnerable()if not br and ai
and ai.IsPointSafe then bq=ai.IsPointSafe(bp,0.5)end if not bq then aD=an.HOLD
aE='Hold (Danger Behind)'aU=nil aJ=0 pcall(function()bc:MoveTo(bd)end)else aD=an
.KITE aE='Kite'aJ=0 aU=bp bc:MoveTo(bp)end elseif bl<=bj then aD=an.HOLD aU=nil
aE='Hold'aJ=0 pcall(function()bc:MoveTo(bd)end)else local bm,bn,bo=bk.Magnitude>
0.1 and bk.Unit or Vector3.new(0,0,1),false,ab.IsInvulnerable and ab.
IsInvulnerable()if not bo and ai and ai.IsPointSafe then for bp,bq in ipairs{3,6
,10}do if bq<bl then local br=bd+bm*bq if not ai.IsPointSafe(br,0.5)then bn=true
break end end end end if bn then aD=an.HOLD aE='Hold (Danger Ahead)'aU=nil aJ=0
pcall(function()bc:MoveTo(bd)end)else aD=an.CHASE aE='Chase'local bp=Vector3.
new(bh.X,bd.Y,bh.Z)aU=bp bc:MoveTo(bp)local bq=bh.Y-bd.Y if bq>1.8 and bl<=8
then bc.Jump=true end local br=bb.AssemblyLinearVelocity or bb.Velocity local bs
,bt=br and Vector3.new(br.X,0,br.Z).Magnitude or 0,(type(ba)=='number'and ba>0)
and ba or 0.016 if bs<aM then aJ+=bt if aL and(be-aK)>=0.4 then bc.Jump=true
pcall(function()bc:ChangeState(Enum.HumanoidStateType.Jumping)end)aK=be end else
aJ=0 end end end end,function()if a_ and a_.Parent then return a_ end if a_ then
pcall(function()a_:Destroy()end)a_=nil end a_=Instance.new'Highlight'a_.Name=
'TM_EnemyHighlight_Debug'a_.FillColor=Color3.fromRGB(255,200,0)a_.
FillTransparency=0.5 a_.OutlineColor=Color3.fromRGB(255,0,0)a_.
OutlineTransparency=0 a_.Parent=aa.CoreGui or game:GetService'CoreGui'return a_
end,function()return workspace.Terrain end,function()for ba,bb in ipairs(aO)do
pcall(function()bb:Destroy()end)end table.clear(aO)a8=nil end local be,bg=
function()if ab.IsInLobby()then return end local be,bg=ag.GetTarget(),aP()local
bh,bi=bg and aQ(bg),bc()if not aA or not be or not be.Root then if a_ and a_.
Parent then a_.Enabled=false end else local bj=bb()if be.Model and be.Model.
Parent then bj.Adornee=be.Model bj.Enabled=true else bj.Enabled=false end end
local bj,bk=ag.GetWaypoints(),ag.GetPathInstance()if not ay or not bj or#bj==0
or not bi then bd()else local bl=tostring(bk)..'_'..tostring(#bj)if a8~=bl then
bd()for bm=2,#bj do local bn,bo=bj[bm-1].Position,bj[bm].Position local bp=(bo-
bn).Magnitude if bp>0.01 then local bq=Instance.new'LineHandleAdornment'bq.Name=
'TM_PathLine_Debug'bq.Adornee=bi bq.AlwaysOnTop=true bq.Length=bp bq.Thickness=2
bq.Transparency=0.3 bq.Color3=Color3.fromRGB(0,255,120)bq.ZIndex=0 bq.CFrame=
CFrame.lookAt(bn,bo)bq.Parent=aa.CoreGui or game:GetService'CoreGui'aO[#aO+1]=bq
end end a8=bl end end if not az or not aU or not bh or not bi then if a0 then a0
.Visible=false end if a1 then a1.Visible=false end else local bl,bm=bh+Vector3.
new(0,0.5,0),aU+Vector3.new(0,0.5,0)local bn=(bm-bl).Magnitude if bn>=0.3 then
if not a0 or not a0.Parent then a0=Instance.new'LineHandleAdornment'a0.Name=
'TM_ActualPath_Debug'a0.Adornee=bi a0.AlwaysOnTop=true a0.Thickness=3.5 a0.
Transparency=0.15 a0.Color3=Color3.fromRGB(0,230,255)a0.ZIndex=2 a0.Parent=aa.
CoreGui or game:GetService'CoreGui'end a0.Length=bn a0.CFrame=CFrame.lookAt(bl,
bm)a0.Visible=true if not a1 or not a1.Parent then a1=Instance.new
'SphereHandleAdornment'a1.Name='TM_ActualMarker_Debug'a1.Adornee=bi a1.
AlwaysOnTop=true a1.Radius=0.65 a1.Transparency=0.2 a1.Color3=Color3.fromRGB(0,
230,255)a1.ZIndex=3 a1.Parent=aa.CoreGui or game:GetService'CoreGui'end a1.
CFrame=CFrame.new(bm)a1.Visible=true else if a0 then a0.Visible=false end if a1
then a1.Visible=false end end end if not aB or not aW or not bh or not be or not
bi then if a2 then a2.Visible=false end if a3 then a3.Visible=false end else
local bl,bm,bn=aW.origin or(bh+Vector3.new(0,1.5,0)),aW.directHitPos or aW.
targetPos,aW.directBlocked if bm then local bo=(bm-bl).Magnitude if bo>=0.2 then
if not a2 or not a2.Parent then a2=Instance.new'LineHandleAdornment'a2.Name=
'TM_BlockerRay_Debug'a2.Adornee=bi a2.AlwaysOnTop=true a2.Thickness=3 a2.
Transparency=0.2 a2.ZIndex=3 a2.Parent=aa.CoreGui or game:GetService'CoreGui'end
a2.Length=bo a2.Color3=bn and Color3.fromRGB(255,30,30)or Color3.fromRGB(50,255,
50)a2.CFrame=CFrame.lookAt(bl,bm)a2.Visible=true if bn and aW.directHitPos then
if not a3 or not a3.Parent then a3=Instance.new'SphereHandleAdornment'a3.Name=
'TM_BlockerHitMarker_Debug'a3.Adornee=bi a3.AlwaysOnTop=true a3.Radius=0.5 a3.
Transparency=0.2 a3.Color3=Color3.fromRGB(255,30,30)a3.ZIndex=4 a3.Parent=aa.
CoreGui or game:GetService'CoreGui'end a3.CFrame=CFrame.new(aW.directHitPos)a3.
Visible=true else if a3 then a3.Visible=false end end else if a2 then a2.Visible
=false end if a3 then a3.Visible=false end end end end local bl=be and be.Root
if not aC or not bl or not bl.Parent then if a4 then a4.Visible=false end if a5
then a5.Visible=false end if a6 then a6.Visible=false end if a7 then a7.Visible=
false end else local bm=aQ(bl)or bl.Position local bn=bh and(bh.Y-2.5)or(bm.Y-
2.5)local bo=Vector3.new(bm.X,bn,bm.Z)local bp=CFrame.new(bo)*CFrame.Angles(math
.rad(90),0,0)local bq,br,bs=bl.CFrame:ToObjectSpace(bp),aS(be)local bt=math.max(
1,br)local bu,bv=math.max(bt+0.5,bs),0.35 if not a4 or not a4.Parent then a4=
Instance.new'CylinderHandleAdornment'a4.Name='TM_MinDistanceFill_Debug'a4.
AlwaysOnTop=true a4.ZIndex=4 a4.Parent=aa.CoreGui or game:GetService'CoreGui'end
a4.Adornee=bl a4.Height=0.02 a4.InnerRadius=0 a4.Radius=bt a4.Color3=Color3.
fromRGB(255,200,0)a4.Transparency=0.82 a4.CFrame=bq a4.Visible=true if not a5 or
not a5.Parent then a5=Instance.new'CylinderHandleAdornment'a5.Name=
'TM_MinDistanceRing_Debug'a5.AlwaysOnTop=true a5.ZIndex=5 a5.Parent=aa.CoreGui
or game:GetService'CoreGui'end a5.Adornee=bl a5.Height=0.05 a5.InnerRadius=math.
max(0.1,bt-bv)a5.Radius=bt a5.Color3=Color3.fromRGB(255,215,20)a5.Transparency=
0.25 a5.CFrame=bq a5.Visible=true if not a6 or not a6.Parent then a6=Instance.
new'CylinderHandleAdornment'a6.Name='TM_MaxDistanceFill_Debug'a6.AlwaysOnTop=
true a6.ZIndex=4 a6.Parent=aa.CoreGui or game:GetService'CoreGui'end a6.Adornee=
bl a6.Height=0.02 a6.InnerRadius=bt a6.Radius=bu a6.Color3=Color3.fromRGB(0,255,
120)a6.Transparency=0.82 a6.CFrame=bq a6.Visible=true if not a7 or not a7.Parent
then a7=Instance.new'CylinderHandleAdornment'a7.Name='TM_MaxDistanceRing_Debug'
a7.AlwaysOnTop=true a7.ZIndex=5 a7.Parent=aa.CoreGui or game:GetService'CoreGui'
end a7.Adornee=bl a7.Height=0.05 a7.InnerRadius=math.max(0.1,bu-bv)a7.Radius=bu
a7.Color3=Color3.fromRGB(0,255,120)a7.Transparency=0.25 a7.CFrame=bq a7.Visible=
true end end,function()if a_ then pcall(function()a_:Destroy()end)a_=nil end if
a0 then pcall(function()a0:Destroy()end)a0=nil end if a1 then pcall(function()a1
:Destroy()end)a1=nil end if a2 then pcall(function()a2:Destroy()end)a2=nil end
if a3 then pcall(function()a3:Destroy()end)a3=nil end if a4 then pcall(function(
)a4:Destroy()end)a4=nil end if a5 then pcall(function()a5:Destroy()end)a5=nil
end if a6 then pcall(function()a6:Destroy()end)a6=nil end if a7 then pcall(
function()a7:Destroy()end)a7=nil end bd()end function ao.IsEnabled()return ap
end function ao.IsRunning()return aq end function ao.GetState()return aD end
function ao.GetScanInterval()return ar end function ao.SetScanInterval(bh)if
type(bh)=='number'and bh>0.1 then ar=bh end end function ao.
GetMobMinCombatDistance()return as end function ao.SetMobMinCombatDistance(bh)if
type(bh)=='number'and bh>=1 then as=bh if as>at then at=as+5 end end end
function ao.GetMobMaxCombatDistance()return at end function ao.
SetMobMaxCombatDistance(bh)if type(bh)=='number'and bh>=2 then at=bh if as>at
then as=math.max(1,at-5)end end end function ao.GetBossMinCombatDistance()return
au end function ao.SetBossMinCombatDistance(bh)if type(bh)=='number'and bh>=1
then au=bh if au>av then av=au+5 end end end function ao.
GetBossMaxCombatDistance()return av end function ao.SetBossMaxCombatDistance(bh)
if type(bh)=='number'and bh>=2 then av=bh if au>av then au=math.max(1,av-5)end
end end function ao.GetMinCombatDistance()return as end function ao.
SetMinCombatDistance(bh)ao.SetMobMinCombatDistance(bh)end function ao.
GetMaxCombatDistance()return at end function ao.SetMaxCombatDistance(bh)ao.
SetMobMaxCombatDistance(bh)end ao.IsTargetBoss=aR function ao.
IsAutoFaceTargetEnabled()return aw end function ao.SetAutoFaceTarget(bh)aw=bh
and true or false if not aw then local bi=ab.GetHumanoid()if bi and bi.Parent
then pcall(function()bi.AutoRotate=true end)end end end function ao.
GetReachDistance()return maxCombatDistance end function ao.SetReachDistance(bh)
if type(bh)=='number'and bh>=2 then ao.SetMaxCombatDistance(bh)end end function
ao.GetRepathDistance()return ax end function ao.SetRepathDistance(bh)if type(bh)
=='number'and bh>=1 then ax=bh ag.SetRepathThreshold(bh)end end function ao.
SetAutoJumpOnStuck(bh)aL=bh==true end function ao.IsAutoJumpOnStuckEnabled()
return aL end function ao.SetStuckVelocityThreshold(bh)if type(bh)=='number'and
bh>0 then aM=bh end end function ao.GetStuckVelocityThreshold()return aM end
function ao.SetPaused(bh)local bi=bh and true or false if bi==aN then return end
aN=bi if aN then local bj,bk=ab.GetHumanoid(),aP()if bj and bj.Parent and bk
then pcall(function()bj:MoveTo(bk.Position)bj.AutoRotate=true end)end end end
function ao.IsPaused()return aN end function ao.IsAutoSkillEnabled()return aj.
IsEnabled()end function ao.SetAutoSkillEnabled(bh)aj.SetEnabled(bh)end ao.
IsAutoSkillQEnabled=aj.IsSkillQEnabled ao.SetAutoSkillQEnabled=aj.
SetSkillQEnabled ao.IsAutoSkillEEnabled=aj.IsSkillEEnabled ao.
SetAutoSkillEEnabled=aj.SetSkillEEnabled ao.GetSkillERange=aj.GetSkillERange ao.
SetSkillERange=aj.SetSkillERange ao.GetSkillSpamInterval=aj.GetSpamInterval ao.
SetSkillSpamInterval=aj.SetSkillSpamInterval ao.IsBuffActive=aj.IsBuffActive ao.
CastSkillQ=aj.CastSkillQ ao.CastSkillE=aj.CastSkillE function ao.
IsPlannedPathVisualEnabled()return ay end function ao.SetPlannedPathVisual(bh)ay
=bh==true if not ay then bd()end end function ao.IsActualPathVisualEnabled()
return az end function ao.SetActualPathVisual(bh)az=bh==true if not az then if
a0 then a0.Visible=false end if a1 then a1.Visible=false end end end function ao
.IsBlockerRayVisualEnabled()return aB end function ao.SetBlockerRayVisual(bh)aB=
bh==true if not aB then if a2 then a2.Visible=false end if a3 then a3.Visible=
false end end end function ao.IsTargetVisualEnabled()return aA end function ao.
SetTargetVisual(bh)aA=bh==true if not aA then if a_ and a_.Parent then a_.
Enabled=false end end end function ao.IsCombatRangeVisualEnabled()return aC end
function ao.SetCombatRangeVisual(bh)aC=bh==true if not aC then if a4 then a4.
Visible=false end if a5 then a5.Visible=false end if a6 then a6.Visible=false
end if a7 then a7.Visible=false end end end function ao.GetDebugInfo()local bh=
aP()local bi,bj,bk,bl,bm,bn=bh and aQ(bh),ag.GetTarget(),'-',0,0,ag.
GetWaypoints()if bj and bj.Model then bk=bj.Model.Name or'-'local bo=aQ(bj.Root)
if bo and bi then bl=(bo-bi).Magnitude bm=Vector3.new(bo.X-bi.X,0,bo.Z-bi.Z).
Magnitude end end local bo={directBlocked=false,blockerName='None',blockerDist=0
}if aW then bo.directBlocked=aW.directBlocked==true if aW.directHitPart then bo.
blockerName=aW.directHitPart.Name or'Part'end if aW.directHitPos and bi then bo.
blockerDist=(aW.directHitPos-bi).Magnitude end end local bp,bq=0,0 if bh then
local br=bh.AssemblyLinearVelocity or bh.Velocity if br then bp=Vector3.new(br.X
,0,br.Z).Magnitude bq=br.Y end end return{state=aD,enemyName=bk,enemyDist=bl,
enemyFlat=bm,hasTarget=bj~=nil,destMode=aE,nodeIndex=aV,waypointCount=bn and#bn
or 0,hasDestination=aU~=nil,blocker=bo,velocity=bp,verticalVelocity=bq,
stuckTimer=aJ}end function ao.Toggle(bh,bi)if bh==ap then return end ap=bh if ap
then if not bi then ad.EnableExclusive'AutoFarm'end if aX then aX:Disconnect()aX
=nil end aq=true aG=0 aH=false aF=0 ag.SetRepathThreshold(ax)if not aY then aY=
ab.OnEnemyChanged(function()if ap and aq and aD~=an.HOLD then a9()end end)end if
not aZ then aZ=ab.OnRespawn(function()ag.ClearTarget()aD=an.NO_TARGET aW=nil a9(
)end)end if not aI then task.spawn(function()if ab.ReadyDungeon()then aI=true
end end)end task.defer(a9)aX=al.Heartbeat:Connect(function(bj)local bk,bl=pcall(
ba,bj)if not bk then warn(('[AutoFarm] Error in stepMovementLoop: %s'):format(
tostring(bl)))end be()end)else if aX then aX:Disconnect()aX=nil end aq=false if
aY then aY()aY=nil end if aZ then aZ()aZ=nil end local bj,bk=ab.GetHumanoid(),
aP()if bj and bj.Parent and bk then pcall(function()bj:MoveTo(bk.Position)bj.
AutoRotate=true end)end ag.ClearTarget()aD=an.NO_TARGET aU=nil aE='None'aW=nil
aJ=0 aG+=1 aH=false bg()end end ad.Register('AutoFarm',ao.Toggle,ao.IsEnabled)ac
.Register(function()ao.Toggle(false)bg()end)return ao