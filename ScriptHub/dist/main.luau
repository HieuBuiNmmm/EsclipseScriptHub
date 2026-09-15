local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b={Options={},Folder='Maclib'
,contextData={},GetService=function(b)return cloneref and cloneref(game:
GetService(b))or game:GetService(b)end}local c,d,e,f,g,h,i=b.GetService
'TweenService',b.GetService'RunService',b.GetService'HttpService',b.GetService
'ContentProvider',b.GetService'UserInputService',b.GetService'Lighting',b.
GetService'Players'local j,k,l,m,n,o,p,q,r,s=d:IsStudio(),i.LocalPlayer,{},0,
false,{interFont='rbxassetid://12187365364',userInfoBlurred=
'rbxassetid://18824089198',toggleBackground='rbxassetid://18772190202',
togglerHead='rbxassetid://18772309008',buttonImage='rbxassetid://10709791437',
searchIcon='rbxassetid://86737463322606',colorWheel='rbxassetid://2849458409',
colorTarget='rbxassetid://73265255323268',grid='rbxassetid://121484455191370',
globe='rbxassetid://108952102602834',transform='rbxassetid://90336395745819',
dropdown='rbxassetid://18865373378',sliderbar='rbxassetid://18772615246',
sliderhead='rbxassetid://18772834246'}local t,u=function()local t=Instance.new
'ScreenGui't.ScreenInsets=Enum.ScreenInsets.None t.ResetOnSpawn=false t.
ZIndexBehavior=Enum.ZIndexBehavior.Sibling t.DisplayOrder=2147483647 local u=d:
IsStudio()and k:FindFirstChild'PlayerGui'or(gethui and gethui())or(cloneref and
cloneref(b.GetService'CoreGui')or b.GetService'CoreGui')t.Parent=u return t end,
function(t,u,v)return c:Create(t,u,v)end function b:Window(v)local w={Settings=v
}if v.AcrylicBlur~=nil then q=v.AcrylicBlur else q=true end local x,y=t(),
Instance.new'Frame'y.Name='Notifications'y.BackgroundColor3=Color3.fromRGB(255,
255,255)y.BackgroundTransparency=1 y.BorderColor3=Color3.fromRGB(0,0,0)y.
BorderSizePixel=0 y.Size=UDim2.fromScale(1,1)y.Parent=x y.ZIndex=2 local z=
Instance.new'UIListLayout'z.Name='NotificationsUIListLayout'z.Padding=UDim.new(0
,10)z.HorizontalAlignment=Enum.HorizontalAlignment.Right z.SortOrder=Enum.
SortOrder.LayoutOrder z.VerticalAlignment=Enum.VerticalAlignment.Bottom z.Parent
=y local A=Instance.new'UIPadding'A.Name='NotificationsUIPadding'A.PaddingBottom
=UDim.new(0,10)A.PaddingLeft=UDim.new(0,10)A.PaddingRight=UDim.new(0,10)A.
PaddingTop=UDim.new(0,10)A.Parent=y local B=Instance.new'Frame'B.Name='Base'B.
AnchorPoint=Vector2.new(0.5,0.5)B.BackgroundColor3=Color3.fromRGB(15,15,15)B.
BackgroundTransparency=v.AcrylicBlur and 0.05 or 0 B.BorderColor3=Color3.
fromRGB(0,0,0)B.BorderSizePixel=0 B.Position=UDim2.fromScale(0.5,0.5)B.Size=v.
Size or UDim2.fromOffset(868,650)local C=Instance.new'UIScale'C.Name=
'BaseUIScale'C.Parent=B local D=Instance.new'UICorner'D.Name='BaseUICorner'D.
CornerRadius=UDim.new(0,10)D.Parent=B local E=Instance.new'UIStroke'E.Name=
'BaseUIStroke'E.ApplyStrokeMode=Enum.ApplyStrokeMode.Border E.Color=Color3.
fromRGB(255,255,255)E.Transparency=0.9 E.Parent=B local F=Instance.new'Frame'F.
Name='Sidebar'F.BackgroundColor3=Color3.fromRGB(255,255,255)F.
BackgroundTransparency=1 F.BorderColor3=Color3.fromRGB(0,0,0)F.BorderSizePixel=0
F.Position=UDim2.fromScale(-3.5199999999999996E-8,4.69e-8)F.Size=v.SidebarWidth
and UDim2.new(0,v.SidebarWidth,1,0)or UDim2.fromScale(0.325,1)local G=Instance.
new'Frame'G.Name='Divider'G.AnchorPoint=Vector2.new(1,0)G.BackgroundColor3=
Color3.fromRGB(255,255,255)G.BackgroundTransparency=0.9 G.BorderColor3=Color3.
fromRGB(0,0,0)G.BorderSizePixel=0 G.Position=UDim2.fromScale(1,0)G.Size=UDim2.
new(0,1,1,0)G.Parent=F local H=Instance.new'TextButton'H.Name='DividerInteract'H
.AnchorPoint=Vector2.new(0.5,0)H.BackgroundColor3=Color3.fromRGB(255,255,255)H.
BackgroundTransparency=1 H.BorderColor3=Color3.fromRGB(0,0,0)H.BorderSizePixel=0
H.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'H.Position=
UDim2.fromScale(0.5,0)H.Size=UDim2.new(1,6,1,0)H.Text=''H.TextColor3=Color3.
fromRGB(0,0,0)H.TextSize=14 H.Parent=G local I=Instance.new'Frame'I.Name=
'WindowControls'I.BackgroundColor3=Color3.fromRGB(255,255,255)I.
BackgroundTransparency=1 I.BorderColor3=Color3.fromRGB(0,0,0)I.BorderSizePixel=0
I.Size=UDim2.new(1,0,0,31)local J=Instance.new'Frame'J.Name='Controls'J.
BackgroundColor3=Color3.fromRGB(119,174,94)J.BackgroundTransparency=1 J.
BorderColor3=Color3.fromRGB(0,0,0)J.BorderSizePixel=0 J.Size=UDim2.fromScale(1,1
)local K=Instance.new'UIListLayout'K.Name='UIListLayout'K.Padding=UDim.new(0,5)K
.FillDirection=Enum.FillDirection.Horizontal K.SortOrder=Enum.SortOrder.
LayoutOrder K.VerticalAlignment=Enum.VerticalAlignment.Center K.Parent=J local L
=Instance.new'UIPadding'L.Name='UIPadding'L.PaddingLeft=UDim.new(0,11)L.Parent=J
local M,N={sizes={enabled=UDim2.fromOffset(8,8),disabled=UDim2.fromOffset(7,7)},
transparencies={enabled=0,disabled=1},strokeTransparency=0.9},Instance.new
'UIStroke'N.Name='BaseUIStroke'N.ApplyStrokeMode=Enum.ApplyStrokeMode.Border N.
Color=Color3.fromRGB(255,255,255)N.Transparency=M.strokeTransparency local O=
Instance.new'TextButton'O.Name='Exit'O.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'O.Text=''O.TextColor3=Color3.
fromRGB(0,0,0)O.TextSize=14 O.AutoButtonColor=false O.BackgroundColor3=Color3.
fromRGB(250,93,86)O.BorderColor3=Color3.fromRGB(0,0,0)O.BorderSizePixel=0 local
P=Instance.new'UICorner'P.Name='UICorner'P.CornerRadius=UDim.new(1,0)P.Parent=O
O.Parent=J local Q=Instance.new'TextButton'Q.Name='Minimize'Q.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'Q.Text=''Q.TextColor3=Color3.
fromRGB(0,0,0)Q.TextSize=14 Q.AutoButtonColor=false Q.BackgroundColor3=Color3.
fromRGB(252,190,57)Q.BorderColor3=Color3.fromRGB(0,0,0)Q.BorderSizePixel=0 Q.
LayoutOrder=1 local R=Instance.new'UICorner'R.Name='UICorner'R.CornerRadius=UDim
.new(1,0)R.Parent=Q Q.Parent=J local S=Instance.new'TextButton'S.Name='Maximize'
S.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'S.Text=''S.
TextColor3=Color3.fromRGB(0,0,0)S.TextSize=14 S.AutoButtonColor=false S.
BackgroundColor3=Color3.fromRGB(119,174,94)S.BorderColor3=Color3.fromRGB(0,0,0)S
.BorderSizePixel=0 S.LayoutOrder=1 local T=Instance.new'UICorner'T.Name=
'UICorner'T.CornerRadius=UDim.new(1,0)T.Parent=S S.Parent=J local U=function(U,V
)local W,X=V and M.sizes.enabled or M.sizes.disabled,V and M.transparencies.
enabled or M.transparencies.disabled U.Size=W U.BackgroundTransparency=X U.
Active=V U.Interactable=V for Y,Z in ipairs(U:GetChildren())do if Z:IsA
'UIStroke'then Z.Transparency=X end end if not V then N:Clone().Parent=U end end
U(S,false)local V={O,Q}for W,X in pairs(V)do local Y,Z=X.Name,true if v.
DisabledWindowControls and table.find(v.DisabledWindowControls,Y)then Z=false
end U(X,Z)end J.Parent=I local W=Instance.new'Frame'W.Name='Divider'W.
AnchorPoint=Vector2.new(0,1)W.BackgroundColor3=Color3.fromRGB(255,255,255)W.
BackgroundTransparency=0.9 W.BorderColor3=Color3.fromRGB(0,0,0)W.BorderSizePixel
=0 W.Position=UDim2.fromScale(0,1)W.Size=UDim2.new(1,0,0,1)W.Parent=I I.Parent=F
local X=Instance.new'Frame'X.Name='Information'X.BackgroundColor3=Color3.
fromRGB(255,255,255)X.BackgroundTransparency=1 X.BorderColor3=Color3.fromRGB(0,0
,0)X.BorderSizePixel=0 X.Position=UDim2.fromOffset(0,31)X.Size=UDim2.new(1,0,0,
60)local Y=Instance.new'Frame'Y.Name='Divider'Y.AnchorPoint=Vector2.new(0,1)Y.
BackgroundColor3=Color3.fromRGB(255,255,255)Y.BackgroundTransparency=0.9 Y.
BorderColor3=Color3.fromRGB(0,0,0)Y.BorderSizePixel=0 Y.Position=UDim2.
fromScale(0,1)Y.Size=UDim2.new(1,0,0,1)Y.Parent=X local Z=Instance.new'Frame'Z.
Name='InformationHolder'Z.BackgroundColor3=Color3.fromRGB(255,255,255)Z.
BackgroundTransparency=1 Z.BorderColor3=Color3.fromRGB(0,0,0)Z.BorderSizePixel=0
Z.Size=UDim2.fromScale(1,1)local _=Instance.new'UIPadding'_.Name=
'InformationHolderUIPadding'_.PaddingBottom=UDim.new(0,10)_.PaddingLeft=UDim.
new(0,23)_.PaddingRight=UDim.new(0,22)_.PaddingTop=UDim.new(0,10)_.Parent=Z
local aa=Instance.new'ImageButton'aa.Name='GlobalSettingsButton'aa.Image=o.globe
aa.ImageTransparency=0.5 aa.AnchorPoint=Vector2.new(1,0.5)aa.BackgroundColor3=
Color3.fromRGB(255,255,255)aa.BackgroundTransparency=1 aa.BorderColor3=Color3.
fromRGB(0,0,0)aa.BorderSizePixel=0 aa.Position=UDim2.fromScale(1,0.5)aa.Size=
UDim2.fromOffset(16,16)aa.Parent=Z local ab=function(ab)if ab=='Default'then u(
aa,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{ImageTransparency=0.5}):Play()
elseif ab=='Hover'then u(aa,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
ImageTransparency=0.3}):Play()end end aa.MouseEnter:Connect(function()ab'Hover'
end)aa.MouseLeave:Connect(function()ab'Default'end)local ac=Instance.new'Frame'
ac.Name='TitleFrame'ac.BackgroundColor3=Color3.fromRGB(255,255,255)ac.
BackgroundTransparency=1 ac.BorderColor3=Color3.fromRGB(0,0,0)ac.BorderSizePixel
=0 ac.Size=UDim2.fromScale(1,1)local ad=Instance.new'TextLabel'ad.Name='Title'ad
.FontFace=Font.new(o.interFont,Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)ad
.Text=v.Title ad.TextColor3=Color3.fromRGB(255,255,255)ad.RichText=true ad.
TextSize=18 ad.TextTransparency=0.1 ad.TextTruncate=Enum.TextTruncate.SplitWord
ad.TextXAlignment=Enum.TextXAlignment.Left ad.TextYAlignment=Enum.TextYAlignment
.Top ad.AutomaticSize=Enum.AutomaticSize.Y ad.BackgroundColor3=Color3.fromRGB(
255,255,255)ad.BackgroundTransparency=1 ad.BorderColor3=Color3.fromRGB(0,0,0)ad.
BorderSizePixel=0 ad.Size=UDim2.new(1,-20,0,0)ad.Parent=ac local ae=Instance.new
'TextLabel'ae.Name='Subtitle'ae.FontFace=Font.new(o.interFont,Enum.FontWeight.
Medium,Enum.FontStyle.Normal)ae.RichText=true ae.Text=v.Subtitle ae.RichText=
true ae.TextColor3=Color3.fromRGB(255,255,255)ae.TextSize=12 ae.TextTransparency
=0.7 ae.TextTruncate=Enum.TextTruncate.SplitWord ae.TextXAlignment=Enum.
TextXAlignment.Left ae.TextYAlignment=Enum.TextYAlignment.Top ae.AutomaticSize=
Enum.AutomaticSize.Y ae.BackgroundColor3=Color3.fromRGB(255,255,255)ae.
BackgroundTransparency=1 ae.BorderColor3=Color3.fromRGB(0,0,0)ae.BorderSizePixel
=0 ae.LayoutOrder=1 ae.Size=UDim2.new(1,-20,0,0)ae.Parent=ac local af=Instance.
new'UIListLayout'af.Name='TitleFrameUIListLayout'af.Padding=UDim.new(0,3)af.
SortOrder=Enum.SortOrder.LayoutOrder af.VerticalAlignment=Enum.VerticalAlignment
.Center af.Parent=ac ac.Parent=Z Z.Parent=X X.Parent=F local ag=Instance.new
'Frame'ag.Name='SidebarGroup'ag.BackgroundColor3=Color3.fromRGB(255,255,255)ag.
BackgroundTransparency=1 ag.BorderColor3=Color3.fromRGB(0,0,0)ag.BorderSizePixel
=0 ag.Position=UDim2.fromOffset(0,91)ag.Size=UDim2.new(1,0,1,-91)local ah=
Instance.new'Frame'ah.Name='UserInfo'ah.AnchorPoint=Vector2.new(0,1)ah.
BackgroundColor3=Color3.fromRGB(255,255,255)ah.BackgroundTransparency=1 ah.
BorderColor3=Color3.fromRGB(0,0,0)ah.BorderSizePixel=0 ah.Position=UDim2.
fromScale(0,1)ah.Size=UDim2.new(1,0,0,107)local ai=Instance.new'Frame'ai.Name=
'InformationGroup'ai.BackgroundColor3=Color3.fromRGB(255,255,255)ai.
BackgroundTransparency=1 ai.BorderColor3=Color3.fromRGB(0,0,0)ai.BorderSizePixel
=0 ai.Size=UDim2.fromScale(1,1)local aj=Instance.new'UIPadding'aj.Name=
'InformationGroupUIPadding'aj.PaddingBottom=UDim.new(0,17)aj.PaddingLeft=UDim.
new(0,25)aj.Parent=ai local ak=Instance.new'UIListLayout'ak.Name=
'InformationGroupUIListLayout'ak.FillDirection=Enum.FillDirection.Horizontal ak.
SortOrder=Enum.SortOrder.LayoutOrder ak.VerticalAlignment=Enum.VerticalAlignment
.Center ak.Parent=ai local al,am,an=k.UserId,Enum.ThumbnailType.AvatarBust,Enum.
ThumbnailSize.Size48x48 local ao,ap=i:GetUserThumbnailAsync(al,am,an)local aq=
Instance.new'ImageLabel'aq.Name='Headshot'aq.BackgroundColor3=Color3.fromRGB(255
,255,255)aq.BackgroundTransparency=1 aq.BorderColor3=Color3.fromRGB(0,0,0)aq.
BorderSizePixel=0 aq.Size=UDim2.fromOffset(32,32)aq.Image=(ap and ao)or
'rbxassetid://0'local ar=Instance.new'UICorner'ar.Name='UICorner'ar.CornerRadius
=UDim.new(1,0)ar.Parent=aq local as=Instance.new'UIStroke'as.Name='BaseUIStroke'
as.ApplyStrokeMode=Enum.ApplyStrokeMode.Border as.Color=Color3.fromRGB(255,255,
255)as.Transparency=0.9 as.Parent=aq aq.Parent=ai local at=Instance.new'Frame'at
.Name='UserAndDisplayFrame'at.BackgroundColor3=Color3.fromRGB(255,255,255)at.
BackgroundTransparency=1 at.BorderColor3=Color3.fromRGB(0,0,0)at.BorderSizePixel
=0 at.LayoutOrder=1 at.Size=UDim2.new(1,-42,0,32)local au=Instance.new
'TextLabel'au.Name='DisplayName'au.FontFace=Font.new(o.interFont,Enum.FontWeight
.SemiBold,Enum.FontStyle.Normal)au.Text=k.DisplayName au.TextColor3=Color3.
fromRGB(255,255,255)au.TextSize=13 au.TextTransparency=0.1 au.TextTruncate=Enum.
TextTruncate.SplitWord au.TextXAlignment=Enum.TextXAlignment.Left au.
TextYAlignment=Enum.TextYAlignment.Top au.AutomaticSize=Enum.AutomaticSize.XY au
.BackgroundColor3=Color3.fromRGB(255,255,255)au.BackgroundTransparency=1 au.
BorderColor3=Color3.fromRGB(0,0,0)au.BorderSizePixel=0 au.Parent=at au.Size=
UDim2.fromScale(1,0)local av=Instance.new'UIPadding'av.Name=
'UserAndDisplayFrameUIPadding'av.PaddingLeft=UDim.new(0,8)av.PaddingTop=UDim.
new(0,3)av.Parent=at local aw=Instance.new'UIListLayout'aw.Name=
'UserAndDisplayFrameUIListLayout'aw.Padding=UDim.new(0,1)aw.SortOrder=Enum.
SortOrder.LayoutOrder aw.Parent=at local ax=Instance.new'TextLabel'ax.Name=
'Username'ax.FontFace=Font.new(o.interFont,Enum.FontWeight.SemiBold,Enum.
FontStyle.Normal)ax.Text='@'..k.Name ax.TextColor3=Color3.fromRGB(255,255,255)ax
.TextSize=12 ax.TextTransparency=0.7 ax.TextTruncate=Enum.TextTruncate.SplitWord
ax.TextXAlignment=Enum.TextXAlignment.Left ax.TextYAlignment=Enum.TextYAlignment
.Top ax.AutomaticSize=Enum.AutomaticSize.XY ax.BackgroundColor3=Color3.fromRGB(
255,255,255)ax.BackgroundTransparency=1 ax.BorderColor3=Color3.fromRGB(0,0,0)ax.
BorderSizePixel=0 ax.LayoutOrder=1 ax.Parent=at ax.Size=UDim2.fromScale(1,0)at.
Parent=ai ai.Parent=ah local ay=Instance.new'UIPadding'ay.Name=
'UserInfoUIPadding'ay.PaddingLeft=UDim.new(0,10)ay.PaddingRight=UDim.new(0,10)ay
.Parent=ah ah.Parent=ag local az=Instance.new'UIPadding'az.Name=
'SidebarGroupUIPadding'az.PaddingLeft=UDim.new(0,10)az.PaddingRight=UDim.new(0,
10)az.PaddingTop=UDim.new(0,31)az.Parent=ag local aA=Instance.new'Frame'aA.Name=
'TabSwitchers'aA.BackgroundColor3=Color3.fromRGB(255,255,255)aA.
BackgroundTransparency=1 aA.BorderColor3=Color3.fromRGB(0,0,0)aA.BorderSizePixel
=0 aA.Size=UDim2.new(1,0,1,-107)local aB=Instance.new'ScrollingFrame'aB.Name=
'TabSwitchersScrollingFrame'aB.AutomaticCanvasSize=Enum.AutomaticSize.Y aB.
BottomImage=''aB.CanvasSize=UDim2.new()aB.ScrollBarImageTransparency=0.8 aB.
ScrollBarThickness=1 aB.TopImage=''aB.BackgroundColor3=Color3.fromRGB(255,255,
255)aB.BackgroundTransparency=1 aB.BorderColor3=Color3.fromRGB(0,0,0)aB.
BorderSizePixel=0 aB.Size=UDim2.fromScale(1,1)local aC=Instance.new
'UIListLayout'aC.Name='TabSwitchersScrollingFrameUIListLayout'aC.Padding=UDim.
new(0,17)aC.SortOrder=Enum.SortOrder.LayoutOrder aC.Parent=aB local aD=Instance.
new'UIPadding'aD.Name='TabSwitchersScrollingFrameUIPadding'aD.PaddingTop=UDim.
new(0,2)aD.Parent=aB aB.Parent=aA aA.Parent=ag ag.Parent=F F.Parent=B local aE=
Instance.new'Frame'aE.Name='Content'aE.AnchorPoint=Vector2.new(1,0)aE.
BackgroundColor3=Color3.fromRGB(255,255,255)aE.BackgroundTransparency=1 aE.
BorderColor3=Color3.fromRGB(0,0,0)aE.BorderSizePixel=0 aE.Position=UDim2.
fromScale(1,4.69e-8)aE.Size=UDim2.new(0,(B.AbsoluteSize.X-F.AbsoluteSize.X),1,0)
local aF,aG,aH,aI,aJ,aK=false,F.AbsoluteSize.X,20,107 local aL,aM=B.AbsoluteSize
.X-aI,{DefaultTransparency=0.9,HoverTransparency=0.85,EasingStyle=Enum.
EasingStyle.Sine}local aN=function(aN)u(G,TweenInfo.new(0.2,aM.EasingStyle),{
BackgroundTransparency=aN=='Idle'and aM.DefaultTransparency or aM.
HoverTransparency}):Play()end H.MouseEnter:Connect(function()aN'Hover'end)H.
MouseLeave:Connect(function()aN'Idle'end)H.MouseButton1Down:Connect(function()aF
=true aJ=g:GetMouseLocation().X aK=F.AbsoluteSize.X end)g.InputEnded:Connect(
function(aO)if aO.UserInputType==Enum.UserInputType.MouseButton1 then aF=false
end end)g.InputChanged:Connect(function(aO)if aF and aO.UserInputType==Enum.
UserInputType.MouseMovement then local aP=g:GetMouseLocation().X-aJ local aQ=aK+
aP if math.abs(aQ-aG)<aH then aQ=aG else aQ=math.clamp(aQ,aI,aL)end F.Size=UDim2
.new(0,aQ,1,0)aE.Size=UDim2.new(0,B.AbsoluteSize.X-aQ,1,0)end end)local aO=
Instance.new'Frame'aO.Name='Topbar'aO.BackgroundColor3=Color3.fromRGB(255,255,
255)aO.BackgroundTransparency=1 aO.BorderColor3=Color3.fromRGB(0,0,0)aO.
BorderSizePixel=0 aO.Size=UDim2.new(1,0,0,63)local aP=Instance.new'Frame'aP.Name
='Divider'aP.AnchorPoint=Vector2.new(0,1)aP.BackgroundColor3=Color3.fromRGB(255,
255,255)aP.BackgroundTransparency=0.9 aP.BorderColor3=Color3.fromRGB(0,0,0)aP.
BorderSizePixel=0 aP.Position=UDim2.fromScale(0,1)aP.Size=UDim2.new(1,0,0,1)aP.
Parent=aO local aQ=Instance.new'Frame'aQ.Name='Elements'aQ.BackgroundColor3=
Color3.fromRGB(255,255,255)aQ.BackgroundTransparency=1 aQ.BorderColor3=Color3.
fromRGB(0,0,0)aQ.BorderSizePixel=0 aQ.Size=UDim2.fromScale(1,1)local aR=Instance
.new'UIPadding'aR.Name='UIPadding'aR.PaddingLeft=UDim.new(0,20)aR.PaddingRight=
UDim.new(0,20)aR.Parent=aQ local aS=Instance.new'ImageButton'aS.Name='MoveIcon'
aS.Image=o.transform aS.ImageTransparency=0.7 aS.AnchorPoint=Vector2.new(1,0.5)
aS.BackgroundColor3=Color3.fromRGB(255,255,255)aS.BackgroundTransparency=1 aS.
BorderColor3=Color3.fromRGB(0,0,0)aS.BorderSizePixel=0 aS.Position=UDim2.
fromScale(1,0.5)aS.Size=UDim2.fromOffset(15,15)aS.Parent=aQ aS.Visible=not v.
DragStyle or v.DragStyle==1 local aT=Instance.new'TextButton'aT.Name='Interact'
aT.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'aT.Text=''aT.
TextColor3=Color3.fromRGB(0,0,0)aT.TextSize=14 aT.AnchorPoint=Vector2.new(0.5,
0.5)aT.BackgroundColor3=Color3.fromRGB(255,255,255)aT.BackgroundTransparency=1
aT.BorderColor3=Color3.fromRGB(0,0,0)aT.BorderSizePixel=0 aT.Position=UDim2.
fromScale(0.5,0.5)aT.Size=UDim2.fromOffset(40,40)aT.Parent=aS local aU=function(
aU)if aU=='Default'then u(aS,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
ImageTransparency=0.7}):Play()elseif aU=='Hover'then u(aS,TweenInfo.new(0.2,Enum
.EasingStyle.Sine),{ImageTransparency=0.4}):Play()end end aT.MouseEnter:Connect(
function()aU'Hover'end)aT.MouseLeave:Connect(function()aU'Default'end)local aV,
aW,aX,aY=false local aZ,a_,a0=function(aZ)local a_=aZ.Position-aX B.Position=
UDim2.new(aY.X.Scale,aY.X.Offset+a_.X,aY.Y.Scale,aY.Y.Offset+a_.Y)end,function(
aZ)if aZ.UserInputType==Enum.UserInputType.MouseButton1 or aZ.UserInputType==
Enum.UserInputType.Touch then aV=true aX=aZ.Position aY=B.Position aZ.Changed:
Connect(function()if aZ.UserInputState==Enum.UserInputState.End then aV=false
end end)end end,function(aZ)if aV and(aZ.UserInputType==Enum.UserInputType.
MouseMovement or aZ.UserInputType==Enum.UserInputType.Touch)then aW=aZ end end
if not v.DragStyle or v.DragStyle==1 then aT.InputBegan:Connect(function(a1)if
a1.UserInputType==Enum.UserInputType.MouseButton1 or a1.UserInputType==Enum.
UserInputType.Touch then a_(a1)end end)aT.InputChanged:Connect(a0)g.InputChanged
:Connect(function(a1)if a1==aW and aV then aZ(a1)end end)aT.InputEnded:Connect(
function(a1)if a1.UserInputType==Enum.UserInputType.MouseButton1 or a1.
UserInputType==Enum.UserInputType.Touch then aV=false end end)elseif v.DragStyle
==2 then B.InputBegan:Connect(function(a1)if a1.UserInputType==Enum.
UserInputType.MouseButton1 or a1.UserInputType==Enum.UserInputType.Touch then
a_(a1)end end)B.InputChanged:Connect(a0)g.InputChanged:Connect(function(a1)if a1
==aW and aV then aZ(a1)end end)B.InputEnded:Connect(function(a1)if a1.
UserInputType==Enum.UserInputType.MouseButton1 or a1.UserInputType==Enum.
UserInputType.Touch then aV=false end end)end local a1=Instance.new'TextLabel'a1
.Name='CurrentTab'a1.FontFace=Font.new(o.interFont)a1.RichText=true a1.Text=''a1
.RichText=true a1.TextColor3=Color3.fromRGB(255,255,255)a1.TextSize=15 a1.
TextTransparency=0.5 a1.TextTruncate=Enum.TextTruncate.SplitWord a1.
TextXAlignment=Enum.TextXAlignment.Left a1.TextYAlignment=Enum.TextYAlignment.
Top a1.AnchorPoint=Vector2.new(0,0.5)a1.AutomaticSize=Enum.AutomaticSize.Y a1.
BackgroundColor3=Color3.fromRGB(255,255,255)a1.BackgroundTransparency=1 a1.
BorderColor3=Color3.fromRGB(0,0,0)a1.BorderSizePixel=0 a1.Position=UDim2.
fromScale(0,0.5)a1.Size=UDim2.fromScale(0.9,0)a1.Parent=aQ aQ.Parent=aO aO.
Parent=aE aE.Parent=B local a2=Instance.new'Frame'a2.Name='GlobalSettings'a2.
AutomaticSize=Enum.AutomaticSize.XY a2.BackgroundColor3=Color3.fromRGB(15,15,15)
a2.BorderColor3=Color3.fromRGB(0,0,0)a2.BorderSizePixel=0 a2.Position=UDim2.
fromScale(0.298,0.104)local a3=Instance.new'UIStroke'a3.Name=
'GlobalSettingsUIStroke'a3.ApplyStrokeMode=Enum.ApplyStrokeMode.Border a3.Color=
Color3.fromRGB(255,255,255)a3.Transparency=0.9 a3.Parent=a2 local a4=Instance.
new'UICorner'a4.Name='GlobalSettingsUICorner'a4.CornerRadius=UDim.new(0,10)a4.
Parent=a2 local a5=Instance.new'UIPadding'a5.Name='GlobalSettingsUIPadding'a5.
PaddingBottom=UDim.new(0,10)a5.PaddingTop=UDim.new(0,10)a5.Parent=a2 local a6=
Instance.new'UIListLayout'a6.Name='GlobalSettingsUIListLayout'a6.Padding=UDim.
new(0,5)a6.SortOrder=Enum.SortOrder.LayoutOrder a6.Parent=a2 local a7=Instance.
new'UIScale'a7.Name='GlobalSettingsUIScale'a7.Scale=1e-7 a7.Parent=a2 a2.Parent=
B B.Parent=x function w:UpdateTitle(a8)ad.Text=a8 end function w:UpdateSubtitle(
a8)ae.Text=a8 end local a8,a9=a7.Scale==1 and true or false local ba=function()
if not a8 then local ba=u(a7,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum
.EasingDirection.Out),{Scale=1})ba:Play()ba.Completed:Wait()a8=true elseif a8
then local ba=u(a7,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=0})ba:Play()ba.Completed:Wait()a8=false end end aa.
MouseButton1Click:Connect(function()if not r then return end ba()end)a2.
MouseEnter:Connect(function()a9=true end)a2.MouseLeave:Connect(function()a9=
false end)g.InputEnded:Connect(function(bb)if bb.UserInputType==Enum.
UserInputType.MouseButton1 and a8 and not a9 then ba()end end)local bb,bc,bd,be,
bf=B,e,workspace.CurrentCamera,'Glass',{}local bg,bh=(bc:GenerateGUID(true))for
bi,bj in pairs(h:GetChildren())do if not bj:IsA'DepthOfFieldEffect'and bj:HasTag
'.'then bh=Instance.new'DepthOfFieldEffect'bh.FarIntensity=0 bh.FocusDistance=
51.6 bh.InFocusRadius=50 bh.NearIntensity=1 bh.Name=bc:GenerateGUID(true)bh:
AddTag'.'elseif bj:IsA'DepthOfFieldEffect'and bj:HasTag'.'then bh=bj end end if
not bh then bh=Instance.new'DepthOfFieldEffect'bh.FarIntensity=0 bh.
FocusDistance=51.6 bh.InFocusRadius=50 bh.NearIntensity=1 bh.Name=bc:
GenerateGUID(true)bh:AddTag'.'end local bi=Instance.new'Frame'bi.Parent=bb bi.
Size=UDim2.new(0.97,0,0.97,0)bi.Position=UDim2.new(0.5,0,0.5,0)bi.AnchorPoint=
Vector2.new(0.5,0.5)bi.BackgroundTransparency=1 bi.Name=bc:GenerateGUID(true)do
local bj=function(bj)return bj==bj end local bk=bj(bd:ScreenPointToRay(0,0).
Origin.x)while not bk do d.RenderStepped:Wait()bk=bj(bd:ScreenPointToRay(0,0).
Origin.x)end end local bj do local bk,bl,bm,bn,bo=math.acos,math.max,math.pi,
math.sqrt,0.2 local bp=function(bp,bq,br,bs,bt)local bu,bv,bw=(bp-bq).magnitude,
(bq-br).magnitude,(br-bp).magnitude local bx,by,bz,bA=(bl(bu,bv,bw))if bu==bx
then by,bz,bA=bp,bq,br elseif bv==bx then by,bz,bA=bq,br,bp elseif bw==bx then
by,bz,bA=br,bp,bq end local bB=((bz-by).x*(bA-by).x+(bz-by).y*(bA-by).y+(bz-by).
z*(bA-by).z)/(by-bz).magnitude local bC,bD,bE,bF=bn((bA-by).magnitude^2-bB*bB),(
by-bz).magnitude-bB,CFrame.new(bz,by),CFrame.Angles(bm/2,0,0)local bG=bE local
bH,bI=(bG*bF).lookVector,by+CFrame.new(by,bz).lookVector*bB local bJ=CFrame.new(
bI,bA).lookVector local bK=bH.x*bJ.x+bH.y*bJ.y+bH.z*bJ.z local bL=CFrame.Angles(
0,0,bk(bK))bG=bG*bL if((bG*bF).lookVector-bJ).magnitude>0.01 then bG=bG*CFrame.
Angles(0,0,-2*bk(bK))end bG=bG*CFrame.new(0,bC/2,-(bD+bB/2))local bM=bE*bL*
CFrame.Angles(0,bm,0)if((bM*bF).lookVector-bJ).magnitude>0.01 then bM=bM*CFrame.
Angles(0,0,2*bk(bK))end bM=bM*CFrame.new(0,bC/2,bD/2)if not bs then bs=Instance.
new'Part'bs.FormFactor='Custom'bs.TopSurface=0 bs.BottomSurface=0 bs.Anchored=
true bs.CanCollide=false bs.CastShadow=false bs.Material=be bs.Size=Vector3.new(
bo,bo,bo)bs.Name=bc:GenerateGUID(true)local bN=Instance.new('SpecialMesh',bs)bN.
MeshType=2 bN.Name=bg end bs[bg].Scale=Vector3.new(0,bC/bo,bB/bo)bs.CFrame=bG if
not bt then bt=bs:clone()end bt[bg].Scale=Vector3.new(0,bC/bo,bD/bo)bt.CFrame=bM
return bs,bt end function bj(bq,br,bs,bt,bu)bu[1],bu[2]=bp(bq,br,bs,bu[1],bu[2])
bu[3],bu[4]=bp(bs,br,bt,bu[3],bu[4])end end if bf[bi]then return bf[bi].parts
end local bk,bl={},{}do local function bm(bn)if bn:IsA'GuiObject'then bl[#bl+1]=
bn bm(bn.Parent)end end bm(bi)end local bm=function(bm)while bm do if bm:IsA
'GuiObject'then if not bm.Visible then return false end elseif bm:IsA'ScreenGui'
then if not bm.Enabled then return false end break end bm=bm.Parent end return
true end local bn=function(bn)if not bm(bi)or not q or n then for bo,bp in
pairs(bk)do bp.Parent=nil bh.Enabled=false bh.Parent=nil end return end if not
bh.Parent then bh.Parent=h end bh.Enabled=true local bo,bp,bq,br={Transparency=
0.98,BrickColor=BrickColor.new'Institutional white'},1-0.05*bi.ZIndex,bi.
AbsolutePosition,bi.AbsolutePosition+bi.AbsoluteSize local bs,bt=Vector2.new(br.
x,bq.y),Vector2.new(bq.x,br.y)do local bu=0 for bv,bw in ipairs(bl)do bu=bu+bw.
Rotation end if bu~=0 and bu%180~=0 then local bv,bw,bx=bq:lerp(br,0.5),math.
sin(math.rad(bu)),math.cos(math.rad(bu))bq=Vector2.new(bx*(bq.x-bv.x)-bw*(bq.y-
bv.y),bw*(bq.x-bv.x)+bx*(bq.y-bv.y))+bv bs=Vector2.new(bx*(bs.x-bv.x)-bw*(bs.y-
bv.y),bw*(bs.x-bv.x)+bx*(bs.y-bv.y))+bv bt=Vector2.new(bx*(bt.x-bv.x)-bw*(bt.y-
bv.y),bw*(bt.x-bv.x)+bx*(bt.y-bv.y))+bv br=Vector2.new(bx*(br.x-bv.x)-bw*(br.y-
bv.y),bw*(br.x-bv.x)+bx*(br.y-bv.y))+bv end end bj(bd:ScreenPointToRay(bq.x,bq.y
,bp).Origin,bd:ScreenPointToRay(bs.x,bs.y,bp).Origin,bd:ScreenPointToRay(bt.x,bt
.y,bp).Origin,bd:ScreenPointToRay(br.x,br.y,bp).Origin,bk)if bn then for bu,bv
in pairs(bk)do bv.Parent=bd end for bu,bv in pairs(bo)do for bw,bx in pairs(bk)
do bx[bu]=bv end end end end bn(true)d.RenderStepped:Connect(bn)function w:
GlobalSetting(bo)r=true local bp,bq={},Instance.new'TextButton'bq.Name=
'GlobalSetting'bq.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'bq.Text=''bq.TextColor3=Color3.
fromRGB(0,0,0)bq.TextSize=14 bq.BackgroundColor3=Color3.fromRGB(255,255,255)bq.
BackgroundTransparency=1 bq.BorderColor3=Color3.fromRGB(0,0,0)bq.BorderSizePixel
=0 bq.Size=UDim2.fromOffset(200,30)local br=Instance.new'UIPadding'br.Name=
'GlobalSettingToggleUIPadding'br.PaddingLeft=UDim.new(0,15)br.Parent=bq local bs
=Instance.new'TextLabel'bs.Name='SettingName'bs.FontFace=Font.new(o.interFont)bs
.Text=bo.Name bs.RichText=true bs.TextColor3=Color3.fromRGB(255,255,255)bs.
TextSize=13 bs.TextTransparency=0.5 bs.TextTruncate=Enum.TextTruncate.SplitWord
bs.TextXAlignment=Enum.TextXAlignment.Left bs.TextYAlignment=Enum.TextYAlignment
.Top bs.AnchorPoint=Vector2.new(0,0.5)bs.AutomaticSize=Enum.AutomaticSize.Y bs.
BackgroundColor3=Color3.fromRGB(255,255,255)bs.BackgroundTransparency=1 bs.
BorderColor3=Color3.fromRGB(0,0,0)bs.BorderSizePixel=0 bs.Position=UDim2.
fromScale(1.3e-7,0.5)bs.Size=UDim2.new(1,-40,0,0)bs.Parent=bq local bt=Instance.
new'UIListLayout'bt.Name='GlobalSettingToggleUIListLayout'bt.Padding=UDim.new(0,
10)bt.FillDirection=Enum.FillDirection.Horizontal bt.SortOrder=Enum.SortOrder.
LayoutOrder bt.VerticalAlignment=Enum.VerticalAlignment.Center bt.Parent=bq
local bu=Instance.new'TextLabel'bu.Name='Checkmark'bu.FontFace=Font.new(o.
interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)bu.Text='\u{2713}'bu.
TextColor3=Color3.fromRGB(255,255,255)bu.TextSize=13 bu.TextTransparency=1 bu.
TextXAlignment=Enum.TextXAlignment.Left bu.TextYAlignment=Enum.TextYAlignment.
Top bu.AnchorPoint=Vector2.new(0,0.5)bu.AutomaticSize=Enum.AutomaticSize.Y bu.
BackgroundColor3=Color3.fromRGB(255,255,255)bu.BackgroundTransparency=1 bu.
BorderColor3=Color3.fromRGB(0,0,0)bu.BorderSizePixel=0 bu.LayoutOrder=-1 bu.
Position=UDim2.fromScale(1.3e-7,0.5)bu.Size=UDim2.fromOffset(-10,0)bu.Parent=bq
bq.Parent=a2 local bv={duration=0.2,easingStyle=Enum.EasingStyle.Quint,
transparencyIn=0.2,transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-
bt.Padding.Offset,waitTime=1}local bw={checkIn=u(bu,TweenInfo.new(bv.duration,bv
.easingStyle),{Size=UDim2.new(bu.Size.X.Scale,bv.checkSizeIncrease,bu.Size.Y.
Scale,bu.Size.Y.Offset)}),checkOut=u(bu,TweenInfo.new(bv.duration,bv.easingStyle
),{Size=UDim2.new(bu.Size.X.Scale,bv.checkSizeDecrease,bu.Size.Y.Scale,bu.Size.Y
.Offset)}),nameIn=u(bs,TweenInfo.new(bv.duration,bv.easingStyle),{
TextTransparency=bv.transparencyIn}),nameOut=u(bs,TweenInfo.new(bv.duration,bv.
easingStyle),{TextTransparency=bv.transparencyOut})}local bx,by=function(bx)if
not bx then bw.checkOut:Play()bw.nameOut:Play()bu:GetPropertyChangedSignal
'AbsoluteSize':Connect(function()if bu.AbsoluteSize.X<=0 then bu.
TextTransparency=1 end end)else bw.checkIn:Play()bw.nameIn:Play()bu:
GetPropertyChangedSignal'AbsoluteSize':Connect(function()if bu.AbsoluteSize.X>0
then bu.TextTransparency=0 end end)end end,bo.Default bx(by)bq.MouseButton1Click
:Connect(function()by=not by bx(by)task.spawn(function()if bo.Callback then bo.
Callback(by)end end)end)function bp:UpdateName(bz)bs.Text=bz end function bp:
UpdateState(bz)bx(bz)by=bz end return bp end function w:TabGroup()local bo,bp={}
,Instance.new'Frame'bp.Name='Section'bp.AutomaticSize=Enum.AutomaticSize.Y bp.
BackgroundColor3=Color3.fromRGB(255,255,255)bp.BackgroundTransparency=1 bp.
BorderColor3=Color3.fromRGB(0,0,0)bp.BorderSizePixel=0 bp.Size=UDim2.fromScale(1
,0)local bq=Instance.new'Frame'bq.Name='Divider'bq.AnchorPoint=Vector2.new(0.5,1
)bq.BackgroundColor3=Color3.fromRGB(255,255,255)bq.BackgroundTransparency=0.9 bq
.BorderColor3=Color3.fromRGB(0,0,0)bq.BorderSizePixel=0 bq.Position=UDim2.
fromScale(0.5,1)bq.Size=UDim2.new(1,-21,0,1)bq.Parent=bp local br=Instance.new
'Frame'br.Name='SectionTabSwitchers'br.BackgroundColor3=Color3.fromRGB(255,255,
255)br.BackgroundTransparency=1 br.BorderColor3=Color3.fromRGB(0,0,0)br.
BorderSizePixel=0 br.Size=UDim2.fromScale(1,1)local bs=Instance.new
'UIListLayout'bs.Name='UIListLayout'bs.Padding=UDim.new(0,15)bs.
HorizontalAlignment=Enum.HorizontalAlignment.Center bs.SortOrder=Enum.SortOrder.
LayoutOrder bs.Parent=br local bt=Instance.new'UIPadding'bt.Name='UIPadding'bt.
PaddingBottom=UDim.new(0,15)bt.Parent=br br.Parent=bp bp.Parent=aB function bo:
Tab(bu)local bv,bw={Settings=bu},Instance.new'TextButton'bw.Name='TabSwitcher'bw
.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'bw.Text=''bw.
TextColor3=Color3.fromRGB(0,0,0)bw.TextSize=14 bw.AutoButtonColor=false bw.
AnchorPoint=Vector2.new(0.5,0)bw.BackgroundColor3=Color3.fromRGB(255,255,255)bw.
BackgroundTransparency=1 bw.BorderColor3=Color3.fromRGB(0,0,0)bw.BorderSizePixel
=0 bw.Position=UDim2.fromScale(0.5,0)bw.Size=UDim2.new(1,-21,0,40)m+=1 bw.
LayoutOrder=m local bx=Instance.new'UICorner'bx.Name='TabSwitcherUICorner'bx.
Parent=bw local by=Instance.new'UIStroke'by.Name='TabSwitcherUIStroke'by.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border by.Color=Color3.fromRGB(255,255,255)
by.Transparency=1 by.Parent=bw local bz=Instance.new'UIListLayout'bz.Name=
'TabSwitcherUIListLayout'bz.Padding=UDim.new(0,9)bz.FillDirection=Enum.
FillDirection.Horizontal bz.SortOrder=Enum.SortOrder.LayoutOrder bz.
VerticalAlignment=Enum.VerticalAlignment.Center bz.Parent=bw local bA if bu.
Image then bA=Instance.new'ImageLabel'bA.Name='TabImage'bA.Image=bu.Image bA.
ImageTransparency=0.5 bA.BackgroundColor3=Color3.fromRGB(255,255,255)bA.
BackgroundTransparency=1 bA.BorderColor3=Color3.fromRGB(0,0,0)bA.BorderSizePixel
=0 bA.Size=UDim2.fromOffset(18,18)bA.Parent=bw end local bB=Instance.new
'TextLabel'bB.Name='TabSwitcherName'bB.FontFace=Font.new(o.interFont,Enum.
FontWeight.Medium,Enum.FontStyle.Normal)bB.Text=bu.Name bB.RichText=true bB.
TextColor3=Color3.fromRGB(255,255,255)bB.TextSize=16 bB.TextTransparency=0.5 bB.
TextTruncate=Enum.TextTruncate.SplitWord bB.TextXAlignment=Enum.TextXAlignment.
Left bB.TextYAlignment=Enum.TextYAlignment.Top bB.AutomaticSize=Enum.
AutomaticSize.Y bB.BackgroundColor3=Color3.fromRGB(255,255,255)bB.
BackgroundTransparency=1 bB.BorderColor3=Color3.fromRGB(0,0,0)bB.BorderSizePixel
=0 bB.Size=UDim2.fromScale(1,0)bB.Parent=bw bB.LayoutOrder=1 local bC=Instance.
new'UIPadding'bC.Name='TabSwitcherUIPadding'bC.PaddingLeft=UDim.new(0,24)bC.
PaddingRight=UDim.new(0,35)bC.PaddingTop=UDim.new(0,1)bC.Parent=bw bw.Parent=br
local bD=Instance.new'Frame'bD.Name='Elements'bD.BackgroundColor3=Color3.
fromRGB(255,255,255)bD.BackgroundTransparency=1 bD.BorderColor3=Color3.fromRGB(0
,0,0)bD.BorderSizePixel=0 bD.Position=UDim2.fromOffset(0,63)bD.Size=UDim2.new(1,
0,1,-63)bD.ClipsDescendants=true local bE=Instance.new'UIPadding'bE.Name=
'ElementsUIPadding'bE.PaddingRight=UDim.new(0,5)bE.PaddingTop=UDim.new(0,10)bE.
PaddingBottom=UDim.new(0,10)bE.Parent=bD local bF=Instance.new'ScrollingFrame'bF
.Name='ElementsScrolling'bF.AutomaticCanvasSize=Enum.AutomaticSize.Y bF.
BottomImage=''bF.CanvasSize=UDim2.new()bF.ScrollBarImageTransparency=0.5 bF.
ScrollBarThickness=1 bF.TopImage=''bF.BackgroundColor3=Color3.fromRGB(255,255,
255)bF.BackgroundTransparency=1 bF.BorderColor3=Color3.fromRGB(0,0,0)bF.
BorderSizePixel=0 bF.Size=UDim2.fromScale(1,1)bF.ClipsDescendants=false local bG
=Instance.new'UIPadding'bG.Name='ElementsScrollingUIPadding'bG.PaddingBottom=
UDim.new(0,5)bG.PaddingLeft=UDim.new(0,11)bG.PaddingRight=UDim.new(0,3)bG.
PaddingTop=UDim.new(0,5)bG.Parent=bF local bH=Instance.new'UIListLayout'bH.Name=
'ElementsScrollingUIListLayout'bH.Padding=UDim.new(0,15)bH.FillDirection=Enum.
FillDirection.Horizontal bH.SortOrder=Enum.SortOrder.LayoutOrder bH.Parent=bF
local bI=Instance.new'Frame'bI.Name='Left'bI.AutomaticSize=Enum.AutomaticSize.Y
bI.BackgroundColor3=Color3.fromRGB(0,0,0)bI.BackgroundTransparency=1 bI.
BorderColor3=Color3.fromRGB(0,0,0)bI.BorderSizePixel=0 bI.Position=UDim2.
fromScale(0.512,0)bI.Size=UDim2.new(0.5,-10,0,0)local bJ=Instance.new
'UIListLayout'bJ.Name='LeftUIListLayout'bJ.Padding=UDim.new(0,15)bJ.SortOrder=
Enum.SortOrder.LayoutOrder bJ.Parent=bI bI.Parent=bF local bK=Instance.new
'Frame'bK.Name='Right'bK.AutomaticSize=Enum.AutomaticSize.Y bK.BackgroundColor3=
Color3.fromRGB(0,0,0)bK.BackgroundTransparency=1 bK.BorderColor3=Color3.fromRGB(
0,0,0)bK.BorderSizePixel=0 bK.LayoutOrder=1 bK.Position=UDim2.fromScale(0.512,0)
bK.Size=UDim2.new(0.5,-10,0,0)local bL=Instance.new'UIListLayout'bL.Name=
'RightUIListLayout'bL.Padding=UDim.new(0,15)bL.SortOrder=Enum.SortOrder.
LayoutOrder bL.Parent=bK bK.Parent=bF bF.Parent=bD function bv:Section(bM)local
bN,bO={},Instance.new'Frame'bO.Name='Section'bO.AutomaticSize=Enum.AutomaticSize
.Y bO.BackgroundColor3=Color3.fromRGB(255,255,255)bO.BackgroundTransparency=0.98
bO.BorderColor3=Color3.fromRGB(0,0,0)bO.BorderSizePixel=0 bO.Position=UDim2.
fromScale(0,6.78e-8)bO.Size=UDim2.fromScale(1,0)bO.ClipsDescendants=true bO.
Parent=bM.Side=='Left'and bI or bK local bP=Instance.new'UICorner'bP.Name=
'SectionUICorner'bP.Parent=bO local bQ=Instance.new'UIStroke'bQ.Name=
'SectionUIStroke'bQ.ApplyStrokeMode=Enum.ApplyStrokeMode.Border bQ.Color=Color3.
fromRGB(255,255,255)bQ.Transparency=0.95 bQ.Parent=bO local bR=Instance.new
'UIListLayout'bR.Name='SectionUIListLayout'bR.Padding=UDim.new(0,10)bR.SortOrder
=Enum.SortOrder.LayoutOrder bR.Parent=bO local bS=Instance.new'UIPadding'bS.Name
='SectionUIPadding'bS.PaddingBottom=UDim.new(0,20)bS.PaddingLeft=UDim.new(0,20)
bS.PaddingRight=UDim.new(0,18)bS.PaddingTop=UDim.new(0,22)bS.Parent=bO function
bN:Button(bT,bU)local bV,bW={Settings=bT},Instance.new'Frame'bW.Name='Button'bW.
AutomaticSize=Enum.AutomaticSize.Y bW.BackgroundColor3=Color3.fromRGB(0,0,0)bW.
BackgroundTransparency=1 bW.BorderColor3=Color3.fromRGB(0,0,0)bW.BorderSizePixel
=0 bW.Size=UDim2.new(1,0,0,38)bW.Parent=bO local bX=Instance.new'TextButton'bX.
Name='ButtonInteract'bX.FontFace=Font.new(o.interFont)bX.RichText=true bX.
TextColor3=Color3.fromRGB(255,255,255)bX.TextSize=13 bX.TextTransparency=0.5 bX.
TextTruncate=Enum.TextTruncate.AtEnd bX.TextXAlignment=Enum.TextXAlignment.Left
bX.BackgroundColor3=Color3.fromRGB(255,255,255)bX.BackgroundTransparency=1 bX.
BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel=0 bX.Size=UDim2.fromScale(1
,1)bX.Parent=bW bX.Text=bV.Settings.Name local bY=Instance.new'ImageLabel'bY.
Name='ButtonImage'bY.Image=o.buttonImage bY.ImageTransparency=0.5 bY.AnchorPoint
=Vector2.new(1,0.5)bY.BackgroundColor3=Color3.fromRGB(255,255,255)bY.
BackgroundTransparency=1 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel
=0 bY.Position=UDim2.fromScale(1,0.5)bY.Size=UDim2.fromOffset(15,15)bY.Parent=bW
local bZ={DefaultTransparency=0.5,HoverTransparency=0.3,EasingStyle=Enum.
EasingStyle.Sine}local b_,b0=function(b_)if b_=='Idle'then u(bX,TweenInfo.new(
0.2,bZ.EasingStyle),{TextTransparency=bZ.DefaultTransparency}):Play()u(bY,
TweenInfo.new(0.2,bZ.EasingStyle),{ImageTransparency=bZ.DefaultTransparency}):
Play()elseif b_=='Hover'then u(bX,TweenInfo.new(0.2,bZ.EasingStyle),{
TextTransparency=bZ.HoverTransparency}):Play()u(bY,TweenInfo.new(0.2,bZ.
EasingStyle),{ImageTransparency=bZ.HoverTransparency}):Play()end end,function()
if bV.Settings.Callback then bV.Settings.Callback()end end bX.MouseEnter:
Connect(function()b_'Hover'end)bX.MouseLeave:Connect(function()b_'Idle'end)bX.
MouseButton1Click:Connect(b0)function bV:UpdateName(b1)bX.Text=b1 end function
bV:SetVisibility(b1)bW.Visible=b1 end if bU then b.Options[bU]=bV end return bV
end function bN:Toggle(bT,bU)local bV,bW={Settings=bT,IgnoreConfig=false,Class=
'Toggle'},Instance.new'Frame'bW.Name='Toggle'bW.AutomaticSize=Enum.AutomaticSize
.Y bW.BackgroundColor3=Color3.fromRGB(0,0,0)bW.BackgroundTransparency=1 bW.
BorderColor3=Color3.fromRGB(0,0,0)bW.BorderSizePixel=0 bW.Size=UDim2.new(1,0,0,
38)bW.Parent=bO local bX=Instance.new'TextLabel'bX.Name='ToggleName'bX.FontFace=
Font.new(o.interFont)bX.Text=bV.Settings.Name bX.RichText=true bX.TextColor3=
Color3.fromRGB(255,255,255)bX.TextSize=13 bX.TextTransparency=0.5 bX.
TextTruncate=Enum.TextTruncate.AtEnd bX.TextXAlignment=Enum.TextXAlignment.Left
bX.TextYAlignment=Enum.TextYAlignment.Top bX.AnchorPoint=Vector2.new(0,0.5)bX.
AutomaticSize=Enum.AutomaticSize.Y bX.BackgroundColor3=Color3.fromRGB(255,255,
255)bX.BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.
BorderSizePixel=0 bX.Position=UDim2.fromScale(0,0.5)bX.Size=UDim2.new(1,-50,0,0)
bX.Parent=bW local bY=Instance.new'ImageButton'bY.Name='Toggle'bY.Image=o.
toggleBackground bY.ImageColor3=Color3.fromRGB(87,86,86)bY.AutoButtonColor=false
bY.AnchorPoint=Vector2.new(1,0.5)bY.BackgroundColor3=Color3.fromRGB(255,255,255)
bY.BackgroundTransparency=1 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.
BorderSizePixel=0 bY.Position=UDim2.fromScale(1,0.5)bY.Size=UDim2.fromOffset(41,
21)bY.ImageTransparency=0.5 local bZ=Instance.new'UIPadding'bZ.Name=
'ToggleUIPadding'bZ.PaddingBottom=UDim.new(0,1)bZ.PaddingLeft=UDim.new(0,-2)bZ.
PaddingRight=UDim.new(0,3)bZ.PaddingTop=UDim.new(0,1)bZ.Parent=bY local b_=
Instance.new'ImageLabel'b_.Name='TogglerHead'b_.Image=o.togglerHead b_.
ImageColor3=Color3.fromRGB(255,255,255)b_.AnchorPoint=Vector2.new(1,0.5)b_.
BackgroundColor3=Color3.fromRGB(255,255,255)b_.BackgroundTransparency=1 b_.
BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel=0 b_.Position=UDim2.
fromScale(0.5,0.5)b_.Size=UDim2.fromOffset(15,15)b_.ZIndex=2 b_.Parent=bY b_.
ImageTransparency=0.8 bY.Parent=bW local b0,b1,b2,b3={Enabled=0,Disabled=0.5},{
Enabled=0,Disabled=0.85},{Info=TweenInfo.new(0.15,Enum.EasingStyle.Quad),
EnabledPosition=UDim2.new(1,0,0.5,0),DisabledPosition=UDim2.new(0.5,0,0.5,0)},bV
.Settings.Default local b4=function(b4,b5)local b6,b7=b4 and{b0.Enabled,b1.
Enabled}or{b0.Disabled,b1.Disabled},b4 and b2.EnabledPosition or b2.
DisabledPosition u(bY,b2.Info,{ImageTransparency=b6[1]}):Play()u(b_,b2.Info,{
ImageTransparency=b6[2]}):Play()u(b_,b2.Info,{Position=b7}):Play()bV.State=b4 if
b5 then b5(b3)end end b4(b3)local b5=function()b3=not b3 b4(b3,bV.Settings.
Callback)end bY.MouseButton1Click:Connect(b5)function bV:Toggle()b5()end
function bV:UpdateState(b6)b3=b6 b4(b3,bV.Settings.Callback)end function bV:
GetState()return b3 end function bV:UpdateName(b6)bX.Text=b6 end function bV:
SetVisibility(b6)bW.Visible=b6 end if bU then b.Options[bU]=bV end return bV end
function bN:Slider(bT,bU)local bV,bW={Settings=bT,IgnoreConfig=false,Class=
'Slider'},Instance.new'Frame'bW.Name='Slider'bW.AutomaticSize=Enum.AutomaticSize
.Y bW.BackgroundColor3=Color3.fromRGB(0,0,0)bW.BackgroundTransparency=1 bW.
BorderColor3=Color3.fromRGB(0,0,0)bW.BorderSizePixel=0 bW.Size=UDim2.new(1,0,0,
38)bW.Parent=bO local bX=Instance.new'TextLabel'bX.Name='SliderName'bX.FontFace=
Font.new(o.interFont)bX.Text=bV.Settings.Name bX.RichText=true bX.TextColor3=
Color3.fromRGB(255,255,255)bX.TextSize=13 bX.TextTransparency=0.5 bX.
TextTruncate=Enum.TextTruncate.AtEnd bX.TextXAlignment=Enum.TextXAlignment.Left
bX.TextYAlignment=Enum.TextYAlignment.Top bX.AnchorPoint=Vector2.new(0,0.5)bX.
AutomaticSize=Enum.AutomaticSize.XY bX.BackgroundColor3=Color3.fromRGB(255,255,
255)bX.BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.
BorderSizePixel=0 bX.Position=UDim2.fromScale(1.3e-7,0.5)bX.Parent=bW local bY=
Instance.new'Frame'bY.Name='SliderElements'bY.AnchorPoint=Vector2.new(1,0)bY.
BackgroundColor3=Color3.fromRGB(255,255,255)bY.BackgroundTransparency=1 bY.
BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel=0 bY.Position=UDim2.
fromScale(1,0)bY.Size=UDim2.fromScale(1,1)local bZ=Instance.new'TextBox'bZ.Name=
'SliderValue'bZ.FontFace=Font.new(o.interFont)bZ.TextColor3=Color3.fromRGB(255,
255,255)bZ.TextSize=12 bZ.TextTransparency=0.1 bZ.BackgroundColor3=Color3.
fromRGB(255,255,255)bZ.BackgroundTransparency=0.95 bZ.BorderColor3=Color3.
fromRGB(0,0,0)bZ.BorderSizePixel=0 bZ.LayoutOrder=1 bZ.Position=UDim2.fromScale(
-7.89E-2,0.171)bZ.Size=UDim2.fromOffset(41,21)bZ.ClipsDescendants=true local b_=
Instance.new'UICorner'b_.Name='SliderValueUICorner'b_.CornerRadius=UDim.new(0,4)
b_.Parent=bZ local b0=Instance.new'UIStroke'b0.Name='SliderValueUIStroke'b0.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border b0.Color=Color3.fromRGB(255,255,255)
b0.Transparency=0.9 b0.Parent=bZ local b1=Instance.new'UIPadding'b1.Name=
'SliderValueUIPadding'b1.PaddingLeft=UDim.new(0,2)b1.PaddingRight=UDim.new(0,2)
b1.Parent=bZ bZ.Parent=bY local b2=Instance.new'UIListLayout'b2.Name=
'SliderElementsUIListLayout'b2.Padding=UDim.new(0,20)b2.FillDirection=Enum.
FillDirection.Horizontal b2.HorizontalAlignment=Enum.HorizontalAlignment.Right
b2.SortOrder=Enum.SortOrder.LayoutOrder b2.VerticalAlignment=Enum.
VerticalAlignment.Center b2.Parent=bY local b3=Instance.new'ImageLabel'b3.Name=
'SliderBar'b3.Image=o.sliderbar b3.ImageColor3=Color3.fromRGB(87,86,86)b3.
BackgroundColor3=Color3.fromRGB(255,255,255)b3.BackgroundTransparency=1 b3.
BorderColor3=Color3.fromRGB(0,0,0)b3.BorderSizePixel=0 b3.Position=UDim2.
fromScale(0.219,0.457)b3.Size=UDim2.fromOffset(123,3)local b4=Instance.new
'ImageButton'b4.Name='SliderHead'b4.Image=o.sliderhead b4.AnchorPoint=Vector2.
new(0.5,0.5)b4.BackgroundColor3=Color3.fromRGB(255,255,255)b4.
BackgroundTransparency=1 b4.BorderColor3=Color3.fromRGB(0,0,0)b4.BorderSizePixel
=0 b4.Position=UDim2.fromScale(1,0.5)b4.Size=UDim2.fromOffset(12,12)b4.Parent=b3
b3.Parent=bY local b5=Instance.new'UIPadding'b5.Name='SliderElementsUIPadding'b5
.PaddingTop=UDim.new(0,3)b5.Parent=bY bY.Parent=bW local b6,b7=false,{Hundredths
=function(b6)return string.format('%.2f',b6)end,Tenths=function(b6)return string
.format('%.1f',b6)end,Round=function(b6,b7)if b7 then return string.format('%.'
..b7..'f',b6)else return tostring(math.round(b6))end end,Degrees=function(b6,b7)
local b8=b7 and string.format('%.'..b7..'f',b6)or tostring(b6)return b8..
'\u{b0}'end,Percent=function(b6,b7)local b8=(b6-bV.Settings.Minimum)/(bV.
Settings.Maximum-bV.Settings.Minimum)*100 return b7 and string.format('%.'..b7..
'f',b8)..'%'or tostring(math.round(b8))..'%'end,Value=function(b6,b7)return b7
and string.format('%.'..b7..'f',b6)or tostring(b6)end}local b8,b9=b7[bV.Settings
.DisplayMethod]or b7.Value local ca=function(ca,cb)local cc if typeof(ca)==
'Instance'then local cd=ca cc=math.clamp((cd.Position.X-b3.AbsolutePosition.X)/
b3.AbsoluteSize.X,0,1)else local cd=ca cc=(cd-bV.Settings.Minimum)/(bV.Settings.
Maximum-bT.Minimum)end local cd=UDim2.new(cc,0,0.5,0)b4.Position=cd b9=cc*(bV.
Settings.Maximum-bV.Settings.Minimum)+bT.Minimum bZ.Text=(bT.Prefix or'')..b8(b9
,bV.Settings.Precision)..(bT.Suffix or'')if not cb then task.spawn(function()if
bV.Settings.Callback then bV.Settings.Callback(b9)end end)end bV.Value=b9 end
ca(bV.Settings.Default,true)b4.InputBegan:Connect(function(cb)if cb.
UserInputType==Enum.UserInputType.MouseButton1 or cb.UserInputType==Enum.
UserInputType.Touch then b6=true ca(cb)end end)b4.InputEnded:Connect(function(cb
)if cb.UserInputType==Enum.UserInputType.MouseButton1 or cb.UserInputType==Enum.
UserInputType.Touch then b6=false if bV.Settings.onInputComplete then bV.
Settings.onInputComplete(b9)end end end)bZ.FocusLost:Connect(function(cb)local
cc=bZ.Text local cd,ce=cc:match'^(%-?%d+%.?%d*)(%%?)$'if cd then cd=tonumber(cd)
ce=ce=='%'if ce then cd=bV.Settings.Minimum+(cd/100)*(bV.Settings.Maximum-bV.
Settings.Minimum)end local cf=math.clamp(cd,bV.Settings.Minimum,bV.Settings.
Maximum)ca(cf)else bZ.Text=b8(b9)end if bV.Settings.onInputComplete then bV.
Settings.onInputComplete(b9)end end)g.InputChanged:Connect(function(cb)if b6 and
(cb.UserInputType==Enum.UserInputType.MouseMovement or cb.UserInputType==Enum.
UserInputType.Touch)then ca(cb)end end)local cb=function()local cb,cc,cd,ce=b2.
Padding.Offset,bZ.AbsoluteSize.X,bX.AbsoluteSize.X,bY.AbsoluteSize.X local cf=(
ce-(cb+cc+cd+20))/C.Scale b3.Size=UDim2.new(b3.Size.X.Scale,cf,b3.Size.Y.Scale,
b3.Size.Y.Offset)end cb()bX:GetPropertyChangedSignal'AbsoluteSize':Connect(cb)bO
:GetPropertyChangedSignal'AbsoluteSize':Connect(cb)function bV:UpdateName(cc)bX=
cc end function bV:SetVisibility(cc)bW.Visible=cc end function bV:UpdateValue(cc
)ca(tonumber(cc),true)end function bV:GetValue()return b9 end if bU then b.
Options[bU]=bV end return bV end function bN:Input(bT,bU)local bV,bW={Settings=
bT,IgnoreConfig=false,Class='Input'},Instance.new'Frame'bW.Name='Input'bW.
AutomaticSize=Enum.AutomaticSize.Y bW.BackgroundColor3=Color3.fromRGB(0,0,0)bW.
BackgroundTransparency=1 bW.BorderColor3=Color3.fromRGB(0,0,0)bW.BorderSizePixel
=0 bW.Size=UDim2.new(1,0,0,38)bW.Parent=bO local bX=Instance.new'TextLabel'bX.
Name='InputName'bX.FontFace=Font.new(o.interFont)bX.Text=bV.Settings.Name bX.
RichText=true bX.TextColor3=Color3.fromRGB(255,255,255)bX.TextSize=13 bX.
TextTransparency=0.5 bX.TextTruncate=Enum.TextTruncate.AtEnd bX.TextXAlignment=
Enum.TextXAlignment.Left bX.TextYAlignment=Enum.TextYAlignment.Top bX.
AnchorPoint=Vector2.new(0,0.5)bX.AutomaticSize=Enum.AutomaticSize.XY bX.
BackgroundColor3=Color3.fromRGB(255,255,255)bX.BackgroundTransparency=1 bX.
BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel=0 bX.Position=UDim2.
fromScale(0,0.5)bX.Parent=bW local bY=Instance.new'TextBox'bY.Name='InputBox'bY.
FontFace=Font.new(o.interFont)bY.Text='Hello world!'bY.TextColor3=Color3.
fromRGB(255,255,255)bY.TextSize=12 bY.TextTransparency=0.1 bY.AnchorPoint=
Vector2.new(1,0.5)bY.AutomaticSize=Enum.AutomaticSize.X bY.BackgroundColor3=
Color3.fromRGB(255,255,255)bY.BackgroundTransparency=0.95 bY.BorderColor3=Color3
.fromRGB(0,0,0)bY.BorderSizePixel=0 bY.ClipsDescendants=true bY.LayoutOrder=1 bY
.Position=UDim2.fromScale(1,0.5)bY.Size=UDim2.fromOffset(21,21)bY.TextXAlignment
=Enum.TextXAlignment.Right local bZ=Instance.new'UICorner'bZ.Name=
'InputBoxUICorner'bZ.CornerRadius=UDim.new(0,4)bZ.Parent=bY local b_=Instance.
new'UIStroke'b_.Name='InputBoxUIStroke'b_.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border b_.Color=Color3.fromRGB(255,255,255)b_.Transparency=0.9 b_.Parent=bY
local b0=Instance.new'UIPadding'b0.Name='InputBoxUIPadding'b0.PaddingLeft=UDim.
new(0,5)b0.PaddingRight=UDim.new(0,5)b0.Parent=bY local b1=Instance.new
'UISizeConstraint'b1.Name='InputBoxUISizeConstraint'b1.Parent=bY bY.Parent=bW
local b2,b3,b4,b5,b6=bW,bY,bX,b1,function(b2)if bV.Settings.CharacterLimit then
return b2:sub(1,bV.Settings.CharacterLimit)end return b2 end local b7,b8={All=
function(b7)return b6(b7)end,Numeric=function(b7)local b8=b7:match'^%-?%d*$'and
b7 or b7:gsub('[^%d-]',''):gsub('(%-)',function(b8,b9)return b9==1 and b8 or''
end)return b6(b8)end,Alphabetic=function(b7)return b6(b7:gsub('[^a-zA-Z ]',''))
end,AlphaNumeric=function(b7)return b6(b7:gsub('[^a-zA-Z0-9]',''))end}if type(bV
.Settings.AcceptedCharacters)=='function'then b8=bV.Settings.AcceptedCharacters
else b8=b7[bV.Settings.AcceptedCharacters]or b7.All end b3.AutomaticSize=Enum.
AutomaticSize.X local b9=function()local b9,ca=b4.AbsoluteSize.X,b2.AbsoluteSize
.X local cb=(ca-b9-20)/C.Scale b5.MaxSize=Vector2.new(cb,9e9)end b9()b4:
GetPropertyChangedSignal'AbsoluteSize':Connect(b9)b3.FocusLost:Connect(function(
)local ca=b3.Text local cb=b8(ca)b3.Text=cb task.spawn(function()if bV.Settings.
Callback then bV.Settings.Callback(cb)end end)end)b3.Text=bV.Settings.Default or
''b3.PlaceholderText=bV.Settings.Placeholder or''b3:GetPropertyChangedSignal
'Text':Connect(function()b3.Text=b8(b3.Text)if bV.Settings.onChanged then bV.
Settings.onChanged(b3.Text)end bV.Text=b3.Text end)function bV:UpdateName(ca)bX.
Text=ca end function bV:SetVisibility(ca)bW.Visible=ca end function bV:GetInput(
)return b3.Text end function bV:UpdatePlaceholder(ca)bY.PlaceholderText=ca end
function bV:UpdateText(ca)local cb=b8(ca)b3.Text=cb bV.Text=cb task.spawn(
function()if bV.Settings.Callback then bV.Settings.Callback(cb)end end)end if bU
then b.Options[bU]=bV end return bV end function bN:Keybind(bT,bU)local bV,bW={
Settings=bT,IgnoreConfig=false,Class='Keybind'},Instance.new'Frame'bW.Name=
'Keybind'bW.AutomaticSize=Enum.AutomaticSize.Y bW.BackgroundColor3=Color3.
fromRGB(0,0,0)bW.BackgroundTransparency=1 bW.BorderColor3=Color3.fromRGB(0,0,0)
bW.BorderSizePixel=0 bW.Size=UDim2.new(1,0,0,38)bW.Parent=bO local bX=Instance.
new'TextLabel'bX.Name='KeybindName'bX.FontFace=Font.new(o.interFont)bX.Text=bV.
Settings.Name bX.RichText=true bX.TextColor3=Color3.fromRGB(255,255,255)bX.
TextSize=13 bX.TextTransparency=0.5 bX.TextTruncate=Enum.TextTruncate.AtEnd bX.
TextXAlignment=Enum.TextXAlignment.Left bX.TextYAlignment=Enum.TextYAlignment.
Top bX.AnchorPoint=Vector2.new(0,0.5)bX.AutomaticSize=Enum.AutomaticSize.XY bX.
BackgroundColor3=Color3.fromRGB(255,255,255)bX.BackgroundTransparency=1 bX.
BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel=0 bX.Position=UDim2.
fromScale(0,0.5)bX.Parent=bW local bY=Instance.new'TextBox'bY.Name='BinderBox'bY
.CursorPosition=-1 bY.FontFace=Font.new(o.interFont)bY.PlaceholderText='...'bY.
Text=''bY.TextColor3=Color3.fromRGB(255,255,255)bY.TextSize=12 bY.
TextTransparency=0.1 bY.AnchorPoint=Vector2.new(1,0.5)bY.AutomaticSize=Enum.
AutomaticSize.X bY.BackgroundColor3=Color3.fromRGB(255,255,255)bY.
BackgroundTransparency=0.95 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.
BorderSizePixel=0 bY.ClipsDescendants=true bY.LayoutOrder=1 bY.Position=UDim2.
fromScale(1,0.5)bY.Size=UDim2.fromOffset(21,21)local bZ=Instance.new'UICorner'bZ
.Name='BinderBoxUICorner'bZ.CornerRadius=UDim.new(0,4)bZ.Parent=bY local b_=
Instance.new'UIStroke'b_.Name='BinderBoxUIStroke'b_.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border b_.Color=Color3.fromRGB(255,255,255)b_.Transparency=0.9
b_.Parent=bY local b0=Instance.new'UIPadding'b0.Name='BinderBoxUIPadding'b0.
PaddingLeft=UDim.new(0,5)b0.PaddingRight=UDim.new(0,5)b0.Parent=bY local b1=
Instance.new'UISizeConstraint'b1.Name='BinderBoxUISizeConstraint'b1.Parent=bY bY
.Parent=bW local b2,b3,b4,b5=false,false,(bV.Settings.Default)local b6=function(
)b5=false b2=false bY:ReleaseFocus()end if b4 then bY.Text=b4.Name end bY.
Focused:Connect(function()b5=true end)bY.FocusLost:Connect(function()b5=false
end)g.InputBegan:Connect(function(b7)if b5 and not b2 then b2=true local b8 b8=g
.InputBegan:Connect(function(b9)if bV.Settings.Blacklist and(table.find(bV.
KeybindFunctions.Settings.Blacklist,b9.KeyCode)or table.find(bV.Settings.
Blacklist,b9.UserInputType))then bY:ReleaseFocus()b6()b8:Disconnect()return end
if b9.UserInputType==Enum.UserInputType.Keyboard then b4=b9.KeyCode bY.Text=b9.
KeyCode.Name elseif b9.UserInputType==Enum.UserInputType.MouseButton1 or b9.
UserInputType==Enum.UserInputType.MouseButton2 then b4=b9.UserInputType bY.Text=
b9.UserInputType.Name end if bV.Settings.onBinded then bV.Settings.onBinded(b4)
end b3=true b6()b8:Disconnect()end)else if not b3 and(b7.KeyCode==b4 or b7.
UserInputType==b4)then if bV.Settings.Callback then bV.Settings.Callback(b4)end
if bV.Settings.onBindHeld then bV.Settings.onBindHeld(true,b4)end else b3=false
end end end)g.InputEnded:Connect(function(b7)if not b5 and not b2 then if b7.
KeyCode==b4 or b7.UserInputType==b4 then if bT.onBindHeld then bT.onBindHeld(
false,b4)end end end end)function bV:Bind(b7)b4=b7 bY.Text=b7.Name end function
bV:Unbind()b4=nil bY.Text=''end function bV:GetBind()return b4 end function bV:
UpdateName(b7)bX=b7 end function bV:SetVisibility(b7)bW.Visible=b7 end if bU
then b.Options[bU]=bV end return bV end function bN:Dropdown(bT,bU)local bV,bW,
bX,bY={Settings=bT,IgnoreConfig=false,Class='Dropdown'},{},{},Instance.new
'Frame'bY.Name='Dropdown'bY.BackgroundColor3=Color3.fromRGB(255,255,255)bY.
BackgroundTransparency=0.985 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.
BorderSizePixel=0 bY.Size=UDim2.new(1,0,0,38)bY.Parent=bO bY.ClipsDescendants=
true local bZ=Instance.new'UIPadding'bZ.Name='DropdownUIPadding'bZ.PaddingLeft=
UDim.new(0,15)bZ.PaddingRight=UDim.new(0,15)bZ.Parent=bY local b_=Instance.new
'TextButton'b_.Name='Interact'b_.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'b_.Text=''b_.TextColor3=Color3.
fromRGB(0,0,0)b_.TextSize=14 b_.BackgroundColor3=Color3.fromRGB(255,255,255)b_.
BackgroundTransparency=1 b_.BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel
=0 b_.Size=UDim2.new(1,0,0,38)b_.Parent=bY local b0=Instance.new'TextLabel'b0.
Name='DropdownName'b0.FontFace=Font.new(o.interFont)b0.Text=bT.Default and(bV.
Settings.Name..' \u{2022} '..table.concat(bW,', '))or(bV.Settings.Name..'...')b0
.RichText=true b0.TextColor3=Color3.fromRGB(255,255,255)b0.TextSize=13 b0.
TextTransparency=0.5 b0.TextTruncate=Enum.TextTruncate.SplitWord b0.
TextXAlignment=Enum.TextXAlignment.Left b0.AutomaticSize=Enum.AutomaticSize.Y b0
.BackgroundColor3=Color3.fromRGB(255,255,255)b0.BackgroundTransparency=1 b0.
BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel=0 b0.Size=UDim2.new(1,-20,0
,38)b0.Parent=bY local b1=Instance.new'UIStroke'b1.Name='DropdownUIStroke'b1.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border b1.Color=Color3.fromRGB(255,255,255)
b1.Transparency=0.95 b1.Parent=bY local b2=Instance.new'UICorner'b2.Name=
'DropdownUICorner'b2.CornerRadius=UDim.new(0,6)b2.Parent=bY local b3=Instance.
new'ImageLabel'b3.Name='DropdownImage'b3.Image=o.dropdown b3.ImageTransparency=
0.5 b3.AnchorPoint=Vector2.new(1,0)b3.BackgroundColor3=Color3.fromRGB(255,255,
255)b3.BackgroundTransparency=1 b3.BorderColor3=Color3.fromRGB(0,0,0)b3.
BorderSizePixel=0 b3.Position=UDim2.new(1,0,0,12)b3.Size=UDim2.fromOffset(14,14)
b3.Parent=bY local b4=Instance.new'Frame'b4.Name='DropdownFrame'b4.
BackgroundColor3=Color3.fromRGB(255,255,255)b4.BackgroundTransparency=1 b4.
BorderColor3=Color3.fromRGB(0,0,0)b4.BorderSizePixel=0 b4.ClipsDescendants=true
b4.Size=UDim2.fromScale(1,1)b4.Visible=false b4.AutomaticSize=Enum.AutomaticSize
.Y local b5=Instance.new'UIPadding'b5.Name='DropdownFrameUIPadding'b5.PaddingTop
=UDim.new(0,38)b5.PaddingBottom=UDim.new(0,10)b5.Parent=b4 local b6=Instance.new
'UIListLayout'b6.Name='DropdownFrameUIListLayout'b6.Padding=UDim.new(0,5)b6.
SortOrder=Enum.SortOrder.LayoutOrder b6.Parent=b4 local b7=Instance.new'Frame'b7
.Name='Search'b7.BackgroundColor3=Color3.fromRGB(255,255,255)b7.
BackgroundTransparency=0.95 b7.BorderColor3=Color3.fromRGB(0,0,0)b7.
BorderSizePixel=0 b7.LayoutOrder=-1 b7.Size=UDim2.new(1,0,0,30)b7.Parent=b4 b7.
Visible=bV.Settings.Search local b8=Instance.new'UICorner'b8.Name=
'SectionUICorner'b8.Parent=b7 local b9=Instance.new'ImageLabel'b9.Name=
'SearchIcon'b9.Image=o.searchIcon b9.ImageColor3=Color3.fromRGB(180,180,180)b9.
AnchorPoint=Vector2.new(0,0.5)b9.BackgroundColor3=Color3.fromRGB(255,255,255)b9.
BackgroundTransparency=1 b9.BorderColor3=Color3.fromRGB(0,0,0)b9.BorderSizePixel
=0 b9.Position=UDim2.fromScale(0,0.5)b9.Size=UDim2.fromOffset(12,12)b9.Parent=b7
local ca=Instance.new'UIPadding'ca.Name='UIPadding'ca.PaddingLeft=UDim.new(0,15)
ca.Parent=b7 local cb=Instance.new'TextBox'cb.Name='SearchBox'cb.CursorPosition=
-1 cb.FontFace=Font.new(o.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal
)cb.PlaceholderColor3=Color3.fromRGB(150,150,150)cb.PlaceholderText='Search...'
cb.Text=''cb.TextColor3=Color3.fromRGB(200,200,200)cb.TextSize=14 cb.
TextXAlignment=Enum.TextXAlignment.Left cb.BackgroundColor3=Color3.fromRGB(255,
255,255)cb.BackgroundTransparency=1 cb.BorderColor3=Color3.fromRGB(0,0,0)cb.
BorderSizePixel=0 cb.Size=UDim2.fromScale(1,1)local cc=function()local cc,cd,ce=
0,0,b5.PaddingTop.Offset+b5.PaddingBottom.Offset for cf,cg in pairs(b4:
GetChildren())do if not cg:IsA'UIComponent'and cg.Visible then cc+=cg.
AbsoluteSize.Y cd+=1 end end local cf=b6.Padding.Offset*(cd-1)return cc+cf+ce
end local cd=function()local cd=cb.Text:lower()for ce,cf in pairs(bX)do local cg
=cf.NameLabel.Text:lower()local ch=string.find(cg,cd)~=nil if cf.Button.Visible
~=ch then cf.Button.Visible=ch end end bY.Size=UDim2.new(1,0,0,cc())end cb:
GetPropertyChangedSignal'Text':Connect(cd)local ce=Instance.new'UIPadding'ce.
Name='UIPadding'ce.PaddingLeft=UDim.new(0,23)ce.Parent=cb cb.Parent=b7 local cf=
{duration=0.2,easingStyle=Enum.EasingStyle.Quint,transparencyIn=0.2,
transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-13,waitTime=1}local
cg,ch,ci=function(cg,ch)local ci=bX[cg]if not ci then return end local cj,ck=ci.
Checkmark,ci.NameLabel if ch then if bV.Settings.Multi then if not table.find(bW
,cg)then table.insert(bW,cg)bV.Value=bW end else for cl,cm in pairs(bX)do if cl
~=cg then u(cm.Checkmark,TweenInfo.new(cf.duration,cf.easingStyle),{Size=UDim2.
new(cm.Checkmark.Size.X.Scale,cf.checkSizeDecrease,cm.Checkmark.Size.Y.Scale,cm.
Checkmark.Size.Y.Offset)}):Play()u(cm.NameLabel,TweenInfo.new(cf.duration,cf.
easingStyle),{TextTransparency=cf.transparencyOut}):Play()cm.Checkmark.
TextTransparency=1 end end bW={cg}bV.Value=bW[1]end u(cj,TweenInfo.new(cf.
duration,cf.easingStyle),{Size=UDim2.new(cj.Size.X.Scale,cf.checkSizeIncrease,cj
.Size.Y.Scale,cj.Size.Y.Offset)}):Play()u(ck,TweenInfo.new(cf.duration,cf.
easingStyle),{TextTransparency=cf.transparencyIn}):Play()cj.TextTransparency=0
else if bV.Settings.Multi then local cl=table.find(bW,cg)if cl then table.
remove(bW,cl)end else bW={}end u(cj,TweenInfo.new(cf.duration,cf.easingStyle),{
Size=UDim2.new(cj.Size.X.Scale,cf.checkSizeDecrease,cj.Size.Y.Scale,cj.Size.Y.
Offset)}):Play()u(ck,TweenInfo.new(cf.duration,cf.easingStyle),{TextTransparency
=cf.transparencyOut}):Play()cj.TextTransparency=1 end if bT.Required and#bW==0
and not ch then return end if#bW>0 then b0.Text=bV.Settings.Name..' \u{2022} '..
table.concat(bW,', ')else b0.Text=bV.Settings.Name..'...'end end,false,false
local cj=function()if ci then return end ci=true local cj,ck=38,not ch local cl=
ck and UDim2.new(1,0,0,cc())or UDim2.new(1,0,0,cj)local cm,cn=u(bY,TweenInfo.
new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=cl}),u(b3,
TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Rotation=ck
and-90 or 0})cm:Play()cn:Play()if ck then b4.Visible=true cm.Completed:Connect(
function()ci=false end)else cm.Completed:Connect(function()b4.Visible=false ci=
false end)end ch=ck end b_.MouseButton1Click:Connect(cj)local ck=function(ck,cl)
local cm=Instance.new'TextButton'cm.Name='Option'cm.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'cm.Text=''cm.TextColor3=Color3.
fromRGB(0,0,0)cm.TextSize=14 cm.BackgroundColor3=Color3.fromRGB(255,255,255)cm.
BackgroundTransparency=1 cm.BorderColor3=Color3.fromRGB(0,0,0)cm.BorderSizePixel
=0 cm.Size=UDim2.new(1,0,0,30)local cn=Instance.new'UIPadding'cn.Name=
'OptionUIPadding'cn.PaddingLeft=UDim.new(0,15)cn.Parent=cm local co=Instance.new
'TextLabel'co.Name='OptionName'co.FontFace=Font.new(o.interFont)co.Text=cl co.
RichText=true co.TextColor3=Color3.fromRGB(255,255,255)co.TextSize=13 co.
TextTransparency=0.5 co.TextTruncate=Enum.TextTruncate.AtEnd co.TextXAlignment=
Enum.TextXAlignment.Left co.TextYAlignment=Enum.TextYAlignment.Top co.
AnchorPoint=Vector2.new(0,0.5)co.AutomaticSize=Enum.AutomaticSize.XY co.
BackgroundColor3=Color3.fromRGB(255,255,255)co.BackgroundTransparency=1 co.
BorderColor3=Color3.fromRGB(0,0,0)co.BorderSizePixel=0 co.Position=UDim2.
fromScale(1.3e-7,0.5)co.Parent=cm local cp=Instance.new'UIListLayout'cp.Name=
'OptionUIListLayout'cp.Padding=UDim.new(0,10)cp.FillDirection=Enum.FillDirection
.Horizontal cp.SortOrder=Enum.SortOrder.LayoutOrder cp.VerticalAlignment=Enum.
VerticalAlignment.Center cp.Parent=cm local cq=Instance.new'TextLabel'cq.Name=
'Checkmark'cq.FontFace=Font.new(o.interFont)cq.Text='\u{2713}'cq.TextColor3=
Color3.fromRGB(255,255,255)cq.TextSize=13 cq.TextTransparency=1 cq.
TextXAlignment=Enum.TextXAlignment.Left cq.TextYAlignment=Enum.TextYAlignment.
Top cq.AnchorPoint=Vector2.new(0,0.5)cq.AutomaticSize=Enum.AutomaticSize.Y cq.
BackgroundColor3=Color3.fromRGB(255,255,255)cq.BackgroundTransparency=1 cq.
BorderColor3=Color3.fromRGB(0,0,0)cq.BorderSizePixel=0 cq.LayoutOrder=-1 cq.
Position=UDim2.fromScale(1.3e-7,0.5)cq.Size=UDim2.fromOffset(-10,0)cq.Parent=cm
cm.Parent=b4 b4.Parent=bY bX[cl]={Index=ck,Button=cm,NameLabel=co,Checkmark=cq}
local cr={duration=0.2,easingStyle=Enum.EasingStyle.Quint,transparencyIn=0.2,
transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-cp.Padding.Offset,
waitTime=1}local cs,ct={checkIn=u(cq,TweenInfo.new(cr.duration,cr.easingStyle),{
Size=UDim2.new(cq.Size.X.Scale,cr.checkSizeIncrease,cq.Size.Y.Scale,cq.Size.Y.
Offset)}),checkOut=u(cq,TweenInfo.new(cr.duration,cr.easingStyle),{Size=UDim2.
new(cq.Size.X.Scale,cr.checkSizeDecrease,cq.Size.Y.Scale,cq.Size.Y.Offset)}),
nameIn=u(co,TweenInfo.new(cr.duration,cr.easingStyle),{TextTransparency=cr.
transparencyIn}),nameOut=u(co,TweenInfo.new(cr.duration,cr.easingStyle),{
TextTransparency=cr.transparencyOut})},false if bV.Settings.Default then if bV.
Settings.Multi then ct=table.find(bV.Settings.Default,cl)and true or false else
ct=(bV.Settings.Default==ck)and true or false end end cg(cl,ct)local cu=bX[cl].
Button cu.MouseButton1Click:Connect(function()local cv=table.find(bW,cl)and true
or false local cw=not cv if bV.Settings.Required and not cw and#bW<=1 then
return end cg(cl,cw)task.spawn(function()if bV.Settings.Multi then local cx={}
for cy,cz in ipairs(bW)do cx[cz]=true end if bV.Settings.Callback then bV.
Settings.Callback(cx)end else if cw and bV.Settings.Callback then bV.Settings.
Callback(bW[1]or nil)end end end)end)if ch then bY.Size=UDim2.new(1,0,0,cc())end
end if bV.Settings.Options then for cl,cn in pairs(bV.Settings.Options)do ck(cl,
cn)end end function bV:UpdateName(cl)b0.Text=cl end function bV:SetVisibility(cl
)bY.Visible=cl end function bV:UpdateSelection(cl)if not cl then return end for
cn,co in pairs(bX)do cg(cn,false)end local cn={}if type(cl)=='number'then for co
,cp in pairs(bX)do local cq=cp.Index==cl cg(co,cq)if cq then table.insert(cn,co)
end end elseif type(cl)=='string'then for co,cp in pairs(bX)do local cq=co==cl
cg(co,cq)if cq then table.insert(cn,co)end end elseif type(cl)=='table'then for
co,cp in pairs(bX)do local cq=table.find(cl,co)~=nil cg(co,cq)if cq then table.
insert(cn,co)end end end if bV.Settings.Callback then if bV.Settings.Multi then
local co={}for cp,cq in ipairs(cn)do co[cq]=true end bV.Settings.Callback(co)
else bV.Settings.Callback(cn[1]or nil)end end end function bV:InsertOptions(cl)
if not cl then return end bV.Settings.Options=cl for cn,co in pairs(cl)do ck(cn,
co)end end function bV:ClearOptions()for cl,cn in pairs(bX)do cn.Button:Destroy(
)end bX={}bW={}if ch then bY.Size=UDim2.new(1,0,0,cc())end end function bV:
GetOptions()local cl={}for cn,co in pairs(bX)do local cp=table.find(bW,cn)and
true or false cl[cn]=cp end return cl end function bV:RemoveOptions(cl)if not cl
then return end for cn,co in ipairs(cl)do local cp=bX[co]if cp then for cq=#bW,1
,-1 do if bW[cq]==co then table.remove(bW,cq)end end cp.Button:Destroy()bX[co]=
nil end end if ch then bY.Size=UDim2.new(1,0,0,cc())end end function bV:IsOption
(cl)if not cl then return end return bX[cl]~=nil end if bU then b.Options[bU]=bV
end return bV end function bN:Colorpicker(bT,bU)local bV={Settings=bT,
IgnoreConfig=false,Class='Colorpicker'}local bW=bV.Settings.Alpha and true or
false bV.Color=bV.Settings.Default bV.Alpha=bW and bV.Settings.Alpha local bX=
Instance.new'Frame'bX.Name='Colorpicker'bX.AutomaticSize=Enum.AutomaticSize.Y bX
.BackgroundColor3=Color3.fromRGB(0,0,0)bX.BackgroundTransparency=1 bX.
BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel=0 bX.Size=UDim2.new(1,0,0,
38)bX.Parent=bO local bY=Instance.new'TextLabel'bY.Name='KeybindName'bY.FontFace
=Font.new(o.interFont)bY.Text=bT.Name bY.TextColor3=Color3.fromRGB(255,255,255)
bY.TextSize=13 bY.TextTransparency=0.5 bY.RichText=true bY.TextTruncate=Enum.
TextTruncate.AtEnd bY.TextXAlignment=Enum.TextXAlignment.Left bY.TextYAlignment=
Enum.TextYAlignment.Top bY.AnchorPoint=Vector2.new(0,0.5)bY.AutomaticSize=Enum.
AutomaticSize.XY bY.BackgroundColor3=Color3.fromRGB(255,255,255)bY.
BackgroundTransparency=1 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.BorderSizePixel
=0 bY.Position=UDim2.fromScale(0,0.5)bY.Parent=bX local bZ=Instance.new
'ImageLabel'bZ.Name='NewColor'bZ.Image=o.grid bZ.ScaleType=Enum.ScaleType.Tile
bZ.TileSize=UDim2.fromOffset(500,500)bZ.AnchorPoint=Vector2.new(1,0.5)bZ.
BackgroundColor3=Color3.fromRGB(255,255,255)bZ.BackgroundTransparency=1 bZ.
BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel=0 bZ.Position=UDim2.
fromScale(1,0.5)bZ.Size=UDim2.fromOffset(21,21)local b_=Instance.new'Frame'b_.
Name='Color'b_.AnchorPoint=Vector2.new(0.5,0.5)b_.BackgroundColor3=bV.Color b_.
BorderSizePixel=0 b_.Position=UDim2.fromScale(0.5,0.5)b_.Size=UDim2.fromScale(1,
1)b_.BackgroundTransparency=bV.Alpha or 0 local b0=Instance.new'UICorner'b0.Name
='UICorner'b0.CornerRadius=UDim.new(0,6)b0.Parent=b_ local b1=Instance.new
'TextButton'b1.Name='Interact'b1.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'b1.Text=''b1.TextColor3=Color3.
fromRGB(0,0,0)b1.TextSize=14 b1.BackgroundColor3=Color3.fromRGB(255,255,255)b1.
BackgroundTransparency=1 b1.BorderColor3=Color3.fromRGB(0,0,0)b1.BorderSizePixel
=0 b1.Size=UDim2.fromScale(1,1)b1.Parent=b_ b_.Parent=bZ local b2=Instance.new
'UICorner'b2.Name='UICorner'b2.CornerRadius=UDim.new(0,8)b2.Parent=bZ bZ.Parent=
bX local b3=Instance.new'Frame'b3.Name='ColorPicker'b3.BackgroundColor3=Color3.
fromRGB(0,0,0)b3.BackgroundTransparency=0.5 b3.BorderColor3=Color3.fromRGB(0,0,0
)b3.BorderSizePixel=0 b3.Size=UDim2.fromScale(1,1)b3.Visible=false local b4=
Instance.new'UICorner'b4.Name='BaseUICorner'b4.CornerRadius=UDim.new(0,10)b4.
Parent=b3 local b5=Instance.new'Frame'b5.Name='Prompt'b5.AnchorPoint=Vector2.
new(0.5,0.5)b5.AutomaticSize=Enum.AutomaticSize.Y b5.BackgroundColor3=Color3.
fromRGB(15,15,15)b5.BorderColor3=Color3.fromRGB(0,0,0)b5.BorderSizePixel=0 b5.
Position=UDim2.fromScale(0.5,0.5)b5.Size=UDim2.fromOffset(420,0)local b6=
Instance.new'UIScale'b6.Name='BaseUIScale'b6.Parent=b5 b6.Scale=0.95 local b7=
Instance.new'UIStroke'b7.Name='GlobalSettingsUIStroke'b7.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border b7.Color=Color3.fromRGB(255,255,255)b7.Transparency=0.9
b7.Parent=b5 local b8=Instance.new'UICorner'b8.Name='GlobalSettingsUICorner'b8.
CornerRadius=UDim.new(0,10)b8.Parent=b5 local b9=Instance.new'UIListLayout'b9.
Name='UIListLayout'b9.Padding=UDim.new(0,10)b9.HorizontalAlignment=Enum.
HorizontalAlignment.Center b9.SortOrder=Enum.SortOrder.LayoutOrder b9.Parent=b5
local ca=Instance.new'Frame'ca.Name='ColorOptions'ca.AutomaticSize=Enum.
AutomaticSize.XY ca.BackgroundColor3=Color3.fromRGB(255,255,255)ca.
BackgroundTransparency=1 ca.BorderColor3=Color3.fromRGB(0,0,0)ca.BorderSizePixel
=0 ca.LayoutOrder=1 ca.Size=UDim2.fromScale(1,0)local cb=Instance.new
'TextButton'cb.Name='Value'cb.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'cb.Text=''cb.TextColor3=Color3.
fromRGB(0,0,0)cb.TextSize=14 cb.AutoButtonColor=false cb.BackgroundColor3=Color3
.fromRGB(255,255,255)cb.BorderColor3=Color3.fromRGB(0,0,0)cb.BorderSizePixel=0
cb.LayoutOrder=1 cb.Position=UDim2.fromScale(0.092,0.886)cb.Size=UDim2.new(1,0,0
,15)local cc=Instance.new'UIGradient'cc.Name='UIGradient'cc.Color=ColorSequence.
new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))}cc.Parent=cb local cd=
Instance.new'Frame'cd.Name='Slide'cd.AnchorPoint=Vector2.new(0,0.5)cd.
BackgroundColor3=Color3.fromRGB(255,255,255)cd.BorderColor3=Color3.fromRGB(27,42
,53)cd.BorderSizePixel=0 cd.Position=UDim2.fromScale(0,0.5)cd.Size=UDim2.new(0,
13,1,8)local ce=Instance.new'UICorner'ce.Name='UICorner'ce.CornerRadius=UDim.
new(1,0)ce.Parent=cd local cf=Instance.new'UIStroke'cf.Name='UIStroke'cf.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border cf.Transparency=0.5 cf.Parent=cd cd.
Parent=cb local cg=Instance.new'UICorner'cg.Name='UICorner'cg.CornerRadius=UDim.
new(0,6)cg.Parent=cb local ch=Instance.new'UIStroke'ch.Name='UIStroke'ch.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border ch.Color=Color3.fromRGB(255,255,255)
ch.Transparency=0.9 local ci=Instance.new'UIGradient'ci.Name='UIGradient'ci.
Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255))
,ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))}ci.Rotation=180 ci.Parent=ch
ch.Parent=cb cb.Parent=ca local cj=Instance.new'UIListLayout'cj.Name=
'UIListLayout'cj.Padding=UDim.new(0,25)cj.SortOrder=Enum.SortOrder.LayoutOrder
cj.Parent=ca local ck=Instance.new'Frame'ck.Name='Wheel'ck.AutomaticSize=Enum.
AutomaticSize.Y ck.BackgroundColor3=Color3.fromRGB(255,255,255)ck.
BackgroundTransparency=1 ck.BorderColor3=Color3.fromRGB(0,0,0)ck.BorderSizePixel
=0 ck.Size=UDim2.new(1,0,0,100)local cl=Instance.new'ImageButton'cl.Name='Wheel'
cl.Image=o.colorWheel cl.AutoButtonColor=false cl.Active=false cl.
BackgroundColor3=Color3.fromRGB(248,248,248)cl.BackgroundTransparency=1 cl.
BorderColor3=Color3.fromRGB(27,42,53)cl.Selectable=false cl.Size=UDim2.
fromOffset(220,220)cl.SizeConstraint=Enum.SizeConstraint.RelativeYY local cn=
Instance.new'ImageLabel'cn.Name='Target'cn.Image=o.colorTarget cn.ImageColor3=
Color3.fromRGB(0,0,0)cn.AnchorPoint=Vector2.new(0.5,0.5)cn.BackgroundColor3=
Color3.fromRGB(255,255,255)cn.BackgroundTransparency=1 cn.BorderColor3=Color3.
fromRGB(27,42,53)cn.Position=UDim2.fromScale(0.5,0.5)cn.Size=UDim2.fromOffset(22
,22)cn.SizeConstraint=Enum.SizeConstraint.RelativeYY cn.Parent=cl cl.Parent=ck
local co=Instance.new'Frame'co.Name='Inputs'co.AnchorPoint=Vector2.new(1,0.5)co.
AutomaticSize=Enum.AutomaticSize.XY co.BackgroundColor3=Color3.fromRGB(255,255,
255)co.BackgroundTransparency=1 co.BorderColor3=Color3.fromRGB(0,0,0)co.
BorderSizePixel=0 co.LayoutOrder=1 co.Position=UDim2.fromScale(1,0.5)local cp=
Instance.new'UIListLayout'cp.Name='UIListLayout'cp.Padding=UDim.new(0,5)cp.
SortOrder=Enum.SortOrder.LayoutOrder cp.Parent=co local cq=Instance.new'Frame'cq
.Name='Red'cq.AutomaticSize=Enum.AutomaticSize.XY cq.BackgroundColor3=Color3.
fromRGB(0,0,0)cq.BackgroundTransparency=1 cq.BorderColor3=Color3.fromRGB(0,0,0)
cq.BorderSizePixel=0 cq.LayoutOrder=1 cq.Size=UDim2.fromOffset(0,38)local cr=
Instance.new'TextLabel'cr.Name='InputName'cr.FontFace=Font.new(o.interFont)cr.
Text='Red'cr.TextColor3=Color3.fromRGB(255,255,255)cr.TextSize=13 cr.
TextTransparency=0.5 cr.TextTruncate=Enum.TextTruncate.AtEnd cr.TextXAlignment=
Enum.TextXAlignment.Left cr.TextYAlignment=Enum.TextYAlignment.Top cr.
AnchorPoint=Vector2.new(0,0.5)cr.AutomaticSize=Enum.AutomaticSize.XY cr.
BackgroundColor3=Color3.fromRGB(255,255,255)cr.BackgroundTransparency=1 cr.
BorderColor3=Color3.fromRGB(0,0,0)cr.BorderSizePixel=0 cr.LayoutOrder=2 cr.
Position=UDim2.fromScale(0,0.5)cr.Parent=cq local cs=Instance.new'UIListLayout'
cs.Name='UIListLayout'cs.Padding=UDim.new(0,15)cs.FillDirection=Enum.
FillDirection.Horizontal cs.SortOrder=Enum.SortOrder.LayoutOrder cs.
VerticalAlignment=Enum.VerticalAlignment.Center cs.Parent=cq local ct=Instance.
new'TextBox'ct.Name='InputBox'ct.ClearTextOnFocus=false ct.CursorPosition=-1 ct.
FontFace=Font.new(o.interFont)ct.Text='255'ct.TextColor3=Color3.fromRGB(255,255,
255)ct.TextSize=12 ct.TextTransparency=0.1 ct.TextXAlignment=Enum.TextXAlignment
.Left ct.AnchorPoint=Vector2.new(1,0.5)ct.BackgroundColor3=Color3.fromRGB(255,
255,255)ct.BackgroundTransparency=0.95 ct.BorderColor3=Color3.fromRGB(0,0,0)ct.
BorderSizePixel=0 ct.ClipsDescendants=true ct.LayoutOrder=1 ct.Position=UDim2.
fromScale(1,0.5)ct.Size=UDim2.fromOffset(75,25)local cu=Instance.new'UICorner'cu
.Name='InputBoxUICorner'cu.CornerRadius=UDim.new(0,4)cu.Parent=ct local cv=
Instance.new'UIStroke'cv.Name='InputBoxUIStroke'cv.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cv.Color=Color3.fromRGB(255,255,255)cv.Transparency=0.9
cv.Parent=ct local cw=Instance.new'UISizeConstraint'cw.Name=
'InputBoxUISizeConstraint'cw.Parent=ct local cx=Instance.new'UIPadding'cx.Name=
'InputBoxUIPadding'cx.PaddingLeft=UDim.new(0,8)cx.PaddingRight=UDim.new(0,10)cx.
Parent=ct ct.Parent=cq cq.Parent=co local cy=Instance.new'Frame'cy.Name='Green'
cy.AutomaticSize=Enum.AutomaticSize.XY cy.BackgroundColor3=Color3.fromRGB(0,0,0)
cy.BackgroundTransparency=1 cy.BorderColor3=Color3.fromRGB(0,0,0)cy.
BorderSizePixel=0 cy.LayoutOrder=2 cy.Size=UDim2.fromOffset(0,38)local cz=
Instance.new'TextLabel'cz.Name='InputName'cz.FontFace=Font.new(o.interFont)cz.
Text='Green'cz.TextColor3=Color3.fromRGB(255,255,255)cz.TextSize=13 cz.
TextTransparency=0.5 cz.TextTruncate=Enum.TextTruncate.AtEnd cz.TextXAlignment=
Enum.TextXAlignment.Left cz.TextYAlignment=Enum.TextYAlignment.Top cz.
AnchorPoint=Vector2.new(0,0.5)cz.AutomaticSize=Enum.AutomaticSize.XY cz.
BackgroundColor3=Color3.fromRGB(255,255,255)cz.BackgroundTransparency=1 cz.
BorderColor3=Color3.fromRGB(0,0,0)cz.BorderSizePixel=0 cz.LayoutOrder=2 cz.
Position=UDim2.fromScale(0,0.5)cz.Parent=cy local cA=Instance.new'UIListLayout'
cA.Name='UIListLayout'cA.Padding=UDim.new(0,15)cA.FillDirection=Enum.
FillDirection.Horizontal cA.SortOrder=Enum.SortOrder.LayoutOrder cA.
VerticalAlignment=Enum.VerticalAlignment.Center cA.Parent=cy local cB=Instance.
new'TextBox'cB.Name='InputBox'cB.ClearTextOnFocus=false cB.FontFace=Font.new(o.
interFont)cB.Text='255'cB.TextColor3=Color3.fromRGB(255,255,255)cB.TextSize=12
cB.TextTransparency=0.1 cB.TextXAlignment=Enum.TextXAlignment.Left cB.
AnchorPoint=Vector2.new(1,0.5)cB.BackgroundColor3=Color3.fromRGB(255,255,255)cB.
BackgroundTransparency=0.95 cB.BorderColor3=Color3.fromRGB(0,0,0)cB.
BorderSizePixel=0 cB.ClipsDescendants=true cB.LayoutOrder=1 cB.Position=UDim2.
fromScale(1,0.5)cB.Size=UDim2.fromOffset(75,25)local cC=Instance.new'UICorner'cC
.Name='InputBoxUICorner'cC.CornerRadius=UDim.new(0,4)cC.Parent=cB local cD=
Instance.new'UIStroke'cD.Name='InputBoxUIStroke'cD.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cD.Color=Color3.fromRGB(255,255,255)cD.Transparency=0.9
cD.Parent=cB local cE=Instance.new'UISizeConstraint'cE.Name=
'InputBoxUISizeConstraint'cE.Parent=cB local cF=Instance.new'UIPadding'cF.Name=
'InputBoxUIPadding'cF.PaddingLeft=UDim.new(0,8)cF.PaddingRight=UDim.new(0,10)cF.
Parent=cB cB.Parent=cy cy.Parent=co local cG=Instance.new'Frame'cG.Name='Blue'cG
.AutomaticSize=Enum.AutomaticSize.XY cG.BackgroundColor3=Color3.fromRGB(0,0,0)cG
.BackgroundTransparency=1 cG.BorderColor3=Color3.fromRGB(0,0,0)cG.
BorderSizePixel=0 cG.LayoutOrder=3 cG.Size=UDim2.fromOffset(0,38)local cH=
Instance.new'TextLabel'cH.Name='InputName'cH.FontFace=Font.new(o.interFont)cH.
Text='Blue'cH.TextColor3=Color3.fromRGB(255,255,255)cH.TextSize=13 cH.
TextTransparency=0.5 cH.TextTruncate=Enum.TextTruncate.AtEnd cH.TextXAlignment=
Enum.TextXAlignment.Left cH.TextYAlignment=Enum.TextYAlignment.Top cH.
AnchorPoint=Vector2.new(0,0.5)cH.AutomaticSize=Enum.AutomaticSize.XY cH.
BackgroundColor3=Color3.fromRGB(255,255,255)cH.BackgroundTransparency=1 cH.
BorderColor3=Color3.fromRGB(0,0,0)cH.BorderSizePixel=0 cH.LayoutOrder=2 cH.
Position=UDim2.fromScale(0,0.5)cH.Parent=cG local cI=Instance.new'UIListLayout'
cI.Name='UIListLayout'cI.Padding=UDim.new(0,15)cI.FillDirection=Enum.
FillDirection.Horizontal cI.SortOrder=Enum.SortOrder.LayoutOrder cI.
VerticalAlignment=Enum.VerticalAlignment.Center cI.Parent=cG local cJ=Instance.
new'TextBox'cJ.Name='InputBox'cJ.ClearTextOnFocus=false cJ.FontFace=Font.new(o.
interFont)cJ.Text='255'cJ.TextColor3=Color3.fromRGB(255,255,255)cJ.TextSize=12
cJ.TextTransparency=0.1 cJ.TextXAlignment=Enum.TextXAlignment.Left cJ.
AnchorPoint=Vector2.new(1,0.5)cJ.BackgroundColor3=Color3.fromRGB(255,255,255)cJ.
BackgroundTransparency=0.95 cJ.BorderColor3=Color3.fromRGB(0,0,0)cJ.
BorderSizePixel=0 cJ.ClipsDescendants=true cJ.LayoutOrder=1 cJ.Position=UDim2.
fromScale(1,0.5)cJ.Size=UDim2.fromOffset(75,25)local cK=Instance.new'UICorner'cK
.Name='InputBoxUICorner'cK.CornerRadius=UDim.new(0,4)cK.Parent=cJ local cL=
Instance.new'UIStroke'cL.Name='InputBoxUIStroke'cL.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cL.Color=Color3.fromRGB(255,255,255)cL.Transparency=0.9
cL.Parent=cJ local cM=Instance.new'UISizeConstraint'cM.Name=
'InputBoxUISizeConstraint'cM.Parent=cJ local cN=Instance.new'UIPadding'cN.Name=
'InputBoxUIPadding'cN.PaddingLeft=UDim.new(0,8)cN.PaddingRight=UDim.new(0,10)cN.
Parent=cJ cJ.Parent=cG cG.Parent=co local cO=Instance.new'Frame'cO.Name='Alpha'
cO.AutomaticSize=Enum.AutomaticSize.XY cO.BackgroundColor3=Color3.fromRGB(0,0,0)
cO.BackgroundTransparency=1 cO.BorderColor3=Color3.fromRGB(0,0,0)cO.
BorderSizePixel=0 cO.LayoutOrder=4 cO.Size=UDim2.fromOffset(0,38)cO.Visible=bW
local cP=Instance.new'TextLabel'cP.Name='InputName'cP.FontFace=Font.new(o.
interFont)cP.Text='Alpha'cP.TextColor3=Color3.fromRGB(255,255,255)cP.TextSize=13
cP.TextTransparency=0.5 cP.TextTruncate=Enum.TextTruncate.AtEnd cP.
TextXAlignment=Enum.TextXAlignment.Left cP.TextYAlignment=Enum.TextYAlignment.
Top cP.AnchorPoint=Vector2.new(0,0.5)cP.AutomaticSize=Enum.AutomaticSize.XY cP.
BackgroundColor3=Color3.fromRGB(255,255,255)cP.BackgroundTransparency=1 cP.
BorderColor3=Color3.fromRGB(0,0,0)cP.BorderSizePixel=0 cP.LayoutOrder=2 cP.
Position=UDim2.fromScale(0,0.5)cP.Parent=cO local cQ=Instance.new'UIListLayout'
cQ.Name='UIListLayout'cQ.Padding=UDim.new(0,15)cQ.FillDirection=Enum.
FillDirection.Horizontal cQ.SortOrder=Enum.SortOrder.LayoutOrder cQ.
VerticalAlignment=Enum.VerticalAlignment.Center cQ.Parent=cO local cR=Instance.
new'TextBox'cR.Name='InputBox'cR.ClearTextOnFocus=false cR.FontFace=Font.new(o.
interFont)cR.Text='0'cR.TextColor3=Color3.fromRGB(255,255,255)cR.TextSize=12 cR.
TextTransparency=0.1 cR.TextXAlignment=Enum.TextXAlignment.Left cR.AnchorPoint=
Vector2.new(1,0.5)cR.BackgroundColor3=Color3.fromRGB(255,255,255)cR.
BackgroundTransparency=0.95 cR.BorderColor3=Color3.fromRGB(0,0,0)cR.
BorderSizePixel=0 cR.ClipsDescendants=true cR.LayoutOrder=1 cR.Position=UDim2.
fromScale(1,0.5)cR.Size=UDim2.fromOffset(75,25)local cS=Instance.new'UICorner'cS
.Name='InputBoxUICorner'cS.CornerRadius=UDim.new(0,4)cS.Parent=cR local cT=
Instance.new'UIStroke'cT.Name='InputBoxUIStroke'cT.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cT.Color=Color3.fromRGB(255,255,255)cT.Transparency=0.9
cT.Parent=cR local cU=Instance.new'UISizeConstraint'cU.Name=
'InputBoxUISizeConstraint'cU.Parent=cR local cV=Instance.new'UIPadding'cV.Name=
'InputBoxUIPadding'cV.PaddingLeft=UDim.new(0,8)cV.PaddingRight=UDim.new(0,10)cV.
Parent=cR cR.Parent=cO cO.Parent=co local cW=Instance.new'Frame'cW.Name='Hex'cW.
AutomaticSize=Enum.AutomaticSize.XY cW.BackgroundColor3=Color3.fromRGB(0,0,0)cW.
BackgroundTransparency=1 cW.BorderColor3=Color3.fromRGB(0,0,0)cW.BorderSizePixel
=0 cW.Size=UDim2.fromOffset(0,38)local cX=Instance.new'TextLabel'cX.Name=
'InputName'cX.FontFace=Font.new(o.interFont)cX.Text='Hex'cX.TextColor3=Color3.
fromRGB(255,255,255)cX.TextSize=13 cX.TextTransparency=0.5 cX.TextTruncate=Enum.
TextTruncate.AtEnd cX.TextXAlignment=Enum.TextXAlignment.Left cX.TextYAlignment=
Enum.TextYAlignment.Top cX.AnchorPoint=Vector2.new(0,0.5)cX.AutomaticSize=Enum.
AutomaticSize.XY cX.BackgroundColor3=Color3.fromRGB(255,255,255)cX.
BackgroundTransparency=1 cX.BorderColor3=Color3.fromRGB(0,0,0)cX.BorderSizePixel
=0 cX.LayoutOrder=2 cX.Position=UDim2.fromScale(0,0.5)cX.Parent=cW local cY=
Instance.new'UIListLayout'cY.Name='UIListLayout'cY.Padding=UDim.new(0,15)cY.
FillDirection=Enum.FillDirection.Horizontal cY.SortOrder=Enum.SortOrder.
LayoutOrder cY.VerticalAlignment=Enum.VerticalAlignment.Center cY.Parent=cW
local cZ=Instance.new'TextBox'cZ.Name='InputBox'cZ.ClearTextOnFocus=false cZ.
CursorPosition=-1 cZ.FontFace=Font.new(o.interFont)cZ.Text='255'cZ.TextColor3=
Color3.fromRGB(255,255,255)cZ.TextSize=12 cZ.TextTransparency=0.1 cZ.
TextXAlignment=Enum.TextXAlignment.Left cZ.AnchorPoint=Vector2.new(1,0.5)cZ.
BackgroundColor3=Color3.fromRGB(255,255,255)cZ.BackgroundTransparency=0.95 cZ.
BorderColor3=Color3.fromRGB(0,0,0)cZ.BorderSizePixel=0 cZ.ClipsDescendants=true
cZ.LayoutOrder=1 cZ.Position=UDim2.fromScale(1,0.5)cZ.Size=UDim2.fromOffset(75,
25)local c_=Instance.new'UICorner'c_.Name='InputBoxUICorner'c_.CornerRadius=UDim
.new(0,4)c_.Parent=cZ local c0=Instance.new'UIStroke'c0.Name='InputBoxUIStroke'
c0.ApplyStrokeMode=Enum.ApplyStrokeMode.Border c0.Color=Color3.fromRGB(255,255,
255)c0.Transparency=0.9 c0.Parent=cZ local c1=Instance.new'UISizeConstraint'c1.
Name='InputBoxUISizeConstraint'c1.Parent=cZ local c2=Instance.new'UIPadding'c2.
Name='InputBoxUIPadding'c2.PaddingLeft=UDim.new(0,8)c2.PaddingRight=UDim.new(0,
10)c2.Parent=cZ cZ.Parent=cW cW.Parent=co co.Parent=ck local c3=Instance.new
'UIPadding'c3.Name='UIPadding'c3.PaddingRight=UDim.new(0,5)c3.Parent=ck ck.
Parent=ca local c4=Instance.new'Frame'c4.Name='ColorWells'c4.AutomaticSize=Enum.
AutomaticSize.Y c4.BackgroundColor3=Color3.fromRGB(255,255,255)c4.
BackgroundTransparency=1 c4.BorderColor3=Color3.fromRGB(0,0,0)c4.BorderSizePixel
=0 c4.LayoutOrder=2 c4.Size=UDim2.fromScale(1,0)local c5=Instance.new
'UIGridLayout'c5.Name='UIGridLayout'c5.CellPadding=UDim2.fromOffset(10,0)c5.
CellSize=UDim2.new(0.5,-5,0,30)c5.SortOrder=Enum.SortOrder.LayoutOrder c5.Parent
=c4 local c6=Instance.new'ImageLabel'c6.Name='NewColor'c6.Image=o.grid c6.
ScaleType=Enum.ScaleType.Tile c6.TileSize=UDim2.fromOffset(500,500)c6.
BackgroundColor3=Color3.fromRGB(255,255,255)c6.BackgroundTransparency=1 c6.
BorderColor3=Color3.fromRGB(0,0,0)c6.BorderSizePixel=0 c6.Size=UDim2.fromOffset(
100,100)local c7=Instance.new'UICorner'c7.Name='UICorner'c7.Parent=c6 local c8=
Instance.new'Frame'c8.Name='Color'c8.AnchorPoint=Vector2.new(0.5,0.5)c8.
BorderColor3=Color3.fromRGB(27,42,53)c8.BorderSizePixel=0 c8.Position=UDim2.
fromScale(0.5,0.5)c8.Size=UDim2.new(1,1,1,1)local c9=Instance.new'UICorner'c9.
Name='UICorner'c9.Parent=c8 c8.Parent=c6 c6.Parent=c4 local da=Instance.new
'ImageLabel'da.Name='OldColor'da.Image=o.grid da.ScaleType=Enum.ScaleType.Tile
da.TileSize=UDim2.fromOffset(500,500)da.BackgroundColor3=Color3.fromRGB(255,255,
255)da.BackgroundTransparency=1 da.BorderColor3=Color3.fromRGB(0,0,0)da.
BorderSizePixel=0 da.LayoutOrder=1 da.Size=UDim2.fromOffset(100,100)local db=
Instance.new'UICorner'db.Name='UICorner'db.Parent=da local dc=Instance.new
'Frame'dc.Name='Color'dc.AnchorPoint=Vector2.new(0.5,0.5)dc.BorderColor3=Color3.
fromRGB(27,42,53)dc.BorderSizePixel=0 dc.Position=UDim2.fromScale(0.5,0.5)dc.
Size=UDim2.new(1,1,1,1)local dd=Instance.new'UICorner'dd.Name='UICorner'dd.
Parent=dc dc.Parent=da da.Parent=c4 c4.Parent=ca ca.Parent=b5 local de=Instance.
new'Frame'de.Name='Interactions'de.AutomaticSize=Enum.AutomaticSize.Y de.
BackgroundColor3=Color3.fromRGB(0,0,0)de.BackgroundTransparency=1 de.
BorderColor3=Color3.fromRGB(0,0,0)de.BorderSizePixel=0 de.LayoutOrder=2 de.Size=
UDim2.fromScale(1,0)local df=Instance.new'UIListLayout'df.Name='UIListLayout'df.
Padding=UDim.new(0,10)df.SortOrder=Enum.SortOrder.LayoutOrder df.Parent=de local
dg=Instance.new'TextButton'dg.Name='Confirm'dg.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.Medium,Enum.FontStyle.Normal)dg.Text=
'Confirm'dg.TextColor3=Color3.fromRGB(255,255,255)dg.TextSize=15 dg.
TextTransparency=0.5 dg.TextTruncate=Enum.TextTruncate.AtEnd dg.AutoButtonColor=
false dg.AutomaticSize=Enum.AutomaticSize.Y dg.BackgroundColor3=Color3.fromRGB(
25,25,25)dg.BorderColor3=Color3.fromRGB(0,0,0)dg.BorderSizePixel=0 dg.Size=UDim2
.fromScale(1,0)local dh=Instance.new'UIPadding'dh.Name='UIPadding'dh.
PaddingBottom=UDim.new(0,9)dh.PaddingLeft=UDim.new(0,10)dh.PaddingRight=UDim.
new(0,10)dh.PaddingTop=UDim.new(0,9)dh.Parent=dg local di=Instance.new'UICorner'
di.Name='BaseUICorner'di.CornerRadius=UDim.new(0,10)di.Parent=dg dg.Parent=de
local dj=Instance.new'TextButton'dj.Name='Cancel'dj.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.Medium,Enum.FontStyle.Normal)dj.Text=
'Cancel'dj.TextColor3=Color3.fromRGB(255,255,255)dj.TextSize=15 dj.
TextTransparency=0.5 dj.TextTruncate=Enum.TextTruncate.AtEnd dj.AutoButtonColor=
false dj.AutomaticSize=Enum.AutomaticSize.Y dj.BackgroundColor3=Color3.fromRGB(
25,25,25)dj.BorderColor3=Color3.fromRGB(0,0,0)dj.BorderSizePixel=0 dj.Size=UDim2
.fromScale(1,0)local dk=Instance.new'UICorner'dk.Name='BaseUICorner'dk.
CornerRadius=UDim.new(0,10)dk.Parent=dj local dl=Instance.new'UIPadding'dl.Name=
'UIPadding'dl.PaddingBottom=UDim.new(0,9)dl.PaddingLeft=UDim.new(0,10)dl.
PaddingRight=UDim.new(0,10)dl.PaddingTop=UDim.new(0,9)dl.Parent=dj dj.Parent=de
local dm=Instance.new'UIPadding'dm.Name='UIPadding'dm.PaddingTop=UDim.new(0,10)
dm.Parent=de de.Parent=b5 local dn=Instance.new'UIPadding'dn.Name=
'GlobalSettingsUIPadding'dn.PaddingBottom=UDim.new(0,20)dn.PaddingLeft=UDim.new(
0,20)dn.PaddingRight=UDim.new(0,20)dn.PaddingTop=UDim.new(0,20)dn.Parent=b5
local dp=Instance.new'Frame'dp.Name='Paragraph'dp.AutomaticSize=Enum.
AutomaticSize.Y dp.BackgroundColor3=Color3.fromRGB(0,0,0)dp.
BackgroundTransparency=1 dp.BorderColor3=Color3.fromRGB(0,0,0)dp.BorderSizePixel
=0 dp.Size=UDim2.fromScale(1,0)local dq=Instance.new'TextLabel'dq.Name=
'ParagraphHeader'dq.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight
.SemiBold,Enum.FontStyle.Normal)dq.RichText=true dq.Text=bV.Settings.Name dq.
TextColor3=Color3.fromRGB(255,255,255)dq.TextSize=18 dq.TextTransparency=0.4 dq.
TextWrapped=true dq.TextYAlignment=Enum.TextYAlignment.Top dq.AutomaticSize=Enum
.AutomaticSize.XY dq.BackgroundColor3=Color3.fromRGB(255,255,255)dq.
BackgroundTransparency=1 dq.BorderColor3=Color3.fromRGB(0,0,0)dq.BorderSizePixel
=0 dq.Size=UDim2.fromScale(1,0)dq.Parent=dp local dr=Instance.new'UIListLayout'
dr.Name='UIListLayout'dr.Padding=UDim.new(0,15)dr.HorizontalAlignment=Enum.
HorizontalAlignment.Center dr.SortOrder=Enum.SortOrder.LayoutOrder dr.Parent=dp
local ds=Instance.new'UIPadding'ds.Name='UIPadding'ds.PaddingBottom=UDim.new(0,
15)ds.Parent=dp local dt=Instance.new'Frame'dt.Name='Line'dt.BackgroundColor3=
Color3.fromRGB(255,255,255)dt.BackgroundTransparency=0.9 dt.BorderColor3=Color3.
fromRGB(0,0,0)dt.BorderSizePixel=0 dt.LayoutOrder=1 dt.Size=UDim2.new(1,0,0,1)dt
.Parent=dp dp.Parent=b5 b5.Parent=b3 b3.Parent=B local du,dv,dw,dx,dy,dz,dA,dB,
dC,dD,dE,dF,dG,dH,dI,dJ,dK,dL,dM=Color3.fromHSV,Color3.fromRGB,Vector2.new,UDim2
.new,cl,cn,cb,c8,{Hex=cW.InputBox,Red=cq.InputBox,Green=cy.InputBox,Blue=cG.
InputBox,Alpha=cO.InputBox},k:GetMouse(),false,false,0,0,1,function(du)return
math.atan2(du.y,du.x),du.magnitude end,function(du)return((du+math.pi)/(2*math.
pi))*360 end,function(du)return du*(math.pi/180)end,function(du)du=du:gsub('#',
'')if#du~=6 then return 0,0,0 end local dv,dw,dx=tonumber(du:sub(1,2),16)or 0,
tonumber(du:sub(3,4),16)or 0,tonumber(du:sub(5,6),16)or 0 return dv,dw,dx end
local dN=function(dN,dO,dP)local dQ=tonumber(dN)if dQ then return math.clamp(dQ,
dO,dP)end return dO end local dO=function()local dO=du(dG,dH,dI)dB.
BackgroundColor3=dO dB.BackgroundTransparency=dN(dC.Alpha.Text,0,1)dC.Red.Text=
tostring(math.floor(dO.r*255+0.5))dC.Green.Text=tostring(math.floor(dO.g*255+0.5
))dC.Blue.Text=tostring(math.floor(dO.b*255+0.5))dC.Alpha.Text=dN(dC.Alpha.Text,
0,1)local dP=string.format('#%02X%02X%02X',math.floor(dO.r*255+0.5),math.floor(
dO.g*255+0.5),math.floor(dO.b*255+0.5))dC.Hex.Text=dP end local dP,dQ,dR,dS=
function(dP)local dQ=dP-dA.AbsolutePosition.X local dR=math.clamp(dQ,0,dA.
AbsoluteSize.X-cd.AbsoluteSize.X)cd.Position=dx(0,dR,0.5,0)dI=1-(dR/(dA.
AbsoluteSize.X-cd.AbsoluteSize.X))dO()end,function(dP,dQ)local dR,dS=dy.
AbsoluteSize.x/2,dw(dP,dQ)-dy.AbsolutePosition-dy.AbsoluteSize/2 if dS:Dot(dS)>
dR*dR then dS=dS.unit*dR end dz.Position=dx(0.5,dS.x,0.5,dS.y)local dT,dU=dJ(dS*
dw(1,-1))dG,dH=dK(dT)/360,math.clamp(dU/dR,0,1)dA.BackgroundColor3=du(dG,dH,1)
dO()end,function(dP)local dQ=(1-dP)*(dA.AbsoluteSize.X-cd.AbsoluteSize.X)cd.
Position=UDim2.new(0,dQ,0.5,0)end,function(dP,dQ)local dR,dS=dy.AbsoluteSize.X/2
,dL(dP*360)local dT=dQ*dR local dU,dV=dT*math.cos(dS),dT*math.sin(dS)dz.Position
=UDim2.new(0.5,-dU,0.5,dV)dA.BackgroundColor3=du(dP,dQ,1)end local dT,dU,dV=
function()local dT,dU,dV=dN(dC.Red.Text,0,255),dN(dC.Green.Text,0,255),dN(dC.
Blue.Text,0,255)dC.Red.Text=dT dC.Green.Text=dU dC.Blue.Text=dV dG,dH,dI=Color3.
fromRGB(dT,dU,dV):ToHSV()dR(dI)dS(dG,dH)dO()end,function()local dT=dC.Hex.Text
local dU,dV,dW=dM(dT)dU=dN(dU,0,255)dV=dN(dV,0,255)dW=dN(dW,0,255)dC.Red.Text=dU
dC.Green.Text=dV dC.Blue.Text=dW dG,dH,dI=Color3.fromRGB(dU,dV,dW):ToHSV()dR(dI)
dS(dG,dH)dO()end,function()local dT,dU,dV=math.floor(bV.Color.R*255+0.5),math.
floor(bV.Color.G*255+0.5),math.floor(bV.Color.B*255+0.5)dC.Red.Text=dT dC.Green.
Text=dU dC.Blue.Text=dV dC.Alpha.Text=bW and bV.Alpha or 0 local dW=string.
format('#%02X%02X%02X',dT,dU,dV)dC.Hex.Text=dW dG,dH,dI=Color3.fromRGB(dT,dU,dV)
:ToHSV()dc.BackgroundColor3=bV.Color dc.BackgroundTransparency=bW and bV.Alpha
or 0 dB.BackgroundColor3=Color3.fromRGB(dT,dU,dV)dB.BackgroundTransparency=bW
and bV.Alpha or 0 dR(dI)dS(dG,dH)end dy.InputBegan:Connect(function(dW)if dW.
UserInputType==Enum.UserInputType.MouseButton1 or dW.UserInputType==Enum.
UserInputType.Touch then dE=true dQ(dD.X,dD.Y)end end)dA.InputBegan:Connect(
function(dW)if dW.UserInputType==Enum.UserInputType.MouseButton1 or dW.
UserInputType==Enum.UserInputType.Touch then dF=true dP(dD.X)end end)dA.
InputEnded:Connect(function(dW)if dW.UserInputType==Enum.UserInputType.
MouseButton1 or dW.UserInputType==Enum.UserInputType.Touch then dF=false end end
)dy.InputEnded:Connect(function(dW)if dW.UserInputType==Enum.UserInputType.
MouseButton1 or dW.UserInputType==Enum.UserInputType.Touch then dE=false end end
)g.InputChanged:Connect(function(dW)if dW.UserInputType==Enum.UserInputType.
MouseMovement or dW.UserInputType==Enum.UserInputType.Touch then if dF then dP(
dD.X)elseif dE then dQ(dD.X,dD.Y)end end end)local dW=function(dW)local dX=dW.
Text dW.Text=''dW.PlaceholderText=dX end dC.Hex.FocusLost:Connect(dU)dC.Red.
FocusLost:Connect(dT)dC.Green.FocusLost:Connect(dT)dC.Blue.FocusLost:Connect(dT)
dC.Alpha.FocusLost:Connect(dO)dC.Hex.Focused:Connect(function()dW(dC.Hex)end)dC.
Red.Focused:Connect(function()dW(dC.Red)end)dC.Green.Focused:Connect(function()
dW(dC.Green)end)dC.Blue.Focused:Connect(function()dW(dC.Blue)end)dC.Alpha.
Focused:Connect(function()dW(dC.Alpha)end)local dX=function()local dX=Instance.
new'CanvasGroup'dX.Name='ColorPickerCanvas'dX.BackgroundTransparency=1 dX.
BorderSizePixel=0 dX.Size=UDim2.fromScale(1,1)dX.ZIndex=5 dX.GroupTransparency=1
dX.Parent=B dX.Visible=false return dX end local dY=function(dY)local dZ,d_,d0,
d1,d2=dX(),dY and 0 or 1,dY and 1 or 0.95,dY and 1 or 0,TweenInfo.new(0.1,Enum.
EasingStyle.Sine)local d3,d4=u(dZ,d2,{GroupTransparency=d_}),u(b6,d2,{Scale=d0})
b3.Visible=true b3.Parent=dZ dZ.Visible=true dZ.GroupTransparency=d1 d3:Play()d4
:Play()d3.Completed:Wait()if not dY then b3.Visible=false dZ.Visible=false end
b3.Parent=B dZ:Destroy()end local dZ,d_=function()dY(true)end,function()dY(false
)end b1.MouseButton1Click:Connect(dZ)dj.MouseButton1Click:Connect(d_)dg.
MouseButton1Click:Connect(function()d_()local d0=du(dG,dH,dI)bV.Color=Color3.
fromRGB(d0.r*255,d0.g*255,d0.b*255)bV.Alpha=bW and dN(dC.Alpha.Text,0,1)dc.
BackgroundColor3=bV.Color dc.BackgroundTransparency=bW and bV.Alpha or 0 b_.
BackgroundColor3=bV.Color b_.BackgroundTransparency=bW and bV.Alpha or 0 if bV.
Settings.Callback then task.spawn(function()bV.Settings.Callback(bV.Color,bW and
bV.Alpha)end)end end)dV()function bV:UpdateName(d0)bY.Text=d0 end function bV:
SetVisibility(d0)bX.Visible=d0 end function bV:SetColor(d0)bV.Color=d0 b_.
BackgroundColor3=d0 local d1,d2,d3=math.floor(bV.Color.R*255+0.5),math.floor(bV.
Color.G*255+0.5),math.floor(bV.Color.B*255+0.5)dC.Red.Text=d1 dC.Green.Text=d2
dC.Blue.Text=d3 local d4=string.format('#%02X%02X%02X',d1,d2,d3)dC.Hex.Text=d4
dG,dH,dI=Color3.fromRGB(d1,d2,d3):ToHSV()dc.BackgroundColor3=bV.Color dB.
BackgroundColor3=Color3.fromRGB(d1,d2,d3)dR(dI)dS(dG,dH)if bV.Settings.Callback
then task.spawn(function()bV.Settings.Callback(bV.Color,bW and bV.Alpha)end)end
end function bV:SetAlpha(d0)bV.Alpha=d0 b_.Transparency=d0 dV()end if bU then b.
Options[bU]=bV end return bV end function bN:Header(bT,bU)local bV,bW={Settings=
bT},Instance.new'Frame'bW.Name='Header'bW.AutomaticSize=Enum.AutomaticSize.Y bW.
BackgroundColor3=Color3.fromRGB(0,0,0)bW.BackgroundTransparency=1 bW.
BorderColor3=Color3.fromRGB(0,0,0)bW.BorderSizePixel=0 bW.LayoutOrder=0 bW.Size=
UDim2.fromScale(1,0)bW.Parent=bO local bX=Instance.new'UIPadding'bX.Name=
'UIPadding'bX.PaddingBottom=UDim.new(0,5)bX.Parent=bW local bY=Instance.new
'TextLabel'bY.Name='HeaderText'bY.FontFace=Font.new(o.interFont,Enum.FontWeight.
Medium,Enum.FontStyle.Normal)bY.RichText=true bY.Text=bV.Settings.Text or bV.
Settings.Name bY.TextColor3=Color3.fromRGB(255,255,255)bY.TextSize=16 bY.
TextTransparency=0.3 bY.TextWrapped=true bY.TextXAlignment=Enum.TextXAlignment.
Left bY.AutomaticSize=Enum.AutomaticSize.Y bY.BackgroundColor3=Color3.fromRGB(
255,255,255)bY.BackgroundTransparency=1 bY.BorderColor3=Color3.fromRGB(0,0,0)bY.
BorderSizePixel=0 bY.Size=UDim2.fromScale(1,0)bY.Parent=bW function bV:
UpdateName(bZ)bY.Text=bZ end function bV:SetVisibility(bZ)bW.Visible=bZ end if
bU then b.Options[bU]=bV end return bV end function bN:Label(bT,bU)local bV,bW={
Settings=bT},Instance.new'Frame'bW.Name='Label'bW.AutomaticSize=Enum.
AutomaticSize.Y bW.BackgroundColor3=Color3.fromRGB(0,0,0)bW.
BackgroundTransparency=1 bW.BorderColor3=Color3.fromRGB(0,0,0)bW.BorderSizePixel
=0 bW.Size=UDim2.new(1,0,0,38)bW.Parent=bO local bX=Instance.new'TextLabel'bX.
Name='LabelText'bX.FontFace=Font.new(o.interFont)bX.RichText=true bX.Text=bV.
Settings.Text or bV.Settings.Name bX.TextColor3=Color3.fromRGB(255,255,255)bX.
TextSize=13 bX.TextTransparency=0.5 bX.TextWrapped=true bX.TextXAlignment=Enum.
TextXAlignment.Left bX.AutomaticSize=Enum.AutomaticSize.Y bX.BackgroundColor3=
Color3.fromRGB(255,255,255)bX.BackgroundTransparency=1 bX.BorderColor3=Color3.
fromRGB(0,0,0)bX.BorderSizePixel=0 bX.Size=UDim2.fromScale(1,1)bX.Parent=bW
function bV:UpdateName(bY)bX.Text=bY end function bV:SetVisibility(bY)bW.Visible
=bY end if bU then b.Options[bU]=bV end return bV end function bN:SubLabel(bT,bU
)local bV,bW={Settings=bT},Instance.new'Frame'bW.Name='SubLabel'bW.AutomaticSize
=Enum.AutomaticSize.Y bW.BackgroundColor3=Color3.fromRGB(0,0,0)bW.
BackgroundTransparency=1 bW.BorderColor3=Color3.fromRGB(0,0,0)bW.BorderSizePixel
=0 bW.Size=UDim2.new(1,0,0,0)bW.Parent=bO local bX=Instance.new'TextLabel'bX.
Name='SubLabelText'bX.FontFace=Font.new(o.interFont)bX.RichText=true bX.Text=bV.
Settings.Text or bV.Settings.Name bX.TextColor3=Color3.fromRGB(255,255,255)bX.
TextSize=12 bX.TextTransparency=0.7 bX.TextWrapped=true bX.TextXAlignment=Enum.
TextXAlignment.Left bX.AutomaticSize=Enum.AutomaticSize.Y bX.BackgroundColor3=
Color3.fromRGB(255,255,255)bX.BackgroundTransparency=1 bX.BorderColor3=Color3.
fromRGB(0,0,0)bX.BorderSizePixel=0 bX.Size=UDim2.fromScale(1,1)bX.Parent=bW
function bV:UpdateName(bY)bX.Text=bY end function bV:SetVisibility(bY)bW.Visible
=bY end if bU then b.Options[bU]=bV end return bV end function bN:Paragraph(bT,
bU)local bV,bW={Settings=bT},Instance.new'Frame'bW.Name='Paragraph'bW.
AutomaticSize=Enum.AutomaticSize.Y bW.BackgroundColor3=Color3.fromRGB(0,0,0)bW.
BackgroundTransparency=1 bW.BorderColor3=Color3.fromRGB(0,0,0)bW.BorderSizePixel
=0 bW.Size=UDim2.new(1,0,0,38)bW.Parent=bO local bX=Instance.new'TextLabel'bX.
Name='ParagraphHeader'bX.FontFace=Font.new(o.interFont,Enum.FontWeight.Medium,
Enum.FontStyle.Normal)bX.RichText=true bX.Text=bV.Settings.Header bX.TextColor3=
Color3.fromRGB(255,255,255)bX.TextSize=15 bX.TextTransparency=0.4 bX.TextWrapped
=true bX.TextXAlignment=Enum.TextXAlignment.Left bX.AutomaticSize=Enum.
AutomaticSize.Y bX.BackgroundColor3=Color3.fromRGB(255,255,255)bX.
BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel
=0 bX.Size=UDim2.fromScale(1,0)bX.Parent=bW local bY=Instance.new'UIListLayout'
bY.Name='UIListLayout'bY.Padding=UDim.new(0,5)bY.SortOrder=Enum.SortOrder.
LayoutOrder bY.Parent=bW local bZ=Instance.new'TextLabel'bZ.Name='ParagraphBody'
bZ.FontFace=Font.new(o.interFont)bZ.RichText=true bZ.Text=bV.Settings.Body bZ.
TextColor3=Color3.fromRGB(255,255,255)bZ.TextSize=13 bZ.TextTransparency=0.5 bZ.
TextWrapped=true bZ.TextXAlignment=Enum.TextXAlignment.Left bZ.AutomaticSize=
Enum.AutomaticSize.Y bZ.BackgroundColor3=Color3.fromRGB(255,255,255)bZ.
BackgroundTransparency=1 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel
=0 bZ.LayoutOrder=1 bZ.Size=UDim2.fromScale(1,0)bZ.Parent=bW function bV:
UpdateHeader(b_)bX.Text=b_ end function bV:UpdateBody(b_)bZ.Text=b_ end function
bV:SetVisibility(b_)bW.Visible=b_ end if bU then b.Options[bU]=bV end return bV
end function bN:Divider()local bT,bU={},Instance.new'Frame'bU.Name='Divider'bU.
AnchorPoint=Vector2.new(0,1)bU.AutomaticSize=Enum.AutomaticSize.Y bU.
BackgroundColor3=Color3.fromRGB(255,255,255)bU.BackgroundTransparency=1 bU.
BorderColor3=Color3.fromRGB(0,0,0)bU.BorderSizePixel=0 bU.Position=UDim2.
fromScale(0,1)bU.Size=UDim2.new(1,0,0,1)bU.Parent=bO local bV=Instance.new
'UIPadding'bV.Name='UIPadding'bV.PaddingBottom=UDim.new(0,8)bV.PaddingTop=UDim.
new(0,8)bV.Parent=bU local bW=Instance.new'UIListLayout'bW.Name='UIListLayout'bW
.SortOrder=Enum.SortOrder.LayoutOrder bW.Parent=bU local bX=Instance.new'Frame'
bX.Name='Line'bX.BackgroundColor3=Color3.fromRGB(255,255,255)bX.
BackgroundTransparency=0.9 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.
BorderSizePixel=0 bX.Size=UDim2.new(1,0,0,1)bX.Parent=bU function bT:Remove()bU:
Destroy()end function bT:SetVisibility(bY)bU.Visible=bY end return bT end
function bN:Spacer()local bT,bU={},Instance.new'Frame'bU.Name='Spacer'bU.
AnchorPoint=Vector2.new(0,1)bU.BackgroundColor3=Color3.fromRGB(255,255,255)bU.
BackgroundTransparency=1 bU.BorderColor3=Color3.fromRGB(0,0,0)bU.BorderSizePixel
=0 bU.Position=UDim2.fromScale(0,1)bU.Parent=bO function bT:Remove()bU:Destroy()
end function bT:SetVisibility(bV)bU.Visible=bV end return bT end return bN end
local bM=function()local bM=0.15 if s then s.Parent=nil end for bN,bO in pairs(l
)do u(bN,TweenInfo.new(bM,Enum.EasingStyle.Sine),{BackgroundTransparency=(bN==bw
and 0.98 or 1)}):Play()if bO.tabStroke then u(bO.tabStroke,TweenInfo.new(bM,Enum
.EasingStyle.Sine),{Transparency=(bN==bw and 0.95 or 1)}):Play()end if bO.
switcherImage then u(bO.switcherImage,TweenInfo.new(bM,Enum.EasingStyle.Sine),{
ImageTransparency=(bN==bw and 0.1 or 0.5)}):Play()end if bO.switcherName then u(
bO.switcherName,TweenInfo.new(bM,Enum.EasingStyle.Sine),{TextTransparency=(bN==
bw and 0.1 or 0.5)}):Play()end end l[bw].tabContent.Parent=aE s=l[bw].tabContent
a1.Text=bu.Name end bw.MouseButton1Click:Connect(function()bM()end)function bv:
Select()bM()end function bv:InsertConfigSection(bN)local bO=bv:Section{Side=
'Left'}if j then bO:Label{Text=
'Config system unavailable. (Environment isStudio)'}return
'Config system unavailable.'end local bP,bQ bO:Input{Name='Config Name',
Placeholder='Name',AcceptedCharacters='All',Callback=function(bR)bP=bR end}local
bR=bO:Dropdown{Name='Select Config',Multi=false,Required=false,Options=b:
RefreshConfigList(),Callback=function(bR)bQ=bR end}bO:Button{Name=
'Create Config',Callback=function()if not bP or string.gsub(bP,' ','')==''then w
:Notify{Title='Interface',Description='Config name cannot be empty.'}return end
local bS,bT=b:SaveConfig(bP)if not bS then w:Notify{Title='Interface',
Description='Unable to save config, return error: '..bT}end w:Notify{Title=
'Interface',Description=string.format('Created config %q',bP)}bR:ClearOptions()
bR:InsertOptions(b:RefreshConfigList())end}bO:Button{Name='Load Config',Callback
=function()local bS,bT=b:LoadConfig(bR.Value)if not bS then w:Notify{Title=
'Interface',Description='Unable to load config, return error: '..bT}return end w
:Notify{Title='Interface',Description=string.format('Loaded config %q',bR.Value)
}end}bO:Button{Name='Overwrite Config',Callback=function()local bS,bT=b:
SaveConfig(bR.Value)if not bS then w:Notify{Title='Interface',Description=
'Unable to overwrite config, return error: '..bT}return end w:Notify{Title=
'Interface',Description=string.format('Overwrote config %q',bR.Value)}end}bO:
Button{Name='Refresh Config List',Callback=function()bR:ClearOptions()bR:
InsertOptions(b:RefreshConfigList())end}local bS bO:Button{Name=
'Set as autoload',Callback=function()local bT=bR.Value writefile(b.Folder..
'/settings/autoload.txt',bT)bS:UpdateName('Autoload config: '..bT)w:Notify{Title
='Interface',Description=string.format('Set %q as autoload',bT)}end}bS=bO:Label{
Text='Autoload config: None'}if isfile(b.Folder..'/settings/autoload.txt')then
local bT=readfile(b.Folder..'/settings/autoload.txt')bS:UpdateName(
'Autoload config: '..bT)end end l[bw]={tabContent=bD,tabStroke=by,switcherImage=
bA,switcherName=bB}return bv end return bo end function w:Notify(bo)local bp,bq=
{},Instance.new'Frame'bq.Name='Notification'bq.AnchorPoint=Vector2.new(0.5,0.5)
bq.AutomaticSize=Enum.AutomaticSize.Y bq.BackgroundColor3=Color3.fromRGB(15,15,
15)bq.BorderColor3=Color3.fromRGB(0,0,0)bq.BorderSizePixel=0 bq.Position=UDim2.
fromScale(0.5,0.5)bq.Size=UDim2.fromOffset(bo.SizeX or 250,0)bq.Parent=y local
br=Instance.new'UIStroke'br.Name='NotificationUIStroke'br.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border br.Color=Color3.fromRGB(255,255,255)br.Transparency=0.9
br.Parent=bq local bs=Instance.new'UICorner'bs.Name='NotificationUICorner'bs.
CornerRadius=UDim.new(0,10)bs.Parent=bq local bt=Instance.new'UIScale'bt.Name=
'NotificationUIScale'bt.Parent=bq bt.Scale=0 local bu=Instance.new'Frame'bu.Name
='NotificationInformation'bu.AutomaticSize=Enum.AutomaticSize.Y bu.
BackgroundColor3=Color3.fromRGB(255,255,255)bu.BackgroundTransparency=1 bu.
BorderColor3=Color3.fromRGB(0,0,0)bu.BorderSizePixel=0 bu.Size=UDim2.fromScale(1
,1)local bv=Instance.new'TextLabel'bv.Name='NotificationTitle'bv.FontFace=Font.
new(o.interFont,Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)bv.RichText=true
bv.Text=bo.Title bv.TextColor3=Color3.fromRGB(255,255,255)bv.TextSize=13 bv.
TextTransparency=0.2 bv.TextTruncate=Enum.TextTruncate.SplitWord bv.
TextXAlignment=Enum.TextXAlignment.Left bv.TextYAlignment=Enum.TextYAlignment.
Top bv.AutomaticSize=Enum.AutomaticSize.XY bv.BackgroundColor3=Color3.fromRGB(
255,255,255)bv.BackgroundTransparency=1 bv.BorderColor3=Color3.fromRGB(0,0,0)bv.
BorderSizePixel=0 bv.Size=UDim2.new(1,-12,0,0)local bw=Instance.new'UIPadding'bw
.Name='NotificationTitleUIPadding'bw.PaddingRight=UDim.new(0,25)bw.Parent=bv bv.
Parent=bu local bx=Instance.new'TextLabel'bx.Name='NotificationDescription'bx.
FontFace=Font.new(o.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)bx.
Text=bo.Description bx.TextColor3=Color3.fromRGB(255,255,255)bx.TextSize=11 bx.
TextTransparency=0.5 bx.TextWrapped=true bx.RichText=true bx.TextXAlignment=Enum
.TextXAlignment.Left bx.TextYAlignment=Enum.TextYAlignment.Top bx.AutomaticSize=
Enum.AutomaticSize.XY bx.BackgroundColor3=Color3.fromRGB(255,255,255)bx.
BackgroundTransparency=1 bx.BorderColor3=Color3.fromRGB(0,0,0)bx.BorderSizePixel
=0 bx.Size=UDim2.new(1,-12,0,0)local by=Instance.new'UIPadding'by.Name=
'NotificationDescriptionUIPadding'by.PaddingRight=UDim.new(0,25)by.PaddingTop=
UDim.new(0,17)by.Parent=bx bx.Parent=bu local bz=Instance.new'UIPadding'bz.Name=
'NotificationUIPadding'bz.PaddingBottom=UDim.new(0,12)bz.PaddingLeft=UDim.new(0,
10)bz.PaddingRight=UDim.new(0,10)bz.PaddingTop=UDim.new(0,10)bz.Parent=bu bu.
Parent=bq local bA=Instance.new'Frame'bA.Name='NotificationControls'bA.
AutomaticSize=Enum.AutomaticSize.Y bA.BackgroundColor3=Color3.fromRGB(255,255,
255)bA.BackgroundTransparency=1 bA.BorderColor3=Color3.fromRGB(0,0,0)bA.
BorderSizePixel=0 bA.Size=UDim2.fromScale(1,1)local bB=Instance.new'TextButton'
bB.Name='Interactable'bB.FontFace=Font.new(o.interFont)bB.Text='\u{2713}'bB.
TextColor3=Color3.fromRGB(255,255,255)bB.TextSize=17 bB.TextTransparency=0.2 bB.
AnchorPoint=Vector2.new(1,0.5)bB.AutomaticSize=Enum.AutomaticSize.XY bB.
BackgroundColor3=Color3.fromRGB(255,255,255)bB.BackgroundTransparency=1 bB.
BorderColor3=Color3.fromRGB(0,0,0)bB.BorderSizePixel=0 bB.LayoutOrder=1 bB.
Position=UDim2.fromScale(1,0.5)bB.Parent=bA local bC=Instance.new'UIPadding'bC.
Name='UIPadding'bC.PaddingBottom=UDim.new(0,6)bC.PaddingRight=UDim.new(0,13)bC.
PaddingTop=UDim.new(0,6)bC.Parent=bA bA.Parent=bq local bD,bE={In=u(bt,TweenInfo
.new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Scale=bo.Scale
or 1}),Out=u(bt,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=0})},{None=function()bB:Destroy()end,Confirm=
function()bB.Text='\u{2713}'end,Cancel=function()bB.Text='\u{2717}'end}local bF=
bE[bo.Style]or function()bB:Destroy()end bF()if bB then bB.MouseButton1Click:
Connect(function()bp:Cancel()if bo.Callback then task.spawn(bo.Callback)end end)
end local bG=task.spawn(function()bD.In:Play()bo.Lifetime=bo.Lifetime or 3 if bo
.Lifetime~=0 then task.wait(bo.Lifetime)local bG=bD.Out bG:Play()bG.Completed:
Wait()bq:Destroy()end end)function bp:UpdateTitle(bH)bv.Text=bH end function bp:
UpdateDescription(bH)bx.Text=bH end function bp:Resize(bH)local bI=bH or 250 bq.
Size=UDim2.fromOffset(bI,0)end function bp:Cancel()task.cancel(bG)local bH=bD.
Out bH:Play()bH.Completed:Wait()bq:Destroy()end return bp end function w:Dialog(
bo)local bp,bq={},Instance.new'CanvasGroup'bq.Name='DialogCanvas'bq.
BackgroundColor3=Color3.fromRGB(255,255,255)bq.BackgroundTransparency=1 bq.
BorderColor3=Color3.fromRGB(0,0,0)bq.BorderSizePixel=0 bq.Size=UDim2.fromScale(1
,1)bq.GroupTransparency=1 bq.Parent=B local br=Instance.new'Frame'br.Name=
'Dialog'br.BackgroundColor3=Color3.fromRGB(0,0,0)br.BackgroundTransparency=0.5
br.BorderColor3=Color3.fromRGB(0,0,0)br.BorderSizePixel=0 br.Size=UDim2.
fromScale(1,1)local bs=Instance.new'UICorner'bs.Name='BaseUICorner'bs.
CornerRadius=UDim.new(0,10)bs.Parent=br local bt=Instance.new'Frame'bt.Name=
'Prompt'bt.AnchorPoint=Vector2.new(0.5,0.5)bt.AutomaticSize=Enum.AutomaticSize.Y
bt.BackgroundColor3=Color3.fromRGB(15,15,15)bt.BorderColor3=Color3.fromRGB(0,0,0
)bt.BorderSizePixel=0 bt.Position=UDim2.fromScale(0.5,0.5)bt.Size=UDim2.
fromOffset(280,0)local bu=Instance.new'UIScale'bu.Name='BaseUIScale'bu.Parent=bt
bu.Scale=0.95 local bv=Instance.new'UIStroke'bv.Name='GlobalSettingsUIStroke'bv.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border bv.Color=Color3.fromRGB(255,255,255)
bv.Transparency=0.9 bv.Parent=bt local bw=Instance.new'UICorner'bw.Name=
'GlobalSettingsUICorner'bw.CornerRadius=UDim.new(0,10)bw.Parent=bt local bx=
Instance.new'UIPadding'bx.Name='GlobalSettingsUIPadding'bx.PaddingBottom=UDim.
new(0,20)bx.PaddingLeft=UDim.new(0,20)bx.PaddingRight=UDim.new(0,20)bx.
PaddingTop=UDim.new(0,20)bx.Parent=bt local by=Instance.new'Frame'by.Name=
'Paragraph'by.AutomaticSize=Enum.AutomaticSize.Y by.BackgroundColor3=Color3.
fromRGB(0,0,0)by.BackgroundTransparency=1 by.BorderColor3=Color3.fromRGB(0,0,0)
by.BorderSizePixel=0 by.Size=UDim2.new(1,0,0,38)local bz=Instance.new'TextLabel'
bz.Name='ParagraphHeader'bz.FontFace=Font.new(o.interFont,Enum.FontWeight.Medium
,Enum.FontStyle.Normal)bz.RichText=true bz.Text=bo.Title bz.TextColor3=Color3.
fromRGB(255,255,255)bz.TextSize=18 bz.TextTransparency=0.4 bz.TextWrapped=true
bz.AutomaticSize=Enum.AutomaticSize.Y bz.BackgroundColor3=Color3.fromRGB(255,255
,255)bz.BackgroundTransparency=1 bz.BorderColor3=Color3.fromRGB(0,0,0)bz.
BorderSizePixel=0 bz.Size=UDim2.fromScale(1,0)bz.Parent=by local bA=Instance.new
'UIListLayout'bA.Name='UIListLayout'bA.Padding=UDim.new(0,15)bA.SortOrder=Enum.
SortOrder.LayoutOrder bA.Parent=by local bB=Instance.new'TextLabel'bB.Name=
'ParagraphBody'bB.FontFace=Font.new(o.interFont)bB.RichText=true bB.Text=bo.
Description bB.TextColor3=Color3.fromRGB(255,255,255)bB.TextSize=14 bB.
TextTransparency=0.5 bB.TextWrapped=true bB.AutomaticSize=Enum.AutomaticSize.Y
bB.BackgroundColor3=Color3.fromRGB(255,255,255)bB.BackgroundTransparency=1 bB.
BorderColor3=Color3.fromRGB(0,0,0)bB.BorderSizePixel=0 bB.LayoutOrder=1 bB.Size=
UDim2.fromScale(1,0)bB.Parent=by by.Parent=bt local bC=Instance.new'Frame'bC.
Name='Interactions'bC.AutomaticSize=Enum.AutomaticSize.Y bC.BackgroundColor3=
Color3.fromRGB(0,0,0)bC.BackgroundTransparency=1 bC.BorderColor3=Color3.fromRGB(
0,0,0)bC.BorderSizePixel=0 bC.LayoutOrder=1 bC.Size=UDim2.fromScale(1,0)local bD
=Instance.new'UIListLayout'bD.Name='UIListLayout'bD.Padding=UDim.new(0,10)bD.
SortOrder=Enum.SortOrder.LayoutOrder bD.Parent=bC local bE=Instance.new
'UIPadding'bE.Name='UIPadding'bE.PaddingTop=UDim.new(0,20)bE.Parent=bC bC.Parent
=bt local bF=Instance.new'UIListLayout'bF.Name='UIListLayout'bF.SortOrder=Enum.
SortOrder.LayoutOrder bF.Parent=bt bt.Parent=br br.Parent=bq local bG,bH,bI,bJ=
u(bq,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{GroupTransparency=0}),u(bq,
TweenInfo.new(0.1,Enum.EasingStyle.Sine),{GroupTransparency=1}),u(bu,TweenInfo.
new(0.1,Enum.EasingStyle.Sine),{Scale=1}),u(bu,TweenInfo.new(0.1,Enum.
EasingStyle.Sine),{Scale=0.95})local bK,bL=function()bG:Play()bI:Play()bG.
Completed:Wait()br.Parent=B end,function()if not br.Parent then return end br.
Parent=bq bH:Play()bJ:Play()bH.Completed:Wait()bq:Destroy()end for bM,bN in
pairs(bo.Buttons)do local bO=Instance.new'TextButton'bO.Name='Button'bO.FontFace
=Font.new(o.interFont)bO.Text=bN.Name bO.TextColor3=Color3.fromRGB(255,255,255)
bO.TextSize=15 bO.TextTransparency=0.5 bO.TextTruncate=Enum.TextTruncate.AtEnd
bO.AutoButtonColor=false bO.AutomaticSize=Enum.AutomaticSize.Y bO.
BackgroundColor3=Color3.fromRGB(25,25,25)bO.BorderColor3=Color3.fromRGB(0,0,0)bO
.BorderSizePixel=0 bO.Size=UDim2.fromScale(1,0)local bP=Instance.new'UIPadding'
bP.Name='UIPadding'bP.PaddingBottom=UDim.new(0,9)bP.PaddingLeft=UDim.new(0,10)bP
.PaddingRight=UDim.new(0,10)bP.PaddingTop=UDim.new(0,9)bP.Parent=bO local bQ=
Instance.new'UICorner'bQ.Name='BaseUICorner'bQ.CornerRadius=UDim.new(0,10)bQ.
Parent=bO bO.Parent=bC local bR={DefaultTransparency=0,DefaultTransparency2=0.5,
HoverTransparency=0.3,HoverTransparency2=0.6,EasingStyle=Enum.EasingStyle.Sine}
local bS=function(bS)if bS=='Idle'then u(bO,TweenInfo.new(0.2,bR.EasingStyle),{
BackgroundTransparency=bR.DefaultTransparency,TextTransparency=bR.
DefaultTransparency2}):Play()elseif bS=='Hover'then u(bO,TweenInfo.new(0.2,bR.
EasingStyle),{BackgroundTransparency=bR.HoverTransparency,TextTransparency=bR.
HoverTransparency2}):Play()end end bO.MouseButton1Click:Connect(function()if bq.
GroupTransparency~=0 then return end local bT,bU=pcall(function()if bN.Callback
then bN.Callback()end end)bL()if not bT then warn(
'[Dialog] Button callback error: '..tostring(bU))end end)bO.MouseEnter:Connect(
function()bS'Hover'end)bO.MouseLeave:Connect(function()bS'Idle'end)end bK()
function bp:UpdateTitle(bM)bz.Text=bM end function bp:UpdateDescription(bM)bB.
Text=bM end function bp:Cancel()bL()end return bp end function w:
SetNotificationsState(bo)y.Visible=bo end function w:GetNotificationsState(bo)
return y.Visible end function w:SetState(bo)p=bo B.Visible=bo end function w:
GetState()return p end local bo function w:Unload()if bo then bo()end x:Destroy(
)n=true end function w.onUnloaded(bp)bo=bp end local bp=v.Keybind or Enum.
KeyCode.RightControl local bq=function()local bq=not w:GetState()w:SetState(bq)w
:Notify{Title=v.Title,Description=(bq and'Maximized 'or'Minimized ')..
'the menu. Use '..tostring(bp.Name)..' to toggle it.',Lifetime=5}end g.
InputEnded:Connect(function(br,bs)if bs then return end if br.KeyCode==bp then
bq()end end)Q.MouseButton1Click:Connect(bq)O.MouseButton1Click:Connect(function(
)w:Dialog{Title=v.Title,Description=
[[Are you sure you want to exit the menu? You will lose any unsaved configurations.]]
,Buttons={{Name='Confirm',Callback=function()w:Unload()end},{Name='Cancel'}}}end
)function w:SetKeybind(br)bp=br end function w:SetAcrylicBlurState(br)q=br B.
BackgroundTransparency=br and 0.05 or 0 end function w:GetAcrylicBlurState()
return q end local br,bs=function(br)if br then aq.Image=(ap and ao)or
'rbxassetid://0'ax.Text='@'..k.Name au.Text=k.DisplayName else aq.Image=o.
userInfoBlurred local bs,bt=#k.Name,#k.DisplayName ax.Text='@'..string.rep('.',
bs)au.Text=string.rep('.',bt)end end if v.ShowUserInfo~=nil then bs=v.
ShowUserInfo else bs=true end br(bs)function w:SetUserInfoState(bt)br(bt)end
function w:GetUserInfoState(bt)return bs end function w:SetSize(bt)B.Size=bt end
function w:GetSize(bt)return B.Size end function w:SetScale(bt)C.Scale=bt end
function w:GetScale()return C.Scale end local bt,bu={Toggle={Save=function(bt,bu
)return{type='Toggle',flag=bt,state=bu.State or false}end,Load=function(bt,bu)if
b.Options[bt]and bu.state~=nil then b.Options[bt]:UpdateState(bu.state)end end},
Slider={Save=function(bt,bu)return{type='Slider',flag=bt,value=(bu.Value and
tostring(bu.Value))or false}end,Load=function(bt,bu)if b.Options[bt]and bu.value
then b.Options[bt]:UpdateValue(bu.value)end end},Input={Save=function(bt,bu)
return{type='Input',flag=bt,text=bu.Text}end,Load=function(bt,bu)if b.Options[bt
]and bu.text and type(bu.text)=='string'then b.Options[bt]:UpdateText(bu.text)
end end},Keybind={Save=function(bt,bu)return{type='Keybind',flag=bt,bind=(
typeof(bu.Bind)=='EnumItem'and bu.Bind.Name)or nil}end,Load=function(bt,bu)if b.
Options[bt]and bu.bind then b.Options[bt]:Bind(Enum.KeyCode[bu.bind])end end},
Dropdown={Save=function(bt,bu)return{type='Dropdown',flag=bt,value=bu.Value}end,
Load=function(bt,bu)if b.Options[bt]and bu.value then b.Options[bt]:
UpdateSelection(bu.value)end end},Colorpicker={Save=function(bt,bu)local bv=
function(bv)return string.format('#%02X%02X%02X',math.floor(bv.R*255),math.
floor(bv.G*255),math.floor(bv.B*255))end return{type='Colorpicker',flag=bt,color
=bv(bu.Color)or nil,alpha=bu.Alpha}end,Load=function(bt,bu)local bv=function(bv)
local bw,bx,by=tonumber(bv:sub(2,3),16)/255,tonumber(bv:sub(4,5),16)/255,
tonumber(bv:sub(6,7),16)/255 return Color3.new(bw,bx,by)end if b.Options[bt]and
bu.color then b.Options[bt]:SetColor(bv(bu.color))if bu.alpha then b.Options[bt]
:SetAlpha(bu.alpha)end end end}},function()if j or not(isfolder and makefolder)
then return'Config system unavailable.'end local bt={b.Folder,b.Folder..
'/settings'}for bu=1,#bt do local bv=bt[bu]if not isfolder(bv)then makefolder(bv
)end end end function b:LoadAutoLoadConfig()if j or not(isfile and readfile)then
return'Config system unavailable.'end if isfile(b.Folder..
'/settings/autoload.txt')then local bv=readfile(b.Folder..
'/settings/autoload.txt')local bw,bx=b:LoadConfig(bv)if not bw then w:Notify{
Title='Interface',Description='Error loading autoload config: '..bx}end w:Notify
{Title='Interface',Description=string.format('Autoloaded config: %q',bv)}end end
function b:SetFolder(bv)if j then return'Config system unavailable.'end b.Folder
=bv bu()end function b:SaveConfig(bv)if j or not writefile then return
'Config system unavailable.'end if(not bv)then return false,
'Please select a config file.'end local bw,bx=b.Folder..'/settings/'..bv..
'.json',{objects={},contextData=b.contextData or{}}for by,bz in next,b.Options
do if not bt[bz.Class]then continue end if bz.IgnoreConfig then continue end
table.insert(bx.objects,bt[bz.Class].Save(by,bz))end local by,bz=pcall(e.
JSONEncode,e,bx)if not by then return false,'Unable to encode into JSON data'end
writefile(bw,bz)return true end function b:LoadConfig(bv)if j or not(isfile and
readfile)then return'Config system unavailable.'end if(not bv)then return false,
'Please select a config file.'end local bw=b.Folder..'/settings/'..bv..'.json'if
not isfile(bw)then return false,'Invalid file'end local bx,by=pcall(e.JSONDecode
,e,readfile(bw))if not bx then return false,'Unable to decode JSON data.'end b.
LoadingConfig=true b.contextData=by.contextData or{}for bz,bA in next,by.objects
do if bt[bA.type]then pcall(function()bt[bA.type].Load(bA.flag,bA)end)end end
task.delay(1,function()b.LoadingConfig=false end)return true end function b:
RefreshConfigList()if j or not(isfolder and listfiles)then return
'Config system unavailable.'end local bv,bw=(isfolder(b.Folder)and isfolder(b.
Folder..'/settings'))and listfiles(b.Folder..'/settings')or{},{}for bx=1,#bv do
local by=bv[bx]if by:sub(-5)=='.json'then local bz=by:find('.json',1,true)local
bA,bB=bz,by:sub(bz,bz)while bB~='/'and bB~='\\'and bB~=''do bz=bz-1 bB=by:sub(bz
,bz)end if bB=='/'or bB=='\\'then local bC=by:sub(bz+1,bA-1)if bC~='options'then
table.insert(bw,bC)end end end end return bw end x.Enabled=false local bv={}for
bw,bx in pairs(o)do table.insert(bv,bx)end f:PreloadAsync(bv)x.Enabled=true p=
true return w end function b:Demo()local aa=b:Window{Title='Maclib Demo',
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
function aa.IsActive()return not aa.cleaned end return aa end function a.c()
local aa,ab={}function aa:SetWindow(ac)ab=ac end function aa.Notify(ac,ad,ae)ae=
ae or 3 if ab then local af=pcall(function()ab:Notify{Title=ac,Description=ad,
Lifetime=ae}end)if af then return end end pcall(function()game:GetService
'StarterGui':SetCore('SendNotification',{Title=ac,Text=ad,Duration=ae})end)end
return aa end function a.d()local aa,ab,ac,ad,ae,af=a.load'a',a.load'c',{},false
,false function ac.Suspend()ae=true ad=false end function ac.Resume()ae=false
end function ac.IsSuspended()return ae or(aa.LoadingConfig==true)end function ac
.SetActive(ag)af=(typeof(ag)=='string'and#ag>0)and ag or nil end function ac.
GetActive()return af end local ag=function()if af then return af end local ag=aa
.Folder local ah=ag..'/settings/autoload.txt'if isfile and isfile(ah)then local
ai,aj=pcall(readfile,ah)if ai and typeof(aj)=='string'and#aj>0 then af=aj return
af end end af='Default'pcall(function()if writefile and makefolder and isfolder
then if not isfolder(ag)then makefolder(ag)end if not isfolder(ag..'/settings')
then makefolder(ag..'/settings')end if not isfile(ah)then writefile(ah,'Default'
)end end end)return af end function ac.SaveNow()if ac.IsSuspended()then return
end local ah=ag()if not ah then return end local ai,aj=aa:SaveConfig(ah)if not
ai and aj and aj~='Please select a config file.'then ab.Notify('AutoSave',
'Kh\u{f4}ng l\u{1b0}u \u{111}\u{1b0}\u{1ee3}c config: '..tostring(aj),3)end end
function ac.Save()if ac.IsSuspended()then return end if not ag()then return end
if ad then return end ad=true task.delay(0.5,function()ad=false if not ac.
IsSuspended()and ac.GetActive()then ac.SaveNow()end end)end function ac.Wrap(ah)
if type(ah)~='function'then return ah end return function(...)ah(...)ac.Save()
end end return ac end function a.e()local aa,ab,ac,ad=game:GetService'Players',
game:GetService'UserInputService',game:GetService'RunService',game:GetService
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
'Humanoid'if aU and aU.Health<=0 then return false,nil end local aV=aT:
FindFirstChildOfClass'ForceField'if aV and aV.Visible~=false then return true,
'ForceField'end local aW,aX,aY=aT:GetAttribute'Invulnerable',aT:GetAttribute
'Immune',aT:GetAttribute'Respawning'if aW==true or aX==true or aY==true then
return true,'Attribute'end local aZ,a_,a0=aT:FindFirstChild'Invulnerable',aT:
FindFirstChild'Immune',aT:FindFirstChild'Respawning'if(aZ and aZ:IsA'BoolValue'
and aZ.Value==true)or(a_ and a_:IsA'BoolValue'and a_.Value==true)or(a0 and a0:
IsA'BoolValue'and a0.Value==true)then return true,'Value'end local a1=ag.
GetRespawnProtectionRemaining()if a1>0 then return true,(
'Respawn Shield (%.1fs)'):format(a1)end return false,nil end local aT=function(
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
in pairs(at)do aV(a0)end at={}ax=0 aw={}aP=nil dungeon=nil end aK=function()for
a0,a1 in pairs(at)do if not a0 or not a0.Parent then aW(a0)else local a2=a1.
Humanoid or a0:FindFirstChildOfClass'Humanoid'a1.Humanoid=a2 if not a2 or a2.
Health<=0 then aW(a0)else local a3=a1.Root if not a3 or not a3.Parent then a3=
aT(a0)if a3 then a1.Root=a3 else aW(a0)end end end end end end function ag.
SetFastSpeed(a0)ai=a0 if ah and humanoid and humanoid.Parent then if humanoid.
WalkSpeed<ai then al=true humanoid.WalkSpeed=ai al=false end end end function ag
.SetSpeedEnabled(a0)ah=a0 if humanoid and humanoid.Parent then al=true if ah
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
'[EnemyTracker] Initialization error:',a5)end end)local a4,a5=0,2 task.spawn(
function()while ab.IsActive()do task.wait(a5)local a6=os.clock()if a6-a4<a5 then
continue end a4=a6 if not dungeon then continue end local a7=pcall(function()for
a7,a8 in ipairs(dungeon:GetChildren())do if a8:IsA'Folder'or a8:IsA'Model'then
for a9,b in ipairs(a8:GetDescendants())do if b:IsA'Model'then aZ(b)end end end
end aK()end)if not a7 then warn'[EnemyTracker] rescan error'end end end)function
ag.IsBossActive()return am end function ag.OnBossActiveChanged(a6)if type(a6)~=
'function'then return function()end end table.insert(an,a6)return function()for
a7,a8 in ipairs(an)do if a8==a6 then table.remove(an,a7)break end end end end
function ag.GetCurrentBossIndex()return ao end function ag.GetCombatTargetKey()
if not am then return'Mob'end local a6=math.clamp(ao,1,3)return'Boss'..tostring(
a6)end function ag.ResetBossIndex()ao=0 aP=nil for a6=#ap,1,-1 do pcall(ap[a6],
ao)end end function ag.OnBossIndexChanged(a6)if type(a6)~='function'then return
function()end end table.insert(ap,a6)return function()for a7,a8 in ipairs(ap)do
if a8==a6 then table.remove(ap,a7)break end end end end local a6=function(a6)if
type(a6)~='string'then return 0 end local a7=string.lower(a6)local a8=string.
match(a7,'boss.*(%d+)')if a8 then return 100+(tonumber(a8)or 1)end if string.
find(a7,'boss')then return 100+math.max(1,ao)end local a9=string.match(a6,
'^room(%d+)$')if not a9 then return 0 end return tonumber(a9)or 0 end local a7=
function()if not dungeon then return 0 end for a7,a8 in pairs(at)do if a8 and a8
.Room then local a9=a6(a8.Room.Name)if a9>0 then return a9 end end end if am
then return 100+math.max(1,ao)end return 0 end aN=function()local a8=a7()if a8==
aq then return end aq=a8 for a9=#ar,1,-1 do pcall(ar[a9],aq)end end function ag.
GetCurrentRoomIndex()return aq end function ag.OnRoomIndexChanged(a8)if type(a8)
~='function'then return function()end end table.insert(ar,a8)return function()
for a9,b in ipairs(ar)do if b==a8 then table.remove(ar,a9)break end end end end
function ag.GetCurrentDungeonName()return aJ end function ag.
OnDungeonNameChanged(a8)if type(a8)~='function'then return function()end end
table.insert(aA,a8)return function()for a9,b in ipairs(aA)do if b==a8 then table
.remove(aA,a9)break end end end end function ag.IsInLobby()return aC end
function ag.OnLobbyChanged(a8)if type(a8)~='function'then return function()end
end table.insert(aD,a8)return function()for a9,b in ipairs(aD)do if b==a8 then
table.remove(aD,a9)break end end end end local a8 aO=function()if not am or aP~=
nil then return end for a9,b in pairs(at)do if b and b.Root and b.Root.Parent
then local ba=false if b.Room and type(b.Room.Name)=='string'and string.find(
string.lower(b.Room.Name),'boss')then ba=true elseif string.find(string.lower(a9
.Name),'boss')then ba=true elseif a9.Parent and string.find(string.lower(a9.
Parent.Name),'boss')then ba=true end if ba then aP=b.Root.Position return end
end end for a9,b in pairs(at)do if b and b.Root and b.Root.Parent then aP=b.Root
.Position return end end end local a9=function(a9)if am==a9 then return end am=
a9 if a9 then ao+=1 aP=nil aO()for b=#ap,1,-1 do pcall(ap[b],ao)end else aP=nil
end for b=#an,1,-1 do pcall(an[b],am)end aN()end function ag.
GetBossSpawnPosition()if aP then return aP end aO()return aP end function ag.
SetBossSpawnPosition(b)aP=b end local function b()if not ac then return end
local ba=ac:FindFirstChild'PlayerGui'if not ba then a8=nil a9(false)return end
local bb=ba:FindFirstChild('bossHealth',true)if bb then if bb~=a8 then a8=bb if
a8:IsA'ScreenGui'then aS(a8:GetPropertyChangedSignal'Enabled':Connect(b))elseif
a8:IsA'GuiObject'then aS(a8:GetPropertyChangedSignal'Visible':Connect(b))end end
local bc=if bb:IsA'ScreenGui'then bb.Enabled elseif bb:IsA'GuiObject'then bb.
Visible else true a9(bc)else a8=nil a9(false)end end task.spawn(function()if not
ac then return end local ba=ac:WaitForChild('PlayerGui',30)if not ba then return
end aS(ba.DescendantAdded:Connect(b))aS(ba.DescendantRemoving:Connect(b))b()
while ab.IsActive()and task.wait(0.5)do b()end end)ab.Register(function()if aQ
then aQ:Disconnect()aQ=nil end for ba,bb in ipairs(aF)do pcall(function()bb:
Disconnect()end)end table.clear(aF)aM()end)return ag end function a.g()local aa=
{}function aa.PatchSliderLoadCallback(ab)if not ab or type(ab.UpdateValue)~=
'function'then return ab end local ac=ab.UpdateValue ab.UpdateValue=function(ad,
ae)ac(ad,ae)local af=ad.Settings if af and af.Callback then task.spawn(function(
)pcall(af.Callback,tonumber(ae))end)end end return ab end function aa.
PatchDropdownRestore(ab,ac)if not ab or type(ab.UpdateSelection)~='function'then
return ab end local ad=ab.UpdateSelection ab.UpdateSelection=function(ae,af)if
type(af)=='string'and af~=''and not ae:IsOption(af)then if ac then pcall(
function()ae:InsertOptions{af}end)else local ag=ae.Settings and ae.Settings.
Options if type(ag)=='table'and#ag>0 then af=ag[1]else local ah=next(ae:
GetOptions())if ah then af=ah end end end end ad(ae,af)end return ab end return
aa end function a.h()local aa,ab,ac=a.load'e',a.load'f',a.load'b'local ad,ae,af,
ag,ah=aa.UserInputService,aa.VirtualInputManager,{},false function af.
IsMouseComboEnabled()return ag end function af.SetMouseComboEnabled(ai)ag=ai==
true end local ai=function()task.spawn(function()ae:SendKeyEvent(true,Enum.
KeyCode.Q,false,game)ae:SendKeyEvent(true,Enum.KeyCode.E,false,game)task.wait(ab
.GetKeyHoldTime())ae:SendKeyEvent(false,Enum.KeyCode.Q,false,game)ae:
SendKeyEvent(false,Enum.KeyCode.E,false,game)end)end function af.Init()if af.
inited then return end af.inited=true ah=ad.InputBegan:Connect(function(aj,ak)if
aj.UserInputType==Enum.UserInputType.MouseButton2 then if ad:GetFocusedTextBox()
then return end if ag then ai()end end end)end ac.Register(function()if ah then
ah:Disconnect()ah=nil end af.inited=false end)return af end function a.i()local
aa,ab,ac,ad=a.load'f',a.load'g',a.load'd',a.load'h'return function(ae,af)local
ag=af:Section{Side='Right'}ag:Header{Name='Movement Speed'}ag:Toggle({Name=
'Fast Speed',Default=aa.IsSpeedEnabled(),Callback=ac.Wrap(function(ah)aa.
SetSpeedEnabled(ah)end)},'Toggle_FastSpeed')ab.PatchSliderLoadCallback(ag:
Slider({Name='Custom Fast Speed',Default=aa.GetFastSpeed(),Minimum=16,Maximum=24
,DisplayMethod='Value',Precision=1,Callback=ac.Wrap(function(ah)aa.SetFastSpeed(
ah)end)},'Slider_FastSpeed'))ag:Toggle({Name=
'Instant Acceleration (Max Speed t\u{1ee9}c th\u{ec})',Default=aa.
IsInstantAccelEnabled(),Callback=ac.Wrap(function(ah)aa.SetInstantAccelEnabled(
ah)end)},'Toggle_InstantAcceleration')ag:Header{Name='Shortcuts'}ag:Toggle({Name
='Right Click Combo (Q+E)',Default=ad.IsMouseComboEnabled(),Callback=ac.Wrap(
function(ah)ad.SetMouseComboEnabled(ah)end)},'Toggle_MouseCombo')end end
function a.j()local aa,ab,ac,ad,ae,af,ag={},0.85,0,2,{},64 function aa.
BindDetection(ah)ag=ah or nil end function aa.GetHazardPadding()return ac end aa
.GetHitboxPadding=aa.GetHazardPadding function aa.GetTrajectoryMargin()return ad
end function aa.SetTrajectoryMargin(ah)if type(ah)=='number'and ah>=0 and ah~=ad
then ad=ah aa.InvalidateCache()for ai,aj in ipairs(ae)do pcall(aj,ad)end end end
function aa.InvalidateCache()if ag and ag.GetActiveHazardsMap then for ah,ai in
pairs(ag.GetActiveHazardsMap())do ai.HazardZones=nil end end end function aa.
OnPaddingChanged(ah)if type(ah)=='function'then table.insert(ae,ah)end end
function aa.SetHazardPadding(ah)if type(ah)=='number'and ah>=0 and ah~=ac then
ac=ah aa.InvalidateCache()for ai,aj in ipairs(ae)do pcall(aj,ac)end end end aa.
SetHitboxPadding=aa.SetHazardPadding local ah={'firstBossCrissCross',
'firstBossBigSpike','firstBossSeekingSpikes'}local ai=function(ai)if not ai or
type(ai)~='string'then return false end local aj=ai:lower():gsub('%s+','')if#aj
==0 then return false end for ak,al in ipairs(ah)do local am=al:lower():gsub(
'%s+','')if#am>0 and string.find(aj,am,1,true)then return true end end return
false end function aa.IsForceCircle(aj)return ai(aj)end function aa.
AddForceCircleName(aj)if type(aj)=='string'and#aj>0 then table.insert(ah,aj)aa.
InvalidateCache()end end function aa.GetForceCircleNames()return ah end local aj
,ak,al=function(aj)return aj and aj.Parent and aj.Transparency<=ab end,function(
aj,ak,al)local am,an=aj.Size,al and ad or ac if ak or(aj:IsA'Part'and(aj.Shape==
Enum.PartType.Ball or aj.Shape==Enum.PartType.Cylinder))then return{radius=math.
max(am.X,am.Y,am.Z)/2}end local ao=Vector3.new(math.max(am.X,0)/2+an,0,math.max(
am.Z,0)/2+an)return{half=ao,cframe=aj.CFrame}end,function(aj,ak,al,am)if not ak
then return false end local an,ao=aj.X,aj.Z al=al or 0 local ap=(am or ak.
isTrajectory)and ad or ac if ak.radius then local aq=(ak.part and ak.part.Parent
)and ak.part.Position local ar,as=aq and aq.X or ak.cx or 0,aq and aq.Z or ak.cz
or 0 local at,au,av=an-ar,ao-as,ak.radius+ap+al return(at*at+au*au)<=(av*av)end
local aq=(ak.part and ak.part.Parent)and ak.part.CFrame or ak.cframe if aq then
local ar,as,at=aq:PointToObjectSpace(aj),ak.half.X,ak.half.Z if al<=0 then
return math.abs(ar.X)<=as and math.abs(ar.Z)<=at else local au,av=math.max(0,
math.abs(ar.X)-as),math.max(0,math.abs(ar.Z)-at)return(au*au+av*av)<=(al*al)end
end return false end local am=function(am)if not am or not am.Instance or not am
.Instance.Parent then return nil end local an=am.Instance local ao=am.Name or(an
and an.Name)or''local ap,aq=ai(ao),am.IsTrajectory==true local ar,as=aq and ad
or ac if an:IsA'BasePart'then if not aj(an)then return nil end as={an}else as={}
for at,au in ipairs(an:GetDescendants())do if#as>=af then break end if au:IsA
'BasePart'and aj(au)and au.Parent then as[#as+1]=au end end if#as==0 then return
nil end end local at,au,av,aw,ax={},math.huge,-math.huge,math.huge,-math.huge
for ay,az in ipairs(as)do local aA,aB=az.Position,az.Size local aC=math.max(aB.X
,aB.Y,aB.Z)/2+ar au=math.min(au,aA.X-aC)av=math.max(av,aA.X+aC)aw=math.min(aw,aA
.Z-aC)ax=math.max(ax,aA.Z+aC)local aD=ak(az,ap,aq)if aD then if aD.radius then
aD.cx,aD.cz=aA.X,aA.Z end aD.part=az aD.isTrajectory=aq at[#at+1]=aD end end if#
at==0 then return nil end local ay,az,aA,aB=(au+av)/2,(aw+ax)/2,(av-au)/2,(ax-aw
)/2 return{zones=at,center=Vector3.new(ay,0,az),boundingRadius=math.sqrt(aA*aA+
aB*aB)}end local an=function(an)local ao=an and an.HazardZones if not ao then ao
=am(an)if ao and an then an.HazardZones=ao end end return ao end function aa.
GetHazardZones(ao)return an(ao)end function aa.GetNearbyHazards(ao,ap)local aq=
ag if not aq then return{}end ap=ap or 65 local ar,as,at={},ao.X,ao.Z for au,av
in pairs(aq.GetActiveHazardsMap())do local aw,ax=av.Instance,an(av)if ax then
local ay,az=ax.center.X,ax.center.Z if aw and aw.Parent then local aA=aw:IsA
'BasePart'and aw or aw.PrimaryPart or aw:FindFirstChildWhichIsA'BasePart'if aA
then ay=aA.Position.X az=aA.Position.Z end end local aA,aB=as-ay,at-az local aC,
aD=aA*aA+aB*aB,ap+ax.boundingRadius if aC<=aD*aD then table.insert(ar,av)end end
end return ar end function aa.IsPointInAnyHazard(ao,ap,aq,ar,as)local at=ag if
not at then return false,nil,nil end aq=aq or 0 local au,av,aw,ax=math.huge,ar
or at.GetActiveHazardsMap()for ay,az in pairs(av)do if as and az.IsTrajectory==
true then continue end local aA=az.Instance or(typeof(ay)=='Instance'and ay)if
ap and(ap==aA or(aA and ap.Name==aA.Name))then continue end local aB=an(az)if
not aB then continue end local aC,aD=aB.center.X,aB.center.Z if aA and aA.Parent
then local aE=aA:IsA'BasePart'and aA or aA.PrimaryPart or aA:
FindFirstChildWhichIsA'BasePart'if aE then aC=aE.Position.X aD=aE.Position.Z end
end local aE,aF=ao.X-aC,ao.Z-aD local aG,aH=aE*aE+aF*aF,aB.boundingRadius+aq if
aG>aH*aH then continue end local aI=az.IsTrajectory==true for aJ=1,#aB.zones do
local aK=aB.zones[aJ]if aj(aK.part)and al(ao,aK,aq,aI or aK.isTrajectory)then
local aL=(ao-aK.part.Position).Magnitude if aL<au then au=aL aw=az ax=aK.part
end break end end end return ax~=nil,aw,ax end function aa.IsPointInAnyRedHazard
(ao,ap,aq,ar)return aa.IsPointInAnyHazard(ao,ap,aq,ar,true)end function aa.
GetHazardsAtPoint(ao,ap,aq,ar)local as=ag if not as then return{}end ap=ap or 0
local at,au={},aq or as.GetActiveHazardsMap()for av,aw in pairs(au)do if ar and
aw.IsTrajectory==true then continue end local ax,ay=aw.Instance or(typeof(av)==
'Instance'and av),an(aw)if not ay then continue end local az,aA=ay.center.X,ay.
center.Z if ax and ax.Parent then local aB=ax:IsA'BasePart'and ax or ax.
PrimaryPart or ax:FindFirstChildWhichIsA'BasePart'if aB then az=aB.Position.X aA
=aB.Position.Z end end local aB,aC=ao.X-az,ao.Z-aA local aD,aE=aB*aB+aC*aC,ay.
boundingRadius+ap if aD>aE*aE then continue end local aF=aw.IsTrajectory==true
for aG=1,#ay.zones do local aH=ay.zones[aG]if aj(aH.part)and al(ao,aH,ap,aF or
aH.isTrajectory)then at[aw]=true break end end end return at end function aa.
GetRedHazardsAtPoint(ao,ap,aq)return aa.GetHazardsAtPoint(ao,ap,aq,true)end
return aa end function a.k()local aa,ab,ac=a.load'e',a.load'b',a.load'j'local ad
,ae,af,ag,ah,ai,aj,ak,al,am,an,ao=aa.RunService or game:GetService'RunService',
aa.player,{},false,{},0.85,Color3.fromRGB(255,45,45),Color3.fromRGB(0,160,255),
0.55,0.25 local ap=function()local ap=ae and ae.Character if not ap then return
nil end local aq=ap:FindFirstChild'HumanoidRootPart'or ap.PrimaryPart if not aq
then return nil end return aq.Position.Y-2.5 end function af.BindDetection(aq)an
=aq or nil end function af.IsEnabled()return ag end local aq=function(aq,ar)
local as,at=aq.part,aq.ad if not as or not as.Parent or not at or not at.Parent
then return end local au=as.Position local av=Vector3.new(au.X,ar or au.Y,au.Z)
if aq.isCircle then local aw=CFrame.new(av)*CFrame.Angles(math.rad(90),0,0)at.
CFrame=as.CFrame:ToObjectSpace(aw)else local aw,ax,ay=as.CFrame:ToOrientation()
local az=CFrame.new(av)*CFrame.Angles(0,ax,0)at.CFrame=as.CFrame:ToObjectSpace(
az)end end local ar=function()if not ag then return end local ar,as=false,ap()
for at,au in pairs(ah)do if not at.Instance or not at.Instance.Parent then af.
DetachZoneVisuals(at)else ar=true if au.items then for av,ax in ipairs(au.items)
do aq(ax,as)end end end end if not ar and ao then ao:Disconnect()ao=nil end end
local as=function()if not ao and ag then ao=ad.Heartbeat:Connect(ar)end end
function af.DetachZoneVisuals(at)if not at then return end local au=ah[at]if not
au then return end if au.adornments then for av,ax in ipairs(au.adornments)do
pcall(function()ax:Destroy()end)end table.clear(au.adornments)end if au.
connections then for av,ax in ipairs(au.connections)do pcall(function()ax:
Disconnect()end)end table.clear(au.connections)end if au.items then table.clear(
au.items)end ah[at]=nil end function af.UpdateHazardVisualColor(at,au)if not at
then return end local av=ah[at]if not av or not av.items then return end local
ax=au==true or at.IsTrajectory==true local ay,az=ax and ak or aj,ax and ac.
GetTrajectoryMargin()or 0 for aA,aB in ipairs(av.items)do local aC,aD,aE=aB.ad,
aB.zone,aB.part if aC and aC.Parent and aD and aE and aE.Parent then aC.Color3=
ay if aB.isCircle and aD.radius then aC.Radius=aD.radius+az elseif aD.half then
local aF,aG=math.max(aE.Size.X,0)/2+az,math.max(aE.Size.Z,0)/2+az aC.Size=
Vector3.new(aF*2,am,aG*2)end end end end function af.AttachZoneVisuals(at)if not
ag or not at then return end if ah[at]then af.DetachZoneVisuals(at)end local au=
ac.GetHazardZones(at)if not au or not au.zones then return end local av=at.
IsTrajectory==true local ax,ay,az,aA,aB,aC=av and ak or aj,av and ac.
GetTrajectoryMargin()or 0,ap(),{},{},{}for aD,aE in ipairs(au.zones)do local aF=
aE.part if aF and aF.Parent and aF.Transparency<=ai then local aG,aH=false if aE
.radius then aG=true local aI=Instance.new'CylinderHandleAdornment'aI.Name=
'HazardGroundCircle'aI.Adornee=aF aI.Radius=aE.radius+ay aI.Height=am aI.Color3=
ax aI.Transparency=al aI.ZIndex=2 aI.AlwaysOnTop=true aI.Parent=aF aH=aI elseif
aE.half and aE.cframe then local aI=Instance.new'BoxHandleAdornment'aI.Name=
'HazardGroundBox'aI.Adornee=aF aI.Size=Vector3.new(aE.half.X*2,am,aE.half.Z*2)aI
.Color3=ax aI.Transparency=al aI.ZIndex=2 aI.AlwaysOnTop=true aI.Parent=aF aH=aI
end if aH then local aI={ad=aH,part=aF,isCircle=aG,zone=aE}aq(aI,az)table.
insert(aA,aI)table.insert(aB,aH)local aJ=aF:GetPropertyChangedSignal
'Transparency':Connect(function()if aF.Parent and aF.Transparency>ai then pcall(
function()aH:Destroy()end)end end)table.insert(aC,aJ)end end end if#aB>0 then ah
[at]={items=aA,adornments=aB,connections=aC}as()end end function af.ClearAll()if
ao then ao:Disconnect()ao=nil end for at in pairs(ah)do af.DetachZoneVisuals(at)
end table.clear(ah)end function af.RefreshAll()af.ClearAll()if not ag or not an
then return end for at,au in pairs(an.GetActiveHazardsMap())do af.
AttachZoneVisuals(au)end end function af.SetEnabled(at)ag=at and true or false
if ag then af.RefreshAll()else af.ClearAll()end end ac.OnPaddingChanged(function
()if ag then af.RefreshAll()end end)ab.Register(function()af.ClearAll()end)
return af end function a.l()local aa,ab,ac=a.load'e',a.load'b',a.load'j'local ad
,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap=aa.RunService or game:GetService
'RunService',aa.player,{},false,45,{},0.85,Color3.fromRGB(255,140,0),0.65,0.2,
3.5 local aq=function()local aq=ae and ae.Character if not aq then return nil
end local ar=aq:FindFirstChild'HumanoidRootPart'or aq.PrimaryPart if not ar then
return nil end return ar.Position.Y-2.5 end function af.BindDetection(ar)ao=ar
or nil end function af.IsEnabled()return ag end function af.GetPredictionLength(
)return ah end function af.SetPredictionLength(ar)if type(ar)=='number'and ar>0
then ah=math.clamp(ar,10,200)af.RefreshAll()end end function af.IsHazardMoving(
ar)if not ar then return false end local as=ai[ar]return as and as.isMoving==
true end local ar,as=function(ar,as)local at=ar.Instance if not at or not at.
Parent then return nil,4 end local au,av,ax=ac.GetTrajectoryMargin and ac.
GetTrajectoryMargin()or 2,{},ar.Name or(at and at.Name)or''local ay=ac.
IsForceCircle and ac.IsForceCircle(ax)if at:IsA'BasePart'then if at.Transparency
<=aj then table.insert(av,at)end else for az,aA in ipairs(at:GetDescendants())do
if aA:IsA'BasePart'and aA.Parent and aA.Transparency<=aj then table.insert(av,aA
)end end end if#av==0 then return nil,4 end local az,aA,aB,aC=Vector3.new(-as.Z,
0,as.X),math.huge,-math.huge,0 for aD,aE in ipairs(av)do local aF,aG,aH=aE.
Position,aE.Size,0 if ay or(aE:IsA'Part'and(aE.Shape==Enum.PartType.Ball or aE.
Shape==Enum.PartType.Cylinder))then aH=math.max(aG.X,aG.Y,aG.Z)/2 else local aI=
aE.CFrame local aJ,aK,aL,aM,aN,aO=aI.RightVector,aI.UpVector,aI.LookVector,aG.X/
2,aG.Y/2,aG.Z/2 aH=aM*math.abs(aJ.X*az.X+aJ.Z*az.Z)+aN*math.abs(aK.X*az.X+aK.Z*
az.Z)+aO*math.abs(aL.X*az.X+aL.Z*az.Z)end local aI=aF.X*az.X+aF.Z*az.Z aA=math.
min(aA,aI-aH)aB=math.max(aB,aI+aH)local aJ=aF.X*as.X+aF.Z*as.Z aC+=aJ end local
aD,aE,aF=math.max(1,(aB-aA)+au*2),(aA+aB)/2,aC/#av local aG=as*aF+az*aE return
aG,aD end,function(ar,as,at,au,av,ax,ay)if not as or not as.Parent or not ar or
not ar.Parent then return end local az=ax/2 local aA=Vector3.new(at.X+au.X*az,av
or at.Y,at.Z+au.Z*az)local aB=aA+Vector3.new(au.X,0,au.Z)local aC=CFrame.lookAt(
aA,aB)local aD=as.CFrame:ToObjectSpace(aC)ar.CFrame=aD ar.Size=Vector3.new(ay,am
,ax)if not ar.Visible then ar.Visible=true end end local at=function()if not ag
then return end local at,au,av=false,os.clock(),aq()for ax,ay in pairs(ai)do
local az=ax.Instance if not az or not az.Parent then af.DetachTrajectoryVisuals(
ax)else at=true local aA=ay.mainPart if aA and aA.Parent then local aB,aC=aA.
Position,au-(ay.lastClock or au)if aC>=0.035 then local aD=aB-(ay.lastPos or aB)
local aE,aF=aD.Magnitude/aC,Vector3.new(aD.X,0,aD.Z)local aG,aH=aF.Magnitude/aC,
ay.isMoving==true if aG>=an then ay.isMoving=true ay.dir=aF.Unit else if aC>=
0.25 and aE<an then ay.isMoving=false end end if ay.isMoving~=aH then ax.
IsTrajectory=ay.isMoving ax.HazardZones=nil if ao and ao.UpdateHazardVisualColor
then pcall(ao.UpdateHazardVisualColor,ax,ay.isMoving)end local aI=a.load'k'if aI
and aI.UpdateHazardVisualColor then pcall(aI.UpdateHazardVisualColor,ax,ay.
isMoving)end end ay.lastPos=aB ay.lastClock=au end if ay.isMoving and ay.dir and
ay.ad then local aD,aE=ar(ax,ay.dir)if aD then as(ay.ad,aA,aD,ay.dir,av,ah,aE)
end else if ay.ad and ay.ad.Visible then ay.ad.Visible=false end end end end end
if not at and ap then ap:Disconnect()ap=nil end end local au=function()if not ap
and ag then ap=ad.Heartbeat:Connect(at)end end function af.
DetachTrajectoryVisuals(av)if not av then return end local ax=ai[av]if not ax
then return end if ax.ad then pcall(function()ax.ad:Destroy()end)ax.ad=nil end
if ax.connections then for ay,az in ipairs(ax.connections)do pcall(function()az:
Disconnect()end)end table.clear(ax.connections)end ai[av]=nil end function af.
AttachTrajectoryVisuals(av)if not ag or not av then return end if ai[av]then af.
DetachTrajectoryVisuals(av)end local ax=av.Instance if not ax or not ax.Parent
then return end local ay if ax:IsA'BasePart'then ay=ax else ay=ax.PrimaryPart or
ax:FindFirstChildWhichIsA'BasePart'if not ay then for az,aA in ipairs(ax:
GetDescendants())do if aA:IsA'BasePart'and aA.Parent then ay=aA break end end
end end if not ay or not ay.Parent then return end local az=Instance.new
'BoxHandleAdornment'az.Name='HazardTrajectoryCorridor'az.Adornee=ay az.Size=
Vector3.new(4,am,ah)az.Color3=ak az.Transparency=al az.ZIndex=1 az.AlwaysOnTop=
true az.Visible=false az.Parent=ay local aA,aB={},ay:GetPropertyChangedSignal
'Transparency':Connect(function()if ay.Parent and ay.Transparency>aj then pcall(
function()az:Destroy()end)end end)table.insert(aA,aB)ai[av]={ad=az,connections=
aA,mainPart=ay,lastPos=ay.Position,lastClock=os.clock(),velocity=Vector3.zero,
dir=nil,isMoving=false}au()end function af.ClearAll()if ap then ap:Disconnect()
ap=nil end for av in pairs(ai)do af.DetachTrajectoryVisuals(av)end table.clear(
ai)end function af.RefreshAll()af.ClearAll()if not ag or not ao then return end
for av,ax in pairs(ao.GetActiveHazardsMap())do af.AttachTrajectoryVisuals(ax)end
end function af.GetNearbyTrajectories(av,ax)ax=ax or 65 local ay,az,aA={},av.X,
av.Z for aB,aC in pairs(ai)do if aC.isMoving and aC.dir and aC.mainPart and aC.
mainPart.Parent then local aD,aE=ar(aB,aC.dir)if aD and aE then local aF,aG=aD.X
,aD.Z local aH,aI=az-aF,aA-aG local aJ,aK=aH*aH+aI*aI,ax+ah+(aE/2)if aJ<=aK*aK
then table.insert(ay,{info=aB,record=aC})end end end end return ay end function
af.IsPointInAnyTrajectory(av,ax,ay)local az,aA=av.X,av.Z ax=ax or 0 if ay then
for aB,aC in ipairs(ay)do local aD,aE=aC.info,aC.record if aE and aE.isMoving
and aE.dir and aE.mainPart and aE.mainPart.Parent then local aF,aG=ar(aD,aE.dir)
if aF and aG then local aH=aE.dir local aI,aJ,aK=Vector3.new(-aH.Z,0,aH.X),az-aF
.X,aA-aF.Z local aL,aM,aN=aJ*aH.X+aK*aH.Z,aJ*aI.X+aK*aI.Z,aG/2 if ax<=0 then if
aL>=0 and aL<=ah and math.abs(aM)<=aN then return true,aD,aH,aF,aG end else
local aO=0 if aL<0 then aO=-aL elseif aL>ah then aO=aL-ah end local aP=math.max(
0,math.abs(aM)-aN)if(aO*aO+aP*aP)<=(ax*ax)then return true,aD,aH,aF,aG end end
end end end return false,nil,nil,nil,nil end for aB,aC in pairs(ai)do if aC.
isMoving and aC.dir and aC.mainPart and aC.mainPart.Parent then local aD,aE=ar(
aB,aC.dir)if aD and aE then local aF=aC.dir local aG,aH,aI=Vector3.new(-aF.Z,0,
aF.X),az-aD.X,aA-aD.Z local aJ,aK,aL=aH*aF.X+aI*aF.Z,aH*aG.X+aI*aG.Z,aE/2 if ax
<=0 then if aJ>=0 and aJ<=ah and math.abs(aK)<=aL then return true,aB,aF,aD,aE
end else local aM=0 if aJ<0 then aM=-aJ elseif aJ>ah then aM=aJ-ah end local aN=
math.max(0,math.abs(aK)-aL)if(aM*aM+aN*aN)<=(ax*ax)then return true,aB,aF,aD,aE
end end end end end return false,nil,nil,nil,nil end function af.SetEnabled(av)
ag=av and true or false if ag then af.RefreshAll()else af.ClearAll()end end ac.
OnPaddingChanged(function()if ag then af.RefreshAll()end end)ab.Register(
function()af.ClearAll()end)return af end function a.m()local aa,ab,ac=a.load'e',
a.load'b',a.load'j'local ad,ae,af,ag,ah,ai,aj,ak,al,am=aa.RunService or game:
GetService'RunService',aa.player,{},true,{},0.85,Color3.fromRGB(255,60,60),
'255,130,130'function af.BindDetection(an)al=an or nil end function af.IsEnabled
()return ag end local an=function()local an=ae and ae.Character if not an then
return nil end local ao=an:FindFirstChild'HumanoidRootPart'or an.PrimaryPart if
not ao then return nil end return ao.Position.Y-2.5 end local ao,ap=function(ao)
if not ao or not ao.Parent then return 2.5 end local ap=an()if ap then local aq=
ap+2.5 local ar,as=aq-ao.Position.Y,ao.Size.Y/2+1.2 return math.clamp(math.max(
ar,as),1.5,30)end return math.clamp(ao.Size.Y/2+1.8,2,10)end,function(ao)return
ao and ao.Parent and ao.Transparency<=ai end local aq,ar=function(aq)if not aq
or not aq.Parent then return nil end if aq:IsA'BasePart'then if ap(aq)then
return aq end elseif aq:IsA'Model'then if aq.PrimaryPart and ap(aq.PrimaryPart)
then return aq.PrimaryPart end local ar=aq:FindFirstChild'HumanoidRootPart'if ar
and ap(ar)then return ar end for as,at in ipairs(aq:GetDescendants())do if at:
IsA'BasePart'and ap(at)then return at end end else for ar,as in ipairs(aq:
GetDescendants())do if as:IsA'BasePart'and ap(as)then return as end end end
return nil end,function(aq,ar)if not aq or not aq.items or not ar then return
end local as=ar.SpawnClock or os.clock()local at,au=math.max(0,os.clock()-as),ar
.Name or'Red Zone'local av=(
[[<font color='rgb(%s)'>%s</font> <font color='rgb(255,255,255)'><b>%.1fs</b></font>]]
):format(ak,au,at)for ax,ay in ipairs(aq.items)do if ay.label and ay.label.
Parent then ay.label.Text=av end end end local as=function()if not ag then
return end local as=false for at,au in pairs(ah)do local av=at.Instance if at.
IsTrajectory==true or not av or not av.Parent then af.DetachTimerVisual(at)else
if au.items then for ax=#au.items,1,-1 do local ay=au.items[ax]local az=ay.part
if not ap(az)then if ay.billboard and ay.billboard.Parent then pcall(function()
ay.billboard:Destroy()end)end table.remove(au.items,ax)else if ay.billboard and
ay.billboard.Parent then ay.billboard.StudsOffset=Vector3.new(0,ao(az),0)end end
end if#au.items==0 then af.DetachTimerVisual(at)else as=true ar(au,at)end else
af.DetachTimerVisual(at)end end end if not as and am then am:Disconnect()am=nil
end end local at,au=function()if not am and ag then am=ad.Heartbeat:Connect(as)
end end,function(at)local au,av=ao(at),Instance.new'BillboardGui'av.Name=
'HazardLifespanTimer'av.Adornee=at av.AlwaysOnTop=true av.MaxDistance=500 av.
LightInfluence=0 av.ResetOnSpawn=false av.Active=false av.Size=UDim2.new(0,130,0
,24)av.StudsOffset=Vector3.new(0,au,0)av.ZIndexBehavior=Enum.ZIndexBehavior.
Sibling local ax=Instance.new'Frame'ax.Name='TimerFrame'ax.Size=UDim2.new(1,0,1,
0)ax.BackgroundColor3=Color3.fromRGB(15,15,20)ax.BackgroundTransparency=0.25 ax.
BorderSizePixel=0 ax.Parent=av local ay=Instance.new'UICorner'ay.CornerRadius=
UDim.new(0,6)ay.Parent=ax local az=Instance.new'UIStroke'az.Name='Stroke'az.
Thickness=1.3 az.Color=aj az.Transparency=0.15 az.Parent=ax local aA=Instance.
new'TextLabel'aA.Name='TimerLabel'aA.Size=UDim2.new(1,-6,1,0)aA.Position=UDim2.
new(0,3,0,0)aA.BackgroundTransparency=1 aA.Font=Enum.Font.GothamBold aA.TextSize
=11 aA.TextColor3=Color3.fromRGB(255,255,255)aA.TextStrokeTransparency=0 aA.
TextStrokeColor3=Color3.fromRGB(0,0,0)aA.RichText=true aA.TextXAlignment=Enum.
TextXAlignment.Center aA.TextYAlignment=Enum.TextYAlignment.Center aA.Text=''aA.
Parent=ax av.Parent=at return av,aA,az end function af.AttachTimerVisual(av)if
not ag or not av then return end if av.IsTrajectory==true then if ah[av]then af.
DetachTimerVisual(av)end return end if ah[av]then af.DetachTimerVisual(av)end
local ax=av.Instance if not ax or not ax.Parent then return end local ay=ac.
GetHazardZones(av)local az,aA,aB=ay and ay.zones,{},{}local aC=function(aC,aD,aE
,aF,aG)local aH={billboard=aD,label=aE,stroke=aF,part=aC,zone=aG}table.insert(aA
,aH)local aI=aC:GetPropertyChangedSignal'Transparency':Connect(function()if not
ap(aC)then pcall(function()aD:Destroy()end)end end)table.insert(aB,aI)local aJ=
aC.AncestryChanged:Connect(function(aJ,aK)if not aK then pcall(function()aD:
Destroy()end)end end)table.insert(aB,aJ)end if az and#az>0 then for aD,aE in
ipairs(az)do local aF=aE.part if ap(aF)then local aG,aH,aI=au(aF)aC(aF,aG,aH,aI,
aE)end end else local aD=aq(ax)if ap(aD)then local aE,aF,aG=au(aD)aC(aD,aE,aF,aG
,nil)end end if#aA>0 then local aD={items=aA,connections=aB}ah[av]=aD ar(aD,av)
at()end end function af.DetachTimerVisual(av)if not av then return end local ax=
ah[av]if not ax then return end if ax.connections then for ay,az in ipairs(ax.
connections)do pcall(function()az:Disconnect()end)end table.clear(ax.connections
)end if ax.items then for ay,az in ipairs(ax.items)do if az.billboard and az.
billboard.Parent then pcall(function()az.billboard:Destroy()end)end end table.
clear(ax.items)end ah[av]=nil end function af.UpdateHazardVisualColor(av,ax)if
not av then return end local ay=ax==true or av.IsTrajectory==true if ay then af.
DetachTimerVisual(av)else if not ah[av]then af.AttachTimerVisual(av)end end end
function af.ClearAll()if am then am:Disconnect()am=nil end for av in pairs(ah)do
af.DetachTimerVisual(av)end table.clear(ah)end function af.RefreshAll()af.
ClearAll()if not ag or not al then return end for av,ax in pairs(al.
GetActiveHazardsMap())do if ax and ax.IsTrajectory~=true then af.
AttachTimerVisual(ax)end end end function af.SetEnabled(av)ag=av and true or
false if ag then af.RefreshAll()else af.ClearAll()end end ab.Register(function()
af.ClearAll()end)return af end function a.n()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj
=a.load'e',a.load'f',a.load'b',a.load'j',a.load'k',a.load'l',a.load'm',game:
GetService'Players',game:GetService'Workspace',game:GetService
'ReplicatedStorage'local ak,al,am,an,ao,ap,aq,ar,as,at,au,av,ax,ay,az,aA,aB,aC=
aa.player,{},false,false,true,false,false,'',false,{},0,{},{},{'abilities',
'projectiles'},false,{}local aD,aE,aF,aG,aH,aI,aJ,aK=function()if az then return
end az=true for aD,aE in ipairs(ay)do local aF=aj:FindFirstChild(aE)if aF then
for aG,aH in ipairs(aF:GetChildren())do local aI=(aH.Name or''):lower():gsub(
'%s+','')if#aI>0 then aA[aI]=true end end end end end,function(aD)if not aD then
return true end local aE=aD.Name if typeof(aE)=='string'then local aF=aE:lower()
if aF:sub(1,3)=='tm_'or aF:sub(1,3)=='pr_'or aF:sub(1,3)=='dq_'or aF:find
'pathrecord'or aF:find'safespot'or aF:find'hazard'or aF:find'adornment'or aF:
find'debug'or aF:find'targetpart'or aF:find'actualmarker'then return true end
local aG=aD.Parent while aG and aG~=workspace and aG~=game do local aH=aG.Name
if typeof(aH)=='string'then local aI=aH:lower()if aI:find'pathrecord'or aI:sub(1
,3)=='tm_'or aI:sub(1,3)=='pr_'then return true end end aG=aG.Parent end local
aH=aF:gsub('%s+','')if#aH>0 and aA[aH]==true then return true end end return
false end,function(aD)if not aD then return false end if ah:
GetPlayerFromCharacter(aD)then return true end if ah:FindFirstChild(aD.Name)then
return true end for aE,aF in ipairs(ah:GetPlayers())do if aD.Name==aF.Name then
return true end local aG=aF.Character if aG and(aD==aG or aD:IsDescendantOf(aG))
then return true end end local aE=ak and ak.Character if aE and(aD==aE or aD:
IsDescendantOf(aE))then return true end return false end,function()local aD=0
for aE in pairs(at)do aD+=1 end au=aD for aE=#av,1,-1 do pcall(av[aE],aD,aB)end
end,0.85,50,0.05,{}local aL,aM,aN,aO,aP,aQ,aR,aS=function(aL)local aM=aK[aL]if
aM then aM.active=false aK[aL]=nil end end,function()for aL,aM in pairs(aK)do if
aM then aM.active=false end end table.clear(aK)end,function(aL)if not aL then
return{}end local aM={}local aN=function(aN)if aN and aN.Parent and aN.
Transparency<=aH then aM[#aM+1]=aN end end if aL:IsA'BasePart'then aN(aL)else
for aO,aP in ipairs(aL:GetDescendants())do if aP:IsA'BasePart'and aP.Parent then
aN(aP)end end end return aM end,function(aL)local aM=ak and ak.Character if not
aM then return 0 end local aN=aM:FindFirstChild'HumanoidRootPart'or aM.
PrimaryPart if not aN then return 0 end local aO,aP=(aN.Position)if aL:IsA
'BasePart'then aP=aL.Position elseif aL:IsA'Model'then local aQ,aR=pcall(
function()return aL:GetPivot().Position end)if aQ then aP=aR else local aS=aL:
FindFirstChildWhichIsA'BasePart'aP=aS and aS.Position end end if not aP then
return 0 end return math.floor((aO-aP).Magnitude+0.5)end,Color3.fromRGB(255,45,
45),Color3.fromRGB(255,30,30),Color3.fromRGB(0,170,255),Color3.fromRGB(0,140,255
)local aT=function(aT,aU,aV)local aW,aX,aY={},aV and aR or aP,aV and aS or aQ
for aZ,a_ in ipairs(aT)do if a_ and a_.Parent then local a0=Instance.new
'SelectionBox'a0.Name='HazardSelectionBox'a0.Color3=aX a0.SurfaceColor3=aY a0.
SurfaceTransparency=0.6 a0.LineThickness=0.05 a0.Adornee=a_ a0.Parent=a_ local
a1=a_:GetPropertyChangedSignal'Transparency':Connect(function()if a_.Parent and
a_.Transparency>aH then pcall(function()a0:Destroy()end)end end)if aU then table
.insert(aU,a1)end aW[#aW+1]=a0 end end return aW end function al.
UpdateHazardVisualColor(aU,aV)if not aU or not aU.Boxes then return end local aW
=aV==true or aU.IsTrajectory==true local aX,aY=aW and aR or aP,aW and aS or aQ
for aZ,a_ in ipairs(aU.Boxes)do if a_ and a_.Parent then a_.Color3=aX a_.
SurfaceColor3=aY end end ag.UpdateHazardVisualColor(aU,aW)end local aU,aV=
function(aU)if not as or ar==''then return false end if not aU or type(aU)~=
'string'then return false end local aV=ar:lower():gsub('%s+','')if#aV==0 then
return false end local aW=aU:lower():gsub('%s+','')return string.find(aW,aV,1,
true)~=nil end,function(aU)if not aU then return'nil'end return(
'(%.2f, %.2f, %.2f)'):format(aU.X,aU.Y,aU.Z)end local aW=function(aW,aX,aY,aZ)if
not aW then return end local a_=aW.Name if not aU(a_)then return end local a0,a1
,a2=aW.ClassName,aW.Parent and aW.Parent:GetFullName()or'nil',aO(aW)print
'================== \u{1f50d} [HAZARD DEEP INSPECT] \u{1f50d} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(a_,a0))print((
'  \u{1f4cc} Event Type     : %s%s'):format(aX,aY and(' -> '..tostring(aY))or'')
)print(('  \u{1f4cd} Full Path      : %s'):format(a1))print((
'  \u{1f4cf} Dist to Player : %d studs'):format(a2))if aX=='SPAWN'then local a3=
{}if aW:IsA'BasePart'then table.insert(a3,aW)else for a4,a5 in ipairs(aW:
GetDescendants())do if a5:IsA'BasePart'then table.insert(a3,a5)end end end
print(('  \u{1f9e9} Total Parts (%d) :'):format(#a3))for a4,a5 in ipairs(a3)do
local a6=a5:IsA'Part'and tostring(a5.Shape.Name)or(a5.ClassName=='MeshPart'and
'MeshPart'or a5.ClassName)print(('     [%d] %q (%s)'):format(a4,a5.Name,a5.
ClassName))print((
'         \u{2022} Size: %s | Shape: %s | Trans: %.2f | CanCollide: %s'):format(
aV(a5.Size),a6,a5.Transparency,tostring(a5.CanCollide)))print((
'         \u{2022} Pos : %s'):format(aV(a5.Position)))end local a4=ad.
GetHazardZones(aZ)if a4 and a4.zones then local a5=ad.GetHitboxPadding()print((
'  \u{1f4d0} Math Geometry (Zones: %d, BoundingRadius: %.1f studs):'):format(#a4
.zones,a4.boundingRadius or 0))for a6,a7 in ipairs(a4.zones)do if a7.radius then
print((
[[     - Zone [%d]: Circle/Ball (Base Radius: %.2f + Pad: %.2f = %.2f studs)]]):
format(a6,a7.radius,a5,a7.radius+a5))elseif a7.half then print((
'     - Zone [%d]: Box/OBB (HalfSize: %s)'):format(a6,aV(a7.half)))end end end
task.spawn(function()local a5 if aW:IsA'BasePart'then a5=aW elseif aW:IsA'Model'
then a5=aW.PrimaryPart or aW:FindFirstChildWhichIsA'BasePart'end if not a5 then
return end local a6,a7=os.clock(),a5.CFrame task.wait(0.12)if not aW.Parent or
not a5.Parent then return end local a8,a9=os.clock(),a5.CFrame local b=a8-a6 if
b<=0 then return end local ba=a9*a7:Inverse()local bb,bc=ba:ToAxisAngle()local
bd,be=math.deg(bc)/b,a7:Inverse()*a9 local bf,bg=be:ToAxisAngle()if math.abs(
math.deg(bc))>=1.5 then local bh=
'Tr\u{1ee5}c t\u{1ef1} do / H\u{1ed7}n h\u{1ee3}p'if math.abs(bb.Y)>=0.8 then bh
='Tr\u{1ee5}c Y (Yaw - Qu\u{e9}t ngang m\u{1eb7}t s\u{e0}n)'elseif math.abs(bb.X
)>=0.8 then bh='Tr\u{1ee5}c X (Pitch - L\u{103}n nh\u{e0}o l\u{1ed9}n)'elseif
math.abs(bb.Z)>=0.8 then bh=
'Tr\u{1ee5}c Z (Roll - Nghi\u{ea}ng l\u{1ead}t b\u{ea}n)'end local bi=
'Tr\u{1ee5}c t\u{1ef1} do'if math.abs(bf.Y)>=0.8 then bi='Tr\u{1ee5}c Local Y'
elseif math.abs(bf.X)>=0.8 then bi='Tr\u{1ee5}c Local X'elseif math.abs(bf.Z)>=
0.8 then bi='Tr\u{1ee5}c Local Z'end print
'================== \u{1f504} [INSPECT: SPINNING DETECTED] \u{1f504} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(aW.Name,a5.Name))print((
'  \u{26a1} T\u{1ed1}c \u{111}\u{1ed9} xoay    : %.2f \u{b0}/s (%.2f rad/s)'):
format(bd,bc/b))print(('  \u{1f310} World Spin Axis: %s -> %s'):format(aV(bb),bh
))print(('  \u{1f9e9} Local Spin Axis: %s -> %s'):format(aV(bf),bi))print
[[========================================================================]]end
end)elseif aX=='DESPAWN'then if aZ and aZ.SpawnClock then local a3=os.clock()-aZ
.SpawnClock print(('  \u{23f1}\u{fe0f} Lifetime Active: %.2f seconds'):format(a3
))end elseif aX=='REJECTED'then print(('  \u{26a0}\u{fe0f} Rejection Reason: %s'
):format(tostring(aY)))end print
[[================================================================]]end local aX
,aY=function(aX,aY)aW(aX,'REJECTED',aY,nil)if not aq then return end local aZ,a_
=aX and aX.Name or'?',aX and aX.ClassName or'?'print((
'[HazardScanner][Reject] \u{26aa} %s (%s) \u{2014} %s'):format(aZ,a_,aY))end
local aZ=function(aZ)if not aZ or not aZ.Parent then return end if aF(aZ)then
return end if at[aZ]then return end if aK[aZ]then return end local a_={active=
true,count=0}aK[aZ]=a_ task.spawn(function()while a_.active and aZ.Parent and am
and an do if aF(aZ)then aL(aZ)return end a_.count+=1 local a0,a1,a2=aZ:
GetDescendants(),aN(aZ),aU(aZ.Name)if aq or a2 then print((
'[HazardScanner][Retry] \u{1f504} L\u{1ea7}n %d/%d: %q (%s) | Descendants: %d | Valid Parts (Trans<=%.2f): %d'
):format(a_.count,aI,aZ.Name,aZ.ClassName,#a0,aH,#a1))end if#a1>0 then if aq or
a2 then print((
'[HazardScanner][Retry] \u{2705} L\u{1ea7}n %d/%d: %q \u{110}\u{e3} t\u{ec}m th\u{1ea5}y %d part(s)! Ti\u{1ebf}n h\u{e0}nh v\u{1ebd}...'
):format(a_.count,aI,aZ.Name,#a1))end aL(aZ)aY(aZ)return end if a_.count>=aI
then aX(aZ,(
'H\u{1ebf}t %d l\u{1b0}\u{1ee3}t retry m\u{e0} kh\u{f4}ng t\u{ec}m th\u{1ea5}y BasePart h\u{1ee3}p l\u{1ec7} (Descendants: %d)'
):format(aI,#a0))aL(aZ)return end task.wait(aJ)end aL(aZ)end)end aY=function(a_)
if not am or not an then aX(a_,'Ch\u{1b0}a trong dungeon')return false end if
not a_ or not a_.Parent then aX(a_,'Kh\u{f4}ng c\u{f2}n Parent')return false end
if aF(a_)then aX(a_,
'Nh\u{e2}n v\u{1ead}t ng\u{1b0}\u{1edd}i ch\u{1a1}i (Player/Teammate)')return
false end if at[a_]then return true end aD()if aE(a_)then aX(a_,
'Tr\u{f9}ng t\u{ea}n trong ReplicatedStorage (abilities/projectiles)')return
false end local a0=aN(a_)if#a0==0 then aX(a_,
'Ch\u{1b0}a c\u{f3} part \u{111}\u{1ec3} v\u{1ebd} (s\u{1ebd} retry)')aZ(a_)
return false end local a1,a2={},{}if ao then a2=aT(a0,a1)end local a3=aO(a_)
local a4={Instance=a_,Name=a_.Name,Class=a_.ClassName,Distance=a3,Boxes=a2,
Connections=a1,SpawnClock=os.clock()}at[a_]=a4 aB={Name=a_.Name,Class=a_.
ClassName,Distance=a3}if ae.IsEnabled()then ae.AttachZoneVisuals(a4)end if af.
IsEnabled()then af.AttachTrajectoryVisuals(a4)end if ag.IsEnabled()then ag.
AttachTimerVisual(a4)end aL(a_)aW(a_,'SPAWN','Passed all gates',a4)if ap then
print(('[HazardScanner][Hazard] \u{1f534} Hazard Detected: %s (%s, %d studs)'):
format(a_.Name,a_.ClassName,a3))end aG()return true end local a_=function(a_,a0)
local a1=at[a_]if not a1 then aL(a_)return end aW(a_,'DESPAWN',a0,a1)ae.
DetachZoneVisuals(a1)af.DetachTrajectoryVisuals(a1)ag.DetachTimerVisual(a1)if a1
.Boxes then for a2,a3 in ipairs(a1.Boxes)do pcall(function()a3:Destroy()end)end
table.clear(a1.Boxes)end if a1.Connections then for a2,a3 in ipairs(a1.
Connections)do pcall(function()a3:Disconnect()end)end table.clear(a1.Connections
)end at[a_]=nil if ap then local a2=a0 and(' ('..a0..')')or''print((
'[HazardScanner][Hazard] \u{1f7e2} Hazard Expired: %s%s'):format(tostring(a1.
Name),a2))end aG()end function al.ClearAllHazards(a0)ae.ClearAll()af.ClearAll()
ag.ClearAll()aM()local a1={}for a2 in pairs(at)do table.insert(a1,a2)end for a2,
a3 in ipairs(a1)do a_(a3,a0)end if ap and a0 then print((
'[HazardScanner][Hazard] \u{1f9f9} All hazards cleared: %s'):format(a0))end end
function al.StartScan()if am then return end am=true ae.BindDetection(al)af.
BindDetection(al)ag.BindDetection(al)al.ClearAllHazards'StartScan Reset'for a0,
a1 in ipairs(ax)do a1:Disconnect()end table.clear(ax)table.insert(ax,ai.
ChildAdded:Connect(function(a0)if aF(a0)then return end aY(a0)end))table.insert(
ax,ai.ChildRemoved:Connect(function(a0)a_(a0,'Destroyed')end))an=ab.
GetCurrentRoomIndex()>0 if aC then pcall(aC)aC=nil end aC=ab.OnRoomIndexChanged(
function(a0)if a0>0 then an=true elseif a0<=0 and an then an=false al.
ClearAllHazards'Dungeon Ended'end end)if ap then print
'[HazardScanner] \u{1f4e1} Threat Detector started!'end end function al.StopScan
()am=false an=false for a0,a1 in ipairs(ax)do a1:Disconnect()end table.clear(ax)
if aC then pcall(aC)aC=nil end al.ClearAllHazards'StopScan'if ap then print
'[HazardScanner] \u{1f6d1} Threat Detector stopped.'end end function al.
IsEnabled()return am end function al.SetEnabled(a0)if a0 then al.StartScan()else
al.StopScan()end end function al.SetSelectionBoxesEnabled(a0)ao=a0 and true or
false if ao then for a1,a2 in pairs(at)do if a1 and a1.Parent and(not a2.Boxes
or#a2.Boxes==0)then local a3=aN(a1)a2.Connections=a2.Connections or{}a2.Boxes=
aT(a3,a2.Connections)end end else for a1,a2 in pairs(at)do if a2.Boxes then for
a3,a4 in ipairs(a2.Boxes)do pcall(function()a4:Destroy()end)end table.clear(a2.
Boxes)end end end end function al.IsSelectionBoxesEnabled()return ao end
function al.SetLogHazards(a0)ap=a0 and true or false end function al.
IsLogHazardsEnabled()return ap end function al.SetLogFailed(a0)aq=a0 and true or
false end function al.IsLogFailedEnabled()return aq end function al.
SetInspectTarget(a0)ar=type(a0)=='string'and a0 or''end function al.
GetInspectTarget()return ar end function al.SetInspectEnabled(a0)as=a0 and true
or false end function al.IsInspectEnabled()return as end function al.
GetHazardCount()return au end function al.GetActiveHazards()local a0={}for a1,a2
in pairs(at)do if a1 and a1.Parent==ai then a0[#a0+1]=a2 end end return a0 end
function al.GetActiveHazardsMap()return at end function al.GetLastHazardInfo()
return aB end function al.OnHazardChanged(a0)if type(a0)~='function'then return
end table.insert(av,a0)end ac.Register(function()al.StopScan()al.ClearAllHazards
'Shutdown'end)return al end function a.o()local aa,ab,ac,ad=a.load'e',a.load'b',
a.load'j',a.load'l'local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av=
aa.RunService or game:GetService'RunService',aa.player,{},true,false,{},1.8,
Color3.fromRGB(0,255,170),Color3.fromRGB(255,35,35),0.45,0.2,0.2,(game:
GetService'Players')local ax,ay,az,aA=function()local ax=af or aq.LocalPlayer if
not ax then return nil end local ay=ax.Character if not ay or not ay.Parent then
return nil end local az=ay:FindFirstChildOfClass'Humanoid'if az and az.Health<=0
then return nil end return ay:FindFirstChild'HumanoidRootPart'or ay.PrimaryPart
end,function(ax)if not ax then return 0 end return ax.Position.Y-2.5 end,
function(ax)if au then if au.Parent~=ax or not au:IsDescendantOf(workspace)then
pcall(function()au:Destroy()end)au=nil else if au.Adornee~=ax then au.Adornee=ax
end return au end end if not ax or not ax.Parent then return nil end local ay=
Instance.new'CylinderHandleAdornment'ay.Name='Player_2D_HitboxVisual'ay.Adornee=
ax ay.Radius=ak ay.Height=ap ay.Color3=ai and am or al ay.Transparency=ai and ao
or an ay.ZIndex=5 ay.AlwaysOnTop=false ay.Visible=ah ay.Parent=ax au=ay return
ay end,function(ax)if not au or not au.Parent then return end au.Color3=ax and
am or al au.Transparency=ax and ao or an end local aB=function()local aB=ax()if
not aB or not aB.Parent then if au and au.Parent then au.Visible=false end if ai
then ai=false ar=nil as=nil for aC,aD in ipairs(aj)do pcall(aD,false,nil,nil)end
end return end local aC=az(aB)if aC and aC.Parent then aC.Visible=ah aC.Radius=
ak local aD=ay(aB)local aE=CFrame.new(Vector3.new(aB.Position.X,aD,aB.Position.Z
))*CFrame.Angles(math.rad(90),0,0)aC.CFrame=aB.CFrame:ToObjectSpace(aE)end local
aD=Vector3.new(aB.Position.X,0,aB.Position.Z)local aE,aF,aG=ac.
IsPointInAnyHazard(aD,nil,ak)local aH,aI=false if not aE and ad.
IsPointInAnyTrajectory then aH,aI=ad.IsPointInAnyTrajectory(aD,ak)end local aJ,
aK,aL=(aE or aH),aF or aI,aE and'Ground Zone'or(aH and'Trajectory Corridor'or
nil)if aJ~=ai or aK~=ar then ai=aJ ar=aK as=aL aA(aJ)for aM,aN in ipairs(aj)do
pcall(aN,aJ,aK,aL)end end end local aC=function()if not at then at=ae.Heartbeat:
Connect(aB)end end function ag.Cleanup()if at then at:Disconnect()at=nil end if
au then pcall(function()au:Destroy()end)au=nil end ai=false ar=nil as=nil end
function ag.IsPlayerInDanger()return ai,ar,as end function ag.GetCurrentThreat()
return ar,as end function ag.OnDangerStatusChanged(aD)if type(aD)=='function'
then table.insert(aj,aD)end end function ag.SetVisualEnabled(aD)ah=aD and true
or false if au then au.Visible=ah end end function ag.IsVisualEnabled()return ah
end function ag.SetRadius(aD)if type(aD)=='number'and aD>=0.1 then ak=aD if au
and au.Parent then au.Radius=ak end end end function ag.GetRadius()return ak end
local aD=function()local aD=af or aq.LocalPlayer if not aD then return end local
aE=function(aE)if au then pcall(function()au:Destroy()end)au=nil end task.spawn(
function()local aF=aE:WaitForChild('Humanoid',3)if aF then aF.Died:Connect(
function()if au then au.Visible=false end end)end end)end av=aD.CharacterAdded:
Connect(aE)if aD.Character then aE(aD.Character)end end aD()aC()ab.Register(
function()if av then av:Disconnect()av=nil end ag.Cleanup()end)return ag end
function a.p()local aa,ab,ac={},{},8 for ad=1,ac do local ae=(ad-1)*(2*math.pi/
ac)ab[ad]=Vector3.new(math.cos(ae),0,math.sin(ae))end local ad,ae={},16 for af=1
,ae do local ag=(af-1)*(2*math.pi/ae)ad[af]=Vector3.new(math.cos(ag),0,math.sin(
ag))end local af,ag={1.5,3,5,8,12,18,25},{1.5,3,4.5,6,8,10.5,13.5,17,21,26,32,40
}aa.COARSE_DIRECTIONS=ab aa.FINE_DIRECTIONS=ad aa.COARSE_RADII=af aa.FINE_RADII=
ag function aa.IsPathClear(ah,ai,aj,ak,al)if not aj then return true end al=al
or 2 local am=ai-ah local an=am.Magnitude if an<=al then return true end local
ao,ap,aq=am/an,math.floor(an/al),{}for ar=1,ap do local as=ah+ao*(ar*al)local at
,au=aj(as,0)if at and au then local av=ak and(ak[au]==true or(au.Instance and ak
[au.Instance]))if not av then return false else if aq[au]then return false end
end else if ak then for av,ax in pairs(ak)do aq[av]=true end end end end return
true end function aa.SamplePass(ah,ai,aj,ak,al,am,an,ao,ap,aq)local ar,as,at,au,
av=math.huge,Vector3.zero,false,ai if ao and ao.Magnitude>0.1 then local ax=
Vector3.new(ao.X,0,ao.Z).Unit au=table.clone(ai)table.sort(au,function(ay,az)
local aA,aB=ay.X*ax.X+ay.Z*ax.Z,az.X*ax.X+az.Z*ax.Z return aA>aB end)end for ax,
ay in ipairs(aj)do local az=false for aA,aB in ipairs(au)do local aC=ah+aB*ay
local aD=am(aC)if aD then local aE=aC if al and ak>0 then local aF=aC+aB*ak if
am(aF)then aE=aF end end local aF=aa.IsPathClear(ah,aE,ap,aq,2)if not aF then aD
=false else local aG=(aE-ah).Magnitude if aG<ar then ar=aG av=aE as=aB az=true
end end end if an then table.insert(an,{pos=aC,isSafe=aD,isChosen=false})end end
if az and av then at=true break end end return av,at,ar,as end return aa end
function a.q()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am=Color3.fromRGB(0,255,
120),Color3.fromRGB(0,255,150),Color3.fromRGB(255,255,255),Color3.fromRGB(0,235,
140),Color3.fromRGB(255,60,60),0.2,1.4,0.45,{},{}local an,ao=function(an)if not
an then return end if not ak or not ak.Parent then if ak then pcall(function()ak
:Destroy()end)end local ao=Instance.new'CylinderHandleAdornment'ao.Name=
'SafeSpot_OuterMarker'ao.Adornee=an ao.Radius=ag ao.Height=af ao.Color3=aa ao.
Transparency=0.35 ao.ZIndex=6 ao.AlwaysOnTop=false ao.Visible=false ao.Parent=an
ak=ao end if not al or not al.Parent then if al then pcall(function()al:Destroy(
)end)end local ao=Instance.new'CylinderHandleAdornment'ao.Name=
'SafeSpot_CenterDot'ao.Adornee=an ao.Radius=ah ao.Height=af+0.05 ao.Color3=ac ao
.Transparency=0.15 ao.ZIndex=7 ao.AlwaysOnTop=false ao.Visible=false ao.Parent=
an al=ao end if not am or not am.Parent then if am then pcall(function()am:
Destroy()end)end local ao=Instance.new'LineHandleAdornment'ao.Name=
'SafeSpot_EscapeLine'ao.Adornee=an ao.Color3=ab ao.Thickness=3.5 ao.Transparency
=0.2 ao.ZIndex=6 ao.AlwaysOnTop=false ao.Visible=false ao.Parent=an am=ao end
end,function(an,ao)local ap=aj[an]if not ap then local aq=Instance.new
'CylinderHandleAdornment'aq.Name='SafeSpot_CandidateDot_'..an aq.Adornee=ao aq.
Radius=0.25 aq.Height=af aq.ZIndex=4 aq.AlwaysOnTop=false aq.Visible=false aq.
Parent=ao local ar=Instance.new'LineHandleAdornment'ar.Name=
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
PointToObjectSpace(at)for av,ax in ipairs(ar)do local ay,az=ao(av,ap),Vector3.
new(ax.pos.X,aq+0.05,ax.pos.Z)local aA,aB,aC=ap.CFrame:PointToObjectSpace(az),ax
.isSafe and ad or ae,ax.isSafe and 0.35 or 0.55 if ay.dot and ay.dot.Parent then
local aD=CFrame.new(az)*CFrame.Angles(math.rad(90),0,0)ay.dot.CFrame=ap.CFrame:
ToObjectSpace(aD)ay.dot.Color3=aB ay.dot.Transparency=aC ay.dot.Radius=ax.isSafe
and 0.3 or 0.2 ay.dot.Visible=true end if ay.line and ay.line.Parent then local
aD=aA-au local aE=aD.Magnitude if aE>0.2 then ay.line.CFrame=CFrame.lookAt(au,aA
)ay.line.Length=aE ay.line.Color3=aB ay.line.Transparency=aC+0.15 ay.line.
Thickness=ax.isSafe and 1.4 or 0.9 ay.line.Visible=true else ay.line.Visible=
false end end end for av=#ar+1,#aj do local ax=aj[av]if ax.dot and ax.dot.Parent
then ax.dot.Visible=false end if ax.line and ax.line.Parent then ax.line.Visible
=false end end end function ai.Update(aq,ar,as,at,au,av)if not aq or not aq.
Parent or not au or not ar then ai.Hide()return end an(aq)local ax=Vector3.new(
ar.X,as,ar.Z)if ak and ak.Parent then local ay=CFrame.new(ax)*CFrame.Angles(math
.rad(90),0,0)ak.CFrame=aq.CFrame:ToObjectSpace(ay)ak.Visible=true end if al and
al.Parent then local ay=CFrame.new(ax)*CFrame.Angles(math.rad(90),0,0)al.CFrame=
aq.CFrame:ToObjectSpace(ay)al.Visible=true end if am and am.Parent then local ay
,az=Vector3.new(aq.Position.X,as+0.1,aq.Position.Z),Vector3.new(ar.X,as+0.1,ar.Z
)local aA,aB=aq.CFrame:PointToObjectSpace(ay),aq.CFrame:PointToObjectSpace(az)
local aC=aB-aA local aD=aC.Magnitude if aD>0.3 then am.CFrame=CFrame.new(aA)am.
Length=aD am.CFrame=CFrame.lookAt(aA,aB)am.Visible=true else am.Visible=false
end end ap(aq,as,at,av)end function ai.Cleanup()if ak then pcall(function()ak:
Destroy()end)ak=nil end if al then pcall(function()al:Destroy()end)al=nil end if
am then pcall(function()am:Destroy()end)am=nil end for aq,ar in ipairs(aj)do if
ar.dot then pcall(function()ar.dot:Destroy()end)end if ar.line then pcall(
function()ar.line:Destroy()end)end end table.clear(aj)end return ai end function
a.r()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'a',a.load'd',a.load'f',{},{Mob={Min
=15,Max=35,BossArea=false,BossAreaRadius=80},Boss1={Min=25,Max=50,BossArea=false
,BossAreaRadius=80},Boss2={Min=25,Max=50,BossArea=false,BossAreaRadius=80},Boss3
={Min=25,Max=50,BossArea=false,BossAreaRadius=80}},{Normal='Mob',['Boss 1']=
'Boss1',['Boss 2']='Boss2',['Boss 3']='Boss3'},{Mob='Normal',Boss1='Boss 1',
Boss2='Boss 2',Boss3='Boss 3'},{},{}function ad.GetTargetDisplay(aj)return ag[aj
]or'Normal'end function ad.GetTargetKey(aj)return af[aj]or'Mob'end function ad.
GetTargetOptions()return{'Normal','Boss 1','Boss 2','Boss 3'}end function ad.
GetSaveData()return ah end function ad.LoadData(aj)if type(aj)=='table'then ah=
aj else ah={}end aa.contextData=ah for ak,al in ipairs(ai)do pcall(al)end end
function ad.OnDataChanged(aj)if type(aj)~='function'then return function()end
end table.insert(ai,aj)return function()for ak,al in ipairs(ai)do if al==aj then
table.remove(ai,ak)break end end end end local aj=function()aa.contextData=ah ab
.Save()end function ad.GetCombatDistances(ak,al)local am=al or'Mob'local an=ae[
am]or ae.Mob if type(ak)=='string'and#ak>0 and ah[ak]and ah[ak][am]then local ao
=ah[ak][am]local ap,aq=(type(ao.Min)=='number'and ao.Min>0)and ao.Min or an.Min,
(type(ao.Max)=='number'and ao.Max>0)and ao.Max or an.Max return ap,aq end return
an.Min,an.Max end function ad.GetActiveCombatDistances(ak)local al,am,an=ac.
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
SetBossSpawnPosition(aq)end end return ao,ap,aq end function ad.
SetMinCombatDistance(ak,al,am)if not(type(ak)=='string'and#ak>0)then return end
local an=al or'Mob'if type(am)~='number'or am<=0 then return end ah[ak]=ah[ak]or
{}ah[ak][an]=ah[ak][an]or{}local ao=ah[ak][an].Max or(ae[an]or ae.Mob).Max ah[ak
][an].Min=am if am>ao then ah[ak][an].Max=am+5 end aj()end function ad.
SetMaxCombatDistance(ak,al,am)if not(type(ak)=='string'and#ak>0)then return end
local an=al or'Mob'if type(am)~='number'or am<=0 then return end ah[ak]=ah[ak]or
{}ah[ak][an]=ah[ak][an]or{}local ao=ah[ak][an].Min or(ae[an]or ae.Mob).Min ah[ak
][an].Max=am if am<ao then ah[ak][an].Min=math.max(1,am-5)end aj()end function
ad.ResetTarget(ak,al)if not(type(ak)=='string'and#ak>0)then return end local am=
al or'Mob'if ah[ak]then ah[ak][am]=nil if next(ah[ak])==nil then ah[ak]=nil end
aj()end end function ad.ResetDungeon(ak)if not(type(ak)=='string'and#ak>0)then
return end if ah[ak]then ah[ak]=nil aj()end end return ad end function a.s()
local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'e',a.load'f',a.load'b',a.load'j',a.load
'l',a.load'o',a.load'p',a.load'q',a.load'r'local aj,ak,al,am,an,ao,ap,aq,ar,as,
at,au,av,ax,ay,az,aA,aB=aa.RunService or game:GetService'RunService',game:
GetService'Players',aa.player,{},true,true,true,2,0,false,{},{},0 local aC,aD,aE
=function()local aC=al or ak.LocalPlayer if not aC then return nil end local aD=
aC.Character if not aD or not aD.Parent then return nil end local aE=aD:
FindFirstChildOfClass'Humanoid'if aE and aE.Health<=0 then return nil end return
aD:FindFirstChild'HumanoidRootPart'or aD.PrimaryPart end,function(aC)local aD=al
or ak.LocalPlayer if not aD then return nil end local aE=aD.Character if not aE
or not aE.Parent then return nil end local aF=aE:FindFirstChildOfClass'Humanoid'
if aF and aF.Health>0 then local aG=aF.MoveDirection if aG and aG.Magnitude>0.1
then return Vector3.new(aG.X,0,aG.Z).Unit end end if aC and aC.Parent then local
aG=Vector3.zero pcall(function()aG=aC.AssemblyLinearVelocity or aC.Velocity or
Vector3.zero end)local aH=Vector3.new(aG.X,0,aG.Z)if aH.Magnitude>=2 then return
aH.Unit end end return nil end,function(aC)if not aC then return 0 end return aC
.Position.Y-2.5 end function am.IsPointSafe(aF,aG)if not aF then return false
end local aH,aI,aJ,aK=Vector3.new(aF.X,0,aF.Z),ai.GetActiveBossArea()if aI and
aK and aJ and aJ>0 then local aL=Vector3.new(aK.X,0,aK.Z)if(aH-aL).Magnitude>aJ
then return false end end local aL=(af.GetRadius and af.GetRadius()or 1.8)+(aG
or 0)if ad.IsPointInAnyHazard and ad.IsPointInAnyHazard(aH,nil,aL)then return
false end if ae.IsPointInAnyTrajectory and ae.IsPointInAnyTrajectory(aH,aL)then
return false end return true end function am.IsPathSafe(aF,aG,aH)if not aF or
not aG then return false end local aI,aJ=Vector3.new(aF.X,0,aF.Z),Vector3.new(aG
.X,0,aG.Z)local aK=aJ-aI local aL=aK.Magnitude if aL<=2 then return true end
local aM,aN=aK/aL,2 local aO,aP=math.floor(aL/aN),(af.GetRadius and af.
GetRadius()or 1.8)+(aH or 0)local aQ,aR=ad.GetRedHazardsAtPoint and ad.
GetRedHazardsAtPoint(aI,aP)or{},{}for aS=1,aO do local aT=aI+aM*(aS*aN)local aU,
aV=ad.IsPointInAnyRedHazard(aT,nil,aP)if aU and aV then local aW=aQ[aV]==true or
(aV.Instance and aQ[aV.Instance])if not aW then return false else if aR[aV]then
return false end end else for aW,aX in pairs(aQ)do aR[aW]=true end end end
return true end function am.FindNearestSafeSpot(aF)local aG=aC()if not aF then
if not aG then return nil,false,0,Vector3.zero end aF=aG.Position end local aH,
aI=Vector3.new(aF.X,0,aF.Z),aD(aG)table.clear(au)local aJ,aK,aL=ai.
GetActiveBossArea()local aM,aN,aO,aP=(aJ and aL and aK and aK>0)and Vector3.new(
aL.X,0,aL.Z)or nil,ad.GetNearbyHazards and ad.GetNearbyHazards(aH,65)or nil,ae.
GetNearbyTrajectories and ae.GetNearbyTrajectories(aH,65)or nil,af.GetRadius and
af.GetRadius()or 1.8 local aQ,aR,aS=ad.GetRedHazardsAtPoint and ad.
GetRedHazardsAtPoint(aH,aP,aN)or{},function(aQ,aR)if not aQ then return false
end local aS=Vector3.new(aQ.X,0,aQ.Z)if aM and aK then local aT=(aS-aM).
Magnitude if aT>aK then return false end end local aT=(af.GetRadius and af.
GetRadius()or 1.8)+(aR or 0)if ad.IsPointInAnyHazard and ad.IsPointInAnyHazard(
aS,nil,aT,aN)then return false end if ae.IsPointInAnyTrajectory and ae.
IsPointInAnyTrajectory(aS,aT,aO)then return false end return true end,function(
aQ,aR)if not aQ then return false,nil,nil end local aS,aT=Vector3.new(aQ.X,0,aQ.
Z),(af.GetRadius and af.GetRadius()or 1.8)+(aR or 0)if ad.IsPointInAnyHazard
then local aU,aV,aW=ad.IsPointInAnyHazard(aS,nil,aT,aN,true)return aU,aV,aW end
return false,nil,nil end if(aN and#aN==0 and aO and#aO==0 and not aM)or aR(aH,0)
then table.insert(au,{pos=aH,isSafe=true,isChosen=true})return aH,true,0,Vector3
.zero end local aT,aU=aI,af.GetRadius and af.GetRadius()or 1.8 local aV,aW,aX,aY
=ae.IsPointInAnyTrajectory(aH,aU,aO)if aV and aX and aY then local aZ,a_,a0=
Vector3.new(-aX.Z,0,aX.X),Vector3.new(aX.Z,0,-aX.X),aH-aY local a1=a0.X*aZ.X+a0.
Z*aZ.Z local a2=a1>=0 and aZ or a_ if aI and aI.Magnitude>0.1 then local a3,a4=
aI.X*aZ.X+aI.Z*aZ.Z,aI.X*a_.X+aI.Z*a_.Z if a3>a4+0.3 then a2=aZ elseif a4>a3+0.3
then a2=a_ end end local a3=0.45 if aI and aI.Magnitude>0.1 then local a4,a5=-(
aI.X*aX.X+aI.Z*aX.Z),math.abs(aI.X*a2.X+aI.Z*a2.Z)if a5>0.05 then local a6=a4/a5
a3=math.clamp(a6,0.18,1)elseif a4>0 then a3=1 else a3=0.18 end end local a4=(a2-
a3*aX).Unit aT=a4 elseif aM and(aH-aM).Magnitude>aK then aT=(aM-aH).Unit end
local aZ,a_,a0,a1=ag.SamplePass(aH,ag.COARSE_DIRECTIONS,ag.COARSE_RADII,aq,true,
aR,au,aT,aS,aQ)if not a_ then aZ,a_,a0,a1=ag.SamplePass(aH,ag.FINE_DIRECTIONS,ag
.FINE_RADII,aq,true,aR,au,aT,aS,aQ)end if not a_ then aZ,a_,a0,a1=ag.SamplePass(
aH,ag.FINE_DIRECTIONS,ag.FINE_RADII,0,false,aR,au,aT,aS,aQ)end if a_ and aZ then
for a2,a3 in ipairs(au)do if(a3.pos-aZ).Magnitude<0.25 then a3.isChosen=true
break end end return aZ,true,a0,a1 end return aH,false,math.huge,Vector3.zero
end local aF=function()if not an then ah.Hide()return end local aF=aC()if not aF
or not aF.Parent then ah.Hide()return end local aG,aH,aI=false if af.
IsPlayerInDanger then aG,aH,aI=af.IsPlayerInDanger()end local aJ=aG or(ax~=nil)
or as if not aJ then local aK=os.clock()if aK-av<0.05 then return end av=aK end
local aK,aL=aE(aF),Vector3.new(aF.Position.X,0,aF.Position.Z)if aG then local aM
,aN,aO,aP=ax and(ax-aL).Magnitude or 0,ax and am.IsPointSafe(ax),ax and am.
IsPathSafe(aL,ax),(aH==ay and aI==az)if not aN or not aO or not aP or not ax
then local aQ,aR,aS,aT=am.FindNearestSafeSpot(aF.Position)if aR and aQ then ax=
aQ ay=aH az=aI ar=aS as=true ah.Update(aF,aQ,aK,au,ao,ap)for aU,aV in ipairs(at)
do pcall(aV,true,aQ,aS)end else ah.Hide()end else ar=aM ah.Update(aF,ax,aK,au,ao
,ap)for aQ,aR in ipairs(at)do pcall(aR,true,ax,aM)end end else local aM,aN,aO=ax
and(ax-aL).Magnitude or 0,ax and am.IsPointSafe(ax),ax and am.IsPathSafe(aL,ax)
if aN and aO and aM>0.8 then ar=aM ah.Update(aF,ax,aK,au,ao,ap)for aP,aQ in
ipairs(at)do pcall(aQ,true,ax,aM)end else if as or ax then as=false ax=nil ay=
nil az=nil ar=0 ah.Hide()for aP,aQ in ipairs(at)do pcall(aQ,false,nil,0)end end
end end end local aG=function()if not aA then aA=aj.Heartbeat:Connect(aF)end if
not aB and af.OnDangerStatusChanged then aB=af.OnDangerStatusChanged(function(aG
)if aG and an then aF()end end)end end function am.Clear()if as or ax then as=
false ax=nil ay=nil az=nil ar=0 table.clear(au)ah.Hide()for aH,aI in ipairs(at)
do pcall(aI,false,nil,0)end end end function am.Cleanup()if aA then aA:
Disconnect()aA=nil end ah.Cleanup()table.clear(au)ax=nil ay=nil az=nil ar=0 as=
false av=0 end function am.GetLastSafeSpot()return ax,ar,as end function am.
OnSafeSpotChanged(aH)if type(aH)=='function'then table.insert(at,aH)end end
function am.SetVisualEnabled(aH)ao=aH and true or false if not ao then ah.Hide()
end end function am.IsVisualEnabled()return ao end function am.SetShowCandidates
(aH)ap=aH and true or false if not ap then ah.HideCandidates()end end function
am.IsShowCandidates()return ap end function am.SetEnabled(aH)an=aH and true or
false if not an then ah.Hide()end end function am.IsEnabled()return an end
function am.SetSafetyBuffer(aH)if type(aH)=='number'and aH>=0 then aq=aH end end
function am.GetSafetyBuffer()return aq end local aH=function()local aH=al or ak.
LocalPlayer if not aH then return end aH.CharacterAdded:Connect(function()am.
Clear()end)end aH()if ab.OnRoomIndexChanged then ab.OnRoomIndexChanged(function(
)am.Clear()end)end if ab.OnEnemyChanged then ab.OnEnemyChanged(function()if ab.
GetEnemyCount and ab.GetEnemyCount()==0 then am.Clear()end end)end if ab.
OnLobbyChanged then ab.OnLobbyChanged(function()am.Clear()end)end if ab.
OnBossActiveChanged then ab.OnBossActiveChanged(function()am.Clear()end)end aG()
ac.Register(function()am.Cleanup()end)return am end function a.t()local aa,ab,ac
,ad,ae=a.load'e',a.load'f',a.load'b',a.load'o',a.load's'local af,ag,ah,ai,aj,ak,
al,am,an,ao=aa.RunService or game:GetService'RunService',game:GetService
'Players',aa.player,{},false,2,false,{}local ap,aq=function()local ap=ah or ag.
LocalPlayer if not ap then return nil,nil,nil end local aq=ap.Character if not
aq or not aq.Parent then return nil,nil,nil end local ar=aq:
FindFirstChildOfClass'Humanoid'if ar and ar.Health<=0 then return nil,nil,nil
end local as=aq:FindFirstChild'HumanoidRootPart'or aq.PrimaryPart if not as then
return nil,nil,nil end return aq,ar,as end,function(ap,aq)if ap and aq and aq.
Parent then pcall(function()ap:MoveTo(aq.Position)end)end end local ar=function(
)if not aj then if al or an then an=nil al=false local ar,as,at=ap()aq(as,at)for
au,av in ipairs(am)do pcall(av,false,nil,0)end end return end local ar,as,at=ap(
)if not ar or not as or not at then if al or an then an=nil al=false for au,av
in ipairs(am)do pcall(av,false,nil,0)end end return end if ab.IsInvulnerable and
ab.IsInvulnerable()then if al or an then an=nil al=false local au,av,ax=ap()aq(
av,ax)for ay,az in ipairs(am)do pcall(az,false,nil,0)end end return end local au
,av,ax,ay=ad.IsPlayerInDanger and ad.IsPlayerInDanger(),ae.GetLastSafeSpot()if
av then an=av end local az=an and ae.IsPointSafe and ae.IsPointSafe(an)if an and
az then local aA=at.Position local aB=Vector3.new(an.X-aA.X,0,an.Z-aA.Z)local aC
=aB.Magnitude if aC<=ak then local aD,aE=at.CFrame,Vector3.new(an.X,aA.Y,an.Z)
local aF=CFrame.new(aE)*(aD-aD.Position)ar:PivotTo(aF)aq(as,at)local aG=an an=
nil if al then al=false for aH,aI in ipairs(am)do pcall(aI,false,aG,aC)end end
else local aD=Vector3.new(an.X,aA.Y,an.Z)as:MoveTo(aD)if not al then al=true for
aE,aF in ipairs(am)do pcall(aF,true,an,aC)end end end else if al or an then an=
nil al=false aq(as,at)for aA,aB in ipairs(am)do pcall(aB,false,nil,0)end end end
end local as=function()if not ao then ao=af.Heartbeat:Connect(ar)end end
function ai.Clear()if al or an then an=nil al=false local at,au,av=ap()aq(au,av)
for ax,ay in ipairs(am)do pcall(ay,false,nil,0)end end end function ai.Cleanup()
if ao then ao:Disconnect()ao=nil end ai.Clear()end function ai.SetEnabled(at)aj=
at and true or false if not aj then local au,av,ax=ap()aq(av,ax)an=nil al=false
end end function ai.IsEnabled()return aj end function ai.SetSnapDistance(at)if
type(at)=='number'and at>=0.5 then ak=at end end function ai.GetSnapDistance()
return ak end function ai.IsDodging()return al end function ai.
OnDodgeStateChanged(at)if type(at)=='function'then table.insert(am,at)end end if
ab.OnRoomIndexChanged then ab.OnRoomIndexChanged(function()ai.Clear()end)end if
ab.OnEnemyChanged then ab.OnEnemyChanged(function()if ab.GetEnemyCount and ab.
GetEnemyCount()==0 then ai.Clear()end end)end if ab.OnLobbyChanged then ab.
OnLobbyChanged(function()ai.Clear()end)end if ab.OnBossActiveChanged then ab.
OnBossActiveChanged(function()ai.Clear()end)end as()ac.Register(function()ai.
Cleanup()end)return ai end function a.u()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.
load'b',a.load'n',a.load'j',a.load'k',a.load'l',a.load'o',a.load's',a.load't',a.
load'm',{}ac.BindDetection(ab)ad.BindDetection(ab)ae.BindDetection(ab)ai.
BindDetection(ab)aj.IsPointInAnyHazard=ac.IsPointInAnyHazard aj.GetHazardPadding
=ac.GetHazardPadding aj.SetHazardPadding=ac.SetHazardPadding aj.GetHitboxPadding
=ac.GetHazardPadding aj.SetHitboxPadding=ac.SetHazardPadding aj.
GetTrajectoryMargin=ac.GetTrajectoryMargin aj.SetTrajectoryMargin=ac.
SetTrajectoryMargin aj.GetHazardZones=ac.GetHazardZones aj.GetNearbyHazards=ac.
GetNearbyHazards aj.AddForceCircleName=ac.AddForceCircleName aj.
GetForceCircleNames=ac.GetForceCircleNames aj.IsForceCircle=ac.IsForceCircle aj.
IsPlayerInDanger=af.IsPlayerInDanger aj.GetPlayerThreat=af.GetCurrentThreat aj.
OnPlayerDangerChanged=af.OnDangerStatusChanged aj.SetPlayerVisualEnabled=af.
SetVisualEnabled aj.IsPlayerVisualEnabled=af.IsVisualEnabled aj.
SetPlayerHitboxRadius=af.SetRadius aj.GetPlayerHitboxRadius=af.GetRadius aj.
FindNearestSafeSpot=ag.FindNearestSafeSpot aj.IsPointSafe=ag.IsPointSafe aj.
GetLastSafeSpot=ag.GetLastSafeSpot aj.OnSafeSpotChanged=ag.OnSafeSpotChanged aj.
SetSafeSpotVisualEnabled=ag.SetVisualEnabled aj.IsSafeSpotVisualEnabled=ag.
IsVisualEnabled aj.SetSafeSpotEnabled=ag.SetEnabled aj.IsSafeSpotEnabled=ag.
IsEnabled aj.SetSafeSpotBuffer=ag.SetSafetyBuffer aj.GetSafeSpotBuffer=ag.
GetSafetyBuffer aj.SetShowCandidates=ag.SetShowCandidates aj.IsShowCandidates=ag
.IsShowCandidates aj.ClearSafeSpot=ag.Clear aj.SetAutoDodgeEnabled=ah.SetEnabled
aj.IsAutoDodgeEnabled=ah.IsEnabled aj.SetDodgeSnapDistance=ah.SetSnapDistance aj
.GetDodgeSnapDistance=ah.GetSnapDistance aj.IsCurrentlyDodging=ah.IsDodging aj.
OnDodgeStateChanged=ah.OnDodgeStateChanged aj.ClearDodge=ah.Clear aj.
SetVisualizerEnabled=ad.SetEnabled aj.IsVisualizerEnabled=ad.IsEnabled aj.
RefreshVisuals=ad.RefreshAll aj.SetTrajectoryEnabled=ae.SetEnabled aj.
IsTrajectoryEnabled=ae.IsEnabled aj.SetTrajectoryLength=ae.SetPredictionLength
aj.GetTrajectoryLength=ae.GetPredictionLength aj.RefreshTrajectory=ae.RefreshAll
aj.IsPointInAnyTrajectory=ae.IsPointInAnyTrajectory aj.GetNearbyTrajectories=ae.
GetNearbyTrajectories aj.SetSelectionBoxesEnabled=ab.SetSelectionBoxesEnabled aj
.IsSelectionBoxesEnabled=ab.IsSelectionBoxesEnabled aj.SetTimerVisualEnabled=ai.
SetEnabled aj.IsTimerVisualEnabled=ai.IsEnabled aj.RefreshTimerVisuals=ai.
RefreshAll aj.StartDetection=ab.StartScan aj.StopDetection=ab.StopScan aj.
IsDetectionEnabled=ab.IsEnabled aj.SetDetectionEnabled=ab.SetEnabled aj.
SetLogHazards=ab.SetLogHazards aj.IsLogHazardsEnabled=ab.IsLogHazardsEnabled aj.
SetLogThreats=aj.SetLogHazards aj.IsLogThreatsEnabled=aj.IsLogHazardsEnabled aj.
SetLogFailed=ab.SetLogFailed aj.IsLogFailedEnabled=ab.IsLogFailedEnabled aj.
SetInspectTarget=ab.SetInspectTarget aj.GetInspectTarget=ab.GetInspectTarget aj.
SetInspectEnabled=ab.SetInspectEnabled aj.IsInspectEnabled=ab.IsInspectEnabled
aj.GetHazardCount=ab.GetHazardCount aj.GetActiveHazards=ab.GetActiveHazards aj.
GetLastHazardInfo=ab.GetLastHazardInfo aj.OnHazardChanged=ab.OnHazardChanged
function aj.StartScan()ab.StartScan()end function aj.StopScan()ab.StopScan()end
function aj.Toggle(ak)if ak then aj.StartScan()else aj.StopScan()end end
function aj.IsEnabled()return ab.IsEnabled()end aa.Register(function()ab.
StopScan()end)return aj end function a.v()local aa,ab,ac,ad=a.load'd',a.load'u',
a.load'f',a.load'g'return function(ae,af)local ag=af:Section{Side='Left'}ag:
Header{Name='Hazard Scanner Controls'}local ah=af:Section{Side='Right'}ah:Header
{Name='Real-time Hazard Monitor'}local ai,aj,ak,al,am,an=ah:Label{Text=
"Detector: <font color='rgb(255,80,80)'>Disabled</font>"},ah:Label{Text=
"Player: <font color='rgb(0,255,170)'>SAFE</font>"},ah:Label{Text=
[[Safe Spot: <font color='rgb(160,160,160)'>None Needed</font>]]},ah:Label{Text=
"Auto Dodge: <font color='rgb(160,160,160)'>Idle</font>"},ah:Label{Text=
"Active Hazards: <font color='rgb(160,160,160)'>0</font>"},ah:Label{Text=
"Last Detected: <font color='rgb(160,160,160)'>None</font>"}local ao=function(ao
,ap,aq)if ao then local ar,as=ap and ap.Name or'Unknown Threat',aq and(' ['..aq
..']')or''pcall(function()aj:UpdateName((
[[Player: <font color='rgb(255,50,50)'><b>DANGER</b></font> (%s%s)]]):format(ar,
as))end)else pcall(function()aj:UpdateName
"Player: <font color='rgb(0,255,170)'><b>SAFE</b></font>"end)end end ab.
OnPlayerDangerChanged(function(ap,aq,ar)ao(ap,aq,ar)end)ab.OnSafeSpotChanged(
function(ap,aq,ar)if ap and aq then pcall(function()ak:UpdateName((
[[Safe Spot: <font color='rgb(0,255,120)'><b>Found (%.1f studs)</b></font>]]):
format(ar))end)else pcall(function()ak:UpdateName
[[Safe Spot: <font color='rgb(160,160,160)'>None Needed</font>]]end)end end)ab.
OnDodgeStateChanged(function(ap,aq,ar)if ap and aq then pcall(function()al:
UpdateName((
[[Auto Dodge: <font color='rgb(0,255,200)'><b>Dodging (%.1f studs)</b></font>]])
:format(ar))end)else pcall(function()al:UpdateName
"Auto Dodge: <font color='rgb(160,160,160)'>Idle</font>"end)end end)local ap=
function(ap,aq)ap=ap or ab.GetHazardCount()aq=aq or ab.GetLastHazardInfo()local
ar=ab.IsEnabled()local as,at=ar and'0, 255, 0'or'255, 80, 80',ar and
'Active (Scanning & SelectionBox)'or'Disabled'pcall(function()ai:UpdateName(
"Detector: <font color='rgb("..as..")'>"..at..'</font>')end)local au=ap>0 and
'255, 60, 60'or'0, 255, 0'pcall(function()am:UpdateName(
"Active Hazards: <font color='rgb("..au..")'>"..tostring(ap)..'</font>')end)if
aq then pcall(function()an:UpdateName((
[[Last Detected: <font color='rgb(255,220,120)'>%s</font> (%s, %d studs)]]):
format(aq.Name,aq.Class,aq.Distance))end)else pcall(function()an:UpdateName
"Last Detected: <font color='rgb(160,160,160)'>None</font>"end)end end ah:Header
{Name='Specific Skill Inspector'}ah:Toggle({Name='Enable Deep Inspector',Default
=ab.IsInspectEnabled(),Callback=aa.Wrap(function(aq)ab.SetInspectEnabled(aq)end)
},'Toggle_HazardDeepInspector')ah:Input{Name='Target Skill Name',Placeholder=
'e.g. Meteor, Spike, Flame...',AcceptedCharacters='All',Default=ab.
GetInspectTarget(),Callback=aa.Wrap(function(aq)ab.SetInspectTarget(aq)end)}ab.
OnHazardChanged(function(aq,ar)ap(aq,ar)end)ag:Toggle({Name=
'Enable Hazard Scanner',Default=ab.IsEnabled(),Callback=aa.Wrap(function(aq)ab.
Toggle(aq)ap()end)},'Toggle_SmartDodgeThreatDetection')ag:Toggle({Name=
'Show Player 2D Hitbox (Ground Visual)',Default=ab.IsPlayerVisualEnabled(),
Callback=aa.Wrap(function(aq)ab.SetPlayerVisualEnabled(aq)end)},
'Toggle_HazardPlayer2DVisual')ad.PatchSliderLoadCallback(ag:Slider({Name=
'Player 2D Hitbox Radius (studs)',Default=ab.GetPlayerHitboxRadius(),Minimum=0.5
,Maximum=8,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(aq)ab.
SetPlayerHitboxRadius(aq)end)},'Slider_HazardPlayer2DHitboxRadius'))ag:Toggle({
Name='Show 3D Selection Boxes (Parts)',Default=ab.IsSelectionBoxesEnabled(),
Callback=aa.Wrap(function(aq)ab.SetSelectionBoxesEnabled(aq)end)},
'Toggle_HazardSelectionBoxes')ag:Toggle({Name=
'Show Lifespan Timer (3D Duration)',Default=ab.IsTimerVisualEnabled(),Callback=
aa.Wrap(function(aq)ab.SetTimerVisualEnabled(aq)end)},
'Toggle_HazardLifespanTimer')ag:Toggle({Name=
'Show Danger Zones (Ground Visualizer)',Default=ab.IsVisualizerEnabled(),
Callback=aa.Wrap(function(aq)ab.SetVisualizerEnabled(aq)end)},
'Toggle_HazardGroundVisualizer')ag:Toggle({Name='Show Trajectory Paths (Orange)'
,Default=ab.IsTrajectoryEnabled(),Callback=aa.Wrap(function(aq)ab.
SetTrajectoryEnabled(aq)end)},'Toggle_HazardTrajectoryVisualizer')ag:Toggle({
Name='Show Safe Spot Marker (Green Visual)',Default=ab.IsSafeSpotVisualEnabled()
,Callback=aa.Wrap(function(aq)ab.SetSafeSpotVisualEnabled(aq)end)},
'Toggle_HazardSafeSpotVisual')ag:Toggle({Name=
'Show Candidate Points & Rays (Scan Grid)',Default=ab.IsShowCandidates(),
Callback=aa.Wrap(function(aq)ab.SetShowCandidates(aq)end)},
'Toggle_HazardShowCandidates')ad.PatchSliderLoadCallback(ag:Slider({Name=
'Safe Spot Safety Margin (studs)',Default=ab.GetSafeSpotBuffer(),Minimum=0,
Maximum=6,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(aq)ab.
SetSafeSpotBuffer(aq)end)},'Slider_HazardSafeSpotBuffer'))ag:Toggle({Name=
'Enable Auto Dodge (Move + Snap)',Default=ab.IsAutoDodgeEnabled(),Callback=aa.
Wrap(function(aq)ab.SetAutoDodgeEnabled(aq)end)},'Toggle_HazardAutoDodgeEnabled'
)ad.PatchSliderLoadCallback(ag:Slider({Name='Dodge Snap Distance (studs)',
Default=ab.GetDodgeSnapDistance(),Minimum=0.5,Maximum=5,DisplayMethod='Value',
Precision=1,Callback=aa.Wrap(function(aq)ab.SetDodgeSnapDistance(aq)end)},
'Slider_HazardDodgeSnapDistance'))ad.PatchSliderLoadCallback(ag:Slider({Name=
'Respawn Invulnerability Time (s)',Default=ac.GetRespawnProtectionDuration(),
Minimum=0.5,Maximum=10,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(
function(aq)ac.SetRespawnProtectionDuration(aq)end)},
'Slider_HazardRespawnInvulnerabilityTime'))ad.PatchSliderLoadCallback(ag:Slider(
{Name='Trajectory Length (studs)',Default=ab.GetTrajectoryLength(),Minimum=10,
Maximum=150,DisplayMethod='Value',Precision=0,Callback=aa.Wrap(function(aq)ab.
SetTrajectoryLength(aq)end)},'Slider_HazardTrajectoryLength'))ag:Toggle({Name=
'Log Hazards (Spawns / Despawns)',Default=ab.IsLogHazardsEnabled(),Callback=aa.
Wrap(function(aq)ab.SetLogHazards(aq)end)},'Toggle_SmartDodgeLogHazards')ag:
Toggle({Name='Log Rejected (Kh\u{f4}ng v\u{1ebd} \u{111}\u{1b0}\u{1ee3}c)',
Default=ab.IsLogFailedEnabled(),Callback=aa.Wrap(function(aq)ab.SetLogFailed(aq)
end)},'Toggle_SmartDodgeLogRejected')ad.PatchSliderLoadCallback(ag:Slider({Name=
'Blue Danger Zone Margin (studs)',Default=ab.GetTrajectoryMargin(),Minimum=0,
Maximum=10,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(aq)ab.
SetTrajectoryMargin(aq)end)},'Slider_HazardTrajectoryMargin'))ag:Button{Name=
'Clear Console',Callback=function()pcall(function()if rconsoleclear then
rconsoleclear()end end)end}ap()end end function a.w()local aa,ab,ac={},{},false
function aa.SetLocked(ad)ac=ad and true or false end function aa.IsLocked()
return ac end function aa.Register(ad,ae,af)if type(ad)~='string'or type(ae)~=
'function'or type(af)~='function'then return end ab[ad]={setEnabled=ae,isEnabled
=af}end function aa.EnableExclusive(ad)if ac then return end for ae,af in pairs(
ab)do if ae~=ad and af.isEnabled()then pcall(af.setEnabled,false)end end end
function aa.IsEnabled(ad)local ae=ab[ad]return ae~=nil and ae.isEnabled()end
return aa end function a.x()local aa,ab=a.load'e',a.load'f'local ac,ad=aa.player
,{}function ad.Validate(ae)if not ae then return false end local af=ae.Model if
not af or not af.Parent or af==ac.Character then return false end local ag=ae.
Humanoid if not ag or not ag.Parent then ag=af:FindFirstChildOfClass'Humanoid'ae
.Humanoid=ag end if not ag or ag.Health<=0 then return false end local ah=ae.
Root if not ah or not ah.Parent then ah=af:FindFirstChild'HumanoidRootPart'or af
.PrimaryPart if not ah then for ai,aj in ipairs(af:GetDescendants())do if aj:IsA
'BasePart'then ah=aj break end end end if not ah then return false end ae.Root=
ah end return true end function ad.Scan()local ae,af={},ab.GetTrackedEnemyData()
for ag,ah in ipairs(af)do if ad.Validate(ah)then table.insert(ae,ah)end end
return ae end return ad end function a.y()local aa={}function aa.
SelectBestTarget(ab,ac,ad)local ae,af,ag=(math.huge)for ah,ai in ipairs(ac)do if
ad and ad()then return nil,nil,nil,nil,math.huge end local aj=ai.Root if aj and
aj.Parent then local ak=aj.Position local al,am=ak.X-ab.X,ak.Z-ab.Z local an=al*
al+am*am if an<ae then ae=an af=ai ag=ak end end end local ah=ae<math.huge and
math.sqrt(ae)or math.huge return af,nil,nil,ag,ah end return aa end function a.z
()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'y',a.load'x',{},{},1,6 function ac.
GetTarget()return ag end function ac.GetPathInstance()return ah end function ac.
GetWaypoints()return ad end function ac.GetWaypointIndex()return ae end function
ac.SetWaypointIndex(aj)ae=math.clamp(aj,1,math.max(1,#ad))end function ac.
AdvanceWaypointIndex(aj)if not ad or#ad==0 then return end local ak=ad[ae]if ak
then local al=Vector3.new(ak.Position.X-aj.X,0,ak.Position.Z-aj.Z).Magnitude if
al<=3.5 then ae=math.min(#ad+1,ae+1)end end end function ac.GetLastPathDestPos()
return ai end function ac.SetRepathThreshold(aj)if type(aj)=='number'and aj>0
then af=aj end end function ac.GetRepathThreshold()return af end function ac.
SetTarget(aj,ak,al,am)if ah and ah~=ak then pcall(function()ah:Destroy()end)end
ag=aj ah=ak ad=al or{}ae=1 ai=am end function ac.UpdatePath(aj,ak,al)if ah and
ah~=aj then pcall(function()ah:Destroy()end)end ah=aj ad=ak or{}ae=1 ai=al end
function ac.ClearTarget()if ah then pcall(function()ah:Destroy()end)end ag=nil
ah=nil ad={}ae=1 ai=nil end function ac.IsTargetValid()if not ag then return
false end return ab.Validate(ag)end function ac.NeedsRepath(aj)if not ah or not
ad or#ad==0 then return true end if not ai or not aj then return true end return
(aj-ai).Magnitude>af end function ac.Repath(aj,ak)if not ak then return false
end local al,am,an=aa.ComputePathWithCost(aj,ak)if al and#am>0 then if ah then
pcall(function()ah:Destroy()end)end ah=al ad=am ae=1 ai=ak return true end
return false end return ac end function a.A()local aa=a.load'e'local ab,ac=aa.
player,{}local ad=function(ad)local ae={}if ad then for af,ag in ipairs(ad)do if
ag and ag.Parent then table.insert(ae,ag)end end end if ab and ab.Character and
ab.Character.Parent then table.insert(ae,ab.Character)end local af=workspace:
FindFirstChild'RaycastIgnore'if af then table.insert(ae,af)end return ae end
function ac.CastRay(ae,af,ag)local ah=af-ae local ai=ah.Magnitude if ai<0.3 then
return false,nil,af end local aj=RaycastParams.new()aj.FilterType=Enum.
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
av,ax=ac.CheckClearance(aj,at,ai)if not au then al.chosenDest=as al.mode=
'Waypoint'al.nodeIdx=aq return as,'Waypoint',aq,al end end end al.mode='Blocked'
return nil,'Blocked',nil,al end function ac.ExecuteMove(ae,af,ag,ah,ai)if not ae
or not ag then return end ae:MoveTo(ag)local aj,ak=ag.Y-af.Y,Vector3.new(ag.X-af
.X,0,ag.Z-af.Z).Magnitude if aj>1.8 and ak<=7 then ae.Jump=true return end if ah
and#ah>0 then local al=math.clamp(ai or 1,1,#ah)for am=al,math.min(al+2,#ah)do
local an=ah[am]if an then local ao=Vector3.new(an.Position.X-af.X,0,an.Position.
Z-af.Z).Magnitude if ao<=5 then if an.Action==Enum.PathWaypointAction.Jump or(an
.Position.Y-af.Y)>1.8 then ae.Jump=true break end end end end end end return ac
end function a.B()local aa,ab,ac,ad=a.load'e',a.load'f',a.load'b',a.load'z'local
ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap=aa.RunService or game:GetService'RunService'
,aa.VirtualInputManager or game:GetService'VirtualInputManager',aa.player,{},
false,35,0.15,0,0,false,false function ah.IsEnabled()return ai end local aq,ar
function ah.SetEnabled(as)local at=as==true if at==ai then return end ai=at if
ai then aq()else ar()end end ah.IsSkillQEnabled=ah.IsEnabled ah.SetSkillQEnabled
=ah.SetEnabled ah.IsSkillEEnabled=ah.IsEnabled ah.SetSkillEEnabled=ah.SetEnabled
function ah.GetSkillERange()return aj end function ah.SetSkillERange(as)if type(
as)=='number'and as>=2 then aj=as end end function ah.GetSpamInterval()return ak
end function ah.SetSpamInterval(as)if type(as)=='number'and as>=0.05 then ak=as
end end function ah.IsBuffActive()local as,at=pcall(function()return workspace:
FindFirstChild'groundAura'end)return as and at~=nil end local as=function()local
as=ag or game:GetService'Players'.LocalPlayer local at=as and as.Character local
au=at and(at:FindFirstChild'HumanoidRootPart'or at.PrimaryPart)if au and au.
Parent then return au end return nil end local at=function()local at=as()if not
at then return nil,math.huge,false end local au,av=at.Position,ad.GetTarget and
ad.GetTarget()if av and av.Root and av.Root.Parent then local ax=av.Humanoid or(
av.Model and av.Model:FindFirstChildOfClass'Humanoid')if ax and ax.Health>0 then
local ay=av.Root.Position local az=Vector3.new(ay.X-au.X,0,ay.Z-au.Z).Magnitude
return av,az,true end end local ax,ay,az,aA=ab.GetTrackedEnemyData and ab.
GetTrackedEnemyData(),math.huge,false if ax and#ax>0 then for aB,aC in ipairs(ax
)do if aC and aC.Root and aC.Root.Parent then local aD=aC.Humanoid or(aC.Model
and aC.Model:FindFirstChildOfClass'Humanoid')if aD and aD.Health>0 then az=true
local aE=aC.Root.Position local aF,aG=aE.X-au.X,aE.Z-au.Z local aH=aF*aF+aG*aG
if aH<ay then ay=aH aA=aC end end end end end local aB=ay<math.huge and math.
sqrt(ay)or math.huge return aA,aB,az end function ah.CastSkillQ()if an then
return end an=true task.spawn(function()local au=(ab.GetKeyHoldTime and ab.
GetKeyHoldTime())or 0.05 pcall(function()af:SendKeyEvent(true,Enum.KeyCode.Q,
false,game)end)task.wait(au)pcall(function()af:SendKeyEvent(false,Enum.KeyCode.Q
,false,game)end)an=false end)end function ah.CastSkillE()if ao then return end
ao=true task.spawn(function()local au=(ab.GetKeyHoldTime and ab.GetKeyHoldTime()
)or 0.05 pcall(function()af:SendKeyEvent(true,Enum.KeyCode.E,false,game)end)task
.wait(au)pcall(function()af:SendKeyEvent(false,Enum.KeyCode.E,false,game)end)ao=
false end)end local au=function()if not ai or ab.IsInLobby()then return end
local au=as()if not au then return end local av=au.Parent local ax=av and av:
FindFirstChildOfClass'Humanoid'if ax and ax.Health<=0 then return end local ay,
az,aA=at()local aB=os.clock()if(aB-al>=ak)and not an then if aA then al=aB ah.
CastSkillQ()end end if(aB-am>=ak)and not ao then if ay and az<=aj then local aC=
ah.IsBuffActive()if aC then am=aB ah.CastSkillE()end end end end aq=function()if
not ap then ap=ae.Heartbeat:Connect(au)end end ar=function()if ap then ap:
Disconnect()ap=nil end an=false ao=false end function ah.Step(av,ax,ay)end ac.
Register(function()ah.SetEnabled(false)end)return ah end function a.C()local aa,
ab,ac,ad,ae,af,ag,ah,ai,aj,ak=a.load'e',a.load'f',a.load'b',a.load'w',a.load'x',
a.load'y',a.load'z',a.load'A',a.load'u',a.load'B',a.load'r'local al,am,an,ao,ap,
aq,ar,as,at,au,av,ax,ay,az,aA,aB,aC,aD=aa.RunService,aa.player,{NO_TARGET=
'NO_TARGET',ACQUIRING_TARGET='ACQUIRING_TARGET',TRACKING_TARGET=
'TRACKING_TARGET',CHASE='CHASE',HOLD='HOLD',KITE='KITE',BLOCKED='BLOCKED',
REPATHING='REPATHING'},{},false,false,1.5,15,35,25,50,true,6,true,true,true,true
,true local aE,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ,aR,aS,aT,aU,aV,aW,aX,aY,aZ,a_
,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,b,ba=an.NO_TARGET,'None',0,0,false,false,0,0,
false,10,false,{},function()local aE=am and am.Character local aF=aE and aE:
FindFirstChild'HumanoidRootPart'if aF and aF.Parent then return aF end return
nil end,function(aE)if not aE or not aE.Parent then return nil end local aF,aG=
pcall(function()return aE.Position end)if not aF or not aG then return nil end
return aG end,function(aE)if ab.IsBossActive and ab.IsBossActive()then return
true end if aE then if aE.Room and type(aE.Room.Name)=='string'and string.find(
string.lower(aE.Room.Name),'boss')then return true end if aE.Model then local aF
=string.lower(aE.Model.Name)if string.find(aF,'boss')then return true end local
aG=aE.Model.Parent if aG and string.find(string.lower(aG.Name),'boss')then
return true end end end return false end,function(aE)return ak.
GetActiveCombatDistances(aE)end,function(aE,aF)if aE==aF then return true end if
aE and aF and aE.Model and aF.Model and aE.Model==aF.Model then return true end
return false end local bb=function(bb,bc)local bd=ag.GetTarget()if aU(bd,bb)then
return end ag.SetTarget(bb,nil,nil,bc)aV=nil aF='None'aW=nil aX=nil aK=0 if bb
then aE=an.CHASE else aE=an.NO_TARGET end end ba=function()if aI or not ap or
not aq then return end aH+=1 local bc=aH aI=true local bd=aQ()local be=bd and
aR(bd)if not be then aI=false return end local bf=ae.Scan()if#bf==0 then if bc==
aH and ap and aq then bb(nil,nil)end aI=false return end local bg,bh,bi,bj=af.
SelectBestTarget(be,bf,function()return bc~=aH or not ap or not aq end)if bc==aH
and ap and aq then bb(bg,bj)end aI=false end local bc,bd,be,bf=function(bc)if ab
.IsInLobby()or not aJ then return end local bd,be=aQ(),ab.GetHumanoid()if not bd
or not be or be.Health<=0 then return end local bf=aR(bd)if not bf then return
end if ai.IsCurrentlyDodging and ai.IsCurrentlyDodging()then return end if aO
then return end local bg=os.clock()if bg-aG>=ar then aG=bg if aE~=an.HOLD and aE
~=an.KITE then ba()end end local bi=ag.GetTarget()if bi then if not ag.
IsTargetValid()then ag.ClearTarget()aE=an.NO_TARGET aV=nil aF='None'aX=nil
pcall(function()be:MoveTo(bf)be.AutoRotate=true end)ba()return end end if not bi
or aE==an.NO_TARGET then aV=nil aF='None'aX=nil pcall(function()be:MoveTo(bf)be.
AutoRotate=true end)if not aI and bg-aG>=0.5 then aG=bg ba()end return end local
bj=bi.Root and aR(bi.Root)if not bj then ag.ClearTarget()aE=an.NO_TARGET aX=nil
pcall(function()be:MoveTo(bf)be.AutoRotate=true end)return end local bk,bl=aT(bi
)local bm=Vector3.new(bj.X-bf.X,0,bj.Z-bf.Z)local bn,bo,bp,bq=bm.Magnitude,ak.
GetActiveBossArea(bi)local br,bs=false if bo and bq and bp and bp>0 then bs=
Vector3.new(bq.X,0,bq.Z)local bt=(Vector3.new(bf.X,0,bf.Z)-bs).Magnitude if bt>
bp then br=true end end if br and bs and bq then local bt=Vector3.new(bq.X,bf.Y,
bq.Z)aE=an.CHASE aF='Enter Boss Area'aV=bt aK=0 be:MoveTo(bt)return end if ax
and bn<=(bl+25)then pcall(function()be.AutoRotate=false local bt=Vector3.new(bj.
X,bd.Position.Y,bj.Z)if(bt-bd.Position).Magnitude>0.5 then bd.CFrame=CFrame.
lookAt(bd.Position,bt)end end)else pcall(function()be.AutoRotate=true end)end aj
.Step(bc,bi,bn)if bn<bk then local bt=Vector3.new(bf.X-bj.X,0,bf.Z-bj.Z)local bu
,bv=bt.Magnitude>0.1 and bt.Unit or Vector3.new(0,0,1),math.clamp(bk-bn+6,4,15)
local bw=bf+bu*bv if bs and bp then local bx=Vector3.new(bw.X,0,bw.Z)if(bx-bs).
Magnitude>bp then local by=bs+(bx-bs).Unit*math.max(1,bp-2)bw=Vector3.new(by.X,
bf.Y,by.Z)if(bw-bf).Magnitude<2 then aE=an.HOLD aF='Hold (Boss Area Edge)'aV=nil
aK=0 pcall(function()be:MoveTo(bf)end)return end end end local bx,by=true,ab.
IsInvulnerable and ab.IsInvulnerable()if not by and ai and ai.IsPointSafe then
bx=ai.IsPointSafe(bw,0.5)end if not bx then aE=an.HOLD aF='Hold (Danger Behind)'
aV=nil aK=0 pcall(function()be:MoveTo(bf)end)else aE=an.KITE aF='Kite'aK=0 aV=bw
be:MoveTo(bw)end elseif bn<=bl then aE=an.HOLD aV=nil aF='Hold'aK=0 pcall(
function()be:MoveTo(bf)end)else local bt,bu,bv=bm.Magnitude>0.1 and bm.Unit or
Vector3.new(0,0,1),false,ab.IsInvulnerable and ab.IsInvulnerable()if not bv and
ai and ai.IsPointSafe then for bw,bx in ipairs{3,6,10}do if bx<bn then local by=
bf+bt*bx if not ai.IsPointSafe(by,0.5)then bu=true break end end end end if bu
then aE=an.HOLD aF='Hold (Danger Ahead)'aV=nil aK=0 pcall(function()be:MoveTo(bf
)end)else aE=an.CHASE aF='Chase'local bw=Vector3.new(bj.X,bf.Y,bj.Z)aV=bw be:
MoveTo(bw)local bx=bj.Y-bf.Y if bx>1.8 and bn<=8 then be.Jump=true end local by=
bd.AssemblyLinearVelocity or bd.Velocity local bz,bA=by and Vector3.new(by.X,0,
by.Z).Magnitude or 0,(type(bc)=='number'and bc>0)and bc or 0.016 if bz<aN then
aK+=bA if aM and(bg-aL)>=0.4 then be.Jump=true pcall(function()be:ChangeState(
Enum.HumanoidStateType.Jumping)end)aL=bg end else aK=0 end end end end,function(
)if a0 and a0.Parent then return a0 end if a0 then pcall(function()a0:Destroy()
end)a0=nil end a0=Instance.new'Highlight'a0.Name='TM_EnemyHighlight_Debug'a0.
FillColor=Color3.fromRGB(255,200,0)a0.FillTransparency=0.5 a0.OutlineColor=
Color3.fromRGB(255,0,0)a0.OutlineTransparency=0 a0.Parent=aa.CoreGui or game:
GetService'CoreGui'return a0 end,function()return workspace.Terrain end,function
()for bc,bd in ipairs(aP)do pcall(function()bd:Destroy()end)end table.clear(aP)b
=nil end local bg,bi=function()if ab.IsInLobby()then return end local bg,bi=ag.
GetTarget(),aQ()local bj,bk=bi and aR(bi),be()if not aB or not bg or not bg.Root
then if a0 and a0.Parent then a0.Enabled=false end else local bl=bd()if bg.Model
and bg.Model.Parent then bl.Adornee=bg.Model bl.Enabled=true else bl.Enabled=
false end end local bl,bm=ag.GetWaypoints(),ag.GetPathInstance()if not az or not
bl or#bl==0 or not bk then bf()else local bn=tostring(bm)..'_'..tostring(#bl)if
b~=bn then bf()for bo=2,#bl do local bp,bq=bl[bo-1].Position,bl[bo].Position
local br=(bq-bp).Magnitude if br>0.01 then local bs=Instance.new
'LineHandleAdornment'bs.Name='TM_PathLine_Debug'bs.Adornee=bk bs.AlwaysOnTop=
true bs.Length=br bs.Thickness=2 bs.Transparency=0.3 bs.Color3=Color3.fromRGB(0,
255,120)bs.ZIndex=0 bs.CFrame=CFrame.lookAt(bp,bq)bs.Parent=aa.CoreGui or game:
GetService'CoreGui'aP[#aP+1]=bs end end b=bn end end if not aA or not aV or not
bj or not bk then if a1 then a1.Visible=false end if a2 then a2.Visible=false
end else local bn,bo=bj+Vector3.new(0,0.5,0),aV+Vector3.new(0,0.5,0)local bp=(bo
-bn).Magnitude if bp>=0.3 then if not a1 or not a1.Parent then a1=Instance.new
'LineHandleAdornment'a1.Name='TM_ActualPath_Debug'a1.Adornee=bk a1.AlwaysOnTop=
true a1.Thickness=3.5 a1.Transparency=0.15 a1.Color3=Color3.fromRGB(0,230,255)a1
.ZIndex=2 a1.Parent=aa.CoreGui or game:GetService'CoreGui'end a1.Length=bp a1.
CFrame=CFrame.lookAt(bn,bo)a1.Visible=true if not a2 or not a2.Parent then a2=
Instance.new'SphereHandleAdornment'a2.Name='TM_ActualMarker_Debug'a2.Adornee=bk
a2.AlwaysOnTop=true a2.Radius=0.65 a2.Transparency=0.2 a2.Color3=Color3.fromRGB(
0,230,255)a2.ZIndex=3 a2.Parent=aa.CoreGui or game:GetService'CoreGui'end a2.
CFrame=CFrame.new(bo)a2.Visible=true else if a1 then a1.Visible=false end if a2
then a2.Visible=false end end end if not aC or not aX or not bj or not bg or not
bk then if a3 then a3.Visible=false end if a4 then a4.Visible=false end else
local bn,bo,bp=aX.origin or(bj+Vector3.new(0,1.5,0)),aX.directHitPos or aX.
targetPos,aX.directBlocked if bo then local bq=(bo-bn).Magnitude if bq>=0.2 then
if not a3 or not a3.Parent then a3=Instance.new'LineHandleAdornment'a3.Name=
'TM_BlockerRay_Debug'a3.Adornee=bk a3.AlwaysOnTop=true a3.Thickness=3 a3.
Transparency=0.2 a3.ZIndex=3 a3.Parent=aa.CoreGui or game:GetService'CoreGui'end
a3.Length=bq a3.Color3=bp and Color3.fromRGB(255,30,30)or Color3.fromRGB(50,255,
50)a3.CFrame=CFrame.lookAt(bn,bo)a3.Visible=true if bp and aX.directHitPos then
if not a4 or not a4.Parent then a4=Instance.new'SphereHandleAdornment'a4.Name=
'TM_BlockerHitMarker_Debug'a4.Adornee=bk a4.AlwaysOnTop=true a4.Radius=0.5 a4.
Transparency=0.2 a4.Color3=Color3.fromRGB(255,30,30)a4.ZIndex=4 a4.Parent=aa.
CoreGui or game:GetService'CoreGui'end a4.CFrame=CFrame.new(aX.directHitPos)a4.
Visible=true else if a4 then a4.Visible=false end end else if a3 then a3.Visible
=false end if a4 then a4.Visible=false end end end end local bn=bg and bg.Root
if not aD or not bn or not bn.Parent then if a5 then a5.Visible=false end if a6
then a6.Visible=false end if a7 then a7.Visible=false end if a8 then a8.Visible=
false end else local bo=aR(bn)or bn.Position local bp=bj and(bj.Y-2.5)or(bo.Y-
2.5)local bq=Vector3.new(bo.X,bp,bo.Z)local br=CFrame.new(bq)*CFrame.Angles(math
.rad(90),0,0)local bs,bt,bu=bn.CFrame:ToObjectSpace(br),aT(bg)local bv=math.max(
1,bt)local bw,bx=math.max(bv+0.5,bu),0.35 if not a5 or not a5.Parent then a5=
Instance.new'CylinderHandleAdornment'a5.Name='TM_MinDistanceFill_Debug'a5.
AlwaysOnTop=true a5.ZIndex=4 a5.Parent=aa.CoreGui or game:GetService'CoreGui'end
a5.Adornee=bn a5.Height=0.02 a5.InnerRadius=0 a5.Radius=bv a5.Color3=Color3.
fromRGB(255,200,0)a5.Transparency=0.82 a5.CFrame=bs a5.Visible=true if not a6 or
not a6.Parent then a6=Instance.new'CylinderHandleAdornment'a6.Name=
'TM_MinDistanceRing_Debug'a6.AlwaysOnTop=true a6.ZIndex=5 a6.Parent=aa.CoreGui
or game:GetService'CoreGui'end a6.Adornee=bn a6.Height=0.05 a6.InnerRadius=math.
max(0.1,bv-bx)a6.Radius=bv a6.Color3=Color3.fromRGB(255,215,20)a6.Transparency=
0.25 a6.CFrame=bs a6.Visible=true if not a7 or not a7.Parent then a7=Instance.
new'CylinderHandleAdornment'a7.Name='TM_MaxDistanceFill_Debug'a7.AlwaysOnTop=
true a7.ZIndex=4 a7.Parent=aa.CoreGui or game:GetService'CoreGui'end a7.Adornee=
bn a7.Height=0.02 a7.InnerRadius=bv a7.Radius=bw a7.Color3=Color3.fromRGB(0,255,
120)a7.Transparency=0.82 a7.CFrame=bs a7.Visible=true if not a8 or not a8.Parent
then a8=Instance.new'CylinderHandleAdornment'a8.Name='TM_MaxDistanceRing_Debug'
a8.AlwaysOnTop=true a8.ZIndex=5 a8.Parent=aa.CoreGui or game:GetService'CoreGui'
end a8.Adornee=bn a8.Height=0.05 a8.InnerRadius=math.max(0.1,bw-bx)a8.Radius=bw
a8.Color3=Color3.fromRGB(0,255,120)a8.Transparency=0.25 a8.CFrame=bs a8.Visible=
true local by,bz,bA=ak.GetActiveBossArea(bg)if by and bA and bz and bz>0 then
local bB=Vector3.new(bA.X,bp,bA.Z)local bC=CFrame.new(bB)*CFrame.Angles(math.
rad(90),0,0)local bD=bn.CFrame:ToObjectSpace(bC)if not a9 or not a9.Parent then
a9=Instance.new'CylinderHandleAdornment'a9.Name='TM_BossAreaRing_Debug'a9.
AlwaysOnTop=true a9.ZIndex=5 a9.Parent=aa.CoreGui or game:GetService'CoreGui'end
a9.Adornee=bn a9.Height=0.05 a9.InnerRadius=math.max(0.1,bz-0.45)a9.Radius=bz a9
.Color3=Color3.fromRGB(0,200,255)a9.Transparency=0.3 a9.CFrame=bD a9.Visible=
true else if a9 then a9.Visible=false end end end end,function()if a0 then
pcall(function()a0:Destroy()end)a0=nil end if a1 then pcall(function()a1:
Destroy()end)a1=nil end if a2 then pcall(function()a2:Destroy()end)a2=nil end if
a3 then pcall(function()a3:Destroy()end)a3=nil end if a4 then pcall(function()a4
:Destroy()end)a4=nil end if a5 then pcall(function()a5:Destroy()end)a5=nil end
if a6 then pcall(function()a6:Destroy()end)a6=nil end if a7 then pcall(function(
)a7:Destroy()end)a7=nil end if a8 then pcall(function()a8:Destroy()end)a8=nil
end if a9 then pcall(function()a9:Destroy()end)a9=nil end bf()end function ao.
IsEnabled()return ap end function ao.IsRunning()return aq end function ao.
GetState()return aE end function ao.GetScanInterval()return ar end function ao.
SetScanInterval(bj)if type(bj)=='number'and bj>0.1 then ar=bj end end function
ao.GetMobMinCombatDistance()return as end function ao.SetMobMinCombatDistance(bj
)if type(bj)=='number'and bj>=1 then as=bj if as>at then at=as+5 end end end
function ao.GetMobMaxCombatDistance()return at end function ao.
SetMobMaxCombatDistance(bj)if type(bj)=='number'and bj>=2 then at=bj if as>at
then as=math.max(1,at-5)end end end function ao.GetBossMinCombatDistance()return
au end function ao.SetBossMinCombatDistance(bj)if type(bj)=='number'and bj>=1
then au=bj if au>av then av=au+5 end end end function ao.
GetBossMaxCombatDistance()return av end function ao.SetBossMaxCombatDistance(bj)
if type(bj)=='number'and bj>=2 then av=bj if au>av then au=math.max(1,av-5)end
end end function ao.GetMinCombatDistance()return as end function ao.
SetMinCombatDistance(bj)ao.SetMobMinCombatDistance(bj)end function ao.
GetMaxCombatDistance()return at end function ao.SetMaxCombatDistance(bj)ao.
SetMobMaxCombatDistance(bj)end ao.IsTargetBoss=aS function ao.
IsAutoFaceTargetEnabled()return ax end function ao.SetAutoFaceTarget(bj)ax=bj
and true or false if not ax then local bk=ab.GetHumanoid()if bk and bk.Parent
then pcall(function()bk.AutoRotate=true end)end end end function ao.
GetReachDistance()return maxCombatDistance end function ao.SetReachDistance(bj)
if type(bj)=='number'and bj>=2 then ao.SetMaxCombatDistance(bj)end end function
ao.GetRepathDistance()return ay end function ao.SetRepathDistance(bj)if type(bj)
=='number'and bj>=1 then ay=bj ag.SetRepathThreshold(bj)end end function ao.
SetAutoJumpOnStuck(bj)aM=bj==true end function ao.IsAutoJumpOnStuckEnabled()
return aM end function ao.SetStuckVelocityThreshold(bj)if type(bj)=='number'and
bj>0 then aN=bj end end function ao.GetStuckVelocityThreshold()return aN end
function ao.SetPaused(bj)local bk=bj and true or false if bk==aO then return end
aO=bk if aO then local bl,bm=ab.GetHumanoid(),aQ()if bl and bl.Parent and bm
then pcall(function()bl:MoveTo(bm.Position)bl.AutoRotate=true end)end end end
function ao.IsPaused()return aO end function ao.IsAutoSkillEnabled()return aj.
IsEnabled()end function ao.SetAutoSkillEnabled(bj)aj.SetEnabled(bj)end ao.
IsAutoSkillQEnabled=aj.IsSkillQEnabled ao.SetAutoSkillQEnabled=aj.
SetSkillQEnabled ao.IsAutoSkillEEnabled=aj.IsSkillEEnabled ao.
SetAutoSkillEEnabled=aj.SetSkillEEnabled ao.GetSkillERange=aj.GetSkillERange ao.
SetSkillERange=aj.SetSkillERange ao.GetSkillSpamInterval=aj.GetSpamInterval ao.
SetSkillSpamInterval=aj.SetSkillSpamInterval ao.IsBuffActive=aj.IsBuffActive ao.
CastSkillQ=aj.CastSkillQ ao.CastSkillE=aj.CastSkillE function ao.
IsPlannedPathVisualEnabled()return az end function ao.SetPlannedPathVisual(bj)az
=bj==true if not az then bf()end end function ao.IsActualPathVisualEnabled()
return aA end function ao.SetActualPathVisual(bj)aA=bj==true if not aA then if
a1 then a1.Visible=false end if a2 then a2.Visible=false end end end function ao
.IsBlockerRayVisualEnabled()return aC end function ao.SetBlockerRayVisual(bj)aC=
bj==true if not aC then if a3 then a3.Visible=false end if a4 then a4.Visible=
false end end end function ao.IsTargetVisualEnabled()return aB end function ao.
SetTargetVisual(bj)aB=bj==true if not aB then if a0 and a0.Parent then a0.
Enabled=false end end end function ao.IsCombatRangeVisualEnabled()return aD end
function ao.SetCombatRangeVisual(bj)aD=bj==true if not aD then if a5 then a5.
Visible=false end if a6 then a6.Visible=false end if a7 then a7.Visible=false
end if a8 then a8.Visible=false end end end function ao.GetDebugInfo()local bj=
aQ()local bk,bl,bm,bn,bo,bp=bj and aR(bj),ag.GetTarget(),'-',0,0,ag.
GetWaypoints()if bl and bl.Model then bm=bl.Model.Name or'-'local bq=aR(bl.Root)
if bq and bk then bn=(bq-bk).Magnitude bo=Vector3.new(bq.X-bk.X,0,bq.Z-bk.Z).
Magnitude end end local bq={directBlocked=false,blockerName='None',blockerDist=0
}if aX then bq.directBlocked=aX.directBlocked==true if aX.directHitPart then bq.
blockerName=aX.directHitPart.Name or'Part'end if aX.directHitPos and bk then bq.
blockerDist=(aX.directHitPos-bk).Magnitude end end local br,bs=0,0 if bj then
local bt=bj.AssemblyLinearVelocity or bj.Velocity if bt then br=Vector3.new(bt.X
,0,bt.Z).Magnitude bs=bt.Y end end return{state=aE,enemyName=bm,enemyDist=bn,
enemyFlat=bo,hasTarget=bl~=nil,destMode=aF,nodeIndex=aW,waypointCount=bp and#bp
or 0,hasDestination=aV~=nil,blocker=bq,velocity=br,verticalVelocity=bs,
stuckTimer=aK}end function ao.Toggle(bj,bk)if bj==ap then return end ap=bj if ap
then if not bk then ad.EnableExclusive'AutoFarm'end if aY then aY:Disconnect()aY
=nil end aq=true aH=0 aI=false aG=0 ag.SetRepathThreshold(ay)if not aZ then aZ=
ab.OnEnemyChanged(function()if ap and aq and aE~=an.HOLD then ba()end end)end if
not a_ then a_=ab.OnRespawn(function()ag.ClearTarget()aE=an.NO_TARGET aX=nil ba(
)end)end if not aJ then task.spawn(function()if ab.ReadyDungeon()then aJ=true
end end)end task.defer(ba)aY=al.Heartbeat:Connect(function(bl)local bm,bn=pcall(
bc,bl)if not bm then warn(('[AutoFarm] Error in stepMovementLoop: %s'):format(
tostring(bn)))end bg()end)else if aY then aY:Disconnect()aY=nil end aq=false if
aZ then aZ()aZ=nil end if a_ then a_()a_=nil end local bl,bm=ab.GetHumanoid(),
aQ()if bl and bl.Parent and bm then pcall(function()bl:MoveTo(bm.Position)bl.
AutoRotate=true end)end ag.ClearTarget()aE=an.NO_TARGET aV=nil aF='None'aX=nil
aK=0 aH+=1 aI=false bi()end end ad.Register('AutoFarm',ao.Toggle,ao.IsEnabled)ac
.Register(function()ao.Toggle(false)bi()end)return ao end function a.D()local aa
,ab,ac,ad,ae,af,ag,ah={'Easy','Medium','Hard','Insane','Nightmare'},{
'Desert Temple','Winter Outpost','Pirate Island',"King's Castle",
'The Underworld','Samurai Palace','The Canals','Ghastly Harbor',
'Steampunk Sewers','Orbital Outpost','Volcanic Chambers','Aquatic Temple',
'Enchanted Forest','Egg Island','Krampus','Tutorial Dungeon'},{['Egg Island']={
Difficulties={'Easy','Nightmare'},LevelReq=0},Krampus={Difficulties={'Nightmare'
},LevelReq=195},['Tutorial Dungeon']={Difficulties={'Easy'},LevelReq=0}},{},{},
game:GetService'HttpService','Maclib/DungeonQuest_MapList.json'local ai,aj,ak,al
=function(ai)if not(isfile and writefile and makefolder and isfolder)then return
end pcall(function()if not isfolder'Maclib'then makefolder'Maclib'end end)pcall(
function()writefile(ag,af:JSONEncode(ai))end)end,function()if not(isfile and
readfile)or not isfile(ag)then return nil end local ai,aj=pcall(function()return
af:JSONDecode(readfile(ag))end)if not ai or typeof(aj)~='table'then return nil
end local ak={}for al,am in ipairs(aj)do if type(am)=='string'and#am>0 then
table.insert(ak,am)end end return(#ak>0)and ak or nil end,function(ai)local aj,
ak={},{}for al,am in ipairs(ai or{})do if not aj[am]then aj[am]=true table.
insert(ak,am)end end for al,am in ipairs(ab)do if not aj[am]then aj[am]=true
table.insert(ak,am)end end return ak end,function()local ai=game:GetService
'Players'.LocalPlayer if not ai then return nil end local aj=ai:FindFirstChild
'PlayerGui'if not aj then return nil end local ak=aj:FindFirstChild'queueGui'if
not ak then return nil end local al=ak:FindFirstChild'chooseDungeon'if not al
then return nil end local am=al:FindFirstChild'backgroundFillLeft'if not am then
return nil end return am:FindFirstChild'ScrollingFrame'end local am=function()
local am=al()if not am then return nil end local an={}for ao,ap in ipairs(am:
GetChildren())do if ap:IsA'ImageLabel'and#ap.Name>0 then table.insert(an,ap.Name
)end end return(#an>0)and an or nil end function ad.GetDungeons()if ah then
return ah end local an=am()if an then local ao=ak(an)ah=ao ai(ao)return ao end
local ao=aj()if ao then local ap=ak(ao)ah=ap return ap end return ab end
function ad.RefreshDungeons()ah=nil return ad.GetDungeons()end function ad.
GetDungeonStats(an)if type(an)~='string'or#an==0 then return nil end if ae[an]~=
nil then return ae[an]end local ao=game:GetService'ReplicatedStorage':
FindFirstChild'remotes'local ap=ao and ao:FindFirstChild'getDungeonStats'if not
ap then return nil end local aq,ar=pcall(function()return ap:InvokeServer(an)end
)if aq and typeof(ar)=='table'then ae[an]=ar return ar end return nil end
function ad.GetAllowedDifficulties(an)if type(an)~='string'then return aa end
local ao=ac[an]if ao then return ao.Difficulties end local ap,aq=ad.
GetDungeonStats(an),{}if ap then for ar,as in ipairs(aa)do if ap[as]then table.
insert(aq,as)end end end if#aq>0 then return aq end return aa end function ad.
IsDifficultyAllowed(an,ao)if type(ao)~='string'then return false end for ap,aq
in ipairs(ad.GetAllowedDifficulties(an))do if aq==ao then return true end end
return false end function ad.GetLevelReq(an,ao)if type(an)~='string'then return
0 end local ap=ac[an]if ap then return ap.LevelReq or 0 end local aq=ad.
GetDungeonStats(an)if aq and type(ao)=='string'and aq[ao]then return tonumber(aq
[ao].levelReq)or 0 end return 0 end ad.DUNGEONS=ab ad.DIFFICULTIES=aa return ad
end function a.E()local aa,ab,ac,ad,ae,af,ag,ah=a.load'd',a.load'C',a.load'r',a.
load'D',a.load'f',a.load'e',a.load'g',a.load'b'local ai=af.RunService return
function(aj,ak)local al=ak:Section{Side='Left'}al:Header{Name='Auto Farm'}al:
Toggle({Name='Enable Auto Farm',Default=ab.IsEnabled(),Callback=aa.Wrap(function
(am)ab.Toggle(am)end)},'Toggle_AutoFarm')al:Slider({Name='Rescan Interval (s)',
Default=ab.GetScanInterval(),Minimum=0.5,Maximum=5,Precision=1,Callback=aa.Wrap(
function(am)ab.SetScanInterval(am)end)},'Slider_AF_ScanInterval')al:Toggle({Name
='Auto Face Target (Look At Enemy)',Default=ab.IsAutoFaceTargetEnabled(),
Callback=aa.Wrap(function(am)ab.SetAutoFaceTarget(am)end)},
'Toggle_AF_AutoFaceTarget')al:Slider({Name='Repath Distance (studs)',Default=ab.
GetRepathDistance(),Minimum=2,Maximum=20,DisplayMethod='Value',Precision=1,
Callback=aa.Wrap(function(am)ab.SetRepathDistance(am)end)},
'Slider_AF_RepathDistance')al:Toggle({Name='Auto Jump When Stuck (Low Velocity)'
,Default=ab.IsAutoJumpOnStuckEnabled(),Callback=aa.Wrap(function(am)ab.
SetAutoJumpOnStuck(am)end)},'Toggle_AF_AutoJumpOnStuck')ag.
PatchSliderLoadCallback(al:Slider({Name='Stuck Velocity Threshold (studs/s)',
Default=ab.GetStuckVelocityThreshold(),Minimum=2,Maximum=20,DisplayMethod=
'Value',Precision=1,Callback=aa.Wrap(function(am)ab.SetStuckVelocityThreshold(am
)end)},'Slider_AF_StuckVelocity'))al:Header{Name=
'Auto Skill (Smart Buff & Damage)'}al:Toggle({Name=
'Enable Auto Skill (Smart Q + E)',Default=ab.IsAutoSkillEnabled(),Callback=aa.
Wrap(function(am)ab.SetAutoSkillEnabled(am)end)},'Toggle_AF_AutoSkill')ag.
PatchSliderLoadCallback(al:Slider({Name='Skill E Cast Range (studs)',Default=ab.
GetSkillERange(),Minimum=5,Maximum=150,DisplayMethod='Value',Precision=1,
Callback=aa.Wrap(function(am)ab.SetSkillERange(am)end)},'Slider_AF_SkillERange')
)ag.PatchSliderLoadCallback(al:Slider({Name='Skill Spam Interval (s)',Default=ab
.GetSkillSpamInterval(),Minimum=0.05,Maximum=1,DisplayMethod='Value',Precision=2
,Callback=aa.Wrap(function(am)ab.SetSkillSpamInterval(am)end)},
'Slider_AF_SkillSpamInterval'))al:Header{Name='Visual Debug'}al:Toggle({Name=
'Show Blocker Ray (Red/Green)',Default=ab.IsBlockerRayVisualEnabled(),Callback=
aa.Wrap(function(am)ab.SetBlockerRayVisual(am)end)},'Toggle_AF_BlockerRay')al:
Toggle({Name='Show Planned Path (Green)',Default=ab.IsPlannedPathVisualEnabled()
,Callback=aa.Wrap(function(am)ab.SetPlannedPathVisual(am)end)},
'Toggle_AF_PlannedPath')al:Toggle({Name='Show Actual Destination (Cyan)',Default
=ab.IsActualPathVisualEnabled(),Callback=aa.Wrap(function(am)ab.
SetActualPathVisual(am)end)},'Toggle_AF_ActualPath')al:Toggle({Name=
'Show Target Indicator (Red/Glow)',Default=ab.IsTargetVisualEnabled(),Callback=
aa.Wrap(function(am)ab.SetTargetVisual(am)end)},'Toggle_AF_TargetVisual')al:
Toggle({Name='Show Combat Range Circles (Min/Max)',Default=ab.
IsCombatRangeVisualEnabled(),Callback=aa.Wrap(function(am)ab.
SetCombatRangeVisual(am)end)},'Toggle_AF_CombatRangeVisual')local am=ak:Section{
Side='Right'}am:Header{Name='Auto Farm Monitor'}local an,ao,ap,aq,ar,as,at,au=am
:Label{Text="State: <font color='rgb(160,160,160)'>NO_TARGET</font>"},am:Label{
Text="Target: <font color='rgb(160,160,160)'>None</font>"},am:Label{Text=
"Distance: <font color='rgb(160,160,160)'>-</font>"},am:Label{Text=
"Velocity: <font color='rgb(160,160,160)'>0.0 studs/s</font>"},am:Label{Text=
"Blocker Detection: <font color='rgb(160,160,160)'>-</font>"},am:Label{Text=
[[Destination Mode: <font color='rgb(160,160,160)'>None</font>]]},(am:Label{Text
="Path Nodes: <font color='rgb(160,160,160)'>0</font>"})local av,ax=function()
local av,ax=ab.GetDebugInfo(),'160,160,160'if av.state=='CHASE'then ax=
'0,255,120'elseif av.state=='HOLD'then ax='255,200,0'elseif av.state=='BLOCKED'
then ax='255,60,60'elseif av.state=='REPATHING'or av.state=='ACQUIRING_TARGET'or
av.state=='TRACKING_TARGET'then ax='0,200,255'end pcall(function()an:UpdateName(
("State: <font color='rgb(%s)'>%s</font>"):format(ax,av.state))end)pcall(
function()if av.hasTarget then ao:UpdateName((
"Target: <font color='rgb(255,220,120)'>%s</font>"):format(av.enemyName))ap:
UpdateName((
[[Distance: <font color='rgb(0,255,255)'>%.1f studs (flat %.1f)</font>]]):
format(av.enemyDist,av.enemyFlat))else ao:UpdateName
"Target: <font color='rgb(160,160,160)'>None</font>"ap:UpdateName
"Distance: <font color='rgb(160,160,160)'>-</font>"end end)pcall(function()local
ay=av.velocity or 0 local az=ay>=12 and'0,255,120'or(ay>=10 and'255,200,0'or
'255,80,80')aq:UpdateName(("Velocity: <font color='rgb(%s)'>%.1f studs/s</font>"
):format(az,ay))end)pcall(function()if av.hasTarget and av.blocker then if av.
blocker.directBlocked then ar:UpdateName((
[[Blocker: <font color='rgb(255,60,60)'>BLOCKED by '%s' (%.1fm)</font>]]):
format(av.blocker.blockerName,av.blocker.blockerDist))else ar:UpdateName
[[Blocker: <font color='rgb(0,255,120)'>CLEAR (Direct Line to Target)</font>]]
end else ar:UpdateName"Blocker: <font color='rgb(160,160,160)'>None</font>"end
end)pcall(function()local ay=av.destMode if av.nodeIndex then ay=(
'%s (Node #%d)'):format(av.destMode,av.nodeIndex)end local az=av.destMode==
'Direct'and'0,255,255'or(av.destMode=='Waypoint'and'255,200,0'or(av.destMode==
'Hold'and'255,200,0'or'255,80,80'))as:UpdateName((
"Destination Mode: <font color='rgb(%s)'>%s</font>"):format(az,ay))end)pcall(
function()at:UpdateName((
[[Path Nodes: <font color='rgb(160,255,160)'>%d waypoints</font>]]):format(av.
waypointCount))end)end,0 au=ai.Heartbeat:Connect(function()local ay=os.clock()if
ay-ax>=0.25 then ax=ay av()end end)ah.Register(function()if au then au:
Disconnect()au=nil end end)local ay=ak:Section{Side='Right'}ay:Header{Name=
'Contextual Combat Distance'}local az,aA=ay:Label{Text='Active: -'},ad.
GetDungeons()local aB,aC,aD,aE,aF,aG,aH,aI,aJ=ae.GetCurrentDungeonName()or aA[1]
or'Desert Temple','Mob',false,function()local aB,aC=ae.GetCurrentDungeonName(),
ae.GetCombatTargetKey()local aD,aE=ac.GetCombatDistances(aB,aC)local aF,aG,aH,aI
=aB and("<font color='rgb(0,255,255)'>"..aB..'</font>')or
"<font color='rgb(160,160,160)'>Lobby</font>","<font color='rgb(255,200,0)'>"..
ac.GetTargetDisplay(aC)..'</font>',(
"<font color='rgb(120,255,120)'>%.0f - %.0f studs</font>"):format(aD,aE),''if aC
~='Mob'then local aJ,aK=ac.GetBossArea(aB,aC)local aL=aJ and(
"<font color='rgb(0,255,255)'>Area: %.0f studs</font>"):format(aK)or
"<font color='rgb(160,160,160)'>Area: Off</font>"aI=' | '..aL end pcall(function
()az:UpdateName(('Active: %s | Target: %s (%s%s)'):format(aF,aG,aH,aI))end)end
local aK=function()aD=true local aK,aL=ac.GetCombatDistances(aB,aC)if aF then
pcall(function()aF:UpdateValue(aK)end)end if aG then pcall(function()aG:
UpdateValue(aL)end)end if aC=='Mob'then if aH then pcall(function()aH:
UpdateState(false)end)end if aI then pcall(function()aI:UpdateValue(80)end)end
else local aM,aN=ac.GetBossArea(aB,aC)if aH then pcall(function()aH:UpdateState(
aM)end)end if aI then pcall(function()aI:UpdateValue(aN)end)end end if aJ then
pcall(function()local aM=aC=='Mob'and
" <font color='rgb(160,160,160)'>(Boss Area N/A)</font>"or''aJ:UpdateName((
[[Editing: <font color='rgb(0,255,255)'>%s</font> / <font color='rgb(255,200,0)'>%s</font>%s]]
):format(aB,ac.GetTargetDisplay(aC),aM))end)end aD=false aE()end local aL,aM=ay:
Dropdown{Name='Select Dungeon',Options=aA,Default=aB,Required=true,Callback=
function(aL)if type(aL)=='string'and#aL>0 then aB=aL aK()end end},ay:Dropdown{
Name='Select Target',Options=ac.GetTargetOptions(),Default='Normal',Required=
true,Callback=function(aL)aC=ac.GetTargetKey(aL)aK()end}aJ=ay:Label{Text=''}
local aN,aO=ac.GetCombatDistances(aB,aC)aF=ag.PatchSliderLoadCallback(ay:Slider{
Name='Min Combat Distance (studs)',Default=aN,Minimum=2,Maximum=150,
DisplayMethod='Value',Precision=1,Callback=function(aP)if aD then return end ac.
SetMinCombatDistance(aB,aC,aP)aE()end})aG=ag.PatchSliderLoadCallback(ay:Slider{
Name='Max Combat Distance (studs)',Default=aO,Minimum=5,Maximum=200,
DisplayMethod='Value',Precision=1,Callback=function(aP)if aD then return end ac.
SetMaxCombatDistance(aB,aC,aP)aE()end})ay:Header{Name=
'Boss Area Constraint (Boss Only)'}local aP,aQ=ac.GetBossArea(aB,aC)aH=ay:Toggle
{Name='Enable Boss Area Constraint',Default=aP,Callback=function(aR)if aD then
return end if aC=='Mob'then if aH then pcall(function()aH:UpdateState(false)end)
end return end ac.SetBossAreaEnabled(aB,aC,aR)aE()end}aI=ag.
PatchSliderLoadCallback(ay:Slider{Name='Boss Area Radius (studs)',Default=aQ,
Minimum=10,Maximum=300,DisplayMethod='Value',Precision=1,Callback=function(aR)if
aD then return end if aC=='Mob'then return end ac.SetBossAreaRadius(aB,aC,aR)aE(
)end})ay:Button{Name='Reset Target to Default',Callback=function()ac.
ResetTarget(aB,aC)aK()end}ay:Button{Name='Reset Dungeon to Default',Callback=
function()ac.ResetDungeon(aB)aK()end}local aR,aS,aT,aU=ae.OnDungeonNameChanged(
function(aR)if aR and type(aR)=='string'and#aR>0 then aB=aR pcall(function()aL:
UpdateSelection(aR)end)end aK()end),ae.OnBossActiveChanged(function()aE()end),ae
.OnBossIndexChanged(function()aE()end),ac.OnDataChanged(function()aK()end)ah.
Register(function()pcall(aR)pcall(aS)pcall(aT)pcall(aU)end)aK()end end function
a.F()return function(aa,ab)a.load'i'(aa,ab)a.load'v'(aa,ab)a.load'E'(aa,ab)end
end function a.G()local aa,ab,ac,ad,ae=a.load'e',a.load'c',a.load'D',a.load'f',a
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
Register(function()av.Toggle(false)end)return av end function a.H()local aa,ab,
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
function a.I()local aa={[77649408247578]=true,[115445507767090]=true}local ab,ac
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
if ac then ah()end end return ai end function a.J()local aa,ab=a.load'e',a.load
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
K()local aa,ab,ac,ad,ae,af,ag=a.load'g',a.load'G',a.load'H',a.load'I',a.load'J',
a.load'd',a.load'D'return function(ah,ai)local aj,ak,al=ai:Section{Side='Left'},
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
GetSelectedDifficulty())end)ap()end)end end function a.L()local aa,ab,ac,ad,ae,
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
'Could not read inventory'end local aC,aD,aE,aF={},{},function(aC)return aC.
sellPrice~=nil or aC.UniqueItemID~=nil or aC.rarity~=nil end,function(aC)local
aD=tostring(aC)local aE=tonumber(aD:match'_(%d+)$')if not aE then return nil,nil
end local aF=aD:match'^(.-)_%d+$'return aF,aE end local aG=function(aG,aH,aI,aJ)
local aK=false if type(aG.equipped)=='boolean'then aK=aG.equipped elseif type(aG
.equipped)=='table'then for aL,aM in pairs(aG.equipped)do if aM==true then aK=
true break end end end local aL=au(aG.rarity)or'Common'table.insert(aC,{Type=an[
aH]or aH or'Unknown',Category=aI or aH,Index=aJ,Name=tostring(aG.name or aG.
UniqueItemID or'?'),Rarity=aL,RarityValue=ar[aL],SellPrice=tonumber(aG.sellPrice
)or 0,UniqueItemID=aG.UniqueItemID,Equipped=aK,LevelReq=tonumber(aG.levelReq)or
0,Raw=aG})end local function aH(aI,aJ,aK,aL)if type(aI)~='table'then return end
if aD[aI]then return end aD[aI]=true if aE(aI)then aG(aI,aJ,aK,aL)return end for
aM,aN in pairs(aI)do if an[aM]then aH(aN,aM,nil,nil)elseif type(aN)=='table'and
aE(aN)then local aO,aP=aF(aM)aH(aN,aJ,aO,aP)else aH(aN,aJ,aK,aL)end end end aH(
aB,nil,nil,nil)return aC end function ae.ShouldSellItem(az)if not az then return
false end if ah and az.Equipped then return false end if next(ai)and as[az.
Rarity]and not ai[az.Rarity]then return false end if next(aj)and az.Type and not
aj[az.Type]then return false end local aA,aB=ak,al if next(aA)==nil then aA={[1]
=true}aB='None'end local aC=az.LevelReq or 0 if aB=='Below'then local aD for aE
in pairs(aA)do if not aD or aE>aD then aD=aE end end if aD and aC>aD then return
false end elseif aB=='Above'then local aD for aE in pairs(aA)do if not aD or aE<
aD then aD=aE end end if aD and aC<aD then return false end else if not aA[aC]
then return false end end return true end function ae.HasAnyFilter()return next(
ai)~=nil or next(aj)~=nil or next(ak)~=nil end function ae.CountMatches()local
az,aA=ay()if not az then return{total=0,matching=0,error=aA or
'Error reading inventory'}end local aB,aC=0,{}for aD,aE in ipairs(az)do aC[aE.
Type]=(aC[aE.Type]or 0)+1 if ae.ShouldSellItem(aE)then aB+=1 end end return{
total=#az,matching=aB,byCategory=aC}end function ae.SellItems()if am then return
nil end am=true local az,aA,aB={sold=0,skipped=0,gold=0,error=nil},ay()if not aA
then az.error=aB or'Error reading inventory'am=false return az end local aC={}
for aD,aE in ipairs(aA)do if ae.ShouldSellItem(aE)then if aE.Index then az.sold
+=1 local aF=aE.Category or aE.Type aC[aF]=aC[aF]or{}table.insert(aC[aF],aE.
Index)end else az.skipped+=1 end end local aD,aE=pcall(ax,aC)if aD and aE and
type(aE)=='number'then az.gold=aE end am=false return az end function ae.
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
function a.M()local aa,ab,ac=a.load'd',a.load'L',a.load'c'return function(ad,ae)
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
GetLevelReqMode(),ab.GetLevelReqExactFilter()table.sort(aC,function(aD,aE)return
(tonumber(aD)or 0)<(tonumber(aE)or 0)end)local aD,aE='1 (Safe Fallback)',
'255, 160, 80'if#aC>0 then aE='255, 220, 120'if aB=='Below'then aD=
'Below (\u{2264} '..aC[#aC]..')'elseif aB=='Above'then aD='Above (\u{2265} '..aC
[1]..')'else aD='Exact ('..table.concat(aC,', ')..')'end end pcall(function()am:
UpdateName("Level Req: <font color='rgb("..aE..")'>"..aD..'</font>')end)local aF
=ab.GetExcludeEquipped()local aG,aH=aF and'0, 255, 0'or'255, 80, 80',aF and
'Yes (Protected)'or'No (May Sell)'pcall(function()an:UpdateName(
"Exclude Equipped: <font color='rgb("..aG..")'>"..aH..'</font>')end)end af:
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
end)end)end},{Name='Cancel'}}}end)end}ao()end end function a.N()local aa,ab,ac,
ad,ae,af,ag,ah,ai,aj,ak,al,am,an=a.load'e',a.load'f',{},0.05,0.8,Color3.fromRGB(
0,255,0),'PlayerHitbox_ESP',Color3.fromRGB(255,0,0),'EnemyHitbox_ESP',0.01,
'Real','Custom',false local ao,ap,aq,ar,as,at,au,av=ak,1.5,aa.player,false,ak,
1.5,function(ao,ap,aq)local ar=Instance.new'SelectionBox'ar.Name=ao ar.Adornee=
ap ar.Color3=aq ar.LineThickness=ad*4 ar.SurfaceColor3=aq ar.SurfaceTransparency
=ae ar.Parent=ap end local ax=function(ax,ay,az,aA,aB)if not ay or not ay.Parent
then return end local aC,aD=ax..'_Proxy',ay:FindFirstChild(ax)local aE=ay:
FindFirstChild(aC)if aA==al then if aD and aD:IsA'SelectionBox'and aD.Adornee==
ay then aD:Destroy()end if not aE then aE=Instance.new'Part'aE.Name=aC aE.
Anchored=true aE.CanCollide=false aE.CanQuery=false aE.CanTouch=false aE.
Transparency=1 aE.Parent=ay au(ax,aE,az)end local aF=ay.Size local aG=math.max(
math.abs(aF.X),math.abs(aF.Y),math.abs(aF.Z))local aH=math.max(aG*aB,1)aE.Size=
Vector3.new(aH,aH,aH)aE.CFrame=ay.CFrame else if aE then aE:Destroy()end if aD
and aD:IsA'SelectionBox'and aD.Adornee~=ay then aD:Destroy()aD=nil end if not aD
or not aD:IsA'SelectionBox'or aD.Adornee~=ay then au(ax,ay,az)end end end local
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
:GetDescendants())do local aC,aD=aB:FindFirstChild(ai),aB:FindFirstChild(ai..
'_Proxy')if aC then aC:Destroy()end if aD then aD:Destroy()end end end function
ac.ToggleEnemyHitbox(aC)if aC==ar then return end ar=aC if ar then if av then
task.cancel(av)av=nil end av=task.spawn(function()while ar do local aD,aE=pcall(
aA)if not aD then if os.clock()-(ac.lastEnemyWarn or 0)>5 then ac.lastEnemyWarn=
os.clock()warn('[EnemyHitbox] error:',tostring(aE))end end aa.RunService.
Heartbeat:Wait()end end)else aB()end end function ac.IsEnemyHitboxEnabled()
return ar end function ac.GetEnemyHitboxMode()return as end function ac.
SetEnemyHitboxMode(aC)if aC~=ak and aC~=al then return end as=aC end function ac
.GetEnemyHitboxScale()return at end function ac.SetEnemyHitboxScale(aC)at=aC end
local aC,aD,aE,aF,aG,aH=Color3.fromRGB(255,0,0),'SkillESP',{},false,false local
aI=function()table.clear(aE)local aI=game:GetService'Workspace'for aJ,aK in
ipairs(aI:GetChildren())do aE[aK]=true end aF=true end aI()local aJ,aK=function(
aJ)local aK=aq.Character if not aK then return false end local aL=aJ while aL do
if aL==aK then return true end aL=aL.Parent end return false end,function(aJ)
local aK=aJ while aK do if aE[aK]then return true end aK=aK.Parent end return
false end local aL=function(aL)if not aF then return end if aK(aL)then return
end if aJ(aL)then return end if aL:FindFirstChild(aD)then return end local aM=
Instance.new'SelectionBox'aM.Name=aD aM.Adornee=aL aM.Color3=aC aM.SurfaceColor3
=aC aM.SurfaceTransparency=0.8 aM.Parent=aL end local aM,aN=function()if not aF
then return end local aM=game:GetService'Workspace'for aN,aO in ipairs(aM:
GetChildren())do if aO:IsA'BasePart'then aL(aO)end for aP,aQ in ipairs(aO:
GetDescendants())do if aQ:IsA'BasePart'then aL(aQ)end end end end,function()if
aH then task.cancel(aH)aH=nil end local aM=game:GetService'Workspace'for aN,aO
in ipairs(aM:GetDescendants())do local aP=aO:FindFirstChild(aD)if aP then aP:
Destroy()end end end function ac.ToggleSkillHitbox(aO)if aO==aG then return end
aG=aO if aG then if aH then task.cancel(aH)aH=nil end aH=task.spawn(function()
while aG do local aP,aQ=pcall(aM)if not aP and os.clock()-(ac.lastSkillWarnH or
0)>5 then ac.lastSkillWarnH=os.clock()warn('[SkillHitbox] error:',tostring(aQ))
end task.wait(aj)end end)else aN()end end function ac.IsSkillHitboxEnabled()
return aG end return ac end function a.O()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak
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
'[EnemyESP] recolor error'end end return ac end function a.P()local aa,ab,ac,ad,
ae,af,ag,ah,ai=a.load'e',a.load'b',{},false,{},{},{},2,function(aa)if not aa
then return false end local ab=aa while ab and ab~=workspace do local ac=ab.Name
:lower()if ac:find'stairramp'or ac:find'step'or ac:find'meshes/cylinder'or ac:
find'cylinder'then return true end ab=ab.Parent end return false end local aj=
function(aj)if not ad or not aj or not aj:IsA'BasePart'then return end if ai(aj)
then return end if not af[aj]then af[aj]={CanCollide=aj.CanCollide,CanTouch=aj.
CanTouch}end pcall(function()aj.CanCollide=false aj.CanTouch=false end)end local
ak={['meshes/ice3']=true,['meshes/snow']=true,['invisible platform']=true,part=
true}local al,am,an=function(al)if not al then return true end if al:IsA'Model'
or al:IsA'Folder'then return true end local am=al.Name:lower()if ak[am]or al.
Name=='Meshes/Ice3'or al.Name=='Meshes/Snow'or al.Name=='Invisible platform'or
al.Name=='Part'then return true end return false end,function()if not ad then
return end local al=workspace:FindFirstChild'Map'if not al then return end for
am,an in ipairs(al:GetDescendants())do if(an:IsA'Model'or an:IsA'Folder')and an.
Name:lower():find'border'then for ao,ap in ipairs(an:GetChildren())do pcall(
function()ap:Destroy()end)end end end end,function()if not ad then return end
local al=workspace:FindFirstChild'Map'if not al then return end for am,an in
ipairs(al:GetDescendants())do if an.Name:lower():find'wooden plank'then local ao
=an.Parent while ao and ao~=al and ao~=workspace do if ao:IsA'Model'then pcall(
function()ao:Destroy()end)break end ao=ao.Parent end end end end local ao,ap,aq=
function()if not ad then return end local ao=workspace:FindFirstChild'Map'if not
ao then return end for ap,aq in ipairs(ao:GetChildren())do if not al(aq)then
pcall(function()aq:Destroy()end)end end end,{Vector3.new(-724.4873046875,
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
37.41774368286133,372.6407470703125)},0.2 local ar=function(ar)if not ar then
return false end for as,at in ipairs(ap)do if(ar-at).Magnitude<=aq then return
true end end return false end local as=function(as)if not as or not as:IsA
'Model'or not as.Parent then return false end local at,au=pcall(function()return
as:GetPivot().Position end)if at and au and ar(au)then return true end if as.
PrimaryPart and ar(as.PrimaryPart.Position)then return true end for av,ax in
ipairs(as:GetDescendants())do if ax:IsA'BasePart'and ar(ax.Position)then return
true end end return false end local at,au=function()if not ad then return end
local at=workspace:FindFirstChild'Map'or workspace:FindFirstChild'dungeon'or
workspace:FindFirstChild'Dungeon'if not at then return end for au,av in ipairs(
at:GetDescendants())do if not av.Parent then continue end if av:IsA'Model'then
if as(av)then pcall(function()av:Destroy()end)end elseif av:IsA'BasePart'then if
ar(av.Position)then local ax=av:FindFirstAncestorOfClass'Model'if ax and ax~=
workspace and ax~=at then pcall(function()ax:Destroy()end)else pcall(function()
av:Destroy()end)end end end end end,function(at)if not ad or not at or not at:
IsA'BasePart'then return end if at.Name=='Meshes/Snow'or at.Name:lower():find
'meshes/snow'or at.Name:lower()=='snow'then if ag[at]==nil then ag[at]=at.
Transparency end pcall(function()at.Transparency=1 end)end end local av=function
()if not ad then return end local av=workspace:FindFirstChild'Map'if not av then
return end for ax,ay in ipairs(av:GetDescendants())do if ay:IsA'BasePart'and(ay.
Name=='Meshes/Snow'or ay.Name:lower():find'meshes/snow'or ay.Name:lower()==
'snow')then au(ay)end end end local ax=function()if not ad then return end ao()
am()an()at()av()end local ay,az=function()for ay,az in ipairs(ae)do pcall(
function()az:Disconnect()end)end table.clear(ae)local ay,az=function(ay)if not
ay then return end table.insert(ae,ay.ChildAdded:Connect(function(az)if not ad
then return end if not al(az)then pcall(function()az:Destroy()end)end end))table
.insert(ae,ay.DescendantAdded:Connect(function(az)if not ad then return end if
az.Name:lower():find'wooden plank'then local aA=az.Parent while aA and aA~=ay
and aA~=workspace do if aA:IsA'Model'then pcall(function()aA:Destroy()end)return
end aA=aA.Parent end end local aA=az.Parent while aA and aA~=ay and aA~=
workspace do if(aA:IsA'Model'or aA:IsA'Folder')and aA.Name:lower():find'border'
then pcall(function()az:Destroy()end)break end aA=aA.Parent end if az:IsA'Model'
and as(az)then pcall(function()az:Destroy()end)return elseif az:IsA'BasePart'and
ar(az.Position)then local aB=az:FindFirstAncestorOfClass'Model'if aB and aB~=
workspace and aB~=ay then pcall(function()aB:Destroy()end)else pcall(function()
az:Destroy()end)end return end if az:IsA'BasePart'and(az.Name=='Meshes/Snow'or
az.Name:lower():find'meshes/snow'or az.Name:lower()=='snow')then au(az)end end))
end,workspace:FindFirstChild'Map'or workspace:FindFirstChild'dungeon'or
workspace:FindFirstChild'Dungeon'if az then ay(az)end table.insert(ae,workspace.
ChildAdded:Connect(function(aA)if not ad then return end local aB=aA.Name:lower(
)if aB=='map'or aB=='dungeon'then ay(aA)task.delay(0.2,ax)end end))end,function(
)for ay,az in pairs(ag)do if ay and ay.Parent then pcall(function()ay.
Transparency=az end)end end table.clear(ag)for ay,az in pairs(af)do if ay and ay
.Parent then pcall(function()ay.CanCollide=az.CanCollide ay.CanTouch=az.CanTouch
end)end end table.clear(af)end function ac.Toggle(aA)if aA==ad then return end
ad=aA and true or false if ad then ax()ay()if loopThread then task.cancel(
loopThread)loopThread=nil end loopThread=task.spawn(function()while ad do task.
wait(ah)pcall(ax)end end)else for aB,aC in ipairs(ae)do pcall(function()aC:
Disconnect()end)end table.clear(ae)if loopThread then task.cancel(loopThread)
loopThread=nil end az()end end function ac.IsEnabled()return ad end ab.Register(
function()ac.Toggle(false)end)return ac end function a.Q()local aa,ab,ac,ad,ae,
af,ag=a.load'd',a.load'N',a.load'O',a.load'P',a.load'g',{'Custom Hitbox',
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
function a.R()local aa,ab,ac,ad,ae=a.load'a',a.load'c',a.load'f',a.load'b',game:
GetService'HttpService'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at=aa.
Folder..'/settings/webhook.json',{},'',false,false,false,'',{'Tier6'},{common=
9807270,uncommon=43520,rare=3447003,epic=10181046,legendary=16766720,secret=
15158332,ultimate=15158332,mythic=15158332},{common=1,uncommon=2,rare=3,epic=4,
legendary=5,secret=6,ultimate=6,mythic=6},10181046,{{match='northen',prefix=
'Valhalla'},{match='northern',prefix='Valhalla'}},16766720 local au,av=function(
)local au=ac.GetCurrentDungeonName()if not au or au==''then return nil end local
av=string.lower(au)for ax,ay in ipairs(aq)do if string.find(av,ay.match,1,true)
then return ay.prefix end end return nil end,{legendary=true,secret=true,
ultimate=true,mythic=true}local ax,ay,az,aA=function(ax)if not ax then return
false end if av[tostring(ax.rarity or''):lower()]then return true end local ay=
au()if ay and ay~=''then local az=tostring(ax.itemName or'')return string.sub(az
,1,#ay)==ay end return false end,{'Tier1','Tier2','Tier3','Tier4','Tier5',
'Tier6'},function(ax)local ay=tonumber(tostring(ax or''):match'Tier(%d+)')return
ay or 6 end local aB,aC=function()if aA then return aA end aA={}for aB,aC in
ipairs(am)do aA[az(aC)]=true end return aA end,{uncommon=1,common=2,rare=3,epic=
4,legendary=5,secret=6}local aD,aE,aF,aG=function(aD)if not aD then return nil
end local aE=tonumber(tostring(aD.tier or''):match'tier(%d+)')if aE then return
aE end if aD.secret==true then return 6 end return aC[string.lower(tostring(aD.
rarity or''))]end,function()local aD=game:GetService'Players'.LocalPlayer if not
aD then return'?'end if aD.Name and aD.Name~=''then return aD.Name end return aD
.DisplayName or'?'end,function()local aD=game:GetService'Players'.LocalPlayer if
not aD then return nil end local aE=aD:FindFirstChild'XP'if aE and aE:IsA
'IntValue'then return aE.Value end return nil end local function aH(aI,aJ,aK)aK=
aK or 12 if aK<0 then return nil end local aL=aI:FindFirstChild(aJ)if aL then
return aL end for aM,aN in ipairs(aI:GetChildren())do local aO=aH(aN,aJ,aK-1)if
aO then return aO end end return nil end local aI,aJ=function()local aI=game:
GetService'Players'.LocalPlayer if not aI or not aI:FindFirstChild'PlayerGui'
then return'?'end local aJ=aI.PlayerGui:FindFirstChild'playerStatus'if not aJ
then return'?'end local aK=aH(aJ,'levelBorder')if not aK then return'?'end local
aL=aK:FindFirstChild'level'if aL and aL:IsA'TextLabel'then return aL.Text end
return'?'end,false local aK=function()if aG~=nil or aJ then return end aJ=true
task.spawn(function()local aK=os.clock()+8 while aG==nil and os.clock()<aK do aG
=aF()if aG~=nil then break end task.wait(0.25)end aJ=false end)end local aL,aM=
function()aG=aF()if aG==nil then aK()end ac.SetDungeonStartTime(nil)end,function
()if not ac.GetDungeonStartTime()then ac.SetDungeonStartTime(os.clock())end if
aG==nil then aK()end end local aN,aO,aP,aQ,aR,aS=function()if at then return end
local aN=function(aN)if aN then aL()else aM()end end aN(ac.IsInLobby())at=ac.
OnLobbyChanged(aN)end,function(aN)aN=math.max(0,math.floor(aN or 0))local aO,aP=
math.floor(aN/60),aN%60 return string.format('%d:%02d',aO,aP)end,function()if
not(isfile and isfile(af))then return end local aN,aO=pcall(function()return ae:
JSONDecode(readfile(af))end)if aN and type(aO)=='table'then ah=type(aO.url)==
'string'and aO.url or''ai=aO.enabled==true ak=aO.pingEnabled==true al=type(aO.
pingMention)=='string'and aO.pingMention or''local aP=aO.pingTiers if type(aP)==
'string'then aP={aP}end if type(aP)=='table'then local aQ={}for aR,aS in ipairs(
aP)do if table.find(ay,aS)and not table.find(aQ,aS)then table.insert(aQ,aS)end
end if#aQ>0 then am=aQ end end aA=nil end end,function()if not(isfile and
writefile)then return end pcall(function()writefile(af,ae:JSONEncode{url=ah,
enabled=ai,pingEnabled=ak,pingMention=al,pingTiers=am})end)end,function(aN)local
aO={}for aP,aQ in ipairs(aN or{})do local aR,aS=aQ.itemName or'Unknown',ax(aQ)if
aS then aR='\u{2b50} '..aR end local aT={}if aQ.itemType and aQ.itemType~='gold'
then table.insert(aT,aQ.itemType)end if aQ.rarity then table.insert(aT,aQ.rarity
)end if#aT>0 then table.insert(aO,string.format('%s (%s)',tostring(aR),table.
concat(aT,', ')))else table.insert(aO,tostring(aR))end end return table.concat(
aO,'\n')end,function(aN)if not aN then return false end local aO=aD(aN)if not aO
then return false end return aB()[aO]==true end local aT=function(aT)if not ak
or al==''then return false end for aU,aV in ipairs(aT or{})do if aS(aV)then
return true end end return false end local aU=function(aU,aV)local aW,aX=
tonumber(aU.gold)or 0,{}for aY,aZ in ipairs(aU.items or{})do if aZ.itemName and
aZ.itemName~='gold'then table.insert(aX,aZ)end end local aY,aZ,a_,a0,a1=ap,false
,function(aY,aZ)if aY==nil then return aZ end if aZ==nil then return aY end
return(ao[aY]or 0)>=(ao[aZ]or 0)and aY or aZ end for a2,a3 in ipairs(aX)do local
a4=tostring(a3.rarity or''):lower()if ax(a3)then aZ=true a0=a_(a0,a4)end if an[
a4]~=nil then a1=a_(a1,a4)end end if aZ then aY=a0 and(an[a0]or ar)or ar elseif
a1 then aY=an[a1]end aV=aV or{}local a2,a3=tostring(aV.level or'?'),tonumber(aV.
expGained)local a4,a5,a6=a3 and string.format('+%s XP',tostring(a3))or'?',aO(aV.
duration),{}if a3 then table.insert(a6,a4)end if aW>0 then table.insert(a6,
string.format('+%s gold',tostring(aW)))end local a7,a8=#a6>0 and table.concat(a6
,'  ')or'',#aX>0 and aR(aX)or'None'local a9=a8 if a7~=''then a9=a7..(a8~='None'
and('\n'..a8)or'')end local b,ba={{name='Player',value=string.format(
'%s (lv %s)',aE(),a2),inline=true},{name='Map',value=ac.GetCurrentDungeonName()
or'Unknown',inline=true},{name='Time',value=a5,inline=true},{name='Rewards',
value=a9,inline=false}},'You cleared the dungeon and received your rewards!'if
aT(aX)then ba=ba..'\n\n'..al end return{embeds={{title='Dungeon WIN',description
=ba,color=aY,fields=b,timestamp=DateTime.now():ToIsoDate()}}}end local aV=
function(aV,aW)if ah==''or string.find(ah,'^https://discord%.com/api/webhooks/')
==nil then return false,'Invalid webhook URL'end local aX=aU(aV,aW)local aY,aZ=
pcall(function()return ae:JSONEncode(aX)end)if not aY then return false,
'Could not encode payload'end local a_,a0=pcall(function()return request{Url=ah,
Method='POST',Headers={['Content-Type']='application/json',['User-Agent']=
'ScriptHub-DungeonQuest (https://www.roblox.com)'},Body=aZ}end)if not a_ then
return false,'Request error: '..tostring(a0)end if a0 and a0.Success then return
true end local a1=a0 and a0.StatusCode or'?'return false,'HTTP '..tostring(a1)
end function ag.SetUrl(aW)ah=aW or''aQ()end function ag.GetUrl()return ah end
function ag.SetEnabled(aW)ai=aW==true aQ()end function ag.IsEnabled()return ai
end function ag.SetPingEnabled(aW)ak=aW==true aQ()end function ag.IsPingEnabled(
)return ak end function ag.SetPingMention(aW)al=aW or''aQ()end function ag.
GetPingMention()return al end function ag.SetPingTiers(aW)if type(aW)~='table'
then return end local aX,aY={},{}local aZ=function(aZ)if not aY[aZ]and table.
find(ay,aZ)then aY[aZ]=true table.insert(aX,aZ)end end for a_,a0 in pairs(aW)do
if type(a_)=='string'and a0==true then aZ(a_)elseif type(a0)=='string'then aZ(a0
)end end if#aX==0 then return end am=aX aA=nil aQ()end function ag.GetPingTiers(
)return am end function ag.GetPingTierOptions()return ay end function ag.Send()
if not ai then ab.Notify('Webhook','Notifications is disabled',3)return end
local aW,aX=aV({items={{itemName='Test Reward',rarity='common',itemType='item'}}
,gold=0},{level=aI(),expGained=0,duration=0})if aW then ab.Notify('Webhook',
'Test sent successfully',3)else ab.Notify('Webhook','Send failed: '..tostring(aX
),4)end end function ag.Init()if aj then return end local aW local aX=pcall(
function()aW=game:GetService'ReplicatedStorage':WaitForChild('remotes',30)end)if
not aX or not aW then warn'[Webhook] Could not find ReplicatedStorage.remotes'
return end local aY=aW:FindFirstChild'cloneRewardGui'if not aY then warn
'[Webhook] Could not find remote cloneRewardGui'return end as=aY.OnClientEvent:
Connect(function(aZ)if not ai then return end aK()local a_=ac.
GetDungeonStartTime()and ac.GetDungeonElapsed()or 0 task.spawn(function()task.
wait(1.5)local a0,a1=(aF())if aG~=nil and a0~=nil then a1=math.max(0,a0-aG)end
local a2,a3=aV(aZ,{level=aI(),expGained=a1,duration=a_})if not a2 then ab.
Notify('Webhook WIN','Send failed: '..tostring(a3),4)end end)end)aj=true ab.
Notify('Webhook','Webhook notifications ready',2)aN()end aP()ad.Register(
function()if as then as:Disconnect()as=nil end if at then at()at=nil end aj=
false end)return ag end function a.S()local aa=a.load'R'return function(ab,ac)
local ad=ac:Section{Side='Right'}ad:Header{Name='Discord Webhook'}ad:Input{Name=
'Webhook URL',Placeholder='https://discord.com/api/webhooks/...',
AcceptedCharacters='All',Default=aa.GetUrl(),Callback=function(ae)aa.SetUrl(ae)
end}ad:Toggle({Name='Enable Notifications',Default=aa.IsEnabled(),Callback=
function(ae)aa.SetEnabled(ae)end},'Toggle_Webhook')ad:Button{Name=
'Send Test Notification',Callback=function()aa.Send()end}local ae=ac:Section{
Side='Right'}ae:Header{Name='Ping on Drops'}ae:Toggle({Name='Enable Ping',
Default=aa.IsPingEnabled(),Callback=function(af)aa.SetPingEnabled(af)end},
'Toggle_Ping')ae:Input{Name='Mention (User/Role ID)',Placeholder=
'<@123456789012345678>',AcceptedCharacters='All',Default=aa.GetPingMention(),
Callback=function(af)aa.SetPingMention(af)end}ae:Dropdown{Name='Ping Tier',Multi
=true,Required=false,Options=aa.GetPingTierOptions(),Default=aa.GetPingTiers(),
Callback=function(af)aa.SetPingTiers(af)end}ae:Label{Text=
[[Ping triggers when a reward item matches any selected Tier (multi-select, Secret = Tier6).]]
}end end function a.T()local aa={}function aa.Apply(ab,ac,ad)for ae,af in pairs(
ab)do if ad and table.find(ad,ae)then continue end pcall(function()ac[ae]=af end
)end return ac end function aa.Wrap(ab,ac,ad,ae)local af={}setmetatable(af,{
__index=function(ag,ah)if ab[ah]~=nil then return ab[ah]elseif ae then local ai,
aj=pcall(function()return ae[ah]end)if ai then return aj end end return end,
__newindex=function(ag,ah,ai)local aj=ac[ah]if aj then aj(ai)if not(ad and table
.find(ad,ah))then ab[ah]=ai end elseif ae then local ak,al=pcall(function()ae[ah
]=ai end)if not ak then ab[ah]=ai end else ab[ah]=ai end end})return af end
return aa end function a.U()local aa,ab,ac,ad,ae,af=a.load'T',game:GetService
'VirtualUser',{},false,60 local ag=function()pcall(function()ab:
CaptureController()ab:Button1Down(Vector2.new(0,0))ab:Button1Up(Vector2.new(0,0)
)ab:Button2Down(Vector2.new(0,0))ab:Button2Up(Vector2.new(0,0))end)end local ah=
function()while ad do ag()local ah=ae while ah>0 and ad do local ai=math.min(ah,
0.5)task.wait(ai)ah-=ai end end af=nil end function ac.Start()if ad or af then
return end ad=true task.spawn(ag)af=task.spawn(ah)end function ac.Stop()ad=false
end function ac.IsEnabled()return ad end function ac.SetInterval(ai)ai=tonumber(
ai)if ai and ai>0 then ae=ai else ae=60 end end function ac.GetInterval()return
ae end return(aa.Wrap(ac,{Enabled=function(ai)if ai then ac.Start()else ac.Stop(
)end end,Interval=function(ai)ac.SetInterval(ai)end}))end function a.V()local aa
,ab,ac=a.load'd',a.load'g',a.load'U'return function(ad,ae)local af=ae:Section{
Side='Left'}af:Header{Name='Anti AFK'}af:Toggle({Name='Anti AFK',Default=ac.
IsEnabled(),Callback=aa.Wrap(function(ag)if ag then ac.Start()else ac.Stop()end
end)},'Toggle_AntiAFK')ab.PatchSliderLoadCallback(af:Slider({Name=
'Interval (gi\u{e2}y)',Default=ac.GetInterval(),Minimum=5,Maximum=300,
DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(ag)ac.SetInterval(ag
)end)},'Slider_AntiAFKInterval'))end end function a.W()return function(aa,ab)a.
load'Q'(aa,ab)a.load'S'(aa,ab)a.load'V'(aa,ab)end end function a.X()local aa,ab,
ac=a.load'a',a.load'c',game:GetService'HttpService'local ad,ae,af,ag=aa.Folder..
'/settings/autohide.json',{},false local ah,ai=function()if not(isfile and
isfile(ad))then return end local ah,ai=pcall(function()return ac:JSONDecode(
readfile(ad))end)if ah and type(ai)=='table'then af=ai.enabled==true end end,
function()if not(isfile and writefile)then return end pcall(function()writefile(
ad,ac:JSONEncode{enabled=af})end)end function ae.SetWindow(aj)ag=aj end function
ae.SetEnabled(aj)af=aj==true ai()end function ae.IsEnabled()return af end
function ae.Hide()if not af or not ag then return end local aj=pcall(function()
ag:SetState(false)end)if not aj then warn
'[AutoHide] Kh\u{f4}ng \u{1ea9}n \u{111}\u{1b0}\u{1ee3}c window'end end function
ae.Execute()if not af then return end task.spawn(function()task.wait(0.5)ae.
Hide()end)end ah()return ae end function a.Y()local aa,ab,ac=a.load'a',a.load'd'
,a.load'X'return function(ad,ae)local af=aa.Folder local ag=af..
'/settings/autoload.txt'local ah,ai,aj=function()if isfile and isfile(ag)then
return readfile(ag)end return nil end,function(ah)ab.SetActive(ah)local ai=a.
load'r'ai.LoadData(aa.contextData)end,ae:Section{Side='Left'}aj:Header{Name=
'Configs'}local ak,al,am local an=function(an)local ao=aa:RefreshConfigList()al:
ClearOptions()al:InsertOptions(ao)if an then if not al:IsOption(an)then al:
InsertOptions{an}end al:UpdateSelection(an)end end aj:Input{Name='Config Name',
Placeholder='Name',AcceptedCharacters='All',Callback=function(ao)ak=ao end}al=aj
:Dropdown{Name='Select Config',Multi=false,Required=false,Options=aa:
RefreshConfigList(),Callback=function(ao)ai(ao)end}local ao=ah()if ao and ao~=''
then if not al:IsOption(ao)then al:InsertOptions{ao}end al:UpdateSelection(ao)
ai(ao)end aj:Button{Name='Create Config',Callback=function()if not ak or string.
gsub(ak,' ','')==''then ad:Notify{Title='Interface',Description=
'Config name cannot be empty.'}return end local ap,aq=aa:SaveConfig(ak)if not ap
then ad:Notify{Title='Interface',Description='Unable to save config: '..
tostring(aq)}return end ad:Notify{Title='Interface',Description=string.format(
'Created config %q',ak)}an(ak)ai(ak)end}aj:Button{Name='Load Config',Callback=
function()local ap=al.Value local aq,ar=aa:LoadConfig(ap)if not aq then ad:
Notify{Title='Interface',Description='Unable to load config: '..tostring(ar)}
return end ad:Notify{Title='Interface',Description=string.format(
'Loaded config %q',ap)}ai(ap)end}aj:Button{Name='Overwrite Config',Callback=
function()local ap=al.Value local aq,ar=aa:SaveConfig(ap)if not aq then ad:
Notify{Title='Interface',Description='Unable to overwrite config: '..tostring(ar
)}return end ad:Notify{Title='Interface',Description=string.format(
'Overwrote config %q',ap)}ai(ap)end}aj:Button{Name='Set as autoload',Callback=
function()local ap=al.Value if not ap then ad:Notify{Title='Interface',
Description='Please select a config first.'}return end writefile(ag,ap)am:
UpdateName('Autoload config: '..ap)ad:Notify{Title='Interface',Description=
string.format('Set %q as autoload',ap)}ai(ap)end}aj:Button{Name=
'Refresh Config List',Callback=function()an(al.Value)end}am=aj:Label{Text=
'Autoload config: None'}local ap=ah()if ap and ap~=''then am:UpdateName(
'Autoload config: '..ap)end aj:Header{Name='Auto Hide UI'}aj:Toggle({Name=
'Hide window after execute',Default=ac.IsEnabled(),Callback=function(aq)ac.
SetEnabled(aq)end},'Toggle_AutoHide')aj:Label{Text=
'Press RightControl to show the window again.'}end end function a.Z()local aa,ab
,ac,ad,ae,af=a.load'f',a.load'J','Boss Active','Boss','Dungeon','Time Left'
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
end end end}end end function a._()return function(aa,ab)a.load'Y'(aa,ab)a.load
'Z'(aa,ab)end end function a.aa()local aa,ab,ac=a.load'e',a.load'a',a.load'd'
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
end return au.Unit end local az,aA,aB,aC,aD,aE=function(az)if type(az)~='table'
then return nil end local aA={}for aB,aC in ipairs(az.dwells or{})do local aD=
av(aC.pos)if aD then aA[#aA+1]={pos=aD,dur=tonumber(aC.dur)or 0,facing=ay(aC.
facing)}end end local aB={}for aC,aD in ipairs(az.skills or{})do local aE=av(aD.
pos)if aE then aB[#aB+1]={pos=aE,facing=ay(aD.facing),key=aD.key,dw=math.floor(
tonumber(aD.dw)or 0),dwT=tonumber(aD.dwT)or 0}end end if#aA==0 and#aB==0 then
return nil end return{dwells=aA,skills=aB}end,function()if an then return end an
=true if al then ar()local az=aq()if isfolder'DQMacro'and listfiles then pcall(
function()local aA=listfiles'DQMacro'if type(aA)=='table'then for aB,aC in
ipairs(aA)do if type(aC)=='string'and string.lower(string.sub(aC,-5))=='.json'
and isfile(aC)then local aD=string.match(aC,'([^/\\]+)$')or'unknown.json'local
aE,aF=az..'/'..aD,readfile(aC)writefile(aE,aF)delfile(aC)end end end end)end if
listfiles and isfolder(az)then local aA,aB=pcall(function()return listfiles(az)
end)if aA and type(aB)=='table'then for aC,aD in ipairs(aB)do if type(aD)==
'string'and string.lower(string.sub(aD,-5))=='.json'then pcall(function()if
isfile(aD)then local aE=readfile(aD)local aF=ad:JSONDecode(aE)if type(aF)==
'table'and type(aF.map)=='string'and type(aF.rooms)=='table'then am[aF.map]=aF
end end end)end end end end local aA=ab.contextData if type(aA)=='table'and
type(aA[ag])=='table'then local aB,aC=aA[ag],false for aD,aE in pairs(aB)do if
type(aD)=='string'and type(aE)=='table'then if not am[aD]then am[aD]=aE end
pcall(function()writefile(at(aD),ad:JSONEncode(aE))end)aC=true end end if aC
then aA[ag]=nil ac.Save()end end else local az=ab.contextData if type(az)==
'table'and type(az[ag])=='table'then for aA,aB in pairs(az[ag])do if type(aA)==
'string'and type(aB)=='table'then am[aA]=aB end end end end end,0.1,0.82,0.3,
function(az,aA)local aB,aC=az.X-aA.X,az.Z-aA.Z return math.sqrt(aB*aB+aC*aC)end
function ae.SimplifyPath(aF,aG)local aH=#aF if aH<=2 then return aF end local aI
={}for aJ=1,aH do aI[aJ]=false end aI[1]=true aI[aH]=true local aJ={1}for aK=2,
aH-1 do local aL,aM,aN=aF[aK-1],aF[aK],aF[aK+1]local aO,aP=aM.X-aL.X,aM.Z-aL.Z
local aQ,aR,aS=math.sqrt(aO*aO+aP*aP),aN.X-aM.X,aN.Z-aM.Z local aT=math.sqrt(aR*
aR+aS*aS)if aQ>=aD and aT>=aD then local aU=(aO*aR+aP*aS)/(aQ*aT)if aU<aC then
aI[aK]=true table.insert(aJ,aK)end end end table.insert(aJ,aH)local aK,aL=aG*aG,
{}for aM=1,#aJ-1 do local aN,aO=aJ[aM],aJ[aM+1]if aO-aN>1 then table.insert(aL,{
aN,aO})end end while#aL>0 do local aM=table.remove(aL)local aN,aO=aM[1],aM[2]
local aP,aQ,aR,aS=aF[aN].X,aF[aN].Z,aF[aO].X,aF[aO].Z local aT,aU=aR-aP,aS-aQ
local aV,aW,aX=aT*aT+aU*aU,-1,0 for aY=aN+1,aO-1 do local aZ=0 if aV>0 then aZ=(
(aF[aY].X-aP)*aT+(aF[aY].Z-aQ)*aU)/aV aZ=math.clamp(aZ,0,1)end local a_,a0=aF[aY
].X-(aP+aT*aZ),aF[aY].Z-(aQ+aU*aZ)local a1=a_*a_+a0*a0 if a1>aW then aW=a1 aX=aY
end end if aX>0 and aW>aK then aI[aX]=true table.insert(aL,{aN,aX})table.insert(
aL,{aX,aO})end end local aM={}for aN=1,aH do if aI[aN]and(#aM==0 or aE(aM[#aM],
aF[aN])>=aB or aN==aH)then table.insert(aM,aF[aN])end end if#aM==1 then table.
insert(aM,aF[aH])end return aM end function ae.OnChanged(aF)if type(aF)~=
'function'then return function()end end table.insert(ao,aF)return function()for
aG,aH in ipairs(ao)do if aH==aF then table.remove(ao,aG)break end end end end
function ae.HasMap(aF)if type(aF)~='string'or#aF==0 then return false end aA()
local aG=am[aF]if not aG or type(aG.rooms)~='table'then return false end for aH,
aI in pairs(aG.rooms)do if ax(aI)and#aI.points>0 then return true end end return
false end local aF=function(aF)if not aF or type(aF)~='table'or type(aF.points)
~='table'then return nil end local aG={}for aH,aI in ipairs(aF.points)do local
aJ=av(aI)if aJ then aG[#aG+1]=aJ end end if#aG==0 then return nil end return{
startPos=av(aF.startPos)or aG[1],points=aG,events=aF.events and az(aF.events)or
nil,speed=tonumber(aF.speed)or 0}end function ae.GetRoomSegment(aG,aH)if type(aG
)~='string'or type(aH)~='number'then return nil end aA()local aI=am[aG]if not aI
or type(aI.rooms)~='table'then return nil end local aJ=aI.rooms[tostring(aH)]if
not ax(aJ)then return nil end local aK={}for aL,aM in ipairs(aJ.points)do local
aN=av(aM)if aN then aK[#aK+1]=aN end end if#aK==0 then return nil end local aL,
aM={startPos=av(aJ.startPos)or aK[1],points=aK,events=aJ.events and az(aJ.events
)or nil,speed=tonumber(aJ.speed)or 0,boss=aJ.boss==true},{}if type(aJ.phases)==
'table'and#aJ.phases>0 then for aN,aO in ipairs(aJ.phases)do local aP=aF(aO)if
aP then aP.boss=aJ.boss==true aM[#aM+1]=aP end end end if#aM==0 then aM[1]=aL
end aL.phases=aM return aL end function ae.HasSegmentOrMacro(aG,aH)return ae.
GetRoomSegment(aG,aH)~=nil end function ae.GetMap(aG)if not ae.HasMap(aG)then
return nil end aA()local aH=am[aG]if not aH then return nil end local aI={}for
aJ,aK in pairs(aH.rooms or{})do local aL=tonumber(aJ)if aL and ax(aK)then local
aM=ae.GetRoomSegment(aG,aL)if aM then aI[aL]=aM end end end return{map=aG,
version=aH.version,rooms=aI,created=aH.created,updated=aH.updated,mode=ak(aH.
mode)}end function ae.GetMaps()aA()local aG={}for aH,aI in pairs(am)do if type(
aH)=='string'and type(aI)=='table'and aI.map==aH and type(aI.rooms)=='table'then
local aJ,aK,aL,aM=0,0,0,0 for aN,aO in pairs(aI.rooms)do if tonumber(aN)~=nil
and ax(aO)then aJ+=1 if aO.boss==true then aK+=1 end aL+=#aO.points if type(aO.
phases)=='table'and#aO.phases>0 then aM+=#aO.phases for aP,aQ in ipairs(aO.
phases)do if aQ~=aO and type(aQ.points)=='table'then aL+=#aQ.points end end else
aM+=1 end end end if aJ>0 then table.insert(aG,{map=aH,roomCount=aJ,bossCount=aK
,pointCount=aL,phaseCount=aM,updated=aI.updated,mode=ak(aI.mode)})end end end
table.sort(aG,function(aH,aI)return aH.map<aI.map end)return aG end function ae.
Count()return#ae.GetMaps()end function ae.SaveSegment(aG,aH,aI,aJ,aK,aL,aM,aN)if
type(aG)~='string'or#aG==0 then return false end if type(aH)~='number'or aH<=0
then return false end if not aI or not aJ or#aJ==0 then return false end aA()
local aO=am[aG]if not aO or type(aO)~='table'then aO={map=aG,version=ah,created=
os.time(),updated=os.time(),mode=ai,rooms={}}am[aG]=aO end if type(aO.rooms)~=
'table'then aO.rooms={}end local aP={}for aQ,aR in ipairs(aJ)do aP[#aP+1]=au(aR)
end local aQ={startPos=au(aI)or aP[1],points=aP}if aM then aQ.boss=true end if
type(aL)=='number'and aL>0 then aQ.speed=aL end local aR=function(aR)if not aR
or type(aR)~='table'then return nil end local aS,aT=#(aR.dwells or{}),#(aR.
skills or{})if aS==0 and aT==0 then return nil end local aU={dwells={},skills={}
}for aV,aW in ipairs(aR.dwells or{})do aU.dwells[#aU.dwells+1]={pos=au(aW.pos),
dur=aW.dur or 0,facing=aW.facing}end for aV,aW in ipairs(aR.skills or{})do aU.
skills[#aU.skills+1]={pos=au(aW.pos),facing=aW.facing,key=aW.key,dw=aW.dw or 0,
dwT=aW.dwT or 0}end return aU end if aK and type(aK)=='table'then local aS=aR(aK
)if aS then aQ.events=aS end end if type(aN)=='table'and#aN>0 then local aS={}
for aT,aU in ipairs(aN)do if aU and aU.points and#aU.points>0 then local aV={}
for aW,aX in ipairs(aU.points)do aV[#aV+1]=au(aX)end local aW={startPos=au(aU.
startPos)or aV[1],points=aV,speed=type(aU.speed)=='number'and aU.speed>0 and aU.
speed or nil,events=aR(aU.events)}aS[#aS+1]=aW end end if#aS>0 then aQ.phases=aS
end end aO.rooms[tostring(aH)]=aQ aO.version=ah aO.map=aG aO.updated=os.time()if
al then ar()pcall(function()writefile(at(aG),ad:JSONEncode(aO))end)else local aS
=ab.contextData if type(aS)=='table'then if not aS[ag]then aS[ag]={}end aS[ag][
aG]=aO ac.Save()end end ap()return true end function ae.GetMapMode(aG)if type(aG
)~='string'or#aG==0 then return ai end aA()local aH=am[aG]if type(aH)~='table'
then return ai end return ak(aH.mode)end function ae.SetMapMode(aG,aH)if type(aG
)~='string'or#aG==0 then return false end local aI=ak(aH)aA()local aJ=am[aG]if
not aJ or type(aJ)~='table'then aJ={map=aG,version=ah,created=os.time(),updated=
os.time(),mode=ai,rooms={}}am[aG]=aJ end aJ.mode=aI aJ.map=aG aJ.updated=os.
time()if al then ar()pcall(function()writefile(at(aG),ad:JSONEncode(aJ))end)else
local aK=ab.contextData if type(aK)=='table'then if not aK[ag]then aK[ag]={}end
aK[ag][aG]=aJ ac.Save()end end ap()return true end function ae.RemoveMap(aG)aA()
if not am[aG]then return false end am[aG]=nil if al then local aH=at(aG)pcall(
function()if isfile(aH)then delfile(aH)end end)else local aH=ab.contextData if
type(aH)=='table'and aH[ag]then aH[ag][aG]=nil ac.Save()end end ap()return true
end function ae.ClearAll()aA()if next(am)==nil then return end local aG=aq()if
al and isfolder(aG)and listfiles then pcall(function()local aH=listfiles(aG)if
type(aH)=='table'then for aI,aJ in ipairs(aH)do if type(aJ)=='string'and string.
lower(string.sub(aJ,-5))=='.json'and isfile(aJ)then delfile(aJ)end end end end)
end table.clear(am)local aH=ab.contextData if type(aH)=='table'and aH[ag]then aH
[ag]=nil ac.Save()end ap()end function ae.ReloadFromDisk()table.clear(am)an=
false aA()ap()end function ae.ReloadFromConfig()ae.ReloadFromDisk()end return ae
end function a.ab()local aa,ab,ac,ad=a.load'e',a.load'f',a.load'aa',a.load'c'
local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq=aa.RunService,aa.player,aa.
UserInputService,0.1,8000,0.4,0.1,0.15,1,6,{},true,true function ao.SetCapture(
ar)ar=ar and true or false ap=ar aq=ar end function ao.IsCaptureEnabled()return
ap or aq end local ar,as,at,au,av,ax,ay,az,aA,aB,aC,aD,aE,aF,aG,aH,aI,aJ,aK,aL,
aM,aN,aO,aP,aQ,aR,aS,aT,aU,aV,aW,aX=false,0,{},0,{},{},0,false,0,0,false,false,
false,{},0,0,0,{}local aY,aZ=function()local aY={recording=ar,map=aK,room=as,
pointCount=#at,phaseCount=#aF+1,dwellCount=#av,skillCount=#ax,savedRooms=aG}for
aZ,a_ in ipairs(aJ)do pcall(a_,aY)end end,function()local aY=af and af.Character
local aZ=aY and aY:FindFirstChild'HumanoidRootPart'if aZ and aZ.Parent then
return aZ end return nil end local a_,a0,a1,a2=function()local a_=aZ()if not a_
then return nil end local a0=a_.CFrame.LookVector if a0.Magnitude<0.001 then
return nil end return{X=a0.X/a0.Magnitude,Z=a0.Z/a0.Magnitude}end,function()if
aM then aM:Disconnect()aM=nil end if aN then aN:Disconnect()aN=nil end if aO
then aO()aO=nil end if aP then aP()aP=nil end if aQ then aQ()aQ=nil end if aR
then aR()aR=nil end end,function(a_)at={a_}av={}ax={}aS=nil ay=0 aT=nil aU=nil
aV=nil aW=a_ aA=0 aB=0 au=os.clock()aX=os.clock()az=false end,function()aK=nil
as=0 aL=nil at={}av={}ax={}aS=nil ay=0 aT=nil aU=nil aV=nil aW=nil az=false aA=0
aB=0 aX=nil aD=false aE=false aC=false aG=0 aH=0 aI=0 end local a3,a4,a5=
function(a3,a4)as=a3 aL=a4 aE=true a1(a4)aD=ab.IsBossActive()aF={}end,function(
a3)if not aE then return false end local a4=ac.SimplifyPath(at,aj)if#a4>=2 then
local a5 if#av>0 or#ax>0 then a5={dwells=av,skills=ax}end local a6=0 if aB>0.5
and aA>5 then a6=math.clamp(aA/aB,5,100)end table.insert(aF,{startPos=aL,points=
a4,events=a5,speed=a6})aI+=#at end aL=a3 a1(a3)aY()return true end,function(a3,
a4)if not aE then return nil end local a5=ac.SimplifyPath(at,aj)if#a5>=2 then
local a6 if#av>0 or#ax>0 then a6={dwells=av,skills=ax}end local a7=0 if aB>0.5
and aA>5 then a7=math.clamp(aA/aB,5,100)end table.insert(aF,{startPos=aL,points=
a5,events=a6,speed=a7})aI+=#at end if#aF==0 then return nil end local a6=aF[1]
local a7=ac.SaveSegment(aK,as,a6.startPos,a6.points,a6.events,a6.speed,aD,aF)if
not a7 then return nil end aG+=1 if aD then aH+=1 end if not a4 then local a8=''
if#aF>1 then a8=(
' (%d phases/m\u{1ea1}ng h\u{1ed3}i sinh, %d \u{111}i\u{1ec3}m phase 1)'):
format(#aF,#a6.points)elseif a6.events then a8=(
' (%d \u{111}i\u{1ec3}m m\u{1ecb}n, %d skill, %d nh\u{1ecb}p d\u{1eeb}ng, %.1fspd)'
):format(#a6.points,#(a6.events.skills or{}),#(a6.events.dwells or{}),a6.speed
or 0)else a8=(' (%d \u{111}i\u{1ec3}m m\u{1ecb}n, %.1fspd)'):format(#a6.points,
a6.speed or 0)end ad.Notify('Path Record',(
'\u{110}\u{e3} l\u{1b0}u room %d%s v\u{e0}o map [%s] %s'):format(as,a8,aK,a3 and
('- '..a3)or''),3)end return{phaseCount=#aF,phase1=a6}end function ao.
IsRecording()return ar end function ao.GetStartRoom()return as end function ao.
GetCurrentPhaseIndex()return#aF+1 end function ao.GetCurrentPoints()return at
end function ao.GetRoomPhases()return aF end function ao.GetCurrentDwells()
return av end function ao.GetCurrentSkills()return ax end function ao.GetStatus(
)return{recording=ar,map=aK,room=as,pointCount=#at,dwellCount=#av,skillCount=#ax
,phaseCount=#aF+1,savedRooms=aG}end function ao.OnStatusChanged(a6)if type(a6)~=
'function'then return function()end end table.insert(aJ,a6)return function()for
a7,a8 in ipairs(aJ)do if a8==a6 then table.remove(aJ,a7)break end end end end
function ao.Start()if ar then return false,'\u{111}ang record r\u{1ed3}i'end
local a6=aZ()if not a6 then return false,
'ch\u{1b0}a c\u{f3} nh\u{e2}n v\u{1ead}t'end if ab.IsDead()then return false,
'nh\u{e2}n v\u{1ead}t \u{111}ang ch\u{1ebf}t'end local a7=ab.
GetCurrentRoomIndex()if a7<=0 then return false,
'kh\u{f4}ng n\u{1eb1}m trong dungeon'end local a8=ab.GetCurrentDungeonName()if
not a8 or#a8==0 then return false,
'kh\u{f4}ng x\u{e1}c \u{111}\u{1ecb}nh \u{111}\u{1b0}\u{1ee3}c map'end aC=ac.
GetMapMode(a8)=='full'if ab.IsBossActive()and not aC then return false,
'boss room (d\u{f9}ng Hazard Scanner)'end aK=a8 a3(a7,a6.Position)ar=true aG=0
aH=0 aI=0 aM=ae.Heartbeat:Connect(function()if not ar then return end if ab.
IsDead()then aT=nil aS=nil aW=nil return end local a9=aZ()if not a9 then return
end local b,ba=a9.Position,at[#at]if ba and(b-ba).Magnitude>35 then a5(
'd\u{1ecb}ch chuy\u{1ec3}n l\u{1edb}n',true)local bb=ab.GetCurrentRoomIndex()if
bb==as then bb=0 end a3(bb,b)aY()task.spawn(function()task.wait(an)if ar and as
<=0 then ao.Stop'h\u{1ebf}t map'end end)return end local bb,bc=os.clock(),aW and
(b-aW).Magnitude or 0 aW=b local bd=aX and math.max(0,bb-aX)or 0 aX=bb if bc>=al
then aA+=bc aB+=bd end if ap then if bc<al then if not aT then aT=bb aU=b aV=a_(
)end if aS then aS.dur=bb-aT aS.facing=a_()or aV elseif bb-aT>=ak then ay=aT-au
aS={pos=aU,dur=bb-aT,facing=aV,index=#av+1}table.insert(av,aS)end else aT=nil aS
=nil end end local be=at[#at]if be and(b-be).Magnitude<ah then return end if#at
>=ai then ao.Stop'\u{111}\u{1ea1}t gi\u{1edb}i h\u{1ea1}n \u{111}i\u{1ec3}m'
return end table.insert(at,b)end)if aq then aN=ag.InputBegan:Connect(function(a9
,b)if not ar or not aq then return end if ag:GetFocusedTextBox()then return end
if ab.IsDead()then return end local ba if a9.UserInputType==Enum.UserInputType.
MouseButton2 then if b then return end ba='QE'elseif a9.UserInputType==Enum.
UserInputType.Keyboard and(a9.KeyCode==Enum.KeyCode.Q or a9.KeyCode==Enum.
KeyCode.E)then ba=a9.KeyCode==Enum.KeyCode.Q and'Q'or'E'else return end local bb
=aZ()if not bb then return end local bc=bb.AssemblyLinearVelocity or bb.Velocity
local bd=bc and Vector3.new(bc.X,0,bc.Z).Magnitude or 0 local be=(aT~=nil)or(bd<
1)if ap and be then if not aT then local bf=os.clock()aT=bf aU=bb.Position aV=
a_()end if not aS then ay=aT-au aS={pos=aU or bb.Position,dur=math.max(0.1,os.
clock()-aT),facing=aV or a_(),index=#av+1}table.insert(av,aS)end end local bf={
pos=(aS and be and aS.pos)or bb.Position,facing=a_(),key=ba,dw=0,dwT=0}if aS and
be then bf.dw=aS.index bf.dwT=math.max(0,(os.clock()-au)-ay)aS.facing=bf.facing
or aS.facing end table.insert(ax,bf)end)end aO=ab.OnRoomIndexChanged(function()
if ar then local a9=ab.GetCurrentRoomIndex()if aE and as<=0 and a9>0 then as=a9
return end if a9~=as and not az then az=true task.delay(am,function()az=false if
ar then ao.Rollover()end end)end end end)aQ=ab.OnBossActiveChanged(function(a9)
if not ar then return end if a9 then if aC then aD=true else ao.Stop
'v\u{e0}o boss room'end return end if aC and aD then a5('xong boss',true)aD=
false aE=false task.spawn(function()task.wait(an)if ar and not aE then ao.Stop
'h\u{1ebf}t map'end end)end end)aP=ab.OnLobbyChanged(function(a9)if ar and a9
then ao.Stop'v\u{1ec1} lobby'end end)aR=ab.OnRespawn(function()if not ar then
return end task.delay(0.2,function()if not ar or ab.IsDead()then return end
local a9=aZ()if not a9 then return end if a4(a9.Position)then local b=#aF+1 ad.
Notify('Path Record',(
'H\u{1ed3}i sinh: \u{110}\u{e3} l\u{1b0}u Phase %d, \u{111}ang ghi ti\u{1ebf}p Phase %d cho room %d'
):format(b-1,b,as),3)end end)end)ad.Notify('Path Record',(
'B\u{1eaf}t \u{111}\u{1ea7}u record room %d (%s)'):format(a7,a8),2)aY()return
true end function ao.Rollover()if not ar then return false end a5(
'chuy\u{1ec3}n room',true)local a6=aZ()local a7=a6 and a6.Position or aL a3(ab.
GetCurrentRoomIndex(),a7)aY()return true end function ao.Stop(a6)if not ar then
return false end ar=false a0()local a7=a5(a6,true)if a7 then if aG>1 then local
a8=aH>0 and(' | %d boss'):format(aH)or''ad.Notify('Path Record',(
'\u{110}\u{e3} l\u{1b0}u map [%s] %s: %d room%s (%d \u{111}i\u{1ec3}m g\u{1ed1}c)'
):format(aK,a6 or'xong',aG,a8,aI),4)else local a8,a9='',a7.phase1 if a9 and a9.
events then a8=(' (%d skill, %d nh\u{1ecb}p d\u{1eeb}ng, %.1fspd)'):format(#(a9.
events.skills or{}),#(a9.events.dwells or{}),a9.speed or 0)elseif a9 then a8=(
' (%.1fspd)'):format(a9.speed or 0)end local b=as>0 and(aD and' (boss)'or'')or''
ad.Notify('Path Record',(
'\u{110}\u{e3} l\u{1b0}u room %d%s%s v\u{e0}o map [%s] %s'):format(as,a8,b,aK,a6
and('- '..a6)or''),3)end elseif aG>0 then local a8=aH>0 and(' | %d boss'):
format(aH)or''ad.Notify('Path Record',(
'\u{110}\u{e3} l\u{1b0}u map [%s] %s: %d room%s (%d \u{111}i\u{1ec3}m g\u{1ed1}c)'
):format(aK,a6 or'xong',aG,a8,aI),4)end a2()aY()return a7~=nil end function ao.
Cancel()if not ar then return end a0()a2()ar=false aY()end return ao end
function a.ac()local aa,ab,ac,ad=a.load'e',a.load'f',a.load'aa',a.load'c'local
ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,ax,ay,az,aA,aB,aC,aD=aa.
player,aa.VirtualInputManager,aa.UserInputService,0.4,0.5,2,4.5,6,14,8,14,8,2,
0.5,2,0.001,0.1,{},true,true,true,0.6,0.005,0.45,0.2 function av.
SetStartPauseTime(aE)if type(aE)=='number'then aD=math.clamp(aE,0,5)end end
function av.GetStartPauseTime()return aD end function av.SetPreAimTime(aE)if
type(aE)=='number'then aC=math.clamp(aE,0.1,1.5)end end function av.
GetPreAimTime()return aC end function av.SetSkillFaceHold(aE)if type(aE)==
'number'then aA=math.clamp(aE,ar,as)end end function av.GetSkillFaceHold()return
aA end function av.SetDoubleClickDelay(aE)if type(aE)=='number'then aB=math.
clamp(aE,at,au)end end function av.GetDoubleClickDelay()return aB end function
av.SetReplayTimeline(aE)aE=aE and true or false ax=aE ay=aE az=aE end function
av.IsReplayTimelineEnabled()return ax end local aE,aF,aG,aH=true,false function
av.SetSpeedMatch(aI)aE=aI and true or false end function av.IsSpeedMatchEnabled(
)return aE end function av.SetUseFastSpeed(aI)aF=aI and true or false end
function av.IsUseFastSpeedEnabled()return aF end local aI,aJ,aK,aL,aM,aN,aO,aP,
aQ,aR,aS,aT=function(aI)local aJ if aF then local aK=ab.GetFastSpeed()if type(aK
)=='number'and aK>0 then aJ=aK end elseif aE then if type(aI)=='number'and aI>0
then aJ=aI end end if not aJ or aJ<=0 then return end local aK=ab.GetHumanoid()
if not aK then return end if aG==nil then aH=aK.WalkSpeed end aG=aJ if aK.
WalkSpeed~=aJ then aK.WalkSpeed=aJ end end,function()if aG==nil then return end
local aI=ab.GetHumanoid()if aH and aI and aI.WalkSpeed~=aH then aI.WalkSpeed=aH
end aG=nil aH=nil end,false,false,false,1,0,0,0,{}local aU=function(aU)local aV=
{playing=aK,map=aS,room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(),phase=aN
,resume=aL,progressPercent=aQ,progressStuds=aO,totalStuds=aP,reason=aU}for aW,aX
in ipairs(aR)do pcall(aX,aV)end end function av.GetCurrentPhaseIndex()return aN
end local aV,aW,aX=function()local aV=ae and ae.Character local aW=aV and aV:
FindFirstChild'HumanoidRootPart'if aW and aW.Parent then return aW end return
nil end,function(aV)if not aV or not aV.Parent then return nil end local aW,aX=
pcall(function()return aV.Position end)if not aW or not aX then return nil end
return aX end,function(aV,aW)local aX,aY=aV.X-aW.X,aV.Z-aW.Z return math.sqrt(aX
*aX+aY*aY)end local aY,aZ,a_,a0,a1=function(aY)local aZ=aV()if aZ and aY then
local a_=aW(aZ)if a_ then pcall(function()aY:MoveTo(a_)end)end end end,function(
aY)local aZ,a_=ab.GetKeyHoldTime()or 0.05,aB task.spawn(function()pcall(function
()local a0=function(a0,a1)af:SendKeyEvent(a1,a0,false,game)end local a1=function
(a1)if a1=='Q'then a0(Enum.KeyCode.Q,true)task.wait(aZ)a0(Enum.KeyCode.Q,false)
elseif a1=='E'then a0(Enum.KeyCode.E,true)task.wait(aZ)a0(Enum.KeyCode.E,false)
else a0(Enum.KeyCode.Q,true)a0(Enum.KeyCode.E,true)task.wait(aZ)a0(Enum.KeyCode.
Q,false)a0(Enum.KeyCode.E,false)end end a1(aY)if a_>0 then task.wait(a_)end a1(
aY)end)end)end,function(aY,aZ)if not aY or not aY.Parent then return end local
a_=ab.GetHumanoid()if a_ then a_.AutoRotate=false end local a0=aZ or Vector3.
new(1,0,0)if a0.Magnitude<0.1 then a0=Vector3.new(1,0,0)end a0=Vector3.new(a0.X,
0,a0.Z).Unit pcall(function()local a1=aY.Position aY.CFrame=CFrame.lookAt(a1,a1+
a0)end)end,function(aY,aZ,a_)if not aY or not aY.Parent then return end local a0
=ab.GetHumanoid()if a0 and a0.AutoRotate~=false then a0.AutoRotate=false end
local a1=aZ or Vector3.new(1,0,0)if a1.Magnitude<0.1 then a1=Vector3.new(1,0,0)
end a1=Vector3.new(a1.X,0,a1.Z).Unit pcall(function()local a2=aY.Position local
a3=CFrame.lookAt(a2,a2+a1)aY.CFrame=aY.CFrame:Lerp(a3,math.clamp(a_ or 0.35,0.05
,1))end)end,function()local aY=ab.GetHumanoid()if aY then aY.AutoRotate=true end
end local a2=function(a2,a3,a4)local a5,a6=ab.GetHumanoid(),aV()if not a5 or not
a6 then return end aI(a2.speed)local a7=ac.SimplifyPath(a2.points,ah)local a8=#
a7 if a8<2 then return end local a9,b=0,{}b[1]=0 for ba=2,a8 do local bb=aX(a7[
ba-1],a7[ba])a9+=bb b[ba]=a9 end aO=0 aP=a9 aQ=0 aU'progress_init'local ba,bb=
function(ba,bb,bc)bb=bb or 0 bc=bc or a9 local bd,be=0,math.huge for bf=2,a8 do
if b[bf]<bb then continue end if b[bf-1]>bc then continue end local bg,bi=a7[bf-
1],a7[bf]local bj,bk=bg.X,bg.Z local bl,bm=bi.X-bj,bi.Z-bk local bn,bo=bl*bl+bm*
bm,0 if bn>0 then bo=((ba.X-bj)*bl+(ba.Z-bk)*bm)/bn bo=math.clamp(bo,0,1)end
local bp,bq=ba.X-(bj+bl*bo),ba.Z-(bk+bm*bo)local br=bp*bp+bq*bq if br<be then be
=br bd=b[bf-1]+math.sqrt(bn)*bo end end return bd end,function(ba)local bb=2
while bb<=a8 and b[bb]<ba do bb+=1 end bb=math.min(bb,a8)local bc=b[bb]-b[bb-1]
if bc<=0 then return a7[bb]end local bd,be,bf=math.clamp((ba-b[bb-1])/bc,0,1),a7
[bb-1],a7[bb]return Vector3.new(be.X+(bf.X-be.X)*bd,be.Y+(bf.Y-be.Y)*bd,be.Z+(bf
.Z-be.Z)*bd)end local bc,bd,be=function(bc)local bd=a9-bc if bd<=1 then return
math.max(0.2,bd)end local be,bf=math.min(bc+2,a9),math.min(bc+4.5,a9)if bf-bc<
0.8 then return math.min(aj,bd)end local bg,bi,bj=bb(bc),bb(be),bb(bf)local bk,
bl,bm,bn=bi.X-bg.X,bi.Z-bg.Z,bj.X-bi.X,bj.Z-bi.Z local bo,bp=math.sqrt(bk*bk+bl*
bl),math.sqrt(bm*bm+bn*bn)if bo>0.1 and bp>0.1 then local bq=math.clamp((bk*bm+
bl*bn)/(bo*bp),-1,1)local br=math.clamp((bq+0.2)/1.2,0,1)local bs=aj+(ak-aj)*br
return math.min(bs,bd)end return math.min(ak,bd)end,{},{}if a2.events and(ax or
ay or az)then local bf,bg=a2.events.dwells or{},a2.events.skills or{}for bi,bj
in ipairs(bf)do local bk,bl=ba(bj.pos),bj.dur or 0 if bk<=0.8 or bk>=a9-0.8 then
bl=aD end bd[bi]={arc=bk,dur=bl,facing=bj.facing,skills={},pos=bj.pos}end if aD>
0 and(#bd==0 or bd[1].arc>0.8)then table.insert(bd,1,{arc=0,dur=aD,facing=a2.
events and a2.events.startFacing or nil,skills={},pos=a2.startPos or a7[1]})end
for bi,bj in ipairs(bg)do local bk=(ax and bj.dw>0 and bd[bj.dw])and bd[bj.dw]or
nil if bk then table.insert(bk.skills,{tOff=bj.dwT or 0,facing=bj.facing,key=bj.
key})else table.insert(be,{arc=ba(bj.pos),facing=bj.facing,key=bj.key})end end
table.sort(be,function(bi,bj)return bi.arc<bj.arc end)end local bf,bg,bi=
function(bf)if not aK or(bf.dur or 0)<=0 then return true end if ax then local
bg=bf.pos or aW(a6)if bg then pcall(function()a5:MoveTo(bg)end)end if az and bf.
facing then a_(a6,bf.facing)end local bi,bj,bk=os.clock(),{},0 while aK and(os.
clock()-bi<bf.dur)do if not a6 or not a6.Parent then return false,'no_root'end
if ab.IsDead()then return false,'dead'end if ab.GetCurrentRoomIndex()~=a3 then
return false,'room_changed'end if ab.IsBossActive()and not a4 then return false,
'boss'end if bg then pcall(function()a5:MoveTo(bg)end)end local bl=os.clock()-bi
for bm,bn in ipairs(bf.skills or{})do if not bj[bm]and bl>=(bn.tOff or 0)then bj
[bm]=true if az and bn.facing then a_(a6,bn.facing)bk=os.clock()+aA end if ay
then aZ(bn.key or'QE')end end end task.wait(0.04)end for bl,bm in ipairs(bf.
skills or{})do if not bj[bl]then bj[bl]=true if az and bm.facing then a_(a6,bm.
facing)bk=os.clock()+aA end if ay then aZ(bm.key or'QE')end end end while aK and
os.clock()<bk do if bg then pcall(function()a5:MoveTo(bg)end)end task.wait(0.04)
end if az then a1()end end return true end,a2.startPos or a7[1],aW(a6)if bi and
bg then local bj=aX(bi,bg)if bj>=3 then pcall(function()a5:MoveTo(bg)end)local
bk=os.clock()+5 while aK and os.clock()<bk do local bl=aW(a6)if not bl then
break end if aX(bl,bg)<3 then break end if ab.IsDead()or ab.GetCurrentRoomIndex(
)~=a3 then break end task.wait(0.03)end end local bk=aW(a6)if bk and aX(bk,bg)<=
3.5 then pcall(function()local bl=a6.CFrame.Rotation a6.CFrame=CFrame.new(bg.X,
a6.Position.Y,bg.Z)*bl a6.AssemblyLinearVelocity=Vector3.zero a6.
AssemblyAngularVelocity=Vector3.zero a5:MoveTo(a6.Position)end)end end local bj,
bk,bl,bm,bn,bo,bp,bq=0,bg or aW(a6),os.clock(),1,1,0,(a2.speed and a2.speed>5)
and a2.speed or(a5.WalkSpeed or 20)local br,bs,bt=math.clamp(bp*aC,al,am),0
local bu=function(bu)local bv,bw=os.clock(),bt and aX(bt,bu)or math.huge if bw>
0.15 or bv-bs>=0.08 then bt=bu bs=bv pcall(function()a5:MoveTo(bu)end)end end
while aK do if not a6 or not a6.Parent then a1()return false,'no_root'end if ab.
IsDead()then a1()return false,'dead'end if ab.GetCurrentRoomIndex()~=a3 then a1(
)return false,'room_changed'end if ab.IsBossActive()and not a4 then a1()return
false,'boss'end local bv=aW(a6)if not bv then task.wait(0.08)continue end local
bw=ba(bv,math.max(0,bj-an),math.min(a9,bj+ao))if bw>bj then bj=bw end aO=bj aQ=
a9>0 and math.clamp(math.floor((bj/a9)*100),0,100)or 0 if bk then if aX(bv,bk)>
0.02 then bl=os.clock()end end bk=bv if os.clock()-bl>ap then bj=math.min(bj+aq,
a9-ai)bl=os.clock()bk=bv end local bx,by,bz,bA=be[bn],bd[bm],false local bB,bC=
by and(by.arc-bj)or math.huge,bx and(bx.arc-bj)or math.huge if bB<bC and bB>0
and bB<=br then if az then local bD=(by.skills and#by.skills>0 and by.skills[1].
facing)or by.facing if bD then bA=bD end end elseif bC<=bB and bC>0 and bC<=br
then if az and bx.facing then bA=bx.facing end end if bA then bz=true a0(a6,bA,
0.35)end while bn<=#be and be[bn].arc<=bj do local bD=be[bn]if az and bD.facing
then a_(a6,bD.facing)bq=bD.facing bo=os.clock()+aA end if ay then aZ(bD.key or
'QE')end bn+=1 end while bm<=#bd and bj>=bd[bm].arc do local bD=bd[bm]local bE,
bF=bf(bD)if not bE then a1()return false,bF end bm+=1 bk=aW(a6)bl=os.clock()end
if bj>=a9-ai then while bm<=#bd do local bD=bd[bm]local bE,bF=bf(bD)if not bE
then a1()return false,bF end bm+=1 end while bn<=#be do local bD=be[bn]if az and
bD.facing then a_(a6,bD.facing)bo=os.clock()+aA end if ay then aZ(bD.key or'QE')
end bn+=1 end a1()pcall(function()a5:MoveTo(a7[a8])end)local bD=os.clock()+5
while aK do local bE=aW(a6)if bE and aX(bE,a7[a8])<=ai then break end if ab.
GetCurrentRoomIndex()~=a3 then a1()return false,'room_changed'end if(ab.
IsBossActive()and not a4)or ab.IsDead()then a1()return false,'dead'end if os.
clock()>=bD then break end if os.clock()>=bo and a5.AutoRotate~=true then a5.
AutoRotate=true end task.wait(0.08)end a1()aO=a9 aQ=100 return true,'completed'
end if os.clock()<bo or bz then if a5.AutoRotate~=false then a5.AutoRotate=false
end elseif a5.AutoRotate~=true then a5.AutoRotate=true end local bD=bc(bj)local
bE=bb(math.min(bj+bD,a9-0.01))bu(bE)task.wait(0.05)end a1()return false,
'stopped'end local a3=function()local a3,a4,a5=0,false,false aN=1 while aK do if
aL then break end if ab.IsDead()then a5=true task.wait(0.25)continue end if a5
then a5=false end if ab.IsInLobby()then aL=false aK=false break end if ab.
IsBossActive()and not aM then task.wait(0.25)continue end local a6=ab.
GetCurrentRoomIndex()if a6<=0 then task.wait(0.1)continue end if a6~=a3 then a3=
a6 a4=false aN=1 aO=0 aP=0 aQ=0 end local a7=ac.GetRoomSegment(aS,a6)if not a7
then task.wait(0.1)continue end local a8=a7.phases or{a7}local a9=#a8 if a4 then
task.wait(0.1)continue end local b=a8[math.min(aN,a9)]or a7 local ba,bb=a2(b,a6,
aM)a1()if ba then a4=true aO=aP aQ=100 else if bb=='dead'then aN+=1 local bc=
math.min(aN,a9)if a9>1 then ad.Notify('Path Record',(
'T\u{1eed} tr\u{1ead}n (Phase %d/%d): Ch\u{1edd} h\u{1ed3}i sinh \u{111}\u{1ec3} ch\u{1ea1}y Phase %d...'
):format(aN-1,a9,bc),3)else ad.Notify('Path Record',
'T\u{1eed} tr\u{1ead}n: \u{110}ang ch\u{1edd} h\u{1ed3}i sinh \u{111}\u{1ec3} \u{111}i l\u{1ea1}i...'
,2)end while aK and ab.IsDead()do task.wait(0.2)end task.wait(0.6)end end end
aJ()a1()aT=nil aU()end function av.IsPlaying()return aK end function av.
ResumeWanted()return aL end function av.GetActiveMap()return aS end function av.
IsBossPlayActive()return aM end function av.GetStatus()return{playing=aK,map=aS,
room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(),phase=aN,resume=aL,
progressPercent=aQ,progressStuds=aO,totalStuds=aP}end function av.
OnStatusChanged(a4)if type(a4)~='function'then return function()end end table.
insert(aR,a4)return function()for a5,a6 in ipairs(aR)do if a6==a4 then table.
remove(aR,a5)break end end end end function av.Start()if aK then return false,
'\u{111}ang ph\u{e1}t r\u{1ed3}i'end if ab.IsInLobby()then return false,
'\u{111}ang \u{1edf} lobby'end local a4=ab.GetCurrentRoomIndex()if a4<=0 then
return false,'ch\u{1b0}a c\u{f3} room'end local a5=ab.GetCurrentDungeonName()if
not a5 or#a5==0 then return false,
'kh\u{f4}ng x\u{e1}c \u{111}\u{1ecb}nh \u{111}\u{1b0}\u{1ee3}c map'end if not ac
.HasSegmentOrMacro(a5,a4)then return false,(
'map [%s] ch\u{1b0}a c\u{f3} segment room %d'):format(a5,a4)end local a6=ac.
GetMapMode(a5)=='full'if ab.IsBossActive()and(not a6 or not ac.
HasSegmentOrMacro(a5,a4))then return false,
'boss room (h\u{e3}y d\u{f9}ng Hazard Scanner)'end aS=a5 aM=a6 aL=false aN=1 aO=
0 aP=0 aQ=0 aK=true aT=task.spawn(a3)aU'started'return true end function av.Stop
()aK=false aL=false aS=nil aM=false aN=1 aO=0 aP=0 aQ=0 if aT then task.cancel(
aT)aT=nil end aY(ab.GetHumanoid())aJ()a1()aU'stopped'end function av.
PauseForExclusive()if not aK then return end aL=true aK=false aM=false aO=0 aP=0
aQ=0 if aT then task.cancel(aT)aT=nil end aY(ab.GetHumanoid())aJ()a1()ad.Notify(
'Path Record',
'Nh\u{1b0}\u{1edd}ng \u{111}i\u{1ec1}u khi\u{1ec3}n: s\u{1ebd} t\u{1ef1} ph\u{e1}t ti\u{1ebf}p khi v\u{e0}o room c\u{f3} b\u{1ea3}n ghi'
,3)aU'paused'end return av end function a.ad()local aa,ab,ac,ad,ae,af,ag=a.load
'e',a.load'f',a.load'aa',a.load'ab',a.load'ac',a.load'b',game:GetService
'Workspace'local ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,ax,ay,az,aA,aB,aC,
aD,aE=aa.RunService,{},'PR_PathVisual_Container','PR_PathVisual_Anchor',Color3.
fromRGB(255,60,60),Color3.fromRGB(255,90,90),Color3.fromRGB(0,255,120),Color3.
fromRGB(0,220,110),Color3.fromRGB(0,230,255),Color3.fromRGB(255,80,180),Color3.
fromRGB(255,190,30),Color3.fromRGB(200,70,255),Color3.fromRGB(220,100,255),
Color3.fromRGB(255,210,60),0.35,0.55,2.5,3,0.35,true,true,true,true local aF,aG,
aH,aI,aJ,aK,aL,aM,aN,aO,aP=av,true,0,{},{},{},{},{}local aQ,aR,aS,aT,aU,aV,aW,aX
=function()if aN and aN.Parent and aO and aO.Parent then return aO end ai.Clear(
)local aQ=Instance.new'Folder'aQ.Name=aj aQ.Parent=ag local aR=Instance.new
'Part'aR.Name=ak aR.Anchored=true aR.CanCollide=false aR.CanQuery=false aR.
CanTouch=false aR.Transparency=1 aR.Size=Vector3.new(1,1,1)aR.CFrame=CFrame.new(
0,0,0)aR.Parent=aQ aN=aQ aO=aR table.clear(aI)table.clear(aJ)table.clear(aK)
table.clear(aL)table.clear(aM)return aO end,function(aQ,aR)local aS=aI[aQ]if not
aS or not aS.Parent then aS=Instance.new'SphereHandleAdornment'aS.Name=
'PR_NodeSphere_'..tostring(aQ)aS.Adornee=aR aS.AlwaysOnTop=aG aS.ZIndex=5 aS.
Transparency=0.2 aS.Parent=aR aI[aQ]=aS end return aS end,function(aQ,aR)local
aS=aJ[aQ]if not aS or not aS.Parent then aS=Instance.new'LineHandleAdornment'aS.
Name='PR_PathLine_'..tostring(aQ)aS.Adornee=aR aS.AlwaysOnTop=aG aS.ZIndex=4 aS.
Transparency=0.3 aS.Thickness=ay aS.Parent=aR aJ[aQ]=aS end return aS end,
function(aQ,aR)local aS=aK[aQ]if not aS or not aS.Parent then aS=Instance.new
'SphereHandleAdornment'aS.Name='PR_EventSphere_'..tostring(aQ)aS.Adornee=aR aS.
AlwaysOnTop=aG aS.ZIndex=8 aS.Transparency=0.15 aS.Radius=ax aS.Parent=aR aK[aQ]
=aS end return aS end,function(aQ,aR)local aS=aL[aQ]if not aS or not aS.Parent
then aS=Instance.new'LineHandleAdornment'aS.Name='PR_FacingRay_'..tostring(aQ)aS
.Adornee=aR aS.AlwaysOnTop=aG aS.ZIndex=9 aS.Transparency=0.1 aS.Thickness=az aS
.Parent=aR aL[aQ]=aS end return aS end,function(aQ,aR)local aS=aM[aQ]if not aS
or not aS.billboard or not aS.billboard.Parent then local aT=Instance.new
'Attachment'aT.Name='PR_BadgeAtt_'..tostring(aQ)aT.Parent=aR local aU=Instance.
new'BillboardGui'aU.Name='PR_BadgeGui_'..tostring(aQ)aU.Adornee=aT aU.Size=UDim2
.new(0,115,0,24)aU.StudsOffset=Vector3.new(0,1.6,0)aU.AlwaysOnTop=true aU.
MaxDistance=180 aU.LightInfluence=0 aU.Parent=aN local aV=Instance.new'Frame'aV.
Name='BadgeFrame'aV.Size=UDim2.new(1,0,1,0)aV.BackgroundColor3=Color3.fromRGB(15
,15,20)aV.BackgroundTransparency=0.25 aV.BorderSizePixel=0 aV.Parent=aU local aW
=Instance.new'UICorner'aW.CornerRadius=UDim.new(0,6)aW.Parent=aV local aX=
Instance.new'UIStroke'aX.Name='Stroke'aX.Color=as aX.Thickness=1.4 aX.
Transparency=0.15 aX.Parent=aV local aY=Instance.new'TextLabel'aY.Name='Text'aY.
Size=UDim2.new(1,-6,1,0)aY.Position=UDim2.new(0,3,0,0)aY.BackgroundTransparency=
1 aY.Font=Enum.Font.GothamBold aY.TextSize=11 aY.TextColor3=Color3.fromRGB(255,
255,255)aY.RichText=true aY.Text=''aY.TextXAlignment=Enum.TextXAlignment.Center
aY.TextYAlignment=Enum.TextYAlignment.Center aY.Parent=aV aS={attachment=aT,
billboard=aU,frame=aV,stroke=aX,label=aY}aM[aQ]=aS end return aS end,function(aQ
)if not aQ then return nil end if typeof(aQ)=='Vector3'then if aQ.Magnitude>
0.001 then return aQ.Unit end return nil end if type(aQ)=='table'and type(aQ.X)
=='number'and type(aQ.Z)=='number'then local aR=Vector3.new(aQ.X,0,aQ.Z)if aR.
Magnitude>0.001 then return aR.Unit end end return nil end,function()for aQ,aR
in ipairs(aI)do if aR and aR.Parent then aR.Visible=false end end for aQ,aR in
ipairs(aJ)do if aR and aR.Parent then aR.Visible=false end end for aQ,aR in
ipairs(aK)do if aR and aR.Parent then aR.Visible=false end end for aQ,aR in
ipairs(aL)do if aR and aR.Parent then aR.Visible=false end end for aQ,aR in
ipairs(aM)do if aR and aR.billboard and aR.billboard.Parent then aR.billboard.
Enabled=false end end end function ai.Update()if not aB then aX()return end if
ab.IsInLobby()then aX()return end local aY,aZ,a_,a0=ad.IsRecording(),{},{},{}if
aY then local a1=ad.GetRoomPhases and ad.GetRoomPhases()if a1 and#a1>0 then for
a2,a3 in ipairs(a1)do if a3 and a3.points and#a3.points>0 then table.insert(aZ,
a3.points)end end end local a2=ad.GetCurrentPoints()if a2 and#a2>0 then table.
insert(aZ,a2)end local a3=ad.GetCurrentDwells and ad.GetCurrentDwells()if a3
then a_=a3 end local a4=ad.GetCurrentSkills and ad.GetCurrentSkills()if a4 then
a0=a4 end else local a1,a2=ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex()if
a1 and#a1>0 and a2>0 then local a3=ac.GetRoomSegment(a1,a2)if a3 then if a3.
phases and#a3.phases>0 then for a4,a5 in ipairs(a3.phases)do if a5 and a5.points
and#a5.points>0 then table.insert(aZ,a5.points)end end elseif a3.points and#a3.
points>0 then table.insert(aZ,a3.points)end if a3.events then a_=a3.events.
dwells or{}a0=a3.events.skills or{}end end end end if#aZ==0 then aX()return end
local a1=aQ()if not a1 then return end local a2,a3,a4,a5,a6,a7,a8,a9,b=aY and al
or an,aY and am or ao,0,0,0,0,0 for ba,bb in ipairs(aZ)do local bc=#bb if bc>0
then if not a9 then a9=bb[1]end b=bb[bc]for bd=1,bc do local be=bb[bd]if be then
a4+=1 local bf=aR(a4,a1)bf.Radius=aF bf.Color3=a2 bf.AlwaysOnTop=aG bf.CFrame=
CFrame.new(be+Vector3.new(0,aA,0))bf.Visible=true end end if aC and bc>=2 then
for bd=1,bc-1 do local be,bf=bb[bd],bb[bd+1]if be and bf then local bg,bi=be+
Vector3.new(0,aA,0),bf+Vector3.new(0,aA,0)local bj=(bi-bg).Magnitude if bj>0.05
then a5+=1 local bk=aS(a5,a1)bk.Length=bj bk.Thickness=ay bk.Color3=a3 bk.
AlwaysOnTop=aG bk.CFrame=CFrame.lookAt(bg,bi)bk.Visible=true end end end end end
end if aD then local ba if a9 then for bb,bc in ipairs(a_)do if bc.pos and(bc.
pos-a9).Magnitude<1.5 then ba=bc break end end a6+=1 local bb=aT(a6,a1)bb.Radius
=ax bb.Color3=ap bb.AlwaysOnTop=aG bb.CFrame=CFrame.new(a9+Vector3.new(0,aA,0))
bb.Visible=true a8+=1 local bc=aV(a8,a1)bc.attachment.WorldPosition=a9+Vector3.
new(0,aA,0)bc.stroke.Color=ap local bd=ae and ae.GetStartPauseTime and ae.
GetStartPauseTime()or 0 if bd>0 then bc.label.Text=(
"<font color='rgb(0,240,255)'><b>\u{1f6a9} START (%.1fs)</b></font>"):format(bd)
else bc.label.Text="<font color='rgb(0,240,255)'><b>\u{1f6a9} START</b></font>"
end bc.billboard.Enabled=true if aE and ba and ba.facing then local be=aW(ba.
facing)if be then a7+=1 local bf,bg=aU(a7,a1),a9+Vector3.new(0,aA,0)local bi=bg+
be*3.5 bf.Length=3.5 bf.Color3=ap bf.AlwaysOnTop=aG bf.CFrame=CFrame.lookAt(bg,
bi)bf.Visible=true end end end for bb,bc in ipairs(a_)do local bd=bc.pos local
be,bf=a9 and(bd-a9).Magnitude<1.5,b and(bd-b).Magnitude<1.5 if bd and not be and
not bf then a6+=1 local bg=aT(a6,a1)bg.Radius=ax bg.Color3=ar bg.AlwaysOnTop=aG
bg.CFrame=CFrame.new(bd+Vector3.new(0,aA,0))bg.Visible=true local bi=math.round(
(bc.dur or 0)*10)/10 a8+=1 local bj=aV(a8,a1)bj.attachment.WorldPosition=bd+
Vector3.new(0,aA,0)bj.stroke.Color=ar bj.label.Text=(
"<font color='rgb(255,200,60)'><b>\u{23f3} Pause (%.1fs)</b></font>"):format(bi)
bj.billboard.Enabled=true if aE then local bk=aW(bc.facing)if bk then a7+=1
local bl,bm=aU(a7,a1),bd+Vector3.new(0,aA,0)local bn=bm+bk*3 bl.Length=3 bl.
Color3=au bl.AlwaysOnTop=aG bl.CFrame=CFrame.lookAt(bm,bn)bl.Visible=true end
end end end for bb,bc in ipairs(a0)do local bd=bc.pos if bd then a6+=1 local be=
aT(a6,a1)be.Radius=ax be.Color3=as be.AlwaysOnTop=aG be.CFrame=CFrame.new(bd+
Vector3.new(0,aA,0))be.Visible=true local bf=(bc.key and#bc.key>0)and bc.key or
'QE'a8+=1 local bg=aV(a8,a1)bg.attachment.WorldPosition=bd+Vector3.new(0,aA,0)bg
.stroke.Color=as bg.label.Text=(
"<font color='rgb(220,100,255)'><b>\u{26a1} Skill [%s]</b></font>"):format(bf)bg
.billboard.Enabled=true if aE then local bi=aW(bc.facing)if bi then a7+=1 local
bj,bk=aU(a7,a1),bd+Vector3.new(0,aA,0)local bl=bk+bi*3.8 bj.Length=3.8 bj.Color3
=at bj.AlwaysOnTop=aG bj.CFrame=CFrame.lookAt(bk,bl)bj.Visible=true end end end
end local bb if b and b~=a9 and not aY then for bc,bd in ipairs(a_)do if bd.pos
and(bd.pos-b).Magnitude<1.5 then bb=bd break end end a6+=1 local bc=aT(a6,a1)bc.
Radius=ax bc.Color3=aq bc.AlwaysOnTop=aG bc.CFrame=CFrame.new(b+Vector3.new(0,aA
,0))bc.Visible=true a8+=1 local bd=aV(a8,a1)bd.attachment.WorldPosition=b+
Vector3.new(0,aA,0)bd.stroke.Color=aq local be=ae and ae.GetStartPauseTime and
ae.GetStartPauseTime()or 0 if bb and be>0 then bd.label.Text=(
"<font color='rgb(255,100,200)'><b>\u{1f3c1} FINISH (%.1fs)</b></font>"):format(
be)else bd.label.Text=
"<font color='rgb(255,100,200)'><b>\u{1f3c1} FINISH</b></font>"end bd.billboard.
Enabled=true if aE and bb and bb.facing then local bf=aW(bb.facing)if bf then a7
+=1 local bg,bi=aU(a7,a1),b+Vector3.new(0,aA,0)local bj=bi+bf*3.5 bg.Length=3.5
bg.Color3=aq bg.AlwaysOnTop=aG bg.CFrame=CFrame.lookAt(bi,bj)bg.Visible=true end
end end end for ba=a4+1,#aI do local bb=aI[ba]if bb and bb.Parent then bb.
Visible=false end end for ba=a5+1,#aJ do local bb=aJ[ba]if bb and bb.Parent then
bb.Visible=false end end for ba=a6+1,#aK do local bb=aK[ba]if bb and bb.Parent
then bb.Visible=false end end for ba=a7+1,#aL do local bb=aL[ba]if bb and bb.
Parent then bb.Visible=false end end for ba=a8+1,#aM do local bb=aM[ba]if bb and
bb.billboard and bb.billboard.Parent then bb.billboard.Enabled=false end end end
local aY=function()if aP then return end aP=ah.Heartbeat:Connect(function()local
aY,aZ=os.clock(),ad.IsRecording()local a_=aZ and 0.03 or 0.1 if aY-aH<a_ then
return end aH=aY pcall(ai.Update)end)end function ai.SetEnabled(aZ)aB=aZ and
true or false if not aB then aX()else pcall(ai.Update)end end function ai.
IsEnabled()return aB end function ai.SetShowLines(aZ)aC=aZ and true or false if
not aC then for a_,a0 in ipairs(aJ)do if a0 and a0.Parent then a0.Visible=false
end end else pcall(ai.Update)end end function ai.IsShowLinesEnabled()return aC
end function ai.SetShowEvents(aZ)aD=aZ and true or false if not aD then for a_,
a0 in ipairs(aK)do if a0 and a0.Parent then a0.Visible=false end end for a_,a0
in ipairs(aM)do if a0 and a0.billboard and a0.billboard.Parent then a0.billboard
.Enabled=false end end else pcall(ai.Update)end end function ai.
IsShowEventsEnabled()return aD end function ai.SetShowFacingRays(aZ)aE=aZ and
true or false if not aE then for a_,a0 in ipairs(aL)do if a0 and a0.Parent then
a0.Visible=false end end else pcall(ai.Update)end end function ai.
IsShowFacingRaysEnabled()return aE end function ai.SetNodeRadius(aZ)if type(aZ)
=='number'then aF=math.clamp(aZ,0.1,1.5)pcall(ai.Update)end end function ai.
GetNodeRadius()return aF end function ai.SetAlwaysOnTop(aZ)aG=aZ and true or
false for a_,a0 in ipairs(aI)do if a0 and a0.Parent then a0.AlwaysOnTop=aG end
end for a_,a0 in ipairs(aJ)do if a0 and a0.Parent then a0.AlwaysOnTop=aG end end
for a_,a0 in ipairs(aK)do if a0 and a0.Parent then a0.AlwaysOnTop=aG end end for
a_,a0 in ipairs(aL)do if a0 and a0.Parent then a0.AlwaysOnTop=aG end end for a_,
a0 in ipairs(aM)do if a0 and a0.billboard and a0.billboard.Parent then a0.
billboard.AlwaysOnTop=aG end end end function ai.IsAlwaysOnTopEnabled()return aG
end function ai.Clear()aX()table.clear(aI)table.clear(aJ)table.clear(aK)table.
clear(aL)table.clear(aM)local aZ=ag:FindFirstChild(aj)if aZ then pcall(function(
)aZ:Destroy()end)end aN=nil aO=nil end function ai.Destroy()if aP then aP:
Disconnect()aP=nil end ai.Clear()end ai.Clear()aY()af.Register(function()ai.
Destroy()end)return ai end function a.ae()local aa,ab,ac=a.load'e',a.load'f',a.
load'b'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,ax,ay,az,
aA=aa.player,aa.RunService,aa.CoreGui or game:GetService'CoreGui',game:
GetService'Workspace',{},{Cyan=Color3.fromRGB(0,230,255),Red=Color3.fromRGB(255,
60,60),Orange=Color3.fromRGB(255,140,0),Yellow=Color3.fromRGB(255,220,40),Green=
Color3.fromRGB(0,255,120),Emerald=Color3.fromRGB(40,220,160),Blue=Color3.
fromRGB(0,140,255),Purple=Color3.fromRGB(180,80,255),Magenta=Color3.fromRGB(255,
60,200),White=Color3.fromRGB(255,255,255)},false,25,0.4,true,true,'Cyan','Red',
0.8,0.15,'PR_InRange_Highlight',0.2,0,{}local aB,aC,aD,aE=function()return ai[ao
]or ai.Cyan end,function()return ai[ap]or ai.Red end,function()local aB=ad and
ad.Character if not aB or not aB.Parent then return nil end local aC=aB:
FindFirstChildOfClass'Humanoid'if aC and aC.Health<=0 then return nil end local
aD=aB:FindFirstChild'HumanoidRootPart'if aD and aD.Parent then return aD end
return nil end,function()for aB,aC in pairs(av)do pcall(function()aC:Destroy()
end)end table.clear(av)pcall(function()for aB,aC in ipairs(ag:GetDescendants())
do if aC.Name==as then pcall(function()aC:Destroy()end)end end end)end local aF,
aG=function()if ax then pcall(function()ax:Destroy()end)ax=nil end if ay then
pcall(function()ay:Destroy()end)ay=nil end aA=nil aE()end,function()if not ax or
not ax.Parent then pcall(function()if ax then ax:Destroy()end end)ax=Instance.
new'CylinderHandleAdornment'ax.Name='PR_SkillRangeRing'ax.AlwaysOnTop=true ax.
ZIndex=5 ax.Parent=af end if am then if not ay or not ay.Parent then pcall(
function()if ay then ay:Destroy()end end)ay=Instance.new
'CylinderHandleAdornment'ay.Name='PR_SkillRangeFill'ay.AlwaysOnTop=true ay.
ZIndex=4 ay.Parent=af end else if ay then pcall(function()ay:Destroy()end)ay=nil
end end end local aH,aI=function(aH)if not aj then aF()return end aG()local aI,
aJ=2.6,aB()local aK=Vector3.new(aH.Position.X,aH.Position.Y-aI,aH.Position.Z)
local aL=CFrame.new(aK)*CFrame.Angles(math.rad(90),0,0)local aM=aH.CFrame:
ToObjectSpace(aL)if ax then ax.Adornee=aH ax.Height=0.06 ax.Radius=ak ax.
InnerRadius=math.max(0.1,ak-al)ax.Color3=aJ ax.Transparency=1-aq ax.CFrame=aM ax
.Visible=(aH~=nil and aH.Parent~=nil)end if ay and am then ay.Adornee=aH ay.
Height=0.02 ay.Radius=ak ay.InnerRadius=0 ay.Color3=aJ ay.Transparency=1-ar ay.
CFrame=aM ay.Visible=(aH~=nil and aH.Parent~=nil)end end,function(aH)if not aj
or not an or not aH then if next(av)~=nil then aE()end return end local aI,aJ,aK
,aL,aM=ab.GetTrackedEnemyData(),aH.Position,ak*ak,{},aC()for aN,aO in ipairs(aI)
do local aP,aQ,aR=aO.Model,aO.Root,aO.Humanoid if aP and aP.Parent and aQ and aQ
.Parent and aR and aR.Health>0 then local aS,aT=aQ.Position.X-aJ.X,aQ.Position.Z
-aJ.Z if(aS*aS+aT*aT)<=aK then aL[aP]=true end end end for aN,aO in pairs(av)do
if not aL[aN]or not aN.Parent then pcall(function()aO:Destroy()end)av[aN]=nil
end end for aN in pairs(aL)do if not av[aN]or not av[aN].Parent then local aO=aN
:FindFirstChild(as)local aP=(aO and aO:IsA'Highlight')and aO or Instance.new
'Highlight'aP.Name=as aP.Adornee=aN aP.FillColor=aM aP.FillTransparency=0.35 aP.
OutlineColor=Color3.fromRGB(255,255,255)aP.OutlineTransparency=0.1 aP.DepthMode=
Enum.HighlightDepthMode.AlwaysOnTop aP.Parent=aN av[aN]=aP else local aO=av[aN]
if aO.FillColor~=aM then aO.FillColor=aM end if not aO.Enabled then aO.Enabled=
true end end end end local aJ=function()if not aj then return end local aJ=aD()
if not aJ then if ax then ax.Visible=false end if ay then ay.Visible=false end
if next(av)~=nil then aE()end aA=nil return end local aK=2.6 local aL=Vector3.
new(aJ.Position.X,aJ.Position.Y-aK,aJ.Position.Z)local aM=CFrame.new(aL)*CFrame.
Angles(math.rad(90),0,0)local aN=aJ.CFrame:ToObjectSpace(aM)if not ax or not ax.
Parent or aJ~=aA then aA=aJ aH(aJ)else if ax.Adornee~=aJ then ax.Adornee=aJ end
ax.CFrame=aN if not ax.Visible then ax.Visible=true end if am then if not ay or
not ay.Parent then aH(aJ)else if ay.Adornee~=aJ then ay.Adornee=aJ end ay.CFrame
=aN if not ay.Visible then ay.Visible=true end end elseif ay and ay.Visible then
ay.Visible=false end end local aO=os.clock()if aO-au>=at then au=aO aI(aJ)end
end function ah.SetEnabled(aK)aj=aK and true or false if aj then local aL=aD()if
aL then aH(aL)aA=aL aI(aL)end if not az then az=ae.Heartbeat:Connect(aJ)end else
aF()if az then az:Disconnect()az=nil end aA=nil end end function ah.IsEnabled()
return aj end function ah.SetRadius(aK)if type(aK)=='number'then ak=math.clamp(
aK,5,150)local aL=aD()if aj and aL then aH(aL)aI(aL)end end end function ah.
GetRadius()return ak end function ah.SetFillEnabled(aK)am=aK and true or false
local aL=aD()if aj and aL then aH(aL)end end function ah.IsFillEnabled()return
am end function ah.SetHighlightInRange(aK)an=aK and true or false if not an then
aE()else local aL=aD()if aj and aL then aI(aL)end end end function ah.
IsHighlightInRangeEnabled()return an end function ah.GetColorNames()local aK={
'Cyan','Red','Orange','Yellow','Green','Emerald','Blue','Purple','Magenta',
'White'}return aK end function ah.GetSelectedCircleColor()return ao end function
ah.SetCircleColor(aK)if type(aK)=='string'and ai[aK]then ao=aK local aL=aD()if
aj and aL then aH(aL)end end end function ah.GetSelectedHighlightColor()return
ap end function ah.SetHighlightColor(aK)if type(aK)=='string'and ai[aK]then ap=
aK local aL=aD()if aj and aL then aI(aL)end end end if ad then ad.CharacterAdded
:Connect(function(aK)if aj then task.spawn(function()local aL=aK:WaitForChild(
'HumanoidRootPart',10)if aL and aj then aH(aL)aA=aL aI(aL)end end)end end)end ab
.OnRespawn(function()if aj then task.delay(0.2,function()local aK=aD()if aK and
aj then aH(aK)aA=aK aI(aK)end end)end end)ac.Register(function()ah.SetEnabled(
false)aF()end)return ah end function a.af()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,
ak,al,am=a.load'e',a.load'f',a.load'b',a.load'w',a.load'c',a.load'aa',a.load'ab'
,a.load'ac',a.load'ad',a.load'ae',{},true,true function ak.
IsTimelineCaptureEnabled()return al end function ak.SetTimelineCapture(an)al=an
and true or false ag.SetCapture(al)fireStatus'timeline'end function ak.
IsTimelineReplayEnabled()return am end function ak.SetTimelineReplay(an)am=an
and true or false ah.SetReplayTimeline(am)fireStatus'timeline'end function ak.
IsSpeedMatchEnabled()return ah.IsSpeedMatchEnabled()end function ak.
SetSpeedMatch(an)ah.SetSpeedMatch(an and true or false)fireStatus'speedmatch'end
function ak.IsUseFastSpeedEnabled()return ah.IsUseFastSpeedEnabled()end function
ak.SetUseFastSpeed(an)ah.SetUseFastSpeed(an and true or false)fireStatus
'usefastspeed'end function ak.GetPreAimTime()return ah.GetPreAimTime()end
function ak.SetPreAimTime(an)ah.SetPreAimTime(an)fireStatus'preaim'end function
ak.GetSkillFaceHold()return ah.GetSkillFaceHold()end function ak.
SetSkillFaceHold(an)ah.SetSkillFaceHold(an)fireStatus'facehold'end function ak.
GetDoubleClickDelay()return ah.GetDoubleClickDelay()end function ak.
SetDoubleClickDelay(an)ah.SetDoubleClickDelay(an)fireStatus'doubleclick'end
function ak.GetStartPauseTime()return ah.GetStartPauseTime()end function ak.
SetStartPauseTime(an)ah.SetStartPauseTime(an)fireStatus'startpause'end local an,
ao,ap,aq,ar={}local as=function(as)local at=ag.GetStatus()local au={recording=ag
.IsRecording(),playing=ah.IsPlaying(),resume=ah.ResumeWanted(),autoPlayWanted=
autoPlayWanted,inLobby=ab.IsInLobby(),map=ab.GetCurrentDungeonName(),room=ab.
GetCurrentRoomIndex(),boss=ab.IsBossActive(),recordedMaps=af.Count(),pointCount=
ag.IsRecording()and at.pointCount or 0,phase=ah.IsPlaying()and ah.
GetCurrentPhaseIndex()or(ag.IsRecording()and at.phaseCount or 1),reason=as}for
av,ax in ipairs(an)do pcall(ax,au)end end function ak.ToggleRecord(at)if at then
if ag.IsRecording()then return true end if ah.IsPlaying()then ah.Stop()end local
au,av=ag.Start()if not au then ae.Notify('Path Record',
'Kh\u{f4}ng b\u{1eaf}t \u{111}\u{1ea7}u record: '..tostring(av),3)end as()return
au else local au=ag.IsRecording()ag.Stop()as()return au end end function ak.
IsRecording()return ag.IsRecording()end function ak.CurrentRoomHasRecord()return
af.HasSegmentOrMacro(ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex())end
function ak.GetMapMode(at)return af.GetMapMode(at)end function ak.SetMapMode(at,
au)if af.SetMapMode(at,au)then as'mode'end end local at=false function ak.
IsAutoPlayWanted()return at end function ak.TogglePlay(au)at=au and true or
false if at then if ah.IsPlaying()then as'already_playing'return true end if ag.
IsRecording()then ag.Stop()end if ab.IsInLobby()then as'armed_lobby'return true
end local av,ax=ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex()if not av or#
av==0 or ax<=0 then as'armed_waiting'return true end if ab.IsBossActive()and af.
GetMapMode(av)~='full'then as'armed_boss'return true end if af.
HasSegmentOrMacro(av,ax)then ad.EnableExclusive'PathRecord'ah.Start()end as
'play_started'return true else local av=ah.IsPlaying()ah.Stop()as'play_stopped'
return av end end function ak.IsPlaying()return ah.IsPlaying()end function ak.
IsEnabled()return ah.IsPlaying()end function ak.SetRangeVisual(au)aj.SetEnabled(
au)as'rangevisual'end function ak.IsRangeVisualEnabled()return aj.IsEnabled()end
function ak.SetRangeVisualRadius(au)aj.SetRadius(au)as'rangeradius'end function
ak.GetRangeVisualRadius()return aj.GetRadius()end function ak.SetRangeVisualFill
(au)aj.SetFillEnabled(au)as'rangefill'end function ak.IsRangeVisualFillEnabled()
return aj.IsFillEnabled()end function ak.SetHighlightInRange(au)aj.
SetHighlightInRange(au)as'rangehighlight'end function ak.
IsHighlightInRangeEnabled()return aj.IsHighlightInRangeEnabled()end function ak.
GetRangeColorNames()return aj.GetColorNames()end function ak.
GetSelectedCircleColor()return aj.GetSelectedCircleColor()end function ak.
SetCircleColor(au)aj.SetCircleColor(au)as'circlecolor'end function ak.
GetSelectedHighlightColor()return aj.GetSelectedHighlightColor()end function ak.
SetHighlightColor(au)aj.SetHighlightColor(au)as'highlightcolor'end function ak.
SetVisualEnabled(au)ai.SetEnabled(au)as'visual'end function ak.IsVisualEnabled()
return ai.IsEnabled()end function ak.SetVisualShowLines(au)ai.SetShowLines(au)as
'visuallines'end function ak.IsVisualShowLinesEnabled()return ai.
IsShowLinesEnabled()end function ak.SetVisualNodeRadius(au)ai.SetNodeRadius(au)
as'visualradius'end function ak.GetVisualNodeRadius()return ai.GetNodeRadius()
end function ak.SetVisualAlwaysOnTop(au)ai.SetAlwaysOnTop(au)as'visualontop'end
function ak.IsVisualAlwaysOnTopEnabled()return ai.IsAlwaysOnTopEnabled()end
function ak.SetVisualShowEvents(au)ai.SetShowEvents(au)as'visualevents'end
function ak.IsVisualShowEventsEnabled()return ai.IsShowEventsEnabled()end
function ak.SetVisualShowFacing(au)ai.SetShowFacingRays(au)as'visualfacing'end
function ak.IsVisualShowFacingEnabled()return ai.IsShowFacingRaysEnabled()end
function ak.GetMaps()return af.GetMaps()end function ak.GetMacro(au)return af.
GetMap(au)end function ak.RemoveMap(au)af.RemoveMap(au)as'removed'end function
ak.ClearAll()af.ClearAll()as'cleared'end function ak.ReloadFromDisk()af.
ReloadFromDisk()as'reloaded'end function ak.GetStatus()local au,av=ag.GetStatus(
),ah.GetStatus()return{recording=ag.IsRecording(),playing=ah.IsPlaying(),resume=
ah.ResumeWanted(),autoPlayWanted=at,inLobby=ab.IsInLobby(),map=ab.
GetCurrentDungeonName(),room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(),
recordedMaps=af.Count(),pointCount=au.pointCount,dwellCount=au.dwellCount or 0,
skillCount=au.skillCount or 0,phase=ah.IsPlaying()and ah.GetCurrentPhaseIndex()
or(ag.IsRecording()and au.phaseCount or 1),progressPercent=av.progressPercent or
0,progressStuds=av.progressStuds or 0,totalStuds=av.totalStuds or 0}end function
ak.OnStatusChanged(au)if type(au)~='function'then return function()end end table
.insert(an,au)return function()for av,ax in ipairs(an)do if ax==au then table.
remove(an,av)break end end end end ao=ab.OnBossActiveChanged(function(au)if not
au then return end if ah.ResumeWanted()or at then local av=ah.GetActiveMap()or
ab.GetCurrentDungeonName()if av and af.GetMapMode(av)=='full'then local ax=ab.
GetCurrentRoomIndex()if ax>0 and af.HasSegmentOrMacro(av,ax)then ad.
EnableExclusive'PathRecord'ah.Start()as'boss'end end return end if ah.IsPlaying(
)then local av=ah.GetActiveMap()or ab.GetCurrentDungeonName()if av and af.
GetMapMode(av)=='full'then ad.EnableExclusive'PathRecord'else ae.Notify(
'Path Record','Boss room: t\u{1ea1}m d\u{1eeb}ng, d\u{f9}ng Hazard Scanner',3)as
'boss'end end end)ap=af.OnChanged(function()as'storage'end)aq=ab.
OnRoomIndexChanged(function()if not at and not ah.ResumeWanted()then return end
local au=ab.GetCurrentRoomIndex()if au<=0 or ab.IsInLobby()or ab.IsDead()then
return end local av=ab.GetCurrentDungeonName()if not av or#av==0 then return end
if ah.GetActiveMap()and ah.GetActiveMap()~=av then return end if ab.
IsBossActive()and af.GetMapMode(av)~='full'then return end if not af.
HasSegmentOrMacro(av,au)then return end if not ah.IsPlaying()then ad.
EnableExclusive'PathRecord'ah.Start()as'resumed'end end)ar=ab.
OnDungeonNameChanged(function(au)if ag.IsRecording()then ag.Stop
'\u{111}\u{1ed5}i map'end if ah.IsPlaying()or ah.ResumeWanted()then local av=ah.
GetActiveMap()if av and av~=au then ah.Stop()end end if at and au and#au>0 then
task.delay(0.3,function()if not at or ah.IsPlaying()or ag.IsRecording()then
return end local av=ab.GetCurrentRoomIndex()if av>0 and af.HasSegmentOrMacro(au,
av)then if not(ab.IsBossActive()and af.GetMapMode(au)~='full')then ad.
EnableExclusive'PathRecord'ah.Start()as'map_autoplay'end end end)end as'map'end)
ag.SetCapture(al)ah.SetReplayTimeline(am)ad.Register('PathRecord',function(au)if
not au then ah.PauseForExclusive()end as'disabled'end,ak.IsEnabled)task.delay(1,
function()if at and not ah.IsPlaying()and not ag.IsRecording()then local au=ab.
GetCurrentDungeonName()if au and#au>0 and not ab.IsInLobby()then if af.
HasSegmentOrMacro(au,ab.GetCurrentRoomIndex())then ak.TogglePlay(true)end end
end end)ac.Register(function()ah.Stop()ag.Cancel()ai.Clear()if ao then ao()ao=
nil end if aq then aq()aq=nil end if ar then ar()ar=nil end if ap then ap()ap=
nil end end)return ak end function a.ag()local aa,ab,ac,ad,ae,af=a.load'e',a.
load'b',a.load'af',a.load'd',a.load'g',a.load'c'local ag=aa.RunService return
function(ah,ai)local aj=ai:Section{Side='Left'}aj:Header{Name=
'Path Record Controls'}aj:Label{Text=
"Macro = 1 b\u{1ea3}n ghi cho c\u{1ea3} map, <font color='rgb(0,255,120)'>b\u{1ea5}m Record 1 l\u{1ea7}n l\u{e0} ghi li\u{ea}n t\u{1ee5}c</font> qua t\u{1eeb}ng room (t\u{1ef1} l\u{1b0}u khi v\u{1ec1} lobby). Mode FULL -> record & ph\u{e1}t lu\u{f4}n c\u{1ea3} boss room."
}local ak,al,am,an,ao,ap,aq=false,false,false,false local ar,as=function()if not
ao then return nil end local ar=ao:GetOptions()for as,at in pairs(ar)do if at
and as~='None'then local au=string.match(as,'^Map %[(.+)%] %(%d+ rooms%)$')if au
and#au>0 then return au end end end return nil end,aj:Toggle{Name=
'Record Path (Macro)',Default=ac.IsRecording(),Callback=function(ar)if ak then
return end if ar then if ac.IsRecording()then return end if ac.
CurrentRoomHasRecord()then if an then return end an=true ah:Dialog{Title=
'Confirm Record',Description=
"Room n\u{e0}y <font color='rgb(255,200,0)'>\u{111}\u{e3} c\u{f3} macro \u{111}\u{1b0}\u{1ee3}c l\u{1b0}u</font>.\n\nRecord b\u{e2}y gi\u{1edd} s\u{1ebd} <b>GHI \u{110}\u{c8} segment c\u{169}</b> c\u{1ee7}a room \u{111}\u{f3}.\nB\u{1ea1}n v\u{1eab}n mu\u{1ed1}n record l\u{1ea1}i ch\u{1ee9}?"
,Buttons={{Name='Record (Overwrite)',Callback=function()an=false local as=ac.
ToggleRecord(true)if not as then pcall(function()ak=true recordToggle:
UpdateState(false)ak=false end)end end},{Name='Cancel',Callback=function()an=
false local as,at=pcall(function()ak=true recordToggle:UpdateState(false)ak=
false end)if not as then ak=false warn(
'Path Record: Cancel failed to reset toggle - '..tostring(at))end end}}}return
end ac.ToggleRecord(true)else an=false if ac.IsRecording()then ac.ToggleRecord(
false)end end end}aj:Label{Text=
"Record b\u{1eaf}t <font color='rgb(255,150,80)'>kho\u{1ea3}ng d\u{1eeb}ng</font> + <font color='rgb(255,80,80)'>skill (M2 / Q / E)</font> + h\u{1b0}\u{1edb}ng m\u{1eb7}t \u{111}\u{1ec3} ph\u{e1}t l\u{1ea1}i ch\u{ed}nh x\u{e1}c tuy\u{1ec7}t \u{111}\u{1ed1}i."
}local at,au,av,ax,ay,az,aA,aB=aj:Label{Text=
[[Record Mode (theo map): <font color='rgb(120,200,255)'>NORMAL</font>]]},aj:
Toggle{Name='Full Mode (Record & Play Boss Rooms)',Default=false,Callback=
function(at)if am then return end local au=ac.GetStatus().map local av=(au and#
au>0)and au or ar()if not av or#av==0 then af.Notify('Path Record',
'Ch\u{1b0}a c\u{f3} map n\u{e0}o \u{111}\u{1b0}\u{1ee3}c ch\u{1ecd}n. H\u{e3}y ch\u{1ecd}n map trong dropdown ho\u{1eb7}c v\u{e0}o dungeon.'
,3)pcall(function()am=true recordBossToggle:UpdateState(false)am=false end)
return end ac.SetMapMode(av,at and'full'or'normal')af.Notify('Path Record',(
'Map [%s]: Ch\u{1ebf} \u{111}\u{1ed9} %s'):format(av,at and
'FULL (record & ph\u{e1}t c\u{1ea3} boss room)'or
'NORMAL (b\u{1ecf} qua boss, d\u{f9}ng Hazard Scanner)'),3)if ap then ap(ac.
GetStatus())end end},aj:Toggle({Name='Play Path (Macro)',Default=ac.
IsAutoPlayWanted(),Callback=ad.Wrap(function(at)if al then return end ac.
TogglePlay(at)end)},'Toggle_PR_Play'),aj:Toggle({Name='Record Pauses & Skills',
Default=ac.IsTimelineCaptureEnabled(),Callback=ad.Wrap(function(at)ac.
SetTimelineCapture(at)end)},'Toggle_PR_TimelineCapture'),aj:Toggle({Name=
'Replay Pauses & Skills',Default=ac.IsTimelineReplayEnabled(),Callback=ad.Wrap(
function(at)ac.SetTimelineReplay(at)end)},'Toggle_PR_TimelineReplay'),aj:Toggle(
{Name='Match Record Speed (Precise)',Default=ac.IsSpeedMatchEnabled(),Callback=
ad.Wrap(function(at)ac.SetSpeedMatch(at)end)},'Toggle_PR_SpeedMatch'),aj:Toggle(
{Name='Use Player Fast Speed',Default=ac.IsUseFastSpeedEnabled(),Callback=ad.
Wrap(function(at)ac.SetUseFastSpeed(at)end)},'Toggle_PR_UseFastSpeed'),ai:
Section{Side='Left'}aB:Header{Name='Combat & Skill Timing'}ae.
PatchSliderLoadCallback(aB:Slider({Name='Pre-Aim Lead Time (s)',Default=ac.
GetPreAimTime(),Minimum=0.1,Maximum=1.5,DisplayMethod='Value',Precision=2,
Callback=ad.Wrap(function(aC)ac.SetPreAimTime(aC)end),onInputComplete=function(
aC)ad.SaveNow()af.Notify('Path Record',('Saved Pre-Aim Lead Time = %ss'):format(
tostring(aC)),2)end},'Slider_PR_PreAimTime'))ae.PatchSliderLoadCallback(aB:
Slider({Name='Skill Face Hold (s)',Default=ac.GetSkillFaceHold(),Minimum=0.5,
Maximum=2,DisplayMethod='Value',Precision=2,Callback=ad.Wrap(function(aC)ac.
SetSkillFaceHold(aC)end),onInputComplete=function(aC)ad.SaveNow()af.Notify(
'Path Record',('Saved Skill Face Hold = %ss'):format(tostring(aC)),2)end},
'Slider_PR_SkillFaceHold'))ae.PatchSliderLoadCallback(aB:Slider({Name=
'Skill Double Click Delay (s)',Default=ac.GetDoubleClickDelay(),Minimum=0.005,
Maximum=0.1,DisplayMethod='Value',Precision=3,Callback=ad.Wrap(function(aC)ac.
SetDoubleClickDelay(aC)end),onInputComplete=function(aC)ad.SaveNow()af.Notify(
'Path Record',('Saved Double Click Delay = %ss'):format(tostring(aC)),2)end},
'Slider_PR_DoubleClickDelay'))ae.PatchSliderLoadCallback(aB:Slider({Name=
'Start / Finish Pause Time (s)',Default=ac.GetStartPauseTime(),Minimum=0,Maximum
=3,DisplayMethod='Value',Precision=2,Callback=ad.Wrap(function(aC)ac.
SetStartPauseTime(aC)end),onInputComplete=function(aC)ad.SaveNow()af.Notify(
'Path Record',('Saved Start / Finish Pause Time = %ss'):format(tostring(aC)),2)
end},'Slider_PR_StartPauseTime'))local aC=ai:Section{Side='Left'}aC:Header{Name=
'Macro Storage'}ao=ae.PatchDropdownRestore(aC:Dropdown{Name='Map Recording',
Options={'None'},Default=1,Required=true,Callback=function(aD)local aE=ac.
GetStatus()if ap then ap(aE)end if aq then aq(aE)end end},false)local aD,aE,aF,
aG,aH,aI=aC:Button{Name='Delete Selected Map',Callback=ad.Wrap(function()local
aD=ar()if aD and#aD>0 then ac.RemoveMap(aD)end end)},aC:Button{Name=
'Reload Macros (EsclipseHub/DQMacro)',Callback=function()ac.ReloadFromDisk()af.
Notify('Path Record',
'\u{110}\u{e3} qu\u{e9}t v\u{e0} t\u{1ea3}i l\u{1ea1}i c\u{e1}c file macro t\u{1eeb} EsclipseHub/DQMacro/'
,2)end},false,'Clear All Recordings',
"<font color='rgb(255,80,80)'>Confirm Clear All?</font>",3 local aJ=function()if
not aF then return end aF=false if clearTimer then task.cancel(clearTimer)
clearTimer=nil end pcall(function()clearBtn:UpdateName(aG)end)end local aK,aL=aC
:Button{Name=aG,Callback=function()if not aF then aF=true if clearTimer then
task.cancel(clearTimer)end clearTimer=task.delay(aI,aJ)pcall(function()clearBtn:
UpdateName(aH)end)return end aJ()ac.ClearAll()end},ai:Section{Side='Right'}aL:
Header{Name='Status Monitor & Live HUD'}local aM,aN,aO,aP,aQ,aR=aL:Label{Text=
"State: <font color='rgb(160,160,160)'>Idle</font>"},aL:Label{Text=
"Progress: <font color='rgb(160,160,160)'>-</font>"},aL:Label{Text=
[[Room: <font color='rgb(160,160,160)'>-</font> | Boss: <font color='rgb(160,160,160)'>-</font>]]
},aL:Label{Text="Events: <font color='rgb(160,160,160)'>-</font>"},aL:Label{Text
="Macros: <font color='rgb(160,160,160)'>None</font>"},ai:Section{Side='Right'}
aR:Header{Name='Path 3D Visualizer'}aR:Label{Text=
"Visual t\u{1eeb}ng node \u{111}\u{1b0}\u{1edd}ng \u{111}i: <font color='rgb(255,90,90)'>\u{1f534} \u{110}\u{1ecf} khi Record</font> (real-time) | <font color='rgb(0,255,120)'>\u{1f7e2} Xanh l\u{e1} khi th\u{1b0}\u{1edd}ng</font> (xem / ph\u{e1}t macro)."
}local aS,aT,aU,aV=aR:Toggle({Name='Show Path Nodes (3D Spheres)',Default=ac.
IsVisualEnabled(),Callback=ad.Wrap(function(aS)ac.SetVisualEnabled(aS)end)},
'Toggle_PR_VisualEnabled'),aR:Toggle({Name='Connect Path Lines',Default=ac.
IsVisualShowLinesEnabled(),Callback=ad.Wrap(function(aS)ac.SetVisualShowLines(aS
)end)},'Toggle_PR_VisualShowLines'),aR:Toggle({Name=
'Show Event Spheres & 3D Text',Default=ac.IsVisualShowEventsEnabled(),Callback=
ad.Wrap(function(aS)ac.SetVisualShowEvents(aS)end)},'Toggle_PR_VisualShowEvents'
),aR:Toggle({Name='Show Skill Facing Rays',Default=ac.IsVisualShowFacingEnabled(
),Callback=ad.Wrap(function(aS)ac.SetVisualShowFacing(aS)end)},
'Toggle_PR_VisualShowFacing')ae.PatchSliderLoadCallback(aR:Slider({Name=
'Sphere Node Size',Default=ac.GetVisualNodeRadius(),Minimum=0.1,Maximum=1.2,
DisplayMethod='Value',Precision=2,Callback=ad.Wrap(function(aW)ac.
SetVisualNodeRadius(aW)end),onInputComplete=function(aW)ad.SaveNow()end},
'Slider_PR_VisualNodeRadius'))aR:Toggle({Name='Always On Top (X-Ray)',Default=ac
.IsVisualAlwaysOnTopEnabled(),Callback=ad.Wrap(function(aW)ac.
SetVisualAlwaysOnTop(aW)end)},'Toggle_PR_VisualAlwaysOnTop')local aW=ai:Section{
Side='Right'}aW:Header{Name='Skill Range Visual'}aW:Label{Text=
"V\u{f2}ng tr\u{f2}n quanh nh\u{e2}n v\u{1ead}t gi\u{fa}p \u{1b0}\u{1edb}c l\u{1b0}\u{1ee3}ng <font color='rgb(0,255,200)'>t\u{1ea7}m \u{111}\u{e1}nh / ph\u{1ea1}m vi AOE</font> c\u{1ee7}a skill \u{111}\u{1ec3} c\u{103}n g\u{f3}c v\u{e0} v\u{1ecb} tr\u{ed} x\u{1ea3} chi\u{ea}u khi record."
}local aX=aW:Toggle({Name='Show Range Circle',Default=ac.IsRangeVisualEnabled(),
Callback=ad.Wrap(function(aX)ac.SetRangeVisual(aX)end)},'Toggle_PR_RangeVisual')
ae.PatchSliderLoadCallback(aW:Slider({Name='Skill Range (Studs)',Default=ac.
GetRangeVisualRadius(),Minimum=5,Maximum=120,DisplayMethod='Value',Precision=1,
Callback=ad.Wrap(function(aY)ac.SetRangeVisualRadius(aY)end),onInputComplete=
function(aY)ad.SaveNow()end},'Slider_PR_RangeRadius'))aW:Toggle({Name=
'Fill Circle Area',Default=ac.IsRangeVisualFillEnabled(),Callback=ad.Wrap(
function(aY)ac.SetRangeVisualFill(aY)end)},'Toggle_PR_RangeFill')local aY,aZ,a_=
ac.GetRangeColorNames(),ac.GetSelectedCircleColor(),1 for a0,a1 in ipairs(aY)do
if a1==aZ then a_=a0 break end end ae.PatchDropdownRestore(aW:Dropdown({Name=
'Circle Color',Options=aY,Default=a_,Required=true,Callback=ad.Wrap(function(a0)
ac.SetCircleColor(a0)end)},'Dropdown_PR_CircleColor'),false)local a0,a1,a2=aW:
Toggle({Name='Highlight In-Range Enemies (Glow)',Default=ac.
IsHighlightInRangeEnabled(),Callback=ad.Wrap(function(a0)ac.SetHighlightInRange(
a0)end)},'Toggle_PR_HighlightInRange'),ac.GetSelectedHighlightColor(),2 for a3,
a4 in ipairs(aY)do if a4==a1 then a2=a3 break end end ae.PatchDropdownRestore(aW
:Dropdown({Name='Enemy Highlight Color',Options=aY,Default=a2,Required=true,
Callback=ad.Wrap(function(a3)ac.SetHighlightColor(a3)end)},
'Dropdown_PR_HighlightColor'),false)local a3=function(a3)a3=math.clamp(a3 or 0,0
,100)local a4=10 local a5=math.round((a3/100)*a4)local a6=a4-a5 local a7=string.
rep('\u{25a0}',a5)..string.rep('\u{25a1}',a6)return(
"<font color='rgb(0,255,180)'>%s</font> <b>%d%%</b>"):format(a7,a3)end aq=
function(a4)if not an then pcall(function()if as and as.GetState and as:
GetState()~=a4.recording then ak=true as:UpdateState(a4.recording)ak=false end
end)end pcall(function()local a5=ac.IsAutoPlayWanted()if av and av.GetState and
av:GetState()~=a5 then al=true av:UpdateState(a5)al=false end end)pcall(function
()local a5=a4.map local a6=(a5 and#a5>0)and a5 or ar()local a7=a6 and ac.
GetMapMode(a6)=='full'or false if au and au.GetState and au:GetState()~=a7 then
am=true au:UpdateState(a7)am=false end end)pcall(function()if aS and aS.GetState
and aS:GetState()~=ac.IsVisualEnabled()then aS:UpdateState(ac.IsVisualEnabled())
end end)pcall(function()if aT and aT.GetState and aT:GetState()~=ac.
IsVisualShowLinesEnabled()then aT:UpdateState(ac.IsVisualShowLinesEnabled())end
end)pcall(function()if aU and aU.GetState and aU:GetState()~=ac.
IsVisualShowEventsEnabled()then aU:UpdateState(ac.IsVisualShowEventsEnabled())
end end)pcall(function()if aV and aV.GetState and aV:GetState()~=ac.
IsVisualShowFacingEnabled()then aV:UpdateState(ac.IsVisualShowFacingEnabled())
end end)pcall(function()if aX and aX.GetState and aX:GetState()~=ac.
IsRangeVisualEnabled()then aX:UpdateState(ac.IsRangeVisualEnabled())end end)
pcall(function()if a0 and a0.GetState and a0:GetState()~=ac.
IsHighlightInRangeEnabled()then a0:UpdateState(ac.IsHighlightInRangeEnabled())
end end)end local a4,a5=function(a4)local a5={}for a6,a7 in ipairs(a4)do a5[#a5+
1]=('Map [%s] (%d rooms)'):format(a7.map,a7.roomCount)end if#a5==0 then a5[1]=
'None'end return a5 end local a6=function(a6)local a7=a4(a6)local a8=table.
concat(a7,'|')if a8==a5 then return end a5=a8 local a9 for b,ba in pairs(ao:
GetOptions())do if ba then a9=b break end end pcall(function()ao:ClearOptions()
end)pcall(function()ao:InsertOptions(a7)end)local b=a9 if not b or not ao:
IsOption(b)then b=a7[1]end pcall(function()ao:UpdateSelection(b)end)end ap=
function(a7)local a8,a9=false,a7.map local b=(a9 and#a9>0)and a9 or ar()if b
then a8=ac.GetMapMode(b)=='full'end local ba if a7.recording then ba=
"<font color='rgb(255,90,90)'>Recording...</font>"elseif a7.playing then ba=
"<font color='rgb(0,230,255)'>Playing</font>"elseif a7.resume then ba=
"<font color='rgb(255,200,0)'>Waiting (auto-resume)</font>"elseif a7.
autoPlayWanted then if a7.inLobby then ba=
"<font color='rgb(100,220,100)'>Armed (Lobby)</font>"elseif not a7.map or#a7.map
==0 then ba="<font color='rgb(100,220,100)'>Armed (Loading...)</font>"elseif a7.
boss and not a8 then ba=
"<font color='rgb(255,160,50)'>Waiting (Boss Room)</font>"else ba=
[[<font color='rgb(100,220,100)'>Armed (Waiting for Room)</font>]]end else ba=
"<font color='rgb(160,160,160)'>Idle</font>"end pcall(function()aM:UpdateName(
'State: '..ba)end)if a7.playing then local bb,bc=a3(a7.progressPercent),(
'(%.1f / %.1f studs)'):format(a7.progressStuds or 0,a7.totalStuds or 0)pcall(
function()aN:UpdateName('Progress: '..bb..' '..bc)end)elseif a7.recording then
pcall(function()aN:UpdateName(
[[Progress: <font color='rgb(255,90,90)'>Recording Segment...</font> (]]..
tostring(a7.pointCount or 0)..' pts)')end)else pcall(function()aN:UpdateName
"Progress: <font color='rgb(160,160,160)'>-</font>"end)end local bb,bc=a8 and
"<font color='rgb(255,140,255)'>FULL</font>"or
"<font color='rgb(120,200,255)'>NORMAL</font>",b and(' (map ['..b..'])')or
' (theo map)'pcall(function()at:UpdateName('Record Mode'..bc..': '..bb)end)local
bd if a7.boss then if a8 then bd=
"<font color='rgb(255,140,255)'>YES (FULL path)</font>"else bd=
"<font color='rgb(255,80,80)'>YES (d\u{f9}ng Hazard Scanner)</font>"end else bd=
"<font color='rgb(0,255,120)'>No</font>"end local be,bf=a7.room and a7.room>0
and("<font color='rgb(0,255,255)'>room %d</font>"):format(a7.room)or
"<font color='rgb(160,160,160)'>-</font>",a7.map and#a7.map>0 and(
"<font color='rgb(150,255,150)'>%s</font>"):format(a7.map)or
"<font color='rgb(160,160,160)'>-</font>"pcall(function()aO:UpdateName('Map: '..
bf..' | Room: '..be..' | Boss: '..bd)end)if a7.recording then local bg=a7.phase
or 1 pcall(function()aP:UpdateName((
[[Events: <font color='rgb(255,170,60)'>%d pts</font> | <font color='rgb(255,90,220)'>%d skills</font> | <font color='rgb(255,215,0)'>%d pauses</font> (Phase %d)]]
):format(a7.pointCount or 0,a7.skillCount or 0,a7.dwellCount or 0,bg))end)elseif
a7.playing then local bg=a7.phase or 1 pcall(function()aP:UpdateName((
"Playing: <font color='rgb(0,230,255)'>Phase %d</font>"):format(bg))end)else
pcall(function()aP:UpdateName"Events: <font color='rgb(160,160,160)'>-</font>"
end)end local bg=ac.GetMaps()if#bg==0 then pcall(function()aQ:UpdateName
"Macros: <font color='rgb(160,160,160)'>None</font>"end)else local bi={}for bj,
bk in ipairs(bg)do local bl,bm=bk.bossCount and bk.bossCount>0 and('+%db'):
format(bk.bossCount)or'',bk.phaseCount and bk.phaseCount>bk.roomCount and(
'/%dph'):format(bk.phaseCount)or''bi[#bi+1]=('%s(%dr%s/%dp%s)'):format(bk.map,bk
.roomCount,bm,bk.pointCount,bl)end pcall(function()aQ:UpdateName(
"Macros: <font color='rgb(150,255,150)'>"..table.concat(bi,', ')..'</font>')end)
end a6(bg)end local a7,a8=ac.OnStatusChanged(function(a7)ap(a7)aq(a7)end),0
local a9=ag.Heartbeat:Connect(function()local a9=os.clock()if a9-a8<0.35 then
return end a8=a9 local b=ac.GetStatus()ap(b)aq(b)end)ab.Register(function()if a9
then a9:Disconnect()a9=nil end if a7 then a7()a7=nil end end)ap(ac.GetStatus())
aq(ac.GetStatus())end end function a.ah()return function(aa)local ab,ac=game:
GetService'Players',os.clock()+15 while not ab.LocalPlayer do if os.clock()>ac
then break end task.wait(0.1)end local ad=ab.LocalPlayer if not ad then return
warn
'[DungeonQuest] Kh\u{f4}ng l\u{1ea5}y \u{111}\u{1b0}\u{1ee3}c LocalPlayer, h\u{1ee7}y kh\u{1edf}i t\u{1ea1}o script.'
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
load'F',a.load'K',a.load'M',a.load'W',a.load'_',a.load'ag'al(ah,ak.Combat)am(ah,
ak.Dungeon)an(ah,ak.Inventory)ao(ah,ak.Utilities)ap(ah,ak.Configs)aq(ah,ak.
PathRecord)local ar=a.load'h'ar.Init()local as=a.load'R'as.Init()a.load'O'local
at=a.load'X'at.SetWindow(ah)at.Execute()ak.Combat:Select()local au=a.load'w'au.
SetLocked(true)ae:LoadAutoLoadConfig()local av=function()local av=ae.Folder..
'/settings/autoload.txt'if isfile and isfile(av)then local ax,ay=pcall(readfile,
av)if ax and type(ay)=='string'and#ay>0 then ag.SetActive(ay)end end end av()
local ax=a.load'r'ax.LoadData(ae.contextData)task.delay(0.3,function()au.
SetLocked(false)end)task.delay(1.5,function()ag.Resume()end)end end function a.
ai()local aa={}function aa:Export()local ab={}for ac,ad in pairs(self)do if
typeof(ad)=='Instance'or type(ad)=='table'then local ae,af=pcall(function()end)
if ae and af~=nil then ab[ac]=af end end end return ab end function aa:Import(ab
)for ac,ad in pairs(ab)do local ae=self[ac]if ae and ae.Value~=nil then local af
=pcall(function()end)if not af then warn(`Failed to import value for flag "{ac}"`
)end end end end function aa:Reset()for ab in pairs(self)do self[ab]=nil end end
return aa end function a.aj()local aa,ab=a.load'T',{}function ab:Window(ac)ac=ac
or{}print'Made a window'local ad=aa.Wrap(ac,{Visible=function(ad)print(
'Set window visibility to:',ad)end})return aa.Apply(ac,ad)end return ab end
function a.ak()local aa,ab=a.load'T',{}return(aa.Wrap(ab,{Enabled=function(ac)
print(`{ac and'Enabled'or'Disabled'} ESP.`)end}))end function a.al()local aa,ab,
ac=a.load'ai',a.load'aj',a.load'ak'local ad=ab:Window{Visible=true}return{Flags=
aa,Esp=ac,Interface=ab,Window=ad,Tabs={Home=function(ae)end,Visuals=function(ae)
end,Settings=function(ae)end,Config=function(ae)end}}end function a.am()local aa
={}function aa.GetPlayer()local ab,ac=pcall(function()return game:GetService
'Players'end)return ab and(ac).LocalPlayer end function aa.GetCharacter(ab)local
ac,ad=pcall(function()return ab and ab.Character end)return ac and ad end
function aa.GetHumanoid(ab)local ac,ad=pcall(function()local ac=aa.GetCharacter(
ab)return ac and ac:FindFirstChildOfClass'Humanoid'end)return ac and ad end
return aa end function a.an()local aa=function(aa)return game:GetService(aa)end
return{Players=(aa'Players')}end function a.ao()return function(aa)local ab,ac,
ad=a.load'al',a.load'am',a.load'an'local ae,af,ag,ah,ai,aj,ak=ab.Flags,ab.Esp,ab
.Interface,ab.Window,ab.Tabs,ac.GetPlayer(),ad.Players do ai.Home(aa)end do
local al=ah:Tab{Name='Exploits'}al:Toggle{Name='Flight'}end do ai.Visuals(aa)end
do local al=ai.Settings(aa)al:Toggle{Name='Dark Mode'}end do ai.Config(aa)end ah
.Title=aa.Name end end end local aa=_G.ScriptHub_Cleanup if typeof(aa)==
'function'then pcall(aa)end _G.ScriptHub_Cleanup=nil local ab=_G.ScriptHub_UI if
typeof(ab)=='table'and typeof(ab.Unload)=='function'then pcall(ab.Unload,ab)end
_G.ScriptHub_UI=nil local ac={{Name='DungeonQuest',Load=a.load'ah',UniverseId=
9931749389,Places={77649408247578,3220968688,2414851778}},{Name='Game 2',Load=a.
load'ao',Places={123456789,987654321}}}for ad=1,300 do if game.GameId~=0 and
game.PlaceId~=0 then break end task.wait(0.1)end for ad,ae in pairs(ac)do if ae.
Places then for af,ag in ipairs(ae.Places)do if ag==game.PlaceId then return ae:
Load()end end end if ae.UniverseId and ae.UniverseId==game.GameId then return ae
:Load()end end