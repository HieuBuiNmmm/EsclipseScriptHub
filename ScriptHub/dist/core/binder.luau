local a={}

function a.Apply(b:{[string]:any},c:any,d:{[number]:string}?):any
for e,f in pairs(b)do
if d and table.find(d,e)then
continue
end

pcall(function()
c[e]=f
end)
end

return c
end

function a.Wrap(
b:{[string]:any},
c:{[string]:(any)->()},
d:{[number]:any}?,
e:Instance?
):any
local f={}

setmetatable(f,{
__index=function(g,h)
if b[h]~=nil then
return b[h]
elseif e then
local i,j=pcall(function()
return e[h]
end)

if i then
return j
end
end

return
end,

__newindex=function(g,h,i)
local j=c[h]

if j then
j(i)

if not(d and table.find(d,h))then
b[h]=i
end
elseif e then local
k, l=pcall(function()
e[h]=i
end)

if not k then
b[h]=i
end
else
b[h]=i
end
end,
})

return f
end

return a