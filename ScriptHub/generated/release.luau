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
GroupTransparency~=0 then return end if bN.Callback then bN.Callback()end bL()
end)bO.MouseEnter:Connect(function()bS'Hover'end)bO.MouseLeave:Connect(function(
)bS'Idle'end)end bK()function bp:UpdateTitle(bM)bz.Text=bM end function bp:
UpdateDescription(bM)bB.Text=bM end function bp:Cancel()bL()end return bp end
function w:SetNotificationsState(bo)y.Visible=bo end function w:
GetNotificationsState(bo)return y.Visible end function w:SetState(bo)p=bo B.
Visible=bo end function w:GetState()return p end local bo function w:Unload()if
bo then bo()end x:Destroy()n=true end function w.onUnloaded(bp)bo=bp end local
bp=v.Keybind or Enum.KeyCode.RightControl local bq=function()local bq=not w:
GetState()w:SetState(bq)w:Notify{Title=v.Title,Description=(bq and'Maximized 'or
'Minimized ')..'the menu. Use '..tostring(bp.Name)..' to toggle it.',Lifetime=5}
end g.InputEnded:Connect(function(br,bs)if bs then return end if br.KeyCode==bp
then bq()end end)Q.MouseButton1Click:Connect(bq)O.MouseButton1Click:Connect(
function()w:Dialog{Title=v.Title,Description=
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
.Folder local ah=ag..'/settings/autoload.txt'if not(isfile and readfile)then
return nil end if isfile(ah)then local ai,aj=pcall(readfile,ah)if ai and typeof(
aj)=='string'and#aj>0 then af=aj return af end end return nil end function ac.
SaveNow()if ac.IsSuspended()then return end local ah=ag()if not ah then return
end local ai,aj=aa:SaveConfig(ah)if not ai and aj and aj~=
'Please select a config file.'then ab.Notify('AutoSave',
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
IsInstantAccelEnabled()return ak end local aZ,a_=false function ag.
TriggerPanicSpeed(a0,a1)a0=a0 or 24 a1=a1 or 1.5 if not humanoid or not humanoid
.Parent then return false end if humanoid.WalkSpeed>=a0 then return false end if
a_ then task.cancel(a_)a_=nil end aZ=true al=true if humanoid.WalkSpeed<a0 then
humanoid.WalkSpeed=a0 end al=false a_=task.delay(a1,function()aZ=false a_=nil if
humanoid and humanoid.Parent then al=true if ah then humanoid.WalkSpeed=ai else
humanoid.WalkSpeed=aj end al=false end end)return true end function ag.
CancelPanicSpeed()if not aZ and not a_ then return end if a_ then task.cancel(a_
)a_=nil end aZ=false if humanoid and humanoid.Parent then al=true if ah then
humanoid.WalkSpeed=ai else humanoid.WalkSpeed=aj end al=false end end function
ag.IsPanicSpeedActive()return aZ end local a0=function()if aO then aO:
Disconnect()aO=nil end if not humanoid or not humanoid.Parent then return end aO
=humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(function()if al then
return end if not humanoid or not humanoid.Parent then return end local a0=
humanoid.WalkSpeed if aZ then if a0<24 then al=true humanoid.WalkSpeed=24 al=
false end return end if ah then if a0<ai then al=true humanoid.WalkSpeed=ai al=
false end else aj=a0 end end)end function ag.SetHumanoid(a1)if not a1 then
return end local a2=a1:WaitForChild('Humanoid',10)if not a2 then return end
humanoid=a2 rootPart=a1:WaitForChild('HumanoidRootPart',10)or a1.PrimaryPart aj=
humanoid.WalkSpeed if ah and humanoid.WalkSpeed<ai then al=true humanoid.
WalkSpeed=ai al=false end if aP then aP:Disconnect()aP=nil end aP=humanoid.Died:
Connect(function()aI=true ag.CancelPanicSpeed()end)aQ(humanoid.HealthChanged:
Connect(function(a3)if a3<=0 then aI=true elseif aI and a3>0 then aI=false end
end))end local a1=function()if not ab.IsActive()then return end if not ak then
return end if not humanoid or not humanoid.Parent or humanoid.Health<=0 or
humanoid.Sit then return end if not rootPart or not rootPart.Parent then local
a1=ac and ac.Character rootPart=a1 and a1:FindFirstChild'HumanoidRootPart'if not
rootPart then return end end if rootPart.Anchored then return end local a1,a2=
humanoid.MoveDirection,rootPart.AssemblyLinearVelocity if a1.Magnitude>0.05 then
local a3=ah and math.max(ai,humanoid.WalkSpeed)or humanoid.WalkSpeed rootPart.
AssemblyLinearVelocity=Vector3.new(a1.X*a3,a2.Y,a1.Z*a3)end end if aa.RunService
then local a2=aa.RunService.PreSimulation or aa.RunService.Heartbeat if a2 then
aQ(a2:Connect(a1))end end function ag.GetDungeonStartTime()return
dungeonStartTime end function ag.SetDungeonStartTime(a2)dungeonStartTime=a2 end
function ag.GetDungeonElapsed()if not dungeonStartTime then return nil end
return os.clock()-dungeonStartTime end function ag.ReadyDungeon()if not dungeon
and not aL()then return false end return true end function ag.GetHumanoid()
return humanoid end function ag.GetEnemyNames()local a2={}local a3=function(a3)
if a3 and a3~=''and a3~=ac.Name then a2[a3]=true end end if dungeon then for a4,
a5 in ipairs(dungeon:GetChildren())do if a5:IsA'Folder'or a5:IsA'Model'then for
a6,a7 in ipairs(a5:GetDescendants())do if a7:IsA'Model'and a7:
FindFirstChildOfClass'Humanoid'then a3(a7.Name)end end end end end for a4 in
pairs(at)do a3(a4.Name)end local a4={}for a5 in pairs(a2)do table.insert(a4,a5)
end table.sort(a4)return a4 end function ag.GetEnemyCount()return ax end
function ag.GetTrackedEnemyData()local a2={}for a3,a4 in pairs(at)do if a4 and
a4.Root and a4.Root.Parent then a2[#a2+1]=a4 end end return a2 end function ag.
OnEnemyChanged(a2)if type(a2)~='function'then return function()end end table.
insert(ay,a2)return function()for a3,a4 in ipairs(ay)do if a4==a2 then table.
remove(ay,a3)break end end end end function ag.GetEnemyProjectileNames()local a2
,a3={},game:GetService'ReplicatedStorage'local a4=a3:FindFirstChild(ae)if not a4
then return a2 end for a5,a6 in ipairs(a4:GetChildren())do local a7=a6.ClassName
if a7=='Model'or a7=='MeshPart'or a7=='Part'then a2[a6.Name]=true end end return
a2 end function ag.GetKeyHoldTime()return ad end if ac and ac.Character and ac.
Character.Parent then ag.SetHumanoid(ac.Character)a0()else local a2=ac and ac.
CharacterAdded and task.spawn(function()local a2=ac.CharacterAdded:Wait()if a2
and ab.IsActive()then ag.SetHumanoid(a2)a0()end end)end if ac then aQ(ac.
CharacterAdded:Connect(function(a2)local a3,a4=pcall(function()if not a2 then
return end aG=os.clock()ag.SetHumanoid(a2)a0()for a3,a4 in ipairs(aE)do pcall(a4
)end end)if not a3 then warn('[Shared] respawn handler error:',tostring(a4))end
end))end task.spawn(function()while ab.IsActive()do task.wait(af)local a2=
workspace:FindFirstChild'dungeon'if dungeon and a2~=dungeon then aM()elseif not
dungeon and a2 then aL()end aN()end end)local a2=function()local a2=game:
GetService'Workspace'for a3,a4 in ipairs(a2:GetDescendants())do if a4.Name==
'dungeonName'and a4:IsA'ValueBase'then local a5=a4.Value if type(a5)=='string'
then local a6=string.gsub(a5,'%s+','')if a6~=''and string.lower(a6)~=aB then
return a5 end end end end return nil end task.spawn(function()while ab.IsActive(
)do task.wait(af)local a3=a2()if a3~=aJ then aJ=a3 if a3 then ag.ResetBossIndex(
)end for a4=#aA,1,-1 do pcall(aA[a4],a3)end end end end)local a3=function()
return not(aJ and#aJ>0)end task.spawn(function()while ab.IsActive()do task.wait(
af)local a4=a3()if a4~=aC then aC=a4 for a5=#aD,1,-1 do pcall(aD[a5],aC)end end
end end)task.spawn(function()local a4,a5=pcall(function()return aL()end)if not
a4 then warn('[EnemyTracker] Initialization error:',a5)end end)local a4,a5=0,2
task.spawn(function()while ab.IsActive()do task.wait(a5)local a6=os.clock()if a6
-a4<a5 then continue end a4=a6 if not dungeon then continue end local a7=pcall(
function()for a7,a8 in ipairs(dungeon:GetChildren())do if a8:IsA'Folder'or a8:
IsA'Model'then for a9,b in ipairs(a8:GetDescendants())do if b:IsA'Model'then aX(
b)end end end end aK()end)if not a7 then warn'[EnemyTracker] rescan error'end
end end)function ag.IsBossActive()return am end function ag.OnBossActiveChanged(
a6)if type(a6)~='function'then return function()end end table.insert(an,a6)
return function()for a7,a8 in ipairs(an)do if a8==a6 then table.remove(an,a7)
break end end end end function ag.GetCurrentBossIndex()return ao end function ag
.GetCombatTargetKey()if not am then return'Mob'end local a6=math.clamp(ao,1,3)
return'Boss'..tostring(a6)end function ag.ResetBossIndex()ao=0 for a6=#ap,1,-1
do pcall(ap[a6],ao)end end function ag.OnBossIndexChanged(a6)if type(a6)~=
'function'then return function()end end table.insert(ap,a6)return function()for
a7,a8 in ipairs(ap)do if a8==a6 then table.remove(ap,a7)break end end end end
local a6=function(a6)if type(a6)~='string'then return 0 end local a7=string.
match(a6,'^room(%d+)$')if not a7 then return 0 end return tonumber(a7)or 0 end
local a7=function()if not dungeon then return 0 end for a7,a8 in pairs(at)do if
a8 and a8.Room then local a9=a6(a8.Room.Name)if a9>0 then return a9 end end end
return 0 end aN=function()local a8=a7()if a8==aq then return end aq=a8 for a9=#
ar,1,-1 do pcall(ar[a9],aq)end end function ag.GetCurrentRoomIndex()return aq
end function ag.OnRoomIndexChanged(a8)if type(a8)~='function'then return
function()end end table.insert(ar,a8)return function()for a9,b in ipairs(ar)do
if b==a8 then table.remove(ar,a9)break end end end end function ag.
GetCurrentDungeonName()return aJ end function ag.OnDungeonNameChanged(a8)if
type(a8)~='function'then return function()end end table.insert(aA,a8)return
function()for a9,b in ipairs(aA)do if b==a8 then table.remove(aA,a9)break end
end end end function ag.IsInLobby()return aC end function ag.OnLobbyChanged(a8)
if type(a8)~='function'then return function()end end table.insert(aD,a8)return
function()for a9,b in ipairs(aD)do if b==a8 then table.remove(aD,a9)break end
end end end local a8,a9=function(a8)if am==a8 then return end am=a8 if a8 then
ao+=1 for a9=#ap,1,-1 do pcall(ap[a9],ao)end end for a9=#an,1,-1 do pcall(an[a9]
,am)end end local function b()if not ac then return end local ba=ac:
FindFirstChild'PlayerGui'if not ba then a9=nil a8(false)return end local bb=ba:
FindFirstChild('bossHealth',true)if bb then if bb~=a9 then a9=bb if a9:IsA
'ScreenGui'then aQ(a9:GetPropertyChangedSignal'Enabled':Connect(b))elseif a9:IsA
'GuiObject'then aQ(a9:GetPropertyChangedSignal'Visible':Connect(b))end end local
bc=if bb:IsA'ScreenGui'then bb.Enabled elseif bb:IsA'GuiObject'then bb.Visible
else true a8(bc)else a9=nil a8(false)end end task.spawn(function()if not ac then
return end local ba=ac:WaitForChild('PlayerGui',30)if not ba then return end aQ(
ba.DescendantAdded:Connect(b))aQ(ba.DescendantRemoving:Connect(b))b()while ab.
IsActive()and task.wait(0.5)do b()end end)ab.Register(function()if aO then aO:
Disconnect()aO=nil end for ba,bb in ipairs(aF)do pcall(function()bb:Disconnect()
end)end table.clear(aF)aM()end)return ag end function a.g()local aa={}function
aa.PatchSliderLoadCallback(ab)if not ab or type(ab.UpdateValue)~='function'then
return ab end local ac=ab.UpdateValue ab.UpdateValue=function(ad,ae)ac(ad,ae)
local af=ad.Settings if af and af.Callback then task.spawn(function()pcall(af.
Callback,tonumber(ae))end)end end return ab end function aa.PatchDropdownRestore
(ab,ac)if not ab or type(ab.UpdateSelection)~='function'then return ab end local
ad=ab.UpdateSelection ab.UpdateSelection=function(ae,af)if type(af)=='string'and
af~=''and not ae:IsOption(af)then if ac then pcall(function()ae:InsertOptions{af
}end)else local ag=ae.Settings and ae.Settings.Options if type(ag)=='table'and#
ag>0 then af=ag[1]else local ah=next(ae:GetOptions())if ah then af=ah end end
end end ad(ae,af)end return ab end return aa end function a.h()local aa,ab,ac=a.
load'e',a.load'f',a.load'b'local ad,ae,af,ag,ah=aa.UserInputService,aa.
VirtualInputManager,{},false function af.IsMouseComboEnabled()return ag end
function af.SetMouseComboEnabled(ai)ag=ai==true end local ai=function()task.
spawn(function()ae:SendKeyEvent(true,Enum.KeyCode.Q,false,game)ae:SendKeyEvent(
true,Enum.KeyCode.E,false,game)task.wait(ab.GetKeyHoldTime())ae:SendKeyEvent(
false,Enum.KeyCode.Q,false,game)ae:SendKeyEvent(false,Enum.KeyCode.E,false,game)
end)end function af.Init()if af.inited then return end af.inited=true ah=ad.
InputBegan:Connect(function(aj,ak)if aj.UserInputType==Enum.UserInputType.
MouseButton2 then if ad:GetFocusedTextBox()then return end if ag then ai()end
end end)end ac.Register(function()if ah then ah:Disconnect()ah=nil end af.inited
=false end)return af end function a.i()local aa,ab,ac,ad=a.load'f',a.load'g',a.
load'd',a.load'h'return function(ae,af)local ag=af:Section{Side='Right'}ag:
Header{Name='Movement Speed'}ag:Toggle({Name='Fast Speed',Default=aa.
IsSpeedEnabled(),Callback=ac.Wrap(function(ah)aa.SetSpeedEnabled(ah)end)},
'Toggle_FastSpeed')ab.PatchSliderLoadCallback(ag:Slider({Name=
'Custom Fast Speed',Default=aa.GetFastSpeed(),Minimum=16,Maximum=24,
DisplayMethod='Round',Precision=0,Callback=ac.Wrap(function(ah)aa.SetFastSpeed(
ah)end)},'Slider_FastSpeed'))ag:Toggle({Name=
'Instant Acceleration (Max Speed t\u{1ee9}c th\u{ec})',Default=aa.
IsInstantAccelEnabled(),Callback=ac.Wrap(function(ah)aa.SetInstantAccelEnabled(
ah)end)},'Toggle_InstantAcceleration')ag:Header{Name='Shortcuts'}ag:Toggle({Name
='Right Click Combo (Q+E)',Default=ad.IsMouseComboEnabled(),Callback=ac.Wrap(
function(ah)ad.SetMouseComboEnabled(ah)end)},'Toggle_MouseCombo')end end
function a.j()local aa,ab,ac={},{},false function aa.SetLocked(ad)ac=ad and true
or false end function aa.IsLocked()return ac end function aa.Register(ad,ae,af)
if type(ad)~='string'or type(ae)~='function'or type(af)~='function'then return
end ab[ad]={setEnabled=ae,isEnabled=af}end function aa.EnableExclusive(ad)if ac
then return end for ae,af in pairs(ab)do if ae~=ad and af.isEnabled()then pcall(
af.setEnabled,false)end end end function aa.IsEnabled(ad)local ae=ab[ad]return
ae~=nil and ae.isEnabled()end return aa end function a.k()local aa,ab,ac,ad,ae,
af,ag,ah={'Easy','Medium','Hard','Insane','Nightmare'},{'Desert Temple',
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
end return 0 end ad.DUNGEONS=ab ad.DIFFICULTIES=aa return ad end function a.l()
local aa,ab,ac,ad,ae,af,ag,ah=a.load'e',a.load'f',a.load'k',a.load'c',a.load'a',
game:GetService'HttpService',{},{mediumIceSpikes={hitDelay=1.1,totalLifetime=1.5
,isProjectile=false,skillType='AoE'},largeIceSpikes={hitDelay=1.4,totalLifetime=
1.8,isProjectile=false,skillType='AoE'},thirdBossMultiRings={hitDelay=2,
totalLifetime=2.8,isProjectile=false,skillType='AoE'},firstBossCrissCross={
hitDelay=0,totalLifetime=2.2,isProjectile=true,skillType='Projectile'},
firstBossSeekingSpikes={hitDelay=0,totalLifetime=2.5,isProjectile=true,skillType
='Projectile'},firstBossBigSpike={hitDelay=0,totalLifetime=2,isProjectile=true,
skillType='Projectile'},firstBossBeamPart={hitDelay=0,totalLifetime=2,
isProjectile=true,skillType='Projectile'},secondBossMovingBeam={hitDelay=0,
totalLifetime=3.5,isProjectile=true,skillType='Projectile'},secondbossyelloworb=
{hitDelay=0,totalLifetime=4,isProjectile=true,skillType='Projectile'},
secondbossredorb={hitDelay=0,totalLifetime=4,isProjectile=true,skillType=
'Projectile'},secondbossgreenorb={hitDelay=0,totalLifetime=4,isProjectile=true,
skillType='Projectile'},thirdBossMissile={hitDelay=0,totalLifetime=3.5,
isProjectile=true,skillType='Projectile'}}local ai=ae.Folder..'/skills_data'
local aj,ak,al,am,an,ao,ap,aq,ar,as=function()if makefolder and isfolder then
pcall(function()if not isfolder(ae.Folder)then makefolder(ae.Folder)end if not
isfolder(ai)then makefolder(ai)end end)end end,'Default Preset',{},0,false,{},0,
0,{}local at,au=function()for at,au in ipairs(ar)do pcall(au,{mode=ak,
selectedMap=as,loadedCount=am,isRecording=an,recordedCount=ap,totalSamples=aq})
end end,function(at)if not at or#at==0 then return'Unknown'end return(at:gsub(
'[\\/:*?"<>|]','_'))end local av=function(av)aj()return ai..'/'..au(av)..'.json'
end function ag.LoadMapData(aw)aw=aw or as or ab.GetCurrentDungeonName()or
'Unknown'local ax=av(aw)table.clear(al)am=0 if isfile and isfile(ax)then local
ay,az=pcall(readfile,ax)if ay and az and#az>0 then local aA,aB=pcall(function()
return af:JSONDecode(az)end)if aA and type(aB)=='table'then for aC,aD in pairs(
aB)do if type(aD)=='table'and type(aD.avgLifetime)=='number'then al[aC]={
totalLifetime=tonumber(aD.avgLifetime)or 2,hitDelay=tonumber(aD.avgHitDelay)or(
tonumber(aD.avgLifetime)*0.75),count=tonumber(aD.count)or 1,minLifetime=
tonumber(aD.minLifetime),maxLifetime=tonumber(aD.maxLifetime),isProjectile=aD.
isProjectile==true,skillType=aD.skillType or(aD.isProjectile and'Projectile'or
'AoE')}am=am+1 end end end end end at()return am end function ag.GetSkillTiming(
aw)if ak=='Trained Preset'then local ax=al[aw]if ax and ax.totalLifetime then
local ay=ax.hitDelay if ax.isProjectile or ay==0 then ay=0 end return ax.
totalLifetime,(ay or(ax.totalLifetime*0.75))end end local ax=ah[aw]if ax then
return ax.totalLifetime or 2,ax.hitDelay or 1.5 end return 2.5,1.8 end function
ag.SetRecordingEnabled(aw)an=aw and true or false if an then ad.Notify(
'Skill Training',
'B\u{1eaf}t \u{111}\u{1ea7}u thu th\u{1ead}p d\u{1eef} li\u{1ec7}u skill (Ch\u{1a1}i chay)! H\u{e3}y t\u{1ef1} n\u{e9} v\u{e0} \u{111}\u{e1}nh Boss.'
,4)else ad.Notify('Skill Training',(
'\u{110}\u{e3} d\u{1eeb}ng ghi nh\u{1ead}n. Thu th\u{1ead}p \u{111}\u{1b0}\u{1ee3}c %d chi\u{ea}u th\u{1ee9}c.'
):format(ap),3)end at()end function ag.IsRecording()return an end function ag.
RecordSkill(aw,ax,ay,az)if not an then return end if not aw or not ax or ax<0.2
or ax>30 then return end aq=aq+1 if az then ay=0 end local aA=ao[aw]if not aA
then local aB=az and true or false ao[aw]={count=1,avgLifetime=ax,avgHitDelay=ay
or 0,minLifetime=ax,maxLifetime=ax,isProjectile=aB,skillType=aB and'Projectile'
or'AoE'}ap=ap+1 else aA.count=aA.count+1 aA.isProjectile=aA.isProjectile or(az
and true or false)aA.skillType=aA.isProjectile and'Projectile'or'AoE'if aA.
isProjectile then aA.avgHitDelay=0 if ax>=(aA.maxLifetime*0.6)then local aB=math
.min(aA.count,8)aA.avgLifetime=aA.avgLifetime+(ax-aA.avgLifetime)/aB end aA.
maxLifetime=math.max(aA.maxLifetime,ax)aA.minLifetime=math.min(aA.minLifetime,ax
)else local aB=math.min(aA.count,8)aA.avgLifetime=aA.avgLifetime+(ax-aA.
avgLifetime)/aB if ay then aA.avgHitDelay=(aA.avgHitDelay or ay)+(ay-(aA.
avgHitDelay or ay))/aB end aA.minLifetime=math.min(aA.minLifetime,ax)aA.
maxLifetime=math.max(aA.maxLifetime,ax)end end local aB=aA.isProjectile and
'\u{1f680} Projectile'or'\u{1f4a5} AoE'print((
"[SkillTimingManager] \u{2705} Recorded '%s' [%s] (hits: %d, avgLife: %.2fs, hitDelay: %.2fs) | RAM: %d unique, %d total hits"
):format(aw,aB,aA.count,aA.avgLifetime,aA.avgHitDelay or 0,ap,aq))at()end local
aw=function(aw)local ax,ay={'{\n'},{}for az in pairs(aw)do table.insert(ay,az)
end table.sort(ay)for az,aA in ipairs(ay)do local aB=aw[aA]local aC=(aB.
isProjectile==true)local aD,aE,aF,aG=aB.skillType or(aC and'Projectile'or'AoE'),
tonumber(aB.avgLifetime)or 2,tonumber(aB.avgHitDelay)or(aC and 0 or 1.5),
tonumber(aB.count)or 1 local aH,aI,aJ=tonumber(aB.minLifetime)or aE,tonumber(aB.
maxLifetime)or aE,(az<#ay)and','or''table.insert(ax,string.format('  %q: {\n',aA
))table.insert(ax,string.format('    "skillType": %q,\n',aD))table.insert(ax,
string.format('    "isProjectile": %s,\n',aC and'true'or'false'))table.insert(ax
,string.format('    "avgLifetime": %.2f,\n',aE))table.insert(ax,string.format(
'    "avgHitDelay": %.2f,\n',aF))table.insert(ax,string.format(
'    "count": %d,\n',aG))table.insert(ax,string.format(
'    "minLifetime": %.2f,\n',aH))table.insert(ax,string.format(
'    "maxLifetime": %.2f\n',aI))table.insert(ax,'  }'..aJ..'\n')end table.
insert(ax,'}')return table.concat(ax)end function ag.SaveRecordedData(ax)ax=ax
or as or ab.GetCurrentDungeonName()or'Unknown'if not(writefile and isfile)then
ad.Notify('Training Error','Executor kh\u{f4}ng h\u{1ed7} tr\u{1ee3} writefile!'
,3)return false,0 end if ap==0 then ad.Notify('Skill Training',
'Ch\u{1b0}a c\u{f3} d\u{1eef} li\u{1ec7}u skill n\u{e0}o \u{111}\u{1b0}\u{1ee3}c ghi trong phi\u{ea}n ch\u{1a1}i!'
,3)return false,0 end local ay,az=av(ax),{}if isfile(ay)then pcall(function()
local aA=readfile(ay)if aA and#aA>0 then local aB=af:JSONDecode(aA)if type(aB)==
'table'then az=aB end end end)end local aA=0 for aB,aC in pairs(ao)do local aD=
az[aB]if not aD then aC.isProjectile=aC.isProjectile and true or false aC.
skillType=aC.isProjectile and'Projectile'or'AoE'az[aB]=aC else aD.count=(aD.
count or 1)+(aC.count or 1)if aC.isProjectile or aD.isProjectile then aD.
isProjectile=true aD.skillType='Projectile'aD.avgHitDelay=0 aD.maxLifetime=math.
max(aD.maxLifetime or aC.maxLifetime,aC.maxLifetime)aD.minLifetime=math.min(aD.
minLifetime or aC.minLifetime,aC.minLifetime)aD.avgLifetime=math.max(aD.
avgLifetime or 0,aC.avgLifetime or 0)else aD.isProjectile=false aD.skillType=
'AoE'aD.avgLifetime=(aD.avgLifetime+aC.avgLifetime)/2 aD.avgHitDelay=((aD.
avgHitDelay or aD.avgLifetime*0.75)+(aC.avgHitDelay or aC.avgLifetime*0.75))/2
aD.minLifetime=math.min(aD.minLifetime or aC.minLifetime,aC.minLifetime)aD.
maxLifetime=math.max(aD.maxLifetime or aC.maxLifetime,aC.maxLifetime)end end aA=
aA+1 end local aB=pcall(function()aj()local aB,aC,aD=nil,pcall(aw,az)if aC and
aD and#aD>0 then aB=aD else aB=af:JSONEncode(az)end writefile(ay,aB)end)if aB
then ag.LoadMapData(ax)ad.Notify('Skill Training',(
'\u{110}\u{e3} l\u{1b0}u th\u{e0}nh c\u{f4}ng %d chi\u{ea}u th\u{1ee9}c v\u{e0}o map [%s]!'
):format(aA,ax),4)table.clear(ao)ap=0 aq=0 at()return true,aA else ad.Notify(
'Training Error','L\u{1ed7}i trong qu\u{e1} tr\u{ec}nh ghi file!',3)return false
,0 end end function ag.ClearRecordedSession()table.clear(ao)ap=0 aq=0 at()ad.
Notify('Skill Training',
'\u{110}\u{e3} x\u{f3}a b\u{1ed9} nh\u{1edb} \u{111}\u{1ec7}m phi\u{ea}n hu\u{1ea5}n luy\u{1ec7}n.'
,2)end function ag.PrintRecordedData()print
[[================ [SkillTiming] Recorded Session Buffer ================]]local
ax=0 for ay,az in pairs(ao)do ax=ax+1 local aA=az.isProjectile and
'\u{1f680} Projectile'or'\u{1f4a5} AoE'print(string.format(
[[[%d] '%s' [%s] | avgLife: %.2fs | hitDelay: %.2fs | hits: %d (min: %.2fs, max: %.2fs)]]
,ax,ay,aA,az.avgLifetime or 0,az.avgHitDelay or 0,az.count or 1,az.minLifetime
or 0,az.maxLifetime or 0))end if ax==0 then print
'No skills recorded in current session buffer.'end print
[[=======================================================================]]
return ax end function ag.PrintLoadedMapData()local ax=as or ab.
GetCurrentDungeonName()or'Unknown'print(string.format(
[[================ [SkillTiming] Loaded RAM Data for [%s] ================]],ax)
)local ay=0 for az,aA in pairs(al)do ay=ay+1 local aB=aA.isProjectile and
'\u{1f680} Projectile'or'\u{1f4a5} AoE'print(string.format(
[[[%d] '%s' [%s] | avgLife: %.2fs | hitDelay: %.2fs | hits: %d]],ay,az,aB,aA.
totalLifetime or 0,aA.hitDelay or 0,aA.count or 1))end if ay==0 then print
'No trained skills loaded for this map.'end print
[[=======================================================================]]
return ay end function ag.SetMode(ax)if ax=='Default Preset'or ax==
'Trained Preset'then ak=ax if ak=='Trained Preset'then ag.LoadMapData(as)end at(
)end end function ag.GetMode()return ak end function ag.SetSelectedMap(ax)if ax
and#ax>0 then as=ax if ak=='Trained Preset'then ag.LoadMapData(as)end at()end
end function ag.GetSelectedMap()if not as then as=ab.GetCurrentDungeonName()if
not as or#as==0 then local ax=ac.GetDungeons()as=(ax and ax[1])or'Desert Temple'
end end return as end function ag.GetLoadedSkillCount()return am end function ag
.GetRecordedSkillCount()return ap end function ag.GetTotalSamplesCount()return
aq end function ag.GetDefaultPresets()return ah end function ag.OnChanged(ax)if
type(ax)=='function'then table.insert(ar,ax)end end task.spawn(function()while
true do local ax=ab.GetCurrentDungeonName()if ax and ax~=as and ak==
'Trained Preset'then as=ax ag.LoadMapData(ax)end task.wait(2)end end)return ag
end function a.m()local aa,ab,ac,ad,ae,af,ag=game:GetService'Players',game:
GetService'Workspace',1.8,150,150,{}function af.BindDetection(ah)ag=ah or nil
end local ah=function()return ag end function af.GetHitboxPadding()return ac end
function af.SetHitboxPadding(ai)if type(ai)=='number'and ai>=0 then ac=ai end
end local ai=RaycastParams.new()ai.FilterType=Enum.RaycastFilterType.Exclude ai.
IgnoreWater=true local aj,ak={},0 local al,am=function(al)local am=os.clock()if
not al and(am-ak<0.25)then return end ak=am table.clear(aj)for an,ao in ipairs(
aa:GetPlayers())do if ao.Character then table.insert(aj,ao.Character)end end if
ab:FindFirstChild'RaycastIgnore'then table.insert(aj,ab.RaycastIgnore)end for an
in pairs(ah().GetActiveHazardsMap())do table.insert(aj,an)end ai.
FilterDescendantsInstances=aj end,aa.LocalPlayer function af.GetFloorPosition(an
)al(false)local ao,ap=Vector3.new(an.X,an.Y+10,an.Z),Vector3.new(0,-ad,0)local
aq=ab:Raycast(ao,ap,ai)if aq and aq.Position then return Vector3.new(an.X,aq.
Position.Y+3,an.Z),true end return an,false end function af.GetRawFloorY(an)al(
false)local ao,ap=Vector3.new(an.X,an.Y+12,an.Z),Vector3.new(0,-ad,0)local aq=ab
:Raycast(ao,ap,ai)if aq and aq.Position then return aq.Position.Y,true end local
ar=am and am.Character and am.Character:FindFirstChild'HumanoidRootPart'if ar
then local as=Vector3.new(an.X,ar.Position.Y+8,an.Z)local at=ab:Raycast(as,ap,ai
)if at and at.Position then return at.Position.Y,true end return ar.Position.Y-
2.8,false end return an.Y,false end function af.IsPointInTrajectory(an,ao)local
ap=ah()local aq=ap.GetLockedProjectiles()[ao]if not aq then aq=ap.
LockTrajectoryForPart and ap.LockTrajectoryForPart(ao)end if not aq then return
false end local ar,as,at,au=ao.Position,aq.forward2D,aq.maxLookahead,aq.
dangerRadius local av=an-ar local aw=Vector3.new(av.X,0,av.Z)local ax=aw:Dot(as)
if aq.config and aq.config.isDynamicMoving then if ax<-4 or ax>(at+2)then return
false end local ay=as*ax local az=aw-ay local aA,aB=az.Magnitude,aq.
lockedVisualY or(aq.rawFloorY and(aq.rawFloorY+2.8))or ar.Y local aC=math.abs(an
.Y-aB)if aC>ae then return false end if aA<=(au+ac)then return true,aA,au,as,ar,
at end return false end if ax<-au or ax>at then return false end local ay=as*ax
local az=aw-ay local aA,aB=az.Magnitude,aq.rawFloorY and(aq.rawFloorY+2.8)or ar.
Y local aC=math.abs(an.Y-aB)if aC>ae then return false end if aA<=(au+ac)then
return true,aA,au,as,ar,at end return false end function af.IsPointInPart(an,ao)
if not ao or not ao:IsA'BasePart'or not ao.Parent or ah().IsIgnoredPart(ao)then
return false end if ao:IsA'Part'and(ao.Shape==Enum.PartType.Ball or ao.Shape==
Enum.PartType.Cylinder)then local ap,aq,ar=math.max(ao.Size.X,ao.Size.Z)/2+ac,an
.X-ao.Position.X,an.Z-ao.Position.Z local as,at=aq*aq+ar*ar,math.abs(an.Y-ao.
Position.Y)return(as<=ap*ap)and(at<=ae)end local ap=ao.Name:lower():find
'movingbeam'or(ao.Parent and ao.Parent.Name:lower():find'movingbeam')if ap then
local aq,ar,as=ao.CFrame:PointToObjectSpace(an),math.max(ao.Size.X,ao.Size.Z)/2+
ac,math.max(ao.Size.Y,math.min(ao.Size.X,ao.Size.Z))/2+ac if as<3.5 then as=3.5
end local at,au=aq.Y*aq.Y+aq.Z*aq.Z,math.abs(an.Y-ao.Position.Y)return(math.abs(
aq.X)<=ar)and(at<=(as+1.5)*(as+1.5))and(au<=ae)end local aq,ar,as,at=ao.CFrame:
PointToObjectSpace(an),ao.Size.X/2+ac,ao.Size.Z/2+ac,math.max(ae,ao.Size.Y/2+5)
return math.abs(aq.X)<=ar and math.abs(aq.Z)<=as and math.abs(aq.Y)<=at end
function af.IsPointInRingPart(an,ao)if not ao or not ao:IsA'BasePart'or not ao.
Parent or ah().IsIgnoredPart(ao)then return false end local ap=ao.Parent:
FindFirstChild'center'or ao.Parent:FindFirstChild'Center'local aq=ap and ap.
Position or ao.Position local ar=math.abs(an.Y-aq.Y)if ar>ae then return false
end local as,at=an.X-aq.X,an.Z-aq.Z local au,av=math.sqrt(as*as+at*at),ao.Size.Z
if av<1 then av=math.max(ao.Size.X,ao.Size.Z)/2 end local aw=(av>90)and 18 or 13
local ax=math.max(0,av-aw)if au<ax-ac then return false end if au>av+ac then
return false end local ay,az=ao.Position.X-aq.X,ao.Position.Z-aq.Z local aA=math
.sqrt(ay*ay+az*az)if aA>0.5 then local aB,aC=ay/aA,az/aA local aD=(as*aB)+(at*aC
)if aD<-ac then return false end end return true,au,ax,av,aq,ao.CFrame end
function af.IsPointInThirdBossMultiRings(an,ao)if not ao or not ao.Instance or
not ao.Instance.Parent then return false,nil end local ap=ah().GetFadeThreshold(
)if ao.ActiveParts then for aq in pairs(ao.ActiveParts)do if aq and aq.Parent
and aq:IsA'BasePart'and aq.Transparency<ap then local ar=af.IsPointInRingPart(an
,aq)if ar then return true,aq end end end end return false,nil end function af.
IsPointInSecondBossMovingBeam(an,ao)if not ao or not ao.Instance or not ao.
Instance.Parent then return false,nil,nil end local ap,aq=ao.Instance,ah()local
ar=aq.GetLockedProjectiles()[ap]if not ar and aq.LockSecondBossMovingBeam then
ar=aq.LockSecondBossMovingBeam(ap)end if not ar and aq.LockBossOrb then ar=aq.
LockBossOrb(ap)end if not ar then return false,nil,nil end local as=ap:IsA
'Model'and ap:FindFirstChildWhichIsA'BasePart'or(ap:IsA'BasePart'and ap)local at
=(as and as.Position)or(ap:IsA'Model'and select(1,ap:GetBoundingBox()).Position)
or ap.Position if ar.isBossOrb then local au=an-at local av=Vector3.new(au.X,0,
au.Z)local aw,ax=av.Magnitude,(ar.dangerRadius or 5)+ac if aw<=ax then local ay=
ar.lockedVisualY or at.Y local az=math.abs(an.Y-ay)if az<=ae then local aA,aB=as
or(ap:IsA'Model'and ap:FindFirstChildWhichIsA'BasePart')or ap,{isTrajectory=true
,isDynamicMoving=true,isBossOrb=true,perpDist=aw,dangerRadius=ar.dangerRadius or
5,forward2D=ar.forward2D or Vector3.new(0,0,-1),originPos=at,maxLookahead=ax}
return true,aA,aB end end return false,nil,nil end local au,av,aw,ax=ar.
forward2D or Vector3.new(0,0,-1),ar.dangerRadius or 25,ar.maxLookahead or 50,an-
at local ay=Vector3.new(ax.X,0,ax.Z)local az=ay:Dot(au)if az<-4 or az>(aw+2)then
return false,nil,nil end local aA=au*az local aB=ay-aA local aC,aD=aB.Magnitude,
ar.lockedVisualY or at.Y local aE=math.abs(an.Y-aD)if aE>ae then return false,
nil,nil end if aC<=(av+ac)then local aF,aG=as or(ap:IsA'Model'and ap:
FindFirstChildWhichIsA'BasePart')or ap,{isTrajectory=true,isDynamicMoving=true,
perpDist=aC,dangerRadius=av,forward2D=au,originPos=at,maxLookahead=aw}return
true,aF,aG end return false,nil,nil end function af.IsPointInAnyHazard(an,ao)
local ap,aq,ar,as,at=ah(),(math.huge)for au,av in pairs(ap.GetActiveHazardsMap()
)do if ao then if av.Instance==ao or(av.Instance and av.Instance.Name==ao.Name)
or(av.Name and av.Name==ao.Name)then continue end end local aw,ax=av.Name and av
.Name:lower():find'multiring'~=nil,av.Instance and av.Instance:IsA'Model'and((av
.Name and av.Name:lower():find'movingbeam'~=nil)or(av.Instance.Name and av.
Instance.Name:lower():find'movingbeam'~=nil))local ay=ax or(av.Instance and ap.
GetLockedProjectiles()[av.Instance]~=nil)if aw then local az,aA=af.
IsPointInThirdBossMultiRings(an,av)if az then local aB=(an-aA.Position).
Magnitude if aB<aq then aq=aB ar=av as=aA at=nil end end elseif ay then local az
,aA,aB=af.IsPointInSecondBossMovingBeam(an,av)if az then local aC=(an-(aA and aA
.Position or av.Instance.Position)).Magnitude if aC<aq then aq=aC ar=av as=aA or
av.Instance at=aB end end elseif av.ActiveParts then for az in pairs(av.
ActiveParts)do if ao and(az==ao or az.Name==ao.Name)then continue end local aA=
ap.GetTrajectoryConfigForPart(az)if aA then local aB,aC,aD,aE,aF,aG=af.
IsPointInTrajectory(an,az)if aB then local aH=(an-az.Position).Magnitude if aH<
aq then aq=aH ar=av as=az at={isTrajectory=true,perpDist=aC,dangerRadius=aD,
forward2D=aE,originPos=aF,maxLookahead=aG}end end else if af.IsPointInPart(an,az
)then local aB=(an-az.Position).Magnitude if aB<aq then aq=aB ar=av as=az at=nil
end end end end end end if as then return true,ar,as,at end return false,nil,nil
,nil end local an={Vector3.new(1,0,0),Vector3.new(-1,0,0),Vector3.new(0,0,1),
Vector3.new(0,0,-1)}function af.IsSpotFullySafe(ao,ap,aq)if not ao then return
false end ap=ap or 0.5 if af.IsPointInAnyHazard(ao,aq)then return false end for
ar,as in ipairs(an)do local at=ao+(as*ap)if af.IsPointInAnyHazard(at,aq)then
return false end end return true end function af.GetAllHazardsAtPoint(ao)local
ap,aq,ar=ah(),{},0 for as,at in pairs(ap.GetActiveHazardsMap())do local au=at.
Name and at.Name:lower():find'multiring'~=nil if au then local av,aw=af.
IsPointInThirdBossMultiRings(ao,at)if av then aq[aw]=true if at.Instance then aq
[at.Instance]=true end ar=ar+1 end elseif at.Instance and at.Instance:IsA'Model'
and((at.Name and at.Name:lower():find'movingbeam'~=nil)or(at.Instance.Name and
at.Instance.Name:lower():find'movingbeam'~=nil))then local av,aw=af.
IsPointInSecondBossMovingBeam(ao,at)if av then aq[aw or at.Instance]=true if at.
Instance then aq[at.Instance]=true end ar=ar+1 end elseif at.ActiveParts then
for av in pairs(at.ActiveParts)do local aw=ap.GetTrajectoryConfigForPart(av)if
aw then local ax=af.IsPointInTrajectory(ao,av)if ax then aq[av]=true if at.
Instance then aq[at.Instance]=true end if av.Parent and av.Parent~=ab then aq[av
.Parent]=true end ar=ar+1 end else if af.IsPointInPart(ao,av)then aq[av]=true if
at.Instance then aq[at.Instance]=true end if av.Parent and av.Parent~=ab then aq
[av.Parent]=true end ar=ar+1 end end end end end return aq,ar end function af.
IsPathSafe(ao,ap,aq,ar,as)local at=(ap-ao).Magnitude if at<=1.2 then return true
end local au=math.clamp(math.ceil(at/1.8),2,32)for av=1,au-1 do local aw=av/au
local ax=ao:Lerp(ap,aw)local ay,az,aA,aB=af.IsPointInAnyHazard(ax,as)if ay then
local aC,aD,aE=(az and az.Instance),aA and aA.Parent,false if aq and next(aq)~=
nil then aE=(aA and aq[aA])or(aC and aq[aC])or(aD and aq[aD])elseif ar then
local aF=ar:IsA'Model'and ar or ar.Parent aE=(aA and aA==ar)or(aF and aC and aF
==aC)or(aF and aD and aF==aD)end if aB and aB.isTrajectory and not aE then
return false end if not aE then return false end end end return true end return
af end function a.n()local aa,ab,ac,ad,ae=a.load'e',a.load'f',a.load'a',a.load
'b',(a.load'l')local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax,ay
,az,aA,aB,aC,aD,aE,aF,aG,aH=function()if not geometryRef then geometryRef=a.load
'm'end return geometryRef end,game:GetService'Players',game:GetService
'Workspace',game:GetService'ReplicatedStorage',game:GetService'HttpService',aa.
player,{},false,false,true,true,true,{},0,{},{},{},{},{smallIceSpikes={hitDelay=
0.8,totalLifetime=1.2},mediumIceSpikes={hitDelay=1.1,totalLifetime=1.5},
largeIceSpikes={hitDelay=1.4,totalLifetime=1.8},thirdBossMultiRings={hitDelay=2,
totalLifetime=2.8},firstBossCrissCross={hitDelay=1.6,totalLifetime=2.2},
firstBossSeekingSpikes={hitDelay=1.8,totalLifetime=2.5},firstBossBigSpike={
hitDelay=1.5,totalLifetime=2},firstBossBeamPart={hitDelay=1.5,totalLifetime=2},
secondBossMovingBeam={hitDelay=0,totalLifetime=3.5},secondbossyelloworb={
hitDelay=0,totalLifetime=4},secondbossredorb={hitDelay=0,totalLifetime=4},
secondbossgreenorb={hitDelay=0,totalLifetime=4}},{DodgeNode_ESP=true,[
'Enhanced Aura Ring']=true,EnhancedAuraRing=true,['Enhanced Aura']=true,
EnhancedAura=true,['Aura Ring']=true,AuraRing=true,AuraRingMesh=true,groundAura=
true,GroundAura=true,['Ground Aura']=true,['ground aura']=true},{largeIceSpikes=
true,mediumIceSpikes=true,smallIceSpikes=true,thirdBossMultiRings=true,
thirdBossMissile=true,thirdBossBeamPart=true,firstBossCrissCross=true,
firstBossSeekingSpikes=true,firstBossBigSpike=true,firstBossBeamPart=true,
secondBossMovingBeam=true,secondbossyelloworb=true,secondbossredorb=true,
secondbossgreenorb=true},0.85,{dungeon=true,Dungeon=true,Terrain=true,Camera=
true,CurrentCamera=true,RaycastIgnore=true,Drops=true,Loot=true,DodgeNode_ESP=
true,SmartDodge_SafeMarker=true,SmartDodge_SelectionBox=true,
SmartDodge_TrajectoryBox=true,SmartDodge_CrystalGuideBox=true,secondBossCrystals
=true,secondbosscrystals=true,['Enhanced Aura Ring']=true,EnhancedAuraRing=true,
['Enhanced Aura']=true,EnhancedAura=true,['Aura Ring']=true,AuraRing=true,
groundAura=true,GroundAura=true,['Ground Aura']=true,['ground aura']=true},{
secondbossyelloworb={colorName='yellow',color=Color3.fromRGB(255,230,0),
surfaceColor=Color3.fromRGB(255,215,0)},secondbossredorb={colorName='red',color=
Color3.fromRGB(255,45,45),surfaceColor=Color3.fromRGB(255,30,30)},
secondbossgreenorb={colorName='green',color=Color3.fromRGB(50,255,50),
surfaceColor=Color3.fromRGB(40,220,40)}},{firstbosscrisscross={name=
'firstBossCrissCross',dangerRadius=4,maxLookahead=nil,visualColor=Color3.
fromRGB(255,130,0)},firstbossseekingspikes={name='firstBossSeekingSpikes',
dangerRadius=4,maxLookahead=nil,visualColor=Color3.fromRGB(255,110,0)},
firstbossbigspike={name='firstBossBigSpike',dangerRadius=20,maxLookahead=140,
visualColor=Color3.fromRGB(255,130,0)},firstbossbeampart={name=
'firstBossBeamPart',dangerRadius=20,maxLookahead=140,visualColor=Color3.fromRGB(
255,130,0)},secondbossmovingbeam={name='secondBossMovingBeam',dangerRadius=25,
maxLookahead=nil,visualColor=Color3.fromRGB(255,130,0),isDynamicMoving=true},
secondbossyelloworb={name='secondBossYellowOrb',dangerRadius=5,maxLookahead=22,
visualColor=Color3.fromRGB(255,130,0),isDynamicMoving=true,isBossOrb=true,
orbColorName='yellow'},secondbossredorb={name='secondBossRedOrb',dangerRadius=5,
maxLookahead=22,visualColor=Color3.fromRGB(255,130,0),isDynamicMoving=true,
isBossOrb=true,orbColorName='red'},secondbossgreenorb={name='secondBossGreenOrb'
,dangerRadius=5,maxLookahead=22,visualColor=Color3.fromRGB(255,130,0),
isDynamicMoving=true,isBossOrb=true,orbColorName='green'},thirdbossmissile={name
='thirdBossMissile',dangerRadius=6,maxLookahead=140,visualColor=Color3.fromRGB(
255,130,0)},thirdbossbeampart={name='thirdBossBeamPart',dangerRadius=6,
maxLookahead=140,visualColor=Color3.fromRGB(255,130,0)}},50,2.5,{},{}al.
SetTrajectoryLookahead=function(aI)if type(aI)=='number'and aI>=10 then aE=aI
end end al.GetTrajectoryLookahead=function()return aE end al.
SetTrajectoryWidthPadding=function(aI)if type(aI)=='number'and aI>=0 then aF=aI
end end al.GetTrajectoryWidthPadding=function()return aF end al.
GetActiveHazardsMap=function()return ar end al.GetLockedProjectiles=function()
return aG end al.GetFadeThreshold=function()return aA end al.IsEnabled=function(
)return am end al.SetEnabled=function(aI)am=aI and true or false end al.
ClearTrajectoryVisuals=function()for aI,aJ in pairs(aH)do pcall(function()aJ:
Destroy()end)end table.clear(aH)table.clear(aG)end function al.AddCustomHazard(
aI)if type(aI)=='string'and#aI>0 then az[aI]=true end end function al.
AddTrajectoryProjectile(aI,aJ,aK)if type(aI)=='string'and#aI>0 then local aL=aI:
lower():gsub('%s+','')aD[aL]={name=aI,dangerRadius=aJ or 4,maxLookahead=aK,
visualColor=Color3.fromRGB(255,130,0)}if an then print((
'[SmartDodge] \u{1f680} Registered Trajectory Projectile: %s'):format(aI))end
end end local aI=function(aI)if not aI then return nil end local aJ=aI.Name:
lower():gsub('%s+','')if aD[aJ]then return aD[aJ]end if aI.Parent and aI.Parent:
IsA'Model'then local aK=aI.Parent.Name:lower():gsub('%s+','')if aD[aK]then
return aD[aK]end end return nil end al.GetTrajectoryConfigForPart=function(aJ)
return aI(aJ)end local aJ=function(aJ)if not aJ or not aJ:IsA'BasePart'then
return 6,nil end local aK,aL,aM=aJ:FindFirstChildOfClass'Beam'or(aJ.Parent and
aJ.Parent:FindFirstChildOfClass'Beam')if aK then local aN,aO=aK.Width0 or 0,aK.
Width1 or 0 local aP=math.max(aN,aO)if aP>0.5 then aL=aP end end local aN=aJ:
FindFirstChild'Attachment2'or(aJ.Parent and aJ.Parent:FindFirstChild
'Attachment2')if aN and aN:IsA'Attachment'then local aO=aN.WorldPosition-aJ.
Position if aO.Magnitude>5 then aM=aO.Magnitude end end local aO=aJ:
FindFirstChildOfClass'SpecialMesh'local aP,aQ,aR=(aO and aO.Scale.X)or 1,(aO and
aO.Scale.Y)or 1,(aO and aO.Scale.Z)or 1 local aS=Vector3.new(aJ.Size.X*math.abs(
aP),aJ.Size.Y*math.abs(aQ),aJ.Size.Z*math.abs(aR))if not aL then local aT,aU=aJ.
Name:lower():find'movingbeam'or(aJ.Parent and aJ.Parent.Name:lower():find
'movingbeam'),aJ.Name:lower():find'bigspike'or(aJ.Parent and aJ.Parent.Name:
lower():find'bigspike')if aT then aL=math.max(aS.X,aS.Z)elseif aU then aL=40 if
not aM then aM=140 end else local aV,aW=math.min(aS.X,aS.Z),math.max(aS.X,aS.Z)
if aV<1.2 and aW>=1.2 then aL=aW else aL=aV end end end local aT=math.clamp(aL
or 6,3,60)return aT,aM end local aK=function(aK)if not aK or not aK:IsA
'BasePart'then return nil end if aG[aK]then return aG[aK]end local aL=aI(aK)if
not aL then return nil end if aL.isDynamicMoving then local aM=aK.Name:lower():
find'movingbeam'or(aK.Parent and aK.Parent.Name:lower():find'movingbeam')if aM
then local aN=math.max(aK.Size.X,aK.Size.Z)if aN<8 then return nil end end end
local aM,aN=Vector3.new(0,0,-1),(aK.AssemblyLinearVelocity or(aK:IsA'BasePart'
and aK.Velocity))if aN and Vector3.new(aN.X,0,aN.Z).Magnitude>2 then aM=Vector3.
new(aN.X,0,aN.Z).Unit elseif aL.isDynamicMoving then local aO=aK.CFrame.
RightVector local aP=Vector3.new(aO.X,0,aO.Z)if aP.Magnitude>0.01 then aP=aP.
Unit else aP=Vector3.new(1,0,0)end local aQ,aR=Vector3.new(-aP.Z,0,aP.X),Vector3
.new(aK.CFrame.LookVector.X,0,aK.CFrame.LookVector.Z)if aR.Magnitude>0.01 and aQ
:Dot(aR.Unit)<0 then aQ=-aQ end aM=aQ else local aO=aK:FindFirstChild
'Attachment2'or(aK.Parent and aK.Parent:FindFirstChild'Attachment2')if aO and aO
:IsA'Attachment'then local aP=aO.WorldPosition-aK.Position local aQ=Vector3.new(
aP.X,0,aP.Z)if aQ.Magnitude>0.1 then aM=aQ.Unit end else local aP=aK.CFrame.
LookVector local aQ=Vector3.new(aP.X,0,aP.Z)if aQ.Magnitude>0.001 then aM=aQ.
Unit end end if aK.Name:lower():find'missile'then for aP,aQ in pairs(aG)do if aP
and aP.Parent and aP.Name:lower():find'beampart'and aQ and aQ.forward2D then if(
aP.Position-aK.Position).Magnitude<10 then aM=aQ.forward2D if aQ.maxLookahead
then autoLength=aQ.maxLookahead end break end end end end end local aO,aP=aJ(aK)
local aQ=aO/2 if aL.dangerRadius and aL.dangerRadius>aQ then aQ=aL.dangerRadius
end local aR,aS,aT,aU=aQ+aF,aP or aL.maxLookahead or aE,af().GetRawFloorY(aK.
Position)local aV=0.8 local aW=aT+(aV/2)+0.05 local aX={part=aK,originPos=aK.
Position,forward2D=aM,dangerRadius=aR,maxLookahead=aS,config=aL,spawnTime=os.
clock(),locked=true,rawFloorY=aT,lockedVisualY=aW,boxThickness=aV}aG[aK]=aX if
an then print((
'[SmartDodge] \u{1f680} Locked Trajectory for %s | Dir: (%.2f, %.2f) | Lookahead: %.0fm | Auto Width: %.1fm (Radius: %.1fm) | Locked Floor Y: %.2f'
):format(aK.Name,aM.X,aM.Z,aX.maxLookahead,aO,aX.dangerRadius,aT))end return aX
end al.LockTrajectoryForPart=function(aL)return aK(aL)end local aL=function(aL)
if not aL or not aL.Parent then return nil end if aG[aL]then return aG[aL]end
local aM,aN=aL:GetBoundingBox()local aO=aL:FindFirstChildWhichIsA'BasePart'local
aP,aQ=(aO and aO.Position)or aM.Position,(aO and aO.CFrame.RightVector)or aM.
RightVector local aR=Vector3.new(aQ.X,0,aQ.Z)if aR.Magnitude>0.01 then aR=aR.
Unit else aR=Vector3.new(1,0,0)end local aS,aT=Vector3.new(-aR.Z,0,aR.X),(aO and
aO.CFrame.LookVector)or aM.LookVector local aU=Vector3.new(aT.X,0,aT.Z)if aU.
Magnitude>0.01 and aS:Dot(aU.Unit)<0 then aS=-aS end local aV=math.max(aN.X,aN.Y
,aN.Z)if aV<12 then aV=50 end local aW,aX,aY,aZ=aV+aF*2,aE,af().GetRawFloorY(aP)
,0.8 local a_=aY+(aZ/2)+0.05 local a0={instance=aL,lastPos=aP,curPos=aP,
forward2D=aS,dangerRadius=aW/2,dangerWidth=aW,maxLookahead=aX,dangerDepth=aX,
lockedVisualY=a_,boxThickness=aZ,isDynamicMoving=true,config=aD.
secondbossmovingbeam}aG[aL]=a0 return a0 end al.LockSecondBossMovingBeam=aL
local aM=function(aM,aN)if not aM or not aM.Parent then return nil end if aG[aM]
then return aG[aM]end local aO,aP,aQ=aM:IsA'BasePart'and aM or(aM:IsA'Model'and
aM:FindFirstChildWhichIsA'BasePart')if aM:IsA'Model'then aP,aQ=aM:
GetBoundingBox()end local aR,aS,aT,aU=(aO and aO.Position)or(aP and aP.Position)
or aM.Position,Vector3.new(0,0,-1),22,ak and ak.Character and ak.Character:
FindFirstChild'HumanoidRootPart'local aV=aU and aU.Position if aV then local aW=
Vector3.new(aV.X-aR.X,0,aV.Z-aR.Z)local aX=aW.Magnitude if aX>0.3 then aS=aW.
Unit aT=math.clamp(aX+4,10,80)end end local aW=(aO and aO.Size)or aQ or Vector3.
new(6,6,6)local aX=math.max(aW.X,aW.Z)/2 if aX<4 then aX=4 end local aY=aX+aF
local aZ,a_,a0=aY*2,af().GetRawFloorY(aR),0.8 local a1=a_+(a0/2)+0.05 local a2={
instance=aM,lastPos=aR,curPos=aR,forward2D=aS,dangerRadius=aY,dangerWidth=aZ,
maxLookahead=aT,dangerDepth=aT,lockedVisualY=a1,boxThickness=a0,isDynamicMoving=
true,isBossOrb=true,config=aN or aD[aM.Name:lower():gsub('%s+','')]}aG[aM]=a2
return a2 end al.LockBossOrb=aM al.InitBossOrb=aM function al.
RegisterPlayerSkill(aN)if type(aN)=='string'and#aN>0 then local aO=aN:gsub(
'^%s+',''):gsub('%s+$','')if not ay[aO]then ay[aO]=true local aP=aO:lower():
gsub('%s+','')ay[aP]=true if an then print((
'[SmartDodge] \u{1f6e1}\u{fe0f} Registered Player Skill (Ignored): %s'):format(
aO))end end end end local aN,aO=function()local aN=function(aN)if not aN then
return end local aO=function(aO)if not aO then return end for aP,aQ in ipairs(aO
:GetChildren())do al.RegisterPlayerSkill(aQ.Name)end end local aP,aQ=function(aP
)if not aP then return end aO(aP)aP.ChildAdded:Connect(function(aQ)al.
RegisterPlayerSkill(aQ.Name)end)end,function(aP)if not aP then return end aO(aP)
aP.ChildAdded:Connect(function(aQ)if aQ:IsA'Tool'then al.RegisterPlayerSkill(aQ.
Name)end end)end if aN:FindFirstChild'Backpack'then aP(aN.Backpack)end aN.
ChildAdded:Connect(function(aR)if aR.Name=='Backpack'or aR:IsA'Backpack'then aP(
aR)end end)if aN.Character then aQ(aN.Character)end aN.CharacterAdded:Connect(aQ
)end for aO,aP in ipairs(ag:GetPlayers())do aN(aP)end ag.PlayerAdded:Connect(aN)
task.spawn(function()while am or#ag:GetPlayers()>0 do for aO,aP in ipairs(ag:
GetPlayers())do if aP:FindFirstChild'Backpack'then for aQ,aR in ipairs(aP.
Backpack:GetChildren())do al.RegisterPlayerSkill(aR.Name)end end if aP.Character
then for aQ,aR in ipairs(aP.Character:GetChildren())do if aR:IsA'Tool'then al.
RegisterPlayerSkill(aR.Name)end end end end task.wait(1)end end)end,function(aN)
if not aN then return end al.RegisterPlayerSkill(aN.Name)local aO=aN:
FindFirstChild'name'if aO and aO:IsA'ValueBase'and tostring(aO.Value)~=''then al
.RegisterPlayerSkill(tostring(aO.Value))end local aP=aN:GetAttribute'name'or aN:
GetAttribute'Name'if type(aP)=='string'and aP~=''then al.RegisterPlayerSkill(aP)
end for aQ,aR in ipairs(aN:GetDescendants())do if aR:IsA'BasePart'and aR.Name~=
'Handle'and aR.Name~='Part'and aR.Name~='Union'then al.RegisterPlayerSkill(aR.
Name)end end end local aP,aQ=function()local aP,aQ=function(aP)for aQ,aR in
ipairs(aP:GetChildren())do aO(aR)end aP.ChildAdded:Connect(function(aQ)aO(aQ)end
)if an then print((
'[SmartDodge] \u{1f4da} Loaded %d player abilities from ReplicatedStorage.abilities'
):format(#aP:GetChildren()))end end,ai:FindFirstChild'abilities'if aQ then aP(aQ
)else task.spawn(function()local aR=ai:WaitForChild('abilities',10)if aR then
aP(aR)end end)end end,function(aP)if not aP then return end al.
RegisterPlayerSkill(aP.Name)for aQ,aR in ipairs(aP:GetDescendants())do if aR:IsA
'BasePart'and aR.Name~='Handle'and aR.Name~='Part'and aR.Name~='Union'then al.
RegisterPlayerSkill(aR.Name)end end end local aR=function()local aR,aS=function(
aR)for aS,aT in ipairs(aR:GetChildren())do aQ(aT)end aR.ChildAdded:Connect(
function(aS)aQ(aS)end)if an then print((
'[SmartDodge] \u{1f386} Loaded %d player projectiles/effects from ReplicatedStorage.projectiles'
):format(#aR:GetChildren()))end end,ai:FindFirstChild'projectiles'if aS then aR(
aS)else task.spawn(function()local aT=ai:WaitForChild('projectiles',10)if aT
then aR(aT)end end)end end aN()aP()aR()local aS,aT,aU=function(aS)if not aS then
return true end local aT=aS.Name:gsub('^%s+',''):gsub('%s+$','')local aU,aV=aT:
lower():gsub('%s+',''),ai:FindFirstChild'enemyProjectiles'if aV and(aV:
FindFirstChild(aS.Name,true)or aV:FindFirstChild(aT,true))then return false end
if az[aS.Name]or aU:find'boss'or aU:find'enemy'or aU:find'mob'or aU:find
'multiring'or aU:find'crisscross'or aU:find'seekingspike'or aU:find'bigspike'or
aU:find'beampart'or aU:find'movingbeam'or aU:find'thirdboss'then return false
end for aW,aX in ipairs(ag:GetPlayers())do if aX.Character and(aS==aX.Character
or aS:IsDescendantOf(aX.Character))then return true end end aT=aS.Name:gsub(
'^%s+',''):gsub('%s+$','')aU=aT:lower():gsub('%s+','')for aW,aX in ipairs(ag:
GetPlayers())do local aY=aX:FindFirstChild'Backpack'if aY then if aY:
FindFirstChild(aS.Name)or aY:FindFirstChild(aT)then al.RegisterPlayerSkill(aS.
Name)return true end for aZ,a_ in ipairs(aY:GetChildren())do local a0=a_.Name:
lower():gsub('%s+','')if a_.Name==aS.Name or a0==aU then al.RegisterPlayerSkill(
a_.Name)return true end end end if aX.Character then if aX.Character:
FindFirstChild(aS.Name)or aX.Character:FindFirstChild(aT)then al.
RegisterPlayerSkill(aS.Name)return true end for aZ,a_ in ipairs(aX.Character:
GetChildren())do if a_:IsA'Tool'then local a0=a_.Name:lower():gsub('%s+','')if
a_.Name==aS.Name or a0==aU then al.RegisterPlayerSkill(a_.Name)return true end
end end end end local aW=aS:FindFirstChild'creator'or aS:FindFirstChild'Creator'
or aS:FindFirstChild'owner'or aS:FindFirstChild'Owner'or aS:FindFirstChild
'player'or aS:FindFirstChild'Player'or aS:FindFirstChild'caster'or aS:
FindFirstChild'Caster'if aW then if aW:IsA'ObjectValue'and aW.Value and aW.Value
:IsA'Player'then return true elseif aW:IsA'StringValue'and ag:FindFirstChild(aW.
Value)then return true end end local aX=aS:GetAttribute'Owner'or aS:GetAttribute
'Player'or aS:GetAttribute'creator'or aS:GetAttribute'Creator'if aX then if
type(aX)=='string'and ag:FindFirstChild(aX)then return true end end for aY,aZ in
ipairs(ag:GetPlayers())do local a_=aZ.Name:lower()if aU:find(a_,1,true)or aS.
Name:find(tostring(aZ.UserId),1,true)then return true end end if ay[aS.Name]or
ay[aT]or ay[aU]then return true end local aY=ai:FindFirstChild'abilities'if aY
and(aY:FindFirstChild(aS.Name)or aY:FindFirstChild(aT))then al.
RegisterPlayerSkill(aS.Name)return true end local aZ=ai:FindFirstChild
'projectiles'if aZ and(aZ:FindFirstChild(aS.Name)or aZ:FindFirstChild(aT))then
al.RegisterPlayerSkill(aS.Name)return true end if aU:find('enhancedaura',1,true)
or aU:find('auraring',1,true)or aU:find('groundaura',1,true)then return true end
return false end,{primarypart=true,center=true,root=true,main=true,handle=true,
humanoidrootpart=true},function(aS)if not aS then return true end if aS.Name:
find'SmartDodge'then return true end local aT=aS.Name:gsub('^%s+',''):gsub(
'%s+$','')local aU=aT:lower():gsub('%s+','')if az[aS.Name]or(aS.Parent and az[aS
.Parent.Name])or aS.Name:lower():find'multiring'or(aS.Parent and aS.Parent.Name:
lower():find'multiring')or aS.Name:lower():find'crisscross'or(aS.Parent and aS.
Parent.Name:lower():find'crisscross')or aS.Name:lower():find'seekingspike'or(aS.
Parent and aS.Parent.Name:lower():find'seekingspike')or aS.Name:lower():find
'bigspike'or(aS.Parent and aS.Parent.Name:lower():find'bigspike')or aS.Name:
lower():find'beampart'or(aS.Parent and aS.Parent.Name:lower():find'beampart')or
aS.Name:lower():find'movingbeam'or(aS.Parent and aS.Parent.Name:lower():find
'movingbeam')or aS.Name:lower():find'thirdboss'or(aS.Parent and aS.Parent.Name:
lower():find'thirdboss')or aS.Name:lower():find'missile'or(aS.Parent and aS.
Parent.Name:lower():find'missile')then return false end if ay[aS.Name]or ay[aT]
or ay[aU]or aB[aS.Name]then return true end if aU:find('enhancedaura',1,true)or
aU:find('auraring',1,true)or aU:find('groundaura',1,true)then return true end
return false end al.IsIgnoredPart=function(aV)return aU(aV)end local aV,aW,aX,aY
,aZ,a_,a0,a1=function(aV)local aW={}if not aV or aV.Name:find'SmartDodge'or aU(
aV)then return aW,false end local aX,aY=az[aV.Name]or aV.Name:lower():find
'multiring'or aV.Name:lower():find'crisscross'or aV.Name:lower():find
'seekingspike'or aV.Name:lower():find'bigspike'or aV.Name:lower():find'beampart'
or aV.Name:lower():find'movingbeam'or aV.Name:lower():find'thirdboss'or aV.Name:
lower():find'missile',function(aX)if not aX or not aX:IsA'BasePart'or aU(aX)then
return false end local aY=aX.Name:lower():gsub('%s+','')if aT[aY]then return
false end if aV.Name:lower():find'multiring'and not aY:find'ring'then return
false end if aI(aX)then return true end return aX.Transparency<aA end if aX then
if aV:IsA'BasePart'then if aY(aV)then table.insert(aW,aV)end elseif aV:IsA
'Model'then local aZ={}for a_,a0 in ipairs(aV:GetDescendants())do if aY(a0)and(
a0.Name:lower():find'precast'or a0.Name:lower():find'ring')then table.insert(aZ,
a0)end end if#aZ>0 then aW=aZ else for a_,a0 in ipairs(aV:GetDescendants())do if
aY(a0)and a0.Material==Enum.Material.Neon then table.insert(aW,a0)end end end
end else if aV:IsA'BasePart'then if aY(aV)and aV.Material==Enum.Material.Neon
then table.insert(aW,aV)end elseif aV:IsA'Model'then for aZ,a_ in ipairs(aV:
GetDescendants())do if aY(a_)and a_.Material==Enum.Material.Neon then table.
insert(aW,a_)end end end end return aW,aX end,function(aV,aW)if aW and#aW>0 then
return aW[1].Position end if aV:IsA'BasePart'then return aV.Position elseif aV:
IsA'Model'then local aX=aV:GetPivot()if aX and aX.Position~=Vector3.zero then
return aX.Position end end return Vector3.zero end,function()for aV,aW in
ipairs(at)do pcall(aW,as,lastHazardInfo)end end,function(aV)local aW={}for aX,aY
in ipairs(aV)do if aY and aY:IsA'BasePart'and aY.Parent then local aZ,a_,a0,a1,
a2=(aY.Material==Enum.Material.Neon),aC[aY.Name:lower()]or(aY.Parent and aC[aY.
Parent.Name:lower()]),aY.Name:lower():find'precast'~=nil,aY.Name:lower():find
'ring'~=nil,aI(aY)~=nil if aZ or a_ or a0 or a1 or a2 then local a3=Instance.new
'SelectionBox'a3.Name='SmartDodge_SelectionBox'if a_ then a3.Color3=a_.color a3.
SurfaceColor3=a_.surfaceColor a3.SurfaceTransparency=0.5 a3.LineThickness=0.08
else a3.Color3=Color3.fromRGB(255,45,45)a3.SurfaceColor3=Color3.fromRGB(255,30,
30)a3.SurfaceTransparency=0.6 a3.LineThickness=0.05 end a3.Adornee=aY a3.Parent=
aY table.insert(aW,a3)end end end return aW end,function(aV)if ae then return ae
.GetSkillTiming(aV)end local aW=ax[aV]if aW then if type(aW)=='table'then return
aW.totalLifetime or 2,aW.hitDelay or 1.5 else return aW,aW*0.7 end end return
2.5,1.8 end,function(aV,aW,aX)if not ap then return nil,nil end local aY=aW and
aW[1]if not aY or not aY:IsA'BasePart'then if aV:IsA'BasePart'then aY=aV elseif
aV:IsA'Model'then aY=aV:FindFirstChildWhichIsA'BasePart'else return nil,nil end
end local aZ=Instance.new'BillboardGui'aZ.Name='SmartDodge_TimerBillboard'aZ.
Adornee=aY aZ.Size=UDim2.new(0,160,0,40)aZ.StudsOffset=Vector3.new(0,4,0)aZ.
AlwaysOnTop=true aZ.ResetOnSpawn=false local a_=Instance.new'TextLabel'a_.Name=
'TimerLabel'a_.Size=UDim2.new(1,0,1,0)a_.BackgroundTransparency=1 a_.Font=Enum.
Font.GothamBold a_.TextSize=13 a_.TextColor3=Color3.fromRGB(255,220,80)a_.Text=
aX..'\n\u{23f3} calculating...'local a0=Instance.new'UIStroke'a0.Color=Color3.
fromRGB(0,0,0)a0.Thickness=1.5 a0.Parent=a_ a_.Parent=aZ aZ.Parent=aY return aZ,
a_ end,function(aV,aW)if not aV then return nil,nil end local aX=aV:
FindFirstChild'creator'or aV:FindFirstChild'Creator'or aV:FindFirstChild'owner'
or aV:FindFirstChild'Owner'or aV:FindFirstChild'caster'or aV:FindFirstChild
'Caster'if aX and aX:IsA'ObjectValue'and aX.Value and aX.Value:IsA'Model'then
local aY=aX.Value:FindFirstChildOfClass'Humanoid'if aY and aY.Health>0 then
return aX.Value,aY end end local aY=ab.GetTrackedEnemyData()if not aY or#aY==0
then return nil,nil end if#aY==1 or ab.IsBossActive()then local aZ=aY[1]if aZ
and aZ.Model and aZ.Humanoid and aZ.Humanoid.Health>0 then return aZ.Model,aZ.
Humanoid end end if aW then local aZ,a_,a0=1225 for a1,a2 in ipairs(aY)do if a2
and a2.Root and a2.Root.Parent then local a3=a2.Humanoid or(a2.Model and a2.
Model:FindFirstChildOfClass'Humanoid')if a3 and a3.Health>0 then local a4=(a2.
Root.Position-aW).Magnitude^2 if a4<aZ then aZ=a4 a_=a2.Model a0=a3 end end end
end if a_ and a0 then return a_,a0 end end return nil,nil end local function a2(
a3)if not am or not a3 or ar[a3]then return end if a3:IsA'Folder'then return end
if a3:FindFirstChildOfClass'Humanoid'then return end if a3.Name:find'SmartDodge'
then return end if aB[a3.Name]or ay[a3.Name]then return end if not(ae and ae.
IsRecording())then if ab.GetEnemyCount()==0 and not ab.IsBossActive()then return
end end local a4,a5=aV(a3)if#a4==0 then if a3:IsA'Model'then local a6 a6=a3.
DescendantAdded:Connect(function(a7)if a7:IsA'BasePart'and a7.Transparency<aA
then if a5 or a7.Material==Enum.Material.Neon then if a6 then a6:Disconnect()a6=
nil end a2(a3)end end end)task.delay(1.5,function()if a6 then a6:Disconnect()a6=
nil end end)elseif a3:IsA'BasePart'and a3.Transparency<aA then local a6 a6=a3:
GetPropertyChangedSignal'Material':Connect(function()if a3.Material==Enum.
Material.Neon then if a6 then a6:Disconnect()a6=nil end a2(a3)end end)task.
delay(1.5,function()if a6 then a6:Disconnect()a6=nil end end)end return end if
aS(a3)then return end local a6=aW(a3,a4)local a7,a8=a0(a3,a6)if a8 and a8.Health
<=0 then return end local a9=ak and ak.Character and ak.Character:FindFirstChild
'HumanoidRootPart'local b,ba,bb,bc,bd=a9 and math.floor((a6-a9.Position).
Magnitude)or 0,{},{},{},{}for be,bf in ipairs(a4)do ba[bf]=true local bg=bf.
Transparency bc[bf]=bg bd[bf]=(bg<=0.28)end local be,bf,bg=ao and aY(a4)or{}if
ap then bf,bg=a_(a3,a4,a3.Name)end local bh={Instance=a3,Name=a3.Name,Class=a3.
ClassName,Position=a6,SpawnPosition=a6,Distance=b,NeonCount=#a4,SpawnTime=os.
clock(),HitTime=nil,Connections=bb,ActiveParts=ba,VisualBoxes=be,TimerBillboard=
bf,TimerLabel=bg,IsException=a5,Caster=a7,CasterHumanoid=a8}ar[a3]=bh as=as+1
lastHazardInfo=bh if a7 and a8 then table.insert(bb,a8.Died:Connect(function()
a1(a3,'Caster Dead')end))table.insert(bb,a7.AncestryChanged:Connect(function(bi,
bj)if not bj then a1(a3,'Caster Removed')end end))end for bi,bj in ipairs(a3:
GetDescendants())do if bj:IsA'Sound'then table.insert(bb,bj.Played:Connect(
function()if not bh.HitTime then bh.HitTime=os.clock()end end))end end if a3:IsA
'Model'then table.insert(bb,a3.DescendantAdded:Connect(function(bi)if not bh.
HitTime and(bi:IsA'ParticleEmitter'or bi:IsA'Sound'or(bi:IsA'BasePart'and bi.
Name~='precast'))then bh.HitTime=os.clock()end end))end local bi=(a3.Name or''):
lower():gsub('%s+','')if a3:IsA'Model'and(bi:find'movingbeam'~=nil or(a3.Name
and a3.Name:lower():find'movingbeam'~=nil))then aL(a3)end if aC[bi]or(a3.Name
and aC[a3.Name:lower():gsub('%s+','')])then aM(a3,aD[bi])end for bj,bk in
ipairs(a4)do if aI(bk)then aK(bk)end end local bj=function(bj)if not ar[a3]or
not ba[bj]then return end if bh.CasterHumanoid and(bh.CasterHumanoid.Health<=0
or not bh.Caster or not bh.Caster.Parent)then a1(a3,'Caster Dead')return end
local bk=bj.Transparency local bl=bc[bj]or bk if bk<bl then bl=bk bc[bj]=bl end
if bl<=0.28 then bd[bj]=true if not bh.HitTime then bh.HitTime=os.clock()end end
local bm,bn,bo=bd[bj]and(bk>=(bl+0.18)or bk>=0.4),aI(bj)~=nil,false if not bj.
Parent then bo=true elseif bn then if bk<aA then bd[bj]=true end if bd[bj]and(bk
>=aA or bm)then bo=true end else bo=bm or(bk>=aA)or(not a5 and bj.Material~=Enum
.Material.Neon)end if bo then ba[bj]=nil bc[bj]=nil bd[bj]=nil if aH[bj]then
pcall(function()aH[bj]:Destroy()end)aH[bj]=nil end if aG[bj]then aG[bj]=nil end
local bp=0 for bq in pairs(ba)do bp=bp+1 end if bp==0 then local bq=bm and
'Post-flash Decay (Early Hitbox Clearance)'or'Faded / Finished'a1(a3,bq)else bh.
NeonCount=bp end end end for bk,bl in ipairs(a4)do table.insert(bb,bl:
GetPropertyChangedSignal'Transparency':Connect(function()bj(bl)end))if not a5
then table.insert(bb,bl:GetPropertyChangedSignal'Material':Connect(function()bj(
bl)end))end table.insert(bb,bl.AncestryChanged:Connect(function()bj(bl)end))end
if a3:IsA'Model'then table.insert(bb,a3.DescendantAdded:Connect(function(bk)if
not ar[a3]then return end local bl=bk:IsA'BasePart'and not aU(bk)and bk.
Transparency<aA if bl then local bm=bk.Name:lower():gsub('%s+','')if not aT[bm]
then if a5 or bk.Material==Enum.Material.Neon then if not ba[bk]then ba[bk]=true
bh.NeonCount=bh.NeonCount+1 local bn=bk.Transparency bc[bk]=bn bd[bk]=(bn<=0.28)
if aI(bk)then aK(bk)end if ao then local bo=aY{bk}if bo and#bo>0 then for bp,bq
in ipairs(bo)do table.insert(bh.VisualBoxes,bq)end end end table.insert(bb,bk:
GetPropertyChangedSignal'Transparency':Connect(function()bj(bk)end))table.
insert(bb,bk.AncestryChanged:Connect(function()bj(bk)end))end end end end end))
end if a3.Name:lower():find'multiring'then task.delay(0.3,function()if not a3 or
not a3.Parent then return end local bk=a3:FindFirstChild'center'or a3:
FindFirstChild'Center'or(a4 and a4[1])local bl=bk and bk.Position or Vector3.
zero print[[================ [MULTIRINGS INSPECTOR DUMP] ================]]
print(('[MultiRings] Model: %s | Center: (%.1f, %.1f, %.1f)'):format(a3.Name,bl.
X,bl.Y,bl.Z))local bm=0 for bn,bo in ipairs(a3:GetDescendants())do if bo:IsA
'BasePart'then bm=bm+1 local bp,bq,br=bo.Position-bl,bo.CFrame:ToOrientation()
print((
[[[%d] Name: '%s' | Class: %s | Size: (%.1f, %.1f, %.1f) | Offset: (%.1f, %.1f, %.1f) | RotY: %.1f deg]]
):format(bm,bo.Name,bo.ClassName,bo.Size.X,bo.Size.Y,bo.Size.Z,bp.X,bp.Y,bp.Z,
math.deg(br)))end end print
[[=============================================================]]end)end if an
then print((
'[SmartDodge][Hazard] \u{1f6a8} Hazard Detected: %s | Class: %s | Parts: %d | Dist: %d studs%s'
):format(bh.Name,bh.Class,bh.NeonCount,bh.Distance,a5 and' (Exception)'or''))end
aX()end function a1(a3,a4)if not ar[a3]then return end local a5=ar[a3]if a5.
VisualBoxes then for a6,a7 in ipairs(a5.VisualBoxes)do pcall(function()a7:
Destroy()end)end table.clear(a5.VisualBoxes)end if a5.Connections then for a6,a7
in ipairs(a5.Connections)do pcall(function()a7:Disconnect()end)end table.clear(
a5.Connections)end if a5.ActiveParts then for a6 in pairs(a5.ActiveParts)do if
aH[a6]then pcall(function()aH[a6]:Destroy()end)aH[a6]=nil end if aG[a6]then aG[
a6]=nil end end end if a5.TimerBillboard then pcall(function()a5.TimerBillboard:
Destroy()end)a5.TimerBillboard=nil a5.TimerLabel=nil end if ae and ae.
IsRecording()and a5.SpawnTime then local a6,a7,a8=os.clock()-a5.SpawnTime,a5.
HitTime and(a5.HitTime-a5.SpawnTime)or nil,aW(a3,nil)local a9,b=(a8-(a5.
SpawnPosition or a5.Position or Vector3.zero)).Magnitude,(a5.Name or''):lower():
gsub('%s+','')local ba=(aD[b]~=nil)or(b:find'projectile'~=nil)or(b:find'missile'
~=nil)or(b:find'orb'~=nil)or(b:find'bullet'~=nil)or(b:find'ball'~=nil)or(b:find
'movingbeam'~=nil)or(b:find'crisscross'~=nil)or(b:find'seekingspike'~=nil)or(a9
>=6)if ba then a7=0 elseif not a7 or a7<0.1 or a7>a6 then local bb,bc=aZ(a5.Name
)a7=math.min(bc,a6*0.75)end if a6>=0.2 and a6<=25 then ae.RecordSkill(a5.Name,a6
,a7,ba)local bb=ba and'\u{1f680} Projectile'or'\u{1f4a5} AoE'print((
"[SkillTiming] \u{1f4dd} Recorded: '%s' [%s] | Lifetime: %.2fs | HitDelay: %.2fs (%s)"
):format(a5.Name,bb,a6,a7,a4 or'Despawned'))else print((
"[SkillTiming] \u{26a0}\u{fe0f} Skipped '%s': duration %.2fs out of range [0.2, 25.0]"
):format(a5.Name,a6))end end ar[a3]=nil as=math.max(0,as-1)if an and a5 then
local a6=a4 and(' ('..a4..')')or''print((
'[SmartDodge][Hazard] \u{1f7e2} Hazard Expired: %s%s'):format(a5.Name,a6))end
aX()end al.RegisterHazard=a2 al.UnregisterHazard=a1 function al.
UpdateTrajectories()if not am then table.clear(aG)return end local a3={}for a4,
a5 in pairs(ar)do local a6=a5.Instance if a6 and a6.Parent then local a7=(a6.
Name or''):lower():gsub('%s+','')local a8,a9=a6:IsA'Model'and(a7:find
'movingbeam'~=nil or(a5.Name and a5.Name:lower():find'movingbeam'~=nil)),aC[a7]
or(a5.Name and aC[a5.Name:lower():gsub('%s+','')])local b=(a9~=nil)or(aD[a7]and
aD[a7].isBossOrb)if a8 then a3[a6]=true local ba,bb=a6:GetBoundingBox()local bc=
a6:FindFirstChildWhichIsA'BasePart'local bd,be=(bc and bc.Position)or ba.
Position,aG[a6]if not be then be=aL(a6)end if be then local bf=bd-be.lastPos
local bg=Vector3.new(bf.X,0,bf.Z)if bg.Magnitude>0.08 then be.forward2D=bg.Unit
end be.lastPos=bd be.curPos=bd local bh=math.max(bb.X,bb.Y,bb.Z)if bh<12 then bh
=50 end local bi,bj=bh+aF*2,(be.config and be.config.maxLookahead)or aE local bk
=bj be.dangerRadius=bi/2 be.dangerWidth=bi be.maxLookahead=bk be.dangerDepth=bk
local bl,bm=af().GetRawFloorY(bd),0.8 local bn=bl+(bm/2)+0.05 be.lockedVisualY=
bn be.boxThickness=bm end elseif b then a3[a6]=true local ba,bb,bc=a6:IsA
'BasePart'and a6 or(a6:IsA'Model'and a6:FindFirstChildWhichIsA'BasePart')if a6:
IsA'Model'then bb,bc=a6:GetBoundingBox()end local bd,be=(ba and ba.Position)or(
bb and bb.Position)or a6.Position,aG[a6]if not be then be=aM(a6,aD[a7])end if be
then local bf=ak and ak.Character and ak.Character:FindFirstChild
'HumanoidRootPart'local bg,bh=bf and bf.Position,22 if bg then local bi=Vector3.
new(bg.X-bd.X,0,bg.Z-bd.Z)local bj=bi.Magnitude if bj>0.3 then be.forward2D=bi.
Unit bh=math.clamp(bj+4,10,80)end else local bi=ba and(ba.AssemblyLinearVelocity
or(ba:IsA'BasePart'and ba.Velocity))local bj=bi and Vector3.new(bi.X,0,bi.Z)if
bj and bj.Magnitude>1.5 then be.forward2D=bj.Unit else local bk=bd-be.lastPos
local bl=Vector3.new(bk.X,0,bk.Z)if bl.Magnitude>0.05 then be.forward2D=bl.Unit
end end end be.lastPos=bd be.curPos=bd local bi=(ba and ba.Size)or bc or Vector3
.new(6,6,6)local bj=math.max(bi.X,bi.Z)/2 if bj<4 then bj=4 end local bk=bj+aF
local bl=bk*2 be.dangerRadius=bk be.dangerWidth=bl be.maxLookahead=bh be.
dangerDepth=bh local bm,bn=af().GetRawFloorY(bd),0.8 local bo=bm+(bn/2)+0.05 be.
lockedVisualY=bo be.boxThickness=bn end else if a5.ActiveParts then for ba in
pairs(a5.ActiveParts)do if ba and ba.Parent and ba:IsA'BasePart'then local bb=
aI(ba)if bb then a3[ba]=true local bc=aG[ba]or aK(ba)if bc and bc.forward2D then
local bd,be=aJ(ba)local bf=bd/2 if bc.config and bc.config.dangerRadius and bc.
config.dangerRadius>bf then bf=bc.config.dangerRadius end local bg,bh=bf+aF,be
or(bc.config and bc.config.maxLookahead)or bc.maxLookahead or aE bc.dangerRadius
=bg bc.maxLookahead=bh end end end end end end end end for a4 in pairs(aG)do if
not a3[a4]then aG[a4]=nil end end end function al.UpdateTrajectoryVisuals()if
not ao or not am then for a3,a4 in pairs(aH)do pcall(function()a4:Destroy()end)
end table.clear(aH)return end local a3={}for a4,a5 in pairs(ar)do local a6=a5.
Instance if a6 and a6.Parent then local a7=(a6.Name or''):lower():gsub('%s+','')
local a8,a9=(a7:find'movingbeam'~=nil or(a5.Name and a5.Name:lower():find
'movingbeam'~=nil)),aC[a7]or(a5.Name and aC[a5.Name:lower():gsub('%s+','')])
local b=(a9~=nil)or(aD[a7]and aD[a7].isBossOrb)if a8 then local ba=aG[a6]if not
ba and aL then ba=aL(a6)end if ba then a3[a6]=true local bb,bc,bd,be=ba.curPos
or(a6:IsA'Model'and select(1,a6:GetBoundingBox()).Position)or a6.Position,ba.
forward2D or Vector3.new(0,0,-1),ba.dangerWidth or(ba.dangerRadius*2),ba.
dangerDepth or ba.maxLookahead or 50 local bf,bg,bh=ba.lockedVisualY or(af().
GetRawFloorY(bb)+0.45),ba.boxThickness or 0.8,aH[a6]if not bh or not bh.Parent
then bh=Instance.new'Part'bh.Name='SmartDodge_TrajectoryBox'bh.Material=Enum.
Material.Neon bh.Color=Color3.fromRGB(255,130,0)bh.Transparency=0.82 bh.Anchored
=true bh.CanCollide=false bh.CanQuery=false bh.CanTouch=false local bi=Instance.
new'SelectionBox'bi.Name='TrajectoryBorder'bi.Color3=Color3.fromRGB(255,150,30)
bi.SurfaceColor3=Color3.fromRGB(255,130,0)bi.SurfaceTransparency=0.8 bi.
LineThickness=0.04 bi.Adornee=bh bi.Parent=bh local bj=Instance.new
'BillboardGui'bj.Name='TrajGui'bj.Size=UDim2.fromOffset(220,26)bj.StudsOffset=
Vector3.new(0,2.5,0)bj.AlwaysOnTop=true bj.Adornee=bh bj.Parent=bh local bk=
Instance.new'TextLabel'bk.Name='Label'bk.Size=UDim2.fromScale(1,1)bk.
BackgroundTransparency=1 bk.TextColor3=Color3.fromRGB(255,170,40)bk.
TextStrokeTransparency=0 bk.TextStrokeColor3=Color3.fromRGB(0,0,0)bk.Font=Enum.
Font.GothamBold bk.TextSize=12 bk.Text=(
'\u{1f680} MOVING BEAM: %s (%.0fm | W:%.1fm)'):format(a6.Name,be,bd)bk.Parent=bj
aH[a6]=bh else local bi=bh:FindFirstChild'TrajGui'local bj=bi and bi:
FindFirstChild'Label'if bj and bj:IsA'TextLabel'then bj.Text=(
'\u{1f680} MOVING BEAM: %s (%.0fm | W:%.1fm)'):format(a6.Name,be,bd)end end bh.
Size=Vector3.new(bd,bg,be)local bi=Vector3.new(bb.X,bf,bb.Z)+bc*((be/2)-1.5)bh.
CFrame=CFrame.lookAt(bi,bi+bc)bh.Parent=ah.Terrain end elseif b then local ba=aG
[a6]if ba then a3[a6]=true local bb,bc,bd,be=ba.curPos or a6.Position,ba.
forward2D or Vector3.new(0,0,-1),ba.dangerWidth or(ba.dangerRadius*2),ba.
dangerDepth or ba.maxLookahead or 22 local bf,bg,bh,bi=ba.lockedVisualY or(af().
GetRawFloorY(bb)+0.45),ba.boxThickness or 0.8,(ba.config and ba.config.
orbColorName)or(a9 and a9.colorName)or'orb',aH[a6]if not bi or not bi.Parent
then bi=Instance.new'Part'bi.Name='SmartDodge_TrajectoryBox'bi.Material=Enum.
Material.Neon bi.Color=Color3.fromRGB(255,130,0)bi.Transparency=0.82 bi.Anchored
=true bi.CanCollide=false bi.CanQuery=false bi.CanTouch=false local bj=Instance.
new'SelectionBox'bj.Name='TrajectoryBorder'bj.Color3=Color3.fromRGB(255,150,30)
bj.SurfaceColor3=Color3.fromRGB(255,130,0)bj.SurfaceTransparency=0.8 bj.
LineThickness=0.04 bj.Adornee=bi bj.Parent=bi local bk=Instance.new
'BillboardGui'bk.Name='TrajGui'bk.Size=UDim2.fromOffset(220,26)bk.StudsOffset=
Vector3.new(0,2.5,0)bk.AlwaysOnTop=true bk.Adornee=bi bk.Parent=bi local bl=
Instance.new'TextLabel'bl.Name='Label'bl.Size=UDim2.fromScale(1,1)bl.
BackgroundTransparency=1 bl.TextColor3=Color3.fromRGB(255,170,40)bl.
TextStrokeTransparency=0 bl.TextStrokeColor3=Color3.fromRGB(0,0,0)bl.Font=Enum.
Font.GothamBold bl.TextSize=12 bl.Text=('\u{1f680} %s ORB: %s (%.0fm | W:%.1fm)'
):format(bh:upper(),a6.Name,be,bd)bl.Parent=bk aH[a6]=bi else local bj=bi:
FindFirstChild'TrajGui'local bk=bj and bj:FindFirstChild'Label'if bk and bk:IsA
'TextLabel'then bk.Text=('\u{1f680} %s ORB: %s (%.0fm | W:%.1fm)'):format(bh:
upper(),a6.Name,be,bd)end end bi.Size=Vector3.new(bd,bg,be)local bj=Vector3.new(
bb.X,bf,bb.Z)+bc*((be/2)-2)bi.CFrame=CFrame.lookAt(bj,bj+bc)bi.Parent=ah.Terrain
end else if a5.ActiveParts then for ba in pairs(a5.ActiveParts)do if ba and ba.
Parent and ba:IsA'BasePart'then local bb=aI(ba)if bb then local bc,bd,be=ba.Name
:lower():find'beampart'~=nil,ba.Name:lower():find'missile'~=nil,false if bc or
bd then for bf in pairs(a3)do if bf~=ba and bf:IsA'BasePart'and(bf.Position-ba.
Position).Magnitude<6 then be=true break end end end if not be then local bf=aG[
ba]if bf and bf.forward2D then a3[ba]=true local bg,bh,bi,bj=bf.maxLookahead or
aE,bf.dangerRadius or 4,bf.forward2D,ba.Position local bk,bl,bm,bn,bo=bj+bi*(bg/
2),bf.lockedVisualY or(bf.rawFloorY and(bf.rawFloorY+0.45))or(af().GetRawFloorY(
bj)+0.45),bf.boxThickness or 0.8,bg,bh*2 local bp,bq=(
'\u{1f680} TRAJECTORY: %s (%.0fm | W:%.1fm)'):format(ba.Name,bg,bo),aH[ba]if not
bq or not bq.Parent then bq=Instance.new'Part'bq.Name='SmartDodge_TrajectoryBox'
bq.Material=Enum.Material.Neon bq.Color=bb.visualColor or Color3.fromRGB(255,130
,0)bq.Transparency=0.82 bq.Anchored=true bq.CanCollide=false bq.CanQuery=false
bq.CanTouch=false local br=Instance.new'SelectionBox'br.Name='TrajectoryBorder'
br.Color3=Color3.fromRGB(255,150,30)br.SurfaceColor3=bb.visualColor or Color3.
fromRGB(255,130,0)br.SurfaceTransparency=0.8 br.LineThickness=0.04 br.Adornee=bq
br.Parent=bq local bs=Instance.new'BillboardGui'bs.Name='TrajGui'bs.Size=UDim2.
fromOffset(200,26)bs.StudsOffset=Vector3.new(0,2.5,0)bs.AlwaysOnTop=true bs.
Adornee=bq bs.Parent=bq local bt=Instance.new'TextLabel'bt.Name='Label'bt.Size=
UDim2.fromScale(1,1)bt.BackgroundTransparency=1 bt.TextColor3=Color3.fromRGB(255
,170,40)bt.TextStrokeTransparency=0 bt.TextStrokeColor3=Color3.fromRGB(0,0,0)bt.
Font=Enum.Font.GothamBold bt.TextSize=12 bt.Text=bp bt.Parent=bs aH[ba]=bq else
local br=bq:FindFirstChild'TrajGui'local bs=br and br:FindFirstChild'Label'if bs
and bs:IsA'TextLabel'then bs.Text=bp end end bq.Size=Vector3.new(bo,bm,bn)local
br=Vector3.new(bk.X,bl,bk.Z)bq.CFrame=CFrame.lookAt(br,br+bi)bq.Parent=ah.
Terrain end end end end end end end end end for a4,a5 in pairs(aH)do if not a3[
a4]then pcall(function()a5:Destroy()end)aH[a4]=nil end end end function al.
ClearTrajectoryVisuals()for a3,a4 in pairs(aH)do pcall(function()a4:Destroy()end
)end table.clear(aH)end function al.ClearAllHazards(a3)local a4={}for a5 in
pairs(ar)do table.insert(a4,a5)end for a5,a6 in ipairs(a4)do a1(a6,a3 or'Purged'
)end table.clear(ar)table.clear(aG)as=0 al.ClearTrajectoryVisuals()aX()if an and
a3 then print(('[SmartDodge][Hazard] \u{1f9f9} All hazards cleared: %s'):format(
a3))end end function al.StartScan()for a3,a4 in ipairs(au)do a4:Disconnect()end
table.clear(au)for a3,a4 in ipairs(av)do pcall(a4)end table.clear(av)al.
ClearAllHazards'StartScan Reset'for a3,a4 in ipairs(ah:GetChildren())do a2(a4)
end table.insert(au,ah.ChildAdded:Connect(function(a3)a2(a3)end))table.insert(au
,ah.ChildRemoved:Connect(function(a3)a1(a3,'Destroyed')end))local a3=ab.
OnBossActiveChanged(function(a3)if not a3 then al.ClearAllHazards'Boss Defeated'
end end)table.insert(av,a3)local a4=ab.OnEnemyChanged(function()local a4=ab.
GetEnemyCount()if a4==0 and not ab.IsBossActive()then al.ClearAllHazards
'Room Cleared'else for a5,a6 in pairs(ar)do if a6.CasterHumanoid and(a6.
CasterHumanoid.Health<=0 or not a6.Caster or not a6.Caster.Parent)then task.
spawn(function()a1(a5,'Caster Dead')end)end end end end)table.insert(av,a4)if an
then print'[SmartDodge] \u{1f4e1} Threat Detector & Safe Spot Engine started!'
end end function al.StopScan()for a3,a4 in ipairs(au)do a4:Disconnect()end table
.clear(au)for a3,a4 in ipairs(av)do pcall(a4)end table.clear(av)al.
ClearAllHazards'StopScan'if an then print
'[SmartDodge] \u{1f6d1} Threat Detector stopped.'end end function al.
SetLogHazards(a3)an=a3 and true or false end function al.IsLogHazardsEnabled()
return an end function al.SetVisualEsp(a3)ao=a3 and true or false al.
UpdateTrajectoryVisuals()if ao then for a4,a5 in pairs(ar)do if(not a5.
VisualBoxes or#a5.VisualBoxes==0)and a5.ActiveParts then local a6={}for a7 in
pairs(a5.ActiveParts)do table.insert(a6,a7)end a5.VisualBoxes=aY(a6)end end else
for a4,a5 in pairs(ar)do if a5.VisualBoxes then for a6,a7 in ipairs(a5.
VisualBoxes)do pcall(function()a7:Destroy()end)end table.clear(a5.VisualBoxes)
end end end end function al.IsVisualEspEnabled()return ao end function al.
GetHazardCount()return as end function al.GetActiveHazards()local a3={}for a4,a5
in pairs(ar)do if a5.Instance and a5.Instance.Parent==ah then table.insert(a3,a5
)end end return a3 end function al.GetLastHazardInfo()return lastHazardInfo end
function al.OnHazardChanged(a3)if type(a3)~='function'then return end table.
insert(at,a3)end function al.GetActiveBossOrb()for a3,a4 in pairs(ar)do if a3
and a3.Parent then local a5=(a3.Name or''):lower():gsub('%s+','')local a6=aC[a5]
if not a6 then if a5:find'yelloworb'then a6=aC.secondbossyelloworb elseif a5:
find'redorb'then a6=aC.secondbossredorb elseif a5:find'greenorb'then a6=aC.
secondbossgreenorb end end if a6 then local a7=a3:IsA'BasePart'and a3 or nil if
not a7 and a4.ActiveParts then for a8 in pairs(a4.ActiveParts)do if a8 and a8.
Parent and a8:IsA'BasePart'then a7=a8 break end end end if not a7 then a7=a3:
FindFirstChildWhichIsA'BasePart'end if a7 and a7.Parent then return a7,a6.
colorName,a3,a6 end end end end return nil,nil,nil,nil end function al.
GetHazardTimeRemaining(a3)local a4=ar[a3]if not a4 or not a4.SpawnTime then
return nil,nil,0,nil,nil end local a5,a6,a7=os.clock()-a4.SpawnTime,aZ(a4.Name)
local a8,a9=math.max(0,a6-a5),math.max(0,a7-a5)return a8,a6,a5,a9,a7 end
function al.GetSkillProfile(a3)return aw[a3]end function al.GetAllSkillProfiles(
)return aw end function al.UpdateHazardTimers()if not ap then return end local
a3=os.clock()for a4,a5 in pairs(ar)do if a5.TimerLabel and a5.SpawnTime then
local a6,a7,a8=a3-a5.SpawnTime,aZ(a5.Name)local a9,b,ba,bb=math.max(0,a7-a6),(
math.max(0,a8-a6))if b>0 then if b<=0.4 then ba=Color3.fromRGB(255,60,60)elseif
b<=1 then ba=Color3.fromRGB(255,160,0)else ba=Color3.fromRGB(255,230,80)end bb=
string.format('%s\n\u{1f4a5} HIT IN: %.1fs (\u{23f3} %.1fs)',a5.Name,b,a9)else
ba=Color3.fromRGB(80,255,120)bb=string.format(
'%s\n\u{2705} DETONATED! (\u{23f3} %.1fs)',a5.Name,a9)end a5.TimerLabel.
TextColor3=ba a5.TimerLabel.Text=bb end end end function al.SetShowSkillTimers(
a3)ap=a3 and true or false if not ap then for a4,a5 in pairs(ar)do if a5.
TimerBillboard then pcall(function()a5.TimerBillboard:Destroy()end)a5.
TimerBillboard=nil a5.TimerLabel=nil end end else for a4,a5 in pairs(ar)do if
not a5.TimerBillboard and a5.ActiveParts then local a6={}for a7 in pairs(a5.
ActiveParts)do table.insert(a6,a7)end a5.TimerBillboard,a5.TimerLabel=a_(a4,a6,
a5.Name)end end end end function al.IsShowSkillTimersEnabled()return ap end
function al.SetAutoLearnSkillLifetimes(a3)aq=a3 and true or false end function
al.IsAutoLearnSkillLifetimesEnabled()return aq end al.SaveSkillProfiles=ae.
SaveRecordedData al.LoadSkillProfiles=ae.LoadMapData al.skillTimingManager=ae
return al end function a.o()local aa,ab,ac,ad=game:GetService
'PathfindingService',{},{AgentRadius=1,AgentHeight=5,AgentCanJump=true,
AgentCanClimb=true,AgentMaxSlope=75,WaypointSpacing=4,Costs={Water=20,Lava=20}},
{AgentRadius=0.25,AgentHeight=4,AgentCanJump=true,AgentCanClimb=true,
AgentMaxSlope=90,WaypointSpacing=6,Costs={}}function ab.ComputePathWithCost(ae,
af)for ag,ah in ipairs{ac,ad}do local ai=aa:CreatePath(ah)local aj=pcall(
function()ai:ComputeAsync(ae,af)end)if aj and ai.Status==Enum.PathStatus.Success
then local ak=ai:GetWaypoints()if ak and#ak>0 then local al,am=0,ae for an=1,#ak
do local ao=ak[an].Position al+=(ao-am).Magnitude am=ao end return ai,ak,al end
end pcall(function()ai:Destroy()end)end return nil,nil,math.huge end function ab
.SelectBestTarget(ae,af,ag)local ah,ai,aj,ak,al=(math.huge)for am,an in ipairs(
af)do if ag and ag()then if aj then pcall(function()aj:Destroy()end)end return
nil,nil,nil,nil,math.huge end local ao=an.Root if ao and ao.Parent then local ap
=ao.Position local aq,ar,as=ab.ComputePathWithCost(ae,ap)if ag and ag()then if
aq then pcall(function()aq:Destroy()end)end if aj then pcall(function()aj:
Destroy()end)end return nil,nil,nil,nil,math.huge end if aq and as<ah then if aj
then pcall(function()aj:Destroy()end)end ah=as ai=an aj=aq ak=ar al=ap else if
aq then pcall(function()aq:Destroy()end)end end end end return ai,aj,ak,al,ah
end return ab end function a.p()local aa,ab=a.load'e',a.load'f'local ac,ad=aa.
player,{}function ad.Validate(ae)if not ae then return false end local af=ae.
Model if not af or not af.Parent or af==ac.Character then return false end local
ag=ae.Humanoid if not ag or not ag.Parent then ag=af:FindFirstChildOfClass
'Humanoid'ae.Humanoid=ag end if not ag or ag.Health<=0 then return false end
local ah=ae.Root if not ah or not ah.Parent then ah=af:FindFirstChild
'HumanoidRootPart'or af.PrimaryPart if not ah then for ai,aj in ipairs(af:
GetDescendants())do if aj:IsA'BasePart'then ah=aj break end end end if not ah
then return false end ae.Root=ah end return true end function ad.Scan()local ae,
af={},ab.GetTrackedEnemyData()for ag,ah in ipairs(af)do if ad.Validate(ah)then
table.insert(ae,ah)end end return ae end return ad end function a.q()local aa,ab
,ac,ad,ae,af,ag,ah,ai=a.load'o',a.load'p',{},{},1,6 function ac.GetTarget()
return ag end function ac.GetPathInstance()return ah end function ac.
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
return false end return ac end function a.r()local aa,ab,ac,ad=a.load'e',a.load
'f',a.load'b',a.load'q'local ae,af,ag,ah,ai=aa.player,false,false,{}function ah.
SetDodging(aj)ag=aj and true or false end local aj,ak=function()local aj=ae and
ae.Character local ak=aj and aj:FindFirstChild'HumanoidRootPart'if ak and ak.
Parent then return ak end return nil end,function()local aj=ae and ae.Character
local ak=aj and aj:FindFirstChildOfClass'Humanoid'if ak and ak.Parent then
return ak end return nil end local al=function()local al=ak()if al then if af
and ah.IsTargetActive()then al.AutoRotate=false else al.AutoRotate=true end end
end function ah.GetTargetPosition()local am=ad.GetTarget()if am and am.Root and
am.Root.Parent then local an=am.Humanoid or(am.Model and am.Model:
FindFirstChildOfClass'Humanoid')if an and an.Health>0 then return am.Root.
Position end end local an=aj()local ao,ap=an and an.Position,ab.
GetTrackedEnemyData()if ap and#ap>0 and ao then local aq,ar=(math.huge)for as,at
in ipairs(ap)do if at and at.Root and at.Root.Parent then local au=at.Humanoid
or(at.Model and at.Model:FindFirstChildOfClass'Humanoid')if au and au.Health>0
then local av=(at.Root.Position-ao).Magnitude if av<aq then aq=av ar=at.Root.
Position end end end end return ar end return nil end function ah.IsTargetActive
()return ah.GetTargetPosition()~=nil end local am,an=function()if ai then return
end al()ai=task.spawn(function()while af and ac.IsActive()do if not ag then
local am,an,ao=ah.GetTargetPosition(),aj(),ak()if am then if an and ao and ao.
Health>0 then if ao.AutoRotate~=false then ao.AutoRotate=false end local ap=an.
Position local aq=Vector3.new(am.X,ap.Y,am.Z)local ar=aq-ap if ar.Magnitude>0.5
then local as,at=an.CFrame.LookVector,Vector3.new(ar.X,0,ar.Z).Unit if as:Dot(at
)<0.999 then an.CFrame=CFrame.lookAt(ap,aq)end end end else if ao and ao.Health>
0 and ao.AutoRotate~=true then ao.AutoRotate=true end end end task.wait(0.03)end
ai=nil end)end,function()if ai then task.cancel(ai)ai=nil end local am=ak()if am
then am.AutoRotate=true end end function ah.SetEnabled(ao)af=ao and true or
false if af then am()else an()end end function ah.IsEnabled()return af end ab.
OnRespawn(function()if af then task.defer(function()al()end)end end)ac.Register(
function()an()end)return ah end function a.s()local aa,ab,ac,ad,ae,af=a.load'e',
a.load'f',a.load'm',a.load'n',a.load'r',game:GetService'Workspace'local ag,ah,ai
,aj,ak,al,am,an,ao,ap=aa.player,true,true,0,false,2.6,50 local aq,ar,as,at,au,av
,aw,ax,ay,az,aA,aB,aC,aD,aE,aF,aG,aH,aI=am,{2.5,4.5,7,10.5,15,20,26,33,42,52},{0
,30,-30,60,-60,90,-90,120,-120,150,-150,180},false,0,false,{},false,{}function
ay.IsShowSafeMarkerEnabled()return ah end function ay.SetShowSafeMarker(aJ)ah=aJ
and true or false ay.UpdateMarker(aC,at,au)end function ay.
IsShowPlayerRadarEnabled()return ai end function ay.SetShowPlayerRadar(aJ)ai=aJ
and true or false if not ai then ay.ClearPlayerRadar()else ay.UpdatePlayerRadar(
aE,av)end end function ay.IsShowHitboxVisualEnabled()return ak end function ay.
SetShowHitboxVisual(aJ)ak=aJ and true or false ay.UpdateHitbox(aD)end function
ay.SetHitboxPadding(aJ)ac.SetHitboxPadding(aJ)if ap and ap.Parent then local aK=
math.max(0.4,ac.GetHitboxPadding()*2)ap.Size=Vector3.new(0.15,aK,aK)end end
function ay.GetBoss1ArenaCenter()return az end function ay.GetBoss1ArenaRadius()
return aq or am end local aJ,aK local aL=function()if aJ then pcall(function()aJ
:Destroy()end)aJ=nil end aK=nil end local aM,aN=function(aM,aN)if not aM or not
aM.Parent then aL()return end if aK==aM and aJ and aJ.Parent then return end aL(
)aK=aM pcall(function()local aO=Instance.new'SelectionBox'aO.Name=
'SmartDodge_CrystalGuideBox'local aP=(aN=='green'and Color3.fromRGB(50,255,50))
or(aN=='yellow'and Color3.fromRGB(255,230,0))or Color3.fromRGB(255,45,45)aO.
Color3=aP aO.SurfaceColor3=aP aO.SurfaceTransparency=0.5 aO.LineThickness=0.08
aO.Adornee=aM aO.Parent=aM aJ=aO end)end local aO,aP=function(aO)local aP=aN if
not aP or not aP.Parent then aP=af:FindFirstChild'secondBossCrystals'if not aP
then local aQ=af:FindFirstChild'dungeon'if aQ then aP=aQ:FindFirstChild(
'secondBossCrystals',true)end end if not aP then aP=af:FindFirstChild(
'secondBossCrystals',true)end if aP then aN=aP end end if not aP then return nil
,{}end local aQ,aR,aS={},aO and aO:lower()or''for aT,aU in ipairs(aP:
GetChildren())do local aV,aW=aU.Name:lower(),aU:IsA'BasePart'and aU or aU:
FindFirstChildWhichIsA'BasePart'if aW then if#aR>0 and(aV==aR or aV:find(aR))
then aS=aW else table.insert(aQ,aW)end end end return aS,aQ end local aQ,aR,aS=
function()if aP and aP.Parent then return aP end local aQ=af:FindFirstChild
'FirstPart'if not aQ then local aR=af:FindFirstChild'dungeon'if aR then aQ=aR:
FindFirstChild('FirstPart',true)end end if not aQ then aQ=af:FindFirstChild(
'FirstPart',true)end if aQ and aQ:IsA'BasePart'then aP=aQ return aQ end return
nil end,function()if aA then pcall(function()aA:Destroy()end)aA=nil end aP=nil
aB=nil end,function(aQ,aR,aS)if aB then return aB end local aT if aR then local
aU,aV=ac.GetRawFloorY(aR)if aV and aU then aT=aU+0.1 end end if not aT and aS
then aT=aS.Position.Y-(aS.Size.Y/2)+0.1 end if not aT and aQ then local aU,aV=ac
.GetRawFloorY(aQ)if aV and aU then aT=aU+0.1 end end if aT then aB=aT end return
aB or(aR and(aR.Y-2.8))or(aQ and(aQ.Y-2.8))or 0 end local aT,aU,aV=function(aT,
aU,aV)if not aT then aR()return end local aW,aX=aS(aT,aU,aV),aq or am local aY,
aZ=(aV and aV.Size.X)or(aX*2),CFrame.new(aT.X,aW,aT.Z)*CFrame.Angles(0,0,math.
rad(90))if aA and aA.Parent then if math.abs(aA.Size.Y-aY)>0.5 then aA.Size=
Vector3.new(0.2,aY,aY)end return end pcall(function()local a_=Instance.new'Part'
a_.Name='SmartDodge_Boss1ArenaVisual'a_.Shape=Enum.PartType.Cylinder a_.Size=
Vector3.new(0.2,aY,aY)a_.Color=Color3.fromRGB(0,220,255)a_.Material=Enum.
Material.Neon a_.Transparency=0.88 a_.Anchored=true a_.CanCollide=false a_.
CanTouch=false a_.CanQuery=false local a0=Instance.new'Highlight'a0.Name=
'ArenaOutline'a0.FillColor=Color3.fromRGB(0,180,255)a0.FillTransparency=0.92 a0.
OutlineColor=Color3.fromRGB(0,240,255)a0.OutlineTransparency=0.1 a0.Adornee=a_
a0.Parent=a_ local a1=Instance.new'BillboardGui'a1.Name='ArenaLabel'a1.Size=
UDim2.fromOffset(180,26)a1.StudsOffset=Vector3.new(0,3,0)a1.AlwaysOnTop=true a1.
Adornee=a_ a1.Parent=a_ local a2=Instance.new'TextLabel'a2.Name='Label'a2.Size=
UDim2.fromScale(1,1)a2.BackgroundTransparency=1 a2.TextColor3=Color3.fromRGB(0,
230,255)a2.TextStrokeTransparency=0.2 a2.TextStrokeColor3=Color3.fromRGB(0,0,0)
a2.Font=Enum.Font.GothamBold a2.TextSize=13 a2.Text='BOSS 1 ARENA (Safe Zone)'a2
.Parent=a1 a_.CFrame=aZ a_.Parent=af.Terrain aA=a_ end)end,function(aT,aU)if not
az then return true end local aV,aW=Vector3.new(aT.X,0,aT.Z),Vector3.new(az.X,0,
az.Z)local aX,aY=(aV-aW).Magnitude,aq or am local aZ=aY if aU then local a_=
Vector3.new(aU.X,0,aU.Z)aZ=(a_-aW).Magnitude end local a_=math.max(aY,aZ-0.5)
return aX<=a_ end,function(aT,aU)if not az or not aU then return 0 end local aV=
Vector3.new(az.X,0,az.Z)local aW,aX,aY=(Vector3.new(aU.X,0,aU.Z)-aV).Magnitude,(
Vector3.new(aT.X,0,aT.Z)-aV).Magnitude,aq or am local aZ=aY*0.7 if aW>aZ then if
aX<aW-0.5 then return-2 elseif aX>aW+0.5 then return 3 end end return 0 end ab.
OnBossActiveChanged(function(aW)if not aW then az=nil aq=am aP=nil aN=nil aR()
end end)ab.OnBossIndexChanged(function(aW)aP=nil aN=nil if aW~=1 then az=nil aq=
am aR()end end)function ay.HideVisuals()if ao and ao.Parent then ao.Parent=nil
end if ap and ap.Parent then ap.Parent=nil end ay.ClearPlayerRadar()aR()aL()aC=
nil at=false au=0 aD=nil end function ay.DestroyVisuals()if ao then pcall(
function()ao:Destroy()end)ao=nil end if ap then pcall(function()ap:Destroy()end)
ap=nil end ay.ClearPlayerRadar()for aW,aX in ipairs(aw)do if aX.shaft then
pcall(function()aX.shaft:Destroy()end)end if aX.head then pcall(function()aX.
head:Destroy()end)end end table.clear(aw)aR()aL()end function ay.ResetLock()an=
nil aj=0 aL()end local aW=function()if ap and ap.Parent then return ap end local
aW=Instance.new'Part'aW.Name='SmartDodge_HitboxVisual'aW.Shape=Enum.PartType.
Cylinder local aX=math.max(0.4,ac.GetHitboxPadding()*2)aW.Size=Vector3.new(0.15,
aX,aX)aW.Color=Color3.fromRGB(0,220,255)aW.Material=Enum.Material.Neon aW.
Transparency=0.75 aW.Anchored=true aW.CanCollide=false aW.CanQuery=false aW.
CanTouch=false local aY=Instance.new'SelectionBox'aY.Name='HitboxBorder'aY.
Color3=Color3.fromRGB(120,240,255)aY.SurfaceColor3=Color3.fromRGB(0,220,255)aY.
SurfaceTransparency=0.8 aY.LineThickness=0.04 aY.Adornee=aW aY.Parent=aW ap=aW
return aW end function ay.UpdateHitbox(aX)aD=aX if not ak or not ad.IsEnabled()
or not aX then if ap then ap.Parent=nil end return end local aY,aZ=aW(),math.
max(0.4,ac.GetHitboxPadding()*2)aY.Size=Vector3.new(0.15,aZ,aZ)local a_,a0=ac.
GetFloorPosition(aX)local a1=a0 and(a_.Y-2.8)or(aX.Y-2.8)local a2=Vector3.new(aX
.X,a1,aX.Z)aY.CFrame=CFrame.new(a2)*CFrame.Angles(0,0,math.rad(90))aY.Parent=af.
Terrain end local aX,aY,aZ,a_,a0,a1,a2,a3=24,0.8,15,{2.5,4.5,7,10.5,15,20,26,33,
42,52},Color3.fromRGB(0,255,120),Color3.fromRGB(0,220,255),Color3.fromRGB(255,
200,50),function(aX)local aY=aw[aX]if aY then return aY end local aZ=Instance.
new'Part'aZ.Name='SmartDodge_PlayerShaft_'..aX aZ.Material=Enum.Material.Neon aZ
.Anchored=true aZ.CanCollide=false aZ.CanQuery=false aZ.CanTouch=false aZ.
CastShadow=false aZ.Transparency=0.15 local a_=Instance.new'Part'a_.Name=
'SmartDodge_PlayerHead_'..aX a_.Material=Enum.Material.Neon a_.Anchored=true a_.
CanCollide=false a_.CanQuery=false a_.CanTouch=false a_.CastShadow=false a_.
Transparency=0.15 a_.Size=Vector3.new(0.32,0.04,0.32)aY={shaft=aZ,head=a_}aw[aX]
=aY return aY end function ay.ClearPlayerRadar()for a4,a5 in ipairs(aw)do if a5.
shaft and a5.shaft.Parent then a5.shaft.Parent=nil end if a5.head and a5.head.
Parent then a5.head.Parent=nil end end aF=nil ax=false aG=nil end function ay.
UpdatePlayerRadar(a4,a5)aE,av=a4,a5 or false if not ai or not ad.IsEnabled()or
not a4 then ay.ClearPlayerRadar()return end if not a5 then ax=false aG=nil
return end local a6=not ax or(aH and aH~=aG)if not a6 then return end ax=true aG
=aH aF=a4 for a7,a8 in ipairs(aw)do if a8.shaft and a8.shaft.Parent then a8.
shaft.Parent=nil end if a8.head and a8.head.Parent then a8.head.Parent=nil end
end local a7=aF.Y-2.8 local a8,a9=a7+0.12,360/aX for b=1,aX do local ba=(b-1)*a9
local bb=math.rad(ba)local bc,bd=math.cos(bb),math.sin(bb)local be,bf=(Vector3.
new(bc,0,bd))for bg,bh in ipairs(a_)do local bi=Vector3.new(aF.X+bc*bh,aF.Y,aF.Z
+bd*bh)if not ac.IsPointInAnyHazard(bi)then if not(az and not aU(bi,aF))then bf=
bh break end end end local bg=a3(b)if not bf then if bg.shaft.Parent then bg.
shaft.Parent=nil end if bg.head.Parent then bg.head.Parent=nil end continue end
local bh,bi=bf,(bf>aZ)local bj=math.max(0.4,bh-aY)local bk,bl,bm,bn,bo=aY+(bj/2)
,aY+bj+0.16,bi and a1 or a0,(bf<=3.5)and a0 or a2,bi and Vector3.new(0.42,0.05,
0.42)or Vector3.new(0.32,0.04,0.32)bg.shaft.Size=Vector3.new(bi and 0.15 or 0.12
,0.04,bj)local bp=Vector3.new(aF.X+bc*bk,a8,aF.Z+bd*bk)bg.shaft.CFrame=CFrame.
lookAt(bp,bp+be)bg.shaft.Color=bn bg.shaft.Parent=af.Terrain bg.head.Size=bo
local bq=Vector3.new(aF.X+bc*bl,a8,aF.Z+bd*bl)bg.head.CFrame=CFrame.lookAt(bq,bq
+be)*CFrame.Angles(0,math.rad(45),0)bg.head.Color=bm bg.head.Parent=af.Terrain
end end local a4,a5,a6=function()if ao and ao.Parent then return ao end local a4
=Instance.new'Part'a4.Name='SmartDodge_SafeMarker'a4.Shape=Enum.PartType.Ball a4
.Size=Vector3.new(1.5,1.5,1.5)a4.Color=Color3.fromRGB(0,255,120)a4.Material=Enum
.Material.Neon a4.Transparency=0.2 a4.Anchored=true a4.CanCollide=false a4.
CanQuery=false a4.CanTouch=false local a5=Instance.new'BillboardGui'a5.Name=
'MarkerGui'a5.Size=UDim2.fromOffset(130,24)a5.StudsOffset=Vector3.new(0,1.5,0)a5
.AlwaysOnTop=true a5.Adornee=a4 a5.Parent=a4 local a6=Instance.new'TextLabel'a6.
Name='Label'a6.Size=UDim2.fromScale(1,1)a6.BackgroundTransparency=1 a6.
TextColor3=Color3.fromRGB(80,255,160)a6.TextStrokeTransparency=0 a6.
TextStrokeColor3=Color3.fromRGB(0,0,0)a6.Font=Enum.Font.GothamBold a6.TextSize=
12 a6.Text='\u{1f7e2} SAFE SPOT'a6.Parent=a5 ao=a4 return a4 end,(-1)function ay
.UpdateMarker(a7,a8,a9)aC,at,au=a7,a8 or false,a9 or 0 if not ah or not a8 or
not a7 then if ao then ao.Parent=nil end a6=nil a5=-1 return end local b,ba=a4()
,a7.Y-2.2 local bb=Vector3.new(a7.X,ba,a7.Z)if not a6 or(bb-a6).Magnitude>0.1
then a6=bb b.CFrame=CFrame.new(bb)end if not b.Parent then b.Parent=af.Terrain
end local bc=a9 or 0 if math.abs(bc-a5)>=0.2 then a5=bc local bd=b:
FindFirstChild'MarkerGui'local be=bd and bd:FindFirstChild'Label'if be then be.
Text=('\u{1f7e2} SAFE SPOT (%.1fm)'):format(bc)end end end local a7,a8,a9,b=3,
function(a7,a8)if a8 and a8.Parent and a8:IsA'BasePart'then local a9,b=a7.X-a8.
Position.X,a7.Z-a8.Position.Z local ba=a9*a9+b*b if ba>0.04 then local bb=math.
sqrt(ba)return Vector3.new(a9/bb,0,b/bb)end end local a9,b,ba=0,0,ad.
GetActiveHazardsMap and ad.GetActiveHazardsMap()if ba then local bb=0 for bc,bd
in pairs(ba)do local be if bd.ActiveParts then for bf in pairs(bd.ActiveParts)do
if bf and bf.Parent and bf:IsA'BasePart'then be=bf.Position break end end end if
not be and bd.Instance and bd.Instance.Parent then if bd.Instance:IsA'BasePart'
then be=bd.Instance.Position end end be=be or bd.Position if be then local bf,bg
=a7.X-be.X,a7.Z-be.Z local bh=bf*bf+bg*bg if bh<1600 and bh>0.01 then local bi=
math.sqrt(bh)local bj=1/math.max(1,bi)a9=a9+(bf/bi)*bj b=b+(bg/bi)*bj bb=bb+1
end end end local bc=a9*a9+b*b if bb>0 and bc>0.001 then local bd=math.sqrt(bc)
return Vector3.new(a9/bd,0,b/bd)end end if ae then local bb=ae.
GetTargetPosition()if bb then local bc,bd=a7.X-bb.X,a7.Z-bb.Z local be=bc*bc+bd*
bd if be>0.01 then local bf=math.sqrt(be)return Vector3.new(bc/bf,0,bd/bf)end
end end return nil end,function(a7,a8)local a9=0 if a8 then a9=math.deg(math.
atan2(a8.Z,a8.X))elseif a7 then a9=math.deg(math.atan2(a7.Z,a7.X))end local b=
table.create(12)for ba,bb in ipairs(as)do b[ba]=(a9+bb)%360 end return b end,{
Vector3.new(2.5,0,0),Vector3.new(-2.5,0,0),Vector3.new(0,0,2.5),Vector3.new(0,0,
-2.5)}local ba=function(ba)local bb=0 for bc,bd in ipairs(b)do if not ac.
IsPointInAnyHazard(ba+bd)then bb=bb+1 end end return bb*0.75 end local bb=
function(bb,bc,bd,be)if az and not aU(bc,bb)then return math.huge end local bf=
ad.GetActiveBossOrb and ad.GetActiveBossOrb()if bf and bf.Position then local bg
=(Vector3.new(bc.X-bf.Position.X,0,bc.Z-bf.Position.Z)).Magnitude if bg<12 then
return math.huge end end local bg,bh=(bc-bb).Magnitude,ba(bc)local bi=(bg*2)-(bh
*0.35)if bg>12 then bi=bi+((bg-12)*3.5)end local bj=ae and ae.GetTargetPosition
and ae.GetTargetPosition()if bj and bg>0.3 then local bk=Vector3.new(bj.X-bb.X,0
,bj.Z-bb.Z)if bk.Magnitude>1 then local bl=bk.Unit local bm,bn=Vector3.new(-bl.Z
,0,bl.X),Vector3.new(bc.X-bb.X,0,bc.Z-bb.Z)local bo,bp=bn:Dot(bl),math.abs(bn.
Unit:Dot(bm))if bp>=0.82 and math.abs(bo)<=2.2 then bi=bi-6 end if bo<-2 then bi
=bi+(math.abs(bo)*1.8)end if bo>2.5 then bi=bi+(bo*1.2)end end end if bg>0.5
then local bk=(bc-bb).Unit if be then local bl=bk:Dot(be)if bl>0 then bi=bi-(bl*
3.5)else bi=bi+(math.abs(bl)*2)end elseif bd and not bj then local bl=bk:Dot(bd)
bi=bi-(bl*2)end end if az then bi=bi+aV(bc,bb)end return bi end local bc=
function(bc,bd,be,bf,bg)local bh,bi,bj,bk,bl=a9(bd,bg),math.huge,(math.huge)for
bm,bn in ipairs(ar)do local bo,bp=(math.huge)for bq,br in ipairs(bh)do local bs=
math.rad(br)local bt=Vector3.new(math.cos(bs)*bn,0,math.sin(bs)*bn)local bu=bc+
bt if ac.IsSpotFullySafe(bu,0.5)then local bv=bb(bc,bu,bd,bg)if bv<bj then bj=bv
bl=bu end if ac.IsPathSafe(bc,bu,be,bf)then if bv<bo then bo=bv bp=bu end end
end end if bp then bk=bp bi=bo break end end local bm,bn=bk or bl,bk and bi or
bj if bm then local bo,bp=ac.GetFloorPosition(bm)local bq=bp and bo or bm return
bq,bn end return nil,math.huge end function ay.CalculateSafeSpot(bd)local be,bf=
ag and ag.Character and ag.Character:FindFirstChild'HumanoidRootPart',ag and ag.
Character and ag.Character:FindFirstChildOfClass'Humanoid'local bg=bd or(be and
be.Position)if not bg then an=nil aj=0 aL()return false,nil,nil,0 end local bh=
ab.IsBossActive()and ab.GetCurrentBossIndex()==1 if bh then local bi=aQ()if bi
then local bj=bi.Position local bk=aS(bj,bg,bi)az=Vector3.new(bj.X,bk,bj.Z)local
bl=math.max(bi.Size.X,bi.Size.Z)/2 aq=math.max(20,bl-2.5)aT(az,bg,bi)elseif not
az then local bj=ae.GetTargetPosition()if not bj then local bk=ab.
GetTrackedEnemyData()if bk and#bk>0 and bk[1].Root and bk[1].Root.Parent then bj
=bk[1].Root.Position end end if bj then local bk=aS(bj,bg,nil)az=Vector3.new(bj.
X,bk,bj.Z)aq=am aT(az,bg,nil)end elseif az then aT(az,bg,nil)end else if az then
az=nil aq=am aR()end end if ab.GetEnemyCount()==0 and not ab.IsBossActive()then
an=nil aj=0 aL()return false,nil,nil,0 end if not ab.IsBossActive()then local bi
,bj=ab.GetTrackedEnemyData(),false if bi and#bi>0 then for bk,bl in ipairs(bi)do
if bl and bl.Root and bl.Root.Parent then local bm=bl.Humanoid or(bl.Model and
bl.Model:FindFirstChildOfClass'Humanoid')if bm and bm.Health>0 then if(bl.Root.
Position-bg).Magnitude<=85 then bj=true break end end end end end if not bj then
an=nil aj=0 aL()return false,nil,nil,0 end end local bi,bj=ad.GetActiveBossOrb()
if bi and bj then local bk=aO(bj)if bk then aM(bk,bj)end else aL()end local bk,
bl=math.huge,false if bi and bi.Position then bk=(Vector3.new(bi.Position.X-bg.X
,0,bi.Position.Z-bg.Z)).Magnitude if bk<16 then bl=true end end local bm=(not bl
)and bi or nil local bn,bo,bp,bq=ac.IsPointInAnyHazard(bg,bm)if not bn and bl
then bn=true bp=bi bo={Name=('%s Orb (Maintain Safe Distance)'):format(bj and bj
:upper()or'BOSS')}local br=(bg-bi.Position)local bs=(br.Magnitude>0.1)and
Vector3.new(br.X,0,br.Z).Unit or Vector3.new(0,0,1)bq={isTrajectory=true,
isDynamicMoving=true,isBossOrb=true,perpDist=0,dangerRadius=6,forward2D=bs,
originPos=bi.Position,maxLookahead=25}end if not bn or not bp then if bi and bj
then local br,bs=aO(bj)if br then local bt,bu=false,ad.GetActiveHazards and ad.
GetActiveHazards()if bu and#bu>0 then for bv,bw in ipairs(bu)do local bx=bw.
Instance if bx and bx~=bi and bx~=(bi and bi.Parent)then if not ac.
IsSpotFullySafe(bg,4.5,bi)then bt=true break end end end end if bt then if bk<28
and bi and bi.Position then local bv=(bg-bi.Position)local bw=(bv.Magnitude>0.1)
and Vector3.new(bv.X,0,bv.Z).Unit or Vector3.new(0,0,1)local bx,by,bz,bA,bB=
Vector3.new(-bw.Z,0,bw.X),{6,10,15,20,26,32},{0,2,-2,4,-4},(-math.huge)for bC,bD
in ipairs(by)do for bE,bF in ipairs(bz)do local bG=bg+bw*bD+bx*bF if ac.
IsSpotFullySafe(bG,0.5,bi)then if ac.IsPathSafe(bg,bG,nil,nil,bi)then local bH=(
Vector3.new(bG.X-bi.Position.X,0,bG.Z-bi.Position.Z)).Magnitude if bH>bA then bA
=bH bB=bG end end end end end if bB then local bC,bD=ac.GetFloorPosition(bB)
local bE=bD and bC or bB an=bE aj=1 return true,bE,(
'Kiting along corridor away from %s'):format(bj:upper()),(bE-bg).Magnitude end
end if bk>=28 then an=bg aj=1 return true,bg,(
'Waiting for nearby AoE to explode before leading %s'):format(bj:upper()),0 end
end local bv,bw=bi.Position,br.Position local bx=Vector3.new(bw.X-bv.X,0,bw.Z-bv
.Z)if bx.Magnitude>0.5 then bx=bx.Unit else bx=Vector3.new(0,0,1)end local by,bz
=bw+bx*3.8,Vector3.new(bw.X-bg.X,0,bw.Z-bg.Z)local bA,bB=bz.Magnitude,Vector3.
new(bv.X-bg.X,0,bv.Z-bg.Z)local bC,bD=bB.Magnitude,by if bA>8 and bC<bA and bC<
25 then local bE,bF=bz.Unit,bB.Unit local bG=bE:Dot(bF)if bG>0.75 then local bH=
Vector3.new(-bE.Z,0,bE.X)local bI,bJ=bg+(bE*0.6+bH*0.8).Unit*12,bg+(bE*0.6-bH*
0.8).Unit*12 if(bI-bv).Magnitude>(bJ-bv).Magnitude then bD=bI else bD=bJ end end
end for bE,bF in ipairs(bs)do local bG=bF.Position local bH=Vector3.new(bD.X-bG.
X,0,bD.Z-bG.Z)if bH.Magnitude<10 and bH.Magnitude>0.1 then bD=bD+bH.Unit*(10-bH.
Magnitude)end end local bE,bF=ac.GetFloorPosition(bD)local bG=bF and bE or bD if
not ac.IsSpotFullySafe(bG,0.5,bi)then local bH={30,-30,45,-45,60,-60,90,-90,120,
-120}for bI,bJ in ipairs(bH)do local bK=math.rad(bJ)local bL,bM=math.cos(bK),
math.sin(bK)local bN=Vector3.new(bx.X*bL-bx.Z*bM,0,bx.X*bM+bx.Z*bL)local bO=bw+
bN*4 if ac.IsSpotFullySafe(bO,0.5,bi)then local bP,bQ=ac.GetFloorPosition(bO)bG=
bQ and bP or bO break end end end local bH=ac.IsPathSafe(bg,bG,nil,nil,bi)if not
bH then local bI=Vector3.new(bG.X-bg.X,0,bG.Z-bg.Z)local bJ=bI.Magnitude local
bK=bJ>1 and bI.Unit or Vector3.new(0,0,1)local bL,bM,bN,bO=Vector3.new(-bK.Z,0,
bK.X),{},{6,10,15,20},{8,-8,12,-12,16,-16,20,-20}for bP,bQ in ipairs(bN)do if bQ
<bJ then for bR,bS in ipairs(bO)do local bT=bg+bK*bQ+bL*bS table.insert(bM,bT)
end end end local bP,bQ=(math.huge)for bR,bS in ipairs(bM)do if ac.
IsSpotFullySafe(bS,0.5,bi)then if ac.IsPathSafe(bg,bS,nil,nil,bi)then local bT=
true for bU,bV in ipairs(bs)do if(bS-bV.Position).Magnitude<10 then bT=false
break end end if bT then local bU=(bS-bG).Magnitude if bU<bP then bP=bU bQ=bS
end end end end end if bQ then local bR,bS=ac.GetFloorPosition(bQ)local bT=bS
and bR or bQ an=bT aj=1 return true,bT,('Detour around skill -> %s Crystal'):
format(bj:upper()),(bT-bg).Magnitude else if bi and bi.Position and bC<28 then
local bR=(bg-bi.Position)local bS=(bR.Magnitude>0.1)and Vector3.new(bR.X,0,bR.Z)
.Unit or Vector3.new(0,0,1)local bT,bU,bV,bW,bX=Vector3.new(-bS.Z,0,bS.X),{6,10,
15,20,26,32},{0,2,-2,4,-4},(-math.huge)for bY,bZ in ipairs(bU)do for b_,b1 in
ipairs(bV)do local b3=bg+bS*bZ+bT*b1 if ac.IsSpotFullySafe(b3,0.5,bi)then if ac.
IsPathSafe(bg,b3,nil,nil,bi)then local b5=(Vector3.new(b3.X-bi.Position.X,0,b3.Z
-bi.Position.Z)).Magnitude if b5>bW then bW=b5 bX=b3 end end end end end if bX
then local bY,bZ=ac.GetFloorPosition(bX)local b_=bZ and bY or bX an=b_ aj=1
return true,b_,('Kiting along corridor away from %s'):format(bj:upper()),(b_-bg)
.Magnitude end end an=bg aj=1 return true,bg,(
'Waiting for path to clear -> %s Crystal'):format(bj:upper()),0 end end local bI
=(bG-bg).Magnitude an=bG aj=1 return true,bG,('Lead %s -> %s Crystal'):format(bi
.Name,bj:upper()),bI end end an=nil aj=0 aL()return false,nil,nil,0 end local br
,bs=bo.Name or'Unknown'if bf and bf.MoveDirection.Magnitude>0.1 then bs=Vector3.
new(bf.MoveDirection.X,0,bf.MoveDirection.Z).Unit elseif be then local bt=be.
AssemblyLinearVelocity local bu=Vector3.new(bt.X,0,bt.Z)if bu.Magnitude>1.5 then
bs=bu.Unit end end local bt,bu=ac.GetAllHazardsAtPoint(bg)aH=bp aI=bt local bv,
bw=false,math.huge if an and ac.IsSpotFullySafe(an,0.5)then local bx=not(az and
not aU(an,bg))if bx then bw=(an-bg).Magnitude if bw<=45 and ac.IsPathSafe(bg,an,
bt,bp)then bv=true if bi and bi.Position then local by=(Vector3.new(an.X-bi.
Position.X,0,an.Z-bi.Position.Z)).Magnitude if by<18 and bk<24 then bv=false
elseif bw<=1.5 and bk<24 then bv=false end end if bv and bw<=6.5 then local by=
math.floor(bw*10)/10 return true,an,br,by end end end end if not bv then an=nil
aj=bu end local bx,by,bz=br:lower():find'multiring'~=nil or(bo.Instance and bo.
Instance.Name:lower():find'multiring'~=nil),(a8(bg,bp))if bx then local bA,bB,bC
,bD,bE,bF=ac.IsPointInRingPart(bg,bp)local bG={}if bA and bE and bB and bB>0.1
then local bH,bI=bg.X-bE.X,bg.Z-bE.Z local bJ,bK=bH/bB,bI/bB if bC and bC>2 then
local bL=Vector3.new(bE.X+bJ*(bC-2.5),bg.Y,bE.Z+bK*(bC-2.5))table.insert(bG,bL)
end if bD then local bL=Vector3.new(bE.X+bJ*(bD+2.5),bg.Y,bE.Z+bK*(bD+2.5))table
.insert(bG,bL)end local bL=Vector3.new(bE.X-bH,bg.Y,bE.Z-bI)table.insert(bG,bL)
end local bH,bI={3.5,7,12,18,26,35},{0,45,90,135,180,225,270,315}for bJ,bK in
ipairs(bH)do for bL,bM in ipairs(bI)do local bN=math.rad(bM)local bO=Vector3.
new(math.cos(bN)*bK,0,math.sin(bN)*bK)table.insert(bG,bg+bO)end end local bJ,bK,
bL,bM=math.huge,(math.huge)for bN,bO in ipairs(bG)do if az and not aU(bO,bg)then
continue end if bi and bi.Position then local bP=(Vector3.new(bO.X-bi.Position.X
,0,bO.Z-bi.Position.Z)).Magnitude if bP<12 then continue end end if ac.
IsSpotFullySafe(bO,0.5)then local bP=(bO-bg).Magnitude local bQ=bP-ba(bO)if bQ<
bK then bK=bQ bM=bO end if ac.IsPathSafe(bg,bO,bt,bp)then if bQ<bJ then bJ=bQ bL
=bO end end end end local bN=bL or bM if bN then local bO,bP=ac.
GetFloorPosition(bN)if bP and ac.IsSpotFullySafe(bO,0.5)then if not(az and not
aU(bO,bg))then bz=bO else bz=bN end else bz=bN end end elseif bq and bq.
isTrajectory then local bA,bB,bC=bq.forward2D,bq.perpDist,bq.dangerRadius local
bD,bE,bF,bG,bH,bI=math.max(3.5,(bC-bB)+al),Vector3.new(bA.Z,0,-bA.X),Vector3.
new(-bA.Z,0,bA.X),br:lower():find'movingbeam'~=nil or(bp and bp.Name:lower():
find'movingbeam'~=nil),(bq and bq.isBossOrb)or(br:lower():find'orb'~=nil)or(bp
and bp.Name:lower():find'orb'~=nil),{}if bH then local bJ,bK={6,10,15,20,26,32},
{0,2,-2,4.5,-4.5,7,-7}for bL,bM in ipairs(bJ)do for bN,bO in ipairs(bK)do local
bP=bg+bA*bM+bE*bO table.insert(bI,bP)end end elseif bG then local bJ={0,-3,-6,-
10}for bK,bL in ipairs(bJ)do local bM=bA*bL table.insert(bI,bg+bE*bD+bM)table.
insert(bI,bg+bF*bD+bM)table.insert(bI,bg+bE*(bD+2.5)+bM)table.insert(bI,bg+bF*(
bD+2.5)+bM)end if bp and bp.Parent then local bK=Vector3.new(bp.Position.X,bg.Y,
bp.Position.Z)table.insert(bI,bK-bA*7)table.insert(bI,bK-bA*11)table.insert(bI,
bK-bA*7+bE*5)table.insert(bI,bK-bA*7+bF*5)end table.insert(bI,bg-bA*(al+4))table
.insert(bI,bg-bA*(al+8))table.insert(bI,bg-bA*(al+12))else local bJ={bD,bD+2,bD+
4}for bK,bL in ipairs(bJ)do table.insert(bI,bg+bE*bL)table.insert(bI,bg+bF*bL)
end local bK={-1.5,1.5,-3}for bL,bM in ipairs(bK)do local bN=bA*bM table.insert(
bI,bg+bE*bD+bN)table.insert(bI,bg+bF*bD+bN)end end local bJ,bK,bL,bM=math.huge,(
math.huge)for bN,bO in ipairs(bI)do if az and not aU(bO,bg)then continue end if
not bH and bi and bi.Position then local bP=(Vector3.new(bO.X-bi.Position.X,0,bO
.Z-bi.Position.Z)).Magnitude if bP<12 then continue end end local bP=bO-bg if bP
.Magnitude>0.5 then local bQ=bP.Unit:Dot(bA)if bH then if bQ<-0.25 then continue
end else if bQ>0.25 then continue end end end if ac.IsSpotFullySafe(bO,0.5)then
local bQ,bR=bP.Magnitude,ba(bO)local bS,bT=(bQ*1.6)-(bR*0.3),bP.Magnitude>0.5
and bP.Unit:Dot(bA)or 0 if bH then if bi and bi.Position then local bU=(Vector3.
new(bO.X-bi.Position.X,0,bO.Z-bi.Position.Z)).Magnitude if bU<15 then bS=bS+(15-
bU)*10 else bS=bS-math.min(25,(bU-15)*2)end end local bU=bP.Magnitude>0.5 and
math.abs(bP.Unit:Dot(bE))or 0 if bU>=0.65 then bS=bS-8 end elseif bG and bT<-0.2
then bS=bS-15 elseif not bG then local bU=bP.Magnitude>0.5 and math.abs(bP.Unit:
Dot(bE))or 0 if bU>=0.9 then bS=bS-12 elseif bU<0.8 then bS=bS+4 end end if az
then bS=bS+aV(bO,bg)end if bs and bQ>0.5 then local bU=bP.Unit:Dot(bs)if bU>0.15
then bS=bS-(bU*5)elseif bU<-0.15 then bS=bS+(math.abs(bU)*6)end end if an then
local bU=(bO-an).Magnitude if bU<3 then bS=bS-8 end end if bS<bK then bK=bS bM=
bO end if ac.IsPathSafe(bg,bO,bt,bp)then if bS<bJ then bJ=bS bL=bO end end end
end if not bL then local bN,bO,bP=math.deg(math.atan2(bA.Z,bA.X)),bG and{90,-90,
120,-120,150,-150,180}or bH and{0,15,-15,30,-30,45,-45,60,-60}or{90,-90,75,-75,
105,-105,60,-60,120,-120},{4,7,11,16,22}for bQ,bR in ipairs(bP)do for bS,bT in
ipairs(bO)do local bU=math.rad(bN+bT)local bV=bg+Vector3.new(math.cos(bU)*bR,0,
math.sin(bU)*bR)if az and not aU(bV,bg)then continue end if ac.IsSpotFullySafe(
bV,0.5)then if ac.IsPathSafe(bg,bV,bt,bp)then bL=bV break end end end if bL then
break end end end local bN=bL or bM if bN then local bO,bP=ac.GetFloorPosition(
bN)if bP and ac.IsSpotFullySafe(bO,0.5)then if not(az and not aU(bO,bg))then bz=
bO else bz=bN end else bz=bN end end else local bA,bB,bC,bD=math.huge,(math.huge
)if bp and bp.Parent and bp:IsA'BasePart'then local bE={}if bp:IsA'Part'and(bp.
Shape==Enum.PartType.Ball or bp.Shape==Enum.PartType.Cylinder)then local bF=math
.max(bp.Size.X,bp.Size.Z)/2 local bG,bH=bF+al,Vector3.new(bg.X-bp.Position.X,0,
bg.Z-bp.Position.Z)local bI=bH.Magnitude local bJ=bI>0.1 and(bH/bI)or(bs or(by
or Vector3.new(0,0,1)))local bK=math.atan2(bJ.Z,bJ.X)table.insert(bE,bp.Position
+bJ*bG)local bL={math.rad(20),-math.rad(20),math.rad(40),-math.rad(40),math.rad(
65),-math.rad(65)}for bM,bN in ipairs(bL)do local bO=bK+bN table.insert(bE,bp.
Position+Vector3.new(math.cos(bO)*bG,0,math.sin(bO)*bG))end elseif bp.Name:
lower():find'movingbeam'or(bp.Parent and bp.Parent.Name:lower():find'movingbeam'
)then local bF=bp.CFrame.RightVector local bG=Vector3.new(bF.X,0,bF.Z)if bG.
Magnitude>0.001 then bG=bG.Unit else bG=Vector3.new(1,0,0)end local bH,bI,bJ=
Vector3.new(-bG.Z,0,bG.X),math.max(bp.Size.X,bp.Size.Z)/2,math.max(bp.Size.Y,
math.min(bp.Size.X,bp.Size.Z))/2 if bJ<3.5 then bJ=3.5 end table.insert(bE,bp.
Position+bG*(bI+al+1))table.insert(bE,bp.Position-bG*(bI+al+1))table.insert(bE,
bp.Position+bH*(bJ+al+1.5))table.insert(bE,bp.Position-bH*(bJ+al+1.5))else local
bF,bG,bH=bp.CFrame:PointToObjectSpace(bg),bp.Size.X/2,bp.Size.Z/2 if bH>=bG*1.4
then table.insert(bE,bp.CFrame:PointToWorldSpace(Vector3.new(bG+al,bF.Y,bF.Z)))
table.insert(bE,bp.CFrame:PointToWorldSpace(Vector3.new(-(bG+al),bF.Y,bF.Z)))
table.insert(bE,bp.CFrame:PointToWorldSpace(Vector3.new(bG+al+2,bF.Y,bF.Z)))
table.insert(bE,bp.CFrame:PointToWorldSpace(Vector3.new(-(bG+al+2),bF.Y,bF.Z)))
elseif bG>=bH*1.4 then table.insert(bE,bp.CFrame:PointToWorldSpace(Vector3.new(
bF.X,bF.Y,bH+al)))table.insert(bE,bp.CFrame:PointToWorldSpace(Vector3.new(bF.X,
bF.Y,-(bH+al))))table.insert(bE,bp.CFrame:PointToWorldSpace(Vector3.new(bF.X,bF.
Y,bH+al+2)))table.insert(bE,bp.CFrame:PointToWorldSpace(Vector3.new(bF.X,bF.Y,-(
bH+al+2))))else table.insert(bE,bp.CFrame:PointToWorldSpace(Vector3.new(bG+al,bF
.Y,bF.Z)))table.insert(bE,bp.CFrame:PointToWorldSpace(Vector3.new(-(bG+al),bF.Y,
bF.Z)))table.insert(bE,bp.CFrame:PointToWorldSpace(Vector3.new(bF.X,bF.Y,bH+al))
)table.insert(bE,bp.CFrame:PointToWorldSpace(Vector3.new(bF.X,bF.Y,-(bH+al))))
end end for bF,bG in ipairs(bE)do if az and not aU(bG,bg)then continue end if ac
.IsSpotFullySafe(bG,0.5)then local bH=bb(bg,bG,by,bs)if bH<bB then bB=bH bD=bG
end if ac.IsPathSafe(bg,bG,bt,bp)then if bH<bA then bA=bH bC=bG end end end end
end if not bC then local bE,bF=bc(bg,by,bt,bp,bs)if bE and bF<bA then bC=bE bA=
bF end end local bE=bC or bD if bE then local bF,bG=ac.GetFloorPosition(bE)if bG
and ac.IsSpotFullySafe(bF,0.5)then if not(az and not aU(bF,bg))then bz=bF else
bz=bE end else bz=bE end end if not bz then local bF=(by and by.Magnitude>0.01)
and by.Unit or(bs and bs.Magnitude>0.01 and bs.Unit)or Vector3.new(0,0,1)local
bG=bg+(bF*18)if az and not aU(bG,bg)then bG=bg+(az-bg).Unit*15 end local bH,bI=
ac.GetFloorPosition(bG)bz=bI and bH or bG end end if bz then if bv then local bA
=(bz-bg).Magnitude if(bw-bA)>=a7 then an=bz aj=bu local bB=math.floor(bA*10)/10
return true,bz,br,bB else local bB=math.floor(bw*10)/10 return true,an,br,bB end
end an=bz aj=bu local bA=math.floor((bz-bg).Magnitude*10)/10 return true,bz,br,
bA elseif bv then local bA=math.floor(bw*10)/10 return true,an,br,bA end an=nil
aj=0 return true,nil,br,0 end return ay end function a.t()local aa,ab,ac=a.load
'e',a.load'f',a.load'r'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar=aa.
RunService,aa.player,false,'HumanoidMove',1,1,true,false,true,24,1.5,5,0,{},(
RaycastParams.new())ar.FilterType=Enum.RaycastFilterType.Exclude ar.IgnoreWater=
true local as,at,au=function()local as={}for at,au in ipairs(game:GetService
'Players':GetPlayers())do if au.Character then table.insert(as,au.Character)end
end if workspace:FindFirstChild'RaycastIgnore'then table.insert(as,workspace.
RaycastIgnore)end ar.FilterDescendantsInstances=as end,{}function at.SetRuntime(
av)au=av or nil end local av,aw,ax,ay=function()return au and au.getInDanger and
au.getInDanger()or false end,function()return au and au.getLogInDanger and au.
getLogInDanger()or false end,function()return au and au.getActiveBossOrb and au.
getActiveBossOrb()end,function(av)for aw,ax in ipairs(aq)do pcall(ax,av)end end
at.FireStatus=ay local az,aA,aB,aC=function()if faceTargetProvider then local az
,aA=pcall(faceTargetProvider)if az and type(aA)=='table'and aA.X and aA.Z then
return aA end end if ac then local az=ac.GetTargetPosition()if az then return az
end end return nil end,function()local az=ae and ae.Character if not az then
return nil,nil,nil end local aA,aB=az:FindFirstChild'HumanoidRootPart',az:
FindFirstChild'Humanoid'if not aA or not aB then return az,nil,nil end return az
,aA,aB end,function(az,aA)if not az or not aA then return math.huge end local aB
,aC=az.X-aA.X,az.Z-aA.Z return math.sqrt(aB*aB+aC*aC)end,function(az,aA)if not
az or not aA then return nil end return Vector3.new(aA.X,az.Position.Y,aA.Z)end
local aD,aE=function(aD,aE,aF,aG)if not aD or not aF then return end local aH=aG
or aF.Y if not aj and aE and aE.HipHeight and aD then local aI,aJ,aK=aE.
HipHeight+(aD.Size.Y/2),Vector3.new(aF.X,(aG or aD.Position.Y)+6,aF.Z),Vector3.
new(0,-20,0)local aL=workspace:Raycast(aJ,aK,ar)if aL and aL.Position then aH=aL
.Position.Y+aI else local aM=aF.Y-3 aH=aM+aI end end local aI,aJ=Vector3.new(aF.
X,aH,aF.Z),az()if aJ then aD.CFrame=CFrame.lookAt(aI,Vector3.new(aJ.X,aH,aJ.Z))
else local aK=aD.CFrame.LookVector local aL=Vector3.new(aK.X,0,aK.Z)if aL.
Magnitude>0.001 then aL=aL.Unit aD.CFrame=CFrame.lookAt(aI,aI+aL)else aD.CFrame=
CFrame.new(aI)end end aD.AssemblyLinearVelocity=Vector3.zero aD.
AssemblyAngularVelocity=Vector3.zero end,function(aD,aE,aF,aG,aH)if not al then
return end if ag~='HumanoidMove'and ag~='MoveTo'then return end if not aG or not
aG.Parent then return end local aI,aJ=aH and aH.WalkSpeed or 0,aG.
AssemblyLinearVelocity local aK=aJ and Vector3.new(aJ.X,0,aJ.Z).Magnitude or 0
if aI>=(am-0.5)or aK>=(am-1)then return end local aL=os.clock()if(aL-ap)<ao then
return end local aM,aN,aO=false,aE or(aD and(Vector3.new(aD.X-aG.Position.X,0,aD
.Z-aG.Position.Z).Magnitude))or 0 if aN>=10 then aM=true aO=(
'Long escape distance (%.1f studs)'):format(aN)end if not aM and aF then local
aP=aF:lower()if aP:find'emergency'or aP:find'kiting'or aP:find'waiting for path'
or aP:find'lead'then aM=true aO=('Hazard threat (%s)'):format(aF)end end if not
aM then local aP=ax()local aQ=aP and(aP.Position and aP or aP.Instance)local aR=
aQ and aQ.Position if aR then local aS=(Vector3.new(aR.X-aG.Position.X,0,aR.Z-aG
.Position.Z)).Magnitude if aS<15 then aM=true aO=(
'Boss Orb closing in (%.1f studs)'):format(aS)end end end if aM then ap=aL if ab
.TriggerPanicSpeed then ab.TriggerPanicSpeed(am,an)end if aw()then print((
'[SmartDodge][Panic] \u{1f4a8} PANIC SPRINT ACTIVATED! WalkSpeed boosted to %d for %.1fs (Reason: %s)'
):format(am,an,aO or'Emergency'))end end end function at.Perform(aF,aG,aH)if ab.
IsInvulnerable and ab.IsInvulnerable()then return end local aI,aJ,aK=aA()if not
aJ or not aK or aK.Health<=0 then return end if not aF then return end
currentTargetPos=aF aE(aF,aG,aH,aJ,aK)if ak then return end dodgeThread=task.
spawn(function()ak=true ac.SetDodging(true)ay'Dodging'local aL,aM=(aJ.Position.Y
)local aN=function()if aM and aM.Parent then pcall(function()aM:Destroy()end)aM=
nil end if aK and aK.Parent then local aN=ac and ac.IsEnabled and ac.IsEnabled()
and ac.IsTargetActive and ac.IsTargetActive()if aN then aK.AutoRotate=false else
aK.AutoRotate=true end end end local aO=function()aN()if activeMoveConn then
pcall(function()activeMoveConn:Disconnect()end)activeMoveConn=nil end if aJ and
aJ.Parent then aJ.AssemblyLinearVelocity=Vector3.zero aJ.AssemblyAngularVelocity
=Vector3.zero end if aK and aK.Parent and ag=='HumanoidMove'then pcall(function(
)aK:Move(Vector3.zero,false)local aO=ae and ae.Character and ae.Character:
FindFirstChild'HumanoidRootPart'if aO then aK:MoveTo(aO.Position)end end)end if
ab.CancelPanicSpeed then ab.CancelPanicSpeed()end ak=false ac.SetDodging(false)
currentTargetPos=nil ay'Safe'end local aP,aQ=pcall(function()local aP,aQ=
currentTargetPos or aF,aJ.Position local aR,aS=(Vector3.new(aP.X,0,aP.Z)-Vector3
.new(aQ.X,0,aQ.Z)).Magnitude,(ag=='Blink')and math.min(ah,ai)or ah if aR<=aS
then aD(aJ,aK,aP,aL)if aw()then print((
'[SmartDodge][Dodge] \u{26a1} Instant Snap (%.1f studs) to Safe Spot!'):format(
aR))end return end if ag=='HumanoidMove'then if aw()then print((
'[SmartDodge][Dodge] \u{1f3c3} Humanoid:Move (Pure Physics Walk) (%.1f studs)...'
):format(aR))end local aT,aU,aV=os.clock(),4,az()if aV then aK.AutoRotate=false
else aK.AutoRotate=true end local aW=Vector3.new(aP.X,aJ.Position.Y,aP.Z)aK:
MoveTo(aW)if activeMoveConn then pcall(function()activeMoveConn:Disconnect()end)
activeMoveConn=nil end activeMoveConn=ad.RenderStepped:Connect(function()if not
aJ.Parent or not aK.Parent or aK.Health<=0 then if activeMoveConn then
activeMoveConn:Disconnect()activeMoveConn=nil end return end local aX=
currentTargetPos or aF if not aX then return end local aY=Vector3.new(aX.X-aJ.
Position.X,0,aX.Z-aJ.Position.Z)if aY.Magnitude>0.6 then aK:Move(aY.Unit,false)
else aK:Move(Vector3.zero,false)end if ac and ac.IsEnabled and ac.IsEnabled()
then local aZ=az()if aZ then if aK.AutoRotate~=false then aK.AutoRotate=false
end local a_=aJ.Position local a0=Vector3.new(aZ.X-a_.X,0,aZ.Z-a_.Z)if a0.
Magnitude>0.5 then local a1,a2=aJ.CFrame.LookVector,a0.Unit if a1:Dot(a2)<0.999
then aJ.CFrame=CFrame.lookAt(a_,Vector3.new(aZ.X,a_.Y,aZ.Z))end end else if aK.
AutoRotate~=true then aK.AutoRotate=true end end end end)while af and(os.clock()
-aT<aU)do if not aJ.Parent or not aK.Parent or aK.Health<=0 then break end if
not av()then break end aP=currentTargetPos or aF if not aP then break end aQ=aJ.
Position local aX=Vector3.new(aP.X-aQ.X,0,aP.Z-aQ.Z)local aY=aX.Magnitude if aY
<=ah then aD(aJ,aK,aP,aL)if aw()then print((
'[SmartDodge][Dodge] \u{26a1} HumanoidMove Final Snap (%.1f studs) to Safe Spot!'
):format(aY))end break end if not av()then if aY<=ah then aD(aJ,aK,aP,aL)end
break end aK:MoveTo(Vector3.new(aP.X,aQ.Y,aP.Z))local aZ,a_=aQ+Vector3.new(0,0.5
,0),aX.Unit*2 local a0=workspace:Raycast(aZ,a_,ar)if a0 and a0.Instance and a0.
Instance.CanCollide and a0.Normal.Y<0.7 then aK.Jump=true end task.wait(0.03)end
if aJ.Parent and aK.Parent and aK.Health>0 then aP=currentTargetPos or aF if aP
then local aX=Vector3.new(aP.X-aJ.Position.X,0,aP.Z-aJ.Position.Z)if aX.
Magnitude<=ah then aD(aJ,aK,aP,aL)end end end aO()return end if ag=='Blink'then
local aT,aU,aV=ai or 1,os.clock(),2.5 as()while af and(os.clock()-aU<aV)do if
not aJ.Parent or not aK.Parent or aK.Health<=0 then return end aP=
currentTargetPos or aF if not aP then break end aQ=aJ.Position local aW=Vector3.
new(aP.X-aQ.X,0,aP.Z-aQ.Z)local aX,aY=aW.Magnitude,math.min(ah,aT)if aX<=aY then
aD(aJ,aK,aP,aL)if aw()then print((
'[SmartDodge][Dodge] \u{26a1} Rapid Blink reached Safe Spot (%.1f studs) -> SNAP!'
):format(aX))end return end if not av()and aX<=aT then aD(aJ,aK,aP,aL)return end
local aZ,a_,a0=math.min(aT,aX),aW.Unit,aQ+Vector3.new(0,1.5,0)local a1=a_*(aZ+
0.4)local a2=workspace:Raycast(a0,a1,ar)if a2 and a2.Instance and a2.Instance.
CanCollide and a2.Normal.Y<=0.65 then local a3=(a2.Position-a0).Magnitude if a3
<=0.7 then break else aZ=math.max(0,a3-0.4)end end local a3=aQ+a_*aZ aD(aJ,aK,a3
,aL)task.wait(0.025)end if aJ.Parent and aK.Parent and aK.Health>0 then aP=
currentTargetPos or aF if aP then local aW=Vector3.new(aP.X-aJ.Position.X,0,aP.Z
-aJ.Position.Z)if aW.Magnitude<=math.min(ah,aT)then aD(aJ,aK,aP,aL)end end end
return end if aw()then print((
'[SmartDodge][Dodge] \u{1f6b6} MoveTo Walk (%.1f studs)...'):format(aR))end
local aT=az()if aT then aK.AutoRotate=false pcall(function()local aU=Instance.
new'BodyGyro'aU.Name='SmartDodge_FacingGyro'aU.MaxTorque=Vector3.new(0,400000,0)
aU.P=25000 aU.D=500 local aV=aJ.Position aU.CFrame=CFrame.lookAt(aV,Vector3.new(
aT.X,aV.Y,aT.Z))aU.Parent=aJ aM=aU end)else aK.AutoRotate=true end local aU,aV=
os.clock(),10 while af and(os.clock()-aU<aV)do if not aJ.Parent or not aK.Parent
or aK.Health<=0 then break end if not av()then break end aP=currentTargetPos or
aF if not aP then break end aQ=aJ.Position local aW=aB(aQ,aP)if aW<=ah then aD(
aJ,aK,aP,aL)if aw()then print((
'[SmartDodge][Dodge] \u{1f3af} Reached snap range (%.2f studs) -> SNAP'):format(
aW))end break end if aM and aM.Parent then local aX=az()if aX then aM.CFrame=
CFrame.lookAt(aQ,Vector3.new(aX.X,aQ.Y,aX.Z))end end local aX=aC(aJ,aP)aK:
MoveTo(aX)task.wait(0.05)end aN()if not aJ.Parent or not aK.Parent or aK.Health
<=0 then return end aP=currentTargetPos or aF if not aP then return end local aW
=aB(aJ.Position,aP)if aW<=ah then aD(aJ,aK,aP,aL)if aw()then print((
'[SmartDodge][Dodge] \u{26a1} Final snap from %.2f studs.'):format(aW))end end
end)if not aP then warn('[SmartDodge][Dodge] Error during dodge execution: '..
tostring(aQ))end aO()end)end function at.Cancel()if dodgeThread then task.
cancel(dodgeThread)dodgeThread=nil end local aF,aG,aH=aA()if aH then pcall(
function()aH:Move(Vector3.zero,false)end)local aI=ac and ac.IsEnabled and ac.
IsEnabled()and ac.IsTargetActive and ac.IsTargetActive()if aI then aH.AutoRotate
=false else aH.AutoRotate=true end end if aG and aG.Parent and ag~=
'HumanoidMove'then aG.AssemblyLinearVelocity=Vector3.zero aG.
AssemblyAngularVelocity=Vector3.zero end ak=false ac.SetDodging(false)
currentTargetPos=nil end function at.FireStatus(aF)ay(aF)end function at.
SetAutoDodge(aF)af=aF and true or false end function at.IsAutoDodgeEnabled()
return af end function at.SetDodgeMode(aF)if aF=='MoveTo'or aF=='Blink'or aF==
'HumanoidMove'then ag=aF end end function at.GetDodgeMode()return ag end
function at.SetMaxSnapDistance(aF)if type(aF)=='number'and aF>0 then ah=aF end
end function at.GetMaxSnapDistance()return ah end at.SetMaxTeleportStep=at.
SetMaxSnapDistance at.GetMaxTeleportStep=at.GetMaxSnapDistance function at.
SetBlinkStep(aF)if type(aF)=='number'and aF>0 then ai=aF end end function at.
GetBlinkStep()return ai end function at.SetMaintainSnapHeight(aF)aj=aF and true
or false end function at.IsMaintainSnapHeightEnabled()return aj end function at.
IsDodging()return ak end function at.SetFaceTargetProvider(aF)faceTargetProvider
=type(aF)=='function'and aF or nil end function at.GetStatus()if ak then return
'Dodging'elseif ab.IsInvulnerable and ab.IsInvulnerable()and av()then return
'\u{1f6e1}\u{fe0f} Paused (Invulnerable)'elseif av()then return
'Safe (Standing in Spot)'else return'Idle'end end function at.
OnDodgeStatusChanged(aF)if type(aF)~='function'then return end table.insert(aq,
aF)end function at.Cancel()if dodgeThread then task.cancel(dodgeThread)
dodgeThread=nil end if activeMoveConn then pcall(function()activeMoveConn:
Disconnect()end)activeMoveConn=nil end local aF,aG,aH=aA()if aH and aH.Parent
and ag=='HumanoidMove'then pcall(function()aH:Move(Vector3.zero,false)end)end if
ab.CancelPanicSpeed then ab.CancelPanicSpeed()end ak=false ac.SetDodging(false)
currentTargetPos=nil ay'Idle'end function at.SetPanicSprintEnabled(aF)al=aF and
true or false end function at.IsPanicSprintEnabled()return al end function at.
SetPanicSpeed(aF)if type(aF)=='number'and aF>0 then am=aF end end function at.
GetPanicSpeed()return am end function at.SetPanicDuration(aF)if type(aF)==
'number'and aF>0 then an=aF end end function at.GetPanicDuration()return an end
function at.SetPanicCooldown(aF)if type(aF)=='number'and aF>0 then ao=aF end end
function at.GetPanicCooldown()return ao end function at.IsPanicActive()return ab
.IsPanicSpeedActive and ab.IsPanicSpeedActive()or false end return at end
function a.u()local aa,ab,ac,ad,ae,af,ag=a.load'e',a.load'f',a.load'j',a.load'n'
,a.load'm',a.load's',a.load't'ae.BindDetection{GetActiveHazardsMap=ad.
GetActiveHazardsMap,GetLockedProjectiles=ad.GetLockedProjectiles,
GetTrajectoryConfigForPart=ad.GetTrajectoryConfigForPart,LockTrajectoryForPart=
ad.LockTrajectoryForPart,IsIgnoredPart=ad.IsIgnoredPart,GetFadeThreshold=ad.
GetFadeThreshold}local ah,ai,aj,ak,al,am,an,ao,ap,aq=aa.player,false,false,0,{},
true,true ag.SetRuntime{getInDanger=function()return aj end,getLogInDanger=
function()return am end,getActiveBossOrb=ad.GetActiveBossOrb}local ar,as,at,au,
av={},false,false,0,function(ar,as,at,au,av,aw,ax)for ay,az in ipairs(al)do
pcall(az,ar,as,at,au,av,aw,ax)end end local aw,ax=function()if aq then return
end aq=task.spawn(function()local aw=0 while ai do if not ab.IsBossActive()and
ab.GetEnemyCount()==0 and ad.GetHazardCount()>0 then ad.ClearAllHazards
'Room Cleared'end ad.UpdateTrajectories()local ax,ay,az,aA,aB=ab.IsDead and ab.
IsDead()or false if ax then ay=false az=nil aA='Dead'aB=0 else ay,az,aA,aB=af.
CalculateSafeSpot()end local aC,aD=ab.IsInvulnerable()aj=ay ao=az ap=aA ak=aB or
0 af.UpdateMarker(az,ay,aB)local aE=ah and ah.Character and ah.Character:
FindFirstChild'HumanoidRootPart'local aF=aE and aE.Position af.UpdateHitbox(aF)
af.UpdatePlayerRadar(aF,ay)ad.UpdateTrajectoryVisuals()ad.UpdateHazardTimers()if
ay and az and ag.IsAutoDodgeEnabled()then if aC and an then if ag.IsDodging()
then ag.Cancel()end else ag.Perform(az,aB,aA)end end local aG=os.clock()local aH
=aC and(aG-au>=0.25)local aI=(ay~=aj)or(az~=ao)or(ax~=as)or(aC~=at)or aH if aI
then au=aG as=ax at=aC av(ay,az,aA,aB,aC,aD,ax)if am and ay and az and(os.clock(
)-aw>0.5)then aw=os.clock()if aC and an then print((
'[SmartDodge][Invulnerable] \u{1f6e1}\u{fe0f} IN DANGER (%s) but INVULNERABLE (%s) -> Dodge Paused'
):format(aA,aD or'Protection'))else print((
'[SmartDodge][InDanger] \u{26a0}\u{fe0f} IN DANGER: %s | Escape Dist: %.1f studs -> SafePos: (%.1f, %.1f, %.1f)'
):format(aA,aB,az.X,az.Y,az.Z))end end end task.wait(0.05)end end)end,function()
if aq then task.cancel(aq)aq=nil end ag.Cancel()af.HideVisuals()ad.
ClearTrajectoryVisuals()af.ResetLock()aj=false ao=nil ap=nil av(false,nil,nil,0)
ag.FireStatus'Idle'end local ay,az=function()ad.StartScan()aw()end,function()ad.
StopScan()ax()end function ar.StartEngine()if ai then return end ai=true ad.
SetEnabled(true)ay()end function ar.StopEngine()if not ai then return end ai=
false ax()local aA=ad.skillTimingManager if not(aA and aA.IsRecording())then ad.
SetEnabled(false)ad.StopScan()end end function ar.Toggle(aA)if aA then ar.
StartEngine()ac.EnableExclusive'SmartDodge'else ar.StopEngine()end end function
ar.IsEnabled()return ai end function ar.Shutdown()ai=false az()af.
DestroyVisuals()ad.ClearTrajectoryVisuals()ag.Cancel()end function ar.
SetLogInDanger(aA)am=aA and true or false end function ar.IsLogInDangerEnabled()
return am end function ar.SetIgnoreDodgeWhenInvulnerable(aA)an=aA and true or
false end function ar.IsIgnoreDodgeWhenInvulnerableEnabled()return an end
function ar.IsDead()return ab.IsDead and ab.IsDead()or false end function ar.
IsInDanger()return aj end function ar.GetCurrentSafeSpot()return ao,aj,ap,ak end
function ar.OnSafeSpotChanged(aA)if type(aA)~='function'then return end table.
insert(al,aA)end return ar end function a.v()local aa,ab,ac=a.load'e',a.load'f',
a.load'b'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an=aa.RunService,aa.
UserInputService,aa.player,{},false,Color3.fromRGB(255,255,255),Color3.fromRGB(
255,65,65),Color3.fromRGB(50,255,120),Color3.fromRGB(60,60,70),Color3.fromRGB(
220,50,50),(Color3.fromRGB(40,200,90))local ao=function()local ao,ap=pcall(
function()if typeof(gethui)=='function'then local ao=gethui()if ao then return
ao end end local ao=game:GetService'CoreGui'if ao then return ao end return nil
end)if ao and ap then return ap end local aq=af or aa.player return aq and aq:
FindFirstChild'PlayerGui'end local ap,aq=function()if screenGui and screenGui.
Parent then return end local ap=ao()if not ap then return end local aq=ap:
FindFirstChild'DQ_SpeedDebugHud'if aq then pcall(function()aq:Destroy()end)end
screenGui=Instance.new'ScreenGui'screenGui.Name='DQ_SpeedDebugHud'screenGui.
ResetOnSpawn=false screenGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
mainFrame=Instance.new'Frame'mainFrame.Name='SpeedBadge'mainFrame.Size=UDim2.
new(0,168,0,34)mainFrame.Position=UDim2.new(0.5,-84,0,50)mainFrame.
BackgroundColor3=Color3.fromRGB(15,15,22)mainFrame.BackgroundTransparency=0.25
mainFrame.BorderSizePixel=0 mainFrame.Active=true mainFrame.Parent=screenGui
local ar=Instance.new'UICorner'ar.CornerRadius=UDim.new(0,8)ar.Parent=mainFrame
uiStroke=Instance.new'UIStroke'uiStroke.Thickness=1.4 uiStroke.Color=al uiStroke
.Transparency=0.2 uiStroke.Parent=mainFrame speedLabel=Instance.new'TextLabel'
speedLabel.Name='SpeedText'speedLabel.Size=UDim2.new(1,-10,1,0)speedLabel.
Position=UDim2.new(0,5,0,0)speedLabel.BackgroundTransparency=1 speedLabel.Font=
Enum.Font.GothamBold speedLabel.TextSize=13 speedLabel.TextColor3=ai speedLabel.
Text='SPEED: 16.0'speedLabel.TextXAlignment=Enum.TextXAlignment.Center
speedLabel.TextYAlignment=Enum.TextYAlignment.Center speedLabel.Parent=mainFrame
local as,at,au=false mainFrame.InputBegan:Connect(function(av)if av.
UserInputType==Enum.UserInputType.MouseButton1 or av.UserInputType==Enum.
UserInputType.Touch then as=true at=av.Position au=mainFrame.Position av.Changed
:Connect(function()if av.UserInputState==Enum.UserInputState.End then as=false
end end)end end)mainFrame.InputChanged:Connect(function(av)if av.UserInputType==
Enum.UserInputType.MouseMovement or av.UserInputType==Enum.UserInputType.Touch
then if as and at and au then local aw=av.Position-at mainFrame.Position=UDim2.
new(au.X.Scale,au.X.Offset+aw.X,au.Y.Scale,au.Y.Offset+aw.Y)end end end)
screenGui.Parent=ap end,function()if updateConn then updateConn:Disconnect()
updateConn=nil end if screenGui and screenGui.Parent then pcall(function()
screenGui:Destroy()end)screenGui=nil mainFrame=nil speedLabel=nil uiStroke=nil
end end local ar=function()if updateConn then return end local ar=0 updateConn=
ad.RenderStepped:Connect(function()local as=os.clock()if(as-ar)<0.04 then return
end ar=as if not screenGui or not screenGui.Parent or not speedLabel or not
speedLabel.Parent then ap()return end local at=af and af.Character local au,av=
at and at:FindFirstChild'Humanoid',at and at:FindFirstChild'HumanoidRootPart'if
not au or au.Health<=0 then speedLabel.Text='SPEED: \u{1f480} DEAD'speedLabel.
TextColor3=Color3.fromRGB(160,160,160)if uiStroke then uiStroke.Color=al end
return end local aw,ax=au.WalkSpeed or 0,av and av.AssemblyLinearVelocity local
ay,az=ax and Vector3.new(ax.X,0,ax.Z).Magnitude or 0,ab.IsPanicSpeedActive and
ab.IsPanicSpeedActive()local aA=(not az)and(aw>=23.5 or ay>=23)if az then
speedLabel.TextColor3=aj speedLabel.Text=('SPD: %.1f [PANIC \u{1f4a8}]'):format(
aw)if uiStroke then uiStroke.Color=am end elseif aA then speedLabel.TextColor3=
ak speedLabel.Text=('SPD: %.1f [SKILL \u{26a1}]'):format(aw)if uiStroke then
uiStroke.Color=an end else speedLabel.TextColor3=ai speedLabel.Text=('SPD: %.1f'
):format(aw)if uiStroke then uiStroke.Color=al end end end)end function ag.
SetEnabled(as)ah=as and true or false if ah then ap()ar()else aq()end end
function ag.IsEnabled()return ah end ac.Register(function()ag.SetEnabled(false)
end)ag.SetEnabled(true)return ag end function a.w()local aa,ab,ac,ad,ae,af,ag,ah
,ai,aj,ak,al=a.load'b',a.load'j',a.load'n',a.load'm',a.load's',a.load't',a.load
'u',a.load'r',a.load'v',a.load'l',a.load'f',{}al.skillTiming=aj al.
SetSkillTimingMode=aj.SetMode al.GetSkillTimingMode=aj.GetMode al.
SetSelectedSkillMap=aj.SetSelectedMap al.GetSelectedSkillMap=aj.GetSelectedMap
al.LoadSkillMapData=aj.LoadMapData al.SetSkillRecordingEnabled=aj.
SetRecordingEnabled al.IsSkillRecordingEnabled=aj.IsRecording al.
SaveRecordedSkillData=aj.SaveRecordedData al.ClearRecordedSkillSession=aj.
ClearRecordedSession al.GetLoadedSkillCount=aj.GetLoadedSkillCount al.
GetRecordedSkillCount=aj.GetRecordedSkillCount al.GetTotalSamplesCount=aj.
GetTotalSamplesCount al.OnSkillTimingChanged=aj.OnChanged al.StartDetection=ac.
StartScan al.StopDetection=ac.StopScan al.IsDetectionEnabled=ac.IsEnabled al.
SetDetectionEnabled=ac.SetEnabled al.AddCustomHazard=ac.AddCustomHazard al.
AddTrajectoryProjectile=ac.AddTrajectoryProjectile al.SetTrajectoryLookahead=ac.
SetTrajectoryLookahead al.GetTrajectoryLookahead=ac.GetTrajectoryLookahead al.
SetTrajectoryWidthPadding=ac.SetTrajectoryWidthPadding al.
GetTrajectoryWidthPadding=ac.GetTrajectoryWidthPadding al.RegisterPlayerSkill=ac
.RegisterPlayerSkill al.GetActiveBossOrb=ac.GetActiveBossOrb al.SetLogHazards=ac
.SetLogHazards al.IsLogHazardsEnabled=ac.IsLogHazardsEnabled al.SetLogThreats=al
.SetLogHazards al.IsLogThreatsEnabled=al.IsLogHazardsEnabled al.SetVisualEsp=ac.
SetVisualEsp al.IsVisualEspEnabled=ac.IsVisualEspEnabled al.SetShowSkillTimers=
ac.SetShowSkillTimers al.IsShowSkillTimersEnabled=ac.IsShowSkillTimersEnabled al
.GetHazardTimeRemaining=ac.GetHazardTimeRemaining al.GetHazardCount=ac.
GetHazardCount al.GetActiveHazards=ac.GetActiveHazards al.GetLastHazardInfo=ac.
GetLastHazardInfo al.OnHazardChanged=ac.OnHazardChanged al.CalculateSafeSpot=ae.
CalculateSafeSpot al.SetShowSafeMarker=ae.SetShowSafeMarker al.
IsShowSafeMarkerEnabled=ae.IsShowSafeMarkerEnabled al.SetShowPlayerRadar=ae.
SetShowPlayerRadar al.IsShowPlayerRadarEnabled=ae.IsShowPlayerRadarEnabled al.
UpdatePlayerRadar=ae.UpdatePlayerRadar al.ClearPlayerRadar=ae.ClearPlayerRadar
al.SetShowHitboxVisual=ae.SetShowHitboxVisual al.IsShowHitboxVisualEnabled=ae.
IsShowHitboxVisualEnabled al.SetHitboxPadding=ae.SetHitboxPadding al.
GetHitboxPadding=ad.GetHitboxPadding al.GetBoss1ArenaCenter=ae.
GetBoss1ArenaCenter al.GetBoss1ArenaRadius=ae.GetBoss1ArenaRadius al.
SetAutoDodge=af.SetAutoDodge al.IsAutoDodgeEnabled=af.IsAutoDodgeEnabled al.
SetDodgeMode=af.SetDodgeMode al.GetDodgeMode=af.GetDodgeMode al.SetBlinkStep=af.
SetBlinkStep al.GetBlinkStep=af.GetBlinkStep al.SetMaxSnapDistance=af.
SetMaxSnapDistance al.GetMaxSnapDistance=af.GetMaxSnapDistance al.
SetMaxTeleportStep=af.SetMaxTeleportStep al.GetMaxTeleportStep=af.
GetMaxTeleportStep al.SetMaintainSnapHeight=af.SetMaintainSnapHeight al.
IsMaintainSnapHeightEnabled=af.IsMaintainSnapHeightEnabled al.IsDodging=af.
IsDodging al.SetFaceTargetProvider=af.SetFaceTargetProvider al.GetDodgeStatus=af
.GetStatus al.OnDodgeStatusChanged=af.OnDodgeStatusChanged al.Cancel=af.Cancel
al.SetPanicSprintEnabled=af.SetPanicSprintEnabled al.IsPanicSprintEnabled=af.
IsPanicSprintEnabled al.SetPanicSpeed=af.SetPanicSpeed al.GetPanicSpeed=af.
GetPanicSpeed al.SetPanicDuration=af.SetPanicDuration al.GetPanicDuration=af.
GetPanicDuration al.SetPanicCooldown=af.SetPanicCooldown al.GetPanicCooldown=af.
GetPanicCooldown al.IsPanicActive=af.IsPanicActive al.SetSpeedDebugHudEnabled=ai
.SetEnabled al.IsSpeedDebugHudEnabled=ai.IsEnabled al.SetAutoFaceTarget=ah.
SetEnabled al.IsAutoFaceTargetEnabled=ah.IsEnabled al.GetTargetPosition=ah.
GetTargetPosition al.SetAutoFaceBoss=al.SetAutoFaceTarget al.
IsAutoFaceBossEnabled=al.IsAutoFaceTargetEnabled al.GetBossPosition=al.
GetTargetPosition al.IsTargetActive=ah.IsTargetActive al.IsBossActive=ah.
IsTargetActive al.StartEngine=ag.StartEngine al.StopEngine=ag.StopEngine al.
Toggle=ag.Toggle al.IsEnabled=ag.IsEnabled al.SetLogInDanger=ag.SetLogInDanger
al.IsLogInDangerEnabled=ag.IsLogInDangerEnabled al.IsInDanger=ag.IsInDanger al.
GetCurrentSafeSpot=ag.GetCurrentSafeSpot al.OnSafeSpotChanged=ag.
OnSafeSpotChanged al.SetIgnoreDodgeWhenInvulnerable=ag.
SetIgnoreDodgeWhenInvulnerable al.IsIgnoreDodgeWhenInvulnerableEnabled=ag.
IsIgnoreDodgeWhenInvulnerableEnabled al.SetRespawnProtectionDuration=ak.
SetRespawnProtectionDuration al.GetRespawnProtectionDuration=ak.
GetRespawnProtectionDuration al.GetRespawnProtectionRemaining=ak.
GetRespawnProtectionRemaining al.IsInvulnerable=ak.IsInvulnerable al.IsDead=ak.
IsDead ab.Register('SmartDodge',al.StopEngine,al.IsEnabled)aa.Register(function(
)ag.Shutdown()end)return al end function a.x()local aa,ab,ac=a.load'g',a.load'd'
,a.load'w'return function(ad,ae)local af=ae:Section{Side='Left'}af:Header{Name=
'Threat & Dodge Controls'}local ag=ae:Section{Side='Right'}ag:Header{Name=
'Real-time Dodge Monitor'}local ah,ai,aj,ak,al,am=ag:Label{Text=
"Detector: <font color='rgb(255,80,80)'>Disabled</font>"},ag:Label{Text=
"Active Hazards: <font color='rgb(160,160,160)'>0</font>"},ag:Label{Text=
"Player State: <font color='rgb(0,255,0)'>SAFE</font>"},ag:Label{Text=
[[Safe Target: <font color='rgb(160,160,160)'>None (No Dodge Needed)</font>]]},
ag:Label{Text="Dodge Action: <font color='rgb(160,160,160)'>Idle</font>"},ag:
Label{Text="Last Detected: <font color='rgb(160,160,160)'>None</font>"}local an,
ao,ap=function(an,ao)an=an or ac.GetHazardCount()ao=ao or ac.GetLastHazardInfo()
local ap=ac.IsEnabled()local aq,ar=ap and'0, 255, 0'or'255, 80, 80',ap and
'Active (Scanning & Calculating)'or'Disabled'pcall(function()ah:UpdateName(
"Detector: <font color='rgb("..aq..")'>"..ar..'</font>')end)local as=an>0 and
'255, 60, 60'or'0, 255, 0'pcall(function()ai:UpdateName(
"Active Hazards: <font color='rgb("..as..")'>"..tostring(an)..'</font>')end)if
ao then pcall(function()am:UpdateName((
[[Last Detected: <font color='rgb(255,220,120)'>%s</font> (%s, %d studs)]]):
format(ao.Name,ao.Class,ao.Distance))end)else pcall(function()am:UpdateName
"Last Detected: <font color='rgb(160,160,160)'>None</font>"end)end end,function(
an,ao,ap,aq,ar,as,at)if at==nil then at=ac.IsDead and ac.IsDead()or false end if
ar==nil then ar,as=ac.IsInvulnerable()end if at then pcall(function()aj:
UpdateName"Player State: <font color='rgb(160,160,160)'>\u{1f480} DEAD</font>"ak
:UpdateName
[[Safe Target: <font color='rgb(160,160,160)'>None (Player Dead)</font>]]end)
elseif ar and ac.IsIgnoreDodgeWhenInvulnerableEnabled()then pcall(function()aj:
UpdateName((
"Player State: <font color='rgb(0,220,255)'>\u{1f6e1}\u{fe0f} INVULNERABLE (%s)</font>"
):format(as or'Protection'))if an and ao then ak:UpdateName((
"Safe Target: <font color='rgb(0,220,255)'>\u{1f6e1}\u{fe0f} Dodge Paused (%.1fm to Safe)</font>"
):format(aq or 0))else ak:UpdateName
[[Safe Target: <font color='rgb(160,160,160)'>None (Invulnerable)</font>]]end
end)elseif an then pcall(function()aj:UpdateName((
"Player State: <font color='rgb(255,60,60)'>\u{26a0}\u{fe0f} IN DANGER (%s)</font>"
):format(ap or'Hazard'))if ao then ak:UpdateName((
"Safe Target: <font color='rgb(0,255,120)'>\u{1f7e2} (%.1f, %.1f, %.1f) - %.1fm</font>"
):format(ao.X,ao.Y,ao.Z,aq or 0))else ak:UpdateName
"Safe Target: <font color='rgb(255,160,0)'>\u{26a0}\u{fe0f} Calculating Safe Spot...</font>"
end end)else pcall(function()aj:UpdateName
"Player State: <font color='rgb(0,255,0)'>\u{1f7e2} SAFE</font>"ak:UpdateName
[[Safe Target: <font color='rgb(160,160,160)'>None (No Dodge Needed)</font>]]end
)end end,function(an)local ao=ac.IsDead and ac.IsDead()or false if ao then
pcall(function()al:UpdateName
"Dodge Action: <font color='rgb(160, 160, 160)'>Dead</font>"end)return end an=an
or ac.GetDodgeStatus()local ap=ac.IsInvulnerable()if ap and ac.
IsIgnoreDodgeWhenInvulnerableEnabled()and ac.IsInDanger()then an=
'\u{1f6e1}\u{fe0f} Paused (Invulnerable)'end local aq=ac.IsPanicActive and ac.
IsPanicActive()if aq and an=='Dodging'then an='Dodging (\u{1f4a8} PANIC SPRINT)'
end local ar='160, 160, 160'if an=='Dodging'then ar='255, 200, 50'elseif an==
'Returning'then ar='255, 140, 0'elseif an:find'Safe'then ar='0, 255, 120'elseif
an:find'Invulnerable'then ar='0, 220, 255'end pcall(function()al:UpdateName(
"Dodge Action: <font color='rgb("..ar..")'>"..an..'</font>')end)end ac.
OnHazardChanged(function(aq,ar)an(aq,ar)end)ac.OnSafeSpotChanged(function(aq,ar,
as,at,au,av,aw)ao(aq,ar,as,at,au,av,aw)ap()end)ac.OnDodgeStatusChanged(function(
aq)ap(aq)end)af:Toggle({Name='Enable Threat & Safe Spot Engine',Default=ac.
IsEnabled(),Callback=ab.Wrap(function(aq)ac.Toggle(aq)an()end)},
'Toggle_SmartDodgeThreatDetection')af:Toggle({Name='Auto Dodge Execution',
Default=ac.IsAutoDodgeEnabled(),Callback=ab.Wrap(function(aq)ac.SetAutoDodge(aq)
end)},'Toggle_SmartDodgeAutoExecution')local aq,ar,as={'HumanoidMove','Blink',
'MoveTo'},ac.GetDodgeMode(),1 if ar=='Blink'then as=2 elseif ar=='MoveTo'then as
=3 end af:Dropdown({Name='Dodge Movement Mode',Options=aq,Default=as,Required=
true,Callback=ab.Wrap(function(at)ac.SetDodgeMode(at)end)},
'Dropdown_SmartDodgeMode')aa.PatchSliderLoadCallback(af:Slider({Name=
'Blink Step Distance',Suffix=' std',Default=ac.GetBlinkStep(),Minimum=0.2,
Maximum=2,DisplayMethod='Round',Precision=1,Callback=ab.Wrap(function(at)ac.
SetBlinkStep(at)end)},'Slider_SmartDodgeBlinkStep'))af:Toggle({Name=
'Auto Face Target (Lu\u{f4}n nh\u{ec}n v\u{1ec1} m\u{1ee5}c ti\u{ea}u)',Default=
ac.IsAutoFaceTargetEnabled(),Callback=ab.Wrap(function(at)ac.SetAutoFaceTarget(
at)end)},'Toggle_SmartDodgeAutoFaceTarget')af:Toggle({Name=
'Pause Dodge When Invulnerable (Respawn)',Default=ac.
IsIgnoreDodgeWhenInvulnerableEnabled(),Callback=ab.Wrap(function(at)ac.
SetIgnoreDodgeWhenInvulnerable(at)end)},'Toggle_SmartDodgeIgnoreInvulnerable')aa
.PatchSliderLoadCallback(af:Slider({Name='Respawn Protection',Suffix='s',Default
=ac.GetRespawnProtectionDuration(),Minimum=0,Maximum=10,DisplayMethod='Round',
Precision=1,Callback=ab.Wrap(function(at)ac.SetRespawnProtectionDuration(at)end)
},'Slider_SmartDodgeRespawnProtectionDuration'))aa.PatchSliderLoadCallback(af:
Slider({Name='Final Snap Distance',Suffix=' std',Default=ac.GetMaxSnapDistance()
,Minimum=0.2,Maximum=6,DisplayMethod='Round',Precision=1,Callback=ab.Wrap(
function(at)ac.SetMaxSnapDistance(at)end)},'Slider_SmartDodgeMaxStep'))af:
Toggle({Name='Maintain Height When Snapping',Default=ac.
IsMaintainSnapHeightEnabled(),Callback=ab.Wrap(function(at)ac.
SetMaintainSnapHeight(at)end)},'Toggle_SmartDodgeMaintainHeight')af:Toggle({Name
='Panic Sprint on Danger (T\u{103}ng t\u{1ed1}c n\u{e9} kh\u{1ea9}n c\u{1ea5}p)'
,Default=ac.IsPanicSprintEnabled(),Callback=ab.Wrap(function(at)ac.
SetPanicSprintEnabled(at)end)},'Toggle_SmartDodgePanicSprint')aa.
PatchSliderLoadCallback(af:Slider({Name='Panic WalkSpeed',Suffix=' spd',Default=
ac.GetPanicSpeed(),Minimum=18,Maximum=32,DisplayMethod='Round',Precision=0,
Callback=ab.Wrap(function(at)ac.SetPanicSpeed(at)end)},
'Slider_SmartDodgePanicSpeed'))aa.PatchSliderLoadCallback(af:Slider({Name=
'Panic Duration',Suffix='s',Default=ac.GetPanicDuration(),Minimum=0.5,Maximum=3,
DisplayMethod='Round',Precision=1,Callback=ab.Wrap(function(at)ac.
SetPanicDuration(at)end)},'Slider_SmartDodgePanicDuration'))aa.
PatchSliderLoadCallback(af:Slider({Name='Panic Cooldown',Suffix='s',Default=ac.
GetPanicCooldown(),Minimum=2,Maximum=10,DisplayMethod='Round',Precision=1,
Callback=ab.Wrap(function(at)ac.SetPanicCooldown(at)end)},
'Slider_SmartDodgePanicCooldown'))aa.PatchSliderLoadCallback(af:Slider({Name=
'Hitbox Padding',Suffix=' std',Default=ac.GetHitboxPadding(),Minimum=0,Maximum=5
,DisplayMethod='Round',Precision=1,Callback=ab.Wrap(function(at)ac.
SetHitboxPadding(at)end)},'Slider_SmartDodgeHitboxPadding'))aa.
PatchSliderLoadCallback(af:Slider({Name='Trajectory Lookahead',Suffix=' std',
Default=ac.GetTrajectoryLookahead(),Minimum=20,Maximum=150,DisplayMethod='Round'
,Precision=1,Callback=ab.Wrap(function(at)ac.SetTrajectoryLookahead(at)end)},
'Slider_SmartDodgeTrajLookahead'))aa.PatchSliderLoadCallback(af:Slider({Name=
'Trajectory Width',Suffix=' std',Default=ac.GetTrajectoryWidthPadding(),Minimum=
0.5,Maximum=6,DisplayMethod='Round',Precision=1,Callback=ab.Wrap(function(at)ac.
SetTrajectoryWidthPadding(at)end)},'Slider_SmartDodgeTrajPadding'))af:Toggle({
Name='Show Hitbox Padding Visual (Cyan Circle)',Default=ac.
IsShowHitboxVisualEnabled(),Callback=ab.Wrap(function(at)ac.SetShowHitboxVisual(
at)end)},'Toggle_SmartDodgeHitboxVisual')af:Toggle({Name=
'Player Threat Radar (24-Ray Sonar)',Default=ac.IsShowPlayerRadarEnabled(),
Callback=ab.Wrap(function(at)ac.SetShowPlayerRadar(at)end)},
'Toggle_SmartDodgePlayerRadar')af:Toggle({Name=
'Threat Visual ESP (SelectionBox)',Default=ac.IsVisualEspEnabled(),Callback=ab.
Wrap(function(at)ac.SetVisualEsp(at)end)},'Toggle_SmartDodgeVisualEsp')af:
Toggle({Name='Show Skill Lifetime Timers (3D Countdown)',Default=ac.
IsShowSkillTimersEnabled(),Callback=ab.Wrap(function(at)ac.SetShowSkillTimers(at
)end)},'Toggle_SmartDodgeSkillTimers')af:Toggle({Name=
'Show Safe Spot Marker (Green ESP)',Default=ac.IsShowSafeMarkerEnabled(),
Callback=ab.Wrap(function(at)ac.SetShowSafeMarker(at)end)},
'Toggle_SmartDodgeShowSafeMarker')af:Toggle({Name=
'Show Speed Debug HUD (T\u{1ed1}c \u{111}\u{1ed9} tr\u{ea}n m\u{e0}n h\u{ec}nh)'
,Default=ac.IsSpeedDebugHudEnabled(),Callback=ab.Wrap(function(at)ac.
SetSpeedDebugHudEnabled(at)end)},'Toggle_SmartDodgeSpeedDebugHud')af:Toggle({
Name='Log Hazards (Spawns / Despawns)',Default=ac.IsLogHazardsEnabled(),Callback
=ab.Wrap(function(at)ac.SetLogHazards(at)end)},'Toggle_SmartDodgeLogHazards')af:
Toggle({Name='Log In Danger & Safe Spot',Default=ac.IsLogInDangerEnabled(),
Callback=ab.Wrap(function(at)ac.SetLogInDanger(at)end)},
'Toggle_SmartDodgeLogInDanger')af:Button{Name='Clear Console',Callback=function(
)pcall(function()if rconsoleclear then rconsoleclear()end end)end}an()local at,
au,av,aw=ac.GetCurrentSafeSpot()ao(au,at,av,aw)ap()end end function a.y()local
aa,ab,ac,ad,ae,af=a.load'g',a.load'd',a.load'w',a.load'k',a.load'f',a.load'c'
return function(ag,ah)local ai=ah:Section{Side='Right'}ai:Header{Name=
'Skill Timing Profiles'}local aj,ak=ac.skillTiming,{'Default Preset',
'Trained Preset'}local al=aj.GetMode()local am=(al=='Trained Preset')and 2 or 1
local an,ao,ap,aq=ai:Dropdown({Name='Timing Source Mode',Options=ak,Default=am,
Required=true,Callback=ab.Wrap(function(an)aj.SetMode(an)end)},
'Dropdown_SkillTimingMode'),ad.GetDungeons()or{'Desert Temple'},aj.
GetSelectedMap(),1 for ar,as in ipairs(ao)do if as==ap then aq=ar break end end
local ar,as=ai:Dropdown({Name='Select Map Profile (Mode 2)',Options=ao,Default=
aq,Required=true,Callback=ab.Wrap(function(ar)aj.SetSelectedMap(ar)end)},
'Dropdown_SkillTimingSelectedMap'),ai:Label{Text=
[[Profile Status: <font color='rgb(0, 255, 120)'>Default Presets Active</font>]]
}ai:Button{Name='Reload Map Data to RAM',Callback=function()local at=aj.
GetSelectedMap()local au=aj.LoadMapData(at)local av=au>0 and(
"<font color='rgb(0, 255, 120)'>"..tostring(au)..' skills loaded</font>')or
[[<font color='rgb(255, 160, 0)'>0 skills (No file found)</font>]]as:UpdateName(
'Profile Status: '..av..' for ['..at..']')end}ai:Button{Name=
'View Map Skills in Console (F9)',Callback=function()local at=aj.
PrintLoadedMapData()af.Notify('Skill Timing',(
'\u{110}\u{e3} in %d chi\u{ea}u c\u{1ee7}a Map ra Console (F9)'):format(at),2)
end}ai:Header{Name='Manual Training (Ch\u{1a1}i Chay)'}local at,au=ai:Toggle{
Name='Record Skill Timings (Ch\u{1a1}i Chay)',Default=aj.IsRecording(),Callback=
function(at)aj.SetRecordingEnabled(at)if at then ac.SetDetectionEnabled(true)ac.
StartDetection()else if not ac.IsEnabled()then ac.SetDetectionEnabled(false)ac.
StopDetection()end end end},ai:Label{Text=
[[Recording: <font color='rgb(160, 160, 160)'>Idle (0 skills, 0 hits)</font>]]}
ai:Button{Name='Save Trained Data to Map File',Callback=function()local av=aj.
GetSelectedMap()local aw,ax=aj.SaveRecordedData(av)if aw then au:UpdateName(
"Recording: <font color='rgb(0, 255, 120)'>Saved "..tostring(ax)..' skills to '
..av..'!</font>')end end}ai:Button{Name='Clear Recording Buffer',Callback=
function()aj.ClearRecordedSession()au:UpdateName
[[Recording: <font color='rgb(160, 160, 160)'>Buffer Cleared (0 skills, 0 hits)</font>]]
end}ai:Button{Name='View Buffer in Console (F9)',Callback=function()local av=aj.
PrintRecordedData()af.Notify('Skill Training',(
'\u{110}\u{e3} in %d chi\u{ea}u trong Buffer ra Console (F9)'):format(av),2)end}
local av=function(av)pcall(function()if av.mode=='Default Preset'then as:
UpdateName
[[Profile Status: <font color='rgb(0, 255, 120)'>Default Presets Active (Stable)</font>]]
else local aw=av.selectedMap or aj.GetSelectedMap()or'Unknown'if av.loadedCount>
0 then as:UpdateName((
[[Profile Status: <font color='rgb(0, 255, 120)'>%d skills</font> from [%s] in RAM]]
):format(av.loadedCount,aw))else as:UpdateName((
[=[Profile Status: <font color='rgb(255, 160, 0)'>0 skills</font> (No file) for [%s]]=]
):format(aw))end end local aw=av.totalSamples or aj.GetTotalSamplesCount()if av.
isRecording then au:UpdateName((
"Recording: <font color='rgb(255, 60, 60)'>\u{1f534} ACTIVE</font> (%d skills, %d hits in RAM)"
):format(av.recordedCount,aw))else au:UpdateName((
[[Recording: <font color='rgb(160, 160, 160)'>Idle</font> (%d skills, %d hits buffered)]]
):format(av.recordedCount,aw))end end)end aj.OnChanged(av)av{mode=aj.GetMode(),
selectedMap=aj.GetSelectedMap(),loadedCount=aj.GetLoadedSkillCount(),isRecording
=aj.IsRecording(),recordedCount=aj.GetRecordedSkillCount(),totalSamples=aj.
GetTotalSamplesCount()}end end function a.z()local aa=a.load'e'local ab,ac=aa.
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
av,aw=ac.CheckClearance(aj,at,ai)if not au then al.chosenDest=as al.mode=
'Waypoint'al.nodeIdx=aq return as,'Waypoint',aq,al end end end al.mode='Blocked'
return nil,'Blocked',nil,al end function ac.ExecuteMove(ae,af,ag,ah,ai)if not ae
or not ag then return end ae:MoveTo(ag)local aj,ak=ag.Y-af.Y,Vector3.new(ag.X-af
.X,0,ag.Z-af.Z).Magnitude if aj>1.8 and ak<=7 then ae.Jump=true return end if ah
and#ah>0 then local al=math.clamp(ai or 1,1,#ah)for am=al,math.min(al+2,#ah)do
local an=ah[am]if an then local ao=Vector3.new(an.Position.X-af.X,0,an.Position.
Z-af.Z).Magnitude if ao<=5 then if an.Action==Enum.PathWaypointAction.Jump or(an
.Position.Y-af.Y)>1.8 then ae.Jump=true break end end end end end end return ac
end function a.A()local aa,ab,ac,ad,ae,af,ag,ah=a.load'e',a.load'f',a.load'b',a.
load'j',a.load'p',a.load'o',a.load'q',a.load'z'local ai,aj,ak,al,am,an,ao,ap,aq,
ar,as,at,au=aa.RunService,aa.player,{NO_TARGET='NO_TARGET',ACQUIRING_TARGET=
'ACQUIRING_TARGET',TRACKING_TARGET='TRACKING_TARGET',CHASE='CHASE',HOLD='HOLD',
BLOCKED='BLOCKED',REPATHING='REPATHING'},{},false,false,1.5,8,6,true,true,true,
true local av,aw,ax,ay,az,aA,aB,aC,aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ,aR,
aS,aT,aU,aV,aW,aX,aY=ak.NO_TARGET,'None',0,0,false,false,0,0,false,10,false,{},
function()local av=aj and aj.Character local aw=av and av:FindFirstChild
'HumanoidRootPart'if aw and aw.Parent then return aw end return nil end,function
(av)if not av or not av.Parent then return nil end local aw,ax=pcall(function()
return av.Position end)if not aw or not ax then return nil end return ax end,
function(av,aw)if av==aw then return true end if av and aw and av.Model and aw.
Model and av.Model==aw.Model then return true end return false end local aZ=
function(aZ,a_,a0,a1)local a2=ag.GetTarget()if aJ(a2,aZ)then if a_ then ag.
UpdatePath(a_,a0,a1)end return end ag.SetTarget(aZ,a_,a0,a1)aK=nil aw='None'aL=
nil aM=nil aB=0 if aZ then if a_ and a0 and#a0>0 then av=ak.TRACKING_TARGET else
av=ak.REPATHING end else av=ak.NO_TARGET end end aY=function()if az or not am or
not an then return end ay+=1 local a_=ay az=true task.spawn(function()local a0,
a1=pcall(function()local a0=aH()local a1=a0 and aI(a0)if not a1 then az=false
return end local a2=ae.Scan()if#a2==0 then if a_==ay and am and an then aZ(nil,
nil,nil,nil)end az=false return end local a3,a4,a5,a6=af.SelectBestTarget(a1,a2,
function()return a_~=ay or not am or not an end)if a_==ay and am and an then aZ(
a3,a4,a5,a6)else if a4 then pcall(function()a4:Destroy()end)end end end)az=false
if not a0 then warn(('[AutoFarm] Error in evaluation: %s'):format(tostring(a1)))
end end)end local a_,a0,a1,a2,a3=function(a_)if ab.IsInLobby()or not aA then
return end local a0,a1=aH(),ab.GetHumanoid()if not a0 or not a1 or a1.Health<=0
then return end local a2=aI(a0)if not a2 then return end if aF then return end
local a3=os.clock()if a3-ax>=ao then ax=a3 if av~=ak.HOLD then aY()end end local
a4=ag.GetTarget()if a4 then if not ag.IsTargetValid()then ag.ClearTarget()av=ak.
NO_TARGET aK=nil aw='None'aM=nil aY()pcall(function()a1:MoveTo(a2)end)return end
end if not a4 or av==ak.NO_TARGET then aK=nil aw='None'aM=nil if not az and a3-
ax>=0.5 then ax=a3 aY()end return end local a5=a4.Root and aI(a4.Root)if not a5
then ag.ClearTarget()av=ak.NO_TARGET aM=nil return end local a6=Vector3.new(a5.X
-a2.X,0,a5.Z-a2.Z).Magnitude if a6<=ap then av=ak.HOLD aK=nil aw='Hold'aB=0
pcall(function()a1:MoveTo(a2)end)return else if av==ak.HOLD then av=ak.CHASE end
end local a7=false if av==ak.REPATHING or av==ak.BLOCKED or not ag.
GetPathInstance()then a7=true elseif ag.NeedsRepath(a5)then a7=true end if a7
then local a8=ag.Repath(a2,a5)if a8 then av=ak.CHASE else av=ak.BLOCKED aK=nil
aw='Blocked'pcall(function()a1:MoveTo(a2)end)return end end ag.
AdvanceWaypointIndex(a2)local a8,a9,b=ag.GetWaypoints(),ag.GetWaypointIndex(),{
aj.Character}if a4.Model then table.insert(b,a4.Model)end local ba,bb,bc,bd=ah.
ResolveDestination(a2,a5,a8,a9,b)aM=bd if bb=='Blocked'or not ba then av=ak.
BLOCKED aK=nil aw='Blocked'pcall(function()a1:MoveTo(a2)end)return end av=ak.
CHASE aK=ba aw=bb aL=bc ah.ExecuteMove(a1,a2,ba,a8,a9)local be=(ba-a2).Magnitude
if be>=1.5 then local bf=a0.AssemblyLinearVelocity or a0.Velocity local bg,bh=bf
and Vector3.new(bf.X,0,bf.Z).Magnitude or 0,(type(a_)=='number'and a_>0)and a_
or 0.016 if bg<aE then aB+=bh if aD and(a3-aC)>=0.4 then a1.Jump=true pcall(
function()a1:ChangeState(Enum.HumanoidStateType.Jumping)end)aC=a3 end if aB>=1.5
then av=ak.REPATHING aB=0 end else aB=0 end else aB=0 end end,function()if aQ
and aQ.Parent then return aQ end aQ=Instance.new'Part'aQ.Name=
'TM_TargetPart_Debug'aQ.Anchored=true aQ.CanCollide=false aQ.CanQuery=false aQ.
CanTouch=false aQ.Size=Vector3.new(2,2,2)aQ.Transparency=0.4 aQ.Color=Color3.
fromRGB(255,50,50)aQ.Material=Enum.Material.Neon aQ.Parent=workspace return aQ
end,function()if aR and aR.Parent then return aR end if aR then pcall(function()
aR:Destroy()end)aR=nil end aR=Instance.new'Highlight'aR.Name=
'TM_EnemyHighlight_Debug'aR.FillColor=Color3.fromRGB(255,200,0)aR.
FillTransparency=0.5 aR.OutlineColor=Color3.fromRGB(255,0,0)aR.
OutlineTransparency=0 aR.Parent=workspace return aR end,function()if aS and aS.
Parent then return aS end aS=Instance.new'Part'aS.Name='TM_PathAdornee_Debug'aS.
Anchored=true aS.CanCollide=false aS.CanQuery=false aS.CanTouch=false aS.
Transparency=1 aS.Size=Vector3.new(1,1,1)aS.CFrame=CFrame.new(0,0,0)aS.Parent=
workspace return aS end,function()for a_,a0 in ipairs(aG)do pcall(function()a0:
Destroy()end)end table.clear(aG)aX=nil end local a4,a5=function()if ab.
IsInLobby()then return end local a4,a5=ag.GetTarget(),aH()local a6=a5 and aI(a5)
if not at or not a4 or not a4.Root then if aQ and aQ.Parent then aQ.CFrame=
CFrame.new(0,-1E3,0)end if aR and aR.Parent then aR.Enabled=false end else local
a7=aI(a4.Root)if a7 then local a8=a0()a8.CFrame=CFrame.new(a7)end local a8=a1()
if a4.Model and a4.Model.Parent then a8.Adornee=a4.Model a8.Enabled=true else a8
.Enabled=false end end local a7,a8=ag.GetWaypoints(),ag.GetPathInstance()if not
ar or not a7 or#a7==0 then a3()else local a9=tostring(a8)..'_'..tostring(#a7)if
aX~=a9 then a3()local b=a2()for ba=2,#a7 do local bb,bc=a7[ba-1].Position,a7[ba]
.Position local bd=(bc-bb).Magnitude if bd>0.01 then local be=Instance.new
'LineHandleAdornment'be.Name='TM_PathLine_Debug'be.Adornee=b be.Length=bd be.
Thickness=2 be.Transparency=0.3 be.Color3=Color3.fromRGB(0,255,120)be.ZIndex=0
be.CFrame=CFrame.lookAt(bb,bc)be.Parent=workspace aG[#aG+1]=be end end aX=a9 end
end if not as or not aK or not a6 then if aT then aT.Visible=false end if aU and
aU.Parent then aU.CFrame=CFrame.new(0,-1E3,0)end else local a9,b=a6+Vector3.new(
0,0.5,0),aK+Vector3.new(0,0.5,0)local ba=(b-a9).Magnitude if ba>=0.3 then if not
aT or not aT.Parent then local bb=a2()aT=Instance.new'LineHandleAdornment'aT.
Name='TM_ActualPath_Debug'aT.Adornee=bb aT.Thickness=3.5 aT.Transparency=0.15 aT
.Color3=Color3.fromRGB(0,230,255)aT.ZIndex=2 aT.Parent=workspace end aT.Length=
ba aT.CFrame=CFrame.lookAt(a9,b)aT.Visible=true if not aU or not aU.Parent then
aU=Instance.new'Part'aU.Name='TM_ActualMarker_Debug'aU.Anchored=true aU.
CanCollide=false aU.CanQuery=false aU.CanTouch=false aU.Shape=Enum.PartType.Ball
aU.Size=Vector3.new(1.3,1.3,1.3)aU.Transparency=0.2 aU.Material=Enum.Material.
Neon aU.Color=Color3.fromRGB(0,230,255)aU.Parent=workspace end aU.CFrame=CFrame.
new(b)else if aT then aT.Visible=false end if aU and aU.Parent then aU.CFrame=
CFrame.new(0,-1E3,0)end end end if not au or not aM or not a6 or not a4 then if
aV then aV.Visible=false end if aW and aW.Parent then aW.CFrame=CFrame.new(0,-
1E3,0)end else local a9,b,ba=aM.origin or(a6+Vector3.new(0,1.5,0)),aM.
directHitPos or aM.targetPos,aM.directBlocked if b then local bb=(b-a9).
Magnitude if bb>=0.2 then if not aV or not aV.Parent then local bc=a2()aV=
Instance.new'LineHandleAdornment'aV.Name='TM_BlockerRay_Debug'aV.Adornee=bc aV.
Thickness=3 aV.Transparency=0.2 aV.ZIndex=3 aV.Parent=workspace end aV.Length=bb
aV.Color3=ba and Color3.fromRGB(255,30,30)or Color3.fromRGB(50,255,50)aV.CFrame=
CFrame.lookAt(a9,b)aV.Visible=true if ba and aM.directHitPos then if not aW or
not aW.Parent then aW=Instance.new'Part'aW.Name='TM_BlockerHitMarker_Debug'aW.
Anchored=true aW.CanCollide=false aW.CanQuery=false aW.CanTouch=false aW.Shape=
Enum.PartType.Ball aW.Size=Vector3.new(1,1,1)aW.Material=Enum.Material.Neon aW.
Color=Color3.fromRGB(255,30,30)aW.Parent=workspace end aW.CFrame=CFrame.new(aM.
directHitPos)else if aW and aW.Parent then aW.CFrame=CFrame.new(0,-1E3,0)end end
else if aV then aV.Visible=false end if aW and aW.Parent then aW.CFrame=CFrame.
new(0,-1E3,0)end end end end end,function()if aQ then pcall(function()aQ:
Destroy()end)aQ=nil end if aR then pcall(function()aR:Destroy()end)aR=nil end if
aT then pcall(function()aT:Destroy()end)aT=nil end if aU then pcall(function()aU
:Destroy()end)aU=nil end if aV then pcall(function()aV:Destroy()end)aV=nil end
if aW then pcall(function()aW:Destroy()end)aW=nil end a3()if aS then pcall(
function()aS:Destroy()end)aS=nil end end function al.IsEnabled()return am end
function al.IsRunning()return an end function al.GetState()return av end
function al.GetScanInterval()return ao end function al.SetScanInterval(a6)if
type(a6)=='number'and a6>0.1 then ao=a6 end end function al.GetReachDistance()
return ap end function al.SetReachDistance(a6)if type(a6)=='number'and a6>=1
then ap=a6 end end function al.GetRepathDistance()return aq end function al.
SetRepathDistance(a6)if type(a6)=='number'and a6>=1 then aq=a6 ag.
SetRepathThreshold(a6)end end function al.SetAutoJumpOnStuck(a6)aD=a6 and true
or false end function al.IsAutoJumpOnStuckEnabled()return aD end function al.
SetStuckVelocityThreshold(a6)if type(a6)=='number'and a6>=1 then aE=a6 end end
function al.GetStuckVelocityThreshold()return aE end function al.SetPaused(a6)
local a7=a6 and true or false if a7==aF then return end aF=a7 if aF then local
a8,a9=ab.GetHumanoid(),aH()if a8 and a8.Parent and a9 then local b=aI(a9)if b
then pcall(function()a8:MoveTo(b)end)end end end end function al.IsPaused()
return aF end function al.IsPlannedPathVisualEnabled()return ar end function al.
SetPlannedPathVisual(a6)ar=a6==true if not ar then a3()end end function al.
IsActualPathVisualEnabled()return as end function al.SetActualPathVisual(a6)as=
a6==true if not as then if aT then aT.Visible=false end if aU and aU.Parent then
aU.CFrame=CFrame.new(0,-1E3,0)end end end function al.IsBlockerRayVisualEnabled(
)return au end function al.SetBlockerRayVisual(a6)au=a6==true if not au then if
aV then aV.Visible=false end if aW and aW.Parent then aW.CFrame=CFrame.new(0,-
1E3,0)end end end function al.IsTargetVisualEnabled()return at end function al.
SetTargetVisual(a6)at=a6==true if not at then if aQ and aQ.Parent then aQ.CFrame
=CFrame.new(0,-1E3,0)end if aR and aR.Parent then aR.Enabled=false end end end
function al.GetDebugInfo()local a6=aH()local a7,a8,a9,b,ba,bb=a6 and aI(a6),ag.
GetTarget(),'-',0,0,ag.GetWaypoints()if a8 and a8.Model then a9=a8.Model.Name or
'-'local bc=aI(a8.Root)if bc and a7 then b=(bc-a7).Magnitude ba=Vector3.new(bc.X
-a7.X,0,bc.Z-a7.Z).Magnitude end end local bc={directBlocked=false,blockerName=
'None',blockerDist=0}if aM then bc.directBlocked=aM.directBlocked==true if aM.
directHitPart then bc.blockerName=aM.directHitPart.Name or'Part'end if aM.
directHitPos and a7 then bc.blockerDist=(aM.directHitPos-a7).Magnitude end end
local bd,be=0,0 if a6 then local bf=a6.AssemblyLinearVelocity or a6.Velocity if
bf then bd=Vector3.new(bf.X,0,bf.Z).Magnitude be=bf.Y end end return{state=av,
enemyName=a9,enemyDist=b,enemyFlat=ba,hasTarget=a8~=nil,destMode=aw,nodeIndex=aL
,waypointCount=bb and#bb or 0,hasDestination=aK~=nil,blocker=bc,velocity=bd,
verticalVelocity=be,stuckTimer=aB}end function al.Toggle(a6,a7)if a6==am then
return end am=a6 if am then if not a7 then ad.EnableExclusive'AutoFarm'end if aN
then aN:Disconnect()aN=nil end an=true ay=0 az=false ax=0 ag.SetRepathThreshold(
aq)if not aO then aO=ab.OnEnemyChanged(function()if am and an and av~=ak.HOLD
then aY()end end)end if not aP then aP=ab.OnRespawn(function()ag.ClearTarget()av
=ak.NO_TARGET aM=nil aY()end)end if not aA then task.spawn(function()if ab.
ReadyDungeon()then aA=true end end)end task.defer(aY)aN=ai.Heartbeat:Connect(
function(a8)local a9,b=pcall(a_,a8)if not a9 then warn((
'[AutoFarm] Error in stepMovementLoop: %s'):format(tostring(b)))end a4()end)else
if aN then aN:Disconnect()aN=nil end an=false if aO then aO()aO=nil end if aP
then aP()aP=nil end local a8,a9=ab.GetHumanoid(),aH()if a8 and a8.Parent and a9
then local b=aI(a9)if b then pcall(function()a8:MoveTo(b)end)end end ag.
ClearTarget()av=ak.NO_TARGET aK=nil aw='None'aM=nil aB=0 ay+=1 az=false a5()end
end ad.Register('AutoFarm',al.Toggle,al.IsEnabled)ac.Register(function()al.
Toggle(false)a5()end)return al end function a.B()local aa,ab,ac,ad,ae,af,ag,ah=a
.load'a',a.load'd',a.load'f',a.load'k',a.load'c',a.load'b',a.load'A',{}local ai,
aj,ak,al={TargetReachDistance={get=function()return ag.GetReachDistance()end,set
=function(ai)ag.SetReachDistance(ai)end}},{Mob='Normal',Boss1='Boss 1',Boss2=
'Boss 2',Boss3='Boss 3'},{},{}function ah.OnConfigChanged(am)if type(am)~=
'function'then return end table.insert(al,am)end function ah.ReloadFromConfig()
local am,an=aa.contextData or{},ab.GetActive()local ao,ap=an~=activeConfig,am~=
lastDataRef ak=am lastDataRef=am activeConfig=an if(ao or ap)and#al>0 then for
aq,ar in ipairs(al)do pcall(ar,an)end end return ao or ap end local am=function(
)aa.contextData=ak end local an,ao=function()am()ab.SaveNow()end,function(an,ao)
if not(an and type(an)=='string'and#an>0)then return end if not aj[ao]then
return end ak[an]=ak[an]or{}ak[an][ao]=ak[an][ao]or{}local ap,aq=ak[an][ao],
false for ar in pairs(ai)do if ap[ar]==nil then ap[ar]=ai[ar].get()aq=true end
end return aq end function ah.SeedAllDefaults()local ap,aq={'Mob','Boss1',
'Boss2','Boss3'},false for ar,as in ipairs(ad.GetDungeons())do for at,au in
ipairs(ap)do if ao(as,au)then aq=true end end end if aq then an()end return aq
end function ah.SetField(ap,aq,ar,as)if not(ap and type(ap)=='string'and#ap>0)
then return end if not aj[aq]then return end if not ai[ar]then return end ao(ap,
aq)ak[ap][aq][ar]=as an()end function ah.ClearContext(ap,aq)if type(ap)~=
'string'or#ap==0 then return end if ak[ap]and ak[ap][aq]then ak[ap][aq]=nil if
next(ak[ap])==nil then ak[ap]=nil end an()end end function ah.GetField(ap,aq,ar)
local as=ai[ar]if not as then return nil end if type(ap)=='string'and#ap>0 then
local at=ak[ap]and ak[ap][aq]if at and at[ar]~=nil then return at[ar]end end
return as.get()end function ah.GetContext(ap,aq)local ar={}for as in pairs(ai)do
ar[as]=ah.GetField(ap,aq,as)end return ar end function ah.ApplyContext(ap,aq)
local ar=ah.GetContext(ap,aq)for as,at in pairs(ai)do at.set(ar[as])end end
function ah.ApplyCurrent()local ap,aq=ac.GetCurrentDungeonName(),ac.
GetCombatTargetKey()ah.ApplyContext(ap,aq)return ap,aq end function ah.GetFields
()local ap={}for aq in pairs(ai)do table.insert(ap,aq)end return ap end function
ah.GetTargets()local ap={}for aq,ar in ipairs{'Mob','Boss1','Boss2','Boss3'}do
table.insert(ap,{Key=ar,Display=aj[ar]})end return ap end function ah.
GetDisplayForTarget(ap)return aj[ap]or'Normal'end local ap,aq local ar=function(
ar)local as,at=ac.GetCurrentDungeonName(),ac.GetCombatTargetKey()if not as then
aq=nil ap=nil return end if not ar and as==aq and at==ap then return end ah.
ApplyContext(as,at)if at~='Mob'then ae.Notify('Auto Farm Context',as..' - '..(aj
[at]or at),2)end ap=at aq=as end function ah.Init()ah.ReloadFromConfig()ah.
SeedAllDefaults()am()ac.OnDungeonNameChanged(function()ar(false)end)ac.
OnBossIndexChanged(function()ar(false)end)ac.OnBossActiveChanged(function()ar(
false)end)task.spawn(function()while af.IsActive()do task.wait(1)if ah.
ReloadFromConfig()then ar(true)end end end)end return ah end function a.C()local
aa,ab,ac,ad,ae,af,ag=a.load'd',a.load'A',a.load'B',a.load'f',a.load'e',a.load'g'
,a.load'b'local ah=ae.RunService return function(ai,aj)local ak=aj:Section{Side=
'Left'}ak:Header{Name='Auto Farm'}ak:Toggle({Name='Enable Auto Farm',Default=ab.
IsEnabled(),Callback=aa.Wrap(function(al)ab.Toggle(al)end)},'Toggle_AutoFarm')ak
:Slider({Name='Rescan Interval',Suffix='s',Default=ab.GetScanInterval(),Minimum=
0.5,Maximum=5,Precision=1,Callback=aa.Wrap(function(al)ab.SetScanInterval(al)end
)},'Slider_AF_ScanInterval')ak:Slider({Name='Target Reach Distance',Suffix=
' std',Default=ab.GetReachDistance(),Minimum=2,Maximum=200,DisplayMethod='Round'
,Precision=0,Callback=aa.Wrap(function(al)ab.SetReachDistance(al)end)},
'Slider_AF_ReachDistance')ak:Slider({Name='Repath Distance',Suffix=' std',
Default=ab.GetRepathDistance(),Minimum=2,Maximum=20,DisplayMethod='Round',
Precision=0,Callback=aa.Wrap(function(al)ab.SetRepathDistance(al)end)},
'Slider_AF_RepathDistance')ak:Toggle({Name='Auto Jump When Stuck (Low Velocity)'
,Default=ab.IsAutoJumpOnStuckEnabled(),Callback=aa.Wrap(function(al)ab.
SetAutoJumpOnStuck(al)end)},'Toggle_AF_AutoJumpOnStuck')af.
PatchSliderLoadCallback(ak:Slider({Name='Stuck Velocity Threshold',Suffix=
' studs/s',Default=ab.GetStuckVelocityThreshold(),Minimum=2,Maximum=20,
DisplayMethod='Round',Precision=0,Callback=aa.Wrap(function(al)ab.
SetStuckVelocityThreshold(al)end)},'Slider_AF_StuckVelocity'))ak:Header{Name=
'Visual Debug'}ak:Toggle({Name='Show Blocker Ray (Red/Green)',Default=ab.
IsBlockerRayVisualEnabled(),Callback=aa.Wrap(function(al)ab.SetBlockerRayVisual(
al)end)},'Toggle_AF_BlockerRay')ak:Toggle({Name='Show Planned Path (Green)',
Default=ab.IsPlannedPathVisualEnabled(),Callback=aa.Wrap(function(al)ab.
SetPlannedPathVisual(al)end)},'Toggle_AF_PlannedPath')ak:Toggle({Name=
'Show Actual Destination (Cyan)',Default=ab.IsActualPathVisualEnabled(),Callback
=aa.Wrap(function(al)ab.SetActualPathVisual(al)end)},'Toggle_AF_ActualPath')ak:
Toggle({Name='Show Target Indicator (Red/Glow)',Default=ab.
IsTargetVisualEnabled(),Callback=aa.Wrap(function(al)ab.SetTargetVisual(al)end)}
,'Toggle_AF_TargetVisual')local al=aj:Section{Side='Right'}al:Header{Name=
'Auto Farm Monitor'}local am,an,ao,ap,aq,ar,as,at=al:Label{Text=
"State: <font color='rgb(160,160,160)'>NO_TARGET</font>"},al:Label{Text=
"Target: <font color='rgb(160,160,160)'>None</font>"},al:Label{Text=
"Distance: <font color='rgb(160,160,160)'>-</font>"},al:Label{Text=
"Velocity: <font color='rgb(160,160,160)'>0.0 studs/s</font>"},al:Label{Text=
"Blocker Detection: <font color='rgb(160,160,160)'>-</font>"},al:Label{Text=
[[Destination Mode: <font color='rgb(160,160,160)'>None</font>]]},(al:Label{Text
="Path Nodes: <font color='rgb(160,160,160)'>0</font>"})local au,av=function()
local au,av=ab.GetDebugInfo(),'160,160,160'if au.state=='CHASE'then av=
'0,255,120'elseif au.state=='HOLD'then av='255,200,0'elseif au.state=='BLOCKED'
then av='255,60,60'elseif au.state=='REPATHING'or au.state=='ACQUIRING_TARGET'or
au.state=='TRACKING_TARGET'then av='0,200,255'end pcall(function()am:UpdateName(
("State: <font color='rgb(%s)'>%s</font>"):format(av,au.state))end)pcall(
function()if au.hasTarget then an:UpdateName((
"Target: <font color='rgb(255,220,120)'>%s</font>"):format(au.enemyName))ao:
UpdateName((
[[Distance: <font color='rgb(0,255,255)'>%.1f studs (flat %.1f)</font>]]):
format(au.enemyDist,au.enemyFlat))else an:UpdateName
"Target: <font color='rgb(160,160,160)'>None</font>"ao:UpdateName
"Distance: <font color='rgb(160,160,160)'>-</font>"end end)pcall(function()local
aw=au.velocity or 0 local ax=aw>=12 and'0,255,120'or(aw>=10 and'255,200,0'or
'255,80,80')ap:UpdateName(("Velocity: <font color='rgb(%s)'>%.1f studs/s</font>"
):format(ax,aw))end)pcall(function()if au.hasTarget and au.blocker then if au.
blocker.directBlocked then aq:UpdateName((
[[Blocker: <font color='rgb(255,60,60)'>BLOCKED by '%s' (%.1fm)</font>]]):
format(au.blocker.blockerName,au.blocker.blockerDist))else aq:UpdateName
[[Blocker: <font color='rgb(0,255,120)'>CLEAR (Direct Line to Target)</font>]]
end else aq:UpdateName"Blocker: <font color='rgb(160,160,160)'>None</font>"end
end)pcall(function()local aw=au.destMode if au.nodeIndex then aw=(
'%s (Node #%d)'):format(au.destMode,au.nodeIndex)end local ax=au.destMode==
'Direct'and'0,255,255'or(au.destMode=='Waypoint'and'255,200,0'or(au.destMode==
'Hold'and'255,200,0'or'255,80,80'))ar:UpdateName((
"Destination Mode: <font color='rgb(%s)'>%s</font>"):format(ax,aw))end)pcall(
function()as:UpdateName((
[[Path Nodes: <font color='rgb(160,255,160)'>%d waypoints</font>]]):format(au.
waypointCount))end)end,0 at=ah.Heartbeat:Connect(function()local aw=os.clock()if
aw-av>=0.25 then av=aw au()end end)ag.Register(function()if at then at:
Disconnect()at=nil end end)local aw=aj:Section{Side='Right'}aw:Header{Name=
'Auto Farm Context'}local ax=aw:Label{Text=''}local ay,az,aA,aB,aC,aD,aE,aF,aG,
aH=function()local ay,az=ad.GetCurrentDungeonName(),ad.GetCombatTargetKey()ax:
UpdateName("Active: <font color='rgb(120,200,255)'>"..(ay or'Not in dungeon')..
'</font> / '..ac.GetDisplayForTarget(az))end,ad.GetCurrentDungeonName(),'Mob',
false local aI=function()return az==ad.GetCurrentDungeonName()and aA==ad.
GetCombatTargetKey()end aF=aw:Dropdown({Name='Edit Target',Options={'Normal',
'Boss 1','Boss 2','Boss 3'},Default=1,Required=true,Callback=aa.Wrap(function(aJ
)local aK={Normal='Mob',['Boss 1']='Boss1',['Boss 2']='Boss2',['Boss 3']='Boss3'
}aA=aK[aJ]or'Mob'aC()end)},'Dropdown_AutoFarmTarget')local aJ,aK,aL,aM,aN=false,
'Reset Context to Global',"<font color='rgb(255,80,80)'>Confirm Reset?</font>",3
local aO=function()if not aJ then return end aJ=false if aN then task.cancel(aN)
aN=nil end pcall(function()aH:UpdateName(aK)end)end aH=aw:Button{Name=aK,
Callback=aa.Wrap(function()if not aJ then aJ=true if aN then task.cancel(aN)end
aN=task.delay(aM,aO)pcall(function()aH:UpdateName(aL)end)return end aO()ac.
ClearContext(az,aA)aC()if aI()then ac.ApplyContext(az,aA)end end)}aE=aw:Label{
Text=''}aG=af.PatchSliderLoadCallback(aw:Slider({Name='Target Reach Distance',
Suffix=' std',Default=ac.GetField(az,aA,'TargetReachDistance'),Minimum=2,Maximum
=200,DisplayMethod='Round',Precision=0,Callback=aa.Wrap(function(aP)if aB then
return end ac.SetField(az,aA,'TargetReachDistance',aP)if aI()then ac.
ApplyContext(az,aA)end end)},'Slider_AF_CtxReachDistance'))aC=function()aB=true
aO()pcall(function()aG:UpdateValue(ac.GetField(az,aA,'TargetReachDistance'))end)
aB=false pcall(function()aE:UpdateName(
"Editing: <font color='rgb(150,255,150)'>"..(az or'Not in dungeon')..
'</font> / '..ac.GetDisplayForTarget(aA))end)end aD=function(aP)pcall(function()
aG:SetVisibility(aP)end)pcall(function()aH:SetVisibility(aP)end)end local aP,aQ=
function()aA='Mob'pcall(function()aF:UpdateSelection'Normal'end)aC()end,az~=nil
local aR=function()local aR=ad.GetCurrentDungeonName()local aS=aR~=nil az=aR if
aS and not aQ then aP()end aQ=aS ay()aC()aD(aS)end ad.OnDungeonNameChanged(aR)ad
.OnBossIndexChanged(ay)ad.OnBossActiveChanged(ay)ac.OnConfigChanged(function()az
=ad.GetCurrentDungeonName()ay()aC()aD(az~=nil)end)ay()aC()aD(az~=nil)end end
function a.D()local aa,ab,ac,ad,ae=a.load'e',a.load'f',a.load'b',a.load'r',a.
load'w'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax,ay,az,aA=
aa.UserInputService,aa.VirtualInputManager,game:GetService'VirtualUser',aa.
player,{},false,true,true,0.25,0.08,0.25,0,'Auto',false,0,{},{name='Scanning...'
,key=Enum.KeyCode.Q,slotKey='q',isBuff=false,cooldown=15,tool=nil},{name=
'Scanning...',key=Enum.KeyCode.E,slotKey='e',isBuff=false,cooldown=15,tool=nil},
'FullDamage',0,0,0 function aj.BindRadiusGetter(aB)getCombatRadius=aB end local
aB,aC,aD=function()if ar=='FullDamage'then return'FullDamage'elseif ar==
'BuffAndDamage'then return'BuffAndDamage'end return ax end,function(aB)local aC=
ai and ai:FindFirstChild'Backpack'if aC then for aD,aE in ipairs(aC:GetChildren(
))do local aF=aE:FindFirstChild'abilitySlot'if aF and aF.Value==aB then return
aE end end end local aD=ai and ai.Character if aD then for aE,aF in ipairs(aD:
GetChildren())do if aF:IsA'Tool'then local aG=aF:FindFirstChild'abilitySlot'if
aG and aG.Value==aB then return aF end end end end return nil end,function()
local aB=ai and ai.Character if aB then local aC=aB:FindFirstChild'busyCasting'
if aC and aC:IsA'BoolValue'and aC.Value==true then return true end end return
false end local aE=function()local aE=aB()if aE~='BuffAndDamage'or not buffSkill
then return 0 end if aq>0 and ay>0 then local aF=os.clock()-ay return math.max(0
,aq-aF)end local aF=buffSkill.tool or aC(buffSkill.slotKey)if aF and aF.Parent
then local aG=aF:FindFirstChild'cooldown'if aG and aG:IsA'ValueBase'then return
math.max(0,tonumber(aG.Value)or 0)end end if ay>0 then local aG,aH=buffSkill.
cooldown or 15,os.clock()-ay return math.max(0,aG-aH)end return 0 end local aF,
aG=function()local aF=aB()local aG={enabled=ak,isCasting=as,playstyle=aF,skillQ=
av,skillE=aw,buffSkill=buffSkill,damageSkill=damageSkill,cooldownRemaining=aE(),
enemyCount=at,targetName=nearestTargetInfo and nearestTargetInfo.name or nil,
targetDist=nearestTargetInfo and nearestTargetInfo.dist or nil}for aH,aI in
ipairs(au)do pcall(aI,aG)end end,function(aF,aG)if aF and aF.Parent then local
aH=aF:FindFirstChild'localEvent'if aH and aH:IsA'BindableEvent'then pcall(
function()aH:Fire()end)end end if aG then local aH=ab.GetKeyHoldTime()or ao
pcall(function()ag:SendKeyEvent(true,aG,false,game)task.wait(aH)ag:SendKeyEvent(
false,aG,false,game)end)end end function aj.ScanEquippedSkills()local aH,aI,aJ=
aC'q',aC'e',function(aH,aI,aJ,aK)if not aH then return{name=aI,key=aJ,slotKey=aK
,isBuff=false,cooldown=15,tool=nil}end local aL=aH.Name local aM=aL:lower()local
aN,aO,aP=aM:find'inner'~=nil,15,aH:FindFirstChild'cooldownLength'if aP and aP:
IsA'ValueBase'and tonumber(aP.Value)and tonumber(aP.Value)>0 then aO=tonumber(aP
.Value)end return{name=aL,key=aJ,slotKey=aK,isBuff=aN,cooldown=aO,tool=aH}end av
=aJ(aH,'Skill Q',Enum.KeyCode.Q,'q')aw=aJ(aI,'Skill E',Enum.KeyCode.E,'e')if av.
isBuff and not aw.isBuff then ax='BuffAndDamage'buffSkill=av damageSkill=aw
elseif aw.isBuff and not av.isBuff then ax='BuffAndDamage'buffSkill=aw
damageSkill=av else ax='FullDamage'buffSkill=nil damageSkill=nil end aA=os.
clock()aF()end local aH=function()local aH=ai and ai:FindFirstChild'Backpack'if
aH then aH.ChildAdded:Connect(function()task.delay(0.15,aj.ScanEquippedSkills)
end)aH.ChildRemoved:Connect(function()task.delay(0.15,aj.ScanEquippedSkills)end)
end end aH()if ai then ai.CharacterAdded:Connect(function()task.delay(0.5,
function()aH()aj.ScanEquippedSkills()end)end)end ab.OnRespawn(function()task.
delay(0.5,function()aH()aj.ScanEquippedSkills()end)end)task.spawn(function()task
.wait(0.5)aj.ScanEquippedSkills()end)local aI,aJ=function(aI)local aJ=ai and ai.
Character local aK=aJ and aJ:FindFirstChild'HumanoidRootPart'if not aK then
return{}end local aL,aM,aN=aK.Position,{},ab.GetTrackedEnemyData()for aO,aP in
ipairs(aN)do if aP and aP.Root and aP.Root.Parent then local aQ=aP.Humanoid or(
aP.Model and aP.Model:FindFirstChildOfClass'Humanoid')if aQ and aQ.Health>0 then
local aR,aS=aP.Root.Position.X-aL.X,aP.Root.Position.Z-aL.Z local aT=math.sqrt(
aR*aR+aS*aS)if aT<=aI then table.insert(aM,{data=aP,dist=aT,model=aP.Model,name=
(aP.Model and aP.Model.Name)or'Enemy',pos=aP.Root.Position})end end end end
table.sort(aM,function(aO,aP)return aO.dist<aP.dist end)return aM end,function()
local aI=aB()if not av.tool or not av.tool.Parent then av.tool=aC'q'end if not
aw.tool or not aw.tool.Parent then aw.tool=aC'e'end if aI=='BuffAndDamage'and
buffSkill and damageSkill then local aJ,aK,aL=buffSkill.tool or aC(buffSkill.
slotKey),damageSkill.tool or aC(damageSkill.slotKey),false if aq>0 then local aM
=os.clock()-ay aL=(ay==0 or aM>=aq)elseif aJ and aJ.Parent then local aM=aJ:
FindFirstChild'cooldown'if aM and aM:IsA'ValueBase'then aL=(tonumber(aM.Value)or
0)<=0.05 else local aN=os.clock()-ay aL=(ay==0 or aN>=buffSkill.cooldown)end
else local aM=os.clock()-ay aL=(ay==0 or aM>=buffSkill.cooldown)end if aL and
not aD()then as=true aG(aJ,buffSkill.key)ay=os.clock()task.wait(ap)aG(aK,
damageSkill.key)az=os.clock()as=false end else as=true if al then local aJ=av.
tool or aC'q'local aK=aJ and aJ:FindFirstChild'cooldown'local aL=not aK or((
tonumber(aK.Value)or 0)<=0.05)if aL and not aD()then aG(aJ,Enum.KeyCode.Q)end
end if am then local aJ=aw.tool or aC'e'local aK=aJ and aJ:FindFirstChild
'cooldown'local aL=not aK or((tonumber(aK.Value)or 0)<=0.05)if aL and not aD()
then aG(aJ,Enum.KeyCode.E)end end as=false end end local aK,aL=function()if
loopThread then return end aj.ScanEquippedSkills()loopThread=task.spawn(function
()while ak do if not ab.IsDead()and not af:GetFocusedTextBox()then local aK=(
getCombatRadius and getCombatRadius())or 15 local aL=aI(aK)at=#aL if#aL>0 then
nearestTargetInfo=aL[1]aJ()else nearestTargetInfo=nil as=false end aF()else as=
false at=0 nearestTargetInfo=nil aF()end local aK=aB()if aK=='BuffAndDamage'then
task.wait(0.08)else task.wait(an)end end as=false at=0 nearestTargetInfo=nil aF(
)loopThread=nil end)end,function()ak=false as=false at=0 nearestTargetInfo=nil
aF()end function aj.SetEnabled(aM)ak=aM and true or false if ak then aK()else
aL()end end function aj.IsEnabled()return ak end function aj.SetSkillQ(aM)al=aM
and true or false end function aj.IsSkillQEnabled()return al end function aj.
SetSkillE(aM)am=aM and true or false end function aj.IsSkillEEnabled()return am
end function aj.SetAutoAttack(aM)useAttack=aM and true or false end function aj.
IsAutoAttackEnabled()return useAttack end function aj.SetAutoFace(aM)autoFace=aM
and true or false if not autoFace and not ak then ad.SetEnabled(false)end end
function aj.IsAutoFaceEnabled()return autoFace end function aj.SetInterval(aM)if
type(aM)=='number'and aM>=0.05 then an=math.clamp(aM,0.05,2)end end function aj.
GetInterval()return an end function aj.SetBuffDelay(aM)if type(aM)=='number'and
aM>=0.05 then ap=math.clamp(aM,0.05,1.5)end end function aj.GetBuffDelay()return
ap end function aj.SetComboCooldownOverride(aM)if type(aM)=='number'and aM>=0
then aq=aM end end function aj.GetComboCooldownOverride()return aq end function
aj.SetPlaystyleMode(aM)if aM=='Auto'or aM=='FullDamage'or aM=='BuffAndDamage'
then ar=aM aF()end end function aj.GetPlaystyleMode()return ar end function aj.
GetEffectivePlaystyle()return aB()end function aj.GetSkillQInfo()return av end
function aj.GetSkillEInfo()return aw end function aj.GetBuffSkill()return
buffSkill end function aj.GetDamageSkill()return damageSkill end function aj.
GetComboCooldownRemaining()return aE()end function aj.GetStatus()local aM=aB()
return{enabled=ak,isCasting=as,playstyle=aM,skillQ=av,skillE=aw,buffSkill=
buffSkill,damageSkill=damageSkill,cooldownRemaining=aE(),enemyCount=at,
targetName=nearestTargetInfo and nearestTargetInfo.name or nil,targetDist=
nearestTargetInfo and nearestTargetInfo.dist or nil}end function aj.
OnStatusChanged(aM)if type(aM)=='function'then table.insert(au,aM)end end ac.
Register(function()aj.SetEnabled(false)end)return aj end function a.E()local aa,
ab,ac,ad,ae=a.load'e',a.load'f',a.load'b',a.load'A',a.load'q'local af,ag,ah,ai,
aj,ak,al,am,an,ao,ap=aa.player,{},false,2,0.15,'Disabled',{}function ag.
BindRadiusGetter(aq)ap=aq end local aq,ar=function()local aq={enabled=ah,state=
ak,targetName=an,targetDist=ao}for ar,as in ipairs(al)do pcall(as,aq)end end,
function(aq)local ar=af and af.Character local as=ar and ar:FindFirstChild
'HumanoidRootPart'if not as then return false,0,nil,nil end local at,au,av,aw,ax
,ay=as.Position,ab.GetTrackedEnemyData(),false,math.huge,0 for az,aA in ipairs(
au)do if aA and aA.Root and aA.Root.Parent then local aB=aA.Humanoid or(aA.Model
and aA.Model:FindFirstChildOfClass'Humanoid')if aB and aB.Health>0 then ax=ax+1
local aC,aD=aA.Root.Position.X-at.X,aA.Root.Position.Z-at.Z local aE=math.sqrt(
aC*aC+aD*aD)if aE<aw then aw=aE ay=(aA.Model and aA.Model.Name)or'Enemy'end if
aE<=aq then av=true end end end end local az=ae.GetTarget()if az and az.Root and
az.Root.Parent then local aA=az.Humanoid or(az.Model and az.Model:
FindFirstChildOfClass'Humanoid')if aA and aA.Health>0 then local aB,aC=az.Root.
Position.X-at.X,az.Root.Position.Z-at.Z local aD=math.sqrt(aB*aB+aC*aC)if aD<=aq
then av=true end if aD<aw then aw=aD ay=(az.Model and az.Model.Name)or'Target'
end end end return av,ax,ay,(aw<math.huge and aw or nil)end local as,at=function
()if am then return end am=task.spawn(function()while ah do if not ab.IsDead()
then local as=(ap and ap())or 15 if ad.GetReachDistance and ad.SetReachDistance
then if math.abs(ad.GetReachDistance()-as)>0.5 then ad.SetReachDistance(as)end
end local at=(ak=='InCombat')and(as+ai)or as local au,av,aw,ax=ar(at)an=aw ao=ax
if av==0 then ak='NoEnemies'if ad.IsEnabled()then ad.Toggle(false)end elseif au
then ak='InCombat'if ad.IsEnabled()then ad.Toggle(false)end else ak=
'Approaching'if not ad.IsEnabled()then ad.Toggle(true)end end aq()else if ad.
IsEnabled()then ad.Toggle(false)end end task.wait(aj)end if ad.IsEnabled()then
ad.Toggle(false)end ak='Disabled'an=nil ao=nil aq()am=nil end)end,function()ah=
false if ad.IsEnabled()then ad.Toggle(false)end ak='Disabled'an=nil ao=nil aq()
end function ag.SetEnabled(au)ah=au and true or false if ah then as()else at()
end end function ag.IsEnabled()return ah end function ag.GetStatus()return{
enabled=ah,state=ak,targetName=an,targetDist=ao}end function ag.OnStatusChanged(
au)if type(au)=='function'then table.insert(al,au)end end ac.Register(function()
ag.SetEnabled(false)end)return ag end function a.F()local aa,ab,ac,ad,ae,af,ag,
ah,ai,aj,ak=a.load'e',a.load'f',a.load'b',a.load'j',a.load'A',a.load'q',a.load
'w',a.load'm',a.load'r',a.load'D',a.load'E'local al,am,an,ao,ap,aq,ar,as,at,au,
av,aw,ax,ay,az,aA,aB,aC,aD,aE,aF,aG=aa.RunService,aa.player,{},false,'Disabled',
0,{},0,true,false,15,36,0.35,Color3.fromRGB(0,225,255),2,{}local aH=function()
return an.GetRadius()end aj.BindRadiusGetter(aH)an.autoSkill=aj an.autoApproach=
ak an.smartDodge=ag an.autoFarm=ae local aI,aJ=function()local aI={enabled=ao,
state=ap,hazardName=aC,escapeDist=aq,targetName=aD,targetDist=aE,radius=av}for
aJ,aK in ipairs(ar)do pcall(aK,aI)end end,RaycastParams.new()aJ.FilterType=Enum.
RaycastFilterType.Exclude aJ.IgnoreWater=true local aK,aL=function()local aK={}
if am and am.Character then table.insert(aK,am.Character)end local aL=workspace:
FindFirstChild'RaycastIgnore'if aL then table.insert(aK,aL)end aJ.
FilterDescendantsInstances=aK end,function()if aF and aF.Parent then return aF
end local aK=workspace.CurrentCamera or workspace local aL=aK:FindFirstChild
'SmartAutoPlay_RadiusVisual'if not aL then aL=Instance.new'Folder'aL.Name=
'SmartAutoPlay_RadiusVisual'aL.Parent=aK end aF=aL return aL end local aM,aN=
function()local aM=aL()while#aA<aw do local aN,aO=#aA+1,Instance.new'Part'aO.
Name=('RadiusSphere_%02d'):format(aN)aO.Shape=Enum.PartType.Ball aO.Size=Vector3
.new(ax,ax,ax)aO.Material=Enum.Material.Neon aO.Color=ay aO.Transparency=0.2 aO.
Anchored=true aO.CanCollide=false aO.CanTouch=false aO.CanQuery=false aO.
CastShadow=false aO.Parent=aM table.insert(aA,aO)end return aA end,function()for
aM,aN in ipairs(aA)do aN.Transparency=1 end end local aO=function()if not au
then aN()return end local aO=am and am.Character local aP=aO and aO:
FindFirstChild'HumanoidRootPart'if not aP or not aP.Parent then aN()return end
aK()local aQ,aR,aS=aM(),aP.Position,(2*math.pi)/aw local aT=workspace:Raycast(aR
,Vector3.new(0,-12,0),aJ)local aU=aT and(aT.Position.Y+(ax/2))or(aR.Y-2.8)for aV
=1,aw do local aW=(aV-1)*aS local aX,aY,aZ=aR.X+math.cos(aW)*av,aR.Z+math.sin(aW
)*av,aQ[aV]if aZ and aZ.Parent then aZ.Position=Vector3.new(aX,aU,aY)aZ.
Transparency=0.2 aZ.Color=ay end end end local aP,aQ,aR,aS,aT=function()if aG
then return end aG=al.RenderStepped:Connect(function()pcall(aO)end)end,function(
)if aG then aG:Disconnect()aG=nil end aN()end,function(aP)local aQ=am and am.
Character local aR=aQ and aQ:FindFirstChild'HumanoidRootPart'if not aR then
return false,0,nil,nil,nil end local aS,aT,aU,aV,aW,aX,aY=aR.Position,ab.
GetTrackedEnemyData(),false,math.huge,0 for aZ,a_ in ipairs(aT)do if a_ and a_.
Root and a_.Root.Parent then local a0=a_.Humanoid or(a_.Model and a_.Model:
FindFirstChildOfClass'Humanoid')if a0 and a0.Health>0 then aW=aW+1 local a1,a2=
a_.Root.Position.X-aS.X,a_.Root.Position.Z-aS.Z local a3=math.sqrt(a1*a1+a2*a2)
if a3<aV then aV=a3 aX=(a_.Model and a_.Model.Name)or'Enemy'aY=a_.Root.Position
end if a3<=aP then aU=true end end end end local aZ=af.GetTarget()if aZ and aZ.
Root and aZ.Root.Parent then local a_=aZ.Humanoid or(aZ.Model and aZ.Model:
FindFirstChildOfClass'Humanoid')if a_ and a_.Health>0 then local a0,a1=aZ.Root.
Position.X-aS.X,aZ.Root.Position.Z-aS.Z local a2=math.sqrt(a0*a0+a1*a1)if a2<=aP
then aU=true end if a2<aV then aV=a2 aX=(aZ.Model and aZ.Model.Name)or'Target'aY
=aZ.Root.Position end end end return aU,aW,aX,(aV<math.huge and aV or nil),aY
end,function(aP,aQ,aR)if not aQ then return false end if ag.GetHazardCount and
ag.GetHazardCount()==0 then return false end local aS=aQ-aP local aT=Vector3.
new(aS.X,0,aS.Z)local aU=aT.Magnitude if aU<0.5 then return false end local aV,
aW=aT.Unit,math.min(aU,aR or 35)for aX=2,aW,2.5 do local aY=aP+aV*aX local aZ,a_
=ah.IsPointInAnyHazard(aY)if aZ then local a0=(a_ and a_.Name)or'Active Hazard'
return true,a0,aY end end return false end local aU=function()if aT and aT.
Parent then return aT end local aU=workspace:FindFirstChild'FirstPart'if not aU
then local aV=workspace:FindFirstChild'dungeon'if aV then aU=aV:FindFirstChild(
'FirstPart',true)end end if not aU then aU=workspace:FindFirstChild('FirstPart',
true)end if aU and aU:IsA'BasePart'then aT=aU return aU end return nil end local
aV=function()local aV,aW=ag.GetBoss1ArenaCenter and ag.GetBoss1ArenaCenter(),ag.
GetBoss1ArenaRadius and ag.GetBoss1ArenaRadius()if aV and aW and aW>0 then
return aV,aW end local aX=aU()if aX then local aY=math.max(aX.Size.X,aX.Size.Z)/
2 return aX.Position,math.max(20,aY-2.5)end return nil,nil end local aW=function
(aW)if not aW then return true end local aX,aY=aV()if not aX or not aY then
return true end local aZ=(Vector3.new(aW.X-aX.X,0,aW.Z-aX.Z)).Magnitude return
aZ<=(aY-1.5)end local aX,aZ=function()if aB then return end aB=task.spawn(
function()while ao do if ab.IsDead()then if ae.IsEnabled()then ae.Toggle(false)
end ap='Dead'aC=nil aq=0 aD=nil aE=nil aI()task.wait(0.2)continue end local aX=(
ag.IsInDanger and ag.IsInDanger())or(ag.IsDodging and ag.IsDodging())if aX then
as=os.clock()if not ae.IsPaused()then ae.SetPaused(true)end local aY,aZ,a_,a0=ag
.GetCurrentSafeSpot()ap='Dodging'aC=a_ or'Hazard'aq=a0 or 0 aI()task.wait(0.04)
continue end local aZ=av local a_=(ap=='InCombat')and(aZ+az)or aZ local a0,a1,a2
,a3,a4=aR(a_)aD=a2 aE=a3 aC=nil aq=0 local a5=am and am.Character local a6=a5
and a5:FindFirstChild'HumanoidRootPart'local a7,a8,a9=a6 and a6.Position,ab.
IsBossActive(),ab.GetCurrentBossIndex()local b=a8 and(a9<=1)and(aU()~=nil)local
ba=not b or aW(a7)if b and not ba then a0=false end if a1==0 then if not ae.
IsPaused()then ae.SetPaused(true)end ai.SetEnabled(false)ap='RoomCleared'elseif
a0 then if not ae.IsPaused()then ae.SetPaused(true)end if ae.GetReachDistance
and ae.SetReachDistance then if math.abs(ae.GetReachDistance()-aZ)>0.5 then ae.
SetReachDistance(aZ)end end ai.SetEnabled(true)ap='InCombat'else local bb,bc=aS(
a7,a4,35)local bd=(os.clock()-as<0.6)and(ag.GetHazardCount and ag.
GetHazardCount()>0)if bb or bd then if not ae.IsPaused()then ae.SetPaused(true)
end ai.SetEnabled(true)ap='WaitingHazard'aC=bc or'Active Hazard'else ai.
SetEnabled(false)local be=(b and not ba)and 2.5 or aZ if ae.GetReachDistance and
ae.SetReachDistance then if math.abs(ae.GetReachDistance()-be)>0.5 then ae.
SetReachDistance(be)end end if not ae.IsEnabled()then ae.SetPaused(false)ae.
Toggle(true,true)else ae.SetPaused(false)end if b and not ba then ap=
'EnteringArena'else ap='Approaching'end end end aI()task.wait(0.06)end aB=nil
end)end,function()ao=false if aB then task.cancel(aB)aB=nil end ae.SetPaused(
false)if ae.IsEnabled()then ae.Toggle(false)end aj.SetEnabled(false)ai.
SetEnabled(false)ag.StopEngine()ap='Disabled'aC=nil aq=0 aD=nil aE=nil aI()end
function an.SetMasterEnabled(a_)local a0=a_ and true or false if a0==ao then
return end ao=a0 if ao then ad.EnableExclusive'SmartAutoPlay'ag.StartEngine()ag.
SetAutoDodge(true)if at then aj.SetEnabled(true)else aj.SetEnabled(false)end if
ae.GetReachDistance and ae.SetReachDistance then ae.SetReachDistance(av)end ae.
SetPaused(false)ae.Toggle(true,true)aX()else aZ()end end function an.
IsMasterEnabled()return ao end function an.SetAutoSkillEnabled(a_)at=a_ and true
or false if ao then aj.SetEnabled(at)else aj.SetEnabled(false)end aI()end
function an.IsAutoSkillEnabled()return at end function an.GetMasterStatus()
return{enabled=ao,state=ap,autoSkillEnabled=at,hazardName=aC,escapeDist=aq,
targetName=aD,targetDist=aE,radius=av}end function an.OnMasterStatusChanged(a_)
if type(a_)=='function'then table.insert(ar,a_)end end function an.
SetShowRadiusCircle(a_)au=a_ and true or false if au then aP()else aQ()end end
function an.IsShowRadiusCircleEnabled()return au end function an.SetRadius(a_)if
type(a_)=='number'and a_>0 then av=math.clamp(a_,2,100)end end function an.
GetRadius()return av end function an.SetSphereSize(a_)if type(a_)=='number'and
a_>0 then ax=math.clamp(a_,0.1,3)for a0,a1 in ipairs(aA)do a1.Size=Vector3.new(
ax,ax,ax)end end end function an.GetSphereSize()return ax end ad.Register(
'SmartAutoPlay',an.SetMasterEnabled,an.IsMasterEnabled)ab.OnRespawn(function()if
ao then task.delay(0.5,function()if not ao then return end ag.StartEngine()ag.
SetAutoDodge(true)if at then aj.SetEnabled(true)end if ae.GetReachDistance and
ae.SetReachDistance then ae.SetReachDistance(av)end ae.SetPaused(false)if not ae
.IsEnabled()then ae.Toggle(true,true)end end)end end)ac.Register(function()an.
SetMasterEnabled(false)aQ()for a_,a0 in ipairs(aA)do pcall(function()a0:Destroy(
)end)end table.clear(aA)if aF then pcall(function()aF:Destroy()end)aF=nil end
end)return an end function a.G()local aa,ab,ac=a.load'g',a.load'd',a.load'F'
return function(ad,ae)local af=ae:Section{Side='Left'}af:Header{Name=
'Smart Auto Play - Master System'}local ag,ah=af:Toggle({Name=
'Enable Smart Auto Play',Default=ac.IsMasterEnabled(),Callback=ab.Wrap(function(
ag)ac.SetMasterEnabled(ag)end)},'Toggle_SAP_Master'),af:Label{Text=
"Status: <font color='rgb(160, 160, 160)'>Disabled</font>"}af:Header{Name=
'Combat Radius R & Visuals'}af:Toggle({Name='Show Radius Circle (Spheres)',
Default=ac.IsShowRadiusCircleEnabled(),Callback=ab.Wrap(function(ai)ac.
SetShowRadiusCircle(ai)end)},'Toggle_SAP_RadiusCircle')aa.
PatchSliderLoadCallback(af:Slider({Name='Combat Radius R',Suffix=' std',Default=
ac.GetRadius(),Minimum=4,Maximum=100,DisplayMethod='Round',Precision=0,Callback=
ab.Wrap(function(ai)ac.SetRadius(ai)end)},'Slider_SAP_Radius'))aa.
PatchSliderLoadCallback(af:Slider({Name='Sphere Size',Suffix=' std',Default=ac.
GetSphereSize(),Minimum=0.1,Maximum=2,DisplayMethod='Round',Precision=2,Callback
=ab.Wrap(function(ai)ac.SetSphereSize(ai)end)},'Slider_SAP_SphereSize'))local ai
=ae:Section{Side='Right'}ai:Header{Name='Combat & Skill Options'}local aj=ac.
autoSkill ai:Toggle({Name='Enable Smart Auto Skill',Default=ac.
IsAutoSkillEnabled(),Callback=ab.Wrap(function(ak)ac.SetAutoSkillEnabled(ak)end)
},'Toggle_SAP_AutoSkill')local ak,al,am={'Auto (Detect)','Buff + Damage',
'Full Damage'},1,aj.GetPlaystyleMode()if am=='BuffAndDamage'then al=2 elseif am
=='FullDamage'then al=3 end ai:Dropdown({Name='Playstyle Mode',Options=ak,
Default=al,Required=true,Callback=ab.Wrap(function(an)if an=='Buff + Damage'then
aj.SetPlaystyleMode'BuffAndDamage'elseif an=='Full Damage'then aj.
SetPlaystyleMode'FullDamage'else aj.SetPlaystyleMode'Auto'end end)},
'Dropdown_SAP_PlaystyleMode')ai:Toggle({Name='Auto Jump When Stuck',Default=ac.
autoFarm.IsAutoJumpOnStuckEnabled(),Callback=ab.Wrap(function(an)ac.autoFarm.
SetAutoJumpOnStuck(an)end)},'Toggle_SAP_AutoJumpOnStuck')aa.
PatchSliderLoadCallback(ai:Slider({Name='Cast Interval',Suffix=' s',Default=aj.
GetInterval(),Minimum=0.05,Maximum=1,DisplayMethod='Round',Precision=2,Callback=
ab.Wrap(function(an)aj.SetInterval(an)end)},'Slider_SAP_CastInterval'))aa.
PatchSliderLoadCallback(ai:Slider({Name='Buff Cast Delay',Suffix=' s',Default=aj
.GetBuffDelay(),Minimum=0.05,Maximum=1,DisplayMethod='Round',Precision=2,
Callback=ab.Wrap(function(an)aj.SetBuffDelay(an)end)},'Slider_SAP_BuffDelay'))aa
.PatchSliderLoadCallback(ai:Slider({Name='Combo CD Override (0 = Auto)',Suffix=
' s',Default=aj.GetComboCooldownOverride(),Minimum=0,Maximum=60,DisplayMethod=
'Round',Precision=1,Callback=ab.Wrap(function(an)aj.SetComboCooldownOverride(an)
end)},'Slider_SAP_ComboCDOverride'))ai:Button{Name=
'Scan / Refresh Equipped Skills',Callback=function()aj.ScanEquippedSkills()end}
ai:Header{Name='Real-time System Monitor'}local an,ao,ap,aq,ar,as=ai:Label{Text=
"State: <font color='rgb(160, 160, 160)'>Disabled</font>"},ai:Label{Text=
"Target: <font color='rgb(160, 160, 160)'>None</font>"},ai:Label{Text=
[[Smart Dodge: <font color='rgb(160, 160, 160)'>Offline</font>]]},ai:Label{Text=
[[Playstyle: <font color='rgb(160, 160, 160)'>Scanning...</font>]]},ai:Label{
Text="Skills: <font color='rgb(160, 160, 160)'>Scanning...</font>"},ai:Label{
Text="Combo CD: <font color='rgb(0, 255, 120)'>Ready</font>"}local at,au=
function(at)pcall(function()if not at.enabled then ah:UpdateName
"Status: <font color='rgb(160, 160, 160)'>Disabled</font>"an:UpdateName
"State: <font color='rgb(160, 160, 160)'>Disabled</font>"ao:UpdateName
"Target: <font color='rgb(160, 160, 160)'>None</font>"ap:UpdateName
[[Smart Dodge: <font color='rgb(160, 160, 160)'>Offline</font>]]elseif at.state
=='Dodging'then local au=string.format(
"Status: <font color='rgb(255, 65, 65)'>\u{1f6e1}\u{fe0f} DODGING! Hazard: %s (%.1f std)</font>"
,at.hazardName or'Hazard',at.escapeDist or 0)ah:UpdateName(au)an:UpdateName
"State: <font color='rgb(255, 65, 65)'>\u{1f6e1}\u{fe0f} DODGING (Safe Spot Escape)</font>"
ao:UpdateName(at.targetName and string.format('Target: %s (%.1f std)',at.
targetName,at.targetDist or 0)or'Target: In Range')ap:UpdateName(string.format(
[[Smart Dodge: <font color='rgb(255, 65, 65)'>ACTIVE (Dodging %s)</font>]],at.
hazardName or'Danger'))elseif at.state=='InCombat'then local au=at.targetName
and string.format('%s (%.1f std)',at.targetName,at.targetDist or 0)or'In Range'
ah:UpdateName(string.format(
"Status: <font color='rgb(0, 255, 120)'>\u{2694}\u{fe0f} IN COMBAT: Casting on %s</font>"
,au))an:UpdateName
"State: <font color='rgb(0, 255, 120)'>\u{2694}\u{fe0f} IN COMBAT (Casting & Holding)</font>"
ao:UpdateName('Target: '..au)ap:UpdateName
[[Smart Dodge: <font color='rgb(0, 255, 120)'>Standby (Ready Frame-0)</font>]]
elseif at.state=='WaitingHazard'then local au,av=at.targetName and string.
format('%s (%.1f std)',at.targetName,at.targetDist or 0)or'Target',string.
format(
"Status: <font color='rgb(255, 170, 0)'>\u{23f3} WAITING: %s blocking path (Holding Safe Spot)</font>"
,at.hazardName or'Skill')ah:UpdateName(av)an:UpdateName(string.format(
"State: <font color='rgb(255, 170, 0)'>\u{23f3} Waiting Hazard (%s)</font>",at.
hazardName or'Skill'))ao:UpdateName('Target: '..au)ap:UpdateName
[[Smart Dodge: <font color='rgb(0, 255, 120)'>Holding Safe Spot</font>]]elseif
at.state=='EnteringArena'then local au=at.targetName and string.format(
'%s (%.1f std)',at.targetName,at.targetDist or 0)or'Boss 1'local av=string.
format(
"Status: <font color='rgb(0, 210, 255)'>\u{1f3df}\u{fe0f} ENTERING ARENA: Dropping inside Boss 1 Arena (%s)</font>"
,au)ah:UpdateName(av)an:UpdateName
"State: <font color='rgb(0, 210, 255)'>\u{1f3df}\u{fe0f} Entering Boss 1 Arena</font>"
ao:UpdateName('Target: '..au)ap:UpdateName
[[Smart Dodge: <font color='rgb(0, 255, 120)'>Standby (Ready Frame-0)</font>]]
elseif at.state=='Approaching'then local au=at.targetName and string.format(
'%s (%.1f std)',at.targetName,at.targetDist or 0)or'Searching'ah:UpdateName(
string.format(
"Status: <font color='rgb(0, 210, 255)'>\u{1f3c3} APPROACHING: Moving to %s</font>"
,au))an:UpdateName
"State: <font color='rgb(0, 210, 255)'>\u{1f3c3} APPROACHING (AutoFarm Pathfind)</font>"
ao:UpdateName('Target: '..au)ap:UpdateName
[[Smart Dodge: <font color='rgb(0, 255, 120)'>Standby (Ready Frame-0)</font>]]
elseif at.state=='RoomCleared'then ah:UpdateName
"Status: <font color='rgb(255, 200, 0)'>\u{1f3c6} ROOM CLEARED: Waiting for enemies</font>"
an:UpdateName
"State: <font color='rgb(255, 200, 0)'>\u{1f3c6} Room Cleared</font>"ao:
UpdateName'Target: None (All Dead)'ap:UpdateName
"Smart Dodge: <font color='rgb(0, 255, 120)'>Standby</font>"elseif at.state==
'Dead'then ah:UpdateName
"Status: <font color='rgb(220, 60, 60)'>\u{1f480} DEAD: Waiting for respawn</font>"
an:UpdateName"State: <font color='rgb(220, 60, 60)'>\u{1f480} Dead</font>"ao:
UpdateName'Target: None'ap:UpdateName
"Smart Dodge: <font color='rgb(160, 160, 160)'>Paused</font>"else ah:UpdateName
"Status: <font color='rgb(160, 160, 160)'>Idle</font>"an:UpdateName
"State: <font color='rgb(160, 160, 160)'>Idle</font>"ao:UpdateName'Target: None'
ap:UpdateName"Smart Dodge: <font color='rgb(0, 255, 120)'>Standby</font>"end end
)end,function(at)pcall(function()local au,av,aw=at.playstyle,(ac.
IsAutoSkillEnabled())if not av then aw=
[[<font color='rgb(160, 160, 160)'>Disabled (Auto Skill Off)</font>]]elseif au==
'BuffAndDamage'then aw=
"<font color='rgb(0, 210, 255)'>\u{1f6e1}\u{fe0f} Buff + Damage (Inner Buff Combo)</font>"
else aw=
"<font color='rgb(255, 180, 50)'>\u{2694}\u{fe0f} Full Damage (Q & E Spam)</font>"
end aq:UpdateName('Playstyle: '..aw)local ax,ay=at.skillQ or{},at.skillE or{}
local az,aA,aB,aC=ax.isBuff and"<font color='rgb(0, 210, 255)'>[Buff]</font>"or
"<font color='rgb(255, 100, 100)'>[Dame]</font>",ay.isBuff and
"<font color='rgb(0, 210, 255)'>[Buff]</font>"or
"<font color='rgb(255, 100, 100)'>[Dame]</font>",string.format('%.1fs',ax.
cooldown or 15),string.format('%.1fs',ay.cooldown or 15)ar:UpdateName(string.
format('Skills: Q: %s %s (%s) | E: %s %s (%s)',ax.name or'None',az,aB,ay.name or
'None',aA,aC))if not av then as:UpdateName
"Combo CD: <font color='rgb(160, 160, 160)'>Disabled</font>"elseif au==
'BuffAndDamage'then local aD=at.cooldownRemaining or 0 if aD>0 then as:
UpdateName(string.format(
"Combo CD: <font color='rgb(255, 160, 50)'>\u{23f3} %.1fs remaining</font>",aD))
else as:UpdateName
"Combo CD: <font color='rgb(0, 255, 120)'>\u{26a1} Ready to Cast</font>"end else
as:UpdateName
[[Combo CD: <font color='rgb(160, 160, 160)'>N/A (Full Damage Mode)</font>]]end
end)end ac.OnMasterStatusChanged(function(av)at(av)pcall(function()if ag and ag.
GetState and ag:GetState()~=av.enabled then ag:UpdateState(av.enabled)end end)
au(aj.GetStatus())end)at(ac.GetMasterStatus())aj.OnStatusChanged(au)au(aj.
GetStatus())end end function a.H()return function(aa,ab)a.load'i'(aa,ab)a.load
'x'(aa,ab)a.load'y'(aa,ab)a.load'C'(aa,ab)a.load'G'(aa,ab)end end function a.I()
local aa,ab,ac,ad,ae=a.load'e',a.load'c',a.load'k',a.load'f',a.load'b'local af,
ag,ah,ai,aj,ak,al,am,an,ao,ap,aq=aa.player.Name,false,false,false,
'Desert Temple','Easy',false,true,false,3,{[77649408247578]=true,[3220968688]=
true,[2414851778]=true},{}local ar,as,at=function()return ap[game.PlaceId]==true
end,function()for ar,as in ipairs(aq)do pcall(as,aj,ac.GetAllowedDifficulties(aj
))end end,function()if ah then return end ah=true ai=false task.spawn(function()
local ar,as=pcall(function()local ar=game:GetService'ReplicatedStorage':
WaitForChild('remotes',15)if not ar then error'remotes not found'end local as=ac
.GetLevelReq(aj,ak)pcall(function()ar:WaitForChild('createLobby',10):
InvokeServer(aj,ak,as,al,am,an)end)if ai then return end task.wait(ao)if ai then
return end if am then pcall(function()ar:WaitForChild('addPlayerToWhitelist',10)
:FireServer(af)end)if ai then return end task.wait(ao)if ai then return end end
local at=0 while at<10 do local au=workspace:FindFirstChild'games'and workspace.
games:FindFirstChild'inLobby'if au then break end task.wait(0.5)at=at+0.5 if ai
then return end end if ai then return end task.wait(ao)if ai then return end
pcall(function()ar:WaitForChild('startDungeon',10):FireServer()end)end)ah=false
if ai then return end if ar then ab.Notify('Auto Join','Joined: '..aj,3)else ab.
Notify('Auto Join','Join failed: '..tostring(as),4)end end)end local au,av=
function()while ae.IsActive()do task.wait(0.5)if ag and not ah and ar()and ad.
IsInLobby()then at()end end end,{}function av.Toggle(aw)ag=aw if ag then ab.
Notify('Auto Join','Enabled',2)else ai=true ab.Notify('Auto Join','Stopped',2)
end end function av.SetDungeon(aw)if type(aw)~='string'or#aw==0 then return end
aj=aw if not ac.IsDifficultyAllowed(aj,ak)then local ax=ac.
GetAllowedDifficulties(aj)if#ax>0 then ak=ax[1]end end as()end function av.
SetDifficulty(aw)if type(aw)~='string'then return end if ac.IsDifficultyAllowed(
aj,aw)then ak=aw end end function av.SetHardcore(aw)al=aw end function av.
SetPrivate(aw)am=aw end function av.SetWaveDefence(aw)an=aw end function av.
SetDelay(aw)ao=aw end function av.GetSelectedDungeon()return aj end function av.
GetSelectedDifficulty()return ak end function av.GetAllowedDifficulties()return
ac.GetAllowedDifficulties(aj)end function av.OnDungeonChanged(aw)if type(aw)==
'function'then table.insert(aq,aw)end end av.JoinNow=function()task.spawn(
function()at()end)end task.spawn(au)ae.Register(function()av.Toggle(false)end)
return av end function a.J()local aa,ab,ac,ad,ae,af,ag,ah=a.load'f',a.load'c',{[
77649408247578]=true,[115445507767090]=true},false,false,false,3,
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
aw=au:match'^(%d+):(%d+)$'if av and aw then return tonumber(av)*60+tonumber(aw)
end local ax=tonumber(au)if ax then return ax end end return nil end,{},function
()if not an then ab.Notify('Auto Retry','Remote command invalid',3)return false
end local ar,as=pcall(an)if ar then ab.Notify('Auto Retry','Retrying dungeon!',3
)return true end ab.Notify('Auto Retry','Trigger failed: '..tostring(as),3)
return false end function as.Start()if af then return end af=true ag=false aj=
false task.spawn(function()while ae or ah do if ae then local au=0 if ao then
local av,aw=pcall(ao)if av and typeof(aw)=='Instance'and aw.Parent then au=#aw:
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
M()local aa,ab,ac,ad,ae,af,ag=a.load'g',a.load'I',a.load'J',a.load'K',a.load'L',
a.load'd',a.load'k'return function(ah,ai)local aj,ak,al=ai:Section{Side='Left'},
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
PatchSliderLoadCallback(aj:Slider({Name='Delay',Default=3,Minimum=0,Maximum=15,
DisplayMethod='Round',Precision=1,Suffix='s',Callback=af.Wrap(function(as)ab.
SetDelay(as)end)},'Slider_JoinDelay'))aj:Button{Name='Join Now',Callback=
function()ab.JoinNow()end}ak:Toggle({Name='Auto Start',Default=false,Callback=af
.Wrap(function(as)ac.Toggle(as)end)},'Toggle_AutoStart')aa.
PatchSliderLoadCallback(ak:Slider({Name='Start Delay',Default=ac.GetDelay(),
Minimum=0,Maximum=15,DisplayMethod='Round',Precision=1,Suffix='s',Callback=af.
Wrap(function(as)ac.SetDelay(as)end)},'Slider_AutoStartDelay'))ak:Toggle({Name=
'Auto Start Lobby',Default=false,Callback=af.Wrap(function(as)ad.Toggle(as)end)}
,'Toggle_AutoStartLobby')ak:Toggle({Name='Auto Retry',Default=false,Callback=af.
Wrap(function(as)ae.Toggle(as)end)},'Toggle_AutoRetry')ak:Button{Name=
'Manual Retry',Callback=function()task.spawn(function()ae.RetryNow()end)end}ak:
Toggle({Name='Retry on Time Low',Default=ae.GetTimeRetryEnabled(),Callback=af.
Wrap(function(as)ae.SetTimeRetryEnabled(as)end)},'Toggle_RetryTimeLow')aa.
PatchSliderLoadCallback(ak:Slider({Name='Retry Time Threshold',Default=ae.
GetTimeRetryThreshold(),Minimum=5,Maximum=120,DisplayMethod='Round',Precision=0,
Suffix='s',Callback=af.Wrap(function(as)ae.SetTimeRetryThreshold(as)end)},
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
return false,0 end local aw={}for ax,ay in pairs(au)do if type(ay)=='table'and#
ay>0 then aw[ax]=ay end end if next(aw)==nil then return false,0 end local ax=
pcall(function()av:FireServer(aw)end)if not ax then return false,0 end return
true,0 end local aw=av function ae.SetSellAction(ax)if type(ax)=='function'then
aw=ax end end local ax=function()local ax,ay=pcall(function()return game:
GetService'ReplicatedStorage':WaitForChild('remotes',5):WaitForChild(
'reloadInvy',5)end)if not ax or not ay then return nil,
'Could not find remote reloadInvy'end local az,aA=pcall(function()return ay:
InvokeServer()end)if not az or aA==nil then return nil,
'Could not read inventory'end local aB,aC,aD,aE={},{},function(aB)return aB.
sellPrice~=nil or aB.UniqueItemID~=nil or aB.rarity~=nil end,function(aB)local
aC=tostring(aB)local aD=tonumber(aC:match'_(%d+)$')if not aD then return nil,nil
end local aE=aC:match'^(.-)_%d+$'return aE,aD end local aF=function(aF,aG,aH,aI)
local aJ=false if type(aF.equipped)=='boolean'then aJ=aF.equipped elseif type(aF
.equipped)=='table'then for aK,aL in pairs(aF.equipped)do if aL==true then aJ=
true break end end end local aK=au(aF.rarity)or'Common'table.insert(aB,{Type=an[
aG]or aG or'Unknown',Category=aH or aG,Index=aI,Name=tostring(aF.name or aF.
UniqueItemID or'?'),Rarity=aK,RarityValue=ar[aK],SellPrice=tonumber(aF.sellPrice
)or 0,UniqueItemID=aF.UniqueItemID,Equipped=aJ,LevelReq=tonumber(aF.levelReq)or
0,Raw=aF})end local function aG(aH,aI,aJ,aK)if type(aH)~='table'then return end
if aC[aH]then return end aC[aH]=true if aD(aH)then aF(aH,aI,aJ,aK)return end for
aL,aM in pairs(aH)do if an[aL]then aG(aM,aL,nil,nil)elseif type(aM)=='table'and
aD(aM)then local aN,aO=aE(aL)aG(aM,aI,aN,aO)else aG(aM,aI,aJ,aK)end end end aG(
aA,nil,nil,nil)return aB end function ae.ShouldSellItem(ay)if not ay then return
false end if ah and ay.Equipped then return false end if next(ai)and as[ay.
Rarity]and not ai[ay.Rarity]then return false end if next(aj)and ay.Type and not
aj[ay.Type]then return false end local az,aA=ak,al if next(az)==nil then az={[1]
=true}aA='None'end local aB=ay.LevelReq or 0 if aA=='Below'then local aC for aD
in pairs(az)do if not aC or aD>aC then aC=aD end end if aC and aB>aC then return
false end elseif aA=='Above'then local aC for aD in pairs(az)do if not aC or aD<
aC then aC=aD end end if aC and aB<aC then return false end else if not az[aB]
then return false end end return true end function ae.HasAnyFilter()return next(
ai)~=nil or next(aj)~=nil or next(ak)~=nil end function ae.CountMatches()local
ay,az=ax()if not ay then return{total=0,matching=0,error=az or
'Error reading inventory'}end local aA,aB=0,{}for aC,aD in ipairs(ay)do aB[aD.
Type]=(aB[aD.Type]or 0)+1 if ae.ShouldSellItem(aD)then aA+=1 end end return{
total=#ay,matching=aA,byCategory=aB}end function ae.SellItems()if am then return
nil end am=true local ay,az,aA={sold=0,skipped=0,gold=0,error=nil},ax()if not az
then ay.error=aA or'Error reading inventory'am=false return ay end local aB={}
for aC,aD in ipairs(az)do if ae.ShouldSellItem(aD)then if aD.Index then ay.sold
+=1 local aE=aD.Category or aD.Type aB[aE]=aB[aE]or{}table.insert(aB[aE],aD.
Index)end else ay.skipped+=1 end end local aC,aD=pcall(aw,aB)if aC and aD and
type(aD)=='number'then ay.gold=aD end am=false return ay end function ae.
SetLevelReqMode(ay)if ay=='Below'or ay=='Above'then al=ay else al='None'end end
function ae.GetLevelReqMode()return al end function ae.SetExcludeEquipped(ay)ah=
ay end function ae.GetExcludeEquipped()return ah end function ae.SetRarityFilter
(ay)ai={}if type(ay)=='table'then for az,aA in pairs(ay)do if aA==true and type(
az)=='string'then local aB=au(az)or az ai[aB]=true elseif type(aA)=='string'then
local aB=au(aA)or aA ai[aB]=true end end elseif type(ay)=='string'then local az=
au(ay)or ay ai[az]=true end end function ae.GetRarityFilter()local ay={}for az
in pairs(ai)do table.insert(ay,az)end return ay end function ae.SetTypeFilter(ay
)aj={}if type(ay)=='table'then for az,aA in pairs(ay)do if aA==true and type(az)
=='string'then aj[az]=true elseif type(aA)=='string'then aj[aA]=true end end
elseif type(ay)=='string'then aj[ay]=true end end function ae.GetTypeFilter()
local ay={}for az in pairs(aj)do table.insert(ay,az)end return ay end function
ae.SetLevelReqExactFilter(ay)ak={}if type(ay)=='table'then for az,aA in pairs(ay
)do if aA==true then local aB=tonumber(az)if aB then ak[aB]=true end else local
aB=tonumber(aA)if aB then ak[aB]=true end end end elseif type(ay)=='string'or
type(ay)=='number'then local az=tonumber(ay)if az then ak[az]=true end end end
function ae.GetLevelReqExactFilter()local ay={}for az in pairs(ak)do table.
insert(ay,tostring(az))end return ay end local ay=function()return not ad[game.
PlaceId]end local az=function()if not af then return end if ag then return end
if not ay()then return end if not ae.HasAnyFilter()then return end ag=true task.
spawn(function()task.wait(2.5)if not af or not ay()then return end local az=ae.
SellItems()if az and az.sold and az.sold>0 then ab.Notify('AutoSell',(
'Auto-sold %d item(s) on dungeon start.'):format(az.sold),3)end end)end function
ae.Toggle(aA)af=aA and true or false if af and ay()and not ag then az()end end
function ae.IsEnabled()return af end ac.OnDungeonNameChanged(function(aA)ag=
false if aA then az()end end)ac.OnLobbyChanged(function(aA)if not aA then ag=
false az()else ag=false end end)task.spawn(function()while aa.IsActive()do task.
wait(1)if af and ay()and not ag then az()end end end)aa.Register(function()af=
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
GetRarityFilter()local av,aw=#au>0 and table.concat(au,', ')or'All (No filter)',
#au>0 and'255, 220, 120'or'160, 160, 160'pcall(function()ak:UpdateName(
"Rarities: <font color='rgb("..aw..")'>"..av..'</font>')end)local ax=ab.
GetTypeFilter()local ay,az=#ax>0 and table.concat(ax,', ')or'All (No filter)',#
ax>0 and'255, 220, 120'or'160, 160, 160'pcall(function()al:UpdateName(
"Item Types: <font color='rgb("..az..")'>"..ay..'</font>')end)local aA,aB=ab.
GetLevelReqMode(),ab.GetLevelReqExactFilter()table.sort(aB,function(aC,aD)return
(tonumber(aC)or 0)<(tonumber(aD)or 0)end)local aC,aD='1 (Safe Fallback)',
'255, 160, 80'if#aB>0 then aD='255, 220, 120'if aA=='Below'then aC=
'Below (\u{2264} '..aB[#aB]..')'elseif aA=='Above'then aC='Above (\u{2265} '..aB
[1]..')'else aC='Exact ('..table.concat(aB,', ')..')'end end pcall(function()am:
UpdateName("Level Req: <font color='rgb("..aD..")'>"..aC..'</font>')end)local aE
=ab.GetExcludeEquipped()local aF,aG=aE and'0, 255, 0'or'255, 80, 80',aE and
'Yes (Protected)'or'No (May Sell)'pcall(function()an:UpdateName(
"Exclude Equipped: <font color='rgb("..aF..")'>"..aG..'</font>')end)end af:
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
Multi=av as.Settings.Required=not av local aw=ab.GetLevelReqExactFilter()if#aw>0
then if not av and#aw>1 then as:UpdateSelection(aw[1])else as:UpdateSelection(aw
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
aw,ax=(
[[Found <font color='rgb(0,255,0)'>%d</font>/<font color='rgb(240,240,240)'>%d</font> matching items.
]]
):format(av.matching,av.total),true for ay,az in ipairs{'Weapons','Helmets',
'Chests','Abilities'}do local aA=av.byCategory and av.byCategory[az]if aA then
if ax then aw..=az..': '..aA else aw..=' \u{2022} '..az..': '..aA end ax=false
end end pcall(function()au:UpdateName(aw)end)end)end}af:Button{Name='Sell Now',
Callback=function()task.spawn(function()pcall(function()au:UpdateName
'Reading inventory...'end)local av=ab.CountMatches()if not av then pcall(
function()au:UpdateName
[[<font color='rgb(255,80,80)'>A sale is already running.</font>]]end)return end
if av.error then pcall(function()au:UpdateName(
"<font color='rgb(255,80,80)'>Error: "..av.error..'</font>')end)return end local
aw,ax=ab.HasAnyFilter(),''if not aw then ax=
'\n\n<font color="rgb(255,80,80)"><b>\u{26a0} NO filter selected!</b> This will sell the ENTIRE inventory (except equipped items).</font>'
end local ay=(
[[Sell <font color='rgb(0,255,0)'>%d</font>/<font color='rgb(240,240,240)'>%d</font> matching item(s) with current filters.]]
):format(av.matching,av.total)ay=ay..ax..'\n\nAre you sure?'ad:Dialog{Title=
'Confirm Sale',Description=ay,Buttons={{Name='Confirm',Callback=function()task.
spawn(function()pcall(function()au:UpdateName'Reading inventory...'end)ac.
Notify('AutoSell','Selling...',2)local az=ab.SellItems()if not az then pcall(
function()au:UpdateName
[[<font color='rgb(255,80,80)'>A sale is already running.</font>]]end)return end
if az.error then pcall(function()au:UpdateName(
"<font color='rgb(255,80,80)'>Error: "..az.error..'</font>')end)return end local
aA=(
[[Done: <font color='rgb(0,255,0)'>%d</font> sold, <font color='rgb(255,200,0)'>%d</font> skipped, <font color='rgb(255,220,120)'>%s</font> gold earned.]]
):format(az.sold,az.skipped,tostring(az.gold))pcall(function()au:UpdateName(aA)
end)end)end},{Name='Cancel'}}}end)end}ao()end end function a.P()local aa,ab,ac,
ad,ae,af,ag,ah,ai,aj,ak,al,am,an=a.load'e',a.load'f',{},0.05,0.8,Color3.fromRGB(
0,255,0),'PlayerHitbox_ESP',Color3.fromRGB(255,0,0),'EnemyHitbox_ESP',0.01,
'Real','Custom',false local ao,ap,aq,ar,as,at,au,av=ak,1.5,aa.player,false,ak,
1.5,function(ao,ap,aq)local ar=Instance.new'SelectionBox'ar.Name=ao ar.Adornee=
ap ar.Color3=aq ar.LineThickness=ad*4 ar.SurfaceColor3=aq ar.SurfaceTransparency
=ae ar.Parent=ap end local aw=function(aw,ax,ay,az,aA)if not ax or not ax.Parent
then return end local aB,aC=aw..'_Proxy',ax:FindFirstChild(aw)local aD=ax:
FindFirstChild(aB)if az==al then if aC and aC:IsA'SelectionBox'and aC.Adornee==
ax then aC:Destroy()end if not aD then aD=Instance.new'Part'aD.Name=aB aD.
Anchored=true aD.CanCollide=false aD.CanQuery=false aD.CanTouch=false aD.
Transparency=1 aD.Parent=ax au(aw,aD,ay)end local aE=ax.Size local aF=math.max(
math.abs(aE.X),math.abs(aE.Y),math.abs(aE.Z))local aG=math.max(aF*aA,1)aD.Size=
Vector3.new(aG,aG,aG)aD.CFrame=ax.CFrame else if aD then aD:Destroy()end if aC
and aC:IsA'SelectionBox'and aC.Adornee~=ax then aC:Destroy()aC=nil end if not aC
or not aC:IsA'SelectionBox'or aC.Adornee~=ax then au(aw,ax,ay)end end end local
ax,ay=function()local ax=aq and aq.Character local ay=ax and ax:FindFirstChild
'HumanoidRootPart'if not ay or not ay.Parent then return end aw(ag,ay,af,ao,ap)
end,function()if an then task.cancel(an)an=nil end local ax=function(ax)if not
ax then return end for ay,az in ipairs(ax:GetDescendants())do if az.Name==ag or
az.Name==ag..'_Proxy'then az:Destroy()end end end ax(aq and aq.Character)for ay,
az in ipairs(aa.Players:GetPlayers())do ax(az.Character)end end function ac.
TogglePlayerHitbox(az)if az==am then return end am=az if am then if an then task
.cancel(an)an=nil end an=task.spawn(function()while am do local aA,aB=pcall(ax)
if not aA then if os.clock()-(ac.lastPlayerWarn or 0)>5 then ac.lastPlayerWarn=
os.clock()warn('[PlayerHitbox] error:',tostring(aB))end end aa.RunService.
Heartbeat:Wait()end end)else ay()end end function ac.IsPlayerHitboxEnabled()
return am end function ac.GetPlayerHitboxMode()return ao end function ac.
SetPlayerHitboxMode(az)if az~=ak and az~=al then return end ao=az end function
ac.GetPlayerHitboxScale()return ap end function ac.SetPlayerHitboxScale(az)ap=az
end local az,aA=function()for az,aA in ipairs(ab.GetTrackedEnemyData())do local
aB=aA.Root if aB and aB.Parent then aw(ai,aB,ah,as,at)end end end,function()if
av then task.cancel(av)av=nil end for az,aA in ipairs(game:GetService'Workspace'
:GetDescendants())do local aB,aC=aA:FindFirstChild(ai),aA:FindFirstChild(ai..
'_Proxy')if aB then aB:Destroy()end if aC then aC:Destroy()end end end function
ac.ToggleEnemyHitbox(aB)if aB==ar then return end ar=aB if ar then if av then
task.cancel(av)av=nil end av=task.spawn(function()while ar do local aC,aD=pcall(
az)if not aC then if os.clock()-(ac.lastEnemyWarn or 0)>5 then ac.lastEnemyWarn=
os.clock()warn('[EnemyHitbox] error:',tostring(aD))end end aa.RunService.
Heartbeat:Wait()end end)else aA()end end function ac.IsEnemyHitboxEnabled()
return ar end function ac.GetEnemyHitboxMode()return as end function ac.
SetEnemyHitboxMode(aB)if aB~=ak and aB~=al then return end as=aB end function ac
.GetEnemyHitboxScale()return at end function ac.SetEnemyHitboxScale(aB)at=aB end
local aB,aC,aD,aE,aF,aG=Color3.fromRGB(255,0,0),'SkillESP',{},false,false local
aH=function()table.clear(aD)local aH=game:GetService'Workspace'for aI,aJ in
ipairs(aH:GetChildren())do aD[aJ]=true end aE=true end aH()local aI,aJ=function(
aI)local aJ=aq.Character if not aJ then return false end local aK=aI while aK do
if aK==aJ then return true end aK=aK.Parent end return false end,function(aI)
local aJ=aI while aJ do if aD[aJ]then return true end aJ=aJ.Parent end return
false end local aK=function(aK)if not aE then return end if aJ(aK)then return
end if aI(aK)then return end if aK:FindFirstChild(aC)then return end local aL=
Instance.new'SelectionBox'aL.Name=aC aL.Adornee=aK aL.Color3=aB aL.SurfaceColor3
=aB aL.SurfaceTransparency=0.8 aL.Parent=aK end local aL,aM=function()if not aE
then return end local aL=game:GetService'Workspace'for aM,aN in ipairs(aL:
GetChildren())do if aN:IsA'BasePart'then aK(aN)end for aO,aP in ipairs(aN:
GetDescendants())do if aP:IsA'BasePart'then aK(aP)end end end end,function()if
aG then task.cancel(aG)aG=nil end local aL=game:GetService'Workspace'for aM,aN
in ipairs(aL:GetDescendants())do local aO=aN:FindFirstChild(aC)if aO then aO:
Destroy()end end end function ac.ToggleSkillHitbox(aN)if aN==aF then return end
aF=aN if aF then if aG then task.cancel(aG)aG=nil end aG=task.spawn(function()
while aF do local aO,aP=pcall(aL)if not aO and os.clock()-(ac.lastSkillWarnH or
0)>5 then ac.lastSkillWarnH=os.clock()warn('[SkillHitbox] error:',tostring(aP))
end task.wait(aj)end end)else aM()end end function ac.IsSkillHitboxEnabled()
return aF end return ac end function a.Q()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak
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
ak()al()ar()at()end local av,aw=function()for av,aw in ipairs(ae)do pcall(
function()aw:Disconnect()end)end table.clear(ae)local av,aw=function(av)if not
av then return end table.insert(ae,av.ChildAdded:Connect(function(aw)if not ad
then return end if not aj(aw)then pcall(function()aw:Destroy()end)end end))table
.insert(ae,av.DescendantAdded:Connect(function(aw)if not ad then return end if
aw.Name:lower():find'wooden plank'then local ax=aw.Parent while ax and ax~=av
and ax~=workspace do if ax:IsA'Model'then pcall(function()ax:Destroy()end)return
end ax=ax.Parent end end local ax=aw.Parent while ax and ax~=av and ax~=
workspace do if(ax:IsA'Model'or ax:IsA'Folder')and ax.Name:lower():find'border'
then pcall(function()aw:Destroy()end)break end ax=ax.Parent end if aw:IsA'Model'
and aq(aw)then pcall(function()aw:Destroy()end)return elseif aw:IsA'BasePart'and
ap(aw.Position)then local ay=aw:FindFirstAncestorOfClass'Model'if ay and ay~=
workspace and ay~=av then pcall(function()ay:Destroy()end)else pcall(function()
aw:Destroy()end)end return end if aw:IsA'BasePart'and(aw.Name=='Meshes/Snow'or
aw.Name:lower():find'meshes/snow'or aw.Name:lower()=='snow')then as(aw)end end))
end,workspace:FindFirstChild'Map'or workspace:FindFirstChild'dungeon'or
workspace:FindFirstChild'Dungeon'if aw then av(aw)end table.insert(ae,workspace.
ChildAdded:Connect(function(ax)if not ad then return end local ay=ax.Name:lower(
)if ay=='map'or ay=='dungeon'then av(ax)task.delay(0.2,au)end end))end,function(
)for av,aw in pairs(ag)do if av and av.Parent then pcall(function()av.
Transparency=aw end)end end table.clear(ag)for av,aw in pairs(af)do if av and av
.Parent then pcall(function()av.CanCollide=aw.CanCollide av.CanTouch=aw.CanTouch
end)end end table.clear(af)end function ac.Toggle(ax)if ax==ad then return end
ad=ax and true or false if ad then au()av()if loopThread then task.cancel(
loopThread)loopThread=nil end loopThread=task.spawn(function()while ad do task.
wait(ah)pcall(au)end end)else for ay,az in ipairs(ae)do pcall(function()az:
Disconnect()end)end table.clear(ae)if loopThread then task.cancel(loopThread)
loopThread=nil end aw()end end function ac.IsEnabled()return ad end ab.Register(
function()ac.Toggle(false)end)return ac end function a.S()local aa,ab,ac,ad,ae,
af,ag=a.load'd',a.load'P',a.load'Q',a.load'R',a.load'g',{'Custom Hitbox',
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
GetService'HttpService'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at=aa.
Folder..'/settings/webhook.json',{},'',false,false,false,'',{'Tier6'},{common=
9807270,uncommon=43520,rare=3447003,epic=10181046,legendary=16766720,secret=
15158332,ultimate=15158332,mythic=15158332},{common=1,uncommon=2,rare=3,epic=4,
legendary=5,secret=6,ultimate=6,mythic=6},10181046,{{match='northen',prefix=
'Valhalla'},{match='northern',prefix='Valhalla'}},16766720 local au,av=function(
)local au=ac.GetCurrentDungeonName()if not au or au==''then return nil end local
av=string.lower(au)for aw,ax in ipairs(aq)do if string.find(av,ax.match,1,true)
then return ax.prefix end end return nil end,{legendary=true,secret=true,
ultimate=true,mythic=true}local aw,ax,ay,az=function(aw)if not aw then return
false end if av[tostring(aw.rarity or''):lower()]then return true end local ax=
au()if ax and ax~=''then local ay=tostring(aw.itemName or'')return string.sub(ay
,1,#ax)==ax end return false end,{'Tier1','Tier2','Tier3','Tier4','Tier5',
'Tier6'},function(aw)local ax=tonumber(tostring(aw or''):match'Tier(%d+)')return
ax or 6 end local aA,aB=function()if az then return az end az={}for aA,aB in
ipairs(am)do az[ay(aB)]=true end return az end,{uncommon=1,common=2,rare=3,epic=
4,legendary=5,secret=6}local aC,aD,aE,aF=function(aC)if not aC then return nil
end local aD=tonumber(tostring(aC.tier or''):match'tier(%d+)')if aD then return
aD end if aC.secret==true then return 6 end return aB[string.lower(tostring(aC.
rarity or''))]end,function()local aC=game:GetService'Players'.LocalPlayer if not
aC then return'?'end if aC.Name and aC.Name~=''then return aC.Name end return aC
.DisplayName or'?'end,function()local aC=game:GetService'Players'.LocalPlayer if
not aC then return nil end local aD=aC:FindFirstChild'XP'if aD and aD:IsA
'IntValue'then return aD.Value end return nil end local function aG(aH,aI,aJ)aJ=
aJ or 12 if aJ<0 then return nil end local aK=aH:FindFirstChild(aI)if aK then
return aK end for aL,aM in ipairs(aH:GetChildren())do local aN=aG(aM,aI,aJ-1)if
aN then return aN end end return nil end local aH,aI=function()local aH=game:
GetService'Players'.LocalPlayer if not aH or not aH:FindFirstChild'PlayerGui'
then return'?'end local aI=aH.PlayerGui:FindFirstChild'playerStatus'if not aI
then return'?'end local aJ=aG(aI,'levelBorder')if not aJ then return'?'end local
aK=aJ:FindFirstChild'level'if aK and aK:IsA'TextLabel'then return aK.Text end
return'?'end,false local aJ=function()if aF~=nil or aI then return end aI=true
task.spawn(function()local aJ=os.clock()+8 while aF==nil and os.clock()<aJ do aF
=aE()if aF~=nil then break end task.wait(0.25)end aI=false end)end local aK,aL=
function()aF=aE()if aF==nil then aJ()end ac.SetDungeonStartTime(nil)end,function
()if not ac.GetDungeonStartTime()then ac.SetDungeonStartTime(os.clock())end if
aF==nil then aJ()end end local aM,aN,aO,aP,aQ,aR=function()if at then return end
local aM=function(aM)if aM then aK()else aL()end end aM(ac.IsInLobby())at=ac.
OnLobbyChanged(aM)end,function(aM)aM=math.max(0,math.floor(aM or 0))local aN,aO=
math.floor(aM/60),aM%60 return string.format('%d:%02d',aN,aO)end,function()if
not(isfile and isfile(af))then return end local aM,aN=pcall(function()return ae:
JSONDecode(readfile(af))end)if aM and type(aN)=='table'then ah=type(aN.url)==
'string'and aN.url or''ai=aN.enabled==true ak=aN.pingEnabled==true al=type(aN.
pingMention)=='string'and aN.pingMention or''local aO=aN.pingTiers if type(aO)==
'string'then aO={aO}end if type(aO)=='table'then local aP={}for aQ,aR in ipairs(
aO)do if table.find(ax,aR)and not table.find(aP,aR)then table.insert(aP,aR)end
end if#aP>0 then am=aP end end az=nil end end,function()if not(isfile and
writefile)then return end pcall(function()writefile(af,ae:JSONEncode{url=ah,
enabled=ai,pingEnabled=ak,pingMention=al,pingTiers=am})end)end,function(aM)local
aN={}for aO,aP in ipairs(aM or{})do local aQ,aR=aP.itemName or'Unknown',aw(aP)if
aR then aQ='\u{2b50} '..aQ end local aS={}if aP.itemType and aP.itemType~='gold'
then table.insert(aS,aP.itemType)end if aP.rarity then table.insert(aS,aP.rarity
)end if#aS>0 then table.insert(aN,string.format('%s (%s)',tostring(aQ),table.
concat(aS,', ')))else table.insert(aN,tostring(aQ))end end return table.concat(
aN,'\n')end,function(aM)if not aM then return false end local aN=aC(aM)if not aN
then return false end return aA()[aN]==true end local aS=function(aS)if not ak
or al==''then return false end for aT,aU in ipairs(aS or{})do if aR(aU)then
return true end end return false end local aT=function(aT,aU)local aV,aW=
tonumber(aT.gold)or 0,{}for aX,aZ in ipairs(aT.items or{})do if aZ.itemName and
aZ.itemName~='gold'then table.insert(aW,aZ)end end local aX,aZ,a_,a0,a1=ap,false
,function(aX,aZ)if aX==nil then return aZ end if aZ==nil then return aX end
return(ao[aX]or 0)>=(ao[aZ]or 0)and aX or aZ end for a2,a3 in ipairs(aW)do local
a4=tostring(a3.rarity or''):lower()if aw(a3)then aZ=true a0=a_(a0,a4)end if an[
a4]~=nil then a1=a_(a1,a4)end end if aZ then aX=a0 and(an[a0]or ar)or ar elseif
a1 then aX=an[a1]end aU=aU or{}local a2,a3=tostring(aU.level or'?'),tonumber(aU.
expGained)local a4,a5,a6=a3 and string.format('+%s XP',tostring(a3))or'?',aN(aU.
duration),{}if a3 then table.insert(a6,a4)end if aV>0 then table.insert(a6,
string.format('+%s gold',tostring(aV)))end local a7,a8=#a6>0 and table.concat(a6
,'  ')or'',#aW>0 and aQ(aW)or'None'local a9=a8 if a7~=''then a9=a7..(a8~='None'
and('\n'..a8)or'')end local b,ba={{name='Player',value=string.format(
'%s (lv %s)',aD(),a2),inline=true},{name='Map',value=ac.GetCurrentDungeonName()
or'Unknown',inline=true},{name='Time',value=a5,inline=true},{name='Rewards',
value=a9,inline=false}},'You cleared the dungeon and received your rewards!'if
aS(aW)then ba=ba..'\n\n'..al end return{embeds={{title='Dungeon WIN',description
=ba,color=aX,fields=b,timestamp=DateTime.now():ToIsoDate()}}}end local aU=
function(aU,aV)if ah==''or string.find(ah,'^https://discord%.com/api/webhooks/')
==nil then return false,'Invalid webhook URL'end local aW=aT(aU,aV)local aX,aZ=
pcall(function()return ae:JSONEncode(aW)end)if not aX then return false,
'Could not encode payload'end local a_,a0=pcall(function()return request{Url=ah,
Method='POST',Headers={['Content-Type']='application/json',['User-Agent']=
'ScriptHub-DungeonQuest (https://www.roblox.com)'},Body=aZ}end)if not a_ then
return false,'Request error: '..tostring(a0)end if a0 and a0.Success then return
true end local a1=a0 and a0.StatusCode or'?'return false,'HTTP '..tostring(a1)
end function ag.SetUrl(aV)ah=aV or''aP()end function ag.GetUrl()return ah end
function ag.SetEnabled(aV)ai=aV==true aP()end function ag.IsEnabled()return ai
end function ag.SetPingEnabled(aV)ak=aV==true aP()end function ag.IsPingEnabled(
)return ak end function ag.SetPingMention(aV)al=aV or''aP()end function ag.
GetPingMention()return al end function ag.SetPingTiers(aV)if type(aV)~='table'
then return end local aW,aX={},{}local aZ=function(aZ)if not aX[aZ]and table.
find(ax,aZ)then aX[aZ]=true table.insert(aW,aZ)end end for a_,a0 in pairs(aV)do
if type(a_)=='string'and a0==true then aZ(a_)elseif type(a0)=='string'then aZ(a0
)end end if#aW==0 then return end am=aW az=nil aP()end function ag.GetPingTiers(
)return am end function ag.GetPingTierOptions()return ax end function ag.Send()
if not ai then ab.Notify('Webhook','Notifications is disabled',3)return end
local aV,aW=aU({items={{itemName='Test Reward',rarity='common',itemType='item'}}
,gold=0},{level=aH(),expGained=0,duration=0})if aV then ab.Notify('Webhook',
'Test sent successfully',3)else ab.Notify('Webhook','Send failed: '..tostring(aW
),4)end end function ag.Init()if aj then return end local aV local aW=pcall(
function()aV=game:GetService'ReplicatedStorage':WaitForChild('remotes',30)end)if
not aW or not aV then warn'[Webhook] Could not find ReplicatedStorage.remotes'
return end local aX=aV:FindFirstChild'cloneRewardGui'if not aX then warn
'[Webhook] Could not find remote cloneRewardGui'return end as=aX.OnClientEvent:
Connect(function(aZ)if not ai then return end aJ()local a_=ac.
GetDungeonStartTime()and ac.GetDungeonElapsed()or 0 task.spawn(function()task.
wait(1.5)local a0,a1=(aE())if aF~=nil and a0~=nil then a1=math.max(0,a0-aF)end
local a2,a3=aU(aZ,{level=aH(),expGained=a1,duration=a_})if not a2 then ab.
Notify('Webhook WIN','Send failed: '..tostring(a3),4)end end)end)aj=true ab.
Notify('Webhook','Webhook notifications ready',2)aM()end aO()ad.Register(
function()if as then as:Disconnect()as=nil end if at then at()at=nil end aj=
false end)return ag end function a.U()local aa=a.load'T'return function(ab,ac)
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
,ab,ac=a.load'd',a.load'g',a.load'W'return function(ad,ae)local af=ae:Section{
Side='Left'}af:Header{Name='Anti AFK'}af:Toggle({Name='Anti AFK',Default=ac.
IsEnabled(),Callback=aa.Wrap(function(ag)if ag then ac.Start()else ac.Stop()end
end)},'Toggle_AntiAFK')ab.PatchSliderLoadCallback(af:Slider({Name=
'Interval (gi\u{e2}y)',Default=ac.GetInterval(),Minimum=5,Maximum=300,
DisplayMethod='Round',Precision=0,Callback=aa.Wrap(function(ag)ac.SetInterval(ag
)end)},'Slider_AntiAFKInterval'))end end function a.Y()return function(aa,ab)a.
load'S'(aa,ab)a.load'U'(aa,ab)a.load'X'(aa,ab)end end function a.Z()local aa,ab,
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
Hide()end)end ah()return ae end function a._()local aa,ab,ac=a.load'a',a.load'd'
,a.load'Z'return function(ad,ae)local af=aa.Folder local ag=af..
'/settings/autoload.txt'local ah,ai,aj=function()if isfile and isfile(ag)then
return readfile(ag)end return nil end,function(ah)ab.SetActive(ah)end,ae:Section
{Side='Left'}aj:Header{Name='Configs'}local ak,al,am local an=function(an)local
ao=aa:RefreshConfigList()al:ClearOptions()al:InsertOptions(ao)if an then if not
al:IsOption(an)then al:InsertOptions{an}end al:UpdateSelection(an)end end aj:
Input{Name='Config Name',Placeholder='Name',AcceptedCharacters='All',Callback=
function(ao)ak=ao end}al=aj:Dropdown{Name='Select Config',Multi=false,Required=
false,Options=aa:RefreshConfigList(),Callback=function(ao)ai(ao)end}local ao=ah(
)if ao and ao~=''then if not al:IsOption(ao)then al:InsertOptions{ao}end al:
UpdateSelection(ao)ai(ao)end aj:Button{Name='Create Config',Callback=function()
if not ak or string.gsub(ak,' ','')==''then ad:Notify{Title='Interface',
Description='Config name cannot be empty.'}return end local ap,aq=aa:SaveConfig(
ak)if not ap then ad:Notify{Title='Interface',Description=
'Unable to save config: '..tostring(aq)}return end ad:Notify{Title='Interface',
Description=string.format('Created config %q',ak)}an(ak)ai(ak)end}aj:Button{Name
='Load Config',Callback=function()local ap=al.Value local aq,ar=aa:LoadConfig(ap
)if not aq then ad:Notify{Title='Interface',Description=
'Unable to load config: '..tostring(ar)}return end ad:Notify{Title='Interface',
Description=string.format('Loaded config %q',ap)}ai(ap)end}aj:Button{Name=
'Overwrite Config',Callback=function()local ap=al.Value local aq,ar=aa:
SaveConfig(ap)if not aq then ad:Notify{Title='Interface',Description=
'Unable to overwrite config: '..tostring(ar)}return end ad:Notify{Title=
'Interface',Description=string.format('Overwrote config %q',ap)}ai(ap)end}aj:
Button{Name='Set as autoload',Callback=function()local ap=al.Value if not ap
then ad:Notify{Title='Interface',Description='Please select a config first.'}
return end writefile(ag,ap)am:UpdateName('Autoload config: '..ap)ad:Notify{Title
='Interface',Description=string.format('Set %q as autoload',ap)}ai(ap)end}aj:
Button{Name='Refresh Config List',Callback=function()an(al.Value)end}am=aj:Label
{Text='Autoload config: None'}local ap=ah()if ap and ap~=''then am:UpdateName(
'Autoload config: '..ap)end aj:Header{Name='Auto Hide UI'}aj:Toggle({Name=
'Hide window after execute',Default=ac.IsEnabled(),Callback=function(aq)ac.
SetEnabled(aq)end},'Toggle_AutoHide')aj:Label{Text=
'Press RightControl to show the window again.'}end end function a.aa()local aa,
ab,ac,ad,ae,af=a.load'f',a.load'L','Boss Active','Boss','Dungeon','Time Left'
return function(ag,ah)local ai=ah:Section{Side='Right'}ai:Header{Name='Status'}
local aj=ai:Label{Text=ac..': '..(aa.IsBossActive()and'Yes'or'No')}local ak=
function(ak)local al=ak and'0, 255, 0'or'255, 80, 80'aj:UpdateName(ac..
": <font color='rgb("..al..")'>"..(ak and'Yes'or'No')..'</font>')end ak(aa.
IsBossActive())aa.OnBossActiveChanged(function(al)ak(al)end)local al=ai:Label{
Text=ad..': 0'}local am=function()al:UpdateName(ad..': '..aa.
GetCurrentBossIndex())end am()aa.OnBossIndexChanged(function()am()end)local an=
ai:Label{Text='Enemies: 0'}local ao=function()if not aa.IsInLobby()and not aa.
GetCurrentDungeonName()then an:UpdateName
"Enemies: <font color='rgb(160, 160, 160)'>--</font>"return end local ao=aa.
GetEnemyCount()local ap=ao>0 and'0, 255, 0'or'255, 80, 80'an:UpdateName(
"Enemies: <font color='rgb("..ap..")'>"..ao..'</font>')end ai:Header{Name=
'Timer'}local ap=ai:Label{Text=af..': --'}local aq=function()local aq=ab.
GetTimeLeft()if not aq then ap:UpdateName(af..
": <font color='rgb(160, 160, 160)'>--</font>")return end local ar=math.floor(aq
)local as,at=string.format('%d:%02d',math.floor(ar/60),ar%60),ab.
GetTimeRetryEnabled()and aq<ab.GetTimeRetryThreshold()local au=at and
'255, 80, 80'or'0, 255, 0'ap:UpdateName(af..": <font color='rgb("..au..")'>"..as
..'</font>')end ao()aq()local ar task.spawn(function()while task.wait(0.5)do ak(
aa.IsBossActive())am()ao()ar()aq()end end)ai:Header{Name='Level Info'}local as=
ai:Label{Text=ae..': Unknown'}local at=function()local at=aa.
GetCurrentDungeonName()if at then as:UpdateName(ae..': '..at)else as:UpdateName(
ae..": <font color='rgb(255, 80, 80)'>Unknown</font>")end end at()aa.
OnDungeonNameChanged(function()at()end)ai:Header{Name='Lobby / Dungeon'}local au
=ai:Label{Text='Lobby: Unknown'}ar=function()local av=aa.IsInLobby()local aw=av
and'0, 255, 0'or'255, 80, 80'au:UpdateName("Lobby: <font color='rgb("..aw..")'>"
..(av and'Yes'or'No')..'</font>')end ar()aa.OnLobbyChanged(function()ar()end)ai:
Button{Name='Log Enemy Types to Console',Callback=function()local av=aa.
GetEnemyNames()print('[DungeonQuest] Enemy types in map ('..#av..'):')if#av==0
then print'  (no enemies found)'else for aw,ax in ipairs(av)do print('  - '..ax)
end end end}end end function a.ab()return function(aa,ab)a.load'_'(aa,ab)a.load
'aa'(aa,ab)end end function a.ac()local aa,ab,ac,ad,ae,af=a.load'a',a.load'd',{}
,'pathRecord',3,{}local ag,ah,ai,aj,ak,al=function()for ag=#af,1,-1 do pcall(af[
ag])end end,function()local ag=aa.contextData if type(ag)~='table'then return
nil end return ag[ad]end,function(ag)if not ag then return nil end return{X=ag.X
,Y=ag.Y,Z=ag.Z}end,function(ag)if not ag or type(ag)~='table'then return nil end
return Vector3.new(ag.X or 0,ag.Y or 0,ag.Z or 0)end,function(ag)return type(ag)
=='table'and type(ag.points)=='table'and#ag.points>0 end,function(ag)if type(ag)
~='table'or type(ag.X)~='number'then return nil end local ah=Vector3.new(ag.X,0,
ag.Z)if ah.Magnitude<0.001 then return nil end return ah.Unit end local am,an,ao
=function(am)if type(am)~='table'then return nil end local an={}for ao,ap in
ipairs(am.dwells or{})do local aq=aj(ap.pos)if aq then an[#an+1]={pos=aq,dur=
tonumber(ap.dur)or 0,facing=al(ap.facing)}end end local ao={}for ap,aq in
ipairs(am.skills or{})do local ar=aj(aq.pos)if ar then ao[#ao+1]={pos=ar,facing=
al(aq.facing),dw=math.floor(tonumber(aq.dw)or 0),dwT=tonumber(aq.dwT)or 0}end
end if#an==0 and#ao==0 then return nil end return{dwells=an,skills=ao}end,0.2,
function(am,an)local ao,ap=am.X-an.X,am.Z-an.Z return math.sqrt(ao*ao+ap*ap)end
function ac.SimplifyPath(ap,aq)local ar=#ap if ar<=2 then return ap end local as
={}for at=1,ar do as[at]=false end as[1]=true as[ar]=true local at,au=aq*aq,{{1,
ar}}while#au>0 do local av=table.remove(au)local aw,ax=av[1],av[2]local ay,az,aA
,aB=ap[aw].X,ap[aw].Z,ap[ax].X,ap[ax].Z local aC,aD=aA-ay,aB-az local aE,aF,aG=
aC*aC+aD*aD,-1,0 for aH=aw+1,ax-1 do local aI=0 if aE>0 then aI=((ap[aH].X-ay)*
aC+(ap[aH].Z-az)*aD)/aE aI=math.clamp(aI,0,1)end local aJ,aK=ap[aH].X-(ay+aC*aI)
,ap[aH].Z-(az+aD*aI)local aL=aJ*aJ+aK*aK if aL>aF then aF=aL aG=aH end end if aG
>0 and aF>at then as[aG]=true table.insert(au,{aw,aG})table.insert(au,{aG,ax})
end end local av={}for aw=1,ar do if as[aw]and(#av==0 or ao(av[#av],ap[aw])>=an)
then table.insert(av,ap[aw])end end if#av==1 then table.insert(av,ap[ar])end
return av end function ac.OnChanged(ap)if type(ap)~='function'then return
function()end end table.insert(af,ap)return function()for aq,ar in ipairs(af)do
if ar==ap then table.remove(af,aq)break end end end end function ac.HasMap(ap)if
type(ap)~='string'or#ap==0 then return false end local aq=ah()return aq~=nil and
aq[ap]~=nil end function ac.GetRoomSegment(ap,aq)if type(ap)~='string'or type(aq
)~='number'then return nil end local ar=ah()if not ar then return nil end local
as=ar[ap]if not as or type(as.rooms)~='table'then return nil end local at=as.
rooms[tostring(aq)]if not ak(at)then return nil end local au={}for av,aw in
ipairs(at.points)do local ax=aj(aw)if ax then au[#au+1]=ax end end if#au==0 then
return nil end return{startPos=aj(at.startPos)or au[1],points=au,events=at.
events and am(at.events)or nil,speed=tonumber(at.speed)or 0}end function ac.
HasSegmentOrMacro(ap,aq)return ac.GetRoomSegment(ap,aq)~=nil end function ac.
GetMap(ap)if not ac.HasMap(ap)then return nil end local aq=ah()local ar,as=aq[ap
],{}for at,au in pairs(ar.rooms or{})do local av=tonumber(at)if av and ak(au)
then local aw={}for ax,ay in ipairs(au.points)do local az=aj(ay)if az then aw[#
aw+1]=az end end if#aw>0 then as[av]={startPos=aj(au.startPos)or aw[1],points=aw
,events=au.events and am(au.events)or nil,speed=tonumber(au.speed)or 0}end end
end return{map=ap,version=ar.version,rooms=as,created=ar.created,updated=ar.
updated}end function ac.GetMaps()local ap=ah()if not ap then return{}end local
aq={}for ar,as in pairs(ap)do if type(ar)=='string'and type(as)=='table'and as.
map==ar and type(as.rooms)=='table'then local at,au=0,0 for av,aw in pairs(as.
rooms)do if tonumber(av)~=nil and ak(aw)then at+=1 au+=#aw.points end end if at>
0 then table.insert(aq,{map=ar,roomCount=at,pointCount=au,updated=as.updated})
end end end table.sort(aq,function(ar,as)return ar.map<as.map end)return aq end
function ac.Count()return#ac.GetMaps()end function ac.SaveSegment(ap,aq,ar,as,at
,au)if type(ap)~='string'or#ap==0 then return false end if type(aq)~='number'or
aq<=0 then return false end if not ar or not as or#as==0 then return false end
local av=aa.contextData if type(av)~='table'then av={}aa.contextData=av end
local aw=av[ad]if not aw then aw={}av[ad]=aw end local ax=aw[ap]if not ax or
type(ax)~='table'then ax={map=ap,version=ae,created=os.time(),updated=os.time(),
rooms={}}aw[ap]=ax end if type(ax.rooms)~='table'then ax.rooms={}end local ay={}
for az,aA in ipairs(as)do ay[#ay+1]=ai(aA)end local az={startPos=ai(ar)or ay[1],
points=ay}if type(au)=='number'and au>0 then az.speed=au end if at and type(at)
=='table'then local aA,aB=#(at.dwells or{}),#(at.skills or{})if aA>0 or aB>0
then local aC={dwells={},skills={}}for aD,aE in ipairs(at.dwells)do aC.dwells[#
aC.dwells+1]={pos=ai(aE.pos),dur=aE.dur or 0,facing=aE.facing}end for aD,aE in
ipairs(at.skills)do aC.skills[#aC.skills+1]={pos=ai(aE.pos),facing=aE.facing,dw=
aE.dw or 0,dwT=aE.dwT or 0}end az.events=aC end end ax.rooms[tostring(aq)]=az ax
.version=ae ax.map=ap ax.updated=os.time()ab.Save()ag()return true end function
ac.RemoveMap(ap)local aq=ah()if not aq or not aq[ap]then return false end aq[ap]
=nil if next(aq)==nil then local ar=aa.contextData if type(ar)=='table'then ar[
ad]=nil end end ab.Save()ag()return true end function ac.ClearAll()local ap,aq=
ah(),false if ap then for ar,as in pairs(ap)do if type(ar)=='string'then aq=true
break end end end if not aq then return end table.clear(ap)local ar=aa.
contextData if type(ar)=='table'then ar[ad]=nil end ab.Save()ag()end function ac
.ReloadFromConfig()ag()end return ac end function a.ad()local aa,ab,ac,ad=a.load
'e',a.load'f',a.load'ac',a.load'c'local ae,af,ag,ah,ai,aj,ak,al,am,an,ao=aa.
RunService,aa.player,aa.UserInputService,0.2,4000,1,0.5,0.15,{},true,true
function am.SetCapture(ap)ap=ap and true or false an=ap ao=ap end function am.
IsCaptureEnabled()return an or ao end local ap,aq,ar,as,at,au,av,aw,ax,ay,az,aA,
aB,aC,aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,aN=false,0,{},0,{},{},0,false,0,0,{}local aO
,aP=function()local aO={recording=ap,map=aA,room=aq,pointCount=#ar,dwellCount=#
at,skillCount=#au}for aP,aQ in ipairs(az)do pcall(aQ,aO)end end,function()local
aO=af and af.Character local aP=aO and aO:FindFirstChild'HumanoidRootPart'if aP
and aP.Parent then return aP end return nil end local aQ,aR,aS=function()local
aQ=aP()if not aQ then return nil end local aR=aQ.CFrame.LookVector if aR.
Magnitude<0.001 then return nil end return{X=aR.X/aR.Magnitude,Z=aR.Z/aR.
Magnitude}end,function()if aC then aC:Disconnect()aC=nil end if aD then aD:
Disconnect()aD=nil end if aE then aE()aE=nil end if aF then aF()aF=nil end if aG
then aG()aG=nil end if aH then aH()aH=nil end end,function()local aQ=aP()if not
aQ then return false end local aR=aQ.Position aB=aR ar={aR}at={}au={}aI=nil av=0
aJ=nil aK=nil aL=nil aM=aR ax=0 ay=0 as=os.clock()aN=os.clock()aO()return true
end function am.IsRecording()return ap end function am.GetStartRoom()return aq
end function am.GetCurrentPoints()return ar end function am.GetStatus()return{
recording=ap,map=aA,room=aq,pointCount=#ar}end function am.OnStatusChanged(aT)if
type(aT)=='function'then table.insert(az,aT)end end function am.Start()if ap
then return false,'\u{111}ang record r\u{1ed3}i'end local aT=aP()if not aT then
return false,'ch\u{1b0}a c\u{f3} nh\u{e2}n v\u{1ead}t'end if ab.IsDead()then
return false,'nh\u{e2}n v\u{1ead}t \u{111}ang ch\u{1ebf}t'end if ab.
IsBossActive()then return false,'boss room (d\u{f9}ng Smart Dodge)'end local aU=
ab.GetCurrentRoomIndex()if aU<=0 then return false,
'kh\u{f4}ng n\u{1eb1}m trong dungeon'end local aV=ab.GetCurrentDungeonName()if
not aV or#aV==0 then return false,
'kh\u{f4}ng x\u{e1}c \u{111}\u{1ecb}nh \u{111}\u{1b0}\u{1ee3}c map'end aA=aV aq=
aU aB=aT.Position ar={aB}ap=true as=os.clock()at={}au={}aI=nil av=0 aJ=nil aK=
nil aL=nil aM=aT.Position aw=false ax=0 ay=0 aN=os.clock()aC=ae.Heartbeat:
Connect(function()if not ap then return end if ab.IsDead()then aJ=nil aI=nil aM=
nil return end local aW=aP()if not aW then return end if ab.IsBossActive()then
return end local aX,aZ=aW.Position,ar[#ar]if aZ and(aX-aZ).Magnitude>35 then aS(
)return end local a_,a0=os.clock(),aM and(aX-aM).Magnitude or 0 aM=aX local a1=
aN and math.max(0,a_-aN)or 0 aN=a_ if a0>=al then ax+=a0 ay+=a1 end if an then
if a0<al then if not aJ then aJ=a_ aK=aX aL=aQ()end if aI then aI.dur=a_-aJ aI.
facing=aQ()or aL elseif a_-aJ>=ak then av=aJ-as aI={pos=aK,dur=a_-aJ,facing=aL,
index=#at+1}table.insert(at,aI)end else aJ=nil aI=nil end end local a2=ar[#ar]if
a2 and(aX-a2).Magnitude<ah then return end if#ar>=ai then am.Stop
'\u{111}\u{1ea1}t gi\u{1edb}i h\u{1ea1}n \u{111}i\u{1ec3}m'return end table.
insert(ar,aX)end)if ao then aD=ag.InputBegan:Connect(function(aW,aX)if not ap or
not ao then return end if aW.UserInputType~=Enum.UserInputType.MouseButton2 then
return end if aX then return end if ag:GetFocusedTextBox()then return end if ab.
IsDead()then return end local aZ=aP()if not aZ then return end local a_={pos=aZ.
Position,facing=aQ(),dw=0,dwT=0}if aI then a_.dw=aI.index a_.dwT=math.max(0,(os.
clock()-as)-av)end table.insert(au,a_)end)end aE=ab.OnRoomIndexChanged(function(
)if ap then local aW=ab.GetCurrentRoomIndex()if aW~=aq and not aw then aw=true
task.delay(1,function()aw=false if ap then am.Stop'chuy\u{1ec3}n room'end end)
end end end)aG=ab.OnBossActiveChanged(function(aW)if ap and aW then am.Stop
'v\u{e0}o boss room'end end)aF=ab.OnLobbyChanged(function(aW)if ap and aW then
am.Stop'v\u{1ec1} lobby'end end)aH=ab.OnRespawn(function()if not ap then return
end task.delay(0.2,function()if not ap or ab.IsDead()then return end if aS()then
ad.Notify('Path Record',(
'Ph\u{e1}t hi\u{1ec7}n h\u{1ed3}i sinh: T\u{1ef1} \u{111}\u{1ed9}ng ghi l\u{1ea1}i room %d t\u{1eeb} \u{111}i\u{1ec3}m h\u{1ed3}i sinh'
):format(aq),3)end end)end)ad.Notify('Path Record',(
'B\u{1eaf}t \u{111}\u{1ea7}u record room %d (%s)'):format(aU,aV),2)aO()return
true end function am.Stop(aT)if not ap then return false end ap=false aR()local
aU if#at>0 or#au>0 then aU={dwells=at,skills=au}end local aV=0 if ay>0.5 and ax>
5 then aV=math.clamp(ax/ay,5,100)end local aW=ac.SimplifyPath(ar,aj)local aX=ac.
SaveSegment(aA,aq,aB,aW,aU,aV)if aX then local aZ=''if aU then aZ=(
' (%d \u{111}i\u{1ec3}m g\u{1ed1}c -> %d m\u{1ecb}n, %d skill, %d nh\u{1ecb}p d\u{1eeb}ng, %.1fspd)'
):format(#ar,#aW,#au,#at,aV)else aZ=(
' (%d \u{111}i\u{1ec3}m g\u{1ed1}c -> %d m\u{1ecb}n, %.1fspd)'):format(#ar,#aW,
aV)end ad.Notify('Path Record',(
'\u{110}\u{e3} l\u{1b0}u room %d%s v\u{e0}o map [%s] %s'):format(aq,aZ,aA,aT and
('- '..aT)or''),3)end aA=nil aq=0 aB=nil ar={}at={}au={}aI=nil aJ=nil aM=nil aw=
false ax=0 ay=0 aN=nil aO()return aX end function am.Cancel()if not ap then
return end aR()aA=nil aq=0 aB=nil ar={}at={}au={}aI=nil aJ=nil aM=nil aw=false
ax=0 ay=0 aN=nil ap=false aO()end return am end function a.ae()local aa,ab,ac,ad
=a.load'e',a.load'f',a.load'ac',a.load'c'local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,
ap,aq,ar,as,at,au,av=aa.player,aa.VirtualInputManager,aa.UserInputService,1,1,8,
7,8,14,8,2,0.5,2,{},true,true,true,0.6 function ar.SetSkillFaceHold(aw)if type(
aw)=='number'then av=math.clamp(aw,ap,aq)end end function ar.GetSkillFaceHold()
return av end function ar.SetReplayTimeline(aw)aw=aw and true or false as=aw at=
aw au=aw end function ar.IsReplayTimelineEnabled()return as end local aw,ax,ay=
true function ar.SetSpeedMatch(az)aw=az and true or false end function ar.
IsSpeedMatchEnabled()return aw end local az,aA,aB,aC,aD,aE,aF=function(az)if not
aw then return end if type(az)~='number'or az<=0 then return end local aA=ab.
GetHumanoid()if not aA then return end if ax==nil then ay=aA.WalkSpeed end ax=az
if aA.WalkSpeed~=az then aA.WalkSpeed=az end end,function()if ax==nil then
return end local az=ab.GetHumanoid()if ay and az and az.WalkSpeed~=ay then az.
WalkSpeed=ay end ax=nil ay=nil end,false,false,{}local aG,aH,aI,aJ=function(aG)
local aH={playing=aB,map=aE,room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive()
,resume=aC,reason=aG}for aI,aJ in ipairs(aD)do pcall(aJ,aH)end end,function()
local aG=ae and ae.Character local aH=aG and aG:FindFirstChild'HumanoidRootPart'
if aH and aH.Parent then return aH end return nil end,function(aG)if not aG or
not aG.Parent then return nil end local aH,aI=pcall(function()return aG.Position
end)if not aH or not aI then return nil end return aI end,function(aG,aH)local
aI,aJ=aG.X-aH.X,aG.Z-aH.Z return math.sqrt(aI*aI+aJ*aJ)end local aK,aL,aM,aN=
function(aK)local aL=aH()if aL and aK then local aM=aI(aL)if aM then pcall(
function()aK:MoveTo(aM)end)end end end,function()local aK,aL=ab.GetKeyHoldTime()
or 0.05,ag:GetMouseLocation()pcall(function()af:SendMouseButtonEvent(aL.X,aL.Y,1
,true,game,false)task.wait(aK)af:SendMouseButtonEvent(aL.X,aL.Y,1,false,game,
false)task.wait(0.005)af:SendMouseButtonEvent(aL.X,aL.Y,1,true,game,false)task.
wait(aK)af:SendMouseButtonEvent(aL.X,aL.Y,1,false,game,false)end)end,function(aK
,aL)if not aK or not aK.Parent then return end local aM=ab.GetHumanoid()if aM
then aM.AutoRotate=false end local aN=aL or Vector3.new(1,0,0)if aN.Magnitude<
0.1 then aN=Vector3.new(1,0,0)end aN=Vector3.new(aN.X,0,aN.Z).Unit pcall(
function()local aO=aK.Position aK.CFrame=CFrame.lookAt(aO,aO+aN)end)end,function
()local aK=ab.GetHumanoid()if aK then aK.AutoRotate=true end end local aO=
function(aO,aP)local aQ,aR=ab.GetHumanoid(),aH()if not aQ or not aR then return
end az(aO.speed)local aS=ac.SimplifyPath(aO.points,ah)local aT=#aS if aT<2 then
return end local aU,aV=0,{}aV[1]=0 for aW=2,aT do local aX=aJ(aS[aW-1],aS[aW])aU
+=aX aV[aW]=aU end local aW,aX,aZ,a_=function(aW,aX,aZ)aX=aX or 0 aZ=aZ or aU
local a_,a0=0,math.huge for a1=2,aT do if aV[a1]<aX then continue end if aV[a1-1
]>aZ then continue end local a2,a3=aS[a1-1],aS[a1]local a4,a5=a2.X,a2.Z local a6
,a7=a3.X-a4,a3.Z-a5 local a8,a9=a6*a6+a7*a7,0 if a8>0 then a9=((aW.X-a4)*a6+(aW.
Z-a5)*a7)/a8 a9=math.clamp(a9,0,1)end local b,ba=aW.X-(a4+a6*a9),aW.Z-(a5+a7*a9)
local bb=b*b+ba*ba if bb<a0 then a0=bb a_=aV[a1-1]+math.sqrt(a8)*a9 end end
return a_ end,function(aW)local aX=2 while aX<=aT and aV[aX]<aW do aX+=1 end aX=
math.min(aX,aT)local aZ=aV[aX]-aV[aX-1]if aZ<=0 then return aS[aX]end local a_,
a0,a1=math.clamp((aW-aV[aX-1])/aZ,0,1),aS[aX-1],aS[aX]return Vector3.new(a0.X+(
a1.X-a0.X)*a_,a0.Y+(a1.Y-a0.Y)*a_,a0.Z+(a1.Z-a0.Z)*a_)end,{},{}if aO.events and(
as or at or au)then local a0,a1=aO.events.dwells or{},aO.events.skills or{}for
a2,a3 in ipairs(a0)do aZ[a2]={arc=aW(a3.pos),dur=a3.dur or 0,facing=a3.facing,
skills={}}end for a2,a3 in ipairs(a1)do local a4=(as and a3.dw>0 and aZ[a3.dw])
and aZ[a3.dw]or nil if a4 then table.insert(a4.skills,{tOff=a3.dwT or 0,facing=
a3.facing})else table.insert(a_,{arc=aW(a3.pos),facing=a3.facing})end end table.
sort(a_,function(a2,a3)return a2.arc<a3.arc end)end local a0,a1,a2=function(a0)
if not aB or a0.dur<=0 then return true end if as then if au then aM(aR,a0.
facing)end local a1,a2,a3=aI(aR),os.clock(),1 while aB and os.clock()-a2<a0.dur
do if not aR or not aR.Parent then return false,'no_root'end if ab.IsDead()then
return false,'dead'end if ab.GetCurrentRoomIndex()~=aP then return false,
'room_changed'end if ab.IsBossActive()then return false,'boss'end local a4=a1 or
aI(aR)if a4 then pcall(function()aQ:MoveTo(a4)end)end local a5=a0.skills[a3]if
a5 and os.clock()-a2>=a5.tOff then if at then if au then aM(aR,a5.facing)end aL(
)elseif au then aM(aR,a5.facing)end a3+=1 end task.wait(0.05)end if au then aN()
end end return true end,aS[1],os.clock()+aj while aB do if not aR or not aR.
Parent then aN()return false,'no_root'end if ab.IsDead()then aN()return false,
'dead'end if ab.GetCurrentRoomIndex()~=aP then aN()return false,'room_changed'
end if ab.IsBossActive()then aN()return false,'boss'end local a3=aI(aR)if not a3
then task.wait(0.08)continue end if aJ(a3,a1)<=ai then break end pcall(function(
)aQ:MoveTo(a1)end)if os.clock()>=a2 then break end task.wait(0.08)end local a3,
a4,a5,a6,a7,a8,a9,b,ba=0,aI(aR),os.clock(),1,1,0,0 local bb=function(bb)local bc
,bd=os.clock(),ba and aJ(ba,bb)or math.huge if bd>0.5 or bc-a9>=0.25 then ba=bb
a9=bc pcall(function()aQ:MoveTo(bb)end)end end while aB do if not aR or not aR.
Parent then aN()return false,'no_root'end if ab.IsDead()then aN()return false,
'dead'end if ab.GetCurrentRoomIndex()~=aP then aN()return false,'room_changed'
end if ab.IsBossActive()then aN()return false,'boss'end local bc=aI(aR)if not bc
then task.wait(0.08)continue end local bd=aW(bc,math.max(0,a3-al),math.min(aU,a3
+am))if bd>a3 then a3=bd end if a4 then if aJ(bc,a4)>0.02 then a5=os.clock()end
end a4=bc if os.clock()-a5>an then a3=math.min(a3+ao,aU-ai)a5=os.clock()a4=bc
end while a7<=#a_ and a_[a7].arc<=a3 do local be=a_[a7]if au then aM(aR,be.
facing)b=be.facing a8=os.clock()+av end if at then aL()end a7+=1 end local be=aZ
[a6]if be and a3>=be.arc then local bf,bg=a0(be)if not bf then aN()return false,
bg end a6+=1 a4=aI(aR)a5=os.clock()continue end if a3>=aU-ai then aN()pcall(
function()aQ:MoveTo(aS[aT])end)local bf=os.clock()+5 while aB do local bg=aI(aR)
if bg and aJ(bg,aS[aT])<=ai then break end if ab.GetCurrentRoomIndex()~=aP then
aN()return false,'room_changed'end if ab.IsBossActive()or ab.IsDead()then aN()
return false,'dead'end if os.clock()>=bf then break end if os.clock()>=a8 and aQ
.AutoRotate~=true then aQ.AutoRotate=true end task.wait(0.08)end aN()return true
,'completed'end if os.clock()<a8 then if aQ.AutoRotate~=false then aQ.AutoRotate
=false end if b then aM(aR,b)end elseif aQ.AutoRotate~=true then aQ.AutoRotate=
true end local bf=aX(math.min(a3+ak,aU-0.01))bb(bf)task.wait(0.1)end aN()return
false,'stopped'end local aP=function()local aP,aQ,aR=0,false,false while aB do
if aC then break end if ab.IsDead()then aR=true task.wait(0.25)continue end if
aR then aR=false aP=0 aQ=false end if ab.IsInLobby()then aC=false aB=false break
end if ab.IsBossActive()then task.wait(0.25)continue end local aS=ab.
GetCurrentRoomIndex()if aS<=0 then task.wait(0.1)continue end if aS~=aP then aP=
aS aQ=false end local aT=ac.GetRoomSegment(aE,aS)if not aT then task.wait(0.1)
continue end if aQ then task.wait(0.1)continue end local aU,aV=aO(aT,aS)aN()if
aU then aQ=true else if aV=='dead'then ad.Notify('Path Record',
'T\u{1eed} tr\u{1ead}n: \u{110}ang ch\u{1edd} h\u{1ed3}i sinh \u{111}\u{1ec3} ti\u{1ebf}p t\u{1ee5}c...'
,2)while aB and ab.IsDead()do task.wait(0.2)end task.wait(0.6)end end end aA()
aN()aF=nil aG()end function ar.IsPlaying()return aB end function ar.ResumeWanted
()return aC end function ar.GetActiveMap()return aE end function ar.GetStatus()
return{playing=aB,map=aE,room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(),
resume=aC}end function ar.OnStatusChanged(aQ)if type(aQ)=='function'then table.
insert(aD,aQ)end end function ar.Start()if aB then return false,
'\u{111}ang ph\u{e1}t r\u{1ed3}i'end if ab.IsInLobby()then return false,
'\u{111}ang \u{1edf} lobby'end if ab.IsBossActive()then return false,
'boss room (h\u{e3}y d\u{f9}ng Smart Dodge)'end local aQ=ab.GetCurrentRoomIndex(
)if aQ<=0 then return false,'ch\u{1b0}a c\u{f3} room'end local aR=ab.
GetCurrentDungeonName()if not aR or#aR==0 then return false,
'kh\u{f4}ng x\u{e1}c \u{111}\u{1ecb}nh \u{111}\u{1b0}\u{1ee3}c map'end if not ac
.HasSegmentOrMacro(aR,aQ)then return false,(
'map [%s] ch\u{1b0}a c\u{f3} segment room %d'):format(aR,aQ)end aE=aR aC=false
aB=true aF=task.spawn(aP)aG'started'return true end function ar.Stop()aB=false
aC=false aE=nil if aF then task.cancel(aF)aF=nil end aK(ab.GetHumanoid())aA()aN(
)aG'stopped'end function ar.PauseForExclusive()if not aB then return end aC=true
aB=false if aF then task.cancel(aF)aF=nil end aK(ab.GetHumanoid())aA()aN()ad.
Notify('Path Record',
'Nh\u{1b0}\u{1edd}ng \u{111}i\u{1ec1}u khi\u{1ec3}n: s\u{1ebd} t\u{1ef1} ph\u{e1}t ti\u{1ebf}p khi v\u{e0}o room c\u{f3} b\u{1ea3}n ghi'
,3)aG'paused'end return ar end function a.af()local aa,ab,ac,ad,ae,af,ag=game:
GetService'Workspace',{},{},0,{thickness=3,transparency=0.25}function ab.
SetStyle(ah)if type(ah)~='table'then return end if ah.thickness~=nil then ae.
thickness=math.clamp(ah.thickness,1,10)end if ah.transparency~=nil then ae.
transparency=math.clamp(ah.transparency,0,0.9)end end function ab.GetStyle()
return{thickness=ae.thickness,transparency=ae.transparency}end local ah,ai=0.4,
function()if af and af.Parent then return af end af=Instance.new'Part'af.Name=
'PR_PathAnchor_Visual'af.Anchored=true af.CanCollide=false af.CanQuery=false af.
CanTouch=false af.Transparency=1 af.Size=Vector3.new(1,1,1)af.CFrame=CFrame.new(
0,0,0)af.Parent=aa return af end function ab.Clear()for aj,ak in ipairs(ac)do
pcall(function()ak:Destroy()end)end table.clear(ac)ag=nil end function ab.
DrawPolylines(aj,ak,al)if not aj or#aj==0 then ab.Clear()return end local am=
tostring(ak)if am==ag then return end if not al and os.clock()-ad<ah and#ac>0
then return end ab.Clear()ag=am ad=os.clock()local an=ai()for ao,ap in ipairs(aj
)do local aq=ap.points if aq and#aq>=2 then for ar=2,#aq do local as,at=aq[ar-1]
,aq[ar]local au=(at-as).Magnitude if au>0.01 then local av=Instance.new
'LineHandleAdornment'av.Name='PR_PathLine_Visual'av.Adornee=an av.Length=au av.
Thickness=ae.thickness av.Transparency=ae.transparency av.Color3=ap.color or
Color3.fromRGB(0,230,255)av.ZIndex=1 av.CFrame=CFrame.lookAt(as,at)av.Parent=aa
table.insert(ac,av)end end end end if#ac==0 then ag=nil end end return ab end
function a.ag()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'e',a.load'f',a.load'b',a.
load'j',a.load'c',a.load'ac',a.load'ad',a.load'ae',a.load'af'local aj,ak,al,am=
aa.RunService,{},true,'Default (Red/Cyan/Teal)'local an,ao={[am]={rec=Color3.
fromRGB(255,60,60),play=Color3.fromRGB(0,230,255),idle=Color3.fromRGB(90,190,200
)},Oceana={rec=Color3.fromRGB(0,190,255),play=Color3.fromRGB(80,255,220),idle=
Color3.fromRGB(120,210,255)},Sunset={rec=Color3.fromRGB(255,120,60),play=Color3.
fromRGB(255,220,80),idle=Color3.fromRGB(255,150,160)},Emerald={rec=Color3.
fromRGB(80,255,140),play=Color3.fromRGB(0,220,120),idle=Color3.fromRGB(140,255,
180)},Violet={rec=Color3.fromRGB(200,90,255),play=Color3.fromRGB(170,120,255),
idle=Color3.fromRGB(150,150,255)}},{thickness=3,transparency=0.25,theme=am}
function ak.GetStyle()return{thickness=ao.thickness,transparency=ao.transparency
,theme=ao.theme}end function ak.GetThemeNames()local ap={}for aq in pairs(an)do
ap[#ap+1]=aq end table.sort(ap)return ap end function ak.SetStyle(ap)if type(ap)
~='table'then return end if ap.thickness~=nil then ao.thickness=math.clamp(ap.
thickness,1,10)end if ap.transparency~=nil then ao.transparency=math.clamp(ap.
transparency,0,0.9)end if ap.theme and an[ap.theme]then ao.theme=ap.theme end ai
.SetStyle{thickness=ao.thickness,transparency=ao.transparency}lastBuildKey=nil
fireStatus'style'end local ap,aq=true,true function ak.IsTimelineCaptureEnabled(
)return ap end function ak.SetTimelineCapture(ar)ap=ar and true or false ag.
SetCapture(ap)fireStatus'timeline'end function ak.IsTimelineReplayEnabled()
return aq end function ak.SetTimelineReplay(ar)aq=ar and true or false ah.
SetReplayTimeline(aq)fireStatus'timeline'end function ak.IsSpeedMatchEnabled()
return ah.IsSpeedMatchEnabled()end function ak.SetSpeedMatch(ar)ah.
SetSpeedMatch(ar and true or false)fireStatus'speedmatch'end function ak.
GetSkillFaceHold()return ah.GetSkillFaceHold()end function ak.SetSkillFaceHold(
ar)ah.SetSkillFaceHold(ar)fireStatus'facehold'end local ar,as,at,au,av,aw={}
local ax=function(ax)local ay={recording=ag.IsRecording(),playing=ah.IsPlaying()
,resume=ah.ResumeWanted(),map=ab.GetCurrentDungeonName(),room=ab.
GetCurrentRoomIndex(),boss=ab.IsBossActive(),recordedMaps=af.Count(),pointCount=
ag.IsRecording()and ag.GetStatus().pointCount or 0,reason=ax}for az,aA in
ipairs(ar)do pcall(aA,ay)end end function ak.ToggleRecord(ay)if ay then if ag.
IsRecording()then return true end if ah.IsPlaying()then ah.Stop()end local az,aA
=ag.Start()if not az then ae.Notify('Path Record',
'Kh\u{f4}ng b\u{1eaf}t \u{111}\u{1ea7}u record: '..tostring(aA),3)end ax()return
az else local az=ag.IsRecording()ag.Stop()ax()return az end end function ak.
IsRecording()return ag.IsRecording()end function ak.CurrentRoomHasRecord()return
af.HasSegmentOrMacro(ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex())end
function ak.TogglePlay(ay)if ay then if ah.IsPlaying()then return true end if ag
.IsRecording()then ag.Stop()end if ab.IsInLobby()then ae.Notify('Path Record',
'Kh\u{f4}ng ph\u{e1}t \u{111}\u{1b0}\u{1ee3}c: \u{111}ang \u{1edf} lobby',3)ax()
return false end if ab.IsBossActive()then ae.Notify('Path Record',
'Kh\u{f4}ng ph\u{e1}t \u{111}\u{1b0}\u{1ee3}c: boss room (h\u{e3}y d\u{f9}ng Smart Dodge)'
,3)ax()return false end local az=ab.GetCurrentDungeonName()if not az or#az==0
then ae.Notify('Path Record',
'Kh\u{f4}ng ph\u{e1}t \u{111}\u{1b0}\u{1ee3}c: kh\u{f4}ng x\u{e1}c \u{111}\u{1ecb}nh \u{111}\u{1b0}\u{1ee3}c map'
,3)ax()return false end if not af.HasSegmentOrMacro(az,ab.GetCurrentRoomIndex())
then ae.Notify('Path Record',
'Kh\u{f4}ng ph\u{e1}t \u{111}\u{1b0}\u{1ee3}c: room n\u{e0}y ch\u{1b0}a c\u{f3} b\u{1ea3}n ghi trong macro'
,3)ax()return false end ad.EnableExclusive'PathRecord'local aA,aB=ah.Start()if
not aA then ae.Notify('Path Record',
'Kh\u{f4}ng ph\u{e1}t \u{111}\u{1b0}\u{1ee3}c: '..tostring(aB),3)end ax()return
aA else local az=ah.IsPlaying()ah.Stop()ax()return az end end function ak.
IsPlaying()return ah.IsPlaying()end function ak.IsEnabled()return ah.IsPlaying()
end function ak.SetShowVisual(ay)al=ay and true or false if not al then ai.
Clear()end ax()end function ak.IsShowVisualEnabled()return al end function ak.
GetMaps()return af.GetMaps()end function ak.GetMacro(ay)return af.GetMap(ay)end
function ak.RemoveMap(ay)af.RemoveMap(ay)ax'removed'end function ak.ClearAll()af
.ClearAll()ax'cleared'end function ak.GetStatus()local ay=ag.GetStatus()return{
recording=ag.IsRecording(),playing=ah.IsPlaying(),resume=ah.ResumeWanted(),map=
ab.GetCurrentDungeonName(),room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(),
recordedMaps=af.Count(),pointCount=ay.pointCount}end function ak.OnStatusChanged
(ay)if type(ay)=='function'then table.insert(ar,ay)end end as=ab.
OnBossActiveChanged(function(ay)if ay and ah.IsPlaying()then ae.Notify(
'Path Record','Boss room: t\u{1ea1}m d\u{1eeb}ng, d\u{f9}ng Smart Dodge',3)ax
'boss'end end)au=af.OnChanged(function()ax'storage'end)av=ab.OnRoomIndexChanged(
function()if not ah.ResumeWanted()then return end local ay=ab.
GetCurrentRoomIndex()if ay<=0 or ab.IsInLobby()or ab.IsBossActive()or ab.IsDead(
)then return end local az=ab.GetCurrentDungeonName()if not az or#az==0 then
return end if ah.GetActiveMap()and ah.GetActiveMap()~=az then return end if not
af.HasSegmentOrMacro(az,ay)then return end ad.EnableExclusive'PathRecord'ah.
Start()ax'resumed'end)aw=ab.OnDungeonNameChanged(function(ay)if ag.IsRecording()
then ag.Cancel()ae.Notify('Path Record',
'\u{110}\u{1ed5}i map: h\u{1ee7}y record \u{111}ang d\u{1edf}',3)end if ah.
ResumeWanted()and(not ah.GetActiveMap()or ah.GetActiveMap()~=ay)then ah.Stop()
end ax'map'end)local ay,az,aA=function(ay)if not ay or#ay==0 then return'-'end
for az,aA in ipairs(af.GetMaps())do if aA.map==ay then return tostring(aA.
updated or'-')..':'..tostring(aA.roomCount)end end return'-'end ai.SetStyle{
thickness=ao.thickness,transparency=ao.transparency}ag.SetCapture(ap)ah.
SetReplayTimeline(aq)at=aj.Heartbeat:Connect(function()if not al then if az then
ai.Clear()az=nil end return end local aB,aC,aD=ab.GetCurrentDungeonName(),(ab.
GetCurrentRoomIndex())if ag.IsRecording()then aD='rec:'..#ag.GetCurrentPoints()
elseif ah.IsPlaying()then aD='play:'..tostring(aC)..':'..ay(aB)else aD='idle:'..
ay(aB)end if aD==aA then return end aA=aD local aE,aF=an[ao.theme]or an[am],{}if
ag.IsRecording()then local aG=ag.GetCurrentPoints()if#aG>=2 then aF[1]={points=
aG,color=aE.rec,tag='rec'}end elseif ah.IsPlaying()then if aB and aC>0 then
local aG=af.GetRoomSegment(aB,aC)if aG and#aG.points>=2 then aF[1]={points=af.
SimplifyPath(aG.points,1),color=aE.play,tag='play_'..tostring(aC)}end end else
if aB then local aG=af.GetMap(aB)if aG then local aH={}for aI in pairs(aG.rooms)
do aH[#aH+1]=aI end table.sort(aH)for aI,aJ in ipairs(aH)do local aK=aG.rooms[aJ
]if aK and#aK.points>=2 then aF[#aF+1]={points=af.SimplifyPath(aK.points,1),
color=aE.idle,tag='macro_'..tostring(aJ)}end end end end end if#aF>0 then local
aG={}for aH,aI in ipairs(aF)do aG[#aG+1]=(aI.tag or'x')..':'..#aI.points end ai.
DrawPolylines(aF,table.concat(aG,'|'))az='drawn'elseif az then ai.Clear()az=nil
end end)ad.Register('PathRecord',function(aB)if not aB then ah.
PauseForExclusive()end ax'disabled'end,ak.IsEnabled)ac.Register(function()ah.
Stop()ag.Cancel()ai.Clear()if as then as()as=nil end if at then at:Disconnect()
at=nil end if av then av()av=nil end if aw then aw()aw=nil end if au then au()au
=nil end end)return ak end function a.ah()local aa,ab,ac,ad,ae,af=a.load'e',a.
load'b',a.load'ag',a.load'd',a.load'g',a.load'c'local ag=aa.RunService return
function(ah,ai)local aj=ai:Section{Side='Left'}aj:Header{Name='Path Record'}aj:
Label{Text=
"Macro = 1 b\u{1ea3}n ghi cho c\u{1ea3} map, ch\u{1ee9}a to\u{e0}n b\u{1ed9} <font color='rgb(0,255,120)'>ROOM QU\u{c1}I TH\u{1af}\u{1edc}NG</font>. T\u{1ef1} l\u{1b0}u khi h\u{1ebf}t map / t\u{1eaf}t record. Boss -> d\u{f9}ng Smart Dodge."
}local ak,al,am=false,false,false local an=aj:Toggle{Name='Record Path (Macro)',
Default=ac.IsRecording(),Callback=function(an)if ak then return end if an then
if ac.IsRecording()then return end if ac.CurrentRoomHasRecord()then if am then
return end am=true ah:Dialog{Title='Confirm Record',Description=
"Room n\u{e0}y <font color='rgb(255,200,0)'>\u{111}\u{e3} c\u{f3} macro \u{111}\u{1b0}\u{1ee3}c l\u{1b0}u</font>.\n\nRecord b\u{e2}y gi\u{1edd} s\u{1ebd} <b>GHI \u{110}\u{c8} segment c\u{169}</b> c\u{1ee7}a room \u{111}\u{f3}.\nB\u{1ea1}n v\u{1eab}n mu\u{1ed1}n record l\u{1ea1}i ch\u{1ee9}?"
,Buttons={{Name='Record (Overwrite)',Callback=function()am=false local ao=ac.
ToggleRecord(true)if not ao then ak=true recordToggle:UpdateState(false)ak=false
end end},{Name='Cancel',Callback=function()am=false ak=true recordToggle:
UpdateState(false)ak=false end}}}return end ac.ToggleRecord(true)else am=false
if ac.IsRecording()then ac.ToggleRecord(false)end end end}aj:Label{Text=
"Record s\u{1ebd} b\u{1eaf}t c\u{1ea3} <font color='rgb(255,150,80)'>kho\u{1ea3}ng \u{111}\u{1ee9}ng ch\u{1edd}</font> + <font color='rgb(255,80,80)'>skill chu\u{1ed9}t ph\u{1ea3}i</font> + h\u{1b0}\u{1edb}ng m\u{1eb7}t, Play s\u{1ebd} t\u{e1}i hi\u{1ec7}n l\u{1ea1}i \u{111}\u{fa}ng v\u{1ecb} tr\u{ed} & gi\u{e2}y \u{111}\u{e3} record."
}local ao,ap,aq,ar=aj:Toggle{Name='Play Path (Macro)',Default=ac.IsPlaying(),
Callback=function(ao)if al then return end ac.TogglePlay(ao)end},aj:Toggle({Name
='Record Pauses & Skills',Default=ac.IsTimelineCaptureEnabled(),Callback=ad.
Wrap(function(ao)ac.SetTimelineCapture(ao)end)},'Toggle_PR_TimelineCapture'),aj:
Toggle({Name='Replay Pauses & Skills',Default=ac.IsTimelineReplayEnabled(),
Callback=ad.Wrap(function(ao)ac.SetTimelineReplay(ao)end)},
'Toggle_PR_TimelineReplay'),aj:Toggle({Name='Match Record Speed (Precise)',
Default=ac.IsSpeedMatchEnabled(),Callback=ad.Wrap(function(ao)ac.SetSpeedMatch(
ao)end)},'Toggle_PR_SpeedMatch')ae.PatchSliderLoadCallback(aj:Slider({Name=
'Skill Face Hold (s)',Default=ac.GetSkillFaceHold(),Minimum=0.5,Maximum=2,
DisplayMethod='Value',Precision=2,Callback=ad.Wrap(function(as)ac.
SetSkillFaceHold(as)end),onInputComplete=function(as)ad.SaveNow()af.Notify(
'Path Record',('Saved Skill Face Hold = %ss'):format(tostring(as)),2)end},
'Slider_PR_SkillFaceHold'))local as,at=aj:Toggle({Name='Show Path Visual',
Default=ac.IsShowVisualEnabled(),Callback=ad.Wrap(function(as)ac.SetShowVisual(
as)end)},'Toggle_PR_Visual'),ac.GetStyle()ae.PatchSliderLoadCallback(aj:Slider({
Name='Line Thickness',Default=at.thickness,Minimum=1,Maximum=10,DisplayMethod=
'Value',Precision=1,Callback=ad.Wrap(function(au)ac.SetStyle{thickness=au}end),
onInputComplete=function(au)ad.SaveNow()end},'Slider_PR_LineThickness'))ae.
PatchSliderLoadCallback(aj:Slider({Name='Line Opacity',Default=math.round((1-at.
transparency)*100),Minimum=10,Maximum=100,DisplayMethod='Value',Precision=0,
Callback=ad.Wrap(function(au)ac.SetStyle{transparency=1-au/100}end),
onInputComplete=function(au)ad.SaveNow()end},'Slider_PR_LineOpacity'))local au,
av=ac.GetThemeNames(),1 for aw,ax in ipairs(au)do if ax==at.theme then av=aw
break end end ae.PatchDropdownRestore(aj:Dropdown({Name='Path Color Theme',
Options=au,Default=av,Required=true,Callback=ad.Wrap(function(aw)ac.SetStyle{
theme=aw}end)},'Dropdown_PR_Theme'),false)aj:Header{Name='Macros'}local aw=ae.
PatchDropdownRestore(aj:Dropdown{Name='Map Recording',Options={'None'},Default=1
,Required=true,Callback=function(aw)end},false)local ax,ay,az,aA,aB=aj:Button{
Name='Delete Selected Map',Callback=ad.Wrap(function()local ax=aw:GetOptions()
for ay,az in pairs(ax)do if az then local aA=string.match(ay,
'^Map (%b[]) %(%d+ rooms%)$')if not aA or#aA<=2 then aA=string.match(ay,
'^Map (.-) %(%d+ rooms%)$')end if aA and#aA>2 then aA=aA:sub(2,-2)ac.RemoveMap(
aA)end return end end end)},false,'Clear All Recordings',
"<font color='rgb(255,80,80)'>Confirm Clear All?</font>",3 local aC=function()if
not ay then return end ay=false if clearTimer then task.cancel(clearTimer)
clearTimer=nil end pcall(function()clearBtn:UpdateName(az)end)end local aD,aE=aj
:Button{Name=az,Callback=function()if not ay then ay=true if clearTimer then
task.cancel(clearTimer)end clearTimer=task.delay(aB,aC)pcall(function()clearBtn:
UpdateName(aA)end)return end aC()ac.ClearAll()end},ai:Section{Side='Right'}aE:
Header{Name='Status Monitor'}local aF,aG,aH,aI,aJ,aK,aL=aE:Label{Text=
"State: <font color='rgb(160,160,160)'>Idle</font>"},aE:Label{Text=
[[Room: <font color='rgb(160,160,160)'>-</font> | Boss: <font color='rgb(160,160,160)'>-</font>]]
},aE:Label{Text="Points: <font color='rgb(160,160,160)'>-</font>"},aE:Label{Text
="Macros: <font color='rgb(160,160,160)'>None</font>"},function(aF)if not am
then pcall(function()if an and an.GetState and an:GetState()~=aF.recording then
ak=true an:UpdateState(aF.recording)ak=false end end)end pcall(function()if ao
and ao.GetState and ao:GetState()~=aF.playing then al=true ao:UpdateState(aF.
playing)al=false end end)pcall(function()if as and as.GetState and as:GetState()
~=ac.IsShowVisualEnabled()then as:UpdateState(ac.IsShowVisualEnabled())end end)
end,function(aF)local aG={}for aH,aI in ipairs(aF)do aG[#aG+1]=(
'Map [%s] (%d rooms)'):format(aI.map,aI.roomCount)end if#aG==0 then aG[1]='None'
end return aG end local aM=function(aM)local aN=aK(aM)local aO=table.concat(aN,
'|')if aO==aL then return end aL=aO local aP for aQ,aR in pairs(aw:GetOptions())
do if aR then aP=aQ break end end pcall(function()aw:ClearOptions()end)pcall(
function()aw:InsertOptions(aN)end)local aQ=aP if not aQ or not aw:IsOption(aQ)
then aQ=aN[1]end pcall(function()aw:UpdateSelection(aQ)end)end local aN=function
(aN)local aO if aN.recording then aO=
"<font color='rgb(255,90,90)'>Recording...</font>"elseif aN.playing then aO=
"<font color='rgb(0,230,255)'>Playing</font>"elseif aN.resume then aO=
"<font color='rgb(255,200,0)'>Waiting (auto-resume)</font>"else aO=
"<font color='rgb(160,160,160)'>Idle</font>"end pcall(function()aF:UpdateName(
'State: '..aO)end)local aP,aQ,aR=aN.boss and
"<font color='rgb(255,80,80)'>YES (d\u{f9}ng Smart Dodge)</font>"or
"<font color='rgb(0,255,120)'>No</font>",aN.room and aN.room>0 and(
"<font color='rgb(0,255,255)'>room %d</font>"):format(aN.room)or
"<font color='rgb(160,160,160)'>-</font>",aN.map and#aN.map>0 and(
"<font color='rgb(150,255,150)'>%s</font>"):format(aN.map)or
"<font color='rgb(160,160,160)'>-</font>"pcall(function()aG:UpdateName('Map: '..
aR..' | Room: '..aQ..' | Boss: '..aP)end)if aN.recording then pcall(function()aH
:UpdateName(("Points: <font color='rgb(255,170,60)'>%d</font> (room %s)"):
format(aN.pointCount,tostring(aN.room)))end)else pcall(function()aH:UpdateName
"Points: <font color='rgb(160,160,160)'>-</font>"end)end local aS=ac.GetMaps()if
#aS==0 then pcall(function()aI:UpdateName
"Macros: <font color='rgb(160,160,160)'>None</font>"end)else local aT={}for aU,
aV in ipairs(aS)do aT[#aT+1]=('%s(%dr/%dp)'):format(aV.map,aV.roomCount,aV.
pointCount)end pcall(function()aI:UpdateName(
"Macros: <font color='rgb(150,255,150)'>"..table.concat(aT,', ')..'</font>')end)
end aM(aS)end ac.OnStatusChanged(function(aO)aN(aO)aJ(aO)end)local aO=0 local aP
=ag.Heartbeat:Connect(function()local aP=os.clock()if aP-aO<0.4 then return end
aO=aP local aQ=ac.GetStatus()aN(aQ)aJ(aQ)end)ab.Register(function()if aP then aP
:Disconnect()aP=nil end end)aN(ac.GetStatus())aJ(ac.GetStatus())end end function
a.ai()return function(aa)local ab,ac=game:GetService'Players',os.clock()+15
while not ab.LocalPlayer do if os.clock()>ac then break end task.wait(0.1)end
local ad=ab.LocalPlayer if not ad then return warn
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
load'H',a.load'M',a.load'O',a.load'Y',a.load'ab',a.load'ah'al(ah,ak.Combat)am(ah
,ak.Dungeon)an(ah,ak.Inventory)ao(ah,ak.Utilities)ap(ah,ak.Configs)aq(ah,ak.
PathRecord)local ar=a.load'h'ar.Init()local as=a.load'T'as.Init()a.load'Q'local
at=a.load'Z'at.SetWindow(ah)at.Execute()local au=a.load'B'au.Init()ak.Combat:
Select()local av,aw=a.load'j',a.load'F'av.SetLocked(true)ae:LoadAutoLoadConfig()
local ax=function()local ax=ae.Folder..'/settings/autoload.txt'if isfile and
isfile(ax)then local ay,az=pcall(readfile,ax)if ay and type(az)=='string'and#az>
0 then ag.SetActive(az)end end end ax()task.delay(0.3,function()av.SetLocked(
false)local ay=ae.Options and ae.Options.Toggle_SAP_Master if ay and ay:
GetState()==true then if not aw.IsMasterEnabled()then aw.SetMasterEnabled(true)
end end end)task.delay(1.5,function()ag.Resume()end)end end function a.aj()local
aa={}function aa:Export()local ab={}for ac,ad in pairs(self)do if typeof(ad)==
'Instance'or type(ad)=='table'then local ae,af=pcall(function()end)if ae and af
~=nil then ab[ac]=af end end end return ab end function aa:Import(ab)for ac,ad
in pairs(ab)do local ae=self[ac]if ae and ae.Value~=nil then local af=pcall(
function()end)if not af then warn(`Failed to import value for flag "{ac}"`)end
end end end function aa:Reset()for ab in pairs(self)do self[ab]=nil end end
return aa end function a.ak()local aa,ab=a.load'V',{}function ab:Window(ac)ac=ac
or{}print'Made a window'local ad=aa.Wrap(ac,{Visible=function(ad)print(
'Set window visibility to:',ad)end})return aa.Apply(ac,ad)end return ab end
function a.al()local aa,ab=a.load'V',{}return(aa.Wrap(ab,{Enabled=function(ac)
print(`{ac and'Enabled'or'Disabled'} ESP.`)end}))end function a.am()local aa,ab,
ac=a.load'aj',a.load'ak',a.load'al'local ad=ab:Window{Visible=true}return{Flags=
aa,Esp=ac,Interface=ab,Window=ad,Tabs={Home=function(ae)end,Visuals=function(ae)
end,Settings=function(ae)end,Config=function(ae)end}}end function a.an()local aa
={}function aa.GetPlayer()local ab,ac=pcall(function()return game:GetService
'Players'end)return ab and(ac).LocalPlayer end function aa.GetCharacter(ab)local
ac,ad=pcall(function()return ab and ab.Character end)return ac and ad end
function aa.GetHumanoid(ab)local ac,ad=pcall(function()local ac=aa.GetCharacter(
ab)return ac and ac:FindFirstChildOfClass'Humanoid'end)return ac and ad end
return aa end function a.ao()local aa=function(aa)return game:GetService(aa)end
return{Players=(aa'Players')}end function a.ap()return function(aa)local ab,ac,
ad=a.load'am',a.load'an',a.load'ao'local ae,af,ag,ah,ai,aj,ak=ab.Flags,ab.Esp,ab
.Interface,ab.Window,ab.Tabs,ac.GetPlayer(),ad.Players do ai.Home(aa)end do
local al=ah:Tab{Name='Exploits'}al:Toggle{Name='Flight'}end do ai.Visuals(aa)end
do local al=ai.Settings(aa)al:Toggle{Name='Dark Mode'}end do ai.Config(aa)end ah
.Title=aa.Name end end end local aa=_G.ScriptHub_Cleanup if typeof(aa)==
'function'then pcall(aa)end _G.ScriptHub_Cleanup=nil local ab=_G.ScriptHub_UI if
typeof(ab)=='table'and typeof(ab.Unload)=='function'then pcall(ab.Unload,ab)end
_G.ScriptHub_UI=nil local ac={{Name='DungeonQuest',Load=a.load'ai',UniverseId=
9931749389,Places={77649408247578,3220968688,2414851778}},{Name='Game 2',Load=a.
load'ap',Places={123456789,987654321}}}for ad=1,300 do if game.GameId~=0 and
game.PlaceId~=0 then break end task.wait(0.1)end for ad,ae in pairs(ac)do if ae.
Places then for af,ag in ipairs(ae.Places)do if ag==game.PlaceId then return ae:
Load()end end end if ae.UniverseId and ae.UniverseId==game.GameId then return ae
:Load()end end