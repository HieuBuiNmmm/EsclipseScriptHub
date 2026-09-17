local a={}function a.PatchSliderLoadCallback(b)if not b or type(b.UpdateValue)~=
'function'then return b end local c=b.UpdateValue b.UpdateValue=function(d,e)
local f,g=d,e if g==nil and(type(f)=='number'or type(f)=='string')then g=f f=b
end pcall(c,f,g)local h=f and f.Settings or b.Settings if h and h.Callback then
pcall(h.Callback,tonumber(g))end end return b end function a.
PatchDropdownRestore(b,c)if not b or type(b.UpdateSelection)~='function'then
return b end local d=b.UpdateSelection b.UpdateSelection=function(e,f)if type(f)
=='string'and f~=''and not e:IsOption(f)then if c then pcall(function()e:
InsertOptions{f}end)else local g=e.Settings and e.Settings.Options if type(g)==
'table'and#g>0 then f=g[1]else local h=next(e:GetOptions())if h then f=h end end
end end d(e,f)end return b end return a