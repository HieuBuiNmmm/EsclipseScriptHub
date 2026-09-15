



local a=require"@core/binder"


local b=game:GetService"VirtualUser"


local c={}


local d=false
local e=60
local f


local function sendActivity()
pcall(function()
b:CaptureController()
b:Button1Down(Vector2.new(0,0))
b:Button1Up(Vector2.new(0,0))
b:Button2Down(Vector2.new(0,0))
b:Button2Up(Vector2.new(0,0))
end)
end


local function kickLoop()
while d do
sendActivity()

local g=e
while g>0 and d do
local h=math.min(g,0.5)
task.wait(h)
g-=h
end
end
f=nil
end


function c.Start()
if d or f then return end
d=true


task.spawn(sendActivity)
f=task.spawn(kickLoop)
end

function c.Stop()
d=false
end

function c.IsEnabled()
return d
end

function c.SetInterval(g)
g=tonumber(g)
if g and g>0 then
e=g
else
e=60
end
end

function c.GetInterval()
return e
end


return a.Wrap(c,{
Enabled=function(g:boolean)
if g then
c.Start()
else
c.Stop()
end
end,

Interval=function(g:number)
c.SetInterval(g)
end,
})::{
Enabled:boolean,
Interval:number,
Start:()->(),
Stop:()->(),
IsEnabled:()->boolean,
SetInterval:(number)->(),
GetInterval:()->number
}