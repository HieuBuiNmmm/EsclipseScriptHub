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
end return b end end local b,c,d=a.load'a',a.load'b',a.load'c'local e,f,g,h,i,j,
k,l,m,n,o,p=b.RunService or game:GetService'RunService',b.player,{},false,{},
0.85,Color3.fromRGB(255,45,45),Color3.fromRGB(0,160,255),0.55,0.25 local q=
function()local q=f and f.Character if not q then return nil end local r=q:
FindFirstChild'HumanoidRootPart'or q.PrimaryPart if not r then return nil end
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
then g.RefreshAll()end end)c.Register(function()g.ClearAll()end)return g