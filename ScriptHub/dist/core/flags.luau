local a={}

function a.Export(b)
local c={}

for d,e in pairs(b)do
if typeof(e)=="Instance"or type(e)=="table"then
local f,g=pcall(function()

end)

if f and g~=nil then
c[d]=g
end
end
end

return c
end

function a.Import(b,c)
for d,e in pairs(c)do
local f=b[d]

if f and f.Value~=nil then
local g=pcall(function()

end)

if not g then
warn(`Failed to import value for flag "{d}"`)
end
end
end
end

function a.Reset(b)
for c in pairs(b)do
b[c]=nil
end
end

return a