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
end)ab.Register(function()af.ClearAll()end)return af end function a.g()local aa,
ab,ac,ad=a.load'a',a.load'b',a.load'd',a.load'f'local ae,af,ag,ah,ai,aj,ak,al,am
,b,c,d,e,f,g,h,i,j=aa.RunService or game:GetService'RunService',aa.player,{},
true,false,{},1.8,Color3.fromRGB(0,255,170),Color3.fromRGB(255,35,35),0.45,0.2,
0.2,(game:GetService'Players')local l,m,n,o=function()local l=af or e.
LocalPlayer if not l then return nil end local m=l.Character if not m or not m.
Parent then return nil end local n=m:FindFirstChildOfClass'Humanoid'if n and n.
Health<=0 then return nil end return m:FindFirstChild'HumanoidRootPart'or m.
PrimaryPart end,function(l)if not l then return 0 end return l.Position.Y-2.5
end,function(l)if i then if i.Parent~=l or not i:IsDescendantOf(workspace)then
pcall(function()i:Destroy()end)i=nil else if i.Adornee~=l then i.Adornee=l end
return i end end if not l or not l.Parent then return nil end local m=Instance.
new'CylinderHandleAdornment'm.Name='Player_2D_HitboxVisual'm.Adornee=l m.Radius=
ak m.Height=d m.Color3=ai and am or al m.Transparency=ai and c or b m.ZIndex=5 m
.AlwaysOnTop=false m.Visible=ah m.Parent=l i=m return m end,function(l)if not i
or not i.Parent then return end i.Color3=l and am or al i.Transparency=l and c
or b end local p=function()local p=l()if not p or not p.Parent then if i and i.
Parent then i.Visible=false end if ai then ai=false f=nil g=nil for q,r in
ipairs(aj)do pcall(r,false,nil,nil)end end return end local q=n(p)if q and q.
Parent then q.Visible=ah q.Radius=ak local r=m(p)local s=CFrame.new(Vector3.new(
p.Position.X,r,p.Position.Z))*CFrame.Angles(math.rad(90),0,0)q.CFrame=p.CFrame:
ToObjectSpace(s)end local r=Vector3.new(p.Position.X,0,p.Position.Z)local s,t,u=
ac.IsPointInAnyHazard(r,nil,ak)local v,w=false if not s and ad.
IsPointInAnyTrajectory then v,w=ad.IsPointInAnyTrajectory(r,ak)end local x,y,z=(
s or v),t or w,s and'Ground Zone'or(v and'Trajectory Corridor'or nil)if x~=ai or
y~=f then ai=x f=y g=z o(x)for A,B in ipairs(aj)do pcall(B,x,y,z)end end end
local q=function()if not h then h=ae.Heartbeat:Connect(p)end end function ag.
Cleanup()if h then h:Disconnect()h=nil end if i then pcall(function()i:Destroy()
end)i=nil end ai=false f=nil g=nil end function ag.IsPlayerInDanger()return ai,f
,g end function ag.GetCurrentThreat()return f,g end function ag.
OnDangerStatusChanged(r)if type(r)=='function'then table.insert(aj,r)end end
function ag.SetVisualEnabled(r)ah=r and true or false if i then i.Visible=ah end
end function ag.IsVisualEnabled()return ah end function ag.SetRadius(r)if type(r
)=='number'and r>=0.1 then ak=r if i and i.Parent then i.Radius=ak end end end
function ag.GetRadius()return ak end local r=function()local r=af or e.
LocalPlayer if not r then return end local s=function(s)if i then pcall(function
()i:Destroy()end)i=nil end task.spawn(function()local t=s:WaitForChild(
'Humanoid',3)if t then t.Died:Connect(function()if i then i.Visible=false end
end)end end)end j=r.CharacterAdded:Connect(s)if r.Character then s(r.Character)
end end r()q()ab.Register(function()if j then j:Disconnect()j=nil end ag.
Cleanup()end)return ag end function a.h()local aa,ab,ac={},{},8 for ad=1,ac do
local ae=(ad-1)*(2*math.pi/ac)ab[ad]=Vector3.new(math.cos(ae),0,math.sin(ae))end
local ad,ae={},16 for af=1,ae do local ag=(af-1)*(2*math.pi/ae)ad[af]=Vector3.
new(math.cos(ag),0,math.sin(ag))end local af,ag={1.5,3,5,8,12,18,25},{1.5,3,4.5,
6,8,10.5,13.5,17,21,26,32,40}aa.COARSE_DIRECTIONS=ab aa.FINE_DIRECTIONS=ad aa.
COARSE_RADII=af aa.FINE_RADII=ag function aa.SamplePass(ah,ai,aj,ak,al,am,b,c)
local d,e,f,g,h=math.huge,Vector3.zero,false,ai if c and c.Magnitude>0.1 then
local i=Vector3.new(c.X,0,c.Z).Unit g=table.clone(ai)table.sort(g,function(j,l)
local m,n=j.X*i.X+j.Z*i.Z,l.X*i.X+l.Z*i.Z return m>n end)end for i,j in ipairs(
aj)do local l=false for m,n in ipairs(g)do local o=ah+n*j local p=am(o)if b then
table.insert(b,{pos=o,isSafe=p,isChosen=false})end if p then local q=o if al and
ak>0 then local r=o+n*ak if am(r)then q=r end end local r=(q-ah).Magnitude if r<
d then d=r h=q e=n l=true end end end if l and h then f=true break end end
return h,f,d,e end return aa end function a.i()local aa,ab,ac,ad,ae,af,ag,ah,ai,
aj,ak,al,am=Color3.fromRGB(0,255,120),Color3.fromRGB(0,255,150),Color3.fromRGB(
255,255,255),Color3.fromRGB(0,235,140),Color3.fromRGB(255,60,60),0.2,1.4,0.45,{}
,{}local b,c=function(b)if not b then return end if not ak or not ak.Parent then
if ak then pcall(function()ak:Destroy()end)end local c=Instance.new
'CylinderHandleAdornment'c.Name='SafeSpot_OuterMarker'c.Adornee=b c.Radius=ag c.
Height=af c.Color3=aa c.Transparency=0.35 c.ZIndex=6 c.AlwaysOnTop=false c.
Visible=false c.Parent=b ak=c end if not al or not al.Parent then if al then
pcall(function()al:Destroy()end)end local c=Instance.new
'CylinderHandleAdornment'c.Name='SafeSpot_CenterDot'c.Adornee=b c.Radius=ah c.
Height=af+0.05 c.Color3=ac c.Transparency=0.15 c.ZIndex=7 c.AlwaysOnTop=false c.
Visible=false c.Parent=b al=c end if not am or not am.Parent then if am then
pcall(function()am:Destroy()end)end local c=Instance.new'LineHandleAdornment'c.
Name='SafeSpot_EscapeLine'c.Adornee=b c.Color3=ab c.Thickness=3.5 c.Transparency
=0.2 c.ZIndex=6 c.AlwaysOnTop=false c.Visible=false c.Parent=b am=c end end,
function(b,c)local d=aj[b]if not d then local e=Instance.new
'CylinderHandleAdornment'e.Name='SafeSpot_CandidateDot_'..b e.Adornee=c e.Radius
=0.25 e.Height=af e.ZIndex=4 e.AlwaysOnTop=false e.Visible=false e.Parent=c
local f=Instance.new'LineHandleAdornment'f.Name='SafeSpot_CandidateLine_'..b f.
Adornee=c f.Thickness=1.2 f.ZIndex=4 f.AlwaysOnTop=false f.Visible=false f.
Parent=c d={dot=e,line=f}aj[b]=d else if d.dot and d.dot.Adornee~=c then d.dot.
Adornee=c d.dot.Parent=c end if d.line and d.line.Adornee~=c then d.line.Adornee
=c d.line.Parent=c end end return d end function ai.HideCandidates()for d,e in
ipairs(aj)do if e.dot and e.dot.Parent then e.dot.Visible=false end if e.line
and e.line.Parent then e.line.Visible=false end end end function ai.Hide()if ak
and ak.Parent then ak.Visible=false end if al and al.Parent then al.Visible=
false end if am and am.Parent then am.Visible=false end ai.HideCandidates()end
local d=function(d,e,f,g)if not g or not f or#f==0 then ai.HideCandidates()
return end local h=Vector3.new(d.Position.X,e+0.05,d.Position.Z)local i=d.CFrame
:PointToObjectSpace(h)for j,l in ipairs(f)do local m,n=c(j,d),Vector3.new(l.pos.
X,e+0.05,l.pos.Z)local o,p,q=d.CFrame:PointToObjectSpace(n),l.isSafe and ad or
ae,l.isSafe and 0.35 or 0.55 if m.dot and m.dot.Parent then local r=CFrame.new(n
)*CFrame.Angles(math.rad(90),0,0)m.dot.CFrame=d.CFrame:ToObjectSpace(r)m.dot.
Color3=p m.dot.Transparency=q m.dot.Radius=l.isSafe and 0.3 or 0.2 m.dot.Visible
=true end if m.line and m.line.Parent then local r=o-i local s=r.Magnitude if s>
0.2 then m.line.CFrame=CFrame.lookAt(i,o)m.line.Length=s m.line.Color3=p m.line.
Transparency=q+0.15 m.line.Thickness=l.isSafe and 1.4 or 0.9 m.line.Visible=true
else m.line.Visible=false end end end for j=#f+1,#aj do local l=aj[j]if l.dot
and l.dot.Parent then l.dot.Visible=false end if l.line and l.line.Parent then l
.line.Visible=false end end end function ai.Update(e,f,g,h,i,j)if not e or not e
.Parent or not i or not f then ai.Hide()return end b(e)local l=Vector3.new(f.X,g
,f.Z)if ak and ak.Parent then local m=CFrame.new(l)*CFrame.Angles(math.rad(90),0
,0)ak.CFrame=e.CFrame:ToObjectSpace(m)ak.Visible=true end if al and al.Parent
then local m=CFrame.new(l)*CFrame.Angles(math.rad(90),0,0)al.CFrame=e.CFrame:
ToObjectSpace(m)al.Visible=true end if am and am.Parent then local m,n=Vector3.
new(e.Position.X,g+0.1,e.Position.Z),Vector3.new(f.X,g+0.1,f.Z)local o,p=e.
CFrame:PointToObjectSpace(m),e.CFrame:PointToObjectSpace(n)local q=p-o local r=q
.Magnitude if r>0.3 then am.CFrame=CFrame.new(o)am.Length=r am.CFrame=CFrame.
lookAt(o,p)am.Visible=true else am.Visible=false end end d(e,g,h,j)end function
ai.Cleanup()if ak then pcall(function()ak:Destroy()end)ak=nil end if al then
pcall(function()al:Destroy()end)al=nil end if am then pcall(function()am:
Destroy()end)am=nil end for e,f in ipairs(aj)do if f.dot then pcall(function()f.
dot:Destroy()end)end if f.line then pcall(function()f.line:Destroy()end)end end
table.clear(aj)end return ai end end local aa,ab,ac,ad,ae,af,ag,ah=a.load'a',a.
load'c',a.load'b',a.load'd',a.load'f',a.load'g',a.load'h',a.load'i'local ai,aj,
ak,al,am,b,c,d,e,f,g,h,i,j,l,m,n,o=aa.RunService or game:GetService'RunService',
game:GetService'Players',aa.player,{},true,true,true,2,0,false,{},{},0 local p,q
,r=function()local p=ak or aj.LocalPlayer if not p then return nil end local q=p
.Character if not q or not q.Parent then return nil end local r=q:
FindFirstChildOfClass'Humanoid'if r and r.Health<=0 then return nil end return q
:FindFirstChild'HumanoidRootPart'or q.PrimaryPart end,function(p)local q=ak or
aj.LocalPlayer if not q then return nil end local r=q.Character if not r or not
r.Parent then return nil end local s=r:FindFirstChildOfClass'Humanoid'if s and s
.Health>0 then local t=s.MoveDirection if t and t.Magnitude>0.1 then return
Vector3.new(t.X,0,t.Z).Unit end end if p and p.Parent then local t=Vector3.zero
pcall(function()t=p.AssemblyLinearVelocity or p.Velocity or Vector3.zero end)
local u=Vector3.new(t.X,0,t.Z)if u.Magnitude>=2 then return u.Unit end end
return nil end,function(p)if not p then return 0 end return p.Position.Y-2.5 end
function al.IsPointSafe(s,t)if not s then return false end local u,v=Vector3.
new(s.X,0,s.Z),(af.GetRadius and af.GetRadius()or 1.8)+(t or 0)if ad.
IsPointInAnyHazard and ad.IsPointInAnyHazard(u,nil,v)then return false end if ae
.IsPointInAnyTrajectory and ae.IsPointInAnyTrajectory(u,v)then return false end
return true end function al.FindNearestSafeSpot(s)local t=p()if not s then if
not t then return nil,false,0,Vector3.zero end s=t.Position end local u,v=
Vector3.new(s.X,0,s.Z),q(t)table.clear(h)local w,x=ad.GetNearbyHazards and ad.
GetNearbyHazards(u,65)or nil,ae.GetNearbyTrajectories and ae.
GetNearbyTrajectories(u,65)or nil local y=function(y,z)if not y then return
false end local A,B=Vector3.new(y.X,0,y.Z),(af.GetRadius and af.GetRadius()or
1.8)+(z or 0)if ad.IsPointInAnyHazard and ad.IsPointInAnyHazard(A,nil,B,w)then
return false end if ae.IsPointInAnyTrajectory and ae.IsPointInAnyTrajectory(A,B,
x)then return false end return true end if(w and#w==0 and x and#x==0)or y(u,0)
then table.insert(h,{pos=u,isSafe=true,isChosen=true})return u,true,0,Vector3.
zero end local z,A=v,af.GetRadius and af.GetRadius()or 1.8 local B,C,D,E=ae.
IsPointInAnyTrajectory(u,A,x)if B and D and E then local F,G,H=Vector3.new(-D.Z,
0,D.X),Vector3.new(D.Z,0,-D.X),u-E local I=H.X*F.X+H.Z*F.Z local J=I>=0 and F or
G if v and v.Magnitude>0.1 then local K,L=v.X*F.X+v.Z*F.Z,v.X*G.X+v.Z*G.Z if K>L
+0.3 then J=F elseif L>K+0.3 then J=G end end local K=0.45 if v and v.Magnitude>
0.1 then local L,M=-(v.X*D.X+v.Z*D.Z),math.abs(v.X*J.X+v.Z*J.Z)if M>0.05 then
local N=L/M K=math.clamp(N,0.18,1)elseif L>0 then K=1 else K=0.18 end end local
L=(J-K*D).Unit z=L end local F,G,H,I=ag.SamplePass(u,ag.COARSE_DIRECTIONS,ag.
COARSE_RADII,d,true,y,h,z)if not G then F,G,H,I=ag.SamplePass(u,ag.
FINE_DIRECTIONS,ag.FINE_RADII,d,true,y,h,z)end if not G then F,G,H,I=ag.
SamplePass(u,ag.FINE_DIRECTIONS,ag.FINE_RADII,0,false,y,h,z)end if G and F then
for J,K in ipairs(h)do if(K.pos-F).Magnitude<0.25 then K.isChosen=true break end
end return F,true,H,I end return u,false,math.huge,Vector3.zero end local s=
function()if not am then ah.Hide()return end local s=p()if not s or not s.Parent
then ah.Hide()return end local t,u,v=false if af.IsPlayerInDanger then t,u,v=af.
IsPlayerInDanger()end local w=t or(j~=nil)or f if not w then local x=os.clock()
if x-i<0.05 then return end i=x end local x,y=r(s),Vector3.new(s.Position.X,0,s.
Position.Z)if t then local z,A,B=j and(j-y).Magnitude or 0,j and al.IsPointSafe(
j),(u==l and v==m)if not A or not B or not j then local C,D,E,F=al.
FindNearestSafeSpot(s.Position)if D and C then j=C l=u m=v e=E f=true ah.Update(
s,C,x,h,b,c)for G,H in ipairs(g)do pcall(H,true,C,E)end else ah.Hide()end else e
=z ah.Update(s,j,x,h,b,c)for C,D in ipairs(g)do pcall(D,true,j,z)end end else
local z,A=j and(j-y).Magnitude or 0,j and al.IsPointSafe(j)if A and z>0.8 then e
=z ah.Update(s,j,x,h,b,c)for B,C in ipairs(g)do pcall(C,true,j,z)end else if f
or j then f=false j=nil l=nil m=nil e=0 ah.Hide()for B,C in ipairs(g)do pcall(C,
false,nil,0)end end end end end local t=function()if not n then n=ai.Heartbeat:
Connect(s)end if not o and af.OnDangerStatusChanged then o=af.
OnDangerStatusChanged(function(t)if t and am then s()end end)end end function al
.Clear()if f or j then f=false j=nil l=nil m=nil e=0 table.clear(h)ah.Hide()for
u,v in ipairs(g)do pcall(v,false,nil,0)end end end function al.Cleanup()if n
then n:Disconnect()n=nil end ah.Cleanup()table.clear(h)j=nil l=nil m=nil e=0 f=
false i=0 end function al.GetLastSafeSpot()return j,e,f end function al.
OnSafeSpotChanged(u)if type(u)=='function'then table.insert(g,u)end end function
al.SetVisualEnabled(u)b=u and true or false if not b then ah.Hide()end end
function al.IsVisualEnabled()return b end function al.SetShowCandidates(u)c=u
and true or false if not c then ah.HideCandidates()end end function al.
IsShowCandidates()return c end function al.SetEnabled(u)am=u and true or false
if not am then ah.Hide()end end function al.IsEnabled()return am end function al
.SetSafetyBuffer(u)if type(u)=='number'and u>=0 then d=u end end function al.
GetSafetyBuffer()return d end local u=function()local u=ak or aj.LocalPlayer if
not u then return end u.CharacterAdded:Connect(function()al.Clear()end)end u()if
ab.OnRoomIndexChanged then ab.OnRoomIndexChanged(function()al.Clear()end)end if
ab.OnEnemyChanged then ab.OnEnemyChanged(function()if ab.GetEnemyCount and ab.
GetEnemyCount()==0 then al.Clear()end end)end if ab.OnLobbyChanged then ab.
OnLobbyChanged(function()al.Clear()end)end if ab.OnBossActiveChanged then ab.
OnBossActiveChanged(function()al.Clear()end)end t()ac.Register(function()al.
Cleanup()end)return al