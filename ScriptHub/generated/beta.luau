--!nocheck
--!nolint

--[[
    @authors YOUR_NAME
    @repository YOUR_REPOSITORY

    This file was automatically generated with darklua, it is not intended for manual editing.
--]]

_P = {
    genDate = "2025-07-04T14:41:21.556782500+00:00",
    cfg = "Beta",
    vers = "v1.0.0-beta.1"
}

local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b={}function b:Export()local
c={}for d,e in pairs(self)do if typeof(e)=='Instance'or type(e)=='table'then
local f,g=pcall(function()end)if f and g~=nil then c[d]=g end end end return c
end function b:Import(c)for d,e in pairs(c)do local f=self[d]if f and f.Value~=
nil then local g=pcall(function()end)if not g then warn(`Failed to import value for flag "{
d}"`)end end end end function b:Reset()for c in pairs(self)do self[c]=nil end
end return b end function a.b()local b={}function b.Apply(c,d,e)for f,g in
pairs(c)do if e and table.find(e,f)then continue end pcall(function()d[f]=g end)
end return d end function b.Wrap(c,d,e,f)local g={}setmetatable(g,{__index=
function(h,i)if c[i]~=nil then return c[i]elseif f then local j,k=pcall(function
()return f[i]end)if j then return k end end return end,__newindex=function(h,i,j
)local k=d[i]if k then k(j)if not(e and table.find(e,i))then c[i]=j end elseif f
then local l,m=pcall(function()f[i]=j end)if not l then c[i]=j end else c[i]=j
end end})return g end return b end function a.c()local b,c=a.load'b',{}function
c:Window(d)d=d or{}print'Made a window'local e=b.Wrap(d,{Visible=function(e)
print('Set window visibility to:',e)end})return b.Apply(d,e)end return c end
function a.d()local b,c=a.load'b',{}return(b.Wrap(c,{Enabled=function(d)print(`{
d and'Enabled'or'Disabled'} ESP.`)end}))end function a.e()local b,c,d=a.load'a',
a.load'c',a.load'd'local e=c:Window{Visible=true}return{Flags=b,Esp=d,Interface=
c,Window=e,Tabs={Home=function(f)end,Visuals=function(f)end,Settings=function(f)
end,Config=function(f)end}}end function a.f()local b={}function b.GetPlayer()
local c,d=pcall(function()return game:GetService'Players'end)return c and(d).
LocalPlayer end function b.GetCharacter(c)local d,e=pcall(function()return c and
c.Character end)return d and e end function b.GetHumanoid(c)local d,e=pcall(
function()local d=b.GetCharacter(c)return d and d:FindFirstChildOfClass
'Humanoid'end)return d and e end return b end function a.g()local b=function(b)
return game:GetService(b)end return{Players=(b'Players')}end function a.h()
return function(b)local c,d,e=a.load'e',a.load'f',a.load'g'local f,g,h,i,j,k,l=c
.Flags,c.Esp,c.Interface,c.Window,c.Tabs,d.GetPlayer(),e.Players do j.Home(b)end
do local m=i:Tab{Name='Exploits'}m:Toggle{Name='Flight'}end do j.Visuals(b)end
do local m=j.Settings(b)m:Toggle{Name='Dark Mode'}end do j.Config(b)end i.Title=
b.Name end end function a.i()return function(b)local c,d,e=a.load'e',a.load'f',a
.load'g'local f,g,h,i,j,k,l=c.Flags,c.Esp,c.Interface,c.Window,c.Tabs,d.
GetPlayer(),e.Players do j.Home(b)end do local m=i:Tab{Name='Exploits'}m:Toggle{
Name='Flight'}end do j.Visuals(b)end do local m=j.Settings(b)m:Toggle{Name=
'Dark Mode'}end do j.Config(b)end i.Title=b.Name end end function a.j()return
function(b)local c,d,e=a.load'e',a.load'f',a.load'g'local f,g,h,i,j,k,l=c.Flags,
c.Esp,c.Interface,c.Window,c.Tabs,d.GetPlayer(),e.Players do j.Home(b)end do
local m=i:Tab{Name='Exploits'}m:Toggle{Name='Flight'}end do j.Visuals(b)end do
local m=j.Settings(b)m:Toggle{Name='Dark Mode'}end do j.Config(b)end i.Title=b.
Name end end end local b={{Name='Universal',Load=a.load'h'},{Name='Game 1',Load=
a.load'i',UniverseId=123456789},{Name='Game 2',Load=a.load'j',Places={123456789,
987654321}}}for c,d in pairs(b)do if d.Places then for e,f in ipairs(d.Places)do
if f==game.PlaceId then return d:Load()end end end if d.UniverseId and d.
UniverseId==game.GameId then return d:Load()end end