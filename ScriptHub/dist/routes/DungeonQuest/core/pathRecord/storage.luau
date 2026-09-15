






















local a=require"@routes/DungeonQuest/core/services"
local b=require"@packages/Maclib"
local c=require"@routes/DungeonQuest/core/autoSave"

local d=a.HttpService or game:GetService"HttpService"


local e={}


local f="DQMacro"
local g="pathRecord"
local h=3



local i="normal"
local j="full"

local function normalizeMode(k)
if k==j then return j end
return i
end


local k=(isfile~=nil and writefile~=nil and makefolder~=nil and isfolder~=nil)


local l={}
local m=false


local n={}

local function fireChanged()
for o=#n,1,-1 do
pcall(n[o])
end
end


local function getMacroDir()
local o=b.Folder or"EsclipseHub"
return o.."/"..f
end


local function ensureFolder()
if not k then return end
pcall(function()
local o=b.Folder or"EsclipseHub"
if not isfolder(o)then
makefolder(o)
end
local p=getMacroDir()
if not isfolder(p)then
makefolder(p)
end
end)
end


local function sanitizeFileName(o)
if type(o)~="string"then return"Unknown"end
return(string.gsub(o,'[/\\:*?"<>|]',"_"))
end

local function getFilePathForMap(o)
return getMacroDir().."/"..sanitizeFileName(o)..".json"
end

local function encodeVec(o)
if not o then return nil end
return{X=o.X,Y=o.Y,Z=o.Z}
end

local function decodeVec(o)
if not o or type(o)~="table"then return nil end
return Vector3.new(o.X or 0,o.Y or 0,o.Z or 0)
end

local function isRoomSeg(o)
return type(o)=="table"and type(o.points)=="table"and#o.points>0
end


local function decodeFacing(o)
if type(o)~="table"or type(o.X)~="number"then return nil end
local p=Vector3.new(o.X,0,o.Z)
if p.Magnitude<0.001 then return nil end
return p.Unit
end


local function decodeEvents(o)
if type(o)~="table"then return nil end

local p={}
for q,r in ipairs(o.dwells or{})do
local s=decodeVec(r.pos)
if s then
p[#p+1]={
pos=s,
dur=tonumber(r.dur)or 0,
facing=decodeFacing(r.facing),
}
end
end

local q={}
for r,s in ipairs(o.skills or{})do
local t=decodeVec(s.pos)
if t then
q[#q+1]={
pos=t,
facing=decodeFacing(s.facing),
key=s.key,
dw=math.floor(tonumber(s.dw)or 0),
dwT=tonumber(s.dwT)or 0,
}
end
end

if#p==0 and#q==0 then return nil end
return{dwells=p,skills=q}
end


local function initStorage()
if m then return end
m=true

if k then
ensureFolder()
local o=getMacroDir()


if isfolder"DQMacro"and listfiles then
pcall(function()
local p=listfiles"DQMacro"
if type(p)=="table"then
for q,r in ipairs(p)do
if type(r)=="string"and string.lower(string.sub(r,-5))==".json"and isfile(r)then
local s=string.match(r,"([^/\\]+)$")or"unknown.json"
local t=o.."/"..s
local u=readfile(r)
writefile(t,u)
delfile(r)
end
end
end
end)
end


if listfiles and isfolder(o)then
local p,q=pcall(function()
return listfiles(o)
end)
if p and type(q)=="table"then
for r,s in ipairs(q)do
if type(s)=="string"and string.lower(string.sub(s,-5))==".json"then
pcall(function()
if isfile(s)then
local t=readfile(s)
local u=d:JSONDecode(t)
if type(u)=="table"and type(u.map)=="string"and type(u.rooms)=="table"then
l[u.map]=u
end
end
end)
end
end
end
end


local p=b.contextData
if type(p)=="table"and type(p[g])=="table"then
local q=p[g]
local r=false
for s,t in pairs(q)do
if type(s)=="string"and type(t)=="table"then
if not l[s]then
l[s]=t
end
pcall(function()
writefile(getFilePathForMap(s),d:JSONEncode(t))
end)
r=true
end
end
if r then
p[g]=nil
c.Save()
end
end
else

local o=b.contextData
if type(o)=="table"and type(o[g])=="table"then
for p,q in pairs(o[g])do
if type(p)=="string"and type(q)=="table"then
l[p]=q
end
end
end
end
end




local o=0.1
local p=0.82
local q=0.3

local function flatDistance(r,s)
local t=r.X-s.X
local u=r.Z-s.Z
return math.sqrt(t*t+u*u)
end

function e.SimplifyPath(r,s)
local t=#r
if t<=2 then return r end

local u={}
for v=1,t do u[v]=false end
u[1]=true
u[t]=true


local v={1}
for w=2,t-1 do
local x=r[w-1]
local y=r[w]
local z=r[w+1]

local A=y.X-x.X
local B=y.Z-x.Z
local C=math.sqrt(A*A+B*B)

local D=z.X-y.X
local E=z.Z-y.Z
local F=math.sqrt(D*D+E*E)

if C>=q and F>=q then
local G=(A*D+B*E)/(C*F)
if G<p then
u[w]=true
table.insert(v,w)
end
end
end
table.insert(v,t)

local w=s*s
local x={}
for y=1,#v-1 do
local z,A=v[y],v[y+1]
if A-z>1 then
table.insert(x,{z,A})
end
end

while#x>0 do
local y=table.remove(x)
local z,A=y[1],y[2]
local B,C=r[z].X,r[z].Z
local D,E=r[A].X,r[A].Z
local F=D-B
local G=E-C
local H=F*F+G*G

local I=-1
local J=0
for K=z+1,A-1 do
local L=0
if H>0 then
L=((r[K].X-B)*F+(r[K].Z-C)*G)/H
L=math.clamp(L,0,1)
end
local M=r[K].X-(B+F*L)
local N=r[K].Z-(C+G*L)
local O=M*M+N*N
if O>I then
I=O
J=K
end
end
if J>0 and I>w then
u[J]=true
table.insert(x,{z,J})
table.insert(x,{J,A})
end
end

local y={}
for z=1,t do
if u[z]and(#y==0 or flatDistance(y[#y],r[z])>=o or z==t)then
table.insert(y,r[z])
end
end
if#y==1 then table.insert(y,r[t])end
return y
end

function e.OnChanged(r)
if type(r)~="function"then return function()end end
table.insert(n,r)
return function()
for s,t in ipairs(n)do
if t==r then table.remove(n,s)break end
end
end
end


function e.HasMap(r)
if type(r)~="string"or#r==0 then return false end
initStorage()
local s=l[r]
if not s or type(s.rooms)~="table"then return false end
for t,u in pairs(s.rooms)do
if isRoomSeg(u)and#u.points>0 then return true end
end
return false
end


local function decodePhaseSeg(r)
if not r or type(r)~="table"or type(r.points)~="table"then return nil end
local s={}
for t,u in ipairs(r.points)do
local v=decodeVec(u)
if v then s[#s+1]=v end
end
if#s==0 then return nil end
return{
startPos=decodeVec(r.startPos)or s[1],
points=s,
events=r.events and decodeEvents(r.events)or nil,
speed=tonumber(r.speed)or 0,
}
end


function e.GetRoomSegment(r,s)
if type(r)~="string"or type(s)~="number"then return nil end
initStorage()
local t=l[r]
if not t or type(t.rooms)~="table"then return nil end

local u=t.rooms[tostring(s)]
if not isRoomSeg(u)then return nil end

local v={}
for w,x in ipairs(u.points)do
local y=decodeVec(x)
if y then v[#v+1]=y end
end
if#v==0 then return nil end

local w={
startPos=decodeVec(u.startPos)or v[1],
points=v,
events=u.events and decodeEvents(u.events)or nil,
speed=tonumber(u.speed)or 0,
boss=u.boss==true,
}


local x={}
if type(u.phases)=="table"and#u.phases>0 then
for y,z in ipairs(u.phases)do
local A=decodePhaseSeg(z)
if A then
A.boss=u.boss==true
x[#x+1]=A
end
end
end


if#x==0 then
x[1]=w
end
w.phases=x

return w
end


function e.HasSegmentOrMacro(r,s)
return e.GetRoomSegment(r,s)~=nil
end


function e.GetMap(r)
if not e.HasMap(r)then return nil end
initStorage()
local s=l[r]
if not s then return nil end

local t={}
for u,v in pairs(s.rooms or{})do
local w=tonumber(u)
if w and isRoomSeg(v)then
local x=e.GetRoomSegment(r,w)
if x then
t[w]=x
end
end
end

return{
map=r,
version=s.version,
rooms=t,
created=s.created,
updated=s.updated,
mode=normalizeMode(s.mode),
}
end


function e.GetMaps()
initStorage()
local r={}
for s,t in pairs(l)do
if type(s)=="string"and type(t)=="table"and t.map==s and type(t.rooms)=="table"then
local u=0
local v=0
local w=0
local x=0
for y,z in pairs(t.rooms)do
if tonumber(y)~=nil and isRoomSeg(z)then
u+=1
if z.boss==true then v+=1 end
w+=#z.points
if type(z.phases)=="table"and#z.phases>0 then
x+=#z.phases
for A,B in ipairs(z.phases)do
if B~=z and type(B.points)=="table"then
w+=#B.points
end
end
else
x+=1
end
end
end
if u>0 then
table.insert(r,{
map=s,
roomCount=u,
bossCount=v,
pointCount=w,
phaseCount=x,
updated=t.updated,
mode=normalizeMode(t.mode),
})
end
end
end
table.sort(r,function(s,t)
return s.map<t.map
end)
return r
end

function e.Count()
return#e.GetMaps()
end





function e.SaveSegment(r,s,t,u,v,w,x,y)
if type(r)~="string"or#r==0 then return false end
if type(s)~="number"or s<=0 then return false end
if not t or not u or#u==0 then return false end

initStorage()

local z=l[r]
if not z or type(z)~="table"then
z={
map=r,
version=h,
created=os.time(),
updated=os.time(),
mode=i,
rooms={},
}
l[r]=z
end
if type(z.rooms)~="table"then z.rooms={}end

local A={}
for B,C in ipairs(u)do
A[#A+1]=encodeVec(C)
end
local B={
startPos=encodeVec(t)or A[1],
points=A,
}
if x then
B.boss=true
end
if type(w)=="number"and w>0 then
B.speed=w
end

local function encodeEventsTable(C)
if not C or type(C)~="table"then return nil end
local D=#(C.dwells or{})
local E=#(C.skills or{})
if D==0 and E==0 then return nil end
local F={dwells={},skills={}}
for G,H in ipairs(C.dwells or{})do
F.dwells[#F.dwells+1]={
pos=encodeVec(H.pos),
dur=H.dur or 0,
facing=H.facing,
}
end
for G,H in ipairs(C.skills or{})do
F.skills[#F.skills+1]={
pos=encodeVec(H.pos),
facing=H.facing,
key=H.key,
dw=H.dw or 0,
dwT=H.dwT or 0,
}
end
return F
end

if v and type(v)=="table"then
local C=encodeEventsTable(v)
if C then B.events=C end
end


if type(y)=="table"and#y>0 then
local C={}
for D,E in ipairs(y)do
if E and E.points and#E.points>0 then
local F={}
for G,H in ipairs(E.points)do
F[#F+1]=encodeVec(H)
end
local G={
startPos=encodeVec(E.startPos)or F[1],
points=F,
speed=type(E.speed)=="number"and E.speed>0 and E.speed or nil,
events=encodeEventsTable(E.events),
}
C[#C+1]=G
end
end
if#C>0 then
B.phases=C
end
end

z.rooms[tostring(s)]=B
z.version=h
z.map=r
z.updated=os.time()


if k then
ensureFolder()
pcall(function()
writefile(getFilePathForMap(r),d:JSONEncode(z))
end)
else
local C=b.contextData
if type(C)=="table"then
if not C[g]then C[g]={}end
C[g][r]=z
c.Save()
end
end

fireChanged()
return true
end


function e.GetMapMode(r)
if type(r)~="string"or#r==0 then return i end
initStorage()
local s=l[r]
if type(s)~="table"then return i end
return normalizeMode(s.mode)
end



function e.SetMapMode(r,s)
if type(r)~="string"or#r==0 then return false end
local t=normalizeMode(s)

initStorage()

local u=l[r]
if not u or type(u)~="table"then
u={
map=r,
version=h,
created=os.time(),
updated=os.time(),
mode=i,
rooms={},
}
l[r]=u
end
u.mode=t
u.map=r
u.updated=os.time()

if k then
ensureFolder()
pcall(function()
writefile(getFilePathForMap(r),d:JSONEncode(u))
end)
else
local v=b.contextData
if type(v)=="table"then
if not v[g]then v[g]={}end
v[g][r]=u
c.Save()
end
end

fireChanged()
return true
end


function e.RemoveMap(r)
initStorage()
if not l[r]then return false end

l[r]=nil

if k then
local s=getFilePathForMap(r)
pcall(function()
if isfile(s)then
delfile(s)
end
end)
else
local s=b.contextData
if type(s)=="table"and s[g]then
s[g][r]=nil
c.Save()
end
end

fireChanged()
return true
end


function e.ClearAll()
initStorage()
if next(l)==nil then return end

local r=getMacroDir()
if k and isfolder(r)and listfiles then
pcall(function()
local s=listfiles(r)
if type(s)=="table"then
for t,u in ipairs(s)do
if type(u)=="string"and string.lower(string.sub(u,-5))==".json"and isfile(u)then
delfile(u)
end
end
end
end)
end

table.clear(l)

local s=b.contextData
if type(s)=="table"and s[g]then
s[g]=nil
c.Save()
end

fireChanged()
end


function e.ReloadFromDisk()
table.clear(l)
m=false
initStorage()
fireChanged()
end


function e.ReloadFromConfig()
e.ReloadFromDisk()
end

return e