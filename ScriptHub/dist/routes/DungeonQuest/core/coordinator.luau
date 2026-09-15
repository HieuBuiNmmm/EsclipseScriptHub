local a,b,c={},{},false function a.SetLocked(d)c=d and true or false end
function a.IsLocked()return c end function a.Register(d,e,f)if type(d)~='string'
or type(e)~='function'or type(f)~='function'then return end b[d]={setEnabled=e,
isEnabled=f}end function a.EnableExclusive(d)if c then return end for e,f in
pairs(b)do if e~=d and f.isEnabled()then pcall(f.setEnabled,false)end end end
function a.IsEnabled(d)local e=b[d]return e~=nil and e.isEnabled()end return a