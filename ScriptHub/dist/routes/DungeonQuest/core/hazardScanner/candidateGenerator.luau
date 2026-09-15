local a,b,c={},{},8 for d=1,c do local e=(d-1)*(2*math.pi/c)b[d]=Vector3.new(
math.cos(e),0,math.sin(e))end local d,e={},16 for f=1,e do local g=(f-1)*(2*math
.pi/e)d[f]=Vector3.new(math.cos(g),0,math.sin(g))end local f,g={1.5,3,5,8,12,18,
25},{1.5,3,4.5,6,8,10.5,13.5,17,21,26,32,40}a.COARSE_DIRECTIONS=b a.
FINE_DIRECTIONS=d a.COARSE_RADII=f a.FINE_RADII=g function a.IsPathClear(h,i,j,k
,l)if not j then return true end l=l or 2 local m=i-h local n=m.Magnitude if n<=
l then return true end local o,p,q=m/n,math.floor(n/l),{}for r=1,p do local s=h+
o*(r*l)local t,u=j(s,0)if t and u then local v=k and(k[u]==true or(u.Instance
and k[u.Instance]))if not v then return false else if q[u]then return false end
end else if k then for v,w in pairs(k)do q[v]=true end end end end return true
end function a.SamplePass(h,i,j,k,l,m,n,o,p,q)local r,s,t,u,v=math.huge,Vector3.
zero,false,i if o and o.Magnitude>0.1 then local w=Vector3.new(o.X,0,o.Z).Unit u
=table.clone(i)table.sort(u,function(x,y)local z,A=x.X*w.X+x.Z*w.Z,y.X*w.X+y.Z*w
.Z return z>A end)end for w,x in ipairs(j)do local y=false for z,A in ipairs(u)
do local B=h+A*x local C=m(B)if C then local D=B if l and k>0 then local E=B+A*k
if m(E)then D=E end end local E=a.IsPathClear(h,D,p,q,2)if not E then C=false
else local F=(D-h).Magnitude if F<r then r=F v=D s=A y=true end end end if n
then table.insert(n,{pos=B,isSafe=C,isChosen=false})end end if y and v then t=
true break end end return v,t,r,s end return a