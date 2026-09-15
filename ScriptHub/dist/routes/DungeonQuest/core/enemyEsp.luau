





local a=require"@routes/DungeonQuest/core/services"
local b=require"@routes/DungeonQuest/core/shared"


local c={}


local d=Color3.fromRGB(255,170,0)
local e=0.55
local f="Enemy_ESP"
local g=0.5



local h={
Orange=Color3.fromRGB(255,170,0),
Red=Color3.fromRGB(255,0,0),
Yellow=Color3.fromRGB(255,255,0),
Green=Color3.fromRGB(0,255,0),
Cyan=Color3.fromRGB(0,255,255),
Blue=Color3.fromRGB(0,120,255),
Magenta=Color3.fromRGB(255,0,255),
White=Color3.fromRGB(255,255,255),
}


local i=false
local j
local k="Orange"


local function getFillColor()
return h[k]or d
end

local function createHighlight(l)
if not l or not l:IsA"Model"then return end
if not l:FindFirstChild(f)then
local m=Instance.new"Highlight"
m.Name=f
m.Adornee=l
m.FillColor=getFillColor()
m.FillTransparency=e
m.OutlineColor=getFillColor()
m.OutlineTransparency=1
m.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
m.Parent=l
end
end


local function updateAllHighlightColors()
local l=getFillColor()
for m,n in ipairs(game:GetService"Workspace":GetDescendants())do
local o=n:FindFirstChild(f)
if o and o:IsA"Highlight"then
o.FillColor=l
o.OutlineColor=l
end
end
end


local function removeAllHighlights()
for l,m in ipairs(game:GetService"Workspace":GetDescendants())do
local n=m:FindFirstChild(f)
if n then n:Destroy()end
end
for l,m in ipairs(a.Players:GetPlayers())do
local n=m.Character
if n then
for o,p in ipairs(n:GetDescendants())do
if p.Name==f then p:Destroy()end
end
end
end
end


function c.Toggle(l)
if l==i then return end
i=l

if i then
if j then task.cancel(j);j=nil end
j=task.spawn(function()
while i do
local m,n=pcall(function()
for m,n in ipairs(b.GetTrackedEnemyData())do
if n.Model and n.Model.Parent then
createHighlight(n.Model)
end
end
end)
if not m then
if os.clock()-(c.lastWarn or 0)>5 then
c.lastWarn=os.clock()
warn("[EnemyESP] error:",tostring(n))
end
end
task.wait(g)
end
end)
else
if j then task.cancel(j);j=nil end
local m=pcall(removeAllHighlights)
if not m then warn"[EnemyESP] cleanup error"end
end
end

function c.IsEnabled()
return i
end

function c.GetColorNames()
local l={}
for m in pairs(h)do table.insert(l,m)end
table.sort(l)
return l
end

function c.GetSelectedColor()
return k
end

function c.SetSelectedColor(l)
if not h[l]then return end
if l==k then return end
k=l
local m=pcall(updateAllHighlightColors)
if not m then warn"[EnemyESP] recolor error"end
end

return c