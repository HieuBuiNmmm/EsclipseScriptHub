




local a=require"@routes/DungeonQuest/core/services"
local b=require"@routes/DungeonQuest/core/lifecycle"


local c=a.player


local d=0.05


local e="enemyProjectiles"

local f=0.5


local g={}


local h
local i

local j=false
local k=16
local l=16
local m=true
local n=false

local o



local p=false
local q={}




local r=0
local s={}



local t=0
local u={}

local v
local w={}
local x={}
local y={}
local z={}
local A={}
local B=0


local C={}
local function fireEnemyChanged()
for D=#C,1,-1 do
pcall(C[D])
end
end





local D
local E={}


local F="unknown"



local G=true
local H={}


local I
local J
local K
local L


local M={}
local N={}
local O
local P
local Q=0
local R=4.0
local S=false

local function trackCleanupConnection(T)
if T then table.insert(N,T)end
return T
end

function g.OnRespawn(T)
table.insert(M,T)
end

function g.GetLastRespawnTime()
return Q
end

function g.GetRespawnProtectionDuration()
return R
end

function g.SetRespawnProtectionDuration(T)
if type(T)=="number"and T>=0 then
R=T
end
end

function g.GetRespawnProtectionRemaining()
if Q==0 then return 0 end
local T=os.clock()-Q
local U=R-T
return math.max(0,U)
end

function g.IsJustRespawned(T)
local U=T or R
if Q==0 then return false end
return(os.clock()-Q)<=U
end

function g.WasDead()
return S
end

function g.IsDead()
local T=c and c.Character
if not T or not T.Parent then return true end
local U=T:FindFirstChildOfClass"Humanoid"
if not U or U.Health<=0 then return true end
return false
end



function g.IsInvulnerable()
local T=c and c.Character
if not T or not T.Parent then return false,nil end
local U=T:FindFirstChildOfClass"Humanoid"
if U and U.Health<=0 then
return false,nil
end


local V=T:FindFirstChildOfClass"ForceField"
if V and V.Visible~=false then
return true,"ForceField"
end


local W=T:GetAttribute"Invulnerable"
local X=T:GetAttribute"Immune"
local Y=T:GetAttribute"Respawning"
if W==true or X==true or Y==true then
return true,"Attribute"
end


local Z=T:FindFirstChild"Invulnerable"
local _=T:FindFirstChild"Immune"
local aa=T:FindFirstChild"Respawning"
if(Z and Z:IsA"BoolValue"and Z.Value==true)
or(_ and _:IsA"BoolValue"and _.Value==true)
or(aa and aa:IsA"BoolValue"and aa.Value==true)then
return true,"Value"
end


local ab=g.GetRespawnProtectionRemaining()
if ab>0 then
return true,("Respawn Shield (%.1fs)"):format(ab)
end

return false,nil
end


local function getModelRoot(aa)
if not aa or not aa:IsA"Model"then return nil end
local ab=aa:FindFirstChild"HumanoidRootPart"
if ab and ab:IsA"BasePart"then return ab end
if aa.PrimaryPart and aa.PrimaryPart:IsA"BasePart"then return aa.PrimaryPart end
for T,U in ipairs(aa:GetDescendants())do
if U:IsA"BasePart"then return U end
end
return nil
end

local function isValidEnemy(aa)
if not aa or not aa:IsA"Model"or not aa.Parent or aa==c.Character then return false end
local ab=aa:FindFirstChildOfClass"Humanoid"
if not ab or ab.Health<=0 then return false end
return getModelRoot(aa)~=nil
end

local function disconnectEnemyConnections(aa)
local ab=z[aa]
if not ab then return end
if ab.Died then ab.Died:Disconnect();ab.Died=nil end
z[aa]=nil
end

local function untrackEnemy(aa)
if not aa or not x[aa]then return end
A[aa]=nil
x[aa]=nil
B-=1
disconnectEnemyConnections(aa)
fireEnemyChanged()
L()
end


local function getEnemyRoom(aa)
if not v or not aa then return nil end
local ab=aa.Parent
while ab do
if ab==v then return nil end
if ab.Parent==v and(ab:IsA"Folder"or ab:IsA"Model")then
return ab
end
ab=ab.Parent
end
return nil
end

local function trackEnemy(aa)
if not isValidEnemy(aa)or x[aa]then return end
local ab=getModelRoot(aa)
local T=aa:FindFirstChildOfClass"Humanoid"
if not ab or not T then return end

x[aa]={Model=aa,Root=ab,Humanoid=T,Room=getEnemyRoom(aa)}
B+=1
z[aa]={Died=T.Died:Connect(function()untrackEnemy(aa)end)}
fireEnemyChanged()
L()
end

local function waitAndTrackModel(aa)
if not aa then return end
if isValidEnemy(aa)then trackEnemy(aa);return end
if A[aa]then return end
A[aa]=true
task.spawn(function()
local ab=os.clock()+2
while aa.Parent and os.clock()<ab do
if isValidEnemy(aa)then
A[aa]=nil
trackEnemy(aa)
return
end
task.wait(0.03)
end
A[aa]=nil
if aa.Parent and isValidEnemy(aa)then trackEnemy(aa)end
end)
end

local function trackRoom(aa)
if not aa or w[aa]then return end
w[aa]=true
for ab,T in ipairs(aa:GetDescendants())do
if T:IsA"Model"and isValidEnemy(T)then trackEnemy(T)end
end
y[aa]={
Added=aa.DescendantAdded:Connect(function(ab)
if ab:IsA"Model"then
waitAndTrackModel(ab)
elseif ab:IsA"Humanoid"then
local T=ab:FindFirstAncestorOfClass"Model"
if T then waitAndTrackModel(T)end
end
end),
Removed=aa.DescendantRemoving:Connect(function(ab)
if ab:IsA"Model"then untrackEnemy(ab)end
end),
}
end

J=function()
if not v then v=workspace:WaitForChild("dungeon",30)end
if not v then return false end

r=0
for aa=#s,1,-1 do
pcall(s[aa],r)
end

t=0
for aa=#u,1,-1 do
pcall(u[aa],t)
end

for aa,ab in ipairs(v:GetChildren())do
if ab:IsA"Folder"or ab:IsA"Model"then trackRoom(ab)end
end




y[v]={
Added=v.DescendantAdded:Connect(function(aa)
if aa:IsA"Model"then
waitAndTrackModel(aa)
elseif aa:IsA"Humanoid"then
local ab=aa:FindFirstAncestorOfClass"Model"
if ab then waitAndTrackModel(ab)end
end
end),
Removed=v.DescendantRemoving:Connect(function(aa)
if aa:IsA"Model"then untrackEnemy(aa)end
end),
}
return true
end

K=function()
if not v then return end
for aa,ab in pairs(y)do
if ab.Added then pcall(function()ab.Added:Disconnect()end)end
if ab.Removed then pcall(function()ab.Removed:Disconnect()end)end
end
y={}
w={}
for aa in pairs(x)do
disconnectEnemyConnections(aa)
end
x={}
B=0
A={}
v=nil
end

I=function()
for aa,ab in pairs(x)do
if not aa or not aa.Parent then
untrackEnemy(aa)
else
local T=ab.Humanoid or aa:FindFirstChildOfClass"Humanoid"
ab.Humanoid=T
if not T or T.Health<=0 then
untrackEnemy(aa)
else
local U=ab.Root
if not U or not U.Parent then
U=getModelRoot(aa)
if U then ab.Root=U else untrackEnemy(aa)end
end
end
end
end
end


function g.SetFastSpeed(aa)
k=aa
if j and h and h.Parent then
if h.WalkSpeed<k then
n=true
h.WalkSpeed=k
n=false
end
end
end

function g.SetSpeedEnabled(aa)
j=aa
if h and h.Parent then
n=true
if j then
if h.WalkSpeed<k then
h.WalkSpeed=k
end
else
h.WalkSpeed=l
end
n=false
end
end

function g.IsSpeedEnabled()
return j
end

function g.GetFastSpeed()
return k
end

function g.SetInstantAccelEnabled(aa)
m=aa and true or false
end

function g.IsInstantAccelEnabled()
return m
end


local function connectSpeedListener()
if O then
O:Disconnect()
O=nil
end
if not h or not h.Parent then return end
O=h:GetPropertyChangedSignal"WalkSpeed":Connect(function()
if n then return end
if not h or not h.Parent then return end
local aa=h.WalkSpeed
if j then



if aa<k then
n=true
h.WalkSpeed=k
n=false
end
else
l=aa
end
end)
end

function g.SetHumanoid(aa)
if not aa then return end
local ab=aa:WaitForChild("Humanoid",10)
if not ab then return end

h=ab
i=aa:WaitForChild("HumanoidRootPart",10)or aa.PrimaryPart
l=h.WalkSpeed
if j and h.WalkSpeed<k then
n=true
h.WalkSpeed=k
n=false
end

if P then
P:Disconnect()
P=nil
end
P=h.Died:Connect(function()
S=true
end)

trackCleanupConnection(h.HealthChanged:Connect(function(T)
if T<=0 then
S=true
elseif S and T>0 then
S=false
end
end))
end


local function updateInstantMovement()
if not b.IsActive()then return end
if not m then return end
if not h or not h.Parent or h.Health<=0 or h.Sit then return end
if not i or not i.Parent then
local aa=c and c.Character
i=aa and aa:FindFirstChild"HumanoidRootPart"
if not i then return end
end
if i.Anchored then return end

local aa=h.MoveDirection
local ab=i.AssemblyLinearVelocity

if aa.Magnitude>0.05 then
local T=j and math.max(k,h.WalkSpeed)or h.WalkSpeed
i.AssemblyLinearVelocity=Vector3.new(
aa.X*T,
ab.Y,
aa.Z*T
)
end
end

if a.RunService then
local aa=a.RunService.PreSimulation or a.RunService.Heartbeat
if aa then
trackCleanupConnection(aa:Connect(updateInstantMovement))
end
end

function g.GetDungeonStartTime()
return o
end

function g.SetDungeonStartTime(aa)
o=aa
end

function g.GetDungeonElapsed()
if not o then return nil end
return os.clock()-o
end


function g.ReadyDungeon()
if not v and not J()then return false end
return true
end

function g.GetHumanoid()
return h
end


function g.GetEnemyNames()
local aa={}
local function add(ab)
if ab and ab~=""and ab~=c.Name then aa[ab]=true end
end
if v then
for ab,T in ipairs(v:GetChildren())do
if T:IsA"Folder"or T:IsA"Model"then
for U,V in ipairs(T:GetDescendants())do
if V:IsA"Model"and V:FindFirstChildOfClass"Humanoid"then
add(V.Name)
end
end
end
end
end
for ab in pairs(x)do
add(ab.Name)
end
local ab={}
for T in pairs(aa)do table.insert(ab,T)end
table.sort(ab)
return ab
end


function g.GetEnemyCount()
return B
end


function g.GetTrackedEnemyData()
local aa={}
for ab,T in pairs(x)do
if T and T.Root and T.Root.Parent then
aa[#aa+1]=T
end
end
return aa
end



function g.OnEnemyChanged(aa)
if type(aa)~="function"then return function()end end
table.insert(C,aa)
return function()
for ab,T in ipairs(C)do
if T==aa then table.remove(C,ab)break end
end
end
end


function g.GetEnemyProjectileNames()
local aa={}
local ab=game:GetService"ReplicatedStorage"
local T=ab:FindFirstChild(e)
if not T then return aa end
for U,V in ipairs(T:GetChildren())do
local W=V.ClassName
if W=="Model"or W=="MeshPart"or W=="Part"then
aa[V.Name]=true
end
end
return aa
end

function g.GetKeyHoldTime()
return d
end


if c and c.Character and c.Character.Parent then
g.SetHumanoid(c.Character)
connectSpeedListener()
else local aa=
c and c.CharacterAdded and task.spawn(function()
local aa=c.CharacterAdded:Wait()
if aa and b.IsActive()then g.SetHumanoid(aa);connectSpeedListener()end
end)
end

if c then
trackCleanupConnection(c.CharacterAdded:Connect(function(aa)
local ab,T=pcall(function()
if not aa then return end
Q=os.clock()
g.SetHumanoid(aa)
connectSpeedListener()

for ab,T in ipairs(M)do
pcall(T)
end
end)
if not ab then warn("[Shared] respawn handler error:",tostring(T))end
end))
end


task.spawn(function()
while b.IsActive()do
task.wait(f)
local aa=workspace:FindFirstChild"dungeon"
if v and aa~=v then
K()
elseif not v and aa then
J()
end

L()
end
end)



local function readDungeonName()
local aa=game:GetService"Workspace"
for ab,T in ipairs(aa:GetDescendants())do
if T.Name=="dungeonName"and T:IsA"ValueBase"then
local U=T.Value
if type(U)=="string"then
local V=string.gsub(U,"%s+","")
if V~=""and string.lower(V)~=F then
return U
end
end
end
end
return nil
end

task.spawn(function()
while b.IsActive()do
task.wait(f)
local aa=readDungeonName()
if aa~=D then
D=aa
if aa then g.ResetBossIndex()end
for ab=#E,1,-1 do
pcall(E[ab],aa)
end
end
end
end)




local function determineLobbyState()
return not(D and#D>0)
end


task.spawn(function()
while b.IsActive()do
task.wait(f)
local aa=determineLobbyState()
if aa~=G then
G=aa
for ab=#H,1,-1 do
pcall(H[ab],G)
end
end
end
end)

task.spawn(function()
local aa,ab=pcall(function()return J()end)
if not aa then
warn("[EnemyTracker] Initialization error:",ab)
end
end)




local aa=0
local ab=2
task.spawn(function()
while b.IsActive()do
task.wait(ab)
local T=os.clock()
if T-aa<ab then continue end
aa=T
if not v then continue end
local U=pcall(function()
for U,V in ipairs(v:GetChildren())do
if V:IsA"Folder"or V:IsA"Model"then
for W,X in ipairs(V:GetDescendants())do
if X:IsA"Model"then
waitAndTrackModel(X)
end
end
end
end
I()
end)
if not U then
warn"[EnemyTracker] rescan error"
end
end
end)


function g.IsBossActive()
return p
end

function g.OnBossActiveChanged(T)
if type(T)~="function"then return function()end end
table.insert(q,T)
return function()
for U,V in ipairs(q)do
if V==T then table.remove(q,U)break end
end
end
end

function g.GetCurrentBossIndex()
return r
end



function g.GetCombatTargetKey()
if not p then return"Mob"end
local T=math.clamp(r,1,3)
return"Boss"..tostring(T)
end

function g.ResetBossIndex()
r=0
for T=#s,1,-1 do
pcall(s[T],r)
end
end

function g.OnBossIndexChanged(T)
if type(T)~="function"then return function()end end
table.insert(s,T)
return function()
for U,V in ipairs(s)do
if V==T then table.remove(s,U)break end
end
end
end


local function parseRoomNumber(T)
if type(T)~="string"then return 0 end
local U=string.lower(T)
local V=string.match(U,"boss.*(%d+)")
if V then
return 100+(tonumber(V)or 1)
end
if string.find(U,"boss")then
return 100+math.max(1,r)
end
local W=string.match(T,"^room(%d+)$")
if not W then return 0 end
return tonumber(W)or 0
end







local function computeRoomIndex()
if not v then return 0 end
for T,U in pairs(x)do
if U and U.Room then
local V=parseRoomNumber(U.Room.Name)
if V>0 then return V end
end
end
if p then
return 100+math.max(1,r)
end
return 0
end


L=function()
local T=computeRoomIndex()
if T==t then return end
t=T
for U=#u,1,-1 do
pcall(u[U],t)
end
end

function g.GetCurrentRoomIndex()
return t
end

function g.OnRoomIndexChanged(T)
if type(T)~="function"then return function()end end
table.insert(u,T)
return function()
for U,V in ipairs(u)do
if V==T then table.remove(u,U)break end
end
end
end


function g.GetCurrentDungeonName()
return D
end

function g.OnDungeonNameChanged(T)
if type(T)~="function"then return function()end end
table.insert(E,T)
return function()
for U,V in ipairs(E)do
if V==T then table.remove(E,U)break end
end
end
end


function g.IsInLobby()
return G
end

function g.OnLobbyChanged(T)
if type(T)~="function"then return function()end end
table.insert(H,T)
return function()
for U,V in ipairs(H)do
if V==T then table.remove(H,U)break end
end
end
end


local T
local function setBossActive(U)
if p==U then return end
p=U
if U then
r+=1
for V=#s,1,-1 do
pcall(s[V],r)
end
end
for V=#q,1,-1 do
pcall(q[V],p)
end
L()
end

local function scanBossGui()
if not c then return end
local U=c:FindFirstChild"PlayerGui"
if not U then
T=nil
setBossActive(false)
return
end
local V=U:FindFirstChild("bossHealth",true)
if V then
if V~=T then
T=V
if T:IsA"ScreenGui"then
trackCleanupConnection(T:GetPropertyChangedSignal"Enabled":Connect(scanBossGui))
elseif T:IsA"GuiObject"then
trackCleanupConnection(T:GetPropertyChangedSignal"Visible":Connect(scanBossGui))
end
end
local W=if V:IsA"ScreenGui"then V.Enabled elseif V:IsA"GuiObject"then V.Visible else true
setBossActive(W)
else
T=nil
setBossActive(false)
end
end

task.spawn(function()
if not c then return end
local U=c:WaitForChild("PlayerGui",30)
if not U then return end

trackCleanupConnection(U.DescendantAdded:Connect(scanBossGui))
trackCleanupConnection(U.DescendantRemoving:Connect(scanBossGui))
scanBossGui()


while b.IsActive()and task.wait(0.5)do
scanBossGui()
end
end)

b.Register(function()
if O then O:Disconnect();O=nil end
for U,V in ipairs(N)do
pcall(function()V:Disconnect()end)
end
table.clear(N)
K()
end)


return g