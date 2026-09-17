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
function aa.IsActive()return not aa.cleaned end aa.OnCleanup=aa.Register return
aa end function a.c()local aa,ab={}function aa:SetWindow(ac)ab=ac end function
aa.Notify(ac,ad,ae)ae=ae or 3 if ab then local af=pcall(function()ab:Notify{
Title=ac,Description=ad,Lifetime=ae}end)if af then return end end pcall(function
()game:GetService'StarterGui':SetCore('SendNotification',{Title=ac,Text=ad,
Duration=ae})end)end return aa end function a.d()local aa,ab,ac,ad,ae,af=a.load
'a',a.load'c',{},false,false function ac.Suspend()ae=true ad=false end function
ac.Resume()ae=false end function ac.IsSuspended()return ae or(aa.LoadingConfig==
true)end function ac.SetActive(ag)af=(typeof(ag)=='string'and#ag>0)and ag or nil
end function ac.GetActive()return af end local ag=function()if af then return af
end local ag=aa.Folder local ah=ag..'/settings/autoload.txt'if isfile and
isfile(ah)then local ai,aj=pcall(readfile,ah)if ai and typeof(aj)=='string'and#
aj>0 then af=aj return af end end af='Default'pcall(function()if writefile and
makefolder and isfolder then if not isfolder(ag)then makefolder(ag)end if not
isfolder(ag..'/settings')then makefolder(ag..'/settings')end if not isfile(ah)
then writefile(ah,'Default')end end end)return af end function ac.SaveNow()if ac
.IsSuspended()then return end local ah=ag()if not ah then return end local ai,aj
=aa:SaveConfig(ah)if not ai and aj and aj~='Please select a config file.'then ab
.Notify('AutoSave','Kh\u{f4}ng l\u{1b0}u \u{111}\u{1b0}\u{1ee3}c config: '..
tostring(aj),3)end end function ac.Save()if ac.IsSuspended()then return end if
not ag()then return end if ad then return end ad=true task.delay(0.5,function()
ad=false if not ac.IsSuspended()and ac.GetActive()then ac.SaveNow()end end)end
function ac.Wrap(ah)if type(ah)~='function'then return ah end return function(
...)ah(...)ac.Save()end end return ac end function a.e()local aa,ab,ac,ad=game:
GetService'Players',game:GetService'UserInputService',game:GetService
'RunService',game:GetService'VirtualInputManager'local ae=aa.LocalPlayer if not
ae then local af=os.clock()+5 repeat ae=aa.LocalPlayer if ae then break end task
.wait(0.1)until os.clock()>af end return{Players=aa,UserInputService=ab,
RunService=ac,VirtualInputManager=ad,player=ae}end function a.f()local aa,ab=a.
load'e',a.load'b'local ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,
av,aw,ax,ay=aa.player,0.05,'enemyProjectiles',0.5,{},false,16,16,true,false,
false,{},0,{},0,{},{},{},{},{},{},0,{}local az,aA,aB,aC,aD,aE,aF,aG,aH,aI,aJ,aK,
aL,aM,aN,aO,aP,aQ,aR=function()for az=#ay,1,-1 do pcall(ay[az])end end,{},
'unknown',true,{},{},{},0,4,false local aS=function(aS)if aS then table.insert(
aF,aS)end return aS end function ag.OnRespawn(aT)table.insert(aE,aT)end function
ag.GetLastRespawnTime()return aG end function ag.GetRespawnProtectionDuration()
return aH end function ag.SetRespawnProtectionDuration(aT)if type(aT)=='number'
and aT>=0 then aH=aT end end function ag.GetRespawnProtectionRemaining()if aG==0
then return 0 end local aT=os.clock()-aG local aU=aH-aT return math.max(0,aU)end
function ag.IsJustRespawned(aT)local aU=aT or aH if aG==0 then return false end
return(os.clock()-aG)<=aU end function ag.WasDead()return aI end function ag.
IsDead()local aT=ac and ac.Character if not aT or not aT.Parent then return true
end local aU=aT:FindFirstChildOfClass'Humanoid'if not aU or aU.Health<=0 then
return true end return false end function ag.IsInvulnerable()local aT=ac and ac.
Character if not aT or not aT.Parent then return false,nil end local aU=aT:
FindFirstChildOfClass'Humanoid'if aU and aU.Health<=0 then return false,nil end
local aV=ag.GetRespawnProtectionRemaining()if aV>0 then return true,(
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
Disconnect()end)end table.clear(aF)aM()end)return ag end function a.g()local aa,
ab,ac={},{},false function aa.SetLocked(ad)ac=ad and true or false end function
aa.IsLocked()return ac end function aa.Register(ad,ae,af)if type(ad)~='string'or
type(ae)~='function'or type(af)~='function'then return end ab[ad]={setEnabled=ae
,isEnabled=af}end function aa.EnableExclusive(ad)if ac then return end for ae,af
in pairs(ab)do if ae~=ad and af.isEnabled()then pcall(af.setEnabled,false)end
end end function aa.IsEnabled(ad)local ae=ab[ad]return ae~=nil and ae.isEnabled(
)end return aa end function a.h()local aa,ab=a.load'e',a.load'f'local ac,ad=aa.
player,{}function ad.Validate(ae)if not ae then return false end local af=ae.
Model if not af or not af.Parent or af==ac.Character then return false end local
ag=ae.Humanoid if not ag or not ag.Parent then ag=af:FindFirstChildOfClass
'Humanoid'ae.Humanoid=ag end if not ag or ag.Health<=0 then return false end
local ah=ae.Root if not ah or not ah.Parent then ah=af:FindFirstChild
'HumanoidRootPart'or af.PrimaryPart if not ah then for ai,aj in ipairs(af:
GetDescendants())do if aj:IsA'BasePart'then ah=aj break end end end if not ah
then return false end ae.Root=ah end return true end function ad.Scan()local ae,
af={},ab.GetTrackedEnemyData()for ag,ah in ipairs(af)do if ad.Validate(ah)then
table.insert(ae,ah)end end return ae end return ad end function a.i()local aa={}
function aa.SelectBestTarget(ab,ac,ad)local ae,af,ag=(math.huge)for ah,ai in
ipairs(ac)do if ad and ad()then return nil,nil,nil,nil,math.huge end local aj=ai
.Root if aj and aj.Parent then local ak=aj.Position local al,am=ak.X-ab.X,ak.Z-
ab.Z local an=al*al+am*am if an<ae then ae=an af=ai ag=ak end end end local ah=
ae<math.huge and math.sqrt(ae)or math.huge return af,nil,nil,ag,ah end return aa
end function a.j()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'i',a.load'h',{},{},1,6
function ac.GetTarget()return ag end function ac.GetPathInstance()return ah end
function ac.GetWaypoints()return ad end function ac.GetWaypointIndex()return ae
end function ac.SetWaypointIndex(aj)ae=math.clamp(aj,1,math.max(1,#ad))end
function ac.AdvanceWaypointIndex(aj)if not ad or#ad==0 then return end local ak=
ad[ae]if ak then local al=Vector3.new(ak.Position.X-aj.X,0,ak.Position.Z-aj.Z).
Magnitude if al<=3.5 then ae=math.min(#ad+1,ae+1)end end end function ac.
GetLastPathDestPos()return ai end function ac.SetRepathThreshold(aj)if type(aj)
=='number'and aj>0 then af=aj end end function ac.GetRepathThreshold()return af
end function ac.SetTarget(aj,ak,al,am)if ah and ah~=ak then pcall(function()ah:
Destroy()end)end ag=aj ah=ak ad=al or{}ae=1 ai=am end function ac.UpdatePath(aj,
ak,al)if ah and ah~=aj then pcall(function()ah:Destroy()end)end ah=aj ad=ak or{}
ae=1 ai=al end function ac.ClearTarget()if ah then pcall(function()ah:Destroy()
end)end ag=nil ah=nil ad={}ae=1 ai=nil end function ac.IsTargetValid()if not ag
then return false end return ab.Validate(ag)end function ac.NeedsRepath(aj)if
not ah or not ad or#ad==0 then return true end if not ai or not aj then return
true end return(aj-ai).Magnitude>af end function ac.Repath(aj,ak)if not ak then
return false end local al,am,an=aa.ComputePathWithCost(aj,ak)if al and#am>0 then
if ah then pcall(function()ah:Destroy()end)end ah=al ad=am ae=1 ai=ak return
true end return false end return ac end function a.k()local aa=a.load'e'local ab
,ac=aa.player,{}local ad=function(ad)local ae={}if ad then for af,ag in ipairs(
ad)do if ag and ag.Parent then table.insert(ae,ag)end end end if ab and ab.
Character and ab.Character.Parent then table.insert(ae,ab.Character)end local af
=workspace:FindFirstChild'RaycastIgnore'if af then table.insert(ae,af)end return
ae end function ac.CastRay(ae,af,ag)local ah=af-ae local ai=ah.Magnitude if ai<
0.3 then return false,nil,af end local aj=RaycastParams.new()aj.FilterType=Enum.
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
return al(am)end local am={'secondbosscriclehitbox','secondbosscirclehitbox'}
local an=function(an)if not an or type(an)~='string'then return false end local
ao=an:lower():gsub('%s+','')if#ao==0 then return false end for ap,aq in ipairs(
am)do if string.find(ao,aq,1,true)then return true end end return false end
function aa.IsSecondBossCircleChain(ao)return an(ao)end local ao={'movingbeam'}
local ap=function(ap)if not ap or type(ap)~='string'then return false end local
aq=ap:lower():gsub('%s+','')if#aq==0 then return false end for ar,as in ipairs(
ao)do if string.find(aq,as,1,true)then return true end end return false end
function aa.IsMovingBeam(aq)return ap(aq)end local aq,ar={'firstbossbigspike',
'firstbossbeampart','bigspike'},function(aq)if not aq or type(aq)~='string'then
return false end local ar=aq:lower():gsub('%s+','')return string.find(ar,
'firstbossbeampart',1,true)~=nil end function aa.IsBeamTelegraph(as)return ar(as
)end local as=function(as)if not as or type(as)~='string'then return false end
local at=as:lower():gsub('%s+','')if#at==0 or string.find(at,'seekingspike',1,
true)then return false end for au,av in ipairs(aq)do if string.find(at,av,1,true
)then return true end end return false end function aa.IsBigSpike(at)return as(
at)end local at=function()if ak and ak>0 then return ak end local at,au=45,ah:
FindFirstChild'enemyProjectiles'if not au then return at end local av=au:
FindFirstChild'largeIceSpikes'if not av then for aw,ax in ipairs(au:GetChildren(
))do local ay=(ax.Name or''):lower():gsub('%s+','')if ay=='largeicespikes'then
av=ax break end end end if not av then return at end local aw,ax=0,Vector3.zero
if av:IsA'Model'and av.PrimaryPart then ax=av.PrimaryPart.Position elseif av:IsA
'BasePart'then ax=av.Position end local ay={}if av:IsA'BasePart'then table.
insert(ay,av)else for az,aA in ipairs(av:GetDescendants())do if aA:IsA'BasePart'
then table.insert(ay,aA)end end end if#ay==0 then return at end for az,aA in
ipairs(ay)do local aB=aA.Size local aC,aD=math.max(aB.X,aB.Z)/2,(Vector3.new(aA.
Position.X,0,aA.Position.Z)-Vector3.new(ax.X,0,ax.Z)).Magnitude local aE=aD+aC
if aE>aw then aw=aE end end if aw>=5 then ak=aw return ak end return at end
function aa.GetLargeIceSpikesMaxRadius()return at()end local au=function(au)if
not au or type(au)~='string'then return false end local av=au:lower():gsub('%s+'
,'')if#av==0 then return false end for aw,ax in ipairs(ai)do local ay=ax:lower()
:gsub('%s+','')if#ay>0 and string.find(av,ay,1,true)then return true end end
return false end function aa.IsForceCircle(av)return au(av)end function aa.
AddForceCircleName(av)if type(av)=='string'and#av>0 then table.insert(ai,av)aa.
InvalidateCache()end end function aa.GetForceCircleNames()return ai end local av
,aw,ax,ay=function(av)return av and av.Parent and av.Transparency<=ab end,
function(av,aw,ax)local ay,az,aA,aB=av.Size,ax and ad or ac,(av and av.Name)or''
,(av and av.Parent and av.Parent.Name)or''if ap(aA)or ap(aB)then local aC,aD=
math.max(ay.X,ay.Z)/2+az,math.max(2,math.min(ay.X,ay.Z)/2+az)return{half=Vector3
.new(aC,0,aD),cframe=av.CFrame,isMovingBeam=true}end if as(aA)or as(aB)then
local aC,aD=ay,av:FindFirstChildWhichIsA('SpecialMesh',true)if aD then aC=
Vector3.new(aC.X*math.abs(aD.Scale.X),aC.Y*math.abs(aD.Scale.Y),aC.Z*math.abs(aD
.Scale.Z))end local aE={aC.X,aC.Y,aC.Z}table.sort(aE)local aF,aG=math.clamp(aE[2
],4,24),math.clamp(aE[3],6,30)local aH,aI=aF/2+az,aG/2+az return{half=Vector3.
new(aH,0,aI),cframe=av.CFrame,isBigSpike=true}end if aw or(av:IsA'Part'and(av.
Shape==Enum.PartType.Ball or av.Shape==Enum.PartType.Cylinder))then return{
radius=math.max(ay.X,ay.Y,ay.Z)/2}end local aC=Vector3.new(math.max(ay.X,0)/2+az
,0,math.max(ay.Z,0)/2+az)return{half=aC,cframe=av.CFrame}end,function(av,aw,ax,
ay)if not aw then return false end if aw.expireTime and os.clock()>aw.expireTime
then return false end local az,aA=av.X,av.Z ax=ax or 0 local aB=(ay or aw.
isTrajectory)and ad or ac if aw.radius then local aC=(aw.part and aw.part.Parent
)and aw.part.Position local aD,aE=aw.cx or(aC and aC.X)or 0,aw.cz or(aC and aC.Z
)or 0 local aF,aG,aH=az-aD,aA-aE,aw.radius+aB+ax return(aF*aF+aG*aG)<=(aH*aH)end
local aC=(aw.part and aw.part.Parent)and aw.part.CFrame or aw.cframe if aC then
local aD,aE,aF=aC:PointToObjectSpace(av),aw.half.X,aw.half.Z if ax<=0 then
return math.abs(aD.X)<=aE and math.abs(aD.Z)<=aF else local aG,aH=math.max(0,
math.abs(aD.X)-aE),math.max(0,math.abs(aD.Z)-aF)return(aG*aG+aH*aH)<=(ax*ax)end
end return false end,function(av,aw)local ax=(aw and aw.CFrame)or(av:IsA'Model'
and av:GetPivot())if ax then local ay=ax.LookVector local az=Vector3.new(-ay.X,0
,-ay.Z)if az.Magnitude>0.05 then return az.Unit end end local ay=services.player
or game:GetService'Players'.LocalPlayer local az=ay and ay.Character local aA=az
and(az:FindFirstChild'HumanoidRootPart'or az.PrimaryPart)if aA and aw then local
aB=Vector3.new(aA.Position.X-aw.Position.X,0,aA.Position.Z-aw.Position.Z)if aB.
Magnitude>0.1 then return aB.Unit end end return Vector3.new(0,0,-1)end local az
=function(az)if not az or not az.Instance or not az.Instance.Parent then return
nil end local aA=az.Instance local aB=az.Name or(aA and aA.Name)or''local aC,aD=
au(aB),az.IsTrajectory==true local aE,aF=aD and ad or ac if al(aB)then local aG,
aH=(at())if aA:IsA'BasePart'then aH=av(aA)and aA or nil elseif aA:IsA'Model'then
if aA.PrimaryPart and av(aA.PrimaryPart)then aH=aA.PrimaryPart else for aI,aJ in
ipairs(aA:GetDescendants())do if aJ:IsA'BasePart'and av(aJ)and aJ.Parent then aH
=aJ break end end end end if not aH then return nil end local aI=aH.Position
local aJ={radius=aG,cx=aI.X,cz=aI.Z,part=aH,isTrajectory=false,isIceSpikes=true}
return{zones={aJ},center=Vector3.new(aI.X,0,aI.Z),boundingRadius=aG+aE}end if
an(aB)then local aG if aA:IsA'BasePart'then aG=av(aA)and aA or nil elseif aA:IsA
'Model'then if aA.PrimaryPart and av(aA.PrimaryPart)then aG=aA.PrimaryPart else
for aH,aI in ipairs(aA:GetDescendants())do if aI:IsA'BasePart'and av(aI)and aI.
Parent then aG=aI break end end end end if not aG then return nil end local aH,
aI,aJ,aK,aL,aM,aN,aO,aP,aQ=aG.Position,ay(aA,aG),az.SpawnClock or os.clock(),{},
10,11,3,22,2.2,0.4 local aR=(aL-1)*aO for aS=1,aL do local aT=(aS-1)*aO local aU
,aV,aW=Vector3.new(aH.X,0,aH.Z)+aI*aT,aM+(aS-1)*aN,aJ+aP+(aS-1)*aQ table.insert(
aK,{radius=aV,cx=aU.X,cz=aU.Z,part=aG,expireTime=aW,isTrajectory=false,
isSecondBossChain=true,circleIndex=aS})end local aS,aT=Vector3.new(aH.X,0,aH.Z)+
aI*(aR/2),aM+(aL-1)*aN local aU,aV=(aR/2)+aT+aE,aJ+aP+(aL-1)*aQ if az then az.
MaxExpireTime=aV az.IsSyntheticChain=true end return{zones=aK,center=aS,
boundingRadius=aU,maxExpireTime=aV}end if ap(aB)then local aG if aA:IsA
'BasePart'then aG=av(aA)and aA or nil elseif aA:IsA'Model'then aG=aA.PrimaryPart
or aA:FindFirstChildWhichIsA'BasePart'if not aG or not av(aG)then for aH,aI in
ipairs(aA:GetDescendants())do if aI:IsA'BasePart'and av(aI)and aI.Parent then aG
=aI break end end end end if not aG then return nil end local aH,aI=aG.Position,
aG.Size local aJ,aK=math.max(aI.X,aI.Z),math.max(3.5,math.min(aI.X,aI.Z))local
aL,aM=aJ/2+aE,aK/2+aE local aN={half=Vector3.new(aL,0,aM),cframe=aG.CFrame,part=
aG,cx=aH.X,cz=aH.Z,isTrajectory=aD,isMovingBeam=true}return{zones={aN},center=
Vector3.new(aH.X,0,aH.Z),boundingRadius=math.sqrt(aL*aL+aM*aM)}end if ar(aB)then
return nil end if as(aB)then local aG if aA:IsA'BasePart'then aG=av(aA)and aA or
nil elseif aA:IsA'Model'then aG=aA.PrimaryPart or aA:FindFirstChildWhichIsA
'BasePart'if not aG or not av(aG)then for aH,aI in ipairs(aA:GetDescendants())do
if aI:IsA'BasePart'and av(aI)and aI.Parent then aG=aI break end end end end if
not aG then return nil end local aH,aI,aJ=aG.Position,aG.Size,aG:
FindFirstChildWhichIsA('SpecialMesh',true)if aJ then aI=Vector3.new(aI.X*math.
abs(aJ.Scale.X),aI.Y*math.abs(aJ.Scale.Y),aI.Z*math.abs(aJ.Scale.Z))end local aK
={aI.X,aI.Y,aI.Z}table.sort(aK)local aL,aM=math.clamp(aK[2],4,24),math.clamp(aK[
3],6,30)local aN,aO=aL/2+aE,aM/2+aE local aP={half=Vector3.new(aN,0,aO),cframe=
aG.CFrame,part=aG,cx=aH.X,cz=aH.Z,isTrajectory=aD,isBigSpike=true}return{zones={
aP},center=Vector3.new(aH.X,0,aH.Z),boundingRadius=math.sqrt(aN*aN+aO*aO)}end if
aA:IsA'BasePart'then if not av(aA)then return nil end aF={aA}else aF={}for aG,aH
in ipairs(aA:GetDescendants())do if#aF>=af then break end if aH:IsA'BasePart'and
av(aH)and aH.Parent then aF[#aF+1]=aH end end if#aF==0 then return nil end end
local aG,aH,aI,aJ,aK={},math.huge,-math.huge,math.huge,-math.huge for aL,aM in
ipairs(aF)do local aN,aO=aM.Position,aM.Size local aP=math.max(aO.X,aO.Y,aO.Z)/2
+aE aH=math.min(aH,aN.X-aP)aI=math.max(aI,aN.X+aP)aJ=math.min(aJ,aN.Z-aP)aK=math
.max(aK,aN.Z+aP)local aQ=aw(aM,aC,aD)if aQ then if aQ.radius then aQ.cx,aQ.cz=aN
.X,aN.Z end aQ.part=aM aQ.isTrajectory=aD aG[#aG+1]=aQ end end if#aG==0 then
return nil end local aL,aM,aN,aO=(aH+aI)/2,(aJ+aK)/2,(aI-aH)/2,(aK-aJ)/2 return{
zones=aG,center=Vector3.new(aL,0,aM),boundingRadius=math.sqrt(aN*aN+aO*aO)}end
local aA=function(aA)local aB=aA and aA.HazardZones if not aB then aB=az(aA)if
aB and aA then aA.HazardZones=aB end end return aB end function aa.
GetHazardZones(aB)return aA(aB)end function aa.GetNearbyHazards(aB,aC)local aD=
ag if not aD then return{}end aC=aC or 65 local aE,aF,aG={},aB.X,aB.Z for aH,aI
in pairs(aD.GetActiveHazardsMap())do local aJ,aK=aI.Instance,aA(aI)if aK then
local aL,aM=aK.center.X,aK.center.Z if aJ and aJ.Parent then local aN=aJ:IsA
'BasePart'and aJ or aJ.PrimaryPart or aJ:FindFirstChildWhichIsA'BasePart'if aN
then aL=aN.Position.X aM=aN.Position.Z end end local aN,aO=aF-aL,aG-aM local aP,
aQ=aN*aN+aO*aO,aC+aK.boundingRadius if aP<=aQ*aQ then table.insert(aE,aI)end end
end return aE end function aa.IsPointInAnyHazard(aB,aC,aD,aE)local aF=ag if not
aF then return false,nil,nil end aD=aD or 0 local aG,aH,aI,aJ=math.huge,aE or aF
.GetActiveHazardsMap()for aK,aL in pairs(aH)do local aM=aL.Instance or(typeof(aK
)=='Instance'and aK)if aC and(aC==aM or(aM and aC.Name==aM.Name))then continue
end local aN=aL.Name or(aM and aM.Name)or''if ap(aN)or as(aN)then continue end
local aO=aA(aL)if not aO then continue end local aP,aQ=aO.center.X,aO.center.Z
if aM and aM.Parent then local aR=aM:IsA'BasePart'and aM or aM.PrimaryPart or aM
:FindFirstChildWhichIsA'BasePart'if aR then aP=aR.Position.X aQ=aR.Position.Z
end end local aR,aS=aB.X-aP,aB.Z-aQ local aT,aU=aR*aR+aS*aS,aO.boundingRadius+aD
if aT>aU*aU then continue end local aV=aL.IsTrajectory==true for aW=1,#aO.zones
do local aX=aO.zones[aW]if av(aX.part)and ax(aB,aX,aD,aV or aX.isTrajectory)then
local aY=(aB-aX.part.Position).Magnitude if aY<aG then aG=aY aI=aL aJ=aX.part
end break end end end return aJ~=nil,aI,aJ end return aa end function a.m()local
aa,ab,ac=a.load'e',a.load'b',a.load'l'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao=
aa.RunService or game:GetService'RunService',aa.player,{},false,{},0.85,Color3.
fromRGB(255,45,45),Color3.fromRGB(0,160,255),0.55,0.25 local ap=function()local
ap=ae and ae.Character if not ap then return nil end local aq=ap:FindFirstChild
'HumanoidRootPart'or ap.PrimaryPart if not aq then return nil end return aq.
Position.Y-2.5 end function af.BindDetection(aq)an=aq or nil end local aq
function af.BindTrajectory(ar)aq=ar or nil end function af.IsEnabled()return ag
end local ar=function(ar,as)local at,au,av=ar.ad,ar.zone,ar.part local aw=ar.
anchorPart or av if not at or not at.Parent or not aw or not aw.Parent then
return end local ax=(au and au.cx and au.cz)and Vector3.new(au.cx,0,au.cz)or(av
and av.Position)if not ax then return end local ay=Vector3.new(ax.X,as or ax.Y,
ax.Z)if ar.isCircle then local az=CFrame.new(ay)*CFrame.Angles(math.rad(90),0,0)
at.CFrame=(aw==workspace.Terrain)and az or aw.CFrame:ToObjectSpace(az)else local
az if au and(au.isMovingBeam or au.isBigSpike)then local aA=aq and aq.
GetHazardDirection and aq.GetHazardDirection(ar.hazardInfo)if aA and aA.
Magnitude>0.01 then az=CFrame.lookAt(ay,ay+aA)else local aB=(av and av.Parent)
and av.CFrame or CFrame.identity local aC,aD,aE=aB:ToOrientation()az=CFrame.new(
ay)*CFrame.Angles(0,aD,0)end else local aA=(av and av.Parent)and av.CFrame or
CFrame.identity local aB,aD,aE=aA:ToOrientation()az=CFrame.new(ay)*CFrame.
Angles(0,aD,0)end at.CFrame=(aw==workspace.Terrain)and az or aw.CFrame:
ToObjectSpace(az)end end local as=function()if not ag then return end local as,
at,au=false,ap(),os.clock()for av,aw in pairs(ah)do local ax,ay=av.
IsSyntheticChain or(av.MaxExpireTime and au<av.MaxExpireTime),av.Instance and av
.Instance.Parent if not ay and not ax then af.DetachZoneVisuals(av)else if aw.
items then local az={}for aA,aD in ipairs(aw.items)do local aE=aD.zone if aE and
aE.expireTime and au>aE.expireTime then if aD.ad and aD.ad.Parent then pcall(
function()aD.ad:Destroy()end)end elseif aD.ad and aD.ad.Parent then table.
insert(az,aD)ar(aD,at)end end aw.items=az if#az>0 then as=true else af.
DetachZoneVisuals(av)end end end end if not as and ao then ao:Disconnect()ao=nil
end end local at=function()if not ao and ag then ao=ad.Heartbeat:Connect(as)end
end function af.DetachZoneVisuals(au)if not au then return end local av=ah[au]if
not av then return end if av.adornments then for aw,ax in ipairs(av.adornments)
do pcall(function()ax:Destroy()end)end table.clear(av.adornments)end if av.
connections then for aw,ax in ipairs(av.connections)do pcall(function()ax:
Disconnect()end)end table.clear(av.connections)end if av.items then table.clear(
av.items)end ah[au]=nil end function af.UpdateHazardVisualColor(au,av)if not au
then return end local aw=ah[au]if not aw or not aw.items then return end local
ax=av==true or au.IsTrajectory==true local ay,az=ax and ak or aj,ax and ac.
GetTrajectoryMargin()or 0 for aA,aD in ipairs(aw.items)do local aE,aF,aG=aD.ad,
aD.zone,aD.part if aE and aE.Parent and aF and aG and aG.Parent then aE.Color3=
ay if aD.isCircle and aF.radius then aE.Radius=aF.radius+az elseif aF.half then
local aH,aI=aF.half.X,aF.half.Z aE.Size=Vector3.new(aH*2,am,aI*2)end end end end
function af.AttachZoneVisuals(au)if not ag or not au then return end if ah[au]
then af.DetachZoneVisuals(au)end local av=ac.GetHazardZones(au)if not av or not
av.zones then return end local aw=au.IsTrajectory==true local ax,ay,az,aA,aD,aE,
aF=aw and ak or aj,aw and ac.GetTrajectoryMargin()or 0,ap(),{},{},{},workspace.
Terrain for aG,aH in ipairs(av.zones)do local aI,aJ,aK,aL=aH.part,aH.
isSecondBossChain==true,aH.isMovingBeam==true,aH.isBigSpike==true local aM=(aJ
or aK or aL)and aF or aI if aJ or aK or aL or(aI and aI.Parent and aI.
Transparency<=ai)then local aN,aO=false if aH.radius then aN=true local aP=
Instance.new'CylinderHandleAdornment'aP.Name='HazardGroundCircle'aP.Adornee=aM
aP.Radius=aH.radius+ay aP.Height=am aP.Color3=ax aP.Transparency=al aP.ZIndex=2
aP.AlwaysOnTop=true aP.Parent=aM aO=aP elseif aH.half and aH.cframe then local
aP=Instance.new'BoxHandleAdornment'aP.Name='HazardGroundBox'aP.Adornee=aM aP.
Size=Vector3.new(aH.half.X*2,am,aH.half.Z*2)aP.Color3=ax aP.Transparency=al aP.
ZIndex=2 aP.AlwaysOnTop=true aP.Parent=aM aO=aP end if aO then local aP={ad=aO,
part=aI,anchorPart=aM,isCircle=aN,zone=aH,hazardInfo=au}ar(aP,az)table.insert(aA
,aP)table.insert(aD,aO)if(not aJ and not aK)and aI then local aQ=aI:
GetPropertyChangedSignal'Transparency':Connect(function()if aI.Parent and aI.
Transparency>ai then pcall(function()aO:Destroy()end)end end)table.insert(aE,aQ)
end end end end if#aD>0 then ah[au]={items=aA,adornments=aD,connections=aE}at()
end end function af.ClearAll()if ao then ao:Disconnect()ao=nil end for au in
pairs(ah)do af.DetachZoneVisuals(au)end table.clear(ah)end function af.
RefreshAll()af.ClearAll()if not ag or not an then return end for au,av in pairs(
an.GetActiveHazardsMap())do af.AttachZoneVisuals(av)end end function af.
SetEnabled(au)ag=au and true or false if ag then af.RefreshAll()else af.
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
then return 2.5 end local ay=aw()if ay then local az=ay+2.5 local aA,aD=az-ax.
Position.Y,ax.Size.Y/2+1.2 return math.clamp(math.max(aA,aD),1.5,30)end return
math.clamp(ax.Size.Y/2+1.8,2,10)end,function(ax)return ax and ax.Parent and ax.
Transparency<=aj end local az,aA=function(az)if not az or not az.Parent then
return nil end if az:IsA'BasePart'then if ay(az)then return az end elseif az:IsA
'Model'then if az.PrimaryPart and ay(az.PrimaryPart)then return az.PrimaryPart
end local aA=az:FindFirstChild'HumanoidRootPart'if aA and ay(aA)then return aA
end for aD,aE in ipairs(az:GetDescendants())do if aE:IsA'BasePart'and ay(aE)then
return aE end end else for aA,aD in ipairs(az:GetDescendants())do if aD:IsA
'BasePart'and ay(aD)then return aD end end end return nil end,function(az)local
aA,aD=az and az.IsTrajectory==true,az and az.Name or'Hazard'local aE,aF=ag.
IsChasingProjectile(aD),ag.IsEnemyProjectile(aD)local aG=not aA or aE if aE then
local aH,aI=an,'220,100,255'return'C',aH,aI,true elseif aF then local aH,aI=aA
and am or al,aA and'255,160,50'or'0,210,255'return'P',aH,aI,aG else local aH,aI=
aA and am or ak,aA and'255,160,50'or'255,80,80'return'N',aH,aI,aG end end local
aD=function(aD,aE)if not aD or not aD.items or not aE then return end local aF,
aG,aH,aI=aA(aE)local aJ,aK=aE.Name or'Hazard',''if aI then local aL=aE.
SpawnClock or os.clock()local aM=math.max(0,os.clock()-aL)aK=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(255,220,220)'>%s</font> <font color='rgb(255,255,255)'><b>%.1fs</b></font>]]
):format(aH,aF,aJ,aM)else aK=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(220,235,255)'>%s</font>]]
):format(aH,aF,aJ)end for aL,aM in ipairs(aD.items)do if aM.label and aM.label.
Parent then aM.label.Text=aK end if aM.stroke and aM.stroke.Parent and aM.stroke
.Color~=aG then aM.stroke.Color=aG end end end local aE=function()if not ah then
return end local aE=false for aF,aG in pairs(ai)do local aH=aF.Instance if not
aH or not aH.Parent then ag.DetachTimerVisual(aF)else if aG.items then for aI=#
aG.items,1,-1 do local aJ=aG.items[aI]local aK=aJ.part if not ay(aK)then if aJ.
billboard and aJ.billboard.Parent then pcall(function()aJ.billboard:Destroy()end
)end table.remove(aG.items,aI)else if aJ.billboard and aJ.billboard.Parent then
aJ.billboard.StudsOffset=Vector3.new(0,ax(aK),0)end end end if#aG.items==0 then
ag.DetachTimerVisual(aF)else aE=true aD(aG,aF)end else ag.DetachTimerVisual(aF)
end end end if not aE and au then au:Disconnect()au=nil end end local aF,aG=
function()if not au and ah then au=ad.Heartbeat:Connect(aE)end end,function(aF,
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
aR,aS,aT,aU,nil)end if#aO>0 then local aS={items=aO,connections=aP}ai[aH]=aS aD(
aS,aH)aF()end end function ag.DetachTimerVisual(aH)if not aH then return end
local aI=ai[aH]if not aI then return end if aI.connections then for aJ,aK in
ipairs(aI.connections)do pcall(function()aK:Disconnect()end)end table.clear(aI.
connections)end if aI.items then for aJ,aK in ipairs(aI.items)do if aK.billboard
and aK.billboard.Parent then pcall(function()aK.billboard:Destroy()end)end end
table.clear(aI.items)end ai[aH]=nil end function ag.UpdateHazardVisualColor(aH,
aI)if not aH then return end local aJ=ai[aH]if aJ then aD(aJ,aH)else ag.
AttachTimerVisual(aH)end end function ag.ClearAll()if au then au:Disconnect()au=
nil end for aH in pairs(ai)do ag.DetachTimerVisual(aH)end table.clear(ai)end
function ag.RefreshAll()ag.ClearAll()if not ah or not at then return end for aH,
aI in pairs(at.GetActiveHazardsMap())do if aI then ag.AttachTimerVisual(aI)end
end end function ag.SetEnabled(aH)ah=aH and true or false if ah then ag.
RefreshAll()else ag.ClearAll()end end ab.Register(function()ag.ClearAll()end)
return ag end function a.o()local aa,ab,ac,ad=a.load'e',a.load'b',a.load'l',a.
load'n'local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au=aa.RunService or
game:GetService'RunService',aa.player,{},false,45,{secondbossmovingbeam=80},{},
0.85,Color3.fromRGB(255,140,0),0.65,0.2,3.5,{firstbossseekingspikes=
'target_player',firstbossbigspike='look_vector',firstbossbeampart='look_vector',
secondbossmovingbeam='look_vector'},function(ae)if not ae or type(ae)~='string'
then return false end local af=ae:lower():gsub('%s+','')return string.find(af,
'firstbossbeampart',1,true)~=nil end,function(ae)if not ae or type(ae)~='string'
then return false end local af=ae:lower():gsub('%s+','')if#af==0 or string.find(
af,'seekingspike',1,true)then return false end return string.find(af,
'firstbossbigspike',1,true)~=nil or string.find(af,'firstbossbeampart',1,true)~=
nil or string.find(af,'bigspike',1,true)~=nil end local av=function(av)if not av
or not av.Parent then return nil,nil,nil,nil end local aw,ax=((av.Name or''):
lower())if ar(aw)then ax=av:IsA'BasePart'and av or av:FindFirstChildWhichIsA
'BasePart'end if not ax then local ay=av:IsA'BasePart'and av.Position or(av:IsA
'Model'and av:GetPivot().Position)if ay then local az=35 for aA,aD in ipairs(
workspace:GetChildren())do local aE=aD.Name:lower()if ar(aE)or(string.find(aE,
'beampart',1,true)and not string.find(aE,'thirdboss',1,true))then local aF=aD:
IsA'BasePart'and aD.Position or(aD:IsA'Model'and aD:GetPivot().Position)if aF
then local aG=(aF-ay).Magnitude if aG<az then az=aG ax=aD end end end end end
end if not ax then return nil,nil,nil,nil end local ay=ax:FindFirstChild(
'Attachment2',true)if not ay or not ay:IsA'Attachment'then for az,aA in ipairs(
ax:GetDescendants())do if aA:IsA'Attachment'and aA.Name~='Attachment0'and aA.
Name~='Attachment1'then ay=aA break end end end local az,aA=ax.Position,ay and
ay.WorldPosition if aA and az then local aD=aA-az local aE=Vector3.new(aD.X,0,aD
.Z)local aF=aE.Magnitude if aF>5 then local aG=aE.Unit return aF,aG,az,aA end
end return nil,nil,nil,nil end local aw,ax=av local ay,az,aA=function(ay)if ay
and not ar(ay.Name)then local az=ay:IsA'BasePart'and ay or ay:
FindFirstChildWhichIsA'BasePart'if az then local aA,aD=az.Size,az:
FindFirstChildWhichIsA('SpecialMesh',true)if aD then aA=Vector3.new(aA.X*math.
abs(aD.Scale.X),aA.Y*math.abs(aD.Scale.Y),aA.Z*math.abs(aD.Scale.Z))end local aE
={aA.X,aA.Y,aA.Z}table.sort(aE)local aF=aE[2]if aF<3 then aF=math.max(aE[1],aE[2
])end ax=math.clamp(aF,4,24)return ax end end if ax then return ax end local az=
game:GetService'ReplicatedStorage'local aA=az:FindFirstChild'enemyProjectiles'
local aD=aA and aA:FindFirstChild'firstBossBigSpike'if aD then local aE=aD:IsA
'BasePart'and aD or aD:FindFirstChildWhichIsA'BasePart'if aE then local aF,aG=aE
.Size,aE:FindFirstChildWhichIsA('SpecialMesh',true)if aG then aF=Vector3.new(aF.
X*math.abs(aG.Scale.X),aF.Y*math.abs(aG.Scale.Y),aF.Z*math.abs(aG.Scale.Z))end
local aH={aF.X,aF.Y,aF.Z}table.sort(aH)local aI=aH[2]if aI<3 then aI=math.max(aH
[1],aH[2])end ax=math.clamp(aI,4,24)return ax end end return 10 end,function(ay)
if not ay then return ai end local az,aA=''if type(ay)=='string'then az=ay
elseif type(ay)=='table'then az=ay.Name or(ay.Instance and ay.Instance.Name)or''
aA=ak[ay]end if as(az)then if aA and aA.beamLength then return aA.beamLength end
return aj.firstbossbigspike or 140 end if aA and aA.beamLength then return aA.
beamLength end local aD=az:lower():gsub('%s+','')if aj[aD]then return aj[aD]end
for aE,aF in pairs(aj)do if string.find(aD,aE,1,true)then return aF end end
return ai end,function()local ay=af and af.Character if not ay then return nil
end local az=ay:FindFirstChild'HumanoidRootPart'or ay.PrimaryPart if not az then
return nil end return az.Position end local aD,aE=function(aD,aE)if not aD or
not aE then return nil,nil end local aF=aD:lower():gsub('%s+','')local aG=aq[aF]
if not aG then for aH,aI in pairs(aq)do if string.find(aF,aH,1,true)then aG=aI
break end end end if not aG then return nil,nil end if aG=='look_vector'then
local aH=aE.CFrame.LookVector local aI=Vector3.new(aH.X,0,aH.Z)if aI.Magnitude>
0.01 then return aI.Unit,aG end else local aH=aA()if aH then local aI=aH-aE.
Position local aJ=Vector3.new(aI.X,0,aI.Z)if aJ.Magnitude>0.1 then return aJ.
Unit,aG end end local aI=aE.CFrame.LookVector local aJ=Vector3.new(aI.X,0,aI.Z)
if aJ.Magnitude>0.01 then return aJ.Unit,aG end end return nil,nil end,function(
)local aD=af and af.Character if not aD then return nil end local aE=aD:
FindFirstChild'HumanoidRootPart'or aD.PrimaryPart if not aE then return nil end
return aE.Position.Y-2.5 end function ag.BindDetection(aF)at=aF or nil end
function ag.IsEnabled()return ah end function ag.GetPredictionLength()return ai
end function ag.SetPredictionLength(aF)if type(aF)=='number'and aF>0 then ai=
math.clamp(aF,10,200)ag.RefreshAll()end end function ag.
GetHazardPredictionLength(aF)return az(aF)end function ag.GetCustomLength(aF)if
not aF then return nil end local aG=aF:lower():gsub('%s+','')return aj[aG]end
function ag.SetCustomLength(aF,aG)if not aF then return end local aH=aF:lower():
gsub('%s+','')if type(aG)=='number'and aG>0 then aj[aH]=math.clamp(aG,10,300)
else aj[aH]=nil end ag.RefreshAll()end function ag.GetSecondBossBeamLength()
return aj.secondbossmovingbeam or 80 end function ag.SetSecondBossBeamLength(aF)
ag.SetCustomLength('secondbossmovingbeam',aF)end function ag.IsHazardMoving(aF)
if not aF then return false end local aG=ak[aF]return aG and aG.isMoving==true
end function ag.GetHazardDirection(aF)if not aF then return nil end local aG=ak[
aF]return aG and aG.dir or nil end local aF,aG=function(aF,aG)local aH=aF.
Instance if not aH or not aH.Parent then return nil,4 end local aI,aJ=ac.
GetTrajectoryMargin and ac.GetTrajectoryMargin()or 2,aF.Name or(aH and aH.Name)
or''if as(aJ)then local aK=ak[aF]local aL=(aK and aK.mainPart)or(aH:IsA
'BasePart'and aH or aH.PrimaryPart or aH:FindFirstChildWhichIsA'BasePart')local
aM,aN=(aK and aK.beamStartPos)or(aL and aL.Position)or aH.Position,ay(aL)local
aO=math.max(1,aN+aI*2)return Vector3.new(aM.X,0,aM.Z),aO end local aK,aL={},ac.
IsForceCircle and ac.IsForceCircle(aJ)if aH:IsA'BasePart'then if aH.Transparency
<=al then table.insert(aK,aH)end else for aM,aN in ipairs(aH:GetDescendants())do
if aN:IsA'BasePart'and aN.Parent and aN.Transparency<=al then table.insert(aK,aN
)end end end if#aK==0 then return nil,4 end local aM,aN,aO,aP=Vector3.new(-aG.Z,
0,aG.X),math.huge,-math.huge,0 for aQ,aR in ipairs(aK)do local aS,aT,aU=aR.
Position,aR.Size,0 if aL or(aR:IsA'Part'and(aR.Shape==Enum.PartType.Ball or aR.
Shape==Enum.PartType.Cylinder))then aU=math.max(aT.X,aT.Y,aT.Z)/2 else local aV=
aR.CFrame local aW,aX,aY,aZ,a_,a0=aV.RightVector,aV.UpVector,aV.LookVector,aT.X/
2,aT.Y/2,aT.Z/2 aU=aZ*math.abs(aW.X*aM.X+aW.Z*aM.Z)+a_*math.abs(aX.X*aM.X+aX.Z*
aM.Z)+a0*math.abs(aY.X*aM.X+aY.Z*aM.Z)end local aV=aS.X*aM.X+aS.Z*aM.Z aN=math.
min(aN,aV-aU)aO=math.max(aO,aV+aU)local aW=aS.X*aG.X+aS.Z*aG.Z aP+=aW end local
aQ,aR,aS=math.max(1,(aO-aN)+aI*2),(aN+aO)/2,aP/#aK local aT=aG*aS+aM*aR return
aT,aQ end,function(aF,aG,aH,aI,aJ,aK,aL)if not aG or not aG.Parent or not aF or
not aF.Parent then return end local aM=aK/2 local aN=Vector3.new(aH.X+aI.X*aM,aJ
or aH.Y,aH.Z+aI.Z*aM)local aO=aN+Vector3.new(aI.X,0,aI.Z)local aP=CFrame.lookAt(
aN,aO)aF.CFrame=(aF.Adornee==workspace.Terrain)and aP or aG.CFrame:
ToObjectSpace(aP)aF.Size=Vector3.new(aL,ao,aK)if not aF.Visible then aF.Visible=
true end end local aH=function()if not ah then return end local aH,aI,aJ=false,
os.clock(),aE()for aK,aL in pairs(ak)do local aM=aK.Instance if not aM or not aM
.Parent then ag.DetachTrajectoryVisuals(aK)else aH=true local aN,aO=aL.mainPart,
aK.Name or(aM and aM.Name)local aP=ad and ad.IsChasingProjectile and ad.
IsChasingProjectile(aO)if aP then if aL.ad and aL.ad.Visible then aL.ad.Visible=
false end aL.isMoving=false aK.IsTrajectory=false elseif aN and aN.Parent then
local aQ,aR=aN.Position,aI-(aL.lastClock or aI)if aL.isBigSpike then if not aL.
beamFound then local aS,aT,aU,aV=aw(aN)if aS and aT then aL.beamFound=true aL.
beamLength=aS aL.beamDir=aT aL.beamStartPos=aU aL.beamTargetPos=aV aL.dir=aT end
end if aL.beamDir then aL.dir=aL.beamDir end aL.isMoving=true end if aR>=0.035
then local aS=aQ-(aL.lastPos or aQ)local aT,aU=aS.Magnitude/aR,Vector3.new(aS.X,
0,aS.Z)local aV,aW=aU.Magnitude/aR,aL.isMoving==true if aV>=ap then aL.isMoving=
true if not aL.isBigSpike then aL.dir=aU.Unit end else if not aL.isInstant and
not aL.isBigSpike and aR>=0.25 and aT<ap then aL.isMoving=false end end if aL.
isMoving~=aW then aK.IsTrajectory=aL.isMoving aK.HazardZones=nil if at and at.
UpdateHazardVisualColor then pcall(at.UpdateHazardVisualColor,aK,aL.isMoving)end
local aX=a.load'm'if aX and aX.UpdateHazardVisualColor then pcall(aX.
UpdateHazardVisualColor,aK,aL.isMoving)end end aL.lastPos=aQ aL.lastClock=aI end
if aL.isMoving and aL.dir and aL.ad then local aS,aT=aF(aK,aL.dir)if aS then
local aU=az(aK)aG(aL.ad,aN,aS,aL.dir,aJ,aU,aT)end else if aL.ad and aL.ad.
Visible then aL.ad.Visible=false end end end end end if not aH and au then au:
Disconnect()au=nil end end local aI=function()if not au and ah then au=ae.
Heartbeat:Connect(aH)end end function ag.DetachTrajectoryVisuals(aJ)if not aJ
then return end local aK=ak[aJ]if not aK then return end if aK.ad then pcall(
function()aK.ad:Destroy()end)aK.ad=nil end if aK.connections then for aL,aM in
ipairs(aK.connections)do pcall(function()aM:Disconnect()end)end table.clear(aK.
connections)end ak[aJ]=nil end function ag.AttachTrajectoryVisuals(aJ)if not ah
or not aJ then return end if ak[aJ]then ag.DetachTrajectoryVisuals(aJ)end local
aK=aJ.Instance if not aK or not aK.Parent then return end local aL=aJ.Name or(aK
and aK.Name)if ad and ad.IsChasingProjectile and ad.IsChasingProjectile(aL)then
aJ.IsTrajectory=false return end local aM if aK:IsA'BasePart'then aM=aK else aM=
aK.PrimaryPart or aK:FindFirstChildWhichIsA'BasePart'if not aM then for aN,aO in
ipairs(aK:GetDescendants())do if aO:IsA'BasePart'and aO.Parent then aM=aO break
end end end end if not aM or not aM.Parent then return end local aN,aO=az(aJ),
Instance.new'BoxHandleAdornment'aO.Name='HazardTrajectoryCorridor'aO.Adornee=
workspace.Terrain aO.Size=Vector3.new(4,ao,aN)aO.Color3=am aO.Transparency=an aO
.ZIndex=1 aO.AlwaysOnTop=true aO.Visible=false aO.Parent=workspace.Terrain local
aP=aJ.Name or(aK and aK.Name)local aQ,aR=as(aP),ar(aP)if aQ and not aR then for
aS,aT in pairs(ak)do if aT and aT.isBigSpike and aT.isBeam then aJ.IsTrajectory=
false return end end end local aS={}if not aR then local aT=aM:
GetPropertyChangedSignal'Transparency':Connect(function()if aM.Parent and aM.
Transparency>al then pcall(function()aO:Destroy()end)end end)table.insert(aS,aT)
end local aT=aM.AncestryChanged:Connect(function(aT,aU)if not aU then pcall(
function()aO:Destroy()end)end end)table.insert(aS,aT)local aU,aV=aD(aP,aM)local
aW,aX,aY,aZ,a_=(aU~=nil)if aQ then aX,aY,aZ,a_=av(aK)if aY then aU=aY aW=true
end end ak[aJ]={ad=aO,connections=aS,mainPart=aM,lastPos=aM.Position,lastClock=
os.clock(),velocity=Vector3.zero,dir=aU,isMoving=aW,isInstant=aW,instantMode=aV,
isBigSpike=aQ,isBeam=aR,beamFound=aX~=nil,beamLength=aX,beamDir=aY,beamStartPos=
aZ or aM.Position,beamTargetPos=a_}if aW and aU then aJ.IsTrajectory=true aJ.
HazardZones=nil local a0,a1,a2=aE(),aF(aJ,aU)local a3=az(aJ)if a1 then aG(aO,aM,
a1,aU,a0,a3,a2)end if at and at.UpdateHazardVisualColor then pcall(at.
UpdateHazardVisualColor,aJ,true)end local a4=a.load'm'if a4 and a4.
UpdateHazardVisualColor then pcall(a4.UpdateHazardVisualColor,aJ,true)end local
a5=a.load'n'if a5 and a5.UpdateHazardVisualColor then pcall(a5.
UpdateHazardVisualColor,aJ,true)end end aI()end function ag.ClearAll()if au then
au:Disconnect()au=nil end for aJ in pairs(ak)do ag.DetachTrajectoryVisuals(aJ)
end table.clear(ak)end function ag.RefreshAll()ag.ClearAll()if not ah or not at
then return end for aJ,aK in pairs(at.GetActiveHazardsMap())do ag.
AttachTrajectoryVisuals(aK)end end function ag.GetNearbyTrajectories(aJ,aK)aK=aK
or 65 local aM,aN,aO={},aJ.X,aJ.Z for aP,aQ in pairs(ak)do if aQ.isMoving and aQ
.dir and aQ.mainPart and aQ.mainPart.Parent then local aR,aS=aF(aP,aQ.dir)if aR
and aS then local aT,aU,aV=az(aP),aR.X,aR.Z local aW,aX=aN-aU,aO-aV local aY,aZ=
aW*aW+aX*aX,aK+aT+(aS/2)if aY<=aZ*aZ then table.insert(aM,{info=aP,record=aQ})
end end end end return aM end function ag.IsPointInAnyTrajectory(aJ,aK,aM)local
aN,aO=aJ.X,aJ.Z aK=aK or 0 local aP=3 if aM then for aQ,aR in ipairs(aM)do local
aS,aT=aR.info,aR.record if aT and aT.isMoving and aT.dir and aT.mainPart and aT.
mainPart.Parent then local aU,aV=aF(aS,aT.dir)if aU and aV then local aW,aX=az(
aS),aT.dir local aY,aZ,a_=Vector3.new(-aX.Z,0,aX.X),aN-aU.X,aO-aU.Z local a0,a1,
a2,a3,a4=aZ*aX.X+a_*aX.Z,aZ*aY.X+a_*aY.Z,aV/2,-aP,aW if aK<=0 then if a0>=a3 and
a0<=a4 and math.abs(a1)<=a2 then return true,aS,aX,aU,aV end else local a5=0 if
a0<a3 then a5=a3-a0 elseif a0>a4 then a5=a0-a4 end local a6=math.max(0,math.abs(
a1)-a2)if(a5*a5+a6*a6)<=(aK*aK)then return true,aS,aX,aU,aV end end end end end
return false,nil,nil,nil,nil end for aQ,aR in pairs(ak)do if aR.isMoving and aR.
dir and aR.mainPart and aR.mainPart.Parent then local aS,aT=aF(aQ,aR.dir)if aS
and aT then local aU,aV=az(aQ),aR.dir local aW,aX,aY=Vector3.new(-aV.Z,0,aV.X),
aN-aS.X,aO-aS.Z local aZ,a_,a0,a1,a2=aX*aV.X+aY*aV.Z,aX*aW.X+aY*aW.Z,aT/2,-aP,aU
if aK<=0 then if aZ>=a1 and aZ<=a2 and math.abs(a_)<=a0 then return true,aQ,aV,
aS,aT end else local a3=0 if aZ<a1 then a3=a1-aZ elseif aZ>a2 then a3=aZ-a2 end
local a4=math.max(0,math.abs(a_)-a0)if(a3*a3+a4*a4)<=(aK*aK)then return true,aQ,
aV,aS,aT end end end end end return false,nil,nil,nil,nil end function ag.
SetEnabled(aJ)ah=aJ and true or false if ah then ag.RefreshAll()else ag.
ClearAll()end end ac.OnPaddingChanged(function()if ah then ag.RefreshAll()end
end)ab.Register(function()ag.ClearAll()end)return ag end function a.p()local aa,
ab,ac,ad,ae,af,ag,ah,ai,aj=a.load'e',a.load'f',a.load'b',a.load'l',a.load'm',a.
load'o',a.load'n',game:GetService'Players',game:GetService'Workspace',game:
GetService'ReplicatedStorage'local ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax,ay,
az,aA,aD,aE,aF=aa.player,{},false,false,true,false,false,'',false,{},0,{},{},0,{
'abilities','projectiles'},false,{},{firstbossbeamparticles=true}local aG,aH,aI,
aJ,aK,aM,aN,aO=function()if az then return end az=true for aG,aH in ipairs(ay)do
local aI=aj:FindFirstChild(aH)if aI then for aJ,aK in ipairs(aI:GetChildren())do
local aM=(aK.Name or''):lower():gsub('%s+','')if#aM>0 then aA[aM]=true end end
end end end,function(aG)if not aG then return true end local aH=aG.Name if
typeof(aH)=='string'then local aI=aH:lower()if aI:sub(1,3)=='tm_'or aI:sub(1,3)
=='pr_'or aI:sub(1,3)=='dq_'or aI:find'pathrecord'or aI:find'safespot'or aI:find
'hazard'or aI:find'adornment'or aI:find'debug'or aI:find'targetpart'or aI:find
'actualmarker'then return true end local aJ=aG.Parent while aJ and aJ~=workspace
and aJ~=game do local aK=aJ.Name if typeof(aK)=='string'then local aM=aK:lower()
if aM:find'pathrecord'or aM:sub(1,3)=='tm_'or aM:sub(1,3)=='pr_'then return true
end end aJ=aJ.Parent end local aK=aI:gsub('%s+','')if#aK>0 and aA[aK]==true then
return true end if aD[aK]==true or aD[aH]==true then return true end for aM,aN
in pairs(aD)do if string.find(aK,aM,1,true)then return true end end end return
false end,function(aG)if not aG then return false end if ah:
GetPlayerFromCharacter(aG)then return true end if ah:FindFirstChild(aG.Name)then
return true end for aH,aI in ipairs(ah:GetPlayers())do if aG.Name==aI.Name then
return true end local aJ=aI.Character if aJ and(aG==aJ or aG:IsDescendantOf(aJ))
then return true end end local aH=ak and ak.Character if aH and(aG==aH or aG:
IsDescendantOf(aH))then return true end return false end,function()local aG=0
for aH in pairs(at)do aG+=1 end au=aG for aH=#av,1,-1 do pcall(av[aH],aG,aE)end
end,0.85,50,0.05,{}local aP,aQ,aR=function(aP)local aQ=aO[aP]if aQ then aQ.
active=false aO[aP]=nil end end,function()for aP,aQ in pairs(aO)do if aQ then aQ
.active=false end end table.clear(aO)end,function(aP)if not aP or type(aP)~=
'string'then return false end local aQ=aP:lower():gsub('%s+','')return string.
find(aQ,'firstbossbeampart',1,true)~=nil end local aS,aT,aU,aV,aW,aX=function(aS
)if not aS then return{}end local aT={}local aU=function(aU)if aU and aU.Parent
and(aU.Transparency<=aK or aR(aU.Name)or aR(aS.Name))then aT[#aT+1]=aU end end
if aS:IsA'BasePart'then aU(aS)else for aV,aW in ipairs(aS:GetDescendants())do if
aW:IsA'BasePart'and aW.Parent then aU(aW)end end end return aT end,function(aS)
local aT=ak and ak.Character if not aT then return 0 end local aU=aT:
FindFirstChild'HumanoidRootPart'or aT.PrimaryPart if not aU then return 0 end
local aV,aW=(aU.Position)if aS:IsA'BasePart'then aW=aS.Position elseif aS:IsA
'Model'then local aX,aY=pcall(function()return aS:GetPivot().Position end)if aX
then aW=aY else local aZ=aS:FindFirstChildWhichIsA'BasePart'aW=aZ and aZ.
Position end end if not aW then return 0 end return math.floor((aV-aW).Magnitude
+0.5)end,Color3.fromRGB(255,45,45),Color3.fromRGB(255,30,30),Color3.fromRGB(0,
170,255),Color3.fromRGB(0,140,255)local aY=function(aY,aZ,a_)local a0,a1,a2={},
a_ and aW or aU,a_ and aX or aV for a3,a4 in ipairs(aY)do if a4 and a4.Parent
and not aR(a4.Name)and not aR(a4.Parent and a4.Parent.Name)then local a5=
Instance.new'SelectionBox'a5.Name='HazardSelectionBox'a5.Color3=a1 a5.
SurfaceColor3=a2 a5.SurfaceTransparency=0.6 a5.LineThickness=0.05 a5.Adornee=a4
a5.Parent=a4 local a6=a4:GetPropertyChangedSignal'Transparency':Connect(function
()if a4.Parent and a4.Transparency>aK then pcall(function()a5:Destroy()end)end
end)if aZ then table.insert(aZ,a6)end a0[#a0+1]=a5 end end return a0 end
function al.UpdateHazardVisualColor(aZ,a_)if not aZ or not aZ.Boxes then return
end local a0=a_==true or aZ.IsTrajectory==true local a1,a2=a0 and aW or aU,a0
and aX or aV for a3,a4 in ipairs(aZ.Boxes)do if a4 and a4.Parent then a4.Color3=
a1 a4.SurfaceColor3=a2 end end ag.UpdateHazardVisualColor(aZ,a0)end local aZ,a_=
function(aZ)if not as or ar==''then return false end if not aZ or type(aZ)~=
'string'then return false end local a_=ar:lower():gsub('%s+','')if#a_==0 then
return false end local a0=aZ:lower():gsub('%s+','')return string.find(a0,a_,1,
true)~=nil end,function(aZ)if not aZ then return'nil'end return(
'(%.2f, %.2f, %.2f)'):format(aZ.X,aZ.Y,aZ.Z)end local a0=function(a0,a1,a2,a3)if
not a0 then return end local a4=a0.Name if not aZ(a4)then return end local a5,a6
,a7=a0.ClassName,a0.Parent and a0.Parent:GetFullName()or'nil',aT(a0)print
'================== \u{1f50d} [HAZARD DEEP INSPECT] \u{1f50d} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(a4,a5))print((
'  \u{1f4cc} Event Type     : %s%s'):format(a1,a2 and(' -> '..tostring(a2))or'')
)print(('  \u{1f4cd} Full Path      : %s'):format(a6))print((
'  \u{1f4cf} Dist to Player : %d studs'):format(a7))if a1=='SPAWN'then local a8=
{}if a0:IsA'BasePart'then table.insert(a8,a0)else for a9,b in ipairs(a0:
GetDescendants())do if b:IsA'BasePart'then table.insert(a8,b)end end end print((
'  \u{1f9e9} Total Parts (%d) :'):format(#a8))for a9,b in ipairs(a8)do local ba=
b:IsA'Part'and tostring(b.Shape.Name)or(b.ClassName=='MeshPart'and'MeshPart'or b
.ClassName)print(('     [%d] %q (%s)'):format(a9,b.Name,b.ClassName))print((
'         \u{2022} Size: %s | Shape: %s | Trans: %.2f | CanCollide: %s'):format(
a_(b.Size),ba,b.Transparency,tostring(b.CanCollide)))print((
'         \u{2022} Pos : %s'):format(a_(b.Position)))end local a9=ad.
GetHazardZones(a3)if a9 and a9.zones then local b=ad.GetHitboxPadding()print((
'  \u{1f4d0} Math Geometry (Zones: %d, BoundingRadius: %.1f studs):'):format(#a9
.zones,a9.boundingRadius or 0))for ba,bb in ipairs(a9.zones)do if bb.radius then
print((
[[     - Zone [%d]: Circle/Ball (Base Radius: %.2f + Pad: %.2f = %.2f studs)]]):
format(ba,bb.radius,b,bb.radius+b))elseif bb.half then print((
'     - Zone [%d]: Box/OBB (HalfSize: %s)'):format(ba,a_(bb.half)))end end end
task.spawn(function()local b if a0:IsA'BasePart'then b=a0 elseif a0:IsA'Model'
then b=a0.PrimaryPart or a0:FindFirstChildWhichIsA'BasePart'end if not b then
return end local ba,bb=os.clock(),b.CFrame task.wait(0.12)if not a0.Parent or
not b.Parent then return end local bc,bd=os.clock(),b.CFrame local be=bc-ba if
be<=0 then return end local bf=bd*bb:Inverse()local bg,bh=bf:ToAxisAngle()local
bi,bj=math.deg(bh)/be,bb:Inverse()*bd local bk,bl=bj:ToAxisAngle()if math.abs(
math.deg(bh))>=1.5 then local bm=
'Tr\u{1ee5}c t\u{1ef1} do / H\u{1ed7}n h\u{1ee3}p'if math.abs(bg.Y)>=0.8 then bm
='Tr\u{1ee5}c Y (Yaw - Qu\u{e9}t ngang m\u{1eb7}t s\u{e0}n)'elseif math.abs(bg.X
)>=0.8 then bm='Tr\u{1ee5}c X (Pitch - L\u{103}n nh\u{e0}o l\u{1ed9}n)'elseif
math.abs(bg.Z)>=0.8 then bm=
'Tr\u{1ee5}c Z (Roll - Nghi\u{ea}ng l\u{1ead}t b\u{ea}n)'end local bn=
'Tr\u{1ee5}c t\u{1ef1} do'if math.abs(bk.Y)>=0.8 then bn='Tr\u{1ee5}c Local Y'
elseif math.abs(bk.X)>=0.8 then bn='Tr\u{1ee5}c Local X'elseif math.abs(bk.Z)>=
0.8 then bn='Tr\u{1ee5}c Local Z'end print
'================== \u{1f504} [INSPECT: SPINNING DETECTED] \u{1f504} =================='
print(('  \u{1f3af} Target Name    : %s (%s)'):format(a0.Name,b.Name))print((
'  \u{26a1} T\u{1ed1}c \u{111}\u{1ed9} xoay    : %.2f \u{b0}/s (%.2f rad/s)'):
format(bi,bh/be))print(('  \u{1f310} World Spin Axis: %s -> %s'):format(a_(bg),
bm))print(('  \u{1f9e9} Local Spin Axis: %s -> %s'):format(a_(bk),bn))print
[[========================================================================]]end
end)elseif a1=='DESPAWN'then if a3 and a3.SpawnClock then local a8=os.clock()-a3
.SpawnClock print(('  \u{23f1}\u{fe0f} Lifetime Active: %.2f seconds'):format(a8
))end elseif a1=='REJECTED'then print(('  \u{26a0}\u{fe0f} Rejection Reason: %s'
):format(tostring(a2)))end print
[[================================================================]]end local a1
,a2=function(a1,a2)a0(a1,'REJECTED',a2,nil)if not aq then return end local a3,a4
=a1 and a1.Name or'?',a1 and a1.ClassName or'?'print((
'[HazardScanner][Reject] \u{26aa} %s (%s) \u{2014} %s'):format(a3,a4,a2))end
local a3=function(a3)if not a3 or not a3.Parent then return end if aI(a3)then
return end if at[a3]then return end if aO[a3]then return end local a4={active=
true,count=0}aO[a3]=a4 task.spawn(function()while a4.active and a3.Parent and am
and an do if aI(a3)then aP(a3)return end a4.count+=1 local a5,a6,a7=a3:
GetDescendants(),aS(a3),aZ(a3.Name)if aq or a7 then print((
'[HazardScanner][Retry] \u{1f504} L\u{1ea7}n %d/%d: %q (%s) | Descendants: %d | Valid Parts (Trans<=%.2f): %d'
):format(a4.count,aM,a3.Name,a3.ClassName,#a5,aK,#a6))end if#a6>0 then if aq or
a7 then print((
'[HazardScanner][Retry] \u{2705} L\u{1ea7}n %d/%d: %q \u{110}\u{e3} t\u{ec}m th\u{1ea5}y %d part(s)! Ti\u{1ebf}n h\u{e0}nh v\u{1ebd}...'
):format(a4.count,aM,a3.Name,#a6))end aP(a3)a2(a3)return end if a4.count>=aM
then a1(a3,(
'H\u{1ebf}t %d l\u{1b0}\u{1ee3}t retry m\u{e0} kh\u{f4}ng t\u{ec}m th\u{1ea5}y BasePart h\u{1ee3}p l\u{1ec7} (Descendants: %d)'
):format(aM,#a5))aP(a3)return end task.wait(aN)end aP(a3)end)end a2=function(a4)
if not am or not an then a1(a4,'Ch\u{1b0}a trong dungeon')return false end if
not a4 or not a4.Parent then a1(a4,'Kh\u{f4}ng c\u{f2}n Parent')return false end
if aI(a4)then a1(a4,
'Nh\u{e2}n v\u{1ead}t ng\u{1b0}\u{1edd}i ch\u{1a1}i (Player/Teammate)')return
false end if at[a4]then return true end aG()if aH(a4)then a1(a4,
'Tr\u{f9}ng t\u{ea}n trong ReplicatedStorage (abilities/projectiles)')return
false end local a5=aS(a4)if#a5==0 then a1(a4,
'Ch\u{1b0}a c\u{f3} part \u{111}\u{1ec3} v\u{1ebd} (s\u{1ebd} retry)')a3(a4)
return false end local a6,a7=ad.IsIceSpikesChain and ad.IsIceSpikesChain(a4.Name
),ad.IsSecondBossCircleChain and ad.IsSecondBossCircleChain(a4.Name)if a7 then
local a8=os.clock()if a8-ax<6 then a1(a4,
'V\u{f2}ng con c\u{1ee7}a chu\u{1ed7}i secondBossCricleHitbox (\u{111}\u{e3} d\u{1ef1}ng tr\u{1b0}\u{1edb}c 10 v\u{f2}ng)'
)return false end ax=a8 end local a8=aT(a4)local a9,b,ba={Instance=a4,Name=a4.
Name,Class=a4.ClassName,Distance=a8,Boxes={},Connections={},SpawnClock=os.clock(
)},{},{}if ao and not a6 and not a7 then ba=aY(a5,b)end a9.Boxes=ba a9.
Connections=b at[a4]=a9 aE={Name=a4.Name,Class=a4.ClassName,Distance=a8}if ae.
IsEnabled()then ae.AttachZoneVisuals(a9)end if af.IsEnabled()then af.
AttachTrajectoryVisuals(a9)end if ag.IsEnabled()then ag.AttachTimerVisual(a9)end
aP(a4)a0(a4,'SPAWN','Passed all gates',a9)if ap then print((
'[HazardScanner][Hazard] \u{1f534} Hazard Detected: %s (%s, %d studs)'):format(
a4.Name,a4.ClassName,a8))end aJ()return true end local function a4(a5,a6)local
a7=at[a5]if not a7 then aP(a5)return end if a7.MaxExpireTime and os.clock()<a7.
MaxExpireTime and a6=='Destroyed'then task.delay(a7.MaxExpireTime-os.clock()+0.1
,function()if at[a5]==a7 and os.clock()>=a7.MaxExpireTime then a4(a5,
'Wave Completed')end end)return end a0(a5,'DESPAWN',a6,a7)ae.DetachZoneVisuals(
a7)af.DetachTrajectoryVisuals(a7)ag.DetachTimerVisual(a7)if a7.Boxes then for a8
,a9 in ipairs(a7.Boxes)do pcall(function()a9:Destroy()end)end table.clear(a7.
Boxes)end if a7.Connections then for a8,a9 in ipairs(a7.Connections)do pcall(
function()a9:Disconnect()end)end table.clear(a7.Connections)end at[a5]=nil if ap
then local a8=a6 and(' ('..a6..')')or''print((
'[HazardScanner][Hazard] \u{1f7e2} Hazard Expired: %s%s'):format(tostring(a7.
Name),a8))end aJ()end function al.ClearAllHazards(a5)ax=0 ae.ClearAll()af.
ClearAll()ag.ClearAll()aQ()local a6={}for a7 in pairs(at)do table.insert(a6,a7)
end for a7,a8 in ipairs(a6)do a4(a8,a5)end if ap and a5 then print((
'[HazardScanner][Hazard] \u{1f9f9} All hazards cleared: %s'):format(a5))end end
function al.StartScan()if am then return end am=true ae.BindDetection(al)af.
BindDetection(al)ag.BindDetection(al)al.ClearAllHazards'StartScan Reset'for a5,
a6 in ipairs(aw)do a6:Disconnect()end table.clear(aw)table.insert(aw,ai.
ChildAdded:Connect(function(a5)if aI(a5)then return end a2(a5)end))table.insert(
aw,ai.ChildRemoved:Connect(function(a5)a4(a5,'Destroyed')end))an=ab.
GetCurrentRoomIndex()>0 if aF then pcall(aF)aF=nil end aF=ab.OnRoomIndexChanged(
function(a5)if a5>0 then an=true elseif a5<=0 and an then an=false al.
ClearAllHazards'Dungeon Ended'end end)if ap then print
'[HazardScanner] \u{1f4e1} Threat Detector started!'end end function al.StopScan
()am=false an=false for a5,a6 in ipairs(aw)do a6:Disconnect()end table.clear(aw)
if aF then pcall(aF)aF=nil end al.ClearAllHazards'StopScan'if ap then print
'[HazardScanner] \u{1f6d1} Threat Detector stopped.'end end function al.
IsEnabled()return am end function al.SetEnabled(a5)if a5 then al.StartScan()else
al.StopScan()end end function al.SetSelectionBoxesEnabled(a5)ao=a5 and true or
false if ao then for a6,a7 in pairs(at)do if a6 and a6.Parent and(not a7.Boxes
or#a7.Boxes==0)then local a8=aS(a6)a7.Connections=a7.Connections or{}a7.Boxes=
aY(a8,a7.Connections)end end else for a6,a7 in pairs(at)do if a7.Boxes then for
a8,a9 in ipairs(a7.Boxes)do pcall(function()a9:Destroy()end)end table.clear(a7.
Boxes)end end end end function al.IsSelectionBoxesEnabled()return ao end
function al.SetLogHazards(a5)ap=a5 and true or false end function al.
IsLogHazardsEnabled()return ap end function al.SetLogFailed(a5)aq=a5 and true or
false end function al.IsLogFailedEnabled()return aq end function al.
SetInspectTarget(a5)ar=type(a5)=='string'and a5 or''end function al.
GetInspectTarget()return ar end function al.SetInspectEnabled(a5)as=a5 and true
or false end function al.IsInspectEnabled()return as end function al.
GetHazardCount()return au end function al.GetActiveHazards()local a5={}for a6,a7
in pairs(at)do if a6 and a6.Parent==ai then a5[#a5+1]=a7 end end return a5 end
function al.GetActiveHazardsMap()return at end function al.GetLastHazardInfo()
return aE end function al.OnHazardChanged(a5)if type(a5)~='function'then return
end table.insert(av,a5)end ac.Register(function()al.StopScan()al.ClearAllHazards
'Shutdown'end)return al end function a.q()local aa,ab,ac,ad=a.load'e',a.load'b',
a.load'l',a.load'o'local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av=
aa.RunService or game:GetService'RunService',aa.player,{},true,false,{},1.8,
Color3.fromRGB(0,255,170),Color3.fromRGB(255,35,35),0.45,0.2,0.2,(game:
GetService'Players')local aw,ax,ay,az=function()local aw=af or aq.LocalPlayer if
not aw then return nil end local ax=aw.Character if not ax or not ax.Parent then
return nil end local ay=ax:FindFirstChildOfClass'Humanoid'if ay and ay.Health<=0
then return nil end return ax:FindFirstChild'HumanoidRootPart'or ax.PrimaryPart
end,function(aw)if not aw then return 0 end return aw.Position.Y-2.5 end,
function(aw)if au then if au.Parent~=aw or not au:IsDescendantOf(workspace)then
pcall(function()au:Destroy()end)au=nil else if au.Adornee~=aw then au.Adornee=aw
end return au end end if not aw or not aw.Parent then return nil end local ax=
Instance.new'CylinderHandleAdornment'ax.Name='Player_2D_HitboxVisual'ax.Adornee=
aw ax.Radius=ak ax.Height=ap ax.Color3=ai and am or al ax.Transparency=ai and ao
or an ax.ZIndex=5 ax.AlwaysOnTop=false ax.Visible=ah ax.Parent=aw au=ax return
ax end,function(aw)if not au or not au.Parent then return end au.Color3=aw and
am or al au.Transparency=aw and ao or an end local aA=function()local aA=aw()if
not aA or not aA.Parent then if au and au.Parent then au.Visible=false end if ai
then ai=false ar=nil as=nil for aD,aE in ipairs(aj)do pcall(aE,false,nil,nil)end
end return end local aD=ay(aA)if aD and aD.Parent then aD.Visible=ah aD.Radius=
ak local aE=ax(aA)local aF=CFrame.new(Vector3.new(aA.Position.X,aE,aA.Position.Z
))*CFrame.Angles(math.rad(90),0,0)aD.CFrame=aA.CFrame:ToObjectSpace(aF)end local
aE=Vector3.new(aA.Position.X,0,aA.Position.Z)local aF,aG,aH=ac.
IsPointInAnyHazard(aE,nil,ak)local aI,aJ=false if not aF and ad.
IsPointInAnyTrajectory then aI,aJ=ad.IsPointInAnyTrajectory(aE,ak)end local aK,
aM,aN=(aF or aI),aG or aJ,aF and'Ground Zone'or(aI and'Trajectory Corridor'or
nil)if aK~=ai or aM~=ar then ai=aK ar=aM as=aN az(aK)for aO,aP in ipairs(aj)do
pcall(aP,aK,aM,aN)end end end local aD=function()if not at then at=ae.Heartbeat:
Connect(aA)end end function ag.Cleanup()if at then at:Disconnect()at=nil end if
au then pcall(function()au:Destroy()end)au=nil end ai=false ar=nil as=nil end
function ag.IsPlayerInDanger()return ai,ar,as end function ag.GetCurrentThreat()
return ar,as end function ag.OnDangerStatusChanged(aE)if type(aE)=='function'
then table.insert(aj,aE)end end function ag.SetVisualEnabled(aE)ah=aE and true
or false if au then au.Visible=ah end end function ag.IsVisualEnabled()return ah
end function ag.SetRadius(aE)if type(aE)=='number'and aE>=0.1 then ak=aE if au
and au.Parent then au.Radius=ak end end end function ag.GetRadius()return ak end
local aE=function()local aE=af or aq.LocalPlayer if not aE then return end local
aF=function(aF)if au then pcall(function()au:Destroy()end)au=nil end task.spawn(
function()local aG=aF:WaitForChild('Humanoid',3)if aG then aG.Died:Connect(
function()if au then au.Visible=false end end)end end)end av=aE.CharacterAdded:
Connect(aF)if aE.Character then aF(aE.Character)end end aE()aD()ab.Register(
function()if av then av:Disconnect()av=nil end ag.Cleanup()end)return ag end
function a.r()local aa,ab,ac={},{},8 for ad=1,ac do local ae=(ad-1)*(2*math.pi/
ac)ab[ad]=Vector3.new(math.cos(ae),0,math.sin(ae))end local ad,ae={},16 for af=1
,ae do local ag=(af-1)*(2*math.pi/ae)ad[af]=Vector3.new(math.cos(ag),0,math.sin(
ag))end local af,ag,ah={1.5,3,5,8,12,18,25},{1.5,3,4.5,6,8,10.5,13.5,17,21,26,32
,38,45},{1.5,3,4.5,6,8,10.5,13.5,17,21,26,32,38,45,50,55}aa.COARSE_DIRECTIONS=ab
aa.FINE_DIRECTIONS=ad aa.COARSE_RADII=af aa.FINE_RADII=ag aa.FALLBACK_RADII=ah
function aa.SamplePass(ai,aj,ak,al,am,an,ao,ap)local aq,ar,as,at,au=math.huge,
Vector3.zero,false,aj if ap and ap.Magnitude>0.1 then local av=Vector3.new(ap.X,
0,ap.Z).Unit at=table.clone(aj)table.sort(at,function(aw,ax)local ay,az=aw.X*av.
X+aw.Z*av.Z,ax.X*av.X+ax.Z*av.Z return ay>az end)end for av,aw in ipairs(ak)do
local ax=false for ay,az in ipairs(at)do local aA=ai+az*aw local aD=an(aA)if ao
then table.insert(ao,{pos=aA,isSafe=aD,isChosen=false})end if aD then local aE=
aA if am and al>0 then local aF=aA+az*al if an(aF)then aE=aF end end local aF=(
aE-ai).Magnitude if aF<aq then aq=aF au=aE ar=az ax=true end end end if ax and
au then as=true break end end return au,as,aq,ar end return aa end function a.s(
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
PointToObjectSpace(at)for av,aw in ipairs(ar)do local ax,ay=ao(av,ap),Vector3.
new(aw.pos.X,aq+0.05,aw.pos.Z)local az,aA,aD=ap.CFrame:PointToObjectSpace(ay),aw
.isSafe and ad or ae,aw.isSafe and 0.35 or 0.55 if ax.dot and ax.dot.Parent then
local aE=CFrame.new(ay)*CFrame.Angles(math.rad(90),0,0)ax.dot.CFrame=ap.CFrame:
ToObjectSpace(aE)ax.dot.Color3=aA ax.dot.Transparency=aD ax.dot.Radius=aw.isSafe
and 0.3 or 0.2 ax.dot.Visible=true end if ax.line and ax.line.Parent then local
aE=az-au local aF=aE.Magnitude if aF>0.2 then ax.line.CFrame=CFrame.lookAt(au,az
)ax.line.Length=aF ax.line.Color3=aA ax.line.Transparency=aD+0.15 ax.line.
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
local aD=aA-az local aE=aD.Magnitude if aE>0.3 then am.CFrame=CFrame.new(az)am.
Length=aE am.CFrame=CFrame.lookAt(az,aA)am.Visible=true else am.Visible=false
end end ap(aq,as,at,av)end function ai.Cleanup()if ak then pcall(function()ak:
Destroy()end)ak=nil end if al then pcall(function()al:Destroy()end)al=nil end if
am then pcall(function()am:Destroy()end)am=nil end for aq,ar in ipairs(aj)do if
ar.dot then pcall(function()ar.dot:Destroy()end)end if ar.line then pcall(
function()ar.line:Destroy()end)end end table.clear(aj)end return ai end function
a.t()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'a',a.load'd',a.load'f',{},{Mob={Min
=15,Max=35,BossArea=false,BossAreaRadius=80,DisableDodge=false},Boss1={Min=25,
Max=50,BossArea=false,BossAreaRadius=80,DisableDodge=false},Boss2={Min=25,Max=50
,BossArea=false,BossAreaRadius=80,DisableDodge=false},Boss3={Min=25,Max=50,
BossArea=false,BossAreaRadius=80,DisableDodge=false}},{Normal='Mob',['Boss 1']=
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
SetBossSpawnPosition(aq)end end return ao,ap,aq end function ad.GetDisableDodge(
ak,al)local am=al or'Mob'local an=ae[am]or ae.Mob if type(ak)=='string'and#ak>0
and ah[ak]and ah[ak][am]then local ao=ah[ak][am]if ao.DisableDodge~=nil then
return ao.DisableDodge==true end end return an.DisableDodge or false end
function ad.SetDisableDodge(ak,al,am)if not(type(ak)=='string'and#ak>0)then
return end local an=al or'Mob'ah[ak]=ah[ak]or{}ah[ak][an]=ah[ak][an]or{}ah[ak][
an].DisableDodge=am and true or false aj()end function ad.IsActiveDodgeDisabled(
ak)local al,am,an=ac.GetCurrentDungeonName(),'Mob',false if ac.IsBossActive and
ac.IsBossActive()then an=true am=ac.GetCombatTargetKey()elseif ak then if ak.
Room and type(ak.Room.Name)=='string'and string.find(string.lower(ak.Room.Name),
'boss')then an=true elseif ak.Model then local ao=string.lower(ak.Model.Name)if
string.find(ao,'boss')then an=true else local ap=ak.Model.Parent if ap and
string.find(string.lower(ap.Name),'boss')then an=true end end end if an then
local ao=ac.GetCurrentBossIndex and ac.GetCurrentBossIndex()or 1 am='Boss'..
tostring(math.clamp(ao,1,3))end end return ad.GetDisableDodge(al,am)end function
ad.SetMinCombatDistance(ak,al,am)if not(type(ak)=='string'and#ak>0)then return
end local an=al or'Mob'if type(am)~='number'or am<=0 then return end ah[ak]=ah[
ak]or{}ah[ak][an]=ah[ak][an]or{}local ao=ah[ak][an].Max or(ae[an]or ae.Mob).Max
ah[ak][an].Min=am if am>ao then ah[ak][an].Max=am+5 end aj()end function ad.
SetMaxCombatDistance(ak,al,am)if not(type(ak)=='string'and#ak>0)then return end
local an=al or'Mob'if type(am)~='number'or am<=0 then return end ah[ak]=ah[ak]or
{}ah[ak][an]=ah[ak][an]or{}local ao=ah[ak][an].Min or(ae[an]or ae.Mob).Min ah[ak
][an].Max=am if am<ao then ah[ak][an].Min=math.max(1,am-5)end aj()end function
ad.ResetTarget(ak,al)if not(type(ak)=='string'and#ak>0)then return end local am=
al or'Mob'if ah[ak]then ah[ak][am]=nil if next(ah[ak])==nil then ah[ak]=nil end
aj()end end function ad.ResetDungeon(ak)if not(type(ak)=='string'and#ak>0)then
return end if ah[ak]then ah[ak]=nil aj()end end return ad end function a.u()
local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'e',a.load'f',a.load'b',a.load'l',a.load
'o',a.load'q',a.load'r',a.load's',a.load't'local aj,ak,al,am,an,ao,ap,aq,ar,as,
at,au,av,aw,ax,ay,az,aA,aD,aE=aa.RunService or game:GetService'RunService',game:
GetService'Players',aa.player,{},true,true,true,true,false,2,0,false,{},{},0
local aF,aG,aH=function()local aF=al or ak.LocalPlayer if not aF then return nil
end local aG=aF.Character if not aG or not aG.Parent then return nil end local
aH=aG:FindFirstChildOfClass'Humanoid'if aH and aH.Health<=0 then return nil end
return aG:FindFirstChild'HumanoidRootPart'or aG.PrimaryPart end,function(aF)
local aG=al or ak.LocalPlayer if not aG then return nil end local aH=aG.
Character if not aH or not aH.Parent then return nil end local aI=aH:
FindFirstChildOfClass'Humanoid'if aI and aI.Health>0 then local aJ=aI.
MoveDirection if aJ and aJ.Magnitude>0.1 then return Vector3.new(aJ.X,0,aJ.Z).
Unit end end if aF and aF.Parent then local aJ=Vector3.zero pcall(function()aJ=
aF.AssemblyLinearVelocity or aF.Velocity or Vector3.zero end)local aK=Vector3.
new(aJ.X,0,aJ.Z)if aK.Magnitude>=2 then return aK.Unit end end return nil end,
function(aF)if not aF then return 0 end return aF.Position.Y-2.5 end function am
.IsPointSafe(aI,aJ)if not aI then return false end local aK,aM,aN,aO=Vector3.
new(aI.X,0,aI.Z),ai.GetActiveBossArea()if aM and aO and aN and aN>0 then local
aP=Vector3.new(aO.X,0,aO.Z)if(aK-aP).Magnitude>aN then return false end end
local aP=(af.GetRadius and af.GetRadius()or 1.8)+(aJ or 0)if ad.
IsPointInAnyHazard and ad.IsPointInAnyHazard(aK,nil,aP)then return false end if
ae.IsPointInAnyTrajectory and ae.IsPointInAnyTrajectory(aK,aP)then return false
end return true end function am.FindNearestSafeSpot(aI)if ab.IsInvulnerable and
ab.IsInvulnerable()then return nil,false,0,Vector3.zero end local aJ=aF()if not
aI then if not aJ then return nil,false,0,Vector3.zero end aI=aJ.Position end
local aK,aM=Vector3.new(aI.X,0,aI.Z),aG(aJ)table.clear(aw)local aN,aO,aP=ai.
GetActiveBossArea()local aQ,aR,aS=(aN and aP and aO and aO>0)and Vector3.new(aP.
X,0,aP.Z)or nil,ad.GetNearbyHazards and ad.GetNearbyHazards(aK,75)or nil,ae.
GetNearbyTrajectories and ae.GetNearbyTrajectories(aK,75)or nil local aT=
function(aT,aU)if not aT then return false end local aV=Vector3.new(aT.X,0,aT.Z)
if aQ and aO then local aW=(aV-aQ).Magnitude if aW>aO then return false end end
local aW=(af.GetRadius and af.GetRadius()or 1.8)+(aU or 0)if ad.
IsPointInAnyHazard and ad.IsPointInAnyHazard(aV,nil,aW,aR)then return false end
if ae.IsPointInAnyTrajectory and ae.IsPointInAnyTrajectory(aV,aW,aS)then return
false end return true end if(aR and#aR==0 and aS and#aS==0 and not aQ)or aT(aK,0
)then table.insert(aw,{pos=aK,isSafe=true,isChosen=true})return aK,true,0,
Vector3.zero end local aU,aV=aM,af.GetRadius and af.GetRadius()or 1.8 local aW,
aX,aY,aZ=ae.IsPointInAnyTrajectory(aK,aV,aS)if aW and aY and aZ then local a_,a0
,a1=Vector3.new(-aY.Z,0,aY.X),Vector3.new(aY.Z,0,-aY.X),aK-aZ local a2=a1.X*a_.X
+a1.Z*a_.Z local a3=a2>=0 and a_ or a0 if aM and aM.Magnitude>0.1 then local a4,
a5=aM.X*a_.X+aM.Z*a_.Z,aM.X*a0.X+aM.Z*a0.Z if a4>a5+0.3 then a3=a_ elseif a5>a4+
0.3 then a3=a0 end end local a4=0.45 if aM and aM.Magnitude>0.1 then local a5,a6
=-(aM.X*aY.X+aM.Z*aY.Z),math.abs(aM.X*a3.X+aM.Z*a3.Z)if a6>0.05 then local a7=a5
/a6 a4=math.clamp(a7,0.18,1)elseif a5>0 then a4=1 else a4=0.18 end end local a5=
(a3-a4*aY).Unit aU=a5 elseif aQ and(aK-aQ).Magnitude>aO then aU=(aQ-aK).Unit end
local a_,a0,a1,a2=ag.SamplePass(aK,ag.COARSE_DIRECTIONS,ag.COARSE_RADII,as,true,
aT,aw,aU)if not a0 and aq then a_,a0,a1,a2=ag.SamplePass(aK,ag.FINE_DIRECTIONS,
ag.FINE_RADII,as,true,aT,aw,aU)end if not a0 and ar then a_,a0,a1,a2=ag.
SamplePass(aK,ag.FINE_DIRECTIONS,ag.FALLBACK_RADII or ag.FINE_RADII,0,false,aT,
aw,aU)end if a0 and a_ then for a3,a4 in ipairs(aw)do if(a4.pos-a_).Magnitude<
0.25 then a4.isChosen=true break end end return a_,true,a1,a2 end return aK,
false,math.huge,Vector3.zero end local aI=function()if not an then ah.Hide()
return end local aI=aF()if not aI or not aI.Parent then ah.Hide()return end if
ab.IsInvulnerable and ab.IsInvulnerable()then am.Clear()return end if ai.
IsActiveDodgeDisabled and ai.IsActiveDodgeDisabled()then am.Clear()return end
local aJ,aK,aM=false if af.IsPlayerInDanger then aJ,aK,aM=af.IsPlayerInDanger()
end local aN=aJ or(ay~=nil)or au if not aN then local aO=os.clock()if aO-ax<0.05
then return end ax=aO end local aO,aP=aH(aI),Vector3.new(aI.Position.X,0,aI.
Position.Z)if aJ then local aQ,aR=ay and(ay-aP).Magnitude or 0,ay and am.
IsPointSafe(ay)if not ay or not aR then local aS,aT,aU,aV=am.
FindNearestSafeSpot(aI.Position)if aT and aS then ay=aS az=aK aA=aM at=aU au=
true ah.Update(aI,aS,aO,aw,ao,ap)for aW,aX in ipairs(av)do pcall(aX,true,aS,aU)
end else ah.Hide()end else at=aQ ah.Update(aI,ay,aO,aw,ao,ap)for aS,aT in
ipairs(av)do pcall(aT,true,ay,aQ)end end else local aQ,aR=ay and(ay-aP).
Magnitude or 0,ay and am.IsPointSafe(ay)if aR and aQ>0.8 then at=aQ ah.Update(aI
,ay,aO,aw,ao,ap)for aS,aT in ipairs(av)do pcall(aT,true,ay,aQ)end else if au or
ay then au=false ay=nil az=nil aA=nil at=0 ah.Hide()for aS,aT in ipairs(av)do
pcall(aT,false,nil,0)end end end end end local aJ=function()if not aD then aD=aj
.Heartbeat:Connect(aI)end if not aE and af.OnDangerStatusChanged then aE=af.
OnDangerStatusChanged(function(aJ)if aJ and an then aI()end end)end end function
am.Clear()if au or ay then au=false ay=nil az=nil aA=nil at=0 table.clear(aw)ah.
Hide()for aK,aM in ipairs(av)do pcall(aM,false,nil,0)end end end function am.
Cleanup()if aD then aD:Disconnect()aD=nil end ah.Cleanup()table.clear(aw)ay=nil
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
function a.v()local aa,ab,ac,ad,ae,af=a.load'e',a.load'f',a.load'b',a.load'q',a.
load'u',a.load't'local ag,ah,ai,aj,ak,al,am,an,ao,ap=aa.RunService or game:
GetService'RunService',game:GetService'Players',aa.player,{},false,2,false,{}
local aq,ar=function()local aq=ai or ah.LocalPlayer if not aq then return nil,
nil,nil end local ar=aq.Character if not ar or not ar.Parent then return nil,nil
,nil end local as=ar:FindFirstChildOfClass'Humanoid'if as and as.Health<=0 then
return nil,nil,nil end local at=ar:FindFirstChild'HumanoidRootPart'or ar.
PrimaryPart if not at then return nil,nil,nil end return ar,as,at end,function(
aq,ar)if aq and ar and ar.Parent then pcall(function()aq:MoveTo(ar.Position)end)
end end local as=function()if not ak then if am or ao then ao=nil am=false local
as,at,au=aq()ar(at,au)for av,aw in ipairs(an)do pcall(aw,false,nil,0)end end
return end local as,at,au=aq()if not as or not at or not au then if am or ao
then ao=nil am=false for av,aw in ipairs(an)do pcall(aw,false,nil,0)end end
return end if ab.IsInvulnerable and ab.IsInvulnerable()then if am or ao then ao=
nil am=false local av,aw,ax=aq()ar(aw,ax)for ay,az in ipairs(an)do pcall(az,
false,nil,0)end end if ae and ae.Clear then ae.Clear()end return end if af.
IsActiveDodgeDisabled and af.IsActiveDodgeDisabled()then if am or ao then ao=nil
am=false local av,aw,ax=aq()ar(aw,ax)for ay,az in ipairs(an)do pcall(az,false,
nil,0)end end if ae and ae.Clear then ae.Clear()end return end local av,aw,ax,ay
=ad.IsPlayerInDanger and ad.IsPlayerInDanger(),ae.GetLastSafeSpot()if aw then ao
=aw end local az=ao and ae.IsPointSafe and ae.IsPointSafe(ao)if ao and az then
local aA=au.Position local aD=Vector3.new(ao.X-aA.X,0,ao.Z-aA.Z)local aE=aD.
Magnitude if aE<=al then local aF,aG=au.CFrame,Vector3.new(ao.X,aA.Y,ao.Z)local
aH=CFrame.new(aG)*(aF-aF.Position)as:PivotTo(aH)ar(at,au)local aI=ao ao=nil if
am then am=false for aJ,aK in ipairs(an)do pcall(aK,false,aI,aE)end end else
local aF=Vector3.new(ao.X,aA.Y,ao.Z)at:MoveTo(aF)if not am then am=true for aG,
aH in ipairs(an)do pcall(aH,true,ao,aE)end end end else if am or ao then ao=nil
am=false ar(at,au)for aA,aD in ipairs(an)do pcall(aD,false,nil,0)end end end end
local at=function()if not ap then ap=ag.Heartbeat:Connect(as)end end function aj
.Clear()if am or ao then ao=nil am=false local au,av,aw=aq()ar(av,aw)for ax,ay
in ipairs(an)do pcall(ay,false,nil,0)end end end function aj.Cleanup()if ap then
ap:Disconnect()ap=nil end aj.Clear()end function aj.SetEnabled(au)ak=au and true
or false if not ak then local av,aw,ax=aq()ar(aw,ax)ao=nil am=false end end
function aj.IsEnabled()return ak end function aj.SetSnapDistance(au)if type(au)
=='number'and au>=0.5 then al=au end end function aj.GetSnapDistance()return al
end function aj.IsDodging()return am end function aj.OnDodgeStateChanged(au)if
type(au)=='function'then table.insert(an,au)end end if ab.OnRoomIndexChanged
then ab.OnRoomIndexChanged(function()aj.Clear()end)end if ab.OnEnemyChanged then
ab.OnEnemyChanged(function()if ab.GetEnemyCount and ab.GetEnemyCount()==0 then
aj.Clear()end end)end if ab.OnLobbyChanged then ab.OnLobbyChanged(function()aj.
Clear()end)end if ab.OnBossActiveChanged then ab.OnBossActiveChanged(function()
aj.Clear()end)end at()ac.Register(function()aj.Cleanup()end)return aj end
function a.w()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.load'b',a.load'p',a.load'l',
a.load'm',a.load'o',a.load'q',a.load'u',a.load'v',a.load'n',{}ac.BindDetection(
ab)ad.BindDetection(ab)ad.BindTrajectory(ae)ae.BindDetection(ab)ai.
BindDetection(ab)aj.IsPointInAnyHazard=ac.IsPointInAnyHazard aj.GetHazardPadding
=ac.GetHazardPadding aj.SetHazardPadding=ac.SetHazardPadding aj.GetHitboxPadding
=ac.GetHazardPadding aj.SetHitboxPadding=ac.SetHazardPadding aj.
GetTrajectoryMargin=ac.GetTrajectoryMargin aj.SetTrajectoryMargin=ac.
SetTrajectoryMargin aj.GetHazardZones=ac.GetHazardZones aj.GetNearbyHazards=ac.
GetNearbyHazards aj.AddForceCircleName=ac.AddForceCircleName aj.
GetForceCircleNames=ac.GetForceCircleNames aj.IsForceCircle=ac.IsForceCircle aj.
IsSecondBossCircleChain=ac.IsSecondBossCircleChain aj.IsPlayerInDanger=af.
IsPlayerInDanger aj.GetPlayerThreat=af.GetCurrentThreat aj.OnPlayerDangerChanged
=af.OnDangerStatusChanged aj.SetPlayerVisualEnabled=af.SetVisualEnabled aj.
IsPlayerVisualEnabled=af.IsVisualEnabled aj.SetPlayerHitboxRadius=af.SetRadius
aj.GetPlayerHitboxRadius=af.GetRadius aj.FindNearestSafeSpot=ag.
FindNearestSafeSpot aj.IsPointSafe=ag.IsPointSafe aj.GetLastSafeSpot=ag.
GetLastSafeSpot aj.OnSafeSpotChanged=ag.OnSafeSpotChanged aj.
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
.RefreshTrajectory=ae.RefreshAll aj.IsPointInAnyTrajectory=ae.
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
GetLastHazardInfo aj.OnHazardChanged=ab.OnHazardChanged function aj.StartScan()
ab.StartScan()end function aj.StopScan()ab.StopScan()end function aj.Toggle(ak)
if ak then aj.StartScan()else aj.StopScan()end end function aj.IsEnabled()return
ab.IsEnabled()end aa.Register(function()ab.StopScan()end)return aj end function
a.x()local aa,ab,ac,ad=a.load'e',a.load'f',a.load'b',a.load'j'local ae,af,ag,ah,
ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at=aa.RunService or game:GetService'RunService'
,aa.VirtualInputManager or game:GetService'VirtualInputManager',aa.player,{},
false,35,0.15,4,0,0,false,false,-math.huge,0 function ah.IsEnabled()return ai
end local au,av function ah.SetEnabled(aw)local ax=aw==true if ax==ai then
return end ai=ax if ai then au()else av()end end ah.IsSkillQEnabled=ah.IsEnabled
ah.SetSkillQEnabled=ah.SetEnabled ah.IsSkillEEnabled=ah.IsEnabled ah.
SetSkillEEnabled=ah.SetEnabled function ah.GetSkillERange()return aj end
function ah.SetSkillERange(aw)if type(aw)=='number'and aw>=2 then aj=aw end end
function ah.GetSpamInterval()return ak end function ah.SetSpamInterval(aw)if
type(aw)=='number'and aw>=0.05 then ak=aw end end function ah.GetBuffDuration()
return al end function ah.SetBuffDuration(aw)if type(aw)=='number'and aw>=0.5
then al=aw end end function ah.IsBuffActive()return(os.clock()-aq)<al end
function ah.TriggerBuff()aq=os.clock()end function ah.GetLastBuffTime()return aq
end function ah.GetRemainingBuffTime()local aw=al-(os.clock()-aq)return aw>0 and
aw or 0 end local aw=function()local aw=ag or game:GetService'Players'.
LocalPlayer if not aw then return nil end local ax=aw:FindFirstChild'Backpack'if
ax then for ay,az in ipairs(ax:GetChildren())do local aA=az:FindFirstChild
'abilitySlot'if aA and string.lower(tostring(aA.Value))=='q'then return az end
end end local ay=aw.Character if ay then for az,aA in ipairs(ay:GetChildren())do
if aA:IsA'Tool'then local aD=aA:FindFirstChild'abilitySlot'if aD and string.
lower(tostring(aD.Value))=='q'then return aA end end end end return nil end
local ax=function()local ax=aw()if ax then local ay=ax:FindFirstChild'cooldown'
if ay and typeof(ay.Value)=='number'then return ay.Value end end return nil end
local ay,az,aA,aD=function(ay)local az=ax()if az~=nil then if az>(ar+0.5)or(ar<=
0.2 and az>0.5)then aq=ay end ar=az end end,function()if at then return end
pcall(function()local ay=aa.ReplicatedStorage or game:GetService
'ReplicatedStorage'local az=ay and ay:FindFirstChild'remotes'local aA=az and az:
FindFirstChild'abilityCast'if aA and aA:IsA'RemoteEvent'then at=aA.OnClientEvent
:Connect(function(aD,aE)local aF=ag or game:GetService'Players'.LocalPlayer if
aD==aF then local aG=aw()if(aG and aG.Name==aE)or(not aG)then aq=os.clock()end
end end)end end)end,function()if at then pcall(function()at:Disconnect()end)at=
nil end end,function()local ay=ag or game:GetService'Players'.LocalPlayer local
az=ay and ay.Character local aA=az and(az:FindFirstChild'HumanoidRootPart'or az.
PrimaryPart)if aA and aA.Parent then return aA end return nil end local aE=
function()local aE=aD()if not aE then return nil,math.huge,false end local aF,aG
=aE.Position,ad.GetTarget and ad.GetTarget()if aG and aG.Root and aG.Root.Parent
then local aH=aG.Humanoid or(aG.Model and aG.Model:FindFirstChildOfClass
'Humanoid')if aH and aH.Health>0 then local aI=aG.Root.Position local aJ=Vector3
.new(aI.X-aF.X,0,aI.Z-aF.Z).Magnitude return aG,aJ,true end end local aH,aI,aJ,
aK=ab.GetTrackedEnemyData and ab.GetTrackedEnemyData(),math.huge,false if aH and
#aH>0 then for aM,aN in ipairs(aH)do if aN and aN.Root and aN.Root.Parent then
local aO=aN.Humanoid or(aN.Model and aN.Model:FindFirstChildOfClass'Humanoid')if
aO and aO.Health>0 then aJ=true local aP=aN.Root.Position local aQ,aR=aP.X-aF.X,
aP.Z-aF.Z local aS=aQ*aQ+aR*aR if aS<aI then aI=aS aK=aN end end end end end
local aM=aI<math.huge and math.sqrt(aI)or math.huge return aK,aM,aJ end function
ah.CastSkillQ()if ao then return end ao=true task.spawn(function()local aF=(ab.
GetKeyHoldTime and ab.GetKeyHoldTime())or 0.05 pcall(function()af:SendKeyEvent(
true,Enum.KeyCode.Q,false,game)end)task.wait(aF)pcall(function()af:SendKeyEvent(
false,Enum.KeyCode.Q,false,game)end)ao=false end)end function ah.CastSkillE()if
ap then return end ap=true task.spawn(function()local aF=(ab.GetKeyHoldTime and
ab.GetKeyHoldTime())or 0.05 pcall(function()af:SendKeyEvent(true,Enum.KeyCode.E,
false,game)end)task.wait(aF)pcall(function()af:SendKeyEvent(false,Enum.KeyCode.E
,false,game)end)ap=false end)end local aF=function()if not ai or ab.IsInLobby()
then return end local aF=aD()if not aF then return end local aG=aF.Parent local
aH=aG and aG:FindFirstChildOfClass'Humanoid'if aH and aH.Health<=0 then return
end local aI,aJ,aK=aE()local aM=os.clock()ay(aM)if(aM-am>=ak)and not ao then if
aK then local aN=ax()local aO=(aN==nil)or(aN<=0.2)if aO then am=aM ah.
CastSkillQ()if aN==nil and not ah.IsBuffActive()then aq=aM end end end end if(aM
-an>=ak)and not ap then if aI and aJ<=aj then local aN=ah.IsBuffActive()if aN
then an=aM ah.CastSkillE()end end end end au=function()if not as then as=ae.
Heartbeat:Connect(aF)end az()end av=function()if as then as:Disconnect()as=nil
end aA()ao=false ap=false ar=0 aq=-math.huge end function ah.Step(aG,aH,aI)end
ac.Register(function()ah.SetEnabled(false)end)return ah end function a.y()local
aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak=a.load'e',a.load'f',a.load'b',a.load'g',a.load
'h',a.load'i',a.load'j',a.load'k',a.load'w',a.load'x',a.load't'local al,am,an,ao
,ap,aq,ar,as,at,au,av,aw,ax,ay,az,aA,aD,aE=aa.RunService,aa.player,{NO_TARGET=
'NO_TARGET',ACQUIRING_TARGET='ACQUIRING_TARGET',TRACKING_TARGET=
'TRACKING_TARGET',CHASE='CHASE',HOLD='HOLD',KITE='KITE',BLOCKED='BLOCKED',
REPATHING='REPATHING'},{},false,false,1.5,15,35,25,50,true,6,true,true,true,true
,true local aF,aG,aH,aI,aJ,aK,aM,aN,aO,aP,aQ,aR,aS,aT,aU,aV,aW,aX,aY,aZ,a_,a0,a1
,a2,a3,a4,a5,a6,a7,a8,a9,b,ba,bb,bc=an.NO_TARGET,'None',0,0,false,false,0,0,
false,10,false,{},function()local aF=am and am.Character local aG=aF and aF:
FindFirstChild'HumanoidRootPart'if aG and aG.Parent then return aG end return
nil end,function(aF)if not aF or not aF.Parent then return nil end local aG,aH=
pcall(function()return aF.Position end)if not aG or not aH then return nil end
return aH end,function(aF)if ab.IsBossActive and ab.IsBossActive()then return
true end if aF then if aF.Room and type(aF.Room.Name)=='string'and string.find(
string.lower(aF.Room.Name),'boss')then return true end if aF.Model then local aG
=string.lower(aF.Model.Name)if string.find(aG,'boss')then return true end local
aH=aF.Model.Parent if aH and string.find(string.lower(aH.Name),'boss')then
return true end end end return false end,function(aF)return ak.
GetActiveCombatDistances(aF)end,function(aF,aG)if aF==aG then return true end if
aF and aG and aF.Model and aG.Model and aF.Model==aG.Model then return true end
return false end local bd=function(bd,be)local bf=ag.GetTarget()if aW(bf,bd)then
return end ag.SetTarget(bd,nil,nil,be)aX=nil aG='None'aY=nil aZ=nil aM=0 if bd
then aF=an.CHASE else aF=an.NO_TARGET end end bc=function()if aJ or not ap or
not aq then return end aI+=1 local be=aI aJ=true local bf=aS()local bg=bf and
aT(bf)if not bg then aJ=false return end local bh=ae.Scan()if#bh==0 then if be==
aI and ap and aq then bd(nil,nil)end aJ=false return end local bi,bj,bk,bl=af.
SelectBestTarget(bg,bh,function()return be~=aI or not ap or not aq end)if be==aI
and ap and aq then bd(bi,bl)end aJ=false end local be,bf,bg,bh=function(be)if ab
.IsInLobby()or not aK then return end local bf,bg=aS(),ab.GetHumanoid()if not bf
or not bg or bg.Health<=0 then return end local bh=aT(bf)if not bh then return
end if ai.IsCurrentlyDodging and ai.IsCurrentlyDodging()then return end if aQ
then return end local bi=os.clock()if bi-aH>=ar then aH=bi if aF~=an.HOLD and aF
~=an.KITE then bc()end end local bk=ag.GetTarget()if bk then if not ag.
IsTargetValid()then ag.ClearTarget()aF=an.NO_TARGET aX=nil aG='None'aZ=nil
pcall(function()bg:MoveTo(bh)bg.AutoRotate=true end)bc()return end end if not bk
or aF==an.NO_TARGET then aX=nil aG='None'aZ=nil pcall(function()bg:MoveTo(bh)bg.
AutoRotate=true end)if not aJ and bi-aH>=0.5 then aH=bi bc()end return end local
bl=bk.Root and aT(bk.Root)if not bl then ag.ClearTarget()aF=an.NO_TARGET aZ=nil
pcall(function()bg:MoveTo(bh)bg.AutoRotate=true end)return end local bm,bn=aV(bk
)local bo=Vector3.new(bl.X-bh.X,0,bl.Z-bh.Z)local bp,bq,br,bs=bo.Magnitude,ak.
GetActiveBossArea(bk)local bt,bu=false if bq and bs and br and br>0 then bu=
Vector3.new(bs.X,0,bs.Z)local bv=(Vector3.new(bh.X,0,bh.Z)-bu).Magnitude if bv>
br then bt=true end end if bt and bu and bs then local bv=Vector3.new(bs.X,bh.Y,
bs.Z)aF=an.CHASE aG='Enter Boss Area'aX=bv aM=0 bg:MoveTo(bv)return end if aw
and bp<=(bn+25)then pcall(function()bg.AutoRotate=false local bv=Vector3.new(bl.
X,bf.Position.Y,bl.Z)if(bv-bf.Position).Magnitude>0.5 then bf.CFrame=CFrame.
lookAt(bf.Position,bv)end end)else pcall(function()bg.AutoRotate=true end)end aj
.Step(be,bk,bp)local bv,bw,bx=ab.IsInvulnerable and ab.IsInvulnerable(),ak.
IsActiveDodgeDisabled and ak.IsActiveDodgeDisabled(bk),ai.IsAutoDodgeEnabled and
ai.IsAutoDodgeEnabled()local by=not bv and not bw and bx and ai and ai.
IsPointSafe if bp<bm then local bz=Vector3.new(bh.X-bl.X,0,bh.Z-bl.Z)local bA,bB
=bz.Magnitude>0.1 and bz.Unit or Vector3.new(0,0,1),math.clamp(bm-bp+6,4,15)
local bC=bh+bA*bB if bu and br then local bD=Vector3.new(bC.X,0,bC.Z)if(bD-bu).
Magnitude>br then local bE=bu+(bD-bu).Unit*math.max(1,br-2)bC=Vector3.new(bE.X,
bh.Y,bE.Z)if(bC-bh).Magnitude<2 then aF=an.HOLD aG='Hold (Boss Area Edge)'aX=nil
aM=0 pcall(function()bg:MoveTo(bh)end)return end end end local bD=true if by
then bD=ai.IsPointSafe(bC,0.5)end if not bD then aF=an.HOLD aG=
'Hold (Danger Behind)'aX=nil aM=0 pcall(function()bg:MoveTo(bh)end)else aF=an.
KITE aG='Kite'aM=0 aX=bC bg:MoveTo(bC)end elseif bp<=bn then aF=an.HOLD aX=nil
aG='Hold'aM=0 pcall(function()bg:MoveTo(bh)end)else local bz,bA=bo.Magnitude>0.1
and bo.Unit or Vector3.new(0,0,1),false if by then for bB,bC in ipairs{3,6,10}do
if bC<bp then local bD=bh+bz*bC if not ai.IsPointSafe(bD,0.5)then bA=true break
end end end end if bA then aF=an.HOLD aG='Hold (Danger Ahead)'aX=nil aM=0 pcall(
function()bg:MoveTo(bh)end)else aF=an.CHASE aG='Chase'local bB=Vector3.new(bl.X,
bh.Y,bl.Z)aX=bB bg:MoveTo(bB)local bC=bl.Y-bh.Y if bC>1.8 and bp<=8 then bg.Jump
=true end local bD=bf.AssemblyLinearVelocity or bf.Velocity local bE,bF=bD and
Vector3.new(bD.X,0,bD.Z).Magnitude or 0,(type(be)=='number'and be>0)and be or
0.016 if bE<aP then aM+=bF if aO and(bi-aN)>=0.4 then bg.Jump=true pcall(
function()bg:ChangeState(Enum.HumanoidStateType.Jumping)end)aN=bi end else aM=0
end end end end,function()if a2 and a2.Parent then return a2 end if a2 then
pcall(function()a2:Destroy()end)a2=nil end a2=Instance.new'Highlight'a2.Name=
'TM_EnemyHighlight_Debug'a2.FillColor=Color3.fromRGB(255,200,0)a2.
FillTransparency=0.5 a2.OutlineColor=Color3.fromRGB(255,0,0)a2.
OutlineTransparency=0 a2.Parent=aa.CoreGui or game:GetService'CoreGui'return a2
end,function()return workspace.Terrain end,function()for be,bf in ipairs(aR)do
pcall(function()bf:Destroy()end)end table.clear(aR)bb=nil end local bi,bk=
function()if ab.IsInLobby()then return end local bi,bk=ag.GetTarget(),aS()local
bl,bm=bk and aT(bk),bg()if not aA or not bi or not bi.Root then if a2 and a2.
Parent then a2.Enabled=false end else local bn=bf()if bi.Model and bi.Model.
Parent then bn.Adornee=bi.Model bn.Enabled=true else bn.Enabled=false end end
local bn,bo=ag.GetWaypoints(),ag.GetPathInstance()if not ay or not bn or#bn==0
or not bm then bh()else local bp=tostring(bo)..'_'..tostring(#bn)if bb~=bp then
bh()for bq=2,#bn do local br,bs=bn[bq-1].Position,bn[bq].Position local bt=(bs-
br).Magnitude if bt>0.01 then local bu=Instance.new'LineHandleAdornment'bu.Name=
'TM_PathLine_Debug'bu.Adornee=bm bu.AlwaysOnTop=true bu.Length=bt bu.Thickness=2
bu.Transparency=0.3 bu.Color3=Color3.fromRGB(0,255,120)bu.ZIndex=0 bu.CFrame=
CFrame.lookAt(br,bs)bu.Parent=aa.CoreGui or game:GetService'CoreGui'aR[#aR+1]=bu
end end bb=bp end end if not az or not aX or not bl or not bm then if a3 then a3
.Visible=false end if a4 then a4.Visible=false end else local bp,bq=bl+Vector3.
new(0,0.5,0),aX+Vector3.new(0,0.5,0)local br=(bq-bp).Magnitude if br>=0.3 then
if not a3 or not a3.Parent then a3=Instance.new'LineHandleAdornment'a3.Name=
'TM_ActualPath_Debug'a3.Adornee=bm a3.AlwaysOnTop=true a3.Thickness=3.5 a3.
Transparency=0.15 a3.Color3=Color3.fromRGB(0,230,255)a3.ZIndex=2 a3.Parent=aa.
CoreGui or game:GetService'CoreGui'end a3.Length=br a3.CFrame=CFrame.lookAt(bp,
bq)a3.Visible=true if not a4 or not a4.Parent then a4=Instance.new
'SphereHandleAdornment'a4.Name='TM_ActualMarker_Debug'a4.Adornee=bm a4.
AlwaysOnTop=true a4.Radius=0.65 a4.Transparency=0.2 a4.Color3=Color3.fromRGB(0,
230,255)a4.ZIndex=3 a4.Parent=aa.CoreGui or game:GetService'CoreGui'end a4.
CFrame=CFrame.new(bq)a4.Visible=true else if a3 then a3.Visible=false end if a4
then a4.Visible=false end end end if not aD or not aZ or not bl or not bi or not
bm then if a5 then a5.Visible=false end if a6 then a6.Visible=false end else
local bp,bq,br=aZ.origin or(bl+Vector3.new(0,1.5,0)),aZ.directHitPos or aZ.
targetPos,aZ.directBlocked if bq then local bs=(bq-bp).Magnitude if bs>=0.2 then
if not a5 or not a5.Parent then a5=Instance.new'LineHandleAdornment'a5.Name=
'TM_BlockerRay_Debug'a5.Adornee=bm a5.AlwaysOnTop=true a5.Thickness=3 a5.
Transparency=0.2 a5.ZIndex=3 a5.Parent=aa.CoreGui or game:GetService'CoreGui'end
a5.Length=bs a5.Color3=br and Color3.fromRGB(255,30,30)or Color3.fromRGB(50,255,
50)a5.CFrame=CFrame.lookAt(bp,bq)a5.Visible=true if br and aZ.directHitPos then
if not a6 or not a6.Parent then a6=Instance.new'SphereHandleAdornment'a6.Name=
'TM_BlockerHitMarker_Debug'a6.Adornee=bm a6.AlwaysOnTop=true a6.Radius=0.5 a6.
Transparency=0.2 a6.Color3=Color3.fromRGB(255,30,30)a6.ZIndex=4 a6.Parent=aa.
CoreGui or game:GetService'CoreGui'end a6.CFrame=CFrame.new(aZ.directHitPos)a6.
Visible=true else if a6 then a6.Visible=false end end else if a5 then a5.Visible
=false end if a6 then a6.Visible=false end end end end local bp=bi and bi.Root
if not aE or not bp or not bp.Parent then if a7 then a7.Visible=false end if a8
then a8.Visible=false end if a9 then a9.Visible=false end if b then b.Visible=
false end else local bq=aT(bp)or bp.Position local br=bl and(bl.Y-2.5)or(bq.Y-
2.5)local bs=Vector3.new(bq.X,br,bq.Z)local bt=CFrame.new(bs)*CFrame.Angles(math
.rad(90),0,0)local bu,bv,bw=bp.CFrame:ToObjectSpace(bt),aV(bi)local bx=math.max(
1,bv)local by,bz=math.max(bx+0.5,bw),0.35 if not a7 or not a7.Parent then a7=
Instance.new'CylinderHandleAdornment'a7.Name='TM_MinDistanceFill_Debug'a7.
AlwaysOnTop=true a7.ZIndex=4 a7.Parent=aa.CoreGui or game:GetService'CoreGui'end
a7.Adornee=bp a7.Height=0.02 a7.InnerRadius=0 a7.Radius=bx a7.Color3=Color3.
fromRGB(255,200,0)a7.Transparency=0.82 a7.CFrame=bu a7.Visible=true if not a8 or
not a8.Parent then a8=Instance.new'CylinderHandleAdornment'a8.Name=
'TM_MinDistanceRing_Debug'a8.AlwaysOnTop=true a8.ZIndex=5 a8.Parent=aa.CoreGui
or game:GetService'CoreGui'end a8.Adornee=bp a8.Height=0.05 a8.InnerRadius=math.
max(0.1,bx-bz)a8.Radius=bx a8.Color3=Color3.fromRGB(255,215,20)a8.Transparency=
0.25 a8.CFrame=bu a8.Visible=true if not a9 or not a9.Parent then a9=Instance.
new'CylinderHandleAdornment'a9.Name='TM_MaxDistanceFill_Debug'a9.AlwaysOnTop=
true a9.ZIndex=4 a9.Parent=aa.CoreGui or game:GetService'CoreGui'end a9.Adornee=
bp a9.Height=0.02 a9.InnerRadius=bx a9.Radius=by a9.Color3=Color3.fromRGB(0,255,
120)a9.Transparency=0.82 a9.CFrame=bu a9.Visible=true if not b or not b.Parent
then b=Instance.new'CylinderHandleAdornment'b.Name='TM_MaxDistanceRing_Debug'b.
AlwaysOnTop=true b.ZIndex=5 b.Parent=aa.CoreGui or game:GetService'CoreGui'end b
.Adornee=bp b.Height=0.05 b.InnerRadius=math.max(0.1,by-bz)b.Radius=by b.Color3=
Color3.fromRGB(0,255,120)b.Transparency=0.25 b.CFrame=bu b.Visible=true local bA
,bB,bC=ak.GetActiveBossArea(bi)if bA and bC and bB and bB>0 then local bD=
Vector3.new(bC.X,br,bC.Z)local bE=CFrame.new(bD)*CFrame.Angles(math.rad(90),0,0)
local bF=bp.CFrame:ToObjectSpace(bE)if not ba or not ba.Parent then ba=Instance.
new'CylinderHandleAdornment'ba.Name='TM_BossAreaRing_Debug'ba.AlwaysOnTop=true
ba.ZIndex=5 ba.Parent=aa.CoreGui or game:GetService'CoreGui'end ba.Adornee=bp ba
.Height=0.05 ba.InnerRadius=math.max(0.1,bB-0.45)ba.Radius=bB ba.Color3=Color3.
fromRGB(0,200,255)ba.Transparency=0.3 ba.CFrame=bF ba.Visible=true else if ba
then ba.Visible=false end end end end,function()if a2 then pcall(function()a2:
Destroy()end)a2=nil end if a3 then pcall(function()a3:Destroy()end)a3=nil end if
a4 then pcall(function()a4:Destroy()end)a4=nil end if a5 then pcall(function()a5
:Destroy()end)a5=nil end if a6 then pcall(function()a6:Destroy()end)a6=nil end
if a7 then pcall(function()a7:Destroy()end)a7=nil end if a8 then pcall(function(
)a8:Destroy()end)a8=nil end if a9 then pcall(function()a9:Destroy()end)a9=nil
end if b then pcall(function()b:Destroy()end)b=nil end if ba then pcall(function
()ba:Destroy()end)ba=nil end bh()end function ao.IsEnabled()return ap end
function ao.IsRunning()return aq end function ao.GetState()return aF end
function ao.GetScanInterval()return ar end function ao.SetScanInterval(bl)if
type(bl)=='number'and bl>0.1 then ar=bl end end function ao.
GetMobMinCombatDistance()return as end function ao.SetMobMinCombatDistance(bl)if
type(bl)=='number'and bl>=1 then as=bl if as>at then at=as+5 end end end
function ao.GetMobMaxCombatDistance()return at end function ao.
SetMobMaxCombatDistance(bl)if type(bl)=='number'and bl>=2 then at=bl if as>at
then as=math.max(1,at-5)end end end function ao.GetBossMinCombatDistance()return
au end function ao.SetBossMinCombatDistance(bl)if type(bl)=='number'and bl>=1
then au=bl if au>av then av=au+5 end end end function ao.
GetBossMaxCombatDistance()return av end function ao.SetBossMaxCombatDistance(bl)
if type(bl)=='number'and bl>=2 then av=bl if au>av then au=math.max(1,av-5)end
end end function ao.GetMinCombatDistance()return as end function ao.
SetMinCombatDistance(bl)ao.SetMobMinCombatDistance(bl)end function ao.
GetMaxCombatDistance()return at end function ao.SetMaxCombatDistance(bl)ao.
SetMobMaxCombatDistance(bl)end ao.IsTargetBoss=aU function ao.
IsAutoFaceTargetEnabled()return aw end function ao.SetAutoFaceTarget(bl)aw=bl
and true or false if not aw then local bm=ab.GetHumanoid()if bm and bm.Parent
then pcall(function()bm.AutoRotate=true end)end end end function ao.
GetReachDistance()return maxCombatDistance end function ao.SetReachDistance(bl)
if type(bl)=='number'and bl>=2 then ao.SetMaxCombatDistance(bl)end end function
ao.GetRepathDistance()return ax end function ao.SetRepathDistance(bl)if type(bl)
=='number'and bl>=1 then ax=bl ag.SetRepathThreshold(bl)end end function ao.
SetAutoJumpOnStuck(bl)aO=bl==true end function ao.IsAutoJumpOnStuckEnabled()
return aO end function ao.SetStuckVelocityThreshold(bl)if type(bl)=='number'and
bl>0 then aP=bl end end function ao.GetStuckVelocityThreshold()return aP end
function ao.SetPaused(bl)local bm=bl and true or false if bm==aQ then return end
aQ=bm if aQ then local bn,bo=ab.GetHumanoid(),aS()if bn and bn.Parent and bo
then pcall(function()bn:MoveTo(bo.Position)bn.AutoRotate=true end)end end end
function ao.IsPaused()return aQ end function ao.IsAutoSkillEnabled()return aj.
IsEnabled()end function ao.SetAutoSkillEnabled(bl)aj.SetEnabled(bl)end ao.
IsAutoSkillQEnabled=aj.IsSkillQEnabled ao.SetAutoSkillQEnabled=aj.
SetSkillQEnabled ao.IsAutoSkillEEnabled=aj.IsSkillEEnabled ao.
SetAutoSkillEEnabled=aj.SetSkillEEnabled ao.GetSkillERange=aj.GetSkillERange ao.
SetSkillERange=aj.SetSkillERange ao.GetSkillSpamInterval=aj.GetSpamInterval ao.
SetSkillSpamInterval=aj.SetSkillSpamInterval ao.GetBuffDuration=aj.
GetBuffDuration ao.SetBuffDuration=aj.SetBuffDuration ao.IsBuffActive=aj.
IsBuffActive ao.CastSkillQ=aj.CastSkillQ ao.CastSkillE=aj.CastSkillE function ao
.IsPlannedPathVisualEnabled()return ay end function ao.SetPlannedPathVisual(bl)
ay=bl==true if not ay then bh()end end function ao.IsActualPathVisualEnabled()
return az end function ao.SetActualPathVisual(bl)az=bl==true if not az then if
a3 then a3.Visible=false end if a4 then a4.Visible=false end end end function ao
.IsBlockerRayVisualEnabled()return aD end function ao.SetBlockerRayVisual(bl)aD=
bl==true if not aD then if a5 then a5.Visible=false end if a6 then a6.Visible=
false end end end function ao.IsTargetVisualEnabled()return aA end function ao.
SetTargetVisual(bl)aA=bl==true if not aA then if a2 and a2.Parent then a2.
Enabled=false end end end function ao.IsCombatRangeVisualEnabled()return aE end
function ao.SetCombatRangeVisual(bl)aE=bl==true if not aE then if a7 then a7.
Visible=false end if a8 then a8.Visible=false end if a9 then a9.Visible=false
end if b then b.Visible=false end end end function ao.GetDebugInfo()local bl=aS(
)local bm,bn,bo,bp,bq,br=bl and aT(bl),ag.GetTarget(),'-',0,0,ag.GetWaypoints()
if bn and bn.Model then bo=bn.Model.Name or'-'local bs=aT(bn.Root)if bs and bm
then bp=(bs-bm).Magnitude bq=Vector3.new(bs.X-bm.X,0,bs.Z-bm.Z).Magnitude end
end local bs={directBlocked=false,blockerName='None',blockerDist=0}if aZ then bs
.directBlocked=aZ.directBlocked==true if aZ.directHitPart then bs.blockerName=aZ
.directHitPart.Name or'Part'end if aZ.directHitPos and bm then bs.blockerDist=(
aZ.directHitPos-bm).Magnitude end end local bt,bu=0,0 if bl then local bv=bl.
AssemblyLinearVelocity or bl.Velocity if bv then bt=Vector3.new(bv.X,0,bv.Z).
Magnitude bu=bv.Y end end return{state=aF,enemyName=bo,enemyDist=bp,enemyFlat=bq
,hasTarget=bn~=nil,destMode=aG,nodeIndex=aY,waypointCount=br and#br or 0,
hasDestination=aX~=nil,blocker=bs,velocity=bt,verticalVelocity=bu,stuckTimer=aM}
end function ao.Toggle(bl,bm)if bl==ap then return end ap=bl if ap then if not
bm then ad.EnableExclusive'AutoFarm'end if a_ then a_:Disconnect()a_=nil end aq=
true aI=0 aJ=false aH=0 ag.SetRepathThreshold(ax)if not a0 then a0=ab.
OnEnemyChanged(function()if ap and aq and aF~=an.HOLD then bc()end end)end if
not a1 then a1=ab.OnRespawn(function()ag.ClearTarget()aF=an.NO_TARGET aZ=nil bc(
)end)end if not aK then task.spawn(function()if ab.ReadyDungeon()then aK=true
end end)end task.defer(bc)a_=al.Heartbeat:Connect(function(bn)local bo,bp=pcall(
be,bn)if not bo then warn(('[AutoFarm] Error in stepMovementLoop: %s'):format(
tostring(bp)))end bi()end)else if a_ then a_:Disconnect()a_=nil end aq=false if
a0 then a0()a0=nil end if a1 then a1()a1=nil end local bn,bo=ab.GetHumanoid(),
aS()if bn and bn.Parent and bo then pcall(function()bn:MoveTo(bo.Position)bn.
AutoRotate=true end)end ag.ClearTarget()aF=an.NO_TARGET aX=nil aG='None'aZ=nil
aM=0 aI+=1 aJ=false bk()end end ad.Register('AutoFarm',ao.Toggle,ao.IsEnabled)ac
.Register(function()ao.Toggle(false)bk()end)return ao end function a.z()local aa
,ab,ac,ad,ae,af,ag,ah,ai,aj=a.load'b',a.load'y',a.load'w',a.load'g',a.load'c',{}
,false,true,false,{}local ak=function()for ak,al in ipairs(aj)do pcall(al,ag)end
end function af.IsEnabled()return ag end function af.Toggle(al,am)local an=al==
true if ag==an then if not an then ai=false end return end ag=an if am then ai=
an elseif not an then ai=false end if an then ac.Toggle(true)ac.
SetAutoDodgeEnabled(true)ad.EnableExclusive'AutoFarm'ab.Toggle(true)ab.
SetAutoSkillEnabled(true)else ab.Toggle(false)ab.SetAutoSkillEnabled(false)ac.
SetAutoDodgeEnabled(false)ac.Toggle(false)end ak()end function af.
IsAutoTriggeredByBoss()return ai end function af.SetAutoBossCombat(al)ah=al==
true end function af.IsAutoBossCombatEnabled()return ah end function af.
OnStateChanged(al)if type(al)~='function'then return function()end end table.
insert(aj,al)return function()for am,an in ipairs(aj)do if an==al then table.
remove(aj,am)break end end end end aa.Register(function()af.Toggle(false)end)
return af end function a.A()local aa={}function aa.PatchSliderLoadCallback(ab)if
not ab or type(ab.UpdateValue)~='function'then return ab end local ac=ab.
UpdateValue ab.UpdateValue=function(ad,ae)ac(ad,ae)local af=ad.Settings if af
and af.Callback then task.spawn(function()pcall(af.Callback,tonumber(ae))end)end
end return ab end function aa.PatchDropdownRestore(ab,ac)if not ab or type(ab.
UpdateSelection)~='function'then return ab end local ad=ab.UpdateSelection ab.
UpdateSelection=function(ae,af)if type(af)=='string'and af~=''and not ae:
IsOption(af)then if ac then pcall(function()ae:InsertOptions{af}end)else local
ag=ae.Settings and ae.Settings.Options if type(ag)=='table'and#ag>0 then af=ag[1
]else local ah=next(ae:GetOptions())if ah then af=ah end end end end ad(ae,af)
end return ab end return aa end function a.B()local aa,ab,ac=a.load'e',a.load'f'
,a.load'b'local ad,ae,af,ag,ah=aa.UserInputService,aa.VirtualInputManager,{},
false function af.IsMouseComboEnabled()return ag end function af.
SetMouseComboEnabled(ai)ag=ai==true end local ai=function()task.spawn(function()
ae:SendKeyEvent(true,Enum.KeyCode.Q,false,game)ae:SendKeyEvent(true,Enum.KeyCode
.E,false,game)task.wait(ab.GetKeyHoldTime())ae:SendKeyEvent(false,Enum.KeyCode.Q
,false,game)ae:SendKeyEvent(false,Enum.KeyCode.E,false,game)end)end function af.
Init()if af.inited then return end af.inited=true ah=ad.InputBegan:Connect(
function(aj,ak)if aj.UserInputType==Enum.UserInputType.MouseButton2 then if ad:
GetFocusedTextBox()then return end if ag then ai()end end end)end ac.Register(
function()if ah then ah:Disconnect()ah=nil end af.inited=false end)return af end
function a.C()local aa,ab,ac,ad=a.load'e',a.load'f',a.load'c',a.load'b'local ae,
af,ag,ah,ai,aj,ak,al,am=aa.player,{},false,2,0,false local an=function()local an
,ao=ab.GetHumanoid(),ae and ae.Character if an and an.Health>0 then pcall(
function()an.Health=0 end)pcall(function()an:ChangeState(Enum.HumanoidStateType.
Dead)end)end if ao and ao.Parent then pcall(function()ao:BreakJoints()end)end
end local ao=function(ao)if not ag or aj then return end if ab.IsInLobby()or ab.
IsDead()then return end if ao<=0 or ao~=ah then return end aj=true task.spawn(
function()if ai>0 then task.wait(ai)end if not ag or ab.IsInLobby()or ab.IsDead(
)then return end if ab.GetCurrentRoomIndex()~=ah then return end ac.Notify(
'Auto Reset',(
'\u{110}\u{e3} t\u{1ef1} s\u{e1}t t\u{1ea1}i Room %d (1 l\u{1ea7}n duy nh\u{1ea5}t trong run)'
):format(ah),3)an()end)end local ap,aq=function()if ak then return end ak=ab.
OnRoomIndexChanged(function(ap)if ap<=1 then aj=false end ao(ap)end)al=ab.
OnLobbyChanged(function(ap)if ap then aj=false end end)am=ab.
OnDungeonNameChanged(function()aj=false end)end,function()if ak then ak()ak=nil
end if al then al()al=nil end if am then am()am=nil end end function af.Toggle(
ar)ag=ar and true or false if ag then aj=false ap()ao(ab.GetCurrentRoomIndex())
else aq()end end function af.IsEnabled()return ag end function af.SetTargetRoom(
ar)if type(ar)=='number'then ah=math.clamp(math.floor(ar),1,20)end end function
af.GetTargetRoom()return ah end function af.SetDelay(ar)if type(ar)=='number'
then ai=math.clamp(ar,0,15)end end function af.GetDelay()return ai end function
af.ResetNow()ac.Notify('Auto Reset',
'\u{110}\u{e3} th\u{1ef1}c hi\u{1ec7}n t\u{1ef1} s\u{e1}t th\u{1ee7} c\u{f4}ng',
2)an()end ad.Register(function()aq()ag=false aj=false end)return af end function
a.D()local aa,ab,ac,ad,ae=a.load'f',a.load'A',a.load'd',a.load'B',a.load'C'
return function(af,ag)local ah=ag:Section{Side='Right'}ah:Header{Name=
'Movement Speed'}ah:Toggle({Name='Fast Speed',Default=aa.IsSpeedEnabled(),
Callback=ac.Wrap(function(ai)aa.SetSpeedEnabled(ai)end)},'Toggle_FastSpeed')ab.
PatchSliderLoadCallback(ah:Slider({Name='Custom Fast Speed',Default=aa.
GetFastSpeed(),Minimum=16,Maximum=24,DisplayMethod='Value',Precision=1,Callback=
ac.Wrap(function(ai)aa.SetFastSpeed(ai)end)},'Slider_FastSpeed'))ah:Toggle({Name
='Instant Acceleration (Max Speed t\u{1ee9}c th\u{ec})',Default=aa.
IsInstantAccelEnabled(),Callback=ac.Wrap(function(ai)aa.SetInstantAccelEnabled(
ai)end)},'Toggle_InstantAcceleration')ah:Header{Name='Shortcuts'}ah:Toggle({Name
='Right Click Combo (Q+E)',Default=ad.IsMouseComboEnabled(),Callback=ac.Wrap(
function(ai)ad.SetMouseComboEnabled(ai)end)},'Toggle_MouseCombo')ah:Header{Name=
'Auto Reset / Suicide (T\u{1ef1} s\u{e1}t)'}ah:Toggle({Name=
'Auto Reset on Room (1 L\u{1ea7}n/Run)',Default=ae.IsEnabled(),Callback=ac.Wrap(
function(ai)ae.Toggle(ai)end)},'Toggle_AutoResetRoom')ab.
PatchSliderLoadCallback(ah:Slider({Name=
'Target Room (Ph\u{f2}ng t\u{1ef1} s\u{e1}t)',Default=ae.GetTargetRoom(),Minimum
=1,Maximum=15,DisplayMethod='Round',Precision=0,Callback=ac.Wrap(function(ai)ae.
SetTargetRoom(math.floor(ai+0.5))end)},'Slider_AutoResetTargetRoom'))ab.
PatchSliderLoadCallback(ah:Slider({Name='Reset Delay (s)',Default=ae.GetDelay(),
Minimum=0,Maximum=10,DisplayMethod='Value',Precision=1,Callback=ac.Wrap(function
(ai)ae.SetDelay(ai)end)},'Slider_AutoResetDelay'))ah:Button{Name=
'Reset Character Now',Callback=function()ae.ResetNow()end}end end function a.E()
local aa,ab,ac,ad,ae=a.load'd',a.load'z',a.load'w',a.load'f',a.load'A'return
function(af,ag)local ah=ag:Section{Side='Left'}ah:Header{Name=
'Hazard Scanner Controls'}local ai=ag:Section{Side='Right'}ai:Header{Name=
'Real-time Hazard Monitor'}local aj,ak,al,am,an,ao=ai:Label{Text=
"Detector: <font color='rgb(255,80,80)'>Disabled</font>"},ai:Label{Text=
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
local ar=ag:Section{Side='Right'}ar:Header{Name='Custom Trajectory Length'}ae.
PatchSliderLoadCallback(ar:Slider({Name='Second Boss Moving Beam (studs)',
Default=ac.GetSecondBossBeamLength(),Minimum=10,Maximum=250,DisplayMethod=
'Value',Precision=0,Callback=aa.Wrap(function(as)ac.SetSecondBossBeamLength(as)
end)},'Slider_HazardSecondBossBeamLength'))ac.OnHazardChanged(function(as,at)aq(
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
)as:UpdateState(au)end)pcall(function()at:UpdateState(au)end)aq()end)ae.
PatchSliderLoadCallback(ah:Slider({Name='Dodge Snap Distance (studs)',Default=ac
.GetDodgeSnapDistance(),Minimum=0.5,Maximum=5,DisplayMethod='Value',Precision=1,
Callback=aa.Wrap(function(au)ac.SetDodgeSnapDistance(au)end)},
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
Toggle({Name='Log Rejected (Kh\u{f4}ng v\u{1ebd} \u{111}\u{1b0}\u{1ee3}c)',
Default=ac.IsLogFailedEnabled(),Callback=aa.Wrap(function(au)ac.SetLogFailed(au)
end)},'Toggle_SmartDodgeLogRejected')ae.PatchSliderLoadCallback(ah:Slider({Name=
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
local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'd',a.load'y',a.load'z',a.load't',a.load
'F',a.load'f',a.load'e',a.load'A',a.load'b'local aj=ag.RunService return
function(ak,al)local am=al:Section{Side='Left'}am:Header{Name='Auto Farm'}local
an=am:Toggle({Name='Enable Auto Farm',Default=ab.IsEnabled(),Callback=aa.Wrap(
function(an)ab.Toggle(an)end)},'Toggle_AutoFarm')am:Slider({Name=
'Rescan Interval (s)',Default=ab.GetScanInterval(),Minimum=0.5,Maximum=5,
Precision=1,Callback=aa.Wrap(function(ao)ab.SetScanInterval(ao)end)},
'Slider_AF_ScanInterval')am:Toggle({Name='Auto Face Target (Look At Enemy)',
Default=ab.IsAutoFaceTargetEnabled(),Callback=aa.Wrap(function(ao)ab.
SetAutoFaceTarget(ao)end)},'Toggle_AF_AutoFaceTarget')am:Slider({Name=
'Repath Distance (studs)',Default=ab.GetRepathDistance(),Minimum=2,Maximum=20,
DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(ao)ab.
SetRepathDistance(ao)end)},'Slider_AF_RepathDistance')am:Toggle({Name=
'Auto Jump When Stuck (Low Velocity)',Default=ab.IsAutoJumpOnStuckEnabled(),
Callback=aa.Wrap(function(ao)ab.SetAutoJumpOnStuck(ao)end)},
'Toggle_AF_AutoJumpOnStuck')ah.PatchSliderLoadCallback(am:Slider({Name=
'Stuck Velocity Threshold (studs/s)',Default=ab.GetStuckVelocityThreshold(),
Minimum=2,Maximum=20,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function
(ao)ab.SetStuckVelocityThreshold(ao)end)},'Slider_AF_StuckVelocity'))am:Header{
Name='Auto Skill (Smart Buff & Damage)'}local ao=am:Toggle({Name=
'Enable Auto Skill (Smart Q + E)',Default=ab.IsAutoSkillEnabled(),Callback=aa.
Wrap(function(ao)ab.SetAutoSkillEnabled(ao)end)},'Toggle_AF_AutoSkill')ac.
OnStateChanged(function(ap)pcall(function()an:UpdateState(ap)end)pcall(function(
)ao:UpdateState(ap)end)end)ah.PatchSliderLoadCallback(am:Slider({Name=
'Skill E Cast Range (studs)',Default=ab.GetSkillERange(),Minimum=5,Maximum=150,
DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(ap)ab.
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
Side='Right'}ap:Header{Name='Auto Farm Monitor'}local aq,ar,as,at,au,av,aw,ax=ap
:Label{Text="State: <font color='rgb(160,160,160)'>NO_TARGET</font>"},ap:Label{
Text="Target: <font color='rgb(160,160,160)'>None</font>"},ap:Label{Text=
"Distance: <font color='rgb(160,160,160)'>-</font>"},ap:Label{Text=
"Velocity: <font color='rgb(160,160,160)'>0.0 studs/s</font>"},ap:Label{Text=
"Blocker Detection: <font color='rgb(160,160,160)'>-</font>"},ap:Label{Text=
[[Destination Mode: <font color='rgb(160,160,160)'>None</font>]]},(ap:Label{Text
="Path Nodes: <font color='rgb(160,160,160)'>0</font>"})local ay,az=function()
local ay,az=ab.GetDebugInfo(),'160,160,160'if ay.state=='CHASE'then az=
'0,255,120'elseif ay.state=='HOLD'then az='255,200,0'elseif ay.state=='BLOCKED'
then az='255,60,60'elseif ay.state=='REPATHING'or ay.state=='ACQUIRING_TARGET'or
ay.state=='TRACKING_TARGET'then az='0,200,255'end pcall(function()aq:UpdateName(
("State: <font color='rgb(%s)'>%s</font>"):format(az,ay.state))end)pcall(
function()if ay.hasTarget then ar:UpdateName((
"Target: <font color='rgb(255,220,120)'>%s</font>"):format(ay.enemyName))as:
UpdateName((
[[Distance: <font color='rgb(0,255,255)'>%.1f studs (flat %.1f)</font>]]):
format(ay.enemyDist,ay.enemyFlat))else ar:UpdateName
"Target: <font color='rgb(160,160,160)'>None</font>"as:UpdateName
"Distance: <font color='rgb(160,160,160)'>-</font>"end end)pcall(function()local
aA=ay.velocity or 0 local aD=aA>=12 and'0,255,120'or(aA>=10 and'255,200,0'or
'255,80,80')at:UpdateName(("Velocity: <font color='rgb(%s)'>%.1f studs/s</font>"
):format(aD,aA))end)pcall(function()if ay.hasTarget and ay.blocker then if ay.
blocker.directBlocked then au:UpdateName((
[[Blocker: <font color='rgb(255,60,60)'>BLOCKED by '%s' (%.1fm)</font>]]):
format(ay.blocker.blockerName,ay.blocker.blockerDist))else au:UpdateName
[[Blocker: <font color='rgb(0,255,120)'>CLEAR (Direct Line to Target)</font>]]
end else au:UpdateName"Blocker: <font color='rgb(160,160,160)'>None</font>"end
end)pcall(function()local aA=ay.destMode if ay.nodeIndex then aA=(
'%s (Node #%d)'):format(ay.destMode,ay.nodeIndex)end local aD=ay.destMode==
'Direct'and'0,255,255'or(ay.destMode=='Waypoint'and'255,200,0'or(ay.destMode==
'Hold'and'255,200,0'or'255,80,80'))av:UpdateName((
"Destination Mode: <font color='rgb(%s)'>%s</font>"):format(aD,aA))end)pcall(
function()aw:UpdateName((
[[Path Nodes: <font color='rgb(160,255,160)'>%d waypoints</font>]]):format(ay.
waypointCount))end)end,0 ax=aj.Heartbeat:Connect(function()local aA=os.clock()if
aA-az>=0.25 then az=aA ay()end end)ai.Register(function()if ax then ax:
Disconnect()ax=nil end end)local aA=al:Section{Side='Right'}aA:Header{Name=
'Contextual Combat Distance'}local aD,aE=aA:Label{Text='Active: -'},ae.
GetDungeons()local aF,aG,aH,aI,aJ,aK,aM,aN,aO,aP=af.GetCurrentDungeonName()or aE
[1]or'Desert Temple','Mob',false,function()local aF,aG=af.GetCurrentDungeonName(
),af.GetCombatTargetKey()local aH,aI=ad.GetCombatDistances(aF,aG)local aJ,aK,aM,
aN=aF and("<font color='rgb(0,255,255)'>"..aF..'</font>')or
"<font color='rgb(160,160,160)'>Lobby</font>","<font color='rgb(255,200,0)'>"..
ad.GetTargetDisplay(aG)..'</font>',(
"<font color='rgb(120,255,120)'>%.0f - %.0f studs</font>"):format(aH,aI),''if aG
~='Mob'then local aO,aP=ad.GetBossArea(aF,aG)local aQ=aO and(
"<font color='rgb(0,255,255)'>Area: %.0f studs</font>"):format(aP)or
"<font color='rgb(160,160,160)'>Area: Off</font>"aN=' | '..aQ end local aO=ad.
GetDisableDodge(aF,aG)if aO then aN=aN..
" | <font color='rgb(255,100,100)'>No Dodge</font>"end pcall(function()aD:
UpdateName(('Active: %s | Target: %s (%s%s)'):format(aJ,aK,aM,aN))end)end local
aQ=function()aH=true local aQ,aR=ad.GetCombatDistances(aF,aG)if aJ then pcall(
function()aJ:UpdateValue(aQ)end)end if aK then pcall(function()aK:UpdateValue(aR
)end)end if aM then pcall(function()aM:UpdateState(ad.GetDisableDodge(aF,aG))end
)end if aG=='Mob'then if aN then pcall(function()aN:UpdateState(false)end)end if
aO then pcall(function()aO:UpdateValue(80)end)end else local aS,aT=ad.
GetBossArea(aF,aG)if aN then pcall(function()aN:UpdateState(aS)end)end if aO
then pcall(function()aO:UpdateValue(aT)end)end end if aP then pcall(function()
local aS=aG=='Mob'and" <font color='rgb(160,160,160)'>(Boss Area N/A)</font>"or
''aP:UpdateName((
[[Editing: <font color='rgb(0,255,255)'>%s</font> / <font color='rgb(255,200,0)'>%s</font>%s]]
):format(aF,ad.GetTargetDisplay(aG),aS))end)end aH=false aI()end local aR,aS=aA:
Dropdown{Name='Select Dungeon',Options=aE,Default=aF,Required=true,Callback=
function(aR)if type(aR)=='string'and#aR>0 then aF=aR aQ()end end},aA:Dropdown{
Name='Select Target',Options=ad.GetTargetOptions(),Default='Normal',Required=
true,Callback=function(aR)aG=ad.GetTargetKey(aR)aQ()end}aP=aA:Label{Text=''}
local aT,aU=ad.GetCombatDistances(aF,aG)aJ=ah.PatchSliderLoadCallback(aA:Slider{
Name='Min Combat Distance (studs)',Default=aT,Minimum=2,Maximum=150,
DisplayMethod='Value',Precision=1,Callback=function(aV)if aH then return end ad.
SetMinCombatDistance(aF,aG,aV)aI()end})aK=ah.PatchSliderLoadCallback(aA:Slider{
Name='Max Combat Distance (studs)',Default=aU,Minimum=5,Maximum=200,
DisplayMethod='Value',Precision=1,Callback=function(aV)if aH then return end ad.
SetMaxCombatDistance(aF,aG,aV)aI()end})local aV=ad.GetDisableDodge(aF,aG)aM=aA:
Toggle{Name=
'Disable Dodge on Target (Kh\u{f4}ng n\u{e9} \u{111}\u{f2}n, ch\u{1ec9} x\u{1ea3} skill)'
,Default=aV,Callback=function(aW)if aH then return end ad.SetDisableDodge(aF,aG,
aW)aI()end}aA:Header{Name='Boss Area Constraint (Boss Only)'}local aW,aX=ad.
GetBossArea(aF,aG)aN=aA:Toggle{Name='Enable Boss Area Constraint',Default=aW,
Callback=function(aY)if aH then return end if aG=='Mob'then if aN then pcall(
function()aN:UpdateState(false)end)end return end ad.SetBossAreaEnabled(aF,aG,aY
)aI()end}aO=ah.PatchSliderLoadCallback(aA:Slider{Name='Boss Area Radius (studs)'
,Default=aX,Minimum=10,Maximum=300,DisplayMethod='Value',Precision=1,Callback=
function(aY)if aH then return end if aG=='Mob'then return end ad.
SetBossAreaRadius(aF,aG,aY)aI()end})aA:Button{Name='Reset Target to Default',
Callback=function()ad.ResetTarget(aF,aG)aQ()end}aA:Button{Name=
'Reset Dungeon to Default',Callback=function()ad.ResetDungeon(aF)aQ()end}local
aY,aZ,a_,a0=af.OnDungeonNameChanged(function(aY)if aY and type(aY)=='string'and#
aY>0 then aF=aY pcall(function()aR:UpdateSelection(aY)end)end aQ()end),af.
OnBossActiveChanged(function()aI()end),af.OnBossIndexChanged(function()aI()end),
ad.OnDataChanged(function()aQ()end)ai.Register(function()pcall(aY)pcall(aZ)
pcall(a_)pcall(a0)end)aQ()end end function a.H()local aa,ab,ac,ad,ae=a.load'd',a
.load'z',a.load'D',a.load'E',a.load'G'return function(af,ag)local ah=ag:Section{
Side='Left'}ah:Header{Name='Combat Master (C\u{1ea7}u Dao T\u{1ed5}ng)'}local ai
=ah:Toggle({Name='Enable Combat Master',Default=ab.IsEnabled(),Callback=aa.Wrap(
function(ai)ab.Toggle(ai)end)},'Toggle_CombatMaster')ah:Toggle({Name=
'Auto Boss Combat (Skip Boss Macro)',Default=ab.IsAutoBossCombatEnabled(),
Callback=aa.Wrap(function(aj)ab.SetAutoBossCombat(aj)end)},
'Toggle_AutoBossCombat')ab.OnStateChanged(function(aj)pcall(function()ai:
UpdateState(aj)end)end)ac(af,ag)ad(af,ag)ae(af,ag)end end function a.I()local aa
,ab,ac,ad,ae=a.load'e',a.load'c',a.load'F',a.load'f',a.load'b'local af,ag,ah,ai,
aj,ak,al,am,an,ao,ap,aq=aa.player.Name,false,false,false,'Desert Temple','Easy',
false,true,false,3,{[77649408247578]=true,[3220968688]=true,[2414851778]=true},{
}local ar,as,at=function()return ap[game.PlaceId]==true end,function()for ar,as
in ipairs(aq)do pcall(as,aj,ac.GetAllowedDifficulties(aj))end end,function()if
ah then return end ah=true ai=false task.spawn(function()local ar,as=pcall(
function()local ar=game:GetService'ReplicatedStorage':WaitForChild('remotes',15)
if not ar then error'remotes not found'end local as=ac.GetLevelReq(aj,ak)pcall(
function()ar:WaitForChild('createLobby',10):InvokeServer(aj,ak,as,al,am,an)end)
if ai then return end task.wait(ao)if ai then return end if am then pcall(
function()ar:WaitForChild('addPlayerToWhitelist',10):FireServer(af)end)if ai
then return end task.wait(ao)if ai then return end end local at=0 while at<10 do
local au=workspace:FindFirstChild'games'and workspace.games:FindFirstChild
'inLobby'if au then break end task.wait(0.5)at=at+0.5 if ai then return end end
if ai then return end task.wait(ao)if ai then return end pcall(function()ar:
WaitForChild('startDungeon',10):FireServer()end)end)ah=false if ai then return
end if ar then ab.Notify('Auto Join','Joined: '..aj,3)else ab.Notify('Auto Join'
,'Join failed: '..tostring(as),4)end end)end local au,av=function()while ae.
IsActive()do task.wait(0.5)if ag and not ah and ar()and ad.IsInLobby()then at()
end end end,{}function av.Toggle(aw)ag=aw if ag then ab.Notify('Auto Join',
'Enabled',2)else ai=true ab.Notify('Auto Join','Stopped',2)end end function av.
SetDungeon(aw)if type(aw)~='string'or#aw==0 then return end aj=aw if not ac.
IsDifficultyAllowed(aj,ak)then local ax=ac.GetAllowedDifficulties(aj)if#ax>0
then ak=ax[1]end end as()end function av.SetDifficulty(aw)if type(aw)~='string'
then return end if ac.IsDifficultyAllowed(aj,aw)then ak=aw end end function av.
SetHardcore(aw)al=aw end function av.SetPrivate(aw)am=aw end function av.
SetWaveDefence(aw)an=aw end function av.SetDelay(aw)ao=aw end function av.
GetSelectedDungeon()return aj end function av.GetSelectedDifficulty()return ak
end function av.GetAllowedDifficulties()return ac.GetAllowedDifficulties(aj)end
function av.OnDungeonChanged(aw)if type(aw)=='function'then table.insert(aq,aw)
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
return false,0 end local aw={}for ax,ay in pairs(au)do if type(ay)=='table'and#
ay>0 then aw[ax]=ay end end if next(aw)==nil then return false,0 end local ax=
pcall(function()av:FireServer(aw)end)if not ax then return false,0 end return
true,0 end local aw=av function ae.SetSellAction(ax)if type(ax)=='function'then
aw=ax end end local ax=function()local ax,ay=pcall(function()return game:
GetService'ReplicatedStorage':WaitForChild('remotes',5):WaitForChild(
'reloadInvy',5)end)if not ax or not ay then return nil,
'Could not find remote reloadInvy'end local az,aA=pcall(function()return ay:
InvokeServer()end)if not az or aA==nil then return nil,
'Could not read inventory'end local aD,aE,aF,aG={},{},function(aD)return aD.
sellPrice~=nil or aD.UniqueItemID~=nil or aD.rarity~=nil end,function(aD)local
aE=tostring(aD)local aF=tonumber(aE:match'_(%d+)$')if not aF then return nil,nil
end local aG=aE:match'^(.-)_%d+$'return aG,aF end local aH=function(aH,aI,aJ,aK)
local aM=false if type(aH.equipped)=='boolean'then aM=aH.equipped elseif type(aH
.equipped)=='table'then for aN,aO in pairs(aH.equipped)do if aO==true then aM=
true break end end end local aN=au(aH.rarity)or'Common'table.insert(aD,{Type=an[
aI]or aI or'Unknown',Category=aJ or aI,Index=aK,Name=tostring(aH.name or aH.
UniqueItemID or'?'),Rarity=aN,RarityValue=ar[aN],SellPrice=tonumber(aH.sellPrice
)or 0,UniqueItemID=aH.UniqueItemID,Equipped=aM,LevelReq=tonumber(aH.levelReq)or
0,Raw=aH})end local function aI(aJ,aK,aM,aN)if type(aJ)~='table'then return end
if aE[aJ]then return end aE[aJ]=true if aF(aJ)then aH(aJ,aK,aM,aN)return end for
aO,aP in pairs(aJ)do if an[aO]then aI(aP,aO,nil,nil)elseif type(aP)=='table'and
aF(aP)then local aQ,aR=aG(aO)aI(aP,aK,aQ,aR)else aI(aP,aK,aM,aN)end end end aI(
aA,nil,nil,nil)return aD end function ae.ShouldSellItem(ay)if not ay then return
false end if ah and ay.Equipped then return false end if next(ai)and as[ay.
Rarity]and not ai[ay.Rarity]then return false end if next(aj)and ay.Type and not
aj[ay.Type]then return false end local az,aA=ak,al if next(az)==nil then az={[1]
=true}aA='None'end local aD=ay.LevelReq or 0 if aA=='Below'then local aE for aF
in pairs(az)do if not aE or aF>aE then aE=aF end end if aE and aD>aE then return
false end elseif aA=='Above'then local aE for aF in pairs(az)do if not aE or aF<
aE then aE=aF end end if aE and aD<aE then return false end else if not az[aD]
then return false end end return true end function ae.HasAnyFilter()return next(
ai)~=nil or next(aj)~=nil or next(ak)~=nil end function ae.CountMatches()local
ay,az=ax()if not ay then return{total=0,matching=0,error=az or
'Error reading inventory'}end local aA,aD=0,{}for aE,aF in ipairs(ay)do aD[aF.
Type]=(aD[aF.Type]or 0)+1 if ae.ShouldSellItem(aF)then aA+=1 end end return{
total=#ay,matching=aA,byCategory=aD}end function ae.SellItems()if am then return
nil end am=true local ay,az,aA={sold=0,skipped=0,gold=0,error=nil},ax()if not az
then ay.error=aA or'Error reading inventory'am=false return ay end local aD={}
for aE,aF in ipairs(az)do if ae.ShouldSellItem(aF)then if aF.Index then ay.sold
+=1 local aG=aF.Category or aF.Type aD[aG]=aD[aG]or{}table.insert(aD[aG],aF.
Index)end else ay.skipped+=1 end end local aE,aF=pcall(aw,aD)if aE and aF and
type(aF)=='number'then ay.gold=aF end am=false return ay end function ae.
SetLevelReqMode(ay)if ay=='Below'or ay=='Above'then al=ay else al='None'end end
function ae.GetLevelReqMode()return al end function ae.SetExcludeEquipped(ay)ah=
ay end function ae.GetExcludeEquipped()return ah end function ae.SetRarityFilter
(ay)ai={}if type(ay)=='table'then for az,aA in pairs(ay)do if aA==true and type(
az)=='string'then local aD=au(az)or az ai[aD]=true elseif type(aA)=='string'then
local aD=au(aA)or aA ai[aD]=true end end elseif type(ay)=='string'then local az=
au(ay)or ay ai[az]=true end end function ae.GetRarityFilter()local ay={}for az
in pairs(ai)do table.insert(ay,az)end return ay end function ae.SetTypeFilter(ay
)aj={}if type(ay)=='table'then for az,aA in pairs(ay)do if aA==true and type(az)
=='string'then aj[az]=true elseif type(aA)=='string'then aj[aA]=true end end
elseif type(ay)=='string'then aj[ay]=true end end function ae.GetTypeFilter()
local ay={}for az in pairs(aj)do table.insert(ay,az)end return ay end function
ae.SetLevelReqExactFilter(ay)ak={}if type(ay)=='table'then for az,aA in pairs(ay
)do if aA==true then local aD=tonumber(az)if aD then ak[aD]=true end else local
aD=tonumber(aA)if aD then ak[aD]=true end end end elseif type(ay)=='string'or
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
"Item Types: <font color='rgb("..az..")'>"..ay..'</font>')end)local aA,aD=ab.
GetLevelReqMode(),ab.GetLevelReqExactFilter()table.sort(aD,function(aE,aF)return
(tonumber(aE)or 0)<(tonumber(aF)or 0)end)local aE,aF='1 (Safe Fallback)',
'255, 160, 80'if#aD>0 then aF='255, 220, 120'if aA=='Below'then aE=
'Below (\u{2264} '..aD[#aD]..')'elseif aA=='Above'then aE='Above (\u{2265} '..aD
[1]..')'else aE='Exact ('..table.concat(aD,', ')..')'end end pcall(function()am:
UpdateName("Level Req: <font color='rgb("..aF..")'>"..aE..'</font>')end)local aG
=ab.GetExcludeEquipped()local aH,aI=aG and'0, 255, 0'or'255, 80, 80',aG and
'Yes (Protected)'or'No (May Sell)'pcall(function()an:UpdateName(
"Exclude Equipped: <font color='rgb("..aH..")'>"..aI..'</font>')end)end af:
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
then return end local aD,aE=aw..'_Proxy',ax:FindFirstChild(aw)local aF=ax:
FindFirstChild(aD)if az==al then if aE and aE:IsA'SelectionBox'and aE.Adornee==
ax then aE:Destroy()end if not aF then aF=Instance.new'Part'aF.Name=aD aF.
Anchored=true aF.CanCollide=false aF.CanQuery=false aF.CanTouch=false aF.
Transparency=1 aF.Parent=ax au(aw,aF,ay)end local aG=ax.Size local aH=math.max(
math.abs(aG.X),math.abs(aG.Y),math.abs(aG.Z))local aI=math.max(aH*aA,1)aF.Size=
Vector3.new(aI,aI,aI)aF.CFrame=ax.CFrame else if aF then aF:Destroy()end if aE
and aE:IsA'SelectionBox'and aE.Adornee~=ax then aE:Destroy()aE=nil end if not aE
or not aE:IsA'SelectionBox'or aE.Adornee~=ax then au(aw,ax,ay)end end end local
ax,ay=function()local ax=aq and aq.Character local ay=ax and ax:FindFirstChild
'HumanoidRootPart'if not ay or not ay.Parent then return end aw(ag,ay,af,ao,ap)
end,function()if an then task.cancel(an)an=nil end local ax=function(ax)if not
ax then return end for ay,az in ipairs(ax:GetDescendants())do if az.Name==ag or
az.Name==ag..'_Proxy'then az:Destroy()end end end ax(aq and aq.Character)for ay,
az in ipairs(aa.Players:GetPlayers())do ax(az.Character)end end function ac.
TogglePlayerHitbox(az)if az==am then return end am=az if am then if an then task
.cancel(an)an=nil end an=task.spawn(function()while am do local aA,aD=pcall(ax)
if not aA then if os.clock()-(ac.lastPlayerWarn or 0)>5 then ac.lastPlayerWarn=
os.clock()warn('[PlayerHitbox] error:',tostring(aD))end end aa.RunService.
Heartbeat:Wait()end end)else ay()end end function ac.IsPlayerHitboxEnabled()
return am end function ac.GetPlayerHitboxMode()return ao end function ac.
SetPlayerHitboxMode(az)if az~=ak and az~=al then return end ao=az end function
ac.GetPlayerHitboxScale()return ap end function ac.SetPlayerHitboxScale(az)ap=az
end local az,aA=function()for az,aA in ipairs(ab.GetTrackedEnemyData())do local
aD=aA.Root if aD and aD.Parent then aw(ai,aD,ah,as,at)end end end,function()if
av then task.cancel(av)av=nil end for az,aA in ipairs(game:GetService'Workspace'
:GetDescendants())do local aD,aE=aA:FindFirstChild(ai),aA:FindFirstChild(ai..
'_Proxy')if aD then aD:Destroy()end if aE then aE:Destroy()end end end function
ac.ToggleEnemyHitbox(aD)if aD==ar then return end ar=aD if ar then if av then
task.cancel(av)av=nil end av=task.spawn(function()while ar do local aE,aF=pcall(
az)if not aE then if os.clock()-(ac.lastEnemyWarn or 0)>5 then ac.lastEnemyWarn=
os.clock()warn('[EnemyHitbox] error:',tostring(aF))end end aa.RunService.
Heartbeat:Wait()end end)else aA()end end function ac.IsEnemyHitboxEnabled()
return ar end function ac.GetEnemyHitboxMode()return as end function ac.
SetEnemyHitboxMode(aD)if aD~=ak and aD~=al then return end as=aD end function ac
.GetEnemyHitboxScale()return at end function ac.SetEnemyHitboxScale(aD)at=aD end
local aD,aE,aF,aG,aH,aI=Color3.fromRGB(255,0,0),'SkillESP',{},false,false local
aJ=function()table.clear(aF)local aJ=game:GetService'Workspace'for aK,aM in
ipairs(aJ:GetChildren())do aF[aM]=true end aG=true end aJ()local aK,aM=function(
aK)local aM=aq.Character if not aM then return false end local aN=aK while aN do
if aN==aM then return true end aN=aN.Parent end return false end,function(aK)
local aM=aK while aM do if aF[aM]then return true end aM=aM.Parent end return
false end local aN=function(aN)if not aG then return end if aM(aN)then return
end if aK(aN)then return end if aN:FindFirstChild(aE)then return end local aO=
Instance.new'SelectionBox'aO.Name=aE aO.Adornee=aN aO.Color3=aD aO.SurfaceColor3
=aD aO.SurfaceTransparency=0.8 aO.Parent=aN end local aO,aP=function()if not aG
then return end local aO=game:GetService'Workspace'for aP,aQ in ipairs(aO:
GetChildren())do if aQ:IsA'BasePart'then aN(aQ)end for aR,aS in ipairs(aQ:
GetDescendants())do if aS:IsA'BasePart'then aN(aS)end end end end,function()if
aI then task.cancel(aI)aI=nil end local aO=game:GetService'Workspace'for aP,aQ
in ipairs(aO:GetDescendants())do local aR=aQ:FindFirstChild(aE)if aR then aR:
Destroy()end end end function ac.ToggleSkillHitbox(aQ)if aQ==aH then return end
aH=aQ if aH then if aI then task.cancel(aI)aI=nil end aI=task.spawn(function()
while aH do local aR,aS=pcall(aO)if not aR and os.clock()-(ac.lastSkillWarnH or
0)>5 then ac.lastSkillWarnH=os.clock()warn('[SkillHitbox] error:',tostring(aS))
end task.wait(aj)end end)else aP()end end function ac.IsSkillHitboxEnabled()
return aH end return ac end function a.Q()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak
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
ax or 6 end local aA,aD=function()if az then return az end az={}for aA,aD in
ipairs(am)do az[ay(aD)]=true end return az end,{uncommon=1,common=2,rare=3,epic=
4,legendary=5,secret=6}local aE,aF,aG,aH=function(aE)if not aE then return nil
end local aF=tonumber(tostring(aE.tier or''):match'tier(%d+)')if aF then return
aF end if aE.secret==true then return 6 end return aD[string.lower(tostring(aE.
rarity or''))]end,function()local aE=game:GetService'Players'.LocalPlayer if not
aE then return'?'end if aE.Name and aE.Name~=''then return aE.Name end return aE
.DisplayName or'?'end,function()local aE=game:GetService'Players'.LocalPlayer if
not aE then return nil end local aF=aE:FindFirstChild'XP'if aF and aF:IsA
'IntValue'then return aF.Value end return nil end local function aI(aJ,aK,aM)aM=
aM or 12 if aM<0 then return nil end local aN=aJ:FindFirstChild(aK)if aN then
return aN end for aO,aP in ipairs(aJ:GetChildren())do local aQ=aI(aP,aK,aM-1)if
aQ then return aQ end end return nil end local aJ,aK=function()local aJ=game:
GetService'Players'.LocalPlayer if not aJ or not aJ:FindFirstChild'PlayerGui'
then return'?'end local aK=aJ.PlayerGui:FindFirstChild'playerStatus'if not aK
then return'?'end local aM=aI(aK,'levelBorder')if not aM then return'?'end local
aN=aM:FindFirstChild'level'if aN and aN:IsA'TextLabel'then return aN.Text end
return'?'end,false local aM=function()if aH~=nil or aK then return end aK=true
task.spawn(function()local aM=os.clock()+8 while aH==nil and os.clock()<aM do aH
=aG()if aH~=nil then break end task.wait(0.25)end aK=false end)end local aN,aO=
function()aH=aG()if aH==nil then aM()end ac.SetDungeonStartTime(nil)end,function
()if not ac.GetDungeonStartTime()then ac.SetDungeonStartTime(os.clock())end if
aH==nil then aM()end end local aP,aQ,aR,aS,aT,aU=function()if at then return end
local aP=function(aP)if aP then aN()else aO()end end aP(ac.IsInLobby())at=ac.
OnLobbyChanged(aP)end,function(aP)aP=math.max(0,math.floor(aP or 0))local aQ,aR=
math.floor(aP/60),aP%60 return string.format('%d:%02d',aQ,aR)end,function()if
not(isfile and isfile(af))then return end local aP,aQ=pcall(function()return ae:
JSONDecode(readfile(af))end)if aP and type(aQ)=='table'then ah=type(aQ.url)==
'string'and aQ.url or''ai=aQ.enabled==true ak=aQ.pingEnabled==true al=type(aQ.
pingMention)=='string'and aQ.pingMention or''local aR=aQ.pingTiers if type(aR)==
'string'then aR={aR}end if type(aR)=='table'then local aS={}for aT,aU in ipairs(
aR)do if table.find(ax,aU)and not table.find(aS,aU)then table.insert(aS,aU)end
end if#aS>0 then am=aS end end az=nil end end,function()if not(isfile and
writefile)then return end pcall(function()writefile(af,ae:JSONEncode{url=ah,
enabled=ai,pingEnabled=ak,pingMention=al,pingTiers=am})end)end,function(aP)local
aQ={}for aR,aS in ipairs(aP or{})do local aT,aU=aS.itemName or'Unknown',aw(aS)if
aU then aT='\u{2b50} '..aT end local aV={}if aS.itemType and aS.itemType~='gold'
then table.insert(aV,aS.itemType)end if aS.rarity then table.insert(aV,aS.rarity
)end if#aV>0 then table.insert(aQ,string.format('%s (%s)',tostring(aT),table.
concat(aV,', ')))else table.insert(aQ,tostring(aT))end end return table.concat(
aQ,'\n')end,function(aP)if not aP then return false end local aQ=aE(aP)if not aQ
then return false end return aA()[aQ]==true end local aV=function(aV)if not ak
or al==''then return false end for aW,aX in ipairs(aV or{})do if aU(aX)then
return true end end return false end local aW=function(aW,aX)local aY,aZ=
tonumber(aW.gold)or 0,{}for a_,a0 in ipairs(aW.items or{})do if a0.itemName and
a0.itemName~='gold'then table.insert(aZ,a0)end end local a_,a0,a1,a2,a3=ap,false
,function(a_,a0)if a_==nil then return a0 end if a0==nil then return a_ end
return(ao[a_]or 0)>=(ao[a0]or 0)and a_ or a0 end for a4,a5 in ipairs(aZ)do local
a6=tostring(a5.rarity or''):lower()if aw(a5)then a0=true a2=a1(a2,a6)end if an[
a6]~=nil then a3=a1(a3,a6)end end if a0 then a_=a2 and(an[a2]or ar)or ar elseif
a3 then a_=an[a3]end aX=aX or{}local a4,a5=tostring(aX.level or'?'),tonumber(aX.
expGained)local a6,a7,a8=a5 and string.format('+%s XP',tostring(a5))or'?',aQ(aX.
duration),{}if a5 then table.insert(a8,a6)end if aY>0 then table.insert(a8,
string.format('+%s gold',tostring(aY)))end local a9,b=#a8>0 and table.concat(a8,
'  ')or'',#aZ>0 and aT(aZ)or'None'local ba=b if a9~=''then ba=a9..(b~='None'and(
'\n'..b)or'')end local bb,bc={{name='Player',value=string.format('%s (lv %s)',
aF(),a4),inline=true},{name='Map',value=ac.GetCurrentDungeonName()or'Unknown',
inline=true},{name='Time',value=a7,inline=true},{name='Rewards',value=ba,inline=
false}},'You cleared the dungeon and received your rewards!'if aV(aZ)then bc=bc
..'\n\n'..al end return{embeds={{title='Dungeon WIN',description=bc,color=a_,
fields=bb,timestamp=DateTime.now():ToIsoDate()}}}end local aX=function(aX,aY)if
ah==''or string.find(ah,'^https://discord%.com/api/webhooks/')==nil then return
false,'Invalid webhook URL'end local aZ=aW(aX,aY)local a_,a0=pcall(function()
return ae:JSONEncode(aZ)end)if not a_ then return false,
'Could not encode payload'end local a1,a2=pcall(function()return request{Url=ah,
Method='POST',Headers={['Content-Type']='application/json',['User-Agent']=
'ScriptHub-DungeonQuest (https://www.roblox.com)'},Body=a0}end)if not a1 then
return false,'Request error: '..tostring(a2)end if a2 and a2.Success then return
true end local a3=a2 and a2.StatusCode or'?'return false,'HTTP '..tostring(a3)
end function ag.SetUrl(aY)ah=aY or''aS()end function ag.GetUrl()return ah end
function ag.SetEnabled(aY)ai=aY==true aS()end function ag.IsEnabled()return ai
end function ag.SetPingEnabled(aY)ak=aY==true aS()end function ag.IsPingEnabled(
)return ak end function ag.SetPingMention(aY)al=aY or''aS()end function ag.
GetPingMention()return al end function ag.SetPingTiers(aY)if type(aY)~='table'
then return end local aZ,a_={},{}local a0=function(a0)if not a_[a0]and table.
find(ax,a0)then a_[a0]=true table.insert(aZ,a0)end end for a1,a2 in pairs(aY)do
if type(a1)=='string'and a2==true then a0(a1)elseif type(a2)=='string'then a0(a2
)end end if#aZ==0 then return end am=aZ az=nil aS()end function ag.GetPingTiers(
)return am end function ag.GetPingTierOptions()return ax end function ag.Send()
if not ai then ab.Notify('Webhook','Notifications is disabled',3)return end
local aY,aZ=aX({items={{itemName='Test Reward',rarity='common',itemType='item'}}
,gold=0},{level=aJ(),expGained=0,duration=0})if aY then ab.Notify('Webhook',
'Test sent successfully',3)else ab.Notify('Webhook','Send failed: '..tostring(aZ
),4)end end function ag.Init()if aj then return end local aY local aZ=pcall(
function()aY=game:GetService'ReplicatedStorage':WaitForChild('remotes',30)end)if
not aZ or not aY then warn'[Webhook] Could not find ReplicatedStorage.remotes'
return end local a_=aY:FindFirstChild'cloneRewardGui'if not a_ then warn
'[Webhook] Could not find remote cloneRewardGui'return end as=a_.OnClientEvent:
Connect(function(a0)if not ai then return end aM()local a1=ac.
GetDungeonStartTime()and ac.GetDungeonElapsed()or 0 task.spawn(function()task.
wait(1.5)local a2,a3=(aG())if aH~=nil and a2~=nil then a3=math.max(0,a2-aH)end
local a4,a5=aX(a0,{level=aJ(),expGained=a3,duration=a1})if not a4 then ab.
Notify('Webhook WIN','Send failed: '..tostring(a5),4)end end)end)aj=true ab.
Notify('Webhook','Webhook notifications ready',2)aP()end aR()ad.Register(
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
,ab,ac,ad,ae,af=a.load'a',a.load'b',a.load'V',game:GetService'Players',game:
GetService'HttpService','EclipseHub'local ag=function()return(aa and aa.Folder)
or'EsclipseHub'end local ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at=function()return
ag()..'/settings/streaming_mode.json'end,{},false,false,af,false,false,{},{},
function()return ad.LocalPlayer end,function()if not(isfolder and makefolder)
then return end pcall(function()local ah=ag()if not isfolder(ah)then makefolder(
ah)end local ai=ah..'/settings'if not isfolder(ai)then makefolder(ai)end end)end
local au,av,aw,ax=function()local au=ah()if not(isfile and isfile(au))then
return end local av,aw=pcall(function()return ae:JSONDecode(readfile(au))end)if
av and type(aw)=='table'then if aw.enabled~=nil then aj=aw.enabled==true end if
type(aw.replacement)=='string'and#aw.replacement>0 then al=aw.replacement end
end end,function()if not(writefile and isfile)then return end ar()pcall(function
()writefile(ah(),ae:JSONEncode{enabled=aj,replacement=al})end)end,function()
local au,av={},aq()if not av then return au end local aw,ax,ay=av.Name,av.
DisplayName,string.lower(al)if aw and#aw>=2 and string.lower(aw)~=ay then table.
insert(au,aw)end if ax and#ax>=2 and string.lower(ax)~=ay and string.lower(ax)~=
string.lower(aw)then table.insert(au,ax)end table.sort(au,function(az,aA)return#
az>#aA end)return au end,function(au,av,aw)if#au==0 or#av==0 then return au end
local ax,ay,az=string.lower(au),{},1 while az<=#au do local aA,aD,aE for aF,aG
in ipairs(av)do local aH,aI=string.find(ax,string.lower(aG),az,true)if aH then
if aA==nil or aH<aA or(aH==aA and#aG>#aE)then aA=aH aD=aI aE=aG end end end if
not aA then table.insert(ay,string.sub(au,az))break end if aA>az then table.
insert(ay,string.sub(au,az,aA-1))end table.insert(ay,aw)az=aD+1 end return table
.concat(ay)end local ay,az,aA=function(ay,az,aA)if#ay==0 or#az==0 then return ay
end if not string.find(ay,'<')or not string.find(ay,'>')then return ax(ay,az,aA)
end local aD,aE={},1 while aE<=#ay do local aF,aG=string.find(ay,'<[^>]->',aE)if
not aF then local aH=string.sub(ay,aE)table.insert(aD,ax(aH,az,aA))break end if
aF>aE then local aH=string.sub(ay,aE,aF-1)table.insert(aD,ax(aH,az,aA))end table
.insert(aD,string.sub(ay,aF,aG))aE=aG+1 end return table.concat(aD)end,function(
ay)return ay:IsA'TextLabel'or ay:IsA'TextButton'or ay:IsA'TextBox'end,function()
local ay={}pcall(function()if typeof(gethui)=='function'then local az=gethui()if
az and az~=game:GetService'CoreGui'then table.insert(ay,az)end end end)pcall(
function()local az=game:GetService'CoreGui'if az then table.insert(ay,az)end end
)return ay end local aD=function(aD)if not az(aD)then return end if aD:IsA
'TextBox'and aD:IsFocused()then return end local aE=aw()if#aE==0 then return end
local aF=ao[aD]if aF then local aG=aD.Text local aH=ay(aG,aE,al)if aH~=aG then
aF.original=aG am=true aD.Text=aH am=false end return end local aG=aD.Text local
aH,aI=ay(aG,aE,al),{original=aG,conns={}}if aH~=aG then am=true aD.Text=aH am=
false end local aJ=aD:GetPropertyChangedSignal'Text':Connect(function()if am
then return end if not ak then return end local aJ,aK=aD.Text,aw()local aM=ay(aJ
,aK,al)if aM~=aJ then aI.original=aJ am=true aD.Text=aM am=false else aI.
original=aJ end end)table.insert(aI.conns,aJ)if aD:IsA'TextBox'then local aK=aD.
FocusLost:Connect(function()if not ak then return end local aK,aM=aD.Text,aw()
local aN=ay(aK,aM,al)if aN~=aK then aI.original=aK am=true aD.Text=aN am=false
end end)table.insert(aI.conns,aK)end local aK aK=aD.AncestryChanged:Connect(
function(aM,aN)if not aN then for aO,aP in ipairs(aI.conns)do pcall(function()aP
:Disconnect()end)end ao[aD]=nil end end)table.insert(aI.conns,aK)ao[aD]=aI end
local aE,aF,aG,aH=function(aE)if not aE then return end pcall(function()for aF,
aG in ipairs(aE:GetDescendants())do if az(aG)then aD(aG)end end end)end,function
(aE)if not aE then return end local aF,aG=pcall(function()return aE.
DescendantAdded:Connect(function(aF)if not ak then return end task.spawn(aD,aF)
end)end)if aF and aG then table.insert(ap,aG)end end,function()local aE=aw()for
aF,aG in pairs(ao)do for aH,aI in ipairs(aG.conns)do pcall(function()aI:
Disconnect()end)end pcall(function()if aF and aF.Parent and aG.original then
local aH,aI=aF.Text,ay(aG.original,aE,al)if aH==aI then am=true aF.Text=aG.
original am=false end end end)end table.clear(ao)end,function()if as and typeof(
as.SetUserInfoState)=='function'then pcall(function()as:SetUserInfoState(not aj)
end)end end function ai.Start()aj=true av()if ak then return end ak=true local
aI=aq()if aI then local aJ=aI:FindFirstChild'PlayerGui'if aJ then aE(aJ)aF(aJ)
else local aK aK=aI.ChildAdded:Connect(function(aM)if aM.Name=='PlayerGui'then
if aK then aK:Disconnect()end if ak then aE(aM)aF(aM)end end end)table.insert(ap
,aK)end if aI.Character then aE(aI.Character)aF(aI.Character)end local aK=aI.
CharacterAdded:Connect(function(aK)if not ak then return end task.wait(0.2)if
not ak then return end aE(aK)aF(aK)end)table.insert(ap,aK)end pcall(function()
local aJ=workspace.DescendantAdded:Connect(function(aJ)if not ak then return end
if aJ:IsA'BillboardGui'or aJ:IsA'SurfaceGui'then for aK,aM in ipairs(aJ:
GetDescendants())do aD(aM)end local aK=aJ.DescendantAdded:Connect(function(aK)if
not ak then return end aD(aK)end)table.insert(ap,aK)end end)table.insert(ap,aJ)
end)for aJ,aK in ipairs(aA())do aE(aK)aF(aK)end aH()task.spawn(function()for aJ,
aK in ipairs{0.3,0.8,1.5,3}do task.wait(aK)if not ak then break end local aM=aq(
)if aM then local aN=aM:FindFirstChild'PlayerGui'if aN then aE(aN)end if aM.
Character then aE(aM.Character)end end for aN,aO in ipairs(aA())do aE(aO)end end
end)if at then pcall(task.cancel,at)end at=task.spawn(function()while ak do task
.wait(0.5)if not ak then break end local aJ=aq()if aJ then local aK=aJ:
FindFirstChild'PlayerGui'if aK then aE(aK)end if aJ.Character then aE(aJ.
Character)end end for aK,aM in ipairs(aA())do aE(aM)end end end)end function ai.
Stop()aj=false av()if not ak then return end ak=false if at then pcall(task.
cancel,at)at=nil end for aI,aJ in ipairs(ap)do pcall(function()aJ:Disconnect()
end)end table.clear(ap)aG()aH()end function ai.IsEnabled()return aj end function
ai.IsRunning()return ak end function ai.SetReplacement(aI)if typeof(aI)~=
'string'or#aI==0 then aI=af end if al==aI then return end local aJ=ak if aJ then
ai.Stop()end al=aI av()if aJ then ai.Start()end end function ai.GetReplacement()
return al end function ai.SetWindow(aI)as=aI if ak or aj then aH()end end
function ai.Init()if an then return end an=true if aj and not ak then ai.Start()
end end au()ab.Register(function()if ak then ai.Stop()end an=false end)return(ac
.Wrap(ai,{Enabled=function(aI)if aI then ai.Start()else ai.Stop()end end,
Replacement=function(aI)ai.SetReplacement(aI)end}))end function a.Y()local aa,ab
,ac,ad=a.load'd',a.load'A',a.load'W',a.load'X'return function(ae,af)local ag=af:
Section{Side='Left'}ag:Header{Name='Anti AFK'}ag:Toggle({Name='Anti AFK',Default
=ac.IsEnabled(),Callback=aa.Wrap(function(ah)if ah then ac.Start()else ac.Stop()
end end)},'Toggle_AntiAFK')ab.PatchSliderLoadCallback(ag:Slider({Name=
'Interval (gi\u{e2}y)',Default=ac.GetInterval(),Minimum=5,Maximum=300,
DisplayMethod='Round',Precision=0,Callback=aa.Wrap(function(ah)ac.SetInterval(ah
)end)},'Slider_AntiAFKInterval'))local ah=af:Section{Side='Right'}ah:Header{Name
='Streaming Mode'}ah:Toggle({Name='Streaming Mode (\u{1ea8}n danh t\u{ed}nh)',
Default=ad.IsEnabled(),Callback=aa.Wrap(function(ai)if ai then ad.Start()else ad
.Stop()end end)},'Toggle_StreamingMode')ah:Input({Name=
'T\u{ea}n hi\u{1ec3}n th\u{1ecb} thay th\u{1ebf}',Placeholder='EclipseHub',
AcceptedCharacters='All',Default=ad.GetReplacement(),Callback=aa.Wrap(function(
ai)ad.SetReplacement(ai)end)},'Input_StreamingReplacement')end end function a.Z(
)return function(aa,ab)a.load'S'(aa,ab)a.load'U'(aa,ab)a.load'Y'(aa,ab)end end
function a._()local aa,ab,ac=a.load'a',a.load'c',game:GetService'HttpService'
local ad,ae,af,ag=aa.Folder..'/settings/autohide.json',{},false local ah,ai=
function()if not(isfile and isfile(ad))then return end local ah,ai=pcall(
function()return ac:JSONDecode(readfile(ad))end)if ah and type(ai)=='table'then
af=ai.enabled==true end end,function()if not(isfile and writefile)then return
end pcall(function()writefile(ad,ac:JSONEncode{enabled=af})end)end function ae.
SetWindow(aj)ag=aj end function ae.SetEnabled(aj)af=aj==true ai()end function ae
.IsEnabled()return af end function ae.Hide()if not af or not ag then return end
local aj=pcall(function()ag:SetState(false)end)if not aj then warn
'[AutoHide] Kh\u{f4}ng \u{1ea9}n \u{111}\u{1b0}\u{1ee3}c window'end end function
ae.Execute()if not af then return end task.spawn(function()task.wait(0.5)ae.
Hide()end)end ah()return ae end function a.aa()local aa,ab,ac=a.load'a',a.load
'd',a.load'_'return function(ad,ae)local af=aa.Folder local ag=af..
'/settings/autoload.txt'local ah,ai,aj=function()if isfile and isfile(ag)then
return readfile(ag)end return nil end,function(ah)ab.SetActive(ah)local ai=a.
load't'ai.LoadData(aa.contextData)end,ae:Section{Side='Left'}aj:Header{Name=
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
GetTimeRetryEnabled()and as<ab.GetTimeRetryThreshold()local aw=av and
'255, 80, 80'or'0, 255, 0'ar:UpdateName(af..": <font color='rgb("..aw..")'>"..au
..'</font>')end aq()as()local at task.spawn(function()while task.wait(0.5)do ak(
aa.IsBossActive())am()ao()aq()at()as()end end)ai:Header{Name='Level Info'}local
au=ai:Label{Text=ae..': Unknown'}local av=function()local av=aa.
GetCurrentDungeonName()if av then au:UpdateName(ae..': '..av)else au:UpdateName(
ae..": <font color='rgb(255, 80, 80)'>Unknown</font>")end end av()aa.
OnDungeonNameChanged(function()av()end)ai:Header{Name='Lobby / Dungeon'}local aw
=ai:Label{Text='Lobby: Unknown'}at=function()local ax=aa.IsInLobby()local ay=ax
and'0, 255, 0'or'255, 80, 80'aw:UpdateName("Lobby: <font color='rgb("..ay..")'>"
..(ax and'Yes'or'No')..'</font>')end at()aa.OnLobbyChanged(function()at()end)ai:
Button{Name='Log Enemy Types to Console',Callback=function()local ax=aa.
GetEnemyNames()print('[DungeonQuest] Enemy types in map ('..#ax..'):')if#ax==0
then print'  (no enemies found)'else for ay,az in ipairs(ax)do print('  - '..az)
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
'_'))end local at,au,av,aw,ax=function(at)return aq()..'/'..as(at)..'.json'end,
function(at)if not at then return nil end return{X=math.round(at.X*100)/100,Y=
math.round(at.Y*100)/100,Z=math.round(at.Z*100)/100}end,function(at)if not at or
type(at)~='table'then return nil end return Vector3.new(at.X or 0,at.Y or 0,at.Z
or 0)end,function(at)return type(at)=='table'and type(at.points)=='table'and#at.
points>0 end,function(at)if type(at)~='table'or type(at.X)~='number'then return
nil end local au=Vector3.new(at.X,0,at.Z)if au.Magnitude<0.001 then return nil
end return au.Unit end local ay,az,aA,aD,aE,aF=function(ay)if type(ay)~='table'
then return nil end local az={}for aA,aD in ipairs(ay.dwells or{})do local aE=
av(aD.pos)if aE then az[#az+1]={pos=aE,dur=tonumber(aD.dur)or 0,facing=ax(aD.
facing)}end end local aA={}for aD,aE in ipairs(ay.skills or{})do local aF=av(aE.
pos)if aF then aA[#aA+1]={pos=aF,facing=ax(aE.facing),key=aE.key,dw=math.floor(
tonumber(aE.dw)or 0),dwT=tonumber(aE.dwT)or 0}end end if#az==0 and#aA==0 then
return nil end return{dwells=az,skills=aA}end,function()if an then return end an
=true if al then ar()local ay=aq()if isfolder'DQMacro'and listfiles then pcall(
function()local az=listfiles'DQMacro'if type(az)=='table'then for aA,aD in
ipairs(az)do if type(aD)=='string'and string.lower(string.sub(aD,-5))=='.json'
and isfile(aD)then local aE=string.match(aD,'([^/\\]+)$')or'unknown.json'local
aF,aG=ay..'/'..aE,readfile(aD)writefile(aF,aG)delfile(aD)end end end end)end if
listfiles and isfolder(ay)then local az,aA=pcall(function()return listfiles(ay)
end)if az and type(aA)=='table'then for aD,aE in ipairs(aA)do if type(aE)==
'string'and string.lower(string.sub(aE,-5))=='.json'then pcall(function()if
isfile(aE)then local aF=readfile(aE)local aG=ad:JSONDecode(aF)if type(aG)==
'table'and type(aG.map)=='string'and type(aG.rooms)=='table'then am[aG.map]=aG
end end end)end end end end local az=ab.contextData if type(az)=='table'and
type(az[ag])=='table'then local aA,aD=az[ag],false for aE,aF in pairs(aA)do if
type(aE)=='string'and type(aF)=='table'then if not am[aE]then am[aE]=aF end
pcall(function()writefile(at(aE),ad:JSONEncode(aF))end)aD=true end end if aD
then az[ag]=nil ac.Save()end end else local ay=ab.contextData if type(ay)==
'table'and type(ay[ag])=='table'then for az,aA in pairs(ay[ag])do if type(az)==
'string'and type(aA)=='table'then am[az]=aA end end end end end,0.1,0.82,0.3,
function(ay,az)local aA,aD=ay.X-az.X,ay.Z-az.Z return math.sqrt(aA*aA+aD*aD)end
function ae.SimplifyPath(aG,aH)local aI=#aG if aI<=2 then return aG end local aJ
={}for aK=1,aI do aJ[aK]=false end aJ[1]=true aJ[aI]=true local aK={1}for aM=2,
aI-1 do local aN,aO,aP=aG[aM-1],aG[aM],aG[aM+1]local aQ,aR=aO.X-aN.X,aO.Z-aN.Z
local aS,aT,aU=math.sqrt(aQ*aQ+aR*aR),aP.X-aO.X,aP.Z-aO.Z local aV=math.sqrt(aT*
aT+aU*aU)if aS>=aE and aV>=aE then local aW=(aQ*aT+aR*aU)/(aS*aV)if aW<aD then
aJ[aM]=true table.insert(aK,aM)end end end table.insert(aK,aI)local aM,aN=aH*aH,
{}for aO=1,#aK-1 do local aP,aQ=aK[aO],aK[aO+1]if aQ-aP>1 then table.insert(aN,{
aP,aQ})end end while#aN>0 do local aO=table.remove(aN)local aP,aQ=aO[1],aO[2]
local aR,aS,aT,aU=aG[aP].X,aG[aP].Z,aG[aQ].X,aG[aQ].Z local aV,aW=aT-aR,aU-aS
local aX,aY,aZ=aV*aV+aW*aW,-1,0 for a_=aP+1,aQ-1 do local a0=0 if aX>0 then a0=(
(aG[a_].X-aR)*aV+(aG[a_].Z-aS)*aW)/aX a0=math.clamp(a0,0,1)end local a1,a2=aG[a_
].X-(aR+aV*a0),aG[a_].Z-(aS+aW*a0)local a3=a1*a1+a2*a2 if a3>aY then aY=a3 aZ=a_
end end if aZ>0 and aY>aM then aJ[aZ]=true table.insert(aN,{aP,aZ})table.insert(
aN,{aZ,aQ})end end local aO={}for aP=1,aI do if aJ[aP]and(#aO==0 or aF(aO[#aO],
aG[aP])>=aA or aP==aI)then table.insert(aO,aG[aP])end end if#aO==1 then table.
insert(aO,aG[aI])end return aO end function ae.OnChanged(aG)if type(aG)~=
'function'then return function()end end table.insert(ao,aG)return function()for
aH,aI in ipairs(ao)do if aI==aG then table.remove(ao,aH)break end end end end
function ae.HasMap(aG)if type(aG)~='string'or#aG==0 then return false end az()
local aH=am[aG]if not aH or type(aH.rooms)~='table'then return false end for aI,
aJ in pairs(aH.rooms)do if aw(aJ)and#aJ.points>0 then return true end end return
false end local aG=function(aG)if not aG or type(aG)~='table'or type(aG.points)
~='table'then return nil end local aH={}for aI,aJ in ipairs(aG.points)do local
aK=av(aJ)if aK then aH[#aH+1]=aK end end if#aH==0 then return nil end return{
startPos=av(aG.startPos)or aH[1],points=aH,events=aG.events and ay(aG.events)or
nil,speed=tonumber(aG.speed)or 0}end function ae.GetRoomSegment(aH,aI)if type(aH
)~='string'or type(aI)~='number'then return nil end az()local aJ=am[aH]if not aJ
or type(aJ.rooms)~='table'then return nil end local aK=aJ.rooms[tostring(aI)]if
not aw(aK)then return nil end local aM={}for aN,aO in ipairs(aK.points)do local
aP=av(aO)if aP then aM[#aM+1]=aP end end if#aM==0 then return nil end local aN,
aO={startPos=av(aK.startPos)or aM[1],points=aM,events=aK.events and ay(aK.events
)or nil,speed=tonumber(aK.speed)or 0,boss=aK.boss==true},{}if type(aK.phases)==
'table'and#aK.phases>0 then for aP,aQ in ipairs(aK.phases)do local aR=aG(aQ)if
aR then aR.boss=aK.boss==true aO[#aO+1]=aR end end end if#aO==0 then aO[1]=aN
end aN.phases=aO return aN end function ae.HasSegmentOrMacro(aH,aI)return ae.
GetRoomSegment(aH,aI)~=nil end function ae.GetMap(aH)if not ae.HasMap(aH)then
return nil end az()local aI=am[aH]if not aI then return nil end local aJ={}for
aK,aM in pairs(aI.rooms or{})do local aN=tonumber(aK)if aN and aw(aM)then local
aO=ae.GetRoomSegment(aH,aN)if aO then aJ[aN]=aO end end end return{map=aH,
version=aI.version,rooms=aJ,created=aI.created,updated=aI.updated,mode=ak(aI.
mode)}end function ae.GetMaps()az()local aH={}for aI,aJ in pairs(am)do if type(
aI)=='string'and type(aJ)=='table'and aJ.map==aI and type(aJ.rooms)=='table'then
local aK,aM,aN,aO=0,0,0,0 for aP,aQ in pairs(aJ.rooms)do if tonumber(aP)~=nil
and aw(aQ)then aK+=1 if aQ.boss==true then aM+=1 end aN+=#aQ.points if type(aQ.
phases)=='table'and#aQ.phases>0 then aO+=#aQ.phases for aR,aS in ipairs(aQ.
phases)do if aS~=aQ and type(aS.points)=='table'then aN+=#aS.points end end else
aO+=1 end end end if aK>0 then table.insert(aH,{map=aI,roomCount=aK,bossCount=aM
,pointCount=aN,phaseCount=aO,updated=aJ.updated,mode=ak(aJ.mode)})end end end
table.sort(aH,function(aI,aJ)return aI.map<aJ.map end)return aH end function ae.
Count()return#ae.GetMaps()end function ae.SaveSegment(aH,aI,aJ,aK,aM,aN,aO,aP)if
type(aH)~='string'or#aH==0 then return false end if type(aI)~='number'or aI<=0
then return false end if not aJ or not aK or#aK==0 then return false end az()
local aQ=am[aH]if not aQ or type(aQ)~='table'then aQ={map=aH,version=ah,created=
os.time(),updated=os.time(),mode=ai,rooms={}}am[aH]=aQ end if type(aQ.rooms)~=
'table'then aQ.rooms={}end local aR={}for aS,aT in ipairs(aK)do aR[#aR+1]=au(aT)
end local aS={startPos=au(aJ)or aR[1],points=aR}if aO then aS.boss=true end if
type(aN)=='number'and aN>0 then aS.speed=aN end local aT=function(aT)if not aT
or type(aT)~='table'then return nil end local aU,aV=#(aT.dwells or{}),#(aT.
skills or{})if aU==0 and aV==0 then return nil end local aW={dwells={},skills={}
}for aX,aY in ipairs(aT.dwells or{})do aW.dwells[#aW.dwells+1]={pos=au(aY.pos),
dur=aY.dur or 0,facing=aY.facing}end for aX,aY in ipairs(aT.skills or{})do aW.
skills[#aW.skills+1]={pos=au(aY.pos),facing=aY.facing,key=aY.key,dw=aY.dw or 0,
dwT=aY.dwT or 0}end return aW end if aM and type(aM)=='table'then local aU=aT(aM
)if aU then aS.events=aU end end if type(aP)=='table'and#aP>0 then local aU={}
for aV,aW in ipairs(aP)do if aW and aW.points and#aW.points>0 then local aX={}
for aY,aZ in ipairs(aW.points)do aX[#aX+1]=au(aZ)end local aY={startPos=au(aW.
startPos)or aX[1],points=aX,speed=type(aW.speed)=='number'and aW.speed>0 and aW.
speed or nil,events=aT(aW.events)}aU[#aU+1]=aY end end if#aU>0 then aS.phases=aU
end end aQ.rooms[tostring(aI)]=aS aQ.version=ah aQ.map=aH aQ.updated=os.time()if
al then ar()pcall(function()writefile(at(aH),ad:JSONEncode(aQ))end)else local aU
=ab.contextData if type(aU)=='table'then if not aU[ag]then aU[ag]={}end aU[ag][
aH]=aQ ac.Save()end end ap()return true end function ae.GetMapMode(aH)if type(aH
)~='string'or#aH==0 then return ai end az()local aI=am[aH]if type(aI)~='table'
then return ai end return ak(aI.mode)end function ae.SetMapMode(aH,aI)if type(aH
)~='string'or#aH==0 then return false end local aJ=ak(aI)az()local aK=am[aH]if
not aK or type(aK)~='table'then aK={map=aH,version=ah,created=os.time(),updated=
os.time(),mode=ai,rooms={}}am[aH]=aK end aK.mode=aJ aK.map=aH aK.updated=os.
time()if al then ar()pcall(function()writefile(at(aH),ad:JSONEncode(aK))end)else
local aM=ab.contextData if type(aM)=='table'then if not aM[ag]then aM[ag]={}end
aM[ag][aH]=aK ac.Save()end end ap()return true end function ae.RemoveMap(aH)az()
if not am[aH]then return false end am[aH]=nil if al then local aI=at(aH)pcall(
function()if isfile(aI)then delfile(aI)end end)else local aI=ab.contextData if
type(aI)=='table'and aI[ag]then aI[ag][aH]=nil ac.Save()end end ap()return true
end function ae.ClearAll()az()if next(am)==nil then return end local aH=aq()if
al and isfolder(aH)and listfiles then pcall(function()local aI=listfiles(aH)if
type(aI)=='table'then for aJ,aK in ipairs(aI)do if type(aK)=='string'and string.
lower(string.sub(aK,-5))=='.json'and isfile(aK)then delfile(aK)end end end end)
end table.clear(am)local aI=ab.contextData if type(aI)=='table'and aI[ag]then aI
[ag]=nil ac.Save()end ap()end function ae.ReloadFromDisk()table.clear(am)an=
false az()ap()end function ae.ReloadFromConfig()ae.ReloadFromDisk()end return ae
end function a.ae()local aa,ab,ac,ad=a.load'e',a.load'f',a.load'ad',a.load'c'
local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq=aa.RunService,aa.player,aa.
UserInputService,0.1,8000,0.4,0.1,1.5,1,6,{},true,true function ao.SetCapture(ar
)ar=ar and true or false ap=ar aq=ar end function ao.IsCaptureEnabled()return ap
or aq end local ar,as,at,au,av,aw,ax,ay,az,aA,aD,aE,aF,aG,aH,aI,aJ,aK,aM,aN,aO,
aP,aQ,aR,aS,aT,aU,aV,aW,aX,aY,aZ=false,0,{},0,{},{},0,false,0,0,false,false,
false,{},0,0,0,{}local a_,a0=function()local a_={recording=ar,map=aM,room=as,
pointCount=#at,phaseCount=#aG+1,dwellCount=#av,skillCount=#aw,savedRooms=aH}for
a0,a1 in ipairs(aK)do pcall(a1,a_)end end,function()local a_=af and af.Character
local a0=a_ and a_:FindFirstChild'HumanoidRootPart'if a0 and a0.Parent then
return a0 end return nil end local a1,a2,a3,a4=function()local a1=a0()if not a1
then return nil end local a2=a1.CFrame.LookVector if a2.Magnitude<0.001 then
return nil end return{X=a2.X/a2.Magnitude,Z=a2.Z/a2.Magnitude}end,function()if
aO then aO:Disconnect()aO=nil end if aP then aP:Disconnect()aP=nil end if aQ
then aQ()aQ=nil end if aR then aR()aR=nil end if aS then aS()aS=nil end if aT
then aT()aT=nil end end,function(a1)at={a1}av={}aw={}aU=nil ax=0 aV=nil aW=nil
aX=nil aY=a1 az=0 aA=0 au=os.clock()aZ=os.clock()ay=false end,function()aM=nil
as=0 aN=nil at={}av={}aw={}aU=nil ax=0 aV=nil aW=nil aX=nil aY=nil ay=false az=0
aA=0 aZ=nil aE=false aF=false aD=false aH=0 aI=0 aJ=0 end local a5,a6,a7=
function(a5,a6)as=a5 aN=a6 aF=true a3(a6)aE=ab.IsBossActive()aG={}end,function(
a5)if not aF then return false end local a6=ac.SimplifyPath(at,aj)if#a6>=2 then
local a7 if#av>0 or#aw>0 then a7={dwells=av,skills=aw}end local a8=0 if aA>0.5
and az>5 then a8=math.clamp(az/aA,5,100)end table.insert(aG,{startPos=aN,points=
a6,events=a7,speed=a8})aJ+=#at end aN=a5 a3(a5)a_()return true end,function(a5,
a6)if not aF then return nil end local a7=ac.SimplifyPath(at,aj)if#a7>=2 then
local a8 if#av>0 or#aw>0 then a8={dwells=av,skills=aw}end local a9=0 if aA>0.5
and az>5 then a9=math.clamp(az/aA,5,100)end table.insert(aG,{startPos=aN,points=
a7,events=a8,speed=a9})aJ+=#at end if#aG==0 then return nil end local a8=aG[1]
local a9=ac.SaveSegment(aM,as,a8.startPos,a8.points,a8.events,a8.speed,aE,aG)if
not a9 then return nil end aH+=1 if aE then aI+=1 end if not a6 then local b=''
if#aG>1 then b=(
' (%d phases/m\u{1ea1}ng h\u{1ed3}i sinh, %d \u{111}i\u{1ec3}m phase 1)'):
format(#aG,#a8.points)elseif a8.events then b=(
' (%d \u{111}i\u{1ec3}m m\u{1ecb}n, %d skill, %d nh\u{1ecb}p d\u{1eeb}ng, %.1fspd)'
):format(#a8.points,#(a8.events.skills or{}),#(a8.events.dwells or{}),a8.speed
or 0)else b=(' (%d \u{111}i\u{1ec3}m m\u{1ecb}n, %.1fspd)'):format(#a8.points,a8
.speed or 0)end ad.Notify('Path Record',(
'\u{110}\u{e3} l\u{1b0}u room %d%s v\u{e0}o map [%s] %s'):format(as,b,aM,a5 and(
'- '..a5)or''),3)end return{phaseCount=#aG,phase1=a8}end function ao.IsRecording
()return ar end function ao.GetStartRoom()return as end function ao.
GetCurrentPhaseIndex()return#aG+1 end function ao.GetCurrentPoints()return at
end function ao.GetRoomPhases()return aG end function ao.GetCurrentDwells()
return av end function ao.GetCurrentSkills()return aw end function ao.GetStatus(
)return{recording=ar,map=aM,room=as,pointCount=#at,dwellCount=#av,skillCount=#aw
,phaseCount=#aG+1,savedRooms=aH}end function ao.OnStatusChanged(a8)if type(a8)~=
'function'then return function()end end table.insert(aK,a8)return function()for
a9,b in ipairs(aK)do if b==a8 then table.remove(aK,a9)break end end end end
function ao.Start()if ar then return false,'\u{111}ang record r\u{1ed3}i'end
local a8=a0()if not a8 then return false,
'ch\u{1b0}a c\u{f3} nh\u{e2}n v\u{1ead}t'end if ab.IsDead()then return false,
'nh\u{e2}n v\u{1ead}t \u{111}ang ch\u{1ebf}t'end local a9=ab.
GetCurrentRoomIndex()if a9<=0 then return false,
'kh\u{f4}ng n\u{1eb1}m trong dungeon'end local b=ab.GetCurrentDungeonName()if
not b or#b==0 then return false,
'kh\u{f4}ng x\u{e1}c \u{111}\u{1ecb}nh \u{111}\u{1b0}\u{1ee3}c map'end aD=ac.
GetMapMode(b)=='full'if ab.IsBossActive()and not aD then return false,
'boss room (d\u{f9}ng Hazard Scanner)'end aM=b a5(a9,a8.Position)ar=true aH=0 aI
=0 aJ=0 aO=ae.Heartbeat:Connect(function()if not ar then return end if ab.
IsDead()then aV=nil aU=nil aY=nil return end local ba=a0()if not ba then return
end local bb,bc=ba.Position,at[#at]if bc and(bb-bc).Magnitude>35 then if not aD
then ao.Stop'd\u{1ecb}ch chuy\u{1ec3}n l\u{1edb}n'return end a7(
'd\u{1ecb}ch chuy\u{1ec3}n l\u{1edb}n',true)local bd=ab.GetCurrentRoomIndex()if
bd==as then bd=0 end a5(bd,bb)a_()task.spawn(function()task.wait(an)if ar and as
<=0 then ao.Stop'h\u{1ebf}t map'end end)return end local bd,be=os.clock(),aY and
(bb-aY).Magnitude or 0 aY=bb local bf=aZ and math.max(0.0001,bd-aZ)or 0.016 aZ=
bd local bg=bf>0 and(be/bf)or 0 if bg>=al then az+=be aA+=bf aV=nil aU=nil else
if ap then if not aV then aV=bd aW=bb aX=a1()end if aU then aU.dur=bd-aV aU.
facing=a1()or aX elseif bd-aV>=ak then ax=aV-au aU={pos=aW,dur=bd-aV,facing=aX,
index=#av+1}table.insert(av,aU)for bh,bi in ipairs(aw)do if bi.dw==0 and bi.
_castAt and bi._castAt>=aV then bi.dw=aU.index bi.dwT=math.max(0,(bi._castAt-au)
-ax)bi.pos=aU.pos aU.facing=bi.facing or aU.facing end end end end end local bh=
at[#at]if bh and(bb-bh).Magnitude<ah then return end if#at>=ai then ao.Stop
'\u{111}\u{1ea1}t gi\u{1edb}i h\u{1ea1}n \u{111}i\u{1ec3}m'return end table.
insert(at,bb)end)if aq then aP=ag.InputBegan:Connect(function(ba,bb)if not ar or
not aq then return end if ag:GetFocusedTextBox()then return end if ab.IsDead()
then return end local bc if ba.UserInputType==Enum.UserInputType.MouseButton2
then if bb then return end bc='QE'elseif ba.UserInputType==Enum.UserInputType.
Keyboard and(ba.KeyCode==Enum.KeyCode.Q or ba.KeyCode==Enum.KeyCode.E)then bc=ba
.KeyCode==Enum.KeyCode.Q and'Q'or'E'else return end local bd=a0()if not bd then
return end local be=ap and(aU~=nil)local bf={pos=be and aU.pos or bd.Position,
facing=a1(),key=bc,dw=0,dwT=0,_castAt=os.clock()}if be then bf.dw=aU.index bf.
dwT=math.max(0,(os.clock()-au)-ax)aU.facing=bf.facing or aU.facing end table.
insert(aw,bf)end)end aQ=ab.OnRoomIndexChanged(function()if ar then local ba=ab.
GetCurrentRoomIndex()if aF and as<=0 and ba>0 then as=ba return end if ba~=as
and not ay then ay=true task.delay(am,function()ay=false if ar then if aD then
ao.Rollover()else ao.Stop'ho\u{e0}n th\u{e0}nh room'end end end)end end end)aS=
ab.OnBossActiveChanged(function(ba)if not ar then return end if ba then if aD
then aE=true else ao.Stop'v\u{e0}o boss room'end return end if aD and aE then
a7('xong boss',true)aE=false aF=false task.spawn(function()task.wait(an)if ar
and not aF then ao.Stop'h\u{1ebf}t map'end end)end end)aR=ab.OnLobbyChanged(
function(ba)if ar and ba then ao.Stop'v\u{1ec1} lobby'end end)aT=ab.OnRespawn(
function()if not ar then return end task.delay(0.2,function()if not ar or ab.
IsDead()then return end local ba=a0()if not ba then return end if a6(ba.Position
)then local bb=#aG+1 ad.Notify('Path Record',(
'H\u{1ed3}i sinh: \u{110}\u{e3} l\u{1b0}u Phase %d, \u{111}ang ghi ti\u{1ebf}p Phase %d cho room %d'
):format(bb-1,bb,as),3)end end)end)ad.Notify('Path Record',(
'B\u{1eaf}t \u{111}\u{1ea7}u record room %d (%s)'):format(a9,b),2)a_()return
true end function ao.Rollover()if not ar then return false end a7(
'chuy\u{1ec3}n room',true)local a8=a0()local a9=a8 and a8.Position or aN a5(ab.
GetCurrentRoomIndex(),a9)a_()return true end function ao.Stop(a8)if not ar then
return false end ar=false a2()local a9=a7(a8,true)if a9 then if aH>1 then local
b=aI>0 and(' | %d boss'):format(aI)or''ad.Notify('Path Record',(
'\u{110}\u{e3} l\u{1b0}u map [%s] %s: %d room%s (%d \u{111}i\u{1ec3}m g\u{1ed1}c)'
):format(aM,a8 or'xong',aH,b,aJ),4)else local b,ba='',a9.phase1 if ba and ba.
events then b=(' (%d skill, %d nh\u{1ecb}p d\u{1eeb}ng, %.1fspd)'):format(#(ba.
events.skills or{}),#(ba.events.dwells or{}),ba.speed or 0)elseif ba then b=(
' (%.1fspd)'):format(ba.speed or 0)end local bb=as>0 and(aE and' (boss)'or'')or
''ad.Notify('Path Record',(
'\u{110}\u{e3} l\u{1b0}u room %d%s%s v\u{e0}o map [%s] %s'):format(as,b,bb,aM,a8
and('- '..a8)or''),3)end elseif aH>0 then local b=aI>0 and(' | %d boss'):format(
aI)or''ad.Notify('Path Record',(
'\u{110}\u{e3} l\u{1b0}u map [%s] %s: %d room%s (%d \u{111}i\u{1ec3}m g\u{1ed1}c)'
):format(aM,a8 or'xong',aH,b,aJ),4)end a4()a_()return a9~=nil end function ao.
Cancel()if not ar then return end a2()a4()ar=false a_()end return ao end
function a.af()local aa,ab,ac,ad=a.load'e',a.load'f',a.load'ad',a.load'c'local
ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax,ay,az,aA,aD,aE,aF,aG
=aa.player,aa.VirtualInputManager,aa.UserInputService,aa.RunService or game:
GetService'RunService',0.4,0.5,8,2,4.5,8,14,8,2,0.5,2,0.001,0.1,{},true,true,
true,0.6,0.005,0.45,0.2,false,true function av.SetAimSkillQ(aH)aF=aH and true or
false end function av.IsAimSkillQEnabled()return aF end function av.SetAimSkillE
(aH)aG=aH and true or false end function av.IsAimSkillEEnabled()return aG end
local aH=function(aH)if aH=='Q'then return aF elseif aH=='E'then return aG end
return aF or aG end function av.SetStartPauseTime(aI)if type(aI)=='number'then
aE=math.clamp(aI,0,5)end end function av.GetStartPauseTime()return aE end
function av.SetPreAimTime(aI)if type(aI)=='number'then aD=math.clamp(aI,0.1,1.5)
end end function av.GetPreAimTime()return aD end function av.SetSkillFaceHold(aI
)if type(aI)=='number'then az=math.clamp(aI,ar,as)end end function av.
GetSkillFaceHold()return az end function av.SetDoubleClickDelay(aI)if type(aI)==
'number'then aA=math.clamp(aI,at,au)end end function av.GetDoubleClickDelay()
return aA end function av.SetReplayTimeline(aI)aI=aI and true or false aw=aI ax=
aI ay=aI end function av.IsReplayTimelineEnabled()return aw end local aI,aJ,aK,
aM=true,false function av.SetSpeedMatch(aN)aI=aN and true or false end function
av.IsSpeedMatchEnabled()return aI end function av.SetUseFastSpeed(aN)aJ=aN and
true or false end function av.IsUseFastSpeedEnabled()return aJ end local aN,aO,
aP,aQ,aR,aS,aT,aU,aV,aW,aX,aY=function(aN)local aO if aJ then local aP=ab.
GetFastSpeed()if type(aP)=='number'and aP>0 then aO=aP end elseif aI then if
type(aN)=='number'and aN>0 then aO=aN end end if not aO or aO<=0 then return end
local aP=ab.GetHumanoid()if not aP then return end if aK==nil then aM=aP.
WalkSpeed end aK=aO if aP.WalkSpeed~=aO then aP.WalkSpeed=aO end end,function()
if aK==nil then return end local aN=ab.GetHumanoid()if aM and aN and aN.
WalkSpeed~=aM then aN.WalkSpeed=aM end aK=nil aM=nil end,false,false,false,1,0,0
,0,{}local aZ=function(aZ)local a_={playing=aP,map=aX,room=ab.
GetCurrentRoomIndex(),boss=ab.IsBossActive(),phase=aS,resume=aQ,progressPercent=
aV,progressStuds=aT,totalStuds=aU,reason=aZ}for a0,a1 in ipairs(aW)do pcall(a1,
a_)end end function av.GetCurrentPhaseIndex()return aS end local a_,a0,a1,a2=
function()local a_=ae and ae.Character local a0=a_ and a_:FindFirstChild
'HumanoidRootPart'if a0 and a0.Parent then return a0 end return nil end,function
(a_)if not a_ or not a_.Parent then return nil end local a0,a1=pcall(function()
return a_.Position end)if not a0 or not a1 then return nil end return a1 end,
function(a_,a0)local a1,a2=a_.X-a0.X,a_.Z-a0.Z return math.sqrt(a1*a1+a2*a2)end
local a3=function()if a2 then return a2 end pcall(function()local a3=ae:
FindFirstChild'PlayerScripts'local a4=a3 and a3:FindFirstChild'PlayerModule'if
a4 then a2=require(a4):GetControls()end end)return a2 end local a4,a5,a6,a7=
function()local a4=a3()if a4 and type(a4.Disable)=='function'then pcall(function
()a4:Disable()end)end end,function()local a4=a3()if a4 and type(a4.Enable)==
'function'then pcall(function()a4:Enable()end)end end,(Vector3.zero)local a8,a9,
b,ba=function()if a7 then return end local a8=ah.PreSimulation or ah.Heartbeat
or ah.RenderStepped a7=a8:Connect(function()if not aP then return end local a9=
ab.GetHumanoid()if a9 then a9:Move(a6,false)end end)end,function()if a7 then a7:
Disconnect()a7=nil end a6=Vector3.zero local a8=ab.GetHumanoid()if a8 then
pcall(function()a8:Move(Vector3.zero,false)end)end end,function(a8)local a9=a_()
if not a9 or not a8 then a6=Vector3.zero return end local b=a9.Position local ba
=Vector3.new(a8.X-b.X,0,a8.Z-b.Z)if ba.Magnitude>0.05 then a6=ba.Unit else a6=
Vector3.zero end end,function()a6=Vector3.zero local a8=ab.GetHumanoid()if a8
then pcall(function()a8:Move(Vector3.zero,false)end)end end local bb,bc,bd,be,bf
=function(bb)ba()a9()a5()end,function(bb)local bc,bd=ab.GetKeyHoldTime()or 0.05,
aA task.spawn(function()pcall(function()local be=function(be,bf)af:SendKeyEvent(
bf,be,false,game)end local bf=function(bf)if bf=='Q'then be(Enum.KeyCode.Q,true)
task.wait(bc)be(Enum.KeyCode.Q,false)elseif bf=='E'then be(Enum.KeyCode.E,true)
task.wait(bc)be(Enum.KeyCode.E,false)else be(Enum.KeyCode.Q,true)be(Enum.KeyCode
.E,true)task.wait(bc)be(Enum.KeyCode.Q,false)be(Enum.KeyCode.E,false)end end bf(
bb)if bd>0 then task.wait(bd)end bf(bb)end)end)end,function(bb,bc)if not bb or
not bb.Parent then return end local bd=ab.GetHumanoid()if bd then bd.AutoRotate=
false end local be=bc or Vector3.new(1,0,0)if be.Magnitude<0.1 then be=Vector3.
new(1,0,0)end be=Vector3.new(be.X,0,be.Z).Unit pcall(function()local bf=bb.
Position bb.CFrame=CFrame.lookAt(bf,bf+be)end)end,function(bb,bc,bd)if not bb or
not bb.Parent then return end local be=ab.GetHumanoid()if be and be.AutoRotate~=
false then be.AutoRotate=false end local bf=bc or Vector3.new(1,0,0)if bf.
Magnitude<0.1 then bf=Vector3.new(1,0,0)end bf=Vector3.new(bf.X,0,bf.Z).Unit
pcall(function()local bg=bb.Position local bh=CFrame.lookAt(bg,bg+bf)bb.CFrame=
bb.CFrame:Lerp(bh,math.clamp(bd or 0.35,0.05,1))end)end,function()local bb=ab.
GetHumanoid()if bb then bb.AutoRotate=true end end local bg=function(bg,bh,bi)
local bk,bl=ab.GetHumanoid(),a_()if not bk or not bl then return end aN(bg.speed
)local bm=ac.SimplifyPath(bg.points,ai)local bn=#bm if bn<2 then return end
local bo,bp=0,{}bp[1]=0 for bq=2,bn do local br=a1(bm[bq-1],bm[bq])bo+=br bp[bq]
=bo end aT=0 aU=bo aV=0 aZ'progress_init'local bq,br=function(bq,br,bs)br=br or
0 bs=bs or bo local bt,bu=0,math.huge for bv=2,bn do if bp[bv]<br then continue
end if bp[bv-1]>bs then continue end local bw,bx=bm[bv-1],bm[bv]local by,bz=bw.X
,bw.Z local bA,bB=bx.X-by,bx.Z-bz local bC,bD=bA*bA+bB*bB,0 if bC>0 then bD=((bq
.X-by)*bA+(bq.Z-bz)*bB)/bC bD=math.clamp(bD,0,1)end local bE,bF=bq.X-(by+bA*bD),
bq.Z-(bz+bB*bD)local bG=bE*bE+bF*bF if bG<bu then bu=bG bt=bp[bv-1]+math.sqrt(bC
)*bD end end return bt end,function(bq)local br=2 while br<=bn and bp[br]<bq do
br+=1 end br=math.min(br,bn)local bs=bp[br]-bp[br-1]if bs<=0 then return bm[br]
end local bt,bu,bv=math.clamp((bq-bp[br-1])/bs,0,1),bm[br-1],bm[br]return
Vector3.new(bu.X+(bv.X-bu.X)*bt,bu.Y+(bv.Y-bu.Y)*bt,bu.Z+(bv.Z-bu.Z)*bt)end
local bs,bt,bu=function(bs)local bt=bo-bs if bt<=1 then return math.max(0.2,bt)
end local bu,bv=math.min(bs+2,bo),math.min(bs+4.5,bo)if bv-bs<0.8 then return
math.min(al,bt)end local bw,bx,by=br(bs),br(bu),br(bv)local bz,bA,bB,bC=bx.X-bw.
X,bx.Z-bw.Z,by.X-bx.X,by.Z-bx.Z local bD,bE=math.sqrt(bz*bz+bA*bA),math.sqrt(bB*
bB+bC*bC)if bD>0.1 and bE>0.1 then local bF=math.clamp((bz*bB+bA*bC)/(bD*bE),-1,
1)local bG=math.clamp((bF+0.2)/1.2,0,1)local bH=al+(am-al)*bG return math.min(bH
,bt)end return math.min(am,bt)end,{},{}if bg.events and(aw or ax or ay)then
local bv,bw=bg.events.dwells or{},bg.events.skills or{}for bx,by in ipairs(bv)do
local bz,bA=bq(by.pos),by.dur or 0 if bz<=0.8 or bz>=bo-0.8 then bA=aE end bt[bx
]={arc=bz,dur=bA,facing=by.facing,skills={},pos=by.pos}end if aE>0 and(#bt==0 or
bt[1].arc>0.8)then table.insert(bt,1,{arc=0,dur=aE,facing=bg.events and bg.
events.startFacing or nil,skills={},pos=bg.startPos or bm[1]})end for bx,by in
ipairs(bw)do local bz=(aw and by.dw>0 and bt[by.dw])and bt[by.dw]or nil if bz
then table.insert(bz.skills,{tOff=by.dwT or 0,facing=by.facing,key=by.key})else
table.insert(bu,{arc=bq(by.pos),facing=by.facing,key=by.key})end end table.sort(
bu,function(bx,by)return bx.arc<by.arc end)end local bv,bw,bx=function(bv)if not
aP or(bv.dur or 0)<=0 then return true end if aw then ba()if ay and bv.facing
then bd(bl,bv.facing)end local bw,bx,by=os.clock(),{},0 while aP and(os.clock()-
bw<bv.dur)do if not bl or not bl.Parent then return false,'no_root'end if ab.
IsDead()then return false,'dead'end if ab.GetCurrentRoomIndex()~=bh then return
false,'room_changed'end if ab.IsBossActive()and not bi then return false,'boss'
end ba()local bz=os.clock()-bw for bA,bB in ipairs(bv.skills or{})do if not bx[
bA]and bz>=(bB.tOff or 0)then bx[bA]=true if ay and bB.facing and aH(bB.key)then
bd(bl,bB.facing)by=os.clock()+az end if ax then bc(bB.key or'QE')end end end
task.wait(0.03)end for bz,bA in ipairs(bv.skills or{})do if not bx[bz]then bx[bz
]=true if ay and bA.facing and aH(bA.key)then bd(bl,bA.facing)by=os.clock()+az
end if ax then bc(bA.key or'QE')end end end while aP and os.clock()<by do ba()
task.wait(0.03)end if ay then bf()end end return true end,bg.startPos or bm[1],
a0(bl)if bx and bw then local by=a1(bx,bw)if by>1.8 then local bz=os.clock()+ak
while aP and os.clock()<bz do local bA=a0(bl)if not bA then break end local bB=
a1(bA,bw)if bB<=1.8 then break end if ab.IsDead()or ab.GetCurrentRoomIndex()~=bh
then break end b(bw)task.wait(0.03)end ba()end local bz=a0(bl)if bz and a1(bz,bw
)<=3 then pcall(function()local bA=bl.CFrame.Rotation bl.CFrame=CFrame.new(bw.X,
bl.Position.Y,bw.Z)*bA bl.AssemblyLinearVelocity=Vector3.zero bl.
AssemblyAngularVelocity=Vector3.zero end)end end local by,bz,bA,bB,bC,bD,bE=0,bw
or a0(bl),os.clock(),1,1,0 a8()while aP do if not bl or not bl.Parent then bf()
return false,'no_root'end if ab.IsDead()then bf()return false,'dead'end if ab.
GetCurrentRoomIndex()~=bh then bf()return false,'room_changed'end if ab.
IsBossActive()and not bi then bf()return false,'boss'end local bF=a0(bl)if not
bF then task.wait(0.08)continue end local bG=bq(bF,math.max(0,by-an),math.min(bo
,by+ao))if bG>by then by=bG end aT=by aV=bo>0 and math.clamp(math.floor((by/bo)*
100),0,100)or 0 if bz then if a1(bF,bz)>0.02 then bA=os.clock()end end bz=bF if
os.clock()-bA>ap then by=math.min(by+aq,bo-aj)bA=os.clock()bz=bF end while bC<=#
bu and bu[bC].arc<=by do local bH=bu[bC]if ay and bH.facing and aH(bH.key)then
bd(bl,bH.facing)bE=bH.facing bD=os.clock()+az end if ax then bc(bH.key or'QE')
end bC+=1 end while bB<=#bt and by>=bt[bB].arc do local bH=bt[bB]local bI,bJ=bv(
bH)if not bI then ba()bf()return false,bJ end bB+=1 bz=a0(bl)bA=os.clock()end
local bH if ay then local bI,bJ=math.huge,bB while bJ<=#bt do local bK,bL=(bt[bJ
])if bK.skills and#bK.skills>0 then for bM,bN in ipairs(bK.skills)do if bN.
facing and aH(bN.key)then bL=bN.facing break end end end bL=bL or bK.facing if
bL then if bK.arc<bI then bI=bK.arc bH=bL end break end bJ+=1 end local bK=bC
while bK<=#bu do local bL=bu[bK]if bL.facing and aH(bL.key)then if bL.arc<bI
then bI=bL.arc bH=bL.facing end break end bK+=1 end end if ay then if os.clock()
<bD then if bE then be(bl,bE,0.45)end if bk.AutoRotate~=false then bk.AutoRotate
=false end elseif bH then be(bl,bH,0.35)if bk.AutoRotate~=false then bk.
AutoRotate=false end else if bk.AutoRotate~=true then bk.AutoRotate=true end end
else if bk.AutoRotate~=true then bk.AutoRotate=true end end if by>=bo-aj then
while bB<=#bt do local bI=bt[bB]local bJ,bK=bv(bI)if not bJ then ba()bf()return
false,bK end bB+=1 end while bC<=#bu do local bI=bu[bC]if ay and bI.facing and
aH(bI.key)then bd(bl,bI.facing)bE=bI.facing bD=os.clock()+az end if ax then bc(
bI.key or'QE')end bC+=1 end local bI=os.clock()+5 while aP do local bJ=a0(bl)if
not bJ then break end local bK=a1(bJ,bm[bn])if bK<=aj then break end if ab.
GetCurrentRoomIndex()~=bh then ba()bf()return false,'room_changed'end if(ab.
IsBossActive()and not bi)or ab.IsDead()then ba()bf()return false,'dead'end if os
.clock()>=bI then break end b(bm[bn])if os.clock()<bD then if bE then be(bl,bE,
0.45)end if bk.AutoRotate~=false then bk.AutoRotate=false end elseif bk.
AutoRotate~=true then bk.AutoRotate=true end task.wait(0.03)end ba()bf()aT=bo aV
=100 return true,'completed'end local bI=bs(by)local bJ=br(math.min(by+bI,bo-
0.01))b(bJ)task.wait(0.03)end ba()bf()return false,'stopped'end local bh=
function()local bh,bi,bk=0,false,false aS=1 while aP do if aQ then break end if
ab.IsDead()then bk=true task.wait(0.25)continue end if bk then bk=false end if
ab.IsInLobby()then aQ=false aP=false break end if ab.IsBossActive()and not aR
then task.wait(0.25)continue end local bl=ab.GetCurrentRoomIndex()if bl<=0 then
task.wait(0.1)continue end if bl~=bh then bh=bl bi=false aS=1 aT=0 aU=0 aV=0 end
local bm=ac.GetRoomSegment(aX,bl)if not bm then task.wait(0.1)continue end local
bn=bm.phases or{bm}local bo=#bn if bi then task.wait(0.1)continue end local bp=
bn[math.min(aS,bo)]or bm local bq,br=bg(bp,bl,aR)bf()if bq then bi=true aT=aU aV
=100 else if br=='dead'then aS+=1 local bs=math.min(aS,bo)if bo>1 then ad.
Notify('Path Record',(
'T\u{1eed} tr\u{1ead}n (Phase %d/%d): Ch\u{1edd} h\u{1ed3}i sinh \u{111}\u{1ec3} ch\u{1ea1}y Phase %d...'
):format(aS-1,bo,bs),3)else ad.Notify('Path Record',
'T\u{1eed} tr\u{1ead}n: \u{110}ang ch\u{1edd} h\u{1ed3}i sinh \u{111}\u{1ec3} \u{111}i l\u{1ea1}i...'
,2)end while aP and ab.IsDead()do task.wait(0.2)end task.wait(0.6)end end end
a9()a5()aO()bf()aY=nil aZ()end function av.IsPlaying()return aP end function av.
ResumeWanted()return aQ end function av.GetActiveMap()return aX end function av.
IsBossPlayActive()return aR end function av.GetStatus()return{playing=aP,map=aX,
room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(),phase=aS,resume=aQ,
progressPercent=aV,progressStuds=aT,totalStuds=aU}end function av.
OnStatusChanged(bi)if type(bi)~='function'then return function()end end table.
insert(aW,bi)return function()for bk,bl in ipairs(aW)do if bl==bi then table.
remove(aW,bk)break end end end end function av.Start()if aP then return false,
'\u{111}ang ph\u{e1}t r\u{1ed3}i'end if ab.IsInLobby()then return false,
'\u{111}ang \u{1edf} lobby'end local bi=ab.GetCurrentRoomIndex()if bi<=0 then
return false,'ch\u{1b0}a c\u{f3} room'end local bk=ab.GetCurrentDungeonName()if
not bk or#bk==0 then return false,
'kh\u{f4}ng x\u{e1}c \u{111}\u{1ecb}nh \u{111}\u{1b0}\u{1ee3}c map'end if not ac
.HasSegmentOrMacro(bk,bi)then return false,(
'map [%s] ch\u{1b0}a c\u{f3} segment room %d'):format(bk,bi)end local bl=ac.
GetMapMode(bk)=='full'if ab.IsBossActive()and(not bl or not ac.
HasSegmentOrMacro(bk,bi))then return false,
'boss room (h\u{e3}y d\u{f9}ng Hazard Scanner)'end aX=bk aR=bl aQ=false aS=1 aT=
0 aU=0 aV=0 aP=true a4()a8()aY=task.spawn(bh)aZ'started'return true end function
av.Stop()aP=false aQ=false aX=nil aR=false aS=1 aT=0 aU=0 aV=0 if aY then task.
cancel(aY)aY=nil end bb(ab.GetHumanoid())aO()bf()aZ'stopped'end function av.
PauseForExclusive()if not aP then return end aQ=true aP=false aR=false aT=0 aU=0
aV=0 if aY then task.cancel(aY)aY=nil end bb(ab.GetHumanoid())aO()bf()ad.Notify(
'Path Record',
'Nh\u{1b0}\u{1edd}ng \u{111}i\u{1ec1}u khi\u{1ec3}n: s\u{1ebd} t\u{1ef1} ph\u{e1}t ti\u{1ebf}p khi v\u{e0}o room c\u{f3} b\u{1ea3}n ghi'
,3)aZ'paused'end return av end function a.ag()local aa,ab,ac,ad,ae,af,ag=a.load
'e',a.load'f',a.load'ad',a.load'ae',a.load'af',a.load'b',game:GetService
'Workspace'local ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax,ay,az,aA,aD,
aE,aF=aa.RunService,{},'PR_PathVisual_Container','PR_PathVisual_Anchor',Color3.
fromRGB(255,60,60),Color3.fromRGB(255,90,90),Color3.fromRGB(0,255,120),Color3.
fromRGB(0,220,110),Color3.fromRGB(0,230,255),Color3.fromRGB(255,80,180),Color3.
fromRGB(255,190,30),Color3.fromRGB(200,70,255),Color3.fromRGB(220,100,255),
Color3.fromRGB(255,210,60),0.35,0.55,2.5,3,0.35,true,true,true,true local aG,aH,
aI,aJ,aK,aM,aN,aO,aP,aQ,aR=av,true,0,{},{},{},{},{}local aS,aT,aU,aV,aW,aX,aY,aZ
=function()if aP and aP.Parent and aQ and aQ.Parent then return aQ end ai.Clear(
)local aS=Instance.new'Folder'aS.Name=aj aS.Parent=ag local aT=Instance.new
'Part'aT.Name=ak aT.Anchored=true aT.CanCollide=false aT.CanQuery=false aT.
CanTouch=false aT.Transparency=1 aT.Size=Vector3.new(1,1,1)aT.CFrame=CFrame.new(
0,0,0)aT.Parent=aS aP=aS aQ=aT table.clear(aJ)table.clear(aK)table.clear(aM)
table.clear(aN)table.clear(aO)return aQ end,function(aS,aT)local aU=aJ[aS]if not
aU or not aU.Parent then aU=Instance.new'SphereHandleAdornment'aU.Name=
'PR_NodeSphere_'..tostring(aS)aU.Adornee=aT aU.AlwaysOnTop=aH aU.ZIndex=5 aU.
Transparency=0.2 aU.Parent=aT aJ[aS]=aU end return aU end,function(aS,aT)local
aU=aK[aS]if not aU or not aU.Parent then aU=Instance.new'LineHandleAdornment'aU.
Name='PR_PathLine_'..tostring(aS)aU.Adornee=aT aU.AlwaysOnTop=aH aU.ZIndex=4 aU.
Transparency=0.3 aU.Thickness=ax aU.Parent=aT aK[aS]=aU end return aU end,
function(aS,aT)local aU=aM[aS]if not aU or not aU.Parent then aU=Instance.new
'SphereHandleAdornment'aU.Name='PR_EventSphere_'..tostring(aS)aU.Adornee=aT aU.
AlwaysOnTop=aH aU.ZIndex=8 aU.Transparency=0.15 aU.Radius=aw aU.Parent=aT aM[aS]
=aU end return aU end,function(aS,aT)local aU=aN[aS]if not aU or not aU.Parent
then aU=Instance.new'LineHandleAdornment'aU.Name='PR_FacingRay_'..tostring(aS)aU
.Adornee=aT aU.AlwaysOnTop=aH aU.ZIndex=9 aU.Transparency=0.1 aU.Thickness=ay aU
.Parent=aT aN[aS]=aU end return aU end,function(aS,aT)local aU=aO[aS]if not aU
or not aU.billboard or not aU.billboard.Parent then local aV=Instance.new
'Attachment'aV.Name='PR_BadgeAtt_'..tostring(aS)aV.Parent=aT local aW=Instance.
new'BillboardGui'aW.Name='PR_BadgeGui_'..tostring(aS)aW.Adornee=aV aW.Size=UDim2
.new(0,115,0,24)aW.StudsOffset=Vector3.new(0,1.6,0)aW.AlwaysOnTop=true aW.
MaxDistance=180 aW.LightInfluence=0 aW.Parent=aP local aX=Instance.new'Frame'aX.
Name='BadgeFrame'aX.Size=UDim2.new(1,0,1,0)aX.BackgroundColor3=Color3.fromRGB(15
,15,20)aX.BackgroundTransparency=0.25 aX.BorderSizePixel=0 aX.Parent=aW local aY
=Instance.new'UICorner'aY.CornerRadius=UDim.new(0,6)aY.Parent=aX local aZ=
Instance.new'UIStroke'aZ.Name='Stroke'aZ.Color=as aZ.Thickness=1.4 aZ.
Transparency=0.15 aZ.Parent=aX local a_=Instance.new'TextLabel'a_.Name='Text'a_.
Size=UDim2.new(1,-6,1,0)a_.Position=UDim2.new(0,3,0,0)a_.BackgroundTransparency=
1 a_.Font=Enum.Font.GothamBold a_.TextSize=11 a_.TextColor3=Color3.fromRGB(255,
255,255)a_.RichText=true a_.Text=''a_.TextXAlignment=Enum.TextXAlignment.Center
a_.TextYAlignment=Enum.TextYAlignment.Center a_.Parent=aX aU={attachment=aV,
billboard=aW,frame=aX,stroke=aZ,label=a_}aO[aS]=aU end return aU end,function(aS
)if not aS then return nil end if typeof(aS)=='Vector3'then if aS.Magnitude>
0.001 then return aS.Unit end return nil end if type(aS)=='table'and type(aS.X)
=='number'and type(aS.Z)=='number'then local aT=Vector3.new(aS.X,0,aS.Z)if aT.
Magnitude>0.001 then return aT.Unit end end return nil end,function()for aS,aT
in ipairs(aJ)do if aT and aT.Parent then aT.Visible=false end end for aS,aT in
ipairs(aK)do if aT and aT.Parent then aT.Visible=false end end for aS,aT in
ipairs(aM)do if aT and aT.Parent then aT.Visible=false end end for aS,aT in
ipairs(aN)do if aT and aT.Parent then aT.Visible=false end end for aS,aT in
ipairs(aO)do if aT and aT.billboard and aT.billboard.Parent then aT.billboard.
Enabled=false end end end function ai.Update()if not aA then aZ()return end if
ab.IsInLobby()then aZ()return end local a_,a0,a1,a2=ad.IsRecording(),{},{},{}if
a_ then local a3=ad.GetRoomPhases and ad.GetRoomPhases()if a3 and#a3>0 then for
a4,a5 in ipairs(a3)do if a5 and a5.points and#a5.points>0 then table.insert(a0,
a5.points)end end end local a4=ad.GetCurrentPoints()if a4 and#a4>0 then table.
insert(a0,a4)end local a5=ad.GetCurrentDwells and ad.GetCurrentDwells()if a5
then a1=a5 end local a6=ad.GetCurrentSkills and ad.GetCurrentSkills()if a6 then
a2=a6 end else local a3,a4=ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex()if
a3 and#a3>0 and a4>0 then local a5=ac.GetRoomSegment(a3,a4)if a5 then if a5.
phases and#a5.phases>0 then for a6,a7 in ipairs(a5.phases)do if a7 and a7.points
and#a7.points>0 then table.insert(a0,a7.points)end end elseif a5.points and#a5.
points>0 then table.insert(a0,a5.points)end if a5.events then a1=a5.events.
dwells or{}a2=a5.events.skills or{}end end end end if#a0==0 then aZ()return end
local a3=aS()if not a3 then return end local a4,a5,a6,a7,a8,a9,b,ba,bb=a_ and al
or an,a_ and am or ao,0,0,0,0,0 for bc,bd in ipairs(a0)do local be=#bd if be>0
then if not ba then ba=bd[1]end bb=bd[be]for bf=1,be do local bg=bd[bf]if bg
then a6+=1 local bh=aT(a6,a3)bh.Radius=aG bh.Color3=a4 bh.AlwaysOnTop=aH bh.
CFrame=CFrame.new(bg+Vector3.new(0,az,0))bh.Visible=true end end if aD and be>=2
then for bf=1,be-1 do local bg,bh=bd[bf],bd[bf+1]if bg and bh then local bi,bk=
bg+Vector3.new(0,az,0),bh+Vector3.new(0,az,0)local bl=(bk-bi).Magnitude if bl>
0.05 then a7+=1 local bm=aU(a7,a3)bm.Length=bl bm.Thickness=ax bm.Color3=a5 bm.
AlwaysOnTop=aH bm.CFrame=CFrame.lookAt(bi,bk)bm.Visible=true end end end end end
end if aE then local bc if ba then for bd,be in ipairs(a1)do if be.pos and(be.
pos-ba).Magnitude<1.5 then bc=be break end end a8+=1 local bd=aV(a8,a3)bd.Radius
=aw bd.Color3=ap bd.AlwaysOnTop=aH bd.CFrame=CFrame.new(ba+Vector3.new(0,az,0))
bd.Visible=true b+=1 local be=aX(b,a3)be.attachment.WorldPosition=ba+Vector3.
new(0,az,0)be.stroke.Color=ap local bf=ae and ae.GetStartPauseTime and ae.
GetStartPauseTime()or 0 if bf>0 then be.label.Text=(
"<font color='rgb(0,240,255)'><b>\u{1f6a9} START (%.1fs)</b></font>"):format(bf)
else be.label.Text="<font color='rgb(0,240,255)'><b>\u{1f6a9} START</b></font>"
end be.billboard.Enabled=true if aF and bc and bc.facing then local bg=aY(bc.
facing)if bg then a9+=1 local bh,bi=aW(a9,a3),ba+Vector3.new(0,az,0)local bk=bi+
bg*3.5 bh.Length=3.5 bh.Color3=ap bh.AlwaysOnTop=aH bh.CFrame=CFrame.lookAt(bi,
bk)bh.Visible=true end end end for bd,be in ipairs(a1)do local bf=be.pos local
bg,bh=ba and(bf-ba).Magnitude<1.5,bb and(bf-bb).Magnitude<1.5 if bf and not bg
and not bh then a8+=1 local bi=aV(a8,a3)bi.Radius=aw bi.Color3=ar bi.AlwaysOnTop
=aH bi.CFrame=CFrame.new(bf+Vector3.new(0,az,0))bi.Visible=true local bk=math.
round((be.dur or 0)*10)/10 b+=1 local bl=aX(b,a3)bl.attachment.WorldPosition=bf+
Vector3.new(0,az,0)bl.stroke.Color=ar bl.label.Text=(
"<font color='rgb(255,200,60)'><b>\u{23f3} Pause (%.1fs)</b></font>"):format(bk)
bl.billboard.Enabled=true if aF then local bm=aY(be.facing)if bm then a9+=1
local bn,bo=aW(a9,a3),bf+Vector3.new(0,az,0)local bp=bo+bm*3 bn.Length=3 bn.
Color3=au bn.AlwaysOnTop=aH bn.CFrame=CFrame.lookAt(bo,bp)bn.Visible=true end
end end end for bd,be in ipairs(a2)do local bf=be.pos if bf then a8+=1 local bg=
aV(a8,a3)bg.Radius=aw bg.Color3=as bg.AlwaysOnTop=aH bg.CFrame=CFrame.new(bf+
Vector3.new(0,az,0))bg.Visible=true local bh=(be.key and#be.key>0)and be.key or
'QE'b+=1 local bi=aX(b,a3)bi.attachment.WorldPosition=bf+Vector3.new(0,az,0)bi.
stroke.Color=as bi.label.Text=(
"<font color='rgb(220,100,255)'><b>\u{26a1} Skill [%s]</b></font>"):format(bh)bi
.billboard.Enabled=true if aF then local bk=aY(be.facing)if bk then a9+=1 local
bl,bm=aW(a9,a3),bf+Vector3.new(0,az,0)local bn=bm+bk*3.8 bl.Length=3.8 bl.Color3
=at bl.AlwaysOnTop=aH bl.CFrame=CFrame.lookAt(bm,bn)bl.Visible=true end end end
end local bd if bb and bb~=ba and not a_ then for be,bf in ipairs(a1)do if bf.
pos and(bf.pos-bb).Magnitude<1.5 then bd=bf break end end a8+=1 local be=aV(a8,
a3)be.Radius=aw be.Color3=aq be.AlwaysOnTop=aH be.CFrame=CFrame.new(bb+Vector3.
new(0,az,0))be.Visible=true b+=1 local bf=aX(b,a3)bf.attachment.WorldPosition=bb
+Vector3.new(0,az,0)bf.stroke.Color=aq local bg=ae and ae.GetStartPauseTime and
ae.GetStartPauseTime()or 0 if bd and bg>0 then bf.label.Text=(
"<font color='rgb(255,100,200)'><b>\u{1f3c1} FINISH (%.1fs)</b></font>"):format(
bg)else bf.label.Text=
"<font color='rgb(255,100,200)'><b>\u{1f3c1} FINISH</b></font>"end bf.billboard.
Enabled=true if aF and bd and bd.facing then local bh=aY(bd.facing)if bh then a9
+=1 local bi,bk=aW(a9,a3),bb+Vector3.new(0,az,0)local bl=bk+bh*3.5 bi.Length=3.5
bi.Color3=aq bi.AlwaysOnTop=aH bi.CFrame=CFrame.lookAt(bk,bl)bi.Visible=true end
end end end for bc=a6+1,#aJ do local bd=aJ[bc]if bd and bd.Parent then bd.
Visible=false end end for bc=a7+1,#aK do local bd=aK[bc]if bd and bd.Parent then
bd.Visible=false end end for bc=a8+1,#aM do local bd=aM[bc]if bd and bd.Parent
then bd.Visible=false end end for bc=a9+1,#aN do local bd=aN[bc]if bd and bd.
Parent then bd.Visible=false end end for bc=b+1,#aO do local bd=aO[bc]if bd and
bd.billboard and bd.billboard.Parent then bd.billboard.Enabled=false end end end
local a_=function()if aR then return end aR=ah.Heartbeat:Connect(function()local
a_,a0=os.clock(),ad.IsRecording()local a1=a0 and 0.03 or 0.1 if a_-aI<a1 then
return end aI=a_ pcall(ai.Update)end)end function ai.SetEnabled(a0)aA=a0 and
true or false if not aA then aZ()else pcall(ai.Update)end end function ai.
IsEnabled()return aA end function ai.SetShowLines(a0)aD=a0 and true or false if
not aD then for a1,a2 in ipairs(aK)do if a2 and a2.Parent then a2.Visible=false
end end else pcall(ai.Update)end end function ai.IsShowLinesEnabled()return aD
end function ai.SetShowEvents(a0)aE=a0 and true or false if not aE then for a1,
a2 in ipairs(aM)do if a2 and a2.Parent then a2.Visible=false end end for a1,a2
in ipairs(aO)do if a2 and a2.billboard and a2.billboard.Parent then a2.billboard
.Enabled=false end end else pcall(ai.Update)end end function ai.
IsShowEventsEnabled()return aE end function ai.SetShowFacingRays(a0)aF=a0 and
true or false if not aF then for a1,a2 in ipairs(aN)do if a2 and a2.Parent then
a2.Visible=false end end else pcall(ai.Update)end end function ai.
IsShowFacingRaysEnabled()return aF end function ai.SetNodeRadius(a0)if type(a0)
=='number'then aG=math.clamp(a0,0.1,1.5)pcall(ai.Update)end end function ai.
GetNodeRadius()return aG end function ai.SetAlwaysOnTop(a0)aH=a0 and true or
false for a1,a2 in ipairs(aJ)do if a2 and a2.Parent then a2.AlwaysOnTop=aH end
end for a1,a2 in ipairs(aK)do if a2 and a2.Parent then a2.AlwaysOnTop=aH end end
for a1,a2 in ipairs(aM)do if a2 and a2.Parent then a2.AlwaysOnTop=aH end end for
a1,a2 in ipairs(aN)do if a2 and a2.Parent then a2.AlwaysOnTop=aH end end for a1,
a2 in ipairs(aO)do if a2 and a2.billboard and a2.billboard.Parent then a2.
billboard.AlwaysOnTop=aH end end end function ai.IsAlwaysOnTopEnabled()return aH
end function ai.Clear()aZ()table.clear(aJ)table.clear(aK)table.clear(aM)table.
clear(aN)table.clear(aO)local a0=ag:FindFirstChild(aj)if a0 then pcall(function(
)a0:Destroy()end)end aP=nil aQ=nil end function ai.Destroy()if aR then aR:
Disconnect()aR=nil end ai.Clear()end ai.Clear()a_()af.Register(function()ai.
Destroy()end)return ai end function a.ah()local aa,ab,ac=a.load'e',a.load'f',a.
load'b'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax,ay,
az=aa.player,aa.RunService,aa.CoreGui or game:GetService'CoreGui',game:
GetService'Workspace',{},{Cyan=Color3.fromRGB(0,230,255),Red=Color3.fromRGB(255,
60,60),Orange=Color3.fromRGB(255,140,0),Yellow=Color3.fromRGB(255,220,40),Green=
Color3.fromRGB(0,255,120),Emerald=Color3.fromRGB(40,220,160),Blue=Color3.
fromRGB(0,140,255),Purple=Color3.fromRGB(180,80,255),Magenta=Color3.fromRGB(255,
60,200),White=Color3.fromRGB(255,255,255)},false,25,0.4,true,true,'Cyan','Red',
0.8,0.15,'PR_InRange_Highlight',0.2,0,{}local aA,aD,aE,aF=function()return ai[ao
]or ai.Cyan end,function()return ai[ap]or ai.Red end,function()local aA=ad and
ad.Character if not aA or not aA.Parent then return nil end local aD=aA:
FindFirstChildOfClass'Humanoid'if aD and aD.Health<=0 then return nil end local
aE=aA:FindFirstChild'HumanoidRootPart'if aE and aE.Parent then return aE end
return nil end,function()for aA,aD in pairs(av)do pcall(function()aD:Destroy()
end)end table.clear(av)pcall(function()for aA,aD in ipairs(ag:GetDescendants())
do if aD.Name==as then pcall(function()aD:Destroy()end)end end end)end local aG,
aH=function()if aw then pcall(function()aw:Destroy()end)aw=nil end if ax then
pcall(function()ax:Destroy()end)ax=nil end az=nil aF()end,function()if not aw or
not aw.Parent then pcall(function()if aw then aw:Destroy()end end)aw=Instance.
new'CylinderHandleAdornment'aw.Name='PR_SkillRangeRing'aw.AlwaysOnTop=true aw.
ZIndex=5 aw.Parent=af end if am then if not ax or not ax.Parent then pcall(
function()if ax then ax:Destroy()end end)ax=Instance.new
'CylinderHandleAdornment'ax.Name='PR_SkillRangeFill'ax.AlwaysOnTop=true ax.
ZIndex=4 ax.Parent=af end else if ax then pcall(function()ax:Destroy()end)ax=nil
end end end local aI,aJ=function(aI)if not aj then aG()return end aH()local aJ,
aK=2.6,aA()local aM=Vector3.new(aI.Position.X,aI.Position.Y-aJ,aI.Position.Z)
local aN=CFrame.new(aM)*CFrame.Angles(math.rad(90),0,0)local aO=aI.CFrame:
ToObjectSpace(aN)if aw then aw.Adornee=aI aw.Height=0.06 aw.Radius=ak aw.
InnerRadius=math.max(0.1,ak-al)aw.Color3=aK aw.Transparency=1-aq aw.CFrame=aO aw
.Visible=(aI~=nil and aI.Parent~=nil)end if ax and am then ax.Adornee=aI ax.
Height=0.02 ax.Radius=ak ax.InnerRadius=0 ax.Color3=aK ax.Transparency=1-ar ax.
CFrame=aO ax.Visible=(aI~=nil and aI.Parent~=nil)end end,function(aI)if not aj
or not an or not aI then if next(av)~=nil then aF()end return end local aJ,aK,aM
,aN,aO=ab.GetTrackedEnemyData(),aI.Position,ak*ak,{},aD()for aP,aQ in ipairs(aJ)
do local aR,aS,aT=aQ.Model,aQ.Root,aQ.Humanoid if aR and aR.Parent and aS and aS
.Parent and aT and aT.Health>0 then local aU,aV=aS.Position.X-aK.X,aS.Position.Z
-aK.Z if(aU*aU+aV*aV)<=aM then aN[aR]=true end end end for aP,aQ in pairs(av)do
if not aN[aP]or not aP.Parent then pcall(function()aQ:Destroy()end)av[aP]=nil
end end for aP in pairs(aN)do if not av[aP]or not av[aP].Parent then local aQ=aP
:FindFirstChild(as)local aR=(aQ and aQ:IsA'Highlight')and aQ or Instance.new
'Highlight'aR.Name=as aR.Adornee=aP aR.FillColor=aO aR.FillTransparency=0.35 aR.
OutlineColor=Color3.fromRGB(255,255,255)aR.OutlineTransparency=0.1 aR.DepthMode=
Enum.HighlightDepthMode.AlwaysOnTop aR.Parent=aP av[aP]=aR else local aQ=av[aP]
if aQ.FillColor~=aO then aQ.FillColor=aO end if not aQ.Enabled then aQ.Enabled=
true end end end end local aK=function()if not aj then return end local aK=aE()
if not aK then if aw then aw.Visible=false end if ax then ax.Visible=false end
if next(av)~=nil then aF()end az=nil return end local aM=2.6 local aN=Vector3.
new(aK.Position.X,aK.Position.Y-aM,aK.Position.Z)local aO=CFrame.new(aN)*CFrame.
Angles(math.rad(90),0,0)local aP=aK.CFrame:ToObjectSpace(aO)if not aw or not aw.
Parent or aK~=az then az=aK aI(aK)else if aw.Adornee~=aK then aw.Adornee=aK end
aw.CFrame=aP if not aw.Visible then aw.Visible=true end if am then if not ax or
not ax.Parent then aI(aK)else if ax.Adornee~=aK then ax.Adornee=aK end ax.CFrame
=aP if not ax.Visible then ax.Visible=true end end elseif ax and ax.Visible then
ax.Visible=false end end local aQ=os.clock()if aQ-au>=at then au=aQ aJ(aK)end
end function ah.SetEnabled(aM)aj=aM and true or false if aj then local aN=aE()if
aN then aI(aN)az=aN aJ(aN)end if not ay then ay=ae.Heartbeat:Connect(aK)end else
aG()if ay then ay:Disconnect()ay=nil end az=nil end end function ah.IsEnabled()
return aj end function ah.SetRadius(aM)if type(aM)=='number'then ak=math.clamp(
aM,5,150)local aN=aE()if aj and aN then aI(aN)aJ(aN)end end end function ah.
GetRadius()return ak end function ah.SetFillEnabled(aM)am=aM and true or false
local aN=aE()if aj and aN then aI(aN)end end function ah.IsFillEnabled()return
am end function ah.SetHighlightInRange(aM)an=aM and true or false if not an then
aF()else local aN=aE()if aj and aN then aJ(aN)end end end function ah.
IsHighlightInRangeEnabled()return an end function ah.GetColorNames()local aM={
'Cyan','Red','Orange','Yellow','Green','Emerald','Blue','Purple','Magenta',
'White'}return aM end function ah.GetSelectedCircleColor()return ao end function
ah.SetCircleColor(aM)if type(aM)=='string'and ai[aM]then ao=aM local aN=aE()if
aj and aN then aI(aN)end end end function ah.GetSelectedHighlightColor()return
ap end function ah.SetHighlightColor(aM)if type(aM)=='string'and ai[aM]then ap=
aM local aN=aE()if aj and aN then aJ(aN)end end end if ad then ad.CharacterAdded
:Connect(function(aM)if aj then task.spawn(function()local aN=aM:WaitForChild(
'HumanoidRootPart',10)if aN and aj then aI(aN)az=aN aJ(aN)end end)end end)end ab
.OnRespawn(function()if aj then task.delay(0.2,function()local aM=aE()if aM and
aj then aI(aM)az=aM aJ(aM)end end)end end)ac.Register(function()ah.SetEnabled(
false)aG()end)return ah end function a.ai()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,
ak,al,am,an=a.load'e',a.load'f',a.load'b',a.load'g',a.load'c',a.load'z',a.load
'ad',a.load'ae',a.load'af',a.load'ag',a.load'ah',{},true,true function al.
IsTimelineCaptureEnabled()return am end function al.SetTimelineCapture(ao)am=ao
and true or false ah.SetCapture(am)fireStatus'timeline'end function al.
IsTimelineReplayEnabled()return an end function al.SetTimelineReplay(ao)an=ao
and true or false ai.SetReplayTimeline(an)fireStatus'timeline'end function al.
IsSpeedMatchEnabled()return ai.IsSpeedMatchEnabled()end function al.
SetSpeedMatch(ao)ai.SetSpeedMatch(ao and true or false)fireStatus'speedmatch'end
function al.IsUseFastSpeedEnabled()return ai.IsUseFastSpeedEnabled()end function
al.SetUseFastSpeed(ao)ai.SetUseFastSpeed(ao and true or false)fireStatus
'usefastspeed'end function al.GetPreAimTime()return ai.GetPreAimTime()end
function al.SetPreAimTime(ao)ai.SetPreAimTime(ao)fireStatus'preaim'end function
al.GetSkillFaceHold()return ai.GetSkillFaceHold()end function al.
SetSkillFaceHold(ao)ai.SetSkillFaceHold(ao)fireStatus'facehold'end function al.
GetDoubleClickDelay()return ai.GetDoubleClickDelay()end function al.
SetDoubleClickDelay(ao)ai.SetDoubleClickDelay(ao)fireStatus'doubleclick'end
function al.GetStartPauseTime()return ai.GetStartPauseTime()end function al.
SetStartPauseTime(ao)ai.SetStartPauseTime(ao)fireStatus'startpause'end function
al.IsAimSkillQEnabled()return ai.IsAimSkillQEnabled()end function al.
SetAimSkillQ(ao)ai.SetAimSkillQ(ao and true or false)fireStatus'aimskillq'end
function al.IsAimSkillEEnabled()return ai.IsAimSkillEEnabled()end function al.
SetAimSkillE(ao)ai.SetAimSkillE(ao and true or false)fireStatus'aimskille'end
local ao,ap,aq,ar,as={}local at=function(at)local au=ah.GetStatus()local av={
recording=ah.IsRecording(),playing=ai.IsPlaying(),resume=ai.ResumeWanted(),
autoPlayWanted=autoPlayWanted,inLobby=ab.IsInLobby(),map=ab.
GetCurrentDungeonName(),room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(),
recordedMaps=ag.Count(),pointCount=ah.IsRecording()and au.pointCount or 0,phase=
ai.IsPlaying()and ai.GetCurrentPhaseIndex()or(ah.IsRecording()and au.phaseCount
or 1),reason=at}for aw,ax in ipairs(ao)do pcall(ax,av)end end function al.
ToggleRecord(au)if au then if ah.IsRecording()then return true end if ai.
IsPlaying()then ai.Stop()end local av,aw=ah.Start()if not av then ae.Notify(
'Path Record','Kh\u{f4}ng b\u{1eaf}t \u{111}\u{1ea7}u record: '..tostring(aw),3)
end at()return av else local av=ah.IsRecording()ah.Stop()at()return av end end
function al.IsRecording()return ah.IsRecording()end function al.
CurrentRoomHasRecord()return ag.HasSegmentOrMacro(ab.GetCurrentDungeonName(),ab.
GetCurrentRoomIndex())end function al.GetMapMode(au)return ag.GetMapMode(au)end
function al.SetMapMode(au,av)if ag.SetMapMode(au,av)then at'mode'end end local
au=false function al.IsAutoPlayWanted()return au end function al.TogglePlay(av)
au=av and true or false if au then if ai.IsPlaying()then at'already_playing'
return true end if ah.IsRecording()then ah.Stop()end if ab.IsInLobby()then at
'armed_lobby'return true end local aw,ax=ab.GetCurrentDungeonName(),ab.
GetCurrentRoomIndex()if not aw or#aw==0 or ax<=0 then at'armed_waiting'return
true end if ab.IsBossActive()and ag.GetMapMode(aw)~='full'then at'armed_boss'
return true end if ag.HasSegmentOrMacro(aw,ax)then ad.EnableExclusive
'PathRecord'ai.Start()end at'play_started'return true else local aw=ai.
IsPlaying()ai.Stop()at'play_stopped'return aw end end function al.IsPlaying()
return ai.IsPlaying()end function al.IsEnabled()return ai.IsPlaying()end
function al.SetRangeVisual(av)ak.SetEnabled(av)at'rangevisual'end function al.
IsRangeVisualEnabled()return ak.IsEnabled()end function al.SetRangeVisualRadius(
av)ak.SetRadius(av)at'rangeradius'end function al.GetRangeVisualRadius()return
ak.GetRadius()end function al.SetRangeVisualFill(av)ak.SetFillEnabled(av)at
'rangefill'end function al.IsRangeVisualFillEnabled()return ak.IsFillEnabled()
end function al.SetHighlightInRange(av)ak.SetHighlightInRange(av)at
'rangehighlight'end function al.IsHighlightInRangeEnabled()return ak.
IsHighlightInRangeEnabled()end function al.GetRangeColorNames()return ak.
GetColorNames()end function al.GetSelectedCircleColor()return ak.
GetSelectedCircleColor()end function al.SetCircleColor(av)ak.SetCircleColor(av)
at'circlecolor'end function al.GetSelectedHighlightColor()return ak.
GetSelectedHighlightColor()end function al.SetHighlightColor(av)ak.
SetHighlightColor(av)at'highlightcolor'end function al.SetVisualEnabled(av)aj.
SetEnabled(av)at'visual'end function al.IsVisualEnabled()return aj.IsEnabled()
end function al.SetVisualShowLines(av)aj.SetShowLines(av)at'visuallines'end
function al.IsVisualShowLinesEnabled()return aj.IsShowLinesEnabled()end function
al.SetVisualNodeRadius(av)aj.SetNodeRadius(av)at'visualradius'end function al.
GetVisualNodeRadius()return aj.GetNodeRadius()end function al.
SetVisualAlwaysOnTop(av)aj.SetAlwaysOnTop(av)at'visualontop'end function al.
IsVisualAlwaysOnTopEnabled()return aj.IsAlwaysOnTopEnabled()end function al.
SetVisualShowEvents(av)aj.SetShowEvents(av)at'visualevents'end function al.
IsVisualShowEventsEnabled()return aj.IsShowEventsEnabled()end function al.
SetVisualShowFacing(av)aj.SetShowFacingRays(av)at'visualfacing'end function al.
IsVisualShowFacingEnabled()return aj.IsShowFacingRaysEnabled()end function al.
GetMaps()return ag.GetMaps()end function al.GetMacro(av)return ag.GetMap(av)end
function al.RemoveMap(av)ag.RemoveMap(av)at'removed'end function al.ClearAll()ag
.ClearAll()at'cleared'end function al.ReloadFromDisk()ag.ReloadFromDisk()at
'reloaded'end function al.GetStatus()local av,aw=ah.GetStatus(),ai.GetStatus()
return{recording=ah.IsRecording(),playing=ai.IsPlaying(),resume=ai.ResumeWanted(
),autoPlayWanted=au,inLobby=ab.IsInLobby(),map=ab.GetCurrentDungeonName(),room=
ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(),recordedMaps=ag.Count(),
pointCount=av.pointCount,dwellCount=av.dwellCount or 0,skillCount=av.skillCount
or 0,phase=ai.IsPlaying()and ai.GetCurrentPhaseIndex()or(ah.IsRecording()and av.
phaseCount or 1),progressPercent=aw.progressPercent or 0,progressStuds=aw.
progressStuds or 0,totalStuds=aw.totalStuds or 0}end function al.OnStatusChanged
(av)if type(av)~='function'then return function()end end table.insert(ao,av)
return function()for aw,ax in ipairs(ao)do if ax==av then table.remove(ao,aw)
break end end end end ap=ab.OnBossActiveChanged(function(av)local aw=ai.
GetActiveMap()or ab.GetCurrentDungeonName()local ax=aw and ag.GetMapMode(aw)==
'full'if av then if ax then if ai.ResumeWanted()or au then local ay=ab.
GetCurrentRoomIndex()if ay>0 and ag.HasSegmentOrMacro(aw,ay)then ad.
EnableExclusive'PathRecord'ai.Start()at'boss'end elseif ai.IsPlaying()then ad.
EnableExclusive'PathRecord'end return end if ai.IsPlaying()or ai.ResumeWanted()
or au then ai.PauseForExclusive()if af.IsAutoBossCombatEnabled()then af.Toggle(
true,true)ae.Notify('Path Record',
'Boss Room: B\u{1ead}t Combat Master (Auto Farm + Dodge + Skill)',3)else ae.
Notify('Path Record',
'Boss room: t\u{1ea1}m d\u{1eeb}ng, d\u{f9}ng Hazard Scanner',3)end at'boss'end
else if not ax then if af.IsAutoTriggeredByBoss()then af.Toggle(false)ae.Notify(
'Path Record','H\u{1ea1} g\u{1ee5}c Boss: T\u{1eaf}t Combat Master',3)end if au
or ai.ResumeWanted()then task.delay(0.5,function()if not au and not ai.
ResumeWanted()then return end if ai.IsPlaying()or ah.IsRecording()then return
end local ay,az=ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex()if ay and az>
0 and ag.HasSegmentOrMacro(ay,az)then ad.EnableExclusive'PathRecord'ai.Start()at
'resumed'end end)end end end end)aq=ag.OnChanged(function()at'storage'end)ar=ab.
OnRoomIndexChanged(function()if not au and not ai.ResumeWanted()then return end
local av=ab.GetCurrentRoomIndex()if av<=0 or ab.IsInLobby()or ab.IsDead()then
return end local aw=ab.GetCurrentDungeonName()if not aw or#aw==0 then return end
if ai.GetActiveMap()and ai.GetActiveMap()~=aw then return end if ab.
IsBossActive()and ag.GetMapMode(aw)~='full'then return end if af.
IsAutoTriggeredByBoss()and not ab.IsBossActive()then af.Toggle(false)end if not
ag.HasSegmentOrMacro(aw,av)then return end if not ai.IsPlaying()then ad.
EnableExclusive'PathRecord'ai.Start()at'resumed'end end)as=ab.
OnDungeonNameChanged(function(av)if af.IsAutoTriggeredByBoss()then af.Toggle(
false)end if ah.IsRecording()then ah.Stop'\u{111}\u{1ed5}i map'end if ai.
IsPlaying()or ai.ResumeWanted()then local aw=ai.GetActiveMap()if aw and aw~=av
then ai.Stop()end end if au and av and#av>0 then task.delay(0.3,function()if not
au or ai.IsPlaying()or ah.IsRecording()then return end local aw=ab.
GetCurrentRoomIndex()if aw>0 and ag.HasSegmentOrMacro(av,aw)then if not(ab.
IsBossActive()and ag.GetMapMode(av)~='full')then ad.EnableExclusive'PathRecord'
ai.Start()at'map_autoplay'end end end)end at'map'end)ah.SetCapture(am)ai.
SetReplayTimeline(an)ad.Register('PathRecord',function(av)if not av then ai.
PauseForExclusive()end at'disabled'end,al.IsEnabled)task.delay(1,function()if au
and not ai.IsPlaying()and not ah.IsRecording()then local av=ab.
GetCurrentDungeonName()if av and#av>0 and not ab.IsInLobby()then if ag.
HasSegmentOrMacro(av,ab.GetCurrentRoomIndex())then al.TogglePlay(true)end end
end end)ac.Register(function()ai.Stop()ah.Cancel()aj.Clear()if ap then ap()ap=
nil end if ar then ar()ar=nil end if as then as()as=nil end if aq then aq()aq=
nil end end)return al end function a.aj()local aa,ab,ac,ad,ae,af=a.load'e',a.
load'b',a.load'ai',a.load'd',a.load'A',a.load'c'local ag=aa.RunService return
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
}local at,au,av,aw,ax,ay,az,aA=aj:Label{Text=
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
Section{Side='Left'}aA:Header{Name='Combat & Skill Timing'}ae.
PatchSliderLoadCallback(aA:Slider({Name='Pre-Aim Lead Time (s)',Default=ac.
GetPreAimTime(),Minimum=0.1,Maximum=1.5,DisplayMethod='Value',Precision=2,
Callback=ad.Wrap(function(aD)ac.SetPreAimTime(aD)end),onInputComplete=function(
aD)ad.SaveNow()af.Notify('Path Record',('Saved Pre-Aim Lead Time = %ss'):format(
tostring(aD)),2)end},'Slider_PR_PreAimTime'))ae.PatchSliderLoadCallback(aA:
Slider({Name='Skill Face Hold (s)',Default=ac.GetSkillFaceHold(),Minimum=0.5,
Maximum=2,DisplayMethod='Value',Precision=2,Callback=ad.Wrap(function(aD)ac.
SetSkillFaceHold(aD)end),onInputComplete=function(aD)ad.SaveNow()af.Notify(
'Path Record',('Saved Skill Face Hold = %ss'):format(tostring(aD)),2)end},
'Slider_PR_SkillFaceHold'))ae.PatchSliderLoadCallback(aA:Slider({Name=
'Skill Double Click Delay (s)',Default=ac.GetDoubleClickDelay(),Minimum=0.005,
Maximum=0.1,DisplayMethod='Value',Precision=3,Callback=ad.Wrap(function(aD)ac.
SetDoubleClickDelay(aD)end),onInputComplete=function(aD)ad.SaveNow()af.Notify(
'Path Record',('Saved Double Click Delay = %ss'):format(tostring(aD)),2)end},
'Slider_PR_DoubleClickDelay'))ae.PatchSliderLoadCallback(aA:Slider({Name=
'Start / Finish Pause Time (s)',Default=ac.GetStartPauseTime(),Minimum=0,Maximum
=3,DisplayMethod='Value',Precision=2,Callback=ad.Wrap(function(aD)ac.
SetStartPauseTime(aD)end),onInputComplete=function(aD)ad.SaveNow()af.Notify(
'Path Record',('Saved Start / Finish Pause Time = %ss'):format(tostring(aD)),2)
end},'Slider_PR_StartPauseTime'))aA:Toggle({Name='Aim Skill Q (Buff)',Default=ac
.IsAimSkillQEnabled(),Callback=ad.Wrap(function(aD)ac.SetAimSkillQ(aD)end)},
'Toggle_PR_AimSkillQ')aA:Toggle({Name='Aim Skill E (Attack)',Default=ac.
IsAimSkillEEnabled(),Callback=ad.Wrap(function(aD)ac.SetAimSkillE(aD)end)},
'Toggle_PR_AimSkillE')local aD=ai:Section{Side='Left'}aD:Header{Name=
'Macro Storage'}ao=ae.PatchDropdownRestore(aD:Dropdown{Name='Map Recording',
Options={'None'},Default=1,Required=true,Callback=function(aE)local aF=ac.
GetStatus()if ap then ap(aF)end if aq then aq(aF)end end},false)local aE,aF,aG,
aH,aI,aJ=aD:Button{Name='Delete Selected Map',Callback=ad.Wrap(function()local
aE=ar()if aE and#aE>0 then ac.RemoveMap(aE)end end)},aD:Button{Name=
'Reload Macros (EsclipseHub/DQMacro)',Callback=function()ac.ReloadFromDisk()af.
Notify('Path Record',
'\u{110}\u{e3} qu\u{e9}t v\u{e0} t\u{1ea3}i l\u{1ea1}i c\u{e1}c file macro t\u{1eeb} EsclipseHub/DQMacro/'
,2)end},false,'Clear All Recordings',
"<font color='rgb(255,80,80)'>Confirm Clear All?</font>",3 local aK=function()if
not aG then return end aG=false if clearTimer then task.cancel(clearTimer)
clearTimer=nil end pcall(function()clearBtn:UpdateName(aH)end)end local aM,aN=aD
:Button{Name=aH,Callback=function()if not aG then aG=true if clearTimer then
task.cancel(clearTimer)end clearTimer=task.delay(aJ,aK)pcall(function()clearBtn:
UpdateName(aI)end)return end aK()ac.ClearAll()end},ai:Section{Side='Right'}aN:
Header{Name='Status Monitor & Live HUD'}local aO,aP,aQ,aR,aS,aT=aN:Label{Text=
"State: <font color='rgb(160,160,160)'>Idle</font>"},aN:Label{Text=
"Progress: <font color='rgb(160,160,160)'>-</font>"},aN:Label{Text=
[[Room: <font color='rgb(160,160,160)'>-</font> | Boss: <font color='rgb(160,160,160)'>-</font>]]
},aN:Label{Text="Events: <font color='rgb(160,160,160)'>-</font>"},aN:Label{Text
="Macros: <font color='rgb(160,160,160)'>None</font>"},ai:Section{Side='Right'}
aT:Header{Name='Path 3D Visualizer'}aT:Label{Text=
"Visual t\u{1eeb}ng node \u{111}\u{1b0}\u{1edd}ng \u{111}i: <font color='rgb(255,90,90)'>\u{1f534} \u{110}\u{1ecf} khi Record</font> (real-time) | <font color='rgb(0,255,120)'>\u{1f7e2} Xanh l\u{e1} khi th\u{1b0}\u{1edd}ng</font> (xem / ph\u{e1}t macro)."
}local aU,aV,aW,aX=aT:Toggle({Name='Show Path Nodes (3D Spheres)',Default=ac.
IsVisualEnabled(),Callback=ad.Wrap(function(aU)ac.SetVisualEnabled(aU)end)},
'Toggle_PR_VisualEnabled'),aT:Toggle({Name='Connect Path Lines',Default=ac.
IsVisualShowLinesEnabled(),Callback=ad.Wrap(function(aU)ac.SetVisualShowLines(aU
)end)},'Toggle_PR_VisualShowLines'),aT:Toggle({Name=
'Show Event Spheres & 3D Text',Default=ac.IsVisualShowEventsEnabled(),Callback=
ad.Wrap(function(aU)ac.SetVisualShowEvents(aU)end)},'Toggle_PR_VisualShowEvents'
),aT:Toggle({Name='Show Skill Facing Rays',Default=ac.IsVisualShowFacingEnabled(
),Callback=ad.Wrap(function(aU)ac.SetVisualShowFacing(aU)end)},
'Toggle_PR_VisualShowFacing')ae.PatchSliderLoadCallback(aT:Slider({Name=
'Sphere Node Size',Default=ac.GetVisualNodeRadius(),Minimum=0.1,Maximum=1.2,
DisplayMethod='Value',Precision=2,Callback=ad.Wrap(function(aY)ac.
SetVisualNodeRadius(aY)end),onInputComplete=function(aY)ad.SaveNow()end},
'Slider_PR_VisualNodeRadius'))aT:Toggle({Name='Always On Top (X-Ray)',Default=ac
.IsVisualAlwaysOnTopEnabled(),Callback=ad.Wrap(function(aY)ac.
SetVisualAlwaysOnTop(aY)end)},'Toggle_PR_VisualAlwaysOnTop')local aY=ai:Section{
Side='Right'}aY:Header{Name='Skill Range Visual'}aY:Label{Text=
"V\u{f2}ng tr\u{f2}n quanh nh\u{e2}n v\u{1ead}t gi\u{fa}p \u{1b0}\u{1edb}c l\u{1b0}\u{1ee3}ng <font color='rgb(0,255,200)'>t\u{1ea7}m \u{111}\u{e1}nh / ph\u{1ea1}m vi AOE</font> c\u{1ee7}a skill \u{111}\u{1ec3} c\u{103}n g\u{f3}c v\u{e0} v\u{1ecb} tr\u{ed} x\u{1ea3} chi\u{ea}u khi record."
}local aZ=aY:Toggle({Name='Show Range Circle',Default=ac.IsRangeVisualEnabled(),
Callback=ad.Wrap(function(aZ)ac.SetRangeVisual(aZ)end)},'Toggle_PR_RangeVisual')
ae.PatchSliderLoadCallback(aY:Slider({Name='Skill Range (Studs)',Default=ac.
GetRangeVisualRadius(),Minimum=5,Maximum=120,DisplayMethod='Value',Precision=1,
Callback=ad.Wrap(function(a_)ac.SetRangeVisualRadius(a_)end),onInputComplete=
function(a_)ad.SaveNow()end},'Slider_PR_RangeRadius'))aY:Toggle({Name=
'Fill Circle Area',Default=ac.IsRangeVisualFillEnabled(),Callback=ad.Wrap(
function(a_)ac.SetRangeVisualFill(a_)end)},'Toggle_PR_RangeFill')local a_,a0,a1=
ac.GetRangeColorNames(),ac.GetSelectedCircleColor(),1 for a2,a3 in ipairs(a_)do
if a3==a0 then a1=a2 break end end ae.PatchDropdownRestore(aY:Dropdown({Name=
'Circle Color',Options=a_,Default=a1,Required=true,Callback=ad.Wrap(function(a2)
ac.SetCircleColor(a2)end)},'Dropdown_PR_CircleColor'),false)local a2,a3,a4=aY:
Toggle({Name='Highlight In-Range Enemies (Glow)',Default=ac.
IsHighlightInRangeEnabled(),Callback=ad.Wrap(function(a2)ac.SetHighlightInRange(
a2)end)},'Toggle_PR_HighlightInRange'),ac.GetSelectedHighlightColor(),2 for a5,
a6 in ipairs(a_)do if a6==a3 then a4=a5 break end end ae.PatchDropdownRestore(aY
:Dropdown({Name='Enemy Highlight Color',Options=a_,Default=a4,Required=true,
Callback=ad.Wrap(function(a5)ac.SetHighlightColor(a5)end)},
'Dropdown_PR_HighlightColor'),false)local a5=function(a5)a5=math.clamp(a5 or 0,0
,100)local a6=10 local a7=math.round((a5/100)*a6)local a8=a6-a7 local a9=string.
rep('\u{25a0}',a7)..string.rep('\u{25a1}',a8)return(
"<font color='rgb(0,255,180)'>%s</font> <b>%d%%</b>"):format(a9,a5)end aq=
function(a6)if not an then pcall(function()if as and as.GetState and as:
GetState()~=a6.recording then ak=true as:UpdateState(a6.recording)ak=false end
end)end pcall(function()local a7=ac.IsAutoPlayWanted()if av and av.GetState and
av:GetState()~=a7 then al=true av:UpdateState(a7)al=false end end)pcall(function
()local a7=a6.map local a8=(a7 and#a7>0)and a7 or ar()local a9=a8 and ac.
GetMapMode(a8)=='full'or false if au and au.GetState and au:GetState()~=a9 then
am=true au:UpdateState(a9)am=false end end)pcall(function()if aU and aU.GetState
and aU:GetState()~=ac.IsVisualEnabled()then aU:UpdateState(ac.IsVisualEnabled())
end end)pcall(function()if aV and aV.GetState and aV:GetState()~=ac.
IsVisualShowLinesEnabled()then aV:UpdateState(ac.IsVisualShowLinesEnabled())end
end)pcall(function()if aW and aW.GetState and aW:GetState()~=ac.
IsVisualShowEventsEnabled()then aW:UpdateState(ac.IsVisualShowEventsEnabled())
end end)pcall(function()if aX and aX.GetState and aX:GetState()~=ac.
IsVisualShowFacingEnabled()then aX:UpdateState(ac.IsVisualShowFacingEnabled())
end end)pcall(function()if aZ and aZ.GetState and aZ:GetState()~=ac.
IsRangeVisualEnabled()then aZ:UpdateState(ac.IsRangeVisualEnabled())end end)
pcall(function()if a2 and a2.GetState and a2:GetState()~=ac.
IsHighlightInRangeEnabled()then a2:UpdateState(ac.IsHighlightInRangeEnabled())
end end)end local a6,a7=function(a6)local a7={}for a8,a9 in ipairs(a6)do a7[#a7+
1]=('Map [%s] (%d rooms)'):format(a9.map,a9.roomCount)end if#a7==0 then a7[1]=
'None'end return a7 end local a8=function(a8)local a9=a6(a8)local b=table.
concat(a9,'|')if b==a7 then return end a7=b local ba for bb,bc in pairs(ao:
GetOptions())do if bc then ba=bb break end end pcall(function()ao:ClearOptions()
end)pcall(function()ao:InsertOptions(a9)end)local bb=ba if not bb or not ao:
IsOption(bb)then bb=a9[1]end pcall(function()ao:UpdateSelection(bb)end)end ap=
function(a9)local b,ba=false,a9.map local bb=(ba and#ba>0)and ba or ar()if bb
then b=ac.GetMapMode(bb)=='full'end local bc if a9.recording then bc=
"<font color='rgb(255,90,90)'>Recording...</font>"elseif a9.playing then bc=
"<font color='rgb(0,230,255)'>Playing</font>"elseif a9.resume then bc=
"<font color='rgb(255,200,0)'>Waiting (auto-resume)</font>"elseif a9.
autoPlayWanted then if a9.inLobby then bc=
"<font color='rgb(100,220,100)'>Armed (Lobby)</font>"elseif not a9.map or#a9.map
==0 then bc="<font color='rgb(100,220,100)'>Armed (Loading...)</font>"elseif a9.
boss and not b then bc=
"<font color='rgb(255,160,50)'>Waiting (Boss Room)</font>"else bc=
[[<font color='rgb(100,220,100)'>Armed (Waiting for Room)</font>]]end else bc=
"<font color='rgb(160,160,160)'>Idle</font>"end pcall(function()aO:UpdateName(
'State: '..bc)end)if a9.playing then local bd,be=a5(a9.progressPercent),(
'(%.1f / %.1f studs)'):format(a9.progressStuds or 0,a9.totalStuds or 0)pcall(
function()aP:UpdateName('Progress: '..bd..' '..be)end)elseif a9.recording then
pcall(function()aP:UpdateName(
[[Progress: <font color='rgb(255,90,90)'>Recording Segment...</font> (]]..
tostring(a9.pointCount or 0)..' pts)')end)else pcall(function()aP:UpdateName
"Progress: <font color='rgb(160,160,160)'>-</font>"end)end local bd,be=b and
"<font color='rgb(255,140,255)'>FULL</font>"or
"<font color='rgb(120,200,255)'>NORMAL</font>",bb and(' (map ['..bb..'])')or
' (theo map)'pcall(function()at:UpdateName('Record Mode'..be..': '..bd)end)local
bf if a9.boss then if b then bf=
"<font color='rgb(255,140,255)'>YES (FULL path)</font>"else bf=
"<font color='rgb(255,80,80)'>YES (d\u{f9}ng Hazard Scanner)</font>"end else bf=
"<font color='rgb(0,255,120)'>No</font>"end local bg,bh=a9.room and a9.room>0
and("<font color='rgb(0,255,255)'>room %d</font>"):format(a9.room)or
"<font color='rgb(160,160,160)'>-</font>",a9.map and#a9.map>0 and(
"<font color='rgb(150,255,150)'>%s</font>"):format(a9.map)or
"<font color='rgb(160,160,160)'>-</font>"pcall(function()aQ:UpdateName('Map: '..
bh..' | Room: '..bg..' | Boss: '..bf)end)if a9.recording then local bi=a9.phase
or 1 pcall(function()aR:UpdateName((
[[Events: <font color='rgb(255,170,60)'>%d pts</font> | <font color='rgb(255,90,220)'>%d skills</font> | <font color='rgb(255,215,0)'>%d pauses</font> (Phase %d)]]
):format(a9.pointCount or 0,a9.skillCount or 0,a9.dwellCount or 0,bi))end)elseif
a9.playing then local bi=a9.phase or 1 pcall(function()aR:UpdateName((
"Playing: <font color='rgb(0,230,255)'>Phase %d</font>"):format(bi))end)else
pcall(function()aR:UpdateName"Events: <font color='rgb(160,160,160)'>-</font>"
end)end local bi=ac.GetMaps()if#bi==0 then pcall(function()aS:UpdateName
"Macros: <font color='rgb(160,160,160)'>None</font>"end)else local bk={}for bl,
bm in ipairs(bi)do local bn,bo=bm.bossCount and bm.bossCount>0 and('+%db'):
format(bm.bossCount)or'',bm.phaseCount and bm.phaseCount>bm.roomCount and(
'/%dph'):format(bm.phaseCount)or''bk[#bk+1]=('%s(%dr%s/%dp%s)'):format(bm.map,bm
.roomCount,bo,bm.pointCount,bn)end pcall(function()aS:UpdateName(
"Macros: <font color='rgb(150,255,150)'>"..table.concat(bk,', ')..'</font>')end)
end a8(bi)end local a9,b=ac.OnStatusChanged(function(a9)ap(a9)aq(a9)end),0 local
ba=ag.Heartbeat:Connect(function()local ba=os.clock()if ba-b<0.35 then return
end b=ba local bb=ac.GetStatus()ap(bb)aq(bb)end)ab.Register(function()if ba then
ba:Disconnect()ba=nil end if a9 then a9()a9=nil end end)ap(ac.GetStatus())aq(ac.
GetStatus())end end function a.ak()local aa,ab,ac,ad,ae,af=a.load'b',a.load'e',{
},{'armorMain','weaponMain'},10,{warrior={className='Warrior',primaryStat=
'physicalDamage'},mage={className='Mage',primaryStat='spellPower'},guardian={
className='Guardian',primaryStat='health'}}local ag,ah=function(ag)if not ag
then return nil,nil end local ah=string.lower(ag)for ai,aj in pairs(af)do if
string.find(ah,ai)then return aj.className,aj.primaryStat end end return nil,nil
end,function(ag)if not ag then return nil end local ah=string.match(ag,
'^%s*([%d,.-]+)')if not ah then return nil end local ai=string.gsub(ah,',','')
return tonumber(ai)end local ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax=
function(ai)if not ai then return 0,0 end local aj=string.gsub(ai,',','')local
ak,al=string.match(aj,'(%d+)%s*/%s*(%d+)')if ak and al then return tonumber(ak)
or 0,tonumber(al)or 0 end local am=ah(aj)return 0,am or 0 end,function(ai)if not
ai then return''end local aj=string.match(ai,'^([^\n\r]+)')local ak=aj or ai
local al=string.match(ak,'^(.-)%s*[%(\\[]')if al and al~=''then return string.
gsub(al,'%s+$','')end return string.gsub(ak,'%s+$','')end,function(ai)if not ai
then return false end if string.find(ai,'[\n\r]%s*[%(\\[].-[%)\\]]')then return
true end return string.find(ai,'%s*[%(\\[].-[%)\\]]%s*$')~=nil end,true,{},'',
false,{},{},{},{},{},{}local ay=function(ay)local az=ap[ay]if az and ay and ay.
Parent then ao=true pcall(function()ay.Text=az.text end)ao=false end ap[ay]=nil
end local az,aA=function()for az,aA in pairs(ap)do ay(az)end table.clear(ap)end,
function(az,aA)local aD,aE=string.lower(aA),az:FindFirstChild(aA)if aE then if
aE:IsA'TextLabel'then return aE elseif aE:IsA'GuiObject'then for aF,aG in ipairs
{'valueText','ValueText','value','Value','amount','Amount','text','label'}do
local aH=aE:FindFirstChild(aG)if aH and aH:IsA'TextLabel'then return aH end end
local aF=aE:FindFirstChildOfClass'TextLabel'if aF then return aF end end end for
aF,aG in ipairs(az:GetDescendants())do if aG:IsA'TextLabel'then local aH=string.
lower(aG.Name)if aH==aD then return aG end if(aH=='valuetext'or aH=='value'or aH
=='amount')and aG.Parent then local aI=string.lower(aG.Parent.Name)if string.
find(aI,aD)then return aG end end end end if aD=='upgrades'then for aF,aG in
ipairs(az:GetDescendants())do if aG:IsA'TextLabel'and not string.find(string.
lower(aG.Name),'title')then if string.find(aG.Text,'%d+%s*/%s*%d+')then return
aG end end end end return nil end local aD=function(aD)if not al then return end
if not aD or not aD:IsA'GuiObject'or not aD.Visible then return end local aE=aD.
Parent if aE and aE:IsA'GuiObject'and not aE.Visible then return end if ao then
return end local aF,aG=aD.Name,{}local aH={aF}for aI,aJ in ipairs(aD:
GetDescendants())do local aK=string.lower(aJ.Name)if not string.find(aK,'title')
then if aJ:IsA'TextLabel'then local aM,aN=(aJ.Parent~=aD and aJ.Parent.Name..'/'
..aJ.Name)or aJ.Name,aj(aJ.Text)table.insert(aG,{name=aJ.Name,value=aN,kind=
'TextLabel',path=aM,instance=aJ})table.insert(aH,aM..'='..aN)elseif aJ:IsA
'ValueBase'then local aM,aN=tostring(aJ.Value),(aJ.Parent~=aD and aJ.Parent.Name
..'/'..aJ.Name)or aJ.Name table.insert(aG,{name=aJ.Name,value=aM,kind=
'ValueBase',path=aN})table.insert(aH,aN..'='..aM)end end end local aI=aA(aD,
'name')local aJ=(aI and aj(aI.Text))or nil if not aJ then for aK,aM in ipairs(aG
)do if string.lower(aM.name)=='name'then aJ=aM.value break end end end local aK=
aA(aD,'upgrades')local aM=(aK and aj(aK.Text))or nil if not aM then for aN,aO in
ipairs(aG)do if string.lower(aO.name)=='upgrades'or string.find(aO.value,
'%d+%s*/%s*%d+')then aM=aO.value break end end end local aN,aO,aP=aA(aD,
'physicalDamage')or aA(aD,'physicalPower'),aA(aD,'spellPower'),aA(aD,'health')
local aQ,aR,aS,aT,aU,aV=aN and ah(aj(aN.Text)),aO and ah(aj(aO.Text)),aP and ah(
aj(aP.Text))if aF=='weaponMain'then if(aR or 0)>(aQ or 0)then aT='Mage'aU=
'spellPower'aV=aO else aT='Warrior'aU='physicalDamage'aV=aN end else aT,aU=ag(aJ
)if aT=='Warrior'then aV=aN elseif aT=='Mage'then aV=aO elseif aT=='Guardian'
then aV=aP else if(aS or 0)>10000 and(aS or 0)>((aQ or 0)*10)then aT='Guardian'
aU='health'aV=aP elseif(aR or 0)>(aQ or 0)then aT='Mage'aU='spellPower'aV=aO
else aT='Warrior'aU='physicalDamage'aV=aN end end end local aW,aX=ai(aM)local aY
=math.max(0,aX-aW)if aV and aV:IsA'TextLabel'and aX>0 then local aZ=aj(aV.Text)
local a_=ah(aZ)if a_ then local a0=a_+(aY*ae)local a1=string.format('%s\n(%s)',
aZ,tostring(a0))for a2,a3 in ipairs(aG)do if a3.instance==aV or a3.name==aU then
a3.isPrimaryStat=true a3.calculatedTotal=a0 a3.remainingUpgrades=aY a3.
curUpgrades=aW a3.maxUpgrades=aX end end table.insert(aH,'calc='..tostring(a0))
if aV.Text~=a1 then if not ap[aV]then ap[aV]={text=aV.Text}end ao=true pcall(
function()aV.Text=a1 aV.ClipsDescendants=false end)ao=false end end end local aZ
={name=1,levelReq=2,physicalDamage=3,spellPower=4,health=5,upgrades=6,sellPrice=
7,description=8}table.sort(aG,function(a_,a0)local a1,a2=aZ[a_.name]or 99,aZ[a0.
name]or 99 if a1~=a2 then return a1<a2 end return a_.path<a0.path end)local a_=
table.concat(aH,'|')if a_~=an then an=a_ aw=aF am=aG ax=aT for a0,a1 in ipairs(
au)do pcall(a1,aw,am,ax)end end end local aE=function(aE,aF)if as[aF]then return
end as[aF]=true local aG=aF:GetPropertyChangedSignal'Text':Connect(function()if
not al or ao then return end if aE.Visible and not ak(aF.Text)then aD(aE)end end
)table.insert(aq,aG)end local aF=function(aF)if ar[aF]then return end ar[aF]=
true local aG=aF:GetPropertyChangedSignal'Visible':Connect(function()if not al
then return end if aF.Visible then aD(aF)else az()an=''aw=nil am={}ax=nil for aG
,aH in ipairs(au)do pcall(aH,nil,{},nil)end end end)table.insert(aq,aG)for aH,aI
in ipairs(aF:GetDescendants())do if aI:IsA'TextLabel'then aE(aF,aI)end end local
aH=aF.DescendantAdded:Connect(function(aH)if aH:IsA'TextLabel'then aE(aF,aH)if
aF.Visible then task.defer(function()aD(aF)end)end end end)table.insert(aq,aH)if
aF.Visible then task.defer(function()aD(aF)end)end end local aG,aH=function()
local aG=ab.player or ab.Players.LocalPlayer if not aG then return end local aH=
aG:FindFirstChild'PlayerGui'if not aH then return end local aI=aH:FindFirstChild
'inventory'if not aI then return end local aJ=aI:FindFirstChild'itemStatFrame'if
not aJ then return end local aK=aJ:GetPropertyChangedSignal'Visible':Connect(
function()if not al then return end if not aJ.Visible then az()if aw~=nil then
aw=nil am={}ax=nil an=''for aK,aM in ipairs(au)do pcall(aM,nil,{},nil)end end
end end)table.insert(aq,aK)for aM,aN in ipairs(ad)do local aO=aJ:FindFirstChild(
aN)if aO and aO:IsA'GuiObject'then aF(aO)if aO.Visible and aJ.Visible then aD(aO
)end end end end,function()if av then task.cancel(av)av=nil end for aG,aH in
ipairs(aq)do pcall(function()aH:Disconnect()end)end table.clear(aq)table.clear(
ar)table.clear(as)az()aw=nil am={}ax=nil an=''for aG,aH in ipairs(au)do pcall(aH
,nil,{},nil)end end local aI=function()if av then return end aG()av=task.spawn(
function()while al do task.wait(1.5)if not al then break end local aI,aJ=false,
ab.player or ab.Players.LocalPlayer if aJ then local aK=aJ:FindFirstChild
'PlayerGui'local aM=aK and aK:FindFirstChild'inventory'local aN=aM and aM:
FindFirstChild'itemStatFrame'if aN and aN.Visible then for aO,aP in ipairs(ad)do
local aQ=aN:FindFirstChild(aP)if aQ and aQ:IsA'GuiObject'then if not ar[aQ]then
aF(aQ)end if aQ.Visible then aI=true aD(aQ)end end end end end if not aI and
next(ap)~=nil then az()if aw~=nil then aw=nil am={}ax=nil an=''for aK,aM in
ipairs(au)do pcall(aM,nil,{},nil)end end end end av=nil end)end function ac.
IsEnabled()return al end function ac.GetActiveInspector()return aw,am,ax end
function ac.SetEnabled(aJ)local aK=aJ and true or false if al==aK then return
end al=aK if al then aI()else aH()end for aM,aN in ipairs(at)do pcall(aN,al)end
end function ac.OnChanged(aJ)if type(aJ)=='function'then table.insert(at,aJ)end
end function ac.OnInspectorChanged(aJ)if type(aJ)=='function'then table.insert(
au,aJ)end end function ac.GetActiveFrame()local aJ for aK,aM in ipairs(am)do if
aM.name=='name'and aM.value~=''then aJ=aM.value break end end return aw,aJ end
function ac.OnFrameChanged(aJ)if type(aJ)=='function'then table.insert(au,
function(aK,aM,aN)local aO for aP,aQ in ipairs(aM)do if aQ.name=='name'and aQ.
value~=''then aO=aQ.value break end end pcall(aJ,aK,aO)end)end end function ac.
Init()if not al then al=true end aI()end aa.Register(function()al=false aH()
table.clear(at)table.clear(au)end)aI()return ac end function a.al()local aa=
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
local as,at,au,av,aw,ax,ay,az,aA,aD,aE,aF,aG,aH,aI,aJ,aK,aM,aN,aO,aP,aQ,aR,aS,aT
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
fromRGB(215,125,255)}},{},false,{},{},{},{},{},{}local aU,aV=function(aU)local
aV={}if type(aU)~='table'then return aV end for aW,aX in pairs(aU)do if type(aX)
=='table'then local aY=aA[aW]or aW for aZ,a_ in pairs(aX)do local a0=tostring(aZ
)aV[a0]=a_ local a1=string.match(a0,'_(%d+)$')if a1 then aV[aW..'_'..a1]=a_ aV[
aY..'_'..a1]=a_ local a2=string.match(a0,'^(.-)_')if a2 then aV[a2..'_'..a1]=a_
end end end end end return aV end,function(aU)local aV=os.clock()if not aU and
aP and(aV-av)<aw then return aP end if aP and(aV-av)<ax then return aP end if(aV
-av)<3 then return aP end if ay then return aP end ay=true local aW,aX=pcall(
function()local aW=ab.ReplicatedStorage or game:GetService'ReplicatedStorage'
local aX=aW and aW:FindFirstChild'remotes'if not aX then return nil end local aY
=aX:FindFirstChild'reloadInvy'if not aY or not aY:IsA'RemoteFunction'then return
nil end return aY:InvokeServer()end)ay=false av=os.clock()if aW and aX then if
type(aX)=='table'and aX['1']and type(aX['1'])=='table'then aP=aX['1']else aP=aX
end aQ=nil return aP end return aP end local aW=function(aW,aX,aY)if not aW or
type(aW)~='table'then return nil end if not aQ then aQ=aU(aW)end return aQ[aX..
'_'..aY]end local aX,aY=function(aX,aY,aZ)if not aX:IsA'GuiObject'then return
nil end local a_=aX:FindFirstChild'itemType'if not a_ then return nil end local
a0,a1,a2=tostring(a_.Value or''),'',a_:FindFirstChild'uniqueItemNum'if a2 then
a1=tostring(a2.Value or'')end local a3,a4,a5,a6,a7,a8,a9,b=aW(aY,a0,a1),
tonumber(aX.Name)or aZ,0,0,0,0,0,''if a3 and type(a3)=='table'then a5=tonumber(
a3.physicalDamage or a3.physicalPower or 0)or 0 a6=tonumber(a3.spellPower or 0)
or 0 a7=tonumber(a3.health or 0)or 0 local ba=string.lower(tostring(a3.rarity or
'common'))a8=az[ba]or 0 a9=tonumber(a3.levelReq or 0)or 0 b=tostring(a3.name or
'')end return{slot=aX,originalOrder=a4,category=string.lower(a0),physical=a5,
spell=a6,health=a7,rarityScore=a8,levelReq=a9,name=b}end,function(aX)local aY=
string.lower(aX)if aY=='weapon'or aY=='weapons'then return 1 elseif aY=='chest'
or aY=='chests'or aY=='helmet'or aY=='helmets'or aY=='armor'then return 2 elseif
aY=='ability'or aY=='abilities'then return 3 end return 4 end local aZ,a_,a0=
function(aZ,a_)if ai=='None'and not ak then return aZ.originalOrder<a_.
originalOrder end if ak then local a0,a1=(aZ.category=='ability'or aZ.category==
'abilities'),(a_.category=='ability'or a_.category=='abilities')if a0~=a1 then
return a0 end local a2=(ai~='Ascending')if a0 and a1 then if aZ.levelReq~=a_.
levelReq then if a2 then return aZ.levelReq>a_.levelReq else return aZ.levelReq<
a_.levelReq end end if aZ.rarityScore~=a_.rarityScore then if a2 then return aZ.
rarityScore>a_.rarityScore else return aZ.rarityScore<a_.rarityScore end end if
aZ.name~=a_.name then return aZ.name<a_.name end return aZ.originalOrder<a_.
originalOrder end local a3,a4=aY(aZ.category),aY(a_.category)if a3~=a4 then
return a3<a4 end if aZ.levelReq~=a_.levelReq then if a2 then return aZ.levelReq>
a_.levelReq else return aZ.levelReq<a_.levelReq end end if aZ.name~=a_.name then
return aZ.name<a_.name end return aZ.originalOrder<a_.originalOrder end local a0
,a1,a2=(ai=='Descending'),aY(aZ.category),aY(a_.category)if a1~=a2 then return
a1<a2 end if a1==3 then if aZ.levelReq~=a_.levelReq then if a0 then return aZ.
levelReq>a_.levelReq else return aZ.levelReq<a_.levelReq end end if aZ.
rarityScore~=a_.rarityScore then if a0 then return aZ.rarityScore>a_.rarityScore
else return aZ.rarityScore<a_.rarityScore end end if aZ.name~=a_.name then
return aZ.name<a_.name end return aZ.originalOrder<a_.originalOrder end if ao~=
nil then local a3,a4=0,0 if ao=='Physical Damage'then a3=aZ.physical a4=a_.
physical elseif ao=='Spell Power'then a3=aZ.spell a4=a_.spell elseif ao==
'Health'then a3=aZ.health a4=a_.health end if a3~=a4 then if a0 then return a3>
a4 else return a3<a4 end end end if aj then if aZ.rarityScore~=a_.rarityScore
then if a0 then return aZ.rarityScore>a_.rarityScore else return aZ.rarityScore<
a_.rarityScore end end end if ao==nil and not aj then local a3,a4=math.max(aZ.
physical,aZ.spell,aZ.health),math.max(a_.physical,a_.spell,a_.health)if a3~=a4
then if a0 then return a3>a4 else return a3<a4 end end end if aZ.levelReq~=a_.
levelReq then if a0 then return aZ.levelReq>a_.levelReq else return aZ.levelReq<
a_.levelReq end end if aj then local a3,a4=math.max(aZ.physical,aZ.spell,aZ.
health),math.max(a_.physical,a_.spell,a_.health)if a3~=a4 then if a0 then return
a3>a4 else return a3<a4 end end end if ao~=nil then local a3,a4=math.max(aZ.
physical,aZ.spell,aZ.health),math.max(a_.physical,a_.spell,a_.health)if a3~=a4
then return a3>a4 end end if aZ.name~=a_.name then return aZ.name<a_.name end if
aZ.category~=a_.category then local a3,a4=(aZ.category=='chest'or aZ.category==
'chests'),(a_.category=='chest'or a_.category=='chests')if a3~=a4 then return a3
end end return aZ.originalOrder<a_.originalOrder end,function()local aZ=ab.
player or ab.Players.LocalPlayer if not aZ then return nil,nil end local a_=aZ:
FindFirstChild'PlayerGui'if not a_ then return nil,nil end local a0=a_:
FindFirstChild'inventory'if not a0 then return nil,nil end local a1=a0:
FindFirstChild'mainBackground'if not a1 or not a1.Visible then return nil,nil
end local a2=a1:FindFirstChild'innerBackground'if not a2 then return nil,nil end
local a3=a2:FindFirstChild'rightSideFrame'if not a3 then return nil,nil end
local a4=a3:FindFirstChild'ScrollingFrame'if not a4 or not a4:IsA
'ScrollingFrame'then return nil,nil end local a5=a4:FindFirstChildOfClass
'UIGridLayout'return a4,a5 end function ah.RequestSort(a1)if not al then return
end if ai=='None'and not ak then return end if a0 then task.cancel(a0)a0=nil end
local a2=a1 or 0.15 a0=task.delay(a2,function()a0=nil ah.ApplySort()end)end
function ah.ApplySort()if aH then return end local a1,a2=a_()if not a1 then
return end aH=true local a3,a4=pcall(function()if a2 and a2.SortOrder~=Enum.
SortOrder.LayoutOrder then a2.SortOrder=Enum.SortOrder.LayoutOrder end local a3,
a4,a5=aV(),{},0 for a6,a7 in ipairs(a1:GetChildren())do if a7:IsA'GuiObject'and
a7.Name~='UIGridLayout'then a5=a5+1 local a8=aX(a7,a3,a5)if a8 then table.
insert(a4,a8)end end end if#a4==0 then return end table.sort(a4,function(a6,a7)
return aZ(a6,a7)end)for a6,a7 in ipairs(a4)do if a7.slot.LayoutOrder~=a6 then a7
.slot.LayoutOrder=a6 end end end)aH=false if not a3 and a4 then warn(
'[InventorySort] L\u{1ed7}i khi s\u{1eaf}p x\u{1ebf}p kho \u{111}\u{1ed3}:',a4)
end end local a1=function(a1,a2,a3)local a4,a5=aE[a2]or aE.Inactive,aF[a1.Name]
local a6,a7,a8,a9,b,ba=a4.BackgroundTransparency,a4.BackgroundColor3,a4.
ElementTransparency,a4.ElementColor3,a4.StrokeTransparency,a4.StrokeColor3 if a2
=='Active'and a5 then a6=0.12 a7=a5.ActiveBg b=0 ba=a5.ActiveStroke elseif a2==
'ActiveHovered'and a5 then a6=0.05 a7=a5.ActiveHoverBg b=0 ba=a5.
ActiveHoverStroke end local bb=TweenInfo.new(aE.TweenDuration,aE.EasingStyle,aE.
EasingDirection)pcall(function()if a3 then af:Create(a1,bb,{
BackgroundTransparency=a6,BackgroundColor3=a7}):Play()else a1.
BackgroundTransparency=a6 a1.BackgroundColor3=a7 end end)for bc,bd in ipairs(a1:
GetDescendants())do pcall(function()if bd:IsA'ImageLabel'or bd:IsA'ImageButton'
then if a3 then af:Create(bd,bb,{ImageTransparency=a8,ImageColor3=a9}):Play()
else bd.ImageTransparency=a8 bd.ImageColor3=a9 end elseif bd:IsA'TextLabel'or bd
:IsA'TextButton'then if a3 then af:Create(bd,bb,{TextTransparency=a8,TextColor3=
a9}):Play()else bd.TextTransparency=a8 bd.TextColor3=a9 end elseif bd:IsA
'UIStroke'then if a3 then af:Create(bd,bb,{Transparency=b,Color=ba}):Play()else
bd.Transparency=b bd.Color=ba end end end)end end local a2=function(a2,a3)if not
a2 or not a2.Parent then return end local a4=(aI[a2]==true)if a2.Name==
'IBmainFilter'then local a5,a6=(ai~='None'),aD[ai]or aD.None if a5 then a1(a2,a4
and'ActiveHovered'or'Active',a3)else a1(a2,a4 and'Hovered'or'Inactive',a3)end
for a7,a8 in ipairs(a2:GetDescendants())do if a8:IsA'ImageLabel'then if a8.Image
~=a6 then a8.Image=a6 end a8.Rotation=0 end end elseif a2.Name=='IBrarity'then
local a5=(aj==true)if a5 then a1(a2,a4 and'ActiveHovered'or'Active',a3)else a1(
a2,a4 and'Hovered'or'Inactive',a3)end elseif a2.Name=='IBphysic'then local a5=(
ao=='Physical Damage')if a5 then a1(a2,a4 and'ActiveHovered'or'Active',a3)else
a1(a2,a4 and'Hovered'or'Inactive',a3)end elseif a2.Name=='IBspell'then local a5=
(ao=='Spell Power')if a5 then a1(a2,a4 and'ActiveHovered'or'Active',a3)else a1(
a2,a4 and'Hovered'or'Inactive',a3)end elseif a2.Name=='IBhealth'then local a5=(
ao=='Health')if a5 then a1(a2,a4 and'ActiveHovered'or'Active',a3)else a1(a2,a4
and'Hovered'or'Inactive',a3)end elseif a2.Name=='IBability'then local a5=(ak==
true)if a5 then a1(a2,a4 and'ActiveHovered'or'Active',a3)else a1(a2,a4 and
'Hovered'or'Inactive',a3)end end end local a3,a4=function(a3)for a4,a5 in
ipairs(aM)do a2(a5,a3)end end,false local a5=function()if a4 then return end a4=
true local a5,a6=ah.GetSortCriteria(),ah.GetSortDirection()for a7,a8 in ipairs(
aN)do pcall(a8,a5)end for a7,a8 in ipairs(aO)do pcall(a8,a6)end a4=false end
local a6=function(a6)if aJ[a6]then return end aJ[a6]=true table.insert(aM,a6)if
a6:IsA'ImageButton'or a6:IsA'TextButton'then a6.AutoButtonColor=false end if not
a6:FindFirstChildOfClass'UICorner'then local a7=Instance.new'UICorner'a7.
CornerRadius=UDim.new(0,6)a7.Parent=a6 end if not a6:FindFirstChildOfClass
'UIStroke'then local a7=Instance.new'UIStroke'a7.Thickness=1.2 a7.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border a7.Transparency=aE.Inactive.
StrokeTransparency a7.Color=aE.Inactive.StrokeColor3 a7.Parent=a6 end if not a6:
FindFirstChildOfClass'UIPadding'then local a7=Instance.new'UIPadding'a7.
PaddingTop=UDim.new(0,7)a7.PaddingBottom=UDim.new(0,7)a7.PaddingLeft=UDim.new(0,
7)a7.PaddingRight=UDim.new(0,7)a7.Parent=a6 end for a7,a8 in ipairs(a6:
GetChildren())do if a8:IsA'ImageLabel'then a8.AnchorPoint=Vector2.new(0.5,0.5)a8
.Position=UDim2.new(0.5,0,0.5,0)a8.Size=UDim2.new(1,0,1,0)a8.ScaleType=Enum.
ScaleType.Fit elseif a8:IsA'UIListLayout'then a8:Destroy()end end aI[a6]=false
local a7=a6.MouseEnter:Connect(function()aI[a6]=true a2(a6,true)end)table.
insert(aG,a7)local a8=a6.MouseLeave:Connect(function()aI[a6]=false a2(a6,true)
end)table.insert(aG,a8)if a6:IsA'GuiButton'then local a9=a6.Activated:Connect(
function()if a6.Name=='IBmainFilter'then if ai=='None'then ai='Descending'ac.
Notify('Main Filter','Gi\u{1ea3}m d\u{1ea7}n (Power cao -> th\u{1ea5}p)',1.5)
elseif ai=='Descending'then ai='Ascending'ac.Notify('Main Filter',
'T\u{103}ng d\u{1ea7}n (Power th\u{1ea5}p -> cao)',1.5)else ai='None'ac.Notify(
'Main Filter',
'B\u{1ecf} ch\u{1ecd}n (Kh\u{f4}i ph\u{1ee5}c kho \u{111}\u{1ed3} m\u{1eb7}c \u{111}\u{1ecb}nh)'
,1.5)end a3(true)a5()if al then ah.RequestSort(0.05)end at()elseif a6.Name==
'IBrarity'then aj=not aj if aj then ao=nil ak=false if ai=='None'then ai=
'Descending'end ac.Notify('Filter',
'Ch\u{1ebf} \u{111}\u{1ed9}: \u{110}\u{1ed9} hi\u{1ebf}m (Rarity)',1.5)else ac.
Notify('Filter','T\u{1eaf}t l\u{1ecd}c \u{110}\u{1ed9} hi\u{1ebf}m',1.5)end a3(
true)a5()if al then ah.RequestSort(0.05)end at()elseif a6.Name=='IBphysic'or a6.
Name=='IBspell'or a6.Name=='IBhealth'then local a9=(a6.Name=='IBphysic'and
'Physical Damage')or(a6.Name=='IBspell'and'Spell Power')or'Health'if ao==a9 then
ao=nil ac.Notify('Filter','B\u{1ecf} ch\u{1ecd}n '..a9,1.5)else ao=a9 aj=false
ak=false if ai=='None'then ai='Descending'end ac.Notify('Filter',
'Ch\u{1ecd}n ch\u{1ec9} s\u{1ed1}: '..a9,1.5)end a3(true)a5()if al then ah.
RequestSort(0.05)end at()elseif a6.Name=='IBability'then ak=not ak if ak then aj
=false ao=nil if ai=='None'then ai='Descending'end ac.Notify('Filter',
'S\u{1eaf}p x\u{1ebf}p: K\u{1ef9} n\u{103}ng (Ability)',1.5)else ac.Notify(
'Filter','B\u{1ecf} ch\u{1ecd}n K\u{1ef9} n\u{103}ng',1.5)end a3(true)a5()if al
then ah.RequestSort(0.05)end at()end end)table.insert(aG,a9)end a2(a6,false)end
function aT(a7)if aK[a7]then return end aK[a7]=true pcall(function()a7.
BackgroundColor3=Color3.fromRGB(18,20,26)a7.BackgroundTransparency=0.15 a7.
BorderSizePixel=0 if not a7:FindFirstChildOfClass'UICorner'then local a8=
Instance.new'UICorner'a8.CornerRadius=UDim.new(0,8)a8.Parent=a7 end local a8=a7:
FindFirstChild'DockStroke'or a7:FindFirstChildOfClass'UIStroke'if not a8 then a8
=Instance.new'UIStroke'a8.Name='DockStroke'a8.Thickness=1.2 a8.Color=Color3.
fromRGB(65,72,90)a8.Transparency=0.3 a8.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border a8.Parent=a7 end if not a7:FindFirstChildOfClass'UIPadding'then local a9=
Instance.new'UIPadding'a9.PaddingTop=UDim.new(0,5)a9.PaddingBottom=UDim.new(0,5)
a9.PaddingLeft=UDim.new(0,5)a9.PaddingRight=UDim.new(0,5)a9.Parent=a7 end end)
local a8=a7:FindFirstChildOfClass'UIListLayout'if a8 then a8.Padding=UDim.new(0,
6)end local a9={IBmainFilter=true,IBrarity=true,IBphysic=true,IBspell=true,
IBhealth=true,IBability=true}for b,ba in ipairs(a7:GetChildren())do if ba:IsA
'GuiObject'and a9[ba.Name]then a6(ba)end end local b=a7.ChildAdded:Connect(
function(b)if b:IsA'GuiObject'and a9[b.Name]then a6(b)end end)table.insert(aG,b)
au(a7)a3(false)end function aS()local a7=ab.player or ab.Players.LocalPlayer if
not a7 then return nil end local a8=a7:FindFirstChild'PlayerGui'if not a8 then
return nil end local a9=a8:FindFirstChild'inventory'if not a9 then return nil
end local b=a9:FindFirstChild'mainBackground'if not b then return nil end local
ba=b:FindFirstChild'innerBackground'if not ba then return nil end if ba:IsA
'GuiObject'then ba.ClipsDescendants=false end if b:IsA'GuiObject'then b.
ClipsDescendants=false end local bb=(ba:FindFirstChild'sortBarFrame')if not bb
and typeof(ad)=='function'then local bc,bd=pcall(ad,ba)if bc and bd then bb=bd
aR=bd end end if bb and typeof(aT)=='function'and not aK[bb]then aT(bb)end
return bb end function ah.GetScale()return am end function ah.GetMainFilterMode(
)return ai end function ah.SetMainFilterMode(a7)if ai==a7 then return end ai=a7
a3(true)a5()if al then ah.RequestSort(0.05)end at()end function ah.
IsRarityEnabled()return aj end function ah.SetRarityEnabled(a7)local a8=a7 and
true or false if aj==a8 then return end aj=a8 if aj then ao=nil ak=false if ai==
'None'then ai='Descending'end end a3(true)a5()if al then ah.RequestSort(0.05)end
at()end function ah.GetStatFilter()return ao end function ah.SetStatFilter(a7)if
ao==a7 then return end ao=a7 if ao then aj=false ak=false if ai=='None'then ai=
'Descending'end end a3(true)a5()if al then ah.RequestSort(0.05)end at()end
function ah.IsAbilityEnabled()return ak end function ah.SetAbilityEnabled(a7)
local a8=a7 and true or false if ak==a8 then return end ak=a8 if ak then aj=
false ao=nil if ai=='None'then ai='Descending'end end a3(true)a5()if al then ah.
RequestSort(0.05)end at()end function ah.SetSortCriteria(a7)if not a7 or type(a7
)~='string'then return end local a8=ah.GetSortCriteria()if a7=='None'then if ai
=='None'and not aj and not ao and not ak then return end ai='None'aj=false ao=
nil ak=false elseif a7=='Rarity'then if aj and not ak and ao==nil then return
end aj=true ao=nil ak=false if ai=='None'then ai='Descending'end elseif a7==
'Ability'then if ak then return end ak=true aj=false ao=nil if ai=='None'then ai
='Descending'end elseif a7=='Physical Damage'or a7=='Spell Power'or a7=='Health'
then if ao==a7 and not ak and not aj then return end ao=a7 aj=false ak=false if
ai=='None'then ai='Descending'end elseif a7=='Power'then if ai~='None'and not aj
and ao==nil and not ak then return end if ai=='None'then ai='Descending'end aj=
false ao=nil ak=false else return end if ah.GetSortCriteria()==a8 then return
end a3(true)a5()if al then ah.RequestSort(0.05)end at()end function ah.
GetSortCriteria()if ak then return'Ability'end if aj then return'Rarity'end if
ao then return ao end if ai~='None'then return'Power'end return'None'end
function ah.SetSortDirection(a7)if not a7 or type(a7)~='string'then return end
local a8='None'if a7=='Ascending'or string.find(a7,'Ascending')then a8=
'Ascending'elseif a7=='Descending'or string.find(a7,'Descending')then a8=
'Descending'else a8='None'end if ai==a8 then return end ai=a8 a3(true)a5()if al
then ah.RequestSort(0.05)end at()end function ah.GetSortDirection()if ai==
'Ascending'then return'Ascending'elseif ai=='Descending'then return'Descending'
else return'None'end end function ah.OnCriteriaChanged(a7)if type(a7)==
'function'then table.insert(aN,a7)end end function ah.OnDirectionChanged(a7)if
type(a7)=='function'then table.insert(aO,a7)end end function ah.SetAutoSort(a7)
local a8=a7 and true or false if al==a8 then return end al=a8 at()end function
ah.IsAutoSort()return al end function ah.Init()for a7,a8 in ipairs(aG)do pcall(
function()a8:Disconnect()end)end table.clear(aG)table.clear(aJ)table.clear(aK)
table.clear(aM)table.clear(aI)as()a5()local a7=ab.ReplicatedStorage or game:
GetService'ReplicatedStorage'local a8=a7 and a7:FindFirstChild'remotes'if a8
then local a9=a8:FindFirstChild'reloadInventory'if a9 and a9:IsA'RemoteEvent'
then local b=a9.OnClientEvent:Connect(function()local b=os.clock()if(b-av)>=ax
then aP=nil end ah.RequestSort(0.35)end)table.insert(aG,b)end end local a9=
function()local a9=ab.player or ab.Players.LocalPlayer if not a9 then return end
local b=a9:WaitForChild('PlayerGui',15)if not b then return end local ba=b:
WaitForChild('inventory',15)if not ba then return end local bb=ba:WaitForChild(
'mainBackground',15)if not bb then return end local bc=bb:WaitForChild(
'innerBackground',15)if not bc then return end aS()if bb.Visible and al and(ai~=
'None'or ak)then ah.RequestSort(0.2)end local bd=bb:GetPropertyChangedSignal
'Visible':Connect(function()if bb.Visible then aS()ah.RequestSort(0.15)end end)
table.insert(aG,bd)local be=bc.ChildAdded:Connect(function(be)if be.Name==
'sortBarFrame'and be:IsA'GuiObject'then aT(be)end end)table.insert(aG,be)local
bf=bc:WaitForChild('rightSideFrame',10)local bg=bf and bf:WaitForChild(
'ScrollingFrame',10)if bg then local bh=bg.ChildAdded:Connect(function(bh)if bh:
IsA'GuiObject'and al and(ai~='None'or ak)then ah.RequestSort(0.3)end end)table.
insert(aG,bh)end end task.spawn(a9)local b=ab.player or ab.Players.LocalPlayer
if b then local ba=b.CharacterAdded:Connect(function()task.delay(1,a9)end)table.
insert(aG,ba)end end aa.Register(function()if a0 then task.cancel(a0)a0=nil end
if ap then task.cancel(ap)ap=nil pcall(function()ar()local a7,a8=aq(),{
mainFilterMode=ai,rarityEnabled=aj,selectedStatFilter=ao,abilityEnabled=ak,
autoSortEnabled=al}writefile(a7,ag:JSONEncode(a8))end)end for a7,a8 in ipairs(aG
)do pcall(function()a8:Disconnect()end)end table.clear(aG)table.clear(aJ)table.
clear(aK)table.clear(aM)table.clear(aI)table.clear(aN)table.clear(aO)aP=nil ai=
'None'aj=false ao=nil ak=false if aR and aR.Parent then pcall(function()aR:
Destroy()end)aR=nil end end)ah.Init()return ah end function a.an()return
function(aa)local ab,ac=game:GetService'Players',os.clock()+15 while not ab.
LocalPlayer do if os.clock()>ac then break end task.wait(0.1)end local ad=ab.
LocalPlayer if not ad then return warn
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
load'H',a.load'M',a.load'O',a.load'Z',a.load'ac',a.load'aj'al(ah,ak.Combat)am(ah
,ak.Dungeon)an(ah,ak.Inventory)ao(ah,ak.Utilities)ap(ah,ak.Configs)aq(ah,ak.
PathRecord)local ar=a.load'B'ar.Init()local as=a.load'T'as.Init()a.load'Q'a.load
'ak'a.load'am'local at=a.load'_'at.SetWindow(ah)at.Execute()local au=a.load'X'au
.SetWindow(ah)au.Init()ak.Combat:Select()local av=a.load'g'av.SetLocked(true)ae:
LoadAutoLoadConfig()local aw=function()local aw=ae.Folder..
'/settings/autoload.txt'if isfile and isfile(aw)then local ax,ay=pcall(readfile,
aw)if ax and type(ay)=='string'and#ay>0 then ag.SetActive(ay)end end end aw()
local ax=a.load't'ax.LoadData(ae.contextData)task.delay(0.3,function()av.
SetLocked(false)end)task.delay(1.5,function()ag.Resume()end)end end function a.
ao()local aa={}function aa:Export()local ab={}for ac,ad in pairs(self)do if
typeof(ad)=='Instance'or type(ad)=='table'then local ae,af=pcall(function()end)
if ae and af~=nil then ab[ac]=af end end end return ab end function aa:Import(ab
)for ac,ad in pairs(ab)do local ae=self[ac]if ae and ae.Value~=nil then local af
=pcall(function()end)if not af then warn(`Failed to import value for flag "{ac}"`
)end end end end function aa:Reset()for ab in pairs(self)do self[ab]=nil end end
return aa end function a.ap()local aa,ab=a.load'V',{}function ab:Window(ac)ac=ac
or{}print'Made a window'local ad=aa.Wrap(ac,{Visible=function(ad)print(
'Set window visibility to:',ad)end})return aa.Apply(ac,ad)end return ab end
function a.aq()local aa,ab=a.load'V',{}return(aa.Wrap(ab,{Enabled=function(ac)
print(`{ac and'Enabled'or'Disabled'} ESP.`)end}))end function a.ar()local aa,ab,
ac=a.load'ao',a.load'ap',a.load'aq'local ad=ab:Window{Visible=true}return{Flags=
aa,Esp=ac,Interface=ab,Window=ad,Tabs={Home=function(ae)end,Visuals=function(ae)
end,Settings=function(ae)end,Config=function(ae)end}}end function a.as()local aa
={}function aa.GetPlayer()local ab,ac=pcall(function()return game:GetService
'Players'end)return ab and(ac).LocalPlayer end function aa.GetCharacter(ab)local
ac,ad=pcall(function()return ab and ab.Character end)return ac and ad end
function aa.GetHumanoid(ab)local ac,ad=pcall(function()local ac=aa.GetCharacter(
ab)return ac and ac:FindFirstChildOfClass'Humanoid'end)return ac and ad end
return aa end function a.at()local aa=function(aa)return game:GetService(aa)end
return{Players=(aa'Players')}end function a.au()return function(aa)local ab,ac,
ad=a.load'ar',a.load'as',a.load'at'local ae,af,ag,ah,ai,aj,ak=ab.Flags,ab.Esp,ab
.Interface,ab.Window,ab.Tabs,ac.GetPlayer(),ad.Players do ai.Home(aa)end do
local al=ah:Tab{Name='Exploits'}al:Toggle{Name='Flight'}end do ai.Visuals(aa)end
do local al=ai.Settings(aa)al:Toggle{Name='Dark Mode'}end do ai.Config(aa)end ah
.Title=aa.Name end end end local aa=_G.ScriptHub_Cleanup if typeof(aa)==
'function'then pcall(aa)end _G.ScriptHub_Cleanup=nil local ab=_G.ScriptHub_UI if
typeof(ab)=='table'and typeof(ab.Unload)=='function'then pcall(ab.Unload,ab)end
_G.ScriptHub_UI=nil local ac={{Name='DungeonQuest',Load=a.load'an',UniverseId=
9931749389,Places={77649408247578,3220968688,2414851778}},{Name='Game 2',Load=a.
load'au',Places={123456789,987654321}}}for ad=1,300 do if game.GameId~=0 and
game.PlaceId~=0 then break end task.wait(0.1)end for ad,ae in pairs(ac)do if ae.
Places then for af,ag in ipairs(ae.Places)do if ag==game.PlaceId then return ae:
Load()end end end if ae.UniverseId and ae.UniverseId==game.GameId then return ae
:Load()end end