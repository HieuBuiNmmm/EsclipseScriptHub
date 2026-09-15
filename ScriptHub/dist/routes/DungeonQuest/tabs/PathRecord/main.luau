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
function a.d()local aa,ab,ac={},{},false function aa.SetLocked(ad)ac=ad and true
or false end function aa.IsLocked()return ac end function aa.Register(ad,ae,af)
if type(ad)~='string'or type(ae)~='function'or type(af)~='function'then return
end ab[ad]={setEnabled=ae,isEnabled=af}end function aa.EnableExclusive(ad)if ac
then return end for ae,af in pairs(ab)do if ae~=ad and af.isEnabled()then pcall(
af.setEnabled,false)end end end function aa.IsEnabled(ad)local ae=ab[ad]return
ae~=nil and ae.isEnabled()end return aa end function a.e()local aa,ab={}function
aa:SetWindow(ac)ab=ac end function aa.Notify(ac,ad,ae)ae=ae or 3 if ab then
local af=pcall(function()ab:Notify{Title=ac,Description=ad,Lifetime=ae}end)if af
then return end end pcall(function()game:GetService'StarterGui':SetCore(
'SendNotification',{Title=ac,Text=ad,Duration=ae})end)end return aa end function
a.f()local aa={Options={},Folder='Maclib',contextData={},GetService=function(aa)
return cloneref and cloneref(game:GetService(aa))or game:GetService(aa)end}local
ab,ac,ad,ae,af,ag,ah=aa.GetService'TweenService',aa.GetService'RunService',aa.
GetService'HttpService',aa.GetService'ContentProvider',aa.GetService
'UserInputService',aa.GetService'Lighting',aa.GetService'Players'local ai,aj,ak,
al,am,an,ao,b,c,d=ac:IsStudio(),ah.LocalPlayer,{},0,false,{interFont=
'rbxassetid://12187365364',userInfoBlurred='rbxassetid://18824089198',
toggleBackground='rbxassetid://18772190202',togglerHead=
'rbxassetid://18772309008',buttonImage='rbxassetid://10709791437',searchIcon=
'rbxassetid://86737463322606',colorWheel='rbxassetid://2849458409',colorTarget=
'rbxassetid://73265255323268',grid='rbxassetid://121484455191370',globe=
'rbxassetid://108952102602834',transform='rbxassetid://90336395745819',dropdown=
'rbxassetid://18865373378',sliderbar='rbxassetid://18772615246',sliderhead=
'rbxassetid://18772834246'}local e,f=function()local e=Instance.new'ScreenGui'e.
ScreenInsets=Enum.ScreenInsets.None e.ResetOnSpawn=false e.ZIndexBehavior=Enum.
ZIndexBehavior.Sibling e.DisplayOrder=2147483647 local f=ac:IsStudio()and aj:
FindFirstChild'PlayerGui'or(gethui and gethui())or(cloneref and cloneref(aa.
GetService'CoreGui')or aa.GetService'CoreGui')e.Parent=f return e end,function(e
,f,g)return ab:Create(e,f,g)end function aa:Window(g)local h={Settings=g}if g.
AcrylicBlur~=nil then b=g.AcrylicBlur else b=true end local i,j=e(),Instance.new
'Frame'j.Name='Notifications'j.BackgroundColor3=Color3.fromRGB(255,255,255)j.
BackgroundTransparency=1 j.BorderColor3=Color3.fromRGB(0,0,0)j.BorderSizePixel=0
j.Size=UDim2.fromScale(1,1)j.Parent=i j.ZIndex=2 local k=Instance.new
'UIListLayout'k.Name='NotificationsUIListLayout'k.Padding=UDim.new(0,10)k.
HorizontalAlignment=Enum.HorizontalAlignment.Right k.SortOrder=Enum.SortOrder.
LayoutOrder k.VerticalAlignment=Enum.VerticalAlignment.Bottom k.Parent=j local l
=Instance.new'UIPadding'l.Name='NotificationsUIPadding'l.PaddingBottom=UDim.new(
0,10)l.PaddingLeft=UDim.new(0,10)l.PaddingRight=UDim.new(0,10)l.PaddingTop=UDim.
new(0,10)l.Parent=j local m=Instance.new'Frame'm.Name='Base'm.AnchorPoint=
Vector2.new(0.5,0.5)m.BackgroundColor3=Color3.fromRGB(15,15,15)m.
BackgroundTransparency=g.AcrylicBlur and 0.05 or 0 m.BorderColor3=Color3.
fromRGB(0,0,0)m.BorderSizePixel=0 m.Position=UDim2.fromScale(0.5,0.5)m.Size=g.
Size or UDim2.fromOffset(868,650)local n=Instance.new'UIScale'n.Name=
'BaseUIScale'n.Parent=m local o=Instance.new'UICorner'o.Name='BaseUICorner'o.
CornerRadius=UDim.new(0,10)o.Parent=m local p=Instance.new'UIStroke'p.Name=
'BaseUIStroke'p.ApplyStrokeMode=Enum.ApplyStrokeMode.Border p.Color=Color3.
fromRGB(255,255,255)p.Transparency=0.9 p.Parent=m local q=Instance.new'Frame'q.
Name='Sidebar'q.BackgroundColor3=Color3.fromRGB(255,255,255)q.
BackgroundTransparency=1 q.BorderColor3=Color3.fromRGB(0,0,0)q.BorderSizePixel=0
q.Position=UDim2.fromScale(-3.5199999999999996E-8,4.69e-8)q.Size=g.SidebarWidth
and UDim2.new(0,g.SidebarWidth,1,0)or UDim2.fromScale(0.325,1)local r=Instance.
new'Frame'r.Name='Divider'r.AnchorPoint=Vector2.new(1,0)r.BackgroundColor3=
Color3.fromRGB(255,255,255)r.BackgroundTransparency=0.9 r.BorderColor3=Color3.
fromRGB(0,0,0)r.BorderSizePixel=0 r.Position=UDim2.fromScale(1,0)r.Size=UDim2.
new(0,1,1,0)r.Parent=q local s=Instance.new'TextButton's.Name='DividerInteract's
.AnchorPoint=Vector2.new(0.5,0)s.BackgroundColor3=Color3.fromRGB(255,255,255)s.
BackgroundTransparency=1 s.BorderColor3=Color3.fromRGB(0,0,0)s.BorderSizePixel=0
s.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json's.Position=
UDim2.fromScale(0.5,0)s.Size=UDim2.new(1,6,1,0)s.Text=''s.TextColor3=Color3.
fromRGB(0,0,0)s.TextSize=14 s.Parent=r local t=Instance.new'Frame't.Name=
'WindowControls't.BackgroundColor3=Color3.fromRGB(255,255,255)t.
BackgroundTransparency=1 t.BorderColor3=Color3.fromRGB(0,0,0)t.BorderSizePixel=0
t.Size=UDim2.new(1,0,0,31)local u=Instance.new'Frame'u.Name='Controls'u.
BackgroundColor3=Color3.fromRGB(119,174,94)u.BackgroundTransparency=1 u.
BorderColor3=Color3.fromRGB(0,0,0)u.BorderSizePixel=0 u.Size=UDim2.fromScale(1,1
)local v=Instance.new'UIListLayout'v.Name='UIListLayout'v.Padding=UDim.new(0,5)v
.FillDirection=Enum.FillDirection.Horizontal v.SortOrder=Enum.SortOrder.
LayoutOrder v.VerticalAlignment=Enum.VerticalAlignment.Center v.Parent=u local w
=Instance.new'UIPadding'w.Name='UIPadding'w.PaddingLeft=UDim.new(0,11)w.Parent=u
local x,y={sizes={enabled=UDim2.fromOffset(8,8),disabled=UDim2.fromOffset(7,7)},
transparencies={enabled=0,disabled=1},strokeTransparency=0.9},Instance.new
'UIStroke'y.Name='BaseUIStroke'y.ApplyStrokeMode=Enum.ApplyStrokeMode.Border y.
Color=Color3.fromRGB(255,255,255)y.Transparency=x.strokeTransparency local z=
Instance.new'TextButton'z.Name='Exit'z.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'z.Text=''z.TextColor3=Color3.
fromRGB(0,0,0)z.TextSize=14 z.AutoButtonColor=false z.BackgroundColor3=Color3.
fromRGB(250,93,86)z.BorderColor3=Color3.fromRGB(0,0,0)z.BorderSizePixel=0 local
A=Instance.new'UICorner'A.Name='UICorner'A.CornerRadius=UDim.new(1,0)A.Parent=z
z.Parent=u local B=Instance.new'TextButton'B.Name='Minimize'B.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'B.Text=''B.TextColor3=Color3.
fromRGB(0,0,0)B.TextSize=14 B.AutoButtonColor=false B.BackgroundColor3=Color3.
fromRGB(252,190,57)B.BorderColor3=Color3.fromRGB(0,0,0)B.BorderSizePixel=0 B.
LayoutOrder=1 local C=Instance.new'UICorner'C.Name='UICorner'C.CornerRadius=UDim
.new(1,0)C.Parent=B B.Parent=u local D=Instance.new'TextButton'D.Name='Maximize'
D.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'D.Text=''D.
TextColor3=Color3.fromRGB(0,0,0)D.TextSize=14 D.AutoButtonColor=false D.
BackgroundColor3=Color3.fromRGB(119,174,94)D.BorderColor3=Color3.fromRGB(0,0,0)D
.BorderSizePixel=0 D.LayoutOrder=1 local E=Instance.new'UICorner'E.Name=
'UICorner'E.CornerRadius=UDim.new(1,0)E.Parent=D D.Parent=u local F=function(F,G
)local H,I=G and x.sizes.enabled or x.sizes.disabled,G and x.transparencies.
enabled or x.transparencies.disabled F.Size=H F.BackgroundTransparency=I F.
Active=G F.Interactable=G for J,K in ipairs(F:GetChildren())do if K:IsA
'UIStroke'then K.Transparency=I end end if not G then y:Clone().Parent=F end end
F(D,false)local G={z,B}for H,I in pairs(G)do local J,K=I.Name,true if g.
DisabledWindowControls and table.find(g.DisabledWindowControls,J)then K=false
end F(I,K)end u.Parent=t local H=Instance.new'Frame'H.Name='Divider'H.
AnchorPoint=Vector2.new(0,1)H.BackgroundColor3=Color3.fromRGB(255,255,255)H.
BackgroundTransparency=0.9 H.BorderColor3=Color3.fromRGB(0,0,0)H.BorderSizePixel
=0 H.Position=UDim2.fromScale(0,1)H.Size=UDim2.new(1,0,0,1)H.Parent=t t.Parent=q
local I=Instance.new'Frame'I.Name='Information'I.BackgroundColor3=Color3.
fromRGB(255,255,255)I.BackgroundTransparency=1 I.BorderColor3=Color3.fromRGB(0,0
,0)I.BorderSizePixel=0 I.Position=UDim2.fromOffset(0,31)I.Size=UDim2.new(1,0,0,
60)local J=Instance.new'Frame'J.Name='Divider'J.AnchorPoint=Vector2.new(0,1)J.
BackgroundColor3=Color3.fromRGB(255,255,255)J.BackgroundTransparency=0.9 J.
BorderColor3=Color3.fromRGB(0,0,0)J.BorderSizePixel=0 J.Position=UDim2.
fromScale(0,1)J.Size=UDim2.new(1,0,0,1)J.Parent=I local K=Instance.new'Frame'K.
Name='InformationHolder'K.BackgroundColor3=Color3.fromRGB(255,255,255)K.
BackgroundTransparency=1 K.BorderColor3=Color3.fromRGB(0,0,0)K.BorderSizePixel=0
K.Size=UDim2.fromScale(1,1)local L=Instance.new'UIPadding'L.Name=
'InformationHolderUIPadding'L.PaddingBottom=UDim.new(0,10)L.PaddingLeft=UDim.
new(0,23)L.PaddingRight=UDim.new(0,22)L.PaddingTop=UDim.new(0,10)L.Parent=K
local M=Instance.new'ImageButton'M.Name='GlobalSettingsButton'M.Image=an.globe M
.ImageTransparency=0.5 M.AnchorPoint=Vector2.new(1,0.5)M.BackgroundColor3=Color3
.fromRGB(255,255,255)M.BackgroundTransparency=1 M.BorderColor3=Color3.fromRGB(0,
0,0)M.BorderSizePixel=0 M.Position=UDim2.fromScale(1,0.5)M.Size=UDim2.
fromOffset(16,16)M.Parent=K local N=function(N)if N=='Default'then f(M,TweenInfo
.new(0.2,Enum.EasingStyle.Sine),{ImageTransparency=0.5}):Play()elseif N=='Hover'
then f(M,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{ImageTransparency=0.3}):Play(
)end end M.MouseEnter:Connect(function()N'Hover'end)M.MouseLeave:Connect(
function()N'Default'end)local O=Instance.new'Frame'O.Name='TitleFrame'O.
BackgroundColor3=Color3.fromRGB(255,255,255)O.BackgroundTransparency=1 O.
BorderColor3=Color3.fromRGB(0,0,0)O.BorderSizePixel=0 O.Size=UDim2.fromScale(1,1
)local P=Instance.new'TextLabel'P.Name='Title'P.FontFace=Font.new(an.interFont,
Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)P.Text=g.Title P.TextColor3=
Color3.fromRGB(255,255,255)P.RichText=true P.TextSize=18 P.TextTransparency=0.1
P.TextTruncate=Enum.TextTruncate.SplitWord P.TextXAlignment=Enum.TextXAlignment.
Left P.TextYAlignment=Enum.TextYAlignment.Top P.AutomaticSize=Enum.AutomaticSize
.Y P.BackgroundColor3=Color3.fromRGB(255,255,255)P.BackgroundTransparency=1 P.
BorderColor3=Color3.fromRGB(0,0,0)P.BorderSizePixel=0 P.Size=UDim2.new(1,-20,0,0
)P.Parent=O local Q=Instance.new'TextLabel'Q.Name='Subtitle'Q.FontFace=Font.new(
an.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)Q.RichText=true Q.Text
=g.Subtitle Q.RichText=true Q.TextColor3=Color3.fromRGB(255,255,255)Q.TextSize=
12 Q.TextTransparency=0.7 Q.TextTruncate=Enum.TextTruncate.SplitWord Q.
TextXAlignment=Enum.TextXAlignment.Left Q.TextYAlignment=Enum.TextYAlignment.Top
Q.AutomaticSize=Enum.AutomaticSize.Y Q.BackgroundColor3=Color3.fromRGB(255,255,
255)Q.BackgroundTransparency=1 Q.BorderColor3=Color3.fromRGB(0,0,0)Q.
BorderSizePixel=0 Q.LayoutOrder=1 Q.Size=UDim2.new(1,-20,0,0)Q.Parent=O local R=
Instance.new'UIListLayout'R.Name='TitleFrameUIListLayout'R.Padding=UDim.new(0,3)
R.SortOrder=Enum.SortOrder.LayoutOrder R.VerticalAlignment=Enum.
VerticalAlignment.Center R.Parent=O O.Parent=K K.Parent=I I.Parent=q local S=
Instance.new'Frame'S.Name='SidebarGroup'S.BackgroundColor3=Color3.fromRGB(255,
255,255)S.BackgroundTransparency=1 S.BorderColor3=Color3.fromRGB(0,0,0)S.
BorderSizePixel=0 S.Position=UDim2.fromOffset(0,91)S.Size=UDim2.new(1,0,1,-91)
local T=Instance.new'Frame'T.Name='UserInfo'T.AnchorPoint=Vector2.new(0,1)T.
BackgroundColor3=Color3.fromRGB(255,255,255)T.BackgroundTransparency=1 T.
BorderColor3=Color3.fromRGB(0,0,0)T.BorderSizePixel=0 T.Position=UDim2.
fromScale(0,1)T.Size=UDim2.new(1,0,0,107)local U=Instance.new'Frame'U.Name=
'InformationGroup'U.BackgroundColor3=Color3.fromRGB(255,255,255)U.
BackgroundTransparency=1 U.BorderColor3=Color3.fromRGB(0,0,0)U.BorderSizePixel=0
U.Size=UDim2.fromScale(1,1)local V=Instance.new'UIPadding'V.Name=
'InformationGroupUIPadding'V.PaddingBottom=UDim.new(0,17)V.PaddingLeft=UDim.new(
0,25)V.Parent=U local W=Instance.new'UIListLayout'W.Name=
'InformationGroupUIListLayout'W.FillDirection=Enum.FillDirection.Horizontal W.
SortOrder=Enum.SortOrder.LayoutOrder W.VerticalAlignment=Enum.VerticalAlignment.
Center W.Parent=U local X,Y,Z=aj.UserId,Enum.ThumbnailType.AvatarBust,Enum.
ThumbnailSize.Size48x48 local _,ap=ah:GetUserThumbnailAsync(X,Y,Z)local aq=
Instance.new'ImageLabel'aq.Name='Headshot'aq.BackgroundColor3=Color3.fromRGB(255
,255,255)aq.BackgroundTransparency=1 aq.BorderColor3=Color3.fromRGB(0,0,0)aq.
BorderSizePixel=0 aq.Size=UDim2.fromOffset(32,32)aq.Image=(ap and _)or
'rbxassetid://0'local ar=Instance.new'UICorner'ar.Name='UICorner'ar.CornerRadius
=UDim.new(1,0)ar.Parent=aq local as=Instance.new'UIStroke'as.Name='BaseUIStroke'
as.ApplyStrokeMode=Enum.ApplyStrokeMode.Border as.Color=Color3.fromRGB(255,255,
255)as.Transparency=0.9 as.Parent=aq aq.Parent=U local at=Instance.new'Frame'at.
Name='UserAndDisplayFrame'at.BackgroundColor3=Color3.fromRGB(255,255,255)at.
BackgroundTransparency=1 at.BorderColor3=Color3.fromRGB(0,0,0)at.BorderSizePixel
=0 at.LayoutOrder=1 at.Size=UDim2.new(1,-42,0,32)local au=Instance.new
'TextLabel'au.Name='DisplayName'au.FontFace=Font.new(an.interFont,Enum.
FontWeight.SemiBold,Enum.FontStyle.Normal)au.Text=aj.DisplayName au.TextColor3=
Color3.fromRGB(255,255,255)au.TextSize=13 au.TextTransparency=0.1 au.
TextTruncate=Enum.TextTruncate.SplitWord au.TextXAlignment=Enum.TextXAlignment.
Left au.TextYAlignment=Enum.TextYAlignment.Top au.AutomaticSize=Enum.
AutomaticSize.XY au.BackgroundColor3=Color3.fromRGB(255,255,255)au.
BackgroundTransparency=1 au.BorderColor3=Color3.fromRGB(0,0,0)au.BorderSizePixel
=0 au.Parent=at au.Size=UDim2.fromScale(1,0)local av=Instance.new'UIPadding'av.
Name='UserAndDisplayFrameUIPadding'av.PaddingLeft=UDim.new(0,8)av.PaddingTop=
UDim.new(0,3)av.Parent=at local aw=Instance.new'UIListLayout'aw.Name=
'UserAndDisplayFrameUIListLayout'aw.Padding=UDim.new(0,1)aw.SortOrder=Enum.
SortOrder.LayoutOrder aw.Parent=at local ax=Instance.new'TextLabel'ax.Name=
'Username'ax.FontFace=Font.new(an.interFont,Enum.FontWeight.SemiBold,Enum.
FontStyle.Normal)ax.Text='@'..aj.Name ax.TextColor3=Color3.fromRGB(255,255,255)
ax.TextSize=12 ax.TextTransparency=0.7 ax.TextTruncate=Enum.TextTruncate.
SplitWord ax.TextXAlignment=Enum.TextXAlignment.Left ax.TextYAlignment=Enum.
TextYAlignment.Top ax.AutomaticSize=Enum.AutomaticSize.XY ax.BackgroundColor3=
Color3.fromRGB(255,255,255)ax.BackgroundTransparency=1 ax.BorderColor3=Color3.
fromRGB(0,0,0)ax.BorderSizePixel=0 ax.LayoutOrder=1 ax.Parent=at ax.Size=UDim2.
fromScale(1,0)at.Parent=U U.Parent=T local ay=Instance.new'UIPadding'ay.Name=
'UserInfoUIPadding'ay.PaddingLeft=UDim.new(0,10)ay.PaddingRight=UDim.new(0,10)ay
.Parent=T T.Parent=S local az=Instance.new'UIPadding'az.Name=
'SidebarGroupUIPadding'az.PaddingLeft=UDim.new(0,10)az.PaddingRight=UDim.new(0,
10)az.PaddingTop=UDim.new(0,31)az.Parent=S local aA=Instance.new'Frame'aA.Name=
'TabSwitchers'aA.BackgroundColor3=Color3.fromRGB(255,255,255)aA.
BackgroundTransparency=1 aA.BorderColor3=Color3.fromRGB(0,0,0)aA.BorderSizePixel
=0 aA.Size=UDim2.new(1,0,1,-107)local aB=Instance.new'ScrollingFrame'aB.Name=
'TabSwitchersScrollingFrame'aB.AutomaticCanvasSize=Enum.AutomaticSize.Y aB.
BottomImage=''aB.CanvasSize=UDim2.new()aB.ScrollBarImageTransparency=0.8 aB.
ScrollBarThickness=1 aB.TopImage=''aB.BackgroundColor3=Color3.fromRGB(255,255,
255)aB.BackgroundTransparency=1 aB.BorderColor3=Color3.fromRGB(0,0,0)aB.
BorderSizePixel=0 aB.Size=UDim2.fromScale(1,1)local aC=Instance.new
'UIListLayout'aC.Name='TabSwitchersScrollingFrameUIListLayout'aC.Padding=UDim.
new(0,17)aC.SortOrder=Enum.SortOrder.LayoutOrder aC.Parent=aB local aD=Instance.
new'UIPadding'aD.Name='TabSwitchersScrollingFrameUIPadding'aD.PaddingTop=UDim.
new(0,2)aD.Parent=aB aB.Parent=aA aA.Parent=S S.Parent=q q.Parent=m local aE=
Instance.new'Frame'aE.Name='Content'aE.AnchorPoint=Vector2.new(1,0)aE.
BackgroundColor3=Color3.fromRGB(255,255,255)aE.BackgroundTransparency=1 aE.
BorderColor3=Color3.fromRGB(0,0,0)aE.BorderSizePixel=0 aE.Position=UDim2.
fromScale(1,4.69e-8)aE.Size=UDim2.new(0,(m.AbsoluteSize.X-q.AbsoluteSize.X),1,0)
local aF,aG,aH,aI,aJ,aK=false,q.AbsoluteSize.X,20,107 local aL,aM=m.AbsoluteSize
.X-aI,{DefaultTransparency=0.9,HoverTransparency=0.85,EasingStyle=Enum.
EasingStyle.Sine}local aN=function(aN)f(r,TweenInfo.new(0.2,aM.EasingStyle),{
BackgroundTransparency=aN=='Idle'and aM.DefaultTransparency or aM.
HoverTransparency}):Play()end s.MouseEnter:Connect(function()aN'Hover'end)s.
MouseLeave:Connect(function()aN'Idle'end)s.MouseButton1Down:Connect(function()aF
=true aJ=af:GetMouseLocation().X aK=q.AbsoluteSize.X end)af.InputEnded:Connect(
function(aO)if aO.UserInputType==Enum.UserInputType.MouseButton1 then aF=false
end end)af.InputChanged:Connect(function(aO)if aF and aO.UserInputType==Enum.
UserInputType.MouseMovement then local aP=af:GetMouseLocation().X-aJ local aQ=aK
+aP if math.abs(aQ-aG)<aH then aQ=aG else aQ=math.clamp(aQ,aI,aL)end q.Size=
UDim2.new(0,aQ,1,0)aE.Size=UDim2.new(0,m.AbsoluteSize.X-aQ,1,0)end end)local aO=
Instance.new'Frame'aO.Name='Topbar'aO.BackgroundColor3=Color3.fromRGB(255,255,
255)aO.BackgroundTransparency=1 aO.BorderColor3=Color3.fromRGB(0,0,0)aO.
BorderSizePixel=0 aO.Size=UDim2.new(1,0,0,63)local aP=Instance.new'Frame'aP.Name
='Divider'aP.AnchorPoint=Vector2.new(0,1)aP.BackgroundColor3=Color3.fromRGB(255,
255,255)aP.BackgroundTransparency=0.9 aP.BorderColor3=Color3.fromRGB(0,0,0)aP.
BorderSizePixel=0 aP.Position=UDim2.fromScale(0,1)aP.Size=UDim2.new(1,0,0,1)aP.
Parent=aO local aQ=Instance.new'Frame'aQ.Name='Elements'aQ.BackgroundColor3=
Color3.fromRGB(255,255,255)aQ.BackgroundTransparency=1 aQ.BorderColor3=Color3.
fromRGB(0,0,0)aQ.BorderSizePixel=0 aQ.Size=UDim2.fromScale(1,1)local aR=Instance
.new'UIPadding'aR.Name='UIPadding'aR.PaddingLeft=UDim.new(0,20)aR.PaddingRight=
UDim.new(0,20)aR.Parent=aQ local aS=Instance.new'ImageButton'aS.Name='MoveIcon'
aS.Image=an.transform aS.ImageTransparency=0.7 aS.AnchorPoint=Vector2.new(1,0.5)
aS.BackgroundColor3=Color3.fromRGB(255,255,255)aS.BackgroundTransparency=1 aS.
BorderColor3=Color3.fromRGB(0,0,0)aS.BorderSizePixel=0 aS.Position=UDim2.
fromScale(1,0.5)aS.Size=UDim2.fromOffset(15,15)aS.Parent=aQ aS.Visible=not g.
DragStyle or g.DragStyle==1 local aT=Instance.new'TextButton'aT.Name='Interact'
aT.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'aT.Text=''aT.
TextColor3=Color3.fromRGB(0,0,0)aT.TextSize=14 aT.AnchorPoint=Vector2.new(0.5,
0.5)aT.BackgroundColor3=Color3.fromRGB(255,255,255)aT.BackgroundTransparency=1
aT.BorderColor3=Color3.fromRGB(0,0,0)aT.BorderSizePixel=0 aT.Position=UDim2.
fromScale(0.5,0.5)aT.Size=UDim2.fromOffset(40,40)aT.Parent=aS local aU=function(
aU)if aU=='Default'then f(aS,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
ImageTransparency=0.7}):Play()elseif aU=='Hover'then f(aS,TweenInfo.new(0.2,Enum
.EasingStyle.Sine),{ImageTransparency=0.4}):Play()end end aT.MouseEnter:Connect(
function()aU'Hover'end)aT.MouseLeave:Connect(function()aU'Default'end)local aV,
aW,aX,aY=false local aZ,a_,a0=function(aZ)local a_=aZ.Position-aX m.Position=
UDim2.new(aY.X.Scale,aY.X.Offset+a_.X,aY.Y.Scale,aY.Y.Offset+a_.Y)end,function(
aZ)if aZ.UserInputType==Enum.UserInputType.MouseButton1 or aZ.UserInputType==
Enum.UserInputType.Touch then aV=true aX=aZ.Position aY=m.Position aZ.Changed:
Connect(function()if aZ.UserInputState==Enum.UserInputState.End then aV=false
end end)end end,function(aZ)if aV and(aZ.UserInputType==Enum.UserInputType.
MouseMovement or aZ.UserInputType==Enum.UserInputType.Touch)then aW=aZ end end
if not g.DragStyle or g.DragStyle==1 then aT.InputBegan:Connect(function(a1)if
a1.UserInputType==Enum.UserInputType.MouseButton1 or a1.UserInputType==Enum.
UserInputType.Touch then a_(a1)end end)aT.InputChanged:Connect(a0)af.
InputChanged:Connect(function(a1)if a1==aW and aV then aZ(a1)end end)aT.
InputEnded:Connect(function(a1)if a1.UserInputType==Enum.UserInputType.
MouseButton1 or a1.UserInputType==Enum.UserInputType.Touch then aV=false end end
)elseif g.DragStyle==2 then m.InputBegan:Connect(function(a1)if a1.UserInputType
==Enum.UserInputType.MouseButton1 or a1.UserInputType==Enum.UserInputType.Touch
then a_(a1)end end)m.InputChanged:Connect(a0)af.InputChanged:Connect(function(a1
)if a1==aW and aV then aZ(a1)end end)m.InputEnded:Connect(function(a1)if a1.
UserInputType==Enum.UserInputType.MouseButton1 or a1.UserInputType==Enum.
UserInputType.Touch then aV=false end end)end local a1=Instance.new'TextLabel'a1
.Name='CurrentTab'a1.FontFace=Font.new(an.interFont)a1.RichText=true a1.Text=''
a1.RichText=true a1.TextColor3=Color3.fromRGB(255,255,255)a1.TextSize=15 a1.
TextTransparency=0.5 a1.TextTruncate=Enum.TextTruncate.SplitWord a1.
TextXAlignment=Enum.TextXAlignment.Left a1.TextYAlignment=Enum.TextYAlignment.
Top a1.AnchorPoint=Vector2.new(0,0.5)a1.AutomaticSize=Enum.AutomaticSize.Y a1.
BackgroundColor3=Color3.fromRGB(255,255,255)a1.BackgroundTransparency=1 a1.
BorderColor3=Color3.fromRGB(0,0,0)a1.BorderSizePixel=0 a1.Position=UDim2.
fromScale(0,0.5)a1.Size=UDim2.fromScale(0.9,0)a1.Parent=aQ aQ.Parent=aO aO.
Parent=aE aE.Parent=m local a2=Instance.new'Frame'a2.Name='GlobalSettings'a2.
AutomaticSize=Enum.AutomaticSize.XY a2.BackgroundColor3=Color3.fromRGB(15,15,15)
a2.BorderColor3=Color3.fromRGB(0,0,0)a2.BorderSizePixel=0 a2.Position=UDim2.
fromScale(0.298,0.104)local a3=Instance.new'UIStroke'a3.Name=
'GlobalSettingsUIStroke'a3.ApplyStrokeMode=Enum.ApplyStrokeMode.Border a3.Color=
Color3.fromRGB(255,255,255)a3.Transparency=0.9 a3.Parent=a2 local a4=Instance.
new'UICorner'a4.Name='GlobalSettingsUICorner'a4.CornerRadius=UDim.new(0,10)a4.
Parent=a2 local a5=Instance.new'UIPadding'a5.Name='GlobalSettingsUIPadding'a5.
PaddingBottom=UDim.new(0,10)a5.PaddingTop=UDim.new(0,10)a5.Parent=a2 local a6=
Instance.new'UIListLayout'a6.Name='GlobalSettingsUIListLayout'a6.Padding=UDim.
new(0,5)a6.SortOrder=Enum.SortOrder.LayoutOrder a6.Parent=a2 local a7=Instance.
new'UIScale'a7.Name='GlobalSettingsUIScale'a7.Scale=1e-7 a7.Parent=a2 a2.Parent=
m m.Parent=i function h:UpdateTitle(a8)P.Text=a8 end function h:UpdateSubtitle(
a8)Q.Text=a8 end local a8,a9=a7.Scale==1 and true or false local ba=function()if
not a8 then local ba=f(a7,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=1})ba:Play()ba.Completed:Wait()a8=true elseif a8
then local ba=f(a7,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=0})ba:Play()ba.Completed:Wait()a8=false end end M.
MouseButton1Click:Connect(function()if not c then return end ba()end)a2.
MouseEnter:Connect(function()a9=true end)a2.MouseLeave:Connect(function()a9=
false end)af.InputEnded:Connect(function(bb)if bb.UserInputType==Enum.
UserInputType.MouseButton1 and a8 and not a9 then ba()end end)local bb,bc,bd,be,
bf=m,ad,workspace.CurrentCamera,'Glass',{}local bg,bh=(bc:GenerateGUID(true))for
bi,bj in pairs(ag:GetChildren())do if not bj:IsA'DepthOfFieldEffect'and bj:
HasTag'.'then bh=Instance.new'DepthOfFieldEffect'bh.FarIntensity=0 bh.
FocusDistance=51.6 bh.InFocusRadius=50 bh.NearIntensity=1 bh.Name=bc:
GenerateGUID(true)bh:AddTag'.'elseif bj:IsA'DepthOfFieldEffect'and bj:HasTag'.'
then bh=bj end end if not bh then bh=Instance.new'DepthOfFieldEffect'bh.
FarIntensity=0 bh.FocusDistance=51.6 bh.InFocusRadius=50 bh.NearIntensity=1 bh.
Name=bc:GenerateGUID(true)bh:AddTag'.'end local bi=Instance.new'Frame'bi.Parent=
bb bi.Size=UDim2.new(0.97,0,0.97,0)bi.Position=UDim2.new(0.5,0,0.5,0)bi.
AnchorPoint=Vector2.new(0.5,0.5)bi.BackgroundTransparency=1 bi.Name=bc:
GenerateGUID(true)do local bj=function(bj)return bj==bj end local bk=bj(bd:
ScreenPointToRay(0,0).Origin.x)while not bk do ac.RenderStepped:Wait()bk=bj(bd:
ScreenPointToRay(0,0).Origin.x)end end local bj do local bk,bl,bm,bn,bo=math.
acos,math.max,math.pi,math.sqrt,0.2 local bp=function(bp,bq,br,bs,bt)local bu,bv
,bw=(bp-bq).magnitude,(bq-br).magnitude,(br-bp).magnitude local bx,by,bz,bA=(bl(
bu,bv,bw))if bu==bx then by,bz,bA=bp,bq,br elseif bv==bx then by,bz,bA=bq,br,bp
elseif bw==bx then by,bz,bA=br,bp,bq end local bB=((bz-by).x*(bA-by).x+(bz-by).y
*(bA-by).y+(bz-by).z*(bA-by).z)/(by-bz).magnitude local bC,bD,bE,bF=bn((bA-by).
magnitude^2-bB*bB),(by-bz).magnitude-bB,CFrame.new(bz,by),CFrame.Angles(bm/2,0,0
)local bG=bE local bH,bI=(bG*bF).lookVector,by+CFrame.new(by,bz).lookVector*bB
local bJ=CFrame.new(bI,bA).lookVector local bK=bH.x*bJ.x+bH.y*bJ.y+bH.z*bJ.z
local bL=CFrame.Angles(0,0,bk(bK))bG=bG*bL if((bG*bF).lookVector-bJ).magnitude>
0.01 then bG=bG*CFrame.Angles(0,0,-2*bk(bK))end bG=bG*CFrame.new(0,bC/2,-(bD+bB/
2))local bM=bE*bL*CFrame.Angles(0,bm,0)if((bM*bF).lookVector-bJ).magnitude>0.01
then bM=bM*CFrame.Angles(0,0,2*bk(bK))end bM=bM*CFrame.new(0,bC/2,bD/2)if not bs
then bs=Instance.new'Part'bs.FormFactor='Custom'bs.TopSurface=0 bs.BottomSurface
=0 bs.Anchored=true bs.CanCollide=false bs.CastShadow=false bs.Material=be bs.
Size=Vector3.new(bo,bo,bo)bs.Name=bc:GenerateGUID(true)local bN=Instance.new(
'SpecialMesh',bs)bN.MeshType=2 bN.Name=bg end bs[bg].Scale=Vector3.new(0,bC/bo,
bB/bo)bs.CFrame=bG if not bt then bt=bs:clone()end bt[bg].Scale=Vector3.new(0,bC
/bo,bD/bo)bt.CFrame=bM return bs,bt end function bj(bq,br,bs,bt,bu)bu[1],bu[2]=
bp(bq,br,bs,bu[1],bu[2])bu[3],bu[4]=bp(bs,br,bt,bu[3],bu[4])end end if bf[bi]
then return bf[bi].parts end local bk,bl={},{}do local function bm(bn)if bn:IsA
'GuiObject'then bl[#bl+1]=bn bm(bn.Parent)end end bm(bi)end local bm=function(bm
)while bm do if bm:IsA'GuiObject'then if not bm.Visible then return false end
elseif bm:IsA'ScreenGui'then if not bm.Enabled then return false end break end
bm=bm.Parent end return true end local bn=function(bn)if not bm(bi)or not b or
am then for bo,bp in pairs(bk)do bp.Parent=nil bh.Enabled=false bh.Parent=nil
end return end if not bh.Parent then bh.Parent=ag end bh.Enabled=true local bo,
bp,bq,br={Transparency=0.98,BrickColor=BrickColor.new'Institutional white'},1-
0.05*bi.ZIndex,bi.AbsolutePosition,bi.AbsolutePosition+bi.AbsoluteSize local bs,
bt=Vector2.new(br.x,bq.y),Vector2.new(bq.x,br.y)do local bu=0 for bv,bw in
ipairs(bl)do bu=bu+bw.Rotation end if bu~=0 and bu%180~=0 then local bv,bw,bx=bq
:lerp(br,0.5),math.sin(math.rad(bu)),math.cos(math.rad(bu))bq=Vector2.new(bx*(bq
.x-bv.x)-bw*(bq.y-bv.y),bw*(bq.x-bv.x)+bx*(bq.y-bv.y))+bv bs=Vector2.new(bx*(bs.
x-bv.x)-bw*(bs.y-bv.y),bw*(bs.x-bv.x)+bx*(bs.y-bv.y))+bv bt=Vector2.new(bx*(bt.x
-bv.x)-bw*(bt.y-bv.y),bw*(bt.x-bv.x)+bx*(bt.y-bv.y))+bv br=Vector2.new(bx*(br.x-
bv.x)-bw*(br.y-bv.y),bw*(br.x-bv.x)+bx*(br.y-bv.y))+bv end end bj(bd:
ScreenPointToRay(bq.x,bq.y,bp).Origin,bd:ScreenPointToRay(bs.x,bs.y,bp).Origin,
bd:ScreenPointToRay(bt.x,bt.y,bp).Origin,bd:ScreenPointToRay(br.x,br.y,bp).
Origin,bk)if bn then for bu,bv in pairs(bk)do bv.Parent=bd end for bu,bv in
pairs(bo)do for bw,bx in pairs(bk)do bx[bu]=bv end end end end bn(true)ac.
RenderStepped:Connect(bn)function h:GlobalSetting(bo)c=true local bp,bq={},
Instance.new'TextButton'bq.Name='GlobalSetting'bq.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'bq.Text=''bq.TextColor3=Color3.
fromRGB(0,0,0)bq.TextSize=14 bq.BackgroundColor3=Color3.fromRGB(255,255,255)bq.
BackgroundTransparency=1 bq.BorderColor3=Color3.fromRGB(0,0,0)bq.BorderSizePixel
=0 bq.Size=UDim2.fromOffset(200,30)local br=Instance.new'UIPadding'br.Name=
'GlobalSettingToggleUIPadding'br.PaddingLeft=UDim.new(0,15)br.Parent=bq local bs
=Instance.new'TextLabel'bs.Name='SettingName'bs.FontFace=Font.new(an.interFont)
bs.Text=bo.Name bs.RichText=true bs.TextColor3=Color3.fromRGB(255,255,255)bs.
TextSize=13 bs.TextTransparency=0.5 bs.TextTruncate=Enum.TextTruncate.SplitWord
bs.TextXAlignment=Enum.TextXAlignment.Left bs.TextYAlignment=Enum.TextYAlignment
.Top bs.AnchorPoint=Vector2.new(0,0.5)bs.AutomaticSize=Enum.AutomaticSize.Y bs.
BackgroundColor3=Color3.fromRGB(255,255,255)bs.BackgroundTransparency=1 bs.
BorderColor3=Color3.fromRGB(0,0,0)bs.BorderSizePixel=0 bs.Position=UDim2.
fromScale(1.3e-7,0.5)bs.Size=UDim2.new(1,-40,0,0)bs.Parent=bq local bt=Instance.
new'UIListLayout'bt.Name='GlobalSettingToggleUIListLayout'bt.Padding=UDim.new(0,
10)bt.FillDirection=Enum.FillDirection.Horizontal bt.SortOrder=Enum.SortOrder.
LayoutOrder bt.VerticalAlignment=Enum.VerticalAlignment.Center bt.Parent=bq
local bu=Instance.new'TextLabel'bu.Name='Checkmark'bu.FontFace=Font.new(an.
interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)bu.Text='\u{2713}'bu.
TextColor3=Color3.fromRGB(255,255,255)bu.TextSize=13 bu.TextTransparency=1 bu.
TextXAlignment=Enum.TextXAlignment.Left bu.TextYAlignment=Enum.TextYAlignment.
Top bu.AnchorPoint=Vector2.new(0,0.5)bu.AutomaticSize=Enum.AutomaticSize.Y bu.
BackgroundColor3=Color3.fromRGB(255,255,255)bu.BackgroundTransparency=1 bu.
BorderColor3=Color3.fromRGB(0,0,0)bu.BorderSizePixel=0 bu.LayoutOrder=-1 bu.
Position=UDim2.fromScale(1.3e-7,0.5)bu.Size=UDim2.fromOffset(-10,0)bu.Parent=bq
bq.Parent=a2 local bv={duration=0.2,easingStyle=Enum.EasingStyle.Quint,
transparencyIn=0.2,transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-
bt.Padding.Offset,waitTime=1}local bw={checkIn=f(bu,TweenInfo.new(bv.duration,bv
.easingStyle),{Size=UDim2.new(bu.Size.X.Scale,bv.checkSizeIncrease,bu.Size.Y.
Scale,bu.Size.Y.Offset)}),checkOut=f(bu,TweenInfo.new(bv.duration,bv.easingStyle
),{Size=UDim2.new(bu.Size.X.Scale,bv.checkSizeDecrease,bu.Size.Y.Scale,bu.Size.Y
.Offset)}),nameIn=f(bs,TweenInfo.new(bv.duration,bv.easingStyle),{
TextTransparency=bv.transparencyIn}),nameOut=f(bs,TweenInfo.new(bv.duration,bv.
easingStyle),{TextTransparency=bv.transparencyOut})}local bx,by=function(bx)if
not bx then bw.checkOut:Play()bw.nameOut:Play()bu:GetPropertyChangedSignal
'AbsoluteSize':Connect(function()if bu.AbsoluteSize.X<=0 then bu.
TextTransparency=1 end end)else bw.checkIn:Play()bw.nameIn:Play()bu:
GetPropertyChangedSignal'AbsoluteSize':Connect(function()if bu.AbsoluteSize.X>0
then bu.TextTransparency=0 end end)end end,bo.Default bx(by)bq.MouseButton1Click
:Connect(function()by=not by bx(by)task.spawn(function()if bo.Callback then bo.
Callback(by)end end)end)function bp:UpdateName(bz)bs.Text=bz end function bp:
UpdateState(bz)bx(bz)by=bz end return bp end function h:TabGroup()local bo,bp={}
,Instance.new'Frame'bp.Name='Section'bp.AutomaticSize=Enum.AutomaticSize.Y bp.
BackgroundColor3=Color3.fromRGB(255,255,255)bp.BackgroundTransparency=1 bp.
BorderColor3=Color3.fromRGB(0,0,0)bp.BorderSizePixel=0 bp.Size=UDim2.fromScale(1
,0)local bq=Instance.new'Frame'bq.Name='Divider'bq.AnchorPoint=Vector2.new(0.5,1
)bq.BackgroundColor3=Color3.fromRGB(255,255,255)bq.BackgroundTransparency=0.9 bq
.BorderColor3=Color3.fromRGB(0,0,0)bq.BorderSizePixel=0 bq.Position=UDim2.
fromScale(0.5,1)bq.Size=UDim2.new(1,-21,0,1)bq.Parent=bp local br=Instance.new
'Frame'br.Name='SectionTabSwitchers'br.BackgroundColor3=Color3.fromRGB(255,255,
255)br.BackgroundTransparency=1 br.BorderColor3=Color3.fromRGB(0,0,0)br.
BorderSizePixel=0 br.Size=UDim2.fromScale(1,1)local bs=Instance.new
'UIListLayout'bs.Name='UIListLayout'bs.Padding=UDim.new(0,15)bs.
HorizontalAlignment=Enum.HorizontalAlignment.Center bs.SortOrder=Enum.SortOrder.
LayoutOrder bs.Parent=br local bt=Instance.new'UIPadding'bt.Name='UIPadding'bt.
PaddingBottom=UDim.new(0,15)bt.Parent=br br.Parent=bp bp.Parent=aB function bo:
Tab(bu)local bv,bw={Settings=bu},Instance.new'TextButton'bw.Name='TabSwitcher'bw
.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'bw.Text=''bw.
TextColor3=Color3.fromRGB(0,0,0)bw.TextSize=14 bw.AutoButtonColor=false bw.
AnchorPoint=Vector2.new(0.5,0)bw.BackgroundColor3=Color3.fromRGB(255,255,255)bw.
BackgroundTransparency=1 bw.BorderColor3=Color3.fromRGB(0,0,0)bw.BorderSizePixel
=0 bw.Position=UDim2.fromScale(0.5,0)bw.Size=UDim2.new(1,-21,0,40)al+=1 bw.
LayoutOrder=al local bx=Instance.new'UICorner'bx.Name='TabSwitcherUICorner'bx.
Parent=bw local by=Instance.new'UIStroke'by.Name='TabSwitcherUIStroke'by.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border by.Color=Color3.fromRGB(255,255,255)
by.Transparency=1 by.Parent=bw local bz=Instance.new'UIListLayout'bz.Name=
'TabSwitcherUIListLayout'bz.Padding=UDim.new(0,9)bz.FillDirection=Enum.
FillDirection.Horizontal bz.SortOrder=Enum.SortOrder.LayoutOrder bz.
VerticalAlignment=Enum.VerticalAlignment.Center bz.Parent=bw local bA if bu.
Image then bA=Instance.new'ImageLabel'bA.Name='TabImage'bA.Image=bu.Image bA.
ImageTransparency=0.5 bA.BackgroundColor3=Color3.fromRGB(255,255,255)bA.
BackgroundTransparency=1 bA.BorderColor3=Color3.fromRGB(0,0,0)bA.BorderSizePixel
=0 bA.Size=UDim2.fromOffset(18,18)bA.Parent=bw end local bB=Instance.new
'TextLabel'bB.Name='TabSwitcherName'bB.FontFace=Font.new(an.interFont,Enum.
FontWeight.Medium,Enum.FontStyle.Normal)bB.Text=bu.Name bB.RichText=true bB.
TextColor3=Color3.fromRGB(255,255,255)bB.TextSize=16 bB.TextTransparency=0.5 bB.
TextTruncate=Enum.TextTruncate.SplitWord bB.TextXAlignment=Enum.TextXAlignment.
Left bB.TextYAlignment=Enum.TextYAlignment.Top bB.AutomaticSize=Enum.
AutomaticSize.Y bB.BackgroundColor3=Color3.fromRGB(255,255,255)bB.
BackgroundTransparency=1 bB.BorderColor3=Color3.fromRGB(0,0,0)bB.BorderSizePixel
=0 bB.Size=UDim2.fromScale(1,0)bB.Parent=bw bB.LayoutOrder=1 local bC=Instance.
new'UIPadding'bC.Name='TabSwitcherUIPadding'bC.PaddingLeft=UDim.new(0,24)bC.
PaddingRight=UDim.new(0,35)bC.PaddingTop=UDim.new(0,1)bC.Parent=bw bw.Parent=br
local bD=Instance.new'Frame'bD.Name='Elements'bD.BackgroundColor3=Color3.
fromRGB(255,255,255)bD.BackgroundTransparency=1 bD.BorderColor3=Color3.fromRGB(0
,0,0)bD.BorderSizePixel=0 bD.Position=UDim2.fromOffset(0,63)bD.Size=UDim2.new(1,
0,1,-63)bD.ClipsDescendants=true local bE=Instance.new'UIPadding'bE.Name=
'ElementsUIPadding'bE.PaddingRight=UDim.new(0,5)bE.PaddingTop=UDim.new(0,10)bE.
PaddingBottom=UDim.new(0,10)bE.Parent=bD local bF=Instance.new'ScrollingFrame'bF
.Name='ElementsScrolling'bF.AutomaticCanvasSize=Enum.AutomaticSize.Y bF.
BottomImage=''bF.CanvasSize=UDim2.new()bF.ScrollBarImageTransparency=0.5 bF.
ScrollBarThickness=1 bF.TopImage=''bF.BackgroundColor3=Color3.fromRGB(255,255,
255)bF.BackgroundTransparency=1 bF.BorderColor3=Color3.fromRGB(0,0,0)bF.
BorderSizePixel=0 bF.Size=UDim2.fromScale(1,1)bF.ClipsDescendants=false local bG
=Instance.new'UIPadding'bG.Name='ElementsScrollingUIPadding'bG.PaddingBottom=
UDim.new(0,5)bG.PaddingLeft=UDim.new(0,11)bG.PaddingRight=UDim.new(0,3)bG.
PaddingTop=UDim.new(0,5)bG.Parent=bF local bH=Instance.new'UIListLayout'bH.Name=
'ElementsScrollingUIListLayout'bH.Padding=UDim.new(0,15)bH.FillDirection=Enum.
FillDirection.Horizontal bH.SortOrder=Enum.SortOrder.LayoutOrder bH.Parent=bF
local bI=Instance.new'Frame'bI.Name='Left'bI.AutomaticSize=Enum.AutomaticSize.Y
bI.BackgroundColor3=Color3.fromRGB(0,0,0)bI.BackgroundTransparency=1 bI.
BorderColor3=Color3.fromRGB(0,0,0)bI.BorderSizePixel=0 bI.Position=UDim2.
fromScale(0.512,0)bI.Size=UDim2.new(0.5,-10,0,0)local bJ=Instance.new
'UIListLayout'bJ.Name='LeftUIListLayout'bJ.Padding=UDim.new(0,15)bJ.SortOrder=
Enum.SortOrder.LayoutOrder bJ.Parent=bI bI.Parent=bF local bK=Instance.new
'Frame'bK.Name='Right'bK.AutomaticSize=Enum.AutomaticSize.Y bK.BackgroundColor3=
Color3.fromRGB(0,0,0)bK.BackgroundTransparency=1 bK.BorderColor3=Color3.fromRGB(
0,0,0)bK.BorderSizePixel=0 bK.LayoutOrder=1 bK.Position=UDim2.fromScale(0.512,0)
bK.Size=UDim2.new(0.5,-10,0,0)local bL=Instance.new'UIListLayout'bL.Name=
'RightUIListLayout'bL.Padding=UDim.new(0,15)bL.SortOrder=Enum.SortOrder.
LayoutOrder bL.Parent=bK bK.Parent=bF bF.Parent=bD function bv:Section(bM)local
bN,bO={},Instance.new'Frame'bO.Name='Section'bO.AutomaticSize=Enum.AutomaticSize
.Y bO.BackgroundColor3=Color3.fromRGB(255,255,255)bO.BackgroundTransparency=0.98
bO.BorderColor3=Color3.fromRGB(0,0,0)bO.BorderSizePixel=0 bO.Position=UDim2.
fromScale(0,6.78e-8)bO.Size=UDim2.fromScale(1,0)bO.ClipsDescendants=true bO.
Parent=bM.Side=='Left'and bI or bK local bP=Instance.new'UICorner'bP.Name=
'SectionUICorner'bP.Parent=bO local bQ=Instance.new'UIStroke'bQ.Name=
'SectionUIStroke'bQ.ApplyStrokeMode=Enum.ApplyStrokeMode.Border bQ.Color=Color3.
fromRGB(255,255,255)bQ.Transparency=0.95 bQ.Parent=bO local bR=Instance.new
'UIListLayout'bR.Name='SectionUIListLayout'bR.Padding=UDim.new(0,10)bR.SortOrder
=Enum.SortOrder.LayoutOrder bR.Parent=bO local bS=Instance.new'UIPadding'bS.Name
='SectionUIPadding'bS.PaddingBottom=UDim.new(0,20)bS.PaddingLeft=UDim.new(0,20)
bS.PaddingRight=UDim.new(0,18)bS.PaddingTop=UDim.new(0,22)bS.Parent=bO function
bN:Button(bT,bU)local bV,bW={Settings=bT},Instance.new'Frame'bW.Name='Button'bW.
AutomaticSize=Enum.AutomaticSize.Y bW.BackgroundColor3=Color3.fromRGB(0,0,0)bW.
BackgroundTransparency=1 bW.BorderColor3=Color3.fromRGB(0,0,0)bW.BorderSizePixel
=0 bW.Size=UDim2.new(1,0,0,38)bW.Parent=bO local bX=Instance.new'TextButton'bX.
Name='ButtonInteract'bX.FontFace=Font.new(an.interFont)bX.RichText=true bX.
TextColor3=Color3.fromRGB(255,255,255)bX.TextSize=13 bX.TextTransparency=0.5 bX.
TextTruncate=Enum.TextTruncate.AtEnd bX.TextXAlignment=Enum.TextXAlignment.Left
bX.BackgroundColor3=Color3.fromRGB(255,255,255)bX.BackgroundTransparency=1 bX.
BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel=0 bX.Size=UDim2.fromScale(1
,1)bX.Parent=bW bX.Text=bV.Settings.Name local bY=Instance.new'ImageLabel'bY.
Name='ButtonImage'bY.Image=an.buttonImage bY.ImageTransparency=0.5 bY.
AnchorPoint=Vector2.new(1,0.5)bY.BackgroundColor3=Color3.fromRGB(255,255,255)bY.
BackgroundTransparency=1 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel
=0 bY.Position=UDim2.fromScale(1,0.5)bY.Size=UDim2.fromOffset(15,15)bY.Parent=bW
local bZ={DefaultTransparency=0.5,HoverTransparency=0.3,EasingStyle=Enum.
EasingStyle.Sine}local b_,b0=function(b_)if b_=='Idle'then f(bX,TweenInfo.new(
0.2,bZ.EasingStyle),{TextTransparency=bZ.DefaultTransparency}):Play()f(bY,
TweenInfo.new(0.2,bZ.EasingStyle),{ImageTransparency=bZ.DefaultTransparency}):
Play()elseif b_=='Hover'then f(bX,TweenInfo.new(0.2,bZ.EasingStyle),{
TextTransparency=bZ.HoverTransparency}):Play()f(bY,TweenInfo.new(0.2,bZ.
EasingStyle),{ImageTransparency=bZ.HoverTransparency}):Play()end end,function()
if bV.Settings.Callback then bV.Settings.Callback()end end bX.MouseEnter:
Connect(function()b_'Hover'end)bX.MouseLeave:Connect(function()b_'Idle'end)bX.
MouseButton1Click:Connect(b0)function bV:UpdateName(b1)bX.Text=b1 end function
bV:SetVisibility(b1)bW.Visible=b1 end if bU then aa.Options[bU]=bV end return bV
end function bN:Toggle(bT,bU)local bV,bW={Settings=bT,IgnoreConfig=false,Class=
'Toggle'},Instance.new'Frame'bW.Name='Toggle'bW.AutomaticSize=Enum.AutomaticSize
.Y bW.BackgroundColor3=Color3.fromRGB(0,0,0)bW.BackgroundTransparency=1 bW.
BorderColor3=Color3.fromRGB(0,0,0)bW.BorderSizePixel=0 bW.Size=UDim2.new(1,0,0,
38)bW.Parent=bO local bX=Instance.new'TextLabel'bX.Name='ToggleName'bX.FontFace=
Font.new(an.interFont)bX.Text=bV.Settings.Name bX.RichText=true bX.TextColor3=
Color3.fromRGB(255,255,255)bX.TextSize=13 bX.TextTransparency=0.5 bX.
TextTruncate=Enum.TextTruncate.AtEnd bX.TextXAlignment=Enum.TextXAlignment.Left
bX.TextYAlignment=Enum.TextYAlignment.Top bX.AnchorPoint=Vector2.new(0,0.5)bX.
AutomaticSize=Enum.AutomaticSize.Y bX.BackgroundColor3=Color3.fromRGB(255,255,
255)bX.BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.
BorderSizePixel=0 bX.Position=UDim2.fromScale(0,0.5)bX.Size=UDim2.new(1,-50,0,0)
bX.Parent=bW local bY=Instance.new'ImageButton'bY.Name='Toggle'bY.Image=an.
toggleBackground bY.ImageColor3=Color3.fromRGB(87,86,86)bY.AutoButtonColor=false
bY.AnchorPoint=Vector2.new(1,0.5)bY.BackgroundColor3=Color3.fromRGB(255,255,255)
bY.BackgroundTransparency=1 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.
BorderSizePixel=0 bY.Position=UDim2.fromScale(1,0.5)bY.Size=UDim2.fromOffset(41,
21)bY.ImageTransparency=0.5 local bZ=Instance.new'UIPadding'bZ.Name=
'ToggleUIPadding'bZ.PaddingBottom=UDim.new(0,1)bZ.PaddingLeft=UDim.new(0,-2)bZ.
PaddingRight=UDim.new(0,3)bZ.PaddingTop=UDim.new(0,1)bZ.Parent=bY local b_=
Instance.new'ImageLabel'b_.Name='TogglerHead'b_.Image=an.togglerHead b_.
ImageColor3=Color3.fromRGB(255,255,255)b_.AnchorPoint=Vector2.new(1,0.5)b_.
BackgroundColor3=Color3.fromRGB(255,255,255)b_.BackgroundTransparency=1 b_.
BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel=0 b_.Position=UDim2.
fromScale(0.5,0.5)b_.Size=UDim2.fromOffset(15,15)b_.ZIndex=2 b_.Parent=bY b_.
ImageTransparency=0.8 bY.Parent=bW local b0,b1,b2,b3={Enabled=0,Disabled=0.5},{
Enabled=0,Disabled=0.85},{Info=TweenInfo.new(0.15,Enum.EasingStyle.Quad),
EnabledPosition=UDim2.new(1,0,0.5,0),DisabledPosition=UDim2.new(0.5,0,0.5,0)},bV
.Settings.Default local b4=function(b4,b5)local b6,b7=b4 and{b0.Enabled,b1.
Enabled}or{b0.Disabled,b1.Disabled},b4 and b2.EnabledPosition or b2.
DisabledPosition f(bY,b2.Info,{ImageTransparency=b6[1]}):Play()f(b_,b2.Info,{
ImageTransparency=b6[2]}):Play()f(b_,b2.Info,{Position=b7}):Play()bV.State=b4 if
b5 then b5(b3)end end b4(b3)local b5=function()b3=not b3 b4(b3,bV.Settings.
Callback)end bY.MouseButton1Click:Connect(b5)function bV:Toggle()b5()end
function bV:UpdateState(b6)b3=b6 b4(b3,bV.Settings.Callback)end function bV:
GetState()return b3 end function bV:UpdateName(b6)bX.Text=b6 end function bV:
SetVisibility(b6)bW.Visible=b6 end if bU then aa.Options[bU]=bV end return bV
end function bN:Slider(bT,bU)local bV,bW={Settings=bT,IgnoreConfig=false,Class=
'Slider'},Instance.new'Frame'bW.Name='Slider'bW.AutomaticSize=Enum.AutomaticSize
.Y bW.BackgroundColor3=Color3.fromRGB(0,0,0)bW.BackgroundTransparency=1 bW.
BorderColor3=Color3.fromRGB(0,0,0)bW.BorderSizePixel=0 bW.Size=UDim2.new(1,0,0,
38)bW.Parent=bO local bX=Instance.new'TextLabel'bX.Name='SliderName'bX.FontFace=
Font.new(an.interFont)bX.Text=bV.Settings.Name bX.RichText=true bX.TextColor3=
Color3.fromRGB(255,255,255)bX.TextSize=13 bX.TextTransparency=0.5 bX.
TextTruncate=Enum.TextTruncate.AtEnd bX.TextXAlignment=Enum.TextXAlignment.Left
bX.TextYAlignment=Enum.TextYAlignment.Top bX.AnchorPoint=Vector2.new(0,0.5)bX.
AutomaticSize=Enum.AutomaticSize.XY bX.BackgroundColor3=Color3.fromRGB(255,255,
255)bX.BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.
BorderSizePixel=0 bX.Position=UDim2.fromScale(1.3e-7,0.5)bX.Parent=bW local bY=
Instance.new'Frame'bY.Name='SliderElements'bY.AnchorPoint=Vector2.new(1,0)bY.
BackgroundColor3=Color3.fromRGB(255,255,255)bY.BackgroundTransparency=1 bY.
BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Position=UDim2.
fromScale(1,0)bY.Size=UDim2.fromScale(1,1)local bZ=Instance.new'TextBox'bZ.Name=
'SliderValue'bZ.FontFace=Font.new(an.interFont)bZ.TextColor3=Color3.fromRGB(255,
255,255)bZ.TextSize=12 bZ.TextTransparency=0.1 bZ.BackgroundColor3=Color3.
fromRGB(255,255,255)bZ.BackgroundTransparency=0.95 bZ.BorderColor3=Color3.
fromRGB(0,0,0)bZ.BorderSizePixel=0 bZ.LayoutOrder=1 bZ.Position=UDim2.fromScale(
-7.89E-2,0.171)bZ.Size=UDim2.fromOffset(41,21)bZ.ClipsDescendants=true local b_=
Instance.new'UICorner'b_.Name='SliderValueUICorner'b_.CornerRadius=UDim.new(0,4)
b_.Parent=bZ local b0=Instance.new'UIStroke'b0.Name='SliderValueUIStroke'b0.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border b0.Color=Color3.fromRGB(255,255,255)
b0.Transparency=0.9 b0.Parent=bZ local b1=Instance.new'UIPadding'b1.Name=
'SliderValueUIPadding'b1.PaddingLeft=UDim.new(0,2)b1.PaddingRight=UDim.new(0,2)
b1.Parent=bZ bZ.Parent=bY local b2=Instance.new'UIListLayout'b2.Name=
'SliderElementsUIListLayout'b2.Padding=UDim.new(0,20)b2.FillDirection=Enum.
FillDirection.Horizontal b2.HorizontalAlignment=Enum.HorizontalAlignment.Right
b2.SortOrder=Enum.SortOrder.LayoutOrder b2.VerticalAlignment=Enum.
VerticalAlignment.Center b2.Parent=bY local b3=Instance.new'ImageLabel'b3.Name=
'SliderBar'b3.Image=an.sliderbar b3.ImageColor3=Color3.fromRGB(87,86,86)b3.
BackgroundColor3=Color3.fromRGB(255,255,255)b3.BackgroundTransparency=1 b3.
BorderColor3=Color3.fromRGB(0,0,0)b3.BorderSizePixel=0 b3.Position=UDim2.
fromScale(0.219,0.457)b3.Size=UDim2.fromOffset(123,3)local b4=Instance.new
'ImageButton'b4.Name='SliderHead'b4.Image=an.sliderhead b4.AnchorPoint=Vector2.
new(0.5,0.5)b4.BackgroundColor3=Color3.fromRGB(255,255,255)b4.
BackgroundTransparency=1 b4.BorderColor3=Color3.fromRGB(0,0,0)b4.BorderSizePixel
=0 b4.Position=UDim2.fromScale(1,0.5)b4.Size=UDim2.fromOffset(12,12)b4.Parent=b3
b3.Parent=bY local b5=Instance.new'UIPadding'b5.Name='SliderElementsUIPadding'b5
.PaddingTop=UDim.new(0,3)b5.Parent=bY bY.Parent=bW local b6,b7=false,{Hundredths
=function(b6)return string.format('%.2f',b6)end,Tenths=function(b6)return string
.format('%.1f',b6)end,Round=function(b6,b7)if b7 then return string.format('%.'
..b7..'f',b6)else return tostring(math.round(b6))end end,Degrees=function(b6,b7)
local b8=b7 and string.format('%.'..b7..'f',b6)or tostring(b6)return b8..
'\u{b0}'end,Percent=function(b6,b7)local b8=(b6-bV.Settings.Minimum)/(bV.
Settings.Maximum-bV.Settings.Minimum)*100 return b7 and string.format('%.'..b7..
'f',b8)..'%'or tostring(math.round(b8))..'%'end,Value=function(b6,b7)return b7
and string.format('%.'..b7..'f',b6)or tostring(b6)end}local b8,b9=b7[bV.Settings
.DisplayMethod]or b7.Value local ca=function(ca,cb)local cc if typeof(ca)==
'Instance'then local cd=ca cc=math.clamp((cd.Position.X-b3.AbsolutePosition.X)/
b3.AbsoluteSize.X,0,1)else local cd=ca cc=(cd-bV.Settings.Minimum)/(bV.Settings.
Maximum-bT.Minimum)end local cd=UDim2.new(cc,0,0.5,0)b4.Position=cd b9=cc*(bV.
Settings.Maximum-bV.Settings.Minimum)+bT.Minimum bZ.Text=(bT.Prefix or'')..b8(b9
,bV.Settings.Precision)..(bT.Suffix or'')if not cb then task.spawn(function()if
bV.Settings.Callback then bV.Settings.Callback(b9)end end)end bV.Value=b9 end
ca(bV.Settings.Default,true)b4.InputBegan:Connect(function(cb)if cb.
UserInputType==Enum.UserInputType.MouseButton1 or cb.UserInputType==Enum.
UserInputType.Touch then b6=true ca(cb)end end)b4.InputEnded:Connect(function(cb
)if cb.UserInputType==Enum.UserInputType.MouseButton1 or cb.UserInputType==Enum.
UserInputType.Touch then b6=false if bV.Settings.onInputComplete then bV.
Settings.onInputComplete(b9)end end end)bZ.FocusLost:Connect(function(cb)local
cc=bZ.Text local cd,ce=cc:match'^(%-?%d+%.?%d*)(%%?)$'if cd then cd=tonumber(cd)
ce=ce=='%'if ce then cd=bV.Settings.Minimum+(cd/100)*(bV.Settings.Maximum-bV.
Settings.Minimum)end local cf=math.clamp(cd,bV.Settings.Minimum,bV.Settings.
Maximum)ca(cf)else bZ.Text=b8(b9)end if bV.Settings.onInputComplete then bV.
Settings.onInputComplete(b9)end end)af.InputChanged:Connect(function(cb)if b6
and(cb.UserInputType==Enum.UserInputType.MouseMovement or cb.UserInputType==Enum
.UserInputType.Touch)then ca(cb)end end)local cb=function()local cb,cc,cd,ce=b2.
Padding.Offset,bZ.AbsoluteSize.X,bX.AbsoluteSize.X,bY.AbsoluteSize.X local cf=(
ce-(cb+cc+cd+20))/n.Scale b3.Size=UDim2.new(b3.Size.X.Scale,cf,b3.Size.Y.Scale,
b3.Size.Y.Offset)end cb()bX:GetPropertyChangedSignal'AbsoluteSize':Connect(cb)bO
:GetPropertyChangedSignal'AbsoluteSize':Connect(cb)function bV:UpdateName(cc)bX=
cc end function bV:SetVisibility(cc)bW.Visible=cc end function bV:UpdateValue(cc
)ca(tonumber(cc),true)end function bV:GetValue()return b9 end if bU then aa.
Options[bU]=bV end return bV end function bN:Input(bT,bU)local bV,bW={Settings=
bT,IgnoreConfig=false,Class='Input'},Instance.new'Frame'bW.Name='Input'bW.
AutomaticSize=Enum.AutomaticSize.Y bW.BackgroundColor3=Color3.fromRGB(0,0,0)bW.
BackgroundTransparency=1 bW.BorderColor3=Color3.fromRGB(0,0,0)bW.BorderSizePixel
=0 bW.Size=UDim2.new(1,0,0,38)bW.Parent=bO local bX=Instance.new'TextLabel'bX.
Name='InputName'bX.FontFace=Font.new(an.interFont)bX.Text=bV.Settings.Name bX.
RichText=true bX.TextColor3=Color3.fromRGB(255,255,255)bX.TextSize=13 bX.
TextTransparency=0.5 bX.TextTruncate=Enum.TextTruncate.AtEnd bX.TextXAlignment=
Enum.TextXAlignment.Left bX.TextYAlignment=Enum.TextYAlignment.Top bX.
AnchorPoint=Vector2.new(0,0.5)bX.AutomaticSize=Enum.AutomaticSize.XY bX.
BackgroundColor3=Color3.fromRGB(255,255,255)bX.BackgroundTransparency=1 bX.
BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel=0 bX.Position=UDim2.
fromScale(0,0.5)bX.Parent=bW local bY=Instance.new'TextBox'bY.Name='InputBox'bY.
FontFace=Font.new(an.interFont)bY.Text='Hello world!'bY.TextColor3=Color3.
fromRGB(255,255,255)bY.TextSize=12 bY.TextTransparency=0.1 bY.AnchorPoint=
Vector2.new(1,0.5)bY.AutomaticSize=Enum.AutomaticSize.X bY.BackgroundColor3=
Color3.fromRGB(255,255,255)bY.BackgroundTransparency=0.95 bY.BorderColor3=Color3
.fromRGB(0,0,0)bY.BorderSizePixel=0 bY.ClipsDescendants=true bY.LayoutOrder=1 bY
.Position=UDim2.fromScale(1,0.5)bY.Size=UDim2.fromOffset(21,21)bY.TextXAlignment
=Enum.TextXAlignment.Right local bZ=Instance.new'UICorner'bZ.Name=
'InputBoxUICorner'bZ.CornerRadius=UDim.new(0,4)bZ.Parent=bY local b_=Instance.
new'UIStroke'b_.Name='InputBoxUIStroke'b_.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border b_.Color=Color3.fromRGB(255,255,255)b_.Transparency=0.9 b_.Parent=bY
local b0=Instance.new'UIPadding'b0.Name='InputBoxUIPadding'b0.PaddingLeft=UDim.
new(0,5)b0.PaddingRight=UDim.new(0,5)b0.Parent=bY local b1=Instance.new
'UISizeConstraint'b1.Name='InputBoxUISizeConstraint'b1.Parent=bY bY.Parent=bW
local b2,b3,b4,b5,b6=bW,bY,bX,b1,function(b2)if bV.Settings.CharacterLimit then
return b2:sub(1,bV.Settings.CharacterLimit)end return b2 end local b7,b8={All=
function(b7)return b6(b7)end,Numeric=function(b7)local b8=b7:match'^%-?%d*$'and
b7 or b7:gsub('[^%d-]',''):gsub('(%-)',function(b8,b9)return b9==1 and b8 or''
end)return b6(b8)end,Alphabetic=function(b7)return b6(b7:gsub('[^a-zA-Z ]',''))
end,AlphaNumeric=function(b7)return b6(b7:gsub('[^a-zA-Z0-9]',''))end}if type(bV
.Settings.AcceptedCharacters)=='function'then b8=bV.Settings.AcceptedCharacters
else b8=b7[bV.Settings.AcceptedCharacters]or b7.All end b3.AutomaticSize=Enum.
AutomaticSize.X local b9=function()local b9,ca=b4.AbsoluteSize.X,b2.AbsoluteSize
.X local cb=(ca-b9-20)/n.Scale b5.MaxSize=Vector2.new(cb,9e9)end b9()b4:
GetPropertyChangedSignal'AbsoluteSize':Connect(b9)b3.FocusLost:Connect(function(
)local ca=b3.Text local cb=b8(ca)b3.Text=cb task.spawn(function()if bV.Settings.
Callback then bV.Settings.Callback(cb)end end)end)b3.Text=bV.Settings.Default or
''b3.PlaceholderText=bV.Settings.Placeholder or''b3:GetPropertyChangedSignal
'Text':Connect(function()b3.Text=b8(b3.Text)if bV.Settings.onChanged then bV.
Settings.onChanged(b3.Text)end bV.Text=b3.Text end)function bV:UpdateName(ca)bX.
Text=ca end function bV:SetVisibility(ca)bW.Visible=ca end function bV:GetInput(
)return b3.Text end function bV:UpdatePlaceholder(ca)bY.PlaceholderText=ca end
function bV:UpdateText(ca)local cb=b8(ca)b3.Text=cb bV.Text=cb task.spawn(
function()if bV.Settings.Callback then bV.Settings.Callback(cb)end end)end if bU
then aa.Options[bU]=bV end return bV end function bN:Keybind(bT,bU)local bV,bW={
Settings=bT,IgnoreConfig=false,Class='Keybind'},Instance.new'Frame'bW.Name=
'Keybind'bW.AutomaticSize=Enum.AutomaticSize.Y bW.BackgroundColor3=Color3.
fromRGB(0,0,0)bW.BackgroundTransparency=1 bW.BorderColor3=Color3.fromRGB(0,0,0)
bW.BorderSizePixel=0 bW.Size=UDim2.new(1,0,0,38)bW.Parent=bO local bX=Instance.
new'TextLabel'bX.Name='KeybindName'bX.FontFace=Font.new(an.interFont)bX.Text=bV.
Settings.Name bX.RichText=true bX.TextColor3=Color3.fromRGB(255,255,255)bX.
TextSize=13 bX.TextTransparency=0.5 bX.TextTruncate=Enum.TextTruncate.AtEnd bX.
TextXAlignment=Enum.TextXAlignment.Left bX.TextYAlignment=Enum.TextYAlignment.
Top bX.AnchorPoint=Vector2.new(0,0.5)bX.AutomaticSize=Enum.AutomaticSize.XY bX.
BackgroundColor3=Color3.fromRGB(255,255,255)bX.BackgroundTransparency=1 bX.
BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel=0 bX.Position=UDim2.
fromScale(0,0.5)bX.Parent=bW local bY=Instance.new'TextBox'bY.Name='BinderBox'bY
.CursorPosition=-1 bY.FontFace=Font.new(an.interFont)bY.PlaceholderText='...'bY.
Text=''bY.TextColor3=Color3.fromRGB(255,255,255)bY.TextSize=12 bY.
TextTransparency=0.1 bY.AnchorPoint=Vector2.new(1,0.5)bY.AutomaticSize=Enum.
AutomaticSize.X bY.BackgroundColor3=Color3.fromRGB(255,255,255)bY.
BackgroundTransparency=0.95 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.
BorderSizePixel=0 bY.ClipsDescendants=true bY.LayoutOrder=1 bY.Position=UDim2.
fromScale(1,0.5)bY.Size=UDim2.fromOffset(21,21)local bZ=Instance.new'UICorner'bZ
.Name='BinderBoxUICorner'bZ.CornerRadius=UDim.new(0,4)bZ.Parent=bY local b_=
Instance.new'UIStroke'b_.Name='BinderBoxUIStroke'b_.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border b_.Color=Color3.fromRGB(255,255,255)b_.Transparency=0.9
b_.Parent=bY local b0=Instance.new'UIPadding'b0.Name='BinderBoxUIPadding'b0.
PaddingLeft=UDim.new(0,5)b0.PaddingRight=UDim.new(0,5)b0.Parent=bY local b1=
Instance.new'UISizeConstraint'b1.Name='BinderBoxUISizeConstraint'b1.Parent=bY bY
.Parent=bW local b2,b3,b4,b5=false,false,(bV.Settings.Default)local b6=function(
)b5=false b2=false bY:ReleaseFocus()end if b4 then bY.Text=b4.Name end bY.
Focused:Connect(function()b5=true end)bY.FocusLost:Connect(function()b5=false
end)af.InputBegan:Connect(function(b7)if b5 and not b2 then b2=true local b8 b8=
af.InputBegan:Connect(function(b9)if bV.Settings.Blacklist and(table.find(bV.
KeybindFunctions.Settings.Blacklist,b9.KeyCode)or table.find(bV.Settings.
Blacklist,b9.UserInputType))then bY:ReleaseFocus()b6()b8:Disconnect()return end
if b9.UserInputType==Enum.UserInputType.Keyboard then b4=b9.KeyCode bY.Text=b9.
KeyCode.Name elseif b9.UserInputType==Enum.UserInputType.MouseButton1 or b9.
UserInputType==Enum.UserInputType.MouseButton2 then b4=b9.UserInputType bY.Text=
b9.UserInputType.Name end if bV.Settings.onBinded then bV.Settings.onBinded(b4)
end b3=true b6()b8:Disconnect()end)else if not b3 and(b7.KeyCode==b4 or b7.
UserInputType==b4)then if bV.Settings.Callback then bV.Settings.Callback(b4)end
if bV.Settings.onBindHeld then bV.Settings.onBindHeld(true,b4)end else b3=false
end end end)af.InputEnded:Connect(function(b7)if not b5 and not b2 then if b7.
KeyCode==b4 or b7.UserInputType==b4 then if bT.onBindHeld then bT.onBindHeld(
false,b4)end end end end)function bV:Bind(b7)b4=b7 bY.Text=b7.Name end function
bV:Unbind()b4=nil bY.Text=''end function bV:GetBind()return b4 end function bV:
UpdateName(b7)bX=b7 end function bV:SetVisibility(b7)bW.Visible=b7 end if bU
then aa.Options[bU]=bV end return bV end function bN:Dropdown(bT,bU)local bV,bW,
bX,bY={Settings=bT,IgnoreConfig=false,Class='Dropdown'},{},{},Instance.new
'Frame'bY.Name='Dropdown'bY.BackgroundColor3=Color3.fromRGB(255,255,255)bY.
BackgroundTransparency=0.985 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.
BorderSizePixel=0 bY.Size=UDim2.new(1,0,0,38)bY.Parent=bO bY.ClipsDescendants=
true local bZ=Instance.new'UIPadding'bZ.Name='DropdownUIPadding'bZ.PaddingLeft=
UDim.new(0,15)bZ.PaddingRight=UDim.new(0,15)bZ.Parent=bY local b_=Instance.new
'TextButton'b_.Name='Interact'b_.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'b_.Text=''b_.TextColor3=Color3.
fromRGB(0,0,0)b_.TextSize=14 b_.BackgroundColor3=Color3.fromRGB(255,255,255)b_.
BackgroundTransparency=1 b_.BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel
=0 b_.Size=UDim2.new(1,0,0,38)b_.Parent=bY local b0=Instance.new'TextLabel'b0.
Name='DropdownName'b0.FontFace=Font.new(an.interFont)b0.Text=bT.Default and(bV.
Settings.Name..' \u{2022} '..table.concat(bW,', '))or(bV.Settings.Name..'...')b0
.RichText=true b0.TextColor3=Color3.fromRGB(255,255,255)b0.TextSize=13 b0.
TextTransparency=0.5 b0.TextTruncate=Enum.TextTruncate.SplitWord b0.
TextXAlignment=Enum.TextXAlignment.Left b0.AutomaticSize=Enum.AutomaticSize.Y b0
.BackgroundColor3=Color3.fromRGB(255,255,255)b0.BackgroundTransparency=1 b0.
BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel=0 b0.Size=UDim2.new(1,-20,0
,38)b0.Parent=bY local b1=Instance.new'UIStroke'b1.Name='DropdownUIStroke'b1.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border b1.Color=Color3.fromRGB(255,255,255)
b1.Transparency=0.95 b1.Parent=bY local b2=Instance.new'UICorner'b2.Name=
'DropdownUICorner'b2.CornerRadius=UDim.new(0,6)b2.Parent=bY local b3=Instance.
new'ImageLabel'b3.Name='DropdownImage'b3.Image=an.dropdown b3.ImageTransparency=
0.5 b3.AnchorPoint=Vector2.new(1,0)b3.BackgroundColor3=Color3.fromRGB(255,255,
255)b3.BackgroundTransparency=1 b3.BorderColor3=Color3.fromRGB(0,0,0)b3.
BorderSizePixel=0 b3.Position=UDim2.new(1,0,0,12)b3.Size=UDim2.fromOffset(14,14)
b3.Parent=bY local b4=Instance.new'Frame'b4.Name='DropdownFrame'b4.
BackgroundColor3=Color3.fromRGB(255,255,255)b4.BackgroundTransparency=1 b4.
BorderColor3=Color3.fromRGB(0,0,0)b4.BorderSizePixel=0 b4.ClipsDescendants=true
b4.Size=UDim2.fromScale(1,1)b4.Visible=false b4.AutomaticSize=Enum.AutomaticSize
.Y local b5=Instance.new'UIPadding'b5.Name='DropdownFrameUIPadding'b5.PaddingTop
=UDim.new(0,38)b5.PaddingBottom=UDim.new(0,10)b5.Parent=b4 local b6=Instance.new
'UIListLayout'b6.Name='DropdownFrameUIListLayout'b6.Padding=UDim.new(0,5)b6.
SortOrder=Enum.SortOrder.LayoutOrder b6.Parent=b4 local b7=Instance.new'Frame'b7
.Name='Search'b7.BackgroundColor3=Color3.fromRGB(255,255,255)b7.
BackgroundTransparency=0.95 b7.BorderColor3=Color3.fromRGB(0,0,0)b7.
BorderSizePixel=0 b7.LayoutOrder=-1 b7.Size=UDim2.new(1,0,0,30)b7.Parent=b4 b7.
Visible=bV.Settings.Search local b8=Instance.new'UICorner'b8.Name=
'SectionUICorner'b8.Parent=b7 local b9=Instance.new'ImageLabel'b9.Name=
'SearchIcon'b9.Image=an.searchIcon b9.ImageColor3=Color3.fromRGB(180,180,180)b9.
AnchorPoint=Vector2.new(0,0.5)b9.BackgroundColor3=Color3.fromRGB(255,255,255)b9.
BackgroundTransparency=1 b9.BorderColor3=Color3.fromRGB(0,0,0)b9.BorderSizePixel
=0 b9.Position=UDim2.fromScale(0,0.5)b9.Size=UDim2.fromOffset(12,12)b9.Parent=b7
local ca=Instance.new'UIPadding'ca.Name='UIPadding'ca.PaddingLeft=UDim.new(0,15)
ca.Parent=b7 local cb=Instance.new'TextBox'cb.Name='SearchBox'cb.CursorPosition=
-1 cb.FontFace=Font.new(an.interFont,Enum.FontWeight.Medium,Enum.FontStyle.
Normal)cb.PlaceholderColor3=Color3.fromRGB(150,150,150)cb.PlaceholderText=
'Search...'cb.Text=''cb.TextColor3=Color3.fromRGB(200,200,200)cb.TextSize=14 cb.
TextXAlignment=Enum.TextXAlignment.Left cb.BackgroundColor3=Color3.fromRGB(255,
255,255)cb.BackgroundTransparency=1 cb.BorderColor3=Color3.fromRGB(0,0,0)cb.
BorderSizePixel=0 cb.Size=UDim2.fromScale(1,1)local cc=function()local cc,cd,ce=
0,0,b5.PaddingTop.Offset+b5.PaddingBottom.Offset for cf,cg in pairs(b4:
GetChildren())do if not cg:IsA'UIComponent'and cg.Visible then cc+=cg.
AbsoluteSize.Y cd+=1 end end local cf=b6.Padding.Offset*(cd-1)return cc+cf+ce
end local cd=function()local cd=cb.Text:lower()for ce,cf in pairs(bX)do local cg
=cf.NameLabel.Text:lower()local ch=string.find(cg,cd)~=nil if cf.Button.Visible
~=ch then cf.Button.Visible=ch end end bY.Size=UDim2.new(1,0,0,cc())end cb:
GetPropertyChangedSignal'Text':Connect(cd)local ce=Instance.new'UIPadding'ce.
Name='UIPadding'ce.PaddingLeft=UDim.new(0,23)ce.Parent=cb cb.Parent=b7 local cf=
{duration=0.2,easingStyle=Enum.EasingStyle.Quint,transparencyIn=0.2,
transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-13,waitTime=1}local
cg,ch,ci=function(cg,ch)local ci=bX[cg]if not ci then return end local cj,ck=ci.
Checkmark,ci.NameLabel if ch then if bV.Settings.Multi then if not table.find(bW
,cg)then table.insert(bW,cg)bV.Value=bW end else for cl,cm in pairs(bX)do if cl
~=cg then f(cm.Checkmark,TweenInfo.new(cf.duration,cf.easingStyle),{Size=UDim2.
new(cm.Checkmark.Size.X.Scale,cf.checkSizeDecrease,cm.Checkmark.Size.Y.Scale,cm.
Checkmark.Size.Y.Offset)}):Play()f(cm.NameLabel,TweenInfo.new(cf.duration,cf.
easingStyle),{TextTransparency=cf.transparencyOut}):Play()cm.Checkmark.
TextTransparency=1 end end bW={cg}bV.Value=bW[1]end f(cj,TweenInfo.new(cf.
duration,cf.easingStyle),{Size=UDim2.new(cj.Size.X.Scale,cf.checkSizeIncrease,cj
.Size.Y.Scale,cj.Size.Y.Offset)}):Play()f(ck,TweenInfo.new(cf.duration,cf.
easingStyle),{TextTransparency=cf.transparencyIn}):Play()cj.TextTransparency=0
else if bV.Settings.Multi then local cl=table.find(bW,cg)if cl then table.
remove(bW,cl)end else bW={}end f(cj,TweenInfo.new(cf.duration,cf.easingStyle),{
Size=UDim2.new(cj.Size.X.Scale,cf.checkSizeDecrease,cj.Size.Y.Scale,cj.Size.Y.
Offset)}):Play()f(ck,TweenInfo.new(cf.duration,cf.easingStyle),{TextTransparency
=cf.transparencyOut}):Play()cj.TextTransparency=1 end if bT.Required and#bW==0
and not ch then return end if#bW>0 then b0.Text=bV.Settings.Name..' \u{2022} '..
table.concat(bW,', ')else b0.Text=bV.Settings.Name..'...'end end,false,false
local cj=function()if ci then return end ci=true local cj,ck=38,not ch local cl=
ck and UDim2.new(1,0,0,cc())or UDim2.new(1,0,0,cj)local cm,cn=f(bY,TweenInfo.
new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=cl}),f(b3,
TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Rotation=ck
and-90 or 0})cm:Play()cn:Play()if ck then b4.Visible=true cm.Completed:Connect(
function()ci=false end)else cm.Completed:Connect(function()b4.Visible=false ci=
false end)end ch=ck end b_.MouseButton1Click:Connect(cj)local ck=function(ck,cl)
local cm=Instance.new'TextButton'cm.Name='Option'cm.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'cm.Text=''cm.TextColor3=Color3.
fromRGB(0,0,0)cm.TextSize=14 cm.BackgroundColor3=Color3.fromRGB(255,255,255)cm.
BackgroundTransparency=1 cm.BorderColor3=Color3.fromRGB(0,0,0)cm.BorderSizePixel
=0 cm.Size=UDim2.new(1,0,0,30)local cn=Instance.new'UIPadding'cn.Name=
'OptionUIPadding'cn.PaddingLeft=UDim.new(0,15)cn.Parent=cm local co=Instance.new
'TextLabel'co.Name='OptionName'co.FontFace=Font.new(an.interFont)co.Text=cl co.
RichText=true co.TextColor3=Color3.fromRGB(255,255,255)co.TextSize=13 co.
TextTransparency=0.5 co.TextTruncate=Enum.TextTruncate.AtEnd co.TextXAlignment=
Enum.TextXAlignment.Left co.TextYAlignment=Enum.TextYAlignment.Top co.
AnchorPoint=Vector2.new(0,0.5)co.AutomaticSize=Enum.AutomaticSize.XY co.
BackgroundColor3=Color3.fromRGB(255,255,255)co.BackgroundTransparency=1 co.
BorderColor3=Color3.fromRGB(0,0,0)co.BorderSizePixel=0 co.Position=UDim2.
fromScale(1.3e-7,0.5)co.Parent=cm local cp=Instance.new'UIListLayout'cp.Name=
'OptionUIListLayout'cp.Padding=UDim.new(0,10)cp.FillDirection=Enum.FillDirection
.Horizontal cp.SortOrder=Enum.SortOrder.LayoutOrder cp.VerticalAlignment=Enum.
VerticalAlignment.Center cp.Parent=cm local cq=Instance.new'TextLabel'cq.Name=
'Checkmark'cq.FontFace=Font.new(an.interFont)cq.Text='\u{2713}'cq.TextColor3=
Color3.fromRGB(255,255,255)cq.TextSize=13 cq.TextTransparency=1 cq.
TextXAlignment=Enum.TextXAlignment.Left cq.TextYAlignment=Enum.TextYAlignment.
Top cq.AnchorPoint=Vector2.new(0,0.5)cq.AutomaticSize=Enum.AutomaticSize.Y cq.
BackgroundColor3=Color3.fromRGB(255,255,255)cq.BackgroundTransparency=1 cq.
BorderColor3=Color3.fromRGB(0,0,0)cq.BorderSizePixel=0 cq.LayoutOrder=-1 cq.
Position=UDim2.fromScale(1.3e-7,0.5)cq.Size=UDim2.fromOffset(-10,0)cq.Parent=cm
cm.Parent=b4 b4.Parent=bY bX[cl]={Index=ck,Button=cm,NameLabel=co,Checkmark=cq}
local cr={duration=0.2,easingStyle=Enum.EasingStyle.Quint,transparencyIn=0.2,
transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-cp.Padding.Offset,
waitTime=1}local cs,ct={checkIn=f(cq,TweenInfo.new(cr.duration,cr.easingStyle),{
Size=UDim2.new(cq.Size.X.Scale,cr.checkSizeIncrease,cq.Size.Y.Scale,cq.Size.Y.
Offset)}),checkOut=f(cq,TweenInfo.new(cr.duration,cr.easingStyle),{Size=UDim2.
new(cq.Size.X.Scale,cr.checkSizeDecrease,cq.Size.Y.Scale,cq.Size.Y.Offset)}),
nameIn=f(co,TweenInfo.new(cr.duration,cr.easingStyle),{TextTransparency=cr.
transparencyIn}),nameOut=f(co,TweenInfo.new(cr.duration,cr.easingStyle),{
TextTransparency=cr.transparencyOut})},false if bV.Settings.Default then if bV.
Settings.Multi then ct=table.find(bV.Settings.Default,cl)and true or false else
ct=(bV.Settings.Default==ck)and true or false end end cg(cl,ct)local cu=bX[cl].
Button cu.MouseButton1Click:Connect(function()local cv=table.find(bW,cl)and true
or false local cw=not cv if bV.Settings.Required and not cw and#bW<=1 then
return end cg(cl,cw)task.spawn(function()if bV.Settings.Multi then local cx={}
for cy,cz in ipairs(bW)do cx[cz]=true end if bV.Settings.Callback then bV.
Settings.Callback(cx)end else if cw and bV.Settings.Callback then bV.Settings.
Callback(bW[1]or nil)end end end)end)if ch then bY.Size=UDim2.new(1,0,0,cc())end
end if bV.Settings.Options then for cl,cn in pairs(bV.Settings.Options)do ck(cl,
cn)end end function bV:UpdateName(cl)b0.Text=cl end function bV:SetVisibility(cl
)bY.Visible=cl end function bV:UpdateSelection(cl)if not cl then return end for
cn,co in pairs(bX)do cg(cn,false)end local cn={}if type(cl)=='number'then for co
,cp in pairs(bX)do local cq=cp.Index==cl cg(co,cq)if cq then table.insert(cn,co)
end end elseif type(cl)=='string'then for co,cp in pairs(bX)do local cq=co==cl
cg(co,cq)if cq then table.insert(cn,co)end end elseif type(cl)=='table'then for
co,cp in pairs(bX)do local cq=table.find(cl,co)~=nil cg(co,cq)if cq then table.
insert(cn,co)end end end if bV.Settings.Callback then if bV.Settings.Multi then
local co={}for cp,cq in ipairs(cn)do co[cq]=true end bV.Settings.Callback(co)
else bV.Settings.Callback(cn[1]or nil)end end end function bV:InsertOptions(cl)
if not cl then return end bV.Settings.Options=cl for cn,co in pairs(cl)do ck(cn,
co)end end function bV:ClearOptions()for cl,cn in pairs(bX)do cn.Button:Destroy(
)end bX={}bW={}if ch then bY.Size=UDim2.new(1,0,0,cc())end end function bV:
GetOptions()local cl={}for cn,co in pairs(bX)do local cp=table.find(bW,cn)and
true or false cl[cn]=cp end return cl end function bV:RemoveOptions(cl)if not cl
then return end for cn,co in ipairs(cl)do local cp=bX[co]if cp then for cq=#bW,1
,-1 do if bW[cq]==co then table.remove(bW,cq)end end cp.Button:Destroy()bX[co]=
nil end end if ch then bY.Size=UDim2.new(1,0,0,cc())end end function bV:IsOption
(cl)if not cl then return end return bX[cl]~=nil end if bU then aa.Options[bU]=
bV end return bV end function bN:Colorpicker(bT,bU)local bV={Settings=bT,
IgnoreConfig=false,Class='Colorpicker'}local bW=bV.Settings.Alpha and true or
false bV.Color=bV.Settings.Default bV.Alpha=bW and bV.Settings.Alpha local bX=
Instance.new'Frame'bX.Name='Colorpicker'bX.AutomaticSize=Enum.AutomaticSize.Y bX
.BackgroundColor3=Color3.fromRGB(0,0,0)bX.BackgroundTransparency=1 bX.
BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel=0 bX.Size=UDim2.new(1,0,0,
38)bX.Parent=bO local bY=Instance.new'TextLabel'bY.Name='KeybindName'bY.FontFace
=Font.new(an.interFont)bY.Text=bT.Name bY.TextColor3=Color3.fromRGB(255,255,255)
bY.TextSize=13 bY.TextTransparency=0.5 bY.RichText=true bY.TextTruncate=Enum.
TextTruncate.AtEnd bY.TextXAlignment=Enum.TextXAlignment.Left bY.TextYAlignment=
Enum.TextYAlignment.Top bY.AnchorPoint=Vector2.new(0,0.5)bY.AutomaticSize=Enum.
AutomaticSize.XY bY.BackgroundColor3=Color3.fromRGB(255,255,255)bY.
BackgroundTransparency=1 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel
=0 bY.Position=UDim2.fromScale(0,0.5)bY.Parent=bX local bZ=Instance.new
'ImageLabel'bZ.Name='NewColor'bZ.Image=an.grid bZ.ScaleType=Enum.ScaleType.Tile
bZ.TileSize=UDim2.fromOffset(500,500)bZ.AnchorPoint=Vector2.new(1,0.5)bZ.
BackgroundColor3=Color3.fromRGB(255,255,255)bZ.BackgroundTransparency=1 bZ.
BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel=0 bZ.Position=UDim2.
fromScale(1,0.5)bZ.Size=UDim2.fromOffset(21,21)local b_=Instance.new'Frame'b_.
Name='Color'b_.AnchorPoint=Vector2.new(0.5,0.5)b_.BackgroundColor3=bV.Color b_.
BorderSizePixel=0 b_.Position=UDim2.fromScale(0.5,0.5)b_.Size=UDim2.fromScale(1,
1)b_.BackgroundTransparency=bV.Alpha or 0 local b0=Instance.new'UICorner'b0.Name
='UICorner'b0.CornerRadius=UDim.new(0,6)b0.Parent=b_ local b1=Instance.new
'TextButton'b1.Name='Interact'b1.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'b1.Text=''b1.TextColor3=Color3.
fromRGB(0,0,0)b1.TextSize=14 b1.BackgroundColor3=Color3.fromRGB(255,255,255)b1.
BackgroundTransparency=1 b1.BorderColor3=Color3.fromRGB(0,0,0)b1.BorderSizePixel
=0 b1.Size=UDim2.fromScale(1,1)b1.Parent=b_ b_.Parent=bZ local b2=Instance.new
'UICorner'b2.Name='UICorner'b2.CornerRadius=UDim.new(0,8)b2.Parent=bZ bZ.Parent=
bX local b3=Instance.new'Frame'b3.Name='ColorPicker'b3.BackgroundColor3=Color3.
fromRGB(0,0,0)b3.BackgroundTransparency=0.5 b3.BorderColor3=Color3.fromRGB(0,0,0
)b3.BorderSizePixel=0 b3.Size=UDim2.fromScale(1,1)b3.Visible=false local b4=
Instance.new'UICorner'b4.Name='BaseUICorner'b4.CornerRadius=UDim.new(0,10)b4.
Parent=b3 local b5=Instance.new'Frame'b5.Name='Prompt'b5.AnchorPoint=Vector2.
new(0.5,0.5)b5.AutomaticSize=Enum.AutomaticSize.Y b5.BackgroundColor3=Color3.
fromRGB(15,15,15)b5.BorderColor3=Color3.fromRGB(0,0,0)b5.BorderSizePixel=0 b5.
Position=UDim2.fromScale(0.5,0.5)b5.Size=UDim2.fromOffset(420,0)local b6=
Instance.new'UIScale'b6.Name='BaseUIScale'b6.Parent=b5 b6.Scale=0.95 local b7=
Instance.new'UIStroke'b7.Name='GlobalSettingsUIStroke'b7.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border b7.Color=Color3.fromRGB(255,255,255)b7.Transparency=0.9
b7.Parent=b5 local b8=Instance.new'UICorner'b8.Name='GlobalSettingsUICorner'b8.
CornerRadius=UDim.new(0,10)b8.Parent=b5 local b9=Instance.new'UIListLayout'b9.
Name='UIListLayout'b9.Padding=UDim.new(0,10)b9.HorizontalAlignment=Enum.
HorizontalAlignment.Center b9.SortOrder=Enum.SortOrder.LayoutOrder b9.Parent=b5
local ca=Instance.new'Frame'ca.Name='ColorOptions'ca.AutomaticSize=Enum.
AutomaticSize.XY ca.BackgroundColor3=Color3.fromRGB(255,255,255)ca.
BackgroundTransparency=1 ca.BorderColor3=Color3.fromRGB(0,0,0)ca.BorderSizePixel
=0 ca.LayoutOrder=1 ca.Size=UDim2.fromScale(1,0)local cb=Instance.new
'TextButton'cb.Name='Value'cb.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'cb.Text=''cb.TextColor3=Color3.
fromRGB(0,0,0)cb.TextSize=14 cb.AutoButtonColor=false cb.BackgroundColor3=Color3
.fromRGB(255,255,255)cb.BorderColor3=Color3.fromRGB(0,0,0)cb.BorderSizePixel=0
cb.LayoutOrder=1 cb.Position=UDim2.fromScale(0.092,0.886)cb.Size=UDim2.new(1,0,0
,15)local cc=Instance.new'UIGradient'cc.Name='UIGradient'cc.Color=ColorSequence.
new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))}cc.Parent=cb local cd=
Instance.new'Frame'cd.Name='Slide'cd.AnchorPoint=Vector2.new(0,0.5)cd.
BackgroundColor3=Color3.fromRGB(255,255,255)cd.BorderColor3=Color3.fromRGB(27,42
,53)cd.BorderSizePixel=0 cd.Position=UDim2.fromScale(0,0.5)cd.Size=UDim2.new(0,
13,1,8)local ce=Instance.new'UICorner'ce.Name='UICorner'ce.CornerRadius=UDim.
new(1,0)ce.Parent=cd local cf=Instance.new'UIStroke'cf.Name='UIStroke'cf.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border cf.Transparency=0.5 cf.Parent=cd cd.
Parent=cb local cg=Instance.new'UICorner'cg.Name='UICorner'cg.CornerRadius=UDim.
new(0,6)cg.Parent=cb local ch=Instance.new'UIStroke'ch.Name='UIStroke'ch.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border ch.Color=Color3.fromRGB(255,255,255)
ch.Transparency=0.9 local ci=Instance.new'UIGradient'ci.Name='UIGradient'ci.
Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255))
,ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))}ci.Rotation=180 ci.Parent=ch
ch.Parent=cb cb.Parent=ca local cj=Instance.new'UIListLayout'cj.Name=
'UIListLayout'cj.Padding=UDim.new(0,25)cj.SortOrder=Enum.SortOrder.LayoutOrder
cj.Parent=ca local ck=Instance.new'Frame'ck.Name='Wheel'ck.AutomaticSize=Enum.
AutomaticSize.Y ck.BackgroundColor3=Color3.fromRGB(255,255,255)ck.
BackgroundTransparency=1 ck.BorderColor3=Color3.fromRGB(0,0,0)ck.BorderSizePixel
=0 ck.Size=UDim2.new(1,0,0,100)local cl=Instance.new'ImageButton'cl.Name='Wheel'
cl.Image=an.colorWheel cl.AutoButtonColor=false cl.Active=false cl.
BackgroundColor3=Color3.fromRGB(248,248,248)cl.BackgroundTransparency=1 cl.
BorderColor3=Color3.fromRGB(27,42,53)cl.Selectable=false cl.Size=UDim2.
fromOffset(220,220)cl.SizeConstraint=Enum.SizeConstraint.RelativeYY local cn=
Instance.new'ImageLabel'cn.Name='Target'cn.Image=an.colorTarget cn.ImageColor3=
Color3.fromRGB(0,0,0)cn.AnchorPoint=Vector2.new(0.5,0.5)cn.BackgroundColor3=
Color3.fromRGB(255,255,255)cn.BackgroundTransparency=1 cn.BorderColor3=Color3.
fromRGB(27,42,53)cn.Position=UDim2.fromScale(0.5,0.5)cn.Size=UDim2.fromOffset(22
,22)cn.SizeConstraint=Enum.SizeConstraint.RelativeYY cn.Parent=cl cl.Parent=ck
local co=Instance.new'Frame'co.Name='Inputs'co.AnchorPoint=Vector2.new(1,0.5)co.
AutomaticSize=Enum.AutomaticSize.XY co.BackgroundColor3=Color3.fromRGB(255,255,
255)co.BackgroundTransparency=1 co.BorderColor3=Color3.fromRGB(0,0,0)co.
BorderSizePixel=0 co.LayoutOrder=1 co.Position=UDim2.fromScale(1,0.5)local cp=
Instance.new'UIListLayout'cp.Name='UIListLayout'cp.Padding=UDim.new(0,5)cp.
SortOrder=Enum.SortOrder.LayoutOrder cp.Parent=co local cq=Instance.new'Frame'cq
.Name='Red'cq.AutomaticSize=Enum.AutomaticSize.XY cq.BackgroundColor3=Color3.
fromRGB(0,0,0)cq.BackgroundTransparency=1 cq.BorderColor3=Color3.fromRGB(0,0,0)
cq.BorderSizePixel=0 cq.LayoutOrder=1 cq.Size=UDim2.fromOffset(0,38)local cr=
Instance.new'TextLabel'cr.Name='InputName'cr.FontFace=Font.new(an.interFont)cr.
Text='Red'cr.TextColor3=Color3.fromRGB(255,255,255)cr.TextSize=13 cr.
TextTransparency=0.5 cr.TextTruncate=Enum.TextTruncate.AtEnd cr.TextXAlignment=
Enum.TextXAlignment.Left cr.TextYAlignment=Enum.TextYAlignment.Top cr.
AnchorPoint=Vector2.new(0,0.5)cr.AutomaticSize=Enum.AutomaticSize.XY cr.
BackgroundColor3=Color3.fromRGB(255,255,255)cr.BackgroundTransparency=1 cr.
BorderColor3=Color3.fromRGB(0,0,0)cr.BorderSizePixel=0 cr.LayoutOrder=2 cr.
Position=UDim2.fromScale(0,0.5)cr.Parent=cq local cs=Instance.new'UIListLayout'
cs.Name='UIListLayout'cs.Padding=UDim.new(0,15)cs.FillDirection=Enum.
FillDirection.Horizontal cs.SortOrder=Enum.SortOrder.LayoutOrder cs.
VerticalAlignment=Enum.VerticalAlignment.Center cs.Parent=cq local ct=Instance.
new'TextBox'ct.Name='InputBox'ct.ClearTextOnFocus=false ct.CursorPosition=-1 ct.
FontFace=Font.new(an.interFont)ct.Text='255'ct.TextColor3=Color3.fromRGB(255,255
,255)ct.TextSize=12 ct.TextTransparency=0.1 ct.TextXAlignment=Enum.
TextXAlignment.Left ct.AnchorPoint=Vector2.new(1,0.5)ct.BackgroundColor3=Color3.
fromRGB(255,255,255)ct.BackgroundTransparency=0.95 ct.BorderColor3=Color3.
fromRGB(0,0,0)ct.BorderSizePixel=0 ct.ClipsDescendants=true ct.LayoutOrder=1 ct.
Position=UDim2.fromScale(1,0.5)ct.Size=UDim2.fromOffset(75,25)local cu=Instance.
new'UICorner'cu.Name='InputBoxUICorner'cu.CornerRadius=UDim.new(0,4)cu.Parent=ct
local cv=Instance.new'UIStroke'cv.Name='InputBoxUIStroke'cv.ApplyStrokeMode=Enum
.ApplyStrokeMode.Border cv.Color=Color3.fromRGB(255,255,255)cv.Transparency=0.9
cv.Parent=ct local cw=Instance.new'UISizeConstraint'cw.Name=
'InputBoxUISizeConstraint'cw.Parent=ct local cx=Instance.new'UIPadding'cx.Name=
'InputBoxUIPadding'cx.PaddingLeft=UDim.new(0,8)cx.PaddingRight=UDim.new(0,10)cx.
Parent=ct ct.Parent=cq cq.Parent=co local cy=Instance.new'Frame'cy.Name='Green'
cy.AutomaticSize=Enum.AutomaticSize.XY cy.BackgroundColor3=Color3.fromRGB(0,0,0)
cy.BackgroundTransparency=1 cy.BorderColor3=Color3.fromRGB(0,0,0)cy.
BorderSizePixel=0 cy.LayoutOrder=2 cy.Size=UDim2.fromOffset(0,38)local cz=
Instance.new'TextLabel'cz.Name='InputName'cz.FontFace=Font.new(an.interFont)cz.
Text='Green'cz.TextColor3=Color3.fromRGB(255,255,255)cz.TextSize=13 cz.
TextTransparency=0.5 cz.TextTruncate=Enum.TextTruncate.AtEnd cz.TextXAlignment=
Enum.TextXAlignment.Left cz.TextYAlignment=Enum.TextYAlignment.Top cz.
AnchorPoint=Vector2.new(0,0.5)cz.AutomaticSize=Enum.AutomaticSize.XY cz.
BackgroundColor3=Color3.fromRGB(255,255,255)cz.BackgroundTransparency=1 cz.
BorderColor3=Color3.fromRGB(0,0,0)cz.BorderSizePixel=0 cz.LayoutOrder=2 cz.
Position=UDim2.fromScale(0,0.5)cz.Parent=cy local cA=Instance.new'UIListLayout'
cA.Name='UIListLayout'cA.Padding=UDim.new(0,15)cA.FillDirection=Enum.
FillDirection.Horizontal cA.SortOrder=Enum.SortOrder.LayoutOrder cA.
VerticalAlignment=Enum.VerticalAlignment.Center cA.Parent=cy local cB=Instance.
new'TextBox'cB.Name='InputBox'cB.ClearTextOnFocus=false cB.FontFace=Font.new(an.
interFont)cB.Text='255'cB.TextColor3=Color3.fromRGB(255,255,255)cB.TextSize=12
cB.TextTransparency=0.1 cB.TextXAlignment=Enum.TextXAlignment.Left cB.
AnchorPoint=Vector2.new(1,0.5)cB.BackgroundColor3=Color3.fromRGB(255,255,255)cB.
BackgroundTransparency=0.95 cB.BorderColor3=Color3.fromRGB(0,0,0)cB.
BorderSizePixel=0 cB.ClipsDescendants=true cB.LayoutOrder=1 cB.Position=UDim2.
fromScale(1,0.5)cB.Size=UDim2.fromOffset(75,25)local cC=Instance.new'UICorner'cC
.Name='InputBoxUICorner'cC.CornerRadius=UDim.new(0,4)cC.Parent=cB local cD=
Instance.new'UIStroke'cD.Name='InputBoxUIStroke'cD.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cD.Color=Color3.fromRGB(255,255,255)cD.Transparency=0.9
cD.Parent=cB local cE=Instance.new'UISizeConstraint'cE.Name=
'InputBoxUISizeConstraint'cE.Parent=cB local cF=Instance.new'UIPadding'cF.Name=
'InputBoxUIPadding'cF.PaddingLeft=UDim.new(0,8)cF.PaddingRight=UDim.new(0,10)cF.
Parent=cB cB.Parent=cy cy.Parent=co local cG=Instance.new'Frame'cG.Name='Blue'cG
.AutomaticSize=Enum.AutomaticSize.XY cG.BackgroundColor3=Color3.fromRGB(0,0,0)cG
.BackgroundTransparency=1 cG.BorderColor3=Color3.fromRGB(0,0,0)cG.
BorderSizePixel=0 cG.LayoutOrder=3 cG.Size=UDim2.fromOffset(0,38)local cH=
Instance.new'TextLabel'cH.Name='InputName'cH.FontFace=Font.new(an.interFont)cH.
Text='Blue'cH.TextColor3=Color3.fromRGB(255,255,255)cH.TextSize=13 cH.
TextTransparency=0.5 cH.TextTruncate=Enum.TextTruncate.AtEnd cH.TextXAlignment=
Enum.TextXAlignment.Left cH.TextYAlignment=Enum.TextYAlignment.Top cH.
AnchorPoint=Vector2.new(0,0.5)cH.AutomaticSize=Enum.AutomaticSize.XY cH.
BackgroundColor3=Color3.fromRGB(255,255,255)cH.BackgroundTransparency=1 cH.
BorderColor3=Color3.fromRGB(0,0,0)cH.BorderSizePixel=0 cH.LayoutOrder=2 cH.
Position=UDim2.fromScale(0,0.5)cH.Parent=cG local cI=Instance.new'UIListLayout'
cI.Name='UIListLayout'cI.Padding=UDim.new(0,15)cI.FillDirection=Enum.
FillDirection.Horizontal cI.SortOrder=Enum.SortOrder.LayoutOrder cI.
VerticalAlignment=Enum.VerticalAlignment.Center cI.Parent=cG local cJ=Instance.
new'TextBox'cJ.Name='InputBox'cJ.ClearTextOnFocus=false cJ.FontFace=Font.new(an.
interFont)cJ.Text='255'cJ.TextColor3=Color3.fromRGB(255,255,255)cJ.TextSize=12
cJ.TextTransparency=0.1 cJ.TextXAlignment=Enum.TextXAlignment.Left cJ.
AnchorPoint=Vector2.new(1,0.5)cJ.BackgroundColor3=Color3.fromRGB(255,255,255)cJ.
BackgroundTransparency=0.95 cJ.BorderColor3=Color3.fromRGB(0,0,0)cJ.
BorderSizePixel=0 cJ.ClipsDescendants=true cJ.LayoutOrder=1 cJ.Position=UDim2.
fromScale(1,0.5)cJ.Size=UDim2.fromOffset(75,25)local cK=Instance.new'UICorner'cK
.Name='InputBoxUICorner'cK.CornerRadius=UDim.new(0,4)cK.Parent=cJ local cL=
Instance.new'UIStroke'cL.Name='InputBoxUIStroke'cL.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cL.Color=Color3.fromRGB(255,255,255)cL.Transparency=0.9
cL.Parent=cJ local cM=Instance.new'UISizeConstraint'cM.Name=
'InputBoxUISizeConstraint'cM.Parent=cJ local cN=Instance.new'UIPadding'cN.Name=
'InputBoxUIPadding'cN.PaddingLeft=UDim.new(0,8)cN.PaddingRight=UDim.new(0,10)cN.
Parent=cJ cJ.Parent=cG cG.Parent=co local cO=Instance.new'Frame'cO.Name='Alpha'
cO.AutomaticSize=Enum.AutomaticSize.XY cO.BackgroundColor3=Color3.fromRGB(0,0,0)
cO.BackgroundTransparency=1 cO.BorderColor3=Color3.fromRGB(0,0,0)cO.
BorderSizePixel=0 cO.LayoutOrder=4 cO.Size=UDim2.fromOffset(0,38)cO.Visible=bW
local cP=Instance.new'TextLabel'cP.Name='InputName'cP.FontFace=Font.new(an.
interFont)cP.Text='Alpha'cP.TextColor3=Color3.fromRGB(255,255,255)cP.TextSize=13
cP.TextTransparency=0.5 cP.TextTruncate=Enum.TextTruncate.AtEnd cP.
TextXAlignment=Enum.TextXAlignment.Left cP.TextYAlignment=Enum.TextYAlignment.
Top cP.AnchorPoint=Vector2.new(0,0.5)cP.AutomaticSize=Enum.AutomaticSize.XY cP.
BackgroundColor3=Color3.fromRGB(255,255,255)cP.BackgroundTransparency=1 cP.
BorderColor3=Color3.fromRGB(0,0,0)cP.BorderSizePixel=0 cP.LayoutOrder=2 cP.
Position=UDim2.fromScale(0,0.5)cP.Parent=cO local cQ=Instance.new'UIListLayout'
cQ.Name='UIListLayout'cQ.Padding=UDim.new(0,15)cQ.FillDirection=Enum.
FillDirection.Horizontal cQ.SortOrder=Enum.SortOrder.LayoutOrder cQ.
VerticalAlignment=Enum.VerticalAlignment.Center cQ.Parent=cO local cR=Instance.
new'TextBox'cR.Name='InputBox'cR.ClearTextOnFocus=false cR.FontFace=Font.new(an.
interFont)cR.Text='0'cR.TextColor3=Color3.fromRGB(255,255,255)cR.TextSize=12 cR.
TextTransparency=0.1 cR.TextXAlignment=Enum.TextXAlignment.Left cR.AnchorPoint=
Vector2.new(1,0.5)cR.BackgroundColor3=Color3.fromRGB(255,255,255)cR.
BackgroundTransparency=0.95 cR.BorderColor3=Color3.fromRGB(0,0,0)cR.
BorderSizePixel=0 cR.ClipsDescendants=true cR.LayoutOrder=1 cR.Position=UDim2.
fromScale(1,0.5)cR.Size=UDim2.fromOffset(75,25)local cS=Instance.new'UICorner'cS
.Name='InputBoxUICorner'cS.CornerRadius=UDim.new(0,4)cS.Parent=cR local cT=
Instance.new'UIStroke'cT.Name='InputBoxUIStroke'cT.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cT.Color=Color3.fromRGB(255,255,255)cT.Transparency=0.9
cT.Parent=cR local cU=Instance.new'UISizeConstraint'cU.Name=
'InputBoxUISizeConstraint'cU.Parent=cR local cV=Instance.new'UIPadding'cV.Name=
'InputBoxUIPadding'cV.PaddingLeft=UDim.new(0,8)cV.PaddingRight=UDim.new(0,10)cV.
Parent=cR cR.Parent=cO cO.Parent=co local cW=Instance.new'Frame'cW.Name='Hex'cW.
AutomaticSize=Enum.AutomaticSize.XY cW.BackgroundColor3=Color3.fromRGB(0,0,0)cW.
BackgroundTransparency=1 cW.BorderColor3=Color3.fromRGB(0,0,0)cW.BorderSizePixel
=0 cW.Size=UDim2.fromOffset(0,38)local cX=Instance.new'TextLabel'cX.Name=
'InputName'cX.FontFace=Font.new(an.interFont)cX.Text='Hex'cX.TextColor3=Color3.
fromRGB(255,255,255)cX.TextSize=13 cX.TextTransparency=0.5 cX.TextTruncate=Enum.
TextTruncate.AtEnd cX.TextXAlignment=Enum.TextXAlignment.Left cX.TextYAlignment=
Enum.TextYAlignment.Top cX.AnchorPoint=Vector2.new(0,0.5)cX.AutomaticSize=Enum.
AutomaticSize.XY cX.BackgroundColor3=Color3.fromRGB(255,255,255)cX.
BackgroundTransparency=1 cX.BorderColor3=Color3.fromRGB(0,0,0)cX.BorderSizePixel
=0 cX.LayoutOrder=2 cX.Position=UDim2.fromScale(0,0.5)cX.Parent=cW local cY=
Instance.new'UIListLayout'cY.Name='UIListLayout'cY.Padding=UDim.new(0,15)cY.
FillDirection=Enum.FillDirection.Horizontal cY.SortOrder=Enum.SortOrder.
LayoutOrder cY.VerticalAlignment=Enum.VerticalAlignment.Center cY.Parent=cW
local cZ=Instance.new'TextBox'cZ.Name='InputBox'cZ.ClearTextOnFocus=false cZ.
CursorPosition=-1 cZ.FontFace=Font.new(an.interFont)cZ.Text='255'cZ.TextColor3=
Color3.fromRGB(255,255,255)cZ.TextSize=12 cZ.TextTransparency=0.1 cZ.
TextXAlignment=Enum.TextXAlignment.Left cZ.AnchorPoint=Vector2.new(1,0.5)cZ.
BackgroundColor3=Color3.fromRGB(255,255,255)cZ.BackgroundTransparency=0.95 cZ.
BorderColor3=Color3.fromRGB(0,0,0)cZ.BorderSizePixel=0 cZ.ClipsDescendants=true
cZ.LayoutOrder=1 cZ.Position=UDim2.fromScale(1,0.5)cZ.Size=UDim2.fromOffset(75,
25)local c_=Instance.new'UICorner'c_.Name='InputBoxUICorner'c_.CornerRadius=UDim
.new(0,4)c_.Parent=cZ local c0=Instance.new'UIStroke'c0.Name='InputBoxUIStroke'
c0.ApplyStrokeMode=Enum.ApplyStrokeMode.Border c0.Color=Color3.fromRGB(255,255,
255)c0.Transparency=0.9 c0.Parent=cZ local c1=Instance.new'UISizeConstraint'c1.
Name='InputBoxUISizeConstraint'c1.Parent=cZ local c2=Instance.new'UIPadding'c2.
Name='InputBoxUIPadding'c2.PaddingLeft=UDim.new(0,8)c2.PaddingRight=UDim.new(0,
10)c2.Parent=cZ cZ.Parent=cW cW.Parent=co co.Parent=ck local c3=Instance.new
'UIPadding'c3.Name='UIPadding'c3.PaddingRight=UDim.new(0,5)c3.Parent=ck ck.
Parent=ca local c4=Instance.new'Frame'c4.Name='ColorWells'c4.AutomaticSize=Enum.
AutomaticSize.Y c4.BackgroundColor3=Color3.fromRGB(255,255,255)c4.
BackgroundTransparency=1 c4.BorderColor3=Color3.fromRGB(0,0,0)c4.BorderSizePixel
=0 c4.LayoutOrder=2 c4.Size=UDim2.fromScale(1,0)local c5=Instance.new
'UIGridLayout'c5.Name='UIGridLayout'c5.CellPadding=UDim2.fromOffset(10,0)c5.
CellSize=UDim2.new(0.5,-5,0,30)c5.SortOrder=Enum.SortOrder.LayoutOrder c5.Parent
=c4 local c6=Instance.new'ImageLabel'c6.Name='NewColor'c6.Image=an.grid c6.
ScaleType=Enum.ScaleType.Tile c6.TileSize=UDim2.fromOffset(500,500)c6.
BackgroundColor3=Color3.fromRGB(255,255,255)c6.BackgroundTransparency=1 c6.
BorderColor3=Color3.fromRGB(0,0,0)c6.BorderSizePixel=0 c6.Size=UDim2.fromOffset(
100,100)local c7=Instance.new'UICorner'c7.Name='UICorner'c7.Parent=c6 local c8=
Instance.new'Frame'c8.Name='Color'c8.AnchorPoint=Vector2.new(0.5,0.5)c8.
BorderColor3=Color3.fromRGB(27,42,53)c8.BorderSizePixel=0 c8.Position=UDim2.
fromScale(0.5,0.5)c8.Size=UDim2.new(1,1,1,1)local c9=Instance.new'UICorner'c9.
Name='UICorner'c9.Parent=c8 c8.Parent=c6 c6.Parent=c4 local da=Instance.new
'ImageLabel'da.Name='OldColor'da.Image=an.grid da.ScaleType=Enum.ScaleType.Tile
da.TileSize=UDim2.fromOffset(500,500)da.BackgroundColor3=Color3.fromRGB(255,255,
255)da.BackgroundTransparency=1 da.BorderColor3=Color3.fromRGB(0,0,0)da.
BorderSizePixel=0 da.LayoutOrder=1 da.Size=UDim2.fromOffset(100,100)local db=
Instance.new'UICorner'db.Name='UICorner'db.Parent=da local dc=Instance.new
'Frame'dc.Name='Color'dc.AnchorPoint=Vector2.new(0.5,0.5)dc.BorderColor3=Color3.
fromRGB(27,42,53)dc.BorderSizePixel=0 dc.Position=UDim2.fromScale(0.5,0.5)dc.
Size=UDim2.new(1,1,1,1)local dd=Instance.new'UICorner'dd.Name='UICorner'dd.
Parent=dc dc.Parent=da da.Parent=c4 c4.Parent=ca ca.Parent=b5 local de=Instance.
new'Frame'de.Name='Interactions'de.AutomaticSize=Enum.AutomaticSize.Y de.
BackgroundColor3=Color3.fromRGB(0,0,0)de.BackgroundTransparency=1 de.
BorderColor3=Color3.fromRGB(0,0,0)de.BorderSizePixel=0 de.LayoutOrder=2 de.Size=
UDim2.fromScale(1,0)local df=Instance.new'UIListLayout'df.Name='UIListLayout'df.
Padding=UDim.new(0,10)df.SortOrder=Enum.SortOrder.LayoutOrder df.Parent=de local
dg=Instance.new'TextButton'dg.Name='Confirm'dg.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.Medium,Enum.FontStyle.Normal)dg.Text=
'Confirm'dg.TextColor3=Color3.fromRGB(255,255,255)dg.TextSize=15 dg.
TextTransparency=0.5 dg.TextTruncate=Enum.TextTruncate.AtEnd dg.AutoButtonColor=
false dg.AutomaticSize=Enum.AutomaticSize.Y dg.BackgroundColor3=Color3.fromRGB(
25,25,25)dg.BorderColor3=Color3.fromRGB(0,0,0)dg.BorderSizePixel=0 dg.Size=UDim2
.fromScale(1,0)local dh=Instance.new'UIPadding'dh.Name='UIPadding'dh.
PaddingBottom=UDim.new(0,9)dh.PaddingLeft=UDim.new(0,10)dh.PaddingRight=UDim.
new(0,10)dh.PaddingTop=UDim.new(0,9)dh.Parent=dg local di=Instance.new'UICorner'
di.Name='BaseUICorner'di.CornerRadius=UDim.new(0,10)di.Parent=dg dg.Parent=de
local dj=Instance.new'TextButton'dj.Name='Cancel'dj.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.Medium,Enum.FontStyle.Normal)dj.Text=
'Cancel'dj.TextColor3=Color3.fromRGB(255,255,255)dj.TextSize=15 dj.
TextTransparency=0.5 dj.TextTruncate=Enum.TextTruncate.AtEnd dj.AutoButtonColor=
false dj.AutomaticSize=Enum.AutomaticSize.Y dj.BackgroundColor3=Color3.fromRGB(
25,25,25)dj.BorderColor3=Color3.fromRGB(0,0,0)dj.BorderSizePixel=0 dj.Size=UDim2
.fromScale(1,0)local dk=Instance.new'UICorner'dk.Name='BaseUICorner'dk.
CornerRadius=UDim.new(0,10)dk.Parent=dj local dl=Instance.new'UIPadding'dl.Name=
'UIPadding'dl.PaddingBottom=UDim.new(0,9)dl.PaddingLeft=UDim.new(0,10)dl.
PaddingRight=UDim.new(0,10)dl.PaddingTop=UDim.new(0,9)dl.Parent=dj dj.Parent=de
local dm=Instance.new'UIPadding'dm.Name='UIPadding'dm.PaddingTop=UDim.new(0,10)
dm.Parent=de de.Parent=b5 local dn=Instance.new'UIPadding'dn.Name=
'GlobalSettingsUIPadding'dn.PaddingBottom=UDim.new(0,20)dn.PaddingLeft=UDim.new(
0,20)dn.PaddingRight=UDim.new(0,20)dn.PaddingTop=UDim.new(0,20)dn.Parent=b5
local dp=Instance.new'Frame'dp.Name='Paragraph'dp.AutomaticSize=Enum.
AutomaticSize.Y dp.BackgroundColor3=Color3.fromRGB(0,0,0)dp.
BackgroundTransparency=1 dp.BorderColor3=Color3.fromRGB(0,0,0)dp.BorderSizePixel
=0 dp.Size=UDim2.fromScale(1,0)local dq=Instance.new'TextLabel'dq.Name=
'ParagraphHeader'dq.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight
.SemiBold,Enum.FontStyle.Normal)dq.RichText=true dq.Text=bV.Settings.Name dq.
TextColor3=Color3.fromRGB(255,255,255)dq.TextSize=18 dq.TextTransparency=0.4 dq.
TextWrapped=true dq.TextYAlignment=Enum.TextYAlignment.Top dq.AutomaticSize=Enum
.AutomaticSize.XY dq.BackgroundColor3=Color3.fromRGB(255,255,255)dq.
BackgroundTransparency=1 dq.BorderColor3=Color3.fromRGB(0,0,0)dq.BorderSizePixel
=0 dq.Size=UDim2.fromScale(1,0)dq.Parent=dp local dr=Instance.new'UIListLayout'
dr.Name='UIListLayout'dr.Padding=UDim.new(0,15)dr.HorizontalAlignment=Enum.
HorizontalAlignment.Center dr.SortOrder=Enum.SortOrder.LayoutOrder dr.Parent=dp
local ds=Instance.new'UIPadding'ds.Name='UIPadding'ds.PaddingBottom=UDim.new(0,
15)ds.Parent=dp local dt=Instance.new'Frame'dt.Name='Line'dt.BackgroundColor3=
Color3.fromRGB(255,255,255)dt.BackgroundTransparency=0.9 dt.BorderColor3=Color3.
fromRGB(0,0,0)dt.BorderSizePixel=0 dt.LayoutOrder=1 dt.Size=UDim2.new(1,0,0,1)dt
.Parent=dp dp.Parent=b5 b5.Parent=b3 b3.Parent=m local du,dv,dw,dx,dy,dz,dA,dB,
dC,dD,dE,dF,dG,dH,dI,dJ,dK,dL,dM=Color3.fromHSV,Color3.fromRGB,Vector2.new,UDim2
.new,cl,cn,cb,c8,{Hex=cW.InputBox,Red=cq.InputBox,Green=cy.InputBox,Blue=cG.
InputBox,Alpha=cO.InputBox},aj:GetMouse(),false,false,0,0,1,function(du)return
math.atan2(du.y,du.x),du.magnitude end,function(du)return((du+math.pi)/(2*math.
pi))*360 end,function(du)return du*(math.pi/180)end,function(du)du=du:gsub('#',
'')if#du~=6 then return 0,0,0 end local dv,dw,dx=tonumber(du:sub(1,2),16)or 0,
tonumber(du:sub(3,4),16)or 0,tonumber(du:sub(5,6),16)or 0 return dv,dw,dx end
local dN=function(dN,dO,dP)local dQ=tonumber(dN)if dQ then return math.clamp(dQ,
dO,dP)end return dO end local dO=function()local dO=du(dG,dH,dI)dB.
BackgroundColor3=dO dB.BackgroundTransparency=dN(dC.Alpha.Text,0,1)dC.Red.Text=
tostring(math.floor(dO.r*255+0.5))dC.Green.Text=tostring(math.floor(dO.g*255+0.5
))dC.Blue.Text=tostring(math.floor(dO.b*255+0.5))dC.Alpha.Text=dN(dC.Alpha.Text,
0,1)local dP=string.format('#%02X%02X%02X',math.floor(dO.r*255+0.5),math.floor(
dO.g*255+0.5),math.floor(dO.b*255+0.5))dC.Hex.Text=dP end local dP,dQ,dR,dS=
function(dP)local dQ=dP-dA.AbsolutePosition.X local dR=math.clamp(dQ,0,dA.
AbsoluteSize.X-cd.AbsoluteSize.X)cd.Position=dx(0,dR,0.5,0)dI=1-(dR/(dA.
AbsoluteSize.X-cd.AbsoluteSize.X))dO()end,function(dP,dQ)local dR,dS=dy.
AbsoluteSize.x/2,dw(dP,dQ)-dy.AbsolutePosition-dy.AbsoluteSize/2 if dS:Dot(dS)>
dR*dR then dS=dS.unit*dR end dz.Position=dx(0.5,dS.x,0.5,dS.y)local dT,dU=dJ(dS*
dw(1,-1))dG,dH=dK(dT)/360,math.clamp(dU/dR,0,1)dA.BackgroundColor3=du(dG,dH,1)
dO()end,function(dP)local dQ=(1-dP)*(dA.AbsoluteSize.X-cd.AbsoluteSize.X)cd.
Position=UDim2.new(0,dQ,0.5,0)end,function(dP,dQ)local dR,dS=dy.AbsoluteSize.X/2
,dL(dP*360)local dT=dQ*dR local dU,dV=dT*math.cos(dS),dT*math.sin(dS)dz.Position
=UDim2.new(0.5,-dU,0.5,dV)dA.BackgroundColor3=du(dP,dQ,1)end local dT,dU,dV=
function()local dT,dU,dV=dN(dC.Red.Text,0,255),dN(dC.Green.Text,0,255),dN(dC.
Blue.Text,0,255)dC.Red.Text=dT dC.Green.Text=dU dC.Blue.Text=dV dG,dH,dI=Color3.
fromRGB(dT,dU,dV):ToHSV()dR(dI)dS(dG,dH)dO()end,function()local dT=dC.Hex.Text
local dU,dV,dW=dM(dT)dU=dN(dU,0,255)dV=dN(dV,0,255)dW=dN(dW,0,255)dC.Red.Text=dU
dC.Green.Text=dV dC.Blue.Text=dW dG,dH,dI=Color3.fromRGB(dU,dV,dW):ToHSV()dR(dI)
dS(dG,dH)dO()end,function()local dT,dU,dV=math.floor(bV.Color.R*255+0.5),math.
floor(bV.Color.G*255+0.5),math.floor(bV.Color.B*255+0.5)dC.Red.Text=dT dC.Green.
Text=dU dC.Blue.Text=dV dC.Alpha.Text=bW and bV.Alpha or 0 local dW=string.
format('#%02X%02X%02X',dT,dU,dV)dC.Hex.Text=dW dG,dH,dI=Color3.fromRGB(dT,dU,dV)
:ToHSV()dc.BackgroundColor3=bV.Color dc.BackgroundTransparency=bW and bV.Alpha
or 0 dB.BackgroundColor3=Color3.fromRGB(dT,dU,dV)dB.BackgroundTransparency=bW
and bV.Alpha or 0 dR(dI)dS(dG,dH)end dy.InputBegan:Connect(function(dW)if dW.
UserInputType==Enum.UserInputType.MouseButton1 or dW.UserInputType==Enum.
UserInputType.Touch then dE=true dQ(dD.X,dD.Y)end end)dA.InputBegan:Connect(
function(dW)if dW.UserInputType==Enum.UserInputType.MouseButton1 or dW.
UserInputType==Enum.UserInputType.Touch then dF=true dP(dD.X)end end)dA.
InputEnded:Connect(function(dW)if dW.UserInputType==Enum.UserInputType.
MouseButton1 or dW.UserInputType==Enum.UserInputType.Touch then dF=false end end
)dy.InputEnded:Connect(function(dW)if dW.UserInputType==Enum.UserInputType.
MouseButton1 or dW.UserInputType==Enum.UserInputType.Touch then dE=false end end
)af.InputChanged:Connect(function(dW)if dW.UserInputType==Enum.UserInputType.
MouseMovement or dW.UserInputType==Enum.UserInputType.Touch then if dF then dP(
dD.X)elseif dE then dQ(dD.X,dD.Y)end end end)local dW=function(dW)local dX=dW.
Text dW.Text=''dW.PlaceholderText=dX end dC.Hex.FocusLost:Connect(dU)dC.Red.
FocusLost:Connect(dT)dC.Green.FocusLost:Connect(dT)dC.Blue.FocusLost:Connect(dT)
dC.Alpha.FocusLost:Connect(dO)dC.Hex.Focused:Connect(function()dW(dC.Hex)end)dC.
Red.Focused:Connect(function()dW(dC.Red)end)dC.Green.Focused:Connect(function()
dW(dC.Green)end)dC.Blue.Focused:Connect(function()dW(dC.Blue)end)dC.Alpha.
Focused:Connect(function()dW(dC.Alpha)end)local dX=function()local dX=Instance.
new'CanvasGroup'dX.Name='ColorPickerCanvas'dX.BackgroundTransparency=1 dX.
BorderSizePixel=0 dX.Size=UDim2.fromScale(1,1)dX.ZIndex=5 dX.GroupTransparency=1
dX.Parent=m dX.Visible=false return dX end local dY=function(dY)local dZ,d_,d0,
d1,d2=dX(),dY and 0 or 1,dY and 1 or 0.95,dY and 1 or 0,TweenInfo.new(0.1,Enum.
EasingStyle.Sine)local d3,d4=f(dZ,d2,{GroupTransparency=d_}),f(b6,d2,{Scale=d0})
b3.Visible=true b3.Parent=dZ dZ.Visible=true dZ.GroupTransparency=d1 d3:Play()d4
:Play()d3.Completed:Wait()if not dY then b3.Visible=false dZ.Visible=false end
b3.Parent=m dZ:Destroy()end local dZ,d_=function()dY(true)end,function()dY(false
)end b1.MouseButton1Click:Connect(dZ)dj.MouseButton1Click:Connect(d_)dg.
MouseButton1Click:Connect(function()d_()local d0=du(dG,dH,dI)bV.Color=Color3.
fromRGB(d0.r*255,d0.g*255,d0.b*255)bV.Alpha=bW and dN(dC.Alpha.Text,0,1)dc.
BackgroundColor3=bV.Color dc.BackgroundTransparency=bW and bV.Alpha or 0 b_.
BackgroundColor3=bV.Color b_.BackgroundTransparency=bW and bV.Alpha or 0 if bV.
Settings.Callback then task.spawn(function()bV.Settings.Callback(bV.Color,bW and
bV.Alpha)end)end end)dV()function bV:UpdateName(d0)bY.Text=d0 end function bV:
SetVisibility(d0)bX.Visible=d0 end function bV:SetColor(d0)bV.Color=d0 b_.
BackgroundColor3=d0 local d1,d2,d3=math.floor(bV.Color.R*255+0.5),math.floor(bV.
Color.G*255+0.5),math.floor(bV.Color.B*255+0.5)dC.Red.Text=d1 dC.Green.Text=d2
dC.Blue.Text=d3 local d4=string.format('#%02X%02X%02X',d1,d2,d3)dC.Hex.Text=d4
dG,dH,dI=Color3.fromRGB(d1,d2,d3):ToHSV()dc.BackgroundColor3=bV.Color dB.
BackgroundColor3=Color3.fromRGB(d1,d2,d3)dR(dI)dS(dG,dH)if bV.Settings.Callback
then task.spawn(function()bV.Settings.Callback(bV.Color,bW and bV.Alpha)end)end
end function bV:SetAlpha(d0)bV.Alpha=d0 b_.Transparency=d0 dV()end if bU then aa
.Options[bU]=bV end return bV end function bN:Header(bT,bU)local bV,bW={Settings
=bT},Instance.new'Frame'bW.Name='Header'bW.AutomaticSize=Enum.AutomaticSize.Y bW
.BackgroundColor3=Color3.fromRGB(0,0,0)bW.BackgroundTransparency=1 bW.
BorderColor3=Color3.fromRGB(0,0,0)bW.BorderSizePixel=0 bW.LayoutOrder=0 bW.Size=
UDim2.fromScale(1,0)bW.Parent=bO local bX=Instance.new'UIPadding'bX.Name=
'UIPadding'bX.PaddingBottom=UDim.new(0,5)bX.Parent=bW local bY=Instance.new
'TextLabel'bY.Name='HeaderText'bY.FontFace=Font.new(an.interFont,Enum.FontWeight
.Medium,Enum.FontStyle.Normal)bY.RichText=true bY.Text=bV.Settings.Text or bV.
Settings.Name bY.TextColor3=Color3.fromRGB(255,255,255)bY.TextSize=16 bY.
TextTransparency=0.3 bY.TextWrapped=true bY.TextXAlignment=Enum.TextXAlignment.
Left bY.AutomaticSize=Enum.AutomaticSize.Y bY.BackgroundColor3=Color3.fromRGB(
255,255,255)bY.BackgroundTransparency=1 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.
BorderSizePixel=0 bY.Size=UDim2.fromScale(1,0)bY.Parent=bW function bV:
UpdateName(bZ)bY.Text=bZ end function bV:SetVisibility(bZ)bW.Visible=bZ end if
bU then aa.Options[bU]=bV end return bV end function bN:Label(bT,bU)local bV,bW=
{Settings=bT},Instance.new'Frame'bW.Name='Label'bW.AutomaticSize=Enum.
AutomaticSize.Y bW.BackgroundColor3=Color3.fromRGB(0,0,0)bW.
BackgroundTransparency=1 bW.BorderColor3=Color3.fromRGB(0,0,0)bW.BorderSizePixel
=0 bW.Size=UDim2.new(1,0,0,38)bW.Parent=bO local bX=Instance.new'TextLabel'bX.
Name='LabelText'bX.FontFace=Font.new(an.interFont)bX.RichText=true bX.Text=bV.
Settings.Text or bV.Settings.Name bX.TextColor3=Color3.fromRGB(255,255,255)bX.
TextSize=13 bX.TextTransparency=0.5 bX.TextWrapped=true bX.TextXAlignment=Enum.
TextXAlignment.Left bX.AutomaticSize=Enum.AutomaticSize.Y bX.BackgroundColor3=
Color3.fromRGB(255,255,255)bX.BackgroundTransparency=1 bX.BorderColor3=Color3.
fromRGB(0,0,0)bX.BorderSizePixel=0 bX.Size=UDim2.fromScale(1,1)bX.Parent=bW
function bV:UpdateName(bY)bX.Text=bY end function bV:SetVisibility(bY)bW.Visible
=bY end if bU then aa.Options[bU]=bV end return bV end function bN:SubLabel(bT,
bU)local bV,bW={Settings=bT},Instance.new'Frame'bW.Name='SubLabel'bW.
AutomaticSize=Enum.AutomaticSize.Y bW.BackgroundColor3=Color3.fromRGB(0,0,0)bW.
BackgroundTransparency=1 bW.BorderColor3=Color3.fromRGB(0,0,0)bW.BorderSizePixel
=0 bW.Size=UDim2.new(1,0,0,0)bW.Parent=bO local bX=Instance.new'TextLabel'bX.
Name='SubLabelText'bX.FontFace=Font.new(an.interFont)bX.RichText=true bX.Text=bV
.Settings.Text or bV.Settings.Name bX.TextColor3=Color3.fromRGB(255,255,255)bX.
TextSize=12 bX.TextTransparency=0.7 bX.TextWrapped=true bX.TextXAlignment=Enum.
TextXAlignment.Left bX.AutomaticSize=Enum.AutomaticSize.Y bX.BackgroundColor3=
Color3.fromRGB(255,255,255)bX.BackgroundTransparency=1 bX.BorderColor3=Color3.
fromRGB(0,0,0)bX.BorderSizePixel=0 bX.Size=UDim2.fromScale(1,1)bX.Parent=bW
function bV:UpdateName(bY)bX.Text=bY end function bV:SetVisibility(bY)bW.Visible
=bY end if bU then aa.Options[bU]=bV end return bV end function bN:Paragraph(bT,
bU)local bV,bW={Settings=bT},Instance.new'Frame'bW.Name='Paragraph'bW.
AutomaticSize=Enum.AutomaticSize.Y bW.BackgroundColor3=Color3.fromRGB(0,0,0)bW.
BackgroundTransparency=1 bW.BorderColor3=Color3.fromRGB(0,0,0)bW.BorderSizePixel
=0 bW.Size=UDim2.new(1,0,0,38)bW.Parent=bO local bX=Instance.new'TextLabel'bX.
Name='ParagraphHeader'bX.FontFace=Font.new(an.interFont,Enum.FontWeight.Medium,
Enum.FontStyle.Normal)bX.RichText=true bX.Text=bV.Settings.Header bX.TextColor3=
Color3.fromRGB(255,255,255)bX.TextSize=15 bX.TextTransparency=0.4 bX.TextWrapped
=true bX.TextXAlignment=Enum.TextXAlignment.Left bX.AutomaticSize=Enum.
AutomaticSize.Y bX.BackgroundColor3=Color3.fromRGB(255,255,255)bX.
BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel
=0 bX.Size=UDim2.fromScale(1,0)bX.Parent=bW local bY=Instance.new'UIListLayout'
bY.Name='UIListLayout'bY.Padding=UDim.new(0,5)bY.SortOrder=Enum.SortOrder.
LayoutOrder bY.Parent=bW local bZ=Instance.new'TextLabel'bZ.Name='ParagraphBody'
bZ.FontFace=Font.new(an.interFont)bZ.RichText=true bZ.Text=bV.Settings.Body bZ.
TextColor3=Color3.fromRGB(255,255,255)bZ.TextSize=13 bZ.TextTransparency=0.5 bZ.
TextWrapped=true bZ.TextXAlignment=Enum.TextXAlignment.Left bZ.AutomaticSize=
Enum.AutomaticSize.Y bZ.BackgroundColor3=Color3.fromRGB(255,255,255)bZ.
BackgroundTransparency=1 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel
=0 bZ.LayoutOrder=1 bZ.Size=UDim2.fromScale(1,0)bZ.Parent=bW function bV:
UpdateHeader(b_)bX.Text=b_ end function bV:UpdateBody(b_)bZ.Text=b_ end function
bV:SetVisibility(b_)bW.Visible=b_ end if bU then aa.Options[bU]=bV end return bV
end function bN:Divider()local bT,bU={},Instance.new'Frame'bU.Name='Divider'bU.
AnchorPoint=Vector2.new(0,1)bU.AutomaticSize=Enum.AutomaticSize.Y bU.
BackgroundColor3=Color3.fromRGB(255,255,255)bU.BackgroundTransparency=1 bU.
BorderColor3=Color3.fromRGB(0,0,0)bU.BorderSizePixel=0 bU.Position=UDim2.
fromScale(0,1)bU.Size=UDim2.new(1,0,0,1)bU.Parent=bO local bV=Instance.new
'UIPadding'bV.Name='UIPadding'bV.PaddingBottom=UDim.new(0,8)bV.PaddingTop=UDim.
new(0,8)bV.Parent=bU local bW=Instance.new'UIListLayout'bW.Name='UIListLayout'bW
.SortOrder=Enum.SortOrder.LayoutOrder bW.Parent=bU local bX=Instance.new'Frame'
bX.Name='Line'bX.BackgroundColor3=Color3.fromRGB(255,255,255)bX.
BackgroundTransparency=0.9 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.
BorderSizePixel=0 bX.Size=UDim2.new(1,0,0,1)bX.Parent=bU function bT:Remove()bU:
Destroy()end function bT:SetVisibility(bY)bU.Visible=bY end return bT end
function bN:Spacer()local bT,bU={},Instance.new'Frame'bU.Name='Spacer'bU.
AnchorPoint=Vector2.new(0,1)bU.BackgroundColor3=Color3.fromRGB(255,255,255)bU.
BackgroundTransparency=1 bU.BorderColor3=Color3.fromRGB(0,0,0)bU.BorderSizePixel
=0 bU.Position=UDim2.fromScale(0,1)bU.Parent=bO function bT:Remove()bU:Destroy()
end function bT:SetVisibility(bV)bU.Visible=bV end return bT end return bN end
local bM=function()local bM=0.15 if d then d.Parent=nil end for bN,bO in pairs(
ak)do f(bN,TweenInfo.new(bM,Enum.EasingStyle.Sine),{BackgroundTransparency=(bN==
bw and 0.98 or 1)}):Play()if bO.tabStroke then f(bO.tabStroke,TweenInfo.new(bM,
Enum.EasingStyle.Sine),{Transparency=(bN==bw and 0.95 or 1)}):Play()end if bO.
switcherImage then f(bO.switcherImage,TweenInfo.new(bM,Enum.EasingStyle.Sine),{
ImageTransparency=(bN==bw and 0.1 or 0.5)}):Play()end if bO.switcherName then f(
bO.switcherName,TweenInfo.new(bM,Enum.EasingStyle.Sine),{TextTransparency=(bN==
bw and 0.1 or 0.5)}):Play()end end ak[bw].tabContent.Parent=aE d=ak[bw].
tabContent a1.Text=bu.Name end bw.MouseButton1Click:Connect(function()bM()end)
function bv:Select()bM()end function bv:InsertConfigSection(bN)local bO=bv:
Section{Side='Left'}if ai then bO:Label{Text=
'Config system unavailable. (Environment isStudio)'}return
'Config system unavailable.'end local bP,bQ bO:Input{Name='Config Name',
Placeholder='Name',AcceptedCharacters='All',Callback=function(bR)bP=bR end}local
bR=bO:Dropdown{Name='Select Config',Multi=false,Required=false,Options=aa:
RefreshConfigList(),Callback=function(bR)bQ=bR end}bO:Button{Name=
'Create Config',Callback=function()if not bP or string.gsub(bP,' ','')==''then h
:Notify{Title='Interface',Description='Config name cannot be empty.'}return end
local bS,bT=aa:SaveConfig(bP)if not bS then h:Notify{Title='Interface',
Description='Unable to save config, return error: '..bT}end h:Notify{Title=
'Interface',Description=string.format('Created config %q',bP)}bR:ClearOptions()
bR:InsertOptions(aa:RefreshConfigList())end}bO:Button{Name='Load Config',
Callback=function()local bS,bT=aa:LoadConfig(bR.Value)if not bS then h:Notify{
Title='Interface',Description='Unable to load config, return error: '..bT}return
end h:Notify{Title='Interface',Description=string.format('Loaded config %q',bR.
Value)}end}bO:Button{Name='Overwrite Config',Callback=function()local bS,bT=aa:
SaveConfig(bR.Value)if not bS then h:Notify{Title='Interface',Description=
'Unable to overwrite config, return error: '..bT}return end h:Notify{Title=
'Interface',Description=string.format('Overwrote config %q',bR.Value)}end}bO:
Button{Name='Refresh Config List',Callback=function()bR:ClearOptions()bR:
InsertOptions(aa:RefreshConfigList())end}local bS bO:Button{Name=
'Set as autoload',Callback=function()local bT=bR.Value writefile(aa.Folder..
'/settings/autoload.txt',bT)bS:UpdateName('Autoload config: '..bT)h:Notify{Title
='Interface',Description=string.format('Set %q as autoload',bT)}end}bS=bO:Label{
Text='Autoload config: None'}if isfile(aa.Folder..'/settings/autoload.txt')then
local bT=readfile(aa.Folder..'/settings/autoload.txt')bS:UpdateName(
'Autoload config: '..bT)end end ak[bw]={tabContent=bD,tabStroke=by,switcherImage
=bA,switcherName=bB}return bv end return bo end function h:Notify(bo)local bp,bq
={},Instance.new'Frame'bq.Name='Notification'bq.AnchorPoint=Vector2.new(0.5,0.5)
bq.AutomaticSize=Enum.AutomaticSize.Y bq.BackgroundColor3=Color3.fromRGB(15,15,
15)bq.BorderColor3=Color3.fromRGB(0,0,0)bq.BorderSizePixel=0 bq.Position=UDim2.
fromScale(0.5,0.5)bq.Size=UDim2.fromOffset(bo.SizeX or 250,0)bq.Parent=j local
br=Instance.new'UIStroke'br.Name='NotificationUIStroke'br.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border br.Color=Color3.fromRGB(255,255,255)br.Transparency=0.9
br.Parent=bq local bs=Instance.new'UICorner'bs.Name='NotificationUICorner'bs.
CornerRadius=UDim.new(0,10)bs.Parent=bq local bt=Instance.new'UIScale'bt.Name=
'NotificationUIScale'bt.Parent=bq bt.Scale=0 local bu=Instance.new'Frame'bu.Name
='NotificationInformation'bu.AutomaticSize=Enum.AutomaticSize.Y bu.
BackgroundColor3=Color3.fromRGB(255,255,255)bu.BackgroundTransparency=1 bu.
BorderColor3=Color3.fromRGB(0,0,0)bu.BorderSizePixel=0 bu.Size=UDim2.fromScale(1
,1)local bv=Instance.new'TextLabel'bv.Name='NotificationTitle'bv.FontFace=Font.
new(an.interFont,Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)bv.RichText=true
bv.Text=bo.Title bv.TextColor3=Color3.fromRGB(255,255,255)bv.TextSize=13 bv.
TextTransparency=0.2 bv.TextTruncate=Enum.TextTruncate.SplitWord bv.
TextXAlignment=Enum.TextXAlignment.Left bv.TextYAlignment=Enum.TextYAlignment.
Top bv.AutomaticSize=Enum.AutomaticSize.XY bv.BackgroundColor3=Color3.fromRGB(
255,255,255)bv.BackgroundTransparency=1 bv.BorderColor3=Color3.fromRGB(0,0,0)bv.
BorderSizePixel=0 bv.Size=UDim2.new(1,-12,0,0)local bw=Instance.new'UIPadding'bw
.Name='NotificationTitleUIPadding'bw.PaddingRight=UDim.new(0,25)bw.Parent=bv bv.
Parent=bu local bx=Instance.new'TextLabel'bx.Name='NotificationDescription'bx.
FontFace=Font.new(an.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)bx.
Text=bo.Description bx.TextColor3=Color3.fromRGB(255,255,255)bx.TextSize=11 bx.
TextTransparency=0.5 bx.TextWrapped=true bx.RichText=true bx.TextXAlignment=Enum
.TextXAlignment.Left bx.TextYAlignment=Enum.TextYAlignment.Top bx.AutomaticSize=
Enum.AutomaticSize.XY bx.BackgroundColor3=Color3.fromRGB(255,255,255)bx.
BackgroundTransparency=1 bx.BorderColor3=Color3.fromRGB(0,0,0)bx.BorderSizePixel
=0 bx.Size=UDim2.new(1,-12,0,0)local by=Instance.new'UIPadding'by.Name=
'NotificationDescriptionUIPadding'by.PaddingRight=UDim.new(0,25)by.PaddingTop=
UDim.new(0,17)by.Parent=bx bx.Parent=bu local bz=Instance.new'UIPadding'bz.Name=
'NotificationUIPadding'bz.PaddingBottom=UDim.new(0,12)bz.PaddingLeft=UDim.new(0,
10)bz.PaddingRight=UDim.new(0,10)bz.PaddingTop=UDim.new(0,10)bz.Parent=bu bu.
Parent=bq local bA=Instance.new'Frame'bA.Name='NotificationControls'bA.
AutomaticSize=Enum.AutomaticSize.Y bA.BackgroundColor3=Color3.fromRGB(255,255,
255)bA.BackgroundTransparency=1 bA.BorderColor3=Color3.fromRGB(0,0,0)bA.
BorderSizePixel=0 bA.Size=UDim2.fromScale(1,1)local bB=Instance.new'TextButton'
bB.Name='Interactable'bB.FontFace=Font.new(an.interFont)bB.Text='\u{2713}'bB.
TextColor3=Color3.fromRGB(255,255,255)bB.TextSize=17 bB.TextTransparency=0.2 bB.
AnchorPoint=Vector2.new(1,0.5)bB.AutomaticSize=Enum.AutomaticSize.XY bB.
BackgroundColor3=Color3.fromRGB(255,255,255)bB.BackgroundTransparency=1 bB.
BorderColor3=Color3.fromRGB(0,0,0)bB.BorderSizePixel=0 bB.LayoutOrder=1 bB.
Position=UDim2.fromScale(1,0.5)bB.Parent=bA local bC=Instance.new'UIPadding'bC.
Name='UIPadding'bC.PaddingBottom=UDim.new(0,6)bC.PaddingRight=UDim.new(0,13)bC.
PaddingTop=UDim.new(0,6)bC.Parent=bA bA.Parent=bq local bD,bE={In=f(bt,TweenInfo
.new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Scale=bo.Scale
or 1}),Out=f(bt,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=0})},{None=function()bB:Destroy()end,Confirm=
function()bB.Text='\u{2713}'end,Cancel=function()bB.Text='\u{2717}'end}local bF=
bE[bo.Style]or function()bB:Destroy()end bF()if bB then bB.MouseButton1Click:
Connect(function()bp:Cancel()if bo.Callback then task.spawn(bo.Callback)end end)
end local bG=task.spawn(function()bD.In:Play()bo.Lifetime=bo.Lifetime or 3 if bo
.Lifetime~=0 then task.wait(bo.Lifetime)local bG=bD.Out bG:Play()bG.Completed:
Wait()bq:Destroy()end end)function bp:UpdateTitle(bH)bv.Text=bH end function bp:
UpdateDescription(bH)bx.Text=bH end function bp:Resize(bH)local bI=bH or 250 bq.
Size=UDim2.fromOffset(bI,0)end function bp:Cancel()task.cancel(bG)local bH=bD.
Out bH:Play()bH.Completed:Wait()bq:Destroy()end return bp end function h:Dialog(
bo)local bp,bq={},Instance.new'CanvasGroup'bq.Name='DialogCanvas'bq.
BackgroundColor3=Color3.fromRGB(255,255,255)bq.BackgroundTransparency=1 bq.
BorderColor3=Color3.fromRGB(0,0,0)bq.BorderSizePixel=0 bq.Size=UDim2.fromScale(1
,1)bq.GroupTransparency=1 bq.Parent=m local br=Instance.new'Frame'br.Name=
'Dialog'br.BackgroundColor3=Color3.fromRGB(0,0,0)br.BackgroundTransparency=0.5
br.BorderColor3=Color3.fromRGB(0,0,0)br.BorderSizePixel=0 br.Size=UDim2.
fromScale(1,1)local bs=Instance.new'UICorner'bs.Name='BaseUICorner'bs.
CornerRadius=UDim.new(0,10)bs.Parent=br local bt=Instance.new'Frame'bt.Name=
'Prompt'bt.AnchorPoint=Vector2.new(0.5,0.5)bt.AutomaticSize=Enum.AutomaticSize.Y
bt.BackgroundColor3=Color3.fromRGB(15,15,15)bt.BorderColor3=Color3.fromRGB(0,0,0
)bt.BorderSizePixel=0 bt.Position=UDim2.fromScale(0.5,0.5)bt.Size=UDim2.
fromOffset(280,0)local bu=Instance.new'UIScale'bu.Name='BaseUIScale'bu.Parent=bt
bu.Scale=0.95 local bv=Instance.new'UIStroke'bv.Name='GlobalSettingsUIStroke'bv.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border bv.Color=Color3.fromRGB(255,255,255)
bv.Transparency=0.9 bv.Parent=bt local bw=Instance.new'UICorner'bw.Name=
'GlobalSettingsUICorner'bw.CornerRadius=UDim.new(0,10)bw.Parent=bt local bx=
Instance.new'UIPadding'bx.Name='GlobalSettingsUIPadding'bx.PaddingBottom=UDim.
new(0,20)bx.PaddingLeft=UDim.new(0,20)bx.PaddingRight=UDim.new(0,20)bx.
PaddingTop=UDim.new(0,20)bx.Parent=bt local by=Instance.new'Frame'by.Name=
'Paragraph'by.AutomaticSize=Enum.AutomaticSize.Y by.BackgroundColor3=Color3.
fromRGB(0,0,0)by.BackgroundTransparency=1 by.BorderColor3=Color3.fromRGB(0,0,0)
by.BorderSizePixel=0 by.Size=UDim2.new(1,0,0,38)local bz=Instance.new'TextLabel'
bz.Name='ParagraphHeader'bz.FontFace=Font.new(an.interFont,Enum.FontWeight.
Medium,Enum.FontStyle.Normal)bz.RichText=true bz.Text=bo.Title bz.TextColor3=
Color3.fromRGB(255,255,255)bz.TextSize=18 bz.TextTransparency=0.4 bz.TextWrapped
=true bz.AutomaticSize=Enum.AutomaticSize.Y bz.BackgroundColor3=Color3.fromRGB(
255,255,255)bz.BackgroundTransparency=1 bz.BorderColor3=Color3.fromRGB(0,0,0)bz.
BorderSizePixel=0 bz.Size=UDim2.fromScale(1,0)bz.Parent=by local bA=Instance.new
'UIListLayout'bA.Name='UIListLayout'bA.Padding=UDim.new(0,15)bA.SortOrder=Enum.
SortOrder.LayoutOrder bA.Parent=by local bB=Instance.new'TextLabel'bB.Name=
'ParagraphBody'bB.FontFace=Font.new(an.interFont)bB.RichText=true bB.Text=bo.
Description bB.TextColor3=Color3.fromRGB(255,255,255)bB.TextSize=14 bB.
TextTransparency=0.5 bB.TextWrapped=true bB.AutomaticSize=Enum.AutomaticSize.Y
bB.BackgroundColor3=Color3.fromRGB(255,255,255)bB.BackgroundTransparency=1 bB.
BorderColor3=Color3.fromRGB(0,0,0)bB.BorderSizePixel=0 bB.LayoutOrder=1 bB.Size=
UDim2.fromScale(1,0)bB.Parent=by by.Parent=bt local bC=Instance.new'Frame'bC.
Name='Interactions'bC.AutomaticSize=Enum.AutomaticSize.Y bC.BackgroundColor3=
Color3.fromRGB(0,0,0)bC.BackgroundTransparency=1 bC.BorderColor3=Color3.fromRGB(
0,0,0)bC.BorderSizePixel=0 bC.LayoutOrder=1 bC.Size=UDim2.fromScale(1,0)local bD
=Instance.new'UIListLayout'bD.Name='UIListLayout'bD.Padding=UDim.new(0,10)bD.
SortOrder=Enum.SortOrder.LayoutOrder bD.Parent=bC local bE=Instance.new
'UIPadding'bE.Name='UIPadding'bE.PaddingTop=UDim.new(0,20)bE.Parent=bC bC.Parent
=bt local bF=Instance.new'UIListLayout'bF.Name='UIListLayout'bF.SortOrder=Enum.
SortOrder.LayoutOrder bF.Parent=bt bt.Parent=br br.Parent=bq local bG,bH,bI,bJ=
f(bq,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{GroupTransparency=0}),f(bq,
TweenInfo.new(0.1,Enum.EasingStyle.Sine),{GroupTransparency=1}),f(bu,TweenInfo.
new(0.1,Enum.EasingStyle.Sine),{Scale=1}),f(bu,TweenInfo.new(0.1,Enum.
EasingStyle.Sine),{Scale=0.95})local bK,bL=function()bG:Play()bI:Play()bG.
Completed:Wait()br.Parent=m end,function()if not br.Parent then return end br.
Parent=bq bH:Play()bJ:Play()bH.Completed:Wait()bq:Destroy()end for bM,bN in
pairs(bo.Buttons)do local bO=Instance.new'TextButton'bO.Name='Button'bO.FontFace
=Font.new(an.interFont)bO.Text=bN.Name bO.TextColor3=Color3.fromRGB(255,255,255)
bO.TextSize=15 bO.TextTransparency=0.5 bO.TextTruncate=Enum.TextTruncate.AtEnd
bO.AutoButtonColor=false bO.AutomaticSize=Enum.AutomaticSize.Y bO.
BackgroundColor3=Color3.fromRGB(25,25,25)bO.BorderColor3=Color3.fromRGB(0,0,0)bO
.BorderSizePixel=0 bO.Size=UDim2.fromScale(1,0)local bP=Instance.new'UIPadding'
bP.Name='UIPadding'bP.PaddingBottom=UDim.new(0,9)bP.PaddingLeft=UDim.new(0,10)bP
.PaddingRight=UDim.new(0,10)bP.PaddingTop=UDim.new(0,9)bP.Parent=bO local bQ=
Instance.new'UICorner'bQ.Name='BaseUICorner'bQ.CornerRadius=UDim.new(0,10)bQ.
Parent=bO bO.Parent=bC local bR={DefaultTransparency=0,DefaultTransparency2=0.5,
HoverTransparency=0.3,HoverTransparency2=0.6,EasingStyle=Enum.EasingStyle.Sine}
local bS=function(bS)if bS=='Idle'then f(bO,TweenInfo.new(0.2,bR.EasingStyle),{
BackgroundTransparency=bR.DefaultTransparency,TextTransparency=bR.
DefaultTransparency2}):Play()elseif bS=='Hover'then f(bO,TweenInfo.new(0.2,bR.
EasingStyle),{BackgroundTransparency=bR.HoverTransparency,TextTransparency=bR.
HoverTransparency2}):Play()end end bO.MouseButton1Click:Connect(function()if bq.
GroupTransparency~=0 then return end local bT,bU=pcall(function()if bN.Callback
then bN.Callback()end end)bL()if not bT then warn(
'[Dialog] Button callback error: '..tostring(bU))end end)bO.MouseEnter:Connect(
function()bS'Hover'end)bO.MouseLeave:Connect(function()bS'Idle'end)end bK()
function bp:UpdateTitle(bM)bz.Text=bM end function bp:UpdateDescription(bM)bB.
Text=bM end function bp:Cancel()bL()end return bp end function h:
SetNotificationsState(bo)j.Visible=bo end function h:GetNotificationsState(bo)
return j.Visible end function h:SetState(bo)ao=bo m.Visible=bo end function h:
GetState()return ao end local bo function h:Unload()if bo then bo()end i:
Destroy()am=true end function h.onUnloaded(bp)bo=bp end local bp=g.Keybind or
Enum.KeyCode.RightControl local bq=function()local bq=not h:GetState()h:
SetState(bq)h:Notify{Title=g.Title,Description=(bq and'Maximized 'or'Minimized '
)..'the menu. Use '..tostring(bp.Name)..' to toggle it.',Lifetime=5}end af.
InputEnded:Connect(function(br,bs)if bs then return end if br.KeyCode==bp then
bq()end end)B.MouseButton1Click:Connect(bq)z.MouseButton1Click:Connect(function(
)h:Dialog{Title=g.Title,Description=
[[Are you sure you want to exit the menu? You will lose any unsaved configurations.]]
,Buttons={{Name='Confirm',Callback=function()h:Unload()end},{Name='Cancel'}}}end
)function h:SetKeybind(br)bp=br end function h:SetAcrylicBlurState(br)b=br m.
BackgroundTransparency=br and 0.05 or 0 end function h:GetAcrylicBlurState()
return b end local br,bs=function(br)if br then aq.Image=(ap and _)or
'rbxassetid://0'ax.Text='@'..aj.Name au.Text=aj.DisplayName else aq.Image=an.
userInfoBlurred local bs,bt=#aj.Name,#aj.DisplayName ax.Text='@'..string.rep('.'
,bs)au.Text=string.rep('.',bt)end end if g.ShowUserInfo~=nil then bs=g.
ShowUserInfo else bs=true end br(bs)function h:SetUserInfoState(bt)br(bt)end
function h:GetUserInfoState(bt)return bs end function h:SetSize(bt)m.Size=bt end
function h:GetSize(bt)return m.Size end function h:SetScale(bt)n.Scale=bt end
function h:GetScale()return n.Scale end local bt,bu={Toggle={Save=function(bt,bu
)return{type='Toggle',flag=bt,state=bu.State or false}end,Load=function(bt,bu)if
aa.Options[bt]and bu.state~=nil then aa.Options[bt]:UpdateState(bu.state)end end
},Slider={Save=function(bt,bu)return{type='Slider',flag=bt,value=(bu.Value and
tostring(bu.Value))or false}end,Load=function(bt,bu)if aa.Options[bt]and bu.
value then aa.Options[bt]:UpdateValue(bu.value)end end},Input={Save=function(bt,
bu)return{type='Input',flag=bt,text=bu.Text}end,Load=function(bt,bu)if aa.
Options[bt]and bu.text and type(bu.text)=='string'then aa.Options[bt]:
UpdateText(bu.text)end end},Keybind={Save=function(bt,bu)return{type='Keybind',
flag=bt,bind=(typeof(bu.Bind)=='EnumItem'and bu.Bind.Name)or nil}end,Load=
function(bt,bu)if aa.Options[bt]and bu.bind then aa.Options[bt]:Bind(Enum.
KeyCode[bu.bind])end end},Dropdown={Save=function(bt,bu)return{type='Dropdown',
flag=bt,value=bu.Value}end,Load=function(bt,bu)if aa.Options[bt]and bu.value
then aa.Options[bt]:UpdateSelection(bu.value)end end},Colorpicker={Save=function
(bt,bu)local bv=function(bv)return string.format('#%02X%02X%02X',math.floor(bv.R
*255),math.floor(bv.G*255),math.floor(bv.B*255))end return{type='Colorpicker',
flag=bt,color=bv(bu.Color)or nil,alpha=bu.Alpha}end,Load=function(bt,bu)local bv
=function(bv)local bw,bx,by=tonumber(bv:sub(2,3),16)/255,tonumber(bv:sub(4,5),16
)/255,tonumber(bv:sub(6,7),16)/255 return Color3.new(bw,bx,by)end if aa.Options[
bt]and bu.color then aa.Options[bt]:SetColor(bv(bu.color))if bu.alpha then aa.
Options[bt]:SetAlpha(bu.alpha)end end end}},function()if ai or not(isfolder and
makefolder)then return'Config system unavailable.'end local bt={aa.Folder,aa.
Folder..'/settings'}for bu=1,#bt do local bv=bt[bu]if not isfolder(bv)then
makefolder(bv)end end end function aa:LoadAutoLoadConfig()if ai or not(isfile
and readfile)then return'Config system unavailable.'end if isfile(aa.Folder..
'/settings/autoload.txt')then local bv=readfile(aa.Folder..
'/settings/autoload.txt')local bw,bx=aa:LoadConfig(bv)if not bw then h:Notify{
Title='Interface',Description='Error loading autoload config: '..bx}end h:Notify
{Title='Interface',Description=string.format('Autoloaded config: %q',bv)}end end
function aa:SetFolder(bv)if ai then return'Config system unavailable.'end aa.
Folder=bv bu()end function aa:SaveConfig(bv)if ai or not writefile then return
'Config system unavailable.'end if(not bv)then return false,
'Please select a config file.'end local bw,bx=aa.Folder..'/settings/'..bv..
'.json',{objects={},contextData=aa.contextData or{}}for by,bz in next,aa.Options
do if not bt[bz.Class]then continue end if bz.IgnoreConfig then continue end
table.insert(bx.objects,bt[bz.Class].Save(by,bz))end local by,bz=pcall(ad.
JSONEncode,ad,bx)if not by then return false,'Unable to encode into JSON data'
end writefile(bw,bz)return true end function aa:LoadConfig(bv)if ai or not(
isfile and readfile)then return'Config system unavailable.'end if(not bv)then
return false,'Please select a config file.'end local bw=aa.Folder..'/settings/'
..bv..'.json'if not isfile(bw)then return false,'Invalid file'end local bx,by=
pcall(ad.JSONDecode,ad,readfile(bw))if not bx then return false,
'Unable to decode JSON data.'end aa.LoadingConfig=true aa.contextData=by.
contextData or{}for bz,bA in next,by.objects do if bt[bA.type]then pcall(
function()bt[bA.type].Load(bA.flag,bA)end)end end task.delay(1,function()aa.
LoadingConfig=false end)return true end function aa:RefreshConfigList()if ai or
not(isfolder and listfiles)then return'Config system unavailable.'end local bv,
bw=(isfolder(aa.Folder)and isfolder(aa.Folder..'/settings'))and listfiles(aa.
Folder..'/settings')or{},{}for bx=1,#bv do local by=bv[bx]if by:sub(-5)=='.json'
then local bz=by:find('.json',1,true)local bA,bB=bz,by:sub(bz,bz)while bB~='/'
and bB~='\\'and bB~=''do bz=bz-1 bB=by:sub(bz,bz)end if bB=='/'or bB=='\\'then
local bC=by:sub(bz+1,bA-1)if bC~='options'then table.insert(bw,bC)end end end
end return bw end i.Enabled=false local bv={}for bw,bx in pairs(an)do table.
insert(bv,bx)end ae:PreloadAsync(bv)i.Enabled=true ao=true return h end function
aa:Demo()local ap=aa:Window{Title='Maclib Demo',Subtitle='This is a subtitle.',
Size=UDim2.fromOffset(868,650),DragStyle=1,DisabledWindowControls={},
ShowUserInfo=true,Keybind=Enum.KeyCode.RightControl,AcrylicBlur=true}local aq,ar
={UIBlurToggle=ap:GlobalSetting{Name='UI Blur',Default=ap:GetAcrylicBlurState(),
Callback=function(aq)ap:SetAcrylicBlurState(aq)ap:Notify{Title=ap.Settings.Title
,Description=(aq and'Enabled'or'Disabled')..' UI Blur',Lifetime=5}end},
NotificationToggler=ap:GlobalSetting{Name='Notifications',Default=ap:
GetNotificationsState(),Callback=function(aq)ap:SetNotificationsState(aq)ap:
Notify{Title=ap.Settings.Title,Description=(aq and'Enabled'or'Disabled')..
' Notifications',Lifetime=5}end},ShowUserInfo=ap:GlobalSetting{Name=
'Show User Info',Default=ap:GetUserInfoState(),Callback=function(aq)ap:
SetUserInfoState(aq)ap:Notify{Title=ap.Settings.Title,Description=(aq and
'Showing'or'Redacted')..' User Info',Lifetime=5}end}},{TabGroup1=ap:TabGroup()}
local as={Main=ar.TabGroup1:Tab{Name='Demo',Image='rbxassetid://18821914323'},
Settings=ar.TabGroup1:Tab{Name='Settings',Image='rbxassetid://10734950309'}}
local at={MainSection1=as.Main:Section{Side='Left'}}at.MainSection1:Header{Name=
'Header #1'}at.MainSection1:Button{Name='Button',Callback=function()ap:Dialog{
Title=ap.Settings.Title,Description=
[[Lorem ipsum odor amet, consectetuer adipiscing elit. Eros vestibulum aliquet mattis, ex platea nunc.]]
,Buttons={{Name='Confirm',Callback=function()print'Confirmed!'end},{Name=
'Cancel'}}}end}at.MainSection1:Input({Name='Input',Placeholder='Input',
AcceptedCharacters='All',Callback=function(au)ap:Notify{Title=ap.Settings.Title,
Description='Successfully set input to '..au}end,onChanged=function(au)print(
'Input is now '..au)end},'Input')at.MainSection1:Slider({Name='Slider',Default=
50,Minimum=0,Maximum=100,DisplayMethod='Percent',Precision=0,Callback=function(
au)print('Changed to '..au)end},'Slider')at.MainSection1:Toggle({Name='Toggle',
Default=false,Callback=function(au)ap:Notify{Title=ap.Settings.Title,Description
=(au and'Enabled 'or'Disabled ')..'Toggle'}end},'Toggle')at.MainSection1:
Keybind({Name='Keybind',Blacklist=false,Callback=function(au)ap:Notify{Title=
'Demo Window',Description='Pressed keybind - '..tostring(au.Name),Lifetime=3}end
,onBinded=function(au)ap:Notify{Title='Demo Window',Description=
'Successfully Binded Keybind to - '..tostring(au.Name),Lifetime=3}end},'Keybind'
)at.MainSection1:Colorpicker({Name='Colorpicker',Default=Color3.fromRGB(0,255,
255),Callback=function(au)print('Color: ',au)end},'Colorpicker')local au,av,aw,
ax=at.MainSection1:Colorpicker({Name='Transparency Colorpicker',Default=Color3.
fromRGB(255,0,0),Alpha=0,Callback=function(au,av)print('Color: ',au,' Alpha: ',
av)end},'TransparencyColorpicker'),0 at.MainSection1:Toggle({Name='Rainbow',
Default=false,Callback=function(ay)aw=ay if aw then ax=game:GetService
'RunService'.RenderStepped:Connect(function(az)av=(av+az*0.1)%1 au:SetColor(
Color3.fromHSV(av,1,1))end)elseif ax then ax:Disconnect()ax=nil end end},
'RainbowToggle')local ay={'Apple','Banana','Orange','Grapes','Pineapple','Mango'
,'Strawberry','Blueberry','Watermelon','Peach'}local az,aA=at.MainSection1:
Dropdown({Name='Dropdown',Multi=false,Required=true,Options=ay,Default=1,
Callback=function(az)print('Dropdown changed: '..az)end},'Dropdown'),at.
MainSection1:Dropdown({Name='Multi Dropdown',Search=true,Multi=true,Required=
false,Options=ay,Default={'Apple','Orange'},Callback=function(az)local aA={}for
aB,aC in next,az do table.insert(aA,aB)end print('Mutlidropdown changed:',table.
concat(aA,', '))end},'MultiDropdown')at.MainSection1:Button{Name=
'Update Selection',Callback=function()az:UpdateSelection'Grapes'aA:
UpdateSelection{'Banana','Pineapple'}end}at.MainSection1:Divider()at.
MainSection1:Header{Text='Header #2'}at.MainSection1:Paragraph{Header=
'Paragraph',Body=
[[Paragraph body. Lorem ipsum odor amet, consectetuer adipiscing elit. Morbi tempus netus aliquet per velit est gravida.]]
}at.MainSection1:Label{Text=
'Label. Lorem ipsum odor amet, consectetuer adipiscing elit.'}at.MainSection1:
SubLabel{Text=
[[Sub-Label. Lorem ipsum odor amet, consectetuer adipiscing elit.]]}aa:SetFolder
'Maclib'as.Settings:InsertConfigSection'Left'ap.onUnloaded(function()print
'Unloaded!'end)as.Main:Select()aa:LoadAutoLoadConfig()end return aa end function
a.g()local aa,ab,ac,ad,ae,af=a.load'f',a.load'e',{},false,false function ac.
Suspend()ae=true ad=false end function ac.Resume()ae=false end function ac.
IsSuspended()return ae or(aa.LoadingConfig==true)end function ac.SetActive(ag)af
=(typeof(ag)=='string'and#ag>0)and ag or nil end function ac.GetActive()return
af end local ag=function()if af then return af end local ag=aa.Folder local ah=
ag..'/settings/autoload.txt'if isfile and isfile(ah)then local ai,aj=pcall(
readfile,ah)if ai and typeof(aj)=='string'and#aj>0 then af=aj return af end end
af='Default'pcall(function()if writefile and makefolder and isfolder then if not
isfolder(ag)then makefolder(ag)end if not isfolder(ag..'/settings')then
makefolder(ag..'/settings')end if not isfile(ah)then writefile(ah,'Default')end
end end)return af end function ac.SaveNow()if ac.IsSuspended()then return end
local ah=ag()if not ah then return end local ai,aj=aa:SaveConfig(ah)if not ai
and aj and aj~='Please select a config file.'then ab.Notify('AutoSave',
'Kh\u{f4}ng l\u{1b0}u \u{111}\u{1b0}\u{1ee3}c config: '..tostring(aj),3)end end
function ac.Save()if ac.IsSuspended()then return end if not ag()then return end
if ad then return end ad=true task.delay(0.5,function()ad=false if not ac.
IsSuspended()and ac.GetActive()then ac.SaveNow()end end)end function ac.Wrap(ah)
if type(ah)~='function'then return ah end return function(...)ah(...)ac.Save()
end end return ac end function a.h()local aa,ab,ac=a.load'a',a.load'f',a.load'g'
local ad,ae,af,ag,ah,ai,aj=aa.HttpService or game:GetService'HttpService',{},
'DQMacro','pathRecord',3,'normal','full'local ak,al,am,an,ao=function(ak)if ak==
aj then return aj end return ai end,(isfile~=nil and writefile~=nil and
makefolder~=nil and isfolder~=nil),{},false,{}local ap,aq=function()for ap=#ao,1
,-1 do pcall(ao[ap])end end,function()local ap=ab.Folder or'EsclipseHub'return
ap..'/'..af end local ar,as=function()if not al then return end pcall(function()
local ar=ab.Folder or'EsclipseHub'if not isfolder(ar)then makefolder(ar)end
local as=aq()if not isfolder(as)then makefolder(as)end end)end,function(ar)if
type(ar)~='string'then return'Unknown'end return(string.gsub(ar,'[/\\:*?"<>|]',
'_'))end local at,au,av,aw,ax=function(at)return aq()..'/'..as(at)..'.json'end,
function(at)if not at then return nil end return{X=math.round(at.X*100)/100,Y=
math.round(at.Y*100)/100,Z=math.round(at.Z*100)/100}end,function(at)if not at or
type(at)~='table'then return nil end return Vector3.new(at.X or 0,at.Y or 0,at.Z
or 0)end,function(at)return type(at)=='table'and type(at.points)=='table'and#at.
points>0 end,function(at)if type(at)~='table'or type(at.X)~='number'then return
nil end local au=Vector3.new(at.X,0,at.Z)if au.Magnitude<0.001 then return nil
end return au.Unit end local ay,az,aA,aB,aC,aD=function(ay)if type(ay)~='table'
then return nil end local az={}for aA,aB in ipairs(ay.dwells or{})do local aC=
av(aB.pos)if aC then az[#az+1]={pos=aC,dur=tonumber(aB.dur)or 0,facing=ax(aB.
facing)}end end local aA={}for aB,aC in ipairs(ay.skills or{})do local aD=av(aC.
pos)if aD then aA[#aA+1]={pos=aD,facing=ax(aC.facing),key=aC.key,dw=math.floor(
tonumber(aC.dw)or 0),dwT=tonumber(aC.dwT)or 0}end end if#az==0 and#aA==0 then
return nil end return{dwells=az,skills=aA}end,function()if an then return end an
=true if al then ar()local ay=aq()if isfolder'DQMacro'and listfiles then pcall(
function()local az=listfiles'DQMacro'if type(az)=='table'then for aA,aB in
ipairs(az)do if type(aB)=='string'and string.lower(string.sub(aB,-5))=='.json'
and isfile(aB)then local aC=string.match(aB,'([^/\\]+)$')or'unknown.json'local
aD,aE=ay..'/'..aC,readfile(aB)writefile(aD,aE)delfile(aB)end end end end)end if
listfiles and isfolder(ay)then local az,aA=pcall(function()return listfiles(ay)
end)if az and type(aA)=='table'then for aB,aC in ipairs(aA)do if type(aC)==
'string'and string.lower(string.sub(aC,-5))=='.json'then pcall(function()if
isfile(aC)then local aD=readfile(aC)local aE=ad:JSONDecode(aD)if type(aE)==
'table'and type(aE.map)=='string'and type(aE.rooms)=='table'then am[aE.map]=aE
end end end)end end end end local az=ab.contextData if type(az)=='table'and
type(az[ag])=='table'then local aA,aB=az[ag],false for aC,aD in pairs(aA)do if
type(aC)=='string'and type(aD)=='table'then if not am[aC]then am[aC]=aD end
pcall(function()writefile(at(aC),ad:JSONEncode(aD))end)aB=true end end if aB
then az[ag]=nil ac.Save()end end else local ay=ab.contextData if type(ay)==
'table'and type(ay[ag])=='table'then for az,aA in pairs(ay[ag])do if type(az)==
'string'and type(aA)=='table'then am[az]=aA end end end end end,0.1,0.82,0.3,
function(ay,az)local aA,aB=ay.X-az.X,ay.Z-az.Z return math.sqrt(aA*aA+aB*aB)end
function ae.SimplifyPath(aE,aF)local aG=#aE if aG<=2 then return aE end local aH
={}for aI=1,aG do aH[aI]=false end aH[1]=true aH[aG]=true local aI={1}for aJ=2,
aG-1 do local aK,aL,aM=aE[aJ-1],aE[aJ],aE[aJ+1]local aN,aO=aL.X-aK.X,aL.Z-aK.Z
local aP,aQ,aR=math.sqrt(aN*aN+aO*aO),aM.X-aL.X,aM.Z-aL.Z local aS=math.sqrt(aQ*
aQ+aR*aR)if aP>=aC and aS>=aC then local aT=(aN*aQ+aO*aR)/(aP*aS)if aT<aB then
aH[aJ]=true table.insert(aI,aJ)end end end table.insert(aI,aG)local aJ,aK=aF*aF,
{}for aL=1,#aI-1 do local aM,aN=aI[aL],aI[aL+1]if aN-aM>1 then table.insert(aK,{
aM,aN})end end while#aK>0 do local aL=table.remove(aK)local aM,aN=aL[1],aL[2]
local aO,aP,aQ,aR=aE[aM].X,aE[aM].Z,aE[aN].X,aE[aN].Z local aS,aT=aQ-aO,aR-aP
local aU,aV,aW=aS*aS+aT*aT,-1,0 for aX=aM+1,aN-1 do local aY=0 if aU>0 then aY=(
(aE[aX].X-aO)*aS+(aE[aX].Z-aP)*aT)/aU aY=math.clamp(aY,0,1)end local aZ,a_=aE[aX
].X-(aO+aS*aY),aE[aX].Z-(aP+aT*aY)local a0=aZ*aZ+a_*a_ if a0>aV then aV=a0 aW=aX
end end if aW>0 and aV>aJ then aH[aW]=true table.insert(aK,{aM,aW})table.insert(
aK,{aW,aN})end end local aL={}for aM=1,aG do if aH[aM]and(#aL==0 or aD(aL[#aL],
aE[aM])>=aA or aM==aG)then table.insert(aL,aE[aM])end end if#aL==1 then table.
insert(aL,aE[aG])end return aL end function ae.OnChanged(aE)if type(aE)~=
'function'then return function()end end table.insert(ao,aE)return function()for
aF,aG in ipairs(ao)do if aG==aE then table.remove(ao,aF)break end end end end
function ae.HasMap(aE)if type(aE)~='string'or#aE==0 then return false end az()
local aF=am[aE]if not aF or type(aF.rooms)~='table'then return false end for aG,
aH in pairs(aF.rooms)do if aw(aH)and#aH.points>0 then return true end end return
false end local aE=function(aE)if not aE or type(aE)~='table'or type(aE.points)
~='table'then return nil end local aF={}for aG,aH in ipairs(aE.points)do local
aI=av(aH)if aI then aF[#aF+1]=aI end end if#aF==0 then return nil end return{
startPos=av(aE.startPos)or aF[1],points=aF,events=aE.events and ay(aE.events)or
nil,speed=tonumber(aE.speed)or 0}end function ae.GetRoomSegment(aF,aG)if type(aF
)~='string'or type(aG)~='number'then return nil end az()local aH=am[aF]if not aH
or type(aH.rooms)~='table'then return nil end local aI=aH.rooms[tostring(aG)]if
not aw(aI)then return nil end local aJ={}for aK,aL in ipairs(aI.points)do local
aM=av(aL)if aM then aJ[#aJ+1]=aM end end if#aJ==0 then return nil end local aK,
aL={startPos=av(aI.startPos)or aJ[1],points=aJ,events=aI.events and ay(aI.events
)or nil,speed=tonumber(aI.speed)or 0,boss=aI.boss==true},{}if type(aI.phases)==
'table'and#aI.phases>0 then for aM,aN in ipairs(aI.phases)do local aO=aE(aN)if
aO then aO.boss=aI.boss==true aL[#aL+1]=aO end end end if#aL==0 then aL[1]=aK
end aK.phases=aL return aK end function ae.HasSegmentOrMacro(aF,aG)return ae.
GetRoomSegment(aF,aG)~=nil end function ae.GetMap(aF)if not ae.HasMap(aF)then
return nil end az()local aG=am[aF]if not aG then return nil end local aH={}for
aI,aJ in pairs(aG.rooms or{})do local aK=tonumber(aI)if aK and aw(aJ)then local
aL=ae.GetRoomSegment(aF,aK)if aL then aH[aK]=aL end end end return{map=aF,
version=aG.version,rooms=aH,created=aG.created,updated=aG.updated,mode=ak(aG.
mode)}end function ae.GetMaps()az()local aF={}for aG,aH in pairs(am)do if type(
aG)=='string'and type(aH)=='table'and aH.map==aG and type(aH.rooms)=='table'then
local aI,aJ,aK,aL=0,0,0,0 for aM,aN in pairs(aH.rooms)do if tonumber(aM)~=nil
and aw(aN)then aI+=1 if aN.boss==true then aJ+=1 end aK+=#aN.points if type(aN.
phases)=='table'and#aN.phases>0 then aL+=#aN.phases for aO,aP in ipairs(aN.
phases)do if aP~=aN and type(aP.points)=='table'then aK+=#aP.points end end else
aL+=1 end end end if aI>0 then table.insert(aF,{map=aG,roomCount=aI,bossCount=aJ
,pointCount=aK,phaseCount=aL,updated=aH.updated,mode=ak(aH.mode)})end end end
table.sort(aF,function(aG,aH)return aG.map<aH.map end)return aF end function ae.
Count()return#ae.GetMaps()end function ae.SaveSegment(aF,aG,aH,aI,aJ,aK,aL,aM)if
type(aF)~='string'or#aF==0 then return false end if type(aG)~='number'or aG<=0
then return false end if not aH or not aI or#aI==0 then return false end az()
local aN=am[aF]if not aN or type(aN)~='table'then aN={map=aF,version=ah,created=
os.time(),updated=os.time(),mode=ai,rooms={}}am[aF]=aN end if type(aN.rooms)~=
'table'then aN.rooms={}end local aO={}for aP,aQ in ipairs(aI)do aO[#aO+1]=au(aQ)
end local aP={startPos=au(aH)or aO[1],points=aO}if aL then aP.boss=true end if
type(aK)=='number'and aK>0 then aP.speed=aK end local aQ=function(aQ)if not aQ
or type(aQ)~='table'then return nil end local aR,aS=#(aQ.dwells or{}),#(aQ.
skills or{})if aR==0 and aS==0 then return nil end local aT={dwells={},skills={}
}for aU,aV in ipairs(aQ.dwells or{})do aT.dwells[#aT.dwells+1]={pos=au(aV.pos),
dur=aV.dur or 0,facing=aV.facing}end for aU,aV in ipairs(aQ.skills or{})do aT.
skills[#aT.skills+1]={pos=au(aV.pos),facing=aV.facing,key=aV.key,dw=aV.dw or 0,
dwT=aV.dwT or 0}end return aT end if aJ and type(aJ)=='table'then local aR=aQ(aJ
)if aR then aP.events=aR end end if type(aM)=='table'and#aM>0 then local aR={}
for aS,aT in ipairs(aM)do if aT and aT.points and#aT.points>0 then local aU={}
for aV,aW in ipairs(aT.points)do aU[#aU+1]=au(aW)end local aV={startPos=au(aT.
startPos)or aU[1],points=aU,speed=type(aT.speed)=='number'and aT.speed>0 and aT.
speed or nil,events=aQ(aT.events)}aR[#aR+1]=aV end end if#aR>0 then aP.phases=aR
end end aN.rooms[tostring(aG)]=aP aN.version=ah aN.map=aF aN.updated=os.time()if
al then ar()pcall(function()writefile(at(aF),ad:JSONEncode(aN))end)else local aR
=ab.contextData if type(aR)=='table'then if not aR[ag]then aR[ag]={}end aR[ag][
aF]=aN ac.Save()end end ap()return true end function ae.GetMapMode(aF)if type(aF
)~='string'or#aF==0 then return ai end az()local aG=am[aF]if type(aG)~='table'
then return ai end return ak(aG.mode)end function ae.SetMapMode(aF,aG)if type(aF
)~='string'or#aF==0 then return false end local aH=ak(aG)az()local aI=am[aF]if
not aI or type(aI)~='table'then aI={map=aF,version=ah,created=os.time(),updated=
os.time(),mode=ai,rooms={}}am[aF]=aI end aI.mode=aH aI.map=aF aI.updated=os.
time()if al then ar()pcall(function()writefile(at(aF),ad:JSONEncode(aI))end)else
local aJ=ab.contextData if type(aJ)=='table'then if not aJ[ag]then aJ[ag]={}end
aJ[ag][aF]=aI ac.Save()end end ap()return true end function ae.RemoveMap(aF)az()
if not am[aF]then return false end am[aF]=nil if al then local aG=at(aF)pcall(
function()if isfile(aG)then delfile(aG)end end)else local aG=ab.contextData if
type(aG)=='table'and aG[ag]then aG[ag][aF]=nil ac.Save()end end ap()return true
end function ae.ClearAll()az()if next(am)==nil then return end local aF=aq()if
al and isfolder(aF)and listfiles then pcall(function()local aG=listfiles(aF)if
type(aG)=='table'then for aH,aI in ipairs(aG)do if type(aI)=='string'and string.
lower(string.sub(aI,-5))=='.json'and isfile(aI)then delfile(aI)end end end end)
end table.clear(am)local aG=ab.contextData if type(aG)=='table'and aG[ag]then aG
[ag]=nil ac.Save()end ap()end function ae.ReloadFromDisk()table.clear(am)an=
false az()ap()end function ae.ReloadFromConfig()ae.ReloadFromDisk()end return ae
end function a.i()local aa,ab,ac,ad=a.load'a',a.load'c',a.load'h',a.load'e'local
ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq=aa.RunService,aa.player,aa.
UserInputService,0.1,8000,0.4,0.1,0.15,1,6,{},true,true function ao.SetCapture(
ar)ar=ar and true or false ap=ar aq=ar end function ao.IsCaptureEnabled()return
ap or aq end local ar,as,at,au,av,aw,ax,ay,az,aA,aB,aC,aD,aE,aF,aG,aH,aI,aJ,aK,
aL,aM,aN,aO,aP,aQ,aR,aS,aT,aU,aV,aW=false,0,{},0,{},{},0,false,0,0,false,false,
false,{},0,0,0,{}local aX,aY=function()local aX={recording=ar,map=aJ,room=as,
pointCount=#at,phaseCount=#aE+1,dwellCount=#av,skillCount=#aw,savedRooms=aF}for
aY,aZ in ipairs(aI)do pcall(aZ,aX)end end,function()local aX=af and af.Character
local aY=aX and aX:FindFirstChild'HumanoidRootPart'if aY and aY.Parent then
return aY end return nil end local aZ,a_,a0,a1=function()local aZ=aY()if not aZ
then return nil end local a_=aZ.CFrame.LookVector if a_.Magnitude<0.001 then
return nil end return{X=a_.X/a_.Magnitude,Z=a_.Z/a_.Magnitude}end,function()if
aL then aL:Disconnect()aL=nil end if aM then aM:Disconnect()aM=nil end if aN
then aN()aN=nil end if aO then aO()aO=nil end if aP then aP()aP=nil end if aQ
then aQ()aQ=nil end end,function(aZ)at={aZ}av={}aw={}aR=nil ax=0 aS=nil aT=nil
aU=nil aV=aZ az=0 aA=0 au=os.clock()aW=os.clock()ay=false end,function()aJ=nil
as=0 aK=nil at={}av={}aw={}aR=nil ax=0 aS=nil aT=nil aU=nil aV=nil ay=false az=0
aA=0 aW=nil aC=false aD=false aB=false aF=0 aG=0 aH=0 end local a2,a3,a4=
function(a2,a3)as=a2 aK=a3 aD=true a0(a3)aC=ab.IsBossActive()aE={}end,function(
a2)if not aD then return false end local a3=ac.SimplifyPath(at,aj)if#a3>=2 then
local a4 if#av>0 or#aw>0 then a4={dwells=av,skills=aw}end local a5=0 if aA>0.5
and az>5 then a5=math.clamp(az/aA,5,100)end table.insert(aE,{startPos=aK,points=
a3,events=a4,speed=a5})aH+=#at end aK=a2 a0(a2)aX()return true end,function(a2,
a3)if not aD then return nil end local a4=ac.SimplifyPath(at,aj)if#a4>=2 then
local a5 if#av>0 or#aw>0 then a5={dwells=av,skills=aw}end local a6=0 if aA>0.5
and az>5 then a6=math.clamp(az/aA,5,100)end table.insert(aE,{startPos=aK,points=
a4,events=a5,speed=a6})aH+=#at end if#aE==0 then return nil end local a5=aE[1]
local a6=ac.SaveSegment(aJ,as,a5.startPos,a5.points,a5.events,a5.speed,aC,aE)if
not a6 then return nil end aF+=1 if aC then aG+=1 end if not a3 then local a7=''
if#aE>1 then a7=(
' (%d phases/m\u{1ea1}ng h\u{1ed3}i sinh, %d \u{111}i\u{1ec3}m phase 1)'):
format(#aE,#a5.points)elseif a5.events then a7=(
' (%d \u{111}i\u{1ec3}m m\u{1ecb}n, %d skill, %d nh\u{1ecb}p d\u{1eeb}ng, %.1fspd)'
):format(#a5.points,#(a5.events.skills or{}),#(a5.events.dwells or{}),a5.speed
or 0)else a7=(' (%d \u{111}i\u{1ec3}m m\u{1ecb}n, %.1fspd)'):format(#a5.points,
a5.speed or 0)end ad.Notify('Path Record',(
'\u{110}\u{e3} l\u{1b0}u room %d%s v\u{e0}o map [%s] %s'):format(as,a7,aJ,a2 and
('- '..a2)or''),3)end return{phaseCount=#aE,phase1=a5}end function ao.
IsRecording()return ar end function ao.GetStartRoom()return as end function ao.
GetCurrentPhaseIndex()return#aE+1 end function ao.GetCurrentPoints()return at
end function ao.GetRoomPhases()return aE end function ao.GetCurrentDwells()
return av end function ao.GetCurrentSkills()return aw end function ao.GetStatus(
)return{recording=ar,map=aJ,room=as,pointCount=#at,dwellCount=#av,skillCount=#aw
,phaseCount=#aE+1,savedRooms=aF}end function ao.OnStatusChanged(a5)if type(a5)~=
'function'then return function()end end table.insert(aI,a5)return function()for
a6,a7 in ipairs(aI)do if a7==a5 then table.remove(aI,a6)break end end end end
function ao.Start()if ar then return false,'\u{111}ang record r\u{1ed3}i'end
local a5=aY()if not a5 then return false,
'ch\u{1b0}a c\u{f3} nh\u{e2}n v\u{1ead}t'end if ab.IsDead()then return false,
'nh\u{e2}n v\u{1ead}t \u{111}ang ch\u{1ebf}t'end local a6=ab.
GetCurrentRoomIndex()if a6<=0 then return false,
'kh\u{f4}ng n\u{1eb1}m trong dungeon'end local a7=ab.GetCurrentDungeonName()if
not a7 or#a7==0 then return false,
'kh\u{f4}ng x\u{e1}c \u{111}\u{1ecb}nh \u{111}\u{1b0}\u{1ee3}c map'end aB=ac.
GetMapMode(a7)=='full'if ab.IsBossActive()and not aB then return false,
'boss room (d\u{f9}ng Hazard Scanner)'end aJ=a7 a2(a6,a5.Position)ar=true aF=0
aG=0 aH=0 aL=ae.Heartbeat:Connect(function()if not ar then return end if ab.
IsDead()then aS=nil aR=nil aV=nil return end local a8=aY()if not a8 then return
end local a9,b=a8.Position,at[#at]if b and(a9-b).Magnitude>35 then a4(
'd\u{1ecb}ch chuy\u{1ec3}n l\u{1edb}n',true)local ba=ab.GetCurrentRoomIndex()if
ba==as then ba=0 end a2(ba,a9)aX()task.spawn(function()task.wait(an)if ar and as
<=0 then ao.Stop'h\u{1ebf}t map'end end)return end local ba,bb=os.clock(),aV and
(a9-aV).Magnitude or 0 aV=a9 local bc=aW and math.max(0,ba-aW)or 0 aW=ba if bb>=
al then az+=bb aA+=bc end if ap then if bb<al then if not aS then aS=ba aT=a9 aU
=aZ()end if aR then aR.dur=ba-aS aR.facing=aZ()or aU elseif ba-aS>=ak then ax=aS
-au aR={pos=aT,dur=ba-aS,facing=aU,index=#av+1}table.insert(av,aR)end else aS=
nil aR=nil end end local bd=at[#at]if bd and(a9-bd).Magnitude<ah then return end
if#at>=ai then ao.Stop
'\u{111}\u{1ea1}t gi\u{1edb}i h\u{1ea1}n \u{111}i\u{1ec3}m'return end table.
insert(at,a9)end)if aq then aM=ag.InputBegan:Connect(function(a8,a9)if not ar or
not aq then return end if ag:GetFocusedTextBox()then return end if ab.IsDead()
then return end local b if a8.UserInputType==Enum.UserInputType.MouseButton2
then if a9 then return end b='QE'elseif a8.UserInputType==Enum.UserInputType.
Keyboard and(a8.KeyCode==Enum.KeyCode.Q or a8.KeyCode==Enum.KeyCode.E)then b=a8.
KeyCode==Enum.KeyCode.Q and'Q'or'E'else return end local ba=aY()if not ba then
return end local bb=ba.AssemblyLinearVelocity or ba.Velocity local bc=bb and
Vector3.new(bb.X,0,bb.Z).Magnitude or 0 local bd=(aS~=nil)or(bc<1)if ap and bd
then if not aS then local be=os.clock()aS=be aT=ba.Position aU=aZ()end if not aR
then ax=aS-au aR={pos=aT or ba.Position,dur=math.max(0.1,os.clock()-aS),facing=
aU or aZ(),index=#av+1}table.insert(av,aR)end end local be={pos=(aR and bd and
aR.pos)or ba.Position,facing=aZ(),key=b,dw=0,dwT=0}if aR and bd then be.dw=aR.
index be.dwT=math.max(0,(os.clock()-au)-ax)aR.facing=be.facing or aR.facing end
table.insert(aw,be)end)end aN=ab.OnRoomIndexChanged(function()if ar then local
a8=ab.GetCurrentRoomIndex()if aD and as<=0 and a8>0 then as=a8 return end if a8
~=as and not ay then ay=true task.delay(am,function()ay=false if ar then ao.
Rollover()end end)end end end)aP=ab.OnBossActiveChanged(function(a8)if not ar
then return end if a8 then if aB then aC=true else ao.Stop'v\u{e0}o boss room'
end return end if aB and aC then a4('xong boss',true)aC=false aD=false task.
spawn(function()task.wait(an)if ar and not aD then ao.Stop'h\u{1ebf}t map'end
end)end end)aO=ab.OnLobbyChanged(function(a8)if ar and a8 then ao.Stop
'v\u{1ec1} lobby'end end)aQ=ab.OnRespawn(function()if not ar then return end
task.delay(0.2,function()if not ar or ab.IsDead()then return end local a8=aY()if
not a8 then return end if a3(a8.Position)then local a9=#aE+1 ad.Notify(
'Path Record',(
'H\u{1ed3}i sinh: \u{110}\u{e3} l\u{1b0}u Phase %d, \u{111}ang ghi ti\u{1ebf}p Phase %d cho room %d'
):format(a9-1,a9,as),3)end end)end)ad.Notify('Path Record',(
'B\u{1eaf}t \u{111}\u{1ea7}u record room %d (%s)'):format(a6,a7),2)aX()return
true end function ao.Rollover()if not ar then return false end a4(
'chuy\u{1ec3}n room',true)local a5=aY()local a6=a5 and a5.Position or aK a2(ab.
GetCurrentRoomIndex(),a6)aX()return true end function ao.Stop(a5)if not ar then
return false end ar=false a_()local a6=a4(a5,true)if a6 then if aF>1 then local
a7=aG>0 and(' | %d boss'):format(aG)or''ad.Notify('Path Record',(
'\u{110}\u{e3} l\u{1b0}u map [%s] %s: %d room%s (%d \u{111}i\u{1ec3}m g\u{1ed1}c)'
):format(aJ,a5 or'xong',aF,a7,aH),4)else local a7,a8='',a6.phase1 if a8 and a8.
events then a7=(' (%d skill, %d nh\u{1ecb}p d\u{1eeb}ng, %.1fspd)'):format(#(a8.
events.skills or{}),#(a8.events.dwells or{}),a8.speed or 0)elseif a8 then a7=(
' (%.1fspd)'):format(a8.speed or 0)end local a9=as>0 and(aC and' (boss)'or'')or
''ad.Notify('Path Record',(
'\u{110}\u{e3} l\u{1b0}u room %d%s%s v\u{e0}o map [%s] %s'):format(as,a7,a9,aJ,
a5 and('- '..a5)or''),3)end elseif aF>0 then local a7=aG>0 and(' | %d boss'):
format(aG)or''ad.Notify('Path Record',(
'\u{110}\u{e3} l\u{1b0}u map [%s] %s: %d room%s (%d \u{111}i\u{1ec3}m g\u{1ed1}c)'
):format(aJ,a5 or'xong',aF,a7,aH),4)end a1()aX()return a6~=nil end function ao.
Cancel()if not ar then return end a_()a1()ar=false aX()end return ao end
function a.j()local aa,ab,ac,ad=a.load'a',a.load'c',a.load'h',a.load'e'local ae,
af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax,ay,az,aA,aB,aC=aa.
player,aa.VirtualInputManager,aa.UserInputService,0.4,0.5,2,4.5,6,14,8,14,8,2,
0.5,2,0.001,0.1,{},true,true,true,0.6,0.005,0.45,0.2 function av.
SetStartPauseTime(aD)if type(aD)=='number'then aC=math.clamp(aD,0,5)end end
function av.GetStartPauseTime()return aC end function av.SetPreAimTime(aD)if
type(aD)=='number'then aB=math.clamp(aD,0.1,1.5)end end function av.
GetPreAimTime()return aB end function av.SetSkillFaceHold(aD)if type(aD)==
'number'then az=math.clamp(aD,ar,as)end end function av.GetSkillFaceHold()return
az end function av.SetDoubleClickDelay(aD)if type(aD)=='number'then aA=math.
clamp(aD,at,au)end end function av.GetDoubleClickDelay()return aA end function
av.SetReplayTimeline(aD)aD=aD and true or false aw=aD ax=aD ay=aD end function
av.IsReplayTimelineEnabled()return aw end local aD,aE,aF,aG=true,false function
av.SetSpeedMatch(aH)aD=aH and true or false end function av.IsSpeedMatchEnabled(
)return aD end function av.SetUseFastSpeed(aH)aE=aH and true or false end
function av.IsUseFastSpeedEnabled()return aE end local aH,aI,aJ,aK,aL,aM,aN,aO,
aP,aQ,aR,aS=function(aH)local aI if aE then local aJ=ab.GetFastSpeed()if type(aJ
)=='number'and aJ>0 then aI=aJ end elseif aD then if type(aH)=='number'and aH>0
then aI=aH end end if not aI or aI<=0 then return end local aJ=ab.GetHumanoid()
if not aJ then return end if aF==nil then aG=aJ.WalkSpeed end aF=aI if aJ.
WalkSpeed~=aI then aJ.WalkSpeed=aI end end,function()if aF==nil then return end
local aH=ab.GetHumanoid()if aG and aH and aH.WalkSpeed~=aG then aH.WalkSpeed=aG
end aF=nil aG=nil end,false,false,false,1,0,0,0,{}local aT=function(aT)local aU=
{playing=aJ,map=aR,room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(),phase=aM
,resume=aK,progressPercent=aP,progressStuds=aN,totalStuds=aO,reason=aT}for aV,aW
in ipairs(aQ)do pcall(aW,aU)end end function av.GetCurrentPhaseIndex()return aM
end local aU,aV,aW=function()local aU=ae and ae.Character local aV=aU and aU:
FindFirstChild'HumanoidRootPart'if aV and aV.Parent then return aV end return
nil end,function(aU)if not aU or not aU.Parent then return nil end local aV,aW=
pcall(function()return aU.Position end)if not aV or not aW then return nil end
return aW end,function(aU,aV)local aW,aX=aU.X-aV.X,aU.Z-aV.Z return math.sqrt(aW
*aW+aX*aX)end local aX,aY,aZ,a_,a0=function(aX)local aY=aU()if aY and aX then
local aZ=aV(aY)if aZ then pcall(function()aX:MoveTo(aZ)end)end end end,function(
aX)local aY,aZ=ab.GetKeyHoldTime()or 0.05,aA task.spawn(function()pcall(function
()local a_=function(a_,a0)af:SendKeyEvent(a0,a_,false,game)end local a0=function
(a0)if a0=='Q'then a_(Enum.KeyCode.Q,true)task.wait(aY)a_(Enum.KeyCode.Q,false)
elseif a0=='E'then a_(Enum.KeyCode.E,true)task.wait(aY)a_(Enum.KeyCode.E,false)
else a_(Enum.KeyCode.Q,true)a_(Enum.KeyCode.E,true)task.wait(aY)a_(Enum.KeyCode.
Q,false)a_(Enum.KeyCode.E,false)end end a0(aX)if aZ>0 then task.wait(aZ)end a0(
aX)end)end)end,function(aX,aY)if not aX or not aX.Parent then return end local
aZ=ab.GetHumanoid()if aZ then aZ.AutoRotate=false end local a_=aY or Vector3.
new(1,0,0)if a_.Magnitude<0.1 then a_=Vector3.new(1,0,0)end a_=Vector3.new(a_.X,
0,a_.Z).Unit pcall(function()local a0=aX.Position aX.CFrame=CFrame.lookAt(a0,a0+
a_)end)end,function(aX,aY,aZ)if not aX or not aX.Parent then return end local a_
=ab.GetHumanoid()if a_ and a_.AutoRotate~=false then a_.AutoRotate=false end
local a0=aY or Vector3.new(1,0,0)if a0.Magnitude<0.1 then a0=Vector3.new(1,0,0)
end a0=Vector3.new(a0.X,0,a0.Z).Unit pcall(function()local a1=aX.Position local
a2=CFrame.lookAt(a1,a1+a0)aX.CFrame=aX.CFrame:Lerp(a2,math.clamp(aZ or 0.35,0.05
,1))end)end,function()local aX=ab.GetHumanoid()if aX then aX.AutoRotate=true end
end local a1=function(a1,a2,a3)local a4,a5=ab.GetHumanoid(),aU()if not a4 or not
a5 then return end aH(a1.speed)local a6=ac.SimplifyPath(a1.points,ah)local a7=#
a6 if a7<2 then return end local a8,a9=0,{}a9[1]=0 for b=2,a7 do local ba=aW(a6[
b-1],a6[b])a8+=ba a9[b]=a8 end aN=0 aO=a8 aP=0 aT'progress_init'local b,ba=
function(b,ba,bb)ba=ba or 0 bb=bb or a8 local bc,bd=0,math.huge for be=2,a7 do
if a9[be]<ba then continue end if a9[be-1]>bb then continue end local bf,bg=a6[
be-1],a6[be]local bh,bi=bf.X,bf.Z local bj,bk=bg.X-bh,bg.Z-bi local bl,bm=bj*bj+
bk*bk,0 if bl>0 then bm=((b.X-bh)*bj+(b.Z-bi)*bk)/bl bm=math.clamp(bm,0,1)end
local bn,bo=b.X-(bh+bj*bm),b.Z-(bi+bk*bm)local bp=bn*bn+bo*bo if bp<bd then bd=
bp bc=a9[be-1]+math.sqrt(bl)*bm end end return bc end,function(b)local ba=2
while ba<=a7 and a9[ba]<b do ba+=1 end ba=math.min(ba,a7)local bb=a9[ba]-a9[ba-1
]if bb<=0 then return a6[ba]end local bc,bd,be=math.clamp((b-a9[ba-1])/bb,0,1),
a6[ba-1],a6[ba]return Vector3.new(bd.X+(be.X-bd.X)*bc,bd.Y+(be.Y-bd.Y)*bc,bd.Z+(
be.Z-bd.Z)*bc)end local bb,bc,bd=function(bb)local bc=a8-bb if bc<=1 then return
math.max(0.2,bc)end local bd,be=math.min(bb+2,a8),math.min(bb+4.5,a8)if be-bb<
0.8 then return math.min(aj,bc)end local bf,bg,bh=ba(bb),ba(bd),ba(be)local bi,
bj,bk,bl=bg.X-bf.X,bg.Z-bf.Z,bh.X-bg.X,bh.Z-bg.Z local bm,bn=math.sqrt(bi*bi+bj*
bj),math.sqrt(bk*bk+bl*bl)if bm>0.1 and bn>0.1 then local bo=math.clamp((bi*bk+
bj*bl)/(bm*bn),-1,1)local bp=math.clamp((bo+0.2)/1.2,0,1)local bq=aj+(ak-aj)*bp
return math.min(bq,bc)end return math.min(ak,bc)end,{},{}if a1.events and(aw or
ax or ay)then local be,bf=a1.events.dwells or{},a1.events.skills or{}for bg,bh
in ipairs(be)do local bi,bj=b(bh.pos),bh.dur or 0 if bi<=0.8 or bi>=a8-0.8 then
bj=aC end bc[bg]={arc=bi,dur=bj,facing=bh.facing,skills={},pos=bh.pos}end if aC>
0 and(#bc==0 or bc[1].arc>0.8)then table.insert(bc,1,{arc=0,dur=aC,facing=a1.
events and a1.events.startFacing or nil,skills={},pos=a1.startPos or a6[1]})end
for bg,bh in ipairs(bf)do local bi=(aw and bh.dw>0 and bc[bh.dw])and bc[bh.dw]or
nil if bi then table.insert(bi.skills,{tOff=bh.dwT or 0,facing=bh.facing,key=bh.
key})else table.insert(bd,{arc=b(bh.pos),facing=bh.facing,key=bh.key})end end
table.sort(bd,function(bg,bh)return bg.arc<bh.arc end)end local be,bf,bg=
function(be)if not aJ or(be.dur or 0)<=0 then return true end if aw then local
bf=be.pos or aV(a5)if bf then pcall(function()a4:MoveTo(bf)end)end if ay and be.
facing then aZ(a5,be.facing)end local bg,bh,bi=os.clock(),{},0 while aJ and(os.
clock()-bg<be.dur)do if not a5 or not a5.Parent then return false,'no_root'end
if ab.IsDead()then return false,'dead'end if ab.GetCurrentRoomIndex()~=a2 then
return false,'room_changed'end if ab.IsBossActive()and not a3 then return false,
'boss'end if bf then pcall(function()a4:MoveTo(bf)end)end local bj=os.clock()-bg
for bk,bl in ipairs(be.skills or{})do if not bh[bk]and bj>=(bl.tOff or 0)then bh
[bk]=true if ay and bl.facing then aZ(a5,bl.facing)bi=os.clock()+az end if ax
then aY(bl.key or'QE')end end end task.wait(0.04)end for bj,bk in ipairs(be.
skills or{})do if not bh[bj]then bh[bj]=true if ay and bk.facing then aZ(a5,bk.
facing)bi=os.clock()+az end if ax then aY(bk.key or'QE')end end end while aJ and
os.clock()<bi do if bf then pcall(function()a4:MoveTo(bf)end)end task.wait(0.04)
end if ay then a0()end end return true end,a1.startPos or a6[1],aV(a5)if bg and
bf then local bh=aW(bg,bf)if bh>=3 then pcall(function()a4:MoveTo(bf)end)local
bi=os.clock()+5 while aJ and os.clock()<bi do local bj=aV(a5)if not bj then
break end if aW(bj,bf)<3 then break end if ab.IsDead()or ab.GetCurrentRoomIndex(
)~=a2 then break end task.wait(0.03)end end local bi=aV(a5)if bi and aW(bi,bf)<=
3.5 then pcall(function()local bj=a5.CFrame.Rotation a5.CFrame=CFrame.new(bf.X,
a5.Position.Y,bf.Z)*bj a5.AssemblyLinearVelocity=Vector3.zero a5.
AssemblyAngularVelocity=Vector3.zero a4:MoveTo(a5.Position)end)end end local bh,
bi,bj,bk,bl,bm,bn,bo=0,bf or aV(a5),os.clock(),1,1,0,(a1.speed and a1.speed>5)
and a1.speed or(a4.WalkSpeed or 20)local bp,bq,br=math.clamp(bn*aB,al,am),0
local bs=function(bs)local bt,bu=os.clock(),br and aW(br,bs)or math.huge if bu>
0.15 or bt-bq>=0.08 then br=bs bq=bt pcall(function()a4:MoveTo(bs)end)end end
while aJ do if not a5 or not a5.Parent then a0()return false,'no_root'end if ab.
IsDead()then a0()return false,'dead'end if ab.GetCurrentRoomIndex()~=a2 then a0(
)return false,'room_changed'end if ab.IsBossActive()and not a3 then a0()return
false,'boss'end local bt=aV(a5)if not bt then task.wait(0.08)continue end local
bu=b(bt,math.max(0,bh-an),math.min(a8,bh+ao))if bu>bh then bh=bu end aN=bh aP=a8
>0 and math.clamp(math.floor((bh/a8)*100),0,100)or 0 if bi then if aW(bt,bi)>
0.02 then bj=os.clock()end end bi=bt if os.clock()-bj>ap then bh=math.min(bh+aq,
a8-ai)bj=os.clock()bi=bt end local bv,bw,bx,by=bd[bl],bc[bk],false local bz,bA=
bw and(bw.arc-bh)or math.huge,bv and(bv.arc-bh)or math.huge if bz<bA and bz>0
and bz<=bp then if ay then local bB=(bw.skills and#bw.skills>0 and bw.skills[1].
facing)or bw.facing if bB then by=bB end end elseif bA<=bz and bA>0 and bA<=bp
then if ay and bv.facing then by=bv.facing end end if by then bx=true a_(a5,by,
0.35)end while bl<=#bd and bd[bl].arc<=bh do local bB=bd[bl]if ay and bB.facing
then aZ(a5,bB.facing)bo=bB.facing bm=os.clock()+az end if ax then aY(bB.key or
'QE')end bl+=1 end while bk<=#bc and bh>=bc[bk].arc do local bB=bc[bk]local bC,
bD=be(bB)if not bC then a0()return false,bD end bk+=1 bi=aV(a5)bj=os.clock()end
if bh>=a8-ai then while bk<=#bc do local bB=bc[bk]local bC,bD=be(bB)if not bC
then a0()return false,bD end bk+=1 end while bl<=#bd do local bB=bd[bl]if ay and
bB.facing then aZ(a5,bB.facing)bm=os.clock()+az end if ax then aY(bB.key or'QE')
end bl+=1 end a0()pcall(function()a4:MoveTo(a6[a7])end)local bB=os.clock()+5
while aJ do local bC=aV(a5)if bC and aW(bC,a6[a7])<=ai then break end if ab.
GetCurrentRoomIndex()~=a2 then a0()return false,'room_changed'end if(ab.
IsBossActive()and not a3)or ab.IsDead()then a0()return false,'dead'end if os.
clock()>=bB then break end if os.clock()>=bm and a4.AutoRotate~=true then a4.
AutoRotate=true end task.wait(0.08)end a0()aN=a8 aP=100 return true,'completed'
end if os.clock()<bm or bx then if a4.AutoRotate~=false then a4.AutoRotate=false
end elseif a4.AutoRotate~=true then a4.AutoRotate=true end local bB=bb(bh)local
bC=ba(math.min(bh+bB,a8-0.01))bs(bC)task.wait(0.05)end a0()return false,
'stopped'end local a2=function()local a2,a3,a4=0,false,false aM=1 while aJ do if
aK then break end if ab.IsDead()then a4=true task.wait(0.25)continue end if a4
then a4=false end if ab.IsInLobby()then aK=false aJ=false break end if ab.
IsBossActive()and not aL then task.wait(0.25)continue end local a5=ab.
GetCurrentRoomIndex()if a5<=0 then task.wait(0.1)continue end if a5~=a2 then a2=
a5 a3=false aM=1 aN=0 aO=0 aP=0 end local a6=ac.GetRoomSegment(aR,a5)if not a6
then task.wait(0.1)continue end local a7=a6.phases or{a6}local a8=#a7 if a3 then
task.wait(0.1)continue end local a9=a7[math.min(aM,a8)]or a6 local b,ba=a1(a9,a5
,aL)a0()if b then a3=true aN=aO aP=100 else if ba=='dead'then aM+=1 local bb=
math.min(aM,a8)if a8>1 then ad.Notify('Path Record',(
'T\u{1eed} tr\u{1ead}n (Phase %d/%d): Ch\u{1edd} h\u{1ed3}i sinh \u{111}\u{1ec3} ch\u{1ea1}y Phase %d...'
):format(aM-1,a8,bb),3)else ad.Notify('Path Record',
'T\u{1eed} tr\u{1ead}n: \u{110}ang ch\u{1edd} h\u{1ed3}i sinh \u{111}\u{1ec3} \u{111}i l\u{1ea1}i...'
,2)end while aJ and ab.IsDead()do task.wait(0.2)end task.wait(0.6)end end end
aI()a0()aS=nil aT()end function av.IsPlaying()return aJ end function av.
ResumeWanted()return aK end function av.GetActiveMap()return aR end function av.
IsBossPlayActive()return aL end function av.GetStatus()return{playing=aJ,map=aR,
room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(),phase=aM,resume=aK,
progressPercent=aP,progressStuds=aN,totalStuds=aO}end function av.
OnStatusChanged(a3)if type(a3)~='function'then return function()end end table.
insert(aQ,a3)return function()for a4,a5 in ipairs(aQ)do if a5==a3 then table.
remove(aQ,a4)break end end end end function av.Start()if aJ then return false,
'\u{111}ang ph\u{e1}t r\u{1ed3}i'end if ab.IsInLobby()then return false,
'\u{111}ang \u{1edf} lobby'end local a3=ab.GetCurrentRoomIndex()if a3<=0 then
return false,'ch\u{1b0}a c\u{f3} room'end local a4=ab.GetCurrentDungeonName()if
not a4 or#a4==0 then return false,
'kh\u{f4}ng x\u{e1}c \u{111}\u{1ecb}nh \u{111}\u{1b0}\u{1ee3}c map'end if not ac
.HasSegmentOrMacro(a4,a3)then return false,(
'map [%s] ch\u{1b0}a c\u{f3} segment room %d'):format(a4,a3)end local a5=ac.
GetMapMode(a4)=='full'if ab.IsBossActive()and(not a5 or not ac.
HasSegmentOrMacro(a4,a3))then return false,
'boss room (h\u{e3}y d\u{f9}ng Hazard Scanner)'end aR=a4 aL=a5 aK=false aM=1 aN=
0 aO=0 aP=0 aJ=true aS=task.spawn(a2)aT'started'return true end function av.Stop
()aJ=false aK=false aR=nil aL=false aM=1 aN=0 aO=0 aP=0 if aS then task.cancel(
aS)aS=nil end aX(ab.GetHumanoid())aI()a0()aT'stopped'end function av.
PauseForExclusive()if not aJ then return end aK=true aJ=false aL=false aN=0 aO=0
aP=0 if aS then task.cancel(aS)aS=nil end aX(ab.GetHumanoid())aI()a0()ad.Notify(
'Path Record',
'Nh\u{1b0}\u{1edd}ng \u{111}i\u{1ec1}u khi\u{1ec3}n: s\u{1ebd} t\u{1ef1} ph\u{e1}t ti\u{1ebf}p khi v\u{e0}o room c\u{f3} b\u{1ea3}n ghi'
,3)aT'paused'end return av end function a.k()local aa,ab,ac,ad,ae,af,ag=a.load
'a',a.load'c',a.load'h',a.load'i',a.load'j',a.load'b',game:GetService'Workspace'
local ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax,ay,az,aA,aB,aC,aD=aa.
RunService,{},'PR_PathVisual_Container','PR_PathVisual_Anchor',Color3.fromRGB(
255,60,60),Color3.fromRGB(255,90,90),Color3.fromRGB(0,255,120),Color3.fromRGB(0,
220,110),Color3.fromRGB(0,230,255),Color3.fromRGB(255,80,180),Color3.fromRGB(255
,190,30),Color3.fromRGB(200,70,255),Color3.fromRGB(220,100,255),Color3.fromRGB(
255,210,60),0.35,0.55,2.5,3,0.35,true,true,true,true local aE,aF,aG,aH,aI,aJ,aK,
aL,aM,aN,aO=av,true,0,{},{},{},{},{}local aP,aQ,aR,aS,aT,aU,aV,aW=function()if
aM and aM.Parent and aN and aN.Parent then return aN end ai.Clear()local aP=
Instance.new'Folder'aP.Name=aj aP.Parent=ag local aQ=Instance.new'Part'aQ.Name=
ak aQ.Anchored=true aQ.CanCollide=false aQ.CanQuery=false aQ.CanTouch=false aQ.
Transparency=1 aQ.Size=Vector3.new(1,1,1)aQ.CFrame=CFrame.new(0,0,0)aQ.Parent=aP
aM=aP aN=aQ table.clear(aH)table.clear(aI)table.clear(aJ)table.clear(aK)table.
clear(aL)return aN end,function(aP,aQ)local aR=aH[aP]if not aR or not aR.Parent
then aR=Instance.new'SphereHandleAdornment'aR.Name='PR_NodeSphere_'..tostring(aP
)aR.Adornee=aQ aR.AlwaysOnTop=aF aR.ZIndex=5 aR.Transparency=0.2 aR.Parent=aQ aH
[aP]=aR end return aR end,function(aP,aQ)local aR=aI[aP]if not aR or not aR.
Parent then aR=Instance.new'LineHandleAdornment'aR.Name='PR_PathLine_'..
tostring(aP)aR.Adornee=aQ aR.AlwaysOnTop=aF aR.ZIndex=4 aR.Transparency=0.3 aR.
Thickness=ax aR.Parent=aQ aI[aP]=aR end return aR end,function(aP,aQ)local aR=aJ
[aP]if not aR or not aR.Parent then aR=Instance.new'SphereHandleAdornment'aR.
Name='PR_EventSphere_'..tostring(aP)aR.Adornee=aQ aR.AlwaysOnTop=aF aR.ZIndex=8
aR.Transparency=0.15 aR.Radius=aw aR.Parent=aQ aJ[aP]=aR end return aR end,
function(aP,aQ)local aR=aK[aP]if not aR or not aR.Parent then aR=Instance.new
'LineHandleAdornment'aR.Name='PR_FacingRay_'..tostring(aP)aR.Adornee=aQ aR.
AlwaysOnTop=aF aR.ZIndex=9 aR.Transparency=0.1 aR.Thickness=ay aR.Parent=aQ aK[
aP]=aR end return aR end,function(aP,aQ)local aR=aL[aP]if not aR or not aR.
billboard or not aR.billboard.Parent then local aS=Instance.new'Attachment'aS.
Name='PR_BadgeAtt_'..tostring(aP)aS.Parent=aQ local aT=Instance.new
'BillboardGui'aT.Name='PR_BadgeGui_'..tostring(aP)aT.Adornee=aS aT.Size=UDim2.
new(0,115,0,24)aT.StudsOffset=Vector3.new(0,1.6,0)aT.AlwaysOnTop=true aT.
MaxDistance=180 aT.LightInfluence=0 aT.Parent=aM local aU=Instance.new'Frame'aU.
Name='BadgeFrame'aU.Size=UDim2.new(1,0,1,0)aU.BackgroundColor3=Color3.fromRGB(15
,15,20)aU.BackgroundTransparency=0.25 aU.BorderSizePixel=0 aU.Parent=aT local aV
=Instance.new'UICorner'aV.CornerRadius=UDim.new(0,6)aV.Parent=aU local aW=
Instance.new'UIStroke'aW.Name='Stroke'aW.Color=as aW.Thickness=1.4 aW.
Transparency=0.15 aW.Parent=aU local aX=Instance.new'TextLabel'aX.Name='Text'aX.
Size=UDim2.new(1,-6,1,0)aX.Position=UDim2.new(0,3,0,0)aX.BackgroundTransparency=
1 aX.Font=Enum.Font.GothamBold aX.TextSize=11 aX.TextColor3=Color3.fromRGB(255,
255,255)aX.RichText=true aX.Text=''aX.TextXAlignment=Enum.TextXAlignment.Center
aX.TextYAlignment=Enum.TextYAlignment.Center aX.Parent=aU aR={attachment=aS,
billboard=aT,frame=aU,stroke=aW,label=aX}aL[aP]=aR end return aR end,function(aP
)if not aP then return nil end if typeof(aP)=='Vector3'then if aP.Magnitude>
0.001 then return aP.Unit end return nil end if type(aP)=='table'and type(aP.X)
=='number'and type(aP.Z)=='number'then local aQ=Vector3.new(aP.X,0,aP.Z)if aQ.
Magnitude>0.001 then return aQ.Unit end end return nil end,function()for aP,aQ
in ipairs(aH)do if aQ and aQ.Parent then aQ.Visible=false end end for aP,aQ in
ipairs(aI)do if aQ and aQ.Parent then aQ.Visible=false end end for aP,aQ in
ipairs(aJ)do if aQ and aQ.Parent then aQ.Visible=false end end for aP,aQ in
ipairs(aK)do if aQ and aQ.Parent then aQ.Visible=false end end for aP,aQ in
ipairs(aL)do if aQ and aQ.billboard and aQ.billboard.Parent then aQ.billboard.
Enabled=false end end end function ai.Update()if not aA then aW()return end if
ab.IsInLobby()then aW()return end local aX,aY,aZ,a_=ad.IsRecording(),{},{},{}if
aX then local a0=ad.GetRoomPhases and ad.GetRoomPhases()if a0 and#a0>0 then for
a1,a2 in ipairs(a0)do if a2 and a2.points and#a2.points>0 then table.insert(aY,
a2.points)end end end local a1=ad.GetCurrentPoints()if a1 and#a1>0 then table.
insert(aY,a1)end local a2=ad.GetCurrentDwells and ad.GetCurrentDwells()if a2
then aZ=a2 end local a3=ad.GetCurrentSkills and ad.GetCurrentSkills()if a3 then
a_=a3 end else local a0,a1=ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex()if
a0 and#a0>0 and a1>0 then local a2=ac.GetRoomSegment(a0,a1)if a2 then if a2.
phases and#a2.phases>0 then for a3,a4 in ipairs(a2.phases)do if a4 and a4.points
and#a4.points>0 then table.insert(aY,a4.points)end end elseif a2.points and#a2.
points>0 then table.insert(aY,a2.points)end if a2.events then aZ=a2.events.
dwells or{}a_=a2.events.skills or{}end end end end if#aY==0 then aW()return end
local a0=aP()if not a0 then return end local a1,a2,a3,a4,a5,a6,a7,a8,a9=aX and
al or an,aX and am or ao,0,0,0,0,0 for b,ba in ipairs(aY)do local bb=#ba if bb>0
then if not a8 then a8=ba[1]end a9=ba[bb]for bc=1,bb do local bd=ba[bc]if bd
then a3+=1 local be=aQ(a3,a0)be.Radius=aE be.Color3=a1 be.AlwaysOnTop=aF be.
CFrame=CFrame.new(bd+Vector3.new(0,az,0))be.Visible=true end end if aB and bb>=2
then for bc=1,bb-1 do local bd,be=ba[bc],ba[bc+1]if bd and be then local bf,bg=
bd+Vector3.new(0,az,0),be+Vector3.new(0,az,0)local bh=(bg-bf).Magnitude if bh>
0.05 then a4+=1 local bi=aR(a4,a0)bi.Length=bh bi.Thickness=ax bi.Color3=a2 bi.
AlwaysOnTop=aF bi.CFrame=CFrame.lookAt(bf,bg)bi.Visible=true end end end end end
end if aC then local b if a8 then for ba,bb in ipairs(aZ)do if bb.pos and(bb.pos
-a8).Magnitude<1.5 then b=bb break end end a5+=1 local ba=aS(a5,a0)ba.Radius=aw
ba.Color3=ap ba.AlwaysOnTop=aF ba.CFrame=CFrame.new(a8+Vector3.new(0,az,0))ba.
Visible=true a7+=1 local bb=aU(a7,a0)bb.attachment.WorldPosition=a8+Vector3.new(
0,az,0)bb.stroke.Color=ap local bc=ae and ae.GetStartPauseTime and ae.
GetStartPauseTime()or 0 if bc>0 then bb.label.Text=(
"<font color='rgb(0,240,255)'><b>\u{1f6a9} START (%.1fs)</b></font>"):format(bc)
else bb.label.Text="<font color='rgb(0,240,255)'><b>\u{1f6a9} START</b></font>"
end bb.billboard.Enabled=true if aD and b and b.facing then local bd=aV(b.facing
)if bd then a6+=1 local be,bf=aT(a6,a0),a8+Vector3.new(0,az,0)local bg=bf+bd*3.5
be.Length=3.5 be.Color3=ap be.AlwaysOnTop=aF be.CFrame=CFrame.lookAt(bf,bg)be.
Visible=true end end end for ba,bb in ipairs(aZ)do local bc=bb.pos local bd,be=
a8 and(bc-a8).Magnitude<1.5,a9 and(bc-a9).Magnitude<1.5 if bc and not bd and not
be then a5+=1 local bf=aS(a5,a0)bf.Radius=aw bf.Color3=ar bf.AlwaysOnTop=aF bf.
CFrame=CFrame.new(bc+Vector3.new(0,az,0))bf.Visible=true local bg=math.round((bb
.dur or 0)*10)/10 a7+=1 local bh=aU(a7,a0)bh.attachment.WorldPosition=bc+Vector3
.new(0,az,0)bh.stroke.Color=ar bh.label.Text=(
"<font color='rgb(255,200,60)'><b>\u{23f3} Pause (%.1fs)</b></font>"):format(bg)
bh.billboard.Enabled=true if aD then local bi=aV(bb.facing)if bi then a6+=1
local bj,bk=aT(a6,a0),bc+Vector3.new(0,az,0)local bl=bk+bi*3 bj.Length=3 bj.
Color3=au bj.AlwaysOnTop=aF bj.CFrame=CFrame.lookAt(bk,bl)bj.Visible=true end
end end end for ba,bb in ipairs(a_)do local bc=bb.pos if bc then a5+=1 local bd=
aS(a5,a0)bd.Radius=aw bd.Color3=as bd.AlwaysOnTop=aF bd.CFrame=CFrame.new(bc+
Vector3.new(0,az,0))bd.Visible=true local be=(bb.key and#bb.key>0)and bb.key or
'QE'a7+=1 local bf=aU(a7,a0)bf.attachment.WorldPosition=bc+Vector3.new(0,az,0)bf
.stroke.Color=as bf.label.Text=(
"<font color='rgb(220,100,255)'><b>\u{26a1} Skill [%s]</b></font>"):format(be)bf
.billboard.Enabled=true if aD then local bg=aV(bb.facing)if bg then a6+=1 local
bh,bi=aT(a6,a0),bc+Vector3.new(0,az,0)local bj=bi+bg*3.8 bh.Length=3.8 bh.Color3
=at bh.AlwaysOnTop=aF bh.CFrame=CFrame.lookAt(bi,bj)bh.Visible=true end end end
end local ba if a9 and a9~=a8 and not aX then for bb,bc in ipairs(aZ)do if bc.
pos and(bc.pos-a9).Magnitude<1.5 then ba=bc break end end a5+=1 local bb=aS(a5,
a0)bb.Radius=aw bb.Color3=aq bb.AlwaysOnTop=aF bb.CFrame=CFrame.new(a9+Vector3.
new(0,az,0))bb.Visible=true a7+=1 local bc=aU(a7,a0)bc.attachment.WorldPosition=
a9+Vector3.new(0,az,0)bc.stroke.Color=aq local bd=ae and ae.GetStartPauseTime
and ae.GetStartPauseTime()or 0 if ba and bd>0 then bc.label.Text=(
"<font color='rgb(255,100,200)'><b>\u{1f3c1} FINISH (%.1fs)</b></font>"):format(
bd)else bc.label.Text=
"<font color='rgb(255,100,200)'><b>\u{1f3c1} FINISH</b></font>"end bc.billboard.
Enabled=true if aD and ba and ba.facing then local be=aV(ba.facing)if be then a6
+=1 local bf,bg=aT(a6,a0),a9+Vector3.new(0,az,0)local bh=bg+be*3.5 bf.Length=3.5
bf.Color3=aq bf.AlwaysOnTop=aF bf.CFrame=CFrame.lookAt(bg,bh)bf.Visible=true end
end end end for b=a3+1,#aH do local ba=aH[b]if ba and ba.Parent then ba.Visible=
false end end for b=a4+1,#aI do local ba=aI[b]if ba and ba.Parent then ba.
Visible=false end end for b=a5+1,#aJ do local ba=aJ[b]if ba and ba.Parent then
ba.Visible=false end end for b=a6+1,#aK do local ba=aK[b]if ba and ba.Parent
then ba.Visible=false end end for b=a7+1,#aL do local ba=aL[b]if ba and ba.
billboard and ba.billboard.Parent then ba.billboard.Enabled=false end end end
local aX=function()if aO then return end aO=ah.Heartbeat:Connect(function()local
aX,aY=os.clock(),ad.IsRecording()local aZ=aY and 0.03 or 0.1 if aX-aG<aZ then
return end aG=aX pcall(ai.Update)end)end function ai.SetEnabled(aY)aA=aY and
true or false if not aA then aW()else pcall(ai.Update)end end function ai.
IsEnabled()return aA end function ai.SetShowLines(aY)aB=aY and true or false if
not aB then for aZ,a_ in ipairs(aI)do if a_ and a_.Parent then a_.Visible=false
end end else pcall(ai.Update)end end function ai.IsShowLinesEnabled()return aB
end function ai.SetShowEvents(aY)aC=aY and true or false if not aC then for aZ,
a_ in ipairs(aJ)do if a_ and a_.Parent then a_.Visible=false end end for aZ,a_
in ipairs(aL)do if a_ and a_.billboard and a_.billboard.Parent then a_.billboard
.Enabled=false end end else pcall(ai.Update)end end function ai.
IsShowEventsEnabled()return aC end function ai.SetShowFacingRays(aY)aD=aY and
true or false if not aD then for aZ,a_ in ipairs(aK)do if a_ and a_.Parent then
a_.Visible=false end end else pcall(ai.Update)end end function ai.
IsShowFacingRaysEnabled()return aD end function ai.SetNodeRadius(aY)if type(aY)
=='number'then aE=math.clamp(aY,0.1,1.5)pcall(ai.Update)end end function ai.
GetNodeRadius()return aE end function ai.SetAlwaysOnTop(aY)aF=aY and true or
false for aZ,a_ in ipairs(aH)do if a_ and a_.Parent then a_.AlwaysOnTop=aF end
end for aZ,a_ in ipairs(aI)do if a_ and a_.Parent then a_.AlwaysOnTop=aF end end
for aZ,a_ in ipairs(aJ)do if a_ and a_.Parent then a_.AlwaysOnTop=aF end end for
aZ,a_ in ipairs(aK)do if a_ and a_.Parent then a_.AlwaysOnTop=aF end end for aZ,
a_ in ipairs(aL)do if a_ and a_.billboard and a_.billboard.Parent then a_.
billboard.AlwaysOnTop=aF end end end function ai.IsAlwaysOnTopEnabled()return aF
end function ai.Clear()aW()table.clear(aH)table.clear(aI)table.clear(aJ)table.
clear(aK)table.clear(aL)local aY=ag:FindFirstChild(aj)if aY then pcall(function(
)aY:Destroy()end)end aM=nil aN=nil end function ai.Destroy()if aO then aO:
Disconnect()aO=nil end ai.Clear()end ai.Clear()aX()af.Register(function()ai.
Destroy()end)return ai end function a.l()local aa,ab,ac=a.load'a',a.load'c',a.
load'b'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax,ay,
az=aa.player,aa.RunService,aa.CoreGui or game:GetService'CoreGui',game:
GetService'Workspace',{},{Cyan=Color3.fromRGB(0,230,255),Red=Color3.fromRGB(255,
60,60),Orange=Color3.fromRGB(255,140,0),Yellow=Color3.fromRGB(255,220,40),Green=
Color3.fromRGB(0,255,120),Emerald=Color3.fromRGB(40,220,160),Blue=Color3.
fromRGB(0,140,255),Purple=Color3.fromRGB(180,80,255),Magenta=Color3.fromRGB(255,
60,200),White=Color3.fromRGB(255,255,255)},false,25,0.4,true,true,'Cyan','Red',
0.8,0.15,'PR_InRange_Highlight',0.2,0,{}local aA,aB,aC,aD=function()return ai[ao
]or ai.Cyan end,function()return ai[ap]or ai.Red end,function()local aA=ad and
ad.Character if not aA or not aA.Parent then return nil end local aB=aA:
FindFirstChildOfClass'Humanoid'if aB and aB.Health<=0 then return nil end local
aC=aA:FindFirstChild'HumanoidRootPart'if aC and aC.Parent then return aC end
return nil end,function()for aA,aB in pairs(av)do pcall(function()aB:Destroy()
end)end table.clear(av)pcall(function()for aA,aB in ipairs(ag:GetDescendants())
do if aB.Name==as then pcall(function()aB:Destroy()end)end end end)end local aE,
aF=function()if aw then pcall(function()aw:Destroy()end)aw=nil end if ax then
pcall(function()ax:Destroy()end)ax=nil end az=nil aD()end,function()if not aw or
not aw.Parent then pcall(function()if aw then aw:Destroy()end end)aw=Instance.
new'CylinderHandleAdornment'aw.Name='PR_SkillRangeRing'aw.AlwaysOnTop=true aw.
ZIndex=5 aw.Parent=af end if am then if not ax or not ax.Parent then pcall(
function()if ax then ax:Destroy()end end)ax=Instance.new
'CylinderHandleAdornment'ax.Name='PR_SkillRangeFill'ax.AlwaysOnTop=true ax.
ZIndex=4 ax.Parent=af end else if ax then pcall(function()ax:Destroy()end)ax=nil
end end end local aG,aH=function(aG)if not aj then aE()return end aF()local aH,
aI=2.6,aA()local aJ=Vector3.new(aG.Position.X,aG.Position.Y-aH,aG.Position.Z)
local aK=CFrame.new(aJ)*CFrame.Angles(math.rad(90),0,0)local aL=aG.CFrame:
ToObjectSpace(aK)if aw then aw.Adornee=aG aw.Height=0.06 aw.Radius=ak aw.
InnerRadius=math.max(0.1,ak-al)aw.Color3=aI aw.Transparency=1-aq aw.CFrame=aL aw
.Visible=(aG~=nil and aG.Parent~=nil)end if ax and am then ax.Adornee=aG ax.
Height=0.02 ax.Radius=ak ax.InnerRadius=0 ax.Color3=aI ax.Transparency=1-ar ax.
CFrame=aL ax.Visible=(aG~=nil and aG.Parent~=nil)end end,function(aG)if not aj
or not an or not aG then if next(av)~=nil then aD()end return end local aH,aI,aJ
,aK,aL=ab.GetTrackedEnemyData(),aG.Position,ak*ak,{},aB()for aM,aN in ipairs(aH)
do local aO,aP,aQ=aN.Model,aN.Root,aN.Humanoid if aO and aO.Parent and aP and aP
.Parent and aQ and aQ.Health>0 then local aR,aS=aP.Position.X-aI.X,aP.Position.Z
-aI.Z if(aR*aR+aS*aS)<=aJ then aK[aO]=true end end end for aM,aN in pairs(av)do
if not aK[aM]or not aM.Parent then pcall(function()aN:Destroy()end)av[aM]=nil
end end for aM in pairs(aK)do if not av[aM]or not av[aM].Parent then local aN=aM
:FindFirstChild(as)local aO=(aN and aN:IsA'Highlight')and aN or Instance.new
'Highlight'aO.Name=as aO.Adornee=aM aO.FillColor=aL aO.FillTransparency=0.35 aO.
OutlineColor=Color3.fromRGB(255,255,255)aO.OutlineTransparency=0.1 aO.DepthMode=
Enum.HighlightDepthMode.AlwaysOnTop aO.Parent=aM av[aM]=aO else local aN=av[aM]
if aN.FillColor~=aL then aN.FillColor=aL end if not aN.Enabled then aN.Enabled=
true end end end end local aI=function()if not aj then return end local aI=aC()
if not aI then if aw then aw.Visible=false end if ax then ax.Visible=false end
if next(av)~=nil then aD()end az=nil return end local aJ=2.6 local aK=Vector3.
new(aI.Position.X,aI.Position.Y-aJ,aI.Position.Z)local aL=CFrame.new(aK)*CFrame.
Angles(math.rad(90),0,0)local aM=aI.CFrame:ToObjectSpace(aL)if not aw or not aw.
Parent or aI~=az then az=aI aG(aI)else if aw.Adornee~=aI then aw.Adornee=aI end
aw.CFrame=aM if not aw.Visible then aw.Visible=true end if am then if not ax or
not ax.Parent then aG(aI)else if ax.Adornee~=aI then ax.Adornee=aI end ax.CFrame
=aM if not ax.Visible then ax.Visible=true end end elseif ax and ax.Visible then
ax.Visible=false end end local aN=os.clock()if aN-au>=at then au=aN aH(aI)end
end function ah.SetEnabled(aJ)aj=aJ and true or false if aj then local aK=aC()if
aK then aG(aK)az=aK aH(aK)end if not ay then ay=ae.Heartbeat:Connect(aI)end else
aE()if ay then ay:Disconnect()ay=nil end az=nil end end function ah.IsEnabled()
return aj end function ah.SetRadius(aJ)if type(aJ)=='number'then ak=math.clamp(
aJ,5,150)local aK=aC()if aj and aK then aG(aK)aH(aK)end end end function ah.
GetRadius()return ak end function ah.SetFillEnabled(aJ)am=aJ and true or false
local aK=aC()if aj and aK then aG(aK)end end function ah.IsFillEnabled()return
am end function ah.SetHighlightInRange(aJ)an=aJ and true or false if not an then
aD()else local aK=aC()if aj and aK then aH(aK)end end end function ah.
IsHighlightInRangeEnabled()return an end function ah.GetColorNames()local aJ={
'Cyan','Red','Orange','Yellow','Green','Emerald','Blue','Purple','Magenta',
'White'}return aJ end function ah.GetSelectedCircleColor()return ao end function
ah.SetCircleColor(aJ)if type(aJ)=='string'and ai[aJ]then ao=aJ local aK=aC()if
aj and aK then aG(aK)end end end function ah.GetSelectedHighlightColor()return
ap end function ah.SetHighlightColor(aJ)if type(aJ)=='string'and ai[aJ]then ap=
aJ local aK=aC()if aj and aK then aH(aK)end end end if ad then ad.CharacterAdded
:Connect(function(aJ)if aj then task.spawn(function()local aK=aJ:WaitForChild(
'HumanoidRootPart',10)if aK and aj then aG(aK)az=aK aH(aK)end end)end end)end ab
.OnRespawn(function()if aj then task.delay(0.2,function()local aJ=aC()if aJ and
aj then aG(aJ)az=aJ aH(aJ)end end)end end)ac.Register(function()ah.SetEnabled(
false)aE()end)return ah end function a.m()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak
,al,am=a.load'a',a.load'c',a.load'b',a.load'd',a.load'e',a.load'h',a.load'i',a.
load'j',a.load'k',a.load'l',{},true,true function ak.IsTimelineCaptureEnabled()
return al end function ak.SetTimelineCapture(an)al=an and true or false ag.
SetCapture(al)fireStatus'timeline'end function ak.IsTimelineReplayEnabled()
return am end function ak.SetTimelineReplay(an)am=an and true or false ah.
SetReplayTimeline(am)fireStatus'timeline'end function ak.IsSpeedMatchEnabled()
return ah.IsSpeedMatchEnabled()end function ak.SetSpeedMatch(an)ah.
SetSpeedMatch(an and true or false)fireStatus'speedmatch'end function ak.
IsUseFastSpeedEnabled()return ah.IsUseFastSpeedEnabled()end function ak.
SetUseFastSpeed(an)ah.SetUseFastSpeed(an and true or false)fireStatus
'usefastspeed'end function ak.GetPreAimTime()return ah.GetPreAimTime()end
function ak.SetPreAimTime(an)ah.SetPreAimTime(an)fireStatus'preaim'end function
ak.GetSkillFaceHold()return ah.GetSkillFaceHold()end function ak.
SetSkillFaceHold(an)ah.SetSkillFaceHold(an)fireStatus'facehold'end function ak.
GetDoubleClickDelay()return ah.GetDoubleClickDelay()end function ak.
SetDoubleClickDelay(an)ah.SetDoubleClickDelay(an)fireStatus'doubleclick'end
function ak.GetStartPauseTime()return ah.GetStartPauseTime()end function ak.
SetStartPauseTime(an)ah.SetStartPauseTime(an)fireStatus'startpause'end local an,
ao,ap,aq,ar={}local as=function(as)local at=ag.GetStatus()local au={recording=ag
.IsRecording(),playing=ah.IsPlaying(),resume=ah.ResumeWanted(),autoPlayWanted=
autoPlayWanted,inLobby=ab.IsInLobby(),map=ab.GetCurrentDungeonName(),room=ab.
GetCurrentRoomIndex(),boss=ab.IsBossActive(),recordedMaps=af.Count(),pointCount=
ag.IsRecording()and at.pointCount or 0,phase=ah.IsPlaying()and ah.
GetCurrentPhaseIndex()or(ag.IsRecording()and at.phaseCount or 1),reason=as}for
av,aw in ipairs(an)do pcall(aw,au)end end function ak.ToggleRecord(at)if at then
if ag.IsRecording()then return true end if ah.IsPlaying()then ah.Stop()end local
au,av=ag.Start()if not au then ae.Notify('Path Record',
'Kh\u{f4}ng b\u{1eaf}t \u{111}\u{1ea7}u record: '..tostring(av),3)end as()return
au else local au=ag.IsRecording()ag.Stop()as()return au end end function ak.
IsRecording()return ag.IsRecording()end function ak.CurrentRoomHasRecord()return
af.HasSegmentOrMacro(ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex())end
function ak.GetMapMode(at)return af.GetMapMode(at)end function ak.SetMapMode(at,
au)if af.SetMapMode(at,au)then as'mode'end end local at=false function ak.
IsAutoPlayWanted()return at end function ak.TogglePlay(au)at=au and true or
false if at then if ah.IsPlaying()then as'already_playing'return true end if ag.
IsRecording()then ag.Stop()end if ab.IsInLobby()then as'armed_lobby'return true
end local av,aw=ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex()if not av or#
av==0 or aw<=0 then as'armed_waiting'return true end if ab.IsBossActive()and af.
GetMapMode(av)~='full'then as'armed_boss'return true end if af.
HasSegmentOrMacro(av,aw)then ad.EnableExclusive'PathRecord'ah.Start()end as
'play_started'return true else local av=ah.IsPlaying()ah.Stop()as'play_stopped'
return av end end function ak.IsPlaying()return ah.IsPlaying()end function ak.
IsEnabled()return ah.IsPlaying()end function ak.SetRangeVisual(au)aj.SetEnabled(
au)as'rangevisual'end function ak.IsRangeVisualEnabled()return aj.IsEnabled()end
function ak.SetRangeVisualRadius(au)aj.SetRadius(au)as'rangeradius'end function
ak.GetRangeVisualRadius()return aj.GetRadius()end function ak.SetRangeVisualFill
(au)aj.SetFillEnabled(au)as'rangefill'end function ak.IsRangeVisualFillEnabled()
return aj.IsFillEnabled()end function ak.SetHighlightInRange(au)aj.
SetHighlightInRange(au)as'rangehighlight'end function ak.
IsHighlightInRangeEnabled()return aj.IsHighlightInRangeEnabled()end function ak.
GetRangeColorNames()return aj.GetColorNames()end function ak.
GetSelectedCircleColor()return aj.GetSelectedCircleColor()end function ak.
SetCircleColor(au)aj.SetCircleColor(au)as'circlecolor'end function ak.
GetSelectedHighlightColor()return aj.GetSelectedHighlightColor()end function ak.
SetHighlightColor(au)aj.SetHighlightColor(au)as'highlightcolor'end function ak.
SetVisualEnabled(au)ai.SetEnabled(au)as'visual'end function ak.IsVisualEnabled()
return ai.IsEnabled()end function ak.SetVisualShowLines(au)ai.SetShowLines(au)as
'visuallines'end function ak.IsVisualShowLinesEnabled()return ai.
IsShowLinesEnabled()end function ak.SetVisualNodeRadius(au)ai.SetNodeRadius(au)
as'visualradius'end function ak.GetVisualNodeRadius()return ai.GetNodeRadius()
end function ak.SetVisualAlwaysOnTop(au)ai.SetAlwaysOnTop(au)as'visualontop'end
function ak.IsVisualAlwaysOnTopEnabled()return ai.IsAlwaysOnTopEnabled()end
function ak.SetVisualShowEvents(au)ai.SetShowEvents(au)as'visualevents'end
function ak.IsVisualShowEventsEnabled()return ai.IsShowEventsEnabled()end
function ak.SetVisualShowFacing(au)ai.SetShowFacingRays(au)as'visualfacing'end
function ak.IsVisualShowFacingEnabled()return ai.IsShowFacingRaysEnabled()end
function ak.GetMaps()return af.GetMaps()end function ak.GetMacro(au)return af.
GetMap(au)end function ak.RemoveMap(au)af.RemoveMap(au)as'removed'end function
ak.ClearAll()af.ClearAll()as'cleared'end function ak.ReloadFromDisk()af.
ReloadFromDisk()as'reloaded'end function ak.GetStatus()local au,av=ag.GetStatus(
),ah.GetStatus()return{recording=ag.IsRecording(),playing=ah.IsPlaying(),resume=
ah.ResumeWanted(),autoPlayWanted=at,inLobby=ab.IsInLobby(),map=ab.
GetCurrentDungeonName(),room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(),
recordedMaps=af.Count(),pointCount=au.pointCount,dwellCount=au.dwellCount or 0,
skillCount=au.skillCount or 0,phase=ah.IsPlaying()and ah.GetCurrentPhaseIndex()
or(ag.IsRecording()and au.phaseCount or 1),progressPercent=av.progressPercent or
0,progressStuds=av.progressStuds or 0,totalStuds=av.totalStuds or 0}end function
ak.OnStatusChanged(au)if type(au)~='function'then return function()end end table
.insert(an,au)return function()for av,aw in ipairs(an)do if aw==au then table.
remove(an,av)break end end end end ao=ab.OnBossActiveChanged(function(au)if not
au then return end if ah.ResumeWanted()or at then local av=ah.GetActiveMap()or
ab.GetCurrentDungeonName()if av and af.GetMapMode(av)=='full'then local aw=ab.
GetCurrentRoomIndex()if aw>0 and af.HasSegmentOrMacro(av,aw)then ad.
EnableExclusive'PathRecord'ah.Start()as'boss'end end return end if ah.IsPlaying(
)then local av=ah.GetActiveMap()or ab.GetCurrentDungeonName()if av and af.
GetMapMode(av)=='full'then ad.EnableExclusive'PathRecord'else ae.Notify(
'Path Record','Boss room: t\u{1ea1}m d\u{1eeb}ng, d\u{f9}ng Hazard Scanner',3)as
'boss'end end end)ap=af.OnChanged(function()as'storage'end)aq=ab.
OnRoomIndexChanged(function()if not at and not ah.ResumeWanted()then return end
local au=ab.GetCurrentRoomIndex()if au<=0 or ab.IsInLobby()or ab.IsDead()then
return end local av=ab.GetCurrentDungeonName()if not av or#av==0 then return end
if ah.GetActiveMap()and ah.GetActiveMap()~=av then return end if ab.
IsBossActive()and af.GetMapMode(av)~='full'then return end if not af.
HasSegmentOrMacro(av,au)then return end if not ah.IsPlaying()then ad.
EnableExclusive'PathRecord'ah.Start()as'resumed'end end)ar=ab.
OnDungeonNameChanged(function(au)if ag.IsRecording()then ag.Stop
'\u{111}\u{1ed5}i map'end if ah.IsPlaying()or ah.ResumeWanted()then local av=ah.
GetActiveMap()if av and av~=au then ah.Stop()end end if at and au and#au>0 then
task.delay(0.3,function()if not at or ah.IsPlaying()or ag.IsRecording()then
return end local av=ab.GetCurrentRoomIndex()if av>0 and af.HasSegmentOrMacro(au,
av)then if not(ab.IsBossActive()and af.GetMapMode(au)~='full')then ad.
EnableExclusive'PathRecord'ah.Start()as'map_autoplay'end end end)end as'map'end)
ag.SetCapture(al)ah.SetReplayTimeline(am)ad.Register('PathRecord',function(au)if
not au then ah.PauseForExclusive()end as'disabled'end,ak.IsEnabled)task.delay(1,
function()if at and not ah.IsPlaying()and not ag.IsRecording()then local au=ab.
GetCurrentDungeonName()if au and#au>0 and not ab.IsInLobby()then if af.
HasSegmentOrMacro(au,ab.GetCurrentRoomIndex())then ak.TogglePlay(true)end end
end end)ac.Register(function()ah.Stop()ag.Cancel()ai.Clear()if ao then ao()ao=
nil end if aq then aq()aq=nil end if ar then ar()ar=nil end if ap then ap()ap=
nil end end)return ak end function a.n()local aa={}function aa.
PatchSliderLoadCallback(ab)if not ab or type(ab.UpdateValue)~='function'then
return ab end local ac=ab.UpdateValue ab.UpdateValue=function(ad,ae)ac(ad,ae)
local af=ad.Settings if af and af.Callback then task.spawn(function()pcall(af.
Callback,tonumber(ae))end)end end return ab end function aa.PatchDropdownRestore
(ab,ac)if not ab or type(ab.UpdateSelection)~='function'then return ab end local
ad=ab.UpdateSelection ab.UpdateSelection=function(ae,af)if type(af)=='string'and
af~=''and not ae:IsOption(af)then if ac then pcall(function()ae:InsertOptions{af
}end)else local ag=ae.Settings and ae.Settings.Options if type(ag)=='table'and#
ag>0 then af=ag[1]else local ah=next(ae:GetOptions())if ah then af=ah end end
end end ad(ae,af)end return ab end return aa end end local aa,ab,ac,ad,ae,af=a.
load'a',a.load'b',a.load'm',a.load'g',a.load'n',a.load'e'local ag=aa.RunService
return function(ah,ai)local aj=ai:Section{Side='Left'}aj:Header{Name=
'Path Record Controls'}aj:Label{Text=
"Macro = 1 b\u{1ea3}n ghi cho c\u{1ea3} map, <font color='rgb(0,255,120)'>b\u{1ea5}m Record 1 l\u{1ea7}n l\u{e0} ghi li\u{ea}n t\u{1ee5}c</font> qua t\u{1eeb}ng room (t\u{1ef1} l\u{1b0}u khi v\u{1ec1} lobby). Mode FULL -> record & ph\u{e1}t lu\u{f4}n c\u{1ea3} boss room."
}local ak,al,am,an,ao,ap,aq=false,false,false,false local ar,as=function()if not
ao then return nil end local ar=ao:GetOptions()for as,at in pairs(ar)do if at
and as~='None'then local au=string.match(as,'^Map %[(.+)%] %(%d+ rooms%)$')if au
and#au>0 then return au end end end return nil end,aj:Toggle{Name=
'Record Path (Macro)',Default=ac.IsRecording(),Callback=function(ar)if ak then
return end if ar then if ac.IsRecording()then return end if ac.
CurrentRoomHasRecord()then if an then return end an=true ah:Dialog{Title=
'Confirm Record',Description=
"Room n\u{e0}y <font color='rgb(255,200,0)'>\u{111}\u{e3} c\u{f3} macro \u{111}\u{1b0}\u{1ee3}c l\u{1b0}u</font>.\n\nRecord b\u{e2}y gi\u{1edd} s\u{1ebd} <b>GHI \u{110}\u{c8} segment c\u{169}</b> c\u{1ee7}a room \u{111}\u{f3}.\nB\u{1ea1}n v\u{1eab}n mu\u{1ed1}n record l\u{1ea1}i ch\u{1ee9}?"
,Buttons={{Name='Record (Overwrite)',Callback=function()an=false local as=ac.
ToggleRecord(true)if not as then pcall(function()ak=true recordToggle:
UpdateState(false)ak=false end)end end},{Name='Cancel',Callback=function()an=
false local as,at=pcall(function()ak=true recordToggle:UpdateState(false)ak=
false end)if not as then ak=false warn(
'Path Record: Cancel failed to reset toggle - '..tostring(at))end end}}}return
end ac.ToggleRecord(true)else an=false if ac.IsRecording()then ac.ToggleRecord(
false)end end end}aj:Label{Text=
"Record b\u{1eaf}t <font color='rgb(255,150,80)'>kho\u{1ea3}ng d\u{1eeb}ng</font> + <font color='rgb(255,80,80)'>skill (M2 / Q / E)</font> + h\u{1b0}\u{1edb}ng m\u{1eb7}t \u{111}\u{1ec3} ph\u{e1}t l\u{1ea1}i ch\u{ed}nh x\u{e1}c tuy\u{1ec7}t \u{111}\u{1ed1}i."
}local at,au,av,aw,ax,ay,az,aA=aj:Label{Text=
[[Record Mode (theo map): <font color='rgb(120,200,255)'>NORMAL</font>]]},aj:
Toggle{Name='Full Mode (Record & Play Boss Rooms)',Default=false,Callback=
function(at)if am then return end local au=ac.GetStatus().map local av=(au and#
au>0)and au or ar()if not av or#av==0 then af.Notify('Path Record',
'Ch\u{1b0}a c\u{f3} map n\u{e0}o \u{111}\u{1b0}\u{1ee3}c ch\u{1ecd}n. H\u{e3}y ch\u{1ecd}n map trong dropdown ho\u{1eb7}c v\u{e0}o dungeon.'
,3)pcall(function()am=true recordBossToggle:UpdateState(false)am=false end)
return end ac.SetMapMode(av,at and'full'or'normal')af.Notify('Path Record',(
'Map [%s]: Ch\u{1ebf} \u{111}\u{1ed9} %s'):format(av,at and
'FULL (record & ph\u{e1}t c\u{1ea3} boss room)'or
'NORMAL (b\u{1ecf} qua boss, d\u{f9}ng Hazard Scanner)'),3)if ap then ap(ac.
GetStatus())end end},aj:Toggle({Name='Play Path (Macro)',Default=ac.
IsAutoPlayWanted(),Callback=ad.Wrap(function(at)if al then return end ac.
TogglePlay(at)end)},'Toggle_PR_Play'),aj:Toggle({Name='Record Pauses & Skills',
Default=ac.IsTimelineCaptureEnabled(),Callback=ad.Wrap(function(at)ac.
SetTimelineCapture(at)end)},'Toggle_PR_TimelineCapture'),aj:Toggle({Name=
'Replay Pauses & Skills',Default=ac.IsTimelineReplayEnabled(),Callback=ad.Wrap(
function(at)ac.SetTimelineReplay(at)end)},'Toggle_PR_TimelineReplay'),aj:Toggle(
{Name='Match Record Speed (Precise)',Default=ac.IsSpeedMatchEnabled(),Callback=
ad.Wrap(function(at)ac.SetSpeedMatch(at)end)},'Toggle_PR_SpeedMatch'),aj:Toggle(
{Name='Use Player Fast Speed',Default=ac.IsUseFastSpeedEnabled(),Callback=ad.
Wrap(function(at)ac.SetUseFastSpeed(at)end)},'Toggle_PR_UseFastSpeed'),ai:
Section{Side='Left'}aA:Header{Name='Combat & Skill Timing'}ae.
PatchSliderLoadCallback(aA:Slider({Name='Pre-Aim Lead Time (s)',Default=ac.
GetPreAimTime(),Minimum=0.1,Maximum=1.5,DisplayMethod='Value',Precision=2,
Callback=ad.Wrap(function(aB)ac.SetPreAimTime(aB)end),onInputComplete=function(
aB)ad.SaveNow()af.Notify('Path Record',('Saved Pre-Aim Lead Time = %ss'):format(
tostring(aB)),2)end},'Slider_PR_PreAimTime'))ae.PatchSliderLoadCallback(aA:
Slider({Name='Skill Face Hold (s)',Default=ac.GetSkillFaceHold(),Minimum=0.5,
Maximum=2,DisplayMethod='Value',Precision=2,Callback=ad.Wrap(function(aB)ac.
SetSkillFaceHold(aB)end),onInputComplete=function(aB)ad.SaveNow()af.Notify(
'Path Record',('Saved Skill Face Hold = %ss'):format(tostring(aB)),2)end},
'Slider_PR_SkillFaceHold'))ae.PatchSliderLoadCallback(aA:Slider({Name=
'Skill Double Click Delay (s)',Default=ac.GetDoubleClickDelay(),Minimum=0.005,
Maximum=0.1,DisplayMethod='Value',Precision=3,Callback=ad.Wrap(function(aB)ac.
SetDoubleClickDelay(aB)end),onInputComplete=function(aB)ad.SaveNow()af.Notify(
'Path Record',('Saved Double Click Delay = %ss'):format(tostring(aB)),2)end},
'Slider_PR_DoubleClickDelay'))ae.PatchSliderLoadCallback(aA:Slider({Name=
'Start / Finish Pause Time (s)',Default=ac.GetStartPauseTime(),Minimum=0,Maximum
=3,DisplayMethod='Value',Precision=2,Callback=ad.Wrap(function(aB)ac.
SetStartPauseTime(aB)end),onInputComplete=function(aB)ad.SaveNow()af.Notify(
'Path Record',('Saved Start / Finish Pause Time = %ss'):format(tostring(aB)),2)
end},'Slider_PR_StartPauseTime'))local aB=ai:Section{Side='Left'}aB:Header{Name=
'Macro Storage'}ao=ae.PatchDropdownRestore(aB:Dropdown{Name='Map Recording',
Options={'None'},Default=1,Required=true,Callback=function(aC)local aD=ac.
GetStatus()if ap then ap(aD)end if aq then aq(aD)end end},false)local aC,aD,aE,
aF,aG,aH=aB:Button{Name='Delete Selected Map',Callback=ad.Wrap(function()local
aC=ar()if aC and#aC>0 then ac.RemoveMap(aC)end end)},aB:Button{Name=
'Reload Macros (EsclipseHub/DQMacro)',Callback=function()ac.ReloadFromDisk()af.
Notify('Path Record',
'\u{110}\u{e3} qu\u{e9}t v\u{e0} t\u{1ea3}i l\u{1ea1}i c\u{e1}c file macro t\u{1eeb} EsclipseHub/DQMacro/'
,2)end},false,'Clear All Recordings',
"<font color='rgb(255,80,80)'>Confirm Clear All?</font>",3 local aI=function()if
not aE then return end aE=false if clearTimer then task.cancel(clearTimer)
clearTimer=nil end pcall(function()clearBtn:UpdateName(aF)end)end local aJ,aK=aB
:Button{Name=aF,Callback=function()if not aE then aE=true if clearTimer then
task.cancel(clearTimer)end clearTimer=task.delay(aH,aI)pcall(function()clearBtn:
UpdateName(aG)end)return end aI()ac.ClearAll()end},ai:Section{Side='Right'}aK:
Header{Name='Status Monitor & Live HUD'}local aL,aM,aN,aO,aP,aQ=aK:Label{Text=
"State: <font color='rgb(160,160,160)'>Idle</font>"},aK:Label{Text=
"Progress: <font color='rgb(160,160,160)'>-</font>"},aK:Label{Text=
[[Room: <font color='rgb(160,160,160)'>-</font> | Boss: <font color='rgb(160,160,160)'>-</font>]]
},aK:Label{Text="Events: <font color='rgb(160,160,160)'>-</font>"},aK:Label{Text
="Macros: <font color='rgb(160,160,160)'>None</font>"},ai:Section{Side='Right'}
aQ:Header{Name='Path 3D Visualizer'}aQ:Label{Text=
"Visual t\u{1eeb}ng node \u{111}\u{1b0}\u{1edd}ng \u{111}i: <font color='rgb(255,90,90)'>\u{1f534} \u{110}\u{1ecf} khi Record</font> (real-time) | <font color='rgb(0,255,120)'>\u{1f7e2} Xanh l\u{e1} khi th\u{1b0}\u{1edd}ng</font> (xem / ph\u{e1}t macro)."
}local aR,aS,aT,aU=aQ:Toggle({Name='Show Path Nodes (3D Spheres)',Default=ac.
IsVisualEnabled(),Callback=ad.Wrap(function(aR)ac.SetVisualEnabled(aR)end)},
'Toggle_PR_VisualEnabled'),aQ:Toggle({Name='Connect Path Lines',Default=ac.
IsVisualShowLinesEnabled(),Callback=ad.Wrap(function(aR)ac.SetVisualShowLines(aR
)end)},'Toggle_PR_VisualShowLines'),aQ:Toggle({Name=
'Show Event Spheres & 3D Text',Default=ac.IsVisualShowEventsEnabled(),Callback=
ad.Wrap(function(aR)ac.SetVisualShowEvents(aR)end)},'Toggle_PR_VisualShowEvents'
),aQ:Toggle({Name='Show Skill Facing Rays',Default=ac.IsVisualShowFacingEnabled(
),Callback=ad.Wrap(function(aR)ac.SetVisualShowFacing(aR)end)},
'Toggle_PR_VisualShowFacing')ae.PatchSliderLoadCallback(aQ:Slider({Name=
'Sphere Node Size',Default=ac.GetVisualNodeRadius(),Minimum=0.1,Maximum=1.2,
DisplayMethod='Value',Precision=2,Callback=ad.Wrap(function(aV)ac.
SetVisualNodeRadius(aV)end),onInputComplete=function(aV)ad.SaveNow()end},
'Slider_PR_VisualNodeRadius'))aQ:Toggle({Name='Always On Top (X-Ray)',Default=ac
.IsVisualAlwaysOnTopEnabled(),Callback=ad.Wrap(function(aV)ac.
SetVisualAlwaysOnTop(aV)end)},'Toggle_PR_VisualAlwaysOnTop')local aV=ai:Section{
Side='Right'}aV:Header{Name='Skill Range Visual'}aV:Label{Text=
"V\u{f2}ng tr\u{f2}n quanh nh\u{e2}n v\u{1ead}t gi\u{fa}p \u{1b0}\u{1edb}c l\u{1b0}\u{1ee3}ng <font color='rgb(0,255,200)'>t\u{1ea7}m \u{111}\u{e1}nh / ph\u{1ea1}m vi AOE</font> c\u{1ee7}a skill \u{111}\u{1ec3} c\u{103}n g\u{f3}c v\u{e0} v\u{1ecb} tr\u{ed} x\u{1ea3} chi\u{ea}u khi record."
}local aW=aV:Toggle({Name='Show Range Circle',Default=ac.IsRangeVisualEnabled(),
Callback=ad.Wrap(function(aW)ac.SetRangeVisual(aW)end)},'Toggle_PR_RangeVisual')
ae.PatchSliderLoadCallback(aV:Slider({Name='Skill Range (Studs)',Default=ac.
GetRangeVisualRadius(),Minimum=5,Maximum=120,DisplayMethod='Value',Precision=1,
Callback=ad.Wrap(function(aX)ac.SetRangeVisualRadius(aX)end),onInputComplete=
function(aX)ad.SaveNow()end},'Slider_PR_RangeRadius'))aV:Toggle({Name=
'Fill Circle Area',Default=ac.IsRangeVisualFillEnabled(),Callback=ad.Wrap(
function(aX)ac.SetRangeVisualFill(aX)end)},'Toggle_PR_RangeFill')local aX,aY,aZ=
ac.GetRangeColorNames(),ac.GetSelectedCircleColor(),1 for a_,a0 in ipairs(aX)do
if a0==aY then aZ=a_ break end end ae.PatchDropdownRestore(aV:Dropdown({Name=
'Circle Color',Options=aX,Default=aZ,Required=true,Callback=ad.Wrap(function(a_)
ac.SetCircleColor(a_)end)},'Dropdown_PR_CircleColor'),false)local a_,a0,a1=aV:
Toggle({Name='Highlight In-Range Enemies (Glow)',Default=ac.
IsHighlightInRangeEnabled(),Callback=ad.Wrap(function(a_)ac.SetHighlightInRange(
a_)end)},'Toggle_PR_HighlightInRange'),ac.GetSelectedHighlightColor(),2 for a2,
a3 in ipairs(aX)do if a3==a0 then a1=a2 break end end ae.PatchDropdownRestore(aV
:Dropdown({Name='Enemy Highlight Color',Options=aX,Default=a1,Required=true,
Callback=ad.Wrap(function(a2)ac.SetHighlightColor(a2)end)},
'Dropdown_PR_HighlightColor'),false)local a2=function(a2)a2=math.clamp(a2 or 0,0
,100)local a3=10 local a4=math.round((a2/100)*a3)local a5=a3-a4 local a6=string.
rep('\u{25a0}',a4)..string.rep('\u{25a1}',a5)return(
"<font color='rgb(0,255,180)'>%s</font> <b>%d%%</b>"):format(a6,a2)end aq=
function(a3)if not an then pcall(function()if as and as.GetState and as:
GetState()~=a3.recording then ak=true as:UpdateState(a3.recording)ak=false end
end)end pcall(function()local a4=ac.IsAutoPlayWanted()if av and av.GetState and
av:GetState()~=a4 then al=true av:UpdateState(a4)al=false end end)pcall(function
()local a4=a3.map local a5=(a4 and#a4>0)and a4 or ar()local a6=a5 and ac.
GetMapMode(a5)=='full'or false if au and au.GetState and au:GetState()~=a6 then
am=true au:UpdateState(a6)am=false end end)pcall(function()if aR and aR.GetState
and aR:GetState()~=ac.IsVisualEnabled()then aR:UpdateState(ac.IsVisualEnabled())
end end)pcall(function()if aS and aS.GetState and aS:GetState()~=ac.
IsVisualShowLinesEnabled()then aS:UpdateState(ac.IsVisualShowLinesEnabled())end
end)pcall(function()if aT and aT.GetState and aT:GetState()~=ac.
IsVisualShowEventsEnabled()then aT:UpdateState(ac.IsVisualShowEventsEnabled())
end end)pcall(function()if aU and aU.GetState and aU:GetState()~=ac.
IsVisualShowFacingEnabled()then aU:UpdateState(ac.IsVisualShowFacingEnabled())
end end)pcall(function()if aW and aW.GetState and aW:GetState()~=ac.
IsRangeVisualEnabled()then aW:UpdateState(ac.IsRangeVisualEnabled())end end)
pcall(function()if a_ and a_.GetState and a_:GetState()~=ac.
IsHighlightInRangeEnabled()then a_:UpdateState(ac.IsHighlightInRangeEnabled())
end end)end local a3,a4=function(a3)local a4={}for a5,a6 in ipairs(a3)do a4[#a4+
1]=('Map [%s] (%d rooms)'):format(a6.map,a6.roomCount)end if#a4==0 then a4[1]=
'None'end return a4 end local a5=function(a5)local a6=a3(a5)local a7=table.
concat(a6,'|')if a7==a4 then return end a4=a7 local a8 for a9,b in pairs(ao:
GetOptions())do if b then a8=a9 break end end pcall(function()ao:ClearOptions()
end)pcall(function()ao:InsertOptions(a6)end)local a9=a8 if not a9 or not ao:
IsOption(a9)then a9=a6[1]end pcall(function()ao:UpdateSelection(a9)end)end ap=
function(a6)local a7,a8=false,a6.map local a9=(a8 and#a8>0)and a8 or ar()if a9
then a7=ac.GetMapMode(a9)=='full'end local b if a6.recording then b=
"<font color='rgb(255,90,90)'>Recording...</font>"elseif a6.playing then b=
"<font color='rgb(0,230,255)'>Playing</font>"elseif a6.resume then b=
"<font color='rgb(255,200,0)'>Waiting (auto-resume)</font>"elseif a6.
autoPlayWanted then if a6.inLobby then b=
"<font color='rgb(100,220,100)'>Armed (Lobby)</font>"elseif not a6.map or#a6.map
==0 then b="<font color='rgb(100,220,100)'>Armed (Loading...)</font>"elseif a6.
boss and not a7 then b=
"<font color='rgb(255,160,50)'>Waiting (Boss Room)</font>"else b=
[[<font color='rgb(100,220,100)'>Armed (Waiting for Room)</font>]]end else b=
"<font color='rgb(160,160,160)'>Idle</font>"end pcall(function()aL:UpdateName(
'State: '..b)end)if a6.playing then local ba,bb=a2(a6.progressPercent),(
'(%.1f / %.1f studs)'):format(a6.progressStuds or 0,a6.totalStuds or 0)pcall(
function()aM:UpdateName('Progress: '..ba..' '..bb)end)elseif a6.recording then
pcall(function()aM:UpdateName(
[[Progress: <font color='rgb(255,90,90)'>Recording Segment...</font> (]]..
tostring(a6.pointCount or 0)..' pts)')end)else pcall(function()aM:UpdateName
"Progress: <font color='rgb(160,160,160)'>-</font>"end)end local ba,bb=a7 and
"<font color='rgb(255,140,255)'>FULL</font>"or
"<font color='rgb(120,200,255)'>NORMAL</font>",a9 and(' (map ['..a9..'])')or
' (theo map)'pcall(function()at:UpdateName('Record Mode'..bb..': '..ba)end)local
bc if a6.boss then if a7 then bc=
"<font color='rgb(255,140,255)'>YES (FULL path)</font>"else bc=
"<font color='rgb(255,80,80)'>YES (d\u{f9}ng Hazard Scanner)</font>"end else bc=
"<font color='rgb(0,255,120)'>No</font>"end local bd,be=a6.room and a6.room>0
and("<font color='rgb(0,255,255)'>room %d</font>"):format(a6.room)or
"<font color='rgb(160,160,160)'>-</font>",a6.map and#a6.map>0 and(
"<font color='rgb(150,255,150)'>%s</font>"):format(a6.map)or
"<font color='rgb(160,160,160)'>-</font>"pcall(function()aN:UpdateName('Map: '..
be..' | Room: '..bd..' | Boss: '..bc)end)if a6.recording then local bf=a6.phase
or 1 pcall(function()aO:UpdateName((
[[Events: <font color='rgb(255,170,60)'>%d pts</font> | <font color='rgb(255,90,220)'>%d skills</font> | <font color='rgb(255,215,0)'>%d pauses</font> (Phase %d)]]
):format(a6.pointCount or 0,a6.skillCount or 0,a6.dwellCount or 0,bf))end)elseif
a6.playing then local bf=a6.phase or 1 pcall(function()aO:UpdateName((
"Playing: <font color='rgb(0,230,255)'>Phase %d</font>"):format(bf))end)else
pcall(function()aO:UpdateName"Events: <font color='rgb(160,160,160)'>-</font>"
end)end local bf=ac.GetMaps()if#bf==0 then pcall(function()aP:UpdateName
"Macros: <font color='rgb(160,160,160)'>None</font>"end)else local bg={}for bh,
bi in ipairs(bf)do local bj,bk=bi.bossCount and bi.bossCount>0 and('+%db'):
format(bi.bossCount)or'',bi.phaseCount and bi.phaseCount>bi.roomCount and(
'/%dph'):format(bi.phaseCount)or''bg[#bg+1]=('%s(%dr%s/%dp%s)'):format(bi.map,bi
.roomCount,bk,bi.pointCount,bj)end pcall(function()aP:UpdateName(
"Macros: <font color='rgb(150,255,150)'>"..table.concat(bg,', ')..'</font>')end)
end a5(bf)end local a6,a7=ac.OnStatusChanged(function(a6)ap(a6)aq(a6)end),0
local a8=ag.Heartbeat:Connect(function()local a8=os.clock()if a8-a7<0.35 then
return end a7=a8 local a9=ac.GetStatus()ap(a9)aq(a9)end)ab.Register(function()if
a8 then a8:Disconnect()a8=nil end if a6 then a6()a6=nil end end)ap(ac.GetStatus(
))aq(ac.GetStatus())end