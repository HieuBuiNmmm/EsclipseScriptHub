


local a=require"@routes/DungeonQuest/core/shared"
local b=require"@routes/DungeonQuest/core/autoRetry"

local c="Boss Active"
local d="Boss"
local e="Dungeon"
local f="Time Left"

return function(g,h)
local i=h:Section{Side="Right"}
i:Header{Name="Status"}

local j=i:Label{
Text=c..": "..(a.IsBossActive()and"Yes"or"No"),
}

local function updateBoss(k)
local l=k and"0, 255, 0"or"255, 80, 80"
j:UpdateName(c..": <font color='rgb("..l..")'>"..(k and"Yes"or"No").."</font>")
end

updateBoss(a.IsBossActive())

a.OnBossActiveChanged(function(k)
updateBoss(k)
end)

local k=i:Label{
Text=d..": 0",
}

local function updateBossIndex()
k:UpdateName(d..": "..a.GetCurrentBossIndex())
end

updateBossIndex()

a.OnBossIndexChanged(function()
updateBossIndex()
end)

local l=i:Label{
Text="Room: --",
}

local function updateRoom()
local m=a.GetCurrentRoomIndex()
if m<=0 then
l:UpdateName"Room: <font color='rgb(160, 160, 160)'>--</font>"
return
end
local n=m>=100
local o=n and"255, 200, 80"or"0, 255, 0"
l:UpdateName("Room: <font color='rgb("..o..")'>"..tostring(m).."</font>")
end

updateRoom()

a.OnRoomIndexChanged(function()
updateRoom()
end)

local m=i:Label{
Text="Enemies: 0",
}

local function updateEnemyCount()
if not a.IsInLobby()and not a.GetCurrentDungeonName()then
m:UpdateName"Enemies: <font color='rgb(160, 160, 160)'>--</font>"
return
end
local n=a.GetEnemyCount()
local o=n>0 and"0, 255, 0"or"255, 80, 80"
m:UpdateName("Enemies: <font color='rgb("..o..")'>"..n.."</font>")
end

i:Header{Name="Timer"}

local n=i:Label{
Text=f..": --",
}

local function updateTimeLeft()
local o=b.GetTimeLeft()
if not o then
n:UpdateName(f..": <font color='rgb(160, 160, 160)'>--</font>")
return
end
local p=math.floor(o)
local q=string.format("%d:%02d",math.floor(p/60),p%60)
local r=b.GetTimeRetryEnabled()and o<b.GetTimeRetryThreshold()
local s=r and"255, 80, 80"or"0, 255, 0"
n:UpdateName(f..": <font color='rgb("..s..")'>"..q.."</font>")
end

updateEnemyCount()

updateTimeLeft()



local o

task.spawn(function()
while task.wait(0.5)do
updateBoss(a.IsBossActive())
updateBossIndex()
updateRoom()
updateEnemyCount()
o()
updateTimeLeft()
end
end)

i:Header{Name="Level Info"}

local p=i:Label{
Text=e..": Unknown",
}

local function updateDungeon()
local q=a.GetCurrentDungeonName()
if q then
p:UpdateName(e..": "..q)
else
p:UpdateName(e..": <font color='rgb(255, 80, 80)'>Unknown</font>")
end
end

updateDungeon()

a.OnDungeonNameChanged(function()
updateDungeon()
end)

i:Header{Name="Lobby / Dungeon"}

local q=i:Label{
Text="Lobby: Unknown",
}

o=function()
local r=a.IsInLobby()
local s=r and"0, 255, 0"or"255, 80, 80"
q:UpdateName("Lobby: <font color='rgb("..s..")'>"..(r and"Yes"or"No").."</font>")
end

o()

a.OnLobbyChanged(function()
o()
end)

i:Button{
Name="Log Enemy Types to Console",
Callback=function()
local r=a.GetEnemyNames()
print("[DungeonQuest] Enemy types in map ("..#r.."):")
if#r==0 then
print"  (no enemies found)"
else
for s,t in ipairs(r)do
print("  - "..t)
end
end
end,
}
end