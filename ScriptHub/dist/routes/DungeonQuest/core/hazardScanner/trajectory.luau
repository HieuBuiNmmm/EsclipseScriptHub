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
'firstBossSeekingSpikes','secondBossCircleHitbox','secondBossCircleHit'}local j=
function(j)if not j or type(j)~='string'then return false end local k=j:lower():
gsub('%s+','')if#k==0 then return false end for l,m in ipairs(i)do local n=m:
lower():gsub('%s+','')if#n>0 and string.find(k,n,1,true)then return true end end
return false end function b.IsForceCircle(k)return j(k)end function b.
AddForceCircleName(k)if type(k)=='string'and#k>0 then table.insert(i,k)b.
InvalidateCache()end end function b.GetForceCircleNames()return i end local k,l,
m=function(k)return k and k.Parent and k.Transparency<=c end,function(k,l,m)
local n,o=k.Size,m and e or d if l or(k:IsA'Part'and(k.Shape==Enum.PartType.Ball
or k.Shape==Enum.PartType.Cylinder))then return{radius=math.max(n.X,n.Y,n.Z)/2}
end local p=Vector3.new(math.max(n.X,0)/2+o,0,math.max(n.Z,0)/2+o)return{half=p,
cframe=k.CFrame}end,function(k,l,m,n)if not l then return false end local o,p=k.
X,k.Z m=m or 0 local q=(n or l.isTrajectory)and e or d if l.radius then local r=
(l.part and l.part.Parent)and l.part.Position local s,t=r and r.X or l.cx or 0,r
and r.Z or l.cz or 0 local u,v,w=o-s,p-t,l.radius+q+m return(u*u+v*v)<=(w*w)end
local r=(l.part and l.part.Parent)and l.part.CFrame or l.cframe if r then local
s,t,u=r:PointToObjectSpace(k),l.half.X,l.half.Z if m<=0 then return math.abs(s.X
)<=t and math.abs(s.Z)<=u else local v,w=math.max(0,math.abs(s.X)-t),math.max(0,
math.abs(s.Z)-u)return(v*v+w*w)<=(m*m)end end return false end local n=function(
n)if not n or not n.Instance or not n.Instance.Parent then return nil end local
o=n.Instance local p=n.Name or(o and o.Name)or''local q,r=j(p),n.IsTrajectory==
true local s,t=r and e or d if o:IsA'BasePart'then if not k(o)then return nil
end t={o}else t={}for u,v in ipairs(o:GetDescendants())do if#t>=g then break end
if v:IsA'BasePart'and k(v)and v.Parent then t[#t+1]=v end end if#t==0 then
return nil end end local u,v,w,x,y={},math.huge,-math.huge,math.huge,-math.huge
for z,A in ipairs(t)do local B,C=A.Position,A.Size local D=math.max(C.X,C.Y,C.Z)
/2+s v=math.min(v,B.X-D)w=math.max(w,B.X+D)x=math.min(x,B.Z-D)y=math.max(y,B.Z+D
)local E=l(A,q,r)if E then if E.radius then E.cx,E.cz=B.X,B.Z end E.part=A E.
isTrajectory=r u[#u+1]=E end end if#u==0 then return nil end local z,A,B,C=(v+w)
/2,(x+y)/2,(w-v)/2,(y-x)/2 return{zones=u,center=Vector3.new(z,0,A),
boundingRadius=math.sqrt(B*B+C*C)}end local o=function(o)local p=o and o.
HazardZones if not p then p=n(o)if p and o then o.HazardZones=p end end return p
end function b.GetHazardZones(p)return o(p)end function b.GetNearbyHazards(p,q)
local r=h if not r then return{}end q=q or 65 local s,t,u={},p.X,p.Z for v,w in
pairs(r.GetActiveHazardsMap())do local x,y=w.Instance,o(w)if y then local z,A=y.
center.X,y.center.Z if x and x.Parent then local B=x:IsA'BasePart'and x or x.
PrimaryPart or x:FindFirstChildWhichIsA'BasePart'if B then z=B.Position.X A=B.
Position.Z end end local B,C=t-z,u-A local D,E=B*B+C*C,q+y.boundingRadius if D<=
E*E then table.insert(s,w)end end end return s end function b.IsPointInAnyHazard
(p,q,r,s)local t=h if not t then return false,nil,nil end r=r or 0 local u,v,w,x
=math.huge,s or t.GetActiveHazardsMap()for y,z in pairs(v)do local A=z.Instance
or(typeof(y)=='Instance'and y)if q and(q==A or(A and q.Name==A.Name))then
continue end local B=o(z)if not B then continue end local C,D=B.center.X,B.
center.Z if A and A.Parent then local E=A:IsA'BasePart'and A or A.PrimaryPart or
A:FindFirstChildWhichIsA'BasePart'if E then C=E.Position.X D=E.Position.Z end
end local E,F=p.X-C,p.Z-D local G,H=E*E+F*F,B.boundingRadius+r if G>H*H then
continue end local I=z.IsTrajectory==true for J=1,#B.zones do local K=B.zones[J]
if k(K.part)and m(p,K,r,I or K.isTrajectory)then local L=(p-K.part.Position).
Magnitude if L<u then u=L w=z x=K.part end break end end end return x~=nil,w,x
end return b end function a.d()local b,c,d=a.load'a',a.load'b',a.load'c'local e,
f,g,h,i,j,k,l,m,n,o,p=b.RunService or game:GetService'RunService',b.player,{},
false,{},0.85,Color3.fromRGB(255,45,45),Color3.fromRGB(0,160,255),0.55,0.25
local q=function()local q=f and f.Character if not q then return nil end local r
=q:FindFirstChild'HumanoidRootPart'or q.PrimaryPart if not r then return nil end
return r.Position.Y-2.5 end function g.BindDetection(r)o=r or nil end function g
.IsEnabled()return h end local r=function(r,s)local t,u=r.part,r.ad if not t or
not t.Parent or not u or not u.Parent then return end local v=t.Position local w
=Vector3.new(v.X,s or v.Y,v.Z)if r.isCircle then local x=CFrame.new(w)*CFrame.
Angles(math.rad(90),0,0)u.CFrame=t.CFrame:ToObjectSpace(x)else local x,y,z=t.
CFrame:ToOrientation()local A=CFrame.new(w)*CFrame.Angles(0,y,0)u.CFrame=t.
CFrame:ToObjectSpace(A)end end local s=function()if not h then return end local
s,t=false,q()for u,v in pairs(i)do if not u.Instance or not u.Instance.Parent
then g.DetachZoneVisuals(u)else s=true if v.items then for w,y in ipairs(v.items
)do r(y,t)end end end end if not s and p then p:Disconnect()p=nil end end local
t=function()if not p and h then p=e.Heartbeat:Connect(s)end end function g.
DetachZoneVisuals(u)if not u then return end local v=i[u]if not v then return
end if v.adornments then for w,y in ipairs(v.adornments)do pcall(function()y:
Destroy()end)end table.clear(v.adornments)end if v.connections then for w,y in
ipairs(v.connections)do pcall(function()y:Disconnect()end)end table.clear(v.
connections)end if v.items then table.clear(v.items)end i[u]=nil end function g.
UpdateHazardVisualColor(u,v)if not u then return end local w=i[u]if not w or not
w.items then return end local y=v==true or u.IsTrajectory==true local z,A=y and
l or k,y and d.GetTrajectoryMargin()or 0 for B,C in ipairs(w.items)do local D,E,
F=C.ad,C.zone,C.part if D and D.Parent and E and F and F.Parent then D.Color3=z
if C.isCircle and E.radius then D.Radius=E.radius+A elseif E.half then local G,H
=math.max(F.Size.X,0)/2+A,math.max(F.Size.Z,0)/2+A D.Size=Vector3.new(G*2,n,H*2)
end end end end function g.AttachZoneVisuals(u)if not h or not u then return end
if i[u]then g.DetachZoneVisuals(u)end local v=d.GetHazardZones(u)if not v or not
v.zones then return end local w=u.IsTrajectory==true local y,z,A,B,C,D=w and l
or k,w and d.GetTrajectoryMargin()or 0,q(),{},{},{}for E,F in ipairs(v.zones)do
local G=F.part if G and G.Parent and G.Transparency<=j then local H,I=false if F
.radius then H=true local J=Instance.new'CylinderHandleAdornment'J.Name=
'HazardGroundCircle'J.Adornee=G J.Radius=F.radius+z J.Height=n J.Color3=y J.
Transparency=m J.ZIndex=2 J.AlwaysOnTop=true J.Parent=G I=J elseif F.half and F.
cframe then local J=Instance.new'BoxHandleAdornment'J.Name='HazardGroundBox'J.
Adornee=G J.Size=Vector3.new(F.half.X*2,n,F.half.Z*2)J.Color3=y J.Transparency=m
J.ZIndex=2 J.AlwaysOnTop=true J.Parent=G I=J end if I then local J={ad=I,part=G,
isCircle=H,zone=F}r(J,A)table.insert(B,J)table.insert(C,I)local K=G:
GetPropertyChangedSignal'Transparency':Connect(function()if G.Parent and G.
Transparency>j then pcall(function()I:Destroy()end)end end)table.insert(D,K)end
end end if#C>0 then i[u]={items=B,adornments=C,connections=D}t()end end function
g.ClearAll()if p then p:Disconnect()p=nil end for u in pairs(i)do g.
DetachZoneVisuals(u)end table.clear(i)end function g.RefreshAll()g.ClearAll()if
not h or not o then return end for u,v in pairs(o.GetActiveHazardsMap())do g.
AttachZoneVisuals(v)end end function g.SetEnabled(u)h=u and true or false if h
then g.RefreshAll()else g.ClearAll()end end d.OnPaddingChanged(function()if h
then g.RefreshAll()end end)c.Register(function()g.ClearAll()end)return g end
function a.e()local b,c,d=a.load'a',a.load'b',a.load'c'local e,f,g,h,i,j,k,l,m,n
,o,p,q,r,s,t=b.RunService or game:GetService'RunService',game:GetService
'ReplicatedStorage',b.player,{},true,{},0.85,Color3.fromRGB(255,60,60),Color3.
fromRGB(0,180,255),Color3.fromRGB(255,140,0),'enemyProjectiles',false,{},{
secondbosscirclehitbox=true,secondbosscirclehit=true}local u=function()if p then
return end p=true local u=f:FindFirstChild(o)if u then for v,w in ipairs(u:
GetChildren())do local y=(w.Name or''):lower():gsub('%s+','')if#y>0 then q[y]=
true end end u.ChildAdded:Connect(function(v)local w=(v.Name or''):lower():gsub(
'%s+','')if#w>0 then q[w]=true end end)end end function h.IsEnemyProjectile(v)u(
)if not v or type(v)~='string'then return false end local w=v:lower():gsub('%s+'
,'')if#w==0 then return false end if r[w]==true then return false end return q[w
]==true end function h.BindDetection(v)s=v or nil end function h.IsEnabled()
return i end local v=function()local v=g and g.Character if not v then return
nil end local w=v:FindFirstChild'HumanoidRootPart'or v.PrimaryPart if not w then
return nil end return w.Position.Y-2.5 end local w,y=function(w)if not w or not
w.Parent then return 2.5 end local y=v()if y then local z=y+2.5 local A,B=z-w.
Position.Y,w.Size.Y/2+1.2 return math.clamp(math.max(A,B),1.5,30)end return math
.clamp(w.Size.Y/2+1.8,2,10)end,function(w)return w and w.Parent and w.
Transparency<=k end local z,A=function(z)if not z or not z.Parent then return
nil end if z:IsA'BasePart'then if y(z)then return z end elseif z:IsA'Model'then
if z.PrimaryPart and y(z.PrimaryPart)then return z.PrimaryPart end local A=z:
FindFirstChild'HumanoidRootPart'if A and y(A)then return A end for B,C in
ipairs(z:GetDescendants())do if C:IsA'BasePart'and y(C)then return C end end
else for A,B in ipairs(z:GetDescendants())do if B:IsA'BasePart'and y(B)then
return B end end end return nil end,function(z)local A,B=z and z.IsTrajectory==
true,z and z.Name or'Hazard'local C,D=h.IsEnemyProjectile(B),not A if C then
local E,F=A and n or m,A and'255,160,50'or'0,210,255'return'P',E,F,D else local
E,F=A and n or l,A and'255,160,50'or'255,80,80'return'N',E,F,D end end local B=
function(B,C)if not B or not B.items or not C then return end local D,E,F,G=A(C)
local H,I=C.Name or'Hazard',''if G then local J=C.SpawnClock or os.clock()local
K=math.max(0,os.clock()-J)I=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(255,220,220)'>%s</font> <font color='rgb(255,255,255)'><b>%.1fs</b></font>]]
):format(F,D,H,K)else I=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(220,235,255)'>%s</font>]]
):format(F,D,H)end for J,K in ipairs(B.items)do if K.label and K.label.Parent
then K.label.Text=I end if K.stroke and K.stroke.Parent and K.stroke.Color~=E
then K.stroke.Color=E end end end local C=function()if not i then return end
local C=false for D,E in pairs(j)do local F=D.Instance if not F or not F.Parent
then h.DetachTimerVisual(D)else if E.items then for G=#E.items,1,-1 do local H=E
.items[G]local I=H.part if not y(I)then if H.billboard and H.billboard.Parent
then pcall(function()H.billboard:Destroy()end)end table.remove(E.items,G)else if
H.billboard and H.billboard.Parent then H.billboard.StudsOffset=Vector3.new(0,w(
I),0)end end end if#E.items==0 then h.DetachTimerVisual(D)else C=true B(E,D)end
else h.DetachTimerVisual(D)end end end if not C and t then t:Disconnect()t=nil
end end local D,E=function()if not t and i then t=e.Heartbeat:Connect(C)end end,
function(D,E)local F,G=w(D),Instance.new'BillboardGui'G.Name=
'HazardLifespanTimer'G.Adornee=D G.AlwaysOnTop=true G.MaxDistance=500 G.
LightInfluence=0 G.ResetOnSpawn=false G.Active=false G.Size=UDim2.new(0,150,0,24
)G.StudsOffset=Vector3.new(0,F,0)G.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
local H=Instance.new'Frame'H.Name='TimerFrame'H.Size=UDim2.new(1,0,1,0)H.
BackgroundColor3=Color3.fromRGB(15,15,20)H.BackgroundTransparency=0.25 H.
BorderSizePixel=0 H.Parent=G local I=Instance.new'UICorner'I.CornerRadius=UDim.
new(0,6)I.Parent=H local J=Instance.new'UIStroke'J.Name='Stroke'J.Thickness=1.3
J.Color=E or l J.Transparency=0.15 J.Parent=H local K=Instance.new'TextLabel'K.
Name='TimerLabel'K.Size=UDim2.new(1,-6,1,0)K.Position=UDim2.new(0,3,0,0)K.
BackgroundTransparency=1 K.Font=Enum.Font.GothamBold K.TextSize=11 K.TextColor3=
Color3.fromRGB(255,255,255)K.TextStrokeTransparency=0 K.TextStrokeColor3=Color3.
fromRGB(0,0,0)K.RichText=true K.TextXAlignment=Enum.TextXAlignment.Center K.
TextYAlignment=Enum.TextYAlignment.Center K.Text=''K.Parent=H G.Parent=D return
G,K,J end function h.AttachTimerVisual(F)if not i or not F then return end if j[
F]then h.DetachTimerVisual(F)end local G=F.Instance if not G or not G.Parent
then return end local H,I=A(F)local J=d.GetHazardZones(F)local K,L,M=J and J.
zones,{},{}local N=function(N,O,P,Q,R)local S={billboard=O,label=P,stroke=Q,part
=N,zone=R}table.insert(L,S)local T=N:GetPropertyChangedSignal'Transparency':
Connect(function()if not y(N)then pcall(function()O:Destroy()end)end end)table.
insert(M,T)local U=N.AncestryChanged:Connect(function(U,V)if not V then pcall(
function()O:Destroy()end)end end)table.insert(M,U)end if K and#K>0 then for O,P
in ipairs(K)do local Q=P.part if y(Q)then local R,S,T=E(Q,I)N(Q,R,S,T,P)end end
else local O=z(G)if y(O)then local P,Q,R=E(O,I)N(O,P,Q,R,nil)end end if#L>0 then
local O={items=L,connections=M}j[F]=O B(O,F)D()end end function h.
DetachTimerVisual(F)if not F then return end local G=j[F]if not G then return
end if G.connections then for H,I in ipairs(G.connections)do pcall(function()I:
Disconnect()end)end table.clear(G.connections)end if G.items then for H,I in
ipairs(G.items)do if I.billboard and I.billboard.Parent then pcall(function()I.
billboard:Destroy()end)end end table.clear(G.items)end j[F]=nil end function h.
UpdateHazardVisualColor(F,G)if not F then return end local H=j[F]if H then B(H,F
)else h.AttachTimerVisual(F)end end function h.ClearAll()if t then t:Disconnect(
)t=nil end for F in pairs(j)do h.DetachTimerVisual(F)end table.clear(j)end
function h.RefreshAll()h.ClearAll()if not i or not s then return end for F,G in
pairs(s.GetActiveHazardsMap())do if G then h.AttachTimerVisual(G)end end end
function h.SetEnabled(F)i=F and true or false if i then h.RefreshAll()else h.
ClearAll()end end c.Register(function()h.ClearAll()end)return h end end local b,
c,d=a.load'a',a.load'b',a.load'c'local e,f,g,h,i,j,k,l,m,n,o,p,q,r=b.RunService
or game:GetService'RunService',b.player,{},false,45,{},0.85,Color3.fromRGB(255,
140,0),0.65,0.2,3.5,{firstbossseekingspikes='target_player',firstbossbigspike=
'target_player'}local s=function()local s=f and f.Character if not s then return
nil end local t=s:FindFirstChild'HumanoidRootPart'or s.PrimaryPart if not t then
return nil end return t.Position end local t,u=function(t,u)if not t or not u
then return nil,nil end local v=t:lower():gsub('%s+','')local w=p[v]if not w
then for y,z in pairs(p)do if string.find(v,y,1,true)then w=z break end end end
if not w then return nil,nil end if w=='look_vector'then local y=u.CFrame.
LookVector local z=Vector3.new(y.X,0,y.Z)if z.Magnitude>0.01 then return z.Unit,
w end else local y=s()if y then local z=y-u.Position local A=Vector3.new(z.X,0,z
.Z)if A.Magnitude>0.1 then return A.Unit,w end end local z=u.CFrame.LookVector
local A=Vector3.new(z.X,0,z.Z)if A.Magnitude>0.01 then return A.Unit,w end end
return nil,nil end,function()local t=f and f.Character if not t then return nil
end local u=t:FindFirstChild'HumanoidRootPart'or t.PrimaryPart if not u then
return nil end return u.Position.Y-2.5 end function g.BindDetection(v)q=v or nil
end function g.IsEnabled()return h end function g.GetPredictionLength()return i
end function g.SetPredictionLength(v)if type(v)=='number'and v>0 then i=math.
clamp(v,10,200)g.RefreshAll()end end function g.IsHazardMoving(v)if not v then
return false end local w=j[v]return w and w.isMoving==true end local v,w=
function(v,w)local y=v.Instance if not y or not y.Parent then return nil,4 end
local z,A,B=d.GetTrajectoryMargin and d.GetTrajectoryMargin()or 2,{},v.Name or(y
and y.Name)or''local C=d.IsForceCircle and d.IsForceCircle(B)if y:IsA'BasePart'
then if y.Transparency<=k then table.insert(A,y)end else for D,E in ipairs(y:
GetDescendants())do if E:IsA'BasePart'and E.Parent and E.Transparency<=k then
table.insert(A,E)end end end if#A==0 then return nil,4 end local D,E,F,G=Vector3
.new(-w.Z,0,w.X),math.huge,-math.huge,0 for H,I in ipairs(A)do local J,K,L=I.
Position,I.Size,0 if C or(I:IsA'Part'and(I.Shape==Enum.PartType.Ball or I.Shape
==Enum.PartType.Cylinder))then L=math.max(K.X,K.Y,K.Z)/2 else local M=I.CFrame
local N,O,P,Q,R,S=M.RightVector,M.UpVector,M.LookVector,K.X/2,K.Y/2,K.Z/2 L=Q*
math.abs(N.X*D.X+N.Z*D.Z)+R*math.abs(O.X*D.X+O.Z*D.Z)+S*math.abs(P.X*D.X+P.Z*D.Z
)end local M=J.X*D.X+J.Z*D.Z E=math.min(E,M-L)F=math.max(F,M+L)local N=J.X*w.X+J
.Z*w.Z G+=N end local H,I,J=math.max(1,(F-E)+z*2),(E+F)/2,G/#A local K=w*J+D*I
return K,H end,function(v,w,y,z,A,B,C)if not w or not w.Parent or not v or not v
.Parent then return end local D=B/2 local E=Vector3.new(y.X+z.X*D,A or y.Y,y.Z+z
.Z*D)local F=E+Vector3.new(z.X,0,z.Z)local G=CFrame.lookAt(E,F)local H=w.CFrame:
ToObjectSpace(G)v.CFrame=H v.Size=Vector3.new(C,n,B)if not v.Visible then v.
Visible=true end end local y=function()if not h then return end local y,z,A=
false,os.clock(),u()for B,C in pairs(j)do local D=B.Instance if not D or not D.
Parent then g.DetachTrajectoryVisuals(B)else y=true local E=C.mainPart if E and
E.Parent then local F,G=E.Position,z-(C.lastClock or z)if G>=0.035 then local H=
F-(C.lastPos or F)local I,J=H.Magnitude/G,Vector3.new(H.X,0,H.Z)local K,L=J.
Magnitude/G,C.isMoving==true if K>=o then C.isMoving=true C.dir=J.Unit else if
not C.isInstant and G>=0.25 and I<o then C.isMoving=false end end if C.isMoving
~=L then B.IsTrajectory=C.isMoving B.HazardZones=nil if q and q.
UpdateHazardVisualColor then pcall(q.UpdateHazardVisualColor,B,C.isMoving)end
local M=a.load'd'if M and M.UpdateHazardVisualColor then pcall(M.
UpdateHazardVisualColor,B,C.isMoving)end end C.lastPos=F C.lastClock=z end if C.
isMoving and C.dir and C.ad then local H,I=v(B,C.dir)if H then w(C.ad,E,H,C.dir,
A,i,I)end else if C.ad and C.ad.Visible then C.ad.Visible=false end end end end
end if not y and r then r:Disconnect()r=nil end end local z=function()if not r
and h then r=e.Heartbeat:Connect(y)end end function g.DetachTrajectoryVisuals(A)
if not A then return end local B=j[A]if not B then return end if B.ad then
pcall(function()B.ad:Destroy()end)B.ad=nil end if B.connections then for C,D in
ipairs(B.connections)do pcall(function()D:Disconnect()end)end table.clear(B.
connections)end j[A]=nil end function g.AttachTrajectoryVisuals(A)if not h or
not A then return end if j[A]then g.DetachTrajectoryVisuals(A)end local B=A.
Instance if not B or not B.Parent then return end local C if B:IsA'BasePart'then
C=B else C=B.PrimaryPart or B:FindFirstChildWhichIsA'BasePart'if not C then for
D,E in ipairs(B:GetDescendants())do if E:IsA'BasePart'and E.Parent then C=E
break end end end end if not C or not C.Parent then return end local D=Instance.
new'BoxHandleAdornment'D.Name='HazardTrajectoryCorridor'D.Adornee=C D.Size=
Vector3.new(4,n,i)D.Color3=l D.Transparency=m D.ZIndex=1 D.AlwaysOnTop=true D.
Visible=false D.Parent=C local E,F={},C:GetPropertyChangedSignal'Transparency':
Connect(function()if C.Parent and C.Transparency>k then pcall(function()D:
Destroy()end)end end)table.insert(E,F)local G,H=t(A.Name or(B and B.Name),C)
local I=G~=nil j[A]={ad=D,connections=E,mainPart=C,lastPos=C.Position,lastClock=
os.clock(),velocity=Vector3.zero,dir=G,isMoving=I,isInstant=I,instantMode=H}if I
and G then A.IsTrajectory=true A.HazardZones=nil local J,K,L=u(),v(A,G)if K then
w(D,C,K,G,J,i,L)end if q and q.UpdateHazardVisualColor then pcall(q.
UpdateHazardVisualColor,A,true)end local M=a.load'd'if M and M.
UpdateHazardVisualColor then pcall(M.UpdateHazardVisualColor,A,true)end local N=
a.load'e'if N and N.UpdateHazardVisualColor then pcall(N.UpdateHazardVisualColor
,A,true)end end z()end function g.ClearAll()if r then r:Disconnect()r=nil end
for A in pairs(j)do g.DetachTrajectoryVisuals(A)end table.clear(j)end function g
.RefreshAll()g.ClearAll()if not h or not q then return end for A,B in pairs(q.
GetActiveHazardsMap())do g.AttachTrajectoryVisuals(B)end end function g.
GetNearbyTrajectories(A,B)B=B or 65 local C,D,E={},A.X,A.Z for F,G in pairs(j)do
if G.isMoving and G.dir and G.mainPart and G.mainPart.Parent then local H,I=v(F,
G.dir)if H and I then local J,K=H.X,H.Z local L,M=D-J,E-K local N,O=L*L+M*M,B+i+
(I/2)if N<=O*O then table.insert(C,{info=F,record=G})end end end end return C
end function g.IsPointInAnyTrajectory(A,B,C)local D,E=A.X,A.Z B=B or 0 if C then
for F,G in ipairs(C)do local H,I=G.info,G.record if I and I.isMoving and I.dir
and I.mainPart and I.mainPart.Parent then local J,K=v(H,I.dir)if J and K then
local L=I.dir local M,N,O=Vector3.new(-L.Z,0,L.X),D-J.X,E-J.Z local P,Q,R=N*L.X+
O*L.Z,N*M.X+O*M.Z,K/2 if B<=0 then if P>=0 and P<=i and math.abs(Q)<=R then
return true,H,L,J,K end else local S=0 if P<0 then S=-P elseif P>i then S=P-i
end local T=math.max(0,math.abs(Q)-R)if(S*S+T*T)<=(B*B)then return true,H,L,J,K
end end end end end return false,nil,nil,nil,nil end for F,G in pairs(j)do if G.
isMoving and G.dir and G.mainPart and G.mainPart.Parent then local H,I=v(F,G.dir
)if H and I then local J=G.dir local K,L,M=Vector3.new(-J.Z,0,J.X),D-H.X,E-H.Z
local N,O,P=L*J.X+M*J.Z,L*K.X+M*K.Z,I/2 if B<=0 then if N>=0 and N<=i and math.
abs(O)<=P then return true,F,J,H,I end else local Q=0 if N<0 then Q=-N elseif N>
i then Q=N-i end local R=math.max(0,math.abs(O)-P)if(Q*Q+R*R)<=(B*B)then return
true,F,J,H,I end end end end end return false,nil,nil,nil,nil end function g.
SetEnabled(A)h=A and true or false if h then g.RefreshAll()else g.ClearAll()end
end d.OnPaddingChanged(function()if h then g.RefreshAll()end end)c.Register(
function()g.ClearAll()end)return g