




local a=require"@routes/DungeonQuest/core/autoSave"
local b=require"@routes/DungeonQuest/core/autoSell"
local c=require"@routes/DungeonQuest/core/notifier"

return function(d,e)
local f=e:Section{Side="Left"}
f:Header{Name="AutoSell"}

local g=e:Section{Side="Right"}
g:Header{Name="Filter Summary"}


local h=g:Label{Text="Status: --"}
local i=g:Label{Text="Safety: --"}
g:Label{Text="Trigger: <font color='rgb(200,200,255)'>On Dungeon Start</font>"}
local j=g:Label{Text="Rarities: --"}
local k=g:Label{Text="Item Types: --"}
local l=g:Label{Text="Level Req: --"}
local m=g:Label{Text="Exclude Equipped: --"}

local function updateSummary()

local n=b.IsEnabled()
local o=n and"0, 255, 0"or"255, 80, 80"
local p=n and"Enabled"or"Disabled"
pcall(function()
h:UpdateName("Status: <font color='rgb("..o..")'>"..p.."</font>")
end)


local q=b.HasAnyFilter()
local r=q and"0, 255, 0"or"255, 80, 80"
local s=q and"✓ Active (Configured)"or"⚠ NO filter selected"
pcall(function()
i:UpdateName("Safety: <font color='rgb("..r..")'>"..s.."</font>")
end)


local t=b.GetRarityFilter()
local u=#t>0 and table.concat(t,", ")or"All (No filter)"
local v=#t>0 and"255, 220, 120"or"160, 160, 160"
pcall(function()
j:UpdateName("Rarities: <font color='rgb("..v..")'>"..u.."</font>")
end)


local w=b.GetTypeFilter()
local x=#w>0 and table.concat(w,", ")or"All (No filter)"
local y=#w>0 and"255, 220, 120"or"160, 160, 160"
pcall(function()
k:UpdateName("Item Types: <font color='rgb("..y..")'>"..x.."</font>")
end)


local z=b.GetLevelReqMode()
local A=b.GetLevelReqExactFilter()
table.sort(A,function(B,C)return(tonumber(B)or 0)<(tonumber(C)or 0)end)
local B="1 (Safe Fallback)"
local C="255, 160, 80"
if#A>0 then
C="255, 220, 120"
if z=="Below"then
B="Below (≤ "..A[#A]..")"
elseif z=="Above"then
B="Above (≥ "..A[1]..")"
else
B="Exact ("..table.concat(A,", ")..")"
end
end
pcall(function()
l:UpdateName("Level Req: <font color='rgb("..C..")'>"..B.."</font>")
end)


local D=b.GetExcludeEquipped()
local E=D and"0, 255, 0"or"255, 80, 80"
local F=D and"Yes (Protected)"or"No (May Sell)"
pcall(function()
m:UpdateName("Exclude Equipped: <font color='rgb("..E..")'>"..F.."</font>")
end)
end


f:Toggle({
Name="Auto Sell on Dungeon Start",
Default=b.IsEnabled(),
Callback=a.Wrap(function(n)
b.Toggle(n)
updateSummary()
end),
},"Toggle_AutoSellEnabled")

local n={"Common","Uncommon","Rare","Epic","Legendary","Mythic"}
local o={"Weapons","Helmets","Chests","Abilities"}

f:Dropdown({
Name="Rarity Filter",
Options=n,
Default=b.GetRarityFilter(),
Multi=true,
Required=false,
Callback=a.Wrap(function(p)
b.SetRarityFilter(p)
updateSummary()
end),
},"Dropdown_AutoSellRarity")

f:Dropdown({
Name="Item Type Filter",
Options=o,
Default=b.GetTypeFilter(),
Multi=true,
Required=false,
Callback=a.Wrap(function(p)
b.SetTypeFilter(p)
updateSummary()
end),
},"Dropdown_AutoSellType")

local p

local q=b.GetLevelReqMode()
local r=table.find(b.LEVEL_REQ_MODE_OPTIONS,q)or 1
f:Dropdown({
Name="Level Req Mode",
Options=b.LEVEL_REQ_MODE_OPTIONS,
Default=r,
Multi=false,
Required=true,
Callback=a.Wrap(function(s)
b.SetLevelReqMode(s)
if p then
local t=(s=="None")
p.Settings.Multi=t
p.Settings.Required=not t
local u=b.GetLevelReqExactFilter()
if#u>0 then
if not t and#u>1 then
p:UpdateSelection(u[1])
else
p:UpdateSelection(u)
end
end
end
updateSummary()
end),
},"Dropdown_AutoSellLevelReqMode")

p=f:Dropdown({
Name="Level Req Filter",
Options=b.LEVEL_REQ_OPTIONS,
Default=b.GetLevelReqExactFilter(),
Multi=q=="None",
Required=q~="None",
Search=true,
Callback=a.Wrap(function(s)
b.SetLevelReqExactFilter(s)
updateSummary()
end),
},"Dropdown_AutoSellLevelReq")

f:Toggle({
Name="Exclude Equipped Items",
Default=b.GetExcludeEquipped(),
Callback=a.Wrap(function(s)
b.SetExcludeEquipped(s)
updateSummary()
end),
},"Toggle_AutoSellExcludeEquipped")

local s=f:Label({
Text="No search made yet.",
},"Label_AutoSellResult")

f:Button{
Name="Search",
Callback=function()
task.spawn(function()
pcall(function()s:UpdateName"Reading inventory..."end)
local t=b.CountMatches()
if not t then return end
if t.error then
pcall(function()s:UpdateName("<font color='rgb(255,80,80)'>Error: "..t.error.."</font>")end)
return
end
local u=("Found <font color='rgb(0,255,0)'>%d</font>/<font color='rgb(240,240,240)'>%d</font> matching items.\n")
:format(t.matching,t.total)
local v=true
for w,x in ipairs{"Weapons","Helmets","Chests","Abilities"}do
local y=t.byCategory and t.byCategory[x]
if y then
if v then u..=x..": "..y else u..=" • "..x..": "..y end
v=false
end
end
pcall(function()s:UpdateName(u)end)
end)
end,
}

f:Button{
Name="Sell Now",
Callback=function()
task.spawn(function()
pcall(function()s:UpdateName"Reading inventory..."end)

local t=b.CountMatches()
if not t then
pcall(function()s:UpdateName"<font color='rgb(255,80,80)'>A sale is already running.</font>"end)
return
end
if t.error then
pcall(function()s:UpdateName("<font color='rgb(255,80,80)'>Error: "..t.error.."</font>")end)
return
end

local u=b.HasAnyFilter()
local v=""
if not u then
v='\n\n<font color="rgb(255,80,80)"><b>⚠ NO filter selected!</b> This will sell the ENTIRE inventory (except equipped items).</font>'
end

local w=("Sell <font color='rgb(0,255,0)'>%d</font>/<font color='rgb(240,240,240)'>%d</font> matching item(s) with current filters."):format(t.matching,t.total)
w=w..v.."\n\nAre you sure?"

d:Dialog{
Title="Confirm Sale",
Description=w,
Buttons={
{
Name="Confirm",
Callback=function()
task.spawn(function()
pcall(function()s:UpdateName"Reading inventory..."end)
c.Notify("AutoSell","Selling...",2)

local x=b.SellItems()
if not x then
pcall(function()s:UpdateName"<font color='rgb(255,80,80)'>A sale is already running.</font>"end)
return
end

if x.error then
pcall(function()s:UpdateName("<font color='rgb(255,80,80)'>Error: "..x.error.."</font>")end)
return
end

local y=("Done: <font color='rgb(0,255,0)'>%d</font> sold, <font color='rgb(255,200,0)'>%d</font> skipped, <font color='rgb(255,220,120)'>%s</font> gold earned.")
:format(x.sold,x.skipped,tostring(x.gold))
pcall(function()s:UpdateName(y)end)
end)
end,
},
{
Name="Cancel",
},
},
}
end)
end,
}


updateSummary()
end