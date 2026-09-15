










local a=require"@routes/DungeonQuest/core/services"
local b=require"@routes/DungeonQuest/core/shared"
local c=require"@routes/DungeonQuest/core/lifecycle"
local d=require"@routes/DungeonQuest/core/autoFarm/tracker"

local e=a.RunService or game:GetService"RunService"
local f=a.VirtualInputManager or game:GetService"VirtualInputManager"
local g=a.player

local h={}


local i=false
local j=35.0
local k=0.15

local l=0
local m=0
local n=false
local o=false
local p

function h.IsEnabled()
return i
end


local q,r

function h.SetEnabled(s)
local t=s==true
if t==i then return end
i=t
if i then
q()
else
r()
end
end


h.IsSkillQEnabled=h.IsEnabled
h.SetSkillQEnabled=h.SetEnabled
h.IsSkillEEnabled=h.IsEnabled
h.SetSkillEEnabled=h.SetEnabled

function h.GetSkillERange()
return j
end

function h.SetSkillERange(s)
if type(s)=="number"and s>=2 then
j=s
end
end

function h.GetSpamInterval()
return k
end

function h.SetSpamInterval(s)
if type(s)=="number"and s>=0.05 then
k=s
end
end


function h.IsBuffActive()
local s,t=pcall(function()
return workspace:FindFirstChild"groundAura"
end)
return s and t~=nil
end


local function getPlayerRoot()
local s=g or game:GetService"Players".LocalPlayer
local t=s and s.Character
local u=t and(t:FindFirstChild"HumanoidRootPart"or t.PrimaryPart)
if u and u.Parent then return u end
return nil
end


local function getBestEnemyAndDistance()
local s=getPlayerRoot()
if not s then return nil,math.huge,false end
local t=s.Position


local u=d.GetTarget and d.GetTarget()
if u and u.Root and u.Root.Parent then
local v=u.Humanoid or(u.Model and u.Model:FindFirstChildOfClass"Humanoid")
if v and v.Health>0 then
local w=u.Root.Position
local x=Vector3.new(w.X-t.X,0,w.Z-t.Z).Magnitude
return u,x,true
end
end


local v=b.GetTrackedEnemyData and b.GetTrackedEnemyData()
local w
local x=math.huge
local y=false

if v and#v>0 then
for z,A in ipairs(v)do
if A and A.Root and A.Root.Parent then
local B=A.Humanoid or(A.Model and A.Model:FindFirstChildOfClass"Humanoid")
if B and B.Health>0 then
y=true
local C=A.Root.Position
local D=C.X-t.X
local E=C.Z-t.Z
local F=D*D+E*E
if F<x then
x=F
w=A
end
end
end
end
end

local z=x<math.huge and math.sqrt(x)or math.huge
return w,z,y
end


function h.CastSkillQ()
if n then return end
n=true
task.spawn(function()
local s=(b.GetKeyHoldTime and b.GetKeyHoldTime())or 0.05
pcall(function()
f:SendKeyEvent(true,Enum.KeyCode.Q,false,game)
end)
task.wait(s)
pcall(function()
f:SendKeyEvent(false,Enum.KeyCode.Q,false,game)
end)
n=false
end)
end


function h.CastSkillE()
if o then return end
o=true
task.spawn(function()
local s=(b.GetKeyHoldTime and b.GetKeyHoldTime())or 0.05
pcall(function()
f:SendKeyEvent(true,Enum.KeyCode.E,false,game)
end)
task.wait(s)
pcall(function()
f:SendKeyEvent(false,Enum.KeyCode.E,false,game)
end)
o=false
end)
end


local function onHeartbeat()
if not i or b.IsInLobby()then return end

local s=getPlayerRoot()
if not s then return end

local t=s.Parent
local u=t and t:FindFirstChildOfClass"Humanoid"
if u and u.Health<=0 then return end

local v,w,x=getBestEnemyAndDistance()
local y=os.clock()


if(y-l>=k)and not n then
if x then
l=y
h.CastSkillQ()
end
end


if(y-m>=k)and not o then
if v and w<=j then
local z=h.IsBuffActive()
if z then
m=y
h.CastSkillE()
end
end
end
end

q=function()
if not p then
p=e.Heartbeat:Connect(onHeartbeat)
end
end

r=function()
if p then
p:Disconnect()
p=nil
end
n=false
o=false
end


function h.Step(s,t,u)

end

c.Register(function()
h.SetEnabled(false)
end)

return h