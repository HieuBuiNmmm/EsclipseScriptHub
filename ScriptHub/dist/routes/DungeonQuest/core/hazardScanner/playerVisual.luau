




local a=require"@routes/DungeonQuest/core/services"
local b=require"@routes/DungeonQuest/core/lifecycle"
local c=require"@routes/DungeonQuest/core/hazardScanner/geometry"
local d=require"@routes/DungeonQuest/core/hazardScanner/trajectory"

local e=a.RunService or game:GetService"RunService"
local f=a.player


local g={}


local h=true
local i=false
local j
local k
local l={}
local m
local n=1.8


local o
local p


local q=Color3.fromRGB(0,255,170)
local r=Color3.fromRGB(255,35,35)
local s=0.45
local t=0.20
local u=0.20

local v=game:GetService"Players"


local function getPlayerRoot()
local w=f or v.LocalPlayer
if not w then return nil end
local x=w.Character
if not x or not x.Parent then return nil end
local y=x:FindFirstChildOfClass"Humanoid"
if y and y.Health<=0 then
return nil
end
return x:FindFirstChild"HumanoidRootPart"or x.PrimaryPart
end


local function getPlayerGroundY(w)
if not w then return 0 end
return w.Position.Y-2.5
end


local function ensureAdornment(w)
if o then

if o.Parent~=w or not o:IsDescendantOf(workspace)then
pcall(function()o:Destroy()end)
o=nil
else
if o.Adornee~=w then
o.Adornee=w
end
return o
end
end

if not w or not w.Parent then return nil end

local x=Instance.new"CylinderHandleAdornment"
x.Name="Player_2D_HitboxVisual"
x.Adornee=w
x.Radius=n
x.Height=u
x.Color3=i and r or q
x.Transparency=i and t or s
x.ZIndex=5
x.AlwaysOnTop=false
x.Visible=h
x.Parent=w

o=x
return x
end


local function updateVisualState(w)
if not o or not o.Parent then return end
o.Color3=w and r or q
o.Transparency=w and t or s
end


local function onHeartbeat()
local w=getPlayerRoot()
if not w or not w.Parent then

if o and o.Parent then
o.Visible=false
end
if i then
i=false
j=nil
k=nil
for x,y in ipairs(l)do
pcall(y,false,nil,nil)
end
end
return
end


local x=ensureAdornment(w)
if x and x.Parent then
x.Visible=h
x.Radius=n

local y=getPlayerGroundY(w)
local z=CFrame.new(Vector3.new(w.Position.X,y,w.Position.Z))
*CFrame.Angles(math.rad(90),0,0)
x.CFrame=w.CFrame:ToObjectSpace(z)
end


local y=Vector3.new(w.Position.X,0,w.Position.Z)local


z, A, B=c.IsPointInAnyHazard(y,nil,n)
local C,D=false


if not z and d.IsPointInAnyTrajectory then
C,D=d.IsPointInAnyTrajectory(y,n)
end

local E=(z or C)
local F=A or D
local G=z and"Ground Zone"or(C and"Trajectory Corridor"or nil)


if E~=i or F~=j then
i=E
j=F
k=G

updateVisualState(E)

for H,I in ipairs(l)do
pcall(I,E,F,G)
end
end
end


local function startTracking()
if not m then
m=e.Heartbeat:Connect(onHeartbeat)
end
end


function g.Cleanup()
if m then
m:Disconnect()
m=nil
end
if o then
pcall(function()o:Destroy()end)
o=nil
end
i=false
j=nil
k=nil
end


function g.IsPlayerInDanger()
return i,j,k
end


function g.GetCurrentThreat()
return j,k
end


function g.OnDangerStatusChanged(w)
if type(w)=="function"then
table.insert(l,w)
end
end


function g.SetVisualEnabled(w)
h=w and true or false
if o then
o.Visible=h
end
end

function g.IsVisualEnabled()
return h
end


function g.SetRadius(w)
if type(w)=="number"and w>=0.1 then
n=w
if o and o.Parent then
o.Radius=n
end
end
end

function g.GetRadius()
return n
end


local function hookLocalPlayer()
local w=f or v.LocalPlayer
if not w then return end

local function onCharAdded(x)
if o then
pcall(function()o:Destroy()end)
o=nil
end

task.spawn(function()
local y=x:WaitForChild("Humanoid",3)
if y then
y.Died:Connect(function()
if o then
o.Visible=false
end
end)
end
end)
end

p=w.CharacterAdded:Connect(onCharAdded)
if w.Character then
onCharAdded(w.Character)
end
end

hookLocalPlayer()


startTracking()


b.Register(function()
if p then
p:Disconnect()
p=nil
end
g.Cleanup()
end)

return g