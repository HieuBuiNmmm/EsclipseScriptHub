--!nocheck
--!nolint

--[[
    @authors YOUR_NAME
    @repository YOUR_REPOSITORY

    This file was automatically generated with darklua, it is not intended for manual editing.
--]]

_P = {
    genDate = "2026-10-03T00:50:31.589225600+00:00",
    cfg = "Loader",
    vers = "v0.0.0"
}

local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b,c,d,e,f,g,h,i,j=game:
GetService'HttpService',game:GetService'Players',game:GetService'TweenService',
game:GetService'UserInputService',game:GetService'CoreGui',game:GetService
'RbxAnalyticsService',{},function(b)local c=(request or http_request or(syn and
syn.request)or(http and http.request)or(fluxus and fluxus.request))if not c then
return false,
[[Executor does not support HTTP requests (request/http_request missing)]]end
local d,e=pcall(function()return c(b)end)if not d then return false,tostring(e)
end return true,e end,function(b)local c=(setclipboard or toclipboard or(syn and
syn.write_clipboard)or(Clipboard and Clipboard.set))if c then pcall(c,b)return
true end return false end function h.GetHWID()local k pcall(function()local l=(
gethwid or get_hwid or(syn and syn.get_hwid)or rbx_gethwid)if l then k=tostring(
l())end end)if k and#k>5 then return k end pcall(function()local l,m=g:
GetClientId(),c.LocalPlayer local n=m and m.UserId or 0 if l and#l>5 then k=
string.format('CID-%s-UID-%s',tostring(l),tostring(n))end end)if k and#k>5 then
return k end local l=c.LocalPlayer local m,n=l and l.UserId or 0,l and l.Name or
'Unknown'return string.format('FALLBACK-%d-%s',m,n)end local k,l=function()local
k,l,m,n,o,p=isfile or(syn and syn.isfile)or(getgenv and getgenv().isfile),
readfile or(syn and syn.readfile)or(getgenv and getgenv().readfile),writefile or
(syn and syn.writefile)or(getgenv and getgenv().writefile),delfile or(syn and
syn.delfile)or(getgenv and getgenv().delfile),isfolder or(syn and syn.isfolder)
or(getgenv and getgenv().isfolder),makefolder or(syn and syn.makefolder)or(
getgenv and getgenv().makefolder)return k,l,m,n,o,p end,function(k)local l,m=(k)
.SaveFolder or'EsclipseHub',k.SaveFileName or'key.json'if m:find'/'then local n=
m:split'/'local o=n[#n]table.remove(n,#n)return m,table.concat(n,'/')end return
l..'/'..m,l end local m,q=function(m)local n,o,p,q,r,s=k()if not r or not s then
return end local t,u=m:split'/',''for v,w in ipairs(t)do if#w>0 then u=(#u>0)and
(u..'/'..w)or w local x=false pcall(function()x=r(u)end)if not x then pcall(
function()s(u)end)end end end end,function(m)local q,r=k()if not q or not r then
return nil end local s,t=l(m),false pcall(function()t=q(s)end)local u=s if not t
then local v,w='EsclipseKey.json',false pcall(function()w=q(v)end)if w then u=v
t=true end end if not t then return nil end local v pcall(function()v=r(u)end)if
not v or v==''then return nil end local w,x=pcall(function()return b:JSONDecode(
v)end)if w and type(x)=='table'and x.Key then return tostring(x.Key)elseif not w
and#v>4 then return v:gsub('%s+','')end return nil end local r,s=function(r,s,t)
local u,v,w=k()if not w then return end local x,y=l(r)m(y)local z={Key=s,HWID=h.
GetHWID(),ExpiresAt=t or 0,SavedAt=os.time()}pcall(function()w(x,b:JSONEncode(z)
)end)end,function(r)local s,t,v,w=k()if not s or not w then return end local x=
l(r)pcall(function()if s(x)then w(x)end if s'EsclipseKey.json'then w
'EsclipseKey.json'end end)end function h.VerifyKeyOnline(v,w)if not w or w==''
then return{Success=false,Message='Please enter a key!'}end local x=w:gsub(
'^%s+',''):gsub('%s+$','')if#x<3 then return{Success=false,Message=
'Invalid key format!'}end if v.ApiUrl:find'your%-worker'or v.ApiUrl==''then if x
:upper()=='ESCLIPSE-DEV'or x:upper()=='ESCLIPSE-TEST-KEY'then return{Success=
true,Message=[[Demo key verified! (Deploy Cloudflare Worker to use live keys)]],
ExpiresAt=os.time()+2592E3,DaysLeft=30}else return{Success=false,Message=
[[Demo Mode: Use key 'ESCLIPSE-DEV' or configure your Worker URL!]]}end end
local y,z=h.GetHWID(),string.format('%s/api/verify',v.ApiUrl:gsub('/+$',''))
local A=b:JSONEncode{key=x,hwid=y,userId=c.LocalPlayer and c.LocalPlayer.UserId
or 0,username=c.LocalPlayer and c.LocalPlayer.Name or'Unknown'}local B,C=i{Url=z
,Method='POST',Headers={['Content-Type']='application/json'},Body=A}if not B
then return{Success=false,Message='Connection failed: '..tostring(C)}end local D
,E=C and(C.StatusCode or C.Status)or 0,C and(C.Body or C.body)or''local F,G=
pcall(function()return b:JSONDecode(E)end)if not F or type(G)~='table'then
return{Success=false,Message=string.format('Invalid server response (HTTP %d)',D
)}end if G.success==true or G.Success==true then return{Success=true,Message=G.
message or'Key verified successfully!',ExpiresAt=G.expiresAt,DaysLeft=G.daysLeft
,Payload=G.payload or G.Payload}else return{Success=false,Message=G.message or G
.error or'Invalid or expired key!'}end end local v=function()local v=(gethui or(
syn and syn.get_hui))if v then local w=v()if w then return w end end local w=(
syn and syn.protect_gui)if w and f then local x=Instance.new'Folder'x.Name=
'EsclipseHost'w(x)x.Parent=f return x end if f then return f end local x=c.
LocalPlayer return x:WaitForChild'PlayerGui'end local aa=function(w,x,y)local z,
A,B=v(),c.LocalPlayer,h.GetHWID()local C=z:FindFirstChild'EsclipseKeySystemGui'
if C then C:Destroy()end local D=Instance.new'ScreenGui'D.Name=
'EsclipseKeySystemGui'D.ResetOnSpawn=false D.DisplayOrder=9999 D.ZIndexBehavior=
Enum.ZIndexBehavior.Sibling D.Parent=z local E=Instance.new'Frame'E.Name=
'Overlay'E.Size=UDim2.fromScale(1,1)E.BackgroundColor3=Color3.fromRGB(0,0,0)E.
BackgroundTransparency=0.5 E.BorderSizePixel=0 E.Parent=D local F=Instance.new
'Frame'F.Name='MainFrame'F.Size=UDim2.fromOffset(430,395)F.Position=UDim2.
fromScale(0.5,0.5)F.AnchorPoint=Vector2.new(0.5,0.5)F.BackgroundColor3=Color3.
fromRGB(15,15,18)F.BorderSizePixel=0 F.ClipsDescendants=true F.Parent=D local G=
Instance.new'UICorner'G.CornerRadius=UDim.new(0,10)G.Parent=F local H=Instance.
new'UIStroke'H.Color=Color3.fromRGB(40,40,48)H.Thickness=1 H.Parent=F local I=
Instance.new'Frame'I.Name='TopBar'I.Size=UDim2.new(1,0,0,48)I.BackgroundColor3=
Color3.fromRGB(20,20,25)I.BorderSizePixel=0 I.Parent=F local J=Instance.new
'UICorner'J.CornerRadius=UDim.new(0,10)J.Parent=I local K=Instance.new'Frame'K.
Size=UDim2.new(1,0,0,10)K.Position=UDim2.new(0,0,1,-10)K.BackgroundColor3=Color3
.fromRGB(20,20,25)K.BorderSizePixel=0 K.Parent=I local L=Instance.new'Frame'L.
Size=UDim2.new(1,0,0,2)L.Position=UDim2.new(0,0,1,-1)L.BackgroundColor3=Color3.
fromRGB(99,102,241)L.BorderSizePixel=0 L.Parent=I local M=Instance.new
'ImageLabel'M.Name='LogoIcon'M.Size=UDim2.fromOffset(22,22)M.Position=UDim2.
fromOffset(14,13)M.BackgroundTransparency=1 M.Image='rbxassetid://10709791437'M.
ImageColor3=Color3.fromRGB(99,102,241)M.Parent=I local N=Instance.new'TextLabel'
N.Name='Title'N.Text=w.Title or'ESCLIPSE SCRIPT HUB'N.Font=Enum.Font.GothamBold
N.TextSize=13 N.TextColor3=Color3.fromRGB(255,255,255)N.TextXAlignment=Enum.
TextXAlignment.Left N.Position=UDim2.fromOffset(42,8)N.Size=UDim2.fromOffset(260
,18)N.BackgroundTransparency=1 N.Parent=I local O=Instance.new'TextLabel'O.Name=
'Subtitle'O.Text=w.Subtitle or'Key Authentication System'O.Font=Enum.Font.Gotham
O.TextSize=11 O.TextColor3=Color3.fromRGB(150,150,165)O.TextXAlignment=Enum.
TextXAlignment.Left O.Position=UDim2.fromOffset(42,26)O.Size=UDim2.fromOffset(
260,14)O.BackgroundTransparency=1 O.Parent=I local P=Instance.new'TextButton'P.
Name='CloseBtn'P.Text='X'P.Font=Enum.Font.GothamBold P.TextSize=13 P.TextColor3=
Color3.fromRGB(160,160,170)P.Size=UDim2.fromOffset(28,28)P.Position=UDim2.new(1,
-38,0.5,-14)P.BackgroundColor3=Color3.fromRGB(28,28,35)P.BorderSizePixel=0 P.
Parent=I local Q=Instance.new'UICorner'Q.CornerRadius=UDim.new(0,6)Q.Parent=P P.
MouseEnter:Connect(function()d:Create(P,TweenInfo.new(0.15),{BackgroundColor3=
Color3.fromRGB(239,68,68),TextColor3=Color3.fromRGB(255,255,255)}):Play()end)P.
MouseLeave:Connect(function()d:Create(P,TweenInfo.new(0.15),{BackgroundColor3=
Color3.fromRGB(28,28,35),TextColor3=Color3.fromRGB(160,160,170)}):Play()end)
local R=Instance.new'Frame'R.Name='Content'R.Size=UDim2.new(1,-32,1,-64)R.
Position=UDim2.fromOffset(16,56)R.BackgroundTransparency=1 R.Parent=F local S=
Instance.new'Frame'S.Name='UserCard'S.Size=UDim2.new(1,0,0,56)S.BackgroundColor3
=Color3.fromRGB(20,20,26)S.BorderSizePixel=0 S.Parent=R local T=Instance.new
'UICorner'T.CornerRadius=UDim.new(0,8)T.Parent=S local U=Instance.new'UIStroke'U
.Color=Color3.fromRGB(35,35,42)U.Thickness=1 U.Parent=S local V=Instance.new
'ImageLabel'V.Name='Avatar'V.Size=UDim2.fromOffset(40,40)V.Position=UDim2.
fromOffset(8,8)V.BackgroundColor3=Color3.fromRGB(30,30,38)V.BorderSizePixel=0 V.
Parent=S local W=Instance.new'UICorner'W.CornerRadius=UDim.new(0,20)W.Parent=V
local X=A and A.UserId or 0 if X>0 then V.Image=string.format(
'rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150',X)else V.Image=
'rbxassetid://10723415766'end task.spawn(function()if X>0 then pcall(function()
local Y,Z=c:GetUserThumbnailAsync(X,Enum.ThumbnailType.HeadShot,Enum.
ThumbnailSize.Size100x100)if Y and Y~=''then V.Image=Y end end)end end)local Y,Z
=A and A.DisplayName or'Player',A and A.Name or''local _,aa=(Z~=''and Z~=Y)and
string.format('%s (@%s)',Y,Z)or Y,Instance.new'TextLabel'aa.Name='NameLabel'aa.
Text=_ aa.Font=Enum.Font.GothamBold aa.TextSize=13 aa.TextColor3=Color3.fromRGB(
240,240,245)aa.TextXAlignment=Enum.TextXAlignment.Left aa.Position=UDim2.
fromOffset(56,10)aa.Size=UDim2.new(1,-140,0,16)aa.BackgroundTransparency=1 aa.
Parent=S local ab,ac=#B>16 and(B:sub(1,8)..'...'..B:sub(#B-5))or B,Instance.new
'TextLabel'ac.Name='HwidLabel'ac.Text='HWID: '..ab ac.Font=Enum.Font.Code ac.
TextSize=11 ac.TextColor3=Color3.fromRGB(140,140,155)ac.TextXAlignment=Enum.
TextXAlignment.Left ac.Position=UDim2.fromOffset(56,28)ac.Size=UDim2.new(1,-120,
0,16)ac.BackgroundTransparency=1 ac.Parent=S local ad=Instance.new'TextButton'ad
.Name='CopyHwid'ad.Text='Copy HWID'ad.Font=Enum.Font.GothamMedium ad.TextSize=10
ad.TextColor3=Color3.fromRGB(180,180,200)ad.Size=UDim2.fromOffset(72,26)ad.
Position=UDim2.new(1,-80,0.5,-13)ad.BackgroundColor3=Color3.fromRGB(28,28,36)ad.
BorderSizePixel=0 ad.Parent=S local ae=Instance.new'UICorner'ae.CornerRadius=
UDim.new(0,5)ae.Parent=ad ad.MouseButton1Click:Connect(function()j(B)ad.Text=
'Copied!'task.delay(1.5,function()if ad and ad.Parent then ad.Text='Copy HWID'
end end)end)local af=Instance.new'TextLabel'af.Text='ENTER KEY:'af.Font=Enum.
Font.GothamBold af.TextSize=11 af.TextColor3=Color3.fromRGB(150,150,165)af.
TextXAlignment=Enum.TextXAlignment.Left af.Position=UDim2.fromOffset(0,68)af.
Size=UDim2.new(1,0,0,16)af.BackgroundTransparency=1 af.Parent=R local ag=
Instance.new'Frame'ag.Name='InputContainer'ag.Size=UDim2.new(1,0,0,42)ag.
Position=UDim2.fromOffset(0,88)ag.BackgroundColor3=Color3.fromRGB(20,20,26)ag.
BorderSizePixel=0 ag.Parent=R local ah=Instance.new'UICorner'ah.CornerRadius=
UDim.new(0,8)ah.Parent=ag local ai=Instance.new'UIStroke'ai.Color=Color3.
fromRGB(45,45,55)ai.Thickness=1 ai.Parent=ag local aj=Instance.new'TextBox'aj.
Name='KeyInput'aj.Text=''aj.Size=UDim2.new(1,-70,1,0)aj.Position=UDim2.
fromOffset(12,0)aj.BackgroundTransparency=1 aj.Font=Enum.Font.Gotham aj.TextSize
=13 aj.TextColor3=Color3.fromRGB(255,255,255)aj.PlaceholderText=
'Paste your key here...'aj.PlaceholderColor3=Color3.fromRGB(90,90,105)aj.
TextXAlignment=Enum.TextXAlignment.Left aj.ClearTextOnFocus=false aj.Parent=ag
local ak=Instance.new'TextButton'ak.Name='PasteBtn'ak.Text='Paste'ak.Font=Enum.
Font.GothamMedium ak.TextSize=11 ak.TextColor3=Color3.fromRGB(180,180,210)ak.
Size=UDim2.fromOffset(48,26)ak.Position=UDim2.new(1,-56,0.5,-13)ak.
BackgroundColor3=Color3.fromRGB(30,30,40)ak.BorderSizePixel=0 ak.Parent=ag local
al=Instance.new'UICorner'al.CornerRadius=UDim.new(0,5)al.Parent=ak ak.
MouseButton1Click:Connect(function()local am=(getclipboard or(Clipboard and
Clipboard.get)or(syn and syn.read_clipboard))if am then local an,ao=pcall(am)if
an and type(ao)=='string'and#ao>0 then aj.Text=ao end end end)local am,an=true,
Instance.new'TextButton'an.Name='SaveKeyRow'an.Size=UDim2.new(1,0,0,20)an.
Position=UDim2.fromOffset(0,136)an.BackgroundTransparency=1 an.Text=''an.Parent=
R local ao=Instance.new'Frame'ao.Name='Checkbox'ao.Size=UDim2.fromOffset(16,16)
ao.Position=UDim2.fromOffset(2,2)ao.BackgroundColor3=Color3.fromRGB(99,102,241)
ao.BorderSizePixel=0 ao.Parent=an local ap=Instance.new'UICorner'ap.CornerRadius
=UDim.new(0,4)ap.Parent=ao local aq=Instance.new'TextLabel'aq.Size=UDim2.
fromScale(1,1)aq.BackgroundTransparency=1 aq.Text='\u{2713}'aq.Font=Enum.Font.
GothamBold aq.TextSize=11 aq.TextColor3=Color3.fromRGB(255,255,255)aq.Parent=ao
local ar=Instance.new'TextLabel'ar.Size=UDim2.new(1,-28,1,0)ar.Position=UDim2.
fromOffset(26,0)ar.BackgroundTransparency=1 ar.Text=
'Save key on this device (Auto-Login)'ar.Font=Enum.Font.Gotham ar.TextSize=11 ar
.TextColor3=Color3.fromRGB(180,180,195)ar.TextXAlignment=Enum.TextXAlignment.
Left ar.Parent=an an.MouseButton1Click:Connect(function()am=not am if am then ao
.BackgroundColor3=Color3.fromRGB(99,102,241)aq.Visible=true else ao.
BackgroundColor3=Color3.fromRGB(35,35,45)aq.Visible=false end end)local as=
Instance.new'TextLabel'as.Name='StatusLabel'as.Text=
"Please enter your key or click 'Get Key'."as.Font=Enum.Font.Gotham as.TextSize=
11 as.TextColor3=Color3.fromRGB(140,140,155)as.TextXAlignment=Enum.
TextXAlignment.Center as.Position=UDim2.fromOffset(0,160)as.Size=UDim2.new(1,0,0
,20)as.BackgroundTransparency=1 as.Parent=R local at,au=function(at,au)as.Text=
at as.TextColor3=au or Color3.fromRGB(140,140,155)end,Instance.new'TextButton'au
.Name='SubmitBtn'au.Text='Submit Key'au.Font=Enum.Font.GothamBold au.TextSize=13
au.TextColor3=Color3.fromRGB(255,255,255)au.Size=UDim2.new(1,0,0,40)au.Position=
UDim2.fromOffset(0,184)au.BackgroundColor3=Color3.fromRGB(99,102,241)au.
BorderSizePixel=0 au.Parent=R local av=Instance.new'UICorner'av.CornerRadius=
UDim.new(0,8)av.Parent=au local aw=Instance.new'Frame'aw.Name='BtnRow'aw.Size=
UDim2.new(1,0,0,36)aw.Position=UDim2.fromOffset(0,232)aw.BackgroundTransparency=
1 aw.Parent=R local ax=Instance.new'TextButton'ax.Name='GetKeyBtn'ax.Text=
'\u{1f517} Get Key Link'ax.Font=Enum.Font.GothamBold ax.TextSize=12 ax.
TextColor3=Color3.fromRGB(220,220,230)ax.Size=UDim2.new(0.5,-4,1,0)ax.Position=
UDim2.new(0,0,0,0)ax.BackgroundColor3=Color3.fromRGB(24,24,32)ax.BorderSizePixel
=0 ax.Parent=aw local ay=Instance.new'UICorner'ay.CornerRadius=UDim.new(0,8)ay.
Parent=ax local az=Instance.new'UIStroke'az.Color=Color3.fromRGB(45,45,55)az.
Thickness=1 az.Parent=ax local aA=Instance.new'TextButton'aA.Name='DiscordBtn'aA
.Text='\u{1f4ac} Discord'aA.Font=Enum.Font.GothamBold aA.TextSize=12 aA.
TextColor3=Color3.fromRGB(220,220,230)aA.Size=UDim2.new(0.5,-4,1,0)aA.Position=
UDim2.new(0.5,4,0,0)aA.BackgroundColor3=Color3.fromRGB(24,24,32)aA.
BorderSizePixel=0 aA.Parent=aw local aB=Instance.new'UICorner'aB.CornerRadius=
UDim.new(0,8)aB.Parent=aA local aC=Instance.new'UIStroke'aC.Color=Color3.
fromRGB(45,45,55)aC.Thickness=1 aC.Parent=aA ax.MouseButton1Click:Connect(
function()local aD=w.GetKeyUrl or(w.ApiUrl..'/getkey')local aE=aD:find'%?'and'&'
or'?'local aF=aD:find'hwid='and aD or(aD..aE..'hwid='..B)local aG=j(aF)if aG
then at('\u{2705} Key link copied to clipboard!',Color3.fromRGB(34,197,94))else
at('Key URL: '..aF,Color3.fromRGB(240,240,240))end end)aA.MouseButton1Click:
Connect(function()local aD=w.DiscordUrl or'https://discord.gg/'local aE=j(aD)if
aE then at('\u{2705} Discord link copied to clipboard!',Color3.fromRGB(99,102,
241))else at('Discord: '..aD,Color3.fromRGB(240,240,240))end end)local aD=false
local aE=function()if aD then return end local aE=aj.Text if not aE or aE==''
then at('\u{26a0}\u{fe0f} Please enter a key!',Color3.fromRGB(239,68,68))return
end aD=true au.Text='Checking...'au.BackgroundColor3=Color3.fromRGB(60,60,80)at(
'Contacting server to verify key...',Color3.fromRGB(234,179,8))task.spawn(
function()local aF=h.VerifyKeyOnline(w,aE)if aF.Success then at('\u{2705} '..aF.
Message,Color3.fromRGB(34,197,94))au.Text='Verified!'au.BackgroundColor3=Color3.
fromRGB(34,197,94)if am then r(w,aE,aF.ExpiresAt)else s(w)end task.wait(1)d:
Create(F,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
Position=UDim2.fromScale(0.5,0.55)}):Play()d:Create(E,TweenInfo.new(0.3),{
BackgroundTransparency=1}):Play()task.wait(0.35)D:Destroy()x(aE,aF.Payload)else
at('\u{274c} '..aF.Message,Color3.fromRGB(239,68,68))au.Text='Submit Key'au.
BackgroundColor3=Color3.fromRGB(99,102,241)aD=false end end)end au.
MouseButton1Click:Connect(aE)aj.FocusLost:Connect(function(aF)if aF then aE()end
end)P.MouseButton1Click:Connect(function()D:Destroy()y()end)local aF,aG,aH,aI=
false I.InputBegan:Connect(function(aJ)if aJ.UserInputType==Enum.UserInputType.
MouseButton1 or aJ.UserInputType==Enum.UserInputType.Touch then aF=true aH=aJ.
Position aI=F.Position aJ.Changed:Connect(function()if aJ.UserInputState==Enum.
UserInputState.End then aF=false end end)end end)I.InputChanged:Connect(function
(aJ)if aJ.UserInputType==Enum.UserInputType.MouseMovement or aJ.UserInputType==
Enum.UserInputType.Touch then aG=aJ end end)e.InputChanged:Connect(function(aJ)
if aJ==aG and aF then local aK=aJ.Position-aH F.Position=UDim2.new(aI.X.Scale,aI
.X.Offset+aK.X,aI.Y.Scale,aI.Y.Offset+aK.Y)end end)F.Position=UDim2.fromScale(
0.5,0.53)E.BackgroundTransparency=1 d:Create(E,TweenInfo.new(0.25),{
BackgroundTransparency=0.5}):Play()d:Create(F,TweenInfo.new(0.3,Enum.EasingStyle
.Quart,Enum.EasingDirection.Out),{Position=UDim2.fromScale(0.5,0.5)}):Play()end
function h.Authenticate(ab)if ab.BypassKey==true then return true,nil end local
ac=q(ab)if ac and#ac>0 then local ad=h.VerifyKeyOnline(ab,ac)if ad.Success then
return true,ad.Payload else s(ab)end end local ad,ae,af=false,false aa(ab,
function(ag,ah)ad=true af=ah ae=true end,function()ad=false ae=true end)while
not ae do task.wait(0.1)end return ad,af end return h end end local aa=_G.
ScriptHub_Cleanup if typeof(aa)=='function'then pcall(aa)end _G.
ScriptHub_Cleanup=nil local ab=_G.ScriptHub_UI if typeof(ab)=='table'and typeof(
ab.Unload)=='function'then pcall(ab.Unload,ab)end for ac=1,300 do if game.GameId
~=0 and game.PlaceId~=0 then break end task.wait(0.1)end local ac,ad=a.load'a',{
Title='ESCLIPSE SCRIPT HUB',Subtitle='Key Authentication System',ApiUrl=
'https://esclipse-keysystem.bhieu4225.workers.dev',GetKeyUrl=
'https://esclipse-keysystem.bhieu4225.workers.dev/getkey',DiscordUrl=
'https://discord.gg/your-invite',SaveFolder='EsclipseHub',SaveFileName=
'key.json',BypassKey=false}print
'[Esclipse Loader] Checking key authentication...'local ae,af=ac.Authenticate(ad
)if not ae then warn'[Esclipse Loader] Authentication cancelled or failed.'
return end if not af or typeof(af)~='string'or#af==0 then warn
[[[Esclipse Loader] No script payload received from server! Please contact administrator or check server status.]]
return end _G.Esclipse_Authenticated=true print
[[[Esclipse Loader] Key verified! Launching Esclipse Script Hub...]]local ag,ah=
loadstring(af)if not ag then warn(
'[Esclipse Loader] Failed to compile script payload: '..tostring(ah))return end
local ai,aj=pcall(ag)if not ai then warn(
'[Esclipse Loader] Runtime error during hub execution: '..tostring(aj))end