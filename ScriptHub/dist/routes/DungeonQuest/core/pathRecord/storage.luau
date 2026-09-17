local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b,c,d,e=game:GetService
'Players',game:GetService'UserInputService',game:GetService'RunService',game:
GetService'VirtualInputManager'local f=b.LocalPlayer if not f then local g=os.
clock()+5 repeat f=b.LocalPlayer if f then break end task.wait(0.1)until os.
clock()>g end return{Players=b,UserInputService=c,RunService=d,
VirtualInputManager=e,player=f}end function a.b()local b={Options={},Folder=
'Maclib',contextData={},GetService=function(b)return cloneref and cloneref(game:
GetService(b))or game:GetService(b)end}local c,d,e,f,g,h,i=b.GetService
'TweenService',b.GetService'RunService',b.GetService'HttpService',b.GetService
'ContentProvider',b.GetService'UserInputService',b.GetService'Lighting',b.
GetService'Players'local j,k,l,m,n,o,p,q,r,s,t=d:IsStudio(),i.LocalPlayer,{},0,
false,{interFont='rbxassetid://12187365364',userInfoBlurred=
'rbxassetid://18824089198',toggleBackground='rbxassetid://18772190202',
togglerHead='rbxassetid://18772309008',buttonImage='rbxassetid://10709791437',
searchIcon='rbxassetid://86737463322606',colorWheel='rbxassetid://2849458409',
colorTarget='rbxassetid://73265255323268',grid='rbxassetid://121484455191370',
globe='rbxassetid://108952102602834',transform='rbxassetid://90336395745819',
dropdown='rbxassetid://18865373378',sliderbar='rbxassetid://18772615246',
sliderhead='rbxassetid://18772834246'},function()pcall(function()local j=
setthreadidentity or set_thread_identity or setidentity or(syn and syn.
set_thread_identity)if j then local k=pcall(j,7)if not k then pcall(j,8)end end
end)end b.Elevate=p local u,v=function()p()local u=Instance.new'ScreenGui'u.
ScreenInsets=Enum.ScreenInsets.None u.ResetOnSpawn=false u.ZIndexBehavior=Enum.
ZIndexBehavior.Sibling u.DisplayOrder=2147483647 local v=d:IsStudio()and k:
FindFirstChild'PlayerGui'or(gethui and gethui())or(cloneref and cloneref(b.
GetService'CoreGui')or b.GetService'CoreGui')u.Parent=v return u end,function(u,
v,w)p()local x,y=pcall(c.Create,c,u,v,w)if x and y then return y end if w and
typeof(u)=='Instance'then for z,A in pairs(w)do pcall(function()u[z]=A end)end
end return{Play=function()end,Cancel=function()end,Pause=function()end,Completed
={Wait=function()end}}end function b:Window(w)local x={Settings=w}if w.
AcrylicBlur~=nil then r=w.AcrylicBlur else r=true end local y,z=u(),Instance.new
'Frame'z.Name='Notifications'z.BackgroundColor3=Color3.fromRGB(255,255,255)z.
BackgroundTransparency=1 z.BorderColor3=Color3.fromRGB(0,0,0)z.BorderSizePixel=0
z.Size=UDim2.fromScale(1,1)z.Parent=y z.ZIndex=2 local A=Instance.new
'UIListLayout'A.Name='NotificationsUIListLayout'A.Padding=UDim.new(0,10)A.
HorizontalAlignment=Enum.HorizontalAlignment.Right A.SortOrder=Enum.SortOrder.
LayoutOrder A.VerticalAlignment=Enum.VerticalAlignment.Bottom A.Parent=z local B
=Instance.new'UIPadding'B.Name='NotificationsUIPadding'B.PaddingBottom=UDim.new(
0,10)B.PaddingLeft=UDim.new(0,10)B.PaddingRight=UDim.new(0,10)B.PaddingTop=UDim.
new(0,10)B.Parent=z local C=Instance.new'Frame'C.Name='Base'C.AnchorPoint=
Vector2.new(0.5,0.5)C.BackgroundColor3=Color3.fromRGB(15,15,15)C.
BackgroundTransparency=w.AcrylicBlur and 0.05 or 0 C.BorderColor3=Color3.
fromRGB(0,0,0)C.BorderSizePixel=0 C.Position=UDim2.fromScale(0.5,0.5)C.Size=w.
Size or UDim2.fromOffset(868,650)local D=Instance.new'UIScale'D.Name=
'BaseUIScale'D.Parent=C local E=Instance.new'UICorner'E.Name='BaseUICorner'E.
CornerRadius=UDim.new(0,10)E.Parent=C local F=Instance.new'UIStroke'F.Name=
'BaseUIStroke'F.ApplyStrokeMode=Enum.ApplyStrokeMode.Border F.Color=Color3.
fromRGB(255,255,255)F.Transparency=0.9 F.Parent=C local G=Instance.new'Frame'G.
Name='Sidebar'G.BackgroundColor3=Color3.fromRGB(255,255,255)G.
BackgroundTransparency=1 G.BorderColor3=Color3.fromRGB(0,0,0)G.BorderSizePixel=0
G.Position=UDim2.fromScale(-3.5199999999999996E-8,4.69e-8)G.Size=w.SidebarWidth
and UDim2.new(0,w.SidebarWidth,1,0)or UDim2.fromScale(0.325,1)local H=Instance.
new'Frame'H.Name='Divider'H.AnchorPoint=Vector2.new(1,0)H.BackgroundColor3=
Color3.fromRGB(255,255,255)H.BackgroundTransparency=0.9 H.BorderColor3=Color3.
fromRGB(0,0,0)H.BorderSizePixel=0 H.Position=UDim2.fromScale(1,0)H.Size=UDim2.
new(0,1,1,0)H.Parent=G local I=Instance.new'TextButton'I.Name='DividerInteract'I
.AnchorPoint=Vector2.new(0.5,0)I.BackgroundColor3=Color3.fromRGB(255,255,255)I.
BackgroundTransparency=1 I.BorderColor3=Color3.fromRGB(0,0,0)I.BorderSizePixel=0
I.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'I.Position=
UDim2.fromScale(0.5,0)I.Size=UDim2.new(1,6,1,0)I.Text=''I.TextColor3=Color3.
fromRGB(0,0,0)I.TextSize=14 I.Parent=H local J=Instance.new'Frame'J.Name=
'WindowControls'J.BackgroundColor3=Color3.fromRGB(255,255,255)J.
BackgroundTransparency=1 J.BorderColor3=Color3.fromRGB(0,0,0)J.BorderSizePixel=0
J.Size=UDim2.new(1,0,0,31)local K=Instance.new'Frame'K.Name='Controls'K.
BackgroundColor3=Color3.fromRGB(119,174,94)K.BackgroundTransparency=1 K.
BorderColor3=Color3.fromRGB(0,0,0)K.BorderSizePixel=0 K.Size=UDim2.fromScale(1,1
)local L=Instance.new'UIListLayout'L.Name='UIListLayout'L.Padding=UDim.new(0,5)L
.FillDirection=Enum.FillDirection.Horizontal L.SortOrder=Enum.SortOrder.
LayoutOrder L.VerticalAlignment=Enum.VerticalAlignment.Center L.Parent=K local M
=Instance.new'UIPadding'M.Name='UIPadding'M.PaddingLeft=UDim.new(0,11)M.Parent=K
local N,O={sizes={enabled=UDim2.fromOffset(8,8),disabled=UDim2.fromOffset(7,7)},
transparencies={enabled=0,disabled=1},strokeTransparency=0.9},Instance.new
'UIStroke'O.Name='BaseUIStroke'O.ApplyStrokeMode=Enum.ApplyStrokeMode.Border O.
Color=Color3.fromRGB(255,255,255)O.Transparency=N.strokeTransparency local P=
Instance.new'TextButton'P.Name='Exit'P.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'P.Text=''P.TextColor3=Color3.
fromRGB(0,0,0)P.TextSize=14 P.AutoButtonColor=false P.BackgroundColor3=Color3.
fromRGB(250,93,86)P.BorderColor3=Color3.fromRGB(0,0,0)P.BorderSizePixel=0 local
Q=Instance.new'UICorner'Q.Name='UICorner'Q.CornerRadius=UDim.new(1,0)Q.Parent=P
P.Parent=K local R=Instance.new'TextButton'R.Name='Minimize'R.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'R.Text=''R.TextColor3=Color3.
fromRGB(0,0,0)R.TextSize=14 R.AutoButtonColor=false R.BackgroundColor3=Color3.
fromRGB(252,190,57)R.BorderColor3=Color3.fromRGB(0,0,0)R.BorderSizePixel=0 R.
LayoutOrder=1 local S=Instance.new'UICorner'S.Name='UICorner'S.CornerRadius=UDim
.new(1,0)S.Parent=R R.Parent=K local T=Instance.new'TextButton'T.Name='Maximize'
T.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'T.Text=''T.
TextColor3=Color3.fromRGB(0,0,0)T.TextSize=14 T.AutoButtonColor=false T.
BackgroundColor3=Color3.fromRGB(119,174,94)T.BorderColor3=Color3.fromRGB(0,0,0)T
.BorderSizePixel=0 T.LayoutOrder=1 local U=Instance.new'UICorner'U.Name=
'UICorner'U.CornerRadius=UDim.new(1,0)U.Parent=T T.Parent=K local V=function(V,W
)local X,Y=W and N.sizes.enabled or N.sizes.disabled,W and N.transparencies.
enabled or N.transparencies.disabled V.Size=X V.BackgroundTransparency=Y V.
Active=W V.Interactable=W for Z,_ in ipairs(V:GetChildren())do if _:IsA
'UIStroke'then _.Transparency=Y end end if not W then O:Clone().Parent=V end end
V(T,false)local W={P,R}for X,Y in pairs(W)do local Z,_=Y.Name,true if w.
DisabledWindowControls and table.find(w.DisabledWindowControls,Z)then _=false
end V(Y,_)end K.Parent=J local X=Instance.new'Frame'X.Name='Divider'X.
AnchorPoint=Vector2.new(0,1)X.BackgroundColor3=Color3.fromRGB(255,255,255)X.
BackgroundTransparency=0.9 X.BorderColor3=Color3.fromRGB(0,0,0)X.BorderSizePixel
=0 X.Position=UDim2.fromScale(0,1)X.Size=UDim2.new(1,0,0,1)X.Parent=J J.Parent=G
local Y=Instance.new'Frame'Y.Name='Information'Y.BackgroundColor3=Color3.
fromRGB(255,255,255)Y.BackgroundTransparency=1 Y.BorderColor3=Color3.fromRGB(0,0
,0)Y.BorderSizePixel=0 Y.Position=UDim2.fromOffset(0,31)Y.Size=UDim2.new(1,0,0,
60)local Z=Instance.new'Frame'Z.Name='Divider'Z.AnchorPoint=Vector2.new(0,1)Z.
BackgroundColor3=Color3.fromRGB(255,255,255)Z.BackgroundTransparency=0.9 Z.
BorderColor3=Color3.fromRGB(0,0,0)Z.BorderSizePixel=0 Z.Position=UDim2.
fromScale(0,1)Z.Size=UDim2.new(1,0,0,1)Z.Parent=Y local _=Instance.new'Frame'_.
Name='InformationHolder'_.BackgroundColor3=Color3.fromRGB(255,255,255)_.
BackgroundTransparency=1 _.BorderColor3=Color3.fromRGB(0,0,0)_.BorderSizePixel=0
_.Size=UDim2.fromScale(1,1)local aa=Instance.new'UIPadding'aa.Name=
'InformationHolderUIPadding'aa.PaddingBottom=UDim.new(0,10)aa.PaddingLeft=UDim.
new(0,23)aa.PaddingRight=UDim.new(0,22)aa.PaddingTop=UDim.new(0,10)aa.Parent=_
local ab=Instance.new'ImageButton'ab.Name='GlobalSettingsButton'ab.Image=o.globe
ab.ImageTransparency=0.5 ab.AnchorPoint=Vector2.new(1,0.5)ab.BackgroundColor3=
Color3.fromRGB(255,255,255)ab.BackgroundTransparency=1 ab.BorderColor3=Color3.
fromRGB(0,0,0)ab.BorderSizePixel=0 ab.Position=UDim2.fromScale(1,0.5)ab.Size=
UDim2.fromOffset(16,16)ab.Parent=_ local ac=function(ac)if ac=='Default'then v(
ab,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{ImageTransparency=0.5}):Play()
elseif ac=='Hover'then v(ab,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
ImageTransparency=0.3}):Play()end end ab.MouseEnter:Connect(function()ac'Hover'
end)ab.MouseLeave:Connect(function()ac'Default'end)local ad=Instance.new'Frame'
ad.Name='TitleFrame'ad.BackgroundColor3=Color3.fromRGB(255,255,255)ad.
BackgroundTransparency=1 ad.BorderColor3=Color3.fromRGB(0,0,0)ad.BorderSizePixel
=0 ad.Size=UDim2.fromScale(1,1)local ae=Instance.new'TextLabel'ae.Name='Title'ae
.FontFace=Font.new(o.interFont,Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)ae
.Text=w.Title ae.TextColor3=Color3.fromRGB(255,255,255)ae.RichText=true ae.
TextSize=18 ae.TextTransparency=0.1 ae.TextTruncate=Enum.TextTruncate.SplitWord
ae.TextXAlignment=Enum.TextXAlignment.Left ae.TextYAlignment=Enum.TextYAlignment
.Top ae.AutomaticSize=Enum.AutomaticSize.Y ae.BackgroundColor3=Color3.fromRGB(
255,255,255)ae.BackgroundTransparency=1 ae.BorderColor3=Color3.fromRGB(0,0,0)ae.
BorderSizePixel=0 ae.Size=UDim2.new(1,-20,0,0)ae.Parent=ad local af=Instance.new
'TextLabel'af.Name='Subtitle'af.FontFace=Font.new(o.interFont,Enum.FontWeight.
Medium,Enum.FontStyle.Normal)af.RichText=true af.Text=w.Subtitle af.RichText=
true af.TextColor3=Color3.fromRGB(255,255,255)af.TextSize=12 af.TextTransparency
=0.7 af.TextTruncate=Enum.TextTruncate.SplitWord af.TextXAlignment=Enum.
TextXAlignment.Left af.TextYAlignment=Enum.TextYAlignment.Top af.AutomaticSize=
Enum.AutomaticSize.Y af.BackgroundColor3=Color3.fromRGB(255,255,255)af.
BackgroundTransparency=1 af.BorderColor3=Color3.fromRGB(0,0,0)af.BorderSizePixel
=0 af.LayoutOrder=1 af.Size=UDim2.new(1,-20,0,0)af.Parent=ad local ag=Instance.
new'UIListLayout'ag.Name='TitleFrameUIListLayout'ag.Padding=UDim.new(0,3)ag.
SortOrder=Enum.SortOrder.LayoutOrder ag.VerticalAlignment=Enum.VerticalAlignment
.Center ag.Parent=ad ad.Parent=_ _.Parent=Y Y.Parent=G local ah=Instance.new
'Frame'ah.Name='SidebarGroup'ah.BackgroundColor3=Color3.fromRGB(255,255,255)ah.
BackgroundTransparency=1 ah.BorderColor3=Color3.fromRGB(0,0,0)ah.BorderSizePixel
=0 ah.Position=UDim2.fromOffset(0,91)ah.Size=UDim2.new(1,0,1,-91)local ai=
Instance.new'Frame'ai.Name='UserInfo'ai.AnchorPoint=Vector2.new(0,1)ai.
BackgroundColor3=Color3.fromRGB(255,255,255)ai.BackgroundTransparency=1 ai.
BorderColor3=Color3.fromRGB(0,0,0)ai.BorderSizePixel=0 ai.Position=UDim2.
fromScale(0,1)ai.Size=UDim2.new(1,0,0,107)local aj=Instance.new'Frame'aj.Name=
'InformationGroup'aj.BackgroundColor3=Color3.fromRGB(255,255,255)aj.
BackgroundTransparency=1 aj.BorderColor3=Color3.fromRGB(0,0,0)aj.BorderSizePixel
=0 aj.Size=UDim2.fromScale(1,1)local ak=Instance.new'UIPadding'ak.Name=
'InformationGroupUIPadding'ak.PaddingBottom=UDim.new(0,17)ak.PaddingLeft=UDim.
new(0,25)ak.Parent=aj local al=Instance.new'UIListLayout'al.Name=
'InformationGroupUIListLayout'al.FillDirection=Enum.FillDirection.Horizontal al.
SortOrder=Enum.SortOrder.LayoutOrder al.VerticalAlignment=Enum.VerticalAlignment
.Center al.Parent=aj local am,an,ao=k.UserId,Enum.ThumbnailType.AvatarBust,Enum.
ThumbnailSize.Size48x48 local ap,aq=i:GetUserThumbnailAsync(am,an,ao)local ar=
Instance.new'ImageLabel'ar.Name='Headshot'ar.BackgroundColor3=Color3.fromRGB(255
,255,255)ar.BackgroundTransparency=1 ar.BorderColor3=Color3.fromRGB(0,0,0)ar.
BorderSizePixel=0 ar.Size=UDim2.fromOffset(32,32)ar.Image=(aq and ap)or
'rbxassetid://0'local as=Instance.new'UICorner'as.Name='UICorner'as.CornerRadius
=UDim.new(1,0)as.Parent=ar local at=Instance.new'UIStroke'at.Name='BaseUIStroke'
at.ApplyStrokeMode=Enum.ApplyStrokeMode.Border at.Color=Color3.fromRGB(255,255,
255)at.Transparency=0.9 at.Parent=ar ar.Parent=aj local au=Instance.new'Frame'au
.Name='UserAndDisplayFrame'au.BackgroundColor3=Color3.fromRGB(255,255,255)au.
BackgroundTransparency=1 au.BorderColor3=Color3.fromRGB(0,0,0)au.BorderSizePixel
=0 au.LayoutOrder=1 au.Size=UDim2.new(1,-42,0,32)local av=Instance.new
'TextLabel'av.Name='DisplayName'av.FontFace=Font.new(o.interFont,Enum.FontWeight
.SemiBold,Enum.FontStyle.Normal)av.Text=k.DisplayName av.TextColor3=Color3.
fromRGB(255,255,255)av.TextSize=13 av.TextTransparency=0.1 av.TextTruncate=Enum.
TextTruncate.SplitWord av.TextXAlignment=Enum.TextXAlignment.Left av.
TextYAlignment=Enum.TextYAlignment.Top av.AutomaticSize=Enum.AutomaticSize.XY av
.BackgroundColor3=Color3.fromRGB(255,255,255)av.BackgroundTransparency=1 av.
BorderColor3=Color3.fromRGB(0,0,0)av.BorderSizePixel=0 av.Parent=au av.Size=
UDim2.fromScale(1,0)local aw=Instance.new'UIPadding'aw.Name=
'UserAndDisplayFrameUIPadding'aw.PaddingLeft=UDim.new(0,8)aw.PaddingTop=UDim.
new(0,3)aw.Parent=au local ax=Instance.new'UIListLayout'ax.Name=
'UserAndDisplayFrameUIListLayout'ax.Padding=UDim.new(0,1)ax.SortOrder=Enum.
SortOrder.LayoutOrder ax.Parent=au local ay=Instance.new'TextLabel'ay.Name=
'Username'ay.FontFace=Font.new(o.interFont,Enum.FontWeight.SemiBold,Enum.
FontStyle.Normal)ay.Text='@'..k.Name ay.TextColor3=Color3.fromRGB(255,255,255)ay
.TextSize=12 ay.TextTransparency=0.7 ay.TextTruncate=Enum.TextTruncate.SplitWord
ay.TextXAlignment=Enum.TextXAlignment.Left ay.TextYAlignment=Enum.TextYAlignment
.Top ay.AutomaticSize=Enum.AutomaticSize.XY ay.BackgroundColor3=Color3.fromRGB(
255,255,255)ay.BackgroundTransparency=1 ay.BorderColor3=Color3.fromRGB(0,0,0)ay.
BorderSizePixel=0 ay.LayoutOrder=1 ay.Parent=au ay.Size=UDim2.fromScale(1,0)au.
Parent=aj aj.Parent=ai local az=Instance.new'UIPadding'az.Name=
'UserInfoUIPadding'az.PaddingLeft=UDim.new(0,10)az.PaddingRight=UDim.new(0,10)az
.Parent=ai ai.Parent=ah local aA=Instance.new'UIPadding'aA.Name=
'SidebarGroupUIPadding'aA.PaddingLeft=UDim.new(0,10)aA.PaddingRight=UDim.new(0,
10)aA.PaddingTop=UDim.new(0,31)aA.Parent=ah local aB=Instance.new'Frame'aB.Name=
'TabSwitchers'aB.BackgroundColor3=Color3.fromRGB(255,255,255)aB.
BackgroundTransparency=1 aB.BorderColor3=Color3.fromRGB(0,0,0)aB.BorderSizePixel
=0 aB.Size=UDim2.new(1,0,1,-107)local aC=Instance.new'ScrollingFrame'aC.Name=
'TabSwitchersScrollingFrame'aC.AutomaticCanvasSize=Enum.AutomaticSize.Y aC.
BottomImage=''aC.CanvasSize=UDim2.new()aC.ScrollBarImageTransparency=0.8 aC.
ScrollBarThickness=1 aC.TopImage=''aC.BackgroundColor3=Color3.fromRGB(255,255,
255)aC.BackgroundTransparency=1 aC.BorderColor3=Color3.fromRGB(0,0,0)aC.
BorderSizePixel=0 aC.Size=UDim2.fromScale(1,1)local aD=Instance.new
'UIListLayout'aD.Name='TabSwitchersScrollingFrameUIListLayout'aD.Padding=UDim.
new(0,17)aD.SortOrder=Enum.SortOrder.LayoutOrder aD.Parent=aC local aE=Instance.
new'UIPadding'aE.Name='TabSwitchersScrollingFrameUIPadding'aE.PaddingTop=UDim.
new(0,2)aE.Parent=aC aC.Parent=aB aB.Parent=ah ah.Parent=G G.Parent=C local aF=
Instance.new'Frame'aF.Name='Content'aF.AnchorPoint=Vector2.new(1,0)aF.
BackgroundColor3=Color3.fromRGB(255,255,255)aF.BackgroundTransparency=1 aF.
BorderColor3=Color3.fromRGB(0,0,0)aF.BorderSizePixel=0 aF.Position=UDim2.
fromScale(1,4.69e-8)aF.Size=UDim2.new(0,(C.AbsoluteSize.X-G.AbsoluteSize.X),1,0)
local aG,aH,aI,aJ,aK,aL=false,G.AbsoluteSize.X,20,107 local aM,aN=C.AbsoluteSize
.X-aJ,{DefaultTransparency=0.9,HoverTransparency=0.85,EasingStyle=Enum.
EasingStyle.Sine}local aO=function(aO)v(H,TweenInfo.new(0.2,aN.EasingStyle),{
BackgroundTransparency=aO=='Idle'and aN.DefaultTransparency or aN.
HoverTransparency}):Play()end I.MouseEnter:Connect(function()aO'Hover'end)I.
MouseLeave:Connect(function()aO'Idle'end)I.MouseButton1Down:Connect(function()aG
=true aK=g:GetMouseLocation().X aL=G.AbsoluteSize.X end)g.InputEnded:Connect(
function(aP)if aP.UserInputType==Enum.UserInputType.MouseButton1 then aG=false
end end)g.InputChanged:Connect(function(aP)if aG and aP.UserInputType==Enum.
UserInputType.MouseMovement then local aQ=g:GetMouseLocation().X-aK local aR=aL+
aQ if math.abs(aR-aH)<aI then aR=aH else aR=math.clamp(aR,aJ,aM)end G.Size=UDim2
.new(0,aR,1,0)aF.Size=UDim2.new(0,C.AbsoluteSize.X-aR,1,0)end end)local aP=
Instance.new'Frame'aP.Name='Topbar'aP.BackgroundColor3=Color3.fromRGB(255,255,
255)aP.BackgroundTransparency=1 aP.BorderColor3=Color3.fromRGB(0,0,0)aP.
BorderSizePixel=0 aP.Size=UDim2.new(1,0,0,63)local aQ=Instance.new'Frame'aQ.Name
='Divider'aQ.AnchorPoint=Vector2.new(0,1)aQ.BackgroundColor3=Color3.fromRGB(255,
255,255)aQ.BackgroundTransparency=0.9 aQ.BorderColor3=Color3.fromRGB(0,0,0)aQ.
BorderSizePixel=0 aQ.Position=UDim2.fromScale(0,1)aQ.Size=UDim2.new(1,0,0,1)aQ.
Parent=aP local aR=Instance.new'Frame'aR.Name='Elements'aR.BackgroundColor3=
Color3.fromRGB(255,255,255)aR.BackgroundTransparency=1 aR.BorderColor3=Color3.
fromRGB(0,0,0)aR.BorderSizePixel=0 aR.Size=UDim2.fromScale(1,1)local aS=Instance
.new'UIPadding'aS.Name='UIPadding'aS.PaddingLeft=UDim.new(0,20)aS.PaddingRight=
UDim.new(0,20)aS.Parent=aR local aT=Instance.new'ImageButton'aT.Name='MoveIcon'
aT.Image=o.transform aT.ImageTransparency=0.7 aT.AnchorPoint=Vector2.new(1,0.5)
aT.BackgroundColor3=Color3.fromRGB(255,255,255)aT.BackgroundTransparency=1 aT.
BorderColor3=Color3.fromRGB(0,0,0)aT.BorderSizePixel=0 aT.Position=UDim2.
fromScale(1,0.5)aT.Size=UDim2.fromOffset(15,15)aT.Parent=aR aT.Visible=not w.
DragStyle or w.DragStyle==1 local aU=Instance.new'TextButton'aU.Name='Interact'
aU.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'aU.Text=''aU.
TextColor3=Color3.fromRGB(0,0,0)aU.TextSize=14 aU.AnchorPoint=Vector2.new(0.5,
0.5)aU.BackgroundColor3=Color3.fromRGB(255,255,255)aU.BackgroundTransparency=1
aU.BorderColor3=Color3.fromRGB(0,0,0)aU.BorderSizePixel=0 aU.Position=UDim2.
fromScale(0.5,0.5)aU.Size=UDim2.fromOffset(40,40)aU.Parent=aT local aV=function(
aV)if aV=='Default'then v(aT,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
ImageTransparency=0.7}):Play()elseif aV=='Hover'then v(aT,TweenInfo.new(0.2,Enum
.EasingStyle.Sine),{ImageTransparency=0.4}):Play()end end aU.MouseEnter:Connect(
function()aV'Hover'end)aU.MouseLeave:Connect(function()aV'Default'end)local aW,
aX,aY,aZ=false local a_,a0,a1=function(a_)local a0=a_.Position-aY C.Position=
UDim2.new(aZ.X.Scale,aZ.X.Offset+a0.X,aZ.Y.Scale,aZ.Y.Offset+a0.Y)end,function(
a_)if a_.UserInputType==Enum.UserInputType.MouseButton1 or a_.UserInputType==
Enum.UserInputType.Touch then aW=true aY=a_.Position aZ=C.Position a_.Changed:
Connect(function()if a_.UserInputState==Enum.UserInputState.End then aW=false
end end)end end,function(a_)if aW and(a_.UserInputType==Enum.UserInputType.
MouseMovement or a_.UserInputType==Enum.UserInputType.Touch)then aX=a_ end end
if not w.DragStyle or w.DragStyle==1 then aU.InputBegan:Connect(function(a2)if
a2.UserInputType==Enum.UserInputType.MouseButton1 or a2.UserInputType==Enum.
UserInputType.Touch then a0(a2)end end)aU.InputChanged:Connect(a1)g.InputChanged
:Connect(function(a2)if a2==aX and aW then a_(a2)end end)aU.InputEnded:Connect(
function(a2)if a2.UserInputType==Enum.UserInputType.MouseButton1 or a2.
UserInputType==Enum.UserInputType.Touch then aW=false end end)elseif w.DragStyle
==2 then C.InputBegan:Connect(function(a2)if a2.UserInputType==Enum.
UserInputType.MouseButton1 or a2.UserInputType==Enum.UserInputType.Touch then
a0(a2)end end)C.InputChanged:Connect(a1)g.InputChanged:Connect(function(a2)if a2
==aX and aW then a_(a2)end end)C.InputEnded:Connect(function(a2)if a2.
UserInputType==Enum.UserInputType.MouseButton1 or a2.UserInputType==Enum.
UserInputType.Touch then aW=false end end)end local a2=Instance.new'TextLabel'a2
.Name='CurrentTab'a2.FontFace=Font.new(o.interFont)a2.RichText=true a2.Text=''a2
.RichText=true a2.TextColor3=Color3.fromRGB(255,255,255)a2.TextSize=15 a2.
TextTransparency=0.5 a2.TextTruncate=Enum.TextTruncate.SplitWord a2.
TextXAlignment=Enum.TextXAlignment.Left a2.TextYAlignment=Enum.TextYAlignment.
Top a2.AnchorPoint=Vector2.new(0,0.5)a2.AutomaticSize=Enum.AutomaticSize.Y a2.
BackgroundColor3=Color3.fromRGB(255,255,255)a2.BackgroundTransparency=1 a2.
BorderColor3=Color3.fromRGB(0,0,0)a2.BorderSizePixel=0 a2.Position=UDim2.
fromScale(0,0.5)a2.Size=UDim2.fromScale(0.9,0)a2.Parent=aR aR.Parent=aP aP.
Parent=aF aF.Parent=C local a3=Instance.new'Frame'a3.Name='GlobalSettings'a3.
AutomaticSize=Enum.AutomaticSize.XY a3.BackgroundColor3=Color3.fromRGB(15,15,15)
a3.BorderColor3=Color3.fromRGB(0,0,0)a3.BorderSizePixel=0 a3.Position=UDim2.
fromScale(0.298,0.104)local a4=Instance.new'UIStroke'a4.Name=
'GlobalSettingsUIStroke'a4.ApplyStrokeMode=Enum.ApplyStrokeMode.Border a4.Color=
Color3.fromRGB(255,255,255)a4.Transparency=0.9 a4.Parent=a3 local a5=Instance.
new'UICorner'a5.Name='GlobalSettingsUICorner'a5.CornerRadius=UDim.new(0,10)a5.
Parent=a3 local a6=Instance.new'UIPadding'a6.Name='GlobalSettingsUIPadding'a6.
PaddingBottom=UDim.new(0,10)a6.PaddingTop=UDim.new(0,10)a6.Parent=a3 local a7=
Instance.new'UIListLayout'a7.Name='GlobalSettingsUIListLayout'a7.Padding=UDim.
new(0,5)a7.SortOrder=Enum.SortOrder.LayoutOrder a7.Parent=a3 local a8=Instance.
new'UIScale'a8.Name='GlobalSettingsUIScale'a8.Scale=1e-7 a8.Parent=a3 a3.Parent=
C C.Parent=y function x:UpdateTitle(a9)ae.Text=a9 end function x:UpdateSubtitle(
a9)af.Text=a9 end local a9,ba=a8.Scale==1 and true or false local bb=function()
if not a9 then local bb=v(a8,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum
.EasingDirection.Out),{Scale=1})bb:Play()bb.Completed:Wait()a9=true elseif a9
then local bb=v(a8,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=0})bb:Play()bb.Completed:Wait()a9=false end end ab.
MouseButton1Click:Connect(function()if not s then return end bb()end)a3.
MouseEnter:Connect(function()ba=true end)a3.MouseLeave:Connect(function()ba=
false end)g.InputEnded:Connect(function(bc)if bc.UserInputType==Enum.
UserInputType.MouseButton1 and a9 and not ba then bb()end end)local bc,bd,be,bf,
bg=C,e,workspace.CurrentCamera,'Glass',{}local bh,bi=(bd:GenerateGUID(true))for
bj,bk in pairs(h:GetChildren())do if not bk:IsA'DepthOfFieldEffect'and bk:HasTag
'.'then bi=Instance.new'DepthOfFieldEffect'bi.FarIntensity=0 bi.FocusDistance=
51.6 bi.InFocusRadius=50 bi.NearIntensity=1 bi.Name=bd:GenerateGUID(true)bi:
AddTag'.'elseif bk:IsA'DepthOfFieldEffect'and bk:HasTag'.'then bi=bk end end if
not bi then bi=Instance.new'DepthOfFieldEffect'bi.FarIntensity=0 bi.
FocusDistance=51.6 bi.InFocusRadius=50 bi.NearIntensity=1 bi.Name=bd:
GenerateGUID(true)bi:AddTag'.'end local bj=Instance.new'Frame'bj.Parent=bc bj.
Size=UDim2.new(0.97,0,0.97,0)bj.Position=UDim2.new(0.5,0,0.5,0)bj.AnchorPoint=
Vector2.new(0.5,0.5)bj.BackgroundTransparency=1 bj.Name=bd:GenerateGUID(true)do
local bk=function(bk)return bk==bk end local bl=bk(be:ScreenPointToRay(0,0).
Origin.x)while not bl do d.RenderStepped:Wait()bl=bk(be:ScreenPointToRay(0,0).
Origin.x)end end local bk do local bl,bm,bn,bo,bp=math.acos,math.max,math.pi,
math.sqrt,0.2 local bq=function(bq,br,bs,bt,bu)local bv,bw,bx=(bq-br).magnitude,
(br-bs).magnitude,(bs-bq).magnitude local by,bz,bA,bB=(bm(bv,bw,bx))if bv==by
then bz,bA,bB=bq,br,bs elseif bw==by then bz,bA,bB=br,bs,bq elseif bx==by then
bz,bA,bB=bs,bq,br end local bC=((bA-bz).x*(bB-bz).x+(bA-bz).y*(bB-bz).y+(bA-bz).
z*(bB-bz).z)/(bz-bA).magnitude local bD,bE,bF,bG=bo((bB-bz).magnitude^2-bC*bC),(
bz-bA).magnitude-bC,CFrame.new(bA,bz),CFrame.Angles(bn/2,0,0)local bH=bF local
bI,bJ=(bH*bG).lookVector,bz+CFrame.new(bz,bA).lookVector*bC local bK=CFrame.new(
bJ,bB).lookVector local bL=bI.x*bK.x+bI.y*bK.y+bI.z*bK.z local bM=CFrame.Angles(
0,0,bl(bL))bH=bH*bM if((bH*bG).lookVector-bK).magnitude>0.01 then bH=bH*CFrame.
Angles(0,0,-2*bl(bL))end bH=bH*CFrame.new(0,bD/2,-(bE+bC/2))local bN=bF*bM*
CFrame.Angles(0,bn,0)if((bN*bG).lookVector-bK).magnitude>0.01 then bN=bN*CFrame.
Angles(0,0,2*bl(bL))end bN=bN*CFrame.new(0,bD/2,bE/2)if not bt then bt=Instance.
new'Part'bt.FormFactor='Custom'bt.TopSurface=0 bt.BottomSurface=0 bt.Anchored=
true bt.CanCollide=false bt.CastShadow=false bt.Material=bf bt.Size=Vector3.new(
bp,bp,bp)bt.Name=bd:GenerateGUID(true)local bO=Instance.new('SpecialMesh',bt)bO.
MeshType=2 bO.Name=bh end bt[bh].Scale=Vector3.new(0,bD/bp,bC/bp)bt.CFrame=bH if
not bu then bu=bt:clone()end bu[bh].Scale=Vector3.new(0,bD/bp,bE/bp)bu.CFrame=bN
return bt,bu end function bk(br,bs,bt,bu,bv)bv[1],bv[2]=bq(br,bs,bt,bv[1],bv[2])
bv[3],bv[4]=bq(bt,bs,bu,bv[3],bv[4])end end if bg[bj]then return bg[bj].parts
end local bl,bm={},{}do local function bn(bo)if bo:IsA'GuiObject'then bm[#bm+1]=
bo bn(bo.Parent)end end bn(bj)end local bn=function(bn)while bn do if bn:IsA
'GuiObject'then if not bn.Visible then return false end elseif bn:IsA'ScreenGui'
then if not bn.Enabled then return false end break end bn=bn.Parent end return
true end local bo=function(bo)if not bn(bj)or not r or n then for bp,bq in
pairs(bl)do bq.Parent=nil bi.Enabled=false bi.Parent=nil end return end if not
bi.Parent then bi.Parent=h end bi.Enabled=true local bp,bq,br,bs={Transparency=
0.98,BrickColor=BrickColor.new'Institutional white'},1-0.05*bj.ZIndex,bj.
AbsolutePosition,bj.AbsolutePosition+bj.AbsoluteSize local bt,bu=Vector2.new(bs.
x,br.y),Vector2.new(br.x,bs.y)do local bv=0 for bw,bx in ipairs(bm)do bv=bv+bx.
Rotation end if bv~=0 and bv%180~=0 then local bw,bx,by=br:lerp(bs,0.5),math.
sin(math.rad(bv)),math.cos(math.rad(bv))br=Vector2.new(by*(br.x-bw.x)-bx*(br.y-
bw.y),bx*(br.x-bw.x)+by*(br.y-bw.y))+bw bt=Vector2.new(by*(bt.x-bw.x)-bx*(bt.y-
bw.y),bx*(bt.x-bw.x)+by*(bt.y-bw.y))+bw bu=Vector2.new(by*(bu.x-bw.x)-bx*(bu.y-
bw.y),bx*(bu.x-bw.x)+by*(bu.y-bw.y))+bw bs=Vector2.new(by*(bs.x-bw.x)-bx*(bs.y-
bw.y),bx*(bs.x-bw.x)+by*(bs.y-bw.y))+bw end end bk(be:ScreenPointToRay(br.x,br.y
,bq).Origin,be:ScreenPointToRay(bt.x,bt.y,bq).Origin,be:ScreenPointToRay(bu.x,bu
.y,bq).Origin,be:ScreenPointToRay(bs.x,bs.y,bq).Origin,bl)if bo then for bv,bw
in pairs(bl)do bw.Parent=be end for bv,bw in pairs(bp)do for bx,by in pairs(bl)
do by[bv]=bw end end end end bo(true)d.RenderStepped:Connect(bo)function x:
GlobalSetting(bp)s=true local bq,br={},Instance.new'TextButton'br.Name=
'GlobalSetting'br.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'br.Text=''br.TextColor3=Color3.
fromRGB(0,0,0)br.TextSize=14 br.BackgroundColor3=Color3.fromRGB(255,255,255)br.
BackgroundTransparency=1 br.BorderColor3=Color3.fromRGB(0,0,0)br.BorderSizePixel
=0 br.Size=UDim2.fromOffset(200,30)local bs=Instance.new'UIPadding'bs.Name=
'GlobalSettingToggleUIPadding'bs.PaddingLeft=UDim.new(0,15)bs.Parent=br local bt
=Instance.new'TextLabel'bt.Name='SettingName'bt.FontFace=Font.new(o.interFont)bt
.Text=bp.Name bt.RichText=true bt.TextColor3=Color3.fromRGB(255,255,255)bt.
TextSize=13 bt.TextTransparency=0.5 bt.TextTruncate=Enum.TextTruncate.SplitWord
bt.TextXAlignment=Enum.TextXAlignment.Left bt.TextYAlignment=Enum.TextYAlignment
.Top bt.AnchorPoint=Vector2.new(0,0.5)bt.AutomaticSize=Enum.AutomaticSize.Y bt.
BackgroundColor3=Color3.fromRGB(255,255,255)bt.BackgroundTransparency=1 bt.
BorderColor3=Color3.fromRGB(0,0,0)bt.BorderSizePixel=0 bt.Position=UDim2.
fromScale(1.3e-7,0.5)bt.Size=UDim2.new(1,-40,0,0)bt.Parent=br local bu=Instance.
new'UIListLayout'bu.Name='GlobalSettingToggleUIListLayout'bu.Padding=UDim.new(0,
10)bu.FillDirection=Enum.FillDirection.Horizontal bu.SortOrder=Enum.SortOrder.
LayoutOrder bu.VerticalAlignment=Enum.VerticalAlignment.Center bu.Parent=br
local bv=Instance.new'TextLabel'bv.Name='Checkmark'bv.FontFace=Font.new(o.
interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)bv.Text='\u{2713}'bv.
TextColor3=Color3.fromRGB(255,255,255)bv.TextSize=13 bv.TextTransparency=1 bv.
TextXAlignment=Enum.TextXAlignment.Left bv.TextYAlignment=Enum.TextYAlignment.
Top bv.AnchorPoint=Vector2.new(0,0.5)bv.AutomaticSize=Enum.AutomaticSize.Y bv.
BackgroundColor3=Color3.fromRGB(255,255,255)bv.BackgroundTransparency=1 bv.
BorderColor3=Color3.fromRGB(0,0,0)bv.BorderSizePixel=0 bv.LayoutOrder=-1 bv.
Position=UDim2.fromScale(1.3e-7,0.5)bv.Size=UDim2.fromOffset(-10,0)bv.Parent=br
br.Parent=a3 local bw={duration=0.2,easingStyle=Enum.EasingStyle.Quint,
transparencyIn=0.2,transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-
bu.Padding.Offset,waitTime=1}local bx={checkIn=v(bv,TweenInfo.new(bw.duration,bw
.easingStyle),{Size=UDim2.new(bv.Size.X.Scale,bw.checkSizeIncrease,bv.Size.Y.
Scale,bv.Size.Y.Offset)}),checkOut=v(bv,TweenInfo.new(bw.duration,bw.easingStyle
),{Size=UDim2.new(bv.Size.X.Scale,bw.checkSizeDecrease,bv.Size.Y.Scale,bv.Size.Y
.Offset)}),nameIn=v(bt,TweenInfo.new(bw.duration,bw.easingStyle),{
TextTransparency=bw.transparencyIn}),nameOut=v(bt,TweenInfo.new(bw.duration,bw.
easingStyle),{TextTransparency=bw.transparencyOut})}local by,bz=function(by)if
not by then bx.checkOut:Play()bx.nameOut:Play()bv:GetPropertyChangedSignal
'AbsoluteSize':Connect(function()if bv.AbsoluteSize.X<=0 then bv.
TextTransparency=1 end end)else bx.checkIn:Play()bx.nameIn:Play()bv:
GetPropertyChangedSignal'AbsoluteSize':Connect(function()if bv.AbsoluteSize.X>0
then bv.TextTransparency=0 end end)end end,bp.Default by(bz)br.MouseButton1Click
:Connect(function()bz=not bz by(bz)task.spawn(function()if bp.Callback then bp.
Callback(bz)end end)end)function bq:UpdateName(bA)bt.Text=bA end function bq:
UpdateState(bA)by(bA)bz=bA end return bq end function x:TabGroup()local bp,bq={}
,Instance.new'Frame'bq.Name='Section'bq.AutomaticSize=Enum.AutomaticSize.Y bq.
BackgroundColor3=Color3.fromRGB(255,255,255)bq.BackgroundTransparency=1 bq.
BorderColor3=Color3.fromRGB(0,0,0)bq.BorderSizePixel=0 bq.Size=UDim2.fromScale(1
,0)local br=Instance.new'Frame'br.Name='Divider'br.AnchorPoint=Vector2.new(0.5,1
)br.BackgroundColor3=Color3.fromRGB(255,255,255)br.BackgroundTransparency=0.9 br
.BorderColor3=Color3.fromRGB(0,0,0)br.BorderSizePixel=0 br.Position=UDim2.
fromScale(0.5,1)br.Size=UDim2.new(1,-21,0,1)br.Parent=bq local bs=Instance.new
'Frame'bs.Name='SectionTabSwitchers'bs.BackgroundColor3=Color3.fromRGB(255,255,
255)bs.BackgroundTransparency=1 bs.BorderColor3=Color3.fromRGB(0,0,0)bs.
BorderSizePixel=0 bs.Size=UDim2.fromScale(1,1)local bt=Instance.new
'UIListLayout'bt.Name='UIListLayout'bt.Padding=UDim.new(0,15)bt.
HorizontalAlignment=Enum.HorizontalAlignment.Center bt.SortOrder=Enum.SortOrder.
LayoutOrder bt.Parent=bs local bu=Instance.new'UIPadding'bu.Name='UIPadding'bu.
PaddingBottom=UDim.new(0,15)bu.Parent=bs bs.Parent=bq bq.Parent=aC function bp:
Tab(bv)local bw,bx={Settings=bv},Instance.new'TextButton'bx.Name='TabSwitcher'bx
.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'bx.Text=''bx.
TextColor3=Color3.fromRGB(0,0,0)bx.TextSize=14 bx.AutoButtonColor=false bx.
AnchorPoint=Vector2.new(0.5,0)bx.BackgroundColor3=Color3.fromRGB(255,255,255)bx.
BackgroundTransparency=1 bx.BorderColor3=Color3.fromRGB(0,0,0)bx.BorderSizePixel
=0 bx.Position=UDim2.fromScale(0.5,0)bx.Size=UDim2.new(1,-21,0,40)m+=1 bx.
LayoutOrder=m local by=Instance.new'UICorner'by.Name='TabSwitcherUICorner'by.
Parent=bx local bz=Instance.new'UIStroke'bz.Name='TabSwitcherUIStroke'bz.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border bz.Color=Color3.fromRGB(255,255,255)
bz.Transparency=1 bz.Parent=bx local bA=Instance.new'UIListLayout'bA.Name=
'TabSwitcherUIListLayout'bA.Padding=UDim.new(0,9)bA.FillDirection=Enum.
FillDirection.Horizontal bA.SortOrder=Enum.SortOrder.LayoutOrder bA.
VerticalAlignment=Enum.VerticalAlignment.Center bA.Parent=bx local bB if bv.
Image then bB=Instance.new'ImageLabel'bB.Name='TabImage'bB.Image=bv.Image bB.
ImageTransparency=0.5 bB.BackgroundColor3=Color3.fromRGB(255,255,255)bB.
BackgroundTransparency=1 bB.BorderColor3=Color3.fromRGB(0,0,0)bB.BorderSizePixel
=0 bB.Size=UDim2.fromOffset(18,18)bB.Parent=bx end local bC=Instance.new
'TextLabel'bC.Name='TabSwitcherName'bC.FontFace=Font.new(o.interFont,Enum.
FontWeight.Medium,Enum.FontStyle.Normal)bC.Text=bv.Name bC.RichText=true bC.
TextColor3=Color3.fromRGB(255,255,255)bC.TextSize=16 bC.TextTransparency=0.5 bC.
TextTruncate=Enum.TextTruncate.SplitWord bC.TextXAlignment=Enum.TextXAlignment.
Left bC.TextYAlignment=Enum.TextYAlignment.Top bC.AutomaticSize=Enum.
AutomaticSize.Y bC.BackgroundColor3=Color3.fromRGB(255,255,255)bC.
BackgroundTransparency=1 bC.BorderColor3=Color3.fromRGB(0,0,0)bC.BorderSizePixel
=0 bC.Size=UDim2.fromScale(1,0)bC.Parent=bx bC.LayoutOrder=1 local bD=Instance.
new'UIPadding'bD.Name='TabSwitcherUIPadding'bD.PaddingLeft=UDim.new(0,24)bD.
PaddingRight=UDim.new(0,35)bD.PaddingTop=UDim.new(0,1)bD.Parent=bx bx.Parent=bs
local bE=Instance.new'Frame'bE.Name='Elements'bE.BackgroundColor3=Color3.
fromRGB(255,255,255)bE.BackgroundTransparency=1 bE.BorderColor3=Color3.fromRGB(0
,0,0)bE.BorderSizePixel=0 bE.Position=UDim2.fromOffset(0,63)bE.Size=UDim2.new(1,
0,1,-63)bE.ClipsDescendants=true local bF=Instance.new'UIPadding'bF.Name=
'ElementsUIPadding'bF.PaddingRight=UDim.new(0,5)bF.PaddingTop=UDim.new(0,10)bF.
PaddingBottom=UDim.new(0,10)bF.Parent=bE local bG=Instance.new'ScrollingFrame'bG
.Name='ElementsScrolling'bG.AutomaticCanvasSize=Enum.AutomaticSize.Y bG.
BottomImage=''bG.CanvasSize=UDim2.new()bG.ScrollBarImageTransparency=0.5 bG.
ScrollBarThickness=1 bG.TopImage=''bG.BackgroundColor3=Color3.fromRGB(255,255,
255)bG.BackgroundTransparency=1 bG.BorderColor3=Color3.fromRGB(0,0,0)bG.
BorderSizePixel=0 bG.Size=UDim2.fromScale(1,1)bG.ClipsDescendants=false local bH
=Instance.new'UIPadding'bH.Name='ElementsScrollingUIPadding'bH.PaddingBottom=
UDim.new(0,5)bH.PaddingLeft=UDim.new(0,11)bH.PaddingRight=UDim.new(0,3)bH.
PaddingTop=UDim.new(0,5)bH.Parent=bG local bI=Instance.new'UIListLayout'bI.Name=
'ElementsScrollingUIListLayout'bI.Padding=UDim.new(0,15)bI.FillDirection=Enum.
FillDirection.Horizontal bI.SortOrder=Enum.SortOrder.LayoutOrder bI.Parent=bG
local bJ=Instance.new'Frame'bJ.Name='Left'bJ.AutomaticSize=Enum.AutomaticSize.Y
bJ.BackgroundColor3=Color3.fromRGB(0,0,0)bJ.BackgroundTransparency=1 bJ.
BorderColor3=Color3.fromRGB(0,0,0)bJ.BorderSizePixel=0 bJ.Position=UDim2.
fromScale(0.512,0)bJ.Size=UDim2.new(0.5,-10,0,0)local bK=Instance.new
'UIListLayout'bK.Name='LeftUIListLayout'bK.Padding=UDim.new(0,15)bK.SortOrder=
Enum.SortOrder.LayoutOrder bK.Parent=bJ bJ.Parent=bG local bL=Instance.new
'Frame'bL.Name='Right'bL.AutomaticSize=Enum.AutomaticSize.Y bL.BackgroundColor3=
Color3.fromRGB(0,0,0)bL.BackgroundTransparency=1 bL.BorderColor3=Color3.fromRGB(
0,0,0)bL.BorderSizePixel=0 bL.LayoutOrder=1 bL.Position=UDim2.fromScale(0.512,0)
bL.Size=UDim2.new(0.5,-10,0,0)local bM=Instance.new'UIListLayout'bM.Name=
'RightUIListLayout'bM.Padding=UDim.new(0,15)bM.SortOrder=Enum.SortOrder.
LayoutOrder bM.Parent=bL bL.Parent=bG bG.Parent=bE function bw:Section(bN)local
bO,bP={},Instance.new'Frame'bP.Name='Section'bP.AutomaticSize=Enum.AutomaticSize
.Y bP.BackgroundColor3=Color3.fromRGB(255,255,255)bP.BackgroundTransparency=0.98
bP.BorderColor3=Color3.fromRGB(0,0,0)bP.BorderSizePixel=0 bP.Position=UDim2.
fromScale(0,6.78e-8)bP.Size=UDim2.fromScale(1,0)bP.ClipsDescendants=true bP.
Parent=bN.Side=='Left'and bJ or bL local bQ=Instance.new'UICorner'bQ.Name=
'SectionUICorner'bQ.Parent=bP local bR=Instance.new'UIStroke'bR.Name=
'SectionUIStroke'bR.ApplyStrokeMode=Enum.ApplyStrokeMode.Border bR.Color=Color3.
fromRGB(255,255,255)bR.Transparency=0.95 bR.Parent=bP local bS=Instance.new
'UIListLayout'bS.Name='SectionUIListLayout'bS.Padding=UDim.new(0,10)bS.SortOrder
=Enum.SortOrder.LayoutOrder bS.Parent=bP local bT=Instance.new'UIPadding'bT.Name
='SectionUIPadding'bT.PaddingBottom=UDim.new(0,20)bT.PaddingLeft=UDim.new(0,20)
bT.PaddingRight=UDim.new(0,18)bT.PaddingTop=UDim.new(0,22)bT.Parent=bP function
bO:Button(bU,bV)local bW,bX={Settings=bU},Instance.new'Frame'bX.Name='Button'bX.
AutomaticSize=Enum.AutomaticSize.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.
BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel
=0 bX.Size=UDim2.new(1,0,0,38)bX.Parent=bP local bY=Instance.new'TextButton'bY.
Name='ButtonInteract'bY.FontFace=Font.new(o.interFont)bY.RichText=true bY.
TextColor3=Color3.fromRGB(255,255,255)bY.TextSize=13 bY.TextTransparency=0.5 bY.
TextTruncate=Enum.TextTruncate.AtEnd bY.TextXAlignment=Enum.TextXAlignment.Left
bY.BackgroundColor3=Color3.fromRGB(255,255,255)bY.BackgroundTransparency=1 bY.
BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Size=UDim2.fromScale(1
,1)bY.Parent=bX bY.Text=bW.Settings.Name local bZ=Instance.new'ImageLabel'bZ.
Name='ButtonImage'bZ.Image=o.buttonImage bZ.ImageTransparency=0.5 bZ.AnchorPoint
=Vector2.new(1,0.5)bZ.BackgroundColor3=Color3.fromRGB(255,255,255)bZ.
BackgroundTransparency=1 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel
=0 bZ.Position=UDim2.fromScale(1,0.5)bZ.Size=UDim2.fromOffset(15,15)bZ.Parent=bX
local b_={DefaultTransparency=0.5,HoverTransparency=0.3,EasingStyle=Enum.
EasingStyle.Sine}local b0,b1=function(b0)if b0=='Idle'then v(bY,TweenInfo.new(
0.2,b_.EasingStyle),{TextTransparency=b_.DefaultTransparency}):Play()v(bZ,
TweenInfo.new(0.2,b_.EasingStyle),{ImageTransparency=b_.DefaultTransparency}):
Play()elseif b0=='Hover'then v(bY,TweenInfo.new(0.2,b_.EasingStyle),{
TextTransparency=b_.HoverTransparency}):Play()v(bZ,TweenInfo.new(0.2,b_.
EasingStyle),{ImageTransparency=b_.HoverTransparency}):Play()end end,function()
if bW.Settings.Callback then bW.Settings.Callback()end end bY.MouseEnter:
Connect(function()b0'Hover'end)bY.MouseLeave:Connect(function()b0'Idle'end)bY.
MouseButton1Click:Connect(b1)function bW:UpdateName(b2)bY.Text=b2 end function
bW:SetVisibility(b2)bX.Visible=b2 end if bV then b.Options[bV]=bW end return bW
end function bO:Toggle(bU,bV)local bW,bX={Settings=bU,IgnoreConfig=false,Class=
'Toggle'},Instance.new'Frame'bX.Name='Toggle'bX.AutomaticSize=Enum.AutomaticSize
.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.BackgroundTransparency=1 bX.
BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel=0 bX.Size=UDim2.new(1,0,0,
38)bX.Parent=bP local bY=Instance.new'TextLabel'bY.Name='ToggleName'bY.FontFace=
Font.new(o.interFont)bY.Text=bW.Settings.Name bY.RichText=true bY.TextColor3=
Color3.fromRGB(255,255,255)bY.TextSize=13 bY.TextTransparency=0.5 bY.
TextTruncate=Enum.TextTruncate.AtEnd bY.TextXAlignment=Enum.TextXAlignment.Left
bY.TextYAlignment=Enum.TextYAlignment.Top bY.AnchorPoint=Vector2.new(0,0.5)bY.
AutomaticSize=Enum.AutomaticSize.Y bY.BackgroundColor3=Color3.fromRGB(255,255,
255)bY.BackgroundTransparency=1 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.
BorderSizePixel=0 bY.Position=UDim2.fromScale(0,0.5)bY.Size=UDim2.new(1,-50,0,0)
bY.Parent=bX local bZ=Instance.new'ImageButton'bZ.Name='Toggle'bZ.Image=o.
toggleBackground bZ.ImageColor3=Color3.fromRGB(87,86,86)bZ.AutoButtonColor=false
bZ.AnchorPoint=Vector2.new(1,0.5)bZ.BackgroundColor3=Color3.fromRGB(255,255,255)
bZ.BackgroundTransparency=1 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.
BorderSizePixel=0 bZ.Position=UDim2.fromScale(1,0.5)bZ.Size=UDim2.fromOffset(41,
21)bZ.ImageTransparency=0.5 local b_=Instance.new'UIPadding'b_.Name=
'ToggleUIPadding'b_.PaddingBottom=UDim.new(0,1)b_.PaddingLeft=UDim.new(0,-2)b_.
PaddingRight=UDim.new(0,3)b_.PaddingTop=UDim.new(0,1)b_.Parent=bZ local b0=
Instance.new'ImageLabel'b0.Name='TogglerHead'b0.Image=o.togglerHead b0.
ImageColor3=Color3.fromRGB(255,255,255)b0.AnchorPoint=Vector2.new(1,0.5)b0.
BackgroundColor3=Color3.fromRGB(255,255,255)b0.BackgroundTransparency=1 b0.
BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel=0 b0.Position=UDim2.
fromScale(0.5,0.5)b0.Size=UDim2.fromOffset(15,15)b0.ZIndex=2 b0.Parent=bZ b0.
ImageTransparency=0.8 bZ.Parent=bX local b1,b2,b3,b4={Enabled=0,Disabled=0.5},{
Enabled=0,Disabled=0.85},{Info=TweenInfo.new(0.15,Enum.EasingStyle.Quad),
EnabledPosition=UDim2.new(1,0,0.5,0),DisabledPosition=UDim2.new(0.5,0,0.5,0)},bW
.Settings.Default local b5=function(b5,b6)p()local b7,b8=b5 and{b1.Enabled,b2.
Enabled}or{b1.Disabled,b2.Disabled},b5 and b3.EnabledPosition or b3.
DisabledPosition pcall(function()v(bZ,b3.Info,{ImageTransparency=b7[1]}):Play()
end)pcall(function()v(b0,b3.Info,{ImageTransparency=b7[2]}):Play()end)pcall(
function()v(b0,b3.Info,{Position=b8}):Play()end)bW.State=b5 if b6 then pcall(b6,
b4)end end b5(b4)local b6=function()b4=not b4 b5(b4,bW.Settings.Callback)end bZ.
MouseButton1Click:Connect(b6)function bW:Toggle()b6()end function bW:UpdateState
(b7,b8)b4=b7 b5(b4,not b8 and bW.Settings.Callback or nil)end function bW:
GetState()return b4 end function bW:UpdateName(b7)bY.Text=b7 end function bW:
SetVisibility(b7)bX.Visible=b7 end if bV then b.Options[bV]=bW end return bW end
function bO:Slider(bU,bV)local bW,bX={Settings=bU,IgnoreConfig=false,Class=
'Slider'},Instance.new'Frame'bX.Name='Slider'bX.AutomaticSize=Enum.AutomaticSize
.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.BackgroundTransparency=1 bX.
BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel=0 bX.Size=UDim2.new(1,0,0,
38)bX.Parent=bP local bY=Instance.new'TextLabel'bY.Name='SliderName'bY.FontFace=
Font.new(o.interFont)bY.Text=bW.Settings.Name bY.RichText=true bY.TextColor3=
Color3.fromRGB(255,255,255)bY.TextSize=13 bY.TextTransparency=0.5 bY.
TextTruncate=Enum.TextTruncate.AtEnd bY.TextXAlignment=Enum.TextXAlignment.Left
bY.TextYAlignment=Enum.TextYAlignment.Top bY.AnchorPoint=Vector2.new(0,0.5)bY.
AutomaticSize=Enum.AutomaticSize.XY bY.BackgroundColor3=Color3.fromRGB(255,255,
255)bY.BackgroundTransparency=1 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.
BorderSizePixel=0 bY.Position=UDim2.fromScale(1.3e-7,0.5)bY.Parent=bX local bZ=
Instance.new'Frame'bZ.Name='SliderElements'bZ.AnchorPoint=Vector2.new(1,0)bZ.
BackgroundColor3=Color3.fromRGB(255,255,255)bZ.BackgroundTransparency=1 bZ.
BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel=0 bZ.Position=UDim2.
fromScale(1,0)bZ.Size=UDim2.fromScale(1,1)local b_=Instance.new'TextBox'b_.Name=
'SliderValue'b_.FontFace=Font.new(o.interFont)b_.TextColor3=Color3.fromRGB(255,
255,255)b_.TextSize=12 b_.TextTransparency=0.1 b_.BackgroundColor3=Color3.
fromRGB(255,255,255)b_.BackgroundTransparency=0.95 b_.BorderColor3=Color3.
fromRGB(0,0,0)b_.BorderSizePixel=0 b_.LayoutOrder=1 b_.Position=UDim2.fromScale(
-7.89E-2,0.171)b_.Size=UDim2.fromOffset(41,21)b_.ClipsDescendants=true local b0=
Instance.new'UICorner'b0.Name='SliderValueUICorner'b0.CornerRadius=UDim.new(0,4)
b0.Parent=b_ local b1=Instance.new'UIStroke'b1.Name='SliderValueUIStroke'b1.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border b1.Color=Color3.fromRGB(255,255,255)
b1.Transparency=0.9 b1.Parent=b_ local b2=Instance.new'UIPadding'b2.Name=
'SliderValueUIPadding'b2.PaddingLeft=UDim.new(0,2)b2.PaddingRight=UDim.new(0,2)
b2.Parent=b_ b_.Parent=bZ local b3=Instance.new'UIListLayout'b3.Name=
'SliderElementsUIListLayout'b3.Padding=UDim.new(0,20)b3.FillDirection=Enum.
FillDirection.Horizontal b3.HorizontalAlignment=Enum.HorizontalAlignment.Right
b3.SortOrder=Enum.SortOrder.LayoutOrder b3.VerticalAlignment=Enum.
VerticalAlignment.Center b3.Parent=bZ local b4=Instance.new'ImageLabel'b4.Name=
'SliderBar'b4.Image=o.sliderbar b4.ImageColor3=Color3.fromRGB(87,86,86)b4.
BackgroundColor3=Color3.fromRGB(255,255,255)b4.BackgroundTransparency=1 b4.
BorderColor3=Color3.fromRGB(0,0,0)b4.BorderSizePixel=0 b4.Position=UDim2.
fromScale(0.219,0.457)b4.Size=UDim2.fromOffset(123,3)local b5=Instance.new
'ImageButton'b5.Name='SliderHead'b5.Image=o.sliderhead b5.AnchorPoint=Vector2.
new(0.5,0.5)b5.BackgroundColor3=Color3.fromRGB(255,255,255)b5.
BackgroundTransparency=1 b5.BorderColor3=Color3.fromRGB(0,0,0)b5.BorderSizePixel
=0 b5.Position=UDim2.fromScale(1,0.5)b5.Size=UDim2.fromOffset(12,12)b5.Parent=b4
b4.Parent=bZ local b6=Instance.new'UIPadding'b6.Name='SliderElementsUIPadding'b6
.PaddingTop=UDim.new(0,3)b6.Parent=bZ bZ.Parent=bX local b7,b8=false,{Hundredths
=function(b7)return string.format('%.2f',b7)end,Tenths=function(b7)return string
.format('%.1f',b7)end,Round=function(b7,b8)if b8 then return string.format('%.'
..b8..'f',b7)else return tostring(math.round(b7))end end,Degrees=function(b7,b8)
local b9=b8 and string.format('%.'..b8..'f',b7)or tostring(b7)return b9..
'\u{b0}'end,Percent=function(b7,b8)local b9=(b7-bW.Settings.Minimum)/(bW.
Settings.Maximum-bW.Settings.Minimum)*100 return b8 and string.format('%.'..b8..
'f',b9)..'%'or tostring(math.round(b9))..'%'end,Value=function(b7,b8)return b8
and string.format('%.'..b8..'f',b7)or tostring(b7)end}local b9,ca=b8[bW.Settings
.DisplayMethod]or b8.Value local cb=function(cb,cc)p()local cd if typeof(cb)==
'Instance'then local ce=cb cd=math.clamp((ce.Position.X-b4.AbsolutePosition.X)/
b4.AbsoluteSize.X,0,1)else local ce=cb cd=(ce-bW.Settings.Minimum)/(bW.Settings.
Maximum-bU.Minimum)end local ce=UDim2.new(cd,0,0.5,0)pcall(function()b5.Position
=ce end)ca=cd*(bW.Settings.Maximum-bW.Settings.Minimum)+bU.Minimum pcall(
function()b_.Text=(bU.Prefix or'')..b9(ca,bW.Settings.Precision)..(bU.Suffix or
'')end)if not cc then task.spawn(function()if bW.Settings.Callback then bW.
Settings.Callback(ca)end end)end bW.Value=ca end cb(bW.Settings.Default,true)b5.
InputBegan:Connect(function(cc)if cc.UserInputType==Enum.UserInputType.
MouseButton1 or cc.UserInputType==Enum.UserInputType.Touch then b7=true cb(cc)
end end)b5.InputEnded:Connect(function(cc)if cc.UserInputType==Enum.
UserInputType.MouseButton1 or cc.UserInputType==Enum.UserInputType.Touch then b7
=false if bW.Settings.onInputComplete then bW.Settings.onInputComplete(ca)end
end end)b_.FocusLost:Connect(function(cc)local cd=b_.Text local ce,cf=cd:match
'^(%-?%d+%.?%d*)(%%?)$'if ce then ce=tonumber(ce)cf=cf=='%'if cf then ce=bW.
Settings.Minimum+(ce/100)*(bW.Settings.Maximum-bW.Settings.Minimum)end local cg=
math.clamp(ce,bW.Settings.Minimum,bW.Settings.Maximum)cb(cg)else b_.Text=b9(ca)
end if bW.Settings.onInputComplete then bW.Settings.onInputComplete(ca)end end)g
.InputChanged:Connect(function(cc)if b7 and(cc.UserInputType==Enum.UserInputType
.MouseMovement or cc.UserInputType==Enum.UserInputType.Touch)then cb(cc)end end)
local cc=function()local cc,cd,ce,cf=b3.Padding.Offset,b_.AbsoluteSize.X,bY.
AbsoluteSize.X,bZ.AbsoluteSize.X local cg=(cf-(cc+cd+ce+20))/D.Scale b4.Size=
UDim2.new(b4.Size.X.Scale,cg,b4.Size.Y.Scale,b4.Size.Y.Offset)end cc()bY:
GetPropertyChangedSignal'AbsoluteSize':Connect(cc)bP:GetPropertyChangedSignal
'AbsoluteSize':Connect(cc)function bW:UpdateName(cd)bY=cd end function bW:
SetVisibility(cd)bX.Visible=cd end function bW:UpdateValue(cd)cb(tonumber(cd),
true)end function bW:GetValue()return ca end if bV then b.Options[bV]=bW end
return bW end function bO:Input(bU,bV)local bW,bX={Settings=bU,IgnoreConfig=
false,Class='Input'},Instance.new'Frame'bX.Name='Input'bX.AutomaticSize=Enum.
AutomaticSize.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.
BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel
=0 bX.Size=UDim2.new(1,0,0,38)bX.Parent=bP local bY=Instance.new'TextLabel'bY.
Name='InputName'bY.FontFace=Font.new(o.interFont)bY.Text=bW.Settings.Name bY.
RichText=true bY.TextColor3=Color3.fromRGB(255,255,255)bY.TextSize=13 bY.
TextTransparency=0.5 bY.TextTruncate=Enum.TextTruncate.AtEnd bY.TextXAlignment=
Enum.TextXAlignment.Left bY.TextYAlignment=Enum.TextYAlignment.Top bY.
AnchorPoint=Vector2.new(0,0.5)bY.AutomaticSize=Enum.AutomaticSize.XY bY.
BackgroundColor3=Color3.fromRGB(255,255,255)bY.BackgroundTransparency=1 bY.
BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Position=UDim2.
fromScale(0,0.5)bY.Parent=bX local bZ=Instance.new'TextBox'bZ.Name='InputBox'bZ.
FontFace=Font.new(o.interFont)bZ.Text='Hello world!'bZ.TextColor3=Color3.
fromRGB(255,255,255)bZ.TextSize=12 bZ.TextTransparency=0.1 bZ.AnchorPoint=
Vector2.new(1,0.5)bZ.AutomaticSize=Enum.AutomaticSize.X bZ.BackgroundColor3=
Color3.fromRGB(255,255,255)bZ.BackgroundTransparency=0.95 bZ.BorderColor3=Color3
.fromRGB(0,0,0)bZ.BorderSizePixel=0 bZ.ClipsDescendants=true bZ.LayoutOrder=1 bZ
.Position=UDim2.fromScale(1,0.5)bZ.Size=UDim2.fromOffset(21,21)bZ.TextXAlignment
=Enum.TextXAlignment.Right local b_=Instance.new'UICorner'b_.Name=
'InputBoxUICorner'b_.CornerRadius=UDim.new(0,4)b_.Parent=bZ local b0=Instance.
new'UIStroke'b0.Name='InputBoxUIStroke'b0.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border b0.Color=Color3.fromRGB(255,255,255)b0.Transparency=0.9 b0.Parent=bZ
local b1=Instance.new'UIPadding'b1.Name='InputBoxUIPadding'b1.PaddingLeft=UDim.
new(0,5)b1.PaddingRight=UDim.new(0,5)b1.Parent=bZ local b2=Instance.new
'UISizeConstraint'b2.Name='InputBoxUISizeConstraint'b2.Parent=bZ bZ.Parent=bX
local b3,b4,b5,b6,b7=bX,bZ,bY,b2,function(b3)if bW.Settings.CharacterLimit then
return b3:sub(1,bW.Settings.CharacterLimit)end return b3 end local b8,b9={All=
function(b8)return b7(b8)end,Numeric=function(b8)local b9=b8:match'^%-?%d*$'and
b8 or b8:gsub('[^%d-]',''):gsub('(%-)',function(b9,ca)return ca==1 and b9 or''
end)return b7(b9)end,Alphabetic=function(b8)return b7(b8:gsub('[^a-zA-Z ]',''))
end,AlphaNumeric=function(b8)return b7(b8:gsub('[^a-zA-Z0-9]',''))end}if type(bW
.Settings.AcceptedCharacters)=='function'then b9=bW.Settings.AcceptedCharacters
else b9=b8[bW.Settings.AcceptedCharacters]or b8.All end b4.AutomaticSize=Enum.
AutomaticSize.X local ca=function()local ca,cb=b5.AbsoluteSize.X,b3.AbsoluteSize
.X local cc=(cb-ca-20)/D.Scale b6.MaxSize=Vector2.new(cc,9e9)end ca()b5:
GetPropertyChangedSignal'AbsoluteSize':Connect(ca)b4.FocusLost:Connect(function(
)local cb=b4.Text local cc=b9(cb)b4.Text=cc task.spawn(function()if bW.Settings.
Callback then bW.Settings.Callback(cc)end end)end)b4.Text=bW.Settings.Default or
''b4.PlaceholderText=bW.Settings.Placeholder or''b4:GetPropertyChangedSignal
'Text':Connect(function()b4.Text=b9(b4.Text)if bW.Settings.onChanged then bW.
Settings.onChanged(b4.Text)end bW.Text=b4.Text end)function bW:UpdateName(cb)bY.
Text=cb end function bW:SetVisibility(cb)bX.Visible=cb end function bW:GetInput(
)return b4.Text end function bW:UpdatePlaceholder(cb)bZ.PlaceholderText=cb end
function bW:UpdateText(cb)local cc=b9(cb)b4.Text=cc bW.Text=cc task.spawn(
function()if bW.Settings.Callback then bW.Settings.Callback(cc)end end)end if bV
then b.Options[bV]=bW end return bW end function bO:Keybind(bU,bV)local bW,bX={
Settings=bU,IgnoreConfig=false,Class='Keybind'},Instance.new'Frame'bX.Name=
'Keybind'bX.AutomaticSize=Enum.AutomaticSize.Y bX.BackgroundColor3=Color3.
fromRGB(0,0,0)bX.BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)
bX.BorderSizePixel=0 bX.Size=UDim2.new(1,0,0,38)bX.Parent=bP local bY=Instance.
new'TextLabel'bY.Name='KeybindName'bY.FontFace=Font.new(o.interFont)bY.Text=bW.
Settings.Name bY.RichText=true bY.TextColor3=Color3.fromRGB(255,255,255)bY.
TextSize=13 bY.TextTransparency=0.5 bY.TextTruncate=Enum.TextTruncate.AtEnd bY.
TextXAlignment=Enum.TextXAlignment.Left bY.TextYAlignment=Enum.TextYAlignment.
Top bY.AnchorPoint=Vector2.new(0,0.5)bY.AutomaticSize=Enum.AutomaticSize.XY bY.
BackgroundColor3=Color3.fromRGB(255,255,255)bY.BackgroundTransparency=1 bY.
BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Position=UDim2.
fromScale(0,0.5)bY.Parent=bX local bZ=Instance.new'TextBox'bZ.Name='BinderBox'bZ
.CursorPosition=-1 bZ.FontFace=Font.new(o.interFont)bZ.PlaceholderText='...'bZ.
Text=''bZ.TextColor3=Color3.fromRGB(255,255,255)bZ.TextSize=12 bZ.
TextTransparency=0.1 bZ.AnchorPoint=Vector2.new(1,0.5)bZ.AutomaticSize=Enum.
AutomaticSize.X bZ.BackgroundColor3=Color3.fromRGB(255,255,255)bZ.
BackgroundTransparency=0.95 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.
BorderSizePixel=0 bZ.ClipsDescendants=true bZ.LayoutOrder=1 bZ.Position=UDim2.
fromScale(1,0.5)bZ.Size=UDim2.fromOffset(21,21)local b_=Instance.new'UICorner'b_
.Name='BinderBoxUICorner'b_.CornerRadius=UDim.new(0,4)b_.Parent=bZ local b0=
Instance.new'UIStroke'b0.Name='BinderBoxUIStroke'b0.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border b0.Color=Color3.fromRGB(255,255,255)b0.Transparency=0.9
b0.Parent=bZ local b1=Instance.new'UIPadding'b1.Name='BinderBoxUIPadding'b1.
PaddingLeft=UDim.new(0,5)b1.PaddingRight=UDim.new(0,5)b1.Parent=bZ local b2=
Instance.new'UISizeConstraint'b2.Name='BinderBoxUISizeConstraint'b2.Parent=bZ bZ
.Parent=bX local b3,b4,b5,b6=false,false,(bW.Settings.Default)local b7=function(
)b6=false b3=false bZ:ReleaseFocus()end if b5 then bZ.Text=b5.Name end bZ.
Focused:Connect(function()b6=true end)bZ.FocusLost:Connect(function()b6=false
end)g.InputBegan:Connect(function(b8)if b6 and not b3 then b3=true local b9 b9=g
.InputBegan:Connect(function(ca)if bW.Settings.Blacklist and(table.find(bW.
KeybindFunctions.Settings.Blacklist,ca.KeyCode)or table.find(bW.Settings.
Blacklist,ca.UserInputType))then bZ:ReleaseFocus()b7()b9:Disconnect()return end
if ca.UserInputType==Enum.UserInputType.Keyboard then b5=ca.KeyCode bZ.Text=ca.
KeyCode.Name elseif ca.UserInputType==Enum.UserInputType.MouseButton1 or ca.
UserInputType==Enum.UserInputType.MouseButton2 then b5=ca.UserInputType bZ.Text=
ca.UserInputType.Name end if bW.Settings.onBinded then bW.Settings.onBinded(b5)
end b4=true b7()b9:Disconnect()end)else if not b4 and(b8.KeyCode==b5 or b8.
UserInputType==b5)then if bW.Settings.Callback then bW.Settings.Callback(b5)end
if bW.Settings.onBindHeld then bW.Settings.onBindHeld(true,b5)end else b4=false
end end end)g.InputEnded:Connect(function(b8)if not b6 and not b3 then if b8.
KeyCode==b5 or b8.UserInputType==b5 then if bU.onBindHeld then bU.onBindHeld(
false,b5)end end end end)function bW:Bind(b8)b5=b8 bZ.Text=b8.Name end function
bW:Unbind()b5=nil bZ.Text=''end function bW:GetBind()return b5 end function bW:
UpdateName(b8)bY=b8 end function bW:SetVisibility(b8)bX.Visible=b8 end if bV
then b.Options[bV]=bW end return bW end function bO:Dropdown(bU,bV)local bW,bX,
bY,bZ={Settings=bU,IgnoreConfig=false,Class='Dropdown'},{},{},Instance.new
'Frame'bZ.Name='Dropdown'bZ.BackgroundColor3=Color3.fromRGB(255,255,255)bZ.
BackgroundTransparency=0.985 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.
BorderSizePixel=0 bZ.Size=UDim2.new(1,0,0,38)bZ.Parent=bP bZ.ClipsDescendants=
true local b_=Instance.new'UIPadding'b_.Name='DropdownUIPadding'b_.PaddingLeft=
UDim.new(0,15)b_.PaddingRight=UDim.new(0,15)b_.Parent=bZ local b0=Instance.new
'TextButton'b0.Name='Interact'b0.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'b0.Text=''b0.TextColor3=Color3.
fromRGB(0,0,0)b0.TextSize=14 b0.BackgroundColor3=Color3.fromRGB(255,255,255)b0.
BackgroundTransparency=1 b0.BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel
=0 b0.Size=UDim2.new(1,0,0,38)b0.Parent=bZ local b1=Instance.new'TextLabel'b1.
Name='DropdownName'b1.FontFace=Font.new(o.interFont)b1.Text=bU.Default and(bW.
Settings.Name..' \u{2022} '..table.concat(bX,', '))or(bW.Settings.Name..'...')b1
.RichText=true b1.TextColor3=Color3.fromRGB(255,255,255)b1.TextSize=13 b1.
TextTransparency=0.5 b1.TextTruncate=Enum.TextTruncate.SplitWord b1.
TextXAlignment=Enum.TextXAlignment.Left b1.AutomaticSize=Enum.AutomaticSize.Y b1
.BackgroundColor3=Color3.fromRGB(255,255,255)b1.BackgroundTransparency=1 b1.
BorderColor3=Color3.fromRGB(0,0,0)b1.BorderSizePixel=0 b1.Size=UDim2.new(1,-20,0
,38)b1.Parent=bZ local b2=Instance.new'UIStroke'b2.Name='DropdownUIStroke'b2.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border b2.Color=Color3.fromRGB(255,255,255)
b2.Transparency=0.95 b2.Parent=bZ local b3=Instance.new'UICorner'b3.Name=
'DropdownUICorner'b3.CornerRadius=UDim.new(0,6)b3.Parent=bZ local b4=Instance.
new'ImageLabel'b4.Name='DropdownImage'b4.Image=o.dropdown b4.ImageTransparency=
0.5 b4.AnchorPoint=Vector2.new(1,0)b4.BackgroundColor3=Color3.fromRGB(255,255,
255)b4.BackgroundTransparency=1 b4.BorderColor3=Color3.fromRGB(0,0,0)b4.
BorderSizePixel=0 b4.Position=UDim2.new(1,0,0,12)b4.Size=UDim2.fromOffset(14,14)
b4.Parent=bZ local b5=Instance.new'Frame'b5.Name='DropdownFrame'b5.
BackgroundColor3=Color3.fromRGB(255,255,255)b5.BackgroundTransparency=1 b5.
BorderColor3=Color3.fromRGB(0,0,0)b5.BorderSizePixel=0 b5.ClipsDescendants=true
b5.Size=UDim2.fromScale(1,1)b5.Visible=false b5.AutomaticSize=Enum.AutomaticSize
.Y local b6=Instance.new'UIPadding'b6.Name='DropdownFrameUIPadding'b6.PaddingTop
=UDim.new(0,38)b6.PaddingBottom=UDim.new(0,10)b6.Parent=b5 local b7=Instance.new
'UIListLayout'b7.Name='DropdownFrameUIListLayout'b7.Padding=UDim.new(0,5)b7.
SortOrder=Enum.SortOrder.LayoutOrder b7.Parent=b5 local b8=Instance.new'Frame'b8
.Name='Search'b8.BackgroundColor3=Color3.fromRGB(255,255,255)b8.
BackgroundTransparency=0.95 b8.BorderColor3=Color3.fromRGB(0,0,0)b8.
BorderSizePixel=0 b8.LayoutOrder=-1 b8.Size=UDim2.new(1,0,0,30)b8.Parent=b5 b8.
Visible=bW.Settings.Search local b9=Instance.new'UICorner'b9.Name=
'SectionUICorner'b9.Parent=b8 local ca=Instance.new'ImageLabel'ca.Name=
'SearchIcon'ca.Image=o.searchIcon ca.ImageColor3=Color3.fromRGB(180,180,180)ca.
AnchorPoint=Vector2.new(0,0.5)ca.BackgroundColor3=Color3.fromRGB(255,255,255)ca.
BackgroundTransparency=1 ca.BorderColor3=Color3.fromRGB(0,0,0)ca.BorderSizePixel
=0 ca.Position=UDim2.fromScale(0,0.5)ca.Size=UDim2.fromOffset(12,12)ca.Parent=b8
local cb=Instance.new'UIPadding'cb.Name='UIPadding'cb.PaddingLeft=UDim.new(0,15)
cb.Parent=b8 local cc=Instance.new'TextBox'cc.Name='SearchBox'cc.CursorPosition=
-1 cc.FontFace=Font.new(o.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal
)cc.PlaceholderColor3=Color3.fromRGB(150,150,150)cc.PlaceholderText='Search...'
cc.Text=''cc.TextColor3=Color3.fromRGB(200,200,200)cc.TextSize=14 cc.
TextXAlignment=Enum.TextXAlignment.Left cc.BackgroundColor3=Color3.fromRGB(255,
255,255)cc.BackgroundTransparency=1 cc.BorderColor3=Color3.fromRGB(0,0,0)cc.
BorderSizePixel=0 cc.Size=UDim2.fromScale(1,1)local cd=function()local cd,ce,cf=
0,0,b6.PaddingTop.Offset+b6.PaddingBottom.Offset for cg,ch in pairs(b5:
GetChildren())do if not ch:IsA'UIComponent'and ch.Visible then cd+=ch.
AbsoluteSize.Y ce+=1 end end local cg=b7.Padding.Offset*(ce-1)return cd+cg+cf
end local ce=function()local ce=cc.Text:lower()for cf,cg in pairs(bY)do local ch
=cg.NameLabel.Text:lower()local ci=string.find(ch,ce)~=nil if cg.Button.Visible
~=ci then cg.Button.Visible=ci end end bZ.Size=UDim2.new(1,0,0,cd())end cc:
GetPropertyChangedSignal'Text':Connect(ce)local cf=Instance.new'UIPadding'cf.
Name='UIPadding'cf.PaddingLeft=UDim.new(0,23)cf.Parent=cc cc.Parent=b8 local cg=
{duration=0.2,easingStyle=Enum.EasingStyle.Quint,transparencyIn=0.2,
transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-13,waitTime=1}local
ch,ci,cj=function(ch,ci)local cj=bY[ch]if not cj then return end local ck,cl=cj.
Checkmark,cj.NameLabel if ci then if bW.Settings.Multi then if not table.find(bX
,ch)then table.insert(bX,ch)bW.Value=bX end else for cm,cn in pairs(bY)do if cm
~=ch then v(cn.Checkmark,TweenInfo.new(cg.duration,cg.easingStyle),{Size=UDim2.
new(cn.Checkmark.Size.X.Scale,cg.checkSizeDecrease,cn.Checkmark.Size.Y.Scale,cn.
Checkmark.Size.Y.Offset)}):Play()v(cn.NameLabel,TweenInfo.new(cg.duration,cg.
easingStyle),{TextTransparency=cg.transparencyOut}):Play()cn.Checkmark.
TextTransparency=1 end end bX={ch}bW.Value=bX[1]end v(ck,TweenInfo.new(cg.
duration,cg.easingStyle),{Size=UDim2.new(ck.Size.X.Scale,cg.checkSizeIncrease,ck
.Size.Y.Scale,ck.Size.Y.Offset)}):Play()v(cl,TweenInfo.new(cg.duration,cg.
easingStyle),{TextTransparency=cg.transparencyIn}):Play()ck.TextTransparency=0
else if bW.Settings.Multi then local cm=table.find(bX,ch)if cm then table.
remove(bX,cm)end else bX={}end v(ck,TweenInfo.new(cg.duration,cg.easingStyle),{
Size=UDim2.new(ck.Size.X.Scale,cg.checkSizeDecrease,ck.Size.Y.Scale,ck.Size.Y.
Offset)}):Play()v(cl,TweenInfo.new(cg.duration,cg.easingStyle),{TextTransparency
=cg.transparencyOut}):Play()ck.TextTransparency=1 end if bU.Required and#bX==0
and not ci then return end if#bX>0 then b1.Text=bW.Settings.Name..' \u{2022} '..
table.concat(bX,', ')else b1.Text=bW.Settings.Name..'...'end end,false,false
local ck=function()if cj then return end cj=true local ck,cl=38,not ci local cm=
cl and UDim2.new(1,0,0,cd())or UDim2.new(1,0,0,ck)local cn,co=v(bZ,TweenInfo.
new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=cm}),v(b4,
TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Rotation=cl
and-90 or 0})cn:Play()co:Play()if cl then b5.Visible=true cn.Completed:Connect(
function()cj=false end)else cn.Completed:Connect(function()b5.Visible=false cj=
false end)end ci=cl end b0.MouseButton1Click:Connect(ck)local cl=function(cl,cm)
local cn=Instance.new'TextButton'cn.Name='Option'cn.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'cn.Text=''cn.TextColor3=Color3.
fromRGB(0,0,0)cn.TextSize=14 cn.BackgroundColor3=Color3.fromRGB(255,255,255)cn.
BackgroundTransparency=1 cn.BorderColor3=Color3.fromRGB(0,0,0)cn.BorderSizePixel
=0 cn.Size=UDim2.new(1,0,0,30)local co=Instance.new'UIPadding'co.Name=
'OptionUIPadding'co.PaddingLeft=UDim.new(0,15)co.Parent=cn local cp=Instance.new
'TextLabel'cp.Name='OptionName'cp.FontFace=Font.new(o.interFont)cp.Text=cm cp.
RichText=true cp.TextColor3=Color3.fromRGB(255,255,255)cp.TextSize=13 cp.
TextTransparency=0.5 cp.TextTruncate=Enum.TextTruncate.AtEnd cp.TextXAlignment=
Enum.TextXAlignment.Left cp.TextYAlignment=Enum.TextYAlignment.Top cp.
AnchorPoint=Vector2.new(0,0.5)cp.AutomaticSize=Enum.AutomaticSize.XY cp.
BackgroundColor3=Color3.fromRGB(255,255,255)cp.BackgroundTransparency=1 cp.
BorderColor3=Color3.fromRGB(0,0,0)cp.BorderSizePixel=0 cp.Position=UDim2.
fromScale(1.3e-7,0.5)cp.Parent=cn local cq=Instance.new'UIListLayout'cq.Name=
'OptionUIListLayout'cq.Padding=UDim.new(0,10)cq.FillDirection=Enum.FillDirection
.Horizontal cq.SortOrder=Enum.SortOrder.LayoutOrder cq.VerticalAlignment=Enum.
VerticalAlignment.Center cq.Parent=cn local cr=Instance.new'TextLabel'cr.Name=
'Checkmark'cr.FontFace=Font.new(o.interFont)cr.Text='\u{2713}'cr.TextColor3=
Color3.fromRGB(255,255,255)cr.TextSize=13 cr.TextTransparency=1 cr.
TextXAlignment=Enum.TextXAlignment.Left cr.TextYAlignment=Enum.TextYAlignment.
Top cr.AnchorPoint=Vector2.new(0,0.5)cr.AutomaticSize=Enum.AutomaticSize.Y cr.
BackgroundColor3=Color3.fromRGB(255,255,255)cr.BackgroundTransparency=1 cr.
BorderColor3=Color3.fromRGB(0,0,0)cr.BorderSizePixel=0 cr.LayoutOrder=-1 cr.
Position=UDim2.fromScale(1.3e-7,0.5)cr.Size=UDim2.fromOffset(-10,0)cr.Parent=cn
cn.Parent=b5 b5.Parent=bZ bY[cm]={Index=cl,Button=cn,NameLabel=cp,Checkmark=cr}
local cs={duration=0.2,easingStyle=Enum.EasingStyle.Quint,transparencyIn=0.2,
transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-cq.Padding.Offset,
waitTime=1}local ct,cu={checkIn=v(cr,TweenInfo.new(cs.duration,cs.easingStyle),{
Size=UDim2.new(cr.Size.X.Scale,cs.checkSizeIncrease,cr.Size.Y.Scale,cr.Size.Y.
Offset)}),checkOut=v(cr,TweenInfo.new(cs.duration,cs.easingStyle),{Size=UDim2.
new(cr.Size.X.Scale,cs.checkSizeDecrease,cr.Size.Y.Scale,cr.Size.Y.Offset)}),
nameIn=v(cp,TweenInfo.new(cs.duration,cs.easingStyle),{TextTransparency=cs.
transparencyIn}),nameOut=v(cp,TweenInfo.new(cs.duration,cs.easingStyle),{
TextTransparency=cs.transparencyOut})},false if bW.Settings.Default then if bW.
Settings.Multi then cu=table.find(bW.Settings.Default,cm)and true or false else
cu=(bW.Settings.Default==cl)and true or false end end ch(cm,cu)local cv=bY[cm].
Button cv.MouseButton1Click:Connect(function()local cw=table.find(bX,cm)and true
or false local cx=not cw if bW.Settings.Required and not cx and#bX<=1 then
return end ch(cm,cx)task.spawn(function()if bW.Settings.Multi then local cy={}
for cz,cA in ipairs(bX)do cy[cA]=true end if bW.Settings.Callback then bW.
Settings.Callback(cy)end else if cx and bW.Settings.Callback then bW.Settings.
Callback(bX[1]or nil)end end end)end)if ci then bZ.Size=UDim2.new(1,0,0,cd())end
end if bW.Settings.Options then for cm,co in pairs(bW.Settings.Options)do cl(cm,
co)end end function bW:UpdateName(cm)b1.Text=cm end function bW:SetVisibility(cm
)bZ.Visible=cm end function bW:UpdateSelection(cm)if not cm then return end for
co,cp in pairs(bY)do ch(co,false)end local co={}if type(cm)=='number'then for cp
,cq in pairs(bY)do local cr=cq.Index==cm ch(cp,cr)if cr then table.insert(co,cp)
end end elseif type(cm)=='string'then for cp,cq in pairs(bY)do local cr=cp==cm
ch(cp,cr)if cr then table.insert(co,cp)end end elseif type(cm)=='table'then for
cp,cq in pairs(bY)do local cr=table.find(cm,cp)~=nil ch(cp,cr)if cr then table.
insert(co,cp)end end end if bW.Settings.Callback then if bW.Settings.Multi then
local cp={}for cq,cr in ipairs(co)do cp[cr]=true end bW.Settings.Callback(cp)
else bW.Settings.Callback(co[1]or nil)end end end function bW:InsertOptions(cm)
if not cm then return end bW.Settings.Options=cm for co,cp in pairs(cm)do cl(co,
cp)end end function bW:ClearOptions()for cm,co in pairs(bY)do co.Button:Destroy(
)end bY={}bX={}if ci then bZ.Size=UDim2.new(1,0,0,cd())end end function bW:
GetOptions()local cm={}for co,cp in pairs(bY)do local cq=table.find(bX,co)and
true or false cm[co]=cq end return cm end function bW:RemoveOptions(cm)if not cm
then return end for co,cp in ipairs(cm)do local cq=bY[cp]if cq then for cr=#bX,1
,-1 do if bX[cr]==cp then table.remove(bX,cr)end end cq.Button:Destroy()bY[cp]=
nil end end if ci then bZ.Size=UDim2.new(1,0,0,cd())end end function bW:IsOption
(cm)if not cm then return end return bY[cm]~=nil end if bV then b.Options[bV]=bW
end return bW end function bO:Colorpicker(bU,bV)local bW={Settings=bU,
IgnoreConfig=false,Class='Colorpicker'}local bX=bW.Settings.Alpha and true or
false bW.Color=bW.Settings.Default bW.Alpha=bX and bW.Settings.Alpha local bY=
Instance.new'Frame'bY.Name='Colorpicker'bY.AutomaticSize=Enum.AutomaticSize.Y bY
.BackgroundColor3=Color3.fromRGB(0,0,0)bY.BackgroundTransparency=1 bY.
BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Size=UDim2.new(1,0,0,
38)bY.Parent=bP local bZ=Instance.new'TextLabel'bZ.Name='KeybindName'bZ.FontFace
=Font.new(o.interFont)bZ.Text=bU.Name bZ.TextColor3=Color3.fromRGB(255,255,255)
bZ.TextSize=13 bZ.TextTransparency=0.5 bZ.RichText=true bZ.TextTruncate=Enum.
TextTruncate.AtEnd bZ.TextXAlignment=Enum.TextXAlignment.Left bZ.TextYAlignment=
Enum.TextYAlignment.Top bZ.AnchorPoint=Vector2.new(0,0.5)bZ.AutomaticSize=Enum.
AutomaticSize.XY bZ.BackgroundColor3=Color3.fromRGB(255,255,255)bZ.
BackgroundTransparency=1 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel
=0 bZ.Position=UDim2.fromScale(0,0.5)bZ.Parent=bY local b_=Instance.new
'ImageLabel'b_.Name='NewColor'b_.Image=o.grid b_.ScaleType=Enum.ScaleType.Tile
b_.TileSize=UDim2.fromOffset(500,500)b_.AnchorPoint=Vector2.new(1,0.5)b_.
BackgroundColor3=Color3.fromRGB(255,255,255)b_.BackgroundTransparency=1 b_.
BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel=0 b_.Position=UDim2.
fromScale(1,0.5)b_.Size=UDim2.fromOffset(21,21)local b0=Instance.new'Frame'b0.
Name='Color'b0.AnchorPoint=Vector2.new(0.5,0.5)b0.BackgroundColor3=bW.Color b0.
BorderSizePixel=0 b0.Position=UDim2.fromScale(0.5,0.5)b0.Size=UDim2.fromScale(1,
1)b0.BackgroundTransparency=bW.Alpha or 0 local b1=Instance.new'UICorner'b1.Name
='UICorner'b1.CornerRadius=UDim.new(0,6)b1.Parent=b0 local b2=Instance.new
'TextButton'b2.Name='Interact'b2.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'b2.Text=''b2.TextColor3=Color3.
fromRGB(0,0,0)b2.TextSize=14 b2.BackgroundColor3=Color3.fromRGB(255,255,255)b2.
BackgroundTransparency=1 b2.BorderColor3=Color3.fromRGB(0,0,0)b2.BorderSizePixel
=0 b2.Size=UDim2.fromScale(1,1)b2.Parent=b0 b0.Parent=b_ local b3=Instance.new
'UICorner'b3.Name='UICorner'b3.CornerRadius=UDim.new(0,8)b3.Parent=b_ b_.Parent=
bY local b4=Instance.new'Frame'b4.Name='ColorPicker'b4.BackgroundColor3=Color3.
fromRGB(0,0,0)b4.BackgroundTransparency=0.5 b4.BorderColor3=Color3.fromRGB(0,0,0
)b4.BorderSizePixel=0 b4.Size=UDim2.fromScale(1,1)b4.Visible=false local b5=
Instance.new'UICorner'b5.Name='BaseUICorner'b5.CornerRadius=UDim.new(0,10)b5.
Parent=b4 local b6=Instance.new'Frame'b6.Name='Prompt'b6.AnchorPoint=Vector2.
new(0.5,0.5)b6.AutomaticSize=Enum.AutomaticSize.Y b6.BackgroundColor3=Color3.
fromRGB(15,15,15)b6.BorderColor3=Color3.fromRGB(0,0,0)b6.BorderSizePixel=0 b6.
Position=UDim2.fromScale(0.5,0.5)b6.Size=UDim2.fromOffset(420,0)local b7=
Instance.new'UIScale'b7.Name='BaseUIScale'b7.Parent=b6 b7.Scale=0.95 local b8=
Instance.new'UIStroke'b8.Name='GlobalSettingsUIStroke'b8.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border b8.Color=Color3.fromRGB(255,255,255)b8.Transparency=0.9
b8.Parent=b6 local b9=Instance.new'UICorner'b9.Name='GlobalSettingsUICorner'b9.
CornerRadius=UDim.new(0,10)b9.Parent=b6 local ca=Instance.new'UIListLayout'ca.
Name='UIListLayout'ca.Padding=UDim.new(0,10)ca.HorizontalAlignment=Enum.
HorizontalAlignment.Center ca.SortOrder=Enum.SortOrder.LayoutOrder ca.Parent=b6
local cb=Instance.new'Frame'cb.Name='ColorOptions'cb.AutomaticSize=Enum.
AutomaticSize.XY cb.BackgroundColor3=Color3.fromRGB(255,255,255)cb.
BackgroundTransparency=1 cb.BorderColor3=Color3.fromRGB(0,0,0)cb.BorderSizePixel
=0 cb.LayoutOrder=1 cb.Size=UDim2.fromScale(1,0)local cc=Instance.new
'TextButton'cc.Name='Value'cc.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'cc.Text=''cc.TextColor3=Color3.
fromRGB(0,0,0)cc.TextSize=14 cc.AutoButtonColor=false cc.BackgroundColor3=Color3
.fromRGB(255,255,255)cc.BorderColor3=Color3.fromRGB(0,0,0)cc.BorderSizePixel=0
cc.LayoutOrder=1 cc.Position=UDim2.fromScale(0.092,0.886)cc.Size=UDim2.new(1,0,0
,15)local cd=Instance.new'UIGradient'cd.Name='UIGradient'cd.Color=ColorSequence.
new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))}cd.Parent=cc local ce=
Instance.new'Frame'ce.Name='Slide'ce.AnchorPoint=Vector2.new(0,0.5)ce.
BackgroundColor3=Color3.fromRGB(255,255,255)ce.BorderColor3=Color3.fromRGB(27,42
,53)ce.BorderSizePixel=0 ce.Position=UDim2.fromScale(0,0.5)ce.Size=UDim2.new(0,
13,1,8)local cf=Instance.new'UICorner'cf.Name='UICorner'cf.CornerRadius=UDim.
new(1,0)cf.Parent=ce local cg=Instance.new'UIStroke'cg.Name='UIStroke'cg.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border cg.Transparency=0.5 cg.Parent=ce ce.
Parent=cc local ch=Instance.new'UICorner'ch.Name='UICorner'ch.CornerRadius=UDim.
new(0,6)ch.Parent=cc local ci=Instance.new'UIStroke'ci.Name='UIStroke'ci.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border ci.Color=Color3.fromRGB(255,255,255)
ci.Transparency=0.9 local cj=Instance.new'UIGradient'cj.Name='UIGradient'cj.
Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255))
,ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))}cj.Rotation=180 cj.Parent=ci
ci.Parent=cc cc.Parent=cb local ck=Instance.new'UIListLayout'ck.Name=
'UIListLayout'ck.Padding=UDim.new(0,25)ck.SortOrder=Enum.SortOrder.LayoutOrder
ck.Parent=cb local cl=Instance.new'Frame'cl.Name='Wheel'cl.AutomaticSize=Enum.
AutomaticSize.Y cl.BackgroundColor3=Color3.fromRGB(255,255,255)cl.
BackgroundTransparency=1 cl.BorderColor3=Color3.fromRGB(0,0,0)cl.BorderSizePixel
=0 cl.Size=UDim2.new(1,0,0,100)local cm=Instance.new'ImageButton'cm.Name='Wheel'
cm.Image=o.colorWheel cm.AutoButtonColor=false cm.Active=false cm.
BackgroundColor3=Color3.fromRGB(248,248,248)cm.BackgroundTransparency=1 cm.
BorderColor3=Color3.fromRGB(27,42,53)cm.Selectable=false cm.Size=UDim2.
fromOffset(220,220)cm.SizeConstraint=Enum.SizeConstraint.RelativeYY local co=
Instance.new'ImageLabel'co.Name='Target'co.Image=o.colorTarget co.ImageColor3=
Color3.fromRGB(0,0,0)co.AnchorPoint=Vector2.new(0.5,0.5)co.BackgroundColor3=
Color3.fromRGB(255,255,255)co.BackgroundTransparency=1 co.BorderColor3=Color3.
fromRGB(27,42,53)co.Position=UDim2.fromScale(0.5,0.5)co.Size=UDim2.fromOffset(22
,22)co.SizeConstraint=Enum.SizeConstraint.RelativeYY co.Parent=cm cm.Parent=cl
local cp=Instance.new'Frame'cp.Name='Inputs'cp.AnchorPoint=Vector2.new(1,0.5)cp.
AutomaticSize=Enum.AutomaticSize.XY cp.BackgroundColor3=Color3.fromRGB(255,255,
255)cp.BackgroundTransparency=1 cp.BorderColor3=Color3.fromRGB(0,0,0)cp.
BorderSizePixel=0 cp.LayoutOrder=1 cp.Position=UDim2.fromScale(1,0.5)local cq=
Instance.new'UIListLayout'cq.Name='UIListLayout'cq.Padding=UDim.new(0,5)cq.
SortOrder=Enum.SortOrder.LayoutOrder cq.Parent=cp local cr=Instance.new'Frame'cr
.Name='Red'cr.AutomaticSize=Enum.AutomaticSize.XY cr.BackgroundColor3=Color3.
fromRGB(0,0,0)cr.BackgroundTransparency=1 cr.BorderColor3=Color3.fromRGB(0,0,0)
cr.BorderSizePixel=0 cr.LayoutOrder=1 cr.Size=UDim2.fromOffset(0,38)local cs=
Instance.new'TextLabel'cs.Name='InputName'cs.FontFace=Font.new(o.interFont)cs.
Text='Red'cs.TextColor3=Color3.fromRGB(255,255,255)cs.TextSize=13 cs.
TextTransparency=0.5 cs.TextTruncate=Enum.TextTruncate.AtEnd cs.TextXAlignment=
Enum.TextXAlignment.Left cs.TextYAlignment=Enum.TextYAlignment.Top cs.
AnchorPoint=Vector2.new(0,0.5)cs.AutomaticSize=Enum.AutomaticSize.XY cs.
BackgroundColor3=Color3.fromRGB(255,255,255)cs.BackgroundTransparency=1 cs.
BorderColor3=Color3.fromRGB(0,0,0)cs.BorderSizePixel=0 cs.LayoutOrder=2 cs.
Position=UDim2.fromScale(0,0.5)cs.Parent=cr local ct=Instance.new'UIListLayout'
ct.Name='UIListLayout'ct.Padding=UDim.new(0,15)ct.FillDirection=Enum.
FillDirection.Horizontal ct.SortOrder=Enum.SortOrder.LayoutOrder ct.
VerticalAlignment=Enum.VerticalAlignment.Center ct.Parent=cr local cu=Instance.
new'TextBox'cu.Name='InputBox'cu.ClearTextOnFocus=false cu.CursorPosition=-1 cu.
FontFace=Font.new(o.interFont)cu.Text='255'cu.TextColor3=Color3.fromRGB(255,255,
255)cu.TextSize=12 cu.TextTransparency=0.1 cu.TextXAlignment=Enum.TextXAlignment
.Left cu.AnchorPoint=Vector2.new(1,0.5)cu.BackgroundColor3=Color3.fromRGB(255,
255,255)cu.BackgroundTransparency=0.95 cu.BorderColor3=Color3.fromRGB(0,0,0)cu.
BorderSizePixel=0 cu.ClipsDescendants=true cu.LayoutOrder=1 cu.Position=UDim2.
fromScale(1,0.5)cu.Size=UDim2.fromOffset(75,25)local cv=Instance.new'UICorner'cv
.Name='InputBoxUICorner'cv.CornerRadius=UDim.new(0,4)cv.Parent=cu local cw=
Instance.new'UIStroke'cw.Name='InputBoxUIStroke'cw.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cw.Color=Color3.fromRGB(255,255,255)cw.Transparency=0.9
cw.Parent=cu local cx=Instance.new'UISizeConstraint'cx.Name=
'InputBoxUISizeConstraint'cx.Parent=cu local cy=Instance.new'UIPadding'cy.Name=
'InputBoxUIPadding'cy.PaddingLeft=UDim.new(0,8)cy.PaddingRight=UDim.new(0,10)cy.
Parent=cu cu.Parent=cr cr.Parent=cp local cz=Instance.new'Frame'cz.Name='Green'
cz.AutomaticSize=Enum.AutomaticSize.XY cz.BackgroundColor3=Color3.fromRGB(0,0,0)
cz.BackgroundTransparency=1 cz.BorderColor3=Color3.fromRGB(0,0,0)cz.
BorderSizePixel=0 cz.LayoutOrder=2 cz.Size=UDim2.fromOffset(0,38)local cA=
Instance.new'TextLabel'cA.Name='InputName'cA.FontFace=Font.new(o.interFont)cA.
Text='Green'cA.TextColor3=Color3.fromRGB(255,255,255)cA.TextSize=13 cA.
TextTransparency=0.5 cA.TextTruncate=Enum.TextTruncate.AtEnd cA.TextXAlignment=
Enum.TextXAlignment.Left cA.TextYAlignment=Enum.TextYAlignment.Top cA.
AnchorPoint=Vector2.new(0,0.5)cA.AutomaticSize=Enum.AutomaticSize.XY cA.
BackgroundColor3=Color3.fromRGB(255,255,255)cA.BackgroundTransparency=1 cA.
BorderColor3=Color3.fromRGB(0,0,0)cA.BorderSizePixel=0 cA.LayoutOrder=2 cA.
Position=UDim2.fromScale(0,0.5)cA.Parent=cz local cB=Instance.new'UIListLayout'
cB.Name='UIListLayout'cB.Padding=UDim.new(0,15)cB.FillDirection=Enum.
FillDirection.Horizontal cB.SortOrder=Enum.SortOrder.LayoutOrder cB.
VerticalAlignment=Enum.VerticalAlignment.Center cB.Parent=cz local cC=Instance.
new'TextBox'cC.Name='InputBox'cC.ClearTextOnFocus=false cC.FontFace=Font.new(o.
interFont)cC.Text='255'cC.TextColor3=Color3.fromRGB(255,255,255)cC.TextSize=12
cC.TextTransparency=0.1 cC.TextXAlignment=Enum.TextXAlignment.Left cC.
AnchorPoint=Vector2.new(1,0.5)cC.BackgroundColor3=Color3.fromRGB(255,255,255)cC.
BackgroundTransparency=0.95 cC.BorderColor3=Color3.fromRGB(0,0,0)cC.
BorderSizePixel=0 cC.ClipsDescendants=true cC.LayoutOrder=1 cC.Position=UDim2.
fromScale(1,0.5)cC.Size=UDim2.fromOffset(75,25)local cD=Instance.new'UICorner'cD
.Name='InputBoxUICorner'cD.CornerRadius=UDim.new(0,4)cD.Parent=cC local cE=
Instance.new'UIStroke'cE.Name='InputBoxUIStroke'cE.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cE.Color=Color3.fromRGB(255,255,255)cE.Transparency=0.9
cE.Parent=cC local cF=Instance.new'UISizeConstraint'cF.Name=
'InputBoxUISizeConstraint'cF.Parent=cC local cG=Instance.new'UIPadding'cG.Name=
'InputBoxUIPadding'cG.PaddingLeft=UDim.new(0,8)cG.PaddingRight=UDim.new(0,10)cG.
Parent=cC cC.Parent=cz cz.Parent=cp local cH=Instance.new'Frame'cH.Name='Blue'cH
.AutomaticSize=Enum.AutomaticSize.XY cH.BackgroundColor3=Color3.fromRGB(0,0,0)cH
.BackgroundTransparency=1 cH.BorderColor3=Color3.fromRGB(0,0,0)cH.
BorderSizePixel=0 cH.LayoutOrder=3 cH.Size=UDim2.fromOffset(0,38)local cI=
Instance.new'TextLabel'cI.Name='InputName'cI.FontFace=Font.new(o.interFont)cI.
Text='Blue'cI.TextColor3=Color3.fromRGB(255,255,255)cI.TextSize=13 cI.
TextTransparency=0.5 cI.TextTruncate=Enum.TextTruncate.AtEnd cI.TextXAlignment=
Enum.TextXAlignment.Left cI.TextYAlignment=Enum.TextYAlignment.Top cI.
AnchorPoint=Vector2.new(0,0.5)cI.AutomaticSize=Enum.AutomaticSize.XY cI.
BackgroundColor3=Color3.fromRGB(255,255,255)cI.BackgroundTransparency=1 cI.
BorderColor3=Color3.fromRGB(0,0,0)cI.BorderSizePixel=0 cI.LayoutOrder=2 cI.
Position=UDim2.fromScale(0,0.5)cI.Parent=cH local cJ=Instance.new'UIListLayout'
cJ.Name='UIListLayout'cJ.Padding=UDim.new(0,15)cJ.FillDirection=Enum.
FillDirection.Horizontal cJ.SortOrder=Enum.SortOrder.LayoutOrder cJ.
VerticalAlignment=Enum.VerticalAlignment.Center cJ.Parent=cH local cK=Instance.
new'TextBox'cK.Name='InputBox'cK.ClearTextOnFocus=false cK.FontFace=Font.new(o.
interFont)cK.Text='255'cK.TextColor3=Color3.fromRGB(255,255,255)cK.TextSize=12
cK.TextTransparency=0.1 cK.TextXAlignment=Enum.TextXAlignment.Left cK.
AnchorPoint=Vector2.new(1,0.5)cK.BackgroundColor3=Color3.fromRGB(255,255,255)cK.
BackgroundTransparency=0.95 cK.BorderColor3=Color3.fromRGB(0,0,0)cK.
BorderSizePixel=0 cK.ClipsDescendants=true cK.LayoutOrder=1 cK.Position=UDim2.
fromScale(1,0.5)cK.Size=UDim2.fromOffset(75,25)local cL=Instance.new'UICorner'cL
.Name='InputBoxUICorner'cL.CornerRadius=UDim.new(0,4)cL.Parent=cK local cM=
Instance.new'UIStroke'cM.Name='InputBoxUIStroke'cM.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cM.Color=Color3.fromRGB(255,255,255)cM.Transparency=0.9
cM.Parent=cK local cN=Instance.new'UISizeConstraint'cN.Name=
'InputBoxUISizeConstraint'cN.Parent=cK local cO=Instance.new'UIPadding'cO.Name=
'InputBoxUIPadding'cO.PaddingLeft=UDim.new(0,8)cO.PaddingRight=UDim.new(0,10)cO.
Parent=cK cK.Parent=cH cH.Parent=cp local cP=Instance.new'Frame'cP.Name='Alpha'
cP.AutomaticSize=Enum.AutomaticSize.XY cP.BackgroundColor3=Color3.fromRGB(0,0,0)
cP.BackgroundTransparency=1 cP.BorderColor3=Color3.fromRGB(0,0,0)cP.
BorderSizePixel=0 cP.LayoutOrder=4 cP.Size=UDim2.fromOffset(0,38)cP.Visible=bX
local cQ=Instance.new'TextLabel'cQ.Name='InputName'cQ.FontFace=Font.new(o.
interFont)cQ.Text='Alpha'cQ.TextColor3=Color3.fromRGB(255,255,255)cQ.TextSize=13
cQ.TextTransparency=0.5 cQ.TextTruncate=Enum.TextTruncate.AtEnd cQ.
TextXAlignment=Enum.TextXAlignment.Left cQ.TextYAlignment=Enum.TextYAlignment.
Top cQ.AnchorPoint=Vector2.new(0,0.5)cQ.AutomaticSize=Enum.AutomaticSize.XY cQ.
BackgroundColor3=Color3.fromRGB(255,255,255)cQ.BackgroundTransparency=1 cQ.
BorderColor3=Color3.fromRGB(0,0,0)cQ.BorderSizePixel=0 cQ.LayoutOrder=2 cQ.
Position=UDim2.fromScale(0,0.5)cQ.Parent=cP local cR=Instance.new'UIListLayout'
cR.Name='UIListLayout'cR.Padding=UDim.new(0,15)cR.FillDirection=Enum.
FillDirection.Horizontal cR.SortOrder=Enum.SortOrder.LayoutOrder cR.
VerticalAlignment=Enum.VerticalAlignment.Center cR.Parent=cP local cS=Instance.
new'TextBox'cS.Name='InputBox'cS.ClearTextOnFocus=false cS.FontFace=Font.new(o.
interFont)cS.Text='0'cS.TextColor3=Color3.fromRGB(255,255,255)cS.TextSize=12 cS.
TextTransparency=0.1 cS.TextXAlignment=Enum.TextXAlignment.Left cS.AnchorPoint=
Vector2.new(1,0.5)cS.BackgroundColor3=Color3.fromRGB(255,255,255)cS.
BackgroundTransparency=0.95 cS.BorderColor3=Color3.fromRGB(0,0,0)cS.
BorderSizePixel=0 cS.ClipsDescendants=true cS.LayoutOrder=1 cS.Position=UDim2.
fromScale(1,0.5)cS.Size=UDim2.fromOffset(75,25)local cT=Instance.new'UICorner'cT
.Name='InputBoxUICorner'cT.CornerRadius=UDim.new(0,4)cT.Parent=cS local cU=
Instance.new'UIStroke'cU.Name='InputBoxUIStroke'cU.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cU.Color=Color3.fromRGB(255,255,255)cU.Transparency=0.9
cU.Parent=cS local cV=Instance.new'UISizeConstraint'cV.Name=
'InputBoxUISizeConstraint'cV.Parent=cS local cW=Instance.new'UIPadding'cW.Name=
'InputBoxUIPadding'cW.PaddingLeft=UDim.new(0,8)cW.PaddingRight=UDim.new(0,10)cW.
Parent=cS cS.Parent=cP cP.Parent=cp local cX=Instance.new'Frame'cX.Name='Hex'cX.
AutomaticSize=Enum.AutomaticSize.XY cX.BackgroundColor3=Color3.fromRGB(0,0,0)cX.
BackgroundTransparency=1 cX.BorderColor3=Color3.fromRGB(0,0,0)cX.BorderSizePixel
=0 cX.Size=UDim2.fromOffset(0,38)local cY=Instance.new'TextLabel'cY.Name=
'InputName'cY.FontFace=Font.new(o.interFont)cY.Text='Hex'cY.TextColor3=Color3.
fromRGB(255,255,255)cY.TextSize=13 cY.TextTransparency=0.5 cY.TextTruncate=Enum.
TextTruncate.AtEnd cY.TextXAlignment=Enum.TextXAlignment.Left cY.TextYAlignment=
Enum.TextYAlignment.Top cY.AnchorPoint=Vector2.new(0,0.5)cY.AutomaticSize=Enum.
AutomaticSize.XY cY.BackgroundColor3=Color3.fromRGB(255,255,255)cY.
BackgroundTransparency=1 cY.BorderColor3=Color3.fromRGB(0,0,0)cY.BorderSizePixel
=0 cY.LayoutOrder=2 cY.Position=UDim2.fromScale(0,0.5)cY.Parent=cX local cZ=
Instance.new'UIListLayout'cZ.Name='UIListLayout'cZ.Padding=UDim.new(0,15)cZ.
FillDirection=Enum.FillDirection.Horizontal cZ.SortOrder=Enum.SortOrder.
LayoutOrder cZ.VerticalAlignment=Enum.VerticalAlignment.Center cZ.Parent=cX
local c_=Instance.new'TextBox'c_.Name='InputBox'c_.ClearTextOnFocus=false c_.
CursorPosition=-1 c_.FontFace=Font.new(o.interFont)c_.Text='255'c_.TextColor3=
Color3.fromRGB(255,255,255)c_.TextSize=12 c_.TextTransparency=0.1 c_.
TextXAlignment=Enum.TextXAlignment.Left c_.AnchorPoint=Vector2.new(1,0.5)c_.
BackgroundColor3=Color3.fromRGB(255,255,255)c_.BackgroundTransparency=0.95 c_.
BorderColor3=Color3.fromRGB(0,0,0)c_.BorderSizePixel=0 c_.ClipsDescendants=true
c_.LayoutOrder=1 c_.Position=UDim2.fromScale(1,0.5)c_.Size=UDim2.fromOffset(75,
25)local c0=Instance.new'UICorner'c0.Name='InputBoxUICorner'c0.CornerRadius=UDim
.new(0,4)c0.Parent=c_ local c1=Instance.new'UIStroke'c1.Name='InputBoxUIStroke'
c1.ApplyStrokeMode=Enum.ApplyStrokeMode.Border c1.Color=Color3.fromRGB(255,255,
255)c1.Transparency=0.9 c1.Parent=c_ local c2=Instance.new'UISizeConstraint'c2.
Name='InputBoxUISizeConstraint'c2.Parent=c_ local c3=Instance.new'UIPadding'c3.
Name='InputBoxUIPadding'c3.PaddingLeft=UDim.new(0,8)c3.PaddingRight=UDim.new(0,
10)c3.Parent=c_ c_.Parent=cX cX.Parent=cp cp.Parent=cl local c4=Instance.new
'UIPadding'c4.Name='UIPadding'c4.PaddingRight=UDim.new(0,5)c4.Parent=cl cl.
Parent=cb local c5=Instance.new'Frame'c5.Name='ColorWells'c5.AutomaticSize=Enum.
AutomaticSize.Y c5.BackgroundColor3=Color3.fromRGB(255,255,255)c5.
BackgroundTransparency=1 c5.BorderColor3=Color3.fromRGB(0,0,0)c5.BorderSizePixel
=0 c5.LayoutOrder=2 c5.Size=UDim2.fromScale(1,0)local c6=Instance.new
'UIGridLayout'c6.Name='UIGridLayout'c6.CellPadding=UDim2.fromOffset(10,0)c6.
CellSize=UDim2.new(0.5,-5,0,30)c6.SortOrder=Enum.SortOrder.LayoutOrder c6.Parent
=c5 local c7=Instance.new'ImageLabel'c7.Name='NewColor'c7.Image=o.grid c7.
ScaleType=Enum.ScaleType.Tile c7.TileSize=UDim2.fromOffset(500,500)c7.
BackgroundColor3=Color3.fromRGB(255,255,255)c7.BackgroundTransparency=1 c7.
BorderColor3=Color3.fromRGB(0,0,0)c7.BorderSizePixel=0 c7.Size=UDim2.fromOffset(
100,100)local c8=Instance.new'UICorner'c8.Name='UICorner'c8.Parent=c7 local c9=
Instance.new'Frame'c9.Name='Color'c9.AnchorPoint=Vector2.new(0.5,0.5)c9.
BorderColor3=Color3.fromRGB(27,42,53)c9.BorderSizePixel=0 c9.Position=UDim2.
fromScale(0.5,0.5)c9.Size=UDim2.new(1,1,1,1)local da=Instance.new'UICorner'da.
Name='UICorner'da.Parent=c9 c9.Parent=c7 c7.Parent=c5 local db=Instance.new
'ImageLabel'db.Name='OldColor'db.Image=o.grid db.ScaleType=Enum.ScaleType.Tile
db.TileSize=UDim2.fromOffset(500,500)db.BackgroundColor3=Color3.fromRGB(255,255,
255)db.BackgroundTransparency=1 db.BorderColor3=Color3.fromRGB(0,0,0)db.
BorderSizePixel=0 db.LayoutOrder=1 db.Size=UDim2.fromOffset(100,100)local dc=
Instance.new'UICorner'dc.Name='UICorner'dc.Parent=db local dd=Instance.new
'Frame'dd.Name='Color'dd.AnchorPoint=Vector2.new(0.5,0.5)dd.BorderColor3=Color3.
fromRGB(27,42,53)dd.BorderSizePixel=0 dd.Position=UDim2.fromScale(0.5,0.5)dd.
Size=UDim2.new(1,1,1,1)local de=Instance.new'UICorner'de.Name='UICorner'de.
Parent=dd dd.Parent=db db.Parent=c5 c5.Parent=cb cb.Parent=b6 local df=Instance.
new'Frame'df.Name='Interactions'df.AutomaticSize=Enum.AutomaticSize.Y df.
BackgroundColor3=Color3.fromRGB(0,0,0)df.BackgroundTransparency=1 df.
BorderColor3=Color3.fromRGB(0,0,0)df.BorderSizePixel=0 df.LayoutOrder=2 df.Size=
UDim2.fromScale(1,0)local dg=Instance.new'UIListLayout'dg.Name='UIListLayout'dg.
Padding=UDim.new(0,10)dg.SortOrder=Enum.SortOrder.LayoutOrder dg.Parent=df local
dh=Instance.new'TextButton'dh.Name='Confirm'dh.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.Medium,Enum.FontStyle.Normal)dh.Text=
'Confirm'dh.TextColor3=Color3.fromRGB(255,255,255)dh.TextSize=15 dh.
TextTransparency=0.5 dh.TextTruncate=Enum.TextTruncate.AtEnd dh.AutoButtonColor=
false dh.AutomaticSize=Enum.AutomaticSize.Y dh.BackgroundColor3=Color3.fromRGB(
25,25,25)dh.BorderColor3=Color3.fromRGB(0,0,0)dh.BorderSizePixel=0 dh.Size=UDim2
.fromScale(1,0)local di=Instance.new'UIPadding'di.Name='UIPadding'di.
PaddingBottom=UDim.new(0,9)di.PaddingLeft=UDim.new(0,10)di.PaddingRight=UDim.
new(0,10)di.PaddingTop=UDim.new(0,9)di.Parent=dh local dj=Instance.new'UICorner'
dj.Name='BaseUICorner'dj.CornerRadius=UDim.new(0,10)dj.Parent=dh dh.Parent=df
local dk=Instance.new'TextButton'dk.Name='Cancel'dk.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.Medium,Enum.FontStyle.Normal)dk.Text=
'Cancel'dk.TextColor3=Color3.fromRGB(255,255,255)dk.TextSize=15 dk.
TextTransparency=0.5 dk.TextTruncate=Enum.TextTruncate.AtEnd dk.AutoButtonColor=
false dk.AutomaticSize=Enum.AutomaticSize.Y dk.BackgroundColor3=Color3.fromRGB(
25,25,25)dk.BorderColor3=Color3.fromRGB(0,0,0)dk.BorderSizePixel=0 dk.Size=UDim2
.fromScale(1,0)local dl=Instance.new'UICorner'dl.Name='BaseUICorner'dl.
CornerRadius=UDim.new(0,10)dl.Parent=dk local dm=Instance.new'UIPadding'dm.Name=
'UIPadding'dm.PaddingBottom=UDim.new(0,9)dm.PaddingLeft=UDim.new(0,10)dm.
PaddingRight=UDim.new(0,10)dm.PaddingTop=UDim.new(0,9)dm.Parent=dk dk.Parent=df
local dn=Instance.new'UIPadding'dn.Name='UIPadding'dn.PaddingTop=UDim.new(0,10)
dn.Parent=df df.Parent=b6 local dp=Instance.new'UIPadding'dp.Name=
'GlobalSettingsUIPadding'dp.PaddingBottom=UDim.new(0,20)dp.PaddingLeft=UDim.new(
0,20)dp.PaddingRight=UDim.new(0,20)dp.PaddingTop=UDim.new(0,20)dp.Parent=b6
local dq=Instance.new'Frame'dq.Name='Paragraph'dq.AutomaticSize=Enum.
AutomaticSize.Y dq.BackgroundColor3=Color3.fromRGB(0,0,0)dq.
BackgroundTransparency=1 dq.BorderColor3=Color3.fromRGB(0,0,0)dq.BorderSizePixel
=0 dq.Size=UDim2.fromScale(1,0)local dr=Instance.new'TextLabel'dr.Name=
'ParagraphHeader'dr.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight
.SemiBold,Enum.FontStyle.Normal)dr.RichText=true dr.Text=bW.Settings.Name dr.
TextColor3=Color3.fromRGB(255,255,255)dr.TextSize=18 dr.TextTransparency=0.4 dr.
TextWrapped=true dr.TextYAlignment=Enum.TextYAlignment.Top dr.AutomaticSize=Enum
.AutomaticSize.XY dr.BackgroundColor3=Color3.fromRGB(255,255,255)dr.
BackgroundTransparency=1 dr.BorderColor3=Color3.fromRGB(0,0,0)dr.BorderSizePixel
=0 dr.Size=UDim2.fromScale(1,0)dr.Parent=dq local ds=Instance.new'UIListLayout'
ds.Name='UIListLayout'ds.Padding=UDim.new(0,15)ds.HorizontalAlignment=Enum.
HorizontalAlignment.Center ds.SortOrder=Enum.SortOrder.LayoutOrder ds.Parent=dq
local dt=Instance.new'UIPadding'dt.Name='UIPadding'dt.PaddingBottom=UDim.new(0,
15)dt.Parent=dq local du=Instance.new'Frame'du.Name='Line'du.BackgroundColor3=
Color3.fromRGB(255,255,255)du.BackgroundTransparency=0.9 du.BorderColor3=Color3.
fromRGB(0,0,0)du.BorderSizePixel=0 du.LayoutOrder=1 du.Size=UDim2.new(1,0,0,1)du
.Parent=dq dq.Parent=b6 b6.Parent=b4 b4.Parent=C local dv,dw,dx,dy,dz,dA,dB,dC,
dD,dE,dF,dG,dH,dI,dJ,dK,dL,dM,dN=Color3.fromHSV,Color3.fromRGB,Vector2.new,UDim2
.new,cm,co,cc,c9,{Hex=cX.InputBox,Red=cr.InputBox,Green=cz.InputBox,Blue=cH.
InputBox,Alpha=cP.InputBox},k:GetMouse(),false,false,0,0,1,function(dv)return
math.atan2(dv.y,dv.x),dv.magnitude end,function(dv)return((dv+math.pi)/(2*math.
pi))*360 end,function(dv)return dv*(math.pi/180)end,function(dv)dv=dv:gsub('#',
'')if#dv~=6 then return 0,0,0 end local dw,dx,dy=tonumber(dv:sub(1,2),16)or 0,
tonumber(dv:sub(3,4),16)or 0,tonumber(dv:sub(5,6),16)or 0 return dw,dx,dy end
local dO=function(dO,dP,dQ)local dR=tonumber(dO)if dR then return math.clamp(dR,
dP,dQ)end return dP end local dP=function()local dP=dv(dH,dI,dJ)dC.
BackgroundColor3=dP dC.BackgroundTransparency=dO(dD.Alpha.Text,0,1)dD.Red.Text=
tostring(math.floor(dP.r*255+0.5))dD.Green.Text=tostring(math.floor(dP.g*255+0.5
))dD.Blue.Text=tostring(math.floor(dP.b*255+0.5))dD.Alpha.Text=dO(dD.Alpha.Text,
0,1)local dQ=string.format('#%02X%02X%02X',math.floor(dP.r*255+0.5),math.floor(
dP.g*255+0.5),math.floor(dP.b*255+0.5))dD.Hex.Text=dQ end local dQ,dR,dS,dT=
function(dQ)local dR=dQ-dB.AbsolutePosition.X local dS=math.clamp(dR,0,dB.
AbsoluteSize.X-ce.AbsoluteSize.X)ce.Position=dy(0,dS,0.5,0)dJ=1-(dS/(dB.
AbsoluteSize.X-ce.AbsoluteSize.X))dP()end,function(dQ,dR)local dS,dT=dz.
AbsoluteSize.x/2,dx(dQ,dR)-dz.AbsolutePosition-dz.AbsoluteSize/2 if dT:Dot(dT)>
dS*dS then dT=dT.unit*dS end dA.Position=dy(0.5,dT.x,0.5,dT.y)local dU,dV=dK(dT*
dx(1,-1))dH,dI=dL(dU)/360,math.clamp(dV/dS,0,1)dB.BackgroundColor3=dv(dH,dI,1)
dP()end,function(dQ)local dR=(1-dQ)*(dB.AbsoluteSize.X-ce.AbsoluteSize.X)ce.
Position=UDim2.new(0,dR,0.5,0)end,function(dQ,dR)local dS,dT=dz.AbsoluteSize.X/2
,dM(dQ*360)local dU=dR*dS local dV,dW=dU*math.cos(dT),dU*math.sin(dT)dA.Position
=UDim2.new(0.5,-dV,0.5,dW)dB.BackgroundColor3=dv(dQ,dR,1)end local dU,dV,dW=
function()local dU,dV,dW=dO(dD.Red.Text,0,255),dO(dD.Green.Text,0,255),dO(dD.
Blue.Text,0,255)dD.Red.Text=dU dD.Green.Text=dV dD.Blue.Text=dW dH,dI,dJ=Color3.
fromRGB(dU,dV,dW):ToHSV()dS(dJ)dT(dH,dI)dP()end,function()local dU=dD.Hex.Text
local dV,dW,dX=dN(dU)dV=dO(dV,0,255)dW=dO(dW,0,255)dX=dO(dX,0,255)dD.Red.Text=dV
dD.Green.Text=dW dD.Blue.Text=dX dH,dI,dJ=Color3.fromRGB(dV,dW,dX):ToHSV()dS(dJ)
dT(dH,dI)dP()end,function()local dU,dV,dW=math.floor(bW.Color.R*255+0.5),math.
floor(bW.Color.G*255+0.5),math.floor(bW.Color.B*255+0.5)dD.Red.Text=dU dD.Green.
Text=dV dD.Blue.Text=dW dD.Alpha.Text=bX and bW.Alpha or 0 local dX=string.
format('#%02X%02X%02X',dU,dV,dW)dD.Hex.Text=dX dH,dI,dJ=Color3.fromRGB(dU,dV,dW)
:ToHSV()dd.BackgroundColor3=bW.Color dd.BackgroundTransparency=bX and bW.Alpha
or 0 dC.BackgroundColor3=Color3.fromRGB(dU,dV,dW)dC.BackgroundTransparency=bX
and bW.Alpha or 0 dS(dJ)dT(dH,dI)end dz.InputBegan:Connect(function(dX)if dX.
UserInputType==Enum.UserInputType.MouseButton1 or dX.UserInputType==Enum.
UserInputType.Touch then dF=true dR(dE.X,dE.Y)end end)dB.InputBegan:Connect(
function(dX)if dX.UserInputType==Enum.UserInputType.MouseButton1 or dX.
UserInputType==Enum.UserInputType.Touch then dG=true dQ(dE.X)end end)dB.
InputEnded:Connect(function(dX)if dX.UserInputType==Enum.UserInputType.
MouseButton1 or dX.UserInputType==Enum.UserInputType.Touch then dG=false end end
)dz.InputEnded:Connect(function(dX)if dX.UserInputType==Enum.UserInputType.
MouseButton1 or dX.UserInputType==Enum.UserInputType.Touch then dF=false end end
)g.InputChanged:Connect(function(dX)if dX.UserInputType==Enum.UserInputType.
MouseMovement or dX.UserInputType==Enum.UserInputType.Touch then if dG then dQ(
dE.X)elseif dF then dR(dE.X,dE.Y)end end end)local dX=function(dX)local dY=dX.
Text dX.Text=''dX.PlaceholderText=dY end dD.Hex.FocusLost:Connect(dV)dD.Red.
FocusLost:Connect(dU)dD.Green.FocusLost:Connect(dU)dD.Blue.FocusLost:Connect(dU)
dD.Alpha.FocusLost:Connect(dP)dD.Hex.Focused:Connect(function()dX(dD.Hex)end)dD.
Red.Focused:Connect(function()dX(dD.Red)end)dD.Green.Focused:Connect(function()
dX(dD.Green)end)dD.Blue.Focused:Connect(function()dX(dD.Blue)end)dD.Alpha.
Focused:Connect(function()dX(dD.Alpha)end)local dY=function()local dY=Instance.
new'CanvasGroup'dY.Name='ColorPickerCanvas'dY.BackgroundTransparency=1 dY.
BorderSizePixel=0 dY.Size=UDim2.fromScale(1,1)dY.ZIndex=5 dY.GroupTransparency=1
dY.Parent=C dY.Visible=false return dY end local dZ=function(dZ)local d_,d0,d1,
d2,d3=dY(),dZ and 0 or 1,dZ and 1 or 0.95,dZ and 1 or 0,TweenInfo.new(0.1,Enum.
EasingStyle.Sine)local d4,d5=v(d_,d3,{GroupTransparency=d0}),v(b7,d3,{Scale=d1})
b4.Visible=true b4.Parent=d_ d_.Visible=true d_.GroupTransparency=d2 d4:Play()d5
:Play()d4.Completed:Wait()if not dZ then b4.Visible=false d_.Visible=false end
b4.Parent=C d_:Destroy()end local d_,d0=function()dZ(true)end,function()dZ(false
)end b2.MouseButton1Click:Connect(d_)dk.MouseButton1Click:Connect(d0)dh.
MouseButton1Click:Connect(function()d0()local d1=dv(dH,dI,dJ)bW.Color=Color3.
fromRGB(d1.r*255,d1.g*255,d1.b*255)bW.Alpha=bX and dO(dD.Alpha.Text,0,1)dd.
BackgroundColor3=bW.Color dd.BackgroundTransparency=bX and bW.Alpha or 0 b0.
BackgroundColor3=bW.Color b0.BackgroundTransparency=bX and bW.Alpha or 0 if bW.
Settings.Callback then task.spawn(function()bW.Settings.Callback(bW.Color,bX and
bW.Alpha)end)end end)dW()function bW:UpdateName(d1)bZ.Text=d1 end function bW:
SetVisibility(d1)bY.Visible=d1 end function bW:SetColor(d1)bW.Color=d1 b0.
BackgroundColor3=d1 local d2,d3,d4=math.floor(bW.Color.R*255+0.5),math.floor(bW.
Color.G*255+0.5),math.floor(bW.Color.B*255+0.5)dD.Red.Text=d2 dD.Green.Text=d3
dD.Blue.Text=d4 local d5=string.format('#%02X%02X%02X',d2,d3,d4)dD.Hex.Text=d5
dH,dI,dJ=Color3.fromRGB(d2,d3,d4):ToHSV()dd.BackgroundColor3=bW.Color dC.
BackgroundColor3=Color3.fromRGB(d2,d3,d4)dS(dJ)dT(dH,dI)if bW.Settings.Callback
then task.spawn(function()bW.Settings.Callback(bW.Color,bX and bW.Alpha)end)end
end function bW:SetAlpha(d1)bW.Alpha=d1 b0.Transparency=d1 dW()end if bV then b.
Options[bV]=bW end return bW end function bO:Header(bU,bV)local bW,bX={Settings=
bU},Instance.new'Frame'bX.Name='Header'bX.AutomaticSize=Enum.AutomaticSize.Y bX.
BackgroundColor3=Color3.fromRGB(0,0,0)bX.BackgroundTransparency=1 bX.
BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel=0 bX.LayoutOrder=0 bX.Size=
UDim2.fromScale(1,0)bX.Parent=bP local bY=Instance.new'UIPadding'bY.Name=
'UIPadding'bY.PaddingBottom=UDim.new(0,5)bY.Parent=bX local bZ=Instance.new
'TextLabel'bZ.Name='HeaderText'bZ.FontFace=Font.new(o.interFont,Enum.FontWeight.
Medium,Enum.FontStyle.Normal)bZ.RichText=true bZ.Text=bW.Settings.Text or bW.
Settings.Name bZ.TextColor3=Color3.fromRGB(255,255,255)bZ.TextSize=16 bZ.
TextTransparency=0.3 bZ.TextWrapped=true bZ.TextXAlignment=Enum.TextXAlignment.
Left bZ.AutomaticSize=Enum.AutomaticSize.Y bZ.BackgroundColor3=Color3.fromRGB(
255,255,255)bZ.BackgroundTransparency=1 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.
BorderSizePixel=0 bZ.Size=UDim2.fromScale(1,0)bZ.Parent=bX function bW:
UpdateName(b_)bZ.Text=b_ end function bW:SetVisibility(b_)bX.Visible=b_ end if
bV then b.Options[bV]=bW end return bW end function bO:Label(bU,bV)local bW,bX={
Settings=bU},Instance.new'Frame'bX.Name='Label'bX.AutomaticSize=Enum.
AutomaticSize.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.
BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel
=0 bX.Size=UDim2.new(1,0,0,38)bX.Parent=bP local bY=Instance.new'TextLabel'bY.
Name='LabelText'bY.FontFace=Font.new(o.interFont)bY.RichText=true bY.Text=bW.
Settings.Text or bW.Settings.Name bY.TextColor3=Color3.fromRGB(255,255,255)bY.
TextSize=13 bY.TextTransparency=0.5 bY.TextWrapped=true bY.TextXAlignment=Enum.
TextXAlignment.Left bY.AutomaticSize=Enum.AutomaticSize.Y bY.BackgroundColor3=
Color3.fromRGB(255,255,255)bY.BackgroundTransparency=1 bY.BorderColor3=Color3.
fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Size=UDim2.fromScale(1,1)bY.Parent=bX
function bW:UpdateName(bZ)bY.Text=bZ end function bW:SetVisibility(bZ)bX.Visible
=bZ end if bV then b.Options[bV]=bW end return bW end function bO:SubLabel(bU,bV
)local bW,bX={Settings=bU},Instance.new'Frame'bX.Name='SubLabel'bX.AutomaticSize
=Enum.AutomaticSize.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.
BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel
=0 bX.Size=UDim2.new(1,0,0,0)bX.Parent=bP local bY=Instance.new'TextLabel'bY.
Name='SubLabelText'bY.FontFace=Font.new(o.interFont)bY.RichText=true bY.Text=bW.
Settings.Text or bW.Settings.Name bY.TextColor3=Color3.fromRGB(255,255,255)bY.
TextSize=12 bY.TextTransparency=0.7 bY.TextWrapped=true bY.TextXAlignment=Enum.
TextXAlignment.Left bY.AutomaticSize=Enum.AutomaticSize.Y bY.BackgroundColor3=
Color3.fromRGB(255,255,255)bY.BackgroundTransparency=1 bY.BorderColor3=Color3.
fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Size=UDim2.fromScale(1,1)bY.Parent=bX
function bW:UpdateName(bZ)bY.Text=bZ end function bW:SetVisibility(bZ)bX.Visible
=bZ end if bV then b.Options[bV]=bW end return bW end function bO:Paragraph(bU,
bV)local bW,bX={Settings=bU},Instance.new'Frame'bX.Name='Paragraph'bX.
AutomaticSize=Enum.AutomaticSize.Y bX.BackgroundColor3=Color3.fromRGB(0,0,0)bX.
BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel
=0 bX.Size=UDim2.new(1,0,0,38)bX.Parent=bP local bY=Instance.new'TextLabel'bY.
Name='ParagraphHeader'bY.FontFace=Font.new(o.interFont,Enum.FontWeight.Medium,
Enum.FontStyle.Normal)bY.RichText=true bY.Text=bW.Settings.Header bY.TextColor3=
Color3.fromRGB(255,255,255)bY.TextSize=15 bY.TextTransparency=0.4 bY.TextWrapped
=true bY.TextXAlignment=Enum.TextXAlignment.Left bY.AutomaticSize=Enum.
AutomaticSize.Y bY.BackgroundColor3=Color3.fromRGB(255,255,255)bY.
BackgroundTransparency=1 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel
=0 bY.Size=UDim2.fromScale(1,0)bY.Parent=bX local bZ=Instance.new'UIListLayout'
bZ.Name='UIListLayout'bZ.Padding=UDim.new(0,5)bZ.SortOrder=Enum.SortOrder.
LayoutOrder bZ.Parent=bX local b_=Instance.new'TextLabel'b_.Name='ParagraphBody'
b_.FontFace=Font.new(o.interFont)b_.RichText=true b_.Text=bW.Settings.Body b_.
TextColor3=Color3.fromRGB(255,255,255)b_.TextSize=13 b_.TextTransparency=0.5 b_.
TextWrapped=true b_.TextXAlignment=Enum.TextXAlignment.Left b_.AutomaticSize=
Enum.AutomaticSize.Y b_.BackgroundColor3=Color3.fromRGB(255,255,255)b_.
BackgroundTransparency=1 b_.BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel
=0 b_.LayoutOrder=1 b_.Size=UDim2.fromScale(1,0)b_.Parent=bX function bW:
UpdateHeader(b0)bY.Text=b0 end function bW:UpdateBody(b0)b_.Text=b0 end function
bW:SetVisibility(b0)bX.Visible=b0 end if bV then b.Options[bV]=bW end return bW
end function bO:Divider()local bU,bV={},Instance.new'Frame'bV.Name='Divider'bV.
AnchorPoint=Vector2.new(0,1)bV.AutomaticSize=Enum.AutomaticSize.Y bV.
BackgroundColor3=Color3.fromRGB(255,255,255)bV.BackgroundTransparency=1 bV.
BorderColor3=Color3.fromRGB(0,0,0)bV.BorderSizePixel=0 bV.Position=UDim2.
fromScale(0,1)bV.Size=UDim2.new(1,0,0,1)bV.Parent=bP local bW=Instance.new
'UIPadding'bW.Name='UIPadding'bW.PaddingBottom=UDim.new(0,8)bW.PaddingTop=UDim.
new(0,8)bW.Parent=bV local bX=Instance.new'UIListLayout'bX.Name='UIListLayout'bX
.SortOrder=Enum.SortOrder.LayoutOrder bX.Parent=bV local bY=Instance.new'Frame'
bY.Name='Line'bY.BackgroundColor3=Color3.fromRGB(255,255,255)bY.
BackgroundTransparency=0.9 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.
BorderSizePixel=0 bY.Size=UDim2.new(1,0,0,1)bY.Parent=bV function bU:Remove()bV:
Destroy()end function bU:SetVisibility(bZ)bV.Visible=bZ end return bU end
function bO:Spacer()local bU,bV={},Instance.new'Frame'bV.Name='Spacer'bV.
AnchorPoint=Vector2.new(0,1)bV.BackgroundColor3=Color3.fromRGB(255,255,255)bV.
BackgroundTransparency=1 bV.BorderColor3=Color3.fromRGB(0,0,0)bV.BorderSizePixel
=0 bV.Position=UDim2.fromScale(0,1)bV.Parent=bP function bU:Remove()bV:Destroy()
end function bU:SetVisibility(bW)bV.Visible=bW end return bU end return bO end
local bN=function()local bN=0.15 if t then t.Parent=nil end for bO,bP in pairs(l
)do v(bO,TweenInfo.new(bN,Enum.EasingStyle.Sine),{BackgroundTransparency=(bO==bx
and 0.98 or 1)}):Play()if bP.tabStroke then v(bP.tabStroke,TweenInfo.new(bN,Enum
.EasingStyle.Sine),{Transparency=(bO==bx and 0.95 or 1)}):Play()end if bP.
switcherImage then v(bP.switcherImage,TweenInfo.new(bN,Enum.EasingStyle.Sine),{
ImageTransparency=(bO==bx and 0.1 or 0.5)}):Play()end if bP.switcherName then v(
bP.switcherName,TweenInfo.new(bN,Enum.EasingStyle.Sine),{TextTransparency=(bO==
bx and 0.1 or 0.5)}):Play()end end l[bx].tabContent.Parent=aF t=l[bx].tabContent
a2.Text=bv.Name end bx.MouseButton1Click:Connect(function()bN()end)function bw:
Select()bN()end function bw:InsertConfigSection(bO)local bP=bw:Section{Side=
'Left'}if j then bP:Label{Text=
'Config system unavailable. (Environment isStudio)'}return
'Config system unavailable.'end local bQ,bR bP:Input{Name='Config Name',
Placeholder='Name',AcceptedCharacters='All',Callback=function(bS)bQ=bS end}local
bS=bP:Dropdown{Name='Select Config',Multi=false,Required=false,Options=b:
RefreshConfigList(),Callback=function(bS)bR=bS end}bP:Button{Name=
'Create Config',Callback=function()if not bQ or string.gsub(bQ,' ','')==''then x
:Notify{Title='Interface',Description='Config name cannot be empty.'}return end
local bT,bU=b:SaveConfig(bQ)if not bT then x:Notify{Title='Interface',
Description='Unable to save config, return error: '..bU}end x:Notify{Title=
'Interface',Description=string.format('Created config %q',bQ)}bS:ClearOptions()
bS:InsertOptions(b:RefreshConfigList())end}bP:Button{Name='Load Config',Callback
=function()local bT,bU=b:LoadConfig(bS.Value)if not bT then x:Notify{Title=
'Interface',Description='Unable to load config, return error: '..bU}return end x
:Notify{Title='Interface',Description=string.format('Loaded config %q',bS.Value)
}end}bP:Button{Name='Overwrite Config',Callback=function()local bT,bU=b:
SaveConfig(bS.Value)if not bT then x:Notify{Title='Interface',Description=
'Unable to overwrite config, return error: '..bU}return end x:Notify{Title=
'Interface',Description=string.format('Overwrote config %q',bS.Value)}end}bP:
Button{Name='Refresh Config List',Callback=function()bS:ClearOptions()bS:
InsertOptions(b:RefreshConfigList())end}local bT bP:Button{Name=
'Set as autoload',Callback=function()local bU=bS.Value writefile(b.Folder..
'/settings/autoload.txt',bU)bT:UpdateName('Autoload config: '..bU)x:Notify{Title
='Interface',Description=string.format('Set %q as autoload',bU)}end}bT=bP:Label{
Text='Autoload config: None'}if isfile(b.Folder..'/settings/autoload.txt')then
local bU=readfile(b.Folder..'/settings/autoload.txt')bT:UpdateName(
'Autoload config: '..bU)end end l[bx]={tabContent=bE,tabStroke=bz,switcherImage=
bB,switcherName=bC}return bw end return bp end local bp=function()if
setthreadidentity then pcall(setthreadidentity,7)elseif set_thread_identity then
pcall(set_thread_identity,7)elseif setidentity then pcall(setidentity,7)elseif
syn and syn.set_thread_identity then pcall(syn.set_thread_identity,7)end end
function x:Notify(bq)bp()local br={}local bs,bt=pcall(function()local bs=
Instance.new'Frame'bs.Name='Notification'bs.AnchorPoint=Vector2.new(0.5,0.5)bs.
AutomaticSize=Enum.AutomaticSize.Y bs.BackgroundColor3=Color3.fromRGB(15,15,15)
bs.BorderColor3=Color3.fromRGB(0,0,0)bs.BorderSizePixel=0 bs.Position=UDim2.
fromScale(0.5,0.5)bs.Size=UDim2.fromOffset(bq.SizeX or 250,0)bs.Parent=z local
bt=Instance.new'UIStroke'bt.Name='NotificationUIStroke'bt.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border bt.Color=Color3.fromRGB(255,255,255)bt.Transparency=0.9
bt.Parent=bs local bu=Instance.new'UICorner'bu.Name='NotificationUICorner'bu.
CornerRadius=UDim.new(0,10)bu.Parent=bs local bv=Instance.new'UIScale'bv.Name=
'NotificationUIScale'bv.Parent=bs bv.Scale=0 local bw=Instance.new'Frame'bw.Name
='NotificationInformation'bw.AutomaticSize=Enum.AutomaticSize.Y bw.
BackgroundColor3=Color3.fromRGB(255,255,255)bw.BackgroundTransparency=1 bw.
BorderColor3=Color3.fromRGB(0,0,0)bw.BorderSizePixel=0 bw.Size=UDim2.fromScale(1
,1)local bx=Instance.new'TextLabel'bx.Name='NotificationTitle'bx.FontFace=Font.
new(o.interFont,Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)bx.RichText=true
bx.Text=bq.Title bx.TextColor3=Color3.fromRGB(255,255,255)bx.TextSize=13 bx.
TextTransparency=0.2 bx.TextTruncate=Enum.TextTruncate.SplitWord bx.
TextXAlignment=Enum.TextXAlignment.Left bx.TextYAlignment=Enum.TextYAlignment.
Top bx.AutomaticSize=Enum.AutomaticSize.XY bx.BackgroundColor3=Color3.fromRGB(
255,255,255)bx.BackgroundTransparency=1 bx.BorderColor3=Color3.fromRGB(0,0,0)bx.
BorderSizePixel=0 bx.Size=UDim2.new(1,-12,0,0)local by=Instance.new'UIPadding'by
.Name='NotificationTitleUIPadding'by.PaddingRight=UDim.new(0,25)by.Parent=bx bx.
Parent=bw local bz=Instance.new'TextLabel'bz.Name='NotificationDescription'bz.
FontFace=Font.new(o.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)bz.
Text=bq.Description bz.TextColor3=Color3.fromRGB(255,255,255)bz.TextSize=11 bz.
TextTransparency=0.5 bz.TextWrapped=true bz.RichText=true bz.TextXAlignment=Enum
.TextXAlignment.Left bz.TextYAlignment=Enum.TextYAlignment.Top bz.AutomaticSize=
Enum.AutomaticSize.XY bz.BackgroundColor3=Color3.fromRGB(255,255,255)bz.
BackgroundTransparency=1 bz.BorderColor3=Color3.fromRGB(0,0,0)bz.BorderSizePixel
=0 bz.Size=UDim2.new(1,-12,0,0)local bA=Instance.new'UIPadding'bA.Name=
'NotificationDescriptionUIPadding'bA.PaddingRight=UDim.new(0,25)bA.PaddingTop=
UDim.new(0,17)bA.Parent=bz bz.Parent=bw local bB=Instance.new'UIPadding'bB.Name=
'NotificationUIPadding'bB.PaddingBottom=UDim.new(0,12)bB.PaddingLeft=UDim.new(0,
10)bB.PaddingRight=UDim.new(0,10)bB.PaddingTop=UDim.new(0,10)bB.Parent=bw bw.
Parent=bs local bC=Instance.new'Frame'bC.Name='NotificationControls'bC.
AutomaticSize=Enum.AutomaticSize.Y bC.BackgroundColor3=Color3.fromRGB(255,255,
255)bC.BackgroundTransparency=1 bC.BorderColor3=Color3.fromRGB(0,0,0)bC.
BorderSizePixel=0 bC.Size=UDim2.fromScale(1,1)local bD=Instance.new'TextButton'
bD.Name='Interactable'bD.FontFace=Font.new(o.interFont)bD.Text='\u{2713}'bD.
TextColor3=Color3.fromRGB(255,255,255)bD.TextSize=17 bD.TextTransparency=0.2 bD.
AnchorPoint=Vector2.new(1,0.5)bD.AutomaticSize=Enum.AutomaticSize.XY bD.
BackgroundColor3=Color3.fromRGB(255,255,255)bD.BackgroundTransparency=1 bD.
BorderColor3=Color3.fromRGB(0,0,0)bD.BorderSizePixel=0 bD.LayoutOrder=1 bD.
Position=UDim2.fromScale(1,0.5)bD.Parent=bC local bE=Instance.new'UIPadding'bE.
Name='UIPadding'bE.PaddingBottom=UDim.new(0,6)bE.PaddingRight=UDim.new(0,13)bE.
PaddingTop=UDim.new(0,6)bE.Parent=bC bC.Parent=bs local bF,bG={In=v(bv,TweenInfo
.new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Scale=bq.Scale
or 1}),Out=v(bv,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=0})},{None=function()bD:Destroy()end,Confirm=
function()bD.Text='\u{2713}'end,Cancel=function()bD.Text='\u{2717}'end}local bH=
bG[bq.Style]or function()bD:Destroy()end bH()if bD then bD.MouseButton1Click:
Connect(function()br:Cancel()if bq.Callback then task.spawn(bq.Callback)end end)
end local bI=task.spawn(function()bp()bF.In:Play()bq.Lifetime=bq.Lifetime or 3
if bq.Lifetime~=0 then task.wait(bq.Lifetime)local bI=bF.Out bI:Play()bI.
Completed:Wait()bp()pcall(function()bs:Destroy()end)end end)function br:
UpdateTitle(bJ)bx.Text=bJ end function br:UpdateDescription(bJ)bz.Text=bJ end
function br:Resize(bJ)local bK=bJ or 250 bs.Size=UDim2.fromOffset(bK,0)end
function br:Cancel()bp()task.cancel(bI)local bJ=bF.Out bJ:Play()bJ.Completed:
Wait()pcall(function()bs:Destroy()end)end end)if not bs then pcall(function()
local bu=b.GetService'StarterGui'or game:GetService'StarterGui'bu:SetCore(
'SendNotification',{Title=bq.Title or'Interface',Text=bq.Description or'',
Duration=bq.Lifetime or 3})end)return{UpdateTitle=function()end,
UpdateDescription=function()end,Resize=function()end,Cancel=function()end}end
return br end function x:Dialog(bq)local br,bs={},Instance.new'CanvasGroup'bs.
Name='DialogCanvas'bs.BackgroundColor3=Color3.fromRGB(255,255,255)bs.
BackgroundTransparency=1 bs.BorderColor3=Color3.fromRGB(0,0,0)bs.BorderSizePixel
=0 bs.Size=UDim2.fromScale(1,1)bs.GroupTransparency=1 bs.Parent=C local bt=
Instance.new'Frame'bt.Name='Dialog'bt.BackgroundColor3=Color3.fromRGB(0,0,0)bt.
BackgroundTransparency=0.5 bt.BorderColor3=Color3.fromRGB(0,0,0)bt.
BorderSizePixel=0 bt.Size=UDim2.fromScale(1,1)local bu=Instance.new'UICorner'bu.
Name='BaseUICorner'bu.CornerRadius=UDim.new(0,10)bu.Parent=bt local bv=Instance.
new'Frame'bv.Name='Prompt'bv.AnchorPoint=Vector2.new(0.5,0.5)bv.AutomaticSize=
Enum.AutomaticSize.Y bv.BackgroundColor3=Color3.fromRGB(15,15,15)bv.BorderColor3
=Color3.fromRGB(0,0,0)bv.BorderSizePixel=0 bv.Position=UDim2.fromScale(0.5,0.5)
bv.Size=UDim2.fromOffset(280,0)local bw=Instance.new'UIScale'bw.Name=
'BaseUIScale'bw.Parent=bv bw.Scale=0.95 local bx=Instance.new'UIStroke'bx.Name=
'GlobalSettingsUIStroke'bx.ApplyStrokeMode=Enum.ApplyStrokeMode.Border bx.Color=
Color3.fromRGB(255,255,255)bx.Transparency=0.9 bx.Parent=bv local by=Instance.
new'UICorner'by.Name='GlobalSettingsUICorner'by.CornerRadius=UDim.new(0,10)by.
Parent=bv local bz=Instance.new'UIPadding'bz.Name='GlobalSettingsUIPadding'bz.
PaddingBottom=UDim.new(0,20)bz.PaddingLeft=UDim.new(0,20)bz.PaddingRight=UDim.
new(0,20)bz.PaddingTop=UDim.new(0,20)bz.Parent=bv local bA=Instance.new'Frame'bA
.Name='Paragraph'bA.AutomaticSize=Enum.AutomaticSize.Y bA.BackgroundColor3=
Color3.fromRGB(0,0,0)bA.BackgroundTransparency=1 bA.BorderColor3=Color3.fromRGB(
0,0,0)bA.BorderSizePixel=0 bA.Size=UDim2.new(1,0,0,38)local bB=Instance.new
'TextLabel'bB.Name='ParagraphHeader'bB.FontFace=Font.new(o.interFont,Enum.
FontWeight.Medium,Enum.FontStyle.Normal)bB.RichText=true bB.Text=bq.Title bB.
TextColor3=Color3.fromRGB(255,255,255)bB.TextSize=18 bB.TextTransparency=0.4 bB.
TextWrapped=true bB.AutomaticSize=Enum.AutomaticSize.Y bB.BackgroundColor3=
Color3.fromRGB(255,255,255)bB.BackgroundTransparency=1 bB.BorderColor3=Color3.
fromRGB(0,0,0)bB.BorderSizePixel=0 bB.Size=UDim2.fromScale(1,0)bB.Parent=bA
local bC=Instance.new'UIListLayout'bC.Name='UIListLayout'bC.Padding=UDim.new(0,
15)bC.SortOrder=Enum.SortOrder.LayoutOrder bC.Parent=bA local bD=Instance.new
'TextLabel'bD.Name='ParagraphBody'bD.FontFace=Font.new(o.interFont)bD.RichText=
true bD.Text=bq.Description bD.TextColor3=Color3.fromRGB(255,255,255)bD.TextSize
=14 bD.TextTransparency=0.5 bD.TextWrapped=true bD.AutomaticSize=Enum.
AutomaticSize.Y bD.BackgroundColor3=Color3.fromRGB(255,255,255)bD.
BackgroundTransparency=1 bD.BorderColor3=Color3.fromRGB(0,0,0)bD.BorderSizePixel
=0 bD.LayoutOrder=1 bD.Size=UDim2.fromScale(1,0)bD.Parent=bA bA.Parent=bv local
bE=Instance.new'Frame'bE.Name='Interactions'bE.AutomaticSize=Enum.AutomaticSize.
Y bE.BackgroundColor3=Color3.fromRGB(0,0,0)bE.BackgroundTransparency=1 bE.
BorderColor3=Color3.fromRGB(0,0,0)bE.BorderSizePixel=0 bE.LayoutOrder=1 bE.Size=
UDim2.fromScale(1,0)local bF=Instance.new'UIListLayout'bF.Name='UIListLayout'bF.
Padding=UDim.new(0,10)bF.SortOrder=Enum.SortOrder.LayoutOrder bF.Parent=bE local
bG=Instance.new'UIPadding'bG.Name='UIPadding'bG.PaddingTop=UDim.new(0,20)bG.
Parent=bE bE.Parent=bv local bH=Instance.new'UIListLayout'bH.Name='UIListLayout'
bH.SortOrder=Enum.SortOrder.LayoutOrder bH.Parent=bv bv.Parent=bt bt.Parent=bs
local bI,bJ,bK,bL=v(bs,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{
GroupTransparency=0}),v(bs,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{
GroupTransparency=1}),v(bw,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Scale=1}),
v(bw,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Scale=0.95})local bM,bN=function(
)bI:Play()bK:Play()bI.Completed:Wait()bt.Parent=C end,function()if not bt.Parent
then return end bt.Parent=bs bJ:Play()bL:Play()bJ.Completed:Wait()bs:Destroy()
end for bO,bP in pairs(bq.Buttons)do local bQ=Instance.new'TextButton'bQ.Name=
'Button'bQ.FontFace=Font.new(o.interFont)bQ.Text=bP.Name bQ.TextColor3=Color3.
fromRGB(255,255,255)bQ.TextSize=15 bQ.TextTransparency=0.5 bQ.TextTruncate=Enum.
TextTruncate.AtEnd bQ.AutoButtonColor=false bQ.AutomaticSize=Enum.AutomaticSize.
Y bQ.BackgroundColor3=Color3.fromRGB(25,25,25)bQ.BorderColor3=Color3.fromRGB(0,0
,0)bQ.BorderSizePixel=0 bQ.Size=UDim2.fromScale(1,0)local bR=Instance.new
'UIPadding'bR.Name='UIPadding'bR.PaddingBottom=UDim.new(0,9)bR.PaddingLeft=UDim.
new(0,10)bR.PaddingRight=UDim.new(0,10)bR.PaddingTop=UDim.new(0,9)bR.Parent=bQ
local bS=Instance.new'UICorner'bS.Name='BaseUICorner'bS.CornerRadius=UDim.new(0,
10)bS.Parent=bQ bQ.Parent=bE local bT={DefaultTransparency=0,
DefaultTransparency2=0.5,HoverTransparency=0.3,HoverTransparency2=0.6,
EasingStyle=Enum.EasingStyle.Sine}local bU=function(bU)if bU=='Idle'then v(bQ,
TweenInfo.new(0.2,bT.EasingStyle),{BackgroundTransparency=bT.DefaultTransparency
,TextTransparency=bT.DefaultTransparency2}):Play()elseif bU=='Hover'then v(bQ,
TweenInfo.new(0.2,bT.EasingStyle),{BackgroundTransparency=bT.HoverTransparency,
TextTransparency=bT.HoverTransparency2}):Play()end end bQ.MouseButton1Click:
Connect(function()if bs.GroupTransparency~=0 then return end local bV,bW=pcall(
function()if bP.Callback then bP.Callback()end end)bN()if not bV then warn(
'[Dialog] Button callback error: '..tostring(bW))end end)bQ.MouseEnter:Connect(
function()bU'Hover'end)bQ.MouseLeave:Connect(function()bU'Idle'end)end bM()
function br:UpdateTitle(bO)bB.Text=bO end function br:UpdateDescription(bO)bD.
Text=bO end function br:Cancel()bN()end return br end function x:
SetNotificationsState(bq)z.Visible=bq end function x:GetNotificationsState(bq)
return z.Visible end function x:SetState(bq)q=bq C.Visible=bq end function x:
GetState()return q end local bq function x:Unload()if bq then bq()end y:Destroy(
)n=true end function x.onUnloaded(br)bq=br end local br=w.Keybind or Enum.
KeyCode.RightControl local bs=function()local bs=not x:GetState()x:SetState(bs)x
:Notify{Title=w.Title,Description=(bs and'Maximized 'or'Minimized ')..
'the menu. Use '..tostring(br.Name)..' to toggle it.',Lifetime=5}end g.
InputEnded:Connect(function(bt,bu)if bu then return end if bt.KeyCode==br then
bs()end end)R.MouseButton1Click:Connect(bs)P.MouseButton1Click:Connect(function(
)x:Dialog{Title=w.Title,Description=
[[Are you sure you want to exit the menu? You will lose any unsaved configurations.]]
,Buttons={{Name='Confirm',Callback=function()x:Unload()end},{Name='Cancel'}}}end
)function x:SetKeybind(bt)br=bt end function x:SetAcrylicBlurState(bt)r=bt C.
BackgroundTransparency=bt and 0.05 or 0 end function x:GetAcrylicBlurState()
return r end local bt,bu=function(bt)if bt then ar.Image=(aq and ap)or
'rbxassetid://0'ay.Text='@'..k.Name av.Text=k.DisplayName else ar.Image=o.
userInfoBlurred local bu,bv=#k.Name,#k.DisplayName ay.Text='@'..string.rep('.',
bu)av.Text=string.rep('.',bv)end end if w.ShowUserInfo~=nil then bu=w.
ShowUserInfo else bu=true end bt(bu)function x:SetUserInfoState(bv)bt(bv)end
function x:GetUserInfoState(bv)return bu end function x:SetSize(bv)C.Size=bv end
function x:GetSize(bv)return C.Size end function x:SetScale(bv)D.Scale=bv end
function x:GetScale()return D.Scale end local bv,bw={Toggle={Save=function(bv,bw
)return{type='Toggle',flag=bv,state=bw.State or false}end,Load=function(bv,bw)
bp()if b.Options[bv]and bw.state~=nil then b.Options[bv]:UpdateState(bw.state)
end end},Slider={Save=function(bv,bw)return{type='Slider',flag=bv,value=(bw.
Value and tostring(bw.Value))or false}end,Load=function(bv,bw)bp()if b.Options[
bv]and bw.value~=nil and bw.value~=false then b.Options[bv]:UpdateValue(bw.value
)end end},Input={Save=function(bv,bw)return{type='Input',flag=bv,text=bw.Text}
end,Load=function(bv,bw)bp()if b.Options[bv]and bw.text and type(bw.text)==
'string'then b.Options[bv]:UpdateText(bw.text)end end},Keybind={Save=function(bv
,bw)return{type='Keybind',flag=bv,bind=(typeof(bw.Bind)=='EnumItem'and bw.Bind.
Name)or nil}end,Load=function(bv,bw)bp()if b.Options[bv]and bw.bind then b.
Options[bv]:Bind(Enum.KeyCode[bw.bind])end end},Dropdown={Save=function(bv,bw)
return{type='Dropdown',flag=bv,value=bw.Value}end,Load=function(bv,bw)bp()if b.
Options[bv]and bw.value then b.Options[bv]:UpdateSelection(bw.value)end end},
Colorpicker={Save=function(bv,bw)local bx=function(bx)return string.format(
'#%02X%02X%02X',math.floor(bx.R*255),math.floor(bx.G*255),math.floor(bx.B*255))
end return{type='Colorpicker',flag=bv,color=bx(bw.Color)or nil,alpha=bw.Alpha}
end,Load=function(bv,bw)bp()local bx=function(bx)local by,bz,bA=tonumber(bx:sub(
2,3),16)/255,tonumber(bx:sub(4,5),16)/255,tonumber(bx:sub(6,7),16)/255 return
Color3.new(by,bz,bA)end if b.Options[bv]and bw.color then b.Options[bv]:
SetColor(bx(bw.color))if bw.alpha then b.Options[bv]:SetAlpha(bw.alpha)end end
end}},function()if j or not(isfolder and makefolder)then return
'Config system unavailable.'end local bv={b.Folder,b.Folder..'/settings'}for bw=
1,#bv do local bx=bv[bw]if not isfolder(bx)then makefolder(bx)end end end
function b:LoadAutoLoadConfig()bp()if j or not(isfile and readfile)then return
'Config system unavailable.'end local bx,by=(b.Folder..'/settings/autoload.txt')
if isfile(bx)then local bz,bA=pcall(readfile,bx)if bz and type(bA)=='string'then
bA=string.gsub(bA,'[\r\n%s]+','')if#bA>0 then by=bA end end end if not by then
local bz=b.Folder..'/settings/Default.json'if isfile(bz)then by='Default'if
writefile then pcall(writefile,bx,'Default')end end end if not by then print(
'[MacLib] Kh\u{f4}ng t\u{ec}m th\u{1ea5}y autoload config n\u{e0}o trong '..bx)
return end print(string.format(
'[MacLib] Kh\u{1edf}i \u{111}\u{1ed9}ng n\u{1ea1}p autoload config: %q',by))
local bz,bA=b:LoadConfig(by)if not bz then pcall(function()x:Notify{Title=
'Interface',Description='Error loading autoload config: '..tostring(bA)}end)
warn(string.format('[MacLib] L\u{1ed7}i khi n\u{1ea1}p autoload config %q: %s',
by,tostring(bA)))return end print(string.format(
'[MacLib] N\u{1ea1}p autoload config th\u{e0}nh c\u{f4}ng: %q',by))pcall(
function()x:Notify{Title='Interface',Description=string.format(
'Autoloaded config: %q',by)}end)end function b:SetFolder(bx)if j then return
'Config system unavailable.'end b.Folder=bx bw()end function b:SaveConfig(bx)if
j or not writefile then return'Config system unavailable.'end if(not bx)then
return false,'Please select a config file.'end local by,bz=b.Folder..
'/settings/'..bx..'.json',{objects={},contextData=b.contextData or{}}for bA,bB
in next,b.Options do if not bv[bB.Class]then continue end if bB.IgnoreConfig
then continue end table.insert(bz.objects,bv[bB.Class].Save(bA,bB))end local bA,
bB=pcall(e.JSONEncode,e,bz)if not bA then return false,
'Unable to encode into JSON data'end writefile(by,bB)return true end function b:
LoadConfig(bx)bp()if j or not(isfile and readfile)then return
'Config system unavailable.'end if(not bx)then return false,
'Please select a config file.'end bx=string.gsub(tostring(bx),'[\r\n%s]+','')if#
bx==0 then return false,'Please select a config file.'end local by=b.Folder..
'/settings/'..bx..'.json'if not isfile(by)then return false,'Invalid file: '..
tostring(by)end local bz,bA=pcall(e.JSONDecode,e,readfile(by))if not bz or type(
bA)~='table'then return false,'Unable to decode JSON data.'end b.LoadingConfig=
true b.contextData=bA.contextData or{}local bB,bC=bA.objects or{},0 for bD,bE in
next,bB do if bE and bE.type and bv[bE.type]then local bF,bG=pcall(function()bv[
bE.type].Load(bE.flag,bE)end)if bF then bC=bC+1 else warn(string.format(
'[MacLib:LoadConfig] L\u{1ed7}i khi n\u{1ea1}p option %s (%s): %s',tostring(bE.
flag),tostring(bE.type),tostring(bG)))end end end print(string.format(
'[MacLib:LoadConfig] \u{110}\u{e3} n\u{1ea1}p config %q (%d/%d options th\u{e0}nh c\u{f4}ng)'
,bx,bC,#bB))task.delay(1,function()b.LoadingConfig=false end)return true end
function b:RefreshConfigList()if j or not(isfolder and listfiles)then return
'Config system unavailable.'end local bx,by=(isfolder(b.Folder)and isfolder(b.
Folder..'/settings'))and listfiles(b.Folder..'/settings')or{},{}for bz=1,#bx do
local bA=bx[bz]if bA:sub(-5)=='.json'then local bB=bA:find('.json',1,true)local
bC,bD=bB,bA:sub(bB,bB)while bD~='/'and bD~='\\'and bD~=''do bB=bB-1 bD=bA:sub(bB
,bB)end if bD=='/'or bD=='\\'then local bE=bA:sub(bB+1,bC-1)if bE~='options'then
table.insert(by,bE)end end end end return by end y.Enabled=false local bx={}for
by,bz in pairs(o)do table.insert(bx,bz)end f:PreloadAsync(bx)y.Enabled=true q=
true return x end function b:Demo()local aa=b:Window{Title='Maclib Demo',
Subtitle='This is a subtitle.',Size=UDim2.fromOffset(868,650),DragStyle=1,
DisabledWindowControls={},ShowUserInfo=true,Keybind=Enum.KeyCode.RightControl,
AcrylicBlur=true}local ab,ac={UIBlurToggle=aa:GlobalSetting{Name='UI Blur',
Default=aa:GetAcrylicBlurState(),Callback=function(ab)aa:SetAcrylicBlurState(ab)
aa:Notify{Title=aa.Settings.Title,Description=(ab and'Enabled'or'Disabled')..
' UI Blur',Lifetime=5}end},NotificationToggler=aa:GlobalSetting{Name=
'Notifications',Default=aa:GetNotificationsState(),Callback=function(ab)aa:
SetNotificationsState(ab)aa:Notify{Title=aa.Settings.Title,Description=(ab and
'Enabled'or'Disabled')..' Notifications',Lifetime=5}end},ShowUserInfo=aa:
GlobalSetting{Name='Show User Info',Default=aa:GetUserInfoState(),Callback=
function(ab)aa:SetUserInfoState(ab)aa:Notify{Title=aa.Settings.Title,Description
=(ab and'Showing'or'Redacted')..' User Info',Lifetime=5}end}},{TabGroup1=aa:
TabGroup()}local ad={Main=ac.TabGroup1:Tab{Name='Demo',Image=
'rbxassetid://18821914323'},Settings=ac.TabGroup1:Tab{Name='Settings',Image=
'rbxassetid://10734950309'}}local ae={MainSection1=ad.Main:Section{Side='Left'}}
ae.MainSection1:Header{Name='Header #1'}ae.MainSection1:Button{Name='Button',
Callback=function()aa:Dialog{Title=aa.Settings.Title,Description=
[[Lorem ipsum odor amet, consectetuer adipiscing elit. Eros vestibulum aliquet mattis, ex platea nunc.]]
,Buttons={{Name='Confirm',Callback=function()print'Confirmed!'end},{Name=
'Cancel'}}}end}ae.MainSection1:Input({Name='Input',Placeholder='Input',
AcceptedCharacters='All',Callback=function(af)aa:Notify{Title=aa.Settings.Title,
Description='Successfully set input to '..af}end,onChanged=function(af)print(
'Input is now '..af)end},'Input')ae.MainSection1:Slider({Name='Slider',Default=
50,Minimum=0,Maximum=100,DisplayMethod='Percent',Precision=0,Callback=function(
af)print('Changed to '..af)end},'Slider')ae.MainSection1:Toggle({Name='Toggle',
Default=false,Callback=function(af)aa:Notify{Title=aa.Settings.Title,Description
=(af and'Enabled 'or'Disabled ')..'Toggle'}end},'Toggle')ae.MainSection1:
Keybind({Name='Keybind',Blacklist=false,Callback=function(af)aa:Notify{Title=
'Demo Window',Description='Pressed keybind - '..tostring(af.Name),Lifetime=3}end
,onBinded=function(af)aa:Notify{Title='Demo Window',Description=
'Successfully Binded Keybind to - '..tostring(af.Name),Lifetime=3}end},'Keybind'
)ae.MainSection1:Colorpicker({Name='Colorpicker',Default=Color3.fromRGB(0,255,
255),Callback=function(af)print('Color: ',af)end},'Colorpicker')local af,ag,ah,
ai=ae.MainSection1:Colorpicker({Name='Transparency Colorpicker',Default=Color3.
fromRGB(255,0,0),Alpha=0,Callback=function(af,ag)print('Color: ',af,' Alpha: ',
ag)end},'TransparencyColorpicker'),0 ae.MainSection1:Toggle({Name='Rainbow',
Default=false,Callback=function(aj)ah=aj if ah then ai=game:GetService
'RunService'.RenderStepped:Connect(function(ak)ag=(ag+ak*0.1)%1 af:SetColor(
Color3.fromHSV(ag,1,1))end)elseif ai then ai:Disconnect()ai=nil end end},
'RainbowToggle')local aj={'Apple','Banana','Orange','Grapes','Pineapple','Mango'
,'Strawberry','Blueberry','Watermelon','Peach'}local ak,al=ae.MainSection1:
Dropdown({Name='Dropdown',Multi=false,Required=true,Options=aj,Default=1,
Callback=function(ak)print('Dropdown changed: '..ak)end},'Dropdown'),ae.
MainSection1:Dropdown({Name='Multi Dropdown',Search=true,Multi=true,Required=
false,Options=aj,Default={'Apple','Orange'},Callback=function(ak)local al={}for
am,an in next,ak do table.insert(al,am)end print('Mutlidropdown changed:',table.
concat(al,', '))end},'MultiDropdown')ae.MainSection1:Button{Name=
'Update Selection',Callback=function()ak:UpdateSelection'Grapes'al:
UpdateSelection{'Banana','Pineapple'}end}ae.MainSection1:Divider()ae.
MainSection1:Header{Text='Header #2'}ae.MainSection1:Paragraph{Header=
'Paragraph',Body=
[[Paragraph body. Lorem ipsum odor amet, consectetuer adipiscing elit. Morbi tempus netus aliquet per velit est gravida.]]
}ae.MainSection1:Label{Text=
'Label. Lorem ipsum odor amet, consectetuer adipiscing elit.'}ae.MainSection1:
SubLabel{Text=
[[Sub-Label. Lorem ipsum odor amet, consectetuer adipiscing elit.]]}b:SetFolder
'Maclib'ad.Settings:InsertConfigSection'Left'aa.onUnloaded(function()print
'Unloaded!'end)ad.Main:Select()b:LoadAutoLoadConfig()end return b end function a
.c()local aa,ab={}function aa:SetWindow(ac)ab=ac end function aa.Notify(ac,ad,ae
)ae=ae or 3 if ab then local af=pcall(function()ab:Notify{Title=ac,Description=
ad,Lifetime=ae}end)if af then return end end pcall(function()game:GetService
'StarterGui':SetCore('SendNotification',{Title=ac,Text=ad,Duration=ae})end)end
return aa end function a.d()local aa,ab,ac,ad,ae,af,ag=a.load'b',a.load'c',{},
false,false,false function ac.Suspend()ae=true ad=false end function ac.Resume()
ae=false end function ac.SetRecording(ah)af=ah and true or false end function ac
.IsRecording()return af end function ac.IsSuspended()if ae or(aa.LoadingConfig==
true)or af then return true end local ah,ai=pcall(require,
'@routes/DungeonQuest/core/coordinator')if ah and ai and ai.IsLocked and ai.
IsLocked()then return true end return false end function ac.SetActive(ah)ag=(
typeof(ah)=='string'and#ah>0)and string.gsub(ah,'[\r\n%s]+','')or nil if ag and
writefile then pcall(function()local ai=aa.Folder if isfolder and not isfolder(
ai)then makefolder(ai)end if isfolder and not isfolder(ai..'/settings')then
makefolder(ai..'/settings')end writefile(ai..'/settings/autoload.txt',ag)end)end
end function ac.GetActive()return ag end local ah=function()if ag then return ag
end local ah=aa.Folder local ai=ah..'/settings/autoload.txt'if isfile and
isfile(ai)then local aj,ak=pcall(readfile,ai)if aj and typeof(ak)=='string'then
ak=string.gsub(ak,'[\r\n%s]+','')if#ak>0 then ag=ak return ag end end end ag=
'Default'pcall(function()if writefile and makefolder and isfolder then if not
isfolder(ah)then makefolder(ah)end if not isfolder(ah..'/settings')then
makefolder(ah..'/settings')end if not isfile(ai)then writefile(ai,'Default')end
end end)return ag end function ac.SaveNow()if ac.IsSuspended()then return end
local ai=ah()if not ai then return end local aj,ak=aa:SaveConfig(ai)if not aj
and ak and ak~='Please select a config file.'then ab.Notify('AutoSave',
'Failed to save config: '..tostring(ak),3)end end function ac.Save()if ac.
IsSuspended()then return end if not ah()then return end if ad then return end ad
=true task.delay(0.5,function()ad=false if not ac.IsSuspended()and ac.GetActive(
)then ac.SaveNow()end end)end function ac.Wrap(ai)if type(ai)~='function'then
return ai end return function(...)ai(...)ac.Save()end end return ac end end
local aa,ab,ac=a.load'a',a.load'b',a.load'd'local ad,ae,af,ag,ah,ai,aj=aa.
HttpService or game:GetService'HttpService',{},'DQMacro','pathRecord',3,'normal'
,'full'local ak,al,am,an,ao=function(ak)if ak==aj then return aj end return ai
end,(isfile~=nil and writefile~=nil and makefolder~=nil and isfolder~=nil),{},
false,{}local ap,aq=function()for ap=#ao,1,-1 do pcall(ao[ap])end end,function()
local ap=ab.Folder or'EsclipseHub'return ap..'/'..af end local ar,as=function()
if not al then return end pcall(function()local ar=ab.Folder or'EsclipseHub'if
not isfolder(ar)then makefolder(ar)end local as=aq()if not isfolder(as)then
makefolder(as)end end)end,function(ar)if type(ar)~='string'then return'Unknown'
end return(string.gsub(ar,'[/\\:*?"<>|]','_'))end local at,au,av,aw,ax=function(
at)return aq()..'/'..as(at)..'.json'end,function(at)if not at then return nil
end return{X=math.round(at.X*100)/100,Y=math.round(at.Y*100)/100,Z=math.round(at
.Z*100)/100}end,function(at)if not at or type(at)~='table'then return nil end
return Vector3.new(at.X or 0,at.Y or 0,at.Z or 0)end,function(at)return type(at)
=='table'and type(at.points)=='table'and#at.points>0 end,function(at)if type(at)
~='table'or type(at.X)~='number'then return nil end local au=Vector3.new(at.X,0,
at.Z)if au.Magnitude<0.001 then return nil end return au.Unit end local ay,az,aA
,aB,aC,aD=function(ay)if type(ay)~='table'then return nil end local az={}for aA,
aB in ipairs(ay.dwells or{})do local aC=av(aB.pos)if aC then az[#az+1]={pos=aC,
dur=tonumber(aB.dur)or 0,facing=ax(aB.facing)}end end local aA={}for aB,aC in
ipairs(ay.skills or{})do local aD=av(aC.pos)if aD then aA[#aA+1]={pos=aD,facing=
ax(aC.facing),key=aC.key,dw=math.floor(tonumber(aC.dw)or 0),dwT=tonumber(aC.dwT)
or 0}end end if#az==0 and#aA==0 then return nil end return{dwells=az,skills=aA}
end,function()if an then return end an=true if al then ar()local ay=aq()if
isfolder'DQMacro'and listfiles then pcall(function()local az=listfiles'DQMacro'
if type(az)=='table'then for aA,aB in ipairs(az)do if type(aB)=='string'and
string.lower(string.sub(aB,-5))=='.json'and isfile(aB)then local aC=string.
match(aB,'([^/\\]+)$')or'unknown.json'local aD,aE=ay..'/'..aC,readfile(aB)
writefile(aD,aE)delfile(aB)end end end end)end if listfiles and isfolder(ay)then
local az,aA=pcall(function()return listfiles(ay)end)if az and type(aA)=='table'
then for aB,aC in ipairs(aA)do if type(aC)=='string'and string.lower(string.sub(
aC,-5))=='.json'then pcall(function()if isfile(aC)then local aD=readfile(aC)
local aE=ad:JSONDecode(aD)if type(aE)=='table'and type(aE.map)=='string'and
type(aE.rooms)=='table'then am[aE.map]=aE end end end)end end end end local az=
ab.contextData if type(az)=='table'and type(az[ag])=='table'then local aA,aB=az[
ag],false for aC,aD in pairs(aA)do if type(aC)=='string'and type(aD)=='table'
then if not am[aC]then am[aC]=aD end pcall(function()writefile(at(aC),ad:
JSONEncode(aD))end)aB=true end end if aB then az[ag]=nil ac.Save()end end else
local ay=ab.contextData if type(ay)=='table'and type(ay[ag])=='table'then for az
,aA in pairs(ay[ag])do if type(az)=='string'and type(aA)=='table'then am[az]=aA
end end end end end,0.1,0.82,0.3,function(ay,az)local aA,aB=ay.X-az.X,ay.Z-az.Z
return math.sqrt(aA*aA+aB*aB)end function ae.SimplifyPath(aE,aF)local aG=#aE if
aG<=2 then return aE end local aH={}for aI=1,aG do aH[aI]=false end aH[1]=true
aH[aG]=true local aI={1}for aJ=2,aG-1 do local aK,aL,aM=aE[aJ-1],aE[aJ],aE[aJ+1]
local aN,aO=aL.X-aK.X,aL.Z-aK.Z local aP,aQ,aR=math.sqrt(aN*aN+aO*aO),aM.X-aL.X,
aM.Z-aL.Z local aS=math.sqrt(aQ*aQ+aR*aR)if aP>=aC and aS>=aC then local aT=(aN*
aQ+aO*aR)/(aP*aS)if aT<aB then aH[aJ]=true table.insert(aI,aJ)end end end table.
insert(aI,aG)local aJ,aK=aF*aF,{}for aL=1,#aI-1 do local aM,aN=aI[aL],aI[aL+1]if
aN-aM>1 then table.insert(aK,{aM,aN})end end while#aK>0 do local aL=table.
remove(aK)local aM,aN=aL[1],aL[2]local aO,aP,aQ,aR=aE[aM].X,aE[aM].Z,aE[aN].X,aE
[aN].Z local aS,aT=aQ-aO,aR-aP local aU,aV,aW=aS*aS+aT*aT,-1,0 for aX=aM+1,aN-1
do local aY=0 if aU>0 then aY=((aE[aX].X-aO)*aS+(aE[aX].Z-aP)*aT)/aU aY=math.
clamp(aY,0,1)end local aZ,a_=aE[aX].X-(aO+aS*aY),aE[aX].Z-(aP+aT*aY)local a0=aZ*
aZ+a_*a_ if a0>aV then aV=a0 aW=aX end end if aW>0 and aV>aJ then aH[aW]=true
table.insert(aK,{aM,aW})table.insert(aK,{aW,aN})end end local aL={}for aM=1,aG
do if aH[aM]and(#aL==0 or aD(aL[#aL],aE[aM])>=aA or aM==aG)then table.insert(aL,
aE[aM])end end if#aL==1 then table.insert(aL,aE[aG])end return aL end function
ae.OnChanged(aE)if type(aE)~='function'then return function()end end table.
insert(ao,aE)return function()for aF,aG in ipairs(ao)do if aG==aE then table.
remove(ao,aF)break end end end end function ae.HasMap(aE)if type(aE)~='string'or
#aE==0 then return false end az()local aF=am[aE]if not aF or type(aF.rooms)~=
'table'then return false end for aG,aH in pairs(aF.rooms)do if aw(aH)and#aH.
points>0 then return true end end return false end function ae.GetRoomSegment(aE
,aF)if type(aE)~='string'or type(aF)~='number'then return nil end az()local aG=
am[aE]if not aG or type(aG.rooms)~='table'then return nil end local aH=aG.rooms[
tostring(aF)]if not aw(aH)then return nil end local aI={}for aJ,aK in ipairs(aH.
points)do local aL=av(aK)if aL then aI[#aI+1]=aL end end if#aI==0 then return
nil end return{startPos=av(aH.startPos)or aI[1],points=aI,events=aH.events and
ay(aH.events)or nil,speed=tonumber(aH.speed)or 0,boss=aH.boss==true}end function
ae.HasSegmentOrMacro(aE,aF)return ae.GetRoomSegment(aE,aF)~=nil end function ae.
GetMap(aE)if not ae.HasMap(aE)then return nil end az()local aF=am[aE]if not aF
then return nil end local aG={}for aH,aI in pairs(aF.rooms or{})do local aJ=
tonumber(aH)if aJ and aw(aI)then local aK=ae.GetRoomSegment(aE,aJ)if aK then aG[
aJ]=aK end end end return{map=aE,version=aF.version,rooms=aG,created=aF.created,
updated=aF.updated,mode=ak(aF.mode)}end function ae.GetMaps()az()local aE={}for
aF,aG in pairs(am)do if type(aF)=='string'and type(aG)=='table'and aG.map==aF
and type(aG.rooms)=='table'then local aH,aI,aJ=0,0,0 for aK,aL in pairs(aG.rooms
)do if tonumber(aK)~=nil and aw(aL)then aH+=1 if aL.boss==true then aI+=1 end aJ
+=#aL.points end end if aH>0 then table.insert(aE,{map=aF,roomCount=aH,bossCount
=aI,pointCount=aJ,updated=aG.updated,mode=ak(aG.mode)})end end end table.sort(aE
,function(aF,aG)return aF.map<aG.map end)return aE end function ae.Count()return
#ae.GetMaps()end function ae.SaveSegment(aE,aF,aG,aH,aI,aJ,aK)if type(aE)~=
'string'or#aE==0 then return false end if type(aF)~='number'or aF<=0 then return
false end if not aG or not aH or#aH==0 then return false end az()local aL=am[aE]
if not aL or type(aL)~='table'then aL={map=aE,version=ah,created=os.time(),
updated=os.time(),mode=ai,rooms={}}am[aE]=aL end if type(aL.rooms)~='table'then
aL.rooms={}end local aM={}for aN,aO in ipairs(aH)do aM[#aM+1]=au(aO)end local aN
={startPos=au(aG)or aM[1],points=aM}if aK then aN.boss=true end if type(aJ)==
'number'and aJ>0 then aN.speed=aJ end local aO=function(aO)if not aO or type(aO)
~='table'then return nil end local aP,aQ=#(aO.dwells or{}),#(aO.skills or{})if
aP==0 and aQ==0 then return nil end local aR={dwells={},skills={}}for aS,aT in
ipairs(aO.dwells or{})do aR.dwells[#aR.dwells+1]={pos=au(aT.pos),dur=aT.dur or 0
,facing=aT.facing}end for aS,aT in ipairs(aO.skills or{})do aR.skills[#aR.skills
+1]={pos=au(aT.pos),facing=aT.facing,key=aT.key,dw=aT.dw or 0,dwT=aT.dwT or 0}
end return aR end if aI and type(aI)=='table'then local aP=aO(aI)if aP then aN.
events=aP end end aL.rooms[tostring(aF)]=aN aL.version=ah aL.map=aE aL.updated=
os.time()if al then ar()pcall(function()writefile(at(aE),ad:JSONEncode(aL))end)
else local aP=ab.contextData if type(aP)=='table'then if not aP[ag]then aP[ag]={
}end aP[ag][aE]=aL ac.Save()end end ap()return true end function ae.GetMapMode(
aE)if type(aE)~='string'or#aE==0 then return ai end az()local aF=am[aE]if type(
aF)~='table'then return ai end return ak(aF.mode)end function ae.SetMapMode(aE,
aF)if type(aE)~='string'or#aE==0 then return false end local aG=ak(aF)az()local
aH=am[aE]if not aH or type(aH)~='table'then aH={map=aE,version=ah,created=os.
time(),updated=os.time(),mode=ai,rooms={}}am[aE]=aH end aH.mode=aG aH.map=aE aH.
updated=os.time()if al then ar()pcall(function()writefile(at(aE),ad:JSONEncode(
aH))end)else local aI=ab.contextData if type(aI)=='table'then if not aI[ag]then
aI[ag]={}end aI[ag][aE]=aH ac.Save()end end ap()return true end function ae.
RemoveMap(aE)az()if not am[aE]then return false end am[aE]=nil if al then local
aF=at(aE)pcall(function()if isfile(aF)then delfile(aF)end end)else local aF=ab.
contextData if type(aF)=='table'and aF[ag]then aF[ag][aE]=nil ac.Save()end end
ap()return true end function ae.ClearAll()az()if next(am)==nil then return end
local aE=aq()if al and isfolder(aE)and listfiles then pcall(function()local aF=
listfiles(aE)if type(aF)=='table'then for aG,aH in ipairs(aF)do if type(aH)==
'string'and string.lower(string.sub(aH,-5))=='.json'and isfile(aH)then delfile(
aH)end end end end)end table.clear(am)local aF=ab.contextData if type(aF)==
'table'and aF[ag]then aF[ag]=nil ac.Save()end ap()end function ae.ReloadFromDisk
()table.clear(am)an=false az()ap()end function ae.ReloadFromConfig()ae.
ReloadFromDisk()end return ae