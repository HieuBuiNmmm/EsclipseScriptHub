
local a=require"@core/binder"


local b={}


return a.Wrap(b,{
Enabled=function(c:boolean)
print(`{c and"Enabled"or"Disabled"} ESP.`)
end,
})::{Enabled:boolean}