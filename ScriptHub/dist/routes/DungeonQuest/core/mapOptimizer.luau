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
return b end end local b,c,d,e,f,g,h,i,j=a.load'a',a.load'b',{},false,{},{},{},2
,function(b)if not b then return false end local c=b while c and c~=workspace do
local d=c.Name:lower()if d:find'stairramp'or d:find'step'or d:find
'meshes/cylinder'or d:find'cylinder'then return true end c=c.Parent end return
false end local k=function(k)if not e or not k or not k:IsA'BasePart'then return
end if j(k)then return end if not g[k]then g[k]={CanCollide=k.CanCollide,
CanTouch=k.CanTouch}end pcall(function()k.CanCollide=false k.CanTouch=false end)
end local l={['meshes/ice3']=true,['meshes/snow']=true,['invisible platform']=
true,part=true}local m,n,o=function(m)if not m then return true end if m:IsA
'Model'or m:IsA'Folder'then return true end local n=m.Name:lower()if l[n]or m.
Name=='Meshes/Ice3'or m.Name=='Meshes/Snow'or m.Name=='Invisible platform'or m.
Name=='Part'then return true end return false end,function()if not e then return
end local m=workspace:FindFirstChild'Map'if not m then return end for n,o in
ipairs(m:GetDescendants())do if(o:IsA'Model'or o:IsA'Folder')and o.Name:lower():
find'border'then for p,q in ipairs(o:GetChildren())do pcall(function()q:Destroy(
)end)end end end end,function()if not e then return end local m=workspace:
FindFirstChild'Map'if not m then return end for n,o in ipairs(m:GetDescendants()
)do if o.Name:lower():find'wooden plank'then local p=o.Parent while p and p~=m
and p~=workspace do if p:IsA'Model'then pcall(function()p:Destroy()end)break end
p=p.Parent end end end end local p,q,r=function()if not e then return end local
p=workspace:FindFirstChild'Map'if not p then return end for q,r in ipairs(p:
GetChildren())do if not m(r)then pcall(function()r:Destroy()end)end end end,{
Vector3.new(-724.4873046875,33.9286003112793,174.7227325439453),Vector3.new(-
697.8023681640625,26.397010803222656,380.60272216796875),Vector3.new(-
649.3167724609375,31.39712905883789,397.80535888671875),Vector3.new(-
581.634033203125,3.4567506313323975,318.2510070800781),Vector3.new(-
491.9974365234375,41.522090911865234,384.67694091796875),Vector3.new(-
484.0378723144531,35.76678466796875,418.82659912109375),Vector3.new(-
470.1619567871094,32.919700622558594,461.6861267089844),Vector3.new(-
468.8152770996094,39.06712341308594,514.388916015625),Vector3.new(-
600.4266357421875,13.99144172668457,570.6660766601563),Vector3.new(-
338.2521667480469,42.990394592285156,439.36456298828125),Vector3.new(-
355.2449951171875,57.510982513427734,385.5475769042969),Vector3.new(-
606.5220336914063,37.41774368286133,372.6407470703125)},0.2 local s=function(s)
if not s then return false end for t,u in ipairs(q)do if(s-u).Magnitude<=r then
return true end end return false end local t=function(t)if not t or not t:IsA
'Model'or not t.Parent then return false end local u,v=pcall(function()return t:
GetPivot().Position end)if u and v and s(v)then return true end if t.PrimaryPart
and s(t.PrimaryPart.Position)then return true end for w,x in ipairs(t:
GetDescendants())do if x:IsA'BasePart'and s(x.Position)then return true end end
return false end local u,v=function()if not e then return end local u=workspace:
FindFirstChild'Map'or workspace:FindFirstChild'dungeon'or workspace:
FindFirstChild'Dungeon'if not u then return end for v,w in ipairs(u:
GetDescendants())do if not w.Parent then continue end if w:IsA'Model'then if t(w
)then pcall(function()w:Destroy()end)end elseif w:IsA'BasePart'then if s(w.
Position)then local x=w:FindFirstAncestorOfClass'Model'if x and x~=workspace and
x~=u then pcall(function()x:Destroy()end)else pcall(function()w:Destroy()end)end
end end end end,function(u)if not e or not u or not u:IsA'BasePart'then return
end if u.Name=='Meshes/Snow'or u.Name:lower():find'meshes/snow'or u.Name:lower()
=='snow'then if h[u]==nil then h[u]=u.Transparency end pcall(function()u.
Transparency=1 end)end end local w=function()if not e then return end local w=
workspace:FindFirstChild'Map'if not w then return end for x,y in ipairs(w:
GetDescendants())do if y:IsA'BasePart'and(y.Name=='Meshes/Snow'or y.Name:lower()
:find'meshes/snow'or y.Name:lower()=='snow')then v(y)end end end local x=
function()if not e then return end p()n()o()u()w()end local y,z=function()for y,
z in ipairs(f)do pcall(function()z:Disconnect()end)end table.clear(f)local y,z=
function(y)if not y then return end table.insert(f,y.ChildAdded:Connect(function
(z)if not e then return end if not m(z)then pcall(function()z:Destroy()end)end
end))table.insert(f,y.DescendantAdded:Connect(function(z)if not e then return
end if z.Name:lower():find'wooden plank'then local A=z.Parent while A and A~=y
and A~=workspace do if A:IsA'Model'then pcall(function()A:Destroy()end)return
end A=A.Parent end end local A=z.Parent while A and A~=y and A~=workspace do if(
A:IsA'Model'or A:IsA'Folder')and A.Name:lower():find'border'then pcall(function(
)z:Destroy()end)break end A=A.Parent end if z:IsA'Model'and t(z)then pcall(
function()z:Destroy()end)return elseif z:IsA'BasePart'and s(z.Position)then
local B=z:FindFirstAncestorOfClass'Model'if B and B~=workspace and B~=y then
pcall(function()B:Destroy()end)else pcall(function()z:Destroy()end)end return
end if z:IsA'BasePart'and(z.Name=='Meshes/Snow'or z.Name:lower():find
'meshes/snow'or z.Name:lower()=='snow')then v(z)end end))end,workspace:
FindFirstChild'Map'or workspace:FindFirstChild'dungeon'or workspace:
FindFirstChild'Dungeon'if z then y(z)end table.insert(f,workspace.ChildAdded:
Connect(function(A)if not e then return end local B=A.Name:lower()if B=='map'or
B=='dungeon'then y(A)task.delay(0.2,x)end end))end,function()for y,z in pairs(h)
do if y and y.Parent then pcall(function()y.Transparency=z end)end end table.
clear(h)for y,z in pairs(g)do if y and y.Parent then pcall(function()y.
CanCollide=z.CanCollide y.CanTouch=z.CanTouch end)end end table.clear(g)end
function d.Toggle(A)if A==e then return end e=A and true or false if e then x()
y()if loopThread then task.cancel(loopThread)loopThread=nil end loopThread=task.
spawn(function()while e do task.wait(i)pcall(x)end end)else for B,C in ipairs(f)
do pcall(function()C:Disconnect()end)end table.clear(f)if loopThread then task.
cancel(loopThread)loopThread=nil end z()end end function d.IsEnabled()return e
end c.Register(function()d.Toggle(false)end)return d