


local a=require"@routes/DungeonQuest/core/autoSave"
local b=require"@routes/DungeonQuest/core/ui"
local c=require"@modules/antiAfk"

return function(d,e)
local f=e:Section{Side="Left"}
f:Header{Name="Anti AFK"}

f:Toggle({
Name="Anti AFK",
Default=c.IsEnabled(),
Callback=a.Wrap(function(g)
if g then
c.Start()
else
c.Stop()
end
end),
},"Toggle_AntiAFK")

b.PatchSliderLoadCallback(f:Slider({
Name="Interval (giây)",
Default=c.GetInterval(),
Minimum=5,
Maximum=300,
DisplayMethod="Value",
Precision=1,
Callback=a.Wrap(function(g)
c.SetInterval(g)
end),
},"Slider_AntiAFKInterval"))
end