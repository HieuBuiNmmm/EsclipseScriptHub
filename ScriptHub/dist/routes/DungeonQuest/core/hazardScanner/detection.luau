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
'firstBossBigSpike','firstBossSeekingSpikes','secondBossCircleHitbox',
'secondBossCircleHit'}local ai=function(ai)if not ai or type(ai)~='string'then
return false end local aj=ai:lower():gsub('%s+','')if#aj==0 then return false
end for ak,al in ipairs(ah)do local am=al:lower():gsub('%s+','')if#am>0 and
string.find(aj,am,1,true)then return true end end return false end function aa.
IsForceCircle(aj)return ai(aj)end function aa.AddForceCircleName(aj)if type(aj)
=='string'and#aj>0 then table.insert(ah,aj)aa.InvalidateCache()end end function
aa.GetForceCircleNames()return ah end local aj,ak,al=function(aj)return aj and
aj.Parent and aj.Transparency<=ab end,function(aj,ak,al)local am,an=aj.Size,al
and ad or ac if ak or(aj:IsA'Part'and(aj.Shape==Enum.PartType.Ball or aj.Shape==
Enum.PartType.Cylinder))then return{radius=math.max(am.X,am.Y,am.Z)/2}end local
ao=Vector3.new(math.max(am.X,0)/2+an,0,math.max(am.Z,0)/2+an)return{half=ao,
cframe=aj.CFrame}end,function(aj,ak,al,am)if not ak then return false end local
an,ao=aj.X,aj.Z al=al or 0 local b=(am or ak.isTrajectory)and ad or ac if ak.
radius then local c=(ak.part and ak.part.Parent)and ak.part.Position local d,e=c
and c.X or ak.cx or 0,c and c.Z or ak.cz or 0 local f,g,h=an-d,ao-e,ak.radius+b+
al return(f*f+g*g)<=(h*h)end local c=(ak.part and ak.part.Parent)and ak.part.
CFrame or ak.cframe if c then local d,e,f=c:PointToObjectSpace(aj),ak.half.X,ak.
half.Z if al<=0 then return math.abs(d.X)<=e and math.abs(d.Z)<=f else local g,h
=math.max(0,math.abs(d.X)-e),math.max(0,math.abs(d.Z)-f)return(g*g+h*h)<=(al*al)
end end return false end local am=function(am)if not am or not am.Instance or
not am.Instance.Parent then return nil end local an=am.Instance local ao=am.Name
or(an and an.Name)or''local b,c=ai(ao),am.IsTrajectory==true local d,e=c and ad
or ac if an:IsA'BasePart'then if not aj(an)then return nil end e={an}else e={}
for f,g in ipairs(an:GetDescendants())do if#e>=af then break end if g:IsA
'BasePart'and aj(g)and g.Parent then e[#e+1]=g end end if#e==0 then return nil
end end local f,g,h,i,j={},math.huge,-math.huge,math.huge,-math.huge for k,l in
ipairs(e)do local m,n=l.Position,l.Size local o=math.max(n.X,n.Y,n.Z)/2+d g=math
.min(g,m.X-o)h=math.max(h,m.X+o)i=math.min(i,m.Z-o)j=math.max(j,m.Z+o)local p=
ak(l,b,c)if p then if p.radius then p.cx,p.cz=m.X,m.Z end p.part=l p.
isTrajectory=c f[#f+1]=p end end if#f==0 then return nil end local k,l,m,n=(g+h)
/2,(i+j)/2,(h-g)/2,(j-i)/2 return{zones=f,center=Vector3.new(k,0,l),
boundingRadius=math.sqrt(m*m+n*n)}end local an=function(an)local ao=an and an.
HazardZones if not ao then ao=am(an)if ao and an then an.HazardZones=ao end end
return ao end function aa.GetHazardZones(ao)return an(ao)end function aa.
GetNearbyHazards(ao,b)local c=ag if not c then return{}end b=b or 65 local d,e,f
={},ao.X,ao.Z for g,h in pairs(c.GetActiveHazardsMap())do local i,j=h.Instance,
an(h)if j then local k,l=j.center.X,j.center.Z if i and i.Parent then local m=i:
IsA'BasePart'and i or i.PrimaryPart or i:FindFirstChildWhichIsA'BasePart'if m
then k=m.Position.X l=m.Position.Z end end local m,n=e-k,f-l local o,p=m*m+n*n,b
+j.boundingRadius if o<=p*p then table.insert(d,h)end end end return d end
function aa.IsPointInAnyHazard(ao,b,c,d)local e=ag if not e then return false,
nil,nil end c=c or 0 local f,g,h,i=math.huge,d or e.GetActiveHazardsMap()for j,k
in pairs(g)do local l=k.Instance or(typeof(j)=='Instance'and j)if b and(b==l or(
l and b.Name==l.Name))then continue end local m=an(k)if not m then continue end
local n,o=m.center.X,m.center.Z if l and l.Parent then local p=l:IsA'BasePart'
and l or l.PrimaryPart or l:FindFirstChildWhichIsA'BasePart'if p then n=p.
Position.X o=p.Position.Z end end local p,q=ao.X-n,ao.Z-o local r,s=p*p+q*q,m.
boundingRadius+c if r>s*s then continue end local t=k.IsTrajectory==true for u=1
,#m.zones do local v=m.zones[u]if aj(v.part)and al(ao,v,c,t or v.isTrajectory)
then local w=(ao-v.part.Position).Magnitude if w<f then f=w h=k i=v.part end
break end end end return i~=nil,h,i end return aa end function a.e()local aa,ab,
ac=a.load'a',a.load'b',a.load'd'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao=aa.
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
a.load'b',a.load'd'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,b,c,d,e=aa.
RunService or game:GetService'RunService',game:GetService'ReplicatedStorage',aa.
player,{},true,{},0.85,Color3.fromRGB(255,60,60),Color3.fromRGB(0,180,255),
Color3.fromRGB(255,140,0),'enemyProjectiles',false,{},{secondbosscirclehitbox=
true,secondbosscirclehit=true}local f=function()if ao then return end ao=true
local f=ae:FindFirstChild(an)if f then for g,h in ipairs(f:GetChildren())do
local j=(h.Name or''):lower():gsub('%s+','')if#j>0 then b[j]=true end end f.
ChildAdded:Connect(function(g)local h=(g.Name or''):lower():gsub('%s+','')if#h>0
then b[h]=true end end)end end function ag.IsEnemyProjectile(g)f()if not g or
type(g)~='string'then return false end local h=g:lower():gsub('%s+','')if#h==0
then return false end if c[h]==true then return false end return b[h]==true end
function ag.BindDetection(g)d=g or nil end function ag.IsEnabled()return ah end
local g=function()local g=af and af.Character if not g then return nil end local
h=g:FindFirstChild'HumanoidRootPart'or g.PrimaryPart if not h then return nil
end return h.Position.Y-2.5 end local h,j=function(h)if not h or not h.Parent
then return 2.5 end local j=g()if j then local k=j+2.5 local l,m=k-h.Position.Y,
h.Size.Y/2+1.2 return math.clamp(math.max(l,m),1.5,30)end return math.clamp(h.
Size.Y/2+1.8,2,10)end,function(h)return h and h.Parent and h.Transparency<=aj
end local k,l=function(k)if not k or not k.Parent then return nil end if k:IsA
'BasePart'then if j(k)then return k end elseif k:IsA'Model'then if k.PrimaryPart
and j(k.PrimaryPart)then return k.PrimaryPart end local l=k:FindFirstChild
'HumanoidRootPart'if l and j(l)then return l end for m,n in ipairs(k:
GetDescendants())do if n:IsA'BasePart'and j(n)then return n end end else for l,m
in ipairs(k:GetDescendants())do if m:IsA'BasePart'and j(m)then return m end end
end return nil end,function(k)local l,m=k and k.IsTrajectory==true,k and k.Name
or'Hazard'local n,o=ag.IsEnemyProjectile(m),not l if n then local p,q=l and am
or al,l and'255,160,50'or'0,210,255'return'P',p,q,o else local p,q=l and am or
ak,l and'255,160,50'or'255,80,80'return'N',p,q,o end end local m=function(m,n)if
not m or not m.items or not n then return end local o,p,q,r=l(n)local s,t=n.Name
or'Hazard',''if r then local u=n.SpawnClock or os.clock()local v=math.max(0,os.
clock()-u)t=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(255,220,220)'>%s</font> <font color='rgb(255,255,255)'><b>%.1fs</b></font>]]
):format(q,o,s,v)else t=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(220,235,255)'>%s</font>]]
):format(q,o,s)end for u,v in ipairs(m.items)do if v.label and v.label.Parent
then v.label.Text=t end if v.stroke and v.stroke.Parent and v.stroke.Color~=p
then v.stroke.Color=p end end end local n=function()if not ah then return end
local n=false for o,p in pairs(ai)do local q=o.Instance if not q or not q.Parent
then ag.DetachTimerVisual(o)else if p.items then for r=#p.items,1,-1 do local s=
p.items[r]local t=s.part if not j(t)then if s.billboard and s.billboard.Parent
then pcall(function()s.billboard:Destroy()end)end table.remove(p.items,r)else if
s.billboard and s.billboard.Parent then s.billboard.StudsOffset=Vector3.new(0,h(
t),0)end end end if#p.items==0 then ag.DetachTimerVisual(o)else n=true m(p,o)end
else ag.DetachTimerVisual(o)end end end if not n and e then e:Disconnect()e=nil
end end local o,p=function()if not e and ah then e=ad.Heartbeat:Connect(n)end
end,function(o,p)local q,r=h(o),Instance.new'BillboardGui'r.Name=
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
r,v,u end function ag.AttachTimerVisual(q)if not ah or not q then return end if
ai[q]then ag.DetachTimerVisual(q)end local r=q.Instance if not r or not r.Parent
then return end local s,t=l(q)local u=ac.GetHazardZones(q)local v,w,x=u and u.
zones,{},{}local y=function(y,z,A,B,C)local D={billboard=z,label=A,stroke=B,part
=y,zone=C}table.insert(w,D)local E=y:GetPropertyChangedSignal'Transparency':
Connect(function()if not j(y)then pcall(function()z:Destroy()end)end end)table.
insert(x,E)local F=y.AncestryChanged:Connect(function(F,G)if not G then pcall(
function()z:Destroy()end)end end)table.insert(x,F)end if v and#v>0 then for z,A
in ipairs(v)do local B=A.part if j(B)then local C,D,E=p(B,t)y(B,C,D,E,A)end end
else local z=k(r)if j(z)then local A,B,C=p(z,t)y(z,A,B,C,nil)end end if#w>0 then
local z={items=w,connections=x}ai[q]=z m(z,q)o()end end function ag.
DetachTimerVisual(q)if not q then return end local r=ai[q]if not r then return
end if r.connections then for s,t in ipairs(r.connections)do pcall(function()t:
Disconnect()end)end table.clear(r.connections)end if r.items then for s,t in
ipairs(r.items)do if t.billboard and t.billboard.Parent then pcall(function()t.
billboard:Destroy()end)end end table.clear(r.items)end ai[q]=nil end function ag
.UpdateHazardVisualColor(q,r)if not q then return end local s=ai[q]if s then m(s
,q)else ag.AttachTimerVisual(q)end end function ag.ClearAll()if e then e:
Disconnect()e=nil end for q in pairs(ai)do ag.DetachTimerVisual(q)end table.
clear(ai)end function ag.RefreshAll()ag.ClearAll()if not ah or not d then return
end for q,r in pairs(d.GetActiveHazardsMap())do if r then ag.AttachTimerVisual(r
)end end end function ag.SetEnabled(q)ah=q and true or false if ah then ag.
RefreshAll()else ag.ClearAll()end end ab.Register(function()ag.ClearAll()end)
return ag end function a.g()local aa,ab,ac=a.load'a',a.load'b',a.load'd'local ad
,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,b,c=aa.RunService or game:GetService
'RunService',aa.player,{},false,45,{},0.85,Color3.fromRGB(255,140,0),0.65,0.2,
3.5,{firstbossseekingspikes='target_player',firstbossbigspike='target_player'}
local d=function()local d=ae and ae.Character if not d then return nil end local
e=d:FindFirstChild'HumanoidRootPart'or d.PrimaryPart if not e then return nil
end return e.Position end local e,f=function(e,f)if not e or not f then return
nil,nil end local g=e:lower():gsub('%s+','')local h=ao[g]if not h then for j,k
in pairs(ao)do if string.find(g,j,1,true)then h=k break end end end if not h
then return nil,nil end if h=='look_vector'then local j=f.CFrame.LookVector
local k=Vector3.new(j.X,0,j.Z)if k.Magnitude>0.01 then return k.Unit,h end else
local j=d()if j then local k=j-f.Position local l=Vector3.new(k.X,0,k.Z)if l.
Magnitude>0.1 then return l.Unit,h end end local k=f.CFrame.LookVector local l=
Vector3.new(k.X,0,k.Z)if l.Magnitude>0.01 then return l.Unit,h end end return
nil,nil end,function()local e=ae and ae.Character if not e then return nil end
local f=e:FindFirstChild'HumanoidRootPart'or e.PrimaryPart if not f then return
nil end return f.Position.Y-2.5 end function af.BindDetection(g)b=g or nil end
function af.IsEnabled()return ag end function af.GetPredictionLength()return ah
end function af.SetPredictionLength(g)if type(g)=='number'and g>0 then ah=math.
clamp(g,10,200)af.RefreshAll()end end function af.IsHazardMoving(g)if not g then
return false end local h=ai[g]return h and h.isMoving==true end local g,h=
function(g,h)local j=g.Instance if not j or not j.Parent then return nil,4 end
local k,l,m=ac.GetTrajectoryMargin and ac.GetTrajectoryMargin()or 2,{},g.Name or
(j and j.Name)or''local n=ac.IsForceCircle and ac.IsForceCircle(m)if j:IsA
'BasePart'then if j.Transparency<=aj then table.insert(l,j)end else for o,p in
ipairs(j:GetDescendants())do if p:IsA'BasePart'and p.Parent and p.Transparency<=
aj then table.insert(l,p)end end end if#l==0 then return nil,4 end local o,p,q,r
=Vector3.new(-h.Z,0,h.X),math.huge,-math.huge,0 for s,t in ipairs(l)do local u,v
,w=t.Position,t.Size,0 if n or(t:IsA'Part'and(t.Shape==Enum.PartType.Ball or t.
Shape==Enum.PartType.Cylinder))then w=math.max(v.X,v.Y,v.Z)/2 else local x=t.
CFrame local y,z,A,B,C,D=x.RightVector,x.UpVector,x.LookVector,v.X/2,v.Y/2,v.Z/2
w=B*math.abs(y.X*o.X+y.Z*o.Z)+C*math.abs(z.X*o.X+z.Z*o.Z)+D*math.abs(A.X*o.X+A.Z
*o.Z)end local x=u.X*o.X+u.Z*o.Z p=math.min(p,x-w)q=math.max(q,x+w)local y=u.X*h
.X+u.Z*h.Z r+=y end local s,t,u=math.max(1,(q-p)+k*2),(p+q)/2,r/#l local v=h*u+o
*t return v,s end,function(g,h,j,k,l,m,n)if not h or not h.Parent or not g or
not g.Parent then return end local o=m/2 local p=Vector3.new(j.X+k.X*o,l or j.Y,
j.Z+k.Z*o)local q=p+Vector3.new(k.X,0,k.Z)local r=CFrame.lookAt(p,q)local s=h.
CFrame:ToObjectSpace(r)g.CFrame=s g.Size=Vector3.new(n,am,m)if not g.Visible
then g.Visible=true end end local j=function()if not ag then return end local j,
k,l=false,os.clock(),f()for m,n in pairs(ai)do local o=m.Instance if not o or
not o.Parent then af.DetachTrajectoryVisuals(m)else j=true local p=n.mainPart if
p and p.Parent then local q,r=p.Position,k-(n.lastClock or k)if r>=0.035 then
local s=q-(n.lastPos or q)local t,u=s.Magnitude/r,Vector3.new(s.X,0,s.Z)local v,
w=u.Magnitude/r,n.isMoving==true if v>=an then n.isMoving=true n.dir=u.Unit else
if not n.isInstant and r>=0.25 and t<an then n.isMoving=false end end if n.
isMoving~=w then m.IsTrajectory=n.isMoving m.HazardZones=nil if b and b.
UpdateHazardVisualColor then pcall(b.UpdateHazardVisualColor,m,n.isMoving)end
local x=a.load'e'if x and x.UpdateHazardVisualColor then pcall(x.
UpdateHazardVisualColor,m,n.isMoving)end end n.lastPos=q n.lastClock=k end if n.
isMoving and n.dir and n.ad then local s,t=g(m,n.dir)if s then h(n.ad,p,s,n.dir,
l,ah,t)end else if n.ad and n.ad.Visible then n.ad.Visible=false end end end end
end if not j and c then c:Disconnect()c=nil end end local k=function()if not c
and ag then c=ad.Heartbeat:Connect(j)end end function af.DetachTrajectoryVisuals
(l)if not l then return end local m=ai[l]if not m then return end if m.ad then
pcall(function()m.ad:Destroy()end)m.ad=nil end if m.connections then for n,o in
ipairs(m.connections)do pcall(function()o:Disconnect()end)end table.clear(m.
connections)end ai[l]=nil end function af.AttachTrajectoryVisuals(l)if not ag or
not l then return end if ai[l]then af.DetachTrajectoryVisuals(l)end local m=l.
Instance if not m or not m.Parent then return end local n if m:IsA'BasePart'then
n=m else n=m.PrimaryPart or m:FindFirstChildWhichIsA'BasePart'if not n then for
o,p in ipairs(m:GetDescendants())do if p:IsA'BasePart'and p.Parent then n=p
break end end end end if not n or not n.Parent then return end local o=Instance.
new'BoxHandleAdornment'o.Name='HazardTrajectoryCorridor'o.Adornee=n o.Size=
Vector3.new(4,am,ah)o.Color3=ak o.Transparency=al o.ZIndex=1 o.AlwaysOnTop=true
o.Visible=false o.Parent=n local p,q={},n:GetPropertyChangedSignal'Transparency'
:Connect(function()if n.Parent and n.Transparency>aj then pcall(function()o:
Destroy()end)end end)table.insert(p,q)local r,s=e(l.Name or(m and m.Name),n)
local t=r~=nil ai[l]={ad=o,connections=p,mainPart=n,lastPos=n.Position,lastClock
=os.clock(),velocity=Vector3.zero,dir=r,isMoving=t,isInstant=t,instantMode=s}if
t and r then l.IsTrajectory=true l.HazardZones=nil local u,v,w=f(),g(l,r)if v
then h(o,n,v,r,u,ah,w)end if b and b.UpdateHazardVisualColor then pcall(b.
UpdateHazardVisualColor,l,true)end local x=a.load'e'if x and x.
UpdateHazardVisualColor then pcall(x.UpdateHazardVisualColor,l,true)end local y=
a.load'f'if y and y.UpdateHazardVisualColor then pcall(y.UpdateHazardVisualColor
,l,true)end end k()end function af.ClearAll()if c then c:Disconnect()c=nil end
for l in pairs(ai)do af.DetachTrajectoryVisuals(l)end table.clear(ai)end
function af.RefreshAll()af.ClearAll()if not ag or not b then return end for l,m
in pairs(b.GetActiveHazardsMap())do af.AttachTrajectoryVisuals(m)end end
function af.GetNearbyTrajectories(l,m)m=m or 65 local n,o,p={},l.X,l.Z for q,r
in pairs(ai)do if r.isMoving and r.dir and r.mainPart and r.mainPart.Parent then
local s,t=g(q,r.dir)if s and t then local u,v=s.X,s.Z local w,x=o-u,p-v local y,
z=w*w+x*x,m+ah+(t/2)if y<=z*z then table.insert(n,{info=q,record=r})end end end
end return n end function af.IsPointInAnyTrajectory(l,m,n)local o,p=l.X,l.Z m=m
or 0 if n then for q,r in ipairs(n)do local s,t=r.info,r.record if t and t.
isMoving and t.dir and t.mainPart and t.mainPart.Parent then local u,v=g(s,t.dir
)if u and v then local w=t.dir local x,y,z=Vector3.new(-w.Z,0,w.X),o-u.X,p-u.Z
local A,B,C=y*w.X+z*w.Z,y*x.X+z*x.Z,v/2 if m<=0 then if A>=0 and A<=ah and math.
abs(B)<=C then return true,s,w,u,v end else local D=0 if A<0 then D=-A elseif A>
ah then D=A-ah end local E=math.max(0,math.abs(B)-C)if(D*D+E*E)<=(m*m)then
return true,s,w,u,v end end end end end return false,nil,nil,nil,nil end for q,r
in pairs(ai)do if r.isMoving and r.dir and r.mainPart and r.mainPart.Parent then
local s,t=g(q,r.dir)if s and t then local u=r.dir local v,w,x=Vector3.new(-u.Z,0
,u.X),o-s.X,p-s.Z local y,z,A=w*u.X+x*u.Z,w*v.X+x*v.Z,t/2 if m<=0 then if y>=0
and y<=ah and math.abs(z)<=A then return true,q,u,s,t end else local B=0 if y<0
then B=-y elseif y>ah then B=y-ah end local C=math.max(0,math.abs(z)-A)if(B*B+C*
C)<=(m*m)then return true,q,u,s,t end end end end end return false,nil,nil,nil,
nil end function af.SetEnabled(l)ag=l and true or false if ag then af.
RefreshAll()else af.ClearAll()end end ac.OnPaddingChanged(function()if ag then
af.RefreshAll()end end)ab.Register(function()af.ClearAll()end)return af end end
local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.load'a',a.load'c',a.load'b',a.load'd',a.
load'e',a.load'g',a.load'f',game:GetService'Players',game:GetService'Workspace',
game:GetService'ReplicatedStorage'local ak,al,am,an,ao,b,c,d,e,f,g,h,j,k,l,m,n,o
,p=aa.player,{},false,false,true,false,false,'',false,{},0,{},{},{'abilities',
'projectiles'},false,{},{}local q,r,s,t,u,v,w,x=function()if l then return end l
=true for q,r in ipairs(k)do local s=aj:FindFirstChild(r)if s then for t,u in
ipairs(s:GetChildren())do local v=(u.Name or''):lower():gsub('%s+','')if#v>0
then m[v]=true end end end end end,function(q)if not q then return true end
local r=q.Name if typeof(r)=='string'then local s=r:lower()if s:sub(1,3)=='tm_'
or s:sub(1,3)=='pr_'or s:sub(1,3)=='dq_'or s:find'pathrecord'or s:find'safespot'
or s:find'hazard'or s:find'adornment'or s:find'debug'or s:find'targetpart'or s:
find'actualmarker'then return true end local t=q.Parent while t and t~=workspace
and t~=game do local u=t.Name if typeof(u)=='string'then local v=u:lower()if v:
find'pathrecord'or v:sub(1,3)=='tm_'or v:sub(1,3)=='pr_'then return true end end
t=t.Parent end local u=s:gsub('%s+','')if#u>0 and m[u]==true then return true
end if n[u]==true or n[r]==true then return true end for v,w in pairs(n)do if
string.find(u,v,1,true)then return true end end end return false end,function(q)
if not q then return false end if ah:GetPlayerFromCharacter(q)then return true
end if ah:FindFirstChild(q.Name)then return true end for r,s in ipairs(ah:
GetPlayers())do if q.Name==s.Name then return true end local t=s.Character if t
and(q==t or q:IsDescendantOf(t))then return true end end local r=ak and ak.
Character if r and(q==r or q:IsDescendantOf(r))then return true end return false
end,function()local q=0 for r in pairs(f)do q+=1 end g=q for r=#h,1,-1 do pcall(
h[r],q,o)end end,0.85,50,0.05,{}local y,z,A,B,C,D,E,F=function(y)local z=x[y]if
z then z.active=false x[y]=nil end end,function()for y,z in pairs(x)do if z then
z.active=false end end table.clear(x)end,function(y)if not y then return{}end
local z={}local A=function(A)if A and A.Parent and A.Transparency<=u then z[#z+1
]=A end end if y:IsA'BasePart'then A(y)else for B,C in ipairs(y:GetDescendants()
)do if C:IsA'BasePart'and C.Parent then A(C)end end end return z end,function(y)
local z=ak and ak.Character if not z then return 0 end local A=z:FindFirstChild
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
end return J end function al.UpdateHazardVisualColor(H,I)if not H or not H.Boxes
then return end local J=I==true or H.IsTrajectory==true local K,L=J and E or C,J
and F or D for M,N in ipairs(H.Boxes)do if N and N.Parent then N.Color3=K N.
SurfaceColor3=L end end ag.UpdateHazardVisualColor(H,J)end local H,I=function(H)
if not e or d==''then return false end if not H or type(H)~='string'then return
false end local I=d:lower():gsub('%s+','')if#I==0 then return false end local J=
H:lower():gsub('%s+','')return string.find(J,I,1,true)~=nil end,function(H)if
not H then return'nil'end return('(%.2f, %.2f, %.2f)'):format(H.X,H.Y,H.Z)end
local ap=function(J,K,L,M)if not J then return end local N=J.Name if not H(N)
then return end local O,P,Q=J.ClassName,J.Parent and J.Parent:GetFullName()or
'nil',B(J)print
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
end local Z=X*V:Inverse()local _,ap=Z:ToAxisAngle()local aq,ar=math.deg(ap)/Y,V:
Inverse()*X local as,at=ar:ToAxisAngle()if math.abs(math.deg(ap))>=1.5 then
local au='Tr\u{1ee5}c t\u{1ef1} do / H\u{1ed7}n h\u{1ee3}p'if math.abs(_.Y)>=0.8
then au='Tr\u{1ee5}c Y (Yaw - Qu\u{e9}t ngang m\u{1eb7}t s\u{e0}n)'elseif math.
abs(_.X)>=0.8 then au='Tr\u{1ee5}c X (Pitch - L\u{103}n nh\u{e0}o l\u{1ed9}n)'
elseif math.abs(_.Z)>=0.8 then au=
'Tr\u{1ee5}c Z (Roll - Nghi\u{ea}ng l\u{1ead}t b\u{ea}n)'end local av=
'Tr\u{1ee5}c t\u{1ef1} do'if math.abs(as.Y)>=0.8 then av='Tr\u{1ee5}c Local Y'
elseif math.abs(as.X)>=0.8 then av='Tr\u{1ee5}c Local X'elseif math.abs(as.Z)>=
0.8 then av='Tr\u{1ee5}c Local Z'end print
'================== \u{1f504} [INSPECT: SPINNING DETECTED] \u{1f504} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(J.Name,T.Name))print((
'  \u{26a1} T\u{1ed1}c \u{111}\u{1ed9} xoay    : %.2f \u{b0}/s (%.2f rad/s)'):
format(aq,ap/Y))print(('  \u{1f310} World Spin Axis: %s -> %s'):format(I(_),au))
print(('  \u{1f9e9} Local Spin Axis: %s -> %s'):format(I(as),av))print
[[========================================================================]]end
end)elseif K=='DESPAWN'then if M and M.SpawnClock then local ap=os.clock()-M.
SpawnClock print(('  \u{23f1}\u{fe0f} Lifetime Active: %.2f seconds'):format(ap)
)end elseif K=='REJECTED'then print(('  \u{26a0}\u{fe0f} Rejection Reason: %s'):
format(tostring(L)))end print
[[================================================================]]end local aq
,ar=function(aq,ar)ap(aq,'REJECTED',ar,nil)if not c then return end local as,at=
aq and aq.Name or'?',aq and aq.ClassName or'?'print((
'[HazardScanner][Reject] \u{26aa} %s (%s) \u{2014} %s'):format(as,at,ar))end
local as=function(as)if not as or not as.Parent then return end if s(as)then
return end if f[as]then return end if x[as]then return end local at={active=true
,count=0}x[as]=at task.spawn(function()while at.active and as.Parent and am and
an do if s(as)then y(as)return end at.count+=1 local au,av,J=as:GetDescendants()
,A(as),H(as.Name)if c or J then print((
'[HazardScanner][Retry] \u{1f504} L\u{1ea7}n %d/%d: %q (%s) | Descendants: %d | Valid Parts (Trans<=%.2f): %d'
):format(at.count,v,as.Name,as.ClassName,#au,u,#av))end if#av>0 then if c or J
then print((
'[HazardScanner][Retry] \u{2705} L\u{1ea7}n %d/%d: %q \u{110}\u{e3} t\u{ec}m th\u{1ea5}y %d part(s)! Ti\u{1ebf}n h\u{e0}nh v\u{1ebd}...'
):format(at.count,v,as.Name,#av))end y(as)ar(as)return end if at.count>=v then
aq(as,(
'H\u{1ebf}t %d l\u{1b0}\u{1ee3}t retry m\u{e0} kh\u{f4}ng t\u{ec}m th\u{1ea5}y BasePart h\u{1ee3}p l\u{1ec7} (Descendants: %d)'
):format(v,#au))y(as)return end task.wait(w)end y(as)end)end ar=function(at)if
not am or not an then aq(at,'Ch\u{1b0}a trong dungeon')return false end if not
at or not at.Parent then aq(at,'Kh\u{f4}ng c\u{f2}n Parent')return false end if
s(at)then aq(at,
'Nh\u{e2}n v\u{1ead}t ng\u{1b0}\u{1edd}i ch\u{1a1}i (Player/Teammate)')return
false end if f[at]then return true end q()if r(at)then aq(at,
'Tr\u{f9}ng t\u{ea}n trong ReplicatedStorage (abilities/projectiles)')return
false end local au=A(at)if#au==0 then aq(at,
'Ch\u{1b0}a c\u{f3} part \u{111}\u{1ec3} v\u{1ebd} (s\u{1ebd} retry)')as(at)
return false end local av,J={},{}if ao then J=G(au,av)end local K=B(at)local L={
Instance=at,Name=at.Name,Class=at.ClassName,Distance=K,Boxes=J,Connections=av,
SpawnClock=os.clock()}f[at]=L o={Name=at.Name,Class=at.ClassName,Distance=K}if
ae.IsEnabled()then ae.AttachZoneVisuals(L)end if af.IsEnabled()then af.
AttachTrajectoryVisuals(L)end if ag.IsEnabled()then ag.AttachTimerVisual(L)end
y(at)ap(at,'SPAWN','Passed all gates',L)if b then print((
'[HazardScanner][Hazard] \u{1f534} Hazard Detected: %s (%s, %d studs)'):format(
at.Name,at.ClassName,K))end t()return true end local at=function(at,au)local av=
f[at]if not av then y(at)return end ap(at,'DESPAWN',au,av)ae.DetachZoneVisuals(
av)af.DetachTrajectoryVisuals(av)ag.DetachTimerVisual(av)if av.Boxes then for J,
K in ipairs(av.Boxes)do pcall(function()K:Destroy()end)end table.clear(av.Boxes)
end if av.Connections then for J,K in ipairs(av.Connections)do pcall(function()K
:Disconnect()end)end table.clear(av.Connections)end f[at]=nil if b then local J=
au and(' ('..au..')')or''print((
'[HazardScanner][Hazard] \u{1f7e2} Hazard Expired: %s%s'):format(tostring(av.
Name),J))end t()end function al.ClearAllHazards(au)ae.ClearAll()af.ClearAll()ag.
ClearAll()z()local av={}for J in pairs(f)do table.insert(av,J)end for J,K in
ipairs(av)do at(K,au)end if b and au then print((
'[HazardScanner][Hazard] \u{1f9f9} All hazards cleared: %s'):format(au))end end
function al.StartScan()if am then return end am=true ae.BindDetection(al)af.
BindDetection(al)ag.BindDetection(al)al.ClearAllHazards'StartScan Reset'for au,
av in ipairs(j)do av:Disconnect()end table.clear(j)table.insert(j,ai.ChildAdded:
Connect(function(au)if s(au)then return end ar(au)end))table.insert(j,ai.
ChildRemoved:Connect(function(au)at(au,'Destroyed')end))an=ab.
GetCurrentRoomIndex()>0 if p then pcall(p)p=nil end p=ab.OnRoomIndexChanged(
function(au)if au>0 then an=true elseif au<=0 and an then an=false al.
ClearAllHazards'Dungeon Ended'end end)if b then print
'[HazardScanner] \u{1f4e1} Threat Detector started!'end end function al.StopScan
()am=false an=false for au,av in ipairs(j)do av:Disconnect()end table.clear(j)if
p then pcall(p)p=nil end al.ClearAllHazards'StopScan'if b then print
'[HazardScanner] \u{1f6d1} Threat Detector stopped.'end end function al.
IsEnabled()return am end function al.SetEnabled(au)if au then al.StartScan()else
al.StopScan()end end function al.SetSelectionBoxesEnabled(au)ao=au and true or
false if ao then for av,J in pairs(f)do if av and av.Parent and(not J.Boxes or#J
.Boxes==0)then local K=A(av)J.Connections=J.Connections or{}J.Boxes=G(K,J.
Connections)end end else for av,J in pairs(f)do if J.Boxes then for K,L in
ipairs(J.Boxes)do pcall(function()L:Destroy()end)end table.clear(J.Boxes)end end
end end function al.IsSelectionBoxesEnabled()return ao end function al.
SetLogHazards(au)b=au and true or false end function al.IsLogHazardsEnabled()
return b end function al.SetLogFailed(au)c=au and true or false end function al.
IsLogFailedEnabled()return c end function al.SetInspectTarget(au)d=type(au)==
'string'and au or''end function al.GetInspectTarget()return d end function al.
SetInspectEnabled(au)e=au and true or false end function al.IsInspectEnabled()
return e end function al.GetHazardCount()return g end function al.
GetActiveHazards()local au={}for av,J in pairs(f)do if av and av.Parent==ai then
au[#au+1]=J end end return au end function al.GetActiveHazardsMap()return f end
function al.GetLastHazardInfo()return o end function al.OnHazardChanged(au)if
type(au)~='function'then return end table.insert(h,au)end ac.Register(function()
al.StopScan()al.ClearAllHazards'Shutdown'end)return al