

return function(a)





local b=game:GetService"Players"
local c=os.clock()+15
while not b.LocalPlayer do
if os.clock()>c then break end
task.wait(0.1)
end
local d=b.LocalPlayer
if not d then
return warn"[DungeonQuest] Không lấy được LocalPlayer, hủy khởi tạo script."
end


local e=require"@packages/Maclib"
local f=require"@routes/DungeonQuest/core/lifecycle"
local g=require"@routes/DungeonQuest/core/autoSave"


g.Suspend()


local h=e:Window{
Title="DungeonQuest",
Subtitle="EsclipseHub",
Size=UDim2.fromOffset(1000,600),
SidebarWidth=300,
DragStyle=1,
DisabledWindowControls={},
ShowUserInfo=true,
Keybind=Enum.KeyCode.RightControl,
AcrylicBlur=true,
}

local i=require"@routes/DungeonQuest/core/notifier"
i:SetWindow(h)


_G.ScriptHub_UI=h
_G.ScriptHub_Cleanup=function()
f.Cleanup()
end
h.onUnloaded(function()
f.Cleanup()
if _G.ScriptHub_UI==h then _G.ScriptHub_UI=nil end
end)


local j=h:TabGroup()
local k={
Combat=j:Tab{Name="Combat",Image="rbxassetid://10734975692"},
Dungeon=j:Tab{Name="Dungeon Joiner",Image="rbxassetid://10734886202"},
Inventory=j:Tab{Name="Inventory",Image="rbxassetid://10709769841"},
Utilities=j:Tab{Name="Utilities",Image="rbxassetid://10747383470"},
Configs=j:Tab{Name="Configs",Image="rbxassetid://10734950309"},
PathRecord=j:Tab{Name="Path Record",Image="rbxassetid://10734950309"},
}


e:SetFolder"EsclipseHub"


local l=require"@routes/DungeonQuest/tabs/Combat/main"
local m=require"@routes/DungeonQuest/tabs/Dungeon/main"
local n=require"@routes/DungeonQuest/tabs/Inventory/main"
local o=require"@routes/DungeonQuest/tabs/Utilities/main"
local p=require"@routes/DungeonQuest/tabs/Configs/main"
local q=require"@routes/DungeonQuest/tabs/PathRecord/main"

l(h,k.Combat)
m(h,k.Dungeon)
n(h,k.Inventory)
o(h,k.Utilities)
p(h,k.Configs)
q(h,k.PathRecord)


local r=require"@routes/DungeonQuest/core/shortcuts"
r.Init()


local s=require"@routes/DungeonQuest/core/webhook"
s.Init()


require"@routes/DungeonQuest/core/enemyEsp"


local t=require"@routes/DungeonQuest/core/autoHide"
t.SetWindow(h)
t.Execute()


local u=require"@routes/DungeonQuest/core/contextual"
u.Init()


k.Combat:Select()

local v=require"@routes/DungeonQuest/core/coordinator"

v.SetLocked(true)
e:LoadAutoLoadConfig()



local function syncActiveConfigFromAutoload()
local w=e.Folder.."/settings/autoload.txt"
if isfile and isfile(w)then
local x,y=pcall(readfile,w)
if x and type(y)=="string"and#y>0 then
g.SetActive(y)
end
end
end
syncActiveConfigFromAutoload()

task.delay(0.3,function()
v.SetLocked(false)
end)


task.delay(1.5,function()
g.Resume()
end)
end