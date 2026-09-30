--!nocheck
--!nolint

--[[
    @authors YOUR_NAME
    @repository YOUR_REPOSITORY

    This file was automatically generated with darklua, it is not intended for manual editing.
--]]

_P = {
    genDate = "2026-09-26T14:51:37.700885700+00:00",
    cfg = "Recorder_Release",
    vers = "v0.0.0"
}

local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b,c,d,e,f,g,h=game:GetService
'Players',game:GetService'Workspace',game:GetService'ReplicatedStorage',{},{},{
groundaura=true,genericneonball=true,genericattachpart=true,berserk=true,
demonspikeone=true,demonspiketwo=true,demonspikethree=true,groundslam=true,
guardianblessingball=true,holybarrier=true,holycircle=true,innervate=true,
lightningstrike=true,overcharge=true,overchargedeffects=true,pulsefire=true,
pulsewaveswave=true,redemption=true,starfallstar=true,starbarrage=true,taunt=
true,tsunami=true,voidspherespawn=true,vortex=true,whirlwind=true,
chainedenergyblasts=true,orbofdestruction=true,orbofdestructionholder=true,
explosivepunchcone=true,explosivepunchring=true,arrowrain=true,arrowrainarrow=
true,phantomflames=true,infernalblastcylinder=true,chainlightning=true,
mightyleapslamcircle=true,arrowbarrage=true,moltenball=true,smallmoltenball=true
,electricgrinder=true,demoniccurse=true,twinslash=true,aquaticsmitecast=true,
aquaticsmitehit=true,icecrash=true,fungalpoison=true,fungalpoisonparticles=true,
agonyorbsmainorb=true,agonyorbssmall=true,agonyorbsstarexplosion=true,
lightningburst=true,piercingroots=true,crystalinecannonblast=true,
crystalinecannonspiral=true,concussiveblasttrail=true,concussiveblastexplosion=
true,concussiveblastring=true,windblast=true,revitalize=true,flamestrike=true,
frostcone=true,souldrain=true,souldrainparticles=true,geyser=true,flameshuriken=
true,galebarrage=true,solarbeam=true,godspearmodel=true,
godspearexplosioncylinder=true,godspeardebrisring=true,godspeardebris=true,
bladebarragesword=true,bladefallsword=true,amethystbeamorb=true,
amethystbeamgroundparticles=true,amethystbeambeam=true,amethystblast=true,
jaderoller=true,jaderaincircle=true,jaderaincrystal=true,carrotbarrage=true,
carrotbarragecarrot=true,eggbomb=true,phaseball=true,bigphaseball=true,phasering
=true,phasebeammodel=true,moltenshard=true,lavabeam=true,lavabarrageslash=true,
lavabarrageball=true,spearstrike=true,spearstriring=true,spearstrikerng=true},
function(b)if typeof(b)~='string'then return''end return b:lower():gsub('%s+',''
):gsub('%d+',''):gsub('%(clone%)',''):gsub('_',''):gsub('%-','')end local i=
function(i)local j=h(i)if#j>0 then f[j]=true end end local j=function(j)if not j
then return end for k,l in ipairs(j:GetChildren())do i(l.Name)for m,n in ipairs(
l:GetDescendants())do i(n.Name)end end end local k=function()local k={
'abilities','projectiles'}for l,m in ipairs(k)do local n=d:FindFirstChild(m)if n
then j(n)n.ChildAdded:Connect(function(o)i(o.Name)o.DescendantAdded:Connect(
function(p)i(p.Name)end)end)end end end k()task.spawn(function()local l={
'abilities','projectiles'}for m,n in ipairs(l)do local o=d:FindFirstChild(n)if
not o then o=d:WaitForChild(n,10)if o then j(o)o.ChildAdded:Connect(function(p)
i(p.Name)p.DescendantAdded:Connect(function(q)i(q.Name)end)end)end end end end)
local l={'largeicespikes','mediumicespikes','smallicespikes','icespikes'}
function e.IsIceSpikes(m)if not m then return false end local n=typeof(m)==
'Instance'and m.Name or tostring(m)local o=n:lower():gsub('%s+','')if#o==0 then
return false end for p,q in ipairs(l)do if string.find(o,q,1,true)then return
true end end return false end function e.IsFirstBossBigSpike(m)if not m then
return false end local n=typeof(m)=='Instance'and m.Name or tostring(m)local o=n
:lower():gsub('%s+','')if#o==0 or string.find(o,'seekingspike',1,true)then
return false end return string.find(o,'firstbossbigspike',1,true)~=nil or string
.find(o,'bigspike',1,true)~=nil end function e.IsPlayerCharacter(m)if not m then
return true end if b:GetPlayerFromCharacter(m)then return true end if b:
FindFirstChild(m.Name)then return true end for n,o in ipairs(b:GetPlayers())do
if o.Character and(m==o.Character or m:IsDescendantOf(o.Character))then return
true end end local n=b.LocalPlayer local o=n and n.Character if o and(m==o or m:
IsDescendantOf(o))then return true end return false end function e.IsEnemyModel(
m)if not m then return false end if m:IsA'Model'and m:FindFirstChildOfClass
'Humanoid'then return true end if m.Parent and m.Parent:IsA'Model'and m.Parent:
FindFirstChildOfClass'Humanoid'then return true end return false end function e.
IsPlayerAbility(m)if not m then return false end if e.IsMultiRing(m)or e.
IsIceSpikes(m)or e.IsSweepingFlames(m)or e.IsMemoryModel(m)or e.
IsFirstBossBigSpike(m)or e.IsBouncingOrb(m)then return false end if m:
FindFirstChild'creator'or m:FindFirstChild'owner'or m:FindFirstChild'player'then
return true end if m:GetAttribute'Owner'or m:GetAttribute'Creator'or m:
GetAttribute'Player'then return true end local n=m while n and n~=c and n~=game
do local o=n.Name if typeof(o)=='string'then local p=h(o)if#p>0 then if f[p]or g
[p]then return true end for q,r in pairs(g)do if#q>=6 and string.find(p,q,1,true
)then return true end end end local q=d:FindFirstChild'projectiles'if q and q:
FindFirstChild(o)then i(o)return true end local r=d:FindFirstChild'abilities'if
r and r:FindFirstChild(o)then i(o)return true end end n=n.Parent end return
false end function e.IsValidLevel1WorkspaceChild(m)if not m or not m.Parent then
return false end if m.Parent~=c then return false end if m:IsA'Folder'or m:IsA
'Terrain'or m:IsA'Camera'then return false end if not(m:IsA'BasePart'or m:IsA
'Model')then return false end if e.IsPlayerCharacter(m)then return false end if
e.IsEnemyModel(m)then return false end if e.IsPlayerAbility(m)then return false
end return true end function e.IsMultiRing(m)if not m then return false end
local n=typeof(m)=='Instance'and m.Name or tostring(m)local o=n:lower():gsub(
'%s+','')return string.find(o,'thirdbossmultirings',1,true)~=nil or string.find(
o,'multiring',1,true)~=nil end function e.IsSweepingFlames(m)if not m then
return false end local n=typeof(m)=='Instance'and m.Name or tostring(m)local o=n
:lower():gsub('%s+','')return string.find(o,'bonusbosssweepingflames',1,true)~=
nil or string.find(o,'sweepingflames',1,true)~=nil end function e.IsMemoryModel(
m)if not m then return false end local n=typeof(m)=='Instance'and m.Name or
tostring(m)local o=n:lower():gsub('%s+','')return string.find(o,
'bonusbossmemorymodel',1,true)~=nil or string.find(o,'memorymodel',1,true)~=nil
end function e.IsBouncingOrb(m)if not m then return false end local n=typeof(m)
=='Instance'and m.Name or tostring(m)local o=n:lower():gsub('%s+','')return
string.find(o,'bouncingorb',1,true)~=nil end function e.IsHazardPart(m,n)if not
m or not m:IsA'BasePart'or not m.Parent then return false end if m.Name==
'PrimaryPart'then return false end if e.IsPlayerCharacter(m)or(n and e.
IsPlayerCharacter(n))then return false end if e.IsPlayerAbility(m)or(n and e.
IsPlayerAbility(n))then return false end if e.IsMultiRing(m)or(m.Parent and e.
IsMultiRing(m.Parent))or(n and e.IsMultiRing(n))then local o=m.Name:lower()if o
=='center'or o:find'multiring'then return true end return false end local o=e.
IsIceSpikes(m)or(m.Parent and e.IsIceSpikes(m.Parent))or(n and e.IsIceSpikes(n))
if o then local p=m.Name:lower()if p=='precast'or p:find'precast'then return
true end return false end local p=e.IsSweepingFlames(m)or(m.Parent and e.
IsSweepingFlames(m.Parent))or(m.Parent and m.Parent.Parent and e.
IsSweepingFlames(m.Parent.Parent))or(n and e.IsSweepingFlames(n))if p then local
q=m.Name:lower()if q=='precast'then if m.Transparency<=0.85 then return true end
local r=m:FindFirstChildWhichIsA'ParticleEmitter'if r and r.Enabled then return
true end return false end return false end local q=e.IsMemoryModel(m)or(m.Parent
and e.IsMemoryModel(m.Parent))or(n and e.IsMemoryModel(n))if q then local r=m.
Name:lower()if r=='primarypart'then return false end if r:find'precast'or r:find
'hitbox'then if m.Transparency<=0.85 then return true end local s=m:
FindFirstChildWhichIsA'ParticleEmitter'if s and s.Enabled then return true end
return false end return false end local r=e.IsFirstBossBigSpike(m)or(m.Parent
and e.IsFirstBossBigSpike(m.Parent))or(n and e.IsFirstBossBigSpike(n))if r then
local s=m.Name:lower()if s=='primarypart'then return false end return true end
local s=e.IsBouncingOrb(m)or(m.Parent and e.IsBouncingOrb(m.Parent))or(n and e.
IsBouncingOrb(n))if s then local t=m.Name:lower()if t=='primarypart'then return
false end if m.Transparency<=0.85 then return true end return false end if m.
Transparency>0.85 then return false end if m.Material==Enum.Material.Neon then
return true end return false end e.IsNeonHazardPart=e.IsHazardPart function e.
FindHazardPartsInLevel1Child(m)local n={}if not e.IsValidLevel1WorkspaceChild(m)
then return n end if e.IsPlayerAbility(m)or e.IsPlayerCharacter(m)then return n
end if m:IsA'BasePart'then if e.IsHazardPart(m,m)then table.insert(n,m)end
elseif m:IsA'Model'then if e.IsMultiRing(m)then local o=m:FindFirstChild(
'center',true)or m:FindFirstChildWhichIsA'BasePart'if o and o.Name~=
'PrimaryPart'then table.insert(n,o)return n end end if e.IsFirstBossBigSpike(m)
then local o=m.PrimaryPart or m:FindFirstChildWhichIsA'BasePart'if o and e.
IsHazardPart(o,m)then table.insert(n,o)return n end end if e.IsIceSpikes(m)then
local o=m:FindFirstChild('precast',true)if o and o:IsA'BasePart'then table.
insert(n,o)return n end for p,q in ipairs(m:GetDescendants())do if q:IsA
'BasePart'and q.Name:lower():find'precast'then table.insert(n,q)return n end end
return n end for o,p in ipairs(m:GetDescendants())do if p:IsA'BasePart'and e.
IsHazardPart(p,m)then table.insert(n,p)end end end return n end e.
FindNeonPartsInLevel1Child=e.FindHazardPartsInLevel1Child return e end function
a.b()local b,c,d,e,f=a.load'a',game:GetService'Players',{},true,{}local g,h,i=
function()local g=c.LocalPlayer local h=g and g.Character local i=h and(h:
FindFirstChild'HumanoidRootPart'or h.PrimaryPart)return i and i.Position or nil
end,{firstbossbigspike={name='Boss 1 Big Spike',length=120,width=28,mode=
'look_vector'},firstbossseekingspikes={name='Boss 1 Seeking Spikes',length=85,
width=10,mode='look_vector'},firstbosscrisscross={name='Boss 1 Criss Cross',
length=80,width=8,mode='look_vector'},secondbossmovingbeam={name=
'Boss 2 Moving Beam',length=80,width=35,mode='heading_or_look'},
secondbossgreenorb={name='Boss 2 Green Orb',length=25,width=10,mode=
'homing_player'},secondbossyelloworb={name='Boss 2 Yellow Orb',length=25,width=
10,mode='homing_player'},secondbossredorb={name='Boss 2 Red Orb',length=25,width
=10,mode='homing_player'},thirdbossmissile={name='Boss 3 Missile',length=90,
width=8,mode='heading_or_look'},thirdbossbouncingorb={name='Boss 3 Bouncing Orb'
,length=30,width=10,mode='bouncing'},bonusbossbouncingorbbad={name=
'Bonus Boss Bouncing Orb Bad',length=30,width=10,mode='bouncing'},
bonusbossbouncingorb={name='Bonus Boss Bouncing Orb',length=30,width=10,mode=
'bouncing'}},function(g)if not g then return''end return tostring(g):lower():
gsub('%s+','')end function d.GetConfig(j)if not j then return nil end local k=
typeof(j)=='Instance'and j.Name or tostring(j)local l=i(k)if#l>0 then for m,n in
pairs(h)do if string.find(l,m,1,true)then return n,m end end end if typeof(j)==
'Instance'then local m=j.Parent while m and m~=workspace and m~=game do local n=
i(m.Name)if#n>0 then for o,p in pairs(h)do if string.find(n,o,1,true)then return
p,o end end end m=m.Parent end end return nil end function d.IsCorridorSkill(j)
return d.GetConfig(j)~=nil end function d.RegisterSkill(j,k)if not j or type(k)
~='table'then return end local l=i(j)h[l]={name=k.name or j,length=k.length or
60,width=k.width or 10,mode=k.mode or'look_vector'}end function d.
UnregisterSkill(j)if not j then return end local k=i(j)h[k]=nil end function d.
GetConfigMap()return h end function d.SetEnabled(j)e=j and true or false end
function d.IsEnabled()return e end function d.RemoveRecord(j)if j then f[j]=nil
end end function d.ClearAll()table.clear(f)end local j,k,l=function(j)if not j
then return nil end local k=j:IsA'Model'and j or j.Parent while k and k~=
workspace and k~=game do local l=i(k.Name)if(l:find('movingbeam',1,true)or l:
find('secondbossmovingbeam',1,true))and k:IsA'Model'then return k end k=k.Parent
end return nil end,function(j)if not j then return nil end if j.PrimaryPart and
b.IsHazardPart(j.PrimaryPart,j)then return j.PrimaryPart end for k,l in ipairs(j
:GetDescendants())do if l:IsA'BasePart'and b.IsHazardPart(l,j)then return l end
end return j.PrimaryPart or j:FindFirstChildWhichIsA'BasePart'end,function(j,k,l
)local m,n=(k and k.width)or 10,0 if j then if j.radius and j.radius>0 then n=j.
radius*2 elseif j.halfWidth and j.halfWidth>0 then n=j.halfWidth*2 elseif j.
halfX and j.halfX>0 then n=j.halfX*2 elseif j.maxRadius and j.maxRadius>0 then n
=j.maxRadius*2 elseif j.coreRadius and j.coreRadius>0 then n=j.coreRadius*2 end
end if l then local o=math.max(l.X,l.Z)if o>n then n=o end end return math.
clamp(math.max(m,n),m,120)end local m=function(m,n,o,p,q)local r,s,t=pcall(
function()return m:GetBoundingBox()end)if not r or not s or not t then s=n.
CFrame t=n.Size end local u,v,w,x,y,z=s.Position.X,s.Position.Z,(f[m])if w and w
.locked then x=w.fwd2D y=w.right2D z=w.yaw if not w.velocityConfirmed and p and
p.speed and p.speed>=1 and p.headingDir and p.headingDir.Magnitude>0.1 then x=
Vector3.new(p.headingDir.X,0,p.headingDir.Z).Unit y=Vector3.new(-x.Z,0,x.X)z=
math.deg(math.atan2(x.X,-x.Z))w.fwd2D=x w.right2D=y w.yaw=z w.velocityConfirmed=
true end else if p and p.speed and p.speed>=1 and p.headingDir and p.headingDir.
Magnitude>0.1 then x=Vector3.new(p.headingDir.X,0,p.headingDir.Z).Unit y=Vector3
.new(-x.Z,0,x.X)z=math.deg(math.atan2(x.X,-x.Z))w={fwd2D=x,right2D=y,yaw=z,
velocityConfirmed=true,locked=true}elseif o and o.fwd2D and o.right2D and o.
fwd2D.Magnitude>0.1 then x=o.fwd2D.Unit y=o.right2D.Unit z=o.yaw or math.deg(
math.atan2(x.X,-x.Z))w={fwd2D=x,right2D=y,yaw=z,velocityConfirmed=false,locked=
true}else local A=s.LookVector local B=Vector3.new(A.X,0,A.Z)if B.Magnitude>0.01
then x=B.Unit else x=Vector3.new(0,0,-1)end y=Vector3.new(-x.Z,0,x.X)z=math.deg(
math.atan2(x.X,-x.Z))w={fwd2D=x,right2D=y,yaw=z,velocityConfirmed=false,locked=
true}end f[m]=w end local A,B=l(o,q,t),q.length or 80 local C=B/2 local D,E,F,G=
u+x.X*C,v+x.Z*C,u+x.X*B,v+x.Z*B return{skillKey=i(m.Name),name=q.name or
'Boss 2 Moving Beam',length=B,width=A,fwd2D=x,right2D=y,startX=u,startZ=v,
centerX=D,centerZ=E,endX=F,endZ=G,yaw=z,isModelCorridor=true,model=m}end
function d.ComputeCorridor(n,o,p)if not e or not n or not n:IsA'BasePart'or not
o then return nil end local q=d.GetConfig(n)if not q then return nil end local r
=j(n)if r then local s=k(r)if n~=s then return nil end return m(r,s,o,p,q)end if
q.mode=='homing_player'then local s=g()if s then local t=Vector3.new(s.X-o.x,0,s
.Z-o.z)if t.Magnitude>0.5 then fwd2D=t.Unit end end if not fwd2D then if p and p
.headingDir and p.headingDir.Magnitude>0.1 then fwd2D=Vector3.new(p.headingDir.X
,0,p.headingDir.Z).Unit else local t=n.CFrame.LookVector local u=Vector3.new(t.X
,0,t.Z)fwd2D=u.Magnitude>0.01 and u.Unit or Vector3.new(0,0,-1)end end right2D=
Vector3.new(-fwd2D.Z,0,fwd2D.X)yaw=math.deg(math.atan2(fwd2D.X,-fwd2D.Z))f[n]={
fwd2D=fwd2D,right2D=right2D,yaw=yaw,velocityConfirmed=true,locked=false}local t,
u,v,w=q.length or 25,l(o,q),o.x,o.z local x=t/2 local y,z,A,B=v+fwd2D.X*x,w+
fwd2D.Z*x,v+fwd2D.X*t,w+fwd2D.Z*t return{skillKey=i(n.Name),name=q.name,length=t
,width=u,fwd2D=fwd2D,right2D=right2D,startX=v,startZ=w,centerX=y,centerZ=z,endX=
A,endZ=B,yaw=yaw}end local s,t,u,v=(f[n])if s and s.locked then t=s.fwd2D u=s.
right2D v=s.yaw if p and p.speed and p.speed>=1 and p.headingDir and p.
headingDir.Magnitude>0.1 then if t:Dot(p.headingDir)<-0.3 then t=Vector3.new(p.
headingDir.X,0,p.headingDir.Z).Unit u=Vector3.new(-t.Z,0,t.X)v=math.deg(math.
atan2(t.X,-t.Z))s.fwd2D=t s.right2D=u s.yaw=v s.velocityConfirmed=true elseif
not s.velocityConfirmed then t=Vector3.new(p.headingDir.X,0,p.headingDir.Z).Unit
u=Vector3.new(-t.Z,0,t.X)v=math.deg(math.atan2(t.X,-t.Z))s.fwd2D=t s.right2D=u s
.yaw=v s.velocityConfirmed=true end end if q.mode=='bouncing'and p and p.speed
and p.speed>=1 and p.headingDir and p.headingDir.Magnitude>0.1 then local w,x,y=
Vector3.new(p.headingDir.X,0,p.headingDir.Z).Unit,os.clock(),s.lastBounceTime or
0 if t:Dot(w)<0.7 and(x-y)>0.2 then t=w u=Vector3.new(-t.Z,0,t.X)v=math.deg(math
.atan2(t.X,-t.Z))s.fwd2D=t s.right2D=u s.yaw=v s.lastBounceTime=x s.
velocityConfirmed=true end end else if p and p.speed and p.speed>=1 and p.
headingDir and p.headingDir.Magnitude>0.1 then t=Vector3.new(p.headingDir.X,0,p.
headingDir.Z).Unit s={fwd2D=t,right2D=Vector3.new(-t.Z,0,t.X),yaw=math.deg(math.
atan2(t.X,-t.Z)),velocityConfirmed=true,locked=true}elseif o.fwd2D and o.right2D
and o.fwd2D.Magnitude>0.1 then t=o.fwd2D.Unit u=o.right2D.Unit s={fwd2D=t,
right2D=u,yaw=o.yaw or math.deg(math.atan2(t.X,-t.Z)),velocityConfirmed=false,
locked=true}else local w=n.CFrame local x=w.LookVector local y=Vector3.new(x.X,0
,x.Z)if y.Magnitude>0.01 then t=y.Unit elseif p and p.headingDir and p.
headingDir.Magnitude>0.1 then t=Vector3.new(p.headingDir.X,0,p.headingDir.Z).
Unit else t=Vector3.new(0,0,-1)end s={fwd2D=t,right2D=Vector3.new(-t.Z,0,t.X),
yaw=math.deg(math.atan2(t.X,-t.Z)),velocityConfirmed=false,locked=true}end u=s.
right2D v=s.yaw f[n]=s end local w,x,y,z=q.length or 60,l(o,q),o.x,o.z local A=w
/2 local B,C,D,E=y+t.X*A,z+t.Z*A,y+t.X*w,z+t.Z*w return{skillKey=i(n.Name),name=
q.name,length=w,width=x,fwd2D=t,right2D=u,startX=y,startZ=z,centerX=B,centerZ=C,
endX=D,endZ=E,yaw=v}end local n={firstbossbigspike=28,firstbossseekingspikes=32,
firstbosscrisscross=30,secondbossmovingbeam=18,secondbossgreenorb=22,
secondbossyelloworb=22,secondbossredorb=22,thirdbossmissile=35,
thirdbossbouncingorb=25,bonusbossbouncingorb=25,bonusbossbouncingorbbad=25}
function d.GetProjectileSpeed(o,p)if p and p.speed and p.speed>=3 then return p.
speed end if o and o.skillKey then for q,r in pairs(n)do if string.find(o.
skillKey,q,1,true)then return r end end end return 28 end function d.
GetThreatMetrics(o,p,q,r)if not o or not p then return false,0,0,999,false,
Vector3.zero,0 end r=r or 0 local s,t=o.X,o.Z local u,v,w,x,y=s-p.startX,t-p.
startZ,p.fwd2D,p.right2D,(p.width/2)+r local z,A,B,C=u*w.X+v*w.Z,u*x.X+v*x.Z,-
2.5,p.length+r local D=(z>=B and z<=C and math.abs(A)<=y)if not D and r>0 then
local E=0 if z<B then E=B-z elseif z>C then E=z-C end local F=math.max(0,math.
abs(A)-(p.width/2))if(E*E+F*F)<=(r*r)then D=true end end local E,F=d.
GetProjectileSpeed(p,q),math.max(0,z)local G,H=(E>0.1)and(F/E)or 999,math.max(0,
(p.width/2)-math.abs(A))local I,J=(H+2.5)if A>=0 then J=x else J=-x end local K=
I/18 local L=math.clamp(K+0.35,0.85,1.4)local M=math.max(22,E*L)local N=D and(z
>=B)and(G<=L or z<=M)return D,z,A,G,N,J,I end function d.IsThreatImminent(o,p,q,
r)local s,t,u,v,w=d.GetThreatMetrics(o,p,q,r)return w end function d.
IsPointInThreatPath(o,p,q)if not o or not p then return false end q=q or 0 local
r,v=o.X,o.Z local w,x,y,z,A=r-p.startX,v-p.startZ,p.fwd2D,p.right2D,(p.width/2)+
q local B,C,D,E=w*y.X+x*y.Z,w*z.X+x*z.Z,-2.5,p.length+q if q<=0 then return(B>=D
and B<=E and math.abs(C)<=A)else local F=0 if B<D then F=D-B elseif B>E then F=B
-E end local G=math.max(0,math.abs(C)-(p.width/2))return(F*F+G*G)<=(q*q)end end
function d.IsPointInCorridor(o,p,q)if not o or not p then return false end q=q
or 0 local r,v=o.X,o.Z local w,x,y,z,A=r-p.startX,v-p.startZ,p.fwd2D,p.right2D,p
.width/2 local B,C,D,E=w*y.X+x*y.Z,w*z.X+x*z.Z,-2.5,p.length if q<=0 then return
(B>=D and B<=E and math.abs(C)<=A)else local F=0 if B<D then F=D-B elseif B>E
then F=B-E end local G=math.max(0,math.abs(C)-A)return(F*F+G*G)<=(q*q)end end
return d end function a.c()local b,c,d,e,f,g,h,i=a.load'a',a.load'b',{},function
(b)if not b then return'#ff2a55'end local c,d,e=math.clamp(math.floor(b.R*255),0
,255),math.clamp(math.floor(b.G*255),0,255),math.clamp(math.floor(b.B*255),0,255
)return string.format('#%02x%02x%02x',c,d,e)end,function(b)if not b then return
0 end local c=b.LookVector if not c or c.Magnitude<0.001 then return 0 end
return math.deg(math.atan2(c.X,-c.Z))end,{coreRadius=12.5,maxRadius=105,rings={{
rIn=12.5,rOut=25,yawOffset=180,side=1},{rIn=25,rOut=37.5,yawOffset=0,side=0},{
rIn=37.5,rOut=50,yawOffset=180,side=1},{rIn=50,rOut=62.5,yawOffset=0,side=0},{
rIn=62.5,rOut=75,yawOffset=180,side=1},{rIn=75,rOut=87.5,yawOffset=0,side=0},{
rIn=87.5,rOut=105,yawOffset=180,side=1}}},function(b,c,d,e,f,g,h)h=h or 12 local
i,j={},(g or 180)/2 local k,l=f-j,f+j local m,n=math.rad(k),math.rad(l)local o=n
-m for p=0,h do local q=m+(o*(p/h))local r,v=b+math.sin(q)*e,c-math.cos(q)*e
table.insert(i,{x=r,z=v})end for p=h,0,-1 do local q=m+(o*(p/h))local r,v=b+math
.sin(q)*d,c-math.cos(q)*d table.insert(i,{x=r,z=v})end return i end,function(b,c
,d,e)e=e or 16 local f={}for g=0,e-1 do local h=(math.pi*2)*(g/e)local i,j=b+
math.sin(h)*d,c-math.cos(h)*d table.insert(f,{x=i,z=j})end return f end local j=
function(j,k)if not j or not j:IsA'BasePart'or not j.Parent then return nil end
local l,m=j.Size,j.CFrame local n,o,p=m.Position,f(m),e(j.Color)if b.
IsSweepingFlames(j)or(j.Parent and b.IsSweepingFlames(j.Parent))or(j.Parent and
j.Parent.Parent and b.IsSweepingFlames(j.Parent.Parent))then p='#ff6b22'end if b
.IsMemoryModel(j)or(j.Parent and b.IsMemoryModel(j.Parent))then local q=j.Name:
lower()if q:find'good'then p='#22ff88'else p='#ff2a55'end end local q=j:
FindFirstChildWhichIsA('SpecialMesh',true)if q then local r,v,w=math.abs(q.Scale
.X),math.abs(q.Scale.Y),math.abs(q.Scale.Z)l=Vector3.new(l.X*r,l.Y*v,l.Z*w)end
local r,v=j.Name:lower(),(j.Parent and j.Parent.Name:lower())or''local w=b.
IsMultiRing(j)or b.IsMultiRing(j.Parent)or(r=='center'and string.find(v,'ring')
~=nil)if w then local x,y,z=n,j,(j.Parent and j.Parent:IsA'Model')and j.Parent
or nil if z then local A=z:FindFirstChild('center',true)if A and A:IsA'BasePart'
then x=A.Position y=A end end local A=o if y and y.CFrame then A=(f(y.CFrame)+
180)%360 end local B,C={},{}table.insert(C,i(x.X,x.Z,g.coreRadius,16))for D,E in
ipairs(g.rings)do local F=(A+E.yawOffset)%360 local G=h(x.X,x.Z,E.rIn,E.rOut,F,
180,12)table.insert(B,{rIn=E.rIn,rOut=E.rOut,yaw=F,yawOffset=E.yawOffset,span=
180,side=E.side,polygon=G})table.insert(C,G)end return{shape=
'compound_multiring',x=x.X,y=x.Y,z=x.Z,yaw=A,color='#3cd0d0',transparency=j.
Transparency or 0.5,coreRadius=g.coreRadius,maxRadius=g.maxRadius,rings=B,
polygons=C,part=j}end local x=b.IsIceSpikes(j)or(j.Parent and b.IsIceSpikes(j.
Parent))if x then local y={l.X,l.Y,l.Z}table.sort(y)local z=math.max(y[2],y[3])/
2 if z<2 then z=4 end return{shape='circle',x=n.X,y=n.Y,z=n.Z,radius=z,color=p,
transparency=j.Transparency,part=j}end local y=b.IsFirstBossBigSpike(j)or(j.
Parent and b.IsFirstBossBigSpike(j.Parent))if y then local z={l.X,l.Y,l.Z}table.
sort(z)local A=math.max(z[2],z[3])local B=math.clamp(A/2,10,35)if B<12 then B=14
end return{shape='circle',x=n.X,y=n.Y,z=n.Z,radius=B,color=p,transparency=j.
Transparency,part=j}end local z=b.IsBouncingOrb(j)or(j.Parent and b.
IsBouncingOrb(j.Parent))if z then local A={l.X,l.Y,l.Z}table.sort(A)local B=math
.max(A[2],A[3])/2 if B<2 then B=4 end return{shape='circle',x=n.X,y=n.Y,z=n.Z,
radius=B,color=p,transparency=j.Transparency,part=j}end if j:IsA'Part'and j.
Shape==Enum.PartType.Ball then local A=math.max(l.X,l.Y,l.Z)/2 return{shape=
'circle',x=n.X,y=n.Y,z=n.Z,radius=A,color=p,transparency=j.Transparency,part=j}
end if j:IsA'Part'and j.Shape==Enum.PartType.Cylinder then if math.abs(m.
RightVector.Y)>0.75 then local A=math.max(l.Y,l.Z)/2 return{shape='circle',x=n.X
,y=n.Y,z=n.Z,radius=A,color=p,transparency=j.Transparency,part=j}end end local A
,B=math.max(l.X,l.Z),math.min(l.X,l.Z)if B>0 and(A/B)<=1.15 and not j:IsA
'WedgePart'and l.Y<=math.min(l.X,l.Z)then return{shape='circle',x=n.X,y=n.Y,z=n.
Z,radius=A/2,color=p,transparency=j.Transparency,part=j}end local C,D,E,F,G,H,I=
(j:IsA'Part'and j.Shape==Enum.PartType.Cylinder),(r:find'movingbeam'~=nil)or(v:
find'movingbeam'~=nil),(r:find'missile'~=nil)or(v:find'missile'~=nil)if D then H
=math.max(l.X,l.Z)/2 I=math.max(2,math.min(l.X,math.max(l.Y,l.Z))/2)local J=
Vector3.new(m.RightVector.X,0,m.RightVector.Z)if J.Magnitude>0.01 then G=J.Unit
else G=Vector3.new(1,0,0)end F=Vector3.new(-G.Z,0,G.X)if k and k.headingDir and
k.headingDir.Magnitude>0.1 then if F:Dot(k.headingDir)<0 then F=-F G=-G end end
elseif E then local J,K=math.max(l.X,math.max(l.Y,l.Z)),math.min(l.X,math.min(l.
Y,l.Z))I=math.max(0.5,J/2)H=math.max(1.5,K/2)if k and k.speed and k.speed>=1 and
k.headingDir and k.headingDir.Magnitude>0.1 then F=Vector3.new(k.headingDir.X,0,
k.headingDir.Z).Unit G=Vector3.new(-F.Z,0,F.X)else local L=m.LookVector local M=
Vector3.new(L.X,0,L.Z)if M.Magnitude>0.01 then F=M.Unit else F=Vector3.new(0,0,-
1)end G=Vector3.new(-F.Z,0,F.X)end if k and k.headingDir and k.headingDir.
Magnitude>0.1 and k.speed and k.speed>=1 then if F:Dot(k.headingDir)<0 then F=-F
G=-G end end elseif C then local J=m.RightVector local K=Vector3.new(J.X,0,J.Z)
if K.Magnitude>0.01 then F=K.Unit else F=Vector3.new(0,0,-1)end G=Vector3.new(-F
.Z,0,F.X)I=math.max(0.5,l.X/2)H=math.max(0.5,math.max(l.Y,l.Z)/2)else local J,K=
math.max(0.5,l.X/2),math.max(0.5,l.Z/2)H=J I=K local L=m.LookVector local M=
Vector3.new(L.X,0,L.Z)if M.Magnitude>0.01 then F=M.Unit else F=Vector3.new(0,0,-
1)end G=Vector3.new(-F.Z,0,F.X)end local J,K,L=math.deg(math.atan2(F.X,-F.Z)),n.
X,n.Z local M,N,O,P=Vector3.new(K,n.Y,L)+G*H+F*I,Vector3.new(K,n.Y,L)-G*H+F*I,
Vector3.new(K,n.Y,L)-G*H-F*I,Vector3.new(K,n.Y,L)+G*H-F*I local Q={{x=M.X,z=M.Z}
,{x=N.X,z=N.Z},{x=O.X,z=O.Z},{x=P.X,z=P.Z}}return{shape='box',x=n.X,y=n.Y,z=n.Z,
halfX=H,halfZ=I,halfWidth=H,halfLength=I,fwd2D=F,right2D=G,yaw=J,vertices=Q,
color=p,transparency=j.Transparency,part=j}end function d.AnalyzeHazardPart(k,l)
local m=j(k,l)if m and c.IsCorridorSkill(k)then m.corridor=c.ComputeCorridor(k,m
,l)end return m end d.AnalyzeNeonPart=d.AnalyzeHazardPart return d end function
a.d()local b,c,d,e,f=game:GetService'Players',{},{},2,15 local g=function()local
g=b.LocalPlayer local h=g and g.Character local i=h and(h:FindFirstChild
'HumanoidRootPart'or h.PrimaryPart)return i and i.Position or nil end function c
.UpdateRecord(h,i,j)if not h or not i then return nil end local k,l=os.clock(),d
[h]if not l then l={part=h,lastPos=i,lastYaw=j or 0,lastTime=k,velocity=Vector3.
zero,speed=0,angularVel=0,headingDir=Vector3.zero,motionType='STATIC',spawnTime=
k}d[h]=l return l end local m=k-l.lastTime if m>=0.015 then local n=i-l.lastPos
local o=Vector3.new(n.X,0,n.Z)local p,q,r=o.Magnitude/m,o/m,(j or 0)-l.lastYaw
while r>180 do r-=360 end while r<-180 do r+=360 end local v=r/m l.speed=l.speed
*0.4+p*0.6 l.velocity=l.velocity*0.4+q*0.6 l.angularVel=l.angularVel*0.4+v*0.6
if l.speed>0.1 then l.headingDir=l.velocity.Unit end if l.speed>=e then local w=
g()if w and(w-i).Magnitude<100 then local x=(w-i).Unit local y=l.headingDir:Dot(
x)if y>0.85 then l.motionType='HOMING'else l.motionType='LINEAR'end else l.
motionType='LINEAR'end l.angularVel=0 elseif math.abs(l.angularVel)>=f then l.
motionType='SPINNING'else l.motionType='STATIC'end l.lastPos=i l.lastYaw=j or 0
l.lastTime=k end return l end function c.GetRecord(h)return d[h]end function c.
GetTrajectoryProjection(h,i)local j=d[h]if not j or j.motionType=='STATIC'then
return nil end i=i or 1.5 local k,l={},5 local m=i/l for n=1,l do local o=n*m if
j.motionType=='SPINNING'then local p=j.lastYaw+(j.angularVel*o)table.insert(k,{
time=o,x=j.lastPos.X,z=j.lastPos.Z,yaw=p})else local p=j.lastPos+(j.velocity*o)
table.insert(k,{time=o,x=p.X,z=p.Z,yaw=j.lastYaw})end end return{motionType=j.
motionType,speed=j.speed,angularVel=j.angularVel,dirX=j.headingDir.X,dirZ=j.
headingDir.Z,futurePoints=k}end function c.RemoveRecord(h)d[h]=nil end function
c.ClearAll()table.clear(d)end return c end function a.e()local b,c,d=game:
GetService'Workspace',{},false local e,f,g=function()local e=b:FindFirstChild
'dungeon'if e then for f,g in ipairs(e:GetChildren())do if g:IsA'Model'then
local h,i=g:FindFirstChildOfClass'Humanoid',g:FindFirstChild'HumanoidRootPart'or
g.PrimaryPart if h and h.Health>0 and i then local j=g.Name:lower()if string.
find(j,'boss')~=nil or(g.Parent and string.find(g.Parent.Name:lower(),'boss')~=
nil)then return g,h,i end end end end end for f,g in ipairs(b:GetChildren())do
if g:IsA'Model'and g.Name~='dungeon'then local h,i=g:FindFirstChildOfClass
'Humanoid',g:FindFirstChild'HumanoidRootPart'or g.PrimaryPart if h and h.Health>
0 and i then local j=g.Name:lower()if string.find(j,'boss')~=nil then return g,h
,i end end end end return nil,nil,nil end,function(e)local f={}if not e then
return f end local g,h=e:FindFirstChildOfClass'Animator'or e,{}pcall(function()h
=g:GetPlayingAnimationTracks()end)for i,j in ipairs(h)do if j and j.IsPlaying
and j.WeightCurrent>0.1 then local k=''if j.Animation then k=j.Animation.
AnimationId or''end local l=math.max(0.1,j.Length)local m=math.clamp(j.
TimePosition/l,0,1)table.insert(f,{name=j.Name or'Anim',animId=k,speed=j.Speed,
length=l,timePos=j.TimePosition,progress=m,weight=j.WeightCurrent})end end
return f end,function(e)if not e or e.Magnitude<0.001 then return 0 end return
math.deg(math.atan2(e.X,-e.Z))end function c.Start()d=true end function c.Stop()
d=false currentBossModel=nil end function c.Update(h)end function c.
GetTelegraphData()local h,i,j=e()if not h or not j or not i then return{active=
false,bossIndex=0,name='None',x=0,y=0,z=0,health=0,maxHealth=100,healthPercent=
100,yaw=0,isCasting=false,activeAnimations={},arenaActive=false,arenaCenterX=0,
arenaCenterZ=0,arenaRadius=80,innerDeadzoneActive=false,innerDeadzoneRadius=0}
end local k=f(i)local l,m=#k>0,k[1]or nil return{active=true,bossIndex=1,name=h.
Name,x=math.round(j.Position.X*10)/10,y=math.round(j.Position.Y*10)/10,z=math.
round(j.Position.Z*10)/10,health=math.max(0,math.round(i.Health)),maxHealth=math
.max(1,math.round(i.MaxHealth)),healthPercent=math.clamp((i.Health/i.MaxHealth)*
100,0,100),yaw=math.round(g(j.CFrame.LookVector)*10)/10,isCasting=l,
activeAnimations=k,primaryAnimation=m,arenaActive=false,arenaCenterX=0,
arenaCenterZ=0,arenaRadius=80,innerDeadzoneActive=false,innerDeadzoneRadius=0}
end c.GetBossTelegraphData=c.GetTelegraphData c.FindBossModel=e return c end
function a.f()local b,c,d,e,f,g,h,i,j,k,l,m,n=game:GetService'Workspace',a.load
'a',{},false,{},0,'IDLE',0,0,0.25 local o,p=function(o)if not o or not o:IsA
'BasePart'or not o:IsDescendantOf(b)then return false end if o.Transparency<=
0.85 then return true end local p=o:FindFirstChildWhichIsA'ParticleEmitter'if p
and p.Enabled then return true end return false end,function()for o,p in ipairs(
b:GetChildren())do if c.IsMemoryModel(p)and p:IsA'Model'then return p end end
return nil end function d.Reset()e=false table.clear(f)g=0 h='IDLE'l=nil i=0 j=0
m=nil n=nil end function d.Update(q)local r=p()if not r then if e then d.Reset()
end return end if not e then e=true j=q table.clear(f)g=0 h='HINT'end local v,w,
x,y,z,A=r:FindFirstChild'leftPrecast',r:FindFirstChild'rightPrecast',r:
FindFirstChild'leftHitbox',r:FindFirstChild'rightHitbox',r:FindFirstChild
'leftPrecastGood',r:FindFirstChild'rightPrecastGood'local B,C,D,E=o(v)or o(z),o(
w)or o(A),o(x),o(y)local F=D or E if F and h~='EXECUTION'then h='EXECUTION'g=1 l
=nil i=0 end if h=='HINT'then local G if B and not C then G='LEFT'elseif C and
not B then G='RIGHT'end if G and G~=l and(q-i>k)then table.insert(f,G)l=G i=q
elseif not G and l and(q-i>k)then l=nil end elseif h=='EXECUTION'then local G if
D then G='LEFT'elseif E then G='RIGHT'end m=G if G=='LEFT'then n='RIGHT'elseif G
=='RIGHT'then n='LEFT'else local H=math.clamp(g,1,math.max(1,#f))n=f[H]or nil
end if G and G~=l and(q-i>k)then l=G i=q elseif not G and l and(q-i>k)then g=
math.min(#f,g+1)l=nil end end end function d.GetMemoryTelemetry()if not e and#f
==0 then return nil end local q='Waiting...'if h=='HINT'then q=string.format(
'\u{1f9e0} Phase 1: Recorded %d steps',#f)elseif h=='EXECUTION'then local r,v=
math.clamp(g,1,math.max(1,#f)),math.max(1,#f)if n then local w=(n=='LEFT')and
'RIGHT'or'LEFT'q=string.format(
'\u{1f7e2} SAFE: %s | \u{1f534} DANGER: %s (Step %d/%d)',n,w,r,v)else q=string.
format('\u{26a1} Preparing Strike (Step %d/%d)',r,v)end end return{active=e,
phase=h,sequence=f,currentStep=math.clamp(g,1,math.max(1,#f)),totalSteps=#f,
currentAttackSide=m,safeSide=n,hintText=q}end return d end function a.g()local b
,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,v=game:GetService'Workspace',game:GetService
'RunService',game:GetService'Players',{},false,false,false,{},0.22,0.85,0.48,
Color3.fromRGB(255,220,20),Color3.fromRGB(34,255,136),Color3.fromRGB(255,140,0),
0.6,0.2 local w,x,y=function(w)if w and w.color=='#22ff88'then return n end
return m end,function(w)local x=d.LocalPlayer local y=x and x.Character local z,
A=y and(y:FindFirstChild'HumanoidRootPart'or y.PrimaryPart),y and y:
FindFirstChildOfClass'Humanoid'if z and w and math.abs(z.Position.Y-w.Y)<15 then
local B,C=(z.Size and z.Size.Y>0)and(z.Size.Y/2)or 1,(A and A.HipHeight and A.
HipHeight>0)and A.HipHeight or 1.8 return z.Position.Y-(C+B)+0.1 end return(w
and(w.Y-1.5)or 0)+0.1 end,function()if v and v.Parent then return v end local w=
b.Terrain or b local x=w:FindFirstChild'HazardVisualizerV2'if x then v=x return
v end local y=Instance.new'Folder'y.Name='HazardVisualizerV2'local z=pcall(
function()y.Parent=w end)if not z or not y.Parent then pcall(function()y.Parent=
b end)end v=y return y end function e.Detach(z)if not z then return end local A=
i[z]if not A then return end if A.adornments then for B,C in ipairs(A.adornments
)do pcall(function()C:Destroy()end)end table.clear(A.adornments)end if A.
corridorAdornment then pcall(function()A.corridorAdornment:Destroy()end)A.
corridorAdornment=nil end i[z]=nil end function e.ClearAll()for z,A in pairs(i)
do e.Detach(z)end table.clear(i)if v then pcall(function()v:ClearAllChildren()
end)end end function e.Update(z,A)if not f or not z or not z.Parent or not A
then return end if z.Transparency>k then e.Detach(z)return end local B=A.shape
if not B then return end local C=Vector3.new(B.x,B.y,B.z)local D,E,F,G=x(C),w(B)
,y(),i[z]if not G then G={part=z,adornments={},shapeType=B.shape,lastFloorY=D}i[
z]=G else G.lastFloorY=D if G.shapeType~=B.shape then for H,I in ipairs(G.
adornments)do pcall(function()I:Destroy()end)end table.clear(G.adornments)G.
shapeType=B.shape end end if g then if B.shape=='circle'then local H=G.
adornments[1]if not H or not H.Parent or not H:IsA'CylinderHandleAdornment'then
if H then pcall(function()H:Destroy()end)end H=Instance.new
'CylinderHandleAdornment'H.Name='GroundCircle_'..z.Name H.Adornee=b.Terrain H.
AlwaysOnTop=true H.ZIndex=2 H.Transparency=l H.Parent=F G.adornments[1]=H end H.
Radius=B.radius or 5 H.Height=j H.Color3=E H.CFrame=CFrame.new(B.x,D,B.z)*CFrame
.Angles(math.rad(90),0,0)elseif B.shape=='box'then local H=G.adornments[1]if not
H or not H.Parent or not H:IsA'BoxHandleAdornment'then if H then pcall(function(
)H:Destroy()end)end H=Instance.new'BoxHandleAdornment'H.Name='GroundBox_'..z.
Name H.Adornee=b.Terrain H.AlwaysOnTop=true H.ZIndex=2 H.Transparency=l H.Parent
=F G.adornments[1]=H end local I,J,K=B.halfWidth or B.halfX or 2,B.halfLength or
B.halfZ or 2,B.fwd2D or Vector3.new(0,0,-1)if K.Magnitude<0.001 then K=Vector3.
new(0,0,-1)else K=K.Unit end local L=B.right2D if not L or L.Magnitude<0.001
then L=Vector3.new(-K.Z,0,K.X)else L=L.Unit end H.Size=Vector3.new(I*2,j,J*2)H.
Color3=E local M,N=pcall(function()return CFrame.fromMatrix(Vector3.new(B.x,D,B.
z),L,Vector3.yAxis,-K)end)if M and N then H.CFrame=N else H.CFrame=CFrame.new(B.
x,D,B.z)end elseif B.shape=='compound_multiring'then local H=G.adornments[1]if
not H or not H.Parent or not H:IsA'CylinderHandleAdornment'then if H then pcall(
function()H:Destroy()end)end H=Instance.new'CylinderHandleAdornment'H.Name=
'MultiRingCore'H.Adornee=b.Terrain H.AlwaysOnTop=true H.ZIndex=3 H.Transparency=
0.45 H.Color3=Color3.fromRGB(255,235,60)H.Parent=F G.adornments[1]=H end H.
Radius=B.coreRadius or 12.5 H.Height=j H.CFrame=CFrame.new(B.x,D,B.z)*CFrame.
Angles(math.rad(90),0,0)local I,J,K=B.rings or{},2,14 for L,M in ipairs(I)do
local N,O=M.rIn or 12.5,M.rOut or 25 local P,Q,R,S=(N+O)/2,O-N,M.yaw or 0,math.
pi local T,U=S/K,math.rad(R-90)local V=P*T*1.04 for W=1,K do local X=U+(W-0.5)*T
local Y,Z,_,aa,ab=B.x+math.sin(X)*P,B.z-math.cos(X)*P,Vector3.new(math.cos(X),0,
math.sin(X)),Vector3.new(math.sin(X),0,-math.cos(X)),G.adornments[J]if not ab or
not ab.Parent or not ab:IsA'BoxHandleAdornment'then if ab then pcall(function()
ab:Destroy()end)end ab=Instance.new'BoxHandleAdornment'ab.Name='RingArcSeg'ab.
Adornee=b.Terrain ab.AlwaysOnTop=true ab.ZIndex=2 ab.Transparency=0.55 ab.Color3
=m ab.Parent=F G.adornments[J]=ab end ab.Size=Vector3.new(Q,j,V)local ac,ad=
pcall(function()return CFrame.fromMatrix(Vector3.new(Y,D,Z),aa,Vector3.yAxis,-_)
end)if ac and ad then ab.CFrame=ad else ab.CFrame=CFrame.new(Y,D,Z)end J+=1 end
end for aa=J,#G.adornments do if G.adornments[aa]then pcall(function()G.
adornments[aa]:Destroy()end)G.adornments[aa]=nil end end end else if G and G.
adornments and#G.adornments>0 then for aa,ab in ipairs(G.adornments)do pcall(
function()ab:Destroy()end)end table.clear(G.adornments)end end if h and B.
corridor then local aa,ab=B.corridor,G.corridorAdornment if not ab or not ab.
Parent or not ab:IsA'BoxHandleAdornment'then if ab then pcall(function()ab:
Destroy()end)end ab=Instance.new'BoxHandleAdornment'ab.Name='ThreatCorridor_'..(
aa.model and aa.model.Name or z.Name)ab.Adornee=b.Terrain ab.AlwaysOnTop=true ab
.ZIndex=1 ab.Transparency=p ab.Color3=o ab.Parent=F G.corridorAdornment=ab end
ab.Size=Vector3.new(aa.width,q,aa.length)local ac=D if aa.isModelCorridor then
ac=x(Vector3.new(aa.centerX,C.Y,aa.centerZ))end local ad=Vector3.new(aa.centerX,
ac,aa.centerZ)local H=ad+Vector3.new(aa.fwd2D.X,0,aa.fwd2D.Z)local I,J=pcall(
function()return CFrame.lookAt(ad,H)end)if I and J then ab.CFrame=J else ab.
CFrame=CFrame.new(ad)end if not ab.Visible then ab.Visible=true end else if G.
corridorAdornment and G.corridorAdornment.Visible then G.corridorAdornment.
Visible=false end end end local aa=function()if not f then return end local aa={
}for ab,ac in pairs(i)do if not ab or not ab:IsDescendantOf(b)or ab.Transparency
>k then table.insert(aa,ab)end end for ab,ac in ipairs(aa)do e.Detach(ac)end end
local ab=function()local ab=g or h if f==ab then return end f=ab if f then e.
ClearAll()if not r then r=c.Heartbeat:Connect(aa)end else if r then r:
Disconnect()r=nil end e.ClearAll()end end function e.SetEnabled(ac)g=ac and true
or false ab()if not g then for ad,z in pairs(i)do if z.adornments then for A,B
in ipairs(z.adornments)do pcall(function()B:Destroy()end)end table.clear(z.
adornments)end end end end function e.IsEnabled()return g end function e.
SetCorridorEnabled(ac)h=ac and true or false ab()if not h then for ad,z in
pairs(i)do if z.corridorAdornment then pcall(function()z.corridorAdornment:
Destroy()end)z.corridorAdornment=nil end end end end function e.
IsCorridorEnabled()return h end return e end function a.h()local aa,ab,ac,ad,b,c
,d,e,f,g,h,i,j,k,l=game:GetService'Workspace',game:GetService'RunService',game:
GetService'Players',a.load'a',a.load'c',a.load'd',a.load'e',a.load'f',a.load'g',
a.load'b',{},false,{},{},{}local m,n=function(m,n)if not m or not m:IsA
'BasePart'then return end if ad.IsPlayerCharacter(m)or(n and ad.
IsPlayerCharacter(n))then return end if ad.IsPlayerAbility(m)or(n and ad.
IsPlayerAbility(n))then return end if not ad.IsHazardPart(m,n)then return end if
j[m]then return end local o=n and n.Name or(m.Parent and m.Parent.Name)or m.Name
local p=ad.IsMultiRing(o)or ad.IsMultiRing(m)or(m.Parent and ad.IsMultiRing(m.
Parent.Name))or(n and ad.IsMultiRing(n))if p then for q,r in pairs(j)do if r.
level1Parent==n or(n and q:IsDescendantOf(n))or q==m then return end end end
local q=ad.IsIceSpikes(o)or ad.IsIceSpikes(m)or(m.Parent and ad.IsIceSpikes(m.
Parent.Name))or(n and ad.IsIceSpikes(n))if q then for r,v in pairs(j)do if v.
level1Parent==n or(n and r:IsDescendantOf(n))or r==m then return end end end
local r=b.AnalyzeHazardPart(m)if not r then return end local v,w=os.clock(),
Vector3.new(r.x,r.y,r.z)local x,y=c.UpdateRecord(m,w,r.yaw or 0),(m.Name==o)and
o or(o..'/'..m.Name)if p then y=o elseif ad.IsSweepingFlames(o)and m.Parent and
m.Parent~=n then y=o..'/'..m.Parent.Name elseif ad.IsMemoryModel(o)then y=o..'/'
..m.Name end local z={part=m,level1Parent=n or m,name=y,spawnTime=v,shape=r,
motion=x}j[m]=z if f.IsEnabled()or f.IsCorridorEnabled()then f.Update(m,z)end
end,function(m)local n=j[m]if n then f.Detach(m)j[m]=nil c.RemoveRecord(m)g.
RemoveRecord(m)if m.Parent and m.Parent:IsA'Model'then g.RemoveRecord(m.Parent)
end end end local o,p,q,r=function(o)if not ad.IsValidLevel1WorkspaceChild(o)
then return end if ad.IsPlayerAbility(o)or ad.IsPlayerCharacter(o)then return
end local p=ad.FindHazardPartsInLevel1Child(o)for q,r in ipairs(p)do m(r,o)end
if o:IsA'Model'then k[o]=o.DescendantAdded:Connect(function(q)if q:IsA'BasePart'
then if ad.IsPlayerAbility(q)or ad.IsPlayerAbility(o)then return end if ad.
IsPlayerCharacter(q)or ad.IsPlayerCharacter(o)then return end if ad.IsMultiRing(
o)or ad.IsIceSpikes(o)then local r=false for v,w in pairs(j)do if w.level1Parent
==o or v:IsDescendantOf(o)or v==o then r=true break end end if not r and ad.
IsHazardPart(q,o)then m(q,o)end elseif ad.IsHazardPart(q,o)then m(q,o)end end
end)end end,function(o)if k[o]then k[o]:Disconnect()k[o]=nil end local p={}for q
,r in pairs(j)do if r.level1Parent==o or q==o or(o:IsA'Instance'and q:
IsDescendantOf(o))then table.insert(p,q)end end for q,r in ipairs(p)do n(r)end g
.RemoveRecord(o)end,function()for o,p in ipairs(aa:GetChildren())do if ad.
IsValidLevel1WorkspaceChild(p)then local q=ad.FindHazardPartsInLevel1Child(p)for
r,v in ipairs(q)do m(v,p)end end end end,function()if not i then return end
local o,p={},os.clock()e.Update(p)for q,r in pairs(j)do if not q or not q:
IsDescendantOf(aa)then table.insert(o,q)continue end if r.level1Parent and not r
.level1Parent:IsDescendantOf(aa)then table.insert(o,q)continue end local v,w,x,y
=ad.IsMultiRing(r.name)or ad.IsMultiRing(q)or(r.level1Parent and ad.IsMultiRing(
r.level1Parent)),ad.IsSweepingFlames(r.name)or ad.IsSweepingFlames(q)or(r.
level1Parent and ad.IsSweepingFlames(r.level1Parent)),ad.IsMemoryModel(r.name)or
ad.IsMemoryModel(q)or(r.level1Parent and ad.IsMemoryModel(r.level1Parent)),ad.
IsFirstBossBigSpike(r.name)or ad.IsFirstBossBigSpike(q)or(r.level1Parent and ad.
IsFirstBossBigSpike(r.level1Parent))if v then local z=p-r.spawnTime if z>4.5
then table.insert(o,q)continue end local A=(r.level1Parent and r.level1Parent:
IsA'Model'and r.level1Parent)or(q.Parent and q.Parent:IsA'Model'and q.Parent)if
A then local B=false for C,D in ipairs(A:GetDescendants())do if D:IsA'BasePart'
and D.Name~='PrimaryPart'then if D.Transparency<=0.85 then B=true break end end
end if not B then table.insert(o,q)continue end elseif q.Transparency>0.85 then
table.insert(o,q)continue end elseif w then local z=false if q.Transparency<=
0.85 then z=true else local A=q:FindFirstChildWhichIsA'ParticleEmitter'if A and
A.Enabled then z=true end end local A=p-r.spawnTime if not z or A>2 then table.
insert(o,q)continue end elseif x then local z=false if q.Transparency<=0.85 then
z=true else local A=q:FindFirstChildWhichIsA'ParticleEmitter'if A and A.Enabled
then z=true end end local A=p-r.spawnTime if not z or A>2.5 then table.insert(o,
q)continue end elseif y then local z=false if q.Transparency<=0.85 then z=true
else local A=aa:FindFirstChild'firstBossBeamPart'if A then z=true end end local
A=p-r.spawnTime if not z or A>5 then table.insert(o,q)continue end else if q.
Transparency>0.85 then table.insert(o,q)continue end end local z=c.GetRecord(q)
local A=b.AnalyzeHazardPart(q,z)if A then r.shape=A local B=Vector3.new(A.x,A.y,
A.z)r.motion=c.UpdateRecord(q,B,A.yaw or 0)if f.IsEnabled()or f.
IsCorridorEnabled()then f.Update(q,r)end else table.insert(o,q)end end for q,r
in ipairs(o)do n(r)end for q,r in ipairs(aa:GetChildren())do if ad.
IsSweepingFlames(r)and r:IsA'Model'then for v,w in ipairs(r:GetDescendants())do
if w:IsA'BasePart'and w.Name:lower()=='precast'and not j[w]then if ad.
IsHazardPart(w,r)then m(w,r)end end end elseif ad.IsMemoryModel(r)and r:IsA
'Model'then for v,w in ipairs(r:GetDescendants())do if w:IsA'BasePart'and not j[
w]then if ad.IsHazardPart(w,r)then m(w,r)end end end elseif ad.
IsFirstBossBigSpike(r)then local v=ad.FindHazardPartsInLevel1Child(r)for w,x in
ipairs(v)do if not j[x]and ad.IsHazardPart(x,r)then m(x,r)end end end end end
function h.StartScan()if i then return end i=true table.clear(j)table.clear(k)c.
ClearAll()e.Reset()table.insert(l,aa.ChildAdded:Connect(o))table.insert(l,aa.
ChildRemoved:Connect(p))heartbeatConn=ab.Heartbeat:Connect(r)q()end h.Start=h.
StartScan function h.StopScan()if not i then return end i=false if heartbeatConn
then heartbeatConn:Disconnect()heartbeatConn=nil end for v,w in ipairs(l)do if w
and w.Disconnect then w:Disconnect()end end table.clear(l)for v,w in pairs(k)do
if w and w.Disconnect then w:Disconnect()end end table.clear(k)f.ClearAll()table
.clear(j)c.ClearAll()g.ClearAll()e.Reset()end h.Stop=h.StopScan function h.
IsEnabled()return i end function h.SetVisualizerEnabled(v)if v and not h.
IsEnabled()then h.StartScan()end f.SetEnabled(v)f.SetCorridorEnabled(v)if f.
IsEnabled()or f.IsCorridorEnabled()then for w,x in pairs(j)do f.Update(w,x)end
end end function h.IsVisualizerEnabled()return f.IsEnabled()end function h.
GetActiveHazardsTelemetry()local v,w={},os.clock()for x,y in pairs(j)do local z=
y.shape if not z then continue end local A,B=c.GetTrajectoryProjection(x,1.5),w-
y.spawnTime if z.shape=='compound_multiring'then table.insert(v,{id=tostring(x),
name=y.name,shape='compound_multiring',x=z.x,y=z.y,z=z.z,yaw=z.yaw or 0,
coreRadius=z.coreRadius or 12.5,maxRadius=z.maxRadius or 105,rings=z.rings,
polygons=z.polygons,color=z.color or'#3cd0d0',transparency=z.transparency or 0.5
,age=B,motionType=y.motion and y.motion.motionType or'STATIC',speed=y.motion and
y.motion.speed or 0,angularVel=y.motion and y.motion.angularVel or 0,trajectory=
A,corridor=z.corridor})elseif z.shape=='circle'then table.insert(v,{id=tostring(
x),name=y.name,shape='circle',x=z.x,y=z.y,z=z.z,radius=z.radius,color=z.color or
'#ff2a55',age=B,motionType=y.motion and y.motion.motionType or'STATIC',speed=y.
motion and y.motion.speed or 0,angularVel=y.motion and y.motion.angularVel or 0,
trajectory=A,corridor=z.corridor})elseif z.shape=='box'then table.insert(v,{id=
tostring(x),name=y.name,shape='box',x=z.x,y=z.y,z=z.z,halfX=z.halfX,halfZ=z.
halfZ,halfWidth=z.halfWidth or z.halfX,halfLength=z.halfLength or z.halfZ,width=
(z.halfWidth and z.halfWidth*2)or(z.halfX and z.halfX*2)or z.width or 10,length=
(z.halfLength and z.halfLength*2)or(z.halfZ and z.halfZ*2)or z.length or 10,
fwd2D=z.fwd2D,right2D=z.right2D,yaw=z.yaw,vertices=z.vertices,color=z.color or
'#ff2a55',age=B,motionType=y.motion and y.motion.motionType or'STATIC',speed=y.
motion and y.motion.speed or 0,angularVel=y.motion and y.motion.angularVel or 0,
trajectory=A,corridor=z.corridor})elseif z.shape=='polygon'then table.insert(v,{
id=tostring(x),name=y.name,shape='polygon',x=z.x,y=z.y,z=z.z,vertices=z.vertices
,color=z.color or'#ff2a55',age=B,motionType=y.motion and y.motion.motionType or
'STATIC',speed=y.motion and y.motion.speed or 0,angularVel=y.motion and y.motion
.angularVel or 0,trajectory=A,corridor=z.corridor})end end return v end function
h.GetBossTelegraphTelemetry()return d.GetBossTelegraphData()end function h.
GetMemoryGameTelemetry()return e.GetMemoryTelemetry()end return h end function a
.i()local aa,ab,ac,ad=game:GetService'Players',{},function(aa)if not aa or aa.
Magnitude<0.001 then return 0 end return math.deg(math.atan2(aa.X,-aa.Z))end,
function(aa,ab,ac)if not ac or not ac.x or not ac.z then return false,99999,
99999 end local ad,b=aa-ac.x,ab-ac.z local c,d=math.sqrt(ad*ad+b*b),tostring(ac.
shape):lower()if d=='circle'then local e=ac.radius or 10 local f,g=c<=e,c-e
return f,c,g elseif d=='compound_multiring'then local e=ac.maxRadius or 105
local f,g=c<=e,c-e return f,c,g else local e=math.rad(ac.yaw or 0)local f,g=math
.cos(-e),math.sin(-e)local h,i,j,k=math.abs(ad*f-b*g),math.abs(ad*g+b*f),(ac.
halfWidth or ac.halfX or(ac.width and ac.width/2)or 5),(ac.halfLength or ac.
halfZ or(ac.length and ac.length/2)or 5)local l,m,n=(h<=j)and(i<=k),math.max(0,h
-j),math.max(0,i-k)local o=l and-math.min(j-h,k-i)or math.sqrt(m*m+n*n)return l,
c,o end end function ab.Sample(b,c)local d=aa.LocalPlayer local e=d and d.
Character local f,g=e and(e:FindFirstChild'HumanoidRootPart'or e.PrimaryPart),e
and e:FindFirstChildOfClass'Humanoid'if not f or not g then return nil end local
h,i=f.Position,f.CFrame.LookVector local j,k,l=ac(i),g.MoveDirection or Vector3.
zero,Vector3.zero pcall(function()l=f.AssemblyLinearVelocity or f.Velocity or
Vector3.zero end)local m,n,o,p=false,99999,99999 if b and#b>0 then for q,r in
ipairs(b)do local v,w,x=ad(h.X,h.Z,r)if v then m=true end if x<n then n=x o=w p=
{name=r.name or'Hazard',shape=r.shape or'box',distEdge=math.round(x*10)/10,
distCenter=math.round(w*10)/10}end end end local q if c and c.active and c.x and
c.z then local r,v=c.x-h.X,c.z-h.Z local w,x=math.sqrt(r*r+v*v),math.deg(math.
atan2(r,-v))local y=(j-x)if y>180 then y=y-360 elseif y<-180 then y=y+360 end q=
{name=c.name or'Boss',distance=math.round(w*10)/10,angleToBoss=math.round(y*10)/
10,bossHp=c.health or c.hp or 0,bossMaxHp=c.maxHealth or c.maxHp or 100}end
return{player={name=d.Name or'Player',x=math.round(h.X*10)/10,y=math.round(h.Y*
10)/10,z=math.round(h.Z*10)/10,yaw=math.round(j*10)/10,moveX=math.round((k.X or
0)*1000)/1000,moveZ=math.round((k.Z or 0)*1000)/1000,moveMagnitude=math.round(
Vector3.new(k.X or 0,0,k.Z or 0).Magnitude*1000)/1000,velX=math.round((l.X or 0)
*10)/10,velY=math.round((l.Y or 0)*10)/10,velZ=math.round((l.Z or 0)*10)/10,
speed=math.round(Vector3.new(l.X or 0,0,l.Z or 0).Magnitude*10)/10,walkSpeed=g.
WalkSpeed or 16,health=math.round(g.Health or 100),maxHealth=math.round(g.
MaxHealth or 100),isJumping=g.Jump or((l.Y or 0)>5)},danger={inDanger=m,
nearestHazard=p},boss=q}end return ab end function a.j()local aa,ab,ac,ad,b,c,d,
e,f,g,h,i,j,k,l,m,n,o,p,q,r=game:GetService'HttpService',game:GetService
'RunService',game:GetService'Workspace',game:GetService'Players',a.load'h',a.
load'i',{},false,false,0,0,{},30,0,'ws://127.0.0.1:8765',true,'Disconnected',{}
local v,w,x=function()local v=d.GetStats()for w,x in ipairs(o)do pcall(x,v)end
end,function()if typeof(WebSocket)=='table'and typeof(WebSocket.connect)==
'function'then return WebSocket.connect elseif typeof(WebSocket)=='table'and
typeof(WebSocket.Connect)=='function'then return WebSocket.Connect elseif
typeof(websocket)=='table'and typeof(websocket.connect)=='function'then return
websocket.connect elseif typeof(syn)=='table'and typeof(syn.websocket)=='table'
and typeof(syn.websocket.connect)=='function'then return syn.websocket.connect
end return nil end,function(v,w)if not v then return false end if typeof(v.Send)
=='function'then return pcall(function()v:Send(w)end)elseif typeof(v.send)==
'function'then return pcall(function()v:send(w)end)end return false end function
d.ConnectWebSocket()if not m then return end if q then return end local y=w()if
not y then n='Unsupported'v()return end n='Connecting'v()task.spawn(function()
local z,A=pcall(y,l)if z and A then q=A n='Connected'if A.OnClose then A.OnClose
:Connect(function()q=nil n='Disconnected'v()end)end if A.OnError then A.OnError:
Connect(function()q=nil n='Error'v()end)end else q=nil n='Disconnected'end v()
end)end function d.DisconnectWebSocket()if q then pcall(function()if typeof(q.
Close)=='function'then q:Close()elseif typeof(q.close)=='function'then q:close()
end end)q=nil n='Disconnected'v()end end local y=function(y)if not y or y.
Magnitude<0.001 then return 0 end return math.deg(math.atan2(y.X,-y.Z))end local
z,A,B=function()local z,A={},ac:FindFirstChild'dungeon'if A then for B,C in
ipairs(A:GetChildren())do if C:IsA'Model'and C:FindFirstChildOfClass'Humanoid'
then local D,E=C:FindFirstChildOfClass'Humanoid',C:FindFirstChild
'HumanoidRootPart'or C.PrimaryPart if D and D.Health>0 and E then local F=C.Name
table.insert(z,{name=F,x=math.round(E.Position.X*10)/10,y=math.round(E.Position.
Y*10)/10,z=math.round(E.Position.Z*10)/10,yaw=math.round(y(E.CFrame.LookVector)*
10)/10,health=math.round(D.Health),maxHealth=math.round(D.MaxHealth),isBoss=
string.find(F:lower(),'boss')~=nil})end end end end return z end,function()local
z=ac:FindFirstChild'dungeon'if z and z:FindFirstChild'dungeonName'then local A=z
.dungeonName.Value if typeof(A)=='string'and#A>0 then return A end end return
'DungeonQuest'end,function()local z=ac:FindFirstChild'dungeon'if z and z:
FindFirstChild'currentRoom'then local A=z.currentRoom.Value if typeof(A)==
'number'then return A end end return 0 end local C=function()pcall(function()
local C,D=os.clock(),1/j if(C-k)<D then return end k=C local E,F,G,H=b.
GetActiveHazardsTelemetry(),b.GetBossTelegraphTelemetry(),z(),b.
GetMemoryGameTelemetry and b.GetMemoryGameTelemetry()or nil local I=c.Sample(E,F
)if not I then local J=ad.LocalPlayer I={player={name=J and J.Name or'Player',x=
0,y=0,z=0,yaw=0,moveX=0,moveZ=0,moveMagnitude=0,velX=0,velY=0,velZ=0,speed=0,
walkSpeed=16,health=100,maxHealth=100,isJumping=false},danger={inDanger=false,
nearestHazard=nil},boss=nil}end if f then h=h+1 local J={f=h,t=math.round((C-g)*
1000)/1000,player=I.player,danger=I.danger,boss=F,hazards=E,memory=H,mobsCount=#
G}if#i<40000 then table.insert(i,J)end end if q and n=='Connected'then local J,K
,L=false,(ad.LocalPlayer)if K and K.Character and K.Character:
FindFirstChildOfClass'ForceField'then J=true L='ForceField'end local M={type=
'TELEMETRY',version='V2',timestamp=C,dungeon=A(),inLobby=(ac:FindFirstChild
'dungeon'==nil),room=B(),player={name=I.player.name,x=I.player.x,y=I.player.y,z=
I.player.z,yaw=I.player.yaw,moveX=I.player.moveX,moveZ=I.player.moveZ,health=I.
player.health,maxHealth=I.player.maxHealth,healthPercent=math.clamp((I.player.
health/math.max(1,I.player.maxHealth))*100,0,100),isInvulnerable=J,invulnReason=
L,isDead=I.player.health<=0},boss=F,enemies=G,hazards=E,memory=H}pcall(function(
)x(q,aa:JSONEncode(M))end)end local J=f and h or math.floor(C*4)if J%6==0 then
v()end end)end function d.Init()if e then return end e=true b.Start()d.
ConnectWebSocket()if not p then p=ab.Heartbeat:Connect(C)end end function d.
Start()d.Init()if f then return end f=true g=os.clock()h=0 table.clear(i)r=nil
v()end function d.Stop()if not f then return end f=false v()end function d.Clear
()table.clear(i)h=0 r=nil v()end function d.SaveToFile(D)if#i==0 then return
false,
'Buffer tr\u{1ed1}ng, ch\u{1b0}a c\u{f3} d\u{1eef} li\u{1ec7}u n\u{e0}o \u{111}\u{1b0}\u{1ee3}c ghi!'
end local E=os.date'!*t'local F,G=string.format('%04d%02d%02d_%02d%02d%02d',E.
year,E.month,E.day,E.hour,E.min,E.sec),A():gsub('%s+','_'):gsub('[^%w_]','')
local H,I=D or string.format('DQ_FlightLog_%s_%s.json',G,F),'DQ_FlightLogs'
pcall(function()if typeof(makefolder)=='function'then makefolder(I)end end)local
J,K,L=I..'/'..H,{metadata={game='DungeonQuest',dungeon=A(),room=B(),date=os.date
'%Y-%m-%d %H:%M:%S',totalFrames=#i,durationSeconds=math.round((os.clock()-g)*10)
/10,targetFps=j,player=ad.LocalPlayer and ad.LocalPlayer.Name or'Unknown'},
frames=i}local M,N=pcall(function()L=aa:JSONEncode(K)end)if not M or not L then
return false,'L\u{1ed7}i m\u{e3} ho\u{e1} JSON: '..tostring(N)end local O,P=
pcall(function()if typeof(writefile)=='function'then writefile(J,L)return true
end error'Executor kh\u{f4}ng h\u{1ed7} tr\u{1ee3} writefile'end)if O then r=J
v()return true,J else return false,'L\u{1ed7}i ghi file: '..tostring(P)end end
function d.GetStats()local D,E=f and(os.clock()-g)or(#i>0 and(i[#i].t or 0)or 0)
,b.GetActiveHazardsTelemetry()return{isRecording=f,frameCount=#i,duration=math.
round(D*10)/10,activeHazards=#E,wsStatus=n,lastSavedFilePath=r}end function d.
SetFps(D)j=math.clamp(D or 30,10,60)end function d.GetFps()return j end function
d.SetWsUrl(D)l=D or'ws://127.0.0.1:8765'end function d.GetWsUrl()return l end
function d.ToggleWsStream(D)m=D if D then d.ConnectWebSocket()else d.
DisconnectWebSocket()end end function d.IsWsStreamEnabled()return m end function
d.OnStatsChanged(D)table.insert(o,D)end function d.Cleanup()d.Stop()b.Stop()d.
DisconnectWebSocket()if p then pcall(function()p:Disconnect()end)p=nil end table
.clear(i)table.clear(o)e=false end return d end function a.k()local aa,ab,ac,ad,
b,c,d=game:GetService'Players',game:GetService'UserInputService',a.load'j',a.
load'h',{},false local e=function()if typeof(gethui)=='function'then local e,f=
pcall(gethui)if e and f then return f end end local e=aa.LocalPlayer if e then
local f=e:FindFirstChild'PlayerGui'if f then return f end end local f,g=pcall(
function()return game:GetService'CoreGui'end)if f and g then return g end if e
then local h,i=pcall(function()return e:WaitForChild('PlayerGui',3)end)if h and
i then return i end end return nil end function b.Create()if d then d:Destroy()d
=nil end local f=e()if not f then return warn
'[FlightRecorder HUD] Kh\u{f4}ng t\u{ec}m th\u{1ea5}y GUI Container ph\u{f9} h\u{1ee3}p.'
end d=Instance.new'ScreenGui'd.Name='Esclipse_FlightRecorder_HUD'd.ResetOnSpawn=
false d.ZIndexBehavior=Enum.ZIndexBehavior.Sibling pcall(function()d.Parent=f
end)local g=Instance.new'Frame'g.Name='MainCard'g.Size=UDim2.fromOffset(260,245)
g.Position=UDim2.new(0,20,0,100)g.BackgroundColor3=Color3.fromRGB(12,18,28)g.
BorderSizePixel=0 g.Active=true g.ClipsDescendants=true g.Parent=d local h=
Instance.new'UICorner'h.CornerRadius=UDim.new(0,10)h.Parent=g local i=Instance.
new'UIStroke'i.Color=Color3.fromRGB(30,48,80)i.Thickness=1.5 i.Parent=g local j,
k,l,m local n=function(n)local o=n.Position-l g.Position=UDim2.new(m.X.Scale,m.X
.Offset+o.X,m.Y.Scale,m.Y.Offset+o.Y)end g.InputBegan:Connect(function(o)if o.
UserInputType==Enum.UserInputType.MouseButton1 or o.UserInputType==Enum.
UserInputType.Touch then j=true l=o.Position m=g.Position o.Changed:Connect(
function()if o.UserInputState==Enum.UserInputState.End then j=false end end)end
end)g.InputChanged:Connect(function(o)if o.UserInputType==Enum.UserInputType.
MouseMovement or o.UserInputType==Enum.UserInputType.Touch then k=o end end)ab.
InputChanged:Connect(function(o)if o==k and j then n(o)end end)local o=Instance.
new'Frame'o.Size=UDim2.new(1,0,0,32)o.BackgroundColor3=Color3.fromRGB(18,26,40)o
.BorderSizePixel=0 o.Parent=g local p=Instance.new'UICorner'p.CornerRadius=UDim.
new(0,10)p.Parent=o local q=Instance.new'TextLabel'q.Size=UDim2.new(1,-60,1,0)q.
Position=UDim2.new(0,12,0,0)q.BackgroundTransparency=1 q.Text=
'\u{26a1} Flight Recorder'q.TextColor3=Color3.fromRGB(0,240,255)q.Font=Enum.Font
.GothamBold q.TextSize=13 q.TextXAlignment=Enum.TextXAlignment.Left q.Parent=o
local r=Instance.new'TextButton'r.Size=UDim2.fromOffset(24,24)r.Position=UDim2.
new(1,-52,0,4)r.BackgroundColor3=Color3.fromRGB(28,40,60)r.Text='\u{2014}'r.
TextColor3=Color3.fromRGB(200,200,200)r.Font=Enum.Font.GothamBold r.TextSize=12
r.Parent=o local v=Instance.new'UICorner'v.CornerRadius=UDim.new(0,6)v.Parent=r
local w=Instance.new'TextButton'w.Size=UDim2.fromOffset(24,24)w.Position=UDim2.
new(1,-26,0,4)w.BackgroundColor3=Color3.fromRGB(50,20,25)w.Text='\u{2715}'w.
TextColor3=Color3.fromRGB(255,80,80)w.Font=Enum.Font.GothamBold w.TextSize=11 w.
Parent=o local x=Instance.new'UICorner'x.CornerRadius=UDim.new(0,6)x.Parent=w
local y=Instance.new'Frame'y.Name='Content'y.Size=UDim2.new(1,-20,1,-42)y.
Position=UDim2.new(0,10,0,36)y.BackgroundTransparency=1 y.Parent=g local z=
Instance.new'TextLabel'z.Size=UDim2.new(1,0,0,20)z.BackgroundTransparency=1 z.
Text='Status: \u{26aa} IDLE'z.TextColor3=Color3.fromRGB(180,180,180)z.Font=Enum.
Font.GothamMedium z.TextSize=12 z.TextXAlignment=Enum.TextXAlignment.Left z.
RichText=true z.Parent=y local A=Instance.new'TextLabel'A.Size=UDim2.new(1,0,0,
18)A.Position=UDim2.new(0,0,0,22)A.BackgroundTransparency=1 A.Text=
'Recorded: 0 frames (0.0s)'A.TextColor3=Color3.fromRGB(140,150,170)A.Font=Enum.
Font.Gotham A.TextSize=11 A.TextXAlignment=Enum.TextXAlignment.Left A.Parent=y
local B=Instance.new'TextLabel'B.Size=UDim2.new(1,0,0,18)B.Position=UDim2.new(0,
0,0,40)B.BackgroundTransparency=1 B.Text='Hazards: 0 | Radar: Disconnected'B.
TextColor3=Color3.fromRGB(140,150,170)B.Font=Enum.Font.Gotham B.TextSize=11 B.
TextXAlignment=Enum.TextXAlignment.Left B.Parent=y local C=Instance.new
'TextButton'C.Size=UDim2.new(1,0,0,28)C.Position=UDim2.new(0,0,0,62)C.
BackgroundColor3=Color3.fromRGB(0,160,90)C.Text='\u{1f534} START RECORDING'C.
TextColor3=Color3.fromRGB(255,255,255)C.Font=Enum.Font.GothamBold C.TextSize=12
C.Parent=y local D=Instance.new'UICorner'D.CornerRadius=UDim.new(0,6)D.Parent=C
local E=Instance.new'TextButton'E.Size=UDim2.new(0.48,0,0,24)E.Position=UDim2.
new(0,0,0,94)E.BackgroundColor3=Color3.fromRGB(30,60,100)E.Text=
'\u{1f4be} Save JSON'E.TextColor3=Color3.fromRGB(200,230,255)E.Font=Enum.Font.
GothamMedium E.TextSize=11 E.Parent=y local F=Instance.new'UICorner'F.
CornerRadius=UDim.new(0,6)F.Parent=E local G=Instance.new'TextButton'G.Size=
UDim2.new(0.48,0,0,24)G.Position=UDim2.new(0.52,0,0,94)G.BackgroundColor3=Color3
.fromRGB(50,30,40)G.Text='\u{1f5d1} Clear Buffer'G.TextColor3=Color3.fromRGB(255
,180,180)G.Font=Enum.Font.GothamMedium G.TextSize=11 G.Parent=y local H=Instance
.new'UICorner'H.CornerRadius=UDim.new(0,6)H.Parent=G local I=Instance.new
'TextButton'I.Size=UDim2.new(1,0,0,22)I.Position=UDim2.new(0,0,0,122)I.
BackgroundColor3=Color3.fromRGB(40,50,30)I.Text=
'\u{1f441} In-Game 3D Visuals: OFF'I.TextColor3=Color3.fromRGB(200,230,150)I.
Font=Enum.Font.Gotham I.TextSize=10 I.Parent=y local J=Instance.new'UICorner'J.
CornerRadius=UDim.new(0,6)J.Parent=I local K=Instance.new'TextButton'K.Size=
UDim2.new(1,0,0,22)K.Position=UDim2.new(0,0,0,148)K.BackgroundColor3=Color3.
fromRGB(25,35,55)K.Text='\u{1f4e1} Live Radar: ws://localhost:8765'K.TextColor3=
Color3.fromRGB(150,180,220)K.Font=Enum.Font.Gotham K.TextSize=10 K.Parent=y
local L=Instance.new'UICorner'L.CornerRadius=UDim.new(0,6)L.Parent=K local M=
Instance.new'TextLabel'M.Size=UDim2.new(1,0,0,16)M.Position=UDim2.new(0,0,0,174)
M.BackgroundTransparency=1 M.Text='Ready to record.'M.TextColor3=Color3.fromRGB(
100,220,150)M.Font=Enum.Font.Gotham M.TextSize=10 M.TextTruncate=Enum.
TextTruncate.AtEnd M.Parent=y local N=function(N)pcall(function()N=N or ac.
GetStats()if N.isRecording then z.Text=
"Status: <font color='rgb(255,50,80)'><b>\u{1f534} RECORDING...</b></font>"C.
Text='\u{23f9} STOP RECORDING'C.BackgroundColor3=Color3.fromRGB(180,30,40)else z
.Text="Status: <font color='rgb(160,160,160)'>\u{26aa} IDLE</font>"C.Text=
'\u{1f534} START RECORDING'C.BackgroundColor3=Color3.fromRGB(0,160,90)end A.Text
=string.format('Recorded: %d frames (%.1fs)',N.frameCount,N.duration)B.Text=
string.format('Hazards: %d | Radar: %s',N.activeHazards,N.wsStatus)if N.
lastSavedFilePath then M.Text='Saved: '..N.lastSavedFilePath end end)end ac.
OnStatsChanged(function(O)N(O)end)C.MouseButton1Click:Connect(function()local O=
ac.GetStats()if O.isRecording then ac.Stop()else ac.Start()end end)E.
MouseButton1Click:Connect(function()local O,P=ac.SaveToFile()if O then M.Text=
'Saved: '..tostring(P)M.TextColor3=Color3.fromRGB(0,255,140)else M.Text='Err: '
..tostring(P)M.TextColor3=Color3.fromRGB(255,100,100)end end)G.MouseButton1Click
:Connect(function()ac.Clear()M.Text='Buffer cleared.'M.TextColor3=Color3.
fromRGB(180,180,180)end)I.MouseButton1Click:Connect(function()local O=not ad.
IsVisualizerEnabled()ad.SetVisualizerEnabled(O)I.Text=O and
'\u{1f441} In-Game 3D Visuals: ON (Shadows)'or
'\u{1f441} In-Game 3D Visuals: OFF'I.BackgroundColor3=O and Color3.fromRGB(0,140
,70)or Color3.fromRGB(40,50,30)end)K.MouseButton1Click:Connect(function()local O
=not ac.IsWsStreamEnabled()ac.ToggleWsStream(O)K.Text=O and
'\u{1f4e1} Live Radar: STREAMING'or'\u{1f4e1} Live Radar: OFF'end)r.
MouseButton1Click:Connect(function()c=not c if c then y.Visible=false g.Size=
UDim2.fromOffset(260,32)r.Text='\u{25a1}'else y.Visible=true g.Size=UDim2.
fromOffset(260,245)r.Text='\u{2014}'end end)w.MouseButton1Click:Connect(function
()b.Destroy()end)N()end function b.Destroy()if d then d:Destroy()d=nil end end
return b end function a.l()local aa,ab,ac=game:GetService'Players',a.load'j',a.
load'k'return function(ad)pcall(function()local b=setthreadidentity or
set_thread_identity or setidentity or(syn and syn.set_thread_identity)if b then
local c=pcall(b,7)if not c then pcall(b,8)end end end)local b=aa.LocalPlayer if
not b then local c=os.clock()+5 while not aa.LocalPlayer and os.clock()<c do
task.wait(0.1)end b=aa.LocalPlayer end if not b then return warn
'[DQ_Recorder] Failed to retrieve LocalPlayer, aborting.'end local c,d=pcall(
function()ac.Create()end)if not c then warn('[DQ_Recorder] HUD Create Error:',
tostring(d))end local e,f=pcall(function()ab.Init()end)if not e then warn(
'[DQ_Recorder] Logger Init Error:',tostring(f))end _G.ScriptHub_Cleanup=function
()ac.Destroy()ab.Cleanup()end print
'======================================================='print
'\u{26a1} [Esclipse] DungeonQuest Flight Data Recorder Loaded!'print
'\u{1f3af} Mode: Passive Black-Box Reverse Engineering'print
'\u{1f4a1} B\u{1ead}t script \u{111}\u{1ed1}i th\u{1ee7} l\u{ea}n v\u{e0} b\u{1ea5}m [\u{1f534} START RECORDING] tr\u{ea}n Mini HUD'
print
'\u{1f4e1} Live 2D Radar: M\u{1edf} http://localhost:8765 tr\u{ea}n tr\u{ec}nh duy\u{1ec7}t'
print'======================================================='end end end local
aa=_G.ScriptHub_Cleanup if typeof(aa)=='function'then pcall(aa)end _G.
ScriptHub_Cleanup=nil local ab=_G.ScriptHub_UI if typeof(ab)=='table'and typeof(
ab.Unload)=='function'then pcall(ab.Unload,ab)end _G.ScriptHub_UI=nil local ac=a
.load'l'ac()