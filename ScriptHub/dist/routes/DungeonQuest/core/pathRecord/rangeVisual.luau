




local a=require"@routes/DungeonQuest/core/services"
local b=require"@routes/DungeonQuest/core/shared"
local c=require"@routes/DungeonQuest/core/lifecycle"

local d=a.player
local e=a.RunService
local f=a.CoreGui or game:GetService"CoreGui"
local g=game:GetService"Workspace"


local h={}


local i={Cyan=
Color3.fromRGB(0,230,255),Red=
Color3.fromRGB(255,60,60),Orange=
Color3.fromRGB(255,140,0),Yellow=
Color3.fromRGB(255,220,40),Green=
Color3.fromRGB(0,255,120),Emerald=
Color3.fromRGB(40,220,160),Blue=
Color3.fromRGB(0,140,255),Purple=
Color3.fromRGB(180,80,255),Magenta=
Color3.fromRGB(255,60,200),White=
Color3.fromRGB(255,255,255),
}


local j=false
local k=25
local l=0.4
local m=true
local n=true

local o="Cyan"
local p="Red"

local q=0.8
local r=0.15

local s="PR_InRange_Highlight"
local t
local u
local v
local w
local x={}

local function getCircleColor()
return i[o]or i.Cyan
end

local function getHighlightColor()
return i[p]or i.Red
end

local function getPlayerRoot()
local y=d and d.Character
if not y or not y.Parent then return nil end
local z=y:FindFirstChildOfClass"Humanoid"
if z and z.Health<=0 then return nil end
local A=y:FindFirstChild"HumanoidRootPart"
if A and A.Parent then return A end
return nil
end

local function cleanupHighlights()
for y,z in pairs(x)do
pcall(function()z:Destroy()end)
end
table.clear(x)
pcall(function()
for y,z in ipairs(g:GetDescendants())do
if z.Name==s then
pcall(function()z:Destroy()end)
end
end
end)
end

local function cleanupAdornments()
if t then
pcall(function()t:Destroy()end)
t=nil
end
if u then
pcall(function()u:Destroy()end)
u=nil
end
w=nil
cleanupHighlights()
end

local function ensureAdornments()
if not t or not t.Parent then
pcall(function()if t then t:Destroy()end end)
t=Instance.new"CylinderHandleAdornment"
t.Name="PR_SkillRangeRing"
t.AlwaysOnTop=true
t.ZIndex=5
t.Parent=f
end

if m then
if not u or not u.Parent then
pcall(function()if u then u:Destroy()end end)
u=Instance.new"CylinderHandleAdornment"
u.Name="PR_SkillRangeFill"
u.AlwaysOnTop=true
u.ZIndex=4
u.Parent=f
end
else
if u then
pcall(function()u:Destroy()end)
u=nil
end
end
end

local function applyAdornmentProperties(y)
if not j then
cleanupAdornments()
return
end

ensureAdornments()

local z=2.6
local A=getCircleColor()
local B=Vector3.new(y.Position.X,y.Position.Y-z,y.Position.Z)
local C=CFrame.new(B)*CFrame.Angles(math.rad(90),0,0)
local D=y.CFrame:ToObjectSpace(C)

if t then
t.Adornee=y
t.Height=0.06
t.Radius=k
t.InnerRadius=math.max(0.1,k-l)
t.Color3=A
t.Transparency=1-q
t.CFrame=D
t.Visible=(y~=nil and y.Parent~=nil)
end

if u and m then
u.Adornee=y
u.Height=0.02
u.Radius=k
u.InnerRadius=0
u.Color3=A
u.Transparency=1-r
u.CFrame=D
u.Visible=(y~=nil and y.Parent~=nil)
end
end


local function updateEnemyHighlights(y)
if not j or not n or not y then
if next(x)~=nil then cleanupHighlights()end
return
end

local z=b.GetTrackedEnemyData()
local A=y.Position
local B=k*k
local C={}
local D=getHighlightColor()

for E,F in ipairs(z)do
local G=F.Model
local H=F.Root
local I=F.Humanoid
if G and G.Parent and H and H.Parent and I and I.Health>0 then
local J=H.Position.X-A.X
local K=H.Position.Z-A.Z
if(J*J+K*K)<=B then
C[G]=true
end
end
end


for E,F in pairs(x)do
if not C[E]or not E.Parent then
pcall(function()F:Destroy()end)
x[E]=nil
end
end


for E in pairs(C)do
if not x[E]or not x[E].Parent then
local F=E:FindFirstChild(s)
local G=(F and F:IsA"Highlight")and F or Instance.new"Highlight"
G.Name=s
G.Adornee=E
G.FillColor=D
G.FillTransparency=0.35
G.OutlineColor=Color3.fromRGB(255,255,255)
G.OutlineTransparency=0.1
G.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
G.Parent=E
x[E]=G
else
local F=x[E]
if F.FillColor~=D then F.FillColor=D end
if not F.Enabled then F.Enabled=true end
end
end
end

local function onHeartbeat()
if not j then return end

local y=getPlayerRoot()
if not y then
if t then t.Visible=false end
if u then u.Visible=false end
if next(x)~=nil then cleanupHighlights()end
w=nil
return
end


local z=2.6
local A=Vector3.new(y.Position.X,y.Position.Y-z,y.Position.Z)
local B=CFrame.new(A)*CFrame.Angles(math.rad(90),0,0)
local C=y.CFrame:ToObjectSpace(B)


if not t or not t.Parent or y~=w then
w=y
applyAdornmentProperties(y)
else
if t.Adornee~=y then t.Adornee=y end
t.CFrame=C
if not t.Visible then t.Visible=true end

if m then
if not u or not u.Parent then
applyAdornmentProperties(y)
else
if u.Adornee~=y then u.Adornee=y end
u.CFrame=C
if not u.Visible then u.Visible=true end
end
elseif u and u.Visible then
u.Visible=false
end
end


updateEnemyHighlights(y)
end

function h.SetEnabled(y)
j=y and true or false
if j then
local z=getPlayerRoot()
if z then
applyAdornmentProperties(z)
w=z
updateEnemyHighlights(z)
end
if not v then
v=e.Heartbeat:Connect(onHeartbeat)
end
else
cleanupAdornments()
if v then
v:Disconnect()
v=nil
end
w=nil
end
end

function h.IsEnabled()
return j
end

function h.SetRadius(y)
if type(y)=="number"then
k=math.clamp(y,5,150)
local z=getPlayerRoot()
if j and z then
applyAdornmentProperties(z)
updateEnemyHighlights(z)
end
end
end

function h.GetRadius()
return k
end

function h.SetFillEnabled(y)
m=y and true or false
local z=getPlayerRoot()
if j and z then
applyAdornmentProperties(z)
end
end

function h.IsFillEnabled()
return m
end

function h.SetHighlightInRange(y)
n=y and true or false
if not n then
cleanupHighlights()
else
local z=getPlayerRoot()
if j and z then
updateEnemyHighlights(z)
end
end
end

function h.IsHighlightInRangeEnabled()
return n
end


function h.GetColorNames()
local y={"Cyan","Red","Orange","Yellow","Green","Emerald","Blue","Purple","Magenta","White"}
return y
end

function h.GetSelectedCircleColor()
return o
end

function h.SetCircleColor(y)
if type(y)=="string"and i[y]then
o=y
local z=getPlayerRoot()
if j and z then
applyAdornmentProperties(z)
end
end
end

function h.GetSelectedHighlightColor()
return p
end

function h.SetHighlightColor(y)
if type(y)=="string"and i[y]then
p=y
local z=getPlayerRoot()
if j and z then
updateEnemyHighlights(z)
end
end
end


if d then
d.CharacterAdded:Connect(function(y)
if j then
task.spawn(function()
local z=y:WaitForChild("HumanoidRootPart",10)
if z and j then
applyAdornmentProperties(z)
w=z
updateEnemyHighlights(z)
end
end)
end
end)
end

b.OnRespawn(function()
if j then
task.delay(0.2,function()
local y=getPlayerRoot()
if y and j then
applyAdornmentProperties(y)
w=y
updateEnemyHighlights(y)
end
end)
end
end)

c.Register(function()
h.SetEnabled(false)
cleanupAdornments()
end)

return h