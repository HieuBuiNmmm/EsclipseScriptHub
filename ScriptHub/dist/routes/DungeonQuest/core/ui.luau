local a={}function a.PatchSliderLoadCallback(b)if not b or type(b.UpdateValue)~=
'function'then return b end local c=b.UpdateValue b.UpdateValue=function(d,e)c(d
,e)local f=d.Settings if f and f.Callback then task.spawn(function()pcall(f.
Callback,tonumber(e))end)end end return b end function a.PatchDropdownRestore(b,
c)if not b or type(b.UpdateSelection)~='function'then return b end local d=b.
UpdateSelection b.UpdateSelection=function(e,f)if type(f)=='string'and f~=''and
not e:IsOption(f)then if c then pcall(function()e:InsertOptions{f}end)else local
g=e.Settings and e.Settings.Options if type(g)=='table'and#g>0 then f=g[1]else
local h=next(e:GetOptions())if h then f=h end end end end d(e,f)end return b end
return a