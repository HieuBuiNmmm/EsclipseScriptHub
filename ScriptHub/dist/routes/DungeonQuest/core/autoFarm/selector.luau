


local a={}


function a.SelectBestTarget(b,c,d)
local e
local f=math.huge
local g

for h,i in ipairs(c)do
if d and d()then
return nil,nil,nil,nil,math.huge
end

local j=i.Root
if j and j.Parent then
local k=j.Position
local l=k.X-b.X
local m=k.Z-b.Z
local n=l*l+m*m

if n<f then
f=n
e=i
g=k
end
end
end

local h=f<math.huge and math.sqrt(f)or math.huge
return e,nil,nil,g,h
end

return a