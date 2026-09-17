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
b.IsActive()return not b.cleaned end b.OnCleanup=b.Register return b end
function a.e()local b,c=a.load'a',a.load'd'local d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s
,t,u,v,w,x,y,z=b.player,0.05,'enemyProjectiles',0.5,{},false,16,16,true,false,
false,{},0,{},0,{},{},{},{},{},{},0,{}local A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,
S=function()for A=#z,1,-1 do pcall(z[A])end end,{},'unknown',true,{},{},{},0,4,
false local T=function(T)if T then table.insert(G,T)end return T end function h.
OnRespawn(U)table.insert(F,U)end function h.GetLastRespawnTime()return H end
function h.GetRespawnProtectionDuration()return I end function h.
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
pcall(function()aq:Enable()end)end N()end)return h end end local aa,ab,ac,ad,ae=
a.load'a',a.load'b',a.load'c',a.load'e',a.load'd'local af,ag,ah,ai,aj,ak,al,am,
an,ao,ap,aq=aa.player.Name,false,false,false,'Desert Temple','Easy',false,true,
false,3,{[77649408247578]=true,[3220968688]=true,[2414851778]=true},{}local b,c,
d=function()return ap[game.PlaceId]==true end,function()for b,c in ipairs(aq)do
pcall(c,aj,ac.GetAllowedDifficulties(aj))end end,function()if ah then return end
ah=true ai=false task.spawn(function()local b,c=pcall(function()local b=game:
GetService'ReplicatedStorage':WaitForChild('remotes',15)if not b then error
'remotes not found'end local c=ac.GetLevelReq(aj,ak)pcall(function()b:
WaitForChild('createLobby',10):InvokeServer(aj,ak,c,al,am,an)end)if ai then
return end task.wait(ao)if ai then return end if am then pcall(function()b:
WaitForChild('addPlayerToWhitelist',10):FireServer(af)end)if ai then return end
task.wait(ao)if ai then return end end local d=0 while d<10 do local e=workspace
:FindFirstChild'games'and workspace.games:FindFirstChild'inLobby'if e then break
end task.wait(0.5)d=d+0.5 if ai then return end end if ai then return end task.
wait(ao)if ai then return end pcall(function()b:WaitForChild('startDungeon',10):
FireServer()end)end)ah=false if ai then return end if b then ab.Notify(
'Auto Join','Joined: '..aj,3)else ab.Notify('Auto Join','Join failed: '..
tostring(c),4)end end)end local e,f=function()while ae.IsActive()do task.wait(
0.5)if ag and not ah and b()and ad.IsInLobby()then d()end end end,{}function f.
Toggle(g)ag=g if ag then ab.Notify('Auto Join','Enabled',2)else ai=true ab.
Notify('Auto Join','Stopped',2)end end function f.SetDungeon(g)if type(g)~=
'string'or#g==0 then return end aj=g if not ac.IsDifficultyAllowed(aj,ak)then
local h=ac.GetAllowedDifficulties(aj)if#h>0 then ak=h[1]end end c()end function
f.SetDifficulty(g)if type(g)~='string'then return end if ac.IsDifficultyAllowed(
aj,g)then ak=g end end function f.SetHardcore(g)al=g end function f.SetPrivate(g
)am=g end function f.SetWaveDefence(g)an=g end function f.SetDelay(g)ao=g end
function f.GetSelectedDungeon()return aj end function f.GetSelectedDifficulty()
return ak end function f.GetAllowedDifficulties()return ac.
GetAllowedDifficulties(aj)end function f.OnDungeonChanged(g)if type(g)==
'function'then table.insert(aq,g)end end f.JoinNow=function()task.spawn(function
()d()end)end task.spawn(e)ae.Register(function()f.Toggle(false)end)return f