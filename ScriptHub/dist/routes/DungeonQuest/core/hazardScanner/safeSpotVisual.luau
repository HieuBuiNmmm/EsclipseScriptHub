



local a=Color3.fromRGB(0,255,120)
local b=Color3.fromRGB(0,255,150)
local c=Color3.fromRGB(255,255,255)
local d=Color3.fromRGB(0,235,140)
local e=Color3.fromRGB(255,60,60)

local f=0.20
local g=1.4
local h=0.45


local i={}


local j
local k
local l
local m={}


local function ensureMainVisuals(n)
if not n then return end


if not j or not j.Parent then
if j then pcall(function()j:Destroy()end)end
local o=Instance.new"CylinderHandleAdornment"
o.Name="SafeSpot_OuterMarker"
o.Adornee=n
o.Radius=g
o.Height=f
o.Color3=a
o.Transparency=0.35
o.ZIndex=6
o.AlwaysOnTop=false
o.Visible=false
o.Parent=n
j=o
end


if not k or not k.Parent then
if k then pcall(function()k:Destroy()end)end
local o=Instance.new"CylinderHandleAdornment"
o.Name="SafeSpot_CenterDot"
o.Adornee=n
o.Radius=h
o.Height=f+0.05
o.Color3=c
o.Transparency=0.15
o.ZIndex=7
o.AlwaysOnTop=false
o.Visible=false
o.Parent=n
k=o
end


if not l or not l.Parent then
if l then pcall(function()l:Destroy()end)end
local o=Instance.new"LineHandleAdornment"
o.Name="SafeSpot_EscapeLine"
o.Adornee=n
o.Color3=b
o.Thickness=3.5
o.Transparency=0.20
o.ZIndex=6
o.AlwaysOnTop=false
o.Visible=false
o.Parent=n
l=o
end
end


local function ensureCandidateAdornment(n,o)
local p=m[n]
if not p then
local q=Instance.new"CylinderHandleAdornment"
q.Name="SafeSpot_CandidateDot_"..n
q.Adornee=o
q.Radius=0.25
q.Height=f
q.ZIndex=4
q.AlwaysOnTop=false
q.Visible=false
q.Parent=o

local r=Instance.new"LineHandleAdornment"
r.Name="SafeSpot_CandidateLine_"..n
r.Adornee=o
r.Thickness=1.2
r.ZIndex=4
r.AlwaysOnTop=false
r.Visible=false
r.Parent=o

p={dot=q,line=r}
m[n]=p
else
if p.dot and p.dot.Adornee~=o then
p.dot.Adornee=o
p.dot.Parent=o
end
if p.line and p.line.Adornee~=o then
p.line.Adornee=o
p.line.Parent=o
end
end
return p
end


function i.HideCandidates()
for n,o in ipairs(m)do
if o.dot and o.dot.Parent then o.dot.Visible=false end
if o.line and o.line.Parent then o.line.Visible=false end
end
end


function i.Hide()
if j and j.Parent then j.Visible=false end
if k and k.Parent then k.Visible=false end
if l and l.Parent then l.Visible=false end
i.HideCandidates()
end


local function updateCandidateGrid(n,o,p,q)
if not q or not p or#p==0 then
i.HideCandidates()
return
end

local r=Vector3.new(n.Position.X,o+0.05,n.Position.Z)
local s=n.CFrame:PointToObjectSpace(r)

for t,u in ipairs(p)do
local v=ensureCandidateAdornment(t,n)
local w=Vector3.new(u.pos.X,o+0.05,u.pos.Z)
local x=n.CFrame:PointToObjectSpace(w)

local y=u.isSafe and d or e
local z=u.isSafe and 0.35 or 0.55


if v.dot and v.dot.Parent then
local A=CFrame.new(w)*CFrame.Angles(math.rad(90),0,0)
v.dot.CFrame=n.CFrame:ToObjectSpace(A)
v.dot.Color3=y
v.dot.Transparency=z
v.dot.Radius=u.isSafe and 0.30 or 0.20
v.dot.Visible=true
end


if v.line and v.line.Parent then
local A=x-s
local B=A.Magnitude
if B>0.2 then
v.line.CFrame=CFrame.lookAt(s,x)
v.line.Length=B
v.line.Color3=y
v.line.Transparency=z+0.15
v.line.Thickness=u.isSafe and 1.4 or 0.9
v.line.Visible=true
else
v.line.Visible=false
end
end
end


for t=#p+1,#m do
local u=m[t]
if u.dot and u.dot.Parent then u.dot.Visible=false end
if u.line and u.line.Parent then u.line.Visible=false end
end
end


function i.Update(n,o,p,q,r,s)
if not n or not n.Parent or not r or not o then
i.Hide()
return
end

ensureMainVisuals(n)

local t=Vector3.new(o.X,p,o.Z)


if j and j.Parent then
local u=CFrame.new(t)*CFrame.Angles(math.rad(90),0,0)
j.CFrame=n.CFrame:ToObjectSpace(u)
j.Visible=true
end


if k and k.Parent then
local u=CFrame.new(t)*CFrame.Angles(math.rad(90),0,0)
k.CFrame=n.CFrame:ToObjectSpace(u)
k.Visible=true
end


if l and l.Parent then
local u=Vector3.new(n.Position.X,p+0.1,n.Position.Z)
local v=Vector3.new(o.X,p+0.1,o.Z)

local w=n.CFrame:PointToObjectSpace(u)
local x=n.CFrame:PointToObjectSpace(v)
local y=x-w
local z=y.Magnitude

if z>0.3 then
l.CFrame=CFrame.new(w)
l.Length=z
l.CFrame=CFrame.lookAt(w,x)
l.Visible=true
else
l.Visible=false
end
end


updateCandidateGrid(n,p,q,s)
end


function i.Cleanup()
if j then pcall(function()j:Destroy()end);j=nil end
if k then pcall(function()k:Destroy()end);k=nil end
if l then pcall(function()l:Destroy()end);l=nil end

for n,o in ipairs(m)do
if o.dot then pcall(function()o.dot:Destroy()end)end
if o.line then pcall(function()o.line:Destroy()end)end
end
table.clear(m)
end

return i