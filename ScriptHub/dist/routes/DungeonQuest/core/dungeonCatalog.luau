




local a={"Easy","Medium","Hard","Insane","Nightmare"}

local b={
"Desert Temple",
"Winter Outpost",
"Pirate Island",
"King's Castle",
"The Underworld",
"Samurai Palace",
"The Canals",
"Ghastly Harbor",
"Steampunk Sewers",
"Orbital Outpost",
"Volcanic Chambers",
"Aquatic Temple",
"Enchanted Forest",
"Egg Island",
"Krampus",
"Tutorial Dungeon",
}

local c={
["Egg Island"]={Difficulties={"Easy","Nightmare"},LevelReq=0},Krampus=
{Difficulties={"Nightmare"},LevelReq=195},
["Tutorial Dungeon"]={Difficulties={"Easy"},LevelReq=0},
}


local d={}


local e={}
local f


local g=game:GetService"HttpService"
local h="Maclib/DungeonQuest_MapList.json"

local function persistMapList(i)
if not(isfile and writefile and makefolder and isfolder)then return end
pcall(function()
if not isfolder"Maclib"then makefolder"Maclib"end
end)
pcall(function()
writefile(h,g:JSONEncode(i))
end)
end

local function loadPersistedMapList()
if not(isfile and readfile)or not isfile(h)then return nil end
local i,j=pcall(function()
return g:JSONDecode(readfile(h))
end)
if not i or typeof(j)~="table"then return nil end

local k={}
for l,m in ipairs(j)do
if type(m)=="string"and#m>0 then
table.insert(k,m)
end
end
return(#k>0)and k or nil
end

local function mergeDungeonLists(i)
local j={}
local k={}
for l,m in ipairs(i or{})do
if not j[m]then
j[m]=true
table.insert(k,m)
end
end
for l,m in ipairs(b)do
if not j[m]then
j[m]=true
table.insert(k,m)
end
end
return k
end


local function findScrollingFrame()
local i=game:GetService"Players".LocalPlayer
if not i then return nil end
local j=i:FindFirstChild"PlayerGui"
if not j then return nil end
local k=j:FindFirstChild"queueGui"
if not k then return nil end
local l=k:FindFirstChild"chooseDungeon"
if not l then return nil end
local m=l:FindFirstChild"backgroundFillLeft"
if not m then return nil end
return m:FindFirstChild"ScrollingFrame"
end

local function collectDungeonsFromUi()
local i=findScrollingFrame()
if not i then return nil end

local j={}
for k,l in ipairs(i:GetChildren())do
if l:IsA"ImageLabel"and#l.Name>0 then
table.insert(j,l.Name)
end
end
return(#j>0)and j or nil
end


function d.GetDungeons()
if f then return f end

local i=collectDungeonsFromUi()
if i then
local j=mergeDungeonLists(i)
f=j
persistMapList(j)
return j
end

local j=loadPersistedMapList()
if j then
local k=mergeDungeonLists(j)
f=k
return k
end

return b
end

function d.RefreshDungeons()
f=nil
return d.GetDungeons()
end

function d.GetDungeonStats(i)
if type(i)~="string"or#i==0 then return nil end
if e[i]~=nil then return e[i]end

local j=game:GetService"ReplicatedStorage":FindFirstChild"remotes"
local k=j and j:FindFirstChild"getDungeonStats"
if not k then return nil end

local l,m=pcall(function()return k:InvokeServer(i)end)
if l and typeof(m)=="table"then
e[i]=m
return m
end
return nil
end

function d.GetAllowedDifficulties(i)
if type(i)~="string"then return a end

local j=c[i]
if j then return j.Difficulties end

local k=d.GetDungeonStats(i)
local l={}
if k then
for m,n in ipairs(a)do
if k[n]then table.insert(l,n)end
end
end
if#l>0 then return l end
return a
end

function d.IsDifficultyAllowed(i,j)
if type(j)~="string"then return false end
for k,l in ipairs(d.GetAllowedDifficulties(i))do
if l==j then return true end
end
return false
end

function d.GetLevelReq(i,j)
if type(i)~="string"then return 0 end

local k=c[i]
if k then return k.LevelReq or 0 end

local l=d.GetDungeonStats(i)
if l and type(j)=="string"and l[j]then
return tonumber(l[j].levelReq)or 0
end
return 0
end


d.DUNGEONS=b
d.DIFFICULTIES=a

return d