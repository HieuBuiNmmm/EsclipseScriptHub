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
pcall(function()aq:Enable()end)end N()end)return h end function a.d()local aa,ab
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
aq=ap:lower():gsub('%s+','')if#aq==0 then return false end for b,c in ipairs(ao)
do if string.find(aq,c,1,true)then return true end end return false end function
aa.IsMovingBeam(aq)return ap(aq)end local aq,b={'firstbossbigspike',
'firstbossbeampart','bigspike'},function(aq)if not aq or type(aq)~='string'then
return false end local b=aq:lower():gsub('%s+','')return string.find(b,
'firstbossbeampart',1,true)~=nil end function aa.IsBeamTelegraph(c)return b(c)
end local c=function(c)if not c or type(c)~='string'then return false end local
d=c:lower():gsub('%s+','')if#d==0 or string.find(d,'seekingspike',1,true)then
return false end for e,f in ipairs(aq)do if string.find(d,f,1,true)then return
true end end return false end function aa.IsBigSpike(d)return c(d)end local d=
function()if ak and ak>0 then return ak end local d,e=45,ah:FindFirstChild
'enemyProjectiles'if not e then return d end local f=e:FindFirstChild
'largeIceSpikes'if not f then for g,h in ipairs(e:GetChildren())do local i=(h.
Name or''):lower():gsub('%s+','')if i=='largeicespikes'then f=h break end end
end if not f then return d end local g,h=0,Vector3.zero if f:IsA'Model'and f.
PrimaryPart then h=f.PrimaryPart.Position elseif f:IsA'BasePart'then h=f.
Position end local i={}if f:IsA'BasePart'then table.insert(i,f)else for j,k in
ipairs(f:GetDescendants())do if k:IsA'BasePart'then table.insert(i,k)end end end
if#i==0 then return d end for j,k in ipairs(i)do local l=k.Size local m,n=math.
max(l.X,l.Z)/2,(Vector3.new(k.Position.X,0,k.Position.Z)-Vector3.new(h.X,0,h.Z))
.Magnitude local o=n+m if o>g then g=o end end if g>=5 then ak=g return ak end
return d end function aa.GetLargeIceSpikesMaxRadius()return d()end local e=
function(e)if not e or type(e)~='string'then return false end local f=e:lower():
gsub('%s+','')if#f==0 then return false end for g,h in ipairs(ai)do local i=h:
lower():gsub('%s+','')if#i>0 and string.find(f,i,1,true)then return true end end
return false end function aa.IsForceCircle(f)return e(f)end function aa.
AddForceCircleName(f)if type(f)=='string'and#f>0 then table.insert(ai,f)aa.
InvalidateCache()end end function aa.GetForceCircleNames()return ai end local f,
g,h,i=function(f)return f and f.Parent and f.Transparency<=ab end,function(f,g,h
)local i,j,k,l=f.Size,h and ad or ac,(f and f.Name)or'',(f and f.Parent and f.
Parent.Name)or''if ap(k)or ap(l)then local m,n=math.max(i.X,i.Z)/2+j,math.max(2,
math.min(i.X,i.Z)/2+j)return{half=Vector3.new(m,0,n),cframe=f.CFrame,
isMovingBeam=true}end if c(k)or c(l)then local m,n=i,f:FindFirstChildWhichIsA(
'SpecialMesh',true)if n then m=Vector3.new(m.X*math.abs(n.Scale.X),m.Y*math.abs(
n.Scale.Y),m.Z*math.abs(n.Scale.Z))end local o={m.X,m.Y,m.Z}table.sort(o)local p
,q=math.clamp(o[2],6,60),math.clamp(o[3],8,80)local r,s=p/2+j,q/2+j return{half=
Vector3.new(r,0,s),cframe=f.CFrame,isBigSpike=true}end if g or(f:IsA'Part'and(f.
Shape==Enum.PartType.Ball or f.Shape==Enum.PartType.Cylinder))then return{radius
=math.max(i.X,i.Y,i.Z)/2}end local m=Vector3.new(math.max(i.X,0)/2+j,0,math.max(
i.Z,0)/2+j)return{half=m,cframe=f.CFrame}end,function(f,g,h,i)if not g then
return false end if g.expireTime and os.clock()>g.expireTime then return false
end local j,k=f.X,f.Z h=h or 0 local l=(i or g.isTrajectory)and ad or ac if g.
radius then local m,n=(g.part and g.part.Parent)and g.part.Position,g.
isSecondBossChain==true local o,p=(n and g.cx)or(m and m.X)or g.cx or 0,(n and g
.cz)or(m and m.Z)or g.cz or 0 local q,r,s=j-o,k-p,g.radius+l+h return(q*q+r*r)<=
(s*s)end local m=(g.part and g.part.Parent)and g.part.CFrame or g.cframe if m
then local n,o,p=m:PointToObjectSpace(f),g.half.X,g.half.Z if h<=0 then return
math.abs(n.X)<=o and math.abs(n.Z)<=p else local q,r=math.max(0,math.abs(n.X)-o)
,math.max(0,math.abs(n.Z)-p)return(q*q+r*r)<=(h*h)end end return false end,
function(f,g)local h=(g and g.CFrame)or(f:IsA'Model'and f:GetPivot())if h then
local i=h.LookVector local j=Vector3.new(-i.X,0,-i.Z)if j.Magnitude>0.05 then
return j.Unit end end local i=services.player or game:GetService'Players'.
LocalPlayer local j=i and i.Character local k=j and(j:FindFirstChild
'HumanoidRootPart'or j.PrimaryPart)if k and g then local l=Vector3.new(k.
Position.X-g.Position.X,0,k.Position.Z-g.Position.Z)if l.Magnitude>0.1 then
return l.Unit end end return Vector3.new(0,0,-1)end local j=function(j)if not j
or not j.Instance or not j.Instance.Parent then return nil end local k=j.
Instance local l=j.Name or(k and k.Name)or''local m,n=e(l),j.IsTrajectory==true
local o,p=n and ad or ac if al(l)then local q,r=(d())if k:IsA'BasePart'then r=f(
k)and k or nil elseif k:IsA'Model'then if k.PrimaryPart and f(k.PrimaryPart)then
r=k.PrimaryPart else for s,t in ipairs(k:GetDescendants())do if t:IsA'BasePart'
and f(t)and t.Parent then r=t break end end end end if not r then return nil end
local s=r.Position local t={radius=q,cx=s.X,cz=s.Z,part=r,isTrajectory=false,
isIceSpikes=true}return{zones={t},center=Vector3.new(s.X,0,s.Z),boundingRadius=q
+o}end if an(l)then local q if k:IsA'BasePart'then q=f(k)and k or nil elseif k:
IsA'Model'then if k.PrimaryPart and f(k.PrimaryPart)then q=k.PrimaryPart else
for r,s in ipairs(k:GetDescendants())do if s:IsA'BasePart'and f(s)and s.Parent
then q=s break end end end end if not q then return nil end local r,s,t,u,v,w,x,
y,z,A=q.Position,i(k,q),j.SpawnClock or os.clock(),{},10,11,3,22,2.2,0.4 local B
=(v-1)*y for C=1,v do local D=(C-1)*y local E,F,G=Vector3.new(r.X,0,r.Z)+s*D,w+(
C-1)*x,t+z+(C-1)*A table.insert(u,{radius=F,cx=E.X,cz=E.Z,part=q,expireTime=G,
isTrajectory=false,isSecondBossChain=true,circleIndex=C})end local C,D=Vector3.
new(r.X,0,r.Z)+s*(B/2),w+(v-1)*x local E,F=(B/2)+D+o,t+z+(v-1)*A if j then j.
MaxExpireTime=F j.IsSyntheticChain=true end return{zones=u,center=C,
boundingRadius=E,maxExpireTime=F}end if ap(l)then local q if k:IsA'BasePart'then
q=f(k)and k or nil elseif k:IsA'Model'then q=k.PrimaryPart or k:
FindFirstChildWhichIsA'BasePart'if not q or not f(q)then for r,s in ipairs(k:
GetDescendants())do if s:IsA'BasePart'and f(s)and s.Parent then q=s break end
end end end if not q then return nil end local r,s=q.Position,q.Size local t,u=
math.max(s.X,s.Z),math.max(3.5,math.min(s.X,s.Z))local v,w=t/2+o,u/2+o local x={
half=Vector3.new(v,0,w),cframe=q.CFrame,part=q,cx=r.X,cz=r.Z,isTrajectory=n,
isMovingBeam=true}return{zones={x},center=Vector3.new(r.X,0,r.Z),boundingRadius=
math.sqrt(v*v+w*w)}end if b(l)then return nil end if c(l)then local q if k:IsA
'BasePart'then q=f(k)and k or nil elseif k:IsA'Model'then q=k.PrimaryPart or k:
FindFirstChildWhichIsA'BasePart'if not q or not f(q)then for r,s in ipairs(k:
GetDescendants())do if s:IsA'BasePart'and f(s)and s.Parent then q=s break end
end end end if not q then return nil end local r,s,t=q.Position,q.Size,q:
FindFirstChildWhichIsA('SpecialMesh',true)if t then s=Vector3.new(s.X*math.abs(t
.Scale.X),s.Y*math.abs(t.Scale.Y),s.Z*math.abs(t.Scale.Z))end local u={s.X,s.Y,s
.Z}table.sort(u)local v,w=math.clamp(u[2],6,60),math.clamp(u[3],8,80)local x,y=v
/2+o,w/2+o local z={half=Vector3.new(x,0,y),cframe=q.CFrame,part=q,cx=r.X,cz=r.Z
,isTrajectory=n,isBigSpike=true}return{zones={z},center=Vector3.new(r.X,0,r.Z),
boundingRadius=math.sqrt(x*x+y*y)}end if k:IsA'BasePart'then if not f(k)then
return nil end p={k}else p={}for q,r in ipairs(k:GetDescendants())do if#p>=af
then break end if r:IsA'BasePart'and f(r)and r.Parent then p[#p+1]=r end end if#
p==0 then return nil end end local q,r,s,t,u={},math.huge,-math.huge,math.huge,-
math.huge for v,w in ipairs(p)do local x,y=w.Position,w.Size local z=math.max(y.
X,y.Y,y.Z)/2+o r=math.min(r,x.X-z)s=math.max(s,x.X+z)t=math.min(t,x.Z-z)u=math.
max(u,x.Z+z)local A=g(w,m,n)if A then A.part=w A.isTrajectory=n q[#q+1]=A end
end if#q==0 then return nil end local v,w,x,y=(r+s)/2,(t+u)/2,(s-r)/2,(u-t)/2
return{zones=q,center=Vector3.new(v,0,w),boundingRadius=math.sqrt(x*x+y*y)}end
local k=function(k)local l=k and k.HazardZones if not l then l=j(k)if l and k
then k.HazardZones=l end end return l end function aa.GetHazardZones(l)return k(
l)end function aa.GetNearbyHazards(l,m)local n=ag if not n then return{}end m=m
or 65 local o,p,q={},l.X,l.Z for r,s in pairs(n.GetActiveHazardsMap())do local t
,u=s.Instance,k(s)if u then local v,w=u.center.X,u.center.Z if t and t.Parent
then local x=t:IsA'BasePart'and t or t.PrimaryPart or t:FindFirstChildWhichIsA
'BasePart'if x then v=x.Position.X w=x.Position.Z end end local x,y=p-v,q-w
local z,A=x*x+y*y,m+u.boundingRadius if z<=A*A then table.insert(o,s)end end end
return o end function aa.IsPointInAnyHazard(l,m,n,o)local p=ag if not p then
return false,nil,nil end n=n or 0 local q,r,s,t=math.huge,o or p.
GetActiveHazardsMap()for u,v in pairs(r)do local w=v.Instance or(typeof(u)==
'Instance'and u)if m and(m==w or(w and m.Name==w.Name))then continue end local x
=v.Name or(w and w.Name)or''if ap(x)or c(x)then continue end local y=k(v)if not
y then continue end local z,A=y.center.X,y.center.Z if w and w.Parent then local
B=w:IsA'BasePart'and w or w.PrimaryPart or w:FindFirstChildWhichIsA'BasePart'if
B then z=B.Position.X A=B.Position.Z end end local B,C=l.X-z,l.Z-A local D,E=B*B
+C*C,y.boundingRadius+n if D>E*E then continue end local F=v.IsTrajectory==true
for G=1,#y.zones do local H=y.zones[G]if f(H.part)and h(l,H,n,F or H.
isTrajectory)then local I=(l-H.part.Position).Magnitude if I<q then q=I s=v t=H.
part end break end end end return t~=nil,s,t end return aa end function a.e()
local aa,ab,ac=a.load'a',a.load'b',a.load'd'local ad,ae,af,ag,ah,ai,aj,ak,al,am,
an,ao=aa.RunService or game:GetService'RunService',aa.player,{},false,{},0.85,
Color3.fromRGB(255,45,45),Color3.fromRGB(0,160,255),0.55,0.25 local ap=function(
)local ap=ae and ae.Character if not ap then return nil end local aq=ap:
FindFirstChild'HumanoidRootPart'or ap.PrimaryPart if not aq then return nil end
return aq.Position.Y-2.5 end function af.BindDetection(aq)an=aq or nil end local
aq function af.BindTrajectory(b)aq=b or nil end function af.IsEnabled()return ag
end local b=function(b,c)local d,e,f=b.ad,b.zone,b.part local g=b.anchorPart or
f if not d or not d.Parent or not g or not g.Parent then return end local h=e
and(e.isSecondBossChain or(b.hazardInfo and b.hazardInfo.IsSyntheticChain))local
i=(h and e.cx and e.cz and Vector3.new(e.cx,0,e.cz))or(f and f.Parent and f.
Position)or((e and e.cx and e.cz)and Vector3.new(e.cx,0,e.cz))if not i then
return end local j=Vector3.new(i.X,c or i.Y,i.Z)if b.isCircle then local k=
CFrame.new(j)*CFrame.Angles(math.rad(90),0,0)d.CFrame=(g==workspace.Terrain)and
k or g.CFrame:ToObjectSpace(k)else local k if e and(e.isMovingBeam or e.
isBigSpike)then local l=aq and aq.GetHazardDirection and aq.GetHazardDirection(b
.hazardInfo)if l and l.Magnitude>0.01 then k=CFrame.lookAt(j,j+l)else local m=(f
and f.Parent)and f.CFrame or CFrame.identity local n,o,p=m:ToOrientation()k=
CFrame.new(j)*CFrame.Angles(0,o,0)end else local l=(f and f.Parent)and f.CFrame
or CFrame.identity local m,o,p=l:ToOrientation()k=CFrame.new(j)*CFrame.Angles(0,
o,0)end d.CFrame=(g==workspace.Terrain)and k or g.CFrame:ToObjectSpace(k)end end
local c=function()if not ag then return end local c,d,e=false,ap(),os.clock()for
f,g in pairs(ah)do local h,i=f.IsSyntheticChain or(f.MaxExpireTime and e<f.
MaxExpireTime),f.Instance and f.Instance.Parent if not i and not h then af.
DetachZoneVisuals(f)else if g.items then local j={}for k,l in ipairs(g.items)do
local o=l.zone if o and o.expireTime and e>o.expireTime then if l.ad and l.ad.
Parent then pcall(function()l.ad:Destroy()end)end elseif l.ad and l.ad.Parent
then table.insert(j,l)b(l,d)end end g.items=j if#j>0 then c=true else af.
DetachZoneVisuals(f)end end end end if not c and ao then ao:Disconnect()ao=nil
end end local d=function()if not ao and ag then ao=ad.Heartbeat:Connect(c)end
end function af.DetachZoneVisuals(e)if not e then return end local f=ah[e]if not
f then return end if f.adornments then for g,h in ipairs(f.adornments)do pcall(
function()h:Destroy()end)end table.clear(f.adornments)end if f.connections then
for g,h in ipairs(f.connections)do pcall(function()h:Disconnect()end)end table.
clear(f.connections)end if f.items then table.clear(f.items)end ah[e]=nil end
function af.UpdateHazardVisualColor(e,f)if not e then return end local g=ah[e]if
not g or not g.items then return end local h=f==true or e.IsTrajectory==true
local i,j=h and ak or aj,h and ac.GetTrajectoryMargin()or 0 for k,l in ipairs(g.
items)do local o,p,q=l.ad,l.zone,l.part if o and o.Parent and p and q and q.
Parent then o.Color3=i if l.isCircle and p.radius then o.Radius=p.radius+j
elseif p.half then local r,s=p.half.X,p.half.Z o.Size=Vector3.new(r*2,am,s*2)end
end end end function af.AttachZoneVisuals(e)if not ag or not e then return end
if ah[e]then af.DetachZoneVisuals(e)end local f=ac.GetHazardZones(e)if not f or
not f.zones then return end local g=e.IsTrajectory==true local h,i,j,k,l,o,p=g
and ak or aj,g and ac.GetTrajectoryMargin()or 0,ap(),{},{},{},workspace.Terrain
for q,r in ipairs(f.zones)do local s,t,u,v=r.part,r.isSecondBossChain==true,r.
isMovingBeam==true,r.isBigSpike==true local w=(t or u or v)and p or s if t or u
or v or(s and s.Parent and s.Transparency<=ai)then local x,y=false if r.radius
then x=true local z=Instance.new'CylinderHandleAdornment'z.Name=
'HazardGroundCircle'z.Adornee=w z.Radius=r.radius+i z.Height=am z.Color3=h z.
Transparency=al z.ZIndex=2 z.AlwaysOnTop=true z.Parent=w y=z elseif r.half and r
.cframe then local z=Instance.new'BoxHandleAdornment'z.Name='HazardGroundBox'z.
Adornee=w z.Size=Vector3.new(r.half.X*2,am,r.half.Z*2)z.Color3=h z.Transparency=
al z.ZIndex=2 z.AlwaysOnTop=true z.Parent=w y=z end if y then local z={ad=y,part
=s,anchorPart=w,isCircle=x,zone=r,hazardInfo=e}b(z,j)table.insert(k,z)table.
insert(l,y)if(not t and not u)and s then local A=s:GetPropertyChangedSignal
'Transparency':Connect(function()if s.Parent and s.Transparency>ai then pcall(
function()y:Destroy()end)end end)table.insert(o,A)end end end end if#l>0 then ah
[e]={items=k,adornments=l,connections=o}d()end end function af.ClearAll()if ao
then ao:Disconnect()ao=nil end for e in pairs(ah)do af.DetachZoneVisuals(e)end
table.clear(ah)end function af.RefreshAll()af.ClearAll()if not ag or not an then
return end for e,f in pairs(an.GetActiveHazardsMap())do af.AttachZoneVisuals(f)
end end function af.SetEnabled(e)ag=e and true or false if ag then af.
RefreshAll()else af.ClearAll()end end ac.OnPaddingChanged(function()if ag then
af.RefreshAll()end end)ab.Register(function()af.ClearAll()end)return af end
function a.f()local aa,ab,ac=a.load'a',a.load'b',a.load'd'local ad,ae,af,ag,ah,
ai,aj,ak,al,am,an,ao,ap,aq,b,c,d,e=aa.RunService or game:GetService'RunService',
game:GetService'ReplicatedStorage',aa.player,{},true,{},0.85,Color3.fromRGB(255,
60,60),Color3.fromRGB(0,180,255),Color3.fromRGB(255,140,0),Color3.fromRGB(220,90
,255),'enemyProjectiles',false,{},{},{secondbossgreenorb=true,secondbossredorb=
true,secondbossyelloworb=true}local f=function()if ap then return end ap=true
local f=ae:FindFirstChild(ao)if f then for g,h in ipairs(f:GetChildren())do
local i=(h.Name or''):lower():gsub('%s+','')if#i>0 then aq[i]=true end end f.
ChildAdded:Connect(function(g)local h=(g.Name or''):lower():gsub('%s+','')if#h>0
then aq[h]=true end end)end end function ag.IsChasingProjectile(g)if not g or
type(g)~='string'then return false end local h=g:lower():gsub('%s+','')if#h==0
then return false end if c[h]==true then return true end for i in pairs(c)do if
string.find(h,i,1,true)then return true end end return false end function ag.
IsEnemyProjectile(g)f()if not g or type(g)~='string'then return false end local
h=g:lower():gsub('%s+','')if#h==0 then return false end if b[h]==true then
return false end return aq[h]==true end function ag.BindDetection(g)d=g or nil
end function ag.IsEnabled()return ah end local g=function()local g=af and af.
Character if not g then return nil end local h=g:FindFirstChild
'HumanoidRootPart'or g.PrimaryPart if not h then return nil end return h.
Position.Y-2.5 end local h,i=function(h)if not h or not h.Parent then return 2.5
end local i=g()if i then local j=i+2.5 local k,l=j-h.Position.Y,h.Size.Y/2+1.2
return math.clamp(math.max(k,l),1.5,30)end return math.clamp(h.Size.Y/2+1.8,2,10
)end,function(h)return h and h.Parent and h.Transparency<=aj end local j,k=
function(j)if not j or not j.Parent then return nil end if j:IsA'BasePart'then
if i(j)then return j end elseif j:IsA'Model'then if j.PrimaryPart and i(j.
PrimaryPart)then return j.PrimaryPart end local k=j:FindFirstChild
'HumanoidRootPart'if k and i(k)then return k end for l,o in ipairs(j:
GetDescendants())do if o:IsA'BasePart'and i(o)then return o end end else for k,l
in ipairs(j:GetDescendants())do if l:IsA'BasePart'and i(l)then return l end end
end return nil end,function(j)local k,l=j and j.IsTrajectory==true,j and j.Name
or'Hazard'local o,p=ag.IsChasingProjectile(l),ag.IsEnemyProjectile(l)local q=not
k or o if o then local r,s=an,'220,100,255'return'C',r,s,true elseif p then
local r,s=k and am or al,k and'255,160,50'or'0,210,255'return'P',r,s,q else
local r,s=k and am or ak,k and'255,160,50'or'255,80,80'return'N',r,s,q end end
local l=function(l,o)if not l or not l.items or not o then return end local p,q,
r,s=k(o)local t,u=o.Name or'Hazard',''if s then local v=o.SpawnClock or os.
clock()local w=math.max(0,os.clock()-v)u=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(255,220,220)'>%s</font> <font color='rgb(255,255,255)'><b>%.1fs</b></font>]]
):format(r,p,t,w)else u=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(220,235,255)'>%s</font>]]
):format(r,p,t)end for v,w in ipairs(l.items)do if w.label and w.label.Parent
then w.label.Text=u end if w.stroke and w.stroke.Parent and w.stroke.Color~=q
then w.stroke.Color=q end end end local o=function()if not ah then return end
local o=false for p,q in pairs(ai)do local r=p.Instance if not r or not r.Parent
then ag.DetachTimerVisual(p)else if q.items then for s=#q.items,1,-1 do local t=
q.items[s]local u=t.part if not i(u)then if t.billboard and t.billboard.Parent
then pcall(function()t.billboard:Destroy()end)end table.remove(q.items,s)else if
t.billboard and t.billboard.Parent then t.billboard.StudsOffset=Vector3.new(0,h(
u),0)end end end if#q.items==0 then ag.DetachTimerVisual(p)else o=true l(q,p)end
else ag.DetachTimerVisual(p)end end end if not o and e then e:Disconnect()e=nil
end end local p,q=function()if not e and ah then e=ad.Heartbeat:Connect(o)end
end,function(p,q)local r,s=h(p),Instance.new'BillboardGui's.Name=
'HazardLifespanTimer's.Adornee=p s.AlwaysOnTop=true s.MaxDistance=500 s.
LightInfluence=0 s.ResetOnSpawn=false s.Active=false s.Size=UDim2.new(0,150,0,24
)s.StudsOffset=Vector3.new(0,r,0)s.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
local t=Instance.new'Frame't.Name='TimerFrame't.Size=UDim2.new(1,0,1,0)t.
BackgroundColor3=Color3.fromRGB(15,15,20)t.BackgroundTransparency=0.25 t.
BorderSizePixel=0 t.Parent=s local u=Instance.new'UICorner'u.CornerRadius=UDim.
new(0,6)u.Parent=t local v=Instance.new'UIStroke'v.Name='Stroke'v.Thickness=1.3
v.Color=q or ak v.Transparency=0.15 v.Parent=t local w=Instance.new'TextLabel'w.
Name='TimerLabel'w.Size=UDim2.new(1,-6,1,0)w.Position=UDim2.new(0,3,0,0)w.
BackgroundTransparency=1 w.Font=Enum.Font.GothamBold w.TextSize=11 w.TextColor3=
Color3.fromRGB(255,255,255)w.TextStrokeTransparency=0 w.TextStrokeColor3=Color3.
fromRGB(0,0,0)w.RichText=true w.TextXAlignment=Enum.TextXAlignment.Center w.
TextYAlignment=Enum.TextYAlignment.Center w.Text=''w.Parent=t s.Parent=p return
s,w,v end function ag.AttachTimerVisual(r)if not ah or not r then return end
local s=r.Name or(r.Instance and r.Instance.Name)or''if(ac.IsIceSpikesChain and
ac.IsIceSpikesChain(s))or(ac.IsSecondBossCircleChain and ac.
IsSecondBossCircleChain(s))then return end if ai[r]then ag.DetachTimerVisual(r)
end local t=r.Instance if not t or not t.Parent then return end local u,v=k(r)
local w=ac.GetHazardZones(r)local x,y,z=w and w.zones,{},{}local A,B=function(A,
B,C,D,E)local F={billboard=B,label=C,stroke=D,part=A,zone=E}table.insert(y,F)
local G=A:GetPropertyChangedSignal'Transparency':Connect(function()if not i(A)
then pcall(function()B:Destroy()end)end end)table.insert(z,G)local H=A.
AncestryChanged:Connect(function(H,I)if not I then pcall(function()B:Destroy()
end)end end)table.insert(z,H)end if x and#x>0 then if t:IsA'Model'then if t.
PrimaryPart and i(t.PrimaryPart)then B=t.PrimaryPart elseif t:FindFirstChild
'HumanoidRootPart'and i(t:FindFirstChild'HumanoidRootPart')then B=t:
FindFirstChild'HumanoidRootPart'end end if not B then local C,D=w.center,math.
huge for E,F in ipairs(x)do local G=F.part if i(G)then if C then local H,I=G.
Position.X-C.X,G.Position.Z-C.Z local J=H*H+I*I if J<D then D=J B=G end else B=G
break end end end end end if not B then B=j(t)end if B and i(B)then local C,D,E=
q(B,v)A(B,C,D,E,nil)end if#y>0 then local C={items=y,connections=z}ai[r]=C l(C,r
)p()end end function ag.DetachTimerVisual(r)if not r then return end local s=ai[
r]if not s then return end if s.connections then for t,u in ipairs(s.connections
)do pcall(function()u:Disconnect()end)end table.clear(s.connections)end if s.
items then for t,u in ipairs(s.items)do if u.billboard and u.billboard.Parent
then pcall(function()u.billboard:Destroy()end)end end table.clear(s.items)end ai
[r]=nil end function ag.UpdateHazardVisualColor(r,s)if not r then return end
local t=ai[r]if t then l(t,r)else ag.AttachTimerVisual(r)end end function ag.
ClearAll()if e then e:Disconnect()e=nil end for r in pairs(ai)do ag.
DetachTimerVisual(r)end table.clear(ai)end function ag.RefreshAll()ag.ClearAll()
if not ah or not d then return end for r,s in pairs(d.GetActiveHazardsMap())do
if s then ag.AttachTimerVisual(s)end end end function ag.SetEnabled(r)ah=r and
true or false if ah then ag.RefreshAll()else ag.ClearAll()end end ab.Register(
function()ag.ClearAll()end)return ag end function a.g()local aa,ab,ac,ad=a.load
'a',a.load'b',a.load'd',a.load'f'local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,b,
c,d,e,f=aa.RunService or game:GetService'RunService',aa.player,{},false,45,{
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
'seeking_spike'end end end end end return'seeking_spike'end local g,h=function(g
,h)if not g or type(g)~='string'then return false end local i=g:lower():gsub(
'%s+','')if#i==0 or string.find(i,'seekingspike',1,true)then return false end if
string.find(i,'firstbossbeampart',1,true)then return d(h)=='big_spike'end return
string.find(i,'firstbossbigspike',1,true)~=nil or string.find(i,'bigspike',1,
true)~=nil end,function(g,h)if not g or type(g)~='string'then return false end
local i=g:lower():gsub('%s+','')if#i==0 or string.find(i,'firstbossbigspike',1,
true)then return false end if string.find(i,'firstbossbeampart',1,true)then
return d(h)=='seeking_spike'end return string.find(i,'firstbossseekingspikes',1,
true)~=nil or string.find(i,'seekingspike',1,true)~=nil end local i,j=function(i
,j)return g(i,j)or h(i,j)end,function(i)if not i or not i.Parent then return nil
,nil,nil,nil end local j,k=((i.Name or''):lower())if c(j)then k=i:IsA'BasePart'
and i or i:FindFirstChildWhichIsA'BasePart'end if not k then local l=i:IsA
'BasePart'and i.Position or(i:IsA'Model'and i:GetPivot().Position)if l then
local o,p=35,g(i.Name,i)and'big_spike'or'seeking_spike'for q,r in ipairs(
workspace:GetChildren())do local s=r.Name:lower()if c(s)or string.find(s,
'beampart',1,true)then if d(r)==p then local t=r:IsA'BasePart'and r.Position or(
r:IsA'Model'and r:GetPivot().Position)if t then local u=(t-l).Magnitude if u<o
then o=u k=r end end end end end end end if not k then return nil,nil,nil,nil
end local l=k:FindFirstChild('Attachment2',true)if not l or not l:IsA
'Attachment'then for o,p in ipairs(k:GetDescendants())do if p:IsA'Attachment'and
p.Name~='Attachment0'and p.Name~='Attachment1'then l=p break end end end local o
,p=k.Position,l and l.WorldPosition if p and o then local q=p-o local r=Vector3.
new(q.X,0,q.Z)local s=r.Magnitude if s>5 then local t=r.Unit return s,t,o,p end
end return nil,nil,nil,nil end local k=function(k)if not k then return nil end
local l,o,p,q=0,0,0,{}if k:IsA'BasePart'then table.insert(q,k)else for r,s in
ipairs(k:GetDescendants())do if s:IsA'BasePart'then table.insert(q,s)end end end
for r,s in ipairs(q)do local t,u=s.Size,s:FindFirstChildWhichIsA('SpecialMesh',
true)if u then t=Vector3.new(t.X*math.abs(u.Scale.X),t.Y*math.abs(u.Scale.Y),t.Z
*math.abs(u.Scale.Z))end l=math.max(l,t.X)o=math.max(o,t.Y)p=math.max(p,t.Z)end
if l<=0 and o<=0 and p<=0 then return nil end local r={l,o,p}table.sort(r)local
s=r[2]if s<2 then s=math.max(r[1],r[2])end return s end local l,o=function(l)if
ak.firstbossbigspike then return ak.firstbossbigspike end if cachedBigSpikeWidth
then return cachedBigSpikeWidth end if l and not c(l.Name)then local o=k(l)if o
and o>=4 then cachedBigSpikeWidth=math.clamp(o,8,60)return cachedBigSpikeWidth
end end for o,p in ipairs(workspace:GetChildren())do local q=p.Name:lower()if
string.find(q,'firstbossbigspike',1,true)or(string.find(q,'bigspike',1,true)and
not string.find(q,'seekingspike',1,true)and not c(q))then local r=k(p)if r and r
>=4 then cachedBigSpikeWidth=math.clamp(r,8,60)return cachedBigSpikeWidth end
end end local o=game:GetService'ReplicatedStorage'local p=o:FindFirstChild
'enemyProjectiles'local q=p and p:FindFirstChild'firstBossBigSpike'if q then
local r=k(q)if r and r>=4 then cachedBigSpikeWidth=math.clamp(r,8,60)return
cachedBigSpikeWidth end end return 28 end local p=function(p)if ak.
firstbossseekingspikes then return ak.firstbossseekingspikes end if o then
return o end if p and not c(p.Name)then local q=k(p)if q and q>=2 then o=math.
clamp(q,4,40)return o end end for q,r in ipairs(workspace:GetChildren())do local
s=r.Name:lower():gsub('%s+','')if string.find(s,'seekingspike',1,true)and not c(
s)then local t=k(r)if t and t>=2 then o=math.clamp(t,4,40)return o end end end
local q=game:GetService'ReplicatedStorage'local r=q:FindFirstChild
'enemyProjectiles'local s=r and r:FindFirstChild'firstBossSeekingSpikes'if s
then local t=k(s)if t and t>=2 then o=math.clamp(t,4,40)return o end end return
10 end local q,r,s=function(q,r)if g(q,r)then return l(r)else return p(r)end end
,function(q)if not q then return ai end local r,s=''if type(q)=='string'then r=q
elseif type(q)=='table'then r=q.Name or(q.Instance and q.Instance.Name)or''s=al[
q]end local t=(s and s.mainPart)or(type(q)=='table'and q.Instance)if i(r,t)then
if s and s.beamLength then return s.beamLength end if g(r,t)then return aj.
firstbossbigspike or 140 else return aj.firstbossseekingspikes or 80 end end if
s and s.beamLength then return s.beamLength end local u=r:lower():gsub('%s+','')
if aj[u]then return aj[u]end for v,w in pairs(aj)do if string.find(u,v,1,true)
then return w end end return ai end,function()local q=af and af.Character if not
q then return nil end local r=q:FindFirstChild'HumanoidRootPart'or q.PrimaryPart
if not r then return nil end return r.Position end local t,u=function(t,u)if not
t or not u then return nil,nil end local v=t:lower():gsub('%s+','')local w=b[v]
if not w then for x,y in pairs(b)do if string.find(v,x,1,true)then w=y break end
end end if not w then return nil,nil end if w=='look_vector'then local x=u.
CFrame.LookVector local y=Vector3.new(x.X,0,x.Z)if y.Magnitude>0.01 then return
y.Unit,w end else local x=s()if x then local y=x-u.Position local z=Vector3.new(
y.X,0,y.Z)if z.Magnitude>0.1 then return z.Unit,w end end local y=u.CFrame.
LookVector local z=Vector3.new(y.X,0,y.Z)if z.Magnitude>0.01 then return z.Unit,
w end end return nil,nil end,function()local t=af and af.Character if not t then
return nil end local u=t:FindFirstChild'HumanoidRootPart'or t.PrimaryPart if not
u then return nil end return u.Position.Y-2.5 end function ag.BindDetection(v)e=
v or nil end function ag.IsEnabled()return ah end function ag.
GetPredictionLength()return ai end function ag.SetPredictionLength(v)if type(v)
=='number'and v>0 then ai=math.clamp(v,10,200)ag.RefreshAll()end end function ag
.GetHazardPredictionLength(v)return r(v)end function ag.GetCustomLength(v)if not
v then return nil end local w=v:lower():gsub('%s+','')return aj[w]end function
ag.SetCustomLength(v,w)if not v then return end local x=v:lower():gsub('%s+','')
if type(w)=='number'and w>0 then aj[x]=math.clamp(w,10,300)else aj[x]=nil end ag
.RefreshAll()end function ag.GetSecondBossBeamLength()return aj.
secondbossmovingbeam or 80 end function ag.SetSecondBossBeamLength(v)ag.
SetCustomLength('secondbossmovingbeam',v)end function ag.
GetFirstBossBigSpikeWidth()return ak.firstbossbigspike or 28 end function ag.
SetFirstBossBigSpikeWidth(v)if type(v)=='number'and v>0 then ak.
firstbossbigspike=math.clamp(v,6,60)else ak.firstbossbigspike=nil end
cachedBigSpikeWidth=nil ag.RefreshAll()end function ag.
GetFirstBossSeekingSpikeWidth()return ak.firstbossseekingspikes or(o or 10)end
function ag.SetFirstBossSeekingSpikeWidth(v)if type(v)=='number'and v>0 then ak.
firstbossseekingspikes=math.clamp(v,4,40)else ak.firstbossseekingspikes=nil end
o=nil ag.RefreshAll()end function ag.GetCustomWidth(v)if not v then return nil
end local w=v:lower():gsub('%s+','')return ak[w]end function ag.SetCustomWidth(v
,w)if not v then return end local x=v:lower():gsub('%s+','')if type(w)=='number'
and w>0 then ak[x]=math.clamp(w,4,100)else ak[x]=nil end ag.RefreshAll()end
function ag.IsHazardMoving(v)if not v then return false end local w=al[v]return
w and w.isMoving==true end function ag.GetHazardDirection(v)if not v then return
nil end local w=al[v]return w and w.dir or nil end local v,w=function(v,w)local
x=v.Instance if not x or not x.Parent then return nil,4 end local y,z=ac.
GetTrajectoryMargin and ac.GetTrajectoryMargin()or 2,v.Name or(x and x.Name)or''
if i(z,x)then local A=al[v]local B=(A and A.mainPart)or(x:IsA'BasePart'and x or
x.PrimaryPart or x:FindFirstChildWhichIsA'BasePart')local C,D=(A and A.
beamStartPos)or(B and B.Position)or x.Position,q(z,B)local E=math.max(1,D+y*2)
return Vector3.new(C.X,0,C.Z),E end local A,B={},ac.IsForceCircle and ac.
IsForceCircle(z)if x:IsA'BasePart'then if x.Transparency<=am then table.insert(A
,x)end else for C,D in ipairs(x:GetDescendants())do if D:IsA'BasePart'and D.
Parent and D.Transparency<=am then table.insert(A,D)end end end if#A==0 then
return nil,4 end local C,D,E,F=Vector3.new(-w.Z,0,w.X),math.huge,-math.huge,0
for G,H in ipairs(A)do local I,J,K=H.Position,H.Size,0 if B or(H:IsA'Part'and(H.
Shape==Enum.PartType.Ball or H.Shape==Enum.PartType.Cylinder))then K=math.max(J.
X,J.Y,J.Z)/2 else local L=H.CFrame local M,N,O,P,Q,R=L.RightVector,L.UpVector,L.
LookVector,J.X/2,J.Y/2,J.Z/2 K=P*math.abs(M.X*C.X+M.Z*C.Z)+Q*math.abs(N.X*C.X+N.
Z*C.Z)+R*math.abs(O.X*C.X+O.Z*C.Z)end local L=I.X*C.X+I.Z*C.Z D=math.min(D,L-K)E
=math.max(E,L+K)local M=I.X*w.X+I.Z*w.Z F+=M end local G,H,I=math.max(1,(E-D)+y*
2),(D+E)/2,F/#A local J=w*I+C*H return J,G end,function(v,w,x,y,z,A,B)if not w
or not w.Parent or not v or not v.Parent then return end local C=A/2 local D=
Vector3.new(x.X+y.X*C,z or x.Y,x.Z+y.Z*C)local E=D+Vector3.new(y.X,0,y.Z)local F
=CFrame.lookAt(D,E)v.CFrame=(v.Adornee==workspace.Terrain)and F or w.CFrame:
ToObjectSpace(F)v.Size=Vector3.new(B,ap,A)if not v.Visible then v.Visible=true
end end local x=function()if not ah then return end local x,y,z=false,os.clock()
,u()for A,B in pairs(al)do local C=A.Instance if not C or not C.Parent then ag.
DetachTrajectoryVisuals(A)else x=true local D,E=B.mainPart,A.Name or(C and C.
Name)local F=ad and ad.IsChasingProjectile and ad.IsChasingProjectile(E)if F
then if B.ad and B.ad.Visible then B.ad.Visible=false end B.isMoving=false A.
IsTrajectory=false elseif D and D.Parent then local G,H=D.Position,y-(B.
lastClock or y)if B.isBossSpike then if not B.beamFound then local I,J,K,L=j(D)
if I and J then B.beamFound=true B.beamLength=I B.beamDir=J B.beamStartPos=K B.
beamTargetPos=L B.dir=J end end if B.beamDir then B.dir=B.beamDir end B.isMoving
=true end if H>=0.035 then local I=G-(B.lastPos or G)local J,K=I.Magnitude/H,
Vector3.new(I.X,0,I.Z)local L,M=K.Magnitude/H,B.isMoving==true if L>=aq then B.
isMoving=true if not B.isBossSpike then B.dir=K.Unit end else if not B.isInstant
and not B.isBossSpike and H>=0.25 and J<aq then B.isMoving=false end end if B.
isMoving~=M then A.IsTrajectory=B.isMoving A.HazardZones=nil if e and e.
UpdateHazardVisualColor then pcall(e.UpdateHazardVisualColor,A,B.isMoving)end
local N=a.load'e'if N and N.UpdateHazardVisualColor then pcall(N.
UpdateHazardVisualColor,A,B.isMoving)end end B.lastPos=G B.lastClock=y end if B.
isMoving and B.dir and B.ad then local I,J=v(A,B.dir)if I then local K=r(A)w(B.
ad,D,I,B.dir,z,K,J)end else if B.ad and B.ad.Visible then B.ad.Visible=false end
end end end end if not x and f then f:Disconnect()f=nil end end local y=function
()if not f and ah then f=ae.Heartbeat:Connect(x)end end function ag.
DetachTrajectoryVisuals(z)if not z then return end local A=al[z]if not A then
return end if A.ad then pcall(function()A.ad:Destroy()end)A.ad=nil end if A.
connections then for B,C in ipairs(A.connections)do pcall(function()C:
Disconnect()end)end table.clear(A.connections)end al[z]=nil end function ag.
AttachTrajectoryVisuals(z)if not ah or not z then return end if al[z]then ag.
DetachTrajectoryVisuals(z)end local A=z.Instance if not A or not A.Parent then
return end local B=z.Name or(A and A.Name)if ad and ad.IsChasingProjectile and
ad.IsChasingProjectile(B)then z.IsTrajectory=false return end local C if A:IsA
'BasePart'then C=A else C=A.PrimaryPart or A:FindFirstChildWhichIsA'BasePart'if
not C then for D,E in ipairs(A:GetDescendants())do if E:IsA'BasePart'and E.
Parent then C=E break end end end end if not C or not C.Parent then return end
local D,E=r(z),Instance.new'BoxHandleAdornment'E.Name='HazardTrajectoryCorridor'
E.Adornee=workspace.Terrain E.Size=Vector3.new(4,ap,D)E.Color3=an E.Transparency
=ao E.ZIndex=1 E.AlwaysOnTop=true E.Visible=false E.Parent=workspace.Terrain
local F=z.Name or(A and A.Name)local G,H=c(F),i(F,A)local I=H and(g(F,A)and
'big_spike'or'seeking_spike')or nil if H then if not G then for J,K in pairs(al)
do if K and K.isBeam and K.spikeType==I then K.linkedSpike=C z.IsTrajectory=
false return end end else for J,K in pairs(al)do if K and not K.isBeam and K.
spikeType==I then z.IsTrajectory=false return end end end end local J={}if not G
then local K=C:GetPropertyChangedSignal'Transparency':Connect(function()if C.
Parent and C.Transparency>am then pcall(function()E:Destroy()end)end end)table.
insert(J,K)end local K local L=C.AncestryChanged:Connect(function(L,M)if not M
then if K and K.linkedSpike and K.linkedSpike.Parent and K.linkedSpike.
Transparency<=am then local N=K.linkedSpike.AncestryChanged:Connect(function(N,O
)if not O then pcall(function()E:Destroy()end)end end)table.insert(J,N)return
end pcall(function()E:Destroy()end)end end)table.insert(J,L)local M,N=t(F,C)
local O,P,Q,R,S=(M~=nil)if H then P,Q,R,S=j(A)if Q then M=Q O=true end end K={ad
=E,connections=J,mainPart=C,lastPos=C.Position,lastClock=os.clock(),velocity=
Vector3.zero,dir=M,isMoving=O,isInstant=O,instantMode=N,isBossSpike=H,isBigSpike
=g(F,A),isSeekingSpike=h(F,A),spikeType=I,isBeam=G,beamFound=P~=nil,beamLength=P
,beamDir=Q,beamStartPos=R or C.Position,beamTargetPos=S,linkedSpike=nil}if G and
I then local T=I=='big_spike'and'firstbossbigspike'or'seekingspike'for U,V in
ipairs(workspace:GetChildren())do local W=V.Name:lower():gsub('%s+','')if string
.find(W,T,1,true)and not c(W)then local X=V:IsA'BasePart'and V or(V:
FindFirstChildWhichIsA'BasePart'or(V:IsA'Model'and V.PrimaryPart))if X then
local Y=(X.Position-C.Position).Magnitude if Y<25 then K.linkedSpike=X break end
end end end end al[z]=K if O and M then z.IsTrajectory=true z.HazardZones=nil
local T,U,V=u(),v(z,M)local W=r(z)if U then w(E,C,U,M,T,W,V)end if e and e.
UpdateHazardVisualColor then pcall(e.UpdateHazardVisualColor,z,true)end local X=
a.load'e'if X and X.UpdateHazardVisualColor then pcall(X.UpdateHazardVisualColor
,z,true)end local Y=a.load'f'if Y and Y.UpdateHazardVisualColor then pcall(Y.
UpdateHazardVisualColor,z,true)end end y()end function ag.ClearAll()if f then f:
Disconnect()f=nil end for z in pairs(al)do ag.DetachTrajectoryVisuals(z)end
table.clear(al)end function ag.RefreshAll()ag.ClearAll()if not ah or not e then
return end for z,A in pairs(e.GetActiveHazardsMap())do ag.
AttachTrajectoryVisuals(A)end end function ag.GetNearbyTrajectories(z,A)A=A or
65 local C,D,E={},z.X,z.Z for F,G in pairs(al)do if G.isMoving and G.dir and G.
mainPart and G.mainPart.Parent then local H,I=v(F,G.dir)if H and I then local J,
K,L=r(F),H.X,H.Z local M,N=D-K,E-L local O,P=M*M+N*N,A+J+(I/2)if O<=P*P then
table.insert(C,{info=F,record=G})end end end end return C end function ag.
IsPointInAnyTrajectory(z,A,C)local D,E=z.X,z.Z A=A or 0 local F=3 if C then for
G,H in ipairs(C)do local I,J=H.info,H.record if J and J.isMoving and J.dir and J
.mainPart and J.mainPart.Parent then local K,L=v(I,J.dir)if K and L then local M
,N=r(I),J.dir local O,P,Q=Vector3.new(-N.Z,0,N.X),D-K.X,E-K.Z local R,S,T,U,V=P*
N.X+Q*N.Z,P*O.X+Q*O.Z,L/2,-F,M if A<=0 then if R>=U and R<=V and math.abs(S)<=T
then return true,I,N,K,L end else local W=0 if R<U then W=U-R elseif R>V then W=
R-V end local X=math.max(0,math.abs(S)-T)if(W*W+X*X)<=(A*A)then return true,I,N,
K,L end end end end end return false,nil,nil,nil,nil end for G,H in pairs(al)do
if H.isMoving and H.dir and H.mainPart and H.mainPart.Parent then local I,J=v(G,
H.dir)if I and J then local K,L=r(G),H.dir local M,N,O=Vector3.new(-L.Z,0,L.X),D
-I.X,E-I.Z local P,Q,R,S,T=N*L.X+O*L.Z,N*M.X+O*M.Z,J/2,-F,K if A<=0 then if P>=S
and P<=T and math.abs(Q)<=R then return true,G,L,I,J end else local U=0 if P<S
then U=S-P elseif P>T then U=P-T end local V=math.max(0,math.abs(Q)-R)if(U*U+V*V
)<=(A*A)then return true,G,L,I,J end end end end end return false,nil,nil,nil,
nil end function ag.SetEnabled(z)ah=z and true or false if ah then ag.
RefreshAll()else ag.ClearAll()end end ac.OnPaddingChanged(function()if ah then
ag.RefreshAll()end end)ab.Register(function()ag.ClearAll()end)return ag end end
local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.load'a',a.load'c',a.load'b',a.load'd',a.
load'e',a.load'g',a.load'f',game:GetService'Players',game:GetService'Workspace',
game:GetService'ReplicatedStorage'local ak,al,am,an,ao,ap,aq,b,c,d,e,f,g,h,i,j,k
,l,o,p,q,r=aa.player,{},false,false,true,false,false,'',false,{},0,{},{},0,0,2,{
'abilities','projectiles'},false,{},{firstbossbeamparticles=true}local s,t,u,v,w
,x,y,z=function()if l then return end l=true for s,t in ipairs(k)do local u=aj:
FindFirstChild(t)if u then for v,w in ipairs(u:GetChildren())do local x=(w.Name
or''):lower():gsub('%s+','')if#x>0 then o[x]=true end end end end end,function(s
)if not s then return true end local t=s.Name if typeof(t)=='string'then local u
=t:lower()if u:sub(1,3)=='tm_'or u:sub(1,3)=='pr_'or u:sub(1,3)=='dq_'or u:find
'pathrecord'or u:find'safespot'or u:find'hazard'or u:find'adornment'or u:find
'debug'or u:find'targetpart'or u:find'actualmarker'then return true end local v=
s.Parent while v and v~=workspace and v~=game do local w=v.Name if typeof(w)==
'string'then local x=w:lower()if x:find'pathrecord'or x:sub(1,3)=='tm_'or x:sub(
1,3)=='pr_'then return true end end v=v.Parent end local w=u:gsub('%s+','')if#w>
0 and o[w]==true then return true end if p[w]==true or p[t]==true then return
true end for x,y in pairs(p)do if string.find(w,x,1,true)then return true end
end end return false end,function(s)if not s then return false end if ah:
GetPlayerFromCharacter(s)then return true end if ah:FindFirstChild(s.Name)then
return true end for t,u in ipairs(ah:GetPlayers())do if s.Name==u.Name then
return true end local v=u.Character if v and(s==v or s:IsDescendantOf(v))then
return true end end local t=ak and ak.Character if t and(s==t or s:
IsDescendantOf(t))then return true end return false end,function()local s=0 for
t in pairs(d)do s+=1 end e=s for t=#f,1,-1 do pcall(f[t],s,q)end end,0.85,50,
0.05,{}local A,C,D=function(A)local C=z[A]if C then C.active=false z[A]=nil end
end,function()for A,C in pairs(z)do if C then C.active=false end end table.
clear(z)end,function(A)if not A or type(A)~='string'then return false end local
C=A:lower():gsub('%s+','')return string.find(C,'firstbossbeampart',1,true)~=nil
end local E,F,G,H,I,J=function(E)if not E then return{}end local F,G={},D(E.Name
)local H=function(H)if H and H.Parent and(H.Transparency<=w or G)then F[#F+1]=H
end end if E:IsA'BasePart'then H(E)else for I,J in ipairs(E:GetDescendants())do
if J:IsA'BasePart'and J.Parent then H(J)end end end return F end,function(E)
local F=ak and ak.Character if not F then return 0 end local G=F:FindFirstChild
'HumanoidRootPart'or F.PrimaryPart if not G then return 0 end local H,I=(G.
Position)if E:IsA'BasePart'then I=E.Position elseif E:IsA'Model'then local J,K=
pcall(function()return E:GetPivot().Position end)if J then I=K else local L=E:
FindFirstChildWhichIsA'BasePart'I=L and L.Position end end if not I then return
0 end return math.floor((H-I).Magnitude+0.5)end,Color3.fromRGB(255,45,45),Color3
.fromRGB(255,30,30),Color3.fromRGB(0,170,255),Color3.fromRGB(0,140,255)local K=
function(K,L,M)local N,O,P={},M and I or G,M and J or H for Q,R in ipairs(K)do
if R and R.Parent and not D(R.Name)and not D(R.Parent and R.Parent.Name)then
local S=Instance.new'SelectionBox'S.Name='HazardSelectionBox'S.Color3=O S.
SurfaceColor3=P S.SurfaceTransparency=0.6 S.LineThickness=0.05 S.Adornee=R S.
Parent=R local T=R:GetPropertyChangedSignal'Transparency':Connect(function()if R
.Parent and R.Transparency>w then pcall(function()S:Destroy()end)end end)if L
then table.insert(L,T)end N[#N+1]=S end end return N end function al.
UpdateHazardVisualColor(L,M)if not L or not L.Boxes then return end local N=M==
true or L.IsTrajectory==true local O,P=N and I or G,N and J or H for Q,R in
ipairs(L.Boxes)do if R and R.Parent then R.Color3=O R.SurfaceColor3=P end end ag
.UpdateHazardVisualColor(L,N)end local L,M=function(L)if not c or b==''then
return false end if not L or type(L)~='string'then return false end local M=b:
lower():gsub('%s+','')if#M==0 then return false end local N=L:lower():gsub('%s+'
,'')return string.find(N,M,1,true)~=nil end,function(L)if not L then return'nil'
end return('(%.2f, %.2f, %.2f)'):format(L.X,L.Y,L.Z)end local ar=function(N,O,P,
Q)if not N then return end local R=N.Name if not L(R)then return end local S,T,U
=N.ClassName,N.Parent and N.Parent:GetFullName()or'nil',F(N)print
'================== \u{1f50d} [HAZARD DEEP INSPECT] \u{1f50d} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(R,S))print((
'  \u{1f4cc} Event Type     : %s%s'):format(O,P and(' -> '..tostring(P))or''))
print(('  \u{1f4cd} Full Path      : %s'):format(T))print((
'  \u{1f4cf} Dist to Player : %d studs'):format(U))if O=='SPAWN'then local V={}
if N:IsA'BasePart'then table.insert(V,N)else for W,X in ipairs(N:GetDescendants(
))do if X:IsA'BasePart'then table.insert(V,X)end end end print((
'  \u{1f9e9} Total Parts (%d) :'):format(#V))for W,X in ipairs(V)do local Y=X:
IsA'Part'and tostring(X.Shape.Name)or(X.ClassName=='MeshPart'and'MeshPart'or X.
ClassName)print(('     [%d] %q (%s)'):format(W,X.Name,X.ClassName))print((
'         \u{2022} Size: %s | Shape: %s | Trans: %.2f | CanCollide: %s'):format(
M(X.Size),Y,X.Transparency,tostring(X.CanCollide)))print((
'         \u{2022} Pos : %s'):format(M(X.Position)))end local W=ad.
GetHazardZones(Q)if W and W.zones then local X=ad.GetHitboxPadding()print((
'  \u{1f4d0} Math Geometry (Zones: %d, BoundingRadius: %.1f studs):'):format(#W.
zones,W.boundingRadius or 0))for Y,Z in ipairs(W.zones)do if Z.radius then
print((
[[     - Zone [%d]: Circle/Ball (Base Radius: %.2f + Pad: %.2f = %.2f studs)]]):
format(Y,Z.radius,X,Z.radius+X))elseif Z.half then print((
'     - Zone [%d]: Box/OBB (HalfSize: %s)'):format(Y,M(Z.half)))end end end task
.spawn(function()local X if N:IsA'BasePart'then X=N elseif N:IsA'Model'then X=N.
PrimaryPart or N:FindFirstChildWhichIsA'BasePart'end if not X then return end
local Y,Z=os.clock(),X.CFrame task.wait(0.12)if not N.Parent or not X.Parent
then return end local _,ar=os.clock(),X.CFrame local as=_-Y if as<=0 then return
end local at=ar*Z:Inverse()local au,av=at:ToAxisAngle()local aw,ax=math.deg(av)/
as,Z:Inverse()*ar local ay,az=ax:ToAxisAngle()if math.abs(math.deg(av))>=1.5
then local aA='Tr\u{1ee5}c t\u{1ef1} do / H\u{1ed7}n h\u{1ee3}p'if math.abs(au.Y
)>=0.8 then aA='Tr\u{1ee5}c Y (Yaw - Qu\u{e9}t ngang m\u{1eb7}t s\u{e0}n)'elseif
math.abs(au.X)>=0.8 then aA=
'Tr\u{1ee5}c X (Pitch - L\u{103}n nh\u{e0}o l\u{1ed9}n)'elseif math.abs(au.Z)>=
0.8 then aA='Tr\u{1ee5}c Z (Roll - Nghi\u{ea}ng l\u{1ead}t b\u{ea}n)'end local
aB='Tr\u{1ee5}c t\u{1ef1} do'if math.abs(ay.Y)>=0.8 then aB=
'Tr\u{1ee5}c Local Y'elseif math.abs(ay.X)>=0.8 then aB='Tr\u{1ee5}c Local X'
elseif math.abs(ay.Z)>=0.8 then aB='Tr\u{1ee5}c Local Z'end print
'================== \u{1f504} [INSPECT: SPINNING DETECTED] \u{1f504} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(N.Name,X.Name))print((
'  \u{26a1} T\u{1ed1}c \u{111}\u{1ed9} xoay    : %.2f \u{b0}/s (%.2f rad/s)'):
format(aw,av/as))print(('  \u{1f310} World Spin Axis: %s -> %s'):format(M(au),aA
))print(('  \u{1f9e9} Local Spin Axis: %s -> %s'):format(M(ay),aB))print
[[========================================================================]]end
end)elseif O=='DESPAWN'then if Q and Q.SpawnClock then local ar=os.clock()-Q.
SpawnClock print(('  \u{23f1}\u{fe0f} Lifetime Active: %.2f seconds'):format(ar)
)end elseif O=='REJECTED'then print(('  \u{26a0}\u{fe0f} Rejection Reason: %s'):
format(tostring(P)))end print
[[================================================================]]end local as
,at=function(as,at)ar(as,'REJECTED',at,nil)if not aq then return end local au,av
=as and as.Name or'?',as and as.ClassName or'?'print((
'[HazardScanner][Reject] \u{26aa} %s (%s) \u{2014} %s'):format(au,av,at))end
local au=function(au)if not au or not au.Parent then return end if os.clock()<i
then return end if u(au)then return end if d[au]then return end if z[au]then
return end local av={active=true,count=0}z[au]=av task.spawn(function()while av.
active and au.Parent and am and an do if os.clock()<i then A(au)return end if u(
au)then A(au)return end av.count+=1 local aw,ax,ay=au:GetDescendants(),E(au),L(
au.Name)if aq or ay then print((
'[HazardScanner][Retry] \u{1f504} L\u{1ea7}n %d/%d: %q (%s) | Descendants: %d | Valid Parts (Trans<=%.2f): %d'
):format(av.count,x,au.Name,au.ClassName,#aw,w,#ax))end if#ax>0 then if aq or ay
then print((
'[HazardScanner][Retry] \u{2705} L\u{1ea7}n %d/%d: %q \u{110}\u{e3} t\u{ec}m th\u{1ea5}y %d part(s)! Ti\u{1ebf}n h\u{e0}nh v\u{1ebd}...'
):format(av.count,x,au.Name,#ax))end A(au)at(au)return end if av.count>=x then
as(au,(
'H\u{1ebf}t %d l\u{1b0}\u{1ee3}t retry m\u{e0} kh\u{f4}ng t\u{ec}m th\u{1ea5}y BasePart h\u{1ee3}p l\u{1ec7} (Descendants: %d)'
):format(x,#aw))A(au)return end task.wait(y)end A(au)end)end at=function(av)if
not am or not an then as(av,'Ch\u{1b0}a trong dungeon')return false end if os.
clock()<i then as(av,
'\u{110}ang trong 2s chuy\u{1ec3}n room (Ch\u{1eb7}n t\u{1ea1}o Danger Zone)')
return false end if not av or not av.Parent then as(av,
'Kh\u{f4}ng c\u{f2}n Parent')return false end if u(av)then as(av,
'Nh\u{e2}n v\u{1ead}t ng\u{1b0}\u{1edd}i ch\u{1a1}i (Player/Teammate)')return
false end if d[av]then return true end s()if t(av)then as(av,
'Tr\u{f9}ng t\u{ea}n trong ReplicatedStorage (abilities/projectiles)')return
false end local aw=E(av)if#aw==0 then as(av,
'Ch\u{1b0}a c\u{f3} part \u{111}\u{1ec3} v\u{1ebd} (s\u{1ebd} retry)')au(av)
return false end local ax,ay=ad.IsIceSpikesChain and ad.IsIceSpikesChain(av.Name
),ad.IsSecondBossCircleChain and ad.IsSecondBossCircleChain(av.Name)if ay then
local az=os.clock()if az-h<6 then as(av,
'V\u{f2}ng con c\u{1ee7}a chu\u{1ed7}i secondBossCricleHitbox (\u{111}\u{e3} d\u{1ef1}ng tr\u{1b0}\u{1edb}c 10 v\u{f2}ng)'
)return false end h=az end local az=F(av)local aA,aB,N={Instance=av,Name=av.Name
,Class=av.ClassName,Distance=az,Boxes={},Connections={},SpawnClock=os.clock()},{
},{}if ao and not ax and not ay then N=K(aw,aB)end aA.Boxes=N aA.Connections=aB
d[av]=aA q={Name=av.Name,Class=av.ClassName,Distance=az}if ae.IsEnabled()then ae
.AttachZoneVisuals(aA)end if af.IsEnabled()then af.AttachTrajectoryVisuals(aA)
end if ag.IsEnabled()then ag.AttachTimerVisual(aA)end A(av)ar(av,'SPAWN',
'Passed all gates',aA)if ap then print((
'[HazardScanner][Hazard] \u{1f534} Hazard Detected: %s (%s, %d studs)'):format(
av.Name,av.ClassName,az))end v()return true end local function av(aw,ax)local ay
=d[aw]if not ay then A(aw)return end if ay.MaxExpireTime and os.clock()<ay.
MaxExpireTime and ax=='Destroyed'then task.delay(ay.MaxExpireTime-os.clock()+0.1
,function()if d[aw]==ay and os.clock()>=ay.MaxExpireTime then av(aw,
'Wave Completed')end end)return end ar(aw,'DESPAWN',ax,ay)ae.DetachZoneVisuals(
ay)af.DetachTrajectoryVisuals(ay)ag.DetachTimerVisual(ay)if ay.Boxes then for az
,aA in ipairs(ay.Boxes)do pcall(function()aA:Destroy()end)end table.clear(ay.
Boxes)end if ay.Connections then for az,aA in ipairs(ay.Connections)do pcall(
function()aA:Disconnect()end)end table.clear(ay.Connections)end d[aw]=nil if ap
then local az=ax and(' ('..ax..')')or''print((
'[HazardScanner][Hazard] \u{1f7e2} Hazard Expired: %s%s'):format(tostring(ay.
Name),az))end v()end function al.ClearAllHazards(aw)h=0 ae.ClearAll()af.
ClearAll()ag.ClearAll()C()local ax={}for ay in pairs(d)do table.insert(ax,ay)end
for ay,az in ipairs(ax)do av(az,aw)end if ap and aw then print((
'[HazardScanner][Hazard] \u{1f9f9} All hazards cleared: %s'):format(aw))end end
function al.TriggerRoomTransition(aw)i=os.clock()+j al.ClearAllHazards(aw or
'Room Transition (2s cooldown)')task.delay(j,function()if an and am then al.
ClearAllHazards'Room Transition Sweep (End 2s)'end end)end function al.
IsRoomTransitioning()return os.clock()<i end function al.StartScan()if am then
return end am=true ae.BindDetection(al)af.BindDetection(al)ag.BindDetection(al)
al.ClearAllHazards'StartScan Reset'for aw,ax in ipairs(g)do ax:Disconnect()end
table.clear(g)table.insert(g,ai.ChildAdded:Connect(function(aw)if u(aw)then
return end at(aw)end))table.insert(g,ai.ChildRemoved:Connect(function(aw)av(aw,
'Destroyed')end))an=ab.GetCurrentRoomIndex()>0 local aw=ab.GetCurrentRoomIndex()
if r then pcall(r)r=nil end r=ab.OnRoomIndexChanged(function(ax)if ax~=aw then
aw=ax if ax>0 then an=true al.TriggerRoomTransition('Room Transition to room '..
tostring(ax))elseif ax<=0 and an then an=false al.ClearAllHazards'Dungeon Ended'
end end end)table.insert(g,ab.OnBossActiveChanged(function(ax)if an and am then
al.TriggerRoomTransition(ax and'Boss Spawned Transition'or
'Boss Cleared Transition')end end))if ap then print
'[HazardScanner] \u{1f4e1} Threat Detector started!'end end function al.StopScan
()am=false an=false for aw,ax in ipairs(g)do ax:Disconnect()end table.clear(g)if
r then pcall(r)r=nil end al.ClearAllHazards'StopScan'if ap then print
'[HazardScanner] \u{1f6d1} Threat Detector stopped.'end end function al.
IsEnabled()return am end function al.SetEnabled(aw)if aw then al.StartScan()else
al.StopScan()end end function al.SetSelectionBoxesEnabled(aw)ao=aw and true or
false if ao then for ax,ay in pairs(d)do if ax and ax.Parent and(not ay.Boxes or
#ay.Boxes==0)then local az=E(ax)ay.Connections=ay.Connections or{}ay.Boxes=K(az,
ay.Connections)end end else for ax,ay in pairs(d)do if ay.Boxes then for az,aA
in ipairs(ay.Boxes)do pcall(function()aA:Destroy()end)end table.clear(ay.Boxes)
end end end end function al.IsSelectionBoxesEnabled()return ao end function al.
SetLogHazards(aw)ap=aw and true or false end function al.IsLogHazardsEnabled()
return ap end function al.SetLogFailed(aw)aq=aw and true or false end function
al.IsLogFailedEnabled()return aq end function al.SetInspectTarget(aw)b=type(aw)
=='string'and aw or''end function al.GetInspectTarget()return b end function al.
SetInspectEnabled(aw)c=aw and true or false end function al.IsInspectEnabled()
return c end function al.GetHazardCount()return e end function al.
GetActiveHazards()local aw={}for ax,ay in pairs(d)do if ax and ax.Parent==ai
then aw[#aw+1]=ay end end return aw end function al.GetActiveHazardsMap()return
d end function al.GetLastHazardInfo()return q end function al.OnHazardChanged(aw
)if type(aw)~='function'then return end table.insert(f,aw)end ac.Register(
function()al.StopScan()al.ClearAllHazards'Shutdown'end)return al