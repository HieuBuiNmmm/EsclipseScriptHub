



local a=require"@routes/DungeonQuest/core/ui"
local b=require"@routes/DungeonQuest/core/autoJoin"
local c=require"@routes/DungeonQuest/core/autoStart"
local d=require"@routes/DungeonQuest/core/autoStartLobby"
local e=require"@routes/DungeonQuest/core/autoRetry"
local f=require"@routes/DungeonQuest/core/autoSave"
local g=require"@routes/DungeonQuest/core/dungeonCatalog"

return function(h,i)
local j=i:Section{Side="Left"}
local k=i:Section{Side="Right"}

local function indexOf(l,m)
for n,o in ipairs(l)do
if o==m then return n end
end
return nil
end
j:Header{Name="Auto Join Dungeon"}
k:Header{Name="Dungeon Run Automation"}

j:Toggle({
Name="Auto Join Dungeon",
Default=false,
Callback=f.Wrap(function(l)
b.Toggle(l)
end),
},"Toggle_AutoJoin")

local l=g.GetDungeons()
local m=a.PatchDropdownRestore(j:Dropdown({
Name="Dungeon",
Options=l,
Default=indexOf(l,b.GetSelectedDungeon())or 1,
Required=true,
Callback=f.Wrap(function(m)
b.SetDungeon(m)
end),
},"Dropdown_Dungeon"),true)

j:Button{
Name="Refresh Map List",
Callback=function()
task.spawn(function()
local n=g.RefreshDungeons()
if not n or#n==0 then return end
pcall(function()
m:ClearOptions()
m:InsertOptions(n)
end)
local o=b.GetSelectedDungeon()
if not table.find(n,o)then
b.SetDungeon(n[1])
end
pcall(function()
m:UpdateSelection(b.GetSelectedDungeon())
end)
end)
end,
}

local n=j:Label({
Text="Recommended Level: ...",
},"Label_RecommendedLevel")

local function updateLevelLabel()
pcall(function()
local o=g.GetLevelReq(
b.GetSelectedDungeon(),
b.GetSelectedDifficulty()
)
n:UpdateName("Recommended Level: "..tostring(o))
end)
end
updateLevelLabel()

local o=b.GetAllowedDifficulties()
local p=a.PatchDropdownRestore(j:Dropdown({
Name="Difficulty",
Options=o,
Default=indexOf(o,b.GetSelectedDifficulty())or 1,
Required=true,
Callback=f.Wrap(function(p)
b.SetDifficulty(p)
updateLevelLabel()
end),
},"Dropdown_Difficulty"),true)

j:Toggle({
Name="Hardcore",
Default=false,
Callback=f.Wrap(function(q)
b.SetHardcore(q)
end),
},"Toggle_HardcoreAJ")

j:Toggle({
Name="Private Room",
Default=true,
Callback=f.Wrap(function(q)
b.SetPrivate(q)
end),
},"Toggle_PrivateAJ")

j:Toggle({
Name="Wave Defence",
Default=false,
Callback=f.Wrap(function(q)
b.SetWaveDefence(q)
end),
},"Toggle_WaveDefenceAJ")

a.PatchSliderLoadCallback(j:Slider({
Name="Delay",
Default=3,
Minimum=0,
Maximum=15,
DisplayMethod="Value",
Precision=1,
Suffix="s",
Callback=f.Wrap(function(q)
b.SetDelay(q)
end),
},"Slider_JoinDelay"))

j:Button{
Name="Join Now",
Callback=function()
b.JoinNow()
end,
}

k:Toggle({
Name="Auto Start",
Default=false,
Callback=f.Wrap(function(q)
c.Toggle(q)
end),
},"Toggle_AutoStart")

a.PatchSliderLoadCallback(k:Slider({
Name="Start Delay",
Default=c.GetDelay(),
Minimum=0,
Maximum=15,
DisplayMethod="Value",
Precision=1,
Suffix="s",
Callback=f.Wrap(function(q)
c.SetDelay(q)
end),
},"Slider_AutoStartDelay"))

k:Toggle({
Name="Auto Start Lobby",
Default=false,
Callback=f.Wrap(function(q)
d.Toggle(q)
end),
},"Toggle_AutoStartLobby")

k:Toggle({
Name="Auto Retry",
Default=false,
Callback=f.Wrap(function(q)
e.Toggle(q)
end),
},"Toggle_AutoRetry")

k:Button{
Name="Manual Retry",
Callback=function()
task.spawn(function()
e.RetryNow()
end)
end,
}

k:Toggle({
Name="Retry on Time Low",
Default=e.GetTimeRetryEnabled(),
Callback=f.Wrap(function(q)
e.SetTimeRetryEnabled(q)
end),
},"Toggle_RetryTimeLow")

a.PatchSliderLoadCallback(k:Slider({
Name="Retry Time Threshold",
Default=e.GetTimeRetryThreshold(),
Minimum=5,
Maximum=120,
DisplayMethod="Value",
Precision=1,
Suffix="s",
Callback=f.Wrap(function(q)
e.SetTimeRetryThreshold(q)
end),
},"Slider_RetryTimeThreshold"))


b.OnDungeonChanged(function(q,r)
pcall(function()
p:ClearOptions()
p:InsertOptions(r)
p:UpdateSelection(b.GetSelectedDifficulty())
end)
updateLevelLabel()
end)
end