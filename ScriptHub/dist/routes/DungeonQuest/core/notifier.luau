



local a


local b={}


function b.SetWindow(c,d)
a=d
end

function b.Notify(c,d,e)
e=e or 3

if a then
local f=pcall(function()
a:Notify{Title=c,Description=d,Lifetime=e}
end)
if f then return end
end

pcall(function()
game:GetService"StarterGui":SetCore("SendNotification",{
Title=c,
Text=d,
Duration=e,
})
end)
end

return b