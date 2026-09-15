


local a=require"@routes/DungeonQuest/core/services"
local b=require"@routes/DungeonQuest/core/notifier"


local c=a.player


local d=2
local e=false
local f=false
local g=false
local h=false
local i=60
local j=false
local k=[==[
local ReplayDungeon = game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("replayDungeon")

local payload = {}
local function collectValue(name)
	local value = workspace:FindFirstChild(name)
	if value and value:IsA("ValueBase") then
		payload[name] = value.Value
	end
end

collectValue("dungeonName")
collectValue("dungeonProgress")
collectValue("dungeonStarted")

local hardcore = workspace:FindFirstChild("hardcore")
if hardcore and hardcore:IsA("BoolValue") then
	payload.hardcore = hardcore.Value
	payload.isHardcore = hardcore.Value
end

local dungeon = workspace:FindFirstChild("dungeon")
if dungeon then
	for _, value in ipairs(dungeon:GetChildren()) do
		if value:IsA("ValueBase") then payload[value.Name] = value.Value end
	end
	local bossRoom = dungeon:FindFirstChild("bossRoom")
	if bossRoom then
		for _, value in ipairs(bossRoom:GetChildren()) do
			if value:IsA("ValueBase") then payload[value.Name] = value.Value end
		end
	end
end

if not payload.dungeonName then return end
ReplayDungeon:FireServer(payload)
]==]
local l='game:GetService("Players").LocalPlayer.PlayerGui.rewardGuiHolder.holder'
local m
local n


local function validateConditionText(o)
local p,q=pcall(loadstring,"return "..o)
if p and type(q)=="function"then return q end
return nil
end

local o,p=pcall(loadstring,k)
if o and type(p)=="function"then m=p end

n=validateConditionText(l)
if not n then
n=function()
return c:FindFirstChild"PlayerGui"and c.PlayerGui:FindFirstChild"rewardGuiHolder"and c.PlayerGui.rewardGuiHolder:FindFirstChild"holder"
end
end


local function readTimeLeft()
local q,r=pcall(function()
local q=c:FindFirstChild"PlayerGui"
local r=q and q:FindFirstChild"timeLeftGui"
local s=r and r:FindFirstChild"Frame"
return s and s:FindFirstChild"time"
end)
if not q or typeof(r)~="Instance"then return nil end


local s
if r:IsA"ValueBase"then
s=r.Value
else
s=r.Text
end
if type(s)=="number"then return s end
if type(s)=="string"then
local t=s:gsub("%s+",""):gsub("^%[",""):gsub("%]$","")
local u,v=t:match"^(%d+):(%d+)$"
if u and v then return tonumber(u)*60+tonumber(v)end
local w=tonumber(t)
if w then return w end
end
return nil
end


local q={}


local function fireRetry()
if not m then
b.Notify("Auto Retry","Remote command invalid",3)
return false
end
local r,s=pcall(m)
if r then
b.Notify("Auto Retry","Retrying dungeon!",3)
return true
end
b.Notify("Auto Retry","Trigger failed: "..tostring(s),3)
return false
end


function q.Start()
if f then return end
f=true
g=false
j=false
task.spawn(function()
while e or h do

if e then
local r=0
if n then
local s,t=pcall(n)
if s and typeof(t)=="Instance"and t.Parent then
r=#t:GetChildren()
end
end
if r>=d and not g then
g=true
fireRetry()
elseif r<d then
g=false
end
end



if h then
local r=readTimeLeft()
if r and r<i and not j then
j=true
fireRetry()
elseif r and r>=i then
j=false
end
end

if not e and not h then break end
task.wait(0.75)
end
f=false
end)
end

function q.Stop()
e=false
end

function q.Toggle(r)
e=r
if r then
j=false
q.Start()
b.Notify("Auto Retry","Watching reward holder...",2)
else
q.Stop()
b.Notify("Auto Retry","Stopped",2)
end
end

function q.SetTimeRetryEnabled(r)
h=r==true
if h then
j=false
q.Start()
b.Notify("Auto Retry","Watching time left...",2)
else
b.Notify("Auto Retry","Time retry stopped",2)
end
end

function q.GetTimeRetryEnabled()
return h
end

function q.SetTimeRetryThreshold(r)
i=r
end

function q.GetTimeRetryThreshold()
return i
end


function q.GetTimeLeft()
return readTimeLeft()
end

function q.RetryNow()
task.spawn(function()
fireRetry()
end)
end

return q