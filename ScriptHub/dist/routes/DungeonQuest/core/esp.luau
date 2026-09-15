



local a=require"@routes/DungeonQuest/core/services"
local b=require"@routes/DungeonQuest/core/shared"


local c={}


local d=0.05
local e=0.8

local f=Color3.fromRGB(0,255,0)
local g="PlayerHitbox_ESP"

local h=Color3.fromRGB(255,0,0)
local i="EnemyHitbox_ESP"


local j=0.01


local k="Real"
local l="Custom"


local m=false
local n
local o=k
local p=1.5
local q=a.player

local r=false
local s
local t=k
local u=1.5


local function createSelectionBox(v,w,x)
local y=Instance.new"SelectionBox"
y.Name=v
y.Adornee=w
y.Color3=x
y.LineThickness=d*4
y.SurfaceColor3=x
y.SurfaceTransparency=e
y.Parent=w
end




local function updateEntityBox(v,w,x,y,z)
if not w or not w.Parent then return end
local A=v.."_Proxy"
local B=w:FindFirstChild(v)
local C=w:FindFirstChild(A)

if y==l then
if B and B:IsA"SelectionBox"and B.Adornee==w then
B:Destroy()
end

if not C then
C=Instance.new"Part"
C.Name=A
C.Anchored=true
C.CanCollide=false
C.CanQuery=false
C.CanTouch=false
C.Transparency=1
C.Parent=w
createSelectionBox(v,C,x)
end

local D=w.Size
local E=math.max(math.abs(D.X),math.abs(D.Y),math.abs(D.Z))
local F=math.max(E*z,1)
C.Size=Vector3.new(F,F,F)
C.CFrame=w.CFrame
else
if C then C:Destroy()end
if B and B:IsA"SelectionBox"and B.Adornee~=w then
B:Destroy()
B=nil
end
if not B or not B:IsA"SelectionBox"or B.Adornee~=w then
createSelectionBox(v,w,x)
end
end
end




local function attachPlayerBox()
local v=q and q.Character
local w=v and v:FindFirstChild"HumanoidRootPart"
if not w or not w.Parent then return end
updateEntityBox(g,w,f,o,p)
end

local function clearPlayerBox()
if n then task.cancel(n);n=nil end
local function clearCharacter(v)
if not v then return end
for w,x in ipairs(v:GetDescendants())do
if x.Name==g or x.Name==g.."_Proxy"then
x:Destroy()
end
end
end
clearCharacter(q and q.Character)
for v,w in ipairs(a.Players:GetPlayers())do
clearCharacter(w.Character)
end
end

function c.TogglePlayerHitbox(v)
if v==m then return end
m=v

if m then
if n then task.cancel(n);n=nil end
n=task.spawn(function()
while m do
local w,x=pcall(attachPlayerBox)
if not w then
if os.clock()-(c.lastPlayerWarn or 0)>5 then
c.lastPlayerWarn=os.clock()
warn("[PlayerHitbox] error:",tostring(x))
end
end
a.RunService.Heartbeat:Wait()
end
end)
else
clearPlayerBox()
end
end

function c.IsPlayerHitboxEnabled()
return m
end

function c.GetPlayerHitboxMode()
return o
end

function c.SetPlayerHitboxMode(v)
if v~=k and v~=l then return end
o=v
end

function c.GetPlayerHitboxScale()
return p
end

function c.SetPlayerHitboxScale(v)
p=v
end




local function attachEnemyBoxes()
for v,w in ipairs(b.GetTrackedEnemyData())do
local x=w.Root
if x and x.Parent then
updateEntityBox(i,x,h,t,u)
end
end
end

local function clearEnemyBoxes()
if s then task.cancel(s);s=nil end
for v,w in ipairs(game:GetService"Workspace":GetDescendants())do
local x=w:FindFirstChild(i)
local y=w:FindFirstChild(i.."_Proxy")
if x then x:Destroy()end
if y then y:Destroy()end
end
end

function c.ToggleEnemyHitbox(v)
if v==r then return end
r=v

if r then
if s then task.cancel(s);s=nil end
s=task.spawn(function()
while r do
local w,x=pcall(attachEnemyBoxes)
if not w then
if os.clock()-(c.lastEnemyWarn or 0)>5 then
c.lastEnemyWarn=os.clock()
warn("[EnemyHitbox] error:",tostring(x))
end
end
a.RunService.Heartbeat:Wait()
end
end)
else
clearEnemyBoxes()
end
end

function c.IsEnemyHitboxEnabled()
return r
end

function c.GetEnemyHitboxMode()
return t
end

function c.SetEnemyHitboxMode(v)
if v~=k and v~=l then return end
t=v
end

function c.GetEnemyHitboxScale()
return u
end

function c.SetEnemyHitboxScale(v)
u=v
end






local v=Color3.fromRGB(255,0,0)
local w="SkillESP"




local x={}

local y=false

local z=false
local A


local function snapshotSkillBlacklist()
table.clear(x)
local B=game:GetService"Workspace"
for C,D in ipairs(B:GetChildren())do
x[D]=true
end
y=true
end



snapshotSkillBlacklist()


local function isPlayerPart(B)
local C=q.Character
if not C then return false end
local D=B
while D do
if D==C then return true end
D=D.Parent
end
return false
end


local function isBlacklistedPart(B)
local C=B
while C do
if x[C]then return true end
C=C.Parent
end
return false
end


local function createSkillBox(B)
if not y then return end
if isBlacklistedPart(B)then return end
if isPlayerPart(B)then return end
if B:FindFirstChild(w)then return end
local C=Instance.new"SelectionBox"
C.Name=w
C.Adornee=B
C.Color3=v
C.SurfaceColor3=v
C.SurfaceTransparency=0.8
C.Parent=B
end


local function scanSkillHitboxes()
if not y then return end
local B=game:GetService"Workspace"
for C,D in ipairs(B:GetChildren())do
if D:IsA"BasePart"then
createSkillBox(D)
end
for E,F in ipairs(D:GetDescendants())do
if F:IsA"BasePart"then
createSkillBox(F)
end
end
end
end

local function clearSkillBoxes()
if A then task.cancel(A);A=nil end
local B=game:GetService"Workspace"
for C,D in ipairs(B:GetDescendants())do
local E=D:FindFirstChild(w)
if E then E:Destroy()end
end
end

function c.ToggleSkillHitbox(B)
if B==z then return end
z=B
if z then
if A then task.cancel(A);A=nil end
A=task.spawn(function()
while z do
local C,D=pcall(scanSkillHitboxes)
if not C and os.clock()-(c.lastSkillWarnH or 0)>5 then
c.lastSkillWarnH=os.clock()
warn("[SkillHitbox] error:",tostring(D))
end
task.wait(j)
end
end)
else
clearSkillBoxes()
end
end

function c.IsSkillHitboxEnabled()
return z
end

return c