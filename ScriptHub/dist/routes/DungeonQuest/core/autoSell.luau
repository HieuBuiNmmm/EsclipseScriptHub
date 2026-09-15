local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b={cleaned=false,callbacks={}
}function b.Register(c)if type(c)~='function'then return function()end end if b.
cleaned then pcall(c)return function()end end table.insert(b.callbacks,c)return
function()for d,e in ipairs(b.callbacks)do if e==c then table.remove(b.callbacks
,d)break end end end end function b.Cleanup()if b.cleaned then return end b.
cleaned=true for c=#b.callbacks,1,-1 do pcall(b.callbacks[c])end table.clear(b.
callbacks)end function b.IsActive()return not b.cleaned end return b end
function a.b()local b,c={}function b:SetWindow(d)c=d end function b.Notify(d,e,f
)f=f or 3 if c then local g=pcall(function()c:Notify{Title=d,Description=e,
Lifetime=f}end)if g then return end end pcall(function()game:GetService
'StarterGui':SetCore('SendNotification',{Title=d,Text=e,Duration=f})end)end
return b end function a.c()local b,c,d,e=game:GetService'Players',game:
GetService'UserInputService',game:GetService'RunService',game:GetService
'VirtualInputManager'local f=b.LocalPlayer if not f then local g=os.clock()+5
repeat f=b.LocalPlayer if f then break end task.wait(0.1)until os.clock()>g end
return{Players=b,UserInputService=c,RunService=d,VirtualInputManager=e,player=f}
end function a.d()local b,c=a.load'c',a.load'a'local d,e,f,g,h,i,j,k,l,m,n,o,p,q
,r,s,t,u,v,w,x,y,z=b.player,0.05,'enemyProjectiles',0.5,{},false,16,16,true,
false,false,{},0,{},0,{},{},{},{},{},{},0,{}local A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,
P,Q=function()for A=#z,1,-1 do pcall(z[A])end end,{},'unknown',true,{},{},{},0,4
,false local R=function(R)if R then table.insert(G,R)end return R end function h
.OnRespawn(S)table.insert(F,S)end function h.GetLastRespawnTime()return H end
function h.GetRespawnProtectionDuration()return I end function h.
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
end)end table.clear(G)N()end)return h end end local aa,ab,ac,ad,ae,af,ag,ah,ai,
aj,ak,al,am,b,c,d,e,f,g=a.load'a',a.load'b',a.load'd',{[77649408247578]=true,[
115445507767090]=true},{},false,false,true,{},{},{},'None',false,{weapons=
'Weapons',helmets='Helmets',chests='Chests',abilities='Abilities'},{'Common',
'Uncommon','Rare','Epic','Legendary','Mythic'},{'1','5','10','15','20','25','30'
,'35','40','45','50','55','60','65','70','75','80','85','90','95','100','105',
'110','115','120','125','130','135','140','145','150','155','160','165','170',
'175','180','185','190','195','200','205','210','215','220','225','230','235',
'240','245','250','255','260','265','270','275','280','285','290','295','300'},{
'None','Below','Above'},{Common=0,Uncommon=1,Rare=2,Epic=3,Legendary=4,Mythic=5}
,{}for h,i in ipairs(c)do g[i]=true end local h={}for i,j in ipairs(c)do h[
string.lower(j)]=j end local i,j=function(i)if type(i)~='string'then return nil
end return h[string.lower(i)]end,function(i)local j pcall(function()j=game:
GetService'ReplicatedStorage':WaitForChild('remotes',5):WaitForChild(
'sellItemEvent',5)end)if not j then return false,0 end local k={}for l,m in
pairs(i)do if type(m)=='table'and#m>0 then k[l]=m end end if next(k)==nil then
return false,0 end local l=pcall(function()j:FireServer(k)end)if not l then
return false,0 end return true,0 end local k=j function ae.SetSellAction(l)if
type(l)=='function'then k=l end end local l=function()local l,m=pcall(function()
return game:GetService'ReplicatedStorage':WaitForChild('remotes',5):
WaitForChild('reloadInvy',5)end)if not l or not m then return nil,
'Could not find remote reloadInvy'end local n,o=pcall(function()return m:
InvokeServer()end)if not n or o==nil then return nil,'Could not read inventory'
end local p,q,r,s={},{},function(p)return p.sellPrice~=nil or p.UniqueItemID~=
nil or p.rarity~=nil end,function(p)local q=tostring(p)local r=tonumber(q:match
'_(%d+)$')if not r then return nil,nil end local s=q:match'^(.-)_%d+$'return s,r
end local t=function(t,u,v,w)local x=false if type(t.equipped)=='boolean'then x=
t.equipped elseif type(t.equipped)=='table'then for y,z in pairs(t.equipped)do
if z==true then x=true break end end end local y=i(t.rarity)or'Common'table.
insert(p,{Type=b[u]or u or'Unknown',Category=v or u,Index=w,Name=tostring(t.name
or t.UniqueItemID or'?'),Rarity=y,RarityValue=f[y],SellPrice=tonumber(t.
sellPrice)or 0,UniqueItemID=t.UniqueItemID,Equipped=x,LevelReq=tonumber(t.
levelReq)or 0,Raw=t})end local function u(v,w,x,y)if type(v)~='table'then return
end if q[v]then return end q[v]=true if r(v)then t(v,w,x,y)return end for z,A in
pairs(v)do if b[z]then u(A,z,nil,nil)elseif type(A)=='table'and r(A)then local B
,C=s(z)u(A,w,B,C)else u(A,w,x,y)end end end u(o,nil,nil,nil)return p end
function ae.ShouldSellItem(m)if not m then return false end if ah and m.Equipped
then return false end if next(ai)and g[m.Rarity]and not ai[m.Rarity]then return
false end if next(aj)and m.Type and not aj[m.Type]then return false end local n,
o=ak,al if next(n)==nil then n={[1]=true}o='None'end local p=m.LevelReq or 0 if
o=='Below'then local q for r in pairs(n)do if not q or r>q then q=r end end if q
and p>q then return false end elseif o=='Above'then local q for r in pairs(n)do
if not q or r<q then q=r end end if q and p<q then return false end else if not
n[p]then return false end end return true end function ae.HasAnyFilter()return
next(ai)~=nil or next(aj)~=nil or next(ak)~=nil end function ae.CountMatches()
local m,n=l()if not m then return{total=0,matching=0,error=n or
'Error reading inventory'}end local o,p=0,{}for q,r in ipairs(m)do p[r.Type]=(p[
r.Type]or 0)+1 if ae.ShouldSellItem(r)then o+=1 end end return{total=#m,matching
=o,byCategory=p}end function ae.SellItems()if am then return nil end am=true
local m,n,o={sold=0,skipped=0,gold=0,error=nil},l()if not n then m.error=o or
'Error reading inventory'am=false return m end local p={}for q,r in ipairs(n)do
if ae.ShouldSellItem(r)then if r.Index then m.sold+=1 local s=r.Category or r.
Type p[s]=p[s]or{}table.insert(p[s],r.Index)end else m.skipped+=1 end end local
q,r=pcall(k,p)if q and r and type(r)=='number'then m.gold=r end am=false return
m end function ae.SetLevelReqMode(m)if m=='Below'or m=='Above'then al=m else al=
'None'end end function ae.GetLevelReqMode()return al end function ae.
SetExcludeEquipped(m)ah=m end function ae.GetExcludeEquipped()return ah end
function ae.SetRarityFilter(m)ai={}if type(m)=='table'then for n,o in pairs(m)do
if o==true and type(n)=='string'then local p=i(n)or n ai[p]=true elseif type(o)
=='string'then local p=i(o)or o ai[p]=true end end elseif type(m)=='string'then
local n=i(m)or m ai[n]=true end end function ae.GetRarityFilter()local m={}for n
in pairs(ai)do table.insert(m,n)end return m end function ae.SetTypeFilter(m)aj=
{}if type(m)=='table'then for n,o in pairs(m)do if o==true and type(n)=='string'
then aj[n]=true elseif type(o)=='string'then aj[o]=true end end elseif type(m)==
'string'then aj[m]=true end end function ae.GetTypeFilter()local m={}for n in
pairs(aj)do table.insert(m,n)end return m end function ae.SetLevelReqExactFilter
(m)ak={}if type(m)=='table'then for n,o in pairs(m)do if o==true then local p=
tonumber(n)if p then ak[p]=true end else local p=tonumber(o)if p then ak[p]=true
end end end elseif type(m)=='string'or type(m)=='number'then local n=tonumber(m)
if n then ak[n]=true end end end function ae.GetLevelReqExactFilter()local m={}
for n in pairs(ak)do table.insert(m,tostring(n))end return m end local m=
function()return not ad[game.PlaceId]end local n=function()if not af then return
end if ag then return end if not m()then return end if not ae.HasAnyFilter()then
return end ag=true task.spawn(function()task.wait(2.5)if not af or not m()then
return end local n=ae.SellItems()if n and n.sold and n.sold>0 then ab.Notify(
'AutoSell',('Auto-sold %d item(s) on dungeon start.'):format(n.sold),3)end end)
end function ae.Toggle(o)af=o and true or false if af and m()and not ag then n()
end end function ae.IsEnabled()return af end ac.OnDungeonNameChanged(function(o)
ag=false if o then n()end end)ac.OnLobbyChanged(function(o)if not o then ag=
false n()else ag=false end end)task.spawn(function()while aa.IsActive()do task.
wait(1)if af and m()and not ag then n()end end end)aa.Register(function()af=
false end)ae.LEVEL_REQ_OPTIONS=d ae.LEVEL_REQ_MODE_OPTIONS=e return ae