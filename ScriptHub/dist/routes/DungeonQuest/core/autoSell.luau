





local a=require"@routes/DungeonQuest/core/lifecycle"
local b=require"@routes/DungeonQuest/core/notifier"
local c=require"@routes/DungeonQuest/core/shared"


local d={
[77649408247578]=true,
[115445507767090]=true,
}


local e={}


local f=false
local g=false
local h=true
local i={}
local j={}
local k={}
local l="None"
local m=false


local n={
weapons="Weapons",
helmets="Helmets",
chests="Chests",
abilities="Abilities",
}


local o={"Common","Uncommon","Rare","Epic","Legendary","Mythic"}


local p={
"1","5","10","15","20","25","30","35","40","45","50",
"55","60","65","70","75","80","85","90","95","100",
"105","110","115","120","125","130","135","140","145","150",
"155","160","165","170","175","180","185","190","195","200",
"205","210","215","220","225","230","235","240","245","250",
"255","260","265","270","275","280","285","290","295","300",
}


local q={"None","Below","Above"}


local r={
Common=0,
Uncommon=1,
Rare=2,
Epic=3,
Legendary=4,
Mythic=5,
}
local s={}
for t,u in ipairs(o)do s[u]=true end




local t={}
for u,v in ipairs(o)do
t[string.lower(v)]=v
end

local function normalizeRarity(u)
if type(u)~="string"then return nil end
return t[string.lower(u)]
end




local function defaultSellAction(u)
local v
pcall(function()
v=game:GetService"ReplicatedStorage":WaitForChild("remotes",5)
:WaitForChild("sellItemEvent",5)
end)
if not v then return false,0 end


local w={}
for x,y in pairs(u)do
if type(y)=="table"and#y>0 then
w[x]=y
end
end

if next(w)==nil then return false,0 end

local x=pcall(function()
v:FireServer(w)
end)
if not x then return false,0 end
return true,0
end

local u=defaultSellAction

function e.SetSellAction(v)
if type(v)=="function"then u=v end
end








local function fetchInventoryItems()
local v,w=pcall(function()
return game:GetService"ReplicatedStorage":WaitForChild("remotes",5):WaitForChild("reloadInvy",5)
end)
if not v or not w then return nil,"Could not find remote reloadInvy"end

local x,y=pcall(function()
return w:InvokeServer()
end)
if not x or y==nil then return nil,"Could not read inventory"end

local z={}
local A={}

local function isItemTable(B)
return B.sellPrice~=nil or B.UniqueItemID~=nil or B.rarity~=nil
end



local function parseItemKey(B)
local C=tostring(B)
local D=tonumber(C:match"_(%d+)$")
if not D then return nil,nil end
local E=C:match"^(.-)_%d+$"
return E,D
end

local function addItem(B,C,D,E)
local F=false
if type(B.equipped)=="boolean"then
F=B.equipped
elseif type(B.equipped)=="table"then
for G,H in pairs(B.equipped)do
if H==true then F=true break end
end
end
local G=normalizeRarity(B.rarity)or"Common"
table.insert(z,{
Type=n[C]or C or"Unknown",
Category=D or C,
Index=E,
Name=tostring(B.name or B.UniqueItemID or"?"),
Rarity=G,
RarityValue=r[G],
SellPrice=tonumber(B.sellPrice)or 0,
UniqueItemID=B.UniqueItemID,
Equipped=F,
LevelReq=tonumber(B.levelReq)or 0,
Raw=B,
})
end




local function walk(B,C,D,E)
if type(B)~="table"then return end
if A[B]then return end
A[B]=true

if isItemTable(B)then
addItem(B,C,D,E)
return
end

for F,G in pairs(B)do
if n[F]then
walk(G,F,nil,nil)
elseif type(G)=="table"and isItemTable(G)then
local H,I=parseItemKey(F)
walk(G,C,H,I)
else
walk(G,C,D,E)
end
end
end

walk(y,nil,nil,nil)
return z
end


function e.ShouldSellItem(v)
if not v then return false end

if h and v.Equipped then return false end

if next(i)and s[v.Rarity]and not i[v.Rarity]then
return false
end

if next(j)and v.Type and not j[v.Type]then
return false
end



local w=k
local x=l
if next(w)==nil then
w={[1]=true}
x="None"
end
local y=v.LevelReq or 0
if x=="Below"then

local z
for A in pairs(w)do
if not z or A>z then z=A end
end
if z and y>z then return false end
elseif x=="Above"then

local z
for A in pairs(w)do
if not z or A<z then z=A end
end
if z and y<z then return false end
else

if not w[y]then return false end
end

return true
end



function e.HasAnyFilter()
return next(i)~=nil or next(j)~=nil or next(k)~=nil
end



function e.CountMatches()
local v,w=fetchInventoryItems()
if not v then
return{total=0,matching=0,error=w or"Error reading inventory"}
end

local x=0
local y={}
for z,A in ipairs(v)do
y[A.Type]=(y[A.Type]or 0)+1
if e.ShouldSellItem(A)then x+=1 end
end

return{total=#v,matching=x,byCategory=y}
end


function e.SellItems()
if m then return nil end
m=true

local v={sold=0,skipped=0,gold=0,error=nil}
local w,x=fetchInventoryItems()
if not w then
v.error=x or"Error reading inventory"
m=false
return v
end


local y={}
for z,A in ipairs(w)do
if e.ShouldSellItem(A)then
if A.Index then
v.sold+=1
local B=A.Category or A.Type
y[B]=y[B]or{}
table.insert(y[B],A.Index)
end
else
v.skipped+=1
end
end

local z,A=pcall(u,y)
if z and A and type(A)=="number"then v.gold=A end

m=false
return v
end

function e.SetLevelReqMode(v)
if v=="Below"or v=="Above"then
l=v
else
l="None"
end
end

function e.GetLevelReqMode()
return l
end

function e.SetExcludeEquipped(v)
h=v
end

function e.GetExcludeEquipped()
return h
end


function e.SetRarityFilter(v)
i={}
if type(v)=="table"then
for w,x in pairs(v)do
if x==true and type(w)=="string"then
local y=normalizeRarity(w)or w
i[y]=true
elseif type(x)=="string"then
local y=normalizeRarity(x)or x
i[y]=true
end
end
elseif type(v)=="string"then
local w=normalizeRarity(v)or v
i[w]=true
end
end

function e.GetRarityFilter()
local v={}
for w in pairs(i)do table.insert(v,w)end
return v
end


function e.SetTypeFilter(v)
j={}
if type(v)=="table"then
for w,x in pairs(v)do
if x==true and type(w)=="string"then
j[w]=true
elseif type(x)=="string"then
j[x]=true
end
end
elseif type(v)=="string"then
j[v]=true
end
end

function e.GetTypeFilter()
local v={}
for w in pairs(j)do table.insert(v,w)end
return v
end


function e.SetLevelReqExactFilter(v)
k={}
if type(v)=="table"then
for w,x in pairs(v)do
if x==true then
local y=tonumber(w)
if y then k[y]=true end
else
local y=tonumber(x)
if y then k[y]=true end
end
end
elseif type(v)=="string"or type(v)=="number"then
local w=tonumber(v)
if w then k[w]=true end
end
end

function e.GetLevelReqExactFilter()
local v={}
for w in pairs(k)do table.insert(v,tostring(w))end
return v
end


local function isDungeon()
return not d[game.PlaceId]
end

local function triggerDungeonStartSell()
if not f then return end
if g then return end
if not isDungeon()then return end
if not e.HasAnyFilter()then return end

g=true
task.spawn(function()

task.wait(2.5)
if not f or not isDungeon()then return end

local v=e.SellItems()
if v and v.sold and v.sold>0 then
b.Notify("AutoSell",("Auto-sold %d item(s) on dungeon start."):format(v.sold),3)
end
end)
end

function e.Toggle(v)
f=v and true or false
if f and isDungeon()and not g then
triggerDungeonStartSell()
end
end

function e.IsEnabled()
return f
end


c.OnDungeonNameChanged(function(v)
g=false
if v then
triggerDungeonStartSell()
end
end)

c.OnLobbyChanged(function(v)
if not v then
g=false
triggerDungeonStartSell()
else
g=false
end
end)

task.spawn(function()
while a.IsActive()do
task.wait(1)
if f and isDungeon()and not g then
triggerDungeonStartSell()
end
end
end)

a.Register(function()
f=false
end)


e.LEVEL_REQ_OPTIONS=p
e.LEVEL_REQ_MODE_OPTIONS=q

return e