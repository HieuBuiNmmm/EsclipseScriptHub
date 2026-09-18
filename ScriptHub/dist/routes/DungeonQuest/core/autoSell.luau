local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b={cleaned=false,callbacks={}
}function b.Register(c)if type(c)~='function'then return function()end end if b.
cleaned then pcall(c)return function()end end table.insert(b.callbacks,c)return
function()for d,e in ipairs(b.callbacks)do if e==c then table.remove(b.callbacks
,d)break end end end end function b.Cleanup()if b.cleaned then return end b.
cleaned=true for c=#b.callbacks,1,-1 do pcall(b.callbacks[c])end table.clear(b.
callbacks)end function b.IsActive()return not b.cleaned end b.OnCleanup=b.
Register return b end function a.b()local b,c={}function b:SetWindow(d)c=d end
function b.Notify(d,e,f)f=f or 3 if c then local g=pcall(function()c:Notify{
Title=d,Description=e,Lifetime=f}end)if g then return end end pcall(function()
game:GetService'StarterGui':SetCore('SendNotification',{Title=d,Text=e,Duration=
f})end)end return b end function a.c()local b,c,d,e=game:GetService'Players',
game:GetService'UserInputService',game:GetService'RunService',game:GetService
'VirtualInputManager'local f=b.LocalPlayer if not f then local g=os.clock()+5
repeat f=b.LocalPlayer if f then break end task.wait(0.1)until os.clock()>g end
return{Players=b,UserInputService=c,RunService=d,VirtualInputManager=e,player=f}
end function a.d()local b,c=a.load'c',a.load'a'local d,e,f,g,h,i,j,k,l,m,n,o,p,q
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
pcall(function()as:Enable()end)end N()end)return h end end local aa,ab,ac,ad,ae,
af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as=a.load'a',a.load'b',a.load'd',{[
77649408247578]=true,[115445507767090]=true},{},false,false,true,{},{},{},'None'
,false,{weapons='Weapons',helmets='Helmets',chests='Chests',abilities=
'Abilities'},{'Common','Uncommon','Rare','Epic','Legendary','Mythic'},{'1','5',
'10','15','20','25','30','35','40','45','50','55','60','65','70','75','80','85',
'90','95','100','105','110','115','120','125','130','135','140','145','150',
'155','160','165','170','175','180','185','190','195','200','205','210','215',
'220','225','230','235','240','245','250','255','260','265','270','275','280',
'285','290','295','300'},{'None','Below','Above'},{Common=0,Uncommon=1,Rare=2,
Epic=3,Legendary=4,Mythic=5},{}for b,c in ipairs(ao)do as[c]=true end local b={}
for c,d in ipairs(ao)do b[string.lower(d)]=d end local c,d=function(c)if type(c)
~='string'then return nil end return b[string.lower(c)]end,function(c)local d
pcall(function()d=game:GetService'ReplicatedStorage':WaitForChild('remotes',5):
WaitForChild('sellItemEvent',5)end)if not d then return false,0 end local e={}
for f,g in pairs(c)do if type(g)=='table'and#g>0 then e[f]=g end end if next(e)
==nil then return false,0 end local f=pcall(function()d:FireServer(e)end)if not
f then return false,0 end return true,0 end local e=d function ae.SetSellAction(
f)if type(f)=='function'then e=f end end local f=function()local f,g=pcall(
function()return game:GetService'ReplicatedStorage':WaitForChild('remotes',5):
WaitForChild('reloadInvy',5)end)if not f or not g then return nil,
'Could not find remote reloadInvy'end local h,i=pcall(function()return g:
InvokeServer()end)if not h or i==nil then return nil,'Could not read inventory'
end local j,k,l,m={},{},function(j)return j.sellPrice~=nil or j.UniqueItemID~=
nil or j.rarity~=nil end,function(j)local k=tostring(j)local l=tonumber(k:match
'_(%d+)$')if not l then return nil,nil end local m=k:match'^(.-)_%d+$'return m,l
end local n=function(n,o,p,q)local r=false if type(n.equipped)=='boolean'then r=
n.equipped elseif type(n.equipped)=='table'then for s,t in pairs(n.equipped)do
if t==true then r=true break end end end local s=c(n.rarity)or'Common'table.
insert(j,{Type=an[o]or o or'Unknown',Category=p or o,Index=q,Name=tostring(n.
name or n.UniqueItemID or'?'),Rarity=s,RarityValue=ar[s],SellPrice=tonumber(n.
sellPrice)or 0,UniqueItemID=n.UniqueItemID,Equipped=r,LevelReq=tonumber(n.
levelReq)or 0,Raw=n})end local function o(p,q,r,s)if type(p)~='table'then return
end if k[p]then return end k[p]=true if l(p)then n(p,q,r,s)return end for t,u in
pairs(p)do if an[t]then o(u,t,nil,nil)elseif type(u)=='table'and l(u)then local
v,w=m(t)o(u,q,v,w)else o(u,q,r,s)end end end o(i,nil,nil,nil)return j end
function ae.ShouldSellItem(g)if not g then return false end if ah and g.Equipped
then return false end if next(ai)and as[g.Rarity]and not ai[g.Rarity]then return
false end if next(aj)and g.Type and not aj[g.Type]then return false end local h,
i=ak,al if next(h)==nil then h={[1]=true}i='None'end local j=g.LevelReq or 0 if
i=='Below'then local k for l in pairs(h)do if not k or l>k then k=l end end if k
and j>k then return false end elseif i=='Above'then local k for l in pairs(h)do
if not k or l<k then k=l end end if k and j<k then return false end else if not
h[j]then return false end end return true end function ae.HasAnyFilter()return
next(ai)~=nil or next(aj)~=nil or next(ak)~=nil end function ae.CountMatches()
local g,h=f()if not g then return{total=0,matching=0,error=h or
'Error reading inventory'}end local i,j=0,{}for k,l in ipairs(g)do j[l.Type]=(j[
l.Type]or 0)+1 if ae.ShouldSellItem(l)then i+=1 end end return{total=#g,matching
=i,byCategory=j}end function ae.SellItems()if am then return nil end am=true
local g,h,i={sold=0,skipped=0,gold=0,error=nil},f()if not h then g.error=i or
'Error reading inventory'am=false return g end local j={}for k,l in ipairs(h)do
if ae.ShouldSellItem(l)then if l.Index then g.sold+=1 local m=l.Category or l.
Type j[m]=j[m]or{}table.insert(j[m],l.Index)end else g.skipped+=1 end end local
k,l=pcall(e,j)if k and l and type(l)=='number'then g.gold=l end am=false return
g end function ae.SetLevelReqMode(g)if g=='Below'or g=='Above'then al=g else al=
'None'end end function ae.GetLevelReqMode()return al end function ae.
SetExcludeEquipped(g)ah=g end function ae.GetExcludeEquipped()return ah end
function ae.SetRarityFilter(g)ai={}if type(g)=='table'then for h,i in pairs(g)do
if i==true and type(h)=='string'then local j=c(h)or h ai[j]=true elseif type(i)
=='string'then local j=c(i)or i ai[j]=true end end elseif type(g)=='string'then
local h=c(g)or g ai[h]=true end end function ae.GetRarityFilter()local g={}for h
in pairs(ai)do table.insert(g,h)end return g end function ae.SetTypeFilter(g)aj=
{}if type(g)=='table'then for h,i in pairs(g)do if i==true and type(h)=='string'
then aj[h]=true elseif type(i)=='string'then aj[i]=true end end elseif type(g)==
'string'then aj[g]=true end end function ae.GetTypeFilter()local g={}for h in
pairs(aj)do table.insert(g,h)end return g end function ae.SetLevelReqExactFilter
(g)ak={}if type(g)=='table'then for h,i in pairs(g)do if i==true then local j=
tonumber(h)if j then ak[j]=true end else local j=tonumber(i)if j then ak[j]=true
end end end elseif type(g)=='string'or type(g)=='number'then local h=tonumber(g)
if h then ak[h]=true end end end function ae.GetLevelReqExactFilter()local g={}
for h in pairs(ak)do table.insert(g,tostring(h))end return g end local g=
function()return not ad[game.PlaceId]end local h=function()if not af then return
end if ag then return end if not g()then return end if not ae.HasAnyFilter()then
return end ag=true task.spawn(function()task.wait(2.5)if not af or not g()then
return end local h=ae.SellItems()if h and h.sold and h.sold>0 then ab.Notify(
'AutoSell',('Auto-sold %d item(s) on dungeon start.'):format(h.sold),3)end end)
end function ae.Toggle(i)af=i and true or false if af and g()and not ag then h()
end end function ae.IsEnabled()return af end ac.OnDungeonNameChanged(function(i)
ag=false if i then h()end end)ac.OnLobbyChanged(function(i)if not i then ag=
false h()else ag=false end end)task.spawn(function()while aa.IsActive()do task.
wait(1)if af and g()and not ag then h()end end end)aa.Register(function()af=
false end)ae.LEVEL_REQ_OPTIONS=ap ae.LEVEL_REQ_MODE_OPTIONS=aq return ae