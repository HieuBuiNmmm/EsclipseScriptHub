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
,N,O,P,Q=function()for A=#z,1,-1 do pcall(z[A])end end,{},'unknown',true,{},{},{
},0,4,false local R=function(R)if R then table.insert(G,R)end return R end
function h.OnRespawn(S)table.insert(F,S)end function h.GetLastRespawnTime()
return H end function h.GetRespawnProtectionDuration()return I end function h.
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
end)end table.clear(G)N()end)return h end end local aa,ab,ac=a.load'a',a.load'c'
,a.load'b'local ad,ae,af,ag,ah,ai,aj,ak,al,am,b,c,d,e,f,g,h,i,j,k,l,m,n=aa.
player,aa.RunService,aa.CoreGui or game:GetService'CoreGui',game:GetService
'Workspace',{},{Cyan=Color3.fromRGB(0,230,255),Red=Color3.fromRGB(255,60,60),
Orange=Color3.fromRGB(255,140,0),Yellow=Color3.fromRGB(255,220,40),Green=Color3.
fromRGB(0,255,120),Emerald=Color3.fromRGB(40,220,160),Blue=Color3.fromRGB(0,140,
255),Purple=Color3.fromRGB(180,80,255),Magenta=Color3.fromRGB(255,60,200),White=
Color3.fromRGB(255,255,255)},false,25,0.4,true,true,'Cyan','Red',0.8,0.15,
'PR_InRange_Highlight',0.2,0,{}local o,p,q,r=function()return ai[c]or ai.Cyan
end,function()return ai[d]or ai.Red end,function()local o=ad and ad.Character if
not o or not o.Parent then return nil end local p=o:FindFirstChildOfClass
'Humanoid'if p and p.Health<=0 then return nil end local q=o:FindFirstChild
'HumanoidRootPart'if q and q.Parent then return q end return nil end,function()
for o,p in pairs(j)do pcall(function()p:Destroy()end)end table.clear(j)pcall(
function()for o,p in ipairs(ag:GetDescendants())do if p.Name==g then pcall(
function()p:Destroy()end)end end end)end local s,t=function()if k then pcall(
function()k:Destroy()end)k=nil end if l then pcall(function()l:Destroy()end)l=
nil end n=nil r()end,function()if not k or not k.Parent then pcall(function()if
k then k:Destroy()end end)k=Instance.new'CylinderHandleAdornment'k.Name=
'PR_SkillRangeRing'k.AlwaysOnTop=true k.ZIndex=5 k.Parent=af end if am then if
not l or not l.Parent then pcall(function()if l then l:Destroy()end end)l=
Instance.new'CylinderHandleAdornment'l.Name='PR_SkillRangeFill'l.AlwaysOnTop=
true l.ZIndex=4 l.Parent=af end else if l then pcall(function()l:Destroy()end)l=
nil end end end local u,v=function(u)if not aj then s()return end t()local v,w=
2.6,o()local x=Vector3.new(u.Position.X,u.Position.Y-v,u.Position.Z)local y=
CFrame.new(x)*CFrame.Angles(math.rad(90),0,0)local z=u.CFrame:ToObjectSpace(y)if
k then k.Adornee=u k.Height=0.06 k.Radius=ak k.InnerRadius=math.max(0.1,ak-al)k.
Color3=w k.Transparency=1-e k.CFrame=z k.Visible=(u~=nil and u.Parent~=nil)end
if l and am then l.Adornee=u l.Height=0.02 l.Radius=ak l.InnerRadius=0 l.Color3=
w l.Transparency=1-f l.CFrame=z l.Visible=(u~=nil and u.Parent~=nil)end end,
function(u)if not aj or not b or not u then if next(j)~=nil then r()end return
end local v,w,x,y,z=ab.GetTrackedEnemyData(),u.Position,ak*ak,{},p()for A,B in
ipairs(v)do local C,D,E=B.Model,B.Root,B.Humanoid if C and C.Parent and D and D.
Parent and E and E.Health>0 then local F,G=D.Position.X-w.X,D.Position.Z-w.Z if(
F*F+G*G)<=x then y[C]=true end end end for A,B in pairs(j)do if not y[A]or not A
.Parent then pcall(function()B:Destroy()end)j[A]=nil end end for A in pairs(y)do
if not j[A]or not j[A].Parent then local B=A:FindFirstChild(g)local C=(B and B:
IsA'Highlight')and B or Instance.new'Highlight'C.Name=g C.Adornee=A C.FillColor=
z C.FillTransparency=0.35 C.OutlineColor=Color3.fromRGB(255,255,255)C.
OutlineTransparency=0.1 C.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop C.Parent
=A j[A]=C else local B=j[A]if B.FillColor~=z then B.FillColor=z end if not B.
Enabled then B.Enabled=true end end end end local w=function()if not aj then
return end local w=q()if not w then if k then k.Visible=false end if l then l.
Visible=false end if next(j)~=nil then r()end n=nil return end local x=2.6 local
y=Vector3.new(w.Position.X,w.Position.Y-x,w.Position.Z)local z=CFrame.new(y)*
CFrame.Angles(math.rad(90),0,0)local A=w.CFrame:ToObjectSpace(z)if not k or not
k.Parent or w~=n then n=w u(w)else if k.Adornee~=w then k.Adornee=w end k.CFrame
=A if not k.Visible then k.Visible=true end if am then if not l or not l.Parent
then u(w)else if l.Adornee~=w then l.Adornee=w end l.CFrame=A if not l.Visible
then l.Visible=true end end elseif l and l.Visible then l.Visible=false end end
local B=os.clock()if B-i>=h then i=B v(w)end end function ah.SetEnabled(x)aj=x
and true or false if aj then local y=q()if y then u(y)n=y v(y)end if not m then
m=ae.Heartbeat:Connect(w)end else s()if m then m:Disconnect()m=nil end n=nil end
end function ah.IsEnabled()return aj end function ah.SetRadius(x)if type(x)==
'number'then ak=math.clamp(x,5,150)local y=q()if aj and y then u(y)v(y)end end
end function ah.GetRadius()return ak end function ah.SetFillEnabled(x)am=x and
true or false local y=q()if aj and y then u(y)end end function ah.IsFillEnabled(
)return am end function ah.SetHighlightInRange(x)b=x and true or false if not b
then r()else local y=q()if aj and y then v(y)end end end function ah.
IsHighlightInRangeEnabled()return b end function ah.GetColorNames()local x={
'Cyan','Red','Orange','Yellow','Green','Emerald','Blue','Purple','Magenta',
'White'}return x end function ah.GetSelectedCircleColor()return c end function
ah.SetCircleColor(x)if type(x)=='string'and ai[x]then c=x local y=q()if aj and y
then u(y)end end end function ah.GetSelectedHighlightColor()return d end
function ah.SetHighlightColor(x)if type(x)=='string'and ai[x]then d=x local y=q(
)if aj and y then v(y)end end end if ad then ad.CharacterAdded:Connect(function(
x)if aj then task.spawn(function()local y=x:WaitForChild('HumanoidRootPart',10)
if y and aj then u(y)n=y v(y)end end)end end)end ab.OnRespawn(function()if aj
then task.delay(0.2,function()local x=q()if x and aj then u(x)n=x v(x)end end)
end end)ac.Register(function()ah.SetEnabled(false)s()end)return ah