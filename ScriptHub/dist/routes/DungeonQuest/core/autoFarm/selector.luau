local a={}function a.SelectBestTarget(b,c,d)local e,f,g=(math.huge)for h,i in
ipairs(c)do if d and d()then return nil,nil,nil,nil,math.huge end local j=i.Root
if j and j.Parent then local k=j.Position local l,m=k.X-b.X,k.Z-b.Z local n=l*l+
m*m if n<e then e=n f=i g=k end end end local h=e<math.huge and math.sqrt(e)or
math.huge return f,nil,nil,g,h end return a