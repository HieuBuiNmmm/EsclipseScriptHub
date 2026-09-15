



local a=require"@packages/Maclib"
local b=require"@routes/DungeonQuest/core/notifier"


local c={}


local d
local e=false
local f=false

function c.Suspend()
f=true
e=false
end

function c.Resume()
f=false
end

function c.IsSuspended()
return f or(a.LoadingConfig==true)
end


function c.SetActive(g)
d=(typeof(g)=="string"and#g>0)and g or nil
end

function c.GetActive()
return d
end




local function resolveActiveConfig()
if d then return d end

local g=a.Folder
local h=g.."/settings/autoload.txt"
if not(isfile and readfile)then return nil end
if isfile(h)then
local i,j=pcall(readfile,h)
if i and typeof(j)=="string"and#j>0 then
d=j
return d
end
end
return nil
end


function c.SaveNow()
if c.IsSuspended()then return end
local g=resolveActiveConfig()
if not g then return end

local h,i=a:SaveConfig(g)
if not h and i and i~="Please select a config file."then
b.Notify("AutoSave","Không lưu được config: "..tostring(i),3)
end
end


function c.Save()
if c.IsSuspended()then return end
if not resolveActiveConfig()then return end
if e then return end
e=true

task.delay(0.5,function()
e=false
if not c.IsSuspended()and c.GetActive()then
c.SaveNow()
end
end)
end


function c.Wrap(g)
if type(g)~="function"then return g end
return function(...)
g(...)
c.Save()
end
end

return c