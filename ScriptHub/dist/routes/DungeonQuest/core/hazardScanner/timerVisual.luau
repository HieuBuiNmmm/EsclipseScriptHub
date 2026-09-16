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
end return b end end local b,c,d=a.load'a',a.load'b',a.load'c'local e,f,g,h,i,j,
k,l,m,n,o,p,q,r,s,t=b.RunService or game:GetService'RunService',game:GetService
'ReplicatedStorage',b.player,{},true,{},0.85,Color3.fromRGB(255,60,60),Color3.
fromRGB(0,180,255),Color3.fromRGB(255,140,0),'enemyProjectiles',false,{},{
secondbosscirclehitbox=true,secondbosscirclehit=true}local u=function()if p then
return end p=true local u=f:FindFirstChild(o)if u then for v,w in ipairs(u:
GetChildren())do local x=(w.Name or''):lower():gsub('%s+','')if#x>0 then q[x]=
true end end u.ChildAdded:Connect(function(v)local w=(v.Name or''):lower():gsub(
'%s+','')if#w>0 then q[w]=true end end)end end function h.IsEnemyProjectile(v)u(
)if not v or type(v)~='string'then return false end local w=v:lower():gsub('%s+'
,'')if#w==0 then return false end if r[w]==true then return false end return q[w
]==true end function h.BindDetection(v)s=v or nil end function h.IsEnabled()
return i end local v=function()local v=g and g.Character if not v then return
nil end local w=v:FindFirstChild'HumanoidRootPart'or v.PrimaryPart if not w then
return nil end return w.Position.Y-2.5 end local w,x=function(w)if not w or not
w.Parent then return 2.5 end local x=v()if x then local y=x+2.5 local z,A=y-w.
Position.Y,w.Size.Y/2+1.2 return math.clamp(math.max(z,A),1.5,30)end return math
.clamp(w.Size.Y/2+1.8,2,10)end,function(w)return w and w.Parent and w.
Transparency<=k end local y,z=function(y)if not y or not y.Parent then return
nil end if y:IsA'BasePart'then if x(y)then return y end elseif y:IsA'Model'then
if y.PrimaryPart and x(y.PrimaryPart)then return y.PrimaryPart end local z=y:
FindFirstChild'HumanoidRootPart'if z and x(z)then return z end for A,B in
ipairs(y:GetDescendants())do if B:IsA'BasePart'and x(B)then return B end end
else for z,A in ipairs(y:GetDescendants())do if A:IsA'BasePart'and x(A)then
return A end end end return nil end,function(y)local z,A=y and y.IsTrajectory==
true,y and y.Name or'Hazard'local B,C=h.IsEnemyProjectile(A),not z if B then
local D,E=z and n or m,z and'255,160,50'or'0,210,255'return'P',D,E,C else local
D,E=z and n or l,z and'255,160,50'or'255,80,80'return'N',D,E,C end end local A=
function(A,B)if not A or not A.items or not B then return end local C,D,E,F=z(B)
local G,H=B.Name or'Hazard',''if F then local I=B.SpawnClock or os.clock()local
J=math.max(0,os.clock()-I)H=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(255,220,220)'>%s</font> <font color='rgb(255,255,255)'><b>%.1fs</b></font>]]
):format(E,C,G,J)else H=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(220,235,255)'>%s</font>]]
):format(E,C,G)end for I,J in ipairs(A.items)do if J.label and J.label.Parent
then J.label.Text=H end if J.stroke and J.stroke.Parent and J.stroke.Color~=D
then J.stroke.Color=D end end end local B=function()if not i then return end
local B=false for C,D in pairs(j)do local E=C.Instance if not E or not E.Parent
then h.DetachTimerVisual(C)else if D.items then for F=#D.items,1,-1 do local G=D
.items[F]local H=G.part if not x(H)then if G.billboard and G.billboard.Parent
then pcall(function()G.billboard:Destroy()end)end table.remove(D.items,F)else if
G.billboard and G.billboard.Parent then G.billboard.StudsOffset=Vector3.new(0,w(
H),0)end end end if#D.items==0 then h.DetachTimerVisual(C)else B=true A(D,C)end
else h.DetachTimerVisual(C)end end end if not B and t then t:Disconnect()t=nil
end end local C,D=function()if not t and i then t=e.Heartbeat:Connect(B)end end,
function(C,D)local E,F=w(C),Instance.new'BillboardGui'F.Name=
'HazardLifespanTimer'F.Adornee=C F.AlwaysOnTop=true F.MaxDistance=500 F.
LightInfluence=0 F.ResetOnSpawn=false F.Active=false F.Size=UDim2.new(0,150,0,24
)F.StudsOffset=Vector3.new(0,E,0)F.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
local G=Instance.new'Frame'G.Name='TimerFrame'G.Size=UDim2.new(1,0,1,0)G.
BackgroundColor3=Color3.fromRGB(15,15,20)G.BackgroundTransparency=0.25 G.
BorderSizePixel=0 G.Parent=F local H=Instance.new'UICorner'H.CornerRadius=UDim.
new(0,6)H.Parent=G local I=Instance.new'UIStroke'I.Name='Stroke'I.Thickness=1.3
I.Color=D or l I.Transparency=0.15 I.Parent=G local J=Instance.new'TextLabel'J.
Name='TimerLabel'J.Size=UDim2.new(1,-6,1,0)J.Position=UDim2.new(0,3,0,0)J.
BackgroundTransparency=1 J.Font=Enum.Font.GothamBold J.TextSize=11 J.TextColor3=
Color3.fromRGB(255,255,255)J.TextStrokeTransparency=0 J.TextStrokeColor3=Color3.
fromRGB(0,0,0)J.RichText=true J.TextXAlignment=Enum.TextXAlignment.Center J.
TextYAlignment=Enum.TextYAlignment.Center J.Text=''J.Parent=G F.Parent=C return
F,J,I end function h.AttachTimerVisual(E)if not i or not E then return end if j[
E]then h.DetachTimerVisual(E)end local F=E.Instance if not F or not F.Parent
then return end local G,H=z(E)local I=d.GetHazardZones(E)local J,K,L=I and I.
zones,{},{}local M=function(M,N,O,P,Q)local R={billboard=N,label=O,stroke=P,part
=M,zone=Q}table.insert(K,R)local S=M:GetPropertyChangedSignal'Transparency':
Connect(function()if not x(M)then pcall(function()N:Destroy()end)end end)table.
insert(L,S)local T=M.AncestryChanged:Connect(function(T,U)if not U then pcall(
function()N:Destroy()end)end end)table.insert(L,T)end if J and#J>0 then for N,O
in ipairs(J)do local P=O.part if x(P)then local Q,R,S=D(P,H)M(P,Q,R,S,O)end end
else local N=y(F)if x(N)then local O,P,Q=D(N,H)M(N,O,P,Q,nil)end end if#K>0 then
local N={items=K,connections=L}j[E]=N A(N,E)C()end end function h.
DetachTimerVisual(E)if not E then return end local F=j[E]if not F then return
end if F.connections then for G,H in ipairs(F.connections)do pcall(function()H:
Disconnect()end)end table.clear(F.connections)end if F.items then for G,H in
ipairs(F.items)do if H.billboard and H.billboard.Parent then pcall(function()H.
billboard:Destroy()end)end end table.clear(F.items)end j[E]=nil end function h.
UpdateHazardVisualColor(E,F)if not E then return end local G=j[E]if G then A(G,E
)else h.AttachTimerVisual(E)end end function h.ClearAll()if t then t:Disconnect(
)t=nil end for E in pairs(j)do h.DetachTimerVisual(E)end table.clear(j)end
function h.RefreshAll()h.ClearAll()if not i or not s then return end for E,F in
pairs(s.GetActiveHazardsMap())do if F then h.AttachTimerVisual(F)end end end
function h.SetEnabled(E)i=E and true or false if i then h.RefreshAll()else h.
ClearAll()end end c.Register(function()h.ClearAll()end)return h