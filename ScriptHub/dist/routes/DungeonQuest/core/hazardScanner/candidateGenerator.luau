local a,b,c={},{},8 for d=1,c do local e=(d-1)*(2*math.pi/c)b[d]=Vector3.new(
math.cos(e),0,math.sin(e))end local d,e={},16 for f=1,e do local g=(f-1)*(2*math
.pi/e)d[f]=Vector3.new(math.cos(g),0,math.sin(g))end local f,g,h={1.5,3,5,8,12,
18,25},{1.5,3,4.5,6,8,10.5,13.5,17,21,26,32,38,45},{1.5,3,4.5,6,8,10.5,13.5,17,
21,26,32,38,45,50,55}a.COARSE_DIRECTIONS=b a.FINE_DIRECTIONS=d a.COARSE_RADII=f
a.FINE_RADII=g a.FALLBACK_RADII=h function a.SamplePass(i,j,k,l,m,n,o,p)local q,
r,s,t,u=math.huge,Vector3.zero,false,j if p and p.Magnitude>0.1 then local v=
Vector3.new(p.X,0,p.Z).Unit t=table.clone(j)table.sort(t,function(w,x)local y,z=
w.X*v.X+w.Z*v.Z,x.X*v.X+x.Z*v.Z return y>z end)end for v,w in ipairs(k)do local
x=false for y,z in ipairs(t)do local A=i+z*w local B=n(A)if o then table.insert(
o,{pos=A,isSafe=B,isChosen=false})end if B then local C=A if m and l>0 then
local D=A+z*l if n(D)then C=D end end local D=(C-i).Magnitude if D<q then q=D u=
C r=z x=true end end end if x and u then s=true break end end return u,s,q,r end
return a