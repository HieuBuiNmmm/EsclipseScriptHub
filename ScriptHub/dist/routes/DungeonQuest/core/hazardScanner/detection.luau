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
,N,O,P,Q,R,S=function()for A=#z,1,-1 do pcall(z[A])end end,{},'unknown',true,{},
{},{},0,4,false local T=function(T)if T then table.insert(G,T)end return T end
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
SetHitboxPadding=aa.SetHazardPadding local ah={'firstBossCrissCross',
'firstBossBigSpike','firstBossSeekingSpikes'}local ai=function(ai)if not ai or
type(ai)~='string'then return false end local aj=ai:lower():gsub('%s+','')if#aj
==0 then return false end for ak,al in ipairs(ah)do local am=al:lower():gsub(
'%s+','')if#am>0 and string.find(aj,am,1,true)then return true end end return
false end function aa.IsForceCircle(aj)return ai(aj)end function aa.
AddForceCircleName(aj)if type(aj)=='string'and#aj>0 then table.insert(ah,aj)aa.
InvalidateCache()end end function aa.GetForceCircleNames()return ah end local aj
,ak,al=function(aj)return aj and aj.Parent and aj.Transparency<=ab end,function(
aj,ak,al)local am,an=aj.Size,al and ad or ac if ak or(aj:IsA'Part'and(aj.Shape==
Enum.PartType.Ball or aj.Shape==Enum.PartType.Cylinder))then return{radius=math.
max(am.X,am.Y,am.Z)/2}end local ao=Vector3.new(math.max(am.X,0)/2+an,0,math.max(
am.Z,0)/2+an)return{half=ao,cframe=aj.CFrame}end,function(aj,ak,al,am)if not ak
then return false end local an,ao=aj.X,aj.Z al=al or 0 local b=(am or ak.
isTrajectory)and ad or ac if ak.radius then local c=(ak.part and ak.part.Parent)
and ak.part.Position local d,e=c and c.X or ak.cx or 0,c and c.Z or ak.cz or 0
local f,g,h=an-d,ao-e,ak.radius+b+al return(f*f+g*g)<=(h*h)end local c=(ak.part
and ak.part.Parent)and ak.part.CFrame or ak.cframe if c then local d,e,f=c:
PointToObjectSpace(aj),ak.half.X,ak.half.Z if al<=0 then return math.abs(d.X)<=e
and math.abs(d.Z)<=f else local g,h=math.max(0,math.abs(d.X)-e),math.max(0,math.
abs(d.Z)-f)return(g*g+h*h)<=(al*al)end end return false end local am=function(am
)if not am or not am.Instance or not am.Instance.Parent then return nil end
local an=am.Instance local ao=am.Name or(an and an.Name)or''local b,c=ai(ao),am.
IsTrajectory==true local d,e=c and ad or ac if an:IsA'BasePart'then if not aj(an
)then return nil end e={an}else e={}for f,g in ipairs(an:GetDescendants())do if#
e>=af then break end if g:IsA'BasePart'and aj(g)and g.Parent then e[#e+1]=g end
end if#e==0 then return nil end end local f,g,h,i,j={},math.huge,-math.huge,math
.huge,-math.huge for k,l in ipairs(e)do local m,n=l.Position,l.Size local o=math
.max(n.X,n.Y,n.Z)/2+d g=math.min(g,m.X-o)h=math.max(h,m.X+o)i=math.min(i,m.Z-o)j
=math.max(j,m.Z+o)local p=ak(l,b,c)if p then if p.radius then p.cx,p.cz=m.X,m.Z
end p.part=l p.isTrajectory=c f[#f+1]=p end end if#f==0 then return nil end
local k,l,m,n=(g+h)/2,(i+j)/2,(h-g)/2,(j-i)/2 return{zones=f,center=Vector3.new(
k,0,l),boundingRadius=math.sqrt(m*m+n*n)}end local an=function(an)local ao=an
and an.HazardZones if not ao then ao=am(an)if ao and an then an.HazardZones=ao
end end return ao end function aa.GetHazardZones(ao)return an(ao)end function aa
.GetNearbyHazards(ao,b)local c=ag if not c then return{}end b=b or 65 local d,e,
f={},ao.X,ao.Z for g,h in pairs(c.GetActiveHazardsMap())do local i,j=h.Instance,
an(h)if j then local k,l=j.center.X,j.center.Z if i and i.Parent then local m=i:
IsA'BasePart'and i or i.PrimaryPart or i:FindFirstChildWhichIsA'BasePart'if m
then k=m.Position.X l=m.Position.Z end end local m,n=e-k,f-l local o,p=m*m+n*n,b
+j.boundingRadius if o<=p*p then table.insert(d,h)end end end return d end
function aa.IsPointInAnyHazard(ao,b,c,d,e)local f=ag if not f then return false,
nil,nil end c=c or 0 local g,h,i,j=math.huge,d or f.GetActiveHazardsMap()for k,l
in pairs(h)do if e and l.IsTrajectory==true then continue end local m=l.Instance
or(typeof(k)=='Instance'and k)if b and(b==m or(m and b.Name==m.Name))then
continue end local n=an(l)if not n then continue end local o,p=n.center.X,n.
center.Z if m and m.Parent then local q=m:IsA'BasePart'and m or m.PrimaryPart or
m:FindFirstChildWhichIsA'BasePart'if q then o=q.Position.X p=q.Position.Z end
end local q,r=ao.X-o,ao.Z-p local s,t=q*q+r*r,n.boundingRadius+c if s>t*t then
continue end local u=l.IsTrajectory==true for v=1,#n.zones do local w=n.zones[v]
if aj(w.part)and al(ao,w,c,u or w.isTrajectory)then local x=(ao-w.part.Position)
.Magnitude if x<g then g=x i=l j=w.part end break end end end return j~=nil,i,j
end function aa.IsPointInAnyRedHazard(ao,b,c,d)return aa.IsPointInAnyHazard(ao,b
,c,d,true)end function aa.GetHazardsAtPoint(ao,b,c,d)local e=ag if not e then
return{}end b=b or 0 local f,g={},c or e.GetActiveHazardsMap()for h,i in pairs(g
)do if d and i.IsTrajectory==true then continue end local j,k=i.Instance or(
typeof(h)=='Instance'and h),an(i)if not k then continue end local l,m=k.center.X
,k.center.Z if j and j.Parent then local n=j:IsA'BasePart'and j or j.PrimaryPart
or j:FindFirstChildWhichIsA'BasePart'if n then l=n.Position.X m=n.Position.Z end
end local n,o=ao.X-l,ao.Z-m local p,q=n*n+o*o,k.boundingRadius+b if p>q*q then
continue end local r=i.IsTrajectory==true for s=1,#k.zones do local t=k.zones[s]
if aj(t.part)and al(ao,t,b,r or t.isTrajectory)then f[i]=true break end end end
return f end function aa.GetRedHazardsAtPoint(ao,b,c)return aa.
GetHazardsAtPoint(ao,b,c,true)end return aa end function a.e()local aa,ab,ac=a.
load'a',a.load'b',a.load'd'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao=aa.
RunService or game:GetService'RunService',aa.player,{},false,{},0.85,Color3.
fromRGB(255,45,45),Color3.fromRGB(0,160,255),0.55,0.25 local b=function()local b
=ae and ae.Character if not b then return nil end local c=b:FindFirstChild
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
function()af.ClearAll()end)return af end function a.f()local aa,ab,ac=a.load'a',
a.load'b',a.load'd'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,b=aa.RunService or
game:GetService'RunService',aa.player,{},false,45,{},0.85,Color3.fromRGB(255,140
,0),0.65,0.2,3.5 local c=function()local c=ae and ae.Character if not c then
return nil end local d=c:FindFirstChild'HumanoidRootPart'or c.PrimaryPart if not
d then return nil end return d.Position.Y-2.5 end function af.BindDetection(d)ao
=d or nil end function af.IsEnabled()return ag end function af.
GetPredictionLength()return ah end function af.SetPredictionLength(d)if type(d)
=='number'and d>0 then ah=math.clamp(d,10,200)af.RefreshAll()end end function af
.IsHazardMoving(d)if not d then return false end local e=ai[d]return e and e.
isMoving==true end local d,e=function(d,e)local f=d.Instance if not f or not f.
Parent then return nil,4 end local g,h,j=ac.GetTrajectoryMargin and ac.
GetTrajectoryMargin()or 2,{},d.Name or(f and f.Name)or''local k=ac.IsForceCircle
and ac.IsForceCircle(j)if f:IsA'BasePart'then if f.Transparency<=aj then table.
insert(h,f)end else for l,m in ipairs(f:GetDescendants())do if m:IsA'BasePart'
and m.Parent and m.Transparency<=aj then table.insert(h,m)end end end if#h==0
then return nil,4 end local l,m,n,o=Vector3.new(-e.Z,0,e.X),math.huge,-math.huge
,0 for p,q in ipairs(h)do local r,s,t=q.Position,q.Size,0 if k or(q:IsA'Part'and
(q.Shape==Enum.PartType.Ball or q.Shape==Enum.PartType.Cylinder))then t=math.
max(s.X,s.Y,s.Z)/2 else local u=q.CFrame local v,w,x,y,z,A=u.RightVector,u.
UpVector,u.LookVector,s.X/2,s.Y/2,s.Z/2 t=y*math.abs(v.X*l.X+v.Z*l.Z)+z*math.
abs(w.X*l.X+w.Z*l.Z)+A*math.abs(x.X*l.X+x.Z*l.Z)end local u=r.X*l.X+r.Z*l.Z m=
math.min(m,u-t)n=math.max(n,u+t)local v=r.X*e.X+r.Z*e.Z o+=v end local p,q,r=
math.max(1,(n-m)+g*2),(m+n)/2,o/#h local s=e*r+l*q return s,p end,function(d,e,f
,g,h,j,k)if not e or not e.Parent or not d or not d.Parent then return end local
l=j/2 local m=Vector3.new(f.X+g.X*l,h or f.Y,f.Z+g.Z*l)local n=m+Vector3.new(g.X
,0,g.Z)local o=CFrame.lookAt(m,n)local p=e.CFrame:ToObjectSpace(o)d.CFrame=p d.
Size=Vector3.new(k,am,j)if not d.Visible then d.Visible=true end end local f=
function()if not ag then return end local f,g,h=false,os.clock(),c()for j,k in
pairs(ai)do local l=j.Instance if not l or not l.Parent then af.
DetachTrajectoryVisuals(j)else f=true local m=k.mainPart if m and m.Parent then
local n,o=m.Position,g-(k.lastClock or g)if o>=0.035 then local p=n-(k.lastPos
or n)local q,r=p.Magnitude/o,Vector3.new(p.X,0,p.Z)local s,t=r.Magnitude/o,k.
isMoving==true if s>=an then k.isMoving=true k.dir=r.Unit else if o>=0.25 and q<
an then k.isMoving=false end end if k.isMoving~=t then j.IsTrajectory=k.isMoving
j.HazardZones=nil if ao and ao.UpdateHazardVisualColor then pcall(ao.
UpdateHazardVisualColor,j,k.isMoving)end local u=a.load'e'if u and u.
UpdateHazardVisualColor then pcall(u.UpdateHazardVisualColor,j,k.isMoving)end
end k.lastPos=n k.lastClock=g end if k.isMoving and k.dir and k.ad then local p,
q=d(j,k.dir)if p then e(k.ad,m,p,k.dir,h,ah,q)end else if k.ad and k.ad.Visible
then k.ad.Visible=false end end end end end if not f and b then b:Disconnect()b=
nil end end local g=function()if not b and ag then b=ad.Heartbeat:Connect(f)end
end function af.DetachTrajectoryVisuals(h)if not h then return end local j=ai[h]
if not j then return end if j.ad then pcall(function()j.ad:Destroy()end)j.ad=nil
end if j.connections then for k,l in ipairs(j.connections)do pcall(function()l:
Disconnect()end)end table.clear(j.connections)end ai[h]=nil end function af.
AttachTrajectoryVisuals(h)if not ag or not h then return end if ai[h]then af.
DetachTrajectoryVisuals(h)end local j=h.Instance if not j or not j.Parent then
return end local k if j:IsA'BasePart'then k=j else k=j.PrimaryPart or j:
FindFirstChildWhichIsA'BasePart'if not k then for l,m in ipairs(j:
GetDescendants())do if m:IsA'BasePart'and m.Parent then k=m break end end end
end if not k or not k.Parent then return end local l=Instance.new
'BoxHandleAdornment'l.Name='HazardTrajectoryCorridor'l.Adornee=k l.Size=Vector3.
new(4,am,ah)l.Color3=ak l.Transparency=al l.ZIndex=1 l.AlwaysOnTop=true l.
Visible=false l.Parent=k local m,n={},k:GetPropertyChangedSignal'Transparency':
Connect(function()if k.Parent and k.Transparency>aj then pcall(function()l:
Destroy()end)end end)table.insert(m,n)ai[h]={ad=l,connections=m,mainPart=k,
lastPos=k.Position,lastClock=os.clock(),velocity=Vector3.zero,dir=nil,isMoving=
false}g()end function af.ClearAll()if b then b:Disconnect()b=nil end for h in
pairs(ai)do af.DetachTrajectoryVisuals(h)end table.clear(ai)end function af.
RefreshAll()af.ClearAll()if not ag or not ao then return end for h,j in pairs(ao
.GetActiveHazardsMap())do af.AttachTrajectoryVisuals(j)end end function af.
GetNearbyTrajectories(h,j)j=j or 65 local k,l,m={},h.X,h.Z for n,o in pairs(ai)
do if o.isMoving and o.dir and o.mainPart and o.mainPart.Parent then local p,q=
d(n,o.dir)if p and q then local r,s=p.X,p.Z local t,u=l-r,m-s local v,w=t*t+u*u,
j+ah+(q/2)if v<=w*w then table.insert(k,{info=n,record=o})end end end end return
k end function af.IsPointInAnyTrajectory(h,j,k)local l,m=h.X,h.Z j=j or 0 if k
then for n,o in ipairs(k)do local p,q=o.info,o.record if q and q.isMoving and q.
dir and q.mainPart and q.mainPart.Parent then local r,s=d(p,q.dir)if r and s
then local t=q.dir local u,v,w=Vector3.new(-t.Z,0,t.X),l-r.X,m-r.Z local x,y,z=v
*t.X+w*t.Z,v*u.X+w*u.Z,s/2 if j<=0 then if x>=0 and x<=ah and math.abs(y)<=z
then return true,p,t,r,s end else local A=0 if x<0 then A=-x elseif x>ah then A=
x-ah end local B=math.max(0,math.abs(y)-z)if(A*A+B*B)<=(j*j)then return true,p,t
,r,s end end end end end return false,nil,nil,nil,nil end for n,o in pairs(ai)do
if o.isMoving and o.dir and o.mainPart and o.mainPart.Parent then local p,q=d(n,
o.dir)if p and q then local r=o.dir local s,t,u=Vector3.new(-r.Z,0,r.X),l-p.X,m-
p.Z local v,w,x=t*r.X+u*r.Z,t*s.X+u*s.Z,q/2 if j<=0 then if v>=0 and v<=ah and
math.abs(w)<=x then return true,n,r,p,q end else local y=0 if v<0 then y=-v
elseif v>ah then y=v-ah end local z=math.max(0,math.abs(w)-x)if(y*y+z*z)<=(j*j)
then return true,n,r,p,q end end end end end return false,nil,nil,nil,nil end
function af.SetEnabled(h)ag=h and true or false if ag then af.RefreshAll()else
af.ClearAll()end end ac.OnPaddingChanged(function()if ag then af.RefreshAll()end
end)ab.Register(function()af.ClearAll()end)return af end function a.g()local aa,
ab,ac=a.load'a',a.load'b',a.load'd'local ad,ae,af,ag,ah,ai,aj,ak,al,am=aa.
RunService or game:GetService'RunService',aa.player,{},true,{},0.85,Color3.
fromRGB(255,60,60),'255,130,130'function af.BindDetection(an)al=an or nil end
function af.IsEnabled()return ag end local an=function()local an=ae and ae.
Character if not an then return nil end local ao=an:FindFirstChild
'HumanoidRootPart'or an.PrimaryPart if not ao then return nil end return ao.
Position.Y-2.5 end local ao,b=function(ao)if not ao or not ao.Parent then return
2.5 end local b=an()if b then local c=b+2.5 local d,e=c-ao.Position.Y,ao.Size.Y/
2+1.2 return math.clamp(math.max(d,e),1.5,30)end return math.clamp(ao.Size.Y/2+
1.8,2,10)end,function(ao)return ao and ao.Parent and ao.Transparency<=ai end
local c,d=function(c)if not c or not c.Parent then return nil end if c:IsA
'BasePart'then if b(c)then return c end elseif c:IsA'Model'then if c.PrimaryPart
and b(c.PrimaryPart)then return c.PrimaryPart end local d=c:FindFirstChild
'HumanoidRootPart'if d and b(d)then return d end for e,f in ipairs(c:
GetDescendants())do if f:IsA'BasePart'and b(f)then return f end end else for d,e
in ipairs(c:GetDescendants())do if e:IsA'BasePart'and b(e)then return e end end
end return nil end,function(c,d)if not c or not c.items or not d then return end
local e=d.SpawnClock or os.clock()local f,g=math.max(0,os.clock()-e),d.Name or
'Red Zone'local h=(
[[<font color='rgb(%s)'>%s</font> <font color='rgb(255,255,255)'><b>%.1fs</b></font>]]
):format(ak,g,f)for j,k in ipairs(c.items)do if k.label and k.label.Parent then
k.label.Text=h end end end local e=function()if not ag then return end local e=
false for f,g in pairs(ah)do local h=f.Instance if f.IsTrajectory==true or not h
or not h.Parent then af.DetachTimerVisual(f)else if g.items then for j=#g.items,
1,-1 do local k=g.items[j]local l=k.part if not b(l)then if k.billboard and k.
billboard.Parent then pcall(function()k.billboard:Destroy()end)end table.remove(
g.items,j)else if k.billboard and k.billboard.Parent then k.billboard.
StudsOffset=Vector3.new(0,ao(l),0)end end end if#g.items==0 then af.
DetachTimerVisual(f)else e=true d(g,f)end else af.DetachTimerVisual(f)end end
end if not e and am then am:Disconnect()am=nil end end local f,g=function()if
not am and ag then am=ad.Heartbeat:Connect(e)end end,function(f)local g,h=ao(f),
Instance.new'BillboardGui'h.Name='HazardLifespanTimer'h.Adornee=f h.AlwaysOnTop=
true h.MaxDistance=500 h.LightInfluence=0 h.ResetOnSpawn=false h.Active=false h.
Size=UDim2.new(0,130,0,24)h.StudsOffset=Vector3.new(0,g,0)h.ZIndexBehavior=Enum.
ZIndexBehavior.Sibling local j=Instance.new'Frame'j.Name='TimerFrame'j.Size=
UDim2.new(1,0,1,0)j.BackgroundColor3=Color3.fromRGB(15,15,20)j.
BackgroundTransparency=0.25 j.BorderSizePixel=0 j.Parent=h local k=Instance.new
'UICorner'k.CornerRadius=UDim.new(0,6)k.Parent=j local l=Instance.new'UIStroke'l
.Name='Stroke'l.Thickness=1.3 l.Color=aj l.Transparency=0.15 l.Parent=j local m=
Instance.new'TextLabel'm.Name='TimerLabel'm.Size=UDim2.new(1,-6,1,0)m.Position=
UDim2.new(0,3,0,0)m.BackgroundTransparency=1 m.Font=Enum.Font.GothamBold m.
TextSize=11 m.TextColor3=Color3.fromRGB(255,255,255)m.TextStrokeTransparency=0 m
.TextStrokeColor3=Color3.fromRGB(0,0,0)m.RichText=true m.TextXAlignment=Enum.
TextXAlignment.Center m.TextYAlignment=Enum.TextYAlignment.Center m.Text=''m.
Parent=j h.Parent=f return h,m,l end function af.AttachTimerVisual(h)if not ag
or not h then return end if h.IsTrajectory==true then if ah[h]then af.
DetachTimerVisual(h)end return end if ah[h]then af.DetachTimerVisual(h)end local
j=h.Instance if not j or not j.Parent then return end local k=ac.GetHazardZones(
h)local l,m,n=k and k.zones,{},{}local o=function(o,p,q,r,s)local t={billboard=p
,label=q,stroke=r,part=o,zone=s}table.insert(m,t)local u=o:
GetPropertyChangedSignal'Transparency':Connect(function()if not b(o)then pcall(
function()p:Destroy()end)end end)table.insert(n,u)local v=o.AncestryChanged:
Connect(function(v,w)if not w then pcall(function()p:Destroy()end)end end)table.
insert(n,v)end if l and#l>0 then for p,q in ipairs(l)do local r=q.part if b(r)
then local s,t,u=g(r)o(r,s,t,u,q)end end else local p=c(j)if b(p)then local q,r,
s=g(p)o(p,q,r,s,nil)end end if#m>0 then local p={items=m,connections=n}ah[h]=p
d(p,h)f()end end function af.DetachTimerVisual(h)if not h then return end local
j=ah[h]if not j then return end if j.connections then for k,l in ipairs(j.
connections)do pcall(function()l:Disconnect()end)end table.clear(j.connections)
end if j.items then for k,l in ipairs(j.items)do if l.billboard and l.billboard.
Parent then pcall(function()l.billboard:Destroy()end)end end table.clear(j.items
)end ah[h]=nil end function af.UpdateHazardVisualColor(h,j)if not h then return
end local k=j==true or h.IsTrajectory==true if k then af.DetachTimerVisual(h)
else if not ah[h]then af.AttachTimerVisual(h)end end end function af.ClearAll()
if am then am:Disconnect()am=nil end for h in pairs(ah)do af.DetachTimerVisual(h
)end table.clear(ah)end function af.RefreshAll()af.ClearAll()if not ag or not al
then return end for h,j in pairs(al.GetActiveHazardsMap())do if j and j.
IsTrajectory~=true then af.AttachTimerVisual(j)end end end function af.
SetEnabled(h)ag=h and true or false if ag then af.RefreshAll()else af.ClearAll()
end end ab.Register(function()af.ClearAll()end)return af end end local aa,ab,ac,
ad,ae,af,ag,ah,ai,aj=a.load'a',a.load'c',a.load'b',a.load'd',a.load'e',a.load'f'
,a.load'g',game:GetService'Players',game:GetService'Workspace',game:GetService
'ReplicatedStorage'local ak,al,am,an,ao,b,c,d,e,f,g,h,j,k,l,m,n,o=aa.player,{},
false,false,true,false,false,'',false,{},0,{},{},{'abilities','projectiles'},
false,{}local p,q,r,s,t,u,v,w=function()if l then return end l=true for p,q in
ipairs(k)do local r=aj:FindFirstChild(q)if r then for s,t in ipairs(r:
GetChildren())do local u=(t.Name or''):lower():gsub('%s+','')if#u>0 then m[u]=
true end end end end end,function(p)if not p then return true end local q=p.Name
if typeof(q)=='string'then local r=q:lower()if r:sub(1,3)=='tm_'or r:sub(1,3)==
'pr_'or r:sub(1,3)=='dq_'or r:find'pathrecord'or r:find'safespot'or r:find
'hazard'or r:find'adornment'or r:find'debug'or r:find'targetpart'or r:find
'actualmarker'then return true end local s=p.Parent while s and s~=workspace and
s~=game do local t=s.Name if typeof(t)=='string'then local u=t:lower()if u:find
'pathrecord'or u:sub(1,3)=='tm_'or u:sub(1,3)=='pr_'then return true end end s=s
.Parent end local t=r:gsub('%s+','')if#t>0 and m[t]==true then return true end
end return false end,function(p)if not p then return false end if ah:
GetPlayerFromCharacter(p)then return true end if ah:FindFirstChild(p.Name)then
return true end for q,r in ipairs(ah:GetPlayers())do if p.Name==r.Name then
return true end local s=r.Character if s and(p==s or p:IsDescendantOf(s))then
return true end end local q=ak and ak.Character if q and(p==q or p:
IsDescendantOf(q))then return true end return false end,function()local p=0 for
q in pairs(f)do p+=1 end g=p for q=#h,1,-1 do pcall(h[q],p,n)end end,0.85,50,
0.05,{}local x,y,z,A,B,C,D,E=function(x)local y=w[x]if y then y.active=false w[x
]=nil end end,function()for x,y in pairs(w)do if y then y.active=false end end
table.clear(w)end,function(x)if not x then return{}end local y={}local z=
function(z)if z and z.Parent and z.Transparency<=t then y[#y+1]=z end end if x:
IsA'BasePart'then z(x)else for A,B in ipairs(x:GetDescendants())do if B:IsA
'BasePart'and B.Parent then z(B)end end end return y end,function(x)local y=ak
and ak.Character if not y then return 0 end local z=y:FindFirstChild
'HumanoidRootPart'or y.PrimaryPart if not z then return 0 end local A,B=(z.
Position)if x:IsA'BasePart'then B=x.Position elseif x:IsA'Model'then local C,D=
pcall(function()return x:GetPivot().Position end)if C then B=D else local E=x:
FindFirstChildWhichIsA'BasePart'B=E and E.Position end end if not B then return
0 end return math.floor((A-B).Magnitude+0.5)end,Color3.fromRGB(255,45,45),Color3
.fromRGB(255,30,30),Color3.fromRGB(0,170,255),Color3.fromRGB(0,140,255)local F=
function(F,G,H)local I,J,K={},H and D or B,H and E or C for L,M in ipairs(F)do
if M and M.Parent then local N=Instance.new'SelectionBox'N.Name=
'HazardSelectionBox'N.Color3=J N.SurfaceColor3=K N.SurfaceTransparency=0.6 N.
LineThickness=0.05 N.Adornee=M N.Parent=M local O=M:GetPropertyChangedSignal
'Transparency':Connect(function()if M.Parent and M.Transparency>t then pcall(
function()N:Destroy()end)end end)if G then table.insert(G,O)end I[#I+1]=N end
end return I end function al.UpdateHazardVisualColor(G,H)if not G or not G.Boxes
then return end local I=H==true or G.IsTrajectory==true local J,K=I and D or B,I
and E or C for L,M in ipairs(G.Boxes)do if M and M.Parent then M.Color3=J M.
SurfaceColor3=K end end ag.UpdateHazardVisualColor(G,I)end local G,H=function(G)
if not e or d==''then return false end if not G or type(G)~='string'then return
false end local H=d:lower():gsub('%s+','')if#H==0 then return false end local I=
G:lower():gsub('%s+','')return string.find(I,H,1,true)~=nil end,function(G)if
not G then return'nil'end return('(%.2f, %.2f, %.2f)'):format(G.X,G.Y,G.Z)end
local ap=function(I,J,K,L)if not I then return end local M=I.Name if not G(M)
then return end local N,O,P=I.ClassName,I.Parent and I.Parent:GetFullName()or
'nil',A(I)print
'================== \u{1f50d} [HAZARD DEEP INSPECT] \u{1f50d} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(M,N))print((
'  \u{1f4cc} Event Type     : %s%s'):format(J,K and(' -> '..tostring(K))or''))
print(('  \u{1f4cd} Full Path      : %s'):format(O))print((
'  \u{1f4cf} Dist to Player : %d studs'):format(P))if J=='SPAWN'then local Q={}
if I:IsA'BasePart'then table.insert(Q,I)else for R,S in ipairs(I:GetDescendants(
))do if S:IsA'BasePart'then table.insert(Q,S)end end end print((
'  \u{1f9e9} Total Parts (%d) :'):format(#Q))for R,S in ipairs(Q)do local T=S:
IsA'Part'and tostring(S.Shape.Name)or(S.ClassName=='MeshPart'and'MeshPart'or S.
ClassName)print(('     [%d] %q (%s)'):format(R,S.Name,S.ClassName))print((
'         \u{2022} Size: %s | Shape: %s | Trans: %.2f | CanCollide: %s'):format(
H(S.Size),T,S.Transparency,tostring(S.CanCollide)))print((
'         \u{2022} Pos : %s'):format(H(S.Position)))end local R=ad.
GetHazardZones(L)if R and R.zones then local S=ad.GetHitboxPadding()print((
'  \u{1f4d0} Math Geometry (Zones: %d, BoundingRadius: %.1f studs):'):format(#R.
zones,R.boundingRadius or 0))for T,U in ipairs(R.zones)do if U.radius then
print((
[[     - Zone [%d]: Circle/Ball (Base Radius: %.2f + Pad: %.2f = %.2f studs)]]):
format(T,U.radius,S,U.radius+S))elseif U.half then print((
'     - Zone [%d]: Box/OBB (HalfSize: %s)'):format(T,H(U.half)))end end end task
.spawn(function()local S if I:IsA'BasePart'then S=I elseif I:IsA'Model'then S=I.
PrimaryPart or I:FindFirstChildWhichIsA'BasePart'end if not S then return end
local T,U=os.clock(),S.CFrame task.wait(0.12)if not I.Parent or not S.Parent
then return end local V,W=os.clock(),S.CFrame local X=V-T if X<=0 then return
end local Y=W*U:Inverse()local Z,_=Y:ToAxisAngle()local ap,aq=math.deg(_)/X,U:
Inverse()*W local ar,as=aq:ToAxisAngle()if math.abs(math.deg(_))>=1.5 then local
at='Tr\u{1ee5}c t\u{1ef1} do / H\u{1ed7}n h\u{1ee3}p'if math.abs(Z.Y)>=0.8 then
at='Tr\u{1ee5}c Y (Yaw - Qu\u{e9}t ngang m\u{1eb7}t s\u{e0}n)'elseif math.abs(Z.
X)>=0.8 then at='Tr\u{1ee5}c X (Pitch - L\u{103}n nh\u{e0}o l\u{1ed9}n)'elseif
math.abs(Z.Z)>=0.8 then at=
'Tr\u{1ee5}c Z (Roll - Nghi\u{ea}ng l\u{1ead}t b\u{ea}n)'end local au=
'Tr\u{1ee5}c t\u{1ef1} do'if math.abs(ar.Y)>=0.8 then au='Tr\u{1ee5}c Local Y'
elseif math.abs(ar.X)>=0.8 then au='Tr\u{1ee5}c Local X'elseif math.abs(ar.Z)>=
0.8 then au='Tr\u{1ee5}c Local Z'end print
'================== \u{1f504} [INSPECT: SPINNING DETECTED] \u{1f504} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(I.Name,S.Name))print((
'  \u{26a1} T\u{1ed1}c \u{111}\u{1ed9} xoay    : %.2f \u{b0}/s (%.2f rad/s)'):
format(ap,_/X))print(('  \u{1f310} World Spin Axis: %s -> %s'):format(H(Z),at))
print(('  \u{1f9e9} Local Spin Axis: %s -> %s'):format(H(ar),au))print
[[========================================================================]]end
end)elseif J=='DESPAWN'then if L and L.SpawnClock then local ap=os.clock()-L.
SpawnClock print(('  \u{23f1}\u{fe0f} Lifetime Active: %.2f seconds'):format(ap)
)end elseif J=='REJECTED'then print(('  \u{26a0}\u{fe0f} Rejection Reason: %s'):
format(tostring(K)))end print
[[================================================================]]end local aq
,ar=function(aq,ar)ap(aq,'REJECTED',ar,nil)if not c then return end local as,at=
aq and aq.Name or'?',aq and aq.ClassName or'?'print((
'[HazardScanner][Reject] \u{26aa} %s (%s) \u{2014} %s'):format(as,at,ar))end
local as=function(as)if not as or not as.Parent then return end if r(as)then
return end if f[as]then return end if w[as]then return end local at={active=true
,count=0}w[as]=at task.spawn(function()while at.active and as.Parent and am and
an do if r(as)then x(as)return end at.count+=1 local au,I,J=as:GetDescendants(),
z(as),G(as.Name)if c or J then print((
'[HazardScanner][Retry] \u{1f504} L\u{1ea7}n %d/%d: %q (%s) | Descendants: %d | Valid Parts (Trans<=%.2f): %d'
):format(at.count,u,as.Name,as.ClassName,#au,t,#I))end if#I>0 then if c or J
then print((
'[HazardScanner][Retry] \u{2705} L\u{1ea7}n %d/%d: %q \u{110}\u{e3} t\u{ec}m th\u{1ea5}y %d part(s)! Ti\u{1ebf}n h\u{e0}nh v\u{1ebd}...'
):format(at.count,u,as.Name,#I))end x(as)ar(as)return end if at.count>=u then
aq(as,(
'H\u{1ebf}t %d l\u{1b0}\u{1ee3}t retry m\u{e0} kh\u{f4}ng t\u{ec}m th\u{1ea5}y BasePart h\u{1ee3}p l\u{1ec7} (Descendants: %d)'
):format(u,#au))x(as)return end task.wait(v)end x(as)end)end ar=function(at)if
not am or not an then aq(at,'Ch\u{1b0}a trong dungeon')return false end if not
at or not at.Parent then aq(at,'Kh\u{f4}ng c\u{f2}n Parent')return false end if
r(at)then aq(at,
'Nh\u{e2}n v\u{1ead}t ng\u{1b0}\u{1edd}i ch\u{1a1}i (Player/Teammate)')return
false end if f[at]then return true end p()if q(at)then aq(at,
'Tr\u{f9}ng t\u{ea}n trong ReplicatedStorage (abilities/projectiles)')return
false end local au=z(at)if#au==0 then aq(at,
'Ch\u{1b0}a c\u{f3} part \u{111}\u{1ec3} v\u{1ebd} (s\u{1ebd} retry)')as(at)
return false end local I,J={},{}if ao then J=F(au,I)end local K=A(at)local L={
Instance=at,Name=at.Name,Class=at.ClassName,Distance=K,Boxes=J,Connections=I,
SpawnClock=os.clock()}f[at]=L n={Name=at.Name,Class=at.ClassName,Distance=K}if
ae.IsEnabled()then ae.AttachZoneVisuals(L)end if af.IsEnabled()then af.
AttachTrajectoryVisuals(L)end if ag.IsEnabled()then ag.AttachTimerVisual(L)end
x(at)ap(at,'SPAWN','Passed all gates',L)if b then print((
'[HazardScanner][Hazard] \u{1f534} Hazard Detected: %s (%s, %d studs)'):format(
at.Name,at.ClassName,K))end s()return true end local at=function(at,au)local I=f
[at]if not I then x(at)return end ap(at,'DESPAWN',au,I)ae.DetachZoneVisuals(I)af
.DetachTrajectoryVisuals(I)ag.DetachTimerVisual(I)if I.Boxes then for J,K in
ipairs(I.Boxes)do pcall(function()K:Destroy()end)end table.clear(I.Boxes)end if
I.Connections then for J,K in ipairs(I.Connections)do pcall(function()K:
Disconnect()end)end table.clear(I.Connections)end f[at]=nil if b then local J=au
and(' ('..au..')')or''print((
'[HazardScanner][Hazard] \u{1f7e2} Hazard Expired: %s%s'):format(tostring(I.Name
),J))end s()end function al.ClearAllHazards(au)ae.ClearAll()af.ClearAll()ag.
ClearAll()y()local I={}for J in pairs(f)do table.insert(I,J)end for J,K in
ipairs(I)do at(K,au)end if b and au then print((
'[HazardScanner][Hazard] \u{1f9f9} All hazards cleared: %s'):format(au))end end
function al.StartScan()if am then return end am=true ae.BindDetection(al)af.
BindDetection(al)ag.BindDetection(al)al.ClearAllHazards'StartScan Reset'for au,I
in ipairs(j)do I:Disconnect()end table.clear(j)table.insert(j,ai.ChildAdded:
Connect(function(au)if r(au)then return end ar(au)end))table.insert(j,ai.
ChildRemoved:Connect(function(au)at(au,'Destroyed')end))an=ab.
GetCurrentRoomIndex()>0 if o then pcall(o)o=nil end o=ab.OnRoomIndexChanged(
function(au)if au>0 then an=true elseif au<=0 and an then an=false al.
ClearAllHazards'Dungeon Ended'end end)if b then print
'[HazardScanner] \u{1f4e1} Threat Detector started!'end end function al.StopScan
()am=false an=false for au,I in ipairs(j)do I:Disconnect()end table.clear(j)if o
then pcall(o)o=nil end al.ClearAllHazards'StopScan'if b then print
'[HazardScanner] \u{1f6d1} Threat Detector stopped.'end end function al.
IsEnabled()return am end function al.SetEnabled(au)if au then al.StartScan()else
al.StopScan()end end function al.SetSelectionBoxesEnabled(au)ao=au and true or
false if ao then for I,J in pairs(f)do if I and I.Parent and(not J.Boxes or#J.
Boxes==0)then local K=z(I)J.Connections=J.Connections or{}J.Boxes=F(K,J.
Connections)end end else for I,J in pairs(f)do if J.Boxes then for K,L in
ipairs(J.Boxes)do pcall(function()L:Destroy()end)end table.clear(J.Boxes)end end
end end function al.IsSelectionBoxesEnabled()return ao end function al.
SetLogHazards(au)b=au and true or false end function al.IsLogHazardsEnabled()
return b end function al.SetLogFailed(au)c=au and true or false end function al.
IsLogFailedEnabled()return c end function al.SetInspectTarget(au)d=type(au)==
'string'and au or''end function al.GetInspectTarget()return d end function al.
SetInspectEnabled(au)e=au and true or false end function al.IsInspectEnabled()
return e end function al.GetHazardCount()return g end function al.
GetActiveHazards()local au={}for I,J in pairs(f)do if I and I.Parent==ai then au
[#au+1]=J end end return au end function al.GetActiveHazardsMap()return f end
function al.GetLastHazardInfo()return n end function al.OnHazardChanged(au)if
type(au)~='function'then return end table.insert(h,au)end ac.Register(function()
al.StopScan()al.ClearAllHazards'Shutdown'end)return al