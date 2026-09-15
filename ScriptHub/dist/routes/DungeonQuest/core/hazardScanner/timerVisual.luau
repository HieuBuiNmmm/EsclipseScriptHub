local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b,c,d,e=game:GetService
'Players',game:GetService'UserInputService',game:GetService'RunService',game:
GetService'VirtualInputManager'local f=b.LocalPlayer if not f then local g=os.
clock()+5 repeat f=b.LocalPlayer if f then break end task.wait(0.1)until os.
clock()>g end return{Players=b,UserInputService=c,RunService=d,
VirtualInputManager=e,player=f}end function a.b()local b={cleaned=false,
callbacks={}}function b.Register(c)if type(c)~='function'then return function()
end end if b.cleaned then pcall(c)return function()end end table.insert(b.
callbacks,c)return function()for d,e in ipairs(b.callbacks)do if e==c then table
.remove(b.callbacks,d)break end end end end function b.Cleanup()if b.cleaned
then return end b.cleaned=true for c=#b.callbacks,1,-1 do pcall(b.callbacks[c])
end table.clear(b.callbacks)end function b.IsActive()return not b.cleaned end
return b end function a.c()local b,c,d,e,f,g,h={},0.85,0,2,{},64 function b.
BindDetection(i)h=i or nil end function b.GetHazardPadding()return d end b.
GetHitboxPadding=b.GetHazardPadding function b.GetTrajectoryMargin()return e end
function b.SetTrajectoryMargin(i)if type(i)=='number'and i>=0 and i~=e then e=i
b.InvalidateCache()for j,k in ipairs(f)do pcall(k,e)end end end function b.
InvalidateCache()if h and h.GetActiveHazardsMap then for i,j in pairs(h.
GetActiveHazardsMap())do j.HazardZones=nil end end end function b.
OnPaddingChanged(i)if type(i)=='function'then table.insert(f,i)end end function
b.SetHazardPadding(i)if type(i)=='number'and i>=0 and i~=d then d=i b.
InvalidateCache()for j,k in ipairs(f)do pcall(k,d)end end end b.SetHitboxPadding
=b.SetHazardPadding local i={'firstBossCrissCross','firstBossBigSpike',
'firstBossSeekingSpikes'}local j=function(j)if not j or type(j)~='string'then
return false end local k=j:lower():gsub('%s+','')if#k==0 then return false end
for l,m in ipairs(i)do local n=m:lower():gsub('%s+','')if#n>0 and string.find(k,
n,1,true)then return true end end return false end function b.IsForceCircle(k)
return j(k)end function b.AddForceCircleName(k)if type(k)=='string'and#k>0 then
table.insert(i,k)b.InvalidateCache()end end function b.GetForceCircleNames()
return i end local k,l,m=function(k)return k and k.Parent and k.Transparency<=c
end,function(k,l,m)local n,o=k.Size,m and e or d if l or(k:IsA'Part'and(k.Shape
==Enum.PartType.Ball or k.Shape==Enum.PartType.Cylinder))then return{radius=math
.max(n.X,n.Y,n.Z)/2}end local p=Vector3.new(math.max(n.X,0)/2+o,0,math.max(n.Z,0
)/2+o)return{half=p,cframe=k.CFrame}end,function(k,l,m,n)if not l then return
false end local o,p=k.X,k.Z m=m or 0 local q=(n or l.isTrajectory)and e or d if
l.radius then local r=(l.part and l.part.Parent)and l.part.Position local s,t=r
and r.X or l.cx or 0,r and r.Z or l.cz or 0 local u,v,w=o-s,p-t,l.radius+q+m
return(u*u+v*v)<=(w*w)end local r=(l.part and l.part.Parent)and l.part.CFrame or
l.cframe if r then local s,t,u=r:PointToObjectSpace(k),l.half.X,l.half.Z if m<=0
then return math.abs(s.X)<=t and math.abs(s.Z)<=u else local v,w=math.max(0,math
.abs(s.X)-t),math.max(0,math.abs(s.Z)-u)return(v*v+w*w)<=(m*m)end end return
false end local n=function(n)if not n or not n.Instance or not n.Instance.Parent
then return nil end local o=n.Instance local p=n.Name or(o and o.Name)or''local
q,r=j(p),n.IsTrajectory==true local s,t=r and e or d if o:IsA'BasePart'then if
not k(o)then return nil end t={o}else t={}for u,v in ipairs(o:GetDescendants())
do if#t>=g then break end if v:IsA'BasePart'and k(v)and v.Parent then t[#t+1]=v
end end if#t==0 then return nil end end local u,v,w,x,y={},math.huge,-math.huge,
math.huge,-math.huge for z,A in ipairs(t)do local B,C=A.Position,A.Size local D=
math.max(C.X,C.Y,C.Z)/2+s v=math.min(v,B.X-D)w=math.max(w,B.X+D)x=math.min(x,B.Z
-D)y=math.max(y,B.Z+D)local E=l(A,q,r)if E then if E.radius then E.cx,E.cz=B.X,B
.Z end E.part=A E.isTrajectory=r u[#u+1]=E end end if#u==0 then return nil end
local z,A,B,C=(v+w)/2,(x+y)/2,(w-v)/2,(y-x)/2 return{zones=u,center=Vector3.new(
z,0,A),boundingRadius=math.sqrt(B*B+C*C)}end local o=function(o)local p=o and o.
HazardZones if not p then p=n(o)if p and o then o.HazardZones=p end end return p
end function b.GetHazardZones(p)return o(p)end function b.GetNearbyHazards(p,q)
local r=h if not r then return{}end q=q or 65 local s,t,u={},p.X,p.Z for v,w in
pairs(r.GetActiveHazardsMap())do local x,y=w.Instance,o(w)if y then local z,A=y.
center.X,y.center.Z if x and x.Parent then local B=x:IsA'BasePart'and x or x.
PrimaryPart or x:FindFirstChildWhichIsA'BasePart'if B then z=B.Position.X A=B.
Position.Z end end local B,C=t-z,u-A local D,E=B*B+C*C,q+y.boundingRadius if D<=
E*E then table.insert(s,w)end end end return s end function b.IsPointInAnyHazard
(p,q,r,s,t)local u=h if not u then return false,nil,nil end r=r or 0 local v,w,x
,y=math.huge,s or u.GetActiveHazardsMap()for z,A in pairs(w)do if t and A.
IsTrajectory==true then continue end local B=A.Instance or(typeof(z)=='Instance'
and z)if q and(q==B or(B and q.Name==B.Name))then continue end local C=o(A)if
not C then continue end local D,E=C.center.X,C.center.Z if B and B.Parent then
local F=B:IsA'BasePart'and B or B.PrimaryPart or B:FindFirstChildWhichIsA
'BasePart'if F then D=F.Position.X E=F.Position.Z end end local F,G=p.X-D,p.Z-E
local H,I=F*F+G*G,C.boundingRadius+r if H>I*I then continue end local J=A.
IsTrajectory==true for K=1,#C.zones do local L=C.zones[K]if k(L.part)and m(p,L,r
,J or L.isTrajectory)then local M=(p-L.part.Position).Magnitude if M<v then v=M
x=A y=L.part end break end end end return y~=nil,x,y end function b.
IsPointInAnyRedHazard(p,q,r,s)return b.IsPointInAnyHazard(p,q,r,s,true)end
function b.GetHazardsAtPoint(p,q,r,s)local t=h if not t then return{}end q=q or
0 local u,v={},r or t.GetActiveHazardsMap()for w,x in pairs(v)do if s and x.
IsTrajectory==true then continue end local y,z=x.Instance or(typeof(w)==
'Instance'and w),o(x)if not z then continue end local A,B=z.center.X,z.center.Z
if y and y.Parent then local C=y:IsA'BasePart'and y or y.PrimaryPart or y:
FindFirstChildWhichIsA'BasePart'if C then A=C.Position.X B=C.Position.Z end end
local C,D=p.X-A,p.Z-B local E,F=C*C+D*D,z.boundingRadius+q if E>F*F then
continue end local G=x.IsTrajectory==true for H=1,#z.zones do local I=z.zones[H]
if k(I.part)and m(p,I,q,G or I.isTrajectory)then u[x]=true break end end end
return u end function b.GetRedHazardsAtPoint(p,q,r)return b.GetHazardsAtPoint(p,
q,r,true)end return b end end local b,c,d=a.load'a',a.load'b',a.load'c'local e,f
,g,h,i,j,k,l,m,n=b.RunService or game:GetService'RunService',b.player,{},true,{}
,0.85,Color3.fromRGB(255,60,60),'255,130,130'function g.BindDetection(o)m=o or
nil end function g.IsEnabled()return h end local o=function()local o=f and f.
Character if not o then return nil end local p=o:FindFirstChild
'HumanoidRootPart'or o.PrimaryPart if not p then return nil end return p.
Position.Y-2.5 end local p,q=function(p)if not p or not p.Parent then return 2.5
end local q=o()if q then local r=q+2.5 local s,t=r-p.Position.Y,p.Size.Y/2+1.2
return math.clamp(math.max(s,t),1.5,30)end return math.clamp(p.Size.Y/2+1.8,2,10
)end,function(p)return p and p.Parent and p.Transparency<=j end local r,s=
function(r)if not r or not r.Parent then return nil end if r:IsA'BasePart'then
if q(r)then return r end elseif r:IsA'Model'then if r.PrimaryPart and q(r.
PrimaryPart)then return r.PrimaryPart end local s=r:FindFirstChild
'HumanoidRootPart'if s and q(s)then return s end for t,u in ipairs(r:
GetDescendants())do if u:IsA'BasePart'and q(u)then return u end end else for s,t
in ipairs(r:GetDescendants())do if t:IsA'BasePart'and q(t)then return t end end
end return nil end,function(r,s)if not r or not r.items or not s then return end
local t=s.SpawnClock or os.clock()local u,v=math.max(0,os.clock()-t),s.Name or
'Red Zone'local w=(
[[<font color='rgb(%s)'>%s</font> <font color='rgb(255,255,255)'><b>%.1fs</b></font>]]
):format(l,v,u)for x,y in ipairs(r.items)do if y.label and y.label.Parent then y
.label.Text=w end end end local t=function()if not h then return end local t=
false for u,v in pairs(i)do local w=u.Instance if u.IsTrajectory==true or not w
or not w.Parent then g.DetachTimerVisual(u)else if v.items then for x=#v.items,1
,-1 do local y=v.items[x]local z=y.part if not q(z)then if y.billboard and y.
billboard.Parent then pcall(function()y.billboard:Destroy()end)end table.remove(
v.items,x)else if y.billboard and y.billboard.Parent then y.billboard.
StudsOffset=Vector3.new(0,p(z),0)end end end if#v.items==0 then g.
DetachTimerVisual(u)else t=true s(v,u)end else g.DetachTimerVisual(u)end end end
if not t and n then n:Disconnect()n=nil end end local u,v=function()if not n and
h then n=e.Heartbeat:Connect(t)end end,function(u)local v,w=p(u),Instance.new
'BillboardGui'w.Name='HazardLifespanTimer'w.Adornee=u w.AlwaysOnTop=true w.
MaxDistance=500 w.LightInfluence=0 w.ResetOnSpawn=false w.Active=false w.Size=
UDim2.new(0,130,0,24)w.StudsOffset=Vector3.new(0,v,0)w.ZIndexBehavior=Enum.
ZIndexBehavior.Sibling local x=Instance.new'Frame'x.Name='TimerFrame'x.Size=
UDim2.new(1,0,1,0)x.BackgroundColor3=Color3.fromRGB(15,15,20)x.
BackgroundTransparency=0.25 x.BorderSizePixel=0 x.Parent=w local y=Instance.new
'UICorner'y.CornerRadius=UDim.new(0,6)y.Parent=x local z=Instance.new'UIStroke'z
.Name='Stroke'z.Thickness=1.3 z.Color=k z.Transparency=0.15 z.Parent=x local A=
Instance.new'TextLabel'A.Name='TimerLabel'A.Size=UDim2.new(1,-6,1,0)A.Position=
UDim2.new(0,3,0,0)A.BackgroundTransparency=1 A.Font=Enum.Font.GothamBold A.
TextSize=11 A.TextColor3=Color3.fromRGB(255,255,255)A.TextStrokeTransparency=0 A
.TextStrokeColor3=Color3.fromRGB(0,0,0)A.RichText=true A.TextXAlignment=Enum.
TextXAlignment.Center A.TextYAlignment=Enum.TextYAlignment.Center A.Text=''A.
Parent=x w.Parent=u return w,A,z end function g.AttachTimerVisual(w)if not h or
not w then return end if w.IsTrajectory==true then if i[w]then g.
DetachTimerVisual(w)end return end if i[w]then g.DetachTimerVisual(w)end local x
=w.Instance if not x or not x.Parent then return end local y=d.GetHazardZones(w)
local z,A,B=y and y.zones,{},{}local C=function(C,D,E,F,G)local H={billboard=D,
label=E,stroke=F,part=C,zone=G}table.insert(A,H)local I=C:
GetPropertyChangedSignal'Transparency':Connect(function()if not q(C)then pcall(
function()D:Destroy()end)end end)table.insert(B,I)local J=C.AncestryChanged:
Connect(function(J,K)if not K then pcall(function()D:Destroy()end)end end)table.
insert(B,J)end if z and#z>0 then for D,E in ipairs(z)do local F=E.part if q(F)
then local G,H,I=v(F)C(F,G,H,I,E)end end else local D=r(x)if q(D)then local E,F,
G=v(D)C(D,E,F,G,nil)end end if#A>0 then local D={items=A,connections=B}i[w]=D s(
D,w)u()end end function g.DetachTimerVisual(w)if not w then return end local x=i
[w]if not x then return end if x.connections then for y,z in ipairs(x.
connections)do pcall(function()z:Disconnect()end)end table.clear(x.connections)
end if x.items then for y,z in ipairs(x.items)do if z.billboard and z.billboard.
Parent then pcall(function()z.billboard:Destroy()end)end end table.clear(x.items
)end i[w]=nil end function g.UpdateHazardVisualColor(w,x)if not w then return
end local y=x==true or w.IsTrajectory==true if y then g.DetachTimerVisual(w)else
if not i[w]then g.AttachTimerVisual(w)end end end function g.ClearAll()if n then
n:Disconnect()n=nil end for w in pairs(i)do g.DetachTimerVisual(w)end table.
clear(i)end function g.RefreshAll()g.ClearAll()if not h or not m then return end
for w,x in pairs(m.GetActiveHazardsMap())do if x and x.IsTrajectory~=true then g
.AttachTimerVisual(x)end end end function g.SetEnabled(w)h=w and true or false
if h then g.RefreshAll()else g.ClearAll()end end c.Register(function()g.
ClearAll()end)return g