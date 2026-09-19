local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b={Options={},Folder='Maclib'
,contextData={},GetService=function(b)return cloneref and cloneref(game:
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
.b()local aa={cleaned=false,callbacks={}}function aa.Register(ab)if type(ab)~=
'function'then return function()end end if aa.cleaned then pcall(ab)return
function()end end table.insert(aa.callbacks,ab)return function()for ac,ad in
ipairs(aa.callbacks)do if ad==ab then table.remove(aa.callbacks,ac)break end end
end end function aa.Cleanup()if aa.cleaned then return end aa.cleaned=true for
ab=#aa.callbacks,1,-1 do pcall(aa.callbacks[ab])end table.clear(aa.callbacks)end
function aa.IsActive()return not aa.cleaned end aa.OnCleanup=aa.Register return
aa end function a.c()local aa,ab={}function aa:SetWindow(ac)ab=ac end function
aa.Notify(ac,ad,ae)ae=ae or 3 if ab then local af=pcall(function()ab:Notify{
Title=ac,Description=ad,Lifetime=ae}end)if af then return end end pcall(function
()game:GetService'StarterGui':SetCore('SendNotification',{Title=ac,Text=ad,
Duration=ae})end)end return aa end function a.d()local aa,ab,ac,ad,ae,af,ag=a.
load'a',a.load'c',{},false,false,false function ac.Suspend()ae=true ad=false end
function ac.Resume()ae=false end function ac.SetRecording(ah)af=ah and true or
false end function ac.IsRecording()return af end function ac.IsSuspended()if ae
or(aa.LoadingConfig==true)or af then return true end local ah,ai=pcall(require,
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
return ai end return function(...)ai(...)ac.Save()end end return ac end function
a.e()local aa,ab,ac,ad=game:GetService'Players',game:GetService
'UserInputService',game:GetService'RunService',game:GetService
'VirtualInputManager'local ae=aa.LocalPlayer if not ae then local af=os.clock()+
5 repeat ae=aa.LocalPlayer if ae then break end task.wait(0.1)until os.clock()>
af end return{Players=aa,UserInputService=ab,RunService=ac,VirtualInputManager=
ad,player=ae}end function a.f()local aa,ab=a.load'e',a.load'b'local ac,ad,ae,af,
ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax,ay=aa.player,0.05,
'enemyProjectiles',0.5,{},false,16,16,true,false,false,{},0,{},0,{},{},{},{},{},
{},0,{}local az,aA,aB,aC,aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ,aR=function()
for az=#ay,1,-1 do pcall(ay[az])end end,{},'unknown',true,{},{},{},0,4,false
local aS=function(aS)if aS then table.insert(aF,aS)end return aS end function ag
.OnRespawn(aT)table.insert(aE,aT)end function ag.GetLastRespawnTime()return aG
end function ag.GetRespawnProtectionDuration()return aH end function ag.
SetRespawnProtectionDuration(aT)if type(aT)=='number'and aT>=0 then aH=aT end
end function ag.GetRespawnProtectionRemaining()if aG==0 then return 0 end local
aT=os.clock()-aG local aU=aH-aT return math.max(0,aU)end function ag.
IsJustRespawned(aT)local aU=aT or aH if aG==0 then return false end return(os.
clock()-aG)<=aU end function ag.WasDead()return aI end function ag.IsDead()local
aT=ac and ac.Character if not aT or not aT.Parent then return true end local aU=
aT:FindFirstChildOfClass'Humanoid'if not aU or aU.Health<=0 then return true end
return false end function ag.IsInvulnerable()local aT=ac and ac.Character if not
aT or not aT.Parent then return false,nil end local aU=aT:FindFirstChildOfClass
'Humanoid'if aU and aU.Health<=0 then return false,nil end local aV=ag.
GetRespawnProtectionRemaining()if aV>0 then return true,(
'Respawn Shield (%.1fs)'):format(aV)end return false,nil end local aT=function(
aT)if not aT or not aT:IsA'Model'then return nil end local aU=aT:FindFirstChild
'HumanoidRootPart'if aU and aU:IsA'BasePart'then return aU end if aT.PrimaryPart
and aT.PrimaryPart:IsA'BasePart'then return aT.PrimaryPart end for aV,aW in
ipairs(aT:GetDescendants())do if aW:IsA'BasePart'then return aW end end return
nil end local aU,aV=function(aU)if not aU or not aU:IsA'Model'or not aU.Parent
or aU==ac.Character then return false end local aV=aU:FindFirstChildOfClass
'Humanoid'if not aV or aV.Health<=0 then return false end return aT(aU)~=nil end
,function(aU)local aV=av[aU]if not aV then return end if aV.Died then aV.Died:
Disconnect()aV.Died=nil end av[aU]=nil end local aW,aX=function(aW)if not aW or
not at[aW]then return end aw[aW]=nil at[aW]=nil ax-=1 aV(aW)az()aN()end,function
(aW)if not dungeon or not aW then return nil end local aX=aW.Parent while aX do
if aX==dungeon then return nil end if aX.Parent==dungeon and(aX:IsA'Folder'or aX
:IsA'Model')then return aX end aX=aX.Parent end return nil end local aY=function
(aY)if not aU(aY)or at[aY]then return end local aZ,a_=aT(aY),aY:
FindFirstChildOfClass'Humanoid'if not aZ or not a_ then return end at[aY]={Model
=aY,Root=aZ,Humanoid=a_,Room=aX(aY)}ax+=1 av[aY]={Died=a_.Died:Connect(function(
)aW(aY)end)}if am and not aP then if aO then aO()end end az()aN()end local aZ=
function(aZ)if not aZ then return end if aU(aZ)then aY(aZ)return end if aw[aZ]
then return end aw[aZ]=true task.spawn(function()local a_=os.clock()+2 while aZ.
Parent and os.clock()<a_ do if aU(aZ)then aw[aZ]=nil aY(aZ)return end task.wait(
0.03)end aw[aZ]=nil if aZ.Parent and aU(aZ)then aY(aZ)end end)end local a_=
function(a_)if not a_ or as[a_]then return end as[a_]=true for a0,a1 in ipairs(
a_:GetDescendants())do if a1:IsA'Model'and aU(a1)then aY(a1)end end au[a_]={
Added=a_.DescendantAdded:Connect(function(a0)if a0:IsA'Model'then aZ(a0)elseif
a0:IsA'Humanoid'then local a1=a0:FindFirstAncestorOfClass'Model'if a1 then aZ(a1
)end end end),Removed=a_.DescendantRemoving:Connect(function(a0)if a0:IsA'Model'
then aW(a0)end end)}end aL=function()if not dungeon then dungeon=workspace:
WaitForChild('dungeon',30)end if not dungeon then return false end ao=0 for a0=#
ap,1,-1 do pcall(ap[a0],ao)end aq=0 for a0=#ar,1,-1 do pcall(ar[a0],aq)end for
a0,a1 in ipairs(dungeon:GetChildren())do if a1:IsA'Folder'or a1:IsA'Model'then
a_(a1)end end au[dungeon]={Added=dungeon.DescendantAdded:Connect(function(a0)if
a0:IsA'Model'then aZ(a0)elseif a0:IsA'Humanoid'then local a1=a0:
FindFirstAncestorOfClass'Model'if a1 then aZ(a1)end end end),Removed=dungeon.
DescendantRemoving:Connect(function(a0)if a0:IsA'Model'then aW(a0)end end)}
return true end aM=function()if not dungeon then return end for a0,a1 in pairs(
au)do if a1.Added then pcall(function()a1.Added:Disconnect()end)end if a1.
Removed then pcall(function()a1.Removed:Disconnect()end)end end au={}as={}for a0
in pairs(at)do aV(a0)end at={}ax=0 aw={}ag.ResetBossIndex()dungeon=nil end aK=
function()for a0,a1 in pairs(at)do if not a0 or not a0.Parent then aW(a0)else
local a2=a1.Humanoid or a0:FindFirstChildOfClass'Humanoid'a1.Humanoid=a2 if not
a2 or a2.Health<=0 then aW(a0)else local a3=a1.Root if not a3 or not a3.Parent
then a3=aT(a0)if a3 then a1.Root=a3 else aW(a0)end end end end end end function
ag.SetFastSpeed(a0)ai=a0 if ah and humanoid and humanoid.Parent then if humanoid
.WalkSpeed<ai then al=true humanoid.WalkSpeed=ai al=false end end end function
ag.SetSpeedEnabled(a0)ah=a0 if humanoid and humanoid.Parent then al=true if ah
then if humanoid.WalkSpeed<ai then humanoid.WalkSpeed=ai end else humanoid.
WalkSpeed=aj end al=false end end function ag.IsSpeedEnabled()return ah end
function ag.GetFastSpeed()return ai end function ag.SetInstantAccelEnabled(a0)ak
=a0 and true or false end function ag.IsInstantAccelEnabled()return ak end local
a0=function()if aQ then aQ:Disconnect()aQ=nil end if not humanoid or not
humanoid.Parent then return end aQ=humanoid:GetPropertyChangedSignal'WalkSpeed':
Connect(function()if al then return end if not humanoid or not humanoid.Parent
then return end local a0=humanoid.WalkSpeed if ah then if a0<ai then al=true
humanoid.WalkSpeed=ai al=false end else aj=a0 end end)end function ag.
SetHumanoid(a1)if not a1 then return end local a2=a1:WaitForChild('Humanoid',10)
if not a2 then return end humanoid=a2 rootPart=a1:WaitForChild(
'HumanoidRootPart',10)or a1.PrimaryPart aj=humanoid.WalkSpeed if ah and humanoid
.WalkSpeed<ai then al=true humanoid.WalkSpeed=ai al=false end if aR then aR:
Disconnect()aR=nil end aR=humanoid.Died:Connect(function()aI=true end)aS(
humanoid.HealthChanged:Connect(function(a3)if a3<=0 then aI=true elseif aI and
a3>0 then aI=false end end))end local a1=function()if not ab.IsActive()then
return end if not ak then return end if not humanoid or not humanoid.Parent or
humanoid.Health<=0 or humanoid.Sit then return end if not rootPart or not
rootPart.Parent then local a1=ac and ac.Character rootPart=a1 and a1:
FindFirstChild'HumanoidRootPart'if not rootPart then return end end if rootPart.
Anchored then return end local a1,a2=humanoid.MoveDirection,rootPart.
AssemblyLinearVelocity if a1.Magnitude>0.05 then local a3=ah and math.max(ai,
humanoid.WalkSpeed)or humanoid.WalkSpeed rootPart.AssemblyLinearVelocity=Vector3
.new(a1.X*a3,a2.Y,a1.Z*a3)end end if aa.RunService then local a2=aa.RunService.
PreSimulation or aa.RunService.Heartbeat if a2 then aS(a2:Connect(a1))end end
function ag.GetDungeonStartTime()return dungeonStartTime end function ag.
SetDungeonStartTime(a2)dungeonStartTime=a2 end function ag.GetDungeonElapsed()if
not dungeonStartTime then return nil end return os.clock()-dungeonStartTime end
function ag.ReadyDungeon()if not dungeon and not aL()then return false end
return true end function ag.GetHumanoid()return humanoid end function ag.
GetEnemyNames()local a2={}local a3=function(a3)if a3 and a3~=''and a3~=ac.Name
then a2[a3]=true end end if dungeon then for a4,a5 in ipairs(dungeon:
GetChildren())do if a5:IsA'Folder'or a5:IsA'Model'then for a6,a7 in ipairs(a5:
GetDescendants())do if a7:IsA'Model'and a7:FindFirstChildOfClass'Humanoid'then
a3(a7.Name)end end end end end for a4 in pairs(at)do a3(a4.Name)end local a4={}
for a5 in pairs(a2)do table.insert(a4,a5)end table.sort(a4)return a4 end
function ag.GetEnemyCount()return ax end function ag.GetTrackedEnemyData()local
a2={}for a3,a4 in pairs(at)do if a4 and a4.Root and a4.Root.Parent then a2[#a2+1
]=a4 end end return a2 end function ag.OnEnemyChanged(a2)if type(a2)~='function'
then return function()end end table.insert(ay,a2)return function()for a3,a4 in
ipairs(ay)do if a4==a2 then table.remove(ay,a3)break end end end end function ag
.GetEnemyProjectileNames()local a2,a3={},game:GetService'ReplicatedStorage'local
a4=a3:FindFirstChild(ae)if not a4 then return a2 end for a5,a6 in ipairs(a4:
GetChildren())do local a7=a6.ClassName if a7=='Model'or a7=='MeshPart'or a7==
'Part'then a2[a6.Name]=true end end return a2 end function ag.GetKeyHoldTime()
return ad end if ac and ac.Character and ac.Character.Parent then ag.
SetHumanoid(ac.Character)a0()else local a2=ac and ac.CharacterAdded and task.
spawn(function()local a2=ac.CharacterAdded:Wait()if a2 and ab.IsActive()then ag.
SetHumanoid(a2)a0()end end)end if ac then aS(ac.CharacterAdded:Connect(function(
a2)local a3,a4=pcall(function()if not a2 then return end aG=os.clock()ag.
SetHumanoid(a2)a0()for a3,a4 in ipairs(aE)do pcall(a4)end end)if not a3 then
warn('[Shared] respawn handler error:',tostring(a4))end end))end task.spawn(
function()while ab.IsActive()do task.wait(af)local a2=workspace:FindFirstChild
'dungeon'if dungeon and a2~=dungeon then aM()elseif not dungeon and a2 then aL()
end aN()end end)local a2=function()local a2=game:GetService'Workspace'for a3,a4
in ipairs(a2:GetDescendants())do if a4.Name=='dungeonName'and a4:IsA'ValueBase'
then local a5=a4.Value if type(a5)=='string'then local a6=string.gsub(a5,'%s+',
'')if a6~=''and string.lower(a6)~=aB then return a5 end end end end return nil
end task.spawn(function()while ab.IsActive()do task.wait(af)local a3=a2()if a3~=
aJ then aJ=a3 if a3 then ag.ResetBossIndex()end for a4=#aA,1,-1 do pcall(aA[a4],
a3)end end end end)local a3=function()return not(aJ and#aJ>0)end task.spawn(
function()while ab.IsActive()do task.wait(af)local a4=a3()if a4~=aC then aC=a4
for a5=#aD,1,-1 do pcall(aD[a5],aC)end end end end)task.spawn(function()local a4
,a5=pcall(function()return aL()end)if not a4 then warn(
'[EnemyTracker] Initialization error:',a5)end end)local a4=function()if not
dungeon then dungeon=workspace:FindFirstChild'dungeon'end if not dungeon then
return end local a4=pcall(function()for a4,a5 in ipairs(dungeon:GetChildren())do
if a5:IsA'Folder'or a5:IsA'Model'then if a5:IsA'Model'and aU(a5)then aZ(a5)end
for a6,a7 in ipairs(a5:GetDescendants())do if a7:IsA'Model'then aZ(a7)end end
end end aK()end)if not a4 then warn'[EnemyTracker] scanDungeonEnemies error'end
end function ag.ForceRescan()a4()end local a5,a6=0,2 task.spawn(function()while
ab.IsActive()do task.wait(a6)local a7=os.clock()if a7-a5<a6 then continue end a5
=a7 a4()end end)function ag.IsBossActive()return am end function ag.
OnBossActiveChanged(a7)if type(a7)~='function'then return function()end end
table.insert(an,a7)return function()for a8,a9 in ipairs(an)do if a9==a7 then
table.remove(an,a8)break end end end end function ag.GetCurrentBossIndex()return
ao end function ag.GetCombatTargetKey()if not am then return'Mob'end local a7=
math.clamp(ao,1,3)return'Boss'..tostring(a7)end function ag.ResetBossIndex()
local a7=am ao=0 am=false aP=nil for a8=#ap,1,-1 do pcall(ap[a8],ao)end if a7
then for a8=#an,1,-1 do pcall(an[a8],false)end end aN()end function ag.
OnBossIndexChanged(a7)if type(a7)~='function'then return function()end end table
.insert(ap,a7)return function()for a8,a9 in ipairs(ap)do if a9==a7 then table.
remove(ap,a8)break end end end end local a7=function(a7)if type(a7)~='string'
then return 0 end local a8=string.lower(a7)local a9=string.match(a8,
'boss.*(%d+)')if a9 then return 100+(tonumber(a9)or 1)end if string.find(a8,
'boss')then return 100+math.max(1,ao)end local b=string.match(a7,'^room(%d+)$')
if not b then return 0 end return tonumber(b)or 0 end local a8=function()if not
dungeon then return 0 end for a8,a9 in pairs(at)do if a9 and a9.Room then local
b=a7(a9.Room.Name)if b>0 then return b end end end if am then return 100+math.
max(1,ao)end return 0 end aN=function()local a9=a8()if a9==aq then return end aq
=a9 for b=#ar,1,-1 do pcall(ar[b],aq)end end function ag.GetCurrentRoomIndex()
return aq end function ag.OnRoomIndexChanged(a9)if type(a9)~='function'then
return function()end end table.insert(ar,a9)return function()for b,ba in ipairs(
ar)do if ba==a9 then table.remove(ar,b)break end end end end function ag.
GetCurrentDungeonName()return aJ end function ag.OnDungeonNameChanged(a9)if
type(a9)~='function'then return function()end end table.insert(aA,a9)return
function()for b,ba in ipairs(aA)do if ba==a9 then table.remove(aA,b)break end
end end end function ag.IsInLobby()return aC end function ag.OnLobbyChanged(a9)
if type(a9)~='function'then return function()end end table.insert(aD,a9)return
function()for b,ba in ipairs(aD)do if ba==a9 then table.remove(aD,b)break end
end end end local a9 function ag.SetRealPlayerLevel(b)local ba=tonumber(
tostring(b or''):match'%d+')if ba and ba>0 then a9=tostring(ba)_G.
RealPlayerLevel=a9 end end function ag.GetRealPlayerLevel()return a9 or _G.
RealPlayerLevel end local b aO=function()if not am or aP~=nil then return end
for ba,bb in pairs(at)do if bb and bb.Root and bb.Root.Parent then local bc=
false if bb.Room and type(bb.Room.Name)=='string'and string.find(string.lower(bb
.Room.Name),'boss')then bc=true elseif string.find(string.lower(ba.Name),'boss')
then bc=true elseif ba.Parent and string.find(string.lower(ba.Parent.Name),
'boss')then bc=true end if bc then aP=bb.Root.Position return end end end for ba
,bb in pairs(at)do if bb and bb.Root and bb.Root.Parent then aP=bb.Root.Position
return end end end local ba=function(ba)if am==ba then return end am=ba if ba
then ao+=1 aP=nil a4()aO()for bb=#ap,1,-1 do pcall(ap[bb],ao)end else aP=nil end
for bb=#an,1,-1 do pcall(an[bb],am)end aN()end function ag.GetBossSpawnPosition(
)if aP then return aP end aO()return aP end function ag.SetBossSpawnPosition(bb)
aP=bb end local function bb()if not ac then return end local bc=ac:
FindFirstChild'PlayerGui'if not bc then b=nil ba(false)return end local bd=bc:
FindFirstChild('bossHealth',true)if bd then if bd~=b then b=bd if b:IsA
'ScreenGui'then aS(b:GetPropertyChangedSignal'Enabled':Connect(bb))elseif b:IsA
'GuiObject'then aS(b:GetPropertyChangedSignal'Visible':Connect(bb))end end local
be=if bd:IsA'ScreenGui'then bd.Enabled elseif bd:IsA'GuiObject'then bd.Visible
else true ba(be)else b=nil ba(false)end end task.spawn(function()if not ac then
return end local bc=ac:WaitForChild('PlayerGui',30)if not bc then return end aS(
bc.DescendantAdded:Connect(bb))aS(bc.DescendantRemoving:Connect(bb))bb()while ab
.IsActive()and task.wait(0.5)do bb()end end)local bc,bd={}local be=function()if
bd then return bd end pcall(function()local be=ac or game:GetService'Players'.
LocalPlayer local bf=be and be:FindFirstChild'PlayerScripts'local bg=bf and bf:
FindFirstChild'PlayerModule'if bg then bd=require(bg):GetControls()end end)
return bd end function ag.DisableControls(bf)bf=bf or'default'bc[bf]=true local
bg=be()if bg and type(bg.Disable)=='function'then pcall(function()bg:Disable()
end)end end function ag.EnableControls(bf)bf=bf or'default'bc[bf]=nil if next(bc
)~=nil then return end local bg=be()if bg and type(bg.Enable)=='function'then
pcall(function()bg:Enable()end)end end ab.Register(function()if aQ then aQ:
Disconnect()aQ=nil end for bf,bg in ipairs(aF)do pcall(function()bg:Disconnect()
end)end table.clear(aF)table.clear(bc)local bf=be()if bf and type(bf.Enable)==
'function'then pcall(function()bf:Enable()end)end aM()end)return ag end function
a.g()local aa,ab,ac={},{},false function aa.SetLocked(ad)ac=ad and true or false
end function aa.IsLocked()return ac end function aa.Register(ad,ae,af)if type(ad
)~='string'or type(ae)~='function'or type(af)~='function'then return end ab[ad]=
{setEnabled=ae,isEnabled=af}end function aa.EnableExclusive(ad)if ac then return
end for ae,af in pairs(ab)do if ae~=ad and af.isEnabled()then pcall(af.
setEnabled,false)end end end function aa.IsEnabled(ad)local ae=ab[ad]return ae~=
nil and ae.isEnabled()end return aa end function a.h()local aa,ab=a.load'e',a.
load'f'local ac,ad=aa.player,{}function ad.Validate(ae)if not ae then return
false end local af=ae.Model if not af or not af.Parent or af==ac.Character then
return false end local ag=ae.Humanoid if not ag or not ag.Parent then ag=af:
FindFirstChildOfClass'Humanoid'ae.Humanoid=ag end if not ag or ag.Health<=0 then
return false end local ah=ae.Root if not ah or not ah.Parent then ah=af:
FindFirstChild'HumanoidRootPart'or af.PrimaryPart if not ah then for ai,aj in
ipairs(af:GetDescendants())do if aj:IsA'BasePart'then ah=aj break end end end if
not ah then return false end ae.Root=ah end return true end function ad.Scan()
local ae,af={},ab.GetTrackedEnemyData()for ag,ah in ipairs(af)do if ad.Validate(
ah)then table.insert(ae,ah)end end if#ae==0 and ab.ForceRescan then ab.
ForceRescan()af=ab.GetTrackedEnemyData()for ag,ah in ipairs(af)do if ad.
Validate(ah)then table.insert(ae,ah)end end end return ae end return ad end
function a.i()local aa={}function aa.SelectBestTarget(ab,ac,ad)local ae,af,ag=(
math.huge)for ah,ai in ipairs(ac)do if ad and ad()then return nil,nil,nil,nil,
math.huge end local aj=ai.Root if aj and aj.Parent then local ak=aj.Position
local al,am=ak.X-ab.X,ak.Z-ab.Z local an=al*al+am*am if an<ae then ae=an af=ai
ag=ak end end end local ah=ae<math.huge and math.sqrt(ae)or math.huge return af,
nil,nil,ag,ah end return aa end function a.j()local aa,ab,ac,ad,ae,af,ag,ah,ai=a
.load'i',a.load'h',{},{},1,6 function ac.GetTarget()return ag end function ac.
GetPathInstance()return ah end function ac.GetWaypoints()return ad end function
ac.GetWaypointIndex()return ae end function ac.SetWaypointIndex(aj)ae=math.
clamp(aj,1,math.max(1,#ad))end function ac.AdvanceWaypointIndex(aj)if not ad or#
ad==0 then return end local ak=ad[ae]if ak then local al=Vector3.new(ak.Position
.X-aj.X,0,ak.Position.Z-aj.Z).Magnitude if al<=3.5 then ae=math.min(#ad+1,ae+1)
end end end function ac.GetLastPathDestPos()return ai end function ac.
SetRepathThreshold(aj)if type(aj)=='number'and aj>0 then af=aj end end function
ac.GetRepathThreshold()return af end function ac.SetTarget(aj,ak,al,am)if ah and
ah~=ak then pcall(function()ah:Destroy()end)end ag=aj ah=ak ad=al or{}ae=1 ai=am
end function ac.UpdatePath(aj,ak,al)if ah and ah~=aj then pcall(function()ah:
Destroy()end)end ah=aj ad=ak or{}ae=1 ai=al end function ac.ClearTarget()if ah
then pcall(function()ah:Destroy()end)end ag=nil ah=nil ad={}ae=1 ai=nil end
function ac.IsTargetValid()if not ag then return false end return ab.Validate(ag
)end function ac.NeedsRepath(aj)if not ah or not ad or#ad==0 then return true
end if not ai or not aj then return true end return(aj-ai).Magnitude>af end
function ac.Repath(aj,ak)if not ak then return false end local al,am,an=aa.
ComputePathWithCost(aj,ak)if al and#am>0 then if ah then pcall(function()ah:
Destroy()end)end ah=al ad=am ae=1 ai=ak return true end return false end return
ac end function a.k()local aa=a.load'e'local ab,ac=aa.player,{}local ad=function
(ad)local ae={}if ad then for af,ag in ipairs(ad)do if ag and ag.Parent then
table.insert(ae,ag)end end end if ab and ab.Character and ab.Character.Parent
then table.insert(ae,ab.Character)end local af=workspace:FindFirstChild
'RaycastIgnore'if af then table.insert(ae,af)end return ae end function ac.
CastRay(ae,af,ag)local ah=af-ae local ai=ah.Magnitude if ai<0.3 then return
false,nil,af end local aj=RaycastParams.new()aj.FilterType=Enum.
RaycastFilterType.Exclude aj.FilterDescendantsInstances=ad(ag)aj.IgnoreWater=
true local ak,al,am=ae,ah,8 for an=1,am do local ao=workspace:Raycast(ak,al,aj)
if not ao then return false,nil,af end local ap=ao.Instance if ap and ap.
CanCollide and ap.CanQuery~=false then if ao.Normal.Y>0.65 then local aq=(ao.
Position-ak).Magnitude+0.15 if aq>=al.Magnitude then return false,nil,af end ak=
ao.Position+al.Unit*0.15 al=af-ak else return true,ap,ao.Position end else local
aq=(ao.Position-ak).Magnitude+0.15 if aq>=al.Magnitude then return false,nil,af
end ak=ao.Position+al.Unit*0.15 al=af-ak end end return false,nil,af end
function ac.CheckClearance(ae,af,ag)local ah,ai,aj=ac.CastRay(ae,af,ag)if ah
then return true,ai,aj end local ak=Vector3.new(af.X-ae.X,0,af.Z-ae.Z)if ak.
Magnitude>0.8 then local al=ak.Unit local am=Vector3.new(-al.Z,0,al.X)*0.6 local
an,ao=ae+am,af+am local ap=ac.CastRay(ae,an,ag)if not ap then local aq,ar,as=ac.
CastRay(an,ao,ag)if aq and(as-an).Magnitude>1 then return true,ar,as end end
local aq,ar=ae-am,af-am local as=ac.CastRay(ae,aq,ag)if not as then local at,au,
av=ac.CastRay(aq,ar,ag)if at and(av-aq).Magnitude>1 then return true,au,av end
end end return false,nil,af end function ac.ResolveDestination(ae,af,ag,ah,ai)
local aj,ak=ae,af local al,am,an,ao={origin=aj,targetPos=ak,directBlocked=false,
directHitPart=nil,directHitPos=nil,chosenDest=nil,mode='None',nodeIdx=nil},ac.
CheckClearance(aj,ak,ai)al.directBlocked=am al.directHitPart=an al.directHitPos=
ao if not am then al.chosenDest=af al.mode='Direct'return af,'Direct',nil,al end
local ap=math.clamp(ah or 1,1,ag and#ag or 1)if ag and#ag>0 then for aq=#ag,ap,-
1 do local ar=ag[aq]local as=ar.Position local at=as+Vector3.new(0,2,0)local au,
av,aw=ac.CheckClearance(aj,at,ai)if not au then al.chosenDest=as al.mode=
'Waypoint'al.nodeIdx=aq return as,'Waypoint',aq,al end end end al.mode='Blocked'
return nil,'Blocked',nil,al end function ac.ExecuteMove(ae,af,ag,ah,ai)if not ae
or not ag then return end ae:MoveTo(ag)local aj,ak=ag.Y-af.Y,Vector3.new(ag.X-af
.X,0,ag.Z-af.Z).Magnitude if aj>1.8 and ak<=7 then ae.Jump=true return end if ah
and#ah>0 then local al=math.clamp(ai or 1,1,#ah)for am=al,math.min(al+2,#ah)do
local an=ah[am]if an then local ao=Vector3.new(an.Position.X-af.X,0,an.Position.
Z-af.Z).Magnitude if ao<=5 then if an.Action==Enum.PathWaypointAction.Jump or(an
.Position.Y-af.Y)>1.8 then ae.Jump=true break end end end end end end return ac
end function a.l()local aa,ab,ac,ad,ae,af,ag={},0.85,0,2,{},64 function aa.
BindDetection(ah)ag=ah or nil end function aa.GetHazardPadding()return ac end aa
.GetHitboxPadding=aa.GetHazardPadding function aa.GetTrajectoryMargin()return ad
end function aa.SetTrajectoryMargin(ah)if type(ah)=='number'and ah>=0 and ah~=ad
then ad=ah aa.InvalidateCache()for ai,aj in ipairs(ae)do pcall(aj,ad)end end end
function aa.InvalidateCache()if ag and ag.GetActiveHazardsMap then for ah,ai in
pairs(ag.GetActiveHazardsMap())do ai.HazardZones=nil end end end function aa.
OnPaddingChanged(ah)if type(ah)=='function'then table.insert(ae,ah)end end
function aa.SetHazardPadding(ah)if type(ah)=='number'and ah>=0 and ah~=ac then
ac=ah aa.InvalidateCache()for ai,aj in ipairs(ae)do pcall(aj,ac)end end end aa.
SetHitboxPadding=aa.SetHazardPadding local ah,ai,aj,ak=game:GetService
'ReplicatedStorage',{'firstBossCrissCross','firstBossSeekingSpikes'},{
'smallicespikes','mediumicespikes','largeicespikes'}local al=function(al)if not
al or type(al)~='string'then return false end local am=al:lower():gsub('%s+','')
if#am==0 then return false end for an,ao in ipairs(aj)do if string.find(am,ao,1,
true)then return true end end return false end function aa.IsIceSpikesChain(am)
return al(am)end local am,an={'secondbosscriclehitbox','secondbosscirclehitbox'}
,1.2 local ao=function(ao)if not ao or type(ao)~='string'then return false end
local ap=ao:lower():gsub('%s+','')if#ap==0 then return false end for aq,ar in
ipairs(am)do if string.find(ap,ar,1,true)then return true end end return false
end function aa.IsSecondBossCircleChain(ap)return ao(ap)end function aa.
GetSecondBossCircleDuration()return an end function aa.
SetSecondBossCircleDuration(ap)if type(ap)=='number'and ap>=0.1 then an=math.
clamp(ap,0.1,10)aa.InvalidateCache()end end local ap={'movingbeam'}local aq=
function(aq)if not aq or type(aq)~='string'then return false end local ar=aq:
lower():gsub('%s+','')if#ar==0 then return false end for as,at in ipairs(ap)do
if string.find(ar,at,1,true)then return true end end return false end function
aa.IsMovingBeam(ar)return aq(ar)end local ar,as={'firstbossbigspike',
'firstbossbeampart','bigspike'},function(ar)if not ar or type(ar)~='string'then
return false end local as=ar:lower():gsub('%s+','')return string.find(as,
'firstbossbeampart',1,true)~=nil end function aa.IsBeamTelegraph(at)return as(at
)end local at=function(at)if not at or type(at)~='string'then return false end
local au=at:lower():gsub('%s+','')if#au==0 or string.find(au,'seekingspike',1,
true)then return false end for av,aw in ipairs(ar)do if string.find(au,aw,1,true
)then return true end end return false end function aa.IsBigSpike(au)return at(
au)end local au=function()if ak and ak>0 then return ak end local au,av=45,ah:
FindFirstChild'enemyProjectiles'if not av then return au end local aw=av:
FindFirstChild'largeIceSpikes'if not aw then for ax,ay in ipairs(av:GetChildren(
))do local az=(ay.Name or''):lower():gsub('%s+','')if az=='largeicespikes'then
aw=ay break end end end if not aw then return au end local ax,ay=0,Vector3.zero
if aw:IsA'Model'and aw.PrimaryPart then ay=aw.PrimaryPart.Position elseif aw:IsA
'BasePart'then ay=aw.Position end local az={}if aw:IsA'BasePart'then table.
insert(az,aw)else for aA,aB in ipairs(aw:GetDescendants())do if aB:IsA'BasePart'
then table.insert(az,aB)end end end if#az==0 then return au end for aA,aB in
ipairs(az)do local aC=aB.Size local aD,aE=math.max(aC.X,aC.Z)/2,(Vector3.new(aB.
Position.X,0,aB.Position.Z)-Vector3.new(ay.X,0,ay.Z)).Magnitude local aF=aE+aD
if aF>ax then ax=aF end end if ax>=5 then ak=ax return ak end return au end
function aa.GetLargeIceSpikesMaxRadius()return au()end local av=function(av)if
not av or type(av)~='string'then return false end local aw=av:lower():gsub('%s+'
,'')if#aw==0 then return false end for ax,ay in ipairs(ai)do local az=ay:lower()
:gsub('%s+','')if#az>0 and string.find(aw,az,1,true)then return true end end
return false end function aa.IsForceCircle(aw)return av(aw)end function aa.
AddForceCircleName(aw)if type(aw)=='string'and#aw>0 then table.insert(ai,aw)aa.
InvalidateCache()end end function aa.GetForceCircleNames()return ai end local aw
,ax,ay,az=function(aw)return aw and aw.Parent and aw.Transparency<=ab end,
function(aw,ax,ay)local az,aA,aB,aC=aw.Size,ay and ad or ac,(aw and aw.Name)or''
,(aw and aw.Parent and aw.Parent.Name)or''if at(aB)or at(aC)then local aD,aE=az,
aw:FindFirstChildWhichIsA('SpecialMesh',true)if aE then aD=Vector3.new(aD.X*math
.abs(aE.Scale.X),aD.Y*math.abs(aE.Scale.Y),aD.Z*math.abs(aE.Scale.Z))end local
aF={aD.X,aD.Y,aD.Z}table.sort(aF)local aG,aH=math.clamp(aF[2],6,60),math.clamp(
aF[3],8,80)local aI,aJ=aG/2+aA,aH/2+aA return{half=Vector3.new(aI,0,aJ),cframe=
aw.CFrame,isBigSpike=true}end if ax or(aw:IsA'Part'and(aw.Shape==Enum.PartType.
Ball or aw.Shape==Enum.PartType.Cylinder))then return{radius=math.max(az.X,az.Y,
az.Z)/2}end local aD=Vector3.new(math.max(az.X,0)/2+aA,0,math.max(az.Z,0)/2+aA)
return{half=aD,cframe=aw.CFrame}end,function(aw,ax,ay,az)if not ax then return
false end if ax.expireTime and os.clock()>ax.expireTime then return false end
local aA,aB=aw.X,aw.Z ay=ay or 0 local aC=(az or ax.isTrajectory)and ad or ac if
ax.radius then local aD,aE=(ax.part and ax.part.Parent)and ax.part.Position,ax.
isSecondBossChain==true local aF,aG=(aE and ax.cx)or(aD and aD.X)or ax.cx or 0,(
aE and ax.cz)or(aD and aD.Z)or ax.cz or 0 local aH,aI,aJ=aA-aF,aB-aG,ax.radius+
aC+ay return(aH*aH+aI*aI)<=(aJ*aJ)end local aD=(ax.part and ax.part.Parent)and
ax.part.CFrame or ax.cframe if aD then local aE,aF,aG=aD:PointToObjectSpace(aw),
ax.half.X,ax.half.Z if ay<=0 then return math.abs(aE.X)<=aF and math.abs(aE.Z)<=
aG else local aH,aI=math.max(0,math.abs(aE.X)-aF),math.max(0,math.abs(aE.Z)-aG)
return(aH*aH+aI*aI)<=(ay*ay)end end return false end,function(aw,ax)local ay=(ax
and ax.CFrame)or(aw:IsA'Model'and aw:GetPivot())if ay then local az=ay.
LookVector local aA=Vector3.new(-az.X,0,-az.Z)if aA.Magnitude>0.05 then return
aA.Unit end end local az=services.player or game:GetService'Players'.LocalPlayer
local aA=az and az.Character local aB=aA and(aA:FindFirstChild'HumanoidRootPart'
or aA.PrimaryPart)if aB and ax then local aC=Vector3.new(aB.Position.X-ax.
Position.X,0,aB.Position.Z-ax.Position.Z)if aC.Magnitude>0.1 then return aC.Unit
end end return Vector3.new(0,0,-1)end local aA=function(aA)if not aA or not aA.
Instance or not aA.Instance.Parent then return nil end local aB=aA.Instance
local aC=aA.Name or(aB and aB.Name)or''local aD,aE=av(aC),aA.IsTrajectory==true
local aF,aG=aE and ad or ac if al(aC)then local aH,aI=(au())if aB:IsA'BasePart'
then aI=aw(aB)and aB or nil elseif aB:IsA'Model'then if aB.PrimaryPart and aw(aB
.PrimaryPart)then aI=aB.PrimaryPart else for aJ,aK in ipairs(aB:GetDescendants()
)do if aK:IsA'BasePart'and aw(aK)and aK.Parent then aI=aK break end end end end
if not aI then return nil end local aJ=aI.Position local aK={radius=aH,cx=aJ.X,
cz=aJ.Z,part=aI,isTrajectory=false,isIceSpikes=true}return{zones={aK},center=
Vector3.new(aJ.X,0,aJ.Z),boundingRadius=aH+aF}end if ao(aC)then local aH if aB:
IsA'BasePart'then aH=aw(aB)and aB or nil elseif aB:IsA'Model'then if aB.
PrimaryPart and aw(aB.PrimaryPart)then aH=aB.PrimaryPart else for aI,aJ in
ipairs(aB:GetDescendants())do if aJ:IsA'BasePart'and aw(aJ)and aJ.Parent then aH
=aJ break end end end end if not aH then return nil end local aI,aJ,aK,aL,aM,aN,
aO,aP,aQ,aR=aH.Position,az(aB,aH),aA.SpawnClock or os.clock(),{},10,11,3,22,an,
0.4 local aS=(aM-1)*aP for aT=1,aM do local aU=(aT-1)*aP local aV,aW,aX=Vector3.
new(aI.X,0,aI.Z)+aJ*aU,aN+(aT-1)*aO,aK+aQ+(aT-1)*aR table.insert(aL,{radius=aW,
cx=aV.X,cz=aV.Z,part=aH,expireTime=aX,isTrajectory=false,isSecondBossChain=true,
circleIndex=aT})end local aT,aU=Vector3.new(aI.X,0,aI.Z)+aJ*(aS/2),aN+(aM-1)*aO
local aV,aW=(aS/2)+aU+aF,aK+aQ+(aM-1)*aR if aA then aA.MaxExpireTime=aW aA.
IsSyntheticChain=true end return{zones=aL,center=aT,boundingRadius=aV,
maxExpireTime=aW}end if as(aC)then return nil end if at(aC)then local aH if aB:
IsA'BasePart'then aH=aw(aB)and aB or nil elseif aB:IsA'Model'then aH=aB.
PrimaryPart or aB:FindFirstChildWhichIsA'BasePart'if not aH or not aw(aH)then
for aI,aJ in ipairs(aB:GetDescendants())do if aJ:IsA'BasePart'and aw(aJ)and aJ.
Parent then aH=aJ break end end end end if not aH then return nil end local aI,
aJ,aK=aH.Position,aH.Size,aH:FindFirstChildWhichIsA('SpecialMesh',true)if aK
then aJ=Vector3.new(aJ.X*math.abs(aK.Scale.X),aJ.Y*math.abs(aK.Scale.Y),aJ.Z*
math.abs(aK.Scale.Z))end local aL={aJ.X,aJ.Y,aJ.Z}table.sort(aL)local aM,aN=math
.clamp(aL[2],6,60),math.clamp(aL[3],8,80)local aO,aP=aM/2+aF,aN/2+aF local aQ={
half=Vector3.new(aO,0,aP),cframe=aH.CFrame,part=aH,cx=aI.X,cz=aI.Z,isTrajectory=
aE,isBigSpike=true}return{zones={aQ},center=Vector3.new(aI.X,0,aI.Z),
boundingRadius=math.sqrt(aO*aO+aP*aP)}end if aB:IsA'BasePart'then if not aw(aB)
then return nil end aG={aB}else aG={}for aH,aI in ipairs(aB:GetDescendants())do
if#aG>=af then break end if aI:IsA'BasePart'and aw(aI)and aI.Parent then aG[#aG+
1]=aI end end if#aG==0 then return nil end end local aH,aI,aJ,aK,aL={},math.huge
,-math.huge,math.huge,-math.huge for aM,aN in ipairs(aG)do local aO,aP=aN.
Position,aN.Size local aQ=math.max(aP.X,aP.Y,aP.Z)/2+aF aI=math.min(aI,aO.X-aQ)
aJ=math.max(aJ,aO.X+aQ)aK=math.min(aK,aO.Z-aQ)aL=math.max(aL,aO.Z+aQ)local aR=
ax(aN,aD,aE)if aR then aR.part=aN aR.isTrajectory=aE aH[#aH+1]=aR end end if#aH
==0 then return nil end local aM,aN,aO,aP=(aI+aJ)/2,(aK+aL)/2,(aJ-aI)/2,(aL-aK)/
2 return{zones=aH,center=Vector3.new(aM,0,aN),boundingRadius=math.sqrt(aO*aO+aP*
aP)}end local aB=function(aB)local aC=aB and aB.HazardZones if not aC then aC=
aA(aB)if aC and aB then aB.HazardZones=aC end end return aC end function aa.
GetHazardZones(aC)return aB(aC)end function aa.GetNearbyHazards(aC,aD)local aE=
ag if not aE then return{}end aD=aD or 65 local aF,aG,aH={},aC.X,aC.Z for aI,aJ
in pairs(aE.GetActiveHazardsMap())do local aK,aL=aJ.Instance,aB(aJ)if aL then
local aM,aN=aL.center.X,aL.center.Z if aK and aK.Parent then local aO=aK:IsA
'BasePart'and aK or aK.PrimaryPart or aK:FindFirstChildWhichIsA'BasePart'if aO
then aM=aO.Position.X aN=aO.Position.Z end end local aO,aP=aG-aM,aH-aN local aQ,
aR=aO*aO+aP*aP,aD+aL.boundingRadius if aQ<=aR*aR then table.insert(aF,aJ)end end
end return aF end function aa.IsPointInAnyHazard(aC,aD,aE,aF)local aG=ag if not
aG then return false,nil,nil end aE=aE or 0 local aH,aI,aJ,aK=math.huge,aF or aG
.GetActiveHazardsMap()for aL,aM in pairs(aI)do local aN=aM.Instance or(typeof(aL
)=='Instance'and aL)if aD and(aD==aN or(aN and aD.Name==aN.Name))then continue
end local aO=aM.Name or(aN and aN.Name)or''if aq(aO)or at(aO)then continue end
local aP=aB(aM)if not aP then continue end local aQ,aR=aP.center.X,aP.center.Z
if aN and aN.Parent then local aS=aN:IsA'BasePart'and aN or aN.PrimaryPart or aN
:FindFirstChildWhichIsA'BasePart'if aS then aQ=aS.Position.X aR=aS.Position.Z
end end local aS,aT=aC.X-aQ,aC.Z-aR local aU,aV=aS*aS+aT*aT,aP.boundingRadius+aE
if aU>aV*aV then continue end local aW=aM.IsTrajectory==true for aX=1,#aP.zones
do local aY=aP.zones[aX]if aw(aY.part)and ay(aC,aY,aE,aW or aY.isTrajectory)then
local aZ=(aC-aY.part.Position).Magnitude if aZ<aH then aH=aZ aJ=aM aK=aY.part
end break end end end return aK~=nil,aJ,aK end return aa end function a.m()local
aa,ab,ac=a.load'e',a.load'b',a.load'l'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,
ap=aa.RunService or game:GetService'RunService',aa.player,{},false,{},0.85,
Color3.fromRGB(255,45,45),Color3.fromRGB(0,160,255),Color3.fromRGB(0,230,90),
0.55,0.25 local aq=function()local aq=ae and ae.Character if not aq then return
nil end local ar=aq:FindFirstChild'HumanoidRootPart'or aq.PrimaryPart if not ar
then return nil end return ar.Position.Y-2.5 end function af.BindDetection(ar)ao
=ar or nil end local ar function af.BindTrajectory(as)ar=as or nil end function
af.IsEnabled()return ag end local as=function(as,at)local au,av,aw=as.ad,as.zone
,as.part local ax=as.anchorPart or aw if not au or not au.Parent or not ax or
not ax.Parent then return end local ay=av and(av.isSecondBossChain or(as.
hazardInfo and as.hazardInfo.IsSyntheticChain))local az=(ay and av.cx and av.cz
and Vector3.new(av.cx,0,av.cz))or(aw and aw.Parent and aw.Position)or((av and av
.cx and av.cz)and Vector3.new(av.cx,0,av.cz))if not az then return end local aA=
Vector3.new(az.X,at or az.Y,az.Z)if as.isCircle then local aB=CFrame.new(aA)*
CFrame.Angles(math.rad(90),0,0)au.CFrame=(ax==workspace.Terrain)and aB or ax.
CFrame:ToObjectSpace(aB)else local aB if av and av.isBigSpike then local aC=ar
and ar.GetHazardDirection and ar.GetHazardDirection(as.hazardInfo)if aC and aC.
Magnitude>0.01 then aB=CFrame.lookAt(aA,aA+aC)else local aD=(aw and aw.Parent)
and aw.CFrame or CFrame.identity local aE,aF,aG=aD:ToOrientation()aB=CFrame.new(
aA)*CFrame.Angles(0,aF,0)end else local aC=(aw and aw.Parent)and aw.CFrame or
CFrame.identity local aD,aF,aG=aC:ToOrientation()aB=CFrame.new(aA)*CFrame.
Angles(0,aF,0)end au.CFrame=(ax==workspace.Terrain)and aB or ax.CFrame:
ToObjectSpace(aB)end end local at=function()if not ag then return end local at,
au,av=false,aq(),os.clock()for aw,ax in pairs(ah)do local ay,az=aw.
IsSyntheticChain or(aw.MaxExpireTime and av<aw.MaxExpireTime),aw.Instance and aw
.Instance.Parent if not az and not ay then af.DetachZoneVisuals(aw)else if ax.
items then local aA={}for aB,aC in ipairs(ax.items)do local aF=aC.zone if aF and
aF.expireTime and av>aF.expireTime then if aC.ad and aC.ad.Parent then pcall(
function()aC.ad:Destroy()end)end elseif aC.ad and aC.ad.Parent then table.
insert(aA,aC)as(aC,au)end end ax.items=aA if#aA>0 then at=true else af.
DetachZoneVisuals(aw)end end end end if not at and ap then ap:Disconnect()ap=nil
end end local au=function()if not ap and ag then ap=ad.Heartbeat:Connect(at)end
end function af.DetachZoneVisuals(av)if not av then return end local aw=ah[av]if
not aw then return end if aw.adornments then for ax,ay in ipairs(aw.adornments)
do pcall(function()ay:Destroy()end)end table.clear(aw.adornments)end if aw.
connections then for ax,ay in ipairs(aw.connections)do pcall(function()ay:
Disconnect()end)end table.clear(aw.connections)end if aw.items then table.clear(
aw.items)end ah[av]=nil end function af.UpdateHazardVisualColor(av,aw)if not av
then return end local ax=ah[av]if not ax or not ax.items then return end local
ay=av.Name or(av.Instance and av.Instance.Name)or''local az,aA=(ac.
IsSecondBossCircleChain and ac.IsSecondBossCircleChain(ay))or(av and av.
IsSyntheticChain==true),aw==true or av.IsTrajectory==true local aB,aC=az and al
or(aA and ak or aj),aA and ac.GetTrajectoryMargin()or 0 for aF,aG in ipairs(ax.
items)do local aH,aI,aJ=aG.ad,aG.zone,aG.part if aH and aH.Parent and aI and aJ
and aJ.Parent then aH.Color3=aB if aG.isCircle and aI.radius then aH.Radius=aI.
radius+aC elseif aI.half then local aK,aL=aI.half.X,aI.half.Z aH.Size=Vector3.
new(aK*2,an,aL*2)end end end end function af.AttachZoneVisuals(av)if not ag or
not av then return end if ah[av]then af.DetachZoneVisuals(av)end local aw=ac.
GetHazardZones(av)if not aw or not aw.zones then return end local ax=av.Name or(
av.Instance and av.Instance.Name)or''local ay,az=(ac.IsSecondBossCircleChain and
ac.IsSecondBossCircleChain(ax))or(av and av.IsSyntheticChain==true),av.
IsTrajectory==true local aA,aB,aC,aF,aG,aH,aI=ay and al or(az and ak or aj),az
and ac.GetTrajectoryMargin()or 0,aq(),{},{},{},workspace.Terrain for aJ,aK in
ipairs(aw.zones)do local aL,aM,aN=aK.part,aK.isSecondBossChain==true,aK.
isBigSpike==true local aO=(aM or aN)and aI or aL if aM or aN or(aL and aL.Parent
and aL.Transparency<=ai)then local aP,aQ=false if aK.radius then aP=true local
aR=Instance.new'CylinderHandleAdornment'aR.Name='HazardGroundCircle'aR.Adornee=
aO aR.Radius=aK.radius+aB aR.Height=an aR.Color3=aA aR.Transparency=am aR.ZIndex
=2 aR.AlwaysOnTop=true aR.Parent=aO aQ=aR elseif aK.half and aK.cframe then
local aR=Instance.new'BoxHandleAdornment'aR.Name='HazardGroundBox'aR.Adornee=aO
aR.Size=Vector3.new(aK.half.X*2,an,aK.half.Z*2)aR.Color3=aA aR.Transparency=am
aR.ZIndex=2 aR.AlwaysOnTop=true aR.Parent=aO aQ=aR end if aQ then local aR={ad=
aQ,part=aL,anchorPart=aO,isCircle=aP,zone=aK,hazardInfo=av}as(aR,aC)table.
insert(aF,aR)table.insert(aG,aQ)if not aM and aL then local aS=aL:
GetPropertyChangedSignal'Transparency':Connect(function()if aL.Parent and aL.
Transparency>ai then pcall(function()aQ:Destroy()end)end end)table.insert(aH,aS)
end end end end if#aG>0 then ah[av]={items=aF,adornments=aG,connections=aH}au()
end end function af.ClearAll()if ap then ap:Disconnect()ap=nil end for av in
pairs(ah)do af.DetachZoneVisuals(av)end table.clear(ah)end function af.
RefreshAll()af.ClearAll()if not ag or not ao then return end for av,aw in pairs(
ao.GetActiveHazardsMap())do af.AttachZoneVisuals(aw)end end function af.
SetEnabled(av)ag=av and true or false if ag then af.RefreshAll()else af.
ClearAll()end end ac.OnPaddingChanged(function()if ag then af.RefreshAll()end
end)ab.Register(function()af.ClearAll()end)return af end function a.n()local aa,
ab,ac=a.load'e',a.load'b',a.load'l'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,
aq,ar,as,at,au=aa.RunService or game:GetService'RunService',game:GetService
'ReplicatedStorage',aa.player,{},true,{},0.85,Color3.fromRGB(255,60,60),Color3.
fromRGB(0,180,255),Color3.fromRGB(255,140,0),Color3.fromRGB(220,90,255),
'enemyProjectiles',false,{},{},{secondbossgreenorb=true,secondbossredorb=true,
secondbossyelloworb=true}local av=function()if ap then return end ap=true local
av=ae:FindFirstChild(ao)if av then for aw,ax in ipairs(av:GetChildren())do local
ay=(ax.Name or''):lower():gsub('%s+','')if#ay>0 then aq[ay]=true end end av.
ChildAdded:Connect(function(aw)local ax=(aw.Name or''):lower():gsub('%s+','')if#
ax>0 then aq[ax]=true end end)end end function ag.IsChasingProjectile(aw)if not
aw or type(aw)~='string'then return false end local ax=aw:lower():gsub('%s+','')
if#ax==0 then return false end if as[ax]==true then return true end for ay in
pairs(as)do if string.find(ax,ay,1,true)then return true end end return false
end function ag.IsEnemyProjectile(aw)av()if not aw or type(aw)~='string'then
return false end local ax=aw:lower():gsub('%s+','')if#ax==0 then return false
end if ar[ax]==true then return false end return aq[ax]==true end function ag.
BindDetection(aw)at=aw or nil end function ag.IsEnabled()return ah end local aw=
function()local aw=af and af.Character if not aw then return nil end local ax=aw
:FindFirstChild'HumanoidRootPart'or aw.PrimaryPart if not ax then return nil end
return ax.Position.Y-2.5 end local ax,ay=function(ax)if not ax or not ax.Parent
then return 2.5 end local ay=aw()if ay then local az=ay+2.5 local aA,aB=az-ax.
Position.Y,ax.Size.Y/2+1.2 return math.clamp(math.max(aA,aB),1.5,30)end return
math.clamp(ax.Size.Y/2+1.8,2,10)end,function(ax)return ax and ax.Parent and ax.
Transparency<=aj end local az,aA=function(az)if not az or not az.Parent then
return nil end if az:IsA'BasePart'then if ay(az)then return az end elseif az:IsA
'Model'then if az.PrimaryPart and ay(az.PrimaryPart)then return az.PrimaryPart
end local aA=az:FindFirstChild'HumanoidRootPart'if aA and ay(aA)then return aA
end for aB,aC in ipairs(az:GetDescendants())do if aC:IsA'BasePart'and ay(aC)then
return aC end end else for aA,aB in ipairs(az:GetDescendants())do if aB:IsA
'BasePart'and ay(aB)then return aB end end end return nil end,function(az)local
aA,aB=az and az.IsTrajectory==true,az and az.Name or'Hazard'local aC,aF=ag.
IsChasingProjectile(aB),ag.IsEnemyProjectile(aB)local aG=not aA or aC if aC then
local aH,aI=an,'220,100,255'return'C',aH,aI,true elseif aF then local aH,aI=aA
and am or al,aA and'255,160,50'or'0,210,255'return'P',aH,aI,aG else local aH,aI=
aA and am or ak,aA and'255,160,50'or'255,80,80'return'N',aH,aI,aG end end local
aB=function(aB,aC)if not aB or not aB.items or not aC then return end local aF,
aG,aH,aI=aA(aC)local aJ,aK=aC.Name or'Hazard',''if aI then local aL=aC.
SpawnClock or os.clock()local aM=math.max(0,os.clock()-aL)aK=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(255,220,220)'>%s</font> <font color='rgb(255,255,255)'><b>%.1fs</b></font>]]
):format(aH,aF,aJ,aM)else aK=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(220,235,255)'>%s</font>]]
):format(aH,aF,aJ)end for aL,aM in ipairs(aB.items)do if aM.label and aM.label.
Parent then aM.label.Text=aK end if aM.stroke and aM.stroke.Parent and aM.stroke
.Color~=aG then aM.stroke.Color=aG end end end local aC=function()if not ah then
return end local aC=false for aF,aG in pairs(ai)do local aH=aF.Instance if not
aH or not aH.Parent then ag.DetachTimerVisual(aF)else if aG.items then for aI=#
aG.items,1,-1 do local aJ=aG.items[aI]local aK=aJ.part if not ay(aK)then if aJ.
billboard and aJ.billboard.Parent then pcall(function()aJ.billboard:Destroy()end
)end table.remove(aG.items,aI)else if aJ.billboard and aJ.billboard.Parent then
aJ.billboard.StudsOffset=Vector3.new(0,ax(aK),0)end end end if#aG.items==0 then
ag.DetachTimerVisual(aF)else aC=true aB(aG,aF)end else ag.DetachTimerVisual(aF)
end end end if not aC and au then au:Disconnect()au=nil end end local aF,aG=
function()if not au and ah then au=ad.Heartbeat:Connect(aC)end end,function(aF,
aG)local aH,aI=ax(aF),Instance.new'BillboardGui'aI.Name='HazardLifespanTimer'aI.
Adornee=aF aI.AlwaysOnTop=true aI.MaxDistance=500 aI.LightInfluence=0 aI.
ResetOnSpawn=false aI.Active=false aI.Size=UDim2.new(0,150,0,24)aI.StudsOffset=
Vector3.new(0,aH,0)aI.ZIndexBehavior=Enum.ZIndexBehavior.Sibling local aJ=
Instance.new'Frame'aJ.Name='TimerFrame'aJ.Size=UDim2.new(1,0,1,0)aJ.
BackgroundColor3=Color3.fromRGB(15,15,20)aJ.BackgroundTransparency=0.25 aJ.
BorderSizePixel=0 aJ.Parent=aI local aK=Instance.new'UICorner'aK.CornerRadius=
UDim.new(0,6)aK.Parent=aJ local aL=Instance.new'UIStroke'aL.Name='Stroke'aL.
Thickness=1.3 aL.Color=aG or ak aL.Transparency=0.15 aL.Parent=aJ local aM=
Instance.new'TextLabel'aM.Name='TimerLabel'aM.Size=UDim2.new(1,-6,1,0)aM.
Position=UDim2.new(0,3,0,0)aM.BackgroundTransparency=1 aM.Font=Enum.Font.
GothamBold aM.TextSize=11 aM.TextColor3=Color3.fromRGB(255,255,255)aM.
TextStrokeTransparency=0 aM.TextStrokeColor3=Color3.fromRGB(0,0,0)aM.RichText=
true aM.TextXAlignment=Enum.TextXAlignment.Center aM.TextYAlignment=Enum.
TextYAlignment.Center aM.Text=''aM.Parent=aJ aI.Parent=aF return aI,aM,aL end
function ag.AttachTimerVisual(aH)if not ah or not aH then return end local aI=aH
.Name or(aH.Instance and aH.Instance.Name)or''if(ac.IsIceSpikesChain and ac.
IsIceSpikesChain(aI))or(ac.IsSecondBossCircleChain and ac.
IsSecondBossCircleChain(aI))then return end if ai[aH]then ag.DetachTimerVisual(
aH)end local aJ=aH.Instance if not aJ or not aJ.Parent then return end local aK,
aL=aA(aH)local aM=ac.GetHazardZones(aH)local aN,aO,aP=aM and aM.zones,{},{}local
aQ,aR=function(aQ,aR,aS,aT,aU)local aV={billboard=aR,label=aS,stroke=aT,part=aQ,
zone=aU}table.insert(aO,aV)local aW=aQ:GetPropertyChangedSignal'Transparency':
Connect(function()if not ay(aQ)then pcall(function()aR:Destroy()end)end end)
table.insert(aP,aW)local aX=aQ.AncestryChanged:Connect(function(aX,aY)if not aY
then pcall(function()aR:Destroy()end)end end)table.insert(aP,aX)end if aN and#aN
>0 then if aJ:IsA'Model'then if aJ.PrimaryPart and ay(aJ.PrimaryPart)then aR=aJ.
PrimaryPart elseif aJ:FindFirstChild'HumanoidRootPart'and ay(aJ:FindFirstChild
'HumanoidRootPart')then aR=aJ:FindFirstChild'HumanoidRootPart'end end if not aR
then local aS,aT=aM.center,math.huge for aU,aV in ipairs(aN)do local aW=aV.part
if ay(aW)then if aS then local aX,aY=aW.Position.X-aS.X,aW.Position.Z-aS.Z local
aZ=aX*aX+aY*aY if aZ<aT then aT=aZ aR=aW end else aR=aW break end end end end
end if not aR then aR=az(aJ)end if aR and ay(aR)then local aS,aT,aU=aG(aR,aL)aQ(
aR,aS,aT,aU,nil)end if#aO>0 then local aS={items=aO,connections=aP}ai[aH]=aS aB(
aS,aH)aF()end end function ag.DetachTimerVisual(aH)if not aH then return end
local aI=ai[aH]if not aI then return end if aI.connections then for aJ,aK in
ipairs(aI.connections)do pcall(function()aK:Disconnect()end)end table.clear(aI.
connections)end if aI.items then for aJ,aK in ipairs(aI.items)do if aK.billboard
and aK.billboard.Parent then pcall(function()aK.billboard:Destroy()end)end end
table.clear(aI.items)end ai[aH]=nil end function ag.UpdateHazardVisualColor(aH,
aI)if not aH then return end local aJ=ai[aH]if aJ then aB(aJ,aH)else ag.
AttachTimerVisual(aH)end end function ag.ClearAll()if au then au:Disconnect()au=
nil end for aH in pairs(ai)do ag.DetachTimerVisual(aH)end table.clear(ai)end
function ag.RefreshAll()ag.ClearAll()if not ah or not at then return end for aH,
aI in pairs(at.GetActiveHazardsMap())do if aI then ag.AttachTimerVisual(aI)end
end end function ag.SetEnabled(aH)ah=aH and true or false if ah then ag.
RefreshAll()else ag.ClearAll()end end ab.Register(function()ag.ClearAll()end)
return ag end function a.o()local aa,ab,ac,ad=a.load'e',a.load'b',a.load'l',a.
load'n'local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av=aa.RunService
or game:GetService'RunService',aa.player,{},false,45,{secondbossmovingbeam=80},{
firstbossbigspike=28,firstbossseekingspikes=10},{},0.85,Color3.fromRGB(255,140,0
),0.65,0.2,3.5,{firstbossseekingspikes='look_vector',firstbossbigspike=
'look_vector',firstbossbeampart='look_vector',secondbossmovingbeam='look_vector'
},function(ae)if not ae or type(ae)~='string'then return false end local af=ae:
lower():gsub('%s+','')return string.find(af,'firstbossbeampart',1,true)~=nil end
,function(ae)if not ae then return'seeking_spike'end local af=typeof(ae)==
'string'and ae or(ae.Name or'')local ag=af:lower():gsub('%s+','')if not string.
find(ag,'firstbossbeampart',1,true)then if string.find(ag,'bigspike',1,true)and
not string.find(ag,'seekingspike',1,true)then return'big_spike'end if string.
find(ag,'seekingspike',1,true)then return'seeking_spike'end return nil end if
typeof(ae)=='Instance'then local ah=ae:FindFirstChildWhichIsA('Beam',true)if ah
then if ah.Width0>=25 or ah.Width1>=25 then return'big_spike'else return
'seeking_spike'end end local ai=ae:IsA'BasePart'and ae.Position or(ae:IsA'Model'
and ae:GetPivot().Position)if ai then for aj,ak in ipairs(workspace:GetChildren(
))do local al=ak.Name:lower():gsub('%s+','')if string.find(al,
'firstbossbigspike',1,true)then local am=ak:IsA'BasePart'and ak.Position or(ak:
IsA'Model'and ak:GetPivot().Position)if am and(am-ai).Magnitude<15 then return
'big_spike'end elseif string.find(al,'seekingspike',1,true)then local am=ak:IsA
'BasePart'and ak.Position or(ak:IsA'Model'and ak:GetPivot().Position)if am and(
am-ai).Magnitude<15 then return'seeking_spike'end end end end end return
'seeking_spike'end local aw,ax=function(aw,ax)if not aw or type(aw)~='string'
then return false end local ay=aw:lower():gsub('%s+','')if#ay==0 or string.find(
ay,'seekingspike',1,true)then return false end if string.find(ay,
'firstbossbeampart',1,true)then return at(ax)=='big_spike'end return string.
find(ay,'firstbossbigspike',1,true)~=nil or string.find(ay,'bigspike',1,true)~=
nil end,function(aw,ax)if not aw or type(aw)~='string'then return false end
local ay=aw:lower():gsub('%s+','')if#ay==0 or string.find(ay,'firstbossbigspike'
,1,true)then return false end if string.find(ay,'firstbossbeampart',1,true)then
return at(ax)=='seeking_spike'end return string.find(ay,'firstbossseekingspikes'
,1,true)~=nil or string.find(ay,'seekingspike',1,true)~=nil end local ay,az=
function(ay,az)return aw(ay,az)or ax(ay,az)end,function(ay)if not ay or not ay.
Parent then return nil,nil,nil,nil end local az,aA=((ay.Name or''):lower())if
as(az)then aA=ay:IsA'BasePart'and ay or ay:FindFirstChildWhichIsA'BasePart'end
if not aA then local aB=ay:IsA'BasePart'and ay.Position or(ay:IsA'Model'and ay:
GetPivot().Position)if aB then local aC,aF=35,aw(ay.Name,ay)and'big_spike'or
'seeking_spike'for aG,aH in ipairs(workspace:GetChildren())do local aI=aH.Name:
lower()if as(aI)or string.find(aI,'beampart',1,true)then if at(aH)==aF then
local aJ=aH:IsA'BasePart'and aH.Position or(aH:IsA'Model'and aH:GetPivot().
Position)if aJ then local aK=(aJ-aB).Magnitude if aK<aC then aC=aK aA=aH end end
end end end end end if not aA then return nil,nil,nil,nil end local aB=aA:
FindFirstChild('Attachment2',true)if not aB or not aB:IsA'Attachment'then for aC
,aF in ipairs(aA:GetDescendants())do if aF:IsA'Attachment'and aF.Name~=
'Attachment0'and aF.Name~='Attachment1'then aB=aF break end end end local aC,aF=
aA.Position,aB and aB.WorldPosition if aF and aC then local aG=aF-aC local aH=
Vector3.new(aG.X,0,aG.Z)local aI=aH.Magnitude if aI>5 then local aJ=aH.Unit
return aI,aJ,aC,aF end end return nil,nil,nil,nil end local aA=function(aA)if
not aA then return nil end local aB,aC,aF,aG=0,0,0,{}if aA:IsA'BasePart'then
table.insert(aG,aA)else for aH,aI in ipairs(aA:GetDescendants())do if aI:IsA
'BasePart'then table.insert(aG,aI)end end end for aH,aI in ipairs(aG)do local aJ
,aK=aI.Size,aI:FindFirstChildWhichIsA('SpecialMesh',true)if aK then aJ=Vector3.
new(aJ.X*math.abs(aK.Scale.X),aJ.Y*math.abs(aK.Scale.Y),aJ.Z*math.abs(aK.Scale.Z
))end aB=math.max(aB,aJ.X)aC=math.max(aC,aJ.Y)aF=math.max(aF,aJ.Z)end if aB<=0
and aC<=0 and aF<=0 then return nil end local aH={aB,aC,aF}table.sort(aH)local
aI=aH[2]if aI<2 then aI=math.max(aH[1],aH[2])end return aI end local aB,aC=
function(aB)if ak.firstbossbigspike then return ak.firstbossbigspike end if
cachedBigSpikeWidth then return cachedBigSpikeWidth end if aB and not as(aB.Name
)then local aC=aA(aB)if aC and aC>=4 then cachedBigSpikeWidth=math.clamp(aC,8,60
)return cachedBigSpikeWidth end end for aC,aF in ipairs(workspace:GetChildren())
do local aG=aF.Name:lower()if string.find(aG,'firstbossbigspike',1,true)or(
string.find(aG,'bigspike',1,true)and not string.find(aG,'seekingspike',1,true)
and not as(aG))then local aH=aA(aF)if aH and aH>=4 then cachedBigSpikeWidth=math
.clamp(aH,8,60)return cachedBigSpikeWidth end end end local aC=game:GetService
'ReplicatedStorage'local aF=aC:FindFirstChild'enemyProjectiles'local aG=aF and
aF:FindFirstChild'firstBossBigSpike'if aG then local aH=aA(aG)if aH and aH>=4
then cachedBigSpikeWidth=math.clamp(aH,8,60)return cachedBigSpikeWidth end end
return 28 end local aF=function(aF)if ak.firstbossseekingspikes then return ak.
firstbossseekingspikes end if aC then return aC end if aF and not as(aF.Name)
then local aG=aA(aF)if aG and aG>=2 then aC=math.clamp(aG,4,40)return aC end end
for aG,aH in ipairs(workspace:GetChildren())do local aI=aH.Name:lower():gsub(
'%s+','')if string.find(aI,'seekingspike',1,true)and not as(aI)then local aJ=aA(
aH)if aJ and aJ>=2 then aC=math.clamp(aJ,4,40)return aC end end end local aG=
game:GetService'ReplicatedStorage'local aH=aG:FindFirstChild'enemyProjectiles'
local aI=aH and aH:FindFirstChild'firstBossSeekingSpikes'if aI then local aJ=aA(
aI)if aJ and aJ>=2 then aC=math.clamp(aJ,4,40)return aC end end return 10 end
local aG,aH,aI=function(aG,aH)if aw(aG,aH)then return aB(aH)else return aF(aH)
end end,function(aG)if not aG then return ai end local aH,aI=''if type(aG)==
'string'then aH=aG elseif type(aG)=='table'then aH=aG.Name or(aG.Instance and aG
.Instance.Name)or''aI=al[aG]end local aJ=(aI and aI.mainPart)or(type(aG)==
'table'and aG.Instance)if ay(aH,aJ)then if aI and aI.beamLength then return aI.
beamLength end if aw(aH,aJ)then return aj.firstbossbigspike or 140 else return
aj.firstbossseekingspikes or 80 end end if aI and aI.beamLength then return aI.
beamLength end local aK=aH:lower():gsub('%s+','')if aj[aK]then return aj[aK]end
for aL,aM in pairs(aj)do if string.find(aK,aL,1,true)then return aM end end
return ai end,function()local aG=af and af.Character if not aG then return nil
end local aH=aG:FindFirstChild'HumanoidRootPart'or aG.PrimaryPart if not aH then
return nil end return aH.Position end local aJ,aK=function(aJ,aK)if not aJ or
not aK then return nil,nil end local aL=aJ:lower():gsub('%s+','')local aM=ar[aL]
if not aM then for aN,aO in pairs(ar)do if string.find(aL,aN,1,true)then aM=aO
break end end end if not aM then return nil,nil end if aM=='look_vector'then
local aN=aK.CFrame.LookVector local aO=Vector3.new(aN.X,0,aN.Z)if aO.Magnitude>
0.01 then return aO.Unit,aM end else local aN=aI()if aN then local aO=aN-aK.
Position local aP=Vector3.new(aO.X,0,aO.Z)if aP.Magnitude>0.1 then return aP.
Unit,aM end end local aO=aK.CFrame.LookVector local aP=Vector3.new(aO.X,0,aO.Z)
if aP.Magnitude>0.01 then return aP.Unit,aM end end return nil,nil end,function(
)local aJ=af and af.Character if not aJ then return nil end local aK=aJ:
FindFirstChild'HumanoidRootPart'or aJ.PrimaryPart if not aK then return nil end
return aK.Position.Y-2.5 end function ag.BindDetection(aL)au=aL or nil end
function ag.IsEnabled()return ah end function ag.GetPredictionLength()return ai
end function ag.SetPredictionLength(aL)if type(aL)=='number'and aL>0 then ai=
math.clamp(aL,10,200)ag.RefreshAll()end end function ag.
GetHazardPredictionLength(aL)return aH(aL)end function ag.GetCustomLength(aL)if
not aL then return nil end local aM=aL:lower():gsub('%s+','')return aj[aM]end
function ag.SetCustomLength(aL,aM)if not aL then return end local aN=aL:lower():
gsub('%s+','')if type(aM)=='number'and aM>0 then aj[aN]=math.clamp(aM,10,300)
else aj[aN]=nil end ag.RefreshAll()end function ag.GetSecondBossBeamLength()
return aj.secondbossmovingbeam or 80 end function ag.SetSecondBossBeamLength(aL)
ag.SetCustomLength('secondbossmovingbeam',aL)end function ag.
GetFirstBossBigSpikeWidth()return ak.firstbossbigspike or 28 end function ag.
SetFirstBossBigSpikeWidth(aL)if type(aL)=='number'and aL>0 then ak.
firstbossbigspike=math.clamp(aL,6,60)else ak.firstbossbigspike=nil end
cachedBigSpikeWidth=nil ag.RefreshAll()end function ag.
GetFirstBossSeekingSpikeWidth()return ak.firstbossseekingspikes or(aC or 10)end
function ag.SetFirstBossSeekingSpikeWidth(aL)if type(aL)=='number'and aL>0 then
ak.firstbossseekingspikes=math.clamp(aL,4,40)else ak.firstbossseekingspikes=nil
end aC=nil ag.RefreshAll()end function ag.GetCustomWidth(aL)if not aL then
return nil end local aM=aL:lower():gsub('%s+','')return ak[aM]end function ag.
SetCustomWidth(aL,aM)if not aL then return end local aN=aL:lower():gsub('%s+',''
)if type(aM)=='number'and aM>0 then ak[aN]=math.clamp(aM,4,100)else ak[aN]=nil
end ag.RefreshAll()end function ag.IsHazardMoving(aL)if not aL then return false
end local aM=al[aL]return aM and aM.isMoving==true end function ag.
GetHazardDirection(aL)if not aL then return nil end local aM=al[aL]return aM and
aM.dir or nil end local aL,aM=function(aL,aM)local aN=aL.Instance if not aN or
not aN.Parent then return nil,4 end local aO,aP=ac.GetTrajectoryMargin and ac.
GetTrajectoryMargin()or 2,aL.Name or(aN and aN.Name)or''if ay(aP,aN)then local
aQ=al[aL]local aR=(aQ and aQ.mainPart)or(aN:IsA'BasePart'and aN or aN.
PrimaryPart or aN:FindFirstChildWhichIsA'BasePart')local aS,aT=(aQ and aQ.
beamStartPos)or(aR and aR.Position)or aN.Position,aG(aP,aR)local aU=math.max(1,
aT+aO*2)return Vector3.new(aS.X,0,aS.Z),aU end local aQ,aR={},ac.IsForceCircle
and ac.IsForceCircle(aP)if aN:IsA'BasePart'then if aN.Transparency<=am then
table.insert(aQ,aN)end else for aS,aT in ipairs(aN:GetDescendants())do if aT:IsA
'BasePart'and aT.Parent and aT.Transparency<=am then table.insert(aQ,aT)end end
end if#aQ==0 then return nil,4 end local aS,aT,aU,aV=Vector3.new(-aM.Z,0,aM.X),
math.huge,-math.huge,0 for aW,aX in ipairs(aQ)do local aY,aZ,a_=aX.Position,aX.
Size,0 if aR or(aX:IsA'Part'and(aX.Shape==Enum.PartType.Ball or aX.Shape==Enum.
PartType.Cylinder))then a_=math.max(aZ.X,aZ.Y,aZ.Z)/2 else local a0=aX.CFrame
local a1,a2,a3,a4,a5,a6=a0.RightVector,a0.UpVector,a0.LookVector,aZ.X/2,aZ.Y/2,
aZ.Z/2 a_=a4*math.abs(a1.X*aS.X+a1.Z*aS.Z)+a5*math.abs(a2.X*aS.X+a2.Z*aS.Z)+a6*
math.abs(a3.X*aS.X+a3.Z*aS.Z)end local a0=aY.X*aS.X+aY.Z*aS.Z aT=math.min(aT,a0-
a_)aU=math.max(aU,a0+a_)local a1=aY.X*aM.X+aY.Z*aM.Z aV+=a1 end local aW,aX,aY=
math.max(1,(aU-aT)+aO*2),(aT+aU)/2,aV/#aQ local aZ=aM*aY+aS*aX return aZ,aW end,
function(aL,aM,aN,aO,aP,aQ,aR)if not aM or not aM.Parent or not aL or not aL.
Parent then return end local aS=aQ/2 local aT=Vector3.new(aN.X+aO.X*aS,aP or aN.
Y,aN.Z+aO.Z*aS)local aU=aT+Vector3.new(aO.X,0,aO.Z)local aV=CFrame.lookAt(aT,aU)
aL.CFrame=(aL.Adornee==workspace.Terrain)and aV or aM.CFrame:ToObjectSpace(aV)aL
.Size=Vector3.new(aR,ap,aQ)if not aL.Visible then aL.Visible=true end end local
aN=function()if not ah then return end local aN,aO,aP=false,os.clock(),aK()for
aQ,aR in pairs(al)do local aS=aQ.Instance if not aS or not aS.Parent then ag.
DetachTrajectoryVisuals(aQ)else aN=true local aT,aU=aR.mainPart,aQ.Name or(aS
and aS.Name)local aV=ad and ad.IsChasingProjectile and ad.IsChasingProjectile(aU
)if aV then if aR.ad and aR.ad.Visible then aR.ad.Visible=false end aR.isMoving=
false aQ.IsTrajectory=false elseif aT and aT.Parent then local aW,aX=aT.Position
,aO-(aR.lastClock or aO)if aR.isBossSpike then if not aR.beamFound then local aY
,aZ,a_,a0=az(aT)if aY and aZ then aR.beamFound=true aR.beamLength=aY aR.beamDir=
aZ aR.beamStartPos=a_ aR.beamTargetPos=a0 aR.dir=aZ end end if aR.beamDir then
aR.dir=aR.beamDir end aR.isMoving=true end if aX>=0.035 then local aY=aW-(aR.
lastPos or aW)local aZ,a_=aY.Magnitude/aX,Vector3.new(aY.X,0,aY.Z)local a0,a1=a_
.Magnitude/aX,aR.isMoving==true if a0>=aq then aR.isMoving=true if not aR.
isBossSpike then aR.dir=a_.Unit end else if not aR.isInstant and not aR.
isBossSpike and aX>=0.25 and aZ<aq then aR.isMoving=false end end if aR.isMoving
~=a1 then aQ.IsTrajectory=aR.isMoving aQ.HazardZones=nil if au and au.
UpdateHazardVisualColor then pcall(au.UpdateHazardVisualColor,aQ,aR.isMoving)end
local a2=a.load'm'if a2 and a2.UpdateHazardVisualColor then pcall(a2.
UpdateHazardVisualColor,aQ,aR.isMoving)end end aR.lastPos=aW aR.lastClock=aO end
if aR.isMoving and aR.dir and aR.ad then local aY,aZ=aL(aQ,aR.dir)if aY then
local a_=aH(aQ)aM(aR.ad,aT,aY,aR.dir,aP,a_,aZ)end else if aR.ad and aR.ad.
Visible then aR.ad.Visible=false end end end end end if not aN and av then av:
Disconnect()av=nil end end local aO=function()if not av and ah then av=ae.
Heartbeat:Connect(aN)end end function ag.DetachTrajectoryVisuals(aP)if not aP
then return end local aQ=al[aP]if not aQ then return end if aQ.ad then pcall(
function()aQ.ad:Destroy()end)aQ.ad=nil end if aQ.connections then for aR,aS in
ipairs(aQ.connections)do pcall(function()aS:Disconnect()end)end table.clear(aQ.
connections)end al[aP]=nil end function ag.AttachTrajectoryVisuals(aP)if not ah
or not aP then return end if al[aP]then ag.DetachTrajectoryVisuals(aP)end local
aQ=aP.Instance if not aQ or not aQ.Parent then return end local aR=aP.Name or(aQ
and aQ.Name)if ad and ad.IsChasingProjectile and ad.IsChasingProjectile(aR)then
aP.IsTrajectory=false return end local aS if aQ:IsA'BasePart'then aS=aQ else aS=
aQ.PrimaryPart or aQ:FindFirstChildWhichIsA'BasePart'if not aS then for aT,aU in
ipairs(aQ:GetDescendants())do if aU:IsA'BasePart'and aU.Parent then aS=aU break
end end end end if not aS or not aS.Parent then return end local aT,aU=aH(aP),
Instance.new'BoxHandleAdornment'aU.Name='HazardTrajectoryCorridor'aU.Adornee=
workspace.Terrain aU.Size=Vector3.new(4,ap,aT)aU.Color3=an aU.Transparency=ao aU
.ZIndex=1 aU.AlwaysOnTop=true aU.Visible=false aU.Parent=workspace.Terrain local
aV=aP.Name or(aQ and aQ.Name)local aW,aX=as(aV),ay(aV,aQ)local aY=aX and(aw(aV,
aQ)and'big_spike'or'seeking_spike')or nil if aX then if not aW then for aZ,a_ in
pairs(al)do if a_ and a_.isBeam and a_.spikeType==aY then a_.linkedSpike=aS aP.
IsTrajectory=false return end end else for aZ,a_ in pairs(al)do if a_ and not a_
.isBeam and a_.spikeType==aY then aP.IsTrajectory=false return end end end end
local aZ={}if not aW then local a_=aS:GetPropertyChangedSignal'Transparency':
Connect(function()if aS.Parent and aS.Transparency>am then pcall(function()aU:
Destroy()end)end end)table.insert(aZ,a_)end local a_ local a0=aS.AncestryChanged
:Connect(function(a0,a1)if not a1 then if a_ and a_.linkedSpike and a_.
linkedSpike.Parent and a_.linkedSpike.Transparency<=am then local a2=a_.
linkedSpike.AncestryChanged:Connect(function(a2,a3)if not a3 then pcall(function
()aU:Destroy()end)end end)table.insert(aZ,a2)return end pcall(function()aU:
Destroy()end)end end)table.insert(aZ,a0)local a1,a2=aJ(aV,aS)local a3,a4,a5,a6,
a7=(a1~=nil)if aX then a4,a5,a6,a7=az(aQ)if a5 then a1=a5 a3=true end end a_={ad
=aU,connections=aZ,mainPart=aS,lastPos=aS.Position,lastClock=os.clock(),velocity
=Vector3.zero,dir=a1,isMoving=a3,isInstant=a3,instantMode=a2,isBossSpike=aX,
isBigSpike=aw(aV,aQ),isSeekingSpike=ax(aV,aQ),spikeType=aY,isBeam=aW,beamFound=
a4~=nil,beamLength=a4,beamDir=a5,beamStartPos=a6 or aS.Position,beamTargetPos=a7
,linkedSpike=nil}if aW and aY then local a8=aY=='big_spike'and
'firstbossbigspike'or'seekingspike'for a9,b in ipairs(workspace:GetChildren())do
local ba=b.Name:lower():gsub('%s+','')if string.find(ba,a8,1,true)and not as(ba)
then local bb=b:IsA'BasePart'and b or(b:FindFirstChildWhichIsA'BasePart'or(b:IsA
'Model'and b.PrimaryPart))if bb then local bc=(bb.Position-aS.Position).
Magnitude if bc<25 then a_.linkedSpike=bb break end end end end end al[aP]=a_ if
a3 and a1 then aP.IsTrajectory=true aP.HazardZones=nil local a8,a9,b=aK(),aL(aP,
a1)local ba=aH(aP)if a9 then aM(aU,aS,a9,a1,a8,ba,b)end if au and au.
UpdateHazardVisualColor then pcall(au.UpdateHazardVisualColor,aP,true)end local
bb=a.load'm'if bb and bb.UpdateHazardVisualColor then pcall(bb.
UpdateHazardVisualColor,aP,true)end local bc=a.load'n'if bc and bc.
UpdateHazardVisualColor then pcall(bc.UpdateHazardVisualColor,aP,true)end end
aO()end function ag.ClearAll()if av then av:Disconnect()av=nil end for aP in
pairs(al)do ag.DetachTrajectoryVisuals(aP)end table.clear(al)end function ag.
RefreshAll()ag.ClearAll()if not ah or not au then return end for aP,aQ in pairs(
au.GetActiveHazardsMap())do ag.AttachTrajectoryVisuals(aQ)end end function ag.
GetNearbyTrajectories(aP,aQ)aQ=aQ or 65 local aS,aT,aU={},aP.X,aP.Z for aV,aW in
pairs(al)do if aW.isMoving and aW.dir and aW.mainPart and aW.mainPart.Parent
then local aX,aY=aL(aV,aW.dir)if aX and aY then local aZ,a_,a0=aH(aV),aX.X,aX.Z
local a1,a2=aT-a_,aU-a0 local a3,a4=a1*a1+a2*a2,aQ+aZ+(aY/2)if a3<=a4*a4 then
table.insert(aS,{info=aV,record=aW})end end end end return aS end function ag.
IsPointInAnyTrajectory(aP,aQ,aS)local aT,aU=aP.X,aP.Z aQ=aQ or 0 local aV=3 if
aS then for aW,aX in ipairs(aS)do local aY,aZ=aX.info,aX.record if aZ and aZ.
isMoving and aZ.dir and aZ.mainPart and aZ.mainPart.Parent then local a_,a0=aL(
aY,aZ.dir)if a_ and a0 then local a1,a2=aH(aY),aZ.dir local a3,a4,a5=Vector3.
new(-a2.Z,0,a2.X),aT-a_.X,aU-a_.Z local a6,a7,a8,a9,b=a4*a2.X+a5*a2.Z,a4*a3.X+a5
*a3.Z,a0/2,-aV,a1 if aQ<=0 then if a6>=a9 and a6<=b and math.abs(a7)<=a8 then
return true,aY,a2,a_,a0 end else local ba=0 if a6<a9 then ba=a9-a6 elseif a6>b
then ba=a6-b end local bb=math.max(0,math.abs(a7)-a8)if(ba*ba+bb*bb)<=(aQ*aQ)
then return true,aY,a2,a_,a0 end end end end end return false,nil,nil,nil,nil
end for aW,aX in pairs(al)do if aX.isMoving and aX.dir and aX.mainPart and aX.
mainPart.Parent then local aY,aZ=aL(aW,aX.dir)if aY and aZ then local a_,a0=aH(
aW),aX.dir local a1,a2,a3=Vector3.new(-a0.Z,0,a0.X),aT-aY.X,aU-aY.Z local a4,a5,
a6,a7,a8=a2*a0.X+a3*a0.Z,a2*a1.X+a3*a1.Z,aZ/2,-aV,a_ if aQ<=0 then if a4>=a7 and
a4<=a8 and math.abs(a5)<=a6 then return true,aW,a0,aY,aZ end else local a9=0 if
a4<a7 then a9=a7-a4 elseif a4>a8 then a9=a4-a8 end local b=math.max(0,math.abs(
a5)-a6)if(a9*a9+b*b)<=(aQ*aQ)then return true,aW,a0,aY,aZ end end end end end
return false,nil,nil,nil,nil end function ag.SetEnabled(aP)ah=aP and true or
false if ah then ag.RefreshAll()else ag.ClearAll()end end ac.OnPaddingChanged(
function()if ah then ag.RefreshAll()end end)ab.Register(function()ag.ClearAll()
end)return ag end function a.p()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'a',a.
load'd',a.load'f',{},{Mob={Min=15,Max=35,BossArea=false,BossAreaRadius=80,
DisableDodge=false,EnableHazardScanner=true},Boss1={Min=25,Max=50,BossArea=false
,BossAreaRadius=80,DisableDodge=false,EnableHazardScanner=true},Boss2={Min=25,
Max=50,BossArea=false,BossAreaRadius=80,DisableDodge=false,EnableHazardScanner=
true},Boss3={Min=25,Max=50,BossArea=false,BossAreaRadius=80,DisableDodge=false,
EnableHazardScanner=true}},{Normal='Mob',['Boss 1']='Boss1',['Boss 2']='Boss2',[
'Boss 3']='Boss3'},{Mob='Normal',Boss1='Boss 1',Boss2='Boss 2',Boss3='Boss 3'},{
},{}function ad.GetTargetDisplay(aj)return ag[aj]or'Normal'end function ad.
GetTargetKey(aj)return af[aj]or'Mob'end function ad.GetTargetOptions()return{
'Normal','Boss 1','Boss 2','Boss 3'}end function ad.GetSaveData()return ah end
function ad.LoadData(aj)if type(aj)=='table'then ah=aj else ah={}end aa.
contextData=ah for ak,al in ipairs(ai)do pcall(al)end end function ad.
OnDataChanged(aj)if type(aj)~='function'then return function()end end table.
insert(ai,aj)return function()for ak,al in ipairs(ai)do if al==aj then table.
remove(ai,ak)break end end end end local aj=function()aa.contextData=ah ab.Save(
)end function ad.GetCombatDistances(ak,al)local am=al or'Mob'local an=ae[am]or
ae.Mob if type(ak)=='string'and#ak>0 and ah[ak]and ah[ak][am]then local ao=ah[ak
][am]local ap,aq=(type(ao.Min)=='number'and ao.Min>0)and ao.Min or an.Min,(type(
ao.Max)=='number'and ao.Max>0)and ao.Max or an.Max return ap,aq end return an.
Min,an.Max end function ad.GetActiveCombatDistances(ak)local al,am,an=ac.
GetCurrentDungeonName(),'Mob',false if ac.IsBossActive and ac.IsBossActive()then
an=true am=ac.GetCombatTargetKey()elseif ak then if ak.Room and type(ak.Room.
Name)=='string'and string.find(string.lower(ak.Room.Name),'boss')then an=true
elseif ak.Model then local ao=string.lower(ak.Model.Name)if string.find(ao,
'boss')then an=true else local ap=ak.Model.Parent if ap and string.find(string.
lower(ap.Name),'boss')then an=true end end end if an then local ao=ac.
GetCurrentBossIndex and ac.GetCurrentBossIndex()or 1 am='Boss'..tostring(math.
clamp(ao,1,3))end end return ad.GetCombatDistances(al,am)end function ad.
GetBossArea(ak,al)local am=al or'Mob'if am=='Mob'then return false,80 end local
an=ae[am]or ae.Boss1 if type(ak)=='string'and#ak>0 and ah[ak]and ah[ak][am]then
local ao=ah[ak][am]local ap,aq=ao.BossArea==true,(type(ao.BossAreaRadius)==
'number'and ao.BossAreaRadius>0)and ao.BossAreaRadius or(an.BossAreaRadius or 80
)return ap,aq end return an.BossArea or false,an.BossAreaRadius or 80 end
function ad.SetBossAreaEnabled(ak,al,am)if not(type(ak)=='string'and#ak>0)then
return end local an=al or'Mob'if an=='Mob'then return end ah[ak]=ah[ak]or{}ah[ak
][an]=ah[ak][an]or{}ah[ak][an].BossArea=am and true or false aj()end function ad
.SetBossAreaRadius(ak,al,am)if not(type(ak)=='string'and#ak>0)then return end
local an=al or'Mob'if an=='Mob'then return end if type(am)~='number'or am<=0
then return end ah[ak]=ah[ak]or{}ah[ak][an]=ah[ak][an]or{}ah[ak][an].
BossAreaRadius=am aj()end function ad.GetActiveBossArea(ak)local al,am,an=ac.
GetCurrentDungeonName(),'Mob',false if ac.IsBossActive and ac.IsBossActive()then
an=true am=ac.GetCombatTargetKey()elseif ak then if ak.Room and type(ak.Room.
Name)=='string'and string.find(string.lower(ak.Room.Name),'boss')then an=true
elseif ak.Model then local ao=string.lower(ak.Model.Name)if string.find(ao,
'boss')then an=true else local ap=ak.Model.Parent if ap and string.find(string.
lower(ap.Name),'boss')then an=true end end end if an then local ao=ac.
GetCurrentBossIndex and ac.GetCurrentBossIndex()or 1 am='Boss'..tostring(math.
clamp(ao,1,3))end end if not an or am=='Mob'then return false,0,nil end local ao
,ap=ad.GetBossArea(al,am)if not ao then return false,ap,nil end local aq=ac.
GetBossSpawnPosition and ac.GetBossSpawnPosition()if not aq and ak and ak.Root
then aq=ak.Root.Position if ac.SetBossSpawnPosition then ac.
SetBossSpawnPosition(aq)end end return ao,ap,aq end function ad.GetDisableDodge(
ak,al)local am=al or'Mob'local an=ae[am]or ae.Mob if type(ak)=='string'and#ak>0
and ah[ak]and ah[ak][am]then local ao=ah[ak][am]if ao.DisableDodge~=nil then
return ao.DisableDodge==true end end return an.DisableDodge or false end
function ad.SetDisableDodge(ak,al,am)if not(type(ak)=='string'and#ak>0)then
return end local an=al or'Mob'ah[ak]=ah[ak]or{}ah[ak][an]=ah[ak][an]or{}ah[ak][
an].DisableDodge=am and true or false aj()end function ad.GetEnableHazardScanner
(ak,al)local am=al or'Mob'local an=ae[am]or ae.Mob if type(ak)=='string'and#ak>0
and ah[ak]and ah[ak][am]then local ao=ah[ak][am]if ao.EnableHazardScanner~=nil
then return ao.EnableHazardScanner==true end end return an.EnableHazardScanner~=
false end function ad.SetEnableHazardScanner(ak,al,am)if not(type(ak)=='string'
and#ak>0)then return end local an=al or'Mob'ah[ak]=ah[ak]or{}ah[ak][an]=ah[ak][
an]or{}ah[ak][an].EnableHazardScanner=am and true or false aj()end function ad.
IsActiveDodgeDisabled(ak)local al,am,an=ac.GetCurrentDungeonName(),'Mob',false
if ac.IsBossActive and ac.IsBossActive()then an=true am=ac.GetCombatTargetKey()
elseif ak then if ak.Room and type(ak.Room.Name)=='string'and string.find(string
.lower(ak.Room.Name),'boss')then an=true elseif ak.Model then local ao=string.
lower(ak.Model.Name)if string.find(ao,'boss')then an=true else local ap=ak.Model
.Parent if ap and string.find(string.lower(ap.Name),'boss')then an=true end end
end if an then local ao=ac.GetCurrentBossIndex and ac.GetCurrentBossIndex()or 1
am='Boss'..tostring(math.clamp(ao,1,3))end end return ad.GetDisableDodge(al,am)
end function ad.IsActiveHazardScannerEnabled(ak)local al,am,an=ac.
GetCurrentDungeonName(),'Mob',false if ac.IsBossActive and ac.IsBossActive()then
an=true am=ac.GetCombatTargetKey()elseif ak then if ak.Room and type(ak.Room.
Name)=='string'and string.find(string.lower(ak.Room.Name),'boss')then an=true
elseif ak.Model then local ao=string.lower(ak.Model.Name)if string.find(ao,
'boss')then an=true else local ap=ak.Model.Parent if ap and string.find(string.
lower(ap.Name),'boss')then an=true end end end if an then local ao=ac.
GetCurrentBossIndex and ac.GetCurrentBossIndex()or 1 am='Boss'..tostring(math.
clamp(ao,1,3))end end if ad.GetDisableDodge(al,am)then return false end return
ad.GetEnableHazardScanner(al,am)end function ad.SetMinCombatDistance(ak,al,am)if
not(type(ak)=='string'and#ak>0)then return end local an=al or'Mob'if type(am)~=
'number'or am<=0 then return end ah[ak]=ah[ak]or{}ah[ak][an]=ah[ak][an]or{}local
ao=ah[ak][an].Max or(ae[an]or ae.Mob).Max ah[ak][an].Min=am if am>ao then ah[ak]
[an].Max=am+5 end aj()end function ad.SetMaxCombatDistance(ak,al,am)if not(type(
ak)=='string'and#ak>0)then return end local an=al or'Mob'if type(am)~='number'or
am<=0 then return end ah[ak]=ah[ak]or{}ah[ak][an]=ah[ak][an]or{}local ao=ah[ak][
an].Min or(ae[an]or ae.Mob).Min ah[ak][an].Max=am if am<ao then ah[ak][an].Min=
math.max(1,am-5)end aj()end function ad.ResetTarget(ak,al)if not(type(ak)==
'string'and#ak>0)then return end local am=al or'Mob'if ah[ak]then ah[ak][am]=nil
if next(ah[ak])==nil then ah[ak]=nil end aj()end end function ad.ResetDungeon(ak
)if not(type(ak)=='string'and#ak>0)then return end if ah[ak]then ah[ak]=nil aj()
end end return ad end function a.q()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak=a.
load'e',a.load'f',a.load'b',a.load'l',a.load'm',a.load'o',a.load'n',a.load'p',
game:GetService'Players',game:GetService'Workspace',game:GetService
'ReplicatedStorage'local al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax,ay,az,aA,aB,aC,
aF,aG,aH,aI=aa.player,{},false,false,true,false,false,'',false,{},0,{},{},0,0,2,
{'abilities','projectiles'},false,{},{firstbossbeamparticles=true}local aJ,aK,aL
,aM,aN,aO,aP,aQ=function()if aC then return end aC=true for aJ,aK in ipairs(aB)
do local aL=ak:FindFirstChild(aK)if aL then for aM,aN in ipairs(aL:GetChildren()
)do local aO=(aN.Name or''):lower():gsub('%s+','')if#aO>0 then aF[aO]=true end
end end end end,function(aJ)if not aJ then return true end local aK=aJ.Name if
typeof(aK)=='string'then local aL=aK:lower()if aL:sub(1,3)=='tm_'or aL:sub(1,3)
=='pr_'or aL:sub(1,3)=='dq_'or aL:find'pathrecord'or aL:find'safespot'or aL:find
'hazard'or aL:find'adornment'or aL:find'debug'or aL:find'targetpart'or aL:find
'actualmarker'then return true end local aM=aJ.Parent while aM and aM~=workspace
and aM~=game do local aN=aM.Name if typeof(aN)=='string'then local aO=aN:lower()
if aO:find'pathrecord'or aO:sub(1,3)=='tm_'or aO:sub(1,3)=='pr_'then return true
end end aM=aM.Parent end local aN=aL:gsub('%s+','')if#aN>0 and aF[aN]==true then
return true end if aG[aN]==true or aG[aK]==true then return true end for aO,aP
in pairs(aG)do if string.find(aN,aO,1,true)then return true end end end return
false end,function(aJ)if not aJ then return false end if ai:
GetPlayerFromCharacter(aJ)then return true end if ai:FindFirstChild(aJ.Name)then
return true end for aK,aL in ipairs(ai:GetPlayers())do if aJ.Name==aL.Name then
return true end local aM=aL.Character if aM and(aJ==aM or aJ:IsDescendantOf(aM))
then return true end end local aK=al and al.Character if aK and(aJ==aK or aJ:
IsDescendantOf(aK))then return true end return false end,function()local aJ=0
for aK in pairs(au)do aJ+=1 end av=aJ for aK=#aw,1,-1 do pcall(aw[aK],aJ,aH)end
end,0.85,50,0.05,{}local aS,aT,aU=function(aS)local aT=aQ[aS]if aT then aT.
active=false aQ[aS]=nil end end,function()for aS,aT in pairs(aQ)do if aT then aT
.active=false end end table.clear(aQ)end,function(aS)if not aS or type(aS)~=
'string'then return false end local aT=aS:lower():gsub('%s+','')return string.
find(aT,'firstbossbeampart',1,true)~=nil end local aV,aW,aX,aY,aZ,a_=function(aV
)if not aV then return{}end local aW,aX={},aU(aV.Name)local aY=function(aY)if aY
and aY.Parent and(aY.Transparency<=aN or aX)then aW[#aW+1]=aY end end if aV:IsA
'BasePart'then aY(aV)else for aZ,a_ in ipairs(aV:GetDescendants())do if a_:IsA
'BasePart'and a_.Parent then aY(a_)end end end return aW end,function(aV)local
aW=al and al.Character if not aW then return 0 end local aX=aW:FindFirstChild
'HumanoidRootPart'or aW.PrimaryPart if not aX then return 0 end local aY,aZ=(aX.
Position)if aV:IsA'BasePart'then aZ=aV.Position elseif aV:IsA'Model'then local
a_,a0=pcall(function()return aV:GetPivot().Position end)if a_ then aZ=a0 else
local a1=aV:FindFirstChildWhichIsA'BasePart'aZ=a1 and a1.Position end end if not
aZ then return 0 end return math.floor((aY-aZ).Magnitude+0.5)end,Color3.fromRGB(
255,45,45),Color3.fromRGB(255,30,30),Color3.fromRGB(0,170,255),Color3.fromRGB(0,
140,255)local a0=function(a0,a1,a2)local a3,a4,a5={},a2 and aZ or aX,a2 and a_
or aY for a6,a7 in ipairs(a0)do if a7 and a7.Parent and not aU(a7.Name)and not
aU(a7.Parent and a7.Parent.Name)then local a8=Instance.new'SelectionBox'a8.Name=
'HazardSelectionBox'a8.Color3=a4 a8.SurfaceColor3=a5 a8.SurfaceTransparency=0.6
a8.LineThickness=0.05 a8.Adornee=a7 a8.Parent=a7 local a9=a7:
GetPropertyChangedSignal'Transparency':Connect(function()if a7.Parent and a7.
Transparency>aN then pcall(function()a8:Destroy()end)end end)if a1 then table.
insert(a1,a9)end a3[#a3+1]=a8 end end return a3 end function am.
UpdateHazardVisualColor(a1,a2)if not a1 or not a1.Boxes then return end local a3
=a2==true or a1.IsTrajectory==true local a4,a5=a3 and aZ or aX,a3 and a_ or aY
for a6,a7 in ipairs(a1.Boxes)do if a7 and a7.Parent then a7.Color3=a4 a7.
SurfaceColor3=a5 end end ag.UpdateHazardVisualColor(a1,a3)end local a1,a2=
function(a1)if not at or as==''then return false end if not a1 or type(a1)~=
'string'then return false end local a2=as:lower():gsub('%s+','')if#a2==0 then
return false end local a3=a1:lower():gsub('%s+','')return string.find(a3,a2,1,
true)~=nil end,function(a1)if not a1 then return'nil'end return(
'(%.2f, %.2f, %.2f)'):format(a1.X,a1.Y,a1.Z)end local a3=function(a3,a4,a5,a6)if
not a3 then return end local a7=a3.Name if not a1(a7)then return end local a8,a9
,b=a3.ClassName,a3.Parent and a3.Parent:GetFullName()or'nil',aW(a3)print
'================== \u{1f50d} [HAZARD DEEP INSPECT] \u{1f50d} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(a7,a8))print((
'  \u{1f4cc} Event Type     : %s%s'):format(a4,a5 and(' -> '..tostring(a5))or'')
)print(('  \u{1f4cd} Full Path      : %s'):format(a9))print((
'  \u{1f4cf} Dist to Player : %d studs'):format(b))if a4=='SPAWN'then local ba={
}if a3:IsA'BasePart'then table.insert(ba,a3)else for bb,bc in ipairs(a3:
GetDescendants())do if bc:IsA'BasePart'then table.insert(ba,bc)end end end
print(('  \u{1f9e9} Total Parts (%d) :'):format(#ba))for bb,bc in ipairs(ba)do
local bd=bc:IsA'Part'and tostring(bc.Shape.Name)or(bc.ClassName=='MeshPart'and
'MeshPart'or bc.ClassName)print(('     [%d] %q (%s)'):format(bb,bc.Name,bc.
ClassName))print((
'         \u{2022} Size: %s | Shape: %s | Trans: %.2f | CanCollide: %s'):format(
a2(bc.Size),bd,bc.Transparency,tostring(bc.CanCollide)))print((
'         \u{2022} Pos : %s'):format(a2(bc.Position)))end local bb=ad.
GetHazardZones(a6)if bb and bb.zones then local bc=ad.GetHitboxPadding()print((
'  \u{1f4d0} Math Geometry (Zones: %d, BoundingRadius: %.1f studs):'):format(#bb
.zones,bb.boundingRadius or 0))for bd,be in ipairs(bb.zones)do if be.radius then
print((
[[     - Zone [%d]: Circle/Ball (Base Radius: %.2f + Pad: %.2f = %.2f studs)]]):
format(bd,be.radius,bc,be.radius+bc))elseif be.half then print((
'     - Zone [%d]: Box/OBB (HalfSize: %s)'):format(bd,a2(be.half)))end end end
task.spawn(function()local bc if a3:IsA'BasePart'then bc=a3 elseif a3:IsA'Model'
then bc=a3.PrimaryPart or a3:FindFirstChildWhichIsA'BasePart'end if not bc then
return end local bd,be=os.clock(),bc.CFrame task.wait(0.12)if not a3.Parent or
not bc.Parent then return end local bf,bg=os.clock(),bc.CFrame local bh=bf-bd if
bh<=0 then return end local bi=bg*be:Inverse()local bj,bk=bi:ToAxisAngle()local
bl,bm=math.deg(bk)/bh,be:Inverse()*bg local bn,bo=bm:ToAxisAngle()if math.abs(
math.deg(bk))>=1.5 then local bp=
'Tr\u{1ee5}c t\u{1ef1} do / H\u{1ed7}n h\u{1ee3}p'if math.abs(bj.Y)>=0.8 then bp
='Tr\u{1ee5}c Y (Yaw - Qu\u{e9}t ngang m\u{1eb7}t s\u{e0}n)'elseif math.abs(bj.X
)>=0.8 then bp='Tr\u{1ee5}c X (Pitch - L\u{103}n nh\u{e0}o l\u{1ed9}n)'elseif
math.abs(bj.Z)>=0.8 then bp=
'Tr\u{1ee5}c Z (Roll - Nghi\u{ea}ng l\u{1ead}t b\u{ea}n)'end local bq=
'Tr\u{1ee5}c t\u{1ef1} do'if math.abs(bn.Y)>=0.8 then bq='Tr\u{1ee5}c Local Y'
elseif math.abs(bn.X)>=0.8 then bq='Tr\u{1ee5}c Local X'elseif math.abs(bn.Z)>=
0.8 then bq='Tr\u{1ee5}c Local Z'end print
'================== \u{1f504} [INSPECT: SPINNING DETECTED] \u{1f504} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(a3.Name,bc.Name))print((
'  \u{26a1} T\u{1ed1}c \u{111}\u{1ed9} xoay    : %.2f \u{b0}/s (%.2f rad/s)'):
format(bl,bk/bh))print(('  \u{1f310} World Spin Axis: %s -> %s'):format(a2(bj),
bp))print(('  \u{1f9e9} Local Spin Axis: %s -> %s'):format(a2(bn),bq))print
[[========================================================================]]end
end)elseif a4=='DESPAWN'then if a6 and a6.SpawnClock then local ba=os.clock()-a6
.SpawnClock print(('  \u{23f1}\u{fe0f} Lifetime Active: %.2f seconds'):format(ba
))end elseif a4=='REJECTED'then print(('  \u{26a0}\u{fe0f} Rejection Reason: %s'
):format(tostring(a5)))end print
[[================================================================]]end local a4
,a5=function(a4,a5)a3(a4,'REJECTED',a5,nil)if not ar then return end local a6,a7
=a4 and a4.Name or'?',a4 and a4.ClassName or'?'print((
'[HazardScanner][Reject] \u{26aa} %s (%s) \u{2014} %s'):format(a6,a7,a5))end
local a6=function(a6)if not a6 or not a6.Parent then return end if os.clock()<az
then return end if aL(a6)then return end if au[a6]then return end if aQ[a6]then
return end local a7={active=true,count=0}aQ[a6]=a7 task.spawn(function()while a7
.active and a6.Parent and an and ao do if ah.IsActiveHazardScannerEnabled and
not ah.IsActiveHazardScannerEnabled()then aS(a6)return end if os.clock()<az then
aS(a6)return end if aL(a6)then aS(a6)return end a7.count+=1 local a8,a9,b=a6:
GetDescendants(),aV(a6),a1(a6.Name)if ar or b then print((
'[HazardScanner][Retry] \u{1f504} L\u{1ea7}n %d/%d: %q (%s) | Descendants: %d | Valid Parts (Trans<=%.2f): %d'
):format(a7.count,aO,a6.Name,a6.ClassName,#a8,aN,#a9))end if#a9>0 then if ar or
b then print((
'[HazardScanner][Retry] \u{2705} L\u{1ea7}n %d/%d: %q \u{110}\u{e3} t\u{ec}m th\u{1ea5}y %d part(s)! Ti\u{1ebf}n h\u{e0}nh v\u{1ebd}...'
):format(a7.count,aO,a6.Name,#a9))end aS(a6)a5(a6)return end if a7.count>=aO
then a4(a6,(
'H\u{1ebf}t %d l\u{1b0}\u{1ee3}t retry m\u{e0} kh\u{f4}ng t\u{ec}m th\u{1ea5}y BasePart h\u{1ee3}p l\u{1ec7} (Descendants: %d)'
):format(aO,#a8))aS(a6)return end task.wait(aP)end aS(a6)end)end a5=function(a7)
if not an or not ao then a4(a7,'Ch\u{1b0}a trong dungeon')return false end if ah
.IsActiveHazardScannerEnabled and not ah.IsActiveHazardScannerEnabled()then a4(
a7,'T\u{1eaf}t Hazard Scanner cho m\u{1ee5}c ti\u{ea}u trong Contextual')return
false end if os.clock()<az then a4(a7,
'\u{110}ang trong 2s chuy\u{1ec3}n room (Ch\u{1eb7}n t\u{1ea1}o Danger Zone)')
return false end if not a7 or not a7.Parent then a4(a7,
'Kh\u{f4}ng c\u{f2}n Parent')return false end if aL(a7)then a4(a7,
'Nh\u{e2}n v\u{1ead}t ng\u{1b0}\u{1edd}i ch\u{1a1}i (Player/Teammate)')return
false end if au[a7]then return true end aJ()if aK(a7)then a4(a7,
'Tr\u{f9}ng t\u{ea}n trong ReplicatedStorage (abilities/projectiles)')return
false end local a8=aV(a7)if#a8==0 then a4(a7,
'Ch\u{1b0}a c\u{f3} part \u{111}\u{1ec3} v\u{1ebd} (s\u{1ebd} retry)')a6(a7)
return false end local a9,b=ad.IsIceSpikesChain and ad.IsIceSpikesChain(a7.Name)
,ad.IsSecondBossCircleChain and ad.IsSecondBossCircleChain(a7.Name)if b then
local ba=os.clock()if ba-ay<5 then a4(a7,
'V\u{f2}ng con c\u{1ee7}a chu\u{1ed7}i secondBossCricleHitbox (\u{111}\u{e3} d\u{1ef1}ng tr\u{1b0}\u{1edb}c 10 v\u{f2}ng)'
)return false end ay=ba end local ba=aW(a7)local bb,bc,bd={Instance=a7,Name=a7.
Name,Class=a7.ClassName,Distance=ba,Boxes={},Connections={},SpawnClock=os.clock(
)},{},{}if ap and not a9 and not b then bd=a0(a8,bc,false)end bb.Boxes=bd bb.
Connections=bc au[a7]=bb aH={Name=a7.Name,Class=a7.ClassName,Distance=ba}if ae.
IsEnabled()then ae.AttachZoneVisuals(bb)end if af.IsEnabled()then af.
AttachTrajectoryVisuals(bb)end if ag.IsEnabled()then ag.AttachTimerVisual(bb)end
aS(a7)a3(a7,'SPAWN','Passed all gates',bb)if aq then print((
'[HazardScanner][Hazard] \u{1f534} Hazard Detected: %s (%s, %d studs)'):format(
a7.Name,a7.ClassName,ba))end aM()return true end local function a7(a8,a9)local b
=au[a8]if not b then aS(a8)return end if b.MaxExpireTime and os.clock()<b.
MaxExpireTime and a9=='Destroyed'then task.delay(b.MaxExpireTime-os.clock()+0.1,
function()if au[a8]==b and os.clock()>=b.MaxExpireTime then a7(a8,
'Wave Completed')end end)return end a3(a8,'DESPAWN',a9,b)ae.DetachZoneVisuals(b)
af.DetachTrajectoryVisuals(b)ag.DetachTimerVisual(b)if b.Boxes then for ba,bb in
ipairs(b.Boxes)do pcall(function()bb:Destroy()end)end table.clear(b.Boxes)end if
b.Connections then for ba,bb in ipairs(b.Connections)do pcall(function()bb:
Disconnect()end)end table.clear(b.Connections)end au[a8]=nil if aq then local ba
=a9 and(' ('..a9..')')or''print((
'[HazardScanner][Hazard] \u{1f7e2} Hazard Expired: %s%s'):format(tostring(b.Name
),ba))end aM()end function am.ClearAllHazards(a8)ay=0 ae.ClearAll()af.ClearAll()
ag.ClearAll()aT()local a9={}for b in pairs(au)do table.insert(a9,b)end for b,ba
in ipairs(a9)do a7(ba,a8)end if aq and a8 then print((
'[HazardScanner][Hazard] \u{1f9f9} All hazards cleared: %s'):format(a8))end end
function am.TriggerRoomTransition(a8)az=os.clock()+aA am.ClearAllHazards(a8 or
'Room Transition (2s cooldown)')task.delay(aA,function()if ao and an then am.
ClearAllHazards'Room Transition Sweep (End 2s)'end end)end function am.
IsRoomTransitioning()return os.clock()<az end function am.StartScan()if an then
return end an=true ae.BindDetection(am)af.BindDetection(am)ag.BindDetection(am)
am.ClearAllHazards'StartScan Reset'for a8,a9 in ipairs(ax)do a9:Disconnect()end
table.clear(ax)table.insert(ax,aj.ChildAdded:Connect(function(a8)if aL(a8)then
return end a5(a8)end))table.insert(ax,aj.ChildRemoved:Connect(function(a8)a7(a8,
'Destroyed')end))ao=not(ab.IsInLobby and ab.IsInLobby())and(type(ab.
GetCurrentDungeonName())=='string'and#ab.GetCurrentDungeonName()>0)local a8=ab.
GetCurrentRoomIndex()if aI then pcall(aI)aI=nil end aI=ab.OnRoomIndexChanged(
function(a9)if a9~=a8 then a8=a9 if a9>0 then ao=true am.TriggerRoomTransition(
'Room Transition to room '..tostring(a9))elseif ab.IsInLobby and ab.IsInLobby()
and ao then ao=false am.ClearAllHazards'Dungeon Ended'end end end)if aq then
print'[HazardScanner] \u{1f4e1} Threat Detector started!'end end function am.
StopScan()an=false ao=false for a8,a9 in ipairs(ax)do a9:Disconnect()end table.
clear(ax)if aI then pcall(aI)aI=nil end am.ClearAllHazards'StopScan'if aq then
print'[HazardScanner] \u{1f6d1} Threat Detector stopped.'end end function am.
IsEnabled()return an end function am.SetEnabled(a8)if a8 then am.StartScan()else
am.StopScan()end end function am.SetSelectionBoxesEnabled(a8)ap=a8 and true or
false if ap then for a9,b in pairs(au)do if a9 and a9.Parent and(not b.Boxes or#
b.Boxes==0)then local ba=aV(a9)b.Connections=b.Connections or{}b.Boxes=a0(ba,b.
Connections,b.IsTrajectory)end end else for a9,b in pairs(au)do if b.Boxes then
for ba,bb in ipairs(b.Boxes)do pcall(function()bb:Destroy()end)end table.clear(b
.Boxes)end end end end function am.IsSelectionBoxesEnabled()return ap end
function am.SetLogHazards(a8)aq=a8 and true or false end function am.
IsLogHazardsEnabled()return aq end function am.SetLogFailed(a8)ar=a8 and true or
false end function am.IsLogFailedEnabled()return ar end function am.
SetInspectTarget(a8)as=type(a8)=='string'and a8 or''end function am.
GetInspectTarget()return as end function am.SetInspectEnabled(a8)at=a8 and true
or false end function am.IsInspectEnabled()return at end function am.
GetHazardCount()return av end function am.GetActiveHazards()local a8={}for a9,b
in pairs(au)do if a9 and a9.Parent==aj then a8[#a8+1]=b end end return a8 end
function am.GetActiveHazardsMap()return au end function am.GetLastHazardInfo()
return aH end function am.OnHazardChanged(a8)if type(a8)~='function'then return
end table.insert(aw,a8)end ac.Register(function()am.StopScan()am.ClearAllHazards
'Shutdown'end)return am end function a.r()local aa,ab,ac,ad,ae=a.load'e',a.load
'b',a.load'l',a.load'o',a.load'p'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as
,at,au,av,aw=aa.RunService or game:GetService'RunService',aa.player,{},true,
false,{},1.8,Color3.fromRGB(0,255,170),Color3.fromRGB(255,35,35),0.45,0.2,0.2,(
game:GetService'Players')local ax,ay,az,aA=function()local ax=ag or ar.
LocalPlayer if not ax then return nil end local ay=ax.Character if not ay or not
ay.Parent then return nil end local az=ay:FindFirstChildOfClass'Humanoid'if az
and az.Health<=0 then return nil end return ay:FindFirstChild'HumanoidRootPart'
or ay.PrimaryPart end,function(ax)if not ax then return 0 end return ax.Position
.Y-2.5 end,function(ax)if av then if av.Parent~=ax or not av:IsDescendantOf(
workspace)then pcall(function()av:Destroy()end)av=nil else if av.Adornee~=ax
then av.Adornee=ax end return av end end if not ax or not ax.Parent then return
nil end local ay=Instance.new'CylinderHandleAdornment'ay.Name=
'Player_2D_HitboxVisual'ay.Adornee=ax ay.Radius=al ay.Height=aq ay.Color3=aj and
an or am ay.Transparency=aj and ap or ao ay.ZIndex=5 ay.AlwaysOnTop=false ay.
Visible=ai ay.Parent=ax av=ay return ay end,function(ax)if not av or not av.
Parent then return end av.Color3=ax and an or am av.Transparency=ax and ap or ao
end local aB=function()local aB=ax()if not aB or not aB.Parent then if av and av
.Parent then av.Visible=false end if aj then aj=false as=nil at=nil for aC,aF in
ipairs(ak)do pcall(aF,false,nil,nil)end end return end local aC=az(aB)if aC and
aC.Parent then aC.Visible=ai aC.Radius=al local aF=ay(aB)local aG=CFrame.new(
Vector3.new(aB.Position.X,aF,aB.Position.Z))*CFrame.Angles(math.rad(90),0,0)aC.
CFrame=aB.CFrame:ToObjectSpace(aG)end if ae.IsActiveHazardScannerEnabled and not
ae.IsActiveHazardScannerEnabled()then if aj then aj=false as=nil at=nil aA(false
)for aF,aG in ipairs(ak)do pcall(aG,false,nil,nil)end end return end local aF=
Vector3.new(aB.Position.X,0,aB.Position.Z)local aG,aH,aI=ac.IsPointInAnyHazard(
aF,nil,al)local aJ,aK=false if not aG and ad.IsPointInAnyTrajectory then aJ,aK=
ad.IsPointInAnyTrajectory(aF,al)end local aL,aM,aN=(aG or aJ),aH or aK,aG and
'Ground Zone'or(aJ and'Trajectory Corridor'or nil)if aL~=aj or aM~=as then aj=aL
as=aM at=aN aA(aL)for aO,aP in ipairs(ak)do pcall(aP,aL,aM,aN)end end end local
aC=function()if not au then au=af.Heartbeat:Connect(aB)end end function ah.
Cleanup()if au then au:Disconnect()au=nil end if av then pcall(function()av:
Destroy()end)av=nil end aj=false as=nil at=nil end function ah.IsPlayerInDanger(
)return aj,as,at end function ah.GetCurrentThreat()return as,at end function ah.
OnDangerStatusChanged(aF)if type(aF)=='function'then table.insert(ak,aF)end end
function ah.SetVisualEnabled(aF)ai=aF and true or false if av then av.Visible=ai
end end function ah.IsVisualEnabled()return ai end function ah.SetRadius(aF)if
type(aF)=='number'and aF>=0.1 then al=aF if av and av.Parent then av.Radius=al
end end end function ah.GetRadius()return al end local aF=function()local aF=ag
or ar.LocalPlayer if not aF then return end local aG=function(aG)if av then
pcall(function()av:Destroy()end)av=nil end task.spawn(function()local aH=aG:
WaitForChild('Humanoid',3)if aH then aH.Died:Connect(function()if av then av.
Visible=false end end)end end)end aw=aF.CharacterAdded:Connect(aG)if aF.
Character then aG(aF.Character)end end aF()aC()ab.Register(function()if aw then
aw:Disconnect()aw=nil end ah.Cleanup()end)return ah end function a.s()local aa,
ab,ac={},{},8 for ad=1,ac do local ae=(ad-1)*(2*math.pi/ac)ab[ad]=Vector3.new(
math.cos(ae),0,math.sin(ae))end local ad,ae={},16 for af=1,ae do local ag=(af-1)
*(2*math.pi/ae)ad[af]=Vector3.new(math.cos(ag),0,math.sin(ag))end local af,ag,ah
={1.5,3,5,8,12,18,25},{1.5,3,4.5,6,8,10.5,13.5,17,21,26,32,38,45},{1.5,3,4.5,6,8
,10.5,13.5,17,21,26,32,38,45,50,55}aa.COARSE_DIRECTIONS=ab aa.FINE_DIRECTIONS=ad
aa.COARSE_RADII=af aa.FINE_RADII=ag aa.FALLBACK_RADII=ah function aa.SamplePass(
ai,aj,ak,al,am,an,ao,ap)local aq,ar,as,at,au=math.huge,Vector3.zero,false,aj if
ap and ap.Magnitude>0.1 then local av=Vector3.new(ap.X,0,ap.Z).Unit at=table.
clone(aj)table.sort(at,function(aw,ax)local ay,az=aw.X*av.X+aw.Z*av.Z,ax.X*av.X+
ax.Z*av.Z return ay>az end)end for av,aw in ipairs(ak)do local ax=false for ay,
az in ipairs(at)do local aA=ai+az*aw local aB=an(aA)if ao then table.insert(ao,{
pos=aA,isSafe=aB,isChosen=false})end if aB then local aC=aA if am and al>0 then
local aF=aA+az*al if an(aF)then aC=aF end end local aF=(aC-ai).Magnitude if aF<
aq then aq=aF au=aC ar=az ax=true end end end if ax and au then as=true break
end end return au,as,aq,ar end return aa end function a.t()local aa,ab,ac,ad,ae,
af,ag,ah,ai,aj,ak,al,am=Color3.fromRGB(0,255,120),Color3.fromRGB(0,255,150),
Color3.fromRGB(255,255,255),Color3.fromRGB(0,235,140),Color3.fromRGB(255,60,60),
0.2,1.4,0.45,{},{}local an,ao=function(an)if not an then return end if not ak or
not ak.Parent then if ak then pcall(function()ak:Destroy()end)end local ao=
Instance.new'CylinderHandleAdornment'ao.Name='SafeSpot_OuterMarker'ao.Adornee=an
ao.Radius=ag ao.Height=af ao.Color3=aa ao.Transparency=0.35 ao.ZIndex=6 ao.
AlwaysOnTop=false ao.Visible=false ao.Parent=an ak=ao end if not al or not al.
Parent then if al then pcall(function()al:Destroy()end)end local ao=Instance.new
'CylinderHandleAdornment'ao.Name='SafeSpot_CenterDot'ao.Adornee=an ao.Radius=ah
ao.Height=af+0.05 ao.Color3=ac ao.Transparency=0.15 ao.ZIndex=7 ao.AlwaysOnTop=
false ao.Visible=false ao.Parent=an al=ao end if not am or not am.Parent then if
am then pcall(function()am:Destroy()end)end local ao=Instance.new
'LineHandleAdornment'ao.Name='SafeSpot_EscapeLine'ao.Adornee=an ao.Color3=ab ao.
Thickness=3.5 ao.Transparency=0.2 ao.ZIndex=6 ao.AlwaysOnTop=false ao.Visible=
false ao.Parent=an am=ao end end,function(an,ao)local ap=aj[an]if not ap then
local aq=Instance.new'CylinderHandleAdornment'aq.Name='SafeSpot_CandidateDot_'..
an aq.Adornee=ao aq.Radius=0.25 aq.Height=af aq.ZIndex=4 aq.AlwaysOnTop=false aq
.Visible=false aq.Parent=ao local ar=Instance.new'LineHandleAdornment'ar.Name=
'SafeSpot_CandidateLine_'..an ar.Adornee=ao ar.Thickness=1.2 ar.ZIndex=4 ar.
AlwaysOnTop=false ar.Visible=false ar.Parent=ao ap={dot=aq,line=ar}aj[an]=ap
else if ap.dot and ap.dot.Adornee~=ao then ap.dot.Adornee=ao ap.dot.Parent=ao
end if ap.line and ap.line.Adornee~=ao then ap.line.Adornee=ao ap.line.Parent=ao
end end return ap end function ai.HideCandidates()for ap,aq in ipairs(aj)do if
aq.dot and aq.dot.Parent then aq.dot.Visible=false end if aq.line and aq.line.
Parent then aq.line.Visible=false end end end function ai.Hide()if ak and ak.
Parent then ak.Visible=false end if al and al.Parent then al.Visible=false end
if am and am.Parent then am.Visible=false end ai.HideCandidates()end local ap=
function(ap,aq,ar,as)if not as or not ar or#ar==0 then ai.HideCandidates()return
end local at=Vector3.new(ap.Position.X,aq+0.05,ap.Position.Z)local au=ap.CFrame:
PointToObjectSpace(at)for av,aw in ipairs(ar)do local ax,ay=ao(av,ap),Vector3.
new(aw.pos.X,aq+0.05,aw.pos.Z)local az,aA,aB=ap.CFrame:PointToObjectSpace(ay),aw
.isSafe and ad or ae,aw.isSafe and 0.35 or 0.55 if ax.dot and ax.dot.Parent then
local aC=CFrame.new(ay)*CFrame.Angles(math.rad(90),0,0)ax.dot.CFrame=ap.CFrame:
ToObjectSpace(aC)ax.dot.Color3=aA ax.dot.Transparency=aB ax.dot.Radius=aw.isSafe
and 0.3 or 0.2 ax.dot.Visible=true end if ax.line and ax.line.Parent then local
aC=az-au local aF=aC.Magnitude if aF>0.2 then ax.line.CFrame=CFrame.lookAt(au,az
)ax.line.Length=aF ax.line.Color3=aA ax.line.Transparency=aB+0.15 ax.line.
Thickness=aw.isSafe and 1.4 or 0.9 ax.line.Visible=true else ax.line.Visible=
false end end end for av=#ar+1,#aj do local aw=aj[av]if aw.dot and aw.dot.Parent
then aw.dot.Visible=false end if aw.line and aw.line.Parent then aw.line.Visible
=false end end end function ai.Update(aq,ar,as,at,au,av)if not aq or not aq.
Parent or not au or not ar then ai.Hide()return end an(aq)local aw=Vector3.new(
ar.X,as,ar.Z)if ak and ak.Parent then local ax=CFrame.new(aw)*CFrame.Angles(math
.rad(90),0,0)ak.CFrame=aq.CFrame:ToObjectSpace(ax)ak.Visible=true end if al and
al.Parent then local ax=CFrame.new(aw)*CFrame.Angles(math.rad(90),0,0)al.CFrame=
aq.CFrame:ToObjectSpace(ax)al.Visible=true end if am and am.Parent then local ax
,ay=Vector3.new(aq.Position.X,as+0.1,aq.Position.Z),Vector3.new(ar.X,as+0.1,ar.Z
)local az,aA=aq.CFrame:PointToObjectSpace(ax),aq.CFrame:PointToObjectSpace(ay)
local aB=aA-az local aC=aB.Magnitude if aC>0.3 then am.CFrame=CFrame.new(az)am.
Length=aC am.CFrame=CFrame.lookAt(az,aA)am.Visible=true else am.Visible=false
end end ap(aq,as,at,av)end function ai.Cleanup()if ak then pcall(function()ak:
Destroy()end)ak=nil end if al then pcall(function()al:Destroy()end)al=nil end if
am then pcall(function()am:Destroy()end)am=nil end for aq,ar in ipairs(aj)do if
ar.dot then pcall(function()ar.dot:Destroy()end)end if ar.line then pcall(
function()ar.line:Destroy()end)end end table.clear(aj)end return ai end function
a.u()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'e',a.load'f',a.load'b',a.load'l',a.
load'o',a.load'r',a.load's',a.load't',a.load'p'local aj,ak,al,am,an,ao,ap,aq,ar,
as,at,au,av,aw,ax,ay,az,aA,aB,aC=aa.RunService or game:GetService'RunService',
game:GetService'Players',aa.player,{},true,true,true,true,false,2,0,false,{},{},
0 local aF,aG,aH=function()local aF=al or ak.LocalPlayer if not aF then return
nil end local aG=aF.Character if not aG or not aG.Parent then return nil end
local aH=aG:FindFirstChildOfClass'Humanoid'if aH and aH.Health<=0 then return
nil end return aG:FindFirstChild'HumanoidRootPart'or aG.PrimaryPart end,function
(aF)local aG=al or ak.LocalPlayer if not aG then return nil end local aH=aG.
Character if not aH or not aH.Parent then return nil end local aI=aH:
FindFirstChildOfClass'Humanoid'if aI and aI.Health>0 then local aJ=aI.
MoveDirection if aJ and aJ.Magnitude>0.1 then return Vector3.new(aJ.X,0,aJ.Z).
Unit end end if aF and aF.Parent then local aJ=Vector3.zero pcall(function()aJ=
aF.AssemblyLinearVelocity or aF.Velocity or Vector3.zero end)local aK=Vector3.
new(aJ.X,0,aJ.Z)if aK.Magnitude>=2 then return aK.Unit end end return nil end,
function(aF)if not aF then return 0 end return aF.Position.Y-2.5 end function am
.IsPointSafe(aI,aJ)if not aI then return false end local aK,aL,aM,aN=Vector3.
new(aI.X,0,aI.Z),ai.GetActiveBossArea()if aL and aN and aM and aM>0 then local
aO=Vector3.new(aN.X,0,aN.Z)if(aK-aO).Magnitude>aM then return false end end
local aO=(af.GetRadius and af.GetRadius()or 1.8)+(aJ or 0)if ad.
IsPointInAnyHazard and ad.IsPointInAnyHazard(aK,nil,aO)then return false end if
ae.IsPointInAnyTrajectory and ae.IsPointInAnyTrajectory(aK,aO)then return false
end return true end function am.FindNearestSafeSpot(aI)if ab.IsInvulnerable and
ab.IsInvulnerable()then return nil,false,0,Vector3.zero end local aJ=aF()if not
aI then if not aJ then return nil,false,0,Vector3.zero end aI=aJ.Position end
local aK,aL=Vector3.new(aI.X,0,aI.Z),aG(aJ)table.clear(aw)local aM,aN,aO=ai.
GetActiveBossArea()local aP,aQ,aS=(aM and aO and aN and aN>0)and Vector3.new(aO.
X,0,aO.Z)or nil,ad.GetNearbyHazards and ad.GetNearbyHazards(aK,75)or nil,ae.
GetNearbyTrajectories and ae.GetNearbyTrajectories(aK,75)or nil local aT=
function(aT,aU)if not aT then return false end local aV=Vector3.new(aT.X,0,aT.Z)
if aP and aN then local aW=(aV-aP).Magnitude if aW>aN then return false end end
local aW=(af.GetRadius and af.GetRadius()or 1.8)+(aU or 0)if ad.
IsPointInAnyHazard and ad.IsPointInAnyHazard(aV,nil,aW,aQ)then return false end
if ae.IsPointInAnyTrajectory and ae.IsPointInAnyTrajectory(aV,aW,aS)then return
false end return true end if(aQ and#aQ==0 and aS and#aS==0 and not aP)or aT(aK,0
)then table.insert(aw,{pos=aK,isSafe=true,isChosen=true})return aK,true,0,
Vector3.zero end local aU,aV=aL,af.GetRadius and af.GetRadius()or 1.8 local aW,
aX,aY,aZ=ae.IsPointInAnyTrajectory(aK,aV,aS)if aW and aY and aZ then local a_,a0
,a1=Vector3.new(-aY.Z,0,aY.X),Vector3.new(aY.Z,0,-aY.X),aK-aZ local a2=a1.X*a_.X
+a1.Z*a_.Z local a3=a2>=0 and a_ or a0 if aL and aL.Magnitude>0.1 then local a4,
a5=aL.X*a_.X+aL.Z*a_.Z,aL.X*a0.X+aL.Z*a0.Z if a4>a5+0.3 then a3=a_ elseif a5>a4+
0.3 then a3=a0 end end local a4=0.45 if aL and aL.Magnitude>0.1 then local a5,a6
=-(aL.X*aY.X+aL.Z*aY.Z),math.abs(aL.X*a3.X+aL.Z*a3.Z)if a6>0.05 then local a7=a5
/a6 a4=math.clamp(a7,0.18,1)elseif a5>0 then a4=1 else a4=0.18 end end local a5=
(a3-a4*aY).Unit aU=a5 elseif aP and(aK-aP).Magnitude>aN then aU=(aP-aK).Unit end
local a_,a0,a1,a2=ag.SamplePass(aK,ag.COARSE_DIRECTIONS,ag.COARSE_RADII,as,true,
aT,aw,aU)if not a0 and aq then a_,a0,a1,a2=ag.SamplePass(aK,ag.FINE_DIRECTIONS,
ag.FINE_RADII,as,true,aT,aw,aU)end if not a0 and ar then a_,a0,a1,a2=ag.
SamplePass(aK,ag.FINE_DIRECTIONS,ag.FALLBACK_RADII or ag.FINE_RADII,0,false,aT,
aw,aU)end if a0 and a_ then for a3,a4 in ipairs(aw)do if(a4.pos-a_).Magnitude<
0.25 then a4.isChosen=true break end end return a_,true,a1,a2 end return aK,
false,math.huge,Vector3.zero end local aI=function()if not an then ah.Hide()
return end local aI=aF()if not aI or not aI.Parent then ah.Hide()return end if
ab.IsInvulnerable and ab.IsInvulnerable()then am.Clear()return end if(ai.
IsActiveDodgeDisabled and ai.IsActiveDodgeDisabled())or(ai.
IsActiveHazardScannerEnabled and not ai.IsActiveHazardScannerEnabled())then am.
Clear()return end local aJ,aK,aL=false if af.IsPlayerInDanger then aJ,aK,aL=af.
IsPlayerInDanger()end local aM=aJ or(ay~=nil)or au if not aM then local aN=os.
clock()if aN-ax<0.05 then return end ax=aN end local aN,aO=aH(aI),Vector3.new(aI
.Position.X,0,aI.Position.Z)if aJ then local aP,aQ=ay and(ay-aO).Magnitude or 0,
ay and am.IsPointSafe(ay)if not ay or not aQ then local aS,aT,aU,aV=am.
FindNearestSafeSpot(aI.Position)if aT and aS then ay=aS az=aK aA=aL at=aU au=
true ah.Update(aI,aS,aN,aw,ao,ap)for aW,aX in ipairs(av)do pcall(aX,true,aS,aU)
end else ah.Hide()end else at=aP ah.Update(aI,ay,aN,aw,ao,ap)for aS,aT in
ipairs(av)do pcall(aT,true,ay,aP)end end else local aP,aQ=ay and(ay-aO).
Magnitude or 0,ay and am.IsPointSafe(ay)if aQ and aP>0.8 then at=aP ah.Update(aI
,ay,aN,aw,ao,ap)for aS,aT in ipairs(av)do pcall(aT,true,ay,aP)end else if au or
ay then au=false ay=nil az=nil aA=nil at=0 ah.Hide()for aS,aT in ipairs(av)do
pcall(aT,false,nil,0)end end end end end local aJ=function()if not aB then aB=aj
.Heartbeat:Connect(aI)end if not aC and af.OnDangerStatusChanged then aC=af.
OnDangerStatusChanged(function(aJ)if aJ and an then aI()end end)end end function
am.Clear()if au or ay then au=false ay=nil az=nil aA=nil at=0 table.clear(aw)ah.
Hide()for aK,aL in ipairs(av)do pcall(aL,false,nil,0)end end end function am.
Cleanup()if aB then aB:Disconnect()aB=nil end ah.Cleanup()table.clear(aw)ay=nil
az=nil aA=nil at=0 au=false ax=0 end function am.GetLastSafeSpot()return ay,at,
au end function am.OnSafeSpotChanged(aK)if type(aK)=='function'then table.
insert(av,aK)end end function am.SetVisualEnabled(aK)ao=aK and true or false if
not ao then ah.Hide()end end function am.IsVisualEnabled()return ao end function
am.SetShowCandidates(aK)ap=aK and true or false if not ap then ah.
HideCandidates()end end function am.IsShowCandidates()return ap end function am.
SetEnabled(aK)an=aK and true or false if not an then ah.Hide()end end function
am.IsEnabled()return an end function am.SetSafetyBuffer(aK)if type(aK)=='number'
and aK>=0 then as=aK end end function am.GetSafetyBuffer()return as end function
am.SetFinePassEnabled(aK)aq=aK and true or false end function am.
IsFinePassEnabled()return aq end function am.SetFallbackPassEnabled(aK)ar=aK and
true or false end function am.IsFallbackPassEnabled()return ar end local aK=
function()local aK=al or ak.LocalPlayer if not aK then return end aK.
CharacterAdded:Connect(function()am.Clear()end)end aK()if ab.OnRoomIndexChanged
then ab.OnRoomIndexChanged(function()am.Clear()end)end if ab.OnEnemyChanged then
ab.OnEnemyChanged(function()if ab.GetEnemyCount and ab.GetEnemyCount()==0 then
am.Clear()end end)end if ab.OnLobbyChanged then ab.OnLobbyChanged(function()am.
Clear()end)end if ab.OnBossActiveChanged then ab.OnBossActiveChanged(function()
am.Clear()end)end aJ()ac.Register(function()am.Cleanup()end)return am end
function a.v()local aa,ab,ac,ad,ae,af=a.load'e',a.load'f',a.load'b',a.load'r',a.
load'u',a.load'p'local ag,ah,ai,aj,ak,al,am,an,ao,ap=aa.RunService or game:
GetService'RunService',game:GetService'Players',aa.player,{},false,2,false,{}
local aq,ar,as,at,au=function()local aq=ai or ah.LocalPlayer if not aq then
return nil,nil,nil end local ar=aq.Character if not ar or not ar.Parent then
return nil,nil,nil end local as=ar:FindFirstChildOfClass'Humanoid'if as and as.
Health<=0 then return nil,nil,nil end local at=ar:FindFirstChild
'HumanoidRootPart'or ar.PrimaryPart if not at then return nil,nil,nil end return
ar,as,at end,function()if ab.DisableControls then ab.DisableControls'Dodge'end
end,function()if ab.EnableControls then ab.EnableControls'Dodge'end end,(Vector3
.zero)local av,ax,ay,az=function()if au then return end local av=ag.
PreSimulation or ag.RenderStepped or ag.Heartbeat au=av:Connect(function()if not
am then return end local aw,ax=aq()if ax then ax:Move(at,false)end end)end,
function()if au then au:Disconnect()au=nil end at=Vector3.zero end,function(av)
local aw,ax,ay=aq()if not ay or not av then at=Vector3.zero return end local az=
ay.Position local aA=Vector3.new(av.X-az.X,0,av.Z-az.Z)if aA.Magnitude>0.05 then
at=aA.Unit else at=Vector3.zero end end,function()at=Vector3.zero end local aA=
function(aA,aB)az()ax()if aA then pcall(function()aA:Move(Vector3.zero,false)end
)end as()end local aB=function()if not ak then if am or ao then ao=nil am=false
local aB,aC,aF=aq()aA(aC,aF)for aG,aH in ipairs(an)do pcall(aH,false,nil,0)end
end return end local aB,aC,aF=aq()if not aB or not aC or not aF then if am or ao
then ao=nil am=false for aG,aH in ipairs(an)do pcall(aH,false,nil,0)end end
return end if ab.IsInvulnerable and ab.IsInvulnerable()then if am or ao then ao=
nil am=false local aG,aH,aI=aq()aA(aH,aI)for aJ,aK in ipairs(an)do pcall(aK,
false,nil,0)end end if ae and ae.Clear then ae.Clear()end return end if(af.
IsActiveDodgeDisabled and af.IsActiveDodgeDisabled())or(af.
IsActiveHazardScannerEnabled and not af.IsActiveHazardScannerEnabled())then if
am or ao then ao=nil am=false local aG,aH,aI=aq()aA(aH,aI)for aJ,aK in ipairs(an
)do pcall(aK,false,nil,0)end end if ae and ae.Clear then ae.Clear()end return
end local aG,aH,aI,aJ=ad.IsPlayerInDanger and ad.IsPlayerInDanger(),ae.
GetLastSafeSpot()if aH then ao=aH end local aK=ao and ae.IsPointSafe and ae.
IsPointSafe(ao)if ao and aK then local aL=aF.Position local aM=Vector3.new(ao.X-
aL.X,0,ao.Z-aL.Z)local aN=aM.Magnitude if aN<=al then local aO,aP=aF.CFrame,
Vector3.new(ao.X,aL.Y,ao.Z)local aQ=CFrame.new(aP)*(aO-aO.Position)aB:PivotTo(aQ
)aA(aC,aF)local aS=ao ao=nil if am then am=false for aT,aU in ipairs(an)do
pcall(aU,false,aS,aN)end end else if not am then am=true ar()av()for aO,aP in
ipairs(an)do pcall(aP,true,ao,aN)end end ay(ao)end else if am or ao then ao=nil
am=false aA(aC,aF)for aL,aM in ipairs(an)do pcall(aM,false,nil,0)end end end end
local aC=function()if not ap then ap=ag.Heartbeat:Connect(aB)end end function aj
.Clear()if am or ao then ao=nil am=false local aF,aG,aH=aq()aA(aG,aH)for aI,aJ
in ipairs(an)do pcall(aJ,false,nil,0)end end end function aj.Cleanup()if ap then
ap:Disconnect()ap=nil end aj.Clear()end function aj.SetEnabled(aF)ak=aF and true
or false if not ak then local aG,aH,aI=aq()aA(aH,aI)ao=nil am=false end end
function aj.IsEnabled()return ak end function aj.SetSnapDistance(aF)if type(aF)
=='number'and aF>=0.5 then al=aF end end function aj.GetSnapDistance()return al
end function aj.IsDodging()return am end function aj.OnDodgeStateChanged(aF)if
type(aF)=='function'then table.insert(an,aF)end end if ab.OnRoomIndexChanged
then ab.OnRoomIndexChanged(function()aj.Clear()end)end if ab.OnEnemyChanged then
ab.OnEnemyChanged(function()if ab.GetEnemyCount and ab.GetEnemyCount()==0 then
aj.Clear()end end)end if ab.OnLobbyChanged then ab.OnLobbyChanged(function()aj.
Clear()end)end if ab.OnBossActiveChanged then ab.OnBossActiveChanged(function()
aj.Clear()end)end aC()ac.Register(function()aj.Cleanup()end)return aj end
function a.w()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.load'b',a.load'q',a.load'l',
a.load'm',a.load'o',a.load'r',a.load'u',a.load'v',a.load'n',{}ac.BindDetection(
ab)ad.BindDetection(ab)ad.BindTrajectory(ae)ae.BindDetection(ab)ai.
BindDetection(ab)aj.IsPointInAnyHazard=ac.IsPointInAnyHazard aj.GetHazardPadding
=ac.GetHazardPadding aj.SetHazardPadding=ac.SetHazardPadding aj.GetHitboxPadding
=ac.GetHazardPadding aj.SetHitboxPadding=ac.SetHazardPadding aj.
GetTrajectoryMargin=ac.GetTrajectoryMargin aj.SetTrajectoryMargin=ac.
SetTrajectoryMargin aj.GetHazardZones=ac.GetHazardZones aj.GetNearbyHazards=ac.
GetNearbyHazards aj.AddForceCircleName=ac.AddForceCircleName aj.
GetForceCircleNames=ac.GetForceCircleNames aj.IsForceCircle=ac.IsForceCircle aj.
IsSecondBossCircleChain=ac.IsSecondBossCircleChain aj.
GetSecondBossCircleDuration=ac.GetSecondBossCircleDuration aj.
SetSecondBossCircleDuration=ac.SetSecondBossCircleDuration aj.IsPlayerInDanger=
af.IsPlayerInDanger aj.GetPlayerThreat=af.GetCurrentThreat aj.
OnPlayerDangerChanged=af.OnDangerStatusChanged aj.SetPlayerVisualEnabled=af.
SetVisualEnabled aj.IsPlayerVisualEnabled=af.IsVisualEnabled aj.
SetPlayerHitboxRadius=af.SetRadius aj.GetPlayerHitboxRadius=af.GetRadius aj.
FindNearestSafeSpot=ag.FindNearestSafeSpot aj.IsPointSafe=ag.IsPointSafe aj.
GetLastSafeSpot=ag.GetLastSafeSpot aj.OnSafeSpotChanged=ag.OnSafeSpotChanged aj.
SetSafeSpotVisualEnabled=ag.SetVisualEnabled aj.IsSafeSpotVisualEnabled=ag.
IsVisualEnabled aj.SetSafeSpotEnabled=ag.SetEnabled aj.IsSafeSpotEnabled=ag.
IsEnabled aj.SetSafeSpotBuffer=ag.SetSafetyBuffer aj.GetSafeSpotBuffer=ag.
GetSafetyBuffer aj.SetShowCandidates=ag.SetShowCandidates aj.IsShowCandidates=ag
.IsShowCandidates aj.SetFinePassEnabled=ag.SetFinePassEnabled aj.
IsFinePassEnabled=ag.IsFinePassEnabled aj.SetFallbackPassEnabled=ag.
SetFallbackPassEnabled aj.IsFallbackPassEnabled=ag.IsFallbackPassEnabled aj.
ClearSafeSpot=ag.Clear aj.SetAutoDodgeEnabled=ah.SetEnabled aj.
IsAutoDodgeEnabled=ah.IsEnabled aj.SetDodgeSnapDistance=ah.SetSnapDistance aj.
GetDodgeSnapDistance=ah.GetSnapDistance aj.IsCurrentlyDodging=ah.IsDodging aj.
OnDodgeStateChanged=ah.OnDodgeStateChanged aj.ClearDodge=ah.Clear aj.
SetVisualizerEnabled=ad.SetEnabled aj.IsVisualizerEnabled=ad.IsEnabled aj.
RefreshVisuals=ad.RefreshAll aj.SetTrajectoryEnabled=ae.SetEnabled aj.
IsTrajectoryEnabled=ae.IsEnabled aj.SetTrajectoryLength=ae.SetPredictionLength
aj.GetTrajectoryLength=ae.GetPredictionLength aj.GetHazardTrajectoryLength=ae.
GetHazardPredictionLength aj.GetCustomTrajectoryLength=ae.GetCustomLength aj.
SetCustomTrajectoryLength=ae.SetCustomLength aj.GetSecondBossBeamLength=ae.
GetSecondBossBeamLength aj.SetSecondBossBeamLength=ae.SetSecondBossBeamLength aj
.GetFirstBossBigSpikeWidth=ae.GetFirstBossBigSpikeWidth aj.
SetFirstBossBigSpikeWidth=ae.SetFirstBossBigSpikeWidth aj.
GetFirstBossSeekingSpikeWidth=ae.GetFirstBossSeekingSpikeWidth aj.
SetFirstBossSeekingSpikeWidth=ae.SetFirstBossSeekingSpikeWidth aj.
GetCustomTrajectoryWidth=ae.GetCustomWidth aj.SetCustomTrajectoryWidth=ae.
SetCustomWidth aj.RefreshTrajectory=ae.RefreshAll aj.IsPointInAnyTrajectory=ae.
IsPointInAnyTrajectory aj.GetNearbyTrajectories=ae.GetNearbyTrajectories aj.
SetSelectionBoxesEnabled=ab.SetSelectionBoxesEnabled aj.IsSelectionBoxesEnabled=
ab.IsSelectionBoxesEnabled aj.SetTimerVisualEnabled=ai.SetEnabled aj.
IsTimerVisualEnabled=ai.IsEnabled aj.RefreshTimerVisuals=ai.RefreshAll aj.
StartDetection=ab.StartScan aj.StopDetection=ab.StopScan aj.IsDetectionEnabled=
ab.IsEnabled aj.SetDetectionEnabled=ab.SetEnabled aj.SetLogHazards=ab.
SetLogHazards aj.IsLogHazardsEnabled=ab.IsLogHazardsEnabled aj.SetLogThreats=aj.
SetLogHazards aj.IsLogThreatsEnabled=aj.IsLogHazardsEnabled aj.SetLogFailed=ab.
SetLogFailed aj.IsLogFailedEnabled=ab.IsLogFailedEnabled aj.SetInspectTarget=ab.
SetInspectTarget aj.GetInspectTarget=ab.GetInspectTarget aj.SetInspectEnabled=ab
.SetInspectEnabled aj.IsInspectEnabled=ab.IsInspectEnabled aj.GetHazardCount=ab.
GetHazardCount aj.GetActiveHazards=ab.GetActiveHazards aj.GetLastHazardInfo=ab.
GetLastHazardInfo aj.OnHazardChanged=ab.OnHazardChanged aj.ClearAllHazards=ab.
ClearAllHazards aj.TriggerRoomTransition=ab.TriggerRoomTransition aj.
IsRoomTransitioning=ab.IsRoomTransitioning function aj.StartScan()ab.StartScan()
end function aj.StopScan()ab.StopScan()end function aj.Toggle(ak)if ak then aj.
StartScan()else aj.StopScan()end end function aj.IsEnabled()return ab.IsEnabled(
)end aa.Register(function()ab.StopScan()end)return aj end function a.x()local aa
,ab,ac,ad=a.load'e',a.load'f',a.load'b',a.load'j'local ae,af,ag,ah,ai,aj,ak,al,
am,an,ao,ap,aq,ar,as,at=aa.RunService or game:GetService'RunService',aa.
VirtualInputManager or game:GetService'VirtualInputManager',aa.player,{},false,
35,0.15,4,0,0,false,false,-math.huge,0 function ah.IsEnabled()return ai end
local au,av function ah.SetEnabled(ax)local ay=ax==true if ay==ai then return
end ai=ay if ai then au()else av()end end ah.IsSkillQEnabled=ah.IsEnabled ah.
SetSkillQEnabled=ah.SetEnabled ah.IsSkillEEnabled=ah.IsEnabled ah.
SetSkillEEnabled=ah.SetEnabled function ah.GetSkillERange()return aj end
function ah.SetSkillERange(ax)if type(ax)=='number'and ax>=2 then aj=ax end end
function ah.GetSpamInterval()return ak end function ah.SetSpamInterval(ax)if
type(ax)=='number'and ax>=0.05 then ak=ax end end function ah.GetBuffDuration()
return al end function ah.SetBuffDuration(ax)if type(ax)=='number'and ax>=0.5
then al=ax end end function ah.IsBuffActive()return(os.clock()-aq)<al end
function ah.TriggerBuff()aq=os.clock()end function ah.GetLastBuffTime()return aq
end function ah.GetRemainingBuffTime()local ax=al-(os.clock()-aq)return ax>0 and
ax or 0 end local ax=function()local ax=ag or game:GetService'Players'.
LocalPlayer if not ax then return nil end local ay=ax:FindFirstChild'Backpack'if
ay then for az,aA in ipairs(ay:GetChildren())do local aB=aA:FindFirstChild
'abilitySlot'if aB and string.lower(tostring(aB.Value))=='q'then return aA end
end end local az=ax.Character if az then for aA,aB in ipairs(az:GetChildren())do
if aB:IsA'Tool'then local aC=aB:FindFirstChild'abilitySlot'if aC and string.
lower(tostring(aC.Value))=='q'then return aB end end end end return nil end
local ay=function()local ay=ax()if ay then local az=ay:FindFirstChild'cooldown'
if az and typeof(az.Value)=='number'then return az.Value end end return nil end
local az,aA,aB,aC=function(az)local aA=ay()if aA~=nil then if aA>(ar+0.5)or(ar<=
0.2 and aA>0.5)then aq=az end ar=aA end end,function()if at then return end
pcall(function()local az=aa.ReplicatedStorage or game:GetService
'ReplicatedStorage'local aA=az and az:FindFirstChild'remotes'local aB=aA and aA:
FindFirstChild'abilityCast'if aB and aB:IsA'RemoteEvent'then at=aB.OnClientEvent
:Connect(function(aC,aF)local aG=ag or game:GetService'Players'.LocalPlayer if
aC==aG then local aH=ax()if(aH and aH.Name==aF)or(not aH)then aq=os.clock()end
end end)end end)end,function()if at then pcall(function()at:Disconnect()end)at=
nil end end,function()local az=ag or game:GetService'Players'.LocalPlayer local
aA=az and az.Character local aB=aA and(aA:FindFirstChild'HumanoidRootPart'or aA.
PrimaryPart)if aB and aB.Parent then return aB end return nil end local aF=
function()local aF=aC()if not aF then return nil,math.huge,false end local aG,aH
=aF.Position,ad.GetTarget and ad.GetTarget()if aH and aH.Root and aH.Root.Parent
then local aI=aH.Humanoid or(aH.Model and aH.Model:FindFirstChildOfClass
'Humanoid')if aI and aI.Health>0 then local aJ=aH.Root.Position local aK=Vector3
.new(aJ.X-aG.X,0,aJ.Z-aG.Z).Magnitude return aH,aK,true end end local aI,aJ,aK,
aL=ab.GetTrackedEnemyData and ab.GetTrackedEnemyData(),math.huge,false if aI and
#aI>0 then for aM,aN in ipairs(aI)do if aN and aN.Root and aN.Root.Parent then
local aO=aN.Humanoid or(aN.Model and aN.Model:FindFirstChildOfClass'Humanoid')if
aO and aO.Health>0 then aK=true local aP=aN.Root.Position local aQ,aS=aP.X-aG.X,
aP.Z-aG.Z local aT=aQ*aQ+aS*aS if aT<aJ then aJ=aT aL=aN end end end end end
local aM=aJ<math.huge and math.sqrt(aJ)or math.huge return aL,aM,aK end function
ah.CastSkillQ()if ao then return end ao=true task.spawn(function()local aG=(ab.
GetKeyHoldTime and ab.GetKeyHoldTime())or 0.05 pcall(function()af:SendKeyEvent(
true,Enum.KeyCode.Q,false,game)end)task.wait(aG)pcall(function()af:SendKeyEvent(
false,Enum.KeyCode.Q,false,game)end)ao=false end)end function ah.CastSkillE()if
ap then return end ap=true task.spawn(function()local aG=(ab.GetKeyHoldTime and
ab.GetKeyHoldTime())or 0.05 pcall(function()af:SendKeyEvent(true,Enum.KeyCode.E,
false,game)end)task.wait(aG)pcall(function()af:SendKeyEvent(false,Enum.KeyCode.E
,false,game)end)ap=false end)end local aG=function()if not ai or ab.IsInLobby()
then return end local aG=aC()if not aG then return end local aH=aG.Parent local
aI=aH and aH:FindFirstChildOfClass'Humanoid'if aI and aI.Health<=0 then return
end local aJ,aK,aL=aF()local aM=os.clock()az(aM)if(aM-am>=ak)and not ao then if
aL then local aN=ay()local aO=(aN==nil)or(aN<=0.2)if aO then am=aM ah.
CastSkillQ()if aN==nil and not ah.IsBuffActive()then aq=aM end end end end if(aM
-an>=ak)and not ap then if aJ and aK<=aj then local aN=ah.IsBuffActive()if aN
then an=aM ah.CastSkillE()end end end end au=function()if not as then as=ae.
Heartbeat:Connect(aG)end aA()end av=function()if as then as:Disconnect()as=nil
end aB()ao=false ap=false ar=0 aq=-math.huge end function ah.Step(aH,aI,aJ)end
ac.Register(function()ah.SetEnabled(false)end)return ah end function a.y()local
aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak=a.load'e',a.load'f',a.load'b',a.load'g',a.load
'h',a.load'i',a.load'j',a.load'k',a.load'w',a.load'x',a.load'p'local al,am,an,ao
,ap,aq,ar,as,at,au,av,ax,ay,az,aA,aB,aC,aF=aa.RunService,aa.player,{NO_TARGET=
'NO_TARGET',ACQUIRING_TARGET='ACQUIRING_TARGET',TRACKING_TARGET=
'TRACKING_TARGET',CHASE='CHASE',HOLD='HOLD',KITE='KITE',BLOCKED='BLOCKED',
REPATHING='REPATHING'},{},false,false,1.5,15,35,25,50,true,6,true,true,true,true
,true local aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ,aS,aT,aU,aV,aW,aX,aY,aZ,a_,a0,a1,a2
,a3,a4,a5,a6,a7,a8,a9,b,ba,bb,bc=an.NO_TARGET,'None',0,0,false,false,0,0,false,
10,false,{},function()if ab.DisableControls then ab.DisableControls'AutoFarm'end
end,function()if ab.EnableControls then ab.EnableControls'AutoFarm'end end,(
Vector3.zero)local bd,be,bf,bg,bh,bi,bj,bk,bl=function()if bc then return end
local bd=al.PreSimulation or al.RenderStepped or al.Heartbeat bc=bd:Connect(
function()if not aq or aQ then return end if ai.IsCurrentlyDodging and ai.
IsCurrentlyDodging()then return end local be=ab.GetHumanoid()if be then be:Move(
aV,false)end end)end,function()if bc then bc:Disconnect()bc=nil end aV=Vector3.
zero end,function(bd)if bd and bd.Magnitude>0.05 then aV=Vector3.new(bd.X,0,bd.Z
).Unit else aV=Vector3.zero end end,function()aV=Vector3.zero end,function()
local bd=am and am.Character local be=bd and bd:FindFirstChild'HumanoidRootPart'
if be and be.Parent then return be end return nil end,function(bd)if not bd or
not bd.Parent then return nil end local be,bf=pcall(function()return bd.Position
end)if not be or not bf then return nil end return bf end,function(bd)if ab.
IsBossActive and ab.IsBossActive()then return true end if bd then if bd.Room and
type(bd.Room.Name)=='string'and string.find(string.lower(bd.Room.Name),'boss')
then return true end if bd.Model then local be=string.lower(bd.Model.Name)if
string.find(be,'boss')then return true end local bf=bd.Model.Parent if bf and
string.find(string.lower(bf.Name),'boss')then return true end end end return
false end,function(bd)return ak.GetActiveCombatDistances(bd)end,function(bd,be)
if bd==be then return true end if bd and be and bd.Model and be.Model and bd.
Model==be.Model then return true end return false end local bm=function(bm,bn)
local bo=ag.GetTarget()if bl(bo,bm)then return end ag.SetTarget(bm,nil,nil,bn)aW
=nil aH='None'aX=nil aY=nil aM=0 if bm then aG=an.CHASE else aG=an.NO_TARGET end
end bb=function()if aK or not ap or not aq then return end aJ+=1 local bn=aJ aK=
true local bo=bh()local bp=bo and bi(bo)if not bp then aK=false return end local
bq=ae.Scan()if#bq==0 then if bn==aJ and ap and aq then bm(nil,nil)end aK=false
return end local br,bs,bt,bu=af.SelectBestTarget(bp,bq,function()return bn~=aJ
or not ap or not aq end)if bn==aJ and ap and aq then bm(br,bu)end aK=false end
local bn,bo,bp,bq=function(bn)if ab.IsInLobby()or not aL then return end local
bo,bp=bh(),ab.GetHumanoid()if not bo or not bp or bp.Health<=0 then return end
local bq=bi(bo)if not bq then return end if ai.IsCurrentlyDodging and ai.
IsCurrentlyDodging()then aV=Vector3.zero return end if aQ then aV=Vector3.zero
return end local br=os.clock()if br-aI>=ar then aI=br if aG~=an.HOLD and aG~=an.
KITE then bb()end end local bt=ag.GetTarget()if bt then if not ag.IsTargetValid(
)then ag.ClearTarget()aG=an.NO_TARGET aW=nil aH='None'aY=nil bg()pcall(function(
)bp.AutoRotate=true end)bb()return end end if not bt or aG==an.NO_TARGET then aW
=nil aH='None'aY=nil bg()pcall(function()bp.AutoRotate=true end)if not aK and br
-aI>=0.5 then aI=br bb()end return end local bu=bt.Root and bi(bt.Root)if not bu
then ag.ClearTarget()aG=an.NO_TARGET aY=nil bg()pcall(function()bp.AutoRotate=
true end)return end local bv,bw=bk(bt)local bx=Vector3.new(bu.X-bq.X,0,bu.Z-bq.Z
)local by,bz,bA,bB=bx.Magnitude,ak.GetActiveBossArea(bt)local bC,bD=false if bz
and bB and bA and bA>0 then bD=Vector3.new(bB.X,0,bB.Z)local bE=(Vector3.new(bq.
X,0,bq.Z)-bD).Magnitude if bE>bA then bC=true end end if bC and bD and bB then
local bE=Vector3.new(bB.X-bq.X,0,bB.Z-bq.Z)local bF,bG=bE.Magnitude>0.1 and bE.
Unit or Vector3.new(0,0,1),Vector3.new(bB.X,bq.Y,bB.Z)aG=an.CHASE aH=
'Enter Boss Area'aW=bG aM=0 bf(bF)return end if ax and by<=(bw+25)then pcall(
function()bp.AutoRotate=false local bE=Vector3.new(bu.X,bo.Position.Y,bu.Z)if(bE
-bo.Position).Magnitude>0.5 then bo.CFrame=CFrame.lookAt(bo.Position,bE)end end)
else pcall(function()bp.AutoRotate=true end)end aj.Step(bn,bt,by)local bE,bF,bG,
bH=ab.IsInvulnerable and ab.IsInvulnerable(),ak.IsActiveDodgeDisabled and ak.
IsActiveDodgeDisabled(bt),not(ak.IsActiveHazardScannerEnabled and not ak.
IsActiveHazardScannerEnabled(bt)),ai.IsAutoDodgeEnabled and ai.
IsAutoDodgeEnabled()local bI=not bE and not bF and bG and bH and ai and ai.
IsPointSafe if by<bv then local bJ=Vector3.new(bq.X-bu.X,0,bq.Z-bu.Z)local bK,bL
=bJ.Magnitude>0.1 and bJ.Unit or Vector3.new(0,0,1),math.clamp(bv-by+6,4,15)
local bM=bq+bK*bL if bD and bA then local bN=Vector3.new(bM.X,0,bM.Z)if(bN-bD).
Magnitude>bA then local bO=bD+(bN-bD).Unit*math.max(1,bA-2)bM=Vector3.new(bO.X,
bq.Y,bO.Z)if(bM-bq).Magnitude<2 then aG=an.HOLD aH='Hold (Boss Area Edge)'aW=nil
aM=0 bg()return end end end local bN=true if bI then bN=ai.IsPointSafe(bM,0.5)
end if not bN then aG=an.HOLD aH='Hold (Danger Behind)'aW=nil aM=0 bg()else aG=
an.KITE aH='Kite'aM=0 aW=bM bf(bK)end elseif by<=bw then aG=an.HOLD aW=nil aH=
'Hold'aM=0 bg()else local bJ,bK=bx.Magnitude>0.1 and bx.Unit or Vector3.new(0,0,
1),false if bI then local bL=Vector3.new(-bJ.Z,0,bJ.X)*1.2 for bM,bN in ipairs{3
,6,10}do if bN<by then local bO=bq+bJ*bN local bP,bQ=bO+bL,bO-bL if not ai.
IsPointSafe(bO,0.5)or not ai.IsPointSafe(bP,0.5)or not ai.IsPointSafe(bQ,0.5)
then bK=true break end end end end if bK then aG=an.HOLD aH=
'Hold (Danger Ahead)'aW=nil aM=0 bg()else aG=an.CHASE aH='Chase'local bL=Vector3
.new(bu.X,bq.Y,bu.Z)aW=bL bf(bJ)local bM=bu.Y-bq.Y if bM>1.8 and by<=8 then bp.
Jump=true end local bN=bo.AssemblyLinearVelocity or bo.Velocity local bO,bP=bN
and Vector3.new(bN.X,0,bN.Z).Magnitude or 0,(type(bn)=='number'and bn>0)and bn
or 0.016 if bO<aP then aM+=bP if aO and(br-aN)>=0.4 then bp.Jump=true pcall(
function()bp:ChangeState(Enum.HumanoidStateType.Jumping)end)aN=br end else aM=0
end end end end,function()if a1 and a1.Parent then return a1 end if a1 then
pcall(function()a1:Destroy()end)a1=nil end a1=Instance.new'Highlight'a1.Name=
'TM_EnemyHighlight_Debug'a1.FillColor=Color3.fromRGB(255,200,0)a1.
FillTransparency=0.5 a1.OutlineColor=Color3.fromRGB(255,0,0)a1.
OutlineTransparency=0 a1.Parent=aa.CoreGui or game:GetService'CoreGui'return a1
end,function()return workspace.Terrain end,function()for bn,bo in ipairs(aS)do
pcall(function()bo:Destroy()end)end table.clear(aS)ba=nil end local br,bt=
function()if ab.IsInLobby()then return end local br,bt=ag.GetTarget(),bh()local
bu,bv=bt and bi(bt),bp()if not aB or not br or not br.Root then if a1 and a1.
Parent then a1.Enabled=false end else local bw=bo()if br.Model and br.Model.
Parent then bw.Adornee=br.Model bw.Enabled=true else bw.Enabled=false end end
local bw,bx=ag.GetWaypoints(),ag.GetPathInstance()if not az or not bw or#bw==0
or not bv then bq()else local by=tostring(bx)..'_'..tostring(#bw)if ba~=by then
bq()for bz=2,#bw do local bA,bB=bw[bz-1].Position,bw[bz].Position local bC=(bB-
bA).Magnitude if bC>0.01 then local bD=Instance.new'LineHandleAdornment'bD.Name=
'TM_PathLine_Debug'bD.Adornee=bv bD.AlwaysOnTop=true bD.Length=bC bD.Thickness=2
bD.Transparency=0.3 bD.Color3=Color3.fromRGB(0,255,120)bD.ZIndex=0 bD.CFrame=
CFrame.lookAt(bA,bB)bD.Parent=aa.CoreGui or game:GetService'CoreGui'aS[#aS+1]=bD
end end ba=by end end if not aA or not aW or not bu or not bv then if a2 then a2
.Visible=false end if a3 then a3.Visible=false end else local by,bz=bu+Vector3.
new(0,0.5,0),aW+Vector3.new(0,0.5,0)local bA=(bz-by).Magnitude if bA>=0.3 then
if not a2 or not a2.Parent then a2=Instance.new'LineHandleAdornment'a2.Name=
'TM_ActualPath_Debug'a2.Adornee=bv a2.AlwaysOnTop=true a2.Thickness=3.5 a2.
Transparency=0.15 a2.Color3=Color3.fromRGB(0,230,255)a2.ZIndex=2 a2.Parent=aa.
CoreGui or game:GetService'CoreGui'end a2.Length=bA a2.CFrame=CFrame.lookAt(by,
bz)a2.Visible=true if not a3 or not a3.Parent then a3=Instance.new
'SphereHandleAdornment'a3.Name='TM_ActualMarker_Debug'a3.Adornee=bv a3.
AlwaysOnTop=true a3.Radius=0.65 a3.Transparency=0.2 a3.Color3=Color3.fromRGB(0,
230,255)a3.ZIndex=3 a3.Parent=aa.CoreGui or game:GetService'CoreGui'end a3.
CFrame=CFrame.new(bz)a3.Visible=true else if a2 then a2.Visible=false end if a3
then a3.Visible=false end end end if not aC or not aY or not bu or not br or not
bv then if a4 then a4.Visible=false end if a5 then a5.Visible=false end else
local by,bz,bA=aY.origin or(bu+Vector3.new(0,1.5,0)),aY.directHitPos or aY.
targetPos,aY.directBlocked if bz then local bB=(bz-by).Magnitude if bB>=0.2 then
if not a4 or not a4.Parent then a4=Instance.new'LineHandleAdornment'a4.Name=
'TM_BlockerRay_Debug'a4.Adornee=bv a4.AlwaysOnTop=true a4.Thickness=3 a4.
Transparency=0.2 a4.ZIndex=3 a4.Parent=aa.CoreGui or game:GetService'CoreGui'end
a4.Length=bB a4.Color3=bA and Color3.fromRGB(255,30,30)or Color3.fromRGB(50,255,
50)a4.CFrame=CFrame.lookAt(by,bz)a4.Visible=true if bA and aY.directHitPos then
if not a5 or not a5.Parent then a5=Instance.new'SphereHandleAdornment'a5.Name=
'TM_BlockerHitMarker_Debug'a5.Adornee=bv a5.AlwaysOnTop=true a5.Radius=0.5 a5.
Transparency=0.2 a5.Color3=Color3.fromRGB(255,30,30)a5.ZIndex=4 a5.Parent=aa.
CoreGui or game:GetService'CoreGui'end a5.CFrame=CFrame.new(aY.directHitPos)a5.
Visible=true else if a5 then a5.Visible=false end end else if a4 then a4.Visible
=false end if a5 then a5.Visible=false end end end end local by=br and br.Root
if not aF or not by or not by.Parent then if a6 then a6.Visible=false end if a7
then a7.Visible=false end if a8 then a8.Visible=false end if a9 then a9.Visible=
false end else local bz=bi(by)or by.Position local bA=bu and(bu.Y-2.5)or(bz.Y-
2.5)local bB=Vector3.new(bz.X,bA,bz.Z)local bC=CFrame.new(bB)*CFrame.Angles(math
.rad(90),0,0)local bD,bE,bF=by.CFrame:ToObjectSpace(bC),bk(br)local bG=math.max(
1,bE)local bH,bI=math.max(bG+0.5,bF),0.35 if not a6 or not a6.Parent then a6=
Instance.new'CylinderHandleAdornment'a6.Name='TM_MinDistanceFill_Debug'a6.
AlwaysOnTop=true a6.ZIndex=4 a6.Parent=aa.CoreGui or game:GetService'CoreGui'end
a6.Adornee=by a6.Height=0.02 a6.InnerRadius=0 a6.Radius=bG a6.Color3=Color3.
fromRGB(255,200,0)a6.Transparency=0.82 a6.CFrame=bD a6.Visible=true if not a7 or
not a7.Parent then a7=Instance.new'CylinderHandleAdornment'a7.Name=
'TM_MinDistanceRing_Debug'a7.AlwaysOnTop=true a7.ZIndex=5 a7.Parent=aa.CoreGui
or game:GetService'CoreGui'end a7.Adornee=by a7.Height=0.05 a7.InnerRadius=math.
max(0.1,bG-bI)a7.Radius=bG a7.Color3=Color3.fromRGB(255,215,20)a7.Transparency=
0.25 a7.CFrame=bD a7.Visible=true if not a8 or not a8.Parent then a8=Instance.
new'CylinderHandleAdornment'a8.Name='TM_MaxDistanceFill_Debug'a8.AlwaysOnTop=
true a8.ZIndex=4 a8.Parent=aa.CoreGui or game:GetService'CoreGui'end a8.Adornee=
by a8.Height=0.02 a8.InnerRadius=bG a8.Radius=bH a8.Color3=Color3.fromRGB(0,255,
120)a8.Transparency=0.82 a8.CFrame=bD a8.Visible=true if not a9 or not a9.Parent
then a9=Instance.new'CylinderHandleAdornment'a9.Name='TM_MaxDistanceRing_Debug'
a9.AlwaysOnTop=true a9.ZIndex=5 a9.Parent=aa.CoreGui or game:GetService'CoreGui'
end a9.Adornee=by a9.Height=0.05 a9.InnerRadius=math.max(0.1,bH-bI)a9.Radius=bH
a9.Color3=Color3.fromRGB(0,255,120)a9.Transparency=0.25 a9.CFrame=bD a9.Visible=
true local bJ,bK,bL=ak.GetActiveBossArea(br)if bJ and bL and bK and bK>0 then
local bM=Vector3.new(bL.X,bA,bL.Z)local bN=CFrame.new(bM)*CFrame.Angles(math.
rad(90),0,0)local bO=by.CFrame:ToObjectSpace(bN)if not b or not b.Parent then b=
Instance.new'CylinderHandleAdornment'b.Name='TM_BossAreaRing_Debug'b.AlwaysOnTop
=true b.ZIndex=5 b.Parent=aa.CoreGui or game:GetService'CoreGui'end b.Adornee=by
b.Height=0.05 b.InnerRadius=math.max(0.1,bK-0.45)b.Radius=bK b.Color3=Color3.
fromRGB(0,200,255)b.Transparency=0.3 b.CFrame=bO b.Visible=true else if b then b
.Visible=false end end end end,function()if a1 then pcall(function()a1:Destroy()
end)a1=nil end if a2 then pcall(function()a2:Destroy()end)a2=nil end if a3 then
pcall(function()a3:Destroy()end)a3=nil end if a4 then pcall(function()a4:
Destroy()end)a4=nil end if a5 then pcall(function()a5:Destroy()end)a5=nil end if
a6 then pcall(function()a6:Destroy()end)a6=nil end if a7 then pcall(function()a7
:Destroy()end)a7=nil end if a8 then pcall(function()a8:Destroy()end)a8=nil end
if a9 then pcall(function()a9:Destroy()end)a9=nil end if b then pcall(function()
b:Destroy()end)b=nil end bq()end function ao.IsEnabled()return ap end function
ao.IsRunning()return aq end function ao.GetState()return aG end function ao.
GetScanInterval()return ar end function ao.SetScanInterval(bu)if type(bu)==
'number'and bu>0.1 then ar=bu end end function ao.GetMobMinCombatDistance()
return as end function ao.SetMobMinCombatDistance(bu)if type(bu)=='number'and bu
>=1 then as=bu if as>at then at=as+5 end end end function ao.
GetMobMaxCombatDistance()return at end function ao.SetMobMaxCombatDistance(bu)if
type(bu)=='number'and bu>=2 then at=bu if as>at then as=math.max(1,at-5)end end
end function ao.GetBossMinCombatDistance()return au end function ao.
SetBossMinCombatDistance(bu)if type(bu)=='number'and bu>=1 then au=bu if au>av
then av=au+5 end end end function ao.GetBossMaxCombatDistance()return av end
function ao.SetBossMaxCombatDistance(bu)if type(bu)=='number'and bu>=2 then av=
bu if au>av then au=math.max(1,av-5)end end end function ao.GetMinCombatDistance
()return as end function ao.SetMinCombatDistance(bu)ao.SetMobMinCombatDistance(
bu)end function ao.GetMaxCombatDistance()return at end function ao.
SetMaxCombatDistance(bu)ao.SetMobMaxCombatDistance(bu)end ao.IsTargetBoss=bj
function ao.IsAutoFaceTargetEnabled()return ax end function ao.SetAutoFaceTarget
(bu)ax=bu and true or false if not ax then local bv=ab.GetHumanoid()if bv and bv
.Parent then pcall(function()bv.AutoRotate=true end)end end end function ao.
GetReachDistance()return maxCombatDistance end function ao.SetReachDistance(bu)
if type(bu)=='number'and bu>=2 then ao.SetMaxCombatDistance(bu)end end function
ao.GetRepathDistance()return ay end function ao.SetRepathDistance(bu)if type(bu)
=='number'and bu>=1 then ay=bu ag.SetRepathThreshold(bu)end end function ao.
SetAutoJumpOnStuck(bu)aO=bu==true end function ao.IsAutoJumpOnStuckEnabled()
return aO end function ao.SetStuckVelocityThreshold(bu)if type(bu)=='number'and
bu>0 then aP=bu end end function ao.GetStuckVelocityThreshold()return aP end
function ao.SetPaused(bu)local bv=bu and true or false if bv==aQ then return end
aQ=bv if aQ then bg()aU()local bw=ab.GetHumanoid()if bw and bw.Parent then
pcall(function()bw.AutoRotate=true if not(ai.IsCurrentlyDodging and ai.
IsCurrentlyDodging())then bw:Move(Vector3.zero,false)end end)end else if ap and
aq then aT()end end end function ao.IsPaused()return aQ end function ao.
IsAutoSkillEnabled()return aj.IsEnabled()end function ao.SetAutoSkillEnabled(bu)
aj.SetEnabled(bu)end ao.IsAutoSkillQEnabled=aj.IsSkillQEnabled ao.
SetAutoSkillQEnabled=aj.SetSkillQEnabled ao.IsAutoSkillEEnabled=aj.
IsSkillEEnabled ao.SetAutoSkillEEnabled=aj.SetSkillEEnabled ao.GetSkillERange=aj
.GetSkillERange ao.SetSkillERange=aj.SetSkillERange ao.GetSkillSpamInterval=aj.
GetSpamInterval ao.SetSkillSpamInterval=aj.SetSkillSpamInterval ao.
GetBuffDuration=aj.GetBuffDuration ao.SetBuffDuration=aj.SetBuffDuration ao.
IsBuffActive=aj.IsBuffActive ao.CastSkillQ=aj.CastSkillQ ao.CastSkillE=aj.
CastSkillE function ao.IsPlannedPathVisualEnabled()return az end function ao.
SetPlannedPathVisual(bu)az=bu==true if not az then bq()end end function ao.
IsActualPathVisualEnabled()return aA end function ao.SetActualPathVisual(bu)aA=
bu==true if not aA then if a2 then a2.Visible=false end if a3 then a3.Visible=
false end end end function ao.IsBlockerRayVisualEnabled()return aC end function
ao.SetBlockerRayVisual(bu)aC=bu==true if not aC then if a4 then a4.Visible=false
end if a5 then a5.Visible=false end end end function ao.IsTargetVisualEnabled()
return aB end function ao.SetTargetVisual(bu)aB=bu==true if not aB then if a1
and a1.Parent then a1.Enabled=false end end end function ao.
IsCombatRangeVisualEnabled()return aF end function ao.SetCombatRangeVisual(bu)aF
=bu==true if not aF then if a6 then a6.Visible=false end if a7 then a7.Visible=
false end if a8 then a8.Visible=false end if a9 then a9.Visible=false end end
end function ao.GetDebugInfo()local bu=bh()local bv,bw,bx,by,bz,bA=bu and bi(bu)
,ag.GetTarget(),'-',0,0,ag.GetWaypoints()if bw and bw.Model then bx=bw.Model.
Name or'-'local bB=bi(bw.Root)if bB and bv then by=(bB-bv).Magnitude bz=Vector3.
new(bB.X-bv.X,0,bB.Z-bv.Z).Magnitude end end local bB={directBlocked=false,
blockerName='None',blockerDist=0}if aY then bB.directBlocked=aY.directBlocked==
true if aY.directHitPart then bB.blockerName=aY.directHitPart.Name or'Part'end
if aY.directHitPos and bv then bB.blockerDist=(aY.directHitPos-bv).Magnitude end
end local bC,bD=0,0 if bu then local bE=bu.AssemblyLinearVelocity or bu.Velocity
if bE then bC=Vector3.new(bE.X,0,bE.Z).Magnitude bD=bE.Y end end return{state=aG
,enemyName=bx,enemyDist=by,enemyFlat=bz,hasTarget=bw~=nil,destMode=aH,nodeIndex=
aX,waypointCount=bA and#bA or 0,hasDestination=aW~=nil,blocker=bB,velocity=bC,
verticalVelocity=bD,stuckTimer=aM}end function ao.Toggle(bu,bv)if bu==ap then
return end ap=bu if ap then if not bv then ad.EnableExclusive'AutoFarm'end if aZ
then aZ:Disconnect()aZ=nil end aT()bd()aq=true aJ=0 aK=false aI=0 ag.
SetRepathThreshold(ay)if not a_ then a_=ab.OnEnemyChanged(function()if ap and aq
and aG~=an.HOLD then bb()end end)end if not a0 then a0=ab.OnRespawn(function()ag
.ClearTarget()aG=an.NO_TARGET aY=nil bb()end)end if not aL then task.spawn(
function()if ab.ReadyDungeon()then aL=true end end)end task.defer(bb)aZ=al.
Heartbeat:Connect(function(bw)local bx,by=pcall(bn,bw)if not bx then warn((
'[AutoFarm] Error in stepMovementLoop: %s'):format(tostring(by)))end br()end)
else if aZ then aZ:Disconnect()aZ=nil end be()aU()aq=false if a_ then a_()a_=nil
end if a0 then a0()a0=nil end bg()local bw=ab.GetHumanoid()if bw and bw.Parent
then pcall(function()bw.AutoRotate=true if not(ai.IsCurrentlyDodging and ai.
IsCurrentlyDodging())then bw:Move(Vector3.zero,false)end end)end ag.ClearTarget(
)aG=an.NO_TARGET aW=nil aH='None'aY=nil aM=0 aJ+=1 aK=false bt()end end ad.
Register('AutoFarm',ao.Toggle,ao.IsEnabled)ac.Register(function()ao.Toggle(false
)bt()end)return ao end function a.z()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.load
'b',a.load'y',a.load'w',a.load'g',a.load'c',{},false,true,false,{}local ak=
function()for ak,al in ipairs(aj)do pcall(al,ag)end end function af.IsEnabled()
return ag end function af.Toggle(al,am)local an=al==true if ag==an then if not
an then ai=false end return end ag=an if am then ai=an elseif not an then ai=
false end if an then ad.EnableExclusive'CombatMaster'ac.Toggle(true)ac.
SetAutoDodgeEnabled(true)ab.Toggle(true,true)ab.SetAutoSkillEnabled(true)else ab
.Toggle(false,true)ab.SetAutoSkillEnabled(false)ac.SetAutoDodgeEnabled(false)ac.
Toggle(false)end ak()end function af.IsAutoTriggeredByBoss()return ai end
function af.SetAutoBossCombat(al)ah=al==true end function af.
IsAutoBossCombatEnabled()return ah end function af.OnStateChanged(al)if type(al)
~='function'then return function()end end table.insert(aj,al)return function()
for am,an in ipairs(aj)do if an==al then table.remove(aj,am)break end end end
end ad.Register('CombatMaster',function(al)if not al then af.Toggle(false)end
end,af.IsEnabled)aa.Register(function()af.Toggle(false)end)return af end
function a.A()local aa={}function aa.PatchSliderLoadCallback(ab)if not ab or
type(ab.UpdateValue)~='function'then return ab end local ac=ab.UpdateValue ab.
UpdateValue=function(ad,ae)local af,ag=ad,ae if ag==nil and(type(af)=='number'or
type(af)=='string')then ag=af af=ab end pcall(ac,af,ag)local ah=af and af.
Settings or ab.Settings if ah and ah.Callback then pcall(ah.Callback,tonumber(ag
))end end return ab end function aa.PatchDropdownRestore(ab,ac)if not ab or
type(ab.UpdateSelection)~='function'then return ab end local ad=ab.
UpdateSelection ab.UpdateSelection=function(ae,af)if type(af)=='string'and af~=
''and not ae:IsOption(af)then if ac then pcall(function()ae:InsertOptions{af}end
)else local ag=ae.Settings and ae.Settings.Options if type(ag)=='table'and#ag>0
then af=ag[1]else local ah=next(ae:GetOptions())if ah then af=ah end end end end
ad(ae,af)end return ab end return aa end function a.B()local aa,ab,ac=a.load'e',
a.load'f',a.load'b'local ad,ae,af,ag,ah=aa.UserInputService,aa.
VirtualInputManager,{},false function af.IsMouseComboEnabled()return ag end
function af.SetMouseComboEnabled(ai)ag=ai==true end local ai=function()task.
spawn(function()ae:SendKeyEvent(true,Enum.KeyCode.Q,false,game)ae:SendKeyEvent(
true,Enum.KeyCode.E,false,game)task.wait(ab.GetKeyHoldTime())ae:SendKeyEvent(
false,Enum.KeyCode.Q,false,game)ae:SendKeyEvent(false,Enum.KeyCode.E,false,game)
end)end function af.Init()if af.inited then return end af.inited=true ah=ad.
InputBegan:Connect(function(aj,ak)if aj.UserInputType==Enum.UserInputType.
MouseButton2 then if ad:GetFocusedTextBox()then return end if ag then ai()end
end end)end ac.Register(function()if ah then ah:Disconnect()ah=nil end af.inited
=false end)return af end function a.C()local aa,ab,ac,ad=a.load'e',a.load'f',a.
load'c',a.load'b'local ae,af,ag,ah,ai,aj,ak,al,am,an=aa.player,{},false,{[2]=
true},0,{},{}for ao=1,15 do table.insert(ak,('Room %d'):format(ao))end local ao,
ap=function(ao)if type(ao)=='number'then return math.clamp(math.floor(ao),1,20)
elseif type(ao)=='string'then local ap=tonumber(ao:match'%d+')if ap then return
math.clamp(math.floor(ap),1,20)end end return nil end,function()local ao,ap=ab.
GetHumanoid(),ae and ae.Character if ao and ao.Health>0 then pcall(function()ao.
Health=0 end)pcall(function()ao:ChangeState(Enum.HumanoidStateType.Dead)end)end
if ap and ap.Parent then pcall(function()ap:BreakJoints()end)end end local aq=
function(aq)if not ag then return end if ab.IsInLobby()or ab.IsDead()then return
end if aq<=0 then return end if not ah[aq]then return end if aj[aq]then return
end aj[aq]=true task.spawn(function()if ai>0 then task.wait(ai)end if not ag or
ab.IsInLobby()or ab.IsDead()then return end if ab.GetCurrentRoomIndex()~=aq then
return end ac.Notify('Auto Reset',(
'Reset character at Room %d (Once per room/run)'):format(aq),3)ap()end)end local
ar,as=function()if al then return end al=ab.OnRoomIndexChanged(function(ar)if ar
<=1 then table.clear(aj)end aq(ar)end)am=ab.OnLobbyChanged(function(ar)if ar
then table.clear(aj)end end)an=ab.OnDungeonNameChanged(function()table.clear(aj)
end)end,function()if al then al()al=nil end if am then am()am=nil end if an then
an()an=nil end end function af.Toggle(at)ag=at and true or false if ag then
table.clear(aj)ar()aq(ab.GetCurrentRoomIndex())else as()end end function af.
IsEnabled()return ag end function af.GetRoomOptions()return ak end function af.
SetTargetRooms(at)local au={}if type(at)=='table'then for av,ax in pairs(at)do
if ax==true then local ay=ao(av)if ay then au[ay]=true end else local ay=ao(ax)
if ay then au[ay]=true end end end elseif at~=nil then local av=ao(at)if av then
au[av]=true end end ah=au end function af.GetTargetRooms()local at={}for au in
pairs(ah)do table.insert(at,au)end table.sort(at)local au={}for av,ax in ipairs(
at)do table.insert(au,('Room %d'):format(ax))end return au end function af.
GetTargetRoomNumbers()local at={}for au in pairs(ah)do table.insert(at,au)end
table.sort(at)return at end function af.SetTargetRoom(at)local au=ao(at)if au
then ah={[au]=true}end end function af.GetTargetRoom()for at in pairs(ah)do
return at end return 2 end function af.SetDelay(at)if type(at)=='number'then ai=
math.clamp(at,0,15)end end function af.GetDelay()return ai end function af.
ResetNow()ac.Notify('Auto Reset','Manual character reset executed',2)ap()end ad.
Register(function()as()ag=false table.clear(aj)end)return af end function a.D()
local aa,ab,ac,ad,ae=a.load'f',a.load'A',a.load'd',a.load'B',a.load'C'return
function(af,ag)local ah=ag:Section{Side='Right'}ah:Header{Name='Movement Speed'}
ah:Toggle({Name='Fast Speed',Default=aa.IsSpeedEnabled(),Callback=ac.Wrap(
function(ai)aa.SetSpeedEnabled(ai)end)},'Toggle_FastSpeed')ab.
PatchSliderLoadCallback(ah:Slider({Name='Custom Fast Speed',Default=aa.
GetFastSpeed(),Minimum=16,Maximum=24,DisplayMethod='Value',Precision=1,Callback=
ac.Wrap(function(ai)aa.SetFastSpeed(ai)end)},'Slider_FastSpeed'))ah:Toggle({Name
='Instant Acceleration',Default=aa.IsInstantAccelEnabled(),Callback=ac.Wrap(
function(ai)aa.SetInstantAccelEnabled(ai)end)},'Toggle_InstantAcceleration')ah:
Header{Name='Shortcuts'}ah:Toggle({Name='Right Click Combo (Q+E)',Default=ad.
IsMouseComboEnabled(),Callback=ac.Wrap(function(ai)ad.SetMouseComboEnabled(ai)
end)},'Toggle_MouseCombo')ah:Header{Name='Auto Reset / Suicide'}ah:Toggle({Name=
'Auto Reset on Room (Once/Run)',Default=ae.IsEnabled(),Callback=ac.Wrap(function
(ai)ae.Toggle(ai)end)},'Toggle_AutoResetRoom')ah:Dropdown({Name='Target Rooms',
Options=ae.GetRoomOptions(),Default=ae.GetTargetRooms(),Multi=true,Required=
false,Callback=ac.Wrap(function(ai)ae.SetTargetRooms(ai)end)},
'Dropdown_AutoResetTargetRooms')ab.PatchSliderLoadCallback(ah:Slider({Name=
'Reset Delay (s)',Default=ae.GetDelay(),Minimum=0,Maximum=10,DisplayMethod=
'Value',Precision=1,Callback=ac.Wrap(function(ai)ae.SetDelay(ai)end)},
'Slider_AutoResetDelay'))ah:Button{Name='Reset Character Now',Callback=function(
)ae.ResetNow()end}end end function a.E()local aa,ab,ac,ad,ae=a.load'd',a.load'z'
,a.load'w',a.load'f',a.load'A'return function(af,ag)local ah=ag:Section{Side=
'Left'}ah:Header{Name='Hazard Scanner Controls'}local ai=ag:Section{Side='Right'
}ai:Header{Name='Real-time Hazard Monitor'}local aj,ak,al,am,an,ao=ai:Label{Text
="Detector: <font color='rgb(255,80,80)'>Disabled</font>"},ai:Label{Text=
"Player: <font color='rgb(0,255,170)'>SAFE</font>"},ai:Label{Text=
[[Safe Spot: <font color='rgb(160,160,160)'>None Needed</font>]]},ai:Label{Text=
"Auto Dodge: <font color='rgb(160,160,160)'>Idle</font>"},ai:Label{Text=
"Active Hazards: <font color='rgb(160,160,160)'>0</font>"},ai:Label{Text=
"Last Detected: <font color='rgb(160,160,160)'>None</font>"}local ap=function(ap
,aq,ar)if ap then local as,at=aq and aq.Name or'Unknown Threat',ar and(' ['..ar
..']')or''pcall(function()ak:UpdateName((
[[Player: <font color='rgb(255,50,50)'><b>DANGER</b></font> (%s%s)]]):format(as,
at))end)else pcall(function()ak:UpdateName
"Player: <font color='rgb(0,255,170)'><b>SAFE</b></font>"end)end end ac.
OnPlayerDangerChanged(function(aq,ar,as)ap(aq,ar,as)end)ac.OnSafeSpotChanged(
function(aq,ar,as)if aq and ar then pcall(function()al:UpdateName((
[[Safe Spot: <font color='rgb(0,255,120)'><b>Found (%.1f studs)</b></font>]]):
format(as))end)else pcall(function()al:UpdateName
[[Safe Spot: <font color='rgb(160,160,160)'>None Needed</font>]]end)end end)ac.
OnDodgeStateChanged(function(aq,ar,as)if aq and ar then pcall(function()am:
UpdateName((
[[Auto Dodge: <font color='rgb(0,255,200)'><b>Dodging (%.1f studs)</b></font>]])
:format(as))end)else pcall(function()am:UpdateName
"Auto Dodge: <font color='rgb(160,160,160)'>Idle</font>"end)end end)local aq=
function(aq,ar)aq=aq or ac.GetHazardCount()ar=ar or ac.GetLastHazardInfo()local
as=ac.IsEnabled()local at,au=as and'0, 255, 0'or'255, 80, 80',as and
'Active (Scanning & SelectionBox)'or'Disabled'pcall(function()aj:UpdateName(
"Detector: <font color='rgb("..at..")'>"..au..'</font>')end)local av=aq>0 and
'255, 60, 60'or'0, 255, 0'pcall(function()an:UpdateName(
"Active Hazards: <font color='rgb("..av..")'>"..tostring(aq)..'</font>')end)if
ar then pcall(function()ao:UpdateName((
[[Last Detected: <font color='rgb(255,220,120)'>%s</font> (%s, %d studs)]]):
format(ar.Name,ar.Class,ar.Distance))end)else pcall(function()ao:UpdateName
"Last Detected: <font color='rgb(160,160,160)'>None</font>"end)end end ai:Header
{Name='Specific Skill Inspector'}ai:Toggle({Name='Enable Deep Inspector',Default
=ac.IsInspectEnabled(),Callback=aa.Wrap(function(ar)ac.SetInspectEnabled(ar)end)
},'Toggle_HazardDeepInspector')ai:Input{Name='Target Skill Name',Placeholder=
'e.g. Meteor, Spike, Flame...',AcceptedCharacters='All',Default=ac.
GetInspectTarget(),Callback=aa.Wrap(function(ar)ac.SetInspectTarget(ar)end)}
local ar=ag:Section{Side='Right'}ar:Header{Name='Custom Trajectory Dimensions'}
ae.PatchSliderLoadCallback(ar:Slider({Name='Second Boss Moving Beam (studs)',
Default=ac.GetSecondBossBeamLength(),Minimum=10,Maximum=250,DisplayMethod=
'Value',Precision=0,Callback=aa.Wrap(function(as)ac.SetSecondBossBeamLength(as)
end)},'Slider_HazardSecondBossBeamLength'))ae.PatchSliderLoadCallback(ar:Slider(
{Name='First Boss Big Spike Width (studs)',Default=ac.GetFirstBossBigSpikeWidth(
),Minimum=10,Maximum=60,DisplayMethod='Value',Precision=0,Callback=aa.Wrap(
function(as)ac.SetFirstBossBigSpikeWidth(as)end)},
'Slider_HazardFirstBossBigSpikeWidth'))ae.PatchSliderLoadCallback(ar:Slider({
Name='First Boss Seeking Spike Width (studs)',Default=ac.
GetFirstBossSeekingSpikeWidth(),Minimum=4,Maximum=30,DisplayMethod='Value',
Precision=0,Callback=aa.Wrap(function(as)ac.SetFirstBossSeekingSpikeWidth(as)end
)},'Slider_HazardFirstBossSeekingSpikeWidth'))ae.PatchSliderLoadCallback(ar:
Slider({Name='Second Boss Circle Chain Lifetime (s)',Default=ac.
GetSecondBossCircleDuration(),Minimum=0.5,Maximum=4,DisplayMethod='Value',
Precision=1,Callback=aa.Wrap(function(as)ac.SetSecondBossCircleDuration(as)end)}
,'Slider_HazardSecondBossCircleDuration'))ac.OnHazardChanged(function(as,at)aq(
as,at)end)local as=ah:Toggle({Name='Enable Hazard Scanner',Default=ac.IsEnabled(
),Callback=aa.Wrap(function(as)ac.Toggle(as)aq()end)},
'Toggle_SmartDodgeThreatDetection')ah:Toggle({Name=
'Show Player 2D Hitbox (Ground Visual)',Default=ac.IsPlayerVisualEnabled(),
Callback=aa.Wrap(function(at)ac.SetPlayerVisualEnabled(at)end)},
'Toggle_HazardPlayer2DVisual')ae.PatchSliderLoadCallback(ah:Slider({Name=
'Player 2D Hitbox Radius (studs)',Default=ac.GetPlayerHitboxRadius(),Minimum=0.5
,Maximum=8,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(at)ac.
SetPlayerHitboxRadius(at)end)},'Slider_HazardPlayer2DHitboxRadius'))ah:Toggle({
Name='Show 3D Selection Boxes (Parts)',Default=ac.IsSelectionBoxesEnabled(),
Callback=aa.Wrap(function(at)ac.SetSelectionBoxesEnabled(at)end)},
'Toggle_HazardSelectionBoxes')ah:Toggle({Name=
'Show Lifespan Timer (3D Duration)',Default=ac.IsTimerVisualEnabled(),Callback=
aa.Wrap(function(at)ac.SetTimerVisualEnabled(at)end)},
'Toggle_HazardLifespanTimer')ah:Toggle({Name=
'Show Danger Zones (Ground Visualizer)',Default=ac.IsVisualizerEnabled(),
Callback=aa.Wrap(function(at)ac.SetVisualizerEnabled(at)end)},
'Toggle_HazardGroundVisualizer')ah:Toggle({Name='Show Trajectory Paths (Orange)'
,Default=ac.IsTrajectoryEnabled(),Callback=aa.Wrap(function(at)ac.
SetTrajectoryEnabled(at)end)},'Toggle_HazardTrajectoryVisualizer')ah:Toggle({
Name='Show Safe Spot Marker (Green Visual)',Default=ac.IsSafeSpotVisualEnabled()
,Callback=aa.Wrap(function(at)ac.SetSafeSpotVisualEnabled(at)end)},
'Toggle_HazardSafeSpotVisual')ah:Toggle({Name=
'Show Candidate Points & Rays (Scan Grid)',Default=ac.IsShowCandidates(),
Callback=aa.Wrap(function(at)ac.SetShowCandidates(at)end)},
'Toggle_HazardShowCandidates')ae.PatchSliderLoadCallback(ah:Slider({Name=
'Safe Spot Safety Margin (studs)',Default=ac.GetSafeSpotBuffer(),Minimum=0,
Maximum=6,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(at)ac.
SetSafeSpotBuffer(at)end)},'Slider_HazardSafeSpotBuffer'))local at=ah:Toggle({
Name='Enable Auto Dodge (Move + Snap)',Default=ac.IsAutoDodgeEnabled(),Callback=
aa.Wrap(function(at)ac.SetAutoDodgeEnabled(at)end)},
'Toggle_HazardAutoDodgeEnabled')ah:Header{Name='Sampling Pass Tiers'}ah:Toggle({
Name='Enable Fine Pass (Tier 2 - Max 45s)',Default=ac.IsFinePassEnabled(),
Callback=aa.Wrap(function(au)ac.SetFinePassEnabled(au)end)},
'Toggle_HazardFinePassEnabled')ah:Toggle({Name=
'Enable Emergency Fallback (Tier 3 - Max 55s)',Default=ac.IsFallbackPassEnabled(
),Callback=aa.Wrap(function(au)ac.SetFallbackPassEnabled(au)end)},
'Toggle_HazardFallbackPassEnabled')ab.OnStateChanged(function(au)pcall(function(
)as:UpdateState(au,true)end)pcall(function()at:UpdateState(au,true)end)aq()end)
ae.PatchSliderLoadCallback(ah:Slider({Name='Dodge Snap Distance (studs)',Default
=ac.GetDodgeSnapDistance(),Minimum=0.5,Maximum=5,DisplayMethod='Value',Precision
=1,Callback=aa.Wrap(function(au)ac.SetDodgeSnapDistance(au)end)},
'Slider_HazardDodgeSnapDistance'))ae.PatchSliderLoadCallback(ah:Slider({Name=
'Respawn Invulnerability Time (s)',Default=ad.GetRespawnProtectionDuration(),
Minimum=0.5,Maximum=10,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(
function(au)ad.SetRespawnProtectionDuration(au)end)},
'Slider_HazardRespawnInvulnerabilityTime'))ae.PatchSliderLoadCallback(ah:Slider(
{Name='Trajectory Length (studs)',Default=ac.GetTrajectoryLength(),Minimum=10,
Maximum=150,DisplayMethod='Value',Precision=0,Callback=aa.Wrap(function(au)ac.
SetTrajectoryLength(au)end)},'Slider_HazardTrajectoryLength'))ah:Toggle({Name=
'Log Hazards (Spawns / Despawns)',Default=ac.IsLogHazardsEnabled(),Callback=aa.
Wrap(function(au)ac.SetLogHazards(au)end)},'Toggle_SmartDodgeLogHazards')ah:
Toggle({Name='Log Rejected (Unrenderable)',Default=ac.IsLogFailedEnabled(),
Callback=aa.Wrap(function(au)ac.SetLogFailed(au)end)},
'Toggle_SmartDodgeLogRejected')ae.PatchSliderLoadCallback(ah:Slider({Name=
'Blue Danger Zone Margin (studs)',Default=ac.GetTrajectoryMargin(),Minimum=0,
Maximum=10,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(au)ac.
SetTrajectoryMargin(au)end)},'Slider_HazardTrajectoryMargin'))ah:Button{Name=
'Clear Console',Callback=function()pcall(function()if rconsoleclear then
rconsoleclear()end end)end}aq()end end function a.F()local aa,ab,ac,ad,ae,af,ag,
ah={'Easy','Medium','Hard','Insane','Nightmare'},{'Desert Temple',
'Winter Outpost','Pirate Island',"King's Castle",'The Underworld',
'Samurai Palace','The Canals','Ghastly Harbor','Steampunk Sewers',
'Orbital Outpost','Volcanic Chambers','Aquatic Temple','Enchanted Forest',
'Egg Island','Krampus','Tutorial Dungeon'},{['Egg Island']={Difficulties={'Easy'
,'Nightmare'},LevelReq=0},Krampus={Difficulties={'Nightmare'},LevelReq=195},[
'Tutorial Dungeon']={Difficulties={'Easy'},LevelReq=0}},{},{},game:GetService
'HttpService','Maclib/DungeonQuest_MapList.json'local ai,aj,ak,al=function(ai)if
not(isfile and writefile and makefolder and isfolder)then return end pcall(
function()if not isfolder'Maclib'then makefolder'Maclib'end end)pcall(function()
writefile(ag,af:JSONEncode(ai))end)end,function()if not(isfile and readfile)or
not isfile(ag)then return nil end local ai,aj=pcall(function()return af:
JSONDecode(readfile(ag))end)if not ai or typeof(aj)~='table'then return nil end
local ak={}for al,am in ipairs(aj)do if type(am)=='string'and#am>0 then table.
insert(ak,am)end end return(#ak>0)and ak or nil end,function(ai)local aj,ak={},{
}for al,am in ipairs(ai or{})do if not aj[am]then aj[am]=true table.insert(ak,am
)end end for al,am in ipairs(ab)do if not aj[am]then aj[am]=true table.insert(ak
,am)end end return ak end,function()local ai=game:GetService'Players'.
LocalPlayer if not ai then return nil end local aj=ai:FindFirstChild'PlayerGui'
if not aj then return nil end local ak=aj:FindFirstChild'queueGui'if not ak then
return nil end local al=ak:FindFirstChild'chooseDungeon'if not al then return
nil end local am=al:FindFirstChild'backgroundFillLeft'if not am then return nil
end return am:FindFirstChild'ScrollingFrame'end local am=function()local am=al()
if not am then return nil end local an={}for ao,ap in ipairs(am:GetChildren())do
if ap:IsA'ImageLabel'and#ap.Name>0 then table.insert(an,ap.Name)end end return(#
an>0)and an or nil end function ad.GetDungeons()if ah then return ah end local
an=am()if an then local ao=ak(an)ah=ao ai(ao)return ao end local ao=aj()if ao
then local ap=ak(ao)ah=ap return ap end return ab end function ad.
RefreshDungeons()ah=nil return ad.GetDungeons()end function ad.GetDungeonStats(
an)if type(an)~='string'or#an==0 then return nil end if ae[an]~=nil then return
ae[an]end local ao=game:GetService'ReplicatedStorage':FindFirstChild'remotes'
local ap=ao and ao:FindFirstChild'getDungeonStats'if not ap then return nil end
local aq,ar=pcall(function()return ap:InvokeServer(an)end)if aq and typeof(ar)==
'table'then ae[an]=ar return ar end return nil end function ad.
GetAllowedDifficulties(an)if type(an)~='string'then return aa end local ao=ac[an
]if ao then return ao.Difficulties end local ap,aq=ad.GetDungeonStats(an),{}if
ap then for ar,as in ipairs(aa)do if ap[as]then table.insert(aq,as)end end end
if#aq>0 then return aq end return aa end function ad.IsDifficultyAllowed(an,ao)
if type(ao)~='string'then return false end for ap,aq in ipairs(ad.
GetAllowedDifficulties(an))do if aq==ao then return true end end return false
end function ad.GetLevelReq(an,ao)if type(an)~='string'then return 0 end local
ap=ac[an]if ap then return ap.LevelReq or 0 end local aq=ad.GetDungeonStats(an)
if aq and type(ao)=='string'and aq[ao]then return tonumber(aq[ao].levelReq)or 0
end return 0 end ad.DUNGEONS=ab ad.DIFFICULTIES=aa return ad end function a.G()
local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'd',a.load'y',a.load'z',a.load'p',a.load
'F',a.load'f',a.load'e',a.load'A',a.load'b'local aj=ag.RunService return
function(ak,al)local am=al:Section{Side='Left'}am:Header{Name='Auto Farm'}local
an=am:Toggle({Name='Enable Auto Farm',Default=ab.IsEnabled(),Callback=aa.Wrap(
function(an)ab.Toggle(an)end)},'Toggle_AutoFarm')ah.PatchSliderLoadCallback(am:
Slider({Name='Rescan Interval (s)',Default=ab.GetScanInterval(),Minimum=0.5,
Maximum=5,Precision=1,Callback=aa.Wrap(function(ao)ab.SetScanInterval(ao)end)},
'Slider_AF_ScanInterval'))am:Toggle({Name='Auto Face Target (Look At Enemy)',
Default=ab.IsAutoFaceTargetEnabled(),Callback=aa.Wrap(function(ao)ab.
SetAutoFaceTarget(ao)end)},'Toggle_AF_AutoFaceTarget')ah.
PatchSliderLoadCallback(am:Slider({Name='Repath Distance (studs)',Default=ab.
GetRepathDistance(),Minimum=2,Maximum=20,DisplayMethod='Value',Precision=1,
Callback=aa.Wrap(function(ao)ab.SetRepathDistance(ao)end)},
'Slider_AF_RepathDistance'))am:Toggle({Name=
'Auto Jump When Stuck (Low Velocity)',Default=ab.IsAutoJumpOnStuckEnabled(),
Callback=aa.Wrap(function(ao)ab.SetAutoJumpOnStuck(ao)end)},
'Toggle_AF_AutoJumpOnStuck')ah.PatchSliderLoadCallback(am:Slider({Name=
'Stuck Velocity Threshold (studs/s)',Default=ab.GetStuckVelocityThreshold(),
Minimum=2,Maximum=20,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function
(ao)ab.SetStuckVelocityThreshold(ao)end)},'Slider_AF_StuckVelocity'))am:Header{
Name='Auto Skill (Smart Buff & Damage)'}local ao=am:Toggle({Name=
'Enable Auto Skill (Smart Q + E)',Default=ab.IsAutoSkillEnabled(),Callback=aa.
Wrap(function(ao)ab.SetAutoSkillEnabled(ao)end)},'Toggle_AF_AutoSkill')ac.
OnStateChanged(function(ap)pcall(function()an:UpdateState(ap,true)end)pcall(
function()ao:UpdateState(ap,true)end)end)ah.PatchSliderLoadCallback(am:Slider({
Name='Skill E Cast Range (studs)',Default=ab.GetSkillERange(),Minimum=5,Maximum=
150,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(ap)ab.
SetSkillERange(ap)end)},'Slider_AF_SkillERange'))ah.PatchSliderLoadCallback(am:
Slider({Name='Skill Q Buff Duration (s)',Default=ab.GetBuffDuration(),Minimum=1,
Maximum=20,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(ap)ab.
SetBuffDuration(ap)end)},'Slider_AF_BuffDuration'))ah.PatchSliderLoadCallback(am
:Slider({Name='Skill Spam Interval (s)',Default=ab.GetSkillSpamInterval(),
Minimum=0.05,Maximum=1,DisplayMethod='Value',Precision=2,Callback=aa.Wrap(
function(ap)ab.SetSkillSpamInterval(ap)end)},'Slider_AF_SkillSpamInterval'))am:
Header{Name='Visual Debug'}am:Toggle({Name='Show Blocker Ray (Red/Green)',
Default=ab.IsBlockerRayVisualEnabled(),Callback=aa.Wrap(function(ap)ab.
SetBlockerRayVisual(ap)end)},'Toggle_AF_BlockerRay')am:Toggle({Name=
'Show Planned Path (Green)',Default=ab.IsPlannedPathVisualEnabled(),Callback=aa.
Wrap(function(ap)ab.SetPlannedPathVisual(ap)end)},'Toggle_AF_PlannedPath')am:
Toggle({Name='Show Actual Destination (Cyan)',Default=ab.
IsActualPathVisualEnabled(),Callback=aa.Wrap(function(ap)ab.SetActualPathVisual(
ap)end)},'Toggle_AF_ActualPath')am:Toggle({Name=
'Show Target Indicator (Red/Glow)',Default=ab.IsTargetVisualEnabled(),Callback=
aa.Wrap(function(ap)ab.SetTargetVisual(ap)end)},'Toggle_AF_TargetVisual')am:
Toggle({Name='Show Combat Range Circles (Min/Max)',Default=ab.
IsCombatRangeVisualEnabled(),Callback=aa.Wrap(function(ap)ab.
SetCombatRangeVisual(ap)end)},'Toggle_AF_CombatRangeVisual')local ap=al:Section{
Side='Right'}ap:Header{Name='Auto Farm Monitor'}local aq,ar,as,at,au,av,ax,ay=ap
:Label{Text="State: <font color='rgb(160,160,160)'>NO_TARGET</font>"},ap:Label{
Text="Target: <font color='rgb(160,160,160)'>None</font>"},ap:Label{Text=
"Distance: <font color='rgb(160,160,160)'>-</font>"},ap:Label{Text=
"Velocity: <font color='rgb(160,160,160)'>0.0 studs/s</font>"},ap:Label{Text=
"Blocker Detection: <font color='rgb(160,160,160)'>-</font>"},ap:Label{Text=
[[Destination Mode: <font color='rgb(160,160,160)'>None</font>]]},(ap:Label{Text
="Path Nodes: <font color='rgb(160,160,160)'>0</font>"})local az,aA=function()
local az,aA=ab.GetDebugInfo(),'160,160,160'if az.state=='CHASE'then aA=
'0,255,120'elseif az.state=='HOLD'then aA='255,200,0'elseif az.state=='BLOCKED'
then aA='255,60,60'elseif az.state=='REPATHING'or az.state=='ACQUIRING_TARGET'or
az.state=='TRACKING_TARGET'then aA='0,200,255'end pcall(function()aq:UpdateName(
("State: <font color='rgb(%s)'>%s</font>"):format(aA,az.state))end)pcall(
function()if az.hasTarget then ar:UpdateName((
"Target: <font color='rgb(255,220,120)'>%s</font>"):format(az.enemyName))as:
UpdateName((
[[Distance: <font color='rgb(0,255,255)'>%.1f studs (flat %.1f)</font>]]):
format(az.enemyDist,az.enemyFlat))else ar:UpdateName
"Target: <font color='rgb(160,160,160)'>None</font>"as:UpdateName
"Distance: <font color='rgb(160,160,160)'>-</font>"end end)pcall(function()local
aB=az.velocity or 0 local aC=aB>=12 and'0,255,120'or(aB>=10 and'255,200,0'or
'255,80,80')at:UpdateName(("Velocity: <font color='rgb(%s)'>%.1f studs/s</font>"
):format(aC,aB))end)pcall(function()if az.hasTarget and az.blocker then if az.
blocker.directBlocked then au:UpdateName((
[[Blocker: <font color='rgb(255,60,60)'>BLOCKED by '%s' (%.1fm)</font>]]):
format(az.blocker.blockerName,az.blocker.blockerDist))else au:UpdateName
[[Blocker: <font color='rgb(0,255,120)'>CLEAR (Direct Line to Target)</font>]]
end else au:UpdateName"Blocker: <font color='rgb(160,160,160)'>None</font>"end
end)pcall(function()local aB=az.destMode if az.nodeIndex then aB=(
'%s (Node #%d)'):format(az.destMode,az.nodeIndex)end local aC=az.destMode==
'Direct'and'0,255,255'or(az.destMode=='Waypoint'and'255,200,0'or(az.destMode==
'Hold'and'255,200,0'or'255,80,80'))av:UpdateName((
"Destination Mode: <font color='rgb(%s)'>%s</font>"):format(aC,aB))end)pcall(
function()ax:UpdateName((
[[Path Nodes: <font color='rgb(160,255,160)'>%d waypoints</font>]]):format(az.
waypointCount))end)end,0 ay=aj.Heartbeat:Connect(function()local aB=os.clock()if
aB-aA>=0.25 then aA=aB az()end end)ai.Register(function()if ay then ay:
Disconnect()ay=nil end end)local aB=al:Section{Side='Right'}aB:Header{Name=
'Contextual Combat Distance'}local aC,aF=aB:Label{Text='Active: -'},ae.
GetDungeons()local aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ=af.GetCurrentDungeonName()or
aF[1]or'Desert Temple','Mob',false,function()local aG,aH=af.
GetCurrentDungeonName(),af.GetCombatTargetKey()local aI,aJ=ad.
GetCombatDistances(aG,aH)local aK,aL,aM,aN=aG and(
"<font color='rgb(0,255,255)'>"..aG..'</font>')or
"<font color='rgb(160,160,160)'>Lobby</font>","<font color='rgb(255,200,0)'>"..
ad.GetTargetDisplay(aH)..'</font>',(
"<font color='rgb(120,255,120)'>%.0f - %.0f studs</font>"):format(aI,aJ),''if aH
~='Mob'then local aO,aP=ad.GetBossArea(aG,aH)local aQ=aO and(
"<font color='rgb(0,255,255)'>Area: %.0f studs</font>"):format(aP)or
"<font color='rgb(160,160,160)'>Area: Off</font>"aN=' | '..aQ end local aO,aP=ad
.GetDisableDodge(aG,aH),ad.GetEnableHazardScanner(aG,aH)if aO then aN=aN..
" | <font color='rgb(255,100,100)'>No Dodge</font>"end if not aP or aO then aN=
aN.." | <font color='rgb(255,160,50)'>No Scanner</font>"end pcall(function()aC:
UpdateName(('Active: %s | Target: %s (%s%s)'):format(aK,aL,aM,aN))end)end local
aS=function()aI=true local aS,aT=ad.GetCombatDistances(aG,aH)if aK then pcall(
function()aK:UpdateValue(aS)end)end if aL then pcall(function()aL:UpdateValue(aT
)end)end if aM then pcall(function()aM:UpdateState(ad.GetDisableDodge(aG,aH),
true)end)end if aN then pcall(function()aN:UpdateState(ad.
GetEnableHazardScanner(aG,aH),true)end)end if aH=='Mob'then if aO then pcall(
function()aO:UpdateState(false,true)end)end if aP then pcall(function()aP:
UpdateValue(80)end)end else local aU,aV=ad.GetBossArea(aG,aH)if aO then pcall(
function()aO:UpdateState(aU,true)end)end if aP then pcall(function()aP:
UpdateValue(aV)end)end end if aQ then pcall(function()local aU=aH=='Mob'and
" <font color='rgb(160,160,160)'>(Boss Area N/A)</font>"or''aQ:UpdateName((
[[Editing: <font color='rgb(0,255,255)'>%s</font> / <font color='rgb(255,200,0)'>%s</font>%s]]
):format(aG,ad.GetTargetDisplay(aH),aU))end)end aI=false aJ()end local aT,aU=aB:
Dropdown{Name='Select Dungeon',Options=aF,Default=aG,Required=true,Callback=
function(aT)if type(aT)=='string'and#aT>0 then aG=aT aS()end end},aB:Dropdown{
Name='Select Target',Options=ad.GetTargetOptions(),Default='Normal',Required=
true,Callback=function(aT)aH=ad.GetTargetKey(aT)aS()end}aQ=aB:Label{Text=''}
local aV,aW=ad.GetCombatDistances(aG,aH)aK=ah.PatchSliderLoadCallback(aB:Slider{
Name='Min Combat Distance (studs)',Default=aV,Minimum=2,Maximum=150,
DisplayMethod='Value',Precision=1,Callback=function(aX)if aI then return end ad.
SetMinCombatDistance(aG,aH,aX)aJ()end})aL=ah.PatchSliderLoadCallback(aB:Slider{
Name='Max Combat Distance (studs)',Default=aW,Minimum=5,Maximum=200,
DisplayMethod='Value',Precision=1,Callback=function(aX)if aI then return end ad.
SetMaxCombatDistance(aG,aH,aX)aJ()end})local aX,aY=ad.GetDisableDodge(aG,aH),ad.
GetEnableHazardScanner(aG,aH)aM=aB:Toggle{Name='Disable Dodge on Target',Default
=aX,Callback=function(aZ)if aI then return end ad.SetDisableDodge(aG,aH,aZ)aJ()
end}aN=aB:Toggle{Name='Enable Hazard Scanner on Target',Default=aY,Callback=
function(aZ)if aI then return end ad.SetEnableHazardScanner(aG,aH,aZ)aJ()end}aB:
Header{Name='Boss Area Constraint (Boss Only)'}local aZ,a_=ad.GetBossArea(aG,aH)
aO=aB:Toggle{Name='Enable Boss Area Constraint',Default=aZ,Callback=function(a0)
if aI then return end if aH=='Mob'then if aO then pcall(function()aO:
UpdateState(false)end)end return end ad.SetBossAreaEnabled(aG,aH,a0)aJ()end}aP=
ah.PatchSliderLoadCallback(aB:Slider{Name='Boss Area Radius (studs)',Default=a_,
Minimum=10,Maximum=300,DisplayMethod='Value',Precision=1,Callback=function(a0)if
aI then return end if aH=='Mob'then return end ad.SetBossAreaRadius(aG,aH,a0)aJ(
)end})aB:Button{Name='Reset Target to Default',Callback=function()ad.
ResetTarget(aG,aH)aS()end}aB:Button{Name='Reset Dungeon to Default',Callback=
function()ad.ResetDungeon(aG)aS()end}local a0,a1,a2,a3=af.OnDungeonNameChanged(
function(a0)if a0 and type(a0)=='string'and#a0>0 then aG=a0 pcall(function()aT:
UpdateSelection(a0)end)end aS()end),af.OnBossActiveChanged(function()aJ()end),af
.OnBossIndexChanged(function()aJ()end),ad.OnDataChanged(function()aS()end)ai.
Register(function()pcall(a0)pcall(a1)pcall(a2)pcall(a3)end)aS()end end function
a.H()local aa,ab,ac,ad,ae=a.load'd',a.load'z',a.load'D',a.load'E',a.load'G'
return function(af,ag)local ah=ag:Section{Side='Left'}ah:Header{Name=
'Combat Master'}local ai=ah:Toggle({Name='Enable Combat Master',Default=ab.
IsEnabled(),Callback=aa.Wrap(function(ai)ab.Toggle(ai)end)},
'Toggle_CombatMaster')ah:Toggle({Name='Auto Boss Combat (Skip Boss Macro)',
Default=ab.IsAutoBossCombatEnabled(),Callback=aa.Wrap(function(aj)ab.
SetAutoBossCombat(aj)end)},'Toggle_AutoBossCombat')ab.OnStateChanged(function(aj
)pcall(function()ai:UpdateState(aj,true)end)end)ac(af,ag)ad(af,ag)ae(af,ag)end
end function a.I()local aa,ab,ac,ad,ae=a.load'e',a.load'c',a.load'F',a.load'f',a
.load'b'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq=aa.player.Name,false,false,
false,'Desert Temple','Easy',false,true,false,3,{[77649408247578]=true,[
3220968688]=true,[2414851778]=true},{}local ar,as,at=function()return ap[game.
PlaceId]==true end,function()for ar,as in ipairs(aq)do pcall(as,aj,ac.
GetAllowedDifficulties(aj))end end,function()if ah then return end ah=true ai=
false task.spawn(function()local ar,as=pcall(function()local ar=game:GetService
'ReplicatedStorage':WaitForChild('remotes',15)if not ar then error
'remotes not found'end local as=ac.GetLevelReq(aj,ak)pcall(function()ar:
WaitForChild('createLobby',10):InvokeServer(aj,ak,as,al,am,an)end)if ai then
return end task.wait(ao)if ai then return end if am then pcall(function()ar:
WaitForChild('addPlayerToWhitelist',10):FireServer(af)end)if ai then return end
task.wait(ao)if ai then return end end local at=0 while at<10 do local au=
workspace:FindFirstChild'games'and workspace.games:FindFirstChild'inLobby'if au
then break end task.wait(0.5)at=at+0.5 if ai then return end end if ai then
return end task.wait(ao)if ai then return end pcall(function()ar:WaitForChild(
'startDungeon',10):FireServer()end)end)ah=false if ai then return end if ar then
ab.Notify('Auto Join','Joined: '..aj,3)else ab.Notify('Auto Join',
'Join failed: '..tostring(as),4)end end)end local au,av=function()while ae.
IsActive()do task.wait(0.5)if ag and not ah and ar()and ad.IsInLobby()then at()
end end end,{}function av.Toggle(ax)ag=ax if ag then ab.Notify('Auto Join',
'Enabled',2)else ai=true ab.Notify('Auto Join','Stopped',2)end end function av.
SetDungeon(ax)if type(ax)~='string'or#ax==0 then return end aj=ax if not ac.
IsDifficultyAllowed(aj,ak)then local ay=ac.GetAllowedDifficulties(aj)if#ay>0
then ak=ay[1]end end as()end function av.SetDifficulty(ax)if type(ax)~='string'
then return end if ac.IsDifficultyAllowed(aj,ax)then ak=ax end end function av.
SetHardcore(ax)al=ax end function av.SetPrivate(ax)am=ax end function av.
SetWaveDefence(ax)an=ax end function av.SetDelay(ax)ao=ax end function av.
GetSelectedDungeon()return aj end function av.GetSelectedDifficulty()return ak
end function av.GetAllowedDifficulties()return ac.GetAllowedDifficulties(aj)end
function av.OnDungeonChanged(ax)if type(ax)=='function'then table.insert(aq,ax)
end end av.JoinNow=function()task.spawn(function()at()end)end task.spawn(au)ae.
Register(function()av.Toggle(false)end)return av end function a.J()local aa,ab,
ac,ad,ae,af,ag,ah=a.load'f',a.load'c',{[77649408247578]=true,[115445507767090]=
true},false,false,false,3,
[[game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("changeStartValue"):FireServer()]]
local ai,aj,ak=function()return not ac[game.PlaceId]end,pcall(loadstring,ah)if
aj and type(ak)=='function'then autoStartCommandFn=ak end local al,am={},{}
function al.OnStart(an)if type(an)~='function'then return function()end end
table.insert(am,an)return function()for ao,ap in ipairs(am)do if ap==an then
table.remove(am,ao)break end end end end function al.Start()if ae then return
end ae=true af=false task.spawn(function()while ad do local an,ao=pcall(ai)local
ap=an and ao==true if ap and not af then af=true local aq=0 while aq<ag and ad
do task.wait(0.1)aq=aq+0.1 end if not ad then af=false break end if
autoStartCommandFn then local ar,as=pcall(autoStartCommandFn)if ar then ab.
Notify('Auto Start','Game started!',3)for at=#am,1,-1 do pcall(am[at])end else
ab.Notify('Auto Start','Trigger failed: '..tostring(as),3)end else ab.Notify(
'Auto Start','Remote command invalid',3)end end if not ad then break end task.
wait(1)end ae=false end)end function al.Stop()ad=false end function al.SetDelay(
an)ag=tonumber(an)or 3 end function al.GetDelay()return ag end function al.
Toggle(an)ad=an if an then al.Start()else al.Stop()end end return al end
function a.K()local aa={[77649408247578]=true,[115445507767090]=true}local ab,ac
,ad,ae,af=function()return aa[game.PlaceId]==true end,false,game:GetService
'VirtualInputManager',game:GetService'GuiService',function()local ab=game:
GetService'Players'.LocalPlayer if not ab then return nil end local ac=ab:
FindFirstChild'PlayerGui'if not ac then return nil end local ad=ac:
FindFirstChild'introGui'if not ad or not ad:IsA'ScreenGui'or not ad.Enabled then
return nil end local ae=ad:FindFirstChild'title'if not ae then return nil end
local af=ae:FindFirstChild'Frame'if not af then return nil end local ag=af:
FindFirstChild'TextButton'if not ag or not ag:IsA'TextButton'or not ag.Visible
then return nil end local ah=''if ag.Text and type(ag.Text)=='string'then ah=ag.
Text end if not string.find(string.lower(ah),'play')then return nil end return
ag end local ag=function(ag)pcall(function()ae.SelectedObject=ag end)task.wait(
0.1)ad:SendKeyEvent(true,Enum.KeyCode.Return,false,game)task.wait()ad:
SendKeyEvent(false,Enum.KeyCode.Return,false,game)task.wait(0.1)pcall(function()
ae.SelectedObject=nil end)end local ah,ai=function()task.spawn(function()local
ah=false while ac do if not ab()then task.wait(1)continue end local ai=af()if ai
then ag(ai)ah=true elseif ah then print'[AutoStartLobby] Pressed Start'break end
if not ac then break end task.wait(0.2)end end)end,{}function ai.Toggle(aj)ac=aj
if ac then ah()end end return ai end function a.L()local aa,ab=a.load'e',a.load
'c'local ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao=aa.player,2,false,false,false,
false,60,false,
'\r\nlocal ReplayDungeon = game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("replayDungeon")\r\n\r\nlocal payload = {}\r\nlocal function collectValue(name)\r\n\tlocal value = workspace:FindFirstChild(name)\r\n\tif value and value:IsA("ValueBase") then\r\n\t\tpayload[name] = value.Value\r\n\tend\r\nend\r\n\r\ncollectValue("dungeonName")\r\ncollectValue("dungeonProgress")\r\ncollectValue("dungeonStarted")\r\n\r\nlocal hardcore = workspace:FindFirstChild("hardcore")\r\nif hardcore and hardcore:IsA("BoolValue") then\r\n\tpayload.hardcore = hardcore.Value\r\n\tpayload.isHardcore = hardcore.Value\r\nend\r\n\r\nlocal dungeon = workspace:FindFirstChild("dungeon")\r\nif dungeon then\r\n\tfor _, value in ipairs(dungeon:GetChildren()) do\r\n\t\tif value:IsA("ValueBase") then payload[value.Name] = value.Value end\r\n\tend\r\n\tlocal bossRoom = dungeon:FindFirstChild("bossRoom")\r\n\tif bossRoom then\r\n\t\tfor _, value in ipairs(bossRoom:GetChildren()) do\r\n\t\t\tif value:IsA("ValueBase") then payload[value.Name] = value.Value end\r\n\t\tend\r\n\tend\r\nend\r\n\r\nif not payload.dungeonName then return end\r\nReplayDungeon:FireServer(payload)\r\n'
,[[game:GetService("Players").LocalPlayer.PlayerGui.rewardGuiHolder.holder]],
function(ac)local ad,ae=pcall(loadstring,'return '..ac)if ad and type(ae)==
'function'then return ae end return nil end local ap,aq=pcall(loadstring,ak)if
ap and type(aq)=='function'then an=aq end ao=am(al)if not ao then ao=function()
return ac:FindFirstChild'PlayerGui'and ac.PlayerGui:FindFirstChild
'rewardGuiHolder'and ac.PlayerGui.rewardGuiHolder:FindFirstChild'holder'end end
local ar,as,at=function()local ar,as=pcall(function()local ar=ac:FindFirstChild
'PlayerGui'local as=ar and ar:FindFirstChild'timeLeftGui'local at=as and as:
FindFirstChild'Frame'return at and at:FindFirstChild'time'end)if not ar or
typeof(as)~='Instance'then return nil end local at if as:IsA'ValueBase'then at=
as.Value else at=as.Text end if type(at)=='number'then return at end if type(at)
=='string'then local au=at:gsub('%s+',''):gsub('^%[',''):gsub('%]$','')local av,
ax=au:match'^(%d+):(%d+)$'if av and ax then return tonumber(av)*60+tonumber(ax)
end local ay=tonumber(au)if ay then return ay end end return nil end,{},function
()if not an then ab.Notify('Auto Retry','Remote command invalid',3)return false
end local ar,as=pcall(an)if ar then ab.Notify('Auto Retry','Retrying dungeon!',3
)return true end ab.Notify('Auto Retry','Trigger failed: '..tostring(as),3)
return false end function as.Start()if af then return end af=true ag=false aj=
false task.spawn(function()while ae or ah do if ae then local au=0 if ao then
local av,ax=pcall(ao)if av and typeof(ax)=='Instance'and ax.Parent then au=#ax:
GetChildren()end end if au>=ad and not ag then ag=true at()elseif au<ad then ag=
false end end if ah then local au=ar()if au and au<ai and not aj then aj=true
at()elseif au and au>=ai then aj=false end end if not ae and not ah then break
end task.wait(0.75)end af=false end)end function as.Stop()ae=false end function
as.Toggle(au)ae=au if au then aj=false as.Start()ab.Notify('Auto Retry',
'Watching reward holder...',2)else as.Stop()ab.Notify('Auto Retry','Stopped',2)
end end function as.SetTimeRetryEnabled(au)ah=au==true if ah then aj=false as.
Start()ab.Notify('Auto Retry','Watching time left...',2)else ab.Notify(
'Auto Retry','Time retry stopped',2)end end function as.GetTimeRetryEnabled()
return ah end function as.SetTimeRetryThreshold(au)ai=au end function as.
GetTimeRetryThreshold()return ai end function as.GetTimeLeft()return ar()end
function as.RetryNow()task.spawn(function()at()end)end return as end function a.
M()local aa,ab,ac,ad,ae,af,ag=a.load'A',a.load'I',a.load'J',a.load'K',a.load'L',
a.load'd',a.load'F'return function(ah,ai)local aj,ak,al=ai:Section{Side='Left'},
ai:Section{Side='Right'},function(aj,ak)for al,am in ipairs(aj)do if am==ak then
return al end end return nil end aj:Header{Name='Auto Join Dungeon'}ak:Header{
Name='Dungeon Run Automation'}aj:Toggle({Name='Auto Join Dungeon',Default=false,
Callback=af.Wrap(function(am)ab.Toggle(am)end)},'Toggle_AutoJoin')local am=ag.
GetDungeons()local an=aa.PatchDropdownRestore(aj:Dropdown({Name='Dungeon',
Options=am,Default=al(am,ab.GetSelectedDungeon())or 1,Required=true,Callback=af.
Wrap(function(an)ab.SetDungeon(an)end)},'Dropdown_Dungeon'),true)aj:Button{Name=
'Refresh Map List',Callback=function()task.spawn(function()local ao=ag.
RefreshDungeons()if not ao or#ao==0 then return end pcall(function()an:
ClearOptions()an:InsertOptions(ao)end)local ap=ab.GetSelectedDungeon()if not
table.find(ao,ap)then ab.SetDungeon(ao[1])end pcall(function()an:
UpdateSelection(ab.GetSelectedDungeon())end)end)end}local ao=aj:Label({Text=
'Recommended Level: ...'},'Label_RecommendedLevel')local ap=function()pcall(
function()local ap=ag.GetLevelReq(ab.GetSelectedDungeon(),ab.
GetSelectedDifficulty())ao:UpdateName('Recommended Level: '..tostring(ap))end)
end ap()local aq=ab.GetAllowedDifficulties()local ar=aa.PatchDropdownRestore(aj:
Dropdown({Name='Difficulty',Options=aq,Default=al(aq,ab.GetSelectedDifficulty())
or 1,Required=true,Callback=af.Wrap(function(ar)ab.SetDifficulty(ar)ap()end)},
'Dropdown_Difficulty'),true)aj:Toggle({Name='Hardcore',Default=false,Callback=af
.Wrap(function(as)ab.SetHardcore(as)end)},'Toggle_HardcoreAJ')aj:Toggle({Name=
'Private Room',Default=true,Callback=af.Wrap(function(as)ab.SetPrivate(as)end)},
'Toggle_PrivateAJ')aj:Toggle({Name='Wave Defence',Default=false,Callback=af.
Wrap(function(as)ab.SetWaveDefence(as)end)},'Toggle_WaveDefenceAJ')aa.
PatchSliderLoadCallback(aj:Slider({Name='Join Delay (s)',Default=3,Minimum=0,
Maximum=15,DisplayMethod='Value',Precision=1,Callback=af.Wrap(function(as)ab.
SetDelay(as)end)},'Slider_JoinDelay'))aj:Button{Name='Join Now',Callback=
function()ab.JoinNow()end}ak:Toggle({Name='Auto Start',Default=false,Callback=af
.Wrap(function(as)ac.Toggle(as)end)},'Toggle_AutoStart')aa.
PatchSliderLoadCallback(ak:Slider({Name='Start Delay (s)',Default=ac.GetDelay(),
Minimum=0,Maximum=15,DisplayMethod='Value',Precision=1,Callback=af.Wrap(function
(as)ac.SetDelay(as)end)},'Slider_AutoStartDelay'))ak:Toggle({Name=
'Auto Start Lobby',Default=false,Callback=af.Wrap(function(as)ad.Toggle(as)end)}
,'Toggle_AutoStartLobby')ak:Toggle({Name='Auto Retry',Default=false,Callback=af.
Wrap(function(as)ae.Toggle(as)end)},'Toggle_AutoRetry')ak:Button{Name=
'Manual Retry',Callback=function()task.spawn(function()ae.RetryNow()end)end}ak:
Toggle({Name='Retry on Time Low',Default=ae.GetTimeRetryEnabled(),Callback=af.
Wrap(function(as)ae.SetTimeRetryEnabled(as)end)},'Toggle_RetryTimeLow')aa.
PatchSliderLoadCallback(ak:Slider({Name='Retry Time Threshold (s)',Default=ae.
GetTimeRetryThreshold(),Minimum=5,Maximum=120,DisplayMethod='Value',Precision=1,
Callback=af.Wrap(function(as)ae.SetTimeRetryThreshold(as)end)},
'Slider_RetryTimeThreshold'))ab.OnDungeonChanged(function(as,at)pcall(function()
ar:ClearOptions()ar:InsertOptions(at)ar:UpdateSelection(ab.
GetSelectedDifficulty())end)ap()end)end end function a.N()local aa,ab,ac,ad,ae,
af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as=a.load'b',a.load'c',a.load'f',{[
77649408247578]=true,[115445507767090]=true},{},false,false,true,{},{},{},'None'
,false,{weapons='Weapons',helmets='Helmets',chests='Chests',abilities=
'Abilities'},{'Common','Uncommon','Rare','Epic','Legendary','Mythic'},{'1','5',
'10','15','20','25','30','35','40','45','50','55','60','65','70','75','80','85',
'90','95','100','105','110','115','120','125','130','135','140','145','150',
'155','160','165','170','175','180','185','190','195','200','205','210','215',
'220','225','230','235','240','245','250','255','260','265','270','275','280',
'285','290','295','300'},{'None','Below','Above'},{Common=0,Uncommon=1,Rare=2,
Epic=3,Legendary=4,Mythic=5},{}for at,au in ipairs(ao)do as[au]=true end local
at={}for au,av in ipairs(ao)do at[string.lower(av)]=av end local au,av=function(
au)if type(au)~='string'then return nil end return at[string.lower(au)]end,
function(au)local av pcall(function()av=game:GetService'ReplicatedStorage':
WaitForChild('remotes',5):WaitForChild('sellItemEvent',5)end)if not av then
return false,0 end local ax={}for ay,az in pairs(au)do if type(az)=='table'and#
az>0 then ax[ay]=az end end if next(ax)==nil then return false,0 end local ay=
pcall(function()av:FireServer(ax)end)if not ay then return false,0 end return
true,0 end local ax=av function ae.SetSellAction(ay)if type(ay)=='function'then
ax=ay end end local ay=function()local ay,az=pcall(function()return game:
GetService'ReplicatedStorage':WaitForChild('remotes',5):WaitForChild(
'reloadInvy',5)end)if not ay or not az then return nil,
'Could not find remote reloadInvy'end local aA,aB=pcall(function()return az:
InvokeServer()end)if not aA or aB==nil then return nil,
'Could not read inventory'end local aC,aF,aG,aH={},{},function(aC)return aC.
sellPrice~=nil or aC.UniqueItemID~=nil or aC.rarity~=nil end,function(aC)local
aF=tostring(aC)local aG=tonumber(aF:match'_(%d+)$')if not aG then return nil,nil
end local aH=aF:match'^(.-)_%d+$'return aH,aG end local aI=function(aI,aJ,aK,aL)
local aM=false if type(aI.equipped)=='boolean'then aM=aI.equipped elseif type(aI
.equipped)=='table'then for aN,aO in pairs(aI.equipped)do if aO==true then aM=
true break end end end local aN=au(aI.rarity)or'Common'table.insert(aC,{Type=an[
aJ]or aJ or'Unknown',Category=aK or aJ,Index=aL,Name=tostring(aI.name or aI.
UniqueItemID or'?'),Rarity=aN,RarityValue=ar[aN],SellPrice=tonumber(aI.sellPrice
)or 0,UniqueItemID=aI.UniqueItemID,Equipped=aM,LevelReq=tonumber(aI.levelReq)or
0,Raw=aI})end local function aJ(aK,aL,aM,aN)if type(aK)~='table'then return end
if aF[aK]then return end aF[aK]=true if aG(aK)then aI(aK,aL,aM,aN)return end for
aO,aP in pairs(aK)do if an[aO]then aJ(aP,aO,nil,nil)elseif type(aP)=='table'and
aG(aP)then local aQ,aS=aH(aO)aJ(aP,aL,aQ,aS)else aJ(aP,aL,aM,aN)end end end aJ(
aB,nil,nil,nil)return aC end function ae.ShouldSellItem(az)if not az then return
false end if ah and az.Equipped then return false end if next(ai)and as[az.
Rarity]and not ai[az.Rarity]then return false end if next(aj)and az.Type and not
aj[az.Type]then return false end local aA,aB=ak,al if next(aA)==nil then aA={[1]
=true}aB='None'end local aC=az.LevelReq or 0 if aB=='Below'then local aF for aG
in pairs(aA)do if not aF or aG>aF then aF=aG end end if aF and aC>aF then return
false end elseif aB=='Above'then local aF for aG in pairs(aA)do if not aF or aG<
aF then aF=aG end end if aF and aC<aF then return false end else if not aA[aC]
then return false end end return true end function ae.HasAnyFilter()return next(
ai)~=nil or next(aj)~=nil or next(ak)~=nil end function ae.CountMatches()local
az,aA=ay()if not az then return{total=0,matching=0,error=aA or
'Error reading inventory'}end local aB,aC=0,{}for aF,aG in ipairs(az)do aC[aG.
Type]=(aC[aG.Type]or 0)+1 if ae.ShouldSellItem(aG)then aB+=1 end end return{
total=#az,matching=aB,byCategory=aC}end function ae.SellItems()if am then return
nil end am=true local az,aA,aB={sold=0,skipped=0,gold=0,error=nil},ay()if not aA
then az.error=aB or'Error reading inventory'am=false return az end local aC={}
for aF,aG in ipairs(aA)do if ae.ShouldSellItem(aG)then if aG.Index then az.sold
+=1 local aH=aG.Category or aG.Type aC[aH]=aC[aH]or{}table.insert(aC[aH],aG.
Index)end else az.skipped+=1 end end local aF,aG=pcall(ax,aC)if aF and aG and
type(aG)=='number'then az.gold=aG end am=false return az end function ae.
SetLevelReqMode(az)if az=='Below'or az=='Above'then al=az else al='None'end end
function ae.GetLevelReqMode()return al end function ae.SetExcludeEquipped(az)ah=
az end function ae.GetExcludeEquipped()return ah end function ae.SetRarityFilter
(az)ai={}if type(az)=='table'then for aA,aB in pairs(az)do if aB==true and type(
aA)=='string'then local aC=au(aA)or aA ai[aC]=true elseif type(aB)=='string'then
local aC=au(aB)or aB ai[aC]=true end end elseif type(az)=='string'then local aA=
au(az)or az ai[aA]=true end end function ae.GetRarityFilter()local az={}for aA
in pairs(ai)do table.insert(az,aA)end return az end function ae.SetTypeFilter(az
)aj={}if type(az)=='table'then for aA,aB in pairs(az)do if aB==true and type(aA)
=='string'then aj[aA]=true elseif type(aB)=='string'then aj[aB]=true end end
elseif type(az)=='string'then aj[az]=true end end function ae.GetTypeFilter()
local az={}for aA in pairs(aj)do table.insert(az,aA)end return az end function
ae.SetLevelReqExactFilter(az)ak={}if type(az)=='table'then for aA,aB in pairs(az
)do if aB==true then local aC=tonumber(aA)if aC then ak[aC]=true end else local
aC=tonumber(aB)if aC then ak[aC]=true end end end elseif type(az)=='string'or
type(az)=='number'then local aA=tonumber(az)if aA then ak[aA]=true end end end
function ae.GetLevelReqExactFilter()local az={}for aA in pairs(ak)do table.
insert(az,tostring(aA))end return az end local az=function()return not ad[game.
PlaceId]end local aA=function()if not af then return end if ag then return end
if not az()then return end if not ae.HasAnyFilter()then return end ag=true task.
spawn(function()task.wait(2.5)if not af or not az()then return end local aA=ae.
SellItems()if aA and aA.sold and aA.sold>0 then ab.Notify('AutoSell',(
'Auto-sold %d item(s) on dungeon start.'):format(aA.sold),3)end end)end function
ae.Toggle(aB)af=aB and true or false if af and az()and not ag then aA()end end
function ae.IsEnabled()return af end ac.OnDungeonNameChanged(function(aB)ag=
false if aB then aA()end end)ac.OnLobbyChanged(function(aB)if not aB then ag=
false aA()else ag=false end end)task.spawn(function()while aa.IsActive()do task.
wait(1)if af and az()and not ag then aA()end end end)aa.Register(function()af=
false end)ae.LEVEL_REQ_OPTIONS=ap ae.LEVEL_REQ_MODE_OPTIONS=aq return ae end
function a.O()local aa,ab,ac=a.load'd',a.load'N',a.load'c'return function(ad,ae)
local af=ae:Section{Side='Left'}af:Header{Name='AutoSell'}local ag=ae:Section{
Side='Right'}ag:Header{Name='Filter Summary'}local ah,ai,aj,ak,al,am,an=ag:Label
{Text='Status: --'},ag:Label{Text='Safety: --'},ag:Label{Text=
[[Trigger: <font color='rgb(200,200,255)'>On Dungeon Start</font>]]},ag:Label{
Text='Rarities: --'},ag:Label{Text='Item Types: --'},ag:Label{Text=
'Level Req: --'},ag:Label{Text='Exclude Equipped: --'}local ao=function()local
ao=ab.IsEnabled()local ap,aq=ao and'0, 255, 0'or'255, 80, 80',ao and'Enabled'or
'Disabled'pcall(function()ah:UpdateName("Status: <font color='rgb("..ap..")'>"..
aq..'</font>')end)local ar=ab.HasAnyFilter()local as,at=ar and'0, 255, 0'or
'255, 80, 80',ar and'\u{2713} Active (Configured)'or
'\u{26a0} NO filter selected'pcall(function()ai:UpdateName(
"Safety: <font color='rgb("..as..")'>"..at..'</font>')end)local au=ab.
GetRarityFilter()local av,ax=#au>0 and table.concat(au,', ')or'All (No filter)',
#au>0 and'255, 220, 120'or'160, 160, 160'pcall(function()ak:UpdateName(
"Rarities: <font color='rgb("..ax..")'>"..av..'</font>')end)local ay=ab.
GetTypeFilter()local az,aA=#ay>0 and table.concat(ay,', ')or'All (No filter)',#
ay>0 and'255, 220, 120'or'160, 160, 160'pcall(function()al:UpdateName(
"Item Types: <font color='rgb("..aA..")'>"..az..'</font>')end)local aB,aC=ab.
GetLevelReqMode(),ab.GetLevelReqExactFilter()table.sort(aC,function(aF,aG)return
(tonumber(aF)or 0)<(tonumber(aG)or 0)end)local aF,aG='1 (Safe Fallback)',
'255, 160, 80'if#aC>0 then aG='255, 220, 120'if aB=='Below'then aF=
'Below (\u{2264} '..aC[#aC]..')'elseif aB=='Above'then aF='Above (\u{2265} '..aC
[1]..')'else aF='Exact ('..table.concat(aC,', ')..')'end end pcall(function()am:
UpdateName("Level Req: <font color='rgb("..aG..")'>"..aF..'</font>')end)local aH
=ab.GetExcludeEquipped()local aI,aJ=aH and'0, 255, 0'or'255, 80, 80',aH and
'Yes (Protected)'or'No (May Sell)'pcall(function()an:UpdateName(
"Exclude Equipped: <font color='rgb("..aI..")'>"..aJ..'</font>')end)end af:
Toggle({Name='Auto Sell on Dungeon Start',Default=ab.IsEnabled(),Callback=aa.
Wrap(function(ap)ab.Toggle(ap)ao()end)},'Toggle_AutoSellEnabled')local ap,aq={
'Common','Uncommon','Rare','Epic','Legendary','Mythic'},{'Weapons','Helmets',
'Chests','Abilities'}af:Dropdown({Name='Rarity Filter',Options=ap,Default=ab.
GetRarityFilter(),Multi=true,Required=false,Callback=aa.Wrap(function(ar)ab.
SetRarityFilter(ar)ao()end)},'Dropdown_AutoSellRarity')af:Dropdown({Name=
'Item Type Filter',Options=aq,Default=ab.GetTypeFilter(),Multi=true,Required=
false,Callback=aa.Wrap(function(ar)ab.SetTypeFilter(ar)ao()end)},
'Dropdown_AutoSellType')local ar,as=(ab.GetLevelReqMode())local at=table.find(ab
.LEVEL_REQ_MODE_OPTIONS,ar)or 1 af:Dropdown({Name='Level Req Mode',Options=ab.
LEVEL_REQ_MODE_OPTIONS,Default=at,Multi=false,Required=true,Callback=aa.Wrap(
function(au)ab.SetLevelReqMode(au)if as then local av=(au=='None')as.Settings.
Multi=av as.Settings.Required=not av local ax=ab.GetLevelReqExactFilter()if#ax>0
then if not av and#ax>1 then as:UpdateSelection(ax[1])else as:UpdateSelection(ax
)end end end ao()end)},'Dropdown_AutoSellLevelReqMode')as=af:Dropdown({Name=
'Level Req Filter',Options=ab.LEVEL_REQ_OPTIONS,Default=ab.
GetLevelReqExactFilter(),Multi=ar=='None',Required=ar~='None',Search=true,
Callback=aa.Wrap(function(au)ab.SetLevelReqExactFilter(au)ao()end)},
'Dropdown_AutoSellLevelReq')af:Toggle({Name='Exclude Equipped Items',Default=ab.
GetExcludeEquipped(),Callback=aa.Wrap(function(au)ab.SetExcludeEquipped(au)ao()
end)},'Toggle_AutoSellExcludeEquipped')local au=af:Label({Text=
'No search made yet.'},'Label_AutoSellResult')af:Button{Name='Search',Callback=
function()task.spawn(function()pcall(function()au:UpdateName
'Reading inventory...'end)local av=ab.CountMatches()if not av then return end if
av.error then pcall(function()au:UpdateName(
"<font color='rgb(255,80,80)'>Error: "..av.error..'</font>')end)return end local
ax,ay=(
[[Found <font color='rgb(0,255,0)'>%d</font>/<font color='rgb(240,240,240)'>%d</font> matching items.
]]
):format(av.matching,av.total),true for az,aA in ipairs{'Weapons','Helmets',
'Chests','Abilities'}do local aB=av.byCategory and av.byCategory[aA]if aB then
if ay then ax..=aA..': '..aB else ax..=' \u{2022} '..aA..': '..aB end ay=false
end end pcall(function()au:UpdateName(ax)end)end)end}af:Button{Name='Sell Now',
Callback=function()task.spawn(function()pcall(function()au:UpdateName
'Reading inventory...'end)local av=ab.CountMatches()if not av then pcall(
function()au:UpdateName
[[<font color='rgb(255,80,80)'>A sale is already running.</font>]]end)return end
if av.error then pcall(function()au:UpdateName(
"<font color='rgb(255,80,80)'>Error: "..av.error..'</font>')end)return end local
ax,ay=ab.HasAnyFilter(),''if not ax then ay=
'\n\n<font color="rgb(255,80,80)"><b>\u{26a0} NO filter selected!</b> This will sell the ENTIRE inventory (except equipped items).</font>'
end local az=(
[[Sell <font color='rgb(0,255,0)'>%d</font>/<font color='rgb(240,240,240)'>%d</font> matching item(s) with current filters.]]
):format(av.matching,av.total)az=az..ay..'\n\nAre you sure?'ad:Dialog{Title=
'Confirm Sale',Description=az,Buttons={{Name='Confirm',Callback=function()task.
spawn(function()pcall(function()au:UpdateName'Reading inventory...'end)ac.
Notify('AutoSell','Selling...',2)local aA=ab.SellItems()if not aA then pcall(
function()au:UpdateName
[[<font color='rgb(255,80,80)'>A sale is already running.</font>]]end)return end
if aA.error then pcall(function()au:UpdateName(
"<font color='rgb(255,80,80)'>Error: "..aA.error..'</font>')end)return end local
aB=(
[[Done: <font color='rgb(0,255,0)'>%d</font> sold, <font color='rgb(255,200,0)'>%d</font> skipped, <font color='rgb(255,220,120)'>%s</font> gold earned.]]
):format(aA.sold,aA.skipped,tostring(aA.gold))pcall(function()au:UpdateName(aB)
end)end)end},{Name='Cancel'}}}end)end}ao()end end function a.P()local aa,ab,ac,
ad,ae,af,ag,ah,ai,aj,ak,al,am,an=a.load'e',a.load'f',{},0.05,0.8,Color3.fromRGB(
0,255,0),'PlayerHitbox_ESP',Color3.fromRGB(255,0,0),'EnemyHitbox_ESP',0.01,
'Real','Custom',false local ao,ap,aq,ar,as,at,au,av=ak,1.5,aa.player,false,ak,
1.5,function(ao,ap,aq)local ar=Instance.new'SelectionBox'ar.Name=ao ar.Adornee=
ap ar.Color3=aq ar.LineThickness=ad*4 ar.SurfaceColor3=aq ar.SurfaceTransparency
=ae ar.Parent=ap end local ax=function(ax,ay,az,aA,aB)if not ay or not ay.Parent
then return end local aC,aF=ax..'_Proxy',ay:FindFirstChild(ax)local aG=ay:
FindFirstChild(aC)if aA==al then if aF and aF:IsA'SelectionBox'and aF.Adornee==
ay then aF:Destroy()end if not aG then aG=Instance.new'Part'aG.Name=aC aG.
Anchored=true aG.CanCollide=false aG.CanQuery=false aG.CanTouch=false aG.
Transparency=1 aG.Parent=ay au(ax,aG,az)end local aH=ay.Size local aI=math.max(
math.abs(aH.X),math.abs(aH.Y),math.abs(aH.Z))local aJ=math.max(aI*aB,1)aG.Size=
Vector3.new(aJ,aJ,aJ)aG.CFrame=ay.CFrame else if aG then aG:Destroy()end if aF
and aF:IsA'SelectionBox'and aF.Adornee~=ay then aF:Destroy()aF=nil end if not aF
or not aF:IsA'SelectionBox'or aF.Adornee~=ay then au(ax,ay,az)end end end local
ay,az=function()local ay=aq and aq.Character local az=ay and ay:FindFirstChild
'HumanoidRootPart'if not az or not az.Parent then return end ax(ag,az,af,ao,ap)
end,function()if an then task.cancel(an)an=nil end local ay=function(ay)if not
ay then return end for az,aA in ipairs(ay:GetDescendants())do if aA.Name==ag or
aA.Name==ag..'_Proxy'then aA:Destroy()end end end ay(aq and aq.Character)for az,
aA in ipairs(aa.Players:GetPlayers())do ay(aA.Character)end end function ac.
TogglePlayerHitbox(aA)if aA==am then return end am=aA if am then if an then task
.cancel(an)an=nil end an=task.spawn(function()while am do local aB,aC=pcall(ay)
if not aB then if os.clock()-(ac.lastPlayerWarn or 0)>5 then ac.lastPlayerWarn=
os.clock()warn('[PlayerHitbox] error:',tostring(aC))end end aa.RunService.
Heartbeat:Wait()end end)else az()end end function ac.IsPlayerHitboxEnabled()
return am end function ac.GetPlayerHitboxMode()return ao end function ac.
SetPlayerHitboxMode(aA)if aA~=ak and aA~=al then return end ao=aA end function
ac.GetPlayerHitboxScale()return ap end function ac.SetPlayerHitboxScale(aA)ap=aA
end local aA,aB=function()for aA,aB in ipairs(ab.GetTrackedEnemyData())do local
aC=aB.Root if aC and aC.Parent then ax(ai,aC,ah,as,at)end end end,function()if
av then task.cancel(av)av=nil end for aA,aB in ipairs(game:GetService'Workspace'
:GetDescendants())do local aC,aF=aB:FindFirstChild(ai),aB:FindFirstChild(ai..
'_Proxy')if aC then aC:Destroy()end if aF then aF:Destroy()end end end function
ac.ToggleEnemyHitbox(aC)if aC==ar then return end ar=aC if ar then if av then
task.cancel(av)av=nil end av=task.spawn(function()while ar do local aF,aG=pcall(
aA)if not aF then if os.clock()-(ac.lastEnemyWarn or 0)>5 then ac.lastEnemyWarn=
os.clock()warn('[EnemyHitbox] error:',tostring(aG))end end aa.RunService.
Heartbeat:Wait()end end)else aB()end end function ac.IsEnemyHitboxEnabled()
return ar end function ac.GetEnemyHitboxMode()return as end function ac.
SetEnemyHitboxMode(aC)if aC~=ak and aC~=al then return end as=aC end function ac
.GetEnemyHitboxScale()return at end function ac.SetEnemyHitboxScale(aC)at=aC end
local aC,aF,aG,aH,aI,aJ=Color3.fromRGB(255,0,0),'SkillESP',{},false,false local
aK=function()table.clear(aG)local aK=game:GetService'Workspace'for aL,aM in
ipairs(aK:GetChildren())do aG[aM]=true end aH=true end aK()local aL,aM=function(
aL)local aM=aq.Character if not aM then return false end local aN=aL while aN do
if aN==aM then return true end aN=aN.Parent end return false end,function(aL)
local aM=aL while aM do if aG[aM]then return true end aM=aM.Parent end return
false end local aN=function(aN)if not aH then return end if aM(aN)then return
end if aL(aN)then return end if aN:FindFirstChild(aF)then return end local aO=
Instance.new'SelectionBox'aO.Name=aF aO.Adornee=aN aO.Color3=aC aO.SurfaceColor3
=aC aO.SurfaceTransparency=0.8 aO.Parent=aN end local aO,aP=function()if not aH
then return end local aO=game:GetService'Workspace'for aP,aQ in ipairs(aO:
GetChildren())do if aQ:IsA'BasePart'then aN(aQ)end for aS,aT in ipairs(aQ:
GetDescendants())do if aT:IsA'BasePart'then aN(aT)end end end end,function()if
aJ then task.cancel(aJ)aJ=nil end local aO=game:GetService'Workspace'for aP,aQ
in ipairs(aO:GetDescendants())do local aS=aQ:FindFirstChild(aF)if aS then aS:
Destroy()end end end function ac.ToggleSkillHitbox(aQ)if aQ==aI then return end
aI=aQ if aI then if aJ then task.cancel(aJ)aJ=nil end aJ=task.spawn(function()
while aI do local aS,aT=pcall(aO)if not aS and os.clock()-(ac.lastSkillWarnH or
0)>5 then ac.lastSkillWarnH=os.clock()warn('[SkillHitbox] error:',tostring(aT))
end task.wait(aj)end end)else aP()end end function ac.IsSkillHitboxEnabled()
return aI end return ac end function a.Q()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak
=a.load'e',a.load'f',{},Color3.fromRGB(255,170,0),0.55,'Enemy_ESP',0.5,{Orange=
Color3.fromRGB(255,170,0),Red=Color3.fromRGB(255,0,0),Yellow=Color3.fromRGB(255,
255,0),Green=Color3.fromRGB(0,255,0),Cyan=Color3.fromRGB(0,255,255),Blue=Color3.
fromRGB(0,120,255),Magenta=Color3.fromRGB(255,0,255),White=Color3.fromRGB(255,
255,255)},false,'Orange'local al=function()return ah[aj]or ad end local am,an,ao
=function(am)if not am or not am:IsA'Model'then return end if not am:
FindFirstChild(af)then local an=Instance.new'Highlight'an.Name=af an.Adornee=am
an.FillColor=al()an.FillTransparency=ae an.OutlineColor=al()an.
OutlineTransparency=1 an.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop an.Parent
=am end end,function()local am=al()for an,ao in ipairs(game:GetService
'Workspace':GetDescendants())do local ap=ao:FindFirstChild(af)if ap and ap:IsA
'Highlight'then ap.FillColor=am ap.OutlineColor=am end end end,function()for am,
an in ipairs(game:GetService'Workspace':GetDescendants())do local ao=an:
FindFirstChild(af)if ao then ao:Destroy()end end for am,an in ipairs(aa.Players:
GetPlayers())do local ao=an.Character if ao then for ap,aq in ipairs(ao:
GetDescendants())do if aq.Name==af then aq:Destroy()end end end end end function
ac.Toggle(ap)if ap==ai then return end ai=ap if ai then if ak then task.cancel(
ak)ak=nil end ak=task.spawn(function()while ai do local aq,ar=pcall(function()
for aq,ar in ipairs(ab.GetTrackedEnemyData())do if ar.Model and ar.Model.Parent
then am(ar.Model)end end end)if not aq then if os.clock()-(ac.lastWarn or 0)>5
then ac.lastWarn=os.clock()warn('[EnemyESP] error:',tostring(ar))end end task.
wait(ag)end end)else if ak then task.cancel(ak)ak=nil end local aq=pcall(ao)if
not aq then warn'[EnemyESP] cleanup error'end end end function ac.IsEnabled()
return ai end function ac.GetColorNames()local ap={}for aq in pairs(ah)do table.
insert(ap,aq)end table.sort(ap)return ap end function ac.GetSelectedColor()
return aj end function ac.SetSelectedColor(ap)if not ah[ap]then return end if ap
==aj then return end aj=ap local aq=pcall(an)if not aq then warn
'[EnemyESP] recolor error'end end return ac end function a.R()local aa,ab,ac,ad,
ae,af,ag,ah=a.load'e',a.load'b',{},false,{},{},{},2 local ai={['meshes/ice3']=
true,['meshes/snow']=true,['invisible platform']=true,part=true}local aj,ak,al=
function(aj)if not aj then return true end if aj:IsA'Model'or aj:IsA'Folder'then
return true end local ak=aj.Name:lower()if ai[ak]or aj.Name=='Meshes/Ice3'or aj.
Name=='Meshes/Snow'or aj.Name=='Invisible platform'or aj.Name=='Part'then return
true end return false end,function()if not ad then return end local aj=workspace
:FindFirstChild'Map'if not aj then return end for ak,al in ipairs(aj:
GetDescendants())do if(al:IsA'Model'or al:IsA'Folder')and al.Name:lower():find
'border'then for am,an in ipairs(al:GetChildren())do pcall(function()an:Destroy(
)end)end end end end,function()if not ad then return end local aj=workspace:
FindFirstChild'Map'if not aj then return end for ak,al in ipairs(aj:
GetDescendants())do if al.Name:lower():find'wooden plank'then local am=al.Parent
while am and am~=aj and am~=workspace do if am:IsA'Model'then pcall(function()am
:Destroy()end)break end am=am.Parent end end end end local am,an,ao=function()if
not ad then return end local am=workspace:FindFirstChild'Map'if not am then
return end for an,ao in ipairs(am:GetChildren())do if not aj(ao)then pcall(
function()ao:Destroy()end)end end end,{Vector3.new(-724.4873046875,
33.9286003112793,174.7227325439453),Vector3.new(-697.8023681640625,
26.397010803222656,380.60272216796875),Vector3.new(-649.3167724609375,
31.39712905883789,397.80535888671875),Vector3.new(-581.634033203125,
3.4567506313323975,318.2510070800781),Vector3.new(-491.9974365234375,
41.522090911865234,384.67694091796875),Vector3.new(-484.0378723144531,
35.76678466796875,418.82659912109375),Vector3.new(-470.1619567871094,
32.919700622558594,461.6861267089844),Vector3.new(-468.8152770996094,
39.06712341308594,514.388916015625),Vector3.new(-600.4266357421875,
13.99144172668457,570.6660766601563),Vector3.new(-338.2521667480469,
42.990394592285156,439.36456298828125),Vector3.new(-355.2449951171875,
57.510982513427734,385.5475769042969),Vector3.new(-606.5220336914063,
37.41774368286133,372.6407470703125)},0.2 local ap=function(ap)if not ap then
return false end for aq,ar in ipairs(an)do if(ap-ar).Magnitude<=ao then return
true end end return false end local aq=function(aq)if not aq or not aq:IsA
'Model'or not aq.Parent then return false end local ar,as=pcall(function()return
aq:GetPivot().Position end)if ar and as and ap(as)then return true end if aq.
PrimaryPart and ap(aq.PrimaryPart.Position)then return true end for at,au in
ipairs(aq:GetDescendants())do if au:IsA'BasePart'and ap(au.Position)then return
true end end return false end local ar,as=function()if not ad then return end
local ar=workspace:FindFirstChild'Map'or workspace:FindFirstChild'dungeon'or
workspace:FindFirstChild'Dungeon'if not ar then return end for as,at in ipairs(
ar:GetDescendants())do if not at.Parent then continue end if at:IsA'Model'then
if aq(at)then pcall(function()at:Destroy()end)end elseif at:IsA'BasePart'then if
ap(at.Position)then local au=at:FindFirstAncestorOfClass'Model'if au and au~=
workspace and au~=ar then pcall(function()au:Destroy()end)else pcall(function()
at:Destroy()end)end end end end end,function(ar)if not ad or not ar or not ar:
IsA'BasePart'then return end if ar.Name=='Meshes/Snow'or ar.Name:lower():find
'meshes/snow'or ar.Name:lower()=='snow'then if ag[ar]==nil then ag[ar]=ar.
Transparency end pcall(function()ar.Transparency=1 end)end end local at=function
()if not ad then return end local at=workspace:FindFirstChild'Map'if not at then
return end for au,av in ipairs(at:GetDescendants())do if av:IsA'BasePart'and(av.
Name=='Meshes/Snow'or av.Name:lower():find'meshes/snow'or av.Name:lower()==
'snow')then as(av)end end end local au=function()if not ad then return end am()
ak()al()ar()at()end local av,ax=function()for av,ax in ipairs(ae)do pcall(
function()ax:Disconnect()end)end table.clear(ae)local av,ax=function(av)if not
av then return end table.insert(ae,av.ChildAdded:Connect(function(ax)if not ad
then return end if not aj(ax)then pcall(function()ax:Destroy()end)end end))table
.insert(ae,av.DescendantAdded:Connect(function(ax)if not ad then return end if
ax.Name:lower():find'wooden plank'then local ay=ax.Parent while ay and ay~=av
and ay~=workspace do if ay:IsA'Model'then pcall(function()ay:Destroy()end)return
end ay=ay.Parent end end local ay=ax.Parent while ay and ay~=av and ay~=
workspace do if(ay:IsA'Model'or ay:IsA'Folder')and ay.Name:lower():find'border'
then pcall(function()ax:Destroy()end)break end ay=ay.Parent end if ax:IsA'Model'
and aq(ax)then pcall(function()ax:Destroy()end)return elseif ax:IsA'BasePart'and
ap(ax.Position)then local az=ax:FindFirstAncestorOfClass'Model'if az and az~=
workspace and az~=av then pcall(function()az:Destroy()end)else pcall(function()
ax:Destroy()end)end return end if ax:IsA'BasePart'and(ax.Name=='Meshes/Snow'or
ax.Name:lower():find'meshes/snow'or ax.Name:lower()=='snow')then as(ax)end end))
end,workspace:FindFirstChild'Map'or workspace:FindFirstChild'dungeon'or
workspace:FindFirstChild'Dungeon'if ax then av(ax)end table.insert(ae,workspace.
ChildAdded:Connect(function(ay)if not ad then return end local az=ay.Name:lower(
)if az=='map'or az=='dungeon'then av(ay)task.delay(0.2,au)end end))end,function(
)for av,ax in pairs(ag)do if av and av.Parent then pcall(function()av.
Transparency=ax end)end end table.clear(ag)for av,ax in pairs(af)do if av and av
.Parent then pcall(function()av.CanCollide=ax.CanCollide av.CanTouch=ax.CanTouch
end)end end table.clear(af)end function ac.Toggle(ay)if ay==ad then return end
ad=ay and true or false if ad then au()av()if loopThread then task.cancel(
loopThread)loopThread=nil end loopThread=task.spawn(function()while ad do task.
wait(ah)pcall(au)end end)else for az,aA in ipairs(ae)do pcall(function()aA:
Disconnect()end)end table.clear(ae)if loopThread then task.cancel(loopThread)
loopThread=nil end ax()end end function ac.IsEnabled()return ad end ab.Register(
function()ac.Toggle(false)end)return ac end function a.S()local aa,ab,ac,ad,ae,
af,ag=a.load'd',a.load'P',a.load'Q',a.load'R',a.load'A',{'Custom Hitbox',
'Real Hitbox'},function(aa)return(aa=='Custom'and 1)or 2 end local ah=function(
ah)return(ah==af[1]and'Custom')or'Real'end return function(ai,aj)local ak,al=(aj
:Section{Side='Left'})ak:Header{Name='Player'}ak:Toggle({Name='Hitbox',Default=
ab.IsPlayerHitboxEnabled(),Callback=aa.Wrap(function(am)ab.TogglePlayerHitbox(am
)end)},'Toggle_PlayerHitbox')ak:Dropdown({Name='Hitbox Mode',Options=af,Default=
ag(ab.GetPlayerHitboxMode()),Required=true,Callback=aa.Wrap(function(am)ab.
SetPlayerHitboxMode(ah(am))al()end)},'Dropdown_PlayerHitboxMode')local am,an=ae.
PatchSliderLoadCallback(ak:Slider({Name='Hitbox Size',Default=ab.
GetPlayerHitboxScale(),Minimum=1,Maximum=5,DisplayMethod='Value',Precision=1,
Callback=aa.Wrap(function(am)ab.SetPlayerHitboxScale(am)end)},
'Slider_PlayerHitboxSize')),aj:Section{Side='Left'}an:Header{Name='Enemy'}an:
Toggle({Name='Model Highlight',Default=ac.IsEnabled(),Callback=aa.Wrap(function(
ao)ac.Toggle(ao)end)},'Toggle_EnemyESP')local ao,ap,aq=ac.GetColorNames(),ac.
GetSelectedColor(),1 for ar,as in ipairs(ao)do if as==ap then aq=ar break end
end an:Dropdown({Name='Highlight Color',Options=ao,Default=aq,Required=true,
Callback=aa.Wrap(function(ar)ac.SetSelectedColor(ar)end)},
'Dropdown_HighlightColor')an:Toggle({Name='Hitbox',Default=ab.
IsEnemyHitboxEnabled(),Callback=aa.Wrap(function(ar)ab.ToggleEnemyHitbox(ar)end)
},'Toggle_EnemyHitbox')an:Dropdown({Name='Hitbox Mode',Options=af,Default=ag(ab.
GetEnemyHitboxMode()),Required=true,Callback=aa.Wrap(function(ar)ab.
SetEnemyHitboxMode(ah(ar))al()end)},'Dropdown_EnemyHitboxMode')local ar=ae.
PatchSliderLoadCallback(an:Slider({Name='Hitbox Size',Default=ab.
GetEnemyHitboxScale(),Minimum=1,Maximum=5,DisplayMethod='Value',Precision=1,
Callback=aa.Wrap(function(ar)ab.SetEnemyHitboxScale(ar)end)},
'Slider_EnemyHitboxSize'))an:Toggle({Name='Show Skill Hitbox',Default=ab.
IsSkillHitboxEnabled(),Callback=aa.Wrap(function(as)ab.ToggleSkillHitbox(as)end)
},'Toggle_SkillHitbox')al=function()pcall(function()am:SetVisibility(ab.
GetPlayerHitboxMode()=='Custom')end)pcall(function()ar:SetVisibility(ab.
GetEnemyHitboxMode()=='Custom')end)end al()local as=aj:Section{Side='Right'}as:
Header{Name='Map'}as:Toggle({Name='Map Optimizer',Default=ad.IsEnabled(),
Callback=aa.Wrap(function(at)ad.Toggle(at)end)},'Toggle_MapOptimizer')end end
function a.T()local aa,ab,ac,ad,ae=a.load'a',a.load'c',a.load'f',a.load'b',game:
GetService'HttpService'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,
ax=aa.Folder..'/settings/webhook.json',{},'',false,false,false,'',{'Tier6'},true
,{},false,{common=9807270,uncommon=43520,rare=3447003,epic=10181046,legendary=
16766720,secret=15158332,ultimate=15158332,mythic=15158332},{common=1,uncommon=2
,rare=3,epic=4,legendary=5,secret=6,ultimate=6,mythic=6},10181046,{{match=
'northen',prefix='Valhalla'},{match='northern',prefix='Valhalla'}},16766720
local ay,az=function()local ay=ac.GetCurrentDungeonName()if not ay or ay==''then
return nil end local az=string.lower(ay)for aA,aB in ipairs(at)do if string.
find(az,aB.match,1,true)then return aB.prefix end end return nil end,{legendary=
true,secret=true,ultimate=true,mythic=true}local aA,aB,aC,aF=function(aA)if not
aA then return false end if az[tostring(aA.rarity or''):lower()]then return true
end local aB=ay()if aB and aB~=''then local aC=tostring(aA.itemName or'')return
string.sub(aC,1,#aB)==aB end return false end,{'Tier1','Tier2','Tier3','Tier4',
'Tier5','Tier6'},function(aA)local aB=tonumber(tostring(aA or''):match
'Tier(%d+)')return aB or 6 end local aG,aH=function()if aF then return aF end aF
={}for aG,aH in ipairs(am)do aF[aC(aH)]=true end return aF end,{uncommon=1,
common=2,rare=3,epic=4,legendary=5,secret=6}local aI,aJ,aK,aL=function(aI)if not
aI then return nil end local aJ=tonumber(tostring(aI.tier or''):match'tier(%d+)'
)if aJ then return aJ end if aI.secret==true then return 6 end return aH[string.
lower(tostring(aI.rarity or''))]end,function()local aI=game:GetService'Players'.
LocalPlayer if not aI then return'?'end if aI.Name and aI.Name~=''then return aI
.Name end return aI.DisplayName or'?'end,function()local aI=game:GetService
'Players'.LocalPlayer if not aI then return nil end local aJ=aI:FindFirstChild
'XP'if aJ and aJ:IsA'IntValue'then return aJ.Value end return nil end
local function aM(aN,aO,aP)aP=aP or 12 if aP<0 then return nil end local aQ=aN:
FindFirstChild(aO)if aQ then return aQ end for aS,aT in ipairs(aN:GetChildren())
do local aU=aM(aT,aO,aP-1)if aU then return aU end end return nil end local aN
local aO,aP=function()if ac and type(ac.GetRealPlayerLevel)=='function'then
local aO=ac.GetRealPlayerLevel()if aO then local aP=tonumber(tostring(aO):match
'%d+')if aP and aP>0 then aN=tostring(aP)return aN end end end local aO=_G.
RealPlayerLevel or(type(getgenv)=='function'and getgenv().RealPlayerLevel)if aO
then local aP=tonumber(tostring(aO):match'%d+')if aP and aP>0 then aN=tostring(
aP)return aN end end local aP=game:GetService'Players'.LocalPlayer if not aP
then return aN or'?'end local aQ=aP:FindFirstChild'leaderstats'if aQ then for aS
,aT in ipairs(aQ:GetChildren())do local aU=string.lower(aT.Name)if string.find(
aU,'level')or string.find(aU,'lvl')then local aV=tonumber(tostring(aT.Value):
match'%d+')if aV and aV>0 then aN=tostring(aV)if ac and ac.SetRealPlayerLevel
then ac.SetRealPlayerLevel(aN)end return aN end end end end for aS,aT in ipairs(
aP:GetChildren())do local aU=string.lower(aT.Name)if aU=='level'or aU=='lvl'or
string.find(aU,'level')then if aT:IsA'ValueBase'then local aV=tonumber(tostring(
aT.Value):match'%d+')if aV and aV>0 then aN=tostring(aV)if ac and ac.
SetRealPlayerLevel then ac.SetRealPlayerLevel(aN)end return aN end end end end
for aS,aT in pairs(aP:GetAttributes())do local aU=string.lower(aS)if string.
find(aU,'level')or string.find(aU,'lvl')then local aV=tonumber(tostring(aT):
match'%d+')if aV and aV>0 then aN=tostring(aV)if ac and ac.SetRealPlayerLevel
then ac.SetRealPlayerLevel(aN)end return aN end end end if aP:FindFirstChild
'PlayerGui'then local aS=aP.PlayerGui:FindFirstChild'playerStatus'if aS then
local aT=aM(aS,'levelBorder')if aT then local aU=aT:FindFirstChild'level'if aU
and aU:IsA'TextLabel'then local aV=aU:GetAttribute'RealLevel'or aU:GetAttribute
'OriginalText'if aV then local aW=tonumber(tostring(aV):match'%d+')if aW and aW>
0 then aN=tostring(aW)if ac and ac.SetRealPlayerLevel then ac.
SetRealPlayerLevel(aN)end return aN end end local aW=aU.Text local aX=tonumber(
tostring(aW):match'%d+')if aX and aX>0 then aN=tostring(aX)if ac and ac.
SetRealPlayerLevel then ac.SetRealPlayerLevel(aN)end return aN end end end end
end return aN or'?'end,false local aQ,aS,aT=function()if aL~=nil or aP then
return end aP=true task.spawn(function()local aQ=os.clock()+8 while aL==nil and
os.clock()<aQ do aL=aK()if aL~=nil then break end task.wait(0.25)end aP=false
end)end,function()local aQ,aS=pcall(function()return game:GetService
'ReplicatedStorage':WaitForChild('remotes',5):WaitForChild('reloadInvy',5)end)if
not aQ or not aS or not aS:IsA'RemoteFunction'then return nil end local aT,aU=
pcall(function()return aS:InvokeServer()end)if not aT or aU==nil then return nil
end if type(aU)=='table'and aU['1']and type(aU['1'])=='table'then return aU['1']
end return aU end,function(aQ)return type(aQ)=='table'and(aQ.sellPrice~=nil or
aQ.UniqueItemID~=nil or aQ.rarity~=nil or aQ.name~=nil)end local aU=function(aU)
if type(aU)~='table'then return{}end local aV,aW={},{}local function aX(aY,aZ)if
type(aY)~='table'or aW[aY]then return end aW[aY]=true if aT(aY)then local a_=(aY
.UniqueItemID and tostring(aY.UniqueItemID))or(aY.uniqueItemNum and tostring(aY.
uniqueItemNum))or nil table.insert(aV,{category=aZ,raw=aY,id=a_,name=tostring(aY
.name or aY.itemName or''),rarity=tostring(aY.rarity or''):lower()})return end
for a_,a0 in pairs(aY)do if type(a0)=='table'then local a1=aZ if a_=='weapons'or
a_=='weapon'then a1='weapon'elseif a_=='helmets'or a_=='helmet'then a1='helmet'
elseif a_=='chests'or a_=='chest'then a1='chest'elseif a_=='abilities'or a_==
'ability'then a1='ability'end aX(a0,a1)end end end aX(aU,nil)return aV end local
aV=function()if not an or ap then return end ap=true task.spawn(function()local
aV=aS()if aV then local aW,aX=aU(aV),{}for aY,aZ in ipairs(aW)do if aZ.id then
aX[aZ.id]=true end end ao=aX end ap=false end)end local aW,aX=function()aL=aK()
if aL==nil then aQ()end ac.SetDungeonStartTime(nil)if an then aV()end end,
function()if not ac.GetDungeonStartTime()then ac.SetDungeonStartTime(os.clock())
end if aL==nil then aQ()end if an then aV()end end local aY,aZ,a_,a0=function()
if ax then return end local aY=function(aY)if aY then aW()else aX()end end aY(ac
.IsInLobby())ax=ac.OnLobbyChanged(aY)end,function(aY)aY=math.max(0,math.floor(aY
or 0))local aZ,a_=math.floor(aY/60),aY%60 return string.format('%d:%02d',aZ,a_)
end,function(aY)if not aY then return'0'end local aZ,a_=(tostring(math.floor(aY)
))while true do aZ,a_=string.gsub(aZ,'^(-?%d+)(%d%d%d)','%1,%2')if a_==0 then
break end end return aZ end,function(aY)if not aY then return 0,0 end local aZ=
string.gsub(tostring(aY),',','')local a_,a0=string.match(aZ,'(%d+)%s*/%s*(%d+)')
if a_ and a0 then return tonumber(a_)or 0,tonumber(a0)or 0 end local a1=
tonumber(string.match(aZ,'^%s*([%d.-]+)'))return 0,a1 or 0 end local a1,a2,a3,a4
,a5=function(a1)if not an or not a1 or type(a1.items)~='table'or#a1.items==0
then return end local a2=aS()if not a2 then return end local a3=aU(a2)if#a3==0
then return end local a4={}for a5,a6 in ipairs(a3)do if a6.id and not ao[a6.id]
then table.insert(a4,a6)end end local a5,a6=(#a4>0)and a4 or a3,{}for a7,a8 in
ipairs(a1.items)do local a9=tostring(a8.itemType or''):lower()if a9=='ability'or
a9=='gold'or a8.itemName=='gold'then continue end local b,ba=(tostring(a8.
itemName or''):lower())for bb,bc in ipairs(a5)do if not a6[bb]then local bd=bc.
name:lower()if bd==b or string.find(bd,b,1,true)or string.find(b,bd,1,true)then
a6[bb]=true ba=bc break end end end if ba then local bb=ba.raw local bc,bd,be,bf
,bg=tostring(bb.name or bb.itemName or a8.itemName or''),ba.category or a9,bb.
totalUpgrades or bb.maxUpgrades or bb.totalUpgrade or bb.maxUpgrade or bb.
upgradesTotal or bb.upgradesMax or bb.upgradeTotal or bb.upgradeLimit or bb.
availableUpgrades,0,0 if be~=nil then bg=tonumber(be)or 0 end if bb.curUpgrades
~=nil or bb.currentUpgrades~=nil then bf=tonumber(bb.curUpgrades or bb.
currentUpgrades)or 0 end if bb.upgrades~=nil then if type(bb.upgrades)=='string'
then local bh,bi=a0(bb.upgrades)bf=bf~=0 and bf or bh bg=bg~=0 and bg or bi
elseif type(bb.upgrades)=='number'then bf=bf~=0 and bf or bb.upgrades elseif
type(bb.upgrades)=='table'then local bh,bi=bb.upgrades.cur or bb.upgrades.
current or bb.upgrades[1],bb.upgrades.max or bb.upgrades.total or bb.upgrades.
totalUpgrades or bb.upgrades[2]if bh~=nil then bf=bf~=0 and bf or(tonumber(bh)or
0)end if bi~=nil then bg=bg~=0 and bg or(tonumber(bi)or 0)end end end local bh,
bi,bj,bk,bl,bm=tonumber(bb.physicalDamage or bb.physicalPower or 0)or 0,
tonumber(bb.spellPower or 0)or 0,tonumber(bb.health or 0)or 0,'',0,''if bd==
'weapon'or string.find(bd,'weapon')then if bi>bh then bk='Spell'bl=bi bm=
'\u{1f52e}'else bk='Phys'bl=bh bm='\u{2694}\u{fe0f}'end else local bn=bc:lower()
if string.find(bn,'guardian')then bk='HP'bl=bj bm='\u{1f6e1}\u{fe0f}'elseif
string.find(bn,'mage')then bk='Spell'bl=bi bm='\u{1f52e}'elseif string.find(bn,
'warrior')then bk='Phys'bl=bh bm='\u{2694}\u{fe0f}'else if bj>10000 and bj>(bh*
10)then bk='HP'bl=bj bm='\u{1f6e1}\u{fe0f}'elseif bi>bh then bk='Spell'bl=bi bm=
'\u{1f52e}'else bk='Phys'bl=bh bm='\u{2694}\u{fe0f}'end end end local bn=math.
max(0,bg-bf)local bo=bl+(bn*10)if bl>0 or bg>0 then a8.potentialInfo={statName=
bk,statVal=bl,maxPotential=bo,curUpgrades=bf,maxUpgrades=bg,icon=bm}end end end
local a7={}for a8,a9 in ipairs(a3)do if a9.id then a7[a9.id]=true end end ao=a7
end,function()if not(isfile and isfile(af))then return end local a1,a2=pcall(
function()return ae:JSONDecode(readfile(af))end)if a1 and type(a2)=='table'then
ah=type(a2.url)=='string'and a2.url or''ai=a2.enabled==true ak=a2.pingEnabled==
true al=type(a2.pingMention)=='string'and a2.pingMention or''if a2.showPotential
~=nil then an=a2.showPotential==true end local a3=a2.pingTiers if type(a3)==
'string'then a3={a3}end if type(a3)=='table'then local a4={}for a5,a6 in ipairs(
a3)do if table.find(aB,a6)and not table.find(a4,a6)then table.insert(a4,a6)end
end if#a4>0 then am=a4 end end aF=nil end end,function()if not(isfile and
writefile)then return end pcall(function()writefile(af,ae:JSONEncode{url=ah,
enabled=ai,pingEnabled=ak,pingMention=al,pingTiers=am,showPotential=an})end)end,
function(a1)local a2={}for a3,a4 in ipairs(a1 or{})do local a5,a6=a4.itemName or
'Unknown',aA(a4)if a6 then a5='\u{2b50} '..a5 end local a7={}if a4.itemType and
a4.itemType~='gold'then table.insert(a7,a4.itemType)end if a4.rarity then table.
insert(a7,a4.rarity)end local a8=''if#a7>0 then a8=string.format('%s (%s)',
tostring(a5),table.concat(a7,', '))else a8=tostring(a5)end if an and a4.
potentialInfo then local a9=a4.potentialInfo local b=(a9.icon and a9.icon~='')
and(a9.icon..' ')or''local ba=string.format('  \u{2514} %sMaxPot: %s',b,a_(a9.
maxPotential))table.insert(a2,a8..'\n'..ba)else table.insert(a2,a8)end end
return table.concat(a2,'\n')end,function(a1)if not a1 then return false end
local a2=aI(a1)if not a2 then return false end return aG()[a2]==true end local
a6=function(a6)if not ak or al==''then return false end for a7,a8 in ipairs(a6
or{})do if a5(a8)then return true end end return false end local a7=function(a7,
a8)local a9,b=tonumber(a7.gold)or 0,{}for ba,bb in ipairs(a7.items or{})do if bb
.itemName and bb.itemName~='gold'then table.insert(b,bb)end end local ba,bb,bc,
bd,be=as,false,function(ba,bb)if ba==nil then return bb end if bb==nil then
return ba end return(ar[ba]or 0)>=(ar[bb]or 0)and ba or bb end for bf,bg in
ipairs(b)do local bh=tostring(bg.rarity or''):lower()if aA(bg)then bb=true bd=
bc(bd,bh)end if aq[bh]~=nil then be=bc(be,bh)end end if bb then ba=bd and(aq[bd]
or au)or au elseif be then ba=aq[be]end a8=a8 or{}local bf=tostring(a8.level or
'?')if bf=='???'or bf=='?'or bf==''or not bf:match'%d+'then bf=aO()end if bf==
'???'or not bf:match'%d+'then bf='?'end local bg=tonumber(a8.expGained)local bh,
bi,bj=bg and string.format('+%s XP',tostring(bg))or'?',aZ(a8.duration),{}if bg
then table.insert(bj,bh)end if a9>0 then table.insert(bj,string.format(
'+%s gold',tostring(a9)))end local bk,bl=#bj>0 and table.concat(bj,'  ')or'',#b>
0 and a4(b)or'None'local bm=bl if bk~=''then bm=bk..(bl~='None'and('\n'..bl)or''
)end local bn,bo={{name='Player',value=string.format('||%s|| (lv %s)',aJ(),bf),
inline=true},{name='Map',value=ac.GetCurrentDungeonName()or'Unknown',inline=true
},{name='Time',value=bi,inline=true},{name='Rewards',value=bm,inline=false}},
'You cleared the dungeon and received your rewards!'if a6(b)then bo=bo..'\n\n'..
al end return{embeds={{title='Dungeon WIN',description=bo,color=ba,fields=bn,
timestamp=DateTime.now():ToIsoDate()}}}end local a8=function(a8,a9)if ah==''or
string.find(ah,'^https://discord%.com/api/webhooks/')==nil then return false,
'Invalid webhook URL'end local b=a7(a8,a9)local ba,bb=pcall(function()return ae:
JSONEncode(b)end)if not ba then return false,'Could not encode payload'end local
bc,bd=pcall(function()return request{Url=ah,Method='POST',Headers={[
'Content-Type']='application/json',['User-Agent']=
'ScriptHub-DungeonQuest (https://www.roblox.com)'},Body=bb}end)if not bc then
return false,'Request error: '..tostring(bd)end if bd and bd.Success then return
true end local be=bd and bd.StatusCode or'?'return false,'HTTP '..tostring(be)
end function ag.SetUrl(a9)ah=a9 or''a3()end function ag.GetUrl()return ah end
function ag.SetEnabled(a9)ai=a9==true a3()end function ag.IsEnabled()return ai
end function ag.SetPingEnabled(a9)ak=a9==true a3()end function ag.IsPingEnabled(
)return ak end function ag.SetPingMention(a9)al=a9 or''a3()end function ag.
GetPingMention()return al end function ag.SetPingTiers(a9)if type(a9)~='table'
then return end local b,ba={},{}local bb=function(bb)if not ba[bb]and table.
find(aB,bb)then ba[bb]=true table.insert(b,bb)end end for bc,bd in pairs(a9)do
if type(bc)=='string'and bd==true then bb(bc)elseif type(bd)=='string'then bb(bd
)end end if#b==0 then return end am=b aF=nil a3()end function ag.GetPingTiers()
return am end function ag.GetPingTierOptions()return aB end function ag.
SetShowPotential(a9)an=a9==true a3()end function ag.IsShowPotential()return an
end function ag.Send()if not ai then ab.Notify('Webhook',
'Notifications is disabled',3)return end local a9={{itemName=
'Valhalla Mage Armor',rarity='uncommon',itemType='chest',potentialInfo=an and{
statName='Spell',statVal=12400,maxPotential=1212400,curUpgrades=0,maxUpgrades=
120000,icon='\u{1f52e}'}or nil},{itemName='Gale Barrage',rarity='epic',itemType=
'ability'}}local b,ba=a8({items=a9,gold=931797476},{level=aO(),expGained=
49530000000,duration=448})if b then ab.Notify('Webhook','Test sent successfully'
,3)else ab.Notify('Webhook','Send failed: '..tostring(ba),4)end end function ag.
Init()if aj then return end local a9 local b=pcall(function()a9=game:GetService
'ReplicatedStorage':WaitForChild('remotes',30)end)if not b or not a9 then warn
'[Webhook] Could not find ReplicatedStorage.remotes'return end local ba=a9:
FindFirstChild'cloneRewardGui'if not ba then warn
'[Webhook] Could not find remote cloneRewardGui'return end av=ba.OnClientEvent:
Connect(function(bb)if not ai then return end aQ()local bc=ac.
GetDungeonStartTime()and ac.GetDungeonElapsed()or 0 task.spawn(function()task.
wait(1.5)local bd,be=(aK())if aL~=nil and bd~=nil then be=math.max(0,bd-aL)end
if an then pcall(a1,bb)end local bf,bg=a8(bb,{level=aO(),expGained=be,duration=
bc})if not bf then ab.Notify('Webhook WIN','Send failed: '..tostring(bg),4)end
end)end)aj=true ab.Notify('Webhook','Webhook notifications ready',2)aY()if an
then aV()end end a2()ad.Register(function()if av then av:Disconnect()av=nil end
if ax then ax()ax=nil end aj=false end)return ag end function a.U()local aa=a.
load'T'return function(ab,ac)local ad=ac:Section{Side='Right'}ad:Header{Name=
'Discord Webhook'}ad:Input{Name='Webhook URL',Placeholder=
'https://discord.com/api/webhooks/...',AcceptedCharacters='All',Default=aa.
GetUrl(),Callback=function(ae)aa.SetUrl(ae)end}ad:Toggle({Name=
'Enable Notifications',Default=aa.IsEnabled(),Callback=function(ae)aa.
SetEnabled(ae)end},'Toggle_Webhook')ad:Toggle({Name='Show Item Potential',
Default=aa.IsShowPotential(),Callback=function(ae)aa.SetShowPotential(ae)end},
'Toggle_Webhook_Potential')ad:Button{Name='Send Test Notification',Callback=
function()aa.Send()end}local ae=ac:Section{Side='Right'}ae:Header{Name=
'Ping on Drops'}ae:Toggle({Name='Enable Ping',Default=aa.IsPingEnabled(),
Callback=function(af)aa.SetPingEnabled(af)end},'Toggle_Ping')ae:Input{Name=
'Mention (User/Role ID)',Placeholder='<@123456789012345678>',AcceptedCharacters=
'All',Default=aa.GetPingMention(),Callback=function(af)aa.SetPingMention(af)end}
ae:Dropdown{Name='Ping Tier',Multi=true,Required=false,Options=aa.
GetPingTierOptions(),Default=aa.GetPingTiers(),Callback=function(af)aa.
SetPingTiers(af)end}ae:Label{Text=
[[Ping triggers when a reward item matches any selected Tier (multi-select, Secret = Tier6).]]
}end end function a.V()local aa={}function aa.Apply(ab,ac,ad)for ae,af in pairs(
ab)do if ad and table.find(ad,ae)then continue end pcall(function()ac[ae]=af end
)end return ac end function aa.Wrap(ab,ac,ad,ae)local af={}setmetatable(af,{
__index=function(ag,ah)if ab[ah]~=nil then return ab[ah]elseif ae then local ai,
aj=pcall(function()return ae[ah]end)if ai then return aj end end return end,
__newindex=function(ag,ah,ai)local aj=ac[ah]if aj then aj(ai)if not(ad and table
.find(ad,ah))then ab[ah]=ai end elseif ae then local ak,al=pcall(function()ae[ah
]=ai end)if not ak then ab[ah]=ai end else ab[ah]=ai end end})return af end
return aa end function a.W()local aa,ab,ac,ad,ae,af=a.load'V',game:GetService
'VirtualUser',{},false,60 local ag=function()pcall(function()ab:
CaptureController()ab:Button1Down(Vector2.new(0,0))ab:Button1Up(Vector2.new(0,0)
)ab:Button2Down(Vector2.new(0,0))ab:Button2Up(Vector2.new(0,0))end)end local ah=
function()while ad do ag()local ah=ae while ah>0 and ad do local ai=math.min(ah,
0.5)task.wait(ai)ah-=ai end end af=nil end function ac.Start()if ad or af then
return end ad=true task.spawn(ag)af=task.spawn(ah)end function ac.Stop()ad=false
end function ac.IsEnabled()return ad end function ac.SetInterval(ai)ai=tonumber(
ai)if ai and ai>0 then ae=ai else ae=60 end end function ac.GetInterval()return
ae end return(aa.Wrap(ac,{Enabled=function(ai)if ai then ac.Start()else ac.Stop(
)end end,Interval=function(ai)ac.SetInterval(ai)end}))end function a.X()local aa
,ab,ac,ad,ae,af,ag=a.load'a',a.load'b',a.load'V',a.load'f',game:GetService
'Players',game:GetService'HttpService','Username'local ah=function()return(aa
and aa.Folder)or'EsclipseHub'end local ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av
,ax,ay,az,aA,aB,aC,aF=function()return ah()..'/settings/streaming_mode.json'end,
{},false,false,ag,false,false,false,{},{},{},false,{},
'rbxassetid://92481398073007',{},false,function()return ae.LocalPlayer end,
function()if not(isfolder and makefolder)then return end pcall(function()local
ai=ah()if not isfolder(ai)then makefolder(ai)end local aj=ai..'/settings'if not
isfolder(aj)then makefolder(aj)end end)end local aG,aH,aI,aJ=function()local aG=
ai()if not(isfile and isfile(aG))then return end local aH,aI=pcall(function()
return af:JSONDecode(readfile(aG))end)if aH and type(aI)=='table'then if aI.
enabled~=nil then ak=aI.enabled==true end if type(aI.replacement)=='string'and#
aI.replacement>0 then if aI.replacement=='EclipseHub'then am=ag else am=aI.
replacement end end if aI.maskStats~=nil then ap=aI.maskStats==true end end end,
function()if not(writefile and isfile)then return end aA()pcall(function()
writefile(ai(),af:JSONEncode{enabled=ak,replacement=am,maskStats=ap})end)end,
function()local aG,aH={},az()if not aH then return aG end local aI,aJ,aK=aH.Name
,aH.DisplayName,string.lower(am)if aI and#aI>=2 and string.lower(aI)~=aK then
table.insert(aG,aI)end if aJ and#aJ>=2 and string.lower(aJ)~=aK and string.
lower(aJ)~=string.lower(aI)then table.insert(aG,aJ)end table.sort(aG,function(aL
,aM)return#aL>#aM end)return aG end,function(aG,aH,aI)if#aG==0 or#aH==0 then
return aG end local aJ,aK,aL=string.lower(aG),{},1 while aL<=#aG do local aM,aN,
aO for aP,aQ in ipairs(aH)do local aS,aT=string.find(aJ,string.lower(aQ),aL,true
)if aS then if aM==nil or aS<aM or(aS==aM and#aQ>#aO)then aM=aS aN=aT aO=aQ end
end end if not aM then table.insert(aK,string.sub(aG,aL))break end if aM>aL then
table.insert(aK,string.sub(aG,aL,aM-1))end table.insert(aK,aI)aL=aN+1 end return
table.concat(aK)end local aK,aL,aM=function(aK,aL,aM)if#aK==0 or#aL==0 then
return aK end if not string.find(aK,'<')or not string.find(aK,'>')then return
aJ(aK,aL,aM)end local aN,aO={},1 while aO<=#aK do local aP,aQ=string.find(aK,
'<[^>]->',aO)if not aP then local aS=string.sub(aK,aO)table.insert(aN,aJ(aS,aL,
aM))break end if aP>aO then local aS=string.sub(aK,aO,aP-1)table.insert(aN,aJ(aS
,aL,aM))end table.insert(aN,string.sub(aK,aP,aQ))aO=aQ+1 end return table.
concat(aN)end,function(aK)return aK:IsA'TextLabel'or aK:IsA'TextButton'or aK:IsA
'TextBox'end,function()local aK={}pcall(function()if typeof(gethui)=='function'
then local aL=gethui()if aL and aL~=game:GetService'CoreGui'then table.insert(aK
,aL)end end end)pcall(function()local aL=game:GetService'CoreGui'if aL then
table.insert(aK,aL)end end)return aK end local aN=function(aN)if not aL(aN)then
return end if aN:IsA'TextBox'and aN:IsFocused()then return end local aO=aI()if#
aO==0 then return end local aP=aq[aN]if aP then local aQ=aN.Text local aS=aK(aQ,
aO,am)if aS~=aQ then aP.original=aQ an=true aN.Text=aS an=false end return end
local aQ=aN.Text local aS,aT=aK(aQ,aO,am),{original=aQ,conns={}}if aS~=aQ then
an=true aN.Text=aS an=false end local aU=aN:GetPropertyChangedSignal'Text':
Connect(function()if an then return end if not al then return end local aU,aV=aN
.Text,aI()local aW=aK(aU,aV,am)if aW~=aU then aT.original=aU an=true aN.Text=aW
an=false else aT.original=aU end end)table.insert(aT.conns,aU)if aN:IsA'TextBox'
then local aV=aN.FocusLost:Connect(function()if not al then return end local aV,
aW=aN.Text,aI()local aX=aK(aV,aW,am)if aX~=aV then aT.original=aV an=true aN.
Text=aX an=false end end)table.insert(aT.conns,aV)end local aV aV=aN.
AncestryChanged:Connect(function(aW,aX)if not aX then for aY,aZ in ipairs(aT.
conns)do pcall(function()aZ:Disconnect()end)end aq[aN]=nil end end)table.insert(
aT.conns,aV)aq[aN]=aT end local aO,aP,aQ,aS=function(aO)if not aO then return
end pcall(function()for aP,aQ in ipairs(aO:GetDescendants())do if aL(aQ)then aN(
aQ)end end end)end,function(aO)if not aO then return end local aP,aQ=pcall(
function()return aO.DescendantAdded:Connect(function(aP)if not al then return
end task.spawn(aN,aP)end)end)if aP and aQ then table.insert(ar,aQ)end end,
function()local aO=aI()for aP,aQ in pairs(aq)do for aS,aT in ipairs(aQ.conns)do
pcall(function()aT:Disconnect()end)end pcall(function()if aP and aP.Parent and
aQ.original then local aS,aT=aP.Text,aK(aQ.original,aO,am)if aS==aT then an=true
aP.Text=aQ.original an=false end end end)end table.clear(aq)end,function()if aB
and typeof(aB.SetUserInfoState)=='function'then pcall(function()aB:
SetUserInfoState(not ak)end)end end function aj.Start()ak=true aH()if al then
return end al=true local aT=az()if aT then local aU=aT:FindFirstChild'PlayerGui'
if aU then aO(aU)aP(aU)else local aV aV=aT.ChildAdded:Connect(function(aW)if aW.
Name=='PlayerGui'then if aV then aV:Disconnect()end if al then aO(aW)aP(aW)end
end end)table.insert(ar,aV)end if aT.Character then aO(aT.Character)aP(aT.
Character)end local aV=aT.CharacterAdded:Connect(function(aV)if not al then
return end task.wait(0.2)if not al then return end aO(aV)aP(aV)end)table.insert(
ar,aV)end pcall(function()local aU=workspace.DescendantAdded:Connect(function(aU
)if not al then return end if aU:IsA'BillboardGui'or aU:IsA'SurfaceGui'then for
aV,aW in ipairs(aU:GetDescendants())do aN(aW)end local aV=aU.DescendantAdded:
Connect(function(aV)if not al then return end aN(aV)end)table.insert(ar,aV)end
end)table.insert(ar,aU)end)for aU,aV in ipairs(aM())do aO(aV)aP(aV)end aS()task.
spawn(function()for aU,aV in ipairs{0.3,0.8,1.5,3}do task.wait(aV)if not al then
break end local aW=az()if aW then local aX=aW:FindFirstChild'PlayerGui'if aX
then aO(aX)end if aW.Character then aO(aW.Character)end end for aX,aY in ipairs(
aM())do aO(aY)end end end)if aC then pcall(task.cancel,aC)end aC=task.spawn(
function()while al do task.wait(0.5)if not al then break end local aU=az()if aU
then local aV=aU:FindFirstChild'PlayerGui'if aV then aO(aV)end if aU.Character
then aO(aU.Character)end end for aV,aW in ipairs(aM())do aO(aW)end end end)end
function aj.Stop()ak=false aH()if not al then return end al=false if aC then
pcall(task.cancel,aC)aC=nil end for aT,aU in ipairs(ar)do pcall(function()aU:
Disconnect()end)end table.clear(ar)aQ()aS()end function aj.IsEnabled()return ak
end function aj.IsRunning()return al end local aT={k=1e3,m=1e6,b=1e9,t=1e12,qa=
1e15,qi=1e18}local aU=function(aU)if not aU then return nil end local aV=string.
gsub(aU,'[,%s]','')local aW,aX=string.match(aV,'^([%-%d.]+)%s*(%a*)$')if not aW
then return nil end local aY=tonumber(aW)if not aY then return nil end if aX and
#aX>0 then local aZ=aT[string.lower(aX)]if aZ then aY=aY*aZ end end return aY
end local aV=function(aV)if not aV or#aV==0 then return nil end local aW=string.
gsub(aV,'<[^>]->','')local aX,aY=string.match(aW,
'^%s*([%-%d.,]+%s*%a*)%s*/%s*([%-%d.,]+%s*%a*)%s*$')if not aX or not aY then
return nil end local aZ,a_=aU(aX),aU(aY)if not aZ or not a_ or a_<=0 then return
nil end local a0=math.clamp((aZ/a_)*100,0,100)if a0==math.floor(a0)then return
string.format('%d%%',a0)else return string.format('%.1f%%',a0)end end
local function aW(aX,aY,aZ)local a_=aZ or 6 if a_<0 or not aX then return nil
end local a0=aX:FindFirstChild(aY)if a0 then return a0 end for a1,a2 in ipairs(
aX:GetChildren())do local a3=aW(a2,aY,a_-1)if a3 then return a3 end end return
nil end local aX,aY=function()local aX=az()if not aX then return{}end local aY=
aX:FindFirstChild'PlayerGui'if not aY then return{}end local aZ=aY:
FindFirstChild'playerStatus'if not aZ then return{}end local a_=aZ:
FindFirstChild'Frame'if not a_ then return{}end local a0,a1,a2={},(a_:
FindFirstChild'xpFrame')if a1 then a2=a1:FindFirstChild'xp'if not(a2 and a2:IsA
'TextLabel')then a2=a1:FindFirstChildWhichIsA'TextLabel'end end if not a2 then
local a3=aW(a_,'xp',4)if a3 and a3:IsA'TextLabel'then a2=a3 end end if a2 and a2
:IsA'TextLabel'then table.insert(a0,a2)end local a3,a4=a_:FindFirstChild
'healthFrame'or a_:FindFirstChild'hpFrame'if a3 then a4=a3:FindFirstChild
'health'or a3:FindFirstChild'hp'if not(a4 and a4:IsA'TextLabel')then a4=a3:
FindFirstChildWhichIsA'TextLabel'end end if not a4 then local a5=aW(a_,'health',
4)or aW(a_,'hp',4)if a5 and a5:IsA'TextLabel'then a4=a5 end end if a4 and a4:IsA
'TextLabel'then table.insert(a0,a4)end local a5,a6=(a_:FindFirstChild
'levelBorder')if a5 then a6=a5:FindFirstChild'level'if not(a6 and a6:IsA
'TextLabel')then a6=a5:FindFirstChildWhichIsA'TextLabel'end end if not a6 then
local a7=aW(a_,'level',4)if a7 and a7:IsA'TextLabel'then a6=a7 end end if a6 and
a6:IsA'TextLabel'then table.insert(a0,a6)end return a0 end,function(aX)if aX.
Name=='level'then return true end if aX.Parent and aX.Parent.Name=='levelBorder'
then return true end return false end local aZ,a_,a0=function(aZ,a_)if aY(aZ)
then return'???'end return aV(a_)end,function(aZ)pcall(function()aZ.FontFace=
Font.fromName('GothamSSm',Enum.FontWeight.Bold)end)pcall(function()aZ.Font=Enum.
Font.GothamBold end)end,function(aZ,a_)pcall(function()if a_.originalFontFace
then aZ.FontFace=a_.originalFontFace elseif a_.originalFont then aZ.Font=a_.
originalFont end end)end local a1,a2,a3,a4,a5=function(a1)if not a1 or not a1:
IsA'TextLabel'then return end if as[a1]then return end local a2=a1.Text local a3
,a4=aZ(a1,a2),{original=a2,originalFontFace=a1.FontFace,originalFont=a1.Font,
conn=nil}if aY(a1)then local a5=tonumber(tostring(a2):match'%d+')if a5 and a5>0
then local a6=tostring(a5)pcall(function()a1:SetAttribute('RealLevel',a6)end)if
ad and ad.SetRealPlayerLevel then ad.SetRealPlayerLevel(a6)end _G.
RealPlayerLevel=a6 end end a_(a1)if a3 and a3~=a2 then at=true a1.Text=a3 at=
false end local a5=a1:GetPropertyChangedSignal'Text':Connect(function()if at
then return end if not ap then return end local a5=a1.Text local a6=aZ(a1,a5)a_(
a1)if a6 and a6~=a5 then a4.original=a5 if aY(a1)then local a7=tonumber(
tostring(a5):match'%d+')if a7 and a7>0 then local a8=tostring(a7)pcall(function(
)a1:SetAttribute('RealLevel',a8)end)if ad and ad.SetRealPlayerLevel then ad.
SetRealPlayerLevel(a8)end _G.RealPlayerLevel=a8 end end at=true a1.Text=a6 at=
false elseif not a6 and not string.find(a5,'%%')and a5~='???'then a4.original=a5
if aY(a1)then local a7=tonumber(tostring(a5):match'%d+')if a7 and a7>0 then
local a8=tostring(a7)pcall(function()a1:SetAttribute('RealLevel',a8)end)if ad
and ad.SetRealPlayerLevel then ad.SetRealPlayerLevel(a8)end _G.RealPlayerLevel=
a8 end end end end)a4.conn=a5 local a6 a6=a1.AncestryChanged:Connect(function(a7
,a8)if not a8 then if a4.conn then pcall(function()a4.conn:Disconnect()end)end
pcall(function()a6:Disconnect()end)as[a1]=nil end end)as[a1]=a4 end,function()
for a1,a2 in pairs(as)do if a2.conn then pcall(function()a2.conn:Disconnect()end
)end pcall(function()if a1 and a1.Parent then if a2.original then at=true a1.
Text=a2.original at=false end a0(a1,a2)end end)end table.clear(as)end,function()
local a1=az()if not a1 then return nil end local a2=a1:FindFirstChild'PlayerGui'
if not a2 then return nil end local a3=a2:FindFirstChild'playerStatus'if not a3
then return nil end local a4=a3:FindFirstChild'Frame'if not a4 then return nil
end local a5=a4:FindFirstChild'portraitBorder'if a5 then local a6=a5:
FindFirstChild'portrait'if a6 and a6:IsA'ImageLabel'then return a6 end local a7=
a5:FindFirstChildWhichIsA'ImageLabel'if a7 then return a7 end end local a6=aW(a4
,'portrait',4)if a6 and a6:IsA'ImageLabel'then return a6 end return nil end,
function(a1)if not a1 or not a1:IsA'ImageLabel'then return end if ax[a1]then
return end local a2=a1.Image local a3={originalImage=a2,conn=nil}if a2~=av then
ay=true a1.Image=av ay=false end local a4=a1:GetPropertyChangedSignal'Image':
Connect(function()if ay then return end if not ap then return end local a4=a1.
Image if a4~=av then a3.originalImage=a4 ay=true a1.Image=av ay=false end end)a3
.conn=a4 local a5 a5=a1.AncestryChanged:Connect(function(a6,a7)if not a7 then if
a3.conn then pcall(function()a3.conn:Disconnect()end)end pcall(function()a5:
Disconnect()end)ax[a1]=nil end end)ax[a1]=a3 end,function()for a1,a2 in pairs(ax
)do if a2.conn then pcall(function()a2.conn:Disconnect()end)end pcall(function()
if a1 and a1.Parent and a2.originalImage then ay=true a1.Image=a2.originalImage
ay=false end end)end table.clear(ax)end local a6=function()if not ap then return
end local a6=aX()for a7,a8 in ipairs(a6)do a1(a8)if as[a8]then a_(a8)end end
local a7=a3()if a7 then a4(a7)if ax[a7]and a7.Image~=av then ay=true a7.Image=av
ay=false end end end local a7,a8=function()if aF then return end a6()aF=task.
spawn(function()while ap do a6()task.wait(0.5)end aF=nil end)end,function()if aF
then pcall(task.cancel,aF)aF=nil end for a7,a8 in ipairs(au)do pcall(function()
a8:Disconnect()end)end table.clear(au)a2()a5()end function aj.SetMaskStats(a9)ap
=a9==true aH()if ap then a7()else a8()end end function aj.IsMaskStats()return ap
end function aj.SetReplacement(a9)if typeof(a9)~='string'or#a9==0 then a9=ag end
if am==a9 then return end local b=al if b then aj.Stop()end am=a9 aH()if b then
aj.Start()end end function aj.GetReplacement()return am end function aj.
SetWindow(a9)aB=a9 if al or ak then aS()end end function aj.Init()if ao then
return end ao=true if ak and not al then aj.Start()end if ap then a7()end end
function aj.GetRealLevel()for a9,b in pairs(as)do if aY(a9)and b.original then
local ba=tonumber(tostring(b.original):match'%d+')if ba and ba>0 then return
tostring(ba)end end end if _G.RealPlayerLevel then return _G.RealPlayerLevel end
return nil end aG()ab.Register(function()if al then aj.Stop()end if ap then a8()
end ao=false end)return(ac.Wrap(aj,{Enabled=function(a9)if a9 then aj.Start()
else aj.Stop()end end,Replacement=function(a9)aj.SetReplacement(a9)end,MaskStats
=function(a9)aj.SetMaskStats(a9)end}))end function a.Y()local aa,ab,ac,ad=a.load
'd',a.load'A',a.load'W',a.load'X'return function(ae,af)local ag=af:Section{Side=
'Left'}ag:Header{Name='Anti AFK'}ag:Toggle({Name='Anti AFK',Default=ac.
IsEnabled(),Callback=aa.Wrap(function(ah)if ah then ac.Start()else ac.Stop()end
end)},'Toggle_AntiAFK')ab.PatchSliderLoadCallback(ag:Slider({Name=
'Interval (seconds)',Default=ac.GetInterval(),Minimum=5,Maximum=300,
DisplayMethod='Round',Precision=0,Callback=aa.Wrap(function(ah)ac.SetInterval(ah
)end)},'Slider_AntiAFKInterval'))local ah=af:Section{Side='Right'}ah:Header{Name
='Streaming Mode'}ah:Toggle({Name='Streaming Mode (Hide Identity)',Default=ad.
IsEnabled(),Callback=aa.Wrap(function(ai)if ai then ad.Start()else ad.Stop()end
end)},'Toggle_StreamingMode')ah:Toggle({Name='Hide Stats (Level, XP, HP)',
Default=ad.IsMaskStats(),Callback=aa.Wrap(function(ai)ad.SetMaskStats(ai)end)},
'Toggle_StreamingMaskStats')ah:Input({Name='Fake Display Name',Placeholder=
'Username',AcceptedCharacters='All',Default=ad.GetReplacement(),Callback=aa.
Wrap(function(ai)ad.SetReplacement(ai)end)},'Input_StreamingReplacement')end end
function a.Z()return function(aa,ab)a.load'S'(aa,ab)a.load'U'(aa,ab)a.load'Y'(aa
,ab)end end function a._()local aa,ab,ac=a.load'a',a.load'c',game:GetService
'HttpService'local ad,ae,af,ag=aa.Folder..'/settings/autohide.json',{},false
local ah,ai=function()if not(isfile and isfile(ad))then return end local ah,ai=
pcall(function()return ac:JSONDecode(readfile(ad))end)if ah and type(ai)==
'table'then af=ai.enabled==true end end,function()if not(isfile and writefile)
then return end pcall(function()writefile(ad,ac:JSONEncode{enabled=af})end)end
function ae.SetWindow(aj)ag=aj end function ae.SetEnabled(aj)af=aj==true ai()end
function ae.IsEnabled()return af end function ae.Hide()if not af or not ag then
return end local aj=pcall(function()ag:SetState(false)end)if not aj then warn
'[AutoHide] Kh\u{f4}ng \u{1ea9}n \u{111}\u{1b0}\u{1ee3}c window'end end function
ae.Execute()if not af then return end task.spawn(function()task.wait(0.5)ae.
Hide()end)end ah()return ae end function a.aa()local aa,ab,ac,ad=a.load'a',a.
load'd',a.load'_',a.load'g'return function(ae,af)local ag=aa.Folder local ah=ag
..'/settings/autoload.txt'local ai,aj,ak=function()if isfile and isfile(ah)then
local ai,aj=pcall(readfile,ah)if ai and type(aj)=='string'then aj=string.gsub(aj
,'[\r\n%s]+','')if#aj>0 then return aj end end end return nil end,function(ai)ab
.SetActive(ai)local aj=a.load'p'aj.LoadData(aa.contextData)if autoloadLabel then
pcall(function()autoloadLabel:UpdateName('Autoload config: '..ai)end)end end,af:
Section{Side='Left'}ak:Header{Name='Configs'}local al,am,an local ao=function(ao
)local ap=aa:RefreshConfigList()am:ClearOptions()am:InsertOptions(ap)if ao then
if not am:IsOption(ao)then am:InsertOptions{ao}end am:UpdateSelection(ao)end end
ak:Input{Name='Config Name',Placeholder='Name',AcceptedCharacters='All',Callback
=function(ap)al=ap end}am=ak:Dropdown{Name='Select Config',Multi=false,Required=
false,Options=aa:RefreshConfigList(),Callback=function(ap)end}local ap=ai()if ap
and ap~=''then if not am:IsOption(ap)then am:InsertOptions{ap}end am:
UpdateSelection(ap)aj(ap)end ak:Button{Name='Create Config',Callback=function()
if not al or string.gsub(al,' ','')==''then ae:Notify{Title='Interface',
Description='Config name cannot be empty.'}return end local aq,ar=aa:SaveConfig(
al)if not aq then ae:Notify{Title='Interface',Description=
'Unable to save config: '..tostring(ar)}return end ae:Notify{Title='Interface',
Description=string.format('Created config %q',al)}ao(al)aj(al)end}ak:Button{Name
='Load Config',Callback=function()local aq=am.Value if not aq or aq==''then ae:
Notify{Title='Interface',Description='Please select a config first.'}return end
ab.Suspend()ad.SetLocked(true)local ar,as=aa:LoadConfig(aq)if not ar then ad.
SetLocked(false)ab.Resume()ae:Notify{Title='Interface',Description=
'Unable to load config: '..tostring(as)}return end aj(aq)task.delay(0.5,function
()ad.SetLocked(false)end)task.delay(1.5,function()ab.Resume()end)ae:Notify{Title
='Interface',Description=string.format('Loaded config %q',aq)}end}ak:Button{Name
='Overwrite Config',Callback=function()local aq=am.Value if not aq or aq==''then
ae:Notify{Title='Interface',Description='Please select a config first.'}return
end local ar,as=aa:SaveConfig(aq)if not ar then ae:Notify{Title='Interface',
Description='Unable to overwrite config: '..tostring(as)}return end aj(aq)ae:
Notify{Title='Interface',Description=string.format('Overwrote config %q',aq)}end
}ak:Button{Name='Set as autoload',Callback=function()local aq=am.Value if not aq
then ae:Notify{Title='Interface',Description='Please select a config first.'}
return end writefile(ah,aq)an:UpdateName('Autoload config: '..aq)ae:Notify{Title
='Interface',Description=string.format('Set %q as autoload',aq)}aj(aq)end}ak:
Button{Name='Refresh Config List',Callback=function()ao(am.Value)end}an=ak:Label
{Text='Autoload config: None'}local aq=ai()if aq and aq~=''then an:UpdateName(
'Autoload config: '..aq)end ak:Header{Name='Auto Hide UI'}ak:Toggle({Name=
'Hide window after execute',Default=ac.IsEnabled(),Callback=function(ar)ac.
SetEnabled(ar)end},'Toggle_AutoHide')ak:Label{Text=
'Press RightControl to show the window again.'}end end function a.ab()local aa,
ab,ac,ad,ae,af=a.load'f',a.load'L','Boss Active','Boss','Dungeon','Time Left'
return function(ag,ah)local ai=ah:Section{Side='Right'}ai:Header{Name='Status'}
local aj=ai:Label{Text=ac..': '..(aa.IsBossActive()and'Yes'or'No')}local ak=
function(ak)local al=ak and'0, 255, 0'or'255, 80, 80'aj:UpdateName(ac..
": <font color='rgb("..al..")'>"..(ak and'Yes'or'No')..'</font>')end ak(aa.
IsBossActive())aa.OnBossActiveChanged(function(al)ak(al)end)local al=ai:Label{
Text=ad..': 0'}local am=function()al:UpdateName(ad..': '..aa.
GetCurrentBossIndex())end am()aa.OnBossIndexChanged(function()am()end)local an=
ai:Label{Text='Room: --'}local ao=function()local ao=aa.GetCurrentRoomIndex()if
ao<=0 then an:UpdateName"Room: <font color='rgb(160, 160, 160)'>--</font>"return
end local ap=ao>=100 local aq=ap and'255, 200, 80'or'0, 255, 0'an:UpdateName(
"Room: <font color='rgb("..aq..")'>"..tostring(ao)..'</font>')end ao()aa.
OnRoomIndexChanged(function()ao()end)local ap=ai:Label{Text='Enemies: 0'}local
aq=function()if not aa.IsInLobby()and not aa.GetCurrentDungeonName()then ap:
UpdateName"Enemies: <font color='rgb(160, 160, 160)'>--</font>"return end local
aq=aa.GetEnemyCount()local ar=aq>0 and'0, 255, 0'or'255, 80, 80'ap:UpdateName(
"Enemies: <font color='rgb("..ar..")'>"..aq..'</font>')end ai:Header{Name=
'Timer'}local ar=ai:Label{Text=af..': --'}local as=function()local as=ab.
GetTimeLeft()if not as then ar:UpdateName(af..
": <font color='rgb(160, 160, 160)'>--</font>")return end local at=math.floor(as
)local au,av=string.format('%d:%02d',math.floor(at/60),at%60),ab.
GetTimeRetryEnabled()and as<ab.GetTimeRetryThreshold()local ax=av and
'255, 80, 80'or'0, 255, 0'ar:UpdateName(af..": <font color='rgb("..ax..")'>"..au
..'</font>')end aq()as()local at task.spawn(function()while task.wait(0.5)do ak(
aa.IsBossActive())am()ao()aq()at()as()end end)ai:Header{Name='Level Info'}local
au=ai:Label{Text=ae..': Unknown'}local av=function()local av=aa.
GetCurrentDungeonName()if av then au:UpdateName(ae..': '..av)else au:UpdateName(
ae..": <font color='rgb(255, 80, 80)'>Unknown</font>")end end av()aa.
OnDungeonNameChanged(function()av()end)ai:Header{Name='Lobby / Dungeon'}local ax
=ai:Label{Text='Lobby: Unknown'}at=function()local ay=aa.IsInLobby()local az=ay
and'0, 255, 0'or'255, 80, 80'ax:UpdateName("Lobby: <font color='rgb("..az..")'>"
..(ay and'Yes'or'No')..'</font>')end at()aa.OnLobbyChanged(function()at()end)ai:
Button{Name='Log Enemy Types to Console',Callback=function()local ay=aa.
GetEnemyNames()print('[DungeonQuest] Enemy types in map ('..#ay..'):')if#ay==0
then print'  (no enemies found)'else for az,aA in ipairs(ay)do print('  - '..aA)
end end end}end end function a.ac()return function(aa,ab)a.load'aa'(aa,ab)a.load
'ab'(aa,ab)end end function a.ad()local aa,ab,ac=a.load'e',a.load'a',a.load'd'
local ad,ae,af,ag,ah,ai,aj=aa.HttpService or game:GetService'HttpService',{},
'DQMacro','pathRecord',3,'normal','full'local ak,al,am,an,ao=function(ak)if ak==
aj then return aj end return ai end,(isfile~=nil and writefile~=nil and
makefolder~=nil and isfolder~=nil),{},false,{}local ap,aq=function()for ap=#ao,1
,-1 do pcall(ao[ap])end end,function()local ap=ab.Folder or'EsclipseHub'return
ap..'/'..af end local ar,as=function()if not al then return end pcall(function()
local ar=ab.Folder or'EsclipseHub'if not isfolder(ar)then makefolder(ar)end
local as=aq()if not isfolder(as)then makefolder(as)end end)end,function(ar)if
type(ar)~='string'then return'Unknown'end return(string.gsub(ar,'[/\\:*?"<>|]',
'_'))end local at,au,av,ax,ay=function(at)return aq()..'/'..as(at)..'.json'end,
function(at)if not at then return nil end return{X=math.round(at.X*100)/100,Y=
math.round(at.Y*100)/100,Z=math.round(at.Z*100)/100}end,function(at)if not at or
type(at)~='table'then return nil end return Vector3.new(at.X or 0,at.Y or 0,at.Z
or 0)end,function(at)return type(at)=='table'and type(at.points)=='table'and#at.
points>0 end,function(at)if type(at)~='table'or type(at.X)~='number'then return
nil end local au=Vector3.new(at.X,0,at.Z)if au.Magnitude<0.001 then return nil
end return au.Unit end local az,aA,aB,aC,aF,aG=function(az)if type(az)~='table'
then return nil end local aA={}for aB,aC in ipairs(az.dwells or{})do local aF=
av(aC.pos)if aF then aA[#aA+1]={pos=aF,dur=tonumber(aC.dur)or 0,facing=ay(aC.
facing)}end end local aB={}for aC,aF in ipairs(az.skills or{})do local aG=av(aF.
pos)if aG then aB[#aB+1]={pos=aG,facing=ay(aF.facing),key=aF.key,dw=math.floor(
tonumber(aF.dw)or 0),dwT=tonumber(aF.dwT)or 0}end end if#aA==0 and#aB==0 then
return nil end return{dwells=aA,skills=aB}end,function()if an then return end an
=true if al then ar()local az=aq()if isfolder'DQMacro'and listfiles then pcall(
function()local aA=listfiles'DQMacro'if type(aA)=='table'then for aB,aC in
ipairs(aA)do if type(aC)=='string'and string.lower(string.sub(aC,-5))=='.json'
and isfile(aC)then local aF=string.match(aC,'([^/\\]+)$')or'unknown.json'local
aG,aH=az..'/'..aF,readfile(aC)writefile(aG,aH)delfile(aC)end end end end)end if
listfiles and isfolder(az)then local aA,aB=pcall(function()return listfiles(az)
end)if aA and type(aB)=='table'then for aC,aF in ipairs(aB)do if type(aF)==
'string'and string.lower(string.sub(aF,-5))=='.json'then pcall(function()if
isfile(aF)then local aG=readfile(aF)local aH=ad:JSONDecode(aG)if type(aH)==
'table'and type(aH.map)=='string'and type(aH.rooms)=='table'then am[aH.map]=aH
end end end)end end end end local aA=ab.contextData if type(aA)=='table'and
type(aA[ag])=='table'then local aB,aC=aA[ag],false for aF,aG in pairs(aB)do if
type(aF)=='string'and type(aG)=='table'then if not am[aF]then am[aF]=aG end
pcall(function()writefile(at(aF),ad:JSONEncode(aG))end)aC=true end end if aC
then aA[ag]=nil ac.Save()end end else local az=ab.contextData if type(az)==
'table'and type(az[ag])=='table'then for aA,aB in pairs(az[ag])do if type(aA)==
'string'and type(aB)=='table'then am[aA]=aB end end end end end,0.1,0.82,0.3,
function(az,aA)local aB,aC=az.X-aA.X,az.Z-aA.Z return math.sqrt(aB*aB+aC*aC)end
function ae.SimplifyPath(aH,aI)local aJ=#aH if aJ<=2 then return aH end local aK
={}for aL=1,aJ do aK[aL]=false end aK[1]=true aK[aJ]=true local aL={1}for aM=2,
aJ-1 do local aN,aO,aP=aH[aM-1],aH[aM],aH[aM+1]local aQ,aS=aO.X-aN.X,aO.Z-aN.Z
local aT,aU,aV=math.sqrt(aQ*aQ+aS*aS),aP.X-aO.X,aP.Z-aO.Z local aW=math.sqrt(aU*
aU+aV*aV)if aT>=aF and aW>=aF then local aX=(aQ*aU+aS*aV)/(aT*aW)if aX<aC then
aK[aM]=true table.insert(aL,aM)end end end table.insert(aL,aJ)local aM,aN=aI*aI,
{}for aO=1,#aL-1 do local aP,aQ=aL[aO],aL[aO+1]if aQ-aP>1 then table.insert(aN,{
aP,aQ})end end while#aN>0 do local aO=table.remove(aN)local aP,aQ=aO[1],aO[2]
local aS,aT,aU,aV=aH[aP].X,aH[aP].Z,aH[aQ].X,aH[aQ].Z local aW,aX=aU-aS,aV-aT
local aY,aZ,a_=aW*aW+aX*aX,-1,0 for a0=aP+1,aQ-1 do local a1=0 if aY>0 then a1=(
(aH[a0].X-aS)*aW+(aH[a0].Z-aT)*aX)/aY a1=math.clamp(a1,0,1)end local a2,a3=aH[a0
].X-(aS+aW*a1),aH[a0].Z-(aT+aX*a1)local a4=a2*a2+a3*a3 if a4>aZ then aZ=a4 a_=a0
end end if a_>0 and aZ>aM then aK[a_]=true table.insert(aN,{aP,a_})table.insert(
aN,{a_,aQ})end end local aO={}for aP=1,aJ do if aK[aP]and(#aO==0 or aG(aO[#aO],
aH[aP])>=aB or aP==aJ)then table.insert(aO,aH[aP])end end if#aO==1 then table.
insert(aO,aH[aJ])end return aO end function ae.OnChanged(aH)if type(aH)~=
'function'then return function()end end table.insert(ao,aH)return function()for
aI,aJ in ipairs(ao)do if aJ==aH then table.remove(ao,aI)break end end end end
function ae.HasMap(aH)if type(aH)~='string'or#aH==0 then return false end aA()
local aI=am[aH]if not aI or type(aI.rooms)~='table'then return false end for aJ,
aK in pairs(aI.rooms)do if ax(aK)and#aK.points>0 then return true end end return
false end function ae.GetRoomSegment(aH,aI)if type(aH)~='string'or type(aI)~=
'number'then return nil end aA()local aJ=am[aH]if not aJ or type(aJ.rooms)~=
'table'then return nil end local aK=aJ.rooms[tostring(aI)]if not ax(aK)then
return nil end local aL={}for aM,aN in ipairs(aK.points)do local aO=av(aN)if aO
then aL[#aL+1]=aO end end if#aL==0 then return nil end return{startPos=av(aK.
startPos)or aL[1],points=aL,events=aK.events and az(aK.events)or nil,speed=
tonumber(aK.speed)or 0,boss=aK.boss==true}end function ae.HasSegmentOrMacro(aH,
aI)return ae.GetRoomSegment(aH,aI)~=nil end function ae.GetMap(aH)if not ae.
HasMap(aH)then return nil end aA()local aI=am[aH]if not aI then return nil end
local aJ={}for aK,aL in pairs(aI.rooms or{})do local aM=tonumber(aK)if aM and
ax(aL)then local aN=ae.GetRoomSegment(aH,aM)if aN then aJ[aM]=aN end end end
return{map=aH,version=aI.version,rooms=aJ,created=aI.created,updated=aI.updated,
mode=ak(aI.mode)}end function ae.GetMaps()aA()local aH={}for aI,aJ in pairs(am)
do if type(aI)=='string'and type(aJ)=='table'and aJ.map==aI and type(aJ.rooms)==
'table'then local aK,aL,aM=0,0,0 for aN,aO in pairs(aJ.rooms)do if tonumber(aN)
~=nil and ax(aO)then aK+=1 if aO.boss==true then aL+=1 end aM+=#aO.points end
end if aK>0 then table.insert(aH,{map=aI,roomCount=aK,bossCount=aL,pointCount=aM
,updated=aJ.updated,mode=ak(aJ.mode)})end end end table.sort(aH,function(aI,aJ)
return aI.map<aJ.map end)return aH end function ae.Count()return#ae.GetMaps()end
function ae.SaveSegment(aH,aI,aJ,aK,aL,aM,aN)if type(aH)~='string'or#aH==0 then
return false end if type(aI)~='number'or aI<=0 then return false end if not aJ
or not aK or#aK==0 then return false end aA()local aO=am[aH]if not aO or type(aO
)~='table'then aO={map=aH,version=ah,created=os.time(),updated=os.time(),mode=ai
,rooms={}}am[aH]=aO end if type(aO.rooms)~='table'then aO.rooms={}end local aP={
}for aQ,aS in ipairs(aK)do aP[#aP+1]=au(aS)end local aQ={startPos=au(aJ)or aP[1]
,points=aP}if aN then aQ.boss=true end if type(aM)=='number'and aM>0 then aQ.
speed=aM end local aS=function(aS)if not aS or type(aS)~='table'then return nil
end local aT,aU=#(aS.dwells or{}),#(aS.skills or{})if aT==0 and aU==0 then
return nil end local aV={dwells={},skills={}}for aW,aX in ipairs(aS.dwells or{})
do aV.dwells[#aV.dwells+1]={pos=au(aX.pos),dur=aX.dur or 0,facing=aX.facing}end
for aW,aX in ipairs(aS.skills or{})do aV.skills[#aV.skills+1]={pos=au(aX.pos),
facing=aX.facing,key=aX.key,dw=aX.dw or 0,dwT=aX.dwT or 0}end return aV end if
aL and type(aL)=='table'then local aT=aS(aL)if aT then aQ.events=aT end end aO.
rooms[tostring(aI)]=aQ aO.version=ah aO.map=aH aO.updated=os.time()if al then
ar()pcall(function()writefile(at(aH),ad:JSONEncode(aO))end)else local aT=ab.
contextData if type(aT)=='table'then if not aT[ag]then aT[ag]={}end aT[ag][aH]=
aO ac.Save()end end ap()return true end function ae.GetMapMode(aH)if type(aH)~=
'string'or#aH==0 then return ai end aA()local aI=am[aH]if type(aI)~='table'then
return ai end return ak(aI.mode)end function ae.SetMapMode(aH,aI)if type(aH)~=
'string'or#aH==0 then return false end local aJ=ak(aI)aA()local aK=am[aH]if not
aK or type(aK)~='table'then aK={map=aH,version=ah,created=os.time(),updated=os.
time(),mode=ai,rooms={}}am[aH]=aK end aK.mode=aJ aK.map=aH aK.updated=os.time()
if al then ar()pcall(function()writefile(at(aH),ad:JSONEncode(aK))end)else local
aL=ab.contextData if type(aL)=='table'then if not aL[ag]then aL[ag]={}end aL[ag]
[aH]=aK ac.Save()end end ap()return true end function ae.RemoveMap(aH)aA()if not
am[aH]then return false end am[aH]=nil if al then local aI=at(aH)pcall(function(
)if isfile(aI)then delfile(aI)end end)else local aI=ab.contextData if type(aI)==
'table'and aI[ag]then aI[ag][aH]=nil ac.Save()end end ap()return true end
function ae.ClearAll()aA()if next(am)==nil then return end local aH=aq()if al
and isfolder(aH)and listfiles then pcall(function()local aI=listfiles(aH)if
type(aI)=='table'then for aJ,aK in ipairs(aI)do if type(aK)=='string'and string.
lower(string.sub(aK,-5))=='.json'and isfile(aK)then delfile(aK)end end end end)
end table.clear(am)local aI=ab.contextData if type(aI)=='table'and aI[ag]then aI
[ag]=nil ac.Save()end ap()end function ae.ReloadFromDisk()table.clear(am)an=
false aA()ap()end function ae.ReloadFromConfig()ae.ReloadFromDisk()end return ae
end function a.ae()local aa,ab,ac,ad,ae=a.load'e',a.load'f',a.load'ad',a.load'd'
,a.load'c'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar=aa.RunService,aa.player,
aa.UserInputService,0.1,8000,0.4,0.1,1.5,1,6,{},true,true function ap.SetCapture
(as)as=as and true or false aq=as ar=as end function ap.IsCaptureEnabled()return
aq or ar end local as,at,au,av,ax,ay,az,aA,aB,aC,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,
aP,aQ,aS,aT,aU,aV,aW,aX,aY,aZ=false,0,{},0,{},{},0,false,0,0,false,false,false,0
,0,0,{}local a_,a0=function()local a_={recording=as,map=aM,room=at,pointCount=#
au,dwellCount=#ax,skillCount=#ay,savedRooms=aI}for a0,a1 in ipairs(aL)do pcall(
a1,a_)end end,function()local a_=ag and ag.Character local a0=a_ and a_:
FindFirstChild'HumanoidRootPart'if a0 and a0.Parent then return a0 end return
nil end local a1,a2,a3,a4=function()local a1=a0()if not a1 then return nil end
local a2=a1.CFrame.LookVector if a2.Magnitude<0.001 then return nil end return{X
=a2.X/a2.Magnitude,Z=a2.Z/a2.Magnitude}end,function()if aO then aO:Disconnect()
aO=nil end if aP then aP:Disconnect()aP=nil end if aQ then aQ()aQ=nil end if aS
then aS()aS=nil end if aT then aT()aT=nil end if respawnConnection then
respawnConnection()respawnConnection=nil end end,function(a1)au={a1}ax={}ay={}aU
=nil az=0 aV=nil aW=nil aX=nil aY=a1 aB=0 aC=0 av=os.clock()aZ=os.clock()aA=
false end,function()aM=nil at=0 aN=nil au={}ax={}ay={}aU=nil az=0 aV=nil aW=nil
aX=nil aY=nil aA=false aB=0 aC=0 aZ=nil aG=false aH=false aF=false aI=0 aJ=0 aK=
0 end local a5,a6=function(a5,a6)at=a5 aN=a6 aH=true a3(a6)aG=ab.IsBossActive()
end,function(a5,a6)if not aH then return nil end local a7=ac.SimplifyPath(au,ak)
if#a7<2 then return nil end local a8 if#ax>0 or#ay>0 then a8={dwells=ax,skills=
ay}end local a9=0 if aC>0.5 and aB>5 then a9=math.clamp(aB/aC,5,100)end local b=
ac.SaveSegment(aM,at,aN,a7,a8,a9,aG)if not b then return nil end aI+=1 aK+=#au
if aG then aJ+=1 end if not a6 then local ba=''if a8 then ba=(
' (%d smooth pts, %d skills, %d dwells, %.1f spd)'):format(#a7,#(a8.skills or{})
,#(a8.dwells or{}),a9)else ba=(' (%d smooth pts, %.1f spd)'):format(#a7,a9)end
ae.Notify('Path Record',('Saved room %d%s to map [%s] %s'):format(at,ba,aM,a5
and('- '..a5)or''),3)end return{points=a7,events=a8,speed=a9}end function ap.
IsRecording()return as end function ap.GetStartRoom()return at end function ap.
GetCurrentPoints()return au end function ap.GetCurrentDwells()return ax end
function ap.GetCurrentSkills()return ay end function ap.GetStatus()return{
recording=as,map=aM,room=at,pointCount=#au,dwellCount=#ax,skillCount=#ay,
savedRooms=aI}end function ap.OnStatusChanged(a7)if type(a7)~='function'then
return function()end end table.insert(aL,a7)return function()for a8,a9 in
ipairs(aL)do if a9==a7 then table.remove(aL,a8)break end end end end function ap
.Start()if as then return false,'already recording'end local a7=a0()if not a7
then return false,'no character found'end if ab.IsDead()then return false,
'character is dead'end local a8=ab.GetCurrentRoomIndex()if a8<=0 then return
false,'not inside a dungeon'end local a9=ab.GetCurrentDungeonName()if not a9 or#
a9==0 then return false,'unable to identify map'end aF=ac.GetMapMode(a9)=='full'
if ab.IsBossActive()and not aF then return false,
'boss room (use Hazard Scanner)'end aM=a9 a5(a8,a7.Position)as=true ad.
SetRecording(true)aI=0 aJ=0 aK=0 aO=af.Heartbeat:Connect(function()if not as
then return end if ab.IsDead()then aV=nil aU=nil aY=nil ap.Stop'player died'
return end local b=a0()if not b then return end local ba,bb=b.Position,au[#au]if
bb and(ba-bb).Magnitude>35 then if not aF then ap.Stop'large teleport'return end
a6('large teleport',true)local bc=ab.GetCurrentRoomIndex()if bc==at then bc=0
end a5(bc,ba)a_()task.spawn(function()task.wait(ao)if as and at<=0 then ap.Stop
'end of map'end end)return end local bc,bd=os.clock(),aY and(ba-aY).Magnitude or
0 aY=ba local be=aZ and math.max(0.0001,bc-aZ)or 0.016 aZ=bc local bf=be>0 and(
bd/be)or 0 if bf>=am then aB+=bd aC+=be aV=nil aU=nil else if aq then if not aV
then aV=bc aW=ba aX=a1()end if aU then aU.dur=bc-aV aU.facing=a1()or aX elseif
bc-aV>=al then az=aV-av aU={pos=aW,dur=bc-aV,facing=aX,index=#ax+1}table.insert(
ax,aU)for bg,bh in ipairs(ay)do if bh.dw==0 and bh._castAt and bh._castAt>=aV
then bh.dw=aU.index bh.dwT=math.max(0,(bh._castAt-av)-az)bh.pos=aU.pos aU.facing
=bh.facing or aU.facing end end end end end local bg=au[#au]if bg and(ba-bg).
Magnitude<ai then return end if#au>=aj then ap.Stop'reached max points'return
end table.insert(au,ba)end)if ar then aP=ah.InputBegan:Connect(function(b,ba)if
not as or not ar then return end if ah:GetFocusedTextBox()then return end if ab.
IsDead()then return end local bb if b.UserInputType==Enum.UserInputType.
MouseButton2 then if ba then return end bb='QE'elseif b.UserInputType==Enum.
UserInputType.Keyboard and(b.KeyCode==Enum.KeyCode.Q or b.KeyCode==Enum.KeyCode.
E)then bb=b.KeyCode==Enum.KeyCode.Q and'Q'or'E'else return end local bc=a0()if
not bc then return end local bd=aq and(aU~=nil)local be={pos=bd and aU.pos or bc
.Position,facing=a1(),key=bb,dw=0,dwT=0,_castAt=os.clock()}if bd then be.dw=aU.
index be.dwT=math.max(0,(os.clock()-av)-az)aU.facing=be.facing or aU.facing end
table.insert(ay,be)end)end aQ=ab.OnRoomIndexChanged(function()if as then local b
=ab.GetCurrentRoomIndex()if aH and at<=0 and b>0 then at=b return end if b~=at
and not aA then aA=true task.delay(an,function()aA=false if as then if aF then
ap.Rollover()else ap.Stop'room completed'end end end)end end end)aT=ab.
OnBossActiveChanged(function(b)if not as then return end if b then if aF then aG
=true else ap.Stop'entered boss room'end return end if aF and aG then a6(
'boss defeated',true)aG=false aH=false task.spawn(function()task.wait(ao)if as
and not aH then ap.Stop'end of map'end end)end end)aS=ab.OnLobbyChanged(function
(b)if as and b then ap.Stop'returned to lobby'end end)respawnConnection=ab.
OnRespawn(function()if as then ap.Stop'player died'end end)ae.Notify(
'Path Record',('Started recording room %d (%s)'):format(a8,a9),2)a_()return true
end function ap.Rollover()if not as then return false end a6('room transition',
true)local a7=a0()local a8=a7 and a7.Position or aN a5(ab.GetCurrentRoomIndex(),
a8)a_()return true end function ap.Stop(a7)if not as then return false end as=
false ad.SetRecording(false)a2()local a8=a6(a7,true)if a8 then if aI>1 then
local a9=aJ>0 and(' | %d boss'):format(aJ)or''ae.Notify('Path Record',(
'Saved map [%s] %s: %d room(s)%s (%d raw pts)'):format(aM,a7 or'completed',aI,a9
,aK),4)else local a9=''if a8.events then a9=(
' (%d smooth pts, %d skills, %d dwells, %.1f spd)'):format(#a8.points,#(a8.
events.skills or{}),#(a8.events.dwells or{}),a8.speed or 0)else a9=(
' (%d smooth pts, %.1f spd)'):format(#a8.points,a8.speed or 0)end local b=at>0
and(aG and' (boss)'or'')or''ae.Notify('Path Record',(
'Saved room %d%s%s to map [%s] %s'):format(at,a9,b,aM,a7 and('- '..a7)or''),3)
end elseif aI>0 then local a9=aJ>0 and(' | %d boss'):format(aJ)or''ae.Notify(
'Path Record',('Saved map [%s] %s: %d room(s)%s (%d raw pts)'):format(aM,a7 or
'completed',aI,a9,aK),4)end a4()a_()return a8~=nil end function ap.Cancel()if
not as then return end a2()a4()as=false ad.SetRecording(false)a_()end return ap
end function a.af()local aa,ab,ac,ad,ae=a.load'e',a.load'f',a.load'ad',a.load'c'
,a.load'L'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,ax,ay,az,aA,
aB,aC,aF,aG,aH,aI=aa.player,aa.VirtualInputManager,aa.UserInputService,aa.
RunService or game:GetService'RunService',0.4,0.5,8,2,4.5,8,14,8,2,0.5,2,0.001,
0.1,{},true,true,true,0.6,0.005,0.45,0.2,false,true function ax.SetAimSkillQ(aJ)
aH=aJ and true or false end function ax.IsAimSkillQEnabled()return aH end
function ax.SetAimSkillE(aJ)aI=aJ and true or false end function ax.
IsAimSkillEEnabled()return aI end local aJ=function(aJ)if aJ=='Q'then return aH
elseif aJ=='E'then return aI end return aH or aI end function ax.
SetStartPauseTime(aK)if type(aK)=='number'then aG=math.clamp(aK,0,5)end end
function ax.GetStartPauseTime()return aG end function ax.SetPreAimTime(aK)if
type(aK)=='number'then aF=math.clamp(aK,0.1,1.5)end end function ax.
GetPreAimTime()return aF end function ax.SetSkillFaceHold(aK)if type(aK)==
'number'then aB=math.clamp(aK,as,at)end end function ax.GetSkillFaceHold()return
aB end function ax.SetDoubleClickDelay(aK)if type(aK)=='number'then aC=math.
clamp(aK,au,av)end end function ax.GetDoubleClickDelay()return aC end function
ax.SetReplayTimeline(aK)aK=aK and true or false ay=aK az=aK aA=aK end function
ax.IsReplayTimelineEnabled()return ay end local aK,aL,aM,aN=true,false function
ax.SetSpeedMatch(aO)aK=aO and true or false end function ax.IsSpeedMatchEnabled(
)return aK end function ax.SetUseFastSpeed(aO)aL=aO and true or false end
function ax.IsUseFastSpeedEnabled()return aL end local aO,aP=false,5 function ax
.SetAutoRetryOnDeathLimit(aQ)aO=aQ and true or false end function ax.
IsAutoRetryOnDeathLimitEnabled()return aO end local aQ,aS,aT,aU,aV,aW,aX,aY,aZ,
a_,a0=function(aQ)local aS if aL then local aT=ab.GetFastSpeed()if type(aT)==
'number'and aT>0 then aS=aT end elseif aK then if type(aQ)=='number'and aQ>0
then aS=aQ end end if not aS or aS<=0 then return end local aT=ab.GetHumanoid()
if not aT then return end if aM==nil then aN=aT.WalkSpeed end aM=aS if aT.
WalkSpeed~=aS then aT.WalkSpeed=aS end end,function()if aM==nil then return end
local aQ=ab.GetHumanoid()if aN and aQ and aQ.WalkSpeed~=aN then aQ.WalkSpeed=aN
end aM=nil aN=nil end,false,false,false,0,0,0,{}local a1,a2,a3,a4,a5=function(a1
)local a2={playing=aT,map=a_,room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(
),resume=aU,progressPercent=aY,progressStuds=aW,totalStuds=aX,reason=a1}for a3,
a4 in ipairs(aZ)do pcall(a4,a2)end end,function()local a1=af and af.Character
local a2=a1 and a1:FindFirstChild'HumanoidRootPart'if a2 and a2.Parent then
return a2 end return nil end,function(a1)if not a1 or not a1.Parent then return
nil end local a2,a3=pcall(function()return a1.Position end)if not a2 or not a3
then return nil end return a3 end,function(a1,a2)local a3,a4=a1.X-a2.X,a1.Z-a2.Z
return math.sqrt(a3*a3+a4*a4)end local a6=function()if a5 then return a5 end
pcall(function()local a6=af:FindFirstChild'PlayerScripts'local a7=a6 and a6:
FindFirstChild'PlayerModule'if a7 then a5=require(a7):GetControls()end end)
return a5 end local a7,a8,a9,b=function()if ab.DisableControls then ab.
DisableControls'PathRecord'else local a7=a6()if a7 and type(a7.Disable)==
'function'then pcall(function()a7:Disable()end)end end end,function()if ab.
EnableControls then ab.EnableControls'PathRecord'else local a7=a6()if a7 and
type(a7.Enable)=='function'then pcall(function()a7:Enable()end)end end end,(
Vector3.zero)local ba,bb,bc,bd=function()if b then return end local ba=ai.
PreSimulation or ai.Heartbeat or ai.RenderStepped b=ba:Connect(function()if not
aT then return end local bb=ab.GetHumanoid()if bb then bb:Move(a9,false)end end)
end,function()if b then b:Disconnect()b=nil end a9=Vector3.zero local ba=ab.
GetHumanoid()if ba then pcall(function()ba:Move(Vector3.zero,false)end)end end,
function(ba)local bb=a2()if not bb or not ba then a9=Vector3.zero return end
local bc=bb.Position local bd=Vector3.new(ba.X-bc.X,0,ba.Z-bc.Z)if bd.Magnitude>
0.05 then a9=bd.Unit else a9=Vector3.zero end end,function()a9=Vector3.zero
local ba=ab.GetHumanoid()if ba then pcall(function()ba:Move(Vector3.zero,false)
end)end end local be,bf,bg,bh,bi=function(be)bd()bb()a8()end,function(be)local
bf,bg=ab.GetKeyHoldTime()or 0.05,aC task.spawn(function()pcall(function()local
bh=function(bh,bi)ag:SendKeyEvent(bi,bh,false,game)end local bi=function(bi)if
bi=='Q'then bh(Enum.KeyCode.Q,true)task.wait(bf)bh(Enum.KeyCode.Q,false)elseif
bi=='E'then bh(Enum.KeyCode.E,true)task.wait(bf)bh(Enum.KeyCode.E,false)else bh(
Enum.KeyCode.Q,true)bh(Enum.KeyCode.E,true)task.wait(bf)bh(Enum.KeyCode.Q,false)
bh(Enum.KeyCode.E,false)end end bi(be)if bg>0 then task.wait(bg)end bi(be)end)
end)end,function(be,bf)if not be or not be.Parent then return end local bg=ab.
GetHumanoid()if bg then bg.AutoRotate=false end local bh=bf or Vector3.new(1,0,0
)if bh.Magnitude<0.1 then bh=Vector3.new(1,0,0)end bh=Vector3.new(bh.X,0,bh.Z).
Unit pcall(function()local bi=be.Position be.CFrame=CFrame.lookAt(bi,bi+bh)end)
end,function(be,bf,bg)if not be or not be.Parent then return end local bh=ab.
GetHumanoid()if bh and bh.AutoRotate~=false then bh.AutoRotate=false end local
bi=bf or Vector3.new(1,0,0)if bi.Magnitude<0.1 then bi=Vector3.new(1,0,0)end bi=
Vector3.new(bi.X,0,bi.Z).Unit pcall(function()local bj=be.Position local bk=
CFrame.lookAt(bj,bj+bi)be.CFrame=be.CFrame:Lerp(bk,math.clamp(bg or 0.35,0.05,1)
)end)end,function()local be=ab.GetHumanoid()if be then be.AutoRotate=true end
end local bj=function(bj,bk,bl)local bm,bn=ab.GetHumanoid(),a2()if not bm or not
bn then return end aQ(bj.speed)local bo=ac.SimplifyPath(bj.points,aj)local bp=#
bo if bp<2 then return end local bq,br=0,{}br[1]=0 for bt=2,bp do local bu=a4(bo
[bt-1],bo[bt])bq+=bu br[bt]=bq end aW=0 aX=bq aY=0 a1'progress_init'local bt,bu=
function(bt,bu,bv)bu=bu or 0 bv=bv or bq local bw,bx=0,math.huge for by=2,bp do
if br[by]<bu then continue end if br[by-1]>bv then continue end local bz,bA=bo[
by-1],bo[by]local bB,bC=bz.X,bz.Z local bD,bE=bA.X-bB,bA.Z-bC local bF,bG=bD*bD+
bE*bE,0 if bF>0 then bG=((bt.X-bB)*bD+(bt.Z-bC)*bE)/bF bG=math.clamp(bG,0,1)end
local bH,bI=bt.X-(bB+bD*bG),bt.Z-(bC+bE*bG)local bJ=bH*bH+bI*bI if bJ<bx then bx
=bJ bw=br[by-1]+math.sqrt(bF)*bG end end return bw end,function(bt)local bu=2
while bu<=bp and br[bu]<bt do bu+=1 end bu=math.min(bu,bp)local bv=br[bu]-br[bu-
1]if bv<=0 then return bo[bu]end local bw,bx,by=math.clamp((bt-br[bu-1])/bv,0,1)
,bo[bu-1],bo[bu]return Vector3.new(bx.X+(by.X-bx.X)*bw,bx.Y+(by.Y-bx.Y)*bw,bx.Z+
(by.Z-bx.Z)*bw)end local bv,bw,bx=function(bv)local bw=bq-bv if bw<=1 then
return math.max(0.2,bw)end local bx,by=math.min(bv+2,bq),math.min(bv+4.5,bq)if
by-bv<0.8 then return math.min(am,bw)end local bz,bA,bB=bu(bv),bu(bx),bu(by)
local bC,bD,bE,bF=bA.X-bz.X,bA.Z-bz.Z,bB.X-bA.X,bB.Z-bA.Z local bG,bH=math.sqrt(
bC*bC+bD*bD),math.sqrt(bE*bE+bF*bF)if bG>0.1 and bH>0.1 then local bI=math.
clamp((bC*bE+bD*bF)/(bG*bH),-1,1)local bJ=math.clamp((bI+0.2)/1.2,0,1)local bK=
am+(an-am)*bJ return math.min(bK,bw)end return math.min(an,bw)end,{},{}if bj.
events and(ay or az or aA)then local by,bz=bj.events.dwells or{},bj.events.
skills or{}for bA,bB in ipairs(by)do local bC,bD=bt(bB.pos),bB.dur or 0 if bC<=
0.8 or bC>=bq-0.8 then bD=aG end bw[bA]={arc=bC,dur=bD,facing=bB.facing,skills={
},pos=bB.pos}end if aG>0 and(#bw==0 or bw[1].arc>0.8)then table.insert(bw,1,{arc
=0,dur=aG,facing=bj.events and bj.events.startFacing or nil,skills={},pos=bj.
startPos or bo[1]})end for bA,bB in ipairs(bz)do local bC=(ay and bB.dw>0 and bw
[bB.dw])and bw[bB.dw]or nil if bC then table.insert(bC.skills,{tOff=bB.dwT or 0,
facing=bB.facing,key=bB.key})else table.insert(bx,{arc=bt(bB.pos),facing=bB.
facing,key=bB.key})end end table.sort(bx,function(bA,bB)return bA.arc<bB.arc end
)end local by,bz,bA=function(by)if not aT or(by.dur or 0)<=0 then return true
end if ay then bd()if aA and by.facing then bg(bn,by.facing)end local bz,bA,bB=
os.clock(),{},0 while aT and(os.clock()-bz<by.dur)do if not bn or not bn.Parent
then return false,'no_root'end if ab.IsDead()then return false,'dead'end if ab.
GetCurrentRoomIndex()~=bk then return false,'room_changed'end if ab.
IsBossActive()and not bl then return false,'boss'end bd()local bC=os.clock()-bz
for bD,bE in ipairs(by.skills or{})do if not bA[bD]and bC>=(bE.tOff or 0)then bA
[bD]=true if aA and bE.facing and aJ(bE.key)then bg(bn,bE.facing)bB=os.clock()+
aB end if az then bf(bE.key or'QE')end end end task.wait(0.03)end for bC,bD in
ipairs(by.skills or{})do if not bA[bC]then bA[bC]=true if aA and bD.facing and
aJ(bD.key)then bg(bn,bD.facing)bB=os.clock()+aB end if az then bf(bD.key or'QE')
end end end while aT and os.clock()<bB do bd()task.wait(0.03)end if aA then bi()
end end return true end,bj.startPos or bo[1],a3(bn)if bA and bz then local bB=
a4(bA,bz)if bB>1.8 then local bC=os.clock()+al while aT and os.clock()<bC do
local bD=a3(bn)if not bD then break end local bE=a4(bD,bz)if bE<=1.8 then break
end if ab.IsDead()or ab.GetCurrentRoomIndex()~=bk then break end bc(bz)task.
wait(0.03)end bd()end local bC=a3(bn)if bC and a4(bC,bz)<=3 then pcall(function(
)local bD=bn.CFrame.Rotation bn.CFrame=CFrame.new(bz.X,bn.Position.Y,bz.Z)*bD bn
.AssemblyLinearVelocity=Vector3.zero bn.AssemblyAngularVelocity=Vector3.zero end
)end end local bB,bC,bD,bE,bF,bG,bH=0,bz or a3(bn),os.clock(),1,1,0 ba()while aT
do if not bn or not bn.Parent then bi()return false,'no_root'end if ab.IsDead()
then bi()return false,'dead'end if ab.GetCurrentRoomIndex()~=bk then bi()return
false,'room_changed'end if ab.IsBossActive()and not bl then bi()return false,
'boss'end local bI=a3(bn)if not bI then task.wait(0.08)continue end local bJ=bt(
bI,math.max(0,bB-ao),math.min(bq,bB+ap))if bJ>bB then bB=bJ end aW=bB aY=bq>0
and math.clamp(math.floor((bB/bq)*100),0,100)or 0 if bC then if a4(bI,bC)>0.02
then bD=os.clock()end end bC=bI if os.clock()-bD>aq then bB=math.min(bB+ar,bq-ak
)bD=os.clock()bC=bI end while bF<=#bx and bx[bF].arc<=bB do local bK=bx[bF]if aA
and bK.facing and aJ(bK.key)then bg(bn,bK.facing)bH=bK.facing bG=os.clock()+aB
end if az then bf(bK.key or'QE')end bF+=1 end while bE<=#bw and bB>=bw[bE].arc
do local bK=bw[bE]local bL,bM=by(bK)if not bL then bd()bi()return false,bM end
bE+=1 bC=a3(bn)bD=os.clock()end local bK if aA then local bL,bM=math.huge,bE
while bM<=#bw do local bN,bO=(bw[bM])if bN.skills and#bN.skills>0 then for bP,bQ
in ipairs(bN.skills)do if bQ.facing and aJ(bQ.key)then bO=bQ.facing break end
end end bO=bO or bN.facing if bO then if bN.arc<bL then bL=bN.arc bK=bO end
break end bM+=1 end local bN=bF while bN<=#bx do local bO=bx[bN]if bO.facing and
aJ(bO.key)then if bO.arc<bL then bL=bO.arc bK=bO.facing end break end bN+=1 end
end if aA then if os.clock()<bG then if bH then bh(bn,bH,0.45)end if bm.
AutoRotate~=false then bm.AutoRotate=false end elseif bK then bh(bn,bK,0.35)if
bm.AutoRotate~=false then bm.AutoRotate=false end else if bm.AutoRotate~=true
then bm.AutoRotate=true end end else if bm.AutoRotate~=true then bm.AutoRotate=
true end end if bB>=bq-ak then while bE<=#bw do local bL=bw[bE]local bM,bN=by(bL
)if not bM then bd()bi()return false,bN end bE+=1 end while bF<=#bx do local bL=
bx[bF]if aA and bL.facing and aJ(bL.key)then bg(bn,bL.facing)bH=bL.facing bG=os.
clock()+aB end if az then bf(bL.key or'QE')end bF+=1 end local bL=os.clock()+5
while aT do local bM=a3(bn)if not bM then break end local bN=a4(bM,bo[bp])if bN
<=ak then break end if ab.GetCurrentRoomIndex()~=bk then bd()bi()return false,
'room_changed'end if(ab.IsBossActive()and not bl)or ab.IsDead()then bd()bi()
return false,'dead'end if os.clock()>=bL then break end bc(bo[bp])if os.clock()<
bG then if bH then bh(bn,bH,0.45)end if bm.AutoRotate~=false then bm.AutoRotate=
false end elseif bm.AutoRotate~=true then bm.AutoRotate=true end task.wait(0.03)
end bd()bi()aW=bq aY=100 return true,'completed'end local bL=bv(bB)local bM=bu(
math.min(bB+bL,bq-0.01))bc(bM)task.wait(0.03)end bd()bi()return false,'stopped'
end local bk=function()local bk,bl,bm,bn=0,false,false,0 while aT do if aU then
break end if ab.IsDead()then if not bm then bm=true if aO and not aV and not ab.
IsBossActive()and bk>0 then bn+=1 if bn>=aP then ad.Notify('Path Record',string.
format('Exceeded %d deaths in Room %d. Retrying dungeon...',aP,bk),3)bn=0 ae.
RetryNow()end end end task.wait(0.25)continue end if bm then bm=false end if ab.
IsInLobby()then aU=false aT=false break end if ab.IsBossActive()and not aV then
task.wait(0.25)continue end local bo=ab.GetCurrentRoomIndex()if bo<=0 then task.
wait(0.1)continue end if bo~=bk then bk=bo bn=0 bl=false aW=0 aX=0 aY=0 end
local bp=ac.GetRoomSegment(a_,bo)if not bp then task.wait(0.1)continue end if bl
then task.wait(0.1)continue end local bq,br=bj(bp,bo,aV)bi()if bq then bl=true
aW=aX aY=100 else if br=='dead'then if not bm then bm=true if aO and not aV and
not ab.IsBossActive()and bo>0 then bn+=1 if bn>=aP then ad.Notify('Path Record',
string.format('Exceeded %d deaths in Room %d. Retrying dungeon...',aP,bo),3)bn=0
ae.RetryNow()end end end ad.Notify('Path Record',
'Died: Waiting to respawn to retry path...',2)while aT and ab.IsDead()do task.
wait(0.2)end task.wait(0.6)end end end bb()a8()aS()bi()a0=nil a1()end function
ax.IsPlaying()return aT end function ax.ResumeWanted()return aU end function ax.
GetActiveMap()return a_ end function ax.IsBossPlayActive()return aV end function
ax.GetStatus()return{playing=aT,map=a_,room=ab.GetCurrentRoomIndex(),boss=ab.
IsBossActive(),resume=aU,progressPercent=aY,progressStuds=aW,totalStuds=aX}end
function ax.OnStatusChanged(bl)if type(bl)~='function'then return function()end
end table.insert(aZ,bl)return function()for bm,bn in ipairs(aZ)do if bn==bl then
table.remove(aZ,bm)break end end end end function ax.Start()if aT then return
false,'\u{111}ang ph\u{e1}t r\u{1ed3}i'end if ab.IsInLobby()then return false,
'\u{111}ang \u{1edf} lobby'end local bl=ab.GetCurrentRoomIndex()if bl<=0 then
return false,'ch\u{1b0}a c\u{f3} room'end local bm=ab.GetCurrentDungeonName()if
not bm or#bm==0 then return false,
'kh\u{f4}ng x\u{e1}c \u{111}\u{1ecb}nh \u{111}\u{1b0}\u{1ee3}c map'end if not ac
.HasSegmentOrMacro(bm,bl)then return false,(
'map [%s] ch\u{1b0}a c\u{f3} segment room %d'):format(bm,bl)end local bn=ac.
GetMapMode(bm)=='full'if ab.IsBossActive()and(not bn or not ac.
HasSegmentOrMacro(bm,bl))then return false,
'boss room (h\u{e3}y d\u{f9}ng Hazard Scanner)'end a_=bm aV=bn aU=false aW=0 aX=
0 aY=0 aT=true a7()ba()a0=task.spawn(bk)a1'started'return true end function ax.
Stop()aT=false aU=false a_=nil aV=false aW=0 aX=0 aY=0 if a0 then task.cancel(a0
)a0=nil end be(ab.GetHumanoid())aS()bi()a1'stopped'end function ax.
PauseForExclusive()if not aT then return end aU=true aT=false aV=false aW=0 aX=0
aY=0 if a0 then task.cancel(a0)a0=nil end be(ab.GetHumanoid())aS()bi()ad.Notify(
'Path Record',
[[Yielded control: will auto-resume upon entering a recorded room]],3)a1'paused'
end return ax end function a.ag()local aa,ab,ac,ad,ae,af,ag=a.load'e',a.load'f',
a.load'ad',a.load'ae',a.load'af',a.load'b',game:GetService'Workspace'local ah,ai
,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,ax,ay,az,aA,aB,aC,aF,aG=aa.RunService,{}
,'PR_PathVisual_Container','PR_PathVisual_Anchor',Color3.fromRGB(255,60,60),
Color3.fromRGB(255,90,90),Color3.fromRGB(0,255,120),Color3.fromRGB(0,220,110),
Color3.fromRGB(0,230,255),Color3.fromRGB(255,80,180),Color3.fromRGB(255,190,30),
Color3.fromRGB(200,70,255),Color3.fromRGB(220,100,255),Color3.fromRGB(255,210,60
),0.35,0.55,2.5,3,0.35,true,true,true,true local aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ,
aS=av,true,0,{},{},{},{},{}local aT,aU,aV,aW,aX,aY,aZ,a_=function()if aP and aP.
Parent and aQ and aQ.Parent then return aQ end ai.Clear()local aT=Instance.new
'Folder'aT.Name=aj aT.Parent=ag local aU=Instance.new'Part'aU.Name=ak aU.
Anchored=true aU.CanCollide=false aU.CanQuery=false aU.CanTouch=false aU.
Transparency=1 aU.Size=Vector3.new(1,1,1)aU.CFrame=CFrame.new(0,0,0)aU.Parent=aT
aP=aT aQ=aU table.clear(aK)table.clear(aL)table.clear(aM)table.clear(aN)table.
clear(aO)return aQ end,function(aT,aU)local aV=aK[aT]if not aV or not aV.Parent
then aV=Instance.new'SphereHandleAdornment'aV.Name='PR_NodeSphere_'..tostring(aT
)aV.Adornee=aU aV.AlwaysOnTop=aI aV.ZIndex=5 aV.Transparency=0.2 aV.Parent=aU aK
[aT]=aV end return aV end,function(aT,aU)local aV=aL[aT]if not aV or not aV.
Parent then aV=Instance.new'LineHandleAdornment'aV.Name='PR_PathLine_'..
tostring(aT)aV.Adornee=aU aV.AlwaysOnTop=aI aV.ZIndex=4 aV.Transparency=0.3 aV.
Thickness=ay aV.Parent=aU aL[aT]=aV end return aV end,function(aT,aU)local aV=aM
[aT]if not aV or not aV.Parent then aV=Instance.new'SphereHandleAdornment'aV.
Name='PR_EventSphere_'..tostring(aT)aV.Adornee=aU aV.AlwaysOnTop=aI aV.ZIndex=8
aV.Transparency=0.15 aV.Radius=ax aV.Parent=aU aM[aT]=aV end return aV end,
function(aT,aU)local aV=aN[aT]if not aV or not aV.Parent then aV=Instance.new
'LineHandleAdornment'aV.Name='PR_FacingRay_'..tostring(aT)aV.Adornee=aU aV.
AlwaysOnTop=aI aV.ZIndex=9 aV.Transparency=0.1 aV.Thickness=az aV.Parent=aU aN[
aT]=aV end return aV end,function(aT,aU)local aV=aO[aT]if not aV or not aV.
billboard or not aV.billboard.Parent then local aW=Instance.new'Attachment'aW.
Name='PR_BadgeAtt_'..tostring(aT)aW.Parent=aU local aX=Instance.new
'BillboardGui'aX.Name='PR_BadgeGui_'..tostring(aT)aX.Adornee=aW aX.Size=UDim2.
new(0,115,0,24)aX.StudsOffset=Vector3.new(0,1.6,0)aX.AlwaysOnTop=true aX.
MaxDistance=180 aX.LightInfluence=0 aX.Parent=aP local aY=Instance.new'Frame'aY.
Name='BadgeFrame'aY.Size=UDim2.new(1,0,1,0)aY.BackgroundColor3=Color3.fromRGB(15
,15,20)aY.BackgroundTransparency=0.25 aY.BorderSizePixel=0 aY.Parent=aX local aZ
=Instance.new'UICorner'aZ.CornerRadius=UDim.new(0,6)aZ.Parent=aY local a_=
Instance.new'UIStroke'a_.Name='Stroke'a_.Color=as a_.Thickness=1.4 a_.
Transparency=0.15 a_.Parent=aY local a0=Instance.new'TextLabel'a0.Name='Text'a0.
Size=UDim2.new(1,-6,1,0)a0.Position=UDim2.new(0,3,0,0)a0.BackgroundTransparency=
1 a0.Font=Enum.Font.GothamBold a0.TextSize=11 a0.TextColor3=Color3.fromRGB(255,
255,255)a0.RichText=true a0.Text=''a0.TextXAlignment=Enum.TextXAlignment.Center
a0.TextYAlignment=Enum.TextYAlignment.Center a0.Parent=aY aV={attachment=aW,
billboard=aX,frame=aY,stroke=a_,label=a0}aO[aT]=aV end return aV end,function(aT
)if not aT then return nil end if typeof(aT)=='Vector3'then if aT.Magnitude>
0.001 then return aT.Unit end return nil end if type(aT)=='table'and type(aT.X)
=='number'and type(aT.Z)=='number'then local aU=Vector3.new(aT.X,0,aT.Z)if aU.
Magnitude>0.001 then return aU.Unit end end return nil end,function()for aT,aU
in ipairs(aK)do if aU and aU.Parent then aU.Visible=false end end for aT,aU in
ipairs(aL)do if aU and aU.Parent then aU.Visible=false end end for aT,aU in
ipairs(aM)do if aU and aU.Parent then aU.Visible=false end end for aT,aU in
ipairs(aN)do if aU and aU.Parent then aU.Visible=false end end for aT,aU in
ipairs(aO)do if aU and aU.billboard and aU.billboard.Parent then aU.billboard.
Enabled=false end end end function ai.Update()if not aB then a_()return end if
ab.IsInLobby()then a_()return end local a0,a1,a2,a3=ad.IsRecording(),{},{},{}if
a0 then local a4=ad.GetCurrentPoints()if a4 and#a4>0 then table.insert(a1,a4)end
local a5=ad.GetCurrentDwells and ad.GetCurrentDwells()if a5 then a2=a5 end local
a6=ad.GetCurrentSkills and ad.GetCurrentSkills()if a6 then a3=a6 end else local
a4,a5=ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex()if a4 and#a4>0 and a5>0
then local a6=ac.GetRoomSegment(a4,a5)if a6 then if a6.points and#a6.points>0
then table.insert(a1,a6.points)end if a6.events then a2=a6.events.dwells or{}a3=
a6.events.skills or{}end end end end if#a1==0 then a_()return end local a4=aT()
if not a4 then return end local a5,a6,a7,a8,a9,b,ba,bb,bc=a0 and al or an,a0 and
am or ao,0,0,0,0,0 for bd,be in ipairs(a1)do local bf=#be if bf>0 then if not bb
then bb=be[1]end bc=be[bf]for bg=1,bf do local bh=be[bg]if bh then a7+=1 local
bi=aU(a7,a4)bi.Radius=aH bi.Color3=a5 bi.AlwaysOnTop=aI bi.CFrame=CFrame.new(bh+
Vector3.new(0,aA,0))bi.Visible=true end end if aC and bf>=2 then for bg=1,bf-1
do local bh,bi=be[bg],be[bg+1]if bh and bi then local bj,bk=bh+Vector3.new(0,aA,
0),bi+Vector3.new(0,aA,0)local bl=(bk-bj).Magnitude if bl>0.05 then a8+=1 local
bm=aV(a8,a4)bm.Length=bl bm.Thickness=ay bm.Color3=a6 bm.AlwaysOnTop=aI bm.
CFrame=CFrame.lookAt(bj,bk)bm.Visible=true end end end end end end if aF then
local bd if bb then for be,bf in ipairs(a2)do if bf.pos and(bf.pos-bb).Magnitude
<1.5 then bd=bf break end end a9+=1 local be=aW(a9,a4)be.Radius=ax be.Color3=ap
be.AlwaysOnTop=aI be.CFrame=CFrame.new(bb+Vector3.new(0,aA,0))be.Visible=true ba
+=1 local bf=aY(ba,a4)bf.attachment.WorldPosition=bb+Vector3.new(0,aA,0)bf.
stroke.Color=ap local bg=ae and ae.GetStartPauseTime and ae.GetStartPauseTime()
or 0 if bg>0 then bf.label.Text=(
"<font color='rgb(0,240,255)'><b>\u{1f6a9} START (%.1fs)</b></font>"):format(bg)
else bf.label.Text="<font color='rgb(0,240,255)'><b>\u{1f6a9} START</b></font>"
end bf.billboard.Enabled=true if aG and bd and bd.facing then local bh=aZ(bd.
facing)if bh then b+=1 local bi,bj=aX(b,a4),bb+Vector3.new(0,aA,0)local bk=bj+bh
*3.5 bi.Length=3.5 bi.Color3=ap bi.AlwaysOnTop=aI bi.CFrame=CFrame.lookAt(bj,bk)
bi.Visible=true end end end for be,bf in ipairs(a2)do local bg=bf.pos local bh,
bi=bb and(bg-bb).Magnitude<1.5,bc and(bg-bc).Magnitude<1.5 if bg and not bh and
not bi then a9+=1 local bj=aW(a9,a4)bj.Radius=ax bj.Color3=ar bj.AlwaysOnTop=aI
bj.CFrame=CFrame.new(bg+Vector3.new(0,aA,0))bj.Visible=true local bk=math.round(
(bf.dur or 0)*10)/10 ba+=1 local bl=aY(ba,a4)bl.attachment.WorldPosition=bg+
Vector3.new(0,aA,0)bl.stroke.Color=ar bl.label.Text=(
"<font color='rgb(255,200,60)'><b>\u{23f3} Pause (%.1fs)</b></font>"):format(bk)
bl.billboard.Enabled=true if aG then local bm=aZ(bf.facing)if bm then b+=1 local
bn,bo=aX(b,a4),bg+Vector3.new(0,aA,0)local bp=bo+bm*3 bn.Length=3 bn.Color3=au
bn.AlwaysOnTop=aI bn.CFrame=CFrame.lookAt(bo,bp)bn.Visible=true end end end end
for be,bf in ipairs(a3)do local bg=bf.pos if bg then a9+=1 local bh=aW(a9,a4)bh.
Radius=ax bh.Color3=as bh.AlwaysOnTop=aI bh.CFrame=CFrame.new(bg+Vector3.new(0,
aA,0))bh.Visible=true local bi=(bf.key and#bf.key>0)and bf.key or'QE'ba+=1 local
bj=aY(ba,a4)bj.attachment.WorldPosition=bg+Vector3.new(0,aA,0)bj.stroke.Color=as
bj.label.Text=(
"<font color='rgb(220,100,255)'><b>\u{26a1} Skill [%s]</b></font>"):format(bi)bj
.billboard.Enabled=true if aG then local bk=aZ(bf.facing)if bk then b+=1 local
bl,bm=aX(b,a4),bg+Vector3.new(0,aA,0)local bn=bm+bk*3.8 bl.Length=3.8 bl.Color3=
at bl.AlwaysOnTop=aI bl.CFrame=CFrame.lookAt(bm,bn)bl.Visible=true end end end
end local be if bc and bc~=bb and not a0 then for bf,bg in ipairs(a2)do if bg.
pos and(bg.pos-bc).Magnitude<1.5 then be=bg break end end a9+=1 local bf=aW(a9,
a4)bf.Radius=ax bf.Color3=aq bf.AlwaysOnTop=aI bf.CFrame=CFrame.new(bc+Vector3.
new(0,aA,0))bf.Visible=true ba+=1 local bg=aY(ba,a4)bg.attachment.WorldPosition=
bc+Vector3.new(0,aA,0)bg.stroke.Color=aq local bh=ae and ae.GetStartPauseTime
and ae.GetStartPauseTime()or 0 if be and bh>0 then bg.label.Text=(
"<font color='rgb(255,100,200)'><b>\u{1f3c1} FINISH (%.1fs)</b></font>"):format(
bh)else bg.label.Text=
"<font color='rgb(255,100,200)'><b>\u{1f3c1} FINISH</b></font>"end bg.billboard.
Enabled=true if aG and be and be.facing then local bi=aZ(be.facing)if bi then b
+=1 local bj,bk=aX(b,a4),bc+Vector3.new(0,aA,0)local bl=bk+bi*3.5 bj.Length=3.5
bj.Color3=aq bj.AlwaysOnTop=aI bj.CFrame=CFrame.lookAt(bk,bl)bj.Visible=true end
end end end for bd=a7+1,#aK do local be=aK[bd]if be and be.Parent then be.
Visible=false end end for bd=a8+1,#aL do local be=aL[bd]if be and be.Parent then
be.Visible=false end end for bd=a9+1,#aM do local be=aM[bd]if be and be.Parent
then be.Visible=false end end for bd=b+1,#aN do local be=aN[bd]if be and be.
Parent then be.Visible=false end end for bd=ba+1,#aO do local be=aO[bd]if be and
be.billboard and be.billboard.Parent then be.billboard.Enabled=false end end end
local a0=function()if aS then return end aS=ah.Heartbeat:Connect(function()local
a0,a1=os.clock(),ad.IsRecording()local a2=a1 and 0.03 or 0.1 if a0-aJ<a2 then
return end aJ=a0 pcall(ai.Update)end)end function ai.SetEnabled(a1)aB=a1 and
true or false if not aB then a_()else pcall(ai.Update)end end function ai.
IsEnabled()return aB end function ai.SetShowLines(a1)aC=a1 and true or false if
not aC then for a2,a3 in ipairs(aL)do if a3 and a3.Parent then a3.Visible=false
end end else pcall(ai.Update)end end function ai.IsShowLinesEnabled()return aC
end function ai.SetShowEvents(a1)aF=a1 and true or false if not aF then for a2,
a3 in ipairs(aM)do if a3 and a3.Parent then a3.Visible=false end end for a2,a3
in ipairs(aO)do if a3 and a3.billboard and a3.billboard.Parent then a3.billboard
.Enabled=false end end else pcall(ai.Update)end end function ai.
IsShowEventsEnabled()return aF end function ai.SetShowFacingRays(a1)aG=a1 and
true or false if not aG then for a2,a3 in ipairs(aN)do if a3 and a3.Parent then
a3.Visible=false end end else pcall(ai.Update)end end function ai.
IsShowFacingRaysEnabled()return aG end function ai.SetNodeRadius(a1)if type(a1)
=='number'then aH=math.clamp(a1,0.1,1.5)pcall(ai.Update)end end function ai.
GetNodeRadius()return aH end function ai.SetAlwaysOnTop(a1)aI=a1 and true or
false for a2,a3 in ipairs(aK)do if a3 and a3.Parent then a3.AlwaysOnTop=aI end
end for a2,a3 in ipairs(aL)do if a3 and a3.Parent then a3.AlwaysOnTop=aI end end
for a2,a3 in ipairs(aM)do if a3 and a3.Parent then a3.AlwaysOnTop=aI end end for
a2,a3 in ipairs(aN)do if a3 and a3.Parent then a3.AlwaysOnTop=aI end end for a2,
a3 in ipairs(aO)do if a3 and a3.billboard and a3.billboard.Parent then a3.
billboard.AlwaysOnTop=aI end end end function ai.IsAlwaysOnTopEnabled()return aI
end function ai.Clear()a_()table.clear(aK)table.clear(aL)table.clear(aM)table.
clear(aN)table.clear(aO)local a1=ag:FindFirstChild(aj)if a1 then pcall(function(
)a1:Destroy()end)end aP=nil aQ=nil end function ai.Destroy()if aS then aS:
Disconnect()aS=nil end ai.Clear()end ai.Clear()a0()af.Register(function()ai.
Destroy()end)return ai end function a.ah()local aa,ab,ac=a.load'e',a.load'f',a.
load'b'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,ax,ay,az,
aA=aa.player,aa.RunService,aa.CoreGui or game:GetService'CoreGui',game:
GetService'Workspace',{},{Cyan=Color3.fromRGB(0,230,255),Red=Color3.fromRGB(255,
60,60),Orange=Color3.fromRGB(255,140,0),Yellow=Color3.fromRGB(255,220,40),Green=
Color3.fromRGB(0,255,120),Emerald=Color3.fromRGB(40,220,160),Blue=Color3.
fromRGB(0,140,255),Purple=Color3.fromRGB(180,80,255),Magenta=Color3.fromRGB(255,
60,200),White=Color3.fromRGB(255,255,255)},false,25,0.4,true,true,'Cyan','Red',
0.8,0.15,'PR_InRange_Highlight',0.2,0,{}local aB,aC,aF,aG=function()return ai[ao
]or ai.Cyan end,function()return ai[ap]or ai.Red end,function()local aB=ad and
ad.Character if not aB or not aB.Parent then return nil end local aC=aB:
FindFirstChildOfClass'Humanoid'if aC and aC.Health<=0 then return nil end local
aF=aB:FindFirstChild'HumanoidRootPart'if aF and aF.Parent then return aF end
return nil end,function()for aB,aC in pairs(av)do pcall(function()aC:Destroy()
end)end table.clear(av)pcall(function()for aB,aC in ipairs(ag:GetDescendants())
do if aC.Name==as then pcall(function()aC:Destroy()end)end end end)end local aH,
aI=function()if ax then pcall(function()ax:Destroy()end)ax=nil end if ay then
pcall(function()ay:Destroy()end)ay=nil end aA=nil aG()end,function()if not ax or
not ax.Parent then pcall(function()if ax then ax:Destroy()end end)ax=Instance.
new'CylinderHandleAdornment'ax.Name='PR_SkillRangeRing'ax.AlwaysOnTop=true ax.
ZIndex=5 ax.Parent=af end if am then if not ay or not ay.Parent then pcall(
function()if ay then ay:Destroy()end end)ay=Instance.new
'CylinderHandleAdornment'ay.Name='PR_SkillRangeFill'ay.AlwaysOnTop=true ay.
ZIndex=4 ay.Parent=af end else if ay then pcall(function()ay:Destroy()end)ay=nil
end end end local aJ,aK=function(aJ)if not aj then aH()return end aI()local aK,
aL=2.6,aB()local aM=Vector3.new(aJ.Position.X,aJ.Position.Y-aK,aJ.Position.Z)
local aN=CFrame.new(aM)*CFrame.Angles(math.rad(90),0,0)local aO=aJ.CFrame:
ToObjectSpace(aN)if ax then ax.Adornee=aJ ax.Height=0.06 ax.Radius=ak ax.
InnerRadius=math.max(0.1,ak-al)ax.Color3=aL ax.Transparency=1-aq ax.CFrame=aO ax
.Visible=(aJ~=nil and aJ.Parent~=nil)end if ay and am then ay.Adornee=aJ ay.
Height=0.02 ay.Radius=ak ay.InnerRadius=0 ay.Color3=aL ay.Transparency=1-ar ay.
CFrame=aO ay.Visible=(aJ~=nil and aJ.Parent~=nil)end end,function(aJ)if not aj
or not an or not aJ then if next(av)~=nil then aG()end return end local aK,aL,aM
,aN,aO=ab.GetTrackedEnemyData(),aJ.Position,ak*ak,{},aC()for aP,aQ in ipairs(aK)
do local aS,aT,aU=aQ.Model,aQ.Root,aQ.Humanoid if aS and aS.Parent and aT and aT
.Parent and aU and aU.Health>0 then local aV,aW=aT.Position.X-aL.X,aT.Position.Z
-aL.Z if(aV*aV+aW*aW)<=aM then aN[aS]=true end end end for aP,aQ in pairs(av)do
if not aN[aP]or not aP.Parent then pcall(function()aQ:Destroy()end)av[aP]=nil
end end for aP in pairs(aN)do if not av[aP]or not av[aP].Parent then local aQ=aP
:FindFirstChild(as)local aS=(aQ and aQ:IsA'Highlight')and aQ or Instance.new
'Highlight'aS.Name=as aS.Adornee=aP aS.FillColor=aO aS.FillTransparency=0.35 aS.
OutlineColor=Color3.fromRGB(255,255,255)aS.OutlineTransparency=0.1 aS.DepthMode=
Enum.HighlightDepthMode.AlwaysOnTop aS.Parent=aP av[aP]=aS else local aQ=av[aP]
if aQ.FillColor~=aO then aQ.FillColor=aO end if not aQ.Enabled then aQ.Enabled=
true end end end end local aL=function()if not aj then return end local aL=aF()
if not aL then if ax then ax.Visible=false end if ay then ay.Visible=false end
if next(av)~=nil then aG()end aA=nil return end local aM=2.6 local aN=Vector3.
new(aL.Position.X,aL.Position.Y-aM,aL.Position.Z)local aO=CFrame.new(aN)*CFrame.
Angles(math.rad(90),0,0)local aP=aL.CFrame:ToObjectSpace(aO)if not ax or not ax.
Parent or aL~=aA then aA=aL aJ(aL)else if ax.Adornee~=aL then ax.Adornee=aL end
ax.CFrame=aP if not ax.Visible then ax.Visible=true end if am then if not ay or
not ay.Parent then aJ(aL)else if ay.Adornee~=aL then ay.Adornee=aL end ay.CFrame
=aP if not ay.Visible then ay.Visible=true end end elseif ay and ay.Visible then
ay.Visible=false end end local aQ=os.clock()if aQ-au>=at then au=aQ aK(aL)end
end function ah.SetEnabled(aM)aj=aM and true or false if aj then local aN=aF()if
aN then aJ(aN)aA=aN aK(aN)end if not az then az=ae.Heartbeat:Connect(aL)end else
aH()if az then az:Disconnect()az=nil end aA=nil end end function ah.IsEnabled()
return aj end function ah.SetRadius(aM)if type(aM)=='number'then ak=math.clamp(
aM,5,150)local aN=aF()if aj and aN then aJ(aN)aK(aN)end end end function ah.
GetRadius()return ak end function ah.SetFillEnabled(aM)am=aM and true or false
local aN=aF()if aj and aN then aJ(aN)end end function ah.IsFillEnabled()return
am end function ah.SetHighlightInRange(aM)an=aM and true or false if not an then
aG()else local aN=aF()if aj and aN then aK(aN)end end end function ah.
IsHighlightInRangeEnabled()return an end function ah.GetColorNames()local aM={
'Cyan','Red','Orange','Yellow','Green','Emerald','Blue','Purple','Magenta',
'White'}return aM end function ah.GetSelectedCircleColor()return ao end function
ah.SetCircleColor(aM)if type(aM)=='string'and ai[aM]then ao=aM local aN=aF()if
aj and aN then aJ(aN)end end end function ah.GetSelectedHighlightColor()return
ap end function ah.SetHighlightColor(aM)if type(aM)=='string'and ai[aM]then ap=
aM local aN=aF()if aj and aN then aK(aN)end end end if ad then ad.CharacterAdded
:Connect(function(aM)if aj then task.spawn(function()local aN=aM:WaitForChild(
'HumanoidRootPart',10)if aN and aj then aJ(aN)aA=aN aK(aN)end end)end end)end ab
.OnRespawn(function()if aj then task.delay(0.2,function()local aM=aF()if aM and
aj then aJ(aM)aA=aM aK(aM)end end)end end)ac.Register(function()ah.SetEnabled(
false)aH()end)return ah end function a.ai()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,
ak,al,am,an=a.load'e',a.load'f',a.load'b',a.load'g',a.load'c',a.load'z',a.load
'ad',a.load'ae',a.load'af',a.load'ag',a.load'ah',{},false,{}local ao,ap,aq=
function(ao)local ap=ah.GetStatus()local aq={recording=ah.IsRecording(),playing=
ai.IsPlaying(),resume=ai.ResumeWanted(),autoPlayWanted=am,inLobby=ab.IsInLobby()
,map=ab.GetCurrentDungeonName(),room=ab.GetCurrentRoomIndex(),boss=ab.
IsBossActive(),recordedMaps=ag.Count(),pointCount=ah.IsRecording()and ap.
pointCount or 0,reason=ao}for ar,as in ipairs(an)do pcall(as,aq)end end,true,
true function al.IsTimelineCaptureEnabled()return ap end function al.
SetTimelineCapture(ar)ap=ar and true or false ah.SetCapture(ap)ao'timeline'end
function al.IsTimelineReplayEnabled()return aq end function al.SetTimelineReplay
(ar)aq=ar and true or false ai.SetReplayTimeline(aq)ao'timeline'end function al.
IsSpeedMatchEnabled()return ai.IsSpeedMatchEnabled()end function al.
SetSpeedMatch(ar)ai.SetSpeedMatch(ar and true or false)ao'speedmatch'end
function al.IsUseFastSpeedEnabled()return ai.IsUseFastSpeedEnabled()end function
al.SetUseFastSpeed(ar)ai.SetUseFastSpeed(ar and true or false)ao'usefastspeed'
end function al.IsAutoRetryOnDeathLimitEnabled()return ai.
IsAutoRetryOnDeathLimitEnabled()end function al.SetAutoRetryOnDeathLimit(ar)ai.
SetAutoRetryOnDeathLimit(ar and true or false)ao'retryondeath'end function al.
GetPreAimTime()return ai.GetPreAimTime()end function al.SetPreAimTime(ar)ai.
SetPreAimTime(ar)ao'preaim'end function al.GetSkillFaceHold()return ai.
GetSkillFaceHold()end function al.SetSkillFaceHold(ar)ai.SetSkillFaceHold(ar)ao
'facehold'end function al.GetDoubleClickDelay()return ai.GetDoubleClickDelay()
end function al.SetDoubleClickDelay(ar)ai.SetDoubleClickDelay(ar)ao'doubleclick'
end function al.GetStartPauseTime()return ai.GetStartPauseTime()end function al.
SetStartPauseTime(ar)ai.SetStartPauseTime(ar)ao'startpause'end function al.
IsAimSkillQEnabled()return ai.IsAimSkillQEnabled()end function al.SetAimSkillQ(
ar)ai.SetAimSkillQ(ar and true or false)ao'aimskillq'end function al.
IsAimSkillEEnabled()return ai.IsAimSkillEEnabled()end function al.SetAimSkillE(
ar)ai.SetAimSkillE(ar and true or false)ao'aimskille'end function al.
ToggleRecord(ar)if ar then if ah.IsRecording()then return true end if ai.
IsPlaying()then ai.Stop()end local as,at=ah.Start()if not as then ae.Notify(
'Path Record','Failed to start record: '..tostring(at),3)end ao()return as else
local as=ah.IsRecording()ah.Stop()ao()return as end end function al.IsRecording(
)return ah.IsRecording()end function al.CurrentRoomHasRecord()return ag.
HasSegmentOrMacro(ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex())end
function al.GetMapMode(ar)return ag.GetMapMode(ar)end function al.SetMapMode(ar,
as)if ag.SetMapMode(ar,as)then ao'mode'end end function al.IsAutoPlayWanted()
return am end function al.TogglePlay(ar)am=ar and true or false if am then if ai
.IsPlaying()then ao'already_playing'return true end if ah.IsRecording()then ah.
Stop()end if ab.IsInLobby()then ao'armed_lobby'return true end local as,at=ab.
GetCurrentDungeonName(),ab.GetCurrentRoomIndex()if not as or#as==0 or at<=0 then
ao'armed_waiting'return true end if ab.IsBossActive()and ag.GetMapMode(as)~=
'full'then ao'armed_boss'return true end if ag.HasSegmentOrMacro(as,at)then ad.
EnableExclusive'PathRecord'ai.Start()end ao'play_started'return true else local
as=ai.IsPlaying()ai.Stop()ao'play_stopped'return as end end function al.
IsPlaying()return ai.IsPlaying()end function al.IsEnabled()return ai.IsPlaying()
end function al.SetRangeVisual(ar)ak.SetEnabled(ar)ao'rangevisual'end function
al.IsRangeVisualEnabled()return ak.IsEnabled()end function al.
SetRangeVisualRadius(ar)ak.SetRadius(ar)ao'rangeradius'end function al.
GetRangeVisualRadius()return ak.GetRadius()end function al.SetRangeVisualFill(ar
)ak.SetFillEnabled(ar)ao'rangefill'end function al.IsRangeVisualFillEnabled()
return ak.IsFillEnabled()end function al.SetHighlightInRange(ar)ak.
SetHighlightInRange(ar)ao'rangehighlight'end function al.
IsHighlightInRangeEnabled()return ak.IsHighlightInRangeEnabled()end function al.
GetRangeColorNames()return ak.GetColorNames()end function al.
GetSelectedCircleColor()return ak.GetSelectedCircleColor()end function al.
SetCircleColor(ar)ak.SetCircleColor(ar)ao'circlecolor'end function al.
GetSelectedHighlightColor()return ak.GetSelectedHighlightColor()end function al.
SetHighlightColor(ar)ak.SetHighlightColor(ar)ao'highlightcolor'end function al.
SetVisualEnabled(ar)aj.SetEnabled(ar)ao'visual'end function al.IsVisualEnabled()
return aj.IsEnabled()end function al.SetVisualShowLines(ar)aj.SetShowLines(ar)ao
'visuallines'end function al.IsVisualShowLinesEnabled()return aj.
IsShowLinesEnabled()end function al.SetVisualNodeRadius(ar)aj.SetNodeRadius(ar)
ao'visualradius'end function al.GetVisualNodeRadius()return aj.GetNodeRadius()
end function al.SetVisualAlwaysOnTop(ar)aj.SetAlwaysOnTop(ar)ao'visualontop'end
function al.IsVisualAlwaysOnTopEnabled()return aj.IsAlwaysOnTopEnabled()end
function al.SetVisualShowEvents(ar)aj.SetShowEvents(ar)ao'visualevents'end
function al.IsVisualShowEventsEnabled()return aj.IsShowEventsEnabled()end
function al.SetVisualShowFacing(ar)aj.SetShowFacingRays(ar)ao'visualfacing'end
function al.IsVisualShowFacingEnabled()return aj.IsShowFacingRaysEnabled()end
function al.GetMaps()return ag.GetMaps()end function al.GetMacro(ar)return ag.
GetMap(ar)end function al.RemoveMap(ar)ag.RemoveMap(ar)ao'removed'end function
al.ClearAll()ag.ClearAll()ao'cleared'end function al.ReloadFromDisk()ag.
ReloadFromDisk()ao'reloaded'end function al.GetStatus()local ar,as=ah.GetStatus(
),ai.GetStatus()return{recording=ah.IsRecording(),playing=ai.IsPlaying(),resume=
ai.ResumeWanted(),autoPlayWanted=am,inLobby=ab.IsInLobby(),map=ab.
GetCurrentDungeonName(),room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(),
recordedMaps=ag.Count(),pointCount=ar.pointCount,dwellCount=ar.dwellCount or 0,
skillCount=ar.skillCount or 0,progressPercent=as.progressPercent or 0,
progressStuds=as.progressStuds or 0,totalStuds=as.totalStuds or 0}end function
al.OnStatusChanged(ar)if type(ar)~='function'then return function()end end table
.insert(an,ar)return function()for as,at in ipairs(an)do if at==ar then table.
remove(an,as)break end end end end bossConnection=ab.OnBossActiveChanged(
function(ar)local as=ai.GetActiveMap()or ab.GetCurrentDungeonName()local at=as
and ag.GetMapMode(as)=='full'if ar then if at then if ai.ResumeWanted()or am
then local au=ab.GetCurrentRoomIndex()if au>0 and ag.HasSegmentOrMacro(as,au)
then ad.EnableExclusive'PathRecord'ai.Start()ao'boss'end elseif ai.IsPlaying()
then ad.EnableExclusive'PathRecord'end return end if ai.IsPlaying()or ai.
ResumeWanted()or am then ai.PauseForExclusive()if af.IsAutoBossCombatEnabled()
then af.Toggle(true,true)ae.Notify('Path Record',
[[Boss Room: Combat Master enabled (Auto Farm + Dodge + Skill)]],3)else ae.
Notify('Path Record','Boss Room: Paused, using Hazard Scanner',3)end ao'boss'end
else if not at then if af.IsAutoTriggeredByBoss()then af.Toggle(false)ae.Notify(
'Path Record','Boss Defeated: Combat Master disabled',3)end if am or ai.
ResumeWanted()then task.delay(0.5,function()if not am and not ai.ResumeWanted()
then return end if ai.IsPlaying()or ah.IsRecording()then return end local au,av=
ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex()if au and av>0 and ag.
HasSegmentOrMacro(au,av)then ad.EnableExclusive'PathRecord'ai.Start()ao'resumed'
end end)end end end end)storageUnsub=ag.OnChanged(function()ao'storage'end)
roomUnsub=ab.OnRoomIndexChanged(function(ar)if not ab.IsBossActive()and(af.
IsAutoTriggeredByBoss()or af.IsEnabled())then af.Toggle(false)end if not am and
not ai.ResumeWanted()then return end local as=ar or ab.GetCurrentRoomIndex()if
as<=0 or ab.IsInLobby()or ab.IsDead()then return end local at=ab.
GetCurrentDungeonName()if not at or#at==0 then return end if ai.GetActiveMap()
and ai.GetActiveMap()~=at then return end if ab.IsBossActive()and ag.GetMapMode(
at)~='full'then return end if not ag.HasSegmentOrMacro(at,as)then return end if
not ai.IsPlaying()then ad.EnableExclusive'PathRecord'ai.Start()ao'resumed'end
end)mapUnsub=ab.OnDungeonNameChanged(function(ar)if af.IsAutoTriggeredByBoss()or
af.IsEnabled()then af.Toggle(false)end if ah.IsRecording()then ah.Stop
'map change'end if ai.IsPlaying()or ai.ResumeWanted()then local as=ai.
GetActiveMap()if as and as~=ar then ai.Stop()end end if am and ar and#ar>0 then
task.delay(0.3,function()if not am or ai.IsPlaying()or ah.IsRecording()then
return end local as=ab.GetCurrentRoomIndex()if as>0 and ag.HasSegmentOrMacro(ar,
as)then if not(ab.IsBossActive()and ag.GetMapMode(ar)~='full')then ad.
EnableExclusive'PathRecord'ai.Start()ao'map_autoplay'end end end)end ao'map'end)
ah.SetCapture(ap)ai.SetReplayTimeline(aq)ad.Register('PathRecord',function(ar)if
not ar then ai.PauseForExclusive()end ao'disabled'end,al.IsEnabled)task.delay(1,
function()if am and not ai.IsPlaying()and not ah.IsRecording()then local ar=ab.
GetCurrentDungeonName()if ar and#ar>0 and not ab.IsInLobby()then if ag.
HasSegmentOrMacro(ar,ab.GetCurrentRoomIndex())then al.TogglePlay(true)end end
end end)ac.Register(function()ai.Stop()ah.Cancel()aj.Clear()if bossConnection
then bossConnection()bossConnection=nil end if roomUnsub then roomUnsub()
roomUnsub=nil end if mapUnsub then mapUnsub()mapUnsub=nil end if storageUnsub
then storageUnsub()storageUnsub=nil end end)return al end function a.aj()local
aa,ab,ac,ad,ae,af=a.load'e',a.load'b',a.load'ai',a.load'd',a.load'A',a.load'c'
local ag=aa.RunService return function(ah,ai)local aj=ai:Section{Side='Left'}aj:
Header{Name='Path Record Controls'}aj:Label{Text=
[[Macro = 1 recording per map, <font color='rgb(0,255,120)'>click Record once to record continuously</font> across rooms (auto-saves on lobby return). FULL Mode -> records & replays boss rooms as well.]]
}local ak,al,am,an,ao,ap,aq=false,false,false,false local ar,as=function()if not
ao then return nil end local ar=ao:GetOptions()for as,at in pairs(ar)do if at
and as~='None'then local au=string.match(as,'^Map %[(.+)%] %(%d+ rooms%)$')if au
and#au>0 then return au end end end return nil end,aj:Toggle{Name=
'Record Path (Macro)',Default=ac.IsRecording(),Callback=function(ar)if ak then
return end if ar then if ac.IsRecording()then return end if ac.
CurrentRoomHasRecord()then if an then return end an=true ah:Dialog{Title=
'Confirm Record',Description=
[[This room <font color='rgb(255,200,0)'>already has a saved macro</font>.

Recording now will <b>OVERWRITE the existing segment</b> for this room.
Do you still want to re-record?]]
,Buttons={{Name='Record (Overwrite)',Callback=function()an=false local as=ac.
ToggleRecord(true)if not as then pcall(function()ak=true recordToggle:
UpdateState(false,true)ak=false end)end end},{Name='Cancel',Callback=function()
an=false local as,at=pcall(function()ak=true recordToggle:UpdateState(false,true
)ak=false end)if not as then ak=false warn(
'Path Record: Cancel failed to reset toggle - '..tostring(at))end end}}}return
end ac.ToggleRecord(true)else an=false if ac.IsRecording()then ac.ToggleRecord(
false)end end end}aj:Label{Text=
[[Captures <font color='rgb(255,150,80)'>pauses</font> + <font color='rgb(255,80,80)'>skills (M2 / Q / E)</font> + facing direction for pinpoint playback accuracy.]]
}local at,au,av,ax,ay,az,aA,aB,aC=aj:Label{Text=
[[Record Mode (Per-map): <font color='rgb(120,200,255)'>NORMAL</font>]]},aj:
Toggle{Name='Full Mode (Record & Play Boss Rooms)',Default=false,Callback=
function(at)if am then return end local au=ac.GetStatus().map local av=(au and#
au>0)and au or ar()if not av or#av==0 then af.Notify('Path Record',
[[No map selected. Please choose a map in the dropdown or join a dungeon.]],3)
pcall(function()am=true recordBossToggle:UpdateState(false,true)am=false end)
return end ac.SetMapMode(av,at and'full'or'normal')af.Notify('Path Record',(
'Map [%s]: %s Mode'):format(av,at and'FULL (record & replay boss rooms)'or
'NORMAL (skip boss, use Hazard Scanner)'),3)if ap then ap(ac.GetStatus())end end
},aj:Toggle({Name='Play Path (Macro)',Default=ac.IsAutoPlayWanted(),Callback=ad.
Wrap(function(at)if al then return end ac.TogglePlay(at)end)},'Toggle_PR_Play'),
aj:Toggle({Name='Record Pauses & Skills',Default=ac.IsTimelineCaptureEnabled(),
Callback=ad.Wrap(function(at)ac.SetTimelineCapture(at)end)},
'Toggle_PR_TimelineCapture'),aj:Toggle({Name='Replay Pauses & Skills',Default=ac
.IsTimelineReplayEnabled(),Callback=ad.Wrap(function(at)ac.SetTimelineReplay(at)
end)},'Toggle_PR_TimelineReplay'),aj:Toggle({Name='Match Record Speed (Precise)'
,Default=ac.IsSpeedMatchEnabled(),Callback=ad.Wrap(function(at)ac.SetSpeedMatch(
at)end)},'Toggle_PR_SpeedMatch'),aj:Toggle({Name='Use Player Fast Speed',Default
=ac.IsUseFastSpeedEnabled(),Callback=ad.Wrap(function(at)ac.SetUseFastSpeed(at)
end)},'Toggle_PR_UseFastSpeed'),aj:Toggle({Name=
'Auto Retry on Death Limit (5 Deaths)',Default=ac.
IsAutoRetryOnDeathLimitEnabled(),Callback=ad.Wrap(function(at)ac.
SetAutoRetryOnDeathLimit(at)end)},'Toggle_PR_AutoRetryOnDeathLimit'),ai:Section{
Side='Left'}aC:Header{Name='Combat & Skill Timing'}ae.PatchSliderLoadCallback(aC
:Slider({Name='Pre-Aim Lead Time (s)',Default=ac.GetPreAimTime(),Minimum=0.1,
Maximum=1.5,DisplayMethod='Value',Precision=2,Callback=ad.Wrap(function(aF)ac.
SetPreAimTime(aF)end),onInputComplete=function(aF)ad.SaveNow()af.Notify(
'Path Record',('Saved Pre-Aim Lead Time = %ss'):format(tostring(aF)),2)end},
'Slider_PR_PreAimTime'))ae.PatchSliderLoadCallback(aC:Slider({Name=
'Skill Face Hold (s)',Default=ac.GetSkillFaceHold(),Minimum=0.5,Maximum=2,
DisplayMethod='Value',Precision=2,Callback=ad.Wrap(function(aF)ac.
SetSkillFaceHold(aF)end),onInputComplete=function(aF)ad.SaveNow()af.Notify(
'Path Record',('Saved Skill Face Hold = %ss'):format(tostring(aF)),2)end},
'Slider_PR_SkillFaceHold'))ae.PatchSliderLoadCallback(aC:Slider({Name=
'Skill Double Click Delay (s)',Default=ac.GetDoubleClickDelay(),Minimum=0.005,
Maximum=0.1,DisplayMethod='Value',Precision=3,Callback=ad.Wrap(function(aF)ac.
SetDoubleClickDelay(aF)end),onInputComplete=function(aF)ad.SaveNow()af.Notify(
'Path Record',('Saved Double Click Delay = %ss'):format(tostring(aF)),2)end},
'Slider_PR_DoubleClickDelay'))ae.PatchSliderLoadCallback(aC:Slider({Name=
'Start / Finish Pause Time (s)',Default=ac.GetStartPauseTime(),Minimum=0,Maximum
=3,DisplayMethod='Value',Precision=2,Callback=ad.Wrap(function(aF)ac.
SetStartPauseTime(aF)end),onInputComplete=function(aF)ad.SaveNow()af.Notify(
'Path Record',('Saved Start / Finish Pause Time = %ss'):format(tostring(aF)),2)
end},'Slider_PR_StartPauseTime'))aC:Toggle({Name='Aim Skill Q (Buff)',Default=ac
.IsAimSkillQEnabled(),Callback=ad.Wrap(function(aF)ac.SetAimSkillQ(aF)end)},
'Toggle_PR_AimSkillQ')aC:Toggle({Name='Aim Skill E (Attack)',Default=ac.
IsAimSkillEEnabled(),Callback=ad.Wrap(function(aF)ac.SetAimSkillE(aF)end)},
'Toggle_PR_AimSkillE')local aF=ai:Section{Side='Left'}aF:Header{Name=
'Macro Storage'}ao=ae.PatchDropdownRestore(aF:Dropdown{Name='Map Recording',
Options={'None'},Default=1,Required=true,Callback=function(aG)local aH=ac.
GetStatus()if ap then ap(aH)end if aq then aq(aH)end end},false)local aG,aH,aI,
aJ,aK,aL=aF:Button{Name='Delete Selected Map',Callback=function()local aG=ar()if
aG and#aG>0 then ac.RemoveMap(aG)end end},aF:Button{Name=
'Reload Macros (EsclipseHub/DQMacro)',Callback=function()ac.ReloadFromDisk()af.
Notify('Path Record',
'Scanned and reloaded macro files from EsclipseHub/DQMacro/',2)end},false,
'Clear All Recordings',"<font color='rgb(255,80,80)'>Confirm Clear All?</font>",
3 local aM=function()if not aI then return end aI=false if clearTimer then task.
cancel(clearTimer)clearTimer=nil end pcall(function()clearBtn:UpdateName(aJ)end)
end local aN,aO=aF:Button{Name=aJ,Callback=function()if not aI then aI=true if
clearTimer then task.cancel(clearTimer)end clearTimer=task.delay(aL,aM)pcall(
function()clearBtn:UpdateName(aK)end)return end aM()ac.ClearAll()end},ai:Section
{Side='Right'}aO:Header{Name='Status Monitor & Live HUD'}local aP,aQ,aS,aT,aU,aV
=aO:Label{Text="State: <font color='rgb(160,160,160)'>Idle</font>"},aO:Label{
Text="Progress: <font color='rgb(160,160,160)'>-</font>"},aO:Label{Text=
[[Room: <font color='rgb(160,160,160)'>-</font> | Boss: <font color='rgb(160,160,160)'>-</font>]]
},aO:Label{Text="Events: <font color='rgb(160,160,160)'>-</font>"},aO:Label{Text
="Macros: <font color='rgb(160,160,160)'>None</font>"},ai:Section{Side='Right'}
aV:Header{Name='Path 3D Visualizer'}aV:Label{Text=
"Path node visuals: <font color='rgb(255,90,90)'>\u{1f534} Red when recording</font> (real-time) | <font color='rgb(0,255,120)'>\u{1f7e2} Green normally</font> (preview / playback)."
}local aW,aX,aY,aZ=aV:Toggle({Name='Show Path Nodes (3D Spheres)',Default=ac.
IsVisualEnabled(),Callback=ad.Wrap(function(aW)ac.SetVisualEnabled(aW)end)},
'Toggle_PR_VisualEnabled'),aV:Toggle({Name='Connect Path Lines',Default=ac.
IsVisualShowLinesEnabled(),Callback=ad.Wrap(function(aW)ac.SetVisualShowLines(aW
)end)},'Toggle_PR_VisualShowLines'),aV:Toggle({Name=
'Show Event Spheres & 3D Text',Default=ac.IsVisualShowEventsEnabled(),Callback=
ad.Wrap(function(aW)ac.SetVisualShowEvents(aW)end)},'Toggle_PR_VisualShowEvents'
),aV:Toggle({Name='Show Skill Facing Rays',Default=ac.IsVisualShowFacingEnabled(
),Callback=ad.Wrap(function(aW)ac.SetVisualShowFacing(aW)end)},
'Toggle_PR_VisualShowFacing')ae.PatchSliderLoadCallback(aV:Slider({Name=
'Sphere Node Size',Default=ac.GetVisualNodeRadius(),Minimum=0.1,Maximum=1.2,
DisplayMethod='Value',Precision=2,Callback=ad.Wrap(function(a_)ac.
SetVisualNodeRadius(a_)end),onInputComplete=function(a_)ad.SaveNow()end},
'Slider_PR_VisualNodeRadius'))aV:Toggle({Name='Always On Top (X-Ray)',Default=ac
.IsVisualAlwaysOnTopEnabled(),Callback=ad.Wrap(function(a_)ac.
SetVisualAlwaysOnTop(a_)end)},'Toggle_PR_VisualAlwaysOnTop')local a_=ai:Section{
Side='Right'}a_:Header{Name='Skill Range Visual'}a_:Label{Text=
[[Indicator circle around character to estimate <font color='rgb(0,255,200)'>attack range / AOE radius</font> for angle and placement calibration when recording.]]
}local a0=a_:Toggle({Name='Show Range Circle',Default=ac.IsRangeVisualEnabled(),
Callback=ad.Wrap(function(a0)ac.SetRangeVisual(a0)end)},'Toggle_PR_RangeVisual')
ae.PatchSliderLoadCallback(a_:Slider({Name='Skill Range (Studs)',Default=ac.
GetRangeVisualRadius(),Minimum=5,Maximum=120,DisplayMethod='Value',Precision=1,
Callback=ad.Wrap(function(a1)ac.SetRangeVisualRadius(a1)end),onInputComplete=
function(a1)ad.SaveNow()end},'Slider_PR_RangeRadius'))a_:Toggle({Name=
'Fill Circle Area',Default=ac.IsRangeVisualFillEnabled(),Callback=ad.Wrap(
function(a1)ac.SetRangeVisualFill(a1)end)},'Toggle_PR_RangeFill')local a1,a2,a3=
ac.GetRangeColorNames(),ac.GetSelectedCircleColor(),1 for a4,a5 in ipairs(a1)do
if a5==a2 then a3=a4 break end end ae.PatchDropdownRestore(a_:Dropdown({Name=
'Circle Color',Options=a1,Default=a3,Required=true,Callback=ad.Wrap(function(a4)
ac.SetCircleColor(a4)end)},'Dropdown_PR_CircleColor'),false)local a4,a5,a6=a_:
Toggle({Name='Highlight In-Range Enemies (Glow)',Default=ac.
IsHighlightInRangeEnabled(),Callback=ad.Wrap(function(a4)ac.SetHighlightInRange(
a4)end)},'Toggle_PR_HighlightInRange'),ac.GetSelectedHighlightColor(),2 for a7,
a8 in ipairs(a1)do if a8==a5 then a6=a7 break end end ae.PatchDropdownRestore(a_
:Dropdown({Name='Enemy Highlight Color',Options=a1,Default=a6,Required=true,
Callback=ad.Wrap(function(a7)ac.SetHighlightColor(a7)end)},
'Dropdown_PR_HighlightColor'),false)local a7=function(a7)a7=math.clamp(a7 or 0,0
,100)local a8=10 local a9=math.round((a7/100)*a8)local b=a8-a9 local ba=string.
rep('\u{25a0}',a9)..string.rep('\u{25a1}',b)return(
"<font color='rgb(0,255,180)'>%s</font> <b>%d%%</b>"):format(ba,a7)end aq=
function(a8)if not an then pcall(function()if as and as.GetState and as:
GetState()~=a8.recording then ak=true as:UpdateState(a8.recording,true)ak=false
end end)end pcall(function()local a9=ac.IsAutoPlayWanted()if av and av.GetState
and av:GetState()~=a9 then al=true av:UpdateState(a9,true)al=false end end)
pcall(function()local a9=a8.map local b=(a9 and#a9>0)and a9 or ar()local ba=b
and ac.GetMapMode(b)=='full'or false if au and au.GetState and au:GetState()~=ba
then am=true au:UpdateState(ba,true)am=false end end)pcall(function()if aW and
aW.GetState and aW:GetState()~=ac.IsVisualEnabled()then aW:UpdateState(ac.
IsVisualEnabled(),true)end end)pcall(function()if aX and aX.GetState and aX:
GetState()~=ac.IsVisualShowLinesEnabled()then aX:UpdateState(ac.
IsVisualShowLinesEnabled(),true)end end)pcall(function()if aY and aY.GetState
and aY:GetState()~=ac.IsVisualShowEventsEnabled()then aY:UpdateState(ac.
IsVisualShowEventsEnabled(),true)end end)pcall(function()if aZ and aZ.GetState
and aZ:GetState()~=ac.IsVisualShowFacingEnabled()then aZ:UpdateState(ac.
IsVisualShowFacingEnabled(),true)end end)pcall(function()if a0 and a0.GetState
and a0:GetState()~=ac.IsRangeVisualEnabled()then a0:UpdateState(ac.
IsRangeVisualEnabled(),true)end end)pcall(function()if a4 and a4.GetState and a4
:GetState()~=ac.IsHighlightInRangeEnabled()then a4:UpdateState(ac.
IsHighlightInRangeEnabled(),true)end end)end local a8,a9=function(a8)local a9={}
for b,ba in ipairs(a8)do a9[#a9+1]=('Map [%s] (%d rooms)'):format(ba.map,ba.
roomCount)end if#a9==0 then a9[1]='None'end return a9 end local b=function(b)
local ba=a8(b)local bb=table.concat(ba,'|')if bb==a9 then return end a9=bb local
bc for bd,be in pairs(ao:GetOptions())do if be then bc=bd break end end pcall(
function()ao:ClearOptions()end)pcall(function()ao:InsertOptions(ba)end)local bd=
bc if not bd or not ao:IsOption(bd)then bd=ba[1]end pcall(function()ao:
UpdateSelection(bd)end)end ap=function(ba)local bb,bc=false,ba.map local bd=(bc
and#bc>0)and bc or ar()if bd then bb=ac.GetMapMode(bd)=='full'end local be if ba
.recording then be="<font color='rgb(255,90,90)'>Recording...</font>"elseif ba.
playing then be="<font color='rgb(0,230,255)'>Playing</font>"elseif ba.resume
then be="<font color='rgb(255,200,0)'>Waiting (auto-resume)</font>"elseif ba.
autoPlayWanted then if ba.inLobby then be=
"<font color='rgb(100,220,100)'>Armed (Lobby)</font>"elseif not ba.map or#ba.map
==0 then be="<font color='rgb(100,220,100)'>Armed (Loading...)</font>"elseif ba.
boss and not bb then be=
"<font color='rgb(255,160,50)'>Waiting (Boss Room)</font>"else be=
[[<font color='rgb(100,220,100)'>Armed (Waiting for Room)</font>]]end else be=
"<font color='rgb(160,160,160)'>Idle</font>"end pcall(function()aP:UpdateName(
'State: '..be)end)if ba.playing then local bf,bg=a7(ba.progressPercent),(
'(%.1f / %.1f studs)'):format(ba.progressStuds or 0,ba.totalStuds or 0)pcall(
function()aQ:UpdateName('Progress: '..bf..' '..bg)end)elseif ba.recording then
pcall(function()aQ:UpdateName(
[[Progress: <font color='rgb(255,90,90)'>Recording Segment...</font> (]]..
tostring(ba.pointCount or 0)..' pts)')end)else pcall(function()aQ:UpdateName
"Progress: <font color='rgb(160,160,160)'>-</font>"end)end local bf,bg=bb and
"<font color='rgb(255,140,255)'>FULL</font>"or
"<font color='rgb(120,200,255)'>NORMAL</font>",bd and(' (map ['..bd..'])')or
' (per-map)'pcall(function()at:UpdateName('Record Mode'..bg..': '..bf)end)local
bh if ba.boss then if bb then bh=
"<font color='rgb(255,140,255)'>YES (FULL path)</font>"else bh=
"<font color='rgb(255,80,80)'>YES (Hazard Scanner)</font>"end else bh=
"<font color='rgb(0,255,120)'>No</font>"end local bi,bj=ba.room and ba.room>0
and("<font color='rgb(0,255,255)'>room %d</font>"):format(ba.room)or
"<font color='rgb(160,160,160)'>-</font>",ba.map and#ba.map>0 and(
"<font color='rgb(150,255,150)'>%s</font>"):format(ba.map)or
"<font color='rgb(160,160,160)'>-</font>"pcall(function()aS:UpdateName('Map: '..
bj..' | Room: '..bi..' | Boss: '..bh)end)if ba.recording then pcall(function()aT
:UpdateName((
[[Events: <font color='rgb(255,170,60)'>%d pts</font> | <font color='rgb(255,90,220)'>%d skills</font> | <font color='rgb(255,215,0)'>%d pauses</font>]]
):format(ba.pointCount or 0,ba.skillCount or 0,ba.dwellCount or 0))end)elseif ba
.playing then pcall(function()aT:UpdateName
"<font color='rgb(0,230,255)'>Playing</font>"end)else pcall(function()aT:
UpdateName"Events: <font color='rgb(160,160,160)'>-</font>"end)end local bk=ac.
GetMaps()if#bk==0 then pcall(function()aU:UpdateName
"Macros: <font color='rgb(160,160,160)'>None</font>"end)else local bl={}for bm,
bn in ipairs(bk)do local bo=bn.bossCount and bn.bossCount>0 and('+%db'):format(
bn.bossCount)or''bl[#bl+1]=('%s(%dr/%dp%s)'):format(bn.map,bn.roomCount,bn.
pointCount,bo)end pcall(function()aU:UpdateName(
"Macros: <font color='rgb(150,255,150)'>"..table.concat(bl,', ')..'</font>')end)
end b(bk)end local ba,bb=ac.OnStatusChanged(function(ba)ap(ba)aq(ba)end),0 local
bc=ag.Heartbeat:Connect(function()local bc=os.clock()if bc-bb<0.35 then return
end bb=bc local bd=ac.GetStatus()ap(bd)aq(bd)end)ab.Register(function()if bc
then bc:Disconnect()bc=nil end if ba then ba()ba=nil end end)ap(ac.GetStatus())
aq(ac.GetStatus())end end function a.ak()local aa,ab,ac,ad,ae,af=a.load'b',a.
load'e',{},{'armorMain','weaponMain'},10,{warrior={className='Warrior',
primaryStat='physicalDamage'},mage={className='Mage',primaryStat='spellPower'},
guardian={className='Guardian',primaryStat='health'}}local ag,ah=function(ag)if
not ag then return nil,nil end local ah=string.lower(ag)for ai,aj in pairs(af)do
if string.find(ah,ai)then return aj.className,aj.primaryStat end end return nil,
nil end,function(ag)if not ag then return nil end local ah=string.match(ag,
'^%s*([%d,.-]+)')if not ah then return nil end local ai=string.gsub(ah,',','')
return tonumber(ai)end local ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,ax,ay=
function(ai)if not ai then return 0,0 end local aj=string.gsub(ai,',','')local
ak,al=string.match(aj,'(%d+)%s*/%s*(%d+)')if ak and al then return tonumber(ak)
or 0,tonumber(al)or 0 end local am=ah(aj)return 0,am or 0 end,function(ai)if not
ai then return''end local aj=string.match(ai,'^([^\n\r]+)')local ak=aj or ai
local al=string.match(ak,'^(.-)%s*[%(\\[]')if al and al~=''then return string.
gsub(al,'%s+$','')end return string.gsub(ak,'%s+$','')end,function(ai)if not ai
then return false end if string.find(ai,'[\n\r]%s*[%(\\[].-[%)\\]]')then return
true end return string.find(ai,'%s*[%(\\[].-[%)\\]]%s*$')~=nil end,true,{},'',
false,{},{},{},{},{},{}local az=function(az)local aA=ap[az]if aA and az and az.
Parent then ao=true pcall(function()az.Text=aA.text end)ao=false end ap[az]=nil
end local aA,aB=function()for aA,aB in pairs(ap)do az(aA)end table.clear(ap)end,
function(aA,aB)local aC,aF=string.lower(aB),aA:FindFirstChild(aB)if aF then if
aF:IsA'TextLabel'then return aF elseif aF:IsA'GuiObject'then for aG,aH in ipairs
{'valueText','ValueText','value','Value','amount','Amount','text','label'}do
local aI=aF:FindFirstChild(aH)if aI and aI:IsA'TextLabel'then return aI end end
local aG=aF:FindFirstChildOfClass'TextLabel'if aG then return aG end end end for
aG,aH in ipairs(aA:GetDescendants())do if aH:IsA'TextLabel'then local aI=string.
lower(aH.Name)if aI==aC then return aH end if(aI=='valuetext'or aI=='value'or aI
=='amount')and aH.Parent then local aJ=string.lower(aH.Parent.Name)if string.
find(aJ,aC)then return aH end end end end if aC=='upgrades'then for aG,aH in
ipairs(aA:GetDescendants())do if aH:IsA'TextLabel'and not string.find(string.
lower(aH.Name),'title')then if string.find(aH.Text,'%d+%s*/%s*%d+')then return
aH end end end end return nil end local aC=function(aC)if not al then return end
if not aC or not aC:IsA'GuiObject'or not aC.Visible then return end local aF=aC.
Parent if aF and aF:IsA'GuiObject'and not aF.Visible then return end if ao then
return end local aG,aH=aC.Name,{}local aI={aG}for aJ,aK in ipairs(aC:
GetDescendants())do local aL=string.lower(aK.Name)if not string.find(aL,'title')
then if aK:IsA'TextLabel'then local aM,aN=(aK.Parent~=aC and aK.Parent.Name..'/'
..aK.Name)or aK.Name,aj(aK.Text)table.insert(aH,{name=aK.Name,value=aN,kind=
'TextLabel',path=aM,instance=aK})table.insert(aI,aM..'='..aN)elseif aK:IsA
'ValueBase'then local aM,aN=tostring(aK.Value),(aK.Parent~=aC and aK.Parent.Name
..'/'..aK.Name)or aK.Name table.insert(aH,{name=aK.Name,value=aM,kind=
'ValueBase',path=aN})table.insert(aI,aN..'='..aM)end end end local aJ=aB(aC,
'name')local aK=(aJ and aj(aJ.Text))or nil if not aK then for aL,aM in ipairs(aH
)do if string.lower(aM.name)=='name'then aK=aM.value break end end end local aL=
aB(aC,'upgrades')local aM=(aL and aj(aL.Text))or nil if not aM then for aN,aO in
ipairs(aH)do if string.lower(aO.name)=='upgrades'or string.find(aO.value,
'%d+%s*/%s*%d+')then aM=aO.value break end end end local aN,aO,aP=aB(aC,
'physicalDamage')or aB(aC,'physicalPower'),aB(aC,'spellPower'),aB(aC,'health')
local aQ,aS,aT,aU,aV,aW=aN and ah(aj(aN.Text)),aO and ah(aj(aO.Text)),aP and ah(
aj(aP.Text))if aG=='weaponMain'then if(aS or 0)>(aQ or 0)then aU='Mage'aV=
'spellPower'aW=aO else aU='Warrior'aV='physicalDamage'aW=aN end else aU,aV=ag(aK
)if aU=='Warrior'then aW=aN elseif aU=='Mage'then aW=aO elseif aU=='Guardian'
then aW=aP else if(aT or 0)>10000 and(aT or 0)>((aQ or 0)*10)then aU='Guardian'
aV='health'aW=aP elseif(aS or 0)>(aQ or 0)then aU='Mage'aV='spellPower'aW=aO
else aU='Warrior'aV='physicalDamage'aW=aN end end end local aX,aY=ai(aM)local aZ
=math.max(0,aY-aX)if aW and aW:IsA'TextLabel'and aY>0 then local a_=aj(aW.Text)
local a0=ah(a_)if a0 then local a1=a0+(aZ*ae)local a2=string.format('%s\n(%s)',
a_,tostring(a1))for a3,a4 in ipairs(aH)do if a4.instance==aW or a4.name==aV then
a4.isPrimaryStat=true a4.calculatedTotal=a1 a4.remainingUpgrades=aZ a4.
curUpgrades=aX a4.maxUpgrades=aY end end table.insert(aI,'calc='..tostring(a1))
if aW.Text~=a2 then if not ap[aW]then ap[aW]={text=aW.Text}end ao=true pcall(
function()aW.Text=a2 aW.ClipsDescendants=false end)ao=false end end end local a_
={name=1,levelReq=2,physicalDamage=3,spellPower=4,health=5,upgrades=6,sellPrice=
7,description=8}table.sort(aH,function(a0,a1)local a2,a3=a_[a0.name]or 99,a_[a1.
name]or 99 if a2~=a3 then return a2<a3 end return a0.path<a1.path end)local a0=
table.concat(aI,'|')if a0~=an then an=a0 ax=aG am=aH ay=aU for a1,a2 in ipairs(
au)do pcall(a2,ax,am,ay)end end end local aF=function(aF,aG)if as[aG]then return
end as[aG]=true local aH=aG:GetPropertyChangedSignal'Text':Connect(function()if
not al or ao then return end if aF.Visible and not ak(aG.Text)then aC(aF)end end
)table.insert(aq,aH)end local aG=function(aG)if ar[aG]then return end ar[aG]=
true local aH=aG:GetPropertyChangedSignal'Visible':Connect(function()if not al
then return end if aG.Visible then aC(aG)else aA()an=''ax=nil am={}ay=nil for aH
,aI in ipairs(au)do pcall(aI,nil,{},nil)end end end)table.insert(aq,aH)for aI,aJ
in ipairs(aG:GetDescendants())do if aJ:IsA'TextLabel'then aF(aG,aJ)end end local
aI=aG.DescendantAdded:Connect(function(aI)if aI:IsA'TextLabel'then aF(aG,aI)if
aG.Visible then task.defer(function()aC(aG)end)end end end)table.insert(aq,aI)if
aG.Visible then task.defer(function()aC(aG)end)end end local aH,aI=function()
local aH=ab.player or ab.Players.LocalPlayer if not aH then return end local aI=
aH:FindFirstChild'PlayerGui'if not aI then return end local aJ=aI:FindFirstChild
'inventory'if not aJ then return end local aK=aJ:FindFirstChild'itemStatFrame'if
not aK then return end local aL=aK:GetPropertyChangedSignal'Visible':Connect(
function()if not al then return end if not aK.Visible then aA()if ax~=nil then
ax=nil am={}ay=nil an=''for aL,aM in ipairs(au)do pcall(aM,nil,{},nil)end end
end end)table.insert(aq,aL)for aM,aN in ipairs(ad)do local aO=aK:FindFirstChild(
aN)if aO and aO:IsA'GuiObject'then aG(aO)if aO.Visible and aK.Visible then aC(aO
)end end end end,function()if av then task.cancel(av)av=nil end for aH,aI in
ipairs(aq)do pcall(function()aI:Disconnect()end)end table.clear(aq)table.clear(
ar)table.clear(as)aA()ax=nil am={}ay=nil an=''for aH,aI in ipairs(au)do pcall(aI
,nil,{},nil)end end local aJ=function()if av then return end aH()av=task.spawn(
function()while al do task.wait(1.5)if not al then break end local aJ,aK=false,
ab.player or ab.Players.LocalPlayer if aK then local aL=aK:FindFirstChild
'PlayerGui'local aM=aL and aL:FindFirstChild'inventory'local aN=aM and aM:
FindFirstChild'itemStatFrame'if aN and aN.Visible then for aO,aP in ipairs(ad)do
local aQ=aN:FindFirstChild(aP)if aQ and aQ:IsA'GuiObject'then if not ar[aQ]then
aG(aQ)end if aQ.Visible then aJ=true aC(aQ)end end end end end if not aJ and
next(ap)~=nil then aA()if ax~=nil then ax=nil am={}ay=nil an=''for aL,aM in
ipairs(au)do pcall(aM,nil,{},nil)end end end end av=nil end)end function ac.
IsEnabled()return al end function ac.GetActiveInspector()return ax,am,ay end
function ac.SetEnabled(aK)local aL=aK and true or false if al==aL then return
end al=aL if al then aJ()else aI()end for aM,aN in ipairs(at)do pcall(aN,al)end
end function ac.OnChanged(aK)if type(aK)=='function'then table.insert(at,aK)end
end function ac.OnInspectorChanged(aK)if type(aK)=='function'then table.insert(
au,aK)end end function ac.GetActiveFrame()local aK for aL,aM in ipairs(am)do if
aM.name=='name'and aM.value~=''then aK=aM.value break end end return ax,aK end
function ac.OnFrameChanged(aK)if type(aK)=='function'then table.insert(au,
function(aL,aM,aN)local aO for aP,aQ in ipairs(aM)do if aQ.name=='name'and aQ.
value~=''then aO=aQ.value break end end pcall(aK,aL,aO)end)end end function ac.
Init()if not al then al=true end aJ()end aa.Register(function()al=false aI()
table.clear(at)table.clear(au)end)aJ()return ac end function a.al()local aa=
function(aa)local ab=Instance.new'Frame'ab.Name='sortBarFrame'ab.Size=UDim2.new(
0,50,0,280)ab.AutomaticSize=Enum.AutomaticSize.Y ab.Position=UDim2.new(
1.0289711952209473,0,0.3432777225971222,0)ab.AnchorPoint=Vector2.new(0,0)ab.
BackgroundColor3=Color3.fromRGB(18,20,26)ab.BackgroundTransparency=0.15 ab.
BorderSizePixel=0 ab.LayoutOrder=0 ab.ZIndex=1 ab.Visible=true ab.Parent=aa
local ac=Instance.new'UICorner'ac.CornerRadius=UDim.new(0,8)ac.Parent=ab local
ad=Instance.new'UIStroke'ad.Name='DockStroke'ad.Thickness=1.2 ad.Color=Color3.
fromRGB(65,72,90)ad.Transparency=0.3 ad.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border ad.Parent=ab local ae=Instance.new'UIPadding'ae.PaddingTop=UDim.new(0,5)
ae.PaddingBottom=UDim.new(0,5)ae.PaddingLeft=UDim.new(0,5)ae.PaddingRight=UDim.
new(0,5)ae.Parent=ab local af=Instance.new'UIScale'af.Name='SortBarUIScale'af.
Scale=1.25 af.Parent=ab local ag=Instance.new'UIListLayout'ag.Name=
'UIListLayout'ag.Padding=UDim.new(0,6)ag.FillDirection=Enum.FillDirection.
Vertical ag.HorizontalAlignment=Enum.HorizontalAlignment.Center ag.
VerticalAlignment=Enum.VerticalAlignment.Top ag.SortOrder=Enum.SortOrder.
LayoutOrder ag.Parent=ab local ah=function(ah,ai,aj,ak)local al=Instance.new
'ImageButton'al.Name=ah al.Size=UDim2.new(0,40,0,40)al.Position=UDim2.new(0,0,0,
0)al.AnchorPoint=Vector2.new(0,0)al.BackgroundColor3=Color3.fromRGB(25,28,36)al.
BackgroundTransparency=0.65 al.BorderSizePixel=0 al.LayoutOrder=ai al.ZIndex=1
al.Visible=true al.Image=''al.AutoButtonColor=false al.Parent=ab local am=
Instance.new'UICorner'am.CornerRadius=UDim.new(0,6)am.Parent=al local an=
Instance.new'UIStroke'an.Thickness=1.2 an.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border an.Transparency=0.85 an.Color=Color3.fromRGB(60,66,82)an.Parent=al local
ao=Instance.new'UIPadding'ao.PaddingTop=UDim.new(0,7)ao.PaddingBottom=UDim.new(0
,7)ao.PaddingLeft=UDim.new(0,7)ao.PaddingRight=UDim.new(0,7)ao.Parent=al local
ap=Instance.new'ImageLabel'ap.Name=aj ap.Size=UDim2.new(1,0,1,0)ap.Position=
UDim2.new(0.5,0,0.5,0)ap.AnchorPoint=Vector2.new(0.5,0.5)ap.BackgroundColor3=
Color3.fromRGB(255,255,255)ap.BackgroundTransparency=1 ap.BorderSizePixel=0 ap.
LayoutOrder=0 ap.ZIndex=1 ap.Visible=true ap.Image=ak ap.ImageColor3=Color3.
fromRGB(255,255,255)ap.ImageTransparency=0.35 ap.ScaleType=Enum.ScaleType.Fit ap
.Parent=al return al end ah('IBmainFilter',1,'imageSort',
'rbxassetid://73746166761985')ah('IBrarity',2,'imageRarity',
'rbxassetid://105634041692696')ah('IBphysic',3,'imagePhysic',
'rbxassetid://121406454377051')ah('IBspell',4,'imageSpell',
'rbxassetid://125012650497883')ah('IBhealth',5,'imageHealth',
'rbxassetid://88525382655929')ah('IBability',6,'imageAbility',
'rbxassetid://109718589733073')return ab end return aa end function a.am()local
aa,ab,ac,ad,ae=a.load'b',a.load'e',a.load'c',a.load'al',a.load'a'local af,ag,ah,
ai,aj,ak,al,am,an,ao,ap=ab.TweenService or game:GetService'TweenService',ab.
HttpService or game:GetService'HttpService',{},'None',false,false,true,1.25,
function()local af='EsclipseHub'pcall(function()if ae and ae.Folder then af=ae.
Folder end end)return af end local aq,ar=function()return an()..
'/settings/inventory_sort.json'end,function()if not(makefolder and isfolder)then
return end pcall(function()local aq=an()if not isfolder(aq)then makefolder(aq)
end local ar=aq..'/settings'if not isfolder(ar)then makefolder(ar)end end)end
local as,at,au,av,ax,ay,az,aA,aB,aC,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ,aS,aT,aU
=function()if not(isfile and readfile)then return end local as=aq()if not
isfile(as)then return end local at,au=pcall(function()local at=readfile(as)
return ag:JSONDecode(at)end)if not(at and type(au)=='table')then return end if
au.mainFilterMode=='Descending'or au.mainFilterMode=='Ascending'or au.
mainFilterMode=='None'then ai=au.mainFilterMode end if type(au.rarityEnabled)==
'boolean'then aj=au.rarityEnabled end if au.selectedStatFilter==
'Physical Damage'or au.selectedStatFilter=='Spell Power'or au.selectedStatFilter
=='Health'then ao=au.selectedStatFilter elseif au.selectedStatFilter==nil then
ao=nil end if type(au.abilityEnabled)=='boolean'then ak=au.abilityEnabled end if
type(au.autoSortEnabled)=='boolean'then al=au.autoSortEnabled end if ak then aj=
false ao=nil elseif ao~=nil then aj=false end end,function()if not(isfile and
writefile)then return end if ap then task.cancel(ap)ap=nil end ap=task.delay(0.5
,function()ap=nil pcall(function()ar()local as,at=aq(),{mainFilterMode=ai,
rarityEnabled=aj,selectedStatFilter=ao,abilityEnabled=ak,autoSortEnabled=al}
writefile(as,ag:JSONEncode(at))end)end)end,function(as)if not as then return end
local at=as:FindFirstChildOfClass'UIScale'if not at then at=Instance.new
'UIScale'at.Name='SortBarUIScale'at.Parent=as end at.Scale=am end,0,30,6,false,{
common=1,uncommon=2,rare=3,epic=4,legendary=5,ultimate=6,mythic=7},{weapon=
'weapons',chest='chests',helmet='helmets',ability='abilities'},{None=
'rbxassetid://73746166761985',Descending='rbxassetid://130494621181478',
Ascending='rbxassetid://140381370510884'},{TweenDuration=0.16,EasingStyle=Enum.
EasingStyle.Quad,EasingDirection=Enum.EasingDirection.Out,Inactive={
BackgroundTransparency=0.2,BackgroundColor3=Color3.fromRGB(28,31,40),
ElementTransparency=0,ElementColor3=Color3.fromRGB(235,240,252),
StrokeTransparency=0.4,StrokeColor3=Color3.fromRGB(65,72,90)},Hovered={
BackgroundTransparency=0.1,BackgroundColor3=Color3.fromRGB(45,52,68),
ElementTransparency=0,ElementColor3=Color3.fromRGB(255,255,255),
StrokeTransparency=0.15,StrokeColor3=Color3.fromRGB(150,165,195)},Active={
BackgroundTransparency=0.1,BackgroundColor3=Color3.fromRGB(30,55,85),
ElementTransparency=0,ElementColor3=Color3.fromRGB(255,255,255),
StrokeTransparency=0,StrokeColor3=Color3.fromRGB(80,180,255)},ActiveHovered={
BackgroundTransparency=0.05,BackgroundColor3=Color3.fromRGB(40,75,115),
ElementTransparency=0,ElementColor3=Color3.fromRGB(255,255,255),
StrokeTransparency=0,StrokeColor3=Color3.fromRGB(120,210,255)}},{IBmainFilter={
ActiveBg=Color3.fromRGB(28,55,90),ActiveStroke=Color3.fromRGB(80,180,255),
ActiveHoverBg=Color3.fromRGB(38,75,120),ActiveHoverStroke=Color3.fromRGB(120,210
,255)},IBphysic={ActiveBg=Color3.fromRGB(75,30,22),ActiveStroke=Color3.fromRGB(
245,95,55),ActiveHoverBg=Color3.fromRGB(105,42,30),ActiveHoverStroke=Color3.
fromRGB(255,130,85)},IBspell={ActiveBg=Color3.fromRGB(25,45,95),ActiveStroke=
Color3.fromRGB(65,150,255),ActiveHoverBg=Color3.fromRGB(38,65,130),
ActiveHoverStroke=Color3.fromRGB(105,180,255)},IBhealth={ActiveBg=Color3.
fromRGB(20,60,32),ActiveStroke=Color3.fromRGB(55,210,115),ActiveHoverBg=Color3.
fromRGB(28,85,45),ActiveHoverStroke=Color3.fromRGB(90,235,145)},IBrarity={
ActiveBg=Color3.fromRGB(75,58,16),ActiveStroke=Color3.fromRGB(255,205,50),
ActiveHoverBg=Color3.fromRGB(105,82,22),ActiveHoverStroke=Color3.fromRGB(255,225
,95)},IBability={ActiveBg=Color3.fromRGB(60,25,85),ActiveStroke=Color3.fromRGB(
195,90,255),ActiveHoverBg=Color3.fromRGB(85,35,120),ActiveHoverStroke=Color3.
fromRGB(215,125,255)}},{},false,{},{},{},{},{},{}local aV,aW=function(aV)local
aW={}if type(aV)~='table'then return aW end for aX,aY in pairs(aV)do if type(aY)
=='table'then local aZ=aB[aX]or aX for a_,a0 in pairs(aY)do local a1=tostring(a_
)aW[a1]=a0 local a2=string.match(a1,'_(%d+)$')if a2 then aW[aX..'_'..a2]=a0 aW[
aZ..'_'..a2]=a0 local a3=string.match(a1,'^(.-)_')if a3 then aW[a3..'_'..a2]=a0
end end end end end return aW end,function(aV)local aW=os.clock()if not aV and
aP and(aW-av)<ax then return aP end if aP and(aW-av)<ay then return aP end if(aW
-av)<3 then return aP end if az then return aP end az=true local aX,aY=pcall(
function()local aX=ab.ReplicatedStorage or game:GetService'ReplicatedStorage'
local aY=aX and aX:FindFirstChild'remotes'if not aY then return nil end local aZ
=aY:FindFirstChild'reloadInvy'if not aZ or not aZ:IsA'RemoteFunction'then return
nil end return aZ:InvokeServer()end)az=false av=os.clock()if aX and aY then if
type(aY)=='table'and aY['1']and type(aY['1'])=='table'then aP=aY['1']else aP=aY
end aQ=nil return aP end return aP end local aX,aY,aZ=function(aX,aY,aZ)if not
aX or type(aX)~='table'then return nil end if not aQ then aQ=aV(aX)end return aQ
[aY..'_'..aZ]end,false,function(aX)if not aX then return 0,0 end local aY=string
.gsub(tostring(aX),',','')local aZ,a_=string.match(aY,'(%d+)%s*/%s*(%d+)')if aZ
and a_ then return tonumber(aZ)or 0,tonumber(a_)or 0 end local a0=tonumber(
string.match(aY,'^%s*([%d.-]+)'))return 0,a0 or 0 end local a_=function(a_,a0)if
not a_ or type(a_)~='table'then return 0,0 end if not aY then aY=true local a1={
}for a2,a3 in pairs(a_)do table.insert(a1,string.format('%s=%s',tostring(a2),
tostring(a3)))end print(string.format('[InventorySort:ItemDump] %s (%s): %s',
tostring(a_.name or'Unknown'),tostring(a_.rarity or'Common'),table.concat(a1,
', ')))end local a1,a2,a3=a_.totalUpgrades or a_.maxUpgrades or a_.totalUpgrade
or a_.maxUpgrade or a_.upgradesTotal or a_.upgradesMax or a_.upgradeTotal or a_.
upgradeLimit or a_.availableUpgrades if a1~=nil then a3=tonumber(a1)end local a4
=a_.curUpgrades or a_.currentUpgrades or a_.currentUpgrade or a_.upgradesCur if
a4~=nil then a2=tonumber(a4)end if a_.upgrades~=nil then if type(a_.upgrades)==
'string'then local a5,a6=aZ(a_.upgrades)a2=a2 or a5 a3=a3 or a6 elseif type(a_.
upgrades)=='number'then a2=a2 or a_.upgrades elseif type(a_.upgrades)=='table'
then local a5,a6=a_.upgrades.cur or a_.upgrades.current or a_.upgrades[1],a_.
upgrades.max or a_.upgrades.total or a_.upgrades.totalUpgrades or a_.upgrades[2]
if a5~=nil then a2=a2 or tonumber(a5)end if a6~=nil then a3=a3 or tonumber(a6)
end end end if(not a3 or a3==0)and a0 and a0:IsA'GuiObject'then for a5,a6 in
ipairs{'totalUpgrades','maxUpgrades','upgrades','totalUpgrade'}do local a7=a0:
FindFirstChild(a6)if not a7 then local a8=a0:FindFirstChild'itemType'if a8 then
a7=a8:FindFirstChild(a6)end end if a7 and a7:IsA'ValueBase'then local a8=
tonumber(a7.Value)if a8 and a8>0 then a3=a8 break end end end end return a2 or 0
,a3 or 0 end local a0=function(a0,a1,a2,a3,a4,a5,a6)if not a0 or type(a0)~=
'table'then local a7=math.max(a2,a3,a4)return a2,a3,a4,a7 end local a7,a8=a_(a0,
a6)local a9=math.max(0,a8-a7)local b,ba,bb,bc,bd=a9*10,a2,a3,a4,string.lower(a1
or'')local be=(bd=='weapon'or bd=='weapons'or string.find(bd,'weapon')~=nil)if
be then if a3>a2 then bb=a3+b else ba=a2+b end else local bf=string.lower(a5 or
'')if string.find(bf,'guardian')then bc=a4+b elseif string.find(bf,'mage')then
bb=a3+b elseif string.find(bf,'warrior')then ba=a2+b else if a4>10000 and a4>(a2
*10)then bc=a4+b elseif a3>a2 then bb=a3+b else ba=a2+b end end end local bf=
math.max(ba,bb,bc)return ba,bb,bc,bf end local a1,a2=function(a1,a2,a3)if not a1
:IsA'GuiObject'then return nil end local a4=a1:FindFirstChild'itemType'if not a4
then return nil end local a5,a6,a7=tostring(a4.Value or''),'',a4:FindFirstChild
'uniqueItemNum'if a7 then a6=tostring(a7.Value or'')end local a8,a9,b,ba,bb,bc,
bd,be=aX(a2,a5,a6),tonumber(a1.Name)or a3,0,0,0,0,0,''if a8 and type(a8)==
'table'then b=tonumber(a8.physicalDamage or a8.physicalPower or 0)or 0 ba=
tonumber(a8.spellPower or 0)or 0 bb=tonumber(a8.health or 0)or 0 local bf=string
.lower(tostring(a8.rarity or'common'))bc=aA[bf]or 0 bd=tonumber(a8.levelReq or 0
)or 0 be=tostring(a8.name or'')end local bf,bg,bh,bi=a0(a8,a5,b,ba,bb,be,a1)
return{slot=a1,originalOrder=a9,category=string.lower(a5),physical=b,spell=ba,
health=bb,maxPhysical=bf,maxSpell=bg,maxHealth=bh,maxPot=bi,rarityScore=bc,
levelReq=bd,name=be}end,function(a1)local a2=string.lower(a1)if a2=='weapon'or
a2=='weapons'then return 1 elseif a2=='chest'or a2=='chests'or a2=='helmet'or a2
=='helmets'or a2=='armor'then return 2 elseif a2=='ability'or a2=='abilities'
then return 3 end return 4 end local a3,a4,a5=function(a3,a4)if ai=='None'and
not ak then return a3.originalOrder<a4.originalOrder end if ak then local a5,a6=
(a3.category=='ability'or a3.category=='abilities'),(a4.category=='ability'or a4
.category=='abilities')if a5~=a6 then return a5 end local a7=(ai~='Ascending')if
a5 and a6 then if a3.levelReq~=a4.levelReq then if a7 then return a3.levelReq>a4
.levelReq else return a3.levelReq<a4.levelReq end end if a3.rarityScore~=a4.
rarityScore then if a7 then return a3.rarityScore>a4.rarityScore else return a3.
rarityScore<a4.rarityScore end end if a3.name~=a4.name then return a3.name<a4.
name end return a3.originalOrder<a4.originalOrder end local a8,a9=a2(a3.category
),a2(a4.category)if a8~=a9 then return a8<a9 end if a3.levelReq~=a4.levelReq
then if a7 then return a3.levelReq>a4.levelReq else return a3.levelReq<a4.
levelReq end end if a3.name~=a4.name then return a3.name<a4.name end return a3.
originalOrder<a4.originalOrder end local a5,a6,a7=(ai=='Descending'),a2(a3.
category),a2(a4.category)if a6~=a7 then return a6<a7 end if a6==3 then if a3.
levelReq~=a4.levelReq then if a5 then return a3.levelReq>a4.levelReq else return
a3.levelReq<a4.levelReq end end if a3.rarityScore~=a4.rarityScore then if a5
then return a3.rarityScore>a4.rarityScore else return a3.rarityScore<a4.
rarityScore end end if a3.name~=a4.name then return a3.name<a4.name end return
a3.originalOrder<a4.originalOrder end if ao~=nil then local a8,a9=0,0 if ao==
'Physical Damage'then a8=a3.maxPhysical a9=a4.maxPhysical elseif ao==
'Spell Power'then a8=a3.maxSpell a9=a4.maxSpell elseif ao=='Health'then a8=a3.
maxHealth a9=a4.maxHealth end if a8~=a9 then if a5 then return a8>a9 else return
a8<a9 end end end if aj then if a3.rarityScore~=a4.rarityScore then if a5 then
return a3.rarityScore>a4.rarityScore else return a3.rarityScore<a4.rarityScore
end end end if ao==nil and not aj then local a8,a9=a3.maxPot,a4.maxPot if a8~=a9
then if a5 then return a8>a9 else return a8<a9 end end end if a3.levelReq~=a4.
levelReq then if a5 then return a3.levelReq>a4.levelReq else return a3.levelReq<
a4.levelReq end end if aj then local a8,a9=a3.maxPot,a4.maxPot if a8~=a9 then if
a5 then return a8>a9 else return a8<a9 end end end if ao~=nil then local a8,a9=
a3.maxPot,a4.maxPot if a8~=a9 then return a8>a9 end end if a3.name~=a4.name then
return a3.name<a4.name end if a3.category~=a4.category then local a8,a9=(a3.
category=='chest'or a3.category=='chests'),(a4.category=='chest'or a4.category==
'chests')if a8~=a9 then return a8 end end return a3.originalOrder<a4.
originalOrder end,function()local a3=ab.player or ab.Players.LocalPlayer if not
a3 then return nil,nil end local a4=a3:FindFirstChild'PlayerGui'if not a4 then
return nil,nil end local a5=a4:FindFirstChild'inventory'if not a5 then return
nil,nil end local a6=a5:FindFirstChild'mainBackground'if not a6 or not a6.
Visible then return nil,nil end local a7=a6:FindFirstChild'innerBackground'if
not a7 then return nil,nil end local a8=a7:FindFirstChild'rightSideFrame'if not
a8 then return nil,nil end local a9=a8:FindFirstChild'ScrollingFrame'if not a9
or not a9:IsA'ScrollingFrame'then return nil,nil end local b=a9:
FindFirstChildOfClass'UIGridLayout'return a9,b end function ah.RequestSort(a6)if
not al then return end if ai=='None'and not ak then return end if a5 then task.
cancel(a5)a5=nil end local a7=a6 or 0.15 a5=task.delay(a7,function()a5=nil ah.
ApplySort()end)end function ah.ApplySort()if aI then return end local a6,a7=a4()
if not a6 then return end aI=true local a8,a9=pcall(function()if a7 and a7.
SortOrder~=Enum.SortOrder.LayoutOrder then a7.SortOrder=Enum.SortOrder.
LayoutOrder end local a8,a9,b=aW(),{},0 for ba,bb in ipairs(a6:GetChildren())do
if bb:IsA'GuiObject'and bb.Name~='UIGridLayout'then b=b+1 local bc=a1(bb,a8,b)if
bc then table.insert(a9,bc)end end end if#a9==0 then return end table.sort(a9,
function(ba,bb)return a3(ba,bb)end)for ba,bb in ipairs(a9)do if bb.slot.
LayoutOrder~=ba then bb.slot.LayoutOrder=ba end end end)aI=false if not a8 and
a9 then warn(
'[InventorySort] L\u{1ed7}i khi s\u{1eaf}p x\u{1ebf}p kho \u{111}\u{1ed3}:',a9)
end end local a6=function(a6,a7,a8)local a9,b=aF[a7]or aF.Inactive,aG[a6.Name]
local ba,bb,bc,bd,be,bf=a9.BackgroundTransparency,a9.BackgroundColor3,a9.
ElementTransparency,a9.ElementColor3,a9.StrokeTransparency,a9.StrokeColor3 if a7
=='Active'and b then ba=0.12 bb=b.ActiveBg be=0 bf=b.ActiveStroke elseif a7==
'ActiveHovered'and b then ba=0.05 bb=b.ActiveHoverBg be=0 bf=b.ActiveHoverStroke
end local bg=TweenInfo.new(aF.TweenDuration,aF.EasingStyle,aF.EasingDirection)
pcall(function()if a8 then af:Create(a6,bg,{BackgroundTransparency=ba,
BackgroundColor3=bb}):Play()else a6.BackgroundTransparency=ba a6.
BackgroundColor3=bb end end)for bh,bi in ipairs(a6:GetDescendants())do pcall(
function()if bi:IsA'ImageLabel'or bi:IsA'ImageButton'then if a8 then af:Create(
bi,bg,{ImageTransparency=bc,ImageColor3=bd}):Play()else bi.ImageTransparency=bc
bi.ImageColor3=bd end elseif bi:IsA'TextLabel'or bi:IsA'TextButton'then if a8
then af:Create(bi,bg,{TextTransparency=bc,TextColor3=bd}):Play()else bi.
TextTransparency=bc bi.TextColor3=bd end elseif bi:IsA'UIStroke'then if a8 then
af:Create(bi,bg,{Transparency=be,Color=bf}):Play()else bi.Transparency=be bi.
Color=bf end end end)end end local a7=function(a7,a8)if not a7 or not a7.Parent
then return end local a9=(aJ[a7]==true)if a7.Name=='IBmainFilter'then local b,ba
=(ai~='None'),aC[ai]or aC.None if b then a6(a7,a9 and'ActiveHovered'or'Active',
a8)else a6(a7,a9 and'Hovered'or'Inactive',a8)end for bb,bc in ipairs(a7:
GetDescendants())do if bc:IsA'ImageLabel'then if bc.Image~=ba then bc.Image=ba
end bc.Rotation=0 end end elseif a7.Name=='IBrarity'then local b=(aj==true)if b
then a6(a7,a9 and'ActiveHovered'or'Active',a8)else a6(a7,a9 and'Hovered'or
'Inactive',a8)end elseif a7.Name=='IBphysic'then local b=(ao=='Physical Damage')
if b then a6(a7,a9 and'ActiveHovered'or'Active',a8)else a6(a7,a9 and'Hovered'or
'Inactive',a8)end elseif a7.Name=='IBspell'then local b=(ao=='Spell Power')if b
then a6(a7,a9 and'ActiveHovered'or'Active',a8)else a6(a7,a9 and'Hovered'or
'Inactive',a8)end elseif a7.Name=='IBhealth'then local b=(ao=='Health')if b then
a6(a7,a9 and'ActiveHovered'or'Active',a8)else a6(a7,a9 and'Hovered'or'Inactive',
a8)end elseif a7.Name=='IBability'then local b=(ak==true)if b then a6(a7,a9 and
'ActiveHovered'or'Active',a8)else a6(a7,a9 and'Hovered'or'Inactive',a8)end end
end local a8,a9=function(a8)for a9,b in ipairs(aM)do a7(b,a8)end end,false local
b=function()if a9 then return end a9=true local b,ba=ah.GetSortCriteria(),ah.
GetSortDirection()for bb,bc in ipairs(aN)do pcall(bc,b)end for bb,bc in ipairs(
aO)do pcall(bc,ba)end a9=false end local ba=function(ba)if aK[ba]then return end
aK[ba]=true table.insert(aM,ba)if ba:IsA'ImageButton'or ba:IsA'TextButton'then
ba.AutoButtonColor=false end if not ba:FindFirstChildOfClass'UICorner'then local
bb=Instance.new'UICorner'bb.CornerRadius=UDim.new(0,6)bb.Parent=ba end if not ba
:FindFirstChildOfClass'UIStroke'then local bb=Instance.new'UIStroke'bb.Thickness
=1.2 bb.ApplyStrokeMode=Enum.ApplyStrokeMode.Border bb.Transparency=aF.Inactive.
StrokeTransparency bb.Color=aF.Inactive.StrokeColor3 bb.Parent=ba end if not ba:
FindFirstChildOfClass'UIPadding'then local bb=Instance.new'UIPadding'bb.
PaddingTop=UDim.new(0,7)bb.PaddingBottom=UDim.new(0,7)bb.PaddingLeft=UDim.new(0,
7)bb.PaddingRight=UDim.new(0,7)bb.Parent=ba end for bb,bc in ipairs(ba:
GetChildren())do if bc:IsA'ImageLabel'then bc.AnchorPoint=Vector2.new(0.5,0.5)bc
.Position=UDim2.new(0.5,0,0.5,0)bc.Size=UDim2.new(1,0,1,0)bc.ScaleType=Enum.
ScaleType.Fit elseif bc:IsA'UIListLayout'then bc:Destroy()end end aJ[ba]=false
local bb=ba.MouseEnter:Connect(function()aJ[ba]=true a7(ba,true)end)table.
insert(aH,bb)local bc=ba.MouseLeave:Connect(function()aJ[ba]=false a7(ba,true)
end)table.insert(aH,bc)if ba:IsA'GuiButton'then local bd=ba.Activated:Connect(
function()if ba.Name=='IBmainFilter'then if ai=='None'then ai='Descending'ac.
Notify('Main Filter','Descending (Power High -> Low)',1.5)elseif ai==
'Descending'then ai='Ascending'ac.Notify('Main Filter',
'Ascending (Power Low -> High)',1.5)else ai='None'ac.Notify('Main Filter',
'Deselected (Restore Default Inventory)',1.5)end a8(true)b()if al then ah.
RequestSort(0.05)end at()elseif ba.Name=='IBrarity'then aj=not aj if aj then ao=
nil ak=false if ai=='None'then ai='Descending'end ac.Notify('Filter',
'Mode: Rarity',1.5)else ac.Notify('Filter','Rarity Filter Disabled',1.5)end a8(
true)b()if al then ah.RequestSort(0.05)end at()elseif ba.Name=='IBphysic'or ba.
Name=='IBspell'or ba.Name=='IBhealth'then local bd=(ba.Name=='IBphysic'and
'Physical Damage')or(ba.Name=='IBspell'and'Spell Power')or'Health'if ao==bd then
ao=nil ac.Notify('Filter','Deselected '..bd,1.5)else ao=bd aj=false ak=false if
ai=='None'then ai='Descending'end ac.Notify('Filter','Selected Stat: '..bd,1.5)
end a8(true)b()if al then ah.RequestSort(0.05)end at()elseif ba.Name==
'IBability'then ak=not ak if ak then aj=false ao=nil if ai=='None'then ai=
'Descending'end ac.Notify('Filter','Sort: Ability',1.5)else ac.Notify('Filter',
'Deselected Ability',1.5)end a8(true)b()if al then ah.RequestSort(0.05)end at()
end end)table.insert(aH,bd)end a7(ba,false)end function aU(bb)if aL[bb]then
return end aL[bb]=true pcall(function()bb.BackgroundColor3=Color3.fromRGB(18,20,
26)bb.BackgroundTransparency=0.15 bb.BorderSizePixel=0 if not bb:
FindFirstChildOfClass'UICorner'then local bc=Instance.new'UICorner'bc.
CornerRadius=UDim.new(0,8)bc.Parent=bb end local bc=bb:FindFirstChild
'DockStroke'or bb:FindFirstChildOfClass'UIStroke'if not bc then bc=Instance.new
'UIStroke'bc.Name='DockStroke'bc.Thickness=1.2 bc.Color=Color3.fromRGB(65,72,90)
bc.Transparency=0.3 bc.ApplyStrokeMode=Enum.ApplyStrokeMode.Border bc.Parent=bb
end if not bb:FindFirstChildOfClass'UIPadding'then local bd=Instance.new
'UIPadding'bd.PaddingTop=UDim.new(0,5)bd.PaddingBottom=UDim.new(0,5)bd.
PaddingLeft=UDim.new(0,5)bd.PaddingRight=UDim.new(0,5)bd.Parent=bb end end)local
bc=bb:FindFirstChildOfClass'UIListLayout'if bc then bc.Padding=UDim.new(0,6)end
local bd={IBmainFilter=true,IBrarity=true,IBphysic=true,IBspell=true,IBhealth=
true,IBability=true}for be,bf in ipairs(bb:GetChildren())do if bf:IsA'GuiObject'
and bd[bf.Name]then ba(bf)end end local be=bb.ChildAdded:Connect(function(be)if
be:IsA'GuiObject'and bd[be.Name]then ba(be)end end)table.insert(aH,be)au(bb)a8(
false)end function aT()local bb=ab.player or ab.Players.LocalPlayer if not bb
then return nil end local bc=bb:FindFirstChild'PlayerGui'if not bc then return
nil end local bd=bc:FindFirstChild'inventory'if not bd then return nil end local
be=bd:FindFirstChild'mainBackground'if not be then return nil end local bf=be:
FindFirstChild'innerBackground'if not bf then return nil end if bf:IsA
'GuiObject'then bf.ClipsDescendants=false end if be:IsA'GuiObject'then be.
ClipsDescendants=false end local bg=(bf:FindFirstChild'sortBarFrame')if not bg
and typeof(ad)=='function'then local bh,bi=pcall(ad,bf)if bh and bi then bg=bi
aS=bi end end if bg and typeof(aU)=='function'and not aL[bg]then aU(bg)end
return bg end function ah.GetScale()return am end function ah.GetMainFilterMode(
)return ai end function ah.SetMainFilterMode(bb)if ai==bb then return end ai=bb
a8(true)b()if al then ah.RequestSort(0.05)end at()end function ah.
IsRarityEnabled()return aj end function ah.SetRarityEnabled(bb)local bc=bb and
true or false if aj==bc then return end aj=bc if aj then ao=nil ak=false if ai==
'None'then ai='Descending'end end a8(true)b()if al then ah.RequestSort(0.05)end
at()end function ah.GetStatFilter()return ao end function ah.SetStatFilter(bb)if
ao==bb then return end ao=bb if ao then aj=false ak=false if ai=='None'then ai=
'Descending'end end a8(true)b()if al then ah.RequestSort(0.05)end at()end
function ah.IsAbilityEnabled()return ak end function ah.SetAbilityEnabled(bb)
local bc=bb and true or false if ak==bc then return end ak=bc if ak then aj=
false ao=nil if ai=='None'then ai='Descending'end end a8(true)b()if al then ah.
RequestSort(0.05)end at()end function ah.SetSortCriteria(bb)if not bb or type(bb
)~='string'then return end local bc=ah.GetSortCriteria()if bb=='None'then if ai
=='None'and not aj and not ao and not ak then return end ai='None'aj=false ao=
nil ak=false elseif bb=='Rarity'then if aj and not ak and ao==nil then return
end aj=true ao=nil ak=false if ai=='None'then ai='Descending'end elseif bb==
'Ability'then if ak then return end ak=true aj=false ao=nil if ai=='None'then ai
='Descending'end elseif bb=='Physical Damage'or bb=='Spell Power'or bb=='Health'
then if ao==bb and not ak and not aj then return end ao=bb aj=false ak=false if
ai=='None'then ai='Descending'end elseif bb=='Power'then if ai~='None'and not aj
and ao==nil and not ak then return end if ai=='None'then ai='Descending'end aj=
false ao=nil ak=false else return end if ah.GetSortCriteria()==bc then return
end a8(true)b()if al then ah.RequestSort(0.05)end at()end function ah.
GetSortCriteria()if ak then return'Ability'end if aj then return'Rarity'end if
ao then return ao end if ai~='None'then return'Power'end return'None'end
function ah.SetSortDirection(bb)if not bb or type(bb)~='string'then return end
local bc='None'if bb=='Ascending'or string.find(bb,'Ascending')then bc=
'Ascending'elseif bb=='Descending'or string.find(bb,'Descending')then bc=
'Descending'else bc='None'end if ai==bc then return end ai=bc a8(true)b()if al
then ah.RequestSort(0.05)end at()end function ah.GetSortDirection()if ai==
'Ascending'then return'Ascending'elseif ai=='Descending'then return'Descending'
else return'None'end end function ah.OnCriteriaChanged(bb)if type(bb)==
'function'then table.insert(aN,bb)end end function ah.OnDirectionChanged(bb)if
type(bb)=='function'then table.insert(aO,bb)end end function ah.SetAutoSort(bb)
local bc=bb and true or false if al==bc then return end al=bc at()end function
ah.IsAutoSort()return al end function ah.Init()for bb,bc in ipairs(aH)do pcall(
function()bc:Disconnect()end)end table.clear(aH)table.clear(aK)table.clear(aL)
table.clear(aM)table.clear(aJ)as()b()local bb=ab.ReplicatedStorage or game:
GetService'ReplicatedStorage'local bc=bb and bb:FindFirstChild'remotes'if bc
then local bd=bc:FindFirstChild'reloadInventory'if bd and bd:IsA'RemoteEvent'
then local be=bd.OnClientEvent:Connect(function()local be=os.clock()if(be-av)>=
ay then aP=nil end ah.RequestSort(0.35)end)table.insert(aH,be)end end local bd=
function()local bd=ab.player or ab.Players.LocalPlayer if not bd then return end
local be=bd:WaitForChild('PlayerGui',15)if not be then return end local bf=be:
WaitForChild('inventory',15)if not bf then return end local bg=bf:WaitForChild(
'mainBackground',15)if not bg then return end local bh=bg:WaitForChild(
'innerBackground',15)if not bh then return end aT()if bg.Visible and al and(ai~=
'None'or ak)then ah.RequestSort(0.2)end local bi=bg:GetPropertyChangedSignal
'Visible':Connect(function()if bg.Visible then aT()ah.RequestSort(0.15)end end)
table.insert(aH,bi)local bj=bh.ChildAdded:Connect(function(bj)if bj.Name==
'sortBarFrame'and bj:IsA'GuiObject'then aU(bj)end end)table.insert(aH,bj)local
bk=bh:WaitForChild('rightSideFrame',10)local bl=bk and bk:WaitForChild(
'ScrollingFrame',10)if bl then local bm=bl.ChildAdded:Connect(function(bm)if bm:
IsA'GuiObject'and al and(ai~='None'or ak)then ah.RequestSort(0.3)end end)table.
insert(aH,bm)end end task.spawn(bd)local be=ab.player or ab.Players.LocalPlayer
if be then local bf=be.CharacterAdded:Connect(function()task.delay(1,bd)end)
table.insert(aH,bf)end end aa.Register(function()if a5 then task.cancel(a5)a5=
nil end if ap then task.cancel(ap)ap=nil pcall(function()ar()local bb,bc=aq(),{
mainFilterMode=ai,rarityEnabled=aj,selectedStatFilter=ao,abilityEnabled=ak,
autoSortEnabled=al}writefile(bb,ag:JSONEncode(bc))end)end for bb,bc in ipairs(aH
)do pcall(function()bc:Disconnect()end)end table.clear(aH)table.clear(aK)table.
clear(aL)table.clear(aM)table.clear(aJ)table.clear(aN)table.clear(aO)aP=nil ai=
'None'aj=false ao=nil ak=false if aS and aS.Parent then pcall(function()aS:
Destroy()end)aS=nil end end)ah.Init()return ah end end return function(aa)pcall(
function()local ab=setthreadidentity or set_thread_identity or setidentity or(
syn and syn.set_thread_identity)if ab then local ac=pcall(ab,7)if not ac then
pcall(ab,8)end end end)local ab,ac=game:GetService'Players',os.clock()+15 while
not ab.LocalPlayer do if os.clock()>ac then break end task.wait(0.1)end local ad
=ab.LocalPlayer if not ad then return warn
[[[DungeonQuest] Failed to retrieve LocalPlayer, aborting script initialization.]]
end local ae,af,ag=a.load'a',a.load'b',a.load'd'ag.Suspend()local ah,ai=ae:
Window{Title='DungeonQuest',Subtitle='EsclipseHub',Size=UDim2.fromOffset(1000,
600),SidebarWidth=300,DragStyle=1,DisabledWindowControls={},ShowUserInfo=true,
Keybind=Enum.KeyCode.RightControl,AcrylicBlur=true},a.load'c'ai:SetWindow(ah)_G.
ScriptHub_UI=ah _G.ScriptHub_Cleanup=function()af.Cleanup()end ah.onUnloaded(
function()af.Cleanup()if _G.ScriptHub_UI==ah then _G.ScriptHub_UI=nil end end)
local aj=ah:TabGroup()local ak={Combat=aj:Tab{Name='Combat',Image=
'rbxassetid://10734975692'},Dungeon=aj:Tab{Name='Dungeon Joiner',Image=
'rbxassetid://10734886202'},Inventory=aj:Tab{Name='Inventory',Image=
'rbxassetid://10709769841'},Utilities=aj:Tab{Name='Utilities',Image=
'rbxassetid://10747383470'},Configs=aj:Tab{Name='Configs',Image=
'rbxassetid://10734950309'},PathRecord=aj:Tab{Name='Path Record',Image=
'rbxassetid://10734950309'}}ae:SetFolder'EsclipseHub'local al,am,an,ao,ap,aq=a.
load'H',a.load'M',a.load'O',a.load'Z',a.load'ac',a.load'aj'al(ah,ak.Combat)am(ah
,ak.Dungeon)an(ah,ak.Inventory)ao(ah,ak.Utilities)ap(ah,ak.Configs)aq(ah,ak.
PathRecord)local ar=a.load'B'ar.Init()local as=a.load'T'as.Init()a.load'Q'a.load
'ak'a.load'am'local at=a.load'_'at.SetWindow(ah)at.Execute()local au=a.load'X'au
.SetWindow(ah)au.Init()ak.Combat:Select()local av=a.load'g'av.SetLocked(true)if
ae.Elevate then ae.Elevate()end local ax,ay=pcall(function()ae:
LoadAutoLoadConfig()end)if not ax then warn(
'[DungeonQuest] Error during LoadAutoLoadConfig:',ay)end local az=function()
local az=ae.Folder..'/settings/autoload.txt'if isfile and isfile(az)then local
aA,aB=pcall(readfile,az)if aA and type(aB)=='string'then aB=string.gsub(aB,
'[\r\n%s]+','')if#aB>0 then ag.SetActive(aB)return end end end if not ag.
GetActive()then local aA=ae.Folder..'/settings/Default.json'if isfile and
isfile(aA)then ag.SetActive'Default'end end end az()local aA=a.load'p'aA.
LoadData(ae.contextData)task.delay(0.3,function()av.SetLocked(false)end)task.
delay(1.5,function()ag.Resume()end)end