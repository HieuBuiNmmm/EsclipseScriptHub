

return function(a)

local b=require"@routes/base"
local c=require"@core/utility"
local d=require"@core/services"local e=


b.Flags local f=
b.Esp local g=
b.Interface
local h=b.Window
local i=b.Tabs

c.GetPlayer()local j=

d.Players


do
i.Home(a)
end

do
local k=h:Tab{Name="Exploits"}

k:Toggle{
Name="Flight",
}
end

do
i.Visuals(a)
end

do
local k=i.Settings(a)

k:Toggle{
Name="Dark Mode",
}
end

do
i.Config(a)
end


h.Title=a.Name
end