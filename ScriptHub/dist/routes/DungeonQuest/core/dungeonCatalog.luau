local a,b,c,d,e,f,g,h={'Easy','Medium','Hard','Insane','Nightmare'},{
'Desert Temple','Winter Outpost','Pirate Island',"King's Castle",
'The Underworld','Samurai Palace','The Canals','Ghastly Harbor',
'Steampunk Sewers','Orbital Outpost','Volcanic Chambers','Aquatic Temple',
'Enchanted Forest','Egg Island','Krampus','Tutorial Dungeon'},{['Egg Island']={
Difficulties={'Easy','Nightmare'},LevelReq=0},Krampus={Difficulties={'Nightmare'
},LevelReq=195},['Tutorial Dungeon']={Difficulties={'Easy'},LevelReq=0}},{},{},
game:GetService'HttpService','Maclib/DungeonQuest_MapList.json'local i,j,k,l=
function(i)if not(isfile and writefile and makefolder and isfolder)then return
end pcall(function()if not isfolder'Maclib'then makefolder'Maclib'end end)pcall(
function()writefile(g,f:JSONEncode(i))end)end,function()if not(isfile and
readfile)or not isfile(g)then return nil end local i,j=pcall(function()return f:
JSONDecode(readfile(g))end)if not i or typeof(j)~='table'then return nil end
local k={}for l,m in ipairs(j)do if type(m)=='string'and#m>0 then table.insert(k
,m)end end return(#k>0)and k or nil end,function(i)local j,k={},{}for l,m in
ipairs(i or{})do if not j[m]then j[m]=true table.insert(k,m)end end for l,m in
ipairs(b)do if not j[m]then j[m]=true table.insert(k,m)end end return k end,
function()local i=game:GetService'Players'.LocalPlayer if not i then return nil
end local j=i:FindFirstChild'PlayerGui'if not j then return nil end local k=j:
FindFirstChild'queueGui'if not k then return nil end local l=k:FindFirstChild
'chooseDungeon'if not l then return nil end local m=l:FindFirstChild
'backgroundFillLeft'if not m then return nil end return m:FindFirstChild
'ScrollingFrame'end local m=function()local m=l()if not m then return nil end
local n={}for o,p in ipairs(m:GetChildren())do if p:IsA'ImageLabel'and#p.Name>0
then table.insert(n,p.Name)end end return(#n>0)and n or nil end function d.
GetDungeons()if h then return h end local n=m()if n then local o=k(n)h=o i(o)
return o end local o=j()if o then local p=k(o)h=p return p end return b end
function d.RefreshDungeons()h=nil return d.GetDungeons()end function d.
GetDungeonStats(n)if type(n)~='string'or#n==0 then return nil end if e[n]~=nil
then return e[n]end local o=game:GetService'ReplicatedStorage':FindFirstChild
'remotes'local p=o and o:FindFirstChild'getDungeonStats'if not p then return nil
end local q,r=pcall(function()return p:InvokeServer(n)end)if q and typeof(r)==
'table'then e[n]=r return r end return nil end function d.GetAllowedDifficulties
(n)if type(n)~='string'then return a end local o=c[n]if o then return o.
Difficulties end local p,q=d.GetDungeonStats(n),{}if p then for r,s in ipairs(a)
do if p[s]then table.insert(q,s)end end end if#q>0 then return q end return a
end function d.IsDifficultyAllowed(n,o)if type(o)~='string'then return false end
for p,q in ipairs(d.GetAllowedDifficulties(n))do if q==o then return true end
end return false end function d.GetLevelReq(n,o)if type(n)~='string'then return
0 end local p=c[n]if p then return p.LevelReq or 0 end local q=d.
GetDungeonStats(n)if q and type(o)=='string'and q[o]then return tonumber(q[o].
levelReq)or 0 end return 0 end d.DUNGEONS=b d.DIFFICULTIES=a return d