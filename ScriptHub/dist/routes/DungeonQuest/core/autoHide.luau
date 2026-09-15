



local a=require"@packages/Maclib"
require"@routes/DungeonQuest/core/notifier"


local b=game:GetService"HttpService"


local c=a.Folder.."/settings/autohide.json"


local d={}


local e=false
local f


local function loadSettings()
if not(isfile and isfile(c))then return end
local g,h=pcall(function()
return b:JSONDecode(readfile(c))
end)
if g and type(h)=="table"then
e=h.enabled==true
end
end

local function saveSettings()
if not(isfile and writefile)then return end
pcall(function()
writefile(c,b:JSONEncode{enabled=e})
end)
end


function d.SetWindow(g)
f=g
end

function d.SetEnabled(g)
e=g==true
saveSettings()
end

function d.IsEnabled()
return e
end


function d.Hide()
if not e or not f then return end
local g=pcall(function()
f:SetState(false)
end)
if not g then warn"[AutoHide] Không ẩn được window"end
end


function d.Execute()
if not e then return end
task.spawn(function()
task.wait(0.5)
d.Hide()
end)
end


loadSettings()

return d