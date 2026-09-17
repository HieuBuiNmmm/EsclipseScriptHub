local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b={cleaned=false,callbacks={}
}function b.Register(c)if type(c)~='function'then return function()end end if b.
cleaned then pcall(c)return function()end end table.insert(b.callbacks,c)return
function()for d,e in ipairs(b.callbacks)do if e==c then table.remove(b.callbacks
,d)break end end end end function b.Cleanup()if b.cleaned then return end b.
cleaned=true for c=#b.callbacks,1,-1 do pcall(b.callbacks[c])end table.clear(b.
callbacks)end function b.IsActive()return not b.cleaned end b.OnCleanup=b.
Register return b end function a.b()local b,c,d,e=game:GetService'Players',game:
GetService'UserInputService',game:GetService'RunService',game:GetService
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
local aa,ab,ac=a.load'b',a.load'a',a.load'd'local ad,ae,af,ag,ah,ai,aj,ak,al,am,
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
function a.f()local aa,ab,ac=a.load'b',a.load'a',a.load'd'local ad,ae,af,ag,ah,
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
'b',a.load'a',a.load'd',a.load'f'local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,b,
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
ag.RefreshAll()end end)ab.Register(function()ag.ClearAll()end)return ag end
function a.h()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.load'b',a.load'c',a.load'a',
a.load'd',a.load'e',a.load'g',a.load'f',game:GetService'Players',game:GetService
'Workspace',game:GetService'ReplicatedStorage'local ak,al,am,an,ao,ap,aq,b,c,d,e
,f,g,h,i,j,k,l,o,p=aa.player,{},false,false,true,false,false,'',false,{},0,{},{}
,0,{'abilities','projectiles'},false,{},{firstbossbeamparticles=true}local q,r,s
,t,u,v,w,x=function()if j then return end j=true for q,r in ipairs(i)do local s=
aj:FindFirstChild(r)if s then for t,u in ipairs(s:GetChildren())do local v=(u.
Name or''):lower():gsub('%s+','')if#v>0 then k[v]=true end end end end end,
function(q)if not q then return true end local r=q.Name if typeof(r)=='string'
then local s=r:lower()if s:sub(1,3)=='tm_'or s:sub(1,3)=='pr_'or s:sub(1,3)==
'dq_'or s:find'pathrecord'or s:find'safespot'or s:find'hazard'or s:find
'adornment'or s:find'debug'or s:find'targetpart'or s:find'actualmarker'then
return true end local t=q.Parent while t and t~=workspace and t~=game do local u
=t.Name if typeof(u)=='string'then local v=u:lower()if v:find'pathrecord'or v:
sub(1,3)=='tm_'or v:sub(1,3)=='pr_'then return true end end t=t.Parent end local
u=s:gsub('%s+','')if#u>0 and k[u]==true then return true end if l[u]==true or l[
r]==true then return true end for v,w in pairs(l)do if string.find(u,v,1,true)
then return true end end end return false end,function(q)if not q then return
false end if ah:GetPlayerFromCharacter(q)then return true end if ah:
FindFirstChild(q.Name)then return true end for r,s in ipairs(ah:GetPlayers())do
if q.Name==s.Name then return true end local t=s.Character if t and(q==t or q:
IsDescendantOf(t))then return true end end local r=ak and ak.Character if r and(
q==r or q:IsDescendantOf(r))then return true end return false end,function()
local q=0 for r in pairs(d)do q+=1 end e=q for r=#f,1,-1 do pcall(f[r],q,o)end
end,0.85,50,0.05,{}local y,z,A=function(y)local z=x[y]if z then z.active=false x
[y]=nil end end,function()for y,z in pairs(x)do if z then z.active=false end end
table.clear(x)end,function(y)if not y or type(y)~='string'then return false end
local z=y:lower():gsub('%s+','')return string.find(z,'firstbossbeampart',1,true)
~=nil end local C,D,E,F,G,H=function(C)if not C then return{}end local D,E={},A(
C.Name)local F=function(F)if F and F.Parent and(F.Transparency<=u or E)then D[#D
+1]=F end end if C:IsA'BasePart'then F(C)else for G,H in ipairs(C:
GetDescendants())do if H:IsA'BasePart'and H.Parent then F(H)end end end return D
end,function(C)local D=ak and ak.Character if not D then return 0 end local E=D:
FindFirstChild'HumanoidRootPart'or D.PrimaryPart if not E then return 0 end
local F,G=(E.Position)if C:IsA'BasePart'then G=C.Position elseif C:IsA'Model'
then local H,I=pcall(function()return C:GetPivot().Position end)if H then G=I
else local J=C:FindFirstChildWhichIsA'BasePart'G=J and J.Position end end if not
G then return 0 end return math.floor((F-G).Magnitude+0.5)end,Color3.fromRGB(255
,45,45),Color3.fromRGB(255,30,30),Color3.fromRGB(0,170,255),Color3.fromRGB(0,140
,255)local I=function(I,J,K)local L,M,N={},K and G or E,K and H or F for O,P in
ipairs(I)do if P and P.Parent and not A(P.Name)and not A(P.Parent and P.Parent.
Name)then local Q=Instance.new'SelectionBox'Q.Name='HazardSelectionBox'Q.Color3=
M Q.SurfaceColor3=N Q.SurfaceTransparency=0.6 Q.LineThickness=0.05 Q.Adornee=P Q
.Parent=P local R=P:GetPropertyChangedSignal'Transparency':Connect(function()if
P.Parent and P.Transparency>u then pcall(function()Q:Destroy()end)end end)if J
then table.insert(J,R)end L[#L+1]=Q end end return L end function al.
UpdateHazardVisualColor(J,K)if not J or not J.Boxes then return end local L=K==
true or J.IsTrajectory==true local M,N=L and G or E,L and H or F for O,P in
ipairs(J.Boxes)do if P and P.Parent then P.Color3=M P.SurfaceColor3=N end end ag
.UpdateHazardVisualColor(J,L)end local J,K=function(J)if not c or b==''then
return false end if not J or type(J)~='string'then return false end local K=b:
lower():gsub('%s+','')if#K==0 then return false end local L=J:lower():gsub('%s+'
,'')return string.find(L,K,1,true)~=nil end,function(J)if not J then return'nil'
end return('(%.2f, %.2f, %.2f)'):format(J.X,J.Y,J.Z)end local ar=function(L,M,N,
O)if not L then return end local P=L.Name if not J(P)then return end local Q,R,S
=L.ClassName,L.Parent and L.Parent:GetFullName()or'nil',D(L)print
'================== \u{1f50d} [HAZARD DEEP INSPECT] \u{1f50d} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(P,Q))print((
'  \u{1f4cc} Event Type     : %s%s'):format(M,N and(' -> '..tostring(N))or''))
print(('  \u{1f4cd} Full Path      : %s'):format(R))print((
'  \u{1f4cf} Dist to Player : %d studs'):format(S))if M=='SPAWN'then local T={}
if L:IsA'BasePart'then table.insert(T,L)else for U,V in ipairs(L:GetDescendants(
))do if V:IsA'BasePart'then table.insert(T,V)end end end print((
'  \u{1f9e9} Total Parts (%d) :'):format(#T))for U,V in ipairs(T)do local W=V:
IsA'Part'and tostring(V.Shape.Name)or(V.ClassName=='MeshPart'and'MeshPart'or V.
ClassName)print(('     [%d] %q (%s)'):format(U,V.Name,V.ClassName))print((
'         \u{2022} Size: %s | Shape: %s | Trans: %.2f | CanCollide: %s'):format(
K(V.Size),W,V.Transparency,tostring(V.CanCollide)))print((
'         \u{2022} Pos : %s'):format(K(V.Position)))end local U=ad.
GetHazardZones(O)if U and U.zones then local V=ad.GetHitboxPadding()print((
'  \u{1f4d0} Math Geometry (Zones: %d, BoundingRadius: %.1f studs):'):format(#U.
zones,U.boundingRadius or 0))for W,X in ipairs(U.zones)do if X.radius then
print((
[[     - Zone [%d]: Circle/Ball (Base Radius: %.2f + Pad: %.2f = %.2f studs)]]):
format(W,X.radius,V,X.radius+V))elseif X.half then print((
'     - Zone [%d]: Box/OBB (HalfSize: %s)'):format(W,K(X.half)))end end end task
.spawn(function()local V if L:IsA'BasePart'then V=L elseif L:IsA'Model'then V=L.
PrimaryPart or L:FindFirstChildWhichIsA'BasePart'end if not V then return end
local W,X=os.clock(),V.CFrame task.wait(0.12)if not L.Parent or not V.Parent
then return end local Y,Z=os.clock(),V.CFrame local _=Y-W if _<=0 then return
end local ar=Z*X:Inverse()local as,at=ar:ToAxisAngle()local au,av=math.deg(at)/_
,X:Inverse()*Z local aw,ax=av:ToAxisAngle()if math.abs(math.deg(at))>=1.5 then
local ay='Tr\u{1ee5}c t\u{1ef1} do / H\u{1ed7}n h\u{1ee3}p'if math.abs(as.Y)>=
0.8 then ay='Tr\u{1ee5}c Y (Yaw - Qu\u{e9}t ngang m\u{1eb7}t s\u{e0}n)'elseif
math.abs(as.X)>=0.8 then ay=
'Tr\u{1ee5}c X (Pitch - L\u{103}n nh\u{e0}o l\u{1ed9}n)'elseif math.abs(as.Z)>=
0.8 then ay='Tr\u{1ee5}c Z (Roll - Nghi\u{ea}ng l\u{1ead}t b\u{ea}n)'end local
az='Tr\u{1ee5}c t\u{1ef1} do'if math.abs(aw.Y)>=0.8 then az=
'Tr\u{1ee5}c Local Y'elseif math.abs(aw.X)>=0.8 then az='Tr\u{1ee5}c Local X'
elseif math.abs(aw.Z)>=0.8 then az='Tr\u{1ee5}c Local Z'end print
'================== \u{1f504} [INSPECT: SPINNING DETECTED] \u{1f504} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(L.Name,V.Name))print((
'  \u{26a1} T\u{1ed1}c \u{111}\u{1ed9} xoay    : %.2f \u{b0}/s (%.2f rad/s)'):
format(au,at/_))print(('  \u{1f310} World Spin Axis: %s -> %s'):format(K(as),ay)
)print(('  \u{1f9e9} Local Spin Axis: %s -> %s'):format(K(aw),az))print
[[========================================================================]]end
end)elseif M=='DESPAWN'then if O and O.SpawnClock then local ar=os.clock()-O.
SpawnClock print(('  \u{23f1}\u{fe0f} Lifetime Active: %.2f seconds'):format(ar)
)end elseif M=='REJECTED'then print(('  \u{26a0}\u{fe0f} Rejection Reason: %s'):
format(tostring(N)))end print
[[================================================================]]end local as
,at=function(as,at)ar(as,'REJECTED',at,nil)if not aq then return end local au,av
=as and as.Name or'?',as and as.ClassName or'?'print((
'[HazardScanner][Reject] \u{26aa} %s (%s) \u{2014} %s'):format(au,av,at))end
local au=function(au)if not au or not au.Parent then return end if s(au)then
return end if d[au]then return end if x[au]then return end local av={active=true
,count=0}x[au]=av task.spawn(function()while av.active and au.Parent and am and
an do if s(au)then y(au)return end av.count+=1 local aw,ax,ay=au:GetDescendants(
),C(au),J(au.Name)if aq or ay then print((
'[HazardScanner][Retry] \u{1f504} L\u{1ea7}n %d/%d: %q (%s) | Descendants: %d | Valid Parts (Trans<=%.2f): %d'
):format(av.count,v,au.Name,au.ClassName,#aw,u,#ax))end if#ax>0 then if aq or ay
then print((
'[HazardScanner][Retry] \u{2705} L\u{1ea7}n %d/%d: %q \u{110}\u{e3} t\u{ec}m th\u{1ea5}y %d part(s)! Ti\u{1ebf}n h\u{e0}nh v\u{1ebd}...'
):format(av.count,v,au.Name,#ax))end y(au)at(au)return end if av.count>=v then
as(au,(
'H\u{1ebf}t %d l\u{1b0}\u{1ee3}t retry m\u{e0} kh\u{f4}ng t\u{ec}m th\u{1ea5}y BasePart h\u{1ee3}p l\u{1ec7} (Descendants: %d)'
):format(v,#aw))y(au)return end task.wait(w)end y(au)end)end at=function(av)if
not am or not an then as(av,'Ch\u{1b0}a trong dungeon')return false end if not
av or not av.Parent then as(av,'Kh\u{f4}ng c\u{f2}n Parent')return false end if
s(av)then as(av,
'Nh\u{e2}n v\u{1ead}t ng\u{1b0}\u{1edd}i ch\u{1a1}i (Player/Teammate)')return
false end if d[av]then return true end q()if r(av)then as(av,
'Tr\u{f9}ng t\u{ea}n trong ReplicatedStorage (abilities/projectiles)')return
false end local aw=C(av)if#aw==0 then as(av,
'Ch\u{1b0}a c\u{f3} part \u{111}\u{1ec3} v\u{1ebd} (s\u{1ebd} retry)')au(av)
return false end local ax,ay=ad.IsIceSpikesChain and ad.IsIceSpikesChain(av.Name
),ad.IsSecondBossCircleChain and ad.IsSecondBossCircleChain(av.Name)if ay then
local az=os.clock()if az-h<6 then as(av,
'V\u{f2}ng con c\u{1ee7}a chu\u{1ed7}i secondBossCricleHitbox (\u{111}\u{e3} d\u{1ef1}ng tr\u{1b0}\u{1edb}c 10 v\u{f2}ng)'
)return false end h=az end local az=D(av)local L,M,N={Instance=av,Name=av.Name,
Class=av.ClassName,Distance=az,Boxes={},Connections={},SpawnClock=os.clock()},{}
,{}if ao and not ax and not ay then N=I(aw,M)end L.Boxes=N L.Connections=M d[av]
=L o={Name=av.Name,Class=av.ClassName,Distance=az}if ae.IsEnabled()then ae.
AttachZoneVisuals(L)end if af.IsEnabled()then af.AttachTrajectoryVisuals(L)end
if ag.IsEnabled()then ag.AttachTimerVisual(L)end y(av)ar(av,'SPAWN',
'Passed all gates',L)if ap then print((
'[HazardScanner][Hazard] \u{1f534} Hazard Detected: %s (%s, %d studs)'):format(
av.Name,av.ClassName,az))end t()return true end local function av(aw,ax)local ay
=d[aw]if not ay then y(aw)return end if ay.MaxExpireTime and os.clock()<ay.
MaxExpireTime and ax=='Destroyed'then task.delay(ay.MaxExpireTime-os.clock()+0.1
,function()if d[aw]==ay and os.clock()>=ay.MaxExpireTime then av(aw,
'Wave Completed')end end)return end ar(aw,'DESPAWN',ax,ay)ae.DetachZoneVisuals(
ay)af.DetachTrajectoryVisuals(ay)ag.DetachTimerVisual(ay)if ay.Boxes then for az
,L in ipairs(ay.Boxes)do pcall(function()L:Destroy()end)end table.clear(ay.Boxes
)end if ay.Connections then for az,L in ipairs(ay.Connections)do pcall(function(
)L:Disconnect()end)end table.clear(ay.Connections)end d[aw]=nil if ap then local
az=ax and(' ('..ax..')')or''print((
'[HazardScanner][Hazard] \u{1f7e2} Hazard Expired: %s%s'):format(tostring(ay.
Name),az))end t()end function al.ClearAllHazards(aw)h=0 ae.ClearAll()af.
ClearAll()ag.ClearAll()z()local ax={}for ay in pairs(d)do table.insert(ax,ay)end
for ay,az in ipairs(ax)do av(az,aw)end if ap and aw then print((
'[HazardScanner][Hazard] \u{1f9f9} All hazards cleared: %s'):format(aw))end end
function al.StartScan()if am then return end am=true ae.BindDetection(al)af.
BindDetection(al)ag.BindDetection(al)al.ClearAllHazards'StartScan Reset'for aw,
ax in ipairs(g)do ax:Disconnect()end table.clear(g)table.insert(g,ai.ChildAdded:
Connect(function(aw)if s(aw)then return end at(aw)end))table.insert(g,ai.
ChildRemoved:Connect(function(aw)av(aw,'Destroyed')end))an=ab.
GetCurrentRoomIndex()>0 if p then pcall(p)p=nil end p=ab.OnRoomIndexChanged(
function(aw)if aw>0 then an=true elseif aw<=0 and an then an=false al.
ClearAllHazards'Dungeon Ended'end end)if ap then print
'[HazardScanner] \u{1f4e1} Threat Detector started!'end end function al.StopScan
()am=false an=false for aw,ax in ipairs(g)do ax:Disconnect()end table.clear(g)if
p then pcall(p)p=nil end al.ClearAllHazards'StopScan'if ap then print
'[HazardScanner] \u{1f6d1} Threat Detector stopped.'end end function al.
IsEnabled()return am end function al.SetEnabled(aw)if aw then al.StartScan()else
al.StopScan()end end function al.SetSelectionBoxesEnabled(aw)ao=aw and true or
false if ao then for ax,ay in pairs(d)do if ax and ax.Parent and(not ay.Boxes or
#ay.Boxes==0)then local az=C(ax)ay.Connections=ay.Connections or{}ay.Boxes=I(az,
ay.Connections)end end else for ax,ay in pairs(d)do if ay.Boxes then for az,L in
ipairs(ay.Boxes)do pcall(function()L:Destroy()end)end table.clear(ay.Boxes)end
end end end function al.IsSelectionBoxesEnabled()return ao end function al.
SetLogHazards(aw)ap=aw and true or false end function al.IsLogHazardsEnabled()
return ap end function al.SetLogFailed(aw)aq=aw and true or false end function
al.IsLogFailedEnabled()return aq end function al.SetInspectTarget(aw)b=type(aw)
=='string'and aw or''end function al.GetInspectTarget()return b end function al.
SetInspectEnabled(aw)c=aw and true or false end function al.IsInspectEnabled()
return c end function al.GetHazardCount()return e end function al.
GetActiveHazards()local aw={}for ax,ay in pairs(d)do if ax and ax.Parent==ai
then aw[#aw+1]=ay end end return aw end function al.GetActiveHazardsMap()return
d end function al.GetLastHazardInfo()return o end function al.OnHazardChanged(aw
)if type(aw)~='function'then return end table.insert(f,aw)end ac.Register(
function()al.StopScan()al.ClearAllHazards'Shutdown'end)return al end function a.
i()local aa,ab,ac,ad=a.load'b',a.load'a',a.load'd',a.load'g'local ae,af,ag,ah,ai
,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av=aa.RunService or game:GetService
'RunService',aa.player,{},true,false,{},1.8,Color3.fromRGB(0,255,170),Color3.
fromRGB(255,35,35),0.45,0.2,0.2,(game:GetService'Players')local aw,ax,ay,az=
function()local aw=af or aq.LocalPlayer if not aw then return nil end local ax=
aw.Character if not ax or not ax.Parent then return nil end local ay=ax:
FindFirstChildOfClass'Humanoid'if ay and ay.Health<=0 then return nil end return
ax:FindFirstChild'HumanoidRootPart'or ax.PrimaryPart end,function(aw)if not aw
then return 0 end return aw.Position.Y-2.5 end,function(aw)if au then if au.
Parent~=aw or not au:IsDescendantOf(workspace)then pcall(function()au:Destroy()
end)au=nil else if au.Adornee~=aw then au.Adornee=aw end return au end end if
not aw or not aw.Parent then return nil end local ax=Instance.new
'CylinderHandleAdornment'ax.Name='Player_2D_HitboxVisual'ax.Adornee=aw ax.Radius
=ak ax.Height=ap ax.Color3=ai and am or al ax.Transparency=ai and ao or an ax.
ZIndex=5 ax.AlwaysOnTop=false ax.Visible=ah ax.Parent=aw au=ax return ax end,
function(aw)if not au or not au.Parent then return end au.Color3=aw and am or al
au.Transparency=aw and ao or an end local b=function()local b=aw()if not b or
not b.Parent then if au and au.Parent then au.Visible=false end if ai then ai=
false ar=nil as=nil for c,d in ipairs(aj)do pcall(d,false,nil,nil)end end return
end local c=ay(b)if c and c.Parent then c.Visible=ah c.Radius=ak local d=ax(b)
local e=CFrame.new(Vector3.new(b.Position.X,d,b.Position.Z))*CFrame.Angles(math.
rad(90),0,0)c.CFrame=b.CFrame:ToObjectSpace(e)end local d=Vector3.new(b.Position
.X,0,b.Position.Z)local e,f,g=ac.IsPointInAnyHazard(d,nil,ak)local h,i=false if
not e and ad.IsPointInAnyTrajectory then h,i=ad.IsPointInAnyTrajectory(d,ak)end
local j,k,l=(e or h),f or i,e and'Ground Zone'or(h and'Trajectory Corridor'or
nil)if j~=ai or k~=ar then ai=j ar=k as=l az(j)for o,p in ipairs(aj)do pcall(p,j
,k,l)end end end local c=function()if not at then at=ae.Heartbeat:Connect(b)end
end function ag.Cleanup()if at then at:Disconnect()at=nil end if au then pcall(
function()au:Destroy()end)au=nil end ai=false ar=nil as=nil end function ag.
IsPlayerInDanger()return ai,ar,as end function ag.GetCurrentThreat()return ar,as
end function ag.OnDangerStatusChanged(d)if type(d)=='function'then table.insert(
aj,d)end end function ag.SetVisualEnabled(d)ah=d and true or false if au then au
.Visible=ah end end function ag.IsVisualEnabled()return ah end function ag.
SetRadius(d)if type(d)=='number'and d>=0.1 then ak=d if au and au.Parent then au
.Radius=ak end end end function ag.GetRadius()return ak end local d=function()
local d=af or aq.LocalPlayer if not d then return end local e=function(e)if au
then pcall(function()au:Destroy()end)au=nil end task.spawn(function()local f=e:
WaitForChild('Humanoid',3)if f then f.Died:Connect(function()if au then au.
Visible=false end end)end end)end av=d.CharacterAdded:Connect(e)if d.Character
then e(d.Character)end end d()c()ab.Register(function()if av then av:Disconnect(
)av=nil end ag.Cleanup()end)return ag end function a.j()local aa,ab,ac={},{},8
for ad=1,ac do local ae=(ad-1)*(2*math.pi/ac)ab[ad]=Vector3.new(math.cos(ae),0,
math.sin(ae))end local ad,ae={},16 for af=1,ae do local ag=(af-1)*(2*math.pi/ae)
ad[af]=Vector3.new(math.cos(ag),0,math.sin(ag))end local af,ag,ah={1.5,3,5,8,12,
18,25},{1.5,3,4.5,6,8,10.5,13.5,17,21,26,32,38,45},{1.5,3,4.5,6,8,10.5,13.5,17,
21,26,32,38,45,50,55}aa.COARSE_DIRECTIONS=ab aa.FINE_DIRECTIONS=ad aa.
COARSE_RADII=af aa.FINE_RADII=ag aa.FALLBACK_RADII=ah function aa.SamplePass(ai,
aj,ak,al,am,an,ao,ap)local aq,ar,as,at,au=math.huge,Vector3.zero,false,aj if ap
and ap.Magnitude>0.1 then local av=Vector3.new(ap.X,0,ap.Z).Unit at=table.clone(
aj)table.sort(at,function(aw,ax)local ay,az=aw.X*av.X+aw.Z*av.Z,ax.X*av.X+ax.Z*
av.Z return ay>az end)end for av,aw in ipairs(ak)do local ax=false for ay,az in
ipairs(at)do local b=ai+az*aw local c=an(b)if ao then table.insert(ao,{pos=b,
isSafe=c,isChosen=false})end if c then local d=b if am and al>0 then local e=b+
az*al if an(e)then d=e end end local e=(d-ai).Magnitude if e<aq then aq=e au=d
ar=az ax=true end end end if ax and au then as=true break end end return au,as,
aq,ar end return aa end function a.k()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,
am=Color3.fromRGB(0,255,120),Color3.fromRGB(0,255,150),Color3.fromRGB(255,255,
255),Color3.fromRGB(0,235,140),Color3.fromRGB(255,60,60),0.2,1.4,0.45,{},{}local
an,ao=function(an)if not an then return end if not ak or not ak.Parent then if
ak then pcall(function()ak:Destroy()end)end local ao=Instance.new
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
PointToObjectSpace(at)for av,aw in ipairs(ar)do local ax,ay=ao(av,ap),Vector3.
new(aw.pos.X,aq+0.05,aw.pos.Z)local az,b,c=ap.CFrame:PointToObjectSpace(ay),aw.
isSafe and ad or ae,aw.isSafe and 0.35 or 0.55 if ax.dot and ax.dot.Parent then
local d=CFrame.new(ay)*CFrame.Angles(math.rad(90),0,0)ax.dot.CFrame=ap.CFrame:
ToObjectSpace(d)ax.dot.Color3=b ax.dot.Transparency=c ax.dot.Radius=aw.isSafe
and 0.3 or 0.2 ax.dot.Visible=true end if ax.line and ax.line.Parent then local
d=az-au local e=d.Magnitude if e>0.2 then ax.line.CFrame=CFrame.lookAt(au,az)ax.
line.Length=e ax.line.Color3=b ax.line.Transparency=c+0.15 ax.line.Thickness=aw.
isSafe and 1.4 or 0.9 ax.line.Visible=true else ax.line.Visible=false end end
end for av=#ar+1,#aj do local aw=aj[av]if aw.dot and aw.dot.Parent then aw.dot.
Visible=false end if aw.line and aw.line.Parent then aw.line.Visible=false end
end end function ai.Update(aq,ar,as,at,au,av)if not aq or not aq.Parent or not
au or not ar then ai.Hide()return end an(aq)local aw=Vector3.new(ar.X,as,ar.Z)if
ak and ak.Parent then local ax=CFrame.new(aw)*CFrame.Angles(math.rad(90),0,0)ak.
CFrame=aq.CFrame:ToObjectSpace(ax)ak.Visible=true end if al and al.Parent then
local ax=CFrame.new(aw)*CFrame.Angles(math.rad(90),0,0)al.CFrame=aq.CFrame:
ToObjectSpace(ax)al.Visible=true end if am and am.Parent then local ax,ay=
Vector3.new(aq.Position.X,as+0.1,aq.Position.Z),Vector3.new(ar.X,as+0.1,ar.Z)
local az,b=aq.CFrame:PointToObjectSpace(ax),aq.CFrame:PointToObjectSpace(ay)
local c=b-az local d=c.Magnitude if d>0.3 then am.CFrame=CFrame.new(az)am.Length
=d am.CFrame=CFrame.lookAt(az,b)am.Visible=true else am.Visible=false end end
ap(aq,as,at,av)end function ai.Cleanup()if ak then pcall(function()ak:Destroy()
end)ak=nil end if al then pcall(function()al:Destroy()end)al=nil end if am then
pcall(function()am:Destroy()end)am=nil end for aq,ar in ipairs(aj)do if ar.dot
then pcall(function()ar.dot:Destroy()end)end if ar.line then pcall(function()ar.
line:Destroy()end)end end table.clear(aj)end return ai end function a.l()local
aa={Options={},Folder='Maclib',contextData={},GetService=function(aa)return
cloneref and cloneref(game:GetService(aa))or game:GetService(aa)end}local ab,ac,
ad,ae,af,ag,ah=aa.GetService'TweenService',aa.GetService'RunService',aa.
GetService'HttpService',aa.GetService'ContentProvider',aa.GetService
'UserInputService',aa.GetService'Lighting',aa.GetService'Players'local ai,aj,ak,
al,am,an,ao,ap,aq,ar,as=ac:IsStudio(),ah.LocalPlayer,{},0,false,{interFont=
'rbxassetid://12187365364',userInfoBlurred='rbxassetid://18824089198',
toggleBackground='rbxassetid://18772190202',togglerHead=
'rbxassetid://18772309008',buttonImage='rbxassetid://10709791437',searchIcon=
'rbxassetid://86737463322606',colorWheel='rbxassetid://2849458409',colorTarget=
'rbxassetid://73265255323268',grid='rbxassetid://121484455191370',globe=
'rbxassetid://108952102602834',transform='rbxassetid://90336395745819',dropdown=
'rbxassetid://18865373378',sliderbar='rbxassetid://18772615246',sliderhead=
'rbxassetid://18772834246'},function()pcall(function()local ai=setthreadidentity
or set_thread_identity or setidentity or(syn and syn.set_thread_identity)if ai
then local aj=pcall(ai,7)if not aj then pcall(ai,8)end end end)end aa.Elevate=ao
local at,au=function()ao()local at=Instance.new'ScreenGui'at.ScreenInsets=Enum.
ScreenInsets.None at.ResetOnSpawn=false at.ZIndexBehavior=Enum.ZIndexBehavior.
Sibling at.DisplayOrder=2147483647 local au=ac:IsStudio()and aj:FindFirstChild
'PlayerGui'or(gethui and gethui())or(cloneref and cloneref(aa.GetService
'CoreGui')or aa.GetService'CoreGui')at.Parent=au return at end,function(at,au,av
)ao()local aw,ax=pcall(ab.Create,ab,at,au,av)if aw and ax then return ax end if
av and typeof(at)=='Instance'then for ay,az in pairs(av)do pcall(function()at[ay
]=az end)end end return{Play=function()end,Cancel=function()end,Pause=function()
end,Completed={Wait=function()end}}end function aa:Window(av)local aw={Settings=
av}if av.AcrylicBlur~=nil then aq=av.AcrylicBlur else aq=true end local ax,ay=
at(),Instance.new'Frame'ay.Name='Notifications'ay.BackgroundColor3=Color3.
fromRGB(255,255,255)ay.BackgroundTransparency=1 ay.BorderColor3=Color3.fromRGB(0
,0,0)ay.BorderSizePixel=0 ay.Size=UDim2.fromScale(1,1)ay.Parent=ax ay.ZIndex=2
local az=Instance.new'UIListLayout'az.Name='NotificationsUIListLayout'az.Padding
=UDim.new(0,10)az.HorizontalAlignment=Enum.HorizontalAlignment.Right az.
SortOrder=Enum.SortOrder.LayoutOrder az.VerticalAlignment=Enum.VerticalAlignment
.Bottom az.Parent=ay local b=Instance.new'UIPadding'b.Name=
'NotificationsUIPadding'b.PaddingBottom=UDim.new(0,10)b.PaddingLeft=UDim.new(0,
10)b.PaddingRight=UDim.new(0,10)b.PaddingTop=UDim.new(0,10)b.Parent=ay local c=
Instance.new'Frame'c.Name='Base'c.AnchorPoint=Vector2.new(0.5,0.5)c.
BackgroundColor3=Color3.fromRGB(15,15,15)c.BackgroundTransparency=av.AcrylicBlur
and 0.05 or 0 c.BorderColor3=Color3.fromRGB(0,0,0)c.BorderSizePixel=0 c.Position
=UDim2.fromScale(0.5,0.5)c.Size=av.Size or UDim2.fromOffset(868,650)local d=
Instance.new'UIScale'd.Name='BaseUIScale'd.Parent=c local e=Instance.new
'UICorner'e.Name='BaseUICorner'e.CornerRadius=UDim.new(0,10)e.Parent=c local f=
Instance.new'UIStroke'f.Name='BaseUIStroke'f.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border f.Color=Color3.fromRGB(255,255,255)f.Transparency=0.9 f.
Parent=c local g=Instance.new'Frame'g.Name='Sidebar'g.BackgroundColor3=Color3.
fromRGB(255,255,255)g.BackgroundTransparency=1 g.BorderColor3=Color3.fromRGB(0,0
,0)g.BorderSizePixel=0 g.Position=UDim2.fromScale(-3.5199999999999996E-8,4.69e-8
)g.Size=av.SidebarWidth and UDim2.new(0,av.SidebarWidth,1,0)or UDim2.fromScale(
0.325,1)local h=Instance.new'Frame'h.Name='Divider'h.AnchorPoint=Vector2.new(1,0
)h.BackgroundColor3=Color3.fromRGB(255,255,255)h.BackgroundTransparency=0.9 h.
BorderColor3=Color3.fromRGB(0,0,0)h.BorderSizePixel=0 h.Position=UDim2.
fromScale(1,0)h.Size=UDim2.new(0,1,1,0)h.Parent=g local i=Instance.new
'TextButton'i.Name='DividerInteract'i.AnchorPoint=Vector2.new(0.5,0)i.
BackgroundColor3=Color3.fromRGB(255,255,255)i.BackgroundTransparency=1 i.
BorderColor3=Color3.fromRGB(0,0,0)i.BorderSizePixel=0 i.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'i.Position=UDim2.fromScale(0.5,0)i
.Size=UDim2.new(1,6,1,0)i.Text=''i.TextColor3=Color3.fromRGB(0,0,0)i.TextSize=14
i.Parent=h local j=Instance.new'Frame'j.Name='WindowControls'j.BackgroundColor3=
Color3.fromRGB(255,255,255)j.BackgroundTransparency=1 j.BorderColor3=Color3.
fromRGB(0,0,0)j.BorderSizePixel=0 j.Size=UDim2.new(1,0,0,31)local k=Instance.new
'Frame'k.Name='Controls'k.BackgroundColor3=Color3.fromRGB(119,174,94)k.
BackgroundTransparency=1 k.BorderColor3=Color3.fromRGB(0,0,0)k.BorderSizePixel=0
k.Size=UDim2.fromScale(1,1)local l=Instance.new'UIListLayout'l.Name=
'UIListLayout'l.Padding=UDim.new(0,5)l.FillDirection=Enum.FillDirection.
Horizontal l.SortOrder=Enum.SortOrder.LayoutOrder l.VerticalAlignment=Enum.
VerticalAlignment.Center l.Parent=k local o=Instance.new'UIPadding'o.Name=
'UIPadding'o.PaddingLeft=UDim.new(0,11)o.Parent=k local p,q={sizes={enabled=
UDim2.fromOffset(8,8),disabled=UDim2.fromOffset(7,7)},transparencies={enabled=0,
disabled=1},strokeTransparency=0.9},Instance.new'UIStroke'q.Name='BaseUIStroke'q
.ApplyStrokeMode=Enum.ApplyStrokeMode.Border q.Color=Color3.fromRGB(255,255,255)
q.Transparency=p.strokeTransparency local r=Instance.new'TextButton'r.Name=
'Exit'r.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'r.Text=''
r.TextColor3=Color3.fromRGB(0,0,0)r.TextSize=14 r.AutoButtonColor=false r.
BackgroundColor3=Color3.fromRGB(250,93,86)r.BorderColor3=Color3.fromRGB(0,0,0)r.
BorderSizePixel=0 local s=Instance.new'UICorner's.Name='UICorner's.CornerRadius=
UDim.new(1,0)s.Parent=r r.Parent=k local t=Instance.new'TextButton't.Name=
'Minimize't.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json't.
Text=''t.TextColor3=Color3.fromRGB(0,0,0)t.TextSize=14 t.AutoButtonColor=false t
.BackgroundColor3=Color3.fromRGB(252,190,57)t.BorderColor3=Color3.fromRGB(0,0,0)
t.BorderSizePixel=0 t.LayoutOrder=1 local u=Instance.new'UICorner'u.Name=
'UICorner'u.CornerRadius=UDim.new(1,0)u.Parent=t t.Parent=k local v=Instance.new
'TextButton'v.Name='Maximize'v.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'v.Text=''v.TextColor3=Color3.
fromRGB(0,0,0)v.TextSize=14 v.AutoButtonColor=false v.BackgroundColor3=Color3.
fromRGB(119,174,94)v.BorderColor3=Color3.fromRGB(0,0,0)v.BorderSizePixel=0 v.
LayoutOrder=1 local w=Instance.new'UICorner'w.Name='UICorner'w.CornerRadius=UDim
.new(1,0)w.Parent=v v.Parent=k local x=function(x,y)local z,A=y and p.sizes.
enabled or p.sizes.disabled,y and p.transparencies.enabled or p.transparencies.
disabled x.Size=z x.BackgroundTransparency=A x.Active=y x.Interactable=y for C,D
in ipairs(x:GetChildren())do if D:IsA'UIStroke'then D.Transparency=A end end if
not y then q:Clone().Parent=x end end x(v,false)local y={r,t}for z,A in pairs(y)
do local C,D=A.Name,true if av.DisabledWindowControls and table.find(av.
DisabledWindowControls,C)then D=false end x(A,D)end k.Parent=j local z=Instance.
new'Frame'z.Name='Divider'z.AnchorPoint=Vector2.new(0,1)z.BackgroundColor3=
Color3.fromRGB(255,255,255)z.BackgroundTransparency=0.9 z.BorderColor3=Color3.
fromRGB(0,0,0)z.BorderSizePixel=0 z.Position=UDim2.fromScale(0,1)z.Size=UDim2.
new(1,0,0,1)z.Parent=j j.Parent=g local A=Instance.new'Frame'A.Name=
'Information'A.BackgroundColor3=Color3.fromRGB(255,255,255)A.
BackgroundTransparency=1 A.BorderColor3=Color3.fromRGB(0,0,0)A.BorderSizePixel=0
A.Position=UDim2.fromOffset(0,31)A.Size=UDim2.new(1,0,0,60)local C=Instance.new
'Frame'C.Name='Divider'C.AnchorPoint=Vector2.new(0,1)C.BackgroundColor3=Color3.
fromRGB(255,255,255)C.BackgroundTransparency=0.9 C.BorderColor3=Color3.fromRGB(0
,0,0)C.BorderSizePixel=0 C.Position=UDim2.fromScale(0,1)C.Size=UDim2.new(1,0,0,1
)C.Parent=A local D=Instance.new'Frame'D.Name='InformationHolder'D.
BackgroundColor3=Color3.fromRGB(255,255,255)D.BackgroundTransparency=1 D.
BorderColor3=Color3.fromRGB(0,0,0)D.BorderSizePixel=0 D.Size=UDim2.fromScale(1,1
)local E=Instance.new'UIPadding'E.Name='InformationHolderUIPadding'E.
PaddingBottom=UDim.new(0,10)E.PaddingLeft=UDim.new(0,23)E.PaddingRight=UDim.new(
0,22)E.PaddingTop=UDim.new(0,10)E.Parent=D local F=Instance.new'ImageButton'F.
Name='GlobalSettingsButton'F.Image=an.globe F.ImageTransparency=0.5 F.
AnchorPoint=Vector2.new(1,0.5)F.BackgroundColor3=Color3.fromRGB(255,255,255)F.
BackgroundTransparency=1 F.BorderColor3=Color3.fromRGB(0,0,0)F.BorderSizePixel=0
F.Position=UDim2.fromScale(1,0.5)F.Size=UDim2.fromOffset(16,16)F.Parent=D local
G=function(G)if G=='Default'then au(F,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
ImageTransparency=0.5}):Play()elseif G=='Hover'then au(F,TweenInfo.new(0.2,Enum.
EasingStyle.Sine),{ImageTransparency=0.3}):Play()end end F.MouseEnter:Connect(
function()G'Hover'end)F.MouseLeave:Connect(function()G'Default'end)local H=
Instance.new'Frame'H.Name='TitleFrame'H.BackgroundColor3=Color3.fromRGB(255,255,
255)H.BackgroundTransparency=1 H.BorderColor3=Color3.fromRGB(0,0,0)H.
BorderSizePixel=0 H.Size=UDim2.fromScale(1,1)local I=Instance.new'TextLabel'I.
Name='Title'I.FontFace=Font.new(an.interFont,Enum.FontWeight.SemiBold,Enum.
FontStyle.Normal)I.Text=av.Title I.TextColor3=Color3.fromRGB(255,255,255)I.
RichText=true I.TextSize=18 I.TextTransparency=0.1 I.TextTruncate=Enum.
TextTruncate.SplitWord I.TextXAlignment=Enum.TextXAlignment.Left I.
TextYAlignment=Enum.TextYAlignment.Top I.AutomaticSize=Enum.AutomaticSize.Y I.
BackgroundColor3=Color3.fromRGB(255,255,255)I.BackgroundTransparency=1 I.
BorderColor3=Color3.fromRGB(0,0,0)I.BorderSizePixel=0 I.Size=UDim2.new(1,-20,0,0
)I.Parent=H local J=Instance.new'TextLabel'J.Name='Subtitle'J.FontFace=Font.new(
an.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)J.RichText=true J.Text
=av.Subtitle J.RichText=true J.TextColor3=Color3.fromRGB(255,255,255)J.TextSize=
12 J.TextTransparency=0.7 J.TextTruncate=Enum.TextTruncate.SplitWord J.
TextXAlignment=Enum.TextXAlignment.Left J.TextYAlignment=Enum.TextYAlignment.Top
J.AutomaticSize=Enum.AutomaticSize.Y J.BackgroundColor3=Color3.fromRGB(255,255,
255)J.BackgroundTransparency=1 J.BorderColor3=Color3.fromRGB(0,0,0)J.
BorderSizePixel=0 J.LayoutOrder=1 J.Size=UDim2.new(1,-20,0,0)J.Parent=H local K=
Instance.new'UIListLayout'K.Name='TitleFrameUIListLayout'K.Padding=UDim.new(0,3)
K.SortOrder=Enum.SortOrder.LayoutOrder K.VerticalAlignment=Enum.
VerticalAlignment.Center K.Parent=H H.Parent=D D.Parent=A A.Parent=g local L=
Instance.new'Frame'L.Name='SidebarGroup'L.BackgroundColor3=Color3.fromRGB(255,
255,255)L.BackgroundTransparency=1 L.BorderColor3=Color3.fromRGB(0,0,0)L.
BorderSizePixel=0 L.Position=UDim2.fromOffset(0,91)L.Size=UDim2.new(1,0,1,-91)
local M=Instance.new'Frame'M.Name='UserInfo'M.AnchorPoint=Vector2.new(0,1)M.
BackgroundColor3=Color3.fromRGB(255,255,255)M.BackgroundTransparency=1 M.
BorderColor3=Color3.fromRGB(0,0,0)M.BorderSizePixel=0 M.Position=UDim2.
fromScale(0,1)M.Size=UDim2.new(1,0,0,107)local N=Instance.new'Frame'N.Name=
'InformationGroup'N.BackgroundColor3=Color3.fromRGB(255,255,255)N.
BackgroundTransparency=1 N.BorderColor3=Color3.fromRGB(0,0,0)N.BorderSizePixel=0
N.Size=UDim2.fromScale(1,1)local O=Instance.new'UIPadding'O.Name=
'InformationGroupUIPadding'O.PaddingBottom=UDim.new(0,17)O.PaddingLeft=UDim.new(
0,25)O.Parent=N local P=Instance.new'UIListLayout'P.Name=
'InformationGroupUIListLayout'P.FillDirection=Enum.FillDirection.Horizontal P.
SortOrder=Enum.SortOrder.LayoutOrder P.VerticalAlignment=Enum.VerticalAlignment.
Center P.Parent=N local Q,R,S=aj.UserId,Enum.ThumbnailType.AvatarBust,Enum.
ThumbnailSize.Size48x48 local T,U=ah:GetUserThumbnailAsync(Q,R,S)local V=
Instance.new'ImageLabel'V.Name='Headshot'V.BackgroundColor3=Color3.fromRGB(255,
255,255)V.BackgroundTransparency=1 V.BorderColor3=Color3.fromRGB(0,0,0)V.
BorderSizePixel=0 V.Size=UDim2.fromOffset(32,32)V.Image=(U and T)or
'rbxassetid://0'local W=Instance.new'UICorner'W.Name='UICorner'W.CornerRadius=
UDim.new(1,0)W.Parent=V local X=Instance.new'UIStroke'X.Name='BaseUIStroke'X.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border X.Color=Color3.fromRGB(255,255,255)X
.Transparency=0.9 X.Parent=V V.Parent=N local Y=Instance.new'Frame'Y.Name=
'UserAndDisplayFrame'Y.BackgroundColor3=Color3.fromRGB(255,255,255)Y.
BackgroundTransparency=1 Y.BorderColor3=Color3.fromRGB(0,0,0)Y.BorderSizePixel=0
Y.LayoutOrder=1 Y.Size=UDim2.new(1,-42,0,32)local Z=Instance.new'TextLabel'Z.
Name='DisplayName'Z.FontFace=Font.new(an.interFont,Enum.FontWeight.SemiBold,Enum
.FontStyle.Normal)Z.Text=aj.DisplayName Z.TextColor3=Color3.fromRGB(255,255,255)
Z.TextSize=13 Z.TextTransparency=0.1 Z.TextTruncate=Enum.TextTruncate.SplitWord
Z.TextXAlignment=Enum.TextXAlignment.Left Z.TextYAlignment=Enum.TextYAlignment.
Top Z.AutomaticSize=Enum.AutomaticSize.XY Z.BackgroundColor3=Color3.fromRGB(255,
255,255)Z.BackgroundTransparency=1 Z.BorderColor3=Color3.fromRGB(0,0,0)Z.
BorderSizePixel=0 Z.Parent=Y Z.Size=UDim2.fromScale(1,0)local _=Instance.new
'UIPadding'_.Name='UserAndDisplayFrameUIPadding'_.PaddingLeft=UDim.new(0,8)_.
PaddingTop=UDim.new(0,3)_.Parent=Y local aA=Instance.new'UIListLayout'aA.Name=
'UserAndDisplayFrameUIListLayout'aA.Padding=UDim.new(0,1)aA.SortOrder=Enum.
SortOrder.LayoutOrder aA.Parent=Y local aB=Instance.new'TextLabel'aB.Name=
'Username'aB.FontFace=Font.new(an.interFont,Enum.FontWeight.SemiBold,Enum.
FontStyle.Normal)aB.Text='@'..aj.Name aB.TextColor3=Color3.fromRGB(255,255,255)
aB.TextSize=12 aB.TextTransparency=0.7 aB.TextTruncate=Enum.TextTruncate.
SplitWord aB.TextXAlignment=Enum.TextXAlignment.Left aB.TextYAlignment=Enum.
TextYAlignment.Top aB.AutomaticSize=Enum.AutomaticSize.XY aB.BackgroundColor3=
Color3.fromRGB(255,255,255)aB.BackgroundTransparency=1 aB.BorderColor3=Color3.
fromRGB(0,0,0)aB.BorderSizePixel=0 aB.LayoutOrder=1 aB.Parent=Y aB.Size=UDim2.
fromScale(1,0)Y.Parent=N N.Parent=M local aC=Instance.new'UIPadding'aC.Name=
'UserInfoUIPadding'aC.PaddingLeft=UDim.new(0,10)aC.PaddingRight=UDim.new(0,10)aC
.Parent=M M.Parent=L local aD=Instance.new'UIPadding'aD.Name=
'SidebarGroupUIPadding'aD.PaddingLeft=UDim.new(0,10)aD.PaddingRight=UDim.new(0,
10)aD.PaddingTop=UDim.new(0,31)aD.Parent=L local aE=Instance.new'Frame'aE.Name=
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
new(0,2)aH.Parent=aF aF.Parent=aE aE.Parent=L L.Parent=g g.Parent=c local aI=
Instance.new'Frame'aI.Name='Content'aI.AnchorPoint=Vector2.new(1,0)aI.
BackgroundColor3=Color3.fromRGB(255,255,255)aI.BackgroundTransparency=1 aI.
BorderColor3=Color3.fromRGB(0,0,0)aI.BorderSizePixel=0 aI.Position=UDim2.
fromScale(1,4.69e-8)aI.Size=UDim2.new(0,(c.AbsoluteSize.X-g.AbsoluteSize.X),1,0)
local aJ,aK,aL,aM,aN,aO=false,g.AbsoluteSize.X,20,107 local aP,aQ=c.AbsoluteSize
.X-aM,{DefaultTransparency=0.9,HoverTransparency=0.85,EasingStyle=Enum.
EasingStyle.Sine}local aR=function(aR)au(h,TweenInfo.new(0.2,aQ.EasingStyle),{
BackgroundTransparency=aR=='Idle'and aQ.DefaultTransparency or aQ.
HoverTransparency}):Play()end i.MouseEnter:Connect(function()aR'Hover'end)i.
MouseLeave:Connect(function()aR'Idle'end)i.MouseButton1Down:Connect(function()aJ
=true aN=af:GetMouseLocation().X aO=g.AbsoluteSize.X end)af.InputEnded:Connect(
function(aS)if aS.UserInputType==Enum.UserInputType.MouseButton1 then aJ=false
end end)af.InputChanged:Connect(function(aS)if aJ and aS.UserInputType==Enum.
UserInputType.MouseMovement then local aT=af:GetMouseLocation().X-aN local aU=aO
+aT if math.abs(aU-aK)<aL then aU=aK else aU=math.clamp(aU,aM,aP)end g.Size=
UDim2.new(0,aU,1,0)aI.Size=UDim2.new(0,c.AbsoluteSize.X-aU,1,0)end end)local aS=
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
fromScale(1,0.5)aW.Size=UDim2.fromOffset(15,15)aW.Parent=aU aW.Visible=not av.
DragStyle or av.DragStyle==1 local aX=Instance.new'TextButton'aX.Name='Interact'
aX.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'aX.Text=''aX.
TextColor3=Color3.fromRGB(0,0,0)aX.TextSize=14 aX.AnchorPoint=Vector2.new(0.5,
0.5)aX.BackgroundColor3=Color3.fromRGB(255,255,255)aX.BackgroundTransparency=1
aX.BorderColor3=Color3.fromRGB(0,0,0)aX.BorderSizePixel=0 aX.Position=UDim2.
fromScale(0.5,0.5)aX.Size=UDim2.fromOffset(40,40)aX.Parent=aW local aY=function(
aY)if aY=='Default'then au(aW,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
ImageTransparency=0.7}):Play()elseif aY=='Hover'then au(aW,TweenInfo.new(0.2,
Enum.EasingStyle.Sine),{ImageTransparency=0.4}):Play()end end aX.MouseEnter:
Connect(function()aY'Hover'end)aX.MouseLeave:Connect(function()aY'Default'end)
local aZ,a_,a0,a1=false local a2,a3,a4=function(a2)local a3=a2.Position-a0 c.
Position=UDim2.new(a1.X.Scale,a1.X.Offset+a3.X,a1.Y.Scale,a1.Y.Offset+a3.Y)end,
function(a2)if a2.UserInputType==Enum.UserInputType.MouseButton1 or a2.
UserInputType==Enum.UserInputType.Touch then aZ=true a0=a2.Position a1=c.
Position a2.Changed:Connect(function()if a2.UserInputState==Enum.UserInputState.
End then aZ=false end end)end end,function(a2)if aZ and(a2.UserInputType==Enum.
UserInputType.MouseMovement or a2.UserInputType==Enum.UserInputType.Touch)then
a_=a2 end end if not av.DragStyle or av.DragStyle==1 then aX.InputBegan:Connect(
function(a5)if a5.UserInputType==Enum.UserInputType.MouseButton1 or a5.
UserInputType==Enum.UserInputType.Touch then a3(a5)end end)aX.InputChanged:
Connect(a4)af.InputChanged:Connect(function(a5)if a5==a_ and aZ then a2(a5)end
end)aX.InputEnded:Connect(function(a5)if a5.UserInputType==Enum.UserInputType.
MouseButton1 or a5.UserInputType==Enum.UserInputType.Touch then aZ=false end end
)elseif av.DragStyle==2 then c.InputBegan:Connect(function(a5)if a5.
UserInputType==Enum.UserInputType.MouseButton1 or a5.UserInputType==Enum.
UserInputType.Touch then a3(a5)end end)c.InputChanged:Connect(a4)af.InputChanged
:Connect(function(a5)if a5==a_ and aZ then a2(a5)end end)c.InputEnded:Connect(
function(a5)if a5.UserInputType==Enum.UserInputType.MouseButton1 or a5.
UserInputType==Enum.UserInputType.Touch then aZ=false end end)end local a5=
Instance.new'TextLabel'a5.Name='CurrentTab'a5.FontFace=Font.new(an.interFont)a5.
RichText=true a5.Text=''a5.RichText=true a5.TextColor3=Color3.fromRGB(255,255,
255)a5.TextSize=15 a5.TextTransparency=0.5 a5.TextTruncate=Enum.TextTruncate.
SplitWord a5.TextXAlignment=Enum.TextXAlignment.Left a5.TextYAlignment=Enum.
TextYAlignment.Top a5.AnchorPoint=Vector2.new(0,0.5)a5.AutomaticSize=Enum.
AutomaticSize.Y a5.BackgroundColor3=Color3.fromRGB(255,255,255)a5.
BackgroundTransparency=1 a5.BorderColor3=Color3.fromRGB(0,0,0)a5.BorderSizePixel
=0 a5.Position=UDim2.fromScale(0,0.5)a5.Size=UDim2.fromScale(0.9,0)a5.Parent=aU
aU.Parent=aS aS.Parent=aI aI.Parent=c local a6=Instance.new'Frame'a6.Name=
'GlobalSettings'a6.AutomaticSize=Enum.AutomaticSize.XY a6.BackgroundColor3=
Color3.fromRGB(15,15,15)a6.BorderColor3=Color3.fromRGB(0,0,0)a6.BorderSizePixel=
0 a6.Position=UDim2.fromScale(0.298,0.104)local a7=Instance.new'UIStroke'a7.Name
='GlobalSettingsUIStroke'a7.ApplyStrokeMode=Enum.ApplyStrokeMode.Border a7.Color
=Color3.fromRGB(255,255,255)a7.Transparency=0.9 a7.Parent=a6 local a8=Instance.
new'UICorner'a8.Name='GlobalSettingsUICorner'a8.CornerRadius=UDim.new(0,10)a8.
Parent=a6 local a9=Instance.new'UIPadding'a9.Name='GlobalSettingsUIPadding'a9.
PaddingBottom=UDim.new(0,10)a9.PaddingTop=UDim.new(0,10)a9.Parent=a6 local ba=
Instance.new'UIListLayout'ba.Name='GlobalSettingsUIListLayout'ba.Padding=UDim.
new(0,5)ba.SortOrder=Enum.SortOrder.LayoutOrder ba.Parent=a6 local bb=Instance.
new'UIScale'bb.Name='GlobalSettingsUIScale'bb.Scale=1e-7 bb.Parent=a6 a6.Parent=
c c.Parent=ax function aw:UpdateTitle(bc)I.Text=bc end function aw:
UpdateSubtitle(bc)J.Text=bc end local bc,bd=bb.Scale==1 and true or false local
be=function()if not bc then local be=au(bb,TweenInfo.new(0.2,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),{Scale=1})be:Play()be.Completed:Wait()bc=
true elseif bc then local be=au(bb,TweenInfo.new(0.2,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),{Scale=0})be:Play()be.Completed:Wait()bc=
false end end F.MouseButton1Click:Connect(function()if not ar then return end
be()end)a6.MouseEnter:Connect(function()bd=true end)a6.MouseLeave:Connect(
function()bd=false end)af.InputEnded:Connect(function(bf)if bf.UserInputType==
Enum.UserInputType.MouseButton1 and bc and not bd then be()end end)local bf,bg,
bh,bi,bj=c,ad,workspace.CurrentCamera,'Glass',{}local bk,bl=(bg:GenerateGUID(
true))for bm,bn in pairs(ag:GetChildren())do if not bn:IsA'DepthOfFieldEffect'
and bn:HasTag'.'then bl=Instance.new'DepthOfFieldEffect'bl.FarIntensity=0 bl.
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
RenderStepped:Connect(br)function aw:GlobalSetting(bs)ar=true local bt,bu={},
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
bx.Padding.Offset,waitTime=1}local bA={checkIn=au(by,TweenInfo.new(bz.duration,
bz.easingStyle),{Size=UDim2.new(by.Size.X.Scale,bz.checkSizeIncrease,by.Size.Y.
Scale,by.Size.Y.Offset)}),checkOut=au(by,TweenInfo.new(bz.duration,bz.
easingStyle),{Size=UDim2.new(by.Size.X.Scale,bz.checkSizeDecrease,by.Size.Y.
Scale,by.Size.Y.Offset)}),nameIn=au(bw,TweenInfo.new(bz.duration,bz.easingStyle)
,{TextTransparency=bz.transparencyIn}),nameOut=au(bw,TweenInfo.new(bz.duration,
bz.easingStyle),{TextTransparency=bz.transparencyOut})}local bB,bC=function(bB)
if not bB then bA.checkOut:Play()bA.nameOut:Play()by:GetPropertyChangedSignal
'AbsoluteSize':Connect(function()if by.AbsoluteSize.X<=0 then by.
TextTransparency=1 end end)else bA.checkIn:Play()bA.nameIn:Play()by:
GetPropertyChangedSignal'AbsoluteSize':Connect(function()if by.AbsoluteSize.X>0
then by.TextTransparency=0 end end)end end,bs.Default bB(bC)bu.MouseButton1Click
:Connect(function()bC=not bC bB(bC)task.spawn(function()if bs.Callback then bs.
Callback(bC)end end)end)function bt:UpdateName(bD)bw.Text=bD end function bt:
UpdateState(bD)bB(bD)bC=bD end return bt end function aw:TabGroup()local bs,bt={
},Instance.new'Frame'bt.Name='Section'bt.AutomaticSize=Enum.AutomaticSize.Y bt.
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
EasingStyle.Sine}local b3,b4=function(b3)if b3=='Idle'then au(b0,TweenInfo.new(
0.2,b2.EasingStyle),{TextTransparency=b2.DefaultTransparency}):Play()au(b1,
TweenInfo.new(0.2,b2.EasingStyle),{ImageTransparency=b2.DefaultTransparency}):
Play()elseif b3=='Hover'then au(b0,TweenInfo.new(0.2,b2.EasingStyle),{
TextTransparency=b2.HoverTransparency}):Play()au(b1,TweenInfo.new(0.2,b2.
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
DisabledPosition pcall(function()au(b1,b6.Info,{ImageTransparency=ca[1]}):Play()
end)pcall(function()au(b3,b6.Info,{ImageTransparency=ca[2]}):Play()end)pcall(
function()au(b3,b6.Info,{Position=cb}):Play()end)bZ.State=b8 if b9 then pcall(b9
,b7)end end b8(b7)local b9=function()b7=not b7 b8(b7,bZ.Settings.Callback)end b1
.MouseButton1Click:Connect(b9)function bZ:Toggle()b9()end function bZ:
UpdateState(ca,cb)b7=ca b8(b7,not cb and bZ.Settings.Callback or nil)end
function bZ:GetState()return b7 end function bZ:UpdateName(ca)b0.Text=ca end
function bZ:SetVisibility(ca)b_.Visible=ca end if bY then aa.Options[bY]=bZ end
return bZ end function bR:Slider(bX,bY)local bZ,b_={Settings=bX,IgnoreConfig=
false,Class='Slider'},Instance.new'Frame'b_.Name='Slider'b_.AutomaticSize=Enum.
AutomaticSize.Y b_.BackgroundColor3=Color3.fromRGB(0,0,0)b_.
BackgroundTransparency=1 b_.BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel
=0 b_.Size=UDim2.new(1,0,0,38)b_.Parent=bS local b0=Instance.new'TextLabel'b0.
Name='SliderName'b0.FontFace=Font.new(an.interFont)b0.Text=bZ.Settings.Name b0.
RichText=true b0.TextColor3=Color3.fromRGB(255,255,255)b0.TextSize=13 b0.
TextTransparency=0.5 b0.TextTruncate=Enum.TextTruncate.AtEnd b0.TextXAlignment=
Enum.TextXAlignment.Left b0.TextYAlignment=Enum.TextYAlignment.Top b0.
AnchorPoint=Vector2.new(0,0.5)b0.AutomaticSize=Enum.AutomaticSize.XY b0.
BackgroundColor3=Color3.fromRGB(255,255,255)b0.BackgroundTransparency=1 b0.
BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel=0 b0.Position=UDim2.
fromScale(1.3e-7,0.5)b0.Parent=b_ local b1=Instance.new'Frame'b1.Name=
'SliderElements'b1.AnchorPoint=Vector2.new(1,0)b1.BackgroundColor3=Color3.
fromRGB(255,255,255)b1.BackgroundTransparency=1 b1.BorderColor3=Color3.fromRGB(0
,0,0)b1.BorderSizePixel=0 b1.Position=UDim2.fromScale(1,0)b1.Size=UDim2.
fromScale(1,1)local b2=Instance.new'TextBox'b2.Name='SliderValue'b2.FontFace=
Font.new(an.interFont)b2.TextColor3=Color3.fromRGB(255,255,255)b2.TextSize=12 b2
.TextTransparency=0.1 b2.BackgroundColor3=Color3.fromRGB(255,255,255)b2.
BackgroundTransparency=0.95 b2.BorderColor3=Color3.fromRGB(0,0,0)b2.
BorderSizePixel=0 b2.LayoutOrder=1 b2.Position=UDim2.fromScale(-7.89E-2,0.171)b2
.Size=UDim2.fromOffset(41,21)b2.ClipsDescendants=true local b3=Instance.new
'UICorner'b3.Name='SliderValueUICorner'b3.CornerRadius=UDim.new(0,4)b3.Parent=b2
local b4=Instance.new'UIStroke'b4.Name='SliderValueUIStroke'b4.ApplyStrokeMode=
Enum.ApplyStrokeMode.Border b4.Color=Color3.fromRGB(255,255,255)b4.Transparency=
0.9 b4.Parent=b2 local b5=Instance.new'UIPadding'b5.Name='SliderValueUIPadding'
b5.PaddingLeft=UDim.new(0,2)b5.PaddingRight=UDim.new(0,2)b5.Parent=b2 b2.Parent=
b1 local b6=Instance.new'UIListLayout'b6.Name='SliderElementsUIListLayout'b6.
Padding=UDim.new(0,20)b6.FillDirection=Enum.FillDirection.Horizontal b6.
HorizontalAlignment=Enum.HorizontalAlignment.Right b6.SortOrder=Enum.SortOrder.
LayoutOrder b6.VerticalAlignment=Enum.VerticalAlignment.Center b6.Parent=b1
local b7=Instance.new'ImageLabel'b7.Name='SliderBar'b7.Image=an.sliderbar b7.
ImageColor3=Color3.fromRGB(87,86,86)b7.BackgroundColor3=Color3.fromRGB(255,255,
255)b7.BackgroundTransparency=1 b7.BorderColor3=Color3.fromRGB(0,0,0)b7.
BorderSizePixel=0 b7.Position=UDim2.fromScale(0.219,0.457)b7.Size=UDim2.
fromOffset(123,3)local b8=Instance.new'ImageButton'b8.Name='SliderHead'b8.Image=
an.sliderhead b8.AnchorPoint=Vector2.new(0.5,0.5)b8.BackgroundColor3=Color3.
fromRGB(255,255,255)b8.BackgroundTransparency=1 b8.BorderColor3=Color3.fromRGB(0
,0,0)b8.BorderSizePixel=0 b8.Position=UDim2.fromScale(1,0.5)b8.Size=UDim2.
fromOffset(12,12)b8.Parent=b7 b7.Parent=b1 local b9=Instance.new'UIPadding'b9.
Name='SliderElementsUIPadding'b9.PaddingTop=UDim.new(0,3)b9.Parent=b1 b1.Parent=
b_ local ca,cb=false,{Hundredths=function(ca)return string.format('%.2f',ca)end,
Tenths=function(ca)return string.format('%.1f',ca)end,Round=function(ca,cb)if cb
then return string.format('%.'..cb..'f',ca)else return tostring(math.round(ca))
end end,Degrees=function(ca,cb)local cc=cb and string.format('%.'..cb..'f',ca)or
tostring(ca)return cc..'\u{b0}'end,Percent=function(ca,cb)local cc=(ca-bZ.
Settings.Minimum)/(bZ.Settings.Maximum-bZ.Settings.Minimum)*100 return cb and
string.format('%.'..cb..'f',cc)..'%'or tostring(math.round(cc))..'%'end,Value=
function(ca,cb)return cb and string.format('%.'..cb..'f',ca)or tostring(ca)end}
local cc,cd=cb[bZ.Settings.DisplayMethod]or cb.Value local ce=function(ce,cf)ao(
)local cg if typeof(ce)=='Instance'then local ch=ce cg=math.clamp((ch.Position.X
-b7.AbsolutePosition.X)/b7.AbsoluteSize.X,0,1)else local ch=ce cg=(ch-bZ.
Settings.Minimum)/(bZ.Settings.Maximum-bX.Minimum)end local ch=UDim2.new(cg,0,
0.5,0)pcall(function()b8.Position=ch end)cd=cg*(bZ.Settings.Maximum-bZ.Settings.
Minimum)+bX.Minimum pcall(function()b2.Text=(bX.Prefix or'')..cc(cd,bZ.Settings.
Precision)..(bX.Suffix or'')end)if not cf then task.spawn(function()if bZ.
Settings.Callback then bZ.Settings.Callback(cd)end end)end bZ.Value=cd end ce(bZ
.Settings.Default,true)b8.InputBegan:Connect(function(cf)if cf.UserInputType==
Enum.UserInputType.MouseButton1 or cf.UserInputType==Enum.UserInputType.Touch
then ca=true ce(cf)end end)b8.InputEnded:Connect(function(cf)if cf.UserInputType
==Enum.UserInputType.MouseButton1 or cf.UserInputType==Enum.UserInputType.Touch
then ca=false if bZ.Settings.onInputComplete then bZ.Settings.onInputComplete(cd
)end end end)b2.FocusLost:Connect(function(cf)local cg=b2.Text local ch,ci=cg:
match'^(%-?%d+%.?%d*)(%%?)$'if ch then ch=tonumber(ch)ci=ci=='%'if ci then ch=bZ
.Settings.Minimum+(ch/100)*(bZ.Settings.Maximum-bZ.Settings.Minimum)end local cj
=math.clamp(ch,bZ.Settings.Minimum,bZ.Settings.Maximum)ce(cj)else b2.Text=cc(cd)
end if bZ.Settings.onInputComplete then bZ.Settings.onInputComplete(cd)end end)
af.InputChanged:Connect(function(cf)if ca and(cf.UserInputType==Enum.
UserInputType.MouseMovement or cf.UserInputType==Enum.UserInputType.Touch)then
ce(cf)end end)local cf=function()local cf,cg,ch,ci=b6.Padding.Offset,b2.
AbsoluteSize.X,b0.AbsoluteSize.X,b1.AbsoluteSize.X local cj=(ci-(cf+cg+ch+20))/d
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
.X local cf=(ce-cd-20)/d.Scale b9.MaxSize=Vector2.new(cf,9e9)end cd()b8:
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
~=ck then au(cq.Checkmark,TweenInfo.new(cj.duration,cj.easingStyle),{Size=UDim2.
new(cq.Checkmark.Size.X.Scale,cj.checkSizeDecrease,cq.Checkmark.Size.Y.Scale,cq.
Checkmark.Size.Y.Offset)}):Play()au(cq.NameLabel,TweenInfo.new(cj.duration,cj.
easingStyle),{TextTransparency=cj.transparencyOut}):Play()cq.Checkmark.
TextTransparency=1 end end b_={ck}bZ.Value=b_[1]end au(cn,TweenInfo.new(cj.
duration,cj.easingStyle),{Size=UDim2.new(cn.Size.X.Scale,cj.checkSizeIncrease,cn
.Size.Y.Scale,cn.Size.Y.Offset)}):Play()au(co,TweenInfo.new(cj.duration,cj.
easingStyle),{TextTransparency=cj.transparencyIn}):Play()cn.TextTransparency=0
else if bZ.Settings.Multi then local cp=table.find(b_,ck)if cp then table.
remove(b_,cp)end else b_={}end au(cn,TweenInfo.new(cj.duration,cj.easingStyle),{
Size=UDim2.new(cn.Size.X.Scale,cj.checkSizeDecrease,cn.Size.Y.Scale,cn.Size.Y.
Offset)}):Play()au(co,TweenInfo.new(cj.duration,cj.easingStyle),{
TextTransparency=cj.transparencyOut}):Play()cn.TextTransparency=1 end if bX.
Required and#b_==0 and not cl then return end if#b_>0 then b4.Text=bZ.Settings.
Name..' \u{2022} '..table.concat(b_,', ')else b4.Text=bZ.Settings.Name..'...'end
end,false,false local cn=function()if cm then return end cm=true local cn,co=38,
not cl local cp=co and UDim2.new(1,0,0,cg())or UDim2.new(1,0,0,cn)local cq,cr=
au(b1,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
Size=cp}),au(b7,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out
),{Rotation=co and-90 or 0})cq:Play()cr:Play()if co then b8.Visible=true cq.
Completed:Connect(function()cm=false end)else cq.Completed:Connect(function()b8.
Visible=false cm=false end)end cl=co end b3.MouseButton1Click:Connect(cn)local
co=function(co,cp)local cq=Instance.new'TextButton'cq.Name='Option'cq.FontFace=
Font.new'rbxasset://fonts/families/SourceSansPro.json'cq.Text=''cq.TextColor3=
Color3.fromRGB(0,0,0)cq.TextSize=14 cq.BackgroundColor3=Color3.fromRGB(255,255,
255)cq.BackgroundTransparency=1 cq.BorderColor3=Color3.fromRGB(0,0,0)cq.
BorderSizePixel=0 cq.Size=UDim2.new(1,0,0,30)local cr=Instance.new'UIPadding'cr.
Name='OptionUIPadding'cr.PaddingLeft=UDim.new(0,15)cr.Parent=cq local cs=
Instance.new'TextLabel'cs.Name='OptionName'cs.FontFace=Font.new(an.interFont)cs.
Text=cp cs.RichText=true cs.TextColor3=Color3.fromRGB(255,255,255)cs.TextSize=13
cs.TextTransparency=0.5 cs.TextTruncate=Enum.TextTruncate.AtEnd cs.
TextXAlignment=Enum.TextXAlignment.Left cs.TextYAlignment=Enum.TextYAlignment.
Top cs.AnchorPoint=Vector2.new(0,0.5)cs.AutomaticSize=Enum.AutomaticSize.XY cs.
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
waitTime=1}local cw,cx={checkIn=au(cu,TweenInfo.new(cv.duration,cv.easingStyle),
{Size=UDim2.new(cu.Size.X.Scale,cv.checkSizeIncrease,cu.Size.Y.Scale,cu.Size.Y.
Offset)}),checkOut=au(cu,TweenInfo.new(cv.duration,cv.easingStyle),{Size=UDim2.
new(cu.Size.X.Scale,cv.checkSizeDecrease,cu.Size.Y.Scale,cu.Size.Y.Offset)}),
nameIn=au(cs,TweenInfo.new(cv.duration,cv.easingStyle),{TextTransparency=cv.
transparencyIn}),nameOut=au(cs,TweenInfo.new(cv.duration,cv.easingStyle),{
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
.Parent=dt dt.Parent=b9 b9.Parent=b7 b7.Parent=c local dy,dz,dA,dB,dC,dD,dE,dF,
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
d0.Parent=c d0.Visible=false return d0 end local d1=function(d1)local d2,d3,d4,
d5,d6=d0(),d1 and 0 or 1,d1 and 1 or 0.95,d1 and 1 or 0,TweenInfo.new(0.1,Enum.
EasingStyle.Sine)local d7,d8=au(d2,d6,{GroupTransparency=d3}),au(ca,d6,{Scale=d4
})b7.Visible=true b7.Parent=d2 d2.Visible=true d2.GroupTransparency=d5 d7:Play()
d8:Play()d7.Completed:Wait()if not d1 then b7.Visible=false d2.Visible=false end
b7.Parent=c d2:Destroy()end local d2,d3=function()d1(true)end,function()d1(false
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
pairs(ak)do au(bR,TweenInfo.new(bQ,Enum.EasingStyle.Sine),{
BackgroundTransparency=(bR==bA and 0.98 or 1)}):Play()if bS.tabStroke then au(bS
.tabStroke,TweenInfo.new(bQ,Enum.EasingStyle.Sine),{Transparency=(bR==bA and
0.95 or 1)}):Play()end if bS.switcherImage then au(bS.switcherImage,TweenInfo.
new(bQ,Enum.EasingStyle.Sine),{ImageTransparency=(bR==bA and 0.1 or 0.5)}):Play(
)end if bS.switcherName then au(bS.switcherName,TweenInfo.new(bQ,Enum.
EasingStyle.Sine),{TextTransparency=(bR==bA and 0.1 or 0.5)}):Play()end end ak[
bA].tabContent.Parent=aI as=ak[bA].tabContent a5.Text=by.Name end bA.
MouseButton1Click:Connect(function()bQ()end)function bz:Select()bQ()end function
bz:InsertConfigSection(bR)local bS=bz:Section{Side='Left'}if ai then bS:Label{
Text='Config system unavailable. (Environment isStudio)'}return
'Config system unavailable.'end local bT,bU bS:Input{Name='Config Name',
Placeholder='Name',AcceptedCharacters='All',Callback=function(bV)bT=bV end}local
bV=bS:Dropdown{Name='Select Config',Multi=false,Required=false,Options=aa:
RefreshConfigList(),Callback=function(bV)bU=bV end}bS:Button{Name=
'Create Config',Callback=function()if not bT or string.gsub(bT,' ','')==''then
aw:Notify{Title='Interface',Description='Config name cannot be empty.'}return
end local bW,bX=aa:SaveConfig(bT)if not bW then aw:Notify{Title='Interface',
Description='Unable to save config, return error: '..bX}end aw:Notify{Title=
'Interface',Description=string.format('Created config %q',bT)}bV:ClearOptions()
bV:InsertOptions(aa:RefreshConfigList())end}bS:Button{Name='Load Config',
Callback=function()local bW,bX=aa:LoadConfig(bV.Value)if not bW then aw:Notify{
Title='Interface',Description='Unable to load config, return error: '..bX}return
end aw:Notify{Title='Interface',Description=string.format('Loaded config %q',bV.
Value)}end}bS:Button{Name='Overwrite Config',Callback=function()local bW,bX=aa:
SaveConfig(bV.Value)if not bW then aw:Notify{Title='Interface',Description=
'Unable to overwrite config, return error: '..bX}return end aw:Notify{Title=
'Interface',Description=string.format('Overwrote config %q',bV.Value)}end}bS:
Button{Name='Refresh Config List',Callback=function()bV:ClearOptions()bV:
InsertOptions(aa:RefreshConfigList())end}local bW bS:Button{Name=
'Set as autoload',Callback=function()local bX=bV.Value writefile(aa.Folder..
'/settings/autoload.txt',bX)bW:UpdateName('Autoload config: '..bX)aw:Notify{
Title='Interface',Description=string.format('Set %q as autoload',bX)}end}bW=bS:
Label{Text='Autoload config: None'}if isfile(aa.Folder..'/settings/autoload.txt'
)then local bX=readfile(aa.Folder..'/settings/autoload.txt')bW:UpdateName(
'Autoload config: '..bX)end end ak[bA]={tabContent=bH,tabStroke=bC,switcherImage
=bE,switcherName=bF}return bz end return bs end local bs=function()if
setthreadidentity then pcall(setthreadidentity,7)elseif set_thread_identity then
pcall(set_thread_identity,7)elseif setidentity then pcall(setidentity,7)elseif
syn and syn.set_thread_identity then pcall(syn.set_thread_identity,7)end end
function aw:Notify(bt)bs()local bu={}local bv,bw=pcall(function()local bv=
Instance.new'Frame'bv.Name='Notification'bv.AnchorPoint=Vector2.new(0.5,0.5)bv.
AutomaticSize=Enum.AutomaticSize.Y bv.BackgroundColor3=Color3.fromRGB(15,15,15)
bv.BorderColor3=Color3.fromRGB(0,0,0)bv.BorderSizePixel=0 bv.Position=UDim2.
fromScale(0.5,0.5)bv.Size=UDim2.fromOffset(bt.SizeX or 250,0)bv.Parent=ay local
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
PaddingTop=UDim.new(0,6)bH.Parent=bF bF.Parent=bv local bI,bJ={In=au(by,
TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Scale=
bt.Scale or 1}),Out=au(by,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
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
return bu end function aw:Dialog(bt)local bu,bv={},Instance.new'CanvasGroup'bv.
Name='DialogCanvas'bv.BackgroundColor3=Color3.fromRGB(255,255,255)bv.
BackgroundTransparency=1 bv.BorderColor3=Color3.fromRGB(0,0,0)bv.BorderSizePixel
=0 bv.Size=UDim2.fromScale(1,1)bv.GroupTransparency=1 bv.Parent=c local bw=
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
local bL,bM,bN,bO=au(bv,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{
GroupTransparency=0}),au(bv,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{
GroupTransparency=1}),au(bz,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Scale=1}),
au(bz,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Scale=0.95})local bP,bQ=function
()bL:Play()bN:Play()bL.Completed:Wait()bw.Parent=c end,function()if not bw.
Parent then return end bw.Parent=bv bM:Play()bO:Play()bM.Completed:Wait()bv:
Destroy()end for bR,bS in pairs(bt.Buttons)do local bT=Instance.new'TextButton'
bT.Name='Button'bT.FontFace=Font.new(an.interFont)bT.Text=bS.Name bT.TextColor3=
Color3.fromRGB(255,255,255)bT.TextSize=15 bT.TextTransparency=0.5 bT.
TextTruncate=Enum.TextTruncate.AtEnd bT.AutoButtonColor=false bT.AutomaticSize=
Enum.AutomaticSize.Y bT.BackgroundColor3=Color3.fromRGB(25,25,25)bT.BorderColor3
=Color3.fromRGB(0,0,0)bT.BorderSizePixel=0 bT.Size=UDim2.fromScale(1,0)local bU=
Instance.new'UIPadding'bU.Name='UIPadding'bU.PaddingBottom=UDim.new(0,9)bU.
PaddingLeft=UDim.new(0,10)bU.PaddingRight=UDim.new(0,10)bU.PaddingTop=UDim.new(0
,9)bU.Parent=bT local bV=Instance.new'UICorner'bV.Name='BaseUICorner'bV.
CornerRadius=UDim.new(0,10)bV.Parent=bT bT.Parent=bH local bW={
DefaultTransparency=0,DefaultTransparency2=0.5,HoverTransparency=0.3,
HoverTransparency2=0.6,EasingStyle=Enum.EasingStyle.Sine}local bX=function(bX)if
bX=='Idle'then au(bT,TweenInfo.new(0.2,bW.EasingStyle),{BackgroundTransparency=
bW.DefaultTransparency,TextTransparency=bW.DefaultTransparency2}):Play()elseif
bX=='Hover'then au(bT,TweenInfo.new(0.2,bW.EasingStyle),{BackgroundTransparency=
bW.HoverTransparency,TextTransparency=bW.HoverTransparency2}):Play()end end bT.
MouseButton1Click:Connect(function()if bv.GroupTransparency~=0 then return end
local bY,bZ=pcall(function()if bS.Callback then bS.Callback()end end)bQ()if not
bY then warn('[Dialog] Button callback error: '..tostring(bZ))end end)bT.
MouseEnter:Connect(function()bX'Hover'end)bT.MouseLeave:Connect(function()bX
'Idle'end)end bP()function bu:UpdateTitle(bR)bE.Text=bR end function bu:
UpdateDescription(bR)bG.Text=bR end function bu:Cancel()bQ()end return bu end
function aw:SetNotificationsState(bt)ay.Visible=bt end function aw:
GetNotificationsState(bt)return ay.Visible end function aw:SetState(bt)ap=bt c.
Visible=bt end function aw:GetState()return ap end local bt function aw:Unload()
if bt then bt()end ax:Destroy()am=true end function aw.onUnloaded(bu)bt=bu end
local bu=av.Keybind or Enum.KeyCode.RightControl local bv=function()local bv=not
aw:GetState()aw:SetState(bv)aw:Notify{Title=av.Title,Description=(bv and
'Maximized 'or'Minimized ')..'the menu. Use '..tostring(bu.Name)..
' to toggle it.',Lifetime=5}end af.InputEnded:Connect(function(bw,bx)if bx then
return end if bw.KeyCode==bu then bv()end end)t.MouseButton1Click:Connect(bv)r.
MouseButton1Click:Connect(function()aw:Dialog{Title=av.Title,Description=
[[Are you sure you want to exit the menu? You will lose any unsaved configurations.]]
,Buttons={{Name='Confirm',Callback=function()aw:Unload()end},{Name='Cancel'}}}
end)function aw:SetKeybind(bw)bu=bw end function aw:SetAcrylicBlurState(bw)aq=bw
c.BackgroundTransparency=bw and 0.05 or 0 end function aw:GetAcrylicBlurState()
return aq end local bw,bx=function(bw)if bw then V.Image=(U and T)or
'rbxassetid://0'aB.Text='@'..aj.Name Z.Text=aj.DisplayName else V.Image=an.
userInfoBlurred local bx,by=#aj.Name,#aj.DisplayName aB.Text='@'..string.rep('.'
,bx)Z.Text=string.rep('.',by)end end if av.ShowUserInfo~=nil then bx=av.
ShowUserInfo else bx=true end bw(bx)function aw:SetUserInfoState(by)bw(by)end
function aw:GetUserInfoState(by)return bx end function aw:SetSize(by)c.Size=by
end function aw:GetSize(by)return c.Size end function aw:SetScale(by)d.Scale=by
end function aw:GetScale()return d.Scale end local by,bz={Toggle={Save=function(
by,bz)return{type='Toggle',flag=by,state=bz.State or false}end,Load=function(by,
bz)bs()if aa.Options[by]and bz.state~=nil then aa.Options[by]:UpdateState(bz.
state)end end},Slider={Save=function(by,bz)return{type='Slider',flag=by,value=(
bz.Value and tostring(bz.Value))or false}end,Load=function(by,bz)bs()if aa.
Options[by]and bz.value~=nil and bz.value~=false then aa.Options[by]:
UpdateValue(bz.value)end end},Input={Save=function(by,bz)return{type='Input',
flag=by,text=bz.Text}end,Load=function(by,bz)bs()if aa.Options[by]and bz.text
and type(bz.text)=='string'then aa.Options[by]:UpdateText(bz.text)end end},
Keybind={Save=function(by,bz)return{type='Keybind',flag=by,bind=(typeof(bz.Bind)
=='EnumItem'and bz.Bind.Name)or nil}end,Load=function(by,bz)bs()if aa.Options[by
]and bz.bind then aa.Options[by]:Bind(Enum.KeyCode[bz.bind])end end},Dropdown={
Save=function(by,bz)return{type='Dropdown',flag=by,value=bz.Value}end,Load=
function(by,bz)bs()if aa.Options[by]and bz.value then aa.Options[by]:
UpdateSelection(bz.value)end end},Colorpicker={Save=function(by,bz)local bA=
function(bA)return string.format('#%02X%02X%02X',math.floor(bA.R*255),math.
floor(bA.G*255),math.floor(bA.B*255))end return{type='Colorpicker',flag=by,color
=bA(bz.Color)or nil,alpha=bz.Alpha}end,Load=function(by,bz)bs()local bA=function
(bA)local bB,bC,bD=tonumber(bA:sub(2,3),16)/255,tonumber(bA:sub(4,5),16)/255,
tonumber(bA:sub(6,7),16)/255 return Color3.new(bB,bC,bD)end if aa.Options[by]and
bz.color then aa.Options[by]:SetColor(bA(bz.color))if bz.alpha then aa.Options[
by]:SetAlpha(bz.alpha)end end end}},function()if ai or not(isfolder and
makefolder)then return'Config system unavailable.'end local by={aa.Folder,aa.
Folder..'/settings'}for bz=1,#by do local bA=by[bz]if not isfolder(bA)then
makefolder(bA)end end end function aa:LoadAutoLoadConfig()bs()if ai or not(
isfile and readfile)then return'Config system unavailable.'end local bA,bB=(aa.
Folder..'/settings/autoload.txt')if isfile(bA)then local bC,bD=pcall(readfile,bA
)if bC and type(bD)=='string'then bD=string.gsub(bD,'[\r\n%s]+','')if#bD>0 then
bB=bD end end end if not bB then local bC=aa.Folder..'/settings/Default.json'if
isfile(bC)then bB='Default'if writefile then pcall(writefile,bA,'Default')end
end end if not bB then print(
'[MacLib] Kh\u{f4}ng t\u{ec}m th\u{1ea5}y autoload config n\u{e0}o trong '..bA)
return end print(string.format(
'[MacLib] Kh\u{1edf}i \u{111}\u{1ed9}ng n\u{1ea1}p autoload config: %q',bB))
local bC,bD=aa:LoadConfig(bB)if not bC then pcall(function()aw:Notify{Title=
'Interface',Description='Error loading autoload config: '..tostring(bD)}end)
warn(string.format('[MacLib] L\u{1ed7}i khi n\u{1ea1}p autoload config %q: %s',
bB,tostring(bD)))return end print(string.format(
'[MacLib] N\u{1ea1}p autoload config th\u{e0}nh c\u{f4}ng: %q',bB))pcall(
function()aw:Notify{Title='Interface',Description=string.format(
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
table.insert(bB,bH)end end end end return bB end ax.Enabled=false local bA={}for
bB,bC in pairs(an)do table.insert(bA,bC)end ae:PreloadAsync(bA)ax.Enabled=true
ap=true return aw end function aa:Demo()local av=aa:Window{Title='Maclib Demo',
Subtitle='This is a subtitle.',Size=UDim2.fromOffset(868,650),DragStyle=1,
DisabledWindowControls={},ShowUserInfo=true,Keybind=Enum.KeyCode.RightControl,
AcrylicBlur=true}local aw,ax={UIBlurToggle=av:GlobalSetting{Name='UI Blur',
Default=av:GetAcrylicBlurState(),Callback=function(aw)av:SetAcrylicBlurState(aw)
av:Notify{Title=av.Settings.Title,Description=(aw and'Enabled'or'Disabled')..
' UI Blur',Lifetime=5}end},NotificationToggler=av:GlobalSetting{Name=
'Notifications',Default=av:GetNotificationsState(),Callback=function(aw)av:
SetNotificationsState(aw)av:Notify{Title=av.Settings.Title,Description=(aw and
'Enabled'or'Disabled')..' Notifications',Lifetime=5}end},ShowUserInfo=av:
GlobalSetting{Name='Show User Info',Default=av:GetUserInfoState(),Callback=
function(aw)av:SetUserInfoState(aw)av:Notify{Title=av.Settings.Title,Description
=(aw and'Showing'or'Redacted')..' User Info',Lifetime=5}end}},{TabGroup1=av:
TabGroup()}local ay={Main=ax.TabGroup1:Tab{Name='Demo',Image=
'rbxassetid://18821914323'},Settings=ax.TabGroup1:Tab{Name='Settings',Image=
'rbxassetid://10734950309'}}local az={MainSection1=ay.Main:Section{Side='Left'}}
az.MainSection1:Header{Name='Header #1'}az.MainSection1:Button{Name='Button',
Callback=function()av:Dialog{Title=av.Settings.Title,Description=
[[Lorem ipsum odor amet, consectetuer adipiscing elit. Eros vestibulum aliquet mattis, ex platea nunc.]]
,Buttons={{Name='Confirm',Callback=function()print'Confirmed!'end},{Name=
'Cancel'}}}end}az.MainSection1:Input({Name='Input',Placeholder='Input',
AcceptedCharacters='All',Callback=function(aA)av:Notify{Title=av.Settings.Title,
Description='Successfully set input to '..aA}end,onChanged=function(aA)print(
'Input is now '..aA)end},'Input')az.MainSection1:Slider({Name='Slider',Default=
50,Minimum=0,Maximum=100,DisplayMethod='Percent',Precision=0,Callback=function(
aA)print('Changed to '..aA)end},'Slider')az.MainSection1:Toggle({Name='Toggle',
Default=false,Callback=function(aA)av:Notify{Title=av.Settings.Title,Description
=(aA and'Enabled 'or'Disabled ')..'Toggle'}end},'Toggle')az.MainSection1:
Keybind({Name='Keybind',Blacklist=false,Callback=function(aA)av:Notify{Title=
'Demo Window',Description='Pressed keybind - '..tostring(aA.Name),Lifetime=3}end
,onBinded=function(aA)av:Notify{Title='Demo Window',Description=
'Successfully Binded Keybind to - '..tostring(aA.Name),Lifetime=3}end},'Keybind'
)az.MainSection1:Colorpicker({Name='Colorpicker',Default=Color3.fromRGB(0,255,
255),Callback=function(aA)print('Color: ',aA)end},'Colorpicker')local aA,aB,aC,
aD=az.MainSection1:Colorpicker({Name='Transparency Colorpicker',Default=Color3.
fromRGB(255,0,0),Alpha=0,Callback=function(aA,aB)print('Color: ',aA,' Alpha: ',
aB)end},'TransparencyColorpicker'),0 az.MainSection1:Toggle({Name='Rainbow',
Default=false,Callback=function(aE)aC=aE if aC then aD=game:GetService
'RunService'.RenderStepped:Connect(function(aF)aB=(aB+aF*0.1)%1 aA:SetColor(
Color3.fromHSV(aB,1,1))end)elseif aD then aD:Disconnect()aD=nil end end},
'RainbowToggle')local aE={'Apple','Banana','Orange','Grapes','Pineapple','Mango'
,'Strawberry','Blueberry','Watermelon','Peach'}local aF,aG=az.MainSection1:
Dropdown({Name='Dropdown',Multi=false,Required=true,Options=aE,Default=1,
Callback=function(aF)print('Dropdown changed: '..aF)end},'Dropdown'),az.
MainSection1:Dropdown({Name='Multi Dropdown',Search=true,Multi=true,Required=
false,Options=aE,Default={'Apple','Orange'},Callback=function(aF)local aG={}for
aH,aI in next,aF do table.insert(aG,aH)end print('Mutlidropdown changed:',table.
concat(aG,', '))end},'MultiDropdown')az.MainSection1:Button{Name=
'Update Selection',Callback=function()aF:UpdateSelection'Grapes'aG:
UpdateSelection{'Banana','Pineapple'}end}az.MainSection1:Divider()az.
MainSection1:Header{Text='Header #2'}az.MainSection1:Paragraph{Header=
'Paragraph',Body=
[[Paragraph body. Lorem ipsum odor amet, consectetuer adipiscing elit. Morbi tempus netus aliquet per velit est gravida.]]
}az.MainSection1:Label{Text=
'Label. Lorem ipsum odor amet, consectetuer adipiscing elit.'}az.MainSection1:
SubLabel{Text=
[[Sub-Label. Lorem ipsum odor amet, consectetuer adipiscing elit.]]}aa:SetFolder
'Maclib'ay.Settings:InsertConfigSection'Left'av.onUnloaded(function()print
'Unloaded!'end)ay.Main:Select()aa:LoadAutoLoadConfig()end return aa end function
a.m()local aa,ab={}function aa:SetWindow(ac)ab=ac end function aa.Notify(ac,ad,
ae)ae=ae or 3 if ab then local af=pcall(function()ab:Notify{Title=ac,Description
=ad,Lifetime=ae}end)if af then return end end pcall(function()game:GetService
'StarterGui':SetCore('SendNotification',{Title=ac,Text=ad,Duration=ae})end)end
return aa end function a.n()local aa,ab,ac,ad,ae,af,ag=a.load'l',a.load'm',{},
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
a.o()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'l',a.load'n',a.load'c',{},{Mob={Min
=15,Max=35,BossArea=false,BossAreaRadius=80,DisableDodge=false},Boss1={Min=25,
Max=50,BossArea=false,BossAreaRadius=80,DisableDodge=false},Boss2={Min=25,Max=50
,BossArea=false,BossAreaRadius=80,DisableDodge=false},Boss3={Min=25,Max=50,
BossArea=false,BossAreaRadius=80,DisableDodge=false}},{Normal='Mob',['Boss 1']=
'Boss1',['Boss 2']='Boss2',['Boss 3']='Boss3'},{Mob='Normal',Boss1='Boss 1',
Boss2='Boss 2',Boss3='Boss 3'},{},{}function ad.GetTargetDisplay(aj)return ag[aj
]or'Normal'end function ad.GetTargetKey(aj)return af[aj]or'Mob'end function ad.
GetTargetOptions()return{'Normal','Boss 1','Boss 2','Boss 3'}end function ad.
GetSaveData()return ah end function ad.LoadData(aj)if type(aj)=='table'then ah=
aj else ah={}end aa.contextData=ah for ak,al in ipairs(ai)do pcall(al)end end
function ad.OnDataChanged(aj)if type(aj)~='function'then return function()end
end table.insert(ai,aj)return function()for ak,al in ipairs(ai)do if al==aj then
table.remove(ai,ak)break end end end end local aj=function()aa.contextData=ah ab
.Save()end function ad.GetCombatDistances(ak,al)local am=al or'Mob'local an=ae[
am]or ae.Mob if type(ak)=='string'and#ak>0 and ah[ak]and ah[ak][am]then local ao
=ah[ak][am]local ap,aq=(type(ao.Min)=='number'and ao.Min>0)and ao.Min or an.Min,
(type(ao.Max)=='number'and ao.Max>0)and ao.Max or an.Max return ap,aq end return
an.Min,an.Max end function ad.GetActiveCombatDistances(ak)local al,am,an=ac.
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
SetBossSpawnPosition(aq)end end return ao,ap,aq end function ad.GetDisableDodge(
ak,al)local am=al or'Mob'local an=ae[am]or ae.Mob if type(ak)=='string'and#ak>0
and ah[ak]and ah[ak][am]then local ao=ah[ak][am]if ao.DisableDodge~=nil then
return ao.DisableDodge==true end end return an.DisableDodge or false end
function ad.SetDisableDodge(ak,al,am)if not(type(ak)=='string'and#ak>0)then
return end local an=al or'Mob'ah[ak]=ah[ak]or{}ah[ak][an]=ah[ak][an]or{}ah[ak][
an].DisableDodge=am and true or false aj()end function ad.IsActiveDodgeDisabled(
ak)local al,am,an=ac.GetCurrentDungeonName(),'Mob',false if ac.IsBossActive and
ac.IsBossActive()then an=true am=ac.GetCombatTargetKey()elseif ak then if ak.
Room and type(ak.Room.Name)=='string'and string.find(string.lower(ak.Room.Name),
'boss')then an=true elseif ak.Model then local ao=string.lower(ak.Model.Name)if
string.find(ao,'boss')then an=true else local ap=ak.Model.Parent if ap and
string.find(string.lower(ap.Name),'boss')then an=true end end end if an then
local ao=ac.GetCurrentBossIndex and ac.GetCurrentBossIndex()or 1 am='Boss'..
tostring(math.clamp(ao,1,3))end end return ad.GetDisableDodge(al,am)end function
ad.SetMinCombatDistance(ak,al,am)if not(type(ak)=='string'and#ak>0)then return
end local an=al or'Mob'if type(am)~='number'or am<=0 then return end ah[ak]=ah[
ak]or{}ah[ak][an]=ah[ak][an]or{}local ao=ah[ak][an].Max or(ae[an]or ae.Mob).Max
ah[ak][an].Min=am if am>ao then ah[ak][an].Max=am+5 end aj()end function ad.
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
ab.IsInvulnerable and ab.IsInvulnerable()then am.Clear()return end if ai.
IsActiveDodgeDisabled and ai.IsActiveDodgeDisabled()then am.Clear()return end
local aH,aI,aJ=false if af.IsPlayerInDanger then aH,aI,aJ=af.IsPlayerInDanger()
end local aK=aH or(ay~=nil)or au if not aK then local aL=os.clock()if aL-ax<0.05
then return end ax=aL end local aL,aM=aF(aG),Vector3.new(aG.Position.X,0,aG.
Position.Z)if aH then local aN,aO=ay and(ay-aM).Magnitude or 0,ay and am.
IsPointSafe(ay)if not ay or not aO then local aP,aQ,aR,aS=am.
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
function a.q()local aa,ab,ac,ad,ae,af=a.load'b',a.load'c',a.load'a',a.load'i',a.
load'p',a.load'o'local ag,ah,ai,aj,ak,al,am,an,ao,ap=aa.RunService or game:
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
false,nil,0)end end if ae and ae.Clear then ae.Clear()end return end if af.
IsActiveDodgeDisabled and af.IsActiveDodgeDisabled()then if am or ao then ao=nil
am=false local aE,aF,aG=aq()aA(aF,aG)for aH,aI in ipairs(an)do pcall(aI,false,
nil,0)end end if ae and ae.Clear then ae.Clear()end return end local aE,aF,aG,aH
=ad.IsPlayerInDanger and ad.IsPlayerInDanger(),ae.GetLastSafeSpot()if aF then ao
=aF end local aI=ao and ae.IsPointSafe and ae.IsPointSafe(ao)if ao and aI then
local aJ=aD.Position local aK=Vector3.new(ao.X-aJ.X,0,ao.Z-aJ.Z)local aL=aK.
Magnitude if aL<=al then local aM,aN=aD.CFrame,Vector3.new(ao.X,aJ.Y,ao.Z)local
aO=CFrame.new(aN)*(aM-aM.Position)aB:PivotTo(aO)aA(aC,aD)local aP=ao ao=nil if
am then am=false for aQ,aR in ipairs(an)do pcall(aR,false,aP,aL)end end else if
not am then am=true ar()av()for aM,aN in ipairs(an)do pcall(aN,true,ao,aL)end
end ay(ao)end else if am or ao then ao=nil am=false aA(aC,aD)for aJ,aK in
ipairs(an)do pcall(aK,false,nil,0)end end end end local aC=function()if not ap
then ap=ag.Heartbeat:Connect(aB)end end function aj.Clear()if am or ao then ao=
nil am=false local aD,aE,aF=aq()aA(aE,aF)for aG,aH in ipairs(an)do pcall(aH,
false,nil,0)end end end function aj.Cleanup()if ap then ap:Disconnect()ap=nil
end aj.Clear()end function aj.SetEnabled(aD)ak=aD and true or false if not ak
then local aE,aF,aG=aq()aA(aF,aG)ao=nil am=false end end function aj.IsEnabled()
return ak end function aj.SetSnapDistance(aD)if type(aD)=='number'and aD>=0.5
then al=aD end end function aj.GetSnapDistance()return al end function aj.
IsDodging()return am end function aj.OnDodgeStateChanged(aD)if type(aD)==
'function'then table.insert(an,aD)end end if ab.OnRoomIndexChanged then ab.
OnRoomIndexChanged(function()aj.Clear()end)end if ab.OnEnemyChanged then ab.
OnEnemyChanged(function()if ab.GetEnemyCount and ab.GetEnemyCount()==0 then aj.
Clear()end end)end if ab.OnLobbyChanged then ab.OnLobbyChanged(function()aj.
Clear()end)end if ab.OnBossActiveChanged then ab.OnBossActiveChanged(function()
aj.Clear()end)end aC()ac.Register(function()aj.Cleanup()end)return aj end end
local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.load'a',a.load'h',a.load'd',a.load'e',a.
load'g',a.load'i',a.load'p',a.load'q',a.load'f',{}ac.BindDetection(ab)ad.
BindDetection(ab)ad.BindTrajectory(ae)ae.BindDetection(ab)ai.BindDetection(ab)aj
.IsPointInAnyHazard=ac.IsPointInAnyHazard aj.GetHazardPadding=ac.
GetHazardPadding aj.SetHazardPadding=ac.SetHazardPadding aj.GetHitboxPadding=ac.
GetHazardPadding aj.SetHitboxPadding=ac.SetHazardPadding aj.GetTrajectoryMargin=
ac.GetTrajectoryMargin aj.SetTrajectoryMargin=ac.SetTrajectoryMargin aj.
GetHazardZones=ac.GetHazardZones aj.GetNearbyHazards=ac.GetNearbyHazards aj.
AddForceCircleName=ac.AddForceCircleName aj.GetForceCircleNames=ac.
GetForceCircleNames aj.IsForceCircle=ac.IsForceCircle aj.IsSecondBossCircleChain
=ac.IsSecondBossCircleChain aj.IsPlayerInDanger=af.IsPlayerInDanger aj.
GetPlayerThreat=af.GetCurrentThreat aj.OnPlayerDangerChanged=af.
OnDangerStatusChanged aj.SetPlayerVisualEnabled=af.SetVisualEnabled aj.
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
GetLastHazardInfo aj.OnHazardChanged=ab.OnHazardChanged function aj.StartScan()
ab.StartScan()end function aj.StopScan()ab.StopScan()end function aj.Toggle(ak)
if ak then aj.StartScan()else aj.StopScan()end end function aj.IsEnabled()return
ab.IsEnabled()end aa.Register(function()ab.StopScan()end)return aj