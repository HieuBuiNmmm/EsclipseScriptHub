



local a=require"@routes/DungeonQuest/core/services"
local b=require"@routes/DungeonQuest/core/notifier"
local c=require"@routes/DungeonQuest/core/dungeonCatalog"
local d=require"@routes/DungeonQuest/core/shared"
local e=require"@routes/DungeonQuest/core/lifecycle"

local f=a.player.Name


local g=false
local h=false
local i=false
local j="Desert Temple"
local k="Easy"
local l=false
local m=true
local n=false
local o=3

local p={
[77649408247578]=true,
[3220968688]=true,
[2414851778]=true,
}


local q={}


local function inLobbyPlace()
return p[game.PlaceId]==true
end

local function fireDungeonChanged()
for r,s in ipairs(q)do
pcall(s,j,c.GetAllowedDifficulties(j))
end
end

local function joinDungeonNow()
if h then return end
h=true
i=false
task.spawn(function()
local r,s=pcall(function()
local r=game:GetService"ReplicatedStorage":WaitForChild("remotes",15)
if not r then error"remotes not found"end

local s=c.GetLevelReq(j,k)
pcall(function()
r:WaitForChild("createLobby",10):InvokeServer(
j,
k,
s,
l,
m,
n
)
end)
if i then return end
task.wait(o)
if i then return end

if m then
pcall(function()
r:WaitForChild("addPlayerToWhitelist",10):FireServer(f)
end)
if i then return end
task.wait(o)
if i then return end
end

local t=0
while t<10 do
local u=workspace:FindFirstChild"games"and workspace.games:FindFirstChild"inLobby"
if u then break end
task.wait(0.5)
t=t+0.5
if i then return end
end
if i then return end

task.wait(o)
if i then return end
pcall(function()
r:WaitForChild("startDungeon",10):FireServer()
end)
end)
h=false
if i then return end
if r then
b.Notify("Auto Join","Joined: "..j,3)
else
b.Notify("Auto Join","Join failed: "..tostring(s),4)
end
end)
end

local function joinDungeonWatcher()
while e.IsActive()do
task.wait(0.5)
if g and not h and inLobbyPlace()and d.IsInLobby()then
joinDungeonNow()
end
end
end


local r={}


function r.Toggle(s)
g=s
if g then
b.Notify("Auto Join","Enabled",2)
else
i=true
b.Notify("Auto Join","Stopped",2)
end
end

function r.SetDungeon(s)
if type(s)~="string"or#s==0 then return end
j=s
if not c.IsDifficultyAllowed(j,k)then
local t=c.GetAllowedDifficulties(j)
if#t>0 then k=t[1]end
end
fireDungeonChanged()
end

function r.SetDifficulty(s)
if type(s)~="string"then return end
if c.IsDifficultyAllowed(j,s)then
k=s
end
end

function r.SetHardcore(s)
l=s
end

function r.SetPrivate(s)
m=s
end

function r.SetWaveDefence(s)
n=s
end

function r.SetDelay(s)
o=s
end

function r.GetSelectedDungeon()
return j
end

function r.GetSelectedDifficulty()
return k
end

function r.GetAllowedDifficulties()
return c.GetAllowedDifficulties(j)
end

function r.OnDungeonChanged(s)
if type(s)=="function"then table.insert(q,s)end
end

r.JoinNow=function()
task.spawn(function()joinDungeonNow()end)
end


task.spawn(joinDungeonWatcher)

e.Register(function()
r.Toggle(false)
end)

return r