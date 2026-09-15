
type Window={Visible:boolean?}


local a=require"@core/binder"


local b={}


function b.Window(c,d:Window):Window
d=d or{}
print"Made a window"

local e=a.Wrap(d,{
Visible=function(e:boolean)
print("Set window visibility to:",e)
end,
})

return a.Apply(d,e)
end

return b