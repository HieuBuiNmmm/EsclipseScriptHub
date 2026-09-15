







local a={
[77649408247578]=true,
[115445507767090]=true,
}


local function inLobbyPlace()
return a[game.PlaceId]==true
end


local b=false


local c=game:GetService"VirtualInputManager"
local d=game:GetService"GuiService"



local function findStartButton()
local e=game:GetService"Players".LocalPlayer
if not e then return nil end
local f=e:FindFirstChild"PlayerGui"
if not f then return nil end
local g=f:FindFirstChild"introGui"
if not g or not g:IsA"ScreenGui"or not g.Enabled then return nil end
local h=g:FindFirstChild"title"
if not h then return nil end
local i=h:FindFirstChild"Frame"
if not i then return nil end
local j=i:FindFirstChild"TextButton"
if not j or not j:IsA"TextButton"or not j.Visible then return nil end

local k=""
if j.Text and type(j.Text)=="string"then
k=j.Text
end
if not string.find(string.lower(k),"play")then return nil end
return j
end



local function pressStartButton(e)
pcall(function()
d.SelectedObject=e
end)
task.wait(0.1)
c:SendKeyEvent(true,Enum.KeyCode.Return,false,game)
task.wait()
c:SendKeyEvent(false,Enum.KeyCode.Return,false,game)
task.wait(0.1)
pcall(function()
d.SelectedObject=nil
end)
end




local function runLoop()
task.spawn(function()
local e=false
while b do

if not inLobbyPlace()then
task.wait(1)
continue
end

local f=findStartButton()
if f then

pressStartButton(f)
e=true
elseif e then

print"[AutoStartLobby] Pressed Start"
break
end

if not b then break end
task.wait(0.2)
end
end)
end


local e={}


function e.Toggle(f)
b=f
if b then
runLoop()
end
end

return e