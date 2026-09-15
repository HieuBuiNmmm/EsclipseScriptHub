local a,b={}function a:SetWindow(c)b=c end function a.Notify(c,d,e)e=e or 3 if b
then local f=pcall(function()b:Notify{Title=c,Description=d,Lifetime=e}end)if f
then return end end pcall(function()game:GetService'StarterGui':SetCore(
'SendNotification',{Title=c,Text=d,Duration=e})end)end return a