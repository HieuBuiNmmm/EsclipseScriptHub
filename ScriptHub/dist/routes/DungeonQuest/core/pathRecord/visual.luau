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
end table.clear(b.callbacks)end function b.IsActive()return not b.cleaned end b.
OnCleanup=b.Register return b end function a.c()local b,c=a.load'a',a.load'b'
local d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z=b.player,0.05,
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
pcall(function()aq:Enable()end)end N()end)return h end function a.d()local aa={
Options={},Folder='Maclib',contextData={},GetService=function(aa)return cloneref
and cloneref(game:GetService(aa))or game:GetService(aa)end}local ab,ac,ad,ae,af,
ag,ah=aa.GetService'TweenService',aa.GetService'RunService',aa.GetService
'HttpService',aa.GetService'ContentProvider',aa.GetService'UserInputService',aa.
GetService'Lighting',aa.GetService'Players'local ai,aj,ak,al,am,an,ao,ap,aq,b,c=
ac:IsStudio(),ah.LocalPlayer,{},0,false,{interFont='rbxassetid://12187365364',
userInfoBlurred='rbxassetid://18824089198',toggleBackground=
'rbxassetid://18772190202',togglerHead='rbxassetid://18772309008',buttonImage=
'rbxassetid://10709791437',searchIcon='rbxassetid://86737463322606',colorWheel=
'rbxassetid://2849458409',colorTarget='rbxassetid://73265255323268',grid=
'rbxassetid://121484455191370',globe='rbxassetid://108952102602834',transform=
'rbxassetid://90336395745819',dropdown='rbxassetid://18865373378',sliderbar=
'rbxassetid://18772615246',sliderhead='rbxassetid://18772834246'},function()
pcall(function()local ai=setthreadidentity or set_thread_identity or setidentity
or(syn and syn.set_thread_identity)if ai then local aj=pcall(ai,7)if not aj then
pcall(ai,8)end end end)end aa.Elevate=ao local d,e=function()ao()local d=
Instance.new'ScreenGui'd.ScreenInsets=Enum.ScreenInsets.None d.ResetOnSpawn=
false d.ZIndexBehavior=Enum.ZIndexBehavior.Sibling d.DisplayOrder=2147483647
local e=ac:IsStudio()and aj:FindFirstChild'PlayerGui'or(gethui and gethui())or(
cloneref and cloneref(aa.GetService'CoreGui')or aa.GetService'CoreGui')d.Parent=
e return d end,function(d,e,f)ao()local g,h=pcall(ab.Create,ab,d,e,f)if g and h
then return h end if f and typeof(d)=='Instance'then for i,j in pairs(f)do
pcall(function()d[i]=j end)end end return{Play=function()end,Cancel=function()
end,Pause=function()end,Completed={Wait=function()end}}end function aa:Window(f)
local g={Settings=f}if f.AcrylicBlur~=nil then aq=f.AcrylicBlur else aq=true end
local h,i=d(),Instance.new'Frame'i.Name='Notifications'i.BackgroundColor3=Color3
.fromRGB(255,255,255)i.BackgroundTransparency=1 i.BorderColor3=Color3.fromRGB(0,
0,0)i.BorderSizePixel=0 i.Size=UDim2.fromScale(1,1)i.Parent=h i.ZIndex=2 local j
=Instance.new'UIListLayout'j.Name='NotificationsUIListLayout'j.Padding=UDim.new(
0,10)j.HorizontalAlignment=Enum.HorizontalAlignment.Right j.SortOrder=Enum.
SortOrder.LayoutOrder j.VerticalAlignment=Enum.VerticalAlignment.Bottom j.Parent
=i local k=Instance.new'UIPadding'k.Name='NotificationsUIPadding'k.PaddingBottom
=UDim.new(0,10)k.PaddingLeft=UDim.new(0,10)k.PaddingRight=UDim.new(0,10)k.
PaddingTop=UDim.new(0,10)k.Parent=i local l=Instance.new'Frame'l.Name='Base'l.
AnchorPoint=Vector2.new(0.5,0.5)l.BackgroundColor3=Color3.fromRGB(15,15,15)l.
BackgroundTransparency=f.AcrylicBlur and 0.05 or 0 l.BorderColor3=Color3.
fromRGB(0,0,0)l.BorderSizePixel=0 l.Position=UDim2.fromScale(0.5,0.5)l.Size=f.
Size or UDim2.fromOffset(868,650)local m=Instance.new'UIScale'm.Name=
'BaseUIScale'm.Parent=l local n=Instance.new'UICorner'n.Name='BaseUICorner'n.
CornerRadius=UDim.new(0,10)n.Parent=l local o=Instance.new'UIStroke'o.Name=
'BaseUIStroke'o.ApplyStrokeMode=Enum.ApplyStrokeMode.Border o.Color=Color3.
fromRGB(255,255,255)o.Transparency=0.9 o.Parent=l local p=Instance.new'Frame'p.
Name='Sidebar'p.BackgroundColor3=Color3.fromRGB(255,255,255)p.
BackgroundTransparency=1 p.BorderColor3=Color3.fromRGB(0,0,0)p.BorderSizePixel=0
p.Position=UDim2.fromScale(-3.5199999999999996E-8,4.69e-8)p.Size=f.SidebarWidth
and UDim2.new(0,f.SidebarWidth,1,0)or UDim2.fromScale(0.325,1)local q=Instance.
new'Frame'q.Name='Divider'q.AnchorPoint=Vector2.new(1,0)q.BackgroundColor3=
Color3.fromRGB(255,255,255)q.BackgroundTransparency=0.9 q.BorderColor3=Color3.
fromRGB(0,0,0)q.BorderSizePixel=0 q.Position=UDim2.fromScale(1,0)q.Size=UDim2.
new(0,1,1,0)q.Parent=p local r=Instance.new'TextButton'r.Name='DividerInteract'r
.AnchorPoint=Vector2.new(0.5,0)r.BackgroundColor3=Color3.fromRGB(255,255,255)r.
BackgroundTransparency=1 r.BorderColor3=Color3.fromRGB(0,0,0)r.BorderSizePixel=0
r.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'r.Position=
UDim2.fromScale(0.5,0)r.Size=UDim2.new(1,6,1,0)r.Text=''r.TextColor3=Color3.
fromRGB(0,0,0)r.TextSize=14 r.Parent=q local s=Instance.new'Frame's.Name=
'WindowControls's.BackgroundColor3=Color3.fromRGB(255,255,255)s.
BackgroundTransparency=1 s.BorderColor3=Color3.fromRGB(0,0,0)s.BorderSizePixel=0
s.Size=UDim2.new(1,0,0,31)local t=Instance.new'Frame't.Name='Controls't.
BackgroundColor3=Color3.fromRGB(119,174,94)t.BackgroundTransparency=1 t.
BorderColor3=Color3.fromRGB(0,0,0)t.BorderSizePixel=0 t.Size=UDim2.fromScale(1,1
)local u=Instance.new'UIListLayout'u.Name='UIListLayout'u.Padding=UDim.new(0,5)u
.FillDirection=Enum.FillDirection.Horizontal u.SortOrder=Enum.SortOrder.
LayoutOrder u.VerticalAlignment=Enum.VerticalAlignment.Center u.Parent=t local v
=Instance.new'UIPadding'v.Name='UIPadding'v.PaddingLeft=UDim.new(0,11)v.Parent=t
local w,x={sizes={enabled=UDim2.fromOffset(8,8),disabled=UDim2.fromOffset(7,7)},
transparencies={enabled=0,disabled=1},strokeTransparency=0.9},Instance.new
'UIStroke'x.Name='BaseUIStroke'x.ApplyStrokeMode=Enum.ApplyStrokeMode.Border x.
Color=Color3.fromRGB(255,255,255)x.Transparency=w.strokeTransparency local y=
Instance.new'TextButton'y.Name='Exit'y.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'y.Text=''y.TextColor3=Color3.
fromRGB(0,0,0)y.TextSize=14 y.AutoButtonColor=false y.BackgroundColor3=Color3.
fromRGB(250,93,86)y.BorderColor3=Color3.fromRGB(0,0,0)y.BorderSizePixel=0 local
z=Instance.new'UICorner'z.Name='UICorner'z.CornerRadius=UDim.new(1,0)z.Parent=y
y.Parent=t local A=Instance.new'TextButton'A.Name='Minimize'A.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'A.Text=''A.TextColor3=Color3.
fromRGB(0,0,0)A.TextSize=14 A.AutoButtonColor=false A.BackgroundColor3=Color3.
fromRGB(252,190,57)A.BorderColor3=Color3.fromRGB(0,0,0)A.BorderSizePixel=0 A.
LayoutOrder=1 local B=Instance.new'UICorner'B.Name='UICorner'B.CornerRadius=UDim
.new(1,0)B.Parent=A A.Parent=t local C=Instance.new'TextButton'C.Name='Maximize'
C.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'C.Text=''C.
TextColor3=Color3.fromRGB(0,0,0)C.TextSize=14 C.AutoButtonColor=false C.
BackgroundColor3=Color3.fromRGB(119,174,94)C.BorderColor3=Color3.fromRGB(0,0,0)C
.BorderSizePixel=0 C.LayoutOrder=1 local D=Instance.new'UICorner'D.Name=
'UICorner'D.CornerRadius=UDim.new(1,0)D.Parent=C C.Parent=t local E=function(E,F
)local G,H=F and w.sizes.enabled or w.sizes.disabled,F and w.transparencies.
enabled or w.transparencies.disabled E.Size=G E.BackgroundTransparency=H E.
Active=F E.Interactable=F for I,J in ipairs(E:GetChildren())do if J:IsA
'UIStroke'then J.Transparency=H end end if not F then x:Clone().Parent=E end end
E(C,false)local F={y,A}for G,H in pairs(F)do local I,J=H.Name,true if f.
DisabledWindowControls and table.find(f.DisabledWindowControls,I)then J=false
end E(H,J)end t.Parent=s local G=Instance.new'Frame'G.Name='Divider'G.
AnchorPoint=Vector2.new(0,1)G.BackgroundColor3=Color3.fromRGB(255,255,255)G.
BackgroundTransparency=0.9 G.BorderColor3=Color3.fromRGB(0,0,0)G.BorderSizePixel
=0 G.Position=UDim2.fromScale(0,1)G.Size=UDim2.new(1,0,0,1)G.Parent=s s.Parent=p
local H=Instance.new'Frame'H.Name='Information'H.BackgroundColor3=Color3.
fromRGB(255,255,255)H.BackgroundTransparency=1 H.BorderColor3=Color3.fromRGB(0,0
,0)H.BorderSizePixel=0 H.Position=UDim2.fromOffset(0,31)H.Size=UDim2.new(1,0,0,
60)local I=Instance.new'Frame'I.Name='Divider'I.AnchorPoint=Vector2.new(0,1)I.
BackgroundColor3=Color3.fromRGB(255,255,255)I.BackgroundTransparency=0.9 I.
BorderColor3=Color3.fromRGB(0,0,0)I.BorderSizePixel=0 I.Position=UDim2.
fromScale(0,1)I.Size=UDim2.new(1,0,0,1)I.Parent=H local J=Instance.new'Frame'J.
Name='InformationHolder'J.BackgroundColor3=Color3.fromRGB(255,255,255)J.
BackgroundTransparency=1 J.BorderColor3=Color3.fromRGB(0,0,0)J.BorderSizePixel=0
J.Size=UDim2.fromScale(1,1)local K=Instance.new'UIPadding'K.Name=
'InformationHolderUIPadding'K.PaddingBottom=UDim.new(0,10)K.PaddingLeft=UDim.
new(0,23)K.PaddingRight=UDim.new(0,22)K.PaddingTop=UDim.new(0,10)K.Parent=J
local L=Instance.new'ImageButton'L.Name='GlobalSettingsButton'L.Image=an.globe L
.ImageTransparency=0.5 L.AnchorPoint=Vector2.new(1,0.5)L.BackgroundColor3=Color3
.fromRGB(255,255,255)L.BackgroundTransparency=1 L.BorderColor3=Color3.fromRGB(0,
0,0)L.BorderSizePixel=0 L.Position=UDim2.fromScale(1,0.5)L.Size=UDim2.
fromOffset(16,16)L.Parent=J local M=function(M)if M=='Default'then e(L,TweenInfo
.new(0.2,Enum.EasingStyle.Sine),{ImageTransparency=0.5}):Play()elseif M=='Hover'
then e(L,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{ImageTransparency=0.3}):Play(
)end end L.MouseEnter:Connect(function()M'Hover'end)L.MouseLeave:Connect(
function()M'Default'end)local N=Instance.new'Frame'N.Name='TitleFrame'N.
BackgroundColor3=Color3.fromRGB(255,255,255)N.BackgroundTransparency=1 N.
BorderColor3=Color3.fromRGB(0,0,0)N.BorderSizePixel=0 N.Size=UDim2.fromScale(1,1
)local O=Instance.new'TextLabel'O.Name='Title'O.FontFace=Font.new(an.interFont,
Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)O.Text=f.Title O.TextColor3=
Color3.fromRGB(255,255,255)O.RichText=true O.TextSize=18 O.TextTransparency=0.1
O.TextTruncate=Enum.TextTruncate.SplitWord O.TextXAlignment=Enum.TextXAlignment.
Left O.TextYAlignment=Enum.TextYAlignment.Top O.AutomaticSize=Enum.AutomaticSize
.Y O.BackgroundColor3=Color3.fromRGB(255,255,255)O.BackgroundTransparency=1 O.
BorderColor3=Color3.fromRGB(0,0,0)O.BorderSizePixel=0 O.Size=UDim2.new(1,-20,0,0
)O.Parent=N local P=Instance.new'TextLabel'P.Name='Subtitle'P.FontFace=Font.new(
an.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)P.RichText=true P.Text
=f.Subtitle P.RichText=true P.TextColor3=Color3.fromRGB(255,255,255)P.TextSize=
12 P.TextTransparency=0.7 P.TextTruncate=Enum.TextTruncate.SplitWord P.
TextXAlignment=Enum.TextXAlignment.Left P.TextYAlignment=Enum.TextYAlignment.Top
P.AutomaticSize=Enum.AutomaticSize.Y P.BackgroundColor3=Color3.fromRGB(255,255,
255)P.BackgroundTransparency=1 P.BorderColor3=Color3.fromRGB(0,0,0)P.
BorderSizePixel=0 P.LayoutOrder=1 P.Size=UDim2.new(1,-20,0,0)P.Parent=N local Q=
Instance.new'UIListLayout'Q.Name='TitleFrameUIListLayout'Q.Padding=UDim.new(0,3)
Q.SortOrder=Enum.SortOrder.LayoutOrder Q.VerticalAlignment=Enum.
VerticalAlignment.Center Q.Parent=N N.Parent=J J.Parent=H H.Parent=p local R=
Instance.new'Frame'R.Name='SidebarGroup'R.BackgroundColor3=Color3.fromRGB(255,
255,255)R.BackgroundTransparency=1 R.BorderColor3=Color3.fromRGB(0,0,0)R.
BorderSizePixel=0 R.Position=UDim2.fromOffset(0,91)R.Size=UDim2.new(1,0,1,-91)
local S=Instance.new'Frame'S.Name='UserInfo'S.AnchorPoint=Vector2.new(0,1)S.
BackgroundColor3=Color3.fromRGB(255,255,255)S.BackgroundTransparency=1 S.
BorderColor3=Color3.fromRGB(0,0,0)S.BorderSizePixel=0 S.Position=UDim2.
fromScale(0,1)S.Size=UDim2.new(1,0,0,107)local T=Instance.new'Frame'T.Name=
'InformationGroup'T.BackgroundColor3=Color3.fromRGB(255,255,255)T.
BackgroundTransparency=1 T.BorderColor3=Color3.fromRGB(0,0,0)T.BorderSizePixel=0
T.Size=UDim2.fromScale(1,1)local U=Instance.new'UIPadding'U.Name=
'InformationGroupUIPadding'U.PaddingBottom=UDim.new(0,17)U.PaddingLeft=UDim.new(
0,25)U.Parent=T local V=Instance.new'UIListLayout'V.Name=
'InformationGroupUIListLayout'V.FillDirection=Enum.FillDirection.Horizontal V.
SortOrder=Enum.SortOrder.LayoutOrder V.VerticalAlignment=Enum.VerticalAlignment.
Center V.Parent=T local W,X,Y=aj.UserId,Enum.ThumbnailType.AvatarBust,Enum.
ThumbnailSize.Size48x48 local Z,_=ah:GetUserThumbnailAsync(W,X,Y)local ar=
Instance.new'ImageLabel'ar.Name='Headshot'ar.BackgroundColor3=Color3.fromRGB(255
,255,255)ar.BackgroundTransparency=1 ar.BorderColor3=Color3.fromRGB(0,0,0)ar.
BorderSizePixel=0 ar.Size=UDim2.fromOffset(32,32)ar.Image=(_ and Z)or
'rbxassetid://0'local as=Instance.new'UICorner'as.Name='UICorner'as.CornerRadius
=UDim.new(1,0)as.Parent=ar local at=Instance.new'UIStroke'at.Name='BaseUIStroke'
at.ApplyStrokeMode=Enum.ApplyStrokeMode.Border at.Color=Color3.fromRGB(255,255,
255)at.Transparency=0.9 at.Parent=ar ar.Parent=T local au=Instance.new'Frame'au.
Name='UserAndDisplayFrame'au.BackgroundColor3=Color3.fromRGB(255,255,255)au.
BackgroundTransparency=1 au.BorderColor3=Color3.fromRGB(0,0,0)au.BorderSizePixel
=0 au.LayoutOrder=1 au.Size=UDim2.new(1,-42,0,32)local av=Instance.new
'TextLabel'av.Name='DisplayName'av.FontFace=Font.new(an.interFont,Enum.
FontWeight.SemiBold,Enum.FontStyle.Normal)av.Text=aj.DisplayName av.TextColor3=
Color3.fromRGB(255,255,255)av.TextSize=13 av.TextTransparency=0.1 av.
TextTruncate=Enum.TextTruncate.SplitWord av.TextXAlignment=Enum.TextXAlignment.
Left av.TextYAlignment=Enum.TextYAlignment.Top av.AutomaticSize=Enum.
AutomaticSize.XY av.BackgroundColor3=Color3.fromRGB(255,255,255)av.
BackgroundTransparency=1 av.BorderColor3=Color3.fromRGB(0,0,0)av.BorderSizePixel
=0 av.Parent=au av.Size=UDim2.fromScale(1,0)local aw=Instance.new'UIPadding'aw.
Name='UserAndDisplayFrameUIPadding'aw.PaddingLeft=UDim.new(0,8)aw.PaddingTop=
UDim.new(0,3)aw.Parent=au local ax=Instance.new'UIListLayout'ax.Name=
'UserAndDisplayFrameUIListLayout'ax.Padding=UDim.new(0,1)ax.SortOrder=Enum.
SortOrder.LayoutOrder ax.Parent=au local ay=Instance.new'TextLabel'ay.Name=
'Username'ay.FontFace=Font.new(an.interFont,Enum.FontWeight.SemiBold,Enum.
FontStyle.Normal)ay.Text='@'..aj.Name ay.TextColor3=Color3.fromRGB(255,255,255)
ay.TextSize=12 ay.TextTransparency=0.7 ay.TextTruncate=Enum.TextTruncate.
SplitWord ay.TextXAlignment=Enum.TextXAlignment.Left ay.TextYAlignment=Enum.
TextYAlignment.Top ay.AutomaticSize=Enum.AutomaticSize.XY ay.BackgroundColor3=
Color3.fromRGB(255,255,255)ay.BackgroundTransparency=1 ay.BorderColor3=Color3.
fromRGB(0,0,0)ay.BorderSizePixel=0 ay.LayoutOrder=1 ay.Parent=au ay.Size=UDim2.
fromScale(1,0)au.Parent=T T.Parent=S local az=Instance.new'UIPadding'az.Name=
'UserInfoUIPadding'az.PaddingLeft=UDim.new(0,10)az.PaddingRight=UDim.new(0,10)az
.Parent=S S.Parent=R local aA=Instance.new'UIPadding'aA.Name=
'SidebarGroupUIPadding'aA.PaddingLeft=UDim.new(0,10)aA.PaddingRight=UDim.new(0,
10)aA.PaddingTop=UDim.new(0,31)aA.Parent=R local aB=Instance.new'Frame'aB.Name=
'TabSwitchers'aB.BackgroundColor3=Color3.fromRGB(255,255,255)aB.
BackgroundTransparency=1 aB.BorderColor3=Color3.fromRGB(0,0,0)aB.BorderSizePixel
=0 aB.Size=UDim2.new(1,0,1,-107)local aC=Instance.new'ScrollingFrame'aC.Name=
'TabSwitchersScrollingFrame'aC.AutomaticCanvasSize=Enum.AutomaticSize.Y aC.
BottomImage=''aC.CanvasSize=UDim2.new()aC.ScrollBarImageTransparency=0.8 aC.
ScrollBarThickness=1 aC.TopImage=''aC.BackgroundColor3=Color3.fromRGB(255,255,
255)aC.BackgroundTransparency=1 aC.BorderColor3=Color3.fromRGB(0,0,0)aC.
BorderSizePixel=0 aC.Size=UDim2.fromScale(1,1)local aD=Instance.new
'UIListLayout'aD.Name='TabSwitchersScrollingFrameUIListLayout'aD.Padding=UDim.
new(0,17)aD.SortOrder=Enum.SortOrder.LayoutOrder aD.Parent=aC local aE=Instance.
new'UIPadding'aE.Name='TabSwitchersScrollingFrameUIPadding'aE.PaddingTop=UDim.
new(0,2)aE.Parent=aC aC.Parent=aB aB.Parent=R R.Parent=p p.Parent=l local aF=
Instance.new'Frame'aF.Name='Content'aF.AnchorPoint=Vector2.new(1,0)aF.
BackgroundColor3=Color3.fromRGB(255,255,255)aF.BackgroundTransparency=1 aF.
BorderColor3=Color3.fromRGB(0,0,0)aF.BorderSizePixel=0 aF.Position=UDim2.
fromScale(1,4.69e-8)aF.Size=UDim2.new(0,(l.AbsoluteSize.X-p.AbsoluteSize.X),1,0)
local aG,aH,aI,aJ,aK,aL=false,p.AbsoluteSize.X,20,107 local aM,aN=l.AbsoluteSize
.X-aJ,{DefaultTransparency=0.9,HoverTransparency=0.85,EasingStyle=Enum.
EasingStyle.Sine}local aO=function(aO)e(q,TweenInfo.new(0.2,aN.EasingStyle),{
BackgroundTransparency=aO=='Idle'and aN.DefaultTransparency or aN.
HoverTransparency}):Play()end r.MouseEnter:Connect(function()aO'Hover'end)r.
MouseLeave:Connect(function()aO'Idle'end)r.MouseButton1Down:Connect(function()aG
=true aK=af:GetMouseLocation().X aL=p.AbsoluteSize.X end)af.InputEnded:Connect(
function(aP)if aP.UserInputType==Enum.UserInputType.MouseButton1 then aG=false
end end)af.InputChanged:Connect(function(aP)if aG and aP.UserInputType==Enum.
UserInputType.MouseMovement then local aQ=af:GetMouseLocation().X-aK local aR=aL
+aQ if math.abs(aR-aH)<aI then aR=aH else aR=math.clamp(aR,aJ,aM)end p.Size=
UDim2.new(0,aR,1,0)aF.Size=UDim2.new(0,l.AbsoluteSize.X-aR,1,0)end end)local aP=
Instance.new'Frame'aP.Name='Topbar'aP.BackgroundColor3=Color3.fromRGB(255,255,
255)aP.BackgroundTransparency=1 aP.BorderColor3=Color3.fromRGB(0,0,0)aP.
BorderSizePixel=0 aP.Size=UDim2.new(1,0,0,63)local aQ=Instance.new'Frame'aQ.Name
='Divider'aQ.AnchorPoint=Vector2.new(0,1)aQ.BackgroundColor3=Color3.fromRGB(255,
255,255)aQ.BackgroundTransparency=0.9 aQ.BorderColor3=Color3.fromRGB(0,0,0)aQ.
BorderSizePixel=0 aQ.Position=UDim2.fromScale(0,1)aQ.Size=UDim2.new(1,0,0,1)aQ.
Parent=aP local aR=Instance.new'Frame'aR.Name='Elements'aR.BackgroundColor3=
Color3.fromRGB(255,255,255)aR.BackgroundTransparency=1 aR.BorderColor3=Color3.
fromRGB(0,0,0)aR.BorderSizePixel=0 aR.Size=UDim2.fromScale(1,1)local aS=Instance
.new'UIPadding'aS.Name='UIPadding'aS.PaddingLeft=UDim.new(0,20)aS.PaddingRight=
UDim.new(0,20)aS.Parent=aR local aT=Instance.new'ImageButton'aT.Name='MoveIcon'
aT.Image=an.transform aT.ImageTransparency=0.7 aT.AnchorPoint=Vector2.new(1,0.5)
aT.BackgroundColor3=Color3.fromRGB(255,255,255)aT.BackgroundTransparency=1 aT.
BorderColor3=Color3.fromRGB(0,0,0)aT.BorderSizePixel=0 aT.Position=UDim2.
fromScale(1,0.5)aT.Size=UDim2.fromOffset(15,15)aT.Parent=aR aT.Visible=not f.
DragStyle or f.DragStyle==1 local aU=Instance.new'TextButton'aU.Name='Interact'
aU.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'aU.Text=''aU.
TextColor3=Color3.fromRGB(0,0,0)aU.TextSize=14 aU.AnchorPoint=Vector2.new(0.5,
0.5)aU.BackgroundColor3=Color3.fromRGB(255,255,255)aU.BackgroundTransparency=1
aU.BorderColor3=Color3.fromRGB(0,0,0)aU.BorderSizePixel=0 aU.Position=UDim2.
fromScale(0.5,0.5)aU.Size=UDim2.fromOffset(40,40)aU.Parent=aT local aV=function(
aV)if aV=='Default'then e(aT,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
ImageTransparency=0.7}):Play()elseif aV=='Hover'then e(aT,TweenInfo.new(0.2,Enum
.EasingStyle.Sine),{ImageTransparency=0.4}):Play()end end aU.MouseEnter:Connect(
function()aV'Hover'end)aU.MouseLeave:Connect(function()aV'Default'end)local aW,
aX,aY,aZ=false local a_,a0,a1=function(a_)local a0=a_.Position-aY l.Position=
UDim2.new(aZ.X.Scale,aZ.X.Offset+a0.X,aZ.Y.Scale,aZ.Y.Offset+a0.Y)end,function(
a_)if a_.UserInputType==Enum.UserInputType.MouseButton1 or a_.UserInputType==
Enum.UserInputType.Touch then aW=true aY=a_.Position aZ=l.Position a_.Changed:
Connect(function()if a_.UserInputState==Enum.UserInputState.End then aW=false
end end)end end,function(a_)if aW and(a_.UserInputType==Enum.UserInputType.
MouseMovement or a_.UserInputType==Enum.UserInputType.Touch)then aX=a_ end end
if not f.DragStyle or f.DragStyle==1 then aU.InputBegan:Connect(function(a2)if
a2.UserInputType==Enum.UserInputType.MouseButton1 or a2.UserInputType==Enum.
UserInputType.Touch then a0(a2)end end)aU.InputChanged:Connect(a1)af.
InputChanged:Connect(function(a2)if a2==aX and aW then a_(a2)end end)aU.
InputEnded:Connect(function(a2)if a2.UserInputType==Enum.UserInputType.
MouseButton1 or a2.UserInputType==Enum.UserInputType.Touch then aW=false end end
)elseif f.DragStyle==2 then l.InputBegan:Connect(function(a2)if a2.UserInputType
==Enum.UserInputType.MouseButton1 or a2.UserInputType==Enum.UserInputType.Touch
then a0(a2)end end)l.InputChanged:Connect(a1)af.InputChanged:Connect(function(a2
)if a2==aX and aW then a_(a2)end end)l.InputEnded:Connect(function(a2)if a2.
UserInputType==Enum.UserInputType.MouseButton1 or a2.UserInputType==Enum.
UserInputType.Touch then aW=false end end)end local a2=Instance.new'TextLabel'a2
.Name='CurrentTab'a2.FontFace=Font.new(an.interFont)a2.RichText=true a2.Text=''
a2.RichText=true a2.TextColor3=Color3.fromRGB(255,255,255)a2.TextSize=15 a2.
TextTransparency=0.5 a2.TextTruncate=Enum.TextTruncate.SplitWord a2.
TextXAlignment=Enum.TextXAlignment.Left a2.TextYAlignment=Enum.TextYAlignment.
Top a2.AnchorPoint=Vector2.new(0,0.5)a2.AutomaticSize=Enum.AutomaticSize.Y a2.
BackgroundColor3=Color3.fromRGB(255,255,255)a2.BackgroundTransparency=1 a2.
BorderColor3=Color3.fromRGB(0,0,0)a2.BorderSizePixel=0 a2.Position=UDim2.
fromScale(0,0.5)a2.Size=UDim2.fromScale(0.9,0)a2.Parent=aR aR.Parent=aP aP.
Parent=aF aF.Parent=l local a3=Instance.new'Frame'a3.Name='GlobalSettings'a3.
AutomaticSize=Enum.AutomaticSize.XY a3.BackgroundColor3=Color3.fromRGB(15,15,15)
a3.BorderColor3=Color3.fromRGB(0,0,0)a3.BorderSizePixel=0 a3.Position=UDim2.
fromScale(0.298,0.104)local a4=Instance.new'UIStroke'a4.Name=
'GlobalSettingsUIStroke'a4.ApplyStrokeMode=Enum.ApplyStrokeMode.Border a4.Color=
Color3.fromRGB(255,255,255)a4.Transparency=0.9 a4.Parent=a3 local a5=Instance.
new'UICorner'a5.Name='GlobalSettingsUICorner'a5.CornerRadius=UDim.new(0,10)a5.
Parent=a3 local a6=Instance.new'UIPadding'a6.Name='GlobalSettingsUIPadding'a6.
PaddingBottom=UDim.new(0,10)a6.PaddingTop=UDim.new(0,10)a6.Parent=a3 local a7=
Instance.new'UIListLayout'a7.Name='GlobalSettingsUIListLayout'a7.Padding=UDim.
new(0,5)a7.SortOrder=Enum.SortOrder.LayoutOrder a7.Parent=a3 local a8=Instance.
new'UIScale'a8.Name='GlobalSettingsUIScale'a8.Scale=1e-7 a8.Parent=a3 a3.Parent=
l l.Parent=h function g:UpdateTitle(a9)O.Text=a9 end function g:UpdateSubtitle(
a9)P.Text=a9 end local a9,ba=a8.Scale==1 and true or false local bb=function()if
not a9 then local bb=e(a8,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=1})bb:Play()bb.Completed:Wait()a9=true elseif a9
then local bb=e(a8,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=0})bb:Play()bb.Completed:Wait()a9=false end end L.
MouseButton1Click:Connect(function()if not b then return end bb()end)a3.
MouseEnter:Connect(function()ba=true end)a3.MouseLeave:Connect(function()ba=
false end)af.InputEnded:Connect(function(bc)if bc.UserInputType==Enum.
UserInputType.MouseButton1 and a9 and not ba then bb()end end)local bc,bd,be,bf,
bg=l,ad,workspace.CurrentCamera,'Glass',{}local bh,bi=(bd:GenerateGUID(true))for
bj,bk in pairs(ag:GetChildren())do if not bk:IsA'DepthOfFieldEffect'and bk:
HasTag'.'then bi=Instance.new'DepthOfFieldEffect'bi.FarIntensity=0 bi.
FocusDistance=51.6 bi.InFocusRadius=50 bi.NearIntensity=1 bi.Name=bd:
GenerateGUID(true)bi:AddTag'.'elseif bk:IsA'DepthOfFieldEffect'and bk:HasTag'.'
then bi=bk end end if not bi then bi=Instance.new'DepthOfFieldEffect'bi.
FarIntensity=0 bi.FocusDistance=51.6 bi.InFocusRadius=50 bi.NearIntensity=1 bi.
Name=bd:GenerateGUID(true)bi:AddTag'.'end local bj=Instance.new'Frame'bj.Parent=
bc bj.Size=UDim2.new(0.97,0,0.97,0)bj.Position=UDim2.new(0.5,0,0.5,0)bj.
AnchorPoint=Vector2.new(0.5,0.5)bj.BackgroundTransparency=1 bj.Name=bd:
GenerateGUID(true)do local bk=function(bk)return bk==bk end local bl=bk(be:
ScreenPointToRay(0,0).Origin.x)while not bl do ac.RenderStepped:Wait()bl=bk(be:
ScreenPointToRay(0,0).Origin.x)end end local bk do local bl,bm,bn,bo,bp=math.
acos,math.max,math.pi,math.sqrt,0.2 local bq=function(bq,br,bs,bt,bu)local bv,bw
,bx=(bq-br).magnitude,(br-bs).magnitude,(bs-bq).magnitude local by,bz,bA,bB=(bm(
bv,bw,bx))if bv==by then bz,bA,bB=bq,br,bs elseif bw==by then bz,bA,bB=br,bs,bq
elseif bx==by then bz,bA,bB=bs,bq,br end local bC=((bA-bz).x*(bB-bz).x+(bA-bz).y
*(bB-bz).y+(bA-bz).z*(bB-bz).z)/(bz-bA).magnitude local bD,bE,bF,bG=bo((bB-bz).
magnitude^2-bC*bC),(bz-bA).magnitude-bC,CFrame.new(bA,bz),CFrame.Angles(bn/2,0,0
)local bH=bF local bI,bJ=(bH*bG).lookVector,bz+CFrame.new(bz,bA).lookVector*bC
local bK=CFrame.new(bJ,bB).lookVector local bL=bI.x*bK.x+bI.y*bK.y+bI.z*bK.z
local bM=CFrame.Angles(0,0,bl(bL))bH=bH*bM if((bH*bG).lookVector-bK).magnitude>
0.01 then bH=bH*CFrame.Angles(0,0,-2*bl(bL))end bH=bH*CFrame.new(0,bD/2,-(bE+bC/
2))local bN=bF*bM*CFrame.Angles(0,bn,0)if((bN*bG).lookVector-bK).magnitude>0.01
then bN=bN*CFrame.Angles(0,0,2*bl(bL))end bN=bN*CFrame.new(0,bD/2,bE/2)if not bt
then bt=Instance.new'Part'bt.FormFactor='Custom'bt.TopSurface=0 bt.BottomSurface
=0 bt.Anchored=true bt.CanCollide=false bt.CastShadow=false bt.Material=bf bt.
Size=Vector3.new(bp,bp,bp)bt.Name=bd:GenerateGUID(true)local bO=Instance.new(
'SpecialMesh',bt)bO.MeshType=2 bO.Name=bh end bt[bh].Scale=Vector3.new(0,bD/bp,
bC/bp)bt.CFrame=bH if not bu then bu=bt:clone()end bu[bh].Scale=Vector3.new(0,bD
/bp,bE/bp)bu.CFrame=bN return bt,bu end function bk(br,bs,bt,bu,bv)bv[1],bv[2]=
bq(br,bs,bt,bv[1],bv[2])bv[3],bv[4]=bq(bt,bs,bu,bv[3],bv[4])end end if bg[bj]
then return bg[bj].parts end local bl,bm={},{}do local function bn(bo)if bo:IsA
'GuiObject'then bm[#bm+1]=bo bn(bo.Parent)end end bn(bj)end local bn=function(bn
)while bn do if bn:IsA'GuiObject'then if not bn.Visible then return false end
elseif bn:IsA'ScreenGui'then if not bn.Enabled then return false end break end
bn=bn.Parent end return true end local bo=function(bo)if not bn(bj)or not aq or
am then for bp,bq in pairs(bl)do bq.Parent=nil bi.Enabled=false bi.Parent=nil
end return end if not bi.Parent then bi.Parent=ag end bi.Enabled=true local bp,
bq,br,bs={Transparency=0.98,BrickColor=BrickColor.new'Institutional white'},1-
0.05*bj.ZIndex,bj.AbsolutePosition,bj.AbsolutePosition+bj.AbsoluteSize local bt,
bu=Vector2.new(bs.x,br.y),Vector2.new(br.x,bs.y)do local bv=0 for bw,bx in
ipairs(bm)do bv=bv+bx.Rotation end if bv~=0 and bv%180~=0 then local bw,bx,by=br
:lerp(bs,0.5),math.sin(math.rad(bv)),math.cos(math.rad(bv))br=Vector2.new(by*(br
.x-bw.x)-bx*(br.y-bw.y),bx*(br.x-bw.x)+by*(br.y-bw.y))+bw bt=Vector2.new(by*(bt.
x-bw.x)-bx*(bt.y-bw.y),bx*(bt.x-bw.x)+by*(bt.y-bw.y))+bw bu=Vector2.new(by*(bu.x
-bw.x)-bx*(bu.y-bw.y),bx*(bu.x-bw.x)+by*(bu.y-bw.y))+bw bs=Vector2.new(by*(bs.x-
bw.x)-bx*(bs.y-bw.y),bx*(bs.x-bw.x)+by*(bs.y-bw.y))+bw end end bk(be:
ScreenPointToRay(br.x,br.y,bq).Origin,be:ScreenPointToRay(bt.x,bt.y,bq).Origin,
be:ScreenPointToRay(bu.x,bu.y,bq).Origin,be:ScreenPointToRay(bs.x,bs.y,bq).
Origin,bl)if bo then for bv,bw in pairs(bl)do bw.Parent=be end for bv,bw in
pairs(bp)do for bx,by in pairs(bl)do by[bv]=bw end end end end bo(true)ac.
RenderStepped:Connect(bo)function g:GlobalSetting(bp)b=true local bq,br={},
Instance.new'TextButton'br.Name='GlobalSetting'br.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'br.Text=''br.TextColor3=Color3.
fromRGB(0,0,0)br.TextSize=14 br.BackgroundColor3=Color3.fromRGB(255,255,255)br.
BackgroundTransparency=1 br.BorderColor3=Color3.fromRGB(0,0,0)br.BorderSizePixel
=0 br.Size=UDim2.fromOffset(200,30)local bs=Instance.new'UIPadding'bs.Name=
'GlobalSettingToggleUIPadding'bs.PaddingLeft=UDim.new(0,15)bs.Parent=br local bt
=Instance.new'TextLabel'bt.Name='SettingName'bt.FontFace=Font.new(an.interFont)
bt.Text=bp.Name bt.RichText=true bt.TextColor3=Color3.fromRGB(255,255,255)bt.
TextSize=13 bt.TextTransparency=0.5 bt.TextTruncate=Enum.TextTruncate.SplitWord
bt.TextXAlignment=Enum.TextXAlignment.Left bt.TextYAlignment=Enum.TextYAlignment
.Top bt.AnchorPoint=Vector2.new(0,0.5)bt.AutomaticSize=Enum.AutomaticSize.Y bt.
BackgroundColor3=Color3.fromRGB(255,255,255)bt.BackgroundTransparency=1 bt.
BorderColor3=Color3.fromRGB(0,0,0)bt.BorderSizePixel=0 bt.Position=UDim2.
fromScale(1.3e-7,0.5)bt.Size=UDim2.new(1,-40,0,0)bt.Parent=br local bu=Instance.
new'UIListLayout'bu.Name='GlobalSettingToggleUIListLayout'bu.Padding=UDim.new(0,
10)bu.FillDirection=Enum.FillDirection.Horizontal bu.SortOrder=Enum.SortOrder.
LayoutOrder bu.VerticalAlignment=Enum.VerticalAlignment.Center bu.Parent=br
local bv=Instance.new'TextLabel'bv.Name='Checkmark'bv.FontFace=Font.new(an.
interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)bv.Text='\u{2713}'bv.
TextColor3=Color3.fromRGB(255,255,255)bv.TextSize=13 bv.TextTransparency=1 bv.
TextXAlignment=Enum.TextXAlignment.Left bv.TextYAlignment=Enum.TextYAlignment.
Top bv.AnchorPoint=Vector2.new(0,0.5)bv.AutomaticSize=Enum.AutomaticSize.Y bv.
BackgroundColor3=Color3.fromRGB(255,255,255)bv.BackgroundTransparency=1 bv.
BorderColor3=Color3.fromRGB(0,0,0)bv.BorderSizePixel=0 bv.LayoutOrder=-1 bv.
Position=UDim2.fromScale(1.3e-7,0.5)bv.Size=UDim2.fromOffset(-10,0)bv.Parent=br
br.Parent=a3 local bw={duration=0.2,easingStyle=Enum.EasingStyle.Quint,
transparencyIn=0.2,transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-
bu.Padding.Offset,waitTime=1}local bx={checkIn=e(bv,TweenInfo.new(bw.duration,bw
.easingStyle),{Size=UDim2.new(bv.Size.X.Scale,bw.checkSizeIncrease,bv.Size.Y.
Scale,bv.Size.Y.Offset)}),checkOut=e(bv,TweenInfo.new(bw.duration,bw.easingStyle
),{Size=UDim2.new(bv.Size.X.Scale,bw.checkSizeDecrease,bv.Size.Y.Scale,bv.Size.Y
.Offset)}),nameIn=e(bt,TweenInfo.new(bw.duration,bw.easingStyle),{
TextTransparency=bw.transparencyIn}),nameOut=e(bt,TweenInfo.new(bw.duration,bw.
easingStyle),{TextTransparency=bw.transparencyOut})}local by,bz=function(by)if
not by then bx.checkOut:Play()bx.nameOut:Play()bv:GetPropertyChangedSignal
'AbsoluteSize':Connect(function()if bv.AbsoluteSize.X<=0 then bv.
TextTransparency=1 end end)else bx.checkIn:Play()bx.nameIn:Play()bv:
GetPropertyChangedSignal'AbsoluteSize':Connect(function()if bv.AbsoluteSize.X>0
then bv.TextTransparency=0 end end)end end,bp.Default by(bz)br.MouseButton1Click
:Connect(function()bz=not bz by(bz)task.spawn(function()if bp.Callback then bp.
Callback(bz)end end)end)function bq:UpdateName(bA)bt.Text=bA end function bq:
UpdateState(bA)by(bA)bz=bA end return bq end function g:TabGroup()local bp,bq={}
,Instance.new'Frame'bq.Name='Section'bq.AutomaticSize=Enum.AutomaticSize.Y bq.
BackgroundColor3=Color3.fromRGB(255,255,255)bq.BackgroundTransparency=1 bq.
BorderColor3=Color3.fromRGB(0,0,0)bq.BorderSizePixel=0 bq.Size=UDim2.fromScale(1
,0)local br=Instance.new'Frame'br.Name='Divider'br.AnchorPoint=Vector2.new(0.5,1
)br.BackgroundColor3=Color3.fromRGB(255,255,255)br.BackgroundTransparency=0.9 br
.BorderColor3=Color3.fromRGB(0,0,0)br.BorderSizePixel=0 br.Position=UDim2.
fromScale(0.5,1)br.Size=UDim2.new(1,-21,0,1)br.Parent=bq local bs=Instance.new
'Frame'bs.Name='SectionTabSwitchers'bs.BackgroundColor3=Color3.fromRGB(255,255,
255)bs.BackgroundTransparency=1 bs.BorderColor3=Color3.fromRGB(0,0,0)bs.
BorderSizePixel=0 bs.Size=UDim2.fromScale(1,1)local bt=Instance.new
'UIListLayout'bt.Name='UIListLayout'bt.Padding=UDim.new(0,15)bt.
HorizontalAlignment=Enum.HorizontalAlignment.Center bt.SortOrder=Enum.SortOrder.
LayoutOrder bt.Parent=bs local bu=Instance.new'UIPadding'bu.Name='UIPadding'bu.
PaddingBottom=UDim.new(0,15)bu.Parent=bs bs.Parent=bq bq.Parent=aC function bp:
Tab(bv)local bw,bx={Settings=bv},Instance.new'TextButton'bx.Name='TabSwitcher'bx
.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'bx.Text=''bx.
TextColor3=Color3.fromRGB(0,0,0)bx.TextSize=14 bx.AutoButtonColor=false bx.
AnchorPoint=Vector2.new(0.5,0)bx.BackgroundColor3=Color3.fromRGB(255,255,255)bx.
BackgroundTransparency=1 bx.BorderColor3=Color3.fromRGB(0,0,0)bx.BorderSizePixel
=0 bx.Position=UDim2.fromScale(0.5,0)bx.Size=UDim2.new(1,-21,0,40)al+=1 bx.
LayoutOrder=al local by=Instance.new'UICorner'by.Name='TabSwitcherUICorner'by.
Parent=bx local bz=Instance.new'UIStroke'bz.Name='TabSwitcherUIStroke'bz.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border bz.Color=Color3.fromRGB(255,255,255)
bz.Transparency=1 bz.Parent=bx local bA=Instance.new'UIListLayout'bA.Name=
'TabSwitcherUIListLayout'bA.Padding=UDim.new(0,9)bA.FillDirection=Enum.
FillDirection.Horizontal bA.SortOrder=Enum.SortOrder.LayoutOrder bA.
VerticalAlignment=Enum.VerticalAlignment.Center bA.Parent=bx local bB if bv.
Image then bB=Instance.new'ImageLabel'bB.Name='TabImage'bB.Image=bv.Image bB.
ImageTransparency=0.5 bB.BackgroundColor3=Color3.fromRGB(255,255,255)bB.
BackgroundTransparency=1 bB.BorderColor3=Color3.fromRGB(0,0,0)bB.BorderSizePixel
=0 bB.Size=UDim2.fromOffset(18,18)bB.Parent=bx end local bC=Instance.new
'TextLabel'bC.Name='TabSwitcherName'bC.FontFace=Font.new(an.interFont,Enum.
FontWeight.Medium,Enum.FontStyle.Normal)bC.Text=bv.Name bC.RichText=true bC.
TextColor3=Color3.fromRGB(255,255,255)bC.TextSize=16 bC.TextTransparency=0.5 bC.
TextTruncate=Enum.TextTruncate.SplitWord bC.TextXAlignment=Enum.TextXAlignment.
Left bC.TextYAlignment=Enum.TextYAlignment.Top bC.AutomaticSize=Enum.
AutomaticSize.Y bC.BackgroundColor3=Color3.fromRGB(255,255,255)bC.
BackgroundTransparency=1 bC.BorderColor3=Color3.fromRGB(0,0,0)bC.BorderSizePixel
=0 bC.Size=UDim2.fromScale(1,0)bC.Parent=bx bC.LayoutOrder=1 local bD=Instance.
new'UIPadding'bD.Name='TabSwitcherUIPadding'bD.PaddingLeft=UDim.new(0,24)bD.
PaddingRight=UDim.new(0,35)bD.PaddingTop=UDim.new(0,1)bD.Parent=bx bx.Parent=bs
local bE=Instance.new'Frame'bE.Name='Elements'bE.BackgroundColor3=Color3.
fromRGB(255,255,255)bE.BackgroundTransparency=1 bE.BorderColor3=Color3.fromRGB(0
,0,0)bE.BorderSizePixel=0 bE.Position=UDim2.fromOffset(0,63)bE.Size=UDim2.new(1,
0,1,-63)bE.ClipsDescendants=true local bF=Instance.new'UIPadding'bF.Name=
'ElementsUIPadding'bF.PaddingRight=UDim.new(0,5)bF.PaddingTop=UDim.new(0,10)bF.
PaddingBottom=UDim.new(0,10)bF.Parent=bE local bG=Instance.new'ScrollingFrame'bG
.Name='ElementsScrolling'bG.AutomaticCanvasSize=Enum.AutomaticSize.Y bG.
BottomImage=''bG.CanvasSize=UDim2.new()bG.ScrollBarImageTransparency=0.5 bG.
ScrollBarThickness=1 bG.TopImage=''bG.BackgroundColor3=Color3.fromRGB(255,255,
255)bG.BackgroundTransparency=1 bG.BorderColor3=Color3.fromRGB(0,0,0)bG.
BorderSizePixel=0 bG.Size=UDim2.fromScale(1,1)bG.ClipsDescendants=false local bH
=Instance.new'UIPadding'bH.Name='ElementsScrollingUIPadding'bH.PaddingBottom=
UDim.new(0,5)bH.PaddingLeft=UDim.new(0,11)bH.PaddingRight=UDim.new(0,3)bH.
PaddingTop=UDim.new(0,5)bH.Parent=bG local bI=Instance.new'UIListLayout'bI.Name=
'ElementsScrollingUIListLayout'bI.Padding=UDim.new(0,15)bI.FillDirection=Enum.
FillDirection.Horizontal bI.SortOrder=Enum.SortOrder.LayoutOrder bI.Parent=bG
local bJ=Instance.new'Frame'bJ.Name='Left'bJ.AutomaticSize=Enum.AutomaticSize.Y
bJ.BackgroundColor3=Color3.fromRGB(0,0,0)bJ.BackgroundTransparency=1 bJ.
BorderColor3=Color3.fromRGB(0,0,0)bJ.BorderSizePixel=0 bJ.Position=UDim2.
fromScale(0.512,0)bJ.Size=UDim2.new(0.5,-10,0,0)local bK=Instance.new
'UIListLayout'bK.Name='LeftUIListLayout'bK.Padding=UDim.new(0,15)bK.SortOrder=
Enum.SortOrder.LayoutOrder bK.Parent=bJ bJ.Parent=bG local bL=Instance.new
'Frame'bL.Name='Right'bL.AutomaticSize=Enum.AutomaticSize.Y bL.BackgroundColor3=
Color3.fromRGB(0,0,0)bL.BackgroundTransparency=1 bL.BorderColor3=Color3.fromRGB(
0,0,0)bL.BorderSizePixel=0 bL.LayoutOrder=1 bL.Position=UDim2.fromScale(0.512,0)
bL.Size=UDim2.new(0.5,-10,0,0)local bM=Instance.new'UIListLayout'bM.Name=
'RightUIListLayout'bM.Padding=UDim.new(0,15)bM.SortOrder=Enum.SortOrder.
LayoutOrder bM.Parent=bL bL.Parent=bG bG.Parent=bE function bw:Section(bN)local
bO,bP={},Instance.new'Frame'bP.Name='Section'bP.AutomaticSize=Enum.AutomaticSize
.Y bP.BackgroundColor3=Color3.fromRGB(255,255,255)bP.BackgroundTransparency=0.98
bP.BorderColor3=Color3.fromRGB(0,0,0)bP.BorderSizePixel=0 bP.Position=UDim2.
fromScale(0,6.78e-8)bP.Size=UDim2.fromScale(1,0)bP.ClipsDescendants=true bP.
Parent=bN.Side=='Left'and bJ or bL local bQ=Instance.new'UICorner'bQ.Name=
'SectionUICorner'bQ.Parent=bP local bR=Instance.new'UIStroke'bR.Name=
'SectionUIStroke'bR.ApplyStrokeMode=Enum.ApplyStrokeMode.Border bR.Color=Color3.
fromRGB(255,255,255)bR.Transparency=0.95 bR.Parent=bP local bS=Instance.new
'UIListLayout'bS.Name='SectionUIListLayout'bS.Padding=UDim.new(0,10)bS.SortOrder
=Enum.SortOrder.LayoutOrder bS.Parent=bP local bT=Instance.new'UIPadding'bT.Name
='SectionUIPadding'bT.PaddingBottom=UDim.new(0,20)bT.PaddingLeft=UDim.new(0,20)
bT.PaddingRight=UDim.new(0,18)bT.PaddingTop=UDim.new(0,22)bT.Parent=bP function
bO:Button(bU,bV)local bW,bX={Settings=bU},Instance.new'Frame'bX.Name='Button'bX.
AutomaticSize=Enum.AutomaticSize.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.
BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel
=0 bX.Size=UDim2.new(1,0,0,38)bX.Parent=bP local bY=Instance.new'TextButton'bY.
Name='ButtonInteract'bY.FontFace=Font.new(an.interFont)bY.RichText=true bY.
TextColor3=Color3.fromRGB(255,255,255)bY.TextSize=13 bY.TextTransparency=0.5 bY.
TextTruncate=Enum.TextTruncate.AtEnd bY.TextXAlignment=Enum.TextXAlignment.Left
bY.BackgroundColor3=Color3.fromRGB(255,255,255)bY.BackgroundTransparency=1 bY.
BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Size=UDim2.fromScale(1
,1)bY.Parent=bX bY.Text=bW.Settings.Name local bZ=Instance.new'ImageLabel'bZ.
Name='ButtonImage'bZ.Image=an.buttonImage bZ.ImageTransparency=0.5 bZ.
AnchorPoint=Vector2.new(1,0.5)bZ.BackgroundColor3=Color3.fromRGB(255,255,255)bZ.
BackgroundTransparency=1 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel
=0 bZ.Position=UDim2.fromScale(1,0.5)bZ.Size=UDim2.fromOffset(15,15)bZ.Parent=bX
local b_={DefaultTransparency=0.5,HoverTransparency=0.3,EasingStyle=Enum.
EasingStyle.Sine}local b0,b1=function(b0)if b0=='Idle'then e(bY,TweenInfo.new(
0.2,b_.EasingStyle),{TextTransparency=b_.DefaultTransparency}):Play()e(bZ,
TweenInfo.new(0.2,b_.EasingStyle),{ImageTransparency=b_.DefaultTransparency}):
Play()elseif b0=='Hover'then e(bY,TweenInfo.new(0.2,b_.EasingStyle),{
TextTransparency=b_.HoverTransparency}):Play()e(bZ,TweenInfo.new(0.2,b_.
EasingStyle),{ImageTransparency=b_.HoverTransparency}):Play()end end,function()
if bW.Settings.Callback then bW.Settings.Callback()end end bY.MouseEnter:
Connect(function()b0'Hover'end)bY.MouseLeave:Connect(function()b0'Idle'end)bY.
MouseButton1Click:Connect(b1)function bW:UpdateName(b2)bY.Text=b2 end function
bW:SetVisibility(b2)bX.Visible=b2 end if bV then aa.Options[bV]=bW end return bW
end function bO:Toggle(bU,bV)local bW,bX={Settings=bU,IgnoreConfig=false,Class=
'Toggle'},Instance.new'Frame'bX.Name='Toggle'bX.AutomaticSize=Enum.AutomaticSize
.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.BackgroundTransparency=1 bX.
BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel=0 bX.Size=UDim2.new(1,0,0,
38)bX.Parent=bP local bY=Instance.new'TextLabel'bY.Name='ToggleName'bY.FontFace=
Font.new(an.interFont)bY.Text=bW.Settings.Name bY.RichText=true bY.TextColor3=
Color3.fromRGB(255,255,255)bY.TextSize=13 bY.TextTransparency=0.5 bY.
TextTruncate=Enum.TextTruncate.AtEnd bY.TextXAlignment=Enum.TextXAlignment.Left
bY.TextYAlignment=Enum.TextYAlignment.Top bY.AnchorPoint=Vector2.new(0,0.5)bY.
AutomaticSize=Enum.AutomaticSize.Y bY.BackgroundColor3=Color3.fromRGB(255,255,
255)bY.BackgroundTransparency=1 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.
BorderSizePixel=0 bY.Position=UDim2.fromScale(0,0.5)bY.Size=UDim2.new(1,-50,0,0)
bY.Parent=bX local bZ=Instance.new'ImageButton'bZ.Name='Toggle'bZ.Image=an.
toggleBackground bZ.ImageColor3=Color3.fromRGB(87,86,86)bZ.AutoButtonColor=false
bZ.AnchorPoint=Vector2.new(1,0.5)bZ.BackgroundColor3=Color3.fromRGB(255,255,255)
bZ.BackgroundTransparency=1 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.
BorderSizePixel=0 bZ.Position=UDim2.fromScale(1,0.5)bZ.Size=UDim2.fromOffset(41,
21)bZ.ImageTransparency=0.5 local b_=Instance.new'UIPadding'b_.Name=
'ToggleUIPadding'b_.PaddingBottom=UDim.new(0,1)b_.PaddingLeft=UDim.new(0,-2)b_.
PaddingRight=UDim.new(0,3)b_.PaddingTop=UDim.new(0,1)b_.Parent=bZ local b0=
Instance.new'ImageLabel'b0.Name='TogglerHead'b0.Image=an.togglerHead b0.
ImageColor3=Color3.fromRGB(255,255,255)b0.AnchorPoint=Vector2.new(1,0.5)b0.
BackgroundColor3=Color3.fromRGB(255,255,255)b0.BackgroundTransparency=1 b0.
BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel=0 b0.Position=UDim2.
fromScale(0.5,0.5)b0.Size=UDim2.fromOffset(15,15)b0.ZIndex=2 b0.Parent=bZ b0.
ImageTransparency=0.8 bZ.Parent=bX local b1,b2,b3,b4={Enabled=0,Disabled=0.5},{
Enabled=0,Disabled=0.85},{Info=TweenInfo.new(0.15,Enum.EasingStyle.Quad),
EnabledPosition=UDim2.new(1,0,0.5,0),DisabledPosition=UDim2.new(0.5,0,0.5,0)},bW
.Settings.Default local b5=function(b5,b6)ao()local b7,b8=b5 and{b1.Enabled,b2.
Enabled}or{b1.Disabled,b2.Disabled},b5 and b3.EnabledPosition or b3.
DisabledPosition pcall(function()e(bZ,b3.Info,{ImageTransparency=b7[1]}):Play()
end)pcall(function()e(b0,b3.Info,{ImageTransparency=b7[2]}):Play()end)pcall(
function()e(b0,b3.Info,{Position=b8}):Play()end)bW.State=b5 if b6 then pcall(b6,
b4)end end b5(b4)local b6=function()b4=not b4 b5(b4,bW.Settings.Callback)end bZ.
MouseButton1Click:Connect(b6)function bW:Toggle()b6()end function bW:UpdateState
(b7,b8)b4=b7 b5(b4,not b8 and bW.Settings.Callback or nil)end function bW:
GetState()return b4 end function bW:UpdateName(b7)bY.Text=b7 end function bW:
SetVisibility(b7)bX.Visible=b7 end if bV then aa.Options[bV]=bW end return bW
end function bO:Slider(bU,bV)local bW,bX={Settings=bU,IgnoreConfig=false,Class=
'Slider'},Instance.new'Frame'bX.Name='Slider'bX.AutomaticSize=Enum.AutomaticSize
.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.BackgroundTransparency=1 bX.
BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel=0 bX.Size=UDim2.new(1,0,0,
38)bX.Parent=bP local bY=Instance.new'TextLabel'bY.Name='SliderName'bY.FontFace=
Font.new(an.interFont)bY.Text=bW.Settings.Name bY.RichText=true bY.TextColor3=
Color3.fromRGB(255,255,255)bY.TextSize=13 bY.TextTransparency=0.5 bY.
TextTruncate=Enum.TextTruncate.AtEnd bY.TextXAlignment=Enum.TextXAlignment.Left
bY.TextYAlignment=Enum.TextYAlignment.Top bY.AnchorPoint=Vector2.new(0,0.5)bY.
AutomaticSize=Enum.AutomaticSize.XY bY.BackgroundColor3=Color3.fromRGB(255,255,
255)bY.BackgroundTransparency=1 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.
BorderSizePixel=0 bY.Position=UDim2.fromScale(1.3e-7,0.5)bY.Parent=bX local bZ=
Instance.new'Frame'bZ.Name='SliderElements'bZ.AnchorPoint=Vector2.new(1,0)bZ.
BackgroundColor3=Color3.fromRGB(255,255,255)bZ.BackgroundTransparency=1 bZ.
BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel=0 bZ.Position=UDim2.
fromScale(1,0)bZ.Size=UDim2.fromScale(1,1)local b_=Instance.new'TextBox'b_.Name=
'SliderValue'b_.FontFace=Font.new(an.interFont)b_.TextColor3=Color3.fromRGB(255,
255,255)b_.TextSize=12 b_.TextTransparency=0.1 b_.BackgroundColor3=Color3.
fromRGB(255,255,255)b_.BackgroundTransparency=0.95 b_.BorderColor3=Color3.
fromRGB(0,0,0)b_.BorderSizePixel=0 b_.LayoutOrder=1 b_.Position=UDim2.fromScale(
-7.89E-2,0.171)b_.Size=UDim2.fromOffset(41,21)b_.ClipsDescendants=true local b0=
Instance.new'UICorner'b0.Name='SliderValueUICorner'b0.CornerRadius=UDim.new(0,4)
b0.Parent=b_ local b1=Instance.new'UIStroke'b1.Name='SliderValueUIStroke'b1.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border b1.Color=Color3.fromRGB(255,255,255)
b1.Transparency=0.9 b1.Parent=b_ local b2=Instance.new'UIPadding'b2.Name=
'SliderValueUIPadding'b2.PaddingLeft=UDim.new(0,2)b2.PaddingRight=UDim.new(0,2)
b2.Parent=b_ b_.Parent=bZ local b3=Instance.new'UIListLayout'b3.Name=
'SliderElementsUIListLayout'b3.Padding=UDim.new(0,20)b3.FillDirection=Enum.
FillDirection.Horizontal b3.HorizontalAlignment=Enum.HorizontalAlignment.Right
b3.SortOrder=Enum.SortOrder.LayoutOrder b3.VerticalAlignment=Enum.
VerticalAlignment.Center b3.Parent=bZ local b4=Instance.new'ImageLabel'b4.Name=
'SliderBar'b4.Image=an.sliderbar b4.ImageColor3=Color3.fromRGB(87,86,86)b4.
BackgroundColor3=Color3.fromRGB(255,255,255)b4.BackgroundTransparency=1 b4.
BorderColor3=Color3.fromRGB(0,0,0)b4.BorderSizePixel=0 b4.Position=UDim2.
fromScale(0.219,0.457)b4.Size=UDim2.fromOffset(123,3)local b5=Instance.new
'ImageButton'b5.Name='SliderHead'b5.Image=an.sliderhead b5.AnchorPoint=Vector2.
new(0.5,0.5)b5.BackgroundColor3=Color3.fromRGB(255,255,255)b5.
BackgroundTransparency=1 b5.BorderColor3=Color3.fromRGB(0,0,0)b5.BorderSizePixel
=0 b5.Position=UDim2.fromScale(1,0.5)b5.Size=UDim2.fromOffset(12,12)b5.Parent=b4
b4.Parent=bZ local b6=Instance.new'UIPadding'b6.Name='SliderElementsUIPadding'b6
.PaddingTop=UDim.new(0,3)b6.Parent=bZ bZ.Parent=bX local b7,b8=false,{Hundredths
=function(b7)return string.format('%.2f',b7)end,Tenths=function(b7)return string
.format('%.1f',b7)end,Round=function(b7,b8)if b8 then return string.format('%.'
..b8..'f',b7)else return tostring(math.round(b7))end end,Degrees=function(b7,b8)
local b9=b8 and string.format('%.'..b8..'f',b7)or tostring(b7)return b9..
'\u{b0}'end,Percent=function(b7,b8)local b9=(b7-bW.Settings.Minimum)/(bW.
Settings.Maximum-bW.Settings.Minimum)*100 return b8 and string.format('%.'..b8..
'f',b9)..'%'or tostring(math.round(b9))..'%'end,Value=function(b7,b8)return b8
and string.format('%.'..b8..'f',b7)or tostring(b7)end}local b9,ca=b8[bW.Settings
.DisplayMethod]or b8.Value local cb=function(cb,cc)ao()local cd if typeof(cb)==
'Instance'then local ce=cb cd=math.clamp((ce.Position.X-b4.AbsolutePosition.X)/
b4.AbsoluteSize.X,0,1)else local ce=cb cd=(ce-bW.Settings.Minimum)/(bW.Settings.
Maximum-bU.Minimum)end local ce=UDim2.new(cd,0,0.5,0)pcall(function()b5.Position
=ce end)ca=cd*(bW.Settings.Maximum-bW.Settings.Minimum)+bU.Minimum pcall(
function()b_.Text=(bU.Prefix or'')..b9(ca,bW.Settings.Precision)..(bU.Suffix or
'')end)if not cc then task.spawn(function()if bW.Settings.Callback then bW.
Settings.Callback(ca)end end)end bW.Value=ca end cb(bW.Settings.Default,true)b5.
InputBegan:Connect(function(cc)if cc.UserInputType==Enum.UserInputType.
MouseButton1 or cc.UserInputType==Enum.UserInputType.Touch then b7=true cb(cc)
end end)b5.InputEnded:Connect(function(cc)if cc.UserInputType==Enum.
UserInputType.MouseButton1 or cc.UserInputType==Enum.UserInputType.Touch then b7
=false if bW.Settings.onInputComplete then bW.Settings.onInputComplete(ca)end
end end)b_.FocusLost:Connect(function(cc)local cd=b_.Text local ce,cf=cd:match
'^(%-?%d+%.?%d*)(%%?)$'if ce then ce=tonumber(ce)cf=cf=='%'if cf then ce=bW.
Settings.Minimum+(ce/100)*(bW.Settings.Maximum-bW.Settings.Minimum)end local cg=
math.clamp(ce,bW.Settings.Minimum,bW.Settings.Maximum)cb(cg)else b_.Text=b9(ca)
end if bW.Settings.onInputComplete then bW.Settings.onInputComplete(ca)end end)
af.InputChanged:Connect(function(cc)if b7 and(cc.UserInputType==Enum.
UserInputType.MouseMovement or cc.UserInputType==Enum.UserInputType.Touch)then
cb(cc)end end)local cc=function()local cc,cd,ce,cf=b3.Padding.Offset,b_.
AbsoluteSize.X,bY.AbsoluteSize.X,bZ.AbsoluteSize.X local cg=(cf-(cc+cd+ce+20))/m
.Scale b4.Size=UDim2.new(b4.Size.X.Scale,cg,b4.Size.Y.Scale,b4.Size.Y.Offset)end
cc()bY:GetPropertyChangedSignal'AbsoluteSize':Connect(cc)bP:
GetPropertyChangedSignal'AbsoluteSize':Connect(cc)function bW:UpdateName(cd)bY=
cd end function bW:SetVisibility(cd)bX.Visible=cd end function bW:UpdateValue(cd
)cb(tonumber(cd),true)end function bW:GetValue()return ca end if bV then aa.
Options[bV]=bW end return bW end function bO:Input(bU,bV)local bW,bX={Settings=
bU,IgnoreConfig=false,Class='Input'},Instance.new'Frame'bX.Name='Input'bX.
AutomaticSize=Enum.AutomaticSize.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.
BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel
=0 bX.Size=UDim2.new(1,0,0,38)bX.Parent=bP local bY=Instance.new'TextLabel'bY.
Name='InputName'bY.FontFace=Font.new(an.interFont)bY.Text=bW.Settings.Name bY.
RichText=true bY.TextColor3=Color3.fromRGB(255,255,255)bY.TextSize=13 bY.
TextTransparency=0.5 bY.TextTruncate=Enum.TextTruncate.AtEnd bY.TextXAlignment=
Enum.TextXAlignment.Left bY.TextYAlignment=Enum.TextYAlignment.Top bY.
AnchorPoint=Vector2.new(0,0.5)bY.AutomaticSize=Enum.AutomaticSize.XY bY.
BackgroundColor3=Color3.fromRGB(255,255,255)bY.BackgroundTransparency=1 bY.
BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Position=UDim2.
fromScale(0,0.5)bY.Parent=bX local bZ=Instance.new'TextBox'bZ.Name='InputBox'bZ.
FontFace=Font.new(an.interFont)bZ.Text='Hello world!'bZ.TextColor3=Color3.
fromRGB(255,255,255)bZ.TextSize=12 bZ.TextTransparency=0.1 bZ.AnchorPoint=
Vector2.new(1,0.5)bZ.AutomaticSize=Enum.AutomaticSize.X bZ.BackgroundColor3=
Color3.fromRGB(255,255,255)bZ.BackgroundTransparency=0.95 bZ.BorderColor3=Color3
.fromRGB(0,0,0)bZ.BorderSizePixel=0 bZ.ClipsDescendants=true bZ.LayoutOrder=1 bZ
.Position=UDim2.fromScale(1,0.5)bZ.Size=UDim2.fromOffset(21,21)bZ.TextXAlignment
=Enum.TextXAlignment.Right local b_=Instance.new'UICorner'b_.Name=
'InputBoxUICorner'b_.CornerRadius=UDim.new(0,4)b_.Parent=bZ local b0=Instance.
new'UIStroke'b0.Name='InputBoxUIStroke'b0.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border b0.Color=Color3.fromRGB(255,255,255)b0.Transparency=0.9 b0.Parent=bZ
local b1=Instance.new'UIPadding'b1.Name='InputBoxUIPadding'b1.PaddingLeft=UDim.
new(0,5)b1.PaddingRight=UDim.new(0,5)b1.Parent=bZ local b2=Instance.new
'UISizeConstraint'b2.Name='InputBoxUISizeConstraint'b2.Parent=bZ bZ.Parent=bX
local b3,b4,b5,b6,b7=bX,bZ,bY,b2,function(b3)if bW.Settings.CharacterLimit then
return b3:sub(1,bW.Settings.CharacterLimit)end return b3 end local b8,b9={All=
function(b8)return b7(b8)end,Numeric=function(b8)local b9=b8:match'^%-?%d*$'and
b8 or b8:gsub('[^%d-]',''):gsub('(%-)',function(b9,ca)return ca==1 and b9 or''
end)return b7(b9)end,Alphabetic=function(b8)return b7(b8:gsub('[^a-zA-Z ]',''))
end,AlphaNumeric=function(b8)return b7(b8:gsub('[^a-zA-Z0-9]',''))end}if type(bW
.Settings.AcceptedCharacters)=='function'then b9=bW.Settings.AcceptedCharacters
else b9=b8[bW.Settings.AcceptedCharacters]or b8.All end b4.AutomaticSize=Enum.
AutomaticSize.X local ca=function()local ca,cb=b5.AbsoluteSize.X,b3.AbsoluteSize
.X local cc=(cb-ca-20)/m.Scale b6.MaxSize=Vector2.new(cc,9e9)end ca()b5:
GetPropertyChangedSignal'AbsoluteSize':Connect(ca)b4.FocusLost:Connect(function(
)local cb=b4.Text local cc=b9(cb)b4.Text=cc task.spawn(function()if bW.Settings.
Callback then bW.Settings.Callback(cc)end end)end)b4.Text=bW.Settings.Default or
''b4.PlaceholderText=bW.Settings.Placeholder or''b4:GetPropertyChangedSignal
'Text':Connect(function()b4.Text=b9(b4.Text)if bW.Settings.onChanged then bW.
Settings.onChanged(b4.Text)end bW.Text=b4.Text end)function bW:UpdateName(cb)bY.
Text=cb end function bW:SetVisibility(cb)bX.Visible=cb end function bW:GetInput(
)return b4.Text end function bW:UpdatePlaceholder(cb)bZ.PlaceholderText=cb end
function bW:UpdateText(cb)local cc=b9(cb)b4.Text=cc bW.Text=cc task.spawn(
function()if bW.Settings.Callback then bW.Settings.Callback(cc)end end)end if bV
then aa.Options[bV]=bW end return bW end function bO:Keybind(bU,bV)local bW,bX={
Settings=bU,IgnoreConfig=false,Class='Keybind'},Instance.new'Frame'bX.Name=
'Keybind'bX.AutomaticSize=Enum.AutomaticSize.Y bX.BackgroundColor3=Color3.
fromRGB(0,0,0)bX.BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)
bX.BorderSizePixel=0 bX.Size=UDim2.new(1,0,0,38)bX.Parent=bP local bY=Instance.
new'TextLabel'bY.Name='KeybindName'bY.FontFace=Font.new(an.interFont)bY.Text=bW.
Settings.Name bY.RichText=true bY.TextColor3=Color3.fromRGB(255,255,255)bY.
TextSize=13 bY.TextTransparency=0.5 bY.TextTruncate=Enum.TextTruncate.AtEnd bY.
TextXAlignment=Enum.TextXAlignment.Left bY.TextYAlignment=Enum.TextYAlignment.
Top bY.AnchorPoint=Vector2.new(0,0.5)bY.AutomaticSize=Enum.AutomaticSize.XY bY.
BackgroundColor3=Color3.fromRGB(255,255,255)bY.BackgroundTransparency=1 bY.
BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Position=UDim2.
fromScale(0,0.5)bY.Parent=bX local bZ=Instance.new'TextBox'bZ.Name='BinderBox'bZ
.CursorPosition=-1 bZ.FontFace=Font.new(an.interFont)bZ.PlaceholderText='...'bZ.
Text=''bZ.TextColor3=Color3.fromRGB(255,255,255)bZ.TextSize=12 bZ.
TextTransparency=0.1 bZ.AnchorPoint=Vector2.new(1,0.5)bZ.AutomaticSize=Enum.
AutomaticSize.X bZ.BackgroundColor3=Color3.fromRGB(255,255,255)bZ.
BackgroundTransparency=0.95 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.
BorderSizePixel=0 bZ.ClipsDescendants=true bZ.LayoutOrder=1 bZ.Position=UDim2.
fromScale(1,0.5)bZ.Size=UDim2.fromOffset(21,21)local b_=Instance.new'UICorner'b_
.Name='BinderBoxUICorner'b_.CornerRadius=UDim.new(0,4)b_.Parent=bZ local b0=
Instance.new'UIStroke'b0.Name='BinderBoxUIStroke'b0.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border b0.Color=Color3.fromRGB(255,255,255)b0.Transparency=0.9
b0.Parent=bZ local b1=Instance.new'UIPadding'b1.Name='BinderBoxUIPadding'b1.
PaddingLeft=UDim.new(0,5)b1.PaddingRight=UDim.new(0,5)b1.Parent=bZ local b2=
Instance.new'UISizeConstraint'b2.Name='BinderBoxUISizeConstraint'b2.Parent=bZ bZ
.Parent=bX local b3,b4,b5,b6=false,false,(bW.Settings.Default)local b7=function(
)b6=false b3=false bZ:ReleaseFocus()end if b5 then bZ.Text=b5.Name end bZ.
Focused:Connect(function()b6=true end)bZ.FocusLost:Connect(function()b6=false
end)af.InputBegan:Connect(function(b8)if b6 and not b3 then b3=true local b9 b9=
af.InputBegan:Connect(function(ca)if bW.Settings.Blacklist and(table.find(bW.
KeybindFunctions.Settings.Blacklist,ca.KeyCode)or table.find(bW.Settings.
Blacklist,ca.UserInputType))then bZ:ReleaseFocus()b7()b9:Disconnect()return end
if ca.UserInputType==Enum.UserInputType.Keyboard then b5=ca.KeyCode bZ.Text=ca.
KeyCode.Name elseif ca.UserInputType==Enum.UserInputType.MouseButton1 or ca.
UserInputType==Enum.UserInputType.MouseButton2 then b5=ca.UserInputType bZ.Text=
ca.UserInputType.Name end if bW.Settings.onBinded then bW.Settings.onBinded(b5)
end b4=true b7()b9:Disconnect()end)else if not b4 and(b8.KeyCode==b5 or b8.
UserInputType==b5)then if bW.Settings.Callback then bW.Settings.Callback(b5)end
if bW.Settings.onBindHeld then bW.Settings.onBindHeld(true,b5)end else b4=false
end end end)af.InputEnded:Connect(function(b8)if not b6 and not b3 then if b8.
KeyCode==b5 or b8.UserInputType==b5 then if bU.onBindHeld then bU.onBindHeld(
false,b5)end end end end)function bW:Bind(b8)b5=b8 bZ.Text=b8.Name end function
bW:Unbind()b5=nil bZ.Text=''end function bW:GetBind()return b5 end function bW:
UpdateName(b8)bY=b8 end function bW:SetVisibility(b8)bX.Visible=b8 end if bV
then aa.Options[bV]=bW end return bW end function bO:Dropdown(bU,bV)local bW,bX,
bY,bZ={Settings=bU,IgnoreConfig=false,Class='Dropdown'},{},{},Instance.new
'Frame'bZ.Name='Dropdown'bZ.BackgroundColor3=Color3.fromRGB(255,255,255)bZ.
BackgroundTransparency=0.985 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.
BorderSizePixel=0 bZ.Size=UDim2.new(1,0,0,38)bZ.Parent=bP bZ.ClipsDescendants=
true local b_=Instance.new'UIPadding'b_.Name='DropdownUIPadding'b_.PaddingLeft=
UDim.new(0,15)b_.PaddingRight=UDim.new(0,15)b_.Parent=bZ local b0=Instance.new
'TextButton'b0.Name='Interact'b0.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'b0.Text=''b0.TextColor3=Color3.
fromRGB(0,0,0)b0.TextSize=14 b0.BackgroundColor3=Color3.fromRGB(255,255,255)b0.
BackgroundTransparency=1 b0.BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel
=0 b0.Size=UDim2.new(1,0,0,38)b0.Parent=bZ local b1=Instance.new'TextLabel'b1.
Name='DropdownName'b1.FontFace=Font.new(an.interFont)b1.Text=bU.Default and(bW.
Settings.Name..' \u{2022} '..table.concat(bX,', '))or(bW.Settings.Name..'...')b1
.RichText=true b1.TextColor3=Color3.fromRGB(255,255,255)b1.TextSize=13 b1.
TextTransparency=0.5 b1.TextTruncate=Enum.TextTruncate.SplitWord b1.
TextXAlignment=Enum.TextXAlignment.Left b1.AutomaticSize=Enum.AutomaticSize.Y b1
.BackgroundColor3=Color3.fromRGB(255,255,255)b1.BackgroundTransparency=1 b1.
BorderColor3=Color3.fromRGB(0,0,0)b1.BorderSizePixel=0 b1.Size=UDim2.new(1,-20,0
,38)b1.Parent=bZ local b2=Instance.new'UIStroke'b2.Name='DropdownUIStroke'b2.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border b2.Color=Color3.fromRGB(255,255,255)
b2.Transparency=0.95 b2.Parent=bZ local b3=Instance.new'UICorner'b3.Name=
'DropdownUICorner'b3.CornerRadius=UDim.new(0,6)b3.Parent=bZ local b4=Instance.
new'ImageLabel'b4.Name='DropdownImage'b4.Image=an.dropdown b4.ImageTransparency=
0.5 b4.AnchorPoint=Vector2.new(1,0)b4.BackgroundColor3=Color3.fromRGB(255,255,
255)b4.BackgroundTransparency=1 b4.BorderColor3=Color3.fromRGB(0,0,0)b4.
BorderSizePixel=0 b4.Position=UDim2.new(1,0,0,12)b4.Size=UDim2.fromOffset(14,14)
b4.Parent=bZ local b5=Instance.new'Frame'b5.Name='DropdownFrame'b5.
BackgroundColor3=Color3.fromRGB(255,255,255)b5.BackgroundTransparency=1 b5.
BorderColor3=Color3.fromRGB(0,0,0)b5.BorderSizePixel=0 b5.ClipsDescendants=true
b5.Size=UDim2.fromScale(1,1)b5.Visible=false b5.AutomaticSize=Enum.AutomaticSize
.Y local b6=Instance.new'UIPadding'b6.Name='DropdownFrameUIPadding'b6.PaddingTop
=UDim.new(0,38)b6.PaddingBottom=UDim.new(0,10)b6.Parent=b5 local b7=Instance.new
'UIListLayout'b7.Name='DropdownFrameUIListLayout'b7.Padding=UDim.new(0,5)b7.
SortOrder=Enum.SortOrder.LayoutOrder b7.Parent=b5 local b8=Instance.new'Frame'b8
.Name='Search'b8.BackgroundColor3=Color3.fromRGB(255,255,255)b8.
BackgroundTransparency=0.95 b8.BorderColor3=Color3.fromRGB(0,0,0)b8.
BorderSizePixel=0 b8.LayoutOrder=-1 b8.Size=UDim2.new(1,0,0,30)b8.Parent=b5 b8.
Visible=bW.Settings.Search local b9=Instance.new'UICorner'b9.Name=
'SectionUICorner'b9.Parent=b8 local ca=Instance.new'ImageLabel'ca.Name=
'SearchIcon'ca.Image=an.searchIcon ca.ImageColor3=Color3.fromRGB(180,180,180)ca.
AnchorPoint=Vector2.new(0,0.5)ca.BackgroundColor3=Color3.fromRGB(255,255,255)ca.
BackgroundTransparency=1 ca.BorderColor3=Color3.fromRGB(0,0,0)ca.BorderSizePixel
=0 ca.Position=UDim2.fromScale(0,0.5)ca.Size=UDim2.fromOffset(12,12)ca.Parent=b8
local cb=Instance.new'UIPadding'cb.Name='UIPadding'cb.PaddingLeft=UDim.new(0,15)
cb.Parent=b8 local cc=Instance.new'TextBox'cc.Name='SearchBox'cc.CursorPosition=
-1 cc.FontFace=Font.new(an.interFont,Enum.FontWeight.Medium,Enum.FontStyle.
Normal)cc.PlaceholderColor3=Color3.fromRGB(150,150,150)cc.PlaceholderText=
'Search...'cc.Text=''cc.TextColor3=Color3.fromRGB(200,200,200)cc.TextSize=14 cc.
TextXAlignment=Enum.TextXAlignment.Left cc.BackgroundColor3=Color3.fromRGB(255,
255,255)cc.BackgroundTransparency=1 cc.BorderColor3=Color3.fromRGB(0,0,0)cc.
BorderSizePixel=0 cc.Size=UDim2.fromScale(1,1)local cd=function()local cd,ce,cf=
0,0,b6.PaddingTop.Offset+b6.PaddingBottom.Offset for cg,ch in pairs(b5:
GetChildren())do if not ch:IsA'UIComponent'and ch.Visible then cd+=ch.
AbsoluteSize.Y ce+=1 end end local cg=b7.Padding.Offset*(ce-1)return cd+cg+cf
end local ce=function()local ce=cc.Text:lower()for cf,cg in pairs(bY)do local ch
=cg.NameLabel.Text:lower()local ci=string.find(ch,ce)~=nil if cg.Button.Visible
~=ci then cg.Button.Visible=ci end end bZ.Size=UDim2.new(1,0,0,cd())end cc:
GetPropertyChangedSignal'Text':Connect(ce)local cf=Instance.new'UIPadding'cf.
Name='UIPadding'cf.PaddingLeft=UDim.new(0,23)cf.Parent=cc cc.Parent=b8 local cg=
{duration=0.2,easingStyle=Enum.EasingStyle.Quint,transparencyIn=0.2,
transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-13,waitTime=1}local
ch,ci,cj=function(ch,ci)local cj=bY[ch]if not cj then return end local ck,cl=cj.
Checkmark,cj.NameLabel if ci then if bW.Settings.Multi then if not table.find(bX
,ch)then table.insert(bX,ch)bW.Value=bX end else for cm,cn in pairs(bY)do if cm
~=ch then e(cn.Checkmark,TweenInfo.new(cg.duration,cg.easingStyle),{Size=UDim2.
new(cn.Checkmark.Size.X.Scale,cg.checkSizeDecrease,cn.Checkmark.Size.Y.Scale,cn.
Checkmark.Size.Y.Offset)}):Play()e(cn.NameLabel,TweenInfo.new(cg.duration,cg.
easingStyle),{TextTransparency=cg.transparencyOut}):Play()cn.Checkmark.
TextTransparency=1 end end bX={ch}bW.Value=bX[1]end e(ck,TweenInfo.new(cg.
duration,cg.easingStyle),{Size=UDim2.new(ck.Size.X.Scale,cg.checkSizeIncrease,ck
.Size.Y.Scale,ck.Size.Y.Offset)}):Play()e(cl,TweenInfo.new(cg.duration,cg.
easingStyle),{TextTransparency=cg.transparencyIn}):Play()ck.TextTransparency=0
else if bW.Settings.Multi then local cm=table.find(bX,ch)if cm then table.
remove(bX,cm)end else bX={}end e(ck,TweenInfo.new(cg.duration,cg.easingStyle),{
Size=UDim2.new(ck.Size.X.Scale,cg.checkSizeDecrease,ck.Size.Y.Scale,ck.Size.Y.
Offset)}):Play()e(cl,TweenInfo.new(cg.duration,cg.easingStyle),{TextTransparency
=cg.transparencyOut}):Play()ck.TextTransparency=1 end if bU.Required and#bX==0
and not ci then return end if#bX>0 then b1.Text=bW.Settings.Name..' \u{2022} '..
table.concat(bX,', ')else b1.Text=bW.Settings.Name..'...'end end,false,false
local ck=function()if cj then return end cj=true local ck,cl=38,not ci local cm=
cl and UDim2.new(1,0,0,cd())or UDim2.new(1,0,0,ck)local cn,co=e(bZ,TweenInfo.
new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=cm}),e(b4,
TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Rotation=cl
and-90 or 0})cn:Play()co:Play()if cl then b5.Visible=true cn.Completed:Connect(
function()cj=false end)else cn.Completed:Connect(function()b5.Visible=false cj=
false end)end ci=cl end b0.MouseButton1Click:Connect(ck)local cl=function(cl,cm)
local cn=Instance.new'TextButton'cn.Name='Option'cn.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'cn.Text=''cn.TextColor3=Color3.
fromRGB(0,0,0)cn.TextSize=14 cn.BackgroundColor3=Color3.fromRGB(255,255,255)cn.
BackgroundTransparency=1 cn.BorderColor3=Color3.fromRGB(0,0,0)cn.BorderSizePixel
=0 cn.Size=UDim2.new(1,0,0,30)local co=Instance.new'UIPadding'co.Name=
'OptionUIPadding'co.PaddingLeft=UDim.new(0,15)co.Parent=cn local cp=Instance.new
'TextLabel'cp.Name='OptionName'cp.FontFace=Font.new(an.interFont)cp.Text=cm cp.
RichText=true cp.TextColor3=Color3.fromRGB(255,255,255)cp.TextSize=13 cp.
TextTransparency=0.5 cp.TextTruncate=Enum.TextTruncate.AtEnd cp.TextXAlignment=
Enum.TextXAlignment.Left cp.TextYAlignment=Enum.TextYAlignment.Top cp.
AnchorPoint=Vector2.new(0,0.5)cp.AutomaticSize=Enum.AutomaticSize.XY cp.
BackgroundColor3=Color3.fromRGB(255,255,255)cp.BackgroundTransparency=1 cp.
BorderColor3=Color3.fromRGB(0,0,0)cp.BorderSizePixel=0 cp.Position=UDim2.
fromScale(1.3e-7,0.5)cp.Parent=cn local cq=Instance.new'UIListLayout'cq.Name=
'OptionUIListLayout'cq.Padding=UDim.new(0,10)cq.FillDirection=Enum.FillDirection
.Horizontal cq.SortOrder=Enum.SortOrder.LayoutOrder cq.VerticalAlignment=Enum.
VerticalAlignment.Center cq.Parent=cn local cr=Instance.new'TextLabel'cr.Name=
'Checkmark'cr.FontFace=Font.new(an.interFont)cr.Text='\u{2713}'cr.TextColor3=
Color3.fromRGB(255,255,255)cr.TextSize=13 cr.TextTransparency=1 cr.
TextXAlignment=Enum.TextXAlignment.Left cr.TextYAlignment=Enum.TextYAlignment.
Top cr.AnchorPoint=Vector2.new(0,0.5)cr.AutomaticSize=Enum.AutomaticSize.Y cr.
BackgroundColor3=Color3.fromRGB(255,255,255)cr.BackgroundTransparency=1 cr.
BorderColor3=Color3.fromRGB(0,0,0)cr.BorderSizePixel=0 cr.LayoutOrder=-1 cr.
Position=UDim2.fromScale(1.3e-7,0.5)cr.Size=UDim2.fromOffset(-10,0)cr.Parent=cn
cn.Parent=b5 b5.Parent=bZ bY[cm]={Index=cl,Button=cn,NameLabel=cp,Checkmark=cr}
local cs={duration=0.2,easingStyle=Enum.EasingStyle.Quint,transparencyIn=0.2,
transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-cq.Padding.Offset,
waitTime=1}local ct,cu={checkIn=e(cr,TweenInfo.new(cs.duration,cs.easingStyle),{
Size=UDim2.new(cr.Size.X.Scale,cs.checkSizeIncrease,cr.Size.Y.Scale,cr.Size.Y.
Offset)}),checkOut=e(cr,TweenInfo.new(cs.duration,cs.easingStyle),{Size=UDim2.
new(cr.Size.X.Scale,cs.checkSizeDecrease,cr.Size.Y.Scale,cr.Size.Y.Offset)}),
nameIn=e(cp,TweenInfo.new(cs.duration,cs.easingStyle),{TextTransparency=cs.
transparencyIn}),nameOut=e(cp,TweenInfo.new(cs.duration,cs.easingStyle),{
TextTransparency=cs.transparencyOut})},false if bW.Settings.Default then if bW.
Settings.Multi then cu=table.find(bW.Settings.Default,cm)and true or false else
cu=(bW.Settings.Default==cl)and true or false end end ch(cm,cu)local cv=bY[cm].
Button cv.MouseButton1Click:Connect(function()local cw=table.find(bX,cm)and true
or false local cx=not cw if bW.Settings.Required and not cx and#bX<=1 then
return end ch(cm,cx)task.spawn(function()if bW.Settings.Multi then local cy={}
for cz,cA in ipairs(bX)do cy[cA]=true end if bW.Settings.Callback then bW.
Settings.Callback(cy)end else if cx and bW.Settings.Callback then bW.Settings.
Callback(bX[1]or nil)end end end)end)if ci then bZ.Size=UDim2.new(1,0,0,cd())end
end if bW.Settings.Options then for cm,co in pairs(bW.Settings.Options)do cl(cm,
co)end end function bW:UpdateName(cm)b1.Text=cm end function bW:SetVisibility(cm
)bZ.Visible=cm end function bW:UpdateSelection(cm)if not cm then return end for
co,cp in pairs(bY)do ch(co,false)end local co={}if type(cm)=='number'then for cp
,cq in pairs(bY)do local cr=cq.Index==cm ch(cp,cr)if cr then table.insert(co,cp)
end end elseif type(cm)=='string'then for cp,cq in pairs(bY)do local cr=cp==cm
ch(cp,cr)if cr then table.insert(co,cp)end end elseif type(cm)=='table'then for
cp,cq in pairs(bY)do local cr=table.find(cm,cp)~=nil ch(cp,cr)if cr then table.
insert(co,cp)end end end if bW.Settings.Callback then if bW.Settings.Multi then
local cp={}for cq,cr in ipairs(co)do cp[cr]=true end bW.Settings.Callback(cp)
else bW.Settings.Callback(co[1]or nil)end end end function bW:InsertOptions(cm)
if not cm then return end bW.Settings.Options=cm for co,cp in pairs(cm)do cl(co,
cp)end end function bW:ClearOptions()for cm,co in pairs(bY)do co.Button:Destroy(
)end bY={}bX={}if ci then bZ.Size=UDim2.new(1,0,0,cd())end end function bW:
GetOptions()local cm={}for co,cp in pairs(bY)do local cq=table.find(bX,co)and
true or false cm[co]=cq end return cm end function bW:RemoveOptions(cm)if not cm
then return end for co,cp in ipairs(cm)do local cq=bY[cp]if cq then for cr=#bX,1
,-1 do if bX[cr]==cp then table.remove(bX,cr)end end cq.Button:Destroy()bY[cp]=
nil end end if ci then bZ.Size=UDim2.new(1,0,0,cd())end end function bW:IsOption
(cm)if not cm then return end return bY[cm]~=nil end if bV then aa.Options[bV]=
bW end return bW end function bO:Colorpicker(bU,bV)local bW={Settings=bU,
IgnoreConfig=false,Class='Colorpicker'}local bX=bW.Settings.Alpha and true or
false bW.Color=bW.Settings.Default bW.Alpha=bX and bW.Settings.Alpha local bY=
Instance.new'Frame'bY.Name='Colorpicker'bY.AutomaticSize=Enum.AutomaticSize.Y bY
.BackgroundColor3=Color3.fromRGB(0,0,0)bY.BackgroundTransparency=1 bY.
BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Size=UDim2.new(1,0,0,
38)bY.Parent=bP local bZ=Instance.new'TextLabel'bZ.Name='KeybindName'bZ.FontFace
=Font.new(an.interFont)bZ.Text=bU.Name bZ.TextColor3=Color3.fromRGB(255,255,255)
bZ.TextSize=13 bZ.TextTransparency=0.5 bZ.RichText=true bZ.TextTruncate=Enum.
TextTruncate.AtEnd bZ.TextXAlignment=Enum.TextXAlignment.Left bZ.TextYAlignment=
Enum.TextYAlignment.Top bZ.AnchorPoint=Vector2.new(0,0.5)bZ.AutomaticSize=Enum.
AutomaticSize.XY bZ.BackgroundColor3=Color3.fromRGB(255,255,255)bZ.
BackgroundTransparency=1 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel
=0 bZ.Position=UDim2.fromScale(0,0.5)bZ.Parent=bY local b_=Instance.new
'ImageLabel'b_.Name='NewColor'b_.Image=an.grid b_.ScaleType=Enum.ScaleType.Tile
b_.TileSize=UDim2.fromOffset(500,500)b_.AnchorPoint=Vector2.new(1,0.5)b_.
BackgroundColor3=Color3.fromRGB(255,255,255)b_.BackgroundTransparency=1 b_.
BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel=0 b_.Position=UDim2.
fromScale(1,0.5)b_.Size=UDim2.fromOffset(21,21)local b0=Instance.new'Frame'b0.
Name='Color'b0.AnchorPoint=Vector2.new(0.5,0.5)b0.BackgroundColor3=bW.Color b0.
BorderSizePixel=0 b0.Position=UDim2.fromScale(0.5,0.5)b0.Size=UDim2.fromScale(1,
1)b0.BackgroundTransparency=bW.Alpha or 0 local b1=Instance.new'UICorner'b1.Name
='UICorner'b1.CornerRadius=UDim.new(0,6)b1.Parent=b0 local b2=Instance.new
'TextButton'b2.Name='Interact'b2.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'b2.Text=''b2.TextColor3=Color3.
fromRGB(0,0,0)b2.TextSize=14 b2.BackgroundColor3=Color3.fromRGB(255,255,255)b2.
BackgroundTransparency=1 b2.BorderColor3=Color3.fromRGB(0,0,0)b2.BorderSizePixel
=0 b2.Size=UDim2.fromScale(1,1)b2.Parent=b0 b0.Parent=b_ local b3=Instance.new
'UICorner'b3.Name='UICorner'b3.CornerRadius=UDim.new(0,8)b3.Parent=b_ b_.Parent=
bY local b4=Instance.new'Frame'b4.Name='ColorPicker'b4.BackgroundColor3=Color3.
fromRGB(0,0,0)b4.BackgroundTransparency=0.5 b4.BorderColor3=Color3.fromRGB(0,0,0
)b4.BorderSizePixel=0 b4.Size=UDim2.fromScale(1,1)b4.Visible=false local b5=
Instance.new'UICorner'b5.Name='BaseUICorner'b5.CornerRadius=UDim.new(0,10)b5.
Parent=b4 local b6=Instance.new'Frame'b6.Name='Prompt'b6.AnchorPoint=Vector2.
new(0.5,0.5)b6.AutomaticSize=Enum.AutomaticSize.Y b6.BackgroundColor3=Color3.
fromRGB(15,15,15)b6.BorderColor3=Color3.fromRGB(0,0,0)b6.BorderSizePixel=0 b6.
Position=UDim2.fromScale(0.5,0.5)b6.Size=UDim2.fromOffset(420,0)local b7=
Instance.new'UIScale'b7.Name='BaseUIScale'b7.Parent=b6 b7.Scale=0.95 local b8=
Instance.new'UIStroke'b8.Name='GlobalSettingsUIStroke'b8.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border b8.Color=Color3.fromRGB(255,255,255)b8.Transparency=0.9
b8.Parent=b6 local b9=Instance.new'UICorner'b9.Name='GlobalSettingsUICorner'b9.
CornerRadius=UDim.new(0,10)b9.Parent=b6 local ca=Instance.new'UIListLayout'ca.
Name='UIListLayout'ca.Padding=UDim.new(0,10)ca.HorizontalAlignment=Enum.
HorizontalAlignment.Center ca.SortOrder=Enum.SortOrder.LayoutOrder ca.Parent=b6
local cb=Instance.new'Frame'cb.Name='ColorOptions'cb.AutomaticSize=Enum.
AutomaticSize.XY cb.BackgroundColor3=Color3.fromRGB(255,255,255)cb.
BackgroundTransparency=1 cb.BorderColor3=Color3.fromRGB(0,0,0)cb.BorderSizePixel
=0 cb.LayoutOrder=1 cb.Size=UDim2.fromScale(1,0)local cc=Instance.new
'TextButton'cc.Name='Value'cc.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'cc.Text=''cc.TextColor3=Color3.
fromRGB(0,0,0)cc.TextSize=14 cc.AutoButtonColor=false cc.BackgroundColor3=Color3
.fromRGB(255,255,255)cc.BorderColor3=Color3.fromRGB(0,0,0)cc.BorderSizePixel=0
cc.LayoutOrder=1 cc.Position=UDim2.fromScale(0.092,0.886)cc.Size=UDim2.new(1,0,0
,15)local cd=Instance.new'UIGradient'cd.Name='UIGradient'cd.Color=ColorSequence.
new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))}cd.Parent=cc local ce=
Instance.new'Frame'ce.Name='Slide'ce.AnchorPoint=Vector2.new(0,0.5)ce.
BackgroundColor3=Color3.fromRGB(255,255,255)ce.BorderColor3=Color3.fromRGB(27,42
,53)ce.BorderSizePixel=0 ce.Position=UDim2.fromScale(0,0.5)ce.Size=UDim2.new(0,
13,1,8)local cf=Instance.new'UICorner'cf.Name='UICorner'cf.CornerRadius=UDim.
new(1,0)cf.Parent=ce local cg=Instance.new'UIStroke'cg.Name='UIStroke'cg.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border cg.Transparency=0.5 cg.Parent=ce ce.
Parent=cc local ch=Instance.new'UICorner'ch.Name='UICorner'ch.CornerRadius=UDim.
new(0,6)ch.Parent=cc local ci=Instance.new'UIStroke'ci.Name='UIStroke'ci.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border ci.Color=Color3.fromRGB(255,255,255)
ci.Transparency=0.9 local cj=Instance.new'UIGradient'cj.Name='UIGradient'cj.
Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255))
,ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))}cj.Rotation=180 cj.Parent=ci
ci.Parent=cc cc.Parent=cb local ck=Instance.new'UIListLayout'ck.Name=
'UIListLayout'ck.Padding=UDim.new(0,25)ck.SortOrder=Enum.SortOrder.LayoutOrder
ck.Parent=cb local cl=Instance.new'Frame'cl.Name='Wheel'cl.AutomaticSize=Enum.
AutomaticSize.Y cl.BackgroundColor3=Color3.fromRGB(255,255,255)cl.
BackgroundTransparency=1 cl.BorderColor3=Color3.fromRGB(0,0,0)cl.BorderSizePixel
=0 cl.Size=UDim2.new(1,0,0,100)local cm=Instance.new'ImageButton'cm.Name='Wheel'
cm.Image=an.colorWheel cm.AutoButtonColor=false cm.Active=false cm.
BackgroundColor3=Color3.fromRGB(248,248,248)cm.BackgroundTransparency=1 cm.
BorderColor3=Color3.fromRGB(27,42,53)cm.Selectable=false cm.Size=UDim2.
fromOffset(220,220)cm.SizeConstraint=Enum.SizeConstraint.RelativeYY local co=
Instance.new'ImageLabel'co.Name='Target'co.Image=an.colorTarget co.ImageColor3=
Color3.fromRGB(0,0,0)co.AnchorPoint=Vector2.new(0.5,0.5)co.BackgroundColor3=
Color3.fromRGB(255,255,255)co.BackgroundTransparency=1 co.BorderColor3=Color3.
fromRGB(27,42,53)co.Position=UDim2.fromScale(0.5,0.5)co.Size=UDim2.fromOffset(22
,22)co.SizeConstraint=Enum.SizeConstraint.RelativeYY co.Parent=cm cm.Parent=cl
local cp=Instance.new'Frame'cp.Name='Inputs'cp.AnchorPoint=Vector2.new(1,0.5)cp.
AutomaticSize=Enum.AutomaticSize.XY cp.BackgroundColor3=Color3.fromRGB(255,255,
255)cp.BackgroundTransparency=1 cp.BorderColor3=Color3.fromRGB(0,0,0)cp.
BorderSizePixel=0 cp.LayoutOrder=1 cp.Position=UDim2.fromScale(1,0.5)local cq=
Instance.new'UIListLayout'cq.Name='UIListLayout'cq.Padding=UDim.new(0,5)cq.
SortOrder=Enum.SortOrder.LayoutOrder cq.Parent=cp local cr=Instance.new'Frame'cr
.Name='Red'cr.AutomaticSize=Enum.AutomaticSize.XY cr.BackgroundColor3=Color3.
fromRGB(0,0,0)cr.BackgroundTransparency=1 cr.BorderColor3=Color3.fromRGB(0,0,0)
cr.BorderSizePixel=0 cr.LayoutOrder=1 cr.Size=UDim2.fromOffset(0,38)local cs=
Instance.new'TextLabel'cs.Name='InputName'cs.FontFace=Font.new(an.interFont)cs.
Text='Red'cs.TextColor3=Color3.fromRGB(255,255,255)cs.TextSize=13 cs.
TextTransparency=0.5 cs.TextTruncate=Enum.TextTruncate.AtEnd cs.TextXAlignment=
Enum.TextXAlignment.Left cs.TextYAlignment=Enum.TextYAlignment.Top cs.
AnchorPoint=Vector2.new(0,0.5)cs.AutomaticSize=Enum.AutomaticSize.XY cs.
BackgroundColor3=Color3.fromRGB(255,255,255)cs.BackgroundTransparency=1 cs.
BorderColor3=Color3.fromRGB(0,0,0)cs.BorderSizePixel=0 cs.LayoutOrder=2 cs.
Position=UDim2.fromScale(0,0.5)cs.Parent=cr local ct=Instance.new'UIListLayout'
ct.Name='UIListLayout'ct.Padding=UDim.new(0,15)ct.FillDirection=Enum.
FillDirection.Horizontal ct.SortOrder=Enum.SortOrder.LayoutOrder ct.
VerticalAlignment=Enum.VerticalAlignment.Center ct.Parent=cr local cu=Instance.
new'TextBox'cu.Name='InputBox'cu.ClearTextOnFocus=false cu.CursorPosition=-1 cu.
FontFace=Font.new(an.interFont)cu.Text='255'cu.TextColor3=Color3.fromRGB(255,255
,255)cu.TextSize=12 cu.TextTransparency=0.1 cu.TextXAlignment=Enum.
TextXAlignment.Left cu.AnchorPoint=Vector2.new(1,0.5)cu.BackgroundColor3=Color3.
fromRGB(255,255,255)cu.BackgroundTransparency=0.95 cu.BorderColor3=Color3.
fromRGB(0,0,0)cu.BorderSizePixel=0 cu.ClipsDescendants=true cu.LayoutOrder=1 cu.
Position=UDim2.fromScale(1,0.5)cu.Size=UDim2.fromOffset(75,25)local cv=Instance.
new'UICorner'cv.Name='InputBoxUICorner'cv.CornerRadius=UDim.new(0,4)cv.Parent=cu
local cw=Instance.new'UIStroke'cw.Name='InputBoxUIStroke'cw.ApplyStrokeMode=Enum
.ApplyStrokeMode.Border cw.Color=Color3.fromRGB(255,255,255)cw.Transparency=0.9
cw.Parent=cu local cx=Instance.new'UISizeConstraint'cx.Name=
'InputBoxUISizeConstraint'cx.Parent=cu local cy=Instance.new'UIPadding'cy.Name=
'InputBoxUIPadding'cy.PaddingLeft=UDim.new(0,8)cy.PaddingRight=UDim.new(0,10)cy.
Parent=cu cu.Parent=cr cr.Parent=cp local cz=Instance.new'Frame'cz.Name='Green'
cz.AutomaticSize=Enum.AutomaticSize.XY cz.BackgroundColor3=Color3.fromRGB(0,0,0)
cz.BackgroundTransparency=1 cz.BorderColor3=Color3.fromRGB(0,0,0)cz.
BorderSizePixel=0 cz.LayoutOrder=2 cz.Size=UDim2.fromOffset(0,38)local cA=
Instance.new'TextLabel'cA.Name='InputName'cA.FontFace=Font.new(an.interFont)cA.
Text='Green'cA.TextColor3=Color3.fromRGB(255,255,255)cA.TextSize=13 cA.
TextTransparency=0.5 cA.TextTruncate=Enum.TextTruncate.AtEnd cA.TextXAlignment=
Enum.TextXAlignment.Left cA.TextYAlignment=Enum.TextYAlignment.Top cA.
AnchorPoint=Vector2.new(0,0.5)cA.AutomaticSize=Enum.AutomaticSize.XY cA.
BackgroundColor3=Color3.fromRGB(255,255,255)cA.BackgroundTransparency=1 cA.
BorderColor3=Color3.fromRGB(0,0,0)cA.BorderSizePixel=0 cA.LayoutOrder=2 cA.
Position=UDim2.fromScale(0,0.5)cA.Parent=cz local cB=Instance.new'UIListLayout'
cB.Name='UIListLayout'cB.Padding=UDim.new(0,15)cB.FillDirection=Enum.
FillDirection.Horizontal cB.SortOrder=Enum.SortOrder.LayoutOrder cB.
VerticalAlignment=Enum.VerticalAlignment.Center cB.Parent=cz local cC=Instance.
new'TextBox'cC.Name='InputBox'cC.ClearTextOnFocus=false cC.FontFace=Font.new(an.
interFont)cC.Text='255'cC.TextColor3=Color3.fromRGB(255,255,255)cC.TextSize=12
cC.TextTransparency=0.1 cC.TextXAlignment=Enum.TextXAlignment.Left cC.
AnchorPoint=Vector2.new(1,0.5)cC.BackgroundColor3=Color3.fromRGB(255,255,255)cC.
BackgroundTransparency=0.95 cC.BorderColor3=Color3.fromRGB(0,0,0)cC.
BorderSizePixel=0 cC.ClipsDescendants=true cC.LayoutOrder=1 cC.Position=UDim2.
fromScale(1,0.5)cC.Size=UDim2.fromOffset(75,25)local cD=Instance.new'UICorner'cD
.Name='InputBoxUICorner'cD.CornerRadius=UDim.new(0,4)cD.Parent=cC local cE=
Instance.new'UIStroke'cE.Name='InputBoxUIStroke'cE.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cE.Color=Color3.fromRGB(255,255,255)cE.Transparency=0.9
cE.Parent=cC local cF=Instance.new'UISizeConstraint'cF.Name=
'InputBoxUISizeConstraint'cF.Parent=cC local cG=Instance.new'UIPadding'cG.Name=
'InputBoxUIPadding'cG.PaddingLeft=UDim.new(0,8)cG.PaddingRight=UDim.new(0,10)cG.
Parent=cC cC.Parent=cz cz.Parent=cp local cH=Instance.new'Frame'cH.Name='Blue'cH
.AutomaticSize=Enum.AutomaticSize.XY cH.BackgroundColor3=Color3.fromRGB(0,0,0)cH
.BackgroundTransparency=1 cH.BorderColor3=Color3.fromRGB(0,0,0)cH.
BorderSizePixel=0 cH.LayoutOrder=3 cH.Size=UDim2.fromOffset(0,38)local cI=
Instance.new'TextLabel'cI.Name='InputName'cI.FontFace=Font.new(an.interFont)cI.
Text='Blue'cI.TextColor3=Color3.fromRGB(255,255,255)cI.TextSize=13 cI.
TextTransparency=0.5 cI.TextTruncate=Enum.TextTruncate.AtEnd cI.TextXAlignment=
Enum.TextXAlignment.Left cI.TextYAlignment=Enum.TextYAlignment.Top cI.
AnchorPoint=Vector2.new(0,0.5)cI.AutomaticSize=Enum.AutomaticSize.XY cI.
BackgroundColor3=Color3.fromRGB(255,255,255)cI.BackgroundTransparency=1 cI.
BorderColor3=Color3.fromRGB(0,0,0)cI.BorderSizePixel=0 cI.LayoutOrder=2 cI.
Position=UDim2.fromScale(0,0.5)cI.Parent=cH local cJ=Instance.new'UIListLayout'
cJ.Name='UIListLayout'cJ.Padding=UDim.new(0,15)cJ.FillDirection=Enum.
FillDirection.Horizontal cJ.SortOrder=Enum.SortOrder.LayoutOrder cJ.
VerticalAlignment=Enum.VerticalAlignment.Center cJ.Parent=cH local cK=Instance.
new'TextBox'cK.Name='InputBox'cK.ClearTextOnFocus=false cK.FontFace=Font.new(an.
interFont)cK.Text='255'cK.TextColor3=Color3.fromRGB(255,255,255)cK.TextSize=12
cK.TextTransparency=0.1 cK.TextXAlignment=Enum.TextXAlignment.Left cK.
AnchorPoint=Vector2.new(1,0.5)cK.BackgroundColor3=Color3.fromRGB(255,255,255)cK.
BackgroundTransparency=0.95 cK.BorderColor3=Color3.fromRGB(0,0,0)cK.
BorderSizePixel=0 cK.ClipsDescendants=true cK.LayoutOrder=1 cK.Position=UDim2.
fromScale(1,0.5)cK.Size=UDim2.fromOffset(75,25)local cL=Instance.new'UICorner'cL
.Name='InputBoxUICorner'cL.CornerRadius=UDim.new(0,4)cL.Parent=cK local cM=
Instance.new'UIStroke'cM.Name='InputBoxUIStroke'cM.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cM.Color=Color3.fromRGB(255,255,255)cM.Transparency=0.9
cM.Parent=cK local cN=Instance.new'UISizeConstraint'cN.Name=
'InputBoxUISizeConstraint'cN.Parent=cK local cO=Instance.new'UIPadding'cO.Name=
'InputBoxUIPadding'cO.PaddingLeft=UDim.new(0,8)cO.PaddingRight=UDim.new(0,10)cO.
Parent=cK cK.Parent=cH cH.Parent=cp local cP=Instance.new'Frame'cP.Name='Alpha'
cP.AutomaticSize=Enum.AutomaticSize.XY cP.BackgroundColor3=Color3.fromRGB(0,0,0)
cP.BackgroundTransparency=1 cP.BorderColor3=Color3.fromRGB(0,0,0)cP.
BorderSizePixel=0 cP.LayoutOrder=4 cP.Size=UDim2.fromOffset(0,38)cP.Visible=bX
local cQ=Instance.new'TextLabel'cQ.Name='InputName'cQ.FontFace=Font.new(an.
interFont)cQ.Text='Alpha'cQ.TextColor3=Color3.fromRGB(255,255,255)cQ.TextSize=13
cQ.TextTransparency=0.5 cQ.TextTruncate=Enum.TextTruncate.AtEnd cQ.
TextXAlignment=Enum.TextXAlignment.Left cQ.TextYAlignment=Enum.TextYAlignment.
Top cQ.AnchorPoint=Vector2.new(0,0.5)cQ.AutomaticSize=Enum.AutomaticSize.XY cQ.
BackgroundColor3=Color3.fromRGB(255,255,255)cQ.BackgroundTransparency=1 cQ.
BorderColor3=Color3.fromRGB(0,0,0)cQ.BorderSizePixel=0 cQ.LayoutOrder=2 cQ.
Position=UDim2.fromScale(0,0.5)cQ.Parent=cP local cR=Instance.new'UIListLayout'
cR.Name='UIListLayout'cR.Padding=UDim.new(0,15)cR.FillDirection=Enum.
FillDirection.Horizontal cR.SortOrder=Enum.SortOrder.LayoutOrder cR.
VerticalAlignment=Enum.VerticalAlignment.Center cR.Parent=cP local cS=Instance.
new'TextBox'cS.Name='InputBox'cS.ClearTextOnFocus=false cS.FontFace=Font.new(an.
interFont)cS.Text='0'cS.TextColor3=Color3.fromRGB(255,255,255)cS.TextSize=12 cS.
TextTransparency=0.1 cS.TextXAlignment=Enum.TextXAlignment.Left cS.AnchorPoint=
Vector2.new(1,0.5)cS.BackgroundColor3=Color3.fromRGB(255,255,255)cS.
BackgroundTransparency=0.95 cS.BorderColor3=Color3.fromRGB(0,0,0)cS.
BorderSizePixel=0 cS.ClipsDescendants=true cS.LayoutOrder=1 cS.Position=UDim2.
fromScale(1,0.5)cS.Size=UDim2.fromOffset(75,25)local cT=Instance.new'UICorner'cT
.Name='InputBoxUICorner'cT.CornerRadius=UDim.new(0,4)cT.Parent=cS local cU=
Instance.new'UIStroke'cU.Name='InputBoxUIStroke'cU.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cU.Color=Color3.fromRGB(255,255,255)cU.Transparency=0.9
cU.Parent=cS local cV=Instance.new'UISizeConstraint'cV.Name=
'InputBoxUISizeConstraint'cV.Parent=cS local cW=Instance.new'UIPadding'cW.Name=
'InputBoxUIPadding'cW.PaddingLeft=UDim.new(0,8)cW.PaddingRight=UDim.new(0,10)cW.
Parent=cS cS.Parent=cP cP.Parent=cp local cX=Instance.new'Frame'cX.Name='Hex'cX.
AutomaticSize=Enum.AutomaticSize.XY cX.BackgroundColor3=Color3.fromRGB(0,0,0)cX.
BackgroundTransparency=1 cX.BorderColor3=Color3.fromRGB(0,0,0)cX.BorderSizePixel
=0 cX.Size=UDim2.fromOffset(0,38)local cY=Instance.new'TextLabel'cY.Name=
'InputName'cY.FontFace=Font.new(an.interFont)cY.Text='Hex'cY.TextColor3=Color3.
fromRGB(255,255,255)cY.TextSize=13 cY.TextTransparency=0.5 cY.TextTruncate=Enum.
TextTruncate.AtEnd cY.TextXAlignment=Enum.TextXAlignment.Left cY.TextYAlignment=
Enum.TextYAlignment.Top cY.AnchorPoint=Vector2.new(0,0.5)cY.AutomaticSize=Enum.
AutomaticSize.XY cY.BackgroundColor3=Color3.fromRGB(255,255,255)cY.
BackgroundTransparency=1 cY.BorderColor3=Color3.fromRGB(0,0,0)cY.BorderSizePixel
=0 cY.LayoutOrder=2 cY.Position=UDim2.fromScale(0,0.5)cY.Parent=cX local cZ=
Instance.new'UIListLayout'cZ.Name='UIListLayout'cZ.Padding=UDim.new(0,15)cZ.
FillDirection=Enum.FillDirection.Horizontal cZ.SortOrder=Enum.SortOrder.
LayoutOrder cZ.VerticalAlignment=Enum.VerticalAlignment.Center cZ.Parent=cX
local c_=Instance.new'TextBox'c_.Name='InputBox'c_.ClearTextOnFocus=false c_.
CursorPosition=-1 c_.FontFace=Font.new(an.interFont)c_.Text='255'c_.TextColor3=
Color3.fromRGB(255,255,255)c_.TextSize=12 c_.TextTransparency=0.1 c_.
TextXAlignment=Enum.TextXAlignment.Left c_.AnchorPoint=Vector2.new(1,0.5)c_.
BackgroundColor3=Color3.fromRGB(255,255,255)c_.BackgroundTransparency=0.95 c_.
BorderColor3=Color3.fromRGB(0,0,0)c_.BorderSizePixel=0 c_.ClipsDescendants=true
c_.LayoutOrder=1 c_.Position=UDim2.fromScale(1,0.5)c_.Size=UDim2.fromOffset(75,
25)local c0=Instance.new'UICorner'c0.Name='InputBoxUICorner'c0.CornerRadius=UDim
.new(0,4)c0.Parent=c_ local c1=Instance.new'UIStroke'c1.Name='InputBoxUIStroke'
c1.ApplyStrokeMode=Enum.ApplyStrokeMode.Border c1.Color=Color3.fromRGB(255,255,
255)c1.Transparency=0.9 c1.Parent=c_ local c2=Instance.new'UISizeConstraint'c2.
Name='InputBoxUISizeConstraint'c2.Parent=c_ local c3=Instance.new'UIPadding'c3.
Name='InputBoxUIPadding'c3.PaddingLeft=UDim.new(0,8)c3.PaddingRight=UDim.new(0,
10)c3.Parent=c_ c_.Parent=cX cX.Parent=cp cp.Parent=cl local c4=Instance.new
'UIPadding'c4.Name='UIPadding'c4.PaddingRight=UDim.new(0,5)c4.Parent=cl cl.
Parent=cb local c5=Instance.new'Frame'c5.Name='ColorWells'c5.AutomaticSize=Enum.
AutomaticSize.Y c5.BackgroundColor3=Color3.fromRGB(255,255,255)c5.
BackgroundTransparency=1 c5.BorderColor3=Color3.fromRGB(0,0,0)c5.BorderSizePixel
=0 c5.LayoutOrder=2 c5.Size=UDim2.fromScale(1,0)local c6=Instance.new
'UIGridLayout'c6.Name='UIGridLayout'c6.CellPadding=UDim2.fromOffset(10,0)c6.
CellSize=UDim2.new(0.5,-5,0,30)c6.SortOrder=Enum.SortOrder.LayoutOrder c6.Parent
=c5 local c7=Instance.new'ImageLabel'c7.Name='NewColor'c7.Image=an.grid c7.
ScaleType=Enum.ScaleType.Tile c7.TileSize=UDim2.fromOffset(500,500)c7.
BackgroundColor3=Color3.fromRGB(255,255,255)c7.BackgroundTransparency=1 c7.
BorderColor3=Color3.fromRGB(0,0,0)c7.BorderSizePixel=0 c7.Size=UDim2.fromOffset(
100,100)local c8=Instance.new'UICorner'c8.Name='UICorner'c8.Parent=c7 local c9=
Instance.new'Frame'c9.Name='Color'c9.AnchorPoint=Vector2.new(0.5,0.5)c9.
BorderColor3=Color3.fromRGB(27,42,53)c9.BorderSizePixel=0 c9.Position=UDim2.
fromScale(0.5,0.5)c9.Size=UDim2.new(1,1,1,1)local da=Instance.new'UICorner'da.
Name='UICorner'da.Parent=c9 c9.Parent=c7 c7.Parent=c5 local db=Instance.new
'ImageLabel'db.Name='OldColor'db.Image=an.grid db.ScaleType=Enum.ScaleType.Tile
db.TileSize=UDim2.fromOffset(500,500)db.BackgroundColor3=Color3.fromRGB(255,255,
255)db.BackgroundTransparency=1 db.BorderColor3=Color3.fromRGB(0,0,0)db.
BorderSizePixel=0 db.LayoutOrder=1 db.Size=UDim2.fromOffset(100,100)local dc=
Instance.new'UICorner'dc.Name='UICorner'dc.Parent=db local dd=Instance.new
'Frame'dd.Name='Color'dd.AnchorPoint=Vector2.new(0.5,0.5)dd.BorderColor3=Color3.
fromRGB(27,42,53)dd.BorderSizePixel=0 dd.Position=UDim2.fromScale(0.5,0.5)dd.
Size=UDim2.new(1,1,1,1)local de=Instance.new'UICorner'de.Name='UICorner'de.
Parent=dd dd.Parent=db db.Parent=c5 c5.Parent=cb cb.Parent=b6 local df=Instance.
new'Frame'df.Name='Interactions'df.AutomaticSize=Enum.AutomaticSize.Y df.
BackgroundColor3=Color3.fromRGB(0,0,0)df.BackgroundTransparency=1 df.
BorderColor3=Color3.fromRGB(0,0,0)df.BorderSizePixel=0 df.LayoutOrder=2 df.Size=
UDim2.fromScale(1,0)local dg=Instance.new'UIListLayout'dg.Name='UIListLayout'dg.
Padding=UDim.new(0,10)dg.SortOrder=Enum.SortOrder.LayoutOrder dg.Parent=df local
dh=Instance.new'TextButton'dh.Name='Confirm'dh.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.Medium,Enum.FontStyle.Normal)dh.Text=
'Confirm'dh.TextColor3=Color3.fromRGB(255,255,255)dh.TextSize=15 dh.
TextTransparency=0.5 dh.TextTruncate=Enum.TextTruncate.AtEnd dh.AutoButtonColor=
false dh.AutomaticSize=Enum.AutomaticSize.Y dh.BackgroundColor3=Color3.fromRGB(
25,25,25)dh.BorderColor3=Color3.fromRGB(0,0,0)dh.BorderSizePixel=0 dh.Size=UDim2
.fromScale(1,0)local di=Instance.new'UIPadding'di.Name='UIPadding'di.
PaddingBottom=UDim.new(0,9)di.PaddingLeft=UDim.new(0,10)di.PaddingRight=UDim.
new(0,10)di.PaddingTop=UDim.new(0,9)di.Parent=dh local dj=Instance.new'UICorner'
dj.Name='BaseUICorner'dj.CornerRadius=UDim.new(0,10)dj.Parent=dh dh.Parent=df
local dk=Instance.new'TextButton'dk.Name='Cancel'dk.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.Medium,Enum.FontStyle.Normal)dk.Text=
'Cancel'dk.TextColor3=Color3.fromRGB(255,255,255)dk.TextSize=15 dk.
TextTransparency=0.5 dk.TextTruncate=Enum.TextTruncate.AtEnd dk.AutoButtonColor=
false dk.AutomaticSize=Enum.AutomaticSize.Y dk.BackgroundColor3=Color3.fromRGB(
25,25,25)dk.BorderColor3=Color3.fromRGB(0,0,0)dk.BorderSizePixel=0 dk.Size=UDim2
.fromScale(1,0)local dl=Instance.new'UICorner'dl.Name='BaseUICorner'dl.
CornerRadius=UDim.new(0,10)dl.Parent=dk local dm=Instance.new'UIPadding'dm.Name=
'UIPadding'dm.PaddingBottom=UDim.new(0,9)dm.PaddingLeft=UDim.new(0,10)dm.
PaddingRight=UDim.new(0,10)dm.PaddingTop=UDim.new(0,9)dm.Parent=dk dk.Parent=df
local dn=Instance.new'UIPadding'dn.Name='UIPadding'dn.PaddingTop=UDim.new(0,10)
dn.Parent=df df.Parent=b6 local dp=Instance.new'UIPadding'dp.Name=
'GlobalSettingsUIPadding'dp.PaddingBottom=UDim.new(0,20)dp.PaddingLeft=UDim.new(
0,20)dp.PaddingRight=UDim.new(0,20)dp.PaddingTop=UDim.new(0,20)dp.Parent=b6
local dq=Instance.new'Frame'dq.Name='Paragraph'dq.AutomaticSize=Enum.
AutomaticSize.Y dq.BackgroundColor3=Color3.fromRGB(0,0,0)dq.
BackgroundTransparency=1 dq.BorderColor3=Color3.fromRGB(0,0,0)dq.BorderSizePixel
=0 dq.Size=UDim2.fromScale(1,0)local dr=Instance.new'TextLabel'dr.Name=
'ParagraphHeader'dr.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight
.SemiBold,Enum.FontStyle.Normal)dr.RichText=true dr.Text=bW.Settings.Name dr.
TextColor3=Color3.fromRGB(255,255,255)dr.TextSize=18 dr.TextTransparency=0.4 dr.
TextWrapped=true dr.TextYAlignment=Enum.TextYAlignment.Top dr.AutomaticSize=Enum
.AutomaticSize.XY dr.BackgroundColor3=Color3.fromRGB(255,255,255)dr.
BackgroundTransparency=1 dr.BorderColor3=Color3.fromRGB(0,0,0)dr.BorderSizePixel
=0 dr.Size=UDim2.fromScale(1,0)dr.Parent=dq local ds=Instance.new'UIListLayout'
ds.Name='UIListLayout'ds.Padding=UDim.new(0,15)ds.HorizontalAlignment=Enum.
HorizontalAlignment.Center ds.SortOrder=Enum.SortOrder.LayoutOrder ds.Parent=dq
local dt=Instance.new'UIPadding'dt.Name='UIPadding'dt.PaddingBottom=UDim.new(0,
15)dt.Parent=dq local du=Instance.new'Frame'du.Name='Line'du.BackgroundColor3=
Color3.fromRGB(255,255,255)du.BackgroundTransparency=0.9 du.BorderColor3=Color3.
fromRGB(0,0,0)du.BorderSizePixel=0 du.LayoutOrder=1 du.Size=UDim2.new(1,0,0,1)du
.Parent=dq dq.Parent=b6 b6.Parent=b4 b4.Parent=l local dv,dw,dx,dy,dz,dA,dB,dC,
dD,dE,dF,dG,dH,dI,dJ,dK,dL,dM,dN=Color3.fromHSV,Color3.fromRGB,Vector2.new,UDim2
.new,cm,co,cc,c9,{Hex=cX.InputBox,Red=cr.InputBox,Green=cz.InputBox,Blue=cH.
InputBox,Alpha=cP.InputBox},aj:GetMouse(),false,false,0,0,1,function(dv)return
math.atan2(dv.y,dv.x),dv.magnitude end,function(dv)return((dv+math.pi)/(2*math.
pi))*360 end,function(dv)return dv*(math.pi/180)end,function(dv)dv=dv:gsub('#',
'')if#dv~=6 then return 0,0,0 end local dw,dx,dy=tonumber(dv:sub(1,2),16)or 0,
tonumber(dv:sub(3,4),16)or 0,tonumber(dv:sub(5,6),16)or 0 return dw,dx,dy end
local dO=function(dO,dP,dQ)local dR=tonumber(dO)if dR then return math.clamp(dR,
dP,dQ)end return dP end local dP=function()local dP=dv(dH,dI,dJ)dC.
BackgroundColor3=dP dC.BackgroundTransparency=dO(dD.Alpha.Text,0,1)dD.Red.Text=
tostring(math.floor(dP.r*255+0.5))dD.Green.Text=tostring(math.floor(dP.g*255+0.5
))dD.Blue.Text=tostring(math.floor(dP.b*255+0.5))dD.Alpha.Text=dO(dD.Alpha.Text,
0,1)local dQ=string.format('#%02X%02X%02X',math.floor(dP.r*255+0.5),math.floor(
dP.g*255+0.5),math.floor(dP.b*255+0.5))dD.Hex.Text=dQ end local dQ,dR,dS,dT=
function(dQ)local dR=dQ-dB.AbsolutePosition.X local dS=math.clamp(dR,0,dB.
AbsoluteSize.X-ce.AbsoluteSize.X)ce.Position=dy(0,dS,0.5,0)dJ=1-(dS/(dB.
AbsoluteSize.X-ce.AbsoluteSize.X))dP()end,function(dQ,dR)local dS,dT=dz.
AbsoluteSize.x/2,dx(dQ,dR)-dz.AbsolutePosition-dz.AbsoluteSize/2 if dT:Dot(dT)>
dS*dS then dT=dT.unit*dS end dA.Position=dy(0.5,dT.x,0.5,dT.y)local dU,dV=dK(dT*
dx(1,-1))dH,dI=dL(dU)/360,math.clamp(dV/dS,0,1)dB.BackgroundColor3=dv(dH,dI,1)
dP()end,function(dQ)local dR=(1-dQ)*(dB.AbsoluteSize.X-ce.AbsoluteSize.X)ce.
Position=UDim2.new(0,dR,0.5,0)end,function(dQ,dR)local dS,dT=dz.AbsoluteSize.X/2
,dM(dQ*360)local dU=dR*dS local dV,dW=dU*math.cos(dT),dU*math.sin(dT)dA.Position
=UDim2.new(0.5,-dV,0.5,dW)dB.BackgroundColor3=dv(dQ,dR,1)end local dU,dV,dW=
function()local dU,dV,dW=dO(dD.Red.Text,0,255),dO(dD.Green.Text,0,255),dO(dD.
Blue.Text,0,255)dD.Red.Text=dU dD.Green.Text=dV dD.Blue.Text=dW dH,dI,dJ=Color3.
fromRGB(dU,dV,dW):ToHSV()dS(dJ)dT(dH,dI)dP()end,function()local dU=dD.Hex.Text
local dV,dW,dX=dN(dU)dV=dO(dV,0,255)dW=dO(dW,0,255)dX=dO(dX,0,255)dD.Red.Text=dV
dD.Green.Text=dW dD.Blue.Text=dX dH,dI,dJ=Color3.fromRGB(dV,dW,dX):ToHSV()dS(dJ)
dT(dH,dI)dP()end,function()local dU,dV,dW=math.floor(bW.Color.R*255+0.5),math.
floor(bW.Color.G*255+0.5),math.floor(bW.Color.B*255+0.5)dD.Red.Text=dU dD.Green.
Text=dV dD.Blue.Text=dW dD.Alpha.Text=bX and bW.Alpha or 0 local dX=string.
format('#%02X%02X%02X',dU,dV,dW)dD.Hex.Text=dX dH,dI,dJ=Color3.fromRGB(dU,dV,dW)
:ToHSV()dd.BackgroundColor3=bW.Color dd.BackgroundTransparency=bX and bW.Alpha
or 0 dC.BackgroundColor3=Color3.fromRGB(dU,dV,dW)dC.BackgroundTransparency=bX
and bW.Alpha or 0 dS(dJ)dT(dH,dI)end dz.InputBegan:Connect(function(dX)if dX.
UserInputType==Enum.UserInputType.MouseButton1 or dX.UserInputType==Enum.
UserInputType.Touch then dF=true dR(dE.X,dE.Y)end end)dB.InputBegan:Connect(
function(dX)if dX.UserInputType==Enum.UserInputType.MouseButton1 or dX.
UserInputType==Enum.UserInputType.Touch then dG=true dQ(dE.X)end end)dB.
InputEnded:Connect(function(dX)if dX.UserInputType==Enum.UserInputType.
MouseButton1 or dX.UserInputType==Enum.UserInputType.Touch then dG=false end end
)dz.InputEnded:Connect(function(dX)if dX.UserInputType==Enum.UserInputType.
MouseButton1 or dX.UserInputType==Enum.UserInputType.Touch then dF=false end end
)af.InputChanged:Connect(function(dX)if dX.UserInputType==Enum.UserInputType.
MouseMovement or dX.UserInputType==Enum.UserInputType.Touch then if dG then dQ(
dE.X)elseif dF then dR(dE.X,dE.Y)end end end)local dX=function(dX)local dY=dX.
Text dX.Text=''dX.PlaceholderText=dY end dD.Hex.FocusLost:Connect(dV)dD.Red.
FocusLost:Connect(dU)dD.Green.FocusLost:Connect(dU)dD.Blue.FocusLost:Connect(dU)
dD.Alpha.FocusLost:Connect(dP)dD.Hex.Focused:Connect(function()dX(dD.Hex)end)dD.
Red.Focused:Connect(function()dX(dD.Red)end)dD.Green.Focused:Connect(function()
dX(dD.Green)end)dD.Blue.Focused:Connect(function()dX(dD.Blue)end)dD.Alpha.
Focused:Connect(function()dX(dD.Alpha)end)local dY=function()local dY=Instance.
new'CanvasGroup'dY.Name='ColorPickerCanvas'dY.BackgroundTransparency=1 dY.
BorderSizePixel=0 dY.Size=UDim2.fromScale(1,1)dY.ZIndex=5 dY.GroupTransparency=1
dY.Parent=l dY.Visible=false return dY end local dZ=function(dZ)local d_,d0,d1,
d2,d3=dY(),dZ and 0 or 1,dZ and 1 or 0.95,dZ and 1 or 0,TweenInfo.new(0.1,Enum.
EasingStyle.Sine)local d4,d5=e(d_,d3,{GroupTransparency=d0}),e(b7,d3,{Scale=d1})
b4.Visible=true b4.Parent=d_ d_.Visible=true d_.GroupTransparency=d2 d4:Play()d5
:Play()d4.Completed:Wait()if not dZ then b4.Visible=false d_.Visible=false end
b4.Parent=l d_:Destroy()end local d_,d0=function()dZ(true)end,function()dZ(false
)end b2.MouseButton1Click:Connect(d_)dk.MouseButton1Click:Connect(d0)dh.
MouseButton1Click:Connect(function()d0()local d1=dv(dH,dI,dJ)bW.Color=Color3.
fromRGB(d1.r*255,d1.g*255,d1.b*255)bW.Alpha=bX and dO(dD.Alpha.Text,0,1)dd.
BackgroundColor3=bW.Color dd.BackgroundTransparency=bX and bW.Alpha or 0 b0.
BackgroundColor3=bW.Color b0.BackgroundTransparency=bX and bW.Alpha or 0 if bW.
Settings.Callback then task.spawn(function()bW.Settings.Callback(bW.Color,bX and
bW.Alpha)end)end end)dW()function bW:UpdateName(d1)bZ.Text=d1 end function bW:
SetVisibility(d1)bY.Visible=d1 end function bW:SetColor(d1)bW.Color=d1 b0.
BackgroundColor3=d1 local d2,d3,d4=math.floor(bW.Color.R*255+0.5),math.floor(bW.
Color.G*255+0.5),math.floor(bW.Color.B*255+0.5)dD.Red.Text=d2 dD.Green.Text=d3
dD.Blue.Text=d4 local d5=string.format('#%02X%02X%02X',d2,d3,d4)dD.Hex.Text=d5
dH,dI,dJ=Color3.fromRGB(d2,d3,d4):ToHSV()dd.BackgroundColor3=bW.Color dC.
BackgroundColor3=Color3.fromRGB(d2,d3,d4)dS(dJ)dT(dH,dI)if bW.Settings.Callback
then task.spawn(function()bW.Settings.Callback(bW.Color,bX and bW.Alpha)end)end
end function bW:SetAlpha(d1)bW.Alpha=d1 b0.Transparency=d1 dW()end if bV then aa
.Options[bV]=bW end return bW end function bO:Header(bU,bV)local bW,bX={Settings
=bU},Instance.new'Frame'bX.Name='Header'bX.AutomaticSize=Enum.AutomaticSize.Y bX
.BackgroundColor3=Color3.fromRGB(0,0,0)bX.BackgroundTransparency=1 bX.
BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel=0 bX.LayoutOrder=0 bX.Size=
UDim2.fromScale(1,0)bX.Parent=bP local bY=Instance.new'UIPadding'bY.Name=
'UIPadding'bY.PaddingBottom=UDim.new(0,5)bY.Parent=bX local bZ=Instance.new
'TextLabel'bZ.Name='HeaderText'bZ.FontFace=Font.new(an.interFont,Enum.FontWeight
.Medium,Enum.FontStyle.Normal)bZ.RichText=true bZ.Text=bW.Settings.Text or bW.
Settings.Name bZ.TextColor3=Color3.fromRGB(255,255,255)bZ.TextSize=16 bZ.
TextTransparency=0.3 bZ.TextWrapped=true bZ.TextXAlignment=Enum.TextXAlignment.
Left bZ.AutomaticSize=Enum.AutomaticSize.Y bZ.BackgroundColor3=Color3.fromRGB(
255,255,255)bZ.BackgroundTransparency=1 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.
BorderSizePixel=0 bZ.Size=UDim2.fromScale(1,0)bZ.Parent=bX function bW:
UpdateName(b_)bZ.Text=b_ end function bW:SetVisibility(b_)bX.Visible=b_ end if
bV then aa.Options[bV]=bW end return bW end function bO:Label(bU,bV)local bW,bX=
{Settings=bU},Instance.new'Frame'bX.Name='Label'bX.AutomaticSize=Enum.
AutomaticSize.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.
BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel
=0 bX.Size=UDim2.new(1,0,0,38)bX.Parent=bP local bY=Instance.new'TextLabel'bY.
Name='LabelText'bY.FontFace=Font.new(an.interFont)bY.RichText=true bY.Text=bW.
Settings.Text or bW.Settings.Name bY.TextColor3=Color3.fromRGB(255,255,255)bY.
TextSize=13 bY.TextTransparency=0.5 bY.TextWrapped=true bY.TextXAlignment=Enum.
TextXAlignment.Left bY.AutomaticSize=Enum.AutomaticSize.Y bY.BackgroundColor3=
Color3.fromRGB(255,255,255)bY.BackgroundTransparency=1 bY.BorderColor3=Color3.
fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Size=UDim2.fromScale(1,1)bY.Parent=bX
function bW:UpdateName(bZ)bY.Text=bZ end function bW:SetVisibility(bZ)bX.Visible
=bZ end if bV then aa.Options[bV]=bW end return bW end function bO:SubLabel(bU,
bV)local bW,bX={Settings=bU},Instance.new'Frame'bX.Name='SubLabel'bX.
AutomaticSize=Enum.AutomaticSize.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.
BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel
=0 bX.Size=UDim2.new(1,0,0,0)bX.Parent=bP local bY=Instance.new'TextLabel'bY.
Name='SubLabelText'bY.FontFace=Font.new(an.interFont)bY.RichText=true bY.Text=bW
.Settings.Text or bW.Settings.Name bY.TextColor3=Color3.fromRGB(255,255,255)bY.
TextSize=12 bY.TextTransparency=0.7 bY.TextWrapped=true bY.TextXAlignment=Enum.
TextXAlignment.Left bY.AutomaticSize=Enum.AutomaticSize.Y bY.BackgroundColor3=
Color3.fromRGB(255,255,255)bY.BackgroundTransparency=1 bY.BorderColor3=Color3.
fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Size=UDim2.fromScale(1,1)bY.Parent=bX
function bW:UpdateName(bZ)bY.Text=bZ end function bW:SetVisibility(bZ)bX.Visible
=bZ end if bV then aa.Options[bV]=bW end return bW end function bO:Paragraph(bU,
bV)local bW,bX={Settings=bU},Instance.new'Frame'bX.Name='Paragraph'bX.
AutomaticSize=Enum.AutomaticSize.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.
BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel
=0 bX.Size=UDim2.new(1,0,0,38)bX.Parent=bP local bY=Instance.new'TextLabel'bY.
Name='ParagraphHeader'bY.FontFace=Font.new(an.interFont,Enum.FontWeight.Medium,
Enum.FontStyle.Normal)bY.RichText=true bY.Text=bW.Settings.Header bY.TextColor3=
Color3.fromRGB(255,255,255)bY.TextSize=15 bY.TextTransparency=0.4 bY.TextWrapped
=true bY.TextXAlignment=Enum.TextXAlignment.Left bY.AutomaticSize=Enum.
AutomaticSize.Y bY.BackgroundColor3=Color3.fromRGB(255,255,255)bY.
BackgroundTransparency=1 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel
=0 bY.Size=UDim2.fromScale(1,0)bY.Parent=bX local bZ=Instance.new'UIListLayout'
bZ.Name='UIListLayout'bZ.Padding=UDim.new(0,5)bZ.SortOrder=Enum.SortOrder.
LayoutOrder bZ.Parent=bX local b_=Instance.new'TextLabel'b_.Name='ParagraphBody'
b_.FontFace=Font.new(an.interFont)b_.RichText=true b_.Text=bW.Settings.Body b_.
TextColor3=Color3.fromRGB(255,255,255)b_.TextSize=13 b_.TextTransparency=0.5 b_.
TextWrapped=true b_.TextXAlignment=Enum.TextXAlignment.Left b_.AutomaticSize=
Enum.AutomaticSize.Y b_.BackgroundColor3=Color3.fromRGB(255,255,255)b_.
BackgroundTransparency=1 b_.BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel
=0 b_.LayoutOrder=1 b_.Size=UDim2.fromScale(1,0)b_.Parent=bX function bW:
UpdateHeader(b0)bY.Text=b0 end function bW:UpdateBody(b0)b_.Text=b0 end function
bW:SetVisibility(b0)bX.Visible=b0 end if bV then aa.Options[bV]=bW end return bW
end function bO:Divider()local bU,bV={},Instance.new'Frame'bV.Name='Divider'bV.
AnchorPoint=Vector2.new(0,1)bV.AutomaticSize=Enum.AutomaticSize.Y bV.
BackgroundColor3=Color3.fromRGB(255,255,255)bV.BackgroundTransparency=1 bV.
BorderColor3=Color3.fromRGB(0,0,0)bV.BorderSizePixel=0 bV.Position=UDim2.
fromScale(0,1)bV.Size=UDim2.new(1,0,0,1)bV.Parent=bP local bW=Instance.new
'UIPadding'bW.Name='UIPadding'bW.PaddingBottom=UDim.new(0,8)bW.PaddingTop=UDim.
new(0,8)bW.Parent=bV local bX=Instance.new'UIListLayout'bX.Name='UIListLayout'bX
.SortOrder=Enum.SortOrder.LayoutOrder bX.Parent=bV local bY=Instance.new'Frame'
bY.Name='Line'bY.BackgroundColor3=Color3.fromRGB(255,255,255)bY.
BackgroundTransparency=0.9 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.
BorderSizePixel=0 bY.Size=UDim2.new(1,0,0,1)bY.Parent=bV function bU:Remove()bV:
Destroy()end function bU:SetVisibility(bZ)bV.Visible=bZ end return bU end
function bO:Spacer()local bU,bV={},Instance.new'Frame'bV.Name='Spacer'bV.
AnchorPoint=Vector2.new(0,1)bV.BackgroundColor3=Color3.fromRGB(255,255,255)bV.
BackgroundTransparency=1 bV.BorderColor3=Color3.fromRGB(0,0,0)bV.BorderSizePixel
=0 bV.Position=UDim2.fromScale(0,1)bV.Parent=bP function bU:Remove()bV:Destroy()
end function bU:SetVisibility(bW)bV.Visible=bW end return bU end return bO end
local bN=function()local bN=0.15 if c then c.Parent=nil end for bO,bP in pairs(
ak)do e(bO,TweenInfo.new(bN,Enum.EasingStyle.Sine),{BackgroundTransparency=(bO==
bx and 0.98 or 1)}):Play()if bP.tabStroke then e(bP.tabStroke,TweenInfo.new(bN,
Enum.EasingStyle.Sine),{Transparency=(bO==bx and 0.95 or 1)}):Play()end if bP.
switcherImage then e(bP.switcherImage,TweenInfo.new(bN,Enum.EasingStyle.Sine),{
ImageTransparency=(bO==bx and 0.1 or 0.5)}):Play()end if bP.switcherName then e(
bP.switcherName,TweenInfo.new(bN,Enum.EasingStyle.Sine),{TextTransparency=(bO==
bx and 0.1 or 0.5)}):Play()end end ak[bx].tabContent.Parent=aF c=ak[bx].
tabContent a2.Text=bv.Name end bx.MouseButton1Click:Connect(function()bN()end)
function bw:Select()bN()end function bw:InsertConfigSection(bO)local bP=bw:
Section{Side='Left'}if ai then bP:Label{Text=
'Config system unavailable. (Environment isStudio)'}return
'Config system unavailable.'end local bQ,bR bP:Input{Name='Config Name',
Placeholder='Name',AcceptedCharacters='All',Callback=function(bS)bQ=bS end}local
bS=bP:Dropdown{Name='Select Config',Multi=false,Required=false,Options=aa:
RefreshConfigList(),Callback=function(bS)bR=bS end}bP:Button{Name=
'Create Config',Callback=function()if not bQ or string.gsub(bQ,' ','')==''then g
:Notify{Title='Interface',Description='Config name cannot be empty.'}return end
local bT,bU=aa:SaveConfig(bQ)if not bT then g:Notify{Title='Interface',
Description='Unable to save config, return error: '..bU}end g:Notify{Title=
'Interface',Description=string.format('Created config %q',bQ)}bS:ClearOptions()
bS:InsertOptions(aa:RefreshConfigList())end}bP:Button{Name='Load Config',
Callback=function()local bT,bU=aa:LoadConfig(bS.Value)if not bT then g:Notify{
Title='Interface',Description='Unable to load config, return error: '..bU}return
end g:Notify{Title='Interface',Description=string.format('Loaded config %q',bS.
Value)}end}bP:Button{Name='Overwrite Config',Callback=function()local bT,bU=aa:
SaveConfig(bS.Value)if not bT then g:Notify{Title='Interface',Description=
'Unable to overwrite config, return error: '..bU}return end g:Notify{Title=
'Interface',Description=string.format('Overwrote config %q',bS.Value)}end}bP:
Button{Name='Refresh Config List',Callback=function()bS:ClearOptions()bS:
InsertOptions(aa:RefreshConfigList())end}local bT bP:Button{Name=
'Set as autoload',Callback=function()local bU=bS.Value writefile(aa.Folder..
'/settings/autoload.txt',bU)bT:UpdateName('Autoload config: '..bU)g:Notify{Title
='Interface',Description=string.format('Set %q as autoload',bU)}end}bT=bP:Label{
Text='Autoload config: None'}if isfile(aa.Folder..'/settings/autoload.txt')then
local bU=readfile(aa.Folder..'/settings/autoload.txt')bT:UpdateName(
'Autoload config: '..bU)end end ak[bx]={tabContent=bE,tabStroke=bz,switcherImage
=bB,switcherName=bC}return bw end return bp end local bp=function()if
setthreadidentity then pcall(setthreadidentity,7)elseif set_thread_identity then
pcall(set_thread_identity,7)elseif setidentity then pcall(setidentity,7)elseif
syn and syn.set_thread_identity then pcall(syn.set_thread_identity,7)end end
function g:Notify(bq)bp()local br={}local bs,bt=pcall(function()local bs=
Instance.new'Frame'bs.Name='Notification'bs.AnchorPoint=Vector2.new(0.5,0.5)bs.
AutomaticSize=Enum.AutomaticSize.Y bs.BackgroundColor3=Color3.fromRGB(15,15,15)
bs.BorderColor3=Color3.fromRGB(0,0,0)bs.BorderSizePixel=0 bs.Position=UDim2.
fromScale(0.5,0.5)bs.Size=UDim2.fromOffset(bq.SizeX or 250,0)bs.Parent=i local
bt=Instance.new'UIStroke'bt.Name='NotificationUIStroke'bt.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border bt.Color=Color3.fromRGB(255,255,255)bt.Transparency=0.9
bt.Parent=bs local bu=Instance.new'UICorner'bu.Name='NotificationUICorner'bu.
CornerRadius=UDim.new(0,10)bu.Parent=bs local bv=Instance.new'UIScale'bv.Name=
'NotificationUIScale'bv.Parent=bs bv.Scale=0 local bw=Instance.new'Frame'bw.Name
='NotificationInformation'bw.AutomaticSize=Enum.AutomaticSize.Y bw.
BackgroundColor3=Color3.fromRGB(255,255,255)bw.BackgroundTransparency=1 bw.
BorderColor3=Color3.fromRGB(0,0,0)bw.BorderSizePixel=0 bw.Size=UDim2.fromScale(1
,1)local bx=Instance.new'TextLabel'bx.Name='NotificationTitle'bx.FontFace=Font.
new(an.interFont,Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)bx.RichText=true
bx.Text=bq.Title bx.TextColor3=Color3.fromRGB(255,255,255)bx.TextSize=13 bx.
TextTransparency=0.2 bx.TextTruncate=Enum.TextTruncate.SplitWord bx.
TextXAlignment=Enum.TextXAlignment.Left bx.TextYAlignment=Enum.TextYAlignment.
Top bx.AutomaticSize=Enum.AutomaticSize.XY bx.BackgroundColor3=Color3.fromRGB(
255,255,255)bx.BackgroundTransparency=1 bx.BorderColor3=Color3.fromRGB(0,0,0)bx.
BorderSizePixel=0 bx.Size=UDim2.new(1,-12,0,0)local by=Instance.new'UIPadding'by
.Name='NotificationTitleUIPadding'by.PaddingRight=UDim.new(0,25)by.Parent=bx bx.
Parent=bw local bz=Instance.new'TextLabel'bz.Name='NotificationDescription'bz.
FontFace=Font.new(an.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)bz.
Text=bq.Description bz.TextColor3=Color3.fromRGB(255,255,255)bz.TextSize=11 bz.
TextTransparency=0.5 bz.TextWrapped=true bz.RichText=true bz.TextXAlignment=Enum
.TextXAlignment.Left bz.TextYAlignment=Enum.TextYAlignment.Top bz.AutomaticSize=
Enum.AutomaticSize.XY bz.BackgroundColor3=Color3.fromRGB(255,255,255)bz.
BackgroundTransparency=1 bz.BorderColor3=Color3.fromRGB(0,0,0)bz.BorderSizePixel
=0 bz.Size=UDim2.new(1,-12,0,0)local bA=Instance.new'UIPadding'bA.Name=
'NotificationDescriptionUIPadding'bA.PaddingRight=UDim.new(0,25)bA.PaddingTop=
UDim.new(0,17)bA.Parent=bz bz.Parent=bw local bB=Instance.new'UIPadding'bB.Name=
'NotificationUIPadding'bB.PaddingBottom=UDim.new(0,12)bB.PaddingLeft=UDim.new(0,
10)bB.PaddingRight=UDim.new(0,10)bB.PaddingTop=UDim.new(0,10)bB.Parent=bw bw.
Parent=bs local bC=Instance.new'Frame'bC.Name='NotificationControls'bC.
AutomaticSize=Enum.AutomaticSize.Y bC.BackgroundColor3=Color3.fromRGB(255,255,
255)bC.BackgroundTransparency=1 bC.BorderColor3=Color3.fromRGB(0,0,0)bC.
BorderSizePixel=0 bC.Size=UDim2.fromScale(1,1)local bD=Instance.new'TextButton'
bD.Name='Interactable'bD.FontFace=Font.new(an.interFont)bD.Text='\u{2713}'bD.
TextColor3=Color3.fromRGB(255,255,255)bD.TextSize=17 bD.TextTransparency=0.2 bD.
AnchorPoint=Vector2.new(1,0.5)bD.AutomaticSize=Enum.AutomaticSize.XY bD.
BackgroundColor3=Color3.fromRGB(255,255,255)bD.BackgroundTransparency=1 bD.
BorderColor3=Color3.fromRGB(0,0,0)bD.BorderSizePixel=0 bD.LayoutOrder=1 bD.
Position=UDim2.fromScale(1,0.5)bD.Parent=bC local bE=Instance.new'UIPadding'bE.
Name='UIPadding'bE.PaddingBottom=UDim.new(0,6)bE.PaddingRight=UDim.new(0,13)bE.
PaddingTop=UDim.new(0,6)bE.Parent=bC bC.Parent=bs local bF,bG={In=e(bv,TweenInfo
.new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Scale=bq.Scale
or 1}),Out=e(bv,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=0})},{None=function()bD:Destroy()end,Confirm=
function()bD.Text='\u{2713}'end,Cancel=function()bD.Text='\u{2717}'end}local bH=
bG[bq.Style]or function()bD:Destroy()end bH()if bD then bD.MouseButton1Click:
Connect(function()br:Cancel()if bq.Callback then task.spawn(bq.Callback)end end)
end local bI=task.spawn(function()bp()bF.In:Play()bq.Lifetime=bq.Lifetime or 3
if bq.Lifetime~=0 then task.wait(bq.Lifetime)local bI=bF.Out bI:Play()bI.
Completed:Wait()bp()pcall(function()bs:Destroy()end)end end)function br:
UpdateTitle(bJ)bx.Text=bJ end function br:UpdateDescription(bJ)bz.Text=bJ end
function br:Resize(bJ)local bK=bJ or 250 bs.Size=UDim2.fromOffset(bK,0)end
function br:Cancel()bp()task.cancel(bI)local bJ=bF.Out bJ:Play()bJ.Completed:
Wait()pcall(function()bs:Destroy()end)end end)if not bs then pcall(function()
local bu=aa.GetService'StarterGui'or game:GetService'StarterGui'bu:SetCore(
'SendNotification',{Title=bq.Title or'Interface',Text=bq.Description or'',
Duration=bq.Lifetime or 3})end)return{UpdateTitle=function()end,
UpdateDescription=function()end,Resize=function()end,Cancel=function()end}end
return br end function g:Dialog(bq)local br,bs={},Instance.new'CanvasGroup'bs.
Name='DialogCanvas'bs.BackgroundColor3=Color3.fromRGB(255,255,255)bs.
BackgroundTransparency=1 bs.BorderColor3=Color3.fromRGB(0,0,0)bs.BorderSizePixel
=0 bs.Size=UDim2.fromScale(1,1)bs.GroupTransparency=1 bs.Parent=l local bt=
Instance.new'Frame'bt.Name='Dialog'bt.BackgroundColor3=Color3.fromRGB(0,0,0)bt.
BackgroundTransparency=0.5 bt.BorderColor3=Color3.fromRGB(0,0,0)bt.
BorderSizePixel=0 bt.Size=UDim2.fromScale(1,1)local bu=Instance.new'UICorner'bu.
Name='BaseUICorner'bu.CornerRadius=UDim.new(0,10)bu.Parent=bt local bv=Instance.
new'Frame'bv.Name='Prompt'bv.AnchorPoint=Vector2.new(0.5,0.5)bv.AutomaticSize=
Enum.AutomaticSize.Y bv.BackgroundColor3=Color3.fromRGB(15,15,15)bv.BorderColor3
=Color3.fromRGB(0,0,0)bv.BorderSizePixel=0 bv.Position=UDim2.fromScale(0.5,0.5)
bv.Size=UDim2.fromOffset(280,0)local bw=Instance.new'UIScale'bw.Name=
'BaseUIScale'bw.Parent=bv bw.Scale=0.95 local bx=Instance.new'UIStroke'bx.Name=
'GlobalSettingsUIStroke'bx.ApplyStrokeMode=Enum.ApplyStrokeMode.Border bx.Color=
Color3.fromRGB(255,255,255)bx.Transparency=0.9 bx.Parent=bv local by=Instance.
new'UICorner'by.Name='GlobalSettingsUICorner'by.CornerRadius=UDim.new(0,10)by.
Parent=bv local bz=Instance.new'UIPadding'bz.Name='GlobalSettingsUIPadding'bz.
PaddingBottom=UDim.new(0,20)bz.PaddingLeft=UDim.new(0,20)bz.PaddingRight=UDim.
new(0,20)bz.PaddingTop=UDim.new(0,20)bz.Parent=bv local bA=Instance.new'Frame'bA
.Name='Paragraph'bA.AutomaticSize=Enum.AutomaticSize.Y bA.BackgroundColor3=
Color3.fromRGB(0,0,0)bA.BackgroundTransparency=1 bA.BorderColor3=Color3.fromRGB(
0,0,0)bA.BorderSizePixel=0 bA.Size=UDim2.new(1,0,0,38)local bB=Instance.new
'TextLabel'bB.Name='ParagraphHeader'bB.FontFace=Font.new(an.interFont,Enum.
FontWeight.Medium,Enum.FontStyle.Normal)bB.RichText=true bB.Text=bq.Title bB.
TextColor3=Color3.fromRGB(255,255,255)bB.TextSize=18 bB.TextTransparency=0.4 bB.
TextWrapped=true bB.AutomaticSize=Enum.AutomaticSize.Y bB.BackgroundColor3=
Color3.fromRGB(255,255,255)bB.BackgroundTransparency=1 bB.BorderColor3=Color3.
fromRGB(0,0,0)bB.BorderSizePixel=0 bB.Size=UDim2.fromScale(1,0)bB.Parent=bA
local bC=Instance.new'UIListLayout'bC.Name='UIListLayout'bC.Padding=UDim.new(0,
15)bC.SortOrder=Enum.SortOrder.LayoutOrder bC.Parent=bA local bD=Instance.new
'TextLabel'bD.Name='ParagraphBody'bD.FontFace=Font.new(an.interFont)bD.RichText=
true bD.Text=bq.Description bD.TextColor3=Color3.fromRGB(255,255,255)bD.TextSize
=14 bD.TextTransparency=0.5 bD.TextWrapped=true bD.AutomaticSize=Enum.
AutomaticSize.Y bD.BackgroundColor3=Color3.fromRGB(255,255,255)bD.
BackgroundTransparency=1 bD.BorderColor3=Color3.fromRGB(0,0,0)bD.BorderSizePixel
=0 bD.LayoutOrder=1 bD.Size=UDim2.fromScale(1,0)bD.Parent=bA bA.Parent=bv local
bE=Instance.new'Frame'bE.Name='Interactions'bE.AutomaticSize=Enum.AutomaticSize.
Y bE.BackgroundColor3=Color3.fromRGB(0,0,0)bE.BackgroundTransparency=1 bE.
BorderColor3=Color3.fromRGB(0,0,0)bE.BorderSizePixel=0 bE.LayoutOrder=1 bE.Size=
UDim2.fromScale(1,0)local bF=Instance.new'UIListLayout'bF.Name='UIListLayout'bF.
Padding=UDim.new(0,10)bF.SortOrder=Enum.SortOrder.LayoutOrder bF.Parent=bE local
bG=Instance.new'UIPadding'bG.Name='UIPadding'bG.PaddingTop=UDim.new(0,20)bG.
Parent=bE bE.Parent=bv local bH=Instance.new'UIListLayout'bH.Name='UIListLayout'
bH.SortOrder=Enum.SortOrder.LayoutOrder bH.Parent=bv bv.Parent=bt bt.Parent=bs
local bI,bJ,bK,bL=e(bs,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{
GroupTransparency=0}),e(bs,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{
GroupTransparency=1}),e(bw,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Scale=1}),
e(bw,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Scale=0.95})local bM,bN=function(
)bI:Play()bK:Play()bI.Completed:Wait()bt.Parent=l end,function()if not bt.Parent
then return end bt.Parent=bs bJ:Play()bL:Play()bJ.Completed:Wait()bs:Destroy()
end for bO,bP in pairs(bq.Buttons)do local bQ=Instance.new'TextButton'bQ.Name=
'Button'bQ.FontFace=Font.new(an.interFont)bQ.Text=bP.Name bQ.TextColor3=Color3.
fromRGB(255,255,255)bQ.TextSize=15 bQ.TextTransparency=0.5 bQ.TextTruncate=Enum.
TextTruncate.AtEnd bQ.AutoButtonColor=false bQ.AutomaticSize=Enum.AutomaticSize.
Y bQ.BackgroundColor3=Color3.fromRGB(25,25,25)bQ.BorderColor3=Color3.fromRGB(0,0
,0)bQ.BorderSizePixel=0 bQ.Size=UDim2.fromScale(1,0)local bR=Instance.new
'UIPadding'bR.Name='UIPadding'bR.PaddingBottom=UDim.new(0,9)bR.PaddingLeft=UDim.
new(0,10)bR.PaddingRight=UDim.new(0,10)bR.PaddingTop=UDim.new(0,9)bR.Parent=bQ
local bS=Instance.new'UICorner'bS.Name='BaseUICorner'bS.CornerRadius=UDim.new(0,
10)bS.Parent=bQ bQ.Parent=bE local bT={DefaultTransparency=0,
DefaultTransparency2=0.5,HoverTransparency=0.3,HoverTransparency2=0.6,
EasingStyle=Enum.EasingStyle.Sine}local bU=function(bU)if bU=='Idle'then e(bQ,
TweenInfo.new(0.2,bT.EasingStyle),{BackgroundTransparency=bT.DefaultTransparency
,TextTransparency=bT.DefaultTransparency2}):Play()elseif bU=='Hover'then e(bQ,
TweenInfo.new(0.2,bT.EasingStyle),{BackgroundTransparency=bT.HoverTransparency,
TextTransparency=bT.HoverTransparency2}):Play()end end bQ.MouseButton1Click:
Connect(function()if bs.GroupTransparency~=0 then return end local bV,bW=pcall(
function()if bP.Callback then bP.Callback()end end)bN()if not bV then warn(
'[Dialog] Button callback error: '..tostring(bW))end end)bQ.MouseEnter:Connect(
function()bU'Hover'end)bQ.MouseLeave:Connect(function()bU'Idle'end)end bM()
function br:UpdateTitle(bO)bB.Text=bO end function br:UpdateDescription(bO)bD.
Text=bO end function br:Cancel()bN()end return br end function g:
SetNotificationsState(bq)i.Visible=bq end function g:GetNotificationsState(bq)
return i.Visible end function g:SetState(bq)ap=bq l.Visible=bq end function g:
GetState()return ap end local bq function g:Unload()if bq then bq()end h:
Destroy()am=true end function g.onUnloaded(br)bq=br end local br=f.Keybind or
Enum.KeyCode.RightControl local bs=function()local bs=not g:GetState()g:
SetState(bs)g:Notify{Title=f.Title,Description=(bs and'Maximized 'or'Minimized '
)..'the menu. Use '..tostring(br.Name)..' to toggle it.',Lifetime=5}end af.
InputEnded:Connect(function(bt,bu)if bu then return end if bt.KeyCode==br then
bs()end end)A.MouseButton1Click:Connect(bs)y.MouseButton1Click:Connect(function(
)g:Dialog{Title=f.Title,Description=
[[Are you sure you want to exit the menu? You will lose any unsaved configurations.]]
,Buttons={{Name='Confirm',Callback=function()g:Unload()end},{Name='Cancel'}}}end
)function g:SetKeybind(bt)br=bt end function g:SetAcrylicBlurState(bt)aq=bt l.
BackgroundTransparency=bt and 0.05 or 0 end function g:GetAcrylicBlurState()
return aq end local bt,bu=function(bt)if bt then ar.Image=(_ and Z)or
'rbxassetid://0'ay.Text='@'..aj.Name av.Text=aj.DisplayName else ar.Image=an.
userInfoBlurred local bu,bv=#aj.Name,#aj.DisplayName ay.Text='@'..string.rep('.'
,bu)av.Text=string.rep('.',bv)end end if f.ShowUserInfo~=nil then bu=f.
ShowUserInfo else bu=true end bt(bu)function g:SetUserInfoState(bv)bt(bv)end
function g:GetUserInfoState(bv)return bu end function g:SetSize(bv)l.Size=bv end
function g:GetSize(bv)return l.Size end function g:SetScale(bv)m.Scale=bv end
function g:GetScale()return m.Scale end local bv,bw={Toggle={Save=function(bv,bw
)return{type='Toggle',flag=bv,state=bw.State or false}end,Load=function(bv,bw)
bp()if aa.Options[bv]and bw.state~=nil then aa.Options[bv]:UpdateState(bw.state)
end end},Slider={Save=function(bv,bw)return{type='Slider',flag=bv,value=(bw.
Value and tostring(bw.Value))or false}end,Load=function(bv,bw)bp()if aa.Options[
bv]and bw.value~=nil and bw.value~=false then aa.Options[bv]:UpdateValue(bw.
value)end end},Input={Save=function(bv,bw)return{type='Input',flag=bv,text=bw.
Text}end,Load=function(bv,bw)bp()if aa.Options[bv]and bw.text and type(bw.text)
=='string'then aa.Options[bv]:UpdateText(bw.text)end end},Keybind={Save=function
(bv,bw)return{type='Keybind',flag=bv,bind=(typeof(bw.Bind)=='EnumItem'and bw.
Bind.Name)or nil}end,Load=function(bv,bw)bp()if aa.Options[bv]and bw.bind then
aa.Options[bv]:Bind(Enum.KeyCode[bw.bind])end end},Dropdown={Save=function(bv,bw
)return{type='Dropdown',flag=bv,value=bw.Value}end,Load=function(bv,bw)bp()if aa
.Options[bv]and bw.value then aa.Options[bv]:UpdateSelection(bw.value)end end},
Colorpicker={Save=function(bv,bw)local bx=function(bx)return string.format(
'#%02X%02X%02X',math.floor(bx.R*255),math.floor(bx.G*255),math.floor(bx.B*255))
end return{type='Colorpicker',flag=bv,color=bx(bw.Color)or nil,alpha=bw.Alpha}
end,Load=function(bv,bw)bp()local bx=function(bx)local by,bz,bA=tonumber(bx:sub(
2,3),16)/255,tonumber(bx:sub(4,5),16)/255,tonumber(bx:sub(6,7),16)/255 return
Color3.new(by,bz,bA)end if aa.Options[bv]and bw.color then aa.Options[bv]:
SetColor(bx(bw.color))if bw.alpha then aa.Options[bv]:SetAlpha(bw.alpha)end end
end}},function()if ai or not(isfolder and makefolder)then return
'Config system unavailable.'end local bv={aa.Folder,aa.Folder..'/settings'}for
bw=1,#bv do local bx=bv[bw]if not isfolder(bx)then makefolder(bx)end end end
function aa:LoadAutoLoadConfig()bp()if ai or not(isfile and readfile)then return
'Config system unavailable.'end local bx,by=(aa.Folder..'/settings/autoload.txt'
)if isfile(bx)then local bz,bA=pcall(readfile,bx)if bz and type(bA)=='string'
then bA=string.gsub(bA,'[\r\n%s]+','')if#bA>0 then by=bA end end end if not by
then local bz=aa.Folder..'/settings/Default.json'if isfile(bz)then by='Default'
if writefile then pcall(writefile,bx,'Default')end end end if not by then print(
'[MacLib] Kh\u{f4}ng t\u{ec}m th\u{1ea5}y autoload config n\u{e0}o trong '..bx)
return end print(string.format(
'[MacLib] Kh\u{1edf}i \u{111}\u{1ed9}ng n\u{1ea1}p autoload config: %q',by))
local bz,bA=aa:LoadConfig(by)if not bz then pcall(function()g:Notify{Title=
'Interface',Description='Error loading autoload config: '..tostring(bA)}end)
warn(string.format('[MacLib] L\u{1ed7}i khi n\u{1ea1}p autoload config %q: %s',
by,tostring(bA)))return end print(string.format(
'[MacLib] N\u{1ea1}p autoload config th\u{e0}nh c\u{f4}ng: %q',by))pcall(
function()g:Notify{Title='Interface',Description=string.format(
'Autoloaded config: %q',by)}end)end function aa:SetFolder(bx)if ai then return
'Config system unavailable.'end aa.Folder=bx bw()end function aa:SaveConfig(bx)
if ai or not writefile then return'Config system unavailable.'end if(not bx)then
return false,'Please select a config file.'end local by,bz=aa.Folder..
'/settings/'..bx..'.json',{objects={},contextData=aa.contextData or{}}for bA,bB
in next,aa.Options do if not bv[bB.Class]then continue end if bB.IgnoreConfig
then continue end table.insert(bz.objects,bv[bB.Class].Save(bA,bB))end local bA,
bB=pcall(ad.JSONEncode,ad,bz)if not bA then return false,
'Unable to encode into JSON data'end writefile(by,bB)return true end function aa
:LoadConfig(bx)bp()if ai or not(isfile and readfile)then return
'Config system unavailable.'end if(not bx)then return false,
'Please select a config file.'end bx=string.gsub(tostring(bx),'[\r\n%s]+','')if#
bx==0 then return false,'Please select a config file.'end local by=aa.Folder..
'/settings/'..bx..'.json'if not isfile(by)then return false,'Invalid file: '..
tostring(by)end local bz,bA=pcall(ad.JSONDecode,ad,readfile(by))if not bz or
type(bA)~='table'then return false,'Unable to decode JSON data.'end aa.
LoadingConfig=true aa.contextData=bA.contextData or{}local bB,bC=bA.objects or{}
,0 for bD,bE in next,bB do if bE and bE.type and bv[bE.type]then local bF,bG=
pcall(function()bv[bE.type].Load(bE.flag,bE)end)if bF then bC=bC+1 else warn(
string.format('[MacLib:LoadConfig] L\u{1ed7}i khi n\u{1ea1}p option %s (%s): %s'
,tostring(bE.flag),tostring(bE.type),tostring(bG)))end end end print(string.
format(
'[MacLib:LoadConfig] \u{110}\u{e3} n\u{1ea1}p config %q (%d/%d options th\u{e0}nh c\u{f4}ng)'
,bx,bC,#bB))task.delay(1,function()aa.LoadingConfig=false end)return true end
function aa:RefreshConfigList()if ai or not(isfolder and listfiles)then return
'Config system unavailable.'end local bx,by=(isfolder(aa.Folder)and isfolder(aa.
Folder..'/settings'))and listfiles(aa.Folder..'/settings')or{},{}for bz=1,#bx do
local bA=bx[bz]if bA:sub(-5)=='.json'then local bB=bA:find('.json',1,true)local
bC,bD=bB,bA:sub(bB,bB)while bD~='/'and bD~='\\'and bD~=''do bB=bB-1 bD=bA:sub(bB
,bB)end if bD=='/'or bD=='\\'then local bE=bA:sub(bB+1,bC-1)if bE~='options'then
table.insert(by,bE)end end end end return by end h.Enabled=false local bx={}for
by,bz in pairs(an)do table.insert(bx,bz)end ae:PreloadAsync(bx)h.Enabled=true ap
=true return g end function aa:Demo()local ar=aa:Window{Title='Maclib Demo',
Subtitle='This is a subtitle.',Size=UDim2.fromOffset(868,650),DragStyle=1,
DisabledWindowControls={},ShowUserInfo=true,Keybind=Enum.KeyCode.RightControl,
AcrylicBlur=true}local as,at={UIBlurToggle=ar:GlobalSetting{Name='UI Blur',
Default=ar:GetAcrylicBlurState(),Callback=function(as)ar:SetAcrylicBlurState(as)
ar:Notify{Title=ar.Settings.Title,Description=(as and'Enabled'or'Disabled')..
' UI Blur',Lifetime=5}end},NotificationToggler=ar:GlobalSetting{Name=
'Notifications',Default=ar:GetNotificationsState(),Callback=function(as)ar:
SetNotificationsState(as)ar:Notify{Title=ar.Settings.Title,Description=(as and
'Enabled'or'Disabled')..' Notifications',Lifetime=5}end},ShowUserInfo=ar:
GlobalSetting{Name='Show User Info',Default=ar:GetUserInfoState(),Callback=
function(as)ar:SetUserInfoState(as)ar:Notify{Title=ar.Settings.Title,Description
=(as and'Showing'or'Redacted')..' User Info',Lifetime=5}end}},{TabGroup1=ar:
TabGroup()}local au={Main=at.TabGroup1:Tab{Name='Demo',Image=
'rbxassetid://18821914323'},Settings=at.TabGroup1:Tab{Name='Settings',Image=
'rbxassetid://10734950309'}}local av={MainSection1=au.Main:Section{Side='Left'}}
av.MainSection1:Header{Name='Header #1'}av.MainSection1:Button{Name='Button',
Callback=function()ar:Dialog{Title=ar.Settings.Title,Description=
[[Lorem ipsum odor amet, consectetuer adipiscing elit. Eros vestibulum aliquet mattis, ex platea nunc.]]
,Buttons={{Name='Confirm',Callback=function()print'Confirmed!'end},{Name=
'Cancel'}}}end}av.MainSection1:Input({Name='Input',Placeholder='Input',
AcceptedCharacters='All',Callback=function(aw)ar:Notify{Title=ar.Settings.Title,
Description='Successfully set input to '..aw}end,onChanged=function(aw)print(
'Input is now '..aw)end},'Input')av.MainSection1:Slider({Name='Slider',Default=
50,Minimum=0,Maximum=100,DisplayMethod='Percent',Precision=0,Callback=function(
aw)print('Changed to '..aw)end},'Slider')av.MainSection1:Toggle({Name='Toggle',
Default=false,Callback=function(aw)ar:Notify{Title=ar.Settings.Title,Description
=(aw and'Enabled 'or'Disabled ')..'Toggle'}end},'Toggle')av.MainSection1:
Keybind({Name='Keybind',Blacklist=false,Callback=function(aw)ar:Notify{Title=
'Demo Window',Description='Pressed keybind - '..tostring(aw.Name),Lifetime=3}end
,onBinded=function(aw)ar:Notify{Title='Demo Window',Description=
'Successfully Binded Keybind to - '..tostring(aw.Name),Lifetime=3}end},'Keybind'
)av.MainSection1:Colorpicker({Name='Colorpicker',Default=Color3.fromRGB(0,255,
255),Callback=function(aw)print('Color: ',aw)end},'Colorpicker')local aw,ax,ay,
az=av.MainSection1:Colorpicker({Name='Transparency Colorpicker',Default=Color3.
fromRGB(255,0,0),Alpha=0,Callback=function(aw,ax)print('Color: ',aw,' Alpha: ',
ax)end},'TransparencyColorpicker'),0 av.MainSection1:Toggle({Name='Rainbow',
Default=false,Callback=function(aA)ay=aA if ay then az=game:GetService
'RunService'.RenderStepped:Connect(function(aB)ax=(ax+aB*0.1)%1 aw:SetColor(
Color3.fromHSV(ax,1,1))end)elseif az then az:Disconnect()az=nil end end},
'RainbowToggle')local aA={'Apple','Banana','Orange','Grapes','Pineapple','Mango'
,'Strawberry','Blueberry','Watermelon','Peach'}local aB,aC=av.MainSection1:
Dropdown({Name='Dropdown',Multi=false,Required=true,Options=aA,Default=1,
Callback=function(aB)print('Dropdown changed: '..aB)end},'Dropdown'),av.
MainSection1:Dropdown({Name='Multi Dropdown',Search=true,Multi=true,Required=
false,Options=aA,Default={'Apple','Orange'},Callback=function(aB)local aC={}for
aD,aE in next,aB do table.insert(aC,aD)end print('Mutlidropdown changed:',table.
concat(aC,', '))end},'MultiDropdown')av.MainSection1:Button{Name=
'Update Selection',Callback=function()aB:UpdateSelection'Grapes'aC:
UpdateSelection{'Banana','Pineapple'}end}av.MainSection1:Divider()av.
MainSection1:Header{Text='Header #2'}av.MainSection1:Paragraph{Header=
'Paragraph',Body=
[[Paragraph body. Lorem ipsum odor amet, consectetuer adipiscing elit. Morbi tempus netus aliquet per velit est gravida.]]
}av.MainSection1:Label{Text=
'Label. Lorem ipsum odor amet, consectetuer adipiscing elit.'}av.MainSection1:
SubLabel{Text=
[[Sub-Label. Lorem ipsum odor amet, consectetuer adipiscing elit.]]}aa:SetFolder
'Maclib'au.Settings:InsertConfigSection'Left'ar.onUnloaded(function()print
'Unloaded!'end)au.Main:Select()aa:LoadAutoLoadConfig()end return aa end function
a.e()local aa,ab={}function aa:SetWindow(ac)ab=ac end function aa.Notify(ac,ad,
ae)ae=ae or 3 if ab then local af=pcall(function()ab:Notify{Title=ac,Description
=ad,Lifetime=ae}end)if af then return end end pcall(function()game:GetService
'StarterGui':SetCore('SendNotification',{Title=ac,Text=ad,Duration=ae})end)end
return aa end function a.f()local aa,ab,ac,ad,ae,af,ag=a.load'd',a.load'e',{},
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
a.g()local aa,ab,ac=a.load'a',a.load'd',a.load'f'local ad,ae,af,ag,ah,ai,aj=aa.
HttpService or game:GetService'HttpService',{},'DQMacro','pathRecord',3,'normal'
,'full'local ak,al,am,an,ao=function(ak)if ak==aj then return aj end return ai
end,(isfile~=nil and writefile~=nil and makefolder~=nil and isfolder~=nil),{},
false,{}local ap,aq=function()for ap=#ao,1,-1 do pcall(ao[ap])end end,function()
local ap=ab.Folder or'EsclipseHub'return ap..'/'..af end local ar,as=function()
if not al then return end pcall(function()local ar=ab.Folder or'EsclipseHub'if
not isfolder(ar)then makefolder(ar)end local as=aq()if not isfolder(as)then
makefolder(as)end end)end,function(ar)if type(ar)~='string'then return'Unknown'
end return(string.gsub(ar,'[/\\:*?"<>|]','_'))end local at,au,av,aw,ax=function(
at)return aq()..'/'..as(at)..'.json'end,function(at)if not at then return nil
end return{X=math.round(at.X*100)/100,Y=math.round(at.Y*100)/100,Z=math.round(at
.Z*100)/100}end,function(at)if not at or type(at)~='table'then return nil end
return Vector3.new(at.X or 0,at.Y or 0,at.Z or 0)end,function(at)return type(at)
=='table'and type(at.points)=='table'and#at.points>0 end,function(at)if type(at)
~='table'or type(at.X)~='number'then return nil end local au=Vector3.new(at.X,0,
at.Z)if au.Magnitude<0.001 then return nil end return au.Unit end local ay,az,aA
,aB,aC,aD=function(ay)if type(ay)~='table'then return nil end local az={}for aA,
aB in ipairs(ay.dwells or{})do local aC=av(aB.pos)if aC then az[#az+1]={pos=aC,
dur=tonumber(aB.dur)or 0,facing=ax(aB.facing)}end end local aA={}for aB,aC in
ipairs(ay.skills or{})do local aD=av(aC.pos)if aD then aA[#aA+1]={pos=aD,facing=
ax(aC.facing),key=aC.key,dw=math.floor(tonumber(aC.dw)or 0),dwT=tonumber(aC.dwT)
or 0}end end if#az==0 and#aA==0 then return nil end return{dwells=az,skills=aA}
end,function()if an then return end an=true if al then ar()local ay=aq()if
isfolder'DQMacro'and listfiles then pcall(function()local az=listfiles'DQMacro'
if type(az)=='table'then for aA,aB in ipairs(az)do if type(aB)=='string'and
string.lower(string.sub(aB,-5))=='.json'and isfile(aB)then local aC=string.
match(aB,'([^/\\]+)$')or'unknown.json'local aD,aE=ay..'/'..aC,readfile(aB)
writefile(aD,aE)delfile(aB)end end end end)end if listfiles and isfolder(ay)then
local az,aA=pcall(function()return listfiles(ay)end)if az and type(aA)=='table'
then for aB,aC in ipairs(aA)do if type(aC)=='string'and string.lower(string.sub(
aC,-5))=='.json'then pcall(function()if isfile(aC)then local aD=readfile(aC)
local aE=ad:JSONDecode(aD)if type(aE)=='table'and type(aE.map)=='string'and
type(aE.rooms)=='table'then am[aE.map]=aE end end end)end end end end local az=
ab.contextData if type(az)=='table'and type(az[ag])=='table'then local aA,aB=az[
ag],false for aC,aD in pairs(aA)do if type(aC)=='string'and type(aD)=='table'
then if not am[aC]then am[aC]=aD end pcall(function()writefile(at(aC),ad:
JSONEncode(aD))end)aB=true end end if aB then az[ag]=nil ac.Save()end end else
local ay=ab.contextData if type(ay)=='table'and type(ay[ag])=='table'then for az
,aA in pairs(ay[ag])do if type(az)=='string'and type(aA)=='table'then am[az]=aA
end end end end end,0.1,0.82,0.3,function(ay,az)local aA,aB=ay.X-az.X,ay.Z-az.Z
return math.sqrt(aA*aA+aB*aB)end function ae.SimplifyPath(aE,aF)local aG=#aE if
aG<=2 then return aE end local aH={}for aI=1,aG do aH[aI]=false end aH[1]=true
aH[aG]=true local aI={1}for aJ=2,aG-1 do local aK,aL,aM=aE[aJ-1],aE[aJ],aE[aJ+1]
local aN,aO=aL.X-aK.X,aL.Z-aK.Z local aP,aQ,aR=math.sqrt(aN*aN+aO*aO),aM.X-aL.X,
aM.Z-aL.Z local aS=math.sqrt(aQ*aQ+aR*aR)if aP>=aC and aS>=aC then local aT=(aN*
aQ+aO*aR)/(aP*aS)if aT<aB then aH[aJ]=true table.insert(aI,aJ)end end end table.
insert(aI,aG)local aJ,aK=aF*aF,{}for aL=1,#aI-1 do local aM,aN=aI[aL],aI[aL+1]if
aN-aM>1 then table.insert(aK,{aM,aN})end end while#aK>0 do local aL=table.
remove(aK)local aM,aN=aL[1],aL[2]local aO,aP,aQ,aR=aE[aM].X,aE[aM].Z,aE[aN].X,aE
[aN].Z local aS,aT=aQ-aO,aR-aP local aU,aV,aW=aS*aS+aT*aT,-1,0 for aX=aM+1,aN-1
do local aY=0 if aU>0 then aY=((aE[aX].X-aO)*aS+(aE[aX].Z-aP)*aT)/aU aY=math.
clamp(aY,0,1)end local aZ,a_=aE[aX].X-(aO+aS*aY),aE[aX].Z-(aP+aT*aY)local a0=aZ*
aZ+a_*a_ if a0>aV then aV=a0 aW=aX end end if aW>0 and aV>aJ then aH[aW]=true
table.insert(aK,{aM,aW})table.insert(aK,{aW,aN})end end local aL={}for aM=1,aG
do if aH[aM]and(#aL==0 or aD(aL[#aL],aE[aM])>=aA or aM==aG)then table.insert(aL,
aE[aM])end end if#aL==1 then table.insert(aL,aE[aG])end return aL end function
ae.OnChanged(aE)if type(aE)~='function'then return function()end end table.
insert(ao,aE)return function()for aF,aG in ipairs(ao)do if aG==aE then table.
remove(ao,aF)break end end end end function ae.HasMap(aE)if type(aE)~='string'or
#aE==0 then return false end az()local aF=am[aE]if not aF or type(aF.rooms)~=
'table'then return false end for aG,aH in pairs(aF.rooms)do if aw(aH)and#aH.
points>0 then return true end end return false end function ae.GetRoomSegment(aE
,aF)if type(aE)~='string'or type(aF)~='number'then return nil end az()local aG=
am[aE]if not aG or type(aG.rooms)~='table'then return nil end local aH=aG.rooms[
tostring(aF)]if not aw(aH)then return nil end local aI={}for aJ,aK in ipairs(aH.
points)do local aL=av(aK)if aL then aI[#aI+1]=aL end end if#aI==0 then return
nil end return{startPos=av(aH.startPos)or aI[1],points=aI,events=aH.events and
ay(aH.events)or nil,speed=tonumber(aH.speed)or 0,boss=aH.boss==true}end function
ae.HasSegmentOrMacro(aE,aF)return ae.GetRoomSegment(aE,aF)~=nil end function ae.
GetMap(aE)if not ae.HasMap(aE)then return nil end az()local aF=am[aE]if not aF
then return nil end local aG={}for aH,aI in pairs(aF.rooms or{})do local aJ=
tonumber(aH)if aJ and aw(aI)then local aK=ae.GetRoomSegment(aE,aJ)if aK then aG[
aJ]=aK end end end return{map=aE,version=aF.version,rooms=aG,created=aF.created,
updated=aF.updated,mode=ak(aF.mode)}end function ae.GetMaps()az()local aE={}for
aF,aG in pairs(am)do if type(aF)=='string'and type(aG)=='table'and aG.map==aF
and type(aG.rooms)=='table'then local aH,aI,aJ=0,0,0 for aK,aL in pairs(aG.rooms
)do if tonumber(aK)~=nil and aw(aL)then aH+=1 if aL.boss==true then aI+=1 end aJ
+=#aL.points end end if aH>0 then table.insert(aE,{map=aF,roomCount=aH,bossCount
=aI,pointCount=aJ,updated=aG.updated,mode=ak(aG.mode)})end end end table.sort(aE
,function(aF,aG)return aF.map<aG.map end)return aE end function ae.Count()return
#ae.GetMaps()end function ae.SaveSegment(aE,aF,aG,aH,aI,aJ,aK)if type(aE)~=
'string'or#aE==0 then return false end if type(aF)~='number'or aF<=0 then return
false end if not aG or not aH or#aH==0 then return false end az()local aL=am[aE]
if not aL or type(aL)~='table'then aL={map=aE,version=ah,created=os.time(),
updated=os.time(),mode=ai,rooms={}}am[aE]=aL end if type(aL.rooms)~='table'then
aL.rooms={}end local aM={}for aN,aO in ipairs(aH)do aM[#aM+1]=au(aO)end local aN
={startPos=au(aG)or aM[1],points=aM}if aK then aN.boss=true end if type(aJ)==
'number'and aJ>0 then aN.speed=aJ end local aO=function(aO)if not aO or type(aO)
~='table'then return nil end local aP,aQ=#(aO.dwells or{}),#(aO.skills or{})if
aP==0 and aQ==0 then return nil end local aR={dwells={},skills={}}for aS,aT in
ipairs(aO.dwells or{})do aR.dwells[#aR.dwells+1]={pos=au(aT.pos),dur=aT.dur or 0
,facing=aT.facing}end for aS,aT in ipairs(aO.skills or{})do aR.skills[#aR.skills
+1]={pos=au(aT.pos),facing=aT.facing,key=aT.key,dw=aT.dw or 0,dwT=aT.dwT or 0}
end return aR end if aI and type(aI)=='table'then local aP=aO(aI)if aP then aN.
events=aP end end aL.rooms[tostring(aF)]=aN aL.version=ah aL.map=aE aL.updated=
os.time()if al then ar()pcall(function()writefile(at(aE),ad:JSONEncode(aL))end)
else local aP=ab.contextData if type(aP)=='table'then if not aP[ag]then aP[ag]={
}end aP[ag][aE]=aL ac.Save()end end ap()return true end function ae.GetMapMode(
aE)if type(aE)~='string'or#aE==0 then return ai end az()local aF=am[aE]if type(
aF)~='table'then return ai end return ak(aF.mode)end function ae.SetMapMode(aE,
aF)if type(aE)~='string'or#aE==0 then return false end local aG=ak(aF)az()local
aH=am[aE]if not aH or type(aH)~='table'then aH={map=aE,version=ah,created=os.
time(),updated=os.time(),mode=ai,rooms={}}am[aE]=aH end aH.mode=aG aH.map=aE aH.
updated=os.time()if al then ar()pcall(function()writefile(at(aE),ad:JSONEncode(
aH))end)else local aI=ab.contextData if type(aI)=='table'then if not aI[ag]then
aI[ag]={}end aI[ag][aE]=aH ac.Save()end end ap()return true end function ae.
RemoveMap(aE)az()if not am[aE]then return false end am[aE]=nil if al then local
aF=at(aE)pcall(function()if isfile(aF)then delfile(aF)end end)else local aF=ab.
contextData if type(aF)=='table'and aF[ag]then aF[ag][aE]=nil ac.Save()end end
ap()return true end function ae.ClearAll()az()if next(am)==nil then return end
local aE=aq()if al and isfolder(aE)and listfiles then pcall(function()local aF=
listfiles(aE)if type(aF)=='table'then for aG,aH in ipairs(aF)do if type(aH)==
'string'and string.lower(string.sub(aH,-5))=='.json'and isfile(aH)then delfile(
aH)end end end end)end table.clear(am)local aF=ab.contextData if type(aF)==
'table'and aF[ag]then aF[ag]=nil ac.Save()end ap()end function ae.ReloadFromDisk
()table.clear(am)an=false az()ap()end function ae.ReloadFromConfig()ae.
ReloadFromDisk()end return ae end function a.h()local aa,ab,ac,ad,ae=a.load'a',a
.load'c',a.load'g',a.load'f',a.load'e'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,
ar=aa.RunService,aa.player,aa.UserInputService,0.1,8000,0.4,0.1,1.5,1,6,{},true,
true function ap.SetCapture(as)as=as and true or false aq=as ar=as end function
ap.IsCaptureEnabled()return aq or ar end local as,at,au,av,aw,ax,ay,az,aA,aB,aC,
aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ,aR,aS,aT,aU,aV=false,0,{},0,{},{},0,
false,0,0,false,false,false,0,0,0,{}local aW,aX=function()local aW={recording=as
,map=aJ,room=at,pointCount=#au,dwellCount=#aw,skillCount=#ax,savedRooms=aF}for
aX,aY in ipairs(aI)do pcall(aY,aW)end end,function()local aW=ag and ag.Character
local aX=aW and aW:FindFirstChild'HumanoidRootPart'if aX and aX.Parent then
return aX end return nil end local aY,aZ,a_,a0=function()local aY=aX()if not aY
then return nil end local aZ=aY.CFrame.LookVector if aZ.Magnitude<0.001 then
return nil end return{X=aZ.X/aZ.Magnitude,Z=aZ.Z/aZ.Magnitude}end,function()if
aL then aL:Disconnect()aL=nil end if aM then aM:Disconnect()aM=nil end if aN
then aN()aN=nil end if aO then aO()aO=nil end if aP then aP()aP=nil end end,
function(aY)au={aY}aw={}ax={}aQ=nil ay=0 aR=nil aS=nil aT=nil aU=aY aA=0 aB=0 av
=os.clock()aV=os.clock()az=false end,function()aJ=nil at=0 aK=nil au={}aw={}ax={
}aQ=nil ay=0 aR=nil aS=nil aT=nil aU=nil az=false aA=0 aB=0 aV=nil aD=false aE=
false aC=false aF=0 aG=0 aH=0 end local a1,a2=function(a1,a2)at=a1 aK=a2 aE=true
a_(a2)aD=ab.IsBossActive()end,function(a1,a2)if not aE then return nil end local
a3=ac.SimplifyPath(au,ak)if#a3<2 then return nil end local a4 if#aw>0 or#ax>0
then a4={dwells=aw,skills=ax}end local a5=0 if aB>0.5 and aA>5 then a5=math.
clamp(aA/aB,5,100)end local a6=ac.SaveSegment(aJ,at,aK,a3,a4,a5,aD)if not a6
then return nil end aF+=1 aH+=#au if aD then aG+=1 end if not a2 then local a7=
''if a4 then a7=(
' (%d \u{111}i\u{1ec3}m m\u{1ecb}n, %d skill, %d nh\u{1ecb}p d\u{1eeb}ng, %.1fspd)'
):format(#a3,#(a4.skills or{}),#(a4.dwells or{}),a5)else a7=(
' (%d \u{111}i\u{1ec3}m m\u{1ecb}n, %.1fspd)'):format(#a3,a5)end ae.Notify(
'Path Record',('\u{110}\u{e3} l\u{1b0}u room %d%s v\u{e0}o map [%s] %s'):format(
at,a7,aJ,a1 and('- '..a1)or''),3)end return{points=a3,events=a4,speed=a5}end
function ap.IsRecording()return as end function ap.GetStartRoom()return at end
function ap.GetCurrentPoints()return au end function ap.GetCurrentDwells()return
aw end function ap.GetCurrentSkills()return ax end function ap.GetStatus()return
{recording=as,map=aJ,room=at,pointCount=#au,dwellCount=#aw,skillCount=#ax,
savedRooms=aF}end function ap.OnStatusChanged(a3)if type(a3)~='function'then
return function()end end table.insert(aI,a3)return function()for a4,a5 in
ipairs(aI)do if a5==a3 then table.remove(aI,a4)break end end end end function ap
.Start()if as then return false,'already recording'end local a3=aX()if not a3
then return false,'no character found'end if ab.IsDead()then return false,
'character is dead'end local a4=ab.GetCurrentRoomIndex()if a4<=0 then return
false,'not inside a dungeon'end local a5=ab.GetCurrentDungeonName()if not a5 or#
a5==0 then return false,'unable to identify map'end aC=ac.GetMapMode(a5)=='full'
if ab.IsBossActive()and not aC then return false,
'boss room (use Hazard Scanner)'end aJ=a5 a1(a4,a3.Position)as=true ad.
SetRecording(true)aF=0 aG=0 aH=0 aL=af.Heartbeat:Connect(function()if not as
then return end if ab.IsDead()then aR=nil aQ=nil aU=nil ap.Stop
't\u{1eed} tr\u{1ead}n'return end local a6=aX()if not a6 then return end local
a7,a8=a6.Position,au[#au]if a8 and(a7-a8).Magnitude>35 then if not aC then ap.
Stop'large teleport'return end a2('large teleport',true)local a9=ab.
GetCurrentRoomIndex()if a9==at then a9=0 end a1(a9,a7)aW()task.spawn(function()
task.wait(ao)if as and at<=0 then ap.Stop'end of map'end end)return end local a9
,b=os.clock(),aU and(a7-aU).Magnitude or 0 aU=a7 local ba=aV and math.max(0.0001
,a9-aV)or 0.016 aV=a9 local bb=ba>0 and(b/ba)or 0 if bb>=am then aA+=b aB+=ba aR
=nil aQ=nil else if aq then if not aR then aR=a9 aS=a7 aT=aY()end if aQ then aQ.
dur=a9-aR aQ.facing=aY()or aT elseif a9-aR>=al then ay=aR-av aQ={pos=aS,dur=a9-
aR,facing=aT,index=#aw+1}table.insert(aw,aQ)for bc,bd in ipairs(ax)do if bd.dw==
0 and bd._castAt and bd._castAt>=aR then bd.dw=aQ.index bd.dwT=math.max(0,(bd.
_castAt-av)-ay)bd.pos=aQ.pos aQ.facing=bd.facing or aQ.facing end end end end
end local bc=au[#au]if bc and(a7-bc).Magnitude<ai then return end if#au>=aj then
ap.Stop'reached max points'return end table.insert(au,a7)end)if ar then aM=ah.
InputBegan:Connect(function(a6,a7)if not as or not ar then return end if ah:
GetFocusedTextBox()then return end if ab.IsDead()then return end local a8 if a6.
UserInputType==Enum.UserInputType.MouseButton2 then if a7 then return end a8=
'QE'elseif a6.UserInputType==Enum.UserInputType.Keyboard and(a6.KeyCode==Enum.
KeyCode.Q or a6.KeyCode==Enum.KeyCode.E)then a8=a6.KeyCode==Enum.KeyCode.Q and
'Q'or'E'else return end local a9=aX()if not a9 then return end local b=aq and(aQ
~=nil)local ba={pos=b and aQ.pos or a9.Position,facing=aY(),key=a8,dw=0,dwT=0,
_castAt=os.clock()}if b then ba.dw=aQ.index ba.dwT=math.max(0,(os.clock()-av)-ay
)aQ.facing=ba.facing or aQ.facing end table.insert(ax,ba)end)end aN=ab.
OnRoomIndexChanged(function()if as then local a6=ab.GetCurrentRoomIndex()if aE
and at<=0 and a6>0 then at=a6 return end if a6~=at and not az then az=true task.
delay(an,function()az=false if as then if aC then ap.Rollover()else ap.Stop
'room completed'end end end)end end end)aP=ab.OnBossActiveChanged(function(a6)if
not as then return end if a6 then if aC then aD=true else ap.Stop
'entered boss room'end return end if aC and aD then a2('boss defeated',true)aD=
false aE=false task.spawn(function()task.wait(ao)if as and not aE then ap.Stop
'end of map'end end)end end)aO=ab.OnLobbyChanged(function(a6)if as and a6 then
ap.Stop'returned to lobby'end end)ae.Notify('Path Record',(
'B\u{1eaf}t \u{111}\u{1ea7}u record room %d (%s)'):format(a4,a5),2)aW()return
true end function ap.Rollover()if not as then return false end a2(
'chuy\u{1ec3}n room',true)local a3=aX()local a4=a3 and a3.Position or aK a1(ab.
GetCurrentRoomIndex(),a4)aW()return true end function ap.Stop(a3)if not as then
return false end as=false ad.SetRecording(false)aZ()local a4=a2(a3,true)if a4
then if aF>1 then local a5=aG>0 and(' | %d boss'):format(aG)or''ae.Notify(
'Path Record',(
'\u{110}\u{e3} l\u{1b0}u map [%s] %s: %d room%s (%d \u{111}i\u{1ec3}m g\u{1ed1}c)'
):format(aJ,a3 or'xong',aF,a5,aH),4)else local a5=''if a4.events then a5=(
' (%d \u{111}i\u{1ec3}m m\u{1ecb}n, %d skill, %d nh\u{1ecb}p d\u{1eeb}ng, %.1fspd)'
):format(#a4.points,#(a4.events.skills or{}),#(a4.events.dwells or{}),a4.speed
or 0)else a5=(' (%d \u{111}i\u{1ec3}m m\u{1ecb}n, %.1fspd)'):format(#a4.points,
a4.speed or 0)end local a6=at>0 and(aD and' (boss)'or'')or''ae.Notify(
'Path Record',('\u{110}\u{e3} l\u{1b0}u room %d%s%s v\u{e0}o map [%s] %s'):
format(at,a5,a6,aJ,a3 and('- '..a3)or''),3)end elseif aF>0 then local a5=aG>0
and(' | %d boss'):format(aG)or''ae.Notify('Path Record',(
'\u{110}\u{e3} l\u{1b0}u map [%s] %s: %d room%s (%d \u{111}i\u{1ec3}m g\u{1ed1}c)'
):format(aJ,a3 or'xong',aF,a5,aH),4)end a0()aW()return a4~=nil end function ap.
Cancel()if not as then return end aZ()a0()as=false ad.SetRecording(false)aW()end
return ap end function a.i()local aa,ab,ac,ad=a.load'a',a.load'c',a.load'g',a.
load'e'local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax,ay,az,
aA,aB,aC,aD,aE=aa.player,aa.VirtualInputManager,aa.UserInputService,aa.
RunService or game:GetService'RunService',0.4,0.5,8,2,4.5,8,14,8,2,0.5,2,0.001,
0.1,{},true,true,true,0.6,0.005,0.45,0.2,false,true function av.SetAimSkillQ(aF)
aD=aF and true or false end function av.IsAimSkillQEnabled()return aD end
function av.SetAimSkillE(aF)aE=aF and true or false end function av.
IsAimSkillEEnabled()return aE end local aF=function(aF)if aF=='Q'then return aD
elseif aF=='E'then return aE end return aD or aE end function av.
SetStartPauseTime(aG)if type(aG)=='number'then aC=math.clamp(aG,0,5)end end
function av.GetStartPauseTime()return aC end function av.SetPreAimTime(aG)if
type(aG)=='number'then aB=math.clamp(aG,0.1,1.5)end end function av.
GetPreAimTime()return aB end function av.SetSkillFaceHold(aG)if type(aG)==
'number'then az=math.clamp(aG,ar,as)end end function av.GetSkillFaceHold()return
az end function av.SetDoubleClickDelay(aG)if type(aG)=='number'then aA=math.
clamp(aG,at,au)end end function av.GetDoubleClickDelay()return aA end function
av.SetReplayTimeline(aG)aG=aG and true or false aw=aG ax=aG ay=aG end function
av.IsReplayTimelineEnabled()return aw end local aG,aH,aI,aJ=true,false function
av.SetSpeedMatch(aK)aG=aK and true or false end function av.IsSpeedMatchEnabled(
)return aG end function av.SetUseFastSpeed(aK)aH=aK and true or false end
function av.IsUseFastSpeedEnabled()return aH end local aK,aL,aM,aN,aO,aP,aQ,aR,
aS,aT,aU=function(aK)local aL if aH then local aM=ab.GetFastSpeed()if type(aM)==
'number'and aM>0 then aL=aM end elseif aG then if type(aK)=='number'and aK>0
then aL=aK end end if not aL or aL<=0 then return end local aM=ab.GetHumanoid()
if not aM then return end if aI==nil then aJ=aM.WalkSpeed end aI=aL if aM.
WalkSpeed~=aL then aM.WalkSpeed=aL end end,function()if aI==nil then return end
local aK=ab.GetHumanoid()if aJ and aK and aK.WalkSpeed~=aJ then aK.WalkSpeed=aJ
end aI=nil aJ=nil end,false,false,false,0,0,0,{}local aV,aW,aX,aY,aZ=function(aV
)local aW={playing=aM,map=aT,room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(
),resume=aN,progressPercent=aR,progressStuds=aP,totalStuds=aQ,reason=aV}for aX,
aY in ipairs(aS)do pcall(aY,aW)end end,function()local aV=ae and ae.Character
local aW=aV and aV:FindFirstChild'HumanoidRootPart'if aW and aW.Parent then
return aW end return nil end,function(aV)if not aV or not aV.Parent then return
nil end local aW,aX=pcall(function()return aV.Position end)if not aW or not aX
then return nil end return aX end,function(aV,aW)local aX,aY=aV.X-aW.X,aV.Z-aW.Z
return math.sqrt(aX*aX+aY*aY)end local a_=function()if aZ then return aZ end
pcall(function()local a_=ae:FindFirstChild'PlayerScripts'local a0=a_ and a_:
FindFirstChild'PlayerModule'if a0 then aZ=require(a0):GetControls()end end)
return aZ end local a0,a1,a2,a3=function()if ab.DisableControls then ab.
DisableControls'PathRecord'else local a0=a_()if a0 and type(a0.Disable)==
'function'then pcall(function()a0:Disable()end)end end end,function()if ab.
EnableControls then ab.EnableControls'PathRecord'else local a0=a_()if a0 and
type(a0.Enable)=='function'then pcall(function()a0:Enable()end)end end end,(
Vector3.zero)local a4,a5,a6,a7=function()if a3 then return end local a4=ah.
PreSimulation or ah.Heartbeat or ah.RenderStepped a3=a4:Connect(function()if not
aM then return end local a5=ab.GetHumanoid()if a5 then a5:Move(a2,false)end end)
end,function()if a3 then a3:Disconnect()a3=nil end a2=Vector3.zero local a4=ab.
GetHumanoid()if a4 then pcall(function()a4:Move(Vector3.zero,false)end)end end,
function(a4)local a5=aW()if not a5 or not a4 then a2=Vector3.zero return end
local a6=a5.Position local a7=Vector3.new(a4.X-a6.X,0,a4.Z-a6.Z)if a7.Magnitude>
0.05 then a2=a7.Unit else a2=Vector3.zero end end,function()a2=Vector3.zero
local a4=ab.GetHumanoid()if a4 then pcall(function()a4:Move(Vector3.zero,false)
end)end end local a8,a9,b,ba,bb=function(a8)a7()a5()a1()end,function(a8)local a9
,b=ab.GetKeyHoldTime()or 0.05,aA task.spawn(function()pcall(function()local ba=
function(ba,bb)af:SendKeyEvent(bb,ba,false,game)end local bb=function(bb)if bb==
'Q'then ba(Enum.KeyCode.Q,true)task.wait(a9)ba(Enum.KeyCode.Q,false)elseif bb==
'E'then ba(Enum.KeyCode.E,true)task.wait(a9)ba(Enum.KeyCode.E,false)else ba(Enum
.KeyCode.Q,true)ba(Enum.KeyCode.E,true)task.wait(a9)ba(Enum.KeyCode.Q,false)ba(
Enum.KeyCode.E,false)end end bb(a8)if b>0 then task.wait(b)end bb(a8)end)end)end
,function(a8,a9)if not a8 or not a8.Parent then return end local b=ab.
GetHumanoid()if b then b.AutoRotate=false end local ba=a9 or Vector3.new(1,0,0)
if ba.Magnitude<0.1 then ba=Vector3.new(1,0,0)end ba=Vector3.new(ba.X,0,ba.Z).
Unit pcall(function()local bb=a8.Position a8.CFrame=CFrame.lookAt(bb,bb+ba)end)
end,function(a8,a9,b)if not a8 or not a8.Parent then return end local ba=ab.
GetHumanoid()if ba and ba.AutoRotate~=false then ba.AutoRotate=false end local
bb=a9 or Vector3.new(1,0,0)if bb.Magnitude<0.1 then bb=Vector3.new(1,0,0)end bb=
Vector3.new(bb.X,0,bb.Z).Unit pcall(function()local bc=a8.Position local bd=
CFrame.lookAt(bc,bc+bb)a8.CFrame=a8.CFrame:Lerp(bd,math.clamp(b or 0.35,0.05,1))
end)end,function()local a8=ab.GetHumanoid()if a8 then a8.AutoRotate=true end end
local bc=function(bc,bd,be)local bf,bg=ab.GetHumanoid(),aW()if not bf or not bg
then return end aK(bc.speed)local bh=ac.SimplifyPath(bc.points,ai)local bi=#bh
if bi<2 then return end local bj,bk=0,{}bk[1]=0 for bl=2,bi do local bm=aY(bh[bl
-1],bh[bl])bj+=bm bk[bl]=bj end aP=0 aQ=bj aR=0 aV'progress_init'local bl,bm=
function(bl,bm,bn)bm=bm or 0 bn=bn or bj local bo,bp=0,math.huge for bq=2,bi do
if bk[bq]<bm then continue end if bk[bq-1]>bn then continue end local br,bs=bh[
bq-1],bh[bq]local bt,bu=br.X,br.Z local bv,bw=bs.X-bt,bs.Z-bu local bx,by=bv*bv+
bw*bw,0 if bx>0 then by=((bl.X-bt)*bv+(bl.Z-bu)*bw)/bx by=math.clamp(by,0,1)end
local bz,bA=bl.X-(bt+bv*by),bl.Z-(bu+bw*by)local bB=bz*bz+bA*bA if bB<bp then bp
=bB bo=bk[bq-1]+math.sqrt(bx)*by end end return bo end,function(bl)local bm=2
while bm<=bi and bk[bm]<bl do bm+=1 end bm=math.min(bm,bi)local bn=bk[bm]-bk[bm-
1]if bn<=0 then return bh[bm]end local bo,bp,bq=math.clamp((bl-bk[bm-1])/bn,0,1)
,bh[bm-1],bh[bm]return Vector3.new(bp.X+(bq.X-bp.X)*bo,bp.Y+(bq.Y-bp.Y)*bo,bp.Z+
(bq.Z-bp.Z)*bo)end local bn,bo,bp=function(bn)local bo=bj-bn if bo<=1 then
return math.max(0.2,bo)end local bp,bq=math.min(bn+2,bj),math.min(bn+4.5,bj)if
bq-bn<0.8 then return math.min(al,bo)end local br,bs,bt=bm(bn),bm(bp),bm(bq)
local bu,bv,bw,bx=bs.X-br.X,bs.Z-br.Z,bt.X-bs.X,bt.Z-bs.Z local by,bz=math.sqrt(
bu*bu+bv*bv),math.sqrt(bw*bw+bx*bx)if by>0.1 and bz>0.1 then local bA=math.
clamp((bu*bw+bv*bx)/(by*bz),-1,1)local bB=math.clamp((bA+0.2)/1.2,0,1)local bC=
al+(am-al)*bB return math.min(bC,bo)end return math.min(am,bo)end,{},{}if bc.
events and(aw or ax or ay)then local bq,br=bc.events.dwells or{},bc.events.
skills or{}for bs,bt in ipairs(bq)do local bu,bv=bl(bt.pos),bt.dur or 0 if bu<=
0.8 or bu>=bj-0.8 then bv=aC end bo[bs]={arc=bu,dur=bv,facing=bt.facing,skills={
},pos=bt.pos}end if aC>0 and(#bo==0 or bo[1].arc>0.8)then table.insert(bo,1,{arc
=0,dur=aC,facing=bc.events and bc.events.startFacing or nil,skills={},pos=bc.
startPos or bh[1]})end for bs,bt in ipairs(br)do local bu=(aw and bt.dw>0 and bo
[bt.dw])and bo[bt.dw]or nil if bu then table.insert(bu.skills,{tOff=bt.dwT or 0,
facing=bt.facing,key=bt.key})else table.insert(bp,{arc=bl(bt.pos),facing=bt.
facing,key=bt.key})end end table.sort(bp,function(bs,bt)return bs.arc<bt.arc end
)end local bq,br,bs=function(bq)if not aM or(bq.dur or 0)<=0 then return true
end if aw then a7()if ay and bq.facing then b(bg,bq.facing)end local br,bs,bt=os
.clock(),{},0 while aM and(os.clock()-br<bq.dur)do if not bg or not bg.Parent
then return false,'no_root'end if ab.IsDead()then return false,'dead'end if ab.
GetCurrentRoomIndex()~=bd then return false,'room_changed'end if ab.
IsBossActive()and not be then return false,'boss'end a7()local bu=os.clock()-br
for bv,bw in ipairs(bq.skills or{})do if not bs[bv]and bu>=(bw.tOff or 0)then bs
[bv]=true if ay and bw.facing and aF(bw.key)then b(bg,bw.facing)bt=os.clock()+az
end if ax then a9(bw.key or'QE')end end end task.wait(0.03)end for bu,bv in
ipairs(bq.skills or{})do if not bs[bu]then bs[bu]=true if ay and bv.facing and
aF(bv.key)then b(bg,bv.facing)bt=os.clock()+az end if ax then a9(bv.key or'QE')
end end end while aM and os.clock()<bt do a7()task.wait(0.03)end if ay then bb()
end end return true end,bc.startPos or bh[1],aX(bg)if bs and br then local bt=
aY(bs,br)if bt>1.8 then local bu=os.clock()+ak while aM and os.clock()<bu do
local bv=aX(bg)if not bv then break end local bw=aY(bv,br)if bw<=1.8 then break
end if ab.IsDead()or ab.GetCurrentRoomIndex()~=bd then break end a6(br)task.
wait(0.03)end a7()end local bu=aX(bg)if bu and aY(bu,br)<=3 then pcall(function(
)local bv=bg.CFrame.Rotation bg.CFrame=CFrame.new(br.X,bg.Position.Y,br.Z)*bv bg
.AssemblyLinearVelocity=Vector3.zero bg.AssemblyAngularVelocity=Vector3.zero end
)end end local bt,bu,bv,bw,bx,by,bz=0,br or aX(bg),os.clock(),1,1,0 a4()while aM
do if not bg or not bg.Parent then bb()return false,'no_root'end if ab.IsDead()
then bb()return false,'dead'end if ab.GetCurrentRoomIndex()~=bd then bb()return
false,'room_changed'end if ab.IsBossActive()and not be then bb()return false,
'boss'end local bA=aX(bg)if not bA then task.wait(0.08)continue end local bB=bl(
bA,math.max(0,bt-an),math.min(bj,bt+ao))if bB>bt then bt=bB end aP=bt aR=bj>0
and math.clamp(math.floor((bt/bj)*100),0,100)or 0 if bu then if aY(bA,bu)>0.02
then bv=os.clock()end end bu=bA if os.clock()-bv>ap then bt=math.min(bt+aq,bj-aj
)bv=os.clock()bu=bA end while bx<=#bp and bp[bx].arc<=bt do local bC=bp[bx]if ay
and bC.facing and aF(bC.key)then b(bg,bC.facing)bz=bC.facing by=os.clock()+az
end if ax then a9(bC.key or'QE')end bx+=1 end while bw<=#bo and bt>=bo[bw].arc
do local bC=bo[bw]local bD,bE=bq(bC)if not bD then a7()bb()return false,bE end
bw+=1 bu=aX(bg)bv=os.clock()end local bC if ay then local bD,bE=math.huge,bw
while bE<=#bo do local bF,bG=(bo[bE])if bF.skills and#bF.skills>0 then for bH,bI
in ipairs(bF.skills)do if bI.facing and aF(bI.key)then bG=bI.facing break end
end end bG=bG or bF.facing if bG then if bF.arc<bD then bD=bF.arc bC=bG end
break end bE+=1 end local bF=bx while bF<=#bp do local bG=bp[bF]if bG.facing and
aF(bG.key)then if bG.arc<bD then bD=bG.arc bC=bG.facing end break end bF+=1 end
end if ay then if os.clock()<by then if bz then ba(bg,bz,0.45)end if bf.
AutoRotate~=false then bf.AutoRotate=false end elseif bC then ba(bg,bC,0.35)if
bf.AutoRotate~=false then bf.AutoRotate=false end else if bf.AutoRotate~=true
then bf.AutoRotate=true end end else if bf.AutoRotate~=true then bf.AutoRotate=
true end end if bt>=bj-aj then while bw<=#bo do local bD=bo[bw]local bE,bF=bq(bD
)if not bE then a7()bb()return false,bF end bw+=1 end while bx<=#bp do local bD=
bp[bx]if ay and bD.facing and aF(bD.key)then b(bg,bD.facing)bz=bD.facing by=os.
clock()+az end if ax then a9(bD.key or'QE')end bx+=1 end local bD=os.clock()+5
while aM do local bE=aX(bg)if not bE then break end local bF=aY(bE,bh[bi])if bF
<=aj then break end if ab.GetCurrentRoomIndex()~=bd then a7()bb()return false,
'room_changed'end if(ab.IsBossActive()and not be)or ab.IsDead()then a7()bb()
return false,'dead'end if os.clock()>=bD then break end a6(bh[bi])if os.clock()<
by then if bz then ba(bg,bz,0.45)end if bf.AutoRotate~=false then bf.AutoRotate=
false end elseif bf.AutoRotate~=true then bf.AutoRotate=true end task.wait(0.03)
end a7()bb()aP=bj aR=100 return true,'completed'end local bD=bn(bt)local bE=bm(
math.min(bt+bD,bj-0.01))a6(bE)task.wait(0.03)end a7()bb()return false,'stopped'
end local bd=function()local bd,be,bf=0,false,false while aM do if aN then break
end if ab.IsDead()then bf=true task.wait(0.25)continue end if bf then bf=false
end if ab.IsInLobby()then aN=false aM=false break end if ab.IsBossActive()and
not aO then task.wait(0.25)continue end local bg=ab.GetCurrentRoomIndex()if bg<=
0 then task.wait(0.1)continue end if bg~=bd then bd=bg be=false aP=0 aQ=0 aR=0
end local bh=ac.GetRoomSegment(aT,bg)if not bh then task.wait(0.1)continue end
if be then task.wait(0.1)continue end local bi,bj=bc(bh,bg,aO)bb()if bi then be=
true aP=aQ aR=100 else if bj=='dead'then ad.Notify('Path Record',
'T\u{1eed} tr\u{1ead}n: \u{110}ang ch\u{1edd} h\u{1ed3}i sinh \u{111}\u{1ec3} \u{111}i l\u{1ea1}i...'
,2)while aM and ab.IsDead()do task.wait(0.2)end task.wait(0.6)end end end a5()
a1()aL()bb()aU=nil aV()end function av.IsPlaying()return aM end function av.
ResumeWanted()return aN end function av.GetActiveMap()return aT end function av.
IsBossPlayActive()return aO end function av.GetStatus()return{playing=aM,map=aT,
room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(),resume=aN,progressPercent=
aR,progressStuds=aP,totalStuds=aQ}end function av.OnStatusChanged(be)if type(be)
~='function'then return function()end end table.insert(aS,be)return function()
for bf,bg in ipairs(aS)do if bg==be then table.remove(aS,bf)break end end end
end function av.Start()if aM then return false,'\u{111}ang ph\u{e1}t r\u{1ed3}i'
end if ab.IsInLobby()then return false,'\u{111}ang \u{1edf} lobby'end local be=
ab.GetCurrentRoomIndex()if be<=0 then return false,'ch\u{1b0}a c\u{f3} room'end
local bf=ab.GetCurrentDungeonName()if not bf or#bf==0 then return false,
'kh\u{f4}ng x\u{e1}c \u{111}\u{1ecb}nh \u{111}\u{1b0}\u{1ee3}c map'end if not ac
.HasSegmentOrMacro(bf,be)then return false,(
'map [%s] ch\u{1b0}a c\u{f3} segment room %d'):format(bf,be)end local bg=ac.
GetMapMode(bf)=='full'if ab.IsBossActive()and(not bg or not ac.
HasSegmentOrMacro(bf,be))then return false,
'boss room (h\u{e3}y d\u{f9}ng Hazard Scanner)'end aT=bf aO=bg aN=false aP=0 aQ=
0 aR=0 aM=true a0()a4()aU=task.spawn(bd)aV'started'return true end function av.
Stop()aM=false aN=false aT=nil aO=false aP=0 aQ=0 aR=0 if aU then task.cancel(aU
)aU=nil end a8(ab.GetHumanoid())aL()bb()aV'stopped'end function av.
PauseForExclusive()if not aM then return end aN=true aM=false aO=false aP=0 aQ=0
aR=0 if aU then task.cancel(aU)aU=nil end a8(ab.GetHumanoid())aL()bb()ad.Notify(
'Path Record',
[[Yielded control: will auto-resume upon entering a recorded room]],3)aV'paused'
end return av end end local aa,ab,ac,ad,ae,af,ag=a.load'a',a.load'c',a.load'g',a
.load'h',a.load'i',a.load'b',game:GetService'Workspace'local ah,ai,aj,ak,al,am,
an,ao,ap,aq,ar,as,at,au,av,aw,ax,ay,az,aA,aB,aC,aD=aa.RunService,{},
'PR_PathVisual_Container','PR_PathVisual_Anchor',Color3.fromRGB(255,60,60),
Color3.fromRGB(255,90,90),Color3.fromRGB(0,255,120),Color3.fromRGB(0,220,110),
Color3.fromRGB(0,230,255),Color3.fromRGB(255,80,180),Color3.fromRGB(255,190,30),
Color3.fromRGB(200,70,255),Color3.fromRGB(220,100,255),Color3.fromRGB(255,210,60
),0.35,0.55,2.5,3,0.35,true,true,true,true local aE,aF,aG,aH,aI,aJ,aK,aL,aM,aN,
aO=av,true,0,{},{},{},{},{}local aP,aQ,aR,aS,aT,aU,aV,aW=function()if aM and aM.
Parent and aN and aN.Parent then return aN end ai.Clear()local aP=Instance.new
'Folder'aP.Name=aj aP.Parent=ag local aQ=Instance.new'Part'aQ.Name=ak aQ.
Anchored=true aQ.CanCollide=false aQ.CanQuery=false aQ.CanTouch=false aQ.
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
aX then local a0=ad.GetCurrentPoints()if a0 and#a0>0 then table.insert(aY,a0)end
local a1=ad.GetCurrentDwells and ad.GetCurrentDwells()if a1 then aZ=a1 end local
a2=ad.GetCurrentSkills and ad.GetCurrentSkills()if a2 then a_=a2 end else local
a0,a1=ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex()if a0 and#a0>0 and a1>0
then local a2=ac.GetRoomSegment(a0,a1)if a2 then if a2.points and#a2.points>0
then table.insert(aY,a2.points)end if a2.events then aZ=a2.events.dwells or{}a_=
a2.events.skills or{}end end end end if#aY==0 then aW()return end local a0=aP()
if not a0 then return end local a1,a2,a3,a4,a5,a6,a7,a8,a9=aX and al or an,aX
and am or ao,0,0,0,0,0 for b,ba in ipairs(aY)do local bb=#ba if bb>0 then if not
a8 then a8=ba[1]end a9=ba[bb]for bc=1,bb do local bd=ba[bc]if bd then a3+=1
local be=aQ(a3,a0)be.Radius=aE be.Color3=a1 be.AlwaysOnTop=aF be.CFrame=CFrame.
new(bd+Vector3.new(0,az,0))be.Visible=true end end if aB and bb>=2 then for bc=1
,bb-1 do local bd,be=ba[bc],ba[bc+1]if bd and be then local bf,bg=bd+Vector3.
new(0,az,0),be+Vector3.new(0,az,0)local bh=(bg-bf).Magnitude if bh>0.05 then a4
+=1 local bi=aR(a4,a0)bi.Length=bh bi.Thickness=ax bi.Color3=a2 bi.AlwaysOnTop=
aF bi.CFrame=CFrame.lookAt(bf,bg)bi.Visible=true end end end end end end if aC
then local b if a8 then for ba,bb in ipairs(aZ)do if bb.pos and(bb.pos-a8).
Magnitude<1.5 then b=bb break end end a5+=1 local ba=aS(a5,a0)ba.Radius=aw ba.
Color3=ap ba.AlwaysOnTop=aF ba.CFrame=CFrame.new(a8+Vector3.new(0,az,0))ba.
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
Destroy()end)return ai