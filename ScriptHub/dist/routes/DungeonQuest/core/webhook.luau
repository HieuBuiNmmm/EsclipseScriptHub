




local a=require"@packages/Maclib"
local b=require"@routes/DungeonQuest/core/notifier"
local c=require"@routes/DungeonQuest/core/shared"
local d=require"@routes/DungeonQuest/core/lifecycle"


local e=game:GetService"HttpService"


local f=a.Folder.."/settings/webhook.json"


local g={}


local h=""
local i=false
local j=false
local k
local l

local m=false
local n=""
local o={"Tier6"}


local p={
common=9807270,
uncommon=43520,
rare=3447003,
epic=10181046,
legendary=16766720,

secret=15158332,
ultimate=15158332,
mythic=15158332,
}

local q={
common=1,
uncommon=2,
rare=3,
epic=4,
legendary=5,
secret=6,
ultimate=6,
mythic=6,
}
local r=10181046




local s={
{match="northen",prefix="Valhalla"},
{match="northern",prefix="Valhalla"},
}

local t=16766720


local function getSpecialPrefix()
local u=c.GetCurrentDungeonName()
if not u or u==""then return nil end
local v=string.lower(u)
for w,x in ipairs(s)do
if string.find(v,x.match,1,true)then
return x.prefix
end
end
return nil
end






local u={
legendary=true,
secret=true,
ultimate=true,
mythic=true,
}
local function isSpecialItem(v)
if not v then return false end
if u[tostring(v.rarity or""):lower()]then return true end
local w=getSpecialPrefix()
if w and w~=""then
local x=tostring(v.itemName or"")
return string.sub(x,1,#w)==w
end
return false
end


local v={"Tier1","Tier2","Tier3","Tier4","Tier5","Tier6"}

local function tierOptionToLevel(w)
local x=tonumber(tostring(w or""):match"Tier(%d+)")
return x or 6
end


local w
local function getSelectedTierLevels()
if w then return w end
w={}
for x,y in ipairs(o)do
w[tierOptionToLevel(y)]=true
end
return w
end



local x={
uncommon=1,
common=2,
rare=3,
epic=4,
legendary=5,
secret=6,
}


local function getItemTierLevel(y)
if not y then return nil end
local z=tonumber(tostring(y.tier or""):match"tier(%d+)")
if z then return z end
if y.secret==true then return 6 end
return x[string.lower(tostring(y.rarity or""))]
end


local y


local function getPlayerName()
local z=game:GetService"Players".LocalPlayer
if not z then return"?"end
if z.Name and z.Name~=""then return z.Name end
return z.DisplayName or"?"
end


local function getXp()
local z=game:GetService"Players".LocalPlayer
if not z then return nil end
local A=z:FindFirstChild"XP"
if A and A:IsA"IntValue"then return A.Value end
return nil
end


local function findChildRecursive(z,A,B)
B=B or 12
if B<0 then return nil end
local C=z:FindFirstChild(A)
if C then return C end
for D,E in ipairs(z:GetChildren())do
local F=findChildRecursive(E,A,B-1)
if F then return F end
end
return nil
end


local function getLevel()
local z=game:GetService"Players".LocalPlayer
if not z or not z:FindFirstChild"PlayerGui"then return"?"end
local A=z.PlayerGui:FindFirstChild"playerStatus"
if not A then return"?"end
local B=findChildRecursive(A,"levelBorder")
if not B then return"?"end
local C=B:FindFirstChild"level"
if C and C:IsA"TextLabel"then return C.Text end
return"?"
end



local z=false
local function ensureXpBefore()
if y~=nil or z then return end
z=true
task.spawn(function()
local A=os.clock()+8
while y==nil and os.clock()<A do
y=getXp()
if y~=nil then break end
task.wait(0.25)
end
z=false
end)
end


local function resetRun()
y=getXp()
if y==nil then ensureXpBefore()end
c.SetDungeonStartTime(nil)
end


local function startRun()
if not c.GetDungeonStartTime()then c.SetDungeonStartTime(os.clock())end
if y==nil then ensureXpBefore()end
end



local function startDungeonWatcher()
if l then return end
local function onLobbyChanged(A)
if A then
resetRun()
else
startRun()
end
end
onLobbyChanged(c.IsInLobby())
l=c.OnLobbyChanged(onLobbyChanged)
end


local function formatDuration(A)
A=math.max(0,math.floor(A or 0))
local B=math.floor(A/60)
local C=A%60
return string.format("%d:%02d",B,C)
end


local function loadSettings()
if not(isfile and isfile(f))then return end
local A,B=pcall(function()
return e:JSONDecode(readfile(f))
end)
if A and type(B)=="table"then
h=type(B.url)=="string"and B.url or""
i=B.enabled==true
m=B.pingEnabled==true
n=type(B.pingMention)=="string"and B.pingMention or""
local C=B.pingTiers
if type(C)=="string"then C={C}end
if type(C)=="table"then
local D={}
for E,F in ipairs(C)do
if table.find(v,F)and not table.find(D,F)then
table.insert(D,F)
end
end
if#D>0 then o=D end
end
w=nil
end
end

local function saveSettings()
if not(isfile and writefile)then return end
pcall(function()
writefile(f,e:JSONEncode{
url=h,
enabled=i,
pingEnabled=m,
pingMention=n,
pingTiers=o,
})
end)
end


local function buildItemsText(A)
local B={}
for C,D in ipairs(A or{})do
local E=D.itemName or"Unknown"
local F=isSpecialItem(D)
if F then E="⭐ "..E end
local G={}
if D.itemType and D.itemType~="gold"then table.insert(G,D.itemType)end
if D.rarity then table.insert(G,D.rarity)end
if#G>0 then
table.insert(B,string.format("%s (%s)",tostring(E),table.concat(G,", ")))
else
table.insert(B,tostring(E))
end
end
return table.concat(B,"\n")
end



local function itemIsRare(A)
if not A then return false end
local B=getItemTierLevel(A)
if not B then return false end
return getSelectedTierLevels()[B]==true
end

local function shouldPing(A)
if not m or n==""then return false end
for B,C in ipairs(A or{})do
if itemIsRare(C)then return true end
end
return false
end

local function buildEmbed(A,B)
local C=tonumber(A.gold)or 0
local D={}
for E,F in ipairs(A.items or{})do
if F.itemName and F.itemName~="gold"then
table.insert(D,F)
end
end

local E=r
local F=false
local G
local H
local function higherRarity(I,J)
if I==nil then return J end
if J==nil then return I end
return(q[I]or 0)>=(q[J]or 0)and I or J
end
for I,J in ipairs(D)do
local K=tostring(J.rarity or""):lower()
if isSpecialItem(J)then
F=true
G=higherRarity(G,K)
end
if p[K]~=nil then
H=higherRarity(H,K)
end
end
if F then
E=G and(p[G]or t)or t
elseif H then
E=p[H]
end

B=B or{}
local I=tostring(B.level or"?")
local J=tonumber(B.expGained)
local K=J and string.format("+%s XP",tostring(J))or"?"
local L=formatDuration(B.duration)

local M={}
if J then table.insert(M,K)end
if C>0 then table.insert(M,string.format("+%s gold",tostring(C)))end
local N=#M>0 and table.concat(M,"  ")or""

local O=#D>0 and buildItemsText(D)or"None"
local P=O
if N~=""then
P=N..(O~="None"and("\n"..O)or"")
end

local Q={
{
name="Player",
value=string.format("%s (lv %s)",getPlayerName(),I),
inline=true,
},
{
name="Map",
value=c.GetCurrentDungeonName()or"Unknown",
inline=true,
},
{
name="Time",
value=L,
inline=true,
},
{
name="Rewards",
value=P,
inline=false,
},
}

local R="You cleared the dungeon and received your rewards!"
if shouldPing(D)then
R=R.."\n\n"..n
end

return{
embeds={
{
title="Dungeon WIN",
description=R,
color=E,
fields=Q,
timestamp=DateTime.now():ToIsoDate(),
},
},
}
end

local function sendEmbed(A,B)
if h==""or string.find(h,"^https://discord%.com/api/webhooks/")==nil then
return false,"Invalid webhook URL"
end

local C=buildEmbed(A,B)
local D,E=pcall(function()
return e:JSONEncode(C)
end)
if not D then return false,"Could not encode payload"end

local F,G=pcall(function()
return request{
Url=h,
Method="POST",
Headers={
["Content-Type"]="application/json",
["User-Agent"]="ScriptHub-DungeonQuest (https://www.roblox.com)",
},
Body=E,
}
end)

if not F then
return false,"Request error: "..tostring(G)
end

if G and G.Success then
return true
end

local H=G and G.StatusCode or"?"
return false,"HTTP "..tostring(H)
end


function g.SetUrl(A)
h=A or""
saveSettings()
end

function g.GetUrl()
return h
end

function g.SetEnabled(A)
i=A==true
saveSettings()
end

function g.IsEnabled()
return i
end

function g.SetPingEnabled(A)
m=A==true
saveSettings()
end

function g.IsPingEnabled()
return m
end

function g.SetPingMention(A)
n=A or""
saveSettings()
end

function g.GetPingMention()
return n
end



function g.SetPingTiers(A)
if type(A)~="table"then return end

local B={}
local C={}
local function add(D)
if not C[D]and table.find(v,D)then
C[D]=true
table.insert(B,D)
end
end

for D,E in pairs(A)do

if type(D)=="string"and E==true then
add(D)
elseif type(E)=="string"then

add(E)
end
end

if#B==0 then return end
o=B
w=nil
saveSettings()
end

function g.GetPingTiers()
return o
end

function g.GetPingTierOptions()
return v
end

function g.Send()
if not i then
b.Notify("Webhook","Notifications is disabled",3)
return
end
local A,B=sendEmbed({
items={{itemName="Test Reward",rarity="common",itemType="item"}},
gold=0,
},{
level=getLevel(),
expGained=0,
duration=0,
})
if A then
b.Notify("Webhook","Test sent successfully",3)
else
b.Notify("Webhook","Send failed: "..tostring(B),4)
end
end


function g.Init()
if j then return end

local A
local B=pcall(function()
A=game:GetService"ReplicatedStorage":WaitForChild("remotes",30)
end)
if not B or not A then
warn"[Webhook] Could not find ReplicatedStorage.remotes"
return
end

local C=A:FindFirstChild"cloneRewardGui"
if not C then
warn"[Webhook] Could not find remote cloneRewardGui"
return
end

k=C.OnClientEvent:Connect(function(D)
if not i then return end

ensureXpBefore()

local E=c.GetDungeonStartTime()and c.GetDungeonElapsed()or 0

task.spawn(function()

task.wait(1.5)

local F=getXp()
local G
if y~=nil and F~=nil then
G=math.max(0,F-y)
end

local H,I=sendEmbed(D,{
level=getLevel(),
expGained=G,
duration=E,
})
if not H then
b.Notify("Webhook WIN","Send failed: "..tostring(I),4)
end
end)
end)

j=true
b.Notify("Webhook","Webhook notifications ready",2)
startDungeonWatcher()
end


loadSettings()

d.Register(function()
if k then k:Disconnect();k=nil end
if l then l();l=nil end
j=false
end)

return g