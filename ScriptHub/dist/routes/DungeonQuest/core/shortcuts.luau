


local a=require"@routes/DungeonQuest/core/services"
local b=require"@routes/DungeonQuest/core/shared"
local c=require"@routes/DungeonQuest/core/lifecycle"


local d=a.UserInputService
local e=a.VirtualInputManager


local f={}


local g=false
local h

function f.IsMouseComboEnabled()
return g
end

function f.SetMouseComboEnabled(i)
g=i==true
end




local function fireCombo()
task.spawn(function()
e:SendKeyEvent(true,Enum.KeyCode.Q,false,game)
e:SendKeyEvent(true,Enum.KeyCode.E,false,game)
task.wait(b.GetKeyHoldTime())
e:SendKeyEvent(false,Enum.KeyCode.Q,false,game)
e:SendKeyEvent(false,Enum.KeyCode.E,false,game)
end)
end


function f.Init()
if f.inited then return end
f.inited=true

h=d.InputBegan:Connect(function(i,j)
if i.UserInputType==Enum.UserInputType.MouseButton2 then
if d:GetFocusedTextBox()then return end
if g then
fireCombo()
end
end
end)

end

c.Register(function()
if h then h:Disconnect();h=nil end
f.inited=false
end)

return f