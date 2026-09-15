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
.b()local aa,ab={}function aa:SetWindow(ac)ab=ac end function aa.Notify(ac,ad,ae
)ae=ae or 3 if ab then local af=pcall(function()ab:Notify{Title=ac,Description=
ad,Lifetime=ae}end)if af then return end end pcall(function()game:GetService
'StarterGui':SetCore('SendNotification',{Title=ac,Text=ad,Duration=ae})end)end
return aa end function a.c()local aa,ab,ac,ad,ae,af=a.load'a',a.load'b',{},false
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
end end return ac end function a.d()local aa={cleaned=false,callbacks={}}
function aa.Register(ab)if type(ab)~='function'then return function()end end if
aa.cleaned then pcall(ab)return function()end end table.insert(aa.callbacks,ab)
return function()for ac,ad in ipairs(aa.callbacks)do if ad==ab then table.
remove(aa.callbacks,ac)break end end end end function aa.Cleanup()if aa.cleaned
then return end aa.cleaned=true for ab=#aa.callbacks,1,-1 do pcall(aa.callbacks[
ab])end table.clear(aa.callbacks)end function aa.IsActive()return not aa.cleaned
end return aa end function a.e()local aa,ab,ac,ad=game:GetService'Players',game:
GetService'UserInputService',game:GetService'RunService',game:GetService
'VirtualInputManager'local ae=aa.LocalPlayer if not ae then local af=os.clock()+
5 repeat ae=aa.LocalPlayer if ae then break end task.wait(0.1)until os.clock()>
af end return{Players=aa,UserInputService=ab,RunService=ac,VirtualInputManager=
ad,player=ae}end function a.f()local aa,ab=a.load'e',a.load'd'local ac,ad,ae,af,
ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax,ay=aa.player,0.05,
'enemyProjectiles',0.5,{},false,16,16,true,false,false,{},0,{},0,{},{},{},{},{},
{},0,{}local az,aA,aB,aC,aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP=function()for az
=#ay,1,-1 do pcall(ay[az])end end,{},'unknown',true,{},{},{},0,4,false local aQ=
function(aQ)if aQ then table.insert(aF,aQ)end return aQ end function ag.
OnRespawn(aR)table.insert(aE,aR)end function ag.GetLastRespawnTime()return aG
end function ag.GetRespawnProtectionDuration()return aH end function ag.
SetRespawnProtectionDuration(aR)if type(aR)=='number'and aR>=0 then aH=aR end
end function ag.GetRespawnProtectionRemaining()if aG==0 then return 0 end local
aR=os.clock()-aG local aS=aH-aR return math.max(0,aS)end function ag.
IsJustRespawned(aR)local aS=aR or aH if aG==0 then return false end return(os.
clock()-aG)<=aS end function ag.WasDead()return aI end function ag.IsDead()local
aR=ac and ac.Character if not aR or not aR.Parent then return true end local aS=
aR:FindFirstChildOfClass'Humanoid'if not aS or aS.Health<=0 then return true end
return false end function ag.IsInvulnerable()local aR=ac and ac.Character if not
aR or not aR.Parent then return false,nil end local aS=aR:FindFirstChildOfClass
'Humanoid'if aS and aS.Health<=0 then return false,nil end local aT=aR:
FindFirstChildOfClass'ForceField'if aT and aT.Visible~=false then return true,
'ForceField'end local aU,aV,aW=aR:GetAttribute'Invulnerable',aR:GetAttribute
'Immune',aR:GetAttribute'Respawning'if aU==true or aV==true or aW==true then
return true,'Attribute'end local aX,aY,aZ=aR:FindFirstChild'Invulnerable',aR:
FindFirstChild'Immune',aR:FindFirstChild'Respawning'if(aX and aX:IsA'BoolValue'
and aX.Value==true)or(aY and aY:IsA'BoolValue'and aY.Value==true)or(aZ and aZ:
IsA'BoolValue'and aZ.Value==true)then return true,'Value'end local a_=ag.
GetRespawnProtectionRemaining()if a_>0 then return true,(
'Respawn Shield (%.1fs)'):format(a_)end return false,nil end local aR=function(
aR)if not aR or not aR:IsA'Model'then return nil end local aS=aR:FindFirstChild
'HumanoidRootPart'if aS and aS:IsA'BasePart'then return aS end if aR.PrimaryPart
and aR.PrimaryPart:IsA'BasePart'then return aR.PrimaryPart end for aT,aU in
ipairs(aR:GetDescendants())do if aU:IsA'BasePart'then return aU end end return
nil end local aS,aT=function(aS)if not aS or not aS:IsA'Model'or not aS.Parent
or aS==ac.Character then return false end local aT=aS:FindFirstChildOfClass
'Humanoid'if not aT or aT.Health<=0 then return false end return aR(aS)~=nil end
,function(aS)local aT=av[aS]if not aT then return end if aT.Died then aT.Died:
Disconnect()aT.Died=nil end av[aS]=nil end local aU,aV=function(aU)if not aU or
not at[aU]then return end aw[aU]=nil at[aU]=nil ax-=1 aT(aU)az()aN()end,function
(aU)if not dungeon or not aU then return nil end local aV=aU.Parent while aV do
if aV==dungeon then return nil end if aV.Parent==dungeon and(aV:IsA'Folder'or aV
:IsA'Model')then return aV end aV=aV.Parent end return nil end local aW=function
(aW)if not aS(aW)or at[aW]then return end local aX,aY=aR(aW),aW:
FindFirstChildOfClass'Humanoid'if not aX or not aY then return end at[aW]={Model
=aW,Root=aX,Humanoid=aY,Room=aV(aW)}ax+=1 av[aW]={Died=aY.Died:Connect(function(
)aU(aW)end)}az()aN()end local aX=function(aX)if not aX then return end if aS(aX)
then aW(aX)return end if aw[aX]then return end aw[aX]=true task.spawn(function()
local aY=os.clock()+2 while aX.Parent and os.clock()<aY do if aS(aX)then aw[aX]=
nil aW(aX)return end task.wait(0.03)end aw[aX]=nil if aX.Parent and aS(aX)then
aW(aX)end end)end local aY=function(aY)if not aY or as[aY]then return end as[aY]
=true for aZ,a_ in ipairs(aY:GetDescendants())do if a_:IsA'Model'and aS(a_)then
aW(a_)end end au[aY]={Added=aY.DescendantAdded:Connect(function(aZ)if aZ:IsA
'Model'then aX(aZ)elseif aZ:IsA'Humanoid'then local a_=aZ:
FindFirstAncestorOfClass'Model'if a_ then aX(a_)end end end),Removed=aY.
DescendantRemoving:Connect(function(aZ)if aZ:IsA'Model'then aU(aZ)end end)}end
aL=function()if not dungeon then dungeon=workspace:WaitForChild('dungeon',30)end
if not dungeon then return false end ao=0 for aZ=#ap,1,-1 do pcall(ap[aZ],ao)end
aq=0 for aZ=#ar,1,-1 do pcall(ar[aZ],aq)end for aZ,a_ in ipairs(dungeon:
GetChildren())do if a_:IsA'Folder'or a_:IsA'Model'then aY(a_)end end au[dungeon]
={Added=dungeon.DescendantAdded:Connect(function(aZ)if aZ:IsA'Model'then aX(aZ)
elseif aZ:IsA'Humanoid'then local a_=aZ:FindFirstAncestorOfClass'Model'if a_
then aX(a_)end end end),Removed=dungeon.DescendantRemoving:Connect(function(aZ)
if aZ:IsA'Model'then aU(aZ)end end)}return true end aM=function()if not dungeon
then return end for aZ,a_ in pairs(au)do if a_.Added then pcall(function()a_.
Added:Disconnect()end)end if a_.Removed then pcall(function()a_.Removed:
Disconnect()end)end end au={}as={}for aZ in pairs(at)do aT(aZ)end at={}ax=0 aw={
}dungeon=nil end aK=function()for aZ,a_ in pairs(at)do if not aZ or not aZ.
Parent then aU(aZ)else local a0=a_.Humanoid or aZ:FindFirstChildOfClass
'Humanoid'a_.Humanoid=a0 if not a0 or a0.Health<=0 then aU(aZ)else local a1=a_.
Root if not a1 or not a1.Parent then a1=aR(aZ)if a1 then a_.Root=a1 else aU(aZ)
end end end end end end function ag.SetFastSpeed(aZ)ai=aZ if ah and humanoid and
humanoid.Parent then if humanoid.WalkSpeed<ai then al=true humanoid.WalkSpeed=ai
al=false end end end function ag.SetSpeedEnabled(aZ)ah=aZ if humanoid and
humanoid.Parent then al=true if ah then if humanoid.WalkSpeed<ai then humanoid.
WalkSpeed=ai end else humanoid.WalkSpeed=aj end al=false end end function ag.
IsSpeedEnabled()return ah end function ag.GetFastSpeed()return ai end function
ag.SetInstantAccelEnabled(aZ)ak=aZ and true or false end function ag.
IsInstantAccelEnabled()return ak end local aZ=function()if aO then aO:
Disconnect()aO=nil end if not humanoid or not humanoid.Parent then return end aO
=humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(function()if al then
return end if not humanoid or not humanoid.Parent then return end local aZ=
humanoid.WalkSpeed if ah then if aZ<ai then al=true humanoid.WalkSpeed=ai al=
false end else aj=aZ end end)end function ag.SetHumanoid(a_)if not a_ then
return end local a0=a_:WaitForChild('Humanoid',10)if not a0 then return end
humanoid=a0 rootPart=a_:WaitForChild('HumanoidRootPart',10)or a_.PrimaryPart aj=
humanoid.WalkSpeed if ah and humanoid.WalkSpeed<ai then al=true humanoid.
WalkSpeed=ai al=false end if aP then aP:Disconnect()aP=nil end aP=humanoid.Died:
Connect(function()aI=true end)aQ(humanoid.HealthChanged:Connect(function(a1)if
a1<=0 then aI=true elseif aI and a1>0 then aI=false end end))end local a_=
function()if not ab.IsActive()then return end if not ak then return end if not
humanoid or not humanoid.Parent or humanoid.Health<=0 or humanoid.Sit then
return end if not rootPart or not rootPart.Parent then local a_=ac and ac.
Character rootPart=a_ and a_:FindFirstChild'HumanoidRootPart'if not rootPart
then return end end if rootPart.Anchored then return end local a_,a0=humanoid.
MoveDirection,rootPart.AssemblyLinearVelocity if a_.Magnitude>0.05 then local a1
=ah and math.max(ai,humanoid.WalkSpeed)or humanoid.WalkSpeed rootPart.
AssemblyLinearVelocity=Vector3.new(a_.X*a1,a0.Y,a_.Z*a1)end end if aa.RunService
then local a0=aa.RunService.PreSimulation or aa.RunService.Heartbeat if a0 then
aQ(a0:Connect(a_))end end function ag.GetDungeonStartTime()return
dungeonStartTime end function ag.SetDungeonStartTime(a0)dungeonStartTime=a0 end
function ag.GetDungeonElapsed()if not dungeonStartTime then return nil end
return os.clock()-dungeonStartTime end function ag.ReadyDungeon()if not dungeon
and not aL()then return false end return true end function ag.GetHumanoid()
return humanoid end function ag.GetEnemyNames()local a0={}local a1=function(a1)
if a1 and a1~=''and a1~=ac.Name then a0[a1]=true end end if dungeon then for a2,
a3 in ipairs(dungeon:GetChildren())do if a3:IsA'Folder'or a3:IsA'Model'then for
a4,a5 in ipairs(a3:GetDescendants())do if a5:IsA'Model'and a5:
FindFirstChildOfClass'Humanoid'then a1(a5.Name)end end end end end for a2 in
pairs(at)do a1(a2.Name)end local a2={}for a3 in pairs(a0)do table.insert(a2,a3)
end table.sort(a2)return a2 end function ag.GetEnemyCount()return ax end
function ag.GetTrackedEnemyData()local a0={}for a1,a2 in pairs(at)do if a2 and
a2.Root and a2.Root.Parent then a0[#a0+1]=a2 end end return a0 end function ag.
OnEnemyChanged(a0)if type(a0)~='function'then return function()end end table.
insert(ay,a0)return function()for a1,a2 in ipairs(ay)do if a2==a0 then table.
remove(ay,a1)break end end end end function ag.GetEnemyProjectileNames()local a0
,a1={},game:GetService'ReplicatedStorage'local a2=a1:FindFirstChild(ae)if not a2
then return a0 end for a3,a4 in ipairs(a2:GetChildren())do local a5=a4.ClassName
if a5=='Model'or a5=='MeshPart'or a5=='Part'then a0[a4.Name]=true end end return
a0 end function ag.GetKeyHoldTime()return ad end if ac and ac.Character and ac.
Character.Parent then ag.SetHumanoid(ac.Character)aZ()else local a0=ac and ac.
CharacterAdded and task.spawn(function()local a0=ac.CharacterAdded:Wait()if a0
and ab.IsActive()then ag.SetHumanoid(a0)aZ()end end)end if ac then aQ(ac.
CharacterAdded:Connect(function(a0)local a1,a2=pcall(function()if not a0 then
return end aG=os.clock()ag.SetHumanoid(a0)aZ()for a1,a2 in ipairs(aE)do pcall(a2
)end end)if not a1 then warn('[Shared] respawn handler error:',tostring(a2))end
end))end task.spawn(function()while ab.IsActive()do task.wait(af)local a0=
workspace:FindFirstChild'dungeon'if dungeon and a0~=dungeon then aM()elseif not
dungeon and a0 then aL()end aN()end end)local a0=function()local a0=game:
GetService'Workspace'for a1,a2 in ipairs(a0:GetDescendants())do if a2.Name==
'dungeonName'and a2:IsA'ValueBase'then local a3=a2.Value if type(a3)=='string'
then local a4=string.gsub(a3,'%s+','')if a4~=''and string.lower(a4)~=aB then
return a3 end end end end return nil end task.spawn(function()while ab.IsActive(
)do task.wait(af)local a1=a0()if a1~=aJ then aJ=a1 if a1 then ag.ResetBossIndex(
)end for a2=#aA,1,-1 do pcall(aA[a2],a1)end end end end)local a1=function()
return not(aJ and#aJ>0)end task.spawn(function()while ab.IsActive()do task.wait(
af)local a2=a1()if a2~=aC then aC=a2 for a3=#aD,1,-1 do pcall(aD[a3],aC)end end
end end)task.spawn(function()local a2,a3=pcall(function()return aL()end)if not
a2 then warn('[EnemyTracker] Initialization error:',a3)end end)local a2,a3=0,2
task.spawn(function()while ab.IsActive()do task.wait(a3)local a4=os.clock()if a4
-a2<a3 then continue end a2=a4 if not dungeon then continue end local a5=pcall(
function()for a5,a6 in ipairs(dungeon:GetChildren())do if a6:IsA'Folder'or a6:
IsA'Model'then for a7,a8 in ipairs(a6:GetDescendants())do if a8:IsA'Model'then
aX(a8)end end end end aK()end)if not a5 then warn'[EnemyTracker] rescan error'
end end end)function ag.IsBossActive()return am end function ag.
OnBossActiveChanged(a4)if type(a4)~='function'then return function()end end
table.insert(an,a4)return function()for a5,a6 in ipairs(an)do if a6==a4 then
table.remove(an,a5)break end end end end function ag.GetCurrentBossIndex()return
ao end function ag.GetCombatTargetKey()if not am then return'Mob'end local a4=
math.clamp(ao,1,3)return'Boss'..tostring(a4)end function ag.ResetBossIndex()ao=0
for a4=#ap,1,-1 do pcall(ap[a4],ao)end end function ag.OnBossIndexChanged(a4)if
type(a4)~='function'then return function()end end table.insert(ap,a4)return
function()for a5,a6 in ipairs(ap)do if a6==a4 then table.remove(ap,a5)break end
end end end local a4=function(a4)if type(a4)~='string'then return 0 end local a5
=string.lower(a4)local a6=string.match(a5,'boss.*(%d+)')if a6 then return 100+(
tonumber(a6)or 1)end if string.find(a5,'boss')then return 100+math.max(1,ao)end
local a7=string.match(a4,'^room(%d+)$')if not a7 then return 0 end return
tonumber(a7)or 0 end local a5=function()if not dungeon then return 0 end for a5,
a6 in pairs(at)do if a6 and a6.Room then local a7=a4(a6.Room.Name)if a7>0 then
return a7 end end end if am then return 100+math.max(1,ao)end return 0 end aN=
function()local a6=a5()if a6==aq then return end aq=a6 for a7=#ar,1,-1 do pcall(
ar[a7],aq)end end function ag.GetCurrentRoomIndex()return aq end function ag.
OnRoomIndexChanged(a6)if type(a6)~='function'then return function()end end table
.insert(ar,a6)return function()for a7,a8 in ipairs(ar)do if a8==a6 then table.
remove(ar,a7)break end end end end function ag.GetCurrentDungeonName()return aJ
end function ag.OnDungeonNameChanged(a6)if type(a6)~='function'then return
function()end end table.insert(aA,a6)return function()for a7,a8 in ipairs(aA)do
if a8==a6 then table.remove(aA,a7)break end end end end function ag.IsInLobby()
return aC end function ag.OnLobbyChanged(a6)if type(a6)~='function'then return
function()end end table.insert(aD,a6)return function()for a7,a8 in ipairs(aD)do
if a8==a6 then table.remove(aD,a7)break end end end end local a6,a7=function(a6)
if am==a6 then return end am=a6 if a6 then ao+=1 for a7=#ap,1,-1 do pcall(ap[a7]
,ao)end end for a7=#an,1,-1 do pcall(an[a7],am)end aN()end local function a8()if
not ac then return end local a9=ac:FindFirstChild'PlayerGui'if not a9 then a7=
nil a6(false)return end local b=a9:FindFirstChild('bossHealth',true)if b then if
b~=a7 then a7=b if a7:IsA'ScreenGui'then aQ(a7:GetPropertyChangedSignal'Enabled'
:Connect(a8))elseif a7:IsA'GuiObject'then aQ(a7:GetPropertyChangedSignal
'Visible':Connect(a8))end end local ba=if b:IsA'ScreenGui'then b.Enabled elseif
b:IsA'GuiObject'then b.Visible else true a6(ba)else a7=nil a6(false)end end task
.spawn(function()if not ac then return end local a9=ac:WaitForChild('PlayerGui',
30)if not a9 then return end aQ(a9.DescendantAdded:Connect(a8))aQ(a9.
DescendantRemoving:Connect(a8))a8()while ab.IsActive()and task.wait(0.5)do a8()
end end)ab.Register(function()if aO then aO:Disconnect()aO=nil end for a9,b in
ipairs(aF)do pcall(function()b:Disconnect()end)end table.clear(aF)aM()end)return
ag end function a.g()local aa,ab,ac,ad,ae,af,ag={},0.85,0,2,{},64 function aa.
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
end return ar end function aa.IsPointInAnyHazard(ao,ap,aq,ar)local as=ag if not
as then return false,nil,nil end aq=aq or 0 local at,au,av,aw=math.huge,ar or as
.GetActiveHazardsMap()for ax,ay in pairs(au)do local az=ay.Instance or(typeof(ax
)=='Instance'and ax)if ap and(ap==az or(az and ap.Name==az.Name))then continue
end local aA=an(ay)if not aA then continue end local aB,aC=aA.center.X,aA.center
.Z if az and az.Parent then local aD=az:IsA'BasePart'and az or az.PrimaryPart or
az:FindFirstChildWhichIsA'BasePart'if aD then aB=aD.Position.X aC=aD.Position.Z
end end local aD,aE=ao.X-aB,ao.Z-aC local aF,aG=aD*aD+aE*aE,aA.boundingRadius+aq
if aF>aG*aG then continue end local aH=ay.IsTrajectory==true for aI=1,#aA.zones
do local aJ=aA.zones[aI]if aj(aJ.part)and al(ao,aJ,aq,aH or aJ.isTrajectory)then
local aK=(ao-aJ.part.Position).Magnitude if aK<at then at=aK av=ay aw=aJ.part
end break end end end return aw~=nil,av,aw end return aa end function a.h()local
aa,ab,ac=a.load'e',a.load'd',a.load'g'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao=
aa.RunService or game:GetService'RunService',aa.player,{},false,{},0.85,Color3.
fromRGB(255,45,45),Color3.fromRGB(0,160,255),0.55,0.25 local ap=function()local
ap=ae and ae.Character if not ap then return nil end local aq=ap:FindFirstChild
'HumanoidRootPart'or ap.PrimaryPart if not aq then return nil end return aq.
Position.Y-2.5 end function af.BindDetection(aq)an=aq or nil end function af.
IsEnabled()return ag end local aq=function(aq,ar)local as,at=aq.part,aq.ad if
not as or not as.Parent or not at or not at.Parent then return end local au=as.
Position local av=Vector3.new(au.X,ar or au.Y,au.Z)if aq.isCircle then local aw=
CFrame.new(av)*CFrame.Angles(math.rad(90),0,0)at.CFrame=as.CFrame:ToObjectSpace(
aw)else local aw,ax,ay=as.CFrame:ToOrientation()local az=CFrame.new(av)*CFrame.
Angles(0,ax,0)at.CFrame=as.CFrame:ToObjectSpace(az)end end local ar=function()if
not ag then return end local ar,as=false,ap()for at,au in pairs(ah)do if not at.
Instance or not at.Instance.Parent then af.DetachZoneVisuals(at)else ar=true if
au.items then for av,ax in ipairs(au.items)do aq(ax,as)end end end end if not ar
and ao then ao:Disconnect()ao=nil end end local as=function()if not ao and ag
then ao=ad.Heartbeat:Connect(ar)end end function af.DetachZoneVisuals(at)if not
at then return end local au=ah[at]if not au then return end if au.adornments
then for av,ax in ipairs(au.adornments)do pcall(function()ax:Destroy()end)end
table.clear(au.adornments)end if au.connections then for av,ax in ipairs(au.
connections)do pcall(function()ax:Disconnect()end)end table.clear(au.connections
)end if au.items then table.clear(au.items)end ah[at]=nil end function af.
UpdateHazardVisualColor(at,au)if not at then return end local av=ah[at]if not av
or not av.items then return end local ax=au==true or at.IsTrajectory==true local
ay,az=ax and ak or aj,ax and ac.GetTrajectoryMargin()or 0 for aA,aB in ipairs(av
.items)do local aC,aD,aE=aB.ad,aB.zone,aB.part if aC and aC.Parent and aD and aE
and aE.Parent then aC.Color3=ay if aB.isCircle and aD.radius then aC.Radius=aD.
radius+az elseif aD.half then local aF,aG=math.max(aE.Size.X,0)/2+az,math.max(aE
.Size.Z,0)/2+az aC.Size=Vector3.new(aF*2,am,aG*2)end end end end function af.
AttachZoneVisuals(at)if not ag or not at then return end if ah[at]then af.
DetachZoneVisuals(at)end local au=ac.GetHazardZones(at)if not au or not au.zones
then return end local av=at.IsTrajectory==true local ax,ay,az,aA,aB,aC=av and ak
or aj,av and ac.GetTrajectoryMargin()or 0,ap(),{},{},{}for aD,aE in ipairs(au.
zones)do local aF=aE.part if aF and aF.Parent and aF.Transparency<=ai then local
aG,aH=false if aE.radius then aG=true local aI=Instance.new
'CylinderHandleAdornment'aI.Name='HazardGroundCircle'aI.Adornee=aF aI.Radius=aE.
radius+ay aI.Height=am aI.Color3=ax aI.Transparency=al aI.ZIndex=2 aI.
AlwaysOnTop=true aI.Parent=aF aH=aI elseif aE.half and aE.cframe then local aI=
Instance.new'BoxHandleAdornment'aI.Name='HazardGroundBox'aI.Adornee=aF aI.Size=
Vector3.new(aE.half.X*2,am,aE.half.Z*2)aI.Color3=ax aI.Transparency=al aI.ZIndex
=2 aI.AlwaysOnTop=true aI.Parent=aF aH=aI end if aH then local aI={ad=aH,part=aF
,isCircle=aG,zone=aE}aq(aI,az)table.insert(aA,aI)table.insert(aB,aH)local aJ=aF:
GetPropertyChangedSignal'Transparency':Connect(function()if aF.Parent and aF.
Transparency>ai then pcall(function()aH:Destroy()end)end end)table.insert(aC,aJ)
end end end if#aB>0 then ah[at]={items=aA,adornments=aB,connections=aC}as()end
end function af.ClearAll()if ao then ao:Disconnect()ao=nil end for at in pairs(
ah)do af.DetachZoneVisuals(at)end table.clear(ah)end function af.RefreshAll()af.
ClearAll()if not ag or not an then return end for at,au in pairs(an.
GetActiveHazardsMap())do af.AttachZoneVisuals(au)end end function af.SetEnabled(
at)ag=at and true or false if ag then af.RefreshAll()else af.ClearAll()end end
ac.OnPaddingChanged(function()if ag then af.RefreshAll()end end)ab.Register(
function()af.ClearAll()end)return af end function a.i()local aa,ab,ac=a.load'e',
a.load'd',a.load'g'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap=aa.RunService or
game:GetService'RunService',aa.player,{},false,45,{},0.85,Color3.fromRGB(255,140
,0),0.65,0.2,3.5 local aq=function()local aq=ae and ae.Character if not aq then
return nil end local ar=aq:FindFirstChild'HumanoidRootPart'or aq.PrimaryPart if
not ar then return nil end return ar.Position.Y-2.5 end function af.
BindDetection(ar)ao=ar or nil end function af.IsEnabled()return ag end function
af.GetPredictionLength()return ah end function af.SetPredictionLength(ar)if
type(ar)=='number'and ar>0 then ah=math.clamp(ar,10,200)af.RefreshAll()end end
function af.IsHazardMoving(ar)if not ar then return false end local as=ai[ar]
return as and as.isMoving==true end local ar,as=function(ar,as)local at=ar.
Instance if not at or not at.Parent then return nil,4 end local au,av,ax=ac.
GetTrajectoryMargin and ac.GetTrajectoryMargin()or 2,{},ar.Name or(at and at.
Name)or''local ay=ac.IsForceCircle and ac.IsForceCircle(ax)if at:IsA'BasePart'
then if at.Transparency<=aj then table.insert(av,at)end else for az,aA in
ipairs(at:GetDescendants())do if aA:IsA'BasePart'and aA.Parent and aA.
Transparency<=aj then table.insert(av,aA)end end end if#av==0 then return nil,4
end local az,aA,aB,aC=Vector3.new(-as.Z,0,as.X),math.huge,-math.huge,0 for aD,aE
in ipairs(av)do local aF,aG,aH=aE.Position,aE.Size,0 if ay or(aE:IsA'Part'and(aE
.Shape==Enum.PartType.Ball or aE.Shape==Enum.PartType.Cylinder))then aH=math.
max(aG.X,aG.Y,aG.Z)/2 else local aI=aE.CFrame local aJ,aK,aL,aM,aN,aO=aI.
RightVector,aI.UpVector,aI.LookVector,aG.X/2,aG.Y/2,aG.Z/2 aH=aM*math.abs(aJ.X*
az.X+aJ.Z*az.Z)+aN*math.abs(aK.X*az.X+aK.Z*az.Z)+aO*math.abs(aL.X*az.X+aL.Z*az.Z
)end local aI=aF.X*az.X+aF.Z*az.Z aA=math.min(aA,aI-aH)aB=math.max(aB,aI+aH)
local aJ=aF.X*as.X+aF.Z*as.Z aC+=aJ end local aD,aE,aF=math.max(1,(aB-aA)+au*2),
(aA+aB)/2,aC/#av local aG=as*aF+az*aE return aG,aD end,function(ar,as,at,au,av,
ax,ay)if not as or not as.Parent or not ar or not ar.Parent then return end
local az=ax/2 local aA=Vector3.new(at.X+au.X*az,av or at.Y,at.Z+au.Z*az)local aB
=aA+Vector3.new(au.X,0,au.Z)local aC=CFrame.lookAt(aA,aB)local aD=as.CFrame:
ToObjectSpace(aC)ar.CFrame=aD ar.Size=Vector3.new(ay,am,ax)if not ar.Visible
then ar.Visible=true end end local at=function()if not ag then return end local
at,au,av=false,os.clock(),aq()for ax,ay in pairs(ai)do local az=ax.Instance if
not az or not az.Parent then af.DetachTrajectoryVisuals(ax)else at=true local aA
=ay.mainPart if aA and aA.Parent then local aB,aC=aA.Position,au-(ay.lastClock
or au)if aC>=0.035 then local aD=aB-(ay.lastPos or aB)local aE,aF=aD.Magnitude/
aC,Vector3.new(aD.X,0,aD.Z)local aG,aH=aF.Magnitude/aC,ay.isMoving==true if aG>=
an then ay.isMoving=true ay.dir=aF.Unit else if aC>=0.25 and aE<an then ay.
isMoving=false end end if ay.isMoving~=aH then ax.IsTrajectory=ay.isMoving ax.
HazardZones=nil if ao and ao.UpdateHazardVisualColor then pcall(ao.
UpdateHazardVisualColor,ax,ay.isMoving)end local aI=a.load'h'if aI and aI.
UpdateHazardVisualColor then pcall(aI.UpdateHazardVisualColor,ax,ay.isMoving)end
end ay.lastPos=aB ay.lastClock=au end if ay.isMoving and ay.dir and ay.ad then
local aD,aE=ar(ax,ay.dir)if aD then as(ay.ad,aA,aD,ay.dir,av,ah,aE)end else if
ay.ad and ay.ad.Visible then ay.ad.Visible=false end end end end end if not at
and ap then ap:Disconnect()ap=nil end end local au=function()if not ap and ag
then ap=ad.Heartbeat:Connect(at)end end function af.DetachTrajectoryVisuals(av)
if not av then return end local ax=ai[av]if not ax then return end if ax.ad then
pcall(function()ax.ad:Destroy()end)ax.ad=nil end if ax.connections then for ay,
az in ipairs(ax.connections)do pcall(function()az:Disconnect()end)end table.
clear(ax.connections)end ai[av]=nil end function af.AttachTrajectoryVisuals(av)
if not ag or not av then return end if ai[av]then af.DetachTrajectoryVisuals(av)
end local ax=av.Instance if not ax or not ax.Parent then return end local ay if
ax:IsA'BasePart'then ay=ax else ay=ax.PrimaryPart or ax:FindFirstChildWhichIsA
'BasePart'if not ay then for az,aA in ipairs(ax:GetDescendants())do if aA:IsA
'BasePart'and aA.Parent then ay=aA break end end end end if not ay or not ay.
Parent then return end local az=Instance.new'BoxHandleAdornment'az.Name=
'HazardTrajectoryCorridor'az.Adornee=ay az.Size=Vector3.new(4,am,ah)az.Color3=ak
az.Transparency=al az.ZIndex=1 az.AlwaysOnTop=true az.Visible=false az.Parent=ay
local aA,aB={},ay:GetPropertyChangedSignal'Transparency':Connect(function()if ay
.Parent and ay.Transparency>aj then pcall(function()az:Destroy()end)end end)
table.insert(aA,aB)ai[av]={ad=az,connections=aA,mainPart=ay,lastPos=ay.Position,
lastClock=os.clock(),velocity=Vector3.zero,dir=nil,isMoving=false}au()end
function af.ClearAll()if ap then ap:Disconnect()ap=nil end for av in pairs(ai)do
af.DetachTrajectoryVisuals(av)end table.clear(ai)end function af.RefreshAll()af.
ClearAll()if not ag or not ao then return end for av,ax in pairs(ao.
GetActiveHazardsMap())do af.AttachTrajectoryVisuals(ax)end end function af.
GetNearbyTrajectories(av,ax)ax=ax or 65 local ay,az,aA={},av.X,av.Z for aB,aC in
pairs(ai)do if aC.isMoving and aC.dir and aC.mainPart and aC.mainPart.Parent
then local aD,aE=ar(aB,aC.dir)if aD and aE then local aF,aG=aD.X,aD.Z local aH,
aI=az-aF,aA-aG local aJ,aK=aH*aH+aI*aI,ax+ah+(aE/2)if aJ<=aK*aK then table.
insert(ay,{info=aB,record=aC})end end end end return ay end function af.
IsPointInAnyTrajectory(av,ax,ay)local az,aA=av.X,av.Z ax=ax or 0 if ay then for
aB,aC in ipairs(ay)do local aD,aE=aC.info,aC.record if aE and aE.isMoving and aE
.dir and aE.mainPart and aE.mainPart.Parent then local aF,aG=ar(aD,aE.dir)if aF
and aG then local aH=aE.dir local aI,aJ,aK=Vector3.new(-aH.Z,0,aH.X),az-aF.X,aA-
aF.Z local aL,aM,aN=aJ*aH.X+aK*aH.Z,aJ*aI.X+aK*aI.Z,aG/2 if ax<=0 then if aL>=0
and aL<=ah and math.abs(aM)<=aN then return true,aD,aH,aF,aG end else local aO=0
if aL<0 then aO=-aL elseif aL>ah then aO=aL-ah end local aP=math.max(0,math.abs(
aM)-aN)if(aO*aO+aP*aP)<=(ax*ax)then return true,aD,aH,aF,aG end end end end end
return false,nil,nil,nil,nil end for aB,aC in pairs(ai)do if aC.isMoving and aC.
dir and aC.mainPart and aC.mainPart.Parent then local aD,aE=ar(aB,aC.dir)if aD
and aE then local aF=aC.dir local aG,aH,aI=Vector3.new(-aF.Z,0,aF.X),az-aD.X,aA-
aD.Z local aJ,aK,aL=aH*aF.X+aI*aF.Z,aH*aG.X+aI*aG.Z,aE/2 if ax<=0 then if aJ>=0
and aJ<=ah and math.abs(aK)<=aL then return true,aB,aF,aD,aE end else local aM=0
if aJ<0 then aM=-aJ elseif aJ>ah then aM=aJ-ah end local aN=math.max(0,math.abs(
aK)-aL)if(aM*aM+aN*aN)<=(ax*ax)then return true,aB,aF,aD,aE end end end end end
return false,nil,nil,nil,nil end function af.SetEnabled(av)ag=av and true or
false if ag then af.RefreshAll()else af.ClearAll()end end ac.OnPaddingChanged(
function()if ag then af.RefreshAll()end end)ab.Register(function()af.ClearAll()
end)return af end function a.j()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'e',a.
load'f',a.load'd',a.load'g',a.load'h',a.load'i',game:GetService'Players',game:
GetService'Workspace',game:GetService'ReplicatedStorage'local aj,ak,al,am,an,ao,
ap,aq,ar,as,at,au,av,ax,ay,az,aA,aB=aa.player,{},false,false,true,false,false,''
,false,{},0,{},{},{'abilities','projectiles'},false,{}local aC,aD,aE,aF,aG,aH,aI
,aJ=function()if ay then return end ay=true for aC,aD in ipairs(ax)do local aE=
ai:FindFirstChild(aD)if aE then for aF,aG in ipairs(aE:GetChildren())do local aH
=(aG.Name or''):lower():gsub('%s+','')if#aH>0 then az[aH]=true end end end end
end,function(aC)if not aC then return true end local aD=aC.Name if typeof(aD)==
'string'then local aE=aD:lower()if aE:sub(1,3)=='tm_'or aE:sub(1,3)=='pr_'or aE:
sub(1,3)=='dq_'or aE:find'pathrecord'or aE:find'safespot'or aE:find'hazard'or aE
:find'adornment'or aE:find'debug'or aE:find'targetpart'or aE:find'actualmarker'
then return true end local aF=aC.Parent while aF and aF~=workspace and aF~=game
do local aG=aF.Name if typeof(aG)=='string'then local aH=aG:lower()if aH:find
'pathrecord'or aH:sub(1,3)=='tm_'or aH:sub(1,3)=='pr_'then return true end end
aF=aF.Parent end local aG=aE:gsub('%s+','')if#aG>0 and az[aG]==true then return
true end end return false end,function(aC)if not aC then return false end if ag:
GetPlayerFromCharacter(aC)then return true end if ag:FindFirstChild(aC.Name)then
return true end for aD,aE in ipairs(ag:GetPlayers())do if aC.Name==aE.Name then
return true end local aF=aE.Character if aF and(aC==aF or aC:IsDescendantOf(aF))
then return true end end local aD=aj and aj.Character if aD and(aC==aD or aC:
IsDescendantOf(aD))then return true end return false end,function()local aC=0
for aD in pairs(as)do aC+=1 end at=aC for aD=#au,1,-1 do pcall(au[aD],aC,aA)end
end,0.85,50,0.05,{}local aK,aL,aM,aN,aO,aP,aQ,aR=function(aK)local aL=aJ[aK]if
aL then aL.active=false aJ[aK]=nil end end,function()for aK,aL in pairs(aJ)do if
aL then aL.active=false end end table.clear(aJ)end,function(aK)if not aK then
return{}end local aL={}local aM=function(aM)if aM and aM.Parent and aM.
Transparency<=aG then aL[#aL+1]=aM end end if aK:IsA'BasePart'then aM(aK)else
for aN,aO in ipairs(aK:GetDescendants())do if aO:IsA'BasePart'and aO.Parent then
aM(aO)end end end return aL end,function(aK)local aL=aj and aj.Character if not
aL then return 0 end local aM=aL:FindFirstChild'HumanoidRootPart'or aL.
PrimaryPart if not aM then return 0 end local aN,aO=(aM.Position)if aK:IsA
'BasePart'then aO=aK.Position elseif aK:IsA'Model'then local aP,aQ=pcall(
function()return aK:GetPivot().Position end)if aP then aO=aQ else local aR=aK:
FindFirstChildWhichIsA'BasePart'aO=aR and aR.Position end end if not aO then
return 0 end return math.floor((aN-aO).Magnitude+0.5)end,Color3.fromRGB(255,45,
45),Color3.fromRGB(255,30,30),Color3.fromRGB(0,170,255),Color3.fromRGB(0,140,255
)local aS=function(aS,aT,aU)local aV,aW,aX={},aU and aQ or aO,aU and aR or aP
for aY,aZ in ipairs(aS)do if aZ and aZ.Parent then local a_=Instance.new
'SelectionBox'a_.Name='HazardSelectionBox'a_.Color3=aW a_.SurfaceColor3=aX a_.
SurfaceTransparency=0.6 a_.LineThickness=0.05 a_.Adornee=aZ a_.Parent=aZ local
a0=aZ:GetPropertyChangedSignal'Transparency':Connect(function()if aZ.Parent and
aZ.Transparency>aG then pcall(function()a_:Destroy()end)end end)if aT then table
.insert(aT,a0)end aV[#aV+1]=a_ end end return aV end function ak.
UpdateHazardVisualColor(aT,aU)if not aT or not aT.Boxes then return end local aV
=aU==true or aT.IsTrajectory==true local aW,aX=aV and aQ or aO,aV and aR or aP
for aY,aZ in ipairs(aT.Boxes)do if aZ and aZ.Parent then aZ.Color3=aW aZ.
SurfaceColor3=aX end end end local aT,aU=function(aT)if not ar or aq==''then
return false end if not aT or type(aT)~='string'then return false end local aU=
aq:lower():gsub('%s+','')if#aU==0 then return false end local aV=aT:lower():
gsub('%s+','')return string.find(aV,aU,1,true)~=nil end,function(aT)if not aT
then return'nil'end return('(%.2f, %.2f, %.2f)'):format(aT.X,aT.Y,aT.Z)end local
aV=function(aV,aW,aX,aY)if not aV then return end local aZ=aV.Name if not aT(aZ)
then return end local a_,a0,a1=aV.ClassName,aV.Parent and aV.Parent:GetFullName(
)or'nil',aN(aV)print
'================== \u{1f50d} [HAZARD DEEP INSPECT] \u{1f50d} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(aZ,a_))print((
'  \u{1f4cc} Event Type     : %s%s'):format(aW,aX and(' -> '..tostring(aX))or'')
)print(('  \u{1f4cd} Full Path      : %s'):format(a0))print((
'  \u{1f4cf} Dist to Player : %d studs'):format(a1))if aW=='SPAWN'then local a2=
{}if aV:IsA'BasePart'then table.insert(a2,aV)else for a3,a4 in ipairs(aV:
GetDescendants())do if a4:IsA'BasePart'then table.insert(a2,a4)end end end
print(('  \u{1f9e9} Total Parts (%d) :'):format(#a2))for a3,a4 in ipairs(a2)do
local a5=a4:IsA'Part'and tostring(a4.Shape.Name)or(a4.ClassName=='MeshPart'and
'MeshPart'or a4.ClassName)print(('     [%d] %q (%s)'):format(a3,a4.Name,a4.
ClassName))print((
'         \u{2022} Size: %s | Shape: %s | Trans: %.2f | CanCollide: %s'):format(
aU(a4.Size),a5,a4.Transparency,tostring(a4.CanCollide)))print((
'         \u{2022} Pos : %s'):format(aU(a4.Position)))end local a3=ad.
GetHazardZones(aY)if a3 and a3.zones then local a4=ad.GetHitboxPadding()print((
'  \u{1f4d0} Math Geometry (Zones: %d, BoundingRadius: %.1f studs):'):format(#a3
.zones,a3.boundingRadius or 0))for a5,a6 in ipairs(a3.zones)do if a6.radius then
print((
[[     - Zone [%d]: Circle/Ball (Base Radius: %.2f + Pad: %.2f = %.2f studs)]]):
format(a5,a6.radius,a4,a6.radius+a4))elseif a6.half then print((
'     - Zone [%d]: Box/OBB (HalfSize: %s)'):format(a5,aU(a6.half)))end end end
task.spawn(function()local a4 if aV:IsA'BasePart'then a4=aV elseif aV:IsA'Model'
then a4=aV.PrimaryPart or aV:FindFirstChildWhichIsA'BasePart'end if not a4 then
return end local a5,a6=os.clock(),a4.CFrame task.wait(0.12)if not aV.Parent or
not a4.Parent then return end local a7,a8=os.clock(),a4.CFrame local a9=a7-a5 if
a9<=0 then return end local b=a8*a6:Inverse()local ba,bb=b:ToAxisAngle()local bc
,bd=math.deg(bb)/a9,a6:Inverse()*a8 local be,bf=bd:ToAxisAngle()if math.abs(math
.deg(bb))>=1.5 then local bg='Tr\u{1ee5}c t\u{1ef1} do / H\u{1ed7}n h\u{1ee3}p'
if math.abs(ba.Y)>=0.8 then bg=
'Tr\u{1ee5}c Y (Yaw - Qu\u{e9}t ngang m\u{1eb7}t s\u{e0}n)'elseif math.abs(ba.X)
>=0.8 then bg='Tr\u{1ee5}c X (Pitch - L\u{103}n nh\u{e0}o l\u{1ed9}n)'elseif
math.abs(ba.Z)>=0.8 then bg=
'Tr\u{1ee5}c Z (Roll - Nghi\u{ea}ng l\u{1ead}t b\u{ea}n)'end local bh=
'Tr\u{1ee5}c t\u{1ef1} do'if math.abs(be.Y)>=0.8 then bh='Tr\u{1ee5}c Local Y'
elseif math.abs(be.X)>=0.8 then bh='Tr\u{1ee5}c Local X'elseif math.abs(be.Z)>=
0.8 then bh='Tr\u{1ee5}c Local Z'end print
'================== \u{1f504} [INSPECT: SPINNING DETECTED] \u{1f504} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(aV.Name,a4.Name))print((
'  \u{26a1} T\u{1ed1}c \u{111}\u{1ed9} xoay    : %.2f \u{b0}/s (%.2f rad/s)'):
format(bc,bb/a9))print(('  \u{1f310} World Spin Axis: %s -> %s'):format(aU(ba),
bg))print(('  \u{1f9e9} Local Spin Axis: %s -> %s'):format(aU(be),bh))print
[[========================================================================]]end
end)elseif aW=='DESPAWN'then if aY and aY.SpawnClock then local a2=os.clock()-aY
.SpawnClock print(('  \u{23f1}\u{fe0f} Lifetime Active: %.2f seconds'):format(a2
))end elseif aW=='REJECTED'then print(('  \u{26a0}\u{fe0f} Rejection Reason: %s'
):format(tostring(aX)))end print
[[================================================================]]end local aW
,aX=function(aW,aX)aV(aW,'REJECTED',aX,nil)if not ap then return end local aY,aZ
=aW and aW.Name or'?',aW and aW.ClassName or'?'print((
'[HazardScanner][Reject] \u{26aa} %s (%s) \u{2014} %s'):format(aY,aZ,aX))end
local aY=function(aY)if not aY or not aY.Parent then return end if aE(aY)then
return end if as[aY]then return end if aJ[aY]then return end local aZ={active=
true,count=0}aJ[aY]=aZ task.spawn(function()while aZ.active and aY.Parent and al
and am do if aE(aY)then aK(aY)return end aZ.count+=1 local a_,a0,a1=aY:
GetDescendants(),aM(aY),aT(aY.Name)if ap or a1 then print((
'[HazardScanner][Retry] \u{1f504} L\u{1ea7}n %d/%d: %q (%s) | Descendants: %d | Valid Parts (Trans<=%.2f): %d'
):format(aZ.count,aH,aY.Name,aY.ClassName,#a_,aG,#a0))end if#a0>0 then if ap or
a1 then print((
'[HazardScanner][Retry] \u{2705} L\u{1ea7}n %d/%d: %q \u{110}\u{e3} t\u{ec}m th\u{1ea5}y %d part(s)! Ti\u{1ebf}n h\u{e0}nh v\u{1ebd}...'
):format(aZ.count,aH,aY.Name,#a0))end aK(aY)aX(aY)return end if aZ.count>=aH
then aW(aY,(
'H\u{1ebf}t %d l\u{1b0}\u{1ee3}t retry m\u{e0} kh\u{f4}ng t\u{ec}m th\u{1ea5}y BasePart h\u{1ee3}p l\u{1ec7} (Descendants: %d)'
):format(aH,#a_))aK(aY)return end task.wait(aI)end aK(aY)end)end aX=function(aZ)
if not al or not am then aW(aZ,'Ch\u{1b0}a trong dungeon')return false end if
not aZ or not aZ.Parent then aW(aZ,'Kh\u{f4}ng c\u{f2}n Parent')return false end
if aE(aZ)then aW(aZ,
'Nh\u{e2}n v\u{1ead}t ng\u{1b0}\u{1edd}i ch\u{1a1}i (Player/Teammate)')return
false end if as[aZ]then return true end aC()if aD(aZ)then aW(aZ,
'Tr\u{f9}ng t\u{ea}n trong ReplicatedStorage (abilities/projectiles)')return
false end local a_=aM(aZ)if#a_==0 then aW(aZ,
'Ch\u{1b0}a c\u{f3} part \u{111}\u{1ec3} v\u{1ebd} (s\u{1ebd} retry)')aY(aZ)
return false end local a0,a1={},{}if an then a1=aS(a_,a0)end local a2=aN(aZ)
local a3={Instance=aZ,Name=aZ.Name,Class=aZ.ClassName,Distance=a2,Boxes=a1,
Connections=a0,SpawnClock=os.clock()}as[aZ]=a3 aA={Name=aZ.Name,Class=aZ.
ClassName,Distance=a2}if ae.IsEnabled()then ae.AttachZoneVisuals(a3)end if af.
IsEnabled()then af.AttachTrajectoryVisuals(a3)end aK(aZ)aV(aZ,'SPAWN',
'Passed all gates',a3)if ao then print((
'[HazardScanner][Hazard] \u{1f534} Hazard Detected: %s (%s, %d studs)'):format(
aZ.Name,aZ.ClassName,a2))end aF()return true end local aZ=function(aZ,a_)local
a0=as[aZ]if not a0 then aK(aZ)return end aV(aZ,'DESPAWN',a_,a0)ae.
DetachZoneVisuals(a0)af.DetachTrajectoryVisuals(a0)if a0.Boxes then for a1,a2 in
ipairs(a0.Boxes)do pcall(function()a2:Destroy()end)end table.clear(a0.Boxes)end
if a0.Connections then for a1,a2 in ipairs(a0.Connections)do pcall(function()a2:
Disconnect()end)end table.clear(a0.Connections)end as[aZ]=nil if ao then local
a1=a_ and(' ('..a_..')')or''print((
'[HazardScanner][Hazard] \u{1f7e2} Hazard Expired: %s%s'):format(tostring(a0.
Name),a1))end aF()end function ak.ClearAllHazards(a_)ae.ClearAll()af.ClearAll()
aL()local a0={}for a1 in pairs(as)do table.insert(a0,a1)end for a1,a2 in ipairs(
a0)do aZ(a2,a_)end if ao and a_ then print((
'[HazardScanner][Hazard] \u{1f9f9} All hazards cleared: %s'):format(a_))end end
function ak.StartScan()if al then return end al=true ae.BindDetection(ak)af.
BindDetection(ak)ak.ClearAllHazards'StartScan Reset'for a_,a0 in ipairs(av)do a0
:Disconnect()end table.clear(av)table.insert(av,ah.ChildAdded:Connect(function(
a_)if aE(a_)then return end aX(a_)end))table.insert(av,ah.ChildRemoved:Connect(
function(a_)aZ(a_,'Destroyed')end))am=ab.GetCurrentRoomIndex()>0 if aB then
pcall(aB)aB=nil end aB=ab.OnRoomIndexChanged(function(a_)if a_>0 then am=true
elseif a_<=0 and am then am=false ak.ClearAllHazards'Dungeon Ended'end end)if ao
then print'[HazardScanner] \u{1f4e1} Threat Detector started!'end end function
ak.StopScan()al=false am=false for a_,a0 in ipairs(av)do a0:Disconnect()end
table.clear(av)if aB then pcall(aB)aB=nil end ak.ClearAllHazards'StopScan'if ao
then print'[HazardScanner] \u{1f6d1} Threat Detector stopped.'end end function
ak.IsEnabled()return al end function ak.SetEnabled(a_)if a_ then ak.StartScan()
else ak.StopScan()end end function ak.SetSelectionBoxesEnabled(a_)an=a_ and true
or false if an then for a0,a1 in pairs(as)do if a0 and a0.Parent and(not a1.
Boxes or#a1.Boxes==0)then local a2=aM(a0)a1.Connections=a1.Connections or{}a1.
Boxes=aS(a2,a1.Connections)end end else for a0,a1 in pairs(as)do if a1.Boxes
then for a2,a3 in ipairs(a1.Boxes)do pcall(function()a3:Destroy()end)end table.
clear(a1.Boxes)end end end end function ak.IsSelectionBoxesEnabled()return an
end function ak.SetLogHazards(a_)ao=a_ and true or false end function ak.
IsLogHazardsEnabled()return ao end function ak.SetLogFailed(a_)ap=a_ and true or
false end function ak.IsLogFailedEnabled()return ap end function ak.
SetInspectTarget(a_)aq=type(a_)=='string'and a_ or''end function ak.
GetInspectTarget()return aq end function ak.SetInspectEnabled(a_)ar=a_ and true
or false end function ak.IsInspectEnabled()return ar end function ak.
GetHazardCount()return at end function ak.GetActiveHazards()local a_={}for a0,a1
in pairs(as)do if a0 and a0.Parent==ah then a_[#a_+1]=a1 end end return a_ end
function ak.GetActiveHazardsMap()return as end function ak.GetLastHazardInfo()
return aA end function ak.OnHazardChanged(a_)if type(a_)~='function'then return
end table.insert(au,a_)end ac.Register(function()ak.StopScan()ak.ClearAllHazards
'Shutdown'end)return ak end function a.k()local aa,ab,ac,ad=a.load'e',a.load'd',
a.load'g',a.load'i'local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av=
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
function a.l()local aa,ab,ac={},{},8 for ad=1,ac do local ae=(ad-1)*(2*math.pi/
ac)ab[ad]=Vector3.new(math.cos(ae),0,math.sin(ae))end local ad,ae={},16 for af=1
,ae do local ag=(af-1)*(2*math.pi/ae)ad[af]=Vector3.new(math.cos(ag),0,math.sin(
ag))end local af,ag={1.5,3,5,8,12,18,25},{1.5,3,4.5,6,8,10.5,13.5,17,21,26,32,40
}aa.COARSE_DIRECTIONS=ab aa.FINE_DIRECTIONS=ad aa.COARSE_RADII=af aa.FINE_RADII=
ag function aa.SamplePass(ah,ai,aj,ak,al,am,an,ao)local ap,aq,ar,as,at=math.huge
,Vector3.zero,false,ai if ao and ao.Magnitude>0.1 then local au=Vector3.new(ao.X
,0,ao.Z).Unit as=table.clone(ai)table.sort(as,function(av,ax)local ay,az=av.X*au
.X+av.Z*au.Z,ax.X*au.X+ax.Z*au.Z return ay>az end)end for au,av in ipairs(aj)do
local ax=false for ay,az in ipairs(as)do local aA=ah+az*av local aB=am(aA)if an
then table.insert(an,{pos=aA,isSafe=aB,isChosen=false})end if aB then local aC=
aA if al and ak>0 then local aD=aA+az*ak if am(aD)then aC=aD end end local aD=(
aC-ah).Magnitude if aD<ap then ap=aD at=aC aq=az ax=true end end end if ax and
at then ar=true break end end return at,ar,ap,aq end return aa end function a.m(
)local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am=Color3.fromRGB(0,255,120),Color3.
fromRGB(0,255,150),Color3.fromRGB(255,255,255),Color3.fromRGB(0,235,140),Color3.
fromRGB(255,60,60),0.2,1.4,0.45,{},{}local an,ao=function(an)if not an then
return end if not ak or not ak.Parent then if ak then pcall(function()ak:
Destroy()end)end local ao=Instance.new'CylinderHandleAdornment'ao.Name=
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
a.n()local aa,ab,ac,ad,ae,af,ag,ah=a.load'e',a.load'f',a.load'd',a.load'g',a.
load'i',a.load'k',a.load'l',a.load'm'local ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,
au,av,ax,ay,az,aA=aa.RunService or game:GetService'RunService',game:GetService
'Players',aa.player,{},true,true,true,2,0,false,{},{},0 local aB,aC,aD=function(
)local aB=ak or aj.LocalPlayer if not aB then return nil end local aC=aB.
Character if not aC or not aC.Parent then return nil end local aD=aC:
FindFirstChildOfClass'Humanoid'if aD and aD.Health<=0 then return nil end return
aC:FindFirstChild'HumanoidRootPart'or aC.PrimaryPart end,function(aB)local aC=ak
or aj.LocalPlayer if not aC then return nil end local aD=aC.Character if not aD
or not aD.Parent then return nil end local aE=aD:FindFirstChildOfClass'Humanoid'
if aE and aE.Health>0 then local aF=aE.MoveDirection if aF and aF.Magnitude>0.1
then return Vector3.new(aF.X,0,aF.Z).Unit end end if aB and aB.Parent then local
aF=Vector3.zero pcall(function()aF=aB.AssemblyLinearVelocity or aB.Velocity or
Vector3.zero end)local aG=Vector3.new(aF.X,0,aF.Z)if aG.Magnitude>=2 then return
aG.Unit end end return nil end,function(aB)if not aB then return 0 end return aB
.Position.Y-2.5 end function al.IsPointSafe(aE,aF)if not aE then return false
end local aG,aH=Vector3.new(aE.X,0,aE.Z),(af.GetRadius and af.GetRadius()or 1.8)
+(aF or 0)if ad.IsPointInAnyHazard and ad.IsPointInAnyHazard(aG,nil,aH)then
return false end if ae.IsPointInAnyTrajectory and ae.IsPointInAnyTrajectory(aG,
aH)then return false end return true end function al.FindNearestSafeSpot(aE)
local aF=aB()if not aE then if not aF then return nil,false,0,Vector3.zero end
aE=aF.Position end local aG,aH=Vector3.new(aE.X,0,aE.Z),aC(aF)table.clear(at)
local aI,aJ=ad.GetNearbyHazards and ad.GetNearbyHazards(aG,65)or nil,ae.
GetNearbyTrajectories and ae.GetNearbyTrajectories(aG,65)or nil local aK=
function(aK,aL)if not aK then return false end local aM,aN=Vector3.new(aK.X,0,aK
.Z),(af.GetRadius and af.GetRadius()or 1.8)+(aL or 0)if ad.IsPointInAnyHazard
and ad.IsPointInAnyHazard(aM,nil,aN,aI)then return false end if ae.
IsPointInAnyTrajectory and ae.IsPointInAnyTrajectory(aM,aN,aJ)then return false
end return true end if(aI and#aI==0 and aJ and#aJ==0)or aK(aG,0)then table.
insert(at,{pos=aG,isSafe=true,isChosen=true})return aG,true,0,Vector3.zero end
local aL,aM=aH,af.GetRadius and af.GetRadius()or 1.8 local aN,aO,aP,aQ=ae.
IsPointInAnyTrajectory(aG,aM,aJ)if aN and aP and aQ then local aR,aS,aT=Vector3.
new(-aP.Z,0,aP.X),Vector3.new(aP.Z,0,-aP.X),aG-aQ local aU=aT.X*aR.X+aT.Z*aR.Z
local aV=aU>=0 and aR or aS if aH and aH.Magnitude>0.1 then local aW,aX=aH.X*aR.
X+aH.Z*aR.Z,aH.X*aS.X+aH.Z*aS.Z if aW>aX+0.3 then aV=aR elseif aX>aW+0.3 then aV
=aS end end local aW=(aV-0.175*aP).Unit aL=aW end local aR,aS,aT,aU=ag.
SamplePass(aG,ag.COARSE_DIRECTIONS,ag.COARSE_RADII,ap,true,aK,at,aL)if not aS
then aR,aS,aT,aU=ag.SamplePass(aG,ag.FINE_DIRECTIONS,ag.FINE_RADII,ap,true,aK,at
,aL)end if not aS then aR,aS,aT,aU=ag.SamplePass(aG,ag.FINE_DIRECTIONS,ag.
FINE_RADII,0,false,aK,at,aL)end if aS and aR then for aV,aW in ipairs(at)do if(
aW.pos-aR).Magnitude<0.25 then aW.isChosen=true break end end return aR,true,aT,
aU end return aG,false,math.huge,Vector3.zero end local aE=function()if not am
then ah.Hide()return end local aE=aB()if not aE or not aE.Parent then ah.Hide()
return end local aF,aG,aH=false if af.IsPlayerInDanger then aF,aG,aH=af.
IsPlayerInDanger()end local aI=aF or(av~=nil)or ar if not aI then local aJ=os.
clock()if aJ-au<0.05 then return end au=aJ end local aJ,aK=aD(aE),Vector3.new(aE
.Position.X,0,aE.Position.Z)if aF then local aL,aM,aN=av and(av-aK).Magnitude or
0,av and al.IsPointSafe(av),(aG==ax and aH==ay)if not aM or not aN or not av
then local aO,aP,aQ,aR=al.FindNearestSafeSpot(aE.Position)if aP and aO then av=
aO ax=aG ay=aH aq=aQ ar=true ah.Update(aE,aO,aJ,at,an,ao)for aS,aT in ipairs(as)
do pcall(aT,true,aO,aQ)end else ah.Hide()end else aq=aL ah.Update(aE,av,aJ,at,an
,ao)for aO,aP in ipairs(as)do pcall(aP,true,av,aL)end end else local aL,aM=av
and(av-aK).Magnitude or 0,av and al.IsPointSafe(av)if aM and aL>0.8 then aq=aL
ah.Update(aE,av,aJ,at,an,ao)for aN,aO in ipairs(as)do pcall(aO,true,av,aL)end
else if ar or av then ar=false av=nil ax=nil ay=nil aq=0 ah.Hide()for aN,aO in
ipairs(as)do pcall(aO,false,nil,0)end end end end end local aF=function()if not
az then az=ai.Heartbeat:Connect(aE)end if not aA and af.OnDangerStatusChanged
then aA=af.OnDangerStatusChanged(function(aF)if aF and am then aE()end end)end
end function al.Clear()if ar or av then ar=false av=nil ax=nil ay=nil aq=0 table
.clear(at)ah.Hide()for aG,aH in ipairs(as)do pcall(aH,false,nil,0)end end end
function al.Cleanup()if az then az:Disconnect()az=nil end ah.Cleanup()table.
clear(at)av=nil ax=nil ay=nil aq=0 ar=false au=0 end function al.GetLastSafeSpot
()return av,aq,ar end function al.OnSafeSpotChanged(aG)if type(aG)=='function'
then table.insert(as,aG)end end function al.SetVisualEnabled(aG)an=aG and true
or false if not an then ah.Hide()end end function al.IsVisualEnabled()return an
end function al.SetShowCandidates(aG)ao=aG and true or false if not ao then ah.
HideCandidates()end end function al.IsShowCandidates()return ao end function al.
SetEnabled(aG)am=aG and true or false if not am then ah.Hide()end end function
al.IsEnabled()return am end function al.SetSafetyBuffer(aG)if type(aG)=='number'
and aG>=0 then ap=aG end end function al.GetSafetyBuffer()return ap end local aG
=function()local aG=ak or aj.LocalPlayer if not aG then return end aG.
CharacterAdded:Connect(function()al.Clear()end)end aG()if ab.OnRoomIndexChanged
then ab.OnRoomIndexChanged(function()al.Clear()end)end if ab.OnEnemyChanged then
ab.OnEnemyChanged(function()if ab.GetEnemyCount and ab.GetEnemyCount()==0 then
al.Clear()end end)end if ab.OnLobbyChanged then ab.OnLobbyChanged(function()al.
Clear()end)end if ab.OnBossActiveChanged then ab.OnBossActiveChanged(function()
al.Clear()end)end aF()ac.Register(function()al.Cleanup()end)return al end
function a.o()local aa,ab,ac,ad,ae=a.load'e',a.load'f',a.load'd',a.load'k',a.
load'n'local af,ag,ah,ai,aj,ak,al,am,an,ao=aa.RunService or game:GetService
'RunService',game:GetService'Players',aa.player,{},false,2,false,{}local ap,aq=
function()local ap=ah or ag.LocalPlayer if not ap then return nil,nil,nil end
local aq=ap.Character if not aq or not aq.Parent then return nil,nil,nil end
local ar=aq:FindFirstChildOfClass'Humanoid'if ar and ar.Health<=0 then return
nil,nil,nil end local as=aq:FindFirstChild'HumanoidRootPart'or aq.PrimaryPart if
not as then return nil,nil,nil end return aq,ar,as end,function(ap,aq)if ap and
aq and aq.Parent then pcall(function()ap:MoveTo(aq.Position)end)end end local ar
=function()if not aj then if al or an then an=nil al=false local ar,as,at=ap()
aq(as,at)for au,av in ipairs(am)do pcall(av,false,nil,0)end end return end local
ar,as,at=ap()if not ar or not as or not at then if al or an then an=nil al=false
for au,av in ipairs(am)do pcall(av,false,nil,0)end end return end if ab.
IsInvulnerable and ab.IsInvulnerable()then if al or an then an=nil al=false
local au,av,ax=ap()aq(av,ax)for ay,az in ipairs(am)do pcall(az,false,nil,0)end
end return end local au,av,ax,ay=ad.IsPlayerInDanger and ad.IsPlayerInDanger(),
ae.GetLastSafeSpot()if av then an=av end local az=an and ae.IsPointSafe and ae.
IsPointSafe(an)if an and az then local aA=at.Position local aB=Vector3.new(an.X-
aA.X,0,an.Z-aA.Z)local aC=aB.Magnitude if aC<=ak then local aD,aE=at.CFrame,
Vector3.new(an.X,aA.Y,an.Z)local aF=CFrame.new(aE)*(aD-aD.Position)ar:PivotTo(aF
)aq(as,at)local aG=an an=nil if al then al=false for aH,aI in ipairs(am)do
pcall(aI,false,aG,aC)end end else local aD=Vector3.new(an.X,aA.Y,an.Z)as:MoveTo(
aD)if not al then al=true for aE,aF in ipairs(am)do pcall(aF,true,an,aC)end end
end else if al or an then an=nil al=false aq(as,at)for aA,aB in ipairs(am)do
pcall(aB,false,nil,0)end end end end local as=function()if not ao then ao=af.
Heartbeat:Connect(ar)end end function ai.Clear()if al or an then an=nil al=false
local at,au,av=ap()aq(au,av)for ax,ay in ipairs(am)do pcall(ay,false,nil,0)end
end end function ai.Cleanup()if ao then ao:Disconnect()ao=nil end ai.Clear()end
function ai.SetEnabled(at)aj=at and true or false if not aj then local au,av,ax=
ap()aq(av,ax)an=nil al=false end end function ai.IsEnabled()return aj end
function ai.SetSnapDistance(at)if type(at)=='number'and at>=0.5 then ak=at end
end function ai.GetSnapDistance()return ak end function ai.IsDodging()return al
end function ai.OnDodgeStateChanged(at)if type(at)=='function'then table.insert(
am,at)end end if ab.OnRoomIndexChanged then ab.OnRoomIndexChanged(function()ai.
Clear()end)end if ab.OnEnemyChanged then ab.OnEnemyChanged(function()if ab.
GetEnemyCount and ab.GetEnemyCount()==0 then ai.Clear()end end)end if ab.
OnLobbyChanged then ab.OnLobbyChanged(function()ai.Clear()end)end if ab.
OnBossActiveChanged then ab.OnBossActiveChanged(function()ai.Clear()end)end as()
ac.Register(function()ai.Cleanup()end)return ai end function a.p()local aa,ab,ac
,ad,ae,af,ag,ah,ai=a.load'd',a.load'j',a.load'g',a.load'h',a.load'i',a.load'k',a
.load'n',a.load'o',{}ac.BindDetection(ab)ad.BindDetection(ab)ae.BindDetection(ab
)ai.IsPointInAnyHazard=ac.IsPointInAnyHazard ai.GetHazardPadding=ac.
GetHazardPadding ai.SetHazardPadding=ac.SetHazardPadding ai.GetHitboxPadding=ac.
GetHazardPadding ai.SetHitboxPadding=ac.SetHazardPadding ai.GetTrajectoryMargin=
ac.GetTrajectoryMargin ai.SetTrajectoryMargin=ac.SetTrajectoryMargin ai.
GetHazardZones=ac.GetHazardZones ai.GetNearbyHazards=ac.GetNearbyHazards ai.
AddForceCircleName=ac.AddForceCircleName ai.GetForceCircleNames=ac.
GetForceCircleNames ai.IsForceCircle=ac.IsForceCircle ai.IsPlayerInDanger=af.
IsPlayerInDanger ai.GetPlayerThreat=af.GetCurrentThreat ai.OnPlayerDangerChanged
=af.OnDangerStatusChanged ai.SetPlayerVisualEnabled=af.SetVisualEnabled ai.
IsPlayerVisualEnabled=af.IsVisualEnabled ai.SetPlayerHitboxRadius=af.SetRadius
ai.GetPlayerHitboxRadius=af.GetRadius ai.FindNearestSafeSpot=ag.
FindNearestSafeSpot ai.IsPointSafe=ag.IsPointSafe ai.GetLastSafeSpot=ag.
GetLastSafeSpot ai.OnSafeSpotChanged=ag.OnSafeSpotChanged ai.
SetSafeSpotVisualEnabled=ag.SetVisualEnabled ai.IsSafeSpotVisualEnabled=ag.
IsVisualEnabled ai.SetSafeSpotEnabled=ag.SetEnabled ai.IsSafeSpotEnabled=ag.
IsEnabled ai.SetSafeSpotBuffer=ag.SetSafetyBuffer ai.GetSafeSpotBuffer=ag.
GetSafetyBuffer ai.SetShowCandidates=ag.SetShowCandidates ai.IsShowCandidates=ag
.IsShowCandidates ai.ClearSafeSpot=ag.Clear ai.SetAutoDodgeEnabled=ah.SetEnabled
ai.IsAutoDodgeEnabled=ah.IsEnabled ai.SetDodgeSnapDistance=ah.SetSnapDistance ai
.GetDodgeSnapDistance=ah.GetSnapDistance ai.IsCurrentlyDodging=ah.IsDodging ai.
OnDodgeStateChanged=ah.OnDodgeStateChanged ai.ClearDodge=ah.Clear ai.
SetVisualizerEnabled=ad.SetEnabled ai.IsVisualizerEnabled=ad.IsEnabled ai.
RefreshVisuals=ad.RefreshAll ai.SetTrajectoryEnabled=ae.SetEnabled ai.
IsTrajectoryEnabled=ae.IsEnabled ai.SetTrajectoryLength=ae.SetPredictionLength
ai.GetTrajectoryLength=ae.GetPredictionLength ai.RefreshTrajectory=ae.RefreshAll
ai.IsPointInAnyTrajectory=ae.IsPointInAnyTrajectory ai.GetNearbyTrajectories=ae.
GetNearbyTrajectories ai.SetSelectionBoxesEnabled=ab.SetSelectionBoxesEnabled ai
.IsSelectionBoxesEnabled=ab.IsSelectionBoxesEnabled ai.StartDetection=ab.
StartScan ai.StopDetection=ab.StopScan ai.IsDetectionEnabled=ab.IsEnabled ai.
SetDetectionEnabled=ab.SetEnabled ai.SetLogHazards=ab.SetLogHazards ai.
IsLogHazardsEnabled=ab.IsLogHazardsEnabled ai.SetLogThreats=ai.SetLogHazards ai.
IsLogThreatsEnabled=ai.IsLogHazardsEnabled ai.SetLogFailed=ab.SetLogFailed ai.
IsLogFailedEnabled=ab.IsLogFailedEnabled ai.SetInspectTarget=ab.SetInspectTarget
ai.GetInspectTarget=ab.GetInspectTarget ai.SetInspectEnabled=ab.
SetInspectEnabled ai.IsInspectEnabled=ab.IsInspectEnabled ai.GetHazardCount=ab.
GetHazardCount ai.GetActiveHazards=ab.GetActiveHazards ai.GetLastHazardInfo=ab.
GetLastHazardInfo ai.OnHazardChanged=ab.OnHazardChanged function ai.StartScan()
ab.StartScan()end function ai.StopScan()ab.StopScan()end function ai.Toggle(aj)
if aj then ai.StartScan()else ai.StopScan()end end function ai.IsEnabled()return
ab.IsEnabled()end aa.Register(function()ab.StopScan()end)return ai end function
a.q()local aa={}function aa.PatchSliderLoadCallback(ab)if not ab or type(ab.
UpdateValue)~='function'then return ab end local ac=ab.UpdateValue ab.
UpdateValue=function(ad,ae)ac(ad,ae)local af=ad.Settings if af and af.Callback
then task.spawn(function()pcall(af.Callback,tonumber(ae))end)end end return ab
end function aa.PatchDropdownRestore(ab,ac)if not ab or type(ab.UpdateSelection)
~='function'then return ab end local ad=ab.UpdateSelection ab.UpdateSelection=
function(ae,af)if type(af)=='string'and af~=''and not ae:IsOption(af)then if ac
then pcall(function()ae:InsertOptions{af}end)else local ag=ae.Settings and ae.
Settings.Options if type(ag)=='table'and#ag>0 then af=ag[1]else local ah=next(ae
:GetOptions())if ah then af=ah end end end end ad(ae,af)end return ab end return
aa end end local aa,ab,ac,ad=a.load'c',a.load'p',a.load'f',a.load'q'return
function(ae,af)local ag=af:Section{Side='Left'}ag:Header{Name=
'Hazard Scanner Controls'}local ah=af:Section{Side='Right'}ah:Header{Name=
'Real-time Hazard Monitor'}local ai,aj,ak,al,am,an=ah:Label{Text=
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
rconsoleclear()end end)end}ap()end