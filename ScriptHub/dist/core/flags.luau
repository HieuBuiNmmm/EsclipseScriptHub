local a={}function a:Export()local b={}for c,d in pairs(self)do if typeof(d)==
'Instance'or type(d)=='table'then local e,f=pcall(function()end)if e and f~=nil
then b[c]=f end end end return b end function a:Import(b)for c,d in pairs(b)do
local e=self[c]if e and e.Value~=nil then local f=pcall(function()end)if not f
then warn(`Failed to import value for flag "{c}"`)end end end end function a:
Reset()for b in pairs(self)do self[b]=nil end end return a