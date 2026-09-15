local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b={}function b.Apply(c,d,e)
for f,g in pairs(c)do if e and table.find(e,f)then continue end pcall(function()
d[f]=g end)end return d end function b.Wrap(c,d,e,f)local g={}setmetatable(g,{
__index=function(h,i)if c[i]~=nil then return c[i]elseif f then local j,k=pcall(
function()return f[i]end)if j then return k end end return end,__newindex=
function(h,i,j)local k=d[i]if k then k(j)if not(e and table.find(e,i))then c[i]=
j end elseif f then local l,m=pcall(function()f[i]=j end)if not l then c[i]=j
end else c[i]=j end end})return g end return b end end local b,c,d,e,f,g=a.load
'a',game:GetService'VirtualUser',{},false,60 local h=function()pcall(function()c
:CaptureController()c:Button1Down(Vector2.new(0,0))c:Button1Up(Vector2.new(0,0))
c:Button2Down(Vector2.new(0,0))c:Button2Up(Vector2.new(0,0))end)end local i=
function()while e do h()local i=f while i>0 and e do local j=math.min(i,0.5)task
.wait(j)i-=j end end g=nil end function d.Start()if e or g then return end e=
true task.spawn(h)g=task.spawn(i)end function d.Stop()e=false end function d.
IsEnabled()return e end function d.SetInterval(j)j=tonumber(j)if j and j>0 then
f=j else f=60 end end function d.GetInterval()return f end return(b.Wrap(d,{
Enabled=function(j)if j then d.Start()else d.Stop()end end,Interval=function(j)d
.SetInterval(j)end}))