


local a=require"@routes/DungeonQuest/core/shared"
local b=require"@routes/DungeonQuest/core/ui"
local c=require"@routes/DungeonQuest/core/autoSave"
local d=require"@routes/DungeonQuest/core/shortcuts"

return function(e,f)
local g=f:Section{Side="Right"}
g:Header{Name="Movement Speed"}

g:Toggle({
Name="Fast Speed",
Default=a.IsSpeedEnabled(),
Callback=c.Wrap(function(h)
a.SetSpeedEnabled(h)
end),
},"Toggle_FastSpeed")

b.PatchSliderLoadCallback(g:Slider({
Name="Custom Fast Speed",
Default=a.GetFastSpeed(),
Minimum=16,
Maximum=24,
DisplayMethod="Value",
Precision=1,
Callback=c.Wrap(function(h)
a.SetFastSpeed(h)
end),
},"Slider_FastSpeed"))

g:Toggle({
Name="Instant Acceleration (Max Speed tức thì)",
Default=a.IsInstantAccelEnabled(),
Callback=c.Wrap(function(h)
a.SetInstantAccelEnabled(h)
end),
},"Toggle_InstantAcceleration")

g:Header{Name="Shortcuts"}

g:Toggle({
Name="Right Click Combo (Q+E)",
Default=d.IsMouseComboEnabled(),
Callback=c.Wrap(function(h)
d.SetMouseComboEnabled(h)
end),
},"Toggle_MouseCombo")
end