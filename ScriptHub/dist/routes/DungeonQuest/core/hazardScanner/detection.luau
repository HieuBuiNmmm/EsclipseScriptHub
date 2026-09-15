






local a=require"@routes/DungeonQuest/core/services"
local b=require"@routes/DungeonQuest/core/shared"
local c=require"@routes/DungeonQuest/core/lifecycle"
local d=require"@routes/DungeonQuest/core/hazardScanner/geometry"
local e=require"@routes/DungeonQuest/core/hazardScanner/visualizer"
local f=require"@routes/DungeonQuest/core/hazardScanner/trajectory"


local g=game:GetService"Players"
local h=game:GetService"Workspace"
local i=game:GetService"ReplicatedStorage"
local j=a.player


local k={}


local l=false
local m=false
local n=true
local o=false
local p=false
local q=""
local r=false
local s={}
local t=0
local u={}
local v
local w={}
local x



local y={"abilities","projectiles"}
local z=false
local A={}

local function loadIgnoreNames()
if z then return end
z=true
for B,C in ipairs(y)do
local D=i:FindFirstChild(C)
if D then
for E,F in ipairs(D:GetChildren())do
local G=(F.Name or""):lower():gsub("%s+","")
if#G>0 then A[G]=true end
end
end
end
end

local function isIgnoredName(B)
if not B then return false end
local C=(B.Name or""):lower():gsub("%s+","")
return#C>0 and A[C]==true
end


local function isPlayerCharacter(B)
if not B then return false end
if g:GetPlayerFromCharacter(B)then return true end
if g:FindFirstChild(B.Name)then return true end
for C,D in ipairs(g:GetPlayers())do
if B.Name==D.Name then return true end
local E=D.Character
if E and(B==E or B:IsDescendantOf(E))then
return true
end
end
local C=j and j.Character
if C and(B==C or B:IsDescendantOf(C))then return true end
return false
end


local function fireHazardChanged()
local B=0
for C in pairs(s)do B+=1 end
t=B
for C=#u,1,-1 do
pcall(u[C],B,v)
end
end


local B=0.85



local C=50
local D=0.05
local E={}

local function stopRetry(F)
local G=E[F]
if G then
G.active=false
E[F]=nil
end
end

local function stopAllRetries()
for F,G in pairs(E)do
if G then G.active=false end
end
table.clear(E)
end



local function getBaseParts(F)
if not F then return{}end
local G={}
local function addPart(H)
if H and H.Parent and H.Transparency<=B then
G[#G+1]=H
end
end
if F:IsA"BasePart"then
addPart(F)
else
for H,I in ipairs(F:GetDescendants())do
if I:IsA"BasePart"and I.Parent then
addPart(I)
end
end
end
return G
end


local function computeDistance(F)
local G=j and j.Character
if not G then return 0 end
local H=G:FindFirstChild"HumanoidRootPart"or G.PrimaryPart
if not H then return 0 end
local I=H.Position

local J
if F:IsA"BasePart"then
J=F.Position
elseif F:IsA"Model"then
local K,L=pcall(function()
return F:GetPivot().Position
end)
if K then
J=L
else
local M=F:FindFirstChildWhichIsA"BasePart"
J=M and M.Position
end
end
if not J then return 0 end
return math.floor((I-J).Magnitude+0.5)
end



local function attachSelectionBoxes(F,G)
local H={}
for I,J in ipairs(F)do
if J and J.Parent then
local K=Instance.new"SelectionBox"
K.Name="HazardSelectionBox"
K.Color3=Color3.fromRGB(255,45,45)
K.SurfaceColor3=Color3.fromRGB(255,30,30)
K.SurfaceTransparency=0.6
K.LineThickness=0.05
K.Adornee=J
K.Parent=J

local L=J:GetPropertyChangedSignal"Transparency":Connect(function()
if J.Parent and J.Transparency>B then
pcall(function()K:Destroy()end)
end
end)
if G then table.insert(G,L)end

H[#H+1]=K
end
end
return H
end


local function matchesInspectTarget(F)
if not r or q==""then return false end
if not F or type(F)~="string"then return false end
local G=q:lower():gsub("%s+","")
if#G==0 then return false end
local H=F:lower():gsub("%s+","")
return string.find(H,G,1,true)~=nil
end

local function formatVector3(F)
if not F then return"nil"end
return("(%.2f, %.2f, %.2f)"):format(F.X,F.Y,F.Z)
end

local function printDeepInspect(F,G,H,I)
if not F then return end
local J=F.Name
if not matchesInspectTarget(J)then return end

local K=F.ClassName
local L=F.Parent and F.Parent:GetFullName()or"nil"
local M=computeDistance(F)

print"================== 🔍 [HAZARD DEEP INSPECT] 🔍 =================="
print(("  🎯 Target Name    : %s (%s)"):format(J,K))
print(("  📌 Event Type     : %s%s"):format(G,H and(" -> "..tostring(H))or""))
print(("  📍 Full Path      : %s"):format(L))
print(("  📏 Dist to Player : %d studs"):format(M))

if G=="SPAWN"then
local N={}
if F:IsA"BasePart"then
table.insert(N,F)
else
for O,P in ipairs(F:GetDescendants())do
if P:IsA"BasePart"then
table.insert(N,P)
end
end
end

print(("  🧩 Total Parts (%d) :"):format(#N))
for O,P in ipairs(N)do
local Q=P:IsA"Part"and tostring(P.Shape.Name)or(P.ClassName=="MeshPart"and"MeshPart"or P.ClassName)
print(("     [%d] %q (%s)"):format(O,P.Name,P.ClassName))
print(("         • Size: %s | Shape: %s | Trans: %.2f | CanCollide: %s"):format(
formatVector3(P.Size),
Q,
P.Transparency,
tostring(P.CanCollide)
))
print(("         • Pos : %s"):format(formatVector3(P.Position)))
end

local O=d.GetHazardZones(I)
if O and O.zones then
local P=d.GetHitboxPadding()
print(("  📐 Math Geometry (Zones: %d, BoundingRadius: %.1f studs):"):format(
#O.zones,
O.boundingRadius or 0
))
for Q,R in ipairs(O.zones)do
if R.radius then
print(("     - Zone [%d]: Circle/Ball (Base Radius: %.2f + Pad: %.2f = %.2f studs)"):format(
Q,R.radius,P,R.radius+P
))
elseif R.half then
print(("     - Zone [%d]: Box/OBB (HalfSize: %s)"):format(
Q,formatVector3(R.half)
))
end
end
end


task.spawn(function()
local P
if F:IsA"BasePart"then
P=F
elseif F:IsA"Model"then
P=F.PrimaryPart or F:FindFirstChildWhichIsA"BasePart"
end
if not P then return end

local Q=os.clock()
local R=P.CFrame
task.wait(0.12)

if not F.Parent or not P.Parent then return end

local S=os.clock()
local T=P.CFrame
local U=S-Q
if U<=0 then return end


local V=T*R:Inverse()
local W,X=V:ToAxisAngle()
local Y=math.deg(X)/U


local Z=R:Inverse()*T local
_, aa=Z:ToAxisAngle()

if math.abs(math.deg(X))>=1.5 then
local ab="Trục tự do / Hỗn hợp"
if math.abs(W.Y)>=0.8 then
ab="Trục Y (Yaw - Quét ngang mặt sàn)"
elseif math.abs(W.X)>=0.8 then
ab="Trục X (Pitch - Lăn nhào lộn)"
elseif math.abs(W.Z)>=0.8 then
ab="Trục Z (Roll - Nghiêng lật bên)"
end

local ac="Trục tự do"
if math.abs(_.Y)>=0.8 then
ac="Trục Local Y"
elseif math.abs(_.X)>=0.8 then
ac="Trục Local X"
elseif math.abs(_.Z)>=0.8 then
ac="Trục Local Z"
end

print"================== 🔄 [INSPECT: SPINNING DETECTED] 🔄 =================="
print(("  🎯 Target Name    : %s (%s)"):format(F.Name,P.Name))
print(("  ⚡ Tốc độ xoay    : %.2f °/s (%.2f rad/s)"):format(Y,X/U))
print(("  🌐 World Spin Axis: %s -> %s"):format(formatVector3(W),ab))
print(("  🧩 Local Spin Axis: %s -> %s"):format(formatVector3(_),ac))
print"========================================================================"
end
end)
elseif G=="DESPAWN"then
if I and I.SpawnClock then
local aa=os.clock()-I.SpawnClock
print(("  ⏱️ Lifetime Active: %.2f seconds"):format(aa))
end
elseif G=="REJECTED"then
print(("  ⚠️ Rejection Reason: %s"):format(tostring(H)))
end
print"================================================================"
end


local function logReject(aa,ab)
printDeepInspect(aa,"REJECTED",ab,nil)
if not p then return end
local ac=aa and aa.Name or"?"
local F=aa and aa.ClassName or"?"
print(("[HazardScanner][Reject] ⚪ %s (%s) — %s"):format(ac,F,ab))
end

local aa



local function retryRegister(ab)
if not ab or not ab.Parent then return end
if isPlayerCharacter(ab)then return end
if s[ab]then return end
if E[ab]then return end

local ac={active=true,count=0}
E[ab]=ac

task.spawn(function()
while ac.active and ab.Parent and l and m do
if isPlayerCharacter(ab)then
stopRetry(ab)
return
end
ac.count+=1
local F=ab:GetDescendants()
local G=getBaseParts(ab)

local H=matchesInspectTarget(ab.Name)
if p or H then
print(("[HazardScanner][Retry] 🔄 Lần %d/%d: %q (%s) | Descendants: %d | Valid Parts (Trans<=%.2f): %d"):format(
ac.count,
C,
ab.Name,
ab.ClassName,
#F,
B,
#G
))
end

if#G>0 then
if p or H then
print(("[HazardScanner][Retry] ✅ Lần %d/%d: %q Đã tìm thấy %d part(s)! Tiến hành vẽ..."):format(
ac.count,
C,
ab.Name,
#G
))
end
stopRetry(ab)
aa(ab)
return
end

if ac.count>=C then
logReject(ab,("Hết %d lượt retry mà không tìm thấy BasePart hợp lệ (Descendants: %d)"):format(
C,
#F
))
stopRetry(ab)
return
end

task.wait(D)
end
stopRetry(ab)
end)
end


aa=function(ab)
if not l or not m then
logReject(ab,"Chưa trong dungeon")
return false
end
if not ab or not ab.Parent then
logReject(ab,"Không còn Parent")
return false
end
if isPlayerCharacter(ab)then
logReject(ab,"Nhân vật người chơi (Player/Teammate)")
return false
end
if s[ab]then return true end

loadIgnoreNames()
if isIgnoredName(ab)then
logReject(ab,"Trùng tên trong ReplicatedStorage (abilities/projectiles)")
return false
end

local ac=getBaseParts(ab)
if#ac==0 then
logReject(ab,"Chưa có part để vẽ (sẽ retry)")
retryRegister(ab)
return false
end

local F={}
local G={}
if n then
G=attachSelectionBoxes(ac,F)
end
local H=computeDistance(ab)

local I={
Instance=ab,
Name=ab.Name,
Class=ab.ClassName,
Distance=H,
Boxes=G,
Connections=F,
SpawnClock=os.clock(),
}
s[ab]=I
v={
Name=ab.Name,
Class=ab.ClassName,
Distance=H,
}

if e.IsEnabled()then
e.AttachZoneVisuals(I)
end
if f.IsEnabled()then
f.AttachTrajectoryVisuals(I)
end

stopRetry(ab)

printDeepInspect(ab,"SPAWN","Passed all gates",I)

if o then
print(("[HazardScanner][Hazard] 🔴 Hazard Detected: %s (%s, %d studs)")
:format(ab.Name,ab.ClassName,H))
end
fireHazardChanged()
return true
end


local function unregisterHazard(ab,ac)
local F=s[ab]
if not F then
stopRetry(ab)
return
end

printDeepInspect(ab,"DESPAWN",ac,F)

e.DetachZoneVisuals(F)
f.DetachTrajectoryVisuals(F)

if F.Boxes then
for G,H in ipairs(F.Boxes)do
pcall(function()H:Destroy()end)
end
table.clear(F.Boxes)
end

if F.Connections then
for G,H in ipairs(F.Connections)do
pcall(function()H:Disconnect()end)
end
table.clear(F.Connections)
end

s[ab]=nil

if o then
local G=ac and(" ("..ac..")")or""
print(("[HazardScanner][Hazard] 🟢 Hazard Expired: %s%s")
:format(tostring(F.Name),G))
end
fireHazardChanged()
end


function k.ClearAllHazards(ab)
e.ClearAll()
f.ClearAll()
stopAllRetries()
local ac={}
for F in pairs(s)do
table.insert(ac,F)
end
for F,G in ipairs(ac)do
unregisterHazard(G,ab)
end
if o and ab then
print(("[HazardScanner][Hazard] 🧹 All hazards cleared: %s"):format(ab))
end
end


function k.StartScan()
if l then return end
l=true

e.BindDetection(k)
f.BindDetection(k)
k.ClearAllHazards"StartScan Reset"

for ab,ac in ipairs(w)do ac:Disconnect()end
table.clear(w)

table.insert(w,h.ChildAdded:Connect(function(ab)
if isPlayerCharacter(ab)then return end
aa(ab)
end))

table.insert(w,h.ChildRemoved:Connect(function(ab)
unregisterHazard(ab,"Destroyed")
end))




m=b.GetCurrentRoomIndex()>0

if x then pcall(x);x=nil end
x=b.OnRoomIndexChanged(function(ab)
if ab>0 then
m=true
elseif ab<=0 and m then
m=false
k.ClearAllHazards"Dungeon Ended"
end
end)

if o then
print"[HazardScanner] 📡 Threat Detector started!"
end
end


function k.StopScan()
l=false
m=false

for ab,ac in ipairs(w)do ac:Disconnect()end
table.clear(w)

if x then pcall(x);x=nil end

k.ClearAllHazards"StopScan"

if o then
print"[HazardScanner] 🛑 Threat Detector stopped."
end
end


function k.IsEnabled()
return l
end

function k.SetEnabled(ab)
if ab then
k.StartScan()
else
k.StopScan()
end
end

function k.SetSelectionBoxesEnabled(ab)
n=ab and true or false
if n then
for ac,F in pairs(s)do
if ac and ac.Parent and(not F.Boxes or#F.Boxes==0)then
local G=getBaseParts(ac)
F.Connections=F.Connections or{}
F.Boxes=attachSelectionBoxes(G,F.Connections)
end
end
else
for ac,F in pairs(s)do
if F.Boxes then
for G,H in ipairs(F.Boxes)do
pcall(function()H:Destroy()end)
end
table.clear(F.Boxes)
end
end
end
end

function k.IsSelectionBoxesEnabled()
return n
end

function k.SetLogHazards(ab)
o=ab and true or false
end

function k.IsLogHazardsEnabled()
return o
end

function k.SetLogFailed(ab)
p=ab and true or false
end

function k.IsLogFailedEnabled()
return p
end

function k.SetInspectTarget(ab)
q=type(ab)=="string"and ab or""
end

function k.GetInspectTarget()
return q
end

function k.SetInspectEnabled(ab)
r=ab and true or false
end

function k.IsInspectEnabled()
return r
end

function k.GetHazardCount()
return t
end

function k.GetActiveHazards()
local ab={}
for ac,F in pairs(s)do
if ac and ac.Parent==h then
ab[#ab+1]=F
end
end
return ab
end

function k.GetActiveHazardsMap()
return s
end

function k.GetLastHazardInfo()
return v
end

function k.OnHazardChanged(ab)
if type(ab)~="function"then return end
table.insert(u,ab)
end


c.Register(function()
k.StopScan()
k.ClearAllHazards"Shutdown"
end)

return k