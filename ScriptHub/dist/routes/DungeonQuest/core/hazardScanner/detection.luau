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
end)end table.clear(G)N()end)return h end function a.d()local aa,ab,ac,ad,ae,af,
ag={},0.85,0,2,{},64 function aa.BindDetection(ah)ag=ah or nil end function aa.
GetHazardPadding()return ac end aa.GetHitboxPadding=aa.GetHazardPadding function
aa.GetTrajectoryMargin()return ad end function aa.SetTrajectoryMargin(ah)if
type(ah)=='number'and ah>=0 and ah~=ad then ad=ah aa.InvalidateCache()for ai,aj
in ipairs(ae)do pcall(aj,ad)end end end function aa.InvalidateCache()if ag and
ag.GetActiveHazardsMap then for ah,ai in pairs(ag.GetActiveHazardsMap())do ai.
HazardZones=nil end end end function aa.OnPaddingChanged(ah)if type(ah)==
'function'then table.insert(ae,ah)end end function aa.SetHazardPadding(ah)if
type(ah)=='number'and ah>=0 and ah~=ac then ac=ah aa.InvalidateCache()for ai,aj
in ipairs(ae)do pcall(aj,ac)end end end aa.SetHitboxPadding=aa.SetHazardPadding
local ah={'firstBossCrissCross','firstBossBigSpike','firstBossSeekingSpikes'}
local ai=function(ai)if not ai or type(ai)~='string'then return false end local
aj=ai:lower():gsub('%s+','')if#aj==0 then return false end for ak,al in ipairs(
ah)do local am=al:lower():gsub('%s+','')if#am>0 and string.find(aj,am,1,true)
then return true end end return false end function aa.IsForceCircle(aj)return
ai(aj)end function aa.AddForceCircleName(aj)if type(aj)=='string'and#aj>0 then
table.insert(ah,aj)aa.InvalidateCache()end end function aa.GetForceCircleNames()
return ah end local aj,ak,al=function(aj)return aj and aj.Parent and aj.
Transparency<=ab end,function(aj,ak,al)local am,b=aj.Size,al and ad or ac if ak
or(aj:IsA'Part'and(aj.Shape==Enum.PartType.Ball or aj.Shape==Enum.PartType.
Cylinder))then return{radius=math.max(am.X,am.Y,am.Z)/2}end local c=Vector3.new(
math.max(am.X,0)/2+b,0,math.max(am.Z,0)/2+b)return{half=c,cframe=aj.CFrame}end,
function(aj,ak,al,am)if not ak then return false end local b,c=aj.X,aj.Z al=al
or 0 local d=(am or ak.isTrajectory)and ad or ac if ak.radius then local e=(ak.
part and ak.part.Parent)and ak.part.Position local f,g=e and e.X or ak.cx or 0,e
and e.Z or ak.cz or 0 local h,i,j=b-f,c-g,ak.radius+d+al return(h*h+i*i)<=(j*j)
end local e=(ak.part and ak.part.Parent)and ak.part.CFrame or ak.cframe if e
then local f,g,h=e:PointToObjectSpace(aj),ak.half.X,ak.half.Z if al<=0 then
return math.abs(f.X)<=g and math.abs(f.Z)<=h else local i,j=math.max(0,math.abs(
f.X)-g),math.max(0,math.abs(f.Z)-h)return(i*i+j*j)<=(al*al)end end return false
end local am=function(am)if not am or not am.Instance or not am.Instance.Parent
then return nil end local b=am.Instance local c=am.Name or(b and b.Name)or''
local d,e=ai(c),am.IsTrajectory==true local f,g=e and ad or ac if b:IsA
'BasePart'then if not aj(b)then return nil end g={b}else g={}for h,i in ipairs(b
:GetDescendants())do if#g>=af then break end if i:IsA'BasePart'and aj(i)and i.
Parent then g[#g+1]=i end end if#g==0 then return nil end end local h,i,j,k,l={}
,math.huge,-math.huge,math.huge,-math.huge for m,n in ipairs(g)do local o,p=n.
Position,n.Size local q=math.max(p.X,p.Y,p.Z)/2+f i=math.min(i,o.X-q)j=math.max(
j,o.X+q)k=math.min(k,o.Z-q)l=math.max(l,o.Z+q)local r=ak(n,d,e)if r then if r.
radius then r.cx,r.cz=o.X,o.Z end r.part=n r.isTrajectory=e h[#h+1]=r end end if
#h==0 then return nil end local m,n,o,p=(i+j)/2,(k+l)/2,(j-i)/2,(l-k)/2 return{
zones=h,center=Vector3.new(m,0,n),boundingRadius=math.sqrt(o*o+p*p)}end local b=
function(b)local c=b and b.HazardZones if not c then c=am(b)if c and b then b.
HazardZones=c end end return c end function aa.GetHazardZones(c)return b(c)end
function aa.GetNearbyHazards(c,d)local e=ag if not e then return{}end d=d or 65
local f,g,h={},c.X,c.Z for i,j in pairs(e.GetActiveHazardsMap())do local k,l=j.
Instance,b(j)if l then local m,n=l.center.X,l.center.Z if k and k.Parent then
local o=k:IsA'BasePart'and k or k.PrimaryPart or k:FindFirstChildWhichIsA
'BasePart'if o then m=o.Position.X n=o.Position.Z end end local o,p=g-m,h-n
local q,r=o*o+p*p,d+l.boundingRadius if q<=r*r then table.insert(f,j)end end end
return f end function aa.IsPointInAnyHazard(c,d,e,f)local g=ag if not g then
return false,nil,nil end e=e or 0 local h,i,j,k=math.huge,f or g.
GetActiveHazardsMap()for l,m in pairs(i)do local n=m.Instance or(typeof(l)==
'Instance'and l)if d and(d==n or(n and d.Name==n.Name))then continue end local o
=b(m)if not o then continue end local p,q=o.center.X,o.center.Z if n and n.
Parent then local r=n:IsA'BasePart'and n or n.PrimaryPart or n:
FindFirstChildWhichIsA'BasePart'if r then p=r.Position.X q=r.Position.Z end end
local r,s=c.X-p,c.Z-q local t,u=r*r+s*s,o.boundingRadius+e if t>u*u then
continue end local v=m.IsTrajectory==true for w=1,#o.zones do local x=o.zones[w]
if aj(x.part)and al(c,x,e,v or x.isTrajectory)then local y=(c-x.part.Position).
Magnitude if y<h then h=y j=m k=x.part end break end end end return k~=nil,j,k
end return aa end function a.e()local aa,ab,ac=a.load'a',a.load'b',a.load'd'
local ad,ae,af,ag,ah,ai,aj,ak,al,am,b,c=aa.RunService or game:GetService
'RunService',aa.player,{},false,{},0.85,Color3.fromRGB(255,45,45),Color3.
fromRGB(0,160,255),0.55,0.25 local d=function()local d=ae and ae.Character if
not d then return nil end local e=d:FindFirstChild'HumanoidRootPart'or d.
PrimaryPart if not e then return nil end return e.Position.Y-2.5 end function af
.BindDetection(e)b=e or nil end function af.IsEnabled()return ag end local e=
function(e,f)local g,h=e.part,e.ad if not g or not g.Parent or not h or not h.
Parent then return end local i=g.Position local j=Vector3.new(i.X,f or i.Y,i.Z)
if e.isCircle then local k=CFrame.new(j)*CFrame.Angles(math.rad(90),0,0)h.CFrame
=g.CFrame:ToObjectSpace(k)else local k,l,m=g.CFrame:ToOrientation()local n=
CFrame.new(j)*CFrame.Angles(0,l,0)h.CFrame=g.CFrame:ToObjectSpace(n)end end
local f=function()if not ag then return end local f,g=false,d()for h,i in pairs(
ah)do if not h.Instance or not h.Instance.Parent then af.DetachZoneVisuals(h)
else f=true if i.items then for j,l in ipairs(i.items)do e(l,g)end end end end
if not f and c then c:Disconnect()c=nil end end local g=function()if not c and
ag then c=ad.Heartbeat:Connect(f)end end function af.DetachZoneVisuals(h)if not
h then return end local i=ah[h]if not i then return end if i.adornments then for
j,l in ipairs(i.adornments)do pcall(function()l:Destroy()end)end table.clear(i.
adornments)end if i.connections then for j,l in ipairs(i.connections)do pcall(
function()l:Disconnect()end)end table.clear(i.connections)end if i.items then
table.clear(i.items)end ah[h]=nil end function af.UpdateHazardVisualColor(h,i)if
not h then return end local j=ah[h]if not j or not j.items then return end local
l=i==true or h.IsTrajectory==true local m,n=l and ak or aj,l and ac.
GetTrajectoryMargin()or 0 for o,p in ipairs(j.items)do local q,r,s=p.ad,p.zone,p
.part if q and q.Parent and r and s and s.Parent then q.Color3=m if p.isCircle
and r.radius then q.Radius=r.radius+n elseif r.half then local t,u=math.max(s.
Size.X,0)/2+n,math.max(s.Size.Z,0)/2+n q.Size=Vector3.new(t*2,am,u*2)end end end
end function af.AttachZoneVisuals(h)if not ag or not h then return end if ah[h]
then af.DetachZoneVisuals(h)end local i=ac.GetHazardZones(h)if not i or not i.
zones then return end local j=h.IsTrajectory==true local l,m,n,o,p,q=j and ak or
aj,j and ac.GetTrajectoryMargin()or 0,d(),{},{},{}for r,s in ipairs(i.zones)do
local t=s.part if t and t.Parent and t.Transparency<=ai then local u,v=false if
s.radius then u=true local w=Instance.new'CylinderHandleAdornment'w.Name=
'HazardGroundCircle'w.Adornee=t w.Radius=s.radius+m w.Height=am w.Color3=l w.
Transparency=al w.ZIndex=2 w.AlwaysOnTop=true w.Parent=t v=w elseif s.half and s
.cframe then local w=Instance.new'BoxHandleAdornment'w.Name='HazardGroundBox'w.
Adornee=t w.Size=Vector3.new(s.half.X*2,am,s.half.Z*2)w.Color3=l w.Transparency=
al w.ZIndex=2 w.AlwaysOnTop=true w.Parent=t v=w end if v then local w={ad=v,part
=t,isCircle=u,zone=s}e(w,n)table.insert(o,w)table.insert(p,v)local x=t:
GetPropertyChangedSignal'Transparency':Connect(function()if t.Parent and t.
Transparency>ai then pcall(function()v:Destroy()end)end end)table.insert(q,x)end
end end if#p>0 then ah[h]={items=o,adornments=p,connections=q}g()end end
function af.ClearAll()if c then c:Disconnect()c=nil end for h in pairs(ah)do af.
DetachZoneVisuals(h)end table.clear(ah)end function af.RefreshAll()af.ClearAll()
if not ag or not b then return end for h,i in pairs(b.GetActiveHazardsMap())do
af.AttachZoneVisuals(i)end end function af.SetEnabled(h)ag=h and true or false
if ag then af.RefreshAll()else af.ClearAll()end end ac.OnPaddingChanged(function
()if ag then af.RefreshAll()end end)ab.Register(function()af.ClearAll()end)
return af end function a.f()local aa,ab,ac=a.load'a',a.load'b',a.load'd'local ad
,ae,af,ag,ah,ai,aj,ak,al,am,b,c,d=aa.RunService or game:GetService'RunService',
aa.player,{},false,45,{},0.85,Color3.fromRGB(255,140,0),0.65,0.2,3.5 local e=
function()local e=ae and ae.Character if not e then return nil end local f=e:
FindFirstChild'HumanoidRootPart'or e.PrimaryPart if not f then return nil end
return f.Position.Y-2.5 end function af.BindDetection(f)c=f or nil end function
af.IsEnabled()return ag end function af.GetPredictionLength()return ah end
function af.SetPredictionLength(f)if type(f)=='number'and f>0 then ah=math.
clamp(f,10,200)af.RefreshAll()end end function af.IsHazardMoving(f)if not f then
return false end local g=ai[f]return g and g.isMoving==true end local f,g=
function(f,g)local h=f.Instance if not h or not h.Parent then return nil,4 end
local i,j,l=ac.GetTrajectoryMargin and ac.GetTrajectoryMargin()or 2,{},f.Name or
(h and h.Name)or''local m=ac.IsForceCircle and ac.IsForceCircle(l)if h:IsA
'BasePart'then if h.Transparency<=aj then table.insert(j,h)end else for n,o in
ipairs(h:GetDescendants())do if o:IsA'BasePart'and o.Parent and o.Transparency<=
aj then table.insert(j,o)end end end if#j==0 then return nil,4 end local n,o,p,q
=Vector3.new(-g.Z,0,g.X),math.huge,-math.huge,0 for r,s in ipairs(j)do local t,u
,v=s.Position,s.Size,0 if m or(s:IsA'Part'and(s.Shape==Enum.PartType.Ball or s.
Shape==Enum.PartType.Cylinder))then v=math.max(u.X,u.Y,u.Z)/2 else local w=s.
CFrame local x,y,z,A,B,C=w.RightVector,w.UpVector,w.LookVector,u.X/2,u.Y/2,u.Z/2
v=A*math.abs(x.X*n.X+x.Z*n.Z)+B*math.abs(y.X*n.X+y.Z*n.Z)+C*math.abs(z.X*n.X+z.Z
*n.Z)end local w=t.X*n.X+t.Z*n.Z o=math.min(o,w-v)p=math.max(p,w+v)local x=t.X*g
.X+t.Z*g.Z q+=x end local r,s,t=math.max(1,(p-o)+i*2),(o+p)/2,q/#j local u=g*t+n
*s return u,r end,function(f,g,h,i,j,l,m)if not g or not g.Parent or not f or
not f.Parent then return end local n=l/2 local o=Vector3.new(h.X+i.X*n,j or h.Y,
h.Z+i.Z*n)local p=o+Vector3.new(i.X,0,i.Z)local q=CFrame.lookAt(o,p)local r=g.
CFrame:ToObjectSpace(q)f.CFrame=r f.Size=Vector3.new(m,am,l)if not f.Visible
then f.Visible=true end end local h=function()if not ag then return end local h,
i,j=false,os.clock(),e()for l,m in pairs(ai)do local n=l.Instance if not n or
not n.Parent then af.DetachTrajectoryVisuals(l)else h=true local o=m.mainPart if
o and o.Parent then local p,q=o.Position,i-(m.lastClock or i)if q>=0.035 then
local r=p-(m.lastPos or p)local s,t=r.Magnitude/q,Vector3.new(r.X,0,r.Z)local u,
v=t.Magnitude/q,m.isMoving==true if u>=b then m.isMoving=true m.dir=t.Unit else
if q>=0.25 and s<b then m.isMoving=false end end if m.isMoving~=v then l.
IsTrajectory=m.isMoving l.HazardZones=nil if c and c.UpdateHazardVisualColor
then pcall(c.UpdateHazardVisualColor,l,m.isMoving)end local w=a.load'e'if w and
w.UpdateHazardVisualColor then pcall(w.UpdateHazardVisualColor,l,m.isMoving)end
end m.lastPos=p m.lastClock=i end if m.isMoving and m.dir and m.ad then local r,
s=f(l,m.dir)if r then g(m.ad,o,r,m.dir,j,ah,s)end else if m.ad and m.ad.Visible
then m.ad.Visible=false end end end end end if not h and d then d:Disconnect()d=
nil end end local i=function()if not d and ag then d=ad.Heartbeat:Connect(h)end
end function af.DetachTrajectoryVisuals(j)if not j then return end local l=ai[j]
if not l then return end if l.ad then pcall(function()l.ad:Destroy()end)l.ad=nil
end if l.connections then for m,n in ipairs(l.connections)do pcall(function()n:
Disconnect()end)end table.clear(l.connections)end ai[j]=nil end function af.
AttachTrajectoryVisuals(j)if not ag or not j then return end if ai[j]then af.
DetachTrajectoryVisuals(j)end local l=j.Instance if not l or not l.Parent then
return end local m if l:IsA'BasePart'then m=l else m=l.PrimaryPart or l:
FindFirstChildWhichIsA'BasePart'if not m then for n,o in ipairs(l:
GetDescendants())do if o:IsA'BasePart'and o.Parent then m=o break end end end
end if not m or not m.Parent then return end local n=Instance.new
'BoxHandleAdornment'n.Name='HazardTrajectoryCorridor'n.Adornee=m n.Size=Vector3.
new(4,am,ah)n.Color3=ak n.Transparency=al n.ZIndex=1 n.AlwaysOnTop=true n.
Visible=false n.Parent=m local o,p={},m:GetPropertyChangedSignal'Transparency':
Connect(function()if m.Parent and m.Transparency>aj then pcall(function()n:
Destroy()end)end end)table.insert(o,p)ai[j]={ad=n,connections=o,mainPart=m,
lastPos=m.Position,lastClock=os.clock(),velocity=Vector3.zero,dir=nil,isMoving=
false}i()end function af.ClearAll()if d then d:Disconnect()d=nil end for j in
pairs(ai)do af.DetachTrajectoryVisuals(j)end table.clear(ai)end function af.
RefreshAll()af.ClearAll()if not ag or not c then return end for j,l in pairs(c.
GetActiveHazardsMap())do af.AttachTrajectoryVisuals(l)end end function af.
GetNearbyTrajectories(j,l)l=l or 65 local m,n,o={},j.X,j.Z for p,q in pairs(ai)
do if q.isMoving and q.dir and q.mainPart and q.mainPart.Parent then local r,s=
f(p,q.dir)if r and s then local t,u=r.X,r.Z local v,w=n-t,o-u local x,y=v*v+w*w,
l+ah+(s/2)if x<=y*y then table.insert(m,{info=p,record=q})end end end end return
m end function af.IsPointInAnyTrajectory(j,l,m)local n,o=j.X,j.Z l=l or 0 if m
then for p,q in ipairs(m)do local r,s=q.info,q.record if s and s.isMoving and s.
dir and s.mainPart and s.mainPart.Parent then local t,u=f(r,s.dir)if t and u
then local v=s.dir local w,x,y=Vector3.new(-v.Z,0,v.X),n-t.X,o-t.Z local z,A,B=x
*v.X+y*v.Z,x*w.X+y*w.Z,u/2 if l<=0 then if z>=0 and z<=ah and math.abs(A)<=B
then return true,r,v,t,u end else local C=0 if z<0 then C=-z elseif z>ah then C=
z-ah end local D=math.max(0,math.abs(A)-B)if(C*C+D*D)<=(l*l)then return true,r,v
,t,u end end end end end return false,nil,nil,nil,nil end for p,q in pairs(ai)do
if q.isMoving and q.dir and q.mainPart and q.mainPart.Parent then local r,s=f(p,
q.dir)if r and s then local t=q.dir local u,v,w=Vector3.new(-t.Z,0,t.X),n-r.X,o-
r.Z local x,y,z=v*t.X+w*t.Z,v*u.X+w*u.Z,s/2 if l<=0 then if x>=0 and x<=ah and
math.abs(y)<=z then return true,p,t,r,s end else local A=0 if x<0 then A=-x
elseif x>ah then A=x-ah end local B=math.max(0,math.abs(y)-z)if(A*A+B*B)<=(l*l)
then return true,p,t,r,s end end end end end return false,nil,nil,nil,nil end
function af.SetEnabled(j)ag=j and true or false if ag then af.RefreshAll()else
af.ClearAll()end end ac.OnPaddingChanged(function()if ag then af.RefreshAll()end
end)ab.Register(function()af.ClearAll()end)return af end end local aa,ab,ac,ad,
ae,af,ag,ah,ai=a.load'a',a.load'c',a.load'b',a.load'd',a.load'e',a.load'f',game:
GetService'Players',game:GetService'Workspace',game:GetService
'ReplicatedStorage'local aj,ak,al,am,b,c,d,e,f,g,h,i,j,l,m,n,o,p=aa.player,{},
false,false,true,false,false,'',false,{},0,{},{},{'abilities','projectiles'},
false,{}local q,r,s,t,u,v,w,x=function()if m then return end m=true for q,r in
ipairs(l)do local s=ai:FindFirstChild(r)if s then for t,u in ipairs(s:
GetChildren())do local v=(u.Name or''):lower():gsub('%s+','')if#v>0 then n[v]=
true end end end end end,function(q)if not q then return true end local r=q.Name
if typeof(r)=='string'then local s=r:lower()if s:sub(1,3)=='tm_'or s:sub(1,3)==
'pr_'or s:sub(1,3)=='dq_'or s:find'pathrecord'or s:find'safespot'or s:find
'hazard'or s:find'adornment'or s:find'debug'or s:find'targetpart'or s:find
'actualmarker'then return true end local t=q.Parent while t and t~=workspace and
t~=game do local u=t.Name if typeof(u)=='string'then local v=u:lower()if v:find
'pathrecord'or v:sub(1,3)=='tm_'or v:sub(1,3)=='pr_'then return true end end t=t
.Parent end local u=s:gsub('%s+','')if#u>0 and n[u]==true then return true end
end return false end,function(q)if not q then return false end if ag:
GetPlayerFromCharacter(q)then return true end if ag:FindFirstChild(q.Name)then
return true end for r,s in ipairs(ag:GetPlayers())do if q.Name==s.Name then
return true end local t=s.Character if t and(q==t or q:IsDescendantOf(t))then
return true end end local r=aj and aj.Character if r and(q==r or q:
IsDescendantOf(r))then return true end return false end,function()local q=0 for
r in pairs(g)do q+=1 end h=q for r=#i,1,-1 do pcall(i[r],q,o)end end,0.85,50,
0.05,{}local y,z,A,B,C,D,E,F=function(y)local z=x[y]if z then z.active=false x[y
]=nil end end,function()for y,z in pairs(x)do if z then z.active=false end end
table.clear(x)end,function(y)if not y then return{}end local z={}local A=
function(A)if A and A.Parent and A.Transparency<=u then z[#z+1]=A end end if y:
IsA'BasePart'then A(y)else for B,C in ipairs(y:GetDescendants())do if C:IsA
'BasePart'and C.Parent then A(C)end end end return z end,function(y)local z=aj
and aj.Character if not z then return 0 end local A=z:FindFirstChild
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
end return J end function ak.UpdateHazardVisualColor(H,I)if not H or not H.Boxes
then return end local J=I==true or H.IsTrajectory==true local K,L=J and E or C,J
and F or D for M,N in ipairs(H.Boxes)do if N and N.Parent then N.Color3=K N.
SurfaceColor3=L end end end local H,I=function(H)if not f or e==''then return
false end if not H or type(H)~='string'then return false end local I=e:lower():
gsub('%s+','')if#I==0 then return false end local J=H:lower():gsub('%s+','')
return string.find(J,I,1,true)~=nil end,function(H)if not H then return'nil'end
return('(%.2f, %.2f, %.2f)'):format(H.X,H.Y,H.Z)end local an=function(J,K,L,M)if
not J then return end local N=J.Name if not H(N)then return end local O,P,Q=J.
ClassName,J.Parent and J.Parent:GetFullName()or'nil',B(J)print
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
end local Z=X*V:Inverse()local _,an=Z:ToAxisAngle()local ao,ap=math.deg(an)/Y,V:
Inverse()*X local aq,ar=ap:ToAxisAngle()if math.abs(math.deg(an))>=1.5 then
local as='Tr\u{1ee5}c t\u{1ef1} do / H\u{1ed7}n h\u{1ee3}p'if math.abs(_.Y)>=0.8
then as='Tr\u{1ee5}c Y (Yaw - Qu\u{e9}t ngang m\u{1eb7}t s\u{e0}n)'elseif math.
abs(_.X)>=0.8 then as='Tr\u{1ee5}c X (Pitch - L\u{103}n nh\u{e0}o l\u{1ed9}n)'
elseif math.abs(_.Z)>=0.8 then as=
'Tr\u{1ee5}c Z (Roll - Nghi\u{ea}ng l\u{1ead}t b\u{ea}n)'end local at=
'Tr\u{1ee5}c t\u{1ef1} do'if math.abs(aq.Y)>=0.8 then at='Tr\u{1ee5}c Local Y'
elseif math.abs(aq.X)>=0.8 then at='Tr\u{1ee5}c Local X'elseif math.abs(aq.Z)>=
0.8 then at='Tr\u{1ee5}c Local Z'end print
'================== \u{1f504} [INSPECT: SPINNING DETECTED] \u{1f504} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(J.Name,T.Name))print((
'  \u{26a1} T\u{1ed1}c \u{111}\u{1ed9} xoay    : %.2f \u{b0}/s (%.2f rad/s)'):
format(ao,an/Y))print(('  \u{1f310} World Spin Axis: %s -> %s'):format(I(_),as))
print(('  \u{1f9e9} Local Spin Axis: %s -> %s'):format(I(aq),at))print
[[========================================================================]]end
end)elseif K=='DESPAWN'then if M and M.SpawnClock then local an=os.clock()-M.
SpawnClock print(('  \u{23f1}\u{fe0f} Lifetime Active: %.2f seconds'):format(an)
)end elseif K=='REJECTED'then print(('  \u{26a0}\u{fe0f} Rejection Reason: %s'):
format(tostring(L)))end print
[[================================================================]]end local ao
,ap=function(ao,ap)an(ao,'REJECTED',ap,nil)if not d then return end local aq,ar=
ao and ao.Name or'?',ao and ao.ClassName or'?'print((
'[HazardScanner][Reject] \u{26aa} %s (%s) \u{2014} %s'):format(aq,ar,ap))end
local aq=function(aq)if not aq or not aq.Parent then return end if s(aq)then
return end if g[aq]then return end if x[aq]then return end local ar={active=true
,count=0}x[aq]=ar task.spawn(function()while ar.active and aq.Parent and al and
am do if s(aq)then y(aq)return end ar.count+=1 local as,at,J=aq:GetDescendants()
,A(aq),H(aq.Name)if d or J then print((
'[HazardScanner][Retry] \u{1f504} L\u{1ea7}n %d/%d: %q (%s) | Descendants: %d | Valid Parts (Trans<=%.2f): %d'
):format(ar.count,v,aq.Name,aq.ClassName,#as,u,#at))end if#at>0 then if d or J
then print((
'[HazardScanner][Retry] \u{2705} L\u{1ea7}n %d/%d: %q \u{110}\u{e3} t\u{ec}m th\u{1ea5}y %d part(s)! Ti\u{1ebf}n h\u{e0}nh v\u{1ebd}...'
):format(ar.count,v,aq.Name,#at))end y(aq)ap(aq)return end if ar.count>=v then
ao(aq,(
'H\u{1ebf}t %d l\u{1b0}\u{1ee3}t retry m\u{e0} kh\u{f4}ng t\u{ec}m th\u{1ea5}y BasePart h\u{1ee3}p l\u{1ec7} (Descendants: %d)'
):format(v,#as))y(aq)return end task.wait(w)end y(aq)end)end ap=function(ar)if
not al or not am then ao(ar,'Ch\u{1b0}a trong dungeon')return false end if not
ar or not ar.Parent then ao(ar,'Kh\u{f4}ng c\u{f2}n Parent')return false end if
s(ar)then ao(ar,
'Nh\u{e2}n v\u{1ead}t ng\u{1b0}\u{1edd}i ch\u{1a1}i (Player/Teammate)')return
false end if g[ar]then return true end q()if r(ar)then ao(ar,
'Tr\u{f9}ng t\u{ea}n trong ReplicatedStorage (abilities/projectiles)')return
false end local as=A(ar)if#as==0 then ao(ar,
'Ch\u{1b0}a c\u{f3} part \u{111}\u{1ec3} v\u{1ebd} (s\u{1ebd} retry)')aq(ar)
return false end local at,J={},{}if b then J=G(as,at)end local K=B(ar)local L={
Instance=ar,Name=ar.Name,Class=ar.ClassName,Distance=K,Boxes=J,Connections=at,
SpawnClock=os.clock()}g[ar]=L o={Name=ar.Name,Class=ar.ClassName,Distance=K}if
ae.IsEnabled()then ae.AttachZoneVisuals(L)end if af.IsEnabled()then af.
AttachTrajectoryVisuals(L)end y(ar)an(ar,'SPAWN','Passed all gates',L)if c then
print(('[HazardScanner][Hazard] \u{1f534} Hazard Detected: %s (%s, %d studs)'):
format(ar.Name,ar.ClassName,K))end t()return true end local ar=function(ar,as)
local at=g[ar]if not at then y(ar)return end an(ar,'DESPAWN',as,at)ae.
DetachZoneVisuals(at)af.DetachTrajectoryVisuals(at)if at.Boxes then for J,K in
ipairs(at.Boxes)do pcall(function()K:Destroy()end)end table.clear(at.Boxes)end
if at.Connections then for J,K in ipairs(at.Connections)do pcall(function()K:
Disconnect()end)end table.clear(at.Connections)end g[ar]=nil if c then local J=
as and(' ('..as..')')or''print((
'[HazardScanner][Hazard] \u{1f7e2} Hazard Expired: %s%s'):format(tostring(at.
Name),J))end t()end function ak.ClearAllHazards(as)ae.ClearAll()af.ClearAll()z()
local at={}for J in pairs(g)do table.insert(at,J)end for J,K in ipairs(at)do ar(
K,as)end if c and as then print((
'[HazardScanner][Hazard] \u{1f9f9} All hazards cleared: %s'):format(as))end end
function ak.StartScan()if al then return end al=true ae.BindDetection(ak)af.
BindDetection(ak)ak.ClearAllHazards'StartScan Reset'for as,at in ipairs(j)do at:
Disconnect()end table.clear(j)table.insert(j,ah.ChildAdded:Connect(function(as)
if s(as)then return end ap(as)end))table.insert(j,ah.ChildRemoved:Connect(
function(as)ar(as,'Destroyed')end))am=ab.GetCurrentRoomIndex()>0 if p then
pcall(p)p=nil end p=ab.OnRoomIndexChanged(function(as)if as>0 then am=true
elseif as<=0 and am then am=false ak.ClearAllHazards'Dungeon Ended'end end)if c
then print'[HazardScanner] \u{1f4e1} Threat Detector started!'end end function
ak.StopScan()al=false am=false for as,at in ipairs(j)do at:Disconnect()end table
.clear(j)if p then pcall(p)p=nil end ak.ClearAllHazards'StopScan'if c then print
'[HazardScanner] \u{1f6d1} Threat Detector stopped.'end end function ak.
IsEnabled()return al end function ak.SetEnabled(as)if as then ak.StartScan()else
ak.StopScan()end end function ak.SetSelectionBoxesEnabled(as)b=as and true or
false if b then for at,J in pairs(g)do if at and at.Parent and(not J.Boxes or#J.
Boxes==0)then local K=A(at)J.Connections=J.Connections or{}J.Boxes=G(K,J.
Connections)end end else for at,J in pairs(g)do if J.Boxes then for K,L in
ipairs(J.Boxes)do pcall(function()L:Destroy()end)end table.clear(J.Boxes)end end
end end function ak.IsSelectionBoxesEnabled()return b end function ak.
SetLogHazards(as)c=as and true or false end function ak.IsLogHazardsEnabled()
return c end function ak.SetLogFailed(as)d=as and true or false end function ak.
IsLogFailedEnabled()return d end function ak.SetInspectTarget(as)e=type(as)==
'string'and as or''end function ak.GetInspectTarget()return e end function ak.
SetInspectEnabled(as)f=as and true or false end function ak.IsInspectEnabled()
return f end function ak.GetHazardCount()return h end function ak.
GetActiveHazards()local as={}for at,J in pairs(g)do if at and at.Parent==ah then
as[#as+1]=J end end return as end function ak.GetActiveHazardsMap()return g end
function ak.GetLastHazardInfo()return o end function ak.OnHazardChanged(as)if
type(as)~='function'then return end table.insert(i,as)end ac.Register(function()
ak.StopScan()ak.ClearAllHazards'Shutdown'end)return ak