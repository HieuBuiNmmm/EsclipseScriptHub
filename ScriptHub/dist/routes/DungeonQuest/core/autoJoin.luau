local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b,c,d,e=game:GetService
'Players',game:GetService'UserInputService',game:GetService'RunService',game:
GetService'VirtualInputManager'local f=b.LocalPlayer if not f then local g=os.
clock()+5 repeat f=b.LocalPlayer if f then break end task.wait(0.1)until os.
clock()>g end return{Players=b,UserInputService=c,RunService=d,
VirtualInputManager=e,player=f}end function a.b()local b,c={}function b:
SetWindow(d)c=d end function b.Notify(d,e,f)f=f or 3 if c then local g=pcall(
function()c:Notify{Title=d,Description=e,Lifetime=f}end)if g then return end end
pcall(function()game:GetService'StarterGui':SetCore('SendNotification',{Title=d,
Text=e,Duration=f})end)end return b end function a.c()local b,c,d,e,f,g,h,i={
'Easy','Medium','Hard','Insane','Nightmare'},{'Desert Temple','Winter Outpost',
'Pirate Island',"King's Castle",'The Underworld','Samurai Palace','The Canals',
'Ghastly Harbor','Steampunk Sewers','Orbital Outpost','Volcanic Chambers',
'Aquatic Temple','Enchanted Forest','Egg Island','Krampus','Tutorial Dungeon'},{
['Egg Island']={Difficulties={'Easy','Nightmare'},LevelReq=0},Krampus={
Difficulties={'Nightmare'},LevelReq=195},['Tutorial Dungeon']={Difficulties={
'Easy'},LevelReq=0}},{},{},game:GetService'HttpService',
'Maclib/DungeonQuest_MapList.json'local j,k,l,m=function(j)if not(isfile and
writefile and makefolder and isfolder)then return end pcall(function()if not
isfolder'Maclib'then makefolder'Maclib'end end)pcall(function()writefile(h,g:
JSONEncode(j))end)end,function()if not(isfile and readfile)or not isfile(h)then
return nil end local j,k=pcall(function()return g:JSONDecode(readfile(h))end)if
not j or typeof(k)~='table'then return nil end local l={}for m,n in ipairs(k)do
if type(n)=='string'and#n>0 then table.insert(l,n)end end return(#l>0)and l or
nil end,function(j)local k,l={},{}for m,n in ipairs(j or{})do if not k[n]then k[
n]=true table.insert(l,n)end end for m,n in ipairs(c)do if not k[n]then k[n]=
true table.insert(l,n)end end return l end,function()local j=game:GetService
'Players'.LocalPlayer if not j then return nil end local k=j:FindFirstChild
'PlayerGui'if not k then return nil end local l=k:FindFirstChild'queueGui'if not
l then return nil end local m=l:FindFirstChild'chooseDungeon'if not m then
return nil end local n=m:FindFirstChild'backgroundFillLeft'if not n then return
nil end return n:FindFirstChild'ScrollingFrame'end local n=function()local n=m()
if not n then return nil end local o={}for p,q in ipairs(n:GetChildren())do if q
:IsA'ImageLabel'and#q.Name>0 then table.insert(o,q.Name)end end return(#o>0)and
o or nil end function e.GetDungeons()if i then return i end local o=n()if o then
local p=l(o)i=p j(p)return p end local p=k()if p then local q=l(p)i=q return q
end return c end function e.RefreshDungeons()i=nil return e.GetDungeons()end
function e.GetDungeonStats(o)if type(o)~='string'or#o==0 then return nil end if
f[o]~=nil then return f[o]end local p=game:GetService'ReplicatedStorage':
FindFirstChild'remotes'local q=p and p:FindFirstChild'getDungeonStats'if not q
then return nil end local r,s=pcall(function()return q:InvokeServer(o)end)if r
and typeof(s)=='table'then f[o]=s return s end return nil end function e.
GetAllowedDifficulties(o)if type(o)~='string'then return b end local p=d[o]if p
then return p.Difficulties end local q,r=e.GetDungeonStats(o),{}if q then for s,
t in ipairs(b)do if q[t]then table.insert(r,t)end end end if#r>0 then return r
end return b end function e.IsDifficultyAllowed(o,p)if type(p)~='string'then
return false end for q,r in ipairs(e.GetAllowedDifficulties(o))do if r==p then
return true end end return false end function e.GetLevelReq(o,p)if type(o)~=
'string'then return 0 end local q=d[o]if q then return q.LevelReq or 0 end local
r=e.GetDungeonStats(o)if r and type(p)=='string'and r[p]then return tonumber(r[p
].levelReq)or 0 end return 0 end e.DUNGEONS=c e.DIFFICULTIES=b return e end
function a.d()local b={cleaned=false,callbacks={}}function b.Register(c)if type(
c)~='function'then return function()end end if b.cleaned then pcall(c)return
function()end end table.insert(b.callbacks,c)return function()for d,e in ipairs(
b.callbacks)do if e==c then table.remove(b.callbacks,d)break end end end end
function b.Cleanup()if b.cleaned then return end b.cleaned=true for c=#b.
callbacks,1,-1 do pcall(b.callbacks[c])end table.clear(b.callbacks)end function
b.IsActive()return not b.cleaned end return b end function a.e()local b,c=a.load
'a',a.load'd'local d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z=b.player,0.05,
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
)do pcall(function()ao:Disconnect()end)end table.clear(G)N()end)return h end end
local aa,ab,ac,ad,ae=a.load'a',a.load'b',a.load'c',a.load'e',a.load'd'local af,
ag,ah,ai,aj,ak,al,am,an,ao,b,c=aa.player.Name,false,false,false,'Desert Temple',
'Easy',false,true,false,3,{[77649408247578]=true,[3220968688]=true,[2414851778]=
true},{}local d,e,f=function()return b[game.PlaceId]==true end,function()for d,e
in ipairs(c)do pcall(e,aj,ac.GetAllowedDifficulties(aj))end end,function()if ah
then return end ah=true ai=false task.spawn(function()local d,e=pcall(function()
local d=game:GetService'ReplicatedStorage':WaitForChild('remotes',15)if not d
then error'remotes not found'end local e=ac.GetLevelReq(aj,ak)pcall(function()d:
WaitForChild('createLobby',10):InvokeServer(aj,ak,e,al,am,an)end)if ai then
return end task.wait(ao)if ai then return end if am then pcall(function()d:
WaitForChild('addPlayerToWhitelist',10):FireServer(af)end)if ai then return end
task.wait(ao)if ai then return end end local f=0 while f<10 do local g=workspace
:FindFirstChild'games'and workspace.games:FindFirstChild'inLobby'if g then break
end task.wait(0.5)f=f+0.5 if ai then return end end if ai then return end task.
wait(ao)if ai then return end pcall(function()d:WaitForChild('startDungeon',10):
FireServer()end)end)ah=false if ai then return end if d then ab.Notify(
'Auto Join','Joined: '..aj,3)else ab.Notify('Auto Join','Join failed: '..
tostring(e),4)end end)end local g,h=function()while ae.IsActive()do task.wait(
0.5)if ag and not ah and d()and ad.IsInLobby()then f()end end end,{}function h.
Toggle(i)ag=i if ag then ab.Notify('Auto Join','Enabled',2)else ai=true ab.
Notify('Auto Join','Stopped',2)end end function h.SetDungeon(i)if type(i)~=
'string'or#i==0 then return end aj=i if not ac.IsDifficultyAllowed(aj,ak)then
local j=ac.GetAllowedDifficulties(aj)if#j>0 then ak=j[1]end end e()end function
h.SetDifficulty(i)if type(i)~='string'then return end if ac.IsDifficultyAllowed(
aj,i)then ak=i end end function h.SetHardcore(i)al=i end function h.SetPrivate(i
)am=i end function h.SetWaveDefence(i)an=i end function h.SetDelay(i)ao=i end
function h.GetSelectedDungeon()return aj end function h.GetSelectedDifficulty()
return ak end function h.GetAllowedDifficulties()return ac.
GetAllowedDifficulties(aj)end function h.OnDungeonChanged(i)if type(i)==
'function'then table.insert(c,i)end end h.JoinNow=function()task.spawn(function(
)f()end)end task.spawn(g)ae.Register(function()h.Toggle(false)end)return h