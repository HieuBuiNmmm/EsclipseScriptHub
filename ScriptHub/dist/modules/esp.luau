local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b={}function b.Apply(c,d,e)
for f,g in pairs(c)do if e and table.find(e,f)then continue end pcall(function()
d[f]=g end)end return d end function b.Wrap(c,d,e,f)local g={}setmetatable(g,{
__index=function(h,i)if c[i]~=nil then return c[i]elseif f then local j,k=pcall(
function()return f[i]end)if j then return k end end return end,__newindex=
function(h,i,j)local k=d[i]if k then k(j)if not(e and table.find(e,i))then c[i]=
j end elseif f then local l,m=pcall(function()f[i]=j end)if not l then c[i]=j
end else c[i]=j end end})return g end return b end end local b,c=a.load'a',{}
return(b.Wrap(c,{Enabled=function(d)print(`{d and'Enabled'or'Disabled'} ESP.`)
end}))