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
pcall(function()aq:Enable()end)end N()end)return h end end local aa,ab,ac,ad,ae,
af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,b,c=a.load'a',a.load'b',a.load'd',{[
77649408247578]=true,[115445507767090]=true},{},false,false,true,{},{},{},'None'
,false,{weapons='Weapons',helmets='Helmets',chests='Chests',abilities=
'Abilities'},{'Common','Uncommon','Rare','Epic','Legendary','Mythic'},{'1','5',
'10','15','20','25','30','35','40','45','50','55','60','65','70','75','80','85',
'90','95','100','105','110','115','120','125','130','135','140','145','150',
'155','160','165','170','175','180','185','190','195','200','205','210','215',
'220','225','230','235','240','245','250','255','260','265','270','275','280',
'285','290','295','300'},{'None','Below','Above'},{Common=0,Uncommon=1,Rare=2,
Epic=3,Legendary=4,Mythic=5},{}for d,e in ipairs(ao)do c[e]=true end local d={}
for e,f in ipairs(ao)do d[string.lower(f)]=f end local e,f=function(e)if type(e)
~='string'then return nil end return d[string.lower(e)]end,function(e)local f
pcall(function()f=game:GetService'ReplicatedStorage':WaitForChild('remotes',5):
WaitForChild('sellItemEvent',5)end)if not f then return false,0 end local g={}
for h,i in pairs(e)do if type(i)=='table'and#i>0 then g[h]=i end end if next(g)
==nil then return false,0 end local h=pcall(function()f:FireServer(g)end)if not
h then return false,0 end return true,0 end local g=f function ae.SetSellAction(
h)if type(h)=='function'then g=h end end local h=function()local h,i=pcall(
function()return game:GetService'ReplicatedStorage':WaitForChild('remotes',5):
WaitForChild('reloadInvy',5)end)if not h or not i then return nil,
'Could not find remote reloadInvy'end local j,k=pcall(function()return i:
InvokeServer()end)if not j or k==nil then return nil,'Could not read inventory'
end local l,m,n,o={},{},function(l)return l.sellPrice~=nil or l.UniqueItemID~=
nil or l.rarity~=nil end,function(l)local m=tostring(l)local n=tonumber(m:match
'_(%d+)$')if not n then return nil,nil end local o=m:match'^(.-)_%d+$'return o,n
end local p=function(p,q,r,s)local t=false if type(p.equipped)=='boolean'then t=
p.equipped elseif type(p.equipped)=='table'then for u,v in pairs(p.equipped)do
if v==true then t=true break end end end local u=e(p.rarity)or'Common'table.
insert(l,{Type=an[q]or q or'Unknown',Category=r or q,Index=s,Name=tostring(p.
name or p.UniqueItemID or'?'),Rarity=u,RarityValue=b[u],SellPrice=tonumber(p.
sellPrice)or 0,UniqueItemID=p.UniqueItemID,Equipped=t,LevelReq=tonumber(p.
levelReq)or 0,Raw=p})end local function q(r,s,t,u)if type(r)~='table'then return
end if m[r]then return end m[r]=true if n(r)then p(r,s,t,u)return end for v,w in
pairs(r)do if an[v]then q(w,v,nil,nil)elseif type(w)=='table'and n(w)then local
x,y=o(v)q(w,s,x,y)else q(w,s,t,u)end end end q(k,nil,nil,nil)return l end
function ae.ShouldSellItem(i)if not i then return false end if ah and i.Equipped
then return false end if next(ai)and c[i.Rarity]and not ai[i.Rarity]then return
false end if next(aj)and i.Type and not aj[i.Type]then return false end local j,
k=ak,al if next(j)==nil then j={[1]=true}k='None'end local l=i.LevelReq or 0 if
k=='Below'then local m for n in pairs(j)do if not m or n>m then m=n end end if m
and l>m then return false end elseif k=='Above'then local m for n in pairs(j)do
if not m or n<m then m=n end end if m and l<m then return false end else if not
j[l]then return false end end return true end function ae.HasAnyFilter()return
next(ai)~=nil or next(aj)~=nil or next(ak)~=nil end function ae.CountMatches()
local i,j=h()if not i then return{total=0,matching=0,error=j or
'Error reading inventory'}end local k,l=0,{}for m,n in ipairs(i)do l[n.Type]=(l[
n.Type]or 0)+1 if ae.ShouldSellItem(n)then k+=1 end end return{total=#i,matching
=k,byCategory=l}end function ae.SellItems()if am then return nil end am=true
local i,j,k={sold=0,skipped=0,gold=0,error=nil},h()if not j then i.error=k or
'Error reading inventory'am=false return i end local l={}for m,n in ipairs(j)do
if ae.ShouldSellItem(n)then if n.Index then i.sold+=1 local o=n.Category or n.
Type l[o]=l[o]or{}table.insert(l[o],n.Index)end else i.skipped+=1 end end local
m,n=pcall(g,l)if m and n and type(n)=='number'then i.gold=n end am=false return
i end function ae.SetLevelReqMode(i)if i=='Below'or i=='Above'then al=i else al=
'None'end end function ae.GetLevelReqMode()return al end function ae.
SetExcludeEquipped(i)ah=i end function ae.GetExcludeEquipped()return ah end
function ae.SetRarityFilter(i)ai={}if type(i)=='table'then for j,k in pairs(i)do
if k==true and type(j)=='string'then local l=e(j)or j ai[l]=true elseif type(k)
=='string'then local l=e(k)or k ai[l]=true end end elseif type(i)=='string'then
local j=e(i)or i ai[j]=true end end function ae.GetRarityFilter()local i={}for j
in pairs(ai)do table.insert(i,j)end return i end function ae.SetTypeFilter(i)aj=
{}if type(i)=='table'then for j,k in pairs(i)do if k==true and type(j)=='string'
then aj[j]=true elseif type(k)=='string'then aj[k]=true end end elseif type(i)==
'string'then aj[i]=true end end function ae.GetTypeFilter()local i={}for j in
pairs(aj)do table.insert(i,j)end return i end function ae.SetLevelReqExactFilter
(i)ak={}if type(i)=='table'then for j,k in pairs(i)do if k==true then local l=
tonumber(j)if l then ak[l]=true end else local l=tonumber(k)if l then ak[l]=true
end end end elseif type(i)=='string'or type(i)=='number'then local j=tonumber(i)
if j then ak[j]=true end end end function ae.GetLevelReqExactFilter()local i={}
for j in pairs(ak)do table.insert(i,tostring(j))end return i end local i=
function()return not ad[game.PlaceId]end local j=function()if not af then return
end if ag then return end if not i()then return end if not ae.HasAnyFilter()then
return end ag=true task.spawn(function()task.wait(2.5)if not af or not i()then
return end local j=ae.SellItems()if j and j.sold and j.sold>0 then ab.Notify(
'AutoSell',('Auto-sold %d item(s) on dungeon start.'):format(j.sold),3)end end)
end function ae.Toggle(k)af=k and true or false if af and i()and not ag then j()
end end function ae.IsEnabled()return af end ac.OnDungeonNameChanged(function(k)
ag=false if k then j()end end)ac.OnLobbyChanged(function(k)if not k then ag=
false j()else ag=false end end)task.spawn(function()while aa.IsActive()do task.
wait(1)if af and i()and not ag then j()end end end)aa.Register(function()af=
false end)ae.LEVEL_REQ_OPTIONS=ap ae.LEVEL_REQ_MODE_OPTIONS=aq return ae