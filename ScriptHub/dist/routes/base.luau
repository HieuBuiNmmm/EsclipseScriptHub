
local a=require"@core/flags"
local b=require"@modules/interface"
local c=require"@modules/esp"


local d=b:Window{
Visible=true,
}

return{
Flags=a,
Esp=c,
Interface=b,
Window=d,

Tabs={
Home=function(e)



end,

Visuals=function(e)



end,

Settings=function(e)



end,

Config=function(e)



end,
},
}