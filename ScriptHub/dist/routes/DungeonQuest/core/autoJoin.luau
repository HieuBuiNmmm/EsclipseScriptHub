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
{},0,{}local A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q=function()for A=#z,1,-1 do pcall(
z[A])end end,{},'unknown',true,{},{},{},0,4,false local R=function(R)if R then
table.insert(G,R)end return R end function h.OnRespawn(S)table.insert(F,S)end
function h.GetLastRespawnTime()return H end function h.
GetRespawnProtectionDuration()return I end function h.
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
end)end table.clear(G)N()end)return h end end local aa,ab,ac,ad,ae=a.load'a',a.
load'b',a.load'c',a.load'e',a.load'd'local af,ag,ah,ai,aj,ak,al,am,b,c,d,e=aa.
player.Name,false,false,false,'Desert Temple','Easy',false,true,false,3,{[
77649408247578]=true,[3220968688]=true,[2414851778]=true},{}local f,g,h=function
()return d[game.PlaceId]==true end,function()for f,g in ipairs(e)do pcall(g,aj,
ac.GetAllowedDifficulties(aj))end end,function()if ah then return end ah=true ai
=false task.spawn(function()local f,g=pcall(function()local f=game:GetService
'ReplicatedStorage':WaitForChild('remotes',15)if not f then error
'remotes not found'end local g=ac.GetLevelReq(aj,ak)pcall(function()f:
WaitForChild('createLobby',10):InvokeServer(aj,ak,g,al,am,b)end)if ai then
return end task.wait(c)if ai then return end if am then pcall(function()f:
WaitForChild('addPlayerToWhitelist',10):FireServer(af)end)if ai then return end
task.wait(c)if ai then return end end local h=0 while h<10 do local i=workspace:
FindFirstChild'games'and workspace.games:FindFirstChild'inLobby'if i then break
end task.wait(0.5)h=h+0.5 if ai then return end end if ai then return end task.
wait(c)if ai then return end pcall(function()f:WaitForChild('startDungeon',10):
FireServer()end)end)ah=false if ai then return end if f then ab.Notify(
'Auto Join','Joined: '..aj,3)else ab.Notify('Auto Join','Join failed: '..
tostring(g),4)end end)end local i,j=function()while ae.IsActive()do task.wait(
0.5)if ag and not ah and f()and ad.IsInLobby()then h()end end end,{}function j.
Toggle(k)ag=k if ag then ab.Notify('Auto Join','Enabled',2)else ai=true ab.
Notify('Auto Join','Stopped',2)end end function j.SetDungeon(k)if type(k)~=
'string'or#k==0 then return end aj=k if not ac.IsDifficultyAllowed(aj,ak)then
local l=ac.GetAllowedDifficulties(aj)if#l>0 then ak=l[1]end end g()end function
j.SetDifficulty(k)if type(k)~='string'then return end if ac.IsDifficultyAllowed(
aj,k)then ak=k end end function j.SetHardcore(k)al=k end function j.SetPrivate(k
)am=k end function j.SetWaveDefence(k)b=k end function j.SetDelay(k)c=k end
function j.GetSelectedDungeon()return aj end function j.GetSelectedDifficulty()
return ak end function j.GetAllowedDifficulties()return ac.
GetAllowedDifficulties(aj)end function j.OnDungeonChanged(k)if type(k)==
'function'then table.insert(e,k)end end j.JoinNow=function()task.spawn(function(
)h()end)end task.spawn(i)ae.Register(function()j.Toggle(false)end)return j