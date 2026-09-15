


local a=_G.ScriptHub_Cleanup
if typeof(a)=="function"then
pcall(a)
end
_G.ScriptHub_Cleanup=nil


local b=_G.ScriptHub_UI
if typeof(b)=="table"and typeof(b.Unload)=="function"then
pcall(b.Unload,b)
end
_G.ScriptHub_UI=nil


local c={
{
Name="DungeonQuest",
Load=require"@routes/DungeonQuest/main",
UniverseId=9931749389,
Places={
77649408247578,
3220968688,
2414851778,
},
},

{
Name="Game 2",
Load=require"@routes/Game 2/main",
Places={
123456789,
987654321,
},
},
}


for d=1,300 do
if game.GameId~=0 and game.PlaceId~=0 then break end
task.wait(0.1)
end


for d,e in pairs(c)do
if e.Places then
for f,g in ipairs(e.Places)do
if g==game.PlaceId then
return e:Load()
end
end
end

if e.UniverseId and e.UniverseId==game.GameId then
return e:Load()
end
end