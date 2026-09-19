local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b={cleaned=false,callbacks={}
}function b.Register(c)if type(c)~='function'then return function()end end if b.
cleaned then pcall(c)return function()end end table.insert(b.callbacks,c)return
function()for d,e in ipairs(b.callbacks)do if e==c then table.remove(b.callbacks
,d)break end end end end function b.Cleanup()if b.cleaned then return end b.
cleaned=true for c=#b.callbacks,1,-1 do pcall(b.callbacks[c])end table.clear(b.
callbacks)end function b.IsActive()return not b.cleaned end b.OnCleanup=b.
Register return b end function a.b()local b,c,d,e=game:GetService'Players',game:
GetService'UserInputService',game:GetService'RunService',game:GetService
'VirtualInputManager'local f=b.LocalPlayer if not f then local g=os.clock()+5
repeat f=b.LocalPlayer if f then break end task.wait(0.1)until os.clock()>g end
return{Players=b,UserInputService=c,RunService=d,VirtualInputManager=e,player=f}
end end local b,c,d=a.load'a',a.load'b',{}local e,f,g,h={'inventory',
'inspectGui','sellShop','tradingGui','blacksmith'},{'armorMain','weaponMain'},10
,{warrior={className='Warrior',primaryStat='physicalDamage'},mage={className=
'Mage',primaryStat='spellPower'},guardian={className='Guardian',primaryStat=
'health'}}local i,j=function(i)if not i then return nil,nil end local j=string.
lower(i)for k,l in pairs(h)do if string.find(j,k)then return l.className,l.
primaryStat end end return nil,nil end,function(i)if not i then return nil end
local j=string.match(i,'^%s*([%d,.-]+)')if not j then return nil end local k=
string.gsub(j,',','')return tonumber(k)end local k,l,m,n,o,p,q,r,s,t=function(k)
if not k then return 0,0 end local l=string.gsub(k,',','')local m,n=string.
match(l,'(%d+)%s*/%s*(%d+)')if m and n then return tonumber(m)or 0,tonumber(n)or
0 end local o=j(l)return 0,o or 0 end,function(k)if not k then return''end local
l=string.match(k,'^([^\n\r]+)')local m=l or k local n=string.match(m,
'^(.-)%s*[%(\\[]')if n and n~=''then return string.gsub(n,'%s+$','')end return
string.gsub(m,'%s+$','')end,function(k)if not k then return false end if string.
find(k,'[\n\r]%s*[%(\\[].-[%)\\]]')then return true end return string.find(k,
'%s*[%(\\[].-[%)\\]]%s*$')~=nil end,true,{},'',false local u,v,w,x,y,z,A,B={},{}
,{},{},{},{},{},{}local C=function(C)local D=u[C]if D and C and C.Parent then q=
true pcall(function()C.Text=D.text end)q=false end u[C]=nil end local D,E=
function()for D,E in pairs(u)do C(D)end table.clear(u)end,function(D,E)local F,G
=string.lower(E),D:FindFirstChild(E)if G then if G:IsA'TextLabel'then return G
elseif G:IsA'GuiObject'then for H,I in ipairs{'valueText','ValueText','value',
'Value','amount','Amount','text','label'}do local J=G:FindFirstChild(I)if J and
J:IsA'TextLabel'then return J end end local H=G:FindFirstChildOfClass'TextLabel'
if H then return H end end end for H,I in ipairs(D:GetDescendants())do if I:IsA
'TextLabel'then local J=string.lower(I.Name)if J==F then return I end if(J==
'valuetext'or J=='value'or J=='amount')and I.Parent then local K=string.lower(I.
Parent.Name)if string.find(K,F)then return I end end end end if F=='upgrades'
then for H,I in ipairs(D:GetDescendants())do if I:IsA'TextLabel'and not string.
find(string.lower(I.Name),'title')then if string.find(I.Text,'%d+%s*/%s*%d+')
then return I end end end end return nil end local aa=function(F)if not n then
return end if not F or not F:IsA'GuiObject'or not F.Visible then return end
local G=F.Parent if G and G:IsA'GuiObject'and not G.Visible then return end if q
then return end local H,I=F.Name,{}local J={H}for K,L in ipairs(F:
GetDescendants())do local M=string.lower(L.Name)if not string.find(M,'title')
then if L:IsA'TextLabel'then local N,O=(L.Parent~=F and L.Parent.Name..'/'..L.
Name)or L.Name,l(L.Text)table.insert(I,{name=L.Name,value=O,kind='TextLabel',
path=N,instance=L})table.insert(J,N..'='..O)elseif L:IsA'ValueBase'then local N,
O=tostring(L.Value),(L.Parent~=F and L.Parent.Name..'/'..L.Name)or L.Name table.
insert(I,{name=L.Name,value=N,kind='ValueBase',path=O})table.insert(J,O..'='..N)
end end end local K=E(F,'name')local L=(K and l(K.Text))or nil if not L then for
M,N in ipairs(I)do if string.lower(N.name)=='name'then L=N.value break end end
end local M=E(F,'upgrades')local N=(M and l(M.Text))or nil if not N then for O,P
in ipairs(I)do if string.lower(P.name)=='upgrades'or string.find(P.value,
'%d+%s*/%s*%d+')then N=P.value break end end end local O,P,Q=E(F,
'physicalDamage')or E(F,'physicalPower'),E(F,'spellPower'),E(F,'health')local R,
S,T,U,V,W=O and j(l(O.Text)),P and j(l(P.Text)),Q and j(l(Q.Text))if H==
'weaponMain'then if(S or 0)>(R or 0)then U='Mage'V='spellPower'W=P else U=
'Warrior'V='physicalDamage'W=O end else U,V=i(L)if U=='Warrior'then W=O elseif U
=='Mage'then W=P elseif U=='Guardian'then W=Q else if(T or 0)>10000 and(T or 0)>
((R or 0)*10)then U='Guardian'V='health'W=Q elseif(S or 0)>(R or 0)then U='Mage'
V='spellPower'W=P else U='Warrior'V='physicalDamage'W=O end end end local X,Y=k(
N)local Z=math.max(0,Y-X)if W and W:IsA'TextLabel'and Y>0 then local _=l(W.Text)
local aa=j(_)if aa then local ab=aa+(Z*g)local ac=string.format('%s\n(%s)',_,
tostring(ab))for ad,ae in ipairs(I)do if ae.instance==W or ae.name==V then ae.
isPrimaryStat=true ae.calculatedTotal=ab ae.remainingUpgrades=Z ae.curUpgrades=X
ae.maxUpgrades=Y end end table.insert(J,'calc='..tostring(ab))if W.Text~=ac then
if not u[W]then u[W]={text=W.Text}end q=true pcall(function()W.Text=ac W.
ClipsDescendants=false end)q=false end end end local aa={name=1,levelReq=2,
physicalDamage=3,spellPower=4,health=5,upgrades=6,sellPrice=7,description=8}
table.sort(I,function(ab,ac)local ad,ae=aa[ab.name]or 99,aa[ac.name]or 99 if ad
~=ae then return ad<ae end return ab.path<ac.path end)local ab=table.concat(J,
'|')if ab~=p then p=ab s=H o=I t=U for ac,ad in ipairs(B)do pcall(ad,s,o,t)end
end end local ab=function(ab,ac)if x[ac]then return end x[ac]=true local ad=ac:
GetPropertyChangedSignal'Text':Connect(function()if not n or q then return end
if ab.Visible and not m(ac.Text)then aa(ab)end end)table.insert(v,ad)end local
ac=function(ac)if w[ac]then return end w[ac]=true local ad=ac:
GetPropertyChangedSignal'Visible':Connect(function()if not n then return end if
ac.Visible then aa(ac)else D()p=''s=nil o={}t=nil for ad,ae in ipairs(B)do
pcall(ae,nil,{},nil)end end end)table.insert(v,ad)for ae,F in ipairs(ac:
GetDescendants())do if F:IsA'TextLabel'then ab(ac,F)end end local ae=ac.
DescendantAdded:Connect(function(ae)if ae:IsA'TextLabel'then ab(ac,ae)if ac.
Visible then task.defer(function()aa(ac)end)end end end)table.insert(v,ae)if ac.
Visible then task.defer(function()aa(ac)end)end end local ad=function(ad)if not
ad or not ad:IsA'GuiObject'or y[ad]then return end y[ad]=true local ae=ad:
GetPropertyChangedSignal'Visible':Connect(function()if not n then return end if
not ad.Visible then D()if s~=nil then s=nil o={}t=nil p=''for ae,F in ipairs(B)
do pcall(F,nil,{},nil)end end end end)table.insert(v,ae)for F,G in ipairs(f)do
local H=ad:FindFirstChild(G)if H and H:IsA'GuiObject'then ac(H)if H.Visible and
ad.Visible then aa(H)end end end local F=ad.ChildAdded:Connect(function(F)if F:
IsA'GuiObject'then for G,H in ipairs(f)do if F.Name==H then ac(F)if F.Visible
and ad.Visible then aa(F)end end end end end)table.insert(v,F)end local ae=
function(ae)if not ae or z[ae]then return end z[ae]=true local F=ae:
FindFirstChild'itemStatFrame'if F and F:IsA'GuiObject'then ad(F)end local G=ae.
ChildAdded:Connect(function(G)if G.Name=='itemStatFrame'and G:IsA'GuiObject'then
ad(G)end end)table.insert(v,G)local H=ae.AncestryChanged:Connect(function(H,I)if
not I then z[ae]=nil D()end end)table.insert(v,H)end local F,G=function()local F
=c.player or c.Players.LocalPlayer if not F then return end local G=F:
FindFirstChild'PlayerGui'if not G then return end for H,I in ipairs(e)do local J
=G:FindFirstChild(I)if not J then for K,L in ipairs(G:GetChildren())do if string
.lower(L.Name)==string.lower(I)then J=L break end end end if J then ae(J)end end
local H=G.ChildAdded:Connect(function(H)for I,J in ipairs(e)do if string.lower(H
.Name)==string.lower(J)then ae(H)end end end)table.insert(v,H)end,function()if r
then task.cancel(r)r=nil end for F,G in ipairs(v)do pcall(function()G:
Disconnect()end)end table.clear(v)table.clear(w)table.clear(x)table.clear(y)
table.clear(z)D()s=nil o={}t=nil p=''for F,G in ipairs(B)do pcall(G,nil,{},nil)
end end local H=function()if r then return end F()r=task.spawn(function()while n
do task.wait(1.5)if not n then break end local H,I=false,c.player or c.Players.
LocalPlayer if I then local J=I:FindFirstChild'PlayerGui'if J then for K,L in
ipairs(e)do local M=J:FindFirstChild(L)if not M then for N,O in ipairs(J:
GetChildren())do if string.lower(O.Name)==string.lower(L)then M=O break end end
end if M then if not z[M]then ae(M)end local N=M:FindFirstChild'itemStatFrame'if
N and N:IsA'GuiObject'then if not y[N]then ad(N)end if N.Visible then for O,P in
ipairs(f)do local Q=N:FindFirstChild(P)if Q and Q:IsA'GuiObject'then if not w[Q]
then ac(Q)end if Q.Visible then H=true aa(Q)end end end end end end end end end
if not H and next(u)~=nil then D()if s~=nil then s=nil o={}t=nil p=''for J,K in
ipairs(B)do pcall(K,nil,{},nil)end end end end r=nil end)end function d.
IsEnabled()return n end function d.GetActiveInspector()return s,o,t end function
d.SetEnabled(I)local J=I and true or false if n==J then return end n=J if n then
H()else G()end for K,L in ipairs(A)do pcall(L,n)end end function d.OnChanged(I)
if type(I)=='function'then table.insert(A,I)end end function d.
OnInspectorChanged(I)if type(I)=='function'then table.insert(B,I)end end
function d.GetActiveFrame()local I for J,K in ipairs(o)do if K.name=='name'and K
.value~=''then I=K.value break end end return s,I end function d.OnFrameChanged(
I)if type(I)=='function'then table.insert(B,function(J,K,L)local M for N,O in
ipairs(K)do if O.name=='name'and O.value~=''then M=O.value break end end pcall(I
,J,M)end)end end function d.Init()if not n then n=true end H()end b.Register(
function()n=false G()table.clear(A)table.clear(B)end)H()return d