local a,b,c={},{},8 for d=1,c do local e=(d-1)*(2*math.pi/c)b[d]=Vector3.new(
math.cos(e),0,math.sin(e))end local d,e={},16 for f=1,e do local g=(f-1)*(2*math
.pi/e)d[f]=Vector3.new(math.cos(g),0,math.sin(g))end local f,g={1.5,3,5,8,12,18,
25},{1.5,3,4.5,6,8,10.5,13.5,17,21,26,32,40}a.COARSE_DIRECTIONS=b a.
FINE_DIRECTIONS=d a.COARSE_RADII=f a.FINE_RADII=g function a.SamplePass(h,i,j,k,
l,m,n,o)local p,q,r,s,t=math.huge,Vector3.zero,false,i if o and o.Magnitude>0.1
then local u=Vector3.new(o.X,0,o.Z).Unit s=table.clone(i)table.sort(s,function(v
,w)local x,y=v.X*u.X+v.Z*u.Z,w.X*u.X+w.Z*u.Z return x>y end)end for u,v in
ipairs(j)do local w=false for x,y in ipairs(s)do local z=h+y*v local A=m(z)if n
then table.insert(n,{pos=z,isSafe=A,isChosen=false})end if A then local B=z if l
and k>0 then local C=z+y*k if m(C)then B=C end end local C=(B-h).Magnitude if C<
p then p=C t=B q=y w=true end end end if w and t then r=true break end end
return t,r,p,q end return a