





require"@routes/DungeonQuest/core/shared"
local a=require"@routes/DungeonQuest/core/notifier"


local b={
[77649408247578]=true,
[115445507767090]=true,
}


local c=false
local d=false
local e=false
local f=3
local g='game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("changeStartValue"):FireServer()'
local h


local function lobbyCondition()
return not b[game.PlaceId]
end


local i,j=pcall(loadstring,g)
if i and type(j)=="function"then h=j end


local k={}


local l={}


function k.OnStart(m)
if type(m)~="function"then return function()end end
table.insert(l,m)
return function()
for n,o in ipairs(l)do
if o==m then table.remove(l,n)break end
end
end
end

function k.Start()
if d then return end
d=true
e=false
task.spawn(function()
while c do
local m,n=pcall(lobbyCondition)
local o=m and n==true

if o and not e then
e=true

local p=0
while p<f and c do
task.wait(0.1)
p=p+0.1
end
if not c then
e=false
break
end
if h then
local q,r=pcall(h)
if q then
a.Notify("Auto Start","Game started!",3)
for s=#l,1,-1 do
pcall(l[s])
end
else
a.Notify("Auto Start","Trigger failed: "..tostring(r),3)
end
else
a.Notify("Auto Start","Remote command invalid",3)
end
end

if not c then break end
task.wait(1)
end
d=false
end)
end

function k.Stop()
c=false
end


function k.SetDelay(m)
f=tonumber(m)or 3
end

function k.GetDelay()
return f
end

function k.Toggle(m)
c=m
if m then
k.Start()
else
k.Stop()
end
end






return k