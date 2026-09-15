





local a={}



local b={}
local c=8
for d=1,c do
local e=(d-1)*(2*math.pi/c)
b[d]=Vector3.new(math.cos(e),0,math.sin(e))
end


local d={}
local e=16
for f=1,e do
local g=(f-1)*(2*math.pi/e)
d[f]=Vector3.new(math.cos(g),0,math.sin(g))
end


local f={1.5,3.0,5.0,8.0,12.0,18.0,25.0}
local g={1.5,3.0,4.5,6.0,8.0,10.5,13.5,17.0,21.0,26.0,32.0,40.0}

a.COARSE_DIRECTIONS=b
a.FINE_DIRECTIONS=d
a.COARSE_RADII=f
a.FINE_RADII=g


function a.SamplePass(h,i,j,k,l,m,n,o)
local p
local q=math.huge
local r=Vector3.zero
local s=false


local t=i
if o and o.Magnitude>0.1 then
local u=Vector3.new(o.X,0,o.Z).Unit
t=table.clone(i)
table.sort(t,function(v,w)
local x=v.X*u.X+v.Z*u.Z
local y=w.X*u.X+w.Z*u.Z
return x>y
end)
end

for u,v in ipairs(j)do
local w=false

for x,y in ipairs(t)do
local z=h+y*v
local A=m(z)

if n then
table.insert(n,{
pos=z,
isSafe=A,
isChosen=false,
})
end

if A then
local B=z
if l and k>0 then
local C=z+y*k
if m(C)then
B=C
end
end

local C=(B-h).Magnitude
if C<q then
q=C
p=B
r=y
w=true
end
end
end

if w and p then
s=true
break
end
end

return p,s,q,r
end

return a