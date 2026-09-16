local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b={cleaned=false,callbacks={}
}function b.Register(c)if type(c)~='function'then return function()end end if b.
cleaned then pcall(c)return function()end end table.insert(b.callbacks,c)return
function()for d,e in ipairs(b.callbacks)do if e==c then table.remove(b.callbacks
,d)break end end end end function b.Cleanup()if b.cleaned then return end b.
cleaned=true for c=#b.callbacks,1,-1 do pcall(b.callbacks[c])end table.clear(b.
callbacks)end function b.IsActive()return not b.cleaned end return b end
function a.b()local b,c,d,e=game:GetService'Players',game:GetService
'UserInputService',game:GetService'RunService',game:GetService
'VirtualInputManager'local f=b.LocalPlayer if not f then local g=os.clock()+5
repeat f=b.LocalPlayer if f then break end task.wait(0.1)until os.clock()>g end
return{Players=b,UserInputService=c,RunService=d,VirtualInputManager=e,player=f}
end end local b,c,d=a.load'a',a.load'b',{}local e,f,g={'armorMain','weaponMain'}
,10,{warrior={className='Warrior',primaryStat='physicalDamage'},mage={className=
'Mage',primaryStat='spellPower'},guardian={className='Guardian',primaryStat=
'health'}}local h,i=function(h)if not h then return nil,nil end local i=string.
lower(h)for j,k in pairs(g)do if string.find(i,j)then return k.className,k.
primaryStat end end return nil,nil end,function(h)if not h then return nil end
local i=string.match(h,'^%s*([%d,.-]+)')if not i then return nil end local j=
string.gsub(i,',','')return tonumber(j)end local j,k,l,m,n,o,p,q,r,s=function(j)
if not j then return 0,0 end local k=string.gsub(j,',','')local l,m=string.
match(k,'(%d+)%s*/%s*(%d+)')if l and m then return tonumber(l)or 0,tonumber(m)or
0 end local n=i(k)return 0,n or 0 end,function(j)if not j then return''end local
k=string.match(j,'^([^\n\r]+)')local l=k or j local m=string.match(l,
'^(.-)%s*[%(\\[]')if m and m~=''then return string.gsub(m,'%s+$','')end return
string.gsub(l,'%s+$','')end,function(j)if not j then return false end if string.
find(j,'[\n\r]%s*[%(\\[].-[%)\\]]')then return true end return string.find(j,
'%s*[%(\\[].-[%)\\]]%s*$')~=nil end,true,{},'',false local t,u,v,w,x,y={},{},{},
{},{},{}local z=function(z)local A=t[z]if A and z and z.Parent then p=true
pcall(function()z.Text=A.text end)p=false end t[z]=nil end local A,B=function()
for A,B in pairs(t)do z(A)end table.clear(t)end,function(A,B)local C,D=string.
lower(B),A:FindFirstChild(B)if D then if D:IsA'TextLabel'then return D elseif D:
IsA'GuiObject'then for E,F in ipairs{'valueText','ValueText','value','Value',
'amount','Amount','text','label'}do local G=D:FindFirstChild(F)if G and G:IsA
'TextLabel'then return G end end local E=D:FindFirstChildOfClass'TextLabel'if E
then return E end end end for E,F in ipairs(A:GetDescendants())do if F:IsA
'TextLabel'then local G=string.lower(F.Name)if G==C then return F end if(G==
'valuetext'or G=='value'or G=='amount')and F.Parent then local H=string.lower(F.
Parent.Name)if string.find(H,C)then return F end end end end if C=='upgrades'
then for E,F in ipairs(A:GetDescendants())do if F:IsA'TextLabel'and not string.
find(string.lower(F.Name),'title')then if string.find(F.Text,'%d+%s*/%s*%d+')
then return F end end end end return nil end local aa=function(C)if not m then
return end if not C or not C:IsA'GuiObject'or not C.Visible then return end
local D=C.Parent if D and D:IsA'GuiObject'and not D.Visible then return end if p
then return end local E,F=C.Name,{}local G={E}for H,I in ipairs(C:
GetDescendants())do local J=string.lower(I.Name)if not string.find(J,'title')
then if I:IsA'TextLabel'then local K,L=(I.Parent~=C and I.Parent.Name..'/'..I.
Name)or I.Name,k(I.Text)table.insert(F,{name=I.Name,value=L,kind='TextLabel',
path=K,instance=I})table.insert(G,K..'='..L)elseif I:IsA'ValueBase'then local K,
L=tostring(I.Value),(I.Parent~=C and I.Parent.Name..'/'..I.Name)or I.Name table.
insert(F,{name=I.Name,value=K,kind='ValueBase',path=L})table.insert(G,L..'='..K)
end end end local H=B(C,'name')local I=(H and k(H.Text))or nil if not I then for
J,K in ipairs(F)do if string.lower(K.name)=='name'then I=K.value break end end
end local J=B(C,'upgrades')local K=(J and k(J.Text))or nil if not K then for L,M
in ipairs(F)do if string.lower(M.name)=='upgrades'or string.find(M.value,
'%d+%s*/%s*%d+')then K=M.value break end end end local L,M,N=B(C,
'physicalDamage')or B(C,'physicalPower'),B(C,'spellPower'),B(C,'health')local O,
P,Q,R,S,T=L and i(k(L.Text)),M and i(k(M.Text)),N and i(k(N.Text))if E==
'weaponMain'then if(P or 0)>(O or 0)then R='Mage'S='spellPower'T=M else R=
'Warrior'S='physicalDamage'T=L end else R,S=h(I)if R=='Warrior'then T=L elseif R
=='Mage'then T=M elseif R=='Guardian'then T=N else if(Q or 0)>10000 and(Q or 0)>
((O or 0)*10)then R='Guardian'S='health'T=N elseif(P or 0)>(O or 0)then R='Mage'
S='spellPower'T=M else R='Warrior'S='physicalDamage'T=L end end end local U,V=j(
K)local W=math.max(0,V-U)if T and T:IsA'TextLabel'and V>0 then local X=k(T.Text)
local Y=i(X)if Y then local Z=Y+(W*f)local _=string.format('%s\n(%s)',X,
tostring(Z))for aa,ab in ipairs(F)do if ab.instance==T or ab.name==S then ab.
isPrimaryStat=true ab.calculatedTotal=Z ab.remainingUpgrades=W ab.curUpgrades=U
ab.maxUpgrades=V end end table.insert(G,'calc='..tostring(Z))if T.Text~=_ then
if not t[T]then t[T]={text=T.Text}end p=true pcall(function()T.Text=_ T.
ClipsDescendants=false end)p=false end end end local aa={name=1,levelReq=2,
physicalDamage=3,spellPower=4,health=5,upgrades=6,sellPrice=7,description=8}
table.sort(F,function(ab,X)local Y,Z=aa[ab.name]or 99,aa[X.name]or 99 if Y~=Z
then return Y<Z end return ab.path<X.path end)local ab=table.concat(G,'|')if ab
~=o then o=ab r=E n=F s=R for X,Y in ipairs(y)do pcall(Y,r,n,s)end end end local
ab=function(ab,C)if w[C]then return end w[C]=true local D=C:
GetPropertyChangedSignal'Text':Connect(function()if not m or p then return end
if ab.Visible and not l(C.Text)then aa(ab)end end)table.insert(u,D)end local C=
function(C)if v[C]then return end v[C]=true local D=C:GetPropertyChangedSignal
'Visible':Connect(function()if not m then return end if C.Visible then aa(C)else
A()o=''r=nil n={}s=nil for D,E in ipairs(y)do pcall(E,nil,{},nil)end end end)
table.insert(u,D)for E,F in ipairs(C:GetDescendants())do if F:IsA'TextLabel'then
ab(C,F)end end local E=C.DescendantAdded:Connect(function(E)if E:IsA'TextLabel'
then ab(C,E)if C.Visible then task.defer(function()aa(C)end)end end end)table.
insert(u,E)if C.Visible then task.defer(function()aa(C)end)end end local D,E=
function()local D=c.player or c.Players.LocalPlayer if not D then return end
local E=D:FindFirstChild'PlayerGui'if not E then return end local F=E:
FindFirstChild'inventory'if not F then return end local G=F:FindFirstChild
'itemStatFrame'if not G then return end local H=G:GetPropertyChangedSignal
'Visible':Connect(function()if not m then return end if not G.Visible then A()if
r~=nil then r=nil n={}s=nil o=''for H,I in ipairs(y)do pcall(I,nil,{},nil)end
end end end)table.insert(u,H)for I,J in ipairs(e)do local K=G:FindFirstChild(J)
if K and K:IsA'GuiObject'then C(K)if K.Visible and G.Visible then aa(K)end end
end end,function()if q then task.cancel(q)q=nil end for D,E in ipairs(u)do
pcall(function()E:Disconnect()end)end table.clear(u)table.clear(v)table.clear(w)
A()r=nil n={}s=nil o=''for D,E in ipairs(y)do pcall(E,nil,{},nil)end end local F
=function()if q then return end D()q=task.spawn(function()while m do task.wait(
1.5)if not m then break end local F,G=false,c.player or c.Players.LocalPlayer if
G then local H=G:FindFirstChild'PlayerGui'local I=H and H:FindFirstChild
'inventory'local J=I and I:FindFirstChild'itemStatFrame'if J and J.Visible then
for K,L in ipairs(e)do local M=J:FindFirstChild(L)if M and M:IsA'GuiObject'then
if not v[M]then C(M)end if M.Visible then F=true aa(M)end end end end end if not
F and next(t)~=nil then A()if r~=nil then r=nil n={}s=nil o=''for H,I in ipairs(
y)do pcall(I,nil,{},nil)end end end end q=nil end)end function d.IsEnabled()
return m end function d.GetActiveInspector()return r,n,s end function d.
SetEnabled(G)local H=G and true or false if m==H then return end m=H if m then
F()else E()end for I,J in ipairs(x)do pcall(J,m)end end function d.OnChanged(G)
if type(G)=='function'then table.insert(x,G)end end function d.
OnInspectorChanged(G)if type(G)=='function'then table.insert(y,G)end end
function d.GetActiveFrame()local G for H,I in ipairs(n)do if I.name=='name'and I
.value~=''then G=I.value break end end return r,G end function d.OnFrameChanged(
G)if type(G)=='function'then table.insert(y,function(H,I,J)local K for L,M in
ipairs(I)do if M.name=='name'and M.value~=''then K=M.value break end end pcall(G
,H,K)end)end end function d.Init()if not m then m=true end F()end b.Register(
function()m=false E()table.clear(x)table.clear(y)end)F()return d