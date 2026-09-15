




require"@routes/DungeonQuest/core/services"
local a=require"@routes/DungeonQuest/core/lifecycle"


local b={}


local c=false
local d
local e={}
local f={}
local g={}

local h=2





























































local i={
["meshes/ice3"]=true,
["meshes/snow"]=true,
["invisible platform"]=true,part=
true,
}

local function shouldKeepChildLv1(j)
if not j then return true end
if j:IsA"Model"or j:IsA"Folder"then
return true
end
local k=j.Name:lower()
if i[k]or j.Name=="Meshes/Ice3"or j.Name=="Meshes/Snow"or j.Name=="Invisible platform"or j.Name=="Part"then
return true
end
return false
end


local function cleanBorderModels()
if not c then return end

local j=workspace:FindFirstChild"Map"
if not j then return end

for k,l in ipairs(j:GetDescendants())do
if(l:IsA"Model"or l:IsA"Folder")and l.Name:lower():find"border"then
for m,n in ipairs(l:GetChildren())do
pcall(function()
n:Destroy()
end)
end
end
end
end


local function cleanWoodenPlankModels()
if not c then return end

local j=workspace:FindFirstChild"Map"
if not j then return end

for k,l in ipairs(j:GetDescendants())do
if l.Name:lower():find"wooden plank"then
local m=l.Parent
while m and m~=j and m~=workspace do
if m:IsA"Model"then
pcall(function()
m:Destroy()
end)
break
end
m=m.Parent
end
end
end
end


local function cleanMapChildrenLv1()
if not c then return end

local j=workspace:FindFirstChild"Map"
if not j then return end

for k,l in ipairs(j:GetChildren())do
if not shouldKeepChildLv1(l)then
pcall(function()
l:Destroy()
end)
end
end
end


local j={
Vector3.new(-724.4873046875,33.9286003112793,174.7227325439453),
Vector3.new(-697.8023681640625,26.397010803222656,380.60272216796875),
Vector3.new(-649.3167724609375,31.39712905883789,397.80535888671875),
Vector3.new(-581.634033203125,3.4567506313323975,318.2510070800781),
Vector3.new(-491.9974365234375,41.522090911865234,384.67694091796875),
Vector3.new(-484.0378723144531,35.76678466796875,418.82659912109375),
Vector3.new(-470.1619567871094,32.919700622558594,461.6861267089844),
Vector3.new(-468.8152770996094,39.06712341308594,514.388916015625),
Vector3.new(-600.4266357421875,13.99144172668457,570.6660766601562),
Vector3.new(-338.2521667480469,42.990394592285156,439.36456298828125),
Vector3.new(-355.2449951171875,57.510982513427734,385.5475769042969),
Vector3.new(-606.5220336914063,37.41774368286133,372.6407470703125),
}

local k=0.2

local function matchesDeletePosition(l)
if not l then return false end
for m,n in ipairs(j)do
if(l-n).Magnitude<=k then
return true
end
end
return false
end

local function shouldDeleteModelByPosition(l)
if not l or not l:IsA"Model"or not l.Parent then return false end


local m,n=pcall(function()return l:GetPivot().Position end)
if m and n and matchesDeletePosition(n)then
return true
end


if l.PrimaryPart and matchesDeletePosition(l.PrimaryPart.Position)then
return true
end


for o,p in ipairs(l:GetDescendants())do
if p:IsA"BasePart"and matchesDeletePosition(p.Position)then
return true
end
end

return false
end


local function cleanModelsByPosition()
if not c then return end

local l=workspace:FindFirstChild"Map"or workspace:FindFirstChild"dungeon"or workspace:FindFirstChild"Dungeon"
if not l then return end

for m,n in ipairs(l:GetDescendants())do
if not n.Parent then continue end

if n:IsA"Model"then
if shouldDeleteModelByPosition(n)then
pcall(function()
n:Destroy()
end)
end
elseif n:IsA"BasePart"then
if matchesDeletePosition(n.Position)then
local o=n:FindFirstAncestorOfClass"Model"
if o and o~=workspace and o~=l then
pcall(function()
o:Destroy()
end)
else
pcall(function()
n:Destroy()
end)
end
end
end
end
end


local function processSnowPart(l)
if not c or not l or not l:IsA"BasePart"then return end
if l.Name=="Meshes/Snow"or l.Name:lower():find"meshes/snow"or l.Name:lower()=="snow"then
if g[l]==nil then
g[l]=l.Transparency
end
pcall(function()
l.Transparency=1
end)
end
end

local function cleanSnowParts()
if not c then return end

local l=workspace:FindFirstChild"Map"
if not l then return end

for m,n in ipairs(l:GetDescendants())do
if n:IsA"BasePart"and(n.Name=="Meshes/Snow"or n.Name:lower():find"meshes/snow"or n.Name:lower()=="snow")then
processSnowPart(n)
end
end
end


local function cleanMapFolder()
if not c then return end


cleanMapChildrenLv1()


cleanBorderModels()


cleanWoodenPlankModels()


cleanModelsByPosition()


cleanSnowParts()
end

















local function attachListeners()
for l,m in ipairs(e)do
pcall(function()m:Disconnect()end)
end
table.clear(e)

local function hookMap(l)
if not l then return end


table.insert(e,l.ChildAdded:Connect(function(m)
if not c then return end
if not shouldKeepChildLv1(m)then
pcall(function()
m:Destroy()
end)
end
end))


table.insert(e,l.DescendantAdded:Connect(function(m)
if not c then return end


if m.Name:lower():find"wooden plank"then
local n=m.Parent
while n and n~=l and n~=workspace do
if n:IsA"Model"then
pcall(function()
n:Destroy()
end)
return
end
n=n.Parent
end
end


local n=m.Parent
while n and n~=l and n~=workspace do
if(n:IsA"Model"or n:IsA"Folder")and n.Name:lower():find"border"then
pcall(function()
m:Destroy()
end)
break
end
n=n.Parent
end


if m:IsA"Model"and shouldDeleteModelByPosition(m)then
pcall(function()
m:Destroy()
end)
return
elseif m:IsA"BasePart"and matchesDeletePosition(m.Position)then
local o=m:FindFirstAncestorOfClass"Model"
if o and o~=workspace and o~=l then
pcall(function()
o:Destroy()
end)
else
pcall(function()
m:Destroy()
end)
end
return
end


if m:IsA"BasePart"and(m.Name=="Meshes/Snow"or m.Name:lower():find"meshes/snow"or m.Name:lower()=="snow")then
processSnowPart(m)
end
end))
end

local l=workspace:FindFirstChild"Map"or workspace:FindFirstChild"dungeon"or workspace:FindFirstChild"Dungeon"
if l then
hookMap(l)
end


table.insert(e,workspace.ChildAdded:Connect(function(m)
if not c then return end
local n=m.Name:lower()
if n=="map"or n=="dungeon"then
hookMap(m)
task.delay(0.2,cleanMapFolder)
end
end))
end


local function restoreMap()

for l,m in pairs(g)do
if l and l.Parent then
pcall(function()
l.Transparency=m
end)
end
end
table.clear(g)


for l,m in pairs(f)do
if l and l.Parent then
pcall(function()
l.CanCollide=m.CanCollide
l.CanTouch=m.CanTouch
end)
end
end
table.clear(f)
end

function b.Toggle(l)
if l==c then return end
c=l and true or false

if c then
cleanMapFolder()
attachListeners()

if d then task.cancel(d);d=nil end
d=task.spawn(function()
while c do
task.wait(h)
pcall(cleanMapFolder)
end
end)
else
for m,n in ipairs(e)do
pcall(function()n:Disconnect()end)
end
table.clear(e)

if d then task.cancel(d);d=nil end
restoreMap()
end
end

function b.IsEnabled()
return c
end

a.Register(function()
b.Toggle(false)
end)

return b