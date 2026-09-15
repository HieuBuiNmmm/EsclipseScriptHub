



local a=game:GetService"Workspace"


local b={}


local c
local d={}
local e
local f=0


local g={
thickness=3,
transparency=0.25,
}

function b.SetStyle(h)
if type(h)~="table"then return end
if h.thickness~=nil then
g.thickness=math.clamp(h.thickness,1,10)
end
if h.transparency~=nil then
g.transparency=math.clamp(h.transparency,0,0.9)
end
end

function b.GetStyle()
return{thickness=g.thickness,transparency=g.transparency}
end


local h=0.4

local function ensureAnchor()
if c and c.Parent then return c end
c=Instance.new"Part"
c.Name="PR_PathAnchor_Visual"
c.Anchored=true
c.CanCollide=false
c.CanQuery=false
c.CanTouch=false
c.Transparency=1
c.Size=Vector3.new(1,1,1)
c.CFrame=CFrame.new(0,0,0)
c.Parent=a
return c
end

function b.Clear()
for i,j in ipairs(d)do
pcall(function()j:Destroy()end)
end
table.clear(d)
e=nil
end



function b.DrawPolylines(i,j,k)
if not i or#i==0 then
b.Clear()
return
end

local l=tostring(j)
if l==e then return end
if not k and os.clock()-f<h and#d>0 then return end

b.Clear()
e=l
f=os.clock()

local m=ensureAnchor()
for n,o in ipairs(i)do
local p=o.points
if p and#p>=2 then
for q=2,#p do
local r=p[q-1]
local s=p[q]
local t=(s-r).Magnitude
if t>0.01 then
local u=Instance.new"LineHandleAdornment"
u.Name="PR_PathLine_Visual"
u.Adornee=m
u.Length=t
u.Thickness=g.thickness
u.Transparency=g.transparency
u.Color3=o.color or Color3.fromRGB(0,230,255)
u.ZIndex=1
u.CFrame=CFrame.lookAt(r,s)
u.Parent=a
table.insert(d,u)
end
end
end
end
if#d==0 then e=nil end
end

return b