


local a=require"@routes/DungeonQuest/core/autoSave"
local b=require"@routes/DungeonQuest/core/esp"
local c=require"@routes/DungeonQuest/core/enemyEsp"
local d=require"@routes/DungeonQuest/core/mapOptimizer"
local e=require"@routes/DungeonQuest/core/ui"


local f={"Custom Hitbox","Real Hitbox"}
local function hitboxModeToIndex(g)
return(g=="Custom"and 1)or 2
end
local function hitboxLabelToMode(g)
return(g==f[1]and"Custom")or"Real"
end

return function(g,h)
local i

local j=h:Section{Side="Left"}
j:Header{Name="Player"}

j:Toggle({
Name="Hitbox",
Default=b.IsPlayerHitboxEnabled(),
Callback=a.Wrap(function(k)
b.TogglePlayerHitbox(k)
end),
},"Toggle_PlayerHitbox")

j:Dropdown({
Name="Hitbox Mode",
Options=f,
Default=hitboxModeToIndex(b.GetPlayerHitboxMode()),
Required=true,
Callback=a.Wrap(function(k)
b.SetPlayerHitboxMode(hitboxLabelToMode(k))
i()
end),
},"Dropdown_PlayerHitboxMode")

local k=e.PatchSliderLoadCallback(j:Slider({
Name="Hitbox Size",
Default=b.GetPlayerHitboxScale(),
Minimum=1,
Maximum=5,
DisplayMethod="Value",
Precision=1,
Callback=a.Wrap(function(k)
b.SetPlayerHitboxScale(k)
end),
},"Slider_PlayerHitboxSize"))

local l=h:Section{Side="Left"}
l:Header{Name="Enemy"}

l:Toggle({
Name="Model Highlight",
Default=c.IsEnabled(),
Callback=a.Wrap(function(m)
c.Toggle(m)
end),
},"Toggle_EnemyESP")

local m=c.GetColorNames()
local n=c.GetSelectedColor()
local o=1
for p,q in ipairs(m)do
if q==n then
o=p
break
end
end

l:Dropdown({
Name="Highlight Color",
Options=m,
Default=o,
Required=true,
Callback=a.Wrap(function(p)
c.SetSelectedColor(p)
end),
},"Dropdown_HighlightColor")

l:Toggle({
Name="Hitbox",
Default=b.IsEnemyHitboxEnabled(),
Callback=a.Wrap(function(p)
b.ToggleEnemyHitbox(p)
end),
},"Toggle_EnemyHitbox")

l:Dropdown({
Name="Hitbox Mode",
Options=f,
Default=hitboxModeToIndex(b.GetEnemyHitboxMode()),
Required=true,
Callback=a.Wrap(function(p)
b.SetEnemyHitboxMode(hitboxLabelToMode(p))
i()
end),
},"Dropdown_EnemyHitboxMode")

local p=e.PatchSliderLoadCallback(l:Slider({
Name="Hitbox Size",
Default=b.GetEnemyHitboxScale(),
Minimum=1,
Maximum=5,
DisplayMethod="Value",
Precision=1,
Callback=a.Wrap(function(p)
b.SetEnemyHitboxScale(p)
end),
},"Slider_EnemyHitboxSize"))

l:Toggle({
Name="Show Skill Hitbox",
Default=b.IsSkillHitboxEnabled(),
Callback=a.Wrap(function(q)
b.ToggleSkillHitbox(q)
end),
},"Toggle_SkillHitbox")

i=function()
pcall(function()k:SetVisibility(b.GetPlayerHitboxMode()=="Custom")end)
pcall(function()p:SetVisibility(b.GetEnemyHitboxMode()=="Custom")end)
end
i()

local q=h:Section{Side="Right"}
q:Header{Name="Map"}

q:Toggle({
Name="Map Optimizer",
Default=d.IsEnabled(),
Callback=a.Wrap(function(r)
d.Toggle(r)
end),
},"Toggle_MapOptimizer")

end