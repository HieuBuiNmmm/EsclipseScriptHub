


local a=require"@routes/DungeonQuest/core/services"
local b=require"@routes/DungeonQuest/core/shared"
local c=a.player

local d={}








function d.Validate(e)
if not e then return false end
local f=e.Model
if not f or not f.Parent or f==c.Character then return false end

local g=e.Humanoid
if not g or not g.Parent then
g=f:FindFirstChildOfClass"Humanoid"
e.Humanoid=g
end
if not g or g.Health<=0 then return false end

local h=e.Root
if not h or not h.Parent then
h=f:FindFirstChild"HumanoidRootPart"or f.PrimaryPart
if not h then
for i,j in ipairs(f:GetDescendants())do
if j:IsA"BasePart"then
h=j
break
end
end
end
if not h then return false end
e.Root=h
end

return true
end



function d.Scan()
local e={}
local f=b.GetTrackedEnemyData()
for g,h in ipairs(f)do
if d.Validate(h)then
table.insert(e,h)
end
end
return e
end

return d