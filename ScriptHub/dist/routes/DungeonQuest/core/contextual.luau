




local a=require"@packages/Maclib"
local b=require"@routes/DungeonQuest/core/autoSave"
local c=require"@routes/DungeonQuest/core/shared"
local d=require"@routes/DungeonQuest/core/dungeonCatalog"
local e=require"@routes/DungeonQuest/core/notifier"
local f=require"@routes/DungeonQuest/core/lifecycle"
local g=require"@routes/DungeonQuest/core/autoFarm"


local h={}


local i={
MinCombatDistance={
get=function()
return g.GetMinCombatDistance()
end,
set=function(i)
g.SetMinCombatDistance(i)
end,
},
MaxCombatDistance={
get=function()
return g.GetMaxCombatDistance()
end,
set=function(i)
g.SetMaxCombatDistance(i)
end,
},
TargetReachDistance={
get=function()
return g.GetMaxCombatDistance()
end,
set=function(i)
g.SetMaxCombatDistance(i)
end,
},
}







local j={Mob=
"Normal",Boss1=
"Boss 1",Boss2=
"Boss 2",Boss3=
"Boss 3",
}



local k={}
local l
local m
local n={}


function h.OnConfigChanged(o)
if type(o)~="function"then return end
table.insert(n,o)
end


function h.ReloadFromConfig()
local o=a.contextData or{}
local p=b.GetActive()

local q=p~=m
local r=o~=l

k=o
l=o
m=p

if(q or r)and#n>0 then
for s,t in ipairs(n)do
pcall(t,p)
end
end
return q or r
end


local function bindMacLib()
a.contextData=k
end


local function persist()
bindMacLib()
b.SaveNow()
end


local function ensureContextComplete(o,p)
if not(o and type(o)=="string"and#o>0)then return end
if not j[p]then return end

k[o]=k[o]or{}
k[o][p]=k[o][p]or{}
local q=k[o][p]

local r=false
for s in pairs(i)do
if q[s]==nil then
q[s]=i[s].get()
r=true
end
end
return r
end


function h.SeedAllDefaults()
local o={"Mob","Boss1","Boss2","Boss3"}
local p=false
for q,r in ipairs(d.GetDungeons())do
for s,t in ipairs(o)do
if ensureContextComplete(r,t)then
p=true
end
end
end
if p then
persist()
end
return p
end


function h.SetField(o,p,q,r)
if not(o and type(o)=="string"and#o>0)then return end
if not j[p]then return end
if not i[q]then return end

ensureContextComplete(o,p)
k[o][p][q]=r
persist()
end


function h.ClearContext(o,p)
if type(o)~="string"or#o==0 then return end
if k[o]and k[o][p]then
k[o][p]=nil
if next(k[o])==nil then k[o]=nil end
persist()
end
end


function h.GetField(o,p,q)
local r=i[q]
if not r then return nil end
if type(o)=="string"and#o>0 then
local s=k[o]and k[o][p]
if s and s[q]~=nil then return s[q]end
end
return r.get()
end


function h.GetContext(o,p)
local q={}
for r in pairs(i)do
q[r]=h.GetField(o,p,r)
end
return q
end


function h.ApplyContext(o,p)
local q=h.GetContext(o,p)
for r,s in pairs(i)do
s.set(q[r])
end
end


function h.ApplyCurrent()
local o=c.GetCurrentDungeonName()
local p=c.GetCombatTargetKey()
h.ApplyContext(o,p)
return o,p
end


function h.GetFields()
local o={}
for p in pairs(i)do table.insert(o,p)end
return o
end

function h.GetTargets()
local o={}
for p,q in ipairs{"Mob","Boss1","Boss2","Boss3"}do
table.insert(o,{Key=q,Display=j[q]})
end
return o
end

function h.GetDisplayForTarget(o)
return j[o]or"Normal"
end


local o
local p
local function findAndApply(q)
local r=c.GetCurrentDungeonName()
local s=c.GetCombatTargetKey()

if not r then
p=nil
o=nil
return
end

if not q and r==p and s==o then return end

h.ApplyContext(r,s)

if s~="Mob"then
e.Notify("Auto Farm Context",r.." - "..(j[s]or s),2)
end
o=s
p=r
end

function h.Init()
h.ReloadFromConfig()
h.SeedAllDefaults()
bindMacLib()

c.OnDungeonNameChanged(function()findAndApply(false)end)
c.OnBossIndexChanged(function()findAndApply(false)end)
c.OnBossActiveChanged(function()findAndApply(false)end)

task.spawn(function()
while f.IsActive()do
task.wait(1.0)
if h.ReloadFromConfig()then
findAndApply(true)
end
end
end)
end

return h