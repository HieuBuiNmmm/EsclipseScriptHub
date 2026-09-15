local a,b,c,d,e,f,g,h,i,j,k,l,m=Color3.fromRGB(0,255,120),Color3.fromRGB(0,255,
150),Color3.fromRGB(255,255,255),Color3.fromRGB(0,235,140),Color3.fromRGB(255,60
,60),0.2,1.4,0.45,{},{}local n,o=function(n)if not n then return end if not k or
not k.Parent then if k then pcall(function()k:Destroy()end)end local o=Instance.
new'CylinderHandleAdornment'o.Name='SafeSpot_OuterMarker'o.Adornee=n o.Radius=g
o.Height=f o.Color3=a o.Transparency=0.35 o.ZIndex=6 o.AlwaysOnTop=false o.
Visible=false o.Parent=n k=o end if not l or not l.Parent then if l then pcall(
function()l:Destroy()end)end local o=Instance.new'CylinderHandleAdornment'o.Name
='SafeSpot_CenterDot'o.Adornee=n o.Radius=h o.Height=f+0.05 o.Color3=c o.
Transparency=0.15 o.ZIndex=7 o.AlwaysOnTop=false o.Visible=false o.Parent=n l=o
end if not m or not m.Parent then if m then pcall(function()m:Destroy()end)end
local o=Instance.new'LineHandleAdornment'o.Name='SafeSpot_EscapeLine'o.Adornee=n
o.Color3=b o.Thickness=3.5 o.Transparency=0.2 o.ZIndex=6 o.AlwaysOnTop=false o.
Visible=false o.Parent=n m=o end end,function(n,o)local p=j[n]if not p then
local q=Instance.new'CylinderHandleAdornment'q.Name='SafeSpot_CandidateDot_'..n
q.Adornee=o q.Radius=0.25 q.Height=f q.ZIndex=4 q.AlwaysOnTop=false q.Visible=
false q.Parent=o local r=Instance.new'LineHandleAdornment'r.Name=
'SafeSpot_CandidateLine_'..n r.Adornee=o r.Thickness=1.2 r.ZIndex=4 r.
AlwaysOnTop=false r.Visible=false r.Parent=o p={dot=q,line=r}j[n]=p else if p.
dot and p.dot.Adornee~=o then p.dot.Adornee=o p.dot.Parent=o end if p.line and p
.line.Adornee~=o then p.line.Adornee=o p.line.Parent=o end end return p end
function i.HideCandidates()for p,q in ipairs(j)do if q.dot and q.dot.Parent then
q.dot.Visible=false end if q.line and q.line.Parent then q.line.Visible=false
end end end function i.Hide()if k and k.Parent then k.Visible=false end if l and
l.Parent then l.Visible=false end if m and m.Parent then m.Visible=false end i.
HideCandidates()end local p=function(p,q,r,s)if not s or not r or#r==0 then i.
HideCandidates()return end local t=Vector3.new(p.Position.X,q+0.05,p.Position.Z)
local u=p.CFrame:PointToObjectSpace(t)for v,w in ipairs(r)do local x,y=o(v,p),
Vector3.new(w.pos.X,q+0.05,w.pos.Z)local z,A,B=p.CFrame:PointToObjectSpace(y),w.
isSafe and d or e,w.isSafe and 0.35 or 0.55 if x.dot and x.dot.Parent then local
C=CFrame.new(y)*CFrame.Angles(math.rad(90),0,0)x.dot.CFrame=p.CFrame:
ToObjectSpace(C)x.dot.Color3=A x.dot.Transparency=B x.dot.Radius=w.isSafe and
0.3 or 0.2 x.dot.Visible=true end if x.line and x.line.Parent then local C=z-u
local D=C.Magnitude if D>0.2 then x.line.CFrame=CFrame.lookAt(u,z)x.line.Length=
D x.line.Color3=A x.line.Transparency=B+0.15 x.line.Thickness=w.isSafe and 1.4
or 0.9 x.line.Visible=true else x.line.Visible=false end end end for v=#r+1,#j
do local w=j[v]if w.dot and w.dot.Parent then w.dot.Visible=false end if w.line
and w.line.Parent then w.line.Visible=false end end end function i.Update(q,r,s,
t,u,v)if not q or not q.Parent or not u or not r then i.Hide()return end n(q)
local w=Vector3.new(r.X,s,r.Z)if k and k.Parent then local x=CFrame.new(w)*
CFrame.Angles(math.rad(90),0,0)k.CFrame=q.CFrame:ToObjectSpace(x)k.Visible=true
end if l and l.Parent then local x=CFrame.new(w)*CFrame.Angles(math.rad(90),0,0)
l.CFrame=q.CFrame:ToObjectSpace(x)l.Visible=true end if m and m.Parent then
local x,y=Vector3.new(q.Position.X,s+0.1,q.Position.Z),Vector3.new(r.X,s+0.1,r.Z
)local z,A=q.CFrame:PointToObjectSpace(x),q.CFrame:PointToObjectSpace(y)local B=
A-z local C=B.Magnitude if C>0.3 then m.CFrame=CFrame.new(z)m.Length=C m.CFrame=
CFrame.lookAt(z,A)m.Visible=true else m.Visible=false end end p(q,s,t,v)end
function i.Cleanup()if k then pcall(function()k:Destroy()end)k=nil end if l then
pcall(function()l:Destroy()end)l=nil end if m then pcall(function()m:Destroy()
end)m=nil end for q,r in ipairs(j)do if r.dot then pcall(function()r.dot:
Destroy()end)end if r.line then pcall(function()r.line:Destroy()end)end end
table.clear(j)end return i